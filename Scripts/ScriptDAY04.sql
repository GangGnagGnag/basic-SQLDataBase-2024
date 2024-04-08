CREATE TABLE dept_tmp AS SELECT * FROM dept;

SELECT * 
FROM dept_tmp;

-- 업데이트 ~ set	// 수정하는 부분은 set 을 사용하여 변경한다
 UPDATE DEPT_TMP 
 SET LOC = 	'SEOUL'; -- 해당열 전체 수정

 -- 일부 수정을 할때에는 조건식을 사용하면된다
 UPDATE dept_tmp
 SET dname = 'database', loc = 'busan'
 WHERE deptno = 40;
 
-- 서브쿼리를 이용한 데이터 변경도 가능
UPDATE dept_tmp
SET (DNAME , LOC) = (SELECT DNAME, LOC FROM DEPT WHERE DEPTNO = 40)
WHERE DEPTNO = 40;

CREATE TABLE emp_tmp 
AS SELECT * FROM emp;

SELECT *
FROM emp_tmp;

-- SALESMAN 삭제
DELETE FROM emp_tmp WHERE job = 'SALESMAN';

-- 서브쿼리 삭제

SELECT * FROM EMP_TMP;
SELECT * FROM EMP_TMP;
DROP TABLE EMP_TMP;     -- 테이블 삭제 (DROP TABLE [테이블 이름])

/* 트랜잭션 */
CREATE TABLE dept_tcl
AS SELECT * FROM dept; 

SELECT *
FROM dept_tcl;

INSERT INTO dept_tcl
VALUES(50, 'DATABASE', 'BUSAN');

UPDATE dept_tcl 
SET loc = 'BUSAN'
WHERE deptno = 40;

DELETE FROM dept_tcl
WHERE dname = 'RESEARCH'

ROLLBACK; -- 트랙잭션 취소
COMMIT;	  -- 트랜잭션 반영
DROP TABLE DEPT_TCL;

/* VIEW */
CREATE VIEW VM_EMP 
AS (SELECT EMPNO, ENAME, JOB, DEPTNO 
FROM EMP 
WHERE DEPTNO = 20);

SELECT * FROM VM_EMP;
SELECT *FROM USER_VIEWS;
DROP VIEW VM_EMP;

-- 테이블, 데이터사전, 인덱스, 뷰, 시퀀스, 동의어
/* 데이터 사전 */
SELECT *
FROM dict;	-- 사용가능한 데이터 사전

SELECT TABLE_name
FROM USER_tables;		-- 현재 접속사용자(ADER)이 가지고 있는 테이블 조회

SELECT OWNER, TABLE_NAME 
FROM ALL_ALL_TABLES ;	-- 현재 계정이 접속 가능한 모든 테이블 조회

SELECT *
FROM DBA_TABLES;		-- 권리권한의 사용자만 접근가능

/* 시퀀스 */
CREATE TABLE DEPT_SEQ
AS SELECT *
FROM DEPT
WHERE 1 <> 1;	-- 빈 테이블은 만드냐 안만드냐(같지 않다 연산자 (1 != 1 이랑 같은 의미!) 

SELECT *
FROM DEPT_SEQ;

DROP TABLE DEPT_SEQ;

CREATE SEQUENCE SEQ_DEPT_SEQUENCE			-- 시퀀스 테이블 이름
INCREMENT BY 10								-- 증가하는 값
START WITH 10								-- 시작 값
MAXVALUE 90									-- 최댓 값
MINVALUE 0									-- 최솟 값
NOCYCLE										-- 최대값이면 정지, 순환금지 
CACHE 2;									-- 

SELECT *
FROM USER_SEQUENCES;

/* 시퀀스 사용 */
-- 시퀀스 이름.NEXTVAL
INSERT INTO DEPT_SEQ (DEPTNO, DNAME, LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'BUSAN');

SELECT *
FROM DEPT_SEQ ORDER BY DEPTNO;

INSERT INTO DEPT_SEQ (DEPTNO, DNAME, LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE1', 'SEOUL');

SELECT *
FROM DEPT_SEQ ORDER BY DEPTNO;

INSERT INTO DEPT_SEQ (DEPTNO, DNAME, LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE2', 'JEJU');

SELECT *
FROM DEPT_SEQ ORDER BY DEPTNO;

-- [ 시퀀스.CURRVAL] 가장 마지막의 시컨스 확인
SELECT SEQ_DEPT_SEQUENCE.CURRVAL
FROM DUAL;

-- 시퀀스 수정
ALTER SEQUENCE SEQ_DEPT_SEQUENCE 
INCREMENT BY 3 
MAXVALUE 99 
CYCLE;

SELECT *
FROM USER_SEQUENCES;
DROP SEQUENCE SEQ_DEPT_SEQUENCE;



