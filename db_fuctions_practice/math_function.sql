/*
    수학과 관련된 내장 함수
    귀찮으니 조회 해서 확인 하는 걸로...
*/

SELECT truncate(75641.955219, 3), truncate(75641.955219, -3); -- result : 75641.955		75000
SELECT sign(100), sign(0), sign(-524); -- result : 1 	0	-1
SELECT rand(), floor(1 + rand()*6); -- result : 0.009028008216086783   	5 (주사위)
SELECT POW (2,3), SQRT(9); -- result : 8   3
SELECT MOD (157, 10), 157 % 10, 157 MOD 10; -- result : 7	7	7
SELECT degrees(pi()), radians(180); -- result : 180	3.141592653589793
SELECT conv('AA', 16, 2), conv(100, 10, 8); --  result : 10101010	144
SELECT ceil(4.7), floor(4.7), round(4.7); -- result : 5	4	5
SELECT abs(-100); -- result : 100