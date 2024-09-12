
-- 연습1. dev_sqldb.buy_table 의 구매 단가가 1.5배 인상 되었을때 price 열에 인상된 가격을 적용
UPDATE sqldb.buytbl SET price = price*1.5;
SELECT * FROM sqldb.buytbl;

