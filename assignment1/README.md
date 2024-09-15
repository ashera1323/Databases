# Databases Assignment 1
## Description
For this assignment, you must analyze and improve the database performance (considering only the performance for READ operations) for three queries that are
frequently executed in your system. You can only create indexes, so you should write DDL instructions that will be executed on the database by the DBA of your company.
The database management system to be used is a recent version of PostgreSQL with the DVD Rental database provided.

Query 1 (auditing staff):
```
EXPLAIN ANALYZE
SELECT r1.staff_id, p1.payment_date
FROM rental r1, payment p1
WHERE r1.rental_id = p1.rental_id AND
NOT EXISTS (SELECT 1 FROM rental r2, customer c WHERE r2.customer_id =
c.customer_id and active = 1 and r2.last_update > r1.last_update);
```
