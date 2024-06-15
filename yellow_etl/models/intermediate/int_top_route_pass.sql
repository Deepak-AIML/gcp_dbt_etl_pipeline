with mts_1_agg as (
  SELECT 
  PULocationID,
  DOLocationID,
  sum(total_passengers) as total_passengers
  FROM {{ ref('int_transformation') }}
  GROUP BY PULocationID, DOLocationID
  ORDER BY total_passengers
)

,ranked_mts_1 AS (
    SELECT
        PULocationID,
        DOLocationID,
        total_passengers,
        RANK() OVER (ORDER BY total_passengers DESC) AS rank
    FROM mts_1_agg
)

select * from ranked_mts_1