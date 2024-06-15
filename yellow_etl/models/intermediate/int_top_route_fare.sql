with mts_2_agg as (
  SELECT 
  PULocationID,
  DOLocationID,
  sum(sum_amount) as total_amount_fare
  FROM {{ ref('int_transformation') }}
  GROUP BY PULocationID, DOLocationID
  ORDER BY total_amount_fare
)

, ranked_mts_2 AS (
    SELECT
        PULocationID,
        DOLocationID,
        total_amount_fare,
        RANK() OVER (ORDER BY total_amount_fare DESC) AS rank
    FROM mts_2_agg
)

select * from ranked_mts_2