/* 
    조건부 데이터 입력 연습
	1. 테이블 생성 시 가지고 올 행 갯수를 지정 하는 쿼리 구문
    2. 테이블의 제약조건을 설정 (기본키 제약) 하는 쿼리 구문
    3. 데이터 값에 중복값(pk 제약)으로 에러 발생시 다른 필드값 변경 하는 쿼리 구문
		INSERT 에서 pk 값의 중복으로 데이터 삽입이 되지 않는 경우 
            ON DUPLICATE UPDATE 구문을 이용해 pk 값을 비교 하여 
                중복이 없으면 INSERT 
                중복이 있으면 UPDATE 이용해 데이터를 수정
*/

-- 1. TABLE CREATE
CREATE TABLE member (SELECT userId, name, address FROM dev_sqldb.user_table LIMIT 3);
SELECT * FROM dev_sqldb.member;

-- 2. ALTER를 이용해 테이블의 기본키 제약 조건을 추가
-- member_table의 userId 필드 열에 PK로 타입 변경
ALTER TABLE dev_sqldb.member
 	ADD CONSTRAINT pk_member PRIMARY KEY (userId);
-- 제약조건 확인
DESCRIBE dev_sqldb.member;

-- 3. 중복값 삽입 쿼리 실패시 처리방법
-- STEP1) 데이터 삽입
INSERT INTO dev_sqldb.member VALUES ('bbk', '비비코', '미국');
INSERT INTO dev_sqldb.member VALUES ('sjh', '서장훈', '서울');
INSERT INTO dev_sqldb.member VALUES ('hjy', '현주엽', '경기');

-- STEP2) 비비코, 미국 으로 바꾸기
-- IF >> 실행 하면, userId의 pk 중복으로 실패
UPDATE dev_sqldb.member SET name = '비비코', address = '미국' WHERE userId = 'bbk73';

-- STEP3) 중복 되는 pk가 있을때 다른 필드값만 ON DUPLICATE를 이용하여 적용
INSERT INTO dev_sqldb.member VALUES ('hjy', '현주엽', '경기')
	ON DUPLICATE KEY UPDATE name = '한정임', address = '미국';
-- TIP) 중복 값이 실제로 있는지 없는지 모르더라도 아래처럼 쿼리문을 실행 하면, 
--      중복이 아니면 아니면 VALUES 의 데이터 삽입
--      중복일 경우 ON DUPLICATE...의 데이터 삽입
INSERT INTO dev_sqldb.member VALUES ('kizm', '기즈모', '일본')
	ON DUPLICATE KEY UPDATE name = '기즈모', address = '일본';