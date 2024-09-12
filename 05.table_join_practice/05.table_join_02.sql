/*
    3개의 테이블을 사용하여 JOIN
*/

-- 1. dev_sqldb 에 3개의 테이블 생성
-- 1-1. CREATE TABLE stdtbl
CREATE TABLE stdtbl
	(stdName VARCHAR(10) NOT NULL PRIMARY KEY,
     address CHAR(4) NOT NULL);
-- 1-2. CREATE TABLE clubtbl
CREATE TABLE clubtbl
	(clubName VARCHAR(10) NOT NULL PRIMARY KEY,
     roomNo CHAR(4) NOT NULL);
-- 1-3. CREATE TABLE stdclubtbl
CREATE TABLE stdclubtbl
	(num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	 stdName VARCHAR(10) NOT NULL,
     clubName VARCHAR(10) NOT NULL,
     FOREIGN KEY(stdName) REFERENCES stdtbl(stdName), -- 외래키 적용
     FOREIGN KEY(clubName) REFERENCES clubtbl(clubName) -- 외래키 적용
     );

-- 2. 생성한 테이블에 각각 데이터 넣기
INSERT INTO dev_sqldb.stdtbl VALUES ('김범수', '경남'), ('성시경', '서울'), ('조용필', '경남'), ('은지원','경북'), ('바비킴','서울');
INSERT INTO dev_sqldb.clubtbl VALUES ('수영', '101호'), ('바둑', '102호'), ('축구', '103호'), ('봉사','104호');
INSERT INTO dev_sqldb.stdclubtbl VALUES (NULL, '김범수', '바둑'), (NULL, '김범수', '축구'), (NULL, '조용필', '축구'),
			(NULL, '은지원', '축구'), (NULL, '은지원', '봉사'), (NULL, '바비킴', '봉사');

-- 3. 3개 테이블을 이용해 학생을 기준으로 학생이름, 지역, 가입한동아리, 동아리방을 출력
--    TIP) 헷갈릴때는 그냥 외래키되어 있는 테이블을 FROM 에서 지정
SELECT sc1.stdName AS '학생이름', s1.address AS '지역', sc1.clubName AS '동아리이름', c1.roomNo AS '동아리방'
	FROM stdclubtbl sc1
	JOIN stdtbl s1 ON sc1.stdName = s1.stdName
    JOIN clubtbl c1 ON sc1.clubName = c1.clubName
    ORDER BY s1.stdName;