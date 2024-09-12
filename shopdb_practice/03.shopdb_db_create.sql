/*
새로운 연습용 db인 shopdb 생성
employees db의 employees 테이블의 특정 데이터 들을 500 까지 생성한 테이블에 삽입
*/

-- 1.shopdb를 찾아서 있으면 db 삭제 후 DATABASE, TABLE CREATE
DROP DATABASE IF EXISTS shopdb;
CREATE DATABASE shopdb;
USE shopdb;

-- 2. user_table TABLE CREATE (회원 정보)
CREATE TABLE user_table
	(userId		CHAR(8)		NOT	NULL	PRIMARY KEY, # 기본키 PK가 있으면 NOT NULL은 필수
    name		VARCHAR(10) NOT NULL,
    birthYear	INT 		NOT NULL,
    address		CHAR(20) 	NOT NULL,
    mobile1		CHAR(13),
    mobile2 	CHAR(13),
    height 		SMALLINT,
    mDate		DATE
    );
-- 3. buy_table TABLE CREATE (구매 정보)
CREATE TABLE buy_table
	(num		INT		AUTO_INCREMENT NOT NULL PRIMARY KEY,
    userId		CHAR(8)		NOT NULL,
    prodName	CHAR(6)		NOT NULL,
    groupName	CHAR(4),
    price		INT			NOT NULL,
    amount		SMALLINT	NOT NULL,
    FOREIGN KEY (userId) REFERENCES user_table(userId) # PK 참조하는 키 설정 usertbl 생성시에 참고 하여 생성
    );
-- 4. DATA INSERT (여러개 삽입: VALUES, 한개 삽입: VALUE)
INSERT INTO shopdb.user_table VALUES ('lsg', '이승기', 1987, '서울', '011', '12346543', 182, '2008-08-15');
INSERT INTO shopdb.user_table VALUES ('kbs', '김범수', 1979, '경남', '011', '12345588', 172, '2012-04-30');
INSERT INTO shopdb.user_table VALUES ('kkh', '김경호', 1971, '전남', '018', '12341818', 177, '2007-07-17');
INSERT INTO shopdb.user_table VALUES ('jyp', '조용필', 1950, '경기', '019', '12345050', 170, '2009-04-30');
INSERT INTO shopdb.user_table VALUES ('ssk', '성시경', 1979, '서울', NULL, NULL, 186, '2013-08-15');
INSERT INTO shopdb.user_table VALUES ('ljb', '임재범', 1987, '서울', '016', '12348787', 182, '2013-07-17');
INSERT INTO shopdb.user_table VALUES ('yjs', '윤종신', 1969, '경남', NULL, NULL, 170, '2005-05-05');
INSERT INTO shopdb.user_table VALUES ('ejw', '은지원', 1972, '경북', '011', '12348888', 174, '2014-03-03');
INSERT INTO shopdb.user_table VALUES ('jkw', '조관우', 1965, '경기', '018', '01801865', 172, '2014-10-10');
INSERT INTO shopdb.user_table VALUES ('bbk', '바비킴', 1973, '서울', '010', '00001973', 176, '2013-05-05');

INSERT INTO shopdb.buy_table VALUES (NULL, 'kbs', '운동화', NULL, 30, 2);
INSERT INTO shopdb.buy_table VALUES (NULL, 'kbs', '노트북', '전자', 1000, 1);
INSERT INTO shopdb.buy_table VALUES (NULL, 'jyp', '모니터', '전자', 200, 1);
INSERT INTO shopdb.buy_table VALUES (NULL, 'bbk', '모니터', '전자', 200, 5);
INSERT INTO shopdb.buy_table VALUES (NULL, 'kbs', '청바지', '의류', 50, 3);
INSERT INTO shopdb.buy_table VALUES (NULL, 'bbk', '메모리', '전자', 80, 10);
INSERT INTO shopdb.buy_table VALUES (NULL, 'ssk', '책', '서적', 15, 5);
INSERT INTO shopdb.buy_table VALUES (NULL, 'ejw', '책', '서적', 15, 2);
INSERT INTO shopdb.buy_table VALUES (NULL, 'ejw', '청바지', '의류', 50, 1);
INSERT INTO shopdb.buy_table VALUES (NULL, 'bbk', '운동화', NULL, 30, 2);
INSERT INTO shopdb.buy_table VALUES (NULL, 'ejw', '책', '서적', 15, 1);
INSERT INTO shopdb.buy_table VALUES (NULL, 'bbk', '운동화', NULL, 30, 2);

-- 5. 데이터 조회, 확인
SELECT * FROM shopdb.user_table;
SELECT * FROM shopdb.buy_table;