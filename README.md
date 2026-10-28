# DORA Register of Information Pipeline

An end-to-end data engineering and GRC pipeline simulating a financial institution's compliance with the EU Digital Operational Resilience Act (DORA) Register of Information (Article 28).

## The Problem
DORA requires financial entities to submit a complex, relational Register of Information to their regulators (like the DNB or AFM). Submitting invalid data results in regulatory rejection. 

## The Solution
This project builds a local data pipeline that:
1. Ingests raw mock data into PostgreSQL.
2. Uses **dbt Core** to transform the data into a relational model (Entities, Contracts, Providers, and Supply Chains).
3. Uses **dbt tests** (`not_null`, `accepted_values`, `relationships`) to enforce data quality and regulatory integrity (e.g., blocking invalid LEI codes).
4. Uses **Python (Pandas)** to automatically rename the database columns into the exact regulatory codes (e.g., `RT.01.01.0010`) and export the submission-ready CSV files.

## Tech Stack
- **Database:** PostgreSQL
- **Transformation:** dbt Core
- **Data Quality:** dbt tests (Generic & Singular)
- **Scripting:** Python (Pandas, SQLAlchemy)
- **Security:** python-dotenv (Secrets management)

## How to Run
1. Clone the repository.
2. Install dependencies: `pip install dbt-postgres pandas sqlalchemy "psycopg[binary]" python-dotenv`
3. Rename `.env.example` to `.env` and add your Postgres password.
4. Run `dbt run` and `dbt test` to build and validate the data.
5. Run `python export_register.py` to generate the regulatory CSV templates.
