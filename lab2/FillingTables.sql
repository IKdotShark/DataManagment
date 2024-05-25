BEGIN;

-- Заполнение таблицы Companies
INSERT INTO public."Companies" ("ID", "Name", "Address", "ContactInfo") VALUES
(1, 'TechCorp', '1234 Elm St', 'contact@techcorp.com'),
(2, 'HealthPlus', '5678 Oak St', 'info@healthplus.com'),
(3, 'EduWorld', '910 Maple St', 'support@eduworld.com'),
(4, 'FinSolutions', '1111 Pine St', 'contact@finsolutions.com'),
(5, 'EcoLife', '2222 Cedar St', 'info@ecolife.com'),
(6, 'MedHealth', '3333 Birch St', 'support@medhealth.com'),
(7, 'AutoDrive', '4444 Spruce St', 'contact@autodrive.com'),
(8, 'HomeSafe', '5555 Fir St', 'info@homesafe.com'),
(9, 'Foodies', '6666 Willow St', 'support@foodies.com'),
(10, 'GameZone', '7777 Poplar St', 'contact@gamezone.com');

-- Заполнение таблицы Departments
INSERT INTO public."Departments" ("ID", "Name") VALUES
(1, 'Engineering'),
(2, 'Human Resources'),
(3, 'Sales'),
(4, 'Marketing'),
(5, 'Finance'),
(6, 'Research and Development'),
(7, 'Customer Support'),
(8, 'Legal'),
(9, 'IT'),
(10, 'Administration');

-- Заполнение таблицы Employees
INSERT INTO public."Employees" ("ID", "DepartmentID", "NameAndSurname", "Position", "ContactInfo") VALUES
(1, 1, 'John Doe', 'Software Engineer', 'john.doe@techcorp.com'),
(2, 2, 'Jane Smith', 'HR Manager', 'jane.smith@techcorp.com'),
(3, 3, 'Robert Brown', 'Sales Executive', 'robert.brown@healthplus.com'),
(4, 4, 'Emily Davis', 'Marketing Specialist', 'emily.davis@eduworld.com'),
(5, 5, 'Michael Johnson', 'Financial Analyst', 'michael.johnson@finsolutions.com'),
(6, 6, 'Linda White', 'R&D Scientist', 'linda.white@ecolife.com'),
(7, 7, 'David Wilson', 'Customer Support Rep', 'david.wilson@medhealth.com'),
(8, 8, 'Barbara Jones', 'Legal Advisor', 'barbara.jones@autodrive.com'),
(9, 9, 'James Miller', 'IT Specialist', 'james.miller@homesafe.com'),
(10, 10, 'Patricia Taylor', 'Admin Assistant', 'patricia.taylor@foodies.com');

-- Заполнение таблицы LicenseStatus
INSERT INTO public."LicenseStatus" ("ID", "Name") VALUES
(1, 'Active'),
(2, 'Expired'),
(3, 'Revoked'),
(4, 'Pending'),
(5, 'Approved'),
(6, 'Rejected'),
(7, 'Suspended'),
(8, 'Cancelled'),
(9, 'Under Review'),
(10, 'Renewed');

-- Заполнение таблицы LicenseType
INSERT INTO public."LicenseType" ("ID", "TypeName", "Description") VALUES
(1, 'Commercial', 'For commercial use'),
(2, 'Non-commercial', 'For non-commercial use'),
(3, 'Government', 'For government use'),
(4, 'Education', 'For educational purposes'),
(5, 'Healthcare', 'For healthcare providers'),
(6, 'Automotive', 'For automotive industry'),
(7, 'Construction', 'For construction industry'),
(8, 'Finance', 'For financial services'),
(9, 'Retail', 'For retail businesses'),
(10, 'Technology', 'For tech companies');

-- Заполнение таблицы ProductCategories
INSERT INTO public."ProductCategories" ("ID", "Name") VALUES
(1, 'Software'),
(2, 'Hardware'),
(3, 'Service'),
(4, 'Medical Equipment'),
(5, 'Vehicles'),
(6, 'Home Appliances'),
(7, 'Food Products'),
(8, 'Gaming'),
(9, 'Financial Services'),
(10, 'Educational Tools');

-- Заполнение таблицы Products
INSERT INTO public."Products" ("ID", "CategoryID", "Name", "Description") VALUES
(1, 1, ARRAY['Office Suite'], 'Office productivity software'),
(2, 2, ARRAY['Server'], 'High performance server'),
(3, 3, ARRAY['Consulting'], 'Business consulting services'),
(4, 4, ARRAY['X-ray Machine'], 'Medical imaging equipment'),
(5, 5, ARRAY['Electric Car'], 'Environmentally friendly vehicle'),
(6, 6, ARRAY['Refrigerator'], 'Energy-efficient refrigerator'),
(7, 7, ARRAY['Organic Snacks'], 'Healthy and organic food products'),
(8, 8, ARRAY['Video Game Console'], 'Next-gen gaming console'),
(9, 9, ARRAY['Investment Plan'], 'Comprehensive investment services'),
(10, 10, ARRAY['Online Course'], 'E-learning platform');

-- Заполнение таблицы LicenseRegions
INSERT INTO public."LicenseRegions" ("ID", "Name", "Description") VALUES
(1, 'North America', 'Includes USA, Canada, Mexico'),
(2, 'Europe', 'Includes all European countries'),
(3, 'Asia', 'Includes all Asian countries'),
(4, 'South America', 'Includes all South American countries'),
(5, 'Africa', 'Includes all African countries'),
(6, 'Australia', 'Includes Australia and New Zealand'),
(7, 'Middle East', 'Includes countries in the Middle East'),
(8, 'Central America', 'Includes Central American countries'),
(9, 'Caribbean', 'Includes Caribbean islands'),
(10, 'Antarctica', 'Includes research stations in Antarctica');

-- Заполнение таблицы ApplicationStatus
INSERT INTO public."ApplicationStatus" ("ID", "Name") VALUES
(1, 'Pending'),
(2, 'Approved'),
(3, 'Rejected'),
(4, 'In Progress'),
(5, 'Completed'),
(6, 'Under Review'),
(7, 'Suspended'),
(8, 'Cancelled'),
(9, 'Expired'),
(10, 'Renewed');

-- Заполнение таблицы InvoicesStatus
INSERT INTO public."InvoicesStatus" ("ID", "Name") VALUES
(1, 'Unpaid'),
(2, 'Paid'),
(3, 'Overdue'),
(4, 'Pending Payment'),
(5, 'Partially Paid'),
(6, 'Cancelled'),
(7, 'Refunded'),
(8, 'Disputed'),
(9, 'Processing'),
(10, 'Closed');

-- Заполнение таблицы ViolationStatus
INSERT INTO public."ViolationStatus" ("ID", "Name") VALUES
(1, 'Open'),
(2, 'Closed'),
(3, 'Under Investigation'),
(4, 'Resolved'),
(5, 'Pending'),
(6, 'Dismissed'),
(7, 'Verified'),
(8, 'Unverified'),
(9, 'Appealed'),
(10, 'Reopened');

-- Заполнение таблицы LicenseApplication
INSERT INTO public."LicenseApplication" ("ID", "CompanyID", "EmployeeID", "Date", "Status") VALUES
(1, 1, 1, '2024-01-15', 2),
(2, 2, 2, '2024-02-20', 1),
(3, 3, 4, '2024-03-10', 2),
(4, 4, 3, '2024-04-12', 3),
(5, 5, 5, '2024-05-14', 4),
(6, 6, 6, '2024-06-16', 5),
(7, 7, 7, '2024-07-18', 6),
(8, 8, 8, '2024-08-20', 7),
(9, 9, 9, '2024-09-22', 8),
(10, 10, 10, '2024-10-24', 9);

-- Заполнение таблицы Licenses
INSERT INTO public."Licenses" ("ID", "ProductCategoryID", "ApplicationID", "LisenseTypeID", "CompanyID", "StatusID", "RegionsID", "LicenseNumber", "IssueDate", "ExpiryDate") VALUES
(1, 1, 1, 1, 1, 1, 1, 10001, '2024-01-20', '2025-01-20'),
(2, 2, 2, 2, 2, 2, 2, 10002, '2024-02-25', '2025-02-25'),
(3, 3, 3, 1, 3, 1, 3, 10003, '2024-03-15', '2025-03-15'),
(4, 4, 4, 3, 4, 3, 4, 10004, '2024-04-20', '2025-04-20'),
(5, 5, 5, 4, 5, 4, 5, 10005, '2024-05-25', '2025-05-25'),
(6, 6, 6, 5, 6, 5, 6, 10006, '2024-06-30', '2025-06-30'),
(7, 7, 7, 6, 7, 6, 7, 10007, '2024-07-05', '2025-07-05'),
(8, 8, 8, 7, 8, 7, 8, 10008, '2024-08-10', '2025-08-10'),
(9, 9, 9, 8, 9, 8, 9, 10009, '2024-09-15', '2025-09-15'),
(10, 10, 10, 9, 10, 9, 10, 10010, '2024-10-20', '2025-10-20');

-- Заполнение таблицы Invoices
INSERT INTO public."Invoices" ("ID", "CompanyID", "PaidAmount", "IssueDate", "StatusID") VALUES
(1, 1, 5000.00, '2024-03-01', 1),
(2, 2, 7500.00, '2024-03-10', 2),
(3, 3, 3000.00, '2024-03-20', 3),
(4, 4, 1000.00, '2024-04-01', 4),
(5, 5, 2000.00, '2024-04-10', 5),
(6, 6, 4000.00, '2024-04-20', 6),
(7, 7, 6000.00, '2024-05-01', 7),
(8, 8, 7000.00, '2024-05-10', 8),
(9, 9, 8000.00, '2024-05-20', 9),
(10, 10, 9000.00, '2024-06-01', 10);

-- Заполнение таблицы Payments
INSERT INTO public."Payments" ("ID", "InvoiceID", "PaymentDate", "Price") VALUES
(1, 1, '2024-03-05', 5000),
(2, 2, '2024-03-15', 7500),
(3, 3, '2024-03-25', 3000),
(4, 4, '2024-04-05', 1000),
(5, 5, '2024-04-15', 2000),
(6, 6, '2024-04-25', 4000),
(7, 7, '2024-05-05', 6000),
(8, 8, '2024-05-15', 7000),
(9, 9, '2024-05-25', 8000),
(10, 10, '2024-06-05', 9000);

-- Заполнение таблицы LicenseRenewals
INSERT INTO public."LicenseRenewals" ("ID", "ApplicationID", "ApplicationDate", "RenewalDate", "Notes") VALUES
(1, 1, '2025-01-01', '2025-01-20', 'Renewed for another year'),
(2, 2, '2025-02-01', '2025-02-25', 'Renewed for another year'),
(3, 3, '2025-03-01', '2025-03-15', 'Renewed for another year'),
(4, 4, '2025-04-01', '2025-04-20', 'Renewed for another year'),
(5, 5, '2025-05-01', '2025-05-25', 'Renewed for another year'),
(6, 6, '2025-06-01', '2025-06-30', 'Renewed for another year'),
(7, 7, '2025-07-01', '2025-07-05', 'Renewed for another year'),
(8, 8, '2025-08-01', '2025-08-10', 'Renewed for another year'),
(9, 9, '2025-09-01', '2025-09-15', 'Renewed for another year'),
(10, 10, '2025-10-01', '2025-10-20', 'Renewed for another year');

-- Заполнение таблицы LicenseRevocations
INSERT INTO public."LicenseRevocation" ("ID", "ApplicationID", "RevocationDate", "Reason", "Notes") VALUES
(1, 1, '2024-12-31', 'Violation of terms', 'Policy breach'),
(2, 2, '2024-11-30', 'Fraud', 'Fraudulent activity detected'),
(3, 3, '2024-10-31', 'Non-compliance', 'Failure to meet requirements'),
(4, 4, '2024-09-30', 'Breach of contract', 'Contractual violation'),
(5, 5, '2024-08-31', 'Security issue', 'Security breach detected'),
(6, 6, '2024-07-31', 'Operational issue', 'Operational standards not met'),
(7, 7, '2024-06-30', 'Financial issue', 'Failure to pay fees'),
(8, 8, '2024-05-31', 'Regulatory issue', 'Regulatory non-compliance'),
(9, 9, '2024-04-30', 'Legal issue', 'Legal action taken'),
(10, 10, '2024-03-31', 'Ethical issue', 'Ethical violation detected');

-- Заполнение таблицы LicenseViolations
INSERT INTO public."LicenseViolations" ("ID", "ApplicationID", "Status", "Description", "Notes") VALUES
(1, 1, 1, 'Unauthorized use', 'Reported on 2024-11-15'),
(2, 2, 2, 'Data breach', 'Reported on 2024-10-20'),
(3, 3, 3, 'Non-compliance', 'Reported on 2024-09-25'),
(4, 4, 4, 'Financial fraud', 'Reported on 2024-08-30'),
(5, 5, 5, 'Operational issue', 'Reported on 2024-07-05'),
(6, 6, 6, 'Security breach', 'Reported on 2024-06-10'),
(7, 7, 7, 'Breach of contract', 'Reported on 2024-05-15'),
(8, 8, 8, 'Regulatory non-compliance', 'Reported on 2024-04-20'),
(9, 9, 9, 'Legal issue', 'Reported on 2024-03-25'),
(10, 10, 10, 'Ethical violation', 'Reported on 2024-02-28');

-- Заполнение таблицы LicenseSuspensions
INSERT INTO public."LicenseSuspensions" ("ID", "Application", "StartDate", "EndDate", "Reason", "Notes") VALUES
(1, 1, '2024-10-01', '2024-10-15', 'Non-compliance', 'Temporary suspension'),
(2, 2, '2024-09-01', '2024-09-15', 'Pending investigation', 'Under review'),
(3, 3, '2024-08-01', '2024-08-15', 'Security breach', 'Temporary suspension'),
(4, 4, '2024-07-01', '2024-07-15', 'Operational issue', 'Temporary suspension'),
(5, 5, '2024-06-01', '2024-06-15', 'Financial issue', 'Temporary suspension'),
(6, 6, '2024-05-01', '2024-05-15', 'Regulatory issue', 'Temporary suspension'),
(7, 7, '2024-04-01', '2024-04-15', 'Legal issue', 'Temporary suspension'),
(8, 8, '2024-03-01', '2024-03-15', 'Ethical issue', 'Temporary suspension'),
(9, 9, '2024-02-01', '2024-02-15', 'Breach of contract', 'Temporary suspension'),
(10, 10, '2024-01-01', '2024-01-15', 'Operational issue', 'Temporary suspension');

-- Заполнение таблицы PriceList
INSERT INTO public."PriceList" ("ID", "Summ") VALUES
(1, 1000.00),
(2, 2000.00),
(3, 3000.00),
(4, 4000.00),
(5, 5000.00),
(6, 6000.00),
(7, 7000.00),
(8, 8000.00),
(9, 9000.00),
(10, 10000.00);

COMMIT;