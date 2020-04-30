create table employee_audit(id int(11) not null primary key auto_increment ,employeeNumber int(11) not null,lastname varchar(50) not null,changedat datetime,action varchar(50));
create 
	trigger track_update before update
	on employees
	for each row begin
		insert into employee_audit(employeeNumber,lastname,changedat,action) values (new.employeenumber,new.lastname,current_timestamp,"update");
	end$$

UPDATE employees SET lastName = 'Patterson' WHERE employeeNumber =
1056;


create table customer_audit(id int(11) not null primary key auto_increment,customerID int(11) not null,user_name varchar(50) not null,ContactName varchar(100) not null,changedat datetime,action varchar(50)) 

create
	trigger track_delete after delete
	on Customers
	for each row begin
		insert into customer_audit(customerID,contactName,changedat,action,user_name) values (old.customerID,old.contactname,current_timestamp,"delete",current_user);
		end$$

DELETE from Customers where CustomerID=1;