--1
CREATE VIEW samsBills AS
SELECT first_name, surname, bill_date, cust_name, bill_total
FROM restStaff
JOIN restBill
ON restStaff.staff_no = restBill.waiter_no
WHERE first_name = 'Sam' AND surname = 'Pitt';

--2
SELECT * FROM samsBills
WHERE bill_total > 400;

--3
CREATE VIEW roomTotals AS 
SELECT restRoom_management.room_name, SUM(bill_total) AS total_sum 
FROM restRoom_management 
JOIN restRest_table  
ON restRoom_management.room_name = restRest_table.room_name 
JOIN restBill ON restBill.table_no = restRest_table.table_no 
GROUP BY restRoom_management.room_name;

--4
CREATE OR REPLACE VIEW teamTotals AS
SELECT CONCAT(T1.first_name, ' ', T1.surname) AS headwaiter_name, SUM(restBill.bill_total) AS total_sum
FROM restStaff AS T1
JOIN restStaff AS T2 ON T1.staff_no = T2.headwaiter
JOIN restBill 
ON restBill.waiter_no = T2.staff_no
GROUP BY T1.staff_no;

