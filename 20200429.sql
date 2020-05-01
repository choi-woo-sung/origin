OUTER JOIN
테이블 연결 조건이 실패해도, 기준으로 삼은 테이블의 컬럼은 조회가 되도록 하는 조인 방식
<==> INNER JOIN(우리가 지금까지 배운 방식)
LEFT OUTER JOIN : 기준이 되는 테이블이 JOIN 키워드 왼쪽에 위치
RIGHT OUTER JOIN: 기준이 되는 테이블이 JOIN 키워드 오른쪽에 위치
FULL OUTER JOIN : LEFT OUTER JOIN +RIGHT OUTER JOIN -(중복되는 데이터가 한건만 남도록 처리)

emp 테이블의 컬럼중 mgr 컬럼을 통해 해당 직원의 관리자 정보를 찾아갈 수 있다.
하지만 KING 직원의 경우 상급자가 없기 떄문에 일반적인 inner 조인 처리시 
조인에 실패하기 때문에 KING을 제외한 13건의 데이터만 조회가 됨.

INNER 조인 복습

상급자 사번, 상급자 이름, 직원 사번, 직원 이름

 조인이 성공해야지만 데이터가 조회 된다.
 ==>king의 상급자 정보(mgr)는 NULL이기 때문ㅇ ㅔ조인에 실패하고
 KING의 정보는 나오지않는다.
 
SELECT m.empno, m.ename, e.empno, e.ename
FROM emp e , emp m
WHERE e.mgr = m.empno;



SELECT m.empno, m.ename, e.empno, e.ename
FROM emp e JOIN emp m on(e.mgr = m.empno); 

위의 쿼리를 OUTER 조인으로 변경
( KING 직원이 조인에 실패해도 본인 정보에 대해서는 나오도록, 하지만 상급자 정보는 없기 때문에 나오지 않는다)

ANSI-SQL : OUTER
SELECT m. empno, m.ename, e.empno, e.ename
FROM emp e LEFT OUTER JOIN emp m ON (e.mgr =m.empno);

SELECT m. empno, m.ename, e.empno, e.ename
FROM emp m RIGHT OUTER JOIN emp e ON (e.mgr =m.empno);

ORACLE -SQL : OUTER

oracle join
1.FROM 절에 조인할 테이블 기술(콤마로 구분)
2. WHERE절에 조인 조건을 기술
3. 조인 컬럼(연결고리) 중 조인이 실패하여 데이터가 없는 쪽의 컬럼에 (+)를 붙여 준다
==> 마스터 테이블 반대편 쪽 테이블의 컬럼
SELECT m.empno, m.ename, e.empno, e.ename
FROM emp e, emp m
WHERE e.mgr =m.empno(+);
 --이리저리 붙여봅시다 껄껄


OUTER조인의 조건 기술 위치에 따른 결과 변화

직원의 상급자 이름, 아이디를 포함해서 조회
단, 직원의 소속부서가 10번에 속하는 직원들만 한정해서;


조건을 on절에 기술했을때
SELECT m. empno, m.ename, e.empno, e.ename
FROM emp e LEFT OUTER JOIN emp m ON (e.mgr =m.empno AND e.deptno =10);

조건을 WHERE절에 기술했을때
SELECT m. empno, m.ename, e.empno, e.ename , e.deptno
FROM emp e LEFT OUTER JOIN emp m ON (e.mgr =m.empno )
WHERE e.deptno =10;  --INNER JOIN으로 된거야


OUTER 조인을 하고 싶은 것이라면 조건을 NO절에 기술하는게 맞다.

SELECT m. empno, m.ename, e.empno, e.ename , e.deptno
FROM emp e, emp m 
WHERE e.mgr =m.empno(+)  
















-------------------------나는 멍텽이 야이야이~ 빠라바라빠라빠밤 아이킨--

SELECT*
FROM buyprod;

--(+)는 모든 조건에 넣어야됩니다 촤라라


--OUTER JOIN 1
SELECT buy_date, buy_prod, prod.prod_id, prod_name ,buy_qty
FROM prod LEFT OUTER JOIN buyprod ON (buyprod.buy_prod = prod.prod_id AND buyprod.buy_date=TO_DATE('2015/01/25','YYYY/MM/DD'));


--OUTER JOIN 2
SELECT TO_DATE('2015/01/25','YYYY/MM/DD'), buy_prod, prod.prod_id, prod_name ,buy_qty
FROM prod,buyprod
WHERE buyprod.buy_prod(+) = prod.prod_id
AND buy_date(+)=TO_DATE('2015/01/25','YYYY/MM/DD');


--OUTER JOIN 3
SELECT TO_DATE('2015/01/25','YYYY/MM/DD'), buy_prod, prod.prod_id, prod_name ,  NVL(buy_qty,0)
FROM prod,buyprod
WHERE buyprod.buy_prod(+) = prod.prod_id
AND buy_date(+)=TO_DATE('2015/01/25','YYYY/MM/DD');
     
--OUTER JOIN4
select product.PID ,PNM, NVL(cid,1) cid ,NVL(day,0) day,NVL(cnt,0) cnt
FROM cycle, product
WHERE product.pid =cycle.pid (+)
    AND cycle.cid(+) = 1;

SELECT product.PID ,PNM, NVL(cid,1) ,NVL(day,0),NVL(cnt,0)
FROM cycle RIGHT OUTER JOIN product ON(product.pid = cycle.pid AND CYCLE.CID = 1 );

-- OUTER JOIN 5





FROM(select product.PID ,PNM, NVL(cycle.cid,1),cnm , day, cnt
FROM cycle, product,customer)
WHERE product.pid =cycle.pid(+) 
    AND customer.cid(+) = cycle.cid
    AND cycle.cid(+) = 1
ORDER BY  product.PID DESC;
    






----------------------------------------------------      
      
      
      
      
CROSS JOIN
조인 조건을 기술하지 않은 경우
모든 가능한 행의 조합으로 결과가 조회된다.


emp 14* dept 4= 56;

ANSI -SQL
SELECT *
FROM emp CROSS JOIN dept;

ORACLE(조인 테이블만 기술하고 where 절에 조건을 기술하지않는다)
SELECT *
FROM emp, dept ;

SELECT *
FROM customer CROSS JOIN product;

SELECT *
FROM emp, dept;



서브쿼리
WHERE : 조건을 만족하는 행만 조회되도록 제한
SELECT *
FROM emp
WHERE 1=1
OR  1!=1;
TRUE OR FALSE ==> TRUE

서브 <==> 메인
서브쿼리는 다른 쿼리 안에서 작성된 쿼리
서브쿼리 가능한 위치

1.SELECT
SCALAR SUB QUERY
* 스칼라 서브쿼리는 조회되는 행이 1행이고, 컬럼이 한개의 컬럼이어야 한다)
EX) DUAL테이블

2.FROM
    INLINE-VIEW  
    SELECT 쿼리를 괄호로 묶은것
    
3.WHERE
SUB QUERY
WHERE절에 사용된 쿼리

SMITH가 속한 부서에 속한 직원들은 누가 있을까?

1. SMITH가 속한 부서가 몇번이지?
2. 1번에서 알아낸 부서번호가 속하는 직원을 조회

==> 독립적인 2개의 쿼리를 각각 실행
    두번쨰 쿼리는 첫번째의 쿼리의 결과에 따른 값을 다르게 가져와야 한다.
    (SMITH(200) => WARD(30) ==> 두번째 쿼리 작성시 10번에서 30번으로 조건을 변경
    ==> 유지보수 측면에서 좋지)
    
SELECT deptno --20
FROM emp
WHERE ename ='SMITH';

SELECT*
FROM emp
WHERE deptno =20;

서브쿼리를 통한 쿼리 통합

SELECT*
FROM emp
WHERE deptno =(SELECT deptno 
                FROM emp
    
                WHERE ename =:ename);
   
                
 SUB2]
 SELECT COUNT(*)               
FROM emp               
WHERE SAL> (SELECT AVG(sal)
FROM emp);
