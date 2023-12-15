/*
     DDL : Create, Alter, drop   <-- 객체 ( 테이블, 뷰, 함수, 저장프로시져,  트리거, 스퀀스... )

`      - 테이블 생성후 ,  기존에 생성된 테이블에 대해서 빈번하게 유지 보수 (Alter Table) 
            - 1. 컬럼의 자료형 을 변경  : varchar(50) ===> varchar(100) 
            - 2. 컬럼의 이름을 변경 , 컬럼을 삭제, 컬럼을 추가 
            - 3. 컬럼의 제약조건을 추가, 삭제 ( Primary Key, Unique, NOT NULL, CHECK, Foreign Key, default ) 
        
*/ 

-- 실습을 위한 테이블 복사  : 컬럼명, 값 만 복사됨,  컬럼에 부여된 제약 조건은 복사되지 않음.  
create table emp60 
as 
select * from employee ; 

create table dept60 
as 
select * from department; 

select * from emp60 ; 
select * from dept60; 

-- 데이터 사전 : user_   ,   user_constraints :  데이터 베이스에 존재하는 모든 테이블에 대한 제약조건을 출력 
select * from user_constraints  
where table_name in ( 'EMPLOYEE', 'DEPARTMENT') ; 

-- 복사한 테이블은 제약 조건은 복사 되지 않는다. 
select * from user_constraints  
where table_name in ( 'EMP60', 'DEPT60') ; 

-- 1. Alter Table 을 사용해서 기존 테이블에 컬럼을 추가  : birth(date) , email(varchar2(100) , 
        -- 테이블에 컬럼을 추가시  null 로 처리후 컬럼을 추가해야함. 
desc dept60 ; 

alter table dept60 
add ( birth date  ) ; 

-- 기존 테이블에 여개의 컬럼을 한꺼번에 추가 하기 
alter table dept60 
add ( email varchar2(100) , addr varchar2(200), jumin char(14)) ;  

-- 기존 생성된 컬럼에 값 넣기  : update 
update dept60 
set birth = sysdate , email = 'aaa@aaa.com', addr = '서울', jumin =  '123456-7891011' 
where dno = 10 ; 

rollback ; 
commit ; 

select * from dept60 ; 

-- default 제약조건은 not null 앞에 위치 해야 한다. 
create table account11 (
	ino number not null primary key , 
	aname varchar(50) not null, 
    money number(7,2) default 0 not null 
    ); 


-- 2. 컬럼에 부여된 자료형 수정  :  char(10) ===> char(50) ,  varchar2(100) ==> varchar2(200) 
desc dept60 ; 

alter table dept60 
modify email varchar2(200) ; 


-- 3. 특정 컬럼을 제거 :  

alter table dept60 
drop column JUMIN; 

-- 4. 컬럼의 이름 변경  : addr ==> address1   

alter table dept60 
rename column addr to address1 ; 


-- 5. 테이블 이름 변경 : dept60 ==> dept70  

desc dept60 ; 

rename dept60 to dept70; 
desc dept70 ; 

select * from dept60 ;     -- 오류 발생 
select * from dept70 ; 

rename dept70 to dept60 ; 


-- 6. 기존 테이블의 제약 조건 추가, 제거, ( Primary key, Unique, Foreign key, check, default ) 
select * from user_constraints where table_name in ( 'DEPARTMENT', 'EMPLOYEE') ; 
select * from user_constraints where table_name in ( 'DEPT60', 'EMP60') ; 

-- 6-1. Primary Key  제약 조건 추가 : dept60 (dno) , emp60(ename) 
    -- 테이블에서 1번 만 넣을 수 있다. 
    -- not null 컬럼에 primary key를 넣을 수 있다. 
    -- 컬럼에 null 값이 없어야 함. 

-- dept60(dno) 에 Primary Key 제약 조건 추가  : 제약 조건 이름을 명시해서 부여함. 
alter table dept60 
add constraint PK_DEPT60_DNO primary key (dno) ; 

-- 제약 조건 이름을 생략 한 경우 : Oracle 에서 sys_*  로 시작 되는 임의의 이름을 넣음. 
alter table dept60 
add  primary key (dno) ; 

alter table emp60 
add constraint PK_EMP60_ENO primary key (eno) ; 


-- 제약 조건 제거 : 
alter table dept60 
drop constraint PK_DEPT60_DNO


-- 6-2. Foreign Key  :  다른 테이블의 컬럼의 값을 참조 해서 값을 넣을 수 있다. 
                --   테이블 (부모 : 1)    <=== FK 테이블 (자식 : 다) 
                -- JOIN 시 on 절에서 사용되는 키 컬럼. 
                -- 부모 테이블의 참조 컬럼은 Primary key, Unique 를 참조 할 수 있다. 
                -- 참조 컬럼의 데이터 타입이 비슷하거나 같아야 한다. 

select * from user_constraints where table_name in ( 'DEPT60', 'EMP60') ; 

--  Foreign Key (2순위)          Primary Key (1순위)
-- EMP60 (dno)  ==========> DEPT60(dno) 
desc dept60 ; 
desc emp60 ; 

alter table dept60 
drop constraint SYS_C008492; 

-- Foreign Key 제약 조건을 넣기 위해서는 
    -- 1. 부모테이블의 컬럼의 : Primary Key, Unique  , 2. 참조 컬럼의 자료형이 비슷하거나 같아야함. 

-- 1. 부모 테이블의 Primary key 할당 
alter table dept60
add constraint PK_DEPT60_DNO primary key (dno) ; 

-- 2. 자식 테이블의 Foreign Key 할당 : 부모 테이블의 Primary Key 를 참조 
alter table emp60 
add constraint FK_EMP60_dno Foreign Key (dno ) references DEPT60(dno) ; 

select * from dept60 ; 
select * from emp60 ; 

-- Foreign Key 는 JOIN 시  ON 절에서 참조 하는 컬럼  ; 

select eno, ename , salary , e.dno, d.dno , dname, loc
from emp60 e 
    join dept60 d 
        on e.dno = d.dno ; 
        
        



