/*
chapter02 에 사용하는 database, table 생성 쿼리
*/

# 1. DATABASE CREATE
CREATE DATABASE dev_sqldb;

# 2. dev_sqldb 사용 선언
USE dev_sqldb;

# 3. TABLE CREATE
CREATE TABLE dev_sqldb.member_table
	(no INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
     userId CHAR(8) NOT NULL,
     userName CHAR(5) NOT NULL,
     age INT,
     address VARCHAR(15),
     phoneNumber CHAR(13));

# 4. INSERT DATA
INSERT INTO dev_sqldb.member_table VALUES (NULL, 'jhw0927', '장혜원', 28, '경기도 성남시 분당구', '010-1234-0927');
INSERT INTO dev_sqldb.member_table VALUES (NULL, 'sks99', '신기성', 23, '경기도 성남시 중원구', '010-1234-9999');
INSERT INTO dev_sqldb.member_table VALUES (NULL, 'sks99', '신기성', 23, '경기도 성남시 중원구', '010-1234-9999');
INSERT INTO dev_sqldb.member_table VALUES (NULL, 'ih9901', '정인화', 25, '경기도 용인시 처인구', '010-1234-9901');
INSERT INTO dev_sqldb.member_table VALUES (NULL, 'lee3232', '이진정', 32, '경기도 수원시 영통구', '010-1234-3232');
INSERT INTO dev_sqldb.member_table VALUES (NULL, 'pmj9208', '박민지', 29, '경기도 수원시 팔달구', '010-1234-9208');
INSERT INTO dev_sqldb.member_table VALUES (NULL, 'sih0911', '서인혁', 28, '경기도 고양시 일산구', '010-1234-0911');
INSERT INTO dev_sqldb.member_table VALUES (NULL, 'mkmk23', '장민국', 23, '경기도 성남시 분당구', '010-1234-2323');
INSERT INTO dev_sqldb.member_table VALUES (NULL, 'lee7942', '이민지', 20, '서울시 중구 을지로', '010-1234-7942');
INSERT INTO dev_sqldb.member_table VALUES (NULL, 'choi5819', '최기혁', 22, '서울시 성북구 혜화로', '010-1234-5819');
INSERT INTO dev_sqldb.member_table VALUES (NULL, 'hangaj11', '한가정', 30, '서울시 중구 남대문로', '010-1234-3011');

# 5. UPDATE NO3 data : 신기성
UPDATE dev_sqldb.member_table SET phoneNumber = '010-1234-8282' WHERE no = 3;


