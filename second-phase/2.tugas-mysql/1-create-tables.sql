CREATE DATABASE IF NOT EXISTS repairment_ac;

CREATE TABLE roles
(
    id   INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(255)                   NOT NULL
);

CREATE TABLE users
(
    id       INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name     VARCHAR(255)                   NOT NULL,
    email    VARCHAR(255)                   NOT NUll UNIQUE,
    password VARCHAR(255),
    gender   ENUM ('l', 'p')                NOT NULL,
    photo    TEXT,
    address  TEXT,
    role     INT                            NOT NULL DEFAULT 3
);

CREATE TABLE devices
(
    id    INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name  VARCHAR(255)                   NOT NULL,
    brand VARCHAR(255)                   NOT NULL,
    pk    FLOAT                          NOT NULL,
    price DECIMAL                        NOT NULL
);

CREATE TABLE services
(
    id            INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    technician_id INT                            NOT NULL,
    client_id     INT                            NOT NULL,
    ac_id         INT                            NOT NULL,
    date          DATE                           NOT NULL,
    status        ENUM ('on repair', 'finish', 'paid', 'unpaid')
);

ALTER TABLE users
    ADD
        CONSTRAINT fk_user_role
            FOREIGN KEY (role)
                REFERENCES roles (id);

ALTER TABLE services
    ADD
        CONSTRAINT fk_client_service
            FOREIGN KEY (client_id)
                REFERENCES users (id);

ALTER TABLE services
    ADD
        CONSTRAINT fk_technician_service
            FOREIGN KEY (technician_id)
                REFERENCES users (id);

ALTER TABLE services
    ADD
        CONSTRAINT fk_device_service
            FOREIGN KEY (ac_id)
                REFERENCES devices (id);

-- LOAD DUMMY DATA

INSERT INTO roles (id, name)
VALUES (1, 'admin');
INSERT INTO roles (id, name)
VALUES (2, 'technician');
INSERT INTO roles (id, name)
VALUES (3, 'client');

INSERT INTO users (id, name, email, password, gender, photo, address, role)
VALUES (1, 'Fulan', 'fulan@gmail.com', '******', 'L', 'https://lorem.ipsum/dolor.png', 'Jl. Cisitu Indah VI no 6',
        1);
INSERT INTO users (id, name, email, password, gender, photo, address, role)
VALUES (2, 'Fulanah', 'fulanah@gmail.com', '******', 'P', 'https://lorem.ipsum/dolor.png', 'Jl. Cisitu Indah VI no 6',
        2);
INSERT INTO users (id, name, email, password, gender, photo, address, role)
VALUES (3, 'Ardi', 'ardi@gmail.com', '******', 'L', 'https://lorem.ipsum/dolor.png', 'Jl. Cisitu Indah VI no 6', 2);
INSERT INTO users (id, name, email, password, gender, photo, address, role)
VALUES (4, 'Samsudin', 'samsudin@gmail.com', '******', 'L', 'https://lorem.ipsum/dolor.png',
        'Jl. Cisitu Indah VI no 6', 2);
INSERT INTO users (id, name, email, password, gender, photo, address, role)
VALUES (5, 'Eko', 'eko@gmail.com', '******', 'L', 'https://lorem.ipsum/dolor.png', 'Jl. Cisitu Indah VI no 6', 2);
INSERT INTO users (id, name, email, password, gender, photo, address, role)
VALUES (6, 'Sugeng', 'sugeng@gmail.com', '******', 'L', 'https://lorem.ipsum/dolor.png', 'Jl. Cisitu Indah VI no 6',
        3);
INSERT INTO users (id, name, email, password, gender, photo, address, role)
VALUES (7, 'Alif', 'alif@gmail.com', '******', 'L', 'https://lorem.ipsum/dolor.png', 'Jl. Cisitu Indah VI no 6', 3);
INSERT INTO users (id, name, email, password, gender, photo, address, role)
VALUES (8, 'Siti', 'siti@gmail.com', '******', 'P', 'https://lorem.ipsum/dolor.png', 'Jl. Cisitu Indah VI no 6', 3);
INSERT INTO users (id, name, email, password, gender, photo, address, role)
VALUES (9, 'Juminten', 'juminten@gmail.com', '******', 'P', 'https://lorem.ipsum/dolor.png',
        'Jl. Cisitu Indah VI no 6', 3);
INSERT INTO users (id, name, email, password, gender, photo, address, role)
VALUES (10, 'Paijo', 'paijo@gmail.com', '******', 'L', 'https://lorem.ipsum/dolor.png', 'Jl. Cisitu Indah VI no 6',
        3);
INSERT INTO users (id, name, email, password, gender, photo, address, role)
VALUES (11, 'Saifuddin', 'saifuddin@gmail.com', '******', 'L', 'https://lorem.ipsum/dolor.png',
        'Jl. Cisitu Indah VI no 6', 3);
INSERT INTO users (id, name, email, password, gender, photo, address, role)
VALUES (12, 'Daffa', 'daffa@gmail.com', '******', 'L', 'https://lorem.ipsum/dolor.png', 'Jl. Cisitu Indah VI no 6',
        3);
INSERT INTO users (id, name, email, password, gender, photo, address, role)
VALUES (13, 'Akbar', 'akbar@gmail.com', '******', 'L', 'https://lorem.ipsum/dolor.png', 'Jl. Cisitu Indah VI no 6',
        3);
INSERT INTO users (id, name, email, password, gender, photo, address, role)
VALUES (14, 'Rafli', 'rafli@gmail.com', '******', 'L', 'https://lorem.ipsum/dolor.png', 'Jl. Cisitu Indah VI no 6',
        3);
INSERT INTO users (id, name, email, password, gender, photo, address, role)
VALUES (15, 'Rini', 'rini@gmail.com', '******', 'P', 'https://lorem.ipsum/dolor.png', 'Jl. Cisitu Indah VI no 6',
        3);

INSERT INTO devices (id, name, brand, pk, price)
VALUES (1, 'LG-1', 'LG', 0.5, 50000);
INSERT INTO devices (id, name, brand, pk, price)
VALUES (2, 'Sharp-2', 'Sharp', 1, 60000);
INSERT INTO devices (id, name, brand, pk, price)
VALUES (3, 'Panasonic-3', 'Panasonic', 2, 70000);
INSERT INTO devices (id, name, brand, pk, price)
VALUES (4, 'Samsung-4', 'Samsung', 0.5, 80000);
INSERT INTO devices (id, name, brand, pk, price)
VALUES (5, 'Daikin-5', 'Daikin', 1, 90000);
INSERT INTO devices (id, name, brand, pk, price)
VALUES (6, 'Gree-6', 'Gree', 2, 100000);
INSERT INTO devices (id, name, brand, pk, price)
VALUES (7, 'Polytron-7', 'Polytron', 0.5, 110000);
INSERT INTO devices (id, name, brand, pk, price)
VALUES (8, 'Electrolux-8', 'Electrolux', 1, 120000);
INSERT INTO devices (id, name, brand, pk, price)
VALUES (9, 'Aqua-9', 'Aqua', 2, 130000);
INSERT INTO devices (id, name, brand, pk, price)
VALUES (10, 'Midea-10', 'Midea', 0.5, 140000);
INSERT INTO devices (id, name, brand, pk, price)
VALUES (11, 'LG-11', 'LG', 1, 200000);
INSERT INTO devices (id, name, brand, pk, price)
VALUES (12, 'Sharp-12', 'Sharp', 2, 210000);
INSERT INTO devices (id, name, brand, pk, price)
VALUES (13, 'Panasonic-13', 'Panasonic', 0.5, 220000);
INSERT INTO devices (id, name, brand, pk, price)
VALUES (14, 'Samsung-14', 'Samsung', 1, 230000);
INSERT INTO devices (id, name, brand, pk, price)
VALUES (15, 'Daikin-15', 'Daikin', 2, 240000);
INSERT INTO devices (id, name, brand, pk, price)
VALUES (16, 'Gree-16', 'Gree', 0.5, 250000);
INSERT INTO devices (id, name, brand, pk, price)
VALUES (17, 'Polytron-17', 'Polytron', 1, 260000);
INSERT INTO devices (id, name, brand, pk, price)
VALUES (18, 'Electrolux-18', 'Electrolux', 2, 270000);
INSERT INTO devices (id, name, brand, pk, price)
VALUES (19, 'Aqua-19', 'Aqua', 0.5, 280000);
INSERT INTO devices (id, name, brand, pk, price)
VALUES (20, 'Midea-20', 'Midea', 1, 290000);

INSERT INTO `services` (`id`, `technician_id`, `client_id`, `ac_id`, `date`, `status`)
VALUES (1, 2, 6, 1, STR_TO_DATE('1 Jun 2020', '%d %b %Y'), 'finish');
INSERT INTO `services` (`id`, `technician_id`, `client_id`, `ac_id`, `date`, `status`)
VALUES (2, 3, 7, 2, STR_TO_DATE('1 May 2020', '%d %b %Y'), 'finish');
INSERT INTO `services` (`id`, `technician_id`, `client_id`, `ac_id`, `date`, `status`)
VALUES (3, 4, 8, 3, STR_TO_DATE('2 Jun 2020', '%d %b %Y'), 'finish');
INSERT INTO `services` (`id`, `technician_id`, `client_id`, `ac_id`, `date`, `status`)
VALUES (4, 5, 9, 4, STR_TO_DATE('3 Mar 2021', '%d %b %Y'), 'finish');
INSERT INTO `services` (`id`, `technician_id`, `client_id`, `ac_id`, `date`, `status`)
VALUES (5, 2, 6, 5, STR_TO_DATE('5 Dec 2021', '%d %b %Y'), 'finish');
INSERT INTO `services` (`id`, `technician_id`, `client_id`, `ac_id`, `date`, `status`)
VALUES (6, 3, 7, 6, STR_TO_DATE('25 Dec 2021', '%d %b %Y'), 'finish');
INSERT INTO `services` (`id`, `technician_id`, `client_id`, `ac_id`, `date`, `status`)
VALUES (7, 4, 10, 7, STR_TO_DATE('1 Jan 2022', '%d %b %Y'), 'finish');
INSERT INTO `services` (`id`, `technician_id`, `client_id`, `ac_id`, `date`, `status`)
VALUES (8, 5, 11, 8, STR_TO_DATE('2 Feb 2022', '%d %b %Y'), 'finish');
INSERT INTO `services` (`id`, `technician_id`, `client_id`, `ac_id`, `date`, `status`)
VALUES (9, 2, 6, 9, STR_TO_DATE('4 Apr 2022', '%d %b %Y'), 'finish');
INSERT INTO `services` (`id`, `technician_id`, `client_id`, `ac_id`, `date`, `status`)
VALUES (10, 3, 7, 10, STR_TO_DATE('5 May 2023', '%d %b %Y'), 'on repair');
INSERT INTO `services` (`id`, `technician_id`, `client_id`, `ac_id`, `date`, `status`)
VALUES (11, 4, 12, 11, STR_TO_DATE('6 Jun 2023', '%d %b %Y'), 'on repair');
INSERT INTO `services` (`id`, `technician_id`, `client_id`, `ac_id`, `date`, `status`)
VALUES (12, 5, 13, 12, STR_TO_DATE('7 Jul 2023', '%d %b %Y'), 'on repair');
INSERT INTO `services` (`id`, `technician_id`, `client_id`, `ac_id`, `date`, `status`)
VALUES (13, 2, 6, 13, STR_TO_DATE('8 Aug 2023', '%d %b %Y'), 'paid');
INSERT INTO `services` (`id`, `technician_id`, `client_id`, `ac_id`, `date`, `status`)
VALUES (14, 3, 7, 14, STR_TO_DATE('9 Sep 2023', '%d %b %Y'), 'paid');
INSERT INTO `services` (`id`, `technician_id`, `client_id`, `ac_id`, `date`, `status`)
VALUES (15, 4, 14, 15, STR_TO_DATE('10 Oct 2023', '%d %b %Y'), 'unpaid');


SELECT * FROM roles;

SELECT * FROM users;

SELECT * FROM devices;

SELECT * FROM services;
