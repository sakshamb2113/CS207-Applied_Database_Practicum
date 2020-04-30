source /home/saksham/Downloads/Assignment 4 CS207/join.sql;


select orders.ordernumber,orders.customernumber,sum(orderdetails.quantityOrdered) from orders inner join orderdetails on orderdetails.orderNumber=orders.orderNumber group by orders.orderNumber order by customernumber;

select customers.customername from customers left join orders on orders.customernumber=customers.customernumber where orders.ordernumber is null;

select employees.firstname,employees.lastname,count(customers.customername) from employees left join customers on employees.employeenumber=customers.salesRepEmployeeNumber group by employees.lastName,employees.firstName order by count(customers.customername) desc;

select customers.customername,products.productname from customers inner join orders on customers.customernumber=orders.customernumber inner join orderdetails on orders.ordernumber=orderdetails.ordernumber inner join products on products.productcode=orderdetails.productcode where customers.customername="Muscle Machine Inc";

select products.productname,count(products.productname) from customers inner join orders on customers.customernumber=orders.customernumber inner join orderdetails on orders.ordernumber=orderdetails.ordernumber inner join products on products.productcode=orderdetails.productcode group by products.productname;

select products.productname,customers.customername from customers inner join orders on customers.customernumber=orders.customernumber inner join orderdetails on orders.ordernumber=orderdetails.ordernumber inner join products on products.productcode=orderdetails.productcode where customers.customername is null group by products.productname;


source /home/saksham/Downloads/Assignment 4 CS207/assignment4.sql;

select exam,avg(mark) from student_mark group by exam;

select student_id,exam,max(mark) from student_mark group by student_id order by student_id;

select substring(exam_dt,6,2),student_id,max(mark) from student_mark group by substring(exam_dt,6,2) order by substring(exam_dt,6,2);

select substring(exam_dt,6,2),student_id,avg(mark) from student_mark group by substring(exam_dt,6,2) order by substring(exam_dt,6,2);


create table number(rnumber float);

delimiter$$
create procedure insert_rno(in n int)
begin
declare i int default 0;
myloop:loop
set i=i+1;
insert into number(rnumber) values (FLOOR(RAND()*(1000-1+1)+1));
if i=n then
leave myloop;
end if;
end loop myloop;
end$$
delimiter ;

delimiter $$
create procedure sum_even(in x int)
	begin
	declare s int default 0;
	declare i int default 0;
	myloop:loop
	set i=i+1;
	if i%2=0 then
	set s=s+i;
	end if;
	if i=x then
	leave myloop;
	end if;
	end loop myloop;
	select s;
	end$$

delimiter ;


create table customer_quantity_copy(customerName varchar(255),quantity int(11));



create procedure copy_elements()
begin
insert into customer_quantity_copy(customerName,quantity)
	select customers.customername,count(orders.ordernumber) from customers left join orders on customers.customernumber=orders.customernumber group by customers.customername;
end
$$


create table temp(customerName int(11),Value varchar(255));

create procedure Activity5()
begin
declare @cnumber int;
declare @climit int;
declare @amount int;
declare @v_finished int default 0;
declare customercursor cursor for select customers.customernumber,customers.creditLimit from customers left join payments on customers.customernumber=payments.customernumber group by customers.customernumber;
declare paymentcursor cursor for select payments.customerNumber,sum(payments.amount) from customers left join payments on customers.customernumber=payments.customernumber group by payments.customerNumber;
open customercursor
myloop:loop
fetch customercursor into cnumber,climit;
if v_finished =1 then leave myloop;
end if;
set total = (select sum(amount) from payments where customernumber = cnumber);
if total 
end loop;

