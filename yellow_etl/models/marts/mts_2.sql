with mts_2 as (
SELECT
    PULocationID,
    DOLocationID,
    total_amount_fare,
    rank
FROM {{ ref('int_top_route_fare') }}
WHERE rank <= 10
order by rank)

select * from mts_2