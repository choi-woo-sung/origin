DML 
�����͸� �Է� (INSERT), ����(UPDATE) , ����(DELETE) �� �� ����ϴ� SQL 

INSERT

����
INSERT INTO ���̺�� [(���̺��� �÷���, ....)] VALUES (�Է��� ��, ....) ;



ũ�� ���� �ΰ��� ���·� ���

1. ���̺��� ��� �÷��� ���� �Է� �ϴ� ���, �÷����� �������� �ʾƵ� �ȴ�.
    �� �Է��� ���� ������ ���̺� ���ǵ� �÷� ������ �νĵȴ�.
INSERT INTO ���̺� �� VALUES(�Է��� ��, �Է��� ��2....) ;


DESC dept ;

2. �Է��ϰ� �ϴ� �÷��� ����ϴ� ���
����ڰ� �Է��ϰ��� �ϴ� �÷��� �����Ͽ� �����͸� �Է��� ���.
�� ���̺� NOT NULL������ �Ǿ��ִ� �÷��� �����Ǹ� INSERT�� �����Ѵ�
INSERT INTO ���̺� �� (�÷�1, �÷�2) VALUES (�Է��� ��1, �Է��� ��2) ;

3. SELECT ����� INSERT
   SELECT ������ �̿��ؼ� ������ ���� ��ȸ�Ǵ� ����� ���̺� �Է°���
   ==> �������� ����Ʋ �ϳ��� ������ �Է� ����(ONE-QUERY) ==> ���� ����
   
   ����ڷ� ���� �����͸� ���� �Է� �޴� ��� (ex ȸ������) �� ������ �Ұ�
   db�� �����ϴ� �����͸� ���� ���� �ϴ� ��� Ȱ�� ����(�̷� ��찡 ����)
   
   INSERT INTO ���̺�� {(�÷���1 , �÷���2...)}
   SELECT ......
   FROM .....






DESC emp ;


dept ���̺� deptno 99 , dname DDIT , loc daejeon ���� �Է��ϴ� INSERT ���� �ۼ�
SELECT *
FROM dept;

������ �Է��� Ȯ�� �������� : commit - Ʈ������ �Ϸ�  commit
������ �Է��� ��� �Ϸ���   : rollback -Ʈ������ ��� rollback;


INSERT INTO dept VALUES (99, 'DDIT' , 'daejeon');
INSERT INTO DEPT (loc , deptno ,dname ) VALUES ('daejeon' , 99 , 'DDIT');




���� INSERT ������ ������ ���ڿ� , ����� �Է��� ���
INSERT �������� ��Į�� �������� ,�Լ��� ��� ����

EX :  ���̺� �����Ͱ� �� ����� �Ͻ� ������ ����ϴ� ��찡 ���� ==> SYSDATE

SELECT *
FROM emp ; 

emp ���̺��� ��� �÷� �� ������ 8�� , NOT NULL�� 1��(EMPNO)

empno�� 9999�̰� ename�� ���� �̸�, hiredate�� ���� �Ͻø� �����ϴ� INSERT ������ �ۼ�

INSERT INTO emp (empno , ename , hiredate) VALUES (9999, '�ֿ켺' , sysdate);

INSERT INTO emp VALUES (9999, '�ֿ켺' ,null , null, sysdate, null, null,null);
INSERT ���� ������� �ʴ� �÷����� ���� NULL�� �Էµȴ�.


INSERT INTO emp (empno , ename , hiredate) VALUES (9998, 'jw' , TO_DATE('2020/04/13','YYYY/MM/DD'));


3. SELECT ����� ���̺� �Է��ϱ� (�뷮 �Է�)

DESC dept;

dept ���̺��� 4���� �����Ͱ� ���� (10~40)
�Ʒ������� �����ϸ� ���� ���� 4�� + SELECT �� �ԷµǴ� 4�� �� 8���� �����Ͱ� dept ���̺� �Էµ�.
INSERT INTO dept 
SELECT *
FROM dept;


������ �۾��� INSERT ������ ���

ROLLBACK;

UPDATE : ������ ����
UPDATE  ���̺�� SET ������ �÷�1 = ������ ��1 ,
                    [������ �÷�2 = ������ ��2 ,]
[WHERE condition SELECT ������ ��� WHERE���� ����
        ������ ���� �ν��ϴ� ������ ���]
        
INSERT INTO dept VALUES(99,'DDIT','daejeon');

99�� �μ��� �μ����� ���it�� ��ġ�� ���κ������� ����

UPDATE dept SET dname = '���IT',    
                 loc  = '���κ���'
WHERE deptno = 99;



�Ʒ��� ��� ���� �ٹٲ��.
UPDATE dept SET dname = '���IT',    
                 loc  = '���κ���'
                 
INSERT : ������ ���� ����
UPDATE , DELETE : ������ �ִ°� ���� , ����
    ==>������ �ۼ��� ��� ����
    1.WHERE���� �������� �ʾҴ���
    2. UPDATE , DELETE ���� ���� �ϱ� ���� WHERE ���� �����ؼ� SELECT�� �Ͽ�
     ������ ���� ���� ������ Ȯ��     --> ���� Ȯ������!
     
     
ORACLE ����ڿ��Դ� UPDATE, DELEETE�� �Ǽ� ���� ��� �ѹ��� ��ȸ�� ����
ROLLBACK;  --�����.





���� ������ �̿��� ������ ����

INSERT INTO emp (empno , ename , job) VALUES (9999,'brown', 'NULL');


9999�� ������ deptno ,job �ΰ��� �÷��� SMITH ����� ������ �����ϰ� ����

UPDATE emp SET DEPTNO = (SELECT deptno FROM emp WHERE ename ='SMITH'),
                 JOB  =   (SELECT deptno FROM emp WHERE ename ='SMITH')
                
WHERE empno =9999;


SELECT *
FROM emp
WHERE empno =9999;


�Ϲ����� update ���������� �÷����� ���������� �ۼ��Ͽ� ��ȿ���� ����
==> MERGE ������ ���� ��ȿ���� ���� �� �� �ִ�.



DELETE : ���̺� �����ϴ� �����͸� ����
����

DELETE [FROM] ���̺� ��
[WHERE condition]

������
1. Ư�� �÷��� ���� ���� ==> �ش� �÷��� NULL�� UPDATE
    DELETE���� �� ��ü�� ���� 
    
2.UPDATE ���� ������ DELETE ������ �����ϱ� ���� SELECT�� ���� ���� ����� �Ǵ� ���� ��ȸ , Ȯ������.

INSERT INTO emp (empno,ename, job ) VALUES (9999, 'brown ' , NULL);


DELETE emp
WHERE empno =9999;

DELETE dept

�Ʒ� ������ �ǹ� :emp ���̺��� ��� ���� ����
DELETE emp

UPDATE, DELETE ���� ��� ���̺� �����ϴ� �����Ϳ� ����, ������ �ϴ� ���̱� ������
��� ���� ���� �ϱ� ���� WHERE ���� ����� �� �ְ�
WHERE ���� SELECT������ ����� ������ ���� �� �� �ִ�.
���� ��� ���������� ���� ���� ������ ����  

�Ŵ����� 7698�� �������� ��� ���� �ϰ� ������

DELETE emp
WHERE empno IN
(SELECT empno
FROM emp
WHERE mgr = 7698);

SELECT *
FROM emp;

ROLLBACK;

DML : SELECT ,INSERT , UPDATE, DELETE
WHERE ���� ��� ������ DML :SELECT , UPDATE, DELETE
3���� ������ �����͸� �ĺ��ϴ� WHERE ���� ��� �� �� �ִ�.
�����͸� �ĺ��ϴ� �ӵ��� ���� ������ ���� ������ �¿� ��.
==>INDEX ��ü�� ���� �ӵ� ����� ����


INSERT : ������� �ű� �����͸� �Է��ϴ°�
        ������� �ĺ��ϴ°� �߿�
        ==> �����ڰ� �� �� �ִ� Ʃ�� ����Ʈ�� ���� ����
        
���̺��� �����͸� ����� ��� (��� ������ �����)
1. DELETE : WHERE ���� ��� ���� ������ ��
2. TRUNCATE 
    ���� : TURNCATE TABLE ���̺��
    Ư¡  : 1) ������ �α׸� ������ ����
            ==> ������ �Ұ��� 
            2) �α׸� ������ �ʱ� ������ ���� �ӵ��� ������.
             ==> � ȯ�濡���� �� ������� ���� (������ �ȵǱ⶧����)
                �׽�Ʈ ȯ�濡�� �ַ� ��� 
                
�����͸� �����Ͽ� ���̺� ����( �����غ��� )

CREATE TABLE emp_copy AS
SELECT *
FROM emp;

rollback;
SELECT *
FROM emp_copy;

emp_copy ���̺��� TURNCATE ����� ���� ��� �����͸� ����
TRUNCATE TABLE emp_copy;

ROLLBACK;

Ʈ����� : ������ ���� ����
ex : ATM -��ݰ� �Ա��� �Ѵ� ���������� �̿췯���� ������ �߻���������
          ����� ���� ó�� �Ǿ����� �Ա��� ������ ó�� �Ǿ��ٸ�
          ���� ó���� ��ݵ� ��Ҹ� ����� �Ѵ�.
          
��� 
�Ա�(����)
ROLLBACK;

����Ŭ������ ù��° DML�� ������ �Ǹ� Ʈ���� �������� �ν�
Ʈ������� ����� ROLLBACK ,COMMIT�� ���� ���ᰡ�ȴ�

Ʈ����� ������ ���ο� DML�� ����Ǹ� ���ο� Ʈ������� ����

��� ����ϴ� �Խ����� �����غ���
�Խñ� �Է� �Ҷ� �Է��ϴ� ��: ����(1��) , ����(1��) , ÷������(���� ����)
RDBMS������ �Ӽ��� �ߺ��� ��� ������ ����Ƽ(���̺�)�� �и��� �Ѵ�.
�Խñ� ���̺� / �Խñ� ÷������ ���̺� (÷�����Ͽ� ���� ����)

�Խñ��� �ϳ� ����� �ϴ���

�Խñ� ���̺�� �Խñ� ÷������ ���̺� �����͸� �űԷ� ����� �Ѵ�.

INSERT INT �Խñ� ���̺� (���� , ���� ,����� ~~) VALUES(.....);
INSERT INT �Խñ� ���̺� (÷�����ϸ�,÷�����ϻ����� ) VALUES(.....);

�ΰ��� INSERT ������ �Խñ� ����� Ʈ����� ����
�� �ΰ��߿� �ϳ��� ������ ����� �Ϲ������� ROLLBACK�� ���� �ΰ��� INSERT ������ ���.