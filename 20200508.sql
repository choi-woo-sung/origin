
SELECT ROWNUM rn, a.*

FROM (select *
        FROM emp
        order by hiredate ,ename desc)a
        
        
        
        ���������� ���� ��ġ�� ���� �з�
        
        select : ��Į�� ��������
        FROM �ζ��� ��
   
   
��������

1. PRIMARY KEY
2. UNIQUE
3. FOREIGN KEY
4. CHECK
    .NOT NULL

5. NOT NULL
    CHECK ���� ���������� ���� ����ϱ� ������ ������ KEYWORD�� ����
    
NOT NULL ��������
:�÷��� ���� NULL�� ������ ���� �����ϴ� ���� ����

DROP TABLE dept_test;


CREATE TABLE dept_test(
	deptno NUMBER(2,0),
	dname VARCHAR2(14) NOT NULL,
	loc VARCHAR2(13));

dname �÷��� ������ NOT NULL �������ǿ� ���� �Ʒ� INSERT ������ �����Ѵ�.
INSERT INTO dept_test VALUES (00, NULL, 'daejeon');

���ڿ��� ��� ''�� NULL�� �ν��Ѵ�. 
�Ʒ��� INSERT ������ ����
INSERT INTO dept_test VALUES (00, '', 'daejeon');  //�̰� ������ ���´� �黧�̴� ���� 


UNIQUE ����
�ش� �÷��� ������ ���� �ߺ����� �ʵ��� ����
���̺��� ������� �ش� �÷��� ���� �ߺ����� �ʰ� �����ؾ���
EX : ���� ���̺��� ��� �÷�, �л� ���̺��� �й� �÷�

CREATE TABLE dept_test(
	deptno NUMBER(2,0),
	dname VARCHAR2(14) UNIQUE,
	loc VARCHAR2(13));
    
    
dept _ test ���̺��� dname �÷��� UNIQUE ������ �ֱ� ������ ������ ���� ���� ����.

    
     INSERT INTO dept_test VALUES (001, 'ȫ��', 'daejeon');
       INSERT INTO dept_test VALUES (0020, 'ȫ��', 'daejeon');
       
       
        CONSTRANT u_dept_  
       
       CREATE TABLE dept_test(
	deptno NUMBER(2,0),
	dname VARCHAR2(14),
	loc VARCHAR2(13),
    
     �������� ��         ��������TYPE      �÷�
    CONSTRAINT u_dept_test UNIQUE (dname , loc));
    
    dname�÷��� loc �÷��� ���ÿ� ������ ���̾�߸� �ߺ����� �ν�
    �ؿ� �ΰ��� ������ ������ �ߺ��� �ƴϹǷ� �������
    
    INSERT INTO dept_test VALUES (99, 'ddit', 'daejeon');
    
    INSERT INTO dept_test VALUES (98, 'ddit', '����');
    
    �Ʒ������� UNIQUE �������ǿ� ���� �Էµ��� �ʴ´�.
    INSERT INTO dept_test VALUES (97, 'ddit', '����');
    
    
FOREIGN KEY ��������
�Է��ϰ��� �ϴ� �����Ͱ� �����ϴ� ���̺� ������ ���� �Է� ���
EX : emp ���̺� �����͸� �Է��� �� deptno �÷��� ���� dept ���̺� �����ϴ� deptno ���̾�� �Է� ����
������ �Է½�(emp) �����ϴ� ���̺�(dept)�� ������ ���� ������ ������ �˱� ���ؼ�
�����ϴ� ���̺�(dept)�� �÷�(deptno)�� �ε����� �ݵ�� �����Ǿ� �־�߸�
FOREIGN KEY ���������� �߰� �� �� �ִ�.

UNIQUE ���������� ������ ��� �ش� �÷��� �� �ߺ�üũ�� ������ �ϱ� ���ؼ�
����Ŭ������ �ش� �÷��� �򵦽��� ������� �ڵ����� �����Ѵ�.

PRIMARY KEY �������� : UNIQUE ���� + NOT NULL
PRIMARY KEY �������Ǹ� �����ص� �ش� �÷����� �ε����� ���� ���ش�.

FOREIGN KEY ���������� �����ϴ� ���̺��� �ֱ� ������ �ΰ��� ���̺� �����Ѵ�

DROP TABLE dept_test;


 CREATE TABLE dept_test(
	deptno NUMBER(2,0) PRIMARY KEY,
	dname VARCHAR2(14),
	loc VARCHAR2(13));
    
    INSERT INTO dept_test VALUES (99, 'ddit', 'daejeon');
COMMIT;


����Ű�� ������ (REFERENCES)

CREATE TABLE emp_test (
    empno NUMBER(4,0) PRIMARY KEY,
    ename VARCHAR(10),
    deptno NUMBER(2, 0) REFERENCES dept_test (deptno)
);

���� �μ� ���̺��� 99�� �μ�������
foreign key �������ǿ� ���� emp ���̺��� deptno �÷����� 99�� �̿��� �μ���ȣ�� �Էµ� �� ����.
99�� �μ��� ���� �ϹǷ� ���������� �Է� ����
INSERT INTO emp_test VALUES (9999, 'brown' , 99);
98�� �μ��� ���� ���� �����Ƿ� ���������� �Է��� �� ����.
INSERT INTO emp_test VALUES (9998, 'sally', 98);



FOREIGN KEY �������� ���̺� �������� ���
DROP TABLE emp_test;

CREATE TABLE emp_test (
    empno NUMBER(4,0) PRIMARY KEY,
    ename VARCHAR(10),
    deptno NUMBER(2, 0),
    
    
    CONSTRAINT fk_emp_test_dept_test FOREIGN KEY (deptno)  REFERENCES dept_test (deptno)
    );
    
    CONSTRAINT �������� �� ��������TYPE �÷� REFERENCES �����ϴ� ���̺� (�÷�)
   




SELECT *
FROM dept_test ;

select *
from emp_test;

�ܷ�Ű�� ������ ���� 

INSERT INTO emp_test VALUES (9999,'brown' ,99);
COMMit

emp.deptno ==> dept.deptno ���� ��

(9999 , 'brown' m 99 ) ==> (99, 'ddit' , 'daejeon')

dept_test ���̺��� 99�� �μ��� �����͸� ����� ��Եɱ�?

(9999, 'brown', 99) ==>

�θ� ���ڵ�(dept_test.deptno)�� �����ϰ� �ִ� �ڽ� ���ڵ�(emp_test.deptno)��
�����ϱ� ������ �ڽ� ���ڵ� ���忡���� ������ ���Ἲ�� ������ �Ǿ�
���������� ���� �� �� ����
DELETE dept_test
WHERE deptno =99;


option�� ���ð� �����θ� Ȯ���ϼ���

����Ű�� ���õ� �����͸� ������ �ο��� �� �ִ� �ɼ�

�θ� �����͸� ������..
FOREIGN KEY �ɼǿ� ���� �ڽ� �����͸� ó���� �� �ִ� �ɼ�
1. default ==> �����ϰ� �ִ� �θ� ���� �ɼ� ����.
2. ON DELETE CASCADE ==> �θ� �����Ǹ� �����ϰ� �ִ� �ڽ� �����͵� ���� ����
3. ON DELETE SET NULL ==> �θ� ���� �Ǹ� �����ϰ� �ִ� �ڽĵ����͸� NULL�� ����

�ְ����� �ǰ� : default
1. �����ڰ� ���̺��� ������ ��Ȯ�ϰ� �˰� �־������ ���� ������ �� ����.
==> ����ų�, �Է��� �������� ������ �˰� �־����.
2.���̺� ������ ��Ȯ���� ������ �ű� �����ڴ� �ش� ������ �� ���� ����
(java�ڵ� +���̺� ���� Ȯ�� �ʿ�)
java�ڵ忡�� dept���̺� �����ϴ� �ڵ尡 �ִµ�
�ű��ϰԵ� emp ���̺��� �����Ͱ� �����ǰų� null�� ������ ��츦 �� �� ����.


CHECK ���� ����

�÷��� ���� �����ϴ� ���� ����

emp ���̺��� �޿�����(sal)�� ���� �ҋ� sal �÷��� ���� 0���� ���� ���� ���� ����
���������� �̻���.
sal �÷��� ���� ������ ���� �ʵ��� üũ ���� ������ �̿��Ͽ� ���� �� �� �ִ�.

DROP TABLE emp_test;

CREATE TABLE emp_test (
    empno NUMBER(4,0) PRIMARY KEY,
    ename VARCHAR(10),
    sal NUMBER(7,2) CHECK (sal >0),
    deptno NUMBER(2, 0) REFERENCES dept_test (deptno)
);

insert into emp_test  VALUES(9999, 'brown', 1000, 99);

sal �÷��� ������ check �������� (sal>0)�� ���� ���������� ������� �ʴ´�.
insert into emp_test VALUES(9998, 'sally', -1000, 99);




CREATE TABLE emp_test (
    empno NUMBER(4,0) PRIMARY KEY,
    ename VARCHAR(10),
    sal NUMBER(7,2), 
    deptno NUMBER(2, 0) REFERENCES dept_test (deptno),
    
     CONSTRAINT u_emp_test check (sal>0));


UNIQUE �������� �ε����� �ڵ������ǰ� ��������Ű�� �ε����� �ʿ��ϱ⶧���� ����Ǿ���Ѵ�.



CREATE TABLE emp_2020_05_08 AS
SELECT *
FROM emp

CTAS : CREATE Table AS

select ����� �̿��ؼ� ���̺��� �����ϴ� ���
NOT NULL �������� ������ �ٸ� ���������� ������� �ʴ´�.

1.������ ������ ���
2.������ ������ �׽�Ʈ

���� 
CREATE TABLE ���̺�� [(�÷���1,...)]As
SELECT ����;


CREATE TABLE dept_test_copy AS
SELECT*
FROM DEPT_test;

���̺� ���� ���̺��� �����ϰ� ������

CREATE TABLE dept_test _copy2AS
SELECT *
FROM dept_test
where 1!=1;

SELECT *
FROM dept_test copy2;

JAVA JDBC (JAVA DATABASE Connection)
Strign sql ="������ sql";

���� �˻������ ����
�䱸���� : �����̸����� �˻� ,�޿��˻� ,��ü �˻�;

���� �̸� �˻�

SELECT *
FROM emp
WHERE ename LIKE '%' || �˻�Ű����||'%';

�޿� �˻�
SELECT *
FROM emp
WHERE sal>�˻���

��ü �˻�
SELECT*
FROM emp;

String sql = "SELECT *";
       sql += "FROM emp";

if(����ڰ� �޿��˻��� ��û �ߴٸ�){
    sql +="WHERE sal> " + ����ڰ� �Է��� �˻���;
}
if(��밡�� ���� �̸� �˻��� ��û �ߴٸ�){
sql += "WHERE ename LIKE '%' || " + ����ڰ� �Է��� �̸� �˻��� + "'%'" ;

STRING sql = " SELECT * ";
       sql += "FROM emp"
         sql +="WHERE 1=1";
         sql +="AND SAK>"
          sql += " AND ename LIKE '%'
          
          
 
 TABLE ����
 ���ݱ��� ������ TABLE ������ ����.
 �̹� ������ ���̺��� ���� �� ���� ����
 1. ���ο� �÷��� �߰�
 *****���ο� �÷��� ���̺��� ������ �÷����� �߰��� �ȴ�.
 *****���� �����Ǿ� �ִ� �÷� �߰����� ���ο� �÷��� �߰��� ���� ����
 ==> ���� ���̺��� �����ϰ� �÷������� ������ ���ο� ���̺� ���� DDL�� ���Ӱ� ���̺��� ��������.
 ����̶�� �̹� �����Ͱ� �׿����� ���ɼ��� ������ ����
 ==> ���̺��� ������ �� �����ϰ� �÷������� ���.
 
 2.���� �÷� ����, �÷� �̸� ���� , �÷� ������ ����, (Ÿ�Ե� ���������� ���� ����)
   ����Ű�� �ɷ��ִ� ���̺��� �÷� �̸��� �����ϴ��� �����ϴ� ���̺��� ������ ���� ����
   (�˾Ƽ� �̸��� ���� ���ش�)
   emp_test.deptno ==> dept_test.deptno ����
   dept_test.deptno �̸������Ͽ� dept_test.dno�� �����ϴ��� fk�º���� �̸����� �������� �ȴ�.
   
 3.���� ���� �߰�
 
 
 ���� ���̺� ���ο� �÷� �߰�
 ALTER TABLE ���̺� �� ADD (�÷��� �÷� Ÿ��) ; <>
 
 
DROP TABLE emp_test;
 
 
CREATE TABLE emp_test (
    empno NUMBER(4,0) PRIMARY KEY,
    ename VARCHAR(10),
    deptno NUMBER(2, 0) REFERENCES dept_test (deptno)
);


SELECT *
FROM emp_test;

DESC emp_test;

ALTER TABLE emp_test ADD (hp VARCHAR2(20));
 
 
�÷� ������ ����

ALTER TABLE ���̺�� MODIFY (�÷��� �÷�Ÿ��);

������ �߰��� HP �÷��� �÷� ����� 20���� 30���� ����

ALTER TABLE emp_test MODIFY (hp VARCHAR(30));


�÷� Ÿ�� ����  => �ȿ� ���� �������� �ٲܼ� �־�
������ �߰��� hp �÷��� Ÿ���� VARCHAR2(30)���� DATE�� ����    


ALTER TABLE emp_test MODIFY (hp DATE);

�����Ͱ� �����ϴ� �÷��� ���ؼ��� Ÿ�� ������ �Ұ��� �ϴ�.
INSERT INTO emp_test VALUES (9999, 'brown', 99, sysdate);
ALTER TABLE emp_test MODIFY (hp VARCHAR2(30));


�÷� �̸� ����

ALTER TABLE ���̺�� RENAME COLUMN ���� �÷��� TO �ű��÷���


������ �߰��� emp_test ���̺��� hp �÷��� hp_n���� �̸� ����


ALTER TABLE emp_test RENAME COLUMN DEPTNO TO HP_nS


DESC emp_test;

�÷� ���� 
ALTER TABLE ���̺� �� DROP (������ �÷���) ;

ALTER TABLE ���̺� �� DROP COLUMN ������ �÷���;


ALTER TABLE emp_test DROP COLUMN (HP_n);

SQL ����

DML : SELECT , INSERT , UPDATE , DELETE  ==> Ʈ������ ����� (��� ����)
DDL : CREATE...., ALTER..... ==> Ʈ����� ���� �Ұ��� (��Ұ� �ȵȴ�)  /�ڵ� Ŀ��

ROLLBACK;


SELECT *
FROM emp_test;

���� ename�� brown ==> sally�� ����
UPDATE emp_test set ename = 'sally'
where empno =9999;

�ѹ� �Ǵ� Ŀ���� ����.

ALTER TABLE emp_test ADD (AVENGERS NUMBER);
 
DDL�� �ڵ� Ŀ���̱� ������ DML ���忡�� ������ �޴´�.
DDL�� ������ ��� ���Ǳ�� ������ �ߴ� �۾��� ���캼 �ʿ䰡 �մ�.

SQL D ���迡�� �߳����� ���� 
 