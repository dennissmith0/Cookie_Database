import snowflake.connector
from dotenv import load_dotenv
import os

load_dotenv()

SNOWFLAKE_ACCOUNT = os.environ.get('SNOWFLAKE_ACCOUNT')
SNOWFLAKE_USER = os.environ.get('SNOWFLAKE_USER')
SNOWFLAKE_PASSWORD = os.environ.get('SNOWFLAKE_PASSWORD')


def update_data():
    # Create a connection
    conn = snowflake.connector.connect(
        user=SNOWFLAKE_USER,
        password=SNOWFLAKE_PASSWORD,
        account=SNOWFLAKE_ACCOUNT,
        warehouse='compute_wh',
        database='demo_dbt',
        schema='public'
    )

    # Create a cursor object
    cur = conn.cursor()
    with open("sql/dml/update_data.sql", "r") as f:
        sql_script = f.read()

    cur.execute(sql_script)

    # Close the connection
    conn.close()