EXPLAIN PLAN FOR
SELECT *
FROM emp
WHERE empno=7369;

SELECT ROWID, emp.*
FROM emp;

ROW ID : ���̺� ���� ����� �����ּ�
        (java -�ν��Ͻ� ����
         c   - ������ )


�ε������ ��ü�� �˾Ƽ� �����̵ǰ�, �Ʊ����� �߾��� ����Ʈ�� �������� �۵��Ѵ�.

index rebuild Ʈ���� ������ ���̸� ���Բ� �ٽ� ������.


����ڿ� ���� ROWID ���

EXPLAIN PLAN FOR
SELECT *
FROM emp
WHERE ROWID = 'AAAE5xAAFAAAAETAAF';




SELECT *

FROM TABLE(dbms_xplan.display);


Plan hash value: 2949544139
 
--------------------------------------------------------------------------------------
| Id  | Operation                   | Name   | Rows  | Bytes | Cost (%CPU)| Time     |
--------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT            |        |     1 |    38 |     1   (0)| 00:00:01 |
|   1 |  TABLE ACCESS BY INDEX ROWID| EMP    |     1 |    38 |     1   (0)| 00:00:01 |
|*  2 |   INDEX UNIQUE SCAN         | PK_EMP |     1 |       |     0   (0)| 00:00:01 |
--------------------------------------------------------------------------------------

Predicate Information (identified by operation id):



Plan hash value: 1116584662
 
-----------------------------------------------------------------------------------
| Id  | Operation                  | Name | Rows  | Bytes | Cost (%CPU)| Time     |
-----------------------------------------------------------------------------------
|   0 | SELECT STATEMENT           |      |     1 |    38 |     1   (0)| 00:00:01 |
|   1 |  TABLE ACCESS BY USER ROWID| EMP  |     1 |    38 |     1   (0)| 00:00:01 |
-----------------------------------------------------------------------------------



INDEX �ǽ�

emp ���̺� ���� ������ pk_emp PRIMARY KEY ���������� ����

ALTER TABLE emp DROP CONSTRAINT pk_emp;


�ε��� ���� empno���� �̿��Ͽ� ������ ��ȸ
EXPLAIN PLAN FOR
SELECT *
FROM emp
WHERE empno = 7782;



SELECT *

FROM TABLE(dbms_xplan.display);



| Id  | Operation         | Name | Rows  | Bytes | Cost (%CPU)| Time     |
--------------------------------------------------------------------------
|   0 | SELECT STATEMENT  |      |     1 |    38 |     3   (0)| 00:00:01 |
|*  1 |  TABLE ACCESS FULL| EMP  |     1 |    38 |     3   (0)| 00:00:01 |
--------------------------------------------------------------------------
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
   1 - filter("EMPNO"=7782)



2. emp ���̺� empno �÷����� PRIMARY KEY �������� ������ ���
    (empno�÷����� ������ unique �ε����� ����)
 
 ALTER TABLE emp ADD CONSTRAINT pk_emp PRIMARY KEY(empno);   
    
    
EXPlAIN PLAN FOR
SELECT *
FROM emp
WHERE empno= 7782;


SELECT *

FROM TABLE(dbms_xplan.display);

--------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT            |        |     1 |    38 |     1   (0)| 00:00:01 |
|   1 |  TABLE ACCESS BY INDEX ROWID| EMP    |     1 |    38 |     1   (0)| 00:00:01 |
|*  2 |   INDEX UNIQUE SCAN         | PK_EMP |     1 |       |     0   (0)| 00:00:01 |
--------------------------------------------------------------------------------------
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
   2 - access("EMPNO"=7782)


3. 2�� SQL�� ����(SELECT �÷��� ����)


2��
SELECT *
FROM emp
WHERE empno= 7782;

3��
EXPLAIN PLAN FOR

SELECT empno
FROM emp
WHERE empno =7782;

SELECT *

FROM TABLE(dbms_xplan.display);
(�ε����� �а��� ������ �ִ�)  �ε����� ������ �Q�Q�����±���~




4�� empno �÷��� non-unique �ε����� �����Ǿ� �ִ� ���

ALTER TABLE emp DROP CONSTRAINT pk_emp;  // ����ũ �ε����� �������.

CREATE /*unique*/ INDEX idx_emp_01 on emp (empno);



EXPLAIN PLAN FOR

SELECT *
FROM emp
WHERE empno =7782; 


SELECT *

FROM TABLE(dbms_xplan.display);
 
 
------------------------------------------------------------------------------------------
| Id  | Operation                   | Name       | Rows  | Bytes | Cost (%CPU)| Time     |
------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT            |            |     1 |    38 |     2   (0)| 00:00:01 |
|   1 |  TABLE ACCESS BY INDEX ROWID| EMP        |     1 |    38 |     2   (0)| 00:00:01 |   
|*  2 |   INDEX RANGE SCAN          | IDX_EMP_01 |     1 |       |     1   (0)| 00:00:01 |  // ���о���.
------------------------------------------------------------------------------------------
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
   2 - access("EMPNO"=7782)
   
   
5. emp ���̺��� job ���� ��ġ�ϴ� �����͸� ã�� ���� ��

���� �ε���
idx_emp_01 : empno

EXPLAIN PLAN FOR
SELECT *
FROM emp
WHERE job = 'MANAGER';

SELECT *

FROM TABLE(dbms_xplan.display);


Plan hash value: 3956160932
 
--------------------------------------------------------------------------
| Id  | Operation         | Name | Rows  | Bytes | Cost (%CPU)| Time     |
--------------------------------------------------------------------------
|   0 | SELECT STATEMENT  |      |     3 |   114 |     3   (0)| 00:00:01 |
|*  1 |  TABLE ACCESS FULL| EMP  |     3 |   114 |     3   (0)| 00:00:01 |
--------------------------------------------------------------------------
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
   1 - filter("JOB"='MANAGER')


idx_emp_01�� ��� ������ empno�÷� �������� �Ǿ� �ֱ� ������ job �÷��� �����ϴ� 
SQL������ ȿ�������� ����� ���� ���� ������ TABLE ��ü �����ϴ� ������ �����ȹ�� ������

==> idx_emp_02 (job) ������ ���� �����ȹ ��

CREATE INDEX idx_emp02 ON emp (job) ;



EXPLAIN PLAN FOR
SELECT *
FROM emp
WHERE job = 'MANAGER';

SELECT *

FROM TABLE(dbms_xplan.display);


Plan hash value: 906082420
 
-----------------------------------------------------------------------------------------
| Id  | Operation                   | Name      | Rows  | Bytes | Cost (%CPU)| Time     |
-----------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT            |           |     3 |   114 |     2   (0)| 00:00:01 |
|   1 |  TABLE ACCESS BY INDEX ROWID| EMP       |     3 |   114 |     2   (0)| 00:00:01 |
|*  2 |   INDEX RANGE SCAN          | IDX_EMP02 |     3 |       |     1   (0)| 00:00:01 |  
-----------------------------------------------------------------------------------------
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
   2 - access("JOB"='MANAGER')
   
   
=====================================================================================================

6. emp���̺��� job = 'MANAGER' �̸鼭 ename�� c�� �����ϴ� ����� ��ȸ(��ü �÷� ��ȸ)

�ε��� ��Ȳ
idx_emp_01 : empno
idx_emp_02 : job

EXPLAIN PLAN FOR
SELECT *
from emp
WHERE job = 'MANAGER'
AND ename LIKE 'C%';  //�̰� ���̺��� üũ�� �غ����Ѵ� .


SELECT *

FROM TABLE(dbms_xplan.display);

=======================================================================================
Plan hash value: 906082420
 
-----------------------------------------------------------------------------------------
| Id  | Operation                   | Name      | Rows  | Bytes | Cost (%CPU)| Time     |
-----------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT            |           |     1 |    38 |     2   (0)| 00:00:01 |
|*  1 |  TABLE ACCESS BY INDEX ROWID| EMP       |     1 |    38 |     2   (0)| 00:00:01 |
|*  2 |   INDEX RANGE SCAN          | IDX_EMP02 |     3 |       |     1   (0)| 00:00:01 |
-----------------------------------------------------------------------------------------
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
   1 - filter("ENAME" LIKE 'C%')
   2 - access("JOB"='MANAGER')
  ====================================================================================== 
  
  
  
  7. emp���̺��� job = 'MANAGER' �̸鼭 ename�� c�� �����ϴ� ����� ��ȸ(��ü �÷� ��ȸ)

�� ���ο� �ε��� �߰� : IDX_emp_03 : job, ename   //�̰Ŵ� job�� ename�� �а�. rowid�� �ҷ��´�.

CREATE INDEX idx_emp_03 ON emp (job, ename);

EXPLAIN PLAN FOR
SELECT *
from emp
WHERE job = 'MANAGER'
AND ename LIKE 'C%';

 SELECT *

FROM TABLE(dbms_xplan.display);  

Plan hash value: 2549950125
 
------------------------------------------------------------------------------------------
| Id  | Operation                   | Name       | Rows  | Bytes | Cost (%CPU)| Time     |
------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT            |            |     1 |    38 |     2   (0)| 00:00:01 |
|   1 |  TABLE ACCESS BY INDEX ROWID| EMP        |     1 |    38 |     2   (0)| 00:00:01 |
|*  2 |   INDEX RANGE SCAN          | IDX_EMP_03 |     1 |       |     1   (0)| 00:00:01 |
------------------------------------------------------------------------------------------
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
   2 - access("JOB"='MANAGER' AND "ENAME" LIKE 'C%')
       filter("ENAME" LIKE 'C%')
       
 ===================================================================================================
 
   7. emp���̺��� job = 'MANAGER' �̸鼭 ename�� c�� ������ ����� ��ȸ(��ü �÷� ��ȸ)
   
   
 EXPLAIN PLAN FOR
SELECT *
from emp
WHERE job = 'MANAGER'
AND ename LIKE '%C';

  SELECT *
FROM TABLE(dbms_xplan.display);  

Plan hash value: 2549950125
 
------------------------------------------------------------------------------------------
| Id  | Operation                   | Name       | Rows  | Bytes | Cost (%CPU)| Time     |
------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT            |            |     1 |    38 |     2   (0)| 00:00:01 |
|   1 |  TABLE ACCESS BY INDEX ROWID| EMP        |     1 |    38 |     2   (0)| 00:00:01 |
|*  2 |   INDEX RANGE SCAN          | IDX_EMP_03 |     1 |       |     1   (0)| 00:00:01 |
------------------------------------------------------------------------------------------
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
   2 - access("JOB"='MANAGER')
       filter("ENAME" LIKE '%C' AND "ENAME" IS NOT NULL)
       
       //�ε������� ���ϱ⶧���� 2���� �ƴ� 3��Ʈ���� ž�ϴ�.
 ===============================================================================================================
 
 RULE BASED OPTIMIZER :��Ģ��� ����ȭ�� (9i) ==> ���� ī�޶�
 
 COST BASED OPTIMIZER :����� ����ȭ�� (10g) ==> �ڵ� ī�޶�
 
 ================================================================================================================
 
 9. ���� �÷� �ε����� �÷� ������ �߿伺
 �ε��� ���� �÷� : (job, ename) VS (ename, job)
 
 *** �����ؾ� �ϴ� sql�� ���� �ε��� �÷� ������ �����ؾ��Ѵ�.
 
 
 ���� sql : job= manager ,  ename�� c�� �����ϴ� ����� ��ȸ(��ü �÷� ��ȸ)
 
 ���� �ε��� ���� : idx_emp_03;
 DROP INDEX idx_emp_03;
 
 �ε��� �ű� ����
 
 idx_emp_04 : ename, job
 
 
 CREATE INDEX idx_emp_04 ON emp (ename, job);
 
 
 
 �ε��� ��Ȳ
 idx_emp_01 :empno
 idx_emp_02 :job
 idx_emp_03 :job, ename
  idx_emp_04 :ename, job
 
 
 EXPLAIN PLAN FOR
 SELECT *
 FROM emp
 WHERE job= 'MANAGER'
    AND ename LIKE ' C%';
 
 
 SELECT *

FROM TABLE(dbms_xplan.display);
 
 
 Plan hash value: 4077983371
 
------------------------------------------------------------------------------------------
| Id  | Operation                   | Name       | Rows  | Bytes | Cost (%CPU)| Time     |
------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT            |            |     1 |    38 |     2   (0)| 00:00:01 |
|   1 |  TABLE ACCESS BY INDEX ROWID| EMP        |     1 |    38 |     2   (0)| 00:00:01 |
|*  2 |   INDEX RANGE SCAN          | IDX_EMP_04 |     1 |       |     1   (0)| 00:00:01 |
------------------------------------------------------------------------------------------
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
   2 - access("ENAME" LIKE ' C%' AND "JOB"='MANAGER')
       filter("JOB"='MANAGER' AND "ENAME" LIKE ' C%')??  META DATA�� ����
       =================================================================================================
 
 
 
 
 



idx_emp_01 ����(pk_emp )
DROP INDEX idx_emp_01;

 ���ο����� �ε���
 emp ���̺� empno �÷��� PRIMARY KEY�� ���� ���� ����
 PK_emp: empno
 ALTER TABLE emp ADD CONSTRAINT pk_emp PRIMARY KEY (empno);
 
 
  �ε��� ��Ȳ
  pk_emp : empno
 idx_emp_02 :job
  idx_emp_04 :ename, job
  
  
  EXPLAIN PLAN FOR
  SELECT *
  FROM emp, dept
  WHERE emp.deptno =dept.deptno
  AND emp.empno=7788;
  
   SELECT *
FROM TABLE(dbms_xplan.display);  


 
----------------------------------------------------------------------------------------
| Id  | Operation                    | Name    | Rows  | Bytes | Cost (%CPU)| Time     |
----------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT             |         |     1 |    58 |     2   (0)| 00:00:01 |
|   1 |  NESTED LOOPS                |         |     1 |    58 |     2   (0)| 00:00:01 |
|   2 |   TABLE ACCESS BY INDEX ROWID| EMP     |     1 |    38 |     1   (0)| 00:00:01 |
|*  3 |    INDEX UNIQUE SCAN         | PK_EMP  |     1 |       |     0   (0)| 00:00:01 |
|   4 |   TABLE ACCESS BY INDEX ROWID| DEPT    |     4 |    80 |     1   (0)| 00:00:01 |
|*  5 |    INDEX UNIQUE SCAN         | PK_DEPT |     1 |       |     0   (0)| 00:00:01 |
----------------------------------------------------------------------------------------
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
   3 - access("EMP"."EMPNO"=7788)
   5 - access("EMP"."DEPTNO"="DEPT"."DEPTNO")
   
   



