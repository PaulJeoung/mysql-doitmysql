/*
    이론은 구글링 하고, 실습으로 감 잡기
    
*/

-- 1. 기본적인 JOIN
SELECT * FROM sqldb.buytbl # 합쳐서 한방에 조회
		INNER JOIN sqldb.usertbl ON buytbl.userId = usertbl.userId
        ORDER BY num;

-- 2. WHERE절로 조건을 추가해 JOIN
SELECT a.userId, a.name, a.address, b.userId, b.prodName FROM sqldb.usertbl a
	INNER JOIN sqldb.buytbl b
    ON a.userId = b.userId
    WHERE a.userId = '바비킴';

-- 3. 아이디, 이름, 구매물품, 주소, 연락처를 JOIN을 이용하여 테이블 출력
SELECT usr.userId AS '아이디', usr.name AS '이름', buy.prodName AS '구매물품', usr.address AS '주소', 
	concat(usr.mobile1,'-', substring(usr.mobile2, 1, 4), '-', substring(usr.mobile2, 5, 4)) AS '연락처'
    FROM sqldb.usertbl usr
	JOIN sqldb.buytbl buy
    ON usr.userId = buy.userId
    ORDER BY usr.userId ASC;