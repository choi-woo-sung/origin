

과제1) fastfood 테이블과 테이블을 이용하여 다음과 같이 조회 되도록 SQL 작성

1. 시도 시군구별 도시발전 지수를 구하고 

SELECT   SIDO , SIGUNGU , ROUND(SAL/PEOPLE , 2)
FROM TAX;





2. 시도 시군구별 도시발전에 순위를 구하고

SELECT ROWNUM RN ,a.*

FROM (SELECT   SIDO , SIGUNGU , ROUND(SAL/PEOPLE , 2) AVG
FROM TAX
ORDER BY AVG DESC)a;



 3. 도시발전지수와 인당 신고액 순위가 같은 데이터 끼리 조인하여 아래와 같이 컬럼이 조회되도록 SQL 작성
    
순위, 햄버거 시도, 햄버거 시군구, 햄버거 도시발전지수, 국세청 시도, 국세청 시군구, 국세청 연말정산 금액1인당 신고액



SELECT B.rn, A.SIDO, A.SIGUNGU , A.city_idx , B.SIDO , B.SIGUNGU , B.AVG
FROM 
(SELECT	 rownum rn, a.sido, a.sigungu, a.city_idx 

FROM	(SELECT bk.sido , bk.sigungu , bk.cnt , kfc.cnt , mac.cnt , lot.cnt ,
	 ROUND((bk.cnt + kfc.cnt + mac.cnt ) / lot.cnt ,2 ) city_idx 
	
	FROM
	(SELECT sido , sigungu, count(*) cnt
	FROM fastfood
	WHERE gb = '버거킹'
	GROUP BY sido , sigungu ) bk,
	
	(SELECT sido , sigungu, count(*) cnt
	FROM fastfood
	WHERE gb = 'KFC'
	GROUP BY sido , sigungu ) kfc ,
	
	(SELECT sido , sigungu, count(*) cnt
	FROM fastfood
	WHERE gb = '맥도날드'
	GROUP BY sido , sigungu )mac,
	
	(SELECT sido , sigungu, count(*) cnt
	FROM fastfood
	WHERE gb = '롯데리아'
	GROUP BY sido , sigungu ) lot
	 
	WHERE 
	
	bk.sido = kfc.sido
    
	AND bk.sido = mac.sido
	
	AND bk.sido = lot.sido
	
	AND bk.sigungu = lot.sigungu
	
	AND bk.sigungu = mac.sigungu
	
	AND bk.sigungu = kfc.sigungu
	
	order by city_idx DESC)a) A ,
    
    (SELECT ROWNUM rn ,a.*

FROM (SELECT   SIDO , SIGUNGU , ROUND(SAL/PEOPLE , 2) AVG
FROM TAX
ORDER BY AVG DESC)a) B

WHERE
B.rn =A.rn(+)

ORDER BY B.rn ;
    
    
    차집합했을때 데이터 검증 할수있다.
	
	
	
	
	
	
	
	
	





과제(2)

SELECT ROWNUM rank, a.*
FROM
(SELECT sido , sigungu ,ROUND((kfc + mac + bk)/lot , 2) city_idx
FROM
(SELECT sido , sigungu ,
        NVL(SUM(CASE WHEN gb ='롯데리아' THEN 1 END),1) lot,
        NVL(SUM(CASE WHEN gb ='맥도날드' THEN 1 END),0) mac,
        NVL(SUM(CASE WHEN gb ='KFC' THEN 1 END),0) kfc,
        NVL(SUM(CASE WHEN gb ='버거킹' THEN 1 END),0) bk

FROM fastfood
WHERE gb IN ( '버거킹' , 'KFC' , '맥도날드', '롯데리아')

GROUP BY SIDO , SIGUNGU)
ORDER BY city_idx desc)a;






SELECT sido , sigungu ,gb , (DECODE(GB , '롯데리아', '1')   ) lot , ( DECODE(GB , 'KFC', '1') KFC
FROM fastfood
WHERE gb IN('버거킹 ' , 'KFC' , '맥도날드 ' , '롯데리아');
--ORDER BY sido , sigungu , gb;





3번 과제]

CASE 두번만 사용


SELECT 시도 , 시군구 , (KFC 스칼라 서브 쿼리 ) , (버거킹 스칼라 서브쿼리 ), (...)
FROM ...










