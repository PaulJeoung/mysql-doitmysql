/*
    shopdb.user_table에서 SELECT 문을 이용해 쉬운 조회 쿼리를 실습
    1. 내림 차순, 오름차순 정렬 후 조회
    2. ANY, ALL을 이용한 조건 만족 후 조회
    3. 서브 쿼리 조회 방법
*/

-- 1. 키가 큰 순서로 정렬 하되, 만일 키가 같을 경우에 이름 순으로 정렬해서 나오는 쿼리 조회 (순차 정렬 조회 방법)
SELECT * FROM shopdb.user_table ORDER BY height DESC, name ASC;

-- 2. 먼저 가입 한 순서대로 회원들을 조회
SELECT name, mDate FROM shopdb.user_table ORDER BY mDate ASC;

-- 3) 지역이 '경남' 사람의 키보다 키가 크거나 같은 사람의 이름과 키를 조회
-- ANY : 조건 중 하나라도 만족하는 OR 느낌 (=SOME)
-- ALL : 조건을 모두 만족하는 AND 느낌
SELECT name, height, address FROM shopdb.user_table 
    WHERE height >= ANY
    (SELECT height FROM shopdb.user_table WHERE address = '경남');
SELECT name, height, address FROM shopdb.user_table 
    WHERE height >= ALL
    (SELECT height FROM shopdb.user_table WHERE address = '경남');

-- 3-1) 아래 두개는 같은 쿼리 표현임 (1. = ANY 2. IN)
SELECT name, height, address FROM shopdb.user_table 
    WHERE height = ANY 
    (SELECT height FROM shopdb.user_table WHERE address = '경남');
SELECT name, height, address FROM shopdb.user_table 
    WHERE height IN 
    (SELECT height FROM shopdb.user_table WHERE address = '경남');

-- 4) 서브 쿼리를 이용한 조회
-- 김경호 보다 키가 크거나 같은 사람의 이름과 키를 조회
-- 4-1 : height 값을 알때
-- 4-2 : value가 있을 곳에 다른 필드(열)의 내용을 조회, WHERE...(SELECT...) 부분이 서브 쿼리
SELECT name, height FROM shopdb.user_table WHERE height >= 177;
SELECT name, height FROM shopdb.user_table 
    WHERE height >= 
    (SELECT height FROM shopdb.user_table WHERE name = '김경호');

-- 5) 아래 조건 쿼리를 만들어 보기
-- 5-1 :  1970년 이후에 출생 하고, 신장이 182 이상인 사람의 ID, 이름 조회
-- 5-2 : 1970년 이후에 출생 했거나, 신장이 182 이상인 사람의 ID, 이름 조회
SELECT userId, name, birthYear FROM shopdb.user_table 
    WHERE birthYear >= 1970 AND height >= 182;
SELECT userId, name, birthYear FROM shopdb.user_table 
    WHERE birthYear >= 1970 OR height >= 182;

-- 6) 조건을 만족하는 쿼리 만들어 보기
-- 6-1 BETWEEN : 키가 180~ 183 인 사람의 이름과 키를 조회 하기
SELECT name, height FROM shopdb.user_table WHERE height BETWEEN 180 AND 183;
-- 6-2 LIKE, IN : 지역이 '경남', '전남','경북' 인 사람의 이름과 키를 조회 하기
SELECT name, address, height FROM shopdb.user_table 
    WHERE address LIKE '%남%' OR '%경%' ;
SELECT name, address, height FROM shopdb.user_table 
    WHERE address IN ('경남', '전남','경북');
SELECT name, address, height FROM shopdb.user_table 
    WHERE name LIKE '_종신' ;