
-- Use the `ref` function to select from other models

select 
    p.PRODUCTID,
    p.QUANTITYUNIT,
    CAST(p.WEIGHTMEASURE AS dec) as ONE_WEIGHTMEASURE,
    s.QUANTITY*CAST(p.WEIGHTMEASURE AS dec) as TOTAL_WEIGHTMEASURE,
    p.WEIGHTUNIT
from {{source('dbt_showcase', 'products_bronze') }} as p
INNER JOIN {{ ref('SalesOrderItems_Total') }} as s
ON p.PRODUCTID=s.PRODUCTID