/*
    CROSS JOIN 연습
*/
-- 1. CROSS JOIN으로 시스템을 죽여보자
-- 실행은 하지 말고, 쿼리문만 보자
-- (user_table rows = 10) * (buy_table rows = 12) = 120
SELECT * FROM buy_table CROSS JOIN user_table;

-- 2. employees db에서 약 30만건의 employees 테이블과 44만건의 title 을 cross join을 실행 하면, 
--    133,003,039,392 개가 생성됨 (생성할때 디스크 초과가 될 수 있으므로 주의!! or system down!!)
--    우선 예상 데이터를 조회 할것
SELECT count(*) AS '예상 데이터' 
    FROM employees.employees 
    CROSS JOIN employees.titles;

/*
    SELF JOIN 연습
*/
-- 1. 사전작업 CREATE TABLE
CREATE TABLE emp_table (emp CHAR(3), manager CHAR(3), empTel VARCHAR(8));
INSERT INTO emp_table VALUES ('나사장', NULL, '0000');
INSERT INTO emp_table VALUES ('김재무', '나사장', '2222');
INSERT INTO emp_table VALUES ('김부장', '김재무', '2222-1');
INSERT INTO emp_table VALUES ('이부장', '김재무', '2222-2');
INSERT INTO emp_table VALUES ('우대리', '이부장', '2222-2-1');
INSERT INTO emp_table VALUES ('지사원', '이부장', '2222-2-2');
INSERT INTO emp_table VALUES ('이영업', '나사장', '1111');
INSERT INTO emp_table VALUES ('한과장', '이영업', '1111-1');
INSERT INTO emp_table VALUES ('최정보', '나사장', '3333');
INSERT INTO emp_table VALUES ('윤차장', '최정보', '3333-1');
INSERT INTO emp_table VALUES ('이주임', '윤차장', '3333-1-1');

-- 2. SELF JOIN 실행
SELECT a.emp AS '부하직원', b.emp AS '직속상사', b.empTel AS '직속상사 연락처'
	FROM emp_table a
		JOIN emp_table b ON a.manager = b.emp
	WHERE a.emp = '우대리';