/*
    (내기준)알아두면 유용해보이는 SELECT 쿼리문

*/

--1. 특정 열만 지정 하여 테이블을 복사
CREATE TABLE buycopy (SELECT userId, prodName FROM shopdb.buy_table);
SELECT * FROM shopdb.buycopy;

--2. 데이터가 많을때 (ex. 백만개?), 상위 몇개만 확인 하기
SELECT * FROM shopdb.buy_table ORDER BY prodName ASC LIMIT 5;

-- 3. 중복값 제거 (여러개가 있는 데이터를 한개만 출력)
SELECT DISTINCT address FROM shopdb.user_table;

-- 4. 그룹으로 묶어서 조회, 열에 Alias name 지정
SELECT userId, amount FROM shopdb.buy_table ORDER BY userId;
SELECT userId AS '사용자 아이디', SUM(amount) AS '총 구매갯수' 
    FROM shopdb.buy_table GROUP BY userId ORDER BY '총 구매갯수';
SELECT userId AS '사용자 아이디', SUM(price * amount) AS total_price 
    FROM shopdb.buy_table GROUP BY userId ORDER BY total_price DESC;