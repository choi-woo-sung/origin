������


��Ģ ������ : +,-,*,/ : ���� ������
���� ������ : ?  1==1 ? true���� : false�� �� ����


SQL ������

= : �÷�|ǥ���� =�� ==> ���� ������
 =1


 IN : �÷�|ǥ���� IN (����)
    deptno IN (10, 30) ==> IN (10, 30), deptno (10 , 30)
    



    EXISTS ������

    �����: EXISTS (��������)

    ���������� ��ȸ����� �Ѱ��̶� ������ TRUE


    �߸��� ����� : where deptno EXITS(��������)

    
    ���� ������ ���� ���� ���� ���� ������ ���� ����� �׻� ���� �ϱ� ������

    emp ���̺��� ��� �����Ͱ� ��ȸ �ȴ�.
    
    �Ʒ� ������ ���ȣ ���� ����

    �Ϲ������� EXISTS �����ڴ� ��ȣ ���� ���������� ���� ���
    


    EXITS �������� ����
    �����ϴ� ���� �ϳ��� �߰��� �ϸ� ���̻� ž���� ���� �ʰ� �ߴ�.
    ���� ���� ���ο� ������ ���� �� ���
    SELECT	 *
    FROM	 emp
    WHERE 	EXITS (SELECT 'X' FROM dept);  

      
                              
�Ŵ����� ���� ���� :KING
�Ŵ��� ������ �����ϴ� ���� : 14-KING =13���� ����


SELECT *
FROM emp
WHERE MGR IS NOT NULL;

SELECT m.*
FROM emp e , emp m
WHERE e.mgr = m.empno;

EXITS �����ڸ� Ȱ���Ͽ� ��ȸ
SELECT*
FROM emp e
WHERE EXISTS (SELECT 'X'
              FROM emp m 
            WHERE e.mgr = m.empno)
            
SUB 9]            
   
         
SELECT * 
FROM product p
WHERE EXISTS (SELECT 'X'
               FROM cycle c
               where p.pid = c.pid
               AND cid=1);
               
SUB 10]
SELECT * 
FROM product p
WHERE NOT EXISTS (SELECT 'X'
               FROM cycle c
               where p.pid = c.pid
               AND cid=1);
               
               
���� ����
( 1, 5, 3) U (2 , 3) = {1,2,3, 5 }

( 1, 5, 3) ������ (2 , 3) = {3 }
SQL���� �����ϴ� UNION ALL
(1, 5 ,3 ) U (2, 3 ) {1, 5, 3, 2 ,3}

������
( 1, 5, 3) - (2 , 3) = {1, 5}
               
               
SQL������ ���� ����
������ : UNION, UNION ALL , INTERSECT , MINUS
�ΰ��� SQL�� �������� ���� Ȯ�� (�� , �Ʒ��� ���յȴ�.)

UNION  ������ : �ߺ� ���� (������ ������ ���հ� ����)

SELECT empno, ename
FROM emp
WHERE empno IN(7566, 7698 ,7369)

UNION

select empNo, ename
FROM emp
WHERE empno IN(7566,7598);

UNION ALL

SELECT empno, ename
FROM emp
WHERE empno IN(7566, 7698 ,7369)

UNION ALL

SELECT empno, ename
FROM emp
WHERE empno IN(7566, 7698)
          
          
          
          
INTERSECT ������ :�����հ� �ߺ��Ǵ� ��Ҹ� ��ȸ

SELECT empno, ename
FROM emp
WHERE empno IN(7566, 7698 ,7369)

INTERSECT

SELECT empno, ename
FROM emp
WHERE empno IN(7566, 7698);

MINUS ������ : ���� ���տ��� �Ʒ��� ���տ�Ҹ� ����

SELECT empno, ename
FROM emp
WHERE empno IN(7566, 7698 ,7369)

MINUS

SELECT empno, ename
FROM emp
WHERE empno IN(7566, 7698)
           
SQL ���� �������� Ư¡
���� �̸�: ù�� SQL�� �÷��� ���󰣴�

SELECT ename nm , empno no
FROM emp
WHERE empno IN (7369)

UNION
SELECT ename , empno
FROM emp
WHERE empno IN(7698);

2. ������ �ϰ���� ��� �������� ���� ����
    ���� SQL���� ORDER BY �Ұ� (�ζ��� �並 ����Ͽ� ������������ ORDER BY�� ������� ������ ����)
    
    
    SELECT ename nm , empno no
FROM emp
WHERE empno IN (7369)

--ORDER BY nm , �߰� ������ ���� �Ұ�


UNION
SELECT ename , empno
FROM emp
WHERE empno IN(7698)
ORDER BY  nm desc;

3. SQL�� ���� �����ڴ� �ߺ��� �����Ѵ� (������ ���� ����� ����), UNION ALL �� �ߺ����

4.�ΰ��� ���տ��� �ߺ��� �����ϱ� ���� ������ ������ �����ϴ� �۾��� �ʿ�
==> ����ڿ��� ����� �����ִ� �������� ������.
    ==> UNION ALL�� ����� �� �ִ� ��Ȳ�� ��� UNION�� ������� �ʾƾ� �ӵ����� ���鿡�� �����ϴ�.
    
    // �˻��� ������ �ϱ����ؼ� �̸� ���ĵ� ���·� �����ؾ��Ѵ�.

�˰���(���� - ���� ���� , ���� ����,....
          �ڷ� ���� : Ʈ�� ����(���� Ʈ��, �뷱�� Ʈ��)
          heap
          stack , queue 
         list 

���տ��꿡�� �߿��� ���� : �ߺ�����




