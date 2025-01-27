create database B_34_dmdw;

use  b_34_dmdw;

create table times (
timeid int auto_increment primary key,
date date,
week numeric(2,0),
month numeric(2,0),
quarter numeric(1,0),
year numeric(4,0),
holiday_flag boolean,
constraint year_range check (year between 2015 and 2020)
);

create table products (
pid int auto_increment primary key,
pname varchar(50),
category enum( 'winter wear' ,'statinary','accessories' ),
price numeric(10,2)
);

create table locations (
locid int auto_increment primary key,
city varchar(50),
state varchar(50),
country varchar(50)
);

create table sales (
pid int ,
timeid int ,
locid int ,
sales int,
foreign key (pid) references products(pid),  
foreign key (timeid) references times(timeid), 
foreign key (locid) references locations(locid)  
);

INSERT INTO times (date, week, month, quarter, year, holiday_flag) VALUES
('2015-01-01', 1, 1, 1, 2015, TRUE),
('2015-02-15', 7, 2, 1, 2015, FALSE),
('2015-03-17', 11, 3, 1, 2015, FALSE),
('2015-04-20', 16, 4, 2, 2015, FALSE),
('2015-05-25', 21, 5, 2, 2015, FALSE),
('2015-06-30', 26, 6, 2, 2015, FALSE),
('2015-07-04', 27, 7, 3, 2015, TRUE),
('2015-08-08', 32, 8, 3, 2015, FALSE),
('2015-09-12', 37, 9, 3, 2015, FALSE),
('2015-10-15', 42, 10, 4, 2015, FALSE),
('2015-11-20', 47, 11, 4, 2015, TRUE),
('2015-12-25', 52, 12, 4, 2015, TRUE),
('2016-01-01', 1, 1, 1, 2016, TRUE),
('2016-02-14', 7, 2, 1, 2016, FALSE),
('2016-03-17', 11, 3, 1, 2016, FALSE),
('2016-04-22', 17, 4, 2, 2016, FALSE),
('2016-05-30', 22, 5, 2, 2016, FALSE),
('2016-07-04', 27, 7, 3, 2016, TRUE),
('2016-11-24', 47, 11, 4, 2016, TRUE),
('2016-12-31', 53, 12, 4, 2016, TRUE);

INSERT INTO products (pname, category, price) VALUES
('Winter Jacket', 'winter wear', 99.99),
('Snow Boots', 'winter wear', 79.49),
('Scarf', 'accessories', 15.99),
('Gloves', 'accessories', 12.49),
('Notebook', 'statinary', 3.99),
('Pen Set', 'statinary', 5.49),
('Earmuffs', 'accessories', 19.99),
('Socks', 'winter wear', 8.99),
('Sweater', 'winter wear', 49.99),
('Hat', 'accessories', 14.99),
('Backpack', 'accessories', 39.99),
('Marker Set', 'statinary', 9.49),
('Thermal Flask', 'accessories', 29.99),
('Beanie', 'winter wear', 22.99),
('File Folder', 'statinary', 4.99),
('Ruler Set', 'statinary', 2.99),
('Wool Coat', 'winter wear', 129.99),
('Hand Warmer', 'accessories', 7.99),
('Glasses Case', 'accessories', 13.49),
('Pencil Case', 'statinary', 6.99);

INSERT INTO locations (city, state, country) VALUES
('New York', 'New York', 'USA'),
('Los Angeles', 'California', 'USA'),
('Chicago', 'Illinois', 'USA'),
('Houston', 'Texas', 'USA'),
('Phoenix', 'Arizona', 'USA'),
('Philadelphia', 'Pennsylvania', 'USA'),
('San Antonio', 'Texas', 'USA'),
('San Diego', 'California', 'USA'),
('Dallas', 'Texas', 'USA'),
('San Jose', 'California', 'USA'),
('Austin', 'Texas', 'USA'),
('Jacksonville', 'Florida', 'USA'),
('San Francisco', 'California', 'USA'),
('Columbus', 'Ohio', 'USA'),
('Indianapolis', 'Indiana', 'USA'),
('Seattle', 'Washington', 'USA'),
('Denver', 'Colorado', 'USA'),
('Washington', 'District of Columbia', 'USA'),
('Boston', 'Massachusetts', 'USA'),
('El Paso', 'Texas', 'USA');

INSERT INTO sales (pid, timeid, locid, sales) VALUES
(1, 1, 1, 50), (2, 2, 2, 40), (3, 3, 3, 60),
(4, 4, 4, 70), (5, 5, 5, 90), (6, 6, 6, 30),
(7, 7, 7, 20), (8, 8, 8, 100), (9, 9, 9, 40),
(10, 10, 10, 50), (11, 11, 11, 45), (12, 12, 12, 65),
(13, 13, 13, 75), (14, 14, 14, 85), (15, 15, 15, 95),
(16, 16, 16, 80), (17, 17, 17, 60), (18, 18, 18, 55),
(19, 19, 19, 45), (20, 20, 20, 70), (1, 10, 3, 50),
(2, 11, 4, 40), (3, 12, 5, 60), (4, 13, 6, 70),
(5, 14, 7, 90), (6, 15, 8, 30), (7, 16, 9, 20),
(8, 17, 10, 100), (9, 18, 11, 40), (10, 19, 12, 50),
(11, 20, 13, 45), (12, 1, 14, 65), (13, 2, 15, 75),
(14, 3, 16, 85), (15, 4, 17, 95), (16, 5, 18, 80),
(17, 6, 19, 60), (18, 7, 20, 55), (19, 8, 1, 45),
(20, 9, 2, 70), (1, 11, 4, 50), (2, 12, 5, 40),
(3, 13, 6, 60), (4, 14, 7, 70), (5, 15, 8, 90),
(6, 16, 9, 30), (7, 17, 10, 20), (8, 18, 11, 100),
(9, 19, 12, 40), (10, 20, 13, 50);

# 1 query
select year , sum(sales) from sales natural join times group by year;

# 2 query 
select state , sum(sales) as total_sale from sales natural join locations group by state;

# 3 query
select year , state , sum(sales) as total_sale 
from sales  join times , locations group by year , state order by year , state ;

# 6 query 
# Query 1 shows how sales have varied across different years, helping analyze yearly trends.
# Query 2 highlights the contribution of each state to total sales, useful for regional performance assessment.
# Query 3 combines year and state data, allowing us to pinpoint state-specific performance over time.

# 7 query
select city, state, country, sum(sales) as total_sales from sales 
natural join products , locations , times
where pname = 'raincoat' and year = year(curdate()) - 1
group by city, state, country;

# 8 query
select year, sum(sales) as total_sales from sales 
natural join products , times
where pname = 'New Year greeting card'
group by year;

# 9 query 
select country, sum(sales) as total_sales from sales 
natural join products , locations , times
where category = 'winter wear' and holiday_flag = true
group by country;

# 10 query 
select month, city, sum(sales) as total_sales from sales 
natural join products , locations , times
where category = 'accessories' and year = 2016
group by month, city  order by month asc , city asc;











