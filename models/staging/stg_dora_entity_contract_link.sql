WITH source_data AS (
    -- ING Bank has contract CON-001
    SELECT 
        '5493001KJTIIGC8Y1R12' AS raw_lei,
        'CON-001' AS raw_contract_ref
    UNION ALL
    -- Rabobank has contract CON-002
    SELECT 
        '549300E9PC51EN656011' AS raw_lei,
        'CON-002' AS raw_contract_ref
    UNION ALL
    -- ING Bank ALSO has contract CON-002 (Shared contract)
    SELECT 
        '5493001KJTIIGC8Y1R12' AS raw_lei,
        'CON-002' AS raw_contract_ref
)

SELECT 
    raw_lei AS entity_lei,
    raw_contract_ref AS contractual_arrangement_ref
FROM source_data