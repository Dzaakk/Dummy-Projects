USE belajar_acid;

SELECT * FROM accounts;

#Test Isolation
START TRANSACTION;

SELECT * FROM accounts WHERE id IN ('user1', 'user2') FOR UPDATE;

UPDATE accounts SET balance = balance + 500000 
WHERE id = 'user1';

UPDATE accounts SET balance = balance - 500000 
WHERE id = 'user2';

COMMIT;

SELECT * FROM accounts; 