/* 
Stored Procedure 실습
자주 사용하는 조회성 쿼리를 함수 형태로 저장
*/

# 1. Stored Procedure CREATE 
DELIMITER //
CREATE PROCEDURE myProc()
BEGIN
	SELECT * FROM dev_sqldb.member_table WHERE userName = '신기성';
    SELECT * FROM dev_sqldb.member_table WHERE address LIKE '%성남시%';
END //
DELIMITER ;
# 2. 조회
call myProc();