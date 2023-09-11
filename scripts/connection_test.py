import snowflake.connector
from dotenv import load_dotenv
import os

# Load environment variables
load_dotenv()

# Fetch Snowflake credentials from environment variables
SNOWFLAKE_ACCOUNT = os.environ.get('SNOWFLAKE_ACCOUNT')
SNOWFLAKE_USER = os.environ.get('SNOWFLAKE_USER')
SNOWFLAKE_PASSWORD = os.environ.get('SNOWFLAKE_PASSWORD')
SNOWFLAKE_WAREHOUSE = os.environ.get('SNOWFLAKE_WAREHOUSE')
SNOWFLAKE_DATABASE = os.environ.get('SNOWFLAKE_DATABASE')
SNOWFLAKE_SCHEMA = os.environ.get('SNOWFLAKE_SCHEMA')

# Initialize connection parameters
conn_params = {
    'user': SNOWFLAKE_USER,
    'password': SNOWFLAKE_PASSWORD,
    'account': SNOWFLAKE_ACCOUNT
}

# Test each connection step
for step, param in enumerate([
    {},
    {'warehouse': SNOWFLAKE_WAREHOUSE},
    {'database': SNOWFLAKE_DATABASE},
    {'schema': SNOWFLAKE_SCHEMA}
], 1):
    try:
        # Update connection parameters
        conn_params.update(param)
        
        # Attempt to connect
        conn = snowflake.connector.connect(**conn_params)
        print(f"Step {step}: Successfully connected with {param if param else 'initial parameters'}.")

        # Close connection
        conn.close()
    except Exception as e:
        print(f"Step {step}: Failed to connect with {param if param else 'initial parameters'}. Error: {e}")
