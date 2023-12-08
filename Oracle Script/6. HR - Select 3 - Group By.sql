
/*  그룹 함수 : group by, having 
 
 select 컬럼명 
 from 테이블[뷰]
 where 조건 
 group by 컬럼명[동일한값을그룹핑]
 having 조건 [group by 한 결과 값의 조건] 
 order by 컬럼명 asc[desc] 

*/ 

/* 집계 함수 : number 타입의 컬럼에 적용   <=== NULL 을 자동으로 처리됨...
    SUM  - 컬럼의 모든 값의 합
    AVG - 컬럼의 모든 값의 합
    MAX - 컬럼의 최대값
    MIN - 컬럼의 최소값
    COUNT (*) - 그룹핑 된 레코드 수 출력 . 
    
    주의 :  단일 행으로 출력이 되기 때문에 다른 컬럼과 사용시 오류. 
             단 . group by 절에 grouping 된 컬럼은 출력 가능 
    
*/ 
desc employee; 

-- 컬럼에 함수 사용 : 
-- 월급 (salary)
select SUM(salary) 합계 ,  Round (AVG(salary), 2) 평균,  MAX(salary) 최대값, Min (salary ) 최소값 , count(*) 계산된레코드수
from employee; 

-- 집계 함수는 NULL을 자동으로 처리함. 
select commission
from employee; 

-- 보너스 (commission)  <== null은 자동으로 처리됨 
select SUM(commission) 합계 ,  Round (AVG(commission), 2) 평균,  MAX(commission) 최대값, 
            Min (commission ) 최소값 , count(*) 계산된레코드수
from employee; 

-- 부서별로 월급의 합계, 평균, 최대월급 , 최소 월급, 그룹핑된 수를 출력 

select  dno 부서번호, SUM(salary) 합계, Round ( AVG(salary) ) 평균, 
            MAX(salary) 최대값, MIN(salary) 최소값, COUNT(*) 그룹핑된수
from employee
group by dno ;           -- DNO 컬럼의 동일한 값을 그룹핑해서 집계함수를 적용함. 

select salary, dno 
from employee
order by dno asc; 

-- 직책(job) 별로 월급의 합계, 평균, 최대값, 최소값, 그룹핑된수를 출력 해 보세요.
select  ename, job, salary 
from employee
order by job ; 

select  job 직책 , count(*) 그룹핑된갯수 , SUM (salary ) 합계,
             round(AVG(salary),2) 평균 , MAX(salary) 최대값, MIN(salary) 최소값
from employee
group by job;                 -- job 컬럼의 동일한 값을 그룹핑 

select count(*) 전체레코드수  from employee; 



