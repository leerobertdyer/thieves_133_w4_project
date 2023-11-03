INSERT INTO customer(
    full_name,
    credit_score,
    customer_address,
    phone_num
)VALUES (
    'Lee Bob',
    720,
    '44 Browndog dale Ln,
    Asheville, NC 28805',
    '231-881-8138'
);

INSERT INTO customer(
    full_name,
    credit_score,
    customer_address,
    phone_num
)VALUES (
    'Mary Barry Jane',
    666,
    '69 LowTuck Lane,
    Nashville, TN 34242',
    '001-010-0011'
);

INSERT INTO salesperson (full_name)
VALUES ('Big Chuk');


INSERT INTO salesperson (full_name)
VALUES ('Little Larry');

INSERT INTO car(
    make,
    model,
    model_year
)VALUES (
    'Mazda',
    'Miata',
    '2000-01-01'
);

INSERT INTO car(
    make,
    model,
    model_year
)VALUES (
    'Jeep',
    'Wrangler',
    '2024-01-01'
);

INSERT INTO car(
    make,
    model,
    model_year
)VALUES (
    'Ford',
    'Taurus',
    '2001-01-01'
);


INSERT INTO mechanic(
    full_name
)VALUES (
    'Jim Mariner'
);

INSERT INTO mechanic(
    full_name
)VALUES (
    'George Harry McPackleson'
);

INSERT INTO invoice(
    car_id,
    customer_id,
    seller_id,
    amount,
    payDate
)VALUES(
    2,
    1,
    1,
    450000,
    '2023-11-2'
);

INSERT INTO invoice(
    car_id,
    customer_id,
    seller_id,
    amount,
    payDate
)VALUES(
    1,
    2,
    2,
    150000,
    '2023-11-2'
);


INSERT INTO service_ticket(
    car_id
)VALUES(
    1
);

INSERT INTO service_ticket(
    car_id
)VALUES(
    3
);

INSERT INTO service_history(
    ticket_id,
    mech_id,
    customer_id,
    car_id,
    service_description,
    amount,
    payDate
)VALUES(
    1,
    1,
    1,
    1,
    'We had to replace the rubber hose capaciter flux drainage system. It is one of a kind, so gonna cost a good bit...',
    7199,
    '2023-10-30'
);

INSERT INTO service_history(
    ticket_id,
    mech_id,
    customer_id,
    car_id,
    service_description,
    amount,
    payDate
)VALUES(
    1,
    2,
    1,
    1,
    'Jimbo is an idiot. These cars do not have rubber manifolds! They do however need rust removal services which is a bit more than the previous estimate...',
    9199,
    '2023-10-30'
);

SELECT * FROM mechanic;


SELECT * FROM car
INNER JOIN service_history ON(
    car.car_id=service_history.car_id
)INNER JOIN mechanic ON(
    service_history.mech_id=mechanic.mech_id
);

SELECT * FROM customer
LEFT JOIN invoice ON(
    customer.customer_id=invoice.customer_id
);

-- Playing around with abbreviations. I was searching how to inner join a ton of tables and got the idea from that.

SELECT * FROM invoice AS i
INNER JOIN car ON(
    i.car_id=car.car_id
)INNER JOIN salesperson AS s ON(
    i.seller_id=s.seller_id
)INNER JOIN customer AS c ON(
    i.customer_id=c.customer_id
);