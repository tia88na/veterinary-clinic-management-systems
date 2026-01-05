"""
Database connection and query helper module for Veterinary Clinic Management System.
Uses environment variables for database credentials.
"""

import os
import mysql.connector
from mysql.connector import Error
import pandas as pd
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()


def get_connection():
    """
    Create and return a MySQL database connection using environment variables.
    
    Returns:
        connection: MySQL connection object or None if connection fails
    """
    try:
        connection = mysql.connector.connect(
            host=os.getenv('DB_HOST', 'localhost'),
            port=int(os.getenv('DB_PORT', 3306)),
            user=os.getenv('DB_USER', 'root'),
            password=os.getenv('DB_PASSWORD', ''),
            database=os.getenv('DB_NAME', 'veterinary_clinic')
        )
        return connection
    except Error as e:
        print(f"Error connecting to MySQL: {e}")
        return None


def run_select(query, params=None):
    """
    Execute a SELECT query and return results as a pandas DataFrame.
    
    Args:
        query (str): SQL SELECT query with optional placeholders (%s)
        params (tuple): Optional parameters for parameterized query
    
    Returns:
        DataFrame: Query results as pandas DataFrame, or None if error occurs
    """
    connection = None
    try:
        connection = get_connection()
        if connection is None:
            return None
        
        cursor = connection.cursor(dictionary=True)
        if params:
            cursor.execute(query, params)
        else:
            cursor.execute(query)
        
        results = cursor.fetchall()
        df = pd.DataFrame(results)
        cursor.close()
        return df
    
    except Error as e:
        print(f"Error executing SELECT query: {e}")
        return None
    
    finally:
        if connection and connection.is_connected():
            connection.close()


def run_execute(query, params=None):
    """
    Execute an INSERT, UPDATE, or DELETE query.
    
    Args:
        query (str): SQL query with optional placeholders (%s)
        params (tuple): Optional parameters for parameterized query
    
    Returns:
        dict: Dictionary with 'success' (bool), 'message' (str), and 'rowcount' (int)
    """
    connection = None
    try:
        connection = get_connection()
        if connection is None:
            return {
                'success': False,
                'message': 'Failed to connect to database',
                'rowcount': 0
            }
        
        cursor = connection.cursor()
        if params:
            cursor.execute(query, params)
        else:
            cursor.execute(query)
        
        connection.commit()
        rowcount = cursor.rowcount
        cursor.close()
        
        return {
            'success': True,
            'message': f'Query executed successfully. {rowcount} row(s) affected.',
            'rowcount': rowcount
        }
    
    except Error as e:
        return {
            'success': False,
            'message': f'Error executing query: {str(e)}',
            'rowcount': 0
        }
    
    finally:
        if connection and connection.is_connected():
            connection.close()


def get_next_id(table_name, id_column):
    """
    Get the next available ID for a table by finding the max existing ID.
    
    Args:
        table_name (str): Name of the table
        id_column (str): Name of the ID column
    
    Returns:
        int: Next available ID (max + 1), or 1 if table is empty
    """
    # Whitelist of allowed table/column combinations for security
    allowed_combinations = {
        ('OWNERS', 'OwnerID'),
        ('PETS', 'PetID'),
        ('APPOINTMENTS', 'AppointmentID'),
        ('VETERINARIANS', 'VetID'),
        ('MEDICATIONS', 'MedicationID'),
        ('TREATMENTS', 'TreatmentID'),
        ('PRESCRIPTIONS', 'PrescriptionID'),
        ('PAYMENTS', 'PaymentID'),
        ('STAFF', 'StaffID'),
    }
    
    # Validate against whitelist to prevent SQL injection
    if (table_name, id_column) not in allowed_combinations:
        print(f"Error: Invalid table/column combination: {table_name}.{id_column}")
        return 1
    
    try:
        # Safe to use f-string here as we've validated against whitelist
        query = f"SELECT MAX({id_column}) as max_id FROM {table_name}"
        result = run_select(query)
        
        if result is not None and not result.empty and result['max_id'].iloc[0] is not None:
            return int(result['max_id'].iloc[0]) + 1
        else:
            return 1
    except Exception as e:
        print(f"Error getting next ID: {e}")
        return 1


def test_connection():
    """
    Test the database connection.
    
    Returns:
        dict: Dictionary with 'success' (bool) and 'message' (str)
    """
    connection = None
    try:
        connection = get_connection()
        if connection is None:
            return {
                'success': False,
                'message': 'Failed to connect to database. Check your credentials.'
            }
        
        if connection.is_connected():
            db_info = connection.get_server_info()
            return {
                'success': True,
                'message': f'Successfully connected to MySQL Server version {db_info}'
            }
    
    except Error as e:
        return {
            'success': False,
            'message': f'Error: {str(e)}'
        }
    
    finally:
        if connection and connection.is_connected():
            connection.close()
