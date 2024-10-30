--1
SELECT SUM(bill_total) AS Income
FROM restBill;

--2
SELECT SUM(bill_total) AS Income
FROM restBill
WHERE bill_date BETWEEN 160201 AND 160229;

--3
SELECT SUM(bill_total) AS Income, AVG(bill_total) AS Average_bill
FROM restBill
WHERE bill_date BETWEEN 160201 AND 160229;

--4
SELECT MIN(T1.no_of_seats) AS Min, MAX(T1.no_of_seats) AS Max, AVG(T1.no_of_seats) AS AVG
FROM restRest_table T1
INNER JOIN restRoom_management T2
ON T1.room_name = T2.room_name
WHERE T1.room_name = 'Blue';

--5
SELECT COUNT(DISTINCT table_no) AS Distinct_table
FROM restBill
WHERE waiter_no IN (004, 002);
