/* SQL �ּ�*/
--���� �ּ� -->JAVA�� ���� �ּ� //

SELECT * --��� �÷��� ������ ��ȸ
FROM prod; --prod ���̺���~ 


--Ư�� �÷��� ���ؼ��� ��ȸ :SELECT �÷�1, �÷�2....
�ǽ� select 1

SELECT prod_id, prod_name
FROM PROD;

Prod_id , prod_name�÷��� prod ���̺��� ��ȸ;

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

=============================================================================================================================
SQL �����ϴ� ���
1. �����Ϸ��� SQL�� �����Ͽ� (shift) crtl +enter ;
2. �����Ϸ��� SQL���� �ƹ��������� ������Ʈ�� ��ġ��Ű�� crtl + enter;
* �� ���Ʒ� �ٸ� sql ������ ���� ��� ; ������ sql�� ���е��� ���Ұ�� ������� ����!
--------------------------------------------------------------------------------
SQL ���� : JAVA�� �ٸ��� ���� X, �Ϲ��� ��Ģ����
int b = 2; =���� ������, == ��;

SQL ������ Ÿ�� : ���� , ���� , ��¥(date)

users  ���̺��� (4/14����� ����) ����
users ���̺��� ��� �����͸� ��ȸ;
��¥ Ÿ�Կ� ���� ���� : ��¥�� +, -���� ����
date type +���� : date���� ������ ¥��ŭ �̷� ��¥�� �̵�;
date type `���� : date���� ������ ¥��ŭ ���� ��¥�� �̵�;
SELECT userid, reg_dt ,reg_dt+5 atfer�ٺε�����
FROM users;

�÷� ��Ī :���� �÷����� �����ϰ� ������
syntax: ���� �÷���[as] , ��Ī ��Ī
��Ī ��Ī�� ������ ǥ���Ǿ�� �� ��� ���� �����̼����� ���´�
���� ����Ŭ������ ��ü���� �빮�� ó���ϱ⋚���� �ҹ��ڷ� ��Ī�� �����ϱ� ���ؼ���
���������̼��� ����Ѵ�.
SELECT userid as id, userid pongpong, userid "�׳� ����"
FROM users;
===========================================================================================================================
�ǽ� select 2

SELECT prod_id id,prod_name name
FROM prod;
---------------------------------------
SELECT lprod_gu gu ,lprod_nm nm 
FROM lprod;
---------------------------------------
SELECT buyer_id ���̾���̵�,buyer_name �̸�
FROM buyer;
---------------------------------------

���ڿ� ����(���տ���) : || (���ڿ� ������ +�����ڰ� �ƴϴ�)
STRING str = "hello";
str = str + ", world"' // str : hello world
SELECT /*user id + 'test' */  userid || 'test',   reg_dt +5 'test', 15
FROM users;
�� �̸� ��
SELECT ' ��' || userid || '��'
FROM users;
-------------------------------------
SELECT userid || usernm AS Ŵ��, userid , usernm
FROM users;
----------------------------------------
user_tables : oracle �����ϴ� ���̺� ������ ����ִ� ���̺� (view) ==>data dictionary;
SELECT table_name
FROM user_tables ;
=============================================
SELECT 'select * FROM '||table_name||';' query
 
FROM user_tables;
=============================================

���̺��� ���� �÷��� Ȯ��
1. tool(SQL developer)�� ���� Ȯ��
   ���̺� -Ȯ���ϰ��� �ϴ� ���̺�
   
2. SELECT *
   FROM table
   
3.DESC 
DESC emp;

4.data dicionary : user_tab_columns
SELECT *
FROM user_tab_columns;

���ݱ��� ��� SELECT ����

��ȸ�ϰ��� �ϴ� �÷� ��� : SELECT
��ȸ�� ���̺� ��� :FROM
��ȸ�� ���� �����ϴ� ������ ��� :WHERE
WHERE ���� ����� ������ ��(TRUE)�ϋ� ����� ��ȸ
Java�� �񱳿��� : a������ b������ ���� ������ ��

int a = 5;
int b = 2;
a�� b�� ���� �������� Ư����������
if( a== b)

SELECT *
FROM users
WHERE userid = 'cony';

SELECT *
FROM users
WHERE 1=2;

emp���̺��� �÷��� ������ Ÿ���� Ȯ��;

DESC emp
SELECT *
FROM emp;

emp : employee
empno : �����ȣ
ename :����̸�
job : ��� ����
mgr : �����(������)
hiredate: �Ի�����
sal   : �޿� 
comm : ������
deptno: �μ���ȣ

SELECT *
FROM dept;

emp ���̺��� �����̼��� �μ���ȣ�� 30������ ū �μ��� ���� ������ ��ȸ ;

SELECT *
FROM emp
WHERE deptno > 10;
-------------------------------------------------------------------------
users ���̺��� ����� ���̵�(userid)�� brown�� �ƴ� ����ڸ� ��ȸ.
SELECT * 
FROM users 
WHERE userid!='brown';
=========================================================================
SELECT *
FROM emp


SQL ���ͷ�
����: .... 20.,, 30,, 
����: '�ٺ�' 
��¥: TO_DATE('��¥���ڿ�','��¥ ���ڿ��� ����');

1982�� 1�� 1�� ���Ŀ� �Ի��� ������ ��ȸ. 
������ �Ի����� : hiredate �÷�
SELECT *
FROM emp
WHERE hiredate>=TO_DATE('19820101','YYYYMMDD');

*ȯ�漳��->������ ���̽� -> NLS ��¥ ���� �ٲٱ� ����,