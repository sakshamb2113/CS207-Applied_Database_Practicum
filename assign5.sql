source /home/saksham/Downloads/Compressed/Assignment 5 CS207/trigger.sql;

use assignment5;

delimiter $$
create 
	trigger insert_check before insert
	on tasks
	for each row begin
		set new.firstname=trim(new.firstname);
		set new.lastname=trim(new.lastname);
		set new.jobid=upper(new.jobid);
	end$$

delimiter ;

insert into tasks values (9,'Andre ',' Igoudla ','sf','AI@gmail.com',900000.00,0.02);

select * from tasks limit 10; 

delimiter $$
create
	trigger insert_add before update
	on task3
	for each row begin
	set new.total = new.sub1+new.sub2+new.sub3+new.sub4+new.sub5;
	set new.per_marks = new.total/5; 
	if new.per_marks>=90 
	then
	set new.grade="EXCELLENT";
	else if new.per_marks>=75
	then
	set new.grade="VERY GOOD"; 
	else if new.per_marks>=60
	then
	set new.grade="GOOD";
	else if new.per_marks>=40 
	then
	set new.grade="AVERAGE";
	else 
	set new.grade="NOT PROMOTED";
	end if;
	end if;
	end if;
	end if;
	end$$

 delimiter ;

 update task3 set sub1=54 , sub2=69 , sub3=89 , sub4=87 , sub5=59 where student_id=1 ;

 select * from task3 limit 10;