with mts_1 as (
SELECT
    PULocationID,
    DOLocationID,
    total_passengers,
    rank
FROM {{ ref('int_top_route_pass')}}
WHERE rank <= 10
order by rank)

select * from mts_1