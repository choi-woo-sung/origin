NVL(expr1, expr2) --NVL��  expr 1�� ���� ��� expr2�� ����Ѵ�

if expr1 == null      
    return expr2
    
    else
    return expr1
    
    NVL2(expr1, expr2, expr3)
    
    if expr 1 ! =null
        return expr2
        
        else
        return expr3
        

SELECT empno, ename, sal ,comm, NVL2(comm, 100, 200)
FROM emp;


NULLIF(expr1, expr2)

if expr ==expr2
    return null
else return expr1

sal�÷��� ���� 3000�̸� null�� ����
SELECT empno, ename ,sal ,NULLIF(sal,3000)
FROM emp;


�������� : �Լ��� ������ ������ ������ ���� ����
         �������ڵ��� Ÿ���� ���� �ؾ���
         
���ڵ��߿� ���� ���������� null�� �ƴ� ���ڰ��� ����

coalesce(expr1,expr2.....)
if expr1 != null
    return expr1
else
coalesce(expr2, expr3.....)

mgr �÷� null
comm �÷� null

SELECT empno, ename, comm , sal, coalesce(comm,sal)
FROM emp;


emp ���̺��� ������ ������ ���� ��ȸ�ǵ��� ������ �ۼ��ϼ���

select empno, ename, mgr,    NVL(mgr,9999) mgr_n, NVL2(mgr,mgr ,9999)mgr_n_1,coalesce(mgr,9999)mgr_n_2
from emp;


user ���̺��� ������ ������ ���� ��ȸ�ǵ��� ������ �ۼ��ϼ���

SELECT userid, usernm,reg_dt ,NVL(reg_dt, sysdate)
FROM users
WHERE userid!='brown';

condition
���ǿ� ���� �÷� Ȥ�� ǥ������ �ٸ������� ��ü
java if , switch ��������
1. case ����
2. decode

1.CASE
CASE
    WHEN ��/������ �Ǻ��Ҽ��ִ� �� THEN �����Ұ�
    [WHEN ��/������ �Ǻ��Ҽ��ִ� �� THEN �����Ұ�]
    [ELSE ������ ��  �Ǻ����� ���� WHEN ���� ������� ����)
END

emp ���̺� ��ϵ� �����鿡�� ���ʽ��� �߰������� ������ ����
�ش������� job�� SALESMAN�ϰ�� SAL���� 5%�λ�� �ݾ��� ���ʽ��� ����(ex: sal ->105
�ش������� job�� MANAGER�ϰ�� SAL���� 10%�λ�� �ݾ��� ���ʽ��� ����
�ش������� job�� PRESIDENT�� ��� SAL���� 20% �λ�� �ݾ��� ���ʽ��� ����
�׿� �������� sal��ŭ�� ����

SELECT empno, ename, job ,sal,  
        CASE   
            WHEN job='SALESMAN' THEN sal * 1.05
            WHEN job='MANAGER' THEN sal * 1.10
            WHEN job='PRESIDENT' THEN sal * 1.20
            ELSE sal
        END bonus
FROM emp;

2.DECODE(EXPR1, search1, return1, search2, return2, search3, return3,....,[default])

  DECODE(EXPR1,
         search1, return1,
         search2, return2,
         search3, return3,
         search4, return4,
         search5, return5,
         default

IF EXPR1 == search1
    return return1
else if expr1 == search2
    return return2
    else if expr1 == search3
    return return3
    
.....
else 
return default;


SELECT empno, ename, job, sal,
    DECODE(job, 'SALESMAN', sal*1.05,
                'MANAGER',  sal*1.10,
                'PRESIDENT', sal*1.20,
                sal)
                FROM emp;
    
SELECT empno, ename , 
        DECODE(deptno, '10', 'ACCOUNTING', '20', 'RESEARCH', '30', 'SALES', '40', 'OPERATIONS', 'DDIT') dname
        FROM emp;

SELECT empno, ename,
        CASE
        WHEN deptno=10 then 'ACCOUNTING'
        WHEN deptno=20 then 'RESEARCH'
        WHEN deptno=30 then 'SALES'
        WHEN deptno=40 then 'OPERATIONS'
        ELSE 'DDIT' 
        END dname
        FROM emp;
        
        
SELECT ename, ename, hiredate,
    CASE
    WHEN MOD(TO_CHAR(sysdate,'YYYY')-TO_CHAR(hiredate,'YYYY'),2)=0 then '�ǰ����� �����'
     ELSE '�ǰ����� ������'
     END contact_to_doctor
     FROM emp;
      
   
SELECT empno, ename, hiredate,
    DECODE(MOD(TO_CHAR(sysdate,'YYYY')-TO_CHAR(hiredate,'YYYY'),2),'0','�ǰ����� �����',1,  '�ǰ����� ������' )
    FROM emp;
    


SELECT userid, usernm, alias, reg_dt,
    case
    WHEN MOD((TO_CHAR(sysdate,'YYYY')-TO_CHAR(reg_dt,'yyyy')),2)=1 THEN '�ǰ����� �����'
    ELSE '�ǰ����� ������'
    END contactdoctor
FROM users;
