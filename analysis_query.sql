create or replace table `yellow-cab-data-engineer.analysis.trip_analysis` as (
  SELECT
    f.trip_id,
    dv.vendor_name,
    dt.tpep_pickup_datetime,
    dt.tpep_dropoff_datetime,
    drc.rate_code_name,
    dpl.pickup_latitude,
    dpl.pickup_longitude,
    ddl.dropoff_latitude,
    ddl.dropoff_longitude,
    dpt.payment_type_name,
    f.trip_distance,
    f.fare_amount,
    f.extra,
    f.mta_tax,
    f.tip_amount,
    f.tolls_amount,
    f.improvement_surcharge,
    f.passenger_count,
    f.total_amount
  FROM `yellow-cab-data-engineer.fct.fct_trip` f
  LEFT JOIN `yellow-cab-data-engineer.dim.dim_datetime` dt ON f.datetime_id = dt.datetime_id
  LEFT JOIN `yellow-cab-data-engineer.dim.dim_vendor` dv ON f.vendor_id = dv.vendor_id
  LEFT JOIN `yellow-cab-data-engineer.dim.dim_rate_code` drc ON f.ratecode_id = drc.ratecode_id
  LEFT JOIN `yellow-cab-data-engineer.dim.dim_pickup_location` dpl ON f.pickup_location_id = dpl.pickup_location_id
  LEFT JOIN `yellow-cab-data-engineer.dim.dim_dropoff_location` ddl ON f.dropoff_location_id = ddl.dropoff_location_id
  LEFT JOIN `yellow-cab-data-engineer.dim.dim_payment_type` dpt ON f.payment_type_id = dpt.payment_type_id
);