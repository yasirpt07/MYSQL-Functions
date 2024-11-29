use countries;

--  new column DOB
ALTER TABLE Persons
ADD DOB DATE;

select * from persons;

-- inserting DOB all ID
UPDATE Persons SET DOB = '1990-01-15' WHERE Id = 1;
UPDATE Persons SET DOB = '1988-04-20' WHERE Id = 2;
UPDATE Persons SET DOB = '1992-07-25' WHERE Id = 3;
UPDATE Persons SET DOB = '1985-09-10' WHERE Id = 4;
UPDATE Persons SET DOB = '1993-12-05' WHERE Id = 5;
UPDATE Persons SET DOB = '1990-03-15' WHERE Id = 6;
UPDATE Persons SET DOB = '1987-06-18' WHERE Id = 7;
UPDATE Persons SET DOB = '1995-08-22' WHERE Id = 8;
UPDATE Persons SET DOB = '1991-11-12' WHERE Id = 9;
UPDATE Persons SET DOB = '1994-02-28' WHERE Id = 10;
UPDATE Persons SET DOB = '1989-05-30' WHERE Id = 11;
UPDATE Persons SET DOB = '1996-10-14' WHERE Id = 12;

-- user-defined function to calculate age using DOB
DELIMITER $$
CREATE FUNCTION CalculateAge(DOB DATE) 
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN TIMESTAMPDIFF(YEAR, DOB, CURDATE()) 
           - (DATE_FORMAT(CURDATE(), '%m-%d') < DATE_FORMAT(DOB, '%m-%d'));
END $$
DELIMITER ;

--  query to fetch the age of all persons
SELECT Fname, Lname, DOB, CalculateAge(DOB) AS Age
FROM Persons;

-- length of each country name
SELECT Country_name, CHAR_LENGTH(Country_name) AS Length
FROM Country;

-- first three characters of each country's name
SELECT Country_name, LEFT(Country_name, 3) AS FirstThreeCharacters
FROM Country;

-- country names to uppercase and lowercase
SELECT Country_name,
       UPPER(Country_name) AS Uppercase,
       LOWER(Country_name) AS Lowercase
FROM Country;








