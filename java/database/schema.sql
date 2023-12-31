BEGIN TRANSACTION;

DROP TABLE IF EXISTS users, cars, patrons, slips, parking_lot, parking_spots;

CREATE TABLE users (
   user_id SERIAL,
   username varchar(50) NOT NULL UNIQUE,
   password_hash varchar(200) NOT NULL,
   role varchar(50) NOT NULL,
   CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE TABLE patrons (
    patron_id SERIAL,
    user_id INTEGER,
    name varchar(50),
    phone_number varchar(10),
    CONSTRAINT PK_patron PRIMARY KEY (patron_id),
    CONSTRAINT FK_user_id FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE cars (
    car_id SERIAL,
    make varchar(50),
    model varchar(50),
    color varchar(50),
    license_plate varchar(50),
    vin_number varchar(17) NOT NULL,
    patron_id INTEGER NOT NULL,
    CONSTRAINT PK_car PRIMARY KEY (car_id),
    CONSTRAINT FK_patron_id FOREIGN KEY (patron_id) REFERENCES patrons(patron_id)
);

CREATE TABLE slips (
    slip_number SERIAL,
    patron_id INTEGER,
    car_id INTEGER,
    arrival_time timestamp NOT NULL,
    departure_time timestamp,
    hourly_price decimal(5,2) DEFAULT 5.00,
    total decimal(5,2),
    CONSTRAINT PK_slip PRIMARY KEY (slip_number),
    CONSTRAINT FK_patron_id FOREIGN KEY (patron_id) REFERENCES patrons(patron_id),
    CONSTRAINT FK_car_id FOREIGN KEY (car_id) REFERENCES cars(car_id)
);

CREATE TABLE parking_spots (
    spot_number INTEGER UNIQUE,
    car_id INTEGER,
    is_available boolean NOT NULL,
    CONSTRAINT PK_parking_lot PRIMARY KEY (spot_number),
    CONSTRAINT FK_car_id FOREIGN KEY (car_id) REFERENCES cars(car_id),
    CONSTRAINT spot_number_equal_or_less_10 CHECK (spot_number <= 10)

);

INSERT INTO parking_spots (spot_number, is_available)
values (1, true),
       (2, true),
       (3, true),
       (4, true),
       (5, true),
       (6, true),
       (7, true),
       (8, true),
       (9, true),
       (10, true);

COMMIT TRANSACTION;
