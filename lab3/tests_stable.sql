-- 1. Получить все компании вместе с их счетами.
-- Этот запрос объединяет таблицы Companies и Invoices, чтобы отобразить счета каждой компании.
SELECT c."Name" AS CompanyName, i."PaidAmount", i."IssueDate"
FROM public."Companies" c
JOIN public."Invoices" i ON c."ID" = i."CompanyID"
ORDER BY c."Name";

-- 2. Список общей суммы, уплаченной каждой компанией.
-- Этот запрос группирует данные по названию компании и суммирует общую уплаченную сумму.
SELECT c."Name" AS CompanyName, SUM(i."PaidAmount") AS TotalPaid
FROM public."Companies" c
JOIN public."Invoices" i ON c."ID" = i."CompanyID"
GROUP BY c."Name"
ORDER BY TotalPaid DESC;

-- 3. Получить всех сотрудников вместе с названиями их отделов.
-- Этот запрос объединяет таблицы Employees и Departments, чтобы отобразить отдел каждого сотрудника.
SELECT e."NameAndSurname" AS EmployeeName, d."Name" AS DepartmentName
FROM public."Employees" e
JOIN public."Departments" d ON e."DepartmentID" = d."ID"
ORDER BY e."NameAndSurname";

-- 4. Список количества сотрудников в каждом отделе.
-- Этот запрос группирует данные по названию отдела и подсчитывает количество сотрудников.
SELECT d."Name" AS DepartmentName, COUNT(e."ID") AS EmployeeCount
FROM public."Departments" d
LEFT JOIN public."Employees" e ON d."ID" = e."DepartmentID"
GROUP BY d."Name"
ORDER BY EmployeeCount DESC;

-- 5. Получить все лицензии вместе с их статусами.
-- Этот запрос объединяет таблицы Licenses и LicenseStatus, чтобы отобразить статус каждой лицензии.
SELECT l."LicenseNumber", ls."Name" AS StatusName
FROM public."Licenses" l
JOIN public."LicenseStatus" ls ON l."StatusID" = ls."ID"
ORDER BY l."LicenseNumber";

-- 6. Список общего количества лицензий на компанию.
-- Этот запрос группирует данные по названию компании и подсчитывает количество лицензий.
SELECT c."Name" AS CompanyName, COUNT(l."ID") AS LicenseCount
FROM public."Companies" c
JOIN public."Licenses" l ON c."ID" = l."CompanyID"
GROUP BY c."Name"
ORDER BY LicenseCount DESC;

-- 7. Получить все заявки на лицензии вместе с именами соответствующих сотрудников.
-- Этот запрос объединяет таблицы LicenseApplication и Employees, чтобы отобразить каждую заявку с именем сотрудника.
SELECT la."ID" AS ApplicationID, e."NameAndSurname" AS EmployeeName, la."Date"
FROM public."LicenseApplication" la
JOIN public."Employees" e ON la."EmployeeID" = e."ID"
ORDER BY la."Date";

-- 8. Список количества заявок на лицензии по статусу.
-- Этот запрос группирует данные по статусу заявки и подсчитывает количество заявок.
SELECT aps."Name" AS ApplicationStatus, COUNT(la."ID") AS ApplicationCount
FROM public."ApplicationStatus" aps
LEFT JOIN public."LicenseApplication" la ON aps."ID" = la."Status"
GROUP BY aps."Name"
ORDER BY ApplicationCount DESC;

-- 9. Получить все платежи вместе с названиями статусов счетов.
-- Этот запрос объединяет таблицы Payments, Invoices и InvoicesStatus, чтобы отобразить каждый платеж со статусом счета.
SELECT p."ID" AS PaymentID, p."PaymentDate", p."Price", ist."Name" AS InvoiceStatus
FROM public."Payments" p
JOIN public."Invoices" i ON p."InvoiceID" = i."ID"
JOIN public."InvoicesStatus" ist ON i."StatusID" = ist."ID"
ORDER BY p."PaymentDate";

-- 10. Список общей суммы платежей по каждой компании.
-- Этот запрос группирует данные по названию компании и суммирует общую сумму платежей.
SELECT c."Name" AS CompanyName, SUM(p."Price") AS TotalPayment
FROM public."Companies" c
JOIN public."Invoices" i ON c."ID" = i."CompanyID"
JOIN public."Payments" p ON i."ID" = p."InvoiceID"
GROUP BY c."Name"
ORDER BY TotalPayment DESC;

-- 11. Получить все нарушения вместе с их статусами.
-- Этот запрос объединяет таблицы LicenseViolations и ViolationStatus, чтобы отобразить статус каждого нарушения.
SELECT lv."ID" AS ViolationID, lv."Description", vs."Name" AS ViolationStatus
FROM public."LicenseViolations" lv
JOIN public."ViolationStatus" vs ON lv."Status" = vs."ID"
ORDER BY lv."ID";

-- 12. Список количества нарушений по статусу.
-- Этот запрос группирует данные по статусу нарушения и подсчитывает количество нарушений.
SELECT vs."Name" AS ViolationStatus, COUNT(lv."ID") AS ViolationCount
FROM public."ViolationStatus" vs
LEFT JOIN public."LicenseViolations" lv ON vs."ID" = lv."Status"
GROUP BY vs."Name"
ORDER BY ViolationCount DESC;

-- 13. Получить топ-5 самых недавних обновлений лицензий.
-- Этот запрос сортирует таблицу LicenseRenewals по дате обновления, чтобы получить топ-5 последних обновлений.
SELECT lr."ID" AS RenewalID, lr."RenewalDate", lr."Notes"
FROM public."LicenseRenewals" lr
ORDER BY lr."RenewalDate" DESC
LIMIT 5;

-- 14. Список всех приостановлений лицензий вместе с названиями компаний.
-- Этот запрос объединяет таблицы LicenseSuspensions, LicenseApplication и Companies, чтобы отобразить каждое приостановление с названием компании.
SELECT ls."ID" AS SuspensionID, ls."StartDate", ls."EndDate", ls."Reason", c."Name" AS CompanyName
FROM public."LicenseSuspensions" ls
JOIN public."LicenseApplication" la ON ls."Application" = la."ID"
JOIN public."Companies" c ON la."CompanyID" = c."ID"
ORDER BY ls."StartDate";

-- 15. Рассчитать нарастающий итог платежей для каждой компании.
-- Этот запрос использует оконную функцию для расчета нарастающего итога платежей для каждой компании.
SELECT c."Name" AS CompanyName, p."PaymentDate", p."Price", 
       SUM(p."Price") OVER (PARTITION BY c."ID" ORDER BY p."PaymentDate") AS RunningTotal
FROM public."Companies" c
JOIN public."Invoices" i ON c."ID" = i."CompanyID"
JOIN public."Payments" p ON i."ID" = p."InvoiceID"
ORDER BY c."Name", p."PaymentDate";
