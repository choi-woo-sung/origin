NULL ó���ϴ� ��� (4���� �߿� ���� ���Ѱɷ� �ϳ� �̻��� ���)

NVL, NVL2...

condition :CASE, DECODE

�����ȹ : �����ȹ�� ���� ���¼���;

SELECT *
FROM emp
ORDER BY deptno;

DESC emp;

INSERT INFO emp (empno, ename)VALUE
select empno, ename, NVL(sal), NVL(comm, 0)
FROM emp;


SELECT job, deptno, sal,
DECODE(job,'SALESMAN', sal*1.05,
'PRESIDENT', sal*1.20 , 'MANAGER', 
DECODE(deptno,'10',sal*1.30,sal*1.10), sal)BONUS

FROM emp;



���� A= {10, 15, 18, 23, 24, 25, 29, 30, 35, 37}
Prime Number �Ҽ� : {23, ,29, 37} : COUNT-3, MAX-37, MIN-23, AVG-29.66, SUM-89
            ��Ҽ�: {10,15,18,24,25,35

GROUP FUNCTION
�������� �����͸� �̿��Ͽ� ���� �׷쳢�� ���� �����ϴ� �Լ�
�������� �Է¹޾� �ϳ��� ������ ����� ���δ�.
EX: �μ��� �޿� ���
    emp ���̺��� 14���� ������ �ְ�, 14���� ������ 3���� �μ� (10, 20, 30)�� ���� �ִ�.
    �μ��� �޿� ����� 3���� ������ ����� ��ȯ�ȴ�.
    GROUP BY ����� ���ǻ���: SELECT ����Ҽ��ִ� �÷��� ���ѵ� --GROUPBY ���� ����� �÷��鸸 �����ִ�.
    SELECT �׷��� ���� �÷�, �׷��Լ�
    FROM ���̺�
    GROUP BY �׷��� ���� �÷�
    [ORDER BY];
   
   SELECT deptno,
         MAX(sal), --�μ����� ���� ���� �޿��� 
         MIN(sal),
         ROUND(AVG(sal),2),
         AVG(sal), -- �μ��� �޿� ���
         SUM(sal), -- �μ��� �޿���
       COUNT(sal),  -- �μ��� �޿� �Ǽ�(sal �÷��� ���� null�� �ƴ� row�� ��)
       COUNT(*),    --�μ��� ���Ǽ�
    COUNT(mgr)
       FROM emp
       GROUP BY deptno;
       
       * �׷��Լ��� ���� �μ���ȣ �� ���� ���� �޿��� ���Ҽ��� ������
        ���� ���� �޿��� �޴� ����� �̸��� �� �� �� ����
        ==> ���� WINDOW FUNCTION�� ���� �ذᰡ��       
       
       emp ���̺��� �׷������ �μ���ȣ�� �ƴ� ��ü �������� �����ϴ� ���
       
   SELECT
         MAX(sal), --���� ���� �޿��� 
         MIN(sal),
         ROUND(AVG(sal),2), --��ü������ �޿� ���
         AVG(sal), --  �޿� ���
         SUM(sal), --  ��ü������ �޿���
       COUNT(sal),  -- ��ü ������ �޿� �Ǽ�(sal �÷��� ���� null�� �ƴ� row�� ��)
       COUNT(*),   --��ü ���Ǽ�
        COUNT(mgr) --mgr �÷��� null�� �ƴ� �Ǽ�
       FROM emp;

2020.04.27�� ��ǥ�� ����Ȯ��
GROUP BY ���� ����� �÷��� 
    SELECT ���� ������������ ????
    
GROUP BY���� ����������� �÷���
    SELECT���� ������ ????


   --�μ����� ���� ���� �޿� ��
    SELECT deptno, MAX(sal)
    FROM emp
    GROUP BY  deptno;
    
    SELECT deptno, sal  --�׷��� ���� �÷��� ������Ѵ�. �� �Լ��� �̿��ϸ� �������.
    FROM emp
    ORDER BY deptno;
    
  GROUP�Լ� ����� NULL���� ���ܰ� �ȴ�.
  30�� �μ����� NULL���� ���� ���� ������, SUM(comm)�� ���� ���������� ���Ȱ� Ȯ�� �Ҽ� �ִ�.
  
    SELECT deptno, SUM(comm)
    FROM emp
    GROUP BY deptno;
    
    
    10, 20�� �μ��� SUM(COMM)�÷��� NULL�� �ƴ϶� 0�� �������� NULL ó��
    * Ư���� ������ �ƴϸ� �׷��Լ� ��� ����� NULLó���� �ϴ°��� ���ɻ� ����
     SELECT deptno, SUM(NVL(comm,0))  -->COMMĿ���� SUM �׷��Լ��� �����ϰ� ��������� NVL�� ����(1ȸ ȣ��)
                    NVL(SUM(COMM),0) --<��� COMM�÷��� NVL �Լ��� ������(�ش� �׷��� ROW�� ��ŭ ȣ��) SUM �׷��Լ� ����
    FROM emp
    GROUP BY deptno;
    
    
single row �Լ��� where���� ����Ҽ� ������
multi row �Լ�(group �Լ�)�� where���� ����Ҽ� ����
GROUP BY�� ���� HAVING ���� ������ ���

single row �Լ��� WHERE ������ ��밡��
SELECT*
FROM emp
WHERE LOWER(ename) = 'smith';

�μ��� �޿� ���� 5000�� �Ѵ� �μ��� ��ȸ
SELECT deptno, SUM(sal)
FROM emp
WHERE SUM(sal) >9000
GROUP BY deptno;

SELECT deptno, SUM(sal)
FROM emp
GROUP BY deptno
HAVING SUM(sal) >9000;

SELECT MAX(sal), 
       MIN(sal),
    ROUND(AVG(sal),2), 
       SUM(sal), 
     COUNT(sal),
     COUNT(mgr),
     COUNT(*) 
FROM emp;

SELECT deptno,
       MAX(sal) max_sal,
       MIN(sal) min_sal,
       ROUND(AVG(sal),2) avg_sal,
       SUM(sal),
       COUNT(sal) count_sal,
       COUNT(mgr) count_mgr,
       COUNT(*) count_all
FROM emp
GROUP BY deptno;



SELECT case
WHEN deptno=10 then 'ACCOUNTING'
WHEN deptno=20 then 'RESERCH'
WHEN deptno=30 then 'SALES'
END dname,
       MAX(sal) max_sal,
       MIN(sal) min_sal,
       ROUND(AVG(sal),2) avg_sal,
       SUM(sal),
       COUNT(sal) count_sal,
       COUNT(mgr) count_mgr,
       COUNT(*) count_all
FROM emp
GROUP BY deptno



-- emp���̺��� �̿��Ͽ� ������ ���Ͻÿ� ������ �Ի� ������� ����� ������ �Ի��ߴ��� ��ȸ�ϴ� ������ �ۼ��ϼ���.

SELECT TO_CHAR(hiredate, 'YYYYMM') hire_yyyymm,
COUNT(*)
FROM emp
GROUP BY TO_CHAR(hiredate, 'YYYYMM')
ORDER BY TO_CHAR(hiredate, 'YYYYMM');


SELECT TO_CHAR(hiredate,'YYYY') ,
COUNT(*)
FROM emp
GROUP BY TO_CHAR(hiredate, 'YYYY');



grp6]��ü �������� ���ϴ� ����

SELECT  COUNT(*) cnt
FROM dept


grp6] ������ ���� �μ��� ������ ��ȸ�ϴ� ������ �ۼ��Ͻÿ�


SELECT
COUNT(COUNT(*))cnt
FROM emp
GROUP BY deptno;










