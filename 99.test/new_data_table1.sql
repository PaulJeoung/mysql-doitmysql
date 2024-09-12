/*
    할인상품 테이블을 만들어서 조회 연습
*/

-- 이전에 설정이 되어 있었다면, 1씩 증가로 변경
SET @@auto_increment_increment = 1;

-- 테이블 생성
CREATE TABLE reduce_item
	(no 		INT 	AUTO_INCREMENT PRIMARY KEY,
     itemId 	CHAR(5), 
     itemName	CHAR(10),
     itemDesc	CHAR(20),
     section	CHAR(5),
     reduceRate	INT,
     reduceDate	DATE,
     endDate	DATE);
    
-- 데이터 추가해서 더 넣기
INSERT INTO reduce_item VALUES (NULL, 'r0201', '퐁퐁', NULL, '생활', 25, '2024-06-10', '2024-10-10');

-- 테이블에 price 필드를 추가
ALTER TABLE reduce_item
    ADD price INT NOT NULL DEFAULT 1000;

-- 할인 상품 할인율, 할인가격을 조회 하여 출력
SELECT itemName as '할인상품', reduceDate as '할인날짜', 
    concat(reduceRate, '%') as '할인율', concat(round((price*reduceRate/10),0), '원') as '할인가격'
	FROM reduce_item;

-- 할인 상품 가격 더하기
SELECT SUM(price) AS '할인상품 전체 가격' FROM reduce_item;

-- 그냥... 필드 넣음
SELECT itemName as '할인상품', reduceDate as '할인날짜', 
    year(reduceDate) as '할인년도', month(reduceDate) as '할인월', day(reduceDate) as '할인일'
	FROM reduce_item;