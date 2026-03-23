#  Hospital Management Database System

##  Introduction

The Hospital Management Database System is designed to efficiently manage hospital operations such as patient records, doctor details, visits, and billing information. This project uses a relational database approach to organize and retrieve data effectively, reducing manual effort and improving accuracy.

---

##  Abstract

This project demonstrates the use of MySQL to build a structured and scalable hospital database system. It includes multiple interconnected tables such as Patients, Doctors, Visits, and Bills. The system supports data insertion, querying, automated billing using stored procedures, and status updates using triggers. It provides a practical implementation of database concepts in a real-world healthcare scenario.

---

##  Tools Used

* **MySQL** – Database management system
* **DBeaver** – Database GUI tool for managing and visualizing data

---

##  Steps Involved in Building the Project

### 1. Database Design

* Created database `HospitalDB`
* Designed tables:

  * Patients
  * Doctors
  * Visits
  * Bills
* Established relationships using foreign keys

### 2. Data Insertion

* Inserted sample records (50 entries total)
* Ensured realistic and meaningful data

### 3. Query Implementation

* Retrieved appointment details using JOIN queries
* Checked billing and payment status
* Generated patient visit reports

### 4. Stored Procedures

* Created procedure `GenerateBill`
* Automatically calculates and inserts billing data based on doctor fees

### 5. Triggers

* Implemented trigger `AfterPaymentUpdate`
* Automatically updates patient status to "Discharged" when bill is paid

### 6. Report Generation

* Visit Report: Displays patient, doctor, diagnosis, and visit date
* Billing Report: Shows total amount and payment status

---

##  Key Features

* Efficient patient and doctor data management
* Automated billing system
* Real-time status updates using triggers
* Structured and normalized database design
* Easy data retrieval using SQL queries

---

##  Conclusion

The Hospital Management Database System successfully demonstrates how database technologies can be used to manage real-world hospital operations. By integrating tables, queries, procedures, and triggers, the system ensures efficiency, accuracy, and automation. This project provides a strong foundation for building more advanced healthcare management applications.

---

##  Deliverables

✔ SQL Schema
✔ Sample Data (50 Records)
✔ Queries
✔ Stored Procedures
✔ Triggers
✔ Reports

---
