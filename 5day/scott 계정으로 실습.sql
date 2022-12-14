---CRUD INSERT / SELECT / UPDATE / DELETE === DML - 가장 기본
--- CREATE === DDL -- 테이블 생성

-- 뷰 - 테이블에서 분류
-- 인덱스 - 검색 속도 빨리하는 것(데이터 표)
-- 시퀀스 - 순서 메기기
-- PK 프라이머 키 (기준이 되는 키(중복 금지))


--SCOTT 계정이 가지고 있는 정보(감춰진) - DICT = DICTIONARY
SELECT * FROM DICT;
SELECT * FROM DICTIONARY;

--유저 테이블에서 테이블 이름만 뽑아온것 
SELECT TABLE_NAME
FROM USER_TABLES;

SELECT * FROM USER_TABLES; -- 유저 테이블 정보(사용자가 생성한 테이블 정보)

SELECT * FROM ALL_TABLES; -- 모든 테이블 정보
SELECT OWNER, TABLE_NAME FROM ALL_TABLES;

--DBA TABLE은 SYS, SYSTEM 만 조회 가능(SCOTT 계정(일반 계정은 안된다) 
SELECT * FROM DBA_TABLES;
--> 이것 입력하면 뜸(SYS에서)

--INDEX 검색 빨리 하기 위해 (데이터가 많을때 효율적)
SELECT * FROM USER_INDEXES;

--인덱스 만들기(보통 PK파일(고유한 번호/중복되지 않는 번호)에 지정)
CREATE INDEX IDX_EMP_SAL
ON EMP(SAL);  -- ON - 어느 곳에 만들지 EMP 테이블에 SAL이란 컬럼에 생성

--INDEX 조회
SELECT * FROM USER_IND_COLUMNS;

--INDEX 삭제
DROP INDEX IDX_EMP_SAL;


---VIEW 생성 CUSTOMER---- TABLE에 마스킹 하기(구멍 뚫기)

--VIEW 생성(VIEW는 테이블 이다 - 타인에게 공유할 정보만 뽑을때 주로 사용)
CREATE VIEW VW_EMP20
AS (
    SELECT EMPNO,ENAME,JOB,DEPTNO
    FROM EMP
    WHERE DEPTNO = 20
); -- > 안될 시 SYS계정에서 권한 부여 받기

--VIEW 제거
DROP VIEW VW_EMP20;

--VIEW 는 TABLE이라 보아도 된다
SELECT * FROM VW_EMP20;

--사용자가 생성한 VIEW 확인
SELECT * FROM USER_VIEWS;

--VIEW 추가(보통 사용하지 않는다(뷰는 그냥 가져와서 사용)) - 뚫어둔 DEPNO-20 설정
INSERT INTO EMP VALUES(4444,'JJANG','MANAGER',NULL,SYSDATE,1950,NULL,20);


SELECT * FROM EMP;

--ROWNUM - 번호 메기기 할때 많이 사용
--게시판 순서 메길떄 많이 사용
SELECT ROWNUM,E.*
FROM EMP E;

--ORDER BY를 쓰면 순서가 이상해 진다(ROWNUM과 같이 사용 불가)
SELECT ROWNUM,E.*
FROM EMP E
ORDER BY SAL DESC;

--FROM 절에 쓰는 서브 쿼리 (INLINE VIEW)
--ORDER BY 및 ROWNUM 둘다 사용할때 방법
SELECT ROWNUM,E.*
FROM (SELECT * FROM EMP ORDER BY SAL DESC) E
WHERE ROWNUM <= 3;

--WITH - 가상 테이블(VIEW와 비슷 -쓰는 곳의 차이 - 가장 상단에 WITH생성)
WITH E AS(SELECT * FROM EMP ORDER BY SAL DESC)
-->E라는 문장으로 같이 생성하겠단 뜻
SELECT ROWNUM, E.*
FROM E
WHERE ROWNUM<=3;

--SEQUENCE(오라클에만 존재) : 번호 메기기 --

CREATE TABLE DEPT_SEQUENCE
AS(
   SELECT * FROM DEPT
   WHERE 1=0
   );
SELECT * FROM DEPT_SEQUENCE;
--CREATE SEQUENCE SEQ_DEPT_SEQUENCE
--    INCREMENT BY 10 --10씩 증가
--    START WITH 10 -- 10번 부터
--    MAXVALUE 90 -- 최대 90번 까지
--    MINVALUE 0 -- 최소 0
--    NOCYCLE  -- 사이클 NO( YES일 경우 계속 순환 90 이후 다시 0부터)
--    CACHE 2; --캐시 2개만




--추가
INSERT INTO DEPT_SEQUENCE (DEPTNO,DNAME,LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL,'DATABASE','SEOUL');
--SEQ_DEPT_SEQUENCE.NEXTVAL - 자동 증가 해서 넣어준다 다음 숫자로
INSERT INTO DEPT_SEQUENCE (DEPTNO,DNAME,LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL,'DATABASE','SEOUL');

DROP TABLE DEPT_SEQUENCE;
DROP SEQUENCE SEQ_DEPT_SEQUENCE;

-- 서브쿼리 사용(MAX사용 - 같은 숫자가 올 수도 있다 (중간 삭제시))
INSERT INTO DEPT_SEQUENCE (DEPTNO,DNAME,LOC)
VALUES ((SELECT NVL(MAX(DEPTNO),0)+1 + 10 FROM DEPT_SEQUENCE )
,'DATABASE','SEOUL');
-->SELECT NVL(MAX(DEPTNO),0(뽑았는데 0 이면))+1 + 10 테이블이 없을 경우 NULL 값으로 들어가기 때문에 NVL사용

--현재 시퀀스 번호(CURRVAL) 볼때 / 추가 시에서 확인 가능)
--서브 쿼리 추가는 확인 불가
SELECT SEQ_DEPT_SEQUENCE.CURRVAL
FROM DUAL;

--시퀀스 변경 / 변경시킬 것을 그냥 입력
ALTER SEQUENCE SEQ_DEPT_SEQUENCE
INCREMENT BY 5
MAXVALUE 1000
NOCYCLE;


--동의어 SYNONYM (별명을 지어주는 것)- 권한 필요

CREATE SYNONYM E FOR EMP;

SELECT * FROM EMP;
SELECT * FROM E;
-->만들어둔 별명이나 이름이나 둘다 사용


----문제--------------------------------
DROP TABLE EMPIDX;

CREATE TABLE EMPIDX
AS SELECT * FROM EMP;

CREATE INDEX IDX_EMPICD_EMPNO
ON EMPIDX(EMPNO);
-->EMPIDX 폴더에 EMPNO을 기준으로

--인덱스와 관련된 것 확인
SELECT *FROM USER_INDEXES
WHERE INDEX_NAME = 'IDX_EMPIDX_EMPNO';

SELECT * FROM EMPIDX;
SELECT * FROM EMP;

--,VIEW 만들기
--OR REPLACE - 생성되어 있으면 바꾸기
CREATE OR REPLACE VIEW EMPIDX_OVER15K
AS(
SELECT EMPNO,ENAME,JOB,DEPTNO,SAL,NVL2(COMM,'O','X') AS COMM
FROM EMPIDX
WHERE SAL > 1500
);

SELECT * FROM EMPIDX_OVER15K;


--시퀀스 만들기
CREATE TABLE DEPTSEQ
AS SELECT *FROM DEPT;

CREATE SEQUENCE SEQ_DEPTSEQ
    INCREMENT BY 1
    START WITH 1
    MAXVALUE 99
    MINVALUE 1
    NOCACHE
    NOCYCLE;
INSERT INTO DEPTSEQ (DEPTNO,DNAME,LOC)
VALUES (SEQ_DEPTSEQ.NEXTVAL,'DATABASE','SEOUL');
INSERT INTO DEPTSEQ (DEPTNO,DNAME,LOC)
VALUES (SEQ_DEPTSEQ.NEXTVAL, 'WEB','BUSAN');
INSERT INTO DEPTSEQ (DEPTNO,DNAME,LOC)
VALUES (SEQ_DEPTSEQ.NEXTVAL, 'MOBILE','ILSAN');

SELECT * FROM DEPTSEQ;

DROP SEQUENCE SEQ_DEPTSEQ;
DROP TABLE DEPTSEQ;


-- 제약조건 (테이블 생성시 CONSTRAINT 또는 PK 클릭 해서 생성)
-- NOT NULL
CREATE TABLE TABLE_NOTNULL(
    LOGIN_ID VARCHAR2(20) NOT NULL,
    LOGIN_PWD VARCHAR2(20) NOT NULL,
    TEL VARCHAR2(20)
    );
DESC TABLE_NOTNULL;
-- NULL을 넣을 경우 에러 발생
INSERT INTO TABLE_NOTNULL (LOGIN_ID,LOGIN_PWD,TEL)
VALUES ('TEST_ID_01','1234','010-1111-2222');
INSERT INTO TABLE_NOTNULL (LOGIN_ID,LOGIN_PWD,TEL)
VALUES ('TEST_ID_02','3456','010-1111-2222');--공백 사용 불가

SELECT * FROM TABLE_NOTNULL;

SELECT * FROM USER_CONSTRAINTS;
SELECT OWNER,CONSTRAINT_NAME, TABLE_NAME FROM USER_CONSTRAINTS;

--TEL 을 NULL로 변경
ALTER TABLE TABLE_NOTNULL
MODIFY (TEL NULL); -- 주의할 점은 기존 데이터에 NULL 값이 있으면 안된다

--이름 변경 - 잘 쓰지는 않는다
ALTER TABLE TABLE_NOTNULL
MODIFY (TEL CONSTRAINT TABLE_NOTNULL_TEL_NOTNULL NOT NULL); 

--걸려 있는 제약 조건 제거
ALTER TABLE TABLE_NOTNULL
DROP CONSTRAINT TABLE_NOTNULL_TEL_NOTNULL;


--UNIQUE -- 중복데이터 허용하지 않는다/NULL은 허용
CREATE TABLE TABLE_UNIQUE(
    LOGIN_ID VARCHAR2(20) UNIQUE,
    LOGIN_PWD VARCHAR2(20) NOT NULL,
    TEL VARCHAR2(20)
    );
    DESC TABLE_UNIQUE;
    
INSERT INTO TABLE_UNIQUE (LOGIN_ID, LOGIN_PWD, TEL)
VALUES('TEST01','1234','010-1111-2222');
INSERT INTO TABLE_UNIQUE (LOGIN_ID, LOGIN_PWD, TEL)
VALUES(NULL,'1234','010-1111-2222');

SELECT * FROM TABLE_UNIQUE;


--PRIMARY KEY  UNIQUE NOT NULL(유니크에 낫 널 )
DROP TABLE TABLE_PK;
CREATE TABLE TABLE_PK(
    LOGIN_ID VARCHAR2(20) PRIMARY KEY, -- UNIQUE NULL
    LOGIN_PWD VARCHAR2(20) NOT NULL,
    TEL VARCHAR2(20)
    );
    
DESC TABLE_PK;

--중첩 불가
INSERT INTO TABLE_PK(LOGIN_ID, LOGIN_PWD, TEL)
VALUES ('TEST01','5678','010-3333-4444'); -- 빈 공간은 안된다(NOT NULL)


--FOREIGN KEY 다른 테이블과 연관 관계 맺기
SELECT * FROM EMP;
INSERT INTO EMP (EMPNO, ENAME, JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
VALUES (1234,'HONG','CLERK',7698,SYSDATE,2100,NULL,50);
-->DEPTNO에50이 없기 때문에 에러 발생

INSERT INTO DEPT (DEPTNO,DNAME,LOC)
VALUES(50,'WEB','BUSAN'); --> 이걸 해줘야 입력 가능

SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME IN('EMP','DEPTNO');

----FOREIGN KEY----
--DROP 할때 안되는 경우가 있는데 그건 제약조건이 걸려 있기 때문이다
--DROP TABLE DEPT_FK CASCADE CONSTRAINTS;
CREATE TABLE DEPT_FK(
    DEPTNO NUMBER(2) CONSTRAINT DEPTFK_DEPTNO_PK PRIMARY KEY,
    --이름을 주고 싶을때  CONSTRAINT DEPTFK_DEPTNO_PK 이렇게 입력
    DNAME VARCHAR2(14),
    LOC VARCHAR2(20)
);

DROP TABLE DEPT_FK CASCADE CONSTRAINTS; -- 제약조건 무시하고 삭제할떄
DROP TABLE EMP_FK;

CREATE TABLE EMP_FK(
    EMPNO NUMBER(4) CONSTRAINT EMPFK_EMPNO_PK PRIMARY KEY,
    ENAME VARCHAR2(14),
    JOB VARCHAR2(20),
    MGR VARCHAR2(20),
    HIREDATE DATE,
    SAL NUMBER(7,2),  ---66667.76
    COMM NUMBER(7,2),  ---66667.76
    DEPTNO NUMBER(2) CONSTRAINT EMPFK_DEPTNO_FK REFERENCES DEPT_FK(DEPTNO)
    --참조하란 뜻 REFERENCE DEPT_FK (DEPTNO)
    );

INSERT INTO DEPT_FK (DEPTNO,DNAME,LOC)
VALUES(20,'DB','SEOUL');    
INSERT INTO EMP_FK (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
VALUES (1234,'KIM','CLERK',7698,SYSDATE,2100,NULL,10);  

SELECT * FROM DEPT_FK;

SELECT * FROM EMP_FK;

--FOREIGN은 이런식으로 삭제가 안된다 / 지울땐 자식요소를 다 끊고 지워야 한다
DELETE FROM DEPT_FK
WHERE DEPTNO = 10;


--- CHECK--글자수 체크
CREATE TABLE TABLE_CHECK(
    LOGIN_ID VARCHAR2(20) CONSTRAINT TB_CHECK_LOGINID_PK PRIMARY KEY,
    LOGIN_PWD VARCHAR2(20) CONSTRAINT TB_CHECK_LOGINPWD_CH CHECK (LENGTH(LOGIN_PWD) > 3),
    TEL VARCHAR2(20)
);    

INSERT INTO TABLE_CHECK
VALUES ('TEST_ID_01','1234','01-1111-2222');--3글자 쓰면 에러발생

--DEFAULT 기본 값 설정
CREATE TABLE TABLE_DEFAULT(
    LOGIN_ID VARCHAR2(20) CONSTRAINT TB_CHECK_LOGINID_PK02 PRIMARY KEY,
    LOGIN_PWD VARCHAR2(20) DEFAULT '1234',
    TEL VARCHAR2(20)
); 

INSERT INTO TABLE_DEFAULT (LOGIN_ID,TEL)
VALUES ('TEST_ID_02','01-1111-2222');
SELECT * FROM TABLE_DEFAULT;

-------문제--------------------

CREATE TABLE DEPT_CONST(
    DEPTNO NUMBER(2) CONSTRAINT DEPTCONST_DEPTNO_PK02 PRIMARY KEY,
    DNAME VARCHAR2(14) CONSTRAINT DEPTCONST_DEPTNAME_UNIQUE UNIQUE,
    LOC VARCHAR2(13) CONSTRAINT DEPTCONST_DEPTLCO_NOTNULL02 NOT NULL
);

DROP TABLE EMP_CONST;

CREATE TABLE EMP_CONST(
    EMPNO NUMBER(4) CONSTRAINT EMPCONST_EMPNO_PK PRIMARY KEY, 
	ENAME VARCHAR2(10) CONSTRAINT EMPCONST_ENAME_NN NOT NULL, 
	JOB VARCHAR2(9), 
	TEL VARCHAR2(20) CONSTRAINT EMPCONST_TEL_UNIQUE UNIQUE, 
	HIREDATE DATE, 
	SAL NUMBER(7,2) CONSTRAINT EMPCONST_SAL_CHK CHECK(SAL BETWEEN 1000 AND 9999), 
	COMM NUMBER(7,2), 
	DEPTNO NUMBER(2)CONSTRAINT EMPCONST_DEPTNO_FK REFERENCES DEPT_CONST (DEPTNO) 
	 );
     
     
SELECT TABLE_NAME, CONSTRAINT_NAME,CONSTRAINT_TYPE
FROM USER_CONSTRAINTS
WHERE TABLE_NAME IN('EMP_CONST','DEPT_CONST'); -- 테이블 네임이 이 이름 안에 있는 것



---------------사용자-------------
-- 생성 및 비밀 번호 설정
--권한 부여 필수 
CREATE USER ORCLSTUDY IDENTIFIED BY ORACLE;--SYS계정에 해야한다

--권한주기 PREV_HW에게
GRANT SELECT ON EMP TO PREV_HW;
GRANT SELECT ON DEPT TO PREV_HW;
GRANT SELECT ON SALGRADE TO PREV_HW;
REVOKE SELECT ON SALGRADE FROM PREV_HW;







------- TEST - ORCLSTUDY02와 연계
DROP TABLE TEMP;
CREATE TABLE TEMP (
    COL01 VARCHAR2(20),
    COL02 VARCHAR2(20)
    );
    
    
INSERT INTO TEMP VALUES ('002','두번째 데이터');    
SELECT * FROM TEMP;

--SCOTT 조회 할수 있게 ORCLSTUDY에 권한 주기
GRANT SELECT ON TEMP TO ORCLSTUDY02;

--SCOTT에 입력 할수 있게 ORCLSTUDY에 권한 주기
GRANT INSERT ON TEMP TO ORCLSTUDY02;
--REVOKE - 접근(조회)을 막아준다
REVOKE INSERT ON TEMP FROM ORCLSTUDY02;

SELECT * FROM ORCLSTUDY02.TEMP;
INSERT INTO ORCLSTUDY02.TEMP VALUES ('003','세번째 데이터'); 
