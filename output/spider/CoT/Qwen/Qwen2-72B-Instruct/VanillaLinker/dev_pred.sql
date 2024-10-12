SELECT COUNT(*) FROM singer;
SELECT COUNT(Singer_ID) FROM singer;
SELECT Name, Country, Age FROM singer ORDER BY Age DESC;
SELECT Name, Country, Age FROM singer ORDER BY Age DESC;
SELECT AVG(Age) AS Average_Age, MIN(Age) AS Minimum_Age, MAX(Age) AS Maximum_Age FROM singer WHERE Country = 'France';
SELECT AVG(Age) AS Average_Age, MIN(Age) AS Minimum_Age, MAX(Age) AS Maximum_Age FROM singer WHERE Country = 'France';
SELECT T1.Song_Name, T1.Song_release_year FROM `singer` AS T1 JOIN (SELECT MIN(Age) AS min_age FROM `singer`) AS T2 ON T1.Age = T2.min_age;
SELECT T2.Song_Name, T2.Song_release_year FROM singer AS T1 JOIN singer_in_concert AS T3 ON T1.Singer_ID = T3.Singer_ID JOIN (SELECT MIN(Age) AS min_age FROM singer) AS T4 WHERE T1.Age = T4.min_age;
SELECT DISTINCT Country FROM singer WHERE Age > 20;
SELECT DISTINCT Country FROM singer WHERE Age > 20;
SELECT Country, COUNT(Singer_ID) FROM singer GROUP BY Country;
SELECT Country, COUNT(*) FROM singer GROUP BY Country;
SELECT T1.Song_Name FROM singer AS T1 JOIN singer_in_concert AS T2 ON T1.Singer_ID = T2.Singer_ID WHERE T1.Age > (SELECT AVG(Age) FROM singer);
SELECT Song_Name FROM singer WHERE Age > (SELECT AVG(Age) FROM singer)
SELECT Location, Name FROM stadium WHERE Capacity BETWEEN 5000 AND 10000;
SELECT Location, Name FROM stadium WHERE Capacity BETWEEN 5000 AND 10000;
SELECT MAX(Capacity), AVG(Capacity) FROM stadium;
SELECT AVG(Capacity) AS Average_Capacity, MAX(Capacity) AS Maximum_Capacity FROM stadium;
SELECT Name, Capacity FROM stadium WHERE Average = (SELECT MAX(Average) FROM stadium);
SELECT Name, Capacity FROM stadium WHERE Average = (SELECT MAX(Average) FROM stadium);
SELECT COUNT(concert_ID) FROM concert WHERE Year = '2014' OR Year = '2015';
SELECT COUNT(concert_ID) FROM concert WHERE Year IN ('2014', '2015')
SELECT s.Name, COUNT(c.concert_ID) AS NumberOfConcerts FROM concert c JOIN stadium s ON c.Stadium_ID = s.Stadium_ID GROUP BY s.Name;
SELECT s.Name, COUNT(c.concert_ID) AS Concert_Count FROM `stadium` s JOIN `concert` c ON s.Stadium_ID = c.Stadium_ID GROUP BY s.Stadium_ID;
SELECT T1.Name, T1.Capacity FROM stadium AS T1 JOIN (SELECT Stadium_ID, COUNT(*) AS concert_count FROM concert WHERE Year >= '2014' GROUP BY Stadium_ID) AS T2 ON T1.Stadium_ID = T2.Stadium_ID ORDER BY T2.concert_count DESC LIMIT 1
SELECT T3.Name, T3.Capacity FROM concert AS T1 JOIN singer_in_concert AS T2 ON T1.concert_ID = T2.concert_ID JOIN stadium AS T3 ON T1.Stadium_ID = T3.Stadium_ID WHERE T1.Year > '2013' GROUP BY T1.Stadium_ID ORDER BY COUNT(T1.concert_ID) DESC LIMIT 1;
SELECT Year, COUNT(*) AS concert_count FROM concert GROUP BY Year ORDER BY concert_count DESC LIMIT 1;
SELECT Year, COUNT(concert_ID) AS concert_count FROM concert GROUP BY Year ORDER BY concert_count DESC LIMIT 1;
SELECT Name FROM stadium LEFT JOIN concert ON stadium.Stadium_ID = concert.Stadium_ID WHERE concert.concert_ID IS NULL;
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert);
SELECT DISTINCT T1.Country FROM singer AS T1 WHERE T1.Age > 40 AND EXISTS (SELECT * FROM singer AS T2 WHERE T2.Country = T1.Country AND T2.Age < 30)
SELECT T1.Name FROM stadium AS T1 LEFT JOIN concert AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T2.Year != 2014 OR T2.Stadium_ID IS NULL
SELECT T2.Name FROM (SELECT Stadium_ID FROM concert WHERE Year != '2014') AS T1 RIGHT JOIN stadium AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T1.Stadium_ID IS NULL OR T1.Stadium_ID NOT IN (SELECT Stadium_ID FROM concert WHERE Year = '2014')
SELECT T1.concert_Name, T1.Theme, COUNT(T3.Singer_ID) FROM concert AS T1 JOIN singer_in_concert AS T2 ON T1.concert_ID = T2.concert_ID JOIN singer AS T3 ON T2.Singer_ID = T3.Singer_ID GROUP BY T1.concert_ID;
SELECT T1.concert_Name, T1.Theme, COUNT(T2.Singer_ID) AS Number_of_Singers FROM concert AS T1 JOIN singer_in_concert AS T2 ON T1.concert_ID = T2.concert_ID GROUP BY T1.concert_ID;
SELECT T2.Name ,  COUNT(*) FROM singer_in_concert AS T1 JOIN singer AS T2 ON T1.Singer_ID = T2.Singer_ID GROUP BY T2.Name;
SELECT T1.Name ,  COUNT(*) FROM singer AS T1 JOIN singer_in_concert AS T2 ON T1.Singer_ID = T2.Singer_ID GROUP BY T1.Singer_ID
SELECT T3.Name FROM concert AS T1 JOIN singer_in_concert AS T2 ON T1.concert_ID = T2.concert_ID JOIN singer AS T3 ON T2.Singer_ID = T3.Singer_ID WHERE T1.Year = '2014';
SELECT T1.Name FROM singer AS T1 JOIN singer_in_concert AS T2 ON T1.Singer_ID = T2.Singer_ID JOIN concert AS T3 ON T2.concert_ID = T3.concert_ID WHERE T3.Year = '2014'
SELECT Name, Country FROM singer WHERE Song_Name LIKE '%Hey%'
SELECT Name, Country FROM singer WHERE Song_Name LIKE '%Hey%'
SELECT T1.Name, T1.Location FROM stadium AS T1 JOIN concert AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T2.Year IN ('2014', '2015') GROUP BY T1.Stadium_ID HAVING COUNT(DISTINCT T2.Year) > 1
SELECT s.Name, s.Location FROM stadium AS s JOIN concert AS c ON s.Stadium_ID = c.Stadium_ID WHERE c.Year IN ('2014', '2015') GROUP BY s.Stadium_ID HAVING COUNT(DISTINCT c.Year) > 1;
SELECT COUNT(*) FROM concert WHERE Stadium_ID = (SELECT Stadium_ID FROM stadium ORDER BY Capacity DESC LIMIT 1);
SELECT COUNT(*) FROM `concert` WHERE `Stadium_ID` = (SELECT `Stadium_ID` FROM `stadium` ORDER BY `Capacity` DESC LIMIT 1);
SELECT COUNT(*) FROM Pets WHERE weight > 10;
SELECT COUNT(*) FROM Pets WHERE weight > 10;
SELECT T1.weight FROM Pets AS T1 WHERE T1.pet_age = (SELECT MIN(T2.pet_age) FROM Pets AS T2 WHERE T2.PetType = 'dog') AND T1.PetType = 'dog';
SELECT PetID, pet_age, weight FROM Pets WHERE PetType = 'dog' ORDER BY pet_age ASC LIMIT 1;
SELECT PetType, MAX(weight) FROM Pets GROUP BY PetType;
SELECT PetType, MAX(weight) FROM Pets GROUP BY PetType;
SELECT T1.StuID, COUNT(T3.PetID) AS num_pets FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID INNER JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T1.Age > 20 GROUP BY T1.StuID
SELECT COUNT(T2.PetID) FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID WHERE T1.Age > 20;
SELECT COUNT(T2.PetID) FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T1.Sex = 'F' AND T3.PetType = 'dog';
SELECT COUNT(*) FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T1.Sex = 'F' AND T3.PetType = 'dog';
SELECT COUNT(DISTINCT PetType) FROM Pets;
SELECT COUNT(DISTINCT PetType) FROM Pets;
SELECT T1.Fname FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType IN ('cat', 'dog');
SELECT S.Fname FROM Student AS S JOIN Has_Pet AS HP ON S.StuID = HP.StuID JOIN Pets AS P ON HP.PetID = P.PetID WHERE P.PetType IN ('cat', 'dog');
SELECT T1.Fname FROM Student AS T1 WHERE T1.StuID IN (SELECT T3.StuID FROM Has_Pet AS T2 JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'cat') AND T1.StuID IN (SELECT T5.StuID FROM Has_Pet AS T4 JOIN Pets AS T5 ON T4.PetID = T5.PetID WHERE T5.PetType = 'dog')
SELECT S.Fname FROM Student AS S WHERE EXISTS (SELECT * FROM Has_Pet AS HP JOIN Pets AS P ON HP.PetID = P.PetID WHERE HP.StuID = S.StuID AND P.PetType = 'cat') AND EXISTS (SELECT * FROM Has_Pet AS HP JOIN Pets AS P ON HP.PetID = P.PetID WHERE HP.StuID = S.StuID AND P.PetType = 'dog')
SELECT T1.Major, T1.Age FROM Student AS T1 LEFT JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID LEFT JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType != 'cat' OR T3.PetType IS NULL
SELECT T1.Major, T1.Age FROM Student AS T1 WHERE T1.StuID NOT IN(SELECT T2.StuID FROM Has_Pet AS T2 JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'cat')
SELECT StuID FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE PetType='cat')
SELECT StuID FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE PetType = 'cat')
SELECT T1.Fname, T1.Age FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'dog' EXCEPT SELECT T1.Fname, T1.Age FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'cat'
SELECT T1.Fname FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'dog' AND NOT EXISTS(SELECT * FROM Has_Pet AS T4 JOIN Pets AS T5 ON T4.PetID = T5.PetID WHERE T1.StuID = T4.StuID AND T5.PetType = 'cat')
SELECT PetType, weight FROM Pets ORDER BY pet_age ASC LIMIT 1;
SELECT PetType, weight FROM Pets ORDER BY pet_age ASC LIMIT 1;
SELECT PetID, weight FROM Pets WHERE pet_age > 1;
SELECT PetID, weight FROM Pets WHERE pet_age > 1;
SELECT PetType, AVG(pet_age) AS average_age, MAX(pet_age) AS max_age FROM Pets GROUP BY PetType;
SELECT PetType, AVG(pet_age) AS Average_Age, MAX(pet_age) AS Maximum_Age FROM Pets GROUP BY PetType;
SELECT PetType, AVG(weight) FROM Pets GROUP BY PetType;
SELECT PetType, AVG(weight) FROM Pets GROUP BY PetType;
SELECT T1.Fname, T1.Age FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID;
SELECT DISTINCT T1.Fname, T1.Age FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID GROUP BY T1.Fname, T1.Age;
SELECT T2.PetID FROM `Student` AS T1 JOIN `Has_Pet` AS T2 ON T1.StuID = T2.StuID WHERE T1.LName = 'Smith';
SELECT T2.PetID FROM `Student` AS T1 JOIN `Has_Pet` AS T2 ON T1.StuID = T2.StuID WHERE T1.LName = 'Smith';
SELECT StuID, COUNT(PetID) AS num_pets FROM Has_Pet GROUP BY StuID;
SELECT T1.StuID, COUNT(T2.PetID) AS num_pets FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID GROUP BY T1.StuID;
SELECT T2.Fname, T2.Sex FROM Has_Pet AS T1 JOIN Student AS T2 ON T1.StuID = T2.StuID GROUP BY T1.StuID HAVING COUNT(T1.PetID) > 1;
SELECT T1.Fname, T1.Sex FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID GROUP BY T1.StuID HAVING COUNT(T2.PetID) > 1;
SELECT T1.LName FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'cat' AND T3.pet_age = 3;
SELECT T1.LName FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'cat' AND T3.pet_age = 3;
SELECT AVG(T1.Age) FROM Student AS T1 LEFT JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID WHERE T2.StuID IS NULL;
SELECT AVG(T1.Age) FROM Student AS T1 LEFT JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID WHERE T2.PetID IS NULL;
SELECT COUNT(DISTINCT ContId) FROM continents;
SELECT COUNT(ContId) FROM continents
SELECT c.ContId, co.Continent, COUNT(c.CountryName) AS NumberOfCountries FROM countries c JOIN continents co ON c.Continent = co.ContId GROUP BY c.Continent;
SELECT c.ContId, co.Continent, COUNT(c.CountryName) AS NumberOfCountries FROM countries AS c JOIN continents AS co ON c.Continent = co.ContId GROUP BY c.Continent;
SELECT COUNT(DISTINCT CountryId) FROM countries;
SELECT COUNT(CountryId) FROM countries;
SELECT cm.Id, cm.FullName, COUNT(ml.Model) AS NumberOfModels FROM car_makers cm JOIN model_list ml ON cm.Id = ml.Maker GROUP BY cm.Id, cm.FullName;
SELECT T1.Id, T1.FullName, COUNT(T2.Model) AS NumberOfModels FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.Id, T1.FullName ORDER BY NumberOfModels DESC;
SELECT T3.Model FROM car_names AS T1 JOIN cars_data AS T2 ON T1.MakeId = T2.Id JOIN model_list AS T3 ON T1.Model = T3.ModelId WHERE T2.Horsepower IS NOT NULL ORDER BY CAST(REPLACE(T2.Horsepower, ',', '') AS REAL) ASC LIMIT 1;
SELECT cn.Model FROM car_names AS cn JOIN cars_data AS cd ON cn.MakeId = cd.Id ORDER BY cd.Horsepower ASC LIMIT 1;
SELECT cn.Model FROM car_names AS cn JOIN cars_data AS cd ON cn.MakeId = cd.Id WHERE cd.Weight < (SELECT AVG(Weight) FROM cars_data);
SELECT T2.Model FROM car_names AS T1 JOIN cars_data AS T2 ON T1.MakeId = T2.Id WHERE T2.Weight < (SELECT AVG(Weight) FROM cars_data);
SELECT DISTINCT T3.Maker FROM car_names AS T1 INNER JOIN model_list AS T2 ON T1.Model = T2.ModelId INNER JOIN car_makers AS T3 ON T2.Maker = T3.Id INNER JOIN cars_data AS T4 ON T1.MakeId = T4.Id WHERE T4.Year = 1970;
SELECT DISTINCT T3.Maker FROM cars_data AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId JOIN model_list AS T3 ON T2.Model = T3.ModelId WHERE T1.Year = 1970;
SELECT T1.Make, T2.Year FROM car_names AS T1 JOIN cars_data AS T2 ON T1.MakeId = T2.Id WHERE T2.Year = (SELECT MIN(Year) FROM cars_data);
SELECT T3.Maker FROM car_names AS T1 JOIN model_list AS T2 ON T1.Model = T2.ModelId JOIN car_makers AS T3 ON T2.Maker = T3.Id JOIN cars_data AS T4 ON T1.MakeId = T4.Id WHERE T4.Year = (SELECT MIN(Year) FROM cars_data);
SELECT DISTINCT ml.Model FROM model_list ml JOIN cars_data cd ON ml.ModelId = cd.Id WHERE cd.Year > 1980;
SELECT DISTINCT ml.Model FROM model_list AS ml JOIN car_names AS cn ON ml.Model = cn.Model JOIN cars_data AS cd ON cn.MakeId = cd.Id WHERE cd.Year > 1980;
SELECT c.Continent, COUNT(cm.Id) AS MakerCount FROM countries AS co JOIN continents AS c ON co.Continent = c.ContId JOIN car_makers AS cm ON co.CountryId = cm.Country GROUP BY c.Continent;
SELECT c.Continent, COUNT(cm.Id) AS NumCarMakers FROM continents AS c JOIN countries AS co ON c.ContId = co.Continent JOIN car_makers AS cm ON co.CountryId = cm.Country GROUP BY c.Continent;
SELECT c.CountryName, COUNT(cm.Maker) AS num_makers FROM countries c JOIN car_makers cm ON c.CountryId = cm.Country GROUP BY c.CountryName ORDER BY num_makers DESC LIMIT 1;
SELECT c.CountryName, COUNT(cm.Id) AS maker_count FROM countries c JOIN car_makers cm ON c.CountryId = cm.Country GROUP BY c.CountryName ORDER BY maker_count DESC LIMIT 1;
SELECT cm.FullName, COUNT(ml.Model) AS ModelCount FROM car_makers cm JOIN model_list ml ON cm.Id = ml.Maker GROUP BY cm.FullName;
SELECT T1.Id, T1.FullName, COUNT(T2.Model) AS NumberOfModels FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.Id;
SELECT cd.Accelerate FROM car_names cn JOIN cars_data cd ON cn.MakeId = cd.Id WHERE cn.Model = 'amc' AND cn.Make = 'amc hornet sportabout (sw)'
SELECT T2.Accelerate FROM car_names AS T1 JOIN cars_data AS T2 ON T1.MakeId = T2.Id WHERE T1.Model = 'amc' AND T1.Make = 'amc hornet sportabout (sw)'
SELECT COUNT(*) FROM `car_makers` WHERE `Country` = (SELECT `CountryId` FROM `countries` WHERE `CountryName` = 'france')
SELECT COUNT(*) FROM `car_makers` WHERE Country = (SELECT CountryId FROM `countries` WHERE CountryName = 'france')
SELECT COUNT(*) FROM model_list JOIN car_makers ON model_list.Maker = car_makers.Id JOIN countries ON car_makers.Country = countries.CountryId WHERE countries.CountryName = 'usa';
SELECT COUNT(*) FROM model_list WHERE Maker IN (SELECT Id FROM car_makers WHERE Country = (SELECT CountryId FROM countries WHERE CountryName = 'usa'));
SELECT AVG(T1.MPG) FROM cars_data AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId JOIN model_list AS T3 ON T3.ModelId = T2.Model WHERE T1.Cylinders = 4;
SELECT AVG(MPG) FROM cars_data WHERE Cylinders = 4;
SELECT MIN(Weight) FROM cars_data WHERE Year = 1974 AND Cylinders = 8;
SELECT MIN(T5.Weight) FROM car_names AS T1 JOIN model_list AS T2 ON T1.Model = T2.ModelId JOIN car_makers AS T3 ON T2.Maker = T3.Id JOIN cars_data AS T5 ON T1.MakeId = T5.Id WHERE T5.Cylinders = 8 AND T5.Year = 1974;
SELECT cm.Maker, ml.Model FROM car_makers AS cm JOIN model_list AS ml ON cm.Id = ml.Maker;
SELECT T1.Maker, T2.Model FROM `car_makers` AS T1 JOIN `model_list` AS T2 ON T1.Id = T2.Maker;
SELECT DISTINCT c.CountryName, c.CountryId FROM countries AS c JOIN car_makers AS m ON c.CountryId = m.Country;
SELECT c.CountryId, c.CountryName FROM countries AS c INNER JOIN car_makers AS m ON c.CountryId = m.Country GROUP BY c.CountryId, c.CountryName;
SELECT COUNT(*) FROM cars_data WHERE CAST(Horsepower AS INTEGER) > 150;
SELECT COUNT(*) FROM cars_data WHERE CAST(Horsepower AS INTEGER) > 150;
SELECT Year, AVG(Weight) FROM cars_data GROUP BY Year;
SELECT AVG(Weight), AVG(Year), Year FROM cars_data GROUP BY Year;
SELECT c.CountryName FROM countries AS c JOIN car_makers AS m ON c.CountryId = m.Country JOIN continents AS con ON c.Continent = con.ContId WHERE con.Continent = 'europe' GROUP BY c.CountryName HAVING COUNT(m.Id) >= 3;
SELECT c.CountryName FROM countries AS c JOIN car_makers AS m ON c.CountryId = m.Country GROUP BY c.CountryName HAVING COUNT(m.Id) >= 3;
SELECT MAX(cars_data.Horsepower), car_names.Make FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId JOIN model_list ON car_names.Model = model_list.Model WHERE cars_data.Cylinders = 3;
SELECT m.Model, c.Maker FROM cars_data AS d JOIN car_names AS n ON d.Id = n.MakeId JOIN model_list AS m ON n.Model = m.ModelId JOIN car_makers AS c ON m.Maker = c.Id WHERE d.Cylinders = 3 ORDER BY d.Horsepower DESC LIMIT 1;
SELECT ml.Model FROM model_list AS ml JOIN car_names AS cn ON ml.ModelId = cn.MakeId JOIN cars_data AS cd ON cn.MakeId = cd.Id WHERE cd.MPG = (SELECT MAX(MPG) FROM cars_data)
SELECT cn.Model FROM car_names AS cn JOIN cars_data AS cd ON cn.MakeId = cd.Id JOIN model_list AS ml ON cn.Model = ml.Model ORDER BY cd.MPG DESC LIMIT 1;
SELECT AVG(CAST(Horsepower AS INTEGER)) FROM cars_data WHERE Year < 1980;
SELECT AVG(Horsepower) FROM cars_data WHERE Year < 1980 AND Horsepower IS NOT NULL;
SELECT AVG(T3.Edispl) FROM model_list AS T1 JOIN car_names AS T2 ON T1.Model = T2.Model JOIN cars_data AS T3 ON T3.Id = T2.MakeId WHERE T1.Model = 'volvo';
SELECT AVG(T4.Edispl) FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker JOIN car_names AS T3 ON T2.Model = T3.Model JOIN cars_data AS T4 ON T3.MakeId = T4.Id WHERE T1.Maker = 'volkswagen';
SELECT Cylinders, MAX(Accelerate) FROM cars_data GROUP BY Cylinders;
SELECT Cylinders, MAX(Accelerate) FROM cars_data GROUP BY Cylinders;
SELECT ml.ModelId, COUNT(DISTINCT cn.Make) AS num_versions FROM car_names AS cn JOIN model_list AS ml ON cn.Model = ml.Model GROUP BY ml.ModelId ORDER BY num_versions DESC LIMIT 1;
SELECT Model, COUNT(MakeId) AS version_count FROM car_names GROUP BY Model ORDER BY version_count DESC LIMIT 1;
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 4;
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 4;
SELECT COUNT(*) FROM cars_data WHERE Year = 1980;
SELECT COUNT(*) FROM cars_data WHERE Year = 1980;
SELECT COUNT(*) FROM model_list WHERE Maker = (SELECT Id FROM car_makers WHERE FullName = 'American Motor Company')
SELECT COUNT(*) FROM model_list WHERE Maker = (SELECT Id FROM car_makers WHERE Maker = 'amc')
SELECT cm.FullName, cm.Id FROM car_makers AS cm JOIN model_list AS ml ON cm.Id = ml.Maker GROUP BY cm.Id HAVING COUNT(ml.Model) > 3;
SELECT T1.Maker, T1.Id FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.Maker HAVING COUNT(T2.Model) > 3;
SELECT DISTINCT ml.Model FROM car_makers cm JOIN model_list ml ON cm.Id = ml.Maker JOIN cars_data cd ON ml.ModelId = cd.Id WHERE cm.FullName = 'General Motors' OR cd.Weight > 3500;
SELECT DISTINCT ml.Model FROM model_list AS ml JOIN car_makers AS cm ON ml.Maker = cm.Id JOIN cars_data AS cd ON ml.ModelId = cd.Id WHERE cm.FullName = 'General Motors' OR cd.Weight > 3500;
SELECT DISTINCT Year FROM cars_data WHERE Weight BETWEEN 3000 AND 4000;
SELECT T1.Year FROM (SELECT DISTINCT Year FROM cars_data WHERE Weight < 4000) AS T1 INNER JOIN (SELECT DISTINCT Year FROM cars_data WHERE Weight > 3000) AS T2 ON T1.Year = T2.Year
SELECT T1.Horsepower FROM cars_data AS T1 JOIN (SELECT MAX(Accelerate) AS MaxAccel FROM cars_data) AS T2 WHERE T1.Accelerate = T2.MaxAccel;
SELECT `Horsepower` FROM `cars_data` WHERE `Accelerate` = (SELECT MAX(`Accelerate`) FROM `cars_data`)
SELECT T3.Cylinders FROM model_list AS T1 JOIN car_makers AS T2 ON T1.Maker = T2.Id JOIN cars_data AS T3 ON T1.ModelId = T3.Id WHERE T2.Maker = 'volkswagen' ORDER BY T3.Accelerate ASC LIMIT 1;
SELECT T3.Cylinders FROM car_names AS T1 JOIN model_list AS T2 ON T1.Model = T2.ModelId JOIN cars_data AS T3 ON T1.MakeId = T3.Id WHERE T2.Maker = 'volkswagen' ORDER BY T3.Accelerate ASC LIMIT 1;
SELECT COUNT(*) FROM `cars_data` WHERE Accelerate > (SELECT MAX(Accelerate) FROM `cars_data` WHERE Horsepower = (SELECT MAX(Horsepower) FROM `cars_data`))
SELECT COUNT(*) FROM `cars_data` WHERE Accelerate > (SELECT MIN(Accelerate) FROM `cars_data` WHERE Horsepower = (SELECT MAX(Horsepower) FROM `cars_data`))
SELECT c.CountryName, COUNT(cm.Id) AS maker_count FROM countries c JOIN car_makers cm ON c.CountryId = cm.Country GROUP BY c.CountryName HAVING maker_count > 2;
SELECT COUNT(*) FROM (SELECT Country FROM car_makers GROUP BY Country HAVING COUNT(*) > 2) AS T
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 6;
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 6;
SELECT ml.ModelId FROM model_list AS ml JOIN car_makers AS cm ON ml.Maker = cm.Id JOIN countries AS c ON cm.Country = c.CountryId JOIN cars_data AS cd ON ml.ModelId = cd.Id WHERE cd.Cylinders = 4 ORDER BY cd.Horsepower DESC LIMIT 1;
SELECT cn.Model FROM car_names AS cn JOIN cars_data AS cd ON cn.MakeId = cd.Id WHERE cd.Cylinders = 4 ORDER BY cd.Horsepower DESC LIMIT 1;
SELECT T4.MakeId, T4.Model FROM `cars_data` AS T1 JOIN `car_names` AS T2 ON T1.Id = T2.MakeId JOIN `model_list` AS T3 ON T3.ModelId = T2.Model JOIN `car_makers` AS T4 ON T4.Id = T3.Maker WHERE T1.Horsepower > (SELECT MIN(Horsepower) FROM `cars_data`) AND T1.Cylinders <= 3;
SELECT T3.MakeId, T3.Model FROM (SELECT * FROM cars_data WHERE Cylinders < 4 AND Horsepower NOT IN(SELECT MIN(Horsepower) FROM cars_data)) AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker JOIN car_names AS T3 ON T2.Model = T3.Model
SELECT MAX(MPG) FROM cars_data WHERE Cylinders = 8 OR Year < 1980;
SELECT MAX(MPG) FROM cars_data WHERE Cylinders = 8 OR Year < 1980;
SELECT ml.Model FROM model_list AS ml JOIN car_names AS cn ON ml.ModelId = cn.MakeId JOIN cars_data AS cd ON cn.MakeId = cd.Id JOIN car_makers AS cm ON ml.Maker = cm.Id WHERE cd.Weight < 3500 AND cm.FullName != 'Ford Motor Company';
SELECT DISTINCT T1.Model FROM model_list AS T1 JOIN car_makers AS T2 ON T1.Maker = T2.Id JOIN cars_data AS T3 ON T3.Id = (SELECT MakeId FROM car_names WHERE Model = T1.Model) WHERE T3.Weight < 3500 AND T2.FullName != 'Ford Motor Company';
SELECT c.CountryName FROM countries AS c LEFT JOIN car_makers AS m ON c.CountryId = m.Country WHERE m.Country IS NULL;
SELECT CountryName FROM countries WHERE CountryId NOT IN (SELECT Country FROM car_makers);
SELECT T1.Id, T1.Maker FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker WHERE T2.Model IN (SELECT Model FROM model_list GROUP BY Maker HAVING COUNT(*) >= 2) AND T1.Maker IN (SELECT Maker FROM (SELECT Maker, COUNT(Maker) AS maker_count FROM car_makers GROUP BY Maker HAVING maker_count > 3));
SELECT cm.Id, cm.Maker FROM car_makers AS cm JOIN (SELECT Model, COUNT(*) AS model_count FROM model_list GROUP BY Maker HAVING model_count >= 2) AS m ON cm.Id = m.Maker JOIN (SELECT Model, COUNT(*) AS car_count FROM car_names JOIN cars_data ON car_names.MakeId = cars_data.Id GROUP BY Model HAVING car_count > 3) AS c ON m.Model = c.Model;
SELECT T2.CountryId, T1.CountryName FROM (SELECT T4.Model AS Model, T3.Country AS Country FROM car_makers AS T3 JOIN model_list AS T4 ON T3.Id = T4.Maker WHERE T4.Model = 'fiat') AS T1 JOIN countries AS T2 ON T1.Country = T2.CountryId UNION SELECT T5.CountryId, T6.CountryName FROM (SELECT T7.Country, COUNT(*) AS cnt FROM car_makers AS T7 GROUP BY T7.Country HAVING cnt > 3) AS T5 JOIN countries AS T6 ON T5.Country = T6.CountryId
SELECT c.CountryId, c.CountryName FROM `countries` AS c WHERE (c.CountryId IN (SELECT cm.Country FROM `car_makers` AS cm GROUP BY cm.Country HAVING COUNT(cm.Id) > 3)) OR EXISTS(SELECT ml.Model FROM `model_list` AS ml JOIN `car_makers` AS cm ON ml.Maker = cm.Id WHERE ml.Model = 'fiat' AND c.CountryId = cm.Country);
SELECT Country FROM airlines WHERE Airline = 'JetBlue Airways';
{     "chain_of_thought_reasoning": "The question asks for the country Jetblue Airways is affiliated with. However, Jetblue Airways is not listed in the airlines table provided in the schema. The airlines table contains a list of airlines and their respective countries. Since Jetblue Airways is not in the list, we cannot generate a valid SQL query to answer this question based on the given data.",     "SQL": "" }
{     "chain_of_thought_reasoning": "The question asks for the abbreviation of JetBlue Airways. However, there is no entry in the airlines table that matches 'JetBlue Airways'. This could be due to an incomplete database or a mistake in the question. Assuming the question is correct and the data is incomplete, we cannot generate a valid SQL query to answer this question based on the given schema and data.",     "SQL": "" }
SELECT Abbreviation FROM airlines WHERE Airline = 'Jetblue Airways';
SELECT Airline, Abbreviation FROM airlines WHERE Country = 'USA';
SELECT Airline, Abbreviation FROM airlines WHERE Country = 'USA';
SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony';
SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony';
SELECT COUNT(*) FROM airlines;
SELECT COUNT(*) FROM airlines;
SELECT COUNT(DISTINCT AirportCode) FROM airports;
SELECT COUNT(*) FROM airports;
SELECT COUNT(*) FROM flights;
SELECT COUNT(*) FROM flights;
SELECT Airline FROM airlines WHERE Abbreviation = 'UAL';
SELECT Airline FROM airlines WHERE Abbreviation = 'UAL';
SELECT COUNT(*) FROM airlines WHERE Country = 'USA';
SELECT COUNT(Airline) FROM airlines WHERE Country = 'USA';
SELECT City, Country FROM airports WHERE AirportName = 'Alton';
SELECT City, Country FROM airports WHERE AirportName = 'Alton';
SELECT AirportName FROM airports WHERE AirportCode = 'AKO';
SELECT AirportName FROM airports WHERE AirportCode = 'AKO';
SELECT AirportName FROM airports WHERE City = 'Aberdeen'
SELECT AirportName FROM airports WHERE City = 'Aberdeen '
SELECT COUNT(*) FROM flights WHERE SourceAirport = 'APG';
SELECT COUNT(*) FROM flights WHERE SourceAirport = ' APG';
SELECT COUNT(*) FROM flights WHERE DestAirport = 'ATO';
SELECT COUNT(`FlightNo`) FROM `flights` WHERE `DestAirport` = 'ATO';
SELECT COUNT(*) FROM flights JOIN airports ON flights.SourceAirport = airports.AirportCode WHERE airports.City = 'Aberdeen'
SELECT COUNT(*) FROM `flights` WHERE `SourceAirport` = (SELECT `AirportCode` FROM `airports` WHERE City = 'Aberdeen')
SELECT COUNT(*) FROM `flights` JOIN `airports` ON `flights`.`DestAirport` = `airports`.`AirportCode` WHERE `airports`.`City` = 'Aberdeen '
SELECT COUNT(*) FROM `flights` WHERE `DestAirport` IN (SELECT `AirportCode` FROM `airports` WHERE City = 'Aberdeen')
SELECT COUNT(*) FROM flights INNER JOIN airports AS src_airport ON flights.SourceAirport = src_airport.AirportCode INNER JOIN airports AS dest_airport ON flights.DestAirport = dest_airport.AirportCode WHERE src_airport.City = 'Aberdeen' AND dest_airport.City = 'Ashley';
SELECT COUNT(*) FROM `flights` WHERE SourceAirport = (SELECT AirportCode FROM `airports` WHERE City = 'Aberdeen') AND DestAirport = (SELECT AirportCode FROM `airports` WHERE City = 'Ashley')
SELECT COUNT(*) FROM flights JOIN airlines ON flights.Airline = airlines.uid WHERE airlines.Airline = 'JetBlue Airways';
{     "chain_of_thought_reasoning": "The question asks for the number of Jetblue Airways flights. However, there is no entry in the airlines table that matches 'Jetblue Airways'. Therefore, it's impossible to generate a valid SQLite query that returns the number of Jetblue Airways flights based on the given schema and data.",     "SQL": "" }
SELECT COUNT(*) FROM airlines JOIN flights ON airlines.uid = flights.Airline WHERE airlines.Abbreviation = 'UAL' AND flights.DestAirport = ' ASY';
SELECT COUNT(*) FROM flights JOIN airlines ON flights.Airline = airlines.uid WHERE airlines.Airline = 'United Airlines' AND flights.DestAirport = ' ASY';
SELECT COUNT(*) FROM flights JOIN airlines ON flights.Airline = airlines.uid WHERE airlines.Airline = 'United Airlines' AND flights.SourceAirport = 'AHD';
SELECT COUNT(*) FROM `flights` JOIN `airlines` ON `flights`.`Airline` = `airlines`.`uid` WHERE `airlines`.`Airline` = 'United Airlines' AND `flights`.`SourceAirport` = 'AHD';
SELECT COUNT(*) FROM flights JOIN airlines ON flights.Airline = airlines.uid JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airlines.Airline = 'United Airlines' AND airports.City = 'Aberdeen';
SELECT COUNT(*) FROM `flights` JOIN `airlines` ON `flights`.`Airline` = `airlines`.`uid` JOIN `airports` ON `flights`.`DestAirport` = `airports`.`AirportCode` WHERE `airlines`.`Airline` = 'United Airlines' AND `airports`.`City` = 'Aberdeen '
SELECT T2.City, COUNT(*) AS num_flights FROM `flights` AS T1 JOIN `airports` AS T2 ON T1.DestAirport = T2.AirportCode GROUP BY T2.City ORDER BY num_flights DESC LIMIT 1;
SELECT T2.City, COUNT(*) AS flight_count FROM `flights` AS T1 JOIN `airports` AS T2 ON T1.DestAirport = T2.AirportCode GROUP BY T2.City ORDER BY flight_count DESC LIMIT 1;
SELECT T2.City, COUNT(*) AS num_flights FROM flights AS T1 JOIN airports AS T2 ON T1.SourceAirport = T2.AirportCode GROUP BY T2.City ORDER BY num_flights DESC LIMIT 1;
SELECT T2.City FROM flights AS T1 JOIN airports AS T2 ON T1.SourceAirport = T2.AirportCode GROUP BY T2.City ORDER BY COUNT(T2.City) DESC LIMIT 1;
SELECT a.AirportCode FROM airports AS a JOIN (SELECT SourceAirport FROM flights UNION SELECT DestAirport FROM flights) AS f ON a.AirportCode = f.SourceAirport GROUP BY a.AirportCode ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T2.AirportCode FROM `flights` AS T1 JOIN `airports` AS T2 ON T1.SourceAirport = T2.AirportCode GROUP BY T1.SourceAirport ORDER BY COUNT(T1.FlightNo) DESC LIMIT 1 UNION SELECT T3.AirportCode FROM `flights` AS T1 JOIN `airports` AS T3 ON T1.DestAirport = T3.AirportCode GROUP BY T1.DestAirport ORDER BY COUNT(T1.FlightNo) DESC LIMIT 1
SELECT T1.AirportCode FROM `airports` AS T1 JOIN `flights` AS T2 ON T1.AirportCode = T2.SourceAirport OR T1.AirportCode = T2.DestAirport GROUP BY T1.AirportCode ORDER BY COUNT(T2.FlightNo) ASC LIMIT 1;
SELECT T1.AirportCode FROM airports AS T1 JOIN (SELECT SourceAirport, COUNT(*) AS cnt FROM flights GROUP BY SourceAirport UNION ALL SELECT DestAirport, COUNT(*) AS cnt FROM flights GROUP BY DestAirport) AS T2 ON T1.AirportCode = T2.SourceAirport OR T1.AirportCode = T2.DestAirport GROUP BY T1.AirportCode ORDER BY COUNT(T2.cnt) ASC LIMIT 1
SELECT airlines.Airline, COUNT(flights.FlightNo) AS flight_count FROM airlines JOIN flights ON airlines.uid = flights.Airline GROUP BY airlines.Airline ORDER BY flight_count DESC LIMIT 1;
SELECT a.Airline, COUNT(f.FlightNo) AS flight_count FROM airlines a JOIN flights f ON a.uid = f.Airline GROUP BY a.Airline ORDER BY flight_count DESC LIMIT 1;
SELECT T2.Abbreviation, T2.Country FROM (SELECT Airline, COUNT(*) AS FlightCount FROM flights GROUP BY Airline) AS T1 JOIN airlines AS T2 ON T1.Airline = T2.uid ORDER BY T1.FlightCount ASC LIMIT 1;
SELECT T1.Abbreviation, T1.Country FROM airlines AS T1 JOIN (SELECT Airline, COUNT(*) AS flight_count FROM flights GROUP BY Airline ORDER BY flight_count ASC LIMIT 1) AS T2 ON T1.uid = T2.Airline
SELECT DISTINCT airlines.Airline FROM airlines JOIN flights ON airlines.uid = flights.Airline WHERE flights.SourceAirport = 'AHD';
SELECT a.Airline FROM airlines AS a JOIN flights AS f ON a.uid = f.Airline WHERE f.SourceAirport = ' AHD';
SELECT DISTINCT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.DestAirport = 'AHD';
SELECT airlines.Airline FROM airlines JOIN flights ON airlines.uid = flights.Airline WHERE flights.DestAirport = 'AHD';
SELECT f1.Airline FROM flights AS f1 JOIN flights AS f2 ON f1.Airline = f2.Airline WHERE f1.SourceAirport = 'APG' AND f2.DestAirport = 'CVO';
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'APG' INTERSECT SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'CVO'
SELECT DISTINCT T1.Airline FROM flights AS T1 JOIN airlines AS T2 ON T1.Airline = T2.uid WHERE T1.SourceAirport = 'CVO' EXCEPT SELECT DISTINCT T1.Airline FROM flights AS T1 JOIN airlines AS T2 ON T1.Airline = T2.uid WHERE T1.SourceAirport = 'APG';
SELECT DISTINCT T1.Airline FROM flights AS T1 JOIN airlines AS T2 ON T1.Airline = T2.uid WHERE T1.SourceAirport = 'CVO' EXCEPT SELECT DISTINCT T1.Airline FROM flights AS T1 JOIN airlines AS T2 ON T1.Airline = T2.uid WHERE T1.SourceAirport = 'APG';
SELECT A.Airline FROM airlines AS A JOIN flights AS F ON A.uid = F.Airline GROUP BY A.Airline HAVING COUNT(F.FlightNo) >= 10;
SELECT T2.Airline FROM flights AS T1 JOIN airlines AS T2 ON T1.Airline = T2.uid GROUP BY T2.Airline HAVING COUNT(T1.FlightNo) >= 10;
SELECT A.Airline FROM airlines AS A JOIN (SELECT Airline, COUNT(*) AS flight_count FROM flights GROUP BY Airline) AS F ON A.uid = F.Airline WHERE F.flight_count < 200;
SELECT a.Airline, COUNT(f.FlightNo) AS flight_count FROM airlines a JOIN flights f ON a.uid = f.Airline GROUP BY a.Airline HAVING flight_count < 200;
SELECT T2.FlightNo FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T1.Airline = 'United Airlines';
SELECT f.FlightNo FROM flights AS f JOIN airlines AS a ON f.Airline = a.uid WHERE a.Abbreviation = 'UAL';
SELECT FlightNo FROM flights WHERE SourceAirport = ' APG';
SELECT FlightNo FROM flights WHERE SourceAirport = 'APG';
SELECT FlightNo FROM flights WHERE DestAirport = 'APG';
SELECT FlightNo FROM flights WHERE DestAirport = ' APG';
SELECT T2.FlightNo FROM `airports` AS T1 JOIN `flights` AS T2 ON T1.AirportCode = T2.SourceAirport WHERE T1.City = 'Aberdeen';
SELECT T2.FlightNo FROM `airports` AS T1 JOIN `flights` AS T2 ON T1.AirportCode = T2.SourceAirport WHERE T1.City = 'Aberdeen '
SELECT T2.FlightNo FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode = T2.DestAirport WHERE T1.City = 'Aberdeen';
SELECT T2.FlightNo FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode = T2.DestAirport WHERE T1.City = 'Aberdeen '
SELECT COUNT(*) FROM `flights` WHERE DestAirport IN (SELECT AirportCode FROM `airports` WHERE City IN ('Aberdeen', 'Abilene'))
SELECT COUNT(*) FROM flights JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airports.City IN ('Aberdeen', 'Abilene')
SELECT AirportCode FROM airports WHERE NOT EXISTS(SELECT * FROM flights WHERE flights.SourceAirport = airports.AirportCode OR flights.DestAirport = airports.AirportCode);
SELECT T1.AirportCode FROM airports AS T1 LEFT JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport WHERE T2.Airline IS NULL UNION ALL SELECT T3.AirportCode FROM airports AS T3 LEFT JOIN flights AS T4 ON T3.AirportCode = T4.DestAirport WHERE T4.Airline IS NULL EXCEPT SELECT DISTINCT AirportCode FROM airports WHERE AirportCode IN (SELECT SourceAirport FROM flights) OR AirportCode IN (SELECT DestAirport FROM flights);
SELECT COUNT(*) FROM employee;
SELECT COUNT(*) FROM `employee`;
SELECT Name FROM employee ORDER BY Age ASC;
SELECT Name FROM employee ORDER BY Age ASC;
SELECT City, COUNT(*) FROM employee GROUP BY City;
SELECT City, COUNT(*) FROM `employee` GROUP BY City;
SELECT City FROM employee WHERE Age < 30 GROUP BY City HAVING COUNT(*) > 1;
SELECT City FROM employee WHERE Age < 30 GROUP BY City HAVING COUNT(*) > 1;
SELECT Location, COUNT(Shop_ID) FROM shop GROUP BY Location;
SELECT Location, COUNT(Shop_ID) FROM shop GROUP BY Location;
SELECT Manager_name, District FROM shop WHERE Number_products = (SELECT MAX(Number_products) FROM shop);
SELECT Manager_name, District FROM shop ORDER BY Number_products DESC LIMIT 1;
SELECT MIN(Number_products) AS Min_Products, MAX(Number_products) AS Max_Products FROM shop;
SELECT MIN(Number_products) AS Min_Products, MAX(Number_products) AS Max_Products FROM shop;
SELECT Name, Location, District FROM shop ORDER BY Number_products DESC;
SELECT `Name`, `Location`, `District` FROM `shop` ORDER BY `Number_products` DESC;
SELECT T1.Name, T1.Number_products FROM shop AS T1 WHERE T1.Number_products > (SELECT AVG(Number_products) FROM shop);
SELECT Name FROM shop WHERE Number_products > (SELECT AVG(Number_products) FROM shop);
SELECT e.Name FROM `employee` AS e JOIN `evaluation` AS ev ON e.Employee_ID = ev.Employee_ID GROUP BY ev.Employee_ID, e.Name ORDER BY COUNT(ev.Year_awarded) DESC LIMIT 1;
SELECT T1.Name FROM `employee` AS T1 JOIN (SELECT Employee_ID, COUNT(*) as award_count FROM `evaluation` GROUP BY Employee_ID ORDER BY award_count DESC LIMIT 1) AS T2 ON T1.Employee_ID = T2.Employee_ID;
SELECT e.Name FROM employee AS e JOIN evaluation AS ev ON e.Employee_ID = ev.Employee_ID WHERE ev.Bonus = (SELECT MAX(Bonus) FROM evaluation);
SELECT e.Name FROM evaluation AS ev JOIN employee AS e ON ev.Employee_ID = e.Employee_ID WHERE ev.Bonus = (SELECT MAX(Bonus) FROM evaluation);
SELECT e.Name FROM employee AS e LEFT JOIN evaluation AS ev ON e.Employee_ID = ev.Employee_ID WHERE ev.Year_awarded IS NULL;
SELECT e.Name FROM employee AS e LEFT JOIN evaluation AS ev ON e.Employee_ID = ev.Employee_ID WHERE ev.Year_awarded IS NULL;
SELECT s.Name FROM `shop` AS s JOIN `hiring` AS h ON s.Shop_ID = h.Shop_ID GROUP BY h.Shop_ID ORDER BY COUNT(h.Employee_ID) DESC LIMIT 1;
SELECT T2.Name FROM (SELECT Shop_ID, COUNT(Employee_ID) AS employee_count FROM hiring GROUP BY Shop_ID ORDER BY employee_count DESC LIMIT 1) AS T1 JOIN shop AS T2 ON T1.Shop_ID = T2.Shop_ID;
SELECT s.Name FROM shop AS s LEFT JOIN hiring AS h ON s.Shop_ID = h.Shop_ID WHERE h.Shop_ID IS NULL;
SELECT s.Name FROM shop AS s LEFT JOIN hiring AS h ON s.Shop_ID = h.Shop_ID WHERE h.Employee_ID IS NULL;
SELECT s.Name AS Shop_Name, COUNT(h.Employee_ID) AS Number_of_Employees FROM hiring h JOIN employee e ON h.Employee_ID = e.Employee_ID JOIN shop s ON h.Shop_ID = s.Shop_ID GROUP BY s.Shop_ID;
SELECT s.Name AS Shop_Name, COUNT(h.Employee_ID) AS Number_of_Employees FROM hiring h JOIN employee e ON h.Employee_ID = e.Employee_ID JOIN shop s ON h.Shop_ID = s.Shop_ID GROUP BY s.Shop_ID;
SELECT SUM(Bonus) FROM evaluation;
SELECT SUM(Bonus) FROM evaluation;
SELECT * FROM hiring;
SELECT * FROM hiring;
SELECT DISTINCT T2.District FROM shop AS T1 JOIN shop AS T2 ON T1.District = T2.District WHERE (T1.Number_products < 3000 AND T2.Number_products > 10000) OR (T1.Number_products > 10000 AND T2.Number_products < 3000);
SELECT DISTINCT T1.District FROM shop AS T1 WHERE T1.Number_products < 3000 INTERSECT SELECT DISTINCT T1.District FROM shop AS T1 WHERE T1.Number_products > 10000
SELECT COUNT(DISTINCT Location) FROM shop;
SELECT COUNT(DISTINCT Location) FROM shop;
SELECT COUNT(*) FROM Documents;
SELECT COUNT(Document_ID) FROM Documents;
SELECT Document_ID, Document_Name, Document_Description FROM Documents;
SELECT Document_ID, Document_Name, Document_Description FROM Documents;
SELECT Document_Name, Template_ID FROM Documents WHERE Document_Description LIKE '%w%'
SELECT Document_Name, Template_ID FROM Documents WHERE Document_Description LIKE '%w%'
SELECT Document_ID, Template_ID, Document_Description FROM Documents WHERE Document_Name = 'Robbin CV';
SELECT Document_ID, Template_ID, Document_Description FROM Documents WHERE Document_Name = 'Robbin CV';
SELECT COUNT(DISTINCT Template_ID) FROM Documents;
SELECT COUNT(DISTINCT Template_ID) FROM Documents;
SELECT COUNT(*) FROM Documents JOIN Templates ON Documents.Template_ID = Templates.Template_ID JOIN Ref_Template_Types ON Templates.Template_Type_Code = Ref_Template_Types.Template_Type_Code WHERE Ref_Template_Types.Template_Type_Code = 'PPT';
SELECT COUNT(*) FROM Documents JOIN Templates ON Documents.Template_ID = Templates.Template_ID JOIN Ref_Template_Types ON Templates.Template_Type_Code = Ref_Template_Types.Template_Type_Code WHERE Ref_Template_Types.Template_Type_Code = 'PPT';
SELECT T.Template_ID, COUNT(D.Document_ID) AS Document_Count FROM Templates T LEFT JOIN Documents D ON T.Template_ID = D.Template_ID GROUP BY T.Template_ID;
SELECT T.Template_ID, COUNT(*) AS Usage_Count FROM `Documents` AS D JOIN `Templates` AS T ON D.Template_ID = T.Template_ID GROUP BY T.Template_ID;
SELECT T2.Template_ID, T2.Template_Type_Code FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T2.Template_ID, T2.Template_Type_Code ORDER BY COUNT(T1.Document_ID) DESC LIMIT 1;
SELECT T2.Template_ID, T2.Template_Type_Code FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T2.Template_Type_Code ORDER BY COUNT(T1.Document_ID) DESC LIMIT 1;
SELECT T.Template_ID FROM Templates AS T WHERE T.Template_ID IN (SELECT D.Template_ID FROM Documents AS D GROUP BY D.Template_ID HAVING COUNT(D.Document_ID) > 1);
SELECT T.Template_ID FROM Documents AS D JOIN Templates AS T ON D.Template_ID = T.Template_ID GROUP BY T.Template_ID HAVING COUNT(D.Document_ID) > 1;
SELECT Template_ID FROM Templates WHERE Template_ID NOT IN (SELECT Template_ID FROM Documents);
SELECT T.Template_ID FROM Templates AS T LEFT JOIN Documents AS D ON T.Template_ID = D.Template_ID WHERE D.Document_ID IS NULL;
SELECT COUNT(DISTINCT Template_ID) FROM Templates;
SELECT COUNT(Template_ID) FROM Templates;
SELECT Template_ID, Version_Number, Template_Type_Code FROM Templates;
SELECT Template_ID, Version_Number, Template_Type_Code FROM Templates;
SELECT DISTINCT Template_Type_Code FROM Templates;
SELECT DISTINCT Template_Type_Code FROM Ref_Template_Types;
SELECT Template_ID FROM Templates WHERE Template_Type_Code IN ('PP', 'PPT')
SELECT Template_ID FROM Templates WHERE Template_Type_Code IN ('PP', 'PPT');
SELECT COUNT(*) FROM Templates WHERE Template_Type_Code = 'CV';
SELECT COUNT(*) FROM Templates WHERE Template_Type_Code = 'CV';
SELECT Version_Number, Template_Type_Code FROM Templates WHERE Version_Number > 5;
SELECT Version_Number, Template_Type_Code FROM Templates WHERE Version_Number > 5;
SELECT Ref_Template_Types.Template_Type_Code, COUNT(Templates.Template_ID) AS NumberOfTemplates FROM Templates INNER JOIN Ref_Template_Types ON Templates.Template_Type_Code = Ref_Template_Types.Template_Type_Code GROUP BY Ref_Template_Types.Template_Type_Code;
SELECT Ref_Template_Types.Template_Type_Code, COUNT(Templates.Template_ID) AS Number_of_Templates FROM Templates JOIN Ref_Template_Types ON Templates.Template_Type_Code = Ref_Template_Types.Template_Type_Code GROUP BY Ref_Template_Types.Template_Type_Code;
SELECT Template_Type_Code, COUNT(*) AS num_templates FROM Templates GROUP BY Template_Type_Code ORDER BY num_templates DESC LIMIT 1;
SELECT T2.Template_Type_Code FROM Templates AS T1 JOIN Ref_Template_Types AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code GROUP BY T2.Template_Type_Code ORDER BY COUNT(T1.Template_ID) DESC LIMIT 1;
SELECT T2.Template_Type_Code FROM Templates AS T1 JOIN Ref_Template_Types AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code GROUP BY T2.Template_Type_Code HAVING COUNT(*) < 3;
SELECT T2.Template_Type_Code FROM Templates AS T1 JOIN Ref_Template_Types AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code GROUP BY T2.Template_Type_Code HAVING COUNT(*) < 3;
SELECT T1.Version_Number, T1.Template_Type_Code FROM Templates AS T1 JOIN Ref_Template_Types AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code WHERE T1.Version_Number = (SELECT MIN(Version_Number) FROM Templates);
SELECT MIN(Version_Number), Template_Type_Code FROM Templates;
SELECT T2.Template_Type_Code FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID WHERE T1.Document_Name = 'Data base';
SELECT T2.Template_Type_Code FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID WHERE T1.Document_Name = 'Data base';
SELECT D.Document_Name FROM Documents AS D JOIN Templates AS T ON D.Template_ID = T.Template_ID JOIN Ref_Template_Types AS RTT ON T.Template_Type_Code = RTT.Template_Type_Code WHERE RTT.Template_Type_Code = 'BK';
SELECT D.Document_Name FROM Documents AS D JOIN Templates AS T ON D.Template_ID = T.Template_ID WHERE T.Template_Type_Code = 'BK';
SELECT T2.Template_Type_Code, COUNT(DISTINCT T1.Document_ID) AS Document_Count FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID JOIN Ref_Template_Types AS T3 ON T2.Template_Type_Code = T3.Template_Type_Code GROUP BY T2.Template_Type_Code;
SELECT r.Template_Type_Code, COUNT(d.Document_ID) AS Document_Count FROM Ref_Template_Types r JOIN Templates t ON r.Template_Type_Code = t.Template_Type_Code JOIN Documents d ON t.Template_ID = d.Template_ID GROUP BY r.Template_Type_Code;
SELECT T2.Template_Type_Code FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T2.Template_Type_Code ORDER BY COUNT(T1.Document_ID) DESC LIMIT 1;
SELECT T2.Template_Type_Code FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T2.Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T1.Template_Type_Code FROM Templates AS T1 WHERE T1.Template_ID NOT IN (SELECT DISTINCT T2.Template_ID FROM Documents AS T2)
SELECT T1.Template_Type_Code FROM Ref_Template_Types AS T1 LEFT JOIN Templates AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code LEFT JOIN Documents AS T3 ON T2.Template_ID = T3.Template_ID WHERE T3.Document_ID IS NULL GROUP BY T1.Template_Type_Code;
SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types;
SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types;
SELECT Template_Type_Description FROM Ref_Template_Types WHERE Template_Type_Code = 'AD';
SELECT Template_Type_Description FROM Ref_Template_Types WHERE Template_Type_Code = 'AD';
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Book';
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Book';
SELECT DISTINCT T2.Template_Type_Description FROM Templates AS T1 JOIN Ref_Template_Types AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code JOIN Documents AS T3 ON T1.Template_ID = T3.Template_ID
SELECT DISTINCT T.Template_Type_Description FROM Templates AS T JOIN Documents AS D ON T.Template_ID = D.Template_ID
SELECT T.Template_ID FROM Templates AS T JOIN Ref_Template_Types AS RTT ON T.Template_Type_Code = RTT.Template_Type_Code WHERE RTT.Template_Type_Description = 'Presentation';
SELECT T1.Template_ID FROM Templates AS T1 JOIN Ref_Template_Types AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code WHERE T2.Template_Type_Description = 'Presentation';
SELECT COUNT(*) FROM Paragraphs;
SELECT COUNT(Paragraph_ID) FROM Paragraphs;
SELECT COUNT(*) FROM `Paragraphs` WHERE `Document_ID` = (SELECT `Document_ID` FROM `Documents` WHERE `Document_Name` = 'Summer Show')
SELECT COUNT(*) FROM Paragraphs WHERE Document_ID IN (SELECT Document_ID FROM Documents WHERE Document_Name = 'Summer Show')
SELECT * FROM Paragraphs WHERE Paragraph_Text = 'Korea';
SELECT * FROM `Paragraphs` WHERE `Paragraph_Text` LIKE '%Korea%'
SELECT P.Paragraph_ID, P.Paragraph_Text FROM `Paragraphs` AS P JOIN `Documents` AS D ON P.Document_ID = D.Document_ID WHERE D.Document_Name = 'Welcome to NY';
SELECT P.Paragraph_ID, P.Paragraph_Text FROM Paragraphs AS P JOIN Documents AS D ON P.Document_ID = D.Document_ID WHERE D.Document_Name = 'Welcome to NY';
SELECT P.Paragraph_Text FROM Paragraphs AS P JOIN Documents AS D ON P.Document_ID = D.Document_ID WHERE D.Document_Name = 'Customer reviews';
SELECT T2.Paragraph_Text FROM Documents AS T1 JOIN Paragraphs AS T2 ON T1.Document_ID = T2.Document_ID WHERE T1.Document_Name = 'Customer reviews';
SELECT D.Document_ID, COUNT(P.Paragraph_ID) AS NumberOfParagraphs FROM Documents D LEFT JOIN Paragraphs P ON D.Document_ID = P.Document_ID GROUP BY D.Document_ID ORDER BY D.Document_ID;
SELECT D.Document_ID, COUNT(P.Paragraph_ID) AS NumberOfParagraphs FROM Documents D JOIN Paragraphs P ON D.Document_ID = P.Document_ID GROUP BY D.Document_ID ORDER BY D.Document_ID;
SELECT D.Document_ID, D.Document_Name, COUNT(P.Paragraph_ID) AS Number_of_Paragraphs FROM Documents D JOIN Paragraphs P ON D.Document_ID = P.Document_ID GROUP BY D.Document_ID;
SELECT D.Document_ID, D.Document_Name, COUNT(P.Paragraph_ID) AS Number_of_Paragraphs FROM Documents AS D INNER JOIN Paragraphs AS P ON D.Document_ID = P.Document_ID GROUP BY D.Document_ID;
SELECT D.Document_ID FROM `Documents` AS D JOIN `Paragraphs` AS P ON D.Document_ID = P.Document_ID GROUP BY D.Document_ID HAVING COUNT(P.Paragraph_ID) >= 2;
SELECT D.Document_ID FROM Documents AS D JOIN Paragraphs AS P ON D.Document_ID = P.Document_ID GROUP BY D.Document_ID HAVING COUNT(P.Paragraph_ID) >= 2;
SELECT D.Document_ID, D.Document_Name FROM Documents AS D JOIN Paragraphs AS P ON D.Document_ID = P.Document_ID GROUP BY D.Document_ID ORDER BY COUNT(P.Paragraph_ID) DESC LIMIT 1;
SELECT D.Document_ID, D.Document_Name FROM Documents AS D JOIN Paragraphs AS P ON D.Document_ID = P.Document_ID GROUP BY D.Document_ID ORDER BY COUNT(P.Paragraph_ID) DESC LIMIT 1;
SELECT D.Document_ID FROM Documents AS D JOIN Paragraphs AS P ON D.Document_ID = P.Document_ID GROUP BY D.Document_ID ORDER BY COUNT(P.Paragraph_ID) ASC LIMIT 1;
SELECT D.Document_ID FROM Documents AS D JOIN Paragraphs AS P ON D.Document_ID = P.Document_ID GROUP BY D.Document_ID ORDER BY COUNT(P.Paragraph_ID) ASC LIMIT 1;
SELECT D.Document_ID FROM `Documents` AS D JOIN `Paragraphs` AS P ON D.Document_ID = P.Document_ID GROUP BY D.Document_ID HAVING COUNT(P.Paragraph_ID) BETWEEN 1 AND 2;
SELECT D.Document_ID FROM Documents AS D JOIN Paragraphs AS P ON D.Document_ID = P.Document_ID GROUP BY D.Document_ID HAVING COUNT(P.Paragraph_ID) BETWEEN 1 AND 2;
SELECT D.Document_ID FROM Documents AS D JOIN Paragraphs AS P ON D.Document_ID = P.Document_ID WHERE P.Paragraph_Text IN ('Brazil', 'Ireland') GROUP BY D.Document_ID HAVING COUNT(DISTINCT P.Paragraph_Text) = 2
SELECT D.Document_ID FROM Documents AS D WHERE D.Document_ID IN (SELECT P.Document_ID FROM Paragraphs AS P WHERE P.Paragraph_Text = 'Brazil') AND D.Document_ID IN (SELECT P.Document_ID FROM Paragraphs AS P WHERE P.Paragraph_Text = 'Ireland')
SELECT COUNT(*) FROM teacher;
SELECT COUNT(*) FROM teacher;
SELECT Name FROM teacher ORDER BY Age ASC;
SELECT Name FROM teacher ORDER BY Age ASC;
SELECT Age, Hometown FROM teacher;
SELECT Age, Hometown FROM teacher;
SELECT Name FROM teacher WHERE Hometown != 'Little Lever Urban District';
SELECT Name FROM teacher WHERE Hometown != 'Little Lever Urban District';
SELECT Name FROM teacher WHERE Age = 32 OR Age = 33;
SELECT Name FROM teacher WHERE Age = 32 OR Age = 33;
SELECT Hometown FROM teacher ORDER BY Age ASC LIMIT 1;
SELECT `Hometown` FROM `teacher` WHERE `Age` = (SELECT MIN(`Age`) FROM `teacher`);
SELECT Hometown, COUNT(Teacher_ID) FROM teacher GROUP BY Hometown;
SELECT Hometown, COUNT(*) FROM teacher GROUP BY Hometown;
SELECT Hometown FROM teacher GROUP BY Hometown ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Hometown FROM teacher GROUP BY Hometown ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Hometown FROM teacher GROUP BY Hometown HAVING COUNT(*) >= 2;
SELECT Hometown FROM teacher GROUP BY Hometown HAVING COUNT(*) >= 2;
SELECT T2.Name, T3.Course FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID JOIN course AS T3 ON T1.Course_ID = T3.Course_ID;
SELECT T2.Name, T1.Course FROM course AS T1 JOIN course_arrange AS T3 ON T1.Course_ID = T3.Course_ID JOIN teacher AS T2 ON T3.Teacher_ID = T2.Teacher_ID;
SELECT T2.Name, T1.Course FROM course AS T1 INNER JOIN course_arrange AS T3 ON T1.Course_ID = T3.Course_ID INNER JOIN teacher AS T2 ON T2.Teacher_ID = T3.Teacher_ID ORDER BY T2.Name ASC;
SELECT T2.Name, T3.Course FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID JOIN course AS T3 ON T1.Course_ID = T3.Course_ID ORDER BY T2.Name ASC;
SELECT T2.Name FROM course AS T1 JOIN course_arrange AS T3 ON T1.Course_ID = T3.Course_ID JOIN teacher AS T2 ON T2.Teacher_ID = T3.Teacher_ID WHERE T1.Course = 'Math';
SELECT T2.Name FROM course AS T1 JOIN course_arrange AS T3 ON T1.Course_ID = T3.Course_ID JOIN teacher AS T2 ON T3.Teacher_ID = T2.Teacher_ID WHERE T1.Course = 'Math';
SELECT T1.Name, COUNT(T2.Course_ID) AS NumberOfCourses FROM teacher AS T1 JOIN course_arrange AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T1.Name;
SELECT T2.Name, COUNT(T1.Course_ID) AS Course_Count FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T2.Name;
SELECT T2.Name FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T2.Teacher_ID, T2.Name HAVING COUNT(*) >= 2;
SELECT T2.Name FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T2.Teacher_ID HAVING COUNT(T1.Course_ID) >= 2;
SELECT t.Name FROM teacher AS t LEFT JOIN course_arrange AS ca ON t.Teacher_ID = ca.Teacher_ID WHERE ca.Course_ID IS NULL;
SELECT t.Name FROM teacher AS t LEFT JOIN course_arrange AS ca ON t.Teacher_ID = ca.Teacher_ID WHERE ca.Course_ID IS NULL;
SELECT COUNT(*) FROM visitor WHERE Age < 30;
SELECT Name FROM visitor WHERE Level_of_membership > 4 ORDER BY Level_of_membership DESC;
SELECT AVG(Age) FROM visitor WHERE Level_of_membership <= 4;
SELECT Name, Level_of_membership FROM visitor WHERE Level_of_membership > 4 ORDER BY Age DESC;
SELECT Museum_ID, Name FROM museum ORDER BY Num_of_Staff DESC LIMIT 1;
SELECT AVG(Num_of_Staff) FROM museum WHERE Open_Year < '2009';
SELECT Open_Year, Num_of_Staff FROM museum WHERE Name = 'Plaza Museum';
SELECT T1.Name FROM museum AS T1 WHERE T1.Num_of_Staff > (SELECT MIN(Num_of_Staff) FROM museum WHERE Open_Year > '2010')
SELECT v.ID, v.Name, v.Age FROM visit AS vi JOIN visitor AS v ON vi.visitor_ID = v.ID GROUP BY vi.visitor_ID HAVING COUNT(DISTINCT vi.Museum_ID) > 1;
SELECT v.ID, v.Name, v.Level_of_membership FROM visitor AS v JOIN (SELECT visitor_ID, SUM(Total_spent) AS Total_Spent FROM visit GROUP BY visitor_ID ORDER BY Total_Spent DESC LIMIT 1) AS t ON v.ID = t.visitor_ID;
SELECT T1.Museum_ID, T2.Name FROM (SELECT Museum_ID, COUNT(*) AS visit_count FROM visit GROUP BY Museum_ID) AS T1 JOIN museum AS T2 ON T1.Museum_ID = T2.Museum_ID ORDER BY T1.visit_count DESC LIMIT 1;
SELECT m.Name FROM museum m LEFT JOIN visit v ON m.Museum_ID = v.Museum_ID WHERE v.visitor_ID IS NULL;
SELECT T2.Name, T2.Age FROM visit AS T1 JOIN visitor AS T2 ON T1.visitor_ID = T2.ID WHERE T1.Num_of_Ticket = (SELECT MAX(Num_of_Ticket) FROM visit);
SELECT AVG(Num_of_Ticket) AS AverageTickets, MAX(Num_of_Ticket) AS MaxTickets FROM visit;
SELECT SUM(T3.Total_spent) FROM `visitor` AS T2 JOIN `visit` AS T3 ON T2.ID = T3.visitor_ID WHERE T2.Level_of_membership = 1;
SELECT v.Name FROM visitor AS v WHERE EXISTS (SELECT * FROM visit AS v1 JOIN museum AS m1 ON v1.Museum_ID = m1.Museum_ID WHERE v1.visitor_ID = v.ID AND m1.Open_Year < '2009') AND EXISTS (SELECT * FROM visit AS v2 JOIN museum AS m2 ON v2.Museum_ID = m2.Museum_ID WHERE v2.visitor_ID = v.ID AND m2.Open_Year > '2011')
SELECT COUNT(DISTINCT T3.ID) FROM visit AS T1 LEFT JOIN museum AS T2 ON T1.Museum_ID = T2.Museum_ID LEFT JOIN visitor AS T3 ON T1.visitor_ID = T3.ID WHERE T2.Open_Year > '2010' GROUP BY T3.ID HAVING COUNT(T1.Museum_ID) = 0;
SELECT COUNT(*) FROM museum WHERE Open_Year < '2008' OR Open_Year > '2013';
SELECT COUNT(DISTINCT player_id) FROM rankings;
SELECT COUNT(DISTINCT player_id) FROM rankings;
SELECT COUNT(*) FROM rankings;
SELECT COUNT(*) FROM matches;
SELECT first_name, birth_date FROM players WHERE country_code = 'USA';
SELECT first_name, birth_date FROM players WHERE country = 'USA';
SELECT AVG(loser_age) AS avg_loser_age, AVG(winner_age) AS avg_winner_age FROM (SELECT loser_age, winner_age FROM (SELECT t1.loser_age, t2.winner_age FROM (SELECT strftime('%Y', ranking_date) - strftime('%Y', birth_date) as age, player_id FROM rankings JOIN players ON rankings.player_id = players.player_id WHERE type = 'loser') AS t1 JOIN (SELECT strftime('%Y', ranking_date) - strftime('%Y', birth_date) as age, player_id FROM rankings JOIN players ON rankings.player_id = players.player_id WHERE type = 'winner') AS t2 ON t1.player_id = t2.player_id));
SELECT AVG(T2.ranking_date) AS avg_age_losers, AVG(T3.ranking_date) AS avg_age_winners FROM (SELECT * FROM matches WHERE 1=1) AS T1 JOIN rankings AS T2 ON T1.loser_id = T2.player_id JOIN rankings AS T3 ON T1.winner_id = T3.player_id GROUP BY T1.match_id
SELECT AVG(ranking) FROM rankings WHERE player_id IN (SELECT winner_id FROM matches)
SELECT AVG(T2.ranking) FROM matches AS T1 INNER JOIN rankings AS T2 ON T1.winner_player_id = T2.player_id;
SELECT MIN(ranking) FROM rankings WHERE player_id IN (SELECT player_id FROM matches WHERE ranking_date = (SELECT MAX(ranking_date) FROM rankings))
SELECT MIN(ranking) FROM rankings WHERE player_id IN (SELECT player_id FROM matches WHERE ranking_date = matches.match_date AND player_id = matches.loser_id);
SELECT COUNT(DISTINCT player_id) FROM rankings;
SELECT COUNT(DISTINCT player_id) FROM players;
SELECT COUNT(DISTINCT loser_name) FROM matches
SELECT COUNT(DISTINCT loser_id) FROM matches;
SELECT T1.tourney FROM (SELECT COUNT(*) AS match_count, tourney FROM matches GROUP BY tourney) AS T1 WHERE T1.match_count > 10;
SELECT tournament_name FROM (SELECT tournament_name, COUNT(*) AS match_count FROM matches GROUP BY tournament_name) WHERE match_count > 10;
SELECT DISTINCT T1.winner_name FROM (SELECT winner_id AS player_id, strftime('%Y', tourney_date) AS year FROM matches WHERE strftime('%Y', tourney_date) IN ('2013', '2016')) AS T1 JOIN (SELECT winner_id AS player_id, strftime('%Y', tourney_date) AS year FROM matches WHERE strftime('%Y', tourney_date) IN ('2013', '2016')) AS T2 ON T1.player_id = T2.player_id WHERE T1.year != T2.year AND T1.year = '2013' AND T2.year = '2016';
SELECT p.name FROM (SELECT m.player_id FROM matches m WHERE strftime('%Y', m.match_date) = '2013') AS winners_2013 INNER JOIN (SELECT m.player_id FROM matches m WHERE strftime('%Y', m.match_date) = '2016') AS winners_2016 ON winners_2013.player_id = winners_2016.player_id INNER JOIN players p ON winners_2013.player_id = p.id;
SELECT COUNT(*) FROM (SELECT * FROM rankings WHERE strftime('%Y', ranking_date) IN ('2013', '2016') UNION SELECT * FROM matches WHERE strftime('%Y', tournaments.tourney_date) IN ('2013', '2016'))
SELECT COUNT(*) FROM rankings WHERE strftime('%Y', ranking_date) IN ('2013', '2016')
SELECT p.country_code, p.first_name FROM players AS p JOIN (SELECT m.winner_id FROM matches AS m WHERE m.tourney_name = 'WTA Championships' INTERSECT SELECT m.winner_id FROM matches AS m WHERE m.tourney_name = 'Australian Open') AS w ON p.player_id = w.winner_id
SELECT DISTINCT p.first_name, p.country_code FROM players p JOIN matches m ON p.player_id = m.winner_id JOIN tournaments t ON m.tournament_id = t.tournament_id WHERE t.name IN ('WTA Championships', 'Australian Open') GROUP BY p.player_id HAVING COUNT(DISTINCT t.name) = 2
SELECT first_name, country_code FROM players ORDER BY birth_year ASC LIMIT 1;
SELECT first_name, country_code FROM players WHERE birth_date = (SELECT MIN(birth_date) FROM players);
SELECT first_name, last_name FROM players ORDER BY birth_date;
SELECT first_name || ' ' || last_name AS full_name FROM players ORDER BY birth_date;
SELECT first_name, last_name FROM players WHERE hand = 'L' ORDER BY birth_date;
SELECT first_name || ' ' || last_name AS full_name FROM players WHERE hand = 'L' ORDER BY birth_date;
SELECT p.first_name, p.country_code FROM players AS p JOIN rankings AS r ON p.player_id = r.player_id GROUP BY p.first_name, p.country_code ORDER BY SUM(r.tours) DESC LIMIT 1;
SELECT p.first_name, p.country_code FROM players AS p JOIN rankings AS r ON p.player_id = r.player_id GROUP BY r.player_id ORDER BY SUM(r.tours) DESC LIMIT 1;
SELECT strftime('%Y', ranking_date) AS year, COUNT(*) AS match_count FROM rankings GROUP BY year ORDER BY match_count DESC LIMIT 1;
SELECT strftime('%Y', ranking_date) AS year, COUNT(*) AS num_matches FROM rankings GROUP BY year ORDER BY num_matches DESC LIMIT 1;
SELECT T3.name, T2.ranking_points FROM (SELECT winner_id, COUNT(*) AS win_count FROM matches GROUP BY winner_id) AS T1 JOIN rankings AS T2 ON T1.winner_id = T2.player_id JOIN players AS T3 ON T1.winner_id = T3.player_id WHERE T1.win_count = (SELECT MAX(win_count) FROM (SELECT COUNT(*) AS win_count FROM matches GROUP BY winner_id));
SELECT T1.winner_name, T3.ranking_points FROM (SELECT T2.player_id AS winner_id, COUNT(*) AS wins FROM matches AS T1 JOIN players AS T2 ON T1.winner_id = T2.player_id GROUP BY T2.player_id) AS T1 JOIN players AS T2 ON T1.winner_id = T2.player_id JOIN rankings AS T3 ON T2.player_id = T3.player_id WHERE T1.wins = (SELECT MAX(wins) FROM (SELECT COUNT(*) AS wins FROM matches GROUP BY winner_id)) ORDER BY T1.wins DESC LIMIT 1;
SELECT p.name FROM players AS p JOIN matches AS m ON p.player_id = m.winner_id JOIN rankings AS r ON p.player_id = r.player_id WHERE m.tourney_name = 'Australian Open' ORDER BY r.ranking_points DESC LIMIT 1
SELECT p.first_name, p.last_name FROM players AS p JOIN matches AS m ON p.player_id = m.winner_id WHERE m.tournament_name = 'Australian Open' GROUP BY p.player_id ORDER BY SUM(p.ranking_points) DESC LIMIT 1;
SELECT T1.loser_name AS loser_name, T1.winner_name AS winner_name FROM (SELECT players_loser.name AS loser_name, players_winner.name AS winner_name, matches.minutes FROM matches JOIN players AS players_loser ON matches.loser_id = players_loser.id JOIN players AS players_winner ON matches.winner_id = players_winner.id ORDER BY matches.minutes DESC LIMIT 1) T1;
SELECT T1.name AS winner_name, T3.name AS loser_name FROM players AS T1 JOIN matches AS T2 ON T1.player_id = T2.winner_id JOIN players AS T3 ON T3.player_id = T2.loser_id WHERE (T2.match_id IN (SELECT match_id FROM (SELECT match_id, SUM(ranking_points) AS total_points FROM rankings JOIN matches ON rankings.player_id = matches.winner_id OR rankings.player_id = matches.loser_id GROUP BY match_id ORDER BY total_points DESC LIMIT 1)))
SELECT player_id, AVG(ranking) as average_ranking FROM rankings GROUP BY player_id;
SELECT T1.player_id, AVG(T2.ranking) AS avg_ranking FROM (SELECT player_id, first_name FROM rankings WHERE 1=0 UNION SELECT DISTINCT player_id, NULL AS first_name FROM players) AS T1 JOIN rankings AS T2 ON T1.player_id = T2.player_id GROUP BY T1.player_id;
SELECT rankings.player_id, SUM(ranking_points) AS total_ranking_points FROM rankings GROUP BY rankings.player_id;
SELECT T1.player_id, SUM(T2.ranking_points) as total_ranking_points FROM players AS T1 JOIN rankings AS T2 ON T1.player_id = T2.player_id GROUP BY T1.player_id;
SELECT COUNT(*), player_id FROM rankings GROUP BY player_id
SELECT country, COUNT(*) FROM players GROUP BY country;
SELECT country FROM (SELECT country, COUNT(*) AS player_count FROM players GROUP BY country) ORDER BY player_count DESC LIMIT 1;
SELECT T2.country_code, COUNT(*) AS num_players FROM rankings AS T1 JOIN players AS T2 ON T1.player_id = T2.player_id GROUP BY T2.country_code ORDER BY num_players DESC LIMIT 1;
SELECT country_code FROM players GROUP BY country_code HAVING COUNT(*) > 50;
SELECT player_id FROM rankings GROUP BY player_id HAVING COUNT(player_id) > 50;
SELECT ranking_date, SUM(tours) FROM rankings GROUP BY ranking_date;
SELECT ranking_date, SUM(tours) AS total_tours FROM rankings GROUP BY ranking_date;
SELECT strftime('%Y', tourney_date) AS Year, COUNT(*) AS Matches_Count FROM matches GROUP BY Year;
SELECT strftime('%Y', ranking_date) AS year, COUNT(*) AS num_matches FROM rankings GROUP BY year;
SELECT p.name, r.ranking FROM matches m JOIN players p ON m.player_id = p.player_id AND m.role = 'winner' JOIN rankings r ON m.player_id = r.player_id WHERE r.ranking_date IN (SELECT MAX(ranking_date) FROM rankings GROUP BY player_id) ORDER BY r.ranking_date DESC LIMIT 3
SELECT p.name, r.ranking FROM (SELECT m.*, MIN(p.birth_year) AS min_birth_year FROM matches m JOIN players p ON m.winner_id = p.player_id GROUP BY m.match_id) subq JOIN players p ON subq.min_birth_year = p.birth_year JOIN rankings r ON p.player_id = r.player_id ORDER BY p.birth_year DESC LIMIT 3
SELECT COUNT(DISTINCT m.winner_id) FROM matches m JOIN players p ON m.winner_id = p.player_id WHERE m.tournament_name = 'WTA Championships' AND p.handedness = 'left';
SELECT COUNT(*) FROM matches JOIN players ON matches.winner_id = players.player_id WHERE players.handedness = 'L' AND matches.tournament_name = 'WTA Championships';
SELECT T1.first_name, T1.country_code, T1.birth_date FROM players AS T1 JOIN matches AS T2 ON T1.player_id = T2.winner_id JOIN rankings AS T3 ON T1.player_id = T3.player_id GROUP BY T2.winner_id ORDER BY MAX(T3.ranking_points) DESC LIMIT 1;
SELECT p.first_name, p.country_code, p.birth_date FROM players AS p JOIN (SELECT m.player_id, SUM(m.winner_rank_points) AS total_winner_rank_points FROM matches AS m GROUP BY m.player_id ORDER BY total_winner_rank_points DESC LIMIT 1) AS subquery ON p.id = subquery.player_id;
SELECT hand, COUNT(*) FROM players GROUP BY hand;
SELECT hand, COUNT(*) FROM players GROUP BY hand;
SELECT COUNT(*) FROM ship WHERE disposition_of_ship = 'Captured';
SELECT name, tonnage FROM ship ORDER BY name DESC;
SELECT name, date, result FROM battle;
SELECT MAX(killed + injured) AS max_death_toll, MIN(killed + injured) AS min_death_toll FROM death;
SELECT AVG(injured) FROM death;
SELECT T1.* FROM death AS T1 JOIN ship AS T2 ON T1.caused_by_ship_id = T2.id WHERE T2.tonnage = 't';
SELECT name, result FROM battle WHERE bulgarian_commander != 'Boril';
SELECT DISTINCT T1.id, T1.name FROM battle AS T1 JOIN ship AS T2 ON T1.id = T2.lost_in_battle WHERE T2.ship_type = 'Brig';
SELECT T1.id, T1.name FROM battle AS T1 JOIN ship AS T2 ON T1.id = T2.lost_in_battle JOIN death AS T3 ON T2.id = T3.caused_by_ship_id GROUP BY T1.id, T1.name HAVING SUM(T3.killed) > 10;
SELECT s.id, s.name FROM `ship` AS s JOIN `death` AS d ON s.id = d.caused_by_ship_id GROUP BY s.id ORDER BY SUM(d.injured) DESC LIMIT 1;
SELECT DISTINCT name FROM battle WHERE bulgarian_commander = 'Kaloyan' AND latin_commander = 'Baldwin I';
SELECT COUNT(DISTINCT result) FROM battle;
SELECT COUNT(*) FROM battle WHERE id NOT IN (SELECT lost_in_battle FROM ship WHERE tonnage = '225')
SELECT T2.name, T2.date FROM ship AS T1 JOIN battle AS T2 ON T1.lost_in_battle = T2.id WHERE T1.name IN ('Lettice', 'HMS Atalanta')
SELECT T1.name, T1.result, T1.bulgarian_commander FROM `battle` AS T1 LEFT JOIN `ship` AS T2 ON T1.id = T2.lost_in_battle WHERE T2.location != 'English Channel' OR T2.location IS NULL
SELECT note FROM death WHERE note LIKE '%East%'
SELECT address_line_1, address_line_2 FROM Addresses;
SELECT address_line_1, address_line_2 FROM Addresses;
SELECT COUNT(*) FROM Courses;
SELECT COUNT(*) FROM Courses;
SELECT course_description FROM Courses;
SELECT C.description FROM Courses AS C JOIN Course_Categories AS CC ON C.course_category_code = CC.category_code WHERE CC.category_description = 'Math'
SELECT zip_code FROM Addresses WHERE city = 'Port Chelsea';
SELECT postal_code FROM Addresses WHERE city_town_or_village = 'Port Chelsea';
SELECT d.department_name, d.department_id FROM Departments AS d JOIN Degree_Programs AS dp ON d.department_id = dp.department_id GROUP BY d.department_name ORDER BY COUNT(dp.degree_program_id) DESC LIMIT 1;
SELECT D.department_name, COUNT(DP.degree_program_id) AS degree_count FROM Degree_Programs DP JOIN Departments D ON DP.department_id = D.department_id GROUP BY D.department_name ORDER BY degree_count DESC LIMIT 1;
SELECT COUNT(DISTINCT department_id) FROM Degree_Programs;
SELECT COUNT(DISTINCT department) FROM Degree_Programs;
SELECT COUNT(DISTINCT degree_name) FROM Degree_Programs;
SELECT COUNT(DISTINCT degree_program_id) FROM Degree_Programs;
SELECT COUNT(*) FROM Degree_Programs WHERE department = 'engineering';
SELECT COUNT(*) FROM Degree_Programs WHERE name LIKE '%engineering%'
SELECT section_name, section_description FROM Sections;
SELECT section_name, section_description FROM Sections;
SELECT T1.course_name, T1.course_id FROM Courses AS T1 JOIN Course_Sections AS T2 ON T1.course_id = T2.course_id GROUP BY T1.course_id HAVING COUNT(T2.section_id) <= 2;
SELECT T1.course_name, T1.course_id FROM Courses AS T1 JOIN Sections AS T2 ON T1.course_id = T2.course_id GROUP BY T1.course_id HAVING COUNT(T2.section_id) < 2;
SELECT section_name FROM Courses ORDER BY section_name DESC;
SELECT section_name FROM Sections ORDER BY section_name DESC;
SELECT T2.semester_name, T1.semester_id FROM `Student_Enrolment` AS T1 JOIN Semesters AS T2 ON T1.semester_id = T2.semester_id GROUP BY T1.semester_id ORDER BY COUNT(T1.student_enrolment_id) DESC LIMIT 1;
SELECT T2.semester_name, T1.semester_id FROM (SELECT semester_id, COUNT(student_enrolment_id) AS num_students FROM Student_Enrolment GROUP BY semester_id) AS T1 JOIN Semesters AS T2 ON T1.semester_id = T2.semester_id WHERE T1.num_students = (SELECT MAX(num_students) FROM (SELECT semester_id, COUNT(student_enrolment_id) AS num_students FROM Student_Enrolment GROUP BY semester_id));
SELECT department_description FROM Department WHERE department_name LIKE '%the computer%'
SELECT department_description FROM Departments WHERE department_name LIKE '%computer%'
SELECT S.first_name, S.middle_name, S.last_name, S.student_id FROM Student_Enrolment AS SE1 JOIN Student_Enrolment AS SE2 ON SE1.student_id = SE2.student_id AND SE1.semester_id = SE2.semester_id JOIN Students AS S ON SE1.student_id = S.student_id WHERE SE1.degree_program_id != SE2.degree_program_id GROUP BY SE1.student_id HAVING COUNT(SE1.degree_program_id) = 2;
SELECT S.student_id, S.first_name, S.middle_name, S.last_name FROM Students AS S JOIN Student_Enrolment AS SE ON S.student_id = SE.student_id JOIN Degree_Programs AS DP ON SE.degree_program_id = DP.degree_program_id JOIN Semesters AS SM ON SE.semester_id = SM.semester_id GROUP BY S.student_id HAVING COUNT(DISTINCT SE.degree_program_id) = 2 AND COUNT(DISTINCT SE.semester_id) = 1;
SELECT S.first_name, S.middle_name, S.last_name FROM Students AS S JOIN Student_Enrolment AS SE ON S.student_id = SE.student_id JOIN Degree_Programs AS DP ON SE.degree_program_id = DP.degree_program_id WHERE DP.degree_type = 'Bachelor';
SELECT S.first_name, S.middle_name, S.last_name FROM Students AS S JOIN Student_Enrolment AS SE ON S.student_id = SE.student_id JOIN Degree_Programs AS DP ON SE.degree_program_id = DP.degree_program_id WHERE DP.degree_type = 'Bachelors';
SELECT dp.degree_program_name, COUNT(se.student_enrolment_id) AS num_students FROM Student_Enrolment se JOIN Degree_Programs dp ON se.degree_program_id = dp.degree_program_id GROUP BY dp.degree_program_name ORDER BY num_students DESC LIMIT 1;
SELECT dp.degree_summary_name, COUNT(se.student_id) AS student_count FROM Degree_Programs dp JOIN Student_Enrolment se ON dp.degree_program_id = se.degree_program_id GROUP BY dp.degree_summary_name ORDER BY student_count DESC LIMIT 1;
SELECT T2.degree_program_id, T2.summary FROM Student_Enrolment AS T1 JOIN Degree_Programs AS T2 ON T1.degree_program_id = T2.degree_program_id GROUP BY T2.degree_program_id ORDER BY COUNT(T1.student_enrolment_id) DESC LIMIT 1;
SELECT T2.degree_program_id, T3.summary FROM Student_Enrolment AS T1 JOIN Degree_Programs AS T3 ON T1.degree_program_id = T3.degree_program_id GROUP BY T1.degree_program_id ORDER BY COUNT(T1.student_enrolment_id) DESC LIMIT 1
SELECT S.student_id, S.first_name, S.middle_name, S.last_name, COUNT(SE.student_enrolment_id) AS enrollment_count FROM Students S JOIN Student_Enrolment SE ON S.student_id = SE.student_id GROUP BY S.student_id ORDER BY enrollment_count DESC LIMIT 1;
SELECT s.student_id, s.first_name, s.middle_name, s.last_name, COUNT(se.student_enrolment_id) AS enrollment_count FROM Student_Enrolment se JOIN Students s ON se.student_id = s.student_id GROUP BY se.student_id ORDER BY enrollment_count DESC LIMIT 1;
SELECT s.semester_name FROM Semesters AS s LEFT JOIN Student_Enrolment AS se ON s.semester_id = se.semester_id WHERE se.student_enrolment_id IS NULL;
SELECT T2.name FROM Student_Enrolment AS T1 RIGHT JOIN Semesters AS T2 ON T1.semester_id = T2.semester_id WHERE T1.student_enrolment_id IS NULL
SELECT DISTINCT T1.course_name FROM Courses AS T1 JOIN Student_Enrolment_Courses AS T2 ON T1.course_id = T2.course_id JOIN Student_Enrolment AS T3 ON T2.student_enrolment_id = T3.student_enrolment_id;
SELECT DISTINCT T1.course_name FROM Courses AS T1 INNER JOIN Student_Enrolment_Courses AS T2 ON T1.course_id = T2.course_id;
SELECT C.course_name FROM Student_Enrolment_Courses AS SEC JOIN Courses AS C ON SEC.course_id = C.course_id GROUP BY C.course_name ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T2.course_name FROM Student_Enrolment_Courses AS T1 JOIN Courses AS T2 ON T1.course_id = T2.course_id GROUP BY T2.course_name ORDER BY COUNT(T1.student_course_id) DESC LIMIT 1;
SELECT T1.last_name FROM Students AS T1 JOIN Addresses AS T2 ON T1.student_address_id = T2.address_id WHERE T2.state_province_county = 'North Carolina' AND NOT EXISTS(SELECT * FROM Student_Enrolment AS T3 WHERE T3.student_id = T1.student_id);
SELECT T1.last_name FROM Students AS T1 JOIN Addresses AS T2 ON T1.address_id = T2.address_id LEFT JOIN Student_Enrolment AS T3 ON T1.student_id = T3.student_id WHERE T2.state = 'North Carolina' AND T3.student_enrolment_id IS NULL;
SELECT T3.transcript_date, T3.transcript_id FROM Transcript_Contents AS T1 JOIN Student_Enrolment_Courses AS T2 ON T1.student_course_id = T2.student_course_id JOIN Transcripts AS T3 ON T1.transcript_id = T3.transcript_id GROUP BY T3.transcript_id HAVING COUNT(*) >= 2;
SELECT T1.transcript_date, T1.transcript_id FROM Transcripts AS T1 JOIN Transcript_Contents AS T2 ON T1.transcript_id = T2.transcript_id GROUP BY T1.transcript_id HAVING COUNT(T2.student_course_id) >= 2;
SELECT phone_number FROM Students WHERE first_name = 'Timmothy' AND last_name = 'Ward';
SELECT sc.contact_value FROM Students s JOIN Student_Contact_Preferences sc ON s.student_id = sc.student_id WHERE s.first_name = 'Timmothy' AND s.last_name = 'Ward' AND sc.contact_type = 'mobile_phone'
SELECT first_name, middle_name, last_name FROM Students ORDER BY registration_date ASC LIMIT 1;
SELECT first_name, middle_name, last_name FROM Students WHERE student_id = 1;
SELECT S.first_name, S.middle_name, S.last_name FROM Graduation AS G JOIN Students AS S ON G.student_id = S.student_id ORDER BY G.graduation_date ASC LIMIT 1;
SELECT S.first_name, S.middle_name, S.last_name FROM Graduation AS G JOIN Students AS S ON G.student_id = S.student_id ORDER BY G.graduation_date ASC LIMIT 1;
SELECT T1.first_name FROM Students AS T1 JOIN Students AS T2 ON T1.student_id = T2.student_id WHERE T1.permanent_address <> T1.current_address
SELECT T1.first_name FROM Students AS T1 JOIN Addresses AS T2 ON T1.student_address_id = T2.address_id JOIN Addresses AS T3 ON T1.permanent_address_id = T3.address_id WHERE T2.address_line_1 != T3.address_line_1;
SELECT Addresses.address_id, Addresses.line_1, Addresses.line_2, Addresses.city_town, Addresses.state_province_county, Addresses.postal_code FROM Students JOIN Addresses ON Students.current_address_id = Addresses.address_id GROUP BY Addresses.address_id ORDER BY COUNT(Students.student_id) DESC LIMIT 1;
SELECT Addresses.address_id, Addresses.line_1, Addresses.line_2 FROM Students JOIN Addresses ON Students.student_address_id = Addresses.address_id GROUP BY Addresses.address_id ORDER BY COUNT(Students.student_id) DESC LIMIT 1;
SELECT AVG(JULIANDAY(transcript_date)) FROM Transcripts;
SELECT AVG(transcript_date) FROM Transcripts
SELECT transcript_date, other_details FROM Transcripts ORDER BY transcript_date ASC LIMIT 1;
SELECT MIN(transcript_date) as earliest_transcript_date FROM Transcripts;
SELECT COUNT(*) FROM Transcripts;
SELECT COUNT(*) FROM Transcripts;
SELECT MAX(transcript_date) FROM Transcripts;
SELECT MAX(transcript_date) FROM Transcripts;
SELECT T2.student_course_id, COUNT(*) AS times_in_transcripts FROM Transcript_Contents AS T1 JOIN Student_Enrolment_Courses AS T2 ON T1.student_course_id = T2.student_course_id GROUP BY T2.student_course_id ORDER BY times_in_transcripts DESC LIMIT 1;
SELECT T2.course_id, COUNT(T1.transcript_id) AS times_in_transcripts FROM Transcript_Contents AS T1 JOIN Student_Enrolment_Courses AS T2 ON T1.student_course_id = T2.student_course_id GROUP BY T2.course_id ORDER BY times_in_transcripts DESC LIMIT 1;
SELECT T1.transcript_id, T1.transcript_date FROM Transcripts AS T1 JOIN (SELECT transcript_id, COUNT(*) AS count FROM Transcript_Contents GROUP BY transcript_id ORDER BY count ASC LIMIT 1) AS T2 ON T1.transcript_id = T2.transcript_id;
SELECT T1.transcript_id, T1.transcript_date FROM Transcripts AS T1 JOIN (SELECT transcript_id, COUNT(student_course_id) AS result_count FROM Transcript_Contents GROUP BY transcript_id) AS T2 ON T1.transcript_id = T2.transcript_id ORDER BY T2.result_count ASC LIMIT 1;
SELECT S.semester_id FROM Student_Enrolment AS S JOIN Degree_Programs AS D ON S.degree_program_id = D.degree_program_id JOIN Students AS St ON S.student_id = St.student_id GROUP BY S.semester_id HAVING COUNT(DISTINCT CASE WHEN D.degree_type = 'Master' THEN St.student_id END) > 0 AND COUNT(DISTINCT CASE WHEN D.degree_type = 'Bachelor' THEN St.student_id END) > 0;
SELECT S2.semester_id FROM (SELECT S1.degree_program_id, S1.semester_id FROM Student_Enrolment AS S1 JOIN Degree_Programs AS D ON S1.degree_program_id = D.degree_program_id WHERE D.degree_name = 'Masters') AS S2 JOIN (SELECT S3.degree_program_id, S3.semester_id FROM Student_Enrolment AS S3 JOIN Degree_Programs AS D ON S3.degree_program_id = D.degree_program_id WHERE D.degree_name = 'Bachelors') AS S4 ON S2.semester_id = S4.semester_id GROUP BY S2.semester_id HAVING COUNT(DISTINCT S2.degree_program_id) > 1
SELECT COUNT(DISTINCT address_line_1) FROM Addresses;
SELECT DISTINCT address_line_1 FROM Students;
SELECT * FROM Students ORDER BY student_details COLLATE NOCASE DESC;
SELECT student_id, student_name FROM Students ORDER BY student_name DESC;
{     "chain_of_thought_reasoning": "The question is asking for a description of section h, but no specific information about what section h refers to is provided. Since there are no examples or context given that would help identify which part of the database schema section h might correspond to, it's impossible to construct an SQL query based on this prompt alone. The schema includes tables related to students, courses, degrees, semesters, and transcripts, but without a clear definition of 'section h,' we cannot determine which table or data is being asked for.",     "SQL": "" }
SELECT description FROM Sections WHERE section_name = 'h';
SELECT S.first_name FROM Students AS S JOIN Addresses AS A ON S.permanent_address_id = A.address_id JOIN Student_Contact_Details AS C ON S.student_id = C.student_id WHERE A.country = 'Haiti' OR C.cell_phone_number = '09700166582';
SELECT DISTINCT S.first_name FROM Students AS S JOIN Addresses AS A ON S.permanent_address_id = A.address_id JOIN Student_Contact_Numbers AS SCN ON S.student_id = SCN.student_id WHERE (A.country = 'Haiti') OR (SCN.cell_phone_number = '09700166582');
SELECT Title FROM Cartoon ORDER BY Title ASC;
SELECT Title FROM Cartoon ORDER BY Title ASC;
SELECT * FROM Cartoon WHERE Directed_by = 'Ben Jones';
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones';
SELECT COUNT(*) FROM Cartoon WHERE Written_by = 'Joseph Kuhr';
SELECT COUNT(*) FROM Cartoon WHERE Written_by = 'Joseph Kuhr';
SELECT Title, Directed_by FROM Cartoon ORDER BY Original_air_date;
SELECT Title, Directed_by FROM Cartoon ORDER BY Original_air_date;
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones' OR Directed_by = 'Brandon Vietti';
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones' OR Directed_by = 'Brandon Vietti';
SELECT Country, COUNT(*) AS Channel_Count FROM TV_Channel GROUP BY Country ORDER BY Channel_Count DESC LIMIT 1;
SELECT Country, COUNT(*) AS channel_count FROM TV_Channel GROUP BY Country ORDER BY channel_count DESC LIMIT 1;
SELECT COUNT(DISTINCT series_name), COUNT(DISTINCT Content) FROM TV_Channel;
SELECT COUNT(DISTINCT series_name) AS num_series, COUNT(DISTINCT Content) AS num_contents FROM TV_Channel;
SELECT Content FROM TV_Channel WHERE series_name = 'Sky Radio';
SELECT Content FROM TV_Channel WHERE series_name = 'Sky Radio';
SELECT Package_Option FROM TV_Channel WHERE series_name = 'Sky Radio';
SELECT Package_Option FROM TV_Channel WHERE series_name = 'Sky Radio';
SELECT COUNT(id) FROM TV_Channel WHERE Language = 'English';
SELECT COUNT(*) FROM TV_Channel WHERE Language = 'English';
SELECT Language, COUNT(*) AS Channel_Count FROM TV_Channel GROUP BY Language ORDER BY Channel_Count ASC LIMIT 1;
SELECT `Language`, COUNT(`id`) AS channel_count FROM `TV_Channel` GROUP BY `Language` ORDER BY channel_count ASC LIMIT 1;
SELECT Language, COUNT(*) FROM TV_Channel GROUP BY Language;
SELECT Language, COUNT(*) FROM TV_Channel GROUP BY Language;
SELECT T2.series_name FROM Cartoon AS T1 JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T1.Title = 'The Rise of the Blue Beetle!';
SELECT T2.series_name FROM Cartoon AS T1 JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T1.Title = 'The Rise of the Blue Beetle'
SELECT T1.Title FROM Cartoon AS T1 JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T2.series_name = 'Sky Radio';
SELECT C.Title FROM Cartoon AS C JOIN TV_Channel AS TC ON C.Channel = TC.id WHERE TC.series_name = 'Sky Radio';
SELECT `Episode` FROM `TV_series` ORDER BY `Rating`;
SELECT `Episode`, `Rating` FROM `TV_series` ORDER BY `Rating`;
SELECT Episode, Rating FROM TV_series ORDER BY Rating DESC LIMIT 3;
SELECT Episode, Rating FROM TV_series ORDER BY Rating DESC LIMIT 3;
SELECT MIN(Share), MAX(Share) FROM TV_series;
SELECT MAX(Share), MIN(Share) FROM TV_series;
SELECT Air_Date FROM TV_series WHERE Episode = 'A Love of a Lifetime';
SELECT Air_Date FROM TV_series WHERE Episode = 'A Love of a Lifetime';
SELECT Weekly_Rank FROM TV_series WHERE Episode = 'A Love of a Lifetime';
SELECT Weekly_Rank FROM TV_series WHERE Episode = 'A Love of a Lifetime';
SELECT T2.series_name FROM TV_series AS T1 JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T1.Episode = 'A Love of a Lifetime';
SELECT series_name FROM TV_series WHERE Episode = 'A Love of a Lifetime';
SELECT T2.Episode FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T1.series_name = 'Sky Radio';
SELECT T2.Episode FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T1.series_name = 'Sky Radio';
SELECT Directed_by, COUNT(*) FROM Cartoon GROUP BY Directed_by;
SELECT directed_by, COUNT(*) FROM Cartoon GROUP BY directed_by;
SELECT C.Production_code, C.Channel FROM Cartoon AS C ORDER BY C.Original_air_date DESC LIMIT 1;
SELECT T2.Production_code, T1.id AS Channel FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel ORDER BY STRFTIME('%Y-%m-%d', T2.Original_air_date) DESC LIMIT 1;
SELECT T1.Package_Option, T2.series_name FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T1.Hight_definition_TV = 'yes';
SELECT T1.Package_Option, T2.series_name FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T1.Hight_definition_TV = 'yes';
SELECT DISTINCT T2.Country FROM Cartoon AS T1 JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T1.Written_by = 'Todd Casey';
SELECT T1.Country FROM TV_Channel AS T1 INNER JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Written_by = 'Todd Casey';
SELECT DISTINCT T1.Country FROM TV_Channel AS T1 WHERE NOT EXISTS(SELECT * FROM Cartoon AS T2 WHERE T1.id = T2.Channel AND T2.Written_by = 'Todd Casey')
SELECT DISTINCT T2.Country FROM Cartoon AS T1 JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T1.Written_by != 'Todd Casey' GROUP BY T2.Country EXCEPT SELECT DISTINCT Country FROM TV_Channel WHERE id IN (SELECT Channel FROM Cartoon WHERE Written_by = 'Todd Casey')
SELECT T1.series_name, T1.Country FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Directed_by IN ('Ben Jones', 'Michael Chang') GROUP BY T1.id HAVING COUNT(*) > 0;
SELECT T1.series_name, T1.Country FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Directed_by IN ('Ben Jones', 'Michael Chang')
SELECT Pixel_aspect_ratio_PAR, Country FROM TV_Channel WHERE Language != 'English';
SELECT Pixel_aspect_ratio_PAR, Country FROM TV_Channel WHERE Language != 'English';
SELECT T1.id FROM TV_Channel AS T1 JOIN (SELECT Country FROM TV_Channel GROUP BY Country HAVING COUNT(Country) > 2) AS T2 ON T1.Country = T2.Country
SELECT Channel FROM (SELECT Channel FROM TV_series UNION SELECT Channel FROM Cartoon) GROUP BY Channel HAVING COUNT(Channel) > 2;
SELECT id FROM TV_Channel WHERE id NOT IN (SELECT DISTINCT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones')
SELECT id FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones')
SELECT T1.Package_Option FROM `TV_Channel` AS T1 WHERE T1.id NOT IN (SELECT T2.Channel FROM `Cartoon` AS T2 WHERE T2.Directed_by = 'Ben Jones')
SELECT T1.Package_Option FROM `TV_Channel` AS T1 WHERE T1.id NOT IN (SELECT T2.Channel FROM `Cartoon` AS T2 WHERE T2.Directed_by = 'Ben Jones')
SELECT COUNT(Poker_Player_ID) FROM poker_player;
SELECT COUNT(*) FROM poker_player;
SELECT Earnings FROM poker_player ORDER BY Earnings DESC;
SELECT Earnings FROM poker_player ORDER BY Earnings DESC;
SELECT Final_Table_Made, Best_Finish FROM poker_player;
SELECT Final_Table_Made, Best_Finish FROM poker_player;
SELECT AVG(Earnings) FROM poker_player;
SELECT AVG(Earnings) FROM poker_player;
SELECT Money_Rank FROM poker_player ORDER BY Earnings DESC LIMIT 1;
SELECT Money_Rank FROM poker_player ORDER BY Earnings DESC LIMIT 1;
SELECT MAX(Final_Table_Made) FROM poker_player WHERE Earnings < 200000;
SELECT MAX(Final_Table_Made) FROM poker_player WHERE Earnings < 200000;
SELECT T2.Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID;
SELECT T2.Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID;
SELECT T2.Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID WHERE T1.Earnings > 300000;
SELECT T2.Name FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID WHERE T1.Earnings > 300000
SELECT T2.Name FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Final_Table_Made ASC;
SELECT T2.Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Final_Table_Made ASC;
SELECT T2.Birth_Date FROM `poker_player` AS T1 JOIN `people` AS T2 ON T1.People_ID = T2.People_ID WHERE T1.Earnings = (SELECT MIN(Earnings) FROM `poker_player`)
SELECT T2.Birth_Date FROM `poker_player` AS T1 JOIN `people` AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Earnings ASC LIMIT 1;
SELECT T1.Money_Rank FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T2.Height DESC LIMIT 1;
SELECT pp.Money_Rank FROM poker_player AS pp JOIN people AS p ON pp.People_ID = p.People_ID ORDER BY p.Height DESC LIMIT 1;
SELECT AVG(T1.Earnings) FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID WHERE T2.Height > 200;
SELECT AVG(T2.Earnings) FROM `people` AS T1 JOIN `poker_player` AS T2 ON T1.People_ID = T2.People_ID WHERE T1.Height > 200;
SELECT T2.Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Earnings DESC;
SELECT T2.Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Earnings DESC;
SELECT Nationality, COUNT(People_ID) FROM people GROUP BY Nationality;
SELECT Nationality, COUNT(*) FROM people GROUP BY Nationality;
SELECT Nationality, COUNT(*) AS Count FROM people GROUP BY Nationality ORDER BY Count DESC LIMIT 1;
SELECT Nationality FROM people GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Nationality FROM people GROUP BY Nationality HAVING COUNT(*) >= 2;
SELECT Nationality FROM people GROUP BY Nationality HAVING COUNT(*) >= 2;
SELECT Name, Birth_Date FROM people ORDER BY Name ASC;
SELECT Name, Birth_Date FROM people ORDER BY Name ASC;
SELECT Name FROM people WHERE Nationality != 'Russia';
SELECT Name FROM people WHERE Nationality != 'Russia';
SELECT T1.Name FROM people AS T1 LEFT JOIN poker_player AS T2 ON T1.People_ID = T2.People_ID WHERE T2.Poker_Player_ID IS NULL;
SELECT T1.Name FROM people AS T1 LEFT JOIN poker_player AS T2 ON T1.People_ID = T2.People_ID WHERE T2.Poker_Player_ID IS NULL;
SELECT COUNT(DISTINCT Nationality) FROM people;
SELECT COUNT(DISTINCT Nationality) FROM people;
SELECT COUNT(DISTINCT state) FROM AREA_CODE_STATE;
SELECT contestant_number, contestant_name FROM CONTESTANTS ORDER BY contestant_name DESC;
SELECT vote_id, phone_number, state FROM VOTES;
SELECT MAX(area_code) AS max_area_code, MIN(area_code) AS min_area_code FROM AREA_CODE_STATE;
SELECT MAX(created) FROM VOTES WHERE state = 'CA';
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name != 'Jessie Alloway';
SELECT DISTINCT state, created FROM VOTES;
SELECT C.contestant_number, C.contestant_name FROM CONTESTANTS AS C JOIN VOTES AS V ON C.contestant_number = V.contestant_number GROUP BY C.contestant_number, C.contestant_name HAVING COUNT(V.vote_id) >= 2;
SELECT C.contestant_number, C.contestant_name FROM CONTESTANTS AS C JOIN (SELECT contestant_number, COUNT(*) AS vote_count FROM VOTES GROUP BY contestant_number ORDER BY vote_count ASC LIMIT 1) AS V ON C.contestant_number = V.contestant_number;
SELECT COUNT(*) FROM VOTES WHERE state IN ('NY', 'CA');
SELECT COUNT(*) FROM (SELECT c.contestant_number FROM CONTESTANTS c LEFT JOIN VOTES v ON c.contestant_number = v.contestant_number WHERE v.contestant_number IS NULL) AS no_votes
SELECT ACS.area_code, COUNT(*) AS vote_count FROM VOTES V JOIN AREA_CODE_STATE ACS ON V.state = ACS.state GROUP BY ACS.area_code ORDER BY vote_count DESC LIMIT 1;
SELECT V.created, ACS.state, V.phone_number FROM CONTESTANTS AS C JOIN VOTES AS V ON C.contestant_number = V.contestant_number JOIN AREA_CODE_STATE AS ACS ON V.state = ACS.state WHERE C.contestant_name = 'Tabatha Gehling';
SELECT acs.area_code FROM (SELECT v.state FROM VOTES AS v JOIN CONTESTANTS AS c ON v.contestant_number = c.contestant_number WHERE c.contestant_name IN ('Tabatha Gehling', 'Kelly Clauss') GROUP BY v.state HAVING COUNT(DISTINCT c.contestant_name) = 2) AS states_with_both_votes JOIN AREA_CODE_STATE AS acs ON states_with_both_votes.state = acs.state;
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name LIKE '%Al%'
SELECT Name FROM country WHERE IndepYear > 1950;
SELECT Name FROM country WHERE IndepYear > 1950;
SELECT COUNT(*) FROM country WHERE GovernmentForm = 'Republic';
SELECT COUNT(Code) FROM country WHERE GovernmentForm = 'Republic';
SELECT SUM(SurfaceArea) FROM country WHERE Region = 'Caribbean';
SELECT SUM(SurfaceArea) FROM country WHERE Region = 'Caribbean';
SELECT Continent FROM country WHERE Name = 'Anguilla';
SELECT Continent FROM country WHERE Name = 'Anguilla';
SELECT District FROM city WHERE Name = 'Kabul';
SELECT T2.Region FROM city AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T1.Name = 'Kabul';
SELECT T2.Language FROM `country` AS T1 JOIN `countrylanguage` AS T2 ON T1.Code = T2.CountryCode WHERE T1.Name = 'Aruba' ORDER BY T2.Percentage DESC LIMIT 1;
SELECT T2.Language FROM `country` AS T1 JOIN `countrylanguage` AS T2 ON T1.Code = T2.CountryCode WHERE T1.Name = 'Aruba' AND T2.IsOfficial = 'T';
SELECT Population, LifeExpectancy FROM country WHERE Name = 'Brazil';
SELECT Population, LifeExpectancy FROM country WHERE Name = 'Brazil';
SELECT Region, Population FROM country WHERE Name = 'Angola';
SELECT Region, Population FROM country WHERE Name = 'Angola';
SELECT AVG(LifeExpectancy) FROM country WHERE Region = 'Central Africa';
SELECT AVG(T1.LifeExpectancy) FROM country AS T1 JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T1.Region = 'Central Africa';
SELECT T2.Name FROM country AS T2 WHERE T2.Continent = 'Asia' ORDER BY T2.LifeExpectancy ASC LIMIT 1;
SELECT Name FROM country WHERE Continent = 'Asia' AND LifeExpectancy = (SELECT MIN(LifeExpectancy) FROM country WHERE Continent = 'Asia');
SELECT SUM(Population) AS Total_Population, MAX(GNP) AS Max_GNP FROM country WHERE Continent = 'Asia';
SELECT SUM(Population) AS TotalPopulationInAsia, MAX(GNP) AS LargestGNP FROM country WHERE Continent = 'Asia';
SELECT AVG(LifeExpectancy) FROM country WHERE Continent = 'Africa' AND GovernmentForm = 'Republic';
SELECT AVG(LifeExpectancy) FROM country WHERE Continent = 'Africa' AND GovernmentForm = 'Republic';
SELECT SUM(SurfaceArea) FROM country WHERE Continent IN ('Asia', 'Europe')
SELECT SUM(SurfaceArea) FROM country WHERE Continent = 'Asia' OR Continent = 'Europe';
SELECT SUM(Population) FROM city WHERE District = 'Gelderland';
SELECT SUM(Population) FROM city WHERE District = 'Gelderland';
SELECT AVG(GNP), SUM(Population) FROM country WHERE GovernmentForm = 'US territory';
SELECT AVG(GNP) AS Mean_GNP, SUM(Population) AS Total_Population FROM country;
SELECT COUNT(DISTINCT Language) FROM countrylanguage;
SELECT COUNT(DISTINCT Language) FROM countrylanguage;
SELECT COUNT(DISTINCT GovernmentForm) FROM country WHERE Continent = 'Africa';
SELECT COUNT(DISTINCT GovernmentForm) FROM country WHERE Continent = 'Africa';
SELECT COUNT(DISTINCT T2.Language) FROM `country` AS T1 JOIN `countrylanguage` AS T2 ON T1.Code = T2.CountryCode WHERE T1.Name = 'Aruba';
SELECT COUNT(DISTINCT T2.Language) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.Code = 'ABW';
SELECT COUNT(*) FROM countrylanguage WHERE CountryCode = 'AFG' AND IsOfficial = 'T';
SELECT COUNT(DISTINCT T2.Language) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.Code = 'AFG' AND T2.IsOfficial = 'T';
SELECT T1.Name FROM `country` AS T1 JOIN `countrylanguage` AS T2 ON T1.Code = T2.CountryCode GROUP BY T2.CountryCode ORDER BY COUNT(T2.Language) DESC LIMIT 1;
SELECT T2.Name FROM (SELECT CountryCode, COUNT(DISTINCT Language) AS language_count FROM countrylanguage GROUP BY CountryCode) AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code ORDER BY T1.language_count DESC LIMIT 1;
SELECT c.Continent, COUNT(DISTINCT cl.Language) AS num_languages FROM countrylanguage cl JOIN country c ON cl.CountryCode = c.Code GROUP BY c.Continent ORDER BY num_languages DESC LIMIT 1;
SELECT c.Continent, COUNT(DISTINCT cl.Language) AS language_count FROM countrylanguage cl JOIN country c ON cl.CountryCode = c.Code GROUP BY c.Continent ORDER BY language_count DESC LIMIT 1;
SELECT COUNT(DISTINCT cl1.CountryCode) FROM countrylanguage AS cl1 INNER JOIN countrylanguage AS cl2 ON cl1.CountryCode = cl2.CountryCode WHERE cl1.Language = 'English' AND cl2.Language = 'Dutch';
SELECT COUNT(DISTINCT T1.Code) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'English' AND EXISTS(SELECT * FROM countrylanguage AS T3 WHERE T3.CountryCode = T1.Code AND T3.Language = 'Dutch')
SELECT DISTINCT T1.Name FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language IN ('English', 'French') GROUP BY T1.Name HAVING COUNT(DISTINCT CASE WHEN T2.Language = 'English' THEN 1 END) > 0 AND COUNT(DISTINCT CASE WHEN T2.Language = 'French' THEN 1 END) > 0;
SELECT T1.Name FROM `country` AS T1 JOIN `countrylanguage` AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'English' INTERSECT SELECT T1.Name FROM `country` AS T1 JOIN `countrylanguage` AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'French'
SELECT T1.Name FROM `country` AS T1 JOIN `countrylanguage` AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language IN ('English', 'French') AND T2.IsOfficial = 'T' GROUP BY T1.Code HAVING COUNT(DISTINCT T2.Language) = 2
SELECT T1.Name FROM `country` AS T1 WHERE T1.Code IN (SELECT T2.CountryCode FROM `countrylanguage` AS T2 WHERE T2.Language IN ('English', 'French') AND T2.IsOfficial = 'T' GROUP BY T2.CountryCode HAVING COUNT(*) >= 2)
SELECT COUNT(DISTINCT T1.Continent) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'Chinese';
SELECT COUNT(DISTINCT T1.Continent) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'Chinese';
SELECT DISTINCT T2.Region FROM countrylanguage AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T1.Language IN ('English', 'Dutch');
SELECT c.Region FROM `country` AS c JOIN `countrylanguage` AS cl ON c.Code = cl.CountryCode WHERE cl.Language IN ('Dutch', 'English')
SELECT T1.Name FROM `country` AS T1 JOIN `countrylanguage` AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language IN ('English', 'Dutch') AND T2.IsOfficial = 'T';
SELECT T1.Name FROM `country` AS T1 JOIN `countrylanguage` AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language IN ('English', 'Dutch') AND T2.IsOfficial = 'T';
SELECT T3.Language FROM country AS T1 JOIN city AS T2 ON T1.Code = T2.CountryCode JOIN countrylanguage AS T3 ON T1.Code = T3.CountryCode WHERE T1.Continent = 'Asia' GROUP BY T3.Language ORDER BY SUM(T2.Population) DESC LIMIT 1;
SELECT T2.Language FROM `country` AS T1 JOIN `countrylanguage` AS T2 ON T1.Code = T2.CountryCode WHERE T1.Continent = 'Asia' GROUP BY T2.Language ORDER BY COUNT(T1.Code) DESC LIMIT 1;
SELECT T2.Language FROM `country` AS T1 JOIN `countrylanguage` AS T2 ON T1.Code = T2.CountryCode WHERE T1.GovernmentForm = 'Republic' GROUP BY T2.Language HAVING COUNT(*) = 1;
SELECT DISTINCT T2.Language FROM `country` AS T1 JOIN `countrylanguage` AS T2 ON T1.Code = T2.CountryCode WHERE T1.GovernmentForm = 'Republic' GROUP BY T2.Language HAVING COUNT(T2.CountryCode) = 1;
SELECT T1.Name, T1.Population FROM city AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code JOIN countrylanguage AS T3 ON T2.Code = T3.CountryCode WHERE T3.Language = 'English' ORDER BY T1.Population DESC LIMIT 1;
SELECT c.Name, c.Population FROM city AS c JOIN countrylanguage AS cl ON c.CountryCode = cl.CountryCode WHERE cl.Language = 'English' ORDER BY c.Population DESC LIMIT 1;
SELECT T1.Name, T1.Population, T1.LifeExpectancy FROM `country` AS T1 WHERE T1.Continent = 'Asia' ORDER BY T1.SurfaceArea DESC LIMIT 1;
SELECT Name, Population, LifeExpectancy FROM country WHERE Continent = 'Asia' ORDER BY SurfaceArea DESC LIMIT 1;
SELECT AVG(T1.LifeExpectancy) FROM `country` AS T1 JOIN `countrylanguage` AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language != 'English' OR T2.IsOfficial != 'T';
SELECT AVG(T1.LifeExpectancy) FROM `country` AS T1 JOIN `countrylanguage` AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language != 'English' AND T2.IsOfficial = 'T';
SELECT SUM(T1.Population) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language != 'English' OR T2.IsOfficial != 'T'
SELECT SUM(T1.Population) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language != 'English';
SELECT T2.Language FROM `country` AS T1 JOIN `countrylanguage` AS T2 ON T1.Code = T2.CountryCode WHERE T1.HeadOfState = 'Beatrix' AND T2.IsOfficial = 'T';
SELECT T2.Language FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.HeadOfState = 'Beatrix' AND T2.IsOfficial = 'T';
SELECT COUNT(DISTINCT T2.Language) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.IndepYear < 1930 AND T2.IsOfficial = 'T';
SELECT COUNT(DISTINCT T2.Language) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.IndepYear < 1930 AND T2.IsOfficial = 'T';
SELECT Name FROM country WHERE SurfaceArea > (SELECT MAX(SurfaceArea) FROM country WHERE Continent = 'Europe')
SELECT T1.Name FROM `country` AS T1 WHERE T1.SurfaceArea > (SELECT MAX(T2.SurfaceArea) FROM `country` AS T2 WHERE T2.Continent = 'Europe')
SELECT Name FROM country WHERE Continent = 'Africa' AND Population < (SELECT MIN(Population) FROM country WHERE Continent = 'Asia')
SELECT T1.Name FROM `country` AS T1 WHERE T1.Continent = 'Africa' AND T1.Population < (SELECT MIN(T2.Population) FROM `country` AS T2 WHERE T2.Continent = 'Asia')
SELECT Name FROM country WHERE Continent = 'Asia' AND Population > (SELECT MAX(Population) FROM country WHERE Continent = 'Africa');
SELECT T1.Name FROM `country` AS T1 WHERE T1.Continent = 'Asia' AND T1.Population > (SELECT MAX(T2.Population) FROM `country` AS T2 WHERE T2.Continent = 'Africa')
SELECT DISTINCT CountryCode FROM countrylanguage WHERE Language != 'English';
SELECT c.Code FROM country AS c WHERE c.Code NOT IN (SELECT cl.CountryCode FROM countrylanguage AS cl WHERE cl.Language = 'English')
SELECT DISTINCT CountryCode FROM countrylanguage WHERE Language != 'English';
SELECT CountryCode FROM countrylanguage WHERE Language != 'English' AND IsOfficial = 'T';
SELECT c.Code FROM country AS c JOIN countrylanguage AS cl ON c.Code = cl.CountryCode WHERE c.GovernmentForm != 'Republic' AND cl.Language != 'English';
SELECT c.Code FROM country AS c JOIN countrylanguage AS cl ON c.Code = cl.CountryCode WHERE cl.Language != 'English' AND c.GovernmentForm != 'Republic';
SELECT city.Name FROM city JOIN country ON city.CountryCode = country.Code WHERE country.Continent = 'Europe' AND NOT EXISTS (SELECT * FROM countrylanguage WHERE countrylanguage.CountryCode = city.CountryCode AND countrylanguage.Language = 'English' AND countrylanguage.IsOfficial = 'T');
SELECT T1.Name FROM city AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code JOIN countrylanguage AS T3 ON T2.Code = T3.CountryCode WHERE T2.Continent = 'Europe' AND NOT (T3.Language = 'English' AND T3.IsOfficial = 'T');
SELECT DISTINCT T1.Name FROM city AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code JOIN countrylanguage AS T3 ON T2.Code = T3.CountryCode WHERE T2.Continent = 'Asia' AND T3.Language = 'Chinese'
SELECT DISTINCT T1.Name FROM city AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code JOIN countrylanguage AS T3 ON T2.Code = T3.CountryCode WHERE T2.Continent = 'Asia' AND T3.Language = 'Chinese' AND T3.IsOfficial = 'T';
SELECT Name, IndepYear, SurfaceArea FROM country ORDER BY Population ASC LIMIT 1;
SELECT Name, IndepYear, SurfaceArea FROM country ORDER BY Population ASC LIMIT 1;
SELECT T2.Population, T2.Name, T2.HeadOfState FROM country AS T1 JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T1.SurfaceArea = (SELECT MAX(SurfaceArea) FROM country);
SELECT T1.Name, T1.Population, T1.HeadOfState FROM country AS T1 WHERE T1.SurfaceArea = (SELECT MAX(T2.SurfaceArea) FROM country AS T2);
SELECT T1.Name, COUNT(DISTINCT T2.Language) FROM `country` AS T1 JOIN `countrylanguage` AS T2 ON T1.Code = T2.CountryCode GROUP BY T1.Code HAVING COUNT(*) >= 3;
SELECT c.Name, COUNT(cl.Language) AS LanguageCount FROM country AS c JOIN countrylanguage AS cl ON c.Code = cl.CountryCode GROUP BY cl.CountryCode HAVING COUNT(*) > 2;
SELECT District, COUNT(*) AS num_cities FROM city WHERE Population > (SELECT AVG(Population) FROM city) GROUP BY District;
SELECT District, COUNT(*) FROM city WHERE Population > (SELECT AVG(Population) FROM city) GROUP BY District;
SELECT T1.GovernmentForm, SUM(T1.Population) FROM country AS T1 JOIN city AS T2 ON T1.Code = T2.CountryCode GROUP BY T1.GovernmentForm HAVING AVG(T1.LifeExpectancy) > 72;
SELECT T1.GovernmentForm, SUM(T1.Population) FROM country AS T1 JOIN (SELECT GovernmentForm, AVG(LifeExpectancy) AS avg_life_expectancy FROM country GROUP BY GovernmentForm HAVING AVG(LifeExpectancy) > 72) AS T2 ON T1.GovernmentForm = T2.GovernmentForm GROUP BY T1.GovernmentForm;
SELECT Continent, AVG(LifeExpectancy) AS avg_life_expectancy, SUM(Population) AS total_population FROM country GROUP BY Continent HAVING avg_life_expectancy < 72;
SELECT Continent, SUM(Population) AS TotalPopulation, AVG(LifeExpectancy) AS AvgLifeExpectancy FROM country GROUP BY Continent HAVING AvgLifeExpectancy < 72;
SELECT Name, SurfaceArea FROM country ORDER BY SurfaceArea DESC LIMIT 5;
SELECT Name, SurfaceArea FROM country ORDER BY SurfaceArea DESC LIMIT 5;
SELECT Name FROM country ORDER BY Population DESC LIMIT 3;
SELECT Name FROM country ORDER BY Population DESC LIMIT 3;
SELECT Name FROM country ORDER BY Population ASC LIMIT 3
SELECT Name FROM country ORDER BY Population ASC LIMIT 3;
SELECT COUNT(*) FROM country WHERE Continent = 'Asia';
SELECT COUNT(Code) FROM country WHERE Continent = 'Asia';
SELECT Name FROM country WHERE Continent = 'Europe' AND Population = 80000;
SELECT Name FROM country WHERE Continent = 'Europe' AND Population = 80000;
SELECT SUM(Population) AS TotalPopulation, AVG(SurfaceArea) AS AverageArea FROM country WHERE Continent = 'North America' AND SurfaceArea > 3000;
SELECT SUM(Population), AVG(SurfaceArea) FROM country WHERE Continent = 'North America' AND SurfaceArea > 3000;
SELECT Name FROM city WHERE Population BETWEEN 160000 AND 900000;
SELECT Name FROM city WHERE Population BETWEEN 160000 AND 900000;
SELECT T2.Language FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode GROUP BY T2.Language ORDER BY COUNT(T1.Code) DESC LIMIT 1;
SELECT T2.Language, COUNT(T1.Code) AS count FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode GROUP BY T2.Language ORDER BY count DESC LIMIT 1;
SELECT cl.CountryCode, cl.Language, cl.Percentage FROM countrylanguage cl JOIN (SELECT CountryCode, MAX(Percentage) AS max_percentage FROM countrylanguage GROUP BY CountryCode) cl_max ON cl.CountryCode = cl_max.CountryCode AND cl.Percentage = cl_max.max_percentage;
SELECT T1.Code, T2.Language FROM `country` AS T1 JOIN `countrylanguage` AS T2 ON T1.Code = T2.CountryCode WHERE T2.Percentage IN (SELECT MAX(Percentage) FROM `countrylanguage` GROUP BY CountryCode);
