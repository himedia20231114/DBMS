
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
             NOT NULL 
                   - �÷��� NULL�� ���� �� ������ �ϴ� ���� ���� 
             CHECK 
                    - �÷��� ������ �־ ���� ���ϴ� ���� ���� �� �ֵ��� ��. 
                    -  �� �÷���  1 ~ 12 ���� ���� �� �ֵ��� 
             default  : ���� ������ �ƴ����� ���� ����ó�� ���� 
                     -  �÷��� ���� ���� ������ default �� ������ ���� ��ϵ�. 
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

-- JOIN : ���� ���̺��� �÷��� ��� �Ҷ� JOIN�� ����ؼ� �ϳ��� ���̺� ó�� �����. 
      -- �� ���̺��� ���� Ű �÷��� Ȯ��, 
      -- emp01, dept01 ���̺��� ���� Ű �÷��� dno   �̴�. 
      -- EQUI JOIN : ����Ŭ������ �۵��ϴ� JOIN ���� 
      -- ANSI JOIN :  ��� DBMS���� �������� ���Ǵ� JOIN ���� 
      
-- EQUI JOIN �������� �� ���̺� ���� 
 -- from ������ JOIN �� ���̺��� ��� (,)
 -- ���̺� �̸��� ��Ī�̸����� ��. 
 -- where ������ �� ���̺��� ���� Ű �÷��� ��� 
 -- and ������ ������ ó�� 
 -- ���� Ű �÷��� ��½� �ݵ�� ���̺��.�ķ��� 
 
select e.eno, e.ename, e.job,d.dno , d.dname, d.loc 
from emp01 e , dept01 d 
where e.dno = d.dno

select eno, ename, job, d.dno , dname, loc 
from emp01 e , dept01 d 
where e.dno = d.dno
and d.dno = 10 ; 

-- ANSI JOIN : ��� DBMS���� �������� ���Ǵ� JOIN ���� 
    -- INNER JOIN  : �� ���̺��� Ű�÷��� ���� �Ǵ� �κи� ���     <=== 80 % 
    -- OUTER JOIN : 
                 -- LEFT OUTER JOIN 
                 -- RIRGHT OUTER JOIN 
                 -- FULL OUTER JOIN 
    -- SELF JOIN 
    -- CLOSS JOIN 

-- INNER JOIN :  ANSI JOIN 
      -- from ���� JOIN ���̺� �̸��� ��� , 
      -- INNER Ű�� ���� �� �� �ִ�.   <===  80 % �̻� 
      -- on ���� �� ���̺��� ���� Ű �÷��� ��� ,  �� ���̺��� ������ �͸� ���  
      -- where ������ ���� ó��

-- ���̺� �̸��� alias (��Ī)  ��Ű�� �ʴ� ��� 
select eno, ename, salary,dept01.dno, dname, loc 
from emp01  INNER JOIN dept01 
on emp01.dno = dept01.dno 

-- ���̺� �̸��� alias (��Ī)  ����� ��� 
select eno, ename, salary, d.dno, dname, loc 
from emp01 e  JOIN dept01 d 
on e.dno = d.dno 
where  e.dno = 20 
order by ename desc ; 

-- INNER JOIN : ANSI SQL : ��� DBMS���� �������� ���Ǵ� SQL ���� ( Oracle, MySQL, MSSQL, DB2, .....)  
           -- ON ���� �� ���̺��� ����и� ��� 
select * 
from emp01 e JOIN dept01 d
on e.dno = d.dno 

-- OUTER JOIN : 
    -- LEFT OUTER JOIN     : ���� ���̺��� ��� ������ �����. 
    -- RIGHT OUTER JOIN   : ������ ���̺��� ��� ������ �����. 
    -- FULL OUTER JOIN     : ����, ������ ���̺��� ��� ������ �����. 

select * from dept01; 

insert into dept01 (dno , dname, loc) 
values ( 60 , 'MANAGE', 'PUSAN'); 

commit ; 


-- ���� ��� ��. 
-- RIGHT OUTER JOIN : �� ���̺��� ���� �κа� ������ (dept01) ���̺��� ��� ���� ��� 
select * 
from emp01 e  RIGHT OUTER JOIN dept01 d 
on e.dno = d.dno 

-- FULL OUTER JOIN : �� ���̺�(����, ������)�� ��� ������ ��� 
select * 
from emp01 e FULL OUTER JOIN dept01 d
on e.dno = d.dno ; 

-- SELF JOIN : �ڽ��� ���̺��� JOIN, �ڽ��� ���̺��� ��Ī�̸����� �������� �����ؼ� JOIN 
    -- ������ ���, ���� ��縦 �ٷ� ��� �Ҷ� ���� 
    
select e.eno �����ȣ, e.ename ����̸�, e.manager ���ӻ����ȣ, m.eno ���ӻ�����, m.ename ���ӻ����  
from  emp01 e  JOIN emp01 m 
on e.manager = m.eno ; 

select eno , ename , manager,  eno, ename
from employee; 

















