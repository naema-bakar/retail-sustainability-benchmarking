-- Purpose:
-- Extract near-term SBTi targets for Tesco, J Sainsbury plc and Walmart Inc.
--
-- This narrows the analysis to SBTi-validated near-term targets
-- so that comparable operational and value-chain targets can be examined.

SELECT
  company_name,
  scope,
  target_value,
  base_year,
  target_year,
  target_wording
FROM
  `corporate-benchmarking.sustainability_benchmarking.sbti_targets_raw`
WHERE
  sbti_id IN (40010607, 40014163, 40012486)
  AND action = 'Target'
  AND target = 'Near-term'
ORDER BY
  company_name,
  scope;