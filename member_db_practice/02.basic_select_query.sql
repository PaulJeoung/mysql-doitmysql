/*
DATABASE 정보 조회를 위한 쿼리
SELECT 에서 사용하는 기본적인 쿼리 조회
*/

SHOW DATABASES; # DB 리스트 조회
SHOW TABLE STATUS; # 테이블 리스트 조회
DESCRIBE dev_sqldb.member_table; # employees 테이블 구조 (열 이름) 조회

# 1. 기본적인 테이블 전체 조회
SELECT * FROM dev_sqldb.member_table;

# 2. 특정 필드를 만족하는 조회
SELECT * FROM dev_sqldb.member_table WHERE userId = 'lee3232';

# 3. 2가지 이상의 조건 중 하나라도 만족하는 결과 조회
SELECT * FROM dev_sqldb.member_table WHERE no > 5 OR age = 28;

# 4. 2가지 이상의 조건을 모두 만족하는 결과 조회
SELECT * FROM dev_sqldb.member_table WHERE no < 8 AND age < 28;

# 5. 일부 필드 값만으로 조회
SELECT * FROM dev_sqldb.member_table WHERE address LIKE '%서울시%';

# 6. 범위 안에 값을 조회
SELECT * FROM dev_sqldb.member_table WHERE age BETWEEN 23 AND 26;

# 7. 조회 결과를 정렬 하여 출력
SELECT * FROM dev_sqldb.member_table ORDER BY userId DESC; # 내림차순 : DESC, 올림차순 : ASC