# Database Normalization – Hospital Management System

## 1. Introduction

Normalization is a database design technique used to organize data into tables properly.

The main goals of normalization are:

- Reduce data redundancy (duplicate data)
- Avoid data inconsistency
- Prevent insertion, deletion, and update anomalies
- Improve database structure
- Maintain data integrity

In this Hospital Management System, normalization is applied to tables such as:

- Patients
- Doctors
- Departments
- Appointments
- Medicines
- Prescriptions
- Bills

---

# 2. Unnormalized Form (UNF)

Before normalization, a table may contain multiple values in a single column.

### Example

| Patient_ID | Patient_Name | Doctor | Medicines |
|------------|--------------|--------|-----------|
| P101 | Rahul | Dr. Kumar | Paracetamol, Amoxicillin |

Here, the `Medicines` column contains multiple values.

This makes searching, updating, and managing data difficult.

Therefore, we need to normalize the table.

---

# 3. First Normal Form (1NF)

A table is in **First Normal Form (1NF)** when:

1. Each column contains atomic (single) values.
2. There are no repeating groups.
3. Each row is uniquely identifiable.

### Before 1NF

| Patient_ID | Patient_Name | Medicines |
|------------|--------------|-----------|
| P101 | Rahul | Paracetamol, Amoxicillin |

The `Medicines` column contains multiple values.

### After 1NF

| Patient_ID | Patient_Name | Medicine |
|------------|--------------|----------|
| P101 | Rahul | Paracetamol |
| P101 | Rahul | Amoxicillin |

Now every cell contains only one value.

Therefore, the table satisfies **1NF**.

---

# 4. Second Normal Form (2NF)

A table is in **Second Normal Form (2NF)** when:

1. It is already in 1NF.
2. It has no partial dependency.

### What is Partial Dependency?

Partial dependency occurs when a non-key attribute depends on only part of a composite primary key.

### Example

Consider an Appointment table:

| Patient_ID | Doctor_ID | Patient_Name | Doctor_Name |
|------------|-----------|--------------|-------------|
| P101 | D01 | Rahul | Dr. Kumar |
| P102 | D02 | Priya | Dr. Sharma |

Suppose:

**Primary Key = (Patient_ID, Doctor_ID)**

But:

- `Patient_Name` depends only on `Patient_ID`
- `Doctor_Name` depends only on `Doctor_ID`

Therefore, there is partial dependency.

### Solution

Separate the tables.

### Patient Table

| Patient_ID | Patient_Name |
|------------|--------------|
| P101 | Rahul |
| P102 | Priya |

### Doctor Table

| Doctor_ID | Doctor_Name |
|-----------|-------------|
| D01 | Dr. Kumar |
| D02 | Dr. Sharma |

### Appointment Table

| Patient_ID | Doctor_ID |
|------------|-----------|
| P101 | D01 |
| P102 | D02 |

Now non-key attributes do not depend on only part of a composite key.

Therefore, the database is in **2NF**.

---

# 5. Third Normal Form (3NF)

A table is in **Third Normal Form (3NF)** when:

1. It is already in 2NF.
2. There is no transitive dependency.

### What is Transitive Dependency?

A transitive dependency occurs when:

**A → B → C**

For example:

- Patient_ID determines Doctor_ID
- Doctor_ID determines Department_ID

Therefore:

**Patient_ID → Doctor_ID → Department_ID**

The `Department_ID` indirectly depends on `Patient_ID`.

### Example

| Doctor_ID | Doctor_Name | Department_ID | Department_Name |
|-----------|-------------|---------------|-----------------|
| D01 | Dr. Kumar | DEP01 | Cardiology |
| D02 | Dr. Sharma | DEP02 | Neurology |

Here:

`Doctor_ID → Department_ID`

and

`Department_ID → Department_Name`

So:

`Doctor_ID → Department_Name`

This is a transitive dependency.

### Solution

Separate the Doctor and Department information.

### Doctor Table

| Doctor_ID | Doctor_Name | Department_ID |
|-----------|-------------|---------------|
| D01 | Dr. Kumar | DEP01 |
| D02 | Dr. Sharma | DEP02 |

### Department Table

| Department_ID | Department_Name |
|---------------|-----------------|
| DEP01 | Cardiology |
| DEP02 | Neurology |

Now the transitive dependency is removed.

Therefore, the tables satisfy **3NF**.

---

# 6. Boyce-Codd Normal Form (BCNF)

BCNF is a stronger version of 3NF.

A table is in **BCNF** when:

> For every functional dependency X → Y, X must be a super key.

In simple words:

**Every determinant must be a candidate key.**

### Example

Consider:

| Patient_ID | Doctor_ID | Room_No |
|------------|-----------|---------|
| P101 | D01 | R101 |
| P102 | D02 | R102 |

Suppose:

- A doctor is assigned to only one room.
- `Doctor_ID → Room_No`

If `Doctor_ID` is not a candidate key of this table, then the table violates BCNF.

### Solution

Separate the information.

### Doctor Table

| Doctor_ID | Room_No |
|-----------|---------|
| D01 | R101 |
| D02 | R102 |

### Appointment Table

| Patient_ID | Doctor_ID |
|------------|-----------|
| P101 | D01 |
| P102 | D02 |

This removes the dependency problem.

Therefore, the database satisfies **BCNF**.

---

# 7. Fourth Normal Form (4NF)

4NF deals with **multivalued dependencies**.

A table is in **Fourth Normal Form (4NF)** when:

1. It is already in BCNF.
2. It has no unwanted multivalued dependencies.

### Example

Suppose a doctor can have multiple:

- Specializations
- Languages

Consider:

| Doctor_ID | Specialization | Language |
|-----------|----------------|----------|
| D01 | Cardiology | English |
| D01 | Cardiology | Hindi |
| D01 | Surgery | English |
| D01 | Surgery | Hindi |

Here, specializations and languages are independent of each other.

This creates unnecessary combinations.

### Solution

Separate them into two tables.

### Doctor Specialization

| Doctor_ID | Specialization |
|-----------|----------------|
| D01 | Cardiology |
| D01 | Surgery |

### Doctor Language

| Doctor_ID | Language |
|-----------|----------|
| D01 | English |
| D01 | Hindi |

Now the multivalued dependency is removed.

Therefore, the tables satisfy **4NF**.

---

# 8. Normalization Applied to Hospital Management System

The Hospital Management System can be divided into several properly normalized tables.

## Patient

| Attribute | Description |
|-----------|-------------|
| Patient_ID | Primary Key |
| Patient_Name | Name of patient |
| Age | Patient age |
| Gender | Patient gender |
| Phone | Contact number |
| Address | Patient address |

---

## Doctor

| Attribute | Description |
|-----------|-------------|
| Doctor_ID | Primary Key |
| Doctor_Name | Name of doctor |
| Specialization | Doctor specialization |
| Department_ID | Foreign Key |

---

## Department

| Attribute | Description |
|-----------|-------------|
| Department_ID | Primary Key |
| Department_Name | Name of department |

---

## Appointment

| Attribute | Description |
|-----------|-------------|
| Appointment_ID | Primary Key |
| Patient_ID | Foreign Key |
| Doctor_ID | Foreign Key |
| Appointment_Date | Date of appointment |
| Appointment_Time | Time of appointment |

---

## Medicine

| Attribute | Description |
|-----------|-------------|
| Medicine_ID | Primary Key |
| Medicine_Name | Name of medicine |
| Price | Medicine price |

---

## Prescription

| Attribute | Description |
|-----------|-------------|
| Prescription_ID | Primary Key |
| Patient_ID | Foreign Key |
| Doctor_ID | Foreign Key |
| Prescription_Date | Date |

---

## Prescription_Medicine

| Attribute | Description |
|-----------|-------------|
| Prescription_ID | Foreign Key |
| Medicine_ID | Foreign Key |
| Quantity | Medicine quantity |
| Dosage | Medicine dosage |

The combination of `Prescription_ID` and `Medicine_ID` can be used as the primary key.

---

# 9. Benefits of Normalization

Normalization provides several advantages to our Hospital Management System.

### 1. Reduces Data Redundancy

The same patient, doctor, or department information does not need to be stored repeatedly.

### 2. Prevents Update Anomaly

If a doctor's information changes, it only needs to be updated in one place.

### 3. Prevents Insertion Anomaly

New doctors or departments can be added without requiring unrelated appointment information.

### 4. Prevents Deletion Anomaly

Deleting an appointment will not accidentally delete important doctor or patient information.

### 5. Improves Data Integrity

Relationships between patients, doctors, departments, medicines, and appointments are maintained using primary and foreign keys.

### 6. Makes Database Maintenance Easier

Data is divided into logically related tables, making the database easier to manage.

---

# 10. Normalization Summary

| Normal Form | Main Requirement | Hospital Example |
|-------------|------------------|------------------|
| 1NF | Atomic values | Separate multiple medicines |
| 2NF | Remove partial dependency | Separate patient and doctor details |
| 3NF | Remove transitive dependency | Separate department information |
| BCNF | Every determinant must be a candidate key | Separate doctor-room assignment |
| 4NF | Remove multivalued dependencies | Separate doctor languages and specializations |

---

# 11. Conclusion

Normalization helps us design a well-structured Hospital Management Database.

The database is divided into related tables such as:

- Patient
- Doctor
- Department
- Appointment
- Medicine
- Prescription
- Prescription_Medicine

By applying 1NF, 2NF, 3NF, BCNF, and 4NF, we reduce redundancy, avoid data anomalies, maintain data integrity, and make the database easier to manage.

Thus, normalization provides an efficient and reliable structure for the Hospital Management System.