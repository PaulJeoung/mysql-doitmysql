/*
    기존 테이블 생성 하고, FOREIGN , UNIQUE, CHECK, DEFAULT 조건들을 지정
    주석처리를 하면서 생성 및 수정 쿼리 보내기
*/

-- 1. 기본 테이블 생성
DROP DATABASE IF EXISTS tabledb;
CREATE DATABASE tabledb;
USE tabledb;
CREATE TABLE usertbl
	(userId CHAR(8) NOT NULL PRIMARY KEY, 
     name VARCHAR(10) NOT NULL,
     birthYear INT NOT NULL,
     address CHAR(2) NOT NULL,
     mobile1 CHAR(3) NULL,
     mobile2 CHAR(8) NULL,
     height SMALLINT NULL,
     mDate DATE NULL);
CREATE TABLE buytbl
	(num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
     userId CHAR(8) NOT NULL,
     prodName CHAR(6) NOT NULL,
     groupName CHAR(4) NULL,
     price INT NOT NULL,
     amount SMALLINT NOT NULL,
     FOREIGN KEY(userId) REFERENCES usertbl(userId));

-- 2. PRIMARY KEY 추가
ALTER TABLE tabledb.usertbl  -- usertbl 테이블을 변경
	ADD CONSTRAINT PK_usertbl_userId -- 제약조건을 추가, 추가할 제약조건 이름은 PK_userTBL_userId
    PRIMARY KEY (userId); -- 제약 조건은 기본키 제약 조건, 설정할 열은 userId
-- 2-1. 다른 테이블에도 PK 추가
ALTER TABLE tabledb.buytbl ADD CONSTRAINT pk_buy PRIMARY KEY (num);


-- 3. CHCEK 제약을 추가 한 테이블 생성 (name, birthYear 2가지)
CREATE TABLE chktbl
	(userId CHAR(8) PRIMARY KEY,
     name VARCHAR(10),
     birthYear INT CHECK (birthYear >= 1990 AND birthYear <=2024), -- 출생년도 체크
     mobile1 CHAR(3) NULL,
     CONSTRAINT CK_name CHECK (name IS NOT NULL)); -- 이름 체크

-- 3-1. ALTER 를 이용하여 CHECK 제약 조건 추가
ALTER TABLE chktbl
	ADD CONSTRAINT CK_mobile1
    CHECK (mobile IN ('010','011','016','017','018','019'));

--4. DEFAULT를 이용한 설정
CREATE TABLE deftbl
	(userId CHAR(8) PRIMARY KEY,
     name VARCHAR(10),
     birthYear INT NOT NULL DEFAULT -1,
     address CHAR(2) NOT NULL DEFAULT '서울',
     height SMALLINT NULL DEFAULT 170);

-- 케이스 마다 해당 테이블 데이터 추가 해보기
INSERT INTO tabledb.usertbl VALUES ('LSG', '이승기', 1987, '서울', '011', '11111111', 182, '2008-8-8');
INSERT INTO tabledb.usertbl VALUES ('KBS', '김범수', 1979, '경남', '011', '22223333', 173, '2012-4-4');
INSERT INTO tabledb.usertbl VALUES ('KKH', '김경호', 1971, '전남', '019', '33332222', 182, '2007-7-7');
INSERT INTO tabledb.buytbl VALUES (NULL, 'KBS', '운동화', NULL, 30, 2);
INSERT INTO tabledb.buytbl VALUES (NULL, 'KBS', '노트북', '전자', 1000, 1);
INSERT INTO tabledb.buytbl VALUES (NULL, 'JYP', '모니터', '전자', 200, 1); -- 외래키 때문에 안됨