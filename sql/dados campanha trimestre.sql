WITH campaign_months AS (
  SELECT
    c.campaign_id,
    c.channel,
    DATE_TRUNC(m, MONTH) AS month,
    c.spend /
      (DATE_DIFF(c.end_date, c.start_date, MONTH) + 1) AS monthly_spend
  FROM `fluid-mote-481116-i3.grupo_primo_marketing_analytics.campaigns` c,
  UNNEST(
    GENERATE_DATE_ARRAY(
      DATE_TRUNC(c.start_date, MONTH),
      DATE_TRUNC(c.end_date, MONTH),
      INTERVAL 1 MONTH
    )
  ) AS m
),

campaign_quarter_spend AS (
  SELECT
    DATE_TRUNC(month, QUARTER) AS quarter,
    campaign_id,
    channel,
    SUM(monthly_spend) AS spend
  FROM campaign_months
  GROUP BY
    quarter,
    campaign_id,
    channel
),

sales_quarterly AS (
  SELECT
    DATE_TRUNC(order_date, QUARTER) AS quarter,
    campaign_id,
    SUM(revenue) AS revenue
  FROM `fluid-mote-481116-i3.grupo_primo_marketing_analytics.sales`
  GROUP BY
    quarter,
    campaign_id
)

SELECT
  s.quarter,
  c.channel,
  SUM(s.revenue) AS revenue,
  SUM(c.spend) AS spend,
  SAFE_DIVIDE(
    SUM(s.revenue) - SUM(c.spend),
    SUM(c.spend)
  ) AS roi
FROM sales_quarterly s
JOIN campaign_quarter_spend c
  ON s.campaign_id = c.campaign_id
 AND s.quarter = c.quarter
GROUP BY
  s.quarter,
  c.channel
ORDER BY
  s.quarter;
