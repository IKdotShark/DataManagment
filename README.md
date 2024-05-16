# DataManagment
Place where you can see labs for Data managment using PostgreSQL

Таблица Companies:
- CompanyID (Primary Key, INT): Уникальный идентификатор компании.
- CompanyName (VARCHAR): Название компании.
- LegalAddress (VARCHAR): Юридический адрес компании.
- ContactInfo (VARCHAR): Контактная информация компании.

Таблица Employees:
- EmployeeID (Primary Key, INT): Уникальный идентификатор сотрудника.
- FirstName (VARCHAR): Имя сотрудника.
- LastName (VARCHAR): Фамилия сотрудника.
- Position (VARCHAR): Должность сотрудника.
- ContactInfo (VARCHAR): Контактная информация сотрудника.

Таблица Licenses:
- LicenseID (Primary Key, INT): Уникальный идентификатор лицензии.
- LicenseType (VARCHAR): Тип лицензии.
- LicenseNumber (VARCHAR): Номер лицензии.
- IssueDate (DATE): Дата выдачи лицензии.
- ExpiryDate (DATE): Дата окончания срока действия лицензии.
- Status (VARCHAR): Текущий статус лицензии.

Таблица LicenseTypes:
- LicenseTypeID (Primary Key, INT): Уникальный идентификатор типа лицензии.
- TypeName (VARCHAR): Название типа лицензии.
- Description (TEXT): Описание типа лицензии.

Таблица LicenseStatus:
- StatusID (Primary Key, INT): Уникальный идентификатор статуса.
- StatusName (VARCHAR): Название статуса.

Таблица Departments:
- DepartmentID (Primary Key, INT): Уникальный идентификатор отдела.
- DepartmentName (VARCHAR): Название отдела.

Таблица LicenseApplications:
- ApplicationID (Primary Key, INT): Уникальный идентификатор заявки.
- CompanyID (Foreign Key, INT): Идентификатор компании, подающей заявку.
- EmployeeID (Foreign Key, INT): Идентификатор сотрудника, подающего заявку.
- ApplicationDate (DATE): Дата подачи заявки.
- Status (VARCHAR): Текущий статус заявки.

Таблица ApplicationStatus:
- StatusID (Primary Key, INT): Уникальный идентификатор статуса.
- StatusName (VARCHAR): Название статуса.
  
Таблица ProductCategories:
- CategoryID (Primary Key, INT): Уникальный идентификатор категории.
- CategoryName (VARCHAR): Название категории.

Таблица Products:
- ProductID (Primary Key, INT): Уникальный идентификатор продукта.
- ProductName (VARCHAR): Название продукта.
- Description (TEXT): Описание продукта.
- CategoryID (Foreign Key, INT): Идентификатор категории продукта.

Таблица Invoices:
- InvoiceID (Primary Key, INT): Уникальный идентификатор счета.
- CompanyID (Foreign Key, INT): Идентификатор компании, которой выставлен счет.
- Amount (DECIMAL): Сумма счета.
- IssueDate (DATE): Дата выставления счета.
- Status (VARCHAR): Текущий статус счета.

Таблица InvoiceStatus:
- StatusID (Primary Key, INT): Уникальный идентификатор статуса.
- StatusName (VARCHAR): Название статуса.

Таблица Payments:
- PaymentID (Primary Key, INT): Уникальный идентификатор платежа.
- InvoiceID (Foreign Key, INT): Идентификатор счета, по которому произведен платеж.
- AmountPaid (DECIMAL): Сумма произведенного платежа.
- PaymentDate (DATE): Дата платежа.

Таблица PriceList:
- PriceID (Primary Key, INT): Уникальный идентификатор цены.
- Price (DECIMAL): Цена продукта.

Таблица LicenseRenewals:
- RenewalID (Primary Key, INT): Уникальный идентификатор продления.
- ApplicationDate (DATE): Дата подачи заявки на продление.
- RenewalDate (DATE): Дата продления лицензии.
- Notes (TEXT): Примечания по продлению.
- LicenseID (Foreign Key, INT): Идентификатор лицензии, которая продлевается.

Таблица LicenseRevocations:
- RevocationID (Primary Key, INT): Уникальный идентификатор аннулирования.
- RevocationDate (DATE): Дата аннулирования.
- Reason (TEXT): Причина аннулирования.
- Notes (TEXT): Примечания по аннулированию.
- LicenseID (Foreign Key, INT): Идентификатор аннулированной лицензии.

Таблица LicenseViolations:
- ViolationID (Primary Key, INT): Уникальный идентификатор нарушения.
- ViolationDate (DATE): Дата нарушения.
- Description (TEXT): Описание нарушения.
- Status (VARCHAR): Текущий статус нарушения.
- Notes (TEXT): Примечания по нарушению.
- LicenseID (Foreign Key, INT): Идентификатор лицензии, по которой зафиксировано нарушение.

Таблица ViolationStatus:
- StatusID (Primary Key, INT): Уникальный идентификатор статуса.
- StatusName (VARCHAR): Название статуса.

Таблица LicenseSuspensions:
- SuspensionID (Primary Key, INT): Уникальный идентификатор приостановления.
- StartDate (DATE): Дата начала приостановления.
- EndDate (DATE): Дата окончания приостановления.
- Reason (TEXT): Причина приостановления.
- Notes (TEXT): Примечания по приостановлению.
- LicenseID (Foreign Key, INT): Идентификатор приостановленной лицензии.

Таблица LicenseRegions:
- RegionID (Primary Key, INT): Уникальный идентификатор региона.
- RegionName (VARCHAR): Название региона.
- Description (TEXT): Описание региона.
