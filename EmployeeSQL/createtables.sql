create table titles (
    title_id        varchar(6)     primary key,
    title           varchar(50)    not null
);

create table departments (
    dept_no        varchar(6)     primary key,
    dept_name      varchar(50)    not null
);

create table employees (
    emp_no          int            unique not null,
    emp_title_id    varchar(6)     not null,
    birth_date      date           not null,
    first_name      varchar(50)    not null,
    last_name       varchar(50)    not null,
    sex             char(1)        not null,
    hire_date       date           not null,
	primary key (emp_no),
	foreign key (emp_title_id) references titles(title_id)
);

create table salaries (
    emp_no      int     		primary key,
    salary      decimal(10,0)   not null
);

create table department_employee (
    emp_no       int     		not null,
    dept_no      varchar(6)    	not null,
	primary key (emp_no, dept_no),
	foreign key (dept_no) references departments(dept_no),
	foreign key (emp_no) references employees(emp_no)
);

create table department_manager (
    dept_no     varchar(6)     	not null,
    emp_no		int				not null,
	primary key (dept_no, emp_no),
	foreign key (dept_no) references departments(dept_no),
	foreign key (emp_no) references employees(emp_no)
);