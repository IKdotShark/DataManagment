# DataManagment
Place where you can see labs for Data managment using PostgreSQL

# Схема
![BD_lab1.png](BD_lab1.png)

---

# Описание схемы
### Таблица Companies (компании):
- CompanyID (Primary Key, INT): Уникальный идентификатор компании.
- CompanyName (VARCHAR): Название компании.
- LegalAddress (VARCHAR): Юридический адрес компании.
- ContactInfo (VARCHAR): Контактная информация компании.

### Таблица Employees (сотрудники):
- EmployeeID (Primary Key, INT): Уникальный идентификатор сотрудника.
- FirstName (VARCHAR): Имя сотрудника.
- LastName (VARCHAR): Фамилия сотрудника.
- Position (VARCHAR): Должность сотрудника.
- ContactInfo (VARCHAR): Контактная информация сотрудника.

### Таблица Licenses (Лицензии):
- LicenseID (Primary Key, INT): Уникальный идентификатор лицензии.
- LicenseType (VARCHAR): Тип лицензии.
- LicenseNumber (VARCHAR): Номер лицензии.
- IssueDate (DATE): Дата выдачи лицензии.
- ExpiryDate (DATE): Дата окончания срока действия лицензии.
- Status (VARCHAR): Текущий статус лицензии.

### Таблица LicenseTypes (Тип лицензии):
- LicenseTypeID (Primary Key, INT): Уникальный идентификатор типа лицензии.
- TypeName (VARCHAR): Название типа лицензии.
- Description (TEXT): Описание типа лицензии.

### Таблица LicenseStatus (Статус лицензии):
- StatusID (Primary Key, INT): Уникальный идентификатор статуса.
- StatusName (VARCHAR): Название статуса.

### Таблица Departments (Отделы):
- DepartmentID (Primary Key, INT): Уникальный идентификатор отдела.
- DepartmentName (VARCHAR): Название отдела.

### Таблица LicenseApplications (Заявки на лицензию):
- ApplicationID (Primary Key, INT): Уникальный идентификатор заявки.
- CompanyID (Foreign Key, INT): Идентификатор компании, подающей заявку.
- EmployeeID (Foreign Key, INT): Идентификатор сотрудника, подающего заявку.
- ApplicationDate (DATE): Дата подачи заявки.
- Status (VARCHAR): Текущий статус заявки.

### Таблица ApplicationStatus (Статус заявки):
- StatusID (Primary Key, INT): Уникальный идентификатор статуса.
- StatusName (VARCHAR): Название статуса.
  
### Таблица ProductCategories (Категории продуктов):
- CategoryID (Primary Key, INT): Уникальный идентификатор категории.
- CategoryName (VARCHAR): Название категории.

### Таблица Products (Продуктов):
- ProductID (Primary Key, INT): Уникальный идентификатор продукта.
- ProductName (VARCHAR): Название продукта.
- Description (TEXT): Описание продукта.
- CategoryID (Foreign Key, INT): Идентификатор категории продукта.

### Таблица Invoices (Счета, налоги):
- InvoiceID (Primary Key, INT): Уникальный идентификатор счета.
- CompanyID (Foreign Key, INT): Идентификатор компании, которой выставлен счет.
- Amount (DECIMAL): Сумма счета.
- IssueDate (DATE): Дата выставления счета.
- Status (VARCHAR): Текущий статус счета.

### Таблица InvoiceStatus (Статус оплаты счетов, налогов):
- StatusID (Primary Key, INT): Уникальный идентификатор статуса.
- StatusName (VARCHAR): Название статуса.

### Таблица Payments (Платежи):
- PaymentID (Primary Key, INT): Уникальный идентификатор платежа.
- InvoiceID (Foreign Key, INT): Идентификатор счета, по которому произведен платеж.
- AmountPaid (DECIMAL): Сумма произведенного платежа.
- PaymentDate (DATE): Дата платежа.

### Таблица PriceList (Цены на лицензии, стоимость налогов и тд):
- PriceID (Primary Key, INT): Уникальный идентификатор цены.
- Price (DECIMAL): Цена продукта.

### Таблица LicenseRenewals (Продление лицензии):
- RenewalID (Primary Key, INT): Уникальный идентификатор продления.
- ApplicationDate (DATE): Дата подачи заявки на продление.
- RenewalDate (DATE): Дата продления лицензии.
- Notes (TEXT): Примечания по продлению.
- LicenseID (Foreign Key, INT): Идентификатор лицензии, которая продлевается.

### Таблица LicenseRevocations (Отзыв лицензии):
- RevocationID (Primary Key, INT): Уникальный идентификатор аннулирования.
- RevocationDate (DATE): Дата аннулирования.
- Reason (TEXT): Причина аннулирования.
- Notes (TEXT): Примечания по аннулированию.
- LicenseID (Foreign Key, INT): Идентификатор аннулированной лицензии.

### Таблица LicenseViolations (Нарушение лицензии):
- ViolationID (Primary Key, INT): Уникальный идентификатор нарушения.
- ViolationDate (DATE): Дата нарушения.
- Description (TEXT): Описание нарушения.
- Status (VARCHAR): Текущий статус нарушения.
- Notes (TEXT): Примечания по нарушению.
- LicenseID (Foreign Key, INT): Идентификатор лицензии, по которой зафиксировано нарушение.

### Таблица ViolationStatus (Статус нарушения) :
- StatusID (Primary Key, INT): Уникальный идентификатор статуса.
- StatusName (VARCHAR): Название статуса.

### Таблица LicenseRegions (Регион(ы) на котор(ый/ые) распространен(а/ы) лицензия):
- RegionID (Primary Key, INT): Уникальный идентификатор региона.
- RegionName (VARCHAR): Название региона.
- Description (TEXT): Описание региона.

### Таблица LicenseSuspensions (Приостановка действия лицензии):
- SuspensionID (Primary Key, INT): Уникальный идентификатор приостановления.
- StartDate (DATE): Дата начала приостановления.
- EndDate (DATE): Дата окончания приостановления.
- Reason (TEXT): Причина приостановления.
- Notes (TEXT): Примечания по приостановлению.
- LicenseID (Foreign Key, INT): Идентификатор приостановленной лицензии.

# lab2
Находится в директории lab2, файлы:
* CreateTables.sql - создание таблиц
* FillingTables.sql - заполнение данными
* test.sql - простая проверка одной из таблиц на заполненность
* Снимок экрана от 2024-05-25 23-14-36.png - тестирование тест test.sql

# lab3
Находится в директории lab3, файлы:
* Снимок экрана от 2024-05-26 19-53-36.png - тестирование 15 кейса по 3 лабе
* tests_stable.sql - тестирование лабы 3
```sql
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
```
