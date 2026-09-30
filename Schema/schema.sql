-- Hospital Management System
-- Database Schema

-- 1. PATIENTS
CREATE TABLE Patients (
    p_id NUMBER PRIMARY KEY,
    dob DATE NOT NULL,
    age NUMBER,
    name VARCHAR2(100) NOT NULL,
    mobile_number VARCHAR2(15),
    gender VARCHAR2(10)
);


-- 2. ROOMS
CREATE TABLE Rooms (
    r_id NUMBER PRIMARY KEY,
    availability VARCHAR2(20),
    capacity NUMBER,
    type VARCHAR2(50)
);


-- 3. DOCTOR
CREATE TABLE Doctor (
    name VARCHAR2(100) NOT NULL,
    qualification VARCHAR2(100),
    department VARCHAR2(100),
    r_id NUMBER PRIMARY KEY,

    CONSTRAINT fk_doctor_room
        FOREIGN KEY (r_id)
        REFERENCES Rooms(r_id)
);


-- 4. NURSE
CREATE TABLE Nurse (
    nurse_id NUMBER PRIMARY KEY,
    p_id NUMBER,
    name VARCHAR2(100) NOT NULL,
    mobile_number VARCHAR2(15),

    CONSTRAINT fk_nurse_patient
        FOREIGN KEY (p_id)
        REFERENCES Patients(p_id)
);


-- 5. RECEPTIONIST
CREATE TABLE Receptionist (
    receptionist_id NUMBER PRIMARY KEY
);


-- 6. BILLS
CREATE TABLE Bills (
    bill_id NUMBER PRIMARY KEY,
    p_id NUMBER NOT NULL,
    amount NUMBER(10,2) NOT NULL,

    CONSTRAINT fk_bill_patient
        FOREIGN KEY (p_id)
        REFERENCES Patients(p_id)
);


-- 7. TEST REPORT
CREATE TABLE Test_Report (
    report_id NUMBER PRIMARY KEY,
    p_id NUMBER NOT NULL,
    r_id NUMBER NOT NULL,
    test_type VARCHAR2(100),
    result VARCHAR2(255),

    CONSTRAINT fk_test_patient
        FOREIGN KEY (p_id)
        REFERENCES Patients(p_id),

    CONSTRAINT fk_test_room
        FOREIGN KEY (r_id)
        REFERENCES Rooms(r_id)
);


-- 8. RECORDS
CREATE TABLE Records (
    record_number NUMBER PRIMARY KEY,
    application_number VARCHAR2(50) NOT NULL
);


-- 9. CONSULTS RELATIONSHIP
CREATE TABLE Consults (
    p_id NUMBER NOT NULL,
    doctor_id NUMBER NOT NULL,

    CONSTRAINT pk_consults
        PRIMARY KEY (p_id, doctor_id),

    CONSTRAINT fk_consults_patient
        FOREIGN KEY (p_id)
        REFERENCES Patients(p_id),

    CONSTRAINT fk_consults_doctor
        FOREIGN KEY (doctor_id)
        REFERENCES Doctor(doctor_id)
);


-- 10. PAYS RELATIONSHIP
CREATE TABLE Pays (
    p_id NUMBER NOT NULL,
    bill_id NUMBER NOT NULL,

    CONSTRAINT pk_pays
        PRIMARY KEY (p_id, bill_id),

    CONSTRAINT fk_pays_patient
        FOREIGN KEY (p_id)
        REFERENCES Patients(p_id),

    CONSTRAINT fk_pays_bill
        FOREIGN KEY (bill_id)
        REFERENCES Bills(bill_id)
);


-- 11. HAS RELATIONSHIP
CREATE TABLE Has_Test_Report (
    p_id NUMBER NOT NULL,
    report_id NUMBER NOT NULL,

    CONSTRAINT pk_has_test_report
        PRIMARY KEY (p_id, report_id),

    CONSTRAINT fk_has_patient
        FOREIGN KEY (p_id)
        REFERENCES Patients(p_id),

    CONSTRAINT fk_has_report
        FOREIGN KEY (report_id)
        REFERENCES Test_Report(report_id)
);


-- 12. ASSIGNED RELATIONSHIP
CREATE TABLE Assigned (
    p_id NUMBER NOT NULL,
    r_id NUMBER NOT NULL,

    CONSTRAINT pk_assigned
        PRIMARY KEY (p_id, r_id),

    CONSTRAINT fk_assigned_patient
        FOREIGN KEY (p_id)
        REFERENCES Patients(p_id),

    CONSTRAINT fk_assigned_room
        FOREIGN KEY (r_id)
        REFERENCES Rooms(r_id)
);


-- 13. GOVERNS RELATIONSHIP
CREATE TABLE Governs (
    r_id NUMBER NOT NULL,
    nurse_id NUMBER NOT NULL,

    CONSTRAINT pk_governs
        PRIMARY KEY (r_id, nurse_id),

    CONSTRAINT fk_governs_room
        FOREIGN KEY (r_id)
        REFERENCES Rooms(r_id),

    CONSTRAINT fk_governs_nurse
        FOREIGN KEY (nurse_id)
        REFERENCES Nurse(nurse_id)
);


-- 14. MAINTAINS RELATIONSHIP
CREATE TABLE Maintains (
    receptionist_id NUMBER NOT NULL,
    record_number NUMBER NOT NULL,

    CONSTRAINT pk_maintains
        PRIMARY KEY (receptionist_id, record_number),

    CONSTRAINT fk_maintains_receptionist
        FOREIGN KEY (receptionist_id)
        REFERENCES Receptionist(receptionist_id),

    CONSTRAINT fk_maintains_record
        FOREIGN KEY (record_number)
        REFERENCES Records(record_number)
);
