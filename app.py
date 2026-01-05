"""
Veterinary Clinic Management System - Streamlit Interface
A DBMS course bonus project for managing veterinary clinic operations.
"""

import streamlit as st
import pandas as pd
from datetime import datetime, date, time
import db

# Page configuration
st.set_page_config(
    page_title="Veterinary Clinic Management System",
    page_icon="🐾",
    layout="wide"
)

st.title("🐾 Veterinary Clinic Management System")

# Test database connection on startup
conn_test = db.test_connection()
if conn_test['success']:
    st.success(conn_test['message'])
else:
    st.error(conn_test['message'])
    st.stop()

# Create tabs for different operations
tab_insert, tab_update, tab_queries = st.tabs(["📝 Insert Data", "✏️ Update Data", "🔍 Queries"])

# ============================================================================
# INSERT TAB
# ============================================================================
with tab_insert:
    st.header("Insert New Records")
    
    # Create sub-tabs for different insert operations
    insert_owner_tab, insert_pet_tab, insert_appointment_tab = st.tabs([
        "Insert Owner", "Insert Pet", "Insert Appointment"
    ])
    
    # --- INSERT OWNER ---
    with insert_owner_tab:
        st.subheader("Add New Owner")
        
        # Get next available Owner ID
        next_owner_id = db.get_next_id("OWNERS", "OwnerID")
        
        with st.form("insert_owner_form"):
            col1, col2 = st.columns(2)
            with col1:
                owner_id = st.number_input("Owner ID", min_value=1, step=1, value=next_owner_id, help="Suggested next ID based on existing data")
                first_name = st.text_input("First Name*")
                last_name = st.text_input("Last Name*")
                address = st.text_input("Address")
            with col2:
                phone_no = st.text_input("Phone Number", placeholder="5301112233")
                email = st.text_input("Email", placeholder="example@email.com")
            
            submit_owner = st.form_submit_button("Add Owner")
            
            if submit_owner:
                if not first_name or not last_name:
                    st.error("First Name and Last Name are required!")
                else:
                    query = """
                    INSERT INTO OWNERS (OwnerID, FirstName, LastName, Address, Phone_no, Email)
                    VALUES (%s, %s, %s, %s, %s, %s)
                    """
                    params = (owner_id, first_name, last_name, address or None, phone_no or None, email or None)
                    result = db.run_execute(query, params)
                    
                    if result['success']:
                        st.success(result['message'])
                    else:
                        st.error(result['message'])
    
    # --- INSERT PET ---
    with insert_pet_tab:
        st.subheader("Add New Pet")
        
        # Fetch owners for dropdown
        owners_df = db.run_select("SELECT OwnerID, CONCAT(FirstName, ' ', LastName) AS OwnerName FROM OWNERS ORDER BY OwnerID")
        
        if owners_df is not None and not owners_df.empty:
            # Get next available Pet ID
            next_pet_id = db.get_next_id("PETS", "PetID")
            
            with st.form("insert_pet_form"):
                col1, col2 = st.columns(2)
                with col1:
                    pet_id = st.number_input("Pet ID", min_value=1, step=1, value=next_pet_id, help="Suggested next ID based on existing data")
                    pet_name = st.text_input("Pet Name*")
                    species = st.text_input("Species*", placeholder="Dog, Cat, Bird, etc.")
                    breed = st.text_input("Breed")
                with col2:
                    age = st.number_input("Age", min_value=0, max_value=50, step=1, value=1)
                    weight = st.number_input("Weight (kg)", min_value=0.0, max_value=999.99, step=0.1, value=5.0, format="%.2f")
                    color = st.text_input("Color")
                    
                    # Owner dropdown
                    owner_options = dict(zip(owners_df['OwnerName'], owners_df['OwnerID']))
                    selected_owner = st.selectbox("Owner*", options=list(owner_options.keys()))
                
                submit_pet = st.form_submit_button("Add Pet")
                
                if submit_pet:
                    if not pet_name or not species or not selected_owner:
                        st.error("Pet Name, Species, and Owner are required!")
                    else:
                        owner_id_fk = owner_options[selected_owner]
                        query = """
                        INSERT INTO PETS (PetID, Name, Species, Breed, Age, Weight, Color, OwnerID)
                        VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
                        """
                        params = (pet_id, pet_name, species, breed or None, age or None, weight or None, color or None, owner_id_fk)
                        result = db.run_execute(query, params)
                        
                        if result['success']:
                            st.success(result['message'])
                        else:
                            st.error(result['message'])
        else:
            st.warning("No owners found in the database. Please add an owner first.")
    
    # --- INSERT APPOINTMENT ---
    with insert_appointment_tab:
        st.subheader("Add New Appointment")
        
        # Fetch pets, vets, and owners for dropdowns
        pets_df = db.run_select("SELECT PetID, Name FROM PETS ORDER BY PetID")
        vets_df = db.run_select("SELECT VetID, CONCAT(FirstName, ' ', LastName) AS VetName FROM VETERINARIANS ORDER BY VetID")
        owners_df = db.run_select("SELECT OwnerID, CONCAT(FirstName, ' ', LastName) AS OwnerName FROM OWNERS ORDER BY OwnerID")
        
        if pets_df is not None and not pets_df.empty and vets_df is not None and not vets_df.empty and owners_df is not None and not owners_df.empty:
            # Get next available Appointment ID
            next_appt_id = db.get_next_id("APPOINTMENTS", "AppointmentID")
            
            with st.form("insert_appointment_form"):
                col1, col2 = st.columns(2)
                with col1:
                    appt_id = st.number_input("Appointment ID", min_value=1, step=1, value=next_appt_id, help="Suggested next ID based on existing data")
                    
                    # Pet dropdown
                    pet_options = dict(zip(pets_df['Name'], pets_df['PetID']))
                    selected_pet = st.selectbox("Pet*", options=list(pet_options.keys()))
                    
                    # Vet dropdown
                    vet_options = dict(zip(vets_df['VetName'], vets_df['VetID']))
                    selected_vet = st.selectbox("Veterinarian*", options=list(vet_options.keys()))
                    
                    # Owner dropdown
                    owner_options = dict(zip(owners_df['OwnerName'], owners_df['OwnerID']))
                    selected_owner = st.selectbox("Owner*", options=list(owner_options.keys()))
                
                with col2:
                    appt_date = st.date_input("Appointment Date*", value=date.today())
                    appt_time = st.time_input("Appointment Time*", value=time(9, 0))
                    status = st.selectbox("Status*", options=["Scheduled", "Completed", "Canceled"])
                
                submit_appointment = st.form_submit_button("Add Appointment")
                
                if submit_appointment:
                    pet_id_fk = pet_options[selected_pet]
                    vet_id_fk = vet_options[selected_vet]
                    owner_id_fk = owner_options[selected_owner]
                    
                    query = """
                    INSERT INTO APPOINTMENTS (AppointmentID, PetID, VetID, OwnerID, Date, Time, Status)
                    VALUES (%s, %s, %s, %s, %s, %s, %s)
                    """
                    params = (appt_id, pet_id_fk, vet_id_fk, owner_id_fk, appt_date, appt_time, status)
                    result = db.run_execute(query, params)
                    
                    if result['success']:
                        st.success(result['message'])
                    else:
                        st.error(result['message'])
        else:
            st.warning("Please ensure Pets, Veterinarians, and Owners exist in the database.")

# ============================================================================
# UPDATE TAB
# ============================================================================
with tab_update:
    st.header("Update Existing Records")
    
    # Create sub-tabs for different update operations
    update_owner_tab, update_medication_tab, update_appointment_tab = st.tabs([
        "Update Owner Contact", "Update Medication Stock", "Update Appointment"
    ])
    
    # --- UPDATE OWNER CONTACT ---
    with update_owner_tab:
        st.subheader("Update Owner Contact Information")
        with st.form("update_owner_form"):
            owner_id_update = st.number_input("Owner ID*", min_value=1, step=1, value=1001)
            new_phone = st.text_input("New Phone Number", placeholder="Leave empty to keep current")
            new_email = st.text_input("New Email", placeholder="Leave empty to keep current")
            
            submit_update_owner = st.form_submit_button("Update Owner Contact")
            
            if submit_update_owner:
                if not new_phone and not new_email:
                    st.warning("Please provide at least one field to update.")
                else:
                    # Build UPDATE query with explicit field mapping for safety
                    params = []
                    
                    # Use conditional logic to build query safely
                    if new_phone and new_email:
                        query = "UPDATE OWNERS SET Phone_no = %s, Email = %s WHERE OwnerID = %s"
                        params = [new_phone, new_email, owner_id_update]
                    elif new_phone:
                        query = "UPDATE OWNERS SET Phone_no = %s WHERE OwnerID = %s"
                        params = [new_phone, owner_id_update]
                    else:  # new_email only
                        query = "UPDATE OWNERS SET Email = %s WHERE OwnerID = %s"
                        params = [new_email, owner_id_update]
                    
                    result = db.run_execute(query, tuple(params))
                    
                    if result['success']:
                        if result['rowcount'] > 0:
                            st.success(result['message'])
                        else:
                            st.warning(f"No owner found with ID {owner_id_update}")
                    else:
                        st.error(result['message'])
    
    # --- UPDATE MEDICATION STOCK ---
    with update_medication_tab:
        st.subheader("Update Medication Stock Quantity")
        with st.form("update_medication_form"):
            med_id = st.number_input("Medication ID*", min_value=1, step=1, value=401)
            update_mode = st.radio("Update Mode", options=["Add to Stock", "Set New Stock"])
            quantity = st.number_input("Quantity", min_value=0, step=1, value=10)
            
            submit_update_med = st.form_submit_button("Update Medication")
            
            if submit_update_med:
                if update_mode == "Add to Stock":
                    query = "UPDATE MEDICATIONS SET StockQuantity = StockQuantity + %s WHERE MedicationID = %s"
                else:  # Set New Stock
                    query = "UPDATE MEDICATIONS SET StockQuantity = %s WHERE MedicationID = %s"
                
                result = db.run_execute(query, (quantity, med_id))
                
                if result['success']:
                    if result['rowcount'] > 0:
                        st.success(result['message'])
                        # Show updated medication info
                        med_info = db.run_select("SELECT * FROM MEDICATIONS WHERE MedicationID = %s", (med_id,))
                        if med_info is not None and not med_info.empty:
                            st.dataframe(med_info, use_container_width=True)
                    else:
                        st.warning(f"No medication found with ID {med_id}")
                else:
                    st.error(result['message'])
    
    # --- UPDATE APPOINTMENT ---
    with update_appointment_tab:
        st.subheader("Update Appointment Status and/or Reschedule")
        with st.form("update_appointment_form"):
            appt_id_update = st.number_input("Appointment ID*", min_value=1, step=1, value=6001)
            
            col1, col2 = st.columns(2)
            with col1:
                update_date = st.checkbox("Update Date/Time")
                if update_date:
                    new_date = st.date_input("New Date", value=date.today())
                    new_time = st.time_input("New Time", value=time(10, 0))
            
            with col2:
                update_status = st.checkbox("Update Status")
                if update_status:
                    new_status = st.selectbox("New Status", options=["Scheduled", "Completed", "Canceled"])
            
            submit_update_appt = st.form_submit_button("Update Appointment")
            
            if submit_update_appt:
                if not update_date and not update_status:
                    st.warning("Please select at least one field to update.")
                else:
                    # Build UPDATE query with explicit field mapping for safety
                    params = []
                    
                    # Use conditional logic to build query safely
                    if update_date and update_status:
                        query = "UPDATE APPOINTMENTS SET Date = %s, Time = %s, Status = %s WHERE AppointmentID = %s"
                        params = [new_date, new_time, new_status, appt_id_update]
                    elif update_date:
                        query = "UPDATE APPOINTMENTS SET Date = %s, Time = %s WHERE AppointmentID = %s"
                        params = [new_date, new_time, appt_id_update]
                    else:  # update_status only
                        query = "UPDATE APPOINTMENTS SET Status = %s WHERE AppointmentID = %s"
                        params = [new_status, appt_id_update]
                    
                    result = db.run_execute(query, tuple(params))
                    
                    if result['success']:
                        if result['rowcount'] > 0:
                            st.success(result['message'])
                            # Show updated appointment info
                            appt_info = db.run_select("SELECT * FROM APPOINTMENTS WHERE AppointmentID = %s", (appt_id_update,))
                            if appt_info is not None and not appt_info.empty:
                                st.dataframe(appt_info, use_container_width=True)
                        else:
                            st.warning(f"No appointment found with ID {appt_id_update}")
                    else:
                        st.error(result['message'])

# ============================================================================
# QUERIES TAB
# ============================================================================
with tab_queries:
    st.header("Data Queries")
    
    # Create sub-tabs for different queries
    query_daily_tab, query_lowstock_tab, query_pet_history_tab, query_owner_spent_tab = st.tabs([
        "Daily Appointments", "Low Stock Medications", "Pet History", "Owner Total Spent"
    ])
    
    # --- DAILY APPOINTMENTS ---
    with query_daily_tab:
        st.subheader("Daily Appointments")
        selected_date = st.date_input("Select Date", value=date.today(), key="daily_appt_date")
        
        if st.button("Show Appointments", key="show_daily_appt"):
            query = """
            SELECT 
                a.AppointmentID,
                a.Date,
                a.Time,
                a.Status,
                p.Name AS PetName,
                CONCAT(o.FirstName, ' ', o.LastName) AS OwnerName,
                CONCAT(v.FirstName, ' ', v.LastName) AS VetName
            FROM APPOINTMENTS a
            JOIN PETS p ON a.PetID = p.PetID
            JOIN OWNERS o ON a.OwnerID = o.OwnerID
            JOIN VETERINARIANS v ON a.VetID = v.VetID
            WHERE a.Date = %s
            ORDER BY a.Time
            """
            result = db.run_select(query, (selected_date,))
            
            if result is not None and not result.empty:
                st.success(f"Found {len(result)} appointment(s) on {selected_date}")
                st.dataframe(result, use_container_width=True)
            else:
                st.info(f"No appointments found for {selected_date}")
    
    # --- LOW STOCK MEDICATIONS ---
    with query_lowstock_tab:
        st.subheader("Low Stock Medications")
        threshold = st.number_input("Stock Threshold", min_value=0, step=10, value=100, key="low_stock_threshold")
        
        if st.button("Show Low Stock Medications", key="show_low_stock"):
            query = """
            SELECT 
                MedicationID,
                Name,
                StockQuantity,
                ExpirationDate
            FROM MEDICATIONS
            WHERE StockQuantity <= %s
            ORDER BY StockQuantity ASC
            """
            result = db.run_select(query, (threshold,))
            
            if result is not None and not result.empty:
                st.warning(f"Found {len(result)} medication(s) with stock <= {threshold}")
                st.dataframe(result, use_container_width=True)
            else:
                st.success(f"No medications found with stock <= {threshold}")
    
    # --- PET HISTORY ---
    with query_pet_history_tab:
        st.subheader("Pet Medical History")
        
        # Fetch pets for dropdown
        pets_df = db.run_select("SELECT PetID, Name FROM PETS ORDER BY Name")
        
        if pets_df is not None and not pets_df.empty:
            pet_options = dict(zip(pets_df['Name'], pets_df['PetID']))
            selected_pet = st.selectbox("Select Pet", options=list(pet_options.keys()), key="pet_history_select")
            
            if st.button("Show Pet History", key="show_pet_history"):
                pet_id_selected = pet_options[selected_pet]
                
                # Query for appointments and treatments with prescriptions
                query = """
                SELECT 
                    a.AppointmentID,
                    a.Date AS AppointmentDate,
                    a.Time AS AppointmentTime,
                    a.Status AS AppointmentStatus,
                    CONCAT(v.FirstName, ' ', v.LastName) AS VetName,
                    t.TreatmentID,
                    t.Description AS TreatmentDescription,
                    t.Diagnosis,
                    t.StartDate AS TreatmentStartDate,
                    t.EndDate AS TreatmentEndDate,
                    pr.PrescriptionID,
                    m.Name AS MedicationName,
                    pr.Dosage,
                    pr.Duration
                FROM APPOINTMENTS a
                LEFT JOIN VETERINARIANS v ON a.VetID = v.VetID
                LEFT JOIN TREATMENTS t ON a.AppointmentID = t.AppointmentID
                LEFT JOIN PRESCRIPTIONS pr ON t.TreatmentID = pr.TreatmentID
                LEFT JOIN MEDICATIONS m ON pr.MedicationID = m.MedicationID
                WHERE a.PetID = %s
                ORDER BY a.Date DESC, a.Time DESC
                """
                result = db.run_select(query, (pet_id_selected,))
                
                if result is not None and not result.empty:
                    st.success(f"Found {len(result)} record(s) for {selected_pet}")
                    st.dataframe(result, use_container_width=True)
                else:
                    st.info(f"No medical history found for {selected_pet}")
        else:
            st.warning("No pets found in the database.")
    
    # --- OWNER TOTAL SPENT ---
    with query_owner_spent_tab:
        st.subheader("Owner Total Spent")
        
        # Fetch owners for dropdown
        owners_df = db.run_select("SELECT OwnerID, CONCAT(FirstName, ' ', LastName) AS OwnerName FROM OWNERS ORDER BY OwnerName")
        
        if owners_df is not None and not owners_df.empty:
            owner_options = dict(zip(owners_df['OwnerName'], owners_df['OwnerID']))
            selected_owner = st.selectbox("Select Owner", options=list(owner_options.keys()), key="owner_spent_select")
            
            if st.button("Show Total Spent", key="show_owner_spent"):
                owner_id_selected = owner_options[selected_owner]
                
                # Query for total amount spent by owner
                query = """
                SELECT 
                    o.OwnerID,
                    CONCAT(o.FirstName, ' ', o.LastName) AS OwnerName,
                    o.Email,
                    o.Phone_no,
                    SUM(p.Amount) AS TotalSpent,
                    COUNT(DISTINCT p.PaymentID) AS TotalPayments
                FROM OWNERS o
                LEFT JOIN APPOINTMENTS a ON o.OwnerID = a.OwnerID
                LEFT JOIN PAYMENTS p ON a.AppointmentID = p.AppointmentID
                WHERE o.OwnerID = %s
                GROUP BY o.OwnerID, o.FirstName, o.LastName, o.Email, o.Phone_no
                """
                result = db.run_select(query, (owner_id_selected,))
                
                if result is not None and not result.empty:
                    st.success(f"Payment summary for {selected_owner}")
                    st.dataframe(result, use_container_width=True)
                    
                    # Show detailed payment history
                    st.subheader("Payment Details")
                    detail_query = """
                    SELECT 
                        p.PaymentID,
                        p.AppointmentID,
                        p.Amount,
                        p.PaymentDate,
                        p.PaymentMethod,
                        p.Status AS PaymentStatus,
                        a.Date AS AppointmentDate,
                        pet.Name AS PetName
                    FROM PAYMENTS p
                    JOIN APPOINTMENTS a ON p.AppointmentID = a.AppointmentID
                    JOIN PETS pet ON a.PetID = pet.PetID
                    WHERE a.OwnerID = %s
                    ORDER BY p.PaymentDate DESC
                    """
                    detail_result = db.run_select(detail_query, (owner_id_selected,))
                    
                    if detail_result is not None and not detail_result.empty:
                        st.dataframe(detail_result, use_container_width=True)
                else:
                    st.info(f"No payment information found for {selected_owner}")
        else:
            st.warning("No owners found in the database.")

# Footer
st.markdown("---")
st.caption("🐾 Veterinary Clinic Management System | DBMS Course Bonus Project")
