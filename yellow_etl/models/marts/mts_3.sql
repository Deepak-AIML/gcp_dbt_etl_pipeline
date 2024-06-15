with mts_3 as (
  SELECT 
  VendorID,
  payment_type,
  SUM(sum_amount) AS total_amount_spent,
  FROM {{ ref('int_transformation') }}
  GROUP BY VendorID, payment_type
  ORDER BY total_amount_spent DESC
)

select * from mts_3