�Ѱ��� ��, �ϳ��� �÷��� �����ϴ� ��������
ex : ��ü ������ �޿� ���, SMITH ������ ���� �μ��� �μ���ȣ

WHERE���� ��밡���� ������
WHERE deptno = 10 
==> 

�μ���ȣ�� 10 Ȥ�� 30���� ���
WHERE  deptno IN (10, 30)

WHERE deptno = 10 OR deptno =30

WHERE deptno = (10, 30)

������ ������

�������� ��ȸ�ϴ� ���������� ��� =�����ڸ� ���Ұ�

WHERE deptno IN (�������� ���� �����ϰ�, �ϳ��� �÷����� �̷���� ����)

SMITH - 20, ALLEN�� 30�� �μ��� ����

SMITH �Ǵ� ALLERN�� ���ϴ� �μ��� ������ ������ ��ȸ


���� ��������, �÷��� �ϳ��� ==> ������������ ��밡���� ������ IN(���̾�,�߿�) (ANY ,ALL, �󵵰� ����)
IN : ���������� ������� ������ ���� ���� �� TRUE
    WHERE �÷�|ǥ���� IN (��������)
    
ANY : �����ڸ� �����ϴ� ���� �ϳ��� ���� �� TRUE
    WHERE �÷�|ǥ���� ������ ANY (��������)
ALL : ���������� ��簪�� �����ڸ� �����Ҷ� TRUE
    WHERE �÷�|ǥ���� ������ ALL (��������)
    
 SMITH�� ALLEN�� ���� �μ����� �ٹ��ϴ� ��� ������ ��ȸ   
    
1. ���������� �������������� : �ΰ��� ������ ����

1-1] SMITH , ALLEN�� ���� �μ��� �μ���ȣ�� Ȯ�� �ϴ� ����
    
 SELECT deptno   
 FROM emp
 WHERE ename IN('SMITH','ALLEN');
 
 1-2] 1-1]���� ���� �μ���ȣ�� IN ������ ���� �ش� �μ��� ���ϴ� ���� ������ȸ
    
SELECT *
FROM emp
WHERE ename IN ('SMITH', 'ALLERN');

==> ���������� �̿��ϸ� �ϳ��� SQL���� ���డ��
SELECT *
FROM emp
WHERE deptno IN(SELECT deptno
                FROM emp
                WHERE ename IN('SMITH','ALLERN'));
                
sub3]             
SELECT *
FROM emp
WHERE deptno IN(SELECT deptno
                FROM emp
                WHERE ename IN('SMITH','WARD'));
                
        
ANY ,ALL
SMITH(800)�� WARD(1250) �λ���� �޿��� �ƹ������� ���� �޿��� �޴� ���� ��ȸ
SELECT*
FROM emp
WHERE sal < ANY(SELECT sal
            FROM emp
            WHERE ename IN('SMITH' , 'WARD'));
            
SMITH(800)�� WARD(1250) �λ���� �޿� ���� ���� �޿��� �޴� ���� ��ȸ  
==> SAL >1250
SELECT*
FROM emp
WHERE sal > ALL(SELECT sal
            FROM emp
            WHERE ename IN('SMITH' , 'WARD'));   
            
            
IN �������� ����
�ҼӺμ��� 20, Ȥ�� 30�� ���
WHERE deptno IN (20, 30)

�Ҽ� �μ��� 20, 30�� ������ �ʴ� ���
WHERE deptno NOT IN (20 ,30)
NOT IN �����ڸ� ����� ��� ���������� ���� NULL�� �ִ±� ���ΰ� �߿�.
==>null�� �������� ���������� ������������


NULL���� ���� ���� ����

SELECT *
FROM emp
WHERE empno NOT IN (SELECT mgr
                    FROM emp
                    WHERE MGR IS NOT NULL);   //������ �Ŵ����� �ƴѻ��

 NULL ó�� �Լ��� ���� ������ ������ �����ʴ� ������ ġȯ
 
 
 SELECT *
FROM emp
WHERE empno NOT IN (SELECT NVL(mgr, -1)
                    FROM emp );   //������ �Ŵ����� �ƴѻ��
                                           
            
 ���� �÷��� �����ϴ� ���������� ���� ���� ==> ���� �÷��� �����ϴ� ��������
 PAIRWISE ���� (������) ==> ���ÿ� ����
 
 SELECT empno, mgr, deptno
 FROM emp
 WHERE empno IN (7499, 7782);

 7499, 7782 ����� ������ (���� �μ�, ���� �Ŵ���)�� ��� ���� ������ȸ
 �Ŵ����� 7698�̸鼭 �Ҽ� �μ��� 30�� ���
 �Ŵ����� 7839�̸鼭 �Ҽ� �μ��� 10�� ���
 mgr �÷��� deptno �÷��� �������� ����.
 (mgr , deptno)
 (7698, 10)
 (7698, 30)
 (7839, 10)                   --->
 (7839, 30)
 SELECT *
 FROM emp
 WHERE mgr IN (7698, 7839)
        AND deptno IN (10 , 30);
        
        
        
  ---------------------------------
  PAIRWISE ���� (���� �������� ����� �Ѱ� ����)
  SELECT *
  FROM emp
  WHERE (mgr, deptno) IN (SELECT mgr , deptno
                         FROM emp
                        WHERE empno IN( 7499, 7782));
                        
 
 �������� ���� = ��� ��ġ
 
select -��Į�� ���� ����
FROM  - �ζ��� ��
WHERE - ��������


�������� ���� - ��ȯ�ϴ� ��, �÷��� ��

���� ��

    ���� �÷�(��Į�� ���� ����)
    ���� �÷�
���� ��
    ���� �÷�(���� ���� ����)
    ���� �÷�
    
��Į�� ���� ����
select ���� ǥ���Ǵ� ��������
������ ���� �÷��� �����ϴ� ���������� ��� ����
���� ������ �ϳ��� �÷� ó�� �ν�

SELECT 'X', (SELECT SYSDATE
FROM dual)
FROM dual;

��Į�� ���� ������ �ϳ��� ��, �ϳ��� �÷��� ��ȯ �ؾ� �Ѵ�.

���� �ϳ����� �÷��� 2������ ����.
SELECT 'X', (SELECT empno, ename FROM emp WHERE empno= 'SMITH')
FROM dual;
        
������ �ϳ��� �÷��� �����ϴ� ��Į�� �������� ==> ����        
SELECT 'X', (SELECT empno FROM emp) 
FROM dual;
 
 emp ���̺� ����� ��� �ش� ������ �Ҽ� �μ� �̸��� �˼��� ����. ==> ����
 
 Ư���μ��� �μ� �̸��� ��ȸ �ϴ� ����
 
 SELECT dname
 FROM dept
 WHERE deptno =10;
                
                

 
 JOIN���� ����
 
 SELECT empno, ename ,emp.deptno , dname
 FROM emp, dept
 WHERE emp.deptno = dept.deptno;
 
  �� ������ ��Į�� ���� ������ ����                                            ��ȣ ���� ������������.  //
   SELECT empno, ename ,emp.deptno , (SELECT dname FROM dept WHERE deptno =emp.deptno)
 FROM emp;

 
 �������� ���� -���������� �÷��� ������������ ����ϴ��� ���ο� ���� ����
 ��ȣ ���� ��������(corelated sub query)
 .���������� ���� �Ǿ�� ���� ������ ������ �����ϴ�.
 ���ȣ ���� ��������(non corelated sub query)
 .main ������ ���̺��� ���� ��ȸ �Ҽ��� �ְ�
    sub ������ ���̺��� ���� ��ȸ �� ���� �ִ�.
    ==> ����Ŭ�� �Ǵ� ������ ���ɻ� ������ �������� ���� ������ ����
 
 ��� ������ �޿� ��պ��� ���� �޿��� �޴� ������ ��ȸ�ϴ� ������ �ۼ� �ϼ���
 
 SELECT *
 FROM emp
 WHERE SAL>(SELECT AVG(sal)
            FROM emp);
�����غ� ���� , ���� ������ ��ȣ���� ���������ΰ�? ���ȣ ���� ���� �����ΰ�?


������ ���� �μ��� �޿� ��պ��� ���� �޿��� �޴� ����

Ư�� �μ�(10)�� �޿� ����� ���ϴ� SQL
SELECT AVG(sal)
FROM emp
WHERE deptno =10;





SELECT *
FROM emp e
WHERE e.sal >(SELECT AVG(sal)
FROM emp
WHERE deptno =e.deptno);


SELECT*
FROM dept;
INSERT INTO dept VALUES(99, 'ddit', 'daejeon');
emp ���̺� ��ϵ� �������� 10, 20 ,30�� �μ����� �Ҽ��� �Ǿ�����
���� �Ҽӵ��� ���� �μ� : 40, 99

���� ����,
���� ��� = ��� ����
IN , [ANY, ALL]

sub4]
SELECT*
FROM  dept 
WHERE deptno    IN (
SELECT deptno
FROM emp
);

���������� �̿��Ͽ� IN�����ڸ� ���� ��ġ�ϴ� ���� �ִ��� �����Ҷ�
���� ������ �־ ��� ����(����)

WHERE deptno IN(10, 10, 10);
WHERE deptno =10
OR deptno= 10
OR deptno= 10

cycle, product ���̺��� �̿��Ͽ� cid=1�� ���� �������� �ʴ� ��ǰ�� ��ȸ�ϴ� ������ �ۼ��ϼ���

SELECT pid, pnm
FROM product
WHERE pid not IN( SELECT pid  
              FROM cycle
            where cid=1);
            
            
            SELECT*
            FROM CYCLE
            SELECT*
            FROM PRODUCT
            

�ǽ� (sub6)

SELECT *
FROM cycle
WHERE cid =1
AND pid IN (SELECT pid
FROM cycle
where cid =2);

�ǽ� (SUB7)
������ �̿��� ���
SELECT cycle.cid, cnm,  product.pid , pnm , day, cnt
FROM customer, cycle, product
WHERE CUSTOMER.CID = CYCLE.CID
 AND CYCLE.PID = PRODUCT.PID
AND cycle.cid =1
AND product.pid IN (SELECT pid
FROM cycle
where cid =2);

--
��Į�� ���������� �̿��� ���
SELECT cid,(SELECT cnm FROM customer WHERE cid =cycle.cid) cnm , pid, (SELECT pnm FROM product WHERE pid = cycle.pid) pnm , day, cnt   //���������� �� 6������ �ſ� ������.
FROM cycle
WHERE cid =1
AND pid IN (SELECT pid
FROM cycle
where cid =2);




 
