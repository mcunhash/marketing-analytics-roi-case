LOAD DATA INTO `fluid-mote-481116-i3.grupo_primo_marketing_analytics.campaigns_raw`
(
campaign_id STRING,
start_date STRING, -- AGORA COMO STRING
end_date STRING,   -- AGORA COMO STRING
spend FLOAT64,
public STRING,
channel STRING,
product STRING
)
FROM FILES (
format = 'CSV',
uris = ['gs://grupo-primo-bucket/campanhas.csv'],
skip_leading_rows = 1
);*/

LOAD DATA INTO `fluid-mote-481116-i3.grupo_primo_marketing_analytics.sales_raw`
(
order_date STRING, -- AGORA COMO STRING
campaign_id STRING,
revenue FLOAT64
)
FROM FILES (
format = 'CSV',
uris = ['gs://grupo-primo-bucket/vendas.csv'],
skip_leading_rows = 1
);