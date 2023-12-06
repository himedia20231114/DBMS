
/*
    select :  테이블의 값을 검색 
    
    select 컬럼명 from 테이블명[뷰명] 
    
    select * from employee; 
    
*/

-- employee 테이블의 모든 컬럼을 출력 하기 

select * 
from employee; 

-- 특정 컬럼만 출력 하기 
select eno, ename, job
from employee; 

-- 특정 컬럼을 여러번 출력 하기 , 컬럼에 연산을 할 수 있다. 컬럼이름이 바뀔 수 있다. 
select eno, ename, salary, ename, ename, salary , salary * 12 
from employee; 

-- 컬럼 일름을 별칭으로 바꾸고 출력 하기 
select eno as 사원번호, ename 사원명 , salary as 월급, salary * 12  as 연봉 
from employee; 

-- employee 테이블의 각 컬럼의 의미 
select * 
from employee; 

select eno as "사원 번호", ename 사원명, job 직책, manager 직속상관, 
            hiredate 입사날짜, salary 월급, commission 보너스, dno 부서번호
from employee; 








