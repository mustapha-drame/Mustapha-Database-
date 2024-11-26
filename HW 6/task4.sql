--1
SELECT cust_name
FROM restBill
WHERE bill_total > 450.00 AND waiter_no IN (
    SELECT staff_no FROM restStaff
    WHERE headwaiter = (
        SELECT staff_no FROM restStaff
        WHERE first_name = 'Charles'
    )
);

--2
SELECT first_name, surname FROM restStaff 
WHERE staff_no IN (
    SELECT headwaiter FROM restStaff WHERE staff_no IN (
        SELECT waiter_no FROM restBill WHERE cust_name LIKE 'Nerida%' 
        AND bill_date = 160111));

--3
SELECT cust_name, bill_total
FROM restBill
WHERE bill_total = (
    SELECT MIN(bill_total) FROM restBill);

--4
SELECT first_name AS waiter_first_name, surname AS waiter_surname, staff_no
FROM restStaff
WHERE staff_no NOT IN (
    SELECT waiter_no FROM restBill
);

--5
SELECT DISTINCT restBill.cust_name, restBill.bill_total, restStaff.first_name AS headwaiter_first_name, restStaff.surname AS headwaiter_surname, restRoom_management.room_name FROM restBill 
JOIN restStaff ON 
restStaff.staff_no = restBill.waiter_no 
JOIN restRest_table 
ON restRest_table.table_no = restBill.table_no 
JOIN restRoom_management 
ON restRoom_management.room_name = restRest_table.room_name 
WHERE restBill.bill_total = (
    SELECT MAX(bill_total) FROM restBill);