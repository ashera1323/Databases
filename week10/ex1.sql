1) First part of the task
// Creating a table
CREATE TABLE accounts (
    id int GENERATED BY DEFAULT AS IDENTITY,
    name text,
    credit int,
    currency text,
    PRIMARY KEY(id)
);

// Inserting data
INSERT INTO accounts (name, credit, currency)
VALUES  ('Dave', 1000, 'rub'),
        ('Alisa', 1000, 'rub'),
        ('Shon', 1000, 'rub')
COMMIT;

// Creating first transaction
BEGIN;
UPDATE accounts
SET credit = credit - 500
WHERE id = 1;
UPDATE accounts
SET credit = credit + 500
WHERE id = 3;
SAVEPOINT T1;
COMMIT;

// Creating second transaction
BEGIN;
UPDATE accounts
SET credit = credit - 700
WHERE id = 2;
UPDATE accounts
SET credit = credit + 700
WHERE id = 1;
SAVEPOINT T2;
COMMIT;

// Creating third transaction
BEGIN;
UPDATE accounts
SET credit = credit - 100
WHERE id = 2;
UPDATE accounts
SET credit = credit + 100
WHERE id = 3;
SAVEPOINT T3;
COMMIT;

// Display the data from accounts
SELECT * FROM accounts;

2) Second part of the task
// Add the Bank types
ALTER TABLE accounts
ADD COLUMN bank text;

UPDATE accounts
SET bank = 'SberBank'
WHERE id IN (1, 3);

UPDATE accounts
SET bank = 'Tinkoff'
WHERE id = 2;

INSERT INTO accounts(name, credit, currency)
VALUES('Fees', 0, 'rub')
COMMIT;

// Creating first transaction
BEGIN;
UPDATE accounts
SET credit = credit - 500
WHERE id = 1;
UPDATE accounts
SET credit = credit + 500
WHERE id = 3;
SAVEPOINT T1;
COMMIT;

// Creating second transaction
BEGIN;
UPDATE accounts
SET credit = credit - 700
WHERE id = 2;
UPDATE accounts
SET credit = credit + 700
WHERE id = 1;
UPDATE accounts
SET credit = credit - 30
WHERE id = 2;
UPDATE accounts
SET credit = credit + 30
WHERE id = 4;
SAVEPOINT T2;
COMMIT;


// Creating third transaction
BEGIN;
UPDATE accounts
SET credit = credit - 100
WHERE id = 2;
UPDATE accounts
SET credit = credit + 100
WHERE id = 3;
UPDATE accounts
SET credit = credit - 30
WHERE id = 2;
UPDATE accounts
SET credit = credit + 30
WHERE id = 4;
SAVEPOINT T3;
COMMIT;

// Display the data
SELECT * FROM accounts;

3) Third part of the task
// Create table Ledger
CREATE TABLE ledger (
                    id int GENERATED BY DEFAULT AS IDENTITY,
                    from_id int,
                    to_id int,
                    fee int,
                    amount int,
                    transaction_date_time timestamp);

COMMIT;

// Creating first transaction and saving transaction
BEGIN;
UPDATE accounts
SET credit = credit - 500
WHERE id = 1;
UPDATE accounts
SET credit = credit + 500
WHERE id = 3;
INSERT INTO ledger (from_id, to_id, fee, amount, transaction_date_time)
VALUES (1, 3, 0, 500, now());
SAVEPOINT T1;
COMMIT;

// Creating second transaction and saving transaction
BEGIN;
UPDATE accounts
SET credit = credit - 700
WHERE id = 2;
UPDATE accounts
SET credit = credit + 700
WHERE id = 1;
UPDATE accounts
SET credit = credit - 30
WHERE id = 2;
UPDATE accounts
SET credit = credit + 30
WHERE id = 4;
INSERT INTO ledger (from_id, to_id, fee, amount, transaction_date_time)
VALUES (2, 1, 30, 700, now());
SAVEPOINT T2;
COMMIT;

// Creating third transaction and saving transaction
BEGIN;
UPDATE accounts
SET credit = credit - 100
WHERE id = 2;
UPDATE accounts
SET credit = credit + 100
WHERE id = 3;
UPDATE accounts
SET credit = credit - 30
WHERE id = 2;
UPDATE accounts
SET credit = credit + 30
WHERE id = 4;
INSERT INTO ledger (from_id, to_id, fee, amount, transaction_date_time)
VALUES (2, 3, 30, 100, now())
SAVEPOINT T3;
COMMIT;

// Display the data
SELECT * FROM accounts;