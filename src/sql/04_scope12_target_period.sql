-- Purpose:
-- Compare near-term Scope 1+2 targets for Tesco, J Sainsbury plc
-- and Walmart Inc., and calculate the duration of each target period.
--
-- This step highlights why headline percentage reductions are not
-- directly comparable when base years and target years differ.

SELECT
  company_name,
  target_value,
  base_year,
  target_year,

  CAST(target_year AS INT64)
    - CAST(base_year AS INT64)
    AS target_period_years

FROM
  `corporate-benchmarking.sustainability_benchmarking.sbti_targets_raw`

WHERE
  sbti_id IN (40010607, 40014163, 40012486)
  AND action = 'Target'
  AND target = 'Near-term'
  AND scope = '1+2'

ORDER BY
  company_name;