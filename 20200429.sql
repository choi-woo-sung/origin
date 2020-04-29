OUTER JOIN
���̺� ���� ������ �����ص�, �������� ���� ���̺��� �÷��� ��ȸ�� �ǵ��� �ϴ� ���� ���
<==> INNER JOIN(�츮�� ���ݱ��� ��� ���)
LEFT OUTER JOIN : ������ �Ǵ� ���̺��� JOIN Ű���� ���ʿ� ��ġ
RIGHT OUTER JOIN: ������ �Ǵ� ���̺��� JOIN Ű���� �����ʿ� ��ġ
FULL OUTER JOIN : LEFT OUTER JOIN +RIGHT OUTER JOIN -(�ߺ��Ǵ� �����Ͱ� �ѰǸ� ������ ó��)

emp ���̺��� �÷��� mgr �÷��� ���� �ش� ������ ������ ������ ã�ư� �� �ִ�.
������ KING ������ ��� ����ڰ� ���� ������ �Ϲ����� inner ���� ó���� 
���ο� �����ϱ� ������ KING�� ������ 13���� �����͸� ��ȸ�� ��.

INNER ���� ����

����� ���, ����� �̸�, ���� ���, ���� �̸�

 ������ �����ؾ����� �����Ͱ� ��ȸ �ȴ�.
 ==>king�� ����� ����(mgr)�� NULL�̱� ������ �����ο� �����ϰ�
 KING�� ������ �������ʴ´�.
 
SELECT m.empno, m.ename, e.empno, e.ename
FROM emp e , emp m
WHERE e.mgr = m.empno;



SELECT m.empno, m.ename, e.empno, e.ename
FROM emp e JOIN emp m on(e.mgr = m.empno); 

���� ������ OUTER �������� ����
( KING ������ ���ο� �����ص� ���� ������ ���ؼ��� ��������, ������ ����� ������ ���� ������ ������ �ʴ´�)

ANSI-SQL : OUTER
SELECT m. empno, m.ename, e.empno, e.ename
FROM emp e LEFT OUTER JOIN emp m ON (e.mgr =m.empno);

SELECT m. empno, m.ename, e.empno, e.ename
FROM emp m RIGHT OUTER JOIN emp e ON (e.mgr =m.empno);

ORACLE -SQL : OUTER

oracle join
1.FROM ���� ������ ���̺� ���(�޸��� ����)
2. WHERE���� ���� ������ ���
3. ���� �÷�(�����) �� ������ �����Ͽ� �����Ͱ� ���� ���� �÷��� (+)�� �ٿ� �ش�
==> ������ ���̺� �ݴ��� �� ���̺��� �÷�
SELECT m.empno, m.ename, e.empno, e.ename
FROM emp e, emp m
WHERE e.mgr =m.empno(+);
 --�̸����� �ٿ����ô� ����


OUTER������ ���� ��� ��ġ�� ���� ��� ��ȭ

������ ����� �̸�, ���̵� �����ؼ� ��ȸ
��, ������ �ҼӺμ��� 10���� ���ϴ� �����鸸 �����ؼ�;


������ on���� ���������
SELECT m. empno, m.ename, e.empno, e.ename
FROM emp e LEFT OUTER JOIN emp m ON (e.mgr =m.empno AND e.deptno =10);

������ WHERE���� ���������
SELECT m. empno, m.ename, e.empno, e.ename , e.deptno
FROM emp e LEFT OUTER JOIN emp m ON (e.mgr =m.empno )
WHERE e.deptno =10;  --INNER JOIN���� �Ȱž�


OUTER ������ �ϰ� ���� ���̶�� ������ NO���� ����ϴ°� �´�.

SELECT m. empno, m.ename, e.empno, e.ename , e.deptno
FROM emp e, emp m 
WHERE e.mgr =m.empno(+)  
















-------------------------���� �۷O�� ���̾���~ ����ٶ������� ����Ų--

SELECT*
FROM buyprod;

--(+)�� ��� ���ǿ� �־�ߵ˴ϴ� �Ҷ��


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
���� ������ ������� ���� ���
��� ������ ���� �������� ����� ��ȸ�ȴ�.


emp 14* dept 4= 56;

ANSI -SQL
SELECT *
FROM emp CROSS JOIN dept;

ORACLE(���� ���̺� ����ϰ� where ���� ������ ��������ʴ´�)
SELECT *
FROM emp, dept ;

SELECT *
FROM customer CROSS JOIN product;

SELECT *
FROM emp, dept;



��������
WHERE : ������ �����ϴ� �ุ ��ȸ�ǵ��� ����
SELECT *
FROM emp
WHERE 1=1
OR  1!=1;
TRUE OR FALSE ==> TRUE

���� <==> ����
���������� �ٸ� ���� �ȿ��� �ۼ��� ����
�������� ������ ��ġ

1.SELECT
SCALAR SUB QUERY
* ��Į�� ���������� ��ȸ�Ǵ� ���� 1���̰�, �÷��� �Ѱ��� �÷��̾�� �Ѵ�)
EX) DUAL���̺�

2.FROM
    INLINE-VIEW  
    SELECT ������ ��ȣ�� ������
    
3.WHERE
SUB QUERY
WHERE���� ���� ����

SMITH�� ���� �μ��� ���� �������� ���� ������?

1. SMITH�� ���� �μ��� �������?
2. 1������ �˾Ƴ� �μ���ȣ�� ���ϴ� ������ ��ȸ

==> �������� 2���� ������ ���� ����
    �ι��� ������ ù��°�� ������ ����� ���� ���� �ٸ��� �����;� �Ѵ�.
    (SMITH(200) => WARD(30) ==> �ι�° ���� �ۼ��� 10������ 30������ ������ ����
    ==> �������� ���鿡�� ����)
    
SELECT deptno --20
FROM emp
WHERE ename ='SMITH';

SELECT*
FROM emp
WHERE deptno =20;

���������� ���� ���� ����

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
