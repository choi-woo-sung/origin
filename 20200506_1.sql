

����1) fastfood ���̺�� ���̺��� �̿��Ͽ� ������ ���� ��ȸ �ǵ��� SQL �ۼ�

1. �õ� �ñ����� ���ù��� ������ ���ϰ� 

SELECT   SIDO , SIGUNGU , ROUND(SAL/PEOPLE , 2)
FROM TAX;





2. �õ� �ñ����� ���ù����� ������ ���ϰ�

SELECT ROWNUM RN ,a.*

FROM (SELECT   SIDO , SIGUNGU , ROUND(SAL/PEOPLE , 2) AVG
FROM TAX
ORDER BY AVG DESC)a;



 3. ���ù��������� �δ� �Ű�� ������ ���� ������ ���� �����Ͽ� �Ʒ��� ���� �÷��� ��ȸ�ǵ��� SQL �ۼ�
    
����, �ܹ��� �õ�, �ܹ��� �ñ���, �ܹ��� ���ù�������, ����û �õ�, ����û �ñ���, ����û �������� �ݾ�1�δ� �Ű��



SELECT B.rn, A.SIDO, A.SIGUNGU , A.city_idx , B.SIDO , B.SIGUNGU , B.AVG
FROM 
(SELECT	 rownum rn, a.sido, a.sigungu, a.city_idx 

FROM	(SELECT bk.sido , bk.sigungu , bk.cnt , kfc.cnt , mac.cnt , lot.cnt ,
	 ROUND((bk.cnt + kfc.cnt + mac.cnt ) / lot.cnt ,2 ) city_idx 
	
	FROM
	(SELECT sido , sigungu, count(*) cnt
	FROM fastfood
	WHERE gb = '����ŷ'
	GROUP BY sido , sigungu ) bk,
	
	(SELECT sido , sigungu, count(*) cnt
	FROM fastfood
	WHERE gb = 'KFC'
	GROUP BY sido , sigungu ) kfc ,
	
	(SELECT sido , sigungu, count(*) cnt
	FROM fastfood
	WHERE gb = '�Ƶ�����'
	GROUP BY sido , sigungu )mac,
	
	(SELECT sido , sigungu, count(*) cnt
	FROM fastfood
	WHERE gb = '�Ե�����'
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
    
    
    ������������ ������ ���� �Ҽ��ִ�.
	
	
	
	
	
	
	
	
	





����(2)

SELECT ROWNUM rank, a.*
FROM
(SELECT sido , sigungu ,ROUND((kfc + mac + bk)/lot , 2) city_idx
FROM
(SELECT sido , sigungu ,
        NVL(SUM(CASE WHEN gb ='�Ե�����' THEN 1 END),1) lot,
        NVL(SUM(CASE WHEN gb ='�Ƶ�����' THEN 1 END),0) mac,
        NVL(SUM(CASE WHEN gb ='KFC' THEN 1 END),0) kfc,
        NVL(SUM(CASE WHEN gb ='����ŷ' THEN 1 END),0) bk

FROM fastfood
WHERE gb IN ( '����ŷ' , 'KFC' , '�Ƶ�����', '�Ե�����')

GROUP BY SIDO , SIGUNGU)
ORDER BY city_idx desc)a;






SELECT sido , sigungu ,gb , (DECODE(GB , '�Ե�����', '1')   ) lot , ( DECODE(GB , 'KFC', '1') KFC
FROM fastfood
WHERE gb IN('����ŷ ' , 'KFC' , '�Ƶ����� ' , '�Ե�����');
--ORDER BY sido , sigungu , gb;





3�� ����]

CASE �ι��� ���


SELECT �õ� , �ñ��� , (KFC ��Į�� ���� ���� ) , (����ŷ ��Į�� �������� ), (...)
FROM ...










