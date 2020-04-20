table���� ��ȸ/ ���� ������ ����.

==> ORDER BY �÷��� ���Ĺ��,.......

ORDER BY �÷����� ��ȣ�� ���İ���

==>SELECT �÷��� ������ �ٲ�ų� �÷��߰����Ǹ� �����ǵ���� �������� ���� ���ɼ�������

SELECT�� 3���� �÷��� �������� ����

SELECT *
FROM emp
ORDER BY 3;

��Ī���� ���� 

�÷����ٰ� ������ ���� ���ο� �÷��� ����°��
SAL*DEPTNO SAL_DEPT

SELECT empno, ename, sal, deptno, sal*deptno sal_dept
FROM emp
ORDER BY SAL_dept;

SELECT*
FROM dept
ORDER BY dname ;

SELECT*
FROM dept
ORDER BY loc DESC;


���ͷ� 

  ����: ����
  ����: '����'
SELECT*
FROM emp
WHERE comm IS NOT NULL
AND comm!=0 
ORDER BY comm DESC,empno  ;


SELECT*
FROM emp
WHERE MGR IS NOT NULL
ORDER BY job ,empno DESC   ;

SELECT*
FROM emp
WHERE deptno IN( 10,30)
AND sal>1500
ORDER by ename DESC;

����¡ó���� �ϴ�����

1.�����Ͱ� �ʹ� �����ϱ�
- ��ȭ�鿡 ������ ��뼺�� ��������.
-���ɸ鿡�� ��������.

����Ŭ���� ����¡ ó�� ��� ==>ROWNUM

ROWNUM : SELECT ������� 1������ ���ʴ�� ��ȣ�� �ο����ִ� Ư�� KEYWORD

SELECT ROWNUM, empno,ename
FROM emp;

SELECT���� *ǥ���ϰ� �޸�Ʋ���� �ٸ�ǥ��(EX  ROWNUM)�� ��� �Ұ��
*�տ� ����̺� ���� ���� ���̺� ��Ī/��Ī�� ����ؾ��Ѵ�.

SELECT ROWNUM, * (x) e.*
FROM emp e;

����¡ ó���� ���� �ʿ��� ���� :������ ������(10)
1. ������ ������(10)
2. ������ ���� ����

1page : 1~10
2page : 11~20 (11~14)

1������ ����¡ ����
SELECT ROWNUM, empno, ename
FROM emp
WHERE ROWNUM BETWEEN 1 AND 10;

SELECT ROWNUM, empno, ename
FROM emp
WHERE ROWNUM BETWEEN 11 AND 20;


ROWNUM�� Ư¡
1. ORACLE���� ����

.�ٸ�DBMS�� ��� ����¡ ó���� ���� ������ Ű���尡 ����(LIMIT)
2. 1������ ���������� �д°�츸 ����
ROWNUM BETWEEN 1 AND 10 ==> 1~10
ROWNUM BETWEEN 11 AND 20==> 1~10�� ��Ŵ�ϰ� 11~20�� �ϱ���� �õ�

WHERE ������ ROWNUM�� ����� ��� ���� ����
ROWNUM BETWEEN 1 AND N;
ROWNUM<, <=N (1~N)

ROWNUM�� ORDER BY
SELECT ROWNUM,empno , ename
FROM emp
ORDER BY empno ;

SELECT ROWNUM,empno , ename
FROM emp
ORDER BY ename ;

ROWNUM�� ORDER BY ������ ����

SELECT =>ROWNUM => ORDER BY
ROWNUM�� ��������� ���� ������ �Ȼ��·� ROWNUM�� �ο��Ϸ��� IN-LINE VIEW�� ����ؾ��Ѵ�

** IN-LINE: ���� ������ߴ�.;


SELECT ROWNUM, a.*
FROM
(SELECT ROWNUM rn,a.*
FROM
(SELECT empno, ename
FROM emp
ORDER BY ename) a)a
WHERE rn BETWEEN 1 +(:Page - 1) * :Pagesize AND :Page * :Pagesize;

WHERE rn BETWEEN 1 AND 10  ;1PAGE
WHERE rn BETWEEN 11 AND 20 ;2PAGE
WHERE rn BETWEEN 21 AND 30 ;3Page

WHERE rn BETWEEN 1+(n-1)*10 AND pageSzie * n;n PAGE
1.�����������.
SELECT *
FROM
(SELECT empno , ename
FROM emp
ORDER BY ename);  

INLINE-VIEW�� �񱳸� ���� VIEW�� ���� ����(�����н� ,���߿� ���´�)

VIEW- ���� (view ���̺� -x)

DML - Data Manipulation Language : SELECT , INSERT, UPDATE DELETE
DDL - Date Definition   Language  : CREATE, DROP , MODIFY, RENAME

CREATE OR REPLACE VIEW emp_ord_by_ename AS
SELECT empno, ename
FROM emp
ORDER BY ename;

IN-LINE VIEW�� �ۼ�������
SELECT *
FROM (SELECT empno, ename
FROM emp
ORDER BY ename);

view�� �ۼ��� ����   -- inline view�� view�� �ۼ��� ������ �Ȱ��ƿ� ȣȣ
SELECT *
FROM emp_ord_by_ename;

emp ���̺� �����͸� �߰��ϸ�
in-line view, view�� ����� ������ ����� ��� ������ ������???

���� �ۼ��� ������ ã�ư���
BUG ??? : ����
���� ��ǻ�� : ������
������ ������ ���̿� ���� ������ �߻� ==> ������ ���ִ� ����(�����)
java : �����
sql :��������� ����.

����¡ ó�� ==> ����, ROWNUM
����, ROWNUM�� �ϳ��� �������� ������ ��� ROWNUM���� ������ �Ͽ�
���ڰ� ���̴� ����߻� ==> INLINE-VIEW
  ���Ŀ� ����  INLINE-VIEW
  ROWNUM�� ���� INLINE-VIEW
  SELECT*
  FROM
 ( SELECT ROWNUM rn, a.*
  FROM(SELECT empno, ename
  FROM emp
  ORDER BY ename) a)
WHERE rn BETWEEN 11 AND 20;

SELECT*
FROM
(SELECT ROWNUM rn,a.*
FROM
(SELECT empno,ename
FROM emp
ORDER BY ename ASC)a)
WHERE rn BETWEEN 11 AND 14

** �űԹ���
PROD ���̺��� PROD _LGU(��������), PROD_COST(��������)���� �����Ͽ�
����¡ ó�� ������ �ۼ��ϼ���
�� ������ ������� 5
���ε� ���� ����Ұ�
SELECT*
FROM(SELECT ROWNUM rn,a.*
FROM(SELECT*
FROM PROD
ORDER BY prod_lgu DESC,prod_cost)a)
WHERE rn BETWEEN 1 +(:Page - 1) * :Pagesize AND :Page * :Pagesize;




WHERER rn BETWEEN (:page-1)* :pageSize+1 AND :page* :pageSize;




