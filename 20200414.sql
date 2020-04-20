/* SQL 주석*/
--한줄 주석 -->JAVA의 한줄 주석 //

SELECT * --모든 컬럼의 정보를 조회
FROM prod; --prod 테이블에서~ 


--특정 컬럼에 대해서만 조회 :SELECT 컬럼1, 컬럼2....

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


SQL 실행하는 방법
1. 실행하려는 SQL을 선택하여 (shift) crtl +enter ;
2. 실행하려는 SQL문장 아무곳에서나 프롬프트를 위치시키고 crtl + enter;
* 단 위아래 다른 sql 문장이 있을 경우 ; 에의해 sql이 구분되지 못할경우 실행되지 못함!