DELIMITER //

CREATE PROCEDURE `get_market_badge`()
BEGIN

	declare qty int default 0;

	-- Retrive Total quantity for a given fiscal year
	SELECT sum(f.sold_quantity) into qty
    from fact_sales_monthly f 
	join dim_customer d on 
			f.customer_code = d.customer_code
	where get_fiscal_year(f.date) = in_fiscal_year and d.market = in_market
	group by d.market;
    
    -- Determine Market badge
    if qty > 5000000 then
		set out_badge = 'Gold';
	else
		set out_badge = 'Silver';
	end if;
    

END

DELIMITER ;
