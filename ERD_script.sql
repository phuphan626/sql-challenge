-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Create the 'departments' table with the primary key set for dept_no
CREATE TABLE "departments" (
    "dept_no" varchar(50)   NOT NULL,
    "dept_name" varchar(50)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);
-- Create the 'dept_emp' table, the dept_no should be foreign key, since it is the dependent to 'departments'
CREATE TABLE "dept_emp" (
    "emp_no" int   NOT NULL,
    "dept_no" varchar(50)   NOT NULL
);
-- Create 'dept_manager' table
CREATE TABLE "dept_manager" (
    "dept_no" varchar(50)   NOT NULL,
    "emp_no" int   NOT NULL
);
-- Create 'employees' table
CREATE TABLE "employees" (
    "emp_no" int   NOT NULL,
    "emp_title_id" varchar(50)   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(50)   NOT NULL,
    "last_name" varchar(50)   NOT NULL,
    "sex" varchar(10)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);
-- Create 'salaries' table
CREATE TABLE "salaries" (
    "emp_no" int   NOT NULL,
    "salary" money   NOT NULL
);
-- Create 'titles' table
CREATE TABLE "titles" (
    "title_id" varchar(50)   NOT NULL,
    "title" varchar(50)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);
-- Set primary and foreign key.
-- I think the primary key just needs to be set at two tables : 'departments' with 'dept_no' as pk and 'employees' with 'emp_no' as pk
-- The other tables will be set with foreign key, since they are dependents. 
-- Set the 'emp_no' in 'dept_emp' table to foreign key, since the 'emp_no' in 'employees' table is primary key.
ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");
-- Set the 'dept_no' in 'dept_emp' table to foreign key.
ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");
-- Set the 'dept_no' in 'dept_manager' to foreign key.
ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");
-- Set the 'emp_no' in 'dept_manager' to foreign key.
ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");
-- Set 'emp_title_id' in 'employees' to foreign key.
ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");
-- Set the 'emp_no' in 'salaries' to foreign key.
ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");
-- I think for there are two types of relationship in this scenario: one to one, and one to many.
-- The one to one is one employee can work for one department, and have one title, one salary and one position.
-- The one to many is the title id can be set for multiple employees. 
-- However, in the diagram, since it is assgined to for just one id, so the whole diagram should represent one to one relationship. 
