View는 데이터 조회 쿼리를 객체로 생성한거야,  index는 색인이야, 홈같은거야! 정렬이 되있는 객체야! 데이터 조회할때 빨리 향상시킬수 있는거야!

객체를 수정하고 만들고 배울꺼야!
명명규칙 알아야 겠쥐? 영문자 시작해야돠ㅣ 길이는 30글자 , 그리구 특수문자는 _ , $# 만 사용 가능하구
해당유저가 소유한 다른객체와 이름이 겹치면 안돼
오라클 키워드와 객체명이 동일할수 업ㅆ따!


oracle 객체 삭제는 대게 유사해 
DROP TABLE table_name


쿼리를 삭제하는게 아니라 테이블 자체를 삭제하는거야 복구가 쉽지가 않아 .

지금배우는건 데이터를 정의 하는 언어 DDL띠띠엘 은 롤백이 안된대. 안돌아와유 .
운영DB에선 띠띠엘은 주의를 귀우리이ㅣㅂ 싶다.

SELECT *
FROM ranger;

DDL : DATA DEFINTION Language
데이터를 정의 하는 언어

****************************************
DDL의 경우는 자동 커밋(ROLLBACK 불가)
****************************************

name CHAR(10);

name ='test' ==> 'test '

varchar2 4000byte까지 지원해준다 하하하하



테이블 삭제 

구문 ㅣ DROP TABLE 삭제할 테이블명;

DROP TABLE ranger ;

SELECT *
FROM ranger;


TABLE 생성
문법
CREATE TABLE[계정명.] 테이블명(
    컬럼명1 컬럼타입 DEFAULF 설정할 기본값,
    컬럼명2 컬럼타입,........
    컬러명N 컬럼타입
    );
    
    테이블을 다음과 같은 컬럼으로 생성
 CREATE TABLE ranger(
 ranger_no NUMBER ,
 ranger_nm  VARCHAR2(50),
 reg_dt DATE DEFAULT SYSDATE);
 
 
DDL은 ROLLBACK 불가


INSERT INTO ranger(ranger_no , ranger_nm ) VALUES (1 , 'BROWN')  

reg_dt 컬럼을  값을 별도 입력하지 않았지만 테이블 설정에 의해 기본값 SYSDATE가 입력이 된다.




member 테이블 성별이라는 컬럼이 있을 때
성별 컬럼에 들어갈 수 있는 값 : 남성, 여성
 
 DDL의 제약조건 : 데이터의 무결성을 지키기 위한 설정
 총4가지 제약 조건이 존재
 
UNIQUE: 설정한 컬럼의 값이 다른행의 값과 중복되지 않도록 제약
        ex: 사번 , 학번
PRIMARY KEY : UNIQUE 제약 +NOT NULL CHECK 제약
    값이 유일해야 하며, 값이 반드시 들어와야 하는 컬럼
        EX)사번 ,학번
    FOREIGN KEY 해당 컬럼이 참조하는 테이블의 값이 존재하는지 확인하는 제약
        EX)emp 테이블에 신규사원을 등록시 deptno 값은 dept 테이블에 반드시 존재하는 값만 등록이 가능하다.

Check: 컬럼에 입력되는 값을 개발자가 정한 로직에 의해 체크 , 검증하는 제약
        EX) 성별컬럼에 값은 F , M 두개의 값만 들어갈수 있도록 설정
        
        

제약 조건을 생성하는 방법

1. 테이블 생성시 컬럼 옆에다가 해당 컬럼에 적용될 제약조건을 기술
==> 복합컬럼 설정이 불가 
2.테이블 생성시 컬럼 기술과 별도로 해당 해당 테이블에에 적용될 제약조건을 기술
==> 복합컬럼 설정이 가능
3. 테이블 생성 이후 , 별도로 제약조건만 해당 테이블에 적용
==> 테이블 변경, 복합컬럼 설정가능 (2,3 많이 사용)


 1.테이블 생성시 컬럼 옆에 제약조건을 기술
 DESC dept ;
 
 부서번호는 중복이 되면 안되고, 값이 비어 있어서도 안된다(일반적으로)
 ==> dbms에서 설정 가능한 primary key 제약조건을 컬럼 레벨로 설정
 
 DROP TABLE dept_test;
 create TABLE dept_test(
    deptno NUMBER(2) PRIMARY KEY,
    dname VARCHAR2(14),
    loc VARCHAR2(13));
    
SELECT *
FROM dept_test;

INSERT INTO dept_test VALUES (99, 'ddit', 'daejeon');
INSERT INTO dept_test VALUES (99, 'ddit2', 'daejeon3');
위 쿼리는 첫번째 쿼리에서 입력한 부서번호와 중복되기 때문에 
PRIMARY KEY(UNIQUE) 제약조건에 위배되어 정상적으로 데이터가 입력되지 않는다
==> 우리가 설정한 데이터 무결성이 지켜졌다.

제약조건 이름을 기술할수도 있다.

해당 조직의 제약조건 명명규칙을 따라야 한다.
PRIMARY KEY : pk_테이블명
UNIQUE : u_테이블명
FOREIGN KEY : fk_테이블명_ 참조테이블명

create TABLE dept_test(
    deptno NUMBER(2) CONSTRAINT pk_dept_test PRIMARY KEY,
    dname VARCHAR2(14),
    loc VARCHAR2(13));
NOT NULL , CHECK : 별도의 이름을 기술하지 않는다
CREATE TABLE dept_test(
    deptno
    
    
 2.테이블 생성시 컬럼기술과 별로도 해당 테이블에 적용될 제약조건을 기술
 
 create TABLE dept_test(
    deptno NUMBER(2) ,
    dname VARCHAR2(14),
    loc VARCHAR2(13),
    
    CONSTRAINT pk_dept_test PRIMARY KEY(deptno, dname));
    
    
    dept_test 테이블에 deptno, dname으로 PRIMARY KEY 제약조건을 생성
    두개 컬럼이 모두 같아야지만 중복되는 행으로 인식
    
    INSERT INTO dept_test VALUES (99, 'ddit2' , 'daejeon');
     INSERT INTO dept_test VALUES (99, 'ddit' , 'daejeon');
    
    SELECT *
    FROM dept_test;
    
    
    
    
    
