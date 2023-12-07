CREATE DATABASE  Employee_PayRoll;

USE Employee_PayRoll;
show databases;

/*-------UC2-------*/
CREATE TABLE emp_payroll
     (
     id INT unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
     name VARCHAR(50) NOT NULL,
     salary DOUBLE NOT NULL,
     start DATE NOT NULL
     );
     
     desc emp_payroll;
     
     /*-------UC3-------*/
     INSERT INTO emp_payroll (name, salary, start)
     VALUES
     ('Bill', 1000000.00, '2010-10-30'),
     ('Tersia', 2000000.00, '2019-11-13'),
     ('Charlie', 3000000.00, '2050-05-21');
     
/*-------UC4-------*/
         
SELECT * FROM emp_payroll;

/*-------UC5-------*/
 SELECT salary FROM emp_payroll WHERE name='Bill';
 SELECT * FROM emp_payroll WHERE start BETWEEN CAST('2018-10-01' AS DATE) AND DATE(NOW());

/*-------UC6-------*/
ALTER TABLE emp_payroll ADD gender CHAR(1) AFTER name;
desc emp_payroll;
SET SQL_SAFE_UPDATES = 0;
UPDATE emp_payroll SET gender = 'M' WHERE name='Bill' OR name='Charlie';

UPDATE emp_payroll SET gender = 'F' WHERE name='Tersia';
SELECT * FROM emp_payroll;

ALTER TABLE emp_payroll modify gender CHAR(1) NOT NULL;
desc emp_payroll;


/*-------UC7-------*/
SELECT AVG(salary) FROM emp_payroll;

INSERT INTO emp_payroll (name, gender, salary, start) VALUES ('Jenny', 'F', 2300000.00, '2022-10-13');
     
     SELECT AVG(salary) FROM emp_payroll WHERE gender='M' GROUP BY gender;
     
     SELECT AVG(salary) FROM emp_payroll WHERE gender='F' GROUP BY gender;
   
   SELECT gender,AVG(salary) FROM emp_payroll GROUP BY gender;
     
     SELECT gender, SUM(salary) FROM emp_payroll GROUP BY gender;
     
     SELECT gender, MAX(salary), MIN(salary) FROM emp_payroll GROUP BY gender;
     
     SELECT COUNT(id) AS female_count FROM emp_payroll WHERE gender='F' GROUP BY gender;