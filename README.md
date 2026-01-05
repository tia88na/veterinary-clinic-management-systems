Veterinary Clinic Management System
A Streamlit-based web application for managing veterinary clinic operations including owners, pets, appointments, medications, and more.

Features
Insert Operations
Add Owner: Insert new pet owners with contact information
Add Pet: Register new pets with owner assignment via dropdown
Add Appointment: Schedule appointments with pet, vet, and owner selection
Update Operations
Update Owner Contact: Modify phone number and email for existing owners
Update Medication Stock: Add to or set new stock quantities for medications
Update Appointment: Reschedule appointments and update their status
Query Operations
Daily Appointments: View all appointments for a specific date with pet, owner, and vet details
Low Stock Medications: Find medications below a specified stock threshold
Pet History: View complete medical history for a specific pet (appointments, treatments, prescriptions)
Owner Total Spent: Calculate total payments made by an owner with detailed payment history
Prerequisites
Python 3.8 or higher
MySQL Server (8.0 or higher recommended)
MySQL database with the veterinary clinic schema loaded
Installation
Clone the repository (if not already cloned)

git clone https://github.com/tia88na/veterinary-clinic-management-systems.git
cd veterinary-clinic-management-systems
Install dependencies

pip install -r requirements.txt
Set up the database

Ensure MySQL Server is running
Create the database using script.sql:
mysql -u root -p < script.sql
Load the sample data using Untitled.sql:
mysql -u root -p veterinary_clinic < Untitled.sql
Note: If your database was created as veterynary_clinic (with typo), use that name in your .env file.

Configure environment variables

Copy the example environment file:
cp .env.example .env
Edit .env and add your MySQL credentials:
DB_HOST=localhost
DB_PORT=3306
DB_USER=root
DB_PASSWORD=your_actual_password
DB_NAME=veterinary_clinic
Running the Application
streamlit run app.py
The application will open in your default web browser at http://localhost:8501

Usage Guide
Insert Tab
Navigate to the "Insert Data" tab
Choose the appropriate sub-tab (Owner, Pet, or Appointment)
Fill in the required fields (marked with *)
Click the submit button
Success or error messages will be displayed
Update Tab
Navigate to the "Update Data" tab
Choose the operation (Owner Contact, Medication Stock, or Appointment)
Enter the ID of the record to update
Provide new values
Submit the form
Queries Tab
Navigate to the "Queries" tab
Select the query type
Provide any required parameters (date, threshold, selection from dropdown)
Click the button to execute the query
Results will be displayed in a table
Project Structure
veterinary-clinic-management-systems/
├── app.py              # Main Streamlit application
├── db.py               # Database connection and query helpers
├── requirements.txt    # Python dependencies
├── .env.example        # Example environment variables
├── .env               # Your actual credentials (not committed)
├── script.sql         # Database schema (DDL)
├── Untitled.sql       # Sample data (DML)
└── README.md          # This file
Database Schema
The application uses the following main tables:

OWNERS: Pet owner information
PETS: Pet details with foreign key to OWNERS
VETERINARIANS: Veterinarian information
APPOINTMENTS: Scheduled appointments
TREATMENTS: Medical treatments linked to appointments
PRESCRIPTIONS: Medication prescriptions for treatments
MEDICATIONS: Available medications and stock
PAYMENTS: Payment records for appointments
STAFF: Clinic staff information
Security Features
Environment Variables: Database credentials stored securely in .env file
Parameterized Queries: All SQL queries use parameterization to prevent SQL injection
Input Validation: Form inputs are validated before database operations
Error Handling: Comprehensive error handling with user-friendly messages
Screenshots for Report
To document the application for your DBMS course bonus project, take screenshots of:

Insert Operations:

Successful owner insertion
Pet insertion with owner dropdown selection
Appointment insertion with all dropdowns populated
Update Operations:

Owner contact update with before/after data
Medication stock update showing new quantity
Appointment reschedule with updated status
Query Results:

Daily appointments table for a specific date
Low stock medications list
Complete pet medical history
Owner total spent summary with payment details
Error Handling:

Duplicate key error (e.g., inserting same OwnerID twice)
Required field validation error
Database connection status
Troubleshooting
Connection Issues
Verify MySQL server is running: mysql -u root -p
Check credentials in .env file
Ensure database name matches (veterinary_clinic vs veterynary_clinic)
Module Not Found
pip install -r requirements.txt
Port Already in Use
If port 8501 is already in use, run on a different port:

streamlit run app.py --server.port 8502
Technology Stack
Frontend: Streamlit (Python web framework)
Backend: Python 3.8+
Database: MySQL 8.0+
Libraries:
mysql-connector-python (MySQL connection)
pandas (Data manipulation)
python-dotenv (Environment variables)
Author
DBMS Course Bonus Project - Veterinary Clinic Management and Treatment Tracking System

License
This project is created for educational purposes as part of a DBMS course bonus assignment.
