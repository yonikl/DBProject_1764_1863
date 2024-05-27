import cx_Oracle
from faker import Faker
from datetime import datetime, timedelta
import random

# Function to generate fake data
def generate_fake_soldier():
    fake = Faker()
    soldier_id = random.randint(100000, 999999)  # Generate random 6-digit SoldierID
    soldier_name = fake.name()
    rank = fake.random_element(elements=('Private', 'Corporal', 'Sergeant', 'Lieutenant', 'Captain'))
    date_of_birth = fake.date_of_birth(minimum_age=18, maximum_age=40)
    return (soldier_id, soldier_name, rank, date_of_birth)


# Function to insert fake data into the database
def insert_soldiers(connection, cursor, num_rows):
    for _ in range(num_rows):
        soldier_data = generate_fake_soldier()
        query = "INSERT INTO soldier (SoldierID, Name_, Rank_, DateOfBirth) VALUES (:1, :2, :3, :4)"
        cursor.execute(query, soldier_data)
    connection.commit()


# Database connection details
dsn = cx_Oracle.makedsn('localhost', '1521', service_name='XE')
user = 'c##Yoni'
password = 'yon5klro'

# Number of rows to insert
num_rows = 500

try:
    # Connect to the database
    connection = cx_Oracle.connect(user=user, password=password, dsn=dsn)

    if connection:
        cursor = connection.cursor()
        # Insert data into the soldier table
        insert_soldiers(connection, cursor, num_rows)
        print("Data inserted successfully.")
except cx_Oracle.Error as e:
    print("Error while connecting to Oracle", e)
finally:
    if (connection):
        cursor.close()
        connection.close()
        print("Oracle connection is closed")
