SELECT COUNT(*) AS NumberOfSingers FROM singer; 
SELECT COUNT(*) AS Total_Singers FROM singer; 
SELECT Name, Country, Age FROM singer ORDER BY Age DESC;
SELECT Name, Country, Age FROM singer ORDER BY Age DESC; 
SELECT AVG(Age), MIN(Age), MAX(Age) FROM singer WHERE Country = 'France' AND Profession = 'Singer'; 
SELECT AVG(Age), MIN(Age), MAX(Age) FROM singer WHERE Country = 'France'; 
SELECT Song_Name, Song_release_year FROM singer ORDER BY Age ASC LIMIT 1; 
SELECT Song_Name, Song_release_year FROM singer ORDER BY Age ASC LIMIT 1; 
SELECT DISTINCT Country FROM singer WHERE Age > 20; 
SELECT DISTINCT Country FROM singer WHERE Age > 20; 
SELECT Country, COUNT(Singer_ID) AS NumberOfSingers FROM singer GROUP BY Country; 
SELECT Country, COUNT(*) FROM singer GROUP BY Country; 
SELECT Song_Name FROM singer WHERE Age > (SELECT AVG(Age) FROM singer) 
SELECT Song_Name FROM singer WHERE Age > (SELECT AVG(Age) FROM singer) 
SELECT Location, Name FROM stadium WHERE Capacity BETWEEN 5000 AND 10000; 
SELECT Location, Name FROM stadium WHERE Capacity BETWEEN 5000 AND 10000; 
SELECT MAX(Capacity), AVG(Capacity) FROM stadium; 
SELECT AVG(Capacity) AS Average_Capacity, MAX(Capacity) AS Maximum_Capacity FROM stadium; 
SELECT Name, Capacity FROM stadium ORDER BY Average DESC LIMIT 1; 
SELECT Name, Capacity FROM stadium ORDER BY Average DESC LIMIT 1; 
SELECT COUNT(*) FROM concert WHERE YEAR IN ('2014', '2015'); 
SELECT COUNT(*) FROM concert WHERE YEAR IN ('2014', '2015'); 
SELECT s.Name, COUNT(c.concert_ID) AS Number_of_Concerts FROM stadium s JOIN concert c ON s.Stadium_ID = c.Stadium_ID GROUP BY s.Name; 
SELECT s.Name AS Stadium, COUNT(c.concert_ID) AS NumberOfConcerts FROM stadium s JOIN concert c ON s.Stadium_ID = c.Stadium_ID GROUP BY s.Name; 
SELECT s.Name, s.Capacity, COUNT(c.concert_ID) AS concert_count FROM stadium s JOIN concert c ON s.Stadium_ID = c.Stadium_ID WHERE c.Year >= '2014' GROUP BY s.Name, s.Capacity ORDER BY concert_count DESC; 
SELECT s.Name, s.Capacity  FROM stadium s  JOIN concert c ON s.Stadium_ID = c.Stadium_ID  WHERE c.Year > 2013  GROUP BY s.Stadium_ID  ORDER BY COUNT(c.concert_ID) DESC  LIMIT 1; 
SELECT YEAR, COUNT(*) AS concert_count FROM concert GROUP BY YEAR ORDER BY concert_count DESC LIMIT 1; 
SELECT Year, COUNT(*) AS NumberOfConcerts FROM concert GROUP BY Year ORDER BY NumberOfConcerts DESC LIMIT 1; 
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert) 
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert) 
SELECT DISTINCT Country FROM singer WHERE Age > 40 INTERSECT SELECT DISTINCT Country FROM singer WHERE Age < 30
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert WHERE Year = 2014) 
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert WHERE Year = '2014') 
SELECT c.concert_Name, c.Theme, COUNT(sc.Singer_ID) AS Number_of_Singers FROM concert c JOIN singer_in_concert sc ON c.concert_ID = sc.concert_ID GROUP BY c.concert_ID, c.concert_Name, c.Theme; 
SELECT c.concert_Name, c.Theme, COUNT(sc.Singer_ID) AS Number_of_Singers FROM concert c JOIN singer_in_concert sc ON c.concert_ID = sc.concert_ID GROUP BY c.concert_ID; 
SELECT s.Name, COUNT(sc.concert_ID) AS Number_of_Concerts FROM singer s JOIN singer_in_concert sc ON s.Singer_ID = sc.Singer_ID GROUP BY s.Name; 
SELECT s.Name, COUNT(sic.concert_ID) AS Number_of_Concerts FROM singer s JOIN singer_in_concert sic ON s.Singer_ID = sic.Singer_ID GROUP BY s.Name; 
SELECT s.Name FROM singer AS s JOIN singer_in_concert AS sic ON s.Singer_ID = sic.Singer_ID JOIN concert AS c ON sic.concert_ID = c.concert_ID WHERE c.Year = '2014'; 
SELECT T3.Name FROM concert AS T1 INNER JOIN singer_in_concert AS T2 ON T1.concert_id = T2.concert_id INNER JOIN singer AS T3 ON T2.singer_id = T3.singer_id WHERE T1.Year = '2014'
SELECT Name, Country FROM singer WHERE Song_Name LIKE '%Hey%'
SELECT Name, Country FROM singer WHERE Song_Name LIKE '%Hey%' 
SELECT s.Name, s.Location FROM stadium s JOIN concert c ON s.Stadium_ID = c.Stadium_ID WHERE c.Year IN ('2014', '2015') GROUP BY s.Name, s.Location HAVING COUNT(DISTINCT c.Year) = 2; 
SELECT s.Name, s.Location FROM stadium s JOIN concert c ON s.Stadium_ID = c.Stadium_ID WHERE c.Year IN ('2014', '2015') GROUP BY s.Name, s.Location HAVING COUNT(DISTINCT c.Year) > 1; 
SELECT COUNT(*) AS NumberOfConcerts, s.Name FROM concert c JOIN stadium s ON c.Stadium_ID = s.Stadium_ID ORDER BY s.Capacity DESC LIMIT 1; 
SELECT COUNT(*) FROM concert AS c JOIN stadium AS s ON c.Stadium_ID = s.Stadium_ID WHERE s.Capacity = (SELECT MAX(Capacity) FROM stadium) 
SELECT COUNT(*) FROM Pets WHERE weight > 10; 
SELECT COUNT(*) FROM Pets WHERE weight > 10; 
SELECT MIN(weight) FROM Pets WHERE PetType = 'dog'
SELECT weight FROM Pets WHERE PetType = 'dog' ORDER BY pet_age ASC LIMIT 1; 
SELECT MAX(weight), PetType FROM Pets GROUP BY PetType;
SELECT PetType, MAX(weight) AS MaxWeight FROM Pets GROUP BY PetType; 
SELECT COUNT(*) AS NumberOfPets FROM Student s JOIN Has_Pet hp ON s.StuID = hp.StuID WHERE s.Age > 20; 
SELECT COUNT(*) AS PetCount FROM Student JOIN Has_Pet ON Student.StuID = Has_Pet.StuID WHERE Student.Age > 20; 
SELECT COUNT(*) AS NumberOfDogPets FROM Student s JOIN Has_Pet hp ON s.StuID = hp.StuID JOIN Pets p ON hp.PetID = p.PetID WHERE s.Sex = 'F' AND p.PetType = 'dog'; 
SELECT COUNT(*) AS NumberOfDogPets FROM Student s JOIN Has_Pet hp ON s.StuID = hp.StuID JOIN Pets p ON hp.PetID = p.PetID WHERE s.Sex = 'F' AND p.PetType = 'dog'; 
SELECT COUNT(DISTINCT PetType) AS NumberOfDistinctPetTypes FROM Pets; 
SELECT COUNT(DISTINCT PetType) FROM Pets; 
SELECT T1.Fname FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType IN ('cat', 'dog') 
SELECT T1.Fname FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType IN ('cat', 'dog')
SELECT s.Fname FROM Student s JOIN Has_Pet hp ON s.StuID = hp.StuID JOIN Pets p ON hp.PetID = p.PetID WHERE p.PetType = 'cat' INTERSECT SELECT s.Fname FROM Student s JOIN Has_Pet hp ON s.StuID = hp.StuID JOIN Pets p ON hp.PetID = p.PetID WHERE p.PetType = 'dog'; 
SELECT s.Fname FROM Student s JOIN Has_Pet hp ON s.StuID = hp.StuID JOIN Pets p ON hp.PetID = p.PetID WHERE p.PetType = 'cat' INTERSECT SELECT s.Fname FROM Student s JOIN Has_Pet hp ON s.StuID = hp.StuID JOIN Pets p ON hp.PetID = p.PetID WHERE p.PetType = 'dog'; 
SELECT S.Major, S.Age FROM Student S WHERE S.StuID NOT IN (SELECT HP.StuID FROM Has_Pet HP JOIN Pets P ON HP.PetID = P.PetID WHERE P.PetType = 'cat') 
SELECT T1.Major, T1.Age FROM Student AS T1 LEFT JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID WHERE T2.PetID IS NULL OR T2.PetID NOT IN ( SELECT PetID FROM Pets WHERE PetType = 'cat' )
SELECT StuID FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet INNER JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE PetType = 'cat') 
SELECT StuID FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE PetType = 'cat') 
SELECT s.Fname, s.Age FROM Student s WHERE EXISTS (     SELECT 1     FROM Has_Pet hp     JOIN Pets p ON hp.PetID = p.PetID     WHERE hp.StuID = s.StuID AND p.PetType = 'dog' ) AND NOT EXISTS (     SELECT 1     FROM Has_Pet hp     JOIN Pets p ON hp.PetID = p.PetID     WHERE hp.StuID = s.StuID AND p.PetType = 'cat' ); 
SELECT S.Fname FROM Student AS S JOIN Has_Pet AS HP ON S.StuID = HP.StuID JOIN Pets AS P ON HP.PetID = P.PetID WHERE P.PetType = 'dog' AND S.StuID NOT IN ( 	SELECT StuID 	FROM Has_Pet 	JOIN Pets ON Has_Pet.PetID = Pets.PetID 	WHERE Pets.PetType = 'cat' ) GROUP BY S.Fname; 
SELECT P.PetType, P.weight FROM Pets AS P JOIN Has_Pet AS HP ON P.PetID = HP.PetID ORDER BY P.pet_age ASC LIMIT 1; 
SELECT T2.PetType, T2.weight FROM Has_Pet AS T1 INNER JOIN Pets AS T2 ON T1.PetID = T2.PetID ORDER BY T2.pet_age ASC LIMIT 1
SELECT PetID, weight FROM Pets WHERE pet_age > 1; 
SELECT PetID, weight FROM Pets WHERE pet_age > 1;
SELECT Pets.PetType, AVG(Pets.pet_age) AS AvgAge, MAX(Pets.pet_age) AS MaxAge FROM Pets JOIN Has_Pet ON Pets.PetID = Has_Pet.PetID GROUP BY Pets.PetType
SELECT Pets.PetType, AVG(Pets.pet_age) AS AvgAge, MAX(Pets.pet_age) AS MaxAge FROM Pets JOIN Has_Pet ON Pets.PetID = Has_Pet.PetID GROUP BY Pets.PetType; 
SELECT Pets.PetType, AVG(Pets.weight) AS AverageWeight FROM Pets JOIN Has_Pet ON Pets.PetID = Has_Pet.PetID GROUP BY Pets.PetType; 
SELECT AVG(T2.weight), T2.PetType FROM Has_Pet AS T1 INNER JOIN Pets AS T2 ON T1.PetID = T2.PetID GROUP BY T2.PetType; 
SELECT T1.Fname, T1.Age FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID
SELECT DISTINCT T1.Fname, T1.Age FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID
SELECT T2.PetID FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID WHERE T1.LName = 'Smith'
SELECT T2.PetID FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID WHERE T1.LName = 'Smith'
SELECT StuID, COUNT(PetID) AS NumberOfPets FROM Has_Pet GROUP BY StuID; 
SELECT StuID, COUNT(PetID) AS NumberOfPets FROM Has_Pet GROUP BY StuID; 
SELECT S.Fname, S.Sex FROM Student S JOIN Has_Pet HP ON S.StuID = HP.StuID GROUP BY S.StuID, S.Fname, S.Sex HAVING COUNT(HP.PetID) > 1; 
SELECT S.Fname, S.Sex FROM Student AS S JOIN Has_Pet AS HP ON S.StuID = HP.StuID GROUP BY S.StuID HAVING COUNT(HP.PetID) > 1;
SELECT S.LName FROM Student AS S JOIN Has_Pet AS HP ON S.StuID = HP.StuID JOIN Pets AS P ON HP.PetID = P.PetID WHERE P.PetType = 'cat' AND P.pet_age = 3; 
SELECT T1.LName FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'cat' AND T3.pet_age = 3; 
SELECT AVG(Age) AS Avg_Age FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet) 
SELECT AVG(Age) AS AvgAge FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet); 
SELECT COUNT(*) FROM continents; 
SELECT COUNT(*) FROM continents; 
SELECT c.ContId, co.Continent, COUNT(c.CountryId) AS NumberOfCountries FROM continents co JOIN countries c ON co.ContId = c.Continent GROUP BY c.ContId, co.Continent; 
SELECT c.ContId, c.Continent, COUNT(co.CountryId) AS NumberOfCountries FROM continents c LEFT JOIN countries co ON c.ContId = co.Continent GROUP BY c.ContId, c.Continent; 
SELECT COUNT(CountryId) FROM countries;
SELECT COUNT(*) FROM countries; 
SELECT T2.FullName, T2.Id, COUNT(T1.Model) AS NumberOfModels FROM model_list AS T1 INNER JOIN car_makers AS T2 ON T1.Maker = T2.Id GROUP BY T2.FullName, T2.Id
SELECT T1.FullName, T1.Id, COUNT(T2.Model) AS NumberOfModels FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.Id, T1.FullName; 
SELECT T.Model FROM (SELECT T2.Model, MIN(T1.Horsepower) AS MinHorsepower FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.Id = T2.MakeId GROUP BY T2.Model) AS T ORDER BY T.MinHorsepower ASC LIMIT 1; 
SELECT T1.Model FROM model_list AS T1 INNER JOIN cars_data AS T2 ON T1.ModelId = T2.Id ORDER BY T2.Horsepower ASC LIMIT 1; 
SELECT T.Model FROM (     SELECT C.Model, D.Weight     FROM cars_data AS D     JOIN car_names AS C ON D.Id = C.MakeId ) AS T WHERE T.Weight < (SELECT AVG(Weight) FROM cars_data) 
SELECT T1.Model FROM model_list AS T1 INNER JOIN cars_data AS T2 ON T1.Model = T2.MakeId WHERE T2.Weight < (SELECT AVG(Weight) FROM cars_data) 
SELECT T2.Maker FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.MakeId = T2.MakeId WHERE T1.Year = 1970; 
SELECT DISTINCT T2.Make FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.Id = T2.MakeId WHERE T1.Year = 1970; 
SELECT T1.Make, T2.Year FROM car_names AS T1 INNER JOIN cars_data AS T2 ON T1.MakeId = T2.Id ORDER BY T2.Year ASC LIMIT 1
SELECT T3.Maker, T1.Year FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.Id = T2.MakeId INNER JOIN car_makers AS T3 ON T2.Model = T3.Make ORDER BY T1.Year ASC LIMIT 1; 
SELECT DISTINCT T1.Model FROM model_list AS T1 INNER JOIN cars_data AS T2 ON T1.Model = T2.Id WHERE T2.Year > 1980; 
SELECT DISTINCT T2.Model FROM cars_data AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.ModelId WHERE T1.Year > 1980; 
SELECT T2.Continent ,  COUNT(T1.Maker) FROM car_makers AS T1 INNER JOIN countries AS T2 ON T1.Country = T2.CountryId INNER JOIN continents AS T3 ON T2.Continent = T3.ContId GROUP BY T2.Continent
SELECT c.Continent, COUNT(cm.Id) AS NumberOfCarMakers FROM continents c JOIN countries co ON c.ContId = co.Continent JOIN car_makers cm ON co.CountryId = cm.Country GROUP BY c.Continent; 
SELECT T1.CountryName FROM countries AS T1 JOIN car_makers AS T2 ON T1.CountryId = T2.Country GROUP BY T1.CountryName ORDER BY COUNT(T2.Maker) DESC LIMIT 1; 
SELECT T1.CountryName, COUNT(T2.Maker) AS MakerCount FROM countries AS T1 JOIN car_makers AS T2 ON T1.CountryId = T2.Country GROUP BY T1.CountryName ORDER BY MakerCount DESC LIMIT 1; 
SELECT COUNT(T1.Model), T2.FullName FROM model_list AS T1 INNER JOIN car_makers AS T2 ON T1.Maker = T2.Id GROUP BY T2.FullName
SELECT T1.id, T1.FullName, COUNT(T2.Model) AS NumberOfCarModels FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.id, T1.FullName
SELECT Accelerate FROM cars_data WHERE Make = 'amc' AND Model = 'hornet sportabout sw';
SELECT T1.Accelerate FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.MakeId = T2.MakeId WHERE T2.Model = 'amc rebel sst'
SELECT COUNT(*) AS NumberOfCarMakersInFrance FROM car_makers WHERE Country = (SELECT CountryId FROM countries WHERE CountryName = 'france') 
SELECT COUNT(Id) FROM car_makers WHERE Country IN (SELECT CountryId FROM countries WHERE CountryName = 'france') 
SELECT COUNT(Maker) FROM car_makers WHERE Country = 'usa'; 
SELECT COUNT(*) FROM car_makers WHERE Country = '1'; 
SELECT AVG(MPG) FROM cars_data WHERE Cylinders = 4; 
SELECT AVG(MPG) FROM cars_data WHERE Cylinders = 4; 
SELECT MIN(Weight) FROM cars_data WHERE Cylinders = 8 AND Year = 1974; 
SELECT MIN(Weight) FROM cars_data WHERE Cylinders = 8 AND Year = 1974; 
SELECT T1.Maker, T2.Model FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker
SELECT T1.Maker, T2.Model FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker
SELECT c.CountryName, c.CountryId FROM countries c JOIN car_makers cm ON c.CountryId = cm.Country GROUP BY c.CountryName, c.CountryId; 
SELECT DISTINCT T2.CountryName, T2.CountryID FROM car_makers AS T1 INNER JOIN countries AS T2 ON T1.Country = T2.CountryId 
SELECT COUNT(*) FROM cars_data WHERE Horsepower > 150; 
SELECT COUNT(*) FROM cars_data WHERE Horsepower > 150; 
SELECT YEAR, AVG(Weight) AS AverageWeight FROM cars_data GROUP BY YEAR; 
SELECT AVG(Weight), Year FROM cars_data GROUP BY Year
SELECT c.CountryName  FROM countries c  JOIN car_makers cm ON c.CountryId = cm.Country  WHERE c.Continent = 2  GROUP BY c.CountryName  HAVING COUNT(cm.Maker) >= 3; 
SELECT c.CountryName, COUNT(cm.Maker) AS ManufacturerCount FROM countries c JOIN car_makers cm ON c.CountryId = cm.Country WHERE c.Continent = 2 GROUP BY c.CountryName HAVING ManufacturerCount >= 3; 
SELECT MAX(T2.Horsepower), T1.Make FROM car_names AS T1 INNER JOIN cars_data AS T2 ON T1.MakeId = T2.Id WHERE T2.Cylinders = 3
SELECT MAX(T1.Horsepower), T2.Make FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.Id = T2.MakeId WHERE T1.Cylinders = 3
SELECT T1.Model FROM model_list AS T1 INNER JOIN cars_data AS T2 ON T1.ModelId = T2.Id ORDER BY T2.MPG DESC LIMIT 1
SELECT T2.Model FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.Id = T2.MakeId ORDER BY T1.MPG DESC LIMIT 1 
SELECT AVG(Horsepower) FROM cars_data WHERE Year < 1980
SELECT AVG(Horsepower) FROM cars_data WHERE Year < 1980; 
SELECT AVG(cars_data.Edispl) AS AverageEdispl FROM cars_data INNER JOIN car_names ON cars_data.Id = car_names.MakeId WHERE car_names.Model = 'volvo'; 
SELECT AVG(T2.Edispl) AS AverageEdispl FROM car_makers AS T1 INNER JOIN cars_data AS T2 ON T1.Id = T2.MakeId WHERE T1.Maker = 'volkswagen'; 
SELECT Cylinders, MAX(Accelerate) AS Max_Accelerate FROM cars_data GROUP BY Cylinders ORDER BY Max_Accelerate DESC; 
SELECT Cylinders, MAX(Accelerate) AS MaxAccel FROM cars_data GROUP BY Cylinders; 
SELECT T2.Model, COUNT(DISTINCT T1.Make) AS VersionCount FROM car_names AS T1 JOIN model_list AS T2 ON T1.Model = T2.Model GROUP BY T2.Model ORDER BY VersionCount DESC; 
SELECT T1.Model, COUNT(DISTINCT T2.Make) AS VersionCount FROM model_list AS T1 JOIN car_names AS T2 ON T1.Model = T2.Model GROUP BY T1.Model ORDER BY VersionCount DESC LIMIT 1; 
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 4; 
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 4; 
SELECT COUNT(*) FROM cars_data WHERE Year = 1980; 
SELECT COUNT(Id) AS CarCount FROM cars_data WHERE Year = 1980; 
SELECT COUNT(*) AS NumberOfModels FROM model_list JOIN car_makers ON model_list.Maker = car_makers.Id WHERE car_makers.FullName = 'American Motor Company'; 
SELECT COUNT(*) FROM model_list WHERE Maker IN (SELECT Id FROM car_makers WHERE Maker = 'amc'); 
SELECT cm.Id, cm.FullName, COUNT(ml.Model) AS ModelCount FROM car_makers cm JOIN model_list ml ON cm.Id = ml.Maker GROUP BY cm.Id, cm.FullName HAVING ModelCount > 3; 
SELECT T1.Maker, T1.Id FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.Maker HAVING COUNT(T2.Model) > 3; 
SELECT DISTINCT T3.Model  FROM car_makers AS T1  JOIN model_list AS T2 ON T1.Id = T2.Maker  JOIN car_names AS T3 ON T2.Model = T3.Model  WHERE T1.FullName = 'General Motors' OR T3.MakeId IN (SELECT Id FROM cars_data WHERE Weight > 3500) 
SELECT DISTINCT T3.Model FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker INNER JOIN car_names AS T3 ON T2.Model = T3.Model WHERE T1.Maker = 'gm' OR T3.Weight > 3500
SELECT DISTINCT Year FROM cars_data WHERE Weight BETWEEN 3000 AND 4000; 
SELECT DISTINCT Year FROM cars_data WHERE Weight < 4000 INTERSECT SELECT DISTINCT Year FROM cars_data WHERE Weight > 3000
SELECT Horsepower FROM cars_data ORDER BY Accelerate DESC LIMIT 1
SELECT Horsepower FROM cars_data ORDER BY Accelerate DESC LIMIT 1
SELECT MIN(Cylinders) AS MinCylinders FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId WHERE car_names.Model = 'volvo'; 
SELECT Cylinders FROM cars_data WHERE Model IN (SELECT Model FROM car_names WHERE Make = 'volvo') ORDER BY Accelerate ASC LIMIT 1; 
SELECT COUNT(*) FROM cars_data WHERE Accelerate > (SELECT MAX(Horsepower) FROM cars_data); 
SELECT COUNT(*) FROM cars_data WHERE Accelerate > ( SELECT MAX(Accelerate) FROM cars_data ); 
SELECT COUNT(Country) AS CountryCount FROM ( 	SELECT Country 	FROM car_makers 	GROUP BY Country 	HAVING COUNT(Maker) > 2 ) AS CountriesWithMoreThanTwoMakers; 
SELECT COUNT(*) FROM (     SELECT Country FROM car_makers GROUP BY Country HAVING COUNT(Maker) > 2 ) 
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 6; 
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 6; 
SELECT T2.Model, T1.Horsepower  FROM cars_data AS T1  JOIN car_names AS T2 ON T1.Id = T2.MakeId  WHERE T1.Cylinders = 4  ORDER BY T1.Horsepower DESC; 
SELECT T1.Model, MAX(T2.Horsepower) AS MaxHorsepower FROM model_list AS T1 INNER JOIN cars_data AS T2 ON T1.ModelId = T2.Id WHERE T2.Cylinders = 4 GROUP BY T1.Model ORDER BY MaxHorsepower DESC; 
SELECT cm.MakeId, cm.FullName FROM car_makers cm JOIN car_names cn ON cm.Id = cn.MakeId WHERE cn.Model IN (     SELECT Model     FROM cars_data     WHERE Horsepower > (         SELECT MIN(Horsepower)         FROM cars_data     ) AND Cylinders <= 3 ); 
SELECT cm.MakeId, cm.FullName  FROM car_makers cm  JOIN car_names cn ON cm.Id = cn.MakeId  WHERE cn.Model IN (     SELECT Model      FROM cars_data      WHERE Cylinders < 4 AND Horsepower <> (         SELECT MIN(Horsepower)          FROM cars_data          WHERE Cylinders < 4     ) ) 
SELECT MAX(MPG) FROM cars_data WHERE Cylinders = 8 OR Year < 1980; 
SELECT MAX(MPG) FROM cars_data WHERE Cylinders = 8 OR Year < 1980
SELECT model_list.Model FROM model_list JOIN car_names ON model_list.Model = car_names.Model JOIN cars_data ON car_names.MakeId = cars_data.Id WHERE cars_data.Weight < 3500 AND car_makers.Maker != 'ford'; 
SELECT DISTINCT T1.Model FROM model_list AS T1 INNER JOIN car_names AS T2 ON T1.Model = T2.Model INNER JOIN cars_data AS T3 ON T2.MakeId = T3.Id WHERE T3.Weight < 3500 AND T1.Maker != (SELECT Id FROM car_makers WHERE Maker = 'ford') 
SELECT C.CountryName FROM countries AS C WHERE C.CountryId NOT IN (SELECT DISTINCT CM.Country FROM car_makers AS CM) 
SELECT c.CountryName FROM countries c WHERE c.CountryId NOT IN (SELECT DISTINCT cm.Country FROM car_makers cm) 
SELECT Maker, Id FROM car_makers WHERE Id IN (     SELECT Maker FROM model_list GROUP BY Maker HAVING COUNT(Model) >= 2 ) GROUP BY Maker HAVING COUNT(Maker) > 3; 
SELECT cm.Id, cm.Maker FROM car_makers cm JOIN model_list ml ON cm.Id = ml.Maker GROUP BY cm.Id, cm.Maker HAVING COUNT(*) >= 2 AND COUNT(*) > 3; 
SELECT c.CountryId, c.CountryName  FROM countries c  WHERE (     SELECT COUNT(*)      FROM car_makers cm      WHERE cm.Country = c.CountryId ) > 3  OR EXISTS (     SELECT 1      FROM car_makers cm      JOIN model_list ml ON cm.Id = ml.Maker      JOIN car_names cn ON ml.Model = cn.Model      WHERE cm.Country = c.CountryId AND cn.Make = 'fiat' ); 
SELECT c.CountryId, c.CountryName FROM countries c WHERE (     SELECT COUNT(*) FROM car_makers cm WHERE cm.Country = c.CountryId ) > 3 OR EXISTS (     SELECT 1 FROM model_list ml JOIN car_names cn ON ml.Model = cn.Model WHERE ml.Maker IN (SELECT Id FROM car_makers WHERE Country = c.CountryId AND Maker LIKE '%fiat%') ) 
SELECT Country FROM airlines WHERE Airline = 'JetBlue Airways'
SELECT Country FROM airlines WHERE Airline = 'Jetblue Airways'
SELECT Abbreviation FROM airlines WHERE Airline = 'JetBlue Airways'
SELECT Abbreviation FROM airlines WHERE Airline = 'Jetblue Airways'; 
SELECT Airline, Abbreviation FROM airlines WHERE Country = 'USA'; 
SELECT Airline, Abbreviation FROM airlines WHERE Country = 'USA'
SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony'; 
SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony'
SELECT COUNT(*) FROM airlines; 
SELECT COUNT(*) FROM airlines; 
SELECT COUNT(*) FROM airports; 
SELECT COUNT(*) FROM airports; 
SELECT COUNT(*) FROM flights; 
SELECT COUNT(*) FROM flights; 
SELECT Airline FROM airlines WHERE Abbreviation = 'UAL'
SELECT Airline FROM airlines WHERE Abbreviation = 'UAL'
SELECT COUNT(*) FROM airlines WHERE Country = 'USA'; 
SELECT COUNT(*) FROM airlines WHERE Country = 'USA'; 
SELECT T.City, T.Country FROM airports AS T WHERE T.AirportName = 'Alton'; 
SELECT T.City, T.Country FROM airports AS T WHERE T.AirportName = 'Alton'
SELECT AirportName FROM airports WHERE AirportCode = 'AKO'; 
SELECT AirportName FROM airports WHERE AirportCode = 'AKO'
SELECT AirportName FROM airports WHERE City = 'Aberdeen'
SELECT AirportName FROM airports WHERE City = 'Aberdeen'; 
SELECT COUNT(*) FROM flights WHERE SourceAirport = 'APG'; 
SELECT COUNT(*) FROM flights WHERE SourceAirport = 'APG'; 
SELECT COUNT(*) FROM flights WHERE DestAirport = 'ATO'
SELECT COUNT(*) FROM flights WHERE DestAirport = 'ATO'; 
SELECT COUNT(*) FROM airports AS a JOIN flights AS f ON a.AirportCode = f.SourceAirport WHERE a.City = 'Aberdeen'; 
SELECT COUNT(*) FROM flights WHERE SourceAirport IN ('APG', 'ABR') 
SELECT COUNT(*) FROM flights INNER JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airports.City = 'Aberdeen'; 
SELECT COUNT(*) FROM airports AS a JOIN flights AS f ON a.AirportCode = f.DestAirport WHERE a.City LIKE '%Aberdeen%' 
SELECT COUNT(*)  FROM flights  JOIN airports ON flights.SourceAirport = airports.AirportCode AND airports.City = 'Aberdeen'  JOIN airports AS dest_airports ON flights.DestAirport = dest_airports.AirportCode AND dest_airports.City = 'Ashley'; 
SELECT COUNT(*) FROM flights WHERE SourceAirport IN (SELECT AirportCode FROM airports WHERE City = 'Aberdeen') AND DestAirport IN (SELECT AirportCode FROM airports WHERE City = 'Ashley'); 
SELECT COUNT(*) FROM flights WHERE Airline = 5; 
SELECT COUNT(*) FROM airlines INNER JOIN flights ON airlines.uid = flights.Airline WHERE airlines.Airline = 'JetBlue Airways'; 
SELECT COUNT(*) FROM flights WHERE Airline = 1 AND DestAirport = 'ASY'; 
SELECT COUNT(*) FROM flights WHERE Airline = 1 AND DestAirport = 'ASY'; 
SELECT COUNT(*) FROM flights WHERE Airline = 1 AND SourceAirport = 'AHD';
SELECT COUNT(*) FROM flights WHERE Airline = 1 AND SourceAirport = 'AHD'; 
SELECT COUNT(*) FROM flights INNER JOIN airlines ON flights.Airline = airlines.uid INNER JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airlines.Airline = 'United Airlines' AND airports.City = 'Aberdeen'; 
SELECT COUNT(*) FROM flights WHERE Airline = 1 AND DestAirport IN ( SELECT AirportCode FROM airports WHERE City = 'Aberdeen' )
SELECT T2.City, COUNT(*) AS NumberOfArrivingFlights FROM flights AS T1 JOIN airports AS T2 ON T1.DestAirport = T2.AirportCode GROUP BY T2.City ORDER BY NumberOfArrivingFlights DESC LIMIT 1; 
SELECT T2.City, COUNT(T2.DestAirport) AS Frequency FROM flights AS T1 JOIN airports AS T2 ON T1.DestAirport = T2.AirportCode GROUP BY T2.City ORDER BY Frequency DESC LIMIT 1; 
SELECT T2.City, COUNT(*) as FlightCount FROM flights AS T1 INNER JOIN airports AS T2 ON T1.SourceAirport = T2.AirportCode GROUP BY T2.City ORDER BY FlightCount DESC LIMIT 1; 
SELECT T2.City, COUNT(T1.SourceAirport) AS Frequency FROM flights AS T1 JOIN airports AS T2 ON T1.SourceAirport = T2.AirportCode GROUP BY T2.City ORDER BY Frequency DESC LIMIT 1; 
SELECT SourceAirport FROM flights GROUP BY SourceAirport ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT SourceAirport AS AirportCode, COUNT(*) AS FlightCount FROM flights GROUP BY SourceAirport ORDER BY FlightCount DESC LIMIT 1; 
SELECT SourceAirport, COUNT(*) as FlightCount FROM flights GROUP BY SourceAirport ORDER BY FlightCount ASC LIMIT 1; 
SELECT SourceAirport FROM flights GROUP BY SourceAirport ORDER BY COUNT(*) ASC LIMIT 1; 
SELECT T1.Airline, COUNT(*) as FlightCount FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline ORDER BY FlightCount DESC LIMIT 1; 
SELECT T2.Airline, COUNT(*) AS FlightCount FROM flights AS T1 INNER JOIN airlines AS T2 ON T1.Airline = T2.uid GROUP BY T2.Airline ORDER BY FlightCount DESC LIMIT 1; 
SELECT T1.Abbreviation, T1.Country FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Abbreviation, T1.Country ORDER BY COUNT(T2.FlightNo) ASC LIMIT 1
SELECT T1.Abbreviation, T1.Country FROM airlines AS T1 JOIN (     SELECT Airline, COUNT(*) AS FlightCount     FROM flights     GROUP BY Airline ) AS T2 ON T1.uid = T2.Airline ORDER BY T2.FlightCount ASC LIMIT 1; 
SELECT DISTINCT T1.Airline FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'AHD' 
SELECT DISTINCT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'AHD'; 
SELECT DISTINCT T1.Airline FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.DestAirport = 'AHD'; 
SELECT DISTINCT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.DestAirport = 'AHD'; 
SELECT a.Airline FROM airlines a JOIN flights f ON a.uid = f.Airline WHERE f.SourceAirport IN ('APG', 'CVO') GROUP BY a.Airline HAVING COUNT(DISTINCT f.SourceAirport) > 1; 
SELECT T.Airline FROM (     SELECT DISTINCT Airline FROM flights WHERE SourceAirport = 'APG'     INTERSECT     SELECT DISTINCT Airline FROM flights WHERE SourceAirport = 'CVO' ) AS T; 
SELECT DISTINCT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'CVO' AND T2.DestAirport NOT IN (SELECT DestAirport FROM flights WHERE SourceAirport = 'APG') 
SELECT DISTINCT T1.Airline FROM flights AS T1 JOIN airports AS T2 ON T1.SourceAirport = T2.AirportCode WHERE T2.City = 'CVO' EXCEPT SELECT DISTINCT T1.Airline FROM flights AS T1 JOIN airports AS T2 ON T1.SourceAirport = T2.AirportCode WHERE T2.City = 'APG' 
 SELECT T2.Airline FROM flights AS T1 INNER JOIN airlines AS T2 ON T1.Airline = T2.uid GROUP BY T2.Airline HAVING COUNT(T1.FlightNo) >= 10 
SELECT T1.Airline FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline HAVING COUNT(T2.FlightNo) >= 10
 SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline HAVING COUNT(T2.FlightNo) < 200; 
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline HAVING COUNT(T2.FlightNo) < 200; 
SELECT FlightNo FROM flights WHERE Airline = (SELECT uid FROM airlines WHERE Airline = 'United Airlines') 
SELECT FlightNo FROM flights WHERE Airline = 1
SELECT FlightNo FROM flights WHERE SourceAirport = 'APG'
SELECT FlightNo FROM flights WHERE SourceAirport = 'APG'
SELECT FlightNo FROM flights WHERE DestAirport = 'APG'; 
SELECT FlightNo FROM flights WHERE DestAirport = 'APG'; 
SELECT f.FlightNo FROM flights f JOIN airports a ON f.SourceAirport = a.AirportCode WHERE a.City = 'Aberdeen ' 
SELECT T2.FlightNo FROM airports AS T1 INNER JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport WHERE T1.City LIKE '%Aberdeen%'
SELECT T2.FlightNo FROM airports AS T1 INNER JOIN flights AS T2 ON T1.AirportCode = T2.DestAirport WHERE T1.City = 'Aberdeen'
SELECT T1.FlightNo FROM flights AS T1 INNER JOIN airports AS T2 ON T1.DestAirport = T2.AirportCode WHERE T2.City LIKE '%Aberdeen%' 
SELECT COUNT(*) FROM airports AS T1 INNER JOIN flights AS T2 ON T1.AirportCode = T2.DestAirport WHERE T1.City IN ('Aberdeen', 'Abilene') 
SELECT COUNT(*) FROM flights WHERE DestAirport IN ('APG', 'ABR', 'DYS', 'ABI') 
SELECT AirportName FROM airports WHERE AirportCode NOT IN (SELECT SourceAirport FROM flights) AND AirportCode NOT IN (SELECT DestAirport FROM flights); 
SELECT AirportName FROM airports WHERE AirportCode NOT IN (SELECT SourceAirport FROM flights) AND AirportCode NOT IN (SELECT DestAirport FROM flights); 
SELECT COUNT(*) FROM employee; 
SELECT COUNT(Employee_ID) AS Number_of_Employees FROM employee; 
SELECT Name FROM employee ORDER BY Age ASC
SELECT Name FROM employee ORDER BY Age ASC
SELECT City, COUNT(Employee_ID) AS Number_of_Employees FROM employee GROUP BY City; 
SELECT City, COUNT(Employee_ID) AS Number_of_Employees FROM employee GROUP BY City; 
Query Dimensions: - City  Filter Conditions: - Age < 30  Aggregation Functions: - COUNT(Employee_ID)  Grouping Requirements: - BY City  HAVING COUNT(Employee_ID) > 1
SELECT City FROM employee WHERE Age < 30 GROUP BY City HAVING COUNT(Employee_ID) > 1
SELECT Location, COUNT(*) AS Number_of_Shops FROM shop GROUP BY Location; 
SELECT COUNT(Shop_ID) AS Number_of_Shops, Location FROM shop GROUP BY Location; 
SELECT manager_name, district FROM shop ORDER BY number_products DESC LIMIT 1; 
SELECT Manager_name, District FROM shop ORDER BY Number_products DESC LIMIT 1; 
SELECT MIN(Number_products), MAX(Number_products) FROM shop
SELECT MIN(Number_products) AS MinProducts, MAX(Number_products) AS MaxProducts FROM shop
SELECT Name, Location, District FROM shop ORDER BY Number_products DESC; 
SELECT Name, Location, District FROM shop ORDER BY Number_products DESC; 
SELECT Name FROM shop WHERE Number_products > (SELECT AVG(Number_products) FROM shop); 
SELECT Name FROM shop WHERE Number_products > (SELECT AVG(Number_products) FROM shop); 
SELECT e.Name, COUNT(ea.Employee_ID) AS Award_Count FROM employee e JOIN evaluation ea ON e.Employee_ID = ea.Employee_ID GROUP BY e.Name ORDER BY Award_Count DESC; 
SELECT e.Name FROM employee e JOIN evaluation ev ON e.Employee_ID = ev.Employee_ID GROUP BY e.Employee_ID ORDER BY COUNT(ev.Employee_ID) DESC LIMIT 1; 
SELECT e.Name FROM employee AS e JOIN evaluation AS ev ON e.Employee_ID = ev.Employee_ID ORDER BY ev.Bonus DESC LIMIT 1; 
SELECT T2.Name FROM evaluation AS T1 INNER JOIN employee AS T2 ON T1.Employee_ID = T2.Employee_ID ORDER BY T1.Bonus DESC LIMIT 1; 
SELECT Name FROM employee WHERE Employee_ID NOT IN (SELECT Employee_ID FROM evaluation); 
SELECT Name FROM employee WHERE Employee_ID NOT IN (SELECT Employee_ID FROM evaluation) 
SELECT s.Name  FROM shop s  JOIN hiring h ON s.Shop_ID = h.Shop_ID  GROUP BY s.Shop_ID  ORDER BY COUNT(h.Employee_ID) DESC  LIMIT 1; 
SELECT s.Name FROM shop s JOIN hiring h ON s.Shop_ID = h.Shop_ID GROUP BY s.Name ORDER BY COUNT(h.Employee_ID) DESC LIMIT 1; 
SELECT Name FROM shop WHERE Shop_ID NOT IN (SELECT Shop_ID FROM hiring)
SELECT Name FROM shop WHERE Shop_ID NOT IN (SELECT Shop_ID FROM hiring); 
SELECT s.Name AS Shop_Name, COUNT(h.Employee_ID) AS Number_of_Employees_Hired FROM hiring h JOIN shop s ON h.Shop_ID = s.Shop_ID GROUP BY s.Name; 
SELECT COUNT(h.Employee_ID) AS Number_of_Employees, s.Name AS Shop_Name FROM hiring h JOIN shop s ON h.Shop_ID = s.Shop_ID GROUP BY s.Name; 
SELECT SUM(Bonus) AS Total_Bonus FROM evaluation; 
SELECT SUM(Bonus) AS Total_Bonus FROM evaluation; 
SELECT * FROM hiring; 
SELECT * FROM hiring; 
SELECT District FROM shop WHERE Number_products < 3000 INTERSECT SELECT District FROM shop WHERE Number_products > 10000
SELECT DISTINCT T1.District FROM shop AS T1 WHERE T1.Number_products < 3000 INTERSECT SELECT DISTINCT T1.District FROM shop AS T1 WHERE T1.Number_products > 10000
SELECT COUNT(DISTINCT Location) FROM shop; 
SELECT COUNT(DISTINCT Location) FROM shop; 
SELECT COUNT(*) AS Total_Documents FROM Documents; 
SELECT COUNT(*) AS Number_of_Documents FROM Documents; 
SELECT Document_ID, Document_Name, Document_Description FROM Documents; 
SELECT Document_ID, Document_Name, Document_Description FROM Documents; 
SELECT D.Document_Name, T.Template_ID FROM Documents D JOIN Templates T ON D.Template_ID = T.Template_ID WHERE D.Document_Description LIKE '%w%'; 
SELECT T1.Document_Name, T1.Template_ID FROM Documents AS T1 WHERE T1.Document_Description LIKE '%w%'
SELECT Document_ID, Template_ID, Document_Description FROM Documents WHERE Document_Name = 'Robbin CV'; 
SELECT Document_ID, Template_ID, Document_Description FROM Documents WHERE Document_Name = 'Robbin CV'
SELECT COUNT(DISTINCT Template_ID) AS Number_of_Different_Templates FROM Documents; 
SELECT COUNT(DISTINCT Template_ID) AS NumberOfDifferentTemplates FROM Documents; 
SELECT COUNT(*) FROM Documents WHERE Template_ID IN (SELECT Template_ID FROM Templates WHERE Template_Type_Code = 'PPT'); 
SELECT COUNT(*) FROM Documents D JOIN Templates T ON D.Template_ID = T.Template_ID WHERE T.Template_Type_Code = 'PPT'; 
SELECT T.Template_ID, COUNT(D.Document_ID) AS Number_of_Documents FROM Templates T LEFT JOIN Documents D ON T.Template_ID = D.Template_ID GROUP BY T.Template_ID; 
SELECT Template_ID, COUNT(*) FROM Documents GROUP BY Template_ID
SELECT T.Template_ID, TT.Template_Type_Code FROM Templates T JOIN Ref_Template_Types TT ON T.Template_Type_Code = TT.Template_Type_Code JOIN Documents D ON T.Template_ID = D.Template_ID GROUP BY T.Template_ID, TT.Template_Type_Code ORDER BY COUNT(D.Document_ID) DESC LIMIT 1; 
SELECT T.Template_ID, TT.Template_Type_Code FROM Templates AS T JOIN Ref_Template_Types AS TT ON T.Template_Type_Code = TT.Template_Type_Code JOIN Documents AS D ON T.Template_ID = D.Template_ID GROUP BY T.Template_ID, TT.Template_Type_Code ORDER BY COUNT(D.Document_ID) DESC LIMIT 1
SELECT Template_ID  FROM Documents  GROUP BY Template_ID  HAVING COUNT(Document_ID) > 1; 
SELECT Template_ID FROM Documents GROUP BY Template_ID HAVING COUNT(Document_ID) > 1
SELECT Template_ID FROM Templates WHERE Template_ID NOT IN (SELECT Template_ID FROM Documents) 
SELECT Template_ID FROM Templates WHERE Template_ID NOT IN (SELECT Template_ID FROM Documents) 
SELECT COUNT(*) AS Total_Templates FROM Templates; 
SELECT COUNT(*) FROM Templates; 
SELECT Template_ID, Version_Number, Template_Type_Code FROM Templates; 
SELECT Template_ID, Version_Number, Template_Type_Code FROM Templates;
SELECT DISTINCT Template_Type_Code FROM Templates
SELECT DISTINCT Template_Type_Code FROM Ref_Template_Types;
SELECT Template_ID FROM Templates WHERE Template_Type_Code IN ('PP', 'PPT'); 
SELECT Template_ID FROM Templates WHERE Template_Type_Code IN ('PP', 'PPT')
SELECT COUNT(*) FROM Templates WHERE Template_Type_Code = 'CV'; 
SELECT COUNT(*) FROM Templates WHERE Template_Type_Code = 'CV'; 
SELECT Version_Number, Template_Type_Code FROM Templates WHERE Version_Number > 5; 
SELECT Version_Number, Template_Type_Code FROM Templates WHERE Version_Number > 5;
SELECT Template_Type_Code, COUNT(*) AS Number_of_Templates FROM Templates GROUP BY Template_Type_Code; 
SELECT Template_Type_Code, COUNT(*) FROM Templates GROUP BY Template_Type_Code
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code ORDER BY COUNT(Template_ID) DESC LIMIT 1; 
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code HAVING COUNT(*) < 3; 
SELECT Template_Type_Code  FROM Templates  GROUP BY Template_Type_Code  HAVING COUNT(*) < 3; 
SELECT MIN(Version_Number), Template_Type_Code FROM Templates GROUP BY Template_Type_Code
SELECT MIN(Version_Number), Template_Type_Code FROM Templates GROUP BY Template_Type_Code ORDER BY Version_Number ASC LIMIT 1
SELECT T.Template_Type_Code FROM Templates AS T JOIN Documents AS D ON T.Template_ID = D.Template_ID WHERE D.Document_Name = 'Data base' 
SELECT T.Template_Type_Code FROM Templates T JOIN Documents D ON T.Template_ID = D.Template_ID WHERE D.Document_Name = 'Data base'; 
SELECT D.Document_Name FROM Documents AS D JOIN Templates AS T ON D.Template_ID = T.Template_ID WHERE T.Template_Type_Code = 'BK'
SELECT D.Document_Name FROM Documents AS D JOIN Templates AS T ON D.Template_ID = T.Template_ID WHERE T.Template_Type_Code = 'BK'; 
SELECT tt.Template_Type_Code, COUNT(d.Document_ID) AS Number_of_Documents FROM Ref_Template_Types tt JOIN Templates t ON tt.Template_Type_Code = t.Template_Type_Code JOIN Documents d ON t.Template_ID = d.Template_ID GROUP BY tt.Template_Type_Code; 
SELECT T2.Template_Type_Code, COUNT(DISTINCT T1.Document_ID) AS Document_Count FROM Documents AS T1 INNER JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T2.Template_Type_Code
SELECT T.Template_Type_Code FROM Templates AS T JOIN Documents AS D ON T.Template_ID = D.Template_ID GROUP BY T.Template_Type_Code ORDER BY COUNT(D.Document_ID) DESC LIMIT 1; 
SELECT Template_Type_Code  FROM Documents  JOIN Templates ON Documents.Template_ID = Templates.Template_ID  GROUP BY Template_Type_Code  ORDER BY COUNT(*) DESC  LIMIT 1; 
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Code NOT IN (SELECT Template_Type_Code FROM Templates INNER JOIN Documents ON Templates.Template_ID = Documents.Template_ID) 
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Code NOT IN (SELECT Template_Type_Code FROM Templates WHERE Template_ID IN (SELECT Template_ID FROM Documents)); 
SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types; 
SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types; 
SELECT Template_Type_Description FROM Ref_Template_Types WHERE Template_Type_Code = 'AD'
SELECT Template_Type_Description FROM Ref_Template_Types WHERE Template_Type_Code = 'AD'; 
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Book'; 
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Book'
SELECT DISTINCT T2.Template_Type_Description FROM Documents AS T1 INNER JOIN Ref_Template_Types AS T2 ON T1.Template_ID = T2.Template_ID
SELECT DISTINCT T2.Template_Type_Description FROM Documents AS T1 INNER JOIN Ref_Template_Types AS T2 ON T1.Template_ID = T2.Template_Type_Code 
SELECT T.Template_ID FROM Templates AS T JOIN Ref_Template_Types AS RTT ON T.Template_Type_Code = RTT.Template_Type_Code WHERE RTT.Template_Type_Description = 'Presentation'; 
SELECT Templates.Template_ID  FROM Templates  JOIN Ref_Template_Types ON Templates.Template_Type_Code = Ref_Template_Types.Template_Type_Code  WHERE Ref_Template_Types.Template_Type_Description = 'Presentation'; 
SELECT COUNT(*) AS Total_Paragraphs FROM Paragraphs; 
SELECT COUNT(*) AS Number_of_Paragraphs FROM Paragraphs; 
SELECT COUNT(*) FROM Documents AS D JOIN Paragraphs AS P ON D.Document_ID = P.Document_ID WHERE D.Document_Name = 'Summer Show'; 
SELECT COUNT(*) FROM Documents d JOIN Paragraphs p ON d.Document_ID = p.Document_ID WHERE d.Document_Name = 'Summer Show'; 
SELECT * FROM Paragraphs WHERE Paragraph_Text LIKE '%Korea%'; 
SELECT P.Paragraph_Text FROM Paragraphs AS P WHERE P.Paragraph_Text LIKE '%Korea%'
SELECT p.Paragraph_ID, p.Paragraph_Text FROM Paragraphs p JOIN Documents d ON p.Document_ID = d.Document_ID WHERE d.Document_Name = 'Welcome to NY'; 
SELECT p.Paragraph_ID, p.Paragraph_Text FROM Paragraphs p JOIN Documents d ON p.Document_ID = d.Document_ID WHERE d.Document_Name = 'Welcome to NY'; 
SELECT Paragraph_Text FROM Documents AS D JOIN Paragraphs AS P ON D.Document_ID = P.Document_ID WHERE D.Document_Name = 'Customer reviews'; 
SELECT p.Paragraph_Text FROM Paragraphs p JOIN Documents d ON p.Document_ID = d.Document_ID WHERE d.Document_Name = 'Customer reviews'; 
SELECT D.Document_ID, COUNT(P.Paragraph_ID) AS Number_of_Paragraphs FROM Documents D LEFT JOIN Paragraphs P ON D.Document_ID = P.Document_ID GROUP BY D.Document_ID ORDER BY D.Document_ID; 
SELECT Document_ID, COUNT(*) AS Number_of_Paragraphs FROM Paragraphs GROUP BY Document_ID ORDER BY Document_ID; 
SELECT D.Document_ID, D.Document_Name, COUNT(P.Paragraph_ID) AS Number_of_Paragraphs FROM Documents D LEFT JOIN Paragraphs P ON D.Document_ID = P.Document_ID GROUP BY D.Document_ID, D.Document_Name
SELECT Documents.Document_ID, Documents.Document_Name, COUNT(Paragraphs.Paragraph_ID) AS Number_of_Paragraphs FROM Documents LEFT JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID GROUP BY Documents.Document_ID, Documents.Document_Name
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(*) >= 2; 
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(*) >= 2; 
SELECT D.Document_ID, D.Document_Name FROM Documents D JOIN (     SELECT Document_ID, COUNT(*) AS Paragraph_Count     FROM Paragraphs     GROUP BY Document_ID ) P ON D.Document_ID = P.Document_ID ORDER BY P.Paragraph_Count DESC LIMIT 1; 
SELECT D.Document_ID, D.Document_Name  FROM Documents D  JOIN (     SELECT Document_ID, COUNT(*) AS Paragraph_Count      FROM Paragraphs      GROUP BY Document_ID ) P ON D.Document_ID = P.Document_ID  ORDER BY P.Paragraph_Count DESC  LIMIT 1; 
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID ORDER BY COUNT(*) ASC LIMIT 1
Query Dimensions: Document ID Filter Conditions: None Aggregation Functions: COUNT() Grouping Requirements: GROUP BY Document ID Sorting Requirements: ORDER BY COUNT(Document ID) ASC LIMIT 1
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(*) BETWEEN 1 AND 2; 
SELECT d.Document_ID FROM Documents d JOIN (     SELECT p.Document_ID, COUNT(p.Paragraph_ID) AS paragraph_count     FROM Paragraphs p     GROUP BY p.Document_ID ) sub ON d.Document_ID = sub.Document_ID WHERE sub.paragraph_count BETWEEN 1 AND 2; 
SELECT D.Document_ID FROM Documents D JOIN Paragraphs P ON D.Document_ID = P.Document_ID WHERE P.Paragraph_Text LIKE '%Brazil%' AND P.Paragraph_Text LIKE '%Ireland%'; 
SELECT D.Document_ID FROM Documents D JOIN Paragraphs P ON D.Document_ID = P.Document_ID WHERE P.Paragraph_Text LIKE '%Brazil%' AND P.Paragraph_Text LIKE '%Ireland%' 
SELECT COUNT(*) AS Total_Teachers FROM teacher; 
SELECT COUNT(Teacher_ID) AS Total_Teachers FROM teacher; 
SELECT Name FROM teacher ORDER BY Age ASC; 
SELECT T1.Name FROM teacher AS T1 ORDER BY T1.Age ASC; 
SELECT Age, Hometown FROM teacher;
SELECT Age, Hometown FROM teacher
SELECT T1.Name FROM teacher AS T1 WHERE T1.Hometown != 'Little Lever Urban District'
SELECT Name FROM teacher WHERE Hometown != 'Little Lever Urban District'; 
SELECT Name FROM teacher WHERE Age IN (32, 33)
SELECT Name FROM teacher WHERE Age IN ('32', '33') 
SELECT T2.Hometown FROM course_arrange AS T1 INNER JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID ORDER BY T2.Age ASC LIMIT 1
SELECT T1.Hometown FROM teacher AS T1 ORDER BY T1.Age ASC LIMIT 1; 
SELECT T.Hometown, COUNT(T.Teacher_ID) AS Number_of_Teachers FROM teacher AS T GROUP BY T.Hometown; 
SELECT T2.Hometown ,  COUNT(*) FROM course_arrange AS T1 INNER JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T2.Hometown
SELECT T.Hometown, COUNT(T.Teacher_ID) AS Teacher_Count FROM teacher AS T GROUP BY T.Hometown ORDER BY Teacher_Count DESC LIMIT 1; 
SELECT T.Hometown, COUNT(T.Hometown) AS Frequency FROM teacher AS T GROUP BY T.Hometown ORDER BY Frequency DESC LIMIT 1; 
SELECT Hometown FROM teacher GROUP BY Hometown HAVING COUNT(*) >= 2; 
SELECT T.Hometown FROM teacher AS T GROUP BY T.Hometown HAVING COUNT(T.Teacher_ID) >= 2; 
SELECT T2.Name, T1.Course FROM course AS T1 INNER JOIN teacher AS T2 ON T1.Course_ID = T2.Teacher_ID; 
SELECT T2.Name, T1.Course FROM course AS T1 INNER JOIN teacher AS T2 ON T1.Course_ID = T2.Teacher_ID; 
SELECT T2.Name, T1.Course FROM course AS T1 INNER JOIN teacher AS T2 ON T1.Course_ID = T2.Teacher_ID ORDER BY T2.Name ASC; 
SELECT T2.Name, T3.Course FROM course_arrange AS T1 INNER JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID INNER JOIN course AS T3 ON T1.Course_ID = T3.Course_ID ORDER BY T2.Name ASC; 
SELECT T3.Name FROM course AS T1 INNER JOIN course_arrange AS T2 ON T1.Course_ID = T2.Course_ID INNER JOIN teacher AS T3 ON T2.Teacher_ID = T3.Teacher_ID WHERE T1.Course = 'Math'; 
SELECT T2.Name FROM course AS T1 INNER JOIN teacher AS T2 ON T1.Course_ID = T3.Course_ID INNER JOIN course_arrange AS T3 ON T2.Teacher_ID = T3.Teacher_ID WHERE T1.Course = 'Math' 
SELECT T2.Name, COUNT(*) AS Course_Count FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T2.Name; 
SELECT T2.Name, COUNT(T1.Course_ID) AS Course_Count FROM course_arrange AS T1 INNER JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T2.Name; 
SELECT T.Name FROM teacher AS T JOIN course_arrange AS CA ON T.Teacher_ID = CA.Teacher_ID GROUP BY T.Teacher_ID HAVING COUNT(CA.Course_ID) >= 2; 
SELECT T2.Name FROM course_arrange AS T1 INNER JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T2.Name HAVING COUNT(T1.Course_ID) >= 2; 
SELECT Name FROM teacher WHERE Teacher_ID NOT IN (SELECT Teacher_ID FROM course_arrange); 
SELECT T.Name FROM teacher AS T WHERE T.Teacher_ID NOT IN (SELECT Teacher_ID FROM course_arrange); 
SELECT COUNT(ID) FROM visitor WHERE Age < 30
SELECT Name FROM visitor WHERE Level_of_membership > 4 ORDER BY Level_of_membership DESC; 
SELECT AVG(Age) FROM visitor WHERE Level_of_membership <= 4
SELECT Name, Level_of_membership FROM visitor WHERE Level_of_membership > 4 ORDER BY Age DESC; 
SELECT Museum_ID, Name FROM museum ORDER BY Num_of_Staff DESC LIMIT 1; 
SELECT AVG(Num_of_Staff) FROM museum WHERE Open_Year < '2009'; 
SELECT Open_Year, Num_of_Staff FROM museum WHERE Name = 'Plaza Museum'
SELECT Name FROM museum WHERE Num_of_Staff > (SELECT MIN(Num_of_Staff) FROM museum WHERE Open_Year > 2010) 
SELECT v.ID, v.Name, v.Age  FROM visitor v  JOIN visit vi ON v.ID = vi.visitor_ID  GROUP BY v.ID  HAVING COUNT(vi.Museum_ID) > 1; 
SELECT visitor.ID, visitor.Name, visitor.Level_of_membership FROM visitor JOIN visit ON visitor.ID = visit.visitor_ID GROUP BY visitor.ID, visitor.Name, visitor.Level_of_membership ORDER BY SUM(visit.Total_spent) DESC LIMIT 1; 
SELECT m.Museum_ID, m.Name, COUNT(v.Museum_ID) AS Visit_Count FROM visit v JOIN museum m ON v.Museum_ID = m.Museum_ID GROUP BY m.Museum_ID, m.Name ORDER BY Visit_Count DESC; 
SELECT Name FROM museum WHERE Museum_ID NOT IN (SELECT Museum_ID FROM visit)
SELECT v.Name, v.Age FROM visitor AS v JOIN visit AS vt ON v.ID = vt.visitor_ID ORDER BY vt.Num_of_Ticket DESC LIMIT 1; 
SELECT AVG(Num_of_Ticket) AS Average_Tickets, MAX(Num_of_Ticket) AS Maximum_Tickets FROM visit
SELECT SUM(Total_spent) AS Total_Ticket_Expense FROM visit JOIN visitor ON visit.visitor_ID = visitor.ID WHERE visitor.Level_of_membership = 1; 
SELECT v.Name FROM visitor v JOIN visit vi ON v.ID = vi.visitor_ID JOIN museum m ON vi.Museum_ID = m.Museum_ID WHERE m.Open_Year < 2009 INTERSECT SELECT v.Name FROM visitor v JOIN visit vi ON v.ID = vi.visitor_ID JOIN museum m ON vi.Museum_ID = m.Museum_ID WHERE m.Open_Year > 2011; 
SELECT COUNT(DISTINCT visitor_ID) FROM visit WHERE Museum_ID NOT IN (SELECT Museum_ID FROM museum WHERE Open_Year > 2010) 
SELECT COUNT(*) FROM museum WHERE Open_Year < '2008' OR Open_Year > '2013'; 
SELECT COUNT(*) AS total_players FROM players; 
SELECT COUNT(*) AS total_players FROM players; 
SELECT COUNT(*) AS total_matches FROM matches; 
SELECT COUNT(*) AS match_count FROM matches; 
SELECT first_name, birth_date FROM players WHERE country_code = 'USA'; 
SELECT first_name, birth_date FROM players WHERE country_code = 'USA'
SELECT      'Losers' AS Outcome,      AVG(loser_age) AS Average_Age FROM      matches UNION ALL SELECT      'Winners' AS Outcome,      AVG(winner_age) AS Average_Age FROM      matches; 
SELECT 'Winner' AS Type, AVG(winner_age) AS Average_Age FROM matches UNION ALL SELECT 'Loser' AS Type, AVG(loser_age) AS Average_Age FROM matches; 
SELECT AVG(winner_rank) AS average_winner_rank FROM matches; 
SELECT AVG(winner_rank) AS average_winner_rank FROM matches; 
SELECT MAX(loser_rank) FROM matches;
SELECT MIN(loser_rank) AS best_rank FROM matches; 
SELECT COUNT(DISTINCT country_code) FROM players;
SELECT COUNT(DISTINCT country_code) FROM players
SELECT COUNT(DISTINCT loser_name) AS number_of_distinct_losers FROM matches; 
SELECT COUNT(DISTINCT loser_name) AS distinct_loser_names FROM matches; 
SELECT tournament_name FROM matches GROUP BY tournament_name HAVING COUNT(*) > 10; 
SELECT tournament_name  FROM matches  GROUP BY tournament_name  HAVING COUNT(*) > 10; 
SELECT winner_name FROM matches WHERE year IN (2013, 2016) GROUP BY winner_name HAVING COUNT(DISTINCT year) > 1; 
SELECT winner_name FROM matches WHERE year = 2013 AND winner_name IN (SELECT winner_name FROM matches WHERE year = 2016) 
SELECT COUNT(*) AS total_matches FROM matches WHERE year IN (2013, 2016); 
SELECT COUNT(*) FROM matches WHERE year IN (2013, 2016); 
SELECT p.country_code, p.first_name FROM players p JOIN matches m ON p.player_id = m.winner_id WHERE m.tourney_name IN ('WTA Championships', 'Australian Open') GROUP BY p.country_code, p.first_name HAVING COUNT(DISTINCT m.tourney_name) = 2; 
SELECT p.first_name, p.country_code FROM players p JOIN matches m ON p.player_id = m.winner_id WHERE m.tourney_name IN ('WTA Championships', 'Australian Open') GROUP BY p.player_id, p.first_name, p.country_code HAVING COUNT(DISTINCT m.tourney_name) > 1; 
SELECT first_name, country_code FROM players ORDER BY birth_date ASC LIMIT 1; 
SELECT first_name, country_code FROM players ORDER BY birth_date ASC LIMIT 1; 
SELECT first_name, last_name, birth_date FROM players ORDER BY birth_date; 
SELECT first_name, last_name FROM players ORDER BY birth_date; 
SELECT first_name, last_name FROM players WHERE hand IN ('left', 'L') ORDER BY birth_date ASC; 
SELECT first_name, last_name FROM players WHERE hand = 'L' ORDER BY birth_date; 
SELECT p.first_name, p.country_code FROM players p JOIN rankings r ON p.player_id = r.player_id ORDER BY r.tours DESC LIMIT 1; 
Query Dimensions: - First Name - Country Code  Filter Conditions: None specified  Aggregation Functions: SUM(tours)  Grouping Requirements: By Player ID  Sorting Requirements: DESC by SUM(tours)
SELECT year, COUNT(*) AS match_count FROM matches GROUP BY year ORDER BY match_count DESC LIMIT 1; 
SELECT year, COUNT(*) AS match_count FROM matches GROUP BY year ORDER BY match_count DESC LIMIT 1; 
SELECT p.first_name, p.last_name, m.winner_rank_points FROM players p JOIN matches m ON p.player_id = m.winner_id GROUP BY p.player_id ORDER BY COUNT(m.match_num) DESC LIMIT 1; 
SELECT p.first_name, p.last_name, MAX(wins) AS max_wins, SUM(r.ranking_points) AS total_rank_points FROM players p JOIN (     SELECT winner_id, COUNT(*) AS wins     FROM matches     GROUP BY winner_id ) w ON p.player_id = w.winner_id JOIN rankings r ON p.player_id = r.player_id AND r.ranking_date = (     SELECT MAX(ranking_date)     FROM rankings     WHERE player_id = p.player_id ) GROUP BY p.player_id ORDER BY max_wins DESC, total_rank_points DESC LIMIT 1; 
SELECT p.first_name, p.last_name FROM players p JOIN matches m ON p.player_id = m.winner_id WHERE m.tourney_name = 'Australian Open' ORDER BY m.winner_rank_points DESC LIMIT 1
SELECT p.first_name, p.last_name, SUM(m.winner_rank_points) AS total_rank_points FROM players p JOIN matches m ON p.player_id = m.winner_id WHERE m.tourney_name = 'Australian Open' GROUP BY p.player_id ORDER BY total_rank_points DESC LIMIT 1; 
SELECT winner_name, loser_name FROM matches ORDER BY minutes DESC LIMIT 1; 
SELECT winner_name, loser_name, minutes AS match_duration FROM matches ORDER BY minutes DESC LIMIT 1; 
SELECT p.first_name, AVG(r.ranking) AS avg_ranking FROM players p JOIN rankings r ON p.player_id = r.player_id GROUP BY p.player_id, p.first_name; 
SELECT p.first_name, AVG(r.ranking) AS avg_ranking FROM players p JOIN rankings r ON p.player_id = r.player_id GROUP BY p.first_name; 
SELECT p.first_name, SUM(r.ranking_points) AS total_ranking_points FROM players p JOIN rankings r ON p.player_id = r.player_id GROUP BY p.player_id, p.first_name; 
SELECT p.first_name, SUM(r.ranking_points) AS total_ranking_points FROM players p JOIN rankings r ON p.player_id = r.player_id GROUP BY p.player_id, p.first_name; 
SELECT COUNT(players.player_id), players.country_code FROM players GROUP BY players.country_code; 
SELECT country_code, COUNT(*) AS player_count FROM players GROUP BY country_code; 
SELECT country_code FROM players GROUP BY country_code ORDER BY COUNT(player_id) DESC LIMIT 1; 
SELECT country_code FROM players GROUP BY country_code ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT country_code FROM players GROUP BY country_code HAVING COUNT(player_id) > 50
SELECT country_code  FROM players  GROUP BY country_code  HAVING COUNT(*) > 50; 
SELECT ranking_date, COUNT(tours) AS total_tours FROM rankings GROUP BY ranking_date; 
SELECT ranking_date, SUM(tours) AS total_tours FROM rankings GROUP BY ranking_date; 
SELECT year, COUNT(*) AS match_count FROM matches GROUP BY year; 
SELECT YEAR, COUNT(*) AS match_count FROM matches GROUP BY YEAR; 
SELECT T2.first_name || ' ' || T2.last_name AS Name, T2.winner_rank AS Rank FROM matches AS T1 JOIN players AS T2 ON T2.player_id = T1.winner_id ORDER BY T1.winner_age ASC LIMIT 3; 
SELECT p.first_name, p.last_name, r.ranking FROM players p JOIN (     SELECT winner_id, MIN(winner_age) AS min_age     FROM matches     GROUP BY winner_id ) m ON p.player_id = m.winner_id JOIN rankings r ON p.player_id = r.player_id AND r.ranking_date = (     SELECT MAX(ranking_date)     FROM rankings     WHERE player_id = p.player_id ) ORDER BY m.min_age ASC LIMIT 3; 
SELECT COUNT(DISTINCT w.winner_id) AS num_winners FROM matches m JOIN players w ON m.winner_id = w.player_id WHERE m.tourney_name = 'WTA Championships' AND w.hand = 'L'; 
SELECT COUNT(*) AS left_handed_winners FROM players p JOIN matches m ON p.player_id = m.winner_id WHERE p.hand = 'L' AND m.tourney_name = 'WTA Championships'; 
SELECT p.first_name, p.country_code, p.birth_date FROM players p JOIN matches m ON p.player_id = m.winner_id ORDER BY m.winner_rank_points DESC LIMIT 1; 
SELECT p.first_name, p.country_code, p.birth_date FROM players p JOIN (     SELECT winner_id, SUM(winner_rank_points) AS total_points     FROM matches     GROUP BY winner_id     ORDER BY total_points DESC     LIMIT 1 ) m ON p.player_id = m.winner_id; 
SELECT hand, COUNT(*) AS player_count FROM players GROUP BY hand; 
SELECT hand, COUNT(*) AS player_count FROM players GROUP BY hand; 
SELECT COUNT(*) FROM ship WHERE disposition_of_ship = 'Captured'; 
SELECT name ,  tonnage FROM ship ORDER BY name DESC
SELECT name, date, result FROM battle;
SELECT MAX(killed) AS max_death_toll, MIN(killed) AS min_death_toll FROM death; 
SELECT AVG(injured) AS average_injuries FROM death; 
SELECT T2.killed, T2.injured FROM ship AS T1 INNER JOIN death AS T2 ON T1.id = T2.caused_by_ship_id WHERE T1.tonnage = 't' GROUP BY T2.killed, T2.injured
SELECT name, result FROM battle WHERE bulgarian_commander != 'Boril'; 
SELECT DISTINCT b.id, b.name FROM battle b JOIN ship s ON b.id = s.lost_in_battle WHERE s.ship_type = 'Brig'; 
SELECT b.id, b.name FROM battle b JOIN ship s ON b.id = s.lost_in_battle JOIN death d ON s.id = d.caused_by_ship_id GROUP BY b.id, b.name HAVING SUM(d.killed) > 10; 
SELECT s.id AS ship_id, s.name AS ship_name, SUM(d.injured) AS total_injuries FROM ship s JOIN death d ON s.id = d.caused_by_ship_id GROUP BY s.id, s.name ORDER BY total_injuries DESC LIMIT 1; 
SELECT DISTINCT name FROM battle WHERE bulgarian_commander = 'Kaloyan' AND latin_commander = 'Baldwin I'; 
SELECT COUNT(DISTINCT result) FROM battle; 
SELECT COUNT(*) FROM battle WHERE id NOT IN (     SELECT lost_in_battle FROM ship WHERE tonnage = '225' ); 
SELECT b.name, b.date FROM battle b JOIN ship s ON b.id = s.lost_in_battle WHERE s.name IN ('Lettice', 'HMS Atalanta') GROUP BY b.name, b.date; 
SELECT name, result, bulgarian_commander FROM battle WHERE id NOT IN ( SELECT lost_in_battle FROM ship WHERE location = 'English Channel' ) AND location = 'English Channel';
SELECT note FROM death WHERE note LIKE '%East%'
SELECT line_1, line_2 FROM Addresses;
SELECT line_1, line_2 FROM Addresses;
SELECT COUNT(*) FROM Courses; 
SELECT COUNT(*) FROM Courses; 
SELECT course_description FROM Courses WHERE course_name = 'math'; 
SELECT course_description FROM Courses WHERE course_name = 'math'; 
SELECT zip_postcode FROM Addresses WHERE city = 'Port Chelsea'; 
SELECT zip_postcode FROM Addresses WHERE city = 'Port Chelsea'; 
SELECT D.department_name, D.department_id, COUNT(DP.degree_program_id) AS degree_count FROM Departments D JOIN Degree_Programs DP ON D.department_id = DP.department_id GROUP BY D.department_name, D.department_id ORDER BY degree_count DESC LIMIT 1; 
SELECT d.department_name, d.department_id, COUNT(dp.degree_program_id) AS degree_count FROM Departments d JOIN Degree_Programs dp ON d.department_id = dp.department_id GROUP BY d.department_id, d.department_name ORDER BY degree_count DESC LIMIT 1; 
SELECT COUNT(DISTINCT department_id) AS department_count FROM Degree_Programs; 
SELECT COUNT(DISTINCT department_id) AS distinct_departments FROM Degree_Programs; 
SELECT COUNT(DISTINCT degree_summary_name) AS distinct_degree_names FROM Degree_Programs; 
SELECT COUNT(DISTINCT degree_summary_name) FROM Degree_Programs
SELECT COUNT(degree_program_id) AS degree_count FROM Degree_Programs WHERE department_id = (SELECT department_id FROM Departments WHERE department_name = 'engineering'); 
SELECT COUNT(Degree_Programs.degree_program_id) FROM Degree_Programs JOIN Departments ON Degree_Programs.department_id = Departments.department_id WHERE Departments.department_name = 'engineering'; 
SELECT section_name, section_description FROM Sections;
SELECT section_name, section_description FROM Sections;
SELECT c.course_name, c.course_id FROM Courses c JOIN Sections s ON c.course_id = s.course_id GROUP BY c.course_id, c.course_name HAVING COUNT(s.section_id) <= 2; 
SELECT course_name, course_id FROM Courses WHERE course_id IN (SELECT course_id FROM Sections GROUP BY course_id HAVING COUNT(section_id) < 2)
SELECT section_name FROM Sections ORDER BY section_name DESC; 
SELECT section_name FROM Sections ORDER BY section_name DESC; 
SELECT s.semester_name, s.semester_id FROM Semesters s JOIN Student_Enrolment se ON s.semester_id = se.semester_id GROUP BY s.semester_name, s.semester_id ORDER BY COUNT(se.student_id) DESC LIMIT 1; 
SELECT s.semester_name, st.student_id, st.first_name, st.last_name FROM Semesters s JOIN Student_Enrolment se ON s.semester_id = se.semester_id JOIN Students st ON se.student_id = st.student_id WHERE se.student_id IN (     SELECT student_id     FROM Student_Enrolment     GROUP BY semester_id     ORDER BY COUNT(student_id) DESC     LIMIT 1 ) ORDER BY s.semester_id; 
SELECT department_description FROM Departments WHERE department_name LIKE '%computer%' 
SELECT department_description FROM Departments WHERE department_name LIKE '%computer%' 
SELECT s.first_name, s.middle_name, s.last_name, s.student_id FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id WHERE se.degree_program_id IN (     SELECT degree_program_id     FROM Student_Enrolment     GROUP BY student_id     HAVING COUNT(DISTINCT degree_program_id) = 2 ) GROUP BY s.student_id; 
SELECT s.first_name, s.middle_name, s.last_name, s.student_id FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id GROUP BY s.student_id, s.first_name, s.middle_name, s.last_name HAVING COUNT(DISTINCT se.degree_program_id) = 2; 
SELECT S.first_name, S.middle_name, S.last_name FROM Students AS S JOIN Student_Enrolment AS SE ON S.student_id = SE.student_id JOIN Degree_Programs AS DP ON SE.degree_program_id = DP.degree_program_id WHERE DP.degree_summary_name = 'Bachelor'
SELECT T1.first_name, T1.middle_name, T1.last_name FROM Students AS T1 INNER JOIN Student_Enrolment AS T2 ON T1.student_id = T2.student_id INNER JOIN Degree_Programs AS T3 ON T2.degree_program_id = T3.degree_program_id WHERE T3.degree_summary_name = 'Bachelor'
SELECT dp.degree_summary_name, COUNT(se.student_id) AS student_count FROM Degree_Programs dp JOIN Student_Enrolment se ON dp.degree_program_id = se.degree_program_id GROUP BY dp.degree_summary_name ORDER BY student_count DESC LIMIT 1; 
SELECT dp.degree_summary_name, COUNT(se.student_id) AS number_of_students_enrolled FROM Degree_Programs dp JOIN Student_Enrolment se ON dp.degree_program_id = se.degree_program_id GROUP BY dp.degree_summary_name ORDER BY number_of_students_enrolled DESC; 
SELECT dp.degree_program_id, dp.degree_summary_name FROM Degree_Programs dp JOIN Student_Enrolment se ON dp.degree_program_id = se.degree_program_id GROUP BY dp.degree_program_id, dp.degree_summary_name ORDER BY COUNT(se.student_id) DESC LIMIT 1; 
SELECT dp.degree_program_id, dp.degree_summary_name, COUNT(se.student_id) AS student_count FROM Degree_Programs dp JOIN Student_Enrolment se ON dp.degree_program_id = se.degree_program_id GROUP BY dp.degree_program_id, dp.degree_summary_name ORDER BY student_count DESC LIMIT 1; 
SELECT s.student_id, s.first_name, s.middle_name, s.last_name, COUNT(se.student_id) AS num_enrollments FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id GROUP BY s.student_id, s.first_name, s.middle_name, s.last_name ORDER BY num_enrollments DESC LIMIT 1
SELECT s.first_name, s.middle_name, s.last_name, s.student_id, COUNT(se.student_enrolment_id) AS num_enrollments FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id GROUP BY s.student_id ORDER BY num_enrollments DESC LIMIT 1; 
SELECT semester_name FROM Semesters WHERE semester_id NOT IN (SELECT semester_id FROM Student_Enrolment) 
SELECT semester_name FROM Semesters WHERE semester_id NOT IN (     SELECT semester_id     FROM Student_Enrolment ) ORDER BY semester_name; 
SELECT DISTINCT c.course_name FROM Courses c JOIN Student_Enrolment_Courses sec ON c.course_id = sec.course_id; 
SELECT DISTINCT c.course_name FROM Courses c JOIN Student_Enrolment_Courses sec ON c.course_id = sec.course_id; 
SELECT c.course_name, COUNT(sec.section_id) AS enrollment_count FROM Courses c JOIN Sections sec ON c.course_id = sec.course_id GROUP BY c.course_name ORDER BY enrollment_count DESC LIMIT 1; 
SELECT c.course_name, COUNT(se.student_id) AS number_of_students_enrolled FROM Courses c JOIN Student_Enrolment_Courses sec ON c.course_id = sec.course_id JOIN Student_Enrolment se ON sec.student_enrolment_id = se.student_enrolment_id GROUP BY c.course_name ORDER BY number_of_students_enrolled DESC; 
SELECT s.last_name FROM Students s JOIN Addresses a ON s.current_address_id = a.address_id WHERE a.state_province_county = 'North Carolina' AND s.student_id NOT IN (SELECT student_id FROM Student_Enrolment); 
SELECT s.last_name FROM Students s JOIN Addresses a ON s.current_address_id = a.address_id WHERE a.state_province_county = 'North Carolina' AND s.student_id NOT IN (SELECT se.student_id FROM Student_Enrolment se);
SELECT T1.transcript_date ,  T1.transcript_id FROM TRANSCRIPTS AS T1 JOIN Transcript_Contents AS T2 ON T1.transcript_id = T2.transcript_id GROUP BY T1.transcript_id HAVING COUNT(T2.student_course_id) >= 2
 SELECT T1.transcript_date, T1.transcript_id FROM Transcripts AS T1 JOIN Transcript_Contents AS T2 ON T1.transcript_id = T2.transcript_id GROUP BY T1.transcript_id HAVING COUNT(T2.student_course_id) >= 2; 
SELECT cell_mobile_number FROM Students WHERE first_name = 'Timmothy' AND last_name = 'Ward';
SELECT cell_mobile_number FROM Students WHERE first_name = 'Timmothy' AND last_name = 'Ward';
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_first_registered ASC LIMIT 1; 
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_first_registered ASC LIMIT 1; 
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_left ASC LIMIT 1; 
SELECT s.first_name, s.middle_name, s.last_name FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id WHERE se.semester_id IN (     SELECT semester_id     FROM Semesters     ORDER BY semester_name ASC     LIMIT 1 ) ORDER BY s.date_first_registered ASC LIMIT 1; 
SELECT T1.first_name FROM Students AS T1 WHERE T1.permanent_address_id != T1.current_address_id;
SELECT first_name FROM Students WHERE current_address_id != permanent_address_id LIMIT 1
SELECT T1.address_id, T1.line_1, T1.line_2, T1.line_3 FROM Addresses AS T1 JOIN Students AS T2 ON T1.address_id = T2.current_address_id GROUP BY T1.address_id, T1.line_1, T1.line_2, T1.line_3 ORDER BY COUNT(T2.student_id) DESC LIMIT 1
SELECT a.address_id, a.line_1, a.line_2 FROM Addresses a JOIN Students s ON a.address_id = s.current_address_id GROUP BY a.address_id, a.line_1, a.line_2 ORDER BY COUNT(s.student_id) DESC LIMIT 1; 
SELECT AVG(transcript_date) AS average_transcript_date FROM Transcripts; 
SELECT AVG(transcript_date) AS average_transcript_date FROM Transcripts; 
SELECT transcript_date, other_details FROM Transcripts ORDER BY transcript_date ASC LIMIT 1; 
SELECT MIN(transcript_date), other_details FROM Transcripts; 
SELECT COUNT(transcript_id) AS number_of_transcripts FROM Transcripts; 
SELECT COUNT(transcript_id) AS number_of_transcripts FROM Transcripts; 
SELECT MAX(transcript_date) AS last_transcript_release_date FROM Transcripts;
SELECT MAX(transcript_date) AS last_transcript_release FROM Transcripts; 
SELECT student_course_id, COUNT(transcript_id) AS occurrence FROM Transcript_Contents GROUP BY student_course_id ORDER BY occurrence DESC LIMIT 1
SELECT c.course_id, COUNT(DISTINCT t.transcript_id) AS max_transcript_count FROM Courses c JOIN Student_Enrolment_Courses sec ON c.course_id = sec.course_id JOIN Transcript_Contents tc ON sec.student_course_id = tc.student_course_id JOIN Transcripts t ON tc.transcript_id = t.transcript_id GROUP BY c.course_id ORDER BY max_transcript_count DESC LIMIT 1; 
SELECT transcript_date, transcript_id FROM Transcripts GROUP BY transcript_date, transcript_id ORDER BY COUNT(*) ASC LIMIT 1; 
 SELECT t.transcript_date, t.transcript_id FROM Transcripts t JOIN Transcript_Contents tc ON t.transcript_id = tc.transcript_id GROUP BY t.transcript_id ORDER BY COUNT(tc.student_course_id) ASC LIMIT 1; 
SELECT semester_name FROM Semesters WHERE semester_id IN (     SELECT semester_id     FROM Student_Enrolment     WHERE degree_program_id = (         SELECT degree_program_id         FROM Degree_Programs         WHERE degree_summary_name = 'Master'     ) ) AND semester_id IN (     SELECT semester_id     FROM Student_Enrolment     WHERE degree_program_id = (         SELECT degree_program_id         FROM Degree_Programs         WHERE degree_summary_name = 'Bachelor'     ) ); 
SELECT semester_id FROM Student_Enrolment WHERE degree_program_id IN (     SELECT degree_program_id     FROM Degree_Programs     WHERE degree_summary_name = 'Master' ) INTERSECT SELECT semester_id FROM Student_Enrolment WHERE degree_program_id IN (     SELECT degree_program_id     FROM Degree_Programs     WHERE degree_summary_name = 'Bachelor' ); 
SELECT COUNT(DISTINCT current_address_id) AS distinct_addresses FROM Students; 
SELECT DISTINCT current_address_id AS address_id FROM Students; 
SELECT * FROM Students ORDER BY first_name DESC, middle_name DESC, last_name DESC; 
SELECT * FROM Students ORDER BY last_name DESC; 
SELECT * FROM Sections WHERE section_name = 'h'; 
SELECT T.section_description FROM Sections AS T WHERE T.section_name = 'h'
SELECT first_name FROM Students WHERE permanent_address_id IN ( SELECT address_id FROM Addresses WHERE country = 'Haiti' ) OR cell_mobile_number = '09700166582'
SELECT first_name FROM Students WHERE permanent_address_id IN ( SELECT address_id FROM Addresses WHERE country = 'Haiti' ) OR cell_mobile_number = '09700166582'; 
SELECT Title FROM Cartoon ORDER BY Title ASC; 
SELECT Title FROM Cartoon ORDER BY Title ASC; 
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones'; 
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones'; 
SELECT COUNT(Cartoon) FROM Cartoon WHERE Written_by = 'Joseph Kuhr'; 
SELECT COUNT(*) FROM Cartoon WHERE Written_by = 'Joseph Kuhr'; 
SELECT C.Title, C.Directed_by, T.Air_Date FROM Cartoon AS C JOIN TV_series AS T ON C.Channel = T.Channel ORDER BY T.Air_Date; 
SELECT Title, Directed_by FROM Cartoon ORDER BY Original_air_date; 
SELECT Title FROM Cartoon WHERE Directed_by IN ('Ben Jones', 'Brandon Vietti'); 
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones' OR Directed_by = 'Brandon Vietti'
SELECT Country, COUNT(id) AS NumberOfTVChannels FROM TV_Channel GROUP BY Country ORDER BY NumberOfTVChannels DESC LIMIT 1; 
SELECT Country, COUNT(id) AS Number_of_TV_Channels FROM TV_Channel GROUP BY Country ORDER BY Number_of_TV_Channels DESC LIMIT 1; 
SELECT COUNT(DISTINCT series_name), COUNT(DISTINCT Content) FROM TV_Channel; 
SELECT COUNT(DISTINCT series_name) AS distinct_series, COUNT(DISTINCT content) AS distinct_contents FROM TV_Channel; 
SELECT Content FROM TV_Channel WHERE series_name = 'Sky Radio'; 
SELECT Content FROM TV_Channel WHERE series_name = 'Sky Radio'
SELECT Package_Option FROM TV_Channel WHERE series_name = 'Sky Radio'; 
SELECT DISTINCT Package_Option FROM TV_Channel WHERE series_name = 'Sky Radio'
SELECT COUNT(*) FROM TV_Channel WHERE Language = 'English'; 
SELECT COUNT(id) FROM TV_Channel WHERE Language = 'English'
SELECT Language, COUNT(id) AS NumberOfChannels FROM TV_Channel GROUP BY Language ORDER BY NumberOfChannels ASC LIMIT 1; 
SELECT Language, COUNT(*) AS Channel_Count FROM TV_Channel GROUP BY Language ORDER BY Channel_Count ASC LIMIT 1; 
SELECT Language, COUNT(id) AS NumberOfTVChannels FROM TV_Channel GROUP BY Language; 
SELECT Language ,  COUNT(*) FROM TV_Channel GROUP BY Language
SELECT T1.series_name FROM TV_Channel AS T1 INNER JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Title = 'The Rise of the Blue Beetle!'
SELECT T2.series_name FROM Cartoon AS T1 INNER JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T1.Title = 'The Rise of the Blue Beetle'
SELECT C.Title FROM Cartoon AS C JOIN TV_Channel AS TC ON C.Channel = TC.id WHERE TC.series_name = 'Sky Radio'; 
SELECT C.Title FROM Cartoon AS C JOIN TV_Channel AS TC ON C.Channel = TC.id WHERE TC.series_name = 'Sky Radio'; 
SELECT Episode FROM TV_series ORDER BY Rating DESC; 
SELECT Episode FROM TV_series ORDER BY Rating DESC; 
SELECT T2.Episode, T2.Rating FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel ORDER BY T2.Rating DESC LIMIT 3; 
SELECT Episode, Rating FROM TV_series ORDER BY Rating DESC LIMIT 3; 
SELECT MIN(Share), MAX(Share) FROM TV_series
SELECT MAX(Share) AS Max_Share, MIN(Share) AS Min_Share FROM TV_series; 
SELECT Air_Date FROM TV_series WHERE Episode = 'A Love of a Lifetime'
SELECT Air_Date FROM TV_series WHERE Episode = 'A Love of a Lifetime'; 
SELECT Weekly_Rank FROM TV_series WHERE Episode = 'A Love of a Lifetime'
SELECT Weekly_Rank FROM TV_series WHERE Episode = 'A Love of a Lifetime'; 
SELECT T2.series_name FROM TV_series AS T1 INNER JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T1.Episode = 'A Love of a Lifetime'
SELECT T2.series_name FROM TV_series AS T1 INNER JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T1.Episode = 'A Love of a Lifetime'
SELECT T2.Episode FROM TV_Channel AS T1 INNER JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T1.series_name = 'Sky Radio'; 
SELECT T2.Episode FROM TV_Channel AS T1 INNER JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T1.series_name = 'Sky Radio'; 
SELECT Directed_by, COUNT(*) AS Number_of_Cartoons FROM Cartoon GROUP BY Directed_by; 
SELECT Directed_by, COUNT(*) AS Number_of_Cartoons FROM Cartoon GROUP BY Directed_by; 
SELECT Production_code, Channel FROM Cartoon ORDER BY Original_air_date DESC LIMIT 1; 
SELECT T2.Production_code, T2.Channel FROM TV_Channel AS T1 INNER JOIN Cartoon AS T2 ON T1.id = T2.Channel ORDER BY T2.Original_air_date DESC LIMIT 1; 
SELECT T2.Package_Option, T1.series_name FROM TV_Channel AS T1 INNER JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T1.Hight_definition_TV = 'yes'
SELECT T1.Package_Option, T2.series_name FROM TV_Channel AS T1 INNER JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T1.Hight_definition_TV = 'yes'
SELECT DISTINCT T1.Country FROM TV_Channel AS T1 INNER JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Written_by = 'Todd Casey'; 
SELECT DISTINCT T1.Country FROM TV_Channel AS T1 INNER JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Written_by = 'Todd Casey'
SELECT DISTINCT T1.Country  FROM TV_Channel AS T1  WHERE T1.id NOT IN ( 	SELECT Channel  	FROM Cartoon  	WHERE Written_by = 'Todd Casey' ); 
SELECT DISTINCT T.Country FROM TV_Channel AS T JOIN Cartoon AS C ON T.id = C.Channel WHERE C.Written_by != 'Todd Casey'; 
SELECT T2.series_name, T1.Country  FROM TV_Channel AS T1  JOIN TV_series AS T2 ON T1.id = T2.Channel  WHERE T1.Content = 'cartoons'  AND T1.id IN (     SELECT Channel      FROM Cartoon      WHERE Directed_by IN ('Ben Jones', 'Michael Chang') ); 
SELECT DISTINCT tc.series_name, tc.Country  FROM TV_Channel tc  JOIN Cartoon c ON tc.id = c.Channel  WHERE c.Directed_by IN ('Ben Jones', 'Michael Chang') 
SELECT Pixel_aspect_ratio_PAR, Country FROM TV_Channel WHERE Language != 'English'
SELECT Pixel_aspect_ratio_PAR, Country FROM TV_Channel WHERE Language != 'English'
SELECT id FROM TV_Channel GROUP BY Country HAVING COUNT(id) > 2; 
SELECT id FROM TV_Channel GROUP BY id HAVING COUNT(id) > 2; 
SELECT id FROM TV_Channel WHERE id NOT IN (SELECT DISTINCT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones'); 
SELECT id FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones') 
SELECT DISTINCT T2.Package_Option FROM Cartoon AS T1 INNER JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T1.Directed_by != 'Ben Jones'; 
SELECT DISTINCT Package_Option  FROM TV_Channel  WHERE id NOT IN ( 	SELECT Channel  	FROM Cartoon  	WHERE Directed_by = 'Ben Jones' ); 
SELECT COUNT(*) AS NumberOfPokerPlayers FROM poker_player; 
SELECT COUNT(*) FROM poker_player;
SELECT Earnings FROM poker_player ORDER BY Earnings DESC; 
SELECT Earnings FROM poker_player ORDER BY Earnings DESC; 
SELECT Final_Table_Made, Best_Finish FROM poker_player
SELECT Final_Table_Made, Best_Finish FROM poker_player;
SELECT AVG(Earnings) AS Average_Earnings FROM poker_player; 
SELECT AVG(Earnings) AS Average_Earnings FROM poker_player; 
SELECT Money_Rank FROM poker_player ORDER BY Earnings DESC LIMIT 1
SELECT Money_Rank FROM poker_player ORDER BY Earnings DESC LIMIT 1; 
SELECT MAX(Final_Table_Made) FROM poker_player WHERE Earnings < 200000
SELECT MAX(Final_Table_Made) FROM poker_player WHERE Earnings < 200000
SELECT T2.Name FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID; 
SELECT T2.Name FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID
SELECT p.Name FROM poker_player AS pp JOIN people AS p ON pp.People_ID = p.People_ID WHERE pp.Earnings > 300000; 
SELECT T2.Name FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID WHERE T1.Earnings > 300000
SELECT T2.Name FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Final_Table_Made ASC
SELECT T2.Name FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Final_Table_Made ASC
SELECT T2.Birth_Date FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Earnings ASC LIMIT 1
SELECT T2.Birth_Date FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Earnings ASC LIMIT 1
SELECT T1.Money_Rank FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T2.Height DESC LIMIT 1
SELECT p.Money_Rank FROM poker_player p JOIN people pe ON p.People_ID = pe.People_ID ORDER BY pe.Height DESC LIMIT 1; 
SELECT AVG(T1.Earnings) AS Average_Earnings FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID WHERE T2.Height > 200; 
SELECT AVG(Earnings) FROM poker_player INNER JOIN people ON poker_player.People_ID = people.People_ID WHERE Height > 200;
SELECT T2.Name FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Earnings DESC; 
SELECT T2.Name FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Earnings DESC
SELECT p.Nationality, COUNT(p.People_ID) AS Number_of_People FROM people p GROUP BY p.Nationality; 
SELECT p.Nationality, COUNT(*) AS NumberOfPeople FROM poker_player pp JOIN people p ON pp.People_ID = p.People_ID GROUP BY p.Nationality; 
SELECT p.Nationality, COUNT(p.People_ID) AS Count FROM people p JOIN poker_player pp ON p.People_ID = pp.People_ID GROUP BY p.Nationality ORDER BY Count DESC LIMIT 1; 
SELECT Nationality FROM people GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT T2.Nationality FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID GROUP BY T2.Nationality HAVING COUNT(T2.Nationality) >= 2
SELECT p.Nationality FROM people p JOIN poker_player pp ON p.People_ID = pp.People_ID GROUP BY p.Nationality HAVING COUNT(pp.People_ID) >= 2; 
SELECT T2.Name, T2.Birth_Date FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T2.Name ASC; 
SELECT T2.Name, T2.Birth_Date FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T2.Name ASC; 
SELECT T2.Name FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID WHERE T2.Nationality != 'Russia' 
SELECT T2.Name FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID WHERE T2.Nationality != 'Russia'; 
SELECT Name FROM people WHERE People_ID NOT IN (SELECT People_ID FROM poker_player); 
SELECT Name FROM people WHERE People_ID NOT IN (SELECT People_ID FROM poker_player) 
SELECT COUNT(DISTINCT Nationality) FROM people
SELECT COUNT(DISTINCT Nationality) FROM people
SELECT COUNT(DISTINCT state) AS number_of_states FROM VOTES; 
SELECT C.contestant_number, C.contestant_name FROM CONTESTANTS AS C ORDER BY C.contestant_name DESC; 
SELECT vote_id, phone_number, state FROM VOTES;
SELECT MAX(T1.area_code), MIN(T1.area_code) FROM AREA_CODE_STATE AS T1; 
SELECT MAX(created) AS last_date_created FROM VOTES WHERE state = 'CA'; 
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name != 'Jessie Alloway'; 
SELECT DISTINCT state, created FROM VOTES;
SELECT C.contestant_number, C.contestant_name FROM CONTESTANTS AS C JOIN VOTES AS V ON C.contestant_number = V.contestant_number GROUP BY C.contestant_number, C.contestant_name HAVING COUNT(V.vote_id) >= 2
SELECT C.contestant_number, C.contestant_name, COUNT(V.vote_id) AS votes FROM CONTESTANTS C JOIN VOTES V ON C.contestant_number = V.contestant_number GROUP BY C.contestant_number, C.contestant_name ORDER BY votes ASC LIMIT 1; 
SELECT COUNT(*) FROM VOTES WHERE state IN ('NY', 'CA'); 
SELECT COUNT(*) FROM CONTESTANTS WHERE contestant_number NOT IN (SELECT contestant_number FROM VOTES); 
SELECT T1.area_code FROM AREA_CODE_STATE AS T1 INNER JOIN VOTES AS T2 ON T1.state = T2.state GROUP BY T1.area_code ORDER BY COUNT(T2.vote_id) DESC LIMIT 1
SELECT created, state, phone_number FROM VOTES WHERE contestant_number = (SELECT contestant_number FROM CONTESTANTS WHERE contestant_name = 'Tabatha Gehling') 
SELECT DISTINCT T1.area_code FROM AREA_CODE_STATE AS T1 JOIN VOTES AS T2 ON T1.state = T2.state JOIN CONTESTANTS AS T3 ON T2.contestant_number = T3.contestant_number WHERE T3.contestant_name IN ('Tabatha Gehling', 'Kelly Clauss') GROUP BY T1.area_code HAVING COUNT(DISTINCT T3.contestant_name) > 1; 
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name LIKE '%Al%' 
SELECT Name FROM country WHERE IndepYear > 1950; 
SELECT Name FROM country WHERE IndepYear > 1950; 
SELECT COUNT(Code) FROM country WHERE GovernmentForm = 'Republic'; 
SELECT COUNT(Code) FROM country WHERE GovernmentForm = 'Republic'; 
SELECT SUM(SurfaceArea) AS TotalSurfaceArea FROM country WHERE Region = 'Caribbean'; 
SELECT SUM(SurfaceArea) AS TotalSurfaceArea FROM country WHERE Region = 'Caribbean'; 
SELECT T1.Continent FROM country AS T1 JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T2.Name = 'Anguilla'; 
SELECT T2.Continent FROM city AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T1.Name = 'Anguilla'; 
SELECT T2.Region FROM city AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T1.Name = 'Kabul'; 
SELECT T1.Region FROM country AS T1 INNER JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T2.Name = 'Kabul'; 
SELECT Language, SUM(Percentage) AS TotalPercentage FROM countrylanguage WHERE CountryCode = 'ABW' GROUP BY Language ORDER BY TotalPercentage DESC; 
SELECT Language FROM countrylanguage WHERE CountryCode = 'ABW' ORDER BY Percentage DESC LIMIT 1; 
SELECT T1.Population, T1.LifeExpectancy FROM country AS T1 WHERE T1.Name = 'Brazil'; 
SELECT SUM(T1.Population), AVG(T1.LifeExpectancy) FROM country AS T1 JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T1.Name = 'Brazil'; 
SELECT T1.Region, T1.Population FROM country AS T1 WHERE T1.Name = 'Angola'; 
SELECT Region, Population FROM country WHERE Name = 'Angola'; 
SELECT AVG(LifeExpectancy) FROM country WHERE Region = 'Central Africa'; 
SELECT AVG(LifeExpectancy) FROM country WHERE Region = 'Central Africa'; 
SELECT Name FROM country WHERE Continent = 'Asia' ORDER BY LifeExpectancy ASC LIMIT 1; 
SELECT Name FROM country WHERE Continent = 'Asia' ORDER BY LifeExpectancy ASC LIMIT 1; 
SELECT SUM(T1.Population) AS TotalPopulation, MAX(T1.GNP) AS MaxGNP FROM country AS T1 WHERE T1.Continent = 'Asia'; 
SELECT SUM(T2.Population), MAX(T1.GNP) FROM country AS T1 INNER JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T1.Continent = 'Asia'; 
SELECT AVG(LifeExpectancy) AS AvgLifeExpectancy FROM country WHERE Continent = 'Africa' AND GovernmentForm = 'Republic'; 
SELECT AVG(LifeExpectancy) FROM country WHERE Continent = 'Africa' AND GovernmentForm = 'Republic';
SELECT SUM(SurfaceArea) FROM country WHERE Continent IN ('Asia', 'Europe') 
SELECT SUM(SurfaceArea) FROM country WHERE Continent IN ('Asia', 'Europe'); 
SELECT SUM(Population) FROM city WHERE District = 'Gelderland'; 
SELECT SUM(Population) FROM city WHERE District = 'Gelderland'; 
SELECT AVG(T2.GNP), SUM(T2.Population) FROM country AS T1 INNER JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T1.GovernmentForm = 'US territory'; 
SELECT AVG(T2.GNP), SUM(T2.Population) FROM city AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T1.Name LIKE '%US%' 
SELECT COUNT(DISTINCT Language) AS NumberOfUniqueLanguages FROM countrylanguage; 
SELECT COUNT(DISTINCT Language) FROM countrylanguage; 
SELECT COUNT(DISTINCT GovernmentForm) FROM country WHERE Continent = 'Africa'; 
SELECT COUNT(DISTINCT GovernmentForm) FROM country WHERE Continent = 'Africa'; 
SELECT COUNT(Language) AS TotalLanguages FROM countrylanguage WHERE CountryCode = 'ABW'; 
SELECT COUNT(DISTINCT Language) FROM countrylanguage WHERE CountryCode = 'ABW'; 
SELECT COUNT(Language) AS NumberOfOfficialLanguages FROM countrylanguage WHERE CountryCode = 'AFG' AND IsOfficial = 'T'; 
SELECT COUNT(Language) AS NumberOfOfficialLanguages FROM countrylanguage WHERE CountryCode = 'AFG' AND IsOfficial = 'T'; 
SELECT c.Name FROM country c JOIN (     SELECT cl.CountryCode, COUNT(cl.Language) AS LanguageCount     FROM countrylanguage cl     GROUP BY cl.CountryCode ) sub ON c.Code = sub.CountryCode ORDER BY sub.LanguageCount DESC LIMIT 1; 
SELECT c.Name FROM country AS c JOIN countrylanguage AS cl ON c.Code = cl.CountryCode GROUP BY c.Name ORDER BY COUNT(cl.Language) DESC LIMIT 1; 
SELECT T1.Continent FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode GROUP BY T1.Continent ORDER BY COUNT(DISTINCT T2.Language) DESC LIMIT 1
SELECT c.Continent, COUNT(cl.Language) AS LanguageCount FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode GROUP BY c.Continent ORDER BY LanguageCount DESC; 
SELECT COUNT(*) AS NumberOfCountriesSpeakingBothLanguages FROM countrylanguage WHERE Language = 'English' AND CountryCode IN (     SELECT CountryCode     FROM countrylanguage     WHERE Language = 'Dutch' ); 
SELECT COUNT(*) FROM countrylanguage WHERE Language IN ('English', 'Dutch'); 
SELECT c.Name FROM country AS c JOIN countrylanguage AS cl ON c.Code = cl.CountryCode WHERE cl.Language = 'English' AND EXISTS ( 	SELECT 1 	FROM countrylanguage AS cl2 	WHERE cl2.CountryCode = c.Code 	AND cl2.Language = 'French' ) 
SELECT c.Name FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE cl.Language = 'English' AND EXISTS ( 	SELECT 1 	FROM countrylanguage cl2 	WHERE cl2.CountryCode = c.Code 	AND cl2.Language = 'French' ) GROUP BY c.Name; 
SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'English' AND T2.IsOfficial = 'T' INTERSECT SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'French' AND T2.IsOfficial = 'T'
SELECT c.Name FROM country AS c JOIN countrylanguage AS cl ON c.Code = cl.CountryCode WHERE cl.Language = 'English' AND cl.IsOfficial = 'T' INTERSECT SELECT c.Name FROM country AS c JOIN countrylanguage AS cl ON c.Code = cl.CountryCode WHERE cl.Language = 'French' AND cl.IsOfficial = 'T'; 
SELECT COUNT(DISTINCT T2.Continent) FROM countrylanguage AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T1.Language = 'Chinese'; 
SELECT COUNT(T1.Continent) AS NumberOfContinents FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'Chinese'; 
SELECT DISTINCT T1.Region FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'English' OR T2.Language = 'Dutch'; 
SELECT T1.Region FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'Dutch' OR T2.Language = 'English'
SELECT c.Name FROM country AS c JOIN countrylanguage AS cl ON c.Code = cl.CountryCode WHERE cl.Language IN ('English', 'Dutch') AND cl.IsOfficial = 'T'; 
SELECT c.Name FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE cl.Language IN ('English', 'Dutch') AND cl.IsOfficial = 'T'; 
SELECT c.Language, COUNT(*) AS Popularity FROM countrylanguage cl JOIN country co ON cl.CountryCode = co.Code WHERE co.Continent = 'Asia' GROUP BY c.Language ORDER BY Popularity DESC LIMIT 1; 
SELECT Language FROM countrylanguage JOIN country ON country.Code = countrylanguage.CountryCode WHERE Continent = 'Asia' GROUP BY Language ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT c.Language FROM countrylanguage c JOIN country co ON c.CountryCode = co.Code WHERE co.GovernmentForm = 'Republic' GROUP BY c.Language HAVING COUNT(c.CountryCode) = 1; 
SELECT cl.Language FROM countrylanguage cl JOIN country c ON cl.CountryCode = c.Code WHERE c.GovernmentForm = 'Republic' GROUP BY cl.Language, cl.CountryCode HAVING COUNT(cl.CountryCode) = 1; 
SELECT c.Name, c.Population FROM city c JOIN countrylanguage cl ON c.CountryCode = cl.CountryCode WHERE cl.Language = 'English' ORDER BY c.Population DESC LIMIT 1; 
SELECT c.Name, SUM(cl.Percentage * c.Population / 100) AS PopulousCity FROM city c JOIN countrylanguage cl ON c.CountryCode = cl.CountryCode WHERE cl.Language = 'English' GROUP BY c.Name ORDER BY PopulousCity DESC LIMIT 1; 
SELECT Name, Population, LifeExpectancy FROM country WHERE Continent = 'Asia' ORDER BY SurfaceArea DESC LIMIT 1
SELECT Name, Population, LifeExpectancy FROM country WHERE Continent = 'Asia' ORDER BY SurfaceArea DESC LIMIT 1; 
SELECT AVG(T1.LifeExpectancy) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'English' AND T2.IsOfficial = 'F'; 
SELECT AVG(T1.LifeExpectancy) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'English' AND T2.IsOfficial = 'F'; 
SELECT SUM(T1.Population) AS TotalPopulation FROM city AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE NOT EXISTS (     SELECT 1     FROM countrylanguage AS T3     WHERE T3.CountryCode = T2.Code AND T3.Language = 'English' ); 
SELECT SUM(T1.Population) FROM city AS T1 JOIN countrylanguage AS T2 ON T1.CountryCode = T2.CountryCode WHERE T2.Language != 'English'; 
SELECT T2.Language FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.HeadOfState = 'Beatrix' AND T2.IsOfficial = 'T'; 
SELECT T2.Language FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.HeadOfState = 'Beatrix' AND T2.IsOfficial = 'T'; 
SELECT COUNT(DISTINCT Language) AS TotalUniqueOfficialLanguages FROM countrylanguage JOIN country ON country.Code = countrylanguage.CountryCode WHERE IndepYear < 1930; 
SELECT COUNT(DISTINCT T2.Language) AS TotalDistinctOfficialLanguages FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.IndepYear < 1930 AND T2.IsOfficial = 'T'; 
SELECT Name FROM country WHERE SurfaceArea > (SELECT MAX(SurfaceArea) FROM country WHERE Continent = 'Europe') 
SELECT Name FROM country WHERE SurfaceArea > (SELECT MAX(SurfaceArea) FROM country WHERE Continent = 'Europe') 
SELECT Name FROM country WHERE Continent = 'Africa' AND Population < (SELECT MIN(Population) FROM country WHERE Continent = 'Asia'); 
SELECT Name FROM country WHERE Region = 'Africa' AND Population < (SELECT MIN(Population) FROM country WHERE Region = 'Asia') 
SELECT c.Name FROM country c WHERE c.Region = 'Asia' AND c.Population > (     SELECT MAX(c2.Population)     FROM country c2     WHERE c2.Region = 'Africa' ); 
SELECT Name FROM country WHERE Continent = 'Asia' AND Population > (SELECT MAX(Population) FROM country WHERE Continent = 'Africa'); 
SELECT CountryCode FROM countrylanguage WHERE Language != 'English' GROUP BY CountryCode
SELECT Code FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English') 
SELECT CountryCode FROM countrylanguage WHERE Language != 'English'; 
SELECT DISTINCT CountryCode FROM countrylanguage WHERE Language != 'English'; 
SELECT Code FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English') AND GovernmentForm != 'Republic'; 
SELECT Code FROM country WHERE Code NOT IN ( SELECT CountryCode FROM countrylanguage WHERE Language = 'English' ) AND GovernmentForm != 'Republic'
SELECT c.Name  FROM city c  JOIN country co ON c.CountryCode = co.Code  JOIN countrylanguage cl ON co.Code = cl.CountryCode  WHERE co.Continent = 'Europe' AND cl.Language = 'English' AND cl.IsOfficial = 'F'; 
SELECT c.Name FROM city c JOIN country co ON c.CountryCode = co.Code WHERE co.Region = 'Europe' AND NOT EXISTS (     SELECT 1     FROM countrylanguage cl     WHERE cl.CountryCode = co.Code     AND cl.Language = 'English'     AND cl.IsOfficial = 'T' ) 
SELECT DISTINCT T1.Name FROM city AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code JOIN countrylanguage AS T3 ON T2.Code = T3.CountryCode WHERE T2.Continent = 'Asia' AND T3.Language = 'Chinese' AND T3.IsOfficial = 'T'; 
SELECT DISTINCT T1.Name FROM city AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code INNER JOIN countrylanguage AS T3 ON T2.Code = T3.CountryCode WHERE T2.Continent = 'Asia' AND T3.Language = 'Chinese' AND T3.IsOfficial = 'T'
SELECT Name, IndepYear, SurfaceArea FROM country ORDER BY Population ASC LIMIT 1; 
SELECT c.Name, c.IndepYear, c.SurfaceArea FROM country AS c ORDER BY c.Population ASC LIMIT 1; 
SELECT T2.Population, T2.Name, T2.HeadOfState FROM country AS T1 INNER JOIN city AS T2 ON T1.Code = T2.CountryCode ORDER BY T1.SurfaceArea DESC LIMIT 1
SELECT Name, Population, HeadOfState FROM country ORDER BY SurfaceArea DESC LIMIT 1; 
SELECT T1.Name, COUNT(T2.Language) AS NumberOfLanguages FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode GROUP BY T1.Name HAVING COUNT(T2.Language) >= 3
SELECT c.Name, COUNT(cl.Language) AS LanguageCount FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode GROUP BY c.Name HAVING LanguageCount > 2; 
SELECT District, COUNT(*) AS NumberOfCities FROM city WHERE Population > (SELECT AVG(Population) FROM city) GROUP BY District; 
SELECT District, COUNT(*) AS CityCount FROM city WHERE Population > (SELECT AVG(Population) FROM city) GROUP BY District; 
SELECT GovernmentForm, SUM(Population) AS TotalPopulation FROM country GROUP BY GovernmentForm HAVING AVG(LifeExpectancy) > 72; 
SELECT T2.GovernmentForm ,  SUM(T1.Population) FROM city AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T2.LifeExpectancy > 72 GROUP BY T2.GovernmentForm
SELECT AVG(T2.LifeExpectancy), SUM(T2.Population), T1.Continent FROM country AS T1 JOIN city AS T2 ON T1.Code = T2.CountryCode GROUP BY T1.Continent HAVING AVG(T2.LifeExpectancy) < 72; 
SELECT continent ,  sum(population) ,  avg(lifeexpectancy) FROM country GROUP BY continent HAVING avg(lifeexpectancy) < 72
SELECT Name, SurfaceArea FROM country ORDER BY SurfaceArea DESC LIMIT 5; 
SELECT Name, SurfaceArea FROM country ORDER BY SurfaceArea DESC LIMIT 5; 
SELECT T2.Name FROM city AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code GROUP BY T1.CountryCode ORDER BY SUM(T1.Population) DESC LIMIT 3 
SELECT T1.Name FROM country AS T1 JOIN city AS T2 ON T1.Code = T2.CountryCode GROUP BY T1.Name ORDER BY SUM(T2.Population) DESC LIMIT 3; 
SELECT Name FROM country ORDER BY Population ASC LIMIT 3; 
SELECT T2.Name  FROM city AS T1  JOIN country AS T2 ON T1.CountryCode = T2.Code  GROUP BY T2.Name  ORDER BY COUNT(T1.Population) ASC  LIMIT 3; 
SELECT COUNT(Code) FROM country WHERE Continent = 'Asia'; 
Query Dimensions: - Country  Filter Conditions: - Continent = 'Asia'  Aggregation Functions: - COUNT(Country)
SELECT Name FROM country WHERE Continent = 'Europe' AND Population = 80000; 
SELECT Name FROM country WHERE Continent = 'Europe' AND Population = 80000; 
SELECT SUM(Total_Population), AVG(Surface_Area)  FROM ( 	SELECT SUM(Population) AS Total_Population, SurfaceArea AS Surface_Area  	FROM country  	WHERE Continent = 'North America' AND SurfaceArea > 3000 ); 
SELECT SUM(Total.Population), AVG(Total.SurfaceArea) FROM ( SELECT c.Name AS Country, c.SurfaceArea, SUM(ci.Population) AS Population FROM country c JOIN city ci ON c.Code = ci.CountryCode WHERE c.Region = 'North America' AND c.SurfaceArea > 3000 GROUP BY c.Name ) Total; 
SELECT Name FROM city WHERE Population BETWEEN 160000 AND 900000; 
SELECT Name FROM city WHERE Population BETWEEN 160000 AND 900000; 
SELECT Language FROM countrylanguage GROUP BY Language ORDER BY COUNT(CountryCode) DESC LIMIT 1; 
SELECT Language FROM countrylanguage GROUP BY Language ORDER BY COUNT(Language) DESC LIMIT 1; 
SELECT T1.Name AS Country, T2.Language, MAX(T2.Percentage) AS Largest_Percentage FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode GROUP BY T1.Name ORDER BY T2.Language;
SELECT T1.Code, T2.Language FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Percentage = ( SELECT MAX(Percentage) FROM countrylanguage WHERE CountryCode = T1.Code ) GROUP BY T1.Code;
SELECT COUNT(DISTINCT Country) FROM countrylanguage WHERE Language = 'Spanish' ORDER BY Percentage DESC LIMIT 1; 
SELECT COUNT(*) AS NumberOfCountries FROM countrylanguage WHERE Language = 'Spanish' AND Percentage > 50; 
SELECT CountryCode FROM countrylanguage WHERE Language = 'Spanish' GROUP BY CountryCode ORDER BY SUM(Percentage) DESC; 
SELECT CountryCode FROM countrylanguage WHERE Language = 'Spanish' AND Percentage >= 50; 
SELECT COUNT(*) AS Number_of_Conductors FROM conductor; 
SELECT COUNT(*) FROM conductor
SELECT Name FROM conductor ORDER BY Age ASC
SELECT Name FROM conductor ORDER BY Age
SELECT Name FROM conductor WHERE Nationality != 'USA'; 
SELECT Name FROM conductor WHERE Nationality != 'USA'
SELECT Record_Company FROM orchestra ORDER BY Year_of_Founded DESC;
SELECT Record_Company FROM orchestra ORDER BY Year_of_Founded DESC
SELECT AVG(Attendance) AS Average_Attendance FROM show; 
SELECT AVG(Attendance) AS Average_Attendance FROM show; 
SELECT MAX(Share), MIN(Share) FROM performance WHERE Type != 'Live final'
SELECT MAX(Share), MIN(Share) FROM performance WHERE Type != 'Live final'; 
SELECT COUNT(DISTINCT Nationality) FROM conductor
SELECT COUNT(DISTINCT Nationality) FROM conductor
SELECT Name FROM conductor ORDER BY Year_of_Work DESC; 
SELECT Name FROM conductor ORDER BY Year_of_Work DESC
SELECT c.Name FROM conductor c ORDER BY c.Year_of_Work DESC LIMIT 1; 
SELECT T1.Name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID GROUP BY T1.Name ORDER BY SUM(T2.Year_of_Founded - T1.Year_of_Work) DESC LIMIT 1
SELECT c.Name, o.Orchestra FROM conductor c JOIN orchestra o ON c.Conductor_ID = o.Conductor_ID; 
SELECT conductor.Name, orchestra.Orchestra FROM conductor JOIN orchestra ON conductor.Conductor_ID = orchestra.Conductor_ID
SELECT T1.Name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID GROUP BY T1.Name HAVING COUNT(T2.Orchestra_ID) > 1
SELECT c.Name FROM conductor c JOIN orchestra o ON c.Conductor_ID = o.Conductor_ID GROUP BY c.Name HAVING COUNT(o.Orchestra) > 1
SELECT c.Name FROM conductor c JOIN orchestra o ON c.Conductor_ID = o.Conductor_ID GROUP BY c.Name ORDER BY COUNT(o.Orchestra_ID) DESC LIMIT 1; 
SELECT c.Name FROM conductor c JOIN orchestra o ON c.Conductor_ID = o.Conductor_ID GROUP BY c.Name ORDER BY COUNT(o.Orchestra_ID) DESC LIMIT 1; 
SELECT T2.Name FROM orchestra AS T1 INNER JOIN conductor AS T2 ON T1.Conductor_ID = T2.Conductor_ID WHERE T1.Year_of_Founded > 2008
SELECT c.Name FROM conductor c JOIN orchestra o ON c.Conductor_ID = o.Conductor_ID WHERE o.Year_of_Founded > 2008; 
SELECT Record_Company, COUNT(*) AS Number_of_Orchestras FROM orchestra GROUP BY Record_Company; 
SELECT Record_Company, COUNT(Orchestra) AS Number_of_Orchestras FROM orchestra GROUP BY Record_Company; 
SELECT Major_Record_Format FROM orchestra GROUP BY Major_Record_Format ORDER BY COUNT(*) ASC; 
SELECT Major_Record_Format, COUNT(*) AS Frequency FROM orchestra GROUP BY Major_Record_Format ORDER BY Frequency DESC; 
SELECT Record_Company  FROM orchestra  GROUP BY Record_Company  ORDER BY COUNT(*) DESC  LIMIT 1; 
SELECT Record_Company FROM orchestra GROUP BY Record_Company ORDER BY COUNT(*) DESC LIMIT 1
SELECT Orchestra FROM orchestra WHERE Orchestra_ID NOT IN (SELECT Orchestra_ID FROM performance) 
SELECT orchestra FROM orchestra WHERE orchestra_id NOT IN (SELECT orchestra_id FROM performance) 
SELECT Record_Company FROM orchestra WHERE Year_of_Founded < 2003 INTERSECT SELECT Record_Company FROM orchestra WHERE Year_of_Founded > 2003; 
SELECT Record_Company FROM orchestra WHERE Year_of_Founded < 2003 INTERSECT SELECT Record_Company FROM orchestra WHERE Year_of_Founded > 2003
SELECT COUNT(*) FROM orchestra WHERE Major_Record_Format IN ('CD', 'DVD'); 
SELECT COUNT(Orchestra) FROM orchestra WHERE Major_Record_Format LIKE '%CD%' OR Major_Record_Format LIKE '%DVD%'
SELECT o.Year_of_Founded FROM orchestra o JOIN performance p ON o.Orchestra_ID = p.Orchestra_ID GROUP BY o.Orchestra_ID, o.Year_of_Founded HAVING COUNT(p.Performance_ID) > 1; 
SELECT T2.Year_of_Founded FROM performance AS T1 INNER JOIN orchestra AS T2 ON T1.Orchestra_ID = T2.Orchestra_ID GROUP BY T2.Year_of_Founded HAVING COUNT(T1.Performance_ID) > 1
SELECT COUNT(*) FROM Highschooler; 
SELECT COUNT(*) FROM Highschooler; 
SELECT name, grade FROM Highschooler; 
SELECT name, grade FROM Highschooler; 
SELECT DISTINCT grade FROM Highschooler; 
SELECT grade FROM Highschooler; 
SELECT grade FROM Highschooler WHERE name = 'Kyle'; 
SELECT grade FROM Highschooler WHERE name = 'Kyle'; 
SELECT name FROM Highschooler WHERE grade = 10; 
SELECT name FROM Highschooler WHERE grade = 10;
SELECT ID FROM Highschooler WHERE name = 'Kyle'; 
SELECT ID FROM Highschooler WHERE name = 'Kyle'; 
SELECT COUNT(*) FROM Highschooler WHERE grade IN (9, 10); 
SELECT COUNT(*) FROM Highschooler WHERE grade IN (9, 10); 
SELECT grade, COUNT(*) AS number_of_high_schoolers FROM Highschooler GROUP BY grade; 
SELECT grade, COUNT(*) AS number_of_high_schoolers FROM Highschooler GROUP BY grade; 
SELECT grade FROM Highschooler GROUP BY grade ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT grade FROM Highschooler GROUP BY grade ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT grade FROM Highschooler GROUP BY grade HAVING COUNT(ID) >= 4; 
Query Dimensions: grades Filter Conditions: count(*) >= 4 Grouping Requirements: by grade
SELECT student_id, COUNT(friend_id) AS number_of_friends FROM Friend GROUP BY student_id; 
SELECT Highschooler.name, COUNT(Friend.friend_id) AS friend_count FROM Highschooler JOIN Friend ON Highschooler.ID = Friend.student_id GROUP BY Highschooler.name; 
SELECT h.name, COUNT(f.friend_id) AS num_friends FROM Highschooler h JOIN Friend f ON h.ID = f.student_id GROUP BY h.name; 
SELECT H.name, COUNT(F.friend_id) AS num_friends FROM Highschooler H JOIN Friend F ON H.ID = F.student_id GROUP BY H.name; 
SELECT H.name FROM Highschooler AS H JOIN Friend AS F ON H.ID = F.student_id GROUP BY H.name ORDER BY COUNT(F.friend_id) DESC LIMIT 1; 
SELECT H.name FROM Highschooler H JOIN (     SELECT student_id, COUNT(friend_id) AS friend_count     FROM Friend     GROUP BY student_id ) F ON H.ID = F.student_id ORDER BY F.friend_count DESC LIMIT 1; 
SELECT T1.name FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id WHERE T1.grade = 9 GROUP BY T1.name HAVING COUNT(*) >= 3 ORDER BY COUNT(*) DESC; 
SELECT H.name FROM Highschooler H JOIN Friend F ON H.ID = F.student_id GROUP BY H.name HAVING COUNT(F.friend_id) >= 3; 
SELECT T2.name FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.friend_id = T2.ID WHERE T1.student_id IN (SELECT ID FROM Highschooler WHERE name = 'Kyle'); 
SELECT H.name FROM Highschooler AS H JOIN Friend AS F ON H.ID = F.friend_id WHERE F.student_id IN (SELECT ID FROM Highschooler WHERE name = 'Kyle') 
SELECT COUNT(*) AS friend_count FROM Friend WHERE student_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle'); 
SELECT COUNT(*) AS friend_count FROM Friend WHERE student_id IN (SELECT ID FROM Highschooler WHERE name = 'Kyle'); 
SELECT id FROM Highschooler WHERE id NOT IN (SELECT student_id FROM Friend) 
SELECT ID FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend) 
SELECT name FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend) 
SELECT name FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend) 
SELECT h.ID FROM Highschooler h JOIN Friend f ON h.ID = f.student_id JOIN Likes l ON h.ID = l.liked_id; 
SELECT student_id FROM Friend INTERSECT SELECT student_id FROM Likes; 
SELECT H.name FROM Highschooler AS H WHERE H.ID IN (SELECT F.student_id FROM Friend AS F) AND H.ID IN (SELECT L.student_id FROM Likes AS L); 
SELECT H.name FROM Highschooler AS H WHERE H.ID IN (     SELECT F.student_id     FROM Friend AS F ) AND H.ID IN (     SELECT L.student_id     FROM Likes AS L ); 
SELECT student_id, COUNT(liked_id) AS like_count FROM Likes GROUP BY student_id; 
SELECT student_id, COUNT(liked_id) AS like_count FROM Likes GROUP BY student_id; 
SELECT H.name, COUNT(L.student_id) AS likes_count FROM Highschooler H JOIN Likes L ON H.ID = L.student_id GROUP BY H.name; 
SELECT H.name, COUNT(L.student_id) AS likes_count FROM Highschooler H JOIN Likes L ON H.ID = L.student_id GROUP BY H.name; 
SELECT H.name, COUNT(L.student_id) AS num_likes FROM Highschooler H JOIN Likes L ON H.ID = L.liked_id GROUP BY H.name ORDER BY num_likes DESC LIMIT 1; 
SELECT H.name, COUNT(L.student_id) AS Likes FROM Highschooler H JOIN Likes L ON H.ID = L.student_id GROUP BY H.name ORDER BY Likes DESC; 
SELECT H.name FROM Highschooler AS H JOIN Likes AS L ON H.ID = L.student_id GROUP BY H.name HAVING COUNT(L.liked_id) >= 2; 
SELECT H.name FROM Highschooler AS H JOIN Likes AS L ON H.ID = L.student_id GROUP BY H.name HAVING COUNT(L.liked_id) >= 2; 
SELECT H.name FROM Highschooler AS H JOIN Friend AS F ON H.ID = F.student_id WHERE H.grade > 5 GROUP BY H.name HAVING COUNT(F.friend_id) >= 2; 
SELECT H.name FROM Highschooler AS H JOIN Friend AS F ON H.ID = F.student_id WHERE H.grade > 5 GROUP BY H.name HAVING COUNT(F.friend_id) >= 2; 
SELECT COUNT(*) FROM Likes WHERE liked_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle'); 
SELECT COUNT(*) FROM Likes WHERE liked_id IN (SELECT ID FROM Highschooler WHERE name = 'Kyle'); 
SELECT AVG(H.grade) AS AverageGrade FROM Highschooler H JOIN Friend F ON H.ID = F.student_id; 
SELECT AVG(H.grade) AS average_grade FROM Highschooler H JOIN Friend F ON H.ID = F.student_id; 
SELECT MIN(T1.grade) AS min_grade FROM Highschooler AS T1 WHERE T1.ID NOT IN (SELECT student_id FROM Friend) 
SELECT MIN(grade) AS min_grade FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend) 
SELECT state FROM Owners INTERSECT SELECT state FROM Professionals; 
SELECT DISTINCT state FROM Owners INTERSECT SELECT DISTINCT state FROM Professionals; 
SELECT AVG(age) AS average_age FROM Dogs WHERE dog_id IN (SELECT dog_id FROM Treatments); 
SELECT AVG(d.age) AS average_age FROM Dogs d JOIN Treatments t ON d.dog_id = t.dog_id; 
SELECT DISTINCT p.professional_id, p.last_name, p.cell_number FROM Professionals p JOIN Treatments t ON p.professional_id = t.professional_id WHERE p.state = 'Indiana' OR (p.state != 'Indiana' AND t.treatment_id IN ( SELECT treatment_id FROM Treatments GROUP BY professional_id HAVING COUNT(professional_id) > 2 ))
SELECT p.professional_id, p.last_name, p.cell_number FROM Professionals p WHERE p.state = 'Indiana' OR (     SELECT COUNT(*)     FROM Treatments t     WHERE t.professional_id = p.professional_id ) > 2; 
SELECT D.name FROM Dogs D JOIN Treatments T ON D.dog_id = T.dog_id GROUP BY D.dog_id, D.name HAVING SUM(T.cost_of_treatment) <= 1000; 
SELECT D.name FROM Dogs AS D JOIN Treatments AS T ON D.dog_id = T.dog_id GROUP BY D.dog_id HAVING SUM(T.cost_of_treatment) <= 1000; 
SELECT DISTINCT first_name FROM Owners UNION SELECT DISTINCT first_name FROM Professionals EXCEPT SELECT DISTINCT name FROM Dogs; 
SELECT first_name FROM Owners UNION SELECT first_name FROM Professionals EXCEPT SELECT name FROM Dogs
SELECT professional_id, role_code, email_address FROM Professionals WHERE professional_id NOT IN (     SELECT professional_id     FROM Treatments ); 
SELECT professional_id, role_code, email_address  FROM Professionals  WHERE professional_id NOT IN (SELECT professional_id FROM Treatments); 
SELECT o.owner_id, o.first_name, o.last_name, COUNT(d.dog_id) AS dog_count FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id GROUP BY o.owner_id, o.first_name, o.last_name ORDER BY dog_count DESC LIMIT 1; 
SELECT owner_id, first_name, last_name FROM Owners JOIN Dogs ON Owners.owner_id = Dogs.owner_id GROUP BY owner_id, first_name, last_name ORDER BY COUNT(dog_id) DESC LIMIT 1; 
SELECT p.professional_id, p.role_code, p.first_name FROM Professionals p JOIN Treatments t ON p.professional_id = t.professional_id GROUP BY p.professional_id, p.role_code, p.first_name HAVING COUNT(t.treatment_id) >= 2; 
 SELECT p.professional_id, p.role, p.first_name FROM Professionals p JOIN Treatments t ON p.professional_id = t.professional_id GROUP BY p.professional_id, p.role, p.first_name HAVING COUNT(t.treatment_id) >= 2; 
SELECT breed_name  FROM Breeds  JOIN Dogs ON Breeds.breed_code = Dogs.breed_code  GROUP BY breed_name  ORDER BY COUNT(dog_id) DESC  LIMIT 1; 
SELECT b.breed_name FROM Breeds b JOIN Dogs d ON b.breed_code = d.breed_code GROUP BY b.breed_name ORDER BY COUNT(d.dog_id) DESC LIMIT 1; 
SELECT o.owner_id, o.last_name FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id JOIN Treatments t ON d.dog_id = t.dog_id GROUP BY o.owner_id, o.last_name ORDER BY COUNT(t.treatment_id) DESC LIMIT 1; 
SELECT o.owner_id, o.last_name, SUM(t.cost_of_treatment) AS total_spent FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id JOIN Treatments t ON d.dog_id = t.dog_id GROUP BY o.owner_id, o.last_name ORDER BY total_spent DESC LIMIT 1; 
SELECT tt.treatment_type_description, MIN(SUM(t.cost_of_treatment)) AS min_total_cost FROM Treatments t JOIN Treatment_Types tt ON t.treatment_type_code = tt.treatment_type_code GROUP BY tt.treatment_type_description ORDER BY min_total_cost ASC; 
SELECT tt.treatment_type_description, SUM(t.cost_of_treatment) AS total_cost FROM Treatments t JOIN Treatment_Types tt ON t.treatment_type_code = tt.treatment_type_code GROUP BY tt.treatment_type_code ORDER BY total_cost ASC LIMIT 1; 
SELECT o.owner_id, o.zip_code, SUM(t.cost_of_treatment) AS total_paid FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id JOIN Treatments t ON d.dog_id = t.dog_id GROUP BY o.owner_id, o.zip_code ORDER BY total_paid DESC LIMIT 1; 
SELECT o.owner_id, o.zip_code, SUM(t.cost_of_treatment) AS total_spent FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id JOIN Treatments t ON d.dog_id = t.dog_id GROUP BY o.owner_id, o.zip_code ORDER BY total_spent DESC LIMIT 1; 
SELECT p.professional_id, p.cell_number FROM Professionals p JOIN Treatments t ON p.professional_id = t.professional_id GROUP BY p.professional_id HAVING COUNT(DISTINCT t.treatment_type_code) >= 2
SELECT p.professional_id, p.cell_number FROM Professionals p JOIN Treatments t ON p.professional_id = t.professional_id GROUP BY p.professional_id, p.cell_number HAVING COUNT(DISTINCT t.treatment_type_code) >= 2; 
SELECT p.first_name, p.last_name FROM Professionals p JOIN Treatments t ON p.professional_id = t.professional_id WHERE t.cost_of_treatment < (SELECT AVG(cost_of_treatment) FROM Treatments); 
SELECT p.first_name, p.last_name FROM Professionals p JOIN Treatments t ON p.professional_id = t.professional_id WHERE t.cost_of_treatment < (SELECT AVG(cost_of_treatment) FROM Treatments); 
SELECT T1.date_of_treatment, T2.first_name FROM Treatments AS T1 INNER JOIN Professionals AS T2 ON T1.professional_id = T2.professional_id
SELECT T1.date_of_treatment, P.first_name FROM Treatments AS T1 INNER JOIN Professionals AS P ON T1.professional_id = P.professional_id; 
SELECT T1.cost_of_treatment, T3.treatment_type_description FROM Treatments AS T1 INNER JOIN Treatment_Types AS T3 ON T1.treatment_type_code = T3.treatment_type_code; 
SELECT t.cost_of_treatment, tt.treatment_type_description FROM Treatments t JOIN Treatment_Types tt ON t.treatment_type_code = tt.treatment_type_code; 
SELECT O.first_name, O.last_name, S.size_description FROM Owners AS O JOIN Dogs AS D ON O.owner_id = D.owner_id JOIN Sizes AS S ON D.size_code = S.size_code
SELECT o.first_name, o.last_name, s.size_description FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id JOIN Sizes s ON d.size_code = s.size_code; 
SELECT o.first_name, d.name FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id
SELECT O.first_name, D.name FROM Owners O JOIN Dogs D ON O.owner_id = D.owner_id; 
SELECT D.name, T.date_of_treatment FROM Dogs D JOIN Treatments T ON D.dog_id = T.dog_id WHERE D.breed_code = (     SELECT breed_code     FROM Dogs     GROUP BY breed_code     ORDER BY COUNT(*) ASC     LIMIT 1 ) ORDER BY T.date_of_treatment; 
SELECT d.name, t.date_of_treatment, b.breed_name FROM Dogs d JOIN Treatments t ON d.dog_id = t.dog_id JOIN Breeds b ON d.breed_code = b.breed_code GROUP BY d.breed_code ORDER BY COUNT(d.breed_code) ASC; 
SELECT O.first_name, D.name FROM Owners O JOIN Dogs D ON O.owner_id = D.owner_id WHERE O.state = 'Virginia'; 
SELECT DISTINCT o.first_name, d.name FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id WHERE o.state = 'Virginia'
SELECT date_arrived, date_departed FROM Dogs WHERE dog_id IN (SELECT dog_id FROM Treatments);
SELECT D.date_arrived, D.date_departed FROM Dogs D JOIN Treatments T ON D.dog_id = T.dog_id; 
SELECT o.last_name FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id ORDER BY d.age ASC LIMIT 1; 
SELECT o.last_name FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id ORDER BY d.age ASC LIMIT 1; 
SELECT email_address FROM Professionals WHERE state = 'Hawaii' OR state = 'Wisconsin';
SELECT email_address FROM Professionals WHERE state = 'Hawaii' OR state = 'Wisconsin'; 
SELECT date_arrived, date_departed FROM Dogs;
SELECT date_arrived, date_departed FROM Dogs; 
SELECT COUNT(dog_id) AS number_of_dogs_with_treatments FROM Treatments; 
SELECT COUNT(*) AS NumberOfDogsThatReceivedTreatment FROM Treatments; 
SELECT COUNT(DISTINCT professional_id) AS number_of_professionals FROM Treatments; 
SELECT COUNT(DISTINCT professional_id) AS number_of_professionals FROM Treatments; 
SELECT role_code, street, city, state FROM Professionals WHERE city LIKE '%West%'
SELECT role_code, street, city, state FROM Professionals WHERE city LIKE '%West%'
SELECT o.first_name, o.last_name, o.email_address FROM Owners o WHERE o.state LIKE '%North%'; 
SELECT first_name, last_name, email FROM Owners WHERE state LIKE '%North%'; 
SELECT COUNT(*) FROM Dogs WHERE age < (SELECT AVG(age) FROM Dogs); 
SELECT COUNT(*) FROM Dogs WHERE age < (SELECT AVG(age) FROM Dogs); 
SELECT MAX(cost_of_treatment) AS most_recent_treatment_cost FROM Treatments ORDER BY date_of_treatment DESC LIMIT 1; 
SELECT cost_of_treatment FROM Treatments ORDER BY date_of_treatment DESC LIMIT 1; 
SELECT COUNT(*) FROM Dogs WHERE dog_id NOT IN (SELECT dog_id FROM Treatments); 
SELECT COUNT(*) AS NumberOfDogsNotReceivedAnyTreatment FROM Dogs WHERE dog_id NOT IN (SELECT dog_id FROM Treatments); 
SELECT COUNT(owner_id) AS number_of_owners_without_dogs FROM Dogs WHERE abandoned_yn = '1'; 
SELECT COUNT(owner_id) AS number_of_owners_without_dogs FROM Owners WHERE owner_id NOT IN (SELECT owner_id FROM Dogs WHERE date_departed IS NULL); 
SELECT COUNT(professional_id) AS number_of_professionals_without_treatments FROM Professionals WHERE professional_id NOT IN (     SELECT professional_id FROM Treatments ); 
SELECT COUNT(professional_id) FROM Professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments);
SELECT name, age, weight FROM Dogs WHERE abandoned_yn = '1'; 
SELECT name, age, weight FROM Dogs WHERE abandoned_yn = '1'; 
SELECT AVG(age) AS average_age FROM Dogs; 
SELECT AVG(age) AS average_age FROM Dogs; 
Query Dimensions: Age, Dog Filter Conditions: None Aggregation Functions: MAX Grouping Requirements: By Dog Sorting Requirements: By Age in descending order
SELECT MAX(age) AS oldest_dog_age FROM Dogs;
SELECT charge_type, SUM(charge_amount) AS total_amount FROM Charges GROUP BY charge_type; 
SELECT charge_type, SUM(charge_amount) AS total_amount FROM Charges GROUP BY charge_type; 
SELECT MAX(charge_amount) AS max_charge_amount FROM Charges; 
SELECT MAX(charge_amount) AS max_charge_amount FROM Charges; 
SELECT email_address, cell_number, home_phone FROM Professionals; 
SELECT email_address, cell_number, home_phone FROM Professionals;
SELECT DISTINCT breed_name, size_description FROM Breeds JOIN Sizes ON Breeds.size_code = Sizes.size_code
SELECT DISTINCT breed_type, size_type FROM Dogs AS d JOIN Breeds AS b ON d.breed_code = b.breed_code JOIN Sizes AS s ON d.size_code = s.size_code
SELECT p.first_name, tt.treatment_type_description FROM Professionals p JOIN Treatments t ON p.professional_id = t.professional_id JOIN Treatment_Types tt ON t.treatment_type_code = tt.treatment_type_code; 
SELECT P.first_name, TT.treatment_type_description FROM Professionals AS P JOIN Treatments AS T ON P.professional_id = T.professional_id JOIN Treatment_Types AS TT ON T.treatment_type_code = TT.treatment_type_code
SELECT COUNT(*) FROM singer; 
SELECT COUNT(*) AS Count_of_Singers FROM singer; 
SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC; 
SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC
SELECT Birth_Year, Citizenship FROM singer;
SELECT Birth_Year, Citizenship FROM singer
SELECT Name FROM singer WHERE Citizenship != 'France'; 
SELECT Name FROM singer WHERE Citizenship != 'France'; 
SELECT Name FROM singer WHERE Birth_Year IN (1948, 1949); 
SELECT Name FROM singer WHERE Birth_Year = 1948 OR Birth_Year = 1949;
SELECT Name FROM singer ORDER BY Net_Worth_Millions DESC LIMIT 1
SELECT Name FROM singer ORDER BY Net_Worth_Millions DESC LIMIT 1; 
SELECT Citizenship ,  COUNT(*) FROM singer GROUP BY Citizenship
SELECT Citizenship, COUNT(*) AS NumberOfSingers FROM singer GROUP BY Citizenship; 
SELECT Citizenship FROM singer GROUP BY Citizenship ORDER BY COUNT(*) DESC LIMIT 1
Query Dimensions: Citizenship Filter Conditions: None Aggregation Functions: COUNT() Grouping Requirements: BY Citizenship Sorting Requirements: ORDER BY COUNT(Citizenship) DESC LIMIT 1
SELECT Citizenship, MAX(Net_Worth_Millions) AS Max_Net_Worth FROM singer GROUP BY Citizenship; 
SELECT Citizenship, MAX(Net_Worth_Millions) AS Max_Net_Worth FROM singer GROUP BY Citizenship; 
SELECT T2.Title, T1.Name FROM singer AS T1 INNER JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID
SELECT T2.Title, T1.Name FROM singer AS T1 INNER JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID
SELECT DISTINCT s.Name FROM singer s JOIN song sg ON s.Singer_ID = sg.Singer_ID WHERE sg.Sales > 300000; 
SELECT DISTINCT s.Name FROM singer AS s JOIN song AS so ON s.Singer_ID = so.Singer_ID WHERE so.Sales > 300000
SELECT T1.Name FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID GROUP BY T1.Name HAVING COUNT(T2.Song_ID) > 1
SELECT s.Name FROM singer s JOIN song sg ON s.Singer_ID = sg.Singer_ID GROUP BY s.Name HAVING COUNT(sg.Song_ID) > 1; 
SELECT s.Name, SUM(so.Sales) AS Total_Sales FROM singer s JOIN song so ON s.Singer_ID = so.Singer_ID GROUP BY s.Name; 
SELECT s.Name, SUM(so.Sales) AS Total_Sales FROM singer s JOIN song so ON s.Singer_ID = so.Singer_ID GROUP BY s.Name
SELECT Name FROM singer WHERE Singer_ID NOT IN (SELECT Singer_ID FROM song); 
SELECT Name FROM singer WHERE Singer_ID NOT IN (SELECT Singer_ID FROM song) 
SELECT Citizenship FROM singer WHERE Birth_Year < 1945 AND Citizenship IN (     SELECT Citizenship     FROM singer     WHERE Birth_Year > 1955 ) GROUP BY Citizenship; 
SELECT Citizenship FROM singer WHERE Birth_Year < 1945 INTERSECT SELECT Citizenship FROM singer WHERE Birth_Year > 1955; 
SELECT COUNT(*) AS TotalAvailableFeatures FROM Other_Available_Features; 
SELECT Ref_Feature_Types.feature_type_name FROM Ref_Feature_Types JOIN Other_Available_Features ON Ref_Feature_Types.feature_type_code = Other_Available_Features.feature_type_code WHERE Other_Available_Features.feature_name = 'AirCon'; 
SELECT pt.property_type_description FROM Ref_Property_Types pt JOIN Properties p ON pt.property_type_code = p.property_type_code; 
SELECT property_name  FROM Properties  WHERE (property_type_code = 'House' OR property_type_code = 'Apartment') AND room_count > 1; 
