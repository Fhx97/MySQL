-- 查询所有数据库
show databases;

-- 查询当前数据库
select database();

-- 创建
create database [if not exists] 数据库名 [default charset字符集][collate 排序规则];

-- 删除
drop database[if exists]数据库名;

-- 使用
use 数据库名;

-- 查询当前数据库所有表
show tables;

-- 查询表结构
desc 表名;

-- 查询指定表的建表结构
show create table 表名

-- DDL(Data Define Language)数据定义语言 
-- 创建表
create table 表名(
	字段1 字段1类型[comment 字段1注释],
	字段2 字段2类型[comment 字段2注释],
	字段3 字段3类型[comment 字段3注释],
	......
	字段n 字段n类型[comment 字段n注释],
)[comment 表注释];

-- 添加字段
alter table 表名 add 字段名 类型 [comment 注释][约束];

-- 修改数据类型
alter table 表名 modify 字段名 新数据类型;

-- 修改字段名和字段类型
alter table 表名 change 旧字段名 新字段名 类型 [comment 注释][约束];

-- 删除字段
alter table 表名 drop 字段名;

-- 修改表名
alter table 表名 rename to 新表名

-- 删除表
drop table [if exists] 表名;

-- 删除指定表,并重新创建该表(留下表结构，数据清除)
truncate table 表名;


-- DML(Data Manipulation Language) 数据操作语言 用于对数据库中表的数据记录进行增删改操作
-- 添加数据 INSERT
-- 修改数据 UPDATE
-- 删除数据 DELETE

-- 添加数据
-- 给指定字段添加数据
insert into 表名(字段名1,字段名2,...) values(值1,值2,...);
-- 给全部字段添加数据
insert into 表名 values(值1,值2,...);
-- 批量添加数据
insert into 表名(字段1,字段2,...) values(值1,值2,...),(值1,值2,...),(值1,值2,...);
insert into 表名 values (值1,值2,...),(值1,值2,...),(值1,值2,...);

-- 修改数据
update 表名 set 字段名1 = 值1,字段2 = 值2,...[where 条件];

-- 删除数据
delete from 表名 [where条件]


-- Data Query Language(数据查询语言) SELECT
select 字段列表 from 表名列表 where 条件列表 
group by 分组字段列表  having 分组后条件列表
order by 排序字段列表
limit 分页参数

-- 所以的null值不参与聚合运算
-- distinct 去重
-- like 模糊匹配 _占一位 %占任意位数

-- where和having区别
-- 判断时机不同:where是分组之前进行过滤,不满足where条件,不参与分组;而having是分组之后对结果进行过滤。
-- 判断条件不同:where不能对聚合函数进行判断，而having可以。

-- 执行顺序:where > 聚合函数 > having
-- 分组之后,查询的字典一般为聚合函数和分组字段,查询其他字段无任何意义。

-- ASC 升序(默认排序方式), DESC 降序。

-- 分页查询
select 字段列表 from 表名 limit 起始索引,查询记录数;
-- 起始索引从0开始,起始索引 = (查询页码-1)*每页显示记录数;
-- 分页查询是数据库的方言,不同数据库有不同的实现,MySQL中是limit;
-- 如果查询的是第一页数据,起始索引可以省略,直接简写为limit10。

-- DQL执行顺序: from -> where -> group by -> having -> select -> order by -> limit


-- Data Control Language(数据控制语言) 管理数据库用户,控制数据库访问权限

-- 查询用户
use mysql;
select * from user;

-- 创建用户 '%'表示任意主机都可访问,即主机名可以用%通配。
create user '用户名'@'主机名'identified by '密码';

-- 修改用户密码
alter user '用户名'@'主机名' identified with mysql_native_password by '新密码';

-- 删除用户
drop user '用户名'@'主机名';

-- 权限控制
-- ALL, ALL PRIVILEGES 所所有权限
-- SELECT 查询数据
-- INSERT 插入数据
-- UPDATE 修改数据
-- DELETE 删除数据
-- ALTER  修改表
-- DROP   删除数据库/表/视图
-- CREATE 创建数据库/表

-- 查询权限
show grants for '用户名'@'主机名';

-- 授予权限
grant 权限列表 on 数据库.表名 to '用户名'@'主机名';

-- 撤销权限
revoke 权限列表 on 数据库.表名 from '用户名'@'主机名';

-- 多个权限之间,用','分隔。
-- 授权时,数据库名和表名可以使用'*'进行通配,代表所有。


 






