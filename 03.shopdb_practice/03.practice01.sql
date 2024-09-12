/*
    ROLLUP 예제) 총구매액이 1,000 이상인 사용자에게만 사은품을 증정 하기 위한 조회
*/
SELECT num, groupName, SUM(price * amount) AS '비용'
	FROM shopdb.buy_table 
    GROUP BY groupName, num WITH ROLLUP 
    ORDER BY groupName DESC;

/*
    HAVING 예제) 총구매액이 1,000 이상인 사용자에게만 사은품을 증정 하기 위한 조회
*/
-- HAVING절을 모르면 아래와 같이 쿼리문을 작성하지만, WHERE 절에서는 SUM 등의 함수 사용 불가
SELECT userId AS '사용자', SUM(price * amount) AS '총구매액'
	FROM shopdb.buy_table WHERE SUM(price * amount) > 1000
    GROUP BY userId;
-- HAVING을 이용하여 쿼리문 작성
SELECT userId AS '사용자', SUM(price * amount) AS '총구매액'
	FROM shopdb.buy_table GROUP BY userId 
    HAVING SUM(price * amount) > 1000;

/* 연습문제)
    1. 전체 구매자의 구매 물품 평균 (ROUND, AVG)
    2. 각 사용자 별로 한번 구매시 물건을 평균 몇개 구매 하는지 조회 (GROUP BY 와 AVG 응용)
    3. user_table에서 가장 큰키와 가장 작은 키의 회원 이름과 키 조회 (MIN, MAX, 하위 쿼리, 비교연산)
    4. 휴대폰이 있는 사용자 수 카운트
*/
-- 1
SELECT ROUND(AVG(amount),3) AS '평균구매수' 
    FROM shopdb.buy_table;
-- 2
SELECT userId, COUNT(price/amount) avg_count 
    FROM shopdb.buy_table 
    GROUP BY userId 
    ORDER BY avg_count DESC;
SELECT userId, AVG(amount) avg_count 
    FROM shopdb.buy_table 
    GROUP BY userId 
    ORDER BY avg_count DESC;
-- 3
SELECT name, height FROM shopdb.user_table 
	WHERE height = (SELECT MIN(height) FROM shopdb.user_table) 
	OR height = (SELECT MAX(height) FROM shopdb.user_table) 
    ORDER BY height DESC;
-- 4
SELECT COUNT(mobile1) AS '휴대폰 소유자 (SUM)' 
    FROM shopdb.user_table;