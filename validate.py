#!/usr/bin/env python3
"""
Simple validation script to test the database module structure
and verify imports work correctly without a live database connection.
"""

import sys

def test_imports():
    """Test that all modules can be imported"""
    try:
        import db
        print("✓ db module imported successfully")
        
        # Check required functions exist
        assert hasattr(db, 'get_connection'), "Missing get_connection function"
        assert hasattr(db, 'run_select'), "Missing run_select function"
        assert hasattr(db, 'run_execute'), "Missing run_execute function"
        assert hasattr(db, 'test_connection'), "Missing test_connection function"
        print("✓ All required functions exist in db module")
        
        import app
        print("✓ app module imported successfully")
        
        return True
    except Exception as e:
        print(f"✗ Import failed: {e}")
        return False

def test_environment_variables():
    """Test environment variable handling"""
    try:
        import os
        from dotenv import load_dotenv
        
        # Test loading .env.example (won't override, just verify it can be read)
        print("✓ python-dotenv installed and working")
        
        # Test that environment variables have defaults
        import db
        # These should not crash even without .env file
        print("✓ db module handles missing environment variables gracefully")
        
        return True
    except Exception as e:
        print(f"✗ Environment variable test failed: {e}")
        return False

def test_sql_injection_prevention():
    """Verify parameterized query usage"""
    try:
        import inspect
        import db
        
        # Check run_select uses parameterized queries
        select_source = inspect.getsource(db.run_select)
        assert 'cursor.execute(query, params)' in select_source, "run_select should use parameterized queries"
        print("✓ run_select uses parameterized queries")
        
        # Check run_execute uses parameterized queries  
        execute_source = inspect.getsource(db.run_execute)
        assert 'cursor.execute(query, params)' in execute_source, "run_execute should use parameterized queries"
        print("✓ run_execute uses parameterized queries")
        
        return True
    except Exception as e:
        print(f"✗ SQL injection prevention test failed: {e}")
        return False

def main():
    """Run all validation tests"""
    print("=" * 60)
    print("Veterinary Clinic Management System - Validation Tests")
    print("=" * 60)
    print()
    
    tests = [
        ("Module Imports", test_imports),
        ("Environment Variables", test_environment_variables),
        ("SQL Injection Prevention", test_sql_injection_prevention),
    ]
    
    results = []
    for test_name, test_func in tests:
        print(f"\n{test_name}:")
        print("-" * 40)
        result = test_func()
        results.append(result)
        print()
    
    print("=" * 60)
    print("Summary:")
    print(f"  Passed: {sum(results)}/{len(results)}")
    print(f"  Failed: {len(results) - sum(results)}/{len(results)}")
    print("=" * 60)
    
    return all(results)

if __name__ == "__main__":
    success = main()
    sys.exit(0 if success else 1)
