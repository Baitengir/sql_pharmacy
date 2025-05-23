-- CREATE TYPE Gender AS ENUM ('MALE', 'FEMALE');
--
-- CREATE TABLE user_gender
-- (
--     male   Gender,
--     female Gender
-- );
--
-- CREATE TYPE Position AS ENUM ('ADMIN', 'PHARMACIST', 'TELLER');
--
-- CREATE TABLE positions(
--     admin_position Position,
--     pharmacist_position Position,
--     teller_position Position
-- );

CREATE TYPE Gender_type AS ENUM ('MALE', 'FEMALE');
CREATE TABLE genders
(
    male   Gender_type,
    female Gender_type
);

CREATE TYPE Position_type AS ENUM ('ADMIN', 'PHARMACIST', 'TELLER');
CREATE TABLE Positions
(
    admin      Position_type,
    pharmacist Position_type,
    teller     Position_type
);

CREATE TABLE Pharmacies
(
    id      SERIAL PRIMARY KEY,
    name    VARCHAR(50),
    address VARCHAR(50)
);

CREATE TABLE medicines
(
    id              SERIAL PRIMARY KEY,
    name            VARCHAR(50),
    price           INT,
    description     TEXT,
    expiration_date DATE,
    pharmacies_id   INT REFERENCES Pharmacies (id)
);

CREATE TABLE employees
(
    id            SERIAL PRIMARY KEY,
    full_name     VARCHAR(50),
    email         VARCHAR(50) UNIQUE,
    phone_number  VARCHAR(50),
    experience    REAL,
    position      Position_type,
    gender        Gender_type,
    pharmacies_id INT REFERENCES Pharmacies (id)
);

INSERT INTO Pharmacies (name, address)
VALUES ('PharmaLux', '123 Main St, Bishkek'),
       ('HealthPoint', '456 Toktogul Ave, Bishkek'),
       ('MediCare', '789 Manas St, Bishkek'),
       ('BioLife', '12 Ibraimova St, Bishkek'),
       ('SmartPharm', '89 Gorky St, Bishkek'),
       ('CityPharma', '17 Chui Ave, Bishkek'),
       ('TrustPharm', '56 Baitik Baatyr St, Bishkek'),
       ('LifePlus', '88 Erkindik Blvd, Bishkek'),
       ('MedicAid', '29 Panfilov St, Bishkek'),
       ('VitalPharm', '74 Sovietskaya St, Bishkek'),
       ('BestMed', '32 Chui Ave, Bishkek'),
       ('FamilyPharma', '45 Logvinenko St, Bishkek'),
       ('GreenMed', '11 Fuchik St, Bishkek'),
       ('MedExpress', '23 Akhunbaeva St, Bishkek'),
       ('PrimeHealth', '66 Alamedin St, Bishkek'),
       ('FastPharm', '19 Orozbekova St, Bishkek'),
       ('CurePoint', '102 Moskovskaya St, Bishkek'),
       ('HealthLand', '12 Isanova St, Bishkek'),
       ('PharmaPro', '55 Chui Ave, Bishkek'),
       ('BioPlus', '30 Gorky St, Bishkek'),
       ('TopPharm', '99 Sovietskaya St, Bishkek'),
       ('VitaHouse', '67 Ibraimova St, Bishkek'),
       ('PharmaGroup', '27 Razzakov St, Bishkek'),
       ('MediHelp', '79 Baitik Baatyr St, Bishkek'),
       ('CityMed', '50 Moskovskaya St, Bishkek'),
       ('AlfaPharma', '40 Logvinenko St, Bishkek'),
       ('EcoPharm', '13 Panfilov St, Bishkek'),
       ('CarePlus', '61 Erkindik Blvd, Bishkek'),
       ('MegaPharm', '101 Chui Ave, Bishkek'),
       ('MedicPoint', '88 Sovietskaya St, Bishkek');

INSERT INTO medicines (name, price, description, expiration_date, pharmacies_id)
VALUES ('Aspirin', 25, 'Painkiller and anti-inflammatory', '2027-05-22', 1),
       ('Paracetamol', 20, 'Fever reducer and analgesic', '2026-08-15', 2),
       ('Ibuprofen', 30, 'Anti-inflammatory medicine', '2028-01-10', 3),
       ('Amoxicillin', 50, 'Antibiotic', '2027-11-05', 4),
       ('Cetrine', 35, 'Anti-allergy tablet', '2029-02-20', 5),
       ('Panadol', 22, 'Pain and fever relief', '2026-12-30', 6),
       ('No-Shpa', 27, 'Spasm reliever', '2027-09-17', 7),
       ('Linex', 45, 'Probiotic for digestion', '2028-06-19', 8),
       ('Fervex', 40, 'Cold and flu remedy', '2029-01-07', 9),
       ('Citramon', 18, 'Headache and pain relief', '2027-08-24', 10),
       ('Diclofenac', 26, 'Anti-inflammatory', '2028-07-31', 11),
       ('Nurofen', 33, 'Painkiller and anti-fever', '2029-03-05', 12),
       ('ACC', 30, 'Cough medicine', '2027-04-18', 13),
       ('Biseptol', 28, 'Antibiotic', '2026-10-26', 14),
       ('Corvalol', 15, 'Heart drops', '2029-09-12', 15),
       ('Activated Carbon', 10, 'Absorbent for poisoning', '2030-01-01', 16),
       ('Omeprazole', 32, 'Stomach ulcer remedy', '2027-12-12', 17),
       ('Ketanov', 35, 'Strong painkiller', '2026-05-20', 18),
       ('Mezim', 38, 'Digestive enzyme', '2029-04-22', 19),
       ('Motilium', 29, 'Digestive remedy', '2028-10-03', 20),
       ('Theraflu', 44, 'Cold and flu powder', '2027-06-06', 21),
       ('Vitamin C', 20, 'Vitamin supplement', '2029-11-14', 22),
       ('Aqualor', 25, 'Nasal spray', '2026-09-25', 23),
       ('Omez', 30, 'Stomach medicine', '2028-08-13', 24),
       ('Grammidin', 28, 'Throat tablet', '2027-03-29', 25),
       ('Pentalgin', 34, 'Complex painkiller', '2026-07-17', 26),
       ('Ergoferon', 33, 'Antiviral medicine', '2029-12-01', 27),
       ('Rinza', 36, 'Cold medicine', '2027-10-10', 28),
       ('Anaferon', 31, 'Immunostimulant', '2028-02-08', 29),
       ('Cameton', 24, 'Throat spray', '2026-03-22', 30);

INSERT INTO employees (full_name, email, phone_number, experience, position, gender, pharmacies_id)
VALUES ('Aibek Tashiev', 'aibek@mail.com', '+996700123456', 3.5, 'ADMIN', 'MALE', 1),
       ('Nazira Usenova', 'nazira@mail.com', '+996700987654', 5.0, 'PHARMACIST', 'FEMALE', 2),
       ('Bakyt Bekbolotov', 'bakyt@mail.com', '+996700654321', 2.5, 'TELLER', 'MALE', 3),
       ('Ainura Mambetova', 'ainura@mail.com', '+996700789012', 7.5, 'ADMIN', 'FEMALE', 4),
       ('Rustam Usonov', 'rustam@mail.com', '+996700222333', 4.0, 'PHARMACIST', 'MALE', 5),
       ('Nurzhamal Satybaldieva', 'nurzhamal@mail.com', '+996700999888', 6.2, 'TELLER', 'FEMALE', 6),
       ('Azamat Kadyrov', 'azamat@mail.com', '+996700888777', 8.5, 'ADMIN', 'MALE', 7),
       ('Diana Eralieva', 'diana@mail.com', '+996700777666', 1.5, 'PHARMACIST', 'FEMALE', 8),
       ('Mirlan Zhunusov', 'mirlan@mail.com', '+996700666555', 9.0, 'TELLER', 'MALE', 9),
       ('Aizada Almazbekova', 'aizada@mail.com', '+996700555444', 4.5, 'PHARMACIST', 'FEMALE', 10),
       ('Askar Saparov', 'askar@mail.com', '+996700444333', 3.0, 'TELLER', 'MALE', 11),
       ('Nursuluu Beishebaeva', 'nursuluu@mail.com', '+996700333222', 5.7, 'ADMIN', 'FEMALE', 12),
       ('Tilek Matmushaev', 'tilek@mail.com', '+996700222111', 6.5, 'PHARMACIST', 'MALE', 13),
       ('Aidai Imanalieva', 'aidai@mail.com', '+996700111000', 4.8, 'TELLER', 'FEMALE', 14),
       ('Marat Omuraliev', 'marat@mail.com', '+996700000999', 7.0, 'ADMIN', 'MALE', 15),
       ('Gulzada Akmatova', 'gulzada@mail.com', '+996700999000', 9.5, 'PHARMACIST', 'FEMALE', 16),
       ('Bekzat Usenov', 'bekzat@mail.com', '+996700888111', 8.3, 'TELLER', 'MALE', 17),
       ('Elmira Asanova', 'elmira@mail.com', '+996700777222', 5.1, 'PHARMACIST', 'FEMALE', 18),
       ('Nursultan Kojobekov', 'nursultan@mail.com', '+996700666333', 6.7, 'ADMIN', 'MALE', 19),
       ('Meerim Kadyrova', 'meerim@mail.com', '+996700555777', 2.9, 'TELLER', 'FEMALE', 20),
       ('Adilet Ibraimov', 'adilet@mail.com', '+996700444555', 5.6, 'PHARMACIST', 'MALE', 21),
       ('Ainagul Isaeva', 'ainagul@mail.com', '+996700333444', 3.3, 'TELLER', 'FEMALE', 22),
       ('Tilekbek Asanov', 'tilekbek@mail.com', '+996700222555', 8.9, 'ADMIN', 'MALE', 23),
       ('Samara Nurmatova', 'samara@mail.com', '+996700111666', 7.4, 'PHARMACIST', 'FEMALE', 24),
       ('Almaz Kubanychbekov', 'almaz@mail.com', '+996700999444', 4.1, 'TELLER', 'MALE', 25),
       ('Aijan Bekmuratova', 'aijan@mail.com', '+996700888333', 5.3, 'ADMIN', 'FEMALE', 26),
       ('Rustam Imanov', 'rustamimanov@mail.com', '+996700777111', 9.8, 'PHARMACIST', 'MALE', 27),
       ('Baktygul Usupova', 'baktygul@mail.com', '+996700666222', 3.7, 'TELLER', 'FEMALE', 28),
       ('Nurlan Abdyldaev', 'nurlan@mail.com', '+996700555666', 6.1, 'PHARMACIST', 'MALE', 29),
       ('Gulzira Zholdosheva', 'gulzira@mail.com', '+996700444777', 2.5, 'TELLER', 'FEMALE', 30);

-- queries:
-- 1. Показать сотрудников (employee) (имя, телефон, должность) и название аптеки, где они работают.
SELECT e.full_name AS employee_name,
       e.phone_number,
       e.position,
       p.name AS pharmacy_name
FROM employees e
JOIN Pharmacies p
ON e.pharmacies_id = p.id;

-- 2. Вывести все лекарства, которые продаются в аптеках, где работают только женщины
SELECT m.*
FROM medicines m
JOIN Pharmacies p
ON m.pharmacies_id = p.id
WHERE p.id IN (
    SELECT pharmacies_id
    FROM employees
    GROUP BY pharmacies_id
    HAVING SUM (CASE WHEN gender = 'MALE' THEN 1 ELSE 0 END) = 0
    );

-- Найти аптеку, в которой больше всего сотрудников

-- Показать сотрудников, которые работают в аптеках, где продаются лекарства дороже 1000
-- Вывести список аптек, в которых нет ни одного лекарства с истёкшим сроком годности
-- Показать имена сотрудников и количество лекарств в их аптеке
-- Вывести всех сотрудников и указать “Стажер”, если у них опыт меньше 1 года, иначе - “Опытный”
-- Найти аптеку, в которой самый дорогой препарат
-- Показать количество мужчин и женщин, работающих в каждой аптеке
-- Показать аптеку с наименьшим средним стажем сотрудников
-- Найти сотрудников, у которых в аптеке нет ни одного лекарства
-- Показать по каждой должности средний стаж сотрудников





