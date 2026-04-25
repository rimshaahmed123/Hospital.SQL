DROP DATABASE IF EXISTS HospitalDB;
CREATE DATABASE HospitalDB;
USE HospitalDB;

CREATE TABLE Patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(40),
    gender VARCHAR(15),
    phone VARCHAR(15),
    city VARCHAR(50)
);

CREATE TABLE Doctors (
    doctor_id  INT PRIMARY KEY AUTO_INCREMENT,
    name  VARCHAR(40),
    specialization VARCHAR(40),
    phone VARCHAR(15)
);

CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id  INT,
    appointment_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id)  REFERENCES Doctors(doctor_id)
);

CREATE TABLE Bills (
    bill_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    amount DECIMAL(10,2),
    payment_status VARCHAR(20),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

CREATE TABLE Prescriptions (
    prescription_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id  INT,
    doctor_id  INT,
    medicine VARCHAR(200),
    prescribed_date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id)  REFERENCES Doctors(doctor_id)
);

-- Patients
INSERT INTO Patients (name, gender, phone, city) VALUES
('Ali',    'Male',   '03002222333',  'Lahore'),
('Ahmed',  'Male',   '03133876543',  'Karachi'),
('Ayesha', 'Female', '03257893474',  'Chunian'),
('Alina',  'Female', '03318483838',  'Lahore'),
('Bilal',  'Male',   '033478293839', 'Lahore');

-- Doctors
INSERT INTO Doctors (name, specialization, phone) VALUES
('Dr. Ayesha', 'Cardiologist', '032589574839'),
('Dr. Nimra',  'Physician',    '03219876543'),
('Dr. Ali',    'Urology',      '0302342334');

-- Appointments (Direct IDs)
-- Patients: Ali=1, Ahmed=2, Ayesha=3, Alina=4, Bilal=5
-- Doctors:  Dr.Ayesha=1, Dr.Nimra=2, Dr.Ali=3
INSERT INTO Appointments (patient_id, doctor_id, appointment_date, status) VALUES
(3, 1, '2026-05-20', 'Confirmed'),
(4, 2, '2026-05-21', 'Confirmed'),
(5, 3, '2026-05-22', 'Pending'),
(2, 1, '2026-05-23', 'Cancelled'),
(1, 2, '2026-05-24', 'Confirmed');

-- Bills (Direct IDs)
INSERT INTO Bills (patient_id, amount, payment_status) VALUES
(1, 2500, 'Paid'),
(3, 5500, 'Paid'),
(2, 5000.00, 'Unpaid'),
(5,  570, 'Unpaid'),
(4, 2000, 'Paid');

INSERT INTO Prescriptions (patient_id, doctor_id, medicine, prescribed_date) VALUES
(1, 2, 'Aspirin 75mg, Atorvastatin 20mg', '2026-05-20'),
(2, 1, 'Panadol 500mg, ORS Sachet', '2026-05-21'),
(3, 3, 'Ibuprofen 400mg, Calcium Tablet', '2026-05-22'),
(5, 1, 'Metoprolol 50mg, Amlodipine 5mg', '2026-05-24');

-- Basic Selects
SELECT * FROM Patients;
SELECT * FROM Doctors;
SELECT * FROM Appointments;
SELECT * FROM Bills;
SELECT * FROM Prescriptions;

-- Patients + Appointments
SELECT
    p.patient_id,
    p.name AS patient_name,
    p.city,
    d.name AS doctor_name,
    a.appointment_date,
    a.status
FROM Patients p
JOIN Appointments a ON p.patient_id = a.patient_id
JOIN Doctors d      ON d.doctor_id  = a.doctor_id;

-- Patients + Bills
SELECT
    p.patient_id,
    p.name AS patient_name,
    p.city,
    b.amount,
    b.payment_status
FROM Patients p
JOIN Bills b ON p.patient_id = b.patient_id;

-- Doctors + Appointments
SELECT
    d.doctor_id,
    d.name AS doctor_name,
    d.specialization,
    p.name AS patient_name,
    a.appointment_date,
    a.status
FROM Doctors d
JOIN Appointments a ON d.doctor_id  = a.doctor_id
JOIN Patients p     ON p.patient_id = a.patient_id;

-- Full Hospital Report
SELECT
    p.name AS patient,
    d.name AS doctor,
    d.specialization,
    a.appointment_date,
    a.status
FROM Appointments a
JOIN Patients p ON p.patient_id = a.patient_id
JOIN Doctors d  ON d.doctor_id  = a.doctor_id;

-- View
CREATE OR REPLACE VIEW Patient_Complete_Report AS
SELECT
    p.name    AS patient_name,
    p.city,
    d.name    AS doctor_name,
    a.appointment_date,
    b.amount,
    b.payment_status
FROM Patients p
LEFT JOIN Appointments a ON p.patient_id = a.patient_id
LEFT JOIN Doctors d  ON d.doctor_id  = a.doctor_id
LEFT JOIN Bills b ON p.patient_id = b.patient_id;

SELECT * FROM Patient_Complete_Report;