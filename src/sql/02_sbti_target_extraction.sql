-- Purpose:
-- Extract SBTi target records for Tesco, J Sainsbury plc and Walmart Inc.
-- using their unique SBTi company identifiers.
--
-- Using sbti_id avoids the false matches that can occur when filtering
-- companies using partial company-name searches.
--
-- SBTi IDs:
-- Tesco          = 40010607
-- J Sainsbury plc = 40014163
-- Walmart Inc.   = 40012486

SELECT
  company_name,
  sbti_id,
  action,
  target,
  scope,
  target_value,
  base_year,
  target_year,
  type,
  target_classification_short,
  company_temperature_alignment,
  date_published,
  target_wording
FROM
  `corporate-benchmarking.sustainability_benchmarking.sbti_targets_raw`
WHERE
  sbti_id IN (40010607, 40014163, 40012486)
ORDER BY
  company_name,
  date_published,
  scope;