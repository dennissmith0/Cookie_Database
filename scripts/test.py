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

# Initialize connection variable to None
conn = None

try:
    # Establish connection
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

   
    # Execute SQL query to create table
    create_table_query = "CREATE TABLE IF NOT EXISTS your_table (column1 INT, column2 STRING);"
    cur.execute(create_table_query)
    print("Table created successfully.")

    # Execute SQL query to insert data
    insert_query = "INSERT INTO your_table (column1, column2) VALUES (1, 'value');"
    cur.execute(insert_query)
    print("Data inserted successfully.")

    # Commit the transaction
    conn.commit()
    print("Transaction committed")

    # Execute SQL query to fetch data
    cur.execute("SELECT * FROM your_table;")
    fetched_data = cur.fetchall()
    print("Fetched Data:", fetched_data)

except Exception as e:
    print(f"Failed to execute query: {e}")

finally:
    # Close the cursor if it exists
    if cur:
        cur.close()

    # Close the connection
    if conn:
        conn.close()