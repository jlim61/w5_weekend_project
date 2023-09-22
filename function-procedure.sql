--functions and procedures

--function that will create a new service ticket (as if service was done)

CREATE OR REPLACE FUNCTION serviceComplete (_customer_id INTEGER, _car_id INTEGER, _mechanic_id INTEGER[]) RETURNS VOID
LANGUAGE plpgsql AS $$
	BEGIN
		INSERT INTO service_ticket (customer_id, car_id, mechanic_id)
		VALUES (_customer_id, _car_id, _mechanic_id);
	END
$$;

DROP FUNCTION serviceComplete(INTEGER, INTEGER, INTEGER[]);

--function that will create an invoice (as if car was sold)

CREATE OR REPLACE FUNCTION createInvoice (_amount NUMERIC(8, 2), _car_id INTEGER, _salesperson_id INTEGER, _customer_id INTEGER) RETURNS VOID
LANGUAGE plpgsql AS $$
	BEGIN
		INSERT INTO invoices (amount, car_id, salesperson_id, customer_id)
		VALUES (_amount, _car_id, _salesperson_id, _customer_id);
	END
$$;

DROP FUNCTION createInvoice(NUMERIC, INTEGER, INTEGER, INTEGER);

--procedure that will update car customer_id and date as if it was sold
CREATE OR REPLACE PROCEDURE carSold (_invoice_id INTEGER)
LANGUAGE plpgsql AS $$
	BEGIN
		DECLARE
			invoice_purchase_date DATE;
			invoice_customer_id INTEGER;
			invoice_car_id INTEGER;
		BEGIN
			SELECT purchase_date, customer_id, car_id
			INTO invoice_purchase_date, invoice_customer_id, invoice_car_id
			FROM invoices
			WHERE invoice_id = _invoice_id;
		
			UPDATE cars
			SET date_sold = invoice_purchase_date,
					customer_id = invoice_customer_id
			WHERE car_id = invoice_car_id;
		END;
	END;
$$;