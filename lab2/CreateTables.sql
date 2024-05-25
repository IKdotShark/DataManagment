BEGIN;

CREATE TABLE IF NOT EXISTS public."Companies"
(
    "ID" bigint NOT NULL,
    "Name" character varying(255) NOT NULL,
    "Address" character varying(255) NOT NULL,
    "ContactInfo" character varying NOT NULL,
    PRIMARY KEY ("ID")
);

CREATE TABLE IF NOT EXISTS public."Employees"
(
    "ID" bigint NOT NULL,
    "DepartmentID" bigint NOT NULL,
    "NameAndSurname" character varying(255) NOT NULL,
    "Position" character varying(255) NOT NULL,
    "ContactInfo" character varying NOT NULL,
    PRIMARY KEY ("ID")
);

CREATE TABLE IF NOT EXISTS public."Licenses"
(
    "ID" bigint NOT NULL,
    "ProductCategoryID" bigint NOT NULL,
    "ApplicationID" bigint NOT NULL,
    "LisenseTypeID" bigint NOT NULL,
    "CompanyID" bigint NOT NULL,
    "StatusID" bigint NOT NULL,
    "RegionsID" bigint NOT NULL,
    "LicenseNumber" bigint NOT NULL,
    "IssueDate" date NOT NULL,
    "ExpiryDate" date NOT NULL,
    PRIMARY KEY ("ID")
);

CREATE TABLE IF NOT EXISTS public."LicenseStatus"
(
    "ID" bigint NOT NULL,
    "Name" character varying(64) NOT NULL,
    PRIMARY KEY ("ID")
);

CREATE TABLE IF NOT EXISTS public."LicenseType"
(
    "ID" bigint NOT NULL,
    "TypeName" character varying(255) NOT NULL,
    "Description" text NOT NULL,
    PRIMARY KEY ("ID")
);

CREATE TABLE IF NOT EXISTS public."Departments"
(
    "ID" bigint NOT NULL,
    "Name" character varying(256) NOT NULL,
    PRIMARY KEY ("ID")
);

CREATE TABLE IF NOT EXISTS public."LicenseApplication"
(
    "ID" bigint NOT NULL,
    "CompanyID" bigint NOT NULL,
    "EmployeeID" bigint NOT NULL,
    "Date" date NOT NULL,
    "Status" bigint NOT NULL,
    PRIMARY KEY ("ID")
);

CREATE TABLE IF NOT EXISTS public."ApplicationStatus"
(
    "ID" bigint NOT NULL,
    "Name" character varying(63) NOT NULL,
    PRIMARY KEY ("ID")
);

CREATE TABLE IF NOT EXISTS public."Products"
(
    "ID" bigint NOT NULL,
    "CategoryID" bigint NOT NULL,
    "Name" character varying[] NOT NULL,
    "Description" text NOT NULL,
    PRIMARY KEY ("ID")
);

CREATE TABLE IF NOT EXISTS public."ProductCategories"
(
    "ID" bigint NOT NULL,
    "Name" character varying(255) NOT NULL,
    PRIMARY KEY ("ID")
);

CREATE TABLE IF NOT EXISTS public."Invoices"
(
    "ID" bigint NOT NULL,
    "CompanyID" bigint NOT NULL,
    "PaidAmount" double precision NOT NULL,
    "IssueDate" date NOT NULL,
    "StatusID" bigint NOT NULL,
    PRIMARY KEY ("ID")
);

CREATE TABLE IF NOT EXISTS public."InvoicesStatus"
(
    "ID" bigint NOT NULL,
    "Name" character varying(63) NOT NULL,
    PRIMARY KEY ("ID")
);

CREATE TABLE IF NOT EXISTS public."Payments"
(
    "ID" bigint NOT NULL,
    "InvoiceID" bigint NOT NULL,
    "PaymentDate" date NOT NULL,
    "Price" double precision NOT NULL,
    PRIMARY KEY ("ID")
);

CREATE TABLE IF NOT EXISTS public."LicenseRenewals"
(
    "ID" bigint NOT NULL,
    "ApplicationID" bigint NOT NULL,
    "ApplicationDate" date NOT NULL,
    "RenewalDate" date NOT NULL,
    "Notes" text,
    PRIMARY KEY ("ID")
);

CREATE TABLE IF NOT EXISTS public."LicenseRevocation"
(
    "ID" bigint NOT NULL,
    "ApplicationID" bigint NOT NULL,
    "RevocationDate" date NOT NULL,
    "Reason" text NOT NULL,
    "Notes" text,
    PRIMARY KEY ("ID")
);

CREATE TABLE IF NOT EXISTS public."LicenseViolations"
(
    "ID" bigint NOT NULL,
    "ApplicationID" bigint NOT NULL,
    "Status" bigint NOT NULL,
    "Description" text NOT NULL,
    "Notes" text,
    PRIMARY KEY ("ID")
);

CREATE TABLE IF NOT EXISTS public."ViolationStatus"
(
    "ID" bigint NOT NULL,
    "Name" character varying NOT NULL,
    PRIMARY KEY ("ID")
);

CREATE TABLE IF NOT EXISTS public."LicenseSuspensions"
(
    "ID" bigint NOT NULL,
    "Application" bigint NOT NULL,
    "StartDate" date NOT NULL,
    "EndDate" date NOT NULL,
    "Reason" character varying(255) NOT NULL,
    "Notes" text,
    PRIMARY KEY ("ID")
);

CREATE TABLE IF NOT EXISTS public."LicenseRegions"
(
    "ID" bigint NOT NULL,
    "Name" character varying(255) NOT NULL,
    "Description" text NOT NULL,
    PRIMARY KEY ("ID")
);

CREATE TABLE IF NOT EXISTS public."PriceList"
(
    "ID" bigint NOT NULL,
    "Summ" double precision NOT NULL,
    PRIMARY KEY ("ID")
);

ALTER TABLE IF EXISTS public."Employees"
    ADD CONSTRAINT "Departments" FOREIGN KEY ("DepartmentID")
    REFERENCES public."Departments" ("ID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS public."Licenses"
    ADD CONSTRAINT "Status" FOREIGN KEY ("StatusID")
    REFERENCES public."LicenseStatus" ("ID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS public."Licenses"
    ADD CONSTRAINT "LicenseType" FOREIGN KEY ("LisenseTypeID")
    REFERENCES public."LicenseType" ("ID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS public."Licenses"
    ADD CONSTRAINT "Company" FOREIGN KEY ("CompanyID")
    REFERENCES public."Companies" ("ID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS public."Licenses"
    ADD CONSTRAINT "LicenseApplication" FOREIGN KEY ("ApplicationID")
    REFERENCES public."LicenseApplication" ("ID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS public."Licenses"
    ADD CONSTRAINT "ProductCategories" FOREIGN KEY ("ProductCategoryID")
    REFERENCES public."ProductCategories" ("ID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS public."Licenses"
    ADD CONSTRAINT "Region" FOREIGN KEY ("RegionsID")
    REFERENCES public."LicenseRegions" ("ID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS public."LicenseApplication"
    ADD CONSTRAINT "ApplicationStatus" FOREIGN KEY ("Status")
    REFERENCES public."ApplicationStatus" ("ID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS public."LicenseApplication"
    ADD CONSTRAINT "Companies" FOREIGN KEY ("CompanyID")
    REFERENCES public."Companies" ("ID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS public."LicenseApplication"
    ADD CONSTRAINT "Employees" FOREIGN KEY ("EmployeeID")
    REFERENCES public."Employees" ("ID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS public."Products"
    ADD CONSTRAINT "ProductCategories" FOREIGN KEY ("CategoryID")
    REFERENCES public."ProductCategories" ("ID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS public."Invoices"
    ADD CONSTRAINT "Invoices" FOREIGN KEY ("StatusID")
    REFERENCES public."InvoicesStatus" ("ID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS public."Invoices"
    ADD CONSTRAINT "Companies" FOREIGN KEY ("CompanyID")
    REFERENCES public."Companies" ("ID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS public."Payments"
    ADD CONSTRAINT "Invoices" FOREIGN KEY ("InvoiceID")
    REFERENCES public."Invoices" ("ID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

-- Удаление неправильного внешнего ключа на "PriceID"
-- ALTER TABLE IF EXISTS public."Payments"
--     ADD CONSTRAINT "Price" FOREIGN KEY ("PriceID")
--     REFERENCES public."PriceList" ("ID") MATCH SIMPLE
--     ON UPDATE NO ACTION
--     ON DELETE NO ACTION
--     NOT VALID;

ALTER TABLE IF EXISTS public."LicenseRenewals"
    ADD CONSTRAINT "Application" FOREIGN KEY ("ApplicationID")
    REFERENCES public."LicenseApplication" ("ID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS public."LicenseRevocation"
    ADD CONSTRAINT "Application" FOREIGN KEY ("ApplicationID")
    REFERENCES public."LicenseApplication" ("ID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS public."LicenseViolations"
    ADD CONSTRAINT "Application" FOREIGN KEY ("ApplicationID")
    REFERENCES public."LicenseApplication" ("ID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS public."LicenseViolations"
    ADD CONSTRAINT "Status" FOREIGN KEY ("Status")
    REFERENCES public."ViolationStatus" ("ID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS public."LicenseSuspensions"
    ADD CONSTRAINT "Application" FOREIGN KEY ("Application")
    REFERENCES public."LicenseApplication" ("ID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;