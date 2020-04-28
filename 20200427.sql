SELECT COUNT(*) cnt

FROM( SELECT deptno
        FROM emp
        GROUP BY deptno);
        
DBMS : DataBase Management System

==>db
RDBMS : Relational DataBase Management System
==>관계형 테이터베이스 관리 시스템
    80년 초반
    
    
JOIN 문법의 종류 
ANSI - 표준
벤더사의 문법(ORACLE)

Join의 경우 다른 테이블의 컬럼을 사용할수 있기 떄문에
SELECT 할수 있는 컬럼의 개수가 많아진다(가로 확장)

집합연산 == 세로 확장(행이 많아진다)

NATURAL JOIN 
    .조인하려는 두 테이블의 연결고리 컬럼의 이름 같을 경우
    .emp, dept 테이블에는 detpno라는 공통된(동일한 이름의, 타입도 동일) 연결고리 컬럼이 존재
    .다른 ANSI-SQL 문법을 통해서 대체가 가능하고. 조인 테이블드르이 컬럼명이 동일하지 않으면
    사용이 불가능하기 때문에 사용빈도는 다소 낮다.
SELECT *
FROM emp NATURAL JOIN dept;

조인 하려고하는 컬럼을 별도 기술하지않음
SELECT *
FROM emp NATURAL JOIN dept;

ORACLE 조인 문법을 ANSI 문법처럼 세분하지않음 
오라클 조인 문법
1. 조인할 테이블 목록을 FROM 절에 기술하며 구분자는 콜론(,)
2. 연결고리 조건을 WHERE절에 기술하면 된다 (ex : WHERE emp.deptno = dept.deptno

SELECT *
FROM emp, dept
WHERE emp.deptno = dept.deptno;

deptno가 10번인 직원들만 dept 테이블과 조인하여 조회

SELECT *
FROM emp, dept
WHERE emp.deptno = dept.deptno
AND emp. deptno = 10; -- dept.deptno도 상관 없다.

ANSI-SQL : JOIN with USING

.JOIN 하려는 테이블간 이름이 같은 컬럼이 2개 이상일때
.개발자가 하나의 컬럼으로만 조인하고 싶을때 조인 컬럼명을 기술.

SELECT *
FROM emp JOIN dept USING (deptno)

--얘를 많이 볼꺼얌.
--ANSI-SQL : JOIN with ON
    .조인 하려는 두테이블간 컬럼명이 다를떄 
    .ON절에 연결고리 조건을 기술;
    
SELECT *
FROM emp JOIN dept ON(emp.deptno = dept.deptno);

ORACLE 문법으로 위 SQL을 작성

SELECT *
FROM emp, dept
WHERE emp.deptno =dept.deptno;    -- 이게 제일 중요햇 하하~

JOIN의 논리적인 구분
SELF JOIN : 조인하려는 테이블이 서로 같을때
EMP 테이블의 한행은 직원의 정보를 나타내고 직원의 정보중 mgr 컬럼은 해당직원의 관리자 사번을 관리.
해당 직원의 관리자의 이름을 알고싶을 때

ANSI-SQL로 SQL 조인 :  SELF JOIN
조인하려고 하는 테이블 EMP(직원),EMP(직원의 관리자)
연결고리 컬럼: 직원.MGR =관리자.EMPNO
==> 조인 컬럼 이름이 다르다(MER, EMPNO)
==NATURAL JOIN, JOIN WITH USING은 사용이 불가능한 형태
==> JOIN with on

ANSI-SQL로 작성
SELECT *
FROM emp e JOIN emp m On(e.empno= m.mgr);         --테이블이 같은 셀프 조인같은경우,별칭 넣어서 구분져줘야되 안그럼 인식못해 멍청한 컴터



NONEUQUI JOIN :연결고리 조건이 =이 아닐때 

SELECT emp.empno, emp.ename, emp.sal, salgrade.grade
FROM emp JOIN salgrade ON (emp.sal BETWEEN salgrade.losal AND salgrade.hisal);

==> ORACLE 조인 문법으로 변경

SELECT *
FROM emp, salgrade
WHERE emp.sal BETWEEN salgrade.losal AND salgrade.hisal;


실습 join0 P.202

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


--데이터 결합(실습 join0_3)
SELECT emp.empno,emp.ename,emp.sal,dept.deptno,dept.dname
FROM emp, dept
WHERE emp.deptno=dept.deptno
AND emp.sal>2500
AND emp.empno>7600;

--데이터 결합 (실습 join0_4)
SELECT emp.empno,emp.ename,emp.sal,dept.deptno,dept.dname
FROM emp, dept
WHERE emp.deptno=dept.deptno
AND emp.sal>2500
AND emp.empno>7600
AND dept.dname='RESEARCH';
