# Q8) Display the Id and Name of the Product ordered after “2021-10-05”.

select p.PRO_ID, p.PRO_NAME from product as p
inner join 
(
	SELECT o.*, sp.PRO_ID FROM orderr AS o
	inner join 
	supplier_pricing as sp on sp.PRICING_ID = o.pricing_id and o.ORD_DATE > "2021-10-05"
) as q 
on p.PRO_ID = q.PRO_ID;