--���� �����ȿ� �� �ٸ� ���� ����
--SELECT(���� ����) �ȿ� SELECT(���� ����) ����

SELECT SAL 
FROM EMP
WHERE ENAME = 'JONES'; -->����

--JONES ���� ������ ���� ���
SELECT * 
FROM EMP
WHERE SAL > 2975;

--�������� �̿����� �ٷ� ��� ����
SELECT * 
FROM EMP
WHERE SAL > (
            SELECT SAL
            FROM EMP
            WHERE ENAME = 'JONES'
            ); -->������ ���� �ϴ� �̰��� ��ø ���� ������� Ī�Ѵ�(������ ����)
            
            
--���� ���� �̿��Ͽ� EMP���� �̸��� ALLEN�� �߰� ���纸�� ���� �߰� ������ �޴� �� �̱�
SELECT *
FROM EMP
WHERE COMM > (
            SELECT COMM
            FROM EMP
            WHERE ENAME = 'ALLEN'
            );
            
--BLAKE�� �Ի��� ���� �ʰ� �Ի��� ���
SELECT *
FROM EMP
WHERE HIREDATE > (
                SELECT HIREDATE
                FROM EMP
                WHERE ENAME = 'BLAKE'
                );
                
--20�� �μ��� ���� ��� �� ��ü ����� ��� �޿� ���� ���� �޿��� �޴� ��� ���� ���
SELECT E.EMPNO,E.ENAME,E.JOB,E.SAL,D.DEPTNO,D.DNAME,D.LOC
--���� ���̺��� �ƴϱ� ������ ������ �־�� �Ѵ� DEPT Ǯ������ �տ� ���� ��⿡ ���� ���
FROM EMP E, DEPT D-->D.DEPTNO,D.DNAME,D.LOC (D�� C�� ���� ����Ͽ� ���ϰ� ���)
WHERE E.DEPTNO = D.DEPTNO 
AND E.DEPTNO = 20 --20�� �μ�
AND E.SAL > (SELECT TRUNC(AVG(SAL)) FROM EMP);   -- ��ü����� ��� �޿�


-- IN,ANY,SOME,ALL - ������ �ϳ��� �ƴҶ� ���
-- �������� ������ ���� ���(������)
-- ���� �� ����

--�ַ� IN�� ���� ����Ѵ�
SELECT *
FROM EMP 
WHERE DEPTNO IN(20,30);--20�� �Ǵ� 30���� �μ�(IN�ȿ� ������ �Լ� ��� ����)

-- �� �μ��� �ְ�(max) �޿��� �޴� ��� ���ϱ�
SELECT *
FROM EMP
WHERE SAL IN (SELECT MAX(SAL) --> IN : �ȿ� �ִ� ��
              FROM EMP
              GROUP BY DEPTNO)
              ORDER BY DEPTNO;

--���� = �� �� �տ� ���ش� / ���� �̾ƿö� �ַ� ���
--ANY, SOME ���� �ϳ��� ������ ����(TRUE) - �տ� ������ �ٿ� �ش�
--ALL ������ ���� �����ؾ߸� TRUE�� �����Ѵ�
SELECT *
FROM EMP
WHERE SAL = SOME (SELECT MAX(SAL)
                 FROM EMP
                 GROUP BY DEPTNO);
                 
SELECT *
FROM EMP
WHERE SAL = ANY(1000,2000,3000); 
--> SAL�� �� ���� �ϳ��� ������ ���� ��������(ANY)
--> = ��� > �� ���̸� 1000�̻� ���� ���(SOME�� ����)
--> ALL�� ���� ���� ������ ���´�(������ ���� ���� �����Ͽ��� �ϱ� ����)

         
-- EXISTS : �˻��� ���� ������ ��ü�� ����Ѵ� ������ ��� ���� �ʴ´�
SELECT *
FROM EMP
WHERE EXISTS (SELECT DNAME 
              FROM DEPT
              WHERE DEPTNO = 10
              );
              
SELECT * FROM DEPT;              
    
--EMP���� 10�� �μ��� ���� ��� ����� ���� ���� �Ի��� ���    
SELECT *
FROM EMP -- ��� ���� ������ TABLE�̴�
WHERE HIREDATE < ALL
                (
                SELECT HIREDATE 
                FROM EMP
                WHERE DEPTNO = 10
                );
-- WHERE ���� ���� ���� ���� - ��ø ���� ����
-- FROM ���� ���� ���������� ���� �ζ��� ��(��ü ���̺��� �Ϻθ� ����ŷ �ؼ� ��� ����� ��)

-- FROM(�ζ��� ��) �� ��� ��
SELECT * 
FROM EMP
WHERE DEPTNO = 10;

SELECT * 
FROM DEPT;

--INLINE VIEW

--��������  / ���� - �� �Ǵ��Ͽ� ����Ͽ��� �Ѵ�
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
FROM (SELECT * FROM EMP WHERE DEPTNO = 10) E10, -->EMP E10(����)�� ���� ��
     (SELECT * FROM DEPT) D -->DEPT D
     --> TABLE�� ��� ���� �Ͱ� ���� ��
WHERE E10.DEPTNO = D.DEPTNO;


--SELECT�� - ��Į�� ��������(�÷��� ���� ����/������ ������)
--FROM - INLINE VIEW
--WHERE�� - ���� ���� ���� ��ø��������(���� ��Ī�� ����) / ������ ����
-->������ ���� ���� ���� ��� ����
SELECT EMPNO, ENAME, JOB, SAL,
        (SELECT GRADE FROM SALGRADE WHERE E.SAL BETWEEN LOSAL AND HISAL) AS SALGRADE, 
        -->�÷� ����
        DEPTNO,
        (SELECT DNAME FROM DEPT WHERE E.DEPTNO = DEPT.DEPTNO) AS DNAME
FROM EMP E;

--SELECT GRADE FROM SALGRADE;

--���� ���� 
--0901��
SELECT E.JOB, E.EMPNO, E.ENAME, E.SAL, E.DEPTNO, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND JOB = (SELECT JOB FROM EMP WHERE ENAME = 'WARD');
--> (SELECT JOB FROM EMP WHERE ENAME = 'WARD')���� �ش�Ǵ� ����(��ø�������� ����)
--> �ٷ� ������ 'SALESMAN'�� �ᵵ �ȴ�


--0902��
SELECT E.EMPNO, E.ENAME, D.DNAME, E.HIREDATE, D.LOC, E.SAL, S.GRADE
FROM EMP E, DEPT D, SALGRADE S
WHERE E.DEPTNO = D.DEPTNO 
AND E.SAL > (SELECT TRUNC(AVG(SAL)) FROM EMP)
AND E.SAL BETWEEN S.LOSAL AND S.HISAL
ORDER BY E.SAL DESC, E.EMPNO; -->DESC(������ ǥ�� �Ҷ�)


--0903��
SELECT E.EMPNO, E.ENAME, E.JOB, E.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND E.DEPTNO = 10
AND E.JOB NOT IN(SELECT JOB FROM EMP WHERE DEPTNO = 30); --> ������ �Լ����� IN ���
-->JOB NOT IN -> ���� 30�� �μ��� ���� ����

--SELECT JOB FROM EMP WHERE DEPTNO = 30; 30�� �μ��� JOB

--0904��-01
SELECT E.EMPNO, E.ENAME, E.SAL, S.GRADE
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
AND E.SAL > (SELECT MAX(SAL)FROM EMP WHERE JOB = 'SALESMAN')
ORDER BY E.EMPNO;

SELECT MAX(SAL)
FROM EMP
WHERE JOB = 'SALESMAN';

--0904��-02 ������
SELECT E.EMPNO, E.ENAME, E.SAL, S.GRADE
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
AND E.SAL > ALL(SELECT SAL FROM EMP WHERE JOB = 'SALESMAN') --ANY,ALL,IN(������)
ORDER BY E.EMPNO;

--�μ� ��ȣ 20���� �ִ� ������� �޿����� �ش��ϴ� JOB�� ��� �޿��� ���̸� ���غ�����

SELECT E.EMPNO, E.ENAME, E.JOB,E.SAL,
E.SAL - (SELECT TRUNC(AVG(SAL)) AS AVG FROM EMP EE WHERE E.JOB = EE.JOB) AS AVG_SAL_DIFF
FROM EMP E
WHERE DEPTNO =20;


SELECT TRUNC(AVG(SAL)) AS AVG 
FROM EMP EE WHERE E.JOB = EE.JOB;






----TABLE ���� ������ �־��---------


------INSERT UPDATE DELETE -�̰͵��� DML�̶�� �Ѵ� ----

--DROP - ���̺��� ��� ���
DROP TABLE DEPT_TEMP; --> TABLE�� ����� ���� ���ֱ�

CREATE TABLE DEPT_TEMP
    AS SELECT * FROM DEPT ;--> �����Ҷ� AS �� ���(TABLE ����)
    --AS SELECT * FROM DEPT WHERE 1 = 0;
--> WHERE 1 = 0; �����⸸ �����ö� �̷� �����ڸ� ��д�
SELECT *FROM DEPT_TEMP;


--�߰��� �ְ� ������
INSERT INTO DEPT_TEMP (DEPTNO,DNAME,LOC) --> ���̺��(�÷���)
VALUES (50, 'DATABASE', 'SEOUL');--> ��

INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
VALUES (60, 'JAVA', 'BUSAN'); 
--> ������ ���� �߿� / ������ ����(�÷��� ���� �����ϰ� ���� ��� ���¿���(NULL))

INSERT INTO DEPT_TEMP --> ������ �����ϴ�
VALUES (70,'NETWORK','DANGSAN'); --> �÷� ������ ��Ȯ�� ���� �Է�

INSERT INTO DEPT_TEMP
VALUES (80,'WEB',NULL);-->����('') �Ǵ� NULL���� �־��ָ� �ȴ�


----EMP �����ؼ� ���� ������ �־��
DROP TABLE EMP_TEMP;
CREATE TABLE EMP_TEMP
    AS SELECT * FROM EMP;
    
SELECT * FROM EMP_TEMP;    

INSERT INTO EMP_TEMP --> �÷� �Է� �ص� �ǰ� ���ص� ��(�Ȱ��� ���� ���ٸ� ������ ����)
VALUES ('1','�����','�л�',NULL,'2021-10-21',NULL,NULL,NULL);
--> ��¥�� 18/01/2022��� ���� ������ ������ ���� ���� ���
 -- TO_DATE('18/01/2022','DD/MM/YYYY')�̷��� ���ָ� ����� �����ϴ�
 -- SYSDATE �� ���� ��¥

INSERT INTO EMP_TEMP
VALUES ('1','�����','�л�',NULL,SYSDATE,NULL,NULL,NULL);

-- ���� ������ �ִ� SMITH�� JAMES �߰�
INSERT INTO EMP_TEMP
SELECT E.*
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL AND S.GRADE = 1;
-->���� ������(���� �صа� �״�� ������ �ȴ�) ���� ��� VALUES�� ���� �ʴ´�
-->������ Ÿ���� ���ƾ� �ϰ� ������ ���ƾ� �Ѵ�

SELECT * FROM EMP_TEMP;


--UPDATE - ������ ������ �޾Ƽ� ����ؾ� �Ѵ�
CREATE TABLE DEPT_TEMP02
AS SELECT * FROM DEPT;

--DML
UPDATE DEPT_TEMP02
SET LOC = 'SEOUL',-->LOC�� ������ ���� / ������ ���� ��� ���� �ٲ��
    DNAME = 'DB' -- ������ �� SET�ȿ�
WHERE DEPTNO = 40;

COMMIT;--> ����(�ǵѸ� �� ����)
ROLLBACK; --> COMMIT������ �ٽ� ���󺹱� ��ų �� �ִ�

SELECT * FROM DEPT_TEMP02;

SELECT * FROM EMP_TEMP;
--2500 ������ ����� COMM 50
UPDATE EMP_TEMP
SET COMM = 50
WHERE SAL <= 2500;

ROLLBACK;
COMMIT;

----DELETE
DELETE FROM EMP_TEMP
WHERE JOB = 'CLERK'; --> JOB�� CLERK�� ��� ����

SELECT * FROM EMP_TEMP;

--30�� �μ��� GRADE =3�� ��� ���� ������
DELETE FROM EMP_TEMP --> ���� ����(���� �ʿ�)
WHERE EMPNO IN(
SELECT EMPNO 
FROM EMP_TEMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL 
AND S.GRADE = 3
AND E.DEPTNO = 30);

SELECT * FROM SALGRADE;

ROLLBACK;

SELECT * FROM EMP_TEMP;

--INSERT INTO TABLE�� () VALUES ();
--DELETE FROM TABLE�� WHERE ����;
--UPDATE TABLE�� SET �÷��� WHERE ����;


---- ����-----

CREATE TABLE CHAP10HW_EMP
AS SELECT * FROM EMP;

CREATE TABLE CHAP10HW_DEPT
AS SELECT * FROM DEPT;

CREATE TABLE CHAP10HW_SALGRADE
AS SELECT * FROM SALGRADE;

INSERT INTO CHAP10HW_DEPT(DEPTNO,DNAME,LOC) VALUES(50,'ORACLE','BUSAN');
INSERT INTO CHAP10HW_DEPT(DEPTNO,DNAME,LOC) VALUES(60,'SQL','ILSAN');
INSERT INTO CHAP10HW_DEPT(DEPTNO,DNAME,LOC) VALUES(70,'SELECT','INCHEON');
INSERT INTO CHAP10HW_DEPT(DEPTNO,DNAME,LOC) VALUES(80,'DML','BUNDANG');

ROLLBACK;

SELECT * FROM CHAP10HW_DEPT;

COMMIT;

INSERT INTO CHAP10HW_EMP
--VALUES(7201, 'TEST_USER','MANAGER',7788,TO_DATE('2016-01-02','YYYY-MM-DD-'),4500,NULL,50);
--values (7201,'TEST_USER1','MANAGER',7788,'2016/01/02',4500,NULL,50);
--values (7202,'TEST_USER2','CLERK',7201,'2016/02/21',1800,NULL,50);
--values (7203,'TEST_USER3','ANALYST',7201,'2016/04/11',3400,NULL,60);
--values (7204,'TEST_USER4','SALESMAN',7201,'2016/05/31',2700,300,60);
--values (7205,'TEST_USER5','CLERK',7201,'2016/07/20',2600,NULL,70);
--values (7206,'TEST_USER6','CLERK',7201,'2016/09/08',2600,NULL,70);
--values (7207,'TEST_USER7','LECTURER',7201,'2016/10/28',2300,NULL,80);
values (7208,'TEST_USER8','STUDENT',7201,'2018/03/09',1200,NULL,80);

SELECT * FROM CHAP10HW_EMP;
COMMIT;


UPDATE CHAP10HW_EMP
SET DEPTNO = 70 --> 70������ �ٲٰ�
WHERE SAL >(SELECT AVG(SAL) FROM CHAP10HW_EMP
WHERE DEPTNO = 50); --> 50���� �μ��� �ִ� ������� ���� ��� ���� ū ���

UPDATE CHAP10HW_EMP
SET SAL = SAL*1.1,
    DEPTNO = 80
WHERE HIREDATE > (SELECT MIN(HIREDATE) FROM CHAP10HW_EMP WHERE DEPTNO = 60);
ROLLBACK;
COMMIT;

--�޿� ����� 5����� ��� ����
DELETE FROM CHAP10HW_EMP
WHERE EMPBO = (SELECT E.EMPNO
                FROM CHAP10HW_EMP E, CHAP10HW_SALGRADE S
                WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL AND S.GRADE = 5);
                
SELECT * FROM CHAP10HW_EMP;


-------------TRANSACTION-----------------
-- ������ ���̽� ���ӽ� ���赵

--�ٸ� SCOTT �����ؼ� �׽�Ʈ ����
 -->���ÿ� �α������� ����(���� ����)�� �� ��� ���� �߻�(LOCK�ɸ�) / �� ��ġ���� COMMIT�� �� �ؾ� ��
    --������ COMMIT�� �ؾ����� ���� ���� �������� ���� �����ϰ� ��

DROP TABLE DEPT_TCL;
CREATE TABLE DEPT_TCL
AS SELECT * FROM DEPT;

INSERT INTO DEPT_TCL VALUES (50,'DATABASE','INCHEON');
UPDATE DEPT_TCL SET LOC = 'BUSAN' WHERE DEPTNO = 40;
DELETE FROM DEPT_TCL WHERE DEPTNO = 50;

SELECT * FROM DEPT_TCL;

ROLLBACK;

COMMIT;

--TEST
UPDATE DEPT_TCL SET DNAME = 'JAVA'
WHERE DEPTNO = 10;

SELECT * FROM DEPT_TCL;


--DML ---> INSERT UPDATE DELETE (COMMIT/ROLLBACK�� ������ ���� ������)
        --> �����͸� �ٷ�� ��
--DDL ---> DEFINATION(����) TABLE �����...
        --> ������ �ٷ��

DROP TABLE EMP_DDL;

--DDL TABLE/INDEX/VIEW ����� DB��ɾ� (COMMIT/ROLLBACK�� ����)
CREATE TABLE EMP_DDL(-->'_'�̰͸� �� �� �ִ�(ó���� ���ڷ� ����,���� �ȵ�)
  ENPNO VARCHAR2(4) NOT NULL, -->NULL ���� �Է��ϸ� �ȵȴٴ� ��
  ENAME VARCHAR2(10),
  JOB   VARCHAR2(9),
  MGR   NUMBER(4),
  HIREDATE  DATE,
  SAL   NUMBER(7,2), --> 7�� ���� �ι�°�� �Ҽ��� �ø��� ��
  COMM  NUMBER(7,2),
  DEPTNO    NUMBER(2)
);
SELECT * FROM EMP_DDL;
INSERT INTO EMP_DDL VALUES(7877,'KING','PRESIDENT',NULL,TO_DATE('2022-01-18','YYYY-MM-DD'),5000,NULL, 10);
INSERT INTO EMP_DDL VALUES(7878,'BLAKE','MANAGER',7877,TO_DATE('2020-01-10','YYYY-MM-DD'),3000,NULL, 20);
INSERT INTO EMP_DDL VALUES(1001,'SCOTT','FREE',7877,SYSDATE,5000,NULL, NULL);
INSERT INTO EMP_DDL VALUES(1002,'JANG','FREE',7877,SYSDATE,55555.55,NULL, 10);

CREATE TABLE EMP_DEPT_DDL
AS SELECT E.EMPNO,E.ENAME,E.JOB,E.MGR,E.HIREDATE,E.SAL,E.COMM,D.DEPTNO, D.DNAME,D.LOC
FROM EMP E, DEPT D
WHERE 1 = 0;

SELECT * FROM EMP_DEPT_DDL;

DROP TABLE EMP_DEPT_DDL;

DROP TABLE EMP_ALTER;

CREATE TABLE EMP_ALTER 
AS SELECT * FROM EMP;

SELECT * FROM EMP_ALTER;

-- ALTER
-- TABLE ����

--�÷� �߰� ADD
ALTER TABLE EMP_ALTER
ADD HP VARCHAR2(20);

-- �÷� �̸� �ٲٱ� RENAME
ALTER TABLE EMP_ALTER
RENAME COLUMN HP TO TEL;

-- �÷� Ÿ�� �ٲٱ� MODIFY
ALTER TABLE EMP_ALTER
MODIFY EMPNO NUMBER(5);

DESC EMP_ALTER;

-- ����....
ALTER TABLE EMP_ALTER
DROP COLUMN HP;


-- TABLE ���鶧 CREATE  �����Ҷ� ALTER 
    
     
--- TABLE�� �̸� �ٲٱ�
RENAME EMP_ALTER TO EMP_RENAME;

SELECT * FROM EMP_RENAME;

-- ���̺� ����
CREATE TABLE EMP_ALTER 
AS SELECT * FROM EMP;

--- TABLE�� ����.....
DROP TABLE EMP_RENAME;

DESC EMP_RENAME;

SELECT * FROM EMP_ALTER;

-- ������ ����...
TRUNCATE TABLE EMP_ALTER;

