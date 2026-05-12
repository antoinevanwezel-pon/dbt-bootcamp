{{ config(
  materialized = 'table',
) }}

WITH r AS (
    SELECT * FROM {{ ref('fct_reviews') }}
),
fm AS (
    SELECT * FROM {{ ref('seed_full_moon_dates') }}
)

SELECT
  r.*,
  CASE
    WHEN fm.full_moon_date IS NULL THEN 'not full moon'
    ELSE 'full moon'
  END AS is_full_moon
FROM
  r
  LEFT JOIN fm
  ON (TO_DATE(r.review_date) = DATEADD(DAY, 1, fm.full_moon_date))