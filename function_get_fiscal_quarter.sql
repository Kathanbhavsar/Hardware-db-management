CREATE DEFINER=`root`@`localhost` FUNCTION `get_fiscal_quarter`(
			
            calender_date date

	) RETURNS char(2) CHARSET latin1
    DETERMINISTIC
BEGIN
	DECLARE m tinyint;
    declare quarter CHAR(2);
    
    set m = MONTH(calender_date);
    
    CASE
		when m in (9,10,11)
			then set quarter = "Q1";
		when m in (12,1,2)
			then set quarter = "Q2";
		when m in (3,4,5)
			then set quarter = "Q3";
		ELSE
			SET quarter = "Q4";
    END CASE;
	
        

RETURN quarter;
END