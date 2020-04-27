NVL(expr1, expr2) --NVL은  expr 1이 널일 경우 expr2를 출력한다

if expr1 == null      
    return expr2
    
    else
    return expr1
    
    NVL2(expr1, expr2, expr3)
    
    if expr 1 ! =null
        return expr2
        
        else
        return expr3
        

SELECT empno, ename, sal ,comm, NVL2(comm, 100, 200)
FROM emp;


NULLIF(expr1, expr2)

if expr ==expr2
    return null
else return expr1

sal컬럼의 값이 3000이면 null을 리턴
SELECT empno, ename ,sal ,NULLIF(sal,3000)
FROM emp;


가변인자 : 함수의 인자의 갯수가 정해져 있지 않음
         가변인자들의 타입은 동일 해야함
         
인자들중에 가장 먼저나오는 null이 아닌 인자값을 리턴

coalesce(expr1,expr2.....)
if expr1 != null
    return expr1
else
coalesce(expr2, expr3.....)

mgr 컬럼 null
comm 컬럼 null

SELECT empno, ename, comm , sal, coalesce(comm,sal)
FROM emp;


emp 테이블의 정보를 다음과 같이 조회되도록 쿼리를 작성하세요

select empno, ename, mgr,    NVL(mgr,9999) mgr_n, NVL2(mgr,mgr ,9999)mgr_n_1,coalesce(mgr,9999)mgr_n_2
from emp;


user 테이블의 정보를 다음과 같이 조회되도록 쿼리를 작성하세요

SELECT userid, usernm,reg_dt ,NVL(reg_dt, sysdate)
FROM users
WHERE userid!='brown';

condition
조건에 따라 컬럼 혹은 표현식을 다른값으로 대체
java if , switch 같은개념
1. case 구문
2. decode

1.CASE
CASE
    WHEN 참/거짓을 판별할수있는 식 THEN 리턴할값
    [WHEN 참/거짓을 판별할수있는 식 THEN 리턴할값]
    [ELSE 리턴할 값  판별식이 참인 WHEN 절이 없을경우 실행)
END

emp 테이블에 등록된 직원들에게 보너스를 추가적으로 지급할 예정
해당직원의 job이 SALESMAN일경우 SAL에서 5%인상된 금액을 보너스로 지급(ex: sal ->105
해당직원의 job이 MANAGER일경우 SAL에서 10%인상된 금액을 보너스로 지급
해당직원의 job이 PRESIDENT일 경우 SAL에서 20% 인상된 금액을 보너스로 지극
그외 직원들은 sal만큼만 지급

SELECT empno, ename, job ,sal,  
        CASE   
            WHEN job='SALESMAN' THEN sal * 1.05
            WHEN job='MANAGER' THEN sal * 1.10
            WHEN job='PRESIDENT' THEN sal * 1.20
            ELSE sal
        END bonus
FROM emp;

2.DECODE(EXPR1, search1, return1, search2, return2, search3, return3,....,[default])

  DECODE(EXPR1,
         search1, return1,
         search2, return2,
         search3, return3,
         search4, return4,
         search5, return5,
         default

IF EXPR1 == search1
    return return1
else if expr1 == search2
    return return2
    else if expr1 == search3
    return return3
    
.....
else 
return default;


SELECT empno, ename, job, sal,
    DECODE(job, 'SALESMAN', sal*1.05,
                'MANAGER',  sal*1.10,
                'PRESIDENT', sal*1.20,
                sal)
                FROM emp;
    
SELECT empno, ename , 
        DECODE(deptno, '10', 'ACCOUNTING', '20', 'RESEARCH', '30', 'SALES', '40', 'OPERATIONS', 'DDIT') dname
        FROM emp;

SELECT empno, ename,
        CASE
        WHEN deptno=10 then 'ACCOUNTING'
        WHEN deptno=20 then 'RESEARCH'
        WHEN deptno=30 then 'SALES'
        WHEN deptno=40 then 'OPERATIONS'
        ELSE 'DDIT' 
        END dname
        FROM emp;
        
        
SELECT ename, ename, hiredate,
    CASE
    WHEN MOD(TO_CHAR(sysdate,'YYYY')-TO_CHAR(hiredate,'YYYY'),2)=0 then '건강검진 대상자'
     ELSE '건강검진 비대상자'
     END contact_to_doctor
     FROM emp;
      
   
SELECT empno, ename, hiredate,
    DECODE(MOD(TO_CHAR(sysdate,'YYYY')-TO_CHAR(hiredate,'YYYY'),2),'0','건강검진 대상자',1,  '건강검진 비대상자' )
    FROM emp;
    


SELECT userid, usernm, alias, reg_dt,
    case
    WHEN MOD((TO_CHAR(sysdate,'YYYY')-TO_CHAR(reg_dt,'yyyy')),2)=1 THEN '건강검진 대상자'
    ELSE '건강검진 비대상자'
    END contactdoctor
FROM users;
