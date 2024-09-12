/*
    OUTER JOIN (외부 조인) 연습
    이론은 구글링하면 엄청 잘나옴

*/

-- 1. LEFT, RIGHT JOIN 쿼리
-- 줄여서 LEFT JOIN 으로 사용 가능
SELECT U.userId, U.name, B.prodName, U.address, concat(U.mobile1, U.mobile2) AS 'Contacts'
	FROM user_table U
		LEFT OUTER JOIN buy_table B ON U.userId = B.userId
	ORDER BY U.userId;

SELECT U.userId, U.name, B.prodName, U.address, concat(U.mobile1, U.mobile2) AS 'Contacts'
	FROM user_table U
		RIGHT JOIN buy_table B ON U.userId = B.userId
	ORDER BY U.userId;

-- 2. 조건을 이용한 OUTER JOIN : 구매 기록이 없는 회원들 조회
SELECT U.userId, U.name, B.groupName
	FROM buy_table B
		LEFT JOIN user_table U ON B.userId = U.userId
        WHERE B.groupName IS NULL
        ORDER BY U.userId;

-- 3. 3개의 테이블을 이용한 OUTER JOIN : 3개의 테이블로 INNER JOIN 했던 결과를 OUTER JOIN으로 변경
SELECT sc.stdName, sc.clubName, c.roomNo, s.address
	FROM sqldb.stdclubtbl sc
    LEFT JOIN stdtbl s ON sc.stdName = s.stdName
    LEFT JOIN clubtbl c ON sc.clubName = c.clubName;

-- 4. 조건을 이용한 3개 테이블의 OUTER JOIN
--    : 동아리를 기준으로 가입된 학생을 출력하되, 가입 학생이 하나도 없는 동아리도 출력
SELECT c.clubName, s.stdName, c.roomNo, s.address
	FROM stdtbl s
	LEFT OUTER JOIN stdclubtbl sc ON s.stdName = sc.stdName
	LEFT OUTER JOIN clubtbl c ON sc.clubName = c.clubName
	UNION
	SELECT c.clubName, s.stdName, c.roomNo, s.address
	FROM clubtbl c
	LEFT OUTER JOIN stdclubtbl sc ON c.clubName = sc.clubName
	LEFT OUTER JOIN stdtbl s ON sc.stdName = s.stdName
	ORDER BY clubName DESC;

-- 학원식 정답
SELECT s.stdName, s.address, c.clubName, c.roomNo
	FROM stdtbl s
		LEFT JOIN stdclubtbl sc ON s.stdName = sc.stdName
        LEFT JOIN clubtbl c ON sc.clubName = c.clubName
	UNION
	SELECT c.clubName, c.roomNo, s.stdName, s.address
		FROM stdtbl s
			LEFT JOIN stdclubtbl sc ON sc.stdName = s.stdName
			RIGHT JOIN clubtbl c ON sc.clubName = c.clubName;