/*
    날짜, 시간과 관련된 내장 함수
    귀찮으니까 조회 해보자
*/

SELECT time_to_sec('10:56:23'); -- result : 39383
SELECT quarter(20240921) as '2024년도 분기'; -- result : 3
SELECT period_add(202501, 11), period_diff(202506, 202311); -- result : 202512	19
SELECT makedate(2025, 32), maketime(12, 11, 10); -- result : 2025-02-01	12:11:10
SELECT last_day('2025-02-10'); -- result : 2025-02-28
SELECT dayofweek(curdate()), dayofmonth(curdate()), dayofyear(curdate()), monthname(curdate()), yearweek(curdate());
-- result :  4	11	255	September	202436
SELECT datediff(now(), '2024-06-21'), timediff(now(),'2024-06-21 12:00:00'), timediff('23:59:59', '01:46,23'); -- result : 82	838:59:59	22:13:59
SELECT date(now()), time(now()); -- result : 2024-09-11	10:38:07
SELECT hour(curtime()), minute(curtime()), second(curtime()), microsecond(curtime()); -- result : 10	36	29	0
SELECT year(curdate()), month(curdate()), day(curdate()); -- result : 2024	9	11
SELECT subtime('2025-01-01 23:59:59', '1:1:1'), subtime('15:00:00', '2:10:10'); -- result : 2025-01-01 22:58:58	12:49:50
SELECT addtime('2025-01-01 23:59:59', '1:1:1'), addtime('15:00:00', '2:10:10'); -- result : 2025-01-02 01:01:00	17:10:10
SELECT subdate('2025-01-01', INTERVAL 31 DAY), subdate('2025-01-01', INTERVAL 1 MONTH); -- result : 2024-12-01	2024-12-01
SELECT adddate('2025-01-01', INTERVAL 31 DAY), adddate('2025-01-01', INTERVAL 1 MONTH); -- result : 2025-02-01	2025-02-01