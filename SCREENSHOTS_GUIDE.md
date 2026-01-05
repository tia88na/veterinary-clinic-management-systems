# Screenshots Guide for DBMS Course Bonus Project Report

This document lists all the screenshots you should capture for your final report to demonstrate the functionality of the Veterinary Clinic Management System.

## Setup Screenshots

### 1. Database Connection Success
**Location**: App startup
**Purpose**: Show successful connection to MySQL database
- Screenshot the green success message at the top of the app showing "Successfully connected to MySQL Server version X.X.X"

## Insert Operations Screenshots

### 2. Insert Owner - Empty Form
**Tab**: Insert Data > Insert Owner
**Purpose**: Show the user interface for inserting a new owner
- Screenshot the empty form with all fields visible
- Fields: Owner ID, First Name*, Last Name*, Address, Phone Number, Email

### 3. Insert Owner - Success
**Tab**: Insert Data > Insert Owner
**Purpose**: Demonstrate successful owner insertion
- Fill in the form with sample data:
  - Owner ID: 2000
  - First Name: John
  - Last Name: Doe
  - Address: Istanbul, Kadikoy
  - Phone Number: 5551234567
  - Email: john.doe@email.com
- Click "Add Owner"
- Screenshot the success message: "Query executed successfully. 1 row(s) affected."

### 4. Insert Owner - Error (Duplicate)
**Tab**: Insert Data > Insert Owner
**Purpose**: Show error handling for duplicate primary key
- Try inserting the same Owner ID again
- Screenshot the error message showing duplicate key violation

### 5. Insert Pet - With Owner Dropdown
**Tab**: Insert Data > Insert Pet
**Purpose**: Show foreign key relationship with dropdown populated from OWNERS table
- Screenshot showing the Owner dropdown populated with existing owners
- Sample data:
  - Pet ID: 600
  - Pet Name: Max
  - Species: Dog
  - Breed: Golden Retriever
  - Age: 3
  - Weight: 28.5
  - Color: Golden
  - Owner: Select from dropdown (e.g., "John Doe")
- Screenshot after successful insertion

### 6. Insert Appointment - Multiple Dropdowns
**Tab**: Insert Data > Insert Appointment
**Purpose**: Demonstrate multiple foreign key selections
- Screenshot showing all three dropdowns populated:
  - Pet dropdown (from PETS table)
  - Veterinarian dropdown (from VETERINARIANS table)
  - Owner dropdown (from OWNERS table)
- Sample data:
  - Appointment ID: 7000
  - Pet: Select from dropdown
  - Veterinarian: Select from dropdown
  - Owner: Select from dropdown
  - Date: Today's date
  - Time: 10:00 AM
  - Status: Scheduled
- Screenshot after successful insertion

## Update Operations Screenshots

### 7. Update Owner Contact - Before
**Tab**: Update Data > Update Owner Contact
**Purpose**: Show the update interface and initial data
- First, take a screenshot of current owner data using a query (you can run: SELECT * FROM OWNERS WHERE OwnerID = 1001)
- Then screenshot the update form filled with:
  - Owner ID: 1001
  - New Phone Number: 5559998877
  - New Email: updated.email@example.com

### 8. Update Owner Contact - After
**Tab**: Update Data > Update Owner Contact
**Purpose**: Confirm the update was successful
- Screenshot the success message
- Optionally query the same owner to show updated values

### 9. Update Medication Stock - Add to Stock
**Tab**: Update Data > Update Medication Stock
**Purpose**: Demonstrate adding stock to existing quantity
- First, query current medication: SELECT * FROM MEDICATIONS WHERE MedicationID = 401
- Screenshot showing:
  - Medication ID: 401
  - Update Mode: "Add to Stock" selected
  - Quantity: 50
- Screenshot the result showing:
  - Success message
  - Updated medication table displayed below with new StockQuantity

### 10. Update Medication Stock - Set New Stock
**Tab**: Update Data > Update Medication Stock
**Purpose**: Show setting absolute stock value
- Screenshot with:
  - Medication ID: 402
  - Update Mode: "Set New Stock" selected
  - Quantity: 100
- Screenshot the success result with updated data table

### 11. Update Appointment - Reschedule
**Tab**: Update Data > Update Appointment
**Purpose**: Demonstrate updating appointment date/time and status
- Screenshot showing:
  - Appointment ID: 6001
  - Update Date/Time: checked
  - New Date: Future date
  - New Time: 14:00
  - Update Status: checked
  - New Status: "Scheduled"
- Screenshot the success message and updated appointment data table

## Query Operations Screenshots

### 12. Daily Appointments Query
**Tab**: Queries > Daily Appointments
**Purpose**: Show JOIN query results with data from multiple tables
- Select a date with appointments (e.g., 2025-11-17 or 2025-12-19)
- Screenshot the results table showing:
  - AppointmentID, Date, Time, Status
  - PetName, OwnerName, VetName (from JOINed tables)
- Include the success message showing count of appointments found

### 13. Low Stock Medications Query
**Tab**: Queries > Low Stock Medications
**Purpose**: Demonstrate filtering with user input
- Set threshold: 100
- Screenshot showing:
  - Input field with threshold value
  - Results table with: MedicationID, Name, StockQuantity, ExpirationDate
  - Warning message indicating number of medications found
- Highlight medications with critically low stock

### 14. Pet History Query
**Tab**: Queries > Pet History
**Purpose**: Show complex multi-table JOIN (Appointments -> Treatments -> Prescriptions -> Medications)
- Select a pet from dropdown (e.g., "Mocha" or any pet with treatment history)
- Screenshot the comprehensive results showing:
  - Appointment details (Date, Time, Status, VetName)
  - Treatment details (Description, Diagnosis, Start/End dates)
  - Prescription details (Medication Name, Dosage, Duration)
- This demonstrates the full medical history tracking capability

### 15. Owner Total Spent Query
**Tab**: Queries > Owner Total Spent
**Purpose**: Show aggregate function (SUM) with JOIN
- Select an owner from dropdown (e.g., "Zehra Ozcan" - OwnerID 1001)
- Screenshot showing TWO results:
  a) Summary table with:
     - OwnerID, OwnerName, Email, Phone_no
     - TotalSpent (sum of payments)
     - TotalPayments (count)
  b) Detailed payments table below showing:
     - Individual PaymentID, AppointmentID, Amount
     - PaymentDate, PaymentMethod, PaymentStatus
     - AppointmentDate, PetName

## Error Handling Screenshots

### 16. Validation Error
**Tab**: Any Insert tab
**Purpose**: Show client-side validation
- Try submitting Insert Owner form without filling First Name
- Screenshot the error message: "First Name and Last Name are required!"

### 17. Database Error
**Tab**: Any Update tab
**Purpose**: Show handling of non-existent record
- Try updating a non-existent Owner ID (e.g., 9999)
- Screenshot the warning: "No owner found with ID 9999"

## Additional Recommended Screenshots

### 18. Tab Structure Overview
**Purpose**: Show the overall application structure
- Screenshot showing the three main tabs: "Insert Data", "Update Data", "Queries"
- Show sub-tabs visible in any one tab

### 19. Data Table Display
**Purpose**: Demonstrate pandas DataFrame display
- Any query result showing Streamlit's dataframe widget
- Highlight the clean, sortable table format

## Tips for Taking Screenshots

1. **Clear Browser View**: Maximize browser window, hide unnecessary toolbars
2. **Zoom Level**: Use 100% or 90% zoom for best visibility
3. **Data Visibility**: Ensure all columns and relevant data are visible
4. **Success/Error Messages**: Make sure messages are fully visible in the screenshot
5. **Before/After**: For updates, show both the before state and after state
6. **Timestamp**: Some screenshots may show dates - use consistent dates that match your data

## Suggested Organization in Report

**Section 1: Introduction & Setup**
- Screenshot 1 (Database Connection)
- Screenshot 18 (Tab Structure)

**Section 2: Insert Operations**
- Screenshots 2-6 (All insert operations)
- Screenshot 16 (Validation error)

**Section 3: Update Operations**  
- Screenshots 7-11 (All update operations)
- Screenshot 17 (Non-existent record)

**Section 4: Query Operations**
- Screenshots 12-15 (All queries)
- Screenshot 19 (Data table display)

**Section 5: Security & Best Practices**
- Mention parameterized queries (show code snippet from db.py)
- Environment variables (.env file usage)
- Error handling examples

## Code Snippets to Include

1. Parameterized query example from db.py
2. Environment variable loading from db.py
3. One complex query from app.py (e.g., Pet History query)
4. Form validation example from app.py

Total recommended screenshots: 15-19
