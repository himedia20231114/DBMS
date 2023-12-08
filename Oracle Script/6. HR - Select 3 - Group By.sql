
/*  �׷� �Լ� : group by, having 
 
 select �÷��� 
 from ���̺�[��]
 where ���� 
 group by �÷���[�����Ѱ����׷���]
 having ���� [group by �� ��� ���� ����] 
 order by �÷��� asc[desc] 

*/ 

/* ���� �Լ� : number Ÿ���� �÷��� ����   <=== NULL �� �ڵ����� ó����...
    SUM  - �÷��� ��� ���� ��
    AVG - �÷��� ��� ���� ��
    MAX - �÷��� �ִ밪
    MIN - �÷��� �ּҰ�
    COUNT (*) - �׷��� �� ���ڵ� �� ��� . 
    
    ���� :  ���� ������ ����� �Ǳ� ������ �ٸ� �÷��� ���� ����. 
             �� . group by ���� grouping �� �÷��� ��� ���� 
    
*/ 
desc employee; 

-- �÷��� �Լ� ��� : 
-- ���� (salary)
select SUM(salary) �հ� ,  Round (AVG(salary), 2) ���,  MAX(salary) �ִ밪, Min (salary ) �ּҰ� , count(*) ���ȷ��ڵ��
from employee; 

-- ���� �Լ��� NULL�� �ڵ����� ó����. 
select commission
from employee; 

-- ���ʽ� (commission)  <== null�� �ڵ����� ó���� 
select SUM(commission) �հ� ,  Round (AVG(commission), 2) ���,  MAX(commission) �ִ밪, 
            Min (commission ) �ּҰ� , count(*) ���ȷ��ڵ��
from employee; 

-- �μ����� ������ �հ�, ���, �ִ���� , �ּ� ����, �׷��ε� ���� ��� 

select  dno �μ���ȣ, SUM(salary) �հ�, Round ( AVG(salary) ) ���, 
            MAX(salary) �ִ밪, MIN(salary) �ּҰ�, COUNT(*) �׷��εȼ�
from employee
group by dno ;           -- DNO �÷��� ������ ���� �׷����ؼ� �����Լ��� ������. 

select salary, dno 
from employee
order by dno asc; 

-- ��å(job) ���� ������ �հ�, ���, �ִ밪, �ּҰ�, �׷��εȼ��� ��� �� ������.
select  ename, job, salary 
from employee
order by job ; 

select  job ��å , count(*) �׷��εȰ��� , SUM (salary ) �հ�,
             round(AVG(salary),2) ��� , MAX(salary) �ִ밪, MIN(salary) �ּҰ�
from employee
group by job;                 -- job �÷��� ������ ���� �׷��� 

select count(*) ��ü���ڵ��  from employee; 



