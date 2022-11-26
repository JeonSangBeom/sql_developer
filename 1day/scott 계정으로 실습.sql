-- �ּ�
SELECT * FROM EMP;--EMP���� ���� �ҷ����� �̾ƿ��� ���

DESC emp; -- DESC - �������� ��� �� �ϳ�
--DESC BONUS; -- ���� cmd��ɾ�� ���δ� (developer ���� ���� �׳� �˻��� �� ����)


--SELECT�� �⺻ �׵� �ʿ��� ������ ���� �ȴ� FROM - ~����
SELECT EMPNO,ENAME,JOB, MGR FROM EMP;


--DISTINCT �ߺ� ����(���� �μ��� �ߺ��� ������ ���)
--DEPTNO-�μ� ��ȣ 
SELECT DISTINCT DEPTNO FROM EMP;

--ALL�� ���� �Ƚᵵ �ȴ�(���� �ʾƵ� ���� ���)
SELECT ALL DEPTNO FROM EMP;

--�μ��� ������ �˰� ������
SELECT DISTINCT DEPTNO,JOB FROM EMP;


--�޿� ������ �ñ��ҋ� SAL-���� SAL*12+COMM-����+Ŀ�̼� 
--AS ANNUALINCOME - AS�� ���� ������ ���� �Է��� ������ �÷����� ����Ȱɷ� ���̰� ���ش� 
SELECT ENAME, SAL, SAL*12+COMM AS ANNUALINCOME  FROM EMP;


--�� ���� �޴� ��� ¥����
--ORDER BY-���� (���� �������� �������� �ϴ� ������ �ϳ�)/ �ΰ��� ���� �������� �켱������ ����
--DESC - ���� �� ����  ASC - ���� �� ����
SELECT * FROM EMP
ORDER BY DEPTNO ASC,SAL DESC;


-- WHERE�� ���� - ���� ���� ã���� ���
SELECT * FROM EMP
WHERE EMPNO = 7369
;

-- �μ� ��ȣ�� 30 �̸鼭 ������ CLERK �� ���
SELECT * FROM EMP
WHERE DEPTNO = 30 AND 
JOB = 'CLERK';


-- �μ� ��ȣ�� 20 �̰ų� ������ SALESMAN �� ���
SELECT * FROM EMP
WHERE DEPTNO = 20 OR
JOB = 'SALESMAN'; --����Ŭ ���ڴ� ������ ���� ����ǥ�� ����

-- SAL 3000�� ���....
SELECT * FROM EMP
WHERE SAL >= 3000;

-- �̸� F �̻��� ���....(���ڵ� ũ�� �񱳸� ���ش�/�α��ڵ� ����)
SELECT * FROM EMP
WHERE ENAME >= 'F';

-- ������ 3000�� �ƴ� ��� �̱�...
SELECT * FROM EMP
WHERE SAL != 3000; -- !=�� <>�� �ַ� ����Ѵ�

--JOB MANAGER ���� SALESMAN �Ǵ� CLERK
SELECT * FROM EMP
WHERE JOB = 'MANAGER'   OR
      JOB = 'SALESMAN'  OR
      JOB = 'CLERK'
ORDER BY JOB;

--�ٸ� ��� - Ư�� ���� �ȿ��� ���� ������ in�� ���
SELECT * FROM EMP
WHERE JOB IN ('MANAGER','SALESMAN','CLERK')
ORDER BY JOB;
--�ƴ� �� �� ������ NOT�� �տ� ����
SELECT * FROM EMP
WHERE JOB NOT IN ('MANAGER','SALESMAN','CLERK')
ORDER BY JOB;

-- �μ� ��ȣ�� 10, 20 �� ��� �̱�...
SELECT * FROM EMP
WHERE DEPTNO = 20 OR
      DEPTNO = 30;

SELECT * FROM EMP
WHERE DEPTNO IN (20,30) 
ORDER BY DEPTNO
;

-- ������ 2000~3000 ���̿� �ִ� ���
SELECT * FROM EMP
WHERE SAL >= 2000 AND
      SAL <= 3000;
--�ٸ� ��� - BETWEEN 2000 AND 3000;
SELECT * FROM EMP
WHERE SAL BETWEEN 2000 AND 3000;


-- ������ 2000 ���� �۰�  ~ 3000 ���� ū ���
SELECT * FROM EMP
WHERE SAL <= 2000 OR
      SAL >= 3000;
--�ٸ� ��� NOT BETWEEN ���� ������ ������(����)
SELECT * FROM EMP
WHERE SAL NOT BETWEEN 2000 AND 3000;


-- �˻�  %�� ���̿� ������� ��� ����....
SELECT * FROM EMP
WHERE ENAME LIKE 'M%'; -- LIKE - �˻��� �ö� (%�� �� ������ �� ��ġ(����))


-- �ι�° ���ڰ� L�� ��� �̱� WHERE ENAME LIKE '_L%';
SELECT * FROM EMP
WHERE ENAME LIKE '%A%'; 
-- A�� �����ϵ� �߰��� A�� �ֵ� �� �̾� �ش�(�ַ� �̸� �ΰ��� �Ἥ ���)


--NULL ��ȸ�ϱ�...
--NULL = �� ��ȸ���ȵȴ� -  IS NULL�� ��� �����ϴ�.
--IS NOT NULL(����)
SELECT * FROM EMP
WHERE COMM IS NOT NULL;  



-- ������  union - join�� �Ǹ� �� ���� �ʰ� �� ��(join�̶� ���̺� ���� ����)
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP
WHERE DEPTNO = 20
UNION -- or�ε� �� �� �ִ� / �÷����� ���ƾ� �Ѵ�
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP
WHERE DEPTNO = 30;

-- ������  union
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP
WHERE DEPTNO = 10
UNION ALL --�Ȱ����� �ι� �̴´� �ߺ����
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP
WHERE DEPTNO = 10;

-- ������  MINUS
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP
MINUS
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP
WHERE DEPTNO = 10;

-- ������  INTERSECT
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP
INTERSECT
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP
WHERE DEPTNO = 10;



---------------------------------------------------- �ǽ����� ---------------
SELECT * FROM EMP
WHERE ENAME LIKE '%S'; 
-->S�� ������ ��� ã��

SELECT EMPNO , ENAME , JOB , SAL , DEPTNO FROM EMP
WHERE JOB = 'SALESMAN' AND 
      DEPTNO = 30;
-->  JOB = 'SALESMAN'   DEPTNO= 30 �� ���� ã��

--���� ������ ��� ���� ���
SELECT EMPNO , ENAME , JOB , SAL , DEPTNO FROM EMP
WHERE DEPTNO IN (20,30) AND -->20,30(or�� ����) ������ �ΰ��� ��� �̷��� IN�� ���°� ����
      SAL > 2000;
-->������ 2000�ʰ� �̰� �����ȣ�� 20�Ǵ� 30�� ���� ã��      
  
  
--���տ����ڸ� ����� ���
SELECT EMPNO , ENAME , JOB , SAL , DEPTNO FROM EMP
WHERE DEPTNO = 20  AND SAL > 2000
UNION
SELECT EMPNO , ENAME , JOB , SAL , DEPTNO FROM EMP
WHERE DEPTNO = 30  AND SAL > 2000;


SELECT * FROM EMP
WHERE SAL < 2000 OR 
      SAL > 3000;
-->���� 2000���� �۰ų� 3000���� ū ���
      
SELECT * FROM EMP
WHERE DEPTNO = 30 AND
      ENAME LIKE '%E%' AND
      SAL NOT BETWEEN 1000 AND 2000;
-->�����ȣ 30�� �̸��� E�� ���ԵǾ� �ְ� ������ 1000���� 2000�̻��� ��� 
      
      
SELECT * FROM EMP
WHERE COMM IS NULL AND 
      MGR IS NOT NULL AND
      JOB IN ('MANAGER', 'CLERK') AND
      ENAME NOT LIKE '_L%';
-->Ŀ�̼��� ���� ����ڰ� �ְ�(MGR) ��å�� MANAGER', 'CLERK ���� �ϳ��ų� �̸��� �ι����� L�� �������� �ʴ� ���       
       