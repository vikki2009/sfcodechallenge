
-- Creating shutterfly database
create database if not exists `shutterfly`;

-- Creating customer, site_visit, image, orders, week tables

CREATE TABLE IF NOT EXISTS customer (
customer_id varchar(255) NOT NULL,
event_time varchar(255) NOT NULL,
last_name varchar(255),
adr_city varchar(255),
adr_state varchar(255),
PRIMARY KEY (customer_id)
);



CREATE TABLE IF NOT EXISTS site_visit(
visit_id varchar(255),
event_time varchar(255),
customer_id varchar(255),
tags varchar(255)
);


CREATE TABLE IF NOT EXISTS image(
image_id varchar(255) NOT NULL,
event_time varchar(255) NOT NULL,
customer_id varchar(255) NOT NULL,
camera_make varchar(255),
camera_model varchar(255), 
PRIMARY KEY (image_id)
);


CREATE TABLE IF NOT EXISTS orders(
order_id varchar(255) NOT NULL,
event_time varchar(255) NOT NULL,
customer_id varchar(255),
total_amount varchar(255),
PRIMARY KEY (order_id)
);


DROP TABLE week;
CREATE TABLE week(
date1 TIMESTAMP,
date2 TIMESTAMP,
week INT
);

-- inserting data into week table
insert into week values ('2017-01-08 00:00:00.000','2017-01-15 00:00:00.000',1);
insert into week values ('2017-01-15 00:00:00.000','2017-01-22 00:00:00.000',2);
insert into week values ('2017-01-22 00:00:00.000','2017-01-29 00:00:00.000',3);
insert into week values ('2017-01-29 00:00:00.000','2017-02-05 00:00:00.000',4);
insert into week values ('2017-02-05 00:00:00.000','2017-02-12 00:00:00.000',5);
insert into week values ('2017-02-12 00:00:00.000','2017-02-19 00:00:00.000',6);
insert into week values ('2017-02-19 00:00:00.000','2017-02-26 00:00:00.000',7);
insert into week values ('2017-02-26 00:00:00.000','2017-03-05 00:00:00.000',8);
insert into week values ('2017-03-05 00:00:00.000','2017-03-12 00:00:00.000',9);
insert into week values ('2017-03-12 00:00:00.000','2017-03-19 00:00:00.000',10);
insert into week values ('2017-03-19 00:00:00.000','2017-03-26 00:00:00.000',11);
insert into week values ('2017-03-26 00:00:00.000','2017-04-02 00:00:00.000',12);
insert into week values ('2017-04-02 00:00:00.000','2017-04-09 00:00:00.000',13);
insert into week values ('2017-04-09 00:00:00.000','2017-04-16 00:00:00.000',14);
insert into week values ('2017-04-16 00:00:00.000','2017-04-23 00:00:00.000',15);
insert into week values ('2017-04-23 00:00:00.000','2017-04-30 00:00:00.000',16);
insert into week values ('2017-04-30 00:00:00.000','2017-05-07 00:00:00.000',17);
insert into week values ('2017-05-07 00:00:00.000','2017-05-14 00:00:00.000',18);
insert into week values ('2017-05-14 00:00:00.000','2017-05-21 00:00:00.000',19);
insert into week values ('2017-05-21 00:00:00.000','2017-05-28 00:00:00.000',20);
insert into week values ('2017-05-28 00:00:00.000','2017-06-04 00:00:00.000',21);
insert into week values ('2017-06-04 00:00:00.000','2017-06-11 00:00:00.000',22);
insert into week values ('2017-06-11 00:00:00.000','2017-06-18 00:00:00.000',23);
insert into week values ('2017-06-18 00:00:00.000','2017-06-25 00:00:00.000',24);
insert into week values ('2017-06-25 00:00:00.000','2017-07-02 00:00:00.000',25);
insert into week values ('2017-07-02 00:00:00.000','2017-07-09 00:00:00.000',26);
insert into week values ('2017-07-09 00:00:00.000','2017-07-16 00:00:00.000',27);
insert into week values ('2017-07-16 00:00:00.000','2017-07-23 00:00:00.000',28);
insert into week values ('2017-07-23 00:00:00.000','2017-07-30 00:00:00.000',29);
insert into week values ('2017-07-30 00:00:00.000','2017-08-06 00:00:00.000',30);
insert into week values ('2017-08-06 00:00:00.000','2017-08-13 00:00:00.000',31);
insert into week values ('2017-08-13 00:00:00.000','2017-08-20 00:00:00.000',32);
insert into week values ('2017-08-20 00:00:00.000','2017-08-27 00:00:00.000',33);
insert into week values ('2017-08-27 00:00:00.000','2017-09-03 00:00:00.000',34);
insert into week values ('2017-09-03 00:00:00.000','2017-09-10 00:00:00.000',35);
insert into week values ('2017-09-10 00:00:00.000','2017-09-17 00:00:00.000',36);
insert into week values ('2017-09-17 00:00:00.000','2017-09-24 00:00:00.000',37);
insert into week values ('2017-09-24 00:00:00.000','2017-10-01 00:00:00.000',38);
insert into week values ('2017-10-01 00:00:00.000','2017-10-08 00:00:00.000',39);
insert into week values ('2017-10-08 00:00:00.000','2017-10-15 00:00:00.000',40);
insert into week values ('2017-10-15 00:00:00.000','2017-10-22 00:00:00.000',41);
insert into week values ('2017-10-22 00:00:00.000','2017-10-29 00:00:00.000',42);
insert into week values ('2017-10-29 00:00:00.000','2017-11-05 00:00:00.000',43);
insert into week values ('2017-11-05 00:00:00.000','2017-11-12 00:00:00.000',44);
insert into week values ('2017-11-12 00:00:00.000','2017-11-19 00:00:00.000',45);
insert into week values ('2017-11-19 00:00:00.000','2017-11-26 00:00:00.000',46);
insert into week values ('2017-11-26 00:00:00.000','2017-12-03 00:00:00.000',47);
insert into week values ('2017-12-03 00:00:00.000','2017-12-10 00:00:00.000',48);
insert into week values ('2017-12-10 00:00:00.000','2017-12-17 00:00:00.000',49);
insert into week values ('2017-12-17 00:00:00.000','2017-12-24 00:00:00.000',50);
insert into week values ('2017-12-24 00:00:00.000','2017-12-31 00:00:00.000',51);


-- creating views for LTV calculation

CREATE VIEW `customer_aquisition_week` AS
select 
				a.customer_id,
				b.week,sum(cast(SUBSTRING_INDEX(SUBSTRING_INDEX(a.total_amount, ' ', 1), ' ', -1) AS DECIMAL(4,2)))/count(distinct(b.week))  AS amount 
				from 
				orders a, 
				week b 
				where (b.date1<=STR_TO_DATE(a.event_time,'%Y-%m-%d %H:%i:%s') 
				and STR_TO_DATE(a.event_time,'%Y-%m-%d %H:%i:%s')<=b.date2) 
			group by a.customer_id,b.week;
            
            
            
CREATE VIEW `customer_site_visit` AS          
            select 
				a.customer_id,
				b.week,count(*)/count(distinct(b.week)) visits 
			from site_visit a, 
			week b 
			where (b.date1<=STR_TO_DATE(a.event_time,'%Y-%m-%d %H:%i:%s') 
			and STR_TO_DATE(a.event_time,'%Y-%m-%d %H:%i:%s')<=b.date2) 
			group by a.customer_id,b.week 
			order by a.customer_id       ;     
            
            
CREATE VIEW `customer_LTV` AS
select 
	d.last_name,
	d.adr_city,
	d.adr_state,
	d.customer_id,
	c.LTV
	from
(
	select 
			a.customer_id, 
			a.week,
			a.amount,
			b.visits,
			52*a.amount*b.visits*10 as LTV  #borrowed this logic from a forum on internet.
			from customer_aquisition_week a, customer_site_visit b 
	where a.customer_id = b.customer_id
	and a.week = b.week
) c, customer d
where c.customer_id = d.customer_id
order by c.LTV desc  ;          
