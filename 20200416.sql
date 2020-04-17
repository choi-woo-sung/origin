/* SQL 주석*/
--한줄 주석 -->JAVA의 한줄 주석 //

SELECT * --모든 컬럼의 정보를 조회
FROM prod; --prod 테이블에서~ 


--특정 컬럼에 대해서만 조회 :SELECT 컬럼1, 컬럼2....
실습 select 1

SELECT prod_id, prod_name
FROM PROD;

Prod_id , prod_name컬럼만 prod 테이블에서 조회;

SELECT *
    
FROM lprod;
-----------------------------------
SELECT buyer_id, buyer_name
    
FROM buyer;
-----------------------------------
SELECT *
 
FROM cart;
---------------------------------------
SELECT mem_id,mem_pass,mem_name
   
FROM member;

=============================================================================================================================
SQL 실행하는 방법
1. 실행하려는 SQL을 선택하여 (shift) crtl +enter ;
2. 실행하려는 SQL문장 아무곳에서나 프롬프트를 위치시키고 crtl + enter;
* 단 위아래 다른 sql 문장이 있을 경우 ; 에의해 sql이 구분되지 못할경우 실행되지 못함!
--------------------------------------------------------------------------------
SQL 연산 : JAVA와 다르게 대입 X, 일반적 사칙연산
int b = 2; =대입 연산자, == 비교;

SQL 데이터 타입 : 문자 , 숫자 , 날짜(date)

users  테이블이 (4/14만들어 놓음) 존재
users 테이블의 모든 데이터를 조회;
날짜 타입에 대한 연산 : 날짜는 +, -연산 가능
date type +정수 : date에서 정수날 짜만큼 미래 날짜로 이동;
date type `정수 : date에서 정수날 짜만큼 과거 날짜로 이동;
SELECT userid, reg_dt ,reg_dt+5 atfer바부데이즈
FROM users;

컬럼 별칭 :기존 컬럼명을 변경하고 싶을때
syntax: 기존 컬럼명[as] , 별칭 명칭
별칭 명칭에 공백이 표현되어야 할 경우 더블 쿼테이션으로 묶는다
또한 오라클에서는 객체명을 대문자 처리하기떄문에 소문자로 별칭을 지정하기 위해서도
더블쿼테이션을 사용한다.
SELECT userid as id, userid pongpong, userid "네넹 구리"
FROM users;
===========================================================================================================================
실습 select 2

SELECT prod_id id,prod_name name
FROM prod;
---------------------------------------
SELECT lprod_gu gu ,lprod_nm nm 
FROM lprod;
---------------------------------------
SELECT buyer_id 바이어아이디,buyer_name 이름
FROM buyer;
---------------------------------------

문자열 연산(결합연산) : || (문자열 결함은 +연산자가 아니다)
STRING str = "hello";
str = str + ", world"' // str : hello world
SELECT /*user id + 'test' */  userid || 'test',   reg_dt +5 'test', 15
FROM users;
경 이름 축
SELECT ' 경' || userid || '축'
FROM users;
-------------------------------------
SELECT userid || usernm AS 킴취, userid , usernm
FROM users;
----------------------------------------
user_tables : oracle 관리하는 테이블 정보를 담고있는 테이블 (view) ==>data dictionary;
SELECT table_name
FROM user_tables ;
=============================================
SELECT 'select * FROM '||table_name||';' query
 
FROM user_tables;
=============================================

테이블의 구성 컬럼을 확인
1. tool(SQL developer)을 통해 확인
   테이블 -확인하고자 하는 테이블
   
2. SELECT *
   FROM table
   
3.DESC 
DESC emp;

4.data dicionary : user_tab_columns
SELECT *
FROM user_tab_columns;

지금까지 배운 SELECT 구문

조회하고자 하는 컬럼 기술 : SELECT
조회할 테이블 기술 :FROM
조회할 행을 제한하는 조건을 기술 :WHERE
WHERE 절에 기술한 조건이 참(TRUE)일떄 결과를 조회
Java의 비교연산 : a변수와 b변수의 값이 같은지 비교

int a = 5;
int b = 2;
a랑 b의 값이 같을때만 특정로직실행
if( a== b)

SELECT *
FROM users
WHERE userid = 'cony';

SELECT *
FROM users
WHERE 1=2;

emp테이블의 컬럼과 데이터 타입을 확인;

DESC emp
SELECT *
FROM emp;

emp : employee
empno : 사원번호
ename :사원이름
job : 담당 업무
mgr : 담당자(관리자)
hiredate: 입사일자
sal   : 급여 
comm : 성과급
deptno: 부서번호

SELECT *
FROM dept;

emp 테이블에서 직원이속한 부서번호가 30번보다 큰 부서에 속한 직원을 조회 ;

SELECT *
FROM emp
WHERE deptno > 10;
-------------------------------------------------------------------------
users 테이블에서 사용자 아이디가(userid)가 brown이 아닌 사용자를 조회.
SELECT * 
FROM users 
WHERE userid!='brown';
=========================================================================
SELECT *
FROM emp


SQL 리터럴
숫자: .... 20.,, 30,, 
문자: '바부' 
날짜: TO_DATE('날짜문자열','날짜 문자열의 형식');

1982년 1월 1일 이후에 입사한 직원만 조회. 
직원의 입사일자 : hiredate 컬럼
SELECT *
FROM emp
WHERE hiredate>=TO_DATE('19820101','YYYYMMDD');

*환경설정->데이터 베이스 -> NLS 날짜 형식 바꾸기 가능,