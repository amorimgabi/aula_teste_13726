select
    c.customer_id,
    c.first_name,
    c.last_name,
    c.first_name || ' ' || c.last_name as full_name,
    count(o.order_id) as number_of_orders,
    min(o.order_date) as first_order_date,
    max(o.order_date) as most_recent_order_date,
    coalesce(sum(o.amount), 0) as lifetime_value
from {{ ref('stg_customers') }} as c
left join {{ ref('fct_orders') }} as o
    on c.customer_id = o.customer_id
group by 1, 2, 3, 4
