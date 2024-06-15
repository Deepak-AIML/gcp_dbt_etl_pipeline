with stg_data as (
 SELECT 
    PULocationID, 
    DOLocationID, 
    payment_type, 
    total_amount, 
    VendorID, 
    passenger_count, 
    trip_distance,
    TIMESTAMP_DIFF(tpep_dropoff_datetime, tpep_pickup_datetime, MINUTE) AS trip_duration
    FROM `dbt-pipeline-415806.yellow_taxi.raw_data_taxi` 
)

select * from stg_data