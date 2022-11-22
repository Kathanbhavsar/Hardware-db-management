select f.date,
       ROUND(SUM(gp.gross_price*f.sold_quantity),2) as gross_price_total 
       from fact_sales_monthly f
join fact_gross_price gp on 
            gp.product_code = f.product_code and
            gp.fiscal_year = get_fiscal_year(f.date)
where 
    customer_code=90002002
GROUP BY f.date

order by f.date asc