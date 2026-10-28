-- This test fails if any LEI code is not exactly 20 characters long.
SELECT 
    entity_lei
FROM {{ ref('stg_dora_entity') }}
WHERE LENGTH(entity_lei) != 20