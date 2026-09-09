-- Purpose:
-- Calculate an annualised near-term Scope 1+2 target reduction rate
-- for Tesco, J Sainsbury plc and Walmart Inc.
--
-- The annualised rate converts each company's total target reduction
-- into an equivalent constant annual reduction rate over the target period.
--
-- Formula:
-- r = 1 - (1 - R)^(1/n)
--
-- where:
-- R = total target reduction as a decimal
-- n = number of years between the base year and target year
--
-- Note:
-- This is a derived analytical metric. It represents target intensity,
-- not observed year-on-year emissions performance.

SELECT
  company_name,

  CAST(
    REPLACE(target_value, '%', '')
    AS FLOAT64
  ) AS target_reduction_pct,

  CAST(target_year AS INT64)
    - CAST(base_year AS INT64)
    AS target_period_years,

  ROUND(
    (
      1 - POWER(
        1 - (
          CAST(REPLACE(target_value, '%', '') AS FLOAT64) / 100
        ),
        1.0 / (
          CAST(target_year AS INT64)
          - CAST(base_year AS INT64)
        )
      )
    ) * 100,
    2
  ) AS annualised_target_reduction_rate_pct

FROM
  `corporate-benchmarking.sustainability_benchmarking.sbti_targets_raw`

WHERE
  sbti_id IN (40010607, 40014163, 40012486)
  AND action = 'Target'
  AND target = 'Near-term'
  AND scope = '1+2'

ORDER BY
  annualised_target_reduction_rate_pct DESC;