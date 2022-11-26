-- ������(�������� ���� �̿�)
-- �ַ� ��ü ���� ���Ҷ� / ��հ� ���ϱ�(�޿�)

--��ü �� ���� ��
SELECT SUM(SAL) AS TOTAL
FROM EMP;

--��� ���� ��
SELECT TRUNC(AVG(SAL)) AS AVG
FROM EMP;

--���� ū ���� ���� ��
SELECT MAX(SAL) AS MAX
FROM EMP;

--���� ���� ���� ���� ��
SELECT MIN(SAL) AS MIN
FROM EMP;

--�� ������ ���� �� - COMM�� ������� �ʴ´� (NULL ���� ã�� ����)
--���� * �� ����Ѵ� - ���� ���ڰ� ���� ���� ������ ���� �ȴ�
SELECT COUNT(*) AS COUNT
FROM EMP;

SELECT * FROM EMP;

--���� �ϳ��� �� ���� �Ѳ����� ����ϱ�
SELECT SUM(SAL) AS SUM_TOTAL,
       TRUNC(AVG(SAL)) AS AVG,
       MAX(SAL) AS MAX,
       MIN(SAL) AS MIN,
       COUNT(*) AS TOTAL
FROM EMP;

-- DEPTNO(�μ�)�� 30�� ����� COUNT�ϰ� �ϴ� ��
SELECT COUNT(*)
FROM EMP
WHERE DEPTNO = 30;

-- 30�μ��� ���� ���� ���� �޴� ����� ���� �۰� �޴� ���...
SELECT MAX(SAL) AS MAX, MIN(SAL) AS MIN
FROM EMP
WHERE DEPTNO = 30;

-- ���� �ֱٿ� �Ի��� ���
SELECT MAX(HIREDATE),MIN(HIREDATE)
FROM EMP;
--> MAX�� �ֱ� MIN�� �ʰ�

-- �� �μ��� ��� ���� ���ϱ�
SELECT TRUNC(AVG(SAL)), '10' AS DEPTNO FROM EMP WHERE DEPTNO = 10
UNION ALL
SELECT TRUNC(AVG(SAL)), '20' AS DEPTNO FROM EMP WHERE DEPTNO = 20
UNION ALL
SELECT TRUNC(AVG(SAL)), '30' AS DEPTNO  FROM EMP WHERE DEPTNO = 30;
--> ���ڸ� ���� ���ڸ� ����('') �ϳ��� �����ؿ� ���� �߻����� ����

--����Ŭ���� �����ϴ� GROUP BY (���� �� ����)
SELECT TRUNC(AVG(SAL)) AS AVG,
       DEPTNO 
       -->������ �Լ��� ���� ���� �ִ� �Լ��� ���� ������(�÷� ������ �ٸ��� ����) �̶� GROUP BY�� ���ָ� �ȴ�
FROM EMP
GROUP BY DEPTNO 
--> �μ��� �׷� ���� ���� ���� ����
ORDER BY AVG DESC;  -- ORDER BY �� �׻� ���� ���߿�

--�μ��� ��å Ȯ�� 
SELECT DEPTNO, JOB, TRUNC(AVG(SAL)) AS AVG, COUNT(JOB) AS COUNT
-->COUNT(JOB)/ (*)�� �ᵵ �ȴ� - ��å ���� 
FROM EMP
GROUP BY DEPTNO, JOB --> �׷��� �μ��� ��å �Ѵٷ� ���� �� �ִ�
ORDER BY DEPTNO, AVG;

-- HAVING(������) ��  GROUP�� ������� ����. / �׷��Լ��� �Ϲ� ���� ���� ������
SELECT DEPTNO, JOB, TRUNC(AVG(SAL)) AS AVG
FROM EMP
GROUP BY DEPTNO, JOB
HAVING AVG(SAL) >= 2000 --> HAVING(����,WHERE�� �������϶���) 2000�̻� ���� ������ 
ORDER BY DEPTNO, JOB;

--SELECT �⺻���� �� WHERR ����
SELECT DEPTNO, JOB, TRUNC(AVG(SAL)) AS AVG -- �÷���
FROM EMP -- ���̺� ��
WHERE SAL <= 3000 --> 3000������ �ֵ鸸 ���
GROUP BY DEPTNO, JOB
HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO, JOB;


-- �μ��� ��å ��� �޿��� 1000�̻��� ������� DEPTNO, JOB, TRUNC(AVG(SAL)) AS AVG �̾ƺ���....
SELECT DEPTNO, JOB, TRUNC(AVG(SAL)) AS AVG
FROM EMP
GROUP BY DEPTNO, JOB
HAVING AVG(SAL) >= 1000
ORDER BY DEPTNO, JOB;

--ROLLUP(JOB)- ������� ���� �ִ� �� (Ư���� �����͸� ���� �÷� ǥ���ϴ� ��)
SELECT JOB, SUM(SAL) AS SAL_TOTAL
FROM EMP
GROUP BY ROLLUP(JOB);

SELECT DEPTNO,JOB,SUM(SAL)
FROM EMP
GROUP BY ROLLUP(JOB,DEPTNO);

-- ������
SELECT DEPTNO, JOB, COUNT(*) AS COUNT,MAX(SAL) AS HIGH,SUM(SAL) AS SUM_TOTAL, TRUNC(AVG(SAL)) AS AVG
FROM EMP
GROUP BY ROLLUP(DEPTNO,JOB) -- �׷� DEPTNO�� JOB�� �������� �ܰ躰�� �԰踦 ����� �ش�
ORDER BY DEPTNO,JOB;

--GROUPING SET - �׷��� �ϴµ� ����� �����ش�
SELECT DEPTNO, JOB, COUNT(*) AS COUNT
FROM EMP
GROUP BY GROUPING SETS(DEPTNO,JOB) -- �׷��� ���� ���� �հ踦 �����ش�
ORDER BY DEPTNO, JOB;

--���ȣ �� NULL�̳� ()�� ����Ͽ� �� �հ踸 ��Ÿ���� ���ش�
SELECT DEPTNO, JOB, COUNT(*) AS COUNT
FROM EMP
GROUP BY GROUPING SETS((DEPTNO,JOB),()) --() ���ȣ ��ſ� NULL�� �ᵵ �ȴ�.
ORDER BY DEPTNO, JOB;

--GROUPING 0�� 1�� ��Ÿ���� 1�� �� �հ踦 ���Ѵ�
SELECT DECODE(GROUPING(DEPTNO),1,'�μ��� ����',DEPTNO) AS DEPT_NUMBER,
       DECODE(GROUPING(JOB),1,'���޺� ����',JOB) AS JOB_NUM,
       -->1�� ǥ�õǴ� �κ��� �μ���, ���޺��� ����, ��ġ JOB�� DEPTNO����
DEPTNO, JOB, COUNT(*), MAX(SAL) AS HIGH, SUM(SAL) AS SUM_TOTAL, TRUNC(AVG(SAL)) AS AVG
FROM EMP
GROUP BY ROLLUP(DEPTNO, JOB)
ORDER BY DEPTNO, JOB;

--DECODE ����Ŭ������ ���� ���ǹ�

--LISTAGG ��� ������ ��� (�� ������ �ʴ´�)
SELECT DEPTNO,
       LISTAGG(ENAME,',')  -- LISTAGG(��ġ�� �÷���, ������) WITHIN GROUP ( ORDER BY �÷���)
       WITHIN GROUP( ORDER BY SAL DESC) AS ENAMES --> ���� ���� �޴� �����       
FROM EMP
GROUP BY DEPTNO;

SELECT * FROM EMP;

-- ������ �����ϱ�
SELECT LISTAGG(ENAME,'/') 
       WITHIN GROUP( ORDER BY ENAME) AS ENAMES
       -->�̸��� ������ ����
FROM EMP
WHERE JOB IN ('MANAGER','SALESMAN'); --> ���� �ȿ� �ִ� ����� �̰ڴ�


------------ TABLE ����� �� -----------------
DROP TABLE MONTH_SALES; -- > ���̺� ����

CREATE TABLE MONTH_SALES ( --> ���̺� ��
    PRODUCT_ID VARCHAR2(10), --> �÷��� / ������ Ÿ��(VARCHAR2(� ������ �ִ���))
    MONTH VARCHAR2(10), --> VARCHAR2 : ���� ������
    COMPANY VARCHAR2(20),
    MONEY NUMBER(10) --> NUMBER : ���ڳ�����
);


-- ���� ���̺� ������ �ִ� ��
INSERT INTO MONTH_SALES VALUES('P001','2021/12','SAMSUNG',10000);
INSERT INTO MONTH_SALES VALUES('P001','2021/11','SAMSUNG',12000);
INSERT INTO MONTH_SALES VALUES('P001','2021/10','SAMSUNG',15000);
INSERT INTO MONTH_SALES VALUES('P001','2021/09','SAMSUNG',18000);
INSERT INTO MONTH_SALES VALUES('P001','2021/08','SAMSUNG',9000);
--> INSERT INTO - ������ ����
--> �� ���� ���̺� ��  VALUES - ��
-->VARCHAR2 ���� / NUMBER ���� ���� �ؼ� ����

INSERT INTO MONTH_SALES VALUES('P002','2021/12','APPLE',30000);
INSERT INTO MONTH_SALES VALUES('P002','2021/11','APPLE',19000);
INSERT INTO MONTH_SALES VALUES('P002','2021/10','APPLE',12000);
INSERT INTO MONTH_SALES VALUES('P002','2021/09','APPLE',13000);
INSERT INTO MONTH_SALES VALUES('P002','2021/08','APPLE',100000);


INSERT INTO MONTH_SALES VALUES('P003','2021/12','LG',12000);
INSERT INTO MONTH_SALES VALUES('P003','2021/11','LG',80000);
INSERT INTO MONTH_SALES VALUES('P003','2021/10','LG',101000);
INSERT INTO MONTH_SALES VALUES('P003','2021/09','LG',50000);
INSERT INTO MONTH_SALES VALUES('P003','2021/08','LG',19000);

--INSERT(�߰�) SELECT(�о���� ��) UPDATE(����)  DELETE(����)    CRUD(4�� ���ļ� �̷��� �θ���)

--���ﶧ�� DELETE
DELETE FROM MONTH_SALES;

ROLLBACK;--�ǻ�Ƴ��� ����� �ִ�
COMMIT;--������

SELECT * FROM EMP;
SELECT * FROM MONTH_SALES;

SELECT PRODUCT_ID, MONTH, SUM(MONEY) AS TOTAL
FROM MONTH_SALES
-->GROUP BY �Ⱦ��� ���� �߻�(�׷�� ������ �Լ��� ���� ���� ���� ����
GROUP BY rollup(PRODUCT_ID,MONTH);

--���� (���� ����)
SELECT MONTH, PRODUCT_ID,  SUM(MONEY) AS TOTAL
FROM MONTH_SALES
GROUP BY ROLLUP(MONTH,PRODUCT_ID);

--CUBE - ����� ���� ���� �̾��ش�(����)
SELECT MONTH, PRODUCT_ID,  SUM(MONEY) AS TOTAL
FROM MONTH_SALES
GROUP BY CUBE(MONTH,PRODUCT_ID);

-- �� ����
SELECT PRODUCT_ID, MONTH, COMPANY, SUM(MONEY) AS TOTAL
FROM MONTH_SALES
GROUP BY GROUPING SETS((PRODUCT_ID,MONTH),COMPANY);
--> ((PRODUCT_ID,MONTH),COMPANY) ID�� ���� �׷� - COMPANY�� �԰�


SELECT 
       CASE GROUPING(PRODUCT_ID) WHEN 1 THEN '��� ��ǰ' ELSE PRODUCT_ID END AS PRODUCT_ID,
       CASE GROUPING(MONTH)      WHEN 1 THEN '��� ��'   ELSE MONTH END AS MONTH,
       SUM(MONEY) AS MONEY_TOTAL
FROM MONTH_SALES
GROUP BY ROLLUP(PRODUCT_ID,MONTH);

--����Ŭ ������ ��� ����
--SELECT DECODE(GROUPING(DEPTNO):����,1:��,'�μ��� ����':���� ���,DEPTNO:������ ���) AS DEPT_NUMBER,
--       DECODE(GROUPING(JOB),1,'���޺� ����',JOB) AS JOB_NUM,
--DEPTNO, JOB, COUNT(*), MAX(SAL) AS HIGH, SUM(SAL) AS SUM_TOTAL, TRUNC(AVG(SAL)) AS AVG
--FROM EMP
--GROUP BY ROLLUP(DEPTNO, JOB)
--ORDER BY DEPTNO, JOB;





SELECT DEPTNO,JOB,MAX(SAL) AS HIGH
FROM EMP
GROUP BY DEPTNO,JOB
ORDER BY DEPTNO,JOB;

-- SELECT * FROM (�ǹ���ų ����... �� ���� �� ����)
-- PIVOT(�׷��Լ�(������ �÷�) FOR �ǹ��÷� IN (�ǹ� �÷��� AS ����)))
-- �ο�� �÷��� �ٲ� �� �� �ִ�

SELECT *
FROM (SELECT DEPTNO , JOB , SAL FROM EMP)  -- ��������(���� �� �� �ٸ� ����)
PIVOT(MAX(SAL) FOR DEPTNO IN (10,20,30)) -->FOR(���)DEPTNO IN (�ȿ���) 
ORDER BY JOB;



--����
SELECT * FROM (SELECT DEPTNO , JOB , SAL FROM EMP)
PIVOT( MAX(SAL) FOR JOB IN (
                            'CLERK' AS ���,
                            'SALESMAN' AS �������,
                            'MANAGER' AS ������,
                            'ANALYST' AS �м���,
                            'PRESIDENT' AS ����
                           ))
ORDER BY DEPTNO;

--�޺� �Ի��η��� �̾ƺ���....
--SELECT JOB,TO_CHAR(HIREDATE,'FMMM') AS HIRE_MONTH FROM EMP;

SELECT JOB,TO_CHAR(HIREDATE,'MM') AS HIRE_MONTH
FROM EMP
GROUP BY HIREDATE,JOB;

SELECT * FROM (SELECT JOB,TO_CHAR(HIREDATE,'FMMM') ||'��' AS HIRE_MONTH FROM EMP)
PIVOT( COUNT(*) FOR HIRE_MONTH IN ('1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��') );
-->||'��' -���ڿ��� ������ ������ ���̶� �÷��� �������� �ʱ� ������ ���� ������ �ʱ� �����̴�
-->TO_CHAR(HIREDATE,'FMMM') -> FM : 1,2,3,4�� �������� �ϱ� ���� ������ 01,02,03���� ��������



----------------------------------------------PRACTICE---------------------------------------

SELECT DEPTNO , TRUNC(AVG(SAL)) AS AVG, MAX(SAL) AS MAX, MIN(SAL) AS MIN, COUNT(*) AS COUNT
FROM EMP
GROUP BY DEPTNO; -- ������ �� �׷����� �Բ��϶� �׷����� ������ �Ѵ�

--3�� �̻��� ������ �ִ� ���� ã��
SELECT JOB, COUNT(*) AS COUNT
FROM EMP
GROUP BY JOB
HAVING COUNT(*) >= 3
ORDER BY COUNT;

--�Ի翬�� �������� ���� Ȯ��
SELECT TO_CHAR(HIREDATE,'YYYY') AS HIRE_YEAR,DEPTNO, COUNT(*) AS CNT
FROM EMP
GROUP BY TO_CHAR(HIREDATE,'YYYY'),DEPTNO
ORDER BY HIRE_YEAR;

--�߰����� �޴� ����� ���� �ʴ� ��� ã��
SELECT NVL2(COMM,'O','X') AS EXIST_COMM, COUNT(*) AS CNT
FROM EMP
GROUP BY NVL2(COMM,'O','X');

--�߰� ��� ��(�μ�(��)�� �Ի翬��)
SELECT DEPTNO,
       TO_CHAR(HIREDATE,'YYYY') AS HIRE_YEAR,
       COUNT(*) AS CNT,
       MAX(SAL) AS MAX_SAL,
       SUM(SAL) AS SUM_SAL,
       TRUNC(AVG(SAL)) AS AVG_SAL
FROM EMP
GROUP BY ROLLUP(DEPTNO,TO_CHAR(HIREDATE,'YYYY'));



---------------TABLE ---------------
--���� -  ���̺� �ΰ� �����ؼ� ���
SELECT * 
FROM EMP,DEPT; --> ��� ���� ������ �� �� �� �ִ�

--���� �ʿ�
SELECT * 
FROM  EMP E , DEPT D --> ���� ����
WHERE E.DEPTNO = D.DEPTNO; --> �÷��� �տ� ���̺� ��(����)�� �ٿ� �� �� �ִ�


-- INNER JOIN : �ΰ��� �ٿ��� ���� (�����ؼ� ���� ����)
SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO --> �ΰ��� ���� ��츸 ���
ORDER BY D.DEPTNO DESC, E.EMPNO ASC; 

-- �ϳ��� �ִ� �÷����� ���̺�� ���� ����
SELECT EMPNO, ENAME, D.DEPTNO, DNAME, LOC 
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND SAL >= 2500
ORDER BY D.DEPTNO DESC, E.EMPNO ASC;


-- �� �(���� ���� ���� ���� ��) ����--
SELECT * 
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL; 
-->E.SAL BETWEEN(����� ���̿�) S.LOSAL AND S.HISAL(�� �ΰ� ����)

SELECT * 
FROM EMP E, SALGRADE S
WHERE E.SAL = S.HISAL;

---- SELF JOIN---- �ڱⰡ �ڱ⸦ �ѹ� �� ����....
SELECT E1.EMPNO,E1.ENAME, E1.MGR,
       E2.EMPNO AS MGR_NO,
       E2.ENAME AS MGR_NAME
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO;


SELECT E1.EMPNO, E1.ENAME, E1.MGR,
       E2.EMPNO AS MGR_NO,
       E2.ENAME AS MGR_NAME
FROM EMP E1,EMP E2
WHERE E1.MGR = E2.EMPNO(+)  -- LEFT(���ؿ��� ����) OUTER JOIN(�ܺ�����) �� ��� ���̺� ���� ��� ���Ͷ�
ORDER BY E1.EMPNO;          -- ����ڰ� ���� ��쵵 ���(���ǿ� �����Ǵ� ���� ���)


SELECT E1.EMPNO, E1.ENAME, E1.MGR,
       E2.EMPNO AS MGR_NO,
       E2.ENAME AS MGR_NAME
FROM EMP E1,EMP E2
WHERE E1.MGR(+) = E2.EMPNO  -- RIGHT OUTER JOIN �� ��� ���̺� ���� ��� ���Ͷ�...
ORDER BY E1.EMPNO;          -- �ڱⰡ �����ڰ� �ƴ� ���



----- ANSI JOIN(ǥ������ - �ٸ� �������� ��� ���� (MY SQL ��)) --------
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, DEPTNO, D.DNAME, D.LOC
FROM EMP E NATURAL JOIN DEPT D;
--ORDER BY DEPTNO, E.EMPNO; - �Ƚᵵ �Ȱ���
--������ ���� ���̺� ���� �Ⱥ��̰� ��� 
--FROM���� ���

-- NATURAL JOIN ���� �ٸ� ���
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, DEPTNO, D.DNAME, D.LOC
FROM EMP E JOIN DEPT D USING (DEPTNO)
ORDER BY DEPTNO, E.EMPNO;


-- ����� �̰� �̳�����(������)�� ��
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, E.DEPTNO, D.DNAME, D.LOC
FROM EMP E JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
WHERE SAL < 3000
ORDER BY DEPTNO, E.EMPNO;
--> �̰��� DEPTNO�տ� ���̺�� �Է�
--> ON : ���� (���� ���� ����Ѵ�)

----LEFT OUTER JOIN �ٸ� ��� -----
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
       E2.EMPNO AS MGR_NO,
       E2.ENAME AS MGR_NAME
FROM EMP E1 LEFT OUTER JOIN  EMP E2 ON (E1.MGR = E2.EMPNO)
ORDER BY E1.EMPNO;          -- ����ڰ� ���� ��쵵 ���.....

----RIGHT OUTER JOIN -----
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
       E2.EMPNO AS MGR_NO,
       E2.ENAME AS MGR_NAME
FROM EMP E1 RIGHT OUTER JOIN  EMP E2 ON (E1.MGR = E2.EMPNO)
ORDER BY E1.EMPNO;          

----FULL OUTER JOIN : �Ѵ� ��� -----
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
       E2.EMPNO AS MGR_NO,
       E2.ENAME AS MGR_NAME
FROM EMP E1 FULL OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO)
ORDER BY E1.EMPNO;         




--------------------------------------------8�� ���� Ǯ��------------------------
--   8-1 ORACLE
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND E.SAL > 2000;

--SELECT DEPTNO, D.DNAME,E.EMPNO, E.ENAME,E.SAL
--FROM EMP E NATURAL JOIN DEPT D
--WHERE E.SAL > 2000;  -> FROM �� ��� ��

--   8-1 ANSI
SELECT D.DEPTNO, D.DNAME,E.EMPNO, E.ENAME,E.SAL
FROM EMP E JOIN DEPT D ON (E.DEPTNO = D.DEPTNO )
WHERE E.SAL > 2000;


-- 8-2 ORACLE
SELECT D.DEPTNO, D.DNAME, 
       TRUNC(AVG(E.SAL)) AS AVG_SAL,
       MAX(E.SAL) AS MAX_SAL,
       MIN(E.SAL) AS MIN_SAL,
       COUNT(*) AS CNT
FROM EMP E ,DEPT D
WHERE E.DEPTNO = D.DEPTNO
GROUP BY D.DEPTNO, D.DNAME;

-- 8-2 ANSI
SELECT D.DEPTNO, D.DNAME, 
       TRUNC(AVG(E.SAL)) AS AVG_SAL,
       MAX(E.SAL) AS MAX_SAL,
       MIN(E.SAL) AS MIN_SAL,
       COUNT(*) AS CNT
FROM EMP E JOIN DEPT D ON (E.DEPTNO = D.DEPTNO )
GROUP BY D.DEPTNO, D.DNAME;
       
--  8-3 ORACLE
SELECT D.DEPTNO,D.DNAME,E.EMPNO,E.ENAME,E.JOB,E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO -- �����ʿ� ������ ���ʿ� ��� ���
ORDER BY E.DEPTNO, E.ENAME;

--  8-3 ANSI
SELECT D.DEPTNO,D.DNAME,E.EMPNO,E.ENAME,E.JOB,E.SAL
FROM EMP E RIGHT OUTER JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
ORDER BY E.DEPTNO, E.ENAME;












