with int_data as (
  SELECT
  PULocationID,
  DOLocationID,
  VendorID,
  payment_type,
  sum(total_amount) as sum_amount,
  sum(trip_duration ) as total_min,
  sum(passenger_count) as total_passengers,
  sum(trip_distance) as total_distance,
  FROM {{ ref('stg_raw_data') }}
  GROUP BY PULocationID,DOLocationID,VendorID,payment_type
)

select * from int_data