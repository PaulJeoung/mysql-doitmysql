/* 
가상뷰 실습
외부 인력이나 일부 정보만 노출 하는 경우 가상테이블 생성
*/

# 1. Virture View CREATE
CREATE VIEW vv_member_table
	AS SELECT userName, address
    FROM dev_sqldb.member_table;

# 2. 생성한 가상뷰 조회
SELECT * FROM dev_sqldb.vv_member_table;