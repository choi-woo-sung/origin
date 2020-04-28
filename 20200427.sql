SELECT COUNT(*) cnt

FROM( SELECT deptno
        FROM emp
        GROUP BY deptno);
        
DBMS : DataBase Management System

==>db
RDBMS : Relational DataBase Management System
==>������ �����ͺ��̽� ���� �ý���
    80�� �ʹ�
    
    
JOIN ������ ���� 
ANSI - ǥ��
�������� ����(ORACLE)

Join�� ��� �ٸ� ���̺��� �÷��� ����Ҽ� �ֱ� ������
SELECT �Ҽ� �ִ� �÷��� ������ ��������(���� Ȯ��)

���տ��� == ���� Ȯ��(���� ��������)

NATURAL JOIN 
    .�����Ϸ��� �� ���̺��� ����� �÷��� �̸� ���� ���
    .emp, dept ���̺��� detpno��� �����(������ �̸���, Ÿ�Ե� ����) ����� �÷��� ����
    .�ٸ� ANSI-SQL ������ ���ؼ� ��ü�� �����ϰ�. ���� ���̺�帣�� �÷����� �������� ������
    ����� �Ұ����ϱ� ������ ���󵵴� �ټ� ����.
SELECT *
FROM emp NATURAL JOIN dept;

���� �Ϸ����ϴ� �÷��� ���� �����������
SELECT *
FROM emp NATURAL JOIN dept;

ORACLE ���� ������ ANSI ����ó�� ������������ 
����Ŭ ���� ����
1. ������ ���̺� ����� FROM ���� ����ϸ� �����ڴ� �ݷ�(,)
2. ����� ������ WHERE���� ����ϸ� �ȴ� (ex : WHERE emp.deptno = dept.deptno

SELECT *
FROM emp, dept
WHERE emp.deptno = dept.deptno;

deptno�� 10���� �����鸸 dept ���̺�� �����Ͽ� ��ȸ

SELECT *
FROM emp, dept
WHERE emp.deptno = dept.deptno
AND emp. deptno = 10; -- dept.deptno�� ��� ����.

ANSI-SQL : JOIN with USING

.JOIN �Ϸ��� ���̺� �̸��� ���� �÷��� 2�� �̻��϶�
.�����ڰ� �ϳ��� �÷����θ� �����ϰ� ������ ���� �÷����� ���.

SELECT *
FROM emp JOIN dept USING (deptno)

--�긦 ���� ������.
--ANSI-SQL : JOIN with ON
    .���� �Ϸ��� �����̺� �÷����� �ٸ��� 
    .ON���� ����� ������ ���;
    
SELECT *
FROM emp JOIN dept ON(emp.deptno = dept.deptno);

ORACLE �������� �� SQL�� �ۼ�

SELECT *
FROM emp, dept
WHERE emp.deptno =dept.deptno;    -- �̰� ���� �߿��� ����~

JOIN�� ������ ����
SELF JOIN : �����Ϸ��� ���̺��� ���� ������
EMP ���̺��� ������ ������ ������ ��Ÿ���� ������ ������ mgr �÷��� �ش������� ������ ����� ����.
�ش� ������ �������� �̸��� �˰���� ��

ANSI-SQL�� SQL ���� :  SELF JOIN
�����Ϸ��� �ϴ� ���̺� EMP(����),EMP(������ ������)
����� �÷�: ����.MGR =������.EMPNO
==> ���� �÷� �̸��� �ٸ���(MER, EMPNO)
==NATURAL JOIN, JOIN WITH USING�� ����� �Ұ����� ����
==> JOIN with on

ANSI-SQL�� �ۼ�
SELECT *
FROM emp e JOIN emp m On(e.empno= m.mgr);         --���̺��� ���� ���� ���ΰ������,��Ī �־ ��������ߵ� �ȱ׷� �νĸ��� ��û�� ����



NONEUQUI JOIN :����� ������ =�� �ƴҶ� 

SELECT emp.empno, emp.ename, emp.sal, salgrade.grade
FROM emp JOIN salgrade ON (emp.sal BETWEEN salgrade.losal AND salgrade.hisal);

==> ORACLE ���� �������� ����

SELECT *
FROM emp, salgrade
WHERE emp.sal BETWEEN salgrade.losal AND salgrade.hisal;


�ǽ� join0 P.202

SELECT emp.empno,emp.ename,emp. deptno,dept. dname
FROM emp, dept
where emp.deptno=dept.deptno
ORDER BY deptno;

 SELECT emp.empno,emp.ename,emp. deptno,dept. dname
FROM emp JOIN dept ON (emp.deptno=dept.deptno)
ORDER BY deptno; 

SELECT emp.empno, emp.ename, dept.deptno,dept.dname
FROM emp, dept
where emp.deptno=dept.deptno
    AND dept.deptno IN(10, 30);


SELECT emp.empno, emp.ename,sal ,dept.deptno,dept.dname
FROM emp, dept
where emp.deptno=dept.deptno
AND  emp.sal>2500
ORDER BY deptno;

select lprod.lprod_gu,lprod.lprod_nm ,prod.prod_id,prod.prod_name
FROM prod, lprod
where prod.prod_lgu=lprod.lprod_gu;


--������ ����(�ǽ� join0_3)
SELECT emp.empno,emp.ename,emp.sal,dept.deptno,dept.dname
FROM emp, dept
WHERE emp.deptno=dept.deptno
AND emp.sal>2500
AND emp.empno>7600;

--������ ���� (�ǽ� join0_4)
SELECT emp.empno,emp.ename,emp.sal,dept.deptno,dept.dname
FROM emp, dept
WHERE emp.deptno=dept.deptno
AND emp.sal>2500
AND emp.empno>7600
AND dept.dname='RESEARCH';
