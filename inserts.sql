--Data Insertions into Car Dealership Database

--adding dealership
INSERT INTO dealership (address, phone_number)
VALUES ('1234 Poke Street, Pallet Town 67799 Kanto', '(949) 678-1234');

--adding salesperson
INSERT INTO salesperson (first_name, last_name, phone_number, dealership_id)
VALUES ('Gary', 'Oak', '(333) 657-7659', 1),
				('Ash', 'Ketchum', '(444) 577-0146', 1),
				('Samuel', 'Oak', '(701) 461-1559', 1),
				('Tracey', 'Sketchit', '(850) 055-9852', 1);
				
--adding customers
INSERT INTO customers (first_name, last_name, address, billing_info)
VALUES ('Aurea', 'Juniper', '53 Poke Drive, Nuvema Town 51356 Unova', '1111-2222-3333-4444 753 11/2024'),
				('Todd', 'Snap', '8615 Poke Way, Celadon City 56984 Kanto', '5555-2222-3333-4444 432 02/2024'),
				('Freddy', 'O''Martian', '87462 Poke Place, Castelia City 91356 Unova', '2222-2222-3333-5555 785 10/2024'),
				('Delia', 'Ketchum', '5 Poke Boulevard, Pallet Town 67799 Kanto', '3333-2222-5555-2222 387 05/2024'),
				('Steven', 'Stone', '5103 Poke Road, Mossdeep City 13511 Hoenn', '3333-5555-1111-1111 214 10/2024'),
				('Dawn', 'Berlitz', '6622 Poke Avenue, Sandgem Town 99941 Sinnoh', '1111-1111-5555-3333 651 12/2024');
				
--adding mechanics
INSERT INTO mechanics (first_name, last_name, phone_number, dealership_id)
VALUES ('Cedric', 'Juniper', '(453) 934-7852', 1),
				('Flannery', 'Moore', '(245) 678-3112', 1),
				('Robert', 'Surge', '(455) 234-5788', 1),
				('Augustine', 'Sycamore', '(786) 785-3787', 1);

--adding cars
INSERT INTO cars (car_status, license_plate, make, model, "year", dealership_id)
VALUES ('New', '515SD5D','PikachAuto','Camrymander','2024', 1),
				('Used', '2R9GG6F','Ferrizard','LaFerreevee','2020', 1),
				('Used', 'A2A3364','Volkswagonite','Jettaleon','2020', 1),
				('New', 'H8E1R2D','PikachAuto','Corollpix','2024', 1),
				('Used', 'N9W44G5','Volkswagonite','Scytherossa','2021', 1),
				('New', 'WW1B1S3','Ferrizard','488Magikarp','2024', 1),
				('New', '118DDF4','PikachAuto','Tundraquaza','2024', 1),
				('New', 'W2R5147','Ferrizard','458Charizard','2024', 1);
				
--trying to use createInvoice function to "sell" a car
SELECT createInvoice (12000.00, 3, 2, 6);

--trying to use procedure to update car info now since car was sold
CALL carSold (1);

--selling another car and updating cars table
SELECT createInvoice (350000.00, 6, 4, 1);
CALL carSold (2);

--trying to use serviceComplete function to service a car w/ multiple mechanics
SELECT serviceComplete(1, 6, ARRAY[1,2,3]);

--trying to use serviceComplete function to service a car w/ one mechanic
SELECT serviceComplete(1, 6, ARRAY[1]);