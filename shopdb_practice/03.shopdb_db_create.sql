DROP DATABASE IF EXISTS sqldb; # sqldb를 찾아서 있으면 db 삭제
CREATE DATABASE sqldb; # 삭제 후 생성
USE sqldb; # sqldb 사용
CREATE TABLE usertbl # usertbl 테이블 생성 (회원 정보)
	(userId		CHAR(8)		NOT	NULL	PRIMARY KEY, # 기본키 PK가 있으면 NOT NULL은 필수
    name		VARCHAR(10) NOT NULL,
    birthYear	INT 		NOT NULL,
    address		CHAR(20) 	NOT NULL,
    mobile1		CHAR(13),
    mobile2 	CHAR(13),
    height 		SMALLINT,
    mDate		DATE
    );
CREATE TABLE buytbl # buybtl 테이블 생성
	(num		INT		AUTO_INCREMENT NOT NULL PRIMARY KEY,
    userId		CHAR(8)		NOT NULL,
    prodName	CHAR(6)		NOT NULL,
    groupName	CHAR(4),
    price		INT			NOT NULL,
    amount		SMALLINT	NOT NULL,
    FOREIGN KEY (userId) REFERENCES usertbl(userId) # PK 참조하는 키 설정 usertbl 생성시에 참고 하여 생성
    );
# 여러개의 열에 들어가면 VALUES, 하나만 하면 VALUE
INSERT INTO sqldb.usertbl VALUES ('lsg95', '이승기', 1987, '서울', '011', '12346543', 182, '2008-08-15');
INSERT INTO sqldb.usertbl VALUES ('kbs99', '김범수', 1979, '경남', '011', '12345588', 172, '2012-04-30');
INSERT INTO sqldb.usertbl VALUES ('kkh71', '김경호', 1971, '전남', '018', '12341818', 177, '2007-07-17');
INSERT INTO sqldb.usertbl VALUES ('jyp50', '조용필', 1950, '경기', '019', '12345050', 170, '2009-04-30');
INSERT INTO sqldb.usertbl VALUES ('ssk02', '성시경', 1979, '서울', NULL, NULL, 186, '2013-08-15');
INSERT INTO sqldb.usertbl VALUES ('ljb87', '임재범', 1987, '서울', '016', '12348787', 182, '2013-07-17');
INSERT INTO sqldb.usertbl VALUES ('yjs69', '윤종신', 1969, '경남', NULL, NULL, 170, '2005-05-05');
INSERT INTO sqldb.usertbl VALUES ('ejw72', '은지원', 1972, '경북', '011', '12348888', 174, '2014-03-03');
INSERT INTO sqldb.usertbl VALUES ('jkw65', '조관우', 1965, '경기', '018', '01801865', 172, '2014-10-10');
INSERT INTO sqldb.usertbl VALUES ('bbk73', '바비킴', 1973, '서울', '010', '00001973', 176, '2013-05-05');

INSERT INTO sqldb.buytbl VALUES (NULL, 'kbs99', '운동화', NULL, 30, 2);
INSERT INTO sqldb.buytbl VALUES (NULL, 'kbs99', '노트북', '전자', 1000, 1);
INSERT INTO sqldb.buytbl VALUES (NULL, 'jyp50', '모니터', '전자', 200, 1);
INSERT INTO sqldb.buytbl VALUES (NULL, 'bbk73', '모니터', '전자', 200, 5);
INSERT INTO sqldb.buytbl VALUES (NULL, 'kbs99', '청바지', '의류', 50, 3);
INSERT INTO sqldb.buytbl VALUES (NULL, 'bbk73', '메모리', '전자', 80, 10);
INSERT INTO sqldb.buytbl VALUES (NULL, 'ssk02', '책', '서적', 15, 5);
INSERT INTO sqldb.buytbl VALUES (NULL, 'ejw72', '책', '서적', 15, 2);
INSERT INTO sqldb.buytbl VALUES (NULL, 'ejw72', '청바지', '의류', 50, 1);
INSERT INTO sqldb.buytbl VALUES (NULL, 'bbk73', '운동화', NULL, 30, 2);
INSERT INTO sqldb.buytbl VALUES (NULL, 'ejw72', '책', '서적', 15, 1);
INSERT INTO sqldb.buytbl VALUES (NULL, 'bbk73', '운동화', NULL, 30, 2);

# DELETE FROM sqldb.buytbl where num = 11; # 삭제
SELECT * FROM sqldb.buytbl;