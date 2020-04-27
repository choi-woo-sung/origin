--파라미터로 yyyymm형식의  문자열을 사용하여 (ex: yyyymm =201912)해당 년월에 해당하는 일자수를 구해보세용



SELECT '201912' par,
TO_CHAR(LAST_DAY(TO_DATE('201912','YYYYMM')), 'DD') dt 
FROM dual;


SELECT TO_DATE(:yyyymm,'YYYYMM'),
        LAST_DAY(TO_DATE(:yyyymm,'YYYYMM')),
        TO_CHAR(LAST_DAY(TO_DATE(:yyyymm, 'YYYYMM')), 'DD')
FROM dual;
        
EXPLAIN PLAN FOR        
SELECT*
FROM emp
WHERE empno='7369';

SELECT *

FROM TABLE(DBMS_XPLAN.DISPLAY);

Plan hash value: 3956160932
 
 실행계획을 보는 순서(ID)
 *  들여쓰기 되어있으면 자식 오퍼레이션
 1. 위에서 아래로
  *  단 자식 오퍼레이션이 있으면 자식 부터읽는다
  
  1==> 0
--------------------------------------------------------------------------
| Id  | Operation         | Name | Rows  | Bytes | Cost (%CPU)| Time     |
--------------------------------------------------------------------------
|   0 | SELECT STATEMENT  |      |     1 |    38 |     3   (0)| 00:00:01 |
|*  1 |  TABLE ACCESS FULL| EMP  |     1 |    38 |     3   (0)| 00:00:01 |
--------------------------------------------------------------------------
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
   1 - filter("EMPNO"=7369)
   1 - filter(TO_CHAR("EMPNO")='7369') -- 다넣었다 나쁜놈!
------------------------------------------------------------------------------------------
--실행계획보는법이 중요한 오늘!
EXPLAIN PLAN FOR
SELECT *
FROM emp
WHERE TO_CHAR(empno) = '7369';

SELECT*
FROM TABLE(DBMS_XPLAN.DISPLAY);

EXPLAIN PLAN FOR 
SELECT*
FROM emp
WHERE empno = 7300+ '69';

SELECT*
FROM TABLE(DBMS_XPLAN.DISPLAY);

 --  1 - filter("EMPNO"=7369)숫자와 비교를 했다.
 
 --활용면에서 떨어진다
 
 SELECT ename, sal, TO_CHAR(sal, 'L009,999.00')
 FROM emp;
 
 NULL과 관련된 함수
 NVL
 NVL2
 NULLIF
 COALESCE
 
 왜 null 처리를 해야할까?
 NULL에 대한 연산결과는 NULL이다
 
 예를 들어서 emp 테이블에 존재하는 sal, comm 두개의 컬럼 값을 합한 값을 알고싶어서 
 다음과같이 SQL을 작성.
 
 SELECT empno, ename, sal, comm, sal +comm AS sal_plus_comm
 FROM emp;
 NLV(expr1, expr2)
 expr1이 null이면 expr2값을 리턴하고
 expr1이 null이 아니면 expr1을 리턴
 
 SELECT empno, ename , sal, comm, sal +NVL(comm,0) sal_plus_comm
 FROM emp;
 ==>null값을 0으로 치환하고 계산한다.
 
 REG_DT 컬럼이 NULL일 경우, 현재 날짜가 속한 월의 마지막 일자로 표현
 SELECT user id , usernm, NVL(reg_dt, LAST_DAY(sysdate)) reg_dt
 FROM users
 
 
 