# PL/pgSql Functions
## EXERCISE 1
From DVD rental database Table address have column address as text (you want to convert address to Longitude/latitude and create new two columns in address table).
Steps:
- Create Function to retrieve addresses that contains “11” and city_id between 400-600.
- Call the function from Python script and use geoPy to generate longitude and latitude and Create Query to update Address table with new values.
- Any area that geoPy not recognize put 0,0 for both values.

[Solution: python](./ex1.py)
[Solution: sql](./ex1.sql)
**Conclusion:**
The "address" table altered with my code (i put longitude and latitude into the column "address2", because it was initially empty for some reason)
 ![alt text](https://github.com/ashera1323/Databases/blob/main/week9/ex1.png)
 
The output of my python code
 ![alt text](https://github.com/ashera1323/Databases/blob/main/week9/ex1-console.png)

## EXERCISE 2
In Customer Table we have less than 600 customers and you don’t have backend developer to do paging.. Your job is to create function to retrieve customers order by address_id and it will take two parameters (start,end).
For example: retrievecustomers(10,40):
- 10 is customer number 10 in the query.
- If start or end is negative number or more than 600 show an error message describe the error.
Submit SQL query to create the function with example.

[Solution](./ex2.sql)

**Conclusion:**
The output of the sql function
 ![alt text](https://github.com/ashera1323/Databases/blob/main/week9/ex2.png)
The error
 ![alt text](https://github.com/ashera1323/Databases/blob/main/week9/ex2-error.png)

