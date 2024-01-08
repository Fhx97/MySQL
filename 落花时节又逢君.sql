-- �α�:�����洢��ѯ���������������,�ڴ洢���̺ͺ����п���ʹ���α�Խ��������ѭ������
-- �����α�
declare �α����� cursor for ��ѯ���;
-- ���α�
open �α�����;
-- ��ȡ�α��¼
fetch �α����� into ����[,����];
-- �ر��α�
close �α�����;


-- �����������:�����������̿��ƽṹִ�й�������������ʱ��Ӧ�Ĵ����衣
declare handler_action handler for condition_value [,condition_value]... statement;

handler_action
	continue:����ִ�е�ǰ����
	exit:��ִֹ�е�ǰ����

condition_value
	sqlstate sqlstate_value:״̬��,��02000
	sqlwarning:������01��ͷ��sqlstate�����д
	not found:������02��ͷ��sqlstate�����д
	sqlexception:����û�б�sqlwarning��not found �����sqlstate����ļ�д;
	

-- ������:��֤���������ԡ���־��¼������У��
-- ����
create trigger trigger_name
before/after insert/update/delete 
on tbl_name for each row --�м�������
begin 
	trigger_stmt;
end;
-- �鿴
show triggers;
-- ɾ��
drop trigger [schema_name.]trigger_name; --���û��ָ��schema_name,Ĭ��Ϊ��ǰ���ݿ⡣


-- ��:�����Э��������̻��̲߳�������ĳһ��Դ�Ļ��ơ�
-- ȫ����:�������ݿ������б�;һ��������ȫ����߼�����,��֤���ݵ������ԡ�
-- ����������ϱ���,��ô�����ڼ䶼����ִ�и���,ҵ������Ͼ͵�ͣ�ڡ�
-- ����ڴӿ��ϱ���,��ô�ڱ����ڼ�ӿⲻ��ִ������ͬ�������Ķ�������־(binlog),�ᵼ�������ӳ١�
-- ��InnoDB������,�����ڱ���ʱ���ϲ��� --single-transaction��������ɲ�������һ�������ݱ��ݡ�
flush tables with read lock;

-- ����:ÿ�β�����ס���ű�;�ɷ�Ϊ������Ԫ������(meta data lock,MDL)����������
-- ����:�������(read lock),���ռд��(with lock)
	-- ����:lock tables ���� read/write�� 
	-- �ͷ���:unlock tables / �ͻ��˶Ͽ����ӡ�
-- ���������谭�����ͻ��˵Ķ�,���ǻ��谭д��д���Ȼ����������ͻ��˵Ķ�,�ֻ����������ͻ��˵�д��
-- Ԫ������:Ϊ�˱���DML��DDL��ͻ,��֤��д��׼ȷ�ԡ�

-- �м���:InnoDB�������ǻ���������֯��,������ͨ���������ϵ������������ʵ�ֵ�,�����ǶԼ�¼�ӵ�����
-- ����(Record Lock):����������¼����,��ֹ��������Դ˽���update��delete;��RC��RR���뼶���¶�֧��;������(S)��������(X)��
-- ��϶��(Gap Lock):����������¼��϶(�����ü�¼),ȷ��������¼��϶����,��ֹ���������������϶����insert,�����ö�;��RR���뼶���¶�֧�֡�
-- �ټ���(Next-Key Lock):�����ͼ�϶�����,��RR���뼶����֧�֡�

-- �м���:ÿ�β�����ס��Ӧ�������ݡ�


