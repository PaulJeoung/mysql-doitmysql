/*
    /employees_practice 에 있는 employees db를 참고 하여 대용량 데이터를 관리

*/

-- 1. dev_sqldb 안에 테이블 생성
CREATE TABLE test3 (id INT, Fname VARCHAR(50), Lname VARCHAR(50));

-- 2. employees db의 데이터를 참고하여 가져오는 데이터 삽입
INSERT INTO dev_sqldb.test3 
    SELECT emp_no, first_name, last_name 
    FROM employees.employees;

-- 3. 대량 데이터 테이블 생성 후 Kyoichi 조회
SELECT * FROM dev_sqldb.test3 WHERE Fname = 'Kyoichi';

-- 4. 데이터 가공
-- 4-1. UPDATE : Fname이 Kyoichi 인 데이터 들의 Lname을 모두 nagari로 변경
UPDATE dev_sqldb.test3 SET Lname = 'nagari' WHERE Fname = 'Kyoichi';
SELECT * FROM dev_sqldb.test3 WHERE Fname = 'Kyoichi';

-- 4-2. DELETE
-- 삭제 하기 위해서 Aamer 조회 --> Aamer가 포함된 모든 행 삭제
SELECT * FROM dev_sqldb.test3 WHERE Fname = 'Aamer';
DELETE FROM dev_sqldb.test3 WHERE Fname = 'Aamer'; 

-- 5. 3개의 대량 데이터를 DELETE, DROP, TRUNCATE 연습을 위한 대량 데이터 테이블 생성
CREATE TABLE bigtbl1 (SELECT * FROM employees.employees);
CREATE TABLE bigtbl2 (SELECT * FROM employees.employees);
CREATE TABLE bigtbl3 (SELECT * FROM employees.employees);

-- 5-1. DELETE로 삭제
-- 테이블 데이터 행을 삭제, 시간이 오래 걸림
DELETE FROM bigtbl1;

-- 5-2. DROP으로 테이블 삭제
-- 테이블 자체를 삭제, 바로 사라짐 !!주의!!
DROP TABLE bigtbl2;

-- 5-3. TRUNCATE로 테이블 초기화
-- 테이블을 초기화, 휴지통 개념, 테이블의 구조를 남기려면 해당 명령어를 사용
TRUNCATE TABLE bigtbl3;