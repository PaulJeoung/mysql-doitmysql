/*
    테이블 생성, 데이터 삽입 연습
    - 테이블을 만들고 AUTO_INCREMENT 기능을 사용 하여 데이터 삽입
*/

--1. /member_db_practica/02.member_db_create.sql에서 만든 dev_sqldb 를 사용
USE dev_sqldb; 

--2. TABLE CREATE
CREATE TABLE test1
	(id INT AUTO_INCREMENT PRIMARY KEY,
	 userName CHAR(3),
     age INT);

-- 3. INSERT DATA
INSERT INTO dev_sqldb.test1 VALUES (NULL, '지민', 25);
INSERT INTO dev_sqldb.test1 VALUES (NULL, '유나', 22);
INSERT INTO dev_sqldb.test1 VALUES (NULL, '유정', 21);
INSERT INTO dev_sqldb.test1 VALUES (NULL, '현민', 29);

-- 4. 마지막에 사용된 AUTO_INCREMENT 숫자를 조회
SELECT last_insert_id();

-- 5. 3에서 삽입한 id의 자동 증가를 100 부터 증가하는 것으로 변경 하고 싶을때
ALTER TABLE dev_sqldb.test1 AUTO_INCREMENT = 100;

-- 6. 변경 후 삽입
INSERT INTO dev_sqldb.test1 VALUES (NULL, '백안', 28);

/*
    추가 연습
    - +n 값으로 증가 하고 시작은 1000 부터 인 테이블을 생성 하여 데이터 삽입 하기
*/
-- 7. n 증감 조건 선언 (나중에 사용 후 1로 원복 필수!!)
SET @@auto_increment_increment = 3;

-- 8. TABLE CREATE
CREATE TABLE test2 # 테이블 생성
	(id INT AUTO_INCREMENT PRIMARY KEY,
     userName CHAR(3),
     age INT);

-- 9. 시작 id 선언
ALTER TABLE dev_sqldb.test2 AUTO_INCREMENT = 1000;

-- 10. INSERT DATA
INSERT INTO dev_sqldb.test2 VALUES (NULL, '지민', 25);
INSERT INTO dev_sqldb.test2 VALUES (NULL, '유나', 22);
INSERT INTO dev_sqldb.test2 VALUES (NULL, '유정', 21);
INSERT INTO dev_sqldb.test2 VALUES (NULL, '현민', 29);

-- 11. DATA 조회 및 마지막에 사용한 id AUTO_INCREMENT 확인
SELECT * FROM dev_sqldb.test2;
SELECT last_insert_id();