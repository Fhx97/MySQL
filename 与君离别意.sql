-- insert�Ż�

-- ��������
insert into ����(�ֶ��б�) values(...),(...),...,(...);

-- �ֶ������ύ
start transaction;
insert into ����(�ֶ��б�) values(...),(...),...,(...);
insert into ����(�ֶ��б�) values(...),(...),...,(...);
insert into ����(�ֶ��б�) values(...),(...),...,(...);
commit;

-- ����˳�����

-- ���������ݲ���
-- �ͷ������ӷ�����ʱ,���ϲ��� --local-infile
mysql --local-infile -u -root -p 
-- ����ȫ�ֲ���local_infileΪ1,�����ӱ��ؼ����ļ��������ݵĿ���
set global local_infile = 1;
-- ִ��loadָ�׼���õ�����,���ص���ṹ��
load data local infile '/root/sql.log' into table '����' fields terminated by ',' lines terminated by '\n';

-- �����Ż�
-- ������֯��ʽ����InnoDB�洢������,�����ݶ��Ǹ�������˳����֯��ŵ�,���ִ洢��ʽ�ı��Ϊ������֯��(Index organized table IOT)��
-- ҳ����(��������������)��ҳ����Ϊ��,Ҳ�������һ��,Ҳ�������100%��ÿ��ҳ������2-N������(���һ�����ݶ��,�������),�����������С�
-- ҳ�ϲ�����ɾ��һ�м�¼ʱ,ʵ���ϼ�¼��û������ɾ��,ֻ�Ǽ�¼�����(flaged)Ϊɾ���������Ŀռ�����������¼����ʹ�á�
-- ��ҳ��ɾ���ļ�¼�ﵽMERGE_THRESHOLD(Ĭ��Ϊҳ��50%),InnoDB�ῪʼѰ�������ҳ(ǰ���)�����Ƿ���Խ�����ҳ�ϲ����Ż��ռ�ʹ�á�
-- MERGE_THRESHOLD���ϲ�ҳ����ֵ,�����Լ�����,�ڴ�������ߴ�������ʱָ����

-- count���ۺϺ���,����null�ۼ�ֵ�ͼ�1,���򲻼�,�����ۼ�ֵ��
-- ����Ч������count(�ֶ�) < count(����id) < count(1) �� count(*)


-- ��ͼ(View)
-- ��ͼ��һ��������ڵı�,��ͼ�е����ݲ��������ݿ���ʵ�ʴ���,�к����������Զ�����ͼ�Ĳ�ѯ��ʹ�õı�,������ʹ��ʱ��̬������
-- ͨ�׵Ľ�,��ͼֻ�����˲�ѯ��SQL�߼�,�������ѯ����������ڴ�����ͼ��ʱ��,��Ҫ�Ĺ��������ڴ�������SQL��ѯ����ϡ�

-- ����
create [or replace] view ��ͼ����[(�����б�)] as select��� [with | cascaded | local | check option];

-- ��ѯ
-- �鿴������ͼ���
show create view ��ͼ����;
-- �鿴��ͼ����
select * from ��ͼ����;

-- �޸�
create [or replace] view ��ͼ����[(�����б�)] as select��� [with | cascaded | local check option];
alter view ��ͼ����[(�����б�)] as select [with | cascaded | local | check option];

-- ɾ��
drop view [if exists] ��ͼ����;

-- ��ͼ�ĸ���
-- Ҫʹ��ͼ�ɸ���,��ͼ�е�����������е���֮��������һ��һ�Ĺ�ϵ��
-- �����ͼ���������κ�һ��,�����ͼ���ɸ��£��ۺϺ����򴰿ں�����distinct��group by��having��union��union all��


-- �洢����
-- ���Ⱦ������벢�洢�����ݿ��е�һ��SQL���ļ���,���ô洢���̿��Լ�Ӧ�ÿ�����Ա�ĺܶ๤��,�������������ݿ��Ӧ�÷�����֮��Ĵ���,����������ݴ����Ч�����кô��ġ�
-- �����֮,�洢���̾������ݿ�SQL���Բ���Ĵ����װ��

-- ����
create procedure �洢��������([in/out/inout ������ �������� | �����б�])
begin 

  -- SQL���
  
end;

-- ����
call ����([����]);

-- �鿴
-- ��ѯָ�����ݿ�Ĵ洢���̼�״̬��Ϣ
select * from information_schema.routines where routine_schema = 'xxx';
-- ��ѯĳ���洢���̵Ķ���
show create procedure �洢��������;

-- ɾ��
drop procedure [if exists] �洢��������;

-- ����������,ִ�д洢���̵�SQLʱ,��Ҫͨ���ؼ���delimiterָ��SQL���Ľ�������

-- ����
-- ϵͳ������ȫ�ֱ���(global)���Ự����(session)��@@ϵͳ����
-- �û����������@�û��������
-- �ֲ���������ҪDECLARE����,���÷�Χ��������begin...end���ڡ�

-- if���
if ����1 then ...
elseif ����2 then ...
else ...
end if;




