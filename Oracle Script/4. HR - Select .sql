
/*
    select :  ���̺��� ���� �˻� 
    
    select �÷��� from ���̺��[���] 
    
    select * from employee; 
    
*/

-- employee ���̺��� ��� �÷��� ��� �ϱ� 

select * 
from employee; 

-- Ư�� �÷��� ��� �ϱ� 
select eno, ename, job
from employee; 

-- Ư�� �÷��� ������ ��� �ϱ� , �÷��� ������ �� �� �ִ�. �÷��̸��� �ٲ� �� �ִ�. 
select eno, ename, salary, ename, ename, salary , salary * 12 
from employee; 

-- �÷� �ϸ��� ��Ī���� �ٲٰ� ��� �ϱ� 
select eno as �����ȣ, ename ����� , salary as ����, salary * 12  as ���� 
from employee; 

-- employee ���̺��� �� �÷��� �ǹ� 
select * 
from employee; 

select eno as "��� ��ȣ", ename �����, job ��å, manager ���ӻ��, 
            hiredate �Ի糯¥, salary ����, commission ���ʽ�, dno �μ���ȣ
from employee; 








