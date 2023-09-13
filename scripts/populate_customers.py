import snowflake.connector
from faker import Faker
import random
from datetime import datetime, timedelta
from dotenv import load_dotenv
import os

load_dotenv()

# Initialize Faker
fake = Faker()

# Fetch Snowflake credentials from environment variables
SNOWFLAKE_ACCOUNT = os.environ.get('SNOWFLAKE_ACCOUNT')
SNOWFLAKE_USER = os.environ.get('SNOWFLAKE_USER')
SNOWFLAKE_PASSWORD = os.environ.get('SNOWFLAKE_PASSWORD')
SNOWFLAKE_WAREHOUSE = os.environ.get('SNOWFLAKE_WAREHOUSE')
SNOWFLAKE_DATABASE = os.environ.get('SNOWFLAKE_DATABASE')
SNOWFLAKE_SCHEMA = os.environ.get('SNOWFLAKE_SCHEMA')

# Create a connection
conn = snowflake.connector.connect(
    user=SNOWFLAKE_USER,
    password=SNOWFLAKE_PASSWORD,
    account=SNOWFLAKE_ACCOUNT,
    warehouse=SNOWFLAKE_WAREHOUSE,
    database=SNOWFLAKE_DATABASE,
    schema=SNOWFLAKE_SCHEMA   
)

# Create a cursor object
cur = conn.cursor()

# Define a function to generate random customer data
def generate_random_customer():
    first_name = fake.first_name()
    last_name = fake.last_name()
    email = fake.email()
    visit_count = random.randint(1, 20)
    last_visit = datetime.now() - timedelta(days=random.randint(0,30))
    total_spent = round(random.uniform(5.0, 200.0), 2)
    membership_status = random.choice(['Gold', 'Silver', 'Bronze'])
    address = fake.address().replace('\n',', ')
    phone_number = fake.phone_number()

    return (first_name, last_name, email, visit_count, last_visit, total_spent, membership_status, address, phone_number)

# Insert synthetic data into Customer table
for _ in range(100):
    customer_data = generate_random_customer()
    insert_query = f"""
    INSERT INTO Customer (first_name, last_name, email, visit_count, last_visit, total_spent, membership_status, address, phone_number)
    VALUES {customer_data}
    """
    cur.execute(insert_query)

# Commit the transaction
conn.commit()

# Close the connection
conn.close()