-- Hospital Management System schema (MySQL)
DROP TABLE IF EXISTS Maintains, Governs, Assigned, Has_Test_Report, Pays, Consults,
    Records, Test_Report, Bills, Receptionist, Nurse, Patients, Doctor, Rooms;

CREATE TABLE Rooms (
    r_id INT PRIMARY KEY,
    availability VARCHAR(20),
    capacity INT,
    type VARCHAR(30)
);

CREATE TABLE Doctor (
    doctor_id INT PRIMARY KEY,
    name VARCHAR(60),
    qualification VARCHAR(60),
    department VARCHAR(60),
    r_id INT,
    FOREIGN KEY (r_id) REFERENCES Rooms(r_id) ON DELETE SET NULL
);

CREATE TABLE Patients (
    p_id INT PRIMARY KEY,
    dob DATE,
    age INT,
    name VARCHAR(60),
    mobile_number VARCHAR(15),
    gender CHAR(1)
);

CREATE TABLE Nurse (
    nurse_id INT PRIMARY KEY,
    p_id INT,
    name VARCHAR(60),
    mobile_number VARCHAR(15),
    FOREIGN KEY (p_id) REFERENCES Patients(p_id) ON DELETE SET NULL
);

CREATE TABLE Receptionist (
    receptionist_id INT PRIMARY KEY
);

CREATE TABLE Bills (
    bill_id INT PRIMARY KEY,
    p_id INT,
    amount DECIMAL(10,2),
    FOREIGN KEY (p_id) REFERENCES Patients(p_id) ON DELETE CASCADE
);

CREATE TABLE Test_Report (
    report_id INT PRIMARY KEY,
    p_id INT,
    r_id INT,
    test_type VARCHAR(40),
    result VARCHAR(40),
    FOREIGN KEY (p_id) REFERENCES Patients(p_id) ON DELETE CASCADE,
    FOREIGN KEY (r_id) REFERENCES Rooms(r_id) ON DELETE SET NULL
);

CREATE TABLE Records (
    record_number INT PRIMARY KEY,
    application_number VARCHAR(30)
);

CREATE TABLE Consults (
    p_id INT, doctor_id INT,
    PRIMARY KEY (p_id, doctor_id),
    FOREIGN KEY (p_id) REFERENCES Patients(p_id) ON DELETE CASCADE,
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id) ON DELETE CASCADE
);

CREATE TABLE Pays (
    p_id INT, bill_id INT,
    PRIMARY KEY (p_id, bill_id),
    FOREIGN KEY (p_id) REFERENCES Patients(p_id) ON DELETE CASCADE,
    FOREIGN KEY (bill_id) REFERENCES Bills(bill_id) ON DELETE CASCADE
);

CREATE TABLE Has_Test_Report (
    p_id INT, report_id INT,
    PRIMARY KEY (p_id, report_id),
    FOREIGN KEY (p_id) REFERENCES Patients(p_id) ON DELETE CASCADE,
    FOREIGN KEY (report_id) REFERENCES Test_Report(report_id) ON DELETE CASCADE
);

CREATE TABLE Assigned (
    p_id INT, r_id INT,
    PRIMARY KEY (p_id, r_id),
    FOREIGN KEY (p_id) REFERENCES Patients(p_id) ON DELETE CASCADE,
    FOREIGN KEY (r_id) REFERENCES Rooms(r_id) ON DELETE CASCADE
);

CREATE TABLE Governs (
    r_id INT, nurse_id INT,
    PRIMARY KEY (r_id, nurse_id),
    FOREIGN KEY (r_id) REFERENCES Rooms(r_id) ON DELETE CASCADE,
    FOREIGN KEY (nurse_id) REFERENCES Nurse(nurse_id) ON DELETE CASCADE
);

CREATE TABLE Maintains (
    receptionist_id INT, record_number INT,
    PRIMARY KEY (receptionist_id, record_number),
    FOREIGN KEY (receptionist_id) REFERENCES Receptionist(receptionist_id) ON DELETE CASCADE,
    FOREIGN KEY (record_number) REFERENCES Records(record_number) ON DELETE CASCADE
);
