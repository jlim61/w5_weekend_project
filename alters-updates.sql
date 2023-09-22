--alters/updates

--altering salesperson table
--adding dealership_id
ALTER TABLE salesperson ADD COLUMN dealership_id INTEGER NOT NULL;
--making dealership_id foreign key in salesperson table
ALTER TABLE salesperson ADD FOREIGN KEY (dealership_id) REFERENCES dealership (dealership_id);

--altering mechanics table
--adding dealership_id
ALTER TABLE mechanics ADD COLUMN dealership_id INTEGER NOT NULL;
--making dealership_id foreign key in mechanics table
ALTER TABLE mechanics ADD FOREIGN KEY (dealership_id) REFERENCES dealership (dealership_id);

--altering cars table
--adding dealership_id
ALTER TABLE cars ADD COLUMN dealership_id INTEGER NOT NULL;
--making dealership_id foreign key in cars table
ALTER TABLE cars ADD FOREIGN KEY (dealership_id) REFERENCES dealership (dealership_id);

--had invoices starting at 2
DELETE FROM invoices;
SELECT setval('invoices_invoice_id_seq', 1, false);

--accidentally had my carSold update all fields in purchase date and customer id, resetting them
UPDATE cars
SET date_sold = NULL;
UPDATE cars
SET customer_id = NULL;