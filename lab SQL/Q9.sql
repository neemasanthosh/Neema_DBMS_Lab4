# Q9) Display customer name and gender whose names start or end with character 'A'.

select customer.CUS_NAME, customer.CUS_GENDER from customer where customer.CUS_NAME like 'A%' or customer.CUS_NAME like '%A';