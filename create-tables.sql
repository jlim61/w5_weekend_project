--Creating Tables from ERD

--customers table
CREATE TABLE customers (
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR,
	last_name VARCHAR,
	address VARCHAR,
	billing_info VARCHAR
);

--cars table
CREATE TABLE cars (
	car_id SERIAL PRIMARY KEY,
	car_status VARCHAR(10),
	license_plate VARCHAR(15),
	make VARCHAR,
	model VARCHAR,
	"year" INTEGER,
	date_sold DATE,
	customer_id INTEGER,
	FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);

--salesperson table
CREATE TABLE salesperson (
	salesperson_id SERIAL PRIMARY KEY,
	first_name VARCHAR,
	last_name VARCHAR,
	phone_number VARCHAR
);

--mechanics table
CREATE TABLE mechanics (
	mechanic_id SERIAL PRIMARY KEY,
	first_name VARCHAR,
	last_name VARCHAR,
	phone_number VARCHAR
);

--dealership table
CREATE TABLE dealership(
	dealership_id SERIAL PRIMARY KEY,
	address VARCHAR,
	phone_number VARCHAR
);

--invoices table
CREATE TABLE invoices (
	invoice_id SERIAL PRIMARY KEY,
	amount NUMERIC(8, 2),
	purchase_date DATE DEFAULT CURRENT_DATE,
	car_id INTEGER NOT NULL,
	salesperson_id INTEGER NOT NULL,
	customer_id INTEGER NOT NULL,
	FOREIGN KEY (car_id) REFERENCES cars (car_id),
	FOREIGN KEY (salesperson_id) REFERENCES salesperson (salesperson_id),
	FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);

--service ticket table
CREATE TABLE service_ticket (
	service_ticket_id SERIAL PRIMARY KEY,
	customer_id INTEGER NOT NULL,
	car_id INTEGER NOT NULL,
	mechanic_id INTEGER[] NOT NULL,
	date_of_service DATE DEFAULT CURRENT_DATE,
	FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
	FOREIGN KEY (car_id) REFERENCES cars (car_id)
);

--service_ticket_mechanics table (so I can allow an array in my service ticket to allow multiple mechanics)
CREATE TABLE service_ticket_mechanics (
    service_ticket_id INTEGER NOT NULL,
    mechanic_id INTEGER NOT NULL,
    FOREIGN KEY (service_ticket_id) REFERENCES service_ticket (service_ticket_id),
    FOREIGN KEY (mechanic_id) REFERENCES mechanics (mechanic_id)
);

--service history table
CREATE TABLE service_history (
    service_history_id SERIAL PRIMARY KEY,
    service_ticket_id INTEGER NOT NULL,
    customer_id INTEGER NOT NULL,
    car_id INTEGER NOT NULL,
    FOREIGN KEY (service_ticket_id) REFERENCES service_ticket (service_ticket_id),
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
    FOREIGN KEY (car_id) REFERENCES cars (car_id)
);

--invoice history table
CREATE TABLE invoice_history (
	invoice_history_id SERIAL PRIMARY KEY,
	invoice_id INTEGER NOT NULL,
	customer_id INTEGER NOT NULL,
	car_id INTEGER NOT NULL,
	FOREIGN KEY (invoice_id) REFERENCES invoices (invoice_id),
	FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
	FOREIGN KEY (car_id) REFERENCES cars (car_id)
);





