/*
INDEXING을 활용한 index_table 생성 및 조회
*/

# 1. INDEX 생성
CREATE INDEX idx_index_table_firstname ON index_table(first_name);

# 2. 아래 조회가 index 테이블 생성 전에는 전체에서 검색하지만, 위에 index 생성 후에 조회 하면 indexing 된 데이터로 조회
SELECT * FROM employees.index_table WHERE first_name = 'Mary';