/* Loading data rows					*/


/* region rows						*/
INSERT INTO region VALUES(1 , "NW");
INSERT INTO region VALUES(2 , "SW");
INSERT INTO region VALUES(3 , "MN");
INSERT INTO region VALUES(4 , "MS");
INSERT INTO region VALUES(5 , "NE");
INSERT INTO region VALUES(6 , "SE");

/* employee rows						*/
INSERT INTO 
employee
(emp_lname, emp_fname, emp_mi, emp_hiredate, region_id) 
VALUES 
(1, "Burklow", "Shane", "J", "2018-1-3 00:00:00", 3),
(2, "Connor", "Sean", "Q", "2018-1-3 00:00:00", 4),
(3, "Smith", "Mary", "Z", "2018-1-3 00:00:00", 3),
(4, "Bush", "Emily", "L", "2018-11-3 00:00:00", 5),
(5, "Zebras", "Steve", "H", "2018-11-3 00:00:00", 2),
(6, "Smith", "Jose", "P", "2018-15-3 00:00:00", 6),
(7, "Summers", "Anna", "B", "2018-12-3 00:00:00", 1),
(8, "Ellis", "Maria", "G", "2018-1-3 00:00:00", 1),
(9, "Ephanor", "Victor", "K", "2018-12-3 00:00:00", 5),
(10, "Kilby", "Surgena", "H", "2018-5-3 00:00:00", 4);

/*  Skill rows					*/
INSERT INTO
skill
(skill_id, skill_discription, skill_rate)
values
(1, "Project Mgr.", 40.00),
(2, "Sys. Analyst I", 60.00),
(3, "Sys. Analyst II", 40.00),
(4, "DB Designer I.", 60.00),
(5, "Oricle DBA.", 60.00),
(6, "Tech. Writter", 30.00),
(7, "Java I", 40.00),
(8, "Java II", 60.00);

/*  Customer rows					*/
INSERT INTO
customer
(cus_id, cus_name, cus_phone, region_id)
VALUES
(1, "Tom", "732-334-3214", 6),
(2, "Jeffery", "453-222-0987", 5),
(3, "Lisa", "278-683-9152", 3);