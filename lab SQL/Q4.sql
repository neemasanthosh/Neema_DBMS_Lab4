# Q4) Display the total number of customers based on gender who have placed individual orders of worth at least Rs.3000.

select count(T2.CUS_GENDER) as No_of_Customers, T2.CUS_GENDER as Gender from
	(
		select T1.CUS_ID, T1.ORD_AMOUNT, T1.CUS_GENDER, T1.CUS_NAME from
		(
			select o.*, c.CUS_NAME, c.CUS_GENDER from orderr as o
			INNER JOIN customer as c
			on c.CUS_ID = o.CUS_ID HAVING o.ORD_AMOUNT >= 3000
		) as T1
	) as T2 GROUP BY T2.CUS_GENDER;