/*
    데이터 UPDATE, DELETE 등이 되지 않고 에러메시지가
    (Error Code: 1175) 발생 하는 경우
    safe mode 상태인지 확인 후
    safe mode를 해제
*/

SET SQL_SAFE_UPDATES = 0;