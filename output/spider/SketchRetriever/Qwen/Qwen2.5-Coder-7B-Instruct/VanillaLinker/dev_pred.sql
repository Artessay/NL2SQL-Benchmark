SELECT COUNT(*) AS NumberOfSingers FROM singer; 
SELECT COUNT(*) AS Total_Singers FROM singer; 
SELECT Name, Country, Age FROM singer ORDER BY Age DESC;
SELECT Name, Country, Age FROM singer ORDER BY Age DESC; 
SELECT AVG(Age), MIN(Age), MAX(Age) FROM singer WHERE Country = 'France'; 
SELECT AVG(Age) AS Average_Age, MIN(Age) AS Minimum_Age, MAX(Age) AS Maximum_Age FROM singer WHERE Country = 'France'; 
SELECT Song_Name, Song_release_year FROM singer ORDER BY Age ASC LIMIT 1; 
SELECT Song_Name, Song_release_year FROM singer ORDER BY Age ASC LIMIT 1; 
SELECT DISTINCT Country FROM singer WHERE Age > 20
SELECT DISTINCT Country FROM singer WHERE Age > 20; 
SELECT Country, COUNT(*) AS Number_of_Singers FROM singer GROUP BY Country; 
SELECT Country, COUNT(Singer_ID) FROM singer GROUP BY Country
SELECT Song_Name FROM singer WHERE Age > (SELECT AVG(Age) FROM singer) 
SELECT Song_Name FROM singer WHERE Age > (SELECT AVG(Age) FROM singer) 
SELECT Location, Name FROM stadium WHERE Capacity BETWEEN 5000 AND 10000; 
SELECT Location, Name FROM stadium WHERE Capacity BETWEEN 5000 AND 10000; 
SELECT MAX(Capacity) AS Max_Capacity, AVG(Capacity) AS Average_Capacity FROM stadium; 
SELECT AVG(Capacity) AS Average_Capacity, MAX(Capacity) AS Maximum_Capacity FROM stadium; 
SELECT Name, Capacity FROM stadium ORDER BY Average DESC LIMIT 1; 
SELECT Name, Capacity FROM stadium ORDER BY Average DESC LIMIT 1; 
SELECT COUNT(*) FROM concert WHERE Year IN ('2014', '2015'); 
SELECT COUNT(*) FROM concert WHERE YEAR IN ('2014', '2015') 
SELECT s.Name, COUNT(c.concert_ID) AS Number_of_Concerts FROM stadium s JOIN concert c ON s.Stadium_ID = c.Stadium_ID GROUP BY s.Name; 
SELECT s.Name, COUNT(c.concert_ID) AS Number_of_Concerts FROM stadium s JOIN concert c ON s.Stadium_ID = c.Stadium_ID GROUP BY s.Name; 
SELECT s.Name, s.Capacity, COUNT(c.concert_ID) AS concert_count FROM stadium s JOIN concert c ON s.Stadium_ID = c.Stadium_ID WHERE c.Year >= '2014' GROUP BY s.Name, s.Capacity ORDER BY concert_count DESC LIMIT 1; 
SELECT s.Name, s.Capacity FROM stadium s JOIN concert c ON s.Stadium_ID = c.Stadium_ID WHERE c.Year > 2013 GROUP BY s.Name, s.Capacity ORDER BY COUNT(c.concert_ID) DESC LIMIT 1; 
SELECT YEAR, COUNT(*) AS Number_of_Concerts FROM concert GROUP BY YEAR ORDER BY Number_of_Concerts DESC LIMIT 1; 
SELECT YEAR FROM concert GROUP BY YEAR ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert); 
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert) 
SELECT DISTINCT Country  FROM singer  WHERE Age > 40  INTERSECT  SELECT DISTINCT Country  FROM singer  WHERE Age < 30; 
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert WHERE Year = '2014') 
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert WHERE Year = '2014') 
SELECT c.concert_Name, c.Theme, COUNT(sc.Singer_ID) AS Number_of_Singers FROM concert c JOIN singer_in_concert sc ON c.concert_ID = sc.concert_ID GROUP BY c.concert_ID, c.concert_Name, c.Theme; 
SELECT c.concert_Name, c.Theme, COUNT(sc.Singer_ID) AS Number_of_Singers FROM concert c JOIN singer_in_concert sc ON c.concert_ID = sc.concert_ID GROUP BY c.concert_ID; 
SELECT s.Name, COUNT(sc.concert_ID) AS Number_of_Concerts FROM singer s JOIN singer_in_concert sc ON s.Singer_ID = sc.Singer_ID GROUP BY s.Name;
SELECT s.Name, COUNT(sc.concert_ID) AS Number_of_Concerts FROM singer s JOIN singer_in_concert sc ON s.Singer_ID = sc.Singer_ID GROUP BY s.Name; 
SELECT s.Name FROM singer AS s JOIN singer_in_concert AS sic ON s.Singer_ID = sic.Singer_ID JOIN concert AS c ON sic.concert_ID = c.concert_ID WHERE c.Year = '2014'; 
SELECT s.Name FROM singer AS s JOIN singer_in_concert AS sic ON s.Singer_ID = sic.Singer_ID JOIN concert AS c ON sic.concert_ID = c.concert_ID WHERE c.Year = '2014'; 
SELECT Name, Country FROM singer WHERE Song_Name LIKE '%Hey%' 
SELECT Name, Country FROM singer WHERE Song_Name LIKE '%Hey%' 
SELECT s.Name, s.Location  FROM stadium s  JOIN concert c ON s.Stadium_ID = c.Stadium_ID  WHERE c.Year IN ('2014', '2015')  GROUP BY s.Stadium_ID  HAVING COUNT(DISTINCT c.Year) > 1; 
SELECT s.Name, s.Location FROM stadium s WHERE s.Stadium_ID IN (     SELECT c.Stadium_ID     FROM concert c     WHERE c.Year = '2014' ) AND s.Stadium_ID IN (     SELECT c.Stadium_ID     FROM concert c     WHERE c.Year = '2015' ) 
SELECT COUNT(*) AS NumberOfConcerts FROM concert c JOIN stadium s ON c.Stadium_ID = s.Stadium_ID WHERE s.Capacity = (SELECT MAX(Capacity) FROM stadium); 
SELECT COUNT(*) FROM concert AS c JOIN stadium AS s ON c.Stadium_ID = s.Stadium_ID WHERE s.Capacity = (SELECT MAX(Capacity) FROM stadium); 
SELECT COUNT(*) FROM Pets WHERE weight > 10;
SELECT COUNT(*) FROM Pets WHERE weight > 10; 
SELECT MIN(T2.weight) FROM Has_Pet AS T1 INNER JOIN Pets AS T2 ON T1.PetID = T2.PetID WHERE T2.PetType = 'dog'
SELECT MIN(weight) AS youngest_dog_weight FROM Pets WHERE PetType = 'dog'; 
SELECT MAX(weight), PetType FROM Pets GROUP BY PetType; 
SELECT MAX(Pets.weight), Pets.PetType FROM Pets GROUP BY Pets.PetType; 
SELECT COUNT(*) FROM Student AS S JOIN Has_Pet AS HP ON S.StuID = HP.StuID WHERE S.Age > 20; 
SELECT COUNT(*) AS NumberOfPets FROM Student JOIN Has_Pet ON Student.StuID = Has_Pet.StuID WHERE Student.Age > 20; 
SELECT COUNT(*)  FROM Student  JOIN Has_Pet ON Student.StuID = Has_Pet.StuID  JOIN Pets ON Has_Pet.PetID = Pets.PetID  WHERE Student.Sex = 'F' AND Pets.PetType = 'dog'; 
SELECT COUNT(*) AS NumberOfDogPets FROM Student JOIN Has_Pet ON Student.StuID = Has_Pet.StuID JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Student.Sex = 'F' AND Pets.PetType = 'dog'; 
SELECT COUNT(DISTINCT PetType) FROM Pets; 
SELECT COUNT(DISTINCT PetType) AS NumberOfDifferentPets FROM Pets; 
SELECT DISTINCT s.Fname FROM Student s JOIN Has_Pet hp ON s.StuID = hp.StuID JOIN Pets p ON hp.PetID = p.PetID WHERE p.PetType IN ('cat', 'dog') 
SELECT DISTINCT S.Fname FROM Student AS S JOIN Has_Pet AS HP ON S.StuID = HP.StuID JOIN Pets AS P ON HP.PetID = P.PetID WHERE P.PetType IN ('cat', 'dog') 
SELECT s.Fname FROM Student s JOIN Has_Pet hp ON s.StuID = hp.StuID JOIN Pets p ON hp.PetID = p.PetID WHERE p.PetType = 'cat' INTERSECT SELECT s.Fname FROM Student s JOIN Has_Pet hp ON s.StuID = hp.StuID JOIN Pets p ON hp.PetID = p.PetID WHERE p.PetType = 'dog'; 
SELECT S.Fname FROM Student S WHERE EXISTS (     SELECT 1     FROM Has_Pet HP     JOIN Pets P ON HP.PetID = P.PetID     WHERE HP.StuID = S.StuID AND P.PetType = 'cat' ) AND EXISTS (     SELECT 1     FROM Has_Pet HP     JOIN Pets P ON HP.PetID = P.PetID     WHERE HP.StuID = S.StuID AND P.PetType = 'dog' ); 
SELECT Major, Age FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet INNER JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE PetType = 'cat') 
SELECT S.Major, S.Age FROM Student S WHERE S.StuID NOT IN (SELECT H.StuID FROM Has_Pet H JOIN Pets P ON H.PetID = P.PetID WHERE P.PetType = 'cat')
SELECT StuID FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet INNER JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE PetType = 'cat') 
SELECT StuID FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE PetType = 'cat'); 
SELECT S.Fname, S.Age FROM Student AS S JOIN Has_Pet AS HP ON S.StuID = HP.StuID JOIN Pets AS P ON HP.PetID = P.PetID WHERE P.PetType = 'dog' AND S.StuID NOT IN (SELECT StuID FROM Has_Pet JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Pets.PetType = 'cat')
SELECT s.Fname FROM Student s JOIN Has_Pet hp ON s.StuID = hp.StuID JOIN Pets p ON hp.PetID = p.PetID WHERE p.PetType = 'dog' AND s.StuID NOT IN ( 	SELECT StuID 	FROM Has_Pet 	JOIN Pets ON Has_Pet.PetID = Pets.PetID 	WHERE Pets.PetType = 'cat' ) GROUP BY s.Fname; 
SELECT PetType, weight FROM Pets ORDER BY pet_age ASC LIMIT 1
SELECT T2.PetType, T2.weight FROM Has_Pet AS T1 INNER JOIN Pets AS T2 ON T1.PetID = T2.PetID ORDER BY T2.pet_age ASC LIMIT 1
SELECT PetID, weight FROM Pets WHERE pet_age > 1;
SELECT PetID, weight FROM Pets WHERE pet_age > 1;
SELECT Pets.PetType, AVG(Pets.pet_age) AS AvgAge, MAX(Pets.pet_age) AS MaxAge FROM Pets JOIN Has_Pet ON Pets.PetID = Has_Pet.PetID GROUP BY Pets.PetType; 
SELECT T1.PetType, AVG(T1.pet_age) AS AverageAge, MAX(T1.pet_age) AS MaximumAge FROM Pets AS T1 INNER JOIN Has_Pet AS T2 ON T1.PetID = T2.PetID GROUP BY T1.PetType;
SELECT Pets.PetType, AVG(Pets.weight) FROM Pets JOIN Has_Pet ON Pets.PetID = Has_Pet.PetID GROUP BY Pets.PetType
SELECT Pets.PetType, AVG(Pets.weight) AS AverageWeight FROM Pets JOIN Has_Pet ON Pets.PetID = Has_Pet.PetID GROUP BY Pets.PetType; 
SELECT S.Fname, S.Age FROM Student S JOIN Has_Pet HP ON S.StuID = HP.StuID; 
SELECT DISTINCT S.Fname, S.Age FROM Student S JOIN Has_Pet HP ON S.StuID = HP.StuID; 
SELECT T2.PetID FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID WHERE T1.LName = 'Smith'
SELECT T2.PetID FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID WHERE T1.LName = 'Smith'; 
SELECT T1.StuID ,  COUNT(T2.PetID) FROM Student AS T1 LEFT JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID WHERE T2.StuID IS NOT NULL GROUP BY T1.StuID
SELECT StuID, COUNT(PetID) AS NumberOfPets FROM Has_Pet GROUP BY StuID; 
SELECT S.Fname, S.Sex FROM Student S JOIN Has_Pet HP ON S.StuID = HP.StuID GROUP BY S.StuID, S.Fname, S.Sex HAVING COUNT(HP.PetID) > 1; 
SELECT S.Fname, S.Sex FROM Student AS S JOIN Has_Pet AS HP ON S.StuID = HP.StuID GROUP BY S.StuID HAVING COUNT(HP.PetID) > 1; 
SELECT T1.LName FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID INNER JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'cat' AND T3.pet_age = 3;
SELECT T1.LName FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'cat' AND T3.pet_age = 3;
SELECT AVG(Age) FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet); 
SELECT AVG(Age) FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet)
SELECT COUNT(*) AS NumberOfContinents FROM continents; 
SELECT COUNT(*) AS NumberOfContinents FROM continents; 
SELECT c.ContId, c.Continent, COUNT(co.CountryId) AS NumberOfCountries FROM continents c LEFT JOIN countries co ON c.ContId = co.Continent GROUP BY c.ContId, c.Continent
SELECT c.ContId, c.Continent, COUNT(co.CountryId) AS NumberOfCountries FROM continents c LEFT JOIN countries co ON c.ContId = co.Continent GROUP BY c.ContId, c.Continent; 
SELECT COUNT(CountryName) FROM countries; 
SELECT COUNT(CountryId) FROM countries; 
SELECT T1.FullName, T1.Id, COUNT(T2.Model) AS NumberOfModels FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.FullName, T1.Id
SELECT T2.FullName, T2.Id, COUNT(T1.Model) AS NumberOfModels FROM model_list AS T1 INNER JOIN car_makers AS T2 ON T1.Maker = T2.Id GROUP BY T2.FullName, T2.Id
SELECT T2.Model FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.Id = T2.MakeId ORDER BY T1.Horsepower ASC LIMIT 1; 
SELECT T.Model FROM cars_data AS T ORDER BY T.Horsepower ASC LIMIT 1
SELECT T2.Model FROM cars_data AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.ModelId WHERE T1.Weight < ( SELECT AVG(Weight) FROM cars_data ); 
SELECT T2.Model FROM cars_data AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.ModelId WHERE T1.Weight < ( SELECT AVG(Weight) FROM cars_data ); 
SELECT T1.Maker FROM car_makers AS T1 INNER JOIN car_names AS T2 ON T1.Id = T2.MakeId INNER JOIN cars_data AS T3 ON T2.MakeId = T3.Id WHERE T3.Year = 1970 GROUP BY T1.Maker; 
SELECT DISTINCT T3.Maker FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.Id = T2.MakeId INNER JOIN car_makers AS T3 ON T2.Model = T3.Make WHERE T1.Year = 1970
SELECT T2.Make, T1.Year FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.Id = T2.MakeId ORDER BY T1.Year ASC LIMIT 1; 
SELECT T3.Maker, T1.Year FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.Id = T2.MakeId INNER JOIN car_makers AS T3 ON T2.Model = T3.Maker ORDER BY T1.Year ASC LIMIT 1; 
SELECT DISTINCT T.Model FROM model_list AS T INNER JOIN cars_data AS D ON T.ModelId = D.Id WHERE D.Year > 1980
SELECT DISTINCT T.Model  FROM model_list AS T  JOIN cars_data AS C ON T.Model = C.Make  WHERE C.Year > 1980; 
SELECT c.Continent, COUNT(cm.Id) AS CarMakerCount FROM continents c JOIN countries co ON c.ContId = co.Continent JOIN car_makers cm ON co.CountryId = cm.Country GROUP BY c.Continent; 
SELECT c.Continent, COUNT(cm.Id) AS NumberOfCarMakers FROM continents c JOIN countries co ON c.ContId = co.Continent JOIN car_makers cm ON co.CountryId = cm.Country GROUP BY c.Continent; 
SELECT T2.CountryName FROM car_makers AS T1 INNER JOIN countries AS T2 ON T1.Country = T2.CountryId GROUP BY T2.CountryName ORDER BY COUNT(T1.Maker) DESC LIMIT 1; 
SELECT T2.CountryName FROM car_makers AS T1 INNER JOIN countries AS T2 ON T1.Country = T2.CountryId GROUP BY T2.CountryName ORDER BY COUNT(T1.Maker) DESC LIMIT 1
SELECT COUNT(T2.Model), T1.FullName FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.FullName
SELECT T2.Id, T2.FullName, COUNT(T1.Model) AS NumberOfModels FROM model_list AS T1 INNER JOIN car_makers AS T2 ON T1.Maker = T2.Id GROUP BY T2.Id, T2.FullName
SELECT T2.Accelerate FROM car_names AS T1 INNER JOIN cars_data AS T2 ON T1.MakeId = T2.Id WHERE T1.Model = 'amc' AND T1.Make = 'horneet sportabout sw'
SELECT Accelerate FROM cars_data WHERE Make = 'amc' AND Model = 'hornet sportabout (sw)'; 
SELECT COUNT(*) FROM car_makers WHERE Country IN (SELECT CountryId FROM countries WHERE CountryName = 'france') 
SELECT COUNT(*) FROM car_makers WHERE Country IN (SELECT CountryId FROM countries WHERE CountryName = 'france') 
SELECT COUNT(*) FROM car_makers WHERE Country = '1'; 
SELECT COUNT(*) AS CountOfCarModels FROM car_makers cm JOIN countries c ON cm.Country = c.CountryId WHERE c.CountryName = 'usa'; 
SELECT AVG(MPG) FROM cars_data WHERE Cylinders = 4
SELECT AVG(MPG) AS AvgMPG FROM cars_data WHERE Cylinders = 4; 
SELECT MIN(Weight) FROM cars_data WHERE Cylinders = 8 AND Year = 1974;
SELECT MIN(Weight) FROM cars_data WHERE Cylinders = 8 AND Year = 1974;
SELECT DISTINCT T1.Maker, T2.Model FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker; 
SELECT T1.Maker, T2.Model FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker;
SELECT T2.CountryName, T2.CountryId FROM car_makers AS T1 INNER JOIN countries AS T2 ON T1.Country = T2.CountryId GROUP BY T2.CountryName, T2.CountryId HAVING COUNT(T1.Id) >= 1; 
SELECT c.CountryName, c.CountryId FROM countries c JOIN car_makers cm ON c.CountryId = cm.Country GROUP BY c.CountryName, c.CountryId HAVING COUNT(cm.Id) >= 1; 
SELECT COUNT(*) FROM cars_data WHERE Horsepower > 150; 
SELECT COUNT(*) FROM cars_data WHERE Horsepower > 150; 
SELECT AVG(Weight), Year FROM cars_data GROUP BY Year; 
SELECT AVG(Weight), Year FROM cars_data GROUP BY Year; 
SELECT c.CountryName FROM countries c JOIN car_makers cm ON c.CountryId = cm.Country WHERE c.Continent = 2 GROUP BY c.CountryName HAVING COUNT(cm.Maker) >= 3; 
SELECT T1.CountryName FROM countries AS T1 INNER JOIN car_makers AS T2 ON T1.CountryId = T2.Country WHERE T1.Continent = 2 GROUP BY T1.CountryName HAVING COUNT(T2.Maker) >= 3
SELECT MAX(T2.Horsepower), T1.Make FROM car_names AS T1 INNER JOIN cars_data AS T2 ON T1.MakeId = T2.Id WHERE T2.Cylinders = 3; 
SELECT MAX(T2.Horsepower), T1.Make FROM car_names AS T1 INNER JOIN cars_data AS T2 ON T1.MakeId = T2.Id WHERE T2.Cylinders = 3; 
SELECT T2.Model FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.Id = T2.MakeId ORDER BY T1.MPG DESC LIMIT 1; 
SELECT T.Model FROM ( SELECT T2.Model, T1.MPG FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.Id = T2.MakeId ORDER BY T1.MPG DESC LIMIT 1 ) AS T; 
SELECT AVG(Horsepower) FROM cars_data WHERE Year < 1980; 
SELECT AVG(Horsepower) FROM cars_data WHERE Year < 1980;
SELECT AVG(T2.Edispl) AS AvgEdispl FROM car_names AS T1 INNER JOIN cars_data AS T2 ON T1.MakeId = T2.Id WHERE T1.Model = 'volvo' 
SELECT AVG(Edispl) FROM cars_data WHERE Make = 'volvo'; 
SELECT Cylinders, MAX(Accelerate) AS MaxAccel FROM cars_data GROUP BY Cylinders; 
SELECT Cylinders, MAX(Accelerate) AS Max_Accelerate FROM cars_data GROUP BY Cylinders; 
SELECT T.Model, COUNT(DISTINCT T.Make) AS VersionCount FROM car_names AS T GROUP BY T.Model ORDER BY VersionCount DESC LIMIT 1; 
SELECT T.Model, COUNT(DISTINCT T.Make) AS VersionCount FROM ( 	SELECT C.Model, N.Make 	FROM car_names C JOIN cars_data D ON C.MakeId = D.Id GROUP BY C.Model, N.Make ) T GROUP BY T.Model ORDER BY VersionCount DESC LIMIT 1; 
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 4;
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 4; 
SELECT COUNT(*) FROM cars_data WHERE Year = 1980; 
SELECT COUNT(*) FROM cars_data WHERE Year = 1980; 
SELECT COUNT(*) FROM model_list AS T1 INNER JOIN car_makers AS T2 ON T1.Maker = T2.Id WHERE T2.FullName = 'American Motor Company'; 
SELECT COUNT(*) FROM model_list AS T1 INNER JOIN car_makers AS T2 ON T1.Maker = T2.Id WHERE T2.Maker = 'amc'; 
SELECT T1.Maker, T1.FullName, T1.Id  FROM car_makers AS T1  JOIN model_list AS T2 ON T1.Id = T2.Maker  GROUP BY T1.Id  HAVING COUNT(T2.Model) > 3; 
SELECT Maker, Id FROM car_makers WHERE Id IN (     SELECT Maker FROM model_list GROUP BY Maker HAVING COUNT(Model) > 3 ) 
SELECT DISTINCT T1.Model FROM model_list AS T1 INNER JOIN car_makers AS T2 ON T1.Maker = T2.Id INNER JOIN cars_data AS T3 ON T3.MakeId = T1.ModelId WHERE T2.FullName = 'General Motors' OR T3.Weight > 3500
SELECT DISTINCT T3.Model FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker INNER JOIN car_names AS T3 ON T2.Model = T3.Model WHERE T1.Maker = 'gm' OR T3.Weight > 3500
SELECT Year FROM cars_data WHERE Weight BETWEEN 3000 AND 4000; 
SELECT DISTINCT Year FROM cars_data WHERE Weight < 4000 INTERSECT SELECT DISTINCT Year FROM cars_data WHERE Weight > 3000; 
SELECT Horsepower FROM cars_data ORDER BY Accelerate DESC LIMIT 1
SELECT MAX(Horsepower) FROM cars_data; 
SELECT MIN(Cylinders) FROM cars_data WHERE Model IN (SELECT Model FROM model_list WHERE Maker = (SELECT Id FROM car_makers WHERE Maker = 'volkswagen')) 
SELECT Cylinders FROM cars_data WHERE Model IN (SELECT Model FROM car_names WHERE Make = 'volvo') ORDER BY Accelerate ASC LIMIT 1; 
SELECT COUNT(*) FROM cars_data WHERE Accelerate > (SELECT MAX(Horsepower) FROM cars_data); 
SELECT COUNT(*) FROM cars_data WHERE Accelerate > ( SELECT MAX(Horsepower) FROM cars_data ); 
SELECT COUNT(*) FROM ( 	SELECT Country FROM car_makers GROUP BY Country HAVING COUNT(Maker) > 2 ) 
SELECT COUNT(Country) FROM ( 	SELECT Country FROM car_makers GROUP BY Country HAVING COUNT(Maker) > 2 ) 
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 6; 
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 6; 
SELECT T2.Model, MAX(T1.Horsepower) AS MaxHorsepower FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.Id = T2.MakeId WHERE T1.Cylinders = 4; 
SELECT T1.Model FROM model_list AS T1 INNER JOIN car_names AS T2 ON T1.Model = T2.Model INNER JOIN cars_data AS T3 ON T2.MakeId = T3.Id WHERE T3.Cylinders = 4 ORDER BY T3.Horsepower DESC LIMIT 1
SELECT cm.MakeId, cm.FullName FROM car_makers cm JOIN car_names cn ON cm.Id = cn.MakeId JOIN cars_data cd ON cn.MakeId = cd.Id WHERE cd.Horsepower > (SELECT MIN(Horsepower) FROM cars_data) AND cd.Cylinders <= 3; 
SELECT T1.MakeId, T2.Make  FROM car_names AS T1  JOIN cars_data AS T2 ON T1.MakeId = T2.Id  WHERE T2.Horsepower <> (SELECT MIN(Horsepower) FROM cars_data) AND T2.Cylinders < 4; 
SELECT MAX(MPG) FROM cars_data WHERE Cylinders = 8 OR Year < 1980; 
SELECT MAX(MPG) FROM cars_data WHERE Cylinders = 8 OR Year < 1980; 
SELECT T2.Model FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker INNER JOIN cars_data AS T3 ON T3.Id = T2.ModelId WHERE T3.Weight < 3500 AND T1.Maker != 'ford'
SELECT DISTINCT T1.Model FROM model_list AS T1 JOIN car_names AS T2 ON T1.Model = T2.Model JOIN cars_data AS T3 ON T2.MakeId = T3.Id WHERE T3.Weight < 3500 AND T1.Maker != (SELECT Id FROM car_makers WHERE Maker = 'ford') 
SELECT c.CountryName FROM countries c WHERE NOT EXISTS (SELECT 1 FROM car_makers cm WHERE cm.Country = c.CountryId); 
SELECT CountryName FROM countries WHERE CountryId NOT IN (SELECT Country FROM car_makers)
SELECT cm.Id, cm.Maker FROM car_makers cm JOIN model_list ml ON cm.Id = ml.Maker GROUP BY cm.Id, cm.Maker HAVING COUNT(ml.Model) >= 2 ORDER BY COUNT(ml.Model) DESC; 
SELECT cm.Id, cm.Maker FROM car_makers cm JOIN model_list ml ON cm.Id = ml.Maker GROUP BY cm.Id, cm.Maker HAVING COUNT(ml.Model) >= 2 AND SUM(cars_data.Year) > 3; 
SELECT c.CountryId, c.CountryName FROM countries c JOIN car_makers cm ON c.CountryId = cm.Country WHERE (     SELECT COUNT(*) FROM car_makers WHERE Country = cm.Country ) > 3 OR EXISTS (     SELECT 1 FROM model_list ml JOIN car_makers cm2 ON ml.Maker = cm2.Id WHERE cm2.Country = cm.Country AND ml.Model = 'fiat' ) GROUP BY c.CountryId, c.CountryName; 
SELECT c.CountryId, c.CountryName FROM countries c JOIN car_makers cm ON c.CountryId = cm.Country WHERE c.CountryId IN (     SELECT CountryId     FROM car_makers     GROUP BY CountryId     HAVING COUNT(DISTINCT Maker) > 3 ) OR EXISTS (     SELECT 1     FROM car_makers cm2     JOIN model_list ml ON cm2.Id = ml.Maker     WHERE cm2.Country = c.CountryId AND ml.Model = 'fiat' ) 
SELECT Country FROM airlines WHERE Airline = 'JetBlue Airways'; 
SELECT Country FROM airlines WHERE Airline = 'JetBlue Airways'
SELECT Abbreviation FROM airlines WHERE Airline = 'JetBlue Airways'
SELECT Abbreviation FROM airlines WHERE Airline = 'Jetblue Airways'
SELECT Airline, Abbreviation FROM airlines WHERE Country = 'USA'
SELECT Airline, Abbreviation FROM airlines WHERE Country = 'USA'; 
SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony'; 
SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony'; 
SELECT COUNT(*) FROM airlines; 
SELECT COUNT(*) FROM airlines
SELECT COUNT(*) FROM airports; 
SELECT COUNT(*) FROM airports; 
SELECT COUNT(*) FROM flights; 
SELECT COUNT(*) FROM flights; 
SELECT Airline FROM airlines WHERE Abbreviation = 'UAL'
SELECT Airline FROM airlines WHERE Abbreviation = 'UAL'
SELECT COUNT(*) FROM airlines WHERE Country = 'USA'; 
SELECT COUNT(*) FROM airlines WHERE Country = 'USA'; 
SELECT City, Country FROM airports WHERE AirportName = 'Alton'; 
SELECT T.City, T.Country FROM airports AS T WHERE T.AirportName = 'Alton'; 
SELECT AirportName FROM airports WHERE AirportCode = 'AKO'; 
SELECT AirportName FROM airports WHERE AirportCode = 'AKO'
SELECT AirportName FROM airports WHERE City = 'Aberdeen'; 
SELECT AirportName FROM airports WHERE City = 'Aberdeen'; 
SELECT COUNT(*) FROM flights WHERE SourceAirport = 'APG'; 
SELECT COUNT(*) FROM flights WHERE SourceAirport = 'APG'; 
SELECT COUNT(*) FROM flights WHERE DestAirport = 'ATO'; 
SELECT COUNT(*) FROM flights WHERE DestAirport = 'ATO'; 
SELECT COUNT(*) FROM flights WHERE SourceAirport IN (SELECT AirportCode FROM airports WHERE City = 'Aberdeen'); 
SELECT COUNT(*) FROM flights WHERE SourceAirport IN (SELECT AirportCode FROM airports WHERE City LIKE '%Aberdeen%') 
SELECT COUNT(*) FROM flights AS f JOIN airports AS a ON f.DestAirport = a.AirportCode WHERE a.City = 'Aberdeen'; 
SELECT COUNT(*) FROM flights INNER JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airports.City = 'Aberdeen'; 
SELECT COUNT(*) FROM airports AS src JOIN airports AS dest ON flights.SourceAirport = src.AirportCode AND flights.DestAirport = dest.AirportCode WHERE src.City = 'Aberdeen' AND dest.City = 'Ashley'; 
SELECT COUNT(*) FROM flights WHERE SourceAirport IN (SELECT AirportCode FROM airports WHERE City LIKE '%Aberdeen%') AND DestAirport IN (SELECT AirportCode FROM airports WHERE City LIKE '%Ashley%'); 
SELECT COUNT(*) FROM flights WHERE Airline = 'JetBlue Airways'; 
SELECT COUNT(*) FROM flights WHERE Airline = 5; 
SELECT COUNT(*) FROM flights WHERE Airline = 1 AND DestAirport = 'ASY'; 
SELECT COUNT(*) FROM flights WHERE Airline = 1 AND DestAirport = 'ASY'; 
SELECT COUNT(*) FROM flights WHERE Airline = 1 AND SourceAirport = 'AHD'; 
SELECT COUNT(*) FROM flights WHERE Airline = 1 AND SourceAirport = 'AHD'; 
SELECT COUNT(*) FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline INNER JOIN airports AS T3 ON T3.AirportCode = T2.DestAirport WHERE T1.Airline = 'United Airlines' AND T3.City LIKE '%Aberdeen%' 
SELECT COUNT(*)  FROM flights  JOIN airports ON flights.DestAirport = airports.AirportCode  WHERE airports.City = 'Aberdeen' AND flights.Airline = 1; 
SELECT T2.City  FROM flights AS T1  JOIN airports AS T2 ON T2.AirportCode = T1.DestAirport  GROUP BY T2.City  ORDER BY COUNT(*) DESC  LIMIT 1; 
SELECT T2.City FROM flights AS T1 INNER JOIN airports AS T2 ON T1.DestAirport = T2.AirportCode GROUP BY T2.City ORDER BY COUNT(T2.City) DESC LIMIT 1
SELECT T.City, COUNT(T.FlightNo) AS FlightCount FROM (     SELECT D.City, F.FlightNo     FROM airports D     JOIN flights F ON D.AirportCode = F.SourceAirport ) T GROUP BY T.City ORDER BY T.FlightCount DESC LIMIT 1; 
SELECT T2.City, COUNT(*) AS Frequency FROM flights AS T1 JOIN airports AS T2 ON T1.SourceAirport = T2.AirportCode GROUP BY T2.City ORDER BY Frequency DESC LIMIT 1; 
SELECT DestAirport FROM flights GROUP BY DestAirport ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT SourceAirport, COUNT(*) AS NumberOfFlights FROM flights GROUP BY SourceAirport ORDER BY NumberOfFlights DESC LIMIT 1; 
SELECT SourceAirport FROM flights GROUP BY SourceAirport ORDER BY COUNT(*) ASC LIMIT 1; 
SELECT SourceAirport AS AirportCode, COUNT(*) AS FlightCount FROM flights GROUP BY SourceAirport ORDER BY FlightCount ASC LIMIT 1; 
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline ORDER BY COUNT(T2.FlightNo) DESC LIMIT 1; 
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline ORDER BY COUNT(T2.FlightNo) DESC LIMIT 1; 
SELECT T2.Abbreviation, T2.Country FROM flights AS T1 JOIN airlines AS T2 ON T1.Airline = T2.uid GROUP BY T2.Abbreviation, T2.Country ORDER BY COUNT(T1.FlightNo) ASC LIMIT 1; 
SELECT T2.Abbreviation, T1.Country  FROM airports AS T1  JOIN airlines AS T2 ON T1.Country = T2.Country  GROUP BY T2.Abbreviation  ORDER BY COUNT(*) ASC  LIMIT 1; 
SELECT DISTINCT T1.Airline FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'AHD'; 
SELECT DISTINCT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'AHD'; 
SELECT DISTINCT T1.Airline FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.DestAirport = 'AHD'
SELECT DISTINCT T1.Airline FROM flights AS T1 JOIN airports AS T2 ON T1.DestAirport = T2.AirportCode WHERE T2.AirportCode = 'AHD'; 
SELECT a.Airline FROM airlines a JOIN flights f ON a.uid = f.Airline WHERE f.SourceAirport IN ('APG', 'CVO') GROUP BY a.Airline HAVING COUNT(DISTINCT f.SourceAirport) > 1; 
SELECT DISTINCT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport IN ('APG', 'CVO') GROUP BY T1.Airline HAVING COUNT(DISTINCT T2.SourceAirport) > 1; 
SELECT DISTINCT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'CVO' AND T2.SourceAirport != 'APG'; 
SELECT T1.Airline FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'CVO' AND T2.DestAirport NOT IN ( SELECT DestAirport FROM flights WHERE SourceAirport = 'APG' )
SELECT T2.Airline FROM flights AS T1 INNER JOIN airlines AS T2 ON T1.Airline = T2.uid GROUP BY T2.Airline HAVING COUNT(T1.FlightNo) >= 10
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline HAVING COUNT(T2.FlightNo) >= 10; 
SELECT Airline FROM flights GROUP BY Airline HAVING COUNT(*) < 200; 
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline HAVING COUNT(T2.FlightNo) < 200; 
SELECT FlightNo FROM flights WHERE Airline = (SELECT uid FROM airlines WHERE Airline = 'United Airlines'); 
SELECT FlightNo FROM flights WHERE Airline = 1;
SELECT FlightNo FROM flights WHERE SourceAirport = 'APG'
SELECT FlightNo FROM flights WHERE SourceAirport = 'APG'; 
SELECT FlightNo FROM flights WHERE DestAirport = 'APG'; 
SELECT FlightNo FROM flights WHERE DestAirport = 'APG'; 
SELECT T2.FlightNo FROM airports AS T1 INNER JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport WHERE T1.City = 'Aberdeen'
SELECT FlightNo FROM flights WHERE SourceAirport IN (SELECT AirportCode FROM airports WHERE City = 'Aberdeen') 
SELECT f.FlightNo FROM flights f JOIN airports a ON f.DestAirport = a.AirportCode WHERE a.City = 'Aberdeen'; 
SELECT f.FlightNo FROM flights f JOIN airports a ON f.DestAirport = a.AirportCode WHERE a.City = 'Aberdeen'; 
SELECT COUNT(*) FROM airports AS T1 INNER JOIN flights AS T2 ON T1.AirportCode = T2.DestAirport WHERE T1.City = 'Aberdeen' OR T1.City = 'Abilene'; 
SELECT COUNT(*) FROM flights WHERE DestAirport IN ('APG', 'ABR', 'DYS', 'ABI') 
SELECT AirportName FROM airports WHERE AirportCode NOT IN (SELECT SourceAirport FROM flights) AND AirportCode NOT IN (SELECT DestAirport FROM flights); 
SELECT AirportName FROM airports WHERE AirportCode NOT IN (SELECT SourceAirport FROM flights) AND AirportCode NOT IN (SELECT DestAirport FROM flights); 
SELECT COUNT(Employee_ID) AS Number_of_Employees FROM employee; 
SELECT COUNT(Employee_ID) AS Number_of_Employees FROM employee; 
SELECT Name FROM employee ORDER BY Age ASC
SELECT Name FROM employee ORDER BY Age ASC; 
SELECT City ,  COUNT(*) FROM employee GROUP BY City
SELECT City, COUNT(*) AS Employee_Count FROM employee GROUP BY City; 
SELECT City FROM employee WHERE Age < 30 GROUP BY City HAVING COUNT(Employee_ID) > 1; 
SELECT City FROM employee WHERE Age < 30 GROUP BY City HAVING COUNT(*) > 1
SELECT Location, COUNT(Shop_ID) AS Number_of_Shops FROM shop GROUP BY Location; 
SELECT Location, COUNT(*) AS Number_of_Shops FROM shop GROUP BY Location; 
SELECT Manager_name ,  District FROM shop WHERE Number_products = ( SELECT MAX(Number_products) FROM shop )
SELECT Manager_name ,  District FROM shop ORDER BY Number_products DESC LIMIT 1
SELECT MIN(Number_products) AS MinProducts, MAX(Number_products) AS MaxProducts FROM shop
SELECT MIN(Number_products) AS Min_Products, MAX(Number_products) AS Max_Products FROM shop; 
SELECT Name, Location, District FROM shop ORDER BY Number_products DESC; 
SELECT Name, Location, District FROM shop ORDER BY Number_products DESC
SELECT Name FROM shop WHERE Number_products > (SELECT AVG(Number_products) FROM shop); 
SELECT Name FROM shop WHERE Number_products > (SELECT AVG(Number_products) FROM shop); 
SELECT e.Name  FROM employee e JOIN (     SELECT Employee_ID, COUNT(*) AS Award_Count      FROM evaluation      GROUP BY Employee_ID ) ev ON e.Employee_ID = ev.Employee_ID ORDER BY ev.Award_Count DESC LIMIT 1; 
SELECT T2.Name FROM evaluation AS T1 INNER JOIN employee AS T2 ON T1.Employee_ID = T2.Employee_ID GROUP BY T1.Employee_ID ORDER BY COUNT(T1.AwardID) DESC LIMIT 1
SELECT e.Name FROM employee e JOIN evaluation ev ON e.Employee_ID = ev.Employee_ID ORDER BY ev.Bonus DESC LIMIT 1; 
SELECT e.Name FROM employee e JOIN evaluation ev ON e.Employee_ID = ev.Employee_ID ORDER BY ev.Bonus DESC LIMIT 1; 
SELECT Name FROM employee WHERE Employee_ID NOT IN (SELECT Employee_ID FROM evaluation); 
SELECT Name FROM employee WHERE Employee_ID NOT IN (SELECT Employee_ID FROM evaluation) 
SELECT s.Name FROM shop s JOIN hiring h ON s.Shop_ID = h.Shop_ID GROUP BY s.Name ORDER BY COUNT(h.Employee_ID) DESC LIMIT 1; 
SELECT s.Name  FROM shop s  JOIN hiring h ON s.Shop_ID = h.Shop_ID  GROUP BY s.Name  ORDER BY COUNT(h.Employee_ID) DESC  LIMIT 1; 
SELECT Name FROM shop WHERE Shop_ID NOT IN (SELECT Shop_ID FROM hiring)
SELECT Name FROM shop WHERE Shop_ID NOT IN (SELECT Shop_ID FROM hiring); 
SELECT s.Name, COUNT(h.Employee_ID) AS Number_of_Employees_Hired FROM shop s JOIN hiring h ON s.Shop_ID = h.Shop_ID GROUP BY s.Name; 
SELECT T1.Name ,  COUNT(T2.Employee_ID) FROM shop AS T1 INNER JOIN hiring AS T2 ON T1.Shop_ID = T2.Shop_ID GROUP BY T1.Name
SELECT SUM(Bonus) AS Total_Bonus FROM evaluation; 
SELECT SUM(Bonus) FROM evaluation;
SELECT * FROM hiring;
SELECT * FROM hiring; 
SELECT DISTINCT District  FROM shop  WHERE Number_products < 3000  INTERSECT  SELECT DISTINCT District  FROM shop  WHERE Number_products > 10000; 
SELECT DISTINCT T1.District FROM shop AS T1 WHERE T1.Number_products < 3000 INTERSECT SELECT DISTINCT T1.District FROM shop AS T1 WHERE T1.Number_products > 10000; 
SELECT COUNT(DISTINCT Location) AS Number_of_Unique_Locations FROM shop; 
SELECT COUNT(DISTINCT Location) FROM shop; 
SELECT COUNT(*) AS Total_Documents FROM Documents; 
SELECT COUNT(*) AS Number_of_Documents FROM Documents; 
SELECT Document_ID, Document_Name, Document_Description FROM Documents;
SELECT Document_ID, Document_Name, Document_Description FROM Documents; 
SELECT D.Document_Name, T.Template_ID FROM Documents D JOIN Templates T ON D.Template_ID = T.Template_ID WHERE D.Document_Description LIKE '%w%'; 
SELECT D.Document_Name, D.Template_ID FROM Documents AS D WHERE D.Document_Description LIKE '%w%'
SELECT Document_ID, Template_ID, Document_Description FROM Documents WHERE Document_Name = 'Robbin CV'; 
SELECT Document_ID, Template_ID, Document_Description FROM Documents WHERE Document_Name = 'Robbin CV'
SELECT COUNT(DISTINCT Template_ID) FROM Documents
SELECT COUNT(DISTINCT Template_ID) AS NumberOfDifferentTemplates FROM Documents; 
SELECT COUNT(*) FROM Documents WHERE Template_ID IN (SELECT Template_ID FROM Templates WHERE Template_Type_Code = 'PPT'); 
SELECT COUNT(*) FROM Documents WHERE Template_ID IN (SELECT Template_ID FROM Templates WHERE Template_Type_Code = 'PPT'); 
SELECT T.Template_ID, COUNT(D.Document_ID) AS Number_of_Documents FROM Templates T LEFT JOIN Documents D ON T.Template_ID = D.Template_ID GROUP BY T.Template_ID; 
SELECT Template_ID ,  COUNT(*) FROM Documents GROUP BY Template_ID;
SELECT T.Template_ID, T.Template_Type_Code FROM Templates T JOIN Documents D ON T.Template_ID = D.Template_ID GROUP BY T.Template_ID, T.Template_Type_Code ORDER BY COUNT(D.Document_ID) DESC LIMIT 1; 
SELECT T.Template_ID, T.Template_Type_Code FROM Templates T JOIN Documents D ON T.Template_ID = D.Template_ID GROUP BY T.Template_ID, T.Template_Type_Code ORDER BY COUNT(D.Document_ID) DESC LIMIT 1; 
SELECT Template_ID FROM Documents GROUP BY Template_ID HAVING COUNT(Document_ID) > 1
SELECT Template_ID FROM Documents GROUP BY Template_ID HAVING COUNT(Document_ID) > 1
SELECT Template_ID FROM Templates WHERE Template_ID NOT IN (SELECT Template_ID FROM Documents); 
SELECT Template_ID FROM Templates WHERE Template_ID NOT IN (SELECT Template_ID FROM Documents); 
SELECT COUNT(*) AS Total_Templates FROM Templates; 
SELECT COUNT(*) AS Number_of_Templates FROM Templates; 
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
SELECT Template_Type_Code  FROM Templates  GROUP BY Template_Type_Code  ORDER BY COUNT(Template_ID) DESC  LIMIT 1; 
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code HAVING COUNT(Template_ID) < 3; 
SELECT Template_Type_Code  FROM Templates  GROUP BY Template_Type_Code  HAVING COUNT(Template_ID) < 3; 
SELECT MIN(T1.Version_Number), T1.Template_Type_Code FROM Templates AS T1 GROUP BY T1.Template_Type_Code
SELECT MIN(Version_Number), Template_Type_Code FROM Templates GROUP BY Template_Type_Code ORDER BY Version_Number ASC;
SELECT T2.Template_Type_Code FROM Documents AS T1 INNER JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID WHERE T1.Document_Name = 'Data base'; 
SELECT T.Template_Type_Code FROM Templates AS T JOIN Documents AS D ON T.Template_ID = D.Template_ID WHERE D.Document_Name = 'Data base'; 
SELECT D.Document_Name FROM Documents D JOIN Templates T ON D.Template_ID = T.Template_ID WHERE T.Template_Type_Code = 'BK'; 
SELECT d.Document_Name FROM Documents d JOIN Templates t ON d.Template_ID = t.Template_ID WHERE t.Template_Type_Code = 'BK'; 
SELECT tt.Template_Type_Code, COUNT(d.Document_ID) AS Number_of_Documents FROM Ref_Template_Types tt JOIN Templates t ON tt.Template_Type_Code = t.Template_Type_Code JOIN Documents d ON t.Template_ID = d.Template_ID GROUP BY tt.Template_Type_Code; 
SELECT T2.Template_Type_Code, COUNT(DISTINCT T1.Document_ID) AS Document_Count FROM Documents AS T1 INNER JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T2.Template_Type_Code; 
SELECT Template_Type_Code FROM Documents JOIN Templates ON Documents.Template_ID = Templates.Template_ID GROUP BY Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT Template_Type_Code  FROM Documents  JOIN Templates ON Documents.Template_ID = Templates.Template_ID  GROUP BY Template_Type_Code  ORDER BY COUNT(*) DESC  LIMIT 1; 
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Code NOT IN (SELECT Template_Type_Code FROM Templates WHERE Template_ID IN (SELECT Template_ID FROM Documents)); 
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Code NOT IN (SELECT Template_Type_Code FROM Templates WHERE Template_ID IN (SELECT Template_ID FROM Documents)); 
SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types; 
SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types; 
SELECT Template_Type_Description FROM Ref_Template_Types WHERE Template_Type_Code = 'AD'
SELECT Template_Type_Description FROM Ref_Template_Types WHERE Template_Type_Code = 'AD'
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Book'; 
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Book'; 
SELECT DISTINCT T2.Template_Type_Description FROM Documents AS T1 INNER JOIN Ref_Template_Types AS T2 ON T1.Template_ID = T2.Template_ID
SELECT DISTINCT T2.Template_Type_Description FROM Documents AS T1 INNER JOIN Ref_Template_Types AS T2 ON T1.Template_ID = T2.Template_ID
SELECT T.Template_ID FROM Templates AS T JOIN Ref_Template_Types AS RTT ON T.Template_Type_Code = RTT.Template_Type_Code WHERE RTT.Template_Type_Description = 'Presentation'; 
SELECT Template_ID FROM Templates WHERE Template_Type_Code = 'PPT';
SELECT COUNT(*) AS Total_Paragraphs FROM Paragraphs; 
SELECT COUNT(*) AS NumberOfParagraphs FROM Paragraphs; 
SELECT COUNT(*) FROM Documents AS D JOIN Paragraphs AS P ON D.Document_ID = P.Document_ID WHERE D.Document_Name = 'Summer Show'; 
SELECT COUNT(*) FROM Paragraphs AS P JOIN Documents AS D ON P.Document_ID = D.Document_ID WHERE D.Document_Name = 'Summer Show'; 
SELECT * FROM Paragraphs WHERE Paragraph_Text LIKE '%Korea%'; 
SELECT T2.Template_Details FROM Paragraphs AS T1 INNER JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID WHERE T1.Paragraph_Text LIKE '%Korea%'
SELECT p.Paragraph_ID, p.Paragraph_Text  FROM Paragraphs p  JOIN Documents d ON p.Document_ID = d.Document_ID  WHERE d.Document_Name = 'Welcome to NY'; 
SELECT p.Paragraph_ID, p.Paragraph_Text FROM Documents d JOIN Paragraphs p ON d.Document_ID = p.Document_ID WHERE d.Document_Name = 'Welcome to NY'; 
SELECT p.Paragraph_Text FROM Documents d JOIN Paragraphs p ON d.Document_ID = p.Document_ID WHERE d.Document_Name = 'Customer reviews'; 
SELECT Paragraph_Text FROM Paragraphs WHERE Document_ID IN (SELECT Document_ID FROM Documents WHERE Document_Name = 'Customer reviews') 
SELECT Documents.Document_ID, COUNT(Paragraphs.Paragraph_ID) AS Number_of_Paragraphs FROM Documents LEFT JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID GROUP BY Documents.Document_ID ORDER BY Documents.Document_ID; 
SELECT Document_ID, COUNT(*) FROM Paragraphs GROUP BY Document_ID ORDER BY Document_ID;
SELECT Documents.Document_ID, Documents.Document_Name, COUNT(Paragraphs.Paragraph_ID) AS Number_of_Paragraphs FROM Documents LEFT JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID GROUP BY Documents.Document_ID, Documents.Document_Name; 
SELECT D.Document_ID, D.Document_Name, COUNT(P.Paragraph_ID) AS Number_of_Paragraphs FROM Documents D LEFT JOIN Paragraphs P ON D.Document_ID = P.Document_ID GROUP BY D.Document_ID, D.Document_Name
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(*) >= 2; 
SELECT Document_ID, COUNT(*) AS Paragraph_Count FROM Paragraphs GROUP BY Document_ID HAVING Paragraph_Count >= 2; 
SELECT d.Document_ID, d.Document_Name, COUNT(p.Paragraph_ID) AS Paragraph_Count FROM Documents d JOIN Paragraphs p ON d.Document_ID = p.Document_ID GROUP BY d.Document_ID, d.Document_Name ORDER BY Paragraph_Count DESC LIMIT 1; 
SELECT D.Document_ID, D.Document_Name FROM Documents D JOIN (     SELECT Document_ID, COUNT(*) AS Paragraph_Count     FROM Paragraphs     GROUP BY Document_ID ) P ON D.Document_ID = P.Document_ID ORDER BY P.Paragraph_Count DESC LIMIT 1; 
SELECT Document_ID, COUNT(Paragraph_ID) AS Paragraphs  FROM Documents  JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID  GROUP BY Document_ID  ORDER BY Paragraphs ASC; 
SELECT Document_ID FROM Documents WHERE Template_ID IN (SELECT Template_ID FROM Paragraphs GROUP BY Template_ID ORDER BY COUNT(*) ASC LIMIT 1) 
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(*) BETWEEN 1 AND 2; 
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(*) BETWEEN 1 AND 2
SELECT DISTINCT p.Document_ID FROM Paragraphs p WHERE p.Paragraph_Text LIKE '%Brazil%' AND p.Paragraph_Text LIKE '%Ireland%'; 
SELECT DISTINCT d.Document_ID FROM Documents d JOIN Paragraphs p ON d.Document_ID = p.Document_ID WHERE p.Paragraph_Text LIKE '%Brazil%' AND p.Paragraph_Text LIKE '%Ireland%'; 
SELECT COUNT(*) FROM teacher; 
SELECT COUNT(Teacher_ID) AS Total_Teachers FROM teacher; 
SELECT Name FROM teacher ORDER BY Age ASC; 
SELECT teacher.Name FROM teacher ORDER BY teacher.Age ASC; 
SELECT Age, Hometown FROM teacher; 
SELECT Age, Hometown FROM teacher;
SELECT Name FROM teacher WHERE Hometown != 'Little Lever Urban District'; 
SELECT Name FROM teacher WHERE Hometown != 'Little Lever Urban District'; 
SELECT T.Name FROM teacher AS T WHERE T.Age IN (32, 33) 
SELECT Name FROM teacher WHERE Age IN (32, 33) 
SELECT T2.Hometown FROM course_arrange AS T1 INNER JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID ORDER BY T2.Age ASC LIMIT 1; 
SELECT T2.Hometown FROM course_arrange AS T1 INNER JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID ORDER BY T2.Age ASC LIMIT 1; 
SELECT T2.Hometown, COUNT(*) AS Number_of_Teachers FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T2.Hometown; 
SELECT T2.Hometown, COUNT(*) FROM course_arrange AS T1 INNER JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T2.Hometown
SELECT T.Hometown, COUNT(T.Teacher_ID) AS Count FROM teacher T GROUP BY T.Hometown ORDER BY Count DESC; 
SELECT T2.Hometown, COUNT(*) AS Teacher_Count  FROM course_arrange AS T1  JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID  GROUP BY T2.Hometown  ORDER BY Teacher_Count DESC; 
SELECT T2.Hometown FROM course_arrange AS T1 INNER JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T2.Hometown HAVING COUNT(T2.Teacher_ID) >= 2
SELECT T.Hometown FROM teacher AS T GROUP BY T.Hometown HAVING COUNT(*) >= 2; 
SELECT T2.Name, T1.Course FROM course AS T1 INNER JOIN teacher AS T2 ON T1.Course_ID = T2.Teacher_ID; 
SELECT T2.Name, T1.Course FROM course AS T1 INNER JOIN teacher AS T2 ON T1.Course_ID = T3.Course_ID INNER JOIN course_arrange AS T3 ON T1.Course_ID = T3.Course_ID; 
SELECT T2.Name, T1.Course FROM course AS T1 INNER JOIN teacher AS T2 ON T1.Course_ID = T2.Teacher_ID ORDER BY T2.Name ASC; 
SELECT T2.Name, T1.Course FROM course AS T1 INNER JOIN teacher AS T2 ON T1.Course_ID = T2.Teacher_ID ORDER BY T2.Name ASC; 
SELECT T3.Name FROM course AS T1 INNER JOIN course_arrange AS T2 ON T1.Course_ID = T2.Course_ID INNER JOIN teacher AS T3 ON T2.Teacher_ID = T3.Teacher_ID WHERE T1.Course = 'Math' 
SELECT T3.Name FROM course AS T1 INNER JOIN course_arrange AS T2 ON T1.Course_ID = T2.Course_ID INNER JOIN teacher AS T3 ON T2.Teacher_ID = T3.Teacher_ID WHERE T1.Course = 'Math'; 
SELECT T2.Name, COUNT(T1.Course_ID) AS Course_Count FROM course_arrange AS T1 INNER JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T2.Name; 
SELECT T2.Name, COUNT(T1.Course_ID) AS Course_Count FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T2.Name; 
SELECT T2.Name FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T2.Name HAVING COUNT(T1.Course_ID) >= 2; 
SELECT T.Name FROM teacher AS T JOIN course_arrange AS CA ON T.Teacher_ID = CA.Teacher_ID GROUP BY T.Name HAVING COUNT(CA.Course_ID) >= 2; 
SELECT Name FROM teacher WHERE Teacher_ID NOT IN (SELECT Teacher_ID FROM course_arrange) 
SELECT teacher.Name FROM teacher LEFT JOIN course_arrange ON teacher.Teacher_ID = course_arrange.Teacher_ID WHERE course_arrange.Course_ID IS NULL; 
SELECT COUNT(ID) FROM visitor WHERE Age < 30; 
SELECT Name FROM visitor WHERE Level_of_membership > 4 ORDER BY Level_of_membership DESC; 
SELECT AVG(Age) FROM visitor WHERE Level_of_membership <= 4; 
SELECT Name, Level_of_membership FROM visitor WHERE Level_of_membership > 4 ORDER BY Age DESC; 
SELECT Museum_ID, Name FROM museum ORDER BY Num_of_Staff DESC LIMIT 1; 
SELECT AVG(Num_of_Staff) FROM museum WHERE Open_Year < '2009'; 
SELECT Open_Year, Num_of_Staff FROM museum WHERE Name = 'Plaza Museum'; 
SELECT Name FROM museum WHERE Num_of_Staff > (SELECT MIN(Num_of_Staff) FROM museum WHERE Open_Year > '2010') 
SELECT v.ID, v.Name, v.Age FROM visitor AS v JOIN visit AS vi ON v.ID = vi.visitor_ID GROUP BY v.ID HAVING COUNT(vi.Museum_ID) > 1;
SELECT v.ID AS id, v.Name AS name, v.Level_of_membership AS membership_level, SUM(vt.Total_spent) AS total_spent FROM visitor v JOIN visit vt ON v.ID = vt.visitor_ID GROUP BY v.ID, v.Name, v.Level_of_membership ORDER BY total_spent DESC LIMIT 1; 
SELECT m.Museum_ID, m.Name FROM museum m JOIN visit v ON m.Museum_ID = v.Museum_ID GROUP BY m.Museum_ID, m.Name ORDER BY COUNT(v.Num_of_Ticket) DESC LIMIT 1; 
SELECT Name FROM museum WHERE Museum_ID NOT IN (SELECT Museum_ID FROM visit) 
SELECT v.Name, v.Age FROM visitor v JOIN visit vt ON v.ID = vt.visitor_ID ORDER BY vt.Num_of_Ticket DESC LIMIT 1; 
SELECT AVG(Num_of_Ticket) AS Avg_Tickets, MAX(Num_of_Ticket) AS Max_Tickets FROM visit; 
SELECT SUM(Total_spent) AS Total_Ticket_Expense FROM visit JOIN visitor ON visit.visitor_ID = visitor.ID WHERE visitor.Level_of_membership = 1; 
SELECT T2.Name FROM visit AS T1 JOIN visitor AS T2 ON T1.visitor_ID = T2.ID WHERE T1.Museum_ID IN (SELECT Museum_ID FROM museum WHERE Open_Year < '2009') AND T1.Museum_ID IN (SELECT Museum_ID FROM museum WHERE Open_Year > '2011') GROUP BY T2.Name
SELECT COUNT(DISTINCT visitor_ID) FROM visit WHERE Museum_ID NOT IN (SELECT Museum_ID FROM museum WHERE Open_Year > 2010) 
SELECT COUNT(*) FROM museum WHERE Open_Year < '2008' OR Open_Year > '2013'; 
SELECT COUNT(*) AS total_players FROM players; 
SELECT COUNT(*) AS player_count FROM players; 
SELECT COUNT(*) AS total_matches FROM matches; 
SELECT COUNT(*) AS match_count FROM matches; 
SELECT first_name, birth_date FROM players WHERE country_code = 'USA'; 
SELECT first_name, birth_date FROM players WHERE country_code = 'USA'; 
SELECT 'Losers' AS Result, AVG(loser_age) AS Average_Age FROM matches UNION ALL SELECT 'Winners' AS Result, AVG(winner_age) AS Average_Age FROM matches; 
SELECT AVG(loser_age) AS avg_loser_age, AVG(winner_age) AS avg_winner_age FROM matches; 
SELECT AVG(winner_rank) AS avg_winner_rank FROM matches; 
SELECT AVG(winner_rank) AS average_winner_rank FROM matches; 
SELECT MAX(loser_rank) AS highest_loser_rank FROM matches; 
SELECT MIN(loser_rank) AS best_rank FROM matches; 
SELECT COUNT(DISTINCT country_code) FROM players;
SELECT COUNT(DISTINCT country_code) FROM players;
SELECT COUNT(DISTINCT loser_name) AS num_distinct_losers FROM matches; 
SELECT COUNT(DISTINCT loser_name) AS distinct_loser_names FROM matches; 
SELECT tournament_name  FROM matches  GROUP BY tournament_name  HAVING COUNT(*) > 10; 
SELECT tourney_name  FROM matches  GROUP BY tourney_name  HAVING COUNT(match_num) > 10; 
SELECT DISTINCT winner_name FROM matches WHERE year IN (2013, 2016) GROUP BY winner_name HAVING COUNT(DISTINCT year) > 1; 
SELECT DISTINCT winner_name FROM matches WHERE year = 2013 INTERSECT SELECT DISTINCT winner_name FROM matches WHERE year = 2016; 
SELECT COUNT(*) FROM matches WHERE year IN (2013, 2016); 
SELECT COUNT(*) FROM matches WHERE year IN (2013, 2016); 
SELECT p.country_code, p.first_name FROM players p JOIN matches m ON p.player_id = m.winner_id WHERE m.tourney_name IN ('WTA Championships', 'Australian Open') GROUP BY p.country_code, p.first_name HAVING COUNT(DISTINCT m.tourney_name) = 2; 
SELECT DISTINCT p.first_name, p.country_code FROM players p JOIN matches m ON p.player_id = m.winner_id WHERE m.tourney_name IN ('WTA Championships', 'Australian Open') GROUP BY p.player_id, p.first_name, p.country_code HAVING COUNT(DISTINCT m.tourney_name) > 1; 
SELECT first_name, country_code FROM players ORDER BY birth_date ASC LIMIT 1; 
SELECT first_name, country_code FROM players ORDER BY birth_date ASC LIMIT 1; 
SELECT first_name, last_name FROM players ORDER BY birth_date; 
SELECT first_name, last_name FROM players ORDER BY birth_date; 
SELECT first_name, last_name FROM players WHERE hand = 'L' ORDER BY birth_date; 
SELECT first_name, last_name FROM players WHERE hand = 'L' ORDER BY birth_date ASC; 
SELECT p.first_name, p.country_code FROM players p JOIN rankings r ON p.player_id = r.player_id GROUP BY p.first_name, p.country_code ORDER BY SUM(r.tours) DESC LIMIT 1; 
SELECT p.first_name, p.country_code FROM players p JOIN (     SELECT player_id, SUM(tours) AS total_tours     FROM rankings     GROUP BY player_id ) r ON p.player_id = r.player_id ORDER BY r.total_tours DESC LIMIT 1; 
SELECT year FROM matches GROUP BY year ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT YEAR, COUNT(*) AS match_count FROM matches GROUP BY YEAR ORDER BY match_count DESC LIMIT 1; 
SELECT p.first_name, p.last_name, MAX(wins) AS total_wins, SUM(m.winner_rank_points) AS total_rank_points FROM players p JOIN matches m ON p.player_id = m.winner_id GROUP BY p.player_id, p.first_name, p.last_name ORDER BY total_wins DESC, total_rank_points DESC LIMIT 1; 
SELECT p.first_name, p.last_name, r.ranking_points FROM players p JOIN ( 	SELECT winner_id, COUNT(*) AS match_count 	FROM matches 	GROUP BY winner_id ) m ON p.player_id = m.winner_id JOIN rankings r ON p.player_id = r.player_id WHERE m.match_count = ( 	SELECT MAX(match_count) 	FROM ( 		SELECT COUNT(*) AS match_count 		FROM matches 		GROUP BY winner_id 	) AS subquery ) ORDER BY r.ranking_points DESC; 
SELECT T2.winner_name FROM matches AS T1 INNER JOIN players AS T2 ON T1.winner_id = T2.player_id WHERE T1.tourney_name = 'Australian Open' ORDER BY T2.winner_rank_points DESC LIMIT 1; 
SELECT w.first_name, w.last_name, SUM(m.winner_rank_points) AS total_rank_points FROM players w JOIN matches m ON w.player_id = m.winner_id WHERE m.tourney_name = 'Australian Open' GROUP BY w.player_id, w.first_name, w.last_name ORDER BY total_rank_points DESC LIMIT 1; 
SELECT loser_name AS loser, winner_name AS winner FROM matches ORDER BY minutes DESC LIMIT 1; 
SELECT winner_name, loser_name FROM matches ORDER BY minutes DESC LIMIT 1; 
SELECT p.first_name, AVG(r.ranking) AS avg_ranking FROM players p JOIN rankings r ON p.player_id = r.player_id GROUP BY p.player_id, p.first_name; 
SELECT p.first_name, AVG(r.ranking) AS avg_ranking FROM players p JOIN rankings r ON p.player_id = r.player_id GROUP BY p.first_name; 
SELECT p.first_name, SUM(r.ranking_points) AS total_ranking_points FROM players p JOIN rankings r ON p.player_id = r.player_id GROUP BY p.player_id, p.first_name; 
SELECT p.first_name, SUM(r.ranking_points) AS total_ranking_points FROM players p JOIN rankings r ON p.player_id = r.player_id GROUP BY p.player_id; 
SELECT COUNT(players.player_id) AS player_count, players.country_code AS country FROM players GROUP BY players.country_code; 
SELECT COUNT(player_id) AS player_count, country_code FROM players GROUP BY country_code;
SELECT country_code  FROM players  GROUP BY country_code  ORDER BY COUNT(*) DESC  LIMIT 1; 
SELECT country_code  FROM players  GROUP BY country_code  ORDER BY COUNT(player_id) DESC  LIMIT 1; 
SELECT country_code FROM players GROUP BY country_code HAVING COUNT(player_id) > 50; 
SELECT country_code  FROM players  GROUP BY country_code  HAVING COUNT(player_id) > 50; 
SELECT ranking_date, SUM(tours) AS total_tours FROM rankings GROUP BY ranking_date; 
SELECT ranking_date, SUM(tours) AS total_tours FROM rankings GROUP BY ranking_date; 
SELECT year, COUNT(*) AS num_matches FROM matches GROUP BY year; 
SELECT year, COUNT(*) AS match_count FROM matches GROUP BY year; 
SELECT p.first_name, p.last_name, m.winner_rank FROM players p JOIN matches m ON p.player_id = m.winner_id ORDER BY m.winner_age ASC LIMIT 3; 
SELECT p.first_name, p.last_name, m.winner_rank FROM players p JOIN matches m ON p.player_id = m.winner_id ORDER BY p.birth_date DESC LIMIT 3; 
SELECT COUNT(DISTINCT winner_id) AS num_winners FROM matches WHERE tourney_name = 'WTA Championships' AND winner_hand = 'L'; 
SELECT COUNT(winner_id) AS num_left_handed_winners FROM matches JOIN players ON matches.winner_id = players.player_id WHERE players.hand = 'L' AND matches.tourney_name = 'WTA Championships'; 
SELECT p.first_name, p.country_code, p.birth_date FROM players p JOIN (     SELECT winner_id, SUM(winner_rank_points) AS total_rank_points     FROM matches     GROUP BY winner_id     ORDER BY total_rank_points DESC     LIMIT 1 ) m ON p.player_id = m.winner_id; 
SELECT p.first_name, p.country_code, p.birth_date  FROM players p  JOIN ( 	SELECT winner_id, SUM(winner_rank_points) AS total_points  	FROM matches  	GROUP BY winner_id ) m ON p.player_id = m.winner_id  ORDER BY m.total_points DESC, p.first_name ASC, p.country_code ASC, p.birth_date ASC  LIMIT 1; 
SELECT hand, COUNT(*) AS player_count FROM players GROUP BY hand; 
SELECT hand, COUNT(*) AS player_count FROM players GROUP BY hand; 
SELECT COUNT(*) FROM ship WHERE disposition_of_ship = 'Captured'; 
SELECT name, tonnage FROM ship ORDER BY name DESC; 
SELECT name, date, result FROM battle; 
SELECT MAX(killed) AS max_death_toll, MIN(killed) AS min_death_toll FROM death; 
SELECT AVG(injured) AS average_injuries FROM death; 
SELECT d.killed, d.injured FROM death d JOIN ship s ON d.caused_by_ship_id = s.id WHERE s.tonnage = 't'; 
SELECT name, result FROM battle WHERE bulgarian_commander != 'Boril'; 
SELECT DISTINCT T1.id, T1.name FROM battle AS T1 INNER JOIN ship AS T2 ON T1.id = T2.lost_in_battle WHERE T2.ship_type = 'Brig'
SELECT b.id, b.name  FROM battle b  JOIN ship s ON b.id = s.lost_in_battle  JOIN death d ON s.id = d.caused_by_ship_id  GROUP BY b.id, b.name  HAVING SUM(d.killed) > 10; 
SELECT s.id AS ship_id, s.name AS ship_name, SUM(d.injured) AS total_injuries FROM ship s JOIN death d ON s.id = d.caused_by_ship_id GROUP BY s.id, s.name ORDER BY total_injuries DESC LIMIT 1; 
SELECT DISTINCT name FROM battle WHERE bulgarian_commander = 'Kaloyan' AND latin_commander = 'Baldwin I'
SELECT COUNT(DISTINCT result) AS distinct_results FROM battle; 
SELECT COUNT(*) FROM battle WHERE id NOT IN ( 	SELECT lost_in_battle FROM ship WHERE tonnage = '225' ) 
SELECT b.name, b.date  FROM battle b  JOIN ship s ON b.id = s.lost_in_battle  WHERE s.name IN ('Lettice', 'HMS Atalanta') 
SELECT b.name, b.result, b.bulgarian_commander FROM battle b WHERE b.id NOT IN (SELECT s.lost_in_battle FROM ship s WHERE s.location = 'English Channel' AND s.lost_in_battle IS NOT NULL) 
SELECT note FROM death WHERE note LIKE '%East%'; 
SELECT line_1, line_2 FROM Addresses; 
SELECT line_1, line_2 FROM Addresses; 
SELECT COUNT(course_id) AS total_courses FROM Courses; 
SELECT COUNT(*) AS total_courses FROM Courses; 
SELECT course_description FROM Courses WHERE course_name = 'math'; 
SELECT course_description FROM Courses WHERE course_name = 'math'; 
SELECT zip_postcode FROM Addresses WHERE city = 'Port Chelsea'
SELECT zip_postcode FROM Addresses WHERE city = 'Port Chelsea'; 
SELECT d.department_name, d.department_id FROM Departments d JOIN Degree_Programs dp ON d.department_id = dp.department_id GROUP BY d.department_name, d.department_id ORDER BY COUNT(dp.degree_program_id) DESC LIMIT 1; 
SELECT d.department_name, d.department_id  FROM Departments d  JOIN Degree_Programs dp ON d.department_id = dp.department_id  GROUP BY d.department_id, d.department_name  ORDER BY COUNT(dp.degree_program_id) DESC  LIMIT 1; 
SELECT COUNT(DISTINCT department_id) FROM Degree_Programs;
SELECT COUNT(DISTINCT department_id) AS number_of_departments_offering_degrees FROM Degree_Programs; 
SELECT COUNT(DISTINCT degree_summary_name) AS distinct_degree_names FROM Degree_Programs; 
SELECT COUNT(DISTINCT degree_summary_name) AS number_of_degrees FROM Degree_Programs; 
SELECT COUNT(degree_program_id) AS degree_count FROM Degree_Programs WHERE department_id = (SELECT department_id FROM Departments WHERE department_name = 'engineering'); 
SELECT COUNT(degree_program_id) AS number_of_degrees FROM Degree_Programs WHERE department_id = (SELECT department_id FROM Departments WHERE department_name = 'engineering'); 
SELECT section_name, section_description FROM Sections; 
SELECT section_name, section_description FROM Sections; 
SELECT course_name, course_id FROM Courses WHERE course_id IN (SELECT course_id FROM Sections GROUP BY course_id HAVING COUNT(section_id) <= 2) 
SELECT course_name, course_id FROM Courses WHERE course_id IN (SELECT course_id FROM Sections GROUP BY course_id HAVING COUNT(section_id) < 2) 
SELECT section_name FROM Sections ORDER BY section_name DESC; 
SELECT section_name FROM Sections ORDER BY section_name DESC; 
SELECT s.semester_id, s.semester_name  FROM Semesters s  JOIN Student_Enrolment se ON s.semester_id = se.semester_id  GROUP BY s.semester_id, s.semester_name  ORDER BY COUNT(se.student_id) DESC  LIMIT 1; 
SELECT s.semester_name, c.course_name, c.course_id FROM Semesters s JOIN Student_Enrolment se ON s.semester_id = se.semester_id JOIN Student_Enrolment_Courses sec ON se.student_enrolment_id = sec.student_enrolment_id JOIN Courses c ON sec.course_id = c.course_id WHERE (s.semester_id, c.course_id) IN (     SELECT semester_id, course_id     FROM Student_Enrolment     JOIN Student_Enrolment_Courses ON Student_Enrolment.student_enrolment_id = Student_Enrolment_Courses.student_enrolment_id     GROUP BY semester_id, course_id     ORDER BY COUNT(student_id) DESC     LIMIT 1 ) ORDER BY s.semester_id; 
SELECT department_description FROM Departments WHERE department_name LIKE '%computer%'; 
SELECT department_description FROM Departments WHERE department_name LIKE '%computer%' 
SELECT s.first_name, s.middle_name, s.last_name, s.student_id FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id GROUP BY s.student_id HAVING COUNT(DISTINCT se.degree_program_id) = 2 AND COUNT(DISTINCT se.semester_id) = 1; 
SELECT s.first_name, s.middle_name, s.last_name, s.student_id FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id GROUP BY s.student_id HAVING COUNT(DISTINCT se.degree_program_id) = 2; 
SELECT s.first_name, s.middle_name, s.last_name FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id JOIN Degree_Programs dp ON se.degree_program_id = dp.degree_program_id WHERE dp.degree_summary_name = 'Bachelor'; 
SELECT s.first_name, s.middle_name, s.last_name FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id JOIN Degree_Programs dp ON se.degree_program_id = dp.degree_program_id WHERE dp.degree_summary_name = 'Bachelor'
SELECT dp.degree_summary_name, COUNT(se.student_id) AS student_count FROM Degree_Programs dp JOIN Student_Enrolment se ON dp.degree_program_id = se.degree_program_id GROUP BY dp.degree_summary_name ORDER BY student_count DESC LIMIT 1; 
SELECT dp.degree_summary_name, COUNT(se.student_id) AS student_count FROM Degree_Programs dp JOIN Student_Enrolment se ON dp.degree_program_id = se.degree_program_id GROUP BY dp.degree_summary_name ORDER BY student_count DESC LIMIT 1; 
SELECT dp.degree_program_id, dp.degree_summary_name FROM Degree_Programs dp JOIN Student_Enrolment se ON dp.degree_program_id = se.degree_program_id GROUP BY dp.degree_program_id, dp.degree_summary_name ORDER BY COUNT(se.student_id) DESC LIMIT 1; 
SELECT dp.degree_program_id, dp.degree_summary_name FROM Degree_Programs dp JOIN Student_Enrolment se ON dp.degree_program_id = se.degree_program_id GROUP BY dp.degree_program_id, dp.degree_summary_name ORDER BY COUNT(se.student_id) DESC LIMIT 1; 
SELECT s.student_id, s.first_name, s.middle_name, s.last_name, COUNT(se.student_enrolment_id) AS number_of_enrollments FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id GROUP BY s.student_id, s.first_name, s.middle_name, s.last_name ORDER BY number_of_enrollments DESC LIMIT 1; 
SELECT s.first_name, s.middle_name, s.last_name, s.student_id, COUNT(se.student_id) AS num_enrollments FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id GROUP BY s.student_id ORDER BY num_enrollments DESC LIMIT 1; 
SELECT semester_name FROM Semesters WHERE semester_id NOT IN (SELECT semester_id FROM Student_Enrolment);
SELECT semester_name FROM Semesters WHERE semester_id NOT IN (SELECT semester_id FROM Student_Enrolment) 
SELECT DISTINCT c.course_name FROM Courses c JOIN Student_Enrolment_Courses sec ON c.course_id = sec.course_id; 
SELECT course_name FROM Courses WHERE course_id IN (SELECT course_id FROM Student_Enrolment_Courses);
SELECT c.course_name, COUNT(sec.section_id) AS enrollment_count FROM Courses c JOIN Sections sec ON c.course_id = sec.course_id GROUP BY c.course_name ORDER BY enrollment_count DESC LIMIT 1; 
SELECT C.course_name FROM Courses C JOIN Student_Enrolment_Courses SEC ON C.course_id = SEC.course_id GROUP BY C.course_name ORDER BY COUNT(SEC.student_course_id) DESC LIMIT 1; 
SELECT s.last_name FROM Students s JOIN Addresses a ON s.current_address_id = a.address_id WHERE a.state_province_county = 'North Carolina' AND NOT EXISTS ( 	SELECT 1 	FROM Student_Enrolment se 	WHERE se.student_id = s.student_id ); 
SELECT s.last_name FROM Students s JOIN Addresses a ON s.current_address_id = a.address_id WHERE a.state_province_county = 'North Carolina' AND NOT EXISTS (     SELECT 1     FROM Student_Enrolment se     WHERE se.student_id = s.student_id ); 
SELECT t.transcript_date, t.transcript_id FROM Transcripts t JOIN Transcript_Contents tc ON t.transcript_id = tc.transcript_id GROUP BY t.transcript_id HAVING COUNT(tc.student_course_id) >= 2; 
SELECT t.transcript_date, t.transcript_id FROM Transcripts t JOIN Transcript_Contents tc ON t.transcript_id = tc.transcript_id GROUP BY t.transcript_date, t.transcript_id HAVING COUNT(tc.student_course_id) >= 2; 
SELECT cell_mobile_number FROM Students WHERE first_name = 'Timmothy' AND last_name = 'Ward'; 
SELECT cell_mobile_number FROM Students WHERE first_name = 'Timmothy' AND last_name = 'Ward'; 
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_first_registered ASC LIMIT 1; 
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_first_registered ASC LIMIT 1; 
SELECT first_name, middle_name, last_name FROM Students WHERE date_left IS NOT NULL ORDER BY date_left ASC LIMIT 1; 
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_left ASC LIMIT 1; 
SELECT first_name FROM Students WHERE permanent_address_id != current_address_id;
SELECT s.first_name FROM Students s WHERE s.permanent_address_id <> s.current_address_id; 
SELECT a.address_id, a.line_1, a.line_2, a.line_3 FROM Addresses a JOIN Students s ON a.address_id = s.current_address_id GROUP BY a.address_id, a.line_1, a.line_2, a.line_3 ORDER BY COUNT(s.student_id) DESC LIMIT 1; 
SELECT a.address_id, a.line_1, a.line_2 FROM Addresses a JOIN Students s ON a.address_id = s.current_address_id GROUP BY a.address_id, a.line_1, a.line_2 ORDER BY COUNT(s.student_id) DESC LIMIT 1; 
SELECT AVG(transcript_date) AS average_transcript_date FROM Transcripts; 
SELECT AVG(transcript_date) AS average_transcript_date FROM Transcripts; 
SELECT transcript_date, other_details FROM Transcripts ORDER BY transcript_date ASC LIMIT 1; 
SELECT MIN(transcript_date), other_details FROM Transcripts;
SELECT COUNT(transcript_id) AS number_of_transcripts FROM Transcripts; 
SELECT COUNT(transcript_id) FROM Transcripts; 
SELECT transcript_date FROM Transcripts ORDER BY transcript_date DESC LIMIT 1
SELECT MAX(transcript_date) AS last_transcript_release FROM Transcripts; 
SELECT MAX(COUNT(*)) AS max_occurrences, student_course_id FROM Transcript_Contents GROUP BY student_course_id; 
SELECT course_id, COUNT(transcript_id) AS max_occurrences FROM Student_Enrolment_Courses JOIN Transcript_Contents ON Student_Enrolment_Courses.student_course_id = Transcript_Contents.student_course_id GROUP BY course_id ORDER BY max_occurrences DESC LIMIT 1; 
SELECT transcript_date, transcript_id  FROM Transcripts  JOIN Transcript_Contents ON Transcripts.transcript_id = Transcript_Contents.transcript_id  GROUP BY transcript_date, transcript_id  ORDER BY COUNT(*) ASC  LIMIT 1; 
SELECT T1.transcript_date, T1.transcript_id FROM Transcripts AS T1 JOIN Transcript_Contents AS T2 ON T1.transcript_id = T2.transcript_id GROUP BY T1.transcript_id ORDER BY COUNT(T2.student_course_id) ASC, T1.transcript_date ASC LIMIT 1; 
SELECT semester_name FROM Semesters WHERE semester_id IN (     SELECT semester_id FROM Student_Enrolment WHERE degree_program_id IN (         SELECT degree_program_id FROM Degree_Programs WHERE degree_summary_name = 'Master'     )     INTERSECT     SELECT semester_id FROM Student_Enrolment WHERE degree_program_id IN (         SELECT degree_program_id FROM Degree_Programs WHERE degree_summary_name = 'Bachelor'     ) ) ORDER BY semester_name; 
SELECT semester_id FROM Student_Enrolment WHERE degree_program_id IN (     SELECT degree_program_id     FROM Degree_Programs     WHERE degree_summary_name = 'Master' ) INTERSECT SELECT semester_id FROM Student_Enrolment WHERE degree_program_id IN (     SELECT degree_program_id     FROM Degree_Programs     WHERE degree_summary_name = 'Bachelor' ); 
SELECT COUNT(DISTINCT current_address_id) AS number_of_different_addresses FROM Students; 
SELECT DISTINCT current_address_id, permanent_address_id FROM Students; 
SELECT * FROM Students ORDER BY first_name DESC, middle_name DESC, last_name DESC; 
SELECT * FROM Students ORDER BY last_name DESC; 
SELECT sections.section_name FROM Sections AS sections WHERE sections.section_name = 'h'; 
SELECT section_description FROM Sections WHERE section_name = 'h'; 
SELECT first_name FROM Students WHERE permanent_address_id IN ( SELECT address_id FROM Addresses WHERE country = 'Haiti' ) OR cell_mobile_number = '09700166582'
SELECT first_name FROM Students WHERE permanent_address_id IN ( SELECT address_id FROM Addresses WHERE country = 'Haiti' ) OR cell_mobile_number = '09700166582'; 
SELECT Title FROM Cartoon ORDER BY Title ASC; 
SELECT Title FROM Cartoon ORDER BY Title ASC; 
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones'; 
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones'; 
SELECT COUNT(*) FROM Cartoon WHERE Written_by = 'Joseph Kuhr'; 
SELECT COUNT(*) FROM Cartoon WHERE Written_by = 'Joseph Kuhr'; 
SELECT Title, Directed_by FROM Cartoon ORDER BY Original_air_date; 
SELECT Title, Directed_by FROM Cartoon ORDER BY Original_air_date; 
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones' OR Directed_by = 'Brandon Vietti';
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones' OR Directed_by = 'Brandon Vietti'; 
SELECT Country ,  COUNT(id) FROM TV_Channel GROUP BY Country ORDER BY COUNT(id) DESC LIMIT 1
SELECT Country, COUNT(id) AS NumberOfChannels FROM TV_Channel GROUP BY Country ORDER BY NumberOfChannels DESC LIMIT 1; 
SELECT COUNT(DISTINCT series_name), COUNT(DISTINCT Content) FROM TV_Channel;
SELECT COUNT(DISTINCT series_name), COUNT(DISTINCT Content) FROM TV_Channel; 
SELECT Content FROM TV_Channel WHERE series_name = 'Sky Radio'; 
SELECT Content FROM TV_Channel WHERE series_name = 'Sky Radio'; 
SELECT Package_Option FROM TV_Channel WHERE series_name = 'Sky Radio'
SELECT DISTINCT Package_Option FROM TV_Channel WHERE series_name = 'Sky Radio'
SELECT COUNT(*) FROM TV_Channel WHERE Language = 'English'; 
SELECT COUNT(*) FROM TV_Channel WHERE Language = 'English'
SELECT Language, COUNT(id) AS Number_of_TV_Channels FROM TV_Channel GROUP BY Language ORDER BY Number_of_TV_Channels ASC LIMIT 1; 
SELECT Language, COUNT(id) AS Channel_Count FROM TV_Channel GROUP BY Language ORDER BY Channel_Count ASC LIMIT 1;
SELECT Language ,  COUNT(*) FROM TV_Channel GROUP BY Language
SELECT Language ,  COUNT(id) FROM TV_Channel GROUP BY Language
SELECT T1.series_name FROM TV_Channel AS T1 INNER JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Title = 'The Rise of the Blue Beetle!'
SELECT T1.series_name FROM TV_Channel AS T1 INNER JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Title = 'The Rise of the Blue Beetle'
SELECT T2.Title FROM TV_Channel AS T1 INNER JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T1.series_name = 'Sky Radio'; 
SELECT C.Title FROM Cartoon AS C JOIN TV_Channel AS TC ON C.Channel = TC.id WHERE TC.series_name = 'Sky Radio'; 
SELECT Episode FROM TV_series ORDER BY Rating DESC; 
SELECT Episode FROM TV_series ORDER BY Rating DESC; 
SELECT T2.Episode, T2.Rating FROM TV_Channel AS T1 INNER JOIN TV_series AS T2 ON T1.id = T2.Channel ORDER BY T2.Rating DESC LIMIT 3; 
SELECT Episode, Rating FROM TV_series ORDER BY Rating DESC LIMIT 3; 
SELECT MIN(Share) AS Min_Share, MAX(Share) AS Max_Share FROM TV_series
SELECT max(Share) ,  min(Share) FROM TV_series
SELECT Air_Date FROM TV_series WHERE Episode = 'A Love of a Lifetime'
SELECT Air_Date FROM TV_series WHERE Episode = 'A Love of a Lifetime'; 
SELECT Weekly_Rank FROM TV_series WHERE Episode = 'A Love of a Lifetime'; 
SELECT Weekly_Rank FROM TV_series WHERE Episode = 'A Love of a Lifetime'; 
SELECT T2.series_name FROM TV_series AS T1 INNER JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T1.Episode = 'A Love of a Lifetime'
SELECT T2.series_name FROM TV_series AS T1 INNER JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T1.Episode = 'A Love of a Lifetime'
SELECT T2.Episode FROM TV_Channel AS T1 INNER JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T1.series_name = 'Sky Radio'
SELECT T2.Episode FROM TV_Channel AS T1 INNER JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T1.series_name = 'Sky Radio'; 
SELECT Directed_by, COUNT(*) AS Number_of_Cartoons FROM Cartoon GROUP BY Directed_by; 
SELECT Directed_by ,  COUNT(id) FROM Cartoon GROUP BY Directed_by
SELECT T1.Production_code, T2.series_name  FROM Cartoon AS T1  JOIN TV_Channel AS T2 ON T1.Channel = T2.id  ORDER BY T1.Original_air_date DESC  LIMIT 1; 
SELECT Production_code, Channel FROM Cartoon ORDER BY Original_air_date DESC LIMIT 1; 
SELECT T2.Package_Option, T1.series_name FROM TV_Channel AS T1 INNER JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T1.Hight_definition_TV = 'yes'
SELECT T1.Package_Option, T2.series_name FROM TV_Channel AS T1 INNER JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T1.Hight_definition_TV = 'yes'
SELECT DISTINCT T1.Country FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Written_by = 'Todd Casey'; 
SELECT DISTINCT T1.Country FROM TV_Channel AS T1 INNER JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Written_by = 'Todd Casey'
SELECT DISTINCT T1.Country FROM TV_Channel AS T1 WHERE T1.id NOT IN (SELECT Channel FROM Cartoon WHERE Written_by = 'Todd Casey') 
SELECT DISTINCT Country FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Written_by = 'Todd Casey') 
SELECT T1.series_name, T1.Country FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Directed_by IN ('Ben Jones', 'Michael Chang') GROUP BY T1.series_name, T1.Country; 
SELECT T1.series_name, T1.Country FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Directed_by IN ('Ben Jones', 'Michael Chang') 
SELECT Pixel_aspect_ratio_PAR, Country FROM TV_Channel WHERE Language != 'English'; 
SELECT Pixel_aspect_ratio_PAR, Country FROM TV_Channel WHERE Language != 'English'
SELECT id FROM TV_Channel GROUP BY Country HAVING COUNT(id) > 2; 
SELECT id FROM TV_Channel GROUP BY id HAVING COUNT(id) > 2; 
SELECT id FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones') 
SELECT id FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones') 
SELECT DISTINCT T1.Package_Option FROM TV_Channel AS T1 LEFT JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Directed_by != 'Ben Jones'; 
SELECT DISTINCT T1.Package_Option FROM TV_Channel AS T1 WHERE T1.id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones') 
SELECT COUNT(*) AS Number_of_Poker_Players FROM poker_player; 
SELECT COUNT(*) AS NumberOfPokerPlayers FROM poker_player; 
SELECT Earnings FROM poker_player ORDER BY Earnings DESC;
SELECT Earnings FROM poker_player ORDER BY Earnings DESC; 
SELECT Final_Table_Made, Best_Finish FROM poker_player;
SELECT Final_Table_Made, Best_Finish FROM poker_player; 
SELECT AVG(Earnings) AS Average_Earnings FROM poker_player; 
SELECT AVG(Earnings) AS Average_Earnings FROM poker_player; 
SELECT Money_Rank FROM poker_player ORDER BY Earnings DESC LIMIT 1
SELECT Money_Rank FROM poker_player ORDER BY Earnings DESC LIMIT 1
SELECT MAX(Final_Table_Made) FROM poker_player WHERE Earnings < 200000
SELECT MAX(Final_Table_Made) FROM poker_player WHERE Earnings < 200000
SELECT T2.Name FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID; 
SELECT T2.Name FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID
SELECT T2.Name FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID WHERE T1.Earnings > 300000
SELECT p.Name FROM poker_player AS pp JOIN people AS p ON pp.People_ID = p.People_ID WHERE pp.Earnings > 300000; 
SELECT T2.Name FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Final_Table_Made ASC; 
SELECT p.Name  FROM people AS p  JOIN poker_player AS pp ON p.People_ID = pp.People_ID  GROUP BY p.Name  ORDER BY SUM(pp.Final_Table_Made) ASC; 
SELECT T2.Birth_Date  FROM poker_player AS T1  JOIN people AS T2 ON T1.People_ID = T2.People_ID  ORDER BY T1.Earnings ASC  LIMIT 1; 
SELECT T2.Birth_Date FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Earnings ASC LIMIT 1
SELECT p.Money_Rank FROM poker_player p JOIN people pe ON p.People_ID = pe.People_ID ORDER BY pe.Height DESC LIMIT 1; 
SELECT T1.Money_Rank FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T2.Height DESC LIMIT 1
SELECT AVG(p.Earnings) AS Average_Earnings FROM poker_player p JOIN people pp ON p.People_ID = pp.People_ID WHERE pp.Height > 200; 
SELECT AVG(Earnings) AS Average_Earnings FROM poker_player INNER JOIN people ON poker_player.People_ID = people.People_ID WHERE Height > 200; 
SELECT p.Name FROM people AS p JOIN poker_player AS pp ON p.People_ID = pp.People_ID ORDER BY pp.Earnings DESC; 
SELECT T2.Name FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Earnings DESC; 
SELECT p.Nationality, COUNT(*) AS Number_of_People FROM poker_player pp JOIN people p ON pp.People_ID = p.People_ID GROUP BY p.Nationality; 
SELECT p.Nationality, COUNT(*) AS NumberOfPeople FROM poker_player pp JOIN people p ON pp.People_ID = p.People_ID GROUP BY p.Nationality; 
SELECT p.Nationality, COUNT(*) AS Count FROM poker_player pp JOIN people p ON pp.People_ID = p.People_ID GROUP BY p.Nationality ORDER BY Count DESC LIMIT 1; 
SELECT T2.Nationality, COUNT(*) AS Count FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID GROUP BY T2.Nationality ORDER BY Count DESC LIMIT 1; 
SELECT Nationality FROM people GROUP BY Nationality HAVING COUNT(*) >= 2; 
SELECT T.Nationality FROM (     SELECT P.Nationality, COUNT(P.People_ID) AS Count     FROM poker_player PP     JOIN people P ON PP.People_ID = P.People_ID     GROUP BY P.Nationality ) T WHERE T.Count >= 2; 
SELECT T2.Name, T2.Birth_Date FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T2.Name ASC; 
SELECT T2.Name, T2.Birth_Date FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T2.Name ASC
SELECT p.Name FROM poker_player pp JOIN people p ON pp.People_ID = p.People_ID WHERE p.Nationality != 'Russia'; 
SELECT T2.Name FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID WHERE T2.Nationality != 'Russia'; 
SELECT Name FROM people WHERE People_ID NOT IN (SELECT People_ID FROM poker_player); 
SELECT Name FROM people WHERE People_ID NOT IN (SELECT People_ID FROM poker_player) 
SELECT COUNT(DISTINCT Nationality) FROM people; 
SELECT COUNT(DISTINCT Nationality) FROM people;
SELECT COUNT(DISTINCT state) AS number_of_states FROM VOTES; 
SELECT C.contestant_number, C.contestant_name FROM CONTESTANTS AS C ORDER BY C.contestant_name DESC; 
SELECT vote_id, phone_number, state FROM VOTES; 
SELECT MAX(T1.area_code), MIN(T1.area_code) FROM AREA_CODE_STATE AS T1; 
SELECT MAX(created) AS last_date_created FROM VOTES WHERE state = 'CA'; 
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name != 'Jessie Alloway'; 
SELECT DISTINCT state, created FROM VOTES; 
SELECT C.contestant_number, C.contestant_name FROM CONTESTANTS AS C JOIN VOTES AS V ON C.contestant_number = V.contestant_number GROUP BY C.contestant_number, C.contestant_name HAVING COUNT(V.vote_id) >= 2; 
SELECT c.contestant_number, c.contestant_name, COUNT(v.vote_id) AS vote_count FROM CONTESTANTS c JOIN VOTES v ON c.contestant_number = v.contestant_number GROUP BY c.contestant_number, c.contestant_name ORDER BY vote_count ASC LIMIT 1; 
SELECT COUNT(*) FROM VOTES WHERE state IN ('NY', 'CA'); 
SELECT COUNT(*) AS unvoted_contestants FROM CONTESTANTS WHERE contestant_number NOT IN (SELECT contestant_number FROM VOTES); 
SELECT T1.area_code FROM AREA_CODE_STATE AS T1 JOIN VOTES AS T2 ON T1.state = T2.state GROUP BY T1.area_code ORDER BY COUNT(T2.vote_id) DESC LIMIT 1; 
SELECT T1.created, T1.state, T1.phone_number FROM VOTES AS T1 INNER JOIN CONTESTANTS AS T2 ON T1.contestant_number = T2.contestant_number WHERE T2.contestant_name = 'Tabatha Gehling'
SELECT DISTINCT acs.area_code FROM AREA_CODE_STATE acs JOIN VOTES v ON acs.state = v.state JOIN CONTESTANTS c ON v.contestant_number = c.contestant_number WHERE c.contestant_name IN ('Tabatha Gehling', 'Kelly Clauss') GROUP BY acs.area_code HAVING COUNT(DISTINCT c.contestant_name) = 2; 
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name LIKE '%Al%'
SELECT Name FROM country WHERE IndepYear > 1950; 
SELECT Name FROM country WHERE IndepYear > 1950; 
SELECT COUNT(Code) FROM country WHERE GovernmentForm = 'Republic'; 
SELECT COUNT(Code) FROM country WHERE GovernmentForm = 'Republic'; 
SELECT SUM(SurfaceArea) AS TotalSurfaceArea FROM country WHERE Region = 'Caribbean'; 
SELECT SUM(SurfaceArea) FROM country WHERE Region = 'Caribbean'; 
SELECT T1.Continent FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'English'; 
SELECT T2.Continent FROM city AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T1.Name = 'Anguilla'; 
SELECT T2.Region FROM city AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T1.Name = 'Kabul'; 
SELECT T2.Region FROM city AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T1.Name = 'Kabul'; 
SELECT Language, SUM(Percentage) AS TotalPercentage FROM countrylanguage WHERE CountryCode = 'ABW' GROUP BY Language ORDER BY TotalPercentage DESC LIMIT 1; 
SELECT T2.Language FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.Name = 'Aruba' ORDER BY T2.Percentage DESC LIMIT 1
SELECT T1.Population, T1.LifeExpectancy FROM country AS T1 WHERE T1.Name = 'Brazil'
SELECT SUM(T1.Population), AVG(T1.LifeExpectancy) FROM country AS T1 WHERE T1.Name = 'Brazil' 
SELECT T1.Region, T1.Population FROM country AS T1 WHERE T1.Name = 'Angola'; 
SELECT T1.Region, T1.Population FROM country AS T1 WHERE T1.Name = 'Angola'; 
SELECT AVG(LifeExpectancy) FROM country WHERE Region = 'Central Africa'; 
SELECT AVG(LifeExpectancy) AS AverageLifeExpectancy FROM country WHERE Region = 'Central Africa'; 
SELECT Name FROM country WHERE Continent = 'Asia' ORDER BY LifeExpectancy ASC LIMIT 1; 
SELECT Name FROM country WHERE Continent = 'Asia' ORDER BY LifeExpectancy ASC LIMIT 1; 
SELECT SUM(TotalPop), MAX(TotalGNP) FROM (     SELECT SUM(Country.Population) AS TotalPop, SUM(Country.GNP) AS TotalGNP     FROM country AS Country     WHERE Country.Continent = 'Asia' ); 
SELECT COUNT(T2.Population), MAX(T1.GNP) FROM country AS T1 INNER JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T1.Continent = 'Asia'; 
SELECT AVG(LifeExpectancy) AS AvgLifeExpectancy FROM country WHERE Continent = 'Africa' AND GovernmentForm = 'Republic'; 
SELECT AVG(LifeExpectancy) FROM country WHERE Continent = 'Africa' AND GovernmentForm = 'Republic'; 
SELECT SUM(SurfaceArea) FROM country WHERE Continent IN ('Asia', 'Europe'); 
SELECT SUM(SurfaceArea) FROM country WHERE Continent IN ('Asia', 'Europe'); 
SELECT COUNT(Population) FROM city WHERE District = 'Gelderland'; 
SELECT SUM(Population) AS TotalPopulation FROM city WHERE District = 'Gelderland'; 
SELECT AVG(T1.GNP), SUM(T1.Population) FROM country AS T1 WHERE T1.GovernmentForm = 'US territory'; 
SELECT AVG(T2.GNP), SUM(T2.Population) FROM city AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T2.Name = 'United States'; 
SELECT COUNT(DISTINCT Language) AS NumberOfUniqueLanguages FROM countrylanguage; 
SELECT COUNT(DISTINCT Language) AS NumberOfDistinctLanguages FROM countrylanguage; 
SELECT COUNT(DISTINCT GovernmentForm) AS NumberOfGovernments FROM country WHERE Continent = 'Africa'; 
SELECT COUNT(DISTINCT GovernmentForm) AS NumberOfDifferentGovernments FROM country WHERE Continent = 'Africa'; 
SELECT COUNT(Language) FROM countrylanguage WHERE CountryCode = 'ABW'; 
SELECT COUNT(Language) AS NumberOfLanguages FROM countrylanguage WHERE CountryCode = 'ABW'; 
SELECT COUNT(Language) AS NumberOfOfficialLanguages FROM countrylanguage WHERE CountryCode = 'AFG' AND IsOfficial = 'T'; 
SELECT COUNT(Language) AS NumberOfOfficialLanguages FROM countrylanguage WHERE CountryCode = 'AFG' AND IsOfficial = 'T'; 
SELECT c.Name FROM country AS c JOIN (     SELECT cl.CountryCode, COUNT(cl.Language) AS language_count     FROM countrylanguage AS cl     GROUP BY cl.CountryCode ) AS sub ON c.Code = sub.CountryCode ORDER BY sub.language_count DESC LIMIT 1; 
SELECT c.Name FROM country AS c JOIN (     SELECT cl.CountryCode, COUNT(DISTINCT cl.Language) AS language_count     FROM countrylanguage AS cl     GROUP BY cl.CountryCode ) AS subquery ON c.Code = subquery.CountryCode ORDER BY subquery.language_count DESC LIMIT 1; 
SELECT c.Continent, COUNT(DISTINCT cl.Language) AS LanguageCount FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode GROUP BY c.Continent ORDER BY LanguageCount DESC LIMIT 1; 
SELECT c.Continent, COUNT(DISTINCT cl.Language) AS LanguageCount FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode GROUP BY c.Continent ORDER BY LanguageCount DESC LIMIT 1; 
SELECT COUNT(CountryCode) AS NumberOfCountries FROM ( 	SELECT CountryCode 	FROM countrylanguage 	WHERE Language = 'English'  INTERSECT 	SELECT CountryCode 	FROM countrylanguage 	WHERE Language = 'Dutch' ); 
SELECT COUNT(CountryCode) FROM countrylanguage WHERE Language IN ('English', 'Dutch') GROUP BY CountryCode HAVING COUNT(DISTINCT Language) = 2; 
SELECT Name FROM country WHERE Code IN (     SELECT CountryCode FROM countrylanguage WHERE Language = 'English' AND IsOfficial = 'T' ) AND Code IN (     SELECT CountryCode FROM countrylanguage WHERE Language = 'French' AND IsOfficial = 'T' ); 
SELECT c.Name FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE cl.Language = 'English' INTERSECT SELECT c.Name FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE cl.Language = 'French'; 
SELECT c.Name FROM country AS c JOIN countrylanguage AS cl ON c.Code = cl.CountryCode WHERE cl.Language = 'English' AND cl.IsOfficial = 'T' INTERSECT SELECT c.Name FROM country AS c JOIN countrylanguage AS cl ON c.Code = cl.CountryCode WHERE cl.Language = 'French' AND cl.IsOfficial = 'T'; 
SELECT c.Name FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE cl.Language = 'English' AND cl.IsOfficial = 'T' INTERSECT SELECT c.Name FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE cl.Language = 'French' AND cl.IsOfficial = 'T'; 
SELECT COUNT(DISTINCT T2.Continent) FROM countrylanguage AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T1.Language = 'Chinese'
SELECT COUNT(DISTINCT T2.Continent) AS NumberOfContinents FROM countrylanguage AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T1.Language = 'Chinese'; 
SELECT DISTINCT T2.Region FROM countrylanguage AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T1.Language IN ('English', 'Dutch'); 
SELECT DISTINCT T2.Region FROM countrylanguage AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T1.Language = 'Dutch' OR T1.Language = 'English'; 
SELECT DISTINCT c.Name FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE cl.Language IN ('English', 'Dutch') AND cl.IsOfficial = 'T'; 
SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language IN ('English', 'Dutch') AND T2.IsOfficial = 'T'
SELECT T2.Language  FROM country AS T1  JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode  WHERE T1.Continent = 'Asia'  ORDER BY T2.Percentage DESC  LIMIT 1; 
SELECT Language FROM countrylanguage JOIN country ON country.Code = countrylanguage.CountryCode WHERE Continent = 'Asia' GROUP BY Language ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT Language FROM countrylanguage JOIN country ON country.Code = countrylanguage.CountryCode WHERE GovernmentForm = 'Republic' GROUP BY Language HAVING COUNT(CountryCode) = 1; 
SELECT cl.Language FROM countrylanguage cl JOIN country c ON cl.CountryCode = c.Code WHERE c.GovernmentForm = 'Republic' GROUP BY cl.Language HAVING COUNT(cl.CountryCode) = 1; 
SELECT c.Name, SUM(c.Population) AS TotalPopulation FROM city c JOIN countrylanguage cl ON c.CountryCode = cl.CountryCode WHERE cl.Language = 'English' GROUP BY c.Name ORDER BY TotalPopulation DESC LIMIT 1; 
SELECT T1.Name FROM city AS T1 JOIN countrylanguage AS T2 ON T1.CountryCode = T2.CountryCode WHERE T2.Language = 'English' ORDER BY T1.Population DESC LIMIT 1
SELECT Name, Population, LifeExpectancy FROM country WHERE Continent = 'Asia' ORDER BY SurfaceArea DESC LIMIT 1; 
SELECT Name, Population, LifeExpectancy FROM country WHERE Continent = 'Asia' ORDER BY SurfaceArea DESC LIMIT 1; 
SELECT AVG(T2.LifeExpectancy) AS AverageLifeExpectancy FROM countrylanguage AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T1.Language = 'English' AND T1.IsOfficial = 'F'; 
SELECT AVG(T2.LifeExpectancy)  FROM countrylanguage AS T1  JOIN country AS T2 ON T1.CountryCode = T2.Code  WHERE T1.Language = 'English' AND T1.IsOfficial = 'F'; 
SELECT SUM(T1.Population) AS TotalPeople FROM city AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE NOT EXISTS ( 	SELECT 1 	FROM countrylanguage AS T3 	WHERE T3.CountryCode = T2.Code AND T3.Language = 'English' ) 
SELECT SUM(T1.Population) FROM city AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T2.Code NOT IN (     SELECT CountryCode     FROM countrylanguage     WHERE Language = 'English' ); 
SELECT T2.Language FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.HeadOfState = 'Beatrix' AND T2.IsOfficial = 'T';
SELECT T1.Language FROM countrylanguage AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T2.HeadOfState = 'Beatrix' AND T1.IsOfficial = 'T'; 
SELECT COUNT(DISTINCT T2.Language) AS TotalUniqueOfficialLanguages FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.IndepYear < 1930 AND T2.IsOfficial = 'T'; 
SELECT COUNT(DISTINCT T2.Language) FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.IndepYear < 1930 AND T2.IsOfficial = 'T'
SELECT Name FROM country WHERE SurfaceArea > (SELECT MAX(SurfaceArea) FROM country WHERE Continent = 'Europe') 
SELECT Name FROM country WHERE SurfaceArea > (SELECT MAX(SurfaceArea) FROM country WHERE Continent = 'Europe') 
SELECT c.Name  FROM country c  WHERE c.Continent = 'Africa' AND c.Population < (     SELECT MIN(c2.Population)      FROM country c2      WHERE c2.Continent = 'Asia' ); 
SELECT c.Name FROM country c WHERE c.Region = 'Africa' AND c.Population < (     SELECT MAX(c2.Population)     FROM country c2     WHERE c2.Region = 'Asia' ); 
SELECT c.Name FROM country c WHERE c.Continent = 'Asia' AND c.Population > (     SELECT MAX(p.Population)     FROM city p     JOIN country co ON p.CountryCode = co.Code     WHERE co.Region = 'Africa' ); 
SELECT Name FROM country WHERE Continent = 'Asia' AND Population > (SELECT MAX(Population) FROM country WHERE Continent = 'Africa') 
SELECT Code FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English') 
SELECT CountryCode FROM countrylanguage WHERE Language != 'English'; 
SELECT CountryCode FROM countrylanguage WHERE Language != 'English' GROUP BY CountryCode
SELECT CountryCode FROM countrylanguage WHERE Language != 'English'; 
SELECT Code FROM country WHERE Code NOT IN ( SELECT CountryCode FROM countrylanguage WHERE Language = 'English' ) AND GovernmentForm != 'Republic'
SELECT Code FROM country WHERE Code NOT IN (     SELECT CountryCode FROM countrylanguage WHERE Language = 'English' ) AND GovernmentForm != 'Republic'; 
SELECT c.Name FROM city AS c JOIN country AS co ON c.CountryCode = co.Code JOIN countrylanguage AS cl ON co.Code = cl.CountryCode WHERE co.Continent = 'Europe' AND cl.Language = 'English' AND cl.IsOfficial = 'F' GROUP BY c.Name
SELECT c.Name FROM city c JOIN country co ON c.CountryCode = co.Code WHERE co.Continent = 'Europe' AND NOT EXISTS (     SELECT 1     FROM countrylanguage cl     WHERE cl.CountryCode = co.Code     AND cl.Language = 'English'     AND cl.IsOfficial = 'T' ); 
SELECT DISTINCT c.Name FROM city c JOIN country co ON c.CountryCode = co.Code JOIN countrylanguage cl ON co.Code = cl.CountryCode WHERE co.Continent = 'Asia' AND cl.Language = 'Chinese' AND cl.IsOfficial = 'T'; 
SELECT DISTINCT c.Name FROM city c JOIN country co ON c.CountryCode = co.Code JOIN countrylanguage cl ON co.Code = cl.CountryCode WHERE co.Continent = 'Asia' AND cl.Language = 'Chinese' AND cl.IsOfficial = 'T'; 
SELECT Name, IndepYear, SurfaceArea FROM country ORDER BY Population ASC LIMIT 1; 
SELECT c.Name, c.IndepYear, c.SurfaceArea FROM country c ORDER BY c.Population ASC LIMIT 1; 
SELECT T1.Population, T1.Name, T1.HeadOfState FROM country AS T1 ORDER BY T1.SurfaceArea DESC LIMIT 1; 
SELECT Name, Population, HeadOfState FROM country ORDER BY SurfaceArea DESC LIMIT 1; 
SELECT c.Name, COUNT(cl.Language) AS NumberOfLanguages FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode GROUP BY c.Name HAVING COUNT(cl.Language) >= 3; 
SELECT T1.Name, COUNT(T2.Language) AS LanguageCount FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode GROUP BY T1.Name HAVING COUNT(T2.Language) > 2
SELECT District, COUNT(ID) AS NumberOfCities FROM city WHERE Population > (SELECT AVG(Population) FROM city) GROUP BY District; 
SELECT District, COUNT(*) AS CityCount FROM city WHERE Population > (SELECT AVG(Population) FROM city) GROUP BY District; 
SELECT GovernmentForm, SUM(Population) AS TotalPopulation FROM country GROUP BY GovernmentForm HAVING AVG(LifeExpectancy) > 72; 
SELECT GovernmentForm, SUM(Population) AS TotalPopulation FROM country GROUP BY GovernmentForm HAVING AVG(LifeExpectancy) > 72; 
SELECT c.Continent, AVG(c.LifeExpectancy) AS AvgLifeExpectancy, SUM(c.Population) AS TotalPopulation FROM country c GROUP BY c.Continent HAVING AVG(c.LifeExpectancy) < 72; 
SELECT Continent, SUM(Population), AVG(LifeExpectancy) FROM country GROUP BY Continent HAVING AVG(LifeExpectancy) < 72; 
SELECT Name, SurfaceArea FROM country ORDER BY SurfaceArea DESC LIMIT 5; 
SELECT Name, SurfaceArea FROM country ORDER BY SurfaceArea DESC LIMIT 5; 
SELECT T1.Name FROM country AS T1 JOIN city AS T2 ON T1.Code = T2.CountryCode GROUP BY T1.Name ORDER BY SUM(T2.Population) DESC LIMIT 3; 
SELECT T1.Name FROM country AS T1 JOIN city AS T2 ON T1.Code = T2.CountryCode GROUP BY T1.Name ORDER BY SUM(T2.Population) DESC LIMIT 3; 
SELECT Name FROM country ORDER BY Population ASC LIMIT 3; 
SELECT Name FROM country ORDER BY Population ASC LIMIT 3
SELECT COUNT(Code) AS NumberOfCountriesInAsia FROM country WHERE Continent = 'Asia'; 
SELECT COUNT(Code) FROM country WHERE Continent = 'Asia'; 
SELECT Name FROM country WHERE Continent = 'Europe' AND Population = 80000; 
SELECT c.Name FROM country c WHERE c.Region = 'Europe' AND c.Population = 80000; 
SELECT SUM(Total.Population), AVG(Total.Area)  FROM ( 	SELECT c.Name AS Country, c.Continent, c.SurfaceArea AS Area, ci.Population  	FROM country c  	JOIN city ci ON c.Code = ci.CountryCode  	WHERE c.Continent = 'North America' AND c.SurfaceArea > 3000 ) Total; 
SELECT SUM(Total.Population), AVG(Total.SurfaceArea)  FROM ( 	SELECT country.Name, country.Population, country.SurfaceArea  	FROM country  	WHERE country.Region = 'North America' AND country.SurfaceArea > 3000 ) AS Total; 
SELECT Name FROM city WHERE Population BETWEEN 160000 AND 900000
SELECT Name FROM city WHERE Population BETWEEN 160000 AND 900000; 
SELECT Language FROM countrylanguage GROUP BY Language ORDER BY COUNT(CountryCode) DESC LIMIT 1; 
SELECT Language FROM countrylanguage GROUP BY Language ORDER BY COUNT(DISTINCT CountryCode) DESC LIMIT 1; 
SELECT c.Name AS Country, cl.Language, cl.Percentage FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE cl.IsOfficial = 'T' ORDER BY c.Name, cl.Percentage DESC; 
SELECT cl.CountryCode, cl.Language FROM countrylanguage cl JOIN (     SELECT CountryCode, MAX(Percentage) AS MaxPercentage     FROM countrylanguage     GROUP BY CountryCode ) max_cl ON cl.CountryCode = max_cl.CountryCode AND cl.Percentage = max_cl.MaxPercentage; 
SELECT COUNT(DISTINCT Country) FROM countrylanguage WHERE Language = 'Spanish' ORDER BY Percentage DESC; 
SELECT COUNT(*) FROM countrylanguage WHERE Language = 'Spanish' AND Percentage > 50; 
SELECT CountryCode FROM countrylanguage WHERE Language = 'Spanish' ORDER BY Percentage DESC LIMIT 1; 
SELECT CountryCode FROM countrylanguage WHERE Language = 'Spanish' AND Percentage = ( SELECT MAX(Percentage) FROM countrylanguage WHERE Language = 'Spanish' )
SELECT COUNT(*) AS Number_of_Conductors FROM conductor; 
SELECT COUNT(*) AS Number_of_Conductors FROM conductor; 
SELECT Name FROM conductor ORDER BY Age ASC; 
SELECT Name FROM conductor ORDER BY Age; 
SELECT Name FROM conductor WHERE Nationality != 'USA'; 
SELECT Name FROM conductor WHERE Nationality != 'USA'; 
SELECT Record_Company FROM orchestra ORDER BY Year_of_Founded DESC
SELECT Record_Company FROM orchestra ORDER BY Year_of_Founded DESC; 
SELECT AVG(Attendance) AS Average_Attendance FROM show; 
SELECT AVG(Attendance) AS Average_Attendance FROM show; 
SELECT MAX(Share), MIN(Share) FROM performance WHERE Type != 'Live final'; 
SELECT MAX(Share), MIN(Share) FROM performance WHERE Type != 'Live final'
SELECT COUNT(DISTINCT Nationality) FROM conductor; 
SELECT COUNT(DISTINCT Nationality) FROM conductor; 
SELECT Name FROM conductor ORDER BY Year_of_Work DESC; 
SELECT Name FROM conductor ORDER BY Year_of_Work DESC
SELECT c.Name FROM conductor c ORDER BY c.Year_of_Work DESC LIMIT 1; 
SELECT c.Name FROM conductor c JOIN orchestra o ON c.Conductor_ID = o.Conductor_ID GROUP BY c.Name ORDER BY COUNT(o.Year_of_Founded) DESC LIMIT 1; 
SELECT T2.Name ,  T1.Orchestra FROM orchestra AS T1 INNER JOIN conductor AS T2 ON T1.Conductor_ID = T2.Conductor_ID
SELECT c.Name AS Conductor_Name, o.Orchestra AS Corresponding_Orchestra FROM conductor c JOIN orchestra o ON c.Conductor_ID = o.Conductor_ID; 
SELECT c.Name FROM conductor c JOIN orchestra o ON c.Conductor_ID = o.Conductor_ID GROUP BY c.Name HAVING COUNT(o.Orchestra) > 1
SELECT T1.Name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID GROUP BY T1.Conductor_ID HAVING COUNT(T2.Orchestra) > 1
SELECT c.Name FROM conductor AS c JOIN orchestra AS o ON c.Conductor_ID = o.Conductor_ID GROUP BY c.Name ORDER BY COUNT(o.Orchestra_ID) DESC LIMIT 1; 
SELECT c.Name FROM conductor c JOIN orchestra o ON c.Conductor_ID = o.Conductor_ID GROUP BY c.Name ORDER BY COUNT(o.Orchestra_ID) DESC LIMIT 1; 
SELECT T1.Name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID WHERE T2.Year_of_Founded > 2008
SELECT c.Name FROM conductor AS c JOIN orchestra AS o ON c.Conductor_ID = o.Conductor_ID WHERE o.Year_of_Founded > 2008; 
SELECT Record_Company, COUNT(*) AS Number_of_Orchestras FROM orchestra GROUP BY Record_Company; 
SELECT Record_Company, COUNT(*) AS Number_of_Orchestras FROM orchestra GROUP BY Record_Company; 
SELECT Major_Record_Format FROM orchestra GROUP BY Major_Record_Format ORDER BY COUNT(*) ASC; 
SELECT Major_Record_Format FROM orchestra GROUP BY Major_Record_Format ORDER BY COUNT(*) DESC
SELECT Record_Company  FROM orchestra  GROUP BY Record_Company  ORDER BY COUNT(*) DESC  LIMIT 1; 
SELECT Record_Company FROM orchestra GROUP BY Record_Company ORDER BY COUNT(*) DESC LIMIT 1
SELECT Orchestra FROM orchestra WHERE Orchestra_ID NOT IN (SELECT Orchestra_ID FROM performance) 
SELECT orchestra  FROM orchestra  LEFT JOIN performance ON orchestra.Orchestra_ID = performance.Orchestra_ID  WHERE performance.Performance_ID IS NULL; 
SELECT Record_Company FROM orchestra WHERE Year_of_Founded < 2003 INTERSECT SELECT Record_Company FROM orchestra WHERE Year_of_Founded > 2003; 
SELECT Record_Company FROM orchestra WHERE Year_of_Founded < 2003 INTERSECT SELECT Record_Company FROM orchestra WHERE Year_of_Founded > 2003
SELECT COUNT(*) FROM orchestra WHERE Major_Record_Format IN ('CD', 'DVD') 
SELECT COUNT(*) FROM orchestra WHERE Major_Record_Format LIKE '%CD%' OR Major_Record_Format LIKE '%DVD%'
SELECT T2.Year_of_Founded FROM performance AS T1 INNER JOIN orchestra AS T2 ON T1.Orchestra_ID = T2.Orchestra_ID GROUP BY T2.Year_of_Founded HAVING COUNT(T1.Performance_ID) > 1
SELECT T2.Year_of_Founded FROM performance AS T1 JOIN orchestra AS T2 ON T1.Orchestra_ID = T2.Orchestra_ID GROUP BY T2.Orchestra_ID HAVING COUNT(T1.Performance_ID) > 1; 
SELECT COUNT(*) AS number_of_high_schoolers FROM Highschooler; 
SELECT COUNT(*) FROM Highschooler; 
SELECT name, grade FROM Highschooler; 
SELECT name, grade FROM Highschooler
SELECT DISTINCT grade FROM Highschooler
SELECT name, grade FROM Highschooler; 
SELECT grade FROM Highschooler WHERE name = 'Kyle'; 
SELECT grade FROM Highschooler WHERE name = 'Kyle'; 
SELECT name FROM Highschooler WHERE grade = 10;
SELECT name FROM Highschooler WHERE grade = 10; 
SELECT ID FROM Highschooler WHERE name = 'Kyle'; 
SELECT ID FROM Highschooler WHERE name = 'Kyle'; 
SELECT COUNT(*) FROM Highschooler WHERE grade = 9 OR grade = 10; 
SELECT COUNT(*) FROM Highschooler WHERE grade IN (9, 10); 
SELECT grade, COUNT(*) AS num_highschoolers FROM Highschooler GROUP BY grade; 
SELECT grade, COUNT(*) AS number_of_highschoolers FROM Highschooler GROUP BY grade; 
SELECT grade FROM Highschooler GROUP BY grade ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT grade FROM Highschooler GROUP BY grade ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT grade FROM Highschooler GROUP BY grade HAVING COUNT(*) >= 4; 
SELECT grade FROM Highschooler GROUP BY grade HAVING COUNT(*) >= 4; 
SELECT student_id, COUNT(friend_id) AS num_friends FROM Friend GROUP BY student_id; 
SELECT H1.name, COUNT(*) AS num_friends FROM Highschooler H1 JOIN Friend F ON H1.ID = F.student_id GROUP BY H1.name; 
SELECT T1.name ,  COUNT(*) FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id GROUP BY T1.name
SELECT H.name, COUNT(F.friend_id) AS num_friends FROM Highschooler H JOIN Friend F ON H.ID = F.student_id GROUP BY H.name; 
SELECT H.name FROM Highschooler AS H JOIN Friend AS F ON H.ID = F.student_id GROUP BY H.name ORDER BY COUNT(F.friend_id) DESC LIMIT 1; 
SELECT T1.name FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id GROUP BY T1.ID ORDER BY COUNT(T2.friend_id) DESC LIMIT 1
SELECT h.name FROM Highschooler h JOIN Friend f ON h.ID = f.student_id GROUP BY h.name HAVING COUNT(f.friend_id) >= 3; 
SELECT H.name FROM Highschooler H JOIN Friend F ON H.ID = F.student_id GROUP BY H.name HAVING COUNT(F.friend_id) >= 3; 
SELECT T2.name FROM Highschooler AS T1 JOIN Highschooler AS T2 ON T1.ID = T2.friend_id WHERE T1.name = 'Kyle'; 
SELECT H.name FROM Highschooler H JOIN Friend F ON H.ID = F.student_id WHERE F.friend_id = ( 	SELECT ID 	FROM Highschooler 	WHERE name = 'Kyle' ); 
SELECT COUNT(*) AS friend_count FROM Friend WHERE student_id IN (SELECT ID FROM Highschooler WHERE name = 'Kyle'); 
SELECT COUNT(*) FROM Highschooler AS H JOIN Friend AS F ON H.ID = F.student_id WHERE H.name = 'Kyle'; 
SELECT ID FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend) 
SELECT ID FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend); 
SELECT name FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend) 
SELECT name FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend) 
SELECT h.ID FROM Highschooler h JOIN Friend f ON h.ID = f.student_id JOIN Likes l ON h.ID = l.student_id WHERE h.grade = 9; 
SELECT student_id FROM Friend INTERSECT SELECT liked_id FROM Likes; 
SELECT H1.name FROM Highschooler H1 WHERE EXISTS ( 	SELECT 1 	FROM Friend F 	WHERE F.student_id = H1.ID ) AND EXISTS ( 	SELECT 1 	FROM Likes L 	WHERE L.liked_id = H1.ID ); 
SELECT h.name FROM Highschooler h JOIN Friend f ON h.ID = f.student_id JOIN Likes l ON h.ID = l.student_id GROUP BY h.name HAVING COUNT(DISTINCT f.friend_id) > 0 AND COUNT(DISTINCT l.liked_id) > 0; 
SELECT student_id, COUNT(liked_id) AS like_count FROM Likes GROUP BY student_id; 
SELECT student_id, COUNT(liked_id) AS likes_count FROM Likes GROUP BY student_id; 
SELECT H.name, COUNT(L.student_id) AS number_of_likes FROM Highschooler H JOIN Likes L ON H.ID = L.student_id GROUP BY H.name; 
SELECT H.name, COUNT(L.student_id) AS like_count FROM Highschooler H JOIN Likes L ON H.ID = L.student_id GROUP BY H.ID, H.name; 
SELECT h.name FROM Highschooler h JOIN Likes l ON h.ID = l.student_id GROUP BY h.name ORDER BY COUNT(l.liked_id) DESC LIMIT 1; 
SELECT H.name FROM Highschooler H JOIN Likes L ON H.ID = L.student_id GROUP BY H.name ORDER BY COUNT(L.liked_id) DESC LIMIT 1; 
SELECT h.name FROM Highschooler h JOIN Likes l ON h.ID = l.student_id GROUP BY h.name HAVING COUNT(l.liked_id) >= 2; 
SELECT h.name FROM Highschooler h JOIN Likes l ON h.ID = l.student_id GROUP BY h.ID HAVING COUNT(l.liked_id) >= 2; 
SELECT name FROM Highschooler WHERE ID IN (     SELECT student_id FROM Friend GROUP BY student_id HAVING COUNT(friend_id) >= 2 ) AND grade > 5; 
SELECT h.name FROM Highschooler h JOIN (     SELECT student_id     FROM Friend     GROUP BY student_id     HAVING COUNT(friend_id) >= 2 ) f ON h.ID = f.student_id WHERE h.grade > 5; 
SELECT COUNT(*) FROM Likes WHERE liked_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle'); 
SELECT COUNT(*) FROM Likes AS L JOIN Highschooler AS H ON L.student_id = H.ID WHERE H.name = 'Kyle'; 
SELECT AVG(H.grade) AS average_grade FROM Highschooler H JOIN Friend F ON H.ID = F.student_id; 
SELECT AVG(H.grade) AS average_grade FROM Highschooler H JOIN Friend F ON H.ID = F.student_id; 
SELECT MIN(T1.grade) FROM Highschooler AS T1 WHERE T1.ID NOT IN (SELECT student_id FROM Friend) 
SELECT MIN(grade) FROM Highschooler WHERE ID NOT IN ( 	SELECT student_id 	FROM Friend ); 
SELECT state FROM Owners INTERSECT SELECT state FROM Professionals; 
SELECT state FROM Owners INTERSECT SELECT state FROM Professionals; 
SELECT AVG(age) AS average_age FROM Dogs WHERE dog_id IN (SELECT dog_id FROM Treatments); 
SELECT AVG(d.age) AS average_age FROM Dogs d JOIN Treatments t ON d.dog_id = t.dog_id; 
SELECT DISTINCT p.professional_id, p.last_name, p.cell_number FROM Professionals p JOIN Treatments t ON p.professional_id = t.professional_id WHERE p.state = 'Indiana' OR (p.state != 'Indiana' AND t.treatment_id IN (     SELECT treatment_id     FROM Treatments     GROUP BY professional_id     HAVING COUNT(treatment_id) > 2 )); 
SELECT DISTINCT p.professional_id, p.last_name, p.cell_number FROM Professionals p JOIN Treatments t ON p.professional_id = t.professional_id WHERE p.state = 'Indiana' OR (     SELECT COUNT(*) FROM Treatments WHERE professional_id = p.professional_id ) > 2; 
SELECT d.name  FROM Dogs d  JOIN Treatments t ON d.dog_id = t.dog_id  GROUP BY d.name  HAVING SUM(t.cost_of_treatment) <= 1000; 
SELECT d.name FROM Dogs d JOIN Treatments t ON d.dog_id = t.dog_id GROUP BY d.dog_id HAVING SUM(t.cost_of_treatment) <= 1000; 
SELECT DISTINCT CASE                      WHEN T1.first_name IS NOT NULL THEN T1.first_name                     ELSE T2.first_name                 END AS first_name FROM Professionals T1 FULL OUTER JOIN Owners T2 ON T1.first_name = T2.first_name WHERE T1.first_name IS NULL OR T2.first_name IS NULL; 
SELECT DISTINCT first_name FROM Owners UNION SELECT DISTINCT first_name FROM Professionals EXCEPT SELECT DISTINCT name FROM Dogs; 
SELECT p.professional_id, p.role_code, p.email_address FROM Professionals p LEFT JOIN Treatments t ON p.professional_id = t.professional_id WHERE t.treatment_id IS NULL; 
SELECT p.professional_id, p.role_code, p.email_address FROM Professionals p LEFT JOIN Treatments t ON p.professional_id = t.professional_id WHERE t.treatment_id IS NULL; 
SELECT D.owner_id, O.first_name, O.last_name, COUNT(D.dog_id) AS dog_count FROM Dogs D JOIN Owners O ON D.owner_id = O.owner_id GROUP BY D.owner_id, O.first_name, O.last_name ORDER BY dog_count DESC LIMIT 1; 
SELECT o.owner_id, o.first_name, o.last_name FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id GROUP BY o.owner_id, o.first_name, o.last_name ORDER BY COUNT(d.dog_id) DESC LIMIT 1; 
SELECT p.professional_id, p.role_code, p.first_name FROM Professionals p JOIN Treatments t ON p.professional_id = t.professional_id GROUP BY p.professional_id, p.role_code, p.first_name HAVING COUNT(t.treatment_id) >= 2; 
SELECT p.professional_id, p.role_code, p.first_name FROM Professionals p JOIN Treatments t ON p.professional_id = t.professional_id GROUP BY p.professional_id, p.role_code, p.first_name HAVING COUNT(t.treatment_id) >= 2; 
SELECT b.breed_name  FROM Breeds b  JOIN Dogs d ON b.breed_code = d.breed_code  GROUP BY b.breed_name  ORDER BY COUNT(d.dog_id) DESC  LIMIT 1; 
SELECT breed_name FROM Breeds WHERE breed_code = ( SELECT breed_code FROM Dogs GROUP BY breed_code ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT o.owner_id, o.last_name, COUNT(t.treatment_id) AS treatment_count FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id JOIN Treatments t ON d.dog_id = t.dog_id GROUP BY o.owner_id, o.last_name ORDER BY treatment_count DESC; 
SELECT o.owner_id, o.last_name, SUM(t.cost_of_treatment) AS total_spent FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id JOIN Treatments t ON d.dog_id = t.dog_id GROUP BY o.owner_id, o.last_name ORDER BY total_spent DESC LIMIT 1; 
SELECT tt.treatment_type_description FROM Treatment_Types tt JOIN Treatments t ON tt.treatment_type_code = t.treatment_type_code GROUP BY tt.treatment_type_description ORDER BY SUM(t.cost_of_treatment) ASC LIMIT 1; 
SELECT tt.treatment_type_description FROM Treatment_Types tt JOIN Treatments t ON tt.treatment_type_code = t.treatment_type_code GROUP BY tt.treatment_type_description ORDER BY SUM(t.cost_of_treatment) ASC LIMIT 1; 
SELECT o.owner_id, o.zip_code, SUM(t.cost_of_treatment) AS total_paid FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id JOIN Treatments t ON d.dog_id = t.dog_id GROUP BY o.owner_id, o.zip_code ORDER BY total_paid DESC LIMIT 1; 
SELECT o.owner_id, o.zip_code, SUM(t.cost_of_treatment) AS total_spent FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id JOIN Treatments t ON d.dog_id = t.dog_id GROUP BY o.owner_id, o.zip_code ORDER BY total_spent DESC LIMIT 1; 
SELECT p.professional_id, p.cell_number FROM Professionals p JOIN Treatments t ON p.professional_id = t.professional_id GROUP BY p.professional_id HAVING COUNT(DISTINCT t.treatment_type_code) >= 2; 
SELECT professional_id, cell_number FROM Treatments GROUP BY professional_id HAVING COUNT(DISTINCT treatment_type_code) >= 2; 
SELECT p.first_name, p.last_name FROM Professionals p JOIN Treatments t ON p.professional_id = t.professional_id WHERE t.cost_of_treatment < (SELECT AVG(cost_of_treatment) FROM Treatments); 
SELECT p.first_name, p.last_name FROM Professionals p JOIN Treatments t ON p.professional_id = t.professional_id WHERE t.cost_of_treatment < (     SELECT AVG(cost_of_treatment)     FROM Treatments ); 
SELECT Treatments.date_of_treatment, Professionals.first_name FROM Treatments JOIN Professionals ON Treatments.professional_id = Professionals.professional_id; 
SELECT T1.date_of_treatment, P.first_name FROM Treatments AS T1 JOIN Professionals AS P ON T1.professional_id = P.professional_id; 
SELECT T1.cost_of_treatment, T2.treatment_type_description FROM Treatments AS T1 INNER JOIN Treatment_Types AS T2 ON T1.treatment_type_code = T2.treatment_type_code
SELECT T1.cost_of_treatment, T3.treatment_type_description FROM Treatments AS T1 INNER JOIN Treatment_Types AS T3 ON T1.treatment_type_code = T3.treatment_type_code; 
SELECT O.first_name, O.last_name, S.size_description FROM Owners AS O JOIN Dogs AS D ON O.owner_id = D.owner_id JOIN Sizes AS S ON D.size_code = S.size_code; 
SELECT O.first_name, O.last_name, S.size_description FROM Owners AS O JOIN Dogs AS D ON O.owner_id = D.owner_id JOIN Sizes AS S ON D.size_code = S.size_code; 
SELECT O.first_name, D.name FROM Owners AS O JOIN Dogs AS D ON O.owner_id = D.owner_id; 
SELECT o.first_name, d.name  FROM Owners o  JOIN Dogs d ON o.owner_id = d.owner_id; 
SELECT D.name, T.date_of_treatment FROM Dogs D JOIN Breeds BR ON D.breed_code = BR.breed_code JOIN Treatments T ON D.dog_id = T.dog_id GROUP BY D.name, T.date_of_treatment ORDER BY COUNT(*) ASC; 
SELECT d.name, t.date_of_treatment FROM Dogs d JOIN Treatments t ON d.dog_id = t.dog_id GROUP BY d.breed_code, d.name, t.date_of_treatment ORDER BY COUNT(*) ASC; 
SELECT o.first_name, d.name FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id WHERE o.state = 'Virginia'
SELECT o.first_name, d.name FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id WHERE o.state = 'Virginia'; 
SELECT d.date_arrived, d.date_departed FROM Dogs d JOIN Treatments t ON d.dog_id = t.dog_id; 
SELECT d.date_arrived, d.date_departed FROM Dogs d JOIN Treatments t ON d.dog_id = t.dog_id; 
SELECT o.last_name FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id ORDER BY d.age ASC LIMIT 1; 
SELECT o.last_name FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id ORDER BY d.age ASC LIMIT 1; 
SELECT email_address FROM Professionals WHERE state = 'Hawaii' OR state = 'Wisconsin'; 
SELECT email_address FROM Professionals WHERE state = 'Hawaii' OR state = 'Wisconsin'
SELECT date_arrived, date_departed FROM Dogs; 
SELECT date_arrived, date_departed FROM Dogs; 
SELECT COUNT(DISTINCT dog_id) AS number_of_dogs_with_treatments FROM Treatments; 
SELECT COUNT(*) FROM Treatments; 
SELECT COUNT(DISTINCT professional_id) AS numberOfProfessionals FROM Treatments; 
SELECT COUNT(DISTINCT professional_id) FROM Treatments
SELECT role_code, street, city, state FROM Professionals WHERE city LIKE '%West%'; 
SELECT role_code, street, city, state FROM Professionals WHERE city LIKE '%West%'
SELECT first_name, last_name, email_address FROM Owners WHERE state LIKE '%North%'; 
SELECT first_name, last_name, email_address FROM Owners WHERE state LIKE '%North%'; 
SELECT COUNT(*) FROM Dogs WHERE age < (SELECT AVG(age) FROM Dogs); 
SELECT COUNT(*) FROM Dogs WHERE age < (SELECT AVG(age) FROM Dogs) 
SELECT MAX(cost_of_treatment) FROM Treatments
SELECT MAX(cost_of_treatment) AS most_recent_cost FROM Treatments ORDER BY date_of_treatment DESC LIMIT 1; 
SELECT COUNT(*) FROM Dogs WHERE dog_id NOT IN (SELECT dog_id FROM Treatments); 
SELECT COUNT(dog_id) AS num_dogs_without_treatment FROM Dogs WHERE dog_id NOT IN (SELECT dog_id FROM Treatments); 
SELECT COUNT(owner_id) AS temp_owner_count FROM Dogs WHERE abandoned_yn = '0' AND date_departed IS NOT NULL; 
SELECT COUNT(owner_id) FROM Owners WHERE dog_id IS NULL; 
SELECT COUNT(professional_id) AS number_of_professionals_without_treatments FROM Professionals WHERE professional_id NOT IN (     SELECT professional_id FROM Treatments ); 
SELECT COUNT(professional_id) AS num_professionals_without_dogs FROM Professionals WHERE professional_id NOT IN (     SELECT professional_id     FROM Treatments ); 
SELECT name, age, weight FROM Dogs WHERE abandoned_yn = '1'; 
SELECT name, age, weight FROM Dogs WHERE abandoned_yn = '1'
SELECT AVG(age) AS average_age FROM Dogs; 
SELECT AVG(age) AS average_age FROM Dogs; 
SELECT MAX(age) AS oldest_dog_age FROM Dogs; 
SELECT MAX(age) AS oldest_dog_age FROM Dogs; 
SELECT charge_type, SUM(charge_amount) AS total_cost FROM Charges GROUP BY charge_type; 
SELECT charge_type, SUM(charge_amount) AS total_amount FROM Charges GROUP BY charge_type; 
SELECT MAX(charge_amount) AS max_charge_amount FROM Charges; 
SELECT MAX(charge_amount) AS max_charge_amount FROM Charges; 
SELECT email_address, cell_number, home_phone FROM Professionals; 
SELECT email_address, cell_number, home_phone FROM Professionals; 
SELECT DISTINCT breed_name, size_description FROM Breeds AS b JOIN Sizes AS s ON b.size_code = s.size_code;
SELECT DISTINCT breed_code, size_code FROM Dogs;
SELECT P.first_name, TT.treatment_type_description FROM Professionals AS P JOIN Treatments AS T ON P.professional_id = T.professional_id JOIN Treatment_Types AS TT ON T.treatment_type_code = TT.treatment_type_code; 
SELECT P.first_name, TT.treatment_type_description  FROM Professionals AS P  JOIN Treatments AS T ON P.professional_id = T.professional_id  JOIN Treatment_Types AS TT ON T.treatment_type_code = TT.treatment_type_code; 
SELECT COUNT(*) AS Number_of_Singers FROM singer; 
SELECT COUNT(*) FROM singer; 
SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC; 
SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC
SELECT Birth_Year, Citizenship FROM singer; 
SELECT Birth_Year, Citizenship FROM singer; 
SELECT Name FROM singer WHERE Citizenship != 'France'
SELECT Name FROM singer WHERE Citizenship != 'France'
SELECT Name FROM singer WHERE Birth_Year IN (1948, 1949); 
SELECT Name FROM singer WHERE Birth_Year IN (1948, 1949); 
SELECT Name FROM singer ORDER BY Net_Worth_Millions DESC LIMIT 1
SELECT Name FROM singer ORDER BY Net_Worth_Millions DESC LIMIT 1; 
SELECT Citizenship, COUNT(*) FROM singer GROUP BY Citizenship; 
SELECT Citizenship, COUNT(*) AS Number_of_Singers FROM singer GROUP BY Citizenship; 
SELECT Citizenship, COUNT(*) AS Count FROM singer GROUP BY Citizenship ORDER BY Count DESC LIMIT 1; 
SELECT Citizenship FROM singer GROUP BY Citizenship ORDER BY COUNT(*) DESC LIMIT 1
SELECT Citizenship, MAX(Net_Worth_Millions) AS Max_Net_Worth FROM singer GROUP BY Citizenship; 
SELECT Citizenship, MAX(Net_Worth_Millions) FROM singer GROUP BY Citizenship
SELECT song.Title, singer.Name FROM song JOIN singer ON song.Singer_ID = singer.Singer_ID
SELECT s.Title, si.Name FROM song AS s JOIN singer AS si ON s.Singer_ID = si.Singer_ID; 
SELECT DISTINCT s.Name FROM singer s JOIN song ss ON s.Singer_ID = ss.Singer_ID WHERE ss.Sales > 300000; 
SELECT DISTINCT s.Name FROM singer s JOIN song so ON s.Singer_ID = so.Singer_ID WHERE so.Sales > 300000; 
SELECT s.Name FROM singer s JOIN song so ON s.Singer_ID = so.Singer_ID GROUP BY s.Name HAVING COUNT(so.Song_ID) > 1; 
SELECT s.Name FROM singer s JOIN song sg ON s.Singer_ID = sg.Singer_ID GROUP BY s.Name HAVING COUNT(sg.Song_ID) > 1; 
SELECT s.Name, SUM(song.Sales) AS Total_Sales FROM singer s JOIN song ON s.Singer_ID = song.Singer_ID GROUP BY s.Name; 
SELECT s.Name, SUM(so.Sales) AS Total_Sales FROM singer s JOIN song so ON s.Singer_ID = so.Singer_ID GROUP BY s.Name; 
SELECT Name FROM singer WHERE Singer_ID NOT IN (SELECT Singer_ID FROM song); 
SELECT Name FROM singer WHERE Singer_ID NOT IN (SELECT Singer_ID FROM song) 
SELECT Citizenship FROM singer WHERE Birth_Year < 1945 INTERSECT SELECT Citizenship FROM singer WHERE Birth_Year > 1955
SELECT Citizenship FROM singer WHERE Birth_Year < 1945 INTERSECT SELECT Citizenship FROM singer WHERE Birth_Year > 1955; 
SELECT COUNT(*) AS total_available_features FROM Other_Available_Features; 
SELECT ft.feature_type_name FROM Ref_Feature_Types ft JOIN Other_Available_Features oaf ON ft.feature_type_code = oaf.feature_type_code WHERE oaf.feature_name = 'AirCon'; 
SELECT pt.property_type_description FROM Ref_Property_Types pt JOIN Properties p ON pt.property_type_code = p.property_type_code; 
SELECT property_name FROM Properties WHERE property_type_code IN ('House', 'Apartment') AND room_count > 1; 
