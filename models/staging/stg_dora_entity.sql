WITH source_data AS (
    SELECT 
        '5493001KJTIIGC8Y1R12' AS raw_lei,
        'ING Bank N.V.' AS raw_name,
        'NL' AS raw_country,
        1 AS raw_type
    UNION ALL
    SELECT 
        '549300E9PC51EN656011' AS raw_lei,
        'Rabobank' AS raw_name,
        'NL' AS raw_country,
        1 AS raw_type               
)

SELECT 
    raw_lei AS entity_lei,
    raw_name AS entity_name,
    raw_country AS country_code,
    raw_type AS entity_type_id
FROM source_data