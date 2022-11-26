-- �ּ�
--����Ŭ���� �⺻���� �����Ǵ� �Լ���(���ڰ���)
SELECT * FROM EMP
where ENAME = UPPER('smith'); 
--> �Լ���''�� �빮�ڷ� ��߸� ���� �� �ִ�


--�÷��� ����
SELECT ENAME AS �̸� FROM EMP;

SELECT * FROM EMP;

SELECT * FROM EMP
WHERE ENAME LIKE '%S%';

SELECT * FROM EMP
WHERE LOWER(ENAME) LIKE '%s%'; 
--> �ҹ��ڷ� �ٲܶ� ���

SELECT LOWER(ENAME) FROM EMP;

SELECT INITCAP(ENAME) FROM EMP; 
-->ù���ڸ� �빮�ڷ� ����� ���

SELECT ENAME, LENGTH(ENAME) AS NAME_TOTAL FROM EMP; 
-->�̸��� �̰� LENGTH(ENAME) -���� ���� �ִ� �� 

SELECT ENAME, LENGTH(ENAME) AS TOTAL FROM EMP
WHERE LENGTH(ENAME) >=5; 
--> 5�� �̻��� ����� �̾Ƴ���

--������ ����� �ñ��� �� (scott ���̺� �� �÷��� ���� ���)
--SYS�� ������ DUMY���̺�(DUAL)�� �̿��Ͽ� ������ ��� ���� ���� �׽�Ʈ �� �� �ִ�
SELECT LENGTH('�ѱ�'),LENGTHB('�ѱ�') FROM DUAL;
-->LENGTHB('�ѱ�') - BYTE���� ã���� �ְ� ������ �ش�

SELECT JOB, SUBSTR(JOB,1,2), SUBSTR(JOB,3,2), SUBSTR(JOB,5) FROM EMP;
--> SUBSTR(JOB,1,2) JOB���� ����� �ܾ�  ó�� 1 ��ġ�� ���� 2�� ��
--> �Խ��� ���� ���� ���� �Ϻθ� �̾� �ö�(������ �ʹ� ��ų� �Ҷ�)

SELECT ENAME, SUBSTR(ENAME,3) AS ����°���� FROM EMP;
-->�̸� �߿� 3��°���� ���������� ���

--INSTR('����','ã�� ����')
SELECT INSTR('HELLO ORACLE','L') FROM DUAL;
-->L�� ��ġ�� 3��°�� �ִٴ� ���� �� �� �ִ�(�÷��� ������ dual�� ���)

--INSTR('����','ã�� ����',��������)
SELECT INSTR('HELLO ORACLE','L',5) FROM DUAL;
-->5��° ���� �����ؼ� ã�ƶ� (��ġ 11 ���)
--INSTR('����','ã�� ����',��������,���° ������ ��������)
SELECT INSTR('HELLO ORACLE','L',2,2) FROM DUAL;
-->2��° ���� 2��° L�� ã�ƶ�(4 ���)

--�˻� �� �ַ� ���
SELECT * FROM EMP
WHERE ENAME LIKE '%S%';
-->S���� ���� ���� ã�ڴ�

--�ٸ� ���
SELECT * FROM EMP
WHERE INSTR(ENAME,'S')>0;
-->�����̱� ������ S���� ũ�� ���� �̰ڴ�
-->INSTR(ENAME,'S')�� ����Ÿ�� ��ü�� �����̴�/�� �̸� ã�� ��

--REPLACE('���ڿ�','ã�� ����','�ٲ� ����') �ٲܹ��ڿ� �Է� ���ҽ� �� �پ ���´�
--ȸ������ ������ �ַ� ����Ѵ�
SELECT '010-2582-2242' AS REPLACE_BEFORE,
    REPLACE('010-2582-2242','-',' ') AS REPLACE01,
    REPLACE('010-2582-2242','-') AS REPLACE02
FROM DUAL;
--> FILTERRING�ÿ� ���(���̵� �ֳ� ���� ���� ���� �� �ֳ� ���� Ȯ��)

--LPAD / RPAD ����޲ٱ�(����)
SELECT RPAD('901212-',14,'*') AS JUMIN,
         RPAD('010-6528-',13,'*') AS PHONE FROM DUAL;
-->RPAD �����ʿ��� ���� �޲ٱ� ( '-'�� ���� 14��(�� ����),*(������ �޲ܺκ�))
SELECT 'ORACLE', LPAD('ORACLE',10,'#') AS LPAD01 FROM DUAL;

-- CONCAT () ���ڿ� �����ϱ� ||
SELECT CONCAT(EMPNO,ENAME) FROM EMP;
-->�ΰ��� �÷��� �����Ͽ� ����Ҷ� ���
SELECT EMPNO || ENAME FROM EMP;
-->Ÿ������ �̿��Ͽ��� ��� ����
SELECT CONCAT(EMPNO, CONCAT(' : ',ENAME)) AS NOANDNAME FROM EMP;
-->CONCAT�ȿ� �� CONCAT ����

--TRIM(�ڸ��� ��������) - ���÷��̿� ���
SELECT '[' || '   --ORACLE---   ' || ']' AS NOTTRIM,
        '[' || TRIM( '   --ORACLE---   ') || ']' AS TRIM01
FROM DUAL;
SELECT '[' || TRIM('-' FROM '--ORACLE---') || ']' AS TRIM02 FROM DUAL;
-->'-'�� ���� �� �ִ�
SELECT '[' || TRIM(LEADING'-' FROM '--ORACLE---') || ']' AS TRIM02 FROM DUAL;
-->'-'�տ��� ����
SELECT '[' || TRIM(TRAILING'-' FROM '--ORACLE---') || ']' AS TRIM02 FROM DUAL;
-->'-'�ڿ��� ����
SELECT '[' || TRIM(BOTH'-' FROM '--ORACLE---') || ']' AS TRIM02 FROM DUAL;
-->BOTH ���� ������� �ʾƵ� �ȴ� ó���Ͱ� ���� ����


--LTRIM / RTRIM (��������)
SELECT LTRIM('ORACLE STUDY OOPS','ORCLE') AS LTRIM FROM DUAL;
-->���ʺ��� �����ش�(ö�ڰ� �߰��� Ʋ���� �´� �� ������ �����ش�)
SELECT RTRIM('ORACLE STUDY OOPS','OOPS') AS RTRIM FROM DUAL;
-->������ ����
SELECT TRIM('  ORACLE STUDY OOPS   ') AS TRIM FROM DUAL;
-->��������


---����
SELECT ROUND(1234.5678) AS ROUND01,
        ROUND(1234.5678,0) AS ROUND02,
        ROUND(1234.5678,1) AS ROUND03,
        -->�Ҽ��� ù°�� �����
        ROUND(1234.5678,2) AS ROUND04,
        ROUND(1255.5678,-3) AS ROUND05,
        ROUND(1234.4444,0) AS OOO
        FROM DUAL;
        -->�Ҽ��� �ڸ��� ����� ��(�ϳ��� �ݿø�5�̻�)
        -->���̳ʽ��� ������ ���� ����(�տ������� ����)
        
SELECT TRUNC(1234.5678) AS TRUNC01,
       TRUNC(1234.5678,1) AS TRUNC02,
       TRUNC(1234.5678,2) AS TRUNC03,
       TRUNC(1234.5678,-1) AS TRUNC04,
       TRUNC(1234.5678,-2) AS TRUNC05
FROM DUAL;
-->TRUNC �ݿø� ���� �ʰ� �������� ������

SELECT CEIL(1234.5678) AS CEIL01 ,
    FLOOR(1234.5678) AS FLOOR01 ,
    CEIL(-3.14) AS CEIL02 ,
    FLOOR(-3.1) AS FLOOR02 
FROM DUAL;
-->CEIL ������ �ø� / FLOOR ������ ����(����)

SELECT MOD(15,4) AS MOD01
FROM DUAL;
-->������ 15�� 4�� ���� ������ �� : 3

---DATE----
SELECT SYSDATE AS NOW, -->���� ��¥
        SYSDATE - 1 AS YESTERDAY, -->������ �˰� ������
        SYSDATE + 1 AS TOMORROW --> ������ �˰� ������
FROM DUAL;

SELECT SYSDATE AS NOW,
        ADD_MONTHS(SYSDATE,3) --> (SYSDATE,3)- ���� ��¥���� 3���� ��
FROM DUAL;

SELECT * FROM EMP;
SELECT ADD_MONTHS(HIREDATE,120) AS ANNYVERSARY FROM EMP;
-->ADD_MONTHS(HIREDATE,120)(�Ի���,120(10�ֳ�))

--���� ��¥ �������� 40�� �ȵ� ��� ����ϱ�.
SELECT ENAME, EMPNO, HIREDATE, SYSDATE FROM EMP;

SELECT ENAME, EMPNO, HIREDATE, SYSDATE
FROM EMP
WHERE ADD_MONTHS(HIREDATE,40*12) > SYSDATE;

--MONTHS_BETWEEN(��¥,��¥)
SELECT EMPNO,ENAME,HIREDATE,SYSDATE,
    TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE) /12) AS �ټӿ��� 
FROM EMP;    
-->MONTHS_BETWEEN(SYSDATE,HIREDATE) ���� ������ - ���ѳ� ���� �� /12(������ ���)

SELECT SYSDATE, 
       NEXT_DAY(SYSDATE,'������'), -->���� �ð� ���ķ� �������� ���� ã���ش�
       LAST_DAY(SYSDATE) --> ������ �� (�� �޿���)
FROM DUAL;

-----  ����ȯ(���ڸ� ���ڷ� / ���ڸ� ���ڷ�) -------
DESC EMP;

SELECT EMPNO,ENAME, EMPNO+'100'   -- �Ϲ��� ����ȯ
FROM EMP;
--> EMPNO+'100' �����ε� ���ڷ� ������

SELECT '10'+EMPNO 
FROM EMP;
-->SELECT 'ABCD'+EMPNO - �̷��� ���� �߻�
-- ���ڳ��� �� ��� || Ÿ���� ���

--TO_CHAR(), TO_NUMBER(), TO_DATE() -- �ٲ�� �͵�
SELECT TO_CHAR(SYSDATE,'YYYY/MM/DD HH:MI:SS') AS TODAY FROM DUAL;
-->��½� ���� ���� ���

--TO_CHAR-��¥�� ���ڷ� �ٲٴ� ��
SELECT SYSDATE ,
       TO_CHAR(SYSDATE,'MM') AS MM,
       TO_CHAR(SYSDATE,'MON') AS MON,  -- JAN(�ѱ����̶� ���� �ٸ� ��)
       TO_CHAR(SYSDATE,'MONTH') AS MONTH, -- JANUARY(�츮����� ��� ����)
       TO_CHAR(SYSDATE,'DD') AS DD, -- 
       TO_CHAR(SYSDATE,'DY') AS DY, -- 
       TO_CHAR(SYSDATE,'DAY') AS DAY, -- 
       TO_CHAR(SYSDATE,'YYYY/MM/DD DAY HH24:MI:SS') AS DAY -- 
FROM DUAL;

--�츮����� �ǹ̰� ���� �׷��� �� ������ �� �ִ�
SELECT SYSDATE ,
       TO_CHAR(SYSDATE,'MM') AS MM ,
       TO_CHAR(SYSDATE,'MON','NLS_DATE_LANGUAGE = KOREAN') AS MM_KOR ,
       TO_CHAR(SYSDATE,'MON','NLS_DATE_LANGUAGE = ENGLISH') AS MM_ENG ,
       INITCAP(TO_CHAR(SYSDATE,'MONTH','NLS_DATE_LANGUAGE = ENGLISH')) AS MM_ENG 
FROM DUAL;

SELECT SYSDATE ,
       TO_CHAR(SYSDATE,'MM') AS MM,
       TO_CHAR(SYSDATE,'DD') AS DD,
       TO_CHAR(SYSDATE,'DY') AS DY,
       TO_CHAR(SYSDATE,'DY', 'NLS_DATE_LANGUAGE = ENGLISH') AS ENG_DY,
       TO_CHAR(SYSDATE,'DAY', 'NLS_DATE_LANGUAGE = ENGLISH') AS ENG_DAY,
       TO_CHAR(SYSDATE,'DAY', 'NLS_DATE_LANGUAGE = JAPANESE') AS JPN_DAY
FROM DUAL;

-- JSP(����Ʈ ������ ����)
--���ڸ� �ٲ��ִ� ��
SELECT SAL ,
       TO_CHAR(SAL,'$9999,999') AS DOLLAR,
       TO_CHAR(SAL,'L9999,999') AS WON,
       TO_CHAR(SAL,'999,999.00') AS SAL02
FROM EMP;
--> 999,999.00�� ���ϴ´�� ��� ���� ����

SELECT TO_NUMBER('1300') - TO_NUMBER('1200')
FROM DUAL;
-->TO_NUMBER ���ڳ��� �� ��� ����

SELECT TO_DATE('2001/06/01','YYYY/MM/DD') FROM DUAL;
--TO_DATE ���ڸ� ��¥�� �ٲ� �ִ� ��
--('2001/06/01','YYYY/MM/DD')'2001/06/01'�� 'YYYY/MM/DD'�̰�����
--������ ������ YYYY4���� ��� �Ѵ�
SELECT * FROM EMP
WHERE HIREDATE > TO_DATE('1981/06/01','YYYY/MM/DD');


--IS NULL - NVL(NULLó���� ���ִ� �Լ�)
SELECT EMPNO, ENAME,SAL, COMM, SAL+COMM ,
        -->SAL+COMM NULL�� �ϳ��� �� ������ ���� ����� �ȶ��
       NVL(COMM,0),
        -->NULL�� ���ð�� 0ó���� ���ִ� ���
       SAL*12 + NVL(COMM,0) AS ANNSAL
        -->���� ���ϴ� ��
FROM EMP;

SELECT EMPNO, ENAME,
       NVL2(COMM,'O','X') IS_COMM
       -->COMM�� ������ O ������ X�� ǥ��
FROM EMP;

SELECT EMPNO, ENAME,
       NVL2(COMM,SAL*12+COMM,SAL*12) AS ANNSAL
       -->SAL*12+COMM(������),SAL*12(������)
FROM EMP;


--DECODE IF()�� ��� ==  ǥ�� SQL�� �ƴϴ�(����Ŭ������ ��� ����)
SELECT EMPNO,ENAME,JOB,SAL,
        DECODE(JOB, -- ������ ��������
               'MANAGER',SAL*1.1,
               'SALESMAN',SAL*1.05,
               'ANALYST', SAL,
               SAL*1.03 --> ELSE(������)
        ) AS UP_SAL -->���� �λ� �ҋ� ���
FROM EMP;

--������ �ѱ۷� �ٲ㺸�� �÷��� JOB_KR
SELECT EMPNO,ENAME,JOB,
        DECODE(JOB,
               'MANAGER', '������',
               'PRESIDENT', '����',
               'ANALYST', '�м���',
               'CLERK', '���',
               '�������' --> ELSE(������)
        ) AS JOB_KR
FROM EMP;

WITH TEMP AS ( -->WITH������ �ӽ� ���̺��� ���鶧 ��� �ȴ�
-->TEMP ���̺� �̸��� �ȴ�
    SELECT 'MALE' GENDER FROM DUAL UNION ALL
    SELECT 'FEMALE' GENDER FROM DUAL UNION ALL
    SELECT 'BISEXUAL' GENDER FROM DUAL 
)
SELECT GENDER, 
       DECODE(GENDER,
              'MALE','����',
              'FEMALE','����',
              '��Ÿ'
              )AS GENDER_KR
       FROM TEMP;
--SELECT * FROM TEMP;    
--> ���̺� �̸��� �ȴ�(WITH �ڿ��� TEMP��) 
--> �� ��  SELECT * FROM TEMP; �̷��� ����ϸ� ���Ƿ� ���̺��� ����� ����� �� �ְ� �ȴ�


--CASE �� �Ẹ�� DECODE���� ����(����Ŭ�� �ƴ� SQL�� �ƴ� �����ͺ��̽����� ��� ����)
SELECT EMPNO,ENAME,JOB,SAL,
             CASE JOB
             WHEN 'MANAGER'  THEN SAL*1.1
             WHEN 'SALESMAN' THEN SAL*1.05
             WHEN 'ANALYST'  THEN SAL
             ELSE SAL*1.03 --> ELSE(������)
             END   AS UP_SAL -->���� �λ� �ҋ� ���
FROM EMP;
SELECT EMPNO,ENAME,JOB,SAL,
             CASE 
             WHEN JOB = 'MANAGER'  THEN SAL*1.1
             WHEN JOB = 'SALESMAN' THEN SAL*1.05
             WHEN JOB = 'ANALYST'  THEN SAL
             ELSE SAL*1.03 --> ELSE(������)
             END   AS UP_SAL -->���� �λ� �ҋ� ���
FROM EMP;


--COMM�� ������ �ش���� ���� / COMM 0�̸� ���� ����  / COMM�� ������ ���� : 300 ���
SELECT EMPNO,ENAME,COMM, 
             CASE 
             WHEN COMM IS NULL  THEN '�ش���� ����' -->COMM �񱳴� IS�� ��� �Ѵ�
             WHEN COMM = 0      THEN '�������'
             WHEN COMM > 0      THEN '���� : ' || COMM
             END   AS COMM_KR
FROM EMP;

--SAL 2900���� ũ�� DIAMOND 2700���� ũ�� GOLD 2000���� ũ�� SILVER ������ BRONZE
SELECT ENAME,SAL, 
         CASE 
             WHEN SAL > 2900  THEN 'DIAMOND'
             WHEN SAL > 2700  THEN 'GOLD'
             WHEN SAL > 2000  THEN 'SILVER'
             ELSE 'BRONZE'
             END   AS GRADE
FROM EMP
ORDER BY SAL DESC; --> DESC ���� ������ ����


--��б� �Ի��ߴ��� �˾ƺ���
SELECT ENAME, HIREDATE, TO_CHAR(HIREDATE,'Q') FROM EMP; 
-->'Q'�� ����ϸ� �б�� ������ �ش�
SELECT ENAME, TO_CHAR(HIREDATE, 'YYYY-MM') AS ENRTY_DATE ,
       CASE
           WHEN TO_CHAR(HIREDATE,'Q') = '1' THEN '1�б� �Ի�'
           WHEN TO_CHAR(HIREDATE,'Q') = '2' THEN '2�б� �Ի�'
           WHEN TO_CHAR(HIREDATE,'Q') = '3' THEN '3�б� �Ի�'
           ELSE '4�б� �Ի�'
           END AS QUATER
FROM EMP;       

--SELECT ENAME, HIREDATE, TO_CHAR(HIREDATE, 'Q') || '�б� �Ի�' AS QUATER FROM EMP;

----------��������

SELECT EMPNO,
       RPAD(SUBSTR(EMPNO,1,2),4,'*') AS MASKING_EMPNO,
       -->SUBSTR ���⼭ ���� ������� �̾Ƴ��� RPAD 4���� ���ڸ�ŭ �����ʿ��� ���� *(�� ����)
       ENAME,
       RPAD(SUBSTR(ENAME,1,1),LENGTH(ENAME),'*') AS MASKING_ENAME
       -->LENGTH(ENAME)���ڼ� ��ŭ *ó��
FROM EMP    
WHERE LENGTH(ENAME) >=5 AND LENGTH(ENAME) <6; --�ټ������� ����� �̱�

--���� �Ʒ��� �� ���� ��� �� ��
SELECT EMPNO,
       RPAD(SUBSTR(EMPNO,1,2),4,'*') AS MASKING_EMPNO,
       ENAME,
       RPAD(SUBSTR(ENAME,1,1),LENGTH(ENAME),'*') AS MASKING_ENAME
FROM EMP;    


---2�� ��ȭ�� �ٲٱ�
SELECT EMPNO, SAL,
        TRUNC(SAL/21.5,2) AS DAY_PAY,--SAL/21.5 - �Ϸ� �ϱ�
        TRUNC(SAL/21.5/8,1) AS TIME_PAY --SAL/21.5/8 - �ð� ����
FROM EMP;

---2�� ������ �Ϸ� �ϴ�� �ñ��� ��ȭ �Ǵ� �޷��� �ٲٱ�
SELECT EMPNO, SAL,
        TO_CHAR(TRUNC(SAL/21.5,2),'L999,99.00') AS DAY_PAY,
        -->(TRUNC(SAL/21.5,2) �Ҽ��� ����°���� ������
        -->21.5 �ٹ� �ϼ�
        -->TO_CHAR(TRUNC(SAL/21.5,2),'L999,99.00') -��ȭ�� �ٲٱ�
        TO_CHAR(TRUNC(SAL/21.5/8,1),'$999,999.0') AS TIME_PAY
FROM EMP;

-- 3��
SELECT EMPNO,ENAME,
       TO_CHAR(HIREDATE,'YYYY/MM/DD') AS HIREDATE,
       -->HIREDATE��(������ �ð� �ʵ� ���� �����) 'YYYY/MM/DD'�� ����
       TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE,3),'��'),'YYYY-MM-DD')  AS R_JOB,
       -->ADD_MONTHS - �Ի��� ������ 3���� ��
       -->NEXT_DAY - 3���� �ڿ��� ù ������
       -->TO_CHAR ���ڷ� ����
       NVL(TO_CHAR(COMM),'N/A') AS COMM 
       -->NVL�� ���ڸ� ���� �ִ� �׷��� TO_CHAR(COMM) �ڹ��� ���ڷ� �ٲ��ְ�
       -->NULL�� ��� N/A�� ǥ��
FROM EMP;

--3���� CASE ������ �ٲ㺸��...  COMM �ִ� �״�� ���, 0 0���� ���
SELECT EMPNO,ENAME,
       TO_CHAR(HIREDATE,'YYYY/MM/DD') AS HIREDATE,
       TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE,3),'��'),'YYYY-MM-DD')  AS R_JOB,
       CASE
            WHEN COMM IS NULL THEN 'N/A'
            --ELSE TO_CHAR(COMM) / ����'N/A'�� ���ڷ� ����Ͽ��� ������ 
            --ELSE ''||COMM
            ELSE CONCAT('',COMM) -- �� Ÿ������ ���� �뵵('' : ���ڿ� �ڹ��� �Բ� ���� ����)
       END AS COMM 
FROM EMP;

-- 4�� 
SELECT EMPNO,ENAME,MGR,
       CASE
            WHEN MGR IS NULL THEN 0000 --> MGR�� �������� ������ 0000
            WHEN SUBSTR(MGR,1,2) = 75 THEN 5555
            WHEN SUBSTR(MGR,1,2) = 76 THEN 6666
            WHEN SUBSTR(MGR,1,2) = 77 THEN 7777
            WHEN SUBSTR(MGR,1,2) = 78 THEN 8888
            ELSE MGR
       END AS CHG_MGR
FROM EMP;




