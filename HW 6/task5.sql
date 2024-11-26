--1
SELECT restStaff.first_name AS WaiterFirstName, 
restStaff.surname AS WaiterSurname, restBill.bill_date AS BillDate,
COUNT(restBill.bill_no) AS NumberOfBill
FROM restBill
JOIN restStaff
ON restStaff.staff_no = restBill.waiter_no
GROUP BY restStaff.first_name, restStaff.surname, restBill.bill_date
HAVING COUNT(restBill.bill_no) >= 2;

--2
SELECT room_name, COUNT(table_no) AS NumberOfTables
FROM restRest_table
WHERE no_of_seats > 6
GROUP BY room_name;

--3 
SELECT restRest_table.room_name, SUM(restBill.bill_total) AS TotalAmountOfBills
FROM restRest_table
JOIN restBill
ON restBill.table_no = restRest_table.table_no
GROUP BY restRest_table.room_name;

--4
SELECT T1.first_name AS HeadwaiterFirstName, T1.surname AS HeadwaiterSurname, SUM(restBill.bill_total) AS TotalBillAmount
FROM restStaff T1
JOIN restStaff T2
ON T1.staff_no = T2.headwaiter
JOIN restBill
ON T2.staff_no = restBill.waiter_no
WHERE T1.headwaiter IS NULL
GROUP BY T1.first_name, T1.surname
ORDER BY TotalBillAmount DESC;

--5
SELECT cust_name, AVG(bill_total)
FROM restBill
GROUP BY cust_name
HAVING AVG(bill_total) > 400.00;

--6
SELECT restStaff.first_name AS WaiterFirstName, 
restStaff.surname AS WaiterSurname, restBill.bill_date AS BillDate,
COUNT(restBill.bill_no) AS NumberOfBill
FROM restBill
JOIN restStaff
ON restBill.waiter_no = restStaff.staff_no
GROUP BY restStaff.first_name, restStaff.surname, restBill.bill_date
HAVING COUNT(restBill.bill_no) >= 3;