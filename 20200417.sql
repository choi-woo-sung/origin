SELECT ���� ���� :
��¥ ����(+,1) : ��¥ +����, `���� : ��¥���� +-������ �Ѱ��� Ȥ�� �̷� ������ ����Ʈ Ÿ�� ��ȯ
���� ����(....) : �����ð��� �ȴٷ�

���ڿ� ����

���ͷ� : ǥ����

���� ���ͷ� : ���ڷ� ǥ��

���� ���ͷ� : java : "���ڿ�" / sql : 'sql'

SELECT SELECT *FROM || table_name
SELECT 'SELECT*FROM' || table_name

���ڿ� ���տ��� : +�� �ƴ϶� || (java ������ +)

��¥ ??: TO _DATE('��¥ ���ڿ�', '��¥ ���ڿ��� ���� ����')
        TO_DATE('20200417'.'yyyymmdd')
        
        WHERE: ����� ���ǿ� �����ϴ� �ุ ��ȸ�ǵ��� ����
        
        SELECT *
        FROM users
        WHERE userid = 'brown';
        
          SELECT *
        FROM users
        WHERE 1=1
        
          SELECT *
        FROM users
        WHERE 1!=1
        
        sal���� 1000���� ũ�ų� ����, 2000���� �۰ų� ���� ������ ��ȸ ==> BETWEEN AND;
        �񱳴�� �÷� / �� BETWEEN ���۰� AND ���ᰪ;  
        �������� ���� �;���!.
        
        sal >=1000 AND sal <=2000
        
        SELECT *
        FROM emp;
        WHERE sal BETWEEN 1000 AND 2000;
        
        a exclusive or b a=true,b=true ==>false
         SELECT *
        FROM emp
        WHERE sal>=1000  AND sal<=2000;
        ����1.
        SELECT ename,hiredate
        FROM emp
        
        WHERE hiredate BETWEEN TO_DATE('19820101','yyyymmdd') AND TO_DATE('19830101','yyyymmdd') ;
        
    IN ������
    �÷�|Ư���� IN(��1, ��2,....)
    �÷��̳� Ư������ ��ȣ�ȿ� ���߿� �ϳ��� ��ġ�� �ϸ� TRUE
    
    SELECT *
    FROM emp
    WHERE deptno IN(10, 30);
    ==> deptno �� 10�̰ų� 30���� ����
    deptno =10 OR deptno= 30
    
    SELECT *
    FROM emp
    WHERE deptno=10
    OR deptno =30;
    
      SELECT userid "���̵�",usernm "�̸�", alias "����"
    FROM users
     WHERE userid IN('brown','cony','sally');
     
     ���ڿ� ��Ī ���� : LIKE ���� /JAVA :.startswith(prefix),.endsWith(suffix)
     ����ŷ ���ڿ�: % -��� ���ڿ�(���� ����)
                  _ - � ���ڿ��̵��� �� �ϳ��� ����
                  
     ���ڿ��� �Ϻΰ� ������ TRUE 
     �÷�|Ư���� LIKE ���� ���ڿ� ;
     'cony' : cony�� ���ڿ�
     'co%'  : ���ڿ��� co�� �����ϰ� �ڿ��� � ���ڿ��̵� �ü��ִ� ���ڿ�
             'cony ', 'con', 'co'
     '%co%' : co�� �����ϴ� ���ڿ�
             'cony', 'sally cony'
     'co__' : co�� �����ϰ� �ڿ� �ΰ��� ���ڰ� ���� ���ڿ�
     '_on_' " ��� �α۰� on�̰� �յڷ� � ���ڿ��̵��� �ϳ��� ���ڰ� �ü� �ִ� ���ڿ�.
     
     ���� �̸�(ename�� �빮�� S �� �����ϴ� ������ ��ȸ
     SELECT*
     FROM emp
     WHERE ename LIKE'S%';    
     
     MEMBER ���̺��� ȸ���� ���� [��]���� ����� mem_id, mem_name�� ��ȸ�ϴ� ������ �ۼ��Ͻÿ�.
     SELECT mem_id, mem_name
     FROM member
    WHERE mem_name LIKE '��%';
    
       SELECT mem_id, mem_name
     FROM member
    WHERE mem_name LIKE '��%';
    
    NULL ��
     SQL �� ������ :
    WHERE user nm = 'brown'
    
    MGR �÷� ���� ���� ��� ������ ��ȸ
    
    SELECT *
    FROM emp
    WHERE mgr = 
    
    SQL���� NULL���� ���Ұ�� �Ϲ�����
    
    �񱳿�����(=)�� ��� ���ϰ� IS �����ڸ� ���.
    
    SELECT *
    FROM emp
    WHERE mgr IS NULL;
    
    ���� �ִ� ��Ȳ���� ��� : = , !=, <>
    NULL : IS NULL , IS NOT NULL
    
    emp���̺��� mgr �÷����� null�� �ƴ� ������ ��ȸ
    SELECT *
    FROM emp
    WHERE mgr IS NOT NULL;
    
    SELECT *
    FROM emp
    WHERE comm IS NOT NULL;
    
    SELECT *
    FROM emp
    where mgr IN (7698, 7839);
    
    SELECT *
    FROM emp
    WHERE mgr IN(7698, 7839);
    
    IN�����ڸ� �� �����ڷ� ����
    
    SELECT *
    FROM emp
    WHERE mgr IN (7698, 7839)
    ==> WHERE mgr =7698 OR mgr =7839
    
    SELECT *
    FROM emp
    WHERE mgr NOT IN (7698, 7839);
    ==>WHERE (mgr != and
    
    SELECT
    FROM emp
    WHERE mgr NOT IN (7698,7839)
    ORmgr IS NULL; 
    ���� �Ҷ� NULL�� �����ؾ��Ѵ�!.
    
    SELECT*
    FROM EMP
    WHERE job='SALESMAN'
    AND hiredate>TO_DATE(19810601,'YYYY/MM/DD')
    AND sal>1300;

    SELECT*
    FROM emp
    WHERE deptno!=10
    AND hiredate>TO_DATE(19810601,'YYYY/MM/DD');
    
      SELECT*
    FROM emp
    WHERE deptno NOT IN( 10)
    AND hiredate>TO_DATE(19810601,'YYYY/MM/DD');
    
    SELECT*
    FROM emp
    WHERE deptno IN(20, 30)
    AND hiredate>TO_DATE(19810601,'YYYY/MM/DD');
    
    SELECT*
    FROM emp
    WHERE job ='SALESMAN'
    OR hiredate>TO_DATE(19810601,'YYYY/MM/DD');
    
    SELECT*
    FROM emp
    WHERE job ='SALESMAN'
    OR empno LIKE '78%';  --����ȯ �Ǿ���!-
    
    SELECT*
    FROM emp
    WHERE job = 'SALESMAN'
    OR empno>=7800  AND empno<7900;
   
   --AND�� OR���� ������!
   
   SELECT*
   FROM emp
   WHERE job ='SALESMAN'
   OR (empno>=7800AND empno <7900  AND hiredate>TO_DATE(19810601,'YYYY/MM/DD'));
   
   ���� : (a,b,c) == (a, c, b)
   
   table���� ��ȸ ����� ������ ����(�������� ����)
   ==> ���нð��� ���հ� ������ ����
   
   SQL������ ���̸� �����Ϸ��� ������ ������ �ʿ�
   ORDER BY �÷��� [��������], �÷���2 [��������]....
   
   ������ ���� : ��������(DEFAULT) -ASC, �������� -DESC
   
   ���� �̸����� �������� ����
   
   SELECT *
   FROM emp
   ORDER BY ename ASC;
   
   ���� �̸����� �������� ����
   
   SELECT *
   FROM emp
   ORDER BY ename DESC;
   ;
job�� �������� �������� �����ϰ� job�� ������� �Ի����ڷ� �������� ����

SELECT *
FROM emp

ORDER BY job,hiredate DESC; 
   
    
    