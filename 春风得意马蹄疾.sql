-- 创建索引
create [unique|fulltext] index index_name on table_name(index_col_name,...);

-- 查看索引
show index from table_name;

-- 删除索引
drop index index_name on table_name;


-- SQL执行频率
show [global|session] status like 'Com_______';


-- 慢查询日志：记录了所有执行时间超过指定参数(long_quert_time,单位时间:秒,默认10秒)的所有SQL语句的日志。
-- 查看慢查询日志是否开启。
show variables like 'slow_query_log';
-- MySQL(8.0)的慢查询日志默认开启,需要在MySQL的配置文件(/etc/my.cnf)中配置如下信息：
-- 开启MySQL慢查询日志查询开关。
slow_query_log = 1;
-- 设置慢日志的时间为2秒,SQL语句执行时间超过2秒,就会视为慢查询,记录为慢查询日志。
long_query_time = 2;
-- 查看慢日志文件中记录的信息 
/var/lib/mysql/localhost-slow.log


-- SQL语句耗时
show profiles;

-- 查看当前MySQL是否支持profile操作。
select @@have_profiling;
-- 查看每一条SQL的耗时基本情况
show profiles;
-- 查看指定query_id的SQL语句各个阶段的耗时情况
show profile for query query_id;
-- 查看指定query_id的SQL语句CPU的使用情况
show profile cpu query query_id;

-- explain执行计划：EXPLAIN或者DESC命令获取如何执行SELECT语句的信息,包括在SELECT语句执行过程中表如何连接和连接的顺序。
-- 直接在select语句之前加上关键字explain/desc 
explain select 字段列表 from 表名 where 条件;


-- 索引使用

-- 最左前缀法则
-- 如果索引了多列(联合索引),要遵守最左前缀法则。最左前缀法则指的是查询从索引的最左列开始,并且不跳过索引中的列。
-- 如果跳跃某一列,索引将部分失效(后面的字段索引失效)。

-- 范围查询
-- 联合索引中,出现范围查询(>,<),范围查询右侧的列索引失效。

-- 索引列运算
-- 不要在索引列上进行运算操作,索引将失效。

-- 字符串不加引号
-- 字符串类型字段使用时,不加引号,索引将失效。

-- 模糊查询
-- 如果仅仅是尾部模糊匹配,索引不会失效,如果是头部模糊匹配,索引失效。

-- or连接的条件
-- 用or分隔开的条件,如果or前的条件中的列有索引,而后面的列中没有索引,那么涉及的索引都不会被用到。

-- 数据分布影响
-- 如果MySQL评估使用索引比全表更慢,则补使用索引。

-- SQL提示
-- 在SQL语句中加入一些人为的提示来达到优化操作的目的。
select 字段列表 from 表名 [use|ignore|force] index(索引名) where 限制条件;

-- 覆盖索引
-- 查询使用了索引,并且需要返回的列,在该索引中已经全部能够找到,减少使用 select * 。
-- using index condition：查找使用了索引,但是需要回表查询数据。
-- using where / using index：查找使用了索引,但是需要的数据都在索引列中能找到,所以不需要回表查询数据。

-- 前缀索引
-- 当字段类型为字符串(varchar,text等)时,有时候需要索引很长的字符串,这会让索引变得很大,查询时浪费大量的磁盘IO,影响查询效率。
-- 此时可只将字符串的一部分前缀,建立索引,可以大大节约空间,从而提高索引效率。
create index idx_xxxx on table_name(column(n));











 
