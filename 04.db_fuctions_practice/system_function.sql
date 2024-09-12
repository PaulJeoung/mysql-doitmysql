/*
    시스템 사용과 관련된 내장 함수
*/

-- 1. PAUSE 가 필요 할때 사용
SELECT sleep(5);
SELECT 'It`ll showing after 5 sec';

-- 2. MySQL 버전 확인 
SELECT version();

-- 3. 실행한 쿼리의 행 갯수
UPDATE dev_sqldb.buy_table SET price = price*2;
SELECT row_count();

-- 4. 찾으려는 테이블의 행 갯수
SELECT * FROM dev_sqldb.usertbl;
SELECT found_rows();

-- 5. 접속한 유저 정보와 DB NAME
SELECT current_user(), database();
