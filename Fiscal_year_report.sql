-- set @@global.sql_mode := concat('ONLY_FULL_GROUP_BY,', @@global.sql_mode);
select get_fiscal_year(date) as fiscal_year ,
sum(round(gp.gross_price*f.sold_quantity,2)) as yearly_sales
from fact_sales_monthly f
join fact_gross_price gp on
                    gp.fiscal_year = get_fiscal_year(f.date) and
                    gp.product_code = f.product_code
where 
    f.customer_code = 90002002
group by fiscal_year
order by fiscal_year;