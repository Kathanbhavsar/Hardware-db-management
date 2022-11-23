EXPLAIN ANALYZE
-- Creating a new table instead of using the get_fiscal_year funtion decreases the time significantly as the 
-- function is called on each and every row or entry of the table so creating a new table helps to reduce the time
select s.date, s.product_code, 
       p.product,
       p.variant , s.sold_quantity,
       g.gross_price , ROUND(g.gross_price*s.sold_quantity,2) as gross_price_total,
       fd.pre_invoice_discount_pct
        from fact_sales_monthly s 
join dim_product p on 
            p.product_code = s.product_code
            

join dim_date dd on
            dd.calender_date = s.date
join fact_gross_price g on 
            g.product_code = s.product_code  and 
            g.fiscal_year = dd.fiscal_year
            

join fact_pre_invoice_deductions fd on 
                    fd.customer_code = s.customer_code
                    and fd.fiscal_year = dd.fiscal_year


where
        -- s.customer_code=90002002 and
        dd.fiscal_year = 2021
limit 1000000
                            