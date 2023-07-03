--DROP SCHEMA company CASCADE;
CREATE SCHEMA company;
SET search_path TO company;
CREATE TABLE employee (
	fname VARCHAR (15) NOT NULL,
	minit CHAR,
	lname VARCHAR (15) NOT NULL,
	ssn CHAR(9) NOT NULL,
	bdate DATE,
	address VARCHAR(30),
	sex CHAR CHECK (sex IN ('M', 'F')),
	salary DECIMAL(10, 2),
	superssn CHAR(9),
	dno INT NOT NULL,
	PRIMARY KEY (ssn),
	CONSTRAINT emp_superssn FOREIGN KEY (superssn) REFERENCES employee(ssn) DEFERRABLE
);
CREATE TABLE department (
	dname VARCHAR(15) NOT NULL,
	dnumber INT NOT NULL,	
	mgrssn CHAR(9),
	mgrstartdate DATE,
	PRIMARY KEY (dnumber),
	FOREIGN KEY (mgrssn) REFERENCES employee(ssn)
);
CREATE TABLE dependent (
	essn CHAR (9) NOT NULL,
	dependent_name VARCHAR (30) NOT NULL,
	sex CHAR,
	bdate DATE,
	relationship VARCHAR(15),
	PRIMARY KEY (essn, dependent_name),
	FOREIGN KEY (essn) REFERENCES employee(ssn)
);
ALTER TABLE employee
ADD CONSTRAINT emp_dno FOREIGN KEY (dno) REFERENCES department(dnumber) DEFERRABLE;
CREATE TABLE dept_locations (
	dnumber INT NOT NULL,
	dlocation VARCHAR(15),
	FOREIGN KEY (dnumber) REFERENCES department(dnumber)
);
CREATE TABLE project (
	pname VARCHAR(20),
	pnumber INT NOT NULL,
	plocation VARCHAR(15),
	dnum INT,
	PRIMARY KEY (pnumber),
	FOREIGN KEY (dnum) REFERENCES department(dnumber)
);
CREATE TABLE works_on (
	essn CHAR(9) NOT NULL,
	pno INT NOT NULL,
	hours DECIMAL(4, 2),
	FOREIGN KEY (essn) REFERENCES employee(ssn),
	FOREIGN KEY (pno) REFERENCES project(pnumber)
);