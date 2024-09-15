# Queries optimisation
## Exercise 1
With the database generate with the procedure provided on the pre-lab presentation:
- Explore the generated data and try to query it on pgAdmin (or your preferred tool).
- Using explain capture the total cost that take to fetch the data
- Create three different queries and show the cost for each query.
- Create single-column b-tree and hash indexes on the previously created table using any fields you like (but different fields for each!).
- Using explain shows the elapsed time and the cost and compared with the results obtained before the index creation.
- Is there any difference? Which queries are faster? (If you can’t see the difference try to increase the generated data to 1M)

Submission is three queries with after/before indexes creation.

[Solution](./ex1.sql)

## Exercise 2
Import the DVD rental database
Using the database, provide a query for each of the following requirements: 
- The company is preparing its campaign for next Halloween, so the list of movies that have not been rented yet by the clients is needed, whose rating is R or PG-13 and its category is Horror or Sci-fi
- The company has decided to reward the best stores in each of the cities, so it is necessary to have a list of the stores that have made a greater number of sales in term of money during the last month recorded.

Using the EXPLAIN PLAN, identify the most expensive step of your queries execution plans and propose a solution for it.

[Solution](./ex2.sql)
