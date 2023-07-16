package org.example.example;

public class SQL {
    SELECT * FROM  Person;
    CREATE TABLE Person (
            person_id INT PRIMARY KEY,
            first_name VARCHAR(50),
    last_name VARCHAR(50)
);
    INSERT INTO persons ( id, fi, LastName)
    VALUES (1,'Tay','Donta');

    CREATE TABLE Address (
            address_id INT PRIMARY KEY,
            id INT,
            );
    INSERT INTO Address ( Address_id, id )
    VALUES (1, 2);
    CREATE TABLE address_info (
            address_id INT PRIMARY KEY,
            person_id INT,
            street_number VARCHAR(10),
    street_name VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(50),
    zipcode VARCHAR(20),
    FOREIGN KEY (person_id) REFERENCES Person(person_id)
            );
    select * from Address_info;
    INSERT INTO Address_info ( address_id, person_id, street_number, street_name, city, state, Zipcode )
    VALUES (1, 2, 11, 'alder', 'Houston', 'Texsas', 77081);

    SELECT P.person_id, P.first_name, P.last_name, A.street_number, A.street_name, A.city, A.state, A.zipcode
    FROM Person P
    LEFT JOIN Address A ON P.person_id = A.person_id
    ORDER BY A.street_number;

}
