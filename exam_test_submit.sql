-- [문제1] MySQL 재설치 시에 해야 하는 3단계를 적으세요
/*
1. 제어판 진입 후 프로그램 설치, 제거에 진입하여 MySQL 과 관련된 프로그램을 모두 삭제 한다
2. C:\Program Files (x86)\MySQL와 C:\Program Files\MySQL 에 진입 하여 해당 폴더를 삭제 한다
3. 숨긴 폴더를 해제 하고, C:\ProgramData\MySQL 와 C:\Users\학생\AppData\Roaming\MySQL 에 진입 하여 해당 폴더를 삭제 후 재설치 한다
*/
-- [문제2] 아래 조건에 맞게 examdb 데이터 베이스를 생성 하고 STUDENT, TEACHER 테이블을 만드세요
CREATE DATABASE examdb;
USE examdb;
DROP TABLE STUDENT;
DROP TABLE TEACHER;
-- 조건1) 학번, 학년, 점수는 숫자 데이터 형으로, 성명, 학과는 문자 데이터 형으로 만드세요
CREATE TABLE STUDENT
	(학번 INT NOT NULL PRIMARY KEY,
	 성명 CHAR(6) NOT NULL,
     학과 CHAR(6),
     학년 INT,
     점수 INT);
-- 조건2) 학번은 숫자 데이터 형으로 교수명, 수강과목은 데이터 형으로 만드세요
CREATE TABLE TEACHER
	(학번 INT NOT NULL PRIMARY KEY,
     교수명 CHAR(6) NOT NULL,
     수강과목 CHAR(8));

-- [문제3] 테이블에 데이터들을 넣으세요
-- 조건1) 테이블에 맞는 STUDENT 데이터를 넣으세요
INSERT INTO STUDENT VALUES (990111, '김철수', '정보통신', 1, 85);
INSERT INTO STUDENT VALUES (990223, '박태인', '정보미디어', 1, 80);
INSERT INTO STUDENT VALUES (972020, '김길동', '전기공학', 2, 88);
INSERT INTO STUDENT VALUES (981010, '이철준', '컴퓨터', 3, 92);
INSERT INTO STUDENT VALUES (981533, '오준석', '산업공학', 3, 90);
INSERT INTO STUDENT VALUES (961017, '최길동', '컴퓨터', 4, 75);
-- 조건2) 테이블에 맞는 TEACHER 데이터를 넣으세요
INSERT INTO TEACHER VALUES(990111, '박철민', '통신학');
INSERT INTO TEACHER VALUES(990223, '이순자', '운영체제');
INSERT INTO TEACHER VALUES(972020, '김창백', '전기학');
INSERT INTO TEACHER VALUES(971010, '이기동', '알고리즘');
INSERT INTO TEACHER VALUES(981533, '최철순', '통계학');
INSERT INTO TEACHER VALUES(961017, '이기동', '컴퓨터과학개론');

-- [문제4] STUDENT 테이블에 주소, 연락처를 가변문자 데이터 타입으로 열 추가를 하고, 데이터를 넣으세요
-- 조건1)
ALTER TABLE STUDENT
	ADD (주소 VARCHAR(30), 연락처 VARCHAR(15));
-- 조건2)
UPDATE STUDENT SET 주소 = '서울시 강남구', 연락처 = '010-1234-5678' WHERE 학번 = '990111';
UPDATE STUDENT SET 주소 = '경기도 수원시 팔달구', 연락처 = '010-1122-5588' WHERE 학번 = '990223';
UPDATE STUDENT SET 주소 = '경기도 안산시 단원구', 연락처 = '010-2222-3333' WHERE 학번 = '972020';
UPDATE STUDENT SET 주소 = '서울시 광진구', 연락처 = '010-5588-2580' WHERE 학번 = '981010';
UPDATE STUDENT SET 주소 = '서울시 강서구', 연락처 = '010-4125-5236' WHERE 학번 = '981533';
UPDATE STUDENT SET 주소 = '경기도 안산시 단원구', 연락처 = '010-8569-1100' WHERE 학번 = '961017';

-- [문제5] 쿼리문을 작성하세요
-- 조건1) STUDENT 테이블에서 점수가 85점 이상을 조회 하여 학번이 내림차순 되게 정렬 조회 하세요
SELECT * FROM STUDENT 
	WHERE 점수 >= 85
    ORDER BY 학번 ASC;
-- 조건2) STUDENT 테이블에서 2학년 이상인 학생 수를 조회하세요
SELECT count(*) FROM STUDENT 
	WHERE 학년 >= 2;
    
-- [문제6] JOIN을 사용 하여 쿼리문을 작성 하세요
-- 조건1) 점수가 85점을 초과하고 STUDENT와 TEACHER 테이블을 JOIN 하여 보여주는 쿼리문을 만드세요
SELECT s1.학과, t1.교수명 FROM STUDENT s1
	JOIN TEACHER t1
    ON s1.학번 = t1.학번
    WHERE 점수 > 85;

-- 조건2) STUDENT와 TEACHER 테이블을 모두 보여 주고, 학번, 성명 순으로 정렬 하는 쿼리문을 만드세요
SELECT * FROM STUDENT s1
	LEFT JOIN TEACHER t1
    ON s1.학번 = t1.학번
    ORDER BY s1.학번, s1.성명;

-- [문제7] 쿼리문을 작성 하세요
-- 조건1) 이철준의 학과와 같은 리스트를 출력하는 쿼리를 작성하세요
SELECT * FROM STUDENT 
	WHERE 학과 = ALL (SELECT 학과 FROM STUDENT WHERE 성명 = '이철준');

-- 조건2) 평균 점수보다 높은 사람들을 출력하는 쿼리를 작성하세요
SELECT * FROM STUDENT
	WHERE 점수 > (SELECT avg(점수) FROM STUDENT);
    
-- [문제8] STUDENT와 TEACHER 테이블 복사하여 테이블을 새로 작성 하세요
-- 조건1) TEST_TEACHER 테이블을 만들고 데이터를 넣으세요
CREATE TABLE TEST_TEACHER (SELECT * FROM TEACHER);
INSERT INTO TEST_TEACHER VALUES(974023, '이순신', '색체학');
INSERT INTO TEST_TEACHER VALUES(966112, '강감찬', '대체수학');
INSERT INTO TEST_TEACHER VALUES(955011, '김철수', '역사학');

-- 조건2) TEST_STUDENT 테이터를 만들고 데이터를 넣으세요
CREATE TABLE TEST_STUDENT (SELECT * FROM STUDENT);
INSERT INTO TEST_STUDENT VALUES (971023, '박해만', '컴퓨터', 2, 69, NULL, NULL);
INSERT INTO TEST_STUDENT VALUES (961012, '이승열', '컴퓨터', 4, 78, NULL, NULL);
INSERT INTO TEST_STUDENT VALUES (955011, '최형만', '사학', 4, 96, NULL, NULL);

-- [문제9] 쿼리문을 작성 하세요
-- 조건1) 컴퓨터 학과에서 평균점수보다 높은 학생들을 정보통신 학과로 이름을 바꾸는 쿼리문을 작성 하세요
-- 진짜 정답!!
UPDATE TEST_STUDENT SET 학과 = '정보통신'
	WHERE 점수 > (SELECT AVG(점수) FROM STUDENT) AND 학과 = '컴퓨터';

-- error Code: 1093. You can't specify target table 'TEST_STUDENT' for update in FROM clause
UPDATE TEST_STUDENT SET 학과 = '정보통신'
	WHERE 학과 = '컴퓨터' AND 점수 > (SELECT avg(점수) FROM TEST_STUDENT WHERE 학과 = '컴퓨터');
-- MySQL에서는 에러 발생으로 아래 JOIN을 이용해 다시 시도
UPDATE TEST_STUDENT
JOIN (
    SELECT avg(점수) AS avg_score
    FROM TEST_STUDENT
    WHERE 학과 = '컴퓨터'
) AS AvgScores
	ON TEST_STUDENT.학과 = '컴퓨터'
	SET TEST_STUDENT.학과 = '정보통신'
	WHERE TEST_STUDENT.점수 > AvgScores.avg_score;

-- 조건2) 점수가 90점 이상이 데이터를 삭제 하세요
DELETE FROM TEST_STUDENT WHERE 점수 >= 90;

/* 10. 데이터베이스의 개체에 이름을 줄때 따라야 할 규칙에 대해 서술 하시오
1. 명확성, 일관성, 간결성을 유지
2. 문자는 숫자를 사용하되 특수문자는 (_)이외에 사용 하지 않고 대소문자를 일관되게 사용
3. 예약어는 테이블, 열에 사용 하지 않는다
4. 두개의 테이블에 동일한 이름 부여 불가
*/

/*  11. INNER JOIN에서 ON 과 WHERE에서 table. 으로 표현이 되는 이유를 서술 하시오.
1) 테이블 이름과 컬럼 이름을 구분 할수 있음 (명시성)
2) 다른 테이블에서 동일한 컬럼의 이름을 사용할때 명확히 할 수 있음 (중복 방지)
3) 쿼리의 가독성
4) INNER JOIN 절에서 조인 조건을 지정할때 정확한 컬럼을 지정 할 수 있음
5) WHERE 절에서 특정 테이블의 컬럼을 기준으로 필터링을 할 수 있음
6) 다중 쿼리문 실행 시 조인된 여러 테이블에서 동일한 이름의 컬럼이 있을 경우, 테이블 이름과 점(.)을 사용하여 명확히 지정하지 않으면 SQL 엔진이 어떤 테이블의 컬럼을 참조하는지 알 수 없음
*/