SELECT
  c.campaign_id,
  c.channel,
  c.public,
  c.product,
  c.spend,
  SUM(s.revenue) AS total_revenue,
  SAFE_DIVIDE(
    SUM(s.revenue) - c.spend,
    c.spend
  ) AS roi
FROM `fluid-mote-481116-i3.grupo_primo_marketing_analytics.campaigns` c
LEFT JOIN `fluid-mote-481116-i3.grupo_primo_marketing_analytics.sales` s
  ON c.campaign_id = s.campaign_id
GROUP BY
  c.campaign_id,
  c.channel,
  c.public,
  c.product,
  c.spend
ORDER BY
  roi DESC
LIMIT 5;
