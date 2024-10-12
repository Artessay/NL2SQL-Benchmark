SELECT COUNT(*) FROM singer; 
SELECT COUNT(*) FROM singer; 
SELECT Name , Country , Age FROM singer ORDER BY Age DESC
SELECT Name, Country, Age FROM singer ORDER BY Age DESC; 
SELECT AVG(Age), MIN(Age), MAX(Age) FROM singer WHERE Country = 'France'; 
SELECT AVG(Age), MIN(Age), MAX(Age) FROM singer WHERE Country = 'France'
SELECT Song_Name, Song_release_year FROM singer ORDER BY Age ASC LIMIT 1
SELECT Song_Name, Song_release_year FROM singer ORDER BY Age ASC LIMIT 1
SELECT DISTINCT Country FROM singer WHERE Age > 20; 
SELECT DISTINCT Country FROM singer WHERE Age > 20
SELECT Country, COUNT(*) AS Number_of_Singers FROM singer GROUP BY Country; 
SELECT Country ,  COUNT(*) FROM singer GROUP BY Country
SELECT Song_Name FROM singer WHERE Age > (SELECT AVG(Age) FROM singer)
SELECT Song_Name FROM singer WHERE Age > (SELECT AVG(Age) FROM singer)
SELECT Location, Name FROM stadium WHERE Capacity BETWEEN 5000 AND 10000; 
SELECT Location ,  Name FROM stadium WHERE Capacity BETWEEN 5000 AND 10000
SELECT MAX(Capacity) AS Max_Capacity, AVG(Average) AS Average_Capacity FROM stadium; 
SELECT AVG(Capacity) ,  MAX(Capacity) FROM stadium
SELECT Name , Capacity FROM stadium ORDER BY Average DESC LIMIT 1
SELECT Name , Capacity FROM stadium ORDER BY Average DESC LIMIT 1
SELECT COUNT(*) FROM concert WHERE YEAR IN ('2014', '2015'); 
SELECT COUNT(*) FROM concert WHERE YEAR IN ('2014', '2015'); 
SELECT T1.Name ,  COUNT(*) FROM stadium AS T1 INNER JOIN concert AS T2 ON T1.Stadium_ID = T2.Stadium_ID GROUP BY T1.Name
SELECT s.Name, COUNT(c.concert_ID) AS Number_of_Concerts FROM stadium s JOIN concert c ON s.Stadium_ID = c.Stadium_ID GROUP BY s.Name; 
SELECT T1.Name, T1.Capacity FROM stadium AS T1 JOIN concert AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T2.Year >= 2014 GROUP BY T1.Stadium_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT s.Name, s.Capacity FROM stadium s JOIN concert c ON s.Stadium_ID = c.Stadium_ID WHERE c.Year > 2013 GROUP BY s.Stadium_ID ORDER BY COUNT(c.concert_ID) DESC LIMIT 1; 
SELECT Year FROM concert GROUP BY Year ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT YEAR FROM concert GROUP BY YEAR ORDER BY COUNT(*) DESC LIMIT 1
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert); 
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert); 
SELECT Country FROM singer WHERE Age > 40 INTERSECT SELECT Country FROM singer WHERE Age < 30
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert WHERE Year = '2014') 
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert WHERE Year = '2014'); 
SELECT c.concert_Name, c.Theme, COUNT(sc.Singer_ID) AS Number_of_Singers FROM concert c LEFT JOIN singer_in_concert sc ON c.concert_ID = sc.concert_ID GROUP BY c.concert_ID; 
SELECT c.concert_Name, c.Theme, COUNT(sc.Singer_ID) AS Number_of_Singers FROM concert c LEFT JOIN singer_in_concert sc ON c.concert_ID = sc.concert_ID GROUP BY c.concert_ID; 
SELECT s.Name, COUNT(sc.concert_ID) AS Number_of_Concerts FROM singer s JOIN singer_in_concert sc ON s.Singer_ID = sc.Singer_ID GROUP BY s.Name; 
SELECT T1.Name ,  COUNT(*) FROM singer AS T1 INNER JOIN singer_in_concert AS T2 ON T1.Singer_ID  =  T2.Singer_ID GROUP BY T1.Name
SELECT T3.Name FROM concert AS T1 INNER JOIN singer_in_concert AS T2 ON T1.concert_ID = T2.concert_ID INNER JOIN singer AS T3 ON T2.Singer_ID = T3.Singer_ID WHERE T1.Year = '2014'
SELECT s.Name FROM singer AS s JOIN singer_in_concert AS sic ON s.Singer_ID = sic.Singer_ID JOIN concert AS c ON sic.concert_ID = c.concert_ID WHERE c.Year = '2014'
SELECT Name , Country FROM singer WHERE Song_Name LIKE '%Hey%'
SELECT Name, Country FROM singer WHERE Song_Name LIKE '%Hey%'
SELECT s.Name, s.Location FROM stadium s JOIN concert c ON s.Stadium_ID = c.Stadium_ID WHERE c.Year IN ('2014', '2015') GROUP BY s.Stadium_ID HAVING COUNT(DISTINCT c.Year) > 1; 
SELECT s.Name, s.Location FROM stadium s JOIN concert c ON s.Stadium_ID = c.Stadium_ID WHERE c.Year IN ('2014', '2015') GROUP BY s.Stadium_ID HAVING COUNT(DISTINCT c.Year) > 1
SELECT COUNT(*) FROM concert WHERE Stadium_ID = (SELECT Stadium_ID FROM stadium ORDER BY Capacity DESC LIMIT 1) 
SELECT COUNT(*) FROM concert WHERE Stadium_ID = (SELECT Stadium_ID FROM stadium ORDER BY Capacity DESC LIMIT 1); 
SELECT COUNT(*) FROM Pets WHERE weight > 10;
SELECT COUNT(*) FROM Pets WHERE weight > 10; 
SELECT MIN(weight) FROM Pets WHERE PetType = 'dog'
SELECT MIN(weight) FROM Pets WHERE PetType = 'dog'
SELECT PetType, MAX(weight) AS MaxWeight FROM Pets GROUP BY PetType; 
SELECT PetType, MAX(weight) FROM Pets GROUP BY PetType;
SELECT COUNT(*) FROM Student AS S JOIN Has_Pet AS HP ON S.StuID = HP.StuID WHERE S.Age > 20; 
SELECT COUNT(*) FROM Has_Pet AS HP JOIN Student AS S ON HP.StuID = S.StuID WHERE S.Age > 20;
SELECT COUNT(*) FROM Has_Pet AS HP JOIN Pets AS P ON HP.PetID = P.PetID JOIN Student AS S ON HP.StuID = S.StuID WHERE P.PetType = 'dog' AND S.Sex = 'F';
SELECT COUNT(*) FROM Student S JOIN Has_Pet HP ON S.StuID = HP.StuID JOIN Pets P ON HP.PetID = P.PetID WHERE S.Sex = 'F' AND P.PetType = 'dog'; 
SELECT COUNT(DISTINCT PetType) FROM Pets;
SELECT COUNT(DISTINCT PetType) FROM Pets
SELECT DISTINCT s.Fname FROM Student s JOIN Has_Pet hp ON s.StuID = hp.StuID JOIN Pets p ON hp.PetID = p.PetID WHERE p.PetType IN ('cat', 'dog') 
SELECT DISTINCT S.Fname FROM Student AS S JOIN Has_Pet AS HP ON S.StuID = HP.StuID JOIN Pets AS P ON HP.PetID = P.PetID WHERE P.PetType IN ('cat', 'dog') 
SELECT S.Fname FROM Student AS S JOIN Has_Pet AS HP ON S.StuID = HP.StuID JOIN Pets AS P ON HP.PetID = P.PetID WHERE P.PetType = 'cat' INTERSECT SELECT S.Fname FROM Student AS S JOIN Has_Pet AS HP ON S.StuID = HP.StuID JOIN Pets AS P ON HP.PetID = P.PetID WHERE P.PetType = 'dog'
SELECT s.Fname FROM Student s JOIN Has_Pet hp ON s.StuID = hp.StuID JOIN Pets p ON hp.PetID = p.PetID WHERE p.PetType = 'cat' INTERSECT SELECT s.Fname FROM Student s JOIN Has_Pet hp ON s.StuID = hp.StuID JOIN Pets p ON hp.PetID = p.PetID WHERE p.PetType = 'dog'; 
SELECT Major, Age FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet INNER JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE PetType = 'cat') 
SELECT DISTINCT s.Major, s.Age  FROM Student s  WHERE NOT EXISTS (     SELECT 1      FROM Has_Pet hp      JOIN Pets p ON hp.PetID = p.PetID      WHERE hp.StuID = s.StuID AND p.PetType = 'cat' ) 
SELECT StuID FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet INNER JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE PetType = 'cat')
SELECT StuID FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE PetType = 'cat') 
SELECT s.Fname, s.Age FROM Student s JOIN Has_Pet hp ON s.StuID = hp.StuID JOIN Pets p ON hp.PetID = p.PetID WHERE p.PetType = 'dog' AND NOT EXISTS (     SELECT 1     FROM Has_Pet hp2     JOIN Pets p2 ON hp2.PetID = p2.PetID     WHERE hp2.StuID = s.StuID AND p2.PetType = 'cat' ) 
SELECT T1.Fname FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'dog' AND T1.StuID NOT IN (SELECT StuID FROM Has_Pet JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Pets.PetType = 'cat')
SELECT PetType, weight FROM Pets ORDER BY pet_age ASC LIMIT 1; 
SELECT PetType, weight FROM Pets ORDER BY pet_age ASC LIMIT 1; 
SELECT PetID, weight FROM Pets WHERE pet_age > 1; 
SELECT PetID, weight FROM Pets WHERE pet_age > 1; 
SELECT PetType, AVG(pet_age) AS AvgAge, MAX(pet_age) AS MaxAge FROM Pets GROUP BY PetType
SELECT PetType, AVG(pet_age) AS AvgAge, MAX(pet_age) AS MaxAge FROM Pets GROUP BY PetType; 
SELECT PetType, AVG(weight) AS AvgWeight FROM Pets GROUP BY PetType; 
SELECT PetType, AVG(weight) AS AverageWeight FROM Pets GROUP BY PetType; 
SELECT S.Fname, S.Age FROM Student AS S JOIN Has_Pet AS HP ON S.StuID = HP.StuID; 
SELECT DISTINCT S.Fname, S.Age FROM Student S JOIN Has_Pet HP ON S.StuID = HP.StuID; 
SELECT T2.PetID FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID WHERE T1.LName = 'Smith'; 
SELECT PetID FROM Has_Pet WHERE StuID = (SELECT StuID FROM Student WHERE LName = 'Smith')
SELECT s.StuID, COUNT(h.PetID) AS NumberOfPets FROM Student s JOIN Has_Pet h ON s.StuID = h.StuID GROUP BY s.StuID; 
SELECT StuID ,  COUNT(PetID) FROM Has_Pet GROUP BY StuID
SELECT T1.Fname ,  T1.Sex FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID GROUP BY T1.StuID HAVING COUNT(T2.PetID) > 1
SELECT T1.Fname ,  T1.sex FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID  =  T2.StuID GROUP BY T1.StuID HAVING COUNT(*)  >  1
SELECT T1.LName FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'cat' AND T3.pet_age = 3;
SELECT S.LName FROM Student AS S JOIN Has_Pet AS HP ON S.StuID = HP.StuID JOIN Pets AS P ON HP.PetID = P.PetID WHERE P.PetType = 'cat' AND P.pet_age = 3; 
SELECT AVG(Age) FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet); 
SELECT AVG(Age) FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet); 
SELECT COUNT(*) FROM continents
SELECT COUNT(*) FROM continents
SELECT c.ContId, co.Continent, COUNT(co.CountryId) AS NumberOfCountries FROM continents c JOIN countries co ON c.ContId = co.Continent GROUP BY c.ContId, co.Continent; 
SELECT c.ContId, c.Continent, COUNT(cn.CountryId) AS CountryCount FROM continents c LEFT JOIN countries cn ON c.ContId = cn.Continent GROUP BY c.ContId, c.Continent; 
SELECT COUNT(CountryId) FROM countries; 
SELECT COUNT(*) FROM countries; 
SELECT T2.FullName, T1.Maker, COUNT(T1.Model) FROM model_list AS T1 INNER JOIN car_makers AS T2 ON T1.Maker = T2.Id GROUP BY T1.Maker
SELECT T1.Maker ,  T1.FullName ,  COUNT(T2.Model) FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.Maker
SELECT T.Model FROM ( SELECT T2.Model, MIN(T1.Horsepower) AS min_horsepower FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.MakeId = T2.MakeId ) AS T ORDER BY T.min_horsepower ASC LIMIT 1
SELECT T2.Model FROM cars_data AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.ModelId ORDER BY T1.Horsepower ASC LIMIT 1
SELECT T2.Model FROM cars_data AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.ModelId WHERE T1.Weight < ( SELECT AVG(Weight) FROM cars_data )
SELECT Model FROM car_names WHERE MakeId IN (SELECT Id FROM cars_data WHERE Weight < (SELECT AVG(Weight) FROM cars_data)); 
SELECT T2.Maker FROM cars_data AS T1 INNER JOIN car_makers AS T2 ON T1.MakeId = T2.Id WHERE T1.Year = 1970 GROUP BY T2.Maker
SELECT DISTINCT T1.Maker FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker INNER JOIN cars_data AS T3 ON T2.ModelId = T3.Id WHERE T3.Year = 1970
SELECT T2.Make, T1.Year FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.Id = T2.MakeId ORDER BY T1.Year ASC LIMIT 1
SELECT T1.Maker ,  T2.Year FROM car_makers AS T1 INNER JOIN cars_data AS T2 ON T1.Id = T2.MakeId ORDER BY T2.Year ASC LIMIT 1
SELECT DISTINCT T2.Model FROM cars_data AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.ModelId WHERE T1.Year > 1980
SELECT DISTINCT T2.Model FROM cars_data AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.ModelId WHERE T1.Year > 1980
SELECT T2.Continent ,  COUNT(T1.Maker) FROM car_makers AS T1 INNER JOIN countries AS T2 ON T1.Country = T2.CountryId INNER JOIN continents AS T3 ON T2.Continent = T3.ContId GROUP BY T3.Continent
SELECT T1.Continent ,  COUNT(T2.Maker) FROM continents AS T1 INNER JOIN car_makers AS T2 ON T1.ContId = T2.Country GROUP BY T1.Continent
SELECT T2.CountryName FROM car_makers AS T1 INNER JOIN countries AS T2 ON T1.Country = T2.CountryId GROUP BY T2.CountryName ORDER BY COUNT(T1.Maker) DESC LIMIT 1
SELECT T2.CountryName FROM car_makers AS T1 INNER JOIN countries AS T2 ON T1.Country = T2.CountryId GROUP BY T2.CountryName ORDER BY COUNT(T1.Maker) DESC LIMIT 1
SELECT COUNT(T2.Model), T1.FullName FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.FullName; 
SELECT T1.Maker ,  T1.Id ,  T1.FullName ,  COUNT(T2.Model) FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.Maker
SELECT T2.Accelerate FROM car_names AS T1 INNER JOIN cars_data AS T2 ON T1.MakeId = T2.Id WHERE T1.Model = 'amc hornet sportabout (sw)'; 
SELECT T1.Accelerate FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.MakeId = T2.MakeId WHERE T2.Model = 'amc hornet sportabout' AND T2.Make = 'chevrolet'
SELECT COUNT(*) FROM car_makers WHERE Country IN ( SELECT CountryId FROM countries WHERE CountryName = 'france' )
SELECT COUNT(*) FROM car_makers WHERE Country = ( SELECT CountryId FROM countries WHERE CountryName = 'france' )
SELECT COUNT(*) FROM car_makers WHERE Country = '1'; 
SELECT COUNT(*) FROM car_makers WHERE Country = 1;
SELECT AVG(MPG) FROM cars_data WHERE Cylinders = 4; 
SELECT AVG(MPG) FROM cars_data WHERE Cylinders = 4; 
SELECT MIN(Weight) FROM cars_data WHERE Cylinders = 8 AND Year = 1974;
SELECT MIN(Weight) FROM cars_data WHERE Cylinders = 8 AND Year = 1974;
SELECT T1.Maker ,  T2.Model FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker
SELECT T1.Maker, T2.Model FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker; 
SELECT T1.CountryName, T1.CountryId FROM countries AS T1 INNER JOIN car_makers AS T2 ON T1.CountryId = T2.Country GROUP BY T1.CountryId HAVING COUNT(T2.Id) >= 1
SELECT T1.CountryName ,  T1.CountryId FROM countries AS T1 INNER JOIN car_makers AS T2 ON T1.CountryId = T2.Country GROUP BY T1.CountryName HAVING COUNT(T2.Maker) >= 1
SELECT COUNT(*) FROM cars_data WHERE Horsepower > 150; 
SELECT COUNT(*) FROM cars_data WHERE Horsepower > 150;
SELECT AVG(Weight), Year FROM cars_data GROUP BY Year
SELECT AVG(Weight), Year FROM cars_data GROUP BY Year
SELECT c.CountryName FROM countries c JOIN continents co ON c.Continent = co.ContId WHERE co.Continent = 'europe' GROUP BY c.CountryName HAVING COUNT(c.car_makers) >= 3; 
SELECT T2.CountryName FROM car_makers AS T1 INNER JOIN countries AS T2 ON T1.Country = T2.CountryId WHERE T2.Continent = 'europe' GROUP BY T2.CountryName HAVING COUNT(T1.Maker) >= 3
SELECT MAX(T1.Horsepower), T2.Make FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.Id = T2.MakeId WHERE T1.Cylinders = 3
SELECT MAX(T1.Horsepower), T2.Make FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.Id = T2.MakeId WHERE T1.Cylinders = 3
SELECT T1.Model FROM car_names AS T1 INNER JOIN cars_data AS T2 ON T1.MakeId = T2.Id ORDER BY T2.MPG DESC LIMIT 1
SELECT Model FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId ORDER BY MPG DESC LIMIT 1; 
SELECT AVG(Horsepower) FROM cars_data WHERE Year < 1980
SELECT AVG(Horsepower) FROM cars_data WHERE Year < 1980; 
SELECT AVG(T1.Edispl) FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.MakeId = T2.MakeId WHERE T2.Model = 'volvo'; 
SELECT AVG(Edispl) FROM cars_data INNER JOIN car_names ON cars_data.Id = car_names.MakeId INNER JOIN model_list ON car_names.Model = model_list.Model WHERE Model = 'audi'
SELECT Cylinders ,  MAX(Accelerate) FROM cars_data GROUP BY Cylinders
SELECT Cylinders ,  MAX(Accelerate) FROM cars_data GROUP BY Cylinders
SELECT T1.Model FROM car_names AS T1 INNER JOIN model_list AS T2 ON T1.Model = T2.Model GROUP BY T1.Model ORDER BY COUNT(*) DESC LIMIT 1
SELECT T.Model FROM car_names AS T GROUP BY T.Model ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 4; 
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 4; 
SELECT COUNT(*) FROM cars_data WHERE Year = 1980; 
SELECT COUNT(*) FROM cars_data WHERE Year = 1980; 
SELECT COUNT(*) FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker WHERE T1.FullName = 'American Motor Company'
SELECT COUNT(*) FROM car_makers AS cm JOIN model_list AS ml ON cm.Id = ml.Maker WHERE cm.Maker = 'amc'; 
SELECT T1.Maker ,  T1.FullName FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.Maker HAVING COUNT(T2.Model) > 3
SELECT T1.Maker ,  T1.Id FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.Id HAVING COUNT(T2.Model) > 3
SELECT DISTINCT T1.Model FROM model_list AS T1 INNER JOIN car_names AS T2 ON T1.Model = T2.Model INNER JOIN cars_data AS T3 ON T2.MakeId = T3.Id WHERE T2.Make LIKE '%general motors%' OR T3.Weight > 3500; 
SELECT DISTINCT T1.Model FROM model_list AS T1 INNER JOIN cars_data AS T2 ON T1.ModelID = T2.MakeId WHERE T1.Maker IN ( SELECT Id FROM car_makers WHERE Maker = 'gm' ) OR T2.Weight > 3500
SELECT Year FROM cars_data WHERE Weight BETWEEN 3000 AND 4000; 
SELECT DISTINCT Year FROM cars_data WHERE Weight < 4000 AND Year IN (SELECT Year FROM cars_data WHERE Weight > 3000)
SELECT Horsepower FROM cars_data ORDER BY Accelerate DESC LIMIT 1
SELECT Horsepower FROM cars_data ORDER BY Accelerate DESC LIMIT 1
SELECT Cylinders FROM cars_data WHERE MakeId = (SELECT ModelId FROM model_list WHERE Maker = 'volkswagen') ORDER BY Accelerate ASC LIMIT 1; 
SELECT T2.Cylinders FROM car_makers AS T1 INNER JOIN cars_data AS T2 ON T1.Id = T2.MakeId WHERE T1.Maker = 'volkswagen' ORDER BY T2.Accelerate ASC LIMIT 1
SELECT COUNT(*) FROM cars_data WHERE Accelerate > (SELECT MAX(Horsepower) FROM cars_data); 
SELECT COUNT(*) FROM cars_data WHERE Accelerate > (SELECT MAX(Accelerate) FROM cars_data WHERE Horsepower = (SELECT MAX(Horsepower) FROM cars_data)); 
SELECT COUNT(*) FROM ( SELECT Country FROM car_makers GROUP BY Country HAVING COUNT(*) > 2 )
SELECT COUNT(*) FROM (     SELECT Country FROM car_makers GROUP BY Country HAVING COUNT(Maker) > 2 ) 
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 6
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 6; 
SELECT T2.Model FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.MakeId = T2.MakeId WHERE T1.Cylinders = 4 ORDER BY T1.Horsepower DESC LIMIT 1
SELECT T1.Model FROM model_list AS T1 INNER JOIN car_names AS T2 ON T1.Model = T2.Model INNER JOIN cars_data AS T3 ON T2.MakeId = T3.Id WHERE T3.Cylinders = 4 ORDER BY T3.Horsepower DESC LIMIT 1; 
SELECT T1.MakeId, T1.Make FROM car_names AS T1 INNER JOIN cars_data AS T2 ON T1.MakeId = T2.Id WHERE T2.Horsepower > ( SELECT MIN(Horsepower) FROM cars_data ) AND T2.Cylinders <= 3
SELECT cm.Id, cn.Make FROM car_makers cm JOIN model_list ml ON cm.Id = ml.Maker JOIN car_names cn ON ml.Model = cn.Model WHERE cm.Horsepower != ( SELECT MIN(Horsepower) FROM cars_data ) AND cm.Cylinders < 4; 
SELECT MAX(MPG) FROM cars_data WHERE Cylinders = 8 OR Year < 1980; 
SELECT MAX(MPG) FROM cars_data WHERE Cylinders = 8 OR Year < 1980
SELECT T2.Model FROM cars_data AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.ModelId INNER JOIN car_makers AS T3 ON T2.Maker = T3.Id WHERE T1.Weight < 3500 AND T3.Make != 'Ford Motor Company'
SELECT T1.Model FROM model_list AS T1 INNER JOIN car_names AS T2 ON T1.Model = T2.Model WHERE T2.Make != 'ford' AND T1.Model IN ( SELECT Model FROM cars_data WHERE Weight < 3500 )
SELECT CountryName FROM countries WHERE CountryId NOT IN (SELECT Country FROM car_makers); 
SELECT CountryName FROM countries WHERE CountryId NOT IN (SELECT Country FROM car_makers)
SELECT Maker, COUNT(*) AS ModelCount FROM model_list GROUP BY Maker HAVING ModelCount >= 2 AND COUNT(DISTINCT Maker) > 3; 
SELECT T1.Id, T1.Maker FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.Id HAVING COUNT(T2.Model) >= 2 AND COUNT(*) > 3
SELECT c.CountryId, c.CountryName  FROM countries c JOIN car_makers cm ON c.CountryId = cm.Country WHERE (     SELECT COUNT(*) FROM car_makers WHERE Country = c.CountryId ) > 3 OR EXISTS (     SELECT 1 FROM car_names cn JOIN model_list ml ON cn.Model = ml.Model WHERE cn.Make = 'fiat' ) 
SELECT T1.CountryId ,  T1.CountryName FROM countries AS T1 INNER JOIN car_makers AS T2 ON T1.CountryId = T2.Country WHERE T1.CountryId IN ( SELECT CountryId FROM car_makers GROUP BY CountryId HAVING COUNT(Maker) > 3 ) OR T1.CountryId IN ( SELECT T1.CountryId FROM countries AS T1 INNER JOIN car_makers AS T2 ON T1.CountryId = T2.Country INNER JOIN model_list AS T3 ON T2.Id = T3.Maker WHERE T3.Model = 'fiat' )
SELECT Country FROM airlines WHERE Airline = 'JetBlue Airways'
SELECT Country FROM airlines WHERE Airline = 'JetBlue Airways'
SELECT Abbreviation FROM airlines WHERE Airline = 'JetBlue Airways'; 
SELECT Abbreviation FROM airlines WHERE Airline = 'JetBlue Airways'
SELECT Airline, Abbreviation FROM airlines WHERE Country = 'USA'; 
SELECT Airline , Abbreviation FROM airlines WHERE Country = 'USA'
SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony'; 
SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony'
SELECT COUNT(*) FROM airlines; 
SELECT COUNT(*) FROM airlines; 
SELECT COUNT(*) FROM airports;
SELECT COUNT(*) FROM airports; 
SELECT COUNT(*) FROM flights; 
SELECT COUNT(*) FROM flights; 
SELECT Airline FROM airlines WHERE Abbreviation = 'UAL';
SELECT Airline FROM airlines WHERE Abbreviation = 'UAL'
SELECT COUNT(*) FROM airlines WHERE Country = 'USA'; 
SELECT COUNT(*) FROM airlines WHERE Country = 'USA'; 
SELECT City, Country FROM airports WHERE AirportName = 'Alton'
SELECT City ,  Country FROM airports WHERE AirportName = 'Alton'
SELECT AirportName FROM airports WHERE AirportCode = 'AKO'; 
SELECT AirportName FROM airports WHERE AirportCode = 'AKO'
SELECT AirportName FROM airports WHERE City = 'Aberdeen'
SELECT AirportName FROM airports WHERE City = 'Aberdeen'
SELECT COUNT(*) FROM flights WHERE SourceAirport = 'APG'; 
SELECT COUNT(*) FROM flights WHERE SourceAirport = 'APG';
SELECT COUNT(*) FROM flights WHERE DestAirport = 'ATO'; 
SELECT COUNT(*) FROM flights WHERE DestAirport = 'ATO';
SELECT COUNT(*) FROM airports AS T1 INNER JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport WHERE T1.City = 'Aberdeen'
SELECT COUNT(*) FROM airports AS T1 INNER JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport WHERE T1.City = 'Aberdeen'
SELECT COUNT(*) FROM airports AS T1 INNER JOIN flights AS T2 ON T1.AirportCode = T2.DestAirport WHERE T1.City LIKE '%Aberdeen%'
SELECT COUNT(*) FROM flights WHERE DestAirport IN (SELECT AirportCode FROM airports WHERE City = 'Aberdeen'); 
SELECT COUNT(*) FROM flights f JOIN airports s ON f.SourceAirport = s.AirportCode JOIN airports d ON f.DestAirport = d.AirportCode WHERE s.City = 'Aberdeen' AND d.City = 'Ashley'; 
SELECT COUNT(*) FROM flights WHERE SourceAirport = 'ABR' AND DestAirport = 'ASY'; 
SELECT COUNT(*) FROM flights WHERE Airline = (SELECT uid FROM airlines WHERE Airline = 'JetBlue Airways'); 
SELECT COUNT(*) FROM flights WHERE Airline = (SELECT uid FROM airlines WHERE Airline = 'JetBlue Airways'); 
SELECT COUNT(*) FROM flights WHERE Airline = (SELECT uid FROM airlines WHERE Airline = 'United Airlines') AND DestAirport = 'ASY'; 
SELECT COUNT(*) FROM flights WHERE Airline = 1 AND DestAirport = 'ASY'; 
SELECT COUNT(*) FROM flights WHERE Airline = 1 AND SourceAirport = 'AHD'; 
SELECT COUNT(*) FROM flights WHERE Airline = (SELECT uid FROM airlines WHERE Airline = 'United Airlines') AND SourceAirport = 'AHD'
SELECT COUNT(*) FROM flights f JOIN airlines a ON f.Airline = a.uid JOIN airports ap ON f.DestAirport = ap.AirportCode WHERE a.Airline = 'United Airlines' AND ap.City = 'Aberdeen'; 
SELECT COUNT(*) FROM flights INNER JOIN airlines ON flights.Airline = airlines.uid INNER JOIN airports AS dest ON flights.DestAirport = dest.AirportCode WHERE airlines.Airline = 'United Airlines' AND dest.City LIKE '%Aberdeen%'
SELECT T2.City FROM flights AS T1 INNER JOIN airports AS T2 ON T2.AirportCode = T1.DestAirport GROUP BY T2.City ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT T2.City FROM flights AS T1 INNER JOIN airports AS T2 ON T1.DestAirport = T2.AirportCode GROUP BY T2.City ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.City FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport GROUP BY T1.City ORDER BY COUNT(T2.FlightNo) DESC LIMIT 1; 
SELECT T1.City FROM airports AS T1 INNER JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport GROUP BY T1.City ORDER BY COUNT(T2.FlightNo) DESC LIMIT 1
SELECT DestAirport FROM flights GROUP BY DestAirport ORDER BY COUNT(*) DESC LIMIT 1
SELECT SourceAirport FROM flights GROUP BY SourceAirport ORDER BY COUNT(*) DESC LIMIT 1
SELECT SourceAirport FROM flights GROUP BY SourceAirport ORDER BY COUNT(*) ASC LIMIT 1
SELECT DestAirport FROM flights GROUP BY DestAirport ORDER BY COUNT(*) ASC LIMIT 1
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Abbreviation ,  T1.Country FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T2.Airline ORDER BY COUNT(*) ASC LIMIT 1
SELECT T1.Abbreviation, T1.Country FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline ORDER BY COUNT(*) ASC LIMIT 1; 
SELECT T1.Airline FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'AHD'
SELECT DISTINCT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'AHD'; 
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.DestAirport = 'AHD'
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.DestAirport = 'AHD'
SELECT T1.Airline, T1.Airport  FROM airlines AS T1  JOIN flights AS T2 ON T1.uid = T2.Airline  WHERE T2.SourceAirport IN ('APG', 'CVO')  GROUP BY T1.Airline, T1.Airport  HAVING COUNT(DISTINCT T2.SourceAirport) > 1; 
SELECT T1.Airline FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport IN ('APG', 'CVO') GROUP BY T1.Airline HAVING COUNT(DISTINCT T2.SourceAirport) > 1
SELECT DISTINCT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'CVO' AND T2.DestAirport != 'APG'; 
SELECT T1.Airline FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'CVO' AND T2.DestAirport != 'APG'
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline HAVING COUNT(T2.FlightNo) >= 10
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline HAVING COUNT(*) >= 10
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline HAVING COUNT(*) < 200
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline HAVING COUNT(T2.FlightNo) < 200
SELECT FlightNo FROM flights WHERE Airline = (SELECT uid FROM airlines WHERE Airline = 'United Airlines')
SELECT FlightNo FROM flights WHERE Airline = 1; 
SELECT FlightNo FROM flights WHERE SourceAirport = 'APG'; 
SELECT FlightNo FROM flights WHERE SourceAirport = 'APG'
SELECT FlightNo FROM flights WHERE DestAirport = 'APG'; 
SELECT FlightNo FROM flights WHERE DestAirport = 'APG'
SELECT T2.FlightNo FROM airports AS T1 INNER JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport WHERE T1.City = 'Aberdeen '; 
SELECT FlightNo FROM flights WHERE SourceAirport IN ( SELECT AirportCode FROM airports WHERE City = 'Aberdeen' )
SELECT T2.FlightNo FROM airports AS T1 INNER JOIN flights AS T2 ON T1.AirportCode = T2.DestAirport WHERE T1.City = 'Aberdeen' 
SELECT FlightNo FROM flights WHERE DestAirport IN ( SELECT AirportCode FROM airports WHERE City = 'Aberdeen' )
SELECT COUNT(*) FROM airports AS T1 INNER JOIN flights AS T2 ON T1.AirportCode = T2.DestAirport WHERE T1.City IN ('Aberdeen ', 'Abilene ')
SELECT COUNT(*) FROM airports WHERE City IN ('Aberdeen', 'Abilene') AND AirportCode IN ( SELECT DestAirport FROM flights ); 
SELECT AirportName FROM airports WHERE AirportCode NOT IN ( SELECT SourceAirport FROM flights UNION SELECT DestAirport FROM flights )
SELECT AirportName FROM airports WHERE AirportCode NOT IN ( SELECT SourceAirport FROM flights ) AND AirportCode NOT IN ( SELECT DestAirport FROM flights )
SELECT COUNT(*) FROM employee; 
SELECT COUNT(*) FROM employee; 
SELECT Name FROM employee ORDER BY Age ASC; 
SELECT Name FROM employee ORDER BY Age ASC
SELECT City, COUNT(*) FROM employee GROUP BY City; 
SELECT City, COUNT(*) AS Employee_Count FROM employee GROUP BY City; 
SELECT City FROM employee WHERE Age < 30 GROUP BY City HAVING COUNT(*) > 1; 
SELECT City FROM employee WHERE Age < 30 GROUP BY City HAVING COUNT(*) > 1; 
SELECT LOCATION, COUNT(*) FROM shop GROUP BY LOCATION; 
SELECT Location, COUNT(*) FROM shop GROUP BY Location; 
SELECT T2.Manager_name ,  T2.District FROM shop AS T1 INNER JOIN hiring AS T2 ON T1.Shop_ID  =  T2.Shop_ID ORDER BY T1.Number_products DESC LIMIT 1
SELECT T1.manager_name ,  T1.district FROM shop AS T1 JOIN hiring AS T2 ON T1.shop_id = T2.shop_id GROUP BY T1.shop_id ORDER BY SUM(T1.number_products) DESC LIMIT 1
SELECT MIN(Number_products), MAX(Number_products) FROM shop; 
SELECT min(Number_products) ,  max(Number_products) FROM shop
SELECT Name, Location, District FROM shop ORDER BY Number_products DESC; 
SELECT Name, Location, District FROM shop ORDER BY Number_products DESC; 
SELECT Name FROM shop WHERE Number_products > ( SELECT AVG(Number_products) FROM shop )
SELECT Name FROM shop WHERE Number_products > (SELECT AVG(Number_products) FROM shop); 
SELECT e.Name FROM employee e JOIN evaluation ev ON e.Employee_ID = ev.Employee_ID GROUP BY e.Employee_ID ORDER BY COUNT(ev.Year_awarded) DESC LIMIT 1; 
SELECT e.Name FROM employee e JOIN evaluation ev ON e.Employee_ID = ev.Employee_ID GROUP BY e.Employee_ID ORDER BY COUNT(ev.Year_awarded) DESC LIMIT 1; 
SELECT T1.Name FROM employee AS T1 JOIN evaluation AS T2 ON T1.Employee_ID = T2.Employee_ID ORDER BY T2.Bonus DESC LIMIT 1
SELECT e.Name FROM employee AS e JOIN evaluation AS ev ON e.Employee_ID = ev.Employee_ID ORDER BY ev.Bonus DESC LIMIT 1; 
SELECT Name FROM employee WHERE Employee_ID NOT IN (SELECT Employee_ID FROM evaluation)
SELECT Name FROM employee WHERE Employee_ID NOT IN (SELECT Employee_ID FROM evaluation) 
SELECT s.Name FROM shop s JOIN hiring h ON s.Shop_ID = h.Shop_ID GROUP BY s.Name ORDER BY COUNT(h.Employee_ID) DESC LIMIT 1; 
SELECT T1.Name FROM shop AS T1 JOIN hiring AS T2 ON T1.Shop_ID = T2.Shop_ID GROUP BY T1.Name ORDER BY COUNT(T2.Employee_ID) DESC LIMIT 1
SELECT Name FROM shop WHERE Shop_ID NOT IN (SELECT Shop_ID FROM hiring)
SELECT Name FROM shop WHERE Shop_ID NOT IN (SELECT Shop_ID FROM hiring)
SELECT s.Name, COUNT(h.Employee_ID) AS Number_of_Employees_Hired FROM shop s JOIN hiring h ON s.Shop_ID = h.Shop_ID GROUP BY s.Name; 
SELECT T1.Name ,  COUNT(T2.Employee_ID) FROM shop AS T1 INNER JOIN hiring AS T2 ON T1.Shop_ID  =  T2.Shop_ID GROUP BY T1.Name
SELECT SUM(Bonus) AS Total_Bonus FROM evaluation; 
SELECT SUM(Bonus) AS Total_Bonus FROM evaluation; 
SELECT * FROM hiring;
SELECT * FROM hiring
SELECT District FROM shop WHERE Number_products < 3000 INTERSECT SELECT District FROM shop WHERE Number_products > 10000
SELECT District FROM shop WHERE Number_products < 3000 INTERSECT SELECT District FROM shop WHERE Number_products > 10000
SELECT COUNT(DISTINCT Location) FROM shop
SELECT COUNT(DISTINCT Location) FROM shop
SELECT COUNT(*) FROM Documents; 
SELECT COUNT(*) AS NumberOfDocuments FROM Documents; 
SELECT Document_ID, Document_Name, Document_Description FROM Documents; 
SELECT Document_ID, Document_Name, Document_Description FROM Documents; 
SELECT Document_Name, Template_ID FROM Documents WHERE Document_Description LIKE '%w%'
SELECT Document_Name, Template_ID FROM Documents WHERE Document_Description LIKE '%w%'
SELECT Document_ID, Template_ID, Document_Description FROM Documents WHERE Document_Name = 'Robbin CV'; 
SELECT Document_ID, Template_ID, Document_Description FROM Documents WHERE Document_Name = 'Robbin CV'; 
SELECT COUNT(DISTINCT Template_ID) AS Different_Templates_Used FROM Documents; 
SELECT COUNT(DISTINCT Template_ID) FROM Documents; 
SELECT COUNT(*) FROM Documents WHERE Template_ID IN (SELECT Template_ID FROM Templates WHERE Template_Type_Code = 'PPT'); 
SELECT COUNT(*) FROM Documents AS D JOIN Templates AS T ON D.Template_ID = T.Template_ID WHERE T.Template_Type_Code = 'PPT'; 
SELECT Template_ID ,  COUNT(Document_ID) FROM Documents GROUP BY Template_ID
SELECT Template_ID ,  COUNT(*) FROM Documents GROUP BY Template_ID
SELECT T.Template_ID, T.Template_Type_Code FROM Templates AS T JOIN Documents AS D ON T.Template_ID = D.Template_ID GROUP BY T.Template_ID, T.Template_Type_Code ORDER BY COUNT(D.Document_ID) DESC LIMIT 1
SELECT T.Template_ID, T.Template_Type_Code FROM Templates AS T JOIN Documents AS D ON T.Template_ID = D.Template_ID GROUP BY T.Template_ID ORDER BY COUNT(D.Document_ID) DESC LIMIT 1
SELECT Template_ID FROM Documents GROUP BY Template_ID HAVING COUNT(*) > 1
SELECT Template_ID FROM Documents GROUP BY Template_ID HAVING COUNT(*) > 1; 
SELECT Template_ID FROM Templates WHERE Template_ID NOT IN (SELECT Template_ID FROM Documents) 
SELECT Template_ID FROM Templates WHERE Template_ID NOT IN (SELECT Template_ID FROM Documents); 
SELECT COUNT(*) AS Total_Templates FROM Templates; 
SELECT COUNT(*) FROM Templates; 
SELECT Template_ID ,  Version_Number ,  Template_Type_Code FROM Templates;
SELECT Template_ID , Version_Number , Template_Type_Code FROM Templates
SELECT DISTINCT Template_Type_Code FROM Templates;
SELECT DISTINCT Template_Type_Code FROM Ref_Template_Types; 
SELECT Template_ID FROM Templates WHERE Template_Type_Code IN ('PP', 'PPT'); 
SELECT Template_ID FROM Templates WHERE Template_Type_Code IN ('PP', 'PPT'); 
SELECT COUNT(*) FROM Templates WHERE Template_Type_Code = 'CV'; 
SELECT COUNT(*) FROM Templates WHERE Template_Type_Code = 'CV'; 
SELECT Version_Number, Template_Type_Code FROM Templates WHERE Version_Number > 5; 
SELECT Version_Number, Template_Type_Code FROM Templates WHERE Version_Number > 5; 
SELECT Template_Type_Code, COUNT(*) AS Number_of_Templates FROM Templates GROUP BY Template_Type_Code; 
SELECT Template_Type_Code, COUNT(*) FROM Templates GROUP BY Template_Type_Code
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code HAVING COUNT(*) < 3; 
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code HAVING COUNT(*) < 3
SELECT MIN(Version_Number), Template_Type_Code FROM Templates GROUP BY Template_Type_Code ORDER BY Version_Number ASC LIMIT 1;
SELECT MIN(Version_Number), Template_Type_Code FROM Templates GROUP BY Template_Type_Code; 
SELECT T.Template_Type_Code FROM Templates AS T JOIN Documents AS D ON T.Template_ID = D.Template_ID WHERE D.Document_Name = 'Data base'; 
SELECT Template_Type_Code FROM Templates WHERE Template_ID = (SELECT Template_ID FROM Documents WHERE Document_Name = 'Data base') 
SELECT Document_Name FROM Documents WHERE Template_ID IN (SELECT Template_ID FROM Templates WHERE Template_Type_Code = 'BK')
SELECT Document_Name FROM Documents WHERE Template_ID IN (SELECT Template_ID FROM Templates WHERE Template_Type_Code = 'BK')
SELECT tt.Template_Type_Code, COUNT(d.Document_ID) AS Number_of_Documents FROM Ref_Template_Types tt JOIN Templates t ON tt.Template_Type_Code = t.Template_Type_Code JOIN Documents d ON t.Template_ID = d.Template_ID GROUP BY tt.Template_Type_Code; 
SELECT T1.Template_Type_Code ,  COUNT(DISTINCT T2.Document_ID) FROM Ref_Template_Types AS T1 INNER JOIN Templates AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code GROUP BY T1.Template_Type_Code
SELECT Template_Type_Code FROM Templates WHERE Template_ID IN (SELECT Template_ID FROM Documents GROUP BY Template_ID ORDER BY COUNT(*) DESC LIMIT 1)
SELECT Template_Type_Code FROM Documents JOIN Templates ON Documents.Template_ID = Templates.Template_ID GROUP BY Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Code NOT IN (SELECT Template_Type_Code FROM Templates JOIN Documents ON Templates.Template_ID = Documents.Template_ID)
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Code NOT IN (SELECT Template_Type_Code FROM Templates WHERE Template_ID IN (SELECT Template_ID FROM Documents))
SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types; 
SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types; 
SELECT Template_Type_Description FROM Ref_Template_Types WHERE Template_Type_Code = 'AD'; 
SELECT Template_Type_Description FROM Ref_Template_Types WHERE Template_Type_Code = 'AD'; 
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Book'
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Book'; 
SELECT DISTINCT T1.Template_Type_Description FROM Ref_Template_Types AS T1 INNER JOIN Templates AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code WHERE T2.Template_ID IN ( SELECT Template_ID FROM Documents )
SELECT DISTINCT T1.Template_Type_Description FROM Ref_Template_Types AS T1 INNER JOIN Templates AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code INNER JOIN Documents AS T3 ON T2.Template_ID = T3.Template_ID
SELECT T1.Template_ID FROM Templates AS T1 INNER JOIN Ref_Template_Types AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code WHERE T2.Template_Type_Description = 'Presentation'
SELECT Template_ID FROM Templates WHERE Template_Type_Code IN (SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Presentation')
SELECT COUNT(*) FROM Paragraphs;
SELECT COUNT(*) FROM Paragraphs; 
SELECT COUNT(*) AS Paragraph_Count FROM Documents d JOIN Paragraphs p ON d.Document_ID = p.Document_ID WHERE d.Document_Name = 'Summer Show'; 
SELECT COUNT(*) FROM Paragraphs AS T1 INNER JOIN Documents AS T2 ON T1.Document_ID = T2.Document_ID WHERE T2.Document_Name = 'Summer Show'
SELECT Other_Details FROM Paragraphs WHERE Paragraph_Text = 'Korea'; 
SELECT Paragraph_Text FROM Paragraphs WHERE Paragraph_Text LIKE '%Korea%'
SELECT Paragraph_ID, Paragraph_Text FROM Paragraphs WHERE Document_ID = (SELECT Document_ID FROM Documents WHERE Document_Name = 'Welcome to NY') 
SELECT p.Paragraph_ID, p.Paragraph_Text FROM Paragraphs p JOIN Documents d ON p.Document_ID = d.Document_ID WHERE d.Document_Name = 'Welcome to NY'
SELECT T2.Paragraph_Text FROM Documents AS T1 INNER JOIN Paragraphs AS T2 ON T1.Document_ID = T2.Document_ID WHERE T1.Document_Name = 'Customer reviews'
SELECT T2.Paragraph_Text FROM Documents AS T1 INNER JOIN Paragraphs AS T2 ON T1.Document_ID = T2.Document_ID WHERE T1.Document_Name = 'Customer reviews'
SELECT Document_ID, COUNT(*) AS Number_of_Paragraphs FROM Paragraphs GROUP BY Document_ID ORDER BY Document_ID; 
SELECT Document_ID ,  COUNT(*) FROM Paragraphs GROUP BY Document_ID ORDER BY Document_ID;
SELECT d.Document_ID, d.Document_Name, COUNT(p.Paragraph_ID) AS Number_of_Paragraphs FROM Documents d LEFT JOIN Paragraphs p ON d.Document_ID = p.Document_ID GROUP BY d.Document_ID, d.Document_Name; 
SELECT Documents.Document_ID, Documents.Document_Name, COUNT(Paragraphs.Paragraph_ID) AS Paragraph_Count FROM Documents LEFT JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID GROUP BY Documents.Document_ID, Documents.Document_Name
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(*) >= 2
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(*) >= 2
SELECT Document_ID, Document_Name FROM Documents WHERE Document_ID IN (SELECT Document_ID FROM Paragraphs GROUP BY Document_ID ORDER BY COUNT(*) DESC LIMIT 1)
SELECT D.Document_ID, D.Document_Name FROM Documents AS D JOIN Paragraphs AS P ON D.Document_ID = P.Document_ID GROUP BY D.Document_ID, D.Document_Name ORDER BY COUNT(P.Paragraph_ID) DESC LIMIT 1
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(*) BETWEEN 1 AND 2;
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(*) BETWEEN 1 AND 2
SELECT Document_ID FROM Paragraphs WHERE Paragraph_Text IN ('Brazil', 'Ireland'); 
SELECT Document_ID FROM Paragraphs WHERE Paragraph_Text IN ('Brazil', 'Ireland')
SELECT COUNT(*) FROM teacher;
SELECT COUNT(*) FROM teacher; 
SELECT Name FROM teacher ORDER BY Age ASC;
SELECT Name FROM teacher ORDER BY Age ASC
SELECT Age, Hometown FROM teacher; 
SELECT Age, Hometown FROM teacher; 
SELECT Name FROM teacher WHERE Hometown != 'Little Lever Urban District'
SELECT Name FROM teacher WHERE Hometown != 'Little Lever Urban District'
SELECT Name FROM teacher WHERE Age IN (32, 33); 
SELECT Name FROM teacher WHERE Age IN (32, 33);
SELECT Hometown FROM teacher ORDER BY Age ASC LIMIT 1; 
SELECT Hometown FROM teacher ORDER BY Age ASC LIMIT 1
SELECT Hometown, COUNT(*) FROM teacher GROUP BY Hometown; 
SELECT Hometown, COUNT(*) AS NumberOfTeachers FROM teacher GROUP BY Hometown; 
SELECT Hometown FROM teacher GROUP BY Hometown ORDER BY COUNT(*) DESC LIMIT 1
SELECT Hometown FROM teacher GROUP BY Hometown ORDER BY COUNT(*) DESC LIMIT 1
SELECT Hometown FROM teacher GROUP BY Hometown HAVING COUNT(*) >= 2; 
SELECT Hometown FROM teacher GROUP BY Hometown HAVING COUNT(*) >= 2
SELECT T2.Name, T3.Course FROM course_arrange AS T1 INNER JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID INNER JOIN course AS T3 ON T1.Course_ID = T3.Course_ID; 
SELECT T2.Name ,  T1.Course FROM course AS T1 INNER JOIN teacher AS T2 ON T1.Course_ID = T2.Teacher_ID
SELECT T2.Name, T3.Course FROM course_arrange AS T1 INNER JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID INNER JOIN course AS T3 ON T1.Course_ID = T3.Course_ID ORDER BY T2.Name ASC
SELECT T1.Name, T3.Course FROM teacher AS T1 INNER JOIN course_arrange AS T2 ON T1.Teacher_ID = T2.Teacher_ID INNER JOIN course AS T3 ON T2.Course_ID = T3.Course_ID ORDER BY T1.Name ASC
SELECT T2.Name FROM course AS T1 INNER JOIN teacher AS T2 ON T1.Course_ID = T2.Teacher_ID WHERE T1.Course = 'Math' 
SELECT T2.Name FROM course AS T1 INNER JOIN teacher AS T2 ON T1.Course_ID = T3.Course_ID WHERE T1.Course = 'Math'
SELECT T2.Name, COUNT(*) AS Course_Count FROM course_arrange AS T1 INNER JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T2.Name; 
SELECT T2.Name, COUNT(*) AS Course_Count FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T2.Name; 
SELECT T.Name FROM teacher AS T JOIN course_arrange AS CA ON T.Teacher_ID = CA.Teacher_ID GROUP BY T.Name HAVING COUNT(CA.Course_ID) >= 2
SELECT T.Name FROM teacher AS T JOIN course_arrange AS CA ON T.Teacher_ID = CA.Teacher_ID GROUP BY T.Name HAVING COUNT(CA.Course_ID) >= 2; 
SELECT Name FROM teacher WHERE Teacher_ID NOT IN (SELECT Teacher_ID FROM course_arrange)
SELECT Name FROM teacher WHERE Teacher_ID NOT IN (SELECT Teacher_ID FROM course_arrange)
SELECT COUNT(*) FROM visitor WHERE Age < 30
SELECT Name FROM visitor WHERE Level_of_membership > 4 ORDER BY Level_of_membership DESC
SELECT AVG(Age) FROM visitor WHERE Level_of_membership <= 4; 
SELECT Name, Level_of_membership FROM visitor WHERE Level_of_membership > 4 ORDER BY Age DESC; 
SELECT Museum_ID, Name FROM museum ORDER BY Num_of_Staff DESC LIMIT 1
SELECT AVG(Num_of_Staff) FROM museum WHERE Open_Year < '2009'
SELECT Open_Year, Num_of_Staff FROM museum WHERE Name = 'Plaza Museum'; 
SELECT Name FROM museum WHERE Num_of_Staff > ( SELECT MIN(Num_of_Staff) FROM museum WHERE Open_Year > 2010 )
SELECT visitor_ID, Name, Age FROM visitor WHERE ID IN ( SELECT visitor_ID FROM visit GROUP BY visitor_ID HAVING COUNT(*) > 1 )
SELECT v.ID, v.Name, v.Level_of_membership FROM visitor v JOIN (     SELECT visitor_ID, SUM(Total_spent) AS Total_Spent     FROM visit     GROUP BY visitor_ID ) sub ON v.ID = sub.visitor_ID ORDER BY sub.Total_Spent DESC LIMIT 1; 
SELECT T1.Museum_ID, T1.Name FROM museum AS T1 JOIN visit AS T2 ON T1.Museum_ID = T2.Museum_ID GROUP BY T1.Museum_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT Name FROM museum WHERE Museum_ID NOT IN (SELECT Museum_ID FROM visit); 
SELECT v.Name, v.Age FROM visitor v JOIN visit vi ON v.ID = vi.visitor_ID WHERE vi.Num_of_Ticket = (SELECT MAX(Num_of_Ticket) FROM visit); 
SELECT AVG(Num_of_Ticket) AS Average_Tickets, MAX(Num_of_Ticket) AS Maximum_Tickets FROM visit; 
SELECT SUM(Total_spent) FROM visit WHERE visitor_ID IN (SELECT ID FROM visitor WHERE Level_of_membership = 1);
SELECT v.Name FROM visitor v JOIN visit vi ON v.ID = vi.visitor_ID JOIN museum m ON vi.Museum_ID = m.Museum_ID WHERE m.Open_Year < '2009' INTERSECT SELECT v.Name FROM visitor v JOIN visit vi ON v.ID = vi.visitor_ID JOIN museum m ON vi.Museum_ID = m.Museum_ID WHERE m.Open_Year > '2011'; 
SELECT COUNT(DISTINCT visitor_ID) FROM visit WHERE visitor_ID NOT IN (SELECT ID FROM visitor WHERE ID IN (SELECT visitor_ID FROM visit JOIN museum ON visit.Museum_ID = museum.Museum_ID WHERE Open_Year > '2010'))
SELECT COUNT(*) FROM museum WHERE Open_Year > '2013' OR Open_Year < '2008'
SELECT COUNT(*) FROM players; 
SELECT COUNT(*) FROM players; 
SELECT COUNT(*) FROM matches; 
SELECT COUNT(*) FROM matches; 
SELECT first_name, birth_date FROM players WHERE country_code = 'USA'
SELECT first_name, birth_date FROM players WHERE country_code = 'USA'; 
SELECT AVG(loser_age) AS avg_loser_age, AVG(winner_age) AS avg_winner_age FROM matches; 
SELECT AVG(loser_age) AS avg_loser_age, AVG(winner_age) AS avg_winner_age FROM matches;
SELECT AVG(winner_rank) FROM matches
SELECT AVG(winner_rank) FROM matches
SELECT MAX(loser_rank) AS highest_lose_rank FROM matches; 
SELECT MIN(loser_rank) FROM matches
SELECT COUNT(DISTINCT country_code) FROM players;
SELECT COUNT(DISTINCT country_code) FROM players;
SELECT COUNT(DISTINCT loser_name) FROM matches
SELECT COUNT(DISTINCT loser_name) FROM matches
SELECT tourney_name FROM matches GROUP BY tourney_name HAVING COUNT(*) > 10;
SELECT tournament_name FROM matches GROUP BY tournament_name HAVING COUNT(*) > 10; 
SELECT DISTINCT w1.winner_name FROM matches m1 JOIN players w1 ON m1.winner_id = w1.player_id WHERE m1.year = 2013 INTERSECT SELECT DISTINCT w2.winner_name FROM matches m2 JOIN players w2 ON m2.winner_id = w2.player_id WHERE m2.year = 2016; 
SELECT DISTINCT w1.winner_name  FROM matches AS w1  JOIN matches AS w2 ON w1.winner_id = w2.loser_id  WHERE w1.year = 2013 AND w2.year = 2016; 
SELECT COUNT(*) FROM matches WHERE YEAR = 2013 OR YEAR = 2016; 
SELECT COUNT(*) FROM matches WHERE YEAR = 2013 OR YEAR = 2016; 
SELECT p.country_code, p.first_name FROM players p JOIN matches m ON p.player_id = m.winner_id WHERE m.tourney_name = 'WTA Championships' INTERSECT SELECT p.country_code, p.first_name FROM players p JOIN matches m ON p.player_id = m.winner_id WHERE m.tourney_name = 'Australian Open'
SELECT p.first_name, p.country_code FROM players p WHERE EXISTS (     SELECT 1     FROM matches m     WHERE m.winner_id = p.player_id       AND m.tourney_name = 'WTA Championships' ) AND EXISTS (     SELECT 1     FROM matches m     WHERE m.winner_id = p.player_id       AND m.tourney_name = 'Australian Open' ); 
SELECT first_name, country_code FROM players ORDER BY birth_date ASC LIMIT 1
SELECT first_name, country_code FROM players ORDER BY birth_date ASC LIMIT 1; 
SELECT first_name, last_name FROM players ORDER BY birth_date; 
SELECT first_name, last_name FROM players ORDER BY birth_date; 
SELECT first_name, last_name FROM players WHERE hand = 'L' ORDER BY birth_date;
SELECT first_name, last_name FROM players WHERE hand = 'L' ORDER BY birth_date; 
SELECT p.first_name, p.country_code FROM players p JOIN rankings r ON p.player_id = r.player_id GROUP BY p.player_id ORDER BY SUM(r.tours) DESC LIMIT 1; 
SELECT T1.first_name, T1.country_code FROM players AS T1 JOIN rankings AS T2 ON T1.player_id = T2.player_id GROUP BY T1.player_id ORDER BY SUM(T2.tours) DESC LIMIT 1
SELECT YEAR FROM matches GROUP BY YEAR ORDER BY COUNT(*) DESC LIMIT 1
SELECT YEAR FROM matches GROUP BY YEAR ORDER BY COUNT(*) DESC LIMIT 1
SELECT p.winner_name, r.ranking_points FROM matches m JOIN players p ON m.winner_id = p.player_id JOIN rankings r ON p.player_id = r.player_id WHERE m.winner_name IS NOT NULL GROUP BY p.winner_name, r.ranking_points ORDER BY COUNT(m.match_num) DESC LIMIT 1; 
SELECT T2.winner_name ,  SUM(T1.ranking_points) FROM rankings AS T1 INNER JOIN players AS T2 ON T1.player_id = T2.player_id GROUP BY T2.winner_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.winner_name FROM matches AS T1 JOIN players AS T2 ON T1.winner_id = T2.player_id WHERE T1.tourney_name = 'Australian Open' ORDER BY T2.ranking_points DESC LIMIT 1
SELECT T2.winner_name FROM matches AS T1 INNER JOIN players AS T2 ON T1.winner_id = T2.player_id WHERE T1.tourney_name = 'Australian Open' ORDER BY T2.ranking_points DESC LIMIT 1
SELECT winner_name, loser_name FROM matches ORDER BY minutes DESC LIMIT 1; 
SELECT T1.winner_name, T1.loser_name FROM matches AS T1 ORDER BY minutes DESC LIMIT 1
SELECT AVG(ranking), p.first_name FROM players p JOIN rankings r ON p.player_id = r.player_id GROUP BY p.player_id, p.first_name
SELECT T1.first_name ,  AVG(T2.ranking) FROM players AS T1 INNER JOIN rankings AS T2 ON T1.player_id = T2.player_id GROUP BY T1.player_id
SELECT p.player_id, p.first_name, SUM(r.ranking_points) AS total_ranking_points FROM players p JOIN rankings r ON p.player_id = r.player_id GROUP BY p.player_id, p.first_name
SELECT p.first_name, SUM(r.ranking_points) AS total_ranking_points FROM players p JOIN rankings r ON p.player_id = r.player_id GROUP BY p.player_id, p.first_name; 
SELECT COUNT(player_id) AS num_players, country_code FROM players GROUP BY country_code
SELECT country_code, COUNT(*) AS player_count FROM players GROUP BY country_code; 
SELECT country_code FROM players GROUP BY country_code ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT country_code FROM players GROUP BY country_code ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT country_code FROM players GROUP BY country_code HAVING COUNT(player_id) > 50
SELECT country_code FROM players GROUP BY country_code HAVING COUNT(player_id) > 50
SELECT ranking_date, SUM(tours) AS total_tours FROM rankings GROUP BY ranking_date; 
SELECT ranking_date, SUM(tours) AS total_tours FROM rankings GROUP BY ranking_date; 
SELECT YEAR, COUNT(*) FROM matches GROUP BY YEAR; 
SELECT YEAR, COUNT(*) FROM matches GROUP BY YEAR; 
SELECT T1.first_name ,  T1.last_name ,  T1.rank FROM players AS T1 INNER JOIN matches AS T2 ON T1.player_id = T2.winner_id ORDER BY T1.birth_date DESC LIMIT 3
SELECT T1.first_name ,  T1.last_name ,  T1.ranking FROM players AS T1 JOIN matches AS T2 ON T1.player_id = T2.winner_id ORDER BY T2.winner_age ASC LIMIT 3
SELECT COUNT(DISTINCT m.winner_id) FROM matches m JOIN players p ON m.winner_id = p.player_id WHERE m.tourney_name = 'WTA Championships' AND p.hand = 'L'; 
SELECT COUNT(*) FROM players AS p JOIN matches AS m ON p.player_id = m.winner_id WHERE p.hand = 'L' AND m.tourney_name = 'WTA Championships'; 
SELECT T1.first_name, T1.country_code, T1.birth_date FROM players AS T1 JOIN matches AS T2 ON T1.player_id = T2.winner_id ORDER BY T1.rank_points DESC LIMIT 1
SELECT p.first_name, p.country_code, p.birth_date FROM players p JOIN (     SELECT winner_id, SUM(winner_rank_points) AS total_points     FROM matches     GROUP BY winner_id ) m ON p.player_id = m.winner_id ORDER BY m.total_points DESC LIMIT 1; 
SELECT hand ,  COUNT(*) FROM players GROUP BY hand
SELECT hand ,  COUNT(*) FROM players GROUP BY hand
SELECT COUNT(*) FROM ship WHERE disposition_of_ship = 'Captured'; 
SELECT name ,  tonnage FROM ship ORDER BY name DESC
SELECT name, date, result FROM battle; 
SELECT MAX(killed) AS max_death_toll, MIN(killed) AS min_death_toll FROM death
SELECT AVG(injured) AS average_injuries FROM death; 
SELECT d.killed, d.injured FROM death AS d JOIN ship AS s ON d.caused_by_ship_id = s.id WHERE s.tonnage = 't'; 
SELECT name, result FROM battle WHERE bulgarian_commander != 'Boril'; 
SELECT DISTINCT T1.id, T1.name FROM battle AS T1 JOIN ship AS T2 ON T1.id = T2.lost_in_battle WHERE T2.ship_type = 'Brig'; 
SELECT T1.id ,  T1.name FROM battle AS T1 JOIN ship AS T2 ON T1.id  =  T2.lost_in_battle JOIN death AS T3 ON T2.id  =  T3.caused_by_ship_id GROUP BY T1.id HAVING SUM(T3.killed)  >  10
SELECT s.id, s.name  FROM ship s  JOIN death d ON s.id = d.caused_by_ship_id  GROUP BY s.id, s.name  ORDER BY SUM(d.injured) DESC  LIMIT 1; 
SELECT DISTINCT name FROM battle WHERE bulgarian_commander = 'Kaloyan' AND latin_commander = 'Baldwin I';
SELECT COUNT(DISTINCT result) AS number_of_different_results FROM battle; 
SELECT COUNT(*) FROM battle WHERE id NOT IN (SELECT lost_in_battle FROM ship WHERE tonnage = '225'); 
SELECT b.name, b.date  FROM battle b  JOIN ship s ON b.id = s.lost_in_battle  WHERE s.name IN ('Lettice', 'HMS Atalanta'); 
SELECT b.name, b.result, b.bulgarian_commander FROM battle b WHERE b.id NOT IN (SELECT s.lost_in_battle FROM ship s WHERE s.location = 'English Channel'); 
SELECT note FROM death WHERE note LIKE '%East%'; 
SELECT line_1, line_2 FROM Addresses; 
SELECT line_1, line_2 FROM Addresses; 
SELECT COUNT(*) FROM Courses;
SELECT COUNT(course_id) FROM Courses;
SELECT course_description FROM Courses WHERE course_name = 'math'
SELECT course_description FROM Courses WHERE course_name = 'math'
SELECT zip_postcode FROM Addresses WHERE city = 'Port Chelsea'
SELECT zip_postcode FROM Addresses WHERE city = 'Port Chelsea'
SELECT T1.department_name ,  T1.department_id FROM DEPARTMENTS AS T1 INNER JOIN degree_programs AS T2 ON T1.department_id = T2.department_id GROUP BY T1.department_id ORDER BY COUNT(T2.degree_program_id) DESC LIMIT 1
SELECT T2.department_name ,  T1.department_id FROM Degree_Programs AS T1 INNER JOIN Departments AS T2 ON T1.department_id = T2.department_id GROUP BY T1.department_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(DISTINCT department_id) FROM Degree_Programs
SELECT COUNT(DISTINCT department_id) FROM Degree_Programs
SELECT COUNT(DISTINCT degree_summary_name) FROM Degree_Programs
SELECT COUNT(DISTINCT degree_summary_name) FROM Degree_Programs
SELECT COUNT(degree_program_id) FROM Degree_Programs WHERE department_id = (SELECT department_id FROM Departments WHERE department_name = 'engineering'); 
SELECT COUNT(degree_program_id) FROM Degree_Programs WHERE department_id = ( SELECT department_id FROM Departments WHERE department_name = 'engineering' )
SELECT section_name ,  section_description FROM Sections
SELECT section_name ,  section_description FROM Sections;
SELECT course_name ,  course_id FROM Courses WHERE course_id IN ( SELECT course_id FROM Sections GROUP BY course_id HAVING COUNT(section_id) <= 2 )
SELECT T1.course_name ,  T1.course_id FROM Courses AS T1 JOIN Sections AS T2 ON T1.course_id = T2.course_id GROUP BY T1.course_id HAVING COUNT(T2.section_id) < 2
SELECT section_name FROM sections ORDER BY section_name DESC
SELECT section_name FROM Sections ORDER BY section_name DESC
SELECT T2.semester_name ,  T2.semester_id FROM Students AS T1 INNER JOIN Semesters AS T2 ON T1.date_first_registered BETWEEN T2.start_date AND T2.end_date GROUP BY T2.semester_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.semester_name ,  T1.semester_id FROM Semesters AS T1 JOIN Student_Enrolment AS T2 ON T1.semester_id = T2.semester_id GROUP BY T1.semester_name ORDER BY COUNT(T2.student_id) DESC LIMIT 1;
SELECT department_description FROM Departments WHERE department_name LIKE '%computer%'
SELECT department_description FROM Departments WHERE department_name LIKE '%computer%'
SELECT s.first_name, s.middle_name, s.last_name, s.student_id FROM Students AS s JOIN Student_Enrolment AS se ON s.student_id = se.student_id GROUP BY s.student_id HAVING COUNT(DISTINCT se.degree_program_id) = 2;
SELECT s.first_name, s.middle_name, s.last_name, s.student_id FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id GROUP BY s.student_id HAVING COUNT(DISTINCT se.degree_program_id) = 2; 
SELECT S.first_name, S.middle_name, S.last_name FROM Students AS S JOIN Student_Enrolment AS SE ON S.student_id = SE.student_id JOIN Degree_Programs AS DP ON SE.degree_program_id = DP.degree_program_id WHERE DP.degree_summary_name = 'Bachelor'
SELECT s.first_name, s.middle_name, s.last_name  FROM Students s  JOIN Student_Enrolment se ON s.student_id = se.student_id  JOIN Degree_Programs dp ON se.degree_program_id = dp.degree_program_id  WHERE dp.degree_summary_name = 'Bachelor'; 
SELECT T2.degree_summary_name FROM Student_Enrolment AS T1 INNER JOIN Degree_Programs AS T2 ON T1.degree_program_id = T2.degree_program_id GROUP BY T2.degree_summary_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.degree_summary_name FROM Degree_Programs AS T1 INNER JOIN Student_Enrolment AS T2 ON T1.degree_program_id = T2.degree_program_id GROUP BY T1.degree_summary_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT degree_program_id, degree_summary_name FROM Degree_Programs WHERE degree_program_id = (SELECT degree_program_id FROM Student_Enrolment GROUP BY degree_program_id ORDER BY COUNT(student_id) DESC LIMIT 1) 
SELECT T2.degree_program_id ,  T2.degree_summary_name FROM Student_Enrolment AS T1 INNER JOIN Degree_Programs AS T2 ON T1.degree_program_id = T2.degree_program_id GROUP BY T2.degree_program_id ORDER BY COUNT(T1.student_id) DESC LIMIT 1
SELECT T1.student_id ,  T1.first_name ,  T1.middle_name ,  T1.last_name ,  COUNT(T2.degree_program_id) AS num_enrollments FROM Students AS T1 INNER JOIN Student_Enrolment AS T2 ON T1.student_id = T2.student_id GROUP BY T1.student_id ORDER BY num_enrollments DESC LIMIT 1;
SELECT T1.first_name, T1.middle_name, T1.last_name, T1.student_id ,  COUNT(*) FROM Students AS T1 INNER JOIN Student_Enrolment AS T2 ON T1.student_id = T2.student_id GROUP BY T1.student_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT semester_name FROM Semesters WHERE semester_id NOT IN (SELECT semester_id FROM Student_Enrolment)
SELECT semester_name FROM semesters WHERE semester_id NOT IN (SELECT semester_id FROM student_enrolment)
SELECT DISTINCT T1.course_name FROM Courses AS T1 JOIN Student_Enrolment_Courses AS T2 ON T1.course_id = T2.course_id
SELECT course_name FROM Courses WHERE course_id IN (SELECT course_id FROM Student_Enrolment_Courses);
SELECT T2.course_name FROM Student_Enrolment_Courses AS T1 INNER JOIN Courses AS T2 ON T1.course_id = T2.course_id GROUP BY T2.course_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.course_name FROM Courses AS T1 JOIN Student_Enrolment_Courses AS T2 ON T1.course_id = T2.course_id GROUP BY T1.course_name ORDER BY COUNT(T2.student_enrolment_id) DESC LIMIT 1
SELECT T1.last_name FROM Students AS T1 INNER JOIN Addresses AS T2 ON T1.current_address_id = T2.address_id WHERE T2.state_province_county = 'North Carolina' AND T1.student_id NOT IN ( SELECT student_id FROM Student_Enrolment )
SELECT s.last_name FROM Students s JOIN Addresses a ON s.current_address_id = a.address_id WHERE a.state_province_county = 'North Carolina' AND s.student_id NOT IN ( SELECT se.student_id FROM Student_Enrolment se )
SELECT T1.transcript_date ,  T1.transcript_id FROM TRANSCRIPTS AS T1 INNER JOIN Transcript_Contents AS T2 ON T1.transcript_id = T2.transcript_id GROUP BY T1.transcript_id HAVING COUNT(*) >= 2
SELECT T2.transcript_date ,  T1.transcript_id FROM transcripts AS T1 INNER JOIN transcript_contents AS T2 ON T1.transcript_id = T2.transcript_id GROUP BY T1.transcript_id HAVING COUNT(*) >= 2
SELECT cell_mobile_number FROM Students WHERE first_name = 'Timmothy' AND last_name = 'Ward';
SELECT cell_mobile_number FROM Students WHERE first_name = 'Timmothy' AND last_name = 'Ward';
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_first_registered ASC LIMIT 1
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_first_registered ASC LIMIT 1
SELECT first_name, middle_name, last_name FROM Students WHERE date_left IS NOT NULL ORDER BY date_left ASC LIMIT 1
SELECT first_name, middle_name, last_name FROM Students WHERE date_left IS NOT NULL ORDER BY date_left ASC LIMIT 1
SELECT first_name FROM Students WHERE current_address_id != permanent_address_id
SELECT first_name FROM Students WHERE current_address_id != permanent_address_id;
SELECT T2.address_id, T2.line_1, T2.line_2, T2.line_3 FROM Students AS T1 INNER JOIN Addresses AS T2 ON T1.current_address_id = T2.address_id GROUP BY T2.address_id ORDER BY COUNT(T1.student_id) DESC LIMIT 1
SELECT A.address_id, A.line_1, A.line_2 FROM Addresses AS A JOIN Students AS S ON A.address_id = S.current_address_id GROUP BY A.address_id, A.line_1, A.line_2 ORDER BY COUNT(S.student_id) DESC LIMIT 1; 
SELECT AVG(transcript_date) FROM Transcripts;
SELECT AVG(transcript_date) AS average_transcript_date FROM Transcripts; 
SELECT transcript_date, other_details FROM TRANSCRIPTS ORDER BY transcript_date ASC LIMIT 1; 
SELECT MIN(transcript_date), other_details FROM Transcripts;
SELECT COUNT(transcript_id) AS total_transcripts FROM Transcripts; 
SELECT COUNT(transcript_id) AS total_transcripts FROM Transcripts; 
SELECT MAX(transcript_date) FROM Transcripts;
SELECT MAX(transcript_date) FROM Transcripts;
SELECT student_enrolment_id ,  COUNT(DISTINCT transcript_id) FROM Transcript_Contents GROUP BY student_enrolment_id ORDER BY COUNT(DISTINCT transcript_id) DESC LIMIT 1
SELECT T1.course_id, COUNT(DISTINCT T2.transcript_id) AS max_appearances FROM Student_Enrolment_Courses AS T1 JOIN Transcript_Contents AS T2 ON T1.student_course_id = T2.student_course_id GROUP BY T1.course_id ORDER BY max_appearances DESC LIMIT 1; 
SELECT transcript_date, transcript_id FROM Transcripts WHERE transcript_id IN (     SELECT transcript_id FROM Transcript_Contents GROUP BY transcript_id ORDER BY COUNT(*) ASC LIMIT 1 ) 
SELECT transcript_date ,  transcript_id FROM TRANSCRIPTS WHERE transcript_id IN ( SELECT transcript_id FROM transcript_contents GROUP BY transcript_id ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT semester_name FROM semesters WHERE semester_id IN (     SELECT semester_id FROM student_enrolment WHERE degree_program_id = (         SELECT degree_program_id FROM degree_programs WHERE degree_summary_name = 'Master'     ) INTERSECT     SELECT semester_id FROM student_enrolment WHERE degree_program_id = (         SELECT degree_program_id FROM degree_programs WHERE degree_summary_name = 'Bachelor'     ) ) 
SELECT semester_id FROM Student_Enrolment WHERE degree_program_id IN ( SELECT degree_program_id FROM Degree_Programs WHERE degree_summary_name IN ('Master', 'Bachelor') ) GROUP BY semester_id HAVING COUNT(DISTINCT degree_program_id) > 1
SELECT COUNT(DISTINCT current_address_id) FROM Students
SELECT DISTINCT Addresses.line_1, Addresses.line_2, Addresses.line_3, Addresses.city, Addresses.zip_postcode, Addresses.state_province_county, Addresses.country FROM Addresses INNER JOIN Students ON Addresses.address_id = Students.current_address_id
SELECT * FROM Students ORDER BY first_name DESC, middle_name DESC, last_name DESC; 
SELECT other_student_details FROM Students ORDER BY last_name DESC, first_name DESC
SELECT * FROM Sections WHERE section_name = 'h'; 
SELECT section_description FROM Sections WHERE section_name = 'h'
SELECT T.first_name FROM Students AS T WHERE T.permanent_address_id IN ( SELECT address_id FROM Addresses WHERE country = 'Haiti' ) OR T.cell_mobile_number = '09700166582'
SELECT first_name FROM Students WHERE permanent_address_id IN (SELECT address_id FROM Addresses WHERE country = 'Haiti') OR cell_mobile_number = '09700166582'; 
SELECT Title FROM Cartoon ORDER BY Title ASC
SELECT Title FROM Cartoon ORDER BY Title ASC
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones'
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones'
SELECT COUNT(*) FROM Cartoon WHERE Written_by = 'Joseph Kuhr'; 
SELECT COUNT(*) FROM Cartoon WHERE Written_by = 'Joseph Kuhr'; 
SELECT Title , Directed_by FROM Cartoon ORDER BY Original_air_date
SELECT Title , Directed_by FROM Cartoon ORDER BY Original_air_date
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones' OR Directed_by = 'Brandon Vietti'
SELECT Title FROM Cartoon WHERE Directed_by IN ('Ben Jones', 'Brandon Vietti')
SELECT Country, COUNT(*) AS Number_of_Channels FROM TV_Channel GROUP BY Country ORDER BY Number_of_Channels DESC LIMIT 1; 
SELECT Country, COUNT(*) AS Number_of_Channels FROM TV_Channel GROUP BY Country ORDER BY Number_of_Channels DESC LIMIT 1; 
SELECT COUNT(DISTINCT series_name), COUNT(DISTINCT Content) FROM TV_Channel;
SELECT COUNT(DISTINCT series_name), COUNT(DISTINCT Content) FROM TV_Channel; 
SELECT Content FROM TV_Channel WHERE series_name = 'Sky Radio'; 
SELECT Content FROM TV_Channel WHERE series_name = 'Sky Radio'; 
SELECT Package_Option FROM TV_Channel WHERE series_name = 'Sky Radio'
SELECT Package_Option FROM TV_Channel WHERE series_name = 'Sky Radio'
SELECT COUNT(*) FROM TV_Channel WHERE Language = 'English'
SELECT COUNT(*) FROM TV_Channel WHERE Language = 'English';
SELECT Language ,  COUNT(*) FROM TV_Channel GROUP BY Language ORDER BY COUNT(*) ASC LIMIT 1
SELECT Language ,  COUNT(*) FROM TV_Channel GROUP BY Language ORDER BY COUNT(*) ASC LIMIT 1
SELECT Language, COUNT(*) FROM TV_Channel GROUP BY Language; 
SELECT Language, COUNT(*) AS Number_of_Channels FROM TV_Channel GROUP BY Language; 
SELECT T1.series_name FROM TV_Channel AS T1 INNER JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Title = 'The Rise of the Blue Beetle!'
SELECT T2.series_name FROM Cartoon AS T1 INNER JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T1.Title = 'The Rise of the Blue Beetle!'; 
SELECT T2.Title FROM TV_Channel AS T1 INNER JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T1.series_name = 'Sky Radio'
SELECT T2.Title FROM TV_Channel AS T1 INNER JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T1.series_name = 'Sky Radio'
SELECT Episode FROM TV_series ORDER BY Rating DESC; 
SELECT Episode FROM TV_series ORDER BY Rating;
SELECT Episode, Rating FROM TV_series ORDER BY Rating DESC LIMIT 3; 
SELECT Episode, Rating FROM TV_series ORDER BY Rating DESC LIMIT 3; 
SELECT MIN(Share) , MAX(Share) FROM TV_series
SELECT MAX(Share) ,  MIN(Share) FROM TV_series
SELECT Air_Date FROM TV_series WHERE Episode = 'A Love of a Lifetime'
SELECT Air_Date FROM TV_series WHERE Episode = 'A Love of a Lifetime'
SELECT Weekly_Rank FROM TV_series WHERE Episode = 'A Love of a Lifetime'
SELECT Weekly_Rank FROM TV_series WHERE Episode = 'A Love of a Lifetime'
SELECT T1.series_name FROM TV_Channel AS T1 INNER JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T2.Episode = 'A Love of a Lifetime'
SELECT T2.series_name FROM TV_series AS T1 INNER JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T1.Episode = 'A Love of a Lifetime'
SELECT T2.Episode FROM TV_Channel AS T1 INNER JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T1.series_name = 'Sky Radio'; 
SELECT T2.Episode FROM TV_Channel AS T1 INNER JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T1.series_name = 'Sky Radio'
SELECT Directed_by, COUNT(*) AS Number_of_Cartoons FROM Cartoon GROUP BY Directed_by; 
SELECT directed_by ,  COUNT(*) FROM Cartoon GROUP BY directed_by
SELECT Production_code, Channel FROM Cartoon ORDER BY Original_air_date DESC LIMIT 1; 
SELECT Production_code, Channel FROM Cartoon ORDER BY Original_air_date DESC LIMIT 1; 
SELECT T2.Package_Option, T1.series_name FROM TV_Channel AS T1 INNER JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T1.Hight_definition_TV = 'yes'; 
SELECT T2.Package_Option ,  T1.series_name FROM TV_Channel AS T1 INNER JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T1.Hight_definition_TV = 'yes'
SELECT DISTINCT T2.Country FROM Cartoon AS T1 INNER JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T1.Written_by = 'Todd Casey'
SELECT DISTINCT T1.Country FROM TV_Channel AS T1 INNER JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Written_by = 'Todd Casey'
SELECT Country FROM TV_Channel WHERE id NOT IN ( SELECT Channel FROM Cartoon WHERE Written_by = 'Todd Casey' )
SELECT Country FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Written_by = 'Todd Casey')
SELECT TC.series_name, TC.Country  FROM TV_Channel AS TC  JOIN Cartoon AS C ON TC.id = C.Channel  WHERE C.directed_by IN ('Ben Jones', 'Michael Chang') AND C.written_by IN ('Michael Chang', 'Ben Jones'); 
SELECT T2.series_name, T2.Country FROM Cartoon AS T1 INNER JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T1.directed_by IN ('Ben Jones', 'Michael Chang')
SELECT Pixel_aspect_ratio_PAR, Country FROM TV_Channel WHERE Language != 'English'; 
SELECT Pixel_aspect_ratio_PAR ,  Country FROM TV_Channel WHERE Language != 'English'
SELECT id FROM TV_Channel GROUP BY Country HAVING COUNT(id) > 2; 
SELECT id FROM TV_Channel GROUP BY series_name HAVING COUNT(*) > 2
SELECT id FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones') 
SELECT id FROM TV_Channel WHERE id NOT IN ( SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones' )
SELECT Package_Option FROM TV_Channel WHERE id NOT IN ( SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones' )
SELECT Package_Option FROM TV_Channel WHERE id NOT IN ( SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones' )
SELECT COUNT(*) FROM poker_player; 
SELECT COUNT(*) FROM poker_player; 
SELECT Earnings FROM poker_player ORDER BY Earnings DESC; 
SELECT Earnings FROM poker_player ORDER BY Earnings DESC;
SELECT Final_Table_Made, Best_Finish FROM poker_player
SELECT Final_Table_Made, Best_Finish FROM poker_player; 
SELECT AVG(Earnings) AS Average_Earnings FROM poker_player; 
SELECT AVG(Earnings) AS Average_Earnings FROM poker_player; 
SELECT Money_Rank FROM poker_player ORDER BY Earnings DESC LIMIT 1
SELECT Money_Rank FROM poker_player ORDER BY Earnings DESC LIMIT 1; 
SELECT MAX(Final_Table_Made) AS Max_Final_Tables_Made FROM poker_player WHERE Earnings < 200000; 
SELECT MAX(Final_Table_Made) FROM poker_player WHERE Earnings < 200000
SELECT T2.Name FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID
SELECT T2.Name FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID; 
SELECT p.Name FROM poker_player AS pp JOIN people AS p ON pp.People_ID = p.People_ID WHERE pp.Earnings > 300000; 
SELECT p.Name FROM poker_player pp JOIN people p ON pp.People_ID = p.People_ID WHERE pp.Earnings > 300000;
SELECT T2.Name FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Final_Table_Made ASC
SELECT T2.Name FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Final_Table_Made ASC
SELECT Birth_Date FROM people WHERE People_ID = (SELECT People_ID FROM poker_player ORDER BY Earnings ASC LIMIT 1); 
SELECT Birth_Date FROM people WHERE People_ID = (SELECT People_ID FROM poker_player ORDER BY Earnings ASC LIMIT 1) 
SELECT T1.Money_Rank FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T2.Height DESC LIMIT 1
SELECT T2.Money_Rank FROM people AS T1 INNER JOIN poker_player AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Height DESC LIMIT 1; 
SELECT AVG(p.Earnings) AS Average_Earnings FROM poker_player p JOIN people pp ON p.People_ID = pp.People_ID WHERE pp.Height > 200; 
SELECT AVG(T1.Earnings) FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID WHERE T2.Height > 200
SELECT T2.Name FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Earnings DESC
SELECT p.Name FROM people AS p JOIN poker_player AS pp ON p.People_ID = pp.People_ID ORDER BY pp.Earnings DESC; 
SELECT Nationality, COUNT(*) AS Number_of_People FROM people GROUP BY Nationality; 
SELECT Nationality, COUNT(*) AS Number_of_People FROM people GROUP BY Nationality; 
SELECT Nationality FROM people GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT Nationality FROM people GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT Nationality FROM people GROUP BY Nationality HAVING COUNT(*) >= 2
SELECT Nationality FROM people GROUP BY Nationality HAVING COUNT(*) >= 2
SELECT Name, Birth_Date FROM people ORDER BY Name ASC; 
SELECT Name, Birth_Date FROM people ORDER BY Name ASC; 
SELECT Name FROM people WHERE Nationality != 'Russia'
SELECT Name FROM people WHERE Nationality != 'Russia'
SELECT Name FROM people WHERE People_ID NOT IN (SELECT People_ID FROM poker_player)
SELECT Name FROM people WHERE People_ID NOT IN (SELECT People_ID FROM poker_player); 
SELECT COUNT(DISTINCT Nationality) FROM people; 
SELECT COUNT(DISTINCT Nationality) FROM people; 
SELECT COUNT(DISTINCT state) FROM AREA_CODE_STATE
SELECT T1.contestant_number ,  T1.contestant_name FROM CONTESTANTS AS T1 ORDER BY T1.contestant_name DESC
SELECT vote_id, phone_number, state FROM VOTES; 
SELECT MAX(area_code), MIN(area_code) FROM AREA_CODE_STATE;
SELECT MAX(created) FROM VOTES WHERE state = 'CA'; 
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name != 'Jessie Alloway'
SELECT DISTINCT state, created FROM VOTES; 
SELECT c.contestant_number, c.contestant_name FROM CONTESTANTS c JOIN VOTES v ON c.contestant_number = v.contestant_number GROUP BY c.contestant_number, c.contestant_name HAVING COUNT(v.vote_id) >= 2; 
SELECT C.contestant_number, C.contestant_name FROM CONTESTANTS AS C JOIN VOTES AS V ON C.contestant_number = V.contestant_number GROUP BY C.contestant_number ORDER BY COUNT(*) ASC LIMIT 1
SELECT COUNT(*) FROM VOTES WHERE state IN ('NY', 'CA'); 
SELECT COUNT(*) FROM CONTESTANTS WHERE contestant_number NOT IN (SELECT DISTINCT contestant_number FROM VOTES); 
SELECT state FROM VOTES GROUP BY state ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT V.created, V.state, V.phone_number FROM VOTES V JOIN CONTESTANTS C ON V.contestant_number = C.contestant_number WHERE C.contestant_name = 'Tabatha Gehling'; 
SELECT DISTINCT T1.area_code FROM AREA_CODE_STATE AS T1 JOIN VOTES AS T2 ON T1.state = T2.state JOIN CONTESTANTS AS T3 ON T2.contestant_number = T3.contestant_number WHERE T3.contestant_name IN ('Tabatha Gehling', 'Kelly Clauss') GROUP BY T1.area_code HAVING COUNT(DISTINCT T3.contestant_name) > 1; 
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name LIKE '%Al%'
SELECT Name FROM country WHERE IndepYear > 1950
SELECT Name FROM country WHERE IndepYear > 1950
SELECT COUNT(*) FROM country WHERE GovernmentForm = 'Republic'
SELECT COUNT(*) FROM country WHERE GovernmentForm = 'Republic'
SELECT SUM(SurfaceArea) FROM country WHERE Region = 'Caribbean'; 
SELECT SUM(SurfaceArea) FROM country WHERE Region = 'Caribbean'
SELECT Continent FROM country WHERE Name = 'Anguilla'; 
SELECT T1.Continent FROM country AS T1 INNER JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T2.Name = 'Anguilla'
SELECT T1.Region FROM country AS T1 INNER JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T2.Name = 'Kabul'
SELECT T1.Region FROM country AS T1 INNER JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T2.Name = 'Kabul'
SELECT Language FROM countrylanguage WHERE CountryCode = 'ABW' ORDER BY Percentage DESC LIMIT 1
SELECT Language FROM countrylanguage WHERE CountryCode = (SELECT Code FROM country WHERE Name = 'Aruba') ORDER BY Percentage DESC LIMIT 1
SELECT LifeExpectancy ,  Population FROM country WHERE Name = 'Brazil'
SELECT Population, LifeExpectancy FROM country WHERE Name = 'Brazil'; 
SELECT Region, Population FROM country WHERE Name = 'Angola'; 
SELECT Region, Population FROM country WHERE Name = 'Angola'
SELECT AVG(LifeExpectancy) FROM country WHERE Region = 'Central Africa'
SELECT AVG(LifeExpectancy) AS AverageLifeExpectancy FROM country WHERE Region = 'Central Africa'; 
SELECT Name FROM country WHERE Continent = 'Asia' ORDER BY LifeExpectancy ASC LIMIT 1
SELECT Name FROM country WHERE Continent = 'Asia' ORDER BY LifeExpectancy ASC LIMIT 1
SELECT SUM(T1.Population), MAX(T1.GNP) FROM country AS T1 WHERE T1.Continent = 'Asia'; 
SELECT SUM(Population), MAX(GNP) FROM country WHERE Continent = 'Asia'
SELECT AVG(LifeExpectancy) FROM country WHERE Continent = 'Africa' AND GovernmentForm = 'Republic'
SELECT AVG(LifeExpectancy) FROM country WHERE Continent = 'Africa' AND GovernmentForm = 'Republic'; 
SELECT SUM(SurfaceArea) FROM country WHERE Continent IN ('Asia', 'Europe')
SELECT SUM(SurfaceArea) FROM country WHERE Continent IN ('Asia', 'Europe')
SELECT SUM(Population) FROM city WHERE District = 'Gelderland'; 
SELECT SUM(Population) FROM city WHERE District = 'Gelderland'
SELECT AVG(GNP), SUM(Population) FROM country WHERE GovernmentForm = 'US Territory'
SELECT AVG(GNP), SUM(Population) FROM country WHERE Continent = 'North America' AND Region = 'United States'; 
SELECT COUNT(DISTINCT Language) FROM countrylanguage
SELECT COUNT(DISTINCT Language) FROM countrylanguage
SELECT COUNT(DISTINCT GovernmentForm) FROM country WHERE Continent = 'Africa'
SELECT COUNT(DISTINCT GovernmentForm) FROM country WHERE Continent = 'Africa'
SELECT COUNT(Language) FROM countrylanguage WHERE CountryCode = 'ABW'
SELECT COUNT(Language) FROM countrylanguage WHERE CountryCode = 'ABW'; 
SELECT COUNT(Language) FROM countrylanguage WHERE CountryCode = 'AFG' AND IsOfficial = 'T';
SELECT COUNT(Language) FROM countrylanguage WHERE CountryCode = 'AFG' AND IsOfficial = 'T';
SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode GROUP BY T1.Name ORDER BY COUNT(T2.Language) DESC LIMIT 1
SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode GROUP BY T1.Name ORDER BY COUNT(T2.Language) DESC LIMIT 1
SELECT T1.Continent FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode GROUP BY T1.Continent ORDER BY COUNT(DISTINCT T2.Language) DESC LIMIT 1
SELECT T1.Continent FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode GROUP BY T1.Continent ORDER BY COUNT(DISTINCT T2.Language) DESC LIMIT 1
SELECT COUNT(*) FROM countrylanguage WHERE CountryCode IN (     SELECT CountryCode FROM countrylanguage WHERE Language = 'English' ) AND Language = 'Dutch'; 
SELECT COUNT(CountryCode) FROM countrylanguage WHERE Language IN ('English', 'Dutch') AND IsOfficial = 'T';
SELECT c.Name FROM country AS c JOIN countrylanguage AS cl ON c.Code = cl.CountryCode WHERE cl.Language = 'English' INTERSECT SELECT c.Name FROM country AS c JOIN countrylanguage AS cl ON c.Code = cl.CountryCode WHERE cl.Language = 'French'; 
SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'English' INTERSECT SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'French'
SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'English' AND IsOfficial = 'T' INTERSECT SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'French' AND IsOfficial = 'T'
SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'English' AND T2.IsOfficial = 'T' INTERSECT SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'French' AND T2.IsOfficial = 'T'
SELECT COUNT(DISTINCT T1.Continent) FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'Chinese'
SELECT COUNT(DISTINCT Continent) FROM country WHERE Code IN (     SELECT CountryCode     FROM countrylanguage     WHERE Language = 'Chinese' ); 
SELECT T2.Region FROM countrylanguage AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T1.Language IN ('English', 'Dutch') 
SELECT T2.Region FROM countrylanguage AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T1.Language = 'Dutch' OR T1.Language = 'English'
SELECT T1.Name FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'English' OR T2.Language = 'Dutch' AND T2.IsOfficial = 'T'
SELECT T1.Name FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'English' OR T2.Language = 'Dutch'
SELECT T2.Language FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.Continent = 'Asia' ORDER BY T2.Percentage DESC LIMIT 1
SELECT Language FROM countrylanguage WHERE CountryCode IN ( SELECT Code FROM country WHERE Continent = 'Asia' ) GROUP BY Language ORDER BY COUNT(*) DESC LIMIT 1
SELECT Language FROM countrylanguage WHERE CountryCode IN (SELECT Code FROM country WHERE GovernmentForm = 'Republic') GROUP BY Language HAVING COUNT(DISTINCT CountryCode) = 1
SELECT T2.Language FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.GovernmentForm = 'Republic' GROUP BY T2.Language HAVING COUNT(T2.CountryCode) = 1
SELECT T1.Name FROM city AS T1 INNER JOIN countrylanguage AS T2 ON T1.CountryCode = T2.CountryCode WHERE T2.Language = 'English' ORDER BY T1.Population DESC LIMIT 1
SELECT T1.Name FROM city AS T1 INNER JOIN countrylanguage AS T2 ON T1.CountryCode = T2.CountryCode WHERE T2.Language = 'English' ORDER BY T1.Population DESC LIMIT 1
SELECT Name, Population, LifeExpectancy FROM country WHERE Continent = 'Asia' ORDER BY SurfaceArea DESC LIMIT 1; 
SELECT Name, Population, LifeExpectancy FROM country WHERE Continent = 'Asia' ORDER BY SurfaceArea DESC LIMIT 1; 
SELECT AVG(LifeExpectancy) FROM country WHERE Code NOT IN ( SELECT CountryCode FROM countrylanguage WHERE Language = 'English' AND IsOfficial = 'T' )
SELECT AVG(T2.LifeExpectancy) FROM countrylanguage AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T1.Language != 'English' AND T1.IsOfficial = 'F'
SELECT SUM(Population) FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English'); 
SELECT SUM(Population) FROM city WHERE CountryCode NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English') 
SELECT T2.Language FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.HeadOfState = 'Beatrix' AND T2.IsOfficial = 'T'; 
SELECT T3.Language FROM country AS T1 INNER JOIN countrylanguage AS T3 ON T1.Code = T3.CountryCode WHERE T1.HeadOfState = 'Beatrix' AND T3.IsOfficial = 'T'; 
SELECT COUNT(DISTINCT T1.Language) FROM countrylanguage AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T2.IndependenceYear < 1930 AND T1.IsOfficial = 'T'
SELECT COUNT(DISTINCT T2.Language) FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.IndepYear < 1930 AND T2.IsOfficial = 'T'; 
SELECT Name FROM country WHERE SurfaceArea > (SELECT MAX(SurfaceArea) FROM country WHERE Continent = 'Europe') 
SELECT Name FROM country WHERE SurfaceArea > (SELECT MAX(SurfaceArea) FROM country WHERE Continent = 'Europe') 
SELECT Name FROM country WHERE Continent = 'Africa' AND Population < ALL (SELECT MAX(Population) FROM country WHERE Continent = 'Asia')
SELECT Name FROM country WHERE Continent = 'Africa' AND Population < ALL (SELECT MAX(Population) FROM country WHERE Continent = 'Asia'); 
SELECT Name FROM country WHERE Continent = 'Asia' AND Population > ALL ( SELECT MAX(Population) FROM country WHERE Continent = 'Africa' )
SELECT Name FROM country WHERE Continent = 'Asia' AND Population > (SELECT MAX(Population) FROM country WHERE Continent = 'Africa'); 
SELECT CountryCode FROM countrylanguage WHERE Language != 'English'; 
SELECT CountryCode FROM countrylanguage WHERE Language != 'English'
SELECT CountryCode FROM countrylanguage WHERE Language != 'English'; 
SELECT CountryCode FROM countrylanguage WHERE Language != 'English'
SELECT Code FROM country WHERE GovernmentForm != 'Republic' AND Code NOT IN ( SELECT CountryCode FROM countrylanguage WHERE Language = 'English' )
SELECT Code FROM country WHERE Code NOT IN ( SELECT CountryCode FROM countrylanguage WHERE Language = 'English' ) AND GovernmentForm != 'Republic'
SELECT c.Name FROM city c JOIN country co ON c.CountryCode = co.Code JOIN countrylanguage cl ON co.Code = cl.CountryCode WHERE cl.Language = 'English' AND cl.IsOfficial = 'F' AND co.Continent = 'Europe'; 
SELECT T1.Name FROM city AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T2.Continent = 'Europe' AND T1.Name NOT IN ( SELECT T1.Name FROM city AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code INNER JOIN countrylanguage AS T3 ON T2.Code = T3.CountryCode WHERE T3.Language = 'English' AND T3.IsOfficial = 'T' )
SELECT DISTINCT c.Name FROM city c JOIN country co ON c.CountryCode = co.Code JOIN countrylanguage cl ON co.Code = cl.CountryCode WHERE co.Continent = 'Asia' AND cl.Language = 'Chinese' AND cl.IsOfficial = 'T'; 
SELECT DISTINCT T1.Name FROM city AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code INNER JOIN countrylanguage AS T3 ON T2.Code = T3.CountryCode WHERE T2.Continent = 'Asia' AND T3.Language = 'Chinese' AND T3.IsOfficial = 'T'; 
SELECT Name, IndepYear, SurfaceArea FROM country ORDER BY Population ASC LIMIT 1; 
SELECT Name, IndepYear, SurfaceArea FROM country ORDER BY Population ASC LIMIT 1
SELECT T1.Population, T1.Name, T1.HeadOfState FROM country AS T1 ORDER BY T1.SurfaceArea DESC LIMIT 1
SELECT Name, Population, HeadOfState FROM country ORDER BY SurfaceArea DESC LIMIT 1
SELECT T1.Name ,  COUNT(*) FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode GROUP BY T1.Name HAVING COUNT(*) >= 3
SELECT c.Name, COUNT(cl.Language) AS LanguageCount FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode GROUP BY c.Name HAVING LanguageCount > 2; 
SELECT District ,  COUNT(*) FROM city WHERE Population > ( SELECT AVG(Population) FROM city ) GROUP BY District
SELECT District, COUNT(*) AS CityCount FROM city WHERE Population > (     SELECT AVG(Population)     FROM city ) GROUP BY District; 
SELECT c.GovernmentForm, SUM(c.Population) AS TotalPopulation FROM country c GROUP BY c.GovernmentForm HAVING AVG(c.LifeExpectancy) > 72; 
SELECT T1.GovernmentForm, SUM(T1.Population) FROM country AS T1 JOIN city AS T2 ON T1.Code = T2.CountryCode GROUP BY T1.GovernmentForm HAVING AVG(T1.LifeExpectancy) > 72
SELECT T2.Continent ,  AVG(T2.LifeExpectancy) ,  SUM(T2.Population) FROM country AS T1 INNER JOIN city AS T2 ON T1.Code = T2.CountryCode GROUP BY T2.Continent HAVING AVG(T2.LifeExpectancy) < 72
SELECT Continent, SUM(Population), AVG(LifeExpectancy) FROM country GROUP BY Continent HAVING AVG(LifeExpectancy) < 72; 
SELECT Name ,  SurfaceArea FROM country ORDER BY SurfaceArea DESC LIMIT 5
SELECT Name, SurfaceArea FROM country ORDER BY SurfaceArea DESC LIMIT 5; 
SELECT Name FROM country ORDER BY Population DESC LIMIT 3
SELECT Name FROM country ORDER BY Population DESC LIMIT 3
SELECT Name FROM country ORDER BY Population ASC LIMIT 3
SELECT Name FROM country ORDER BY Population ASC LIMIT 3
SELECT COUNT(*) FROM country WHERE Continent = 'Asia'
SELECT COUNT(*) FROM country WHERE Continent = 'Asia'
SELECT Name FROM country WHERE Continent = 'Europe' AND Population > 80000
SELECT Name FROM country WHERE Continent = 'Europe' AND Population = 80000
SELECT SUM(Population), AVG(SurfaceArea) FROM country WHERE Continent = 'North America' AND SurfaceArea > 3000; 
SELECT SUM(Population), AVG(SurfaceArea) FROM country WHERE Continent = 'North America' AND SurfaceArea > 3000; 
SELECT Name FROM city WHERE Population BETWEEN 160000 AND 900000; 
SELECT Name FROM city WHERE Population BETWEEN 160000 AND 900000; 
SELECT Language FROM countrylanguage GROUP BY Language ORDER BY COUNT(*) DESC LIMIT 1
SELECT Language FROM countrylanguage GROUP BY Language ORDER BY COUNT(DISTINCT CountryCode) DESC LIMIT 1
SELECT c.Name, cl.Language FROM country AS c JOIN countrylanguage AS cl ON c.Code = cl.CountryCode WHERE cl.Percentage = ( SELECT MAX(Percentage) FROM countrylanguage WHERE CountryCode = c.Code )
SELECT CountryCode, Language FROM countrylanguage WHERE Percentage = ( SELECT MAX(Percentage) FROM countrylanguage GROUP BY CountryCode )
SELECT COUNT(CountryCode) FROM countrylanguage WHERE Language = 'Spanish' AND Percentage = ( SELECT MAX(Percentage) FROM countrylanguage WHERE Language = 'Spanish' ); 
SELECT COUNT(CountryCode) FROM countrylanguage WHERE Language = 'Spanish' AND Percentage >= 50;
SELECT CountryCode FROM countrylanguage WHERE Language = 'Spanish' ORDER BY Percentage DESC LIMIT 1
SELECT CountryCode FROM countrylanguage WHERE Language = 'Spanish' AND Percentage >= 50; 
SELECT COUNT(*) FROM conductor
SELECT COUNT(*) FROM conductor; 
SELECT Name FROM conductor ORDER BY Age ASC
SELECT Name FROM conductor ORDER BY Age;
SELECT Name FROM conductor WHERE Nationality != 'USA'
SELECT Name FROM conductor WHERE Nationality != 'USA'
SELECT Record_Company FROM orchestra ORDER BY Year_of_Founded DESC; 
SELECT Record_Company FROM orchestra ORDER BY Year_of_Founded DESC; 
SELECT AVG(Attendance) FROM show;
SELECT AVG(Attendance) FROM show; 
SELECT MAX(Share), MIN(Share) FROM performance WHERE Type != 'Live final'
SELECT MAX(Share), MIN(Share) FROM performance WHERE Type != 'Live final'; 
SELECT COUNT(DISTINCT Nationality) FROM conductor
SELECT COUNT(DISTINCT Nationality) FROM conductor
SELECT Name FROM conductor ORDER BY Year_of_Work DESC
SELECT Name FROM conductor ORDER BY Year_of_Work DESC
SELECT Name FROM conductor ORDER BY Year_of_Work DESC LIMIT 1
SELECT Name FROM conductor ORDER BY Year_of_Work DESC LIMIT 1
SELECT conductor.Name, orchestra.Orchestra FROM conductor JOIN orchestra ON conductor.Conductor_ID = orchestra.Conductor_ID
SELECT T1.Name ,  T2.Orchestra FROM conductor AS T1 INNER JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID
SELECT c.Name FROM conductor AS c JOIN orchestra AS o ON c.Conductor_ID = o.Conductor_ID GROUP BY c.Conductor_ID HAVING COUNT(o.Orchestra_ID) > 1; 
SELECT c.Name FROM conductor c JOIN orchestra o ON c.Conductor_ID = o.Conductor_ID GROUP BY c.Conductor_ID HAVING COUNT(o.Orchestra) > 1; 
SELECT c.Name FROM conductor AS c JOIN orchestra AS o ON c.Conductor_ID = o.Conductor_ID GROUP BY c.Name ORDER BY COUNT(o.Orchestra_ID) DESC LIMIT 1
SELECT c.Name FROM conductor c JOIN orchestra o ON c.Conductor_ID = o.Conductor_ID GROUP BY c.Name ORDER BY COUNT(o.Orchestra_ID) DESC LIMIT 1
SELECT T2.Name FROM orchestra AS T1 INNER JOIN conductor AS T2 ON T1.Conductor_ID = T2.Conductor_ID WHERE T1.Year_of_Founded > 2008
SELECT T2.Name FROM orchestra AS T1 INNER JOIN conductor AS T2 ON T1.Conductor_ID = T2.Conductor_ID WHERE T1.Year_of_Founded > 2008
SELECT Record_Company ,  COUNT(*) FROM orchestra GROUP BY Record_Company
SELECT Record_Company, COUNT(*) FROM orchestra GROUP BY Record_Company; 
SELECT Major_Record_Format FROM orchestra GROUP BY Major_Record_Format ORDER BY COUNT(*) ASC
SELECT Major_Record_Format FROM orchestra GROUP BY Major_Record_Format ORDER BY COUNT(*) DESC
SELECT Record_Company FROM orchestra GROUP BY Record_Company ORDER BY COUNT(*) DESC LIMIT 1
SELECT Record_Company FROM orchestra GROUP BY Record_Company ORDER BY COUNT(*) DESC LIMIT 1
SELECT Orchestra FROM orchestra WHERE Orchestra_ID NOT IN (SELECT Orchestra_ID FROM performance) 
SELECT orchestra FROM orchestra WHERE orchestra_id NOT IN (SELECT orchestra_id FROM performance)
SELECT Record_Company FROM orchestra WHERE Year_of_Founded < 2003 INTERSECT SELECT Record_Company FROM orchestra WHERE Year_of_Founded > 2003; 
SELECT Record_Company FROM orchestra WHERE Year_of_Founded < 2003 INTERSECT SELECT Record_Company FROM orchestra WHERE Year_of_Founded > 2003; 
SELECT COUNT(*) FROM orchestra WHERE Major_Record_Format IN ('CD', 'DVD'); 
SELECT COUNT(*) FROM orchestra WHERE Major_Record_Format IN ('CD', 'DVD'); 
SELECT Year_of_Founded FROM orchestra WHERE Orchestra_ID IN (SELECT Orchestra_ID FROM performance GROUP BY Orchestra_ID HAVING COUNT(*) > 1) 
SELECT o.Year_of_Founded FROM orchestra o JOIN performance p ON o.Orchestra_ID = p.Orchestra_ID GROUP BY o.Orchestra_ID HAVING COUNT(p.Performance_ID) > 1; 
SELECT COUNT(*) FROM Highschooler; 
SELECT COUNT(*) FROM Highschooler; 
SELECT name, grade FROM Highschooler; 
SELECT name, grade FROM Highschooler; 
SELECT DISTINCT grade FROM Highschooler; 
SELECT name, grade FROM Highschooler; 
SELECT grade FROM Highschooler WHERE name = 'Kyle'
SELECT grade FROM Highschooler WHERE name = 'Kyle'; 
SELECT name FROM Highschooler WHERE grade = 10; 
SELECT name FROM Highschooler WHERE grade = 10; 
SELECT ID FROM Highschooler WHERE name = 'Kyle'; 
SELECT ID FROM Highschooler WHERE name = 'Kyle'
SELECT COUNT(*) FROM Highschooler WHERE grade = 9 OR grade = 10; 
SELECT COUNT(*) FROM Highschooler WHERE grade IN (9, 10); 
SELECT grade ,  count(*) FROM Highschooler GROUP BY grade
SELECT grade, COUNT(*) FROM Highschooler GROUP BY grade; 
SELECT grade FROM Highschooler GROUP BY grade ORDER BY COUNT(*) DESC LIMIT 1
SELECT grade FROM Highschooler GROUP BY grade ORDER BY COUNT(*) DESC LIMIT 1
SELECT grade FROM Highschooler GROUP BY grade HAVING COUNT(*) >= 4
SELECT grade FROM Highschooler GROUP BY grade HAVING COUNT(*) >= 4
SELECT student_id, COUNT(friend_id) AS number_of_friends FROM Friend GROUP BY student_id; 
SELECT T1.name ,  count(*) FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID  =  T2.student_id GROUP BY T1.id
SELECT H.name, COUNT(F.friend_id) AS num_friends FROM Highschooler H JOIN Friend F ON H.ID = F.student_id GROUP BY H.ID; 
SELECT h.name, COUNT(f.friend_id) AS friend_count FROM Highschooler h LEFT JOIN Friend f ON h.ID = f.student_id GROUP BY h.ID; 
SELECT T1.name FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id GROUP BY T1.ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.name FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id GROUP BY T1.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT name FROM Highschooler WHERE ID IN (     SELECT student_id FROM Friend GROUP BY student_id HAVING COUNT(friend_id) >= 3 ) 
SELECT name FROM Highschooler WHERE ID IN (SELECT student_id FROM Friend GROUP BY student_id HAVING COUNT(friend_id) >= 3) 
SELECT T3.name FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id = T2.ID JOIN Highschooler AS T3 ON T1.friend_id = T3.ID WHERE T2.name = 'Kyle'
SELECT T1.name FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.friend_id WHERE T2.student_id IN (SELECT ID FROM Highschooler WHERE name = 'Kyle')
SELECT COUNT(*) FROM Friend WHERE student_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle')
SELECT COUNT(*) FROM Friend WHERE student_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle')
SELECT ID FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend)
SELECT ID FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend)
SELECT name FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend)
SELECT name FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend)
SELECT ID FROM Highschooler WHERE ID IN (SELECT student_id FROM Friend) AND ID IN (SELECT liked_id FROM Likes)
SELECT student_id FROM Friend INTERSECT SELECT student_id FROM Likes
SELECT DISTINCT H.name FROM Highschooler H JOIN Friend F ON H.ID = F.student_id JOIN Likes L ON H.ID = L.student_id; 
SELECT name FROM Highschooler WHERE ID IN (SELECT student_id FROM Friend) AND ID IN (SELECT liked_id FROM Likes);
SELECT student_id, COUNT(liked_id) AS like_count FROM Likes GROUP BY student_id; 
SELECT student_id, COUNT(liked_id) AS like_count FROM Likes GROUP BY student_id; 
SELECT T2.name ,  count(*) FROM Likes AS T1 JOIN Highschooler AS T2 ON T1.student_id = T2.id GROUP BY T1.student_id
SELECT T2.name ,  count(*) FROM Likes AS T1 JOIN Highschooler AS T2 ON T1.student_id = T2.id GROUP BY T1.student_id
SELECT T1.name FROM Highschooler AS T1 JOIN Likes AS T2 ON T1.ID = T2.student_id GROUP BY T1.ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.name FROM Likes AS T1 JOIN Highschooler AS T2 ON T1.student_id = T2.ID GROUP BY T1.student_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.name FROM Highschooler AS T1 JOIN Likes AS T2 ON T1.ID = T2.student_id GROUP BY T1.name HAVING COUNT(*) >= 2
SELECT T2.name FROM Likes AS T1 JOIN Highschooler AS T2 ON T1.student_id = T2.ID GROUP BY T1.student_id HAVING COUNT(*) >= 2
SELECT name FROM Highschooler WHERE grade > 5 AND ID IN (SELECT student_id FROM Friend GROUP BY student_id HAVING COUNT(friend_id) >= 2)
SELECT h.name FROM Highschooler h JOIN Friend f ON h.ID = f.student_id WHERE h.grade > 5 GROUP BY h.ID HAVING COUNT(f.friend_id) >= 2; 
SELECT COUNT(*) FROM Likes WHERE student_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle')
SELECT COUNT(*) FROM Likes WHERE student_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle')
SELECT AVG(grade) FROM Highschooler WHERE ID IN (SELECT student_id FROM Friend);
SELECT AVG(grade) FROM Highschooler WHERE ID IN (SELECT student_id FROM Friend)
SELECT MIN(grade) FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend);
SELECT MIN(grade) FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend)
SELECT state FROM Owners INTERSECT SELECT state FROM Professionals
SELECT state FROM Owners INTERSECT SELECT state FROM Professionals; 
SELECT AVG(age) FROM Dogs WHERE dog_id IN (SELECT dog_id FROM Treatments); 
SELECT AVG(age) FROM Dogs WHERE dog_id IN (SELECT dog_id FROM Treatments)
SELECT DISTINCT p.professional_id, p.last_name, p.cell_number FROM Professionals p JOIN Treatments t ON p.professional_id = t.professional_id WHERE p.state = 'Indiana' OR (     SELECT COUNT(*)     FROM Treatments     WHERE professional_id = p.professional_id ) > 2; 
SELECT DISTINCT p.professional_id, p.last_name, p.cell_number  FROM Professionals p  WHERE p.state = 'Indiana'  UNION  SELECT t.professional_id, p.last_name, p.cell_number  FROM Treatments t  JOIN Professionals p ON t.professional_id = p.professional_id  GROUP BY t.professional_id, p.last_name, p.cell_number  HAVING COUNT(t.treatment_id) > 2; 
SELECT D.name FROM Dogs AS D JOIN Treatments AS T ON D.dog_id = T.dog_id GROUP BY D.name HAVING SUM(T.cost_of_treatment) <= 1000;
SELECT d.name FROM Dogs d JOIN Owners o ON d.owner_id = o.owner_id WHERE (     SELECT SUM(t.cost_of_treatment)     FROM Treatments t     WHERE t.dog_id = d.dog_id ) <= 1000; 
SELECT DISTINCT first_name FROM Owners EXCEPT SELECT DISTINCT name FROM Dogs
SELECT first_name FROM Owners EXCEPT SELECT name FROM Dogs UNION SELECT first_name FROM Professionals
SELECT professional_id, role_code, email_address FROM Professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments); 
SELECT professional_id, role_code, email_address FROM Professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments); 
SELECT o.owner_id, o.first_name, o.last_name FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id GROUP BY o.owner_id ORDER BY COUNT(d.dog_id) DESC LIMIT 1;
SELECT O.owner_id, O.first_name, O.last_name FROM Owners AS O JOIN Dogs AS D ON O.owner_id = D.owner_id GROUP BY O.owner_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT p.professional_id, p.role_code, p.first_name FROM Professionals p JOIN Treatments t ON p.professional_id = t.professional_id GROUP BY p.professional_id, p.role_code, p.first_name HAVING COUNT(t.treatment_id) >= 2; 
SELECT professional_id, role_code, first_name FROM Professionals WHERE professional_id IN ( SELECT professional_id FROM Treatments GROUP BY professional_id HAVING COUNT(treatment_id) >= 2 )
SELECT breed_name FROM Breeds WHERE breed_code = (SELECT breed_code FROM Dogs GROUP BY breed_code ORDER BY COUNT(*) DESC LIMIT 1)
SELECT breed_name FROM Breeds WHERE breed_code = (SELECT breed_code FROM Dogs GROUP BY breed_code ORDER BY COUNT(*) DESC LIMIT 1)
SELECT o.owner_id, o.last_name FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id JOIN Treatments t ON d.dog_id = t.dog_id GROUP BY o.owner_id, o.last_name ORDER BY COUNT(t.treatment_id) DESC LIMIT 1
SELECT o.owner_id, o.last_name FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id JOIN Treatments t ON d.dog_id = t.dog_id GROUP BY o.owner_id ORDER BY SUM(t.cost_of_treatment) DESC LIMIT 1
SELECT T1.treatment_type_description FROM Treatment_Types AS T1 JOIN Treatments AS T2 ON T1.treatment_type_code = T2.treatment_type_code GROUP BY T1.treatment_type_description ORDER BY SUM(T2.cost_of_treatment) ASC LIMIT 1
SELECT t.treatment_type_description FROM Treatment_Types t JOIN Treatments tr ON t.treatment_type_code = tr.treatment_type_code GROUP BY t.treatment_type_code ORDER BY SUM(tr.cost_of_treatment) ASC LIMIT 1
SELECT o.owner_id, o.zip_code FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id JOIN Charges c ON d.dog_id = c.charge_id GROUP BY o.owner_id ORDER BY SUM(c.charge_amount) DESC LIMIT 1
SELECT O.owner_id, O.zip_code FROM Owners AS O JOIN Dogs AS D ON O.owner_id = D.owner_id JOIN Treatments AS T ON D.dog_id = T.dog_id GROUP BY O.owner_id ORDER BY SUM(T.cost_of_treatment) DESC LIMIT 1
SELECT professional_id, cell_number FROM Treatments GROUP BY professional_id HAVING COUNT(DISTINCT treatment_type_code) >= 2
SELECT professional_id, cell_number FROM Treatments GROUP BY professional_id HAVING COUNT(DISTINCT treatment_type_code) >= 2
SELECT p.first_name, p.last_name FROM Professionals p JOIN Treatments t ON p.professional_id = t.professional_id WHERE t.cost_of_treatment < (     SELECT AVG(cost_of_treatment)     FROM Treatments ); 
SELECT p.first_name, p.last_name FROM Professionals AS p JOIN Treatments AS t ON p.professional_id = t.professional_id WHERE t.cost_of_treatment < ( SELECT AVG(cost_of_treatment) FROM Treatments )
SELECT T1.date_of_treatment ,  T2.first_name FROM Treatments AS T1 INNER JOIN Professionals AS T2 ON T1.professional_id = T2.professional_id
SELECT T1.date_of_treatment ,  T2.first_name FROM Treatments AS T1 INNER JOIN Professionals AS T2 ON T1.professional_id = T2.professional_id
SELECT T1.cost_of_treatment ,  T2.treatment_type_description FROM Treatments AS T1 INNER JOIN Treatment_Types AS T2 ON T1.treatment_type_code = T2.treatment_type_code
SELECT t.cost_of_treatment, tt.treatment_type_description  FROM Treatments t  JOIN Treatment_Types tt ON t.treatment_type_code = tt.treatment_type_code; 
SELECT O.first_name, O.last_name, S.size_description FROM Owners AS O JOIN Dogs AS D ON O.owner_id = D.owner_id JOIN Sizes AS S ON D.size_code = S.size_code
SELECT o.first_name, o.last_name, s.size_description FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id JOIN Sizes s ON d.size_code = s.size_code
SELECT O.first_name , D.name FROM Owners AS O JOIN Dogs AS D ON O.owner_id = D.owner_id
SELECT O.first_name, D.name FROM Owners AS O JOIN Dogs AS D ON O.owner_id = D.owner_id
SELECT d.name, t.date_of_treatment FROM Dogs d JOIN Treatments t ON d.dog_id = t.dog_id WHERE d.breed_code IN ( SELECT breed_code FROM Dogs GROUP BY breed_code ORDER BY count(*) ASC LIMIT 1 )
SELECT d.name, t.date_of_treatment FROM Dogs d JOIN Treatments t ON d.dog_id = t.dog_id WHERE d.breed_code NOT IN ( SELECT breed_code FROM Dogs GROUP BY breed_code HAVING COUNT(*) > 1 ) ORDER BY d.dog_id;
SELECT o.first_name, d.name FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id WHERE o.state = 'Virginia'
SELECT O.first_name, D.name FROM Owners AS O JOIN Dogs AS D ON O.owner_id = D.owner_id WHERE O.state = 'Virginia'; 
SELECT d.date_arrived, d.date_departed FROM Dogs d JOIN Treatments t ON d.dog_id = t.dog_id; 
SELECT D.date_arrived, D.date_departed FROM Dogs AS D JOIN Treatments AS T ON D.dog_id = T.dog_id
SELECT O.last_name FROM Owners AS O JOIN Dogs AS D ON O.owner_id = D.owner_id ORDER BY D.age ASC LIMIT 1
SELECT last_name FROM Owners WHERE owner_id = (SELECT owner_id FROM Dogs ORDER BY date_of_birth DESC LIMIT 1)
SELECT email_address FROM Professionals WHERE state = 'Hawaii' OR state = 'Wisconsin'; 
SELECT email_address FROM Professionals WHERE state = 'Hawaii' OR state = 'Wisconsin'
SELECT date_arrived, date_departed FROM Dogs; 
SELECT date_arrived, date_departed FROM Dogs; 
SELECT COUNT(DISTINCT dog_id) AS number_of_dogs_with_treatments FROM Treatments; 
SELECT COUNT(*) FROM Treatments
SELECT COUNT(DISTINCT professional_id) FROM Treatments;
SELECT COUNT(DISTINCT professional_id) AS number_of_professionals FROM Treatments; 
SELECT role_code, street, city, state FROM Professionals WHERE city LIKE '%West%'; 
SELECT role_code, street, city, state FROM Professionals WHERE city LIKE '%West%'; 
SELECT first_name, last_name, email_address FROM Owners WHERE state LIKE '%North%'
SELECT first_name, last_name, email_address FROM Owners WHERE state LIKE '%North%'
SELECT COUNT(*) FROM Dogs WHERE age < (SELECT AVG(age) FROM Dogs); 
SELECT COUNT(*) FROM Dogs WHERE age < (SELECT AVG(age) FROM Dogs); 
SELECT MAX(cost_of_treatment) FROM Treatments;
SELECT cost_of_treatment FROM Treatments ORDER BY date_of_treatment DESC LIMIT 1
SELECT COUNT(*) FROM Dogs WHERE dog_id NOT IN (SELECT dog_id FROM Treatments);
SELECT COUNT(*) FROM Dogs WHERE dog_id NOT IN (SELECT dog_id FROM Treatments);
SELECT COUNT(owner_id) FROM Owners WHERE owner_id NOT IN (SELECT owner_id FROM Dogs);
SELECT COUNT(*) FROM Owners WHERE owner_id NOT IN (SELECT owner_id FROM Dogs WHERE date_departed IS NULL); 
SELECT COUNT(professional_id) FROM Professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments); 
SELECT COUNT(professional_id) FROM Professionals WHERE professional_id NOT IN ( SELECT professional_id FROM Treatments )
SELECT name, age, weight FROM Dogs WHERE abandoned_yn = '1'; 
SELECT name, age, weight FROM Dogs WHERE abandoned_yn = '1'; 
SELECT AVG(age) FROM Dogs;
SELECT AVG(age) AS average_age FROM Dogs; 
SELECT MAX(age) FROM Dogs;
SELECT MAX(age) FROM Dogs;
SELECT charge_type ,  charge_amount FROM Charges;
SELECT charge_type ,  charge_amount FROM Charges;
SELECT MAX(charge_amount) AS max_charge_amount FROM Charges; 
SELECT MAX(charge_amount) FROM Charges;
SELECT email_address ,  cell_number ,  home_phone FROM Professionals;
SELECT email_address ,  cell_number ,  home_phone FROM Professionals
SELECT DISTINCT breed_code ,  size_code FROM Dogs
SELECT DISTINCT breed_code ,  size_code FROM Dogs
SELECT P.first_name, TT.treatment_type_description FROM Professionals AS P JOIN Treatments AS T ON P.professional_id = T.professional_id JOIN Treatment_Types AS TT ON T.treatment_type_code = TT.treatment_type_code
SELECT P.first_name, TT.treatment_type_description FROM Professionals AS P JOIN Treatments AS T ON P.professional_id = T.professional_id JOIN Treatment_Types AS TT ON T.treatment_type_code = TT.treatment_type_code
SELECT COUNT(*) FROM singer; 
SELECT COUNT(*) FROM singer; 
SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC;
SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC
SELECT Birth_Year, Citizenship FROM singer; 
SELECT Birth_Year, Citizenship FROM singer; 
SELECT Name FROM singer WHERE Citizenship != 'France'; 
SELECT Name FROM singer WHERE Citizenship != 'France'; 
SELECT Name FROM singer WHERE Birth_Year = 1948 OR Birth_Year = 1949;
SELECT Name FROM singer WHERE Birth_Year = 1948 OR Birth_Year = 1949;
SELECT Name FROM singer ORDER BY Net_Worth_Millions DESC LIMIT 1
SELECT Name FROM singer ORDER BY Net_Worth_Millions DESC LIMIT 1; 
SELECT Citizenship, COUNT(*) FROM singer GROUP BY Citizenship; 
SELECT Citizenship ,  COUNT(*) FROM singer GROUP BY Citizenship
SELECT Citizenship FROM singer GROUP BY Citizenship ORDER BY COUNT(*) DESC LIMIT 1
SELECT Citizenship FROM singer GROUP BY Citizenship ORDER BY COUNT(*) DESC LIMIT 1
SELECT Citizenship, MAX(Net_Worth_Millions) FROM singer GROUP BY Citizenship
SELECT Citizenship, MAX(Net_Worth_Millions) FROM singer GROUP BY Citizenship
SELECT song.Title, singer.Name FROM song JOIN singer ON song.Singer_ID = singer.Singer_ID; 
SELECT s.Title, si.Name FROM song AS s JOIN singer AS si ON s.Singer_ID = si.Singer_ID; 
SELECT DISTINCT T2.Name FROM song AS T1 INNER JOIN singer AS T2 ON T1.Singer_ID = T2.Singer_ID WHERE T1.Sales > 300000
SELECT DISTINCT s.Name FROM singer AS s JOIN song AS so ON s.Singer_ID = so.Singer_ID WHERE so.Sales > 300000
SELECT s.Name FROM singer s JOIN song sg ON s.Singer_ID = sg.Singer_ID GROUP BY s.Singer_ID HAVING COUNT(sg.Song_ID) > 1; 
SELECT T2.Name FROM song AS T1 JOIN singer AS T2 ON T1.Singer_ID = T2.Singer_ID GROUP BY T2.Name HAVING COUNT(T1.Song_ID) > 1
SELECT s.Name, SUM(so.Sales) AS Total_Sales FROM singer s JOIN song so ON s.Singer_ID = so.Singer_ID GROUP BY s.Name; 
SELECT s.Name, SUM(song.Sales) AS Total_Sales FROM singer s JOIN song ON s.Singer_ID = song.Singer_ID GROUP BY s.Name;
SELECT Name FROM singer WHERE Singer_ID NOT IN (SELECT Singer_ID FROM song)
SELECT Name FROM singer WHERE Singer_ID NOT IN (SELECT Singer_ID FROM song)
SELECT Citizenship FROM singer WHERE Birth_Year < 1945 INTERSECT SELECT Citizenship FROM singer WHERE Birth_Year > 1955; 
SELECT Citizenship FROM singer WHERE Birth_Year < 1945 INTERSECT SELECT Citizenship FROM singer WHERE Birth_Year > 1955
SELECT COUNT(*) FROM Other_Available_Features;
SELECT feature_type_name FROM Ref_Feature_Types WHERE feature_type_code = 'Amenity' AND feature_name = 'AirCon';
SELECT Ref_Property_Types.property_type_description  FROM Ref_Property_Types  JOIN Properties ON Ref_Property_Types.property_type_code = Properties.property_type_code; 
SELECT property_name FROM Properties WHERE property_type_code IN ('House', 'Apartment') AND room_count > 1; 
