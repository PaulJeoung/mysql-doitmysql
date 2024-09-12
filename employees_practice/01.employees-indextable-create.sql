/*
기존empolyees의 db table을 이용하여 IndexTable 생성하기
employees db의 employees 테이블의 특정 데이터 들을 500 까지 생성한 테이블에 삽입
*/

-- 1. 사용할 DB 선언
USE employees;

-- 2. CREATE TABLE
CREATE TABLE index_table
	(first_name VARCHAR(14),
     last_name VARCHAR(16),
     hire_date DATE);

-- 3. INSERT data from employees.employees
INSERT INTO index_table
	SELECT first_name, last_name, hire_date
    FROM employees.employees
    LIMIT 500;

-- 4. 생성된 data table 조회
SELECT * FROM employees.index_table;