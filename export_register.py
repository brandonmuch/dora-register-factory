import os
from pathlib import Path
import pandas as pd
from sqlalchemy import create_engine
from sqlalchemy.engine import URL
from dotenv import load_dotenv

load_dotenv(dotenv_path=Path(__file__).parent / '.env')

DB_USER = 'postgres'
DB_PASS = os.getenv('DB_PASSWORD')
DB_HOST = '127.0.0.1'
DB_PORT = 5432  # <--- NUMBER, not a string
DB_NAME = 'dora_compliance'

url = URL.create(
    drivername="postgresql+psycopg",
    username=DB_USER,
    password=DB_PASS,
    host=DB_HOST,
    port=DB_PORT,
    database=DB_NAME,
)

engine = create_engine(url)

try:
    with engine.connect() as conn:
        print("Connected to Database. Generating DORA Templates...\n")
except Exception as e:
    print(f"Connection failed: {e}")
    raise SystemExit(1)

entity_df = pd.read_sql('SELECT * FROM public.stg_dora_entity', engine)
entity_df = entity_df.rename(columns={
    'entity_lei': 'RT.01.01.0010',
    'entity_name': 'RT.01.01.0020',
    'country_code': 'RT.01.01.0030',
    'entity_type_id': 'RT.01.01.0040'
})
entity_df.to_csv('RT.01.01.csv', index=False)
print("Generated RT.01.01.csv")

contract_df = pd.read_sql('SELECT * FROM public.stg_dora_contract', engine)
contract_df = contract_df.rename(columns={
    'contractual_arrangement_ref': 'RT.02.01.0010',
    'contract_type_id': 'RT.02.01.0020',
    'currency_code': 'RT.02.01.0040',
    'annual_expense_eur': 'RT.02.01.0050'
})
contract_df.to_csv('RT.02.01.csv', index=False)
print("Generated RT.02.01.csv")

chain_df = pd.read_sql('SELECT * FROM public.stg_dora_supply_chain', engine)
chain_df = chain_df.rename(columns={
    'contractual_arrangement_ref': 'RT.05.02.0010',
    'provider_lei': 'RT.05.02.0030',
    'provider_rank': 'RT.05.02.0050'
})
chain_df.to_csv('RT.05.02.csv', index=False)
print("Generated RT.05.02.csv")

engine.dispose()
print("\nAll regulatory files generated successfully!")