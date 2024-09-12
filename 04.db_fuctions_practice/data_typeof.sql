/*
    데이터 형식의 형 변환
    - 사용가능한 타입
        BINARY, CHAR, TIME, DATE, DATETIME, DECIMAL, JSON, SIGNED INTEGER, UNSIGNED INTEGER...
*/

-- 1. 기본 조회 방식
SELECT AVG(amount) AS '평균구매갯수' FROM dev_sqldb.buy_table;

-- 2. CAST를 이용한 integer 형 변환
SELECT CAST(AVG(amount) AS SIGNED INTEGER)  AS '평균구매갯수' FROM dev_sqldb.buy_table;

-- 3. CONVERT를 이용한 integer 형 변환
SELECT CONVERT(AVG(amount), SIGNED INTEGER)  AS '평균구매갯수' FROM dev_sqldb.buy_table;

-- 4. DATE 형태로 변환
SELECT CAST('2020,12,12' AS DATE);

-- 부록. 쿼리문의 결과를 보기 좋게 출력 (CONCAT 구문은 문자열, 함수등을 합치기 위해서 사용, 열+열 느낌)
SELECT prodName AS '품목', 
    CONCAT(CAST(price AS CHAR(10)), 'x', CAST(amount AS CHAR(4)), '=') AS '단가 X 수량',
	price * amount AS '구매액' 
    FROM sqldb.buy_table;

/*
    암시적 형 변환
*/

-- 1. 기본적인 암시적 형 변환
SELECT '100' + '200';

-- 2. 문자와 숫자 중 숫자만 형변환 하여 인식 false(0)로 출력
SELECT 1 > '2mega';

-- 3. true(1)로 출력
SELECT 3 > '2MEGA';

--4.  mega2 는 문자열로 시작 하기 때문에 0으로 반환, 0과 0을 비교 하므로 true(1) 출력
SELECT 0 = 'mega2';