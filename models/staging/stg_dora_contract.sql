WITH source_data AS (
    SELECT 
        'CON-001' AS raw_contract_ref,
        1 AS raw_contract_type, -- 1 = Standalone
        'EUR' AS raw_currency,
        50000 AS raw_annual_cost
    UNION ALL
    SELECT 
        'CON-002' AS raw_contract_ref,
        2 AS raw_contract_type, -- 2 = Overarching
        'EUR' AS raw_currency,
        120000 AS raw_annual_cost
)

SELECT 
    raw_contract_ref AS contractual_arrangement_ref,
    raw_contract_type AS contract_type_id,
    raw_currency AS currency_code,
    raw_annual_cost AS annual_expense_eur
FROM source_data