-- ��ѯ�������ݿ�
show databases;

-- ��ѯ��ǰ���ݿ�
select database();

-- ����
create database [if not exists] ���ݿ��� [default charset�ַ���][collate �������];

-- ɾ��
drop database[if exists]���ݿ���;

-- ʹ��
use ���ݿ���;

-- ��ѯ��ǰ���ݿ����б�
show tables;

-- ��ѯ��ṹ
desc ����;

-- ��ѯָ����Ľ���ṹ
show create table ����

-- DDL(Data Define Language)���ݶ������� 
-- ������
create table ����(
	�ֶ�1 �ֶ�1����[comment �ֶ�1ע��],
	�ֶ�2 �ֶ�2����[comment �ֶ�2ע��],
	�ֶ�3 �ֶ�3����[comment �ֶ�3ע��],
	......
	�ֶ�n �ֶ�n����[comment �ֶ�nע��],
)[comment ��ע��];

-- ����ֶ�
alter table ���� add �ֶ��� ���� [comment ע��][Լ��];

-- �޸���������
alter table ���� modify �ֶ��� ����������;

-- �޸��ֶ������ֶ�����
alter table ���� change ���ֶ��� ���ֶ��� ���� [comment ע��][Լ��];

-- ɾ���ֶ�
alter table ���� drop �ֶ���;

-- �޸ı���
alter table ���� rename to �±���

-- ɾ����
drop table [if exists] ����;

-- ɾ��ָ����,�����´����ñ�(���±�ṹ���������)
truncate table ����;


-- DML(Data Manipulation Language) ���ݲ������� ���ڶ����ݿ��б�����ݼ�¼������ɾ�Ĳ���
-- ������� INSERT
-- �޸����� UPDATE
-- ɾ������ DELETE

-- �������
-- ��ָ���ֶ��������
insert into ����(�ֶ���1,�ֶ���2,...) values(ֵ1,ֵ2,...);
-- ��ȫ���ֶ��������
insert into ���� values(ֵ1,ֵ2,...);
-- �����������
insert into ����(�ֶ�1,�ֶ�2,...) values(ֵ1,ֵ2,...),(ֵ1,ֵ2,...),(ֵ1,ֵ2,...);
insert into ���� values (ֵ1,ֵ2,...),(ֵ1,ֵ2,...),(ֵ1,ֵ2,...);

-- �޸�����
update ���� set �ֶ���1 = ֵ1,�ֶ�2 = ֵ2,...[where ����];

-- ɾ������
delete from ���� [where����]


-- Data Query Language(���ݲ�ѯ����) SELECT
select �ֶ��б� from �����б� where �����б� 
group by �����ֶ��б�  having ����������б�
order by �����ֶ��б�
limit ��ҳ����

-- ���Ե�nullֵ������ۺ�����
-- distinct ȥ��
-- like ģ��ƥ�� _ռһλ %ռ����λ��

-- where��having����
-- �ж�ʱ����ͬ:where�Ƿ���֮ǰ���й���,������where����,���������;��having�Ƿ���֮��Խ�����й��ˡ�
-- �ж�������ͬ:where���ܶԾۺϺ��������жϣ���having���ԡ�

-- ִ��˳��:where > �ۺϺ��� > having
-- ����֮��,��ѯ���ֵ�һ��Ϊ�ۺϺ����ͷ����ֶ�,��ѯ�����ֶ����κ����塣

-- ASC ����(Ĭ������ʽ), DESC ����

-- ��ҳ��ѯ
select �ֶ��б� from ���� limit ��ʼ����,��ѯ��¼��;
-- ��ʼ������0��ʼ,��ʼ���� = (��ѯҳ��-1)*ÿҳ��ʾ��¼��;
-- ��ҳ��ѯ�����ݿ�ķ���,��ͬ���ݿ��в�ͬ��ʵ��,MySQL����limit;
-- �����ѯ���ǵ�һҳ����,��ʼ��������ʡ��,ֱ�Ӽ�дΪlimit10��

-- DQLִ��˳��: from -> where -> group by -> having -> select -> order by -> limit


-- Data Control Language(���ݿ�������) �������ݿ��û�,�������ݿ����Ȩ��

-- ��ѯ�û�
use mysql;
select * from user;

-- �����û� '%'��ʾ�����������ɷ���,��������������%ͨ�䡣
create user '�û���'@'������'identified by '����';

-- �޸��û�����
alter user '�û���'@'������' identified with mysql_native_password by '������';

-- ɾ���û�
drop user '�û���'@'������';

-- Ȩ�޿���
-- ALL, ALL PRIVILEGES ������Ȩ��
-- SELECT ��ѯ����
-- INSERT ��������
-- UPDATE �޸�����
-- DELETE ɾ������
-- ALTER  �޸ı�
-- DROP   ɾ�����ݿ�/��/��ͼ
-- CREATE �������ݿ�/��

-- ��ѯȨ��
show grants for '�û���'@'������';

-- ����Ȩ��
grant Ȩ���б� on ���ݿ�.���� to '�û���'@'������';

-- ����Ȩ��
revoke Ȩ���б� on ���ݿ�.���� from '�û���'@'������';

-- ���Ȩ��֮��,��','�ָ���
-- ��Ȩʱ,���ݿ����ͱ�������ʹ��'*'����ͨ��,�������С�


 






