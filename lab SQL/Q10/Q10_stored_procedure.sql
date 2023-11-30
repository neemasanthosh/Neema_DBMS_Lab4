# Q10) Create a stored procedure to display supplier id, name, Rating(Average rating of all the products sold by every customer) and
#Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average
#Service” else print “Poor Service”. Note that there should be one rating per supplier.
---------------------------------------------------------------------------------------------------------------------------------------------

	DELIMITER $$
USE `ecommerce`$$
CREATE PROCEDURE `supplier_ratings` ()
BEGIN
select report.SUPP_ID, report.SUPP_NAME, report.Average,
CASE
	WHEN report.Average =5 THEN 'Excellent Service'
	WHEN report.Average >4 THEN 'Good Service'
	WHEN report.Average >2 THEN 'Average Service'
	ELSE 'Poor Service'
END AS Type_of_Service from
(
	select final.SUPP_ID, supplier.SUPP_NAME, final.Average from
		(
			select test2.SUPP_ID, avg(rat_ratstars) as Average from
				(
					select sp.SUPP_ID, t1.ORD_ID, t1.RAT_RATSTARS from supplier_pricing as sp
					inner join
					(
						select o.PRICING_ID, rat.ORD_ID , rat.RAT_RATSTARS from orderr as o
						inner join 
						rating as rat on o.ORD_ID = rat.ORD_ID
					) as t1 on sp.PRICING_ID = t1.PRICING_ID
				) as test2 group by sp.SUPP_ID
		) as final
	inner join supplier where final.SUPP_ID = supplier.SUPP_ID
) as report;

END$$

DELIMITER ;

