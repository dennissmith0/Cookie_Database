# My Cookie Shop Database Project

## Overview
This project consists of a play-database representing a cookie shop. The database is hosted on Snowflake and includes SQL scripts for table creation, data insertion, data update, and data queries.

## Repository Structure
```
my-cookie-shop-db/
│
├── data/
│ └── initial_data/
│
├── sql/
│ ├── ddl/
│ ├── dml/
│ └── queries/
│
├── scripts/
│ ├── create_tables.py
│ ├── insert_data.py
│ ├── update_data.py
│ ├── run_queries.py
│ └── main_orchestrator.py
│
└── README.md
```

### Folder Descriptions
- **`data/`**: Holds CSV files containing initial data.
- **`sql/`**: SQL scripts for DDL, DML, and queries.
  - **`ddl/`**: Scripts for creating tables and setting constraints.
  - **`dml/`**: Scripts for inserting and updating data.
  - **`queries/`**: Scripts for running queries.
- **`scripts/`**: Python scripts to automate SQL operations.
  - **`create_tables.py`**: Creates tables in Snowflake.
  - **`insert_data.py`**: Inserts initial data.
  - **`update_data.py`**: Updates existing data.
  - **`run_queries.py`**: Runs SQL queries.
  - **`main_orchestrator.py`**: Orchestrates the execution of other scripts.

### How to Use
1. **Environment Setup**: Create a `.env` file at the root of the project and add your Snowflake credentials:
    ```env
    SNOWFLAKE_ACCOUNT=your_account
    SNOWFLAKE_USER=your_user
    SNOWFLAKE_PASSWORD=your_password
    ```
    **Note**: Make sure to add `.env` to your `.gitignore` file to keep your credentials secure.

2. **Database Setup**: Run `create_tables.py` to create initial tables in Snowflake.
3. **Insert Initial Data**: Run `insert_data.py` to populate the tables with initial data.
4. **Update Data**: Run `update_data.py` to update data as needed.
5. **Run Queries**: Run `run_queries.py` to execute SQL queries for analytics.
6. **Orchestration**: Alternatively, run `main_orchestrator.py` to execute all the above steps in sequence.

## Technology Stack
- SQL for data definition and manipulation.
- Snowflake as the data warehouse.
- Python for scripting and automation.

## Contributing
Feel free to fork this repository and submit pull requests. For major changes, open an issue first to discuss what you'd like to change.

## License
[MIT](https://choosealicense.com/licenses/mit/)
