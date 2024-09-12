-- MySQL 시험 범위 & 예상 문제 [11문항, 2hours] 

/* 1. 재설치 하기 전에 해야 하는 작업들을 서술 하시오	
    1) 제어판에 프로그램 및 기능 메뉴에 진입 후 MySQL 이라는 이름의 프로그램들 모두 제거 
    2) 각 폴더에 진입 하여 폴더 영구 삭제
        2-1) 프로그램 삭제 ( C:\Program Files\MySQL )
        2-2) AppData 디렉토리 삭제 ( c:\users\[사용자]\AppData\Roaming\MySQL ) 
        2-3) ProgramData 디렉토리 삭제 ( C:\ProgramData )
    3) 다운로드 받은 mysql-installer-community-8.0.36.0.msi 관리자 권한으로 설치
*/

-- 2. 조건에 맞게 CREATE TABLE 2개 생성 (사용할 DB는 알려줌)
DROP DATABASE IF EXISTS testexam;
CREATE DATABASE testexam;
USE testexam;
CREATE TABLE test1
    (userId CHAR(8) NOT NULL PRIMARY KEY,
     name CHAR(5) NOT NULL,
     address CHAR(5) NOT NULL,
     age INT NOT NULL,
     phone CHAR(13) NULL,
     height INT NULL);
CREATE TABLE test2
	(num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
     userId CHAR(8) NOT NULL,
     prodName CHAR(6) NOT NULL,
     groupName CHAR(4) NULL,
     price INT NOT NULL,
     amount SMALLINT NOT NULL,
     FOREIGN KEY(userId) REFERENCES test1(userId));

-- 3. 2번 기준으로 데이터 입력
INSERT INTO test1 VALUES ('tester1', '테스터1', '성남', 32, '01055559876', 181);
INSERT INTO test2 VALUES (NULL, 'tester1', 'item1', 'gn_A', 5000, 4);

-- 4. 조건을 이용하여, (특정테이블에 열 추가) ALTER TABLE 후에 INSERT INTO 데이터 삽입
ALTER TABLE test1
    ADD COLUMN birthDate DATE NOT NULL DEFAULT '1919-03-01';
ALTER TABLE test2
    ADD CONSTRAINT PK_num_test2_TABLE
    PRIMARY KEY (num);
UPDATE test1 SET birthDate = '2002-06-15' WHERE userId = 'tester1';
INSERT INTO test2 VALUES (NULL, 'tester3', 'goods1', 'ig_A', 2000, 2)
    ON DUPLICATE KEY UPDATE prodName = 'goods1', groupName = 'ig_A';
-- 필요한 경우 삭제 DELETE FROM testexam.test2 WHERE num = 5;

-- 5. 조건에 맞는 쿼리문 작성1
SELECT * FROM test1
    WHERE height IS NULL;;

-- 6. JOIN
SELECT t1.userId, t1.name, t2.prodName, t2.groupName
    FROM test1 t1
    JOIN test2 t2
    ON t1.userId = t2.userId
    ORDER BY t2.num DESC;

-- 7. 조건에 맞는 쿼리문 작성2 (하위쿼리)
SELECT * FROM test1
    WHERE (SELECT * FROM);

-- 8. 2번에서 만들어진 테이블 2개 복사 해서 쿼리문 작성
CREATE TABLE test3
    (SELECT userId, name, address, height FROM testexam.test1);
CREATE TABLE test4
    (SELECT * FROM testexam.test2);

-- 9. 복사한 테이블에서 조건에 맞는 쿼리문 작성3
SELECT * FROM test3
    WHERE (SELECT * FROM);
SELECT t1.userId, t1.name, t2.prodName, t2.groupName
    FROM test3 t3
    LEFT JOIN test2 t2 ON t3.userId = t2.userId
    LEFT JOIN test1 t1 ON t3.userId = t1.userId
    ORDER BY t2.num DESC;

/* 10. 데이터베이스의 개체에 이름을 줄때 따라야 할 규칙에 대해 서술 하시오
    1. 명명 규칙
        명확성: 이름은 해당 개체의 역할이나 의미를 명확하게 반영 해야 함
        일관성: 데이터베이스 내에서 일관된 명명 규칙을 사용해야 함
        간결성: 이름은 간결하면서도 이해하기 쉬워야 함
    2. 문자 사용 규칙
        문자와 숫자: 이름은 일반적으로 알파벳 문자와 숫자를 포함할 수 있고 숫자는 일반적으로 이름의 끝부분에 배치
        특수 문자 사용 금지: 언더스코어(_)이외에 다른 문자 사용 금지
        대소문자 규칙: 모든 이름을 대문자 또는 소문자로 일관되게 사용
    3. 예약어 피하기
        SQL 예약어(예: SELECT, TABLE, DATE)는 테이블명이나 컬럼명으로 사용하지 안됨
    4. 유니크한 이름
        고유성: 데이터베이스 내에서 각 개체의 이름은 고유해야 함. 두개의 테이블에 동일한 이름 부여 불가
    5. 길이 제한
        길이 제한: 데이터베이스 시스템마다 테이블명, 컬럼명 등 개체 이름의 최대 길이 제한 (64자)
    6. 프리픽스 및 접미사 사용
        프리픽스/접미사: 테이블, 뷰, 인덱스 등의 이름에 프리픽스(예: tbl_, vw_)나 접미사(예: _id, _date)를 추가하여 개체의 종류나 용도를 구분
    7. 조직 표준 준수
        조직이나 팀에서 정의한 표준을 따르는 것이 중요함
*/

/* 11. INNER JOIN에서 ON 과 WHERE에서 table. 으로 표현이 되는 이유를 서술 하시오.
    1) 테이블 이름과 컬럼 이름을 구분 할수 있음 (명시성)
    2) 다른 테이블에서 동일한 컬럼의 이름을 사용할때 명확히 할 수 있음 (중복 방지)
    3) 쿼리의 가독성
    4) INNER JOIN 절에서 조인 조건을 지정할때 정확한 컬럼을 지정 할 수 있음
    5) WHERE 절에서 특정 테이블의 컬럼을 기준으로 필터링을 할 수 있음
    6) 다중 쿼리문 실행 시 조인된 여러 테이블에서 동일한 이름의 컬럼이 있을 경우, 테이블 이름과 점(.)을 사용하여 명확히 지정하지 않으면 SQL 엔진이 어떤 테이블의 컬럼을 참조하는지 알 수 없음
*/
