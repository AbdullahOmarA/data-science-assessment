-- ADD YOUR SQL QUERY HERE

SELECT 
  it.investor_id,s.sector_name, 
  ROUND((it.no_of_shares * 100.0 / t.total_shares), 2
  ) AS percentage
FROM investor_transactions it
JOIN sectors s ON it.sector_id = s.sector_id
JOIN (
  SELECT investor_id, SUM(no_of_shares) AS total_shares
  FROM investor_transactions
  GROUP BY investor_id
) t ON it.investor_id = t.investor_id
ORDER BY it.investor_id, percentage DESC;