�θ� -�ڽ� ���̺� ����


1. ���̺� ������ ����

1] �θ� (dept)
2] �ڽ� (emp)


2. ������ ������(insert) ����

1] �θ� (dept)
2] �ڽ� (emp)

3. ������ ����(delete) ����

1] �ڽ� (emp)
2] �θ� (dept)



DROP TABLE dept_test;


���̺� �����(���̺��� �̹� �����Ǿ� �ִ� ���) �������� �߰� ����

CREATE TABLE emp_test (
    empno NUMBER(4,0) ,
    ename VARCHAR(10),
    deptno NUMBER(2, 0)
);

���̺� ������ ���������� Ư���� �������� ����.   --

���̺� ������ ����  PRIMARY KEY �߰�
���� : ALTER TABLE ���̺�� ADD CONSTRAINT �������Ǹ� �������� Ÿ�� (������ �÷�[,]);
�������� : PRIMARY KEY , UNIQUE FOREIGN KEY , CHECK

ALTER TABLE emp_test ADD CONSTRAINT pk_emp_test PRIMARY KEY (empno) ; 



���̺� ����� �������� ����

���� : ALTER TABLE ���̺� �̸� DROP CONSTRAINT �������Ǹ�


������ �߰��� �������� pk_emp_test ����

ALTER TABLE emp_test DROP CONSTRAINT pk_emp_test ;


���̺� �������� �ܷ�Ű ���� ���� �߰� �ǽ�

emp_test.deptno ==> dept_test.deptno

dept_test���̺��� deptno�� �ε��� ���� �Ǿ��ִ��� Ȯ��

ALTER TABLE dep_test ADD CONSTRAINT �������� �� �������� Ÿ��(�÷�) REFERENCES �������̺�� (�������̺� �÷���)

ALTER TABLE emp_test ADD CONSTRAINT fk_emp_test_dept_test  FOREIGN KEY (deptno) REFERENCES dept_test (deptno);

������ ����;

�������� Ȱ��ȭ ��Ȱ��ȭ 

���̺� ������ ���������� ���� �ϴ� ���� �ƴ϶� ��� ����� ����, Ű�� ����
���� �� ALTER TABLE ���̺�� ENNABLE | DISABLE CONSTRAINT �������� ��;

������ ������ fk_emp_test_dept_test FOREIGN KEY ���������� ��Ȱ��ȭ

ALTER TABLE emp_test DISABLE constraint fk_emp_test_dept_test;

dept(�θ�)���̺��� 99�� �μ��� �����ϴ� ��Ȳ
SELECT *
FROM dept_test;

fk_emp_test_dept_test ���������� ��Ȱ��ȭ�Ǿ� �ֱ� ������ emp_test ���̺��� 99�� �μ� �̿���  ���� �Է°����� ��Ȳ


dept_test ���̺� 88�� �μ��� ������ �Ʒ� ������ ���������� ����

INSERT INTO emp_test VALUES (9999, 'brown', 88);

���� ��Ȳ : emp_test ���̺� dept_test ���̺� �������� �ʴ� 88�� �μ��� ����ϰ� �ִ� ��Ȳ
           fk_emp_test_dept_test ���������� ��Ȱ��ȭ�� ����
�������� ���Ἲ�� ���� ���¿��� fk_emp_test_dept�� Ȱ��ȭ ��Ű��??? 
==> ������ ���Ἲ�� ��ų�� �����Ƿ� Ȱ��ȭ �� �� ����.
ALTER TABLE emp_test ENABLE constraint fk_emp_test_dept_test;


emp , dept ���̺��� ���� primary key , FOREIGN KEY ������ �ɷ� ���� ���� ��Ȳ

emp ���̺��� empno�� key��
dept ���̺��� deptno key�� �ϴ� PRIMARY KEY ������ �߰��ϰ�

emp_.deptno ==>dept.dpetno�� �����ϵ��� FOREGIN KEY�� �߱�

�������� ���� �����ð��� �ȳ��� ������� ���.


ALTER TABLE emp ADD CONSTRAINT pk_emp PRIMARY KEY (empno) ; 

ALTER TABLE dept ADD CONSTRAINT pk_dept PRIMARY KEY (deptno);


ALTER TABLE emp ADD CONSTRAINT fk_emp_dept FOREIGN KEY (deptno) REFERENCES dept (deptno);


�������� Ȯ��
������ �������ִ� �޴�(���̺� ���� ==> �������� tab)
USER_CONSTRAINTS : �������� ����(MASTER)
FROM USER_CONS_COLUMNS : ���� ���� �÷�

SELECT*
FROM USER_CONSTRAINTS;

SELECT*
FROM USER_CONS_COLUMNS;


�÷�Ȯ��
��
select *
DESC
USER_TAB_COLUMNS (data dictionary , ����Ŭ���� ���������� �����ϴ� view);


SELECT *
FROM USER_TAB_COLUMNS
WHERE TABLE_NAME ='EMP';


SELECT  'SELECT *FROM ' || TABLE_NAME ||';'
FROM USER_TABLES;



���̺�, �÷� �ּ�: USER_TAB_COMMENTS, USER_COL_COMMENTS;


���� ���񽺼� ���Ǵ� ���̺��� ���� ���ʰ��� ������ �ʴ� ��찡 ����.


SELECT *
FROM user_tab_comments;


�÷��ּ� Ȯ��
SELECT *
FROM user_col_comments
where table_name ='EMP';   --�����ʹ� ��ҹ��ڸ� �����ϴµ� �빮�ڷ� �����Ѵ�.

COMMENT ON COLUMN ���̺��.�÷��� IS '�ּ�';

COMMENT ON COLUMN emp.empno IS '�����'

COMMENT ON COLUMN emp.ename IS '�̸���'

COMMENT ON COLUMN emp.hiredate IS '�Ի�����'

--�ּ��ظ��ϸ� ��ô� ȣȣȣ

���̺��� �ּ� �����ϱ�

���� : COMMENT ON TABLE ���̺�� IS '�ּ�';

emp ���̺� �ּ� �����ϱ�
COMMENT ON TABLE emp IS 'Ȳ����'


select *
FROM user_tab_comments;

select *
from user_col_comments ;


select t.table_name  , table_type , t.comments tab_comment  , c.column_name , c.comments col_comment

FROM user_tab_comments t, user_col_comments c

WHERE t.table_name=c.table_name

AND t.table_name IN ('CUSTOMER' ,'PRODUCT' , 'CYCLE' , 'DAILY');


View �� ������. 
������ ������ ���� =SQL
�������� ������ ������ �ƴϴ�


view ��� �뵵
 . ������ ����(���ʿ��� �÷� ������ ����)
 . ���ֻ���ϴ� ������ ���� ����
    . IN=LINE VIEW�� ����ص� ������ ����� ����� ���� ������
    MAIN ������ ������� �������ִ�.
    
view�� �����ϱ� ���ؼ��� CREATE VIEW ������ ���� �־�� �Ѵ� (DBA����)
SYSTEM ������ ����
GRANT CREATE VIEW TO ����������� �ο��� ������;

���� CREATE [OR REPLACE] VIEW ���̸� [�÷� ��ħ1, �÷���Ī2...] AS
SELECT ����;

emp ���̺��� sal , comm�÷��� ������ 6���� �÷��� ��ȸ�� ������ v_emp view�� ����

CREATE OR REPLACE VIEW v_emp AS
SELECT empno , ename , job , mgr , hiredate, deptno
FROM emp;


view(v_emp)�� ���� ������ ��ȸ
select *
FROM v_emp;

v_emp view�� sem���� ����
hr�������� �λ� �ý��� ������ ���ؼ� emp���̺��� �ƴ� sal, comm��ȸ�� ���ѵ�
v_emp view�� ��ȸ�Ҽ� �ֵ��� ������ �ο�

[Hr�������� ����]���Ѻο��� hr �������� v_emp ��ȸ
SELECT *
FROM PONGPONG.v_emp;

[PONGPONG �������� ���� PONGPONG�������� hr�������� v_emp view�� ��ȸ�� �� �ִ� ���� �ο�

GRANT SELECT ON v_emp TO hr;


v_emp view ������ hr ������ �ο������� ��ȸ �׽�Ʈ
SELECT *
FROM PONGPONG.v_emp;


�ǽ�

v_emp_dept �並 ����
emp, dept ���̺��� deptno �÷����� �����ϰ�

emp.empno, ename , dept.deptno , dname 4���� �÷����� ����


CREATE OR REPLACE VIEW v_emp_dept AS
SELECT e.empno, ename, d.deptno , dname
FROM emp e , dept d
WHERE e.deptno = d.deptno;

SELECT *
FROM v_emp_dept;


VIEW ����
���� DROP VIEW ������ �� �̸� ; 
DROP VIEW v_emp;



View
View�� ������
�������� �����Ͱ� �ƴϴ�, ������ ������ ���� ����
view�� �����ϴ� ���̺��� �����ϸ� view���� ������ ��ģ��.


VIEW�� ���� DML ó��
SIMPLE VIEW�� ���� ����

SIMPLE VIEW : ���ε��� �ʰ� , �Լ� , GROUP BY, ROWNUM�� ������� �ʴ� ������ ������ VIEW,
COMPLEX VIEW: SIMPLE VIEW�� �ƴ� ����

V_emp : simple view

select *
FROM V_EMP �� ���� 7369 SMITH ����� �̸��� BROWN���� ����
UPDATE v_emp set ename ='brown'
where empno =7369;

select*
from emp;

v_emp �÷����� �÷��� �������� ��



SEQUENCE
������ �������� �������ִ� ����Ŭ ��ü.
�����ĺ��ڸ� ���� ������ �� �ַ� ���

�ĺ��� ==> �ش� ���� �����ϰ� ���� �Ҽ� �ִ� ��
���� <==> ���� �ĺ���

����: ���� �׷��� ��.
����: �ٸ糽 ��.

�Ϲ������� � ���̺�(����Ƽ)�� �ĺ��ڸ� ���ϴ� ����� 
[����], [����], [������] 


�Խ����� �Խñ� : �Խñ� �ۼ��ڰ� ���� ����� �ۼ��ߴ���
�Խñ��� �ĺ��� : �ۼ���ID, �ۼ�����, ������
    ==> ���� �ĺ��ڰ� �ʹ� �����ϱ� ������ ������ ���̼��� ����
        ���� �ĺ��ڸ� ��ü�Ҽ� �ִ� (�ߺ����� �ʴ�) ���� �ĺ��ڸ� ���

������ �ϴٺ��� ������ ���� �����ؾ��� ���� ����.
EX) ��� , �й� �Խñ� ��ȣ
    ��� , �й� : ü��
    ��� : 15101001 - ȸ�� �������� 15 , 10�� 10�� �Ի� , �ش� ��¥�� ù���� �Ի��� ��� 01
    
ü�谡 �ִ� ���� �ڵ�ȭ �Ǳ� ���ٴ� ������� Ÿ�°�찡 ����.

�Խñ� ��ȣ : ü�谡 ��ġ�� �ʴ� ����
ü�谡 �ִ� ���� �ڵ�ȭ�� ���� ==> SEQUENCE ��ü�� Ȱ���Ͽ� �ս��� �������� ==> �ߺ����� �ʴ� ���� ���� ��ȯ



�ߺ����� �ʴ� ���� �����ϴ� ���
1.KEY TABLE�� ����

==> SELECT FOR UPDATE �ٸ������ ���ÿ� ��� ���� ���ϵ��� ���°� ����
==> ���� ���� ������, ������ ���� �̻ڰ� �����ϴ°� ����(SEQUENCE���� ����)


2.JAVA�� UUID Ŭ������ Ȱ��, ������ ���̺귯�� Ȱ��(����) ==> ������ , ����  , ī��

3.ORACLE DB - SEQUENCE



SEQUENCE ����

���� : CREATE SEQUENCE ������ ��;

CREATE SEQUENCE seq_emp;

���� : ��ü���� �������ִ� �Լ��� ���ؼ� ���� �޾ƿ´�.
NEXTVAL : �������� ���� ���ο� ���� �޾ƿ´�.
CURRVAL : ������ ��ü�� NEXTVAL�� ���� ���� ���� �ٽ��ѹ� Ȯ���� �� ���
         (Ʈ�����ǿ��� NEXTVAL �����ϰ� ���� ����� ����)


SELECT seq_emp.NEXTVAL
FROM dual;


SELECT seq_emp.CURRVAL
FROM dual;


SELECT *
FROM emp_test;


SEQUENCE�� ���� �ߺ����� �ʴ� empno�� ���� �Ͽ� insert �ϱ�

INSERT INTO emp_test VALUES(seq_emp.NEXTVAL, 'sally' , 88)








SELECT seq_empo.NEXTVAL
FROM dual;



DROP SEQUENCE seq_empo;




ALTER TABLE emp_test ADD CONSTRAINT pk_emp_test PRIMARY KEY (empno) ; 



























INSERT INTO emp_test VALUES(seq_emp.NEXTVAL, 'sally' , 88)








