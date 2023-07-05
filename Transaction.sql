use `DB-LLD`;

SET SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SELECT @@transaction_ISOLATION;

START TRANSACTION;
SELECT * FROM products where productId = 8;
UPDATE products set quantity = 5500 WHERE productId = 8;
COMMIT;

-- T1 and T2 
-- T1 starts -> price of oil = 200   || T2 set the price of oil = 500
-- increase the price of oil by 100  || commit
-- 300
-- T1 commit  - final will remain as instead of 600 


-- productId -> 2 unitPrice - 200


