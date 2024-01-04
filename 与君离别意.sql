-- insert优化

-- 批量插入
insert into 表名(字段列表) values(...),(...),...,(...);

-- 手动事务提交
start transaction;
insert into 表名(字段列表) values(...),(...),...,(...);
insert into 表名(字段列表) values(...),(...),...,(...);
insert into 表名(字段列表) values(...),(...),...,(...);
commit;

-- 主键顺序插入

-- 大批量数据插入
-- 客服端连接服务器时,加上参数 --local-infile
mysql --local-infile -u -root -p 
-- 设置全局参数local_infile为1,开启从本地加载文件导入数据的开关
set global local_infile = 1;
-- 执行load指令将准备好的数据,加载到表结构中
load data local infile '/root/sql.log' into table '表名' fields terminated by ',' lines terminated by '\n';

-- 主键优化
-- 数据组织方式：在InnoDB存储引擎中,表数据都是根据主键顺序组织存放的,这种存储方式的表成为索引组织表(Index organized table IOT)。
-- 页分裂(主键乱序插入情况)：页可以为空,也可以填充一半,也可以填充100%。每个页包含了2-N行数据(如果一行数据多大,会行溢出),根据主键排列。
-- 页合并：当删除一行记录时,实际上记录并没有物理删除,只是记录被标记(flaged)为删除并且它的空间允许被其他记录声明使用。
-- 当页中删除的记录达到MERGE_THRESHOLD(默认为页的50%),InnoDB会开始寻找最靠近的页(前或后)看看是否可以将两个页合并以优化空间使用。
-- MERGE_THRESHOLD：合并页的阈值,可以自己设置,在创建表或者创建索引时指定。

-- count：聚合函数,不是null累计值就加1,否则不加,返回累计值。
-- 按照效率排序：count(字段) < count(主键id) < count(1) ≈ count(*)


-- 视图(View)
-- 视图是一种虚拟存在的表,视图中的数据并不在数据库中实际存在,行和列数据来自定义视图的查询中使用的表,并且在使用时动态生产。
-- 通俗的讲,视图只保存了查询的SQL逻辑,不保存查询结果。所以在创建视图的时候,主要的工作就落在创建这条SQL查询语句上。

-- 创建
create [or replace] view 视图名称[(列名列表)] as select语句 [with | cascaded | local | check option];

-- 查询
-- 查看创建视图语句
show create view 视图名称;
-- 查看视图数据
select * from 视图名称;

-- 修改
create [or replace] view 视图名称[(列名列表)] as select语句 [with | cascaded | local check option];
alter view 视图名称[(列名列表)] as select [with | cascaded | local | check option];

-- 删除
drop view [if exists] 视图名称;

-- 视图的更新
-- 要使视图可更新,视图中的行与基础表中的行之间必须存在一对一的关系。
-- 如果视图包含以下任何一项,则该视图不可更新：聚合函数或窗口函数、distinct、group by、having、union或union all。


-- 存储过程
-- 事先经过编译并存储在数据库中的一段SQL语句的集合,调用存储过程可以简化应用开发人员的很多工作,减少数据在数据库和应用服务器之间的传输,对于提高数据处理的效率是有好处的。
-- 简而言之,存储过程就是数据库SQL语言层面的代码封装。

-- 创建
create procedure 存储过程名称([in/out/inout 参数名 参数类型 | 参数列表])
begin 

  -- SQL语句
  
end;

-- 调用
call 名称([参数]);

-- 查看
-- 查询指定数据库的存储过程及状态信息
select * from information_schema.routines where routine_schema = 'xxx';
-- 查询某个存储过程的定义
show create procedure 存储过程名称;

-- 删除
drop procedure [if exists] 存储过程名称;

-- 在命令行中,执行存储过程的SQL时,需要通过关键字delimiter指定SQL语句的结束符。

-- 变量
-- 系统变量：全局变量(global)、会话变量(session)。@@系统变量
-- 用户定义变量：@用户定义变量
-- 局部变量：需要DECLARE声明,作用范围在声明的begin...end块内。

-- if语句
if 条件1 then ...
elseif 条件2 then ...
else ...
end if;




