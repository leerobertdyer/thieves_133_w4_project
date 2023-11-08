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
    mech_id INTEGER REFERENCES mechanic(mech_id)
);


CREATE TABLE service_history(
    ticket_id INTEGER REFERENCES service_ticket(ticket_id),
    customer_id INTEGER REFERENCES customer(customer_id),
    car_id INTEGER REFERENCES car(car_id),
    service_description VARCHAR,
    amount INTEGER,
    payDate DATE
);
