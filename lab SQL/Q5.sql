# Q5) Display all the orders along with product name ordered by a customer having Customer_Id=2

select q.CUS_ID, q.CUS_NAME, q.ORD_ID, product.PRO_NAME from
(
	select c.CUS_ID, c.CUS_NAME, p.ORD_ID, p.ORD_AMOUNT, p.PRO_ID from
	( 
		select o.*, sp.PRO_ID from orderr as o
		INNER JOIN supplier_pricing as sp
		where o.PRICING_ID = sp.PRICING_ID
    ) as p
	INNER JOIN customer as c
	where p.CUS_ID = c.CUS_ID and c.CUS_ID=2
) as q
inner join product
on q.PRO_ID = product.PRO_ID;