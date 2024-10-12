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
