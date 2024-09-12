/*
    dev_sqldb 안에 있는 데이터를 연습용으로 조회
*/

-- concat()을 이용해 전화번호에 하이픈 적용
SELECT userId, name, 
    concat(mobile1, '-', substring(mobile2, 1, 4), '-', substring(mobile2, 5, 4)) AS '고갱님 전화 번호'
	FROM dev_sqldb.user_table;

-- 분기 적용
SELECT * , quarter(mDate) as '분기' FROM dev_sqldb.user_table;
SELECT name as '고객이름' ,
	   mDate as '가입월', 
       abs(((2024-year(mDate))*365)+(dayofyear(mDate))) as '쇼핑몰 가입일수' 
	FROM dev_sqldb.user_table;

-- 주소지가 경기이고, mDate가 4월, 핸드폰 번호가 없는 사용자를 조회
SELECT userId, mDate FROM dev_sqldb.user_table
	WHERE address = '경기' 
		AND month(mDate) = 4
        AND mobile1 is not NULL;