SELECT COUNT(*) FROM singer
SELECT COUNT(*) FROM singer 
SELECT Name, Country, Age FROM singer ORDER BY Age DESC
SELECT Name, Country, Age FROM singer ORDER BY Age DESC
SELECT AVG(Age), MIN(Age), MAX(Age) FROM singer WHERE Country = 'France'
SELECT AVG(Age), MIN(Age), MAX(Age) FROM singer WHERE Country = 'France'
SELECT Song_Name, Song_release_year FROM singer ORDER BY Age ASC LIMIT 1
SELECT Song_Name, Song_release_year FROM singer WHERE Age = (SELECT MIN(Age) FROM singer) 
SELECT DISTINCT Country FROM singer WHERE Age > 20
SELECT DISTINCT Country FROM singer WHERE Age > 20 
SELECT Country ,  COUNT(*) FROM singer GROUP BY Country 
SELECT Country, COUNT(*) FROM singer GROUP BY Country
SELECT Song_Name FROM singer WHERE Age > (SELECT AVG(Age) FROM singer); 
SELECT Song_Name FROM singer WHERE Age > ( SELECT AVG(Age) FROM singer )
SELECT Location, Name FROM stadium WHERE Capacity BETWEEN 5000 AND 10000
SELECT Location, Name FROM stadium WHERE Capacity BETWEEN 5000 AND 10000
SELECT MAX(Capacity) AS Max_Capacity, AVG(Capacity) AS Average_Capacity FROM stadium
SELECT AVG(Capacity), MAX(Capacity) FROM stadium 
SELECT Name, Capacity FROM stadium ORDER BY Average DESC LIMIT 1
SELECT Name, Capacity FROM stadium ORDER BY Average DESC LIMIT 1
SELECT COUNT(*) FROM concert WHERE Year IN ('2014', '2015')
SELECT COUNT(*) FROM concert WHERE Year IN ('2014', '2015')
SELECT T2.Name, COUNT(*) FROM concert AS T1 INNER JOIN stadium AS T2 ON T1.Stadium_ID = T2.Stadium_ID GROUP BY T2.Stadium_ID 
SELECT T2.Stadium_ID, COUNT(*) FROM concert AS T1 INNER JOIN stadium AS T2 ON T1.Stadium_ID = T2.Stadium_ID GROUP BY T2.Stadium_ID
SELECT T1.Name, T1.Capacity FROM stadium AS T1 INNER JOIN concert AS T2 ON T1.Stadium_ID = T2.Stadium_ID INNER JOIN singer_in_concert AS T3 ON T2.concert_ID = T3.concert_ID WHERE T2.Year >= '2014' GROUP BY T1.Stadium_ID ORDER BY COUNT(T2.concert_ID) DESC LIMIT 1
SELECT T2.Name, T2.Capacity FROM concert AS T1 INNER JOIN stadium AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T1.Year > 2013 GROUP BY T2.Stadium_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT Year FROM concert GROUP BY Year ORDER BY COUNT(*) DESC LIMIT 1 
SELECT Year FROM concert GROUP BY Year ORDER BY COUNT(*) DESC LIMIT 1
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert)
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert)
SELECT Country FROM singer WHERE Age > 40 INTERSECT SELECT Country FROM singer WHERE Age < 30
  SELECT Stadium_ID FROM concert WHERE Year = '2014'   
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert WHERE Year = '2014')
SELECT c.concert_name, c.theme, COUNT(*) AS singer_count FROM concert c JOIN singer_in_concert sic ON c.concert_id = sic.concert_id GROUP BY c.concert_id; 
SELECT T1.concert_Name, T1.Theme, COUNT(*) AS Number_of_Singers FROM concert AS T1 INNER JOIN singer_in_concert AS T2 ON T1.concert_ID = T2.concert_ID GROUP BY T1.concert_ID; 
SELECT T1.Name, COUNT(T3.concert_ID) AS Number_of_Concerts FROM singer AS T1 INNER JOIN singer_in_concert AS T2 ON T1.Singer_ID = T2.Singer_ID INNER JOIN concert AS T3 ON T2.concert_ID = T3.concert_ID GROUP BY T1.Name
SELECT T3.Name, COUNT(T1.concert_ID) AS Number_of_Concerts FROM singer_in_concert AS T1 INNER JOIN concert AS T2 ON T1.concert_ID = T2.concert_ID INNER JOIN singer AS T3 ON T1.Singer_ID = T3.Singer_ID GROUP BY T3.Name
   SELECT s.Name    FROM singer AS s    JOIN singer_in_concert AS sic ON s.Singer_ID = sic.Singer_ID    JOIN concert AS c ON sic.concert_ID = c.concert_ID    WHERE c.Year = '2014';    
SELECT T1.Name FROM singer AS T1 JOIN singer_in_concert AS T2 ON T1.Singer_ID = T2.Singer_ID JOIN concert AS T3 ON T2.concert_ID = T3.concert_ID WHERE T3.Year = '2014'
SELECT Name, Country FROM singer WHERE Song_Name LIKE '%Hey%' 
SELECT Name, Country FROM singer WHERE Song_Name LIKE '%Hey%'
SELECT T1.Name, T1.Location FROM stadium AS T1 INNER JOIN concert AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T2.Year = '2014'  INTERSECT  SELECT T1.Name, T1.Location FROM stadium AS T1 INNER JOIN concert AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T2.Year = '2015' 
SELECT T2.Name, T2.Location FROM concert AS T1 INNER JOIN stadium AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T1.Year = '2014' INTERSECT SELECT T2.Name, T2.Location FROM concert AS T1 INNER JOIN stadium AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T1.Year = '2015'
SELECT COUNT(*) FROM concert AS T1 INNER JOIN stadium AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T2.Capacity = ( SELECT MAX(Capacity) FROM stadium )
SELECT COUNT(*) AS NumberOfConcerts FROM concert c JOIN stadium s ON c.Stadium_ID = s.Stadium_ID WHERE s.Capacity = (SELECT MAX(Capacity) FROM stadium); 
SELECT COUNT(*) FROM Pets WHERE weight > 10
SELECT COUNT(*) FROM Pets WHERE weight > 10
SELECT weight FROM Pets WHERE PetType = 'dog' ORDER BY pet_age ASC LIMIT 1
SELECT weight FROM Pets WHERE PetType = 'dog' ORDER BY pet_age ASC LIMIT 1
SELECT PetType, MAX(weight) AS max_weight FROM Pets GROUP BY PetType
SELECT PetType, MAX(Weight) AS MaxWeight FROM Pets GROUP BY PetType; 
SELECT COUNT(T2.PetID) FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID WHERE T1.Age > 20
SELECT COUNT(DISTINCT p.PetID) FROM Has_Pet AS hp JOIN Student AS s ON hp.StuID = s.StuID JOIN Pets AS p ON hp.PetID = p.PetID WHERE s.Age > 20
SELECT COUNT(DISTINCT T2.PetID) FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID INNER JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T1.Sex = 'F' AND T3.PetType = 'dog'
SELECT COUNT(*) FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID INNER JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T1.Sex = 'F' AND T3.PetType = 'dog'
SELECT COUNT(DISTINCT PetType) AS NumberOfDistinctPetTypes FROM Pets
SELECT COUNT(DISTINCT PetType) FROM Pets
SELECT DISTINCT T1.Fname FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID INNER JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType IN ('cat', 'dog')
SELECT DISTINCT T1.Fname FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType IN ('cat', 'dog')
SELECT s.Fname FROM Student s JOIN Has_Pet hp ON s.StuID = hp.StuID WHERE hp.PetID IN (SELECT PetID FROM Pets WHERE PetType = 'cat') INTERSECT SELECT s.Fname FROM Student s JOIN Has_Pet hp ON s.StuID = hp.StuID WHERE hp.PetID IN (SELECT PetID FROM Pets WHERE PetType = 'dog')
  SELECT T1.Fname   FROM Student AS T1   JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID   JOIN Pets AS T3 ON T2.PetID = T3.PetID   WHERE T3.PetType = 'cat'   
SELECT S.StuID FROM Student S JOIN Has_Pet HP ON S.StuID = HP.StuID JOIN Pets P ON HP.PetID = P.PetID WHERE P.PetType = 'cat' 
SELECT Major, Age FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet INNER JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE PetType = 'cat')
SELECT StuID FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet INNER JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE PetType = 'cat')
SELECT StuID FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE PetType = 'cat')
SELECT DISTINCT T1.Fname, T1.Age FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'dog' AND T1.StuID NOT IN (SELECT StuID FROM Has_Pet JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Pets.PetType = 'cat')
SELECT T1.Fname FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'dog' EXCEPT SELECT T1.Fname FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'cat'
SELECT PetType, weight FROM Pets ORDER BY weight ASC LIMIT 1
SELECT PetType, weight FROM Pets ORDER BY pet_age ASC LIMIT 1
SELECT PetID, weight FROM Pets WHERE pet_age > 1
SELECT PetID, weight FROM Pets WHERE pet_age > 1
SELECT Pets.PetType, AVG(Pets.pet_age) AS avg_age, MAX(Pets.pet_age) AS max_age FROM Pets INNER JOIN Has_Pet ON Pets.PetID = Has_Pet.PetID GROUP BY Pets.PetType
SELECT PetType ,  AVG(pet_age) ,  MAX(pet_age) FROM Pets GROUP BY PetType
SELECT PetType, AVG(weight) AS AverageWeight FROM Pets GROUP BY PetType; 
SELECT PetType, AVG(weight) AS AverageWeight FROM Pets GROUP BY PetType
SELECT T1.Fname, T1.Age FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID
SELECT DISTINCT T1.Fname, T1.Age FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID
SELECT T2.PetID FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID INNER JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T1.LName = 'Smith'
SELECT T2.PetID FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID WHERE T1.LName = 'Smith'
SELECT T1.StuID, COUNT(T2.PetID) AS Number_of_Pets FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID GROUP BY T1.StuID
SELECT StuID, COUNT(PetID) AS NumberOfPets FROM Has_Pet GROUP BY StuID
SELECT T1.Fname, T1.Sex FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID GROUP BY T1.StuID HAVING COUNT(T2.PetID) > 1
SELECT T1.Fname, T1.Sex FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID GROUP BY T1.StuID HAVING COUNT(T2.PetID) > 1
SELECT T1.LName FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'cat' AND T3.pet_age = 3
SELECT T1.LName FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID INNER JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'cat' AND T3.pet_age = 3
SELECT AVG(Age) FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet)
  SELECT StuID FROM Has_Pet   
SELECT COUNT(*) FROM continents; 
SELECT COUNT(*) FROM continents
SELECT T1.ContId, T1.Continent, COUNT(T2.CountryId) AS NumberOfCountries FROM continents AS T1 INNER JOIN countries AS T2 ON T1.ContId = T2.Continent GROUP BY T1.ContId
SELECT T1.ContId, T1.Continent, COUNT(T2.CountryName) AS CountryCount FROM continents AS T1 INNER JOIN countries AS T2 ON T1.ContId = T2.Continent GROUP BY T1.ContId
SELECT COUNT(CountryId) FROM countries
SELECT COUNT(CountryId) AS NumberOfCountries FROM countries
SELECT T1.FullName, T1.Id, COUNT(T2.Model) AS NumberOfModels FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.Id; 
SELECT T1.id, T1.maker, T1.fullname, COUNT(*) AS num_models FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.id = T2.Maker GROUP BY T1.id 
SELECT T1.Model FROM car_names AS T1 INNER JOIN model_list AS T2 ON T1.Model = T2.Model INNER JOIN cars_data AS T3 ON T1.MakeId = T3.Id ORDER BY T3.Horsepower ASC LIMIT 1
SELECT T1.Model FROM model_list AS T1 INNER JOIN cars_data AS T2 ON T1.ModelId = T2.Id ORDER BY T2.Horsepower ASC LIMIT 1
SELECT T.Model FROM car_names AS T JOIN cars_data AS C ON T.MakeId = C.Id WHERE C.Weight < ( SELECT AVG(Weight) FROM cars_data )
  SELECT AVG(Weight) AS avg_weight FROM cars_data;   
SELECT DISTINCT T3.Maker FROM cars_data AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId JOIN car_makers AS T3 ON T2.Make = T3.Id WHERE T1.Year = 1970; 
SELECT DISTINCT T4.Maker FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.MakeId = T2.MakeId INNER JOIN model_list AS T3 ON T2.Model = T3.Model INNER JOIN car_makers AS T4 ON T3.Maker = T4.Id WHERE T1.Year = 1970
SELECT T2.Make, T1.Year FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.Id = T2.MakeId ORDER BY T1.Year ASC LIMIT 1
SELECT T1.Make, T3.Year FROM car_names AS T1 INNER JOIN model_list AS T2 ON T1.Model = T2.Model INNER JOIN cars_data AS T3 ON T1.MakeId = T3.Id ORDER BY T3.Year ASC LIMIT 1
SELECT DISTINCT T1.Model FROM car_names AS T1 INNER JOIN cars_data AS T2 ON T1.MakeId = T2.Id WHERE T2.Year > 1980; 
SELECT T1.Model FROM car_names AS T1 INNER JOIN cars_data AS T2 ON T1.MakeId = T2.Id WHERE T2.Year > 1980
SELECT c.Continent, COUNT(*) AS NumberOfCarMakers FROM car_makers cm JOIN countries co ON cm.Country = co.CountryId JOIN continents c ON co.Continent = c.ContId GROUP BY c.Continent; 
SELECT T1.Continent, COUNT(T2.Id) AS NumberOfCarMakers FROM continents AS T1 INNER JOIN car_makers AS T2 ON T1.ContId = T2.Country GROUP BY T1.Continent
SELECT T1.CountryName FROM countries AS T1 INNER JOIN car_makers AS T2 ON T1.ContId = T2.Country GROUP BY T1.CountryName ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT T2.CountryName FROM car_makers AS T1 INNER JOIN countries AS T2 ON T1.Country = T2.CountryId GROUP BY T2.CountryName ORDER BY COUNT(T1.Maker) DESC LIMIT 1
SELECT T2.FullName, COUNT(T1.Model) AS ModelCount FROM model_list AS T1 INNER JOIN car_makers AS T2 ON T1.Maker = T2.Id GROUP BY T2.FullName
SELECT T1.Maker ,  T1.Id ,  T1.FullName ,  COUNT(T2.Model) FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.Maker
SELECT T2.Accelerate FROM model_list AS T1 INNER JOIN cars_data AS T2 ON T1.ModelId = T2.Id WHERE T1.Model = 'hornet sportabout (sw)'
SELECT T3.Accelerate FROM car_names AS T1 INNER JOIN model_list AS T2 ON T1.Model = T2.Model INNER JOIN cars_data AS T3 ON T1.MakeId = T3.Id WHERE T1.Model = 'amc hornet sportabout'
  SELECT COUNT(T1.Id)   
SELECT COUNT(T1.Maker) FROM car_makers AS T1 INNER JOIN countries AS T2 ON T1.Country = T2.CountryId WHERE T2.CountryName = 'france'
SELECT COUNT(T3.Model) FROM car_makers AS T1 INNER JOIN countries AS T2 ON T1.Country = T2.CountryId INNER JOIN model_list AS T3 ON T1.Id = T3.Maker WHERE T2.CountryName = 'usa' 
SELECT COUNT(DISTINCT T2.Model) FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker WHERE T1.Country = '1'
SELECT AVG(MPG) FROM cars_data WHERE Cylinders = 4
SELECT AVG(MPG) FROM cars_data WHERE Cylinders = 4
SELECT MIN(T1.Weight) AS MinWeight FROM cars_data AS T1 WHERE T1.Year = 1974 AND T1.Cylinders = 8; 
SELECT MIN(T1.Weight) FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.MakeId = T2.MakeId INNER JOIN model_list AS T3 ON T2.Model = T3.Model WHERE T1.Cylinders = 8 AND T1.Year = 1974
SELECT T1.Maker, T2.Model FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker 
SELECT T1.Maker, T2.Model FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker
SELECT DISTINCT T.Country, T.Continent FROM ( SELECT T1.CountryName AS Country, T2.Continent FROM countries AS T1 INNER JOIN car_makers AS T2 ON T1.CountryId = T2.Country ) AS T
SELECT T1.CountryName, T1.CountryId FROM countries AS T1 INNER JOIN car_makers AS T2 ON T1.Continent = T2.Country GROUP BY T1.CountryId
SELECT COUNT(Id) FROM cars_data WHERE Horsepower > 150
SELECT COUNT(Id) FROM cars_data WHERE Horsepower > 150
SELECT Year, AVG(Weight) FROM cars_data GROUP BY Year 
SELECT AVG(Weight), Year FROM cars_data GROUP BY Year
SELECT ... FROM continents AS T1 INNER JOIN countries AS T2 ON T1.ContId = T2.Continent INNER JOIN car_makers AS T3 ON T2.CountryId = T3.Country 
SELECT T1.CountryName  FROM countries AS T1  INNER JOIN car_makers AS T2 ON T1.CountryId = T2.Country  WHERE T1.Continent IN (     SELECT ContId      FROM continents      WHERE Continent = 'europe' )  GROUP BY T1.CountryName  HAVING COUNT(T2.Maker) >= 3; 
SELECT MAX(T1.Horsepower), T2.Make FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.Id = T2.MakeId WHERE T1.Cylinders = 3
SELECT ... FROM car_names AS T1 INNER JOIN model_list AS T2 ON T1.Model = T2.Model INNER JOIN cars_data AS T3 ON T1.MakeId = T3.Id 
SELECT T1.Model FROM car_names AS T1 INNER JOIN cars_data AS T2 ON T1.MakeId = T2.Id ORDER BY T2.MPG DESC LIMIT 1
SELECT T2.Model FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.MakeId = T2.MakeId WHERE T1.MPG = ( SELECT MAX(MPG) FROM cars_data )
SELECT AVG(Horsepower) FROM cars_data WHERE Year < 1980
SELECT AVG(Horsepower) FROM cars_data WHERE Year < 1980
SELECT AVG(T1.Edispl) FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.MakeId = T2.MakeId INNER JOIN model_list AS T3 ON T2.Model = T3.Model WHERE T2.Model = 'volvo' 
SELECT AVG(T3.Edispl) FROM car_names AS T1 INNER JOIN model_list AS T2 ON T1.Model = T2.Model INNER JOIN cars_data AS T3 ON T1.MakeId = T3.Id WHERE T1.Make = 'volvo' 
SELECT Cylinders, MAX(Accelerate) FROM cars_data GROUP BY Cylinders
SELECT MAX(Accelerate), Cylinders FROM cars_data GROUP BY Cylinders
SELECT T1.Model, COUNT(T2.MakeId) AS VersionCount FROM model_list AS T1 JOIN car_names AS T2 ON T1.Model = T2.Model GROUP BY T1.Model ORDER BY VersionCount DESC LIMIT 1; 
SELECT Model, COUNT(DISTINCT Make) AS VersionCount FROM car_names GROUP BY Model ORDER BY VersionCount DESC LIMIT 1; 
SELECT COUNT(Id) FROM cars_data WHERE Cylinders > 4 
SELECT COUNT(Id) FROM cars_data WHERE Cylinders > 4
SELECT COUNT(Id) FROM cars_data WHERE Year = 1980
SELECT COUNT(*) FROM cars_data WHERE Year = 1980 
SELECT COUNT(*) FROM model_list AS T1 INNER JOIN car_makers AS T2 ON T1.Maker = T2.Id WHERE T2.FullName = 'American Motor Company'
SELECT COUNT(*)  FROM model_list AS T1  INNER JOIN car_makers AS T2 ON T1.Maker = T2.Id  WHERE T2.Maker = 'amc'; 
SELECT T1.FullName, T1.Id FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.Id HAVING COUNT(T2.Model) > 3; 
SELECT Maker, Maker FROM model_list GROUP BY Maker HAVING COUNT(*) > 3; 
SELECT DISTINCT T3.Model FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker JOIN car_names AS T3 ON T2.Model = T3.Model WHERE T1.FullName = 'General Motors' OR T3.Weight > 3500; 
SELECT DISTINCT T3.Model FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker INNER JOIN cars_data AS T3 ON T2.ModelId = T3.MakeId WHERE T1.Maker = 'general motors' OR T3.Weight > 3500; 
SELECT DISTINCT Year FROM cars_data WHERE Weight BETWEEN 3000 AND 4000
SELECT DISTINCT Year FROM cars_data WHERE Weight < 4000 OR Weight > 3000
SELECT Horsepower FROM cars_data ORDER BY Accelerate DESC LIMIT 1
SELECT Horsepower FROM cars_data ORDER BY Accelerate DESC LIMIT 1
SELECT T1.Cylinders FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.MakeId = T2.MakeId INNER JOIN model_list AS T3 ON T2.Model = T3.Model WHERE T2.Model = 'volvo' ORDER BY T1.Accelerate ASC LIMIT 1
SELECT T2.Cylinders FROM car_makers AS T1 INNER JOIN cars_data AS T2 ON T1.Id = T2.Id WHERE T1.Maker = 'volkswagen' ORDER BY T2.Accelerate ASC LIMIT 1
SELECT COUNT(*) FROM cars_data WHERE Accelerate > ( SELECT MAX(Horsepower) FROM cars_data )
SELECT COUNT(*)  FROM cars_data AS T1 JOIN (     SELECT MAX(Horsepower) AS MaxHorsepower     FROM cars_data ) AS T2 ON T1.Accelerate > T2.MaxHorsepower; 
SELECT COUNT(*)  FROM (     SELECT c.CountryName      FROM countries c      JOIN car_makers cm ON c.ContId = cm.Country      GROUP BY c.CountryName      HAVING COUNT(cm.Id) > 2 ) 
SELECT COUNT(T2.CountryName) FROM car_makers AS T1 INNER JOIN countries AS T2 ON T1.Country = T2.CountryId GROUP BY T2.CountryName HAVING COUNT(T1.Maker) > 2
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 6; 
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 6; 
SELECT T.Model FROM ( SELECT T2.Model, T1.Horsepower FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.MakeId = T2.MakeId WHERE T1.Cylinders = 4 ORDER BY T1.Horsepower DESC LIMIT 1 ) AS T
SELECT T2.Model FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.MakeId = T2.MakeId WHERE T1.Cylinders = 4 ORDER BY T1.Horsepower DESC LIMIT 1 
SELECT T1.MakeId, T1.Make FROM car_names AS T1 INNER JOIN cars_data AS T2 ON T1.MakeId = T2.Id WHERE T2.Horsepower > (SELECT MIN(Horsepower) FROM cars_data) AND T2.Cylinders <= 3; 
SELECT T1.MakeId, T1.Model FROM car_names AS T1 JOIN model_list AS T2 ON T1.Model = T2.Model JOIN car_makers AS T3 ON T2.Maker = T3.Id JOIN cars_data AS T4 ON T1.MakeId = T4.MakeId WHERE T4.Horsepower <> (SELECT MIN(Horsepower) FROM cars_data) AND T4.Cylinders < 4; 
SELECT MAX(MPG) FROM cars_data WHERE Cylinders = 8 OR Year < 1980; 
SELECT max(MPG) FROM cars_data WHERE Cylinders = 8 OR Year < 1980
SELECT T2.Model FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.MakeId = T2.MakeId WHERE T1.Weight < 3500 AND T2.Make != 'ford'
SELECT DISTINCT T2.Model FROM car_names AS T1 INNER JOIN cars_data AS T2 ON T1.MakeId = T2.Id WHERE T2.Weight < 3500 AND T1.Make != 'ford'
SELECT CountryName FROM countries WHERE CountryId NOT IN (SELECT Country FROM car_makers) 
SELECT T1.CountryName FROM countries AS T1 WHERE T1.CountryId NOT IN (SELECT T2.Country FROM car_makers AS T2)
SELECT T1.Id, T1.Maker FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.Maker HAVING COUNT(T2.Model) >= 2
SELECT T1.Id, T1.Maker FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker JOIN cars_data AS T3 ON T2.ModelId = T3.Id GROUP BY T1.Id HAVING COUNT(DISTINCT T2.Model) >= 2 AND COUNT(T3.Id) > 3
SELECT T1.CountryId, T1.CountryName FROM countries AS T1 JOIN car_makers AS T2 ON T1.CountryId = T2.Country WHERE T2.Country > 3 UNION SELECT T1.CountryId, T1.CountryName FROM countries AS T1 JOIN car_names AS T3 ON T1.CountryId = T3.MakeId WHERE T3.Model = 'fiat'
SELECT c.CountryId, c.CountryName, COUNT(cm.Id) AS MakerCount FROM countries c JOIN car_makers cm ON c.CountryId = cm.Country GROUP BY c.CountryId, c.CountryName HAVING MakerCount > 3; 
SELECT Country FROM airlines WHERE Airline = 'JetBlue Airways'
SELECT Country FROM airlines WHERE Airline = 'JetBlue Airways'
SELECT Abbreviation FROM airlines WHERE Airline = 'JetBlue Airways'
SELECT Abbreviation FROM airlines WHERE Airline = 'Jetblue Airways'
SELECT Airline, Abbreviation FROM airlines WHERE Country = 'USA'
SELECT Airline, Abbreviation FROM airlines WHERE Country = 'USA'
SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony'
SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony'
SELECT COUNT(DISTINCT Airline) FROM airlines
SELECT COUNT(Airline) FROM airlines
SELECT COUNT(*) FROM airports; 
SELECT COUNT(AirportCode) FROM airports
SELECT COUNT(*) FROM flights;
SELECT COUNT(*) FROM flights
SELECT Airline FROM airlines WHERE Abbreviation = 'UAL'
SELECT Airline FROM airlines WHERE Abbreviation = 'UAL'
SELECT COUNT(*) FROM airlines WHERE Country = 'USA'
SELECT COUNT(*) FROM airlines WHERE Country = 'USA'
SELECT City, Country FROM airports WHERE AirportName = 'Alton'
SELECT City, Country FROM airports WHERE AirportName = 'Alton'
SELECT AirportName FROM airports WHERE AirportCode = 'AKO'
SELECT AirportName FROM airports WHERE AirportCode = 'AKO'
SELECT AirportName FROM airports WHERE City = 'Aberdeen'
SELECT AirportName FROM airports WHERE City = 'Aberdeen'
SELECT COUNT(*) FROM flights WHERE SourceAirport = ' APG';
SELECT COUNT(*) FROM flights WHERE SourceAirport = 'APG'
SELECT COUNT(*) FROM flights WHERE DestAirport = 'ATO'
SELECT COUNT(*) FROM flights WHERE DestAirport = 'ATO'
SELECT COUNT(*)  FROM flights  JOIN airports ON flights.SourceAirport = airports.AirportCode  WHERE airports.City = 'Aberdeen '; 
SELECT COUNT(T2.FlightNo) FROM airports AS T1 INNER JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport WHERE T1.City = 'Aberdeen'
SELECT COUNT(*) FROM flights AS T1 INNER JOIN airports AS T2 ON T1.DestAirport = T2.AirportCode WHERE T2.City = 'Aberdeen'
SELECT COUNT(T1.FlightNo) FROM flights AS T1 INNER JOIN airports AS T2 ON T1.DestAirport = T2.AirportCode WHERE T2.AirportName LIKE '%Aberdeen%'
SELECT COUNT(*) FROM flights AS f JOIN airports AS sa ON f.SourceAirport = sa.AirportCode JOIN airports AS da ON f.DestAirport = da.AirportCode WHERE sa.City = 'Aberdeen' AND da.City = 'Ashley'
SELECT COUNT(*) FROM flights AS f JOIN airports AS sa ON f.SourceAirport = sa.AirportCode JOIN airports AS da ON f.DestAirport = da.AirportCode WHERE sa.City = 'Aberdeen' AND da.City = 'Ashley'
SELECT COUNT(*) FROM flights AS T1 INNER JOIN airlines AS T2 ON T1.Airline = T2.uid WHERE T2.Airline = 'JetBlue Airways' 
SELECT COUNT(T1.FlightNo) FROM flights AS T1 INNER JOIN airlines AS T2 ON T1.Airline = T2.uid WHERE T2.Abbreviation = 'JetBlue'
SELECT COUNT(*) FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T1.Airline = 'United Airlines' AND T2.DestAirport = 'ASY'
SELECT COUNT(*) FROM flights AS T1 INNER JOIN airlines AS T2 ON T1.Airline = T2.uid INNER JOIN airports AS T3 ON T1.DestAirport = T3.AirportCode WHERE T2.Airline = 'United Airlines' AND T1.DestAirport = 'ASY'
SELECT COUNT(T1.FlightNo) FROM flights AS T1 INNER JOIN airlines AS T2 ON T1.Airline = T2.uid WHERE T1.SourceAirport = 'AHD' AND T2.Airline = 'United Airlines'
SELECT COUNT(*) FROM flights AS T1 INNER JOIN airports AS T2 ON T1.SourceAirport = T2.AirportCode WHERE T2.AirportCode = 'AHD' AND T1.Airline = 1
SELECT COUNT(*) FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline INNER JOIN airports AS T3 ON T3.AirportCode = T2.DestAirport WHERE T3.City = 'Aberdeen' AND T1.Airline = 'United Airlines'
SELECT COUNT(*) FROM flights f JOIN airports a ON f.DestAirport = a.AirportCode WHERE f.Airline = (SELECT uid FROM airlines WHERE Airline = 'United Airlines') AND a.City = 'Aberdeen'
SELECT T2.City FROM flights AS T1 INNER JOIN airports AS T2 ON T1.DestAirport = T2.AirportCode GROUP BY T2.City ORDER BY COUNT(T1.FlightNo) DESC LIMIT 1
SELECT T2.City  FROM flights AS T1  INNER JOIN airports AS T2 ON T1.DestAirport = T2.AirportCode  GROUP BY T2.City  ORDER BY COUNT(*) DESC  LIMIT 1; 
SELECT T2.City FROM flights AS T1 INNER JOIN airports AS T2 ON T1.SourceAirport = T2.AirportCode GROUP BY T2.City ORDER BY COUNT(T1.FlightNo) DESC LIMIT 1
SELECT T2.City FROM flights AS T1 INNER JOIN airports AS T2 ON T1.SourceAirport = T2.AirportCode GROUP BY T2.City ORDER BY COUNT(T2.City) DESC LIMIT 1
SELECT T2.DestAirport FROM flights AS T1 INNER JOIN airports AS T2 ON T1.DestAirport = T2.AirportCode GROUP BY T2.DestAirport ORDER BY COUNT(T2.DestAirport) DESC LIMIT 1
SELECT SourceAirport FROM flights GROUP BY SourceAirport ORDER BY COUNT(*) DESC LIMIT 1 
SELECT SourceAirport, DestAirport, COUNT(*) AS FlightCount FROM flights GROUP BY SourceAirport, DestAirport ORDER BY FlightCount ASC LIMIT 1; 
SELECT T2.AirportName FROM flights AS T1 JOIN airports AS T2 ON T1.SourceAirport = T2.AirportCode GROUP BY T2.AirportName ORDER BY COUNT(*) ASC LIMIT 1; 
SELECT T2.Airline FROM flights AS T1 INNER JOIN airlines AS T2 ON T1.Airline = T2.uid GROUP BY T2.Airline ORDER BY COUNT(T1.FlightNo) DESC LIMIT 1
SELECT T2.Airline  FROM flights AS T1  INNER JOIN airlines AS T2 ON T1.Airline = T2.uid  GROUP BY T2.Airline  ORDER BY COUNT(T1.FlightNo) DESC  LIMIT 1; 
SELECT T1.Abbreviation, T1.Country  FROM airlines AS T1  JOIN flights AS T2 ON T1.uid = T2.Airline  GROUP BY T1.Airline  ORDER BY COUNT(T2.FlightNo) ASC  LIMIT 1; 
SELECT T2.Abbreviation, T1.Country FROM airports AS T1 JOIN airlines AS T2 ON T2.uid = T1.Country JOIN flights AS T3 ON T3.SourceAirport = T1.AirportCode OR T3.DestAirport = T1.AirportCode GROUP BY T2.Abbreviation ORDER BY COUNT(T3.FlightNo) ASC LIMIT 1; 
SELECT DISTINCT T1.Airline FROM flights AS T1 INNER JOIN airports AS T2 ON T1.SourceAirport = T2.AirportCode WHERE T2.AirportCode = 'AHD'
SELECT DISTINCT T2.Airline FROM flights AS T1 INNER JOIN airlines AS T2 ON T1.Airline = T2.uid WHERE T1.SourceAirport = 'AHD'
SELECT DISTINCT Airline FROM flights WHERE DestAirport = 'AHD'
SELECT DISTINCT T2.Airline FROM flights AS T1 INNER JOIN airlines AS T2 ON T1.Airline = T2.uid WHERE T1.DestAirport = 'AHD'
SELECT T.Airline FROM (     SELECT Airline FROM flights WHERE SourceAirport = 'APG' ) AS T INTERSECT SELECT T.Airline FROM (     SELECT Airline FROM flights WHERE SourceAirport = 'CVO' ) AS T; 
SELECT T2.Airline FROM flights AS T1 INNER JOIN airlines AS T2 ON T1.Airline = T2.uid WHERE T1.SourceAirport IN ('APG', 'CVO') GROUP BY T2.Airline HAVING COUNT(DISTINCT T1.SourceAirport) > 1
SELECT T.Airline FROM (     SELECT DISTINCT Airline     FROM flights     WHERE SourceAirport = 'CVO' ) T EXCEPT SELECT DISTINCT Airline FROM flights WHERE SourceAirport = 'APG'; 
-- Step 1: Get airline IDs with flights from 'CVO' SELECT DISTINCT T1.Airline FROM flights AS T1 WHERE T1.SourceAirport = 'CVO'  -- Step 2: Get airline IDs with flights from 'APG' INTERSECT  SELECT DISTINCT T1.Airline FROM flights AS T1 WHERE T1.SourceAirport = 'APG'  -- Step 3: Use EXCEPT to find unique airline IDs from 'CVO' but not from 'APG' EXCEPT  SELECT DISTINCT T1.Airline FROM flights AS T1 WHERE T1.SourceAirport = 'APG'  -- Step 4: Join with airlines table to get airline names UNION  SELECT DISTINCT T1.Airline FROM flights AS T1 JOIN airlines AS T2 ON T1.Airline = T2.uid WHERE T1.SourceAirport = 'CVO' 
{     "chain_of_thought_reasoning": "The query joins the airlines and flights tables on the Airline/uid relationship, groups the results by airline, counts the number of flights per airline, and filters to include only those airlines with at least 10 flights.",     "SQL": "SELECT T1
SELECT T2.Airline FROM flights AS T1 JOIN airlines AS T2 ON T1.Airline = T2.uid GROUP BY T2.Airline HAVING COUNT(T1.FlightNo) >= 10; 
SELECT T1.Airline FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline HAVING COUNT(*) < 200
SELECT T2.Airline, COUNT(*) AS FlightCount FROM flights AS T1 JOIN airlines AS T2 ON T1.Airline = T2.uid GROUP BY T2.Airline HAVING FlightCount < 200; 
SELECT T1.FlightNo FROM flights AS T1 JOIN airlines AS T2 ON T1.Airline = T2.uid WHERE T2.Airline = 'United Airlines'
SELECT T1.FlightNo FROM flights AS T1 INNER JOIN airlines AS T2 ON T1.Airline = T2.uid WHERE T2.Airline = 'United Airlines'
SELECT FlightNo FROM flights WHERE SourceAirport = 'APG'
SELECT FlightNo FROM flights WHERE SourceAirport = 'APG'
SELECT T1.FlightNo FROM flights AS T1 INNER JOIN airports AS T2 ON T2.AirportCode = T1.DestAirport WHERE T1.DestAirport = 'APG' 
SELECT FlightNo FROM flights WHERE DestAirport = 'APG'
SELECT DISTINCT T1.FlightNo FROM flights AS T1 INNER JOIN airports AS T2 ON T1.SourceAirport = T2.AirportCode WHERE T2.City = 'Aberdeen'
SELECT T1.FlightNo FROM flights AS T1 JOIN airports AS T2 ON T1.SourceAirport = T2.AirportCode WHERE T2.City = 'Aberdeen '
SELECT T1.FlightNo FROM flights AS T1 INNER JOIN airports AS T2 ON T1.DestAirport = T2.AirportCode WHERE T2.City = 'Aberdeen ' 
SELECT T2.FlightNo FROM airports AS T1 INNER JOIN flights AS T2 ON T2.DestAirport = T1.AirportCode WHERE T1.City = 'Aberdeen'
SELECT COUNT(*) FROM flights AS T1 INNER JOIN airports AS T2 ON T1.DestAirport = T2.AirportCode WHERE T2.City IN ('Aberdeen', 'Abilene')
SELECT COUNT(*) FROM flights WHERE DestAirport IN ('ABR', 'ABI')
SELECT AirportName FROM airports WHERE AirportCode NOT IN (SELECT SourceAirport FROM flights UNION SELECT DestAirport FROM flights)
  SELECT SourceAirport FROM flights   UNION   SELECT DestAirport FROM flights;   
SELECT COUNT(*) FROM employee; 
SELECT COUNT(Employee_ID) FROM employee
SELECT Name FROM employee ORDER BY Age ASC
SELECT Name FROM employee ORDER BY Age ASC
SELECT City, COUNT(*) FROM employee GROUP BY City
SELECT City, COUNT(*) FROM employee GROUP BY City
SELECT City FROM employee WHERE Age < 30 GROUP BY City HAVING COUNT(Employee_ID) > 1
SELECT City FROM employee WHERE Age < 30 GROUP BY City HAVING COUNT(Employee_ID) > 1
SELECT LOCATION ,  COUNT(*) FROM shop GROUP BY LOCATION 
SELECT Location, COUNT(*) FROM shop GROUP BY Location
SELECT Manager_name, District FROM shop WHERE Number_products = ( SELECT MAX(Number_products) FROM shop )
SELECT manager_name, district FROM shop ORDER BY number_products DESC LIMIT 1
SELECT MIN(Number_products), MAX(Number_products) FROM shop
SELECT MIN(Number_products), MAX(Number_products) FROM shop 
SELECT Name, Location, District FROM shop ORDER BY Number_products DESC
SELECT Name, Location, District FROM shop ORDER BY Number_products DESC
SELECT Name FROM shop WHERE Number_products > ( SELECT AVG(Number_products) FROM shop )
{     "chain_of_thought_reasoning": "To solve this problem, we need to find the average number of products across all shops and then select the names of those shops where the number of products is greater than this average. Here are the steps to derive the SQL query:",          "1. Calculate the average number of products across all shops using the AVG() function on the Number_products column from the shop table.",     "2. Select the names of the shops from the shop table where the Number_products column value is greater than the average calculated in step 1.",     "3. Combine these two steps into a single SQL query using a subquery to calculate the average and a WHERE clause to filter the shops based on the condition.",          "SQL": "SELECT Name FROM shop WHERE Number_products > (SELECT AVG(Number_products) FROM shop)" }
SELECT T1.Name FROM employee AS T1 INNER JOIN evaluation AS T2 ON T1.Employee_ID = T2.Employee_ID GROUP BY T1.Employee_ID ORDER BY COUNT(T2.Year_awarded) DESC LIMIT 1
SELECT T1.Name FROM employee AS T1 JOIN evaluation AS T2 ON T1.Employee_ID = T2.Employee_ID GROUP BY T1.Employee_ID ORDER BY COUNT(T2.Year_awarded) DESC LIMIT 1
SELECT T1.Name FROM employee AS T1 JOIN evaluation AS T2 ON T1.Employee_ID = T2.Employee_ID ORDER BY T2.Bonus DESC LIMIT 1
SELECT T2.Name FROM evaluation AS T1 INNER JOIN employee AS T2 ON T1.Employee_ID = T2.Employee_ID ORDER BY T1.Bonus DESC LIMIT 1
SELECT Name FROM employee WHERE Employee_ID NOT IN (SELECT Employee_ID FROM evaluation)
SELECT Name FROM employee WHERE Employee_ID NOT IN (SELECT Employee_ID FROM evaluation)
SELECT T2.Name FROM hiring AS T1 INNER JOIN shop AS T2 ON T1.Shop_ID = T2.Shop_ID GROUP BY T1.Shop_ID ORDER BY COUNT(T1.Employee_ID) DESC LIMIT 1
SELECT T1.Name FROM shop AS T1 JOIN hiring AS T2 ON T1.Shop_ID = T2.Shop_ID GROUP BY T1.Shop_ID ORDER BY COUNT(T2.Employee_ID) DESC LIMIT 1
SELECT Name FROM shop WHERE Shop_ID NOT IN ( SELECT Shop_ID FROM hiring )
SELECT Name FROM shop WHERE Shop_ID NOT IN (SELECT Shop_ID FROM hiring)
SELECT COUNT(T2.Employee_ID), T1.Name FROM shop AS T1 INNER JOIN hiring AS T2 ON T1.Shop_ID = T2.Shop_ID GROUP BY T1.Shop_ID
SELECT T2.Name, COUNT(T1.Employee_ID) AS Number_of_Employees FROM hiring AS T1 INNER JOIN shop AS T2 ON T1.Shop_ID = T2.Shop_ID GROUP BY T2.Name
SELECT SUM(Bonus) FROM evaluation
SELECT SUM(Bonus) AS Total_Bonus FROM evaluation
SELECT * FROM hiring; 
SELECT * FROM hiring; 
   SELECT District FROM shop WHERE Number_products < 3000    
SELECT DISTINCT district FROM shop WHERE number_products < 3000 INTERSECT SELECT DISTINCT district FROM shop WHERE number_products > 10000
SELECT COUNT(DISTINCT Location) FROM shop
SELECT COUNT(DISTINCT Location) FROM shop; 
SELECT COUNT(*) FROM Documents; 
SELECT COUNT(Document_ID) FROM Documents
   SELECT Document_ID, Document_Name, Document_Description FROM Documents;    
SELECT Document_ID, Document_Name, Document_Description FROM Documents; 
SELECT Document_Name, Template_ID FROM Documents WHERE Document_Description LIKE '%w%'
SELECT Document_Name, Template_ID FROM Documents WHERE Document_Description LIKE '%w%'
SELECT Document_ID, Template_ID, Document_Description FROM Documents WHERE Document_Name = 'Robbin CV'
SELECT document_id, template_id, document_description FROM Documents WHERE Document_Name = 'Robbin CV'
SELECT COUNT(DISTINCT Template_ID) AS NumberOfDifferentTemplates FROM Documents
SELECT COUNT(DISTINCT Template_ID) AS Number_of_Different_Templates FROM Templates
SELECT COUNT(DISTINCT D.Document_ID) FROM Documents AS D JOIN Templates AS T ON D.Template_ID = T.Template_ID WHERE T.Template_Type_Code = 'PPT'
SELECT COUNT(DISTINCT T2.Document_ID) FROM Templates AS T1 INNER JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID WHERE T1.Template_Type_Code = 'PPT'
SELECT Template_ID, COUNT(*) AS Number_of_Documents FROM Documents GROUP BY Template_ID
SELECT Template_ID, COUNT(*) AS Usage_Count FROM Documents GROUP BY Template_ID
SELECT T2.Template_ID, T2.Template_Type_Code FROM Documents AS T1 INNER JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T2.Template_ID ORDER BY COUNT(T1.Document_ID) DESC LIMIT 1
SELECT T2.Template_ID, T2.Template_Type_Code FROM Documents AS T1 INNER JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T2.Template_ID ORDER BY COUNT(T1.Document_ID) DESC LIMIT 1; 
SELECT T.Template_ID FROM Templates AS T INNER JOIN Documents AS D ON T.Template_ID = D.Template_ID GROUP BY T.Template_ID HAVING COUNT(D.Document_ID) > 1; 
SELECT T.Template_ID FROM Templates AS T JOIN Documents AS D ON T.Template_ID = D.Template_ID GROUP BY T.Template_ID HAVING COUNT(D.Document_ID) > 1
SELECT Template_ID FROM Templates WHERE Template_ID NOT IN (SELECT Template_ID FROM Documents) 
SELECT Template_ID FROM Templates WHERE Template_ID NOT IN (SELECT Template_ID FROM Documents)
SELECT COUNT(*) FROM Templates
SELECT COUNT(*) FROM Templates; 
SELECT Template_ID, Version_Number, Template_Type_Code FROM Templates; 
SELECT Template_ID, Version_Number, Template_Type_Code FROM Templates; 
SELECT DISTINCT Template_Type_Code FROM Templates
SELECT DISTINCT Template_Type_Code FROM Ref_Template_Types; 
SELECT Template_ID FROM Templates WHERE Template_Type_Code IN ('PP', 'PPT')
SELECT Template_ID FROM Templates WHERE Template_Type_Code IN ('PP', 'PPT')
   SELECT COUNT(Template_ID) FROM Templates WHERE Template_Type_Code = 'CV'    
SELECT COUNT(Template_ID) FROM Templates WHERE Template_Type_Code = 'CV'
SELECT Version_Number, Template_Type_Code FROM Templates WHERE Version_Number > 5
SELECT Version_Number, Template_Type_Code FROM Templates WHERE Version_Number > 5
SELECT Template_Type_Code, COUNT(*) AS Number_of_Templates FROM Templates GROUP BY Template_Type_Code
SELECT Template_Type_Code, COUNT(*) AS Number_of_Templates FROM Templates GROUP BY Template_Type_Code
SELECT Template_Type_Code  FROM Templates  GROUP BY Template_Type_Code  ORDER BY COUNT(Template_ID) DESC  LIMIT 1; 
SELECT T2.Template_Type_Code FROM Templates AS T1 JOIN Ref_Template_Types AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code GROUP BY T2.Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT T2.Template_Type_Code FROM Templates AS T1 INNER JOIN Ref_Template_Types AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code GROUP BY T2.Template_Type_Code HAVING COUNT(*) < 3
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code HAVING COUNT(Template_ID) < 3
SELECT Template_Type_Code, MIN(Version_Number) AS Smallest_Version FROM Templates
SELECT Version_Number, Template_Type_Code FROM Templates ORDER BY Version_Number ASC LIMIT 1 
SELECT T2.Template_Type_Code FROM Documents AS T1 INNER JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID WHERE T1.Document_Name = 'Data base'
SELECT T2.Template_Type_Code FROM Documents AS T1 INNER JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID WHERE T1.Document_Name = 'Data base'
SELECT T1.Document_Name FROM Documents AS T1 INNER JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID INNER JOIN Ref_Template_Types AS T3 ON T2.Template_Type_Code = T3.Template_Type_Code WHERE T3.Template_Type_Code = 'BK'; 
SELECT D.Document_Name FROM Templates T JOIN Documents D ON T.Template_ID = D.Template_ID WHERE T.Template_Type_Code = 'BK'
SELECT T2.Template_Type_Code, COUNT(*) AS Number_of_Documents FROM Documents AS T1 INNER JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID INNER JOIN Ref_Template_Types AS T3 ON T2.Template_Type_Code = T3.Template_Type_Code GROUP BY T2.Template_Type_Code; 
SELECT `Template_Type_Code`, COUNT(*) FROM `Templates` AS T1 JOIN `Documents` AS T2 ON T1.`Template_ID` = T2.`Template_ID` GROUP BY `Template_Type_Code`
SELECT T2.Template_Type_Code  FROM Documents AS T1  INNER JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID  GROUP BY T2.Template_Type_Code  ORDER BY COUNT(T1.Template_ID) DESC  LIMIT 1; 
SELECT T1.Template_Type_Code FROM Templates AS T1 INNER JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T1.Template_Type_Code ORDER BY COUNT(T1.Template_Type_Code) DESC LIMIT 1
SELECT Template_Type_Code  FROM Ref_Template_Types  WHERE Template_Type_Code NOT IN (SELECT Template_Type_Code FROM Documents); 
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Code NOT IN ( SELECT Template_Type_Code FROM Documents )
SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types
SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types
SELECT Template_Type_Description FROM Ref_Template_Types WHERE Template_Type_Code = 'AD' 
SELECT Template_Type_Description FROM Ref_Template_Types WHERE Template_Type_Code = 'AD'
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Book'
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Book'
  SELECT T2.Template_Type_Code   FROM Documents AS T1   INNER JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID   
SELECT DISTINCT T2.Template_Details FROM Documents AS T1 INNER JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID
SELECT T1.Template_ID FROM Templates AS T1 INNER JOIN Ref_Template_Types AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code WHERE T2.Template_Type_Description = 'Presentation'
SELECT T2.Template_ID FROM Ref_Template_Types AS T1 INNER JOIN Templates AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code WHERE T1.Template_Type_Description = 'Presentation'
SELECT COUNT(*) FROM Paragraphs
SELECT COUNT(Paragraph_ID) AS Number_of_Paragraphs FROM Paragraphs; 
SELECT COUNT(T2.Paragraph_ID) FROM Documents AS T1 INNER JOIN Paragraphs AS T2 ON T1.Document_ID = T2.Document_ID WHERE T1.Document_Name = 'Summer Show'
SELECT COUNT(*) FROM Documents AS T1 INNER JOIN Paragraphs AS T2 ON T1.Document_ID = T2.Document_ID WHERE T1.Document_Name = 'Summer Show'
SELECT Paragraph_Text FROM Paragraphs WHERE Paragraph_Text = 'Korea' 
SELECT Paragraph_Details FROM Paragraphs WHERE Paragraph_Text LIKE '%Korea%'
SELECT T2.Paragraph_ID, T2.Paragraph_Text FROM Documents AS T1 INNER JOIN Paragraphs AS T2 ON T1.Document_ID = T2.Document_ID WHERE T1.Document_Name = 'Welcome to NY'
SELECT T2.Paragraph_ID, T2.Paragraph_Text  FROM Documents AS T1  INNER JOIN Paragraphs AS T2 ON T1.Document_ID = T2.Document_ID  WHERE T1.Document_Name = 'Welcome to NY' 
SELECT T1.Paragraph_Text FROM Paragraphs AS T1 INNER JOIN Documents AS T2 ON T1.Document_ID = T2.Document_ID INNER JOIN Templates AS T3 ON T2.Template_ID = T3.Template_ID WHERE T2.Document_Name = 'Customer reviews'
SELECT T2.Paragraph_Text FROM Documents AS T1 INNER JOIN Paragraphs AS T2 ON T1.Document_ID = T2.Document_ID WHERE T1.Document_Name = 'Customer reviews'
SELECT Document_ID, COUNT(*) FROM Paragraphs GROUP BY Document_ID ORDER BY Document_ID
SELECT D.Document_ID, COUNT(P.Paragraph_ID) AS Paragraph_Count FROM Documents D JOIN Paragraphs P ON D.Document_ID = P.Document_ID GROUP BY D.Document_ID ORDER BY D.Document_ID; 
SELECT D.Document_ID, D.Document_Name, COUNT(P.Paragraph_ID) AS Number_of_Paragraphs FROM Documents D JOIN Paragraphs P ON D.Document_ID = P.Document_ID GROUP BY D.Document_ID, D.Document_Name
SELECT Documents.Document_ID, Documents.Document_Name, COUNT(Paragraphs.Paragraph_ID) AS Paragraph_Count FROM Documents INNER JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID GROUP BY Documents.Document_ID, Documents.Document_Name
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(*) >= 2
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(*) >= 2
SELECT D.Document_ID, D.Document_Name, COUNT(*) AS Paragraph_Count FROM Documents D JOIN Paragraphs P ON D.Document_ID = P.Document_ID GROUP BY D.Document_ID, D.Document_Name ORDER BY Paragraph_Count DESC LIMIT 1; 
SELECT D.Document_ID, D.Document_Name FROM Documents AS D JOIN Paragraphs AS P ON D.Document_ID = P.Document_ID GROUP BY D.Document_ID ORDER BY COUNT(P.Paragraph_ID) DESC LIMIT 1
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT T2.Document_ID FROM Paragraphs AS T1 INNER JOIN Documents AS T2 ON T1.Document_ID = T2.Document_ID GROUP BY T2.Document_ID HAVING COUNT(T1.Paragraph_ID) BETWEEN 1 AND 2
SELECT T1.Document_ID FROM Documents AS T1 INNER JOIN Paragraphs AS T2 ON T1.Document_ID = T2.Document_ID GROUP BY T1.Document_ID HAVING COUNT(T2.Paragraph_ID) BETWEEN 1 AND 2
SELECT Document_ID FROM Paragraphs WHERE Paragraph_Text = 'Brazil' UNION SELECT Document_ID FROM Paragraphs WHERE Paragraph_Text = 'Ireland'
SELECT T2.Document_ID FROM Paragraphs AS T1 INNER JOIN Documents AS T2 ON T1.Document_ID = T2.Document_ID WHERE T1.Paragraph_Text LIKE '%Brazil%' INTERSECT SELECT T2.Document_ID FROM Paragraphs AS T1 INNER JOIN Documents AS T2 ON T1.Document_ID = T2.Document_ID WHERE T1.Paragraph_Text LIKE '%Ireland%'
SELECT COUNT(*) FROM teacher
SELECT COUNT(Teacher_ID) FROM teacher
SELECT Name FROM teacher ORDER BY Age ASC
SELECT Name FROM teacher ORDER BY Age ASC
SELECT Age, Hometown FROM teacher
SELECT Age, Hometown FROM teacher
SELECT Name FROM teacher WHERE Hometown != 'Little Lever Urban District'
SELECT Name FROM teacher WHERE Hometown != 'Little Lever Urban District'
SELECT Name FROM teacher WHERE Age = 32 OR Age = 33
SELECT Name FROM teacher WHERE Age = 32 OR Age = 33
SELECT Hometown FROM teacher ORDER BY Age ASC LIMIT 1
SELECT Hometown FROM teacher WHERE Age = (SELECT MIN(Age) FROM teacher)
SELECT Hometown, COUNT(*) FROM teacher GROUP BY Hometown
SELECT Hometown, COUNT(*) FROM teacher GROUP BY Hometown
SELECT Hometown FROM teacher GROUP BY Hometown ORDER BY COUNT(*) DESC LIMIT 1
SELECT Hometown FROM teacher GROUP BY Hometown ORDER BY COUNT(Hometown) DESC LIMIT 1
SELECT Hometown FROM teacher GROUP BY Hometown HAVING COUNT(*) >= 2
SELECT Hometown FROM teacher GROUP BY Hometown HAVING COUNT(*) >= 2
SELECT T1.Name, T3.Course FROM teacher AS T1 INNER JOIN course_arrange AS T2 ON T1.Teacher_ID = T2.Teacher_ID INNER JOIN course AS T3 ON T2.Course_ID = T3.Course_ID; 
SELECT T1.Name, T3.Course  FROM teacher AS T1  INNER JOIN course_arrange AS T2 ON T1.Teacher_ID = T2.Teacher_ID  INNER JOIN course AS T3 ON T2.Course_ID = T3.Course_ID; 
SELECT T1.Name, T3.Course FROM teacher AS T1 INNER JOIN course_arrange AS T2 ON T1.Teacher_ID = T2.Teacher_ID INNER JOIN course AS T3 ON T2.Course_ID = T3.Course_ID ORDER BY T1.Name ASC
SELECT T1.Name, T3.Course FROM teacher AS T1 INNER JOIN course_arrange AS T2 ON T1.Teacher_ID = T2.Teacher_ID INNER JOIN course AS T3 ON T2.Course_ID = T3.Course_ID ORDER BY T1.Name ASC
SELECT T3.Name FROM course AS T1 INNER JOIN course_arrange AS T2 ON T1.Course_ID = T2.Course_ID INNER JOIN teacher AS T3 ON T2.Teacher_ID = T3.Teacher_ID WHERE T1.Course = 'Math'
SELECT T3.Name FROM course AS T1 INNER JOIN course_arrange AS T2 ON T1.Course_ID = T2.Course_ID INNER JOIN teacher AS T3 ON T2.Teacher_ID = T3.Teacher_ID WHERE T1.Course = 'Math'
SELECT T1.Name, COUNT(T2.Course_ID) AS Number_of_Courses FROM teacher AS T1 INNER JOIN course_arrange AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T1.Name
SELECT T1.Name, COUNT(T3.Course) AS Course_Count FROM teacher AS T1 INNER JOIN course_arrange AS T2 ON T1.Teacher_ID = T2.Teacher_ID INNER JOIN course AS T3 ON T2.Course_ID = T3.Course_ID GROUP BY T1.Name
SELECT T1.Name  FROM teacher AS T1 JOIN course_arrange AS T2 ON T1.Teacher_ID = T2.Teacher_ID 
SELECT T.Name FROM teacher AS T JOIN course_arrange AS C ON T.Teacher_ID = C.Teacher_ID GROUP BY T.Teacher_ID HAVING COUNT(C.Course_ID) >= 2
SELECT Name FROM teacher WHERE Teacher_ID NOT IN (SELECT Teacher_ID FROM course_arrange) 
   SELECT Name FROM teacher;    
SELECT COUNT(ID) FROM visitor WHERE Age < 30
SELECT Name FROM visitor WHERE Level_of_membership > 4 ORDER BY Level_of_membership DESC
SELECT AVG(Age) FROM visitor WHERE Level_of_membership <= 4
SELECT Name, Level_of_membership FROM visitor WHERE Level_of_membership > 4 ORDER BY Age DESC
SELECT Museum_ID, Name FROM museum ORDER BY Num_of_Staff DESC LIMIT 1
SELECT AVG(Num_of_Staff) FROM museum WHERE Open_Year < '2009'
SELECT Open_Year, Num_of_Staff FROM museum WHERE Name = 'Plaza Museum'
SELECT Name FROM museum WHERE Num_of_Staff > ( SELECT MIN(Num_of_Staff) FROM museum WHERE Open_Year > '2010' )
SELECT T1.ID, T1.Name, T1.Age FROM visitor AS T1 JOIN visit AS T2 ON T1.ID = T2.visitor_ID GROUP BY T1.ID HAVING COUNT(T2.Museum_ID) > 1
SELECT T2.ID, T2.Name, T2.Level_of_membership FROM visit AS T1 INNER JOIN visitor AS T2 ON T1.visitor_ID = T2.ID GROUP BY T1.visitor_ID ORDER BY SUM(T1.Total_spent) DESC LIMIT 1
SELECT T1.Museum_ID, T1.Name FROM museum AS T1 JOIN visit AS T2 ON T1.Museum_ID = T2.Museum_ID GROUP BY T1.Museum_ID ORDER BY COUNT(T2.Num_of_Ticket) DESC LIMIT 1
SELECT Name FROM museum WHERE Museum_ID NOT IN (SELECT Museum_ID FROM visit); 
SELECT T2.Name, T2.Age FROM visit AS T1 INNER JOIN visitor AS T2 ON T1.visitor_ID = T2.ID WHERE T1.Num_of_Ticket = (     SELECT MAX(Num_of_Ticket)     FROM visit ); 
SELECT AVG(Num_of_Ticket) AS Average_Tickets, MAX(Num_of_Ticket) AS Maximum_Tickets FROM visit
SELECT SUM(T2.Total_spent) FROM visitor AS T1 INNER JOIN visit AS T2 ON T1.ID = T2.visitor_ID WHERE T1.Level_of_membership = 1
-- Step 1: Select visitors who visited museums opened before 2009 SELECT T1.Name FROM visitor AS T1 JOIN visit AS T2 ON T1.ID = T2.visitor_ID JOIN museum AS T3 ON T2.Museum_ID = T3.Museum_ID WHERE T3.Open_Year < '2009'  -- Step 2: Select visitors who visited museums opened after 2011 INTERSECT  SELECT T1.Name FROM visitor AS T1 JOIN visit AS T2 ON T1.ID = T2.visitor_ID JOIN museum AS T3 ON T2.Museum_ID = T3.Museum_ID WHERE T3.Open_Year > '2011' 
SELECT COUNT(ID) FROM visitor WHERE ID NOT IN ( SELECT visitor_ID FROM visit JOIN museum ON visit.Museum_ID = museum.Museum_ID WHERE Open_Year > '2010' )
SELECT COUNT(*) FROM museum WHERE Open_Year > 2013 OR Open_Year < 2008
SELECT COUNT(*) FROM players; 
SELECT COUNT(player_id) AS total_players FROM players
SELECT COUNT(*) FROM matches; 
SELECT COUNT(*) FROM matches; 
SELECT first_name, birth_date FROM players WHERE country_code = 'USA'
SELECT first_name, birth_date FROM players WHERE country_code = 'USA'
SELECT AVG(winner_age), AVG(loser_age) FROM matches; 
SELECT AVG(loser_age) AS avg_loser_age, AVG(winner_age) AS avg_winner_age FROM matches
SELECT AVG(T2.ranking) AS average_winner_rank FROM matches AS T1 INNER JOIN rankings AS T2 ON T1.winner_id = T2.player_id
SELECT AVG(T2.ranking) FROM matches AS T1 INNER JOIN rankings AS T2 ON T1.winner_id = T2.player_id 
SELECT max(loser_rank) FROM matches
SELECT MIN(loser_rank) AS best_loser_rank FROM matches; 
SELECT COUNT(DISTINCT country_code) FROM players
SELECT COUNT(DISTINCT country_code) FROM players; 
SELECT COUNT(DISTINCT loser_name) FROM matches
SELECT COUNT(DISTINCT loser_name) AS number_of_different_loser_names FROM matches
SELECT tourney_name FROM matches GROUP BY tourney_name HAVING COUNT(*) > 10
SELECT tourney_name  FROM matches  GROUP BY tourney_name  HAVING COUNT(*) > 10; 
SELECT winner_id FROM matches WHERE strftime('%Y', tourney_date) = '2013' 
SELECT winner_name FROM matches WHERE STRFTIME('%Y', tourney_date) = '2013' INTERSECT SELECT winner_name FROM matches WHERE STRFTIME('%Y', tourney_date) = '2016'
SELECT COUNT(*) FROM matches WHERE STRFTIME('%Y', tourney_date) IN ('2013', '2016')
SELECT COUNT(*) FROM matches WHERE tourney_date LIKE '%2013%' OR tourney_date LIKE '%2016%'
SELECT T2.country_code, T2.first_name FROM matches AS T1 INNER JOIN players AS T2 ON T1.winner_id = T2.player_id WHERE T1.tourney_name = 'WTA Championships'  INTERSECT  SELECT T2.country_code, T2.first_name FROM matches AS T1 INNER JOIN players AS T2 ON T1.winner_id = T2.player_id WHERE T1.tourney_name = 'Australian Open' 
SELECT p.first_name, p.country_code FROM players p JOIN matches m ON p.player_id = m.winner_id WHERE m.tourney_name = 'WTA Championships'  INTERSECT  SELECT p.first_name, p.country_code FROM players p JOIN matches m ON p.player_id = m.winner_id WHERE m.tourney_name = 'Australian Open'; 
SELECT first_name, country_code FROM players ORDER BY birth_date ASC LIMIT 1; 
SELECT first_name, country_code FROM players ORDER BY birth_date ASC LIMIT 1
SELECT first_name, last_name FROM players ORDER BY birth_date
SELECT first_name || ' ' || last_name AS full_name FROM players ORDER BY birth_date
SELECT first_name, last_name FROM players WHERE hand = 'L' ORDER BY birth_date
SELECT first_name, last_name FROM players WHERE hand = 'L' ORDER BY birth_date ASC
SELECT T2.first_name, T2.country_code FROM rankings AS T1 INNER JOIN players AS T2 ON T1.player_id = T2.player_id GROUP BY T2.player_id ORDER BY SUM(T1.tours) DESC LIMIT 1; 
SELECT p.first_name, p.country_code FROM players p JOIN rankings r ON p.player_id = r.player_id GROUP BY r.player_id ORDER BY COUNT(r.tours) DESC LIMIT 1
SELECT strftime('%Y', tourney_date) AS year, COUNT(*) AS num_matches FROM matches GROUP BY year ORDER BY num_matches DESC LIMIT 1; 
SELECT strftime('%Y', tourney_date) AS year, COUNT(*) AS match_count FROM matches GROUP BY year ORDER BY match_count DESC LIMIT 1; 
SELECT T1.winner_name, T1.winner_rank_points FROM matches AS T1 GROUP BY T1.winner_name ORDER BY COUNT(T1.winner_name) DESC LIMIT 1
SELECT T2.winner_name, T3.ranking_points FROM matches AS T1 INNER JOIN players AS T2 ON T1.winner_id = T2.player_id INNER JOIN rankings AS T3 ON T2.player_id = T3.player_id GROUP BY T2.winner_id ORDER BY COUNT(T1.match_num) DESC LIMIT 1; 
SELECT p.first_name, p.last_name FROM players p JOIN matches m ON p.player_id = m.winner_id JOIN rankings r ON p.player_id = r.player_id WHERE m.tourney_name = 'Australian Open' ORDER BY r.ranking_points DESC LIMIT 1; 
SELECT p.first_name || ' ' || p.last_name AS winner_name FROM players p JOIN matches m ON p.player_id = m.winner_id JOIN rankings r ON p.player_id = r.player_id WHERE m.tourney_name = 'Australian Open' ORDER BY r.ranking_points DESC LIMIT 1
  SELECT MAX(minutes) FROM matches   
SELECT winner_name, loser_name FROM matches ORDER BY minutes DESC LIMIT 1
SELECT p.first_name, AVG(r.ranking) AS average_ranking FROM players p JOIN rankings r ON p.player_id = r.player_id GROUP BY p.first_name
SELECT p.first_name, AVG(r.ranking) AS average_ranking FROM players p JOIN rankings r ON p.player_id = r.player_id GROUP BY p.player_id
SELECT SUM(T1.ranking_points) AS total_ranking_points, T2.first_name FROM rankings AS T1 INNER JOIN players AS T2 ON T1.player_id = T2.player_id GROUP BY T1.player_id
SELECT p.first_name, SUM(r.ranking_points) AS total_ranking_points FROM players p JOIN rankings r ON p.player_id = r.player_id GROUP BY p.player_id
SELECT country_code, COUNT(*) AS num_players FROM players GROUP BY country_code; 
SELECT country_code, COUNT(player_id) AS num_players FROM players GROUP BY country_code
SELECT country_code FROM players GROUP BY country_code ORDER BY COUNT(country_code) DESC LIMIT 1
SELECT country_code FROM players GROUP BY country_code ORDER BY COUNT(country_code) DESC LIMIT 1
SELECT country_code FROM players GROUP BY country_code HAVING COUNT(player_id) > 50
SELECT country_code FROM players GROUP BY country_code HAVING COUNT(player_id) > 50
SELECT ranking_date, SUM(tours) AS total_tours FROM rankings GROUP BY ranking_date
SELECT ranking_date, tours FROM rankings; 
SELECT YEAR(tourney_date) AS match_year, COUNT(*) AS num_matches FROM matches GROUP BY match_year
SELECT COUNT(*) AS match_count, YEAR(tourney_date) AS match_year FROM matches GROUP BY match_year
SELECT winner_name, winner_rank FROM matches ORDER BY winner_age ASC LIMIT 3 
SELECT T1.winner_name, T1.winner_rank FROM matches AS T1 ORDER BY T1.winner_age ASC LIMIT 3
SELECT COUNT(DISTINCT T1.winner_id) FROM matches AS T1 JOIN players AS T2 ON T1.winner_id = T2.player_id WHERE T1.tourney_name = 'WTA Championships' AND T2.hand = 'L'
SELECT COUNT(DISTINCT m.winner_id) FROM matches AS m JOIN players AS p ON m.winner_id = p.player_id WHERE m.tourney_name = 'WTA Championships' AND p.hand = 'L'
SELECT p.first_name, p.country_code, p.birth_date FROM players p JOIN matches m ON p.player_id = m.winner_id ORDER BY m.winner_rank_points DESC LIMIT 1
SELECT T2.first_name, T2.country_code, T2.birth_date  FROM matches AS T1  INNER JOIN players AS T2 ON T1.winner_id = T2.player_id  GROUP BY T1.winner_id  ORDER BY SUM(T1.winner_rank_points) DESC  LIMIT 1 
SELECT hand, COUNT(*) FROM players GROUP BY hand
SELECT hand, COUNT(*) FROM players GROUP BY hand
SELECT COUNT(*) FROM ship WHERE disposition_of_ship = 'Captured' 
SELECT name, tonnage FROM ship ORDER BY name DESC
SELECT name, date, result FROM battle
SELECT MAX(SUM(killed + injured)) AS max_death_toll, MIN(SUM(killed + injured)) AS min_death_toll FROM death
SELECT AVG(injured) FROM death
SELECT T2.killed, T2.injured FROM ship AS T1 INNER JOIN death AS T2 ON T1.id = T2.caused_by_ship_id WHERE T1.tonnage = 't'
SELECT name, result FROM battle WHERE bulgarian_commander != 'Boril'
SELECT DISTINCT T2.id, T2.name FROM ship AS T1 INNER JOIN battle AS T2 ON T1.lost_in_battle = T2.id WHERE T1.ship_type = 'Brig'
SELECT T3.id, T3.name  FROM death AS T1  INNER JOIN ship AS T2 ON T1.caused_by_ship_id = T2.id  INNER JOIN battle AS T3 ON T2.lost_in_battle = T3.id  GROUP BY T3.id  HAVING SUM(T1.killed) > 10; 
SELECT T1.id, T1.name  FROM ship AS T1  INNER JOIN death AS T2 ON T2.caused_by_ship_id = T1.id  GROUP BY T1.id  ORDER BY SUM(T2.injured) DESC  LIMIT 1; 
SELECT DISTINCT name FROM battle WHERE bulgarian_commander = 'Kaloyan' AND latin_commander = 'Baldwin I'
SELECT COUNT(DISTINCT result) FROM battle 
SELECT COUNT(*) FROM battle WHERE id NOT IN ( SELECT lost_in_battle FROM ship WHERE tonnage = '225' )
SELECT T2.name, T2.date FROM ship AS T1 INNER JOIN battle AS T2 ON T1.lost_in_battle = T2.id WHERE T1.name IN ('Lettice', 'HMS Atalanta') 
SELECT name, result, bulgarian_commander FROM battle WHERE id NOT IN (SELECT DISTINCT lost_in_battle FROM ship WHERE location = 'English Channel')
SELECT note FROM death WHERE note LIKE '%East%'
SELECT line_1, line_2 FROM Addresses; 
SELECT line_1, line_2 FROM Addresses
SELECT COUNT(course_id) AS total_courses FROM Courses
SELECT COUNT(course_id) AS number_of_courses FROM Courses;
SELECT course_description FROM Courses WHERE course_name = 'math'
SELECT course_description FROM Courses WHERE course_name = 'math'
SELECT zip_postcode FROM Addresses WHERE city = 'Port Chelsea'
SELECT zip_postcode FROM Addresses WHERE city = 'Port Chelsea'
SELECT d.department_name, dp.department_id FROM Degree_Programs dp JOIN Departments d ON dp.department_id = d.department_id GROUP BY dp.department_id ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT T2.department_name, T2.department_id FROM Degree_Programs AS T1 INNER JOIN Departments AS T2 ON T1.department_id = T2.department_id GROUP BY T2.department_id ORDER BY COUNT(T1.degree_program_id) DESC LIMIT 1
SELECT COUNT(DISTINCT department_id) FROM Degree_Programs
SELECT COUNT(DISTINCT T1.department_id) AS number_of_departments FROM Degree_Programs AS T1 INNER JOIN Student_Enrolment AS T2 ON T1.degree_program_id = T2.degree_program_id
SELECT COUNT(DISTINCT degree_summary_name) FROM Degree_Programs
SELECT COUNT(DISTINCT degree_summary_name) AS number_of_degrees FROM Degree_Programs
SELECT COUNT(degree_program_id) FROM Degree_Programs WHERE department_id = (SELECT department_id FROM Departments WHERE department_name = 'engineering')
SELECT COUNT(degree_program_id) AS number_of_degrees FROM Degree_Programs WHERE department_name = 'engineering'; 
SELECT section_name, section_description FROM Sections;
SELECT section_name, section_description FROM Sections
SELECT T1.course_name, T1.course_id FROM Courses AS T1 INNER JOIN Sections AS T2 ON T1.course_id = T2.course_id GROUP BY T1.course_id HAVING COUNT(T2.section_id) <= 2
SELECT C.course_id, C.course_name FROM Courses AS C JOIN Sections AS S ON C.course_id = S.course_id GROUP BY C.course_id, C.course_name HAVING COUNT(S.section_id) < 2; 
SELECT section_name FROM Sections ORDER BY section_name DESC
SELECT section_name FROM Sections ORDER BY section_name DESC
SELECT T1.semester_id, T1.semester_name FROM Semesters AS T1 INNER JOIN Student_Enrolment AS T2 ON T1.semester_id = T2.semester_id GROUP BY T1.semester_id, T1.semester_name ORDER BY COUNT(T2.student_id) DESC LIMIT 1
SELECT T3.semester_id, T3.semester_name, COUNT(T1.student_id) AS student_count FROM Students AS T1 INNER JOIN Student_Enrolment AS T2 ON T1.student_id = T2.student_id INNER JOIN Semesters AS T3 ON T2.semester_id = T3.semester_id GROUP BY T3.semester_id ORDER BY student_count DESC
SELECT department_description FROM Departments WHERE department_name LIKE '%the computer%'
SELECT department_description FROM Departments WHERE department_name LIKE '%computer%'
SELECT s.first_name, s.middle_name, s.last_name, se.student_id FROM Students s JOIN (SELECT student_id FROM Student_Enrolment GROUP BY student_id HAVING COUNT(DISTINCT degree_program_id) = 2) se ON s.student_id = se.student_id
SELECT T1.first_name, T1.middle_name, T1.last_name, T1.student_id FROM Students AS T1 JOIN Student_Enrolment AS T2 ON T1.student_id = T2.student_id GROUP BY T1.student_id HAVING COUNT(DISTINCT T2.degree_program_id) = 2
SELECT s.first_name, s.middle_name, s.last_name FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id JOIN Degree_Programs dp ON se.degree_program_id = dp.degree_program_id WHERE dp.degree_summary_name = 'Bachelor'
SELECT T1.first_name, T1.middle_name, T1.last_name FROM Students AS T1 JOIN Student_Enrolment AS T2 ON T1.student_id = T2.student_id JOIN Degree_Programs AS T3 ON T2.degree_program_id = T3.degree_program_id WHERE T3.degree_summary_name = 'Bachelor'
SELECT dp.degree_summary_name FROM Student_Enrolment se JOIN Degree_Programs dp ON se.degree_program_id = dp.degree_program_id GROUP BY dp.degree_summary_name ORDER BY COUNT(se.student_id) DESC LIMIT 1; 
SELECT dp.degree_summary_name FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id JOIN Degree_Programs dp ON se.degree_program_id = dp.degree_program_id GROUP BY dp.degree_summary_name ORDER BY COUNT(s.student_id) DESC LIMIT 1; 
SELECT T1.degree_program_id, T1.degree_summary_name FROM Degree_Programs AS T1 INNER JOIN Student_Enrolment AS T2 ON T1.degree_program_id = T2.degree_program_id GROUP BY T1.degree_program_id ORDER BY COUNT(T2.student_id) DESC LIMIT 1
SELECT dp.degree_program_id, dp.degree_summary_name FROM Degree_Programs dp JOIN Student_Enrolment se ON dp.degree_program_id = se.degree_program_id GROUP BY dp.degree_program_id, dp.degree_summary_name ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT      s.student_id,     s.first_name,     s.middle_name,     s.last_name,     COUNT(e.student_enrolment_id) AS num_enrollments FROM      Students s JOIN      Student_Enrolment e ON s.student_id = e.student_id GROUP BY      s.student_id ORDER BY      num_enrollments DESC LIMIT 1; 
SELECT T1.first_name, T1.middle_name, T1.last_name, T1.student_id, COUNT(T2.degree_program_id) AS num_enrollments FROM Students AS T1 INNER JOIN Student_Enrolment AS T2 ON T1.student_id = T2.student_id GROUP BY T1.student_id ORDER BY num_enrollments DESC LIMIT 1
SELECT semester_name FROM Semesters WHERE semester_id NOT IN (SELECT semester_id FROM Student_Enrolment)
SELECT semester_name FROM Semesters WHERE semester_id NOT IN (SELECT semester_id FROM Student_Enrolment)
SELECT T2.course_name FROM Student_Enrolment_Courses AS T1 INNER JOIN Courses AS T2 ON T1.course_id = T2.course_id
SELECT T1.course_name  FROM Courses AS T1  INNER JOIN Sections AS T2 ON T1.course_id = T2.course_id  INNER JOIN Student_Enrolment_Courses AS T3 ON T2.section_id = T3.section_id  GROUP BY T1.course_name; 
SELECT c.course_name FROM Courses c JOIN Sections s ON c.course_id = s.course_id JOIN Student_Enrolment_Courses sec_c ON s.section_id = sec_c.section_id GROUP BY c.course_id ORDER BY COUNT(sec_c.student_course_id) DESC LIMIT 1; 
SELECT T1.course_name FROM Courses AS T1 JOIN Student_Enrolment_Courses AS T2 ON T1.course_id = T2.course_id JOIN Student_Enrolment AS T3 ON T2.student_enrolment_id = T3.student_enrolment_id GROUP BY T1.course_id ORDER BY COUNT(T2.student_course_id) DESC LIMIT 1
SELECT s.last_name FROM Students s JOIN Addresses a ON s.current_address_id = a.address_id WHERE a.state_province_county = 'North Carolina' AND s.student_id NOT IN (SELECT se.student_id FROM Student_Enrolment se)
SELECT last_name FROM Students WHERE current_address_id IN (SELECT address_id FROM Addresses WHERE state_province_county = 'North Carolina') AND student_id NOT IN (SELECT student_id FROM Student_Enrolment)
SELECT T1.transcript_date, T1.transcript_id FROM Transcripts AS T1 JOIN Transcript_Contents AS T2 ON T1.transcript_id = T2.transcript_id GROUP BY T1.transcript_id HAVING COUNT(T2.student_course_id) >= 2
SELECT T1.transcript_date, T1.transcript_id FROM Transcripts AS T1 JOIN Transcript_Contents AS T2 ON T1.transcript_id = T2.transcript_id GROUP BY T1.transcript_id HAVING COUNT(T2.student_course_id) >= 2
SELECT cell_mobile_number FROM Students WHERE first_name = 'Timmothy' AND last_name = 'Ward'
SELECT cell_mobile_number FROM Students WHERE first_name = 'Timmothy' AND last_name = 'Ward'
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_first_registered ASC LIMIT 1
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_first_registered ASC LIMIT 1
SELECT first_name, middle_name, last_name FROM Students WHERE date_left IS NOT NULL ORDER BY date_left ASC LIMIT 1
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_left ASC LIMIT 1; 
SELECT first_name FROM Students WHERE permanent_address_id != current_address_id
SELECT first_name FROM Students WHERE current_address_id != permanent_address_id; 
SELECT T2.address_id, T2.line_1, T2.line_2, T2.line_3, T2.city, T2.zip_postcode, T2.state_province_county, T2.country, T2.other_address_details FROM Students AS T1 INNER JOIN Addresses AS T2 ON T1.current_address_id = T2.address_id GROUP BY T2.address_id ORDER BY COUNT(T1.student_id) DESC LIMIT 1
SELECT T3.address_id, T3.line_1, T3.line_2 FROM Students AS T1 INNER JOIN Student_Enrolment AS T2 ON T1.student_id = T2.student_id INNER JOIN Addresses AS T3 ON T1.current_address_id = T3.address_id GROUP BY T3.address_id ORDER BY COUNT(T1.student_id) DESC LIMIT 1
SELECT AVG(transcript_date) AS average_transcript_date FROM Transcripts; 
SELECT AVG(transcript_date) AS average_transcript_date FROM Transcripts; 
SELECT transcript_date, other_details FROM Transcripts ORDER BY transcript_date ASC LIMIT 1
SELECT MIN(transcript_date), other_details FROM Transcripts
SELECT COUNT(transcript_id) AS total_transcripts FROM Transcripts
SELECT COUNT(transcript_id) FROM TRANSCRIPTS
SELECT transcript_date FROM TRANSCRIPTS ORDER BY transcript_date DESC LIMIT 1; 
SELECT transcript_date FROM TRANSCRIPTS ORDER BY transcript_date DESC LIMIT 1
SELECT student_course_id, COUNT(student_course_id) AS enrollment_count FROM Student_Enrolment_Courses INNER JOIN Transcript_Contents ON Student_Enrolment_Courses.student_course_id = Transcript_Contents.student_course_id GROUP BY student_course_id ORDER BY enrollment_count DESC LIMIT 1
SELECT T1.course_id, COUNT(*) AS appearance_count FROM Student_Enrolment_Courses AS T1 JOIN Transcript_Contents AS T2 ON T1.student_course_id = T2.student_course_id GROUP BY T1.course_id ORDER BY appearance_count DESC LIMIT 1
SELECT T1.transcript_date, T1.transcript_id FROM Transcripts AS T1 JOIN Transcript_Contents AS T2 ON T1.transcript_id = T2.transcript_id GROUP BY T1.transcript_id ORDER BY COUNT(T2.student_course_id) ASC LIMIT 1
SELECT transcript_id, COUNT(*) AS result_count FROM Transcript_Contents GROUP BY transcript_id ORDER BY result_count ASC LIMIT 1
SELECT T2.semester_name  FROM Student_Enrolment AS T1  INNER JOIN Semesters AS T2 ON T1.semester_id = T2.semester_id  WHERE T1.degree_program_id IN (     SELECT degree_program_id      FROM Degree_Programs      WHERE degree_summary_name IN ('Master', 'Bachelor') ) INTERSECT SELECT T2.semester_name  FROM Student_Enrolment AS T1  INNER JOIN Semesters AS T2 ON T1.semester_id = T2.semester_id  WHERE T1.degree_program_id IN (     SELECT degree_program_id      FROM Degree_Programs      WHERE degree_summary_name IN ('Master', 'Bachelor') ) 
SELECT T2.semester_id FROM Students AS T1 INNER JOIN Student_Enrolment AS T2 ON T1.student_id = T2.student_id INNER JOIN Degree_Programs AS T3 ON T2.degree_program_id = T3.degree_program_id WHERE T3.degree_summary_name = 'Master' INTERSECT SELECT T2.semester_id FROM Students AS T1 INNER JOIN Student_Enrolment AS T2 ON T1.student_id = T2.student_id INNER JOIN Degree_Programs AS T3 ON T2.degree_program_id = T3.degree_program_id WHERE T3.degree_summary_name = 'Bachelor'
SELECT COUNT(DISTINCT current_address_id) FROM Students
SELECT DISTINCT T2.line_1, T2.line_2, T2.line_3, T2.city, T2.zip_postcode, T2.state_province_county, T2.country FROM Students AS T1 INNER JOIN Addresses AS T2 ON T1.current_address_id = T2.address_id OR T1.permanent_address_id = T2.address_id
SELECT * FROM Students ORDER BY first_name DESC
SELECT other_student_details FROM Students ORDER BY last_name DESC
SELECT * FROM Sections WHERE section_name = 'h';
SELECT section_description FROM Sections WHERE section_name = 'h'
SELECT T1.first_name FROM Students AS T1 INNER JOIN Addresses AS T2 ON T1.permanent_address_id = T2.address_id WHERE T2.country = 'Haiti' OR T1.cell_mobile_number = '09700166582'
SELECT s.first_name FROM Students s JOIN Addresses a ON s.permanent_address_id = a.address_id WHERE a.country = 'Haiti' OR s.cell_mobile_number = '09700166582'
SELECT Title FROM Cartoon ORDER BY Title ASC 
SELECT Title FROM Cartoon ORDER BY Title
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones'; 
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones' 
SELECT COUNT(id) FROM Cartoon WHERE Written_by = 'Joseph Kuhr'
SELECT COUNT(*) FROM Cartoon WHERE Written_by = 'Joseph Kuhr'
SELECT Title, Directed_by FROM Cartoon ORDER BY Original_air_date
SELECT Title, Directed_by FROM Cartoon ORDER BY Original_air_date
SELECT Title FROM Cartoon WHERE Directed_by IN ('Ben Jones', 'Brandon Vietti')
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones' OR Directed_by = 'Brandon Vietti'
SELECT Country, COUNT(*) FROM TV_Channel GROUP BY Country ORDER BY COUNT(*) DESC LIMIT 1
SELECT Country, COUNT(id) AS Channel_Count FROM TV_Channel GROUP BY Country ORDER BY Channel_Count DESC LIMIT 1
SELECT SUM(COUNT(DISTINCT series_name)) + SUM(COUNT(DISTINCT Content)) AS total_unique_values FROM TV_Channel
SELECT COUNT(DISTINCT series_name, Content) FROM TV_Channel; 
SELECT Content FROM TV_Channel WHERE series_name = 'Sky Radio'
SELECT Content FROM TV_Channel WHERE series_name = 'Sky Radio' 
SELECT Package_Option FROM TV_Channel WHERE series_name = 'Sky Radio'
SELECT Package_Option FROM TV_Channel WHERE series_name = 'Sky Radio'
SELECT COUNT(*) FROM TV_Channel WHERE Language = 'English'
SELECT COUNT(id) FROM TV_Channel WHERE Language = 'English'
SELECT Language, COUNT(*) AS Number_of_Channels FROM TV_Channel GROUP BY Language ORDER BY Number_of_Channels ASC LIMIT 1
SELECT Language, COUNT(id) AS Channel_Count FROM TV_Channel GROUP BY Language ORDER BY Channel_Count ASC LIMIT 1
SELECT Language, COUNT(*) FROM TV_Channel GROUP BY Language
SELECT Language, COUNT(id) AS Number_of_Channels FROM TV_Channel GROUP BY Language
SELECT T1.series_name FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Title = 'The Rise of the Blue Beetle!'
SELECT T1.series_name FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Title = 'The Rise of the Blue Beetle'
SELECT T1.Title FROM Cartoon AS T1 JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T2.series_name = 'Sky Radio'
SELECT T1.Title FROM Cartoon AS T1 JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T2.series_name = 'Sky Radio'
SELECT Episode FROM TV_series ORDER BY Rating
SELECT Episode FROM TV_series ORDER BY Rating DESC
SELECT Episode, Rating FROM TV_series ORDER BY Rating DESC LIMIT 3
SELECT Episode, Rating FROM TV_series ORDER BY Rating DESC LIMIT 3
SELECT MIN(Share), MAX(Share) FROM TV_series; 
SELECT max(Share) ,  min(Share) FROM TV_series
SELECT Air_Date FROM TV_series WHERE Episode = 'A Love of a Lifetime'
SELECT Air_Date FROM TV_series WHERE Title = 'A Love of a Lifetime' 
SELECT Weekly_Rank FROM TV_series WHERE Episode = 'A Love of a Lifetime'
SELECT Weekly_Rank FROM TV_series WHERE Episode = 'A Love of a Lifetime'
SELECT T2.series_name FROM TV_series AS T1 INNER JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T1.Episode = 'A Love of a Lifetime'
SELECT Title FROM TV_series WHERE Episode = 'A Love of a Lifetime'
SELECT DISTINCT T2.Episode FROM TV_Channel AS T1 INNER JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T1.series_name = 'Sky Radio'
SELECT T2.Episode FROM TV_Channel AS T1 INNER JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T1.series_name = 'Sky Radio'
SELECT Directed_by, COUNT(*) FROM Cartoon GROUP BY Directed_by
SELECT director, COUNT(*) AS number_of_cartoons FROM Cartoon GROUP BY director; 
SELECT production_code, channel FROM Cartoon ORDER BY Original_air_date DESC LIMIT 1
SELECT production_code ,  channel FROM Cartoon ORDER BY Original_air_date DESC LIMIT 1
SELECT Package_Option, series_name FROM TV_Channel WHERE Hight_definition_TV = 'yes'
SELECT Package_Option, series_name FROM TV_Channel WHERE Hight_definition_TV = 'yes'
SELECT DISTINCT T2.Country FROM Cartoon AS T1 INNER JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T1.Written_by = 'Todd Casey'
SELECT DISTINCT T2.Country FROM Cartoon AS T1 INNER JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T1.Written_by = 'Todd Casey' 
SELECT DISTINCT Country FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Written_by = 'Todd Casey')
SELECT Country FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Written_by = 'Todd Casey')
SELECT T2.series_name, T2.Country FROM Cartoon AS T1 INNER JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T1.Directed_by LIKE '%Ben Jones%' AND T1.Directed_by LIKE '%Michael Chang%'
SELECT T2.series_name, T2.Country FROM Cartoon AS T1 INNER JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T1.directed_by IN ('Ben Jones', 'Michael Chang') 
SELECT Pixel_aspect_ratio_PAR, Country FROM TV_Channel WHERE Language != 'English'
SELECT Pixel_aspect_ratio_PAR, Country FROM TV_Channel WHERE Language != 'English'
SELECT id FROM TV_Channel GROUP BY Country HAVING COUNT(id) > 2
SELECT Channel  FROM (     SELECT Channel, COUNT(*) AS count FROM TV_series GROUP BY Channel     UNION ALL     SELECT Channel, COUNT(*) AS count FROM Cartoon GROUP BY Channel ) AS combined_counts WHERE count > 2; 
SELECT id FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones')
SELECT id  FROM TV_Channel  WHERE id NOT IN (     SELECT Channel      FROM Cartoon      WHERE Directed_by = 'Ben Jones' ) 
SELECT Package_Option FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones')
SELECT Package_Option FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones')
SELECT COUNT(*) FROM poker_player
SELECT COUNT(*) FROM poker_player; 
SELECT Earnings FROM poker_player ORDER BY Earnings DESC
SELECT Earnings FROM poker_player ORDER BY Earnings DESC
SELECT Final_Table_Made, Best_Finish FROM poker_player
SELECT Final_Table_Made, Best_Finish FROM poker_player
SELECT AVG(Earnings) AS Average_Earnings FROM poker_player
SELECT AVG(Earnings) FROM poker_player
SELECT Money_Rank FROM poker_player ORDER BY Earnings DESC LIMIT 1
SELECT Money_Rank FROM poker_player ORDER BY Earnings DESC LIMIT 1
SELECT MAX(Final_Table_Made) FROM poker_player WHERE Earnings < 200000
SELECT MAX(Final_Table_Made) FROM poker_player WHERE Earnings < 200000
SELECT T2.Name FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID
SELECT T2.Name FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID
SELECT T2.Name FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID WHERE T1.Earnings > 300000
SELECT p.Name FROM people AS p JOIN poker_player AS pp ON p.People_ID = pp.People_ID WHERE pp.Earnings > 300000
SELECT T2.Name FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Final_Table_Made ASC
SELECT T2.Name FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Final_Table_Made ASC
SELECT T2.Birth_Date FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Earnings ASC LIMIT 1; 
SELECT T2.Birth_Date FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Earnings ASC LIMIT 1
SELECT T1.Money_Rank FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T2.Height DESC LIMIT 1
SELECT T1.Money_Rank FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T2.Height DESC LIMIT 1
SELECT AVG(T1.Earnings) FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID WHERE T2.Height > 200
SELECT AVG(T1.Earnings) FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID WHERE T2.Height > 200
SELECT T1.Name FROM people AS T1 INNER JOIN poker_player AS T2 ON T1.People_ID = T2.People_ID ORDER BY T2.Earnings DESC
SELECT T1.Name FROM people AS T1 INNER JOIN poker_player AS T2 ON T1.People_ID = T2.People_ID ORDER BY T2.Earnings DESC
SELECT Nationality, COUNT(*) FROM people GROUP BY Nationality
SELECT Nationality, COUNT(People_ID) AS NumberOfPeople FROM people GROUP BY Nationality
SELECT Nationality FROM people GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT Nationality FROM people GROUP BY Nationality ORDER BY COUNT(Nationality) DESC LIMIT 1
SELECT Nationality FROM people GROUP BY Nationality HAVING COUNT(Nationality) >= 2
SELECT Nationality FROM people GROUP BY Nationality HAVING COUNT(*) >= 2; 
SELECT Name, Birth_Date FROM people ORDER BY Name ASC
SELECT Name, Birth_Date FROM people ORDER BY Name
SELECT Name FROM people WHERE Nationality != 'Russia'
SELECT Name FROM people WHERE Nationality != 'Russia'
SELECT Name FROM people WHERE People_ID NOT IN (SELECT People_ID FROM poker_player)
SELECT Name FROM people WHERE People_ID NOT IN (SELECT People_ID FROM poker_player)
SELECT COUNT(DISTINCT Nationality) FROM people; 
SELECT COUNT(DISTINCT Nationality) FROM people
SELECT COUNT(DISTINCT state) AS number_of_states FROM AREA_CODE_STATE
SELECT contestant_number, contestant_name FROM CONTESTANTS ORDER BY contestant_name DESC
SELECT vote_id, phone_number, state FROM VOTES
SELECT MAX(area_code), MIN(area_code) FROM AREA_CODE_STATE; 
SELECT MAX(created) AS last_date_created FROM VOTES WHERE state = 'CA'
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name != 'Jessie Alloway'
SELECT DISTINCT state, created FROM VOTES; 
SELECT T2.contestant_number, T2.contestant_name FROM VOTES AS T1 INNER JOIN CONTESTANTS AS T2 ON T1.contestant_number = T2.contestant_number GROUP BY T2.contestant_number HAVING COUNT(T1.vote_id) >= 2
SELECT C.contestant_number, C.contestant_name FROM CONTESTANTS AS C JOIN VOTES AS V ON C.contestant_number = V.contestant_number GROUP BY C.contestant_number ORDER BY COUNT(V.vote_id) ASC LIMIT 1
SELECT COUNT(*) FROM VOTES WHERE state IN ('NY', 'CA')
SELECT COUNT(*) - COUNT(DISTINCT contestant_number) AS no_votes FROM CONTESTANTS
SELECT T1.area_code FROM AREA_CODE_STATE AS T1 JOIN VOTES AS T2 ON T1.state = T2.state GROUP BY T1.area_code ORDER BY COUNT(T2.vote_id) DESC LIMIT 1
SELECT T1.created, T1.state, T1.phone_number FROM VOTES AS T1 INNER JOIN CONTESTANTS AS T2 ON T1.contestant_number = T2.contestant_number WHERE T2.contestant_name = 'Tabatha Gehling'
SELECT T.area_code FROM ( SELECT DISTINCT T1.area_code FROM VOTES AS T1 INNER JOIN CONTESTANTS AS T2 ON T1.contestant_number = T2.contestant_number WHERE T2.contestant_name = 'Tabatha Gehling' ) AS T INTERSECT SELECT T.area_code FROM ( SELECT DISTINCT T1.area_code FROM VOTES AS T1 INNER JOIN CONTESTANTS AS T2 ON T1.contestant_number = T2.contestant_number WHERE T2.contestant_name = 'Kelly Clauss' ) AS T
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name LIKE '%Al%'
SELECT Name FROM country WHERE IndepYear > 1950
SELECT Name FROM country WHERE IndepYear > 1950
SELECT COUNT(*) FROM country WHERE GovernmentForm = 'Republic'; 
SELECT COUNT(Code) FROM country WHERE GovernmentForm = 'Republic'
SELECT SUM(SurfaceArea) FROM country WHERE Region = 'Caribbean'
SELECT SUM(surfacearea) FROM country WHERE region = 'Caribbean'
SELECT T1.Continent FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.Name = 'Anguilla' 
SELECT T1.Continent FROM country AS T1 INNER JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T2.Name = 'Anguilla'
SELECT T2.Region FROM city AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T1.Name = 'Kabul'
SELECT Region FROM country WHERE Code = (SELECT CountryCode FROM city WHERE Name = 'Kabul') 
SELECT Language FROM countrylanguage WHERE CountryCode = (SELECT Code FROM country WHERE Name = 'Aruba') ORDER BY Percentage DESC LIMIT 1
SELECT Language FROM countrylanguage WHERE CountryCode = (SELECT Code FROM country WHERE Name = 'Aruba') ORDER BY Percentage DESC LIMIT 1
SELECT T1.Population, T1.LifeExpectancy FROM country AS T1 INNER JOIN country AS T2 ON T1.Code = T2.Code WHERE T2.Name = 'Brazil'
SELECT Population, LifeExpectancy FROM country WHERE Name = 'Brazil'
SELECT Region, Population FROM country WHERE Name = 'Angola'
SELECT Region, Population FROM country WHERE Name = 'Angola'
SELECT AVG(LifeExpectancy) FROM country WHERE Region = 'Central Africa'
SELECT AVG(LifeExpectancy) FROM country WHERE Continent = 'Central Africa'
SELECT Name  FROM country  WHERE Continent = 'Asia'  ORDER BY LifeExpectancy ASC  LIMIT 1; 
SELECT Name FROM country WHERE Continent = 'Asia' ORDER BY LifeExpectancy ASC LIMIT 1
SELECT SUM(T1.Population), MAX(T1.GNP) FROM country AS T1 JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T1.Continent = 'Asia'
SELECT SUM(Population), MAX(GNP) FROM country WHERE Continent = 'Asia'
SELECT avg(LifeExpectancy) FROM country WHERE Continent = 'Africa' AND GovernmentForm = 'Republic'
SELECT AVG(LifeExpectancy) FROM country WHERE Continent = 'Africa' AND GovernmentForm = 'Republic'
SELECT SUM(SurfaceArea) FROM country WHERE Continent IN ('Asia', 'Europe')
SELECT SUM(SurfaceArea) FROM country WHERE Continent IN ('Asia', 'Europe')
SELECT SUM(Population) FROM city WHERE District = 'Gelderland'
SELECT SUM(Population) FROM city WHERE District = 'Gelderland'
SELECT AVG(GNP), SUM(Population) FROM country WHERE GovernmentForm = 'US Territory'
SELECT AVG(GNP), SUM(Population) FROM country WHERE Name LIKE '%United States%' OR GovernmentForm = 'Federal Republic'
SELECT COUNT(DISTINCT Language) AS NumberOfUniqueLanguages FROM countrylanguage
SELECT COUNT(DISTINCT Language) FROM countrylanguage
SELECT COUNT(DISTINCT GovernmentForm) FROM country WHERE Continent = 'Africa'
SELECT COUNT(DISTINCT GovernmentForm) FROM country WHERE Continent = 'Africa'
SELECT COUNT(*) FROM countrylanguage WHERE CountryCode = (SELECT Code FROM country WHERE Name = 'Aruba')
SELECT COUNT(*)  FROM country AS T1  INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode  WHERE T1.Name = 'Aruba' AND T2.IsOfficial = 'T'; 
SELECT COUNT(Language) FROM countrylanguage WHERE CountryCode = 'AFG' AND IsOfficial = 'T';
SELECT COUNT(Language) FROM countrylanguage WHERE CountryCode = 'AFG' AND IsOfficial = 'T'
SELECT T2.Name FROM countrylanguage AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code GROUP BY T1.CountryCode ORDER BY COUNT(DISTINCT T1.Language) DESC LIMIT 1
{     "chain_of_thought_reasoning": "We start by selecting the country name from the country table. We then join the countrylanguage table on the country code to link each language to its respective country. By grouping the results by the country code and counting the distinct languages for each group, we can determine the number of languages used in each country. Finally, we sort the countries by the number of languages in descending order and limit the result to the top row to get the country with the most languages.",     "SQL": "SELECT T1.Name FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T
SELECT T1.Continent, COUNT(DISTINCT T2.Language) AS LanguageCount FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode GROUP BY T1.Continent ORDER BY LanguageCount DESC LIMIT 1; 
SELECT T1.Continent, T2.Language, COUNT(T3.ID) AS LanguageCount FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode INNER JOIN city AS T3 ON T1.Code = T3.CountryCode GROUP BY T1.Continent, T2.Language ORDER BY LanguageCount DESC LIMIT 1
SELECT COUNT(*) FROM (     SELECT CountryCode FROM countrylanguage WHERE Language = 'English'     INTERSECT     SELECT CountryCode FROM countrylanguage WHERE Language = 'Dutch' ) 
SELECT COUNT(DISTINCT T2.Code) FROM countrylanguage AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T1.Language = 'English' AND T1.IsOfficial = 'T' AND EXISTS (SELECT 1 FROM countrylanguage AS T3 WHERE T3.CountryCode = T2.Code AND T3.Language = 'Dutch' AND T3.IsOfficial = 'T')
SELECT T1.Name FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'English' INTERSECT SELECT T1.Name FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'French'
SELECT T.Name FROM (     SELECT T1.CountryCode     FROM countrylanguage AS T1     WHERE T1.Language = 'English'     INTERSECT     SELECT T2.CountryCode     FROM countrylanguage AS T2     WHERE T2.Language = 'French' ) AS CommonCountries JOIN country AS T ON CommonCountries.CountryCode = T.Code; 
   SELECT CountryCode FROM countrylanguage WHERE Language = 'English'    
SELECT T2.Name FROM countrylanguage AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T1.Language = 'English' AND T1.IsOfficial = 'T' INTERSECT SELECT T2.Name FROM countrylanguage AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T1.Language = 'French' AND T1.IsOfficial = 'T'
SELECT COUNT(DISTINCT T1.Continent) FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode INNER JOIN city AS T3 ON T1.Code = T3.CountryCode WHERE T2.Language = 'Chinese'
SELECT COUNT(DISTINCT T2.Continent) AS NumberOfContinentsSpeakingChinese FROM countrylanguage AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T1.Language = 'Chinese'; 
SELECT DISTINCT T2.Region FROM countrylanguage AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T1.Language IN ('English', 'Dutch')
SELECT DISTINCT T2.Region FROM countrylanguage AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T1.Language IN ('Dutch', 'English')
SELECT DISTINCT T1.Name FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language IN ('English', 'Dutch') AND T2.IsOfficial = 'T'; 
SELECT T2.Name FROM countrylanguage AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE (T1.Language = 'English' OR T1.Language = 'Dutch') AND T1.IsOfficial = 'T'
SELECT T2.Language FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.Continent = 'Asia' GROUP BY T2.Language ORDER BY COUNT(T2.Language) DESC LIMIT 1 
SELECT T2.Language FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.Continent = 'Asia' GROUP BY T2.Language ORDER BY COUNT(T2.Language) DESC LIMIT 1
SELECT T2.Language FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.GovernmentForm = 'Republic' GROUP BY T2.Language HAVING COUNT(T2.Language) = 1
SELECT T2.Language FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.GovernmentForm = 'Republic' GROUP BY T2.Language HAVING COUNT(T2.Language) = 1 
SELECT T1.Name FROM city AS T1 INNER JOIN countrylanguage AS T2 ON T1.CountryCode = T2.CountryCode INNER JOIN country AS T3 ON T2.CountryCode = T3.Code WHERE T2.Language = 'English' ORDER BY T1.Population DESC LIMIT 1; 
SELECT T1.Name FROM city AS T1 JOIN countrylanguage AS T2 ON T1.CountryCode = T2.CountryCode JOIN country AS T3 ON T1.CountryCode = T3.Code WHERE T2.Language = 'English' ORDER BY T1.Population DESC LIMIT 1
SELECT Name, Population, LifeExpectancy FROM country WHERE Continent = 'Asia' ORDER BY SurfaceArea DESC LIMIT 1
SELECT Name, Population, LifeExpectancy FROM country WHERE Continent = 'Asia' ORDER BY SurfaceArea DESC LIMIT 1
SELECT AVG(T2.LifeExpectancy) FROM countrylanguage AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T1.Language != 'English' AND T1.IsOfficial = 'F'
SELECT AVG(T1.LifeExpectancy) FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'English' AND T2.IsOfficial = 'F'
  SELECT Code FROM countrylanguage WHERE Language = 'English' AND IsOfficial = 'F'   
SELECT SUM(T1.Population) FROM country AS T1 LEFT JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language != 'English'
SELECT T2.Language FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.HeadOfState = 'Beatrix' AND T2.IsOfficial = 'T'
SELECT DISTINCT T2.Language FROM country AS T1 INNER JOIN city AS T2 ON T1.Code = T2.CountryCode INNER JOIN countrylanguage AS T3 ON T2.CountryCode = T3.CountryCode WHERE T1.HeadOfState = 'Beatrix' AND T3.IsOfficial = 'T'
SELECT COUNT(DISTINCT T2.Language) FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.IndepYear < 1930
SELECT COUNT(DISTINCT T2.Language) FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.IndepYear < 1930
SELECT Name FROM country WHERE SurfaceArea > ( SELECT MAX(SurfaceArea) FROM country WHERE Continent = 'Europe' )
SELECT Name FROM country WHERE Area > ( SELECT MAX(Area) FROM country WHERE Continent = 'Europe' )
  SELECT MIN(Population)   FROM country   WHERE Continent = 'Asia'   
  SELECT MAX(Population) FROM country WHERE Continent = 'Asia'   
SELECT Name FROM country WHERE Continent = 'Asia' AND Population > (     SELECT MAX(Population)     FROM country     WHERE Continent = 'Africa' ); 
SELECT Name FROM country WHERE Continent = 'Asia' AND Population > ( SELECT MAX(Population) FROM country WHERE Continent = 'Africa' )
SELECT DISTINCT T2.Code FROM countrylanguage AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T1.Language != 'English' 
SELECT CountryCode FROM countrylanguage WHERE Language != 'English'
SELECT DISTINCT T2.Code FROM countrylanguage AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T1.Language != 'English' OR T1.IsOfficial != 'T' 
SELECT CountryCode FROM countrylanguage WHERE Language != 'English'
SELECT T1.Code FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language != 'English' AND T1.GovernmentForm != 'Republic'
SELECT Code FROM country WHERE GovernmentForm != 'Republic' EXCEPT SELECT T1.Code FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'English'
SELECT DISTINCT T1.Name FROM city AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code JOIN countrylanguage AS T3 ON T2.Code = T3.CountryCode WHERE T2.Continent = 'Europe' AND T3.Language = 'English' AND T3.IsOfficial = 'F'; 
SELECT T1.Name FROM city AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code JOIN countrylanguage AS T3 ON T2.Code = T3.CountryCode WHERE T2.Continent = 'Europe' AND T3.Language != 'English' 
SELECT DISTINCT T1.Name FROM city AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code JOIN countrylanguage AS T3 ON T2.Code = T3.CountryCode WHERE T2.Continent = 'Asia' AND T3.Language = 'Chinese' AND T3.IsOfficial = 'T'; 
SELECT T1.Name FROM city AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code 
SELECT Name, IndepYear, SurfaceArea FROM country ORDER BY Population ASC LIMIT 1
SELECT Name, IndepYear, SurfaceArea FROM country ORDER BY Population ASC LIMIT 1
SELECT population, name, headofstate FROM country ORDER BY SurfaceArea DESC LIMIT 1
SELECT Name, Population, HeadOfState FROM country ORDER BY SurfaceArea DESC LIMIT 1
SELECT T1.Name, COUNT(T2.Language) AS NumLanguages FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode GROUP BY T1.Code HAVING COUNT(T2.Language) >= 3
SELECT T2.Name, COUNT(DISTINCT T1.Language) AS NumberOfLanguages FROM countrylanguage AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code GROUP BY T1.CountryCode HAVING COUNT(DISTINCT T1.Language) > 2; 
SELECT District, COUNT(*) FROM city WHERE Population > ( SELECT AVG(Population) FROM city ) GROUP BY District
  SELECT AVG(Population) FROM city   
SELECT T1.GovernmentForm, SUM(T1.Population) FROM country AS T1 JOIN (     SELECT GovernmentForm, AVG(LifeExpectancy) AS AvgLifeExpectancy     FROM country     GROUP BY GovernmentForm ) AS T2 ON T1.GovernmentForm = T2.GovernmentForm WHERE T2.AvgLifeExpectancy > 72 GROUP BY T1.GovernmentForm; 
SELECT DISTINCT T1.GovernmentForm, SUM(T1.Population) FROM country AS T1 GROUP BY T1.GovernmentForm HAVING AVG(T1.LifeExpectancy) > 72 
SELECT Continent, AVG(LifeExpectancy) AS AvgLifeExpectancy, SUM(Population) AS TotalPopulation FROM country GROUP BY Continent HAVING AVG(LifeExpectancy) < 72
SELECT DISTINCT Continent, SUM(Population), AVG(LifeExpectancy) FROM country GROUP BY Continent HAVING AVG(LifeExpectancy) < 72
SELECT Name, SurfaceArea FROM country ORDER BY SurfaceArea DESC LIMIT 5
SELECT Name, SurfaceArea FROM country ORDER BY SurfaceArea DESC LIMIT 5
SELECT Name FROM country ORDER BY Population DESC LIMIT 3
SELECT Name FROM country ORDER BY Population DESC LIMIT 3
SELECT Name FROM country ORDER BY Population ASC LIMIT 3
SELECT Name FROM country ORDER BY Population ASC LIMIT 3
SELECT COUNT(Code) FROM country WHERE Continent = 'Asia'
SELECT COUNT(Code) FROM country WHERE Continent = 'Asia' 
SELECT Name FROM country WHERE Continent = 'Europe' AND Population = 80000
SELECT Name FROM country WHERE Continent = 'Europe' AND Population = 80000; 
SELECT sum(Population), avg(SurfaceArea) FROM country WHERE Continent = 'North America' AND SurfaceArea > 3000
SELECT SUM(Population), AVG(SurfaceArea) FROM country WHERE Continent = 'North America' AND SurfaceArea > 3000
SELECT Name FROM city WHERE Population BETWEEN 160000 AND 900000
SELECT Name FROM city WHERE Population BETWEEN 160000 AND 900000
SELECT Language FROM countrylanguage GROUP BY Language ORDER BY COUNT(*) DESC LIMIT 1
SELECT Language FROM countrylanguage GROUP BY Language ORDER BY COUNT(DISTINCT CountryCode) DESC LIMIT 1; 
SELECT cl.CountryCode, cl.Language, cl.Percentage FROM countrylanguage cl WHERE cl.Percentage = ( SELECT MAX(cl2.Percentage) FROM countrylanguage cl2 WHERE cl2.CountryCode = cl.CountryCode )
SELECT T1.Code, T2.Language FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode ORDER BY T1.Code, T2.Percentage DESC GROUP BY T1.Code
SELECT COUNT(CountryCode) AS TotalCountries FROM (     SELECT CountryCode     FROM countrylanguage     WHERE Language = 'Spanish'     GROUP BY CountryCode     ORDER BY MAX(Percentage) DESC     LIMIT 1 ) 
SELECT COUNT(DISTINCT CountryCode) FROM countrylanguage WHERE Language = 'Spanish' AND Percentage >= 50
SELECT CountryCode FROM countrylanguage WHERE Language = 'Spanish' ORDER BY Percentage DESC LIMIT 1
SELECT CountryCode FROM countrylanguage WHERE Language = 'Spanish' AND Percentage > 50
SELECT COUNT(*) FROM conductor
SELECT COUNT(*) FROM conductor
SELECT Name FROM conductor ORDER BY Age ASC
SELECT Name FROM conductor ORDER BY Age ASC
SELECT Name FROM conductor WHERE Nationality != 'USA'
SELECT Name FROM conductor WHERE Nationality != 'USA'
SELECT Record_Company FROM orchestra ORDER BY Year_of_Founded DESC
SELECT Record_Company FROM orchestra ORDER BY Year_of_Founded DESC
SELECT AVG(Attendance) FROM show
SELECT AVG(Attendance) FROM show
SELECT MAX(Share), MIN(Share) FROM performance WHERE Type != 'Live final'
SELECT MAX(Share), MIN(Share) FROM performance WHERE Type != 'Live final' 
SELECT COUNT(DISTINCT Nationality) FROM conductor
SELECT COUNT(DISTINCT Nationality) FROM conductor
SELECT Name FROM conductor ORDER BY Year_of_Work DESC
SELECT Name FROM conductor ORDER BY Year_of_Work DESC
SELECT Name FROM conductor ORDER BY Year_of_Work DESC LIMIT 1
SELECT Name FROM conductor ORDER BY Year_of_Work DESC LIMIT 1
SELECT T1.Name, T2.Orchestra FROM conductor AS T1 INNER JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID 
SELECT T1.Name, T2.Orchestra FROM conductor AS T1 INNER JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID
SELECT T.Name FROM conductor AS T JOIN orchestra AS O ON T.Conductor_ID = O.Conductor_ID GROUP BY T.Conductor_ID HAVING COUNT(O.Orchestra_ID) > 1
SELECT T1.Name FROM conductor AS T1 INNER JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID GROUP BY T1.Name HAVING COUNT(T2.Orchestra_ID) > 1
SELECT c.Name FROM conductor AS c JOIN orchestra AS o ON c.Conductor_ID = o.Conductor_ID GROUP BY c.Name ORDER BY COUNT(o.Orchestra_ID) DESC LIMIT 1; 
SELECT c.Name, COUNT(DISTINCT o.Orchestra) AS NumberOfOrchestras FROM conductor c JOIN orchestra o ON c.Conductor_ID = o.Conductor_ID GROUP BY c.Name ORDER BY NumberOfOrchestras DESC LIMIT 1; 
SELECT T1.Name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID WHERE T2.Year_of_Founded > 2008
SELECT T1.Name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID WHERE T2.Year_of_Founded > 2008
SELECT Record_Company, COUNT(*) FROM orchestra GROUP BY Record_Company 
SELECT Record_Company, COUNT(*) AS Number_of_Orchestras FROM orchestra GROUP BY Record_Company;
SELECT Major_Record_Format, COUNT(*) AS Format_Count FROM orchestra GROUP BY Major_Record_Format ORDER BY Format_Count ASC; 
SELECT Major_Record_Format, COUNT(*) AS Frequency FROM orchestra GROUP BY Major_Record_Format ORDER BY Frequency DESC
SELECT Record_Company FROM orchestra GROUP BY Record_Company ORDER BY COUNT(*) DESC LIMIT 1
SELECT Record_Company FROM orchestra GROUP BY Record_Company ORDER BY COUNT(*) DESC LIMIT 1
SELECT Orchestra FROM orchestra WHERE Orchestra_ID NOT IN (     SELECT Orchestra_ID     FROM performance ) 
   SELECT Orchestra_ID FROM performance    
SELECT T2.Record_Company FROM orchestra AS T1 INNER JOIN performance AS T2 ON T1.Orchestra_ID = T2.Orchestra_ID WHERE T1.Year_of_Founded < 2003 INTERSECT SELECT T2.Record_Company FROM orchestra AS T1 INNER JOIN performance AS T2 ON T1.Orchestra_ID = T2.Orchestra_ID WHERE T1.Year_of_Founded > 2003 
SELECT Record_Company FROM orchestra WHERE Year_of_Founded < 2003 INTERSECT SELECT Record_Company FROM orchestra WHERE Year_of_Founded > 2003
SELECT COUNT(*) FROM orchestra WHERE Major_Record_Format IN ('CD', 'DVD')
SELECT COUNT(Orchestra_ID) FROM orchestra WHERE Major_Record_Format IN ('CD', 'DVD') 
SELECT T1.Year_of_Founded FROM orchestra AS T1 JOIN performance AS T2 ON T1.Orchestra_ID = T2.Orchestra_ID GROUP BY T1.Orchestra_ID HAVING COUNT(T2.Performance_ID) > 1; 
SELECT T1.Year_of_Founded FROM orchestra AS T1 INNER JOIN performance AS T2 ON T1.Orchestra_ID = T2.Orchestra_ID GROUP BY T1.Orchestra_ID HAVING COUNT(T2.Performance_ID) > 1; 
SELECT COUNT(*) FROM Highschooler
SELECT COUNT(ID) FROM Highschooler
SELECT name, grade FROM Highschooler
SELECT name, grade FROM Highschooler
SELECT grade FROM Highschooler
SELECT grade FROM Highschooler
SELECT grade FROM Highschooler WHERE name = 'Kyle'
SELECT grade FROM Highschooler WHERE name = 'Kyle'
SELECT name FROM Highschooler WHERE grade = 10
SELECT name FROM Highschooler WHERE grade = 10
SELECT ID FROM Highschooler WHERE name = 'Kyle'
SELECT ID FROM Highschooler WHERE name = 'Kyle'
SELECT COUNT(*) FROM Highschooler WHERE grade = 9 OR grade = 10
SELECT COUNT(*) FROM Highschooler WHERE grade = 9 OR grade = 10
SELECT count(id) ,  grade FROM Highschooler GROUP BY grade
SELECT grade, COUNT(*) FROM Highschooler GROUP BY grade
SELECT grade FROM Highschooler GROUP BY grade ORDER BY COUNT(*) DESC LIMIT 1
SELECT grade FROM Highschooler GROUP BY grade ORDER BY COUNT(*) DESC LIMIT 1
   GROUP BY grade    
SELECT grade  FROM Highschooler  GROUP BY grade  HAVING COUNT(*) >= 4; 
SELECT student_id, COUNT(friend_id) AS number_of_friends FROM Friend GROUP BY student_id
SELECT student_id, COUNT(friend_id) AS friend_count FROM Friend GROUP BY student_id
SELECT T1.name, COUNT(*) AS num_friends FROM Highschooler AS T1 INNER JOIN Friend AS T2 ON T1.ID = T2.student_id GROUP BY T2.student_id; 
SELECT T1.name, COUNT(T2.friend_id) AS num_friends FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id GROUP BY T1.name; 
SELECT T1.name FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id GROUP BY T1.ID ORDER BY COUNT(T2.friend_id) DESC LIMIT 1
SELECT T1.name FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id GROUP BY T2.student_id ORDER BY COUNT(T2.friend_id) DESC LIMIT 1
SELECT T1.name FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id GROUP BY T1.name HAVING COUNT(T2.friend_id) >= 3
SELECT T1.name FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id GROUP BY T1.ID HAVING COUNT(T2.friend_id) >= 3
SELECT T2.name FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id WHERE T1.name = 'Kyle'
SELECT T2.name FROM Highschooler AS T1 JOIN Highschooler AS T2 ON T1.ID = T2.ID WHERE T1.name = 'Kyle' AND T1.ID IN (SELECT friend_id FROM Friend WHERE student_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle'))
SELECT COUNT(*) FROM Friend WHERE student_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle') OR friend_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle')
SELECT COUNT(*) FROM Friend WHERE student_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle') OR friend_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle')
SELECT id FROM highschooler WHERE id NOT IN ( SELECT student_id FROM friend ) AND id NOT IN ( SELECT friend_id FROM friend )
SELECT ID FROM Highschooler EXCEPT SELECT student_id FROM Friend 
SELECT name FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend)
SELECT name FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend)
SELECT student_id FROM Friend INTERSECT SELECT liked_id FROM Likes
SELECT student_id FROM Friend INTERSECT SELECT student_id FROM Likes
SELECT T1.name FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id INTERSECT SELECT T1.name FROM Highschooler AS T1 JOIN Likes AS T2 ON T1.ID = T2.student_id 
SELECT T1.name FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id INTERSECT SELECT T1.name FROM Highschooler AS T1 JOIN Likes AS T2 ON T1.ID = T2.student_id
   SELECT student_id, COUNT(*) AS num_likes    FROM Likes    GROUP BY student_id;    
SELECT student_id, COUNT(*) AS num_likes FROM Likes GROUP BY student_id
SELECT T1.name, COUNT(T2.student_id) AS num_likes FROM Highschooler AS T1 JOIN Likes AS T2 ON T1.ID = T2.liked_id GROUP BY T1.ID
SELECT T1.name, COUNT(T2.student_id) AS like_count FROM Highschooler AS T1 JOIN Likes AS T2 ON T1.ID = T2.liked_id GROUP BY T1.ID
SELECT T1.name FROM Highschooler AS T1 JOIN Likes AS T2 ON T1.ID = T2.student_id GROUP BY T2.student_id ORDER BY COUNT(T2.liked_id) DESC LIMIT 1
SELECT T1.name FROM Highschooler AS T1 JOIN Likes AS T2 ON T1.ID = T2.liked_id GROUP BY T2.liked_id ORDER BY COUNT(T2.student_id) DESC LIMIT 1
SELECT T1.name FROM Highschooler AS T1 JOIN Likes AS T2 ON T1.ID = T2.liked_id GROUP BY T2.liked_id HAVING COUNT(T2.student_id) >= 2
SELECT T1.name FROM Highschooler AS T1 JOIN Likes AS T2 ON T1.ID = T2.student_id GROUP BY T2.student_id HAVING COUNT(T2.liked_id) >= 2
SELECT T1.name FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id WHERE T1.grade > 5 GROUP BY T1.ID HAVING COUNT(T2.friend_id) >= 2
SELECT T1.name  FROM Highschooler AS T1  JOIN Friend AS T2 ON T1.ID = T2.student_id  WHERE T1.grade > 5  GROUP BY T1.ID  HAVING COUNT(T2.friend_id) >= 2; 
  SELECT COUNT(T2.liked_id)   
SELECT COUNT(*) FROM Likes WHERE liked_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle')
SELECT AVG(grade) FROM Highschooler WHERE ID IN (SELECT student_id FROM Friend)
SELECT AVG(T1.grade) FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id
SELECT MIN(grade) FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend)
SELECT MIN(grade) FROM Highschooler WHERE id NOT IN (     SELECT DISTINCT student_id FROM Friend ) 
SELECT state FROM Owners INTERSECT SELECT state FROM Professionals
SELECT state FROM Owners INTERSECT SELECT state FROM Professionals; 
SELECT AVG(T1.age) FROM Dogs AS T1 INNER JOIN Treatments AS T2 ON T1.dog_id = T2.dog_id WHERE T2.treatment_id IS NOT NULL
SELECT AVG(Dogs.age) FROM Dogs JOIN Treatments ON Dogs.dog_id = Treatments.dog_id
SELECT P.professional_id, P.last_name, P.cell_number FROM Professionals AS P JOIN ( 	SELECT professional_id, COUNT(*) AS num_treatments 	FROM Treatments 	GROUP BY professional_id ) AS T ON P.professional_id = T.professional_id WHERE P.state = 'Indiana' AND T.num_treatments > 2; 
SELECT p.professional_id, p.last_name, p.cell_number FROM Professionals p JOIN Treatments t ON p.professional_id = t.professional_id WHERE p.state = 'Indiana' OR (p.state != 'Indiana' AND COUNT(t.treatment_id) > 2)
SELECT d.name FROM Dogs d JOIN Treatments t ON d.dog_id = t.dog_id JOIN Charges c ON t.charge_id = c.charge_id GROUP BY d.dog_id HAVING SUM(c.charge_amount) <= 1000
SELECT DISTINCT D.name FROM Dogs AS D JOIN Treatments AS T ON D.dog_id = T.dog_id GROUP BY D.dog_id HAVING SUM(T.cost_of_treatment) <= 1000
SELECT DISTINCT first_name FROM Owners UNION SELECT DISTINCT first_name FROM Professionals EXCEPT SELECT DISTINCT name FROM Dogs; 
SELECT DISTINCT first_name FROM Professionals EXCEPT SELECT DISTINCT first_name FROM Owners EXCEPT SELECT DISTINCT name FROM Dogs
SELECT professional_id, role_code, email_address FROM Professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments)
SELECT professional_id, role_code, email_address FROM Professionals WHERE professional_id NOT IN (     SELECT professional_id     FROM Treatments ) 
SELECT D.owner_id, O.first_name, O.last_name FROM Dogs AS D JOIN Owners AS O ON D.owner_id = O.owner_id GROUP BY D.owner_id ORDER BY COUNT(D.dog_id) DESC LIMIT 1
SELECT o.owner_id, o.first_name, o.last_name FROM Owners o INNER JOIN Dogs d ON o.owner_id = d.owner_id GROUP BY o.owner_id, o.first_name, o.last_name ORDER BY COUNT(d.dog_id) DESC LIMIT 1; 
SELECT P.professional_id, P.role_code, P.first_name FROM Professionals AS P JOIN Treatments AS T ON P.professional_id = T.professional_id GROUP BY P.professional_id HAVING COUNT(T.treatment_id) >= 2
SELECT T1.professional_id, T1.role_code, T1.first_name FROM Professionals AS T1 INNER JOIN Treatments AS T2 ON T1.professional_id = T2.professional_id GROUP BY T1.professional_id HAVING COUNT(T2.treatment_id) >= 2
SELECT b.breed_name FROM Dogs d JOIN Breeds b ON d.breed_code = b.breed_code GROUP BY b.breed_name ORDER BY COUNT(d.dog_id) DESC LIMIT 1
SELECT b.breed_name FROM Dogs d JOIN Breeds b ON d.breed_code = b.breed_code GROUP BY b.breed_name ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT T1.owner_id, T1.last_name FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id JOIN Treatments AS T3 ON T2.dog_id = T3.dog_id GROUP BY T1.owner_id, T1.last_name ORDER BY COUNT(T3.treatment_id) DESC LIMIT 1; 
SELECT T1.owner_id, T1.last_name, SUM(T3.charge_amount) AS total_spent FROM Owners AS T1 INNER JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id INNER JOIN Treatments AS T3 ON T2.dog_id = T3.dog_id INNER JOIN Charges AS T4 ON T3.charge_id = T4.charge_id GROUP BY T1.owner_id ORDER BY total_spent DESC LIMIT 1
SELECT tt.treatment_type_description, SUM(t.cost_of_treatment) AS total_cost FROM Treatments t JOIN Treatment_Types tt ON t.treatment_type_code = tt.treatment_type_code GROUP BY t.treatment_type_code ORDER BY total_cost ASC LIMIT 1; 
SELECT T2.treatment_type_description FROM Treatments AS T1 INNER JOIN Treatment_Types AS T2 ON T1.treatment_type_code = T2.treatment_type_code GROUP BY T2.treatment_type_description ORDER BY SUM(T1.cost_of_treatment) ASC LIMIT 1
SELECT o.owner_id, o.zip_code, SUM(c.charge_amount) AS total_charges FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id JOIN Treatments t ON d.dog_id = t.dog_id JOIN Charges c ON t.charge_id = c.charge_id GROUP BY o.owner_id, o.zip_code ORDER BY total_charges DESC LIMIT 1
SELECT o.owner_id, o.zip_code, SUM(c.charge_amount) AS total_spent FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id JOIN Treatments t ON d.dog_id = t.dog_id JOIN Charges c ON t.charge_id = c.charge_id GROUP BY o.owner_id, o.zip_code ORDER BY total_spent DESC LIMIT 1; 
SELECT p.professional_id, p.cell_number FROM Professionals p JOIN Treatments t ON p.professional_id = t.professional_id GROUP BY p.professional_id HAVING COUNT(DISTINCT t.treatment_type_code) >= 2
SELECT p.professional_id, p.cell_number FROM Professionals p JOIN Treatments t ON p.professional_id = t.professional_id GROUP BY p.professional_id HAVING COUNT(DISTINCT t.treatment_type_code) >= 2
SELECT DISTINCT p.first_name, p.last_name FROM Treatments t JOIN Professionals p ON t.professional_id = p.professional_id WHERE t.cost_of_treatment < (SELECT AVG(cost_of_treatment) FROM Treatments)
SELECT p.first_name, p.last_name FROM Professionals p JOIN Treatments t ON p.professional_id = t.professional_id WHERE t.cost_of_treatment < (     SELECT AVG(cost_of_treatment)     FROM Treatments ); 
SELECT T1.date_of_treatment, T2.first_name FROM Treatments AS T1 INNER JOIN Professionals AS T2 ON T1.professional_id = T2.professional_id; 
SELECT T1.date_of_treatment, T2.first_name FROM Treatments AS T1 INNER JOIN Professionals AS T2 ON T1.professional_id = T2.professional_id 
SELECT T1.cost_of_treatment, T2.treatment_type_description FROM Treatments AS T1 INNER JOIN Treatment_Types AS T2 ON T1.treatment_type_code = T2.treatment_type_code
SELECT T1.cost_of_treatment, T2.treatment_type_description FROM Treatments AS T1 INNER JOIN Treatment_Types AS T2 ON T1.treatment_type_code = T2.treatment_type_code
SELECT O.first_name, O.last_name, S.size_description FROM Owners AS O JOIN Dogs AS D ON O.owner_id = D.owner_id JOIN Sizes AS S ON D.size_code = S.size_code
SELECT DISTINCT o.first_name, o.last_name, s.size_description FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id JOIN Sizes s ON d.size_code = s.size_code
SELECT O.first_name, D.name FROM Dogs AS D JOIN Owners AS O ON D.owner_id = O.owner_id
SELECT O.first_name, D.name FROM Owners AS O INNER JOIN Dogs AS D ON O.owner_id = D.owner_id; 
SELECT d.name, t.date_of_treatment FROM Dogs d JOIN Treatments t ON d.dog_id = t.dog_id WHERE d.breed_code IN (SELECT breed_code FROM Dogs GROUP BY breed_code HAVING COUNT(dog_id) = 1)
SELECT d.name, t.date_of_treatment FROM Dogs d JOIN Treatments t ON d.dog_id = t.dog_id WHERE d.breed_code IN (SELECT breed_code FROM Dogs GROUP BY breed_code ORDER BY COUNT(*) ASC LIMIT 1)
SELECT O.first_name, D.name FROM Dogs AS D JOIN Owners AS O ON D.owner_id = O.owner_id WHERE O.state = 'Virginia'
SELECT DISTINCT o.first_name, d.name FROM Owners o INNER JOIN Dogs d ON o.owner_id = d.owner_id WHERE o.state = 'Virginia'
SELECT T1.date_arrived, T1.date_departed FROM Dogs AS T1 INNER JOIN Treatments AS T2 ON T1.dog_id = T2.dog_id
SELECT T1.date_arrived, T1.date_departed FROM Dogs AS T1 INNER JOIN Treatments AS T2 ON T1.dog_id = T2.dog_id
SELECT o.last_name FROM Dogs d JOIN Owners o ON d.owner_id = o.owner_id ORDER BY d.date_of_birth DESC LIMIT 1
SELECT o.last_name FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id ORDER BY d.age ASC LIMIT 1; 
SELECT email_address FROM Professionals WHERE state = 'Hawaii' OR state = 'Wisconsin'
SELECT email_address FROM Professionals WHERE state = 'Hawaii' OR state = 'Wisconsin'
SELECT date_arrived, date_departed FROM Dogs
SELECT date_arrived, date_departed FROM Dogs
SELECT COUNT(DISTINCT dog_id) AS number_of_dogs_with_treatments FROM Treatments
SELECT COUNT(DISTINCT dog_id) FROM Treatments; 
SELECT COUNT(DISTINCT professional_id) AS number_of_professionals FROM Treatments
SELECT COUNT(DISTINCT professional_id) AS number_of_professionals FROM Treatments; 
SELECT role_code, street, city, state FROM Professionals WHERE city LIKE '%West%'
SELECT role_code, street, city, state FROM Professionals WHERE city LIKE '%West%'
SELECT first_name, last_name, email_address FROM Owners WHERE state LIKE '%North%'
SELECT first_name, last_name, email_address FROM Owners WHERE state LIKE '%North%'
SELECT COUNT(*) FROM Dogs WHERE age < ( SELECT AVG(age) FROM Dogs )
SELECT COUNT(*) FROM Dogs WHERE age < ( SELECT AVG(age) FROM Dogs )
SELECT cost_of_treatment FROM Treatments ORDER BY date_of_treatment DESC LIMIT 1
SELECT cost_of_treatment FROM Treatments ORDER BY date_of_treatment DESC LIMIT 1
SELECT COUNT(*) FROM Dogs WHERE dog_id NOT IN ( SELECT dog_id FROM Treatments )
SELECT COUNT(*) FROM Dogs WHERE dog_id NOT IN ( SELECT dog_id FROM Treatments )
SELECT COUNT(DISTINCT owner_id) AS num_temporarily_unowned_owners FROM Dogs WHERE abandoned_yn = '1'; 
SELECT COUNT(owner_id) FROM Owners WHERE NOT EXISTS (SELECT 1 FROM Dogs WHERE Dogs.owner_id = Owners.owner_id)
SELECT COUNT(professional_id) FROM Professionals WHERE professional_id NOT IN (     SELECT professional_id     FROM Treatments ); 
SELECT COUNT(professional_id) FROM Professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments)
SELECT dog_name, age, weight FROM Dogs WHERE abandoned_yn = '1'
SELECT name, age, weight FROM Dogs WHERE abandoned_yn = '1'
SELECT AVG(age) AS average_age FROM Dogs
SELECT AVG(age) FROM Dogs
SELECT MAX(age) AS oldest_dog_age FROM Dogs
SELECT MAX(age) AS oldest_dog_age FROM Dogs
SELECT charge_type, charge_amount FROM Charges
SELECT charge_type, charge_amount FROM Charges;
SELECT MAX(charge_amount) AS max_charge_amount FROM Charges; 
SELECT MAX(charge_amount) AS max_charge FROM Charges
SELECT email_address, cell_number, home_phone FROM Professionals
SELECT email_address, cell_number, home_phone FROM Professionals
To answer this question, we need to identify the columns in the database schema that contain information about breed types and size types. The `Breeds` table contains the `breed_name` column, and the `Sizes` table contains the `size_description` column. However, these tables do not directly store combinations of breeds and sizes. Instead, they store individual entries for each breed and size.  Since there is no direct relationship between breeds and sizes in the given schema, we cannot simply join these two tables to get combinations. However, we can assume that each dog has a breed and a size, and we can use the `Dogs` table to link these two attributes together.  The `Dogs` table has foreign keys `breed_code` and `size_code`, which reference the `breed_code` and `size_code` columns in the `Breeds` and `Sizes` tables, respectively. By joining these three tables, we can retrieve all possible breed type and size type combinations.  Here's the step-by-step reasoning:  1. Identify the tables involved: `Breeds`, `Sizes`, and `Dogs`. 2. Determine the common columns: `breed_code` and `size_code`. 3. Join the `Breeds` table with the `Dogs` table on the `breed_code` column. 4. Join the result with the `Sizes` table on the `size_code` column. 5. Select distinct combinations of `breed_name` and `size_description`.  However, upon closer inspection, it appears that the schema does not actually store combinations of breeds and sizes. Each dog has a specific breed and size, but there is no separate record of each combination. Therefore, the question may be based on incorrect assumptions.  Given the current schema, we cannot generate a valid SQL query to answer the question as stated. If we were to ignore the fact that the schema does not support this query and assume that each dog has a unique breed and size combination, we could still attempt to write a query that joins the `Breeds` and `Sizes` tables on their respective codes and selects distinct combinations. But this would not accurately represent the data stored in the database.  Therefore, the most accurate response to this question based on the given schema is that it is not possible to generate a valid SQL query to answer the question as stated.
SELECT DISTINCT breed_name, size_description FROM Breeds JOIN Sizes ON Breeds.breed_code = Sizes.size_code; 
SELECT P.first_name, TT.treatment_type_description FROM Professionals AS P JOIN Treatments AS T ON P.professional_id = T.professional_id JOIN Treatment_Types AS TT ON T.treatment_type_code = TT.treatment_type_code
SELECT P.first_name, TT.treatment_type_description FROM Professionals AS P JOIN Treatments AS T ON P.professional_id = T.professional_id JOIN Treatment_Types AS TT ON T.treatment_type_code = TT.treatment_type_code
SELECT COUNT(*) FROM singer
SELECT COUNT(*) FROM singer; 
SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC
SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC
SELECT Birth_Year, Citizenship FROM singer
SELECT Birth_Year, Citizenship FROM singer
SELECT Name FROM singer WHERE Citizenship != 'France'
SELECT Name FROM singer WHERE Citizenship != 'France'
SELECT Name FROM singer WHERE Birth_Year = 1948 OR Birth_Year = 1949
SELECT Name FROM singer WHERE Birth_Year = 1948 OR Birth_Year = 1949
SELECT Name FROM singer ORDER BY Net_Worth_Millions DESC LIMIT 1
SELECT Name FROM singer ORDER BY Net_Worth_Millions DESC LIMIT 1
SELECT Citizenship, COUNT(*) FROM singer GROUP BY Citizenship
SELECT Citizenship, COUNT(*) AS Number_of_Singers FROM singer GROUP BY Citizenship
SELECT Citizenship FROM singer GROUP BY Citizenship ORDER BY COUNT(*) DESC LIMIT 1
SELECT Citizenship  FROM singer  GROUP BY Citizenship  ORDER BY COUNT(*) DESC  LIMIT 1; 
SELECT Citizenship, MAX(Net_Worth_Millions) AS Max_Net_Worth FROM singer GROUP BY Citizenship;
SELECT Citizenship, MAX(Net_Worth_Millions) AS Max_Net_Worth FROM singer GROUP BY Citizenship
SELECT T2.Title, T1.Name FROM singer AS T1 INNER JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID
SELECT T2.Title, T1.Name FROM singer AS T1 INNER JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID
SELECT DISTINCT T1.Name FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID WHERE T2.Sales > 300000
SELECT DISTINCT s.Name FROM singer s JOIN song so ON s.Singer_ID = so.Singer_ID WHERE so.Sales > 300000
SELECT T1.Name FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID GROUP BY T1.Name HAVING COUNT(T2.Song_ID) > 1
SELECT T2.Name FROM song AS T1 INNER JOIN singer AS T2 ON T1.Singer_ID = T2.Singer_ID GROUP BY T1.Singer_ID HAVING COUNT(T1.Song_ID) > 1 
SELECT s.Name, SUM(so.Sales) AS Total_Sales FROM singer s JOIN song so ON s.Singer_ID = so.Singer_ID GROUP BY s.Singer_ID; 
SELECT s.Name, SUM(so.Sales) AS Total_Sales FROM singer s JOIN song so ON s.Singer_ID = so.Singer_ID GROUP BY s.Name
   SELECT Name FROM singer WHERE Singer_ID NOT IN (SELECT Singer_ID FROM song)    
   SELECT Singer_ID FROM song    
SELECT Citizenship FROM singer WHERE Birth_Year < 1945 INTERSECT SELECT Citizenship FROM singer WHERE Birth_Year > 1955
SELECT Citizenship FROM singer WHERE Birth_Year < 1945 INTERSECT SELECT Citizenship FROM singer WHERE Birth_Year > 1955
SELECT COUNT(feature_id) AS total_available_features FROM Other_Available_Features
SELECT T1.feature_type_name FROM Ref_Feature_Types AS T1 INNER JOIN Other_Available_Features AS T2 ON T1.feature_type_code = T2.feature_type_code WHERE T2.feature_name = 'AirCon' 
SELECT T1.property_type_description FROM Ref_Property_Types AS T1 INNER JOIN Properties AS T2 ON T1.property_type_code = T2.property_type_code
SELECT property_name FROM Properties WHERE (property_type_code = 'House' OR property_type_code = 'Apartment') AND (COUNT(hse_feature_1) + COUNT(hse_feature_2) + COUNT(hse_feature_3)) > 1
