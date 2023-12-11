
/*
        JOIN : DataBase ���� ���� ���̺��� �����մϴ�.  �𵨸��� ���ؼ� ���̺��� �и� �Ǿ� �ִ�. ( R-DBMS) 
        employee ���̺�� department ���̺��� �ϳ��� ���̺��ε� �𵨸�(1,2,3����ȭ), �� ���ؼ� ���̺��� �и� 
        ���ڸ� :  �ߺ� ����, �������
        
        ���� ���� : ���̺��� �÷��� ���� Ű , �������� ���Ἲ (���Ծ��µ�����, ���ϴ� ���� ) 
            Primary Key :  
                  - ���̺��� �÷��� 1���� ���� �� �ִ�.  
                  - �ΰ� �÷��� ��� PK�� ���� �� �ִ�. 
                  - ���̺��� �����Ҷ� �ݵ�� PK �� �����ؾ� �Ѵ�.  - Update, Delete �������� PK �÷��� where �������� �����. 
                  - Ư�� �÷��� �ߺ� �� ���� ���� ���ϵ��� ��. 
                  - �ݵ�� not null �÷��̾����.  null�� ���� �� ����. 
                  - index �� �ڵ����� ���� �ȴ�. �÷��� �˻��� ������ ��. 
                  - JOIN �� ON ���� ���� ����ϴ� Ű �÷�. 
            Unique Key : 
                  - �÷��� �ߺ��� ���� ���� ���ϵ��� ��. 
                  - null�� ���� �� �ִ�. �� 1���� ���� �� �ִ�.  not null, null 
                  - �ϳ��� ���̺� ������ Unique Key �� ���� �� �ִ�. 
                  - index �� �ڵ����� ������.  JOIN �� ON�� ���� 
            Foreign Key : 
                  - �ٸ� ���̺�(�θ� ���̺�) �� Ư�� �÷��� ���� �ؼ� ���� �ֵ��� ��. 
                  - Foreign Key �� �����ϴ� �÷��� �θ����̺��� Primary Key , Unique Key �� ������. 
                  -    
*/ 

select * from employee;               -- employee ���̺��� dno �÷��� �����Ѵ� (Foreign Key ) 
                                                        -- department ���̺��� dno �÷��� �����Ѵ�. 
select * from department; 


-- ���̺� ����  : ���� ���̺��� ���� ������ ���� �Ǿ� ���� �ʴ´�.  Alter Table �� ����ؼ� ���� ������ �ο� 


create table emp01 
as 
select * from employee; 

create table dept01
as 
select * from department; 


/* 
        ���̺��� ���� ������ Ȯ�� �ϴ� ��ɾ� 
        user_constraints   : ������ ����  <== ���̺��� ���� ������ �˷��ִ� ���̺� 
*/ 
select * from user_constraints ;

select * from user_constraints
where table_name in ('EMPLOYEE', 'DEPARTMENT') ; 

-- ���̺��� �����ϸ� ���̺��� �÷��� �ο��� ���� ������ ���� �Ǿ� ���� �ʴ´�.  �÷��� ���� ����Ǿ�´�. 
-- alter table �� ����ؼ� ���� ������ �ο��ؾ� ��.
-- alter table : ������ ���̺��� ���� 
select * from user_constraints
where table_name in ('EMP01', 'DEPT01') ; 

-- dept01 ���̺� dno�÷���  Primary Key ���� ������ �߰� 
alter table dept01 
add constraint PK_DEPT01_DNO primary key (dno); 

-- emp01 ���̺� eno �÷��� Primary Key ���� ���� �߰� 
alter table emp01 
add constraint PK_EMP01_ENO primary key (eno); 

-- emp01 ���̺��� dno �÷��� Foreign Key �ο� , ����(references)�� ���̺��� �÷��� Dept01 ���̺��� dno �÷��� ���� 
alter table emp01 
add constraint FK_EMP01_DNO foreign key (dno) references dept01(dno); 

--  Primary Key �÷��� Ȯ�� : 
desc emp01 ; 

select * from emp01 ; 

-- ���� ������ �÷��� �ο��� ���� ������ �� Ȯ�� �ϰ� ���� insert
-- eno : Primary Key �� ���, �ߺ��� ���� ������ �ȵ� 
-- dno : Foreign Key ��� ,  Dept01 ���̺��� dno �÷��� �����ϴ� ���� �־�� �Ѵ�. 

insert into emp01 ( eno, ename, job, manager, hiredate, salary, commission, dno )
values ( 7977, 'PJW', 'CLERK', 7782 , '23/12/11', 1500 , null , 40 ); 

commit ;     -- DML ( insert, update, delete ) ���� DB�� ������ ����ǵ��� ��.   <����Ŭ> 

select * from emp01; 
select * from dept01; 

-- dept ���̺� �� �ֱ�  : dno �÷� : Primary key �� ����. 
desc dept01 ; 

insert into dept01 ( dno, dname, loc)
values ( 50 , 'HR', 'SEOUL') ; 

commit ;     -- DML ( insert, update, delete) ���� �ݵ�� ����. 

select * from dept01; 

select * from emp01 ; 







