CREATE DATABASE belajar_acid;

USE belajar_acid;

CREATE TABLE accounts(
    id VARCHAR(100) NOT NULL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    balance BIGINT NOT NULL
) ENGINE InnoDB;

SELECT * FROM accounts;

#Atomicity
START TRANSACTION;

INSERT INTO accounts(id,name,balance)
VALUES('user1','user1', 2000000);

INSERT INTO accounts(id,name,balance)
VALUES('user2','user2', 6000000);

COMMIT;

START TRANSACTION;

DELETE FROM accounts WHERE id = 'user1';

DELETE FROM accounts WHERE id = 'user2';

ROLLBACK;

#Consistency
START TRANSACTION;
UPDATE accounts SET name = null 
WHERE id = 'user1';

ROLLBACK;
COMMIT;

TRUNCATE accounts;
DESC accounts;

#Isolation
START TRANSACTION;

SELECT * FROM accounts WHERE id IN ('user1', 'user2') FOR UPDATE;

UPDATE accounts SET balance = balance + 500000 
WHERE id = 'user1';

UPDATE accounts SET balance = balance - 500000 
WHERE id = 'user2';

COMMIT;

SELECT * FROM accounts;

#Durability
START TRANSACTION;

SELECT * FROM accounts WHERE id IN ('user1', 'user2') FOR UPDATE;

UPDATE accounts SET balance = balance + 500000 
WHERE id = 'user1';

#sql shutdown

COMMIT;