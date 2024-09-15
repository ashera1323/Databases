-- Test with Read committed, Repeatable read isolation levels. Connect to your database using postgres CLI from 2 different sessions to:
----[-----------------
--  Read committed  --
----------------------
-- after step 4

-- Output is different since changes of second terminal is uncommitted and isolation levels are "Read committed"

-- Step 5

-- output: initial table contents + changed username of Alice Jones


-- Step 8

-- Output: None, GUI loads in loop and prints "Waiting for the query to complete". It is so since we cannot determine the value of Alice's balance field until changes are aborted or committed


-----------------------
--  Repeatable read  --
-----------------------
-- after step 4

-- Output is different since changes are made in second terminal and isolation levels are "Repeatable read", so versions of table in terminals are independent from each other

-- Step 5

-- second terminal

-- Output is still different since isolation levels are "Repeatable read", so versions of table in terminals are independent from each other

-- Step 7

-- output: ERROR: could not serialize access due to concurrent update

-- Step 8

-- The output from second terminal is "UPDATE 1" that mean success. In contrast, the output of first terminal is error since it is illegal due to use of "Repeatable read" isolation level and commit in different terminal, i.e. if we will commit in first terminal after update we will make the table contents inconsistent (of course, we can accept committed changes, but it is prohibited due to use of "Repeatable read" isolation level).




----------------------
--  Read committed  --
----------------------
-- Start a transaction (T1 & T2)

-- T1

begin;

set transaction ISOLATION LEVEL READ COMMITTED;

-- T2

begin;

set transaction ISOLATION LEVEL READ COMMITTED;

-- Read accounts with group_id=2 (T1).

SELECT * FROM balance WHERE group_id = 2;

-- output: mike row

-- Move Bob to group 2(T2).

UPDATE balance 
SET group_id = 2
WHERE username = 'bbrown';

-- Read accounts with group_id=2 (T1).

SELECT * FROM balance WHERE group_id = 2;

-- output: mike row, since terminal's version do not see uncommited changes of others' due to read commited isolation level

-- Update selected accounts balances by +15 (T1).

UPDATE balance 
SET balance = balance + 15
WHERE group_id = 2;

-- Commit transaction (T1 & T2).

-- T1

commit;

-- T2

commit;

-- Explain the result for both isolation levels

-- As a result rows were update such that bob moved to group 2 and only mike got balance +15. Serialization anomaly happened. If we will run the T1 after T2 we would get that both rows got balance +15, but due to overlapping only mike's balance changed.

-----------------------
--  Repeatable read  --
----------------------=

-- Start a transaction (T1 & T2)

-- T1

begin;

set transaction ISOLATION LEVEL REPEATABLE READ;

-- T2
begin;

set transaction ISOLATION LEVEL READ COMMITTED;

-- Read accounts with group_id=2 (T1).

SELECT * FROM balance WHERE group_id = 2;

-- output: mike row

-- Move Bob to group 2(T2).

UPDATE balance 
SET group_id = 2
WHERE username = 'bbrown';

-- Read accounts with group_id=2 (T1).

SELECT * FROM balance WHERE group_id = 2;

-- output: mike row, since terminal's version independent from others' due to repeatable read isolation level

-- Update selected accounts balances by +15 (T1).

UPDATE balance 
SET balance = balance + 15
WHERE group_id = 2;

-- Commit transaction (T1 & T2).

-- T1

commit;

-- T2

commit;

-- Explain the result for both isolation levels

-- As a result rows were update such that bob moved to group 2 and only mike got balance +15. Serialization anomaly happened. If we will run the T1 after T2 we would get that both rows got balance +15, but due to overlapping only mike's balance changed.