-- 1. Retrieve all companies along with their invoices. 
-- This query joins the Companies table with the Invoices table to display each company's invoices.
SELECT c."Name" AS CompanyName, i."PaidAmount", i."IssueDate"
FROM public."Companies" c
JOIN public."Invoices" i ON c."ID" = i."CompanyID"
ORDER BY c."Name";

-- 2. List the total amount paid by each company.
-- This query groups by company name and sums the total paid amount.
SELECT c."Name" AS CompanyName, SUM(i."PaidAmount") AS TotalPaid
FROM public."Companies" c
JOIN public."Invoices" i ON c."ID" = i."CompanyID"
GROUP BY c."Name"
ORDER BY TotalPaid DESC;

-- 3. Retrieve all employees along with their department names.
-- This query joins the Employees table with the Departments table to display each employee's department.
SELECT e."NameAndSurname" AS EmployeeName, d."Name" AS DepartmentName
FROM public."Employees" e
JOIN public."Departments" d ON e."DepartmentID" = d."ID"
ORDER BY e."NameAndSurname";

-- 4. List the number of employees in each department.
-- This query groups by department name and counts the number of employees.
SELECT d."Name" AS DepartmentName, COUNT(e."ID") AS EmployeeCount
FROM public."Departments" d
LEFT JOIN public."Employees" e ON d."ID" = e."DepartmentID"
GROUP BY d."Name"
ORDER BY EmployeeCount DESC;

-- 5. Retrieve all licenses along with their status names.
-- This query joins the Licenses table with the LicenseStatus table to display each license's status.
SELECT l."LicenseNumber", ls."Name" AS StatusName
FROM public."Licenses" l
JOIN public."LicenseStatus" ls ON l."StatusID" = ls."ID"
ORDER BY l."LicenseNumber";

-- 6. List the total number of licenses per company.
-- This query groups by company name and counts the number of licenses.
SELECT c."Name" AS CompanyName, COUNT(l."ID") AS LicenseCount
FROM public."Companies" c
JOIN public."Licenses" l ON c."ID" = l."CompanyID"
GROUP BY c."Name"
ORDER BY LicenseCount DESC;

-- 7. Retrieve all license applications along with the corresponding employee names.
-- This query joins the LicenseApplication table with the Employees table to display each application with the employee's name.
SELECT la."ID" AS ApplicationID, e."NameAndSurname" AS EmployeeName, la."Date"
FROM public."LicenseApplication" la
JOIN public."Employees" e ON la."EmployeeID" = e."ID"
ORDER BY la."Date";


-- 10. List the total payment amount per company.
-- This query groups by company name and sums the total payment amount.
SELECT c."Name" AS CompanyName, SUM(p."Price") AS TotalPayment
FROM public."Companies" c
JOIN public."Invoices" i ON c."ID" = i."CompanyID"
JOIN public."Payments" p ON i."ID" = p."InvoiceID"
GROUP BY c."Name"
ORDER BY TotalPayment DESC;

-- 11. Retrieve all violations along with their status names.
-- This query joins the LicenseViolations table with the ViolationStatus table to display each violation's status.
SELECT lv."ID" AS ViolationID, lv."Description", vs."Name" AS ViolationStatus
FROM public."LicenseViolations" lv
JOIN public."ViolationStatus" vs ON lv."Status" = vs."ID"
ORDER BY lv."ID";

-- 12. List the number of violations per status.
-- This query groups by violation status and counts the number of violations.
SELECT vs."Name" AS ViolationStatus, COUNT(lv."ID") AS ViolationCount
FROM public."ViolationStatus" vs
LEFT JOIN public."LicenseViolations" lv ON vs."ID" = lv."Status"
GROUP BY vs."Name"
ORDER BY ViolationCount DESC;

-- 13. Retrieve the top 5 most recent license renewals.
-- This query orders the LicenseRenewals table by the renewal date to get the top 5 recent renewals.
SELECT lr."ID" AS RenewalID, lr."RenewalDate", lr."Notes"
FROM public."LicenseRenewals" lr
ORDER BY lr."RenewalDate" DESC
LIMIT 5;

-- 14. List all license suspensions along with their company names.
-- This query joins the LicenseSuspensions table with the LicenseApplication table and the Companies table to display each suspension with the company name.
SELECT ls."ID" AS SuspensionID, ls."StartDate", ls."EndDate", ls."Reason", c."Name" AS CompanyName
FROM public."LicenseSuspensions" ls
JOIN public."LicenseApplication" la ON ls."Application" = la."ID"
JOIN public."Companies" c ON la."CompanyID" = c."ID"
ORDER BY ls."StartDate";

-- 15. Calculate the running total of payments for each company.
-- This query uses a window function to calculate the running total of payments for each company.
SELECT c."Name" AS CompanyName, p."PaymentDate", p."Price", 
       SUM(p."Price") OVER (PARTITION BY c."ID" ORDER BY p."PaymentDate") AS RunningTotal
FROM public."Companies" c
JOIN public."Invoices" i ON c."ID" = i."CompanyID"
JOIN public."Payments" p ON i."ID" = p."InvoiceID"
ORDER BY c."Name", p."PaymentDate";
