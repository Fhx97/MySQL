-- 游标:用来存储查询结果集的数据类型,在存储过程和函数中可以使用游标对结果集进行循环处理。
-- 声明游标
declare 游标名称 cursor for 查询语句;
-- 打开游标
open 游标名称;
-- 获取游标记录
fetch 游标名称 into 变量[,变量];
-- 关闭游标
close 游标名称;


-- 条件处理程序:来定义在流程控制结构执行过程中遇到问题时相应的处理步骤。
declare handler_action handler for condition_value [,condition_value]... statement;

handler_action
	continue:继续执行当前程序
	exit:终止执行当前程序

condition_value
	sqlstate sqlstate_value:状态码,如02000
	sqlwarning:所有以01开头的sqlstate代码简写
	not found:所有以02开头的sqlstate代码简写
	sqlexception:所有没有被sqlwarning或not found 捕获的sqlstate代码的简写;
	

-- 触发器:保证数据完整性、日志记录、数据校验
-- 创建
create trigger trigger_name
before/after insert/update/delete 
on tbl_name for each row --行级触发器
begin 
	trigger_stmt;
end;
-- 查看
show triggers;
-- 删除
drop trigger [schema_name.]trigger_name; --如果没有指定schema_name,默认为当前数据库。


-- 锁:计算机协调多个进程或线程并发访问某一资源的机制。
-- 全局锁:锁定数据库中所有表;一般运用在全库的逻辑备份,保证数据的完整性。
-- 如果在主库上备份,那么备份期间都不能执行更新,业务基本上就得停摆。
-- 如果在从库上备份,那么在备份期间从库不能执行主库同步过来的二进制日志(binlog),会导致主从延迟。
-- 在InnoDB引擎中,可以在备份时加上参数 --single-transaction参数来完成不加锁的一致性数据备份。
flush tables with read lock;

-- 表级锁:每次操作锁住整张表;可分为表锁、元数据锁(meta data lock,MDL)及意向锁。
-- 表锁:表共享读锁(read lock),表独占写锁(with lock)
	-- 加锁:lock tables 表名 read/write。 
	-- 释放锁:unlock tables / 客户端断开连接。
-- 读锁不会阻碍其他客户端的读,但是会阻碍写。写锁既会阻塞其他客户端的读,又会阻塞其他客户端的写。
-- 元数据锁:为了避免DML和DDL冲突,保证读写的准确性。

-- 行级锁:InnoDB的数据是基于索引组织的,行锁是通过对索引上的索引项加锁来实现的,而不是对记录加的锁。
-- 行锁(Record Lock):锁定单个记录的锁,防止其他事务对此进行update和delete;在RC和RR隔离级别下都支持;共享锁(S)和排他锁(X)。
-- 间隙锁(Gap Lock):锁定索引记录间隙(不含该记录),确保索引记录间隙不变,防止其他事务在这个间隙进行insert,产生幻读;在RR隔离级别下都支持。
-- 临键锁(Next-Key Lock):行锁和间隙锁组合,在RR隔离级别下支持。

-- 行级锁:每次操作锁住对应的行数据。


