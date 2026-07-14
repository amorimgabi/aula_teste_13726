select
    id as customer_id,
    first_name,
    last_name
from {{ source('e_commerce_raw', 'raw_customers') }}