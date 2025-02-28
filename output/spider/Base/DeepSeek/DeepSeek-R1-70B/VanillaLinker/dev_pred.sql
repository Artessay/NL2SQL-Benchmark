SELECT COUNT(*) FROM singer; 
SELECT COUNT(*) FROM singer; 
SELECT Name, Country, Age FROM singer ORDER BY Age DESC;
To retrieve the names, countries, and ages of every singer in descending order of age, you can use the following SQL query:  SELECT Name, Country, Age FROM singer ORDER BY Age DESC;
SELECT AVG(Age) AS Average_Age, MIN(Age) AS Minimum_Age, MAX(Age) AS Maximum_Age FROM singer WHERE Country = 'France';
SELECT AVG(Age) AS Average_Age, MIN(Age) AS Minimum_Age, MAX(Age) AS Maximum_Age FROM singer WHERE Country = 'France' AND Age IS NOT NULL;
SELECT Song_Name, Song_release_year FROM singer WHERE Age = (SELECT MIN(Age) FROM singer) LIMIT 1; 
SELECT Song_Name, Song_release_year FROM singer WHERE Age = (SELECT MIN(Age) FROM singer); 
SELECT DISTINCT Country FROM singer WHERE Age > 20;
SELECT DISTINCT Country FROM singer WHERE Age > 20;
SELECT Country, COUNT(Singer_ID) FROM singer GROUP BY Country; 
SELECT Country, COUNT(Singer_ID) AS SingerCount FROM singer GROUP BY Country; 
SELECT Song_Name FROM singer WHERE Age > (SELECT AVG(Age) FROM singer); 
SELECT DISTINCT Song_Name FROM singer WHERE Age > (SELECT AVG(Age) FROM singer); 
SELECT Location, Name FROM stadium WHERE Capacity BETWEEN 5000 AND 10000;
SELECT Location, Name FROM stadium WHERE Capacity BETWEEN 5000 AND 10000; 
SELECT MAX(Capacity) AS Max_Capacity, AVG(Average) AS Avg_Average FROM stadium;
SELECT AVG(Capacity) AS Average_Capacity, MAX(Capacity) AS Maximum_Capacity FROM stadium; 
SELECT Name, Capacity FROM stadium WHERE Average = (SELECT MAX(Average) FROM stadium);
SELECT Name, Capacity FROM stadium WHERE Average = (SELECT MAX(Average) FROM stadium)
SELECT COUNT(*) FROM concert WHERE Year IN ('2014', '2015'); 
SELECT COUNT(*) FROM concert WHERE Year = '2014' OR Year = '2015'; 
SELECT stadium.Name, COUNT(concert.concert_ID) FROM stadium INNER JOIN concert ON stadium.Stadium_ID = concert.Stadium_ID GROUP BY stadium.Name;
SELECT Stadium_ID, COUNT(concert_ID) AS Number_of_Concerts FROM concert GROUP BY Stadium_ID 
SELECT S.Name, S.Capacity, COUNT(C.concert_ID) as concert_count FROM stadium S JOIN concert C ON S.Stadium_ID = CAST(C.Stadium_ID AS INT) WHERE C.Year >= '2014' GROUP BY S.Stadium_ID, S.Name, S.Capacity ORDER BY concert_count DESC LIMIT 1; 
SELECT Name, Capacity FROM stadium WHERE Stadium_ID = (     SELECT stadium_id     FROM (         SELECT              cs.Stadium_ID,             COUNT(c.Concert_ID) as concert_count         FROM concert c         INNER JOIN stadium cs ON c.Stadium_ID = cs.Stadium_ID         WHERE CAST(c.Year AS INT) > 2013         GROUP BY cs.Stadium_ID     ) AS subquery     ORDER BY concert_count DESC     LIMIT 1 ); 
SELECT Year, COUNT(*) FROM concert GROUP BY Year ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Year, COUNT(*) as concert_count FROM concert WHERE Year IS NOT NULL GROUP BY Year ORDER BY concert_count DESC LIMIT 1; 
SELECT s.Name FROM stadium s LEFT JOIN concert c ON s.Stadium_ID = c.Stadium_ID WHERE c.Stadium_ID IS NULL
SELECT s.Name FROM stadium s LEFT JOIN concert c ON s.Stadium_ID = c.Stadium_ID WHERE c.Stadium_ID IS NULL; 
SELECT Country FROM singer GROUP BY Country HAVING COUNT(CASE WHEN Age > 40 THEN 1 END) > 0 AND COUNT(CASE WHEN Age < 30 THEN 1 END) > 0; 
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert WHERE Year = 2014) 
SELECT s.Name FROM stadium s LEFT JOIN concert c ON s.Stadium_ID = c.Stadium_ID WHERE c.Year != '2014' AND c.Stadium_ID IS NULL; 
SELECT concert_Name, Theme, COUNT(Singer_ID) FROM concert LEFT JOIN singer_in_concert ON concert.concert_ID = singer_in_concert.concert_ID GROUP BY concert_ID, concert_Name, Theme
SELECT c.concert_Name, c.Theme, COUNT(sic.Singer_ID) AS number_of_singers  FROM concert c  LEFT JOIN singer_in_concert sic ON c.concert_ID = sic.concert_ID  GROUP BY c.concert_ID; 
SELECT s.Name, COUNT(sc.concert_ID) AS concert_count FROM singer s LEFT JOIN singer_in_concert sc ON s.Singer_ID = sc.Singer_ID GROUP BY s.Name ORDER BY concert_count DESC; 
SELECT s.Name, COUNT(sic.Singer_ID) as Concert_Count FROM singer s JOIN singer_in_concert sic ON s.Singer_ID = sic.Singer_ID GROUP BY s.Singer_ID, s.Name; 
SELECT s.Name FROM singer s JOIN singer_in_concert sic ON s.Singer_ID = sic.Singer_ID JOIN concert c ON sic.concert_ID = c.concert_ID WHERE c.Year = '2014'; 
SELECT s.Name FROM singer s INNER JOIN singer_in_concert sic ON s.Singer_ID = sic.Singer_ID INNER JOIN concert c ON sic.concert_ID = c.concert_ID WHERE c.Year = '2014'; 
SELECT Name, Country FROM singer WHERE Song_Name LIKE '%Hey%'; 
SELECT Name, Country FROM singer WHERE Song_Name LIKE '%Hey%';
SELECT Name, Location FROM stadium WHERE Stadium_ID IN (     SELECT Stadium_ID FROM concert WHERE Year = '2014' INTERSECT     SELECT Stadium_ID FROM concert WHERE Year = '2015' ); 
SELECT s.Name AS Stadium_Name, s.Location AS Stadium_Location FROM stadium s JOIN concert c ON s.Stadium_ID = c.Stadium_ID WHERE c.Year IN ('2014', '2015') GROUP BY s.Stadium_ID, s.Name, s.Location HAVING COUNT(DISTINCT c.Year) = 2; 
SELECT COUNT(*) FROM concert WHERE Stadium_ID::integer IN (SELECT Stadium_ID FROM stadium WHERE Capacity = (SELECT MAX(Capacity) FROM stadium)); 
SELECT COUNT(*) FROM concert WHERE Stadium_ID = (SELECT Stadium_ID FROM stadium WHERE Capacity = (SELECT MAX(Capacity) FROM stadium)) AND Stadium_ID IS NOT NULL;
SELECT COUNT(PetID) FROM Pets WHERE weight > 10; 
SELECT COUNT(PetID) NumberOfPets FROM Pets WHERE weight > 10;
SELECT weight FROM Pets WHERE PetType = 'dog' AND pet_age = (SELECT MIN(pet_age) FROM Pets WHERE PetType = 'dog'); 
SELECT weight FROM Pets WHERE PetType = 'dog' AND pet_age = (SELECT MIN(pet_age) FROM Pets WHERE PetType = 'dog');
SELECT PetType, MAX(weight) AS max_weight FROM Pets GROUP BY PetType
SELECT PetType, MAX(weight) AS max_weight FROM Pets GROUP BY PetType; 
SELECT COUNT(PetID) FROM Has_Pet INNER JOIN Student ON Has_Pet.StuID = Student.StuID WHERE Student.Age > 20;
SELECT COUNT(*)  FROM Has_Pet  INNER JOIN Student  ON Has_Pet.StuID = Student.StuID  WHERE Student.Age > 20; 
SELECT COUNT(PetID) FROM Student INNER JOIN Has_Pet ON Student.StuID = Has_Pet.StuID INNER JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Student.Sex = 'F' AND Pets.PetType = 'dog'; 
SELECT COUNT(*) FROM Student INNER JOIN Has_Pet ON Student.StuID = Has_Pet.StuID INNER JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Student.Sex = 'F' AND PetType = 'dog';
SELECT COUNT(DISTINCT PetType) FROM Pets; 
SELECT COUNT(DISTINCT PetType) FROM Pets 
SELECT DISTINCT S.Fname  FROM Student S INNER JOIN Has_Pet HP ON S.StuID = HP.StuID INNER JOIN Pets P ON HP.PetID = P.PetID WHERE P.PetType IN ('cat', 'dog'); 
SELECT DISTINCT S.FName FROM Student S INNER JOIN Has_Pet HP ON S.StuID = HP.StuID INNER JOIN Pets P ON HP.PetID = P.PetID WHERE P.PetType IN ('cat', 'dog'); 
SELECT FName FROM Student WHERE StuID IN (     SELECT StuID FROM Has_Pet     WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'cat')     INTERSECT     SELECT StuID FROM Has_Pet     WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'dog') ); 
SELECT Fname  FROM Student  WHERE StuID IN  (     SELECT StuID      FROM Has_Pet      WHERE PetID IN      (         SELECT PetID          FROM Pets          WHERE PetType = 'cat'     ) ) AND StuID IN  (     SELECT StuID      FROM Has_Pet      WHERE PetID IN      (         SELECT PetID          FROM Pets          WHERE PetType = 'dog'     ) ); 
SELECT Major, Age FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'cat')); 
SELECT Major, Age FROM Student WHERE StuID NOT IN (SELECT DISTINCT H.StuID FROM Has_Pet H INNER JOIN Pets P ON H.PetID = P.PetID WHERE P.PetType = 'cat')
SELECT StuID FROM Student WHERE StuID NOT IN (SELECT H.StuID FROM Has_Pet H INNER JOIN Pets P ON H.PetID = P.PetID WHERE P.PetType = 'cat') 
SELECT StuID FROM Student WHERE StuID NOT IN (SELECT H.StuID FROM Has_Pet H INNER JOIN Pets P ON H.PetID = P.PetID WHERE P.PetType = 'cat') 
SELECT Fname, Age FROM Student WHERE StuID IN (SELECT H.StuID FROM Has_Pet H JOIN Pets P ON H.PetID = P.PetID WHERE P.PetType = 'dog') AND StuID NOT IN (SELECT H.StuID FROM Has_Pet H JOIN Pets P ON H.PetID = P.PetID WHERE P.PetType = 'cat');
SELECT S.Fname FROM Student S WHERE S.StuID IN (   SELECT H.StuID   FROM Has_Pet H   JOIN Pets P ON H.PetID = P.PetID   WHERE P.PetType = 'dog' ) AND S.StuID NOT IN (   SELECT H.StuID   FROM Has_Pet H   JOIN Pets P ON H.PetID = P.PetID   WHERE P.PetType = 'cat' ) 
SELECT PetType, weight FROM Pets WHERE pet_age = (SELECT MIN(pet_age) FROM Pets); 
SELECT PetType, weight FROM Pets WHERE pet_age = (SELECT MIN(pet_age) FROM Pets); 
SELECT PetID, weight FROM Pets WHERE pet_age > 1;
SELECT PetID, weight FROM Pets WHERE pet_age > 1; 
SELECT PetType, AVG(pet_age) AS avg_age, MAX(pet_age) AS max_age FROM Pets GROUP BY PetType; 
SELECT PetType, AVG(pet_age) AS avg_age, MAX(pet_age) AS max_age FROM Pets GROUP BY PetType; 
SELECT PetType, AVG(weight) FROM Pets GROUP BY PetType;
SELECT PetType, AVG(weight) FROM Pets GROUP BY PetType
SELECT DISTINCT Student.Fname, Student.Age FROM Student INNER JOIN Has_Pet ON Student.StuID = Has_Pet.StuID; 
SELECT DISTINCT S.Fname, S.Age FROM Student S INNER JOIN Has_Pet HP ON S.StuID = HP.StuID; 
SELECT H.PetID FROM Student S INNER JOIN Has_Pet H ON S.StuID = H.StuID WHERE S.LName = 'Smith'; 
SELECT PetID FROM Has_Pet INNER JOIN Student ON Has_Pet.StuID = Student.StuID WHERE LName = 'Smith'
SELECT S.StuID, COUNT(P.PetID) AS NumberOfPets FROM Student S JOIN Has_Pet P ON S.StuID = P.StuID GROUP BY S.StuID; 
SELECT StuID, COUNT(PetID) FROM Has_Pet GROUP BY StuID
SELECT Fname, Sex FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet GROUP BY StuID HAVING COUNT(PetID) > 1) 
SELECT s.Fname, s.Sex FROM Student s WHERE s.StuID IN (   SELECT h.StuID   FROM Has_Pet h   GROUP BY h.StuID   HAVING COUNT(h.PetID) > 1 ); 
SELECT S.LName FROM Student S INNER JOIN Has_Pet H ON S.StuID = H.StuID INNER JOIN Pets P ON H.PetID = P.PetID WHERE P.PetType = 'cat' AND P.pet_age = 3; 
SELECT S.LName  FROM Student S  INNER JOIN Has_Pet HP ON S.StuID = HP.StuID  INNER JOIN Pets P ON HP.PetID = P.PetID  WHERE P.PetType = 'cat' AND P.pet_age = 3; 
SELECT AVG(S.Age) FROM Student S LEFT JOIN Has_Pet H ON S.StuID = H.StuID WHERE H.StuID IS NULL; 
SELECT AVG(S.Age) FROM Student S LEFT JOIN Has_Pet H ON S.StuID = H.StuID WHERE H.PetID IS NULL;
SELECT COUNT(*) FROM continents; 
SELECT COUNT(ContId) FROM continents; 
SELECT c1.ContId, c1.Continent, COUNT(c2.CountryId) AS Number_of_Countries FROM continents c1 LEFT JOIN countries c2 ON c1.ContId = c2.Continent GROUP BY c1.ContId, c1.Continent ORDER BY c1.ContId; 
SELECT c.ContId, c.Continent, COUNT(co.CountryId) AS CountryCount FROM continents c LEFT JOIN countries co ON c.ContId = co.Continent GROUP BY c.ContId, c.Continent; 
SELECT COUNT(*) FROM countries; 
SELECT COUNT(*) FROM countries; 
SELECT T1.id, T1.FullName, COUNT(T2.ModelId) AS Number_of_Models  FROM car_makers AS T1  INNER JOIN model_list AS T2  ON T1.Id = T2.Maker  GROUP BY T1.FullName, T1.id  ORDER BY T1.id ASC; 
SELECT cm.Id, cm.FullName, COUNT(ml.ModelId) AS NumberOfModels FROM car_makers cm LEFT JOIN model_list ml ON cm.Id = ml.Maker GROUP BY cm.Id; 
SELECT cn.Model, cd.Horsepower FROM cars_data cd JOIN car_names cn ON cd.Id = cn.MakeId WHERE cd.Horsepower = (SELECT MIN(CAST(cd.Horsepower AS INTEGER)) FROM cars_data); 
SELECT Model FROM car_names WHERE MakeId = (SELECT Id FROM cars_data WHERE CAST(Horsepower AS INTEGER) = (SELECT MIN(CAST(Horsepower AS INTEGER)) FROM cars_data)); 
SELECT cn.Model FROM car_names cn INNER JOIN cars_data cd ON cn.MakeId = cd.Id WHERE cd.Weight < (SELECT AVG(Weight) FROM cars_data);
SELECT DISTINCT T3.Model FROM cars_data AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId JOIN model_list AS T3 ON T2.Model = T3.ModelId WHERE T1.Weight < (SELECT AVG(Weight) FROM cars_data); 
SELECT DISTINCT T4.Maker FROM car_makers AS T4 INNER JOIN model_list AS T3 ON T4.Id = T3.Maker INNER JOIN car_names AS T2 ON T3.ModelId = T2.Model INNER JOIN cars_data AS T1 ON T2.MakeId = T1.Id WHERE T1.Year = 1970;
SELECT DISTINCT car_makers.Maker FROM cars_data INNER JOIN car_names ON cars_data.Id = car_names.MakeId INNER JOIN model_list ON car_names.Model = model_list.ModelId INNER JOIN car_makers ON model_list.Maker = car_makers.Id WHERE cars_data.Year = 1970
SELECT cn.Make, cd.Year FROM cars_data cd JOIN car_names cn ON cd.Id = cn.MakeId WHERE cd.Year = (SELECT MIN(Year) FROM cars_data); 
SELECT T4.Maker, MIN(T1.Year) AS Year FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.Id = T2.MakeId INNER JOIN model_list AS T3 ON T2.Model = T3.ModelId INNER JOIN car_makers AS T4 ON T3.Maker = T4.Id
SELECT DISTINCT cn.Model  FROM car_names cn INNER JOIN cars_data cd ON cn.MakeId = cd.Id WHERE cd.Year > 1980; 
SELECT DISTINCT T1.Model FROM model_list AS T1 JOIN car_names AS T2 ON T1.ModelId = T2.Model JOIN cars_data AS T3 ON T2.MakeId = T3.Id WHERE T3.Year > 1980; 
SELECT c.Continent, COUNT(cm.Id) as count FROM car_makers cm INNER JOIN countries co ON cm.Country = co.CountryId INNER JOIN continents c ON co.Continent = c.ContId GROUP BY c.Continent; 
SELECT c.Continent, COUNT(cm.Id) AS Number_of_makers FROM continents c LEFT JOIN countries co ON c.ContId = co.Continent LEFT JOIN car_makers cm ON co.CountryId = cm.Country GROUP BY c.Continent ORDER BY c.Continent ASC
SELECT c.CountryName, COUNT(*) FROM car_makers cm JOIN countries c ON cm.Country = c.CountryId GROUP BY c.CountryName ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT      c.CountryName FROM      countries c JOIN      car_makers cm ON c.CountryId = cm.Country GROUP BY      c.CountryName HAVING      COUNT(cm.Maker) = (         SELECT              MAX(cnt)         FROM (             SELECT                  COUNT(cm.Maker) AS cnt             FROM                  car_makers cm             GROUP BY                  cm.Country         )     ) 
SELECT cm.FullName AS MakerFullName, COUNT(ml.ModelId) AS ModelCount FROM model_list ml JOIN car_makers cm ON ml.Maker = cm.Id GROUP BY cm.FullName; 
SELECT      cm.Id,      cm.FullName,      COUNT(ml.Model) AS NumberOfModels FROM      car_makers cm LEFT JOIN      model_list ml ON cm.Id = ml.Maker GROUP BY      cm.Id, cm.FullName ORDER BY      cm.FullName; 
SELECT Accelerate FROM cars_data WHERE Id = (SELECT MakeId FROM car_names WHERE Make = 'amc hornet sportabout (sw)');
SELECT Accelerate FROM cars_data INNER JOIN car_names ON cars_data.Id = car_names.MakeId WHERE car_names.Make = 'amc hornet sportabout (sw)';
SELECT COUNT(*) FROM car_makers WHERE Country = '3';
To find the number of car makers in France, we need to count the entries in the `car_makers` table where the `Country` is 3, which corresponds to France.  SELECT COUNT(*) FROM car_makers WHERE Country = 3;
SELECT COUNT(ModelId) FROM model_list INNER JOIN car_makers ON model_list.Maker = car_makers.Id WHERE car_makers.Country = '1';
SELECT COUNT(*) FROM model_list WHERE Maker IN (SELECT Id FROM car_makers WHERE Country = (SELECT CountryId FROM countries WHERE CountryName = 'usa'));
SELECT AVG(CAST(MPG AS REAL)) AS AverageMPG FROM cars_data WHERE Cylinders = 4; 
SELECT AVG(CAST(MPG AS REAL)) AS AverageMPG FROM cars_data WHERE Cylinders = 4;
SELECT MIN(Weight) FROM cars_data WHERE Cylinders = 8 AND Year = 1974;
SELECT MIN(Weight) FROM cars_data WHERE Cylinders = 8 AND Year = 1974;
SELECT Maker, Model FROM car_makers INNER JOIN model_list ON car_makers.Id = model_list.Maker;
SELECT Maker, Model FROM car_makers INNER JOIN model_list ON car_makers.Id = model_list.Maker
SELECT DISTINCT c.CountryId, c.CountryName  FROM countries c  INNER JOIN car_makers cm  ON CAST(cm.Country AS INTEGER) = c.CountryId; 
SELECT DISTINCT c.CountryId, c.CountryName FROM countries c INNER JOIN car_makers cm ON c.CountryId = cm.Country; 
SELECT COUNT(*) FROM cars_data WHERE CAST(Horsepower AS INTEGER) > 150;
SELECT COUNT(*) FROM cars_data WHERE CAST(Horsepower AS INTEGER) > 150; 
SELECT Year, AVG(Weight) AS AverageWeight FROM cars_data GROUP BY Year; 
SELECT Year, AVG(Weight) FROM cars_data GROUP BY Year; 
SELECT c.CountryName FROM countries c JOIN car_makers cm ON c.CountryId = cm.Country WHERE c.Continent = 2 GROUP BY c.CountryName HAVING COUNT(cm.Maker) >= 3
SELECT T2.CountryName FROM car_makers AS T1 JOIN countries AS T2 ON CAST(T1.Country AS INTEGER) = T2.CountryId WHERE T2.Continent = 2 GROUP BY T2.CountryName HAVING COUNT(T1.Maker) >= 3; 
SELECT MAX(CAST(cd.Horsepower AS INTEGER)) AS MaxHorsepower, cn.Make FROM cars_data cd JOIN car_names cn ON cd.Id = cn.MakeId WHERE cd.Cylinders = 3; 
SELECT Make, Horsepower  FROM car_names  JOIN cars_data  ON car_names.MakeId = cars_data.Id  WHERE Cylinders = 3  ORDER BY Horsepower DESC  LIMIT 1; 
SELECT Make FROM car_names WHERE Id = ( SELECT Id FROM cars_data WHERE CAST(MPG AS REAL) = ( SELECT MAX(CAST(MPG AS REAL)) FROM cars_data ) )
SELECT cn.Model FROM cars_data cd INNER JOIN car_names cn ON cd.Id = cn.MakeId WHERE cd.MPG = (SELECT MAX(CAST(MPG AS REAL)) FROM cars_data)
SELECT AVG(CAST(T1.Horsepower AS REAL)) AS AverageHorsepower FROM cars_data T1 WHERE T1.Year < 1980; 
SELECT AVG(CAST(Horsepower AS REAL)) FROM cars_data WHERE Year < 1980;
SELECT AVG(c.Edispl)  FROM cars_data c  INNER JOIN model_list m  ON c.MakeId = m.ModelId  WHERE m.Model = 'volvo'; 
SELECT AVG(c.Edispl) AS average_edsipl FROM cars_data c JOIN car_names cn ON c.Id = cn.MakeId JOIN model_list ml ON cn.Model = ml.ModelId JOIN car_makers cm ON ml.Maker = cm.Id WHERE cm.Maker = 'volkswagen'; 
SELECT Cylinders, MAX(Accelerate) FROM cars_data GROUP BY Cylinders;
SELECT Cylinders, MAX(Accelerate) FROM cars_data GROUP BY Cylinders; 
SELECT ml.Model, COUNT(cn.Model) as Count FROM model_list ml JOIN car_names cn ON ml.ModelId = cn.MakeId GROUP BY ml.Model ORDER BY Count DESC; 
SELECT ml.Model, COUNT(cn.ModelId) as VersionCount FROM car_names cn INNER JOIN model_list ml ON cn.Model = ml.ModelId GROUP BY ml.Model ORDER BY VersionCount DESC LIMIT 1; 
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 4; 
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 4; 
SELECT COUNT(*) FROM cars_data WHERE Year = 1980; 
SELECT COUNT(*) FROM cars_data WHERE Year = 1980;
SELECT COUNT(ModelId)  FROM model_list  WHERE Maker = (SELECT Id FROM car_makers WHERE FullName = 'American Motor Company'); 
SELECT COUNT(T2.ModelId) FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker WHERE T1.FullName = 'American Motor Company'; 
SELECT cm.Id, cm.FullName, COUNT(ml.ModelId) as ModelCount FROM car_makers cm INNER JOIN model_list ml ON cm.Id = ml.Maker GROUP BY cm.Id HAVING COUNT(ml.ModelId) > 3; 
SELECT Id, Maker FROM car_makers WHERE Id IN (SELECT Maker FROM model_list GROUP BY Maker HAVING COUNT(*) >3)
SELECT DISTINCT T2.Model FROM model_list AS T1 INNER JOIN car_makers AS T2 ON T1.Maker = T2.Id INNER JOIN car_names AS T3 ON T1.Model = T3.Model INNER JOIN cars_data AS T4 ON T3.MakeId = T4.Id WHERE T2.FullName = 'General Motors' OR T4.Weight > 3500
SELECT Model FROM model_list WHERE Maker = 4  UNION  SELECT ml.Model  FROM model_list ml JOIN car_names cn ON ml.ModelId = cn.Model JOIN cars_data cd ON cn.MakeId = cd.Id WHERE cd.Weight > 3500; 
SELECT DISTINCT Year FROM cars_data WHERE Weight BETWEEN 3000 AND 4000
SELECT DISTINCT Year FROM cars_data WHERE EXISTS (   SELECT 1 FROM cars_data c1    WHERE c1.Year = cars_data.Year AND c1.Weight < 4000 ) AND EXISTS (   SELECT 1 FROM cars_data c2    WHERE c2.Year = cars_data.Year AND c2.Weight > 3000 ); 
SELECT Horsepower FROM cars_data WHERE Accelerate = (SELECT MAX(Accelerate) FROM cars_data);
SELECT Horsepower FROM cars_data WHERE Accelerate = (SELECT MAX(Accelerate) FROM cars_data);
SELECT T.Cylinders FROM (     SELECT c.Cylinders, ca.Accelerate     FROM model_list m     JOIN car_names cn ON m.ModelId = cn.Model     JOIN cars_data c ON cn.MakeId = c.Id     WHERE m.Model = 'volvo' ) T ORDER BY T.Accelerate LIMIT 1 
SELECT T.Cylinders FROM ( SELECT T4.Cylinders, T4.Accelerate FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker INNER JOIN car_names AS T3 ON T2.Model = T3.Model INNER JOIN cars_data AS T4 ON T3.MakeId = T4.Id WHERE T1.Maker = 'volvo' ) AS T ORDER BY T.Accelerate LIMIT 1;
SELECT COUNT(*) FROM cars_data WHERE Accelerate > (SELECT MAX(CAST(Horsepower AS REAL)) FROM cars_data) 
SELECT COUNT(*) FROM cars_data WHERE Accelerate > (SELECT MAX(CAST(Horsepower AS INTEGER)) FROM cars_data); 
SELECT COUNT(*) FROM (     SELECT Country FROM car_makers GROUP BY Country HAVING COUNT(*) > 2 ); 
SELECT COUNT(*) FROM (   SELECT Country FROM car_makers   GROUP BY Country   HAVING COUNT(Id) > 2 ); 
To determine the number of cars with more than 6 cylinders, we can use a SQL query that counts the rows in the `cars_data` table where the `Cylinders` column is greater than 6.  **Step-by-step explanation:** 1. **SELECT COUNT(*)**: This counts the number of rows that meet the condition. 2. **FROM cars_data**: Specifies the table to query. 3. **WHERE Cylinders > 6**: Filters the rows to include only those where the number of cylinders exceeds 6.  **Answer:** SELECT COUNT(*) FROM cars_data WHERE Cylinders > 6;
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 6
SELECT Model FROM car_names JOIN cars_data ON car_names.MakeId = cars_data.Id WHERE Cylinders = 4 ORDER BY Horsepower DESC LIMIT 1;
SELECT m.Model FROM cars_data c INNER JOIN car_names cn ON c.Id = cn.MakeId INNER JOIN model_list m ON cn.Model = m.ModelId WHERE c.Cylinders = 4 ORDER BY CAST(c.Horsepower AS INTEGER) DESC LIMIT 1
SELECT MakeId, Make FROM car_names WHERE MakeId IN (SELECT Id FROM cars_data WHERE CAST(Horsepower AS INTEGER) > (SELECT MIN(CAST(Horsepower AS INTEGER)) FROM cars_data) AND Cylinders <= 3)
SELECT cn.MakeId, cn.Make  FROM cars_data cd JOIN car_names cn ON cd.Id = cn.MakeId WHERE cd.Horsepower != (SELECT MIN(Horsepower) FROM cars_data) AND cd.Cylinders < 4; 
SELECT MAX(CAST(MPG AS REAL)) FROM cars_data WHERE Cylinders = 8 OR Year < 1980;
SELECT MAX(CAST(MPG AS REAL)) AS MaxMPG FROM cars_data WHERE Cylinders = 8 OR Year < 1980; 
SELECT DISTINCT model_list.Model  FROM model_list  INNER JOIN car_names ON model_list.ModelId = car_names.Model  INNER JOIN cars_data ON car_names.MakeId = cars_data.Id  INNER JOIN car_makers ON model_list.Maker = car_makers.Id  WHERE cars_data.Weight < 3500  AND car_makers.FullName != 'Ford Motor Company'; 
SELECT DISTINCT cn.Model FROM cars_data cd JOIN car_names cn ON cd.Id = cn.MakeId JOIN model_list ml ON cn.Model = ml.Model WHERE cd.Weight < 3500 AND ml.Maker != 5
SELECT CountryName FROM countries WHERE CountryId NOT IN (SELECT CAST(Country AS INTEGER) FROM car_makers);
SELECT c.CountryName  FROM countries c  LEFT JOIN car_makers cm ON c.CountryId = cm.Country  WHERE cm.Maker IS NULL; 
SELECT Id, Maker FROM car_makers WHERE Id IN (SELECT Maker FROM model_list GROUP BY Maker HAVING COUNT(Model) >= 2);
WITH ModelCounts AS (   SELECT Maker, COUNT(ModelId) as ModelCount   FROM model_list   GROUP BY Maker ), CarCounts AS (   SELECT ml.Maker, COUNT(c.Id) as CarCount   FROM model_list ml   JOIN car_names cn ON ml.Model = cn.Model   JOIN cars_data c ON cn.MakeId = c.Id   GROUP BY ml.Maker ) SELECT cm.Id, cm.Maker FROM car_makers cm WHERE cm.Id IN (SELECT Maker FROM ModelCounts WHERE ModelCount >= 2) AND cm.Id IN (SELECT Maker FROM CarCounts WHERE CarCount > 3); 
SELECT CountryId, CountryName FROM countries WHERE CountryId IN (   SELECT t3.CountryId FROM car_makers AS t2   JOIN countries AS t3 ON t2.Country = t3.CountryId   GROUP BY t3.CountryId   HAVING COUNT(t2.Id) > 3 ) OR CountryId IN (   SELECT t3.CountryId FROM model_list AS t1   JOIN car_makers AS t2 ON t1.Maker = t2.Id   JOIN countries AS t3 ON t2.Country = t3.CountryId   WHERE t1.Model = 'fiat' ); 
SELECT c.CountryId, c.CountryName FROM countries c JOIN car_makers cm ON c.CountryId = cm.Country GROUP BY c.CountryId, c.CountryName HAVING COUNT(cm.Id) > 3  UNION  SELECT c.CountryId, c.CountryName FROM countries c JOIN car_makers cm ON c.CountryId = cm.Country JOIN model_list ml ON cm.Id = ml.Maker WHERE ml.Model = 'fiat'  ORDER BY CountryId; 
SELECT Country FROM airlines WHERE Airline = 'JetBlue Airways'
SELECT Country FROM airlines WHERE Airline = 'Jetblue Airways';
SELECT Abbreviation FROM airlines WHERE Airline = 'JetBlue Airways';
SELECT Abbreviation FROM airlines WHERE Airline = 'Jetblue Airways'; 
SELECT Airline, Abbreviation FROM airlines WHERE Country = "USA";
SELECT Airline, Abbreviation FROM airlines WHERE Country = 'USA'; 
SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony';
SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony'
SELECT COUNT(*) FROM airlines; 
SELECT COUNT(*) FROM airlines;
To determine the number of airports in the database, we count the rows in the `airports` table using the `COUNT(*)` function.  **Step-by-step explanation:**  1. **Identify the relevant table:** The `airports` table contains all airport information, where each row represents a different airport. 2. **Use the COUNT function:** `COUNT(*)` counts all rows in a table, which gives the total number of airports. 3. **No filters needed:** Since we want the total count, no `WHERE` clause is necessary. 4. **Execute the query:** The query `SELECT COUNT(*) FROM airports;` will return the number of airports.  **Answer:**  SELECT COUNT(*) FROM airports;
SELECT COUNT(DISTINCT AirportCode) FROM airports; 
SELECT COUNT(*) FROM flights; 
SELECT COUNT(*) FROM flights;
SELECT Airline FROM airlines WHERE Abbreviation = 'UAL';
SELECT Airline FROM airlines WHERE Abbreviation = 'UAL';
SELECT COUNT(*) FROM airlines WHERE Country = 'USA'; 
SELECT COUNT(*) FROM airlines WHERE Country = 'USA'; 
SELECT City, Country FROM airports WHERE AirportName = 'Alton'
SELECT City, Country FROM airports WHERE AirportName = 'Alton';
SELECT AirportName FROM airports WHERE AirportCode = 'AKO';
SELECT AirportName FROM airports WHERE AirportCode = 'AKO'; 
SELECT AirportName FROM airports WHERE City = 'Aberdeen '
SELECT AirportName FROM airports WHERE City = 'Aberdeen ';
To determine the number of flights departing from 'APG', we query the `flights` table and count the entries where `SourceAirport` is ' APG'.  SELECT COUNT(*) FROM flights WHERE SourceAirport = ' APG';
SELECT COUNT(FlightNo) FROM flights WHERE SourceAirport = 'APG'; 
SELECT COUNT(*) FROM flights WHERE DestAirport = 'ATO'; 
SELECT COUNT(*) FROM flights WHERE DestAirport = 'ATO';
SELECT COUNT(FlightNo) FROM flights WHERE SourceAirport IN (SELECT AirportCode FROM airports WHERE City = 'Aberdeen ');
SELECT COUNT(*) FROM flights JOIN airports ON SourceAirport = AirportCode WHERE City = 'Aberdeen '; 
SELECT COUNT(*) FROM flights AS F INNER JOIN airports AS A ON F.DestAirport = A.AirportCode WHERE A.City = 'Aberdeen '
SELECT COUNT(*) FROM flights WHERE TRIM(DestAirport) IN (SELECT AirportCode FROM airports WHERE City = 'Aberdeen'); 
SELECT COUNT(*)  FROM flights  JOIN airports AS SourceAirport  ON flights.SourceAirport = SourceAirport.AirportCode  JOIN airports AS DestAirport  ON flights.DestAirport = DestAirport.AirportCode  WHERE SourceAirport.City = 'Aberdeen'  AND DestAirport.City = 'Ashley'; 
SELECT COUNT(f.FlightNo) FROM flights f JOIN airports src ON f.SourceAirport = src.AirportCode JOIN airports dst ON f.DestAirport = dst.AirportCode WHERE src.City = 'Aberdeen' AND dst.City = 'Ashley'; 
SELECT COUNT(f.FlightNo) AS NumberOfFlights FROM airlines a LEFT JOIN flights f ON a.uid = f.Airline WHERE a.Airline = 'JetBlue Airways'; 
SELECT COUNT(*) FROM flights WHERE Airline = (SELECT uid FROM airlines WHERE Airline = 'JetBlue Airways'); 
SELECT COUNT(*)  FROM flights  INNER JOIN airlines  ON flights.Airline = airlines.uid  WHERE airlines.Airline = 'United Airlines' AND flights.DestAirport = 'ASY'; 
SELECT COUNT(*) FROM flights WHERE Airline = 1 AND DestAirport = ' ASY'; 
SELECT COUNT(*) FROM flights AS f INNER JOIN airlines AS a ON f.Airline = a.uid WHERE a.Airline = 'United Airlines' AND f.SourceAirport = 'AHD'; 
SELECT COUNT(*) FROM flights WHERE Airline = 1 AND SourceAirport = 'AHD';
SELECT COUNT(*) FROM flights JOIN airports ON TRIM(flights.DestAirport) = airports.AirportCode WHERE flights.Airline = 1 AND airports.City = 'Aberdeen '; 
SELECT COUNT(*)  FROM airlines  INNER JOIN flights  ON airlines.uid = flights.Airline  WHERE airlines.Airline = 'United Airlines'  AND flights.DestAirport IN ('APG', 'ABR'); 
SELECT a.City, COUNT(f.FlightNo) as ArrivalCount FROM flights f INNER JOIN airports a ON f.DestAirport = a.AirportCode GROUP BY a.City ORDER BY ArrivalCount DESC; 
SELECT City FROM airports WHERE AirportCode = ( SELECT DestAirport FROM flights GROUP BY DestAirport ORDER BY COUNT(DestAirport) DESC LIMIT 1 )
SELECT City, COUNT(f.SourceAirport) as DepartureCount FROM flights f JOIN airports a ON TRIM(f.SourceAirport) = TRIM(a.AirportCode) GROUP BY TRIM(a.City) ORDER BY DepartureCount DESC LIMIT 1; 
SELECT a.City FROM flights f JOIN airports a ON f.SourceAirport = a.AirportCode GROUP BY a.City ORDER BY COUNT(f.SourceAirport) DESC LIMIT 1; 
WITH FlightCounts AS (   SELECT SourceAirport AS AirportCode, COUNT(*) AS FlightCount FROM flights   UNION ALL   SELECT DestAirport AS AirportCode, COUNT(*) AS FlightCount FROM flights ) SELECT AirportCode, FlightCount FROM FlightCounts GROUP BY AirportCode ORDER BY FlightCount DESC LIMIT 1; 
WITH flight_counts AS (     SELECT SourceAirport AS AirportCode FROM flights     UNION ALL     SELECT DestAirport AS AirportCode FROM flights ) SELECT AirportCode, COUNT(*) AS FlightCount FROM flight_counts GROUP BY AirportCode ORDER BY FlightCount DESC LIMIT 1; 
WITH AirportFlights AS (   SELECT SourceAirport AS AirportCode FROM flights   UNION ALL   SELECT DestAirport AS AirportCode FROM flights ) SELECT AirportCode, COUNT(*) as Count FROM AirportFlights GROUP BY AirportCode ORDER BY Count LIMIT 1; 
SELECT TRIM(AirportCode, ' ') FROM (   SELECT SourceAirport as AirportCode FROM flights   UNION ALL   SELECT DestAirport FROM flights ) GROUP BY AirportCode ORDER BY COUNT(AirportCode) ASC LIMIT 1; 
SELECT Airline, COUNT(*) as FlightCount FROM flights GROUP BY Airline ORDER BY FlightCount DESC LIMIT 1; 
SELECT a.Airline, COUNT(f.FlightNo) as FlightCount FROM airlines a JOIN flights f ON a.uid = f.Airline GROUP BY a.Airline ORDER BY FlightCount DESC LIMIT 1; 
SELECT Abbreviation, Country FROM airlines WHERE uid NOT IN (SELECT Airline FROM flights)
SELECT T2.Abbreviation, T2.Country FROM (   SELECT Airline, COUNT(*) as flight_count   FROM flights   GROUP BY Airline ) AS T1 JOIN airlines AS T2 ON T1.Airline = T2.uid WHERE T1.flight_count = (SELECT MIN(flight_count) FROM (SELECT Airline, COUNT(*) as flight_count FROM flights GROUP BY Airline) AS T) 
SELECT DISTINCT T1.Airline FROM airlines T1 INNER JOIN flights T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'AHD'; 
SELECT DISTINCT Airline FROM airlines AS A INNER JOIN flights AS F ON A.uid = F.Airline WHERE F.SourceAirport = ' AHD'; 
SELECT DISTINCT a.Airline  FROM flights f INNER JOIN airlines a  ON f.Airline = a.uid  WHERE f.DestAirport = 'AHD'; 
SELECT T1.Airline  FROM airlines AS T1  JOIN flights AS T2  ON T1.uid = T2.Airline  WHERE T2.DestAirport = 'AHD'; 
SELECT a.Airline FROM airlines a JOIN flights f ON a.uid = f.Airline WHERE f.SourceAirport IN ('APG', 'CVO') GROUP BY a.Airline HAVING COUNT(DISTINCT CASE WHEN f.SourceAirport = 'APG' THEN f.FlightNo END) >= 1 AND COUNT(DISTINCT CASE WHEN f.SourceAirport = 'CVO' THEN f.FlightNo END) >= 1; 
SELECT Airline FROM flights WHERE SourceAirport = 'APG' INTERSECT SELECT Airline FROM flights WHERE SourceAirport = 'CVO' 
SELECT Airline FROM airlines WHERE uid IN (SELECT Airline FROM flights WHERE SourceAirport = 'CVO') AND uid NOT IN (SELECT Airline FROM flights WHERE SourceAirport = 'APG'); 
SELECT A.Airline FROM airlines A JOIN flights F ON A.uid = F.Airline WHERE F.SourceAirport = 'CVO' AND A.uid NOT IN (SELECT Airline FROM flights WHERE SourceAirport = 'APG') GROUP BY A.Airline;
SELECT a.Airline FROM airlines a INNER JOIN flights l ON a.uid = l.Airline GROUP BY a.Airline, l.Airline HAVING COUNT(l.FlightNo) >= 10
SELECT a.Airline FROM flights f JOIN airlines a ON f.Airline = a.uid GROUP BY a.Airline HAVING COUNT(f.FlightNo) >= 10; 
SELECT Airline FROM `flights` GROUP BY Airline HAVING COUNT(FlightNo) < 200
SELECT Airline, COUNT(FlightNo) as TotalFlights FROM airlines LEFT JOIN flights ON uid = Airline GROUP BY uid HAVING COUNT(FlightNo) < 200
SELECT f.FlightNo FROM flights f INNER JOIN airlines a ON f.Airline = a.uid WHERE a.Airline = 'United Airlines'; 
SELECT FlightNo FROM flights WHERE Airline = 1;
SELECT FlightNo FROM flights WHERE SourceAirport = 'APG';
SELECT FlightNo FROM flights WHERE SourceAirport = ' APG';
SELECT FlightNo FROM flights WHERE DestAirport = 'APG'
SELECT FlightNo FROM flights WHERE DestAirport = ' APG';
SELECT T1.FlightNo FROM flights AS T1 INNER JOIN airports AS T2 ON T1.SourceAirport = T2.AirportCode WHERE T2.City = 'Aberdeen '; 
SELECT T1.FlightNo FROM flights AS T1 JOIN airports AS T2 ON T1.SourceAirport = T2.AirportCode WHERE T2.City = 'Aberdeen '; 
SELECT T1.FlightNo FROM flights T1 INNER JOIN airports T2 ON T1.DestAirport = T2.AirportCode WHERE T2.City = 'Aberdeen '; 
SELECT FlightNo FROM flights WHERE DestAirport = ' APG' OR DestAirport = ' ABR'
SELECT COUNT(*) FROM flights WHERE DestAirport IN ('APG', 'ABR', 'ABI', 'DYS');
SELECT COUNT(*) FROM flights WHERE DestAirport IN (SELECT AirportCode FROM airports WHERE City IN ('Aberdeen ', 'Abilene ')); 
SELECT AirportName FROM airports WHERE AirportCode NOT IN (SELECT SourceAirport FROM flights UNION SELECT DestAirport FROM flights); 
SELECT AirportCode FROM airports WHERE AirportCode NOT IN (SELECT SourceAirport FROM flights UNION SELECT DestAirport FROM flights)
SELECT COUNT(*) FROM employee; 
SELECT COUNT(Employee_ID) FROM employee;
SELECT Name, Age FROM employee ORDER BY Age ASC;
SELECT Name, Age FROM employee ORDER BY Age ASC;
SELECT City, COUNT(Employee_ID) FROM employee GROUP BY City; 
SELECT City, COUNT(Employee_ID) AS Employee_Count FROM employee GROUP BY City
SELECT City FROM employee WHERE Age < 30 GROUP BY City HAVING COUNT(Name) > 1 
SELECT City FROM employee WHERE Age < 30 GROUP BY City HAVING COUNT(Name) > 1 
SELECT Location, COUNT(Shop_ID) FROM shop GROUP BY Location; 
SELECT Location, COUNT(Shop_ID) FROM shop GROUP BY Location 
SELECT Manager_name, District FROM shop WHERE Number_products = (SELECT MAX(Number_products) FROM shop);
SELECT Manager_name, District FROM shop WHERE Number_products = ( SELECT MAX(Number_products) FROM shop )
SELECT MIN(Number_products), MAX(Number_products) FROM shop;
SELECT MIN(Number_products), MAX(Number_products) FROM shop;
SELECT Name, Location, District FROM shop ORDER BY Number_products DESC;
SELECT Name, Location, District FROM shop ORDER BY Number_products DESC;
SELECT Name FROM shop WHERE Number_products > (SELECT AVG(Number_products) FROM shop)
SELECT Name FROM shop WHERE Number_products > (SELECT AVG(Number_products) FROM shop); 
SELECT e.Name FROM employee e WHERE e.Employee_ID = (SELECT ev.Employee_ID FROM evaluation ev GROUP BY ev.Employee_ID ORDER BY COUNT(*) DESC LIMIT 1) 
To determine which employee received the most awards, we count the evaluations per employee. The employee with the highest count is George Chuter.  SELECT e.Name FROM employee e WHERE e.Employee_ID = (SELECT CAST(ev.Employee_ID AS INTEGER) FROM evaluation ev GROUP BY ev.Employee_ID ORDER BY COUNT(*) DESC LIMIT 1)
SELECT T1.Name FROM employee AS T1 INNER JOIN evaluation AS T2 ON CAST(T1.Employee_ID AS TEXT) = T2.Employee_ID ORDER BY T2.Bonus DESC LIMIT 1; 
SELECT e2.Name FROM evaluation e1  JOIN employee e2 ON e1.Employee_ID = e2.Employee_ID  WHERE e1.Bonus = (SELECT MAX(Bonus) FROM evaluation); 
SELECT e.Name FROM employee e LEFT JOIN evaluation ev ON CAST(e.Employee_ID AS TEXT) = ev.Employee_ID WHERE ev.Employee_ID IS NULL; 
SELECT e.Name FROM employee e LEFT JOIN evaluation ev ON e.Employee_ID = ev.Employee_ID WHERE ev.Employee_ID IS NULL
SELECT S.Name FROM shop S WHERE S.Shop_ID = (     SELECT Shop_ID FROM (         SELECT Shop_ID, COUNT(*) AS count_employees FROM hiring GROUP BY Shop_ID     ) AS T ORDER BY count_employees DESC LIMIT 1 ); 
SELECT s.Name FROM shop s JOIN (     SELECT Shop_ID, COUNT(Employee_ID) as cnt     FROM hiring     GROUP BY Shop_ID ) h ON s.Shop_ID = h.Shop_ID ORDER BY cnt DESC LIMIT 1; 
SELECT s.Name  FROM shop s  LEFT JOIN hiring h ON s.Shop_ID = h.Shop_ID  WHERE h.Shop_ID IS NULL  GROUP BY s.Name; 
SELECT Name  FROM shop  LEFT JOIN hiring ON shop.Shop_ID = hiring.Shop_ID  WHERE hiring.Employee_ID IS NULL; 
SELECT T1.Name, COUNT(T2.Employee_ID) AS number_of_employees FROM shop AS T1 INNER JOIN hiring AS T2 ON T1.Shop_ID = T2.Shop_ID GROUP BY T1.Name
SELECT s.Name, COUNT(h.Employee_ID) AS number_of_employees FROM shop s INNER JOIN hiring h ON s.Shop_ID = h.Shop_ID GROUP BY s.Name, s.Shop_ID
SELECT SUM(Bonus) AS Total_Bonus FROM evaluation;
To find the total amount of bonuses given in all evaluations, we need to sum the `Bonus` column from the `evaluation` table.  **Step-by-step Explanation:**  1. **Identify the Relevant Table and Column:** The `evaluation` table contains the bonuses, with the `Bonus` column holding the respective amounts. 2. **Sum the Bonuses:** Use the `SUM()` function on the `Bonus` column to compute the total.  **SQL Query:**  SELECT SUM(Bonus) FROM evaluation;
SELECT * FROM hiring;
SELECT * FROM hiring INNER JOIN shop ON hiring.Shop_ID = shop.Shop_ID INNER JOIN employee ON hiring.Employee_ID = employee.Employee_ID
To determine which districts have both stores with less than 3000 products and stores with more than 10000 products, we can use the following SQL query:  SELECT District FROM shop GROUP BY District HAVING COUNT(CASE WHEN Number_products < 3000 THEN 1 ELSE NULL END) > 0 AND COUNT(CASE WHEN Number_products > 10000 THEN 1 ELSE NULL END) > 0
SELECT District FROM shop WHERE Number_products < 3000 INTERSECT SELECT District FROM shop WHERE Number_products > 10000; 
SELECT COUNT(DISTINCT Location) FROM shop; 
SELECT COUNT(DISTINCT Location) FROM shop;
To determine the number of documents present in the database, we'll use the COUNT(*) function on the 'Documents' table. This will count each row, which corresponds to a document.  **Step-by-step Explanation:** 1. **Identify the relevant table:** The 'Documents' table contains records of all documents. 2. **Use the COUNT() function:** The COUNT(*) function counts all rows in the specified table. 3. **Execute the query:** SELECT COUNT(*) FROM Documents; will provide the total number of documents.  **Answer:** SELECT COUNT(*) FROM Documents;
SELECT COUNT(*) FROM Documents; 
SELECT Document_ID, Document_Name, Document_Description FROM Documents;
SELECT Document_ID, Document_Name, Document_Description FROM Documents;
SELECT Document_Name, Template_ID FROM Documents WHERE LOWER(Document_Description) LIKE '%w%'; 
SELECT Document_Name, Template_ID FROM Documents WHERE Document_Description LIKE '%w%';
SELECT Document_ID, Template_ID, Document_Description FROM Documents WHERE Document_Name = 'Robbin CV';
SELECT Document_ID, Template_ID, Document_Description FROM Documents WHERE Document_Name = 'Robbin CV';
SELECT COUNT(DISTINCT Template_ID) AS Number_of_Different_Templates FROM Documents WHERE Template_ID IS NOT NULL; 
SELECT COUNT(DISTINCT Template_ID) FROM Documents;
SELECT COUNT(D.Document_ID)  FROM Documents D  INNER JOIN Templates T  ON D.Template_ID = T.Template_ID  WHERE T.Template_Type_Code = 'PPT'; 
SELECT COUNT(*) FROM Templates INNER JOIN Documents ON Templates.Template_ID = Documents.Template_ID WHERE Templates.Template_Type_Code = 'PPT'; 
SELECT Template_ID, COUNT(Template_ID) FROM Documents GROUP BY Template_ID; 
SELECT Template_ID, COUNT(*) AS Usage_Count FROM Documents WHERE Template_ID IS NOT NULL GROUP BY Template_ID; 
SELECT T.Template_ID, T.Template_Type_Code FROM Templates T JOIN (   SELECT Template_ID, COUNT(*) as cnt   FROM Documents   WHERE Template_ID IS NOT NULL   GROUP BY Template_ID ) D ON T.Template_ID = D.Template_ID WHERE D.cnt = (   SELECT MAX(cnt)   FROM (     SELECT Template_ID, COUNT(*) as cnt     FROM Documents     WHERE Template_ID IS NOT NULL     GROUP BY Template_ID   ) AS counts ); 
SELECT T.Template_ID, T.Template_Type_Code FROM Templates T INNER JOIN (   SELECT Template_ID, COUNT(Document_ID) as count   FROM Documents   GROUP BY Template_ID ) D ON T.Template_ID = D.Template_ID WHERE D.count = (   SELECT MAX(count)   FROM (     SELECT Template_ID, COUNT(Document_ID) as count     FROM Documents     GROUP BY Template_ID   ) D ); 
SELECT Template_ID FROM Documents WHERE Template_ID IS NOT NULL GROUP BY Template_ID HAVING COUNT(*) > 1; 
SELECT Template_ID FROM Documents GROUP BY Template_ID HAVING COUNT(*) > 1 AND Template_ID IS NOT NULL; 
SELECT Template_ID FROM Templates WHERE Template_ID NOT IN (SELECT Template_ID FROM Documents WHERE Template_ID IS NOT NULL)
SELECT T.Template_ID FROM Templates T LEFT JOIN Documents D ON T.Template_ID = D.Template_ID WHERE D.Template_ID IS NULL
SELECT COUNT(*) FROM Templates; 
SELECT COUNT(*) FROM Templates; 
SELECT Template_ID, Version_Number, Template_Type_Code FROM Templates;
SELECT Template_ID, Version_Number, Template_Type_Code FROM Templates;
SELECT DISTINCT Template_Type_Code FROM Templates; 
SELECT DISTINCT Template_Type_Code FROM Ref_Template_Types; 
SELECT Template_ID FROM Templates WHERE Template_Type_Code IN ('PP', 'PPT');
SELECT Template_ID FROM Templates WHERE Template_Type_Code = 'PP' OR Template_Type_Code = 'PPT';
SELECT COUNT(Template_ID) FROM Templates WHERE Template_Type_Code = 'CV'; 
To count the number of CV templates, we need to query the Templates table for entries where the Template_Type_Code is 'CV'.  **Step-by-Step Explanation:**  1. **Identify Relevant Tables:** The Templates table contains the necessary information, specifically the Template_Type_Code column.  2. **Filter by CV Type:** We filter the rows where Template_Type_Code equals 'CV'.  3. **Count the Rows:** Use the COUNT(*) function to determine the number of such templates.  **Answer:**  SELECT COUNT(*) FROM Templates WHERE Template_Type_Code = 'CV';
SELECT Version_Number, Template_Type_Code FROM Templates WHERE Version_Number > 5;
SELECT Version_Number, Template_Type_Code FROM Templates WHERE Version_Number > 5;
SELECT rt.Template_Type_Code, COUNT(t.Template_ID) as Number_of_Templates FROM Ref_Template_Types rt LEFT JOIN Templates t ON rt.Template_Type_Code = t.Template_Type_Code GROUP BY rt.Template_Type_Code; 
SELECT Template_Type_Code, COUNT(Template_ID) AS Count FROM Templates GROUP BY Template_Type_Code; 
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code ORDER BY COUNT(Template_ID) DESC LIMIT 1; 
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code HAVING COUNT(Template_ID) < 3; 
SELECT rtt.Template_Type_Code FROM Ref_Template_Types rtt INNER JOIN Templates t ON rtt.Template_Type_Code = t.Template_Type_Code GROUP BY rtt.Template_Type_Code HAVING COUNT(t.Template_ID) < 3; 
SELECT Version_Number, Template_Type_Code FROM Templates ORDER BY Version_Number ASC LIMIT 1;
SELECT Template_Type_Code, Version_Number FROM Templates WHERE Version_Number = (SELECT MIN(Version_Number) FROM Templates); 
SELECT Template_Type_Code FROM Templates WHERE Template_ID = (SELECT Template_ID FROM Documents WHERE Document_Name = 'Data base'); 
SELECT T.Template_Type_Code FROM Templates T INNER JOIN Documents D ON T.Template_ID = D.Template_ID WHERE D.Document_Name = 'Data base'
SELECT D.Document_Name  FROM Templates T  INNER JOIN Documents D  ON T.Template_ID = D.Template_ID  WHERE T.Template_Type_Code = 'BK'; 
To find the names of documents that use templates with the code 'BK', we'll join the `Templates` and `Documents` tables on `Template_ID` and filter for the 'BK' code. Here's the SQL query:  SELECT D.Document_Name FROM Templates T INNER JOIN Documents D ON T.Template_ID = D.Template_ID WHERE T.Template_Type_Code = 'BK'
SELECT      RT.Template_Type_Code,     COALESCE(COUNT(D.Document_ID), 0) AS Documents_Count FROM      Ref_Template_Types RT     LEFT JOIN Templates T ON RT.Template_Type_Code = T.Template_Type_Code     LEFT JOIN Documents D ON T.Template_ID = D.Template_ID GROUP BY      RT.Template_Type_Code ORDER BY      RT.Template_Type_Code ASC; 
SELECT T.Template_Type_Code, COUNT(D.Document_ID) AS Number_of_Documents FROM Templates T JOIN Documents D ON T.Template_ID = D.Template_ID GROUP BY T.Template_Type_Code ORDER BY T.Template_Type_Code; 
SELECT Template_Type_Code FROM (     SELECT T.Template_Type_Code, COUNT(D.Document_ID) as count     FROM Templates T     INNER JOIN Documents D ON T.Template_ID = D.Template_ID     GROUP BY T.Template_Type_Code ) t WHERE count = (     SELECT MAX(count) FROM (         SELECT COUNT(D.Document_ID) as count         FROM Templates T         INNER JOIN Documents D ON T.Template_ID = D.Template_ID         GROUP BY T.Template_Type_Code     ) t ); 
To find the most commonly used template type code in the documents, we can use the following SQL query:  SELECT Template_Type_Code, COUNT(*) as count FROM Documents INNER JOIN Templates ON Documents.Template_ID = Templates.Template_ID GROUP BY Template_Type_Code ORDER BY count DESC LIMIT 1;
SELECT tt.Template_Type_Code FROM Ref_Template_Types tt WHERE tt.Template_Type_Code NOT IN (   SELECT t.Template_Type_Code   FROM Templates t   WHERE t.Template_ID IN (     SELECT d.Template_ID     FROM Documents d   ) ); 
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Code NOT IN (   SELECT T.Template_Type_Code    FROM Templates T   INNER JOIN Documents D ON T.Template_ID = D.Template_ID ) 
SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types; 
SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types; 
SELECT Template_Type_Description FROM Ref_Template_Types WHERE Template_Type_Code = 'AD'; 
SELECT `Template_Type_Description` FROM `Ref_Template_Types` WHERE `Template_Type_Code` = 'AD'
To retrieve the template type code for the description "Book", we query the `Ref_Template_Types` table.  **Step-by-Step Explanation:**  1. **Identify the Relevant Table:** The `Ref_Template_Types` table contains the necessary information, with columns `Template_Type_Code` and `Template_Type_Description`.  2. **Formulate the Query:** We need to select the `Template_Type_Code` where `Template_Type_Description` is 'Book'.  3. **Write the SQL Statement:** Use a SELECT statement with a WHERE clause to filter the description.  **Answer:**  SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Book';
SELECT `Template_Type_Code` FROM `Ref_Template_Types` WHERE `Template_Type_Description` = 'Book';
SELECT DISTINCT TT.Template_Type_Description  FROM Ref_Template_Types TT  JOIN Templates T ON TT.Template_Type_Code = T.Template_Type_Code  JOIN Documents D ON T.Template_ID = D.Template_ID; 
SELECT DISTINCT T.Template_Details FROM Templates T WHERE EXISTS (SELECT 1 FROM Documents D WHERE D.Template_ID = T.Template_ID)
SELECT T.Template_ID FROM Templates T INNER JOIN Ref_Template_Types R ON T.Template_Type_Code = R.Template_Type_Code WHERE R.Template_Type_Description = 'Presentation'; 
SELECT Template_ID FROM Templates INNER JOIN Ref_Template_Types ON Templates.Template_Type_Code = Ref_Template_Types.Template_Type_Code WHERE Template_Type_Description = 'Presentation'
SELECT COUNT(*) FROM Paragraphs
To count the number of paragraphs, you need to count the rows in the Paragraphs table. Each row represents a paragraph.  **Step-by-step explanation:**  1. **Identify the relevant table:** The Paragraphs table contains all paragraph entries, with each row representing a single paragraph. 2. **Count the rows:** Use the COUNT(*) function to count all rows in the Paragraphs table. 3. **Construct the SQL query:** The query should simply select the count of all rows from the Paragraphs table.  **Answer:**  SELECT COUNT(*) FROM Paragraphs;
SELECT COUNT(Paragraph_ID) FROM Paragraphs WHERE Document_ID = (SELECT Document_ID FROM Documents WHERE Document_Name = 'Summer Show'); 
SELECT COUNT(Paragraph_ID) AS Number_of_Paragraphs FROM Paragraphs WHERE Document_ID = (SELECT Document_ID FROM Documents WHERE Document_Name = 'Summer Show'); 
SELECT * FROM Paragraphs WHERE Paragraph_Text = 'Korea';
SELECT * FROM Paragraphs WHERE Paragraph_Text = 'Korea'; 
SELECT p.Paragraph_ID, p.Paragraph_Text FROM Documents d INNER JOIN Paragraphs p ON d.Document_ID = p.Document_ID WHERE d.Document_Name = 'Welcome to NY'; 
SELECT P.Paragraph_ID, P.Paragraph_Text FROM Paragraphs P INNER JOIN Documents D ON P.Document_ID = D.Document_ID WHERE D.Document_Name = 'Welcome to NY'; 
SELECT P.Paragraph_Text  FROM Paragraphs P  INNER JOIN Documents D  ON P.Document_ID = D.Document_ID  WHERE D.Document_Name = 'Customer reviews'; 
SELECT P.Paragraph_Text FROM Documents D INNER JOIN Paragraphs P ON D.Document_ID = P.Document_ID WHERE D.Document_Name = 'Customer reviews'; 
SELECT D.Document_ID, COUNT(P.Paragraph_ID) AS Number_of_Paragraphs FROM Documents D LEFT JOIN Paragraphs P ON D.Document_ID = P.Document_ID GROUP BY D.Document_ID ORDER BY D.Document_ID; 
SELECT D.Document_ID, COUNT(P.Paragraph_ID) AS Number_of_Paragraphs FROM Documents D LEFT JOIN Paragraphs P ON D.Document_ID = P.Document_ID GROUP BY D.Document_ID ORDER BY D.Document_ID; 
SELECT d.Document_ID, d.Document_Name, COUNT(p.Paragraph_ID) AS Number_of_Paragraphs FROM Documents d LEFT JOIN Paragraphs p ON d.Document_ID = p.Document_ID GROUP BY d.Document_ID, d.Document_Name; 
SELECT Document_ID, Document_Name, COUNT(Paragraph_ID) AS Number_of_Paragraphs FROM Documents LEFT JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID GROUP BY Document_ID, Document_Name;
SELECT Document_ID FROM Documents WHERE Document_ID IN (SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(*) >= 2); 
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(Paragraph_ID) >= 2; 
SELECT D.Document_ID, D.Document_Name FROM ( SELECT Document_ID, COUNT(*) as cnt FROM Paragraphs GROUP BY Document_ID ) p COUNTS JOIN Documents D ON pOUNTS.Document_ID = D.Document_ID ORDER BY cnt DESC LIMIT 1
SELECT D.Document_ID, D.Document_Name, COUNT(P.Paragraph_ID) AS ParagraphCount FROM Documents D JOIN Paragraphs P ON D.Document_ID = P.Document_ID GROUP BY D.Document_ID, D.Document_Name ORDER BY ParagraphCount DESC LIMIT 1; 
SELECT d.Document_ID, COUNT(p.Paragraph_ID) AS ParagraphCount FROM Documents d LEFT JOIN Paragraphs p ON d.Document_ID = p.Document_ID GROUP BY d.Document_ID ORDER BY ParagraphCount ASC LIMIT 1; 
SELECT Document_ID FROM (     SELECT Document_ID, COUNT(Paragraph_ID) as paragraph_count     FROM Paragraphs     GROUP BY Document_ID ) WHERE paragraph_count = (     SELECT MIN(paragraph_count)     FROM (         SELECT Document_ID, COUNT(Paragraph_ID) as paragraph_count         FROM Paragraphs         GROUP BY Document_ID     ) ) 
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(Paragraph_ID) BETWEEN 1 AND 2; 
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(*) BETWEEN 1 AND 2
To solve the problem, we need to identify document IDs that have paragraphs containing both 'Brazil' and 'Ireland'. We can achieve this by querying the Paragraphs table for these texts and then grouping the results to ensure each document has both required texts.  **Answer:**  SELECT Document_ID FROM Paragraphs WHERE Paragraph_Text IN ('Brazil', 'Ireland') GROUP BY Document_ID HAVING COUNT(DISTINCT Paragraph_Text) = 2;
SELECT Document_ID  FROM Paragraphs  WHERE Paragraph_Text IN ('Brazil', 'Ireland')  GROUP BY Document_ID  HAVING COUNT(DISTINCT Paragraph_Text) = 2; 
SELECT COUNT(*) FROM teacher;
SELECT COUNT(*) FROM teacher; 
SELECT Name, Age FROM teacher ORDER BY Age ASC;
SELECT Name, Age FROM teacher ORDER BY Age ASC; 
SELECT Age, Hometown FROM teacher;
SELECT Age, Hometown FROM teacher
SELECT Name FROM teacher WHERE Hometown != 'Little Lever Urban District';
SELECT Name FROM teacher WHERE Hometown != 'Little Lever Urban District';
SELECT Name FROM teacher WHERE Age = '32' OR Age = '33';
SELECT Name FROM teacher WHERE Age = '32' OR Age = '33';
SELECT Hometown FROM teacher WHERE CAST(Age AS INT) = (SELECT MIN(CAST(Age AS INT)) FROM teacher)
To determine the hometown of the youngest teacher, we convert the Age to an integer to accurately find the minimum value.  SELECT Hometown FROM teacher WHERE CAST(Age AS INT) = (SELECT MIN(CAST(Age AS INT)) FROM teacher)
SELECT Hometown, COUNT(Teacher_ID) FROM teacher GROUP BY Hometown;
To determine the number of teachers in each hometown, we'll use the `teacher` table, grouping by `Hometown` and counting the teachers.  SELECT Hometown, COUNT(Teacher_ID) AS Number_of_Teachers FROM teacher GROUP BY Hometown;
SELECT Hometown, COUNT(*) as count  FROM teacher  GROUP BY Hometown  ORDER BY count DESC  LIMIT 1; 
SELECT Hometown FROM teacher GROUP BY Hometown HAVING COUNT(Hometown) = (     SELECT MAX(count)     FROM (         SELECT Hometown, COUNT(Hometown) as count         FROM teacher         GROUP BY Hometown     ) ); 
SELECT Hometown FROM teacher GROUP BY Hometown HAVING COUNT(*) >= 2; 
SELECT DISTINCT Hometown FROM teacher GROUP BY Hometown HAVING COUNT(Teacher_ID) >= 2;
SELECT T.Name, C.Course FROM teacher T INNER JOIN course_arrange CA ON T.Teacher_ID = CA.Teacher_ID INNER JOIN course C ON CA.Course_ID = C.Course_ID
SELECT teacher.Name, course.Course FROM teacher INNER JOIN course_arrange ON teacher.Teacher_ID = course_arrange.Teacher_ID INNER JOIN course ON course.Course_ID = course_arrange.Course_ID; 
SELECT T.Name AS Teacher, C.Course AS Course FROM teacher T INNER JOIN course_arrange CA ON T.Teacher_ID = CA.Teacher_ID INNER JOIN course C ON CA.Course_ID = C.Course_ID ORDER BY T.Name ASC;
SELECT teacher.Name, course.Course FROM teacher INNER JOIN course_arrange ON teacher.Teacher_ID = course_arrange.Teacher_ID INNER JOIN course ON course_arrange.Course_ID = course.Course_ID ORDER BY teacher.Name ASC
SELECT T.Name FROM teacher T INNER JOIN course_arrange CA ON T.Teacher_ID = CA.Teacher_ID INNER JOIN course C ON CA.Course_ID = C.Course_ID WHERE C.Course = 'Math'; 
To find the names of the people who teach math courses, we need to join the `course_arrange` and `teacher` tables. The math course has a `Course_ID` of 2, so we filter by that and select the teacher's name.  SELECT t.Name   FROM teacher t   INNER JOIN course_arrange ca   ON t.Teacher_ID = ca.Teacher_ID   WHERE ca.Course_ID = 2;
SELECT T.Name, COUNT(ca.Course_ID) AS Number_of_Courses FROM teacher T LEFT JOIN course_arrange ca ON T.Teacher_ID = ca.Teacher_ID WHERE ca.Teacher_ID IS NOT NULL GROUP BY T.Teacher_ID, T.Name; 
SELECT T.Name, COUNT(CA.Course_ID) AS Number_of_Courses FROM teacher T LEFT JOIN course_arrange CA ON T.Teacher_ID = CA.Teacher_ID GROUP BY T.Teacher_ID 
SELECT t.Name, COUNT(ca.Teacher_ID) AS Number_of_Courses FROM teacher t JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID GROUP BY t.Teacher_ID, t.Name HAVING COUNT(ca.Teacher_ID) >= 2; 
SELECT Name FROM teacher WHERE Teacher_ID IN (     SELECT Teacher_ID     FROM course_arrange     GROUP BY Teacher_ID     HAVING COUNT(DISTINCT Course_ID) >= 2 ); 
SELECT Name FROM teacher WHERE Teacher_ID NOT IN (SELECT Teacher_ID FROM course_arrange); 
SELECT Name FROM teacher WHERE Teacher_ID NOT IN (SELECT Teacher_ID FROM course_arrange);
SELECT COUNT(ID) FROM visitor WHERE Age < 30;
SELECT Name FROM visitor WHERE Level_of_membership > 4 ORDER BY Level_of_membership DESC;
SELECT AVG(Age) FROM visitor WHERE Level_of_membership <= 4;
SELECT Name, Level_of_membership FROM visitor WHERE Level_of_membership > 4 ORDER BY Age DESC;
SELECT Museum_ID, Name FROM museum ORDER BY Num_of_Staff DESC LIMIT 1; 
SELECT AVG(Num_of_Staff) AS Average_Staff FROM museum WHERE Open_Year < '2009'; 
SELECT Open_Year, Num_of_Staff FROM museum WHERE Name = 'Plaza Museum'; 
SELECT Name FROM museum WHERE Num_of_Staff > (SELECT MIN(Num_of_Staff) FROM museum WHERE CAST(Open_Year AS INT) > 2010)
SELECT ID, Name, Age FROM visitor WHERE ID IN (SELECT CAST(visitor_ID AS INT) FROM visit GROUP BY visitor_ID HAVING COUNT(visitor_ID) > 1); 
SELECT v.ID, v.Name, v.Level_of_membership FROM visitor v INNER JOIN (   SELECT visitor_ID, SUM(Total_spent) as total_spent   FROM visit   GROUP BY visitor_ID ) vt ON v.ID = vt.visitor_ID WHERE vt.total_spent = (   SELECT MAX(total_spent)   FROM (     SELECT visitor_ID, SUM(Total_spent) as total_spent     FROM visit     GROUP BY visitor_ID   ) vt2 ); 
SELECT T1.Museum_ID, T1.Name FROM museum AS T1 INNER JOIN (SELECT Museum_ID, COUNT(*) as cnt FROM visit GROUP BY Museum_ID) AS T2 ON T1.Museum_ID = T2.Museum_ID WHERE T2.cnt = (SELECT MAX(cnt) FROM (SELECT Museum_ID, COUNT(*) as cnt FROM visit GROUP BY Museum_ID) AS T3) 
SELECT m.Name  FROM museum m  LEFT JOIN visit v  ON m.Museum_ID = v.Museum_ID  WHERE v.Museum_ID IS NULL 
SELECT Name, Age FROM visitor WHERE ID = (SELECT visitor_ID FROM visit WHERE Num_of_Ticket = (SELECT MAX(Num_of_Ticket) FROM visit)); 
SELECT AVG(Num_of_Ticket) AS average_tickets, MAX(Num_of_Ticket) AS max_tickets FROM visit; 
SELECT SUM(T.Total_spent)  FROM visit T  INNER JOIN visitor V ON T.visitor_ID = V.ID  WHERE V.Level_of_membership = 1; 
SELECT v.Name FROM visitor v WHERE EXISTS (     SELECT 1     FROM visit vis     JOIN museum m ON vis.Museum_ID = m.Museum_ID     WHERE v.ID = vis.visitor_ID     AND CAST(m.Open_Year AS INT) < 2009 ) AND EXISTS (     SELECT 1     FROM visit vis     JOIN museum m ON vis.Museum_ID = m.Museum_ID     WHERE v.ID = vis.visitor_ID     AND CAST(m.Open_Year AS INT) > 2011 ); 
SELECT (SELECT COUNT(ID) FROM visitor) - (SELECT COUNT(DISTINCT visitor_ID) FROM visit WHERE Museum_ID IN (SELECT Museum_ID FROM museum WHERE Open_Year > '2010')) AS Number_of_visitors; 
SELECT COUNT(Museum_ID) FROM museum WHERE Open_Year < '2008' OR Open_Year > '2013';
SELECT COUNT(player_id) FROM players; 
SELECT COUNT(*) FROM players; 
SELECT COUNT(*) FROM matches; 
SELECT COUNT(*) FROM matches; 
SELECT first_name, birth_date FROM players WHERE country_code = 'USA';
SELECT first_name, birth_date FROM players WHERE country_code = 'USA';
SELECT AVG(loser_age) AS avg_loser_age, AVG(winner_age) AS avg_winner_age FROM matches; 
SELECT AVG(loser_age) AS average_loser_age, AVG(winner_age) AS average_winner_age FROM matches; 
SELECT AVG(winner_rank) FROM matches;
SELECT AVG(winner_rank) FROM matches; 
SELECT MAX(loser_rank) FROM matches WHERE loser_rank IS NOT NULL; 
SELECT MIN(loser_rank) AS best_rank FROM matches WHERE loser_rank IS NOT NULL; 
SELECT COUNT(DISTINCT country_code) FROM players; 
SELECT COUNT(DISTINCT country_code) FROM players; 
SELECT COUNT(DISTINCT loser_name) FROM matches; 
SELECT COUNT(DISTINCT loser_name) FROM matches WHERE loser_name IS NOT NULL; 
SELECT tourney_name FROM matches GROUP BY tourney_name HAVING COUNT(*) > 10; 
SELECT tourney_name FROM matches GROUP BY tourney_name HAVING COUNT(tourney_name) > 10;
SELECT first_name, last_name FROM players WHERE player_id IN (   SELECT winner_id FROM matches WHERE year = 2013   INTERSECT   SELECT winner_id FROM matches WHERE year = 2016 ); 
SELECT first_name, last_name FROM players WHERE player_id IN (   SELECT winner_id FROM matches WHERE year = 2013   INTERSECT   SELECT winner_id FROM matches WHERE year = 2016 ); 
SELECT COUNT(*) FROM matches WHERE year = 2013 OR year = 2016;
SELECT COUNT(*) FROM matches WHERE year = 2013 OR year = 2016; 
SELECT p.first_name, p.country_code FROM players p WHERE p.player_id IN (     SELECT m.winner_id FROM matches m WHERE m.tourney_name = 'WTA Championships' ) AND p.player_id IN (     SELECT m.winner_id FROM matches m WHERE m.tourney_name = 'Australian Open' ); 
SELECT first_name, country_code FROM players WHERE player_id IN (   SELECT winner_id FROM matches WHERE tourney_name = 'WTA Championships'   INTERSECT   SELECT winner_id FROM matches WHERE tourney_name = 'Australian Open' ); 
SELECT first_name, country_code FROM players WHERE birth_date = (SELECT MIN(birth_date) FROM players); 
SELECT first_name, country_code FROM players WHERE birth_date = (SELECT MIN(birth_date) FROM players);
SELECT first_name, last_name FROM players ORDER BY birth_date ASC;
SELECT first_name, last_name, birth_date FROM players ORDER BY birth_date; 
SELECT first_name, last_name FROM players WHERE hand = 'L' ORDER BY birth_date;
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM players WHERE hand = 'L' ORDER BY birth_date; 
SELECT p.first_name, p.country_code FROM players p JOIN (     SELECT player_id, SUM(tours) as total_tours     FROM rankings     GROUP BY player_id     HAVING SUM(tours) > 0     ORDER BY total_tours DESC     LIMIT 1 ) r ON p.player_id = r.player_id; 
SELECT p.first_name, p.country_code FROM (   SELECT player_id, SUM(tours) as total_tours   FROM rankings   GROUP BY player_id   ORDER BY total_tours DESC   LIMIT 1 ) AS max_tours JOIN players p ON max_tours.player_id = p.player_id; 
SELECT year, COUNT(*) as num_matches FROM matches GROUP BY year ORDER BY num_matches DESC LIMIT 1; 
SELECT year, COUNT(tourney_id) FROM matches GROUP BY year ORDER BY COUNT(tourney_id) DESC LIMIT 1; 
SQL: SELECT T1.first_name, T1.last_name, T3.ranking_points FROM players AS T1 INNER JOIN ( SELECT T.winner_id, COUNT(T.winner_id) AS total_wins FROM matches AS T GROUP BY T.winner_id ORDER BY COUNT(T.winner_id) DESC LIMIT 1 ) AS T2 ON T1.player_id = T2.winner_id INNER JOIN rankings AS T3 ON T2.winner_id = T3.player_id ORDER BY T3.ranking_date DESC LIMIT 1
SELECT p.first_name, p.last_name, SUM(r.ranking_points) as total_rank_points FROM players p JOIN (     SELECT winner_id, COUNT(*) as win_count     FROM matches     GROUP BY winner_id     ORDER BY win_count DESC     LIMIT 1 ) m ON p.player_id = m.winner_id LEFT JOIN rankings r ON p.player_id = r.player_id; 
SELECT m.winner_name FROM matches m WHERE m.tourney_name = 'Australian Open' ORDER BY (SELECT MAX(ranking_points) FROM rankings WHERE player_id = m.winner_id) DESC LIMIT 1;
SELECT `winner_name` FROM `matches` WHERE `tourney_name` = 'Australian Open' ORDER BY `winner_rank_points` DESC LIMIT 1; 
SELECT winner_name, loser_name FROM matches WHERE minutes = (SELECT MAX(minutes) FROM matches); 
SELECT winner_name, loser_name FROM matches WHERE minutes = (SELECT MAX(minutes) FROM matches); 
SELECT first_name, AVG(ranking) FROM players INNER JOIN rankings ON players.player_id = rankings.player_id GROUP BY players.player_id, first_name
SELECT p.first_name, AVG(ranking) as average_ranking FROM players p INNER JOIN rankings r ON p.player_id = r.player_id GROUP BY p.first_name; 
SELECT first_name, SUM(ranking_points) AS total_ranking_points FROM players INNER JOIN rankings ON players.player_id = rankings.player_id GROUP BY rankings.player_id;
SELECT p.first_name, SUM(r.ranking_points) AS total_ranking_points FROM players p LEFT JOIN rankings r ON p.player_id = r.player_id GROUP BY p.player_id, p.first_name
SELECT country_code, COUNT(*) FROM players GROUP BY country_code;
SELECT country_code, COUNT(player_id) FROM players GROUP BY country_code ORDER BY country_code
SELECT country_code FROM players GROUP BY country_code HAVING COUNT(player_id) = (   SELECT MAX(cnt)   FROM (     SELECT country_code, COUNT(player_id) AS cnt     FROM players     GROUP BY country_code   ) AS sub ); 
SELECT country_code, COUNT(player_id) as count FROM players GROUP BY country_code HAVING COUNT(player_id) = (SELECT MAX(count)                            FROM (SELECT country_code, COUNT(player_id) as count                                  FROM players                                  GROUP BY country_code) as subquery); 
SELECT country_code FROM players GROUP BY country_code HAVING COUNT(player_id) > 50; 
To determine the country codes with more than 50 players, we group the players by their country code and filter those groups with a count exceeding 50.  SELECT country_code FROM players GROUP BY country_code HAVING COUNT(player_id) > 50;
SELECT ranking_date, SUM(tours) AS total_tours FROM rankings GROUP BY ranking_date; 
SELECT ranking_date, SUM(tours) AS total_tours FROM rankings GROUP BY ranking_date 
SELECT year, COUNT(*) AS number_of_matches FROM matches GROUP BY year; 
SELECT year, COUNT(*) AS number_of_matches FROM matches GROUP BY year ORDER BY year ASC; 
SELECT p.first_name, p.last_name, r.ranking FROM (   SELECT winner_id, MIN(winner_age) AS min_age   FROM matches   GROUP BY winner_id ) sub JOIN players p ON sub.winner_id = p.player_id JOIN rankings r ON p.player_id = r.player_id ORDER BY sub.min_age LIMIT 3; 
SELECT DISTINCT winner_id, winner_name, winner_rank, MIN(winner_age) AS youngest_age FROM matches GROUP BY winner_id, winner_name, winner_rank ORDER BY youngest_age ASC LIMIT 3; 
SELECT COUNT(DISTINCT m.winner_id) FROM matches m INNER JOIN players p ON m.winner_id = p.player_id WHERE m.tourney_name = 'WTA Championships' AND p.hand = 'L'; 
SELECT COUNT(DISTINCT p.player_id) AS left_wins FROM matches m INNER JOIN players p ON m.winner_id = p.player_id WHERE m.tourney_name = 'WTA Championships' AND p.hand = 'L';
SELECT p.first_name, p.country_code, p.birth_date FROM players p INNER JOIN matches m ON p.player_id = m.winner_id WHERE m.winner_rank_points = (SELECT MAX(winner_rank_points) FROM matches);
SELECT    p.first_name,   p.country_code,   p.birth_date FROM    players p   JOIN (     SELECT        winner_id,       SUM(winner_rank_points) AS total_points     FROM        matches     GROUP BY        winner_id     ORDER BY        total_points DESC     LIMIT 1   ) m   ON p.player_id = m.winner_id; 
SELECT hand AS "Hand Type", COUNT(*) AS "Number of Players" FROM players GROUP BY hand;
SELECT hand, COUNT(*) FROM players GROUP BY hand; 
To determine how many ships were captured, we need to count the entries in the 'ship' table where 'disposition_of_ship' is 'Captured'.  **Step-by-Step Explanation:** 1. **Select from the ship table**: Use `SELECT COUNT(*) FROM ship` to count all rows. 2. **Filter for 'Captured'**: Add `WHERE disposition_of_ship = 'Captured'` to only include captured ships.  **Answer:** SELECT COUNT(*) FROM ship WHERE disposition_of_ship = 'Captured';
SELECT name, tonnage FROM ship ORDER BY name DESC;
SELECT name, date, result FROM battle;
SELECT MAX(killed) as max_death, MIN(killed) as min_death FROM death; 
SELECT AVG(injured) FROM death; 
SELECT killed, injured, note FROM death INNER JOIN ship ON caused_by_ship_id = id WHERE tonnage = 't';
SELECT name, result FROM battle WHERE bulgarian_commander != 'Boril';
SELECT DISTINCT T1.id, T1.name  FROM battle AS T1  INNER JOIN ship AS T2  ON T1.id = T2.lost_in_battle  WHERE T2.ship_type = 'Brig';
SELECT b.id, b.name FROM battle b JOIN ship s ON b.id = s.lost_in_battle JOIN death d ON s.id = d.caused_by_ship_id GROUP BY b.id, b.name HAVING SUM(d.killed) > 10; 
SELECT ship.id, ship.name, SUM(death.injured) AS total_injured FROM death JOIN ship ON death.caused_by_ship_id = ship.id GROUP BY ship.id, ship.name ORDER BY total_injured DESC LIMIT 1; 
SELECT DISTINCT name FROM battle WHERE bulgarian_commander = 'Kaloyan' AND latin_commander = 'Baldwin I';
To determine the number of distinct results for the battles, we count the unique entries in the `result` column of the `battle` table using `COUNT(DISTINCT column_name)`.  **Step-by-Step Explanation:**  1. **Identify the Relevant Table and Column:** The data about battle results is stored in the `battle` table under the `result` column.  2. **Use `COUNT(DISTINCT)` Function:** This SQL function counts the number of unique entries in a specified column. Here, we apply it to the `result` column to get distinct outcomes.  3. **Construct the Query:** Select from `battle` and apply `COUNT(DISTINCT result)`.  **Answer:**    SELECT COUNT(DISTINCT result) FROM battle;
SELECT COUNT(*) FROM battle WHERE id NOT IN (SELECT lost_in_battle FROM ship WHERE tonnage = '225') 
SELECT b.name, b.date FROM battle b JOIN ship s1 ON b.id = s1.lost_in_battle JOIN ship s2 ON b.id = s2.lost_in_battle WHERE s1.name = 'Lettice' AND s2.name = 'HMS Atalanta';
SELECT name, result, bulgarian_commander FROM battle WHERE id NOT IN (SELECT lost_in_battle FROM ship WHERE location = 'English Channel')
SELECT note FROM death WHERE note LIKE '%East%';
SELECT line_1, line_2 FROM Addresses;
SELECT line_1, line_2 FROM Addresses; 
SELECT COUNT(course_id) FROM Courses; 
SELECT COUNT(*) FROM Courses; 
SELECT course_description FROM Courses WHERE course_name = 'math'; 
SELECT course_description FROM Courses WHERE course_name = 'math'; 
To find the zip code for the city "Port Chelsea," we query the Addresses table where the city matches and select the zip_postcode.  SELECT zip_postcode FROM Addresses WHERE city = 'Port Chelsea';
SELECT zip_postcode FROM Addresses WHERE city = 'Port Chelsea'; 
SELECT d.department_name, d.department_id, COUNT(dp.department_id) AS degree_count FROM Departments d INNER JOIN Degree_Programs dp ON d.department_id = dp.department_id GROUP BY d.department_id, d.department_name ORDER BY degree_count DESC LIMIT 1; 
SELECT D.department_name, D.department_id, COUNT(*) as num_degrees FROM Degree_Programs DP JOIN Departments D ON DP.department_id = D.department_id GROUP BY D.department_id, D.department_name ORDER BY num_degrees DESC LIMIT 1; 
SELECT COUNT(DISTINCT D.department_id) FROM Degree_Programs D; 
SELECT COUNT(DISTINCT department_id) FROM Degree_Programs; 
SELECT COUNT(DISTINCT degree_summary_name) FROM Degree_Programs; 
To determine how many different degrees are offered, we need to count the distinct degree_summary_name entries in the Degree_Programs table.  **Step-by-Step Explanation:** 1. **Identify the Relevant Table**: The Degree_Programs table contains information about different degree programs, including the degree_summary_name which indicates the type of degree (e.g., Bachelor, Master). 2. **Count Unique Degree Names**: Use the COUNT(DISTINCT) function on the degree_summary_name column to count each unique degree once.  **Answer:** SELECT COUNT(DISTINCT degree_summary_name) FROM Degree_Programs;
SELECT COUNT(*) FROM Degree_Programs INNER JOIN Departments ON Degree_Programs.department_id = Departments.department_id WHERE Departments.department_name = 'engineering'; 
SELECT      COUNT(DP.degree_program_id)  FROM      Degree_Programs DP  JOIN      Departments D ON DP.department_id = D.department_id  WHERE      D.department_name = 'engineering'; 
SELECT section_name, section_description FROM Sections; 
SELECT section_name, section_description FROM Sections;
SELECT C.course_id, C.course_name FROM Courses C INNER JOIN Sections S ON C.course_id = S.course_id GROUP BY C.course_id HAVING COUNT(S.section_id) <= 2; 
SELECT C.course_id, C.course_name FROM Courses C LEFT JOIN Sections S ON C.course_id = S.course_id GROUP BY C.course_id HAVING COUNT(S.section_id) < 2; 
SELECT section_name FROM Sections ORDER BY section_name DESC; 
SELECT section_name FROM Sections ORDER BY section_name DESC; 
SELECT s.semester_name, s.semester_id, COUNT(se.student_id) AS student_count FROM Semesters s JOIN Student_Enrolment se ON s.semester_id = se.semester_id GROUP BY s.semester_id ORDER BY student_count DESC LIMIT 1; 
WITH StudentCount AS (   SELECT se.semester_id, COUNT(DISTINCT se.student_id) as student_count   FROM Student_Enrolment se   GROUP BY se.semester_id ), MaxCount AS (   SELECT MAX(student_count) as max_count   FROM StudentCount ) SELECT s.semester_id, s.semester_name FROM Semesters s JOIN StudentCount sc ON s.semester_id = sc.semester_id WHERE sc.student_count = (SELECT max_count FROM MaxCount); 
SELECT department_description FROM Departments WHERE department_name LIKE '%the computer%'; 
SELECT department_description FROM Departments WHERE department_name LIKE '%computer%';
SELECT S.student_id, S.first_name, S.middle_name, S.last_name FROM Students S WHERE S.student_id IN (   SELECT SE1.student_id   FROM Student_Enrolment SE1   JOIN Student_Enrolment SE2    ON SE1.student_id = SE2.student_id    AND SE1.semester_id = SE2.semester_id   AND SE1.student_enrolment_id < SE2.student_enrolment_id ) 
SELECT first_name, middle_name, last_name, student_id FROM Students WHERE student_id IN (SELECT student_id FROM Student_Enrolment GROUP BY student_id, semester_id HAVING COUNT(degree_program_id) = 2); 
SELECT T3.first_name, T3.middle_name, T3.last_name FROM Student_Enrolment AS T1 INNER JOIN Degree_Programs AS T2 ON T1.degree_program_id = T2.degree_program_id INNER JOIN Students AS T3 ON T1.student_id = T3.student_id WHERE T2.degree_summary_name = 'Bachelor'
SELECT S.first_name, S.middle_name, S.last_name FROM Students S LEFT JOIN Student_Enrolment SE ON S.student_id = SE.student_id LEFT JOIN Degree_Programs DP ON SE.degree_program_id = DP.degree_program_id WHERE DP.degree_summary_name = 'Bachelor'; 
SELECT D.degree_summary_name AS Program_kind, COUNT(SE.student_id) AS Enrollment_count FROM Student_Enrolment SE LEFT JOIN Degree_Programs D ON SE.degree_program_id = D.degree_program_id GROUP BY D.degree_summary_name ORDER BY Enrollment_count DESC; 
SELECT dp.degree_summary_name, COUNT(DISTINCT se.student_id) FROM Student_Enrolment se JOIN Degree_Programs dp ON se.degree_program_id = dp.degree_program_id GROUP BY dp.degree_summary_name ORDER BY COUNT(DISTINCT se.student_id) DESC LIMIT 1; 
SELECT      a.degree_program_id,      a.degree_summary_name FROM      Degree_Programs a INNER JOIN (     SELECT          degree_program_id,          COUNT(DISTINCT student_id) AS student_count     FROM          Student_Enrolment     GROUP BY          degree_program_id ) b ON a.degree_program_id = b.degree_program_id WHERE b.student_count = (     SELECT          MAX(student_count)     FROM (         SELECT              degree_program_id,              COUNT(DISTINCT student_id) AS student_count         FROM              Student_Enrolment         GROUP BY              degree_program_id     ) ); 
SELECT dp.degree_program_id, dp.degree_summary_name FROM Degree_Programs dp JOIN (     SELECT degree_program_id, COUNT(DISTINCT student_id) as student_count     FROM Student_Enrolment     GROUP BY degree_program_id ) se ON dp.degree_program_id = se.degree_program_id ORDER BY se.student_count DESC LIMIT 1; 
SELECT S.student_id, S.first_name, S.middle_name, S.last_name, COUNT(SE.student_enrolment_id) AS number_of_enrollments FROM Students S JOIN (     SELECT student_id, COUNT(student_enrolment_id) AS enrollment_count     FROM Student_Enrolment     GROUP BY student_id ) SE ON S.student_id = SE.student_id ORDER BY SE.enrollment_count DESC; 
SELECT S.first_name, S.middle_name, S.last_name, S.student_id, E.enrollment_count FROM (   SELECT student_id, COUNT(*) AS enrollment_count   FROM Student_Enrolment   GROUP BY student_id ) E JOIN Students S ON E.student_id = S.student_id WHERE E.enrollment_count = (SELECT MAX(enrollment_count) FROM (   SELECT student_id, COUNT(*) AS enrollment_count   FROM Student_Enrolment   GROUP BY student_id )); 
SELECT s.semester_name FROM Semesters s LEFT JOIN Student_Enrolment se ON s.semester_id = se.semester_id WHERE se.semester_id IS NULL; 
SELECT s.semester_name FROM Semesters s LEFT JOIN Student_Enrolment se ON s.semester_id = se.semester_id WHERE se.semester_id IS NULL; 
SELECT DISTINCT course_name FROM Courses WHERE course_id IN (SELECT course_id FROM Student_Enrolment_Courses); 
SELECT DISTINCT c.course_name FROM Courses c INNER JOIN Student_Enrolment_Courses sec ON c.course_id = sec.course_id; 
SELECT c.course_name FROM Courses c JOIN (     SELECT course_id, COUNT(*) as enrollment_count     FROM Student_Enrolment_Courses     GROUP BY course_id ) AS ec ON c.course_id = ec.course_id WHERE ec.enrollment_count = (     SELECT MAX(enrollment_count)     FROM (         SELECT course_id, COUNT(*) as enrollment_count         FROM Student_Enrolment_Courses         GROUP BY course_id     ) AS sub ); 
SELECT C.course_name FROM (     SELECT course_id, COUNT(student_enrolment_id) AS student_count     FROM Student_Enrolment_Courses     GROUP BY course_id     ORDER BY student_count DESC ) AS sub JOIN Courses C ON sub.course_id = C.course_id LIMIT 1; 
SELECT S.last_name FROM Students S JOIN Addresses A ON S.current_address_id = A.address_id LEFT JOIN Student_Enrolment SE ON S.student_id = SE.student_id WHERE A.state_province_county = 'North Carolina'    AND SE.student_id IS NULL; 
SELECT s.last_name FROM Students s JOIN Addresses a ON s.current_address_id = a.address_id WHERE a.state_province_county = 'North Carolina' AND s.student_id NOT IN (SELECT student_id FROM Student_Enrolment);
To show the date and id of the transcript with at least 2 course results, you can use the following SQL query:  SELECT T.transcript_id, T.transcript_date FROM Transcripts T INNER JOIN Transcript_Contents TC ON T.transcript_id = TC.transcript_id GROUP BY T.transcript_id, T.transcript_date HAVING COUNT(TC.student_course_id) >= 2;
SELECT t.transcript_id, t.transcript_date FROM Transcripts t JOIN Transcript_Contents tc ON t.transcript_id = tc.transcript_id GROUP BY t.transcript_id HAVING COUNT(tc.transcript_id) >= 2; 
SELECT cell_mobile_number FROM Students WHERE first_name = 'Timmothy' AND last_name = 'Ward';
SELECT cell_mobile_number FROM Students WHERE first_name = 'Timmothy' AND last_name = 'Ward'; 
SELECT first_name, middle_name, last_name FROM Students WHERE date_first_registered = (SELECT MIN(date_first_registered) FROM Students); 
SELECT first_name, middle_name, last_name FROM Students WHERE date_first_registered = (SELECT MIN(date_first_registered) FROM Students WHERE date_first_registered IS NOT NULL) LIMIT 1; 
SELECT first_name, middle_name, last_name FROM Students WHERE date_left = (SELECT MIN(date_left) FROM Students WHERE date_left IS NOT NULL); 
SELECT first_name, middle_name, last_name FROM Students WHERE date_left IS NOT NULL ORDER BY date_left ASC LIMIT 1; 
SELECT first_name FROM Students WHERE current_address_id != permanent_address_id AND first_name IS NOT NULL;
SELECT first_name FROM Students WHERE current_address_id != permanent_address_id; 
SELECT a.address_id, a.line_1, a.line_2, a.line_3, a.city, a.zip_postcode, a.state_province_county, a.country, a.other_address_details FROM Addresses a JOIN (     SELECT current_address_id, COUNT(student_id) AS student_count     FROM Students     WHERE current_address_id IS NOT NULL     GROUP BY current_address_id ) s ON a.address_id = s.current_address_id ORDER BY s.student_count DESC LIMIT 1; 
SELECT a.address_id, a.line_1, a.line_2 FROM Addresses a JOIN (     SELECT address_id, COUNT(*) as cnt     FROM (         SELECT current_address_id as address_id FROM Students         UNION ALL         SELECT permanent_address_id FROM Students     ) s     GROUP BY address_id ) s2 ON a.address_id = s2.address_id ORDER BY s2.cnt DESC LIMIT 1; 
SELECT datetime(AVG(strftime('%s', transcript_date))) FROM Transcripts;
SELECT AVG(transcript_date) FROM Transcripts;
SELECT transcript_date, other_details FROM Transcripts ORDER BY transcript_date ASC LIMIT 1; 
SELECT transcript_date, other_details FROM Transcripts ORDER BY transcript_date ASC LIMIT 1; 
SELECT COUNT(*) FROM Transcripts; 
SELECT COUNT(*) FROM Transcripts; 
SELECT MAX(transcript_date) FROM Transcripts;
SELECT MAX(transcript_date) AS last_transcript_date FROM Transcripts; 
WITH counts AS (     SELECT student_course_id, COUNT(*) as transcript_count     FROM Transcript_Contents     GROUP BY student_course_id ) SELECT transcript_count as max_count, student_course_id FROM counts WHERE transcript_count = (SELECT MAX(transcript_count) FROM counts); 
SELECT      T1.course_id,      T1.student_enrolment_id FROM      Student_Enrolment_Courses T1 JOIN      Transcript_Contents T2 ON      T1.student_course_id = T2.student_course_id GROUP BY      T1.course_id, T1.student_enrolment_id HAVING      COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) FROM Transcript_Contents GROUP BY student_course_id) AS count); 
SELECT T.transcript_id, T.transcript_date FROM Transcripts T JOIN (     SELECT TC.transcript_id, COUNT(*) as count     FROM Transcript_Contents TC     GROUP BY TC.transcript_id ) AS sub ON T.transcript_id = sub.transcript_id WHERE sub.count = (SELECT MIN(count)                     FROM (                         SELECT transcript_id, COUNT(*) as count                         FROM Transcript_Contents                         GROUP BY transcript_id                     ) AS sub_count); 
SELECT T.transcript_id, T.transcript_date FROM Transcripts T JOIN (     SELECT transcript_id, COUNT(*) as cnt     FROM Transcript_Contents     GROUP BY transcript_id ) TC ON T.transcript_id = TC.transcript_id WHERE TC.cnt = (     SELECT MIN(cnt)     FROM (         SELECT transcript_id, COUNT(*) as cnt         FROM Transcript_Contents         GROUP BY transcript_id     ) sub ) GROUP BY T.transcript_id, T.transcript_date; 
SELECT semester_id FROM Student_Enrolment WHERE degree_program_id IN (SELECT degree_program_id FROM Degree_Programs WHERE degree_summary_name = 'Master')  INTERSECT  SELECT semester_id FROM Student_Enrolment WHERE degree_program_id IN (SELECT degree_program_id FROM Degree_Programs WHERE degree_summary_name = 'Bachelor') 
SELECT sem.semester_id FROM Student_Enrolment se JOIN Degree_Programs dp ON se.degree_program_id = dp.degree_program_id WHERE dp.degree_summary_name = 'Master'  INTERSECT  SELECT sem.semester_id FROM Student_Enrolment se JOIN Degree_Programs dp ON se.degree_program_id = dp.degree_program_id WHERE dp.degree_summary_name = 'Bachelor'; 
SELECT COUNT(DISTINCT current_address_id) FROM Students; 
SELECT a.* FROM Addresses a WHERE a.address_id IN (SELECT current_address_id FROM Students UNION SELECT permanent_address_id FROM Students); 
SELECT * FROM Students ORDER BY last_name DESC, first_name DESC, middle_name DESC;
SELECT other_student_details, first_name, middle_name, last_name FROM Students ORDER BY last_name DESC; 
SELECT * FROM Sections WHERE section_name = 'h' LIMIT 1; SELECT * FROM Sections AS S INNER JOIN Courses AS C ON S.course_id = C.course_id WHERE S.section_name = 'h' LIMIT 1;
SELECT section_description FROM Sections WHERE section_name = 'h'; 
SELECT s.first_name FROM Students s INNER JOIN Addresses a ON s.permanent_address_id = a.address_id WHERE a.country = 'Haiti' OR s.cell_mobile_number = '09700166582';
SELECT first_name FROM Students INNER JOIN Addresses ON Students.permanent_address_id = Addresses.address_id WHERE Addresses.country = 'Haiti' OR Students.cell_mobile_number = '09700166582';
SELECT Title FROM Cartoon ORDER BY Title ASC;
SELECT DISTINCT Title FROM Cartoon ORDER BY Title ASC;
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones';
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones'
SELECT COUNT(*) FROM Cartoon WHERE Written_by = 'Joseph Kuhr'; 
SELECT COUNT(*) FROM Cartoon WHERE Written_by = 'Joseph Kuhr' 
SELECT Title, Directed_by FROM Cartoon ORDER BY Original_air_date;
SELECT Title, Directed_by FROM Cartoon ORDER BY Original_air_date;
SELECT Title FROM Cartoon WHERE Directed_by = "Ben Jones" OR Directed_by = "Brandon Vietti";
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones' OR Directed_by = 'Brandon Vietti';
SELECT Country, COUNT(id) as Number_of_Channels FROM TV_Channel GROUP BY Country ORDER BY Number_of_Channels DESC; 
SELECT Country, COUNT(id) AS count FROM TV_Channel GROUP BY Country ORDER BY count DESC LIMIT 1; 
SELECT COUNT(DISTINCT series_name) AS series_count, COUNT(DISTINCT Content) AS content_count FROM TV_Channel; 
SELECT COUNT(DISTINCT series_name) AS number_of_series, COUNT(DISTINCT Content) AS number_of_contents FROM TV_Channel; 
SELECT Content FROM TV_Channel WHERE series_name = "Sky Radio";
SELECT Content FROM TV_Channel WHERE series_name = 'Sky Radio';
SELECT Package_Option FROM TV_Channel WHERE series_name = 'Sky Radio';
SELECT Package_Option FROM TV_Channel WHERE series_name = 'Sky Radio'
SELECT COUNT(*) FROM TV_Channel WHERE Language = 'English';
SELECT COUNT(*) FROM TV_Channel WHERE Language = 'English'; 
SELECT Language, COUNT(Language) AS count FROM TV_Channel GROUP BY Language ORDER BY count ASC LIMIT 1; 
SELECT Language, ChannelCount FROM (   SELECT COALESCE(Language, 'No Language') as Language, COUNT(*) as ChannelCount,     RANK() OVER (ORDER BY COUNT(*) ASC) as Rank   FROM TV_Channel   GROUP BY COALESCE(Language, 'No Language') ) WHERE Rank = 1; 
SELECT Language, COUNT(*) AS Number_of_Channels FROM TV_Channel GROUP BY Language
SELECT Language, COUNT(id) AS NumberOfChannels FROM TV_Channel GROUP BY Language;
SELECT T1.series_name FROM TV_Channel AS T1 INNER JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Title = 'The Rise of the Blue Beetle!';
SELECT DISTINCT TV_Channel.series_name FROM TV_Channel INNER JOIN Cartoon ON TV_Channel.id = Cartoon.Channel WHERE Cartoon.Title = 'The Rise of the Blue Beetle';
SELECT T1.Title FROM Cartoon AS T1 INNER JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T2.series_name = 'Sky Radio'; 
SELECT Title FROM Cartoon JOIN TV_Channel ON Cartoon.Channel = TV_Channel.id WHERE TV_Channel.series_name = 'Sky Radio';
SELECT Episode, Rating FROM TV_series ORDER BY CAST(Rating AS REAL) DESC;
SELECT Episode FROM TV_series ORDER BY CAST(Rating AS REAL) DESC;
SELECT Episode, Rating FROM TV_series ORDER BY Rating DESC LIMIT 3
SELECT Episode, Rating FROM TV_series ORDER BY Rating DESC LIMIT 3
SELECT MIN(Share) AS Minimum_Share, MAX(Share) AS Maximum_Share FROM TV_series;
SELECT MAX(Share) AS max_share, MIN(Share) AS min_share FROM TV_series;
SELECT Air_Date FROM TV_series WHERE Episode = "A Love of a Lifetime";
SELECT Air_Date FROM TV_series WHERE Episode = 'A Love of a Lifetime';
SELECT Weekly_Rank FROM TV_series WHERE Episode = 'A Love of a Lifetime';
SELECT Weekly_Rank FROM TV_series WHERE Episode = "A Love of a Lifetime";
SELECT T1.series_name  FROM TV_Channel T1  INNER JOIN TV_series T2  ON T1.id = T2.Channel  WHERE T2.Episode = 'A Love of a Lifetime'; 
SELECT series_name FROM TV_Channel WHERE id = (SELECT Channel FROM TV_series WHERE Episode = 'A Love of a Lifetime')
SELECT Episode FROM TV_series INNER JOIN TV_Channel ON TV_series.Channel = TV_Channel.id WHERE TV_Channel.series_name = 'Sky Radio';
SELECT Episode FROM TV_series WHERE Channel = (SELECT id FROM TV_Channel WHERE series_name = 'Sky Radio');
SELECT Directed_by, COUNT(*) as Number_of_Cartoons FROM Cartoon GROUP BY Directed_by 
SELECT Directed_by, COUNT(*) FROM Cartoon GROUP BY Directed_by;
SELECT Production_code, Channel FROM Cartoon WHERE Original_air_date = (SELECT MAX(Original_air_date) FROM Cartoon);
SELECT Production_code, Channel FROM Cartoon WHERE Original_air_date = (SELECT MAX(Original_air_date) FROM Cartoon); 
SELECT Package_Option, series_name FROM TV_Channel WHERE Hight_definition_TV = "Yes";
SELECT Package_Option, series_name FROM TV_Channel WHERE Hight_definition_TV = "Yes"
SELECT T1.Country FROM TV_Channel AS T1 INNER JOIN Cartoon AS T2 ON T2.Channel = T1.id WHERE T2.Written_by = 'Todd Casey'
SELECT DISTINCT T1.Country FROM TV_Channel AS T1 INNER JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Written_by = 'Todd Casey'
SELECT DISTINCT T1.Country FROM TV_Channel AS T1 LEFT JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Written_by = 'Todd Casey' AND T2.Channel NOT IN (SELECT Channel FROM Cartoon WHERE Written_by = 'Todd Casey')
SELECT Country FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Written_by = 'Todd Casey')
SELECT DISTINCT T1.series_name, T1.Country FROM TV_Channel AS T1 INNER JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Directed_by = 'Ben Jones' OR T2.Directed_by = 'Michael Chang'
SELECT T1.series_name, T1.Country FROM TV_Channel T1 JOIN (     SELECT Channel     FROM Cartoon     WHERE Directed_by = 'Ben Jones'     INTERSECT     SELECT Channel     FROM Cartoon     WHERE Directed_by = 'Michael Chang' ) T2 ON T1.id = T2.Channel; 
SELECT Pixel_aspect_ratio_PAR, Country FROM TV_Channel WHERE Language != 'English';
SELECT Pixel_aspect_ratio_PAR, Country FROM TV_Channel WHERE Language != 'English'
SELECT id FROM TV_Channel WHERE Country IN (SELECT Country FROM TV_Channel GROUP BY Country HAVING COUNT(id) > 2)
SELECT T1.id FROM TV_Channel AS T1 INNER JOIN TV_series AS T2 ON T1.id = T2.Channel GROUP BY T1.id HAVING COUNT(T2.id) > 2
SELECT id FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones') 
SELECT id FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones' AND Channel IS NOT NULL)
SELECT Package_Option FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones'); 
