-- Database connection string link:
-- postgres://jnjlqrhe:tlETBtmEP9Y_wUVbOKdyHts3wwz2xYNq@suleiman.db.elephantsql.com/jnjlqrhe


--NOTES
--      I am still having trouble understanding the relationship lines from table to table. 
--      I get what they mean, and which ones to use (for the most part)
--      But I don't understand why we are using them.
--      I spent more time deciding which ends to put on the lines than on any other part of the project

--      I also still struggle a bit with the Primary and Foreign Key use. I tried to keep them at a minimal after watching your video,
--      But it's hard to trust that you'll be able to access them through a variety of joins. 
--      I'm sure that I'll get used to this over time.

CREATE TABLE customer (
    customer_id SERIAL PRIMARY KEY,
    full_name VARCHAR(2550) NOT NULL,
    credit_score INTEGER,
    customer_address VARCHAR(250),
    phone_num VARCHAR(250)
);

CREATE TABLE car (
    car_id SERIAL PRIMARY KEY,
    make VARCHAR(50),
    model VARCHAR(50),
    model_year DATE
);

CREATE TABLE salesperson (
    seller_id SERIAL PRIMARY KEY,
    full_name VARCHAR(255)
);

CREATE TABLE mechanic(
    mech_id SERIAL PRIMARY KEY,
    full_name VARCHAR(255)
);

CREATE TABLE invoice(
    invoice_id SERIAL PRIMARY KEY,
    car_id INTEGER REFERENCES car(car_id),
    customer_id INTEGER REFERENCES customer(customer_id),
    seller_id INTEGER REFERENCES salesperson(seller_id),
    amount INTEGER,
    payDate DATE
);

CREATE TABLE service_ticket(
    ticket_id SERIAL PRIMARY KEY,
    car_id INTEGER REFERENCES car(car_id)
);

CREATE TABLE service_history(
    ticket_id INTEGER REFERENCES service_ticket(ticket_id),
    mech_id INTEGER REFERENCES mechanic(mech_id),
    customer_id INTEGER REFERENCES customer(customer_id),
    car_id INTEGER REFERENCES car(car_id),
    service_description VARCHAR,
    amount INTEGER,
    payDate DATE
);