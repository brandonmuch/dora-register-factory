WITH source_data AS (
    -- Contract CON-001 uses AWS (Rank 1)
    SELECT 
        'CON-001' AS raw_contract_ref,
        '549300AWS12345678901' AS raw_provider_lei,
        1 AS raw_rank
    UNION ALL
    -- But AWS uses Frankfurt Data Center (Rank 2) for the same contract!
    SELECT 
        'CON-001' AS raw_contract_ref,
        '549300SUB12345678901' AS raw_provider_lei,
        2 AS raw_rank
)

SELECT 
    raw_contract_ref AS contractual_arrangement_ref,
    raw_provider_lei AS provider_lei,
    raw_rank AS provider_rank
FROM source_data