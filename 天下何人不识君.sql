-- 字符串函数

-- 字符串拼接,将s1,s2,...,sn拼接成一个字符串
concat(s1,s2,...,sn); 

-- 将字符串str全部转换为小写
lower(str);

-- 将字符串全部转换为大写
upper(str);

-- 左填充,用字符串pad对str的左边进行填充,达到n个字符串的长度
lpad(str,n,pad);

-- 右填充,用字符串pad对str的右边进行填充,达到n个字符串的长度
rpad(str,n,pad);

-- 去掉字符串头部和尾部的空格
trim(str);

-- 返回字符串str从start位置起的len个长度的字符串
substring(str,start,len);


-- 数值函数
-- 向上取整
ceil(x);

-- 向下取整
floor(x);

-- 返回x/y的模
mod(x,y);

-- 返回0~1的随机数
rand();

-- 求参数x的四舍五入的值，保留y位小数
round(x,y);


-- 日期函数
-- 返回当前日期
curdate();

-- 返回当前时间
curtime();

-- 返回当前日期和时间
now();

-- 获取指定date的年份
year(date);

-- 获取指定date的月份
month(date);

-- 获取指定date的日期
day(date);

-- 返回一个日期/时间值加上一个时间间隔expr后的时间值
date_add(date,interval expr type);

-- 返回起始时间date1和结束时间date2之间的天数
datediff(date1,date2);


-- 流程函数

-- 如果value为true,则返回t,否则返回f
if(value,t,f);

-- 如果value1不为空,返回value1,否则返回value2
ifnull(value1,value2);

-- 如果val1为true,返回res1,...否则返回default默认值
case when [val1] then [res1]...else [default] end;

-- 如果expr的值等于val1,返回res1,...,否则返回default默认值
case [expr] when [val1] then [res1] ... else [default] end;


-- 约束:作用于标准字段上的规则,用于限制存储在表中的数据,可以在创建表/修改表的时候添加约束。
-- 非空约束:限制该字段的数据不能为null。
Not NULL

-- 唯一约束:保证该字段的所有数据都是唯一、不重复的。
UNIQUE

-- 主键约束:一行数据的唯一标识,要求非空且唯一。
PRIMARY KEY

-- 默认约束:保存数据时,如果未指定该字段的值,则采用默认值。
DEFAULT

-- 检查约束:保证字段值满足某一条件。
CHECK

-- 外键约束:用来让两张表的数据之间建立连接,保证数据的一致性和完整性。
FOREIGN KEY

-- 添加外键
alter table 表名 add constraint 外键名称 foreign key (外键字段名) references 主表(主表列名)
[on update cascade on delete cascade];

-- 删除外键
alter table 表名 drop foreign key 外键名称;

-- 多表查询
-- 内连接:相当于查询A、B交集部分数据
-- 左外连接:查询左表所有数据,以及两张表交集部分数据
-- 右外连接:查询右表所有数据,以及两张表交集部分数据
-- 自连接:当前表与自身的连接查询,自连接必须使用表别名。

-- 联合查询:把多次查询的结果合并起来,形成一个新的查询结果集,不带[all]表示去重。
select 字段列表 from 表a
union[ALL]
select 字段列表 from 表b;
-- 对于联合查询的多张表的列数必须保持一致,字段类型也需要保持一致。
-- union all会将全部的数据直接合并在一起,union会对合并之后的数据去重。

-- 子查询:SQL语句中嵌套select语句,也称之为嵌套查询。
select * from t1 where column1 = (select column1 from t2);

-- 子查询返回列表中,有任意一个满足即可。
any 
-- 与any等同,使用some的地方都可以使用any。
some  
-- 子查询返回列表的所有值都必须满足
all  


-- 事务:一组操作的集合,它是一个不可分割的工作单位,事务会把所有操作作为一个整体一起向系统提交或撤销操作请求，
--      这些操作要么同时成功，要么同时失败。
-- 默认MySQL的事务是自动提交的,也就是说,当执行一条DML语句,MySQL会立即隐式的提交事务。

-- 查看/设置事务提交方式,1为自动提交,0为手动提交。
select -;
set @@autocommit = 0;
-- 提交事务
commit；
-- 回滚事务;
rollback;

-- 开启事务
start transaction /  begin 
-- 提交事务
commit;
-- 回滚事务
rollback;

-- 事务的四大特效
-- 原子性(Atomictity):事务是不可分割的最小操作单元,要么全部成功,要么全部失败。
-- 一致性(Consistency):事务完成时,必须使所有的数据都保持一致状态。
-- 隔离性(Isolation):数据库系统提供的隔离机制,保证事务在不受外部并发操作影响的独立环境下运行。
-- 持久性(Durability):事务一旦提交或回归,它对数据库中的数据的改变是永久的。

-- 并发事务
-- 脏读:一个事务读到另外一个事务还没有提交的事务.
-- 不可重复读:一个事务先后读取同一条记录,但两次读取的数据不同。
-- 幻读:一个事务按照条件查询数据时,没有对应的数据行,但是在插入数据时,又发现这行数据已经存在,好像出现了'幻影'。

-- 查看事务隔离级别
select @@transaction_isolation;

-- 设置事务隔离级别
set session transaction isolation level read uncommitted;

-- 事务的隔离级别越高,数据越安全,但是性能越低。


