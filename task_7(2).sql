--Create a table named "Employees" with columns for ID (integer), Name (varchar), and Salary (decimal).
create schema sales_new;
go
create table Employees(
id int ,
name varchar(50),
salary decimal
)
--Add a new column named "Department" to the "Employees" table with data type varchar(50).
alter table Employees
add Department varchar(50)

--Remove the "Salary" column from the "Employees" table.
alter table Employees
drop column salary
--Rename the "Department" column in the "Employees" table to "DeptName".
exec sp_rename 'Employees.Department','DeptName','column'
--Create a new table called "Projects" with columns for ProjectID (integer) and ProjectName (varchar).
create table Projects(
ProjectID int,
ProjectName varchar(50)
)
--Add a primary key constraint to the "Employees" table for the "ID" column.
alter table Employees
alter column id int NOT NULL;
alter table Employees
add constraint  primarykey_Employees primary key (id);
--Add a unique constraint to the "Name" column in the "Employees" table.
alter table Employees
add constraint unique_Name unique (Name);
--Create a table named "Customers" with columns for CustomerID (integer), FirstName (varchar), LastName (varchar), and Email (varchar), and Status (varchar).
create table Customers_new(
CustomerID int,
FirstName varchar(40),
LastName varchar(40),
Email varchar(40),
Status varchar
)
--Add a unique constraint to the combination of "FirstName" and "LastName" columns in the "Customers" table.
alter table Customers_new
add constraint unique_fullName unique (FirstName,LastName);
--Create a table named "Orders" with columns for OrderID (integer), CustomerID (integer), OrderDate (datetime), and TotalAmount (decimal).
create table Orders(
OrderID int,
CustomerID int,
OrderDate datetime2,
TotalAmount decimal
)
--Add a check constraint to the "TotalAmount" column in the "Orders" table to ensure that it is greater than zero.
alter table Orders
add constraint ck_TotalAmount check(TotalAmount > 0)
--Create a schema named "Sales" and move the "Orders" table into this schema.

alter schema sales_new transfer dbo.orders

--Rename the "Orders" table to "SalesOrders."
EXEC sp_rename 'sales_new.Orders', 'SalesOrders';
