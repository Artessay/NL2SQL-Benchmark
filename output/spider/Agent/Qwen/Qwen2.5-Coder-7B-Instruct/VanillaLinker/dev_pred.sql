SELECT COUNT(Singer_ID) AS Number_of_Singers FROM singer; 
SELECT COUNT(Singer_ID) FROM singer; 
SELECT Name, Country, Age FROM singer ORDER BY Age DESC; 
SELECT Name, Country, Age FROM singer ORDER BY Age DESC; 
SELECT AVG(Age), MIN(Age), MAX(Age) FROM singer WHERE Country = 'France'; 
SELECT AVG(Age), MIN(Age), MAX(Age) FROM singer WHERE Country = 'France'; 
SELECT Song_Name, Song_release_year FROM singer ORDER BY Age ASC LIMIT 1; 
SELECT Song_Name, Song_release_year FROM singer ORDER BY Age ASC LIMIT 1; 
SELECT DISTINCT Country FROM singer WHERE Age > 20; 
SELECT DISTINCT Country FROM singer WHERE Age > 20; 
SELECT Country, COUNT(*) FROM singer GROUP BY Country; 
SELECT Country, COUNT(*) FROM singer GROUP BY Country; 
SELECT Song_Name FROM singer WHERE Age > (SELECT AVG(Age) FROM singer) 
SELECT Song_Name FROM singer WHERE Age > ( SELECT AVG(Age) FROM singer )
SELECT Location, Name FROM stadium WHERE Capacity BETWEEN 5000 AND 10000; 
SELECT Location, Name FROM stadium WHERE Capacity BETWEEN 5000 AND 10000; 
SELECT MAX(Capacity), AVG(Average) FROM stadium; 
SELECT AVG(Capacity) AS Average_Capacity, MAX(Capacity) AS Maximum_Capacity FROM stadium; 
SELECT Name, Capacity FROM stadium ORDER BY Average DESC LIMIT 1; 
SELECT Name, Capacity FROM stadium ORDER BY Average DESC LIMIT 1; 
SELECT COUNT(*) FROM concert WHERE Year IN ('2014', '2015'); 
SELECT COUNT(*) FROM concert WHERE Year IN ('2014', '2015'); 
SELECT T2.Name, COUNT(*) AS NumberOfConcerts FROM concert AS T1 JOIN stadium AS T2 ON T1.Stadium_ID = T2.Stadium_ID GROUP BY T2.Name ORDER BY NumberOfConcerts DESC; 
SELECT s.Name, COUNT(c.concert_ID) AS Number_of_Concerts FROM stadium s JOIN concert c ON s.Stadium_ID = c.Stadium_ID GROUP BY s.Stadium_ID ORDER BY Number_of_Concerts DESC; 
SELECT s.Name, s.Capacity  FROM stadium s  JOIN concert c ON s.Stadium_ID = c.Stadium_ID  WHERE c.Year >= '2014'  GROUP BY s.Stadium_ID  ORDER BY COUNT(c.concert_ID) DESC  LIMIT 1; 
SELECT s.Name, s.Capacity FROM stadium s JOIN concert c ON s.Stadium_ID = c.Stadium_ID WHERE c.Year > 2013 GROUP BY s.Stadium_ID ORDER BY COUNT(c.concert_ID) DESC LIMIT 1; 
SELECT Year FROM concert GROUP BY Year ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT Year FROM concert GROUP BY Year ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert); 
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert)
SELECT Country FROM singer WHERE Age > 40 OR Age < 30; 
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert WHERE Year = '2014') 
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert WHERE Year = '2014')
SELECT c.concert_Name, c.Theme, COUNT(sc.Singer_ID) AS Number_of_Singers FROM concert c LEFT JOIN singer_in_concert sc ON c.concert_ID = sc.concert_ID GROUP BY c.concert_ID; 
SELECT c.concert_Name, c.Theme, COUNT(sc.Singer_ID) AS Number_of_Singers FROM concert c LEFT JOIN singer_in_concert sc ON c.concert_ID = sc.concert_ID GROUP BY c.concert_ID, c.concert_Name, c.Theme; 
SELECT s.Name, COUNT(sc.concert_ID) AS Number_of_Concerts FROM singer s JOIN singer_in_concert sc ON s.Singer_ID = sc.Singer_ID GROUP BY s.Name ORDER BY Number_of_Concerts DESC; 
SELECT s.Name, COUNT(sc.concert_ID) AS Number_of_Concerts FROM singer s JOIN singer_in_concert sc ON s.Singer_ID = sc.Singer_ID GROUP BY s.Singer_ID; 
SELECT s.Name FROM singer s JOIN singer_in_concert sic ON s.Singer_ID = sic.Singer_ID JOIN concert c ON sic.concert_ID = c.concert_ID WHERE c.Year = '2014'; 
SELECT s.Name FROM singer AS s JOIN singer_in_concert AS sic ON s.Singer_ID = sic.Singer_ID JOIN concert AS c ON sic.concert_ID = c.concert_ID WHERE c.Year = '2014'; 
SELECT Name, Country FROM singer WHERE Song_Name LIKE '%Hey%' 
SELECT Name, Country FROM singer WHERE Song_Name LIKE '%Hey%' 
SELECT s.Name, s.Location FROM stadium s JOIN concert c ON s.Stadium_ID = c.Stadium_ID WHERE c.Year IN ('2014', '2015') GROUP BY s.Stadium_ID HAVING COUNT(DISTINCT c.Year) = 2; 
SELECT s.Name, s.Location FROM stadium s JOIN concert c ON s.Stadium_ID = c.Stadium_ID WHERE c.Year IN ('2014', '2015') GROUP BY s.Stadium_ID HAVING COUNT(DISTINCT c.Year) > 1; 
SELECT COUNT(*) FROM concert AS c JOIN stadium AS s ON c.Stadium_ID = s.Stadium_ID WHERE s.Capacity = (SELECT MAX(Capacity) FROM stadium) 
SELECT COUNT(*) FROM concert AS T1 INNER JOIN stadium AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T2.Capacity = ( SELECT MAX(Capacity) FROM stadium ); 
SELECT COUNT(*) FROM Pets WHERE weight > 10; 
SELECT COUNT(*) FROM Pets WHERE weight > 10; 
SELECT MIN(weight) AS YoungestDogWeight FROM Pets WHERE PetType = 'dog'; 
SELECT MIN(weight) FROM Pets WHERE PetType = 'dog'
SELECT PetType, MAX(weight) AS MaxWeight FROM Pets GROUP BY PetType; 
SELECT PetType, MAX(weight) AS MaxWeight FROM Pets GROUP BY PetType; 
SELECT COUNT(*) FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID WHERE T1.Age > 20; 
SELECT COUNT(*) FROM Has_Pet AS HP JOIN Student AS S ON HP.StuID = S.StuID WHERE S.Age > 20; 
SELECT COUNT(*) FROM Student AS S JOIN Has_Pet AS HP ON S.StuID = HP.StuID JOIN Pets AS P ON HP.PetID = P.PetID WHERE S.Sex = 'F' AND P.PetType = 'dog'; 
SELECT COUNT(*) FROM Student s JOIN Has_Pet hp ON s.StuID = hp.StuID JOIN Pets p ON hp.PetID = p.PetID WHERE s.Sex = 'F' AND p.PetType = 'dog'; 
SELECT COUNT(DISTINCT PetType) AS NumberOfDistinctPetTypes FROM Pets; 
SELECT COUNT(DISTINCT PetType) FROM Pets; 
SELECT DISTINCT S.Fname FROM Student AS S JOIN Has_Pet AS HP ON S.StuID = HP.StuID JOIN Pets AS P ON HP.PetID = P.PetID WHERE P.PetType IN ('cat', 'dog') ORDER BY S.Fname; 
SELECT DISTINCT s.Fname FROM Student s JOIN Has_Pet hp ON s.StuID = hp.StuID JOIN Pets p ON hp.PetID = p.PetID WHERE p.PetType IN ('cat', 'dog') ORDER BY s.Fname; 
SELECT s.Fname FROM Student s JOIN Has_Pet hp ON s.StuID = hp.StuID JOIN Pets p ON hp.PetID = p.PetID WHERE p.PetType = 'cat' INTERSECT SELECT s.Fname FROM Student s JOIN Has_Pet hp ON s.StuID = hp.StuID JOIN Pets p ON hp.PetID = p.PetID WHERE p.PetType = 'dog'; 
SELECT T1.Fname FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'cat' INTERSECT SELECT T1.Fname FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'dog'
SELECT Major, Age FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet INNER JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE PetType = 'cat') 
SELECT DISTINCT s.Major, s.Age  FROM Student s  WHERE s.StuID NOT IN (     SELECT h.StuID      FROM Has_Pet h      JOIN Pets p ON h.PetID = p.PetID      WHERE p.PetType = 'cat' ) ORDER BY s.Age DESC; 
SELECT StuID FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet INNER JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE PetType = 'cat') 
SELECT StuID FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet INNER JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE PetType = 'cat')
SELECT s.Fname, s.Age FROM Student s JOIN Has_Pet hp ON s.StuID = hp.StuID JOIN Pets p ON hp.PetID = p.PetID WHERE p.PetType = 'dog' AND s.StuID NOT IN (     SELECT sp.StuID     FROM Student sp     JOIN Has_Pet hsp ON sp.StuID = hsp.StuID     JOIN Pets pp ON hsp.PetID = pp.PetID     WHERE pp.PetType = 'cat' ) ORDER BY s.Age DESC; 
SELECT DISTINCT S.Fname FROM Student S JOIN Has_Pet HP ON S.StuID = HP.StuID JOIN Pets P ON HP.PetID = P.PetID WHERE P.PetType = 'dog' AND S.StuID NOT IN (     SELECT StuID     FROM Has_Pet     JOIN Pets ON Has_Pet.PetID = Pets.PetID     WHERE Pets.PetType = 'cat' ) ORDER BY S.Fname; 
SELECT PetType, weight FROM Pets ORDER BY pet_age ASC LIMIT 1
SELECT PetType, weight FROM Pets ORDER BY pet_age ASC LIMIT 1; 
SELECT PetID, weight FROM Pets WHERE pet_age > 1; 
SELECT PetID, weight FROM Pets WHERE pet_age > 1; 
SELECT Pets.PetType, AVG(Pets.pet_age) AS AverageAge, MAX(Pets.pet_age) AS MaxAge FROM Pets GROUP BY Pets.PetType; 
SELECT Pets.PetType, AVG(Pets.pet_age) AS AvgAge, MAX(Pets.pet_age) AS MaxAge FROM Pets GROUP BY Pets.PetType; 
SELECT PetType, AVG(weight) AS AverageWeight FROM Pets GROUP BY PetType; 
SELECT PetType, AVG(weight) AS AverageWeight FROM Pets GROUP BY PetType; 
SELECT T1.Fname, T1.Age FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID; 
SELECT DISTINCT T1.Fname, T1.Age FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID; 
SELECT PetID FROM Has_Pet WHERE StuID = (SELECT StuID FROM Student WHERE LName = 'Smith') 
SELECT T2.PetID FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID WHERE T1.LName = 'Smith'
SELECT Student.StuID, COUNT(Has_Pet.PetID) AS NumberOfPets FROM Student JOIN Has_Pet ON Student.StuID = Has_Pet.StuID GROUP BY Student.StuID; 
SELECT StuID, COUNT(PetID) AS NumberOfPets FROM Has_Pet GROUP BY StuID; 
SELECT S.Fname, S.Sex  FROM Student S  JOIN Has_Pet HP ON S.StuID = HP.StuID  GROUP BY S.StuID  HAVING COUNT(HP.PetID) > 1; 
SELECT S.Fname, S.Sex FROM Student S JOIN Has_Pet HP ON S.StuID = HP.StuID GROUP BY S.StuID HAVING COUNT(HP.PetID) > 1; 
SELECT T1.LName FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'cat' AND T3.pet_age = 3;
SELECT T1.LName FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'cat' AND T3.pet_age = 3; 
SELECT AVG(Age) FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet) 
SELECT AVG(Age) FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet);
SELECT COUNT(*) FROM continents; 
SELECT COUNT(*) FROM continents; 
SELECT c.ContId, co.Continent, COUNT(cn.CountryId) AS NumberOfCountries FROM continents c JOIN countries cn ON c.ContId = cn.Continent GROUP BY c.ContId, co.Continent; 
SELECT c.ContId, c.Continent, COUNT(co.CountryId) AS CountryCount FROM continents c LEFT JOIN countries co ON c.ContId = co.Continent GROUP BY c.ContId, c.Continent; 
SELECT COUNT(CountryId) FROM countries; 
SELECT COUNT(CountryId) AS NumberOfCountries FROM countries; 
SELECT T2.FullName, T2.Id, COUNT(T1.Model) AS NumberOfModels FROM model_list AS T1 JOIN car_makers AS T2 ON T1.Maker = T2.Id GROUP BY T2.FullName, T2.Id; 
SELECT cm.Maker, cm.Id, COUNT(ml.Model) AS ModelCount FROM car_makers cm JOIN model_list ml ON cm.Id = ml.Maker GROUP BY cm.Maker, cm.Id; 
SELECT T2.Model FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.MakeId = T2.MakeId ORDER BY T1.Horsepower ASC LIMIT 1
SELECT T2.Model FROM cars_data AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.ModelId ORDER BY T1.Horsepower ASC LIMIT 1
SELECT T1.Model FROM model_list AS T1 INNER JOIN cars_data AS T2 ON T1.ModelId = T2.Id WHERE T2.Weight < ( SELECT AVG(Weight) FROM cars_data )
SELECT T2.Model FROM cars_data AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.ModelId WHERE T1.Weight < ( SELECT AVG(Weight) FROM cars_data ) LIMIT 1
SELECT DISTINCT T1.Maker FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker INNER JOIN car_names AS T3 ON T2.Model = T3.Model INNER JOIN cars_data AS T4 ON T3.MakeId = T4.Id WHERE T4.Year = 1970; 
SELECT DISTINCT T1.Maker FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker INNER JOIN car_names AS T3 ON T2.Model = T3.Model INNER JOIN cars_data AS T4 ON T3.MakeId = T4.Id WHERE T4.Year = 1970
SELECT T2.Make, T1.Year FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.Id = T2.MakeId ORDER BY T1.Year ASC LIMIT 1; 
SELECT T1.Maker, T2.Year FROM car_makers AS T1 INNER JOIN cars_data AS T2 ON T1.Id = T2.MakeId ORDER BY T2.Year ASC LIMIT 1; 
SELECT DISTINCT T1.Model FROM model_list AS T1 INNER JOIN cars_data AS T2 ON T1.ModelId = T2.Id WHERE T2.Year > 1980; 
SELECT DISTINCT T2.Model FROM cars_data AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.ModelId WHERE T1.Year > 1980; 
SELECT c.Continent, COUNT(cm.Id) AS CarMakerCount FROM continents c JOIN countries co ON c.ContId = co.Continent JOIN car_makers cm ON co.CountryId = cm.Country GROUP BY c.Continent ORDER BY CarMakerCount DESC; 
SELECT c.Continent, COUNT(cm.Id) AS CarMakersCount FROM continents c JOIN countries co ON c.ContId = co.Continent JOIN car_makers cm ON co.CountryId = cm.Country GROUP BY c.Continent ORDER BY CarMakersCount DESC; 
SELECT c.CountryName FROM countries c JOIN car_makers cm ON c.CountryId = cm.Country GROUP BY c.CountryName ORDER BY COUNT(cm.Maker) DESC LIMIT 1; 
SELECT T2.CountryName FROM car_makers AS T1 INNER JOIN countries AS T2 ON T1.Country = T2.CountryId GROUP BY T2.CountryName ORDER BY COUNT(T1.Maker) DESC LIMIT 1
SELECT COUNT(T2.Model), T1.FullName FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.FullName; 
SELECT T2.Maker, COUNT(T1.Model) AS NumberOfModels, T2.Id, T2.FullName FROM model_list AS T1 JOIN car_makers AS T2 ON T1.Maker = T2.Id GROUP BY T2.Maker; 
SELECT T2.Accelerate FROM car_names AS T1 INNER JOIN cars_data AS T2 ON T1.MakeId = T2.Id WHERE T1.Model = 'amc hornet sportabout sw'; 
SELECT T2.Accelerate FROM car_names AS T1 INNER JOIN cars_data AS T2 ON T1.MakeId = T2.Id WHERE T1.Model = 'amc' AND T1.Make = 'amc hornet sportabout (sw)'; 
SELECT COUNT(*) FROM car_makers WHERE Country = 5; 
SELECT COUNT(*) FROM car_makers WHERE Country = (SELECT CountryId FROM countries WHERE CountryName = 'france') 
SELECT COUNT(*) FROM car_makers WHERE Country = 1; 
SELECT COUNT(*) FROM car_makers AS T1 INNER JOIN countries AS T2 ON T1.Country = T2.CountryId WHERE T2.CountryName = 'usa'; 
SELECT AVG(MPG) FROM cars_data WHERE Cylinders = 4;
SELECT AVG(MPG) FROM cars_data WHERE Cylinders = 4;
SELECT MIN(Weight) FROM cars_data WHERE Cylinders = 8 AND Year = 1974
SELECT MIN(Weight) FROM cars_data WHERE Cylinders = 8 AND Year = 1974
SELECT T1.Maker ,  T2.Model FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker
SELECT T1.Maker ,  T2.Model FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker
SELECT T2.CountryName, T2.Continent FROM car_makers AS T1 INNER JOIN countries AS T2 ON T1.Country = T2.CountryId GROUP BY T2.CountryName HAVING COUNT(T1.Maker) >= 1; 
SELECT CountryName, CountryId FROM countries WHERE CountryId IN (SELECT DISTINCT Country FROM car_makers); 
SELECT COUNT(*) FROM cars_data WHERE Horsepower > 150; 
SELECT COUNT(*) FROM cars_data WHERE Horsepower > 150; 
SELECT AVG(Weight), Year FROM cars_data GROUP BY Year ORDER BY Year; 
SELECT AVG(Weight), Year FROM cars_data GROUP BY Year ORDER BY Year; 
SELECT c.CountryName  FROM countries c  JOIN car_makers cm ON c.CountryId = cm.Country  WHERE c.Continent = (SELECT ContId FROM continents WHERE Continent = 'europe')  GROUP BY c.CountryName  HAVING COUNT(cm.Id) >= 3; 
SELECT T1.CountryName FROM countries AS T1 INNER JOIN car_makers AS T2 ON T1.CountryId = T2.Country GROUP BY T1.CountryName HAVING COUNT(T2.Id) >= 3 ORDER BY T1.CountryName;
SELECT MAX(T1.Horsepower), T3.Make FROM cars_data AS T1 INNER JOIN car_names AS T3 ON T1.Id = T3.MakeId WHERE T1.Cylinders = 3
SELECT MAX(T1.Horsepower), T2.Make  FROM cars_data AS T1  JOIN car_names AS T2 ON T1.Id = T2.MakeId  WHERE T1.Cylinders = 3; 
SELECT T2.Model FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.MakeId = T2.MakeId ORDER BY T1.MPG DESC LIMIT 1; 
SELECT T2.Model FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.MakeId = T2.MakeId ORDER BY T1.MPG DESC LIMIT 1; 
SELECT AVG(Horsepower) FROM cars_data WHERE Year < 1980; 
SELECT AVG(Horsepower) FROM cars_data WHERE Year < 1980
SELECT AVG(T2.Edispl) AS AverageEdispl FROM car_names AS T1 INNER JOIN cars_data AS T2 ON T1.MakeId = T2.Id WHERE T1.Model = 'volvo'; 
SELECT AVG(T1.Edispl) FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.MakeId = T2.MakeId WHERE T2.Make LIKE '%volvo%'
SELECT Cylinders, MAX(Accelerate) AS MaxAccelerate FROM cars_data GROUP BY Cylinders ORDER BY Cylinders; 
SELECT Cylinders, MAX(Accelerate) AS Max_Accelerate FROM cars_data GROUP BY Cylinders ORDER BY Max_Accelerate DESC; 
SELECT Model FROM car_names GROUP BY Model ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT Model FROM car_names GROUP BY Model ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 4; 
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 4; 
SELECT COUNT(*) FROM cars_data WHERE Year = 1980; 
SELECT COUNT(*) FROM cars_data WHERE Year = 1980; 
SELECT COUNT(*) FROM car_makers AS cm JOIN model_list AS ml ON cm.Id = ml.Maker WHERE cm.FullName = 'American Motor Company'; 
SELECT COUNT(*) FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker WHERE T1.Maker = 'amc'; 
SELECT T1.FullName, T1.Id FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.Id HAVING COUNT(T2.Model) > 3; 
SELECT cm.Maker, cm.Id FROM car_makers cm JOIN model_list ml ON cm.Id = ml.Maker GROUP BY cm.Id HAVING COUNT(ml.Model) > 3; 
SELECT DISTINCT Model  FROM car_names  WHERE Make = 'general motors' OR Weight > 3500; 
SELECT DISTINCT T1.Model FROM model_list AS T1 INNER JOIN cars_data AS T2 ON T1.ModelId = T2.Id WHERE T1.Maker IN ( SELECT Id FROM car_makers WHERE Maker = 'gm' ) OR T2.Weight > 3500
SELECT DISTINCT Year FROM cars_data WHERE Weight BETWEEN 3000 AND 4000
SELECT DISTINCT Year FROM cars_data WHERE Weight < 4000 AND Weight > 3000; 
SELECT Horsepower FROM cars_data ORDER BY Accelerate DESC LIMIT 1
SELECT Horsepower FROM cars_data ORDER BY Accelerate DESC LIMIT 1; 
SELECT T1.Cylinders FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.MakeId = T2.MakeId WHERE T2.Model = 'volvo' ORDER BY T1.Accelerate ASC LIMIT 1; 
SELECT T1.Cylinders FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.MakeId = T2.MakeId INNER JOIN model_list AS T3 ON T2.Model = T3.Model WHERE T2.Make = 'volkswagen' ORDER BY T1.Accelerate ASC LIMIT 1; 
SELECT COUNT(*) FROM cars_data WHERE Accelerate > (SELECT MAX(Accelerate) FROM cars_data WHERE Horsepower = (SELECT MAX(Horsepower) FROM cars_data)); 
SELECT COUNT(*) FROM cars_data WHERE Accelerate > ( SELECT MAX(Accelerate) FROM cars_data ); 
SELECT COUNT(*) FROM (     SELECT Country FROM car_makers GROUP BY Country HAVING COUNT(Maker) > 2 ) 
SELECT COUNT(*) FROM (     SELECT Country FROM car_makers GROUP BY Country HAVING COUNT(Maker) > 2 ) 
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 6; 
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 6; 
SELECT T2.Model, T1.Horsepower FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.MakeId = T2.MakeId WHERE T1.Cylinders = 4 ORDER BY T1.Horsepower DESC LIMIT 1; 
SELECT T1.Model, T2.Horsepower  FROM model_list AS T1  JOIN cars_data AS T2 ON T1.ModelId = T2.Id  WHERE T2.Cylinders = 4  ORDER BY T2.Horsepower DESC  LIMIT 1; 
SELECT T1.MakeId, T2.Make FROM car_names AS T1 JOIN cars_data AS T2 ON T1.MakeId = T2.Id WHERE T2.Horsepower > (SELECT MIN(Horsepower) FROM cars_data) AND T2.Cylinders <= 3; 
SELECT T1.MakeId, T1.Model  FROM car_names AS T1  JOIN cars_data AS T2 ON T1.MakeId = T2.Id  WHERE T2.Horsepower <> ( SELECT MIN(Horsepower) FROM cars_data ) AND T2.Cylinders < 4; 
SELECT MAX(MPG) FROM cars_data WHERE Cylinders = 8 OR Year < 1980; 
SELECT MAX(MPG) FROM cars_data WHERE Cylinders = 8 OR Year < 1980; 
SELECT T3.Model FROM car_names AS T1 INNER JOIN cars_data AS T2 ON T1.MakeId = T2.Id INNER JOIN model_list AS T3 ON T1.Model = T3.Model WHERE T2.Weight < 3500 AND T1.Make != 'ford'
SELECT DISTINCT T1.Model  FROM model_list AS T1  JOIN car_names AS T2 ON T1.Model = T2.Model  WHERE T2.Make != 'ford' AND T2.MakeId IN (     SELECT MakeId      FROM cars_data      WHERE Weight < 3500 ) ORDER BY T1.Model; 
SELECT CountryName FROM countries WHERE CountryId NOT IN (SELECT Country FROM car_makers)
SELECT CountryName FROM countries WHERE CountryId NOT IN (SELECT Country FROM car_makers)
SELECT T1.Id, T1.Maker FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.Id HAVING COUNT(T2.Model) >= 2 AND COUNT(DISTINCT T1.Maker) > 3; 
SELECT T1.Id, T1.Maker  FROM car_makers AS T1  JOIN model_list AS T2 ON T1.Id = T2.Maker  GROUP BY T1.Id, T1.Maker  HAVING COUNT(T2.Model) >= 2 AND COUNT(*) > 3; 
SELECT c.CountryId, c.CountryName FROM countries c JOIN car_makers cm ON c.CountryId = cm.Country WHERE cm.Maker IN (     SELECT Maker     FROM model_list     WHERE Model = 'fiat' ) GROUP BY c.CountryId, c.CountryName HAVING COUNT(cm.Maker) > 3; 
SELECT c.CountryId, c.CountryName FROM countries c JOIN car_makers cm ON c.CountryId = cm.Country WHERE (     SELECT COUNT(*) FROM car_makers WHERE Country = c.CountryId ) > 3 OR EXISTS (     SELECT 1 FROM model_list ml JOIN car_names cn ON ml.Model = cn.Model WHERE cn.Make = 'fiat' AND ml.Maker IN (SELECT Id FROM car_makers WHERE Country = c.CountryId) ) ORDER BY c.CountryId; 
SELECT Country FROM airlines WHERE Airline = 'JetBlue Airways'
SELECT Country FROM airlines WHERE Airline = 'JetBlue Airways'
SELECT Abbreviation FROM airlines WHERE Airline = 'JetBlue Airways'; 
SELECT Abbreviation FROM airlines WHERE Airline = 'JetBlue Airways'; 
SELECT Airline, Abbreviation FROM airlines WHERE Country = 'USA'; 
SELECT Airline, Abbreviation FROM airlines WHERE Country = 'USA'; 
SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony'; 
SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony'; 
SELECT COUNT(*) FROM airlines; 
SELECT COUNT(*) FROM airlines; 
SELECT COUNT(AirportName) FROM airports; 
SELECT COUNT(AirportCode) FROM airports; 
SELECT COUNT(*) FROM flights; 
SELECT COUNT(*) FROM flights; 
SELECT Airline FROM airlines WHERE Abbreviation = 'UAL'; 
SELECT Airline FROM airlines WHERE Abbreviation = 'UAL'; 
SELECT COUNT(*) FROM airlines WHERE Country = 'USA'; 
SELECT COUNT(*) FROM airlines WHERE Country = 'USA'; 
SELECT City, Country FROM airports WHERE AirportName = 'Alton'; 
SELECT City, Country FROM airports WHERE AirportName = 'Alton'; 
SELECT AirportName FROM airports WHERE AirportCode = 'AKO'
SELECT AirportName FROM airports WHERE AirportCode = 'AKO'
SELECT AirportName FROM airports WHERE City = 'Aberdeen'; 
SELECT AirportName FROM airports WHERE City = 'Aberdeen'
SELECT COUNT(*) FROM flights WHERE SourceAirport = 'APG'; 
SELECT COUNT(*) FROM flights WHERE SourceAirport = 'APG'; 
SELECT COUNT(*) FROM flights WHERE DestAirport = 'ATO'; 
SELECT COUNT(*) FROM flights WHERE DestAirport = 'ATO'; 
SELECT COUNT(*) FROM flights INNER JOIN airports ON flights.SourceAirport = airports.AirportCode WHERE airports.City = 'Aberdeen'; 
SELECT COUNT(*) FROM flights WHERE SourceAirport IN (SELECT AirportCode FROM airports WHERE City = 'Aberdeen'); 
SELECT COUNT(*) FROM airports AS a JOIN flights AS f ON a.AirportCode = f.DestAirport WHERE a.City = 'Aberdeen'; 
SELECT COUNT(*) FROM airports AS dest JOIN flights ON dest.AirportCode = flights.DestAirport WHERE dest.City = 'Aberdeen'; 
SELECT COUNT(*)  FROM flights f JOIN airports s ON f.SourceAirport = s.AirportCode JOIN airports d ON f.DestAirport = d.AirportCode WHERE s.City = 'Aberdeen' AND d.City = 'Ashley'; 
SELECT COUNT(*) FROM flights WHERE SourceAirport = (SELECT AirportCode FROM airports WHERE City = 'Aberdeen') AND DestAirport = (SELECT AirportCode FROM airports WHERE City = 'Ashley'); 
SELECT COUNT(*) FROM flights WHERE Airline = (SELECT uid FROM airlines WHERE Airline = 'JetBlue Airways') 
SELECT COUNT(*) FROM flights WHERE Airline = 6; 
SELECT COUNT(*) FROM flights WHERE Airline = 1 AND DestAirport = 'ASY'; 
SELECT COUNT(*) FROM flights WHERE Airline = 1 AND DestAirport = 'ASY'; 
SELECT COUNT(*) FROM flights WHERE Airline = 1 AND SourceAirport = 'AHD'; 
SELECT COUNT(*) FROM flights WHERE Airline = 1 AND SourceAirport = 'AHD'
SELECT COUNT(*) FROM flights JOIN airlines ON flights.Airline = airlines.uid JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airlines.Airline = 'United Airlines' AND airports.City = 'Aberdeen'; 
SELECT COUNT(*) FROM flights f JOIN airlines a ON f.Airline = a.uid JOIN airports d ON f.DestAirport = d.AirportCode WHERE a.Airline = 'United Airlines' AND d.City = 'Aberdeen'; 
SELECT T2.City  FROM flights AS T1  JOIN airports AS T2 ON T2.AirportCode = T1.DestAirport  GROUP BY T2.City  ORDER BY COUNT(T1.FlightNo) DESC  LIMIT 1; 
SELECT T1.City, COUNT(T2.DestAirport) as DestinationCount FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode = T2.DestAirport GROUP BY T1.City ORDER BY DestinationCount DESC LIMIT 1; 
SELECT T2.City FROM flights AS T1 INNER JOIN airports AS T2 ON T1.SourceAirport = T2.AirportCode GROUP BY T2.City ORDER BY COUNT(T1.FlightNo) DESC LIMIT 1
SELECT T2.City FROM flights AS T1 INNER JOIN airports AS T2 ON T1.SourceAirport = T2.AirportCode GROUP BY T2.City ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT DestAirport FROM flights GROUP BY DestAirport ORDER BY COUNT(*) DESC LIMIT 1
SELECT SourceAirport FROM flights GROUP BY SourceAirport ORDER BY COUNT(*) DESC LIMIT 1
SELECT DestAirport FROM flights GROUP BY DestAirport ORDER BY COUNT(*) ASC LIMIT 1
SELECT SourceAirport FROM flights GROUP BY SourceAirport ORDER BY COUNT(*) ASC LIMIT 1
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Abbreviation, T1.Country  FROM airlines AS T1  JOIN (     SELECT Airline, COUNT(*) as FlightCount      FROM flights      GROUP BY Airline ) AS T2 ON T1.uid = T2.Airline  ORDER BY T2.FlightCount ASC  LIMIT 1; 
SELECT T1.Abbreviation, T1.Country FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline ORDER BY COUNT(*) ASC LIMIT 1
SELECT DISTINCT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'AHD' 
SELECT DISTINCT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'AHD'; 
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.DestAirport = 'AHD'
SELECT DISTINCT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.DestAirport = 'AHD'; 
SELECT a.Airline, a.Abbreviation FROM airlines a JOIN flights f ON a.uid = f.Airline WHERE f.SourceAirport IN ('APG', 'CVO') GROUP BY a.Airline, a.Abbreviation HAVING COUNT(DISTINCT f.SourceAirport) = 2; 
SELECT DISTINCT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport IN ('APG', 'CVO') GROUP BY T1.Airline HAVING COUNT(DISTINCT T2.SourceAirport) > 1; 
SELECT DISTINCT T1.Airline, T1.Abbreviation, T1.Country FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'CVO' AND T2.DestAirport != 'APG'; 
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'CVO' AND T2.DestAirport != 'APG'
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline HAVING COUNT(T2.FlightNo) >= 10; 
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline HAVING COUNT(T2.FlightNo) >= 10
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline HAVING COUNT(T2.FlightNo) < 200; 
SELECT a.Airline, COUNT(f.FlightNo) AS FlightCount FROM airlines a JOIN flights f ON a.uid = f.Airline GROUP BY a.Airline HAVING FlightCount < 200; 
SELECT FlightNo FROM flights WHERE Airline = 1 ORDER BY FlightNo LIMIT 5;
SELECT FlightNo FROM flights WHERE Airline = (SELECT uid FROM airlines WHERE Airline = 'United Airlines')
SELECT FlightNo FROM flights WHERE SourceAirport = 'APG'
SELECT FlightNo FROM flights WHERE SourceAirport = 'APG'
SELECT FlightNo FROM flights WHERE DestAirport = 'APG'; 
SELECT FlightNo FROM flights WHERE DestAirport = 'APG'; 
SELECT T2.FlightNo FROM airports AS T1 INNER JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport WHERE T1.City = 'Aberdeen'
SELECT FlightNo FROM flights WHERE SourceAirport IN (SELECT AirportCode FROM airports WHERE City = 'Aberdeen') 
SELECT T2.FlightNo FROM airports AS T1 INNER JOIN flights AS T2 ON T1.AirportCode = T2.DestAirport WHERE T1.City = 'Aberdeen'
SELECT FlightNo FROM flights WHERE DestAirport IN (SELECT AirportCode FROM airports WHERE City = 'Aberdeen') 
SELECT COUNT(*) FROM airports AS T1 INNER JOIN flights AS T2 ON T1.AirportCode = T2.DestAirport WHERE T1.City IN ('Aberdeen ', 'Abilene ') 
SELECT COUNT(*) FROM airports WHERE City IN ('Aberdeen', 'Abilene') AND AirportCode IN (SELECT DestAirport FROM flights); 
SELECT AirportName FROM airports WHERE AirportCode NOT IN (SELECT SourceAirport FROM flights) AND AirportCode NOT IN (SELECT DestAirport FROM flights); 
SELECT AirportName FROM airports WHERE AirportCode NOT IN (SELECT SourceAirport FROM flights) AND AirportCode NOT IN (SELECT DestAirport FROM flights); 
SELECT COUNT(*) FROM employee; 
SELECT COUNT(*) FROM employee; 
SELECT Name FROM employee ORDER BY Age ASC; 
SELECT Name FROM employee ORDER BY Age ASC; 
SELECT City, COUNT(*) AS Number_of_Employees FROM employee GROUP BY City; 
SELECT City, COUNT(Employee_ID) AS Number_of_Employees FROM employee GROUP BY City; 
SELECT City FROM employee WHERE Age < 30 GROUP BY City HAVING COUNT(Employee_ID) > 1; 
SELECT City FROM employee WHERE Age < 30 GROUP BY City HAVING COUNT(*) > 1; 
SELECT Location, COUNT(*) FROM shop GROUP BY Location; 
SELECT Location, COUNT(*) FROM shop GROUP BY Location; 
SELECT Manager_name, District FROM shop ORDER BY Number_products DESC LIMIT 1; 
SELECT Manager_name, District FROM shop ORDER BY Number_products DESC LIMIT 1; 
SELECT MIN(Number_products), MAX(Number_products) FROM shop; 
SELECT MIN(Number_products) AS Min_Products, MAX(Number_products) AS Max_Products FROM shop; 
SELECT Name, Location, District FROM shop ORDER BY Number_products DESC; 
SELECT Name, Location, District FROM shop ORDER BY Number_products DESC; 
SELECT Name FROM shop WHERE Number_products > (SELECT AVG(Number_products) FROM shop) 
SELECT Name FROM shop WHERE Number_products > (SELECT AVG(Number_products) FROM shop) 
SELECT e.Name  FROM employee e  JOIN evaluation ev ON e.Employee_ID = ev.Employee_ID  GROUP BY e.Employee_ID  ORDER BY COUNT(ev.Year_awarded) DESC  LIMIT 1; 
SELECT e.Name FROM employee e JOIN evaluation ev ON e.Employee_ID = ev.Employee_ID GROUP BY e.Employee_ID ORDER BY COUNT(ev.Year_awarded) DESC LIMIT 1; 
SELECT T1.Name FROM employee AS T1 INNER JOIN evaluation AS T2 ON T1.Employee_ID = T2.Employee_ID WHERE T2.Bonus = ( SELECT MAX(Bonus) FROM evaluation )
SELECT e.Name FROM employee AS e JOIN evaluation AS ev ON e.Employee_ID = ev.Employee_ID ORDER BY ev.Bonus DESC LIMIT 1; 
SELECT Name FROM employee WHERE Employee_ID NOT IN (SELECT Employee_ID FROM evaluation); 
SELECT Name FROM employee WHERE Employee_ID NOT IN (SELECT Employee_ID FROM evaluation)
SELECT s.Name  FROM shop s  JOIN hiring h ON s.Shop_ID = h.Shop_ID  GROUP BY s.Name  ORDER BY COUNT(h.Employee_ID) DESC  LIMIT 1; 
SELECT s.Name FROM shop s JOIN hiring h ON s.Shop_ID = h.Shop_ID GROUP BY s.Name ORDER BY COUNT(h.Employee_ID) DESC LIMIT 1; 
SELECT Name FROM shop WHERE Shop_ID NOT IN (SELECT Shop_ID FROM hiring)
SELECT Name FROM shop WHERE Shop_ID NOT IN (SELECT Shop_ID FROM hiring) 
SELECT s.Name AS Shop_Name, COUNT(h.Employee_ID) AS Number_of_Employees_Hired FROM shop s JOIN hiring h ON s.Shop_ID = h.Shop_ID GROUP BY s.Shop_ID; 
SELECT COUNT(h.Employee_ID), s.Name FROM hiring h JOIN shop s ON h.Shop_ID = s.Shop_ID GROUP BY s.Name; 
SELECT SUM(Bonus) AS Total_Bonus FROM evaluation; 
SELECT SUM(Bonus) AS Total_Bonus FROM evaluation; 
SELECT * FROM hiring; 
SELECT * FROM hiring; 
SELECT District FROM shop WHERE Number_products < 3000 INTERSECT SELECT District FROM shop WHERE Number_products > 10000; 
SELECT District FROM shop WHERE Number_products < 3000 INTERSECT SELECT District FROM shop WHERE Number_products > 10000; 
SELECT COUNT(DISTINCT Location) FROM shop; 
SELECT COUNT(DISTINCT Location) FROM shop; 
SELECT COUNT(*) AS Document_Count FROM Documents; 
SELECT COUNT(Document_ID) AS NumberOfDocuments FROM Documents; 
SELECT Document_ID, Document_Name, Document_Description FROM Documents; 
SELECT Document_ID, Document_Name, Document_Description FROM Documents; 
SELECT Document_Name, Template_ID FROM Documents WHERE Document_Description LIKE '%w%'; 
SELECT Document_Name, Template_ID FROM Documents WHERE Document_Description LIKE '%w%'; 
SELECT Document_ID, Template_ID, Document_Description FROM Documents WHERE Document_Name = 'Robbin CV'; 
SELECT Document_ID, Template_ID, Document_Description FROM Documents WHERE Document_Name = 'Robbin CV'; 
SELECT COUNT(DISTINCT Template_ID) AS Number_of_Different_Templates FROM Documents; 
SELECT COUNT(DISTINCT Template_ID) AS Number_of_Different_Templates FROM Documents; 
SELECT COUNT(*) FROM Documents WHERE Template_ID IN (SELECT Template_ID FROM Templates WHERE Template_Type_Code = 'PPT'); 
SELECT COUNT(*) FROM Documents AS D JOIN Templates AS T ON D.Template_ID = T.Template_ID WHERE T.Template_Type_Code = 'PPT'; 
SELECT T.Template_ID, COUNT(D.Document_ID) AS Number_of_Documents FROM Templates T JOIN Documents D ON T.Template_ID = D.Template_ID GROUP BY T.Template_ID; 
SELECT Template_ID, COUNT(*) AS Usage_Count FROM Documents GROUP BY Template_ID; 
SELECT T.Template_ID, T.Template_Type_Code  FROM Templates AS T  JOIN Documents AS D ON T.Template_ID = D.Template_ID  GROUP BY T.Template_ID, T.Template_Type_Code  ORDER BY COUNT(D.Document_ID) DESC  LIMIT 1; 
SELECT T.Template_ID, T.Template_Type_Code  FROM Templates AS T  JOIN Documents AS D ON T.Template_ID = D.Template_ID  GROUP BY T.Template_ID, T.Template_Type_Code  ORDER BY COUNT(D.Document_ID) DESC  LIMIT 1; 
SELECT Template_ID FROM Documents GROUP BY Template_ID HAVING COUNT(*) > 1; 
SELECT Template_ID FROM Documents GROUP BY Template_ID HAVING COUNT(*) > 1; 
SELECT Template_ID FROM Templates WHERE Template_ID NOT IN (SELECT Template_ID FROM Documents); 
SELECT Template_ID FROM Templates WHERE Template_ID NOT IN (SELECT Template_ID FROM Documents)
SELECT COUNT(Template_ID) AS Total_Templates FROM Templates; 
SELECT COUNT(*) FROM Templates; 
SELECT Template_ID, Version_Number, Template_Type_Code FROM Templates; 
SELECT Template_ID, Version_Number, Template_Type_Code FROM Templates; 
SELECT DISTINCT Template_Type_Code FROM Templates; 
SELECT DISTINCT Template_Type_Code FROM Ref_Template_Types;
SELECT Template_ID FROM Templates WHERE Template_Type_Code IN ('PP', 'PPT'); 
SELECT Template_ID FROM Templates WHERE Template_Type_Code IN ('PP', 'PPT'); 
SELECT COUNT(*) FROM Templates WHERE Template_Type_Code = 'CV'; 
SELECT COUNT(*) FROM Templates WHERE Template_Type_Code = 'CV'; 
SELECT Version_Number, Template_Type_Code FROM Templates WHERE Version_Number > 5; 
SELECT Version_Number, Template_Type_Code FROM Templates WHERE Version_Number > 5; 
SELECT Template_Type_Code, COUNT(*) AS Number_of_Templates FROM Templates GROUP BY Template_Type_Code; 
SELECT Template_Type_Code, COUNT(*) AS Number_of_Templates FROM Templates GROUP BY Template_Type_Code; 
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT Template_Type_Code  FROM Templates  GROUP BY Template_Type_Code  HAVING COUNT(*) < 3; 
SELECT Template_Type_Code  FROM Templates  GROUP BY Template_Type_Code  HAVING COUNT(Template_ID) < 3; 
SELECT MIN(Version_Number), Template_Type_Code FROM Templates; 
SELECT MIN(Version_Number), Template_Type_Code FROM Templates GROUP BY Template_Type_Code; 
SELECT T.Template_Type_Code  FROM Templates AS T  JOIN Documents AS D ON T.Template_ID = D.Template_ID  WHERE D.Document_Name = 'Data base'; 
SELECT T.Template_Type_Code FROM Templates AS T JOIN Documents AS D ON T.Template_ID = D.Template_ID WHERE D.Document_Name = 'Data base'; 
SELECT Document_Name FROM Documents WHERE Template_ID IN (SELECT Template_ID FROM Templates WHERE Template_Type_Code = 'BK'); 
SELECT Document_Name FROM Documents WHERE Template_ID IN (SELECT Template_ID FROM Templates WHERE Template_Type_Code = 'BK')
SELECT T1.Template_Type_Code, COUNT(DISTINCT T2.Document_ID) AS Number_of_Documents FROM Ref_Template_Types AS T1 LEFT JOIN Templates AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code LEFT JOIN Documents AS T3 ON T2.Template_ID = T3.Template_ID GROUP BY T1.Template_Type_Code; 
SELECT T.Template_Type_Code, COUNT(D.Document_ID) AS Document_Count FROM Templates T JOIN Documents D ON T.Template_ID = D.Template_ID GROUP BY T.Template_Type_Code; 
SELECT T2.Template_Type_Code FROM Documents AS T1 INNER JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T2.Template_Type_Code ORDER BY COUNT(T2.Template_Type_Code) DESC LIMIT 1
SELECT Template_Type_Code FROM Templates JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Code NOT IN (SELECT Template_Type_Code FROM Templates WHERE Template_ID IN (SELECT Template_ID FROM Documents))
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Code NOT IN (SELECT Template_Type_Code FROM Templates JOIN Documents ON Templates.Template_ID = Documents.Template_ID);
SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types; 
SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types; 
SELECT Template_Type_Description FROM Ref_Template_Types WHERE Template_Type_Code = 'AD'; 
SELECT Template_Type_Description FROM Ref_Template_Types WHERE Template_Type_Code = 'AD'; 
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Book'; 
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Book'; 
SELECT DISTINCT RTT.Template_Type_Description FROM Ref_Template_Types RTT JOIN Templates T ON RTT.Template_Type_Code = T.Template_Type_Code JOIN Documents D ON T.Template_ID = D.Template_ID; 
SELECT DISTINCT T2.Template_Details  FROM Documents AS T1  JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID; 
SELECT T1.Template_ID FROM Templates AS T1 INNER JOIN Ref_Template_Types AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code WHERE T2.Template_Type_Description = 'Presentation'; 
SELECT T.Template_ID FROM Templates AS T JOIN Ref_Template_Types AS RTT ON T.Template_Type_Code = RTT.Template_Type_Code WHERE RTT.Template_Type_Description = 'Presentation'; 
SELECT COUNT(*) AS Total_Paragraphs FROM Paragraphs; 
SELECT COUNT(*) FROM Paragraphs; 
SELECT COUNT(*) AS Paragraph_Count FROM Documents d JOIN Paragraphs p ON d.Document_ID = p.Document_ID WHERE d.Document_Name = 'Summer Show'; 
SELECT COUNT(*) FROM Paragraphs AS P JOIN Documents AS D ON P.Document_ID = D.Document_ID WHERE D.Document_Name = 'Summer Show'; 
SELECT Other_Details FROM Paragraphs WHERE Paragraph_Text = 'Korea'; 
SELECT Paragraph_Details FROM Paragraphs WHERE Paragraph_Text LIKE '%Korea%' 
SELECT p.Paragraph_ID, p.Paragraph_Text  FROM Paragraphs p  JOIN Documents d ON p.Document_ID = d.Document_ID  WHERE d.Document_Name = 'Welcome to NY'; 
SELECT p.Paragraph_ID, p.Paragraph_Text FROM Paragraphs p JOIN Documents d ON p.Document_ID = d.Document_ID WHERE d.Document_Name = 'Welcome to NY'; 
SELECT p.Paragraph_Text FROM Paragraphs p JOIN Documents d ON p.Document_ID = d.Document_ID WHERE d.Document_Name = 'Customer reviews'; 
SELECT p.Paragraph_Text FROM Paragraphs p JOIN Documents d ON p.Document_ID = d.Document_ID WHERE d.Document_Name = 'Customer reviews'; 
SELECT Document_ID, COUNT(*) AS Paragraph_Count FROM Paragraphs GROUP BY Document_ID ORDER BY Document_ID; 
SELECT Document_ID, COUNT(*) AS Paragraph_Count FROM Paragraphs GROUP BY Document_ID ORDER BY Document_ID; 
SELECT d.Document_ID, d.Document_Name, COUNT(p.Paragraph_ID) AS Paragraph_Count FROM Documents d LEFT JOIN Paragraphs p ON d.Document_ID = p.Document_ID GROUP BY d.Document_ID, d.Document_Name; 
SELECT d.Document_ID, d.Document_Name, COUNT(p.Paragraph_ID) AS Number_of_Paragraphs FROM Documents d LEFT JOIN Paragraphs p ON d.Document_ID = p.Document_ID GROUP BY d.Document_ID, d.Document_Name; 
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(*) >= 2; 
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(*) >= 2
SELECT d.Document_ID, d.Document_Name  FROM Documents d  JOIN Paragraphs p ON d.Document_ID = p.Document_ID  GROUP BY d.Document_ID, d.Document_Name  ORDER BY COUNT(p.Paragraph_ID) DESC  LIMIT 1; 
SELECT d.Document_ID, d.Document_Name FROM Documents d JOIN (     SELECT Document_ID, COUNT(*) AS Paragraph_Count     FROM Paragraphs     GROUP BY Document_ID ) p ON d.Document_ID = p.Document_ID ORDER BY p.Paragraph_Count DESC LIMIT 1; 
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID ORDER BY COUNT(*) ASC LIMIT 1; 
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID ORDER BY COUNT(*) ASC LIMIT 1; 
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(*) BETWEEN 1 AND 2; 
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(*) BETWEEN 1 AND 2; 
SELECT Document_ID FROM Paragraphs WHERE Paragraph_Text IN ('Brazil', 'Ireland'); 
SELECT Document_ID FROM Paragraphs WHERE Paragraph_Text IN ('Brazil', 'Ireland'); 
SELECT COUNT(*) FROM teacher; 
SELECT COUNT(Teacher_ID) AS Total_Teachers FROM teacher; 
SELECT Name FROM teacher ORDER BY Age ASC; 
SELECT Name FROM teacher ORDER BY Age ASC; 
SELECT Age, Hometown FROM teacher; 
SELECT Age, Hometown FROM teacher; 
SELECT Name FROM teacher WHERE Hometown != 'Little Lever Urban District'; 
SELECT Name FROM teacher WHERE Hometown != 'Little Lever Urban District'; 
SELECT Name FROM teacher WHERE Age IN (32, 33); 
SELECT Name FROM teacher WHERE Age IN ('32', '33'); 
SELECT Hometown FROM teacher ORDER BY Age ASC LIMIT 1; 
SELECT Hometown FROM teacher ORDER BY Age ASC LIMIT 1; 
SELECT T2.Hometown, COUNT(T2.Teacher_ID) AS Number_of_Teachers FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T2.Hometown; 
SELECT Hometown, COUNT(*) AS NumberOfTeachers FROM teacher GROUP BY Hometown; 
SELECT Hometown FROM teacher GROUP BY Hometown ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT Hometown, COUNT(*) AS Count FROM teacher GROUP BY Hometown ORDER BY Count DESC LIMIT 1; 
SELECT Hometown FROM teacher GROUP BY Hometown HAVING COUNT(*) >= 2; 
SELECT Hometown FROM teacher GROUP BY Hometown HAVING COUNT(*) >= 2
SELECT T2.Name, T1.Course FROM course AS T1 INNER JOIN teacher AS T2 ON T1.Course_ID = T2.Teacher_ID; 
SELECT T1.Name, T3.Course FROM teacher AS T1 INNER JOIN course_arrange AS T2 ON T1.Teacher_ID = T2.Teacher_ID INNER JOIN course AS T3 ON T2.Course_ID = T3.Course_ID
SELECT T2.Name, T3.Course FROM course_arrange AS T1 INNER JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID INNER JOIN course AS T3 ON T1.Course_ID = T3.Course_ID ORDER BY T2.Name ASC; 
SELECT T2.Name, T1.Course FROM course AS T1 INNER JOIN teacher AS T2 ON T1.Course_ID = T2.Teacher_ID ORDER BY T2.Name ASC; 
SELECT T2.Name FROM course AS T1 INNER JOIN teacher AS T2 ON T1.Course_ID = T3.Course_ID INNER JOIN course_arrange AS T3 ON T1.Course_ID = T3.Course_ID WHERE T1.Course = 'Math'
SELECT T2.Name FROM course AS T1 INNER JOIN teacher AS T2 ON T1.Course_ID = T2.Teacher_ID WHERE T1.Course = 'Math'
SELECT T2.Name, COUNT(T1.Course_ID) AS Course_Count FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T2.Name; 
SELECT T2.Name, COUNT(T1.Course_ID) AS Course_Count FROM course_arrange AS T1 INNER JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T2.Name ORDER BY Course_Count DESC; 
SELECT T2.Name FROM course_arrange AS T1 INNER JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T2.Name HAVING COUNT(T1.Course_ID) >= 2; 
SELECT T.Name FROM teacher AS T JOIN course_arrange AS CA ON T.Teacher_ID = CA.Teacher_ID GROUP BY T.Name HAVING COUNT(CA.Course_ID) >= 2
SELECT Name FROM teacher WHERE Teacher_ID NOT IN (SELECT Teacher_ID FROM course_arrange) 
SELECT Name FROM teacher WHERE Teacher_ID NOT IN (SELECT Teacher_ID FROM course_arrange)
SELECT COUNT(*) FROM visitor WHERE Age < 30; 
SELECT Name FROM visitor WHERE Level_of_membership > 4 ORDER BY Level_of_membership DESC; 
SELECT AVG(Age) FROM visitor WHERE Level_of_membership <= 4; 
SELECT Name, Level_of_membership FROM visitor WHERE Level_of_membership > 4 ORDER BY Age DESC; 
SELECT Museum_ID, Name FROM museum ORDER BY Num_of_Staff DESC LIMIT 1; 
SELECT AVG(Num_of_Staff) FROM museum WHERE Open_Year < '2009'; 
SELECT Open_Year, Num_of_Staff FROM museum WHERE Name = 'Plaza Museum'; 
SELECT Name FROM museum WHERE Num_of_Staff > (SELECT MIN(Num_of_Staff) FROM museum WHERE Open_Year > '2010') 
SELECT visitor.ID, visitor.Name, visitor.Age FROM visitor JOIN visit ON visitor.ID = visit.visitor_ID GROUP BY visitor.ID HAVING COUNT(visit.Museum_ID) > 1; 
SELECT v.ID, v.Name, v.Level_of_membership, SUM(vt.Total_spent) AS Total_Spent FROM visitor v JOIN visit vt ON v.ID = vt.visitor_ID GROUP BY v.ID ORDER BY Total_Spent DESC LIMIT 1; 
SELECT m.Museum_ID, m.Name FROM museum m JOIN visit v ON m.Museum_ID = v.Museum_ID GROUP BY m.Museum_ID, m.Name ORDER BY COUNT(v.Num_of_Ticket) DESC LIMIT 1; 
SELECT Name FROM museum WHERE Museum_ID NOT IN (SELECT Museum_ID FROM visit); 
SELECT v.Name, v.Age FROM visitor v JOIN visit vt ON v.ID = vt.visitor_ID ORDER BY vt.Num_of_Ticket DESC LIMIT 1; 
SELECT AVG(Num_of_Ticket) AS Average_Tickets, MAX(Num_of_Ticket) AS Maximum_Tickets FROM visit; 
SELECT SUM(Total_spent) AS Total_Ticket_Expense FROM visit JOIN visitor ON visit.visitor_ID = visitor.ID WHERE visitor.Level_of_membership = 1; 
SELECT v.Name FROM visitor v JOIN visit vi ON v.ID = vi.visitor_ID JOIN museum m ON vi.Museum_ID = m.Museum_ID WHERE m.Open_Year < '2009' INTERSECT SELECT v.Name FROM visitor v JOIN visit vi ON v.ID = vi.visitor_ID JOIN museum m ON vi.Museum_ID = m.Museum_ID WHERE m.Open_Year > '2011'; 
SELECT COUNT(DISTINCT visitor_ID) FROM visit WHERE Museum_ID NOT IN (SELECT Museum_ID FROM museum WHERE Open_Year > '2010') 
SELECT COUNT(*) FROM museum WHERE Open_Year < '2008' OR Open_Year > '2013'; 
SELECT COUNT(player_id) FROM players; 
SELECT COUNT(player_id) AS number_of_players FROM players; 
SELECT COUNT(*) FROM matches; 
SELECT COUNT(*) FROM matches; 
SELECT first_name, birth_date FROM players WHERE country_code = 'USA'; 
SELECT first_name, birth_date FROM players WHERE country_code = 'USA'; 
SELECT AVG(loser_age) AS avg_loser_age, AVG(winner_age) AS avg_winner_age FROM matches;
SELECT AVG(loser_age) AS avg_loser_age, AVG(winner_age) AS avg_winner_age FROM matches; 
SELECT AVG(winner_rank) AS average_winner_rank FROM matches; 
SELECT AVG(winner_rank) AS average_winner_rank FROM matches; 
SELECT MAX(loser_rank) AS max_loser_rank FROM matches; 
SELECT MIN(loser_rank) FROM matches;
SELECT COUNT(DISTINCT country_code) FROM players; 
SELECT COUNT(DISTINCT country_code) FROM players; 
SELECT COUNT(DISTINCT loser_name) FROM matches; 
SELECT COUNT(DISTINCT loser_name) AS distinct_loser_names FROM matches; 
SELECT DISTINCT t.tourney_name FROM matches m JOIN (     SELECT tourney_name     FROM matches     GROUP BY tourney_name     HAVING COUNT(*) > 10 ) t ON m.tourney_name = t.tourney_name; 
SELECT tournament_name FROM matches GROUP BY tournament_name HAVING COUNT(*) > 10; 
SELECT DISTINCT winner_name FROM matches WHERE year = 2013 AND winner_name IN (     SELECT winner_name     FROM matches     WHERE year = 2016 ); 
SELECT DISTINCT winner_name FROM matches WHERE year IN (2013, 2016) GROUP BY winner_name HAVING COUNT(DISTINCT year) = 2; 
SELECT COUNT(*) FROM matches WHERE year IN (2013, 2016); 
SELECT COUNT(*) FROM matches WHERE year IN (2013, 2016); 
SELECT p.country_code, p.first_name FROM players p JOIN matches m ON p.player_id = m.winner_id WHERE m.tourney_name IN ('WTA Championships', 'Australian Open') GROUP BY p.player_id, p.country_code, p.first_name HAVING COUNT(DISTINCT m.tourney_name) = 2; 
SELECT DISTINCT p.first_name, p.country_code FROM players p JOIN matches m ON p.player_id = m.winner_id WHERE m.tourney_name IN ('WTA Championships', 'Australian Open') GROUP BY p.player_id HAVING COUNT(DISTINCT m.tourney_name) = 2; 
SELECT first_name, country_code FROM players ORDER BY birth_date ASC LIMIT 1; 
SELECT first_name, country_code FROM players WHERE birth_date IS NOT NULL ORDER BY birth_date ASC LIMIT 1; 
SELECT first_name, last_name FROM players ORDER BY birth_date; 
SELECT first_name, last_name FROM players ORDER BY birth_date; 
SELECT first_name, last_name FROM players WHERE hand = 'L' ORDER BY birth_date; 
SELECT first_name, last_name FROM players WHERE hand = 'L' ORDER BY birth_date; 
SELECT p.first_name, p.country_code FROM players p JOIN rankings r ON p.player_id = r.player_id GROUP BY p.player_id ORDER BY SUM(r.tours) DESC LIMIT 1; 
SELECT p.first_name, p.country_code FROM players p JOIN rankings r ON p.player_id = r.player_id GROUP BY p.player_id ORDER BY SUM(r.tours) DESC LIMIT 1; 
SELECT YEAR FROM matches GROUP BY YEAR ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT YEAR FROM matches GROUP BY YEAR ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT T2.winner_name, T1.ranking_points FROM rankings AS T1 JOIN matches AS T2 ON T1.player_id = T2.winner_id GROUP BY T2.winner_name ORDER BY COUNT(T2.match_num) DESC LIMIT 1; 
SELECT p.winner_name, r.ranking_points FROM players p JOIN matches m ON p.player_id = m.winner_id JOIN rankings r ON p.player_id = r.player_id GROUP BY p.winner_name ORDER BY COUNT(m.match_num) DESC LIMIT 1
SELECT T1.winner_name FROM matches AS T1 JOIN players AS T2 ON T1.winner_id = T2.player_id WHERE T1.tourney_name = 'Australian Open' ORDER BY T2.ranking_points DESC LIMIT 1; 
SELECT w.first_name, w.last_name, SUM(r.ranking_points) AS total_rank_points FROM players w JOIN matches m ON w.player_id = m.winner_id WHERE m.tourney_name = 'Australian Open' GROUP BY w.player_id ORDER BY total_rank_points DESC LIMIT 1; 
SELECT winner_name, loser_name FROM matches ORDER BY minutes DESC LIMIT 1; 
SELECT w.winner_name, l.loser_name, m.minutes FROM matches m JOIN players w ON m.winner_id = w.player_id JOIN players l ON m.loser_id = l.player_id ORDER BY m.minutes DESC LIMIT 1; 
SELECT p.first_name, AVG(r.ranking) AS average_ranking FROM players p JOIN rankings r ON p.player_id = r.player_id GROUP BY p.player_id, p.first_name; 
SELECT T1.first_name ,  AVG(T2.ranking) FROM players AS T1 INNER JOIN rankings AS T2 ON T1.player_id = T2.player_id GROUP BY T1.player_id
SELECT p.first_name, SUM(r.ranking_points) AS total_ranking_points FROM players p JOIN rankings r ON p.player_id = r.player_id GROUP BY p.player_id, p.first_name; 
SELECT p.first_name, SUM(r.ranking_points) AS total_ranking_points FROM players p JOIN rankings r ON p.player_id = r.player_id GROUP BY p.player_id, p.first_name; 
SELECT country_code, COUNT(player_id) AS player_count FROM players GROUP BY country_code; 
SELECT country_code, COUNT(*) AS player_count FROM players GROUP BY country_code ORDER BY player_count DESC; 
SELECT country_code FROM players GROUP BY country_code ORDER BY COUNT(player_id) DESC LIMIT 1; 
SELECT country_code FROM players GROUP BY country_code ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT country_code  FROM players  GROUP BY country_code  HAVING COUNT(player_id) > 50; 
SELECT country_code FROM players GROUP BY country_code HAVING COUNT(player_id) > 50;
SELECT ranking_date, SUM(tours) AS total_tours FROM rankings GROUP BY ranking_date; 
SELECT ranking_date, SUM(tours) AS total_tours FROM rankings GROUP BY ranking_date; 
SELECT COUNT(*) AS match_count, YEAR(tourney_date) AS match_year FROM matches GROUP BY match_year ORDER BY match_year; 
SELECT COUNT(*) AS match_count, YEAR(tourney_date) AS tournament_year FROM matches GROUP BY YEAR(tourney_date) ORDER BY tournament_year; 
SELECT p.first_name, p.last_name, r.ranking FROM players p JOIN (     SELECT winner_id, MIN(winner_age) AS min_age     FROM matches     GROUP BY winner_id ) m ON p.player_id = m.winner_id JOIN rankings r ON p.player_id = r.player_id AND r.ranking_date = (     SELECT MAX(ranking_date)     FROM rankings     WHERE player_id = p.player_id ) ORDER BY m.min_age ASC LIMIT 3; 
SELECT winner_name, winner_rank FROM matches ORDER BY winner_age ASC LIMIT 3; 
SELECT COUNT(DISTINCT w.player_id) AS num_winners FROM players p JOIN matches m ON p.player_id = m.winner_id WHERE m.tourney_name = 'WTA Championships' AND p.hand = 'L'; 
SELECT COUNT(winner_id) AS num_left_handed_winners FROM matches JOIN players ON matches.winner_id = players.player_id WHERE winner_hand = 'L' AND tourney_name = 'WTA Championships'; 
SELECT p.first_name, p.country_code, p.birth_date FROM players p JOIN matches m ON p.player_id = m.winner_id ORDER BY m.winner_rank_points DESC LIMIT 1; 
SELECT p.first_name, p.country_code, p.birth_date FROM players p JOIN (     SELECT winner_id, SUM(winner_rank_points) AS total_winner_points     FROM matches     GROUP BY winner_id ) m ON p.player_id = m.winner_id ORDER BY m.total_winner_points DESC LIMIT 1; 
SELECT hand, COUNT(*) FROM players GROUP BY hand; 
SELECT hand, COUNT(*) AS player_count FROM players GROUP BY hand; 
SELECT COUNT(*) FROM ship WHERE disposition_of_ship = 'Captured'; 
SELECT name, tonnage FROM ship ORDER BY name DESC; 
SELECT name, date, result FROM battle; 
SELECT MAX(killed) AS max_deaths, MIN(killed) AS min_deaths FROM death; 
SELECT AVG(injured) AS average_injuries FROM death; 
SELECT d.id, d.note, d.killed, d.injured  FROM death d  JOIN ship s ON d.caused_by_ship_id = s.id  WHERE s.tonnage = 't'; 
SELECT name, result FROM battle WHERE bulgarian_commander != 'Boril'; 
SELECT DISTINCT T1.id, T1.name FROM battle AS T1 INNER JOIN ship AS T2 ON T1.id = T2.lost_in_battle WHERE T2.ship_type = 'Brig'
SELECT b.id, b.name FROM battle b JOIN ship s ON b.id = s.lost_in_battle JOIN death d ON s.id = d.caused_by_ship_id GROUP BY b.id, b.name HAVING SUM(d.killed) > 10; 
SELECT T1.id, T1.name FROM ship AS T1 INNER JOIN death AS T2 ON T1.id = T2.caused_by_ship_id GROUP BY T1.id ORDER BY SUM(T2.injured) DESC LIMIT 1
SELECT DISTINCT name FROM battle WHERE bulgarian_commander = 'Kaloyan' AND latin_commander = 'Baldwin I'; 
SELECT COUNT(DISTINCT result) FROM battle; 
SELECT COUNT(*) FROM battle WHERE id NOT IN (SELECT lost_in_battle FROM ship WHERE tonnage = '225'); 
SELECT b.name, b.date  FROM battle b  JOIN ship s ON b.id = s.lost_in_battle  WHERE s.name IN ('Lettice', 'HMS Atalanta')  GROUP BY b.id; 
SELECT b.name, b.result, b.bulgarian_commander FROM battle b LEFT JOIN ship s ON b.id = s.lost_in_battle AND s.location = 'English Channel' WHERE s.id IS NULL; 
SELECT note FROM death WHERE note LIKE '%East%'
SELECT line_1, line_2 FROM Addresses; 
SELECT line_1, line_2 FROM Addresses; 
SELECT COUNT(course_id) AS total_courses FROM Courses; 
SELECT COUNT(course_id) AS total_courses FROM Courses; 
SELECT course_description FROM Courses WHERE course_name = 'math'; 
SELECT course_description FROM Courses WHERE course_name = 'math'; 
SELECT zip_postcode FROM Addresses WHERE city = 'Port Chelsea'; 
SELECT zip_postcode FROM Addresses WHERE city = 'Port Chelsea'
SELECT D.department_name, D.department_id, COUNT(DP.degree_program_id) AS degree_count FROM Departments D JOIN Degree_Programs DP ON D.department_id = DP.department_id GROUP BY D.department_id ORDER BY degree_count DESC LIMIT 1; 
SELECT d.department_name, dp.degree_program_id FROM Departments d JOIN Degree_Programs dp ON d.department_id = dp.department_id GROUP BY dp.department_id ORDER BY COUNT(dp.degree_program_id) DESC LIMIT 1; 
SELECT COUNT(DISTINCT department_id) AS department_count FROM Degree_Programs; 
SELECT COUNT(DISTINCT department_id) AS distinct_departments_offering_degrees FROM Degree_Programs; 
SELECT COUNT(DISTINCT degree_summary_name) AS distinct_degree_names FROM Degree_Programs; 
SELECT COUNT(DISTINCT degree_summary_name) AS number_of_degrees FROM Degree_Programs; 
SELECT COUNT(degree_program_id) AS degree_count FROM Degree_Programs JOIN Departments ON Degree_Programs.department_id = Departments.department_id WHERE department_name = 'engineering'; 
SELECT COUNT(degree_summary_name) AS degree_count FROM Degree_Programs WHERE department_id = (SELECT department_id FROM Departments WHERE department_name = 'engineering'); 
SELECT section_name, section_description FROM Sections; 
SELECT section_name, section_description FROM Sections; 
SELECT course_name ,  course_id FROM Courses WHERE course_id IN ( SELECT course_id FROM Sections GROUP BY course_id HAVING COUNT(*) <= 2 )
SELECT T1.course_name ,  T1.course_id FROM Courses AS T1 JOIN Sections AS T2 ON T1.course_id = T2.course_id GROUP BY T1.course_id HAVING COUNT(*) < 2
SELECT section_name FROM Sections ORDER BY section_name DESC;
SELECT section_name FROM Sections ORDER BY section_name DESC; 
SELECT T2.semester_name, T2.semester_id FROM Students AS T1 JOIN Student_Enrolment AS T3 ON T1.student_id = T3.student_id JOIN Semesters AS T2 ON T3.semester_id = T2.semester_id GROUP BY T2.semester_name, T2.semester_id ORDER BY COUNT(T1.student_id) DESC LIMIT 1; 
SELECT s.semester_name, s.semester_id, COUNT(se.student_id) AS student_count FROM Semesters s JOIN Student_Enrolment se ON s.semester_id = se.semester_id GROUP BY s.semester_id ORDER BY student_count DESC LIMIT 1; 
SELECT department_description FROM Departments WHERE department_name LIKE '%computer%' 
SELECT department_description FROM Departments WHERE department_name LIKE '%computer%' 
SELECT s.first_name, s.middle_name, s.last_name, s.student_id FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id GROUP BY s.student_id HAVING COUNT(DISTINCT se.degree_program_id) = 2; 
SELECT s.first_name, s.middle_name, s.last_name, s.student_id FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id GROUP BY s.student_id HAVING COUNT(DISTINCT se.degree_program_id) = 2; 
SELECT s.first_name, s.middle_name, s.last_name FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id JOIN Degree_Programs dp ON se.degree_program_id = dp.degree_program_id WHERE dp.degree_summary_name = 'Bachelor'; 
SELECT DISTINCT s.first_name, s.middle_name, s.last_name FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id JOIN Degree_Programs dp ON se.degree_program_id = dp.degree_program_id WHERE dp.degree_summary_name = 'Bachelor'; 
SELECT dp.degree_summary_name FROM Degree_Programs dp JOIN Student_Enrolment se ON dp.degree_program_id = se.degree_program_id GROUP BY dp.degree_summary_name ORDER BY COUNT(se.student_id) DESC LIMIT 1; 
SELECT T2.degree_summary_name FROM Student_Enrolment AS T1 INNER JOIN Degree_Programs AS T2 ON T1.degree_program_id = T2.degree_program_id GROUP BY T2.degree_summary_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT dp.degree_program_id, dp.degree_summary_name FROM Degree_Programs dp JOIN Student_Enrolment se ON dp.degree_program_id = se.degree_program_id GROUP BY dp.degree_program_id ORDER BY COUNT(se.student_id) DESC LIMIT 1; 
SELECT T1.degree_program_id ,  T1.degree_summary_name FROM Degree_Programs AS T1 INNER JOIN Student_Enrolment AS T2 ON T1.degree_program_id = T2.degree_program_id GROUP BY T1.degree_program_id ORDER BY COUNT(T2.student_id) DESC LIMIT 1
SELECT s.student_id, s.first_name, s.middle_name, s.last_name, COUNT(se.student_id) AS enrollment_count FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id GROUP BY s.student_id ORDER BY enrollment_count DESC LIMIT 1; 
SELECT s.first_name, s.middle_name, s.last_name, COUNT(se.student_id) AS enrollment_count FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id GROUP BY s.student_id ORDER BY enrollment_count DESC LIMIT 1; 
SELECT semester_name FROM Semesters WHERE semester_id NOT IN (SELECT semester_id FROM Student_Enrolment) 
SELECT semester_name FROM Semesters WHERE semester_id NOT IN (SELECT semester_id FROM Student_Enrolment) ORDER BY transcript_date LIMIT 1;
SELECT DISTINCT T1.course_name FROM Courses AS T1 JOIN Student_Enrolment_Courses AS T2 ON T1.course_id = T2.course_id
SELECT course_name FROM Courses WHERE course_id IN (SELECT course_id FROM Student_Enrolment_Courses)
SELECT c.course_name FROM Courses c JOIN Student_Enrolment_Courses sec ON c.course_id = sec.course_id GROUP BY c.course_id ORDER BY COUNT(sec.student_course_id) DESC LIMIT 1; 
SELECT T1.course_name FROM Courses AS T1 JOIN Student_Enrolment_Courses AS T2 ON T1.course_id = T2.course_id GROUP BY T1.course_name ORDER BY COUNT(T2.student_enrolment_id) DESC LIMIT 1
SELECT s.last_name FROM Students s JOIN Addresses a ON s.current_address_id = a.address_id LEFT JOIN Student_Enrolment se ON s.student_id = se.student_id WHERE a.state_province_county = 'North Carolina' AND se.student_id IS NULL; 
SELECT s.last_name FROM Students s JOIN Addresses a ON s.current_address_id = a.address_id WHERE a.state_province_county = 'North Carolina' AND s.student_id NOT IN ( SELECT se.student_id FROM Student_Enrolment se ) ORDER BY s.last_name LIMIT 5;
SELECT t.transcript_date, t.transcript_id FROM Transcripts t JOIN Transcript_Contents tc ON t.transcript_id = tc.transcript_id GROUP BY t.transcript_id HAVING COUNT(tc.student_course_id) >= 2; 
SELECT t.transcript_date, t.transcript_id FROM Transcripts t JOIN Transcript_Contents tc ON t.transcript_id = tc.transcript_id GROUP BY t.transcript_id HAVING COUNT(tc.student_course_id) >= 2; 
SELECT cell_mobile_number FROM Students WHERE first_name = 'Timmothy' AND last_name = 'Ward'; 
SELECT cell_mobile_number FROM Students WHERE first_name = 'Timmothy' AND last_name = 'Ward'; 
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_first_registered ASC LIMIT 1; 
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_first_registered ASC LIMIT 1; 
SELECT first_name, middle_name, last_name FROM Students WHERE date_left IS NOT NULL ORDER BY date_left ASC LIMIT 1; 
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_left ASC LIMIT 1; 
SELECT first_name FROM Students WHERE current_address_id != permanent_address_id; 
SELECT first_name FROM Students WHERE current_address_id <> permanent_address_id; 
SELECT T1.address_id, T1.line_1, T1.line_2, T1.line_3 FROM Addresses AS T1 JOIN Students AS T2 ON T1.address_id = T2.current_address_id GROUP BY T1.address_id ORDER BY COUNT(T2.student_id) DESC LIMIT 1
SELECT a.address_id, a.line_1, a.line_2 FROM Addresses a JOIN Students s ON a.address_id = s.current_address_id GROUP BY a.address_id, a.line_1, a.line_2 ORDER BY COUNT(s.student_id) DESC LIMIT 1; 
SELECT AVG(transcript_date) AS average_transcript_date FROM Transcripts; 
SELECT AVG(transcript_date) AS average_transcript_date FROM Transcripts; 
SELECT transcript_date, other_details FROM Transcripts ORDER BY transcript_date ASC LIMIT 1; 
SELECT transcript_date, other_details FROM Transcripts ORDER BY transcript_date ASC LIMIT 1; 
SELECT COUNT(transcript_id) AS number_of_transcripts FROM Transcripts; 
SELECT COUNT(transcript_id) AS total_transcripts FROM Transcripts; 
SELECT transcript_date FROM TRANSCRIPTS ORDER BY transcript_date DESC LIMIT 1; 
SELECT transcript_date FROM Transcripts ORDER BY transcript_date DESC LIMIT 1; 
SELECT student_enrolment_id, COUNT(transcript_id) AS transcript_count FROM Student_Enrolment_Courses JOIN Transcript_Contents ON Student_Enrolment_Courses.student_course_id = Transcript_Contents.student_course_id GROUP BY student_enrolment_id ORDER BY transcript_count DESC LIMIT 1; 
SELECT T1.course_id, COUNT(DISTINCT T2.transcript_id) AS max_appearances FROM Student_Enrolment_Courses AS T1 JOIN Transcript_Contents AS T2 ON T1.student_course_id = T2.student_course_id GROUP BY T1.course_id ORDER BY max_appearances DESC LIMIT 1; 
SELECT transcript_date, transcript_id FROM Transcripts WHERE transcript_id IN (     SELECT transcript_id FROM Transcript_Contents GROUP BY transcript_id ORDER BY COUNT(*) ASC LIMIT 1 ) 
SELECT T1.transcript_date, T1.transcript_id FROM TRANSCRIPTS AS T1 JOIN TRANSCRIPT_CONTENTS AS T2 ON T1.transcript_id = T2.transcript_id GROUP BY T1.transcript_id ORDER BY COUNT(*) ASC LIMIT 1; 
SELECT s.semester_name FROM Semesters s JOIN Student_Enrolment se ON s.semester_id = se.semester_id WHERE se.degree_program_id IN (     SELECT degree_program_id FROM Degree_Programs WHERE degree_summary_name = 'Master' ) AND EXISTS (     SELECT 1 FROM Student_Enrolment se2 WHERE se2.semester_id = s.semester_id AND se2.degree_program_id IN (         SELECT degree_program_id FROM Degree_Programs WHERE degree_summary_name = 'Bachelor'     ) ) ORDER BY s.semester_name; 
SELECT semester_id FROM Student_Enrolment WHERE degree_program_id IN (     SELECT degree_program_id     FROM Degree_Programs     WHERE degree_summary_name IN ('Master', 'Bachelor') ) GROUP BY semester_id HAVING COUNT(DISTINCT degree_program_id) = 2; 
SELECT COUNT(DISTINCT current_address_id) AS number_of_different_addresses FROM Students; 
SELECT DISTINCT T1.line_1, T1.line_2, T1.line_3, T1.city, T1.zip_postcode, T1.state_province_county, T1.country FROM Addresses AS T1 INNER JOIN Students AS T2 ON T1.address_id = T2.current_address_id OR T1.address_id = T2.permanent_address_id
SELECT first_name, middle_name, last_name FROM Students ORDER BY last_name DESC; 
SELECT other_student_details FROM Students ORDER BY last_name DESC
SELECT course_name, section_description  FROM Sections  JOIN Courses ON Sections.course_id = Courses.course_id  WHERE section_name = 'h'; 
SELECT section_description FROM Sections WHERE section_name = 'h'; 
SELECT DISTINCT s.first_name  FROM Students s JOIN Addresses a ON s.permanent_address_id = a.address_id WHERE a.country = 'Haiti' OR s.cell_mobile_number = '09700166582'; 
SELECT DISTINCT first_name FROM Students WHERE permanent_address_id IN ( SELECT address_id FROM Addresses WHERE country = 'Haiti' ) OR cell_mobile_number = '09700166582'
SELECT Title FROM Cartoon ORDER BY Title ASC; 
SELECT Title FROM Cartoon ORDER BY Title ASC; 
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones'; 
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones'; 
SELECT COUNT(*) FROM Cartoon WHERE Written_by = 'Joseph Kuhr'; 
SELECT COUNT(*) FROM Cartoon WHERE Written_by = 'Joseph Kuhr'; 
SELECT Title, Directed_by FROM Cartoon ORDER BY Original_air_date; 
SELECT T2.Title ,  T2.Directed_by FROM Cartoon AS T1 INNER JOIN TV_Channel AS T2 ON T1.Channel  =  T2.id ORDER BY T1.Original_air_date
SELECT Title FROM Cartoon WHERE Directed_by IN ('Ben Jones', 'Brandon Vietti'); 
SELECT Title FROM Cartoon WHERE Directed_by IN ('Ben Jones', 'Brandon Vietti') 
SELECT Country, COUNT(*) AS Number_of_TVs FROM TV_Channel GROUP BY Country ORDER BY Number_of_TVs DESC LIMIT 1; 
SELECT Country, COUNT(*) AS Number_of_Channels FROM TV_Channel GROUP BY Country ORDER BY Number_of_Channels DESC LIMIT 1; 
SELECT COUNT(DISTINCT series_name), COUNT(DISTINCT Content) FROM TV_Channel; 
SELECT COUNT(DISTINCT series_name), COUNT(DISTINCT Content) FROM TV_Channel; 
SELECT Content FROM TV_Channel WHERE series_name = 'Sky Radio'; 
SELECT Content FROM TV_Channel WHERE series_name = 'Sky Radio'
SELECT Package_Option FROM TV_Channel WHERE series_name = 'Sky Radio'; 
SELECT Package_Option FROM TV_Channel WHERE series_name = 'Sky Radio'; 
SELECT COUNT(*) FROM TV_Channel WHERE Language = 'English'; 
SELECT COUNT(*) FROM TV_Channel WHERE Language = 'English'; 
SELECT Language, COUNT(*) AS Number_of_Channels FROM TV_Channel GROUP BY Language ORDER BY Number_of_Channels ASC LIMIT 1; 
SELECT Language, COUNT(*) AS Channel_Count FROM TV_Channel GROUP BY Language ORDER BY Channel_Count ASC LIMIT 1; 
SELECT Language, COUNT(*) AS Number_of_Channels FROM TV_Channel GROUP BY Language; 
SELECT Language, COUNT(id) AS Number_of_Channels FROM TV_Channel GROUP BY Language; 
SELECT T1.series_name FROM TV_Channel AS T1 INNER JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Title = 'The Rise of the Blue Beetle!' 
SELECT T1.series_name FROM TV_Channel AS T1 INNER JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Title = 'The Rise of the Blue Beetle!'; 
SELECT C.Title  FROM Cartoon AS C  JOIN TV_Channel AS TC ON C.Channel = TC.id  WHERE TC.series_name = 'Sky Radio'; 
SELECT T2.Title FROM TV_Channel AS T1 INNER JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T1.series_name = 'Sky Radio'
SELECT Episode FROM TV_series ORDER BY Rating DESC; 
SELECT Episode FROM TV_series ORDER BY Rating DESC; 
SELECT Episode, Rating FROM TV_series ORDER BY Rating DESC LIMIT 3; 
SELECT Episode, Rating FROM TV_series ORDER BY Rating DESC LIMIT 3; 
SELECT MIN(Share) AS min_share, MAX(Share) AS max_share FROM TV_series; 
SELECT MAX(Share), MIN(Share) FROM TV_series; 
SELECT Air_Date FROM TV_series WHERE Episode = 'A Love of a Lifetime'; 
SELECT Air_Date FROM TV_series WHERE Episode = 'A Love of a Lifetime'; 
SELECT Weekly_Rank FROM TV_series WHERE Episode = 'A Love of a Lifetime'; 
SELECT Weekly_Rank FROM TV_series WHERE Episode = 'A Love of a Lifetime'
SELECT T2.series_name FROM TV_series AS T1 INNER JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T1.Episode = 'A Love of a Lifetime'; 
SELECT Episode FROM TV_series WHERE Episode = 'A Love of a Lifetime'; 
SELECT T2.Episode FROM TV_Channel AS T1 INNER JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T1.series_name = 'Sky Radio'; 
SELECT T2.Episode FROM TV_Channel AS T1 INNER JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T1.series_name = 'Sky Radio'; 
SELECT Directed_by, COUNT(*) AS Number_of_Cartoons FROM Cartoon GROUP BY Directed_by; 
SELECT Directed_by, COUNT(*) AS Number_of_Cartoons FROM Cartoon GROUP BY Directed_by; 
SELECT Production_code, Channel FROM Cartoon ORDER BY Original_air_date DESC LIMIT 1; 
SELECT Production_code ,  Channel FROM Cartoon ORDER BY Original_air_date DESC LIMIT 1
SELECT Package_Option, series_name FROM TV_Channel WHERE Hight_definition_TV = 'yes'; 
SELECT Package_Option, series_name FROM TV_Channel WHERE Hight_definition_TV = 'yes'; 
SELECT DISTINCT T1.Country FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Written_by = 'Todd Casey'; 
SELECT DISTINCT T1.Country FROM TV_Channel AS T1 INNER JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Written_by = 'Todd Casey'; 
SELECT Country FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Written_by = 'Todd Casey') 
SELECT DISTINCT Country FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Written_by = 'Todd Casey') 
SELECT DISTINCT tc.series_name, tc.Country FROM TV_Channel tc JOIN Cartoon c ON tc.id = c.Channel WHERE c.Directed_by IN ('Ben Jones', 'Michael Chang') AND c.Written_by IN ('Michael Chang') ORDER BY tc.series_name; 
SELECT DISTINCT T1.series_name, T1.Country  FROM TV_Channel AS T1  JOIN Cartoon AS T2 ON T1.id = T2.Channel  WHERE T2.directed_by IN ('Ben Jones', 'Michael Chang') ORDER BY T1.series_name; 
SELECT Pixel_aspect_ratio_PAR, Country FROM TV_Channel WHERE Language != 'English'; 
SELECT Pixel_aspect_ratio_PAR, Country FROM TV_Channel WHERE Language != 'English'; 
SELECT Country, COUNT(id) AS Channel_Count FROM TV_Channel GROUP BY Country HAVING Channel_Count > 2; 
SELECT id FROM TV_Channel GROUP BY id HAVING COUNT(id) > 2
SELECT id FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones')
SELECT id FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones') 
SELECT Package_Option FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones') 
SELECT Package_Option FROM TV_Channel WHERE id NOT IN ( SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones' )
SELECT COUNT(*) FROM poker_player; 
SELECT COUNT(*) FROM poker_player; 
SELECT Earnings FROM poker_player ORDER BY Earnings DESC; 
SELECT Earnings FROM poker_player ORDER BY Earnings DESC
SELECT Final_Table_Made, Best_Finish FROM poker_player; 
SELECT Final_Table_Made, Best_Finish FROM poker_player; 
SELECT AVG(Earnings) AS Average_Earnings FROM poker_player; 
SELECT AVG(Earnings) AS Average_Earnings FROM poker_player; 
SELECT Money_Rank FROM poker_player ORDER BY Earnings DESC LIMIT 1; 
SELECT Money_Rank FROM poker_player ORDER BY Earnings DESC LIMIT 1; 
SELECT MAX(Final_Table_Made) AS Max_Final_Tables_Made FROM poker_player WHERE Earnings < 200000; 
SELECT MAX(Final_Table_Made) AS Max_Final_Tables_Made FROM poker_player WHERE Earnings < 200000; 
SELECT T2.Name FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID; 
SELECT T2.Name FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID; 
SELECT p.Name FROM people p JOIN poker_player pp ON p.People_ID = pp.People_ID WHERE pp.Earnings > 300000; 
SELECT p.Name FROM poker_player pp JOIN people p ON pp.People_ID = p.People_ID WHERE pp.Earnings > 300000; 
SELECT p.Name FROM people AS p JOIN poker_player AS pp ON p.People_ID = pp.People_ID ORDER BY pp.Final_Table_Made ASC; 
SELECT T2.Name FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Final_Table_Made ASC
SELECT p.Birth_Date  FROM people p  JOIN poker_player pp ON p.People_ID = pp.People_ID  ORDER BY pp.Earnings ASC  LIMIT 1; 
SELECT T2.Birth_Date FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Earnings ASC LIMIT 1
SELECT T1.Money_Rank FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T2.Height DESC LIMIT 1
SELECT p.Money_Rank  FROM poker_player AS pp  JOIN people AS pe ON pp.People_ID = pe.People_ID  ORDER BY pe.Height DESC  LIMIT 1; 
SELECT AVG(p.Earnings) AS Average_Earnings FROM poker_player p JOIN people pe ON p.People_ID = pe.People_ID WHERE pe.Height > 200; 
SELECT AVG(p.Earnings) AS Average_Earnings FROM poker_player p JOIN people pe ON p.People_ID = pe.People_ID WHERE pe.Height > 200; 
SELECT T2.Name FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Earnings DESC; 
SELECT T2.Name FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Earnings DESC; 
SELECT Nationality, COUNT(*) FROM people GROUP BY Nationality; 
SELECT Nationality, COUNT(*) AS Number_of_People FROM people GROUP BY Nationality; 
SELECT Nationality, COUNT(*) as Count FROM people GROUP BY Nationality ORDER BY Count DESC LIMIT 1; 
SELECT Nationality FROM people GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT Nationality FROM people GROUP BY Nationality HAVING COUNT(*) >= 2
SELECT Nationality FROM people GROUP BY Nationality HAVING COUNT(*) >= 2; 
SELECT Name, Birth_Date FROM people ORDER BY Name ASC; 
SELECT Name, Birth_Date FROM people ORDER BY Name ASC; 
SELECT Name FROM people WHERE Nationality != 'Russia'; 
SELECT Name FROM people WHERE Nationality != 'Russia'; 
SELECT Name FROM people WHERE People_ID NOT IN (SELECT People_ID FROM poker_player)
SELECT Name FROM people WHERE People_ID NOT IN (SELECT People_ID FROM poker_player); 
SELECT COUNT(DISTINCT Nationality) FROM people; 
SELECT COUNT(DISTINCT Nationality) FROM people; 
SELECT COUNT(DISTINCT state) AS number_of_states FROM AREA_CODE_STATE; 
SELECT C.contestant_number, C.contestant_name  FROM CONTESTANTS AS C  ORDER BY C.contestant_name DESC; 
SELECT vote_id, phone_number, state FROM VOTES; 
SELECT MAX(area_code), MIN(area_code) FROM AREA_CODE_STATE; 
SELECT MAX(created) AS last_date_created FROM VOTES WHERE state = 'CA'; 
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name != 'Jessie Alloway'; 
SELECT DISTINCT state, created FROM VOTES; 
SELECT C.contestant_number, C.contestant_name FROM CONTESTANTS AS C JOIN VOTES AS V ON C.contestant_number = V.contestant_number GROUP BY C.contestant_number, C.contestant_name HAVING COUNT(V.vote_id) >= 2; 
SELECT C.contestant_number, C.contestant_name FROM CONTESTANTS AS C JOIN VOTES AS V ON C.contestant_number = V.contestant_number GROUP BY C.contestant_number, C.contestant_name ORDER BY COUNT(V.vote_id) ASC LIMIT 1; 
SELECT COUNT(*) FROM VOTES WHERE state IN ('NY', 'CA'); 
SELECT COUNT(*) FROM CONTESTANTS WHERE contestant_number NOT IN (SELECT DISTINCT contestant_number FROM VOTES); 
SELECT T2.area_code FROM VOTES AS T1 INNER JOIN AREA_CODE_STATE AS T2 ON T1.state = T2.state GROUP BY T2.area_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT V.created, V.state, V.phone_number  FROM VOTES V  JOIN CONTESTANTS C ON V.contestant_number = C.contestant_number  WHERE C.contestant_name = 'Tabatha Gehling'; 
SELECT DISTINCT a.area_code FROM AREA_CODE_STATE a JOIN VOTES v ON a.state = v.state JOIN CONTESTANTS c ON v.contestant_number = c.contestant_number WHERE c.contestant_name IN ('Tabatha Gehling', 'Kelly Clauss') GROUP BY a.area_code HAVING COUNT(DISTINCT c.contestant_name) > 1; 
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name LIKE '%Al%'; 
SELECT Name FROM country WHERE IndepYear > 1950; 
SELECT Name FROM country WHERE IndepYear > 1950; 
SELECT COUNT(Code) FROM country WHERE GovernmentForm = 'Republic'; 
SELECT COUNT(*) FROM country WHERE GovernmentForm = 'Republic'; 
SELECT SUM(SurfaceArea) FROM country WHERE Region = 'Caribbean'; 
SELECT SUM(SurfaceArea) AS TotalSurfaceArea FROM country WHERE Region = 'Caribbean'; 
SELECT Continent FROM country WHERE Name = 'Anguilla'; 
SELECT Continent FROM country WHERE Name = 'Anguilla'; 
SELECT T2.Region FROM city AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T1.Name = 'Kabul' 
SELECT T2.Region FROM city AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T1.Name = 'Kabul' 
SELECT Language FROM countrylanguage WHERE CountryCode = 'ABW' ORDER BY Percentage DESC LIMIT 1; 
SELECT Language FROM countrylanguage WHERE CountryCode = (SELECT Code FROM country WHERE Name = 'Aruba') ORDER BY Percentage DESC LIMIT 1
SELECT T1.Population, T1.LifeExpectancy FROM country AS T1 WHERE T1.Name = 'Brazil'; 
SELECT Population, LifeExpectancy FROM country WHERE Name = 'Brazil'; 
SELECT Region, Population FROM country WHERE Name = 'Angola'; 
SELECT Region, Population FROM country WHERE Name = 'Angola'; 
SELECT AVG(LifeExpectancy) AS AverageLifeExpectancy FROM country WHERE Region = 'Central Africa'; 
SELECT AVG(LifeExpectancy) AS AverageLifeExpectancy FROM country WHERE Region = 'Central Africa'; 
SELECT Name FROM country WHERE Continent = 'Asia' ORDER BY LifeExpectancy ASC LIMIT 1; 
SELECT Name FROM country WHERE Continent = 'Asia' ORDER BY LifeExpectancy ASC LIMIT 1; 
SELECT SUM(Total.Population), MAX(Total.GNP) FROM (     SELECT c.Population, c.GNP     FROM country AS c     WHERE c.Continent = 'Asia' ) AS Total; 
SELECT SUM(Population), MAX(GNP) FROM country WHERE Continent = 'Asia'; 
SELECT AVG(T1.LifeExpectancy) AS AverageLifeExpectancy FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.Continent = 'Africa' AND T1.GovernmentForm = 'Republic'; 
SELECT AVG(LifeExpectancy)  FROM country  WHERE Continent = 'Africa' AND GovernmentForm = 'Republic'; 
SELECT SUM(SurfaceArea) AS TotalSurfaceArea FROM country WHERE Continent IN ('Asia', 'Europe'); 
SELECT SUM(SurfaceArea) AS TotalSurfaceArea FROM country WHERE Continent IN ('Asia', 'Europe'); 
SELECT SUM(Population) AS TotalPopulation FROM city WHERE District = 'Gelderland'; 
SELECT SUM(Population) AS TotalPopulation FROM city WHERE District = 'Gelderland'; 
SELECT AVG(GNP), SUM(Population)  FROM country  WHERE GovernmentForm = 'US Territory'; 
SELECT AVG(GNP), SUM(Population) FROM country WHERE Continent = 'North America' AND Region = 'Caribbean'; 
SELECT COUNT(DISTINCT Language) AS UniqueLanguages FROM countrylanguage; 
SELECT COUNT(DISTINCT Language) AS NumberOfDistinctLanguages FROM countrylanguage; 
SELECT COUNT(DISTINCT GovernmentForm) AS NumberOfGovernments FROM country WHERE Continent = 'Africa'; 
SELECT COUNT(DISTINCT GovernmentForm) FROM country WHERE Continent = 'Africa'
SELECT COUNT(Language) AS TotalLanguages FROM countrylanguage WHERE CountryCode = 'ABW'; 
SELECT COUNT(Language) AS NumberOfLanguages FROM countrylanguage WHERE CountryCode = 'ABW'; 
SELECT COUNT(Language) AS NumberOfOfficialLanguages FROM countrylanguage WHERE CountryCode = 'AFG' AND IsOfficial = 'T'; 
SELECT COUNT(Language) AS NumberOfOfficialLanguages FROM countrylanguage WHERE CountryCode = 'AFG' AND IsOfficial = 'T'; 
SELECT c.Name FROM country c JOIN (     SELECT cl.CountryCode, COUNT(cl.Language) AS LanguageCount     FROM countrylanguage cl     GROUP BY cl.CountryCode ) sub ON c.Code = sub.CountryCode ORDER BY sub.LanguageCount DESC LIMIT 1; 
SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode GROUP BY T1.Name ORDER BY COUNT(DISTINCT T2.Language) DESC LIMIT 1; 
SELECT c.Continent, COUNT(cl.Language) AS LanguageCount FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode GROUP BY c.Continent ORDER BY LanguageCount DESC LIMIT 1; 
SELECT T1.Continent FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode GROUP BY T1.Continent ORDER BY COUNT(DISTINCT T2.Language) DESC LIMIT 1
SELECT COUNT(*) FROM countrylanguage WHERE Language = 'English' AND CountryCode IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'Dutch') 
SELECT COUNT(CountryCode) FROM countrylanguage WHERE Language IN ('English', 'Dutch') AND IsOfficial = 'T'; 
SELECT c.Name FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE cl.Language = 'English' INTERSECT SELECT c.Name FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE cl.Language = 'French'; 
SELECT Name FROM country WHERE Code IN (     SELECT CountryCode FROM countrylanguage WHERE Language = 'English' AND IsOfficial = 'T' ) AND Code IN (     SELECT CountryCode FROM countrylanguage WHERE Language = 'French' AND IsOfficial = 'T' ) 
SELECT c.Name FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE cl.Language = 'English' AND EXISTS (     SELECT 1     FROM countrylanguage cl2     WHERE cl2.CountryCode = c.Code AND cl2.Language = 'French' ) ORDER BY c.Name; 
SELECT c.Name FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE cl.Language = 'English' AND cl.IsOfficial = 'T' INTERSECT SELECT c.Name FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE cl.Language = 'French' AND cl.IsOfficial = 'T'; 
SELECT COUNT(DISTINCT T1.Continent) AS NumberOfContinents FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'Chinese'; 
SELECT COUNT(DISTINCT Continent) AS NumberOfContinentsSpeakingChinese FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE Language = 'Chinese'; 
SELECT DISTINCT T1.Region FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language IN ('English', 'Dutch'); 
SELECT DISTINCT T1.Region  FROM country AS T1  JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode  WHERE T2.Language IN ('Dutch', 'English') ORDER BY T1.Region; 
SELECT c.Name FROM country AS c JOIN countrylanguage AS cl ON c.Code = cl.CountryCode WHERE cl.Language IN ('English', 'Dutch') AND cl.IsOfficial = 'T'; 
SELECT T1.Name FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'English' OR T2.Language = 'Dutch' AND T2.IsOfficial = 'T'
SELECT T2.Language FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.Continent = 'Asia' ORDER BY T2.Percentage DESC LIMIT 1
SELECT T2.Language FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.Continent = 'Asia' GROUP BY T2.Language ORDER BY SUM(T2.Percentage) DESC LIMIT 1
SELECT Language FROM countrylanguage WHERE CountryCode IN ( SELECT Code FROM country WHERE GovernmentForm = 'Republic' ) GROUP BY Language HAVING COUNT(*) = 1
SELECT Language FROM countrylanguage WHERE CountryCode IN (SELECT Code FROM country WHERE GovernmentForm = 'Republic' GROUP BY Code HAVING COUNT(*) = 1)
SELECT T1.Name FROM city AS T1 JOIN countrylanguage AS T2 ON T1.CountryCode = T2.CountryCode WHERE T2.Language = 'English' ORDER BY T1.Population DESC LIMIT 1
SELECT T1.Name FROM city AS T1 INNER JOIN countrylanguage AS T2 ON T1.CountryCode = T2.CountryCode WHERE T2.Language = 'English' ORDER BY T1.Population DESC LIMIT 1
SELECT Name, Population, LifeExpectancy FROM country WHERE Continent = 'Asia' ORDER BY SurfaceArea DESC LIMIT 1; 
SELECT Name, Population, LifeExpectancy FROM country WHERE Continent = 'Asia' ORDER BY SurfaceArea DESC LIMIT 1; 
SELECT AVG(T1.LifeExpectancy) FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.IsOfficial = 'F' AND T2.Language != 'English'
SELECT AVG(T1.LifeExpectancy) AS MeanLifeExpectancy FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'English' AND T2.IsOfficial = 'F'; 
SELECT SUM(Population) AS TotalPopulation FROM country WHERE Code NOT IN (     SELECT CountryCode     FROM countrylanguage     WHERE Language = 'English' ); 
SELECT SUM(Population) AS TotalPopulation FROM city WHERE CountryCode NOT IN (     SELECT CountryCode     FROM countrylanguage     WHERE Language = 'English' ); 
SELECT T1.Language FROM countrylanguage AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T2.HeadOfState = 'Beatrix' AND T1.IsOfficial = 'T'
SELECT T1.Language FROM countrylanguage AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T2.HeadOfState = 'Beatrix' AND T1.IsOfficial = 'T'; 
SELECT COUNT(DISTINCT T2.Language) AS TotalUniqueOfficialLanguages FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.IndepYear < 1930 AND T2.IsOfficial = 'T'; 
SELECT COUNT(DISTINCT T2.Language) AS TotalDistinctOfficialLanguages FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.IndependenceYear < 1930 AND T2.IsOfficial = 'T'; 
SELECT Name FROM country WHERE SurfaceArea > (SELECT MAX(SurfaceArea) FROM country WHERE Continent = 'Europe') 
SELECT Name FROM country WHERE SurfaceArea > (SELECT MAX(SurfaceArea) FROM country WHERE Continent = 'Europe') 
SELECT Name FROM country WHERE Continent = 'Africa' AND Population < (SELECT MIN(Population) FROM country WHERE Continent = 'Asia')
SELECT Name FROM country WHERE Continent = 'Africa' AND Population < (SELECT MIN(Population) FROM country WHERE Continent = 'Asia') 
SELECT Name FROM country WHERE Continent = 'Asia' AND Population > (SELECT MAX(Population) FROM country WHERE Continent = 'Africa'); 
SELECT Name FROM country WHERE Continent = 'Asia' AND Population > (SELECT MAX(Population) FROM country WHERE Continent = 'Africa') 
SELECT CountryCode FROM countrylanguage WHERE Language != 'English'; 
SELECT CountryCode FROM countrylanguage WHERE Language != 'English'; 
SELECT CountryCode FROM countrylanguage WHERE Language != 'English'; 
SELECT CountryCode FROM countrylanguage WHERE Language != 'English'; 
SELECT Code FROM country WHERE Code NOT IN ( SELECT CountryCode FROM countrylanguage WHERE Language = 'English' ) AND GovernmentForm != 'Republic'
SELECT Code FROM country WHERE GovernmentForm != 'Republic' AND Code NOT IN ( SELECT CountryCode FROM countrylanguage WHERE Language = 'English' )
SELECT c.Name FROM city c JOIN country co ON c.CountryCode = co.Code WHERE co.Continent = 'Europe' AND cl.Language = 'English' AND cl.IsOfficial = 'F'
SELECT T1.Name FROM city AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T2.Continent = 'Europe' AND T1.Name NOT IN ( SELECT T3.Name FROM city AS T3 INNER JOIN country AS T4 ON T3.CountryCode = T4.Code INNER JOIN countrylanguage AS T5 ON T4.Code = T5.CountryCode WHERE T5.Language = 'English' AND T5.IsOfficial = 'T' )
SELECT DISTINCT T1.Name FROM city AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code INNER JOIN countrylanguage AS T3 ON T2.Code = T3.CountryCode WHERE T2.Continent = 'Asia' AND T3.Language = 'Chinese' AND T3.IsOfficial = 'T'
SELECT DISTINCT c.Name FROM city c JOIN country co ON c.CountryCode = co.Code JOIN countrylanguage cl ON co.Code = cl.CountryCode WHERE co.Continent = 'Asia' AND cl.Language = 'Chinese' AND cl.IsOfficial = 'T'; 
SELECT Name, IndepYear, SurfaceArea FROM country ORDER BY Population ASC LIMIT 1; 
SELECT Name, IndepYear, SurfaceArea FROM country ORDER BY Population ASC LIMIT 1; 
SELECT c.Population, c.Name, co.HeadOfState  FROM country c  ORDER BY c.SurfaceArea DESC  LIMIT 1; 
SELECT Name, Population, HeadOfState FROM country ORDER BY SurfaceArea DESC LIMIT 1; 
SELECT c.Name, COUNT(cl.Language) AS LanguageCount FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode GROUP BY c.Name HAVING LanguageCount >= 3; 
SELECT c.Name, COUNT(cl.Language) AS LanguageCount FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode GROUP BY c.Name HAVING LanguageCount > 2; 
SELECT District, COUNT(*) as CityCount FROM city WHERE Population > (SELECT AVG(Population) FROM city) GROUP BY District; 
SELECT District, COUNT(*) AS CityCount FROM city WHERE Population > (SELECT AVG(Population) FROM city) GROUP BY District; 
SELECT T1.GovernmentForm, SUM(T1.Population) AS TotalPopulation FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode GROUP BY T1.GovernmentForm HAVING AVG(T1.LifeExpectancy) > 72; 
SELECT c.GovernmentForm, SUM(c.Population) AS TotalPopulation FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode GROUP BY c.GovernmentForm HAVING AVG(c.LifeExpectancy) > 72; 
SELECT c.Continent, AVG(c.LifeExpectancy) AS AvgLifeExpectancy, SUM(c.Population) AS TotalPopulation FROM country c GROUP BY c.Continent HAVING AVG(c.LifeExpectancy) < 72; 
SELECT Continent, SUM(Population) AS TotalPopulation, AVG(LifeExpectancy) AS AverageLifeExpectancy FROM country GROUP BY Continent HAVING AVG(LifeExpectancy) < 72; 
SELECT Name, SurfaceArea FROM country ORDER BY SurfaceArea DESC LIMIT 5; 
SELECT Name, SurfaceArea FROM country ORDER BY SurfaceArea DESC LIMIT 5; 
SELECT Name FROM country ORDER BY Population DESC LIMIT 3; 
SELECT Name FROM country ORDER BY Population DESC LIMIT 3; 
SELECT Name FROM country ORDER BY Population ASC LIMIT 3; 
SELECT Name FROM country ORDER BY Population ASC LIMIT 3; 
SELECT COUNT(*) FROM country WHERE Continent = 'Asia'; 
SELECT COUNT(*) FROM country WHERE Continent = 'Asia'; 
SELECT Name FROM country WHERE Continent = 'Europe' AND Population > 80000; 
SELECT Name FROM country WHERE Continent = 'Europe' AND Population = 80000; 
SELECT SUM(Population), AVG(SurfaceArea) FROM country WHERE Continent = 'North America' AND SurfaceArea > 3000; 
SELECT SUM(Population), AVG(SurfaceArea) FROM country WHERE Continent = 'North America' AND SurfaceArea > 3000; 
SELECT Name FROM city WHERE Population BETWEEN 160000 AND 900000; 
SELECT Name FROM city WHERE Population BETWEEN 160000 AND 900000; 
SELECT Language FROM countrylanguage GROUP BY Language ORDER BY COUNT(CountryCode) DESC LIMIT 1; 
SELECT Language FROM countrylanguage GROUP BY Language ORDER BY COUNT(CountryCode) DESC LIMIT 1; 
SELECT T1.Name, T2.Language, T2.Percentage FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode ORDER BY T2.Percentage DESC LIMIT 1;
SELECT T1.Code, T2.Language FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.IsOfficial = 'T' ORDER BY T2.Percentage DESC LIMIT 1
SELECT COUNT(*) FROM countrylanguage WHERE Language = 'Spanish' AND Percentage = ( SELECT MAX(Percentage) FROM countrylanguage WHERE Language = 'Spanish' ); 
SELECT COUNT(CountryCode) FROM countrylanguage WHERE Language = 'Spanish' AND Percentage > 50; 
SELECT CountryCode FROM countrylanguage WHERE Language = 'Spanish' ORDER BY Percentage DESC LIMIT 1
SELECT CountryCode FROM countrylanguage WHERE Language = 'Spanish' AND Percentage = ( SELECT MAX(Percentage) FROM countrylanguage WHERE Language = 'Spanish' ); 
SELECT COUNT(*) FROM conductor; 
SELECT COUNT(*) FROM conductor; 
SELECT Name FROM conductor ORDER BY Age ASC; 
SELECT Name FROM conductor ORDER BY Age;
SELECT Name FROM conductor WHERE Nationality != 'USA'; 
SELECT Name FROM conductor WHERE Nationality != 'USA'; 
SELECT Record_Company FROM orchestra ORDER BY Year_of_Founded DESC
SELECT Record_Company FROM orchestra ORDER BY Year_of_Founded DESC; 
SELECT AVG(Attendance) FROM show; 
SELECT AVG(Attendance) AS Average_Attendance FROM show; 
SELECT MAX(Share), MIN(Share) FROM performance WHERE Type != 'Live final'; 
SELECT MAX(Share), MIN(Share) FROM performance WHERE Type != 'Live final'; 
SELECT COUNT(DISTINCT Nationality) AS NumberOfNationalities FROM conductor; 
SELECT COUNT(DISTINCT Nationality) FROM conductor; 
SELECT Name FROM conductor ORDER BY Year_of_Work DESC; 
SELECT Name FROM conductor ORDER BY Year_of_Work DESC; 
SELECT Name FROM conductor ORDER BY Year_of_Work DESC LIMIT 1; 
SELECT Name FROM conductor ORDER BY Year_of_Work DESC LIMIT 1; 
SELECT conductor.Name, orchestra.Orchestra FROM conductor JOIN orchestra ON conductor.Conductor_ID = orchestra.Conductor_ID; 
SELECT T1.Name ,  T2.Orchestra FROM conductor AS T1 INNER JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID
SELECT c.Name FROM conductor c JOIN orchestra o ON c.Conductor_ID = o.Conductor_ID GROUP BY c.Conductor_ID HAVING COUNT(o.Orchestra) > 1; 
SELECT conductor.Name FROM conductor JOIN orchestra ON conductor.Conductor_ID = orchestra.Conductor_ID GROUP BY conductor.Conductor_ID HAVING COUNT(orchestra.Orchestra) > 1
SELECT T1.Name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID GROUP BY T1.Conductor_ID ORDER BY COUNT(T2.Orchestra_ID) DESC LIMIT 1
SELECT T1.Name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID GROUP BY T1.Conductor_ID ORDER BY COUNT(T2.Orchestra) DESC LIMIT 1
SELECT c.Name FROM conductor c JOIN orchestra o ON c.Conductor_ID = o.Conductor_ID WHERE o.Year_of_Founded > 2008; 
SELECT conductor.Name FROM conductor JOIN orchestra ON conductor.Conductor_ID = orchestra.Conductor_ID WHERE orchestra.Year_of_Founded > 2008;
SELECT Record_Company, COUNT(*) AS Number_of_Orchestras FROM orchestra GROUP BY Record_Company; 
SELECT Record_Company, COUNT(*) AS Number_of_Orchestras FROM orchestra GROUP BY Record_Company; 
SELECT Major_Record_Format FROM orchestra GROUP BY Major_Record_Format ORDER BY COUNT(*) ASC; 
SELECT Major_Record_Format, COUNT(*) as Frequency FROM orchestra GROUP BY Major_Record_Format ORDER BY Frequency DESC; 
SELECT Record_Company FROM orchestra GROUP BY Record_Company ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT Record_Company FROM orchestra GROUP BY Record_Company ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT Orchestra FROM orchestra WHERE Orchestra_ID NOT IN (SELECT Orchestra_ID FROM performance); 
SELECT Orchestra FROM orchestra WHERE Orchestra_ID NOT IN (SELECT Orchestra_ID FROM performance) 
SELECT Record_Company FROM orchestra WHERE Year_of_Founded < 2003 INTERSECT SELECT Record_Company FROM orchestra WHERE Year_of_Founded > 2003; 
SELECT Record_Company FROM orchestra WHERE Year_of_Founded < 2003 INTERSECT SELECT Record_Company FROM orchestra WHERE Year_of_Founded > 2003
SELECT COUNT(*) FROM orchestra WHERE Major_Record_Format IN ('CD', 'DVD'); 
SELECT COUNT(*) FROM orchestra WHERE Major_Record_Format IN ('CD', 'DVD'); 
SELECT orchestra.Year_of_Founded FROM orchestra JOIN performance ON orchestra.Orchestra_ID = performance.Orchestra_ID GROUP BY orchestra.Orchestra_ID HAVING COUNT(performance.Performance_ID) > 1; 
SELECT T2.Year_of_Founded FROM performance AS T1 INNER JOIN orchestra AS T2 ON T1.Orchestra_ID = T2.Orchestra_ID GROUP BY T2.Orchestra_ID HAVING COUNT(T1.Performance_ID) > 1 ORDER BY T2.Year_of_Founded DESC LIMIT 1;
SELECT COUNT(*) FROM Highschooler; 
SELECT COUNT(*) FROM Highschooler; 
SELECT name, grade FROM Highschooler; 
SELECT name, grade FROM Highschooler; 
SELECT DISTINCT grade FROM Highschooler; 
SELECT name, grade FROM Highschooler; 
SELECT grade FROM Highschooler WHERE name = 'Kyle'; 
SELECT grade FROM Highschooler WHERE name = 'Kyle'; 
SELECT name FROM Highschooler WHERE grade = 10; 
SELECT name FROM Highschooler WHERE grade = 10; 
SELECT ID FROM Highschooler WHERE name = 'Kyle'; 
SELECT ID FROM Highschooler WHERE name = 'Kyle'
SELECT COUNT(*) FROM Highschooler WHERE grade IN (9, 10); 
SELECT COUNT(*) FROM Highschooler WHERE grade IN (9, 10); 
SELECT grade, COUNT(*) FROM Highschooler GROUP BY grade; 
SELECT grade, COUNT(*) FROM Highschooler GROUP BY grade; 
SELECT grade FROM Highschooler GROUP BY grade ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT grade FROM Highschooler GROUP BY grade ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT grade FROM Highschooler GROUP BY grade HAVING COUNT(ID) >= 4; 
SELECT grade FROM Highschooler GROUP BY grade HAVING COUNT(*) >= 4
SELECT student_id, COUNT(friend_id) AS number_of_friends FROM Friend GROUP BY student_id; 
SELECT Highschooler.name, COUNT(Friend.friend_id) AS number_of_friends FROM Highschooler JOIN Friend ON Highschooler.ID = Friend.student_id GROUP BY Highschooler.name; 
SELECT H.name, COUNT(F.friend_id) AS num_friends FROM Highschooler H LEFT JOIN Friend F ON H.ID = F.student_id GROUP BY H.ID; 
SELECT H.name, COUNT(F.friend_id) AS friend_count FROM Highschooler H LEFT JOIN Friend F ON H.ID = F.student_id GROUP BY H.name; 
SELECT T1.name FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id GROUP BY T1.ID ORDER BY COUNT(T2.friend_id) DESC LIMIT 1
SELECT H.name  FROM Highschooler H  JOIN Friend F ON H.ID = F.student_id  GROUP BY H.ID  ORDER BY COUNT(F.friend_id) DESC  LIMIT 1; 
SELECT T1.name FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id GROUP BY T1.ID HAVING COUNT(T2.friend_id) >= 3
SELECT h.name FROM Highschooler h JOIN Friend f ON h.ID = f.student_id GROUP BY h.ID HAVING COUNT(f.friend_id) >= 3; 
SELECT T2.name FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.friend_id = T2.ID WHERE T1.student_id IN (SELECT ID FROM Highschooler WHERE name = 'Kyle')
SELECT H.name FROM Highschooler AS H JOIN Friend AS F ON H.ID = F.friend_id WHERE F.student_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle') 
SELECT COUNT(*) AS friend_count FROM Friend WHERE student_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle'); 
SELECT COUNT(*) FROM Friend AS F JOIN Highschooler AS H ON F.student_id = H.ID WHERE H.name = 'Kyle'; 
SELECT ID FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend)
SELECT ID FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend)
SELECT name FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend)
SELECT name FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend)
SELECT DISTINCT student_id FROM Friend INTERSECT SELECT liked_id FROM Likes; 
SELECT student_id FROM Friend INTERSECT SELECT student_id FROM Likes; 
SELECT T1.name FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id INTERSECT SELECT T1.name FROM Highschooler AS T1 JOIN Likes AS T2 ON T1.ID = T2.student_id
SELECT H.name FROM Highschooler H WHERE EXISTS (     SELECT 1     FROM Friend F     WHERE F.student_id = H.ID ) AND EXISTS (     SELECT 1     FROM Likes L     WHERE L.student_id = H.ID ) ORDER BY H.grade DESC; 
SELECT student_id, COUNT(liked_id) AS like_count FROM Likes GROUP BY student_id; 
SELECT student_id, COUNT(liked_id) AS like_count FROM Likes GROUP BY student_id; 
SELECT h.name, COUNT(l.student_id) AS num_likes FROM Highschooler h JOIN Likes l ON h.ID = l.student_id GROUP BY h.ID; 
SELECT H.name, COUNT(L.student_id) AS like_count FROM Highschooler H JOIN Likes L ON H.ID = L.student_id GROUP BY H.name ORDER BY like_count DESC; 
SELECT H.name FROM Highschooler AS H JOIN Likes AS L ON H.ID = L.student_id GROUP BY H.ID ORDER BY COUNT(L.liked_id) DESC LIMIT 1; 
SELECT H.name FROM Highschooler AS H JOIN Likes AS L ON H.ID = L.student_id GROUP BY H.name ORDER BY COUNT(L.liked_id) DESC LIMIT 1; 
SELECT H.name FROM Highschooler AS H JOIN Likes AS L ON H.ID = L.student_id GROUP BY H.ID HAVING COUNT(L.liked_id) >= 2; 
SELECT T1.name FROM Highschooler AS T1 JOIN Likes AS T2 ON T1.ID = T2.student_id GROUP BY T1.ID HAVING COUNT(T2.liked_id) >= 2
SELECT name FROM Highschooler WHERE ID IN (     SELECT student_id FROM Friend GROUP BY student_id HAVING COUNT(friend_id) >= 2 ) AND grade > 5; 
SELECT T1.name FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id WHERE T1.grade > 5 GROUP BY T1.name HAVING COUNT(T2.friend_id) >= 2
SELECT COUNT(*) FROM Likes WHERE student_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle'); 
SELECT COUNT(*) FROM Likes WHERE student_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle'); 
SELECT AVG(grade) AS average_grade FROM Highschooler WHERE ID IN (SELECT student_id FROM Friend) 
SELECT AVG(T1.grade) FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id
SELECT MIN(grade) FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend) 
SELECT MIN(grade) FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend) 
SELECT state  FROM Owners  INTERSECT  SELECT state  FROM Professionals; 
SELECT state FROM Owners INTERSECT SELECT state FROM Professionals; 
SELECT AVG(Dogs.age)  FROM Dogs  JOIN Treatments ON Dogs.dog_id = Treatments.dog_id; 
SELECT AVG(Dogs.age) AS average_age FROM Dogs JOIN Treatments ON Dogs.dog_id = Treatments.dog_id; 
SELECT DISTINCT p.professional_id, p.last_name, p.cell_number FROM Professionals p JOIN Treatments t ON p.professional_id = t.professional_id WHERE p.state = 'Indiana' OR (     SELECT COUNT(*) FROM Treatments WHERE professional_id = p.professional_id ) > 2; 
SELECT P.professional_id, P.last_name, P.cell_number FROM Professionals AS P WHERE P.state = 'Indiana' UNION SELECT P.professional_id, P.last_name, P.cell_number FROM Professionals AS P JOIN Treatments AS T ON P.professional_id = T.professional_id GROUP BY P.professional_id HAVING COUNT(T.treatment_id) > 2; 
SELECT D.name FROM Dogs AS D JOIN Treatments AS T ON D.dog_id = T.dog_id GROUP BY D.dog_id HAVING SUM(T.cost_of_treatment) <= 1000
SELECT d.name FROM Dogs d JOIN Treatments t ON d.dog_id = t.dog_id GROUP BY d.dog_id HAVING SUM(t.cost_of_treatment) <= 1000
SELECT DISTINCT first_name FROM Owners WHERE first_name NOT IN (SELECT name FROM Dogs) UNION SELECT DISTINCT first_name FROM Professionals WHERE first_name NOT IN (SELECT name FROM Dogs); 
SELECT DISTINCT first_name  FROM Owners  WHERE first_name NOT IN (     SELECT DISTINCT name      FROM Dogs ) UNION SELECT DISTINCT first_name  FROM Professionals  WHERE first_name NOT IN (     SELECT DISTINCT name      FROM Dogs ); 
SELECT professional_id, role_code, email_address FROM Professionals WHERE professional_id NOT IN (     SELECT professional_id     FROM Treatments ) ORDER BY professional_id; 
SELECT professional_id, role_code, email_address  FROM Professionals  WHERE professional_id NOT IN (SELECT professional_id FROM Treatments); 
SELECT o.owner_id, o.first_name, o.last_name, COUNT(d.dog_id) AS dog_count FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id GROUP BY o.owner_id, o.first_name, o.last_name ORDER BY dog_count DESC LIMIT 1; 
SELECT o.owner_id, o.first_name, o.last_name, COUNT(d.dog_id) AS dog_count FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id GROUP BY o.owner_id, o.first_name, o.last_name ORDER BY dog_count DESC LIMIT 1; 
SELECT p.professional_id, p.role_code, p.first_name FROM Professionals p JOIN Treatments t ON p.professional_id = t.professional_id GROUP BY p.professional_id, p.role_code, p.first_name HAVING COUNT(t.treatment_id) >= 2; 
SELECT p.professional_id, p.role_code, p.first_name FROM Professionals p JOIN Treatments t ON p.professional_id = t.professional_id GROUP BY p.professional_id, p.role_code, p.first_name HAVING COUNT(t.treatment_id) >= 2; 
SELECT breed_name FROM Breeds WHERE breed_code = (SELECT breed_code FROM Dogs GROUP BY breed_code ORDER BY COUNT(*) DESC LIMIT 1)
SELECT b.breed_name FROM Breeds b JOIN Dogs d ON b.breed_code = d.breed_code GROUP BY b.breed_name ORDER BY COUNT(d.dog_id) DESC LIMIT 1; 
SELECT o.owner_id, o.last_name, COUNT(t.treatment_id) AS treatment_count FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id JOIN Treatments t ON d.dog_id = t.dog_id GROUP BY o.owner_id, o.last_name ORDER BY treatment_count DESC LIMIT 1; 
SELECT o.owner_id, o.last_name FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id JOIN Treatments t ON d.dog_id = t.dog_id GROUP BY o.owner_id, o.last_name ORDER BY SUM(t.cost_of_treatment) DESC LIMIT 1; 
SELECT T1.treatment_type_description FROM Treatment_Types AS T1 INNER JOIN Treatments AS T2 ON T1.treatment_type_code = T2.treatment_type_code GROUP BY T1.treatment_type_description ORDER BY SUM(T2.cost_of_treatment) ASC LIMIT 1
SELECT t.treatment_type_description FROM Treatment_Types t JOIN Treatments tr ON t.treatment_type_code = tr.treatment_type_code GROUP BY t.treatment_type_description ORDER BY SUM(tr.cost_of_treatment) ASC LIMIT 1
SELECT o.owner_id, o.zip_code, SUM(c.charge_amount) AS total_paid FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id JOIN Charges c ON d.dog_id = c.dog_id GROUP BY o.owner_id, o.zip_code ORDER BY total_paid DESC LIMIT 1; 
SELECT o.owner_id, o.zip_code, SUM(c.charge_amount) AS total_spent FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id JOIN Charges c ON d.dog_id = c.charge_id GROUP BY o.owner_id, o.zip_code ORDER BY total_spent DESC LIMIT 1; 
SELECT p.professional_id, p.cell_number FROM Professionals p JOIN Treatments t ON p.professional_id = t.professional_id GROUP BY p.professional_id HAVING COUNT(DISTINCT t.treatment_type_code) >= 2; 
SELECT professional_id, cell_number FROM Treatments GROUP BY professional_id HAVING COUNT(DISTINCT treatment_type_code) >= 2; 
SELECT P.first_name, P.last_name FROM Professionals AS P JOIN Treatments AS T ON P.professional_id = T.professional_id WHERE T.cost_of_treatment < ( SELECT AVG(cost_of_treatment) FROM Treatments )
SELECT p.first_name, p.last_name FROM Professionals p JOIN Treatments t ON p.professional_id = t.professional_id WHERE t.cost_of_treatment < (     SELECT AVG(cost_of_treatment)     FROM Treatments ); 
SELECT T1.date_of_treatment, T2.first_name  FROM Treatments AS T1  JOIN Professionals AS T2 ON T1.professional_id = T2.professional_id; 
SELECT T1.date_of_treatment, P.first_name  FROM Treatments AS T1  JOIN Professionals AS P ON T1.professional_id = P.professional_id; 
SELECT T1.cost_of_treatment, T3.treatment_type_description FROM Treatments AS T1 INNER JOIN Treatment_Types AS T3 ON T1.treatment_type_code = T3.treatment_type_code ORDER BY T1.cost_of_treatment DESC; 
SELECT T1.cost_of_treatment, T3.treatment_type_description FROM Treatments AS T1 INNER JOIN Treatment_Types AS T3 ON T1.treatment_type_code = T3.treatment_type_code; 
SELECT o.first_name, o.last_name, s.size_description FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id JOIN Sizes s ON d.size_code = s.size_code; 
SELECT o.first_name, o.last_name, s.size_description FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id JOIN Sizes s ON d.size_code = s.size_code; 
SELECT O.first_name, D.name FROM Owners AS O JOIN Dogs AS D ON O.owner_id = D.owner_id; 
SELECT O.first_name, D.name FROM Owners AS O JOIN Dogs AS D ON O.owner_id = D.owner_id; 
SELECT d.name, t.date_of_treatment FROM Dogs d JOIN Breeds b ON d.breed_code = b.breed_code JOIN Treatments t ON d.dog_id = t.dog_id WHERE b.breed_name = (     SELECT breed_name     FROM Breeds     GROUP BY breed_name     ORDER BY COUNT(*) ASC     LIMIT 1 ) ORDER BY t.date_of_treatment DESC; 
SELECT d.name, t.date_of_treatment FROM Dogs d JOIN Treatments t ON d.dog_id = t.dog_id GROUP BY d.breed_code ORDER BY COUNT(*) ASC LIMIT 1;
SELECT o.first_name, d.name  FROM Owners o  JOIN Dogs d ON o.owner_id = d.owner_id  WHERE o.state = 'Virginia'; 
SELECT O.first_name, D.name  FROM Owners O  JOIN Dogs D ON O.owner_id = D.owner_id  WHERE O.state = 'Virginia'; 
SELECT D.date_arrived, D.date_departed  FROM Dogs AS D  JOIN Treatments AS T ON D.dog_id = T.dog_id; 
SELECT D.date_arrived, D.date_departed FROM Dogs D JOIN Treatments T ON D.dog_id = T.dog_id; 
SELECT o.last_name FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id ORDER BY d.age ASC LIMIT 1
SELECT o.last_name FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id ORDER BY d.date_of_birth DESC LIMIT 1; 
SELECT email_address FROM Professionals WHERE state = 'Hawaii' OR state = 'Wisconsin'; 
SELECT email_address FROM Professionals WHERE state = 'Hawaii' OR state = 'Wisconsin'; 
SELECT date_arrived, date_departed FROM Dogs; 
SELECT date_arrived, date_departed FROM Dogs; 
SELECT COUNT(DISTINCT dog_id) AS number_of_dogs_with_treatments FROM Treatments; 
SELECT COUNT(*) FROM Treatments; 
SELECT COUNT(DISTINCT professional_id) FROM Treatments; 
SELECT COUNT(DISTINCT professional_id) AS number_of_professionals FROM Treatments; 
SELECT role_code, street, city, state FROM Professionals WHERE city LIKE '%West%'; 
SELECT role_code, street, city, state FROM Professionals WHERE city LIKE '%West%'; 
SELECT first_name, last_name, email_address FROM Owners WHERE state LIKE '%North%' 
SELECT first_name, last_name, email_address FROM Owners WHERE state LIKE '%North%'; 
SELECT COUNT(*) FROM Dogs WHERE age < (SELECT AVG(age) FROM Dogs); 
SELECT COUNT(*) FROM Dogs WHERE age < (SELECT AVG(age) FROM Dogs); 
SELECT MAX(cost_of_treatment) AS most_recent_treatment_cost FROM Treatments ORDER BY date_of_treatment DESC LIMIT 1; 
SELECT cost_of_treatment FROM Treatments ORDER BY date_of_treatment DESC LIMIT 1; 
SELECT COUNT(*) FROM Dogs WHERE dog_id NOT IN (SELECT dog_id FROM Treatments); 
SELECT COUNT(*) FROM Dogs WHERE dog_id NOT IN (SELECT dog_id FROM Treatments); 
SELECT COUNT(owner_id) FROM Owners WHERE owner_id NOT IN ( SELECT owner_id FROM Dogs )
SELECT COUNT(owner_id) FROM Owners WHERE owner_id NOT IN (     SELECT owner_id     FROM Dogs     WHERE date_departed IS NULL ); 
SELECT COUNT(professional_id) FROM Professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments); 
SELECT COUNT(professional_id) FROM Professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments);
SELECT name, age, weight FROM Dogs WHERE abandoned_yn = '1'; 
SELECT name, age, weight FROM Dogs WHERE abandoned_yn = '1'; 
SELECT AVG(age) AS average_age FROM Dogs; 
SELECT AVG(age) AS average_age FROM Dogs; 
SELECT MAX(age) AS oldest_dog_age FROM Dogs; 
SELECT MAX(age) AS oldest_age FROM Dogs; 
SELECT charge_type, charge_amount FROM Charges; 
SELECT charge_type, charge_amount FROM Charges; 
SELECT MAX(charge_amount) AS max_charge_amount FROM Charges; 
SELECT MAX(charge_amount) AS max_charge_amount FROM Charges; 
SELECT email_address, cell_number, home_phone FROM Professionals; 
SELECT email_address, cell_number, home_phone FROM Professionals; 
SELECT DISTINCT breed_name, size_description FROM Breeds INNER JOIN Dogs ON Breeds.breed_code = Dogs.breed_code INNER JOIN Sizes ON Dogs.size_code = Sizes.size_code; 
SELECT DISTINCT breed_name, size_description  FROM Breeds b  JOIN Dogs d ON b.breed_code = d.breed_code  JOIN Sizes s ON d.size_code = s.size_code; 
SELECT P.first_name, TT.treatment_type_description FROM Professionals AS P JOIN Treatments AS T ON P.professional_id = T.professional_id JOIN Treatment_Types AS TT ON T.treatment_type_code = TT.treatment_type_code; 
SELECT P.first_name, TT.treatment_type_description FROM Professionals AS P JOIN Treatments AS T ON P.professional_id = T.professional_id JOIN Treatment_Types AS TT ON T.treatment_type_code = TT.treatment_type_code; 
SELECT COUNT(*) FROM singer; 
SELECT COUNT(*) FROM singer; 
SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC; 
SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC
SELECT Birth_Year, Citizenship FROM singer; 
SELECT Birth_Year, Citizenship FROM singer; 
SELECT Name FROM singer WHERE Citizenship != 'France'; 
SELECT Name FROM singer WHERE Citizenship != 'France'; 
SELECT Name FROM singer WHERE Birth_Year IN (1948, 1949) 
SELECT Name FROM singer WHERE Birth_Year IN (1948, 1949); 
SELECT Name FROM singer ORDER BY Net_Worth_Millions DESC LIMIT 1; 
SELECT Name FROM singer ORDER BY Net_Worth_Millions DESC LIMIT 1; 
SELECT Citizenship, COUNT(*) FROM singer GROUP BY Citizenship; 
SELECT Citizenship, COUNT(*) FROM singer GROUP BY Citizenship; 
SELECT Citizenship FROM singer GROUP BY Citizenship ORDER BY COUNT(*) DESC LIMIT 1
SELECT Citizenship FROM singer GROUP BY Citizenship ORDER BY COUNT(*) DESC LIMIT 1
SELECT Citizenship, MAX(Net_Worth_Millions) AS Max_Net_Worth FROM singer GROUP BY Citizenship; 
SELECT Citizenship, MAX(Net_Worth_Millions) AS Max_Net_Worth FROM singer GROUP BY Citizenship; 
SELECT T2.Title, T1.Name FROM singer AS T1 INNER JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID
SELECT s.Title, si.Name FROM song AS s JOIN singer AS si ON s.Singer_ID = si.Singer_ID; 
SELECT DISTINCT s.Name FROM singer s JOIN song o ON s.Singer_ID = o.Singer_ID WHERE o.Sales > 300000; 
SELECT DISTINCT T1.Name FROM singer AS T1 INNER JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID WHERE T2.Sales > 300000
SELECT T1.Name FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID GROUP BY T1.Singer_ID HAVING COUNT(T2.Song_ID) > 1 ORDER BY T1.Net_Worth_Millions DESC LIMIT 1;
SELECT s.Name FROM singer s JOIN song so ON s.Singer_ID = so.Singer_ID GROUP BY s.Singer_ID HAVING COUNT(so.Song_ID) > 1; 
SELECT s.Name, SUM(so.Sales) AS Total_Sales FROM singer s JOIN song so ON s.Singer_ID = so.Singer_ID GROUP BY s.Name; 
SELECT s.Name, SUM(so.Sales) AS Total_Sales FROM singer s JOIN song so ON s.Singer_ID = so.Singer_ID GROUP BY s.Name; 
SELECT Name FROM singer WHERE Singer_ID NOT IN (SELECT Singer_ID FROM song); 
SELECT Name FROM singer WHERE Singer_ID NOT IN (SELECT Singer_ID FROM song) 
SELECT Citizenship  FROM singer  WHERE Birth_Year < 1945 AND Citizenship IN (     SELECT Citizenship      FROM singer      WHERE Birth_Year > 1955 ) ORDER BY Citizenship; 
SELECT Citizenship FROM singer WHERE Birth_Year < 1945 INTERSECT SELECT Citizenship FROM singer WHERE Birth_Year > 1955; 
SELECT COUNT(feature_id) AS total_features FROM Other_Available_Features; 
SELECT feature_type_name FROM Ref_Feature_Types WHERE feature_type_code = 'Amenity' AND feature_name = 'AirCon';
SELECT property_type_description FROM Ref_Property_Types WHERE property_type_code = 'YourPropertyTypeCode'; 
SELECT property_name FROM Properties WHERE property_type_code IN ('House', 'Apartment') AND room_count > 1; 
