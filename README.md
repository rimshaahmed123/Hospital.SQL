# Hospital Management System (SQL Project)

##  Project Overview

The **Hospital Management System** is a SQL project developed using SQL to manage hospital records efficiently. It stores and organizes information related to patients, doctors, appointments, and payments.

This system helps reduce manual work, improves accuracy, and allows easy data retrieval.

---

##  Features

* Store patient information
* Manage doctor records
* Track appointment dates
* Record payment amounts
* Monitor payment status (Paid / Unpaid)
* Retrieve data easily using SQL queries

---

##  Database Structure

| Column Name      | Data Type | Description         |
| ---------------- | --------- | ------------------- |
| patient_name     | VARCHAR   | Name of the patient |
| city             | VARCHAR   | Patient's city      |
| doctor_name      | VARCHAR   | Assigned doctor     |
| appointment_date | DATE      | Appointment date    |
| amount           | DECIMAL   | Fee amount          |
| payment_status   | VARCHAR   | Paid or Unpaid      |

---

##  Sample Data (Output Table)

| Patient Name | City    | Doctor Name | Appointment Date | Amount (PKR) | Payment Status |
| ------------ | ------- | ----------- | ---------------- | ------------ | -------------- |
| Ali          | Lahore  | Dr. Nimra   | 2026-05-24       | 2500         | Paid           |
| Ahmed        | Karachi | Dr. Ayesha  | 2026-05-23       | 5000         | Unpaid         |
| Ayesha       | Chunian | Dr. Ayesha  | 2026-05-20       | 5500         | Paid           |
| Alina        | Lahore  | Dr. Nimra   | 2026-05-21       | 2000         | Paid           |
| Bilal        | Lahore  | Dr. Ali     | 2026-05-22       | 570          | Unpaid         |

---

##  Technologies Used

* SQL (Structured Query Language)
* MySQL / SQL Server

---

##  How to Run

1. Open your SQL software (e.g., MySQL Workbench)
2. Import the `.sql` file
3. Execute the queries
4. Run:

```sql
SELECT * FROM hospital_table;
```

---

## Project Objectives

* To design a structured hospital database
* To practice SQL queries
* To manage real-world hospital data efficiently

---



The output table shows the **final result of the database** after executing the SQL queries.

* Each row represents a **patient record**
* It includes:

  * Patient name and city
  * Assigned doctor
  * Appointment date
  * Fee amount
  * Payment status

### Key Observations:

* Some patients have **Paid** status (e.g., Ali, Ayesha, Alina)
* Some patients have **Unpaid** status (e.g., Ahmed, Bilal)
* Different doctors are assigned to different patients
* Appointment dates are properly recorded

This output proves that the database is working correctly and storing hospital records in an organized way.

##  Output <img width="803" height="174" alt="HOSPITAL OUTPUT" src="https://github.com/user-attachments/assets/6b935e84-50ea-43d0-8373-1ba226302828" />

Agar chaho to main **ER diagram + viva questions + SQL queries explanation** bhi bana deta hoon 👍
