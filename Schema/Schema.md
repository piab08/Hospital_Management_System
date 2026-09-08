# Hospital Management System - Database Schema

## 1. Patients

| Attribute | Data Type | Key |
|---|---|---|
| P_ID | NUMBER | Primary Key |
| DOB | DATE | — |
| Age | NUMBER | — |
| Name | VARCHAR2(100) | — |
| Mobile Number | VARCHAR2(15) | — |
| Gender | VARCHAR2(10) | — |

---

## 2. Doctor

| Attribute | Data Type | Key |
|---|---|---|
| Qualification | VARCHAR2(100) | — |
| Department | VARCHAR2(100) | — |
| Name | VARCHAR2(100) | — |

---

## 3. Nurse

| Attribute | Data Type | Key |
|---|---|---|
| P_ID | NUMBER | Foreign Key |
| Name | VARCHAR2(100) | — |
| R_ID | NUMBER | Foreign Key |
| Mobile Number | VARCHAR2(15) | — |

---

## 4. Receptionist

| Attribute | Data Type | Key |
|---|---|---|
| Receptionist Id | NUMBER | Primary Key |

---

## 5. Bills

| Attribute | Data Type | Key |
|---|---|---|
| P_ID | NUMBER | Foreign Key |
| Bill ID | NUMBER | Primary Key |
| Amount | NUMBER(10,2) | — |

---

## 6. Test Report

| Attribute | Data Type | Key |
|---|---|---|
| P_ID | NUMBER | Foreign Key |
| R_ID | NUMBER | Foreign Key |
| Test Type | VARCHAR2(100) | — |
| Result | VARCHAR2(255) | — |

---

## 7. Rooms

| Attribute | Data Type | Key |
|---|---|---|
| R_ID | NUMBER | Primary Key |
| Availability | VARCHAR2(20) | — |
| Capacity | NUMBER | — |
| Type | VARCHAR2(50) | — |

---

## 8. Records

| Attribute | Data Type | Key |
|---|---|---|
| Record Number | NUMBER | Primary Key |
| Application Number | VARCHAR2(50) | — |

---

# Relationships

## 1. Consults

**Patients — Consults — Doctor**

The Consults relationship connects Patients with Doctor.

| Attribute | Key |
|---|---|
| P_ID | Foreign Key |
| Doctor Name | Foreign Key |

---

## 2. Pays

**Patients — Pays — Bills**

The Pays relationship connects Patients with Bills.

| Attribute | Key |
|---|---|
| P_ID | Foreign Key |
| Bill ID | Foreign Key |

---

## 3. Has

**Patients — Has — Test Report**

The Has relationship connects Patients with Test Report.

| Attribute | Key |
|---|---|
| P_ID | Foreign Key |
| R_ID | Foreign Key |

---

## 4. Assigned

**Patients — Assigned — Rooms**

The Assigned relationship connects Patients with Rooms.

| Attribute | Key |
|---|---|
| P_ID | Foreign Key |
| R_ID | Foreign Key |

---

## 5. Governs

**Rooms — Governs — Nurse**

The Governs relationship connects Rooms with Nurse.

| Attribute | Key |
|---|---|
| R_ID | Foreign Key |
| P_ID | Foreign Key |

---

## 6. Maintains

**Receptionist — Maintains — Records**

The Maintains relationship connects Receptionist with Records.

| Attribute | Key |
|---|---|
| Record Number | Foreign Key |
| Application Number | Foreign Key |
