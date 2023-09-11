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

# print("Defining run_queries function...")
def run_queries():
    # print("Inside run_queries function.")
    # Connect to Snowflake
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

    query_results = {}

    try:
        with open("../sql/queries/queries.sql", "r") as f:
            sql_script = f.read()
        print(f"SQL Script Content: \n{sql_script}")

        # Split the SQL script into individual queries
        queries = sql_script.split(";")
        
        # Remove leading and trailing whitespaces from each query
        queries = [query.strip() for query in queries if query.strip()]
        
        # Execute each query individually
        for i, query in enumerate(queries):
            try:
                cur.execute(query)
                result = cur.fetchall()
                query_results[f"Query_{i+1}"] = result
                print(f"Results for Query_{i+1}:")
                for row in result:
                    print(row)
                print("-" * 50)
                
            except Exception as e:
                print(f"An error occurred while executing Query_{i+1}: {str(e)}")
        
    except Exception as e:
        print(f"An error occurred: {str(e)}")
    
    finally:
        # Close the connection
        conn.close()
        cur.close()
        
    return query_results

if __name__ == "__main__":
    run_queries()
