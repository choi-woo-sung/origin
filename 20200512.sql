EXPLAIN PLAN FOR
SELECT *
FROM emp
WHERE empno=7369;

SELECT ROWID, emp.*
FROM emp;

ROW ID : 테이블 행이 저장된 물리주소
        (java -인스턴스 변수
         c   - 포인터 )


인덱스라는 개체는 알아서 정렬이되고, 아까전에 했었던 이진트리 같은경우로 작동한다.

index rebuild 트리가 균일한 깊이를 갖게끔 다시 만들어요.


사용자에 의한 ROWID 사용

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



INDEX 실습

emp 테이블에 어제 생성한 pk_emp PRIMARY KEY 제약조건을 삭제

ALTER TABLE emp DROP CONSTRAINT pk_emp;


인덱스 없이 empno값을 이용하여 데이터 조회
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



2. emp 테이블에 empno 컬럼으로 PRIMARY KEY 제약조건 생성한 경우
    (empno컬럼으로 생성된 unique 인덱스가 존재)
 
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


3. 2번 SQL을 변형(SELECT 컬럼을 변형)


2번
SELECT *
FROM emp
WHERE empno= 7782;

3번
EXPLAIN PLAN FOR

SELECT empno
FROM emp
WHERE empno =7782;

SELECT *

FROM TABLE(dbms_xplan.display);
(인덱스만 읽고서도 끝낼수 있다)  인덱스가 있으면 똒똒해지는구나~




4번 empno 컬럼에 non-unique 인덱스가 생성되어 있는 경우

ALTER TABLE emp DROP CONSTRAINT pk_emp;  // 유니크 인덱스도 사라졌어.

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
|*  2 |   INDEX RANGE SCAN          | IDX_EMP_01 |     1 |       |     1   (0)| 00:00:01 |  // 다읽었어.
------------------------------------------------------------------------------------------
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
   2 - access("EMPNO"=7782)
   
   
5. emp 테이블의 job 값이 일치하는 데이터를 찾고 싶을 때

보유 인덱스
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


idx_emp_01의 경우 정렬이 empno컬럼 기준으로 되어 있기 때문에 job 컬럼을 제한하는 
SQL에서는 효과적으로 사용할 수가 없기 때문에 TABLE 전체 접근하는 형태의 실행계획이 세워짐

==> idx_emp_02 (job) 생성을 한후 실행계획 비교

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

6. emp테이블에서 job = 'MANAGER' 이면서 ename이 c로 시작하는 사원만 조회(전체 컬럼 조회)

인덱스 현황
idx_emp_01 : empno
idx_emp_02 : job

EXPLAIN PLAN FOR
SELECT *
from emp
WHERE job = 'MANAGER'
AND ename LIKE 'C%';  //이건 테이블을 체크를 해봐야한다 .


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
  
  
  
  7. emp테이블에서 job = 'MANAGER' 이면서 ename이 c로 시작하는 사원만 조회(전체 컬럼 조회)

단 새로운 인덱스 추가 : IDX_emp_03 : job, ename   //이거는 job과 ename을 읽고. rowid를 불러온다.

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
 
   7. emp테이블에서 job = 'MANAGER' 이면서 ename이 c로 끝나는 사원만 조회(전체 컬럼 조회)
   
   
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
       
       //인덱스에서 비교하기때문에 2번이 아닌 3번트리를 탑니다.
 ===============================================================================================================
 
 RULE BASED OPTIMIZER :규칙기반 최적화기 (9i) ==> 수동 카메라
 
 COST BASED OPTIMIZER :비용기반 최적화기 (10g) ==> 자동 카메라
 
 ================================================================================================================
 
 9. 복합 컬럼 인덱스의 컬럼 순서의 중요성
 인덱스 구성 컬럼 : (job, ename) VS (ename, job)
 
 *** 실행해야 하는 sql에 따라서 인덱스 컬럼 순서를 조정해야한다.
 
 
 실행 sql : job= manager ,  ename이 c로 시작하는 사원만 조회(전체 컬럼 조회)
 
 기존 인덱스 삭제 : idx_emp_03;
 DROP INDEX idx_emp_03;
 
 인덱스 신규 생성
 
 idx_emp_04 : ename, job
 
 
 CREATE INDEX idx_emp_04 ON emp (ename, job);
 
 
 
 인덱스 현황
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
       filter("JOB"='MANAGER' AND "ENAME" LIKE ' C%')??  META DATA의 차이
       =================================================================================================
 
 
 
 
 



idx_emp_01 삭제(pk_emp )
DROP INDEX idx_emp_01;

 조인에서의 인덱스
 emp 테이블에 empno 컬럼을 PRIMARY KEY로 제약 조건 생성
 PK_emp: empno
 ALTER TABLE emp ADD CONSTRAINT pk_emp PRIMARY KEY (empno);
 
 
  인덱스 현황
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
   
   



