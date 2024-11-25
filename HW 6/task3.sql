--1
SELECT DISTINCT restStaff.first_name, restStaff.surname
FROM restStaff
JOIN restBill
ON restStaff.staff_no = restBill.waiter_no
WHERE restBill.cust_name = 'Tanya Singh';

--2
SELECT room_date FROM restRoom_management
JOIN restStaff
ON restRoom_management.headwaiter = restStaff.staff_no
WHERE restStaff.first_name = 'Charles' AND restRoom_management.room_name = 'Green'
AND room_date BETWEEN 160201 AND 160229;

--3
SELECT a.first_name, a.surname
FROM restStaff AS a
JOIN restStaff AS b
ON a.headwaiter = b.headwaiter
WHERE b.first_name = 'Zoe' AND b.surname = 'Ball'
AND a.staff_no != b.staff_no;

--4
SELECT restBill.cust_name AS customer_name, restBill.bill_total AS amount_spent, restStaff.first_name AS waiter_first_name, 
restStaff.surname AS waiter_surname
FROM restBill
JOIN restStaff
ON restBill.waiter_no = restStaff.staff_no
ORDER BY restBill.bill_total DESC;

--5
SELECT a.first_name, a.surname  
FROM restStaff AS a 
JOIN restStaff AS b 
ON a.headwaiter = b.headwaiter WHERE b.staff_no IN (
    SELECT waiter_no FROM restBill 
    WHERE bill_no IN (00014, 00017));

--6
SELECT restStaff.first_name AS waiter_first_name, restStaff.surname AS waiter_surname
FROM restStaff
JOIN restRoom_management
ON restStaff.staff_no= restRoom_management.headwaiter
WHERE restRoom_management.room_name = 'Blue' 
AND restRoom_management.room_date = 160312
UNION
SELECT restStaff.first_name AS waiter_first_name, restStaff.surname AS waiter_surname
FROM restStaff
JOIN restRoom_management
ON restStaff.headwaiter= restRoom_management.headwaiter
WHERE restRoom_management.room_name = 'Blue' AND restRoom_management.room_date = 160312;


