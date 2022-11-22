CREATE DEFINER=`root`@`localhost` PROCEDURE `get_monthly_gross_sales_for_customers`(

			c_code INT
)
BEGIN

		select get_fiscal_year(date) as fiscal_year ,
		sum(round(gp.gross_price*f.sold_quantity,2)) as yearly_sales
		from fact_sales_monthly f
		join fact_gross_price gp on
							gp.fiscal_year = get_fiscal_year(f.date) and
							gp.product_code = f.product_code
		where 
			f.customer_code = c_code
		group by fiscal_year
		order by fiscal_year;
		
END