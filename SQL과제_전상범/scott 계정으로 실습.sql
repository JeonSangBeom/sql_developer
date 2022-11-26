SELECT * FROM EMP;
(hint) distinct
1. ������� �ٹ��ϰ� �ִ� �ٹ� �μ��� ��ȣ�� �ߺ����� �������ÿ�.;
SELECT DISTINCT DEPTNO
FROM EMP
ORDER BY DEPTNO;

(hint) ���Ῥ���� || �Ǵ� concat �Լ� �̿� 
2.������� �̸��� ������ ���� ������� �����´�. 000 ����� ��� ������ XXX �Դϴ�;
SELECT CONCAT(CONCAT(ENAME,CONCAT(' ����� ��� ������ ',JOB)), ' �Դϴ�') AS NOANDNAME FROM EMP;



(hint) ��������� �̿�
3. �� ������� �޿��װ� �޿��׿��� 1000�� ���� ��, 200�� �� ��, 2�� ���� ��, 2�� ���� ���� �������ÿ�.;
SELECT SAL, SAL+1000, SAL-200, SAL*2, SAL/2
FROM EMP;



4. �� ����� �޿���, Ŀ�̼�, �޿� + Ŀ�̼� �׼��� �������ÿ�. ;
SELECT SAL, COMM, SAL+COMM
FROM EMP;

(hint) Select �÷���1, �÷���2 from ���̺��
5. ����� �̸��� ��� ��ȣ�� �����´�.  
6. ����� �̸��� ��� ��ȣ, ����, �޿��� �����´�.
7. �μ� ��ȣ�� �μ� �̸��� �����´�.;
SELECT ENAME, EMPNO
FROM EMP;

--6
SELECT ENAME, EMPNO, JOB, SAL
FROM EMP;

--7
SELECT DEPTNO, DNAME
FROM DEPT;

 (hint) *
 8. �μ��� ��� ������ �����´�.
 9. ����� ��� ������ �����´�.;
 SELECT *
 FROM EMP
 ORDER BY DEPTNO;
 
 SELECT * 
 FROM EMP
 ORDER BY EMPNO;

(hint) where 
10. �ٹ� �μ��� 10���� ������� �����ȣ, �̸�, �ٹ� �μ��� �����´�. ;
SELECT EMPNO, ENAME, DEPTNO
FROM EMP
WHERE DEPTNO = 10;
11. �ٹ� �μ� ��ȣ�� 10���� �ƴ� ������� �����ȣ, �̸�, �ٹ� �μ� ��ȣ�� �����´�.;
SELECT EMPNO, ENAME, DEPTNO
FROM EMP
WHERE DEPTNO != 10;
12. �޿��� 1500�̻��� ������� �����ȣ, �̸�, �޿��� �����´�.;
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL>=1500;
13. �̸��� SMITH ����� �����ȣ, �̸�, ����, �޿��� �����´�. 
SELECT EMPNO, ENAME, JOB, SAL
FROM EMP
WHERE ENAME = 'SMITH';
14. �� SALESMAN�� ����� �����ȣ, �̸�, ������ �����´�. 
SELECT EMPNO, ENAME, JOB
FROM EMP
WHERE JOB = 'SALESMAN';
15. ������ CLERK�� �ƴ� ����� �����ȣ, �̸�, ������ �����´�. 
SELECT EMPNO, ENAME, JOB
FROM EMP
WHERE JOB != 'CLERK';
16. 1982�� 1�� 1�� ���Ŀ� �Ի��� ����� �����ȣ, �̸�, �Ի����� �����´�.
SELECT EMPNO, ENAME, HIREDATE
FROM EMP
WHERE HIREDATE>'1982-01-01' ;

(hint) where  �������� �̿� (and , or, not in, between  a and b ���);
17. 10�� �μ����� �ٹ��ϰ� �ִ� ������ MANAGER�� ����� �����ȣ, �̸�, �ٹ��μ�, ������ �����´�. 
SELECT EMPNO, ENAME, DEPTNO, JOB
FROM EMP
WHERE DEPTNO = 10 AND
       JOB = 'MANAGER';
       
       
18. �Ի�⵵�� 1981���� ����߿� �޿��� 1500 �̻��� ����� �����ȣ, �̸�, �޿�, �Ի����� �����´�.  
SELECT EMPNO, ENAME, SAL, HIREDATE
FROM EMP
WHERE TO_CHAR(HIREDATE,'YYYY')= 1981 AND
       SAL >= 1500;
19. 20�� �μ��� �ٹ��ϰ� �ִ� ��� �߿� �޿��� 1500 �̻��� ����� �����ȣ, �̸�, �μ���ȣ, �޿��� �����´�.
SELECT EMPNO, ENAME, DEPTNO, SAL
FROM EMP
WHERE DEPTNO = 20 AND
       SAL >= 1500;
20. ��� ��� ��ȣ�� 7698���� ����߿� ������ CLERK�� ����� �����ȣ, �̸�, ���ӻ����ȣ, ������ �����´�.
SELECT EMPNO, ENAME, MGR, JOB
FROM EMP
WHERE MGR = 7698 AND
      JOB = 'CLERK';
21. �� 2000���� ũ�ų� 1000���� ���� ����� �����ȣ, �̸�, �޿��� �����´�.
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL NOT BETWEEN 1000 AND 2000;
      
22. ��ȣ�� 20�̰ų� 30�� ����� �����ȣ, �̸�, �μ���ȣ�� �����´�.
SELECT EMPNO, ENAME, DEPTNO
FROM EMP
WHERE DEPTNO = 20 OR
      DEPTNO = 30;
23. ������ CLERK, SALESMAN, ANALYST�� ����� �����ȣ, �̸�, ������ �����´�.
SELECT EMPNO, ENAME, JOB
FROM EMP
WHERE JOB IN ('CLERK','SALESMAN','ANALYST')
ORDER BY JOB;

24. ��� ��ȣ�� 7499, 7566, 7839�� �ƴ� ������� �����ȣ, �̸��� �����´�
SELECT EMPNO, ENAME
FROM EMP
WHERE EMPNO NOT IN(7499, 7566, 7839);


(hint) like            ==>   _ : ���� �ϳ��� �ǹ��Ѵ�.  % : ���� 0�� �̻��� �ǹ��Ѵ�.;
25. �̸��� F�� �����ϴ� ����� �̸��� ��� ��ȣ�� �����´�.
SELECT EMPNO, ENAME
FROM EMP
WHERE ENAME LIKE 'F%'; 

26. �� S�� ������ ����� �̸��� ��� ��ȣ�� �����´�.
SELECT EMPNO, ENAME
FROM EMP
WHERE ENAME LIKE '%S'; 
27. �̸��� A�� ���ԵǾ� �ִ� ����� �̸��� ��� ��ȣ�� �����´�.
SELECT EMPNO, ENAME
FROM EMP
WHERE ENAME LIKE '%A%'; 
28. �̸��� �ι�° ���ڰ� A�� ����� ��� �̸�, ��� ��ȣ�� �����´�.
SELECT EMPNO, ENAME
FROM EMP
WHERE ENAME LIKE '_A%'; 
29. �̸��� 4������ ����� ��� �̸�, ��� ��ȣ�� �����´�.
SELECT EMPNO, ENAME
FROM EMP
WHERE ENAME LIKE '____'; 


(hint) is null  /  is not null;
30. ����߿� Ŀ�̼��� ���� �ʴ� ����� �����ȣ, �̸�, Ŀ�̼��� �����´�.
SELECT EMPNO,ENAME,COMM
FROM EMP
WHERE COMM IS NOT NULL; 
31. ȸ�� ��ǥ(���ӻ���� ���� ���)�� �̸��� �����ȣ�� �����´�.
SELECT EMPNO, ENAME
FROM EMP
WHERE MGR IS NULL;


(hint) order by;
32. ����� �����ȣ, �̸�, �޿��� �����´�. �޿��� �������� �������� ������ �Ѵ�.
SELECT EMPNO,ENAME,SAL
FROM EMP
ORDER BY SAL ASC;
33. ����� �����ȣ, �̸�, �޿��� �����´�. �����ȣ�� �������� �������� ������ �Ѵ�.
SELECT EMPNO,ENAME,SAL
FROM EMP
ORDER BY EMPNO DESC;
34. ����� �����ȣ, �̸��� �����´�, ����� �̸��� �������� �������� ������ �Ѵ�.
SELECT EMPNO,ENAME,SAL
FROM EMP
ORDER BY ENAME ASC;
35. ����� �����ȣ, �̸�, �Ի����� �����´�. �Ի����� �������� �������� ������ �Ѵ�.
SELECT EMPNO,ENAME,HIREDATE
FROM EMP
ORDER BY HIREDATE DESC;
36. ������ SALESMAN�� ����� ����̸�, �����ȣ, �޿��� �����´�. �޿��� �������� �������� ������ �Ѵ�.
SELECT EMPNO,ENAME,SAL
FROM EMP
WHERE JOB = 'SALESMAN'
ORDER BY SAL ASC;
37. 1981�⿡ �Ի��� ������� �����ȣ, ��� �̸�, �Ի����� �����´�. ��� ��ȣ�� �������� �������� ������ �Ѵ�.
SELECT EMPNO,ENAME,HIREDATE
FROM EMP
WHERE TO_CHAR(HIREDATE,'YYYY')= 1981
ORDER BY HIREDATE DESC;
38. ����� �̸�, �޿�, Ŀ�̼��� �����´�. Ŀ�̼��� �������� �������� ������ �Ѵ�.
SELECT ENAME,SAL,COMM
FROM EMP
WHERE COMM IS NOT NULL
ORDER BY COMM ASC ;
39. ����� �̸�, �޿�, Ŀ�̼��� �����´�. Ŀ�̼��� �������� �������� ������ �Ѵ�.
SELECT ENAME,SAL,COMM
FROM EMP
WHERE COMM IS NOT NULL
ORDER BY COMM DESC ;


(hint) �����Լ� round, abs, trunc ���;
40. �������� �޿��� 2000 �谨�ϰ� �谨�� �޿����� ���밪�� ���Ѵ�.
SELECT ABS(SAL-2000)
FROM EMP;
41. �޿��� 1500 �̻��� ����� �޿��� 15% �谨�Ѵ�. �� �Ҽ��� ���ϴ� ������.
SELECT TRUNC(SAL*0.85)
FROM EMP
WHERE SAL>=1500;
42. �޿��� 2õ ������ ������� �޿��� 20%�� �λ��Ѵ�. �� 10�� �ڸ��� �������� �ݿø��Ѵ�.
SELECT ROUND(SAL*1.2, -2)
FROM EMP
WHERE SAL<=2000;
43. �� ������ �޿��� 10�ڸ� ���ϸ� �谨�Ѵ�
SELECT TRUNC(SAL,-2)
FROM EMP;


( hint) decode / case ;
44. �� ����� �μ� �̸��� �����´�.
    ex) 10 : �λ��, 20 : ���ߺ�, 30 : ���������,    40 : �����
    SELECT DEPTNO,
        DECODE(DEPTNO,
               10,'�λ��',
               20,'���ߺ�',
               30,'���������',
               '�����'
            ) AS �μ��̸�
FROM EMP;
45. ���޿� ���� �λ�� �޿����� �����´�.
   ex) CLERK : 10%
       SALESMAN : 15%
       PRESIDENT : 200%
       MANAGER : 5%
       ANAYST : 20%;
SELECT JOB,SAL,
DECODE(JOB,
       'CLERK',SAL*1.1,
       'SALESMAN',SAL*1.15,
       'PRESIDENT', SAL*2.0,
       'MANAGER', SAL*1.05,
       'ANAYST', SAL*1.2,
       SAL 
        ) AS UP_SAL
FROM EMP;

46. �޿��� �� ����� �����´�.
   ex) 1000 �̸� : C���
       1000 �̻� 2000�̸� : B���
       2000 �̻� : A���
SELECT ENAME,SAL, 
         CASE 
             WHEN SAL < 1000  THEN 'C���'
             WHEN SAL < 2000  THEN 'B���'
             WHEN SAL > 2000  THEN 'A���'
             ELSE 'D���'
             END   AS ���ǥ
FROM EMP
ORDER BY SAL;       

47. �������� �޿��� ������ ���� �λ��Ѵ�.
ex) 1000 ���� : 100%
    1000 �ʰ� 2000�̸� : 50%
    2000 �̻� : 200%
SELECT ENAME,SAL, 
         CASE 
             WHEN SAL < 1000  THEN SAL
             WHEN SAL < 2000  THEN SAL*1.5
             WHEN SAL > 2000  THEN SAL*2.0
             END   AS �λ�
FROM EMP
ORDER BY SAL;        


( hint)�׷��Լ� �̿�  sum/avg/count/max/min ���;



48. ������� Ŀ�̼� ������ ���Ѵ�.;
SELECT SUM(COMM)
FROM EMP;
49. �޿��� 1500 �̻��� ������� �޿� ������ ���Ѵ�.
SELECT SUM(SAL)
FROM EMP
WHERE SAL>=1500;
50. 20�� �μ��� �ٺ��ϰ� �ִ� ������� �޿� ������ ���Ѵ�.
SELECT SUM(SAL)
FROM EMP
WHERE DEPTNO = 20;
51. ������ SALESMAN�� ������� �޿� ������ ���Ѵ�.
SELECT SUM(SAL)
FROM EMP
WHERE JOB='SALESMAN';
52. ������ SALESMAN�� ������� �̸��� �޿������� �����´�.
SELECT ENAME, SUM(SAL)
FROM EMP
WHERE JOB='SALESMAN'
GROUP BY ENAME, SAL;

53. �� ����� �޿� ����� ���Ѵ�.
SELECT TRUNC(AVG(SAL))
FROM EMP;
54. Ŀ�̼��� �޴� ������� Ŀ�̼� ����� ���Ѵ�.
SELECT TRUNC(AVG(COMM))
FROM EMP
WHERE COMM IS NOT NULL;
55. �� ����� Ŀ�̼��� ����� ���Ѵ�.
SELECT TRUNC(AVG(COMM))
FROM EMP;
56. Ŀ�̼��� �޴� ������� �޿� ����� ���Ѵ�.
SELECT TRUNC(AVG(SAL))
FROM EMP
WHERE COMM IS NOT NULL;
57. 30�� �μ��� �ٹ��ϰ� �ִ� ������� �޿� ����� ���Ѵ�.
SELECT TRUNC(AVG(SAL))
FROM EMP
WHERE DEPTNO = 30;
58. ������ SALESMAN�� ������� �޿� + Ŀ�̼� ����� ���Ѵ�.
SELECT AVG(SAL), TRUNC(AVG(COMM))
FROM EMP
WHERE JOB = 'SALESMAN';
59. ������� �� ���� �����´�.
SELECT COUNT(*) AS COUNT
FROM EMP;
60. Ŀ�̼��� �޴� ������� �� ���� �����´�.
SELECT COUNT(COMM) AS COUNT
FROM EMP;
61. ������� �޿� �ִ�, �ּҰ��� �����´�.
SELECT MAX(SAL), MIN(SAL)
FROM EMP;

SELECT *
FROM EMP;

( hint)�׷��Լ� �̿�  sum/avg/count/max/min  group by �̿�;
62. �� �μ��� ������� �޿� ����� ���Ѵ�.
SELECT DEPTNO, TRUNC(AVG(SAL))
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;
63. �� ������ ������� �޿� ������ ���Ѵ�.
SELECT JOB, SUM(SAL) 
FROM EMP
GROUP BY JOB
ORDER BY SUM(SAL);
64. 1500 �̻� �޿��� �޴� ������� �μ��� �޿� ����� ���Ѵ�.
SELECT DEPTNO, TRUNC(AVG(SAL))
FROM EMP
WHERE SAL >= 1500
GROUP BY DEPTNO
ORDER BY DEPTNO;


( hint) having  �̿�;
65. �μ��� ��� �޿��� 2000�̻��� �μ��� �޿� ����� �����´�.
SELECT DEPTNO, TRUNC(AVG(SAL)) 
FROM EMP 
GROUP BY DEPTNO
HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO;
66. �μ��� �ִ� �޿����� 3000������ �μ��� �޿� ������ �����´�.
SELECT DEPTNO, MAX(SAL) 
FROM EMP 
GROUP BY DEPTNO
HAVING MAX(SAL) <= 3000
ORDER BY DEPTNO;
67. �μ��� �ּ� �޿����� 1000 ������ �μ����� ������ CLERK�� ������� �޿� ������ ���Ѵ�
SELECT DEPTNO, JOB, MIN(SAL),SUM(SAL)
FROM EMP 
GROUP BY DEPTNO,JOB
HAVING MIN(SAL) <= 1000 AND
       JOB = 'CLERK';
ORDER BY DEPTNO;
68. �� �μ��� �޿� �ּҰ� 900�̻� �ִ밡 10000������ �μ��� ����� ��1500�̻��� �޿��� �޴� ������� ��� �޿����� �����´�.
SELECT DEPTNO, MIN(SAL), MAX(SAL), TRUNC(AVG(SAL))
FROM EMP 
WHERE SAL >= 1500
GROUP BY DEPTNO
HAVING MIN(SAL)>=900 AND
       MAX(SAL)<=10000 ;
       
ORDER BY DEPTNO;

(hint)  join �̿�;
69. ����� �����ȣ, �̸�, �ٹ��μ� �̸��� �����´�.
SELECT E.EMPNO, E.ENAME, D.DNAME 
FROM  EMP E , DEPT D 
WHERE E.DEPTNO = D.DEPTNO;
70. ����� �����ȣ, �̸�, �ٹ������� �����´�.
SELECT E.EMPNO, E.ENAME, D.LOC 
FROM  EMP E , DEPT D 
WHERE E.DEPTNO = D.DEPTNO;
71. DALLAS�� �ٹ��ϰ� �ִ� ������� �����ȣ, �̸�, ������ �����´�.
SELECT E.EMPNO, E.ENAME, E.JOB, D.LOC 
FROM  EMP E , DEPT D 
WHERE E.DEPTNO = D.DEPTNO AND
        D.LOC = 'DALLAS';
72. SALES �μ��� �ٹ��ϰ� �ִ� ������� �޿� ����� �����´�.
SELECT TRUNC(AVG(E.SAL)), D.DNAME
FROM  EMP E , DEPT D 
WHERE E.DEPTNO = D.DEPTNO AND
        D.DNAME = 'SALES'
GROUP BY DNAME;         
SELECT *
FROM EMP;
73. 1982�⿡ �Ի��� ������� �����ȣ, �̸�, �Ի���, �ٹ��μ��̸��� �����´�.
SELECT E.EMPNO, E.ENAME, E.HIREDATE, D.DNAME
FROM  EMP E , DEPT D 
WHERE E.DEPTNO = D.DEPTNO AND
        TO_CHAR(E.HIREDATE,'YYYY')= 1982;
74. �� ������� �����ȣ, �̸�, �޿�, �޿������ �����´�.
SELECT E.EMPNO, E.ENAME, E.SAL, S.GRADE
FROM EMP E, SALGRADE S;
75. SALES �μ��� �ٹ��ϰ� �ִ� ����� �����ȣ, �̸�, �޿������ �����´�.
SELECT E.EMPNO, E.ENAME, E.SAL, D.DNAME, S.GRADE 
FROM EMP E, SALGRADE S, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND
      D.DNAME = 'SALES'
ORDER BY S.GRADE;
76. �� �޿� ��޺� �޿��� ���հ� ���, ����Ǽ�, �ִ�޿�, �ּұ޿��� �����´�.

SELECT S.GRADE,SUM(E.SAL),TRUNC(AVG(E.SAL)),COUNT(*),MAX(E.SAL),MIN(E.SAL)
FROM EMP E, DEPT D, SALGRADE S
WHERE E.DEPTNO = D.DEPTNO
GROUP BY S.GRADE
ORDER BY S.GRADE;
77. �޿� ����� 4����� ������� �����ȣ, �̸�, �޿�, �ٹ��μ��̸�, �ٹ������� �����´�.
SELECT S.GRADE, E.EMPNO, E.ENAME, E.SAL, D.DNAME, D.LOC
FROM EMP E, DEPT D, SALGRADE S
WHERE E.DEPTNO = D.DEPTNO AND
        S.GRADE = 4
ORDER BY S.GRADE;


(hint) self join �̿�;
78. SMITH ����� �����ȣ, �̸�, ���ӻ�� �̸��� �����´�.
SELECT E1.EMPNO,E1.ENAME, E1.MGR,
       E2.EMPNO AS MGR_NO,
       E2.ENAME AS MGR_NAME
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO AND
        E1.ENAME = 'SMITH';       
79. FORD ��� �ؿ��� ���ϴ� ������� �����ȣ, �̸�, ������ �����´�.
SELECT E1.EMPNO,E1.ENAME, E1.MGR,
       E2.EMPNO AS MGR_NO,
       E2.ENAME AS MGR_NAME
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO AND
        E2.ENAME = 'FORD';
       
80. SMITH ����� ���ӻ���� ������ ������ ������ �ִ� ������� �����ȣ, �̸�, ������ �����´�.
SELECT E1.EMPNO,E1.ENAME, E1.MGR,E1.JOB,
       E2.EMPNO AS MGR_NO,
       E2.ENAME AS MGR_NAME,
       E3.EMPNO AS E3_NO,
       E3.ENAME AS E3_NAME,
       E3.JOB AS E3_JOB
FROM EMP E1, EMP E2, EMP E3
WHERE E1.MGR = E2.EMPNO AND
      E2.JOB = E3.JOB AND
      E1.ENAME = 'SMITH';


        


(hint) outer join �̿�;
81. �� ����� �̸�, �����ȣ, ������ �̸��� �����´�. �� ���ӻ���� ���� ����� �����´�.
SELECT E1.EMPNO, E1.ENAME,
       E2.EMPNO AS MGR_NO,
       E2.ENAME AS MGR_NAME
FROM EMP E1,EMP E2
WHERE E1.MGR = E2.EMPNO(+) 
ORDER BY E1.EMPNO;   
82. ��� �μ��� �Ҽ� ����� �ٹ��μ���, �����ȣ, ����̸�, �޿��� �����´�
SELECT D.DNAME, E.EMPNO, E.ENAME, E.SAL
FROM EMP E,DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO ;
       

(hint) subquery;
83. SMITH����� �ٹ��ϰ� �ִ� �μ��� �̸��� �����´�.
SELECT DNAME 
FROM DEPT
WHERE DEPTNO = (
            SELECT DEPTNO
            FROM EMP
            WHERE ENAME = 'SMITH'
            );
84. SMITH�� ���� �μ��� �ٹ��ϰ� �ִ� ������� �����ȣ, �̸�, �޿���, �μ��̸��� �����´�.
SELECT EMPNO, ENMAME, SAL, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND
      E.DEPTNO = (
            SELECT DEPTNO
            FROM EMP
            WHERE ENAME = 'SMITH'
            );
85. MARTIN�� ���� ������ ������ �ִ� ������� �����ȣ, �̸�, ������ �����´�.
SELECT EMPNO, ENAME, JOB
FROM EMP
WHERE JOB = (SELECT JOB
             FROM EMP
             WHERE ENAME = 'MARTIN');
86. ALLEN�� ���� ���ӻ���� ���� ������� �����ȣ, �̸�, ���ӻ���̸��� �����´�.
SELECT E1.EMPNO, E1.ENAME, E2.ENAME AS ���
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO AND 
        E1.MGR = (SELECT MGR
                  FROM EMP
                  WHERE ENAME = 'ALLEN');
87. WARD�� ���� �μ��� �ٹ��ϰ� �ִ� ������� �����ȣ, �̸�, �μ���ȣ�� �����´�.
SELECT EMPNO, ENAME, DEPTNO
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO
                FROM EMP
                WHERE ENAME = 'WARD');
88. SALESMAN�� ��� �޿����� ���� �޴� ������� �����ȣ, �̸�, �޿��� �����´�.
SELECT EMPNO, ENAME, SAL 
FROM EMP
WHERE SAL > (SELECT TRUNC(AVG(SAL))
             FROM EMP
             WHERE JOB = 'SALESMAN');
89. DALLAS ������ �ٹ��ϴ� ������� ��� �޿��� �����´�.
SELECT AVG(SAL)
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO
                FROM DEPT
                WHERE LOC = 'DALLAS');
90. SALES �μ��� �ٹ��ϴ� ������� �����ȣ, �̸�, �ٹ������� �����´�
SELECT E.EMPNO, E.ENAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND 
        E.DEPTNO = (SELECT DEPTNO
                    FROM DEPT
                    WHERE DNAME = 'SALES');

91. CHICAGO ������ �ٹ��ϴ� ����� �� BLAKE�� ���ӻ���� ������� �����ȣ, �̸�, ������ �����´�.	
SELECT EMPNO, ENAME, JOB
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO
                FROM DEPT
                WHERE LOC = 'CHICAGO') AND
        MGR = (SELECT EMPNO
                FROM EMP
                WHERE ENAME = 'BLAKE');


(hint) ����� �ϳ� �̻��� subquery�� in,some,any , all  �� �̿��Ѵ�.;
92. 3000 �̻��� �޿��� �޴� ������ ���� �μ��� �ٹ��ϰ� �ִ� ����� �����ȣ, �̸�, �޿��� �����´�
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO
                 FROM EMP
                 WHERE SAL >= 3000);
93. ������ CLERK�� ����� ������ �μ��� �ٹ��ϰ� �ִ� ������� �����ȣ, �̸�, �Ի��� �����´�.
SELECT EMPNO, ENMAE, HIREDATE
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
                FROM EMP
                WHERE JOB = 'CLERK');


