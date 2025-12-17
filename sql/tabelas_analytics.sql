
--DADOS PARA ANALYTICS CAMAPANHA--

/*CREATE TABLE `fluid-mote-481116-i3.grupo_primo_marketing_analytics.campaigns`
AS
SELECT
campaign_id,
PARSE_DATE('%d/%m/%Y', start_date) AS start_date, -- Converte STRING para DATE
PARSE_DATE('%d/%m/%Y', end_date) AS end_date,     -- Converte STRING para DATE
spend,
public,
channel,
product
FROM
`fluid-mote-481116-i3.grupo_primo_marketing_analytics.campaigns_raw`;
*/


--DADOS PARA ANALYTICS VENDAS--

CREATE TABLE `fluid-mote-481116-i3.grupo_primo_marketing_analytics.sales`
PARTITION BY order_date
OPTIONS (
  partition_expiration_days = NULL
)
AS
SELECT
  DATE(order_date) AS order_date, -- Converte string 'YYYY-MM-DD' para DATE
  campaign_id,
  revenue
FROM
  `fluid-mote-481116-i3.grupo_primo_marketing_analytics.sales_raw`;