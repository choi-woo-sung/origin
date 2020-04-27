NULL 처리하는 방법 (4가지 중에 본인 편한걸로 하나 이상은 기억)

NVL, NVL2...

condition :CASE, DECODE

실행계획 : 실행계획이 뭔지 보는순서;

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



집합 A= {10, 15, 18, 23, 24, 25, 29, 30, 35, 37}
Prime Number 소수 : {23, ,29, 37} : COUNT-3, MAX-37, MIN-23, AVG-29.66, SUM-89
            비소수: {10,15,18,24,25,35

GROUP FUNCTION
여러행의 데이터를 이용하여 같은 그룹끼리 묶어 연산하는 함수
여러행을 입력받아 하나의 행으로 결과가 묶인다.
EX: 부서별 급여 평균
    emp 테이블에는 14명의 직원이 있고, 14명의 직원은 3개의 부서 (10, 20, 30)에 속해 있다.
    부서별 급여 평균은 3개의 행으로 결과가 반환된다.
    GROUP BY 적용시 주의사항: SELECT 기술할수있는 컬럼에 제한됨 --GROUPBY 절에 기술한 컬럼들만 쓸수있다.
    SELECT 그룹핑 기준 컬럼, 그룹함수
    FROM 테이블
    GROUP BY 그룹핑 기준 컬럼
    [ORDER BY];
   
   SELECT deptno,
         MAX(sal), --부서별로 가장 높은 급여값 
         MIN(sal),
         ROUND(AVG(sal),2),
         AVG(sal), -- 부서별 급여 평균
         SUM(sal), -- 부서별 급여합
       COUNT(sal),  -- 부서별 급여 건수(sal 컬럼의 값이 null이 아닌 row의 수)
       COUNT(*),    --부서별 행의수
    COUNT(mgr)
       FROM emp
       GROUP BY deptno;
       
       * 그룹함수를 통해 부서번호 별 가장 높은 급여를 구할수는 있지만
        가장 높은 급여를 받는 사람의 이름을 알 수 는 없다
        ==> 추후 WINDOW FUNCTION을 통해 해결가능       
       
       emp 테이블의 그룹기준을 부서번호가 아닌 전체 직원으로 설정하는 방법
       
   SELECT
         MAX(sal), --가장 높은 급여값 
         MIN(sal),
         ROUND(AVG(sal),2), --전체직원의 급여 평균
         AVG(sal), --  급여 평균
         SUM(sal), --  전체직원의 급여합
       COUNT(sal),  -- 전체 직원의 급여 건수(sal 컬럼의 값이 null이 아닌 row의 수)
       COUNT(*),   --전체 행의수
        COUNT(mgr) --mgr 컬럼이 null이 아닌 건수
       FROM emp;

2020.04.27일 발표때 정답확인
GROUP BY 절에 기술된 컬럼이 
    SELECT 절에 나오지않으면 ????
    
GROUP BY절에 기술되지않은 컬럼이
    SELECT절에 나오면 ????


   --부서별로 가장 높은 급여 값
    SELECT deptno, MAX(sal)
    FROM emp
    GROUP BY  deptno;
    
    SELECT deptno, sal  --그룹핑 기준 컬럽을 맞춰야한다. 단 함수를 이용하면 상관없다.
    FROM emp
    ORDER BY deptno;
    
  GROUP함수 연산시 NULL값은 제외가 된다.
  30번 부서에는 NULL값을 갖는 행이 있지만, SUM(comm)의 값이 정상적으로 계산된걸 확인 할수 있다.
  
    SELECT deptno, SUM(comm)
    FROM emp
    GROUP BY deptno;
    
    
    10, 20번 부서의 SUM(COMM)컬럼이 NULL이 아니라 0이 나오도록 NULL 처리
    * 특별한 사유가 아니면 그룹함수 계산 결과에 NULL처리를 하는것이 성능상 유리
     SELECT deptno, SUM(NVL(comm,0))  -->COMM커럼에 SUM 그룹함수를 적용하고 최종결과에 NVL을 적용(1회 호출)
                    NVL(SUM(COMM),0) --<모든 COMM컬럼에 NVL 함수를 적용후(해당 그룹의 ROW수 만큼 호출) SUM 그룹함수 적용
    FROM emp
    GROUP BY deptno;
    
    
single row 함수는 where절에 기술할수 있지만
multi row 함수(group 함수)는 where절에 기술할수 없고
GROUP BY절 이후 HAVING 절에 별도로 기술

single row 함수는 WHERE 절에서 사용가능
SELECT*
FROM emp
WHERE LOWER(ename) = 'smith';

부서별 급여 합이 5000이 넘는 부서만 조회
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



-- emp테이블을 이용하여 다음을 구하시오 직원의 입사 년월별로 몇명의 직원이 입사했는지 조회하는 쿼리를 작성하세요.

SELECT TO_CHAR(hiredate, 'YYYYMM') hire_yyyymm,
COUNT(*)
FROM emp
GROUP BY TO_CHAR(hiredate, 'YYYYMM')
ORDER BY TO_CHAR(hiredate, 'YYYYMM');


SELECT TO_CHAR(hiredate,'YYYY') ,
COUNT(*)
FROM emp
GROUP BY TO_CHAR(hiredate, 'YYYY');



grp6]전체 직원수를 구하는 쿼리

SELECT  COUNT(*) cnt
FROM dept


grp6] 직원이 속한 부서의 개수를 조회하는 쿼리를 작성하시오


SELECT
COUNT(COUNT(*))cnt
FROM emp
GROUP BY deptno;










