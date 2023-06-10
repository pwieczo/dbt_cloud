select  
         o.orderid
        , o.ORDERDATE
        , o.SHIPDATE
        , o.SHIPMODE
        , o.ORDERSELLINGPRICE - o.ORDERCOSTPRICE as orderprofit
        , o.ORDERSELLINGPRICE
        , o.ORDERCOSTPRICE
        , c.CUSTOMERNAME
        , c.CUSTOMERID
        , c.SEGMENT
        , c.COUNTRY
        , p.CATEGORY
        , p.PRODUCTNAME
        , p.SUBCATEGORY
        , p.PRODUCTID
from
        {{ ref('raw_order') }} as o
left join
        {{ ref('raw_customer') }} as c
on
        o.CUSTOMERID = c.CUSTOMERID
left join 
        {{ ref('raw_product') }} as p
on  
        o.PRODUCTID = p.PRODUCTID
