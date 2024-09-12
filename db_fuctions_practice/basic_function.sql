/*
    문자열 제어, 조작, 조회 하는 기본적인 내장 함수들
    너무 많으니 아래 한번씩 조회 해서 확인
*/

SELECT substring_index('https://www.youtube.com/?index=main.html', '.', 2), -- 결과 : https://www.youtube
	substring_index('https://www.youtube.com/?index=main.html', '.', -2); -- 결과 : com/?index=main.html
SELECT substring('TIGER_JK', 3, 2); -- 결과 : GE
SELECT CONCAT('이것이', SPACE(10), 'MySQL system'); -- 결과 : 이것이          MySQL system
SELECT reverse('MySQL'); -- 결과 : LQSyM
SELECT replace('This is mySQL', 'This is', 'Yo soy'); -- 결과 : Yo soy mySQL
SELECT repeat('yoursql  ', 3); -- 결과 : yoursql  yoursql  yoursql  
SELECT trim('  this is mysql  '), trim(both 'ㅋㅋㅋ' from 'ㅋㅋㅋ  this is yoursql ㅋㅋㅋ '); -- 결과 : this is mysql, this is yoursql ㅋㅋㅋ 
SELECT ltrim('   이것이'), rtrim('이것이   '); -- 결과 : 좌,우 공백 제거
SELECT lpad('이것이', 5, '@@'), rpad('이것이', 5, '@@'); -- 결과 : @@이것이	이것이@@
SELECT upper(userId) FROM dev_sqldb.user_table;
SELECT lower('abcdeEGHI'), upper('abcdefghi'); -- 결과 : abcdeeghi	ABCDEFGHI
SELECT left('abcdefghi', 3), right('abcdefghi', 3); -- 결과 : abc	ghi
SELECT name, insert(height, 1, 3, '***') AS '키는 비밀' FROM dev_sqldb.user_table WHERE height;
SELECT INSERT('abcdefghi', 3, 4, '@@@@'), INSERT('abcdefghi', 3, 2, '@@@@'); -- 결과 : ab@@@@ghi	ab@@@@efghi
SELECT BIN(31), OCT(31), HEX(31), format(123456.123456,4); -- 결과 : 11111	37	1F	123,456.1235
SELECT ELT(2, 'Apple', 'Banana', 'Cherry') AS fruit; -- ELT() -> Banana
SELECT FIELD('Cherry', 'Apple', 'Banana', 'Cherry') AS position; -- FIELD() -> 3
SELECT FIND_IN_SET('Banana', 'Apple,Banana,Cherry') AS position; -- FIND_IN_SET() -> 2
SELECT INSTR('Hello World', 'World') AS position; -- INSTR() -> 7
SELECT LOCATE('World', 'Hello World') AS position; -- LOCATE() -> 7
SELECT LOCATE('World', 'Hello World Hello World', 10) AS position; -- LOCATE() -> 19
SELECT ASCII('a'); -- 결과 : 97
SELECT bit_length('abc'), char_length('25ea'), length('123'); --결과 : 24	4	3
SELECT concat_ws(':', prodName, amount) AS '물품수량리스트' FROM dev_sqldb.buy_table;
SELECT concat_ws('/','2024','9','21'); -- 결과 :  2024/9/21