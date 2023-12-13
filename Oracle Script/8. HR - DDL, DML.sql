/*
    SQL : ��� ���� ���� , select, create, alter, drop , insert, update, delete, grant, revoke, rollbac, commit 
       - ����ȭ�� ���� ��� 
    
    SQL ���� 
        - DQL(Data Query Language)  : ���, �˻� , select 
        - DDL (Date Definition Language) : ��Ű�� (Ʋ, ����), ��ü (���̺�, ��, �Լ�, ������, Ʈ����, �������ν���, �ε���) ����, ����,����
                    create (����), alter (����), drop(����) 
        - DML ( Data Manupulation Language) : ���̺��� ���ڵ�(��) �� �����ϴ� ��� 
                    insert( �Է� ) , update( ���� ) , delete ( ���� ) 
                    -- Ʈ������� �߻�( RAM )  , commit : RAM�� ����� ������ DataBase ������ �����ϵ��� ��. , rollback : ������� �ǵ���. 
                    -- Ʈ�������� insert, update, delete  ���۵Ǹ� �ڵ����� Ʈ������� ���� 
                    -- Ʈ������� ���� : rollback : �޸𸮿� ����� ������ �ٽ� ���� ���·� �ǵ���, commit : DB�� ���������� ������. 
                    -- Ʈ�������� ���� ���� ������ LOCK �ɷ��� Ʈ������ Ʈ����� ����ɶ� ���� LOCK �ɷ� �ִ�. 
                    -- ����Ŭ :   DML ���� �����ϸ� �ڵ����� Ʈ������� ���۵� .     ���� (rollback, commit)  <== ��� 
                    -- MySQL, MSSQL : DML ���� �����ϸ� �ڵ����� Ʈ������� ���۵� . commit �ڵ����� ó���� 
                    -- ��������� Ʈ������� ���� �� �� �ְ�, ��������� ���� �� �ִ�. 
        - DCL ( Data Control Language) :  ����(Account) ���� ��ü(Resource) �� ������ �ο���.  grant(�ο�), revoke (����)
        - TCL ( Transaction Control Language) : Ʈ������� ���� �ϴ� ���,  <== DML ������ ���� 
                commit (DB�� ������ ����), rollback ( �����Ƿ� �ǵ���), savepoint ( Ʈ����� ������ �ӽ� ������� ���� ) 
                begin transaction   : ��������� Ʈ����� ���� 
*/ 

/*
        Ʈ����� :  �۾�(��) �� ó���ϴ� �ּ� ����  : ALL or NOTHING :  �Ǹ� ���� �ǰ� �ϰų� �ȵǸ� ���� �ȵǰ� ��.
            - Ʈ����� log  �� ��� �Ǿ� �ִ�.   <== ������ �������� ���� ,  ��� ���� ������ �ƴ϶� ������ �������� �������� 
            
            - Ʈ������� 4���� Ư¡ 
                - ���ڼ� (Atomicity) : ���� ó���ϴ� �ּ� ���� 
                - �ϰ��� (Consistency) : Ʈ����ǿ��� ó���� ����� �ϰ����� ������. ALL or NOTHING 
                - ������ (lsolation) : �ϳ��� Ʈ������� �ٸ� Ʈ����ǰ� �ݸ��Ǿ� �ִ�. , LOCK, 
                - ���Ӽ� ( Durability) : commit  , DB�� ���������� �����               
                
                
*/ 

-- ���̺� ���� 

create table account10 
as 
select eno as no, ename as name , salary as  account
from employee ; 

-- ������ ���� ���̺� :  no : ���¹�ȣ,  name : �������� , account : �� (�Աݾ�), ��  
select * from account10; 

-- SMITH ���� Miller���� 10���� �Ա�  :  2���� update ������ �ϳ��� transaction ���� ó�� : ALL or NOTHING 
    -- SMITH Account - 10��    :     update account10 set account = account - 10 where no= 7369
    -- Miller Account + 10��   :      update account10 set account = account + 10 where no = 7934 

begin transaction ;      -- ��������� Ʈ������� ���� 

update  account10 
    set  account = account - 10 
where no = 7369;

update account10 
set account = account + 10 
 where no = 7934; 

select * from account10; 

-- Ʈ����� ���� 
rollback; 
commit ; 

desc account10 ; 


/* 
    DML : insert(���� �Է�) , update (����) , delete (����)  
        <== Ʈ����� �ڵ� ����, 
        <== Ʈ����� ���� ( rollback, commit) �� ��� (����Ŭ) 

*/ 

-- ���̺� ���� 
create table dept03 
as 
select * from department ; 

select * from dept03 ; 

-- dept03 : primary key ���� ���� �߰� 
alter table dept03 
add constraint PK_DEPT03_DNO primary key (dno) ; 


-- INSERT : ���� ���� , �� �÷��� �ڷ��� : number , ����, ��¥ , �÷��� ����� ���� ������ Ȯ�� 
desc dept03 ; 
select * from user_constraints where table_name in ('DEPT03') ; 

-- insert into ���̺�� (�÷���, �÷���,�÷���) values ( ��, ��, �� ) ; 

insert into dept03 ( dno, dname, loc ) 
values ( 50, 'HR', 'SEOUL') ; 

rollback ; 
commit ; 

select * from dept03 ; 

-- insert �� �÷� �̸��� ��� ���� �ʴ� ��� ��� �÷��� ���� �־����. 
insert into dept03 
values ( 60, '�λ��', '�λ�'); 

commit ; 

-- �÷� ���� �Ҷ��� ��� �÷��� ���� ������ �°� �Է� 
insert into dept03 
values ( 70, '�λ��');

-- �÷��� ����Ҷ� ������ �ٲ� �� �ְ� , Ư���÷��� ���� ���� �ʾƵ� ��. 
insert into dept03 ( dname, dno) 
values ( '������', 80) ; 

commit ; 


--UPDATE �� : �Էµ� ���� ������ ��� , �ݵ�� where ������ ���, where ���ǿ� ���Ǵ� �÷��� Primary Key �÷��̾�� ��. 
/*
    update ���̺�� 
    set �÷��� = �ٲܰ� , �÷���=�ٲܰ�
    where ���� 
*/ 

update dept03 
set loc = '�뱸'  
where dno = 80 ;  

rollback ; 
commit ; 

select * from dept03 ; 

-- 
update dept03
set dname = '������', loc = '����'
where dno = 40 ; 

--
insert into dept03 
values ( 90, '������', '�뱸') ; 

insert into dept03 
values ( 91, '������', '����') ; 

-- update ���� �ݵ�� where ���� ,   ������ ó���ϴ� �÷��� Primary key, Unique Ű �÷��� ���� 
update dept03
set dname = '�μ��' 
where loc = '����' ;         -- �ߺ��� �� 

-- update �� primary key �÷��� �������� ó���ؼ� ���ϴ� ���� ���� 
update dept03
set dname = '�μ��'
where dno in ( 91 , 80) ; 


-- Delete : ���ڵ带 ���� �Ҷ� , where <����>  ,  <���� :  �ߺ����� �ʴ� �÷�> 
/*
    delete ���̺�� 
    where ���� 
*/ 

select * from dept03; 

-- delete ������ ������ ������� �ʴ� ��� ��� ���ڵ尡 ������ ,  
delete dept03 

rollback ; 
commit ; 

-- delete , where ���� ��� ,    <== 
delete dept03 
where dno = 91 ;  


-- ��� ���ڵ带 ���� :  
    -- delete               :   ���ڵ� �ϳ� �ϳ��� ������. �ð��� ���� �ɸ�.  << �ο췹�� ���� >>
    -- truncate table ���̺��  :    �Ѳ����� ��ä�� ��� ���ڵ带 ���� ,  <<���� ����>>
    
    -- drop table ���̺��      : ���̺� ��ü�� ����   

select * from dept03; 

rollback ; 
commit ; 

-- ��� ���ڵ� ���� : ���� ����
delete dept03 ; 

-- ��� ���ڵ� ���� : ���� ����    <== DDL ���̱� ������ Rollback�� �ȵ�.  ������ �ٷ� Ŀ�Ե� 
            -- ������ ó���� 
            
truncate table dept03 ; 

-----------------------------------------------------------
create table emp04 
as 
select * from employee ; 

select * from emp04 ; 

/* emp04 
    ������ ���� �߰� : insert 
    ������ ���� ���� : update 
    ������ ���� ���� : delete 
    
    rollback ; 
    commit ; 
*/ 
















