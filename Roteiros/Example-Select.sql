CREATE TABLE EMPLOYEE(
	Fname VARCHAR(20),
	Minit CHAR(1),
	Lname VARCHAR(20),
	Ssn INTEGER PRIMARY KEY,
	Bdate DATE,
	Address VARCHAR(30),
	Sex CHAR(1),
	Salary INTEGER,
	Super_ssn INTEGER,
	Dno INTEGER
);


INSERT INTO EMPLOYEE(Fname, Minit, Lname, Ssn, Bdate, Adress, Sex, Salary, Super_ssn, Dno) 
	VALUES ('John', 'B', 'Smith', 123456789, '1965-01-09', '731 Fondren ...', 'M', 30000, 333445555, 5 ),
	   ('Franklin', 'T', 'Wong', 333445555, '1955-12-08', '638 Voss ...', 'M', 40000, 888665555, 5 ),
	   ('Alicia', 'J', 'Zelaya', 999887777, '1968-01-19', '3321 Castle...', 'F', 25000, 987654321, 4),
	   ('Jennifer', 'S', 'Wallace', 987654321, '1941-06-20', '291 Berry...', 'F', 43000, 888665555, 4),
	   ('Ramesh', 'K', 'Narayan', 666884444, '1962-09-15', '975 Fire...', 'M', 38000, 333445555, 5),
	   ('Joyce', 'A', 'English', 453453453, '1972-07-31', '5631 Rice...', 'F', 25000, 333445555, 5),
	   ('Ahmada', 'V', 'Jabbar', 987987987, '1969-03-29', '980 Dallas...', 'M', 25000, 987654321, 4),
	   ('James', 'E', 'Borg', 888665555, '1937-11-10', '450 Stone...', 'M', 55000, NULL, 1);
	   
CREATE TABLE Department(
	Dname VARCHAR(20),
	Dnumber INTEGER,
	Mgr_ssn INTEGER,
	Mgr_start_date DATE
);

INSERT INTO Department (Dname, Dnumber, Mgr_ssn, Mgr_start_date)
	VALUES  ('Research', 5, 333445555, '1988-05-22'),
			('Administration', 4, 987654321, '1995-01-01'),
			('Headquarters', 1, 888665555, '1981-06-19');

CREATE TABLE Dept_locations(
	Dnumber INTEGER,
	Dlocation VARCHAR(20)
); 

INSERT INTO Dept_locations( Dnumber, Dlocation)
	VALUES (1, 	'Houston'),
		   (4, 'Stafford'),
		   (5, 'Bellaire'),
		   (5, 'Sugarland'),
		   (5, 'Houston');

CREATE TABLE Works_on(
	Essn INTEGER,
	Pno INTEGER,
	Hours NUMERIC
);

INSERT INTO Works_on (Essn, Pno, Hours)
	VALUES  (123456789, 1, 32.5),
			(123456789, 2, 7.5),
			(666884444, 3, 40.0),
			(453453453, 1, 20.0),
			(453453453, 2, 20.0),
			(333445555, 2, 10.0),
			(333445555, 3, 10.0),
			(333445555, 10, 10.0),
			(333445555, 20, 10.0),
			(999887777, 30, 30.0),
			(999887777, 10, 10.0),
			(987987987, 10, 35.0),
			(987987987, 30, 5.0),
			(987654321, 30, 20.0),
			(987654321, 20, 15.0),
			(888665555, 20, NULL);

CREATE TABLE Project(
	Pname VARCHAR(20),
	Pnumber INTEGER,
	Plocation VARCHAR(20),
	Dnum INTEGER
);

INSERT INTO Project(Pname, Pnumber, Plocation, Dnum) 
	VALUES  ('ProductX', 1, 'Bellaire', 5), 
			('ProductY', 2, 'Sugarland', 5),
			('ProductZ', 3, 'Houston', 5),
			('Computerization', 10, 'Stafford', 4),
			('Reorganization', 20, 'Houston', 1),
			('Newbefits', 30, 'Stafford', 4);

CREATE TABLE Dependet(
	Essn INTEGER,
	Dependet_name VARCHAR(20),
	Sex CHAR(1),
	Bdate DATE,
	Relationship VARCHAR(10)  
);

INSERT INTO Dependet (Essn, Dependet_name, Sex, Bdate, Relationship)
	VALUES  (33445555, 'Alice','F', '1986-04-05', 'Daughter'),
			(333445555, 'Theodore', 'M', '1983-10-25', 'Son'),
			(333445555, 'Joy', 'F', '1958-05-03', 'Spouse'),
			(987654321, 'Abner', 'M', '1942-02-28', 'Spouse'),
			(123456789, 'Michael', 'M', '1988-01-04', 'Son'),
			(123456789, 'Alice', 'F', '1988-12-30', 'Daughter'),
			(123456789, 'Elizabeth', 'F', '1967-05-05', 'Spouse');


-- Retrieve the names of all employees in department 5 who work more than 10 hours per week on the ProductX project.
SELECT e.Fname -- return 
FROM Employee AS e, Works_on AS w, Project AS p
WHERE e.Ssn = w.Essn AND
        w.Pno = p.Pnumber AND
        w.hours > 5 AND
        p.Pname = 'ProductX';

-- List the names of all employees who have a dependent with the same first name as themselves.
SELECT e.Fname
FROM Employee AS e, Dependet AS d
WHERE e.Ssn = d.Essn AND
        e.Fname = d.Dependet_name;

-- Find the names of all employees who are directly supervised by ‘Franklin Wong’.
SELECT e.Fname
FROM Employee AS e, Employee AS s
WHERE e.Super_ssn = s.Ssn AND 
        s.Fname = 'Franklin' AND 
        s.Lname = 'Wong';

-- For each project, list the project name and the total hours per week (by all employees) spent on that project. 
SELECT p.Pname, SUM (w.hours)
FROM Project AS p, Works_on AS w 
WHERE p.Pnumber = w.Pno 
        GROUP BY p.Pname;

-- Retrieve the names of all employees who work on every project.
SELECT e.Fname
FROM Employee AS e
WHERE NOT EXISTS (SELECT p.Pnumber 
                FROM Project AS p 
                WHERE NOT EXISTS (SELECT *
                                FROM Works_on as w 
                                WHERE p.Pnumber = w.Pno AND
                                w.Essn = e.Ssn));

-- Retrieve the names of all employees who do not work on any project. 
SELECT e.Fname 
FROM Employee AS e
WHERE NOT EXISTS (SELECT * 
        FROM Works_on as w
        WHERE w.Essn = e.Ssn);

-- For each department, retrieve the department name and the average salary of all employees working in that department.
SELECT d.Dname, AVG (e.Salary)
FROM Department AS d, Employee AS e
WHERE e.Dno = d.Dnumber
    GROUP BY d.Dname;

-- Retrieve the average salary of all female employees
SELECT AVG (e.Salary)
FROM Employee AS e 
WHERE e.Sex = 'F';

-- Find the names and addresses of all employees who work on at least one project located in Houston but whose department has no location in Houston.
SELECT e.Fname 
FROM Employee e 
WHERE EXISTS (SELECT *
            FROM Works_on AS w, Project AS p
                WHERE w.Essn = e.Ssn AND
                    w.Pno = p.Pnumber AND 
                    p.Plocation = 'Houston' AND
                    NOT EXISTS (SELECT *
                                FROM Dept_locations AS dl
                                WHERE e.Dno = dl.Dnumber AND
                                    dl.Dlocation = 'Houston'));

-- List the last names of all department managers who have no dependents.
SELECT e.Fname 
FROM Employee AS e 
WHERE EXISTS (SELECT *
            FROM Department AS d 
            WHERE e.Ssn = d.Mgr_ssn) AND
			NOT EXISTS (SELECT *
                    FROM Dependet AS de 
                    WHERE e.Ssn = de.Essn);
