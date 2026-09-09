-- Purpose:
-- Identify the SBTi records associated with Tesco, J Sainsbury plc
-- and Walmart Inc. before filtering by unique SBTi company IDs.
--
-- This is an exploratory entity-discovery query.
-- Name matching is intentionally broad and may return false positives.

SELECT DISTINCT
  company_name,
  sbti_id
FROM
  `corporate-benchmarking.sustainability_benchmarking.sbti_targets_raw`
WHERE
  LOWER(company_name) LIKE '%tesco%'
  OR LOWER(company_name) LIKE '%sainsbury%'
  OR LOWER(company_name) LIKE '%walmart%'
ORDER BY
  company_name;