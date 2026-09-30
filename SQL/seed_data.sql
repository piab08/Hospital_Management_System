-- Sample data (MySQL syntax). Order respects FK dependencies.

INSERT INTO Rooms (r_id, availability, capacity, type) VALUES
(101,'Available',4,'General'),(102,'Occupied',1,'Private'),(103,'Available',1,'ICU'),
(104,'Available',2,'Semi-Private'),(105,'Occupied',1,'Operation Theatre'),(106,'Available',2,'General'),
(107,'Available',1,'Private'),(108,'Available',1,'ICU'),(109,'Occupied',4,'Semi-Private'),
(110,'Available',1,'Operation Theatre');

INSERT INTO Doctor (doctor_id, name, qualification, department, r_id) VALUES
(1,'Anil Sharma','MBBS, MD','Cardiology',101),(2,'Priya Verma','MBBS, MS','Orthopedics',102),
(3,'Ravi Kapoor','MBBS, DM','Pediatrics',103),(4,'Sneha Iyer','MBBS, MD','General Medicine',104),
(5,'Vikram Nair','MBBS, MCh','Neurology',105),(6,'Meera Joshi','MBBS, DNB','Dermatology',106);

INSERT INTO Patients (p_id, dob, age, name, mobile_number, gender) VALUES
(1,'1991-08-02',35,'Aarav Sharma','9691682483','M'),(2,'1967-08-24',59,'Ishita Verma','9987825707','F'),
(3,'1949-07-26',77,'Rohan Gupta','9339701014','M'),(4,'1947-08-28',79,'Sneha Iyer','9719659571','F'),
(5,'1947-03-09',79,'Karan Nair','9153246119','M'),(6,'1993-08-24',33,'Divya Kapoor','9697714383','F'),
(7,'2004-04-18',22,'Arjun Joshi','9550047120','M'),(8,'2002-12-12',23,'Neha Reddy','9226478448','F'),
(9,'1948-04-23',78,'Aditya Menon','9701571670','M'),(10,'1998-07-25',28,'Pooja Singh','9724488420','F'),
(11,'1947-11-05',78,'Rahul Patel','9301724977','M'),(12,'1974-08-03',52,'Ananya Rao','9688136138','F'),
(13,'2012-11-27',13,'Vivek Malhotra','9163996269','M'),(14,'1995-01-05',31,'Simran Chatterjee','9830573909','F'),
(15,'1953-02-20',73,'Yash Bansal','9934543046','M');

INSERT INTO Nurse (nurse_id, p_id, name, mobile_number) VALUES
(1,1,'Kavita Rao','9852164119'),(2,2,'Suresh Patel','9872492024'),(3,3,'Anjali Menon','9888592782'),
(4,4,'Deepak Singh','9870825377'),(5,5,'Pooja Reddy','9858530762'),(6,6,'Manoj Gupta','9850234045');

INSERT INTO Receptionist (receptionist_id) VALUES (1),(2),(3);

INSERT INTO Bills (bill_id, p_id, amount) VALUES
(1,1,6586.45),(2,2,4904.29),(3,3,19605.83),(4,4,2505.45),(5,5,7856.10),(6,6,12630.35),
(7,7,8915.15),(8,8,11496.44),(9,9,15419.50),(10,10,2293.42),(11,11,13042.35),(12,12,4541.57);

INSERT INTO Test_Report (report_id, p_id, r_id, test_type, result) VALUES
(1,1,101,'Blood Test','Normal'),(2,2,102,'X-Ray','Abnormal'),(3,3,103,'MRI Scan','Pending'),
(4,4,104,'CT Scan','Normal'),(5,5,105,'Urine Test','Requires Review'),(6,6,106,'ECG','Normal'),
(7,7,107,'Blood Test','Abnormal'),(8,8,108,'X-Ray','Pending'),(9,9,109,'MRI Scan','Normal'),
(10,10,110,'CT Scan','Requires Review');

INSERT INTO Records (record_number, application_number) VALUES
(1000,'APP-2026001'),(1001,'APP-2026002'),(1002,'APP-2026003'),(1003,'APP-2026004'),
(1004,'APP-2026005'),(1005,'APP-2026006'),(1006,'APP-2026007'),(1007,'APP-2026008'),
(1008,'APP-2026009'),(1009,'APP-2026010'),(1010,'APP-2026011'),(1011,'APP-2026012');

INSERT INTO Consults (p_id, doctor_id) VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,1),(8,2),(9,3),(10,4),(11,5),(12,6),(13,1),(14,2),(15,3);

INSERT INTO Pays (p_id, bill_id) VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12);

INSERT INTO Has_Test_Report (p_id, report_id) VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);

INSERT INTO Assigned (p_id, r_id) VALUES
(1,101),(2,102),(3,103),(4,104),(5,105),(6,106),(7,107),(8,108);

INSERT INTO Governs (r_id, nurse_id) VALUES
(101,1),(102,2),(103,3),(104,4),(105,5),(106,6),(107,1),(108,2),(109,3),(110,4);

INSERT INTO Maintains (receptionist_id, record_number) VALUES
(1,1000),(2,1001),(3,1002),(1,1003),(2,1004),(3,1005),(1,1006),(2,1007),(3,1008),(1,1009),(2,1010),(3,1011);
