-- 변수 사용

-- 1.변수 선언
SET @myVar1 = 5;
SET @myVar2 = 3;
SET @myVar3 = 4.25;
SET @myVar4 = '가수 이름 ==> ';

-- 2. 변수 대입, 사용 및 출력
SELECT @myVar1;
SELECT @myVar2 + @myVar3;
SELECT @myVar4, name FROM dev_sqldb.user_table WHERE height > 180;