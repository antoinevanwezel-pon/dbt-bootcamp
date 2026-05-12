/*
-- This is the old code, but better with the source function, so we keep it here for reference
WITH raw_listings AS (
    SELECT * FROM AIRBNB.RAW.RAW_LISTINGS
)
*/

WITH raw_listings AS (
    SELECT * FROM {{ source('airbnb', 'listings') }}
)

SELECT
    id AS listing_id,
    listing_url,
    name AS listing_name,
    room_type,
    minimum_nights,
    host_id,
    price AS price_str,
    created_at,
    updated_at
FROM
    raw_listings