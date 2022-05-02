-- Creating tables for PH-EmployeeDB
CREATE TABLE departments (
     dept_no VARCHAR(8) NOT NULL,
     dept_name VARCHAR(40) NOT NULL,
     PRIMARY KEY (dept_no),
     UNIQUE (dept_name)
);    

-- creating table for the employee dataset 
CREATE TABLE employees(    
	 emp_no INT NOT NULL,
     birth_date DATE NOT NULL,
     first_name VARCHAR NOT NULL,
     last_name VARCHAR NOT NULL,
     gender VARCHAR NOT NULL,
     hire_date DATE NOT NULL,
     PRIMARY KEY (emp_no)
);


-- creating remaining tables 
create table dept_emp(
	emp_no int not null,
	dept_no varchar(8),
	from_date date not null,
	to_date date not null,
	
foreign key (emp_no) references employees (emp_no),
foreign key (dept_no) references departments (dept_no),
primary key(emp_no,dept_no)
	
);

create table dept_manager(
	dept_no varchar not null,
	emp_no int not null,
	from_date date not null, 
	to_date date not null,

foreign key (dept_no) references departments (dept_no),	
foreign key (emp_no) references employees (emp_no),
primary key(dept_no,emp_no)
	
);


create table salaries(
	salary int not null,
	emp_no int not null,
	from_date date not null,
	to_date date not null,
foreign key (emp_no) references employees (emp_no),
primary key (emp_no));

-- drop table titles cascade
create table titles(
	title varchar not null,
	emp_no int not null,	
	from_date date not null,
	to_date date not null,
primary key (emp_no, title, from_date));