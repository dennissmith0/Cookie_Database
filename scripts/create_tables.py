import snowflake.connector
from dotenv import load_dotenv
import os

load_dotenv()

# Fetch Snowflake credentials from environment variables
SNOWFLAKE_ACCOUNT = os.environ.get('SNOWFLAKE_ACCOUNT')
SNOWFLAKE_USER = os.environ.get('SNOWFLAKE_USER')
SNOWFLAKE_PASSWORD = os.environ.get('SNOWFLAKE_PASSWORD')
SNOWFLAKE_WAREHOUSE = os.environ.get('SNOWFLAKE_WAREHOUSE')
SNOWFLAKE_DATABASE = os.environ.get('SNOWFLAKE_DATABASE')
SNOWFLAKE_SCHEMA = os.environ.get('SNOWFLAKE_SCHEMA')


def create_tables():
    try:
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

        with open("../sql/ddl/create_tables.sql", "r") as f:
            sql_script = f.read()

        statements = sql_script.strip().split(';')

        for statement in statements:
            # Remove any leading and trailing whitespaces
            statement = statement.strip()
            
            # Skip empty statements
            if len(statement) == 0:
                print("Skipping empty statement")
                continue

            try:
                cur.execute(statement)
            except Exception as e:
                print(f"An error occurred: {e}")
        
        conn.commit()

        print("Tables created successfully.")

        # Close the cursor and connection
        cur.close()
        conn.close()

    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    create_tables()
