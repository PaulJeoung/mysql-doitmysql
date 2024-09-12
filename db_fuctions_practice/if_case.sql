/*
    제어 흐름 함수 : IF, CASE 문
*/

-- 1. IF문을 이용한 참과 거짓 확인
-- 결과 : 거짓
SELECT IF (100>200, '참', '거짓');

-- 2. IFNULL
-- 결과 : 널   100
SELECT IFNULL (NULL, '널'), IFNULL (100, '널');

-- 3. NULLIF
-- 결과 : NULL   200
SELECT NULLIF (100, 100), NULLIF (200, 100);

-- 4. 데이터에 IF 문으로 조회
-- 결과, 테이블 확인
SELECT IF(salary > 50000, 'High', 'Low') AS salary_category 
    FROM employees.salaries;

-- 5. CASE를 이용한 조회
-- 결과 : TEN
SELECT CASE 10
	WHEN 1 THEN 'FIRST'
    WHEN 5 THEN 'FIVE'
    WHEN 10  THEN 'TEN'
    ELSE 'UNKNOWN'
END AS 'CASE PRACTICE';

-- 5-1. 데이터에 CASE를 이용한 조회
-- 결과 : 테이블 확인
SELECT emp_no, salary, CASE
        WHEN salary >= 130000 THEN 'Hyper High'
        WHEN salary >= 70000 THEN 'High'
        WHEN salary >= 55000 THEN 'Average'
        ELSE 'Poor'
    END AS salary_grade
FROM employees.salaries;