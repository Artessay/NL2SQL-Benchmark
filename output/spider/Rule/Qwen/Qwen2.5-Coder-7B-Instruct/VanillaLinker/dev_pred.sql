SELECT COUNT(*) FROM singer
SELECT COUNT(*) FROM singer
SELECT Name ,  Country ,  Age FROM singer ORDER BY Age DESC
SELECT Name, Country, Age FROM singer ORDER BY Age DESC
SELECT AVG(Age), MIN(Age), MAX(Age) FROM singer WHERE Country = 'France'
SELECT AVG(Age), MIN(Age), MAX(Age) FROM singer WHERE Country = 'France'
SELECT Song_Name ,  Song_release_year FROM singer ORDER BY Age ASC LIMIT 1
SELECT S.Song_Name, S.Song_release_year FROM singer AS S ORDER BY S.Age ASC LIMIT 1
SELECT DISTINCT Country FROM singer WHERE Age > 20
SELECT DISTINCT Country FROM singer WHERE Age > 20
SELECT Country ,  COUNT(*) FROM singer GROUP BY Country
SELECT Country ,  COUNT(*) FROM singer GROUP BY Country
SELECT Song_Name FROM singer WHERE Age > (SELECT AVG(Age) FROM singer)
SELECT Song_Name FROM singer WHERE Age > (SELECT AVG(Age) FROM singer)
SELECT LOCATION ,  NAME FROM stadium WHERE capacity BETWEEN 5000 AND 10000
SELECT Location, Name FROM stadium WHERE Capacity BETWEEN 5000 AND 10000
SELECT max(Capacity) ,  avg(Average) FROM stadium
SELECT AVG(Capacity), MAX(Capacity) FROM stadium
SELECT Name ,  Capacity FROM stadium ORDER BY Average DESC LIMIT 1
SELECT Name, Capacity FROM stadium ORDER BY Average DESC LIMIT 1
SELECT COUNT(*) FROM concert WHERE Year IN ('2014', '2015')
SELECT COUNT(*) FROM concert WHERE YEAR IN ('2014', '2015')
SELECT T2.Name ,  COUNT(*) FROM concert AS T1 INNER JOIN stadium AS T2 ON T1.Stadium_ID = T2.Stadium_ID GROUP BY T2.Name
SELECT T2.Name ,  COUNT(*) FROM concert AS T1 INNER JOIN stadium AS T2 ON T1.Stadium_ID = T2.Stadium_ID GROUP BY T1.Stadium_ID
SELECT T1.Name, T1.Capacity FROM stadium AS T1 JOIN concert AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T2.Year >= 2014 GROUP BY T1.Stadium_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Name, T1.Capacity FROM stadium AS T1 JOIN concert AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T2.Year > 2013 GROUP BY T1.Stadium_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT YEAR FROM concert GROUP BY YEAR ORDER BY COUNT(*) DESC LIMIT 1
SELECT YEAR FROM concert GROUP BY YEAR ORDER BY COUNT(*) DESC LIMIT 1
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert)
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert)
SELECT Country FROM singer WHERE Age > 40 INTERSECT SELECT Country FROM singer WHERE Age < 30
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert WHERE Year = '2014')
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert WHERE Year = '2014')
SELECT T1.concert_Name ,  T1.Theme ,  COUNT(T2.Singer_ID) FROM concert AS T1 INNER JOIN singer_in_concert AS T2 ON T1.concert_ID  =  T2.concert_ID GROUP BY T1.concert_ID
SELECT T1.concert_name ,  T1.theme ,  COUNT(*) FROM concert AS T1 JOIN singer_in_concert AS T2 ON T1.concert_id  =  T2.concert_id GROUP BY T1.concert_id
SELECT T2.Name ,  COUNT(*) FROM concert AS T1 INNER JOIN singer AS T2 ON T1.concert_ID = T2.Singer_ID GROUP BY T2.Name
SELECT T2.Name ,  COUNT(*) FROM singer_in_concert AS T1 INNER JOIN singer AS T2 ON T1.Singer_ID = T2.Singer_ID GROUP BY T2.Name
SELECT T3.Name FROM concert AS T1 INNER JOIN singer_in_concert AS T2 ON T1.concert_ID = T2.concert_ID INNER JOIN singer AS T3 ON T2.Singer_ID = T3.Singer_ID WHERE T1.Year = '2014'
SELECT S.Name FROM singer AS S JOIN singer_in_concert AS SC ON S.Singer_ID = SC.Singer_ID JOIN concert AS C ON SC.concert_ID = C.concert_ID WHERE C.Year = '2014'
SELECT Name, Country FROM singer WHERE Song_Name LIKE '%Hey%'
SELECT T2.Name ,  T2.Country FROM singer_in_concert AS T1 INNER JOIN singer AS T2 ON T1.Singer_ID = T2.Singer_ID WHERE T2.Song_Name LIKE '%Hey%'
SELECT T1.Name, T1.Location FROM stadium AS T1 JOIN concert AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T2.Year = 2014 INTERSECT SELECT T1.Name, T1.Location FROM stadium AS T1 JOIN concert AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T2.Year = 2015
SELECT T2.Name, T2.Location FROM concert AS T1 INNER JOIN stadium AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T1.Year = 2014 INTERSECT SELECT T2.Name, T2.Location FROM concert AS T1 INNER JOIN stadium AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T1.Year = 2015
SELECT COUNT(*) FROM concert AS T1 JOIN stadium AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T2.Capacity = (SELECT MAX(Capacity) FROM stadium);
SELECT COUNT(*) FROM concert AS T1 JOIN stadium AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T2.Capacity = (SELECT MAX(Capacity) FROM stadium)
SELECT COUNT(*) FROM Pets WHERE weight > 10;
SELECT COUNT(*) FROM Pets WHERE weight > 10;
SELECT MIN(weight) FROM Pets WHERE PetType = 'dog'
SELECT weight FROM Pets WHERE PetType = 'dog' ORDER BY pet_age ASC LIMIT 1
SELECT PetType, MAX(weight) FROM Pets GROUP BY PetType
SELECT PetType, MAX(weight) FROM Pets GROUP BY PetType
SELECT COUNT(*) FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID WHERE T1.Age > 20
SELECT COUNT(*) FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID WHERE T1.Age > 20
SELECT COUNT(*) FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T1.Sex = 'F' AND T3.PetType = 'dog'
SELECT COUNT(*) FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID INNER JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T1.Sex = 'F' AND T3.PetType = 'dog'
SELECT COUNT(DISTINCT PetType) FROM Pets
SELECT COUNT(DISTINCT PetType) FROM Pets
SELECT T1.Fname FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType IN ('cat', 'dog')
SELECT DISTINCT T1.Fname FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID INNER JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType IN ('cat', 'dog')
SELECT T1.Fname FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'cat' INTERSECT SELECT T1.Fname FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'dog'
SELECT T1.Fname FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'cat' INTERSECT SELECT T1.Fname FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'dog'
SELECT T1.Major, T1.Age FROM Student AS T1 WHERE T1.StuID NOT IN (SELECT T2.StuID FROM Has_Pet AS T2 JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'cat')
SELECT S.Major, S.Age FROM Student AS S WHERE S.StuID NOT IN (SELECT HP.StuID FROM Has_Pet AS HP JOIN Pets AS P ON HP.PetID = P.PetID WHERE P.PetType = 'cat')
SELECT StuID FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE PetType = 'cat')
SELECT StuID FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE PetType = 'cat')
SELECT T1.Fname ,  T1.Age FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID INNER JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'dog' AND T1.StuID NOT IN (SELECT StuID FROM Has_Pet INNER JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Pets.PetType = 'cat')
SELECT T1.Fname FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'dog' AND T1.StuID NOT IN (SELECT StuID FROM Has_Pet JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Pets.PetType = 'cat')
SELECT PetType, weight FROM Pets ORDER BY pet_age ASC LIMIT 1
SELECT PetType, weight FROM Pets WHERE pet_age = (SELECT MIN(pet_age) FROM Pets);
SELECT PetID, weight FROM Pets WHERE pet_age > 1
SELECT PetID, weight FROM Pets WHERE pet_age > 1
SELECT T2.PetType, AVG(T2.pet_age) AS avg_age, MAX(T2.pet_age) AS max_age FROM Has_Pet AS T1 INNER JOIN Pets AS T2 ON T1.PetID = T2.PetID GROUP BY T2.PetType
SELECT PetType, AVG(pet_age) AS AvgAge, MAX(pet_age) AS MaxAge FROM Pets GROUP BY PetType
SELECT PetType, AVG(weight) FROM Pets GROUP BY PetType
SELECT PetType ,  AVG(weight) FROM Pets GROUP BY PetType
SELECT T1.Fname, T1.Age FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID
SELECT DISTINCT T1.Fname ,  T1.Age FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID
SELECT T2.PetID FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID WHERE T1.LName = 'Smith'
SELECT T2.PetID FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID WHERE T1.LName = 'Smith'
SELECT T1.StuID, COUNT(T2.PetID) AS Number_of_Pets FROM Student AS T1 LEFT JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID GROUP BY T1.StuID
SELECT T1.StuID, COUNT(T2.PetID) AS NumPets FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID GROUP BY T1.StuID
SELECT T1.Fname, T1.Sex FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID GROUP BY T1.StuID HAVING COUNT(T2.PetID) > 1
SELECT T1.Fname ,  T1.sex FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID GROUP BY T1.StuID HAVING COUNT(T2.PetID) > 1
SELECT T1.LName FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID INNER JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'cat' AND T3.pet_age = 3
SELECT T1.LName FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID INNER JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'cat' AND T3.pet_age = 3
SELECT AVG(Age) FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet)
SELECT AVG(Age) FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet)
SELECT COUNT(*) FROM continents
SELECT COUNT(*) FROM continents
SELECT T2.ContId, T2.Continent, COUNT(T1.CountryId) FROM countries AS T1 INNER JOIN continents AS T2 ON T1.Continent = T2.ContId GROUP BY T2.ContId, T2.Continent
SELECT T1.ContId, T1.Continent, COUNT(T2.CountryId) FROM continents AS T1 LEFT JOIN countries AS T2 ON T1.ContId = T2.Continent GROUP BY T1.ContId, T1.Continent
SELECT COUNT(CountryId) FROM countries
SELECT COUNT(CountryId) FROM countries
SELECT T1.FullName, T1.Id, COUNT(T2.Model) FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.Id;
SELECT T2.Maker, T2.FullName, COUNT(T1.Model) FROM model_list AS T1 INNER JOIN car_makers AS T2 ON T1.Maker = T2.Id GROUP BY T2.Maker, T2.FullName
SELECT T1.Model FROM model_list AS T1 JOIN cars_data AS T2 ON T1.ModelId = T2.Id ORDER BY T2.Horsepower ASC LIMIT 1
SELECT T1.Model FROM model_list AS T1 JOIN cars_data AS T2 ON T1.ModelId = T2.Id WHERE T2.Horsepower IS NOT NULL ORDER BY T2.Horsepower ASC LIMIT 1
SELECT Model FROM model_list WHERE MakeId IN (SELECT MakeId FROM cars_data WHERE Weight < (SELECT AVG(Weight) FROM cars_data))
SELECT T1.Model FROM model_list AS T1 JOIN cars_data AS T2 ON T1.ModelId = T2.Id WHERE T2.Weight < (SELECT AVG(Weight) FROM cars_data)
SELECT DISTINCT T2.Maker FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.MakeId = T2.MakeId WHERE T1.Year = 1970
SELECT DISTINCT T1.Maker FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker INNER JOIN cars_data AS T3 ON T2.ModelId = T3.Id WHERE T3.Year = 1970
SELECT T2.Make, T1.Year FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.Id = T2.MakeId ORDER BY T1.Year ASC LIMIT 1
SELECT T2.Maker, T1.Year FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.MakeId = T2.MakeId ORDER BY T1.Year ASC LIMIT 1
SELECT DISTINCT Model FROM model_list WHERE Maker IN (SELECT Id FROM car_names WHERE MakeId IN (SELECT Id FROM cars_data WHERE Year > 1980))
SELECT DISTINCT Model FROM car_names WHERE MakeId IN (SELECT Id FROM cars_data WHERE Year > 1980)
SELECT T1.Continent, COUNT(T2.Maker) AS Car_Makers FROM continents AS T1 INNER JOIN car_makers AS T2 ON T1.ContId = T2.Country GROUP BY T1.Continent
SELECT T2.Continent ,  COUNT(T1.Id) FROM car_makers AS T1 INNER JOIN continents AS T2 ON T1.Country = T2.ContId GROUP BY T2.Continent
SELECT T1.CountryName FROM countries AS T1 INNER JOIN car_makers AS T2 ON T1.CountryId = T2.Country GROUP BY T1.CountryId ORDER BY COUNT(T2.Maker) DESC LIMIT 1
SELECT T1.CountryName FROM countries AS T1 JOIN car_makers AS T2 ON T1.CountryId = T2.Country GROUP BY T1.CountryId ORDER BY COUNT(T2.Id) DESC LIMIT 1
SELECT COUNT(T1.Model), T2.FullName FROM model_list AS T1 INNER JOIN car_makers AS T2 ON T1.Maker = T2.Id GROUP BY T2.FullName
SELECT T1.Maker, COUNT(T1.Model), T2.Id, T2.FullName FROM model_list AS T1 INNER JOIN car_makers AS T2 ON T1.Maker = T2.Id GROUP BY T1.Maker
SELECT T1.Accelerate FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.MakeId = T2.MakeId WHERE T2.Model = 'amc hornet sportabout'
SELECT T2.Accelerate FROM car_names AS T1 INNER JOIN cars_data AS T2 ON T1.MakeId = T2.Id WHERE T1.Model = 'amc hornet sportabout'
SELECT COUNT(*) FROM car_makers AS T1 INNER JOIN countries AS T2 ON T1.Country = T2.CountryId WHERE T2.CountryName = 'france'
SELECT COUNT(*) FROM car_makers AS T1 INNER JOIN countries AS T2 ON T1.Country = T2.CountryId WHERE T2.CountryName = 'france'
SELECT COUNT(*) FROM car_makers AS T1 JOIN countries AS T2 ON T1.Country = T2.CountryId WHERE T2.CountryName = 'usa'
SELECT COUNT(*) FROM car_makers AS T1 INNER JOIN countries AS T2 ON T1.Country = T2.CountryId WHERE T2.CountryName = 'usa'
SELECT AVG(MPG) FROM cars_data WHERE Cylinders = 4
SELECT AVG(MPG) FROM cars_data WHERE Cylinders = 4
SELECT MIN(Weight) FROM cars_data WHERE Cylinders = 8 AND Year = 1974
SELECT MIN(T1.Weight) FROM cars_data AS T1 WHERE T1.Cylinders = 8 AND T1.Year = 1974
SELECT T2.Maker, T3.Model FROM car_names AS T1 INNER JOIN car_makers AS T2 ON T1.MakeId = T2.Id INNER JOIN model_list AS T3 ON T1.Model = T3.Model
SELECT T1.Maker, T2.Model FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker
SELECT T2.CountryName, T2.Continent FROM car_makers AS T1 INNER JOIN countries AS T2 ON T1.Country = T2.CountryId GROUP BY T2.CountryName, T2.Continent HAVING COUNT(T1.Id) >= 1
SELECT T1.CountryName ,  T1.CountryId FROM countries AS T1 INNER JOIN car_makers AS T2 ON T1.CountryId = T2.Country GROUP BY T1.CountryId HAVING COUNT(T2.Id) >= 1
SELECT COUNT(*) FROM car_data WHERE Horsepower > 150
SELECT COUNT(*) FROM car_names AS T1 INNER JOIN cars_data AS T2 ON T1.MakeId = T2.Id WHERE T2.Horsepower > 150
SELECT AVG(Weight), Year FROM cars_data GROUP BY Year
SELECT AVG(T1.Weight), T1.Year FROM cars_data AS T1 GROUP BY T1.Year
SELECT T1.CountryName FROM countries AS T1 INNER JOIN car_makers AS T2 ON T1.CountryId = T2.Country WHERE T1.Continent = 2 GROUP BY T1.CountryId HAVING COUNT(T2.Id) >= 3
SELECT T2.CountryName FROM car_makers AS T1 INNER JOIN countries AS T2 ON T1.Country = T2.CountryId INNER JOIN continents AS T3 ON T2.Continent = T3.ContId WHERE T3.Continent = 'europe' GROUP BY T2.CountryName HAVING COUNT(T1.Id) >= 3
SELECT T2.Horsepower, T1.Make FROM car_names AS T1 INNER JOIN cars_data AS T2 ON T1.MakeId = T2.Id WHERE T2.Cylinders = 3 ORDER BY T2.Horsepower DESC LIMIT 1
SELECT T1.Make, T1.Model FROM car_names AS T1 INNER JOIN model_list AS T2 ON T1.Model = T2.Model WHERE T2.Cylinders = 3 ORDER BY T1.Horsepower DESC LIMIT 1
SELECT T2.Model FROM cars_data AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.ModelId ORDER BY T1.MPG DESC LIMIT 1
SELECT T.Model FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.Id = T2.MakeId INNER JOIN model_list AS T3 ON T2.Model = T3.Model ORDER BY T1.MPG DESC LIMIT 1
SELECT AVG(Horsepower) FROM cars_data WHERE Year < 1980
SELECT AVG(T2.Horsepower) FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.MakeId = T2.MakeId WHERE T1.Year < 1980
SELECT AVG(T1.Edispl) FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.Id = T2.MakeId WHERE T2.Model = 'volvo'
SELECT AVG(T1.Edispl) FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.Id = T2.MakeId WHERE T2.Make LIKE '%volvo%'
SELECT Cylinders, MAX(Accelerate) FROM cars_data GROUP BY Cylinders
SELECT Cylinders, MAX(Accelerate) FROM cars_data GROUP BY Cylinders
SELECT Model FROM car_names GROUP BY Model ORDER BY COUNT(MakeId) DESC LIMIT 1
SELECT Model FROM model_list GROUP BY Model ORDER BY COUNT(DISTINCT Maker) DESC LIMIT 1
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 4;
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 4
SELECT COUNT(*) FROM cars_data WHERE Year = 1980
SELECT COUNT(*) FROM cars_data WHERE Year = 1980
SELECT COUNT(*) FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker WHERE T1.FullName = 'American Motor Company'
SELECT COUNT(*) FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker WHERE T1.Maker = 'amc'
SELECT T2.FullName, T2.Id FROM model_list AS T1 INNER JOIN car_makers AS T2 ON T1.Maker = T2.Id GROUP BY T2.FullName HAVING COUNT(T1.Model) > 3
SELECT T2.MakeId, T2.Model FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T2.MakeId HAVING COUNT(T2.Model) > 3
SELECT DISTINCT T3.Model FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker INNER JOIN car_names AS T3 ON T2.Model = T3.Model WHERE T1.FullName = 'General Motors' OR T3.Weight > 3500
SELECT DISTINCT T3.Model FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker INNER JOIN car_names AS T3 ON T2.Model = T3.Model WHERE T1.Maker = 'gm' OR T3.Weight > 3500
SELECT DISTINCT Year FROM cars_data WHERE Weight BETWEEN 3000 AND 4000
SELECT DISTINCT Year FROM cars_data WHERE Weight < 4000 AND Weight > 3000
SELECT T1.Horsepower FROM cars_data AS T1 WHERE T1.Accelerate = (SELECT MAX(Accelerate) FROM cars_data)
SELECT Horsepower FROM cars_data WHERE Accelerate = (SELECT MAX(Accelerate) FROM cars_data)
SELECT T1.Cylinders FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.MakeId = T2.MakeId WHERE T2.Model = 'volvo' ORDER BY T1.Accelerate ASC LIMIT 1
SELECT T1.Cylinders FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker WHERE T1.Maker = 'volkswagen' ORDER BY T1.Accelerate ASC LIMIT 1
SELECT COUNT(*) FROM cars_data WHERE Accelerate > (SELECT MAX(Accelerate) FROM cars_data) AND Horsepower IS NOT NULL
SELECT COUNT(*) FROM cars_data WHERE Accelerate > ( SELECT Accelerate FROM cars_data ORDER BY Horsepower DESC LIMIT 1 )
SELECT COUNT(Country) FROM ( SELECT Country FROM car_makers GROUP BY Country HAVING COUNT(Maker) > 2 )
SELECT COUNT(*) FROM countries AS T1 JOIN car_makers AS T2 ON T1.CountryId = T2.Country GROUP BY T1.CountryId HAVING COUNT(T2.Id) > 2
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 6;
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 6
SELECT T1.Model FROM model_list AS T1 JOIN car_names AS T2 ON T1.Model = T2.Model WHERE T1.Cylinders = 4 ORDER BY T1.Horsepower DESC LIMIT 1
SELECT T3.Model FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.Id = T2.MakeId INNER JOIN model_list AS T3 ON T2.Model = T3.Model WHERE T1.Cylinders = 4 ORDER BY T1.Horsepower DESC LIMIT 1
SELECT T1.MakeId, T2.Make FROM car_names AS T1 INNER JOIN model_list AS T2 ON T1.Model = T2.Model INNER JOIN cars_data AS T3 ON T1.MakeId = T3.Id WHERE T3.Horsepower > ( SELECT MIN(Horsepower) FROM cars_data ) AND T3.Cylinders <= 3
SELECT T1.MakeId, T1.Model FROM car_names AS T1 INNER JOIN cars_data AS T2 ON T1.MakeId = T2.Id WHERE T2.Horsepower != ( SELECT MIN(Horsepower) FROM cars_data ) AND T2.Cylinders < 4
SELECT MAX(T1.MPG) FROM cars_data AS T1 WHERE T1.Cylinders = 8 OR T1.Year < 1980
SELECT MAX(T1.MPG) FROM cars_data AS T1 WHERE T1.Cylinders = 8 OR T1.Year < 1980
SELECT T3.Model FROM countries AS T1 INNER JOIN car_makers AS T2 ON T1.ContId = T2.Country INNER JOIN model_list AS T3 ON T2.Id = T3.Maker INNER JOIN cars_data AS T4 ON T3.ModelId = T4.Id WHERE T4.Weight < 3500 AND T2.Maker != 'Ford Motor Company'
SELECT DISTINCT T1.Model FROM model_list AS T1 INNER JOIN car_names AS T2 ON T1.Model = T2.Model WHERE T2.Make != 'ford' AND T2.MakeId IN (SELECT MakeId FROM cars_data WHERE Weight < 3500)
SELECT CountryName FROM countries WHERE CountryId NOT IN (SELECT Country FROM car_makers);
SELECT CountryName FROM countries WHERE CountryId NOT IN (SELECT Country FROM car_makers)
SELECT T1.Id, T1.Maker FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.Id HAVING COUNT(T2.Model) >= 2 AND COUNT(DISTINCT T1.Maker) > 3
SELECT T1.Id, T1.Maker FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.Id HAVING COUNT(T2.Model) >= 2 AND COUNT(T1.Maker) > 3
SELECT T1.CountryId, T1.CountryName FROM countries AS T1 JOIN car_makers AS T2 ON T1.CountryId = T2.Country WHERE T2.Maker = 'fiat' GROUP BY T1.CountryId HAVING COUNT(T2.Id) > 3
SELECT T2.CountryId, T2.CountryName FROM car_makers AS T1 INNER JOIN countries AS T2 ON T1.Country = T2.CountryId WHERE T2.Continent IN ( SELECT ContId FROM continents WHERE Continent LIKE '%america%' ) GROUP BY T2.CountryId HAVING COUNT(T1.Id) > 3 OR EXISTS ( SELECT 1 FROM model_list AS T3 INNER JOIN car_names AS T4 ON T3.Model = T4.Model WHERE T4.Make = 'fiat' AND T4.MakeId = T2.CountryId )
SELECT Country FROM airlines WHERE Airline = 'JetBlue Airways'
SELECT Country FROM airlines WHERE Airline = 'JetBlue Airways'
SELECT Abbreviation FROM airlines WHERE Airline = 'JetBlue Airways'
SELECT Abbreviation FROM airlines WHERE Airline = 'JetBlue Airways'
SELECT Airline ,  Abbreviation FROM airlines WHERE Country = 'USA'
SELECT Airline, Abbreviation FROM airlines WHERE Country = 'USA'
SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony'
SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony'
SELECT COUNT(*) FROM airlines
SELECT COUNT(*) FROM airlines
SELECT COUNT(*) FROM airports
SELECT COUNT(*) FROM airports
SELECT COUNT(*) FROM flights
SELECT COUNT(*) FROM flights
SELECT Airline FROM airlines WHERE Abbreviation = 'UAL'
SELECT Airline FROM airlines WHERE Abbreviation = 'UAL'
SELECT COUNT(*) FROM airlines WHERE Country = 'USA'
SELECT COUNT(*) FROM airlines WHERE Country = 'USA'
SELECT T2.City, T2.Country FROM airports AS T1 INNER JOIN cities AS T2 ON T1.City = T2.City WHERE T1.AirportName = 'Alton Airport'
SELECT City , Country FROM airports WHERE AirportName = 'Alton'
SELECT AirportName FROM airports WHERE AirportCode = 'AKO'
SELECT AirportName FROM airports WHERE AirportCode = 'AKO'
SELECT AirportName FROM airports WHERE City = 'Aberdeen'
SELECT AirportName FROM airports WHERE City = 'Aberdeen'
SELECT COUNT(*) FROM flights WHERE SourceAirport = 'APG';
SELECT COUNT(*) FROM flights WHERE SourceAirport = 'APG'
SELECT COUNT(*) FROM flights WHERE DestAirport = 'ATO'
SELECT COUNT(*) FROM flights AS T1 JOIN airports AS T2 ON T1.DestAirport = T2.AirportCode WHERE T2.AirportName = 'ATO'
SELECT COUNT(*) FROM flights AS T1 INNER JOIN airports AS T2 ON T1.SourceAirport = T2.AirportCode WHERE T2.City = 'Aberdeen'
SELECT COUNT(*) FROM airports AS T1 INNER JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport WHERE T1.City = 'Aberdeen'
SELECT COUNT(*) FROM airports AS T1 INNER JOIN flights AS T2 ON T1.AirportCode = T2.DestAirport WHERE T1.City = 'Aberdeen'
SELECT COUNT(*) FROM airports AS T1 INNER JOIN flights AS T2 ON T1.AirportCode = T2.DestAirport WHERE T1.City = 'Aberdeen'
SELECT COUNT(*) FROM flights AS T1 JOIN airports AS T2 ON T1.SourceAirport = T2.AirportCode JOIN airports AS T3 ON T1.DestAirport = T3.AirportCode WHERE T2.City = 'Aberdeen' AND T3.City = 'Ashley'
SELECT COUNT(*) FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport WHERE T1.City = 'Aberdeen' AND T2.DestAirport IN (SELECT AirportCode FROM airports WHERE City = 'Ashley')
SELECT COUNT(*) FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T1.Airline = 'JetBlue Airways'
SELECT COUNT(*) FROM flights AS T1 JOIN airlines AS T2 ON T1.Airline = T2.uid WHERE T2.Airline = 'JetBlue Airways'
SELECT COUNT(*) FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T1.Airline = 'United Airlines' AND T2.DestAirport = 'ASY'
SELECT COUNT(*) FROM flights AS T1 JOIN airlines AS T2 ON T1.Airline = T2.uid WHERE T2.Airline = 'United Airlines' AND T1.DestAirport = 'ASY'
SELECT COUNT(*) FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T1.Airline = 'United Airlines' AND T2.SourceAirport = 'AHD'
SELECT COUNT(*) FROM flights AS T1 JOIN airlines AS T2 ON T1.Airline = T2.uid JOIN airports AS T3 ON T1.SourceAirport = T3.AirportCode WHERE T2.Airline = 'United Airlines' AND T3.AirportCode = 'AHD'
SELECT COUNT(*) FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T1.Airline = 'United Airlines' AND T2.DestAirport IN ( SELECT AirportCode FROM airports WHERE City = 'Aberdeen' )
SELECT COUNT(*) FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline INNER JOIN airports AS T3 ON T3.AirportCode = T2.DestAirport WHERE T1.Airline = 'United Airlines' AND T3.City = 'Aberdeen'
SELECT T2.City FROM flights AS T1 INNER JOIN airports AS T2 ON T1.DestAirport = T2.AirportCode GROUP BY T2.City ORDER BY COUNT(T1.FlightNo) DESC LIMIT 1
SELECT T2.City FROM flights AS T1 INNER JOIN airports AS T2 ON T1.DestAirport = T2.AirportCode GROUP BY T2.City ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.City FROM flights AS T1 INNER JOIN airports AS T2 ON T1.SourceAirport = T2.AirportCode GROUP BY T2.City ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.City FROM flights AS T1 INNER JOIN airports AS T2 ON T1.SourceAirport = T2.AirportCode GROUP BY T2.City ORDER BY COUNT(*) DESC LIMIT 1
SELECT SourceAirport FROM flights GROUP BY SourceAirport ORDER BY COUNT(*) DESC LIMIT 1
SELECT SourceAirport FROM flights GROUP BY SourceAirport ORDER BY COUNT(*) DESC LIMIT 1
SELECT DestAirport FROM flights GROUP BY DestAirport ORDER BY COUNT(*) ASC LIMIT 1
SELECT SourceAirport FROM flights GROUP BY SourceAirport ORDER BY COUNT(*) ASC LIMIT 1
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Abbreviation, T1.Country FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline ORDER BY COUNT(T2.FlightNo) ASC LIMIT 1
SELECT T1.Abbreviation, T1.Country FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T2.Airline ORDER BY COUNT(*) ASC LIMIT 1
SELECT DISTINCT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'AHD'
SELECT T1.Airline FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'AHD'
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.DestAirport = 'AHD'
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.DestAirport = 'AHD'
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'APG' AND T2.DestAirport = 'CVO' INTERSECT SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'CVO' AND T2.DestAirport = 'APG'
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport IN ('APG', 'CVO') GROUP BY T1.Airline HAVING COUNT(DISTINCT T2.SourceAirport) > 1
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'CVO' AND T2.DestAirport != 'APG'
SELECT T1.Airline FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'CVO' AND T2.DestAirport != 'APG'
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline HAVING COUNT(T2.FlightNo) >= 10
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline HAVING COUNT(T2.FlightNo) >= 10
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline HAVING COUNT(T2.FlightNo) < 200
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline HAVING COUNT(T2.FlightNo) < 200
SELECT FlightNo FROM flights WHERE Airline = (SELECT uid FROM airlines WHERE Airline = 'United Airlines')
SELECT FlightNo FROM flights WHERE Airline = (SELECT uid FROM airlines WHERE Airline = 'United Airlines')
SELECT FlightNo FROM flights WHERE SourceAirport = 'APG'
SELECT FlightNo FROM flights WHERE SourceAirport = 'APG'
SELECT FlightNo FROM flights WHERE DestAirport = 'APG'
SELECT FlightNo FROM flights WHERE DestAirport = 'APG'
SELECT FlightNo FROM flights WHERE SourceAirport IN (SELECT AirportCode FROM airports WHERE City = 'Aberdeen ')
SELECT FlightNo FROM flights WHERE SourceAirport IN (SELECT AirportCode FROM airports WHERE City = 'Aberdeen ')
SELECT T2.FlightNo FROM airports AS T1 INNER JOIN flights AS T2 ON T1.AirportCode = T2.DestAirport WHERE T1.City = 'Aberdeen'
SELECT T2.FlightNo FROM airports AS T1 INNER JOIN flights AS T2 ON T1.AirportCode = T2.DestAirport WHERE T1.City LIKE '%Aberdeen%'
SELECT COUNT(*) FROM airports AS T1 INNER JOIN flights AS T2 ON T1.AirportCode = T2.DestAirport WHERE T1.City IN ('Aberdeen ', 'Abilene ')
SELECT COUNT(*) FROM airports AS T1 INNER JOIN flights AS T2 ON T1.AirportCode = T2.DestAirport WHERE T1.City IN ('Aberdeen', 'Abilene')
SELECT AirportName FROM airports WHERE AirportCode NOT IN (SELECT SourceAirport FROM flights UNION SELECT DestAirport FROM flights)
SELECT AirportCode FROM airports WHERE AirportCode NOT IN (SELECT SourceAirport FROM flights UNION SELECT DestAirport FROM flights)
SELECT COUNT(Employee_ID) FROM employee
SELECT COUNT(Employee_ID) FROM employee
SELECT Name FROM employee ORDER BY Age ASC
SELECT Name FROM employee ORDER BY Age ASC
SELECT City ,  COUNT(Employee_ID) FROM employee GROUP BY City
SELECT City ,  COUNT(Employee_ID) FROM employee GROUP BY City
SELECT City FROM employee WHERE Age < 30 GROUP BY City HAVING COUNT(Employee_ID) > 1
SELECT City FROM employee WHERE Age < 30 GROUP BY City HAVING COUNT(Employee_ID) > 1
SELECT LOCATION ,  COUNT(*) FROM shop GROUP BY LOCATION
SELECT Location ,  COUNT(*) FROM shop GROUP BY Location
SELECT T1.manager_name ,  T1.district FROM shop AS T1 ORDER BY T1.number_products DESC LIMIT 1
SELECT T2.manager_name ,  T2.district FROM hiring AS T1 INNER JOIN shop AS T2 ON T1.shop_id  =  T2.shop_id ORDER BY T2.number_products DESC LIMIT 1
SELECT MIN(Number_products), MAX(Number_products) FROM shop
SELECT MIN(Number_products), MAX(Number_products) FROM shop
SELECT Name ,  LOCATION ,  District FROM shop ORDER BY Number_products DESC
SELECT Name ,  LOCATION ,  District FROM shop ORDER BY Number_products DESC
SELECT T2.Name FROM hiring AS T1 INNER JOIN shop AS T2 ON T1.Shop_ID = T2.Shop_ID WHERE T2.Number_products > (SELECT AVG(Number_products) FROM shop)
SELECT Name FROM shop WHERE Number_products > (SELECT AVG(Number_products) FROM shop);
SELECT T1.Name FROM employee AS T1 JOIN evaluation AS T2 ON T1.Employee_ID = T2.Employee_ID GROUP BY T1.Name ORDER BY COUNT(*) DESC LIMIT 1
SELECT E.Name FROM employee AS E JOIN evaluation AS EV ON E.Employee_ID = EV.Employee_ID GROUP BY E.Employee_ID ORDER BY COUNT(EV.Year_awarded) DESC LIMIT 1
SELECT T2.Name FROM evaluation AS T1 INNER JOIN employee AS T2 ON T1.Employee_ID = T2.Employee_ID ORDER BY T1.Bonus DESC LIMIT 1
SELECT T1.Name FROM employee AS T1 JOIN evaluation AS T2 ON T1.Employee_ID = T2.Employee_ID WHERE T2.Bonus IS NOT NULL ORDER BY T2.Bonus DESC LIMIT 1
SELECT Name FROM employee WHERE Employee_ID NOT IN (SELECT Employee_ID FROM evaluation)
SELECT Name FROM employee WHERE Employee_ID NOT IN (SELECT Employee_ID FROM evaluation)
SELECT T2.Name FROM hiring AS T1 INNER JOIN shop AS T2 ON T1.Shop_ID = T2.Shop_ID GROUP BY T1.Shop_ID ORDER BY COUNT(T1.Employee_ID) DESC LIMIT 1
SELECT T2.Name FROM hiring AS T1 JOIN shop AS T2 ON T1.Shop_ID = T2.Shop_ID GROUP BY T2.Name ORDER BY COUNT(T1.Employee_ID) DESC LIMIT 1
SELECT Name FROM shop WHERE Shop_ID NOT IN (SELECT Shop_ID FROM hiring)
SELECT Name FROM shop WHERE Shop_ID NOT IN (SELECT Shop_ID FROM hiring);
SELECT T2.Name ,  COUNT(T1.Employee_ID) FROM hiring AS T1 INNER JOIN shop AS T2 ON T1.Shop_ID = T2.Shop_ID GROUP BY T2.Name
SELECT T2.Name ,  COUNT(T1.Employee_ID) FROM hiring AS T1 JOIN shop AS T2 ON T1.Shop_ID = T2.Shop_ID GROUP BY T2.Name
SELECT SUM(Bonus) FROM evaluation
SELECT sum(Bonus) FROM evaluation
SELECT * FROM hiring;
SELECT * FROM hiring;
SELECT DISTINCT District FROM shop WHERE Number_products < 3000 INTERSECT SELECT DISTINCT District FROM shop WHERE Number_products > 10000
SELECT District FROM shop WHERE Number_products < 3000 INTERSECT SELECT District FROM shop WHERE Number_products > 10000
SELECT COUNT(DISTINCT Location) FROM shop
SELECT COUNT(DISTINCT Location) FROM shop
SELECT COUNT(Document_ID) FROM Documents
SELECT COUNT(Document_ID) FROM Documents;
SELECT Document_ID, Document_Name, Document_Description FROM Documents;
SELECT Document_ID, Document_Name, Document_Description FROM Documents;
SELECT Document_Name, Template_ID FROM Documents WHERE Document_Description LIKE '%w%'
SELECT Document_Name, Template_ID FROM Documents WHERE Document_Description LIKE '%w%'
SELECT Document_ID, Template_ID, Document_Description FROM Documents WHERE Document_Name = 'Robbin CV'
SELECT Document_ID, Template_ID, Document_Description FROM Documents WHERE Document_Name = 'Robbin CV'
SELECT COUNT(DISTINCT Template_ID) FROM Documents
SELECT COUNT(DISTINCT Template_ID) FROM Documents
SELECT COUNT(*) FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID WHERE T2.Template_Type_Code = 'PPT'
SELECT COUNT(*) FROM Documents AS T1 INNER JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID WHERE T2.Template_Type_Code = 'PPT'
SELECT Template_ID ,  COUNT(Document_ID) FROM Documents GROUP BY Template_ID
SELECT Template_ID ,  COUNT(*) FROM Documents GROUP BY Template_ID
SELECT T2.Template_ID, T2.Template_Type_Code FROM Documents AS T1 INNER JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T2.Template_ID, T2.Template_Type_Code ORDER BY COUNT(T1.Document_ID) DESC LIMIT 1
SELECT T1.Template_ID, T1.Template_Type_Code FROM Templates AS T1 JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T1.Template_ID ORDER BY COUNT(T2.Document_ID) DESC LIMIT 1
SELECT Template_ID FROM Documents GROUP BY Template_ID HAVING COUNT(*) > 1
SELECT Template_ID FROM Documents GROUP BY Template_ID HAVING COUNT(*) > 1
SELECT Template_ID FROM Templates WHERE Template_ID NOT IN (SELECT Template_ID FROM Documents)
SELECT Template_ID FROM Templates WHERE Template_ID NOT IN (SELECT Template_ID FROM Documents);
SELECT COUNT(*) FROM Templates;
SELECT COUNT(*) FROM Templates;
SELECT Template_ID, Version_Number, Template_Type_Code FROM Templates;
SELECT Template_ID, Version_Number, Template_Type_Code FROM Templates;
SELECT DISTINCT Template_Type_Code FROM Templates;
SELECT DISTINCT Template_Type_Code FROM Templates
SELECT Template_ID FROM Templates WHERE Template_Type_Code IN ('PP', 'PPT')
SELECT Template_ID FROM Templates WHERE Template_Type_Code IN ('PP', 'PPT')
SELECT COUNT(*) FROM Templates WHERE Template_Type_Code = 'CV'
SELECT COUNT(*) FROM Templates WHERE Template_Type_Code = 'CV'
SELECT Version_Number, Template_Type_Code FROM Templates WHERE Version_Number > 5
SELECT Version_Number, Template_Type_Code FROM Templates WHERE Version_Number > 5;
SELECT Template_Type_Code ,  COUNT(*) FROM Templates GROUP BY Template_Type_Code
SELECT Template_Type_Code ,  COUNT(*) FROM Templates GROUP BY Template_Type_Code
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code HAVING COUNT(*) < 3;
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code HAVING COUNT(*) < 3
SELECT MIN(T1.Version_Number), T1.Template_Type_Code FROM Templates AS T1 ORDER BY T1.Version_Number ASC LIMIT 1
SELECT MIN(T1.Version_Number), T1.Template_Type_Code FROM Templates AS T1 GROUP BY T1.Template_Type_Code ORDER BY MIN(T1.Version_Number) ASC LIMIT 1
SELECT T2.Template_Type_Code FROM Documents AS T1 INNER JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID WHERE T1.Document_Name = 'Data base'
SELECT T1.Template_Type_Code FROM Templates AS T1 INNER JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID WHERE T2.Document_Name = 'Data base'
SELECT T1.Document_Name FROM Documents AS T1 INNER JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID WHERE T2.Template_Type_Code = 'BK'
SELECT T2.Document_Name FROM Templates AS T1 INNER JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID WHERE T1.Template_Type_Code = 'BK'
SELECT T1.Template_Type_Code, COUNT(DISTINCT T2.Document_ID) AS Number_of_Documents FROM Ref_Template_Types AS T1 INNER JOIN Templates AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code GROUP BY T1.Template_Type_Code
SELECT Template_Type_Code ,  COUNT(Document_ID) FROM Templates AS T1 INNER JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY Template_Type_Code
SELECT Template_Type_Code FROM Documents JOIN Templates ON Documents.Template_ID = Templates.Template_ID GROUP BY Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Template_Type_Code FROM Documents INNER JOIN Templates ON Documents.Template_ID = Templates.Template_ID GROUP BY Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Code NOT IN (SELECT Template_Type_Code FROM Templates WHERE Template_ID IN (SELECT Template_ID FROM Documents))
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Code NOT IN (SELECT Template_Type_Code FROM Templates)
SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types;
SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types;
SELECT Template_Type_Description FROM Ref_Template_Types WHERE Template_Type_Code = 'AD'
SELECT Template_Type_Description FROM Ref_Template_Types WHERE Template_Type_Code = 'AD'
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Book'
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Book'
SELECT DISTINCT T2.Template_Type_Description FROM Templates AS T1 INNER JOIN Ref_Template_Types AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code
SELECT DISTINCT T2.Template_Type_Description FROM Documents AS T1 INNER JOIN Ref_Template_Types AS T2 ON T1.Template_ID = T2.Template_ID
SELECT Template_ID FROM Templates AS T1 INNER JOIN Ref_Template_Types AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code WHERE T2.Template_Type_Description = 'Presentation'
SELECT Template_ID FROM Templates WHERE Template_Type_Code IN (SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Presentation')
SELECT COUNT(*) FROM Paragraphs
SELECT COUNT(*) FROM Paragraphs
SELECT COUNT(*) FROM Documents AS T1 INNER JOIN Paragraphs AS T2 ON T1.Document_ID = T2.Document_ID WHERE T1.Document_Name = 'Summer Show'
SELECT COUNT(*) FROM Documents AS T1 INNER JOIN Paragraphs AS T2 ON T1.Document_ID = T2.Document_ID WHERE T1.Document_Name = 'Summer Show'
SELECT T1.Paragraph_ID, T1.Document_ID, T1.Paragraph_Text FROM Paragraphs AS T1 WHERE T1.Paragraph_Text = 'Korea'
SELECT T2.Paragraph_Text FROM Documents AS T1 INNER JOIN Paragraphs AS T2 ON T1.Document_ID = T2.Document_ID WHERE T2.Paragraph_Text LIKE '%Korea%'
SELECT P.Paragraph_ID, P.Paragraph_Text FROM Documents D JOIN Paragraphs P ON D.Document_ID = P.Document_ID WHERE D.Document_Name = 'Welcome to NY'
SELECT P.Paragraph_ID, P.Paragraph_Text FROM Documents D JOIN Paragraphs P ON D.Document_ID = P.Document_ID WHERE D.Document_Name = 'Welcome to NY'
SELECT P.Paragraph_Text FROM Documents D JOIN Paragraphs P ON D.Document_ID = P.Document_ID WHERE D.Document_Name = 'Customer reviews'
SELECT T1.Paragraph_Text FROM Paragraphs AS T1 INNER JOIN Documents AS T2 ON T1.Document_ID = T2.Document_ID WHERE T2.Document_Name = 'Customer reviews'
SELECT T2.Document_ID ,  COUNT(T1.Paragraph_ID) FROM Paragraphs AS T1 INNER JOIN Documents AS T2 ON T1.Document_ID = T2.Document_ID GROUP BY T2.Document_ID ORDER BY T2.Document_ID
SELECT Document_ID ,  COUNT(*) FROM Paragraphs GROUP BY Document_ID ORDER BY Document_ID
SELECT D.Document_ID, D.Document_Name, COUNT(P.Paragraph_ID) AS Number_of_Paragraphs FROM Documents D JOIN Paragraphs P ON D.Document_ID = P.Document_ID GROUP BY D.Document_ID, D.Document_Name
SELECT D.Document_ID, D.Document_Name, COUNT(P.Paragraph_ID) AS Paragraph_Count FROM Documents D LEFT JOIN Paragraphs P ON D.Document_ID = P.Document_ID GROUP BY D.Document_ID, D.Document_Name
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(*) >= 2
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(*) >= 2
SELECT T2.Document_ID, T2.Document_Name FROM Documents AS T2 JOIN Paragraphs AS T1 ON T1.Document_ID = T2.Document_ID GROUP BY T2.Document_ID, T2.Document_Name ORDER BY COUNT(T1.Paragraph_ID) DESC LIMIT 1
SELECT D.Document_ID, D.Document_Name FROM Documents AS D JOIN Paragraphs AS P ON D.Document_ID = P.Document_ID GROUP BY D.Document_ID, D.Document_Name ORDER BY COUNT(P.Paragraph_ID) DESC LIMIT 1
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT Document_ID FROM Documents WHERE Template_ID IN (SELECT Template_ID FROM Templates WHERE Template_Type_Code = 'PPT') GROUP BY Document_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(*) BETWEEN 1 AND 2
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(*) BETWEEN 1 AND 2
SELECT Document_ID FROM Paragraphs WHERE Paragraph_Text IN ('Brazil', 'Ireland')
SELECT Document_ID FROM Paragraphs WHERE Paragraph_Text = 'Brazil' INTERSECT SELECT Document_ID FROM Paragraphs WHERE Paragraph_Text = 'Ireland'
SELECT COUNT(*) FROM teacher
SELECT COUNT(*) FROM teacher
SELECT Name FROM teacher ORDER BY Age ASC
SELECT Name FROM teacher ORDER BY Age ASC
SELECT Age ,  Hometown FROM teacher
SELECT Name ,  Age ,  Hometown FROM teacher
SELECT Name FROM teacher WHERE Hometown != 'Little Lever Urban District'
SELECT Name FROM teacher WHERE Hometown != 'Little Lever Urban District'
SELECT Name FROM teacher WHERE Age = 32 OR Age = 33
SELECT Name FROM teacher WHERE Age = 32 OR Age = 33
SELECT Hometown FROM teacher ORDER BY Age ASC LIMIT 1
SELECT T2.Hometown FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID ORDER BY T2.Age ASC LIMIT 1
SELECT T2.Hometown ,  COUNT(T2.Teacher_ID) FROM course_arrange AS T1 INNER JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T2.Hometown
SELECT T2.Hometown ,  COUNT(T2.Teacher_ID) FROM course_arrange AS T1 INNER JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T2.Hometown
SELECT T2.Hometown FROM course_arrange AS T1 INNER JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T2.Hometown ORDER BY COUNT(*) DESC LIMIT 1
SELECT Hometown FROM teacher GROUP BY Hometown ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.Hometown FROM course_arrange AS T1 INNER JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T2.Hometown HAVING COUNT(T2.Hometown) >= 2
SELECT T2.Hometown FROM course_arrange AS T1 INNER JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T2.Hometown HAVING COUNT(*) >= 2
SELECT T2.Name, T3.Course FROM course_arrange AS T1 INNER JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID INNER JOIN course AS T3 ON T1.Course_ID = T3.Course_ID
SELECT T2.Name ,  T1.Course FROM course AS T1 INNER JOIN teacher AS T2 ON T1.Course_ID = T2.Teacher_ID
SELECT T2.Name ,  T1.Course FROM course AS T1 INNER JOIN teacher AS T2 ON T1.Course_ID = T2.Teacher_ID ORDER BY T2.Name ASC
SELECT T2.Name, T1.Course FROM course AS T1 INNER JOIN teacher AS T2 ON T1.Course_ID = T2.Teacher_ID ORDER BY T2.Name ASC
SELECT T2.Name FROM course AS T1 INNER JOIN teacher AS T2 ON T1.Course_ID = T2.Teacher_ID WHERE T1.Course = 'Math'
SELECT T2.Name FROM course AS T1 INNER JOIN teacher AS T2 ON T1.Course_ID = T2.Teacher_ID WHERE T1.Course = 'Math'
SELECT T2.Name ,  COUNT(*) FROM course_arrange AS T1 INNER JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T2.Name
SELECT T2.Name ,  COUNT(T1.Course_ID) FROM course_arrange AS T1 INNER JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T2.Name
SELECT T2.Name FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T2.Name HAVING COUNT(T1.Course_ID) >= 2
SELECT T2.Name FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T2.Name HAVING COUNT(T1.Course_ID) >= 2
SELECT Name FROM teacher WHERE Teacher_ID NOT IN (SELECT Teacher_ID FROM course_arrange)
SELECT Name FROM teacher WHERE Teacher_ID NOT IN (SELECT Teacher_ID FROM course_arrange)
SELECT COUNT(ID) FROM visitor WHERE Age < 30
SELECT Name FROM visitor WHERE Level_of_membership > 4 ORDER BY Level_of_membership DESC
SELECT AVG(Age) FROM visitor WHERE Level_of_membership <= 4
SELECT visitor.Name, visitor.Level_of_membership FROM visitor WHERE visitor.Level_of_membership > 4 ORDER BY visitor.Age DESC
SELECT Museum_ID, Name FROM museum ORDER BY Num_of_Staff DESC LIMIT 1
SELECT AVG(Num_of_Staff) FROM museum WHERE Open_Year < 2009
SELECT Open_Year ,  Num_of_Staff FROM museum WHERE Name = 'Plaza Museum'
SELECT Name FROM museum WHERE Num_of_Staff > (SELECT MIN(Num_of_Staff) FROM museum WHERE Open_Year > '2010')
SELECT T2.ID, T2.Name, T2.Age FROM visit AS T1 JOIN visitor AS T2 ON T1.visitor_ID = T2.ID GROUP BY T2.ID HAVING COUNT(T1.Museum_ID) > 1
SELECT T2.id, T2.Name, T2.Level_of_membership FROM visit AS T1 JOIN visitor AS T2 ON T1.visitor_ID = T2.ID GROUP BY T2.id ORDER BY SUM(T1.Total_spent) DESC LIMIT 1
SELECT T1.Museum_ID, T1.Name FROM museum AS T1 JOIN visit AS T2 ON T1.Museum_ID = T2.Museum_ID GROUP BY T1.Museum_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT Name FROM museum WHERE Museum_ID NOT IN (SELECT Museum_ID FROM visit)
SELECT T2.Name ,  T2.Age FROM visit AS T1 INNER JOIN visitor AS T2 ON T1.visitor_ID  =  T2.ID ORDER BY T1.Num_of_Ticket DESC LIMIT 1
SELECT AVG(Num_of_Ticket), MAX(Num_of_Ticket) FROM visit
SELECT SUM(Total_spent) FROM visit AS V JOIN visitor AS Vi ON V.visitor_ID = Vi.ID WHERE Vi.Level_of_membership = 1
SELECT T2.Name FROM visit AS T1 JOIN visitor AS T2 ON T1.visitor_ID = T2.ID WHERE T1.Museum_ID IN (SELECT Museum_ID FROM museum WHERE Open_Year < '2009') AND T1.Museum_ID IN (SELECT Museum_ID FROM museum WHERE Open_Year > '2011')
SELECT COUNT(*) FROM visitor WHERE ID NOT IN (SELECT visitor_ID FROM visit WHERE Museum_ID IN (SELECT Museum_ID FROM museum WHERE Open_Year > 2010))
SELECT COUNT(*) FROM museum WHERE Open_Year > 2013 OR Open_Year < 2008;
SELECT COUNT(*) FROM players;
SELECT COUNT(*) FROM players
SELECT COUNT(*) FROM matches
SELECT COUNT(*) FROM matches;
SELECT first_name, birth_date FROM players WHERE country_code = 'USA'
SELECT first_name, birth_date FROM players WHERE country_code = 'USA'
SELECT AVG(T1.loser_age), AVG(T1.winner_age) FROM matches AS T1
SELECT AVG(T2.loser_age), AVG(T2.winner_age) FROM players AS T1 INNER JOIN matches AS T2 ON T1.player_id = T2.loser_id OR T1.player_id = T2.winner_id
SELECT AVG(T2.winner_rank) FROM players AS T1 INNER JOIN matches AS T2 ON T1.player_id = T2.winner_id
SELECT AVG(winner_rank) FROM matches
SELECT MIN(loser_rank) FROM matches
SELECT MIN(loser_rank) FROM matches
SELECT COUNT(DISTINCT country_code) FROM players
SELECT COUNT(DISTINCT country_code) FROM players
SELECT COUNT(DISTINCT loser_name) FROM matches
SELECT COUNT(DISTINCT loser_name) FROM matches
SELECT t1.tourney_name FROM matches AS t1 GROUP BY t1.tourney_name HAVING COUNT(*) > 10
SELECT T1.tourney_name FROM matches AS T1 GROUP BY T1.tourney_name HAVING COUNT(*) > 10
SELECT DISTINCT T1.winner_name FROM matches AS T1 WHERE T1.year = 2013 INTERSECT SELECT DISTINCT T1.winner_name FROM matches AS T1 WHERE T1.year = 2016
SELECT DISTINCT winner_name FROM matches WHERE YEAR = 2013 INTERSECT SELECT DISTINCT winner_name FROM matches WHERE YEAR = 2016
SELECT COUNT(*) FROM matches WHERE YEAR IN (2013, 2016);
SELECT COUNT(*) FROM matches WHERE YEAR = 2013 OR YEAR = 2016
SELECT T1.country_code, T1.first_name FROM players AS T1 JOIN matches AS T2 ON T1.player_id = T2.winner_id WHERE T2.tourney_name IN ('WTA Championships', 'Australian Open') GROUP BY T1.player_id HAVING COUNT(DISTINCT T2.tourney_name) > 1
SELECT T1.first_name, T1.country_code FROM players AS T1 JOIN matches AS T2 ON T1.player_id = T2.winner_id WHERE T2.tourney_name IN ('WTA Championships', 'Australian Open') GROUP BY T1.player_id HAVING COUNT(DISTINCT T2.tourney_name) = 2
SELECT T1.first_name, T1.country_code FROM players AS T1 JOIN rankings AS T2 ON T1.player_id = T2.player_id WHERE T2.ranking_date = (SELECT MIN(ranking_date) FROM rankings) AND T2.player_id IN (SELECT winner_id FROM matches UNION SELECT loser_id FROM matches) ORDER BY T1.birth_date ASC LIMIT 1
SELECT T1.first_name, T1.country_code FROM players AS T1 JOIN rankings AS T2 ON T1.player_id = T2.player_id WHERE T2.ranking_date = (SELECT MIN(ranking_date) FROM rankings) AND T2.player_id = (SELECT player_id FROM players ORDER BY birth_date ASC LIMIT 1)
SELECT first_name, last_name FROM players ORDER BY birth_date;
SELECT first_name, last_name FROM players ORDER BY birth_date;
SELECT T1.first_name, T1.last_name FROM players AS T1 JOIN matches AS T2 ON T1.player_id = T2.loser_id WHERE T2.loser_hand = 'L' ORDER BY T1.birth_date
SELECT first_name, last_name FROM players WHERE hand = 'L' ORDER BY birth_date;
SELECT T1.first_name, T1.country_code FROM players AS T1 JOIN rankings AS T2 ON T1.player_id = T2.player_id GROUP BY T1.player_id ORDER BY SUM(T2.tours) DESC LIMIT 1
SELECT T1.first_name, T1.country_code FROM players AS T1 JOIN rankings AS T2 ON T1.player_id = T2.player_id GROUP BY T1.player_id ORDER BY COUNT(T2.tours) DESC LIMIT 1
SELECT YEAR FROM matches GROUP BY YEAR ORDER BY COUNT(*) DESC LIMIT 1
SELECT YEAR FROM matches GROUP BY YEAR ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.winner_name, T2.winner_rank_points FROM matches AS T1 INNER JOIN players AS T2 ON T1.winner_id = T2.player_id GROUP BY T2.winner_id ORDER BY COUNT(T1.match_num) DESC LIMIT 1
SELECT T2.winner_name ,  T1.ranking_points FROM rankings AS T1 INNER JOIN matches AS T2 ON T1.player_id = T2.winner_id GROUP BY T2.winner_id ORDER BY COUNT(T2.match_num) DESC LIMIT 1
SELECT T1.winner_name FROM matches AS T1 JOIN players AS T2 ON T1.winner_id = T2.player_id WHERE T1.tourney_name = 'Australian Open' ORDER BY T2.ranking_points DESC LIMIT 1
SELECT T1.first_name, T1.last_name FROM players AS T1 JOIN matches AS T2 ON T1.player_id = T2.winner_id WHERE T2.tourney_name = 'Australian Open' ORDER BY T1.ranking_points DESC LIMIT 1
SELECT T1.loser_name ,  T1.winner_name FROM matches AS T1 ORDER BY T1.minutes DESC LIMIT 1
SELECT T1.winner_name, T1.loser_name FROM matches AS T1 WHERE T1.minutes = (SELECT MAX(minutes) FROM matches);
SELECT p.player_id, p.first_name, AVG(r.ranking) AS avg_ranking FROM players p JOIN rankings r ON p.player_id = r.player_id GROUP BY p.player_id, p.first_name
SELECT p.first_name, AVG(r.ranking) FROM players AS p JOIN rankings AS r ON p.player_id = r.player_id GROUP BY p.player_id;
SELECT T2.player_id, T2.first_name, SUM(T1.ranking_points) AS total_ranking_points FROM rankings AS T1 INNER JOIN players AS T2 ON T1.player_id = T2.player_id GROUP BY T2.player_id, T2.first_name
SELECT T2.first_name, SUM(T1.ranking_points) FROM rankings AS T1 INNER JOIN players AS T2 ON T1.player_id = T2.player_id GROUP BY T2.first_name
SELECT COUNT(player_id), country_code FROM players GROUP BY country_code
SELECT country_code ,  COUNT(*) FROM players GROUP BY country_code
SELECT country_code FROM players GROUP BY country_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT country_code FROM players GROUP BY country_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT country_code FROM players GROUP BY country_code HAVING COUNT(player_id) > 50;
SELECT country_code FROM players GROUP BY country_code HAVING COUNT(player_id) > 50
SELECT ranking_date, SUM(tours) FROM rankings GROUP BY ranking_date
SELECT ranking_date, SUM(tours) FROM rankings GROUP BY ranking_date;
SELECT YEAR(tourney_date), COUNT(*) FROM matches GROUP BY YEAR(tourney_date);
SELECT YEAR, COUNT(*) FROM matches GROUP BY YEAR;
SELECT T2.first_name, T2.last_name, T1.ranking FROM rankings AS T1 JOIN players AS T2 ON T1.player_id = T2.player_id WHERE T1.tourneys > 0 ORDER BY T1.ranking_points DESC LIMIT 3
SELECT T2.first_name, T2.last_name, T1.ranking FROM rankings AS T1 INNER JOIN players AS T2 ON T1.player_id = T2.player_id WHERE T1.tourneys > 0 ORDER BY T2.birth_date DESC LIMIT 3
SELECT COUNT(DISTINCT T1.winner_id) FROM matches AS T1 JOIN players AS T2 ON T1.winner_id = T2.player_id WHERE T1.tourney_name = 'WTA Championships' AND T2.hand = 'L'
SELECT COUNT(T1.player_id) FROM players AS T1 JOIN matches AS T2 ON T1.player_id = T2.winner_id WHERE T1.hand = 'L' AND T2.tourney_name = 'WTA Championships'
SELECT T2.first_name, T2.country_code, T2.birth_date FROM matches AS T1 INNER JOIN players AS T2 ON T1.winner_id = T2.player_id ORDER BY T1.winner_rank_points DESC LIMIT 1
SELECT P.first_name, P.country_code, P.birth_date FROM players AS P JOIN matches AS M ON P.player_id = M.winner_id GROUP BY P.player_id ORDER BY SUM(M.winner_rank_points) DESC LIMIT 1
SELECT count(*) ,  hand FROM players GROUP BY hand
SELECT hand ,  COUNT(*) FROM players GROUP BY hand
SELECT COUNT(*) FROM ship WHERE disposition_of_ship = 'Captured';
SELECT T2.name ,  T2.tonnage FROM battle AS T1 INNER JOIN ship AS T2 ON T1.id = T2.lost_in_battle WHERE T2.disposition_of_ship = 'Captured' OR T2.disposition_of_ship = 'Wrecked' OR T2.disposition_of_ship = 'Scuttled' ORDER BY T2.name DESC
SELECT name ,  date ,  result FROM battle
SELECT MIN(killed), MAX(killed) FROM death
SELECT AVG(injured) FROM death
SELECT D.killed, D.injured FROM death AS D JOIN ship AS S ON D.caused_by_ship_id = S.id WHERE S.tonnage = 't'
SELECT T1.name, T1.result FROM battle AS T1 WHERE T1.bulgarian_commander != 'Boril'
SELECT DISTINCT T1.id, T1.name FROM battle AS T1 JOIN ship AS T2 ON T1.id = T2.lost_in_battle WHERE T2.ship_type = 'Brig'
SELECT T1.id, T1.name FROM battle AS T1 JOIN ship AS T2 ON T1.id = T2.lost_in_battle JOIN death AS T3 ON T2.id = T3.caused_by_ship_id WHERE T3.killed > 10 GROUP BY T1.id, T1.name
SELECT T1.id, T1.name FROM ship AS T1 JOIN death AS T2 ON T1.id = T2.caused_by_ship_id GROUP BY T1.id, T1.name ORDER BY SUM(T2.injured) DESC LIMIT 1
SELECT DISTINCT T1.name FROM battle AS T1 WHERE T1.bulgarian_commander = 'Kaloyan' AND T1.latin_commander = 'Baldwin I'
SELECT COUNT(DISTINCT result) FROM battle
SELECT COUNT(*) FROM battle WHERE id NOT IN (SELECT lost_in_battle FROM ship WHERE tonnage = 225)
SELECT T1.name, T1.date FROM battle AS T1 JOIN ship AS T2 ON T1.id = T2.lost_in_battle WHERE T2.name IN ('Lettice', 'HMS Atalanta')
SELECT T1.name, T1.result, T1.bulgarian_commander FROM battle AS T1 LEFT JOIN ship AS T2 ON T1.id = T2.lost_in_battle WHERE T2.id IS NULL
SELECT note FROM death WHERE note LIKE '%East%'
SELECT DISTINCT line_1, line_2 FROM Addresses
SELECT line_1 ,  line_2 FROM Addresses
SELECT COUNT(course_id) FROM Courses;
SELECT COUNT(course_id) FROM Courses;
SELECT course_description FROM Courses WHERE course_name = 'math'
SELECT course_description FROM Courses WHERE course_name = 'math'
SELECT zip_postcode FROM Addresses WHERE city = 'Port Chelsea'
SELECT zip_postcode FROM Addresses WHERE city = 'Port Chelsea'
SELECT D.department_name, D.department_id FROM Departments AS D JOIN Degree_Programs AS DP ON D.department_id = DP.department_id GROUP BY D.department_id ORDER BY COUNT(DP.degree_program_id) DESC LIMIT 1
SELECT T1.department_name ,  T1.department_id FROM Departments AS T1 INNER JOIN Degree_Programs AS T2 ON T1.department_id = T2.department_id GROUP BY T1.department_id ORDER BY COUNT(T2.degree_program_id) DESC LIMIT 1
SELECT COUNT(department_id) FROM Degree_Programs
SELECT COUNT(DISTINCT department_id) FROM Degree_Programs
SELECT COUNT(DISTINCT degree_summary_name) FROM Degree_Programs
SELECT COUNT(DISTINCT degree_summary_name) FROM Degree_Programs
SELECT COUNT(*) FROM Degree_Programs AS T1 JOIN Departments AS T2 ON T1.department_id = T2.department_id WHERE T2.department_name = 'engineering'
SELECT COUNT(*) FROM Degree_Programs AS DP JOIN Departments AS D ON DP.department_id = D.department_id WHERE D.department_name LIKE '%engineering%'
SELECT section_name ,  section_description FROM Sections;
SELECT section_name ,  section_description FROM Sections;
SELECT T1.course_name ,  T1.course_id FROM Courses AS T1 INNER JOIN Sections AS T2 ON T1.course_id = T2.course_id GROUP BY T1.course_id HAVING COUNT(T2.section_id) <= 2
SELECT T1.course_name ,  T1.course_id FROM Courses AS T1 JOIN Sections AS T2 ON T1.course_id = T2.course_id GROUP BY T1.course_id HAVING COUNT(T2.section_id) < 2
SELECT section_name FROM Sections ORDER BY section_name DESC;
SELECT section_name FROM Sections ORDER BY section_name DESC
SELECT T2.semester_name ,  T2.semester_id FROM Student_Enrolment AS T1 INNER JOIN Semesters AS T2 ON T1.semester_id = T2.semester_id GROUP BY T2.semester_name ORDER BY COUNT(T1.student_id) DESC LIMIT 1
SELECT T2.semester_name ,  T2.semester_id FROM Student_Enrolment AS T1 INNER JOIN Semesters AS T2 ON T1.semester_id = T2.semester_id GROUP BY T2.semester_id ORDER BY COUNT(T1.student_id) DESC LIMIT 1
SELECT department_description FROM Departments WHERE department_name LIKE '%computer%'
SELECT T.department_description FROM Departments AS T WHERE T.department_name LIKE '%computer%'
SELECT T1.first_name, T1.middle_name, T1.last_name, T1.student_id FROM Students AS T1 JOIN Student_Enrolment AS T2 ON T1.student_id = T2.student_id GROUP BY T1.student_id HAVING COUNT(DISTINCT T2.degree_program_id) = 2
SELECT T1.first_name, T1.middle_name, T1.last_name, T1.student_id FROM Students AS T1 JOIN Student_Enrolment AS T2 ON T1.student_id = T2.student_id GROUP BY T1.student_id HAVING COUNT(DISTINCT T2.degree_program_id) = 2
SELECT T1.first_name, T1.middle_name, T1.last_name FROM Students AS T1 INNER JOIN Student_Enrolment AS T2 ON T1.student_id = T2.student_id INNER JOIN Degree_Programs AS T3 ON T2.degree_program_id = T3.degree_program_id WHERE T3.degree_summary_name = 'Bachelor'
SELECT DISTINCT T3.first_name, T3.middle_name, T3.last_name FROM Student_Enrolment AS T1 INNER JOIN Degree_Programs AS T2 ON T1.degree_program_id = T2.degree_program_id INNER JOIN Students AS T3 ON T1.student_id = T3.student_id WHERE T2.degree_summary_name = 'Bachelor'
SELECT T1.degree_summary_name FROM Degree_Programs AS T1 INNER JOIN Student_Enrolment AS T2 ON T1.degree_program_id = T2.degree_program_id GROUP BY T1.degree_summary_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT T3.degree_summary_name FROM Student_Enrolment AS T1 INNER JOIN Degree_Programs AS T2 ON T1.degree_program_id = T2.degree_program_id INNER JOIN Degree_Programs AS T3 ON T2.department_id = T3.department_id GROUP BY T3.degree_summary_name ORDER BY COUNT(T1.student_id) DESC LIMIT 1
SELECT T2.degree_program_id, T2.degree_summary_name FROM Student_Enrolment AS T1 INNER JOIN Degree_Programs AS T2 ON T1.degree_program_id = T2.degree_program_id GROUP BY T2.degree_program_id, T2.degree_summary_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.degree_program_id, T1.degree_summary_name FROM Degree_Programs AS T1 JOIN Student_Enrolment AS T2 ON T1.degree_program_id = T2.degree_program_id GROUP BY T1.degree_program_id ORDER BY COUNT(T2.student_id) DESC LIMIT 1
SELECT T1.student_id, T1.first_name, T1.middle_name, T1.last_name, COUNT(T2.degree_program_id) AS num_enrollments FROM Students AS T1 INNER JOIN Student_Enrolment AS T2 ON T1.student_id = T2.student_id GROUP BY T1.student_id ORDER BY num_enrollments DESC LIMIT 1
SELECT T1.first_name, T1.middle_name, T1.last_name, T1.student_id, COUNT(T2.degree_program_id) AS num_enrollments FROM Students AS T1 JOIN Student_Enrolment AS T2 ON T1.student_id = T2.student_id GROUP BY T1.student_id ORDER BY num_enrollments DESC LIMIT 1
SELECT semester_name FROM Semesters WHERE semester_id NOT IN (SELECT semester_id FROM Student_Enrolment);
SELECT semester_name FROM semesters WHERE semester_id NOT IN (SELECT semester_id FROM student_enrolment)
SELECT DISTINCT T2.course_name FROM Student_Enrolment_Courses AS T1 INNER JOIN Courses AS T2 ON T1.course_id = T2.course_id
SELECT DISTINCT T1.course_name FROM Courses AS T1 INNER JOIN Student_Enrolment_Courses AS T2 ON T1.course_id = T2.course_id
SELECT T1.course_name FROM Courses AS T1 JOIN Student_Enrolment_Courses AS T2 ON T1.course_id = T2.course_id GROUP BY T1.course_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.course_name FROM Courses AS T1 JOIN Student_Enrolment_Courses AS T2 ON T1.course_id = T2.course_id GROUP BY T1.course_id ORDER BY COUNT(T2.student_course_id) DESC LIMIT 1
SELECT DISTINCT T1.last_name FROM Students AS T1 JOIN Addresses AS T2 ON T1.current_address_id = T2.address_id WHERE T2.state_province_county = 'North Carolina' AND T1.student_id NOT IN (SELECT student_id FROM Student_Enrolment)
SELECT DISTINCT T1.last_name FROM Students AS T1 INNER JOIN Addresses AS T2 ON T1.current_address_id = T2.address_id WHERE T2.state_province_county = 'North Carolina' AND T1.student_id NOT IN ( SELECT student_id FROM Student_Enrolment )
SELECT T2.transcript_date ,  T1.transcript_id FROM TRANSCRIPTS AS T1 INNER JOIN TRANSCRIPT_CONTENTS AS T2 ON T1.transcript_id = T2.transcript_id GROUP BY T1.transcript_id HAVING COUNT(T2.student_course_id) >= 2
SELECT T1.transcript_date ,  T1.transcript_id FROM TRANSCRIPTS AS T1 JOIN TRANSCRIPT_CONTENTS AS T2 ON T1.transcript_id = T2.transcript_id GROUP BY T1.transcript_id HAVING COUNT(T2.student_course_id) >= 2
SELECT cell_mobile_number FROM Students WHERE first_name = 'Timmothy' AND last_name = 'Ward'
SELECT cell_mobile_number FROM Students WHERE first_name = 'Timmothy' AND last_name = 'Ward';
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_first_registered ASC LIMIT 1
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_first_registered ASC LIMIT 1
SELECT T.first_name, T.middle_name, T.last_name FROM Students AS T WHERE T.date_left IS NOT NULL ORDER BY T.date_left ASC LIMIT 1
SELECT T1.first_name, T1.middle_name, T1.last_name FROM Students AS T1 JOIN Student_Enrolment AS T2 ON T1.student_id = T2.student_id WHERE T1.date_left IS NOT NULL ORDER BY T1.date_left ASC LIMIT 1
SELECT DISTINCT T1.first_name FROM Students AS T1 JOIN Addresses AS T2 ON T1.permanent_address_id = T2.address_id WHERE T1.current_address_id != T2.address_id
SELECT T1.first_name FROM Students AS T1 JOIN Addresses AS T2 ON T1.permanent_address_id = T2.address_id WHERE T2.address_id <> T1.current_address_id
SELECT T2.address_id, T2.line_1, T2.line_2, T2.line_3 FROM Students AS T1 INNER JOIN Addresses AS T2 ON T1.current_address_id = T2.address_id GROUP BY T2.address_id ORDER BY COUNT(T1.student_id) DESC LIMIT 1
SELECT T1.address_id, T1.line_1, T1.line_2 FROM Addresses AS T1 JOIN Students AS T2 ON T1.address_id = T2.current_address_id GROUP BY T1.address_id ORDER BY COUNT(T2.student_id) DESC LIMIT 1
SELECT AVG(transcript_date) FROM TRANSCRIPTS
SELECT AVG(transcript_date) FROM TRANSCRIPTS
SELECT transcript_date ,  other_details FROM TRANSCRIPTS ORDER BY transcript_date ASC LIMIT 1
SELECT MIN(transcript_date), other_details FROM TRANSCRIPTS
SELECT COUNT(transcript_id) FROM Transcripts
SELECT COUNT(transcript_id) FROM Transcripts
SELECT transcript_date FROM TRANSCRIPTS ORDER BY transcript_date DESC LIMIT 1
SELECT transcript_date FROM TRANSCRIPTS ORDER BY transcript_date DESC LIMIT 1
SELECT student_enrolment_id, COUNT(DISTINCT transcript_id) AS max_transcript_count FROM Student_Enrolment_Courses GROUP BY student_enrolment_id ORDER BY max_transcript_count DESC LIMIT 1
SELECT T2.course_id, COUNT(DISTINCT T1.transcript_id) AS max_transcripts FROM Transcripts AS T1 INNER JOIN Transcript_Contents AS T2 ON T1.transcript_id = T2.transcript_id GROUP BY T2.course_id ORDER BY max_transcripts DESC LIMIT 1
SELECT T2.transcript_date, T2.transcript_id FROM Student_Enrolment AS T1 INNER JOIN Transcripts AS T2 ON T1.student_enrolment_id = T2.transcript_id GROUP BY T2.transcript_id ORDER BY COUNT(*) ASC LIMIT 1
SELECT transcript_date, transcript_id FROM TRANSCRIPTS WHERE transcript_id IN (SELECT transcript_id FROM transcript_contents GROUP BY transcript_id ORDER BY COUNT(*) ASC LIMIT 1)
SELECT T2.semester_name FROM Student_Enrolment AS T1 INNER JOIN Semesters AS T2 ON T1.semester_id = T2.semester_id WHERE T1.degree_program_id IN ( SELECT degree_program_id FROM Degree_Programs WHERE degree_summary_name = 'Master' ) AND T1.degree_program_id IN ( SELECT degree_program_id FROM Degree_Programs WHERE degree_summary_name = 'Bachelor' ) GROUP BY T2.semester_id HAVING COUNT(DISTINCT T1.student_id) > 0
SELECT semester_id FROM Student_Enrolment WHERE degree_program_id IN (1, 4) GROUP BY semester_id HAVING COUNT(DISTINCT student_id) > 1
SELECT COUNT(DISTINCT current_address_id) FROM Students WHERE current_address_id IS NOT NULL;
SELECT DISTINCT current_address_id FROM Students
SELECT first_name , middle_name , last_name FROM Students ORDER BY last_name DESC
SELECT other_student_details FROM Students ORDER BY last_name DESC
SELECT T1.section_name FROM Sections AS T1 WHERE T1.section_name = 'h'
SELECT T1.section_description FROM Sections AS T1 WHERE T1.section_name = 'h'
SELECT DISTINCT T1.first_name FROM Students AS T1 JOIN Addresses AS T2 ON T1.permanent_address_id = T2.address_id WHERE T2.country = 'Haiti' OR T1.cell_mobile_number = '09700166582'
SELECT DISTINCT T1.first_name FROM Students AS T1 JOIN Addresses AS T2 ON T1.permanent_address_id = T2.address_id WHERE T2.country = 'Haiti' OR T1.cell_mobile_number = '09700166582'
SELECT Title FROM Cartoon ORDER BY Title ASC
SELECT Title FROM Cartoon ORDER BY Title ASC
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones'
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones'
SELECT COUNT(id) FROM Cartoon WHERE Written_by = 'Joseph Kuhr'
SELECT COUNT(id) FROM Cartoon WHERE Written_by = 'Joseph Kuhr'
SELECT T.Title, T.Directed_by FROM Cartoon AS T ORDER BY T.Original_air_date
SELECT T.Title, T.Directed_by FROM Cartoon AS T ORDER BY T.Original_air_date
SELECT Title FROM Cartoon WHERE Directed_by IN ('Ben Jones', 'Brandon Vietti')
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones' OR Directed_by = 'Brandon Vietti'
SELECT Country ,  COUNT(id) FROM TV_Channel GROUP BY Country ORDER BY COUNT(id) DESC LIMIT 1
SELECT Country, COUNT(*) FROM TV_Channel GROUP BY Country ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(DISTINCT series_name), COUNT(DISTINCT Content) FROM TV_Channel
SELECT COUNT(DISTINCT series_name), COUNT(DISTINCT Content) FROM TV_Channel
SELECT Content FROM TV_Channel WHERE series_name = 'Sky Radio'
SELECT Content FROM TV_Channel WHERE series_name = 'Sky Radio'
SELECT Package_Option FROM TV_Channel WHERE series_name = 'Sky Radio'
SELECT T2.Package_Option FROM TV_Channel AS T1 INNER JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T1.series_name = 'Sky Radio'
SELECT COUNT(id) FROM TV_Channel WHERE Language = 'English'
SELECT COUNT(id) FROM TV_Channel WHERE Language = 'English'
SELECT Language ,  COUNT(*) FROM TV_Channel GROUP BY Language ORDER BY COUNT(*) ASC LIMIT 1
SELECT Language ,  COUNT(*) FROM TV_Channel WHERE Language IS NOT NULL GROUP BY Language ORDER BY COUNT(*) ASC LIMIT 1
SELECT Language ,  COUNT(*) FROM TV_Channel GROUP BY Language
SELECT Language ,  COUNT(*) FROM TV_Channel GROUP BY Language
SELECT T1.series_name FROM TV_Channel AS T1 INNER JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Title = 'The Rise of the Blue Beetle!'
SELECT T2.series_name FROM Cartoon AS T1 INNER JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T1.Title = 'The Rise of the Blue Beetle!'
SELECT T2.Title FROM TV_Channel AS T1 INNER JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T1.series_name = 'Sky Radio'
SELECT Title FROM Cartoon AS T1 INNER JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T2.series_name = 'Sky Radio'
SELECT T1.Episode FROM TV_series AS T1 ORDER BY T1.Rating DESC
SELECT Episode FROM TV_series ORDER BY Rating DESC
SELECT T2.Episode, T2.Rating FROM TV_Channel AS T1 INNER JOIN TV_series AS T2 ON T1.id = T2.Channel ORDER BY T2.Rating DESC LIMIT 3
SELECT Episode, Rating FROM TV_series ORDER BY Rating DESC LIMIT 3
SELECT MIN(Share), MAX(Share) FROM TV_series
SELECT max(Share), min(Share) FROM TV_series
SELECT Air_Date FROM TV_series WHERE Episode = 'A Love of a Lifetime'
SELECT T2.Air_Date FROM TV_Channel AS T1 INNER JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T2.Episode = 'A Love of a Lifetime'
SELECT Weekly_Rank FROM TV_series WHERE Episode = 'A Love of a Lifetime'
SELECT Weekly_Rank FROM TV_series WHERE Episode = 'A Love of a Lifetime'
SELECT T1.series_name FROM TV_Channel AS T1 INNER JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T2.Episode = 'A Love of a Lifetime'
SELECT T1.series_name FROM TV_Channel AS T1 INNER JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T2.Episode = 'A Love of a Lifetime'
SELECT T2.Episode FROM TV_Channel AS T1 INNER JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T1.series_name = 'Sky Radio'
SELECT Episode FROM TV_series WHERE Channel = (SELECT id FROM TV_Channel WHERE series_name = 'Sky Radio')
SELECT T2.directed_by ,  COUNT(T2.id) FROM TV_Channel AS T1 INNER JOIN Cartoon AS T2 ON T1.id = T2.Channel GROUP BY T2.directed_by
SELECT Directed_by ,  COUNT(*) FROM Cartoon GROUP BY Directed_by
SELECT Production_code, Channel FROM Cartoon ORDER BY Original_air_date DESC LIMIT 1
SELECT T1.id, T1.production_code FROM Cartoon AS T1 JOIN TV_Channel AS T2 ON T1.Channel = T2.id ORDER BY T1.original_air_date DESC LIMIT 1
SELECT T1.Package_Option, T1.series_name FROM TV_Channel AS T1 INNER JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T1.Hight_definition_TV = 'yes'
SELECT Package_Option, series_name FROM TV_Channel AS T1 INNER JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE Hight_definition_TV = 'yes'
SELECT DISTINCT T1.Country FROM TV_Channel AS T1 INNER JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Written_by = 'Todd Casey'
SELECT DISTINCT T1.Country FROM TV_Channel AS T1 INNER JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Written_by = 'Todd Casey'
SELECT Country FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Written_by = 'Todd Casey')
SELECT Country FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Written_by = 'Todd Casey')
SELECT T1.series_name, T1.Country FROM TV_Channel AS T1 INNER JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.directed_by IN ('Ben Jones', 'Michael Chang') AND T2.written_by IN ('Michael Jelenic', 'Joseph Kuhr') GROUP BY T1.series_name, T1.Country
SELECT T1.series_name, T1.Country FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.directed_by IN ('Ben Jones', 'Michael Chang') AND T2.Title IN (( SELECT Title FROM Cartoon WHERE directed_by = 'Ben Jones' ), ( SELECT Title FROM Cartoon WHERE directed_by = 'Michael Chang' ))
SELECT Pixel_aspect_ratio_PAR, Country FROM TV_Channel WHERE Language != 'English'
SELECT Pixel_aspect_ratio_PAR, Country FROM TV_Channel WHERE Language != 'English'
SELECT T1.id FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel GROUP BY T1.Country HAVING COUNT(T1.id) > 2
SELECT id FROM TV_Channel GROUP BY id HAVING COUNT(*) > 2
SELECT id FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones')
SELECT id FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones')
SELECT Package_Option FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones')
SELECT Package_Option FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones')
SELECT COUNT(*) FROM poker_player
SELECT COUNT(*) FROM poker_player;
SELECT Earnings FROM poker_player ORDER BY Earnings DESC
SELECT Earnings FROM poker_player ORDER BY Earnings DESC
SELECT Final_Table_Made, Best_Finish FROM poker_player;
SELECT Final_Table_Made, Best_Finish FROM poker_player
SELECT AVG(Earnings) FROM poker_player
SELECT AVG(Earnings) FROM poker_player
SELECT Money_Rank FROM poker_player WHERE Earnings = (SELECT MAX(Earnings) FROM poker_player)
SELECT Money_Rank FROM poker_player ORDER BY Earnings DESC LIMIT 1
SELECT MAX(Final_Table_Made) FROM poker_player WHERE Earnings < 200000
SELECT MAX(Final_Table_Made) FROM poker_player WHERE Earnings < 200000
SELECT Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID
SELECT T2.Name FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID
SELECT T2.Name FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID WHERE T1.Earnings > 300000
SELECT T1.Name FROM people AS T1 INNER JOIN poker_player AS T2 ON T1.People_ID = T2.People_ID WHERE T2.Earnings > 300000
SELECT T2.Name FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Final_Table_Made ASC
SELECT T2.Name FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Final_Table_Made ASC
SELECT T2.Birth_Date FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Earnings ASC LIMIT 1
SELECT T2.Birth_Date FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Earnings ASC LIMIT 1
SELECT T1.Money_Rank FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID WHERE T2.Height IS NOT NULL ORDER BY T2.Height DESC LIMIT 1
SELECT T1.Money_Rank FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T2.Height DESC LIMIT 1
SELECT AVG(T1.Earnings) FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID WHERE T2.Height > 200
SELECT AVG(T1.Earnings) FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID WHERE T2.Height > 200
SELECT T2.Name FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Earnings DESC
SELECT T2.Name FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Earnings DESC
SELECT Nationality ,  COUNT(*) FROM people GROUP BY Nationality
SELECT Nationality ,  COUNT(*) FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID GROUP BY Nationality
SELECT Nationality FROM people GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT Nationality FROM people GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT Nationality FROM people GROUP BY Nationality HAVING COUNT(*) >= 2
SELECT Nationality FROM people GROUP BY Nationality HAVING COUNT(*) >= 2
SELECT Name, Birth_Date FROM people ORDER BY Name ASC
SELECT T2.Name, T2.Birth_Date FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T2.Name ASC
SELECT Name FROM people WHERE Nationality != 'Russia'
SELECT Name FROM people WHERE Nationality != 'Russia'
SELECT Name FROM people WHERE People_ID NOT IN (SELECT People_ID FROM poker_player)
SELECT Name FROM people WHERE People_ID NOT IN (SELECT People_ID FROM poker_player)
SELECT COUNT(DISTINCT Nationality) FROM people
SELECT COUNT(DISTINCT Nationality) FROM people
SELECT COUNT(DISTINCT state) FROM VOTES
SELECT T2.contestant_number ,  T2.contestant_name FROM CONTESTANTS AS T2 ORDER BY T2.contestant_name DESC
SELECT vote_id, phone_number, state FROM VOTES;
SELECT MAX(area_code), MIN(area_code) FROM AREA_CODE_STATE
SELECT created FROM VOTES WHERE state = 'CA' ORDER BY created DESC LIMIT 1
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name != 'Jessie Alloway'
SELECT DISTINCT state , created FROM VOTES;
SELECT C.contestant_number, C.contestant_name FROM CONTESTANTS AS C JOIN VOTES AS V ON C.contestant_number = V.contestant_number GROUP BY C.contestant_number HAVING COUNT(V.vote_id) >= 2
SELECT T2.contestant_number, T2.contestant_name FROM VOTES AS T1 INNER JOIN CONTESTANTS AS T2 ON T1.contestant_number = T2.contestant_number GROUP BY T1.contestant_number ORDER BY COUNT(*) ASC LIMIT 1
SELECT COUNT(*) FROM VOTES WHERE state IN ('NY', 'CA')
SELECT COUNT(*) FROM CONTESTANTS WHERE contestant_number NOT IN (SELECT contestant_number FROM VOTES);
SELECT T1.area_code FROM AREA_CODE_STATE AS T1 INNER JOIN VOTES AS T2 ON T1.state = T2.state GROUP BY T1.area_code ORDER BY COUNT(T2.vote_id) DESC LIMIT 1
SELECT V.created, V.state, V.phone_number FROM VOTES AS V JOIN CONTESTANTS AS C ON V.contestant_number = C.contestant_number WHERE C.contestant_name = 'Tabatha Gehling'
SELECT DISTINCT T1.area_code FROM AREA_CODE_STATE AS T1 JOIN VOTES AS T2 ON T1.state = T2.state JOIN CONTESTANTS AS T3 ON T2.contestant_number = T3.contestant_number WHERE T3.contestant_name = 'Tabatha Gehling' INTERSECT SELECT DISTINCT T1.area_code FROM AREA_CODE_STATE AS T1 JOIN VOTES AS T2 ON T1.state = T2.state JOIN CONTESTANTS AS T3 ON T2.contestant_number = T3.contestant_number WHERE T3.contestant_name = 'Kelly Clauss'
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name LIKE '%Al%'
SELECT Name FROM country WHERE IndepYear > 1950;
SELECT Name FROM country WHERE IndepYear > 1950
SELECT COUNT(Code) FROM country WHERE GovernmentForm = 'Republic'
SELECT COUNT(Code) FROM country WHERE GovernmentForm = 'Republic'
SELECT SUM(SurfaceArea) FROM country WHERE Region = 'Caribbean'
SELECT SUM(SurfaceArea) FROM country WHERE Region = 'Caribbean'
SELECT T1.Continent FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.Name = 'Anguilla'
SELECT T1.Continent FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.Name = 'Anguilla'
SELECT T2.Region FROM city AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T1.Name = 'Kabul'
SELECT T1.Region FROM country AS T1 JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T2.Name = 'Kabul'
SELECT Language FROM countrylanguage WHERE CountryCode = 'ABW' ORDER BY Percentage DESC LIMIT 1
SELECT Language FROM countrylanguage WHERE CountryCode = 'ABW' AND IsOfficial = 'T' ORDER BY Percentage DESC LIMIT 1
SELECT T1.Population, T1.LifeExpectancy FROM country AS T1 WHERE T1.Name = 'Brazil'
SELECT Population, LifeExpectancy FROM country WHERE Name = 'Brazil'
SELECT Region, Population FROM country WHERE Name = 'Angola'
SELECT T1.Region, T1.Population FROM country AS T1 WHERE T1.Name = 'Angola'
SELECT AVG(LifeExpectancy) FROM country WHERE Region = 'Central Africa'
SELECT AVG(LifeExpectancy) FROM country WHERE Region = 'Central Africa'
SELECT T1.Name FROM country AS T1 WHERE T1.Continent = 'Asia' ORDER BY T1.LifeExpectancy ASC LIMIT 1
SELECT Name FROM country WHERE Continent = 'Asia' ORDER BY LifeExpectancy ASC LIMIT 1
SELECT SUM(T2.Population), MAX(T2.GNP) FROM country AS T1 INNER JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T1.Continent = 'Asia'
SELECT SUM(T2.Population), MAX(T1.GNP) FROM country AS T1 INNER JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T1.Continent = 'Asia'
SELECT AVG(T1.LifeExpectancy) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.Continent = 'Africa' AND T1.GovernmentForm = 'Republic'
SELECT AVG(T1.LifeExpectancy) FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.Continent = 'Africa' AND T1.GovernmentForm = 'Republic'
SELECT SUM(SurfaceArea) FROM country WHERE Continent IN ('Asia', 'Europe')
SELECT SUM(SurfaceArea) FROM country WHERE Continent IN ('Asia', 'Europe')
SELECT Population FROM city WHERE District = 'Gelderland'
SELECT SUM(Population) FROM city WHERE District = 'Gelderland'
SELECT AVG(T1.GNP), SUM(T1.Population) FROM country AS T1 WHERE T1.GovernmentForm = 'US Territory'
SELECT AVG(T1.GNP), SUM(T1.Population) FROM country AS T1 WHERE T1.Name LIKE '%US%'
SELECT COUNT(DISTINCT Language) FROM countrylanguage
SELECT COUNT(DISTINCT Language) FROM countrylanguage
SELECT COUNT(DISTINCT GovernmentForm) FROM country WHERE Continent = 'Africa'
SELECT COUNT(DISTINCT GovernmentForm) FROM country WHERE Continent = 'Africa'
SELECT COUNT(Language) FROM countrylanguage WHERE CountryCode = 'ABW'
SELECT COUNT(Language) FROM countrylanguage WHERE CountryCode = (SELECT Code FROM country WHERE Name = 'Aruba')
SELECT COUNT(*) FROM countrylanguage WHERE CountryCode = 'AFG' AND IsOfficial = 'T'
SELECT COUNT(Language) FROM countrylanguage WHERE CountryCode = 'AFG' AND IsOfficial = 'T'
SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode GROUP BY T1.Name ORDER BY COUNT(T2.Language) DESC LIMIT 1
SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode GROUP BY T1.Name ORDER BY COUNT(T2.Language) DESC LIMIT 1
SELECT T2.Continent FROM countrylanguage AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code GROUP BY T2.Continent ORDER BY COUNT(DISTINCT T1.Language) DESC LIMIT 1
SELECT T2.Continent FROM countrylanguage AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code GROUP BY T2.Continent ORDER BY COUNT(DISTINCT T1.Language) DESC LIMIT 1
SELECT COUNT(*) FROM countrylanguage WHERE Language = 'English' AND CountryCode IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'Dutch')
SELECT COUNT(*) FROM countrylanguage WHERE Language IN ('English', 'Dutch') AND IsOfficial = 'T'
SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'English' AND T2.IsOfficial = 'T' INTERSECT SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'French' AND T2.IsOfficial = 'T'
SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'English' AND T2.IsOfficial = 'T' INTERSECT SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'French' AND T2.IsOfficial = 'T'
SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'English' AND T2.IsOfficial = 'T' INTERSECT SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'French' AND T2.IsOfficial = 'T'
SELECT T1.Name FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'English' AND T2.IsOfficial = 'T' INTERSECT SELECT T1.Name FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'French' AND T2.IsOfficial = 'T'
SELECT COUNT(DISTINCT T1.Continent) FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'Chinese'
SELECT COUNT(DISTINCT T1.Continent) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'Chinese'
SELECT DISTINCT T1.Region FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language IN ('English', 'Dutch')
SELECT DISTINCT T1.Region FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'Dutch' OR T2.Language = 'English'
SELECT T1.Name FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language IN ('English', 'Dutch') AND T2.IsOfficial = 'T'
SELECT T1.Name FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language IN ('English', 'Dutch') AND T2.IsOfficial = 'T'
SELECT Language FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE Continent = 'Asia' GROUP BY Language ORDER BY SUM(Percentage) DESC LIMIT 1
SELECT Language FROM countrylanguage WHERE CountryCode IN (SELECT Code FROM country WHERE Continent = 'Asia') GROUP BY Language ORDER BY COUNT(*) DESC LIMIT 1
SELECT Language FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE GovernmentForm = 'Republic' GROUP BY Language HAVING COUNT(*) = 1
SELECT T2.Language FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.GovernmentForm = 'Republic' GROUP BY T2.Language HAVING COUNT(T2.CountryCode) = 1
SELECT T1.Name FROM city AS T1 INNER JOIN countrylanguage AS T2 ON T1.CountryCode = T2.CountryCode WHERE T2.Language = 'English' ORDER BY T1.Population DESC LIMIT 1
SELECT T1.Name FROM city AS T1 JOIN countrylanguage AS T2 ON T1.CountryCode = T2.CountryCode WHERE T2.Language = 'English' ORDER BY T1.Population DESC LIMIT 1
SELECT Name, Population, LifeExpectancy FROM country WHERE Continent = 'Asia' ORDER BY SurfaceArea DESC LIMIT 1
SELECT Name, Population, LifeExpectancy FROM country WHERE Continent = 'Asia' ORDER BY SurfaceArea DESC LIMIT 1
SELECT AVG(T1.LifeExpectancy) FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language != 'English' AND T2.IsOfficial = 'F'
SELECT AVG(T1.LifeExpectancy) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language != 'English' AND T2.IsOfficial = 'F'
SELECT SUM(Population) FROM city WHERE CountryCode NOT IN (SELECT Code FROM countrylanguage WHERE Language = 'English')
SELECT SUM(Population) FROM city WHERE CountryCode NOT IN ( SELECT Code FROM countrylanguage WHERE Language = 'English' )
SELECT T1.Language FROM countrylanguage AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T2.HeadOfState = 'Beatrix' AND T1.IsOfficial = 'T'
SELECT T2.Language FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.HeadOfState = 'Beatrix' AND T2.IsOfficial = 'T'
SELECT COUNT(DISTINCT Language) FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE IndepYear < 1930 AND IsOfficial = 'T'
SELECT COUNT(DISTINCT T2.Language) FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.IndependenceYear < 1930
SELECT Name FROM country WHERE SurfaceArea > (SELECT MAX(SurfaceArea) FROM country WHERE Continent = 'Europe')
SELECT Name FROM country WHERE SurfaceArea > (SELECT MAX(SurfaceArea) FROM country WHERE Continent = 'Europe')
SELECT Name FROM country WHERE Continent = 'Africa' AND Population < (SELECT MIN(Population) FROM country WHERE Continent = 'Asia')
SELECT Code FROM country WHERE Continent = 'Africa' AND Population < (SELECT MIN(Population) FROM country WHERE Continent = 'Asia')
SELECT Name FROM country WHERE Continent = 'Asia' AND Population > (SELECT MAX(Population) FROM country WHERE Continent = 'Africa')
SELECT Name FROM country WHERE Continent = 'Asia' AND Population > (SELECT MAX(Population) FROM country WHERE Continent = 'Africa')
SELECT CountryCode FROM countrylanguage WHERE Language != 'English'
SELECT CountryCode FROM countrylanguage WHERE Language != 'English'
SELECT CountryCode FROM countrylanguage WHERE Language != 'English'
SELECT CountryCode FROM countrylanguage WHERE Language != 'English'
SELECT Code FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English') AND GovernmentForm != 'Republic'
SELECT Code FROM country WHERE GovernmentForm != 'Republic' AND Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English')
SELECT T1.Name FROM city AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T2.Continent = 'Europe' AND T1.Name NOT IN (SELECT T3.Name FROM city AS T3 JOIN country AS T4 ON T3.CountryCode = T4.Code JOIN countrylanguage AS T5 ON T4.Code = T5.CountryCode WHERE T5.Language = 'English' AND T5.IsOfficial = 'T')
SELECT T1.Name FROM city AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T2.Continent = 'Europe' AND T1.Name NOT IN (SELECT T3.Name FROM city AS T3 JOIN country AS T4 ON T3.CountryCode = T4.Code JOIN countrylanguage AS T5 ON T4.Code = T5.CountryCode WHERE T5.Language = 'English' AND T5.IsOfficial = 'T')
SELECT DISTINCT T1.Name FROM city AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code INNER JOIN countrylanguage AS T3 ON T2.Code = T3.CountryCode WHERE T2.Continent = 'Asia' AND T3.Language = 'Chinese' AND T3.IsOfficial = 'T'
SELECT DISTINCT T1.Name FROM city AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code INNER JOIN countrylanguage AS T3 ON T2.Code = T3.CountryCode WHERE T2.Continent = 'Asia' AND T3.Language = 'Chinese' AND T3.IsOfficial = 'T'
SELECT Name, IndepYear, SurfaceArea FROM country ORDER BY Population ASC LIMIT 1
SELECT Name, IndepYear, SurfaceArea FROM country ORDER BY Population ASC LIMIT 1
SELECT T2.Population, T2.Name, T2.HeadOfState FROM country AS T1 INNER JOIN city AS T2 ON T1.Code = T2.CountryCode ORDER BY T1.SurfaceArea DESC LIMIT 1
SELECT Name, Population, HeadOfState FROM country WHERE SurfaceArea = (SELECT MAX(SurfaceArea) FROM country)
SELECT T1.Name ,  COUNT(T2.Language) FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode GROUP BY T1.Name HAVING COUNT(T2.Language) >= 3
SELECT T1.Name, COUNT(T2.Language) AS LanguageCount FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode GROUP BY T1.Name HAVING LanguageCount > 2
SELECT District, COUNT(*) FROM city WHERE Population > (SELECT AVG(Population) FROM city) GROUP BY District;
SELECT District ,  COUNT(*) FROM city WHERE Population > ( SELECT AVG(Population) FROM city ) GROUP BY District
SELECT T1.GovernmentForm, SUM(T1.Population) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode GROUP BY T1.GovernmentForm HAVING AVG(T1.LifeExpectancy) > 72
SELECT T1.GovernmentForm, SUM(T1.Population) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.LifeExpectancy > 72 GROUP BY T1.GovernmentForm
SELECT T1.Continent, AVG(T1.LifeExpectancy) AS AvgLifeExpectancy, SUM(T1.Population) AS TotalPopulation FROM country AS T1 GROUP BY T1.Continent HAVING AVG(T1.LifeExpectancy) < 72
SELECT T1.Continent, SUM(T1.Population) AS TotalPopulation, AVG(T1.LifeExpectancy) AS AverageLifeExpectancy FROM country AS T1 GROUP BY T1.Continent HAVING AVG(T1.LifeExpectancy) < 72
SELECT Name, SurfaceArea FROM country ORDER BY SurfaceArea DESC LIMIT 5
SELECT Name, SurfaceArea FROM country ORDER BY SurfaceArea DESC LIMIT 5
SELECT Name FROM country ORDER BY Population DESC LIMIT 3
SELECT Name FROM country ORDER BY Population DESC LIMIT 3
SELECT Name FROM country ORDER BY Population ASC LIMIT 3
SELECT Name FROM country ORDER BY Population ASC LIMIT 3
SELECT COUNT(*) FROM country WHERE Continent = 'Asia'
SELECT COUNT(*) FROM country WHERE Continent = 'Asia'
SELECT Name FROM country WHERE Continent = 'Europe' AND Population > 80000
SELECT Name FROM country WHERE Continent = 'Europe' AND Population = 80000
SELECT SUM(Population), AVG(SurfaceArea) FROM country WHERE Continent = 'North America' AND SurfaceArea > 3000
SELECT SUM(Population), AVG(SurfaceArea) FROM country WHERE Continent = 'North America' AND SurfaceArea > 3000
SELECT ID FROM city WHERE Population BETWEEN 160000 AND 900000
SELECT Name FROM city WHERE Population BETWEEN 160000 AND 900000
SELECT Language FROM countrylanguage GROUP BY Language ORDER BY COUNT(*) DESC LIMIT 1
SELECT Language FROM countrylanguage GROUP BY Language ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.Name, T3.Language FROM country AS T2 INNER JOIN countrylanguage AS T3 ON T2.Code = T3.CountryCode WHERE T3.IsOfficial = 'T' ORDER BY T3.Percentage DESC LIMIT 1
SELECT T1.Code, T2.Language FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Percentage = (SELECT MAX(Percentage) FROM countrylanguage WHERE CountryCode = T1.Code)
SELECT COUNT(*) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'Spanish' AND T2.Percentage = ( SELECT MAX(Percentage) FROM countrylanguage WHERE Language = 'Spanish' )
SELECT COUNT(*) FROM countrylanguage WHERE Language = 'Spanish' AND Percentage >= 50;
SELECT CountryCode FROM countrylanguage WHERE Language = 'Spanish' ORDER BY Percentage DESC LIMIT 1
SELECT CountryCode FROM countrylanguage WHERE Language = 'Spanish' AND Percentage > 50;
SELECT COUNT(*) FROM conductor
SELECT COUNT(*) FROM conductor
SELECT Name FROM conductor ORDER BY Age ASC
SELECT Name FROM conductor ORDER BY Age;
SELECT Name FROM conductor WHERE Nationality != 'USA'
SELECT Name FROM conductor WHERE Nationality != 'USA'
SELECT Record_Company FROM orchestra ORDER BY Year_of_Founded DESC
SELECT Record_Company FROM orchestra ORDER BY Year_of_Founded DESC
SELECT AVG(Attendance) FROM show
SELECT AVG(Attendance) FROM show
SELECT max(T2.Share), min(T2.Share) FROM orchestra AS T1 INNER JOIN performance AS T2 ON T1.Orchestra_ID = T2.Orchestra_ID WHERE T2.Type != 'Live final'
SELECT max(T1.Share), min(T1.Share) FROM performance AS T1 WHERE T1.Type != 'Live final'
SELECT COUNT(DISTINCT Nationality) FROM conductor
SELECT COUNT(DISTINCT Nationality) FROM conductor
SELECT Name FROM conductor ORDER BY Year_of_Work DESC
SELECT Name FROM conductor ORDER BY Year_of_Work DESC
SELECT Name FROM conductor ORDER BY Year_of_Work DESC LIMIT 1
SELECT T1.Name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID GROUP BY T1.Conductor_ID ORDER BY SUM(T2.Year_of_Founded - T1.Year_of_Work) DESC LIMIT 1
SELECT T2.Name, T1.Orchestra FROM orchestra AS T1 INNER JOIN conductor AS T2 ON T1.Conductor_ID = T2.Conductor_ID
SELECT T2.Name ,  T1.Orchestra FROM orchestra AS T1 INNER JOIN conductor AS T2 ON T1.Conductor_ID = T2.Conductor_ID
SELECT T1.Name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID GROUP BY T1.Name HAVING COUNT(T2.Orchestra_ID) > 1
SELECT T1.Name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID GROUP BY T1.Conductor_ID HAVING COUNT(T2.Orchestra_ID) > 1
SELECT T1.Name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID GROUP BY T1.Name ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.Name FROM orchestra AS T1 JOIN conductor AS T2 ON T1.Conductor_ID = T2.Conductor_ID GROUP BY T1.Conductor_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.Name FROM orchestra AS T1 INNER JOIN conductor AS T2 ON T1.Conductor_ID = T2.Conductor_ID WHERE T1.Year_of_Founded > 2008
SELECT T1.Name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID WHERE T2.Year_of_Founded > 2008
SELECT Record_Company ,  COUNT(*) FROM orchestra GROUP BY Record_Company
SELECT Record_Company ,  COUNT(*) FROM orchestra GROUP BY Record_Company
SELECT Major_Record_Format FROM orchestra GROUP BY Major_Record_Format ORDER BY COUNT(*) ASC
SELECT Major_Record_Format FROM orchestra GROUP BY Major_Record_Format ORDER BY COUNT(*) DESC
SELECT Record_Company FROM orchestra GROUP BY Record_Company ORDER BY COUNT(*) DESC LIMIT 1
SELECT Record_Company FROM orchestra GROUP BY Record_Company ORDER BY COUNT(*) DESC LIMIT 1
SELECT orchestra FROM orchestra WHERE orchestra_id NOT IN (SELECT orchestra_id FROM performance)
SELECT orchestra FROM orchestra WHERE orchestra_id NOT IN (SELECT orchestra_id FROM performance)
SELECT Record_Company FROM orchestra WHERE Year_of_Founded < 2003 INTERSECT SELECT Record_Company FROM orchestra WHERE Year_of_Founded > 2003
SELECT Record_Company FROM orchestra WHERE Year_of_Founded < 2003 INTERSECT SELECT Record_Company FROM orchestra WHERE Year_of_Founded > 2003
SELECT COUNT(*) FROM orchestra WHERE Major_Record_Format IN ('CD', 'DVD')
SELECT COUNT(*) FROM orchestra WHERE Major_Record_Format LIKE '%CD%' OR Major_Record_Format LIKE '%DVD%'
SELECT T2.Year_of_Founded FROM orchestra AS T2 JOIN performance AS T3 ON T2.Orchestra_ID = T3.Orchestra_ID GROUP BY T2.Orchestra_ID HAVING COUNT(*) > 1
SELECT T2.Year_of_Founded FROM performance AS T1 INNER JOIN orchestra AS T2 ON T1.Orchestra_ID = T2.Orchestra_ID GROUP BY T1.Orchestra_ID HAVING COUNT(T1.Performance_ID) > 1
SELECT COUNT(*) FROM Highschooler
SELECT COUNT(*) FROM Highschooler
SELECT name , grade FROM Highschooler
SELECT name ,  grade FROM Highschooler
SELECT DISTINCT grade FROM Highschooler
SELECT grade FROM Highschooler
SELECT grade FROM Highschooler WHERE name = 'Kyle'
SELECT grade FROM Highschooler WHERE name = 'Kyle'
SELECT name FROM Highschooler WHERE grade = 10;
SELECT name FROM Highschooler WHERE grade = 10
SELECT ID FROM Highschooler WHERE name = 'Kyle'
SELECT ID FROM Highschooler WHERE name = 'Kyle'
SELECT COUNT(*) FROM Highschooler WHERE grade = 9 OR grade = 10
SELECT count(*) FROM Highschooler WHERE grade IN (9, 10)
SELECT grade ,  count(*) FROM Highschooler GROUP BY grade
SELECT grade ,  count(*) FROM Highschooler GROUP BY grade
SELECT grade FROM Highschooler GROUP BY grade ORDER BY COUNT(*) DESC LIMIT 1
SELECT grade FROM Highschooler GROUP BY grade ORDER BY COUNT(*) DESC LIMIT 1
SELECT grade FROM Highschooler GROUP BY grade HAVING COUNT(*) >= 4
SELECT grade FROM Highschooler GROUP BY grade HAVING COUNT(*) >= 4
SELECT student_id ,  COUNT(friend_id) FROM Friend GROUP BY student_id
SELECT T1.ID, COUNT(T2.friend_id) AS number_of_friends FROM Highschooler AS T1 LEFT JOIN Friend AS T2 ON T1.ID = T2.student_id GROUP BY T1.ID
SELECT T1.name ,  COUNT(*) FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id GROUP BY T1.name
SELECT T1.name ,  COUNT(*) FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id GROUP BY T1.ID
SELECT T1.name FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id GROUP BY T1.ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.name FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id GROUP BY T1.ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.name FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id GROUP BY T1.ID HAVING COUNT(T2.friend_id) >= 3
SELECT T1.name FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id GROUP BY T1.ID HAVING COUNT(T2.friend_id) >= 3
SELECT T3.name FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id = T2.ID JOIN Highschooler AS T3 ON T1.friend_id = T3.ID WHERE T2.name = 'Kyle'
SELECT T2.name FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id WHERE T1.name = 'Kyle'
SELECT COUNT(*) FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id WHERE T1.name = 'Kyle'
SELECT COUNT(*) FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id WHERE T1.name = 'Kyle'
SELECT ID FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend)
SELECT ID FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend)
SELECT name FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend)
SELECT name FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend)
SELECT DISTINCT student_id FROM Friend INTERSECT SELECT student_id FROM Likes
SELECT student_id FROM Friend INTERSECT SELECT liked_id FROM Likes
SELECT T1.name FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id WHERE T1.ID IN (SELECT student_id FROM Likes)
SELECT T1.name FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id JOIN Likes AS T3 ON T1.ID = T3.student_id
SELECT student_id ,  COUNT(liked_id) FROM Likes GROUP BY student_id
SELECT student_id ,  count(*) FROM Likes GROUP BY student_id
SELECT H.name, COUNT(L.student_id) AS num_likes FROM Highschooler H JOIN Likes L ON H.ID = L.student_id GROUP BY H.name
SELECT T1.name ,  COUNT(T2.student_id) FROM Highschooler AS T1 JOIN Likes AS T2 ON T1.ID = T2.student_id GROUP BY T1.name
SELECT T2.name FROM Likes AS T1 JOIN Highschooler AS T2 ON T1.student_id = T2.ID GROUP BY T1.student_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.name FROM Likes AS T1 JOIN Highschooler AS T2 ON T1.student_id = T2.ID GROUP BY T1.student_id ORDER BY COUNT(T1.liked_id) DESC LIMIT 1
SELECT T1.name FROM Highschooler AS T1 JOIN Likes AS T2 ON T1.ID = T2.student_id GROUP BY T1.name HAVING COUNT(T2.liked_id) >= 2
SELECT T1.name FROM Highschooler AS T1 JOIN Likes AS T2 ON T1.ID = T2.student_id GROUP BY T1.ID HAVING COUNT(T2.liked_id) >= 2
SELECT T1.name FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id WHERE T1.grade > 5 GROUP BY T1.name HAVING COUNT(T2.friend_id) >= 2
SELECT T1.name FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id WHERE T1.grade > 5 GROUP BY T1.ID HAVING COUNT(T2.friend_id) >= 2
SELECT COUNT(*) FROM Likes AS L JOIN Highschooler AS H ON L.student_id = H.ID WHERE H.name = 'Kyle'
SELECT COUNT(*) FROM Likes AS L JOIN Highschooler AS H ON L.student_id = H.ID WHERE H.name = 'Kyle'
SELECT AVG(T1.grade) FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id
SELECT AVG(T1.grade) FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id
SELECT MIN(grade) FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend)
SELECT MIN(grade) FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend)
SELECT DISTINCT T1.state FROM Owners AS T1 JOIN Professionals AS T2 ON T1.state = T2.state
SELECT DISTINCT state FROM Owners UNION SELECT DISTINCT state FROM Professionals
SELECT AVG(age) FROM Dogs WHERE dog_id IN (SELECT dog_id FROM Treatments);
SELECT AVG(age) FROM Dogs WHERE dog_id IN (SELECT dog_id FROM Treatments)
SELECT DISTINCT T2.professional_id, T2.last_name, T2.cell_number FROM Treatments AS T1 INNER JOIN Professionals AS T2 ON T1.professional_id = T2.professional_id WHERE T2.state = 'Indiana' OR T1.dog_id IN (SELECT dog_id FROM Treatments GROUP BY dog_id HAVING COUNT(treatment_id) > 2)
SELECT T1.professional_id, T1.last_name, T1.cell_number FROM Professionals AS T1 JOIN Treatments AS T2 ON T1.professional_id = T2.professional_id WHERE T1.state = 'Indiana' OR T2.dog_id IN (SELECT dog_id FROM Treatments GROUP BY dog_id HAVING COUNT(*) > 2)
SELECT D.name FROM Dogs AS D JOIN Treatments AS T ON D.dog_id = T.dog_id GROUP BY D.dog_id HAVING SUM(T.cost_of_treatment) <= 1000
SELECT D.name FROM Dogs AS D JOIN Treatments AS T ON D.dog_id = T.dog_id GROUP BY D.name HAVING SUM(T.cost_of_treatment) <= 1000;
SELECT DISTINCT first_name FROM Owners EXCEPT SELECT DISTINCT name FROM Dogs
SELECT first_name FROM Owners EXCEPT SELECT name FROM Dogs
SELECT professional_id, role_code, email_address FROM Professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments);
SELECT professional_id, role_code, email_address FROM Professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments);
SELECT T2.owner_id, T2.first_name, T2.last_name FROM Dogs AS T1 INNER JOIN Owners AS T2 ON T1.owner_id = T2.owner_id GROUP BY T2.owner_id ORDER BY COUNT(T1.dog_id) DESC LIMIT 1
SELECT T1.owner_id, T1.first_name, T1.last_name FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id GROUP BY T1.owner_id ORDER BY COUNT(T2.dog_id) DESC LIMIT 1
SELECT T2.professional_id, T2.role_code, T2.first_name FROM Treatments AS T1 INNER JOIN Professionals AS T2 ON T1.professional_id = T2.professional_id GROUP BY T2.professional_id HAVING COUNT(T1.treatment_id) >= 2
SELECT T2.professional_id ,  T2.role_code ,  T2.first_name FROM Treatments AS T1 INNER JOIN Professionals AS T2 ON T1.professional_id = T2.professional_id GROUP BY T2.professional_id HAVING COUNT(*) >= 2
SELECT breed_name FROM Breeds AS T1 JOIN Dogs AS T2 ON T1.breed_code = T2.breed_code GROUP BY breed_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT breed_name FROM Breeds AS T1 JOIN Dogs AS T2 ON T1.breed_code = T2.breed_code GROUP BY breed_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.owner_id, T1.last_name FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id JOIN Treatments AS T3 ON T2.dog_id = T3.dog_id GROUP BY T1.owner_id, T1.last_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.owner_id, T1.last_name FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id JOIN Treatments AS T3 ON T2.dog_id = T3.dog_id GROUP BY T1.owner_id, T1.last_name ORDER BY SUM(T3.cost_of_treatment) DESC LIMIT 1
SELECT t1.treatment_type_description FROM Treatment_Types AS t1 JOIN Treatments AS t2 ON t1.treatment_type_code = t2.treatment_type_code GROUP BY t1.treatment_type_description ORDER BY SUM(t2.cost_of_treatment) ASC LIMIT 1
SELECT T2.treatment_type_description FROM Treatments AS T1 INNER JOIN Treatment_Types AS T2 ON T1.treatment_type_code = T2.treatment_type_code GROUP BY T1.treatment_type_code ORDER BY SUM(T1.cost_of_treatment) ASC LIMIT 1
SELECT T1.owner_id, T1.zip_code FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id JOIN Charges AS T3 ON T2.dog_id IN (SELECT dog_id FROM Treatments GROUP BY dog_id ORDER BY SUM(cost_of_treatment) DESC LIMIT 1) GROUP BY T1.owner_id, T1.zip_code ORDER BY SUM(T3.charge_amount) DESC LIMIT 1
SELECT T1.owner_id, T1.zip_code FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id JOIN Treatments AS T3 ON T2.dog_id = T3.dog_id GROUP BY T1.owner_id, T1.zip_code ORDER BY SUM(T3.cost_of_treatment) DESC LIMIT 1
SELECT P.professional_id, P.cell_number FROM Professionals AS P JOIN Treatments AS T ON P.professional_id = T.professional_id GROUP BY P.professional_id HAVING COUNT(DISTINCT T.treatment_type_code) >= 2
SELECT professional_id, cell_number FROM Treatments GROUP BY professional_id HAVING COUNT(DISTINCT treatment_type_code) >= 2
SELECT T.first_name, T.last_name FROM Professionals AS T JOIN Treatments AS TR ON T.professional_id = TR.professional_id WHERE TR.cost_of_treatment < ( SELECT AVG(cost_of_treatment) FROM Treatments )
SELECT first_name, last_name FROM Professionals WHERE professional_id IN (SELECT professional_id FROM Treatments WHERE cost_of_treatment < (SELECT AVG(cost_of_treatment) FROM Treatments))
SELECT T1.date_of_treatment, T2.first_name FROM Treatments AS T1 INNER JOIN Professionals AS T2 ON T1.professional_id = T2.professional_id
SELECT T2.date_of_treatment ,  T3.first_name FROM Treatments AS T2 INNER JOIN Professionals AS T3 ON T2.professional_id = T3.professional_id
SELECT T2.cost_of_treatment, T1.treatment_type_description FROM Treatment_Types AS T1 INNER JOIN Treatments AS T2 ON T1.treatment_type_code = T2.treatment_type_code
SELECT T1.cost_of_treatment, T2.treatment_type_description FROM Treatments AS T1 INNER JOIN Treatment_Types AS T2 ON T1.treatment_type_code = T2.treatment_type_code
SELECT O.first_name, O.last_name, S.size_description FROM Owners AS O JOIN Dogs AS D ON O.owner_id = D.owner_id JOIN Sizes AS S ON D.size_code = S.size_code
SELECT T1.first_name, T1.last_name, T2.size_description FROM Owners AS T1 INNER JOIN Sizes AS T2 ON T1.owner_id = T2.owner_id
SELECT T2.first_name ,  T1.name FROM Dogs AS T1 INNER JOIN Owners AS T2 ON T1.owner_id = T2.owner_id
SELECT T1.first_name, T3.name FROM Owners AS T1 INNER JOIN Dogs AS T3 ON T1.owner_id = T3.owner_id
SELECT D.name, T.date_of_treatment FROM Dogs AS D JOIN Treatments AS T ON D.dog_id = T.dog_id WHERE D.breed_code = (SELECT breed_code FROM Dogs GROUP BY breed_code ORDER BY COUNT(*) ASC LIMIT 1)
SELECT D.name, T.date_of_treatment FROM Dogs AS D JOIN Treatments AS T ON D.dog_id = T.dog_id WHERE D.breed_code IN (SELECT breed_code FROM Dogs GROUP BY breed_code ORDER BY COUNT(*) ASC LIMIT 1)
SELECT T2.first_name ,  T3.name FROM Owners AS T2 INNER JOIN Dogs AS T3 ON T2.owner_id = T3.owner_id WHERE T2.state = 'Virginia'
SELECT DISTINCT T2.first_name ,  T1.name FROM Dogs AS T1 INNER JOIN Owners AS T2 ON T1.owner_id = T2.owner_id WHERE T2.state = 'Virginia'
SELECT T1.date_arrived ,  T1.date_departed FROM Dogs AS T1 INNER JOIN Treatments AS T2 ON T1.dog_id = T2.dog_id
SELECT T1.date_arrived ,  T1.date_departed FROM Dogs AS T1 INNER JOIN Treatments AS T2 ON T1.dog_id = T2.dog_id
SELECT O.last_name FROM Owners AS O JOIN Dogs AS D ON O.owner_id = D.owner_id WHERE D.age IS NOT NULL ORDER BY D.age ASC LIMIT 1
SELECT T1.last_name FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id WHERE T2.date_of_birth IS NOT NULL ORDER BY T2.date_of_birth DESC LIMIT 1
SELECT email_address FROM Professionals WHERE state = 'Hawaii' OR state = 'Wisconsin'
SELECT email_address FROM Professionals WHERE state = 'Hawaii' OR state = 'Wisconsin';
SELECT date_arrived ,  date_departed FROM Dogs;
SELECT date_arrived ,  date_departed FROM Dogs
SELECT COUNT(DISTINCT dog_id) FROM Treatments
SELECT COUNT(DISTINCT dog_id) FROM Treatments
SELECT COUNT(DISTINCT professional_id) FROM Treatments
SELECT COUNT(DISTINCT professional_id) FROM Treatments
SELECT role_code, street, city, state FROM Professionals WHERE city LIKE '%West%'
SELECT role_code, street, city, state FROM Professionals WHERE city LIKE '%West%'
SELECT first_name, last_name, email_address FROM Owners WHERE state LIKE '%North%'
SELECT first_name, last_name, email_address FROM Owners WHERE state LIKE '%North%'
SELECT COUNT(*) FROM Dogs WHERE age < (SELECT AVG(age) FROM Dogs);
SELECT COUNT(dog_id) FROM Dogs WHERE age < ( SELECT AVG(age) FROM Dogs )
SELECT cost_of_treatment FROM Treatments ORDER BY date_of_treatment DESC LIMIT 1
SELECT cost_of_treatment FROM Treatments ORDER BY date_of_treatment DESC LIMIT 1
SELECT COUNT(dog_id) FROM Dogs WHERE dog_id NOT IN (SELECT dog_id FROM Treatments)
SELECT COUNT(dog_id) FROM Dogs WHERE dog_id NOT IN (SELECT dog_id FROM Treatments);
SELECT COUNT(owner_id) FROM Owners WHERE owner_id NOT IN (SELECT owner_id FROM Dogs)
SELECT COUNT(owner_id) FROM Owners WHERE owner_id NOT IN (SELECT owner_id FROM Dogs WHERE abandoned_yn = '0')
SELECT COUNT(professional_id) FROM Professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments);
SELECT COUNT(professional_id) FROM Professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments);
SELECT name ,  age ,  weight FROM Dogs WHERE abandoned_yn = '1'
SELECT name, age, weight FROM Dogs WHERE abandoned_yn = '1'
SELECT AVG(age) FROM Dogs;
SELECT AVG(age) FROM Dogs
SELECT MAX(age) FROM Dogs
SELECT MAX(age) FROM Dogs;
SELECT charge_type, charge_amount FROM Charges;
SELECT charge_type, charge_amount FROM Charges;
SELECT charge_amount FROM Charges ORDER BY charge_amount DESC LIMIT 1
SELECT charge_amount FROM Charges ORDER BY charge_amount DESC LIMIT 1
SELECT email_address ,  cell_number ,  home_phone FROM Professionals
SELECT email_address, cell_number, home_phone FROM Professionals;
SELECT DISTINCT T1.breed_name, T3.size_description FROM Breeds AS T1 INNER JOIN Dogs AS T2 ON T1.breed_code = T2.breed_code INNER JOIN Sizes AS T3 ON T2.size_code = T3.size_code
SELECT DISTINCT T1.breed_name, T2.size_description FROM Breeds AS T1 INNER JOIN Sizes AS T2 ON T1.breed_code = T2.size_code
SELECT P.first_name, TT.treatment_type_description FROM Professionals AS P JOIN Treatments AS TR ON P.professional_id = TR.professional_id JOIN Treatment_Types AS TT ON TR.treatment_type_code = TT.treatment_type_code
SELECT P.first_name, TT.treatment_type_description FROM Professionals AS P JOIN Treatments AS TR ON P.professional_id = TR.professional_id JOIN Treatment_Types AS TT ON TR.treatment_type_code = TT.treatment_type_code
SELECT COUNT(*) FROM singer
SELECT COUNT(*) FROM singer
SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC
SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC
SELECT Birth_Year, Citizenship FROM singer
SELECT Birth_Year, Citizenship FROM singer;
SELECT Name FROM singer WHERE Citizenship != 'France'
SELECT Name FROM singer WHERE Citizenship != 'France'
SELECT Name FROM singer WHERE Birth_Year = 1948 OR Birth_Year = 1949;
SELECT Name FROM singer WHERE Birth_Year = 1948 OR Birth_Year = 1949
SELECT Name FROM singer ORDER BY Net_Worth_Millions DESC LIMIT 1
SELECT Name FROM singer WHERE Net_Worth_Millions = (SELECT MAX(Net_Worth_Millions) FROM singer)
SELECT Citizenship ,  COUNT(*) FROM singer GROUP BY Citizenship
SELECT Citizenship ,  COUNT(*) FROM singer GROUP BY Citizenship
SELECT Citizenship FROM singer GROUP BY Citizenship ORDER BY COUNT(*) DESC LIMIT 1
SELECT Citizenship FROM singer GROUP BY Citizenship ORDER BY COUNT(*) DESC LIMIT 1
SELECT Citizenship, MAX(Net_Worth_Millions) FROM singer GROUP BY Citizenship
SELECT Citizenship, MAX(Net_Worth_Millions) FROM singer GROUP BY Citizenship
SELECT T2.Title, T1.Name FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID
SELECT T2.Title, T1.Name FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID
SELECT DISTINCT T1.Name FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID WHERE T2.Sales > 300000
SELECT DISTINCT T2.Name FROM song AS T1 INNER JOIN singer AS T2 ON T1.Singer_ID = T2.Singer_ID WHERE T1.Sales > 300000
SELECT T1.Name FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID GROUP BY T1.Singer_ID HAVING COUNT(T2.Song_ID) > 1
SELECT T1.Name FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID GROUP BY T1.Name HAVING COUNT(T2.Song_ID) > 1
SELECT T1.Name, SUM(T2.Sales) FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID GROUP BY T1.Name
SELECT s.Name, SUM(so.Sales) FROM singer AS s JOIN song AS so ON s.Singer_ID = so.Singer_ID GROUP BY s.Name
SELECT Name FROM singer WHERE Singer_ID NOT IN (SELECT Singer_ID FROM song)
SELECT Name FROM singer WHERE Singer_ID NOT IN (SELECT Singer_ID FROM song)
SELECT Citizenship FROM singer WHERE Birth_Year < 1945 OR Birth_Year > 1955 GROUP BY Citizenship HAVING COUNT(*) > 1
SELECT Citizenship FROM singer WHERE Birth_Year < 1945 INTERSECT SELECT Citizenship FROM singer WHERE Birth_Year > 1955
SELECT COUNT(feature_id) FROM Other_Available_Features;
SELECT feature_type_name FROM Ref_Feature_Types WHERE feature_type_code = 'Amenity' AND feature_name = 'AirCon'
SELECT T1.property_type_description FROM Ref_Property_Types AS T1 INNER JOIN Properties AS T2 ON T1.property_type_code = T2.property_type_code GROUP BY T1.property_type_description
SELECT property_id FROM Properties WHERE property_type_code IN ('House', 'Apartment') AND room_count > 1;
