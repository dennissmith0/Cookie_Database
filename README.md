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
1. **Database Setup**: Run `create_tables.py` to create initial tables in Snowflake.
2. **Insert Initial Data**: Run `insert_data.py` to populate the tables with initial data.
3. **Update Data**: Run `update_data.py` to update data as needed.
4. **Run Queries**: Run `run_queries.py` to execute SQL queries for analytics.
5. **Orchestration**: Alternatively, run `main_orchestrator.py` to execute all the above steps in sequence.

## Technology Stack
- SQL for data definition and manipulation.
- Snowflake as the data warehouse.
- Python for scripting and automation.

## Contributing
Feel free to fork this repository and submit pull requests. For major changes, open an issue first to discuss what you'd like to change.

## License
[MIT](https://choosealicense.com/licenses/mit/)
