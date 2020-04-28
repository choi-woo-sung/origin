데이터 결합 (실습 join2)



SELECT  BUYER.BUYER_ID, BUYER.BUYER_NAME, PROD.PROD_ID, PROD.PROD_NAME
FROM prod , buyer
WHERE PROD.PROD_BUYER =BUYER.BUYER_ID;


SELECT  BUYER.BUYER_ID, BUYER.BUYER_NAME, PROD.PROD_ID, PROD.PROD_NAME
FROM prod , buyer
WHERE PROD.PROD_BUYER =BUYER.BUYER_ID;

SELECT COUNT(*)
FROM prod , buyer
WHERE PROD.PROD_BUYER =BUYER.BUYER_ID;

BUYER_NAME 별 건수 조회 쿼리 작성
BUYER_NAME, 건수

SELECT BUYER.BUYER_NAME, COUNT(*)
FROM prod , buyer
WHERE PROD.PROD_BUYER =BUYER.BUYER_ID
GROUP BY buyer.buyer_name;

SELECT  MEMBER.MEM_ID, MEMBER.MEM_NAME, PROD.PROD_ID,CART.CART_QTY
FROM  member, cart ,prod
WHERE MEMBER.MEM_ID=CART.CART_MEMBER
    AND CART.CART_PROD=PROD.PROD_ID;
 --ANSI로 바꾸기
SELECT  MEMBER.MEM_ID, MEMBER.MEM_NAME, PROD.PROD_ID,CART.CART_QTY
FROM  member JOIN cart ON(MEMBER.MEM_ID=CART.CART_MEMBER) 
             JOIN prod ON(cart.cart_prod =prod.prod_id);
cid : customer id
cnm : customer name
SELECT*
FROM customer;

pid : product id
pnm : produc name
SELECT *
FROM product;

cycle ; 애음주기
cid : 고객id
pid : 제품id
dat :  애음 요일 (일요일 -1  월요일-2 , 화요일-3..)
cnt : 수량
SELECT*
FROM cycle;

--join 04
SELECT *
FROM customer , cycle
WHERE customer.cid = cycle.cid
    AND customer.cid<3;
    --ansi join 04
    
SELECT cid,cnm, pid ,day, cnt
FROM customer NATURAL JOIN cycle
WHERE customer.cnm IN('brown' ,'sally');
    
    
    
    --join 05
SELECT customer.cid, customer.cnm, cycle.cid, cycle.pid, product.pnm,day, cycle.cnt   //count(*) null을 포함하지않는다
FROM customer , cycle , product
WHERE customer.cid = cycle.cid
    AND cycle.pid =product.pid
    AND customer.cid<3;
    
    --join 06
 SELECT customer.cid, customer.cnm,  cycle.pid, product.pnm, SUM(cnt) 
FROM customer , cycle , product
WHERE customer.cid = cycle.cid
    AND cycle.pid =product.pid
GROUP BY customer.cid, customer.cnm,  cycle.pid, product.pnm;
  
 -- join 07
SELECT cycle.pid, product.pnm ,  SUM(cnt) cnt
FROM product , cycle
WHERE product.pid = cycle.pid
GROUP BY cycle.pid ,product.pnm;
    
 -- join 08
 FROM jobs , employees
   
    
    