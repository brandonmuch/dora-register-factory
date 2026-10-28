WITH source_data AS (
    -- Rank 1: The direct provider (e.g., AWS)
    SELECT 
        '549300AWS12345678901' AS raw_provider_lei,
        'Amazon Web Services' AS raw_provider_name,
        'US' AS raw_country
    UNION ALL
    -- Rank 2: A subcontractor to AWS (e.g., a local data center)
    SELECT 
        '549300SUB12345678901' AS raw_provider_lei,
        'Frankfurt Data Center GmbH' AS raw_provider_name,
        'DE' AS raw_country
)

SELECT 
    raw_provider_lei AS provider_lei,
    raw_provider_name AS provider_name,
    raw_country AS provider_country_code
FROM source_data