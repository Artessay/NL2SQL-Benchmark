SELECT COUNT(*) FROM `singer`
SELECT COUNT(*) FROM singer
SELECT Name, Country, Age FROM singer ORDER BY Age DESC
SELECT Name, Country, Age FROM singer ORDER BY Age DESC
SELECT AVG(Age) AS Average_Age, MIN(Age) AS Minimum_Age, MAX(Age) AS Maximum_Age FROM singer WHERE Country = 'France'
SELECT AVG(Age), MIN(Age), MAX(Age) FROM singer WHERE Country = 'France'
SELECT Name, Song_release_year FROM singer WHERE Age = (SELECT MIN(Age) FROM singer)
SELECT Name, Song_Name, Song_release_year FROM singer WHERE Age = (SELECT MIN(Age) FROM singer)
SELECT DISTINCT Country FROM singer WHERE Age > 20
SELECT DISTINCT Country FROM singer WHERE Age > 20
SELECT Country, COUNT(*) FROM singer GROUP BY Country
SELECT Country, COUNT(*) FROM singer GROUP BY Country
SELECT T1.Song_Name FROM singer AS T1 JOIN (SELECT AVG(Age) AS avg_age FROM singer) AS T2 WHERE T1.Age > T2.avg_age
SELECT T1.Song_Name FROM singer AS T1 JOIN (SELECT AVG(Age) AS avg_age FROM singer) AS T2 WHERE T1.Age > T2.avg_age
SELECT Location, Name FROM stadium WHERE Capacity BETWEEN 5000 AND 10000
SELECT Location, Name FROM stadium WHERE Capacity BETWEEN 5000 AND 10000
SELECT MAX(Capacity), AVG(Capacity) FROM stadium
SELECT AVG(Capacity) AS Average_Capacity, MAX(Capacity) AS Maximum_Capacity FROM stadium
SELECT Name, Capacity FROM stadium WHERE Average = (SELECT MAX(Average) FROM stadium)
SELECT Name, Capacity FROM stadium WHERE Average = (SELECT MAX(Average) FROM stadium)
SELECT COUNT(*) FROM concert WHERE Year IN ('2014', '2015')
SELECT COUNT(*) FROM concert WHERE Year IN ('2014', '2015')
SELECT s.Name, COUNT(c.concert_ID)  FROM stadium s  JOIN concert c ON s.Stadium_ID = c.Stadium_ID  GROUP BY s.Name;
SELECT s.Name, COUNT(c.concert_ID)  FROM stadium s  JOIN concert c ON s.Stadium_ID = c.Stadium_ID  GROUP BY s.Stadium_ID, s.Name
SELECT s.Name, s.Capacity  FROM stadium s  JOIN concert c ON s.Stadium_ID = c.Stadium_ID  WHERE c.Year >= '2014'  GROUP BY s.Stadium_ID  ORDER BY COUNT(c.concert_ID) DESC  LIMIT 1;
SELECT s.Name, s.Capacity  FROM stadium s  JOIN concert c ON s.Stadium_ID = c.Stadium_ID  WHERE c.Year > '2013'  GROUP BY s.Stadium_ID  ORDER BY COUNT(c.concert_ID) DESC  LIMIT 1;
SELECT Year, COUNT(*) AS num_concerts FROM concert GROUP BY Year ORDER BY num_concerts DESC LIMIT 1
SELECT Year FROM concert GROUP BY Year ORDER BY COUNT(*) DESC LIMIT 1
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert)
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert)
SELECT Country FROM singer WHERE Age > 40 INTERSECT SELECT Country FROM singer WHERE Age < 30
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert WHERE Year = '2014')
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert WHERE Year = '2014')
SELECT c.concert_Name, c.Theme, COUNT(sic.Singer_ID) AS Number_of_Singers FROM concert c LEFT JOIN singer_in_concert sic ON c.concert_ID = sic.concert_ID GROUP BY c.concert_ID, c.concert_Name, c.Theme
SELECT c.concert_Name, c.Theme, COUNT(sic.Singer_ID) AS Number_of_Singers FROM concert c JOIN singer_in_concert sic ON c.concert_ID = sic.concert_ID GROUP BY c.concert_ID, c.concert_Name, c.Theme
SELECT s.Name, COUNT(sc.concert_ID) AS Number_of_Concerts FROM singer s JOIN singer_in_concert sc ON s.Singer_ID = sc.Singer_ID GROUP BY s.Name;
SELECT s.Name, COUNT(sc.concert_ID) AS Number_of_Concerts FROM singer s JOIN singer_in_concert sc ON s.Singer_ID = sc.Singer_ID GROUP BY s.Name;
SELECT s.Name  FROM singer s  JOIN singer_in_concert sic ON s.Singer_ID = sic.Singer_ID  JOIN concert c ON sic.concert_ID = c.concert_ID  WHERE c.Year = '2014'
SELECT T1.Name FROM singer AS T1 JOIN singer_in_concert AS T2 ON T1.Singer_ID = T2.Singer_ID JOIN concert AS T3 ON T2.concert_ID = T3.concert_ID WHERE T3.Year = '2014'
SELECT Name, Country FROM singer WHERE Song_Name LIKE '%Hey%'
SELECT Name, Country FROM singer WHERE Song_Name LIKE '%Hey%'
SELECT s.Name, s.Location  FROM stadium s  JOIN concert c ON s.Stadium_ID = c.Stadium_ID  WHERE c.Year IN ('2014', '2015')  GROUP BY s.Stadium_ID  HAVING COUNT(DISTINCT c.Year) = 2;
SELECT s.Name, s.Location  FROM stadium s  JOIN concert c ON s.Stadium_ID = c.Stadium_ID  WHERE c.Year IN ('2014', '2015')  GROUP BY s.Stadium_ID  HAVING COUNT(DISTINCT c.Year) = 2;
SELECT COUNT(*) FROM concert WHERE Stadium_ID = (SELECT Stadium_ID FROM stadium ORDER BY Capacity DESC LIMIT 1)
SELECT COUNT(*) FROM concert WHERE Stadium_ID = (SELECT Stadium_ID FROM stadium ORDER BY Capacity DESC LIMIT 1)
SELECT COUNT(*) FROM `Pets` WHERE `weight` > 10;
SELECT COUNT(*) FROM Pets WHERE weight > 10
SELECT weight FROM Pets WHERE pet_age = (SELECT MIN(pet_age) FROM Pets WHERE PetType = 'dog') AND PetType = 'dog'
SELECT weight FROM Pets WHERE pet_age = (SELECT MIN(pet_age) FROM Pets WHERE PetType = 'dog') AND PetType = 'dog'
SELECT PetType, MAX(weight) FROM Pets GROUP BY PetType
SELECT PetType, MAX(weight) AS MaxWeight FROM Pets GROUP BY PetType
SELECT COUNT(PetID) FROM Has_Pet WHERE StuID IN (SELECT StuID FROM Student WHERE Age > 20)
SELECT COUNT(DISTINCT PetID) FROM Has_Pet WHERE StuID IN (SELECT StuID FROM Student WHERE Age > 20)
SELECT COUNT(PetID)  FROM Has_Pet  JOIN Student ON Has_Pet.StuID = Student.StuID  JOIN Pets ON Has_Pet.PetID = Pets.PetID  WHERE Student.Sex = 'F' AND Pets.PetType = 'dog'
SELECT COUNT(Pets.PetID)  FROM Pets  JOIN Has_Pet ON Pets.PetID = Has_Pet.PetID  JOIN Student ON Has_Pet.StuID = Student.StuID  WHERE Pets.PetType = 'dog' AND Student.Sex = 'F'
SELECT COUNT(DISTINCT PetType) FROM Pets
SELECT COUNT(DISTINCT PetType) FROM Pets
SELECT DISTINCT s.Fname  FROM Student s  JOIN Has_Pet hp ON s.StuID = hp.StuID  JOIN Pets p ON hp.PetID = p.PetID  WHERE p.PetType IN ('cat', 'dog')
SELECT DISTINCT s.Fname  FROM Student s  JOIN Has_Pet hp ON s.StuID = hp.StuID  JOIN Pets p ON hp.PetID = p.PetID  WHERE p.PetType IN ('cat', 'dog')
SELECT DISTINCT s.Fname  FROM Student s  JOIN Has_Pet hp ON s.StuID = hp.StuID  JOIN Pets p ON hp.PetID = p.PetID  WHERE s.StuID IN (     SELECT hp.StuID      FROM Has_Pet hp      JOIN Pets p ON hp.PetID = p.PetID      WHERE p.PetType = 'cat' )  AND s.StuID IN (     SELECT hp.StuID      FROM Has_Pet hp      JOIN Pets p ON hp.PetID = p.PetID      WHERE p.PetType = 'dog' )
SELECT S.Fname  FROM Student S  INNER JOIN Has_Pet HP ON S.StuID = HP.StuID  INNER JOIN Pets P ON HP.PetID = P.PetID  WHERE P.PetType = 'cat'  INTERSECT  SELECT S.Fname  FROM Student S  INNER JOIN Has_Pet HP ON S.StuID = HP.StuID  INNER JOIN Pets P ON HP.PetID = P.PetID  WHERE P.PetType = 'dog'
SELECT Major, Age FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'cat'))
SELECT Major, Age FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'cat'))
SELECT StuID FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'cat'))
SELECT StuID FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'cat'))
SELECT Fname, Age FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'dog')) AND StuID NOT IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'cat'))
SELECT Fname FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'dog')) AND StuID NOT IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'cat'))
SELECT PetType, weight FROM Pets WHERE pet_age = (SELECT MIN(pet_age) FROM Pets)
SELECT PetType, weight FROM Pets WHERE pet_age = (SELECT MIN(pet_age) FROM Pets)
SELECT PetID, weight FROM Pets WHERE pet_age > 1
SELECT PetID, weight FROM Pets WHERE pet_age > 1
SELECT p.PetType, AVG(p.pet_age) AS AverageAge, MAX(p.pet_age) AS MaximumAge FROM Pets p JOIN Has_Pet hp ON p.PetID = hp.PetID GROUP BY p.PetType;
SELECT p.PetType, AVG(p.pet_age) AS AverageAge, MAX(p.pet_age) AS MaximumAge FROM Pets p GROUP BY p.PetType;
SELECT PetType, AVG(weight) AS AvgWeight FROM Pets GROUP BY PetType
SELECT PetType, AVG(weight) FROM Pets GROUP BY PetType
SELECT Fname, Age FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet)
SELECT DISTINCT Fname, Age FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet)
SELECT PetID FROM Has_Pet WHERE StuID = (SELECT StuID FROM Student WHERE LName = 'Smith')
SELECT PetID FROM Has_Pet WHERE StuID = (SELECT StuID FROM Student WHERE LName = 'Smith')
SELECT S.StuID, COUNT(H.PetID) AS NumberOfPets FROM Student S JOIN Has_Pet H ON S.StuID = H.StuID GROUP BY S.StuID
SELECT StuID, COUNT(PetID) FROM Has_Pet GROUP BY StuID
SELECT s.Fname, s.Sex  FROM Student s  JOIN Has_Pet hp ON s.StuID = hp.StuID  GROUP BY s.StuID  HAVING COUNT(hp.PetID) > 1;
SELECT Fname, Sex FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet GROUP BY StuID HAVING COUNT(PetID) > 1)
SELECT s.LName  FROM Student s  JOIN Has_Pet hp ON s.StuID = hp.StuID  JOIN Pets p ON hp.PetID = p.PetID  WHERE p.PetType = 'cat' AND p.pet_age = 3
SELECT s.LName  FROM Student s  JOIN Has_Pet hp ON s.StuID = hp.StuID  JOIN Pets p ON hp.PetID = p.PetID  WHERE p.PetType = 'cat' AND p.pet_age = 3;
SELECT AVG(Age) FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet)
SELECT AVG(Age) FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet)
SELECT COUNT(*) FROM continents
SELECT COUNT(*) FROM continents
SELECT c.ContId, c.Continent, COUNT(cn.CountryId) AS NumberOfCountries FROM continents c JOIN countries cn ON c.ContId = cn.Continent GROUP BY c.ContId, c.Continent
SELECT c.ContId, c.Continent, COUNT(co.CountryId) AS NumberOfCountries FROM continents c JOIN countries co ON c.ContId = co.Continent GROUP BY c.ContId, c.Continent
SELECT COUNT(*) FROM countries
SELECT COUNT(*) FROM countries
SELECT cm.FullName, cm.Id, COUNT(ml.ModelId)  FROM car_makers cm  JOIN model_list ml ON cm.Id = ml.Maker  GROUP BY cm.Id, cm.FullName;
SELECT cm.Id, cm.FullName, COUNT(ml.ModelId) AS NumberOfModels FROM car_makers cm JOIN model_list ml ON cm.Id = ml.Maker GROUP BY cm.Id, cm.FullName
SELECT T1.Model FROM model_list AS T1 JOIN car_makers AS T2 ON T1.Maker = T2.Id JOIN car_names AS T3 ON T1.Model = T3.Model JOIN cars_data AS T4 ON T3.MakeId = T4.Id ORDER BY CAST(T4.Horsepower AS INTEGER) ASC LIMIT 1
SELECT T1.Model FROM model_list AS T1 JOIN car_makers AS T2 ON T1.Maker = T2.Id JOIN car_names AS T3 ON T1.Model = T3.Model JOIN cars_data AS T4 ON T3.MakeId = T4.Id ORDER BY CAST(T4.Horsepower AS INTEGER) ASC LIMIT 1
SELECT T1.Model FROM car_names AS T1 JOIN cars_data AS T2 ON T1.MakeId = T2.Id WHERE T2.Weight < (SELECT AVG(Weight) FROM cars_data)
SELECT T1.Model FROM car_names AS T1 JOIN cars_data AS T2 ON T1.MakeId = T2.Id WHERE T2.Weight < (SELECT AVG(Weight) FROM cars_data)
SELECT DISTINCT cm.Maker FROM car_makers cm JOIN model_list ml ON cm.Id = ml.Maker JOIN car_names cn ON ml.Model = cn.Model JOIN cars_data cd ON cn.MakeId = cd.Id WHERE cd.Year = 1970;
SELECT DISTINCT cm.Maker  FROM car_makers cm  JOIN model_list ml ON cm.Id = ml.Maker  JOIN car_names cn ON ml.Model = cn.Model  JOIN cars_data cd ON cn.MakeId = cd.Id  WHERE cd.Year = 1970;
SELECT T1.Make, T2.Year FROM car_names AS T1 JOIN cars_data AS T2 ON T1.MakeId = T2.Id WHERE T2.Year = (SELECT MIN(Year) FROM cars_data)
SELECT cm.Maker, cd.Year  FROM car_makers cm  JOIN model_list ml ON cm.Id = ml.Maker  JOIN car_names cn ON ml.Model = cn.Model  JOIN cars_data cd ON cn.MakeId = cd.Id  WHERE cd.Year = (SELECT MIN(Year) FROM cars_data)
SELECT DISTINCT cn.Model  FROM car_names cn  JOIN cars_data cd ON cn.MakeId = cd.Id  WHERE cd.Year > 1980;
SELECT DISTINCT cn.Model  FROM car_names cn  JOIN cars_data cd ON cn.MakeId = cd.Id  WHERE cd.Year > 1980;
SELECT c.Continent, COUNT(cm.Id) AS NumberOfMakers FROM continents c JOIN countries co ON c.ContId = co.Continent JOIN car_makers cm ON co.CountryId = cm.Country GROUP BY c.Continent;
SELECT c.Continent, COUNT(cm.Id) AS NumberOfCarMakers FROM continents c JOIN countries co ON c.ContId = co.Continent JOIN car_makers cm ON co.CountryId = cm.Country GROUP BY c.Continent;
SELECT c.CountryName  FROM countries c JOIN car_makers cm ON c.CountryId = cm.Country GROUP BY c.CountryName ORDER BY COUNT(cm.Id) DESC LIMIT 1;
SELECT T1.CountryName FROM countries AS T1 JOIN car_makers AS T2 ON T1.CountryId = T2.Country GROUP BY T1.CountryName ORDER BY COUNT(T2.Id) DESC LIMIT 1
SELECT COUNT(ml.ModelId) AS ModelCount, cm.FullName  FROM model_list ml  JOIN car_makers cm ON ml.Maker = cm.Id  GROUP BY cm.FullName;
SELECT cm.Id, cm.FullName, COUNT(ml.ModelId) AS NumberOfModels FROM car_makers cm JOIN model_list ml ON cm.Id = ml.Maker GROUP BY cm.Id, cm.FullName;
SELECT T1.Accelerate FROM cars_data AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId WHERE T2.Make = 'amc hornet sportabout (sw)'
SELECT T1.Accelerate FROM cars_data AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId WHERE T2.Make = 'amc hornet sportabout (sw)'
SELECT COUNT(*) FROM car_makers WHERE Country IN (SELECT CountryId FROM countries WHERE CountryName = 'france')
SELECT COUNT(DISTINCT cm.Id)  FROM car_makers cm  JOIN countries c ON cm.Country = c.CountryId  WHERE c.CountryName = 'france'
SELECT COUNT(DISTINCT cn.Model)  FROM car_names cn  JOIN model_list ml ON cn.Model = ml.Model  JOIN car_makers cm ON ml.Maker = cm.Id  JOIN countries c ON cm.Country = c.CountryId  WHERE c.CountryName = 'usa';
SELECT COUNT(DISTINCT ml.Model)  FROM car_makers cm  JOIN model_list ml ON cm.Id = ml.Maker  JOIN countries c ON cm.Country = c.CountryId  WHERE c.CountryName = 'usa';
SELECT AVG(CAST(MPG AS REAL)) FROM cars_data WHERE Cylinders = 4
SELECT AVG(CAST(MPG AS REAL)) FROM cars_data WHERE Cylinders = 4
SELECT MIN(Weight) FROM cars_data WHERE Cylinders = 8 AND Year = 1974
SELECT MIN(Weight) FROM cars_data WHERE Cylinders = 8 AND Year = 1974
SELECT cm.Maker, ml.Model  FROM car_makers cm  JOIN model_list ml ON cm.Id = ml.Maker;
SELECT cm.Maker, ml.Model FROM car_makers cm JOIN model_list ml ON cm.Id = ml.Maker
SELECT T1.CountryId, T1.CountryName FROM countries AS T1 JOIN car_makers AS T2 ON T1.CountryId = T2.Country GROUP BY T1.CountryId, T1.CountryName
SELECT T1.CountryId, T1.CountryName FROM countries AS T1 JOIN car_makers AS T2 ON T1.CountryId = T2.Country
SELECT COUNT(*) FROM cars_data WHERE CAST(Horsepower AS INTEGER) > 150
SELECT COUNT(*) FROM `cars_data` WHERE CAST(`Horsepower` AS INTEGER) > 150
SELECT Year, AVG(Weight) AS AverageWeight FROM cars_data GROUP BY Year
SELECT Year, AVG(Weight) AS AverageWeight, Year  FROM cars_data  GROUP BY Year;
SELECT c.CountryName  FROM countries c  JOIN car_makers cm ON c.CountryId = cm.Country  JOIN continents con ON c.Continent = con.ContId  WHERE con.Continent = 'europe'  GROUP BY c.CountryName  HAVING COUNT(cm.Id) >= 3
SELECT c.CountryName  FROM countries c  JOIN car_makers cm ON c.CountryId = cm.Country  JOIN continents con ON c.Continent = con.ContId  WHERE con.Continent = 'europe'  GROUP BY c.CountryName  HAVING COUNT(cm.Id) >= 3
SELECT MAX(cars_data.Horsepower), car_names.Make  FROM cars_data  JOIN car_names ON cars_data.Id = car_names.MakeId  WHERE cars_data.Cylinders = 3  GROUP BY car_names.Make;
SELECT T1.Make, MAX(T2.Horsepower)  FROM car_names AS T1  JOIN cars_data AS T2 ON T1.MakeId = T2.Id  JOIN model_list AS T3 ON T1.Model = T3.Model  WHERE T2.Cylinders = 3  GROUP BY T1.Make  ORDER BY MAX(T2.Horsepower) DESC  LIMIT 1;
SELECT cn.Model, cd.MPG  FROM car_names cn  JOIN cars_data cd ON cn.MakeId = cd.Id  ORDER BY cd.MPG DESC  LIMIT 1;
SELECT T1.Model FROM car_names AS T1 JOIN cars_data AS T2 ON T1.MakeId = T2.Id ORDER BY CAST(T2.MPG AS REAL) DESC LIMIT 1
SELECT AVG(CAST(REPLACE(Horsepower, ',', '') AS REAL)) AS AverageHorsepower FROM cars_data WHERE Year < 1980;
SELECT AVG(CAST(Horsepower AS INTEGER)) FROM cars_data WHERE Year < 1980
SELECT AVG(Edispl) FROM cars_data WHERE Id IN (SELECT MakeId FROM car_names WHERE Model IN (SELECT Model FROM model_list WHERE Maker = (SELECT Id FROM car_makers WHERE Maker = 'volvo')))
SELECT AVG(Edispl) FROM cars_data WHERE Id IN (SELECT MakeId FROM car_names WHERE Model IN (SELECT Model FROM model_list WHERE Maker = (SELECT Id FROM car_makers WHERE Maker = 'volkswagen')))
SELECT Cylinders, MAX(Accelerate) FROM cars_data GROUP BY Cylinders
SELECT Cylinders, MAX(Accelerate)  FROM cars_data  GROUP BY Cylinders
SELECT Model, COUNT(DISTINCT Make) AS Versions FROM car_names GROUP BY Model ORDER BY Versions DESC LIMIT 1
SELECT Model, COUNT(DISTINCT Make) AS VersionCount  FROM car_names  GROUP BY Model  ORDER BY VersionCount DESC  LIMIT 1;
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 4
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 4
SELECT COUNT(*) FROM cars_data WHERE Year = 1980
SELECT COUNT(*) FROM cars_data WHERE Year = 1980
SELECT COUNT(DISTINCT T1.Model) FROM model_list AS T1 JOIN car_makers AS T2 ON T1.Maker = T2.Id WHERE T2.FullName = 'American Motor Company'
SELECT COUNT(*) FROM model_list WHERE Maker = (SELECT Id FROM car_makers WHERE Maker = 'amc')
SELECT cm.Id, cm.FullName  FROM car_makers cm  JOIN model_list ml ON cm.Id = ml.Maker  GROUP BY cm.Id, cm.FullName  HAVING COUNT(ml.ModelId) > 3;
SELECT cm.Id, cm.Maker  FROM car_makers cm  JOIN model_list ml ON cm.Id = ml.Maker  GROUP BY cm.Id, cm.Maker  HAVING COUNT(ml.ModelId) > 3
SELECT DISTINCT ml.Model  FROM model_list ml  JOIN car_makers cm ON ml.Maker = cm.Id  JOIN car_names cn ON ml.Model = cn.Model  JOIN cars_data cd ON cn.MakeId = cd.Id  WHERE cm.FullName = 'General Motors' OR cd.Weight > 3500;
SELECT DISTINCT cn.Model  FROM car_names cn  JOIN model_list ml ON cn.Model = ml.Model  JOIN car_makers cm ON ml.Maker = cm.Id  LEFT JOIN cars_data cd ON cn.MakeId = cd.Id  WHERE cm.FullName = 'General Motors' OR cd.Weight > 3500;
SELECT DISTINCT Year FROM cars_data WHERE Weight BETWEEN 3000 AND 4000
SELECT DISTINCT Year FROM cars_data WHERE Weight < 4000 INTERSECT SELECT DISTINCT Year FROM cars_data WHERE Weight > 3000
SELECT Horsepower FROM cars_data WHERE Accelerate = (SELECT MAX(Accelerate) FROM cars_data)
SELECT Horsepower FROM cars_data WHERE Accelerate = (SELECT MAX(Accelerate) FROM cars_data)
SELECT MIN(T3.Cylinders) FROM model_list AS T1 JOIN car_names AS T2 ON T1.Model = T2.Model JOIN cars_data AS T3 ON T2.MakeId = T3.Id WHERE T1.Model = 'volvo' AND T3.Accelerate = (SELECT MIN(Accelerate) FROM cars_data)
SELECT MIN(cylinders)  FROM cars_data  JOIN car_names ON cars_data.Id = car_names.MakeId  JOIN model_list ON car_names.Model = model_list.Model  JOIN car_makers ON model_list.Maker = car_makers.Id  WHERE car_makers.Maker = 'volkswagen'  GROUP BY car_names.Model  ORDER BY MIN(accelerate)  LIMIT 1;
SELECT COUNT(*)  FROM cars_data  WHERE Accelerate > (     SELECT Accelerate      FROM cars_data      WHERE Horsepower = (         SELECT MAX(Horsepower)          FROM cars_data     ) )
SELECT COUNT(*) FROM `cars_data` WHERE `Accelerate` > (SELECT `Accelerate` FROM `cars_data` WHERE `Horsepower` = (SELECT MAX(`Horsepower`) FROM `cars_data`))
SELECT COUNT(DISTINCT cm.Country)  FROM car_makers cm GROUP BY cm.Country HAVING COUNT(cm.Id) > 2;
SELECT COUNT(DISTINCT Country)  FROM car_makers  GROUP BY Country  HAVING COUNT(Maker) > 2;
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 6
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 6
SELECT cn.Model, cd.Horsepower FROM car_names cn JOIN cars_data cd ON cn.MakeId = cd.Id JOIN model_list ml ON cn.Model = ml.Model JOIN car_makers cm ON ml.Maker = cm.Id WHERE cd.Cylinders = 4 ORDER BY CAST(cd.Horsepower AS INTEGER) DESC LIMIT 1;
SELECT cn.Model, MAX(cd.Horsepower)  FROM cars_data cd  JOIN car_names cn ON cd.Id = cn.MakeId  JOIN model_list ml ON cn.Model = ml.Model  WHERE cd.Cylinders = 4  GROUP BY cn.Model  ORDER BY MAX(cd.Horsepower) DESC  LIMIT 1;
SELECT T1.MakeId, T1.Make FROM car_names AS T1 JOIN cars_data AS T2 ON T1.MakeId = T2.Id WHERE T2.Cylinders <= 3 AND T2.Horsepower > (SELECT MIN(Horsepower) FROM cars_data)
SELECT T1.MakeId, T1.Model, T1.Make  FROM car_names AS T1  JOIN cars_data AS T2 ON T1.MakeId = T2.Id  WHERE T2.Cylinders < 4 AND T2.Horsepower != (SELECT MIN(Horsepower) FROM cars_data)
SELECT MAX(MPG) FROM cars_data WHERE Cylinders = 8 OR Year < 1980
SELECT MAX(MPG) FROM cars_data WHERE Cylinders = 8 OR Year < 1980
SELECT cn.Model  FROM car_names cn  JOIN cars_data cd ON cn.MakeId = cd.Id  JOIN model_list ml ON cn.Model = ml.Model  JOIN car_makers cm ON ml.Maker = cm.Id  WHERE cd.Weight < 3500 AND cm.FullName != 'Ford Motor Company'
SELECT DISTINCT T1.Model FROM model_list AS T1 JOIN car_makers AS T2 ON T1.Maker = T2.Id JOIN car_names AS T3 ON T1.Model = T3.Model JOIN cars_data AS T4 ON T3.MakeId = T4.Id WHERE T4.Weight < 3500 AND T2.FullName != 'Ford Motor Company'
SELECT CountryName FROM countries WHERE CountryId NOT IN (SELECT Country FROM car_makers)
SELECT CountryName FROM countries WHERE CountryId NOT IN (SELECT Country FROM car_makers)
SELECT cm.Id, cm.Maker  FROM car_makers cm  JOIN model_list ml ON cm.Id = ml.Maker  GROUP BY cm.Id, cm.Maker  HAVING COUNT(ml.ModelId) >= 2  ORDER BY COUNT(cm.Id) DESC  LIMIT 3, 1000000;
SELECT cm.Id, cm.Maker  FROM car_makers AS cm  JOIN model_list AS ml ON cm.Id = ml.Maker  JOIN car_names AS cn ON ml.Model = cn.Model  GROUP BY cm.Id, cm.Maker  HAVING COUNT(DISTINCT ml.Model) >= 2  AND COUNT(cn.Make) > 3
SELECT c.CountryId, c.CountryName  FROM countries c  JOIN car_makers cm ON c.CountryId = cm.Country  WHERE c.CountryId IN (     SELECT Country      FROM car_makers      GROUP BY Country      HAVING COUNT(Id) > 3 )  OR c.CountryId IN (     SELECT cl.Country      FROM car_makers cm      JOIN model_list ml ON cm.Id = ml.Maker      WHERE ml.Model = 'fiat' )
SELECT c.CountryId, c.CountryName  FROM countries c  JOIN car_makers cm ON c.CountryId = cm.Country  WHERE c.CountryId IN (     SELECT Country      FROM car_makers      GROUP BY Country      HAVING COUNT(*) > 3 )  UNION  SELECT c.CountryId, c.CountryName  FROM countries c  JOIN car_makers cm ON c.CountryId = cm.Country  JOIN model_list ml ON cm.Id = ml.Maker  WHERE ml.Model = 'fiat';
SELECT Country FROM airlines WHERE Airline = 'JetBlue Airways'
SELECT Country FROM airlines WHERE Airline = 'Jetblue Airways'
SELECT Abbreviation FROM airlines WHERE Airline = 'JetBlue Airways'
SELECT Abbreviation FROM airlines WHERE Airline = 'Jetblue Airways'
SELECT Airline, Abbreviation FROM airlines WHERE Country = 'USA'
SELECT Airline, Abbreviation FROM airlines WHERE Country = 'USA'
SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony'
SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony'
SELECT COUNT(*) FROM airlines
SELECT COUNT(*) FROM `airlines`
SELECT COUNT(*) FROM airports
SELECT COUNT(*) FROM `airports`
SELECT COUNT(*) FROM flights
SELECT COUNT(*) FROM flights
SELECT Airline FROM airlines WHERE Abbreviation = 'UAL'
SELECT Airline FROM airlines WHERE Abbreviation = 'UAL'
SELECT COUNT(*) FROM airlines WHERE Country = 'USA'
SELECT COUNT(*) FROM airlines WHERE Country = 'USA'
SELECT City, Country FROM airports WHERE AirportCode = 'AHT'
SELECT City, Country FROM airports WHERE AirportCode = 'AHT'
SELECT AirportName FROM airports WHERE AirportCode = 'AKO'
SELECT AirportName FROM airports WHERE AirportCode = 'AKO'
SELECT AirportName FROM airports WHERE City = 'Aberdeen'
SELECT AirportName FROM airports WHERE City = 'Aberdeen '
SELECT COUNT(*) FROM flights WHERE SourceAirport = 'APG'
SELECT COUNT(*) FROM flights WHERE SourceAirport = 'APG'
SELECT COUNT(*) FROM flights WHERE DestAirport = 'ATO'
SELECT COUNT(*) FROM flights WHERE DestAirport = 'ATO'
SELECT COUNT(*)  FROM flights f JOIN airports a ON f.SourceAirport = a.AirportCode WHERE a.City = 'Aberdeen';
SELECT COUNT(*) FROM flights WHERE SourceAirport IN (SELECT AirportCode FROM airports WHERE City = 'Aberdeen ')
SELECT COUNT(*) FROM flights AS T1 JOIN airports AS T2 ON T1.DestAirport = T2.AirportCode WHERE T2.City = 'Aberdeen '
SELECT COUNT(*) FROM flights WHERE DestAirport IN (SELECT AirportCode FROM airports WHERE City = 'Aberdeen ')
SELECT COUNT(*)  FROM flights f JOIN airports src ON f.SourceAirport = src.AirportCode JOIN airports dst ON f.DestAirport = dst.AirportCode WHERE src.City = 'Aberdeen' AND dst.City = 'Ashley'
SELECT COUNT(*) FROM `flights` WHERE `SourceAirport` IN (SELECT `AirportCode` FROM `airports` WHERE `City` = 'Aberdeen ') AND `DestAirport` IN (SELECT `AirportCode` FROM `airports` WHERE `City` = 'Ashley ')
SELECT COUNT(*) FROM flights WHERE Airline = (SELECT uid FROM airlines WHERE Airline = 'JetBlue Airways')
SELECT COUNT(*) FROM flights WHERE Airline = (SELECT uid FROM airlines WHERE Airline = 'Jetblue Airways')
SELECT COUNT(*) FROM flights WHERE Airline = (SELECT uid FROM airlines WHERE Airline = 'United Airlines') AND DestAirport = 'ASY'
SELECT COUNT(*) FROM flights WHERE Airline = 1 AND DestAirport = 'ASY'
SELECT COUNT(*) FROM flights WHERE Airline = (SELECT uid FROM airlines WHERE Airline = 'United Airlines') AND SourceAirport = 'AHD'
SELECT COUNT(*) FROM flights WHERE Airline = (SELECT uid FROM airlines WHERE Airline = 'United Airlines') AND SourceAirport = 'AHD'
SELECT COUNT(*)  FROM flights f  JOIN airports a ON f.DestAirport = a.AirportCode  JOIN airlines al ON f.Airline = al.uid  WHERE al.Airline = 'United Airlines' AND a.City = 'Aberdeen ';
SELECT COUNT(*) FROM flights f JOIN airlines a ON f.Airline = a.uid JOIN airports ap ON f.DestAirport = ap.AirportCode WHERE a.Airline = 'United Airlines' AND ap.City = 'Aberdeen '
SELECT `City`  FROM `airports`  JOIN `flights` ON `airports`.`AirportCode` = `flights`.`DestAirport`  GROUP BY `City`  ORDER BY COUNT(*) DESC  LIMIT 1;
SELECT `City`  FROM `airports`  WHERE `AirportCode` IN (     SELECT `DestAirport`      FROM `flights`      GROUP BY `DestAirport`      ORDER BY COUNT(`DestAirport`) DESC      LIMIT 1 )
SELECT `City`  FROM `airports`  JOIN `flights` ON `airports.AirportCode` = `flights.SourceAirport`  GROUP BY `City`  ORDER BY COUNT(`flights.FlightNo`) DESC  LIMIT 1;
SELECT City FROM airports WHERE AirportCode IN (SELECT SourceAirport FROM flights GROUP BY SourceAirport ORDER BY COUNT(*) DESC LIMIT 1)
SELECT `SourceAirport` AS `AirportCode`, COUNT(*) AS `FlightCount` FROM `flights` GROUP BY `SourceAirport` UNION SELECT `DestAirport` AS `AirportCode`, COUNT(*) AS `FlightCount` FROM `flights` GROUP BY `DestAirport` ORDER BY `FlightCount` DESC LIMIT 1
SELECT `SourceAirport` AS `AirportCode` FROM `flights` UNION ALL SELECT `DestAirport` AS `AirportCode` FROM `flights` GROUP BY `AirportCode` ORDER BY COUNT(`AirportCode`) DESC LIMIT 1
SELECT `SourceAirport` FROM `flights` GROUP BY `SourceAirport` ORDER BY COUNT(`FlightNo`) ASC LIMIT 1
SELECT `SourceAirport` FROM `flights` GROUP BY `SourceAirport` ORDER BY COUNT(`SourceAirport`) ASC LIMIT 1 UNION SELECT `DestAirport` FROM `flights` GROUP BY `DestAirport` ORDER BY COUNT(`DestAirport`) ASC LIMIT 1
SELECT a.Airline  FROM airlines a  JOIN flights f ON a.uid = f.Airline  GROUP BY a.Airline  ORDER BY COUNT(f.FlightNo) DESC  LIMIT 1;
SELECT a.Airline FROM airlines a JOIN flights f ON a.uid = f.Airline GROUP BY a.Airline ORDER BY COUNT(f.FlightNo) DESC LIMIT 1
SELECT a.Abbreviation, a.Country  FROM airlines a  JOIN flights f ON a.uid = f.Airline  GROUP BY a.uid  ORDER BY COUNT(f.FlightNo) ASC  LIMIT 1;
SELECT a.Abbreviation, a.Country  FROM airlines a  JOIN flights f ON a.uid = f.Airline  GROUP BY a.uid  ORDER BY COUNT(f.FlightNo) ASC  LIMIT 1;
SELECT DISTINCT a.Airline  FROM airlines a  JOIN flights f ON a.uid = f.Airline  WHERE f.SourceAirport = 'AHD'
SELECT Airline FROM flights WHERE SourceAirport = 'AHD'
SELECT DISTINCT a.Airline  FROM airlines a  JOIN flights f ON a.uid = f.Airline  WHERE f.DestAirport = 'AHD'
SELECT a.Airline  FROM airlines a  JOIN flights f ON a.uid = f.Airline  WHERE f.DestAirport = 'AHD'
SELECT A1.Airline  FROM airlines A1  WHERE A1.uid IN (     SELECT F1.Airline      FROM flights F1      WHERE F1.SourceAirport = 'APG' ) AND A1.uid IN (     SELECT F2.Airline      FROM flights F2      WHERE F2.SourceAirport = 'CVO' )
SELECT a.Airline  FROM airlines a  JOIN flights f1 ON a.uid = f1.Airline  JOIN flights f2 ON a.uid = f2.Airline  WHERE f1.SourceAirport = 'APG' AND f2.SourceAirport = 'CVO'  GROUP BY a.Airline
SELECT DISTINCT a.Airline  FROM airlines a  JOIN flights f ON a.uid = f.Airline  WHERE f.SourceAirport = 'CVO'  AND a.uid NOT IN (     SELECT f2.Airline      FROM flights f2      WHERE f2.SourceAirport = 'APG' )
SELECT A.Airline  FROM airlines A  JOIN flights F ON A.uid = F.Airline  WHERE F.SourceAirport = 'CVO'  AND A.uid NOT IN (     SELECT A2.uid      FROM airlines A2      JOIN flights F2 ON A2.uid = F2.Airline      WHERE F2.SourceAirport = 'APG' )
SELECT a.Airline  FROM airlines a JOIN flights f ON a.uid = f.Airline GROUP BY a.Airline HAVING COUNT(f.FlightNo) >= 10;
SELECT a.Airline  FROM airlines a  JOIN flights f ON a.uid = f.Airline  GROUP BY a.Airline  HAVING COUNT(f.FlightNo) >= 10
SELECT a.Airline  FROM airlines a  JOIN flights f ON a.uid = f.Airline  GROUP BY a.Airline  HAVING COUNT(f.FlightNo) < 200;
SELECT a.Airline  FROM airlines a  JOIN flights f ON a.uid = f.Airline  GROUP BY a.Airline  HAVING COUNT(f.FlightNo) < 200;
SELECT FlightNo FROM flights WHERE Airline = (SELECT uid FROM airlines WHERE Airline = 'United Airlines')
SELECT FlightNo FROM flights WHERE Airline = (SELECT uid FROM airlines WHERE Airline = 'United Airlines')
SELECT FlightNo FROM flights WHERE SourceAirport = 'APG'
SELECT FlightNo FROM flights WHERE SourceAirport = 'APG'
SELECT FlightNo FROM flights WHERE DestAirport = 'APG'
SELECT FlightNo FROM flights WHERE DestAirport = 'APG'
SELECT f.FlightNo FROM flights f JOIN airports a ON f.SourceAirport = a.AirportCode WHERE a.City = 'Aberdeen '
SELECT FlightNo FROM flights WHERE SourceAirport IN (SELECT AirportCode FROM airports WHERE City = 'Aberdeen ')
SELECT f.FlightNo  FROM flights f  JOIN airports a ON f.DestAirport = a.AirportCode  WHERE a.City = 'Aberdeen '
SELECT FlightNo FROM flights WHERE DestAirport IN (SELECT AirportCode FROM airports WHERE City = 'Aberdeen ')
SELECT COUNT(*) FROM flights f JOIN airports a ON f.DestAirport = a.AirportCode WHERE a.City IN ('Aberdeen', 'Abilene')
SELECT COUNT(*)  FROM flights  WHERE DestAirport IN (     SELECT AirportCode      FROM airports      WHERE City = 'Aberdeen' OR City = 'Abilene' )
SELECT AirportName FROM airports WHERE AirportCode NOT IN (SELECT SourceAirport FROM flights UNION SELECT DestAirport FROM flights)
SELECT AirportCode FROM airports WHERE AirportCode NOT IN (SELECT SourceAirport FROM flights UNION SELECT DestAirport FROM flights)
SELECT COUNT(*) FROM employee
SELECT COUNT(*) FROM employee
SELECT Name FROM employee ORDER BY Age ASC
SELECT Name FROM employee ORDER BY Age ASC
SELECT City, COUNT(*) FROM employee GROUP BY City
SELECT City, COUNT(*) FROM employee GROUP BY City
SELECT City FROM employee WHERE Age < 30 GROUP BY City HAVING COUNT(*) > 1
SELECT City FROM employee WHERE Age < 30 GROUP BY City HAVING COUNT(*) > 1
SELECT Location, COUNT(*) FROM shop GROUP BY Location
SELECT Location, COUNT(*) FROM shop GROUP BY Location
SELECT `Manager_name`, `District` FROM `shop` ORDER BY `Number_products` DESC LIMIT 1
SELECT `Manager_name`, `District` FROM `shop` ORDER BY `Number_products` DESC LIMIT 1
SELECT MIN(Number_products) AS MinProducts, MAX(Number_products) AS MaxProducts FROM shop
SELECT MIN(Number_products) AS MinimumProducts, MAX(Number_products) AS MaximumProducts FROM shop
SELECT `Name`, `Location`, `District` FROM `shop` ORDER BY `Number_products` DESC
SELECT `Name`, `Location`, `District` FROM `shop` ORDER BY `Number_products` DESC
SELECT Name FROM shop WHERE Number_products > (SELECT AVG(Number_products) FROM shop)
SELECT `Name` FROM `shop` WHERE `Number_products` > (SELECT AVG(`Number_products`) FROM `shop`)
SELECT e.Name  FROM employee e  JOIN (     SELECT Employee_ID, COUNT(*) as cnt      FROM evaluation      GROUP BY Employee_ID ) subq  ON e.Employee_ID = subq.Employee_ID  ORDER BY subq.cnt DESC  LIMIT 1;
SELECT e.Name  FROM employee e  JOIN evaluation ev ON e.Employee_ID = ev.Employee_ID  GROUP BY e.Employee_ID, e.Name  ORDER BY COUNT(ev.Year_awarded) DESC  LIMIT 1;
SELECT e.Name FROM employee e JOIN evaluation ev ON e.Employee_ID = ev.Employee_ID GROUP BY e.Employee_ID, e.Name ORDER BY MAX(ev.Bonus) DESC LIMIT 1
SELECT e.Name  FROM employee e  JOIN evaluation ev ON e.Employee_ID = ev.Employee_ID  ORDER BY ev.Bonus DESC  LIMIT 1;
SELECT Name FROM employee WHERE Employee_ID NOT IN (SELECT Employee_ID FROM evaluation)
SELECT Name FROM employee WHERE Employee_ID NOT IN (SELECT Employee_ID FROM evaluation)
SELECT s.Name  FROM shop s  JOIN hiring h ON s.Shop_ID = h.Shop_ID  GROUP BY s.Shop_ID, s.Name  ORDER BY COUNT(h.Employee_ID) DESC  LIMIT 1;
SELECT shop.Name  FROM shop  JOIN hiring ON shop.Shop_ID = hiring.Shop_ID  GROUP BY shop.Name  ORDER BY COUNT(hiring.Employee_ID) DESC  LIMIT 1;
SELECT Name FROM shop WHERE Shop_ID NOT IN (SELECT Shop_ID FROM hiring)
SELECT `Name` FROM `shop` WHERE `Shop_ID` NOT IN (SELECT `Shop_ID` FROM `hiring`)
SELECT s.Name, COUNT(h.Employee_ID) AS Number_of_Employees FROM shop s JOIN hiring h ON s.Shop_ID = h.Shop_ID GROUP BY s.Name;
SELECT s.Name, COUNT(h.Employee_ID) AS Number_of_Employees FROM shop s JOIN hiring h ON s.Shop_ID = h.Shop_ID GROUP BY s.Shop_ID, s.Name
SELECT SUM(Bonus) FROM evaluation
SELECT SUM(Bonus) FROM evaluation
SELECT * FROM hiring
SELECT * FROM hiring
SELECT District FROM shop WHERE Number_products < 3000 INTERSECT SELECT District FROM shop WHERE Number_products > 10000
SELECT District FROM shop WHERE Number_products < 3000 INTERSECT SELECT District FROM shop WHERE Number_products > 10000
SELECT COUNT(DISTINCT Location) FROM shop
SELECT COUNT(DISTINCT Location) FROM shop
SELECT COUNT(*) FROM `Documents`
SELECT COUNT(*) FROM `Documents`
SELECT Document_ID, Document_Name, Document_Description FROM Documents
SELECT `Document_ID`, `Document_Name`, `Document_Description` FROM `Documents`
SELECT Document_Name, Template_ID FROM Documents WHERE Document_Description LIKE '%w%'
SELECT Document_Name, Template_ID FROM Documents WHERE Document_Description LIKE '%w%'
SELECT `Document_ID`, `Template_ID`, `Document_Description` FROM `Documents` WHERE `Document_Name` = 'Robbin CV'
SELECT `Document_ID`, `Template_ID`, `Document_Description` FROM `Documents` WHERE `Document_Name` = 'Robbin CV'
SELECT COUNT(DISTINCT Template_ID) FROM Documents
SELECT COUNT(DISTINCT Template_ID) FROM Documents
SELECT COUNT(*) FROM `Documents` WHERE `Template_ID` IN (SELECT `Template_ID` FROM `Templates` WHERE `Template_Type_Code` = 'PPT')
SELECT COUNT(*)  FROM `Documents` d JOIN `Templates` t ON d.Template_ID = t.Template_ID JOIN `Ref_Template_Types` r ON t.Template_Type_Code = r.Template_Type_Code WHERE r.Template_Type_Code = 'PPT'
SELECT T.Template_ID, COUNT(D.Document_ID) AS NumberOfDocuments FROM Templates T LEFT JOIN Documents D ON T.Template_ID = D.Template_ID GROUP BY T.Template_ID;
SELECT Template_ID, COUNT(*) AS Used_Times  FROM Documents  GROUP BY Template_ID;
SELECT T1.Template_ID, T1.Template_Type_Code FROM Templates AS T1 JOIN (SELECT Template_ID, COUNT(*) AS count FROM Documents GROUP BY Template_ID ORDER BY count DESC LIMIT 1) AS T2 ON T1.Template_ID = T2.Template_ID
SELECT T1.Template_ID, T1.Template_Type_Code FROM Templates AS T1 JOIN (SELECT Template_ID, COUNT(*) AS Document_Count FROM Documents GROUP BY Template_ID) AS T2 ON T1.Template_ID = T2.Template_ID ORDER BY T2.Document_Count DESC LIMIT 1;
SELECT T1.Template_ID FROM Templates AS T1 JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T1.Template_ID HAVING COUNT(T2.Document_ID) > 1
SELECT Template_ID FROM Documents GROUP BY Template_ID HAVING COUNT(Document_ID) > 1
SELECT Template_ID FROM Templates WHERE Template_ID NOT IN (SELECT Template_ID FROM Documents)
SELECT Template_ID FROM Templates WHERE Template_ID NOT IN (SELECT Template_ID FROM Documents)
SELECT COUNT(*) FROM `Templates`
SELECT COUNT(*) FROM `Templates`
SELECT Template_ID, Version_Number, Template_Type_Code FROM Templates
SELECT Template_ID, Version_Number, Template_Type_Code FROM Templates
SELECT DISTINCT Template_Type_Code FROM Templates
SELECT DISTINCT Template_Type_Code FROM Ref_Template_Types
SELECT Template_ID FROM Templates WHERE Template_Type_Code IN ('PP', 'PPT')
SELECT Template_ID FROM Templates WHERE Template_Type_Code IN ('PP', 'PPT')
SELECT COUNT(*) FROM Templates WHERE Template_Type_Code = 'CV'
SELECT COUNT(*) FROM `Templates` WHERE `Template_Type_Code` = 'CV'
SELECT Version_Number, Template_Type_Code FROM Templates WHERE Version_Number > 5
SELECT Version_Number, Template_Type_Code FROM Templates WHERE Version_Number > 5
SELECT `Template_Type_Code`, COUNT(*) FROM `Templates` GROUP BY `Template_Type_Code`
SELECT Template_Type_Code, COUNT(*) AS Template_Count FROM Templates GROUP BY Template_Type_Code;
SELECT `Template_Type_Code` FROM `Templates` GROUP BY `Template_Type_Code` ORDER BY COUNT(*) DESC LIMIT 1
SELECT `Template_Type_Code` FROM `Templates` GROUP BY `Template_Type_Code` ORDER BY COUNT(*) DESC LIMIT 1
SELECT `Template_Type_Code` FROM `Ref_Template_Types` WHERE `Template_Type_Code` IN (SELECT `Template_Type_Code` FROM `Templates` GROUP BY `Template_Type_Code` HAVING COUNT(`Template_ID`) < 3)
SELECT `Template_Type_Code` FROM `Ref_Template_Types` WHERE `Template_Type_Code` IN (SELECT `Template_Type_Code` FROM `Templates` GROUP BY `Template_Type_Code` HAVING COUNT(*) < 3)
SELECT MIN(Version_Number), Template_Type_Code FROM Templates
SELECT MIN(Version_Number), Template_Type_Code FROM Templates
SELECT T1.Template_Type_Code FROM Templates AS T1 JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID WHERE T2.Document_Name = 'Data base'
SELECT T1.Template_Type_Code FROM Templates AS T1 JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID WHERE T2.Document_Name = 'Data base'
SELECT D.Document_Name  FROM Documents D  JOIN Templates T ON D.Template_ID = T.Template_ID  WHERE T.Template_Type_Code = 'BK'
SELECT D.Document_Name FROM Documents D JOIN Templates T ON D.Template_ID = T.Template_ID WHERE T.Template_Type_Code = 'BK'
SELECT T1.Template_Type_Code, COUNT(T2.Document_ID) AS Document_Count FROM Ref_Template_Types T1 JOIN Templates T2 ON T1.Template_Type_Code = T2.Template_Type_Code JOIN Documents T3 ON T2.Template_ID = T3.Template_ID GROUP BY T1.Template_Type_Code
SELECT T1.Template_Type_Code, COUNT(T3.Document_ID) AS Document_Count FROM Ref_Template_Types T1 JOIN Templates T2 ON T1.Template_Type_Code = T2.Template_Type_Code JOIN Documents T3 ON T2.Template_ID = T3.Template_ID GROUP BY T1.Template_Type_Code;
SELECT `Template_Type_Code` FROM `Templates` JOIN `Documents` ON `Templates`.`Template_ID` = `Documents`.`Template_ID` GROUP BY `Template_Type_Code` ORDER BY COUNT(`Documents`.`Document_ID`) DESC LIMIT 1
SELECT `Template_Type_Code` FROM `Templates` INNER JOIN `Documents` ON `Templates`.`Template_ID` = `Documents`.`Template_ID` GROUP BY `Template_Type_Code` ORDER BY COUNT(*) DESC LIMIT 1
SELECT `Template_Type_Code` FROM `Ref_Template_Types` WHERE `Template_Type_Code` NOT IN (SELECT `Template_Type_Code` FROM `Templates` WHERE `Template_ID` IN (SELECT `Template_ID` FROM `Documents`))
SELECT `Template_Type_Code` FROM `Ref_Template_Types` WHERE `Template_Type_Code` NOT IN (SELECT `Template_Type_Code` FROM `Templates` WHERE `Template_ID` IN (SELECT `Template_ID` FROM `Documents`))
SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types
SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types
SELECT Template_Type_Description FROM Ref_Template_Types WHERE Template_Type_Code = 'AD'
SELECT Template_Type_Description FROM Ref_Template_Types WHERE Template_Type_Code = 'AD'
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Book'
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Book'
SELECT DISTINCT rtt.Template_Type_Description FROM Ref_Template_Types rtt JOIN Templates t ON rtt.Template_Type_Code = t.Template_Type_Code JOIN Documents d ON t.Template_ID = d.Template_ID;
SELECT DISTINCT T.Template_Type_Description  FROM Ref_Template_Types T  JOIN Templates TM ON T.Template_Type_Code = TM.Template_Type_Code  JOIN Documents D ON TM.Template_ID = D.Template_ID;
SELECT `Template_ID` FROM `Templates` INNER JOIN `Ref_Template_Types` ON `Templates.Template_Type_Code` = `Ref_Template_Types.Template_Type_Code` WHERE `Ref_Template_Types.Template_Type_Description` = 'Presentation'
SELECT Template_ID FROM Templates WHERE Template_Type_Code IN (SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Presentation')
SELECT COUNT(*) FROM `Paragraphs`
SELECT COUNT(*) FROM `Paragraphs`
SELECT COUNT(*) FROM `Paragraphs` WHERE `Document_ID` IN (SELECT `Document_ID` FROM `Documents` WHERE `Document_Name` = 'Summer Show')
SELECT COUNT(*) FROM Paragraphs WHERE Document_ID = (SELECT Document_ID FROM Documents WHERE Document_Name = 'Summer Show')
SELECT * FROM Paragraphs WHERE Paragraph_Text = 'Korea'
SELECT Paragraph_ID, Document_ID, Paragraph_Text, Other_Details FROM Paragraphs WHERE Paragraph_Text = 'Korea'
SELECT p.Paragraph_ID, p.Paragraph_Text  FROM Paragraphs p  JOIN Documents d ON p.Document_ID = d.Document_ID  WHERE d.Document_Name = 'Welcome to NY'
SELECT p.Paragraph_ID, p.Paragraph_Text  FROM Paragraphs p  JOIN Documents d ON p.Document_ID = d.Document_ID  WHERE d.Document_Name = 'Welcome to NY'
SELECT p.Paragraph_Text  FROM Paragraphs p  JOIN Documents d ON p.Document_ID = d.Document_ID  WHERE d.Document_Name = 'Customer reviews'
SELECT Paragraph_Text FROM Paragraphs WHERE Document_ID IN (SELECT Document_ID FROM Documents WHERE Document_Name = 'Customer reviews')
SELECT D.Document_ID, COUNT(P.Paragraph_ID) AS NumberOfParagraphs FROM Documents D LEFT JOIN Paragraphs P ON D.Document_ID = P.Document_ID GROUP BY D.Document_ID ORDER BY D.Document_ID;
SELECT d.Document_ID, COUNT(p.Paragraph_ID) AS Paragraph_Count FROM Documents d JOIN Paragraphs p ON d.Document_ID = p.Document_ID GROUP BY d.Document_ID ORDER BY d.Document_ID;
SELECT d.Document_ID, d.Document_Name, COUNT(p.Paragraph_ID) AS Paragraph_Count FROM Documents d LEFT JOIN Paragraphs p ON d.Document_ID = p.Document_ID GROUP BY d.Document_ID, d.Document_Name
SELECT D.Document_ID, D.Document_Name, COUNT(P.Paragraph_ID) AS Paragraph_Count FROM Documents D LEFT JOIN Paragraphs P ON D.Document_ID = P.Document_ID GROUP BY D.Document_ID, D.Document_Name;
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(Paragraph_ID) >= 2
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(*) >= 2
SELECT d.Document_ID, d.Document_Name  FROM Documents d  JOIN (     SELECT Document_ID, COUNT(*) as ParagraphCount      FROM Paragraphs      GROUP BY Document_ID ) p ON d.Document_ID = p.Document_ID  ORDER BY p.ParagraphCount DESC  LIMIT 1;
SELECT d.Document_ID, d.Document_Name  FROM Documents d  JOIN Paragraphs p ON d.Document_ID = p.Document_ID  GROUP BY d.Document_ID, d.Document_Name  ORDER BY COUNT(p.Paragraph_ID) DESC  LIMIT 1;
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID ORDER BY COUNT(Paragraph_ID) ASC LIMIT 1
SELECT `Document_ID`  FROM `Paragraphs`  GROUP BY `Document_ID`  ORDER BY COUNT(`Paragraph_ID`)  LIMIT 1;
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(Paragraph_ID) BETWEEN 1 AND 2
SELECT `Document_ID` FROM `Paragraphs` GROUP BY `Document_ID` HAVING COUNT(`Paragraph_ID`) BETWEEN 1 AND 2
SELECT Document_ID FROM Paragraphs WHERE Paragraph_Text = 'Brazil' INTERSECT SELECT Document_ID FROM Paragraphs WHERE Paragraph_Text = 'Ireland'
SELECT Document_ID FROM Paragraphs WHERE Paragraph_Text = 'Brazil' INTERSECT SELECT Document_ID FROM Paragraphs WHERE Paragraph_Text = 'Ireland'
SELECT COUNT(*) FROM teacher
SELECT COUNT(*) FROM teacher
SELECT Name FROM teacher ORDER BY Age ASC
SELECT Name FROM teacher ORDER BY Age ASC
SELECT Age, Hometown FROM teacher
SELECT Age, Hometown FROM teacher
SELECT Name FROM teacher WHERE Hometown != 'Little Lever Urban District'
SELECT Name FROM teacher WHERE Hometown != 'Little Lever Urban District'
SELECT Name FROM teacher WHERE Age IN ('32', '33')
SELECT Name FROM teacher WHERE Age IN ('32', '33')
SELECT Hometown FROM teacher WHERE Age = (SELECT MIN(Age) FROM teacher)
SELECT Hometown FROM teacher WHERE Age = (SELECT MIN(Age) FROM teacher)
SELECT Hometown, COUNT(*) FROM teacher GROUP BY Hometown
SELECT `Hometown`, COUNT(`Teacher_ID`) FROM `teacher` GROUP BY `Hometown`
SELECT Hometown  FROM teacher  GROUP BY Hometown  ORDER BY COUNT(Hometown) DESC  LIMIT 1
SELECT Hometown FROM teacher GROUP BY Hometown ORDER BY COUNT(Hometown) DESC LIMIT 1
SELECT Hometown  FROM teacher  GROUP BY Hometown  HAVING COUNT(Hometown) >= 2
SELECT Hometown FROM teacher GROUP BY Hometown HAVING COUNT(*) >= 2
SELECT t.Name, c.Course  FROM teacher t  JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID  JOIN course c ON ca.Course_ID = c.Course_ID
SELECT t.Name, c.Course  FROM teacher t  JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID  JOIN course c ON ca.Course_ID = c.Course_ID
SELECT t.Name, c.Course  FROM teacher t  JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID  JOIN course c ON ca.Course_ID = c.Course_ID  ORDER BY t.Name ASC
SELECT t.Name, c.Course  FROM teacher t  JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID  JOIN course c ON ca.Course_ID = c.Course_ID  ORDER BY t.Name ASC;
SELECT t.Name  FROM teacher t  JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID  JOIN course c ON ca.Course_ID = c.Course_ID  WHERE c.Course = 'Math'
SELECT T1.Name FROM teacher AS T1 JOIN course_arrange AS T2 ON T1.Teacher_ID = T2.Teacher_ID JOIN course AS T3 ON T2.Course_ID = T3.Course_ID WHERE T3.Course = 'Math'
SELECT T1.Name, COUNT(T2.Course_ID)  FROM teacher AS T1  JOIN course_arrange AS T2  ON T1.Teacher_ID = T2.Teacher_ID  GROUP BY T1.Name
SELECT t.Name, COUNT(ca.Course_ID) AS NumberOfCourses FROM teacher t JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID GROUP BY t.Teacher_ID, t.Name
SELECT t.Name  FROM teacher t  JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID  GROUP BY t.Name  HAVING COUNT(DISTINCT ca.Course_ID) >= 2
SELECT t.Name  FROM teacher t  JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID  GROUP BY t.Teacher_ID, t.Name  HAVING COUNT(DISTINCT ca.Course_ID) >= 2
SELECT Name FROM teacher WHERE Teacher_ID NOT IN (SELECT Teacher_ID FROM course_arrange)
SELECT Name FROM teacher WHERE Teacher_ID NOT IN (SELECT Teacher_ID FROM course_arrange)
SELECT COUNT(*) FROM visitor WHERE Age < 30
SELECT Name FROM visitor WHERE Level_of_membership > 4 ORDER BY Level_of_membership DESC
SELECT AVG(Age) FROM visitor WHERE Level_of_membership <= 4
SELECT Name, Level_of_membership FROM visitor WHERE Level_of_membership > 4 ORDER BY Age DESC
SELECT Museum_ID, Name FROM museum ORDER BY Num_of_Staff DESC LIMIT 1
SELECT AVG(Num_of_Staff) FROM museum WHERE Open_Year < '2009'
SELECT Open_Year, Num_of_Staff FROM museum WHERE Name = 'Plaza Museum'
SELECT Name FROM museum WHERE Num_of_Staff > (SELECT MIN(Num_of_Staff) FROM museum WHERE Open_Year > '2010')
SELECT v.ID, v.Name, v.Age  FROM visitor v  JOIN (     SELECT visitor_ID      FROM visit      GROUP BY visitor_ID      HAVING COUNT(Museum_ID) > 1 ) AS subq  ON v.ID = subq.visitor_ID;
SELECT v.ID, v.Name, v.Level_of_membership  FROM visitor v  JOIN (     SELECT visitor_ID, SUM(Total_spent) as total_spent      FROM visit      GROUP BY visitor_ID ) t  ON v.ID = t.visitor_ID  ORDER BY t.total_spent DESC  LIMIT 1;
SELECT `Museum_ID`, `Name` FROM `museum` WHERE `Museum_ID` = (SELECT `Museum_ID` FROM `visit` GROUP BY `Museum_ID` ORDER BY COUNT(`Museum_ID`) DESC LIMIT 1)
SELECT Name FROM museum WHERE Museum_ID NOT IN (SELECT Museum_ID FROM visit)
SELECT v.Name, v.Age  FROM visitor v  JOIN visit vi ON v.ID = vi.visitor_ID  WHERE vi.Num_of_Ticket = (SELECT MAX(Num_of_Ticket) FROM visit)
SELECT AVG(Num_of_Ticket) AS Average_Tickets, MAX(Num_of_Ticket) AS Maximum_Tickets FROM visit
SELECT SUM(Total_spent) FROM visit JOIN visitor ON visit.visitor_ID = visitor.ID WHERE visitor.Level_of_membership = 1
SELECT v.Name  FROM visitor v  JOIN visit vi ON v.ID = vi.visitor_ID  JOIN museum m1 ON m1.Museum_ID = vi.Museum_ID  WHERE m1.Open_Year < '2009'  INTERSECT  SELECT v.Name  FROM visitor v  JOIN visit vi ON v.ID = vi.visitor_ID  JOIN museum m2 ON m2.Museum_ID = vi.Museum_ID  WHERE m2.Open_Year > '2011'
SELECT COUNT(DISTINCT v.ID)  FROM visitor v  WHERE v.ID NOT IN (     SELECT visitor_ID      FROM visit      WHERE Museum_ID IN (         SELECT Museum_ID          FROM museum          WHERE Open_Year > '2010'     ) );
SELECT COUNT(*) FROM museum WHERE Open_Year > '2013' OR Open_Year < '2008'
SELECT COUNT(*) FROM players
SELECT COUNT(*) FROM players
SELECT COUNT(*) FROM matches
SELECT COUNT(*) FROM matches
SELECT first_name, birth_date FROM players WHERE country_code = 'USA'
SELECT first_name, birth_date FROM players WHERE country_code = 'USA'
SELECT AVG(loser_age) AS avg_loser_age, AVG(winner_age) AS avg_winner_age FROM matches;
SELECT AVG(loser_age) AS avg_loser_age, AVG(winner_age) AS avg_winner_age FROM matches
SELECT AVG(winner_rank) FROM matches
SELECT AVG(winner_rank) FROM matches
SELECT MAX(loser_rank) FROM matches
SELECT MIN(loser_rank) FROM matches
SELECT COUNT(DISTINCT country_code) FROM players
SELECT COUNT(DISTINCT country_code) FROM players
SELECT COUNT(DISTINCT loser_name) FROM matches
SELECT COUNT(DISTINCT loser_name) FROM matches
SELECT tourney_name FROM matches GROUP BY tourney_name HAVING COUNT(*) > 10
SELECT tourney_name FROM matches GROUP BY tourney_name HAVING COUNT(*) > 10
SELECT DISTINCT winner_name FROM matches WHERE year = 2013 INTERSECT SELECT DISTINCT winner_name FROM matches WHERE year = 2016
SELECT DISTINCT winner_name FROM matches WHERE year = 2013 AND winner_name IN (SELECT winner_name FROM matches WHERE year = 2016)
SELECT COUNT(*) FROM matches WHERE year IN (2013, 2016)
SELECT COUNT(*) FROM matches WHERE year IN (2013, 2016)
SELECT p.country_code, p.first_name FROM players p WHERE p.player_id IN (SELECT m.winner_id FROM matches m WHERE m.tourney_name = 'WTA Championships' INTERSECT SELECT m.winner_id FROM matches m WHERE m.tourney_name = 'Australian Open')
SELECT DISTINCT p.first_name, p.country_code FROM players p JOIN matches m ON p.player_id = m.winner_id WHERE m.tourney_name IN ('WTA Championships', 'Australian Open') GROUP BY p.player_id HAVING COUNT(DISTINCT m.tourney_name) = 2;
SELECT first_name, country_code FROM players WHERE birth_date = (SELECT MIN(birth_date) FROM players)
SELECT first_name, country_code FROM players ORDER BY birth_date ASC LIMIT 1
SELECT first_name, last_name FROM players ORDER BY birth_date
SELECT first_name, last_name FROM players ORDER BY birth_date
SELECT first_name, last_name FROM players WHERE hand = 'L' ORDER BY birth_date
SELECT first_name, last_name FROM players WHERE hand = 'L' ORDER BY birth_date
SELECT p.first_name, p.country_code  FROM players p  JOIN rankings r ON p.player_id = r.player_id  GROUP BY r.player_id  ORDER BY SUM(r.tours) DESC  LIMIT 1;
SELECT p.first_name, p.country_code  FROM players p  JOIN rankings r ON p.player_id = r.player_id  GROUP BY p.player_id  ORDER BY SUM(r.tours) DESC  LIMIT 1;
SELECT year, COUNT(*) AS match_count  FROM matches  GROUP BY year  ORDER BY match_count DESC  LIMIT 1;
SELECT year, COUNT(*) AS match_count  FROM matches  GROUP BY year  ORDER BY match_count DESC  LIMIT 1;
SELECT winner_name, winner_rank_points  FROM matches  JOIN (     SELECT winner_id, COUNT(*) AS win_count      FROM matches      GROUP BY winner_id      ORDER BY win_count DESC      LIMIT 1 ) AS wc ON matches.winner_id = wc.winner_id;
SELECT p.first_name, p.last_name, r.ranking_points  FROM players p  JOIN rankings r ON p.player_id = r.player_id  JOIN (     SELECT winner_id, COUNT(*) as match_count      FROM matches      GROUP BY winner_id      ORDER BY match_count DESC      LIMIT 1 ) m ON p.player_id = m.winner_id;
SELECT p.first_name, p.last_name  FROM players p  JOIN matches m ON p.player_id = m.winner_id  JOIN rankings r ON p.player_id = r.player_id  WHERE m.tourney_name = 'Australian Open'  ORDER BY r.ranking_points DESC  LIMIT 1;
SELECT p.first_name, p.last_name  FROM players p  JOIN matches m ON p.player_id = m.winner_id  JOIN rankings r ON p.player_id = r.player_id  WHERE m.tourney_name = 'Australian Open'  ORDER BY r.ranking_points DESC  LIMIT 1;
SELECT m.winner_name, m.loser_name  FROM matches m  WHERE m.minutes = (SELECT MAX(minutes) FROM matches)
SELECT winner_name, loser_name FROM matches WHERE minutes = (SELECT MAX(minutes) FROM matches)
SELECT p.first_name, AVG(r.ranking) AS average_ranking FROM players p JOIN rankings r ON p.player_id = r.player_id GROUP BY p.player_id, p.first_name;
SELECT p.first_name, AVG(r.ranking) AS average_ranking FROM players p JOIN rankings r ON p.player_id = r.player_id GROUP BY p.first_name;
SELECT p.first_name, SUM(r.ranking_points) AS total_points FROM players p JOIN rankings r ON p.player_id = r.player_id GROUP BY p.player_id, p.first_name;
SELECT p.first_name, SUM(r.ranking_points) AS total_ranking_points FROM players p JOIN rankings r ON p.player_id = r.player_id GROUP BY p.player_id, p.first_name;
SELECT country_code, COUNT(*) AS num_players FROM players GROUP BY country_code
SELECT country_code, COUNT(*) FROM players GROUP BY country_code
SELECT country_code  FROM players  GROUP BY country_code  ORDER BY COUNT(*) DESC  LIMIT 1;
SELECT country_code FROM players GROUP BY country_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT country_code FROM players GROUP BY country_code HAVING COUNT(player_id) > 50
SELECT country_code FROM players GROUP BY country_code HAVING COUNT(player_id) > 50
SELECT ranking_date, SUM(tours) AS total_tours FROM rankings GROUP BY ranking_date;
SELECT ranking_date, SUM(tours) AS total_tours FROM rankings GROUP BY ranking_date;
SELECT year, COUNT(*) AS num_matches FROM matches GROUP BY year
SELECT year, COUNT(*) AS matches_played FROM matches GROUP BY year
SELECT w.first_name, w.last_name, m.winner_rank  FROM matches m  JOIN players w ON m.winner_id = w.player_id  ORDER BY m.winner_age ASC  LIMIT 3;
SELECT winner_name, winner_rank FROM matches ORDER BY winner_age ASC LIMIT 3
SELECT COUNT(DISTINCT winner_id)  FROM matches  WHERE tourney_level = 'WTA Championships' AND winner_hand = 'L';
SELECT COUNT(DISTINCT winner_id)  FROM matches  WHERE winner_hand = 'L' AND tourney_level = 'W';
SELECT p.first_name, p.country_code, p.birth_date  FROM players p  JOIN matches m ON p.player_id = m.winner_id  JOIN rankings r ON p.player_id = r.player_id  WHERE r.ranking_points = (SELECT MAX(r2.ranking_points) FROM rankings r2 JOIN matches m2 ON r2.player_id = m2.winner_id)
SELECT p.first_name, p.country_code, p.birth_date  FROM players p  JOIN matches m ON p.player_id = m.winner_id  WHERE m.winner_rank_points = (SELECT MAX(winner_rank_points) FROM matches)
SELECT hand, COUNT(*) AS num_players FROM players GROUP BY hand
SELECT hand, COUNT(*) FROM players GROUP BY hand
SELECT COUNT(*) FROM ship WHERE disposition_of_ship = 'Captured'
SELECT name, tonnage FROM ship ORDER BY name DESC
SELECT name, date, result FROM battle
SELECT MAX(killed), MIN(killed) FROM death
SELECT AVG(injured) FROM death
SELECT killed, injured FROM death WHERE caused_by_ship_id IN (SELECT id FROM ship WHERE tonnage = 't')
SELECT name, result FROM battle WHERE bulgarian_commander != 'Boril'
SELECT DISTINCT b.id, b.name  FROM battle b  JOIN ship s ON b.id = s.lost_in_battle  WHERE s.ship_type = 'Brig'
SELECT b.id, b.name  FROM battle b  JOIN ship s ON b.id = s.lost_in_battle  JOIN death d ON s.id = d.caused_by_ship_id  GROUP BY b.id, b.name  HAVING SUM(d.killed) > 10;
SELECT s.id, s.name  FROM ship s  JOIN death d ON s.id = d.caused_by_ship_id  GROUP BY s.id, s.name  ORDER BY SUM(d.injured) DESC  LIMIT 1;
SELECT DISTINCT name FROM battle WHERE bulgarian_commander = 'Kaloyan' AND latin_commander = 'Baldwin I'
SELECT COUNT(DISTINCT result) FROM battle
SELECT COUNT(DISTINCT b.id)  FROM battle b  LEFT JOIN ship s ON b.id = s.lost_in_battle  WHERE s.tonnage != '225' OR s.tonnage IS NULL;
SELECT b.name, b.date  FROM battle b  JOIN ship s1 ON b.id = s1.lost_in_battle  JOIN ship s2 ON b.id = s2.lost_in_battle  WHERE s1.name = 'Lettice' AND s2.name = 'HMS Atalanta'
SELECT b.name, b.result, b.bulgarian_commander FROM battle b WHERE b.id NOT IN (SELECT s.lost_in_battle FROM ship s WHERE s.location = 'English Channel')
SELECT note FROM death WHERE note LIKE '%East%'
SELECT line_1, line_2 FROM Addresses
SELECT line_1, line_2 FROM Addresses
SELECT COUNT(*) FROM Courses
SELECT COUNT(*) FROM Courses
SELECT course_description FROM Courses WHERE course_name = 'math'
SELECT course_description FROM Courses WHERE course_name = 'math'
SELECT zip_postcode FROM Addresses WHERE city = 'Port Chelsea'
SELECT zip_postcode FROM Addresses WHERE city = 'Port Chelsea'
SELECT d.department_id, d.department_name FROM Departments d JOIN Degree_Programs dp ON d.department_id = dp.department_id GROUP BY d.department_id, d.department_name ORDER BY COUNT(dp.degree_program_id) DESC LIMIT 1;
SELECT D.department_id, D.department_name  FROM Departments D  JOIN Degree_Programs DP ON D.department_id = DP.department_id  GROUP BY D.department_id, D.department_name  ORDER BY COUNT(DP.degree_program_id) DESC  LIMIT 1;
SELECT COUNT(DISTINCT department_id) FROM Degree_Programs
SELECT COUNT(DISTINCT department_id) FROM Degree_Programs
SELECT COUNT(DISTINCT degree_summary_name) FROM Degree_Programs
SELECT COUNT(DISTINCT degree_summary_name) FROM Degree_Programs
SELECT COUNT(*) FROM Degree_Programs WHERE department_id = (SELECT department_id FROM Departments WHERE department_name = 'engineering')
SELECT COUNT(*) FROM Degree_Programs AS T1 JOIN Departments AS T2 ON T1.department_id = T2.department_id WHERE T2.department_name = 'engineering'
SELECT section_name, section_description FROM Sections
SELECT section_name, section_description FROM Sections
SELECT c.course_id, c.course_name FROM Courses c LEFT JOIN Sections s ON c.course_id = s.course_id GROUP BY c.course_id, c.course_name HAVING COUNT(s.section_id) <= 2
SELECT c.course_id, c.course_name  FROM Courses c  LEFT JOIN Sections s ON c.course_id = s.course_id  GROUP BY c.course_id, c.course_name  HAVING COUNT(s.section_id) < 2
SELECT section_name FROM Sections ORDER BY section_name DESC
SELECT section_name FROM Sections ORDER BY section_name DESC
SELECT s.semester_id, s.semester_name FROM Semesters s JOIN Student_Enrolment se ON s.semester_id = se.semester_id GROUP BY s.semester_id, s.semester_name ORDER BY COUNT(se.student_enrolment_id) DESC LIMIT 1;
SELECT s.semester_id, s.semester_name FROM Semesters s JOIN Student_Enrolment se ON s.semester_id = se.semester_id GROUP BY s.semester_id, s.semester_name ORDER BY COUNT(se.student_id) DESC LIMIT 1;
SELECT department_description FROM Departments WHERE department_name LIKE '%computer%'
SELECT department_description FROM Departments WHERE department_name LIKE '%computer%'
SELECT s.first_name, s.middle_name, s.last_name, s.student_id FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id GROUP BY s.student_id, se.semester_id HAVING COUNT(se.degree_program_id) > 1
SELECT s.student_id, s.first_name, s.middle_name, s.last_name  FROM Students s  JOIN Student_Enrolment se ON s.student_id = se.student_id  GROUP BY s.student_id, s.first_name, s.middle_name, s.last_name  HAVING COUNT(se.degree_program_id) = 2 AND COUNT(DISTINCT se.semester_id) = 1
SELECT S.first_name, S.middle_name, S.last_name  FROM Students S  JOIN Student_Enrolment SE ON S.student_id = SE.student_id  JOIN Degree_Programs DP ON SE.degree_program_id = DP.degree_program_id  WHERE DP.degree_summary_name = 'Bachelor'
SELECT S.first_name, S.middle_name, S.last_name  FROM Students S  JOIN Student_Enrolment SE ON S.student_id = SE.student_id  JOIN Degree_Programs DP ON SE.degree_program_id = DP.degree_program_id  WHERE DP.degree_summary_name = 'Bachelor'
SELECT dp.degree_summary_name, COUNT(se.student_id) AS student_count FROM Student_Enrolment se JOIN Degree_Programs dp ON se.degree_program_id = dp.degree_program_id GROUP BY dp.degree_summary_name ORDER BY student_count DESC LIMIT 1;
SELECT dp.degree_summary_name  FROM Degree_Programs dp  JOIN Student_Enrolment se ON dp.degree_program_id = se.degree_program_id  GROUP BY dp.degree_program_id  ORDER BY COUNT(se.student_id) DESC  LIMIT 1;
SELECT dp.degree_program_id, dp.degree_summary_name  FROM Degree_Programs dp  JOIN Student_Enrolment se ON dp.degree_program_id = se.degree_program_id  GROUP BY dp.degree_program_id, dp.degree_summary_name  ORDER BY COUNT(se.student_id) DESC  LIMIT 1;
SELECT dp.degree_program_id, dp.degree_summary_name, COUNT(se.student_id) AS student_count FROM Degree_Programs dp JOIN Student_Enrolment se ON dp.degree_program_id = se.degree_program_id GROUP BY dp.degree_program_id, dp.degree_summary_name ORDER BY student_count DESC LIMIT 1;
SELECT s.student_id, s.first_name, s.middle_name, s.last_name, COUNT(se.student_enrolment_id) AS enrollment_count  FROM Students s  JOIN Student_Enrolment se ON s.student_id = se.student_id  GROUP BY s.student_id, s.first_name, s.middle_name, s.last_name  ORDER BY enrollment_count DESC  LIMIT 1;
SELECT s.first_name, s.middle_name, s.last_name, s.student_id, COUNT(se.student_enrolment_id) AS num_enrollments FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id GROUP BY s.student_id ORDER BY num_enrollments DESC LIMIT 1;
SELECT semester_name FROM Semesters WHERE semester_id NOT IN (SELECT semester_id FROM Student_Enrolment)
SELECT semester_name FROM Semesters WHERE semester_id NOT IN (SELECT semester_id FROM Student_Enrolment)
SELECT DISTINCT C.course_name  FROM Courses C  JOIN Student_Enrolment_Courses SEC  ON C.course_id = SEC.course_id;
SELECT DISTINCT course_name FROM Courses WHERE course_id IN (SELECT course_id FROM Student_Enrolment_Courses)
SELECT c.course_name  FROM Courses c  JOIN Student_Enrolment_Courses sec ON c.course_id = sec.course_id  GROUP BY c.course_id  ORDER BY COUNT(sec.student_course_id) DESC  LIMIT 1;
SELECT c.course_name  FROM Courses c  JOIN Student_Enrolment_Courses sec ON c.course_id = sec.course_id  GROUP BY c.course_id  ORDER BY COUNT(sec.student_course_id) DESC  LIMIT 1;
SELECT s.last_name  FROM Students s  LEFT JOIN Addresses a ON s.current_address_id = a.address_id  LEFT JOIN Student_Enrolment se ON s.student_id = se.student_id  WHERE a.state_province_county = 'North Carolina' AND se.student_enrolment_id IS NULL;
SELECT s.last_name  FROM Students s  JOIN Addresses a ON s.permanent_address_id = a.address_id  LEFT JOIN Student_Enrolment se ON s.student_id = se.student_id  WHERE a.state_province_county = 'North Carolina' AND se.student_enrolment_id IS NULL;
SELECT T1.transcript_id, T1.transcript_date  FROM Transcripts AS T1  JOIN Transcript_Contents AS T2 ON T1.transcript_id = T2.transcript_id  GROUP BY T1.transcript_id  HAVING COUNT(T2.student_course_id) >= 2
SELECT T.transcript_id, T.transcript_date  FROM Transcripts T  JOIN Transcript_Contents TC ON T.transcript_id = TC.transcript_id  GROUP BY T.transcript_id, T.transcript_date  HAVING COUNT(DISTINCT TC.student_course_id) >= 2
SELECT cell_mobile_number FROM Students WHERE first_name = 'Timmothy' AND last_name = 'Ward'
SELECT cell_mobile_number FROM Students WHERE first_name = 'Timmothy' AND last_name = 'Ward'
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_first_registered ASC LIMIT 1
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_first_registered ASC LIMIT 1
SELECT s.first_name, s.middle_name, s.last_name FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id WHERE se.semester_id = (     SELECT MIN(semester_id)     FROM Student_Enrolment )
SELECT s.first_name, s.middle_name, s.last_name  FROM Students s  JOIN Student_Enrolment se ON s.student_id = se.student_id  WHERE se.semester_id = (SELECT MIN(semester_id) FROM Semesters)  AND s.date_left IS NOT NULL  ORDER BY s.date_left ASC  LIMIT 1;
SELECT first_name  FROM Students  WHERE current_address_id != permanent_address_id
SELECT first_name FROM Students WHERE current_address_id != permanent_address_id
SELECT a.address_id, a.line_1, a.line_2, a.line_3 FROM Addresses a JOIN Students s ON a.address_id = s.current_address_id GROUP BY a.address_id, a.line_1, a.line_2, a.line_3 ORDER BY COUNT(s.student_id) DESC LIMIT 1;
SELECT `address_id`, `line_1`, `line_2`  FROM `Addresses`  WHERE `address_id` = (     SELECT `current_address_id`      FROM `Students`      GROUP BY `current_address_id`      ORDER BY COUNT(`student_id`) DESC      LIMIT 1 )
SELECT AVG(transcript_date) FROM Transcripts
SELECT AVG(strftime('%s', transcript_date)) FROM Transcripts
SELECT transcript_date, other_details FROM Transcripts ORDER BY transcript_date ASC LIMIT 1
SELECT MIN(transcript_date) AS earliest_date, other_details  FROM Transcripts;
SELECT COUNT(transcript_id) FROM Transcripts
SELECT COUNT(*) FROM Transcripts
SELECT MAX(transcript_date) FROM Transcripts
SELECT MAX(transcript_date) FROM Transcripts
SELECT student_course_id, COUNT(*) AS times_shown FROM Transcript_Contents GROUP BY student_course_id ORDER BY times_shown DESC LIMIT 1;
SELECT MAX(t1.course_count), t1.student_course_id  FROM (     SELECT sec.student_course_id, COUNT(tc.transcript_id) AS course_count      FROM Student_Enrolment_Courses sec      JOIN Transcript_Contents tc ON sec.student_course_id = tc.student_course_id      GROUP BY sec.student_course_id ) t1
SELECT `transcript_id`, `transcript_date`  FROM `Transcripts`  WHERE `transcript_id` = (     SELECT `transcript_id`      FROM `Transcript_Contents`      GROUP BY `transcript_id`      ORDER BY COUNT(*)      LIMIT 1 )
SELECT t.transcript_id, t.transcript_date  FROM Transcripts t  JOIN Transcript_Contents tc ON t.transcript_id = tc.transcript_id  GROUP BY t.transcript_id, t.transcript_date  ORDER BY COUNT(tc.student_course_id) ASC  LIMIT 1;
SELECT s.semester_name  FROM Semesters s  JOIN Student_Enrolment se ON s.semester_id = se.semester_id  JOIN Degree_Programs dp ON se.degree_program_id = dp.degree_program_id  WHERE dp.degree_summary_name IN ('Master', 'Bachelor')  GROUP BY s.semester_name  HAVING COUNT(DISTINCT dp.degree_summary_name) = 2
SELECT DISTINCT s.semester_id  FROM Semesters s JOIN Student_Enrolment se ON s.semester_id = se.semester_id JOIN Degree_Programs dp ON se.degree_program_id = dp.degree_program_id WHERE dp.degree_summary_name IN ('Master', 'Bachelor') GROUP BY s.semester_id HAVING COUNT(DISTINCT dp.degree_summary_name) = 2;
SELECT COUNT(DISTINCT current_address_id) FROM Students
SELECT DISTINCT a.* FROM Addresses a JOIN Students s ON a.address_id = s.current_address_id OR a.address_id = s.permanent_address_id
SELECT * FROM Students ORDER BY last_name DESC, first_name DESC, middle_name DESC
SELECT other_student_details FROM Students ORDER BY last_name DESC, first_name DESC, middle_name DESC
SELECT section_description FROM Sections WHERE section_name = 'h'
SELECT section_description FROM Sections WHERE section_name = 'h'
SELECT first_name FROM Students WHERE permanent_address_id IN (SELECT address_id FROM Addresses WHERE country = 'Haiti') OR cell_mobile_number = '09700166582'
SELECT first_name FROM Students WHERE permanent_address_id IN (SELECT address_id FROM Addresses WHERE country = 'Haiti') OR cell_mobile_number = '09700166582'
SELECT Title FROM Cartoon ORDER BY Title ASC
SELECT Title FROM Cartoon ORDER BY Title ASC
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones'
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones'
SELECT COUNT(*) FROM Cartoon WHERE Written_by = 'Joseph Kuhr'
SELECT COUNT(*) FROM Cartoon WHERE Written_by = 'Joseph Kuhr'
SELECT C.Title, C.Directed_by  FROM Cartoon C  ORDER BY C.Original_air_date
SELECT C.Title, C.Directed_by FROM Cartoon C ORDER BY C.Original_air_date
SELECT Title FROM Cartoon WHERE Directed_by IN ('Ben Jones', 'Brandon Vietti')
SELECT Title FROM Cartoon WHERE Directed_by IN ('Ben Jones', 'Brandon Vietti')
SELECT Country, COUNT(id) AS NumberOfChannels FROM TV_Channel GROUP BY Country ORDER BY NumberOfChannels DESC LIMIT 1
SELECT Country, COUNT(id) AS Channel_Count FROM TV_Channel GROUP BY Country ORDER BY Channel_Count DESC LIMIT 1
SELECT COUNT(DISTINCT series_name), COUNT(DISTINCT Content) FROM TV_Channel
SELECT COUNT(DISTINCT series_name), COUNT(DISTINCT Content) FROM TV_Channel
SELECT Content FROM TV_Channel WHERE series_name = 'Sky Radio'
SELECT Content FROM TV_Channel WHERE series_name = 'Sky Radio'
SELECT Package_Option FROM TV_Channel WHERE series_name = 'Sky Radio'
SELECT Package_Option FROM TV_Channel WHERE series_name = 'Sky Radio'
SELECT COUNT(*) FROM TV_Channel WHERE Language = 'English'
SELECT COUNT(id) FROM TV_Channel WHERE Language = 'English'
SELECT `Language`, COUNT(`id`) AS `Channel_Count`  FROM `TV_Channel`  GROUP BY `Language`  ORDER BY `Channel_Count`  LIMIT 1;
SELECT `Language`, COUNT(`id`) AS `Channel_Count`  FROM `TV_Channel`  GROUP BY `Language`  ORDER BY `Channel_Count` ASC  LIMIT 1;
SELECT Language, COUNT(id) FROM TV_Channel GROUP BY Language
SELECT Language, COUNT(*) FROM TV_Channel GROUP BY Language
SELECT TV_Channel.series_name FROM Cartoon JOIN TV_Channel ON Cartoon.Channel = TV_Channel.id WHERE Cartoon.Title = 'The Rise of the Blue Beetle!'
SELECT TV_Channel.series_name FROM TV_Channel JOIN Cartoon ON TV_Channel.id = Cartoon.Channel WHERE Cartoon.Title = 'The Rise of the Blue Beetle'
SELECT C.Title FROM Cartoon C JOIN TV_Channel T ON C.Channel = T.id WHERE T.series_name = 'Sky Radio'
SELECT T1.Title FROM Cartoon AS T1 JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T2.series_name = 'Sky Radio'
SELECT Episode FROM TV_series ORDER BY Rating
SELECT Episode FROM TV_series ORDER BY Rating
SELECT Episode, Rating FROM TV_series ORDER BY Rating DESC LIMIT 3
SELECT Episode, Rating FROM TV_series ORDER BY Rating DESC LIMIT 3
SELECT MIN(Share) AS Min_Share, MAX(Share) AS Max_Share FROM TV_series
SELECT MAX(Share) AS Max_Share, MIN(Share) AS Min_Share FROM TV_series
SELECT Air_Date FROM TV_series WHERE Episode = "A Love of a Lifetime"
SELECT Air_Date FROM TV_series WHERE Episode = "A Love of a Lifetime"
SELECT Weekly_Rank FROM TV_series WHERE Episode = "A Love of a Lifetime"
SELECT Weekly_Rank FROM TV_series WHERE Episode = 'A Love of a Lifetime'
SELECT TV_Channel.series_name FROM TV_Channel JOIN TV_series ON TV_Channel.id = TV_series.Channel WHERE TV_series.Episode = "A Love of a Lifetime"
SELECT T1.series_name FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T2.Episode = "A Love of a Lifetime"
SELECT Episode FROM TV_series WHERE Channel IN (SELECT id FROM TV_Channel WHERE series_name = 'Sky Radio')
SELECT Episode FROM TV_series WHERE Channel IN (SELECT id FROM TV_Channel WHERE series_name = 'Sky Radio')
SELECT Directed_by, COUNT(*) FROM Cartoon GROUP BY Directed_by
SELECT Directed_by, COUNT(*) FROM Cartoon GROUP BY Directed_by
SELECT Production_code, Channel FROM Cartoon ORDER BY Original_air_date DESC LIMIT 1
SELECT Production_code, Channel FROM Cartoon WHERE Original_air_date = (SELECT MAX(Original_air_date) FROM Cartoon)
SELECT Package_Option, series_name FROM TV_Channel WHERE Hight_definition_TV = 'Yes'
SELECT T1.Package_Option, T1.series_name FROM TV_Channel AS T1 WHERE T1.Hight_definition_TV = 'Yes'
SELECT DISTINCT TV_Channel.Country FROM Cartoon JOIN TV_Channel ON Cartoon.Channel = TV_Channel.id WHERE Cartoon.Written_by = 'Todd Casey'
SELECT DISTINCT TV_Channel.Country  FROM Cartoon  JOIN TV_Channel ON Cartoon.Channel = TV_Channel.id  WHERE Cartoon.Written_by = 'Todd Casey'
SELECT Country FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Written_by = 'Todd Casey')
SELECT DISTINCT Country FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Written_by = 'Todd Casey')
SELECT DISTINCT TV_Channel.series_name, TV_Channel.Country  FROM TV_Channel  JOIN Cartoon ON TV_Channel.id = Cartoon.Channel  WHERE Cartoon.Directed_by IN ('Ben Jones', 'Michael Chang')
SELECT DISTINCT T1.series_name, T1.Country FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Directed_by = 'Ben Jones' INTERSECT SELECT DISTINCT T1.series_name, T1.Country FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Directed_by = 'Michael Chang'
SELECT Pixel_aspect_ratio_PAR, Country FROM TV_Channel WHERE Language != 'English'
SELECT Pixel_aspect_ratio_PAR, Country FROM TV_Channel WHERE Language != 'English'
SELECT id FROM TV_Channel WHERE Country IN (SELECT Country FROM TV_Channel GROUP BY Country HAVING COUNT(id) > 2)
SELECT id FROM TV_Channel GROUP BY id HAVING COUNT(id) > 2
SELECT id FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones')
SELECT id FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones')
SELECT Package_Option FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones')
SELECT Package_Option FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones')
SELECT COUNT(*) FROM poker_player
SELECT COUNT(*) FROM poker_player
SELECT Earnings FROM poker_player ORDER BY Earnings DESC
SELECT Earnings FROM poker_player ORDER BY Earnings DESC
SELECT Final_Table_Made, Best_Finish FROM poker_player
SELECT Final_Table_Made, Best_Finish FROM poker_player
SELECT AVG(Earnings) FROM poker_player
SELECT AVG(Earnings) FROM poker_player
SELECT Money_Rank FROM poker_player ORDER BY Earnings DESC LIMIT 1
SELECT Money_Rank FROM poker_player ORDER BY Earnings DESC LIMIT 1
SELECT MAX(Final_Table_Made) FROM poker_player WHERE Earnings < 200000
SELECT MAX(Final_Table_Made) FROM poker_player WHERE Earnings < 200000
SELECT p.Name FROM people p JOIN poker_player pp ON p.People_ID = pp.People_ID
SELECT p.Name FROM people p JOIN poker_player pp ON p.People_ID = pp.People_ID
SELECT p.Name FROM people p JOIN poker_player pp ON p.People_ID = pp.People_ID WHERE pp.Earnings > 300000
SELECT p.Name  FROM people p  JOIN poker_player pp ON p.People_ID = pp.People_ID  WHERE pp.Earnings > 300000;
SELECT p.Name  FROM people p  JOIN poker_player pp ON p.People_ID = pp.People_ID  ORDER BY pp.Final_Table_Made ASC
SELECT p.Name  FROM people p  JOIN poker_player pp ON p.People_ID = pp.People_ID  ORDER BY pp.Final_Table_Made ASC
SELECT t2.Birth_Date FROM poker_player AS t1 JOIN people AS t2 ON t1.People_ID = t2.People_ID ORDER BY t1.Earnings ASC LIMIT 1
SELECT `Birth_Date` FROM `people` WHERE `People_ID` = (SELECT `People_ID` FROM `poker_player` ORDER BY `Earnings` ASC LIMIT 1)
SELECT pp.Money_Rank FROM poker_player pp JOIN people p ON pp.People_ID = p.People_ID WHERE p.Height = (SELECT MAX(Height) FROM people)
SELECT Money_Rank FROM poker_player WHERE People_ID = (SELECT People_ID FROM people ORDER BY Height DESC LIMIT 1)
SELECT AVG(pp.Earnings)  FROM poker_player pp  JOIN people p ON pp.People_ID = p.People_ID  WHERE p.Height > 200;
SELECT AVG(pp.Earnings)  FROM poker_player pp  JOIN people p ON pp.People_ID = p.People_ID  WHERE p.Height > 200;
SELECT p.Name  FROM people p  JOIN poker_player pp ON p.People_ID = pp.People_ID  ORDER BY pp.Earnings DESC
SELECT p.Name FROM people p JOIN poker_player pp ON p.People_ID = pp.People_ID ORDER BY pp.Earnings DESC
SELECT Nationality, COUNT(*) FROM people GROUP BY Nationality
SELECT Nationality, COUNT(*) FROM people GROUP BY Nationality
SELECT Nationality FROM people GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT Nationality  FROM people  GROUP BY Nationality  ORDER BY COUNT(*) DESC  LIMIT 1
SELECT Nationality FROM people GROUP BY Nationality HAVING COUNT(Nationality) > 1
SELECT Nationality FROM people GROUP BY Nationality HAVING COUNT(*) >= 2
SELECT Name, Birth_Date FROM people ORDER BY Name ASC
SELECT Name, Birth_Date FROM people ORDER BY Name ASC
SELECT Name FROM people WHERE Nationality != 'Russia'
SELECT Name FROM people WHERE Nationality != 'Russia'
SELECT Name FROM people WHERE People_ID NOT IN (SELECT People_ID FROM poker_player)
SELECT Name FROM people WHERE People_ID NOT IN (SELECT People_ID FROM poker_player)
SELECT COUNT(DISTINCT Nationality) FROM people
SELECT COUNT(DISTINCT Nationality) FROM people
SELECT COUNT(DISTINCT state) FROM AREA_CODE_STATE
SELECT C.contestant_number, C.contestant_name  FROM CONTESTANTS C  ORDER BY C.contestant_name DESC
SELECT vote_id, phone_number, state FROM VOTES
SELECT MIN(area_code) AS min_area_code, MAX(area_code) AS max_area_code FROM AREA_CODE_STATE
SELECT MAX(created) FROM VOTES WHERE state = 'CA'
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name != 'Jessie Alloway'
SELECT DISTINCT state, created FROM VOTES
SELECT C.contestant_number, C.contestant_name  FROM CONTESTANTS C  JOIN VOTES V ON C.contestant_number = V.contestant_number  GROUP BY C.contestant_number, C.contestant_name  HAVING COUNT(V.vote_id) >= 2;
SELECT C.contestant_number, C.contestant_name  FROM CONTESTANTS C  JOIN VOTES V ON C.contestant_number = V.contestant_number  GROUP BY C.contestant_number, C.contestant_name  ORDER BY COUNT(V.vote_id) ASC  LIMIT 1;
SELECT COUNT(*) FROM VOTES WHERE state IN ('NY', 'CA')
SELECT COUNT(*) FROM CONTESTANTS WHERE contestant_number NOT IN (SELECT contestant_number FROM VOTES)
SELECT area_code FROM AREA_CODE_STATE WHERE state IN (SELECT state FROM VOTES GROUP BY state ORDER BY COUNT(*) DESC LIMIT 1)
SELECT V.created, V.state, V.phone_number  FROM VOTES V  JOIN CONTESTANTS C ON V.contestant_number = C.contestant_number  WHERE C.contestant_name = 'Tabatha Gehling'
SELECT DISTINCT acs1.area_code FROM AREA_CODE_STATE acs1 JOIN VOTES v1 ON acs1.state = v1.state JOIN CONTESTANTS c1 ON v1.contestant_number = c1.contestant_number JOIN AREA_CODE_STATE acs2 ON acs1.state = acs2.state JOIN VOTES v2 ON acs2.state = v2.state JOIN CONTESTANTS c2 ON v2.contestant_number = c2.contestant_number WHERE c1.contestant_name = 'Tabatha Gehling' AND c2.contestant_name = 'Kelly Clauss' AND v1.phone_number != v2.phone_number;
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name LIKE '%Al%'
SELECT Name FROM country WHERE IndepYear > 1950
SELECT Name FROM country WHERE IndepYear > 1950
SELECT COUNT(*) FROM country WHERE GovernmentForm = 'Republic'
SELECT COUNT(*) FROM country WHERE GovernmentForm = 'Republic'
SELECT SUM(SurfaceArea) FROM country WHERE Region = 'Caribbean'
SELECT SUM(SurfaceArea) FROM country WHERE Region = 'Caribbean'
SELECT Continent FROM country WHERE Name = 'Anguilla'
SELECT Continent FROM country WHERE Name = 'Anguilla'
SELECT T2.Region FROM city AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T1.Name = 'Kabul'
SELECT District FROM city WHERE Name = 'Kabul'
SELECT Language  FROM countrylanguage  WHERE CountryCode = 'ABW'  ORDER BY Percentage DESC  LIMIT 1;
SELECT Language  FROM countrylanguage  WHERE CountryCode = 'ABW'  ORDER BY Percentage DESC  LIMIT 1;
SELECT Population, LifeExpectancy FROM country WHERE Code = 'BRA'
SELECT Population, LifeExpectancy FROM country WHERE Code = 'BRA'
SELECT Region, Population FROM country WHERE Name = 'Angola'
SELECT Region, Population FROM country WHERE Name = 'Angola'
SELECT AVG(LifeExpectancy) FROM country WHERE Region = 'Central Africa'
SELECT AVG(LifeExpectancy) FROM country WHERE Region = 'Central Africa'
SELECT Name FROM country WHERE Continent = 'Asia' AND LifeExpectancy = (SELECT MIN(LifeExpectancy) FROM country WHERE Continent = 'Asia')
SELECT Name FROM country WHERE Continent = 'Asia' AND LifeExpectancy = (SELECT MIN(LifeExpectancy) FROM country WHERE Continent = 'Asia')
SELECT SUM(country.Population) AS TotalPopulation, MAX(country.GNP) AS MaxGNP  FROM country  WHERE country.Continent = 'Asia'
SELECT SUM(city.Population) AS TotalPopulation, MAX(country.GNP) AS MaxGNP FROM city JOIN country ON city.CountryCode = country.Code WHERE country.Continent = 'Asia'
SELECT AVG(LifeExpectancy) FROM country WHERE Continent = 'Africa' AND GovernmentForm = 'Republic'
SELECT AVG(LifeExpectancy) FROM country WHERE Continent = 'Africa' AND GovernmentForm = 'Republic'
SELECT SUM(SurfaceArea) FROM country WHERE Continent IN ('Asia', 'Europe')
SELECT SUM(SurfaceArea) FROM country WHERE Continent IN ('Asia', 'Europe')
SELECT SUM(Population) FROM city WHERE District = 'Gelderland'
SELECT SUM(Population) FROM city WHERE District = 'Gelderland'
SELECT AVG(GNP), SUM(Population) FROM country WHERE GovernmentForm = 'US Territory'
SELECT AVG(GNP), SUM(Population) FROM country WHERE GovernmentForm LIKE '%US Territory%'
SELECT COUNT(DISTINCT Language) FROM countrylanguage
SELECT COUNT(DISTINCT Language) FROM countrylanguage
SELECT COUNT(DISTINCT GovernmentForm) FROM country WHERE Continent = 'Africa'
SELECT COUNT(DISTINCT GovernmentForm) FROM country WHERE Continent = 'Africa'
SELECT COUNT(Language) FROM countrylanguage WHERE CountryCode = 'ABW'
SELECT COUNT(Language) FROM countrylanguage WHERE CountryCode = 'ABW'
SELECT COUNT(*) FROM countrylanguage WHERE CountryCode = 'AFG' AND IsOfficial = 'T'
SELECT COUNT(*) FROM countrylanguage WHERE CountryCode = 'AFG' AND IsOfficial = 'T'
SELECT c.Name  FROM country c  JOIN (     SELECT CountryCode, COUNT(*) as lang_count      FROM countrylanguage      GROUP BY CountryCode ) cl ON c.Code = cl.CountryCode  ORDER BY cl.lang_count DESC  LIMIT 1;
SELECT c.Name  FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode GROUP BY c.Name ORDER BY COUNT(cl.Language) DESC LIMIT 1;
SELECT c.Continent, COUNT(DISTINCT cl.Language) AS LanguageCount FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode GROUP BY c.Continent ORDER BY LanguageCount DESC LIMIT 1;
SELECT T2.Continent FROM countrylanguage AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code GROUP BY T2.Continent ORDER BY COUNT(DISTINCT T1.Language) DESC LIMIT 1
SELECT COUNT(DISTINCT cl1.CountryCode)  FROM countrylanguage cl1  JOIN countrylanguage cl2  ON cl1.CountryCode = cl2.CountryCode  WHERE cl1.Language = 'English' AND cl2.Language = 'Dutch'
SELECT COUNT(DISTINCT CountryCode)  FROM countrylanguage  WHERE Language IN ('English', 'Dutch')  GROUP BY CountryCode  HAVING COUNT(DISTINCT Language) = 2
SELECT c.Name  FROM country c  JOIN countrylanguage cl1 ON c.Code = cl1.CountryCode  JOIN countrylanguage cl2 ON c.Code = cl2.CountryCode  WHERE cl1.Language = 'English' AND cl2.Language = 'French';
SELECT c.Name FROM country c WHERE c.Code IN (SELECT cl1.CountryCode FROM countrylanguage cl1 WHERE cl1.Language = 'English' AND cl1.CountryCode IN (SELECT cl2.CountryCode FROM countrylanguage cl2 WHERE cl2.Language = 'French'))
SELECT c.Name FROM country c JOIN countrylanguage cl1 ON c.Code = cl1.CountryCode JOIN countrylanguage cl2 ON c.Code = cl2.CountryCode WHERE cl1.Language = 'English' AND cl1.IsOfficial = 'T' AND cl2.Language = 'French' AND cl2.IsOfficial = 'T'
SELECT c.Name FROM country c WHERE c.Code IN (SELECT cl.CountryCode FROM countrylanguage cl WHERE cl.Language = 'English' AND cl.IsOfficial = 'T') AND c.Code IN (SELECT cl.CountryCode FROM countrylanguage cl WHERE cl.Language = 'French' AND cl.IsOfficial = 'T')
SELECT COUNT(DISTINCT T1.Continent) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'Chinese'
SELECT COUNT(DISTINCT c.Continent)  FROM country AS c  JOIN countrylanguage AS cl ON c.Code = cl.CountryCode  WHERE cl.Language = 'Chinese';
SELECT DISTINCT c.Region  FROM country c  JOIN countrylanguage cl ON c.Code = cl.CountryCode  WHERE cl.Language IN ('English', 'Dutch')
SELECT DISTINCT c.Region  FROM country c  JOIN countrylanguage cl ON c.Code = cl.CountryCode  WHERE cl.Language IN ('Dutch', 'English')
SELECT c.Name FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE (cl.Language = 'English' OR cl.Language = 'Dutch') AND cl.IsOfficial = 'T'
SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE (T2.Language = 'English' OR T2.Language = 'Dutch') AND T2.IsOfficial = 'T'
SELECT cl.Language  FROM countrylanguage cl  JOIN country c ON cl.CountryCode = c.Code  WHERE c.Continent = 'Asia'  GROUP BY cl.Language  ORDER BY SUM(cl.Percentage) DESC  LIMIT 1;
SELECT `Language`  FROM `countrylanguage`  JOIN `country` ON `countrylanguage.CountryCode` = `country.Code`  WHERE `country.Continent` = 'Asia'  GROUP BY `Language`  ORDER BY COUNT(`countrylanguage.CountryCode`) DESC  LIMIT 1;
SELECT cl.Language  FROM countrylanguage cl  JOIN country c ON cl.CountryCode = c.Code  WHERE c.GovernmentForm = 'Republic'  GROUP BY cl.Language  HAVING COUNT(cl.CountryCode) = 1
SELECT cl.Language  FROM countrylanguage cl  JOIN country c ON cl.CountryCode = c.Code  WHERE c.GovernmentForm LIKE '%Republic%'  GROUP BY cl.Language  HAVING COUNT(cl.CountryCode) = 1
SELECT c.Name  FROM city c  JOIN countrylanguage cl ON c.CountryCode = cl.CountryCode  WHERE cl.Language = 'English'  ORDER BY c.Population DESC  LIMIT 1;
SELECT c.Name, c.Population  FROM city c  JOIN country co ON c.CountryCode = co.Code  JOIN countrylanguage cl ON co.Code = cl.CountryCode  WHERE cl.Language = 'English'  ORDER BY c.Population DESC  LIMIT 1;
SELECT Name, Population, LifeExpectancy  FROM country  WHERE Continent = 'Asia'  ORDER BY SurfaceArea DESC  LIMIT 1;
SELECT Name, Population, LifeExpectancy FROM country WHERE Continent = 'Asia' ORDER BY SurfaceArea DESC LIMIT 1
SELECT AVG(LifeExpectancy) FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English' AND IsOfficial = 'T')
SELECT AVG(LifeExpectancy) FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English' AND IsOfficial = 'T')
SELECT SUM(Population) FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English')
SELECT SUM(Population) FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English')
SELECT T2.Language FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.HeadOfState = 'Beatrix' AND T2.IsOfficial = 'T'
SELECT cl.Language  FROM country AS c  JOIN countrylanguage AS cl ON c.Code = cl.CountryCode  WHERE c.HeadOfState = 'Beatrix' AND cl.IsOfficial = 'T'
SELECT COUNT(DISTINCT Language)  FROM countrylanguage  WHERE IsOfficial = 'T'  AND CountryCode IN (     SELECT Code      FROM country      WHERE IndepYear < 1930 )
SELECT COUNT(DISTINCT T2.Language)  FROM country AS T1  JOIN countrylanguage AS T2  ON T1.Code = T2.CountryCode  WHERE T1.IndepYear < 1930 AND T2.IsOfficial = 'T'
SELECT Code, Name, SurfaceArea FROM country WHERE SurfaceArea > (SELECT MAX(SurfaceArea) FROM country WHERE Continent = 'Europe')
SELECT Code, Name, SurfaceArea FROM country WHERE SurfaceArea > (SELECT MAX(SurfaceArea) FROM country WHERE Continent = 'Europe')
SELECT Name FROM country WHERE Continent = 'Africa' AND Population < (SELECT MIN(Population) FROM country WHERE Continent = 'Asia')
SELECT c1.Name  FROM country c1  WHERE c1.Continent = 'Africa'  AND c1.Population < ALL (     SELECT c2.Population      FROM country c2      WHERE c2.Continent = 'Asia' )
SELECT Code, Name, Population FROM country WHERE Continent = 'Asia' AND Population > (SELECT MAX(Population) FROM country WHERE Continent = 'Africa')
SELECT Name FROM country WHERE Continent = 'Asia' AND Population > (SELECT MAX(Population) FROM country WHERE Continent = 'Africa')
SELECT Code FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English')
SELECT Code FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English')
SELECT DISTINCT CountryCode FROM countrylanguage WHERE Language != 'English'
SELECT DISTINCT CountryCode FROM countrylanguage WHERE Language != 'English'
SELECT Code FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English') AND GovernmentForm != 'Republic'
SELECT Code FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English') AND GovernmentForm NOT LIKE '%Republic%'
SELECT c1.Name  FROM city c1  JOIN country c2 ON c1.CountryCode = c2.Code  JOIN countrylanguage cl ON c2.Code = cl.CountryCode  WHERE c2.Continent = 'Europe'  AND cl.Language = 'English'  AND cl.IsOfficial = 'F'  GROUP BY c1.Name
SELECT c.Name FROM city c JOIN country co ON c.CountryCode = co.Code WHERE co.Continent = 'Europe' AND co.Code NOT IN (SELECT cl.CountryCode FROM countrylanguage cl WHERE cl.Language = 'English' AND cl.IsOfficial = 'T')
SELECT DISTINCT c.Name  FROM city c  JOIN country co ON c.CountryCode = co.Code  JOIN countrylanguage cl ON co.Code = cl.CountryCode  WHERE co.Continent = 'Asia' AND cl.Language = 'Chinese' AND cl.IsOfficial = 'T'
SELECT DISTINCT c.Name  FROM city c  JOIN country co ON c.CountryCode = co.Code  JOIN countrylanguage cl ON cl.CountryCode = co.Code  WHERE co.Continent = 'Asia' AND cl.Language = 'Chinese' AND cl.IsOfficial = 'T'
SELECT Name, IndepYear, SurfaceArea FROM country WHERE Population = (SELECT MIN(Population) FROM country)
SELECT Name, IndepYear, SurfaceArea FROM country WHERE Population = (SELECT MIN(Population) FROM country)
SELECT c.Population, c.Name, c.HeadOfState  FROM country c  WHERE c.SurfaceArea = (SELECT MAX(SurfaceArea) FROM country)
SELECT c.Name, c.Population, c.HeadOfState  FROM country c  WHERE c.SurfaceArea = (SELECT MAX(SurfaceArea) FROM country)
SELECT c.Name, COUNT(cl.Language) AS NumberOfLanguages FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode GROUP BY c.Name HAVING COUNT(cl.Language) >= 3;
SELECT c.Name, COUNT(cl.Language) AS NumberOfLanguages FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode GROUP BY c.Code HAVING COUNT(cl.Language) > 2;
SELECT District, COUNT(*)  FROM city  WHERE Population > (SELECT AVG(Population) FROM city)  GROUP BY District;
SELECT District, COUNT(*)  FROM city  WHERE Population > (SELECT AVG(Population) FROM city)  GROUP BY District;
SELECT T1.GovernmentForm, SUM(T1.Population)  FROM country AS T1  GROUP BY T1.GovernmentForm  HAVING AVG(T1.LifeExpectancy) > 72
SELECT T1.GovernmentForm, SUM(T1.Population)  FROM country AS T1  JOIN city AS T2 ON T1.Code = T2.CountryCode  WHERE T1.LifeExpectancy > 72  GROUP BY T1.GovernmentForm
SELECT T1.Continent, AVG(T1.LifeExpectancy) AS average_life_expectancy, SUM(T1.Population) AS total_population FROM country AS T1 JOIN city AS T2 ON T1.Code = T2.CountryCode GROUP BY T1.Continent HAVING AVG(T1.LifeExpectancy) < 72
SELECT Continent, SUM(Population) AS TotalPopulation, AVG(LifeExpectancy) AS AverageLifeExpectancy  FROM country  GROUP BY Continent  HAVING AVG(LifeExpectancy) < 72
SELECT Name, SurfaceArea FROM country ORDER BY SurfaceArea DESC LIMIT 5
SELECT Name, SurfaceArea FROM country ORDER BY SurfaceArea DESC LIMIT 5
SELECT Name FROM country ORDER BY Population DESC LIMIT 3
SELECT Name FROM country ORDER BY Population DESC LIMIT 3
SELECT Name FROM country ORDER BY Population ASC LIMIT 3
SELECT Name FROM country ORDER BY Population ASC LIMIT 3
SELECT COUNT(*) FROM country WHERE Continent = 'Asia'
SELECT COUNT(*) FROM country WHERE Continent = 'Asia'
SELECT T1.Name FROM country AS T1 JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T1.Continent = 'Europe' AND T2.Population = 80000
SELECT Name FROM country WHERE Continent = 'Europe' AND Population = 80000
SELECT SUM(Population) AS TotalPopulation, AVG(SurfaceArea) AS AverageArea  FROM country  WHERE Continent = 'North America' AND SurfaceArea > 3000;
SELECT SUM(c.Population) AS TotalPopulation, AVG(c.SurfaceArea) AS AverageSurfaceArea FROM country c WHERE c.Continent = 'North America' AND c.SurfaceArea > 3000;
SELECT Name, Population FROM city WHERE Population BETWEEN 160000 AND 900000
SELECT Name FROM city WHERE Population BETWEEN 160000 AND 900000
SELECT Language FROM countrylanguage GROUP BY Language ORDER BY COUNT(DISTINCT CountryCode) DESC LIMIT 1
SELECT `Language` FROM `countrylanguage` GROUP BY `Language` ORDER BY COUNT(`CountryCode`) DESC LIMIT 1
SELECT cl.CountryCode, cl.Language, cl.Percentage FROM countrylanguage cl JOIN (     SELECT CountryCode, MAX(Percentage) as MaxPercentage     FROM countrylanguage     GROUP BY CountryCode ) cl2 ON cl.CountryCode = cl2.CountryCode AND cl.Percentage = cl2.MaxPercentage;
SELECT T1.CountryCode, T2.Language  FROM (SELECT CountryCode, MAX(Percentage) AS MaxPercentage FROM countrylanguage GROUP BY CountryCode) AS T1  JOIN countrylanguage AS T2  ON T1.CountryCode = T2.CountryCode AND T1.MaxPercentage = T2.Percentage
SELECT COUNT(*)  FROM (     SELECT CountryCode     FROM countrylanguage     WHERE Language = 'Spanish'     GROUP BY CountryCode     HAVING Percentage = (         SELECT MAX(Percentage)         FROM countrylanguage AS cl2         WHERE cl2.CountryCode = countrylanguage.CountryCode     ) ) AS spanish_countries
SELECT COUNT(CountryCode) FROM countrylanguage WHERE Language = 'Spanish' AND Percentage = (SELECT MAX(Percentage) FROM countrylanguage WHERE Language = 'Spanish')
SELECT CountryCode FROM countrylanguage WHERE Language = 'Spanish' ORDER BY Percentage DESC LIMIT 1
SELECT CountryCode FROM countrylanguage WHERE Language = 'Spanish' AND Percentage > 50
SELECT COUNT(Conductor_ID) FROM conductor
SELECT COUNT(*) FROM conductor
SELECT Name FROM conductor ORDER BY Age ASC
SELECT Name FROM conductor ORDER BY Age
SELECT Name FROM conductor WHERE Nationality != 'USA'
SELECT Name FROM conductor WHERE Nationality != 'USA'
SELECT Record_Company FROM orchestra ORDER BY Year_of_Founded DESC
SELECT Record_Company FROM orchestra ORDER BY Year_of_Founded DESC
SELECT AVG(Attendance) FROM show
SELECT AVG(Attendance) FROM show
SELECT MAX(Official_ratings_(millions)) AS max_share, MIN(Official_ratings_(millions)) AS min_share  FROM performance  WHERE Type != 'Live final'
SELECT MAX(Share), MIN(Share) FROM performance WHERE Type != 'Live final'
SELECT COUNT(DISTINCT Nationality) FROM conductor
SELECT COUNT(DISTINCT Nationality) FROM conductor
SELECT Name FROM conductor ORDER BY Year_of_Work DESC
SELECT `Name` FROM `conductor` ORDER BY `Year_of_Work` DESC
SELECT Name FROM conductor WHERE Year_of_Work = (SELECT MAX(Year_of_Work) FROM conductor)
SELECT Name FROM conductor WHERE Year_of_Work = (SELECT MAX(Year_of_Work) FROM conductor)
SELECT c.Name, o.Orchestra FROM conductor c JOIN orchestra o ON c.Conductor_ID = o.Conductor_ID
SELECT c.Name, o.Orchestra  FROM conductor c  JOIN orchestra o ON c.Conductor_ID = o.Conductor_ID;
SELECT c.Name  FROM conductor c  JOIN orchestra o ON c.Conductor_ID = o.Conductor_ID  GROUP BY c.Name  HAVING COUNT(DISTINCT o.Orchestra_ID) > 1;
SELECT Name FROM conductor WHERE Conductor_ID IN (SELECT Conductor_ID FROM orchestra GROUP BY Conductor_ID HAVING COUNT(Orchestra_ID) > 1)
SELECT `Name` FROM `conductor` WHERE `Conductor_ID` = (SELECT `Conductor_ID` FROM `orchestra` GROUP BY `Conductor_ID` ORDER BY COUNT(`Orchestra_ID`) DESC LIMIT 1)
SELECT `Name` FROM `conductor` WHERE `Conductor_ID` = (SELECT `Conductor_ID` FROM `orchestra` GROUP BY `Conductor_ID` ORDER BY COUNT(`Orchestra_ID`) DESC LIMIT 1)
SELECT DISTINCT c.Name  FROM conductor c  JOIN orchestra o ON c.Conductor_ID = o.Conductor_ID  WHERE o.Year_of_Founded > 2008;
SELECT DISTINCT c.Name  FROM conductor c  JOIN orchestra o ON c.Conductor_ID = o.Conductor_ID  WHERE o.Year_of_Founded > 2008;
SELECT Record_Company, COUNT(*) FROM orchestra GROUP BY Record_Company
SELECT Record_Company, COUNT(*) FROM orchestra GROUP BY Record_Company
SELECT `Major_Record_Format`, COUNT(*) AS `Count`  FROM `orchestra`  GROUP BY `Major_Record_Format`  ORDER BY `Count` ASC;
SELECT Major_Record_Format, COUNT(*) AS Frequency  FROM orchestra  GROUP BY Major_Record_Format  ORDER BY Frequency DESC;
SELECT Record_Company FROM orchestra GROUP BY Record_Company ORDER BY COUNT(*) DESC LIMIT 1
SELECT Record_Company FROM orchestra GROUP BY Record_Company ORDER BY COUNT(*) DESC LIMIT 1
SELECT Orchestra FROM orchestra WHERE Orchestra_ID NOT IN (SELECT Orchestra_ID FROM performance)
SELECT Orchestra FROM orchestra WHERE Orchestra_ID NOT IN (SELECT Orchestra_ID FROM performance)
SELECT T1.Record_Company FROM orchestra AS T1 JOIN orchestra AS T2 ON T1.Record_Company = T2.Record_Company WHERE T1.Year_of_Founded < 2003 AND T2.Year_of_Founded > 2003 GROUP BY T1.Record_Company
SELECT Record_Company FROM orchestra WHERE Year_of_Founded < 2003 INTERSECT SELECT Record_Company FROM orchestra WHERE Year_of_Founded > 2003
SELECT COUNT(*) FROM orchestra WHERE Major_Record_Format IN ('CD', 'DVD')
SELECT COUNT(*) FROM orchestra WHERE Major_Record_Format IN ('CD', 'DVD')
SELECT o.Year_of_Founded FROM orchestra o JOIN performance p ON o.Orchestra_ID = p.Orchestra_ID GROUP BY o.Orchestra_ID HAVING COUNT(p.Performance_ID) > 1;
SELECT Year_of_Founded FROM orchestra WHERE Orchestra_ID IN (SELECT Orchestra_ID FROM performance GROUP BY Orchestra_ID HAVING COUNT(*) > 1)
SELECT COUNT(*) FROM Highschooler
SELECT COUNT(*) FROM Highschooler
SELECT name, grade FROM Highschooler
SELECT name, grade FROM Highschooler
SELECT grade FROM Highschooler
SELECT ID, name, grade FROM Highschooler
SELECT grade FROM Highschooler WHERE name = 'Kyle'
SELECT grade FROM Highschooler WHERE name = 'Kyle'
SELECT name FROM Highschooler WHERE grade = 10
SELECT name FROM Highschooler WHERE grade = 10
SELECT ID FROM Highschooler WHERE name = 'Kyle'
SELECT ID FROM Highschooler WHERE name = 'Kyle'
SELECT COUNT(*) FROM Highschooler WHERE grade IN (9, 10)
SELECT COUNT(*) FROM Highschooler WHERE grade IN (9, 10)
SELECT grade, COUNT(*) FROM Highschooler GROUP BY grade
SELECT grade, COUNT(*) FROM Highschooler GROUP BY grade
SELECT grade FROM Highschooler GROUP BY grade ORDER BY COUNT(*) DESC LIMIT 1
SELECT grade FROM Highschooler GROUP BY grade ORDER BY COUNT(*) DESC LIMIT 1
SELECT grade FROM Highschooler GROUP BY grade HAVING COUNT(*) >= 4
SELECT grade FROM Highschooler GROUP BY grade HAVING COUNT(*) >= 4
SELECT `student_id`, COUNT(`friend_id`) AS `num_friends` FROM `Friend` GROUP BY `student_id`
SELECT h.name, COUNT(f.friend_id) AS friend_count FROM Highschooler h LEFT JOIN Friend f ON h.ID = f.student_id GROUP BY h.ID, h.name;
SELECT h.name, COUNT(f.friend_id) AS number_of_friends FROM Highschooler h JOIN Friend f ON h.ID = f.student_id GROUP BY h.ID, h.name ORDER BY h.name;
SELECT h.name, COUNT(f.friend_id) AS number_of_friends FROM Highschooler h LEFT JOIN Friend f ON h.ID = f.student_id GROUP BY h.name;
SELECT h.name  FROM Highschooler h  JOIN (     SELECT student_id, COUNT(friend_id) AS friend_count      FROM Friend      GROUP BY student_id ) f ON h.ID = f.student_id  ORDER BY f.friend_count DESC  LIMIT 1;
SELECT h.name FROM Highschooler h JOIN Friend f ON h.ID = f.student_id GROUP BY h.ID, h.name ORDER BY COUNT(f.friend_id) DESC LIMIT 1;
SELECT H1.name FROM Highschooler H1 JOIN Friend F1 ON H1.ID = F1.student_id GROUP BY H1.ID, H1.name HAVING COUNT(F1.friend_id) >= 3
SELECT H1.name  FROM Highschooler H1  JOIN Friend F1 ON H1.ID = F1.student_id  GROUP BY H1.ID  HAVING COUNT(F1.friend_id) >= 3
SELECT h2.name  FROM Highschooler h1  JOIN Friend f ON h1.ID = f.student_id  JOIN Highschooler h2 ON f.friend_id = h2.ID  WHERE h1.name = 'Kyle'
SELECT h2.name  FROM Highschooler h1 JOIN Friend f ON h1.ID = f.student_id JOIN Highschooler h2 ON f.friend_id = h2.ID WHERE h1.name = 'Kyle'
SELECT COUNT(friend_id) FROM Friend WHERE student_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle')
SELECT COUNT(friend_id) FROM Friend WHERE student_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle')
SELECT ID FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend UNION SELECT friend_id FROM Friend)
SELECT ID FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend UNION SELECT friend_id FROM Friend)
SELECT name FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend UNION SELECT friend_id FROM Friend)
SELECT name FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend UNION SELECT friend_id FROM Friend)
SELECT DISTINCT h1.ID  FROM Highschooler h1  JOIN Friend f1 ON h1.ID = f1.student_id  JOIN Likes l1 ON h1.ID = l1.liked_id
SELECT DISTINCT H1.ID FROM Highschooler H1 JOIN Friend F ON H1.ID = F.student_id JOIN Likes L ON H1.ID = L.student_id
SELECT DISTINCT h1.name  FROM Highschooler h1  JOIN Friend f ON h1.ID = f.student_id  JOIN Likes l ON h1.ID = l.liked_id;
SELECT h1.name  FROM Highschooler h1 JOIN Friend f ON h1.ID = f.student_id JOIN Likes l ON h1.ID = l.student_id
SELECT student_id, COUNT(liked_id) AS like_count FROM Likes GROUP BY student_id
SELECT student_id, COUNT(liked_id) AS likes_count FROM Likes GROUP BY student_id;
SELECT h.name, COUNT(l.liked_id) AS num_likes FROM Highschooler h JOIN Likes l ON h.ID = l.student_id GROUP BY h.name;
SELECT h.name, COUNT(l.liked_id) AS likes_count FROM Highschooler h JOIN Likes l ON h.ID = l.student_id GROUP BY h.ID, h.name;
SELECT h.name  FROM Highschooler h  JOIN Likes l ON h.ID = l.student_id  GROUP BY h.ID  ORDER BY COUNT(l.liked_id) DESC  LIMIT 1;
SELECT h.name  FROM Highschooler h  JOIN Likes l ON h.ID = l.student_id  GROUP BY h.name  ORDER BY COUNT(l.liked_id) DESC  LIMIT 1;
SELECT h.name  FROM Highschooler h  JOIN Likes l ON h.ID = l.student_id  GROUP BY h.name  HAVING COUNT(l.liked_id) >= 2
SELECT h.name  FROM Highschooler h  JOIN Likes l ON h.ID = l.student_id  GROUP BY h.name  HAVING COUNT(l.liked_id) >= 2
SELECT h.name FROM Highschooler h JOIN Friend f ON h.ID = f.student_id GROUP BY h.name, h.grade HAVING h.grade > 5 AND COUNT(f.friend_id) >= 2
SELECT h.name  FROM Highschooler h JOIN Friend f ON h.ID = f.student_id GROUP BY h.ID HAVING COUNT(f.friend_id) >= 2 AND h.grade > 5
SELECT COUNT(*) FROM Likes WHERE liked_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle')
SELECT COUNT(*) FROM Likes WHERE liked_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle')
SELECT AVG(grade) FROM Highschooler WHERE ID IN (SELECT student_id FROM Friend)
SELECT AVG(grade) FROM Highschooler WHERE ID IN (SELECT student_id FROM Friend UNION SELECT friend_id FROM Friend)
SELECT MIN(grade) FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend UNION SELECT friend_id FROM Friend)
SELECT MIN(grade) FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend UNION SELECT friend_id FROM Friend)
SELECT DISTINCT state FROM Owners WHERE state IN (SELECT state FROM Professionals)
SELECT state FROM Owners INTERSECT SELECT state FROM Professionals
SELECT AVG(DATEDIFF(CURDATE(), date_of_birth) / 365) AS average_age FROM Dogs WHERE dog_id IN (SELECT dog_id FROM Treatments)
SELECT AVG(DATEDIFF(CURDATE(), d.date_of_birth) / 365) AS average_age FROM Dogs d JOIN Treatments t ON d.dog_id = t.dog_id;
SELECT p.professional_id, p.last_name, p.cell_number FROM Professionals p WHERE p.state = 'Indiana' UNION SELECT p.professional_id, p.last_name, p.cell_number FROM Professionals p JOIN Treatments t ON p.professional_id = t.professional_id GROUP BY p.professional_id, p.last_name, p.cell_number HAVING COUNT(t.treatment_id) > 2
SELECT p.professional_id, p.last_name, p.cell_number  FROM Professionals p WHERE p.state = 'Indiana'     OR (SELECT COUNT(*) FROM Treatments t WHERE t.professional_id = p.professional_id) > 2;
SELECT D.name  FROM Dogs D  WHERE D.dog_id NOT IN (     SELECT T.dog_id      FROM Treatments T      GROUP BY T.dog_id      HAVING SUM(T.cost_of_treatment) > 1000 )
SELECT D.name  FROM Dogs D  JOIN Treatments T ON D.dog_id = T.dog_id  GROUP BY D.name  HAVING SUM(T.cost_of_treatment) <= 1000
SELECT DISTINCT first_name FROM Professionals  UNION  SELECT DISTINCT first_name FROM Owners  EXCEPT  SELECT DISTINCT name FROM Dogs
SELECT first_name  FROM Professionals  UNION  SELECT first_name  FROM Owners  EXCEPT  SELECT name  FROM Dogs
SELECT p.professional_id, p.role_code, p.email_address  FROM Professionals p  LEFT JOIN Treatments t ON p.professional_id = t.professional_id  WHERE t.treatment_id IS NULL;
SELECT professional_id, role_code, email_address  FROM Professionals  WHERE professional_id NOT IN (SELECT professional_id FROM Treatments)
SELECT O.owner_id, O.first_name, O.last_name FROM Owners O JOIN Dogs D ON O.owner_id = D.owner_id GROUP BY O.owner_id, O.first_name, O.last_name ORDER BY COUNT(D.dog_id) DESC LIMIT 1;
SELECT o.owner_id, o.first_name, o.last_name FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id GROUP BY o.owner_id, o.first_name, o.last_name ORDER BY COUNT(d.dog_id) DESC LIMIT 1;
SELECT P.professional_id, P.role_code, P.first_name  FROM Professionals P  JOIN Treatments T ON P.professional_id = T.professional_id  GROUP BY P.professional_id, P.role_code, P.first_name  HAVING COUNT(T.treatment_id) >= 2;
SELECT P.professional_id, P.role_code, P.first_name  FROM Professionals P  JOIN Treatments T ON P.professional_id = T.professional_id  GROUP BY P.professional_id, P.role_code, P.first_name  HAVING COUNT(T.treatment_id) >= 2
SELECT b.breed_name  FROM Breeds b  JOIN Dogs d ON b.breed_code = d.breed_code  GROUP BY b.breed_name  ORDER BY COUNT(d.dog_id) DESC  LIMIT 1;
SELECT b.breed_name  FROM Breeds b  JOIN Dogs d ON b.breed_code = d.breed_code  GROUP BY b.breed_name  ORDER BY COUNT(d.dog_id) DESC  LIMIT 1;
SELECT O.owner_id, O.last_name FROM Owners O JOIN Dogs D ON O.owner_id = D.owner_id JOIN Treatments T ON D.dog_id = T.dog_id GROUP BY O.owner_id, O.last_name ORDER BY COUNT(T.treatment_id) DESC LIMIT 1;
SELECT O.owner_id, O.last_name FROM Owners O JOIN Dogs D ON O.owner_id = D.owner_id JOIN Treatments T ON D.dog_id = T.dog_id GROUP BY O.owner_id, O.last_name ORDER BY SUM(T.cost_of_treatment) DESC LIMIT 1;
SELECT T1.treatment_type_description FROM Treatment_Types AS T1 JOIN Treatments AS T2 ON T1.treatment_type_code = T2.treatment_type_code GROUP BY T1.treatment_type_description ORDER BY SUM(T2.cost_of_treatment) ASC LIMIT 1
SELECT t.treatment_type_description  FROM Treatment_Types t  JOIN Treatments tr ON t.treatment_type_code = tr.treatment_type_code  GROUP BY t.treatment_type_description  ORDER BY SUM(tr.cost_of_treatment) ASC  LIMIT 1;
SELECT O.owner_id, O.zip_code FROM Owners O JOIN Dogs D ON O.owner_id = D.owner_id JOIN Treatments T ON D.dog_id = T.dog_id GROUP BY O.owner_id, O.zip_code ORDER BY SUM(T.cost_of_treatment) DESC LIMIT 1;
SELECT o.owner_id, o.zip_code FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id JOIN Treatments t ON d.dog_id = t.dog_id GROUP BY o.owner_id, o.zip_code ORDER BY SUM(t.cost_of_treatment) DESC LIMIT 1;
SELECT P.professional_id, P.cell_number  FROM Professionals P  JOIN Treatments T ON P.professional_id = T.professional_id  GROUP BY P.professional_id, P.cell_number  HAVING COUNT(DISTINCT T.treatment_type_code) >= 2;
SELECT p.professional_id, p.cell_number FROM Professionals p JOIN Treatments t ON p.professional_id = t.professional_id GROUP BY p.professional_id, p.cell_number HAVING COUNT(DISTINCT t.treatment_type_code) >= 2;
SELECT p.first_name, p.last_name  FROM Professionals p  JOIN Treatments t ON p.professional_id = t.professional_id  WHERE t.cost_of_treatment < (SELECT AVG(cost_of_treatment) FROM Treatments)
SELECT P.first_name, P.last_name  FROM Professionals P  JOIN Treatments T ON P.professional_id = T.professional_id  WHERE T.cost_of_treatment < (SELECT AVG(cost_of_treatment) FROM Treatments)
SELECT T.date_of_treatment, P.first_name  FROM Treatments T  JOIN Professionals P  ON T.professional_id = P.professional_id
SELECT T.date_of_treatment, P.first_name  FROM Treatments T  JOIN Professionals P ON T.professional_id = P.professional_id
SELECT T1.cost_of_treatment, T2.treatment_type_description FROM Treatments AS T1 JOIN Treatment_Types AS T2 ON T1.treatment_type_code = T2.treatment_type_code
SELECT T1.cost_of_treatment, T2.treatment_type_description FROM Treatments AS T1 JOIN Treatment_Types AS T2 ON T1.treatment_type_code = T2.treatment_type_code
SELECT O.first_name, O.last_name, S.size_description  FROM Owners O  JOIN Dogs D ON O.owner_id = D.owner_id  JOIN Sizes S ON D.size_code = S.size_code;
SELECT O.first_name, O.last_name, S.size_description  FROM Owners O  JOIN Dogs D ON O.owner_id = D.owner_id  JOIN Sizes S ON D.size_code = S.size_code;
SELECT o.first_name, d.name  FROM Owners o  JOIN Dogs d ON o.owner_id = d.owner_id;
SELECT Owners.first_name, Dogs.name FROM Owners JOIN Dogs ON Owners.owner_id = Dogs.owner_id
SELECT D.name, T.date_of_treatment  FROM Dogs D  JOIN Treatments T ON D.dog_id = T.dog_id  WHERE D.breed_code = (     SELECT breed_code      FROM Dogs      GROUP BY breed_code      ORDER BY COUNT(*)      LIMIT 1 )
SELECT D.name, T.date_of_treatment  FROM Dogs D  JOIN Treatments T ON D.dog_id = T.dog_id  WHERE D.breed_code = (     SELECT B.breed_code      FROM Breeds B      JOIN Dogs D2 ON B.breed_code = D2.breed_code      GROUP BY B.breed_code      ORDER BY COUNT(D2.dog_id) ASC      LIMIT 1 )
SELECT O.first_name, D.name  FROM Owners O  JOIN Dogs D ON O.owner_id = D.owner_id  WHERE O.state = 'Virginia'
SELECT O.first_name, D.name  FROM Owners O  JOIN Dogs D ON O.owner_id = D.owner_id  WHERE O.state = 'Virginia'
SELECT D.date_arrived, D.date_departed  FROM Dogs D  WHERE D.dog_id IN (SELECT T.dog_id FROM Treatments T)
SELECT D.date_arrived, D.date_departed  FROM Dogs D  JOIN Treatments T  ON D.dog_id = T.dog_id;
SELECT o.last_name  FROM Owners o  JOIN Dogs d ON o.owner_id = d.owner_id  WHERE d.date_of_birth = (SELECT MAX(date_of_birth) FROM Dogs);
SELECT O.last_name FROM Owners O JOIN Dogs D ON O.owner_id = D.owner_id WHERE D.date_of_birth = (SELECT MAX(date_of_birth) FROM Dogs)
SELECT email_address FROM Professionals WHERE state = 'Hawaii' OR state = 'Wisconsin'
SELECT email_address FROM Professionals WHERE state IN ('Hawaii', 'Wisconsin')
SELECT date_arrived, date_departed FROM Dogs
SELECT date_arrived, date_departed FROM Dogs
SELECT COUNT(DISTINCT dog_id) FROM Treatments
SELECT COUNT(DISTINCT dog_id) FROM Treatments
SELECT COUNT(DISTINCT professional_id) FROM Treatments
SELECT COUNT(DISTINCT professional_id) FROM Treatments
SELECT role_code, street, city, state FROM Professionals WHERE city LIKE '%West%'
SELECT role_code, street, city, state FROM Professionals WHERE city LIKE '%West%'
SELECT first_name, last_name, email_address FROM Owners WHERE state LIKE '%North%'
SELECT first_name, last_name, email_address FROM Owners WHERE state LIKE '%North%'
SELECT COUNT(*)  FROM Dogs  WHERE CAST(age AS DECIMAL(10,2)) < (SELECT AVG(CAST(age AS DECIMAL(10,2))) FROM Dogs)
SELECT COUNT(*)  FROM Dogs  WHERE age < (SELECT AVG(age) FROM Dogs)
SELECT cost_of_treatment FROM Treatments ORDER BY date_of_treatment DESC LIMIT 1
SELECT cost_of_treatment FROM Treatments ORDER BY date_of_treatment DESC LIMIT 1
SELECT COUNT(*) FROM Dogs WHERE dog_id NOT IN (SELECT dog_id FROM Treatments)
SELECT COUNT(*)  FROM `Dogs`  WHERE `dog_id` NOT IN (SELECT `dog_id` FROM `Treatments`)
SELECT COUNT(*)  FROM Owners  WHERE owner_id NOT IN (SELECT owner_id FROM Dogs WHERE date_adopted IS NULL);
SELECT COUNT(*)  FROM `Owners`  WHERE `owner_id` NOT IN (SELECT `owner_id` FROM `Dogs` WHERE `date_departed` IS NULL);
SELECT COUNT(*)  FROM Professionals  WHERE professional_id NOT IN (SELECT professional_id FROM Treatments)
SELECT COUNT(*)  FROM Professionals  WHERE professional_id NOT IN (SELECT professional_id FROM Treatments)
SELECT D.name, D.age, D.weight  FROM Dogs D  WHERE D.abandoned_yn = '1';
SELECT name, age, weight FROM Dogs WHERE abandoned_yn = '1'
SELECT AVG(age) FROM Dogs
SELECT AVG(CAST(SUBSTR(age, 1, INSTR(age, ' ') - 1) AS INTEGER)) AS average_age FROM Dogs
SELECT MAX(age) FROM Dogs
SELECT MAX(age) FROM Dogs
SELECT charge_type, charge_amount FROM Charges
SELECT charge_type, charge_amount FROM Charges
SELECT MAX(charge_amount) FROM Charges
SELECT MAX(charge_amount) FROM Charges
SELECT email_address, cell_number, home_phone FROM Professionals
SELECT email_address, cell_number, home_phone FROM Professionals
SELECT B.breed_name, S.size_description  FROM Breeds B, Sizes S
SELECT DISTINCT b.breed_name, s.size_description FROM Breeds b JOIN Dogs d ON b.breed_code = d.breed_code JOIN Sizes s ON s.size_code = d.size_code
SELECT P.first_name, TT.treatment_type_description  FROM Professionals P  JOIN Treatments T ON P.professional_id = T.professional_id  JOIN Treatment_Types TT ON T.treatment_type_code = TT.treatment_type_code;
SELECT p.first_name, tt.treatment_type_description  FROM Professionals p  JOIN Treatments t ON p.professional_id = t.professional_id  JOIN Treatment_Types tt ON t.treatment_type_code = tt.treatment_type_code;
SELECT COUNT(*) FROM singer
SELECT COUNT(*) FROM singer
SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC
SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC
SELECT Birth_Year, Citizenship FROM singer
SELECT Birth_Year, Citizenship FROM singer
SELECT Name FROM singer WHERE Citizenship != 'France'
SELECT Name FROM singer WHERE Citizenship != 'France'
SELECT Name FROM singer WHERE Birth_Year IN (1948, 1949)
SELECT Name FROM singer WHERE Birth_Year IN (1948, 1949)
SELECT Name FROM singer ORDER BY Net_Worth_Millions DESC LIMIT 1
SELECT Name FROM singer ORDER BY Net_Worth_Millions DESC LIMIT 1
SELECT Citizenship, COUNT(*) FROM singer GROUP BY Citizenship
SELECT Citizenship, COUNT(*) FROM singer GROUP BY Citizenship
SELECT Citizenship FROM singer GROUP BY Citizenship ORDER BY COUNT(*) DESC LIMIT 1
SELECT Citizenship FROM singer GROUP BY Citizenship ORDER BY COUNT(*) DESC LIMIT 1
SELECT Citizenship, MAX(Net_Worth_Millions) FROM singer GROUP BY Citizenship
SELECT Citizenship, MAX(Net_Worth_Millions) FROM singer GROUP BY Citizenship
SELECT song.Title, singer.Name FROM song JOIN singer ON song.Singer_ID = singer.Singer_ID
SELECT song.Title, singer.Name FROM song JOIN singer ON song.Singer_ID = singer.Singer_ID
SELECT DISTINCT s.Name  FROM singer s  JOIN song sg  ON s.Singer_ID = sg.Singer_ID  WHERE sg.Sales > 300000;
SELECT DISTINCT s.Name  FROM singer s  JOIN song sg  ON s.Singer_ID = sg.Singer_ID  WHERE sg.Sales > 300000;
SELECT s.Name  FROM singer s  JOIN song sg ON s.Singer_ID = sg.Singer_ID  GROUP BY s.Name  HAVING COUNT(sg.Song_ID) > 1
SELECT s.Name  FROM singer s  JOIN song sg ON s.Singer_ID = sg.Singer_ID  GROUP BY s.Name  HAVING COUNT(sg.Song_ID) > 1
SELECT s.Name, SUM(so.Sales) AS Total_Sales FROM singer s JOIN song so ON s.Singer_ID = so.Singer_ID GROUP BY s.Name;
SELECT s.Name, SUM(so.Sales) AS Total_Sales FROM singer s JOIN song so ON s.Singer_ID = so.Singer_ID GROUP BY s.Name
SELECT Name FROM singer WHERE Singer_ID NOT IN (SELECT Singer_ID FROM song)
SELECT Name FROM singer WHERE Singer_ID NOT IN (SELECT Singer_ID FROM song)
SELECT Citizenship FROM singer WHERE Birth_Year < 1945 OR Birth_Year > 1955
SELECT Citizenship FROM singer WHERE Birth_Year < 1945 INTERSECT SELECT Citizenship FROM singer WHERE Birth_Year > 1955
SELECT COUNT(feature_id) FROM Other_Available_Features
SELECT T1.feature_type_name FROM Ref_Feature_Types AS T1 JOIN Other_Available_Features AS T2 ON T1.feature_type_code = T2.feature_type_code WHERE T2.feature_name = 'AirCon'
SELECT `property_type_description` FROM `Ref_Property_Types` WHERE `property_type_code` IN (SELECT `property_type_code` FROM `Properties`)
SELECT property_name  FROM Properties  WHERE property_type_code IN ('House', 'Apartment') AND room_count > 1;
