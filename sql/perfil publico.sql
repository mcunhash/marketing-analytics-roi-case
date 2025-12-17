SELECT
  c.public AS publico,
  SUM(s.revenue) AS total_revenue,
  SUM(c.spend) AS total_spend,
  SAFE_DIVIDE(
    SUM(s.revenue) - SUM(c.spend),
    SUM(c.spend)
  ) AS roi
FROM `fluid-mote-481116-i3.grupo_primo_marketing_analytics.sales` s
JOIN `fluid-mote-481116-i3.grupo_primo_marketing_analytics.campaigns` c
  ON s.campaign_id = c.campaign_id
GROUP BY
  publico
ORDER BY
  roi DESC;
