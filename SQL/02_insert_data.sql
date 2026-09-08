-- Hospital Management System: Sample Data Inserts
-- Matches Schema/schema.sql exactly. Order respects FK dependencies.

-- Rooms
INSERT INTO Rooms (r_id, availability, capacity, type) VALUES (101, 'Available', 4, 'General');
INSERT INTO Rooms (r_id, availability, capacity, type) VALUES (102, 'Occupied', 1, 'Private');
INSERT INTO Rooms (r_id, availability, capacity, type) VALUES (103, 'Available', 1, 'ICU');
INSERT INTO Rooms (r_id, availability, capacity, type) VALUES (104, 'Available', 2, 'Semi-Private');
INSERT INTO Rooms (r_id, availability, capacity, type) VALUES (105, 'Occupied', 1, 'Operation Theatre');
INSERT INTO Rooms (r_id, availability, capacity, type) VALUES (106, 'Available', 2, 'General');
INSERT INTO Rooms (r_id, availability, capacity, type) VALUES (107, 'Available', 1, 'Private');
INSERT INTO Rooms (r_id, availability, capacity, type) VALUES (108, 'Available', 1, 'ICU');
INSERT INTO Rooms (r_id, availability, capacity, type) VALUES (109, 'Occupied', 4, 'Semi-Private');
INSERT INTO Rooms (r_id, availability, capacity, type) VALUES (110, 'Available', 1, 'Operation Theatre');

-- Doctor
INSERT INTO Doctor (doctor_id, name, qualification, department, r_id) VALUES (1, 'Anil Sharma', 'MBBS, MD', 'Cardiology', 101);
INSERT INTO Doctor (doctor_id, name, qualification, department, r_id) VALUES (2, 'Priya Verma', 'MBBS, MS', 'Orthopedics', 102);
INSERT INTO Doctor (doctor_id, name, qualification, department, r_id) VALUES (3, 'Ravi Kapoor', 'MBBS, DM', 'Pediatrics', 103);
INSERT INTO Doctor (doctor_id, name, qualification, department, r_id) VALUES (4, 'Sneha Iyer', 'MBBS, MD', 'General Medicine', 104);
INSERT INTO Doctor (doctor_id, name, qualification, department, r_id) VALUES (5, 'Vikram Nair', 'MBBS, MCh', 'Neurology', 105);
INSERT INTO Doctor (doctor_id, name, qualification, department, r_id) VALUES (6, 'Meera Joshi', 'MBBS, DNB', 'Dermatology', 106);

-- Patients
INSERT INTO Patients (p_id, dob, age, name, mobile_number, gender) VALUES (1, TO_DATE('02-08-1991', 'DD-MM-YYYY'), 35, 'Aarav Sharma', '9691682483', 'M');
INSERT INTO Patients (p_id, dob, age, name, mobile_number, gender) VALUES (2, TO_DATE('24-08-1967', 'DD-MM-YYYY'), 59, 'Ishita Verma', '9987825707', 'F');
INSERT INTO Patients (p_id, dob, age, name, mobile_number, gender) VALUES (3, TO_DATE('26-07-1949', 'DD-MM-YYYY'), 77, 'Rohan Gupta', '9339701014', 'M');
INSERT INTO Patients (p_id, dob, age, name, mobile_number, gender) VALUES (4, TO_DATE('28-08-1947', 'DD-MM-YYYY'), 79, 'Sneha Iyer', '9719659571', 'F');
INSERT INTO Patients (p_id, dob, age, name, mobile_number, gender) VALUES (5, TO_DATE('09-03-1947', 'DD-MM-YYYY'), 79, 'Karan Nair', '9153246119', 'M');
INSERT INTO Patients (p_id, dob, age, name, mobile_number, gender) VALUES (6, TO_DATE('24-08-1993', 'DD-MM-YYYY'), 33, 'Divya Kapoor', '9697714383', 'F');
INSERT INTO Patients (p_id, dob, age, name, mobile_number, gender) VALUES (7, TO_DATE('18-04-2004', 'DD-MM-YYYY'), 22, 'Arjun Joshi', '9550047120', 'M');
INSERT INTO Patients (p_id, dob, age, name, mobile_number, gender) VALUES (8, TO_DATE('12-12-2002', 'DD-MM-YYYY'), 23, 'Neha Reddy', '9226478448', 'F');
INSERT INTO Patients (p_id, dob, age, name, mobile_number, gender) VALUES (9, TO_DATE('23-04-1948', 'DD-MM-YYYY'), 78, 'Aditya Menon', '9701571670', 'M');
INSERT INTO Patients (p_id, dob, age, name, mobile_number, gender) VALUES (10, TO_DATE('25-07-1998', 'DD-MM-YYYY'), 28, 'Pooja Singh', '9724488420', 'F');
INSERT INTO Patients (p_id, dob, age, name, mobile_number, gender) VALUES (11, TO_DATE('05-11-1947', 'DD-MM-YYYY'), 78, 'Rahul Patel', '9301724977', 'M');
INSERT INTO Patients (p_id, dob, age, name, mobile_number, gender) VALUES (12, TO_DATE('03-08-1974', 'DD-MM-YYYY'), 52, 'Ananya Rao', '9688136138', 'F');
INSERT INTO Patients (p_id, dob, age, name, mobile_number, gender) VALUES (13, TO_DATE('27-11-2012', 'DD-MM-YYYY'), 13, 'Vivek Malhotra', '9163996269', 'M');
INSERT INTO Patients (p_id, dob, age, name, mobile_number, gender) VALUES (14, TO_DATE('05-01-1995', 'DD-MM-YYYY'), 31, 'Simran Chatterjee', '9830573909', 'F');
INSERT INTO Patients (p_id, dob, age, name, mobile_number, gender) VALUES (15, TO_DATE('20-02-1953', 'DD-MM-YYYY'), 73, 'Yash Bansal', '9934543046', 'M');

-- Nurse
INSERT INTO Nurse (nurse_id, p_id, name, mobile_number) VALUES (1, 1, 'Kavita Rao', '9852164119');
INSERT INTO Nurse (nurse_id, p_id, name, mobile_number) VALUES (2, 2, 'Suresh Patel', '9872492024');
INSERT INTO Nurse (nurse_id, p_id, name, mobile_number) VALUES (3, 3, 'Anjali Menon', '9888592782');
INSERT INTO Nurse (nurse_id, p_id, name, mobile_number) VALUES (4, 4, 'Deepak Singh', '9870825377');
INSERT INTO Nurse (nurse_id, p_id, name, mobile_number) VALUES (5, 5, 'Pooja Reddy', '9858530762');
INSERT INTO Nurse (nurse_id, p_id, name, mobile_number) VALUES (6, 6, 'Manoj Gupta', '9850234045');

-- Receptionist
INSERT INTO Receptionist (receptionist_id) VALUES (1);
INSERT INTO Receptionist (receptionist_id) VALUES (2);
INSERT INTO Receptionist (receptionist_id) VALUES (3);

-- Bills
INSERT INTO Bills (bill_id, p_id, amount) VALUES (1, 1, 6586.45);
INSERT INTO Bills (bill_id, p_id, amount) VALUES (2, 2, 4904.29);
INSERT INTO Bills (bill_id, p_id, amount) VALUES (3, 3, 19605.83);
INSERT INTO Bills (bill_id, p_id, amount) VALUES (4, 4, 2505.45);
INSERT INTO Bills (bill_id, p_id, amount) VALUES (5, 5, 7856.1);
INSERT INTO Bills (bill_id, p_id, amount) VALUES (6, 6, 12630.35);
INSERT INTO Bills (bill_id, p_id, amount) VALUES (7, 7, 8915.15);
INSERT INTO Bills (bill_id, p_id, amount) VALUES (8, 8, 11496.44);
INSERT INTO Bills (bill_id, p_id, amount) VALUES (9, 9, 15419.5);
INSERT INTO Bills (bill_id, p_id, amount) VALUES (10, 10, 2293.42);
INSERT INTO Bills (bill_id, p_id, amount) VALUES (11, 11, 13042.35);
INSERT INTO Bills (bill_id, p_id, amount) VALUES (12, 12, 4541.57);

-- Test_Report
INSERT INTO Test_Report (report_id, p_id, r_id, test_type, result) VALUES (1, 1, 101, 'Blood Test', 'Normal');
INSERT INTO Test_Report (report_id, p_id, r_id, test_type, result) VALUES (2, 2, 102, 'X-Ray', 'Abnormal');
INSERT INTO Test_Report (report_id, p_id, r_id, test_type, result) VALUES (3, 3, 103, 'MRI Scan', 'Pending');
INSERT INTO Test_Report (report_id, p_id, r_id, test_type, result) VALUES (4, 4, 104, 'CT Scan', 'Normal');
INSERT INTO Test_Report (report_id, p_id, r_id, test_type, result) VALUES (5, 5, 105, 'Urine Test', 'Requires Review');
INSERT INTO Test_Report (report_id, p_id, r_id, test_type, result) VALUES (6, 6, 106, 'ECG', 'Normal');
INSERT INTO Test_Report (report_id, p_id, r_id, test_type, result) VALUES (7, 7, 107, 'Blood Test', 'Abnormal');
INSERT INTO Test_Report (report_id, p_id, r_id, test_type, result) VALUES (8, 8, 108, 'X-Ray', 'Pending');
INSERT INTO Test_Report (report_id, p_id, r_id, test_type, result) VALUES (9, 9, 109, 'MRI Scan', 'Normal');
INSERT INTO Test_Report (report_id, p_id, r_id, test_type, result) VALUES (10, 10, 110, 'CT Scan', 'Requires Review');

-- Records
INSERT INTO Records (record_number, application_number) VALUES (1000, 'APP-2026001');
INSERT INTO Records (record_number, application_number) VALUES (1001, 'APP-2026002');
INSERT INTO Records (record_number, application_number) VALUES (1002, 'APP-2026003');
INSERT INTO Records (record_number, application_number) VALUES (1003, 'APP-2026004');
INSERT INTO Records (record_number, application_number) VALUES (1004, 'APP-2026005');
INSERT INTO Records (record_number, application_number) VALUES (1005, 'APP-2026006');
INSERT INTO Records (record_number, application_number) VALUES (1006, 'APP-2026007');
INSERT INTO Records (record_number, application_number) VALUES (1007, 'APP-2026008');
INSERT INTO Records (record_number, application_number) VALUES (1008, 'APP-2026009');
INSERT INTO Records (record_number, application_number) VALUES (1009, 'APP-2026010');
INSERT INTO Records (record_number, application_number) VALUES (1010, 'APP-2026011');
INSERT INTO Records (record_number, application_number) VALUES (1011, 'APP-2026012');

-- Consults
INSERT INTO Consults (p_id, doctor_id) VALUES (1, 1);
INSERT INTO Consults (p_id, doctor_id) VALUES (2, 2);
INSERT INTO Consults (p_id, doctor_id) VALUES (3, 3);
INSERT INTO Consults (p_id, doctor_id) VALUES (4, 4);
INSERT INTO Consults (p_id, doctor_id) VALUES (5, 5);
INSERT INTO Consults (p_id, doctor_id) VALUES (6, 6);
INSERT INTO Consults (p_id, doctor_id) VALUES (7, 1);
INSERT INTO Consults (p_id, doctor_id) VALUES (8, 2);
INSERT INTO Consults (p_id, doctor_id) VALUES (9, 3);
INSERT INTO Consults (p_id, doctor_id) VALUES (10, 4);
INSERT INTO Consults (p_id, doctor_id) VALUES (11, 5);
INSERT INTO Consults (p_id, doctor_id) VALUES (12, 6);
INSERT INTO Consults (p_id, doctor_id) VALUES (13, 1);
INSERT INTO Consults (p_id, doctor_id) VALUES (14, 2);
INSERT INTO Consults (p_id, doctor_id) VALUES (15, 3);

-- Pays
INSERT INTO Pays (p_id, bill_id) VALUES (1, 1);
INSERT INTO Pays (p_id, bill_id) VALUES (2, 2);
INSERT INTO Pays (p_id, bill_id) VALUES (3, 3);
INSERT INTO Pays (p_id, bill_id) VALUES (4, 4);
INSERT INTO Pays (p_id, bill_id) VALUES (5, 5);
INSERT INTO Pays (p_id, bill_id) VALUES (6, 6);
INSERT INTO Pays (p_id, bill_id) VALUES (7, 7);
INSERT INTO Pays (p_id, bill_id) VALUES (8, 8);
INSERT INTO Pays (p_id, bill_id) VALUES (9, 9);
INSERT INTO Pays (p_id, bill_id) VALUES (10, 10);
INSERT INTO Pays (p_id, bill_id) VALUES (11, 11);
INSERT INTO Pays (p_id, bill_id) VALUES (12, 12);

-- Has_Test_Report
INSERT INTO Has_Test_Report (p_id, report_id) VALUES (1, 1);
INSERT INTO Has_Test_Report (p_id, report_id) VALUES (2, 2);
INSERT INTO Has_Test_Report (p_id, report_id) VALUES (3, 3);
INSERT INTO Has_Test_Report (p_id, report_id) VALUES (4, 4);
INSERT INTO Has_Test_Report (p_id, report_id) VALUES (5, 5);
INSERT INTO Has_Test_Report (p_id, report_id) VALUES (6, 6);
INSERT INTO Has_Test_Report (p_id, report_id) VALUES (7, 7);
INSERT INTO Has_Test_Report (p_id, report_id) VALUES (8, 8);
INSERT INTO Has_Test_Report (p_id, report_id) VALUES (9, 9);
INSERT INTO Has_Test_Report (p_id, report_id) VALUES (10, 10);

-- Assigned
INSERT INTO Assigned (p_id, r_id) VALUES (1, 101);
INSERT INTO Assigned (p_id, r_id) VALUES (2, 102);
INSERT INTO Assigned (p_id, r_id) VALUES (3, 103);
INSERT INTO Assigned (p_id, r_id) VALUES (4, 104);
INSERT INTO Assigned (p_id, r_id) VALUES (5, 105);
INSERT INTO Assigned (p_id, r_id) VALUES (6, 106);
INSERT INTO Assigned (p_id, r_id) VALUES (7, 107);
INSERT INTO Assigned (p_id, r_id) VALUES (8, 108);

-- Governs
INSERT INTO Governs (r_id, nurse_id) VALUES (101, 1);
INSERT INTO Governs (r_id, nurse_id) VALUES (102, 2);
INSERT INTO Governs (r_id, nurse_id) VALUES (103, 3);
INSERT INTO Governs (r_id, nurse_id) VALUES (104, 4);
INSERT INTO Governs (r_id, nurse_id) VALUES (105, 5);
INSERT INTO Governs (r_id, nurse_id) VALUES (106, 6);
INSERT INTO Governs (r_id, nurse_id) VALUES (107, 1);
INSERT INTO Governs (r_id, nurse_id) VALUES (108, 2);
INSERT INTO Governs (r_id, nurse_id) VALUES (109, 3);
INSERT INTO Governs (r_id, nurse_id) VALUES (110, 4);

-- Maintains
INSERT INTO Maintains (receptionist_id, record_number) VALUES (1, 1000);
INSERT INTO Maintains (receptionist_id, record_number) VALUES (2, 1001);
INSERT INTO Maintains (receptionist_id, record_number) VALUES (3, 1002);
INSERT INTO Maintains (receptionist_id, record_number) VALUES (1, 1003);
INSERT INTO Maintains (receptionist_id, record_number) VALUES (2, 1004);
INSERT INTO Maintains (receptionist_id, record_number) VALUES (3, 1005);
INSERT INTO Maintains (receptionist_id, record_number) VALUES (1, 1006);
INSERT INTO Maintains (receptionist_id, record_number) VALUES (2, 1007);
INSERT INTO Maintains (receptionist_id, record_number) VALUES (3, 1008);
INSERT INTO Maintains (receptionist_id, record_number) VALUES (1, 1009);
INSERT INTO Maintains (receptionist_id, record_number) VALUES (2, 1010);
INSERT INTO Maintains (receptionist_id, record_number) VALUES (3, 1011);

