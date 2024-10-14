SELECT MAX(`Percent (%) Eligible Free (K-12)`) AS HighestEligibleFreeRate FROM frpm WHERE `County Name` = 'Alameda' AND `School Type` = 'K-12 Schools (Public)'; 
SELECT `Percent (%) Eligible Free (Ages 5-17)` AS Rate FROM frpm WHERE `Age` BETWEEN 5 AND 17 AND `School Type` LIKE '%Continuation%' ORDER BY Rate ASC LIMIT 3; 
SELECT DISTINCT T2.Zip FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Charter School (Y/N)` = 1 AND T2.County = 'Fresno' AND T2.District = 'Fresno County Office of Education'
SELECT T2.MailStreet, T2.MailCity, T2.MailState, T2.MailZip FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T1.FRPM_Count_K_12 DESC LIMIT 1; 
SELECT s.Phone FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.`Charter School (Y/N)` = 1 AND f.Opened > '2000-01-01'; 
SELECT COUNT(DISTINCT f.School)  FROM frpm f  JOIN satscores s ON f.CDSCode = s.cds  WHERE s.AvgScrMath > 400 AND f.Virtual = 'F'; 
SELECT s.School, s.Magnet FROM schools s JOIN satscores st ON s.CDSCode = st.cds WHERE st.NumTstTakr > 500 AND (s.Magnet = 1 OR s.Educational_Option_Type LIKE '%Magnet%') 
SELECT s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.NumGE1500 > 0 ORDER BY ss.NumGE1500 DESC LIMIT 1; 
SELECT s.School, f.[FRPM Count (K-12)], COUNT(st.NumTstTakr) AS NumberOfSATTestTakers FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode JOIN satscores st ON f.CDSCode = st.cds WHERE f.[FRPM Count (K-12)] = (     SELECT MAX([FRPM Count (K-12)])     FROM frpm ) GROUP BY s.School, f.[FRPM Count (K-12)] ORDER BY f.[FRPM Count (K-12)] DESC; 
SELECT COUNT(*) FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrMath > 560 AND T1.CharterFundingType = 'Directly funded'
SELECT s.School, f.[FRPM Count (Ages 5-17)] FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode JOIN satscores st ON s.CDSCode = st.cds WHERE st.rtype = 'S' GROUP BY s.School, f.[FRPM Count (Ages 5-17)] ORDER BY AVG(st.AvgScrRead) DESC LIMIT 1; 
SELECT DISTINCT School_Code FROM frpm GROUP BY School_Code HAVING SUM(Enrollment (K-12)) + SUM(Enrollment (Ages 5-17)) > 500; 
SELECT MAX(f.`Percent (%) Eligible Free (Ages 5-17)`) AS HighestEligibleFreeRate FROM frpm f JOIN satscores s ON f.CDSCode = s.cds WHERE s.NumGE1500 / s.NumTstTakr > 0.3; 
SELECT s.Phone FROM schools s JOIN ( 	SELECT cds, CAST(NumGE1500 AS REAL) / NumTstTakr AS ExcellenceRate 	FROM satscores ) ss ON s.CDSCode = ss.cds ORDER BY ss.ExcellenceRate DESC LIMIT 3; 
SELECT s.NCESDist AS NCES_School_Identification_Number, SUM(f.Enrollment_Ages_5_17) AS Total_Enrollment_Ages_5_17 FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode GROUP BY s.NCESDist ORDER BY Total_Enrollment_Ages_5_17 DESC LIMIT 5; 
SELECT s.District, AVG(ss.AvgScrRead) AS AvgReadingScore FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode JOIN satscores ss ON f.CDSCode = ss.cds WHERE s.StatusType = 'Active' GROUP BY s.District ORDER BY AvgReadingScore DESC LIMIT 1
SELECT COUNT(*) FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.County = 'Alameda' AND T2.NumTstTakr < 100
SELECT s.School, AVG(sw.AvgScrWrite) AS AvgWritingScore, s.CharterNum FROM frpm f JOIN satscores sw ON f.CDSCode = sw.cds JOIN schools s ON f.CDSCode = s.CDSCode WHERE sw.AvgScrWrite > 499 AND s.CharterNum IS NOT NULL GROUP BY s.School, s.CharterNum ORDER BY AvgWritingScore DESC; 
SELECT COUNT(s.CDSCode) FROM frpm f JOIN satscores s ON f.CDSCode = s.cds JOIN schools sc ON f.CDSCode = sc.CDSCode WHERE sc.City = 'Fresno' AND f.CharterFundingType = 'Directly funded' AND s.NumTstTakr <= 250; 
SELECT s.Phone FROM schools s JOIN ( 	SELECT cds, AVG(AvgScrMath) AS AvgMathScore 	FROM satscores 	GROUP BY cds ) sub ON s.CDSCode = sub.cds ORDER BY sub.AvgMathScore DESC LIMIT 1; 
SELECT COUNT(*) FROM frpm WHERE County = 'Amador' AND Low_Grade = '9' AND High_Grade = '12'; 
SELECT COUNT(*) FROM frpm WHERE `County Name` = 'Los Angeles' AND `Free Meal Count (K-12)` > 500 AND `Free Meal Count (K-12)` < 700
SELECT s.School, st.NumTstTakr FROM schools s JOIN satscores st ON s.CDSCode = st.cds WHERE s.County = 'Contra Costa' ORDER BY st.NumTstTakr DESC LIMIT 1; 
SELECT s.School, s.Street, s.City, s.Zip, s.State, f.[Enrollment (K-12)] - f.[Enrollment (Ages 5-17)] AS EnrollmentDifference FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE ABS(f.[Enrollment (K-12)] - f.[Enrollment (Ages 5-17)]) > 30; 
SELECT s.School FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode JOIN satscores st ON s.CDSCode = st.cds WHERE f.[Percent (%) Eligible Free (K-12)] > 0.1 AND st.NumGE1500 >= 1; 
SELECT s.School, s.FundingType FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`County Name` = 'Riverside' GROUP BY s.School, s.FundingType HAVING AVG(f.[AvgScrMath]) > 400; 
SELECT s.School, s.Street, s.City, s.State, s.Zip FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.County = 'Monterey' AND f.`School Type` = 'High Schools (Public)' AND f.`FRPM Count (Ages 15-17)` > 800; 
SELECT s.School AS School_Name, AVG(sw.AvgScrWrite) AS Avg_Writing_Score, s.Phone AS Communication_Number FROM frpm f JOIN satscores sw ON f.CDSCode = sw.cds JOIN schools s ON f.CDSCode = s.CDSCode WHERE (f.OpenDate > '1991-12-31' OR f.ClosedDate < '2000-01-01') GROUP BY s.School, s.Phone; 
SELECT s.School, s.DOCType, f.[Enrollment (K-12)] - f.[Enrollment (Ages 5-17)] AS Diff FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.FundingType = 'Directly funded' GROUP BY s.School, s.DOCType, f.[Enrollment (K-12)], f.[Enrollment (Ages 5-17)] HAVING ABS(f.[Enrollment (K-12)] - f.[Enrollment (Ages 5-17)]) > (     SELECT AVG(ABS([Enrollment (K-12)] - [Enrollment (Ages 5-17)]))     FROM frpm     JOIN schools ON frpm.CDSCode = schools.CDSCode     WHERE schools.FundingType = 'Directly funded' ) ORDER BY Diff DESC; 
SELECT s.OpenDate FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.LowGrade = 'K' AND f.HighGrade = '12' ORDER BY f.Enrollment DESC LIMIT 1; 
SELECT T2.City, SUM(T1.`Enrollment (K-12)`) AS TotalEnrollment FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.LowGrade = 'K' AND T1.HighGrade = '12' GROUP BY T2.City ORDER BY TotalEnrollment ASC LIMIT 5; 
SELECT      `School Name`,      `Percent (%) Eligible Free (K-12)` AS EligibleFreeRate FROM      `frpm` WHERE      `Low Grade` = 'K' AND `High Grade` = '12' ORDER BY      `Enrollment (K-12)` DESC LIMIT 10, 2; 
SELECT      frpm.School Name AS School,     frpm.`FRPM Count (K-12)` / frpm.`Enrollment (K-12)` AS Eligible Free or Reduced Price Meal Rate FROM      frpm WHERE      frpm.`Ownership Code` = 66 AND frpm.Low Grade = 'K' AND frpm.High Grade = '12' ORDER BY      frpm.`FRPM Count (K-12)` DESC LIMIT 5; 
SELECT s.Website, s.School  FROM frpm f  JOIN schools s ON f.CDSCode = s.CDSCode  WHERE f.Free_Meal_Count_Ages_5_17 BETWEEN 1900 AND 2000; 
SELECT AVG(`Percent (%) Eligible Free (Ages 5-17)`) AS FreeRate FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.District LIKE '%Kacey Gibson%' AND `Enrollment (Ages 5-17)` > 0; 
SELECT T2.AdmEmail1  FROM frpm AS T1  INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode  WHERE T1.`Charter School (Y/N)` = 1  ORDER BY T1.`Enrollment (K-12)` ASC  LIMIT 1; 
SELECT s.AdmFName1, s.AdmLName1, s.AdmFName2, s.AdmLName2, s.AdmFName3, s.AdmLName3 FROM schools s JOIN (     SELECT cds     FROM satscores     WHERE NumGE1500 = (         SELECT MAX(NumGE1500)         FROM satscores     ) ) ss ON s.CDSCode = ss.cds; 
SELECT s.Street, s.City, s.Zip, s.State FROM schools s JOIN ( 	SELECT cds, CAST(NumGE1500 AS REAL) / NumTstTakr AS ExcellenceRate 	FROM satscores ) ss ON s.CDSCode = ss.cds ORDER BY ss.ExcellenceRate ASC LIMIT 1; 
SELECT T2.Website FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.County = 'Los Angeles' AND T1.NumTstTakr BETWEEN 2000 AND 3000
SELECT AVG(s.NumTstTakr) AS AverageTestTakers FROM frpm f JOIN satscores s ON f.CDSCode = s.cds JOIN schools sch ON f.CDSCode = sch.CDSCode WHERE sch.City = 'Fresno' AND YEAR(sch.OpenDate) = 1980; 
SELECT s.Phone FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.District = 'Fresno Unified' GROUP BY f.School Name, s.Phone ORDER BY AVG(f.AvgScrRead) ASC LIMIT 1; 
SELECT s.School, s.County, AVG(ss.AvgScrRead) AS AvgReadingScore FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode JOIN satscores ss ON f.CDSCode = ss.cds WHERE s.Virtual = 'F' GROUP BY s.County, s.School ORDER BY s.County, AvgReadingScore DESC LIMIT 5; 
SELECT s.School, fr.Educational_Option_Type FROM frpm fr JOIN schools s ON fr.CDSCode = s.CDSCode JOIN (     SELECT cds, AVG(AvgScrMath) AS AvgMathScore     FROM satscores     GROUP BY cds ) sub ON fr.CDSCode = sub.cds ORDER BY sub.AvgMathScore DESC LIMIT 1; 
SELECT AVG(AvgScrMath + AvgScrRead + AvgScrWrite) AS AvgTotalScore, B.County FROM satscores A JOIN schools B ON A.cds = B.CDSCode GROUP BY B.County ORDER BY AVG(AvgScrMath + AvgScrRead + AvgScrWrite) ASC LIMIT 1; 
SELECT AVG(s.AvgScrWrite), s.City FROM satscores AS sa JOIN frpm AS f ON sa.cds = f.CDSCode JOIN schools AS s ON f.CDSCode = s.CDSCode WHERE sa.NumGE1500 >= 1500 GROUP BY s.School, s.City ORDER BY COUNT(sa.NumGE1500) DESC LIMIT 1; 
SELECT T2.School, AVG(T1.AvgScrWrite) AS AvgWritingScore FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.AdmFName1 = 'Ricci' AND T2.AdmLName1 = 'Ulrich' GROUP BY T2.School;
SELECT T2.School, SUM(T1.`Enrollment (K-12)`) AS TotalEnrollment FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.DOC = 31 AND T1.LowGrade = 'K' AND T1.HighGrade = '12' GROUP BY T2.School ORDER BY TotalEnrollment DESC; 
SELECT COUNT(*) / 12 AS "Monthly Average" FROM schools WHERE OpenDate LIKE '1980%' AND DOC = 52; 
SELECT SUM(CASE WHEN T2.DOC = 54 THEN 1 ELSE 0 END) / SUM(CASE WHEN T2.DOC = 52 THEN 1 ELSE 0 END) AS Ratio FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.County = 'Orange'; 
SELECT T2.County, T2.School, T2.ClosedDate FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.StatusType = 'Closed' GROUP BY T2.County, T2.School, T2.ClosedDate ORDER BY COUNT(T2.School) DESC LIMIT 1;
SELECT s.Street, s.School  FROM schools s  JOIN satscores sa ON s.CDSCode = sa.cds  ORDER BY sa.AvgScrMath DESC  LIMIT 6, 1; 
SELECT s.MailStreet, s.School FROM schools AS s JOIN satscores AS ss ON s.CDSCode = ss.cds ORDER BY ss.AvgScrRead ASC LIMIT 1
SELECT COUNT(s.CDSCode) FROM frpm f JOIN satscores s ON f.CDSCode = s.cds JOIN schools sc ON f.CDSCode = sc.CDSCode WHERE s.AvgScrRead + s.AvgScrMath + s.AvgScrWrite >= 1500 AND sc.MailCity = 'Lakeport'; 
SELECT SUM(s.NumTstTakr) FROM satscores AS s JOIN schools AS sc ON s.cds = sc.CDSCode WHERE sc.MailCity = 'Fresno'
SELECT T2.School, T2.MailZip FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.AdmFName1 = 'Avetik' AND T2.AdmLName1 = 'Atoian'
SELECT CAST(SUM(CASE WHEN T2.County = 'Colusa' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T2.County = 'Humboldt' THEN 1 ELSE 0 END) AS Ratio FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.MailState = 'CA'; 
SELECT COUNT(*) FROM frpm INNER JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.City = 'San Joaquin' AND schools.State = 'CA' AND schools.StatusType = 'Active';
SELECT s.Phone, s.Ext FROM schools s JOIN ( 	SELECT ss.cds, AVG(ss.AvgScrWrite) AS avg_write_score 	FROM satscores ss 	GROUP BY ss.cds 	ORDER BY avg_write_score DESC 	LIMIT 332, 1 ) sub ON s.CDSCode = sub.cds; 
SELECT s.Phone, s.Ext, s.School FROM schools s WHERE s.Zip = '95203-3704'; 
SELECT s.Website FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.AdmFName1 IN ('Mike', 'Dante') AND s.AdmLName1 IN ('Larson', 'Alvarez') 
SELECT Website FROM schools WHERE Charter = 1 AND Virtual = 'P' AND County = 'San Joaquin'
SELECT COUNT(*) FROM frpm INNER JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.City = 'Hickman' AND schools.DOC = 52 AND schools.Charter = 1; 
SELECT COUNT(*)  FROM frpm  JOIN schools ON frpm.CDSCode = schools.CDSCode  WHERE schools.County = 'Los Angeles' AND schools.Charter = 0 AND frpm.[Percent (%) Eligible Free (K-12)] < 0.18; 
SELECT s.School AS School_Name, s.City, a.AdmFName1, a.AdmLName1, a.AdmFName2, a.AdmLName2, a.AdmFName3, a.AdmLName3 FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode JOIN schools a ON f.CDSCode = a.CDSCode AND a.Charter = 1 AND a.CharterNum = '00D2'; 
SELECT COUNT(*) FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.MailCity = 'Hickman' AND T2.CharterNum = '00D4'; 
SELECT      SUM(CASE WHEN T2.FundingType = 'Locally Funded' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS PercentageLocallyFunded FROM      frpm AS T1 JOIN      schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE      T2.County = 'Santa Clara'; 
SELECT COUNT(*)  FROM schools  WHERE FundingType = 'Directly Funded'  AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31'  AND County = 'Stanislaus'; 
SELECT COUNT(*) AS Total_Closures FROM schools WHERE ClosedDate BETWEEN '1989-01-01' AND '1989-12-31' AND City = 'San Francisco'; 
SELECT T2.County FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Year` BETWEEN '1980' AND '1989' AND T2.SOC = 11 GROUP BY T2.County ORDER BY COUNT(T1.CDSCode) DESC LIMIT 1
SELECT DISTINCT T2.NCESDist FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.SOC = 31
SELECT StatusType, COUNT(*) AS SchoolCount FROM schools WHERE County = 'Alpine' AND SchoolType = 'District Community Day School' GROUP BY StatusType; 
SELECT District Code FROM schools WHERE City = 'Fresno' AND Magnet = 0
SELECT COUNT(`Enrollment (Ages 5-17)`) AS NumberOfStudents FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE `School Name` = 'State Special School' AND City = 'Fremont' AND `Academic Year` = '2014-2015'; 
SELECT SUM(`Free Meal Count (Ages 5-17)`) AS Total_Free_Reduced_Price_Meal_Count FROM `frpm` JOIN `schools` ON `frpm`.`CDSCode` = `schools`.`CDSCode` WHERE `Age` BETWEEN 5 AND 17 AND `School Name` = 'Youth Authority School' AND `Mailing Street Address` = 'PO Box 1040'; 
SELECT MIN(frpm.LowGrade) FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.EdOpsCode = 'SPECON' AND schools.NCESDist = '0613360'; 
SELECT DISTINCT T2.Educational_Level_Name, T2.School FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.Breakfast_Provision = 'Breakfast Provision 2' AND T1.County_Code = '37'
SELECT T2.City  FROM frpm AS T1  JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode  WHERE T1.School Level = 'High Schools (Public)'  AND T1.Lunch Provision = '2'  AND T1.Lowest Grade = '9'  AND T1.Highest Grade = '12'  AND T2.County = 'Merced'; 
SELECT s.School, f.[Percent (%) Eligible FRPM (Ages 5-17)] FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.County = 'Los Angeles' AND f.LowGrade = 'K' AND f.HighGrade = '9'; 
SELECT Low_Grade, High_Grade FROM frpm WHERE City = 'Adelanto' GROUP BY Low_Grade, High_Grade ORDER BY COUNT(*) DESC LIMIT 1
SELECT County, COUNT(*) AS NumberOfSchools FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE City IN ('San Diego', 'Santa Barbara') AND Virtual = 'F' GROUP BY County ORDER BY NumberOfSchools DESC LIMIT 1; 
SELECT T1.School, T1.Latitude, T1.School_Type FROM schools AS T1 ORDER BY T1.Latitude DESC LIMIT 1; 
SELECT T1.City, T1.School, MIN(T1.Latitude) AS Lowest_Latitude, MIN(T1.Lowest_Grade) AS Lowest_Grade FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.State = 'CA' GROUP BY T1.City, T1.School ORDER BY Lowest_Latitude ASC LIMIT 1; 
SELECT GSoffered FROM schools ORDER BY ABS(Longitude) DESC LIMIT 1; 
SELECT COUNT(DISTINCT T1.City), COUNT(T1.School) FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.GSoffered LIKE '%K-8%' AND T1.Magnet = 1 AND T2.NSLP_Provision_Status = 'Multiple Provision Types' GROUP BY T1.City
SELECT AdmFName1 AS FirstName, District  FROM schools  GROUP BY AdmFName1, District  ORDER BY COUNT(*) DESC  LIMIT 2; 
SELECT s.District Code, f.[Percent (%) Eligible Free (K-12)] FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.AdmFName1 = 'Alusine'; 
SELECT T2.AdmLName1, T2.District, T2.County, T2.School FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.Charter_School_Number = 40
SELECT AdmEmail1, AdmEmail2, AdmEmail3 FROM schools WHERE County = 'San Bernardino' AND City = 'San Bernardino City Unified' AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND (SOC = 62 OR DOC = 54); 
SELECT s.School, s.AdmEmail1 FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode JOIN satscores st ON f.CDSCode = st.cds WHERE st.NumGE1500 > 0 GROUP BY s.School, s.AdmEmail1 ORDER BY SUM(st.NumGE1500) DESC LIMIT 1; 
SELECT COUNT(DISTINCT T1.account_id)  FROM account AS T1  JOIN disp AS T2 ON T1.account_id = T2.account_id  JOIN card AS T3 ON T2.disp_id = T3.disp_id  JOIN district AS T4 ON T1.district_id = T4.district_id  WHERE T4.A3 LIKE '%East Bohemia%' AND T3.type = 'POPLATEK PO OBRATU'; 
SELECT COUNT(DISTINCT T1.account_id)  FROM account AS T1  JOIN district AS T2 ON T1.district_id = T2.district_id  WHERE T2.A3 = 'Prague' AND T1.account_id IN (SELECT account_id FROM loan WHERE status = 'A'); 
SELECT      AVG(A12) AS avg_unemp_1995,      AVG(A13) AS avg_unemp_1996,      CASE          WHEN AVG(A12) > AVG(A13) THEN '1995'         ELSE '1996'     END AS higher_unemp_year FROM      district; 
SELECT COUNT(district_id) FROM client WHERE gender = 'F' GROUP BY district_id HAVING AVG(A11) > 6000 AND AVG(A11) < 10000; 
SELECT COUNT(client_id)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE gender = 'M' AND A3 LIKE '%North Bohemia%' AND A11 > 8000; 
SELECT MIN(A11) AS min_salary, MAX(A11) AS max_salary, max_salary - min_salary AS gap FROM ( 	SELECT AVG(T3.amount) AS A11, T1.account_id 	FROM client AS T1 	JOIN disp AS T2 ON T1.client_id = T2.client_id 	JOIN trans AS T3 ON T2.account_id = T3.account_id 	WHERE T1.gender = 'F' 	GROUP BY T1.account_id ) AS subquery; 
SELECT T3.account_id FROM (     SELECT T2.client_id, AVG(T1.amount) AS avg_salary     FROM trans AS T1     JOIN disp AS T2 ON T1.account_id = T2.account_id     GROUP BY T2.client_id ) AS T3 JOIN client AS T4 ON T3.client_id = T4.client_id ORDER BY T4.birth_date DESC, T3.avg_salary DESC LIMIT 1; 
SELECT COUNT(DISTINCT d.client_id) AS owner_count FROM disp d JOIN account a ON d.account_id = a.account_id WHERE d.type = 'OWNER' AND a.frequency = 'POPLATEK TYDNE'; 
SELECT d.client_id FROM disp d JOIN account a ON d.account_id = a.account_id WHERE d.type = 'DISPONENT' AND EXISTS (     SELECT 1     FROM trans t     WHERE t.account_id = a.account_id     AND t.date < d.date     AND t.k_symbol = 'POPLATEK PO OBRATU' ) GROUP BY d.client_id; 
SELECT T1.account_id, MIN(T2.amount) AS min_amount FROM account AS T1 JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE STRFTIME('%Y', T2.date) = '1997' GROUP BY T1.account_id ORDER BY min_amount ASC; 
SELECT a.account_id, MAX(l.amount) AS max_amount FROM account a JOIN disp d ON a.account_id = d.account_id JOIN loan l ON a.account_id = l.account_id WHERE a.date LIKE '1993%' AND l.duration > 12 GROUP BY a.account_id ORDER BY max_amount DESC; 
SELECT COUNT(*) FROM client WHERE gender = 'F' AND birth_date < '1950-01-01' AND district_id IN (SELECT district_id FROM district WHERE A2 = 'Sokolow') 
SELECT account_id FROM account WHERE STRFTIME('%Y', date) = '1995' ORDER BY date ASC LIMIT 1; 
SELECT DISTINCT T1.account_id FROM account AS T1 JOIN disp AS T2 ON T1.account_id = T2.account_id JOIN trans AS T3 ON T1.account_id = T3.account_id WHERE T1.date < '1997-01-01' AND T3.amount > 3000; 
SELECT T1.client_id FROM disp AS T1 INNER JOIN card AS T2 ON T1.disp_id = T2.disp_id WHERE T2.issued = '1994-03-03'; 
SELECT T2.date AS account_opened_date FROM trans AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.amount = 840 AND T1.date = '1998-10-14'; 
SELECT T2.district_id FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.date = '1994-08-25' 
SELECT MAX(T3.amount) AS max_transaction_amount FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN account AS T3 ON T2.account_id = T3.account_id JOIN card AS T4 ON T2.disp_id = T4.disp_id WHERE T4.issued = '1996-10-21'; 
SELECT c.gender FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN district dt ON a.district_id = dt.district_id WHERE c.birth_date IN (     SELECT MIN(birth_date)     FROM client     WHERE client_id IN (         SELECT client_id         FROM disp         JOIN account ON disp.account_id = account.account_id         WHERE account_id IN (             SELECT account_id             FROM account             GROUP BY district_id             ORDER BY AVG(dt.A11) DESC             LIMIT 1         )     ) ) ORDER BY c.birth_date ASC LIMIT 1; 
SELECT t.amount  FROM trans t  JOIN disp d ON t.account_id = d.account_id  JOIN loan l ON d.client_id = l.client_id  WHERE l.amount = (SELECT MAX(amount) FROM loan)  ORDER BY t.date ASC  LIMIT 1; 
SELECT COUNT(DISTINCT T3.client_id) FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T1.district_id IN ( SELECT district_id FROM district WHERE A2 LIKE '%Jesenik%' ) AND T3.gender = 'F'
SELECT T2.disp_id FROM trans AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id WHERE T1.amount = 5100 AND T1.date = '1998-09-02'
SELECT COUNT(account_id) FROM account WHERE date LIKE '1996%' AND district_id IN (SELECT district_id FROM district WHERE A2 = 'Litomerice') 
SELECT T3.A2 FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN account AS T4 ON T2.account_id = T4.account_id JOIN district AS T3 ON T4.district_id = T3.district_id WHERE T1.gender = 'F' AND T1.birth_date = '1976-01-29'; 
SELECT T1.birth_date FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id INNER JOIN loan AS T4 ON T3.account_id = T4.account_id WHERE T4.amount = 98832 AND T4.date = '1996-01-03'
SELECT T2.account_id FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T1.A3 = 'Prague' ORDER BY T2.birth_date ASC LIMIT 1
SELECT CAST(SUM(CASE WHEN T1.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.client_id) AS percentage_male_clients FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN account AS T3 ON T2.account_id = T3.account_id JOIN district AS T4 ON T3.district_id = T4.district_id WHERE T4.A3 = 'south Bohemia' ORDER BY T4.A4 DESC LIMIT 1; 
SELECT      ((t1.balance - t2.balance) / t2.balance) * 100 AS increase_rate FROM      trans t1 JOIN      trans t2 ON t1.account_id = t2.account_id AND t1.date >= '1993-03-22' AND t2.date <= '1998-12-27' WHERE      t1.date = (SELECT MIN(date) FROM loan WHERE date = '1993-07-05')     AND t2.date = (SELECT MAX(date) FROM trans WHERE account_id IN (SELECT account_id FROM disp WHERE client_id = (SELECT client_id FROM loan WHERE date = '1993-07-05') LIMIT 1)); 
SELECT CAST(SUM(CASE WHEN T1.status = 'A' THEN T1.amount ELSE 0 END) AS REAL) * 100 / SUM(T1.amount) FROM loan AS T1 WHERE T1.status IN ('A', 'B', 'C', 'D') 
SELECT CAST(SUM(CASE WHEN T2.status = 'C' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.amount < 100000
SELECT DISTINCT a.account_id, d.A2 AS district_name, d.A3 AS district_region FROM account a JOIN disp d ON a.account_id = d.account_id WHERE strftime('%Y', a.date) = '1993' AND a.frequency = 'POPLATEK PO OBRATU'; 
SELECT d.account_id, COUNT(a.frequency) AS frequency_of_statement_issuance FROM disp d JOIN account a ON d.account_id = a.account_id JOIN client c ON d.client_id = c.client_id JOIN district dis ON c.district_id = dis.district_id WHERE a.date BETWEEN '1995-01-01' AND '2000-12-31' AND dis.A2 LIKE '%East Bohemia%' GROUP BY d.account_id; 
SELECT T1.account_id, T1.date FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Prachatice' 
SELECT T3.A2 AS district, T3.A3 AS region FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.loan_id = 4990
SELECT T1.account_id, T3.A2 AS district, T3.A3 AS region FROM loan AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T2.client_id = T3.district_id WHERE T1.amount > 300000
SELECT T2.loan_id, T4.A3, AVG(T3.salary) AS average_salary FROM account AS T1 JOIN loan AS T2 ON T1.account_id = T2.account_id JOIN disp AS T3 ON T1.account_id = T3.account_id JOIN client AS T4 ON T3.client_id = T4.client_id JOIN district AS T5 ON T1.district_id = T5.district_id WHERE T2.duration = 60 GROUP BY T2.loan_id, T4.A3; 
SELECT d.A2 AS district, d.A3 AS state, ((d.A13 - d.A12) / d.A12) * 100 AS unemployment_rate_increment FROM loan l JOIN account a ON l.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id JOIN district d ON d.district_id = a.district_id WHERE l.status = 'D'; 
SELECT CAST(SUM(CASE WHEN T2.district_id IN ( SELECT district_id FROM district WHERE A2 = 'Decin' ) THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM account AS T1 INNER JOIN client AS T2 ON T1.client_id = T2.client_id WHERE STRFTIME('%Y', T1.date) = '1993'; 
SELECT DISTINCT account_id, date FROM account WHERE frequency = 'POPLATEK MESICNE' 
SELECT d.A2, COUNT(c.client_id) AS female_account_holders FROM district d JOIN client c ON d.district_id = c.district_id WHERE c.gender = 'F' GROUP BY d.A2 ORDER BY female_account_holders DESC LIMIT 9; 
SELECT d.A2, SUM(t.amount) AS total_withdrawals FROM district d JOIN account a ON d.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id WHERE t.type = 'VYDAJ' AND t.date LIKE '1996-01%' GROUP BY d.A2 ORDER BY total_withdrawals DESC LIMIT 10; 
SELECT COUNT(DISTINCT T1.client_id) AS count_of_account_holders FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id LEFT JOIN card AS T3 ON T2.account_id = T3.account_id WHERE T1.district_id IN (     SELECT district_id FROM district WHERE A3 LIKE '%South Bohemia%' ) AND T3.card_id IS NULL; 
SELECT T3.A3 FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T2.status IN ('C', 'D') GROUP BY T3.A3 ORDER BY COUNT(T2.loan_id) DESC LIMIT 1
SELECT AVG(loan.amount) AS average_loan_amount FROM loan JOIN disp ON loan.account_id = disp.account_id JOIN client ON disp.client_id = client.client_id WHERE client.gender = 'M'; 
SELECT T2.A2 AS district_name, T1.district_id AS branch_location FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE strftime('%Y', T1.date) = '1996' ORDER BY T2.A13 DESC; 
SELECT T1.district_id, COUNT(T2.account_id) AS account_count FROM district AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.A16 > 0 AND strftime('%Y', T2.date) = '1996' GROUP BY T1.district_id ORDER BY T1.A16 DESC LIMIT 1; 
SELECT COUNT(account_id) AS negative_balance_accounts FROM trans JOIN account ON trans.account_id = account.account_id WHERE operation = 'VYBER KARTOU' AND frequency = 'POPLATEK MESICNE' AND balance < 0; 
SELECT COUNT(*)  FROM loan  JOIN account ON loan.account_id = account.account_id  WHERE loan.date BETWEEN '1995-01-01' AND '1997-12-31'  AND loan.amount >= 250000  AND account.frequency = 'POPLATEK MESICNE'  AND loan.status = 'A'; 
SELECT COUNT(DISTINCT T1.account_id)  FROM account AS T1  JOIN disp AS T2 ON T1.account_id = T2.account_id  WHERE T2.district_id = 1 AND (T1.status = 'C' OR T1.status = 'D'); 
SELECT COUNT(client_id) AS male_clients_count FROM client WHERE district_id IN (     SELECT T1.district_id     FROM district AS T1     JOIN account AS T2 ON T1.district_id = T2.district_id     WHERE T2.date LIKE '1995%'     GROUP BY T1.district_id     ORDER BY SUM(CASE WHEN T1.A15 IS NOT NULL THEN T1.A15 ELSE 0 END) DESC     LIMIT 1 OFFSET 1 ) AND gender = 'M'; 
SELECT COUNT(*) FROM card WHERE type = 'gold' AND disp_id IN (SELECT disp_id FROM disp WHERE type = 'OWNER'); 
SELECT COUNT(account_id) FROM account WHERE district_id IN ( SELECT district_id FROM district WHERE A2 = 'Pisek' )
SELECT T2.A2 FROM trans AS T1 JOIN district AS T2 ON T1.account_id = T2.district_id WHERE T1.amount > 10000 AND strftime('%Y', T1.date) = '1997'; 
SELECT DISTINCT o.account_id FROM order o JOIN account a ON o.account_id = a.account_id WHERE o.k_symbol = 'SIPO' AND a.district_id = ( SELECT district_id FROM district WHERE A2 = 'Pisek' )
SELECT T1.account_id FROM disp AS T1 INNER JOIN card AS T2 ON T1.disp_id = T2.disp_id WHERE T2.type = 'gold'
SELECT AVG(amount) AS average_amount FROM trans WHERE type = 'VYBER KARTOU' AND STRFTIME('%Y', date) = '2021'; 
SELECT d.client_id FROM disp d JOIN account a ON d.account_id = a.account_id JOIN trans t ON a.account_id = t.account_id WHERE t.operation = 'VYBER KARTOU' AND STRFTIME('%Y', t.date) = '1998' GROUP BY d.client_id HAVING AVG(t.amount) < (     SELECT AVG(amount)     FROM trans     WHERE operation = 'VYBER KARTOU'     AND STRFTIME('%Y', date) = '1998' ); 
SELECT c.client_id, c.gender, c.birth_date FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card ca ON d.disp_id = ca.disp_id JOIN loan l ON d.account_id = l.account_id WHERE c.gender = 'F' AND ca.type IN ('gold', 'classic') AND l.status IN ('A', 'B', 'C', 'D') GROUP BY c.client_id, c.gender, c.birth_date; 
SELECT COUNT(client.client_id)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE client.gender = 'F' AND district.A3 LIKE '%south Bohemia%' 
SELECT DISTINCT T1.account_id FROM account AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id INNER JOIN disp AS T3 ON T1.account_id = T3.account_id WHERE T2.district_id = ( SELECT district_id FROM district WHERE A2 = 'Tabor' ) AND T3.type = 'OWNER'
SELECT DISTINCT a.type AS account_type, d.A11 AS average_income FROM disp a JOIN account ac ON a.account_id = ac.account_id JOIN client c ON a.client_id = c.client_id JOIN district d ON c.district_id = d.district_id WHERE a.type != 'OWNER' GROUP BY d.A11 HAVING AVG(d.A11) BETWEEN 8000 AND 9000; 
SELECT COUNT(DISTINCT T1.account_id) AS account_count FROM trans AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 = 'North Bohemia' AND T1.bank = 'AB'; 
SELECT T3.A2 FROM account AS T1 INNER JOIN trans AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T2.type = 'VYDAJ' GROUP BY T3.A2
SELECT AVG(T1.A15) AS avg_crimes FROM district AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.A15 > 4000 AND MIN(T2.date) >= '1997-01-01'; 
SELECT COUNT(*) FROM card AS c JOIN disp AS d ON c.card_id = d.card_id WHERE c.type = 'classic' AND d.type = 'OWNER'
SELECT COUNT(client_id) FROM client WHERE gender = 'M' AND district_id IN ( SELECT district_id FROM district WHERE A2 = 'Hl.m. Praha' )
SELECT CAST(SUM(CASE WHEN type = 'gold' AND issued < '1998-01-01' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM card; 
SELECT T4.name FROM disp AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN loan AS T3 ON T2.account_id = T3.account_id INNER JOIN client AS T4 ON T1.client_id = T4.client_id ORDER BY T3.amount DESC LIMIT 1
SELECT SUM(T1.A15) AS committed_crimes FROM district AS T1 WHERE T1.district_id IN (     SELECT T3.district_id     FROM account AS T2     JOIN disp AS T3 ON T2.account_id = T3.account_id     WHERE T2.account_id = 532 AND T2.date LIKE '1995%' ) AND T1.A15 IS NOT NULL; 
SELECT T2.district_id FROM order AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.order_id = 33333; 
SELECT T1.date FROM trans AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id WHERE T2.client_id = 3356 AND T1.operation = 'VYBER';
SELECT COUNT(DISTINCT d.account_id) AS weekly_issuance_accounts_with_loan_under_200000 FROM disp d JOIN account a ON d.account_id = a.account_id JOIN loan l ON a.account_id = l.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND l.amount < 200000; 
SELECT T2.type FROM disp AS T1 INNER JOIN card AS T2 ON T1.disp_id = T2.disp_id WHERE T1.client_id = 13539; 
SELECT T3.A3 FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T1.client_id = 3541; 
SELECT d.A2 AS district_name, COUNT(l.loan_id) AS account_count FROM district d JOIN account a ON d.district_id = a.district_id JOIN disp dp ON a.account_id = dp.account_id JOIN loan l ON dp.client_id = l.account_id AND l.status = 'A' GROUP BY d.A2 ORDER BY account_count DESC LIMIT 1; 
SELECT T1.client_id FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id INNER JOIN order AS T4 ON T3.account_id = T4.account_id WHERE T4.order_id = 32423
SELECT T1.trans_id, T1.date, T1.type, T1.operation, T1.amount, T1.balance, T1.k_symbol, T1.bank, T1.account FROM trans AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.district_id = 5; 
SELECT COUNT(account_id) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Jesenik') 
SELECT client_id FROM disp WHERE card_id IN (SELECT card_id FROM card WHERE type = 'junior' AND issued >= '1997-01-01') 
SELECT CAST(SUM(CASE WHEN T3.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.client_id) FROM account AS T1 JOIN disp AS T2 ON T1.account_id = T2.account_id JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T1.district_id IN (     SELECT district_id     FROM district     GROUP BY district_id     HAVING AVG(A11) > 10000 ); 
SELECT      (SUM(CASE WHEN strftime('%Y', T2.date) = '1997' THEN T2.amount ELSE 0 END) - SUM(CASE WHEN strftime('%Y', T2.date) = '1996' THEN T2.amount ELSE 0 END)) / SUM(CASE WHEN strftime('%Y', T2.date) = '1996' THEN T2.amount ELSE 0 END) * 100 AS growth_rate FROM      client AS T1 JOIN      disp AS T2 ON T1.client_id = T2.client_id JOIN      loan AS T3 ON T2.account_id = T3.account_id WHERE      T1.gender = 'M'; 
SELECT COUNT(*) FROM trans WHERE type = 'VYBER KARTOU' AND date > '1995-12-31'; 
SELECT SUM(CASE WHEN T1.A3 = 'East Bohemia' THEN T1.A16 ELSE 0 END) - SUM(CASE WHEN T1.A3 = 'North Bohemia' THEN T1.A16 ELSE 0 END) AS Crime_Difference FROM district AS T1 WHERE T1.A3 IN ('East Bohemia', 'North Bohemia') AND T1.A8 = 1996;
SELECT disp.type, COUNT(*) AS count FROM disp JOIN account ON disp.account_id = account.account_id WHERE account.account_id BETWEEN 1 AND 10 GROUP BY disp.type; 
SELECT      COUNT(*) AS request_frequency,      SUM(CASE WHEN k_symbol LIKE '%SIPO%' THEN amount ELSE 0 END) AS total_debit_aim FROM      trans WHERE      account_id = 3; 
SELECT STRFTIME('%Y', T1.birth_date) AS birth_year FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id WHERE T2.account_id = 130; 
SELECT COUNT(DISTINCT T1.account_id) AS account_count FROM disp AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.type = 'OWNER' AND T2.frequency = 'POPLATEK PO OBRATU'; 
SELECT SUM(T2.amount) AS total_debt, T2.status AS payment_status FROM client AS T1 INNER JOIN loan AS T2 ON T1.client_id = T2.account_id WHERE T1.client_id = 992; 
SELECT      SUM(t.amount),      c.gender  FROM      trans t  JOIN      disp d ON t.account_id = d.account_id  JOIN      client c ON d.client_id = c.client_id  WHERE      d.client_id = 4      AND t.trans_id > 851; 
SELECT T1.type FROM card AS T1 INNER JOIN disp AS T2 ON T1.card_id = T2.card_id WHERE T2.client_id = 9; 
SELECT SUM(amount) FROM trans WHERE account_id IN ( SELECT account_id FROM disp WHERE client_id = 617 ) AND date LIKE '1998%' AND type = 'VYBER'
SELECT c.client_id, c.birth_date FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE c.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND a.district_id IN (SELECT district_id FROM district WHERE A8 = 2); 
SELECT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN loan l ON a.account_id = l.account_id WHERE c.gender = 'F' ORDER BY l.amount DESC LIMIT 3; 
SELECT COUNT(DISTINCT d.client_id) AS customer_count FROM disp d JOIN client c ON d.client_id = c.client_id JOIN trans t ON d.account_id = t.account_id WHERE c.gender = 'M' AND c.birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND t.type = 'PRIJEM' AND t.k_symbol = 'SIPO' AND t.amount > 4000; 
SELECT COUNT(account_id) FROM account WHERE district_id IN ( SELECT district_id FROM district WHERE A3 = 'Beroun' ) AND date > '1996-12-31'; 
SELECT COUNT(*) FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card ca ON d.disp_id = ca.disp_id WHERE c.gender = 'F' AND ca.type = 'junior';
SELECT CAST(SUM(CASE WHEN T3.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.account_id) AS percentage_female_clients FROM account AS T1 JOIN disp AS T2 ON T1.account_id = T2.account_id JOIN client AS T3 ON T2.client_id = T3.client_id JOIN district AS T4 ON T1.district_id = T4.district_id WHERE T4.A3 = 'Prague'; 
SELECT CAST(SUM(CASE WHEN T1.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id WHERE T3.frequency = 'POPLATEK TYDNE'; 
SELECT COUNT(DISTINCT d.client_id) AS owner_clients FROM disp d JOIN account a ON d.account_id = a.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND d.type = 'OWNER'; 
SELECT T1.account_id FROM account AS T1 JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.duration > 24 AND T1.date < '1997-01-01' GROUP BY T1.account_id ORDER BY MIN(T2.amount) ASC; 
SELECT T1.account_id FROM disp AS T1 JOIN client AS T2 ON T1.client_id = T2.client_id WHERE T2.gender = 'F' GROUP BY T1.account_id ORDER BY MIN(T2.birth_date), AVG(T1.A11) LIMIT 1; 
SELECT COUNT(client_id) FROM client WHERE STRFTIME('%Y', birth_date) = '1920' AND district_id IN ( SELECT district_id FROM district WHERE A3 LIKE '%east Bohemia%' )
SELECT COUNT(*) FROM account WHERE frequency = 'POPLATEK TYDNE' 
SELECT AVG(T2.amount) AS avg_loan_amount, T1.date AS statement_issuance_date FROM account AS T1 JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.status IN ('C', 'D') GROUP BY T1.date; 
SELECT DISTINCT d.client_id, c.district_id FROM disp d JOIN client c ON d.client_id = c.client_id WHERE d.type = 'OWNER' AND EXISTS (     SELECT 1     FROM order o     WHERE o.account_id = d.account_id ) OR EXISTS (     SELECT 1     FROM loan l     WHERE l.account_id = d.account_id ) 
SELECT C.client_id, JULIANDAY(C.birth_date) - JULIANDAY('1970-01-01') / 365 AS age FROM client C JOIN disp D ON C.client_id = D.client_id JOIN card K ON D.disp_id = K.disp_id WHERE K.type = 'gold' AND D.type = 'OWNER'
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY COUNT(bond_type) DESC LIMIT 1
SELECT COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-' AND T2.element = 'cl'
SELECT AVG(CASE WHEN T1.element = 'o' THEN 1 ELSE 0 END) AS avg_oxygen_atoms FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-'; 
SELECT AVG(CASE WHEN T2.bond_type = '-' THEN 1 ELSE 0 END) FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'
SELECT COUNT(*) FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-') AND element = 'na'; 
SELECT m.label  FROM molecule m  JOIN bond b ON m.molecule_id = b.molecule_id  WHERE b.bond_type = '#' AND m.label = '+'; 
SELECT CAST(COUNT(CASE WHEN T1.element = 'c' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.atom_id) AS percentage FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id JOIN bond AS T3 ON T2.molecule_id = T3.molecule_id WHERE T3.bond_type = '='; 
SELECT COUNT(*) FROM bond WHERE bond_type = '#'
SELECT COUNT(*) FROM atom WHERE element != 'br'
SELECT COUNT(molecule_id) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR099' AND label = '+'; 
SELECT DISTINCT molecule_id FROM atom WHERE element = 'c'
SELECT DISTINCT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR004_8_9' 
SELECT DISTINCT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '='
SELECT m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'h' GROUP BY m.label ORDER BY COUNT(m.label) DESC LIMIT 1; 
SELECT T2.bond_type FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'cl'; 
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-'
SELECT DISTINCT a1.element, a2.element FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN atom a2 ON a2.atom_id = c.atom_id2 JOIN molecule m ON a1.molecule_id = m.molecule_id WHERE m.label = '-'; 
SELECT element FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-') GROUP BY element ORDER BY COUNT(element) ASC LIMIT 1; 
SELECT T3.bond_type FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T1.bond_id = T3.bond_id WHERE (T2.atom_id = 'TR004_8' AND T1.atom_id2 = 'TR004_20') OR (T2.atom_id = 'TR004_20' AND T1.atom_id2 = 'TR004_8') 
SELECT DISTINCT label FROM molecule WHERE molecule_id NOT IN ( SELECT molecule_id FROM atom WHERE element != 'sn' )
SELECT COUNT(DISTINCT T1.atom_id) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element IN ('i', 's') AND T3.bond_type = '-'
SELECT T1.atom_id, T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id IN ( SELECT bond_id FROM bond WHERE bond_type = '#' )
SELECT DISTINCT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE c.bond_id IN (     SELECT bond_id     FROM connected     WHERE atom_id IN (         SELECT atom_id         FROM atom         WHERE molecule_id = 'TR181'     ) ); 
SELECT CAST(COUNT(DISTINCT CASE WHEN T1.element != 'f' THEN T2.molecule_id END) AS REAL) * 100 / COUNT(DISTINCT T2.molecule_id) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'
SELECT SUM(CASE WHEN T1.bond_type = '#' THEN 1 ELSE 0 END) * 100 / COUNT(T1.bond_id) AS percent FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'; 
SELECT element FROM atom WHERE molecule_id = 'TR000' GROUP BY element ORDER BY element ASC LIMIT 3; 
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_2_6' AND T1.molecule_id = 'TR001'
SELECT SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN label = '-' THEN 1 ELSE 0 END) AS difference FROM molecule; 
SELECT T1.atom_id FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_id = 'TR000_2_5'
SELECT T1.bond_id FROM connected AS T1 WHERE T1.atom_id2 = 'TR000_2' AND T1.atom_id IN ( SELECT atom_id FROM atom WHERE molecule_id = 'TR000' )
SELECT T1.label FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = ' = ' GROUP BY T1.label ORDER BY T1.label LIMIT 5
SELECT CAST(SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) AS percent FROM bond WHERE molecule_id = 'TR008'
SELECT CAST(COUNT(CASE WHEN label = '+' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(molecule_id) FROM molecule
SELECT CAST(SUM(CASE WHEN element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(atom_id) AS percent FROM atom WHERE molecule_id = 'TR000'
SELECT bond_type FROM bond WHERE molecule_id = 'TR000'
SELECT T1.element, T3.toxicology, T2.label FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id LEFT JOIN toxicology AS T3 ON T2.molecule_id = T3.molecule_id WHERE T1.molecule_id = 'TR060'; 
SELECT bond_type, COUNT(*) AS bond_count FROM bond WHERE molecule_id = 'TR010' GROUP BY bond_type ORDER BY bond_count DESC LIMIT 1; SELECT label FROM molecule WHERE molecule_id = 'TR010'; 
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-' GROUP BY T1.molecule_id HAVING COUNT(DISTINCT T2.bond_id) = 1 ORDER BY T1.label ASC LIMIT 3; 
SELECT T1.bond_type FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = 'TR006' ORDER BY T1.bond_type LIMIT 2 
SELECT COUNT(*) FROM connected WHERE (atom_id = 'TR009_12' OR atom_id2 = 'TR009_12') AND molecule_id = 'TR009'; 
SELECT COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.element = 'br'
SELECT T1.bond_type, T3.atom_id, T4.atom_id2 FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T2.atom_id = T3.atom_id JOIN atom AS T4 ON T2.atom_id2 = T4.atom_id WHERE T1.bond_id = 'TR001_6_9'; 
SELECT T1.label, CASE WHEN T1.label = '+' THEN 'Carcinogenic' ELSE 'Non-Carcinogenic' END AS carcinogenic_status FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.atom_id = 'TR001_10'; 
SELECT COUNT(DISTINCT molecule_id) FROM bond WHERE bond_type = '#'; 
SELECT COUNT(bond_id) FROM connected WHERE atom_id LIKE 'TR%_19' OR atom_id2 LIKE 'TR%_19'
SELECT T.element FROM atom AS T WHERE T.molecule_id = 'TR004'
SELECT COUNT(molecule_id) FROM molecule WHERE label = '-'; 
SELECT m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE SUBSTR(a.atom_id, 7, 2) BETWEEN '21' AND '25' AND m.label = '+'; 
SELECT b.bond_id FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE (a1.element = 'p' AND a2.element = 'n') OR (a1.element = 'n' AND a2.element = 'p'); 
SELECT m.label, COUNT(b.bond_id) AS double_bonds FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = ' = ' GROUP BY m.molecule_id ORDER BY double_bonds DESC LIMIT 1; 
SELECT AVG(COUNT(T3.bond_id) / COUNT(DISTINCT T2.atom_id)) AS avg_bonds_per_i_atom FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id LEFT JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'i'; 
SELECT T2.bond_type, T2.bond_id FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE CAST(SUBSTR(T1.atom_id, 7, 2) AS INT) = 45 OR CAST(SUBSTR(T1.atom_id2, 7, 2) AS INT) = 45; 
SELECT element FROM atom WHERE atom_id NOT IN (SELECT atom_id FROM connected); 
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.molecule_id = 'TR041' AND T3.bond_type = '#'
SELECT T.element FROM atom AS T WHERE T.molecule_id IN ( SELECT molecule_id FROM connected WHERE bond_id = 'TR144_8_19' )
SELECT m.label FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '=' GROUP BY m.molecule_id ORDER BY COUNT(b.bond_id) DESC LIMIT 1; 
SELECT T1.element FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' GROUP BY T1.element ORDER BY COUNT(T1.element) ASC LIMIT 1
SELECT DISTINCT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE a.element = 'pb'; 
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '#'
SELECT CAST(SUM(CASE WHEN COUNT(*) = ( SELECT MAX(cnt) FROM ( SELECT COUNT(atom_id) AS cnt FROM atom GROUP BY molecule_id ) ) THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) FROM bond WHERE molecule_id IN ( SELECT molecule_id FROM atom GROUP BY molecule_id ORDER BY COUNT(molecule_id) DESC LIMIT 1 )
SELECT CAST(COUNT(CASE WHEN T2.label = '+' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.bond_id) FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '-'; 
SELECT COUNT(*) FROM atom WHERE element IN ('c', 'h'); 
SELECT T1.atom_id2 FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T2.element = 's'
SELECT T2.bond_type FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'sn' GROUP BY T2.bond_type
SELECT COUNT(DISTINCT T1.element) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-'
SELECT COUNT(*) FROM atom WHERE molecule_id IN ( SELECT molecule_id FROM bond WHERE bond_type = '#' AND molecule_id IN ( SELECT molecule_id FROM atom WHERE element IN ('p', 'br') ) )
SELECT T1.bond_id FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-' AND T1.label != '+'
SELECT CAST(SUM(CASE WHEN T1.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) AS percent FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-'
SELECT label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002'); 
SELECT molecule_id FROM molecule WHERE label = '-'
SELECT SUM(CASE WHEN T1.label = '+' THEN 1 ELSE 0 END) AS total_carcinogenic_molecules FROM molecule AS T1 WHERE T1.molecule_id BETWEEN 'TR000' AND 'TR030'; 
SELECT T1.bond_type FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.molecule_id BETWEEN 'TR000' AND 'TR050'
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_10_11'
SELECT COUNT(T2.bond_id) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 'i'
SELECT MAX(T1.label) AS majority_carcinogenicity FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'ca'; 
SELECT EXISTS ( 	SELECT 1 	FROM atom 	WHERE bond_id = 'TR001_1_8' AND element = 'cl' ) AND EXISTS ( 	SELECT 1 	FROM atom 	WHERE bond_id = 'TR001_1_8' AND element = 'c' ); 
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN connected AS T3 ON T2.atom_id = T3.atom_id INNER JOIN bond AS T4 ON T3.bond_id = T4.bond_id WHERE T2.element = 'c' AND T4.bond_type = '#' AND T1.label = '-' LIMIT 2
SELECT CAST(COUNT(CASE WHEN T1.element = 'cl' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.molecule_id) AS percentage FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'; 
SELECT element FROM atom WHERE molecule_id = 'TR001'; 
SELECT molecule_id FROM bond WHERE bond_type = '='; 
SELECT T1.atom_id, T2.atom_id2 FROM connected AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id AND T1.atom_id < T2.atom_id JOIN bond AS B ON T1.bond_id = B.bond_id WHERE B.bond_type = '#' GROUP BY T1.atom_id, T2.atom_id2; 
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR000_1_2'
SELECT COUNT(DISTINCT T1.molecule_id) AS non_carcinogenic_single_bond_molecules FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-' AND T1.label = '-'; 
SELECT T2.label FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_id = 'TR001_10_11'
SELECT b.bond_id, m.label FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '#' AND m.label IN ('+', '-') 
SELECT SUBSTR(T1.atom_id, 7, 1) AS ToxicologyElement FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' AND SUBSTR(T1.atom_id, 7, 1) = '4' GROUP BY T1.molecule_id, SUBSTR(T1.atom_id, 7, 1)
SELECT SUM(CASE WHEN element = 'h' THEN 1 ELSE 0 END) / COUNT(*) AS ratio, label FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule_id = 'TR006'; 
SELECT T1.label FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'ca' 
SELECT T2.bond_type FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'c'
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_10_11' GROUP BY T1.element
SELECT CAST(SUM(CASE WHEN T2.bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id; 
SELECT CAST(SUM(CASE WHEN T2.bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_id) AS percent FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = 'TR047'; 
SELECT T1.label FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.atom_id = 'TR001_1'
SELECT label FROM molecule WHERE molecule_id = 'TR151'; 
SELECT DISTINCT element FROM atom WHERE molecule_id = 'TR151' AND element IN ('cl', 'c', 'h')
SELECT COUNT(*) FROM molecule WHERE label = '+'; 
SELECT atom_id FROM atom WHERE molecule_id BETWEEN 'TR010' AND 'TR050' AND element = 'c'
SELECT COUNT(*) FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+') 
SELECT T1.bond_id FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T1.bond_type = '=' AND T2.atom_id IN ( SELECT atom_id FROM atom WHERE molecule_id IN ( SELECT molecule_id FROM molecule WHERE label = '+' ) )
SELECT COUNT(*)  FROM atom  WHERE molecule_id IN ( 	SELECT molecule_id  	FROM molecule  	WHERE label = '+' ) AND element = 'h'; 
SELECT T1.molecule_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id JOIN connected AS T3 ON T2.bond_id = T3.bond_id WHERE T3.atom_id = 'TR000_1' AND T2.bond_id = 'TR000_1_2'; 
SELECT atom_id FROM atom WHERE molecule_id IN (     SELECT molecule_id FROM molecule WHERE label = '-' ) AND element = 'c'; 
SELECT CAST(COUNT(CASE WHEN T1.element = 'h' AND T3.label = '+' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id WHERE T1.element = 'h' 
SELECT label FROM molecule WHERE molecule_id = 'TR124'
SELECT element FROM atom WHERE molecule_id = 'TR186'
SELECT T2.bond_type FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = 'TR007_4_19'
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_2_4'; 
SELECT COUNT(b.bond_type) AS double_bonds, m.label AS carcinogenicity FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.label = '+' AND b.bond_type = '='; 
SELECT T1.label, T2.element FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.element IN ('cl', 'c', 'h')
SELECT T1.bond_id, T2.element AS atom1, T3.element AS atom2 FROM bond AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id AND T1.bond_id = ( SELECT bond_id FROM connected WHERE atom_id = T2.atom_id ) INNER JOIN atom AS T3 ON T1.molecule_id = T3.molecule_id AND T1.bond_id = ( SELECT bond_id FROM connected WHERE atom_id = T3.atom_id ) WHERE T1.bond_type = '-' GROUP BY T1.bond_id, T2.element, T3.element
SELECT DISTINCT m.label, a.element FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN bond b ON m.molecule_id = b.molecule_id JOIN connected c ON a.atom_id = c.atom_id AND b.bond_id = c.bond_id WHERE b.bond_type = '#'; 
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR000_2_3'; 
SELECT COUNT(*) FROM atom WHERE element = 'cl'; 
SELECT a.atom_id, COUNT(b.bond_type) AS bond_count FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE a.molecule_id = 'TR346' GROUP BY a.atom_id; 
SELECT COUNT(DISTINCT m.molecule_id) AS total_molecules_with_double_bond, SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) AS carcinogenic_molecules_with_double_bond FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '='; 
SELECT COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id JOIN bond AS T3 ON T1.molecule_id = T3.molecule_id WHERE T2.element != 's' AND T3.bond_type != '='; 
SELECT T2.label FROM connected AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_id = 'TR001_2_4'
SELECT COUNT(atom_id) FROM atom WHERE molecule_id = 'TR001'; 
SELECT COUNT(bond_id) FROM bond WHERE bond_type = '-'
SELECT T1.label FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'cl' AND T1.label = '+'
SELECT DISTINCT T2.label FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'c' AND T2.label = '-'
SELECT CAST(COUNT(CASE WHEN T1.label = '+' AND T2.element = 'cl' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.molecule_id) AS percentage FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id 
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_id = 'TR001_1_7'
SELECT COUNT(DISTINCT atom_id) AS num_elements FROM atom WHERE molecule_id IN (SELECT molecule_id FROM bond WHERE bond_id = 'TR001_3_4') 
SELECT T2.bond_type FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE (T1.atom_id = 'TR000_1' AND T1.atom_id2 = 'TR000_2') OR (T1.atom_id = 'TR000_2' AND T1.atom_id2 = 'TR000_1')
SELECT T1.label FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.atom_id IN ('TR000_2', 'TR000_4') 
SELECT element FROM atom WHERE atom_id = 'TR000_1'
SELECT CASE WHEN T1.label = '+' THEN 'Carcinogenic' ELSE 'Non-Carcinogenic' END AS carcinogenicity FROM molecule AS T1 WHERE T1.molecule_id = 'TR000'
SELECT CAST(COUNT(CASE WHEN T2.bond_type = '-' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.atom_id) AS percentage FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id; 
SELECT COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'n' AND T1.label = '+'
SELECT m.label  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  JOIN connected c ON a.atom_id = c.atom_id  JOIN bond b ON c.bond_id = b.bond_id  WHERE a.element = 's' AND b.bond_type = '='; 
SELECT T1.label FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-' GROUP BY T1.label HAVING COUNT(T2.atom_id) > 5
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '=' AND T1.molecule_id = 'TR024'
SELECT m.label  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  GROUP BY m.molecule_id  ORDER BY COUNT(a.atom_id) DESC  LIMIT 1; 
SELECT CAST(COUNT(CASE WHEN T1.label = '+' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.molecule_id) AS percentage FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id JOIN connected AS T3 ON T2.atom_id = T3.atom_id JOIN bond AS T4 ON T3.bond_id = T4.bond_id WHERE T2.element = 'h' AND T4.bond_type = '#'; 
SELECT COUNT(molecule_id) FROM molecule WHERE label = '+'
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR004' AND 'TR010' AND molecule_id IN (SELECT molecule_id FROM bond WHERE bond_type = '-') 
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR008' AND element = 'c'
SELECT T.element FROM atom AS T WHERE T.atom_id = 'TR004_7' AND T.molecule_id IN ( SELECT molecule_id FROM molecule WHERE label = '-' )
SELECT COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN connected AS T3 ON T2.atom_id = T3.atom_id INNER JOIN bond AS T4 ON T3.bond_id = T4.bond_id WHERE T2.element = 'o' AND T4.bond_type = ' = '
SELECT COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '#' AND T1.label = '-'; 
SELECT T1.element, T2.bond_type FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR002'
SELECT T1.atom_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'c' AND T3.bond_type = '=' AND T1.molecule_id = 'TR012'; 
SELECT T1.atom_id FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' AND T1.element = 'o'
SELECT name FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL; 
SELECT name FROM cards WHERE borderColor = 'borderless' AND (cardKingdomFoilId IS NULL OR cardKingdomId IS NULL)
SELECT name FROM cards ORDER BY faceConvertedManaCost DESC LIMIT 1
SELECT name FROM cards WHERE edhrecRank < 100 AND frameVersion = 2015
SELECT T1.name  FROM cards AS T1  JOIN legalities AS T2 ON T1.uuid = T2.uuid  WHERE T1.rarity = 'mythic' AND T2.status = 'Banned' AND T2.format = 'gladiator'; 
SELECT T1.status FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.types = 'Artifact' AND T2.side IS NULL AND T1.format = 'vintage'
SELECT c.id, c.artist FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE (c.power = '*' OR c.power IS NULL) AND l.format = 'commander' AND l.status = 'Legal'; 
SELECT c.id, r.text, c.hasContentWarning FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Stephen Daniel'; 
SELECT T1.text FROM rulings AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Sublime Epiphany' AND T2.number = '74s'
SELECT T1.name, T1.artist, T1.isPromo FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid GROUP BY T1.id ORDER BY COUNT(T2.uuid) DESC LIMIT 1
SELECT T2.language FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Annul' AND T1.number = '29'
SELECT T1.name FROM foreign_data AS T1 JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.language = 'Japanese'; 
SELECT CAST(SUM(CASE WHEN T2.language = 'Chinese Simplified' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid; 
SELECT s.name AS SetName, s.totalSetSize AS TotalCards FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian'; 
SELECT COUNT(DISTINCT type) FROM cards WHERE artist = 'Aaron Boyd';
SELECT keywords FROM cards WHERE name = 'Angel of Mercy';
SELECT COUNT(*) FROM cards WHERE power = '*'; 
SELECT promoTypes FROM cards WHERE name = 'Duress'
SELECT borderColor FROM cards WHERE name = 'Ancestor''s Chosen';
SELECT T1.originalType FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Ancestor''s Chosen'; 
SELECT T2.language FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Angel of Mercy' GROUP BY T2.language
SELECT COUNT(*)  FROM cards  JOIN legalities ON cards.uuid = legalities.uuid  WHERE legalities.status = 'restricted' AND cards.isTextless = 0; 
SELECT T1.text FROM rulings AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Condemn'; 
SELECT COUNT(*) FROM cards WHERE uuid IN (SELECT uuid FROM legalities WHERE status = 'restricted') AND isStarter = 1; 
SELECT T2.status FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Cloudchaser Eagle'
SELECT type FROM cards WHERE name = 'Benalish Knight'; 
SELECT T2.text FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Benalish Knight'; 
SELECT T1.artist FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Phyrexian'; 
SELECT CAST(SUM(CASE WHEN borderColor = 'borderless' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(id) FROM cards; 
SELECT COUNT(DISTINCT c.uuid) FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'German' AND c.isReprint = 1; 
SELECT COUNT(*) FROM cards AS c JOIN foreign_data AS fd ON c.uuid = fd.uuid WHERE c.borderColor = 'borderless' AND fd.language = 'Russian'; 
SELECT CAST(SUM(CASE WHEN T1.language = 'French' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.isStorySpotlight = 1; 
SELECT COUNT(*) FROM cards WHERE toughness = 99; 
SELECT name FROM cards WHERE artist = 'Aaron Boyd';
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND availability LIKE '%mtgo%'; 
SELECT id FROM cards WHERE convertedManaCost = 0;
SELECT DISTINCT layout FROM cards WHERE keywords LIKE '%flying%'
SELECT COUNT(*) FROM cards WHERE originalType = 'Summon - Angel' AND subtypes NOT LIKE '%Angel%'; 
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL; 
SELECT id FROM cards WHERE duelDeck = 'a'; 
SELECT edhrecRank FROM cards WHERE frameVersion = '2015';
SELECT DISTINCT T1.artist FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Chinese Simplified'; 
SELECT T1.name FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.availability LIKE '%paper%' AND T2.language = 'Japanese'
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.status = 'Banned' AND cards.borderColor = 'white'; 
SELECT T1.uuid, T2.language FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid INNER JOIN legalities AS T3 ON T1.uuid = T3.uuid WHERE T3.format = 'legacy'
SELECT text FROM rulings WHERE uuid IN (SELECT uuid FROM cards WHERE name = 'Beacon of Immortality'); 
SELECT COUNT(DISTINCT c.uuid), l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.frameVersion = 'future' AND l.status = 'legal'; 
SELECT T1.name, T1.colors FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.code = 'OGW';
SELECT T1.name, T2.language FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.setCode = '10E' AND T1.convertedManaCost = 5 GROUP BY T1.name, T2.language
SELECT c.name, r.date  FROM cards c  JOIN rulings r ON c.uuid = r.uuid  WHERE c.originalType = 'Creature - Elf'; 
SELECT DISTINCT C.colors, L.format FROM cards AS C JOIN legalities AS L ON C.uuid = L.uuid WHERE C.id BETWEEN 1 AND 20; 
SELECT c.name  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE c.originalType = 'Artifact' AND c.colors = 'B' AND fd.language IS NOT NULL; 
SELECT c.name FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.rarity = 'uncommon' ORDER BY r.date ASC LIMIT 3; 
SELECT COUNT(*) FROM cards WHERE artist = 'John Avon' AND hasFoil = 1 AND cardKingdomFoilId IS NULL; 
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL; 
SELECT COUNT(*) FROM cards WHERE artist = 'UDON' AND availability = 'mtgo' AND hand = -1; 
SELECT COUNT(*) FROM cards WHERE frameVersion = '1993' AND availability LIKE '%paper%' AND hasContentWarning = 1; 
SELECT manaCost FROM cards WHERE layout = 'normal' AND frameVersion = '2003' AND borderColor = 'black' AND availability LIKE '%paper%' AND availability LIKE '%mtgo%'; 
SELECT SUM(convertedManaCost) AS total_unconverted_mana_cost FROM cards WHERE artist = 'Rob Alexander'; 
SELECT DISTINCT subtype, supertype FROM cards WHERE availability = 'arena'; 
SELECT T1.setCode FROM set_translations AS T1 INNER JOIN foreign_data AS T2 ON T1.translation = T2.name WHERE T1.language = 'Spanish'
SELECT CAST(SUM(CASE WHEN isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards WHERE frameEffects = 'legendary'
SELECT      CAST(SUM(CASE WHEN isStorySpotlight = 1 AND isTextless = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS percentage,     id FROM      cards WHERE      isStorySpotlight = 1; 
SELECT      T2.name,      CAST(COUNT(CASE WHEN T1.language = 'Spanish' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.id) AS percentage FROM      foreign_data AS T1 JOIN      cards AS T2 ON T1.uuid = T2.uuid GROUP BY      T2.name; 
SELECT DISTINCT T1.language FROM set_translations AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.baseSetSize = 309; 
SELECT COUNT(*) FROM sets  JOIN set_translations ON sets.code = set_translations.setCode  WHERE set_translations.language = 'Português (Brasil)' AND sets.block = 'Commander'; 
SELECT id FROM cards WHERE type LIKE '%Creature%' AND uuid IN (SELECT uuid FROM legalities WHERE status = 'Legal')
SELECT T1.subtypes, T1.supertypes FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'German' AND T1.subtypes IS NOT NULL AND T1.supertypes IS NOT NULL GROUP BY T1.subtypes, T1.supertypes ORDER BY T1.subtypes, T1.supertypes;
SELECT COUNT(*) FROM cards WHERE power IS NULL OR power = '*' AND text LIKE '%triggered ability%'; 
SELECT COUNT(*) FROM cards  JOIN legalities ON cards.uuid = legalities.uuid  WHERE legalities.format = 'premodern'  AND cards.text LIKE '%This is a triggered mana ability.%'  AND cards.side IS NULL; 
SELECT id FROM cards WHERE artist = 'Erica Yang' AND availability LIKE '%paper%' AND uuid IN ( SELECT uuid FROM legalities WHERE format = 'pauper' )
SELECT artist FROM cards WHERE uuid IN ( SELECT uuid FROM foreign_data WHERE text LIKE '%Das perfekte Gegenmittel zu einer dichten Formation%' )
SELECT T2.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Matthew D. Wilson' AND T1.borderColor = 'black' AND T1.type = 'Creature' AND T2.language = 'French' AND T1.layout = 'normal'
SELECT COUNT(*) FROM cards WHERE rarity = 'rare' AND uuid IN (SELECT uuid FROM rulings WHERE date = '2007-02-01'); 
SELECT T1.language FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.baseSetSize = 180 AND T2.block = 'Ravnica';
SELECT CAST(SUM(CASE WHEN hasContentWarning = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(id) FROM cards WHERE uuid IN (SELECT uuid FROM legalities WHERE format = 'commander' AND status = 'legal') 
SELECT CAST(SUM(CASE WHEN T1.power IS NULL OR T1.power = '*' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'French'; 
SELECT CAST(SUM(CASE WHEN T2.language = 'Japanese' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.type = 'expansion'; 
SELECT T1.availability FROM cards AS T1 WHERE T1.artist = 'Daren Bader'
SELECT COUNT(*) FROM cards WHERE borderColor = 'borderless' AND edhrecRank > 12000;
SELECT COUNT(*)  FROM cards  WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1; 
SELECT name FROM cards WHERE power IS NULL OR power = '*' AND promoTypes LIKE '%arenaleague%' ORDER BY name ASC LIMIT 3; 
SELECT T1.language FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.multiverseid = 149934
SELECT cardKingdomFoilId FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL ORDER BY cardKingdomFoilId ASC LIMIT 3
SELECT CAST(SUM(CASE WHEN isTextless = 1 AND layout = 'normal' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards
SELECT id FROM cards WHERE subtypes LIKE '%Angel%' AND subtypes LIKE '%Wizard%' AND otherFaceIds IS NULL; 
SELECT name  FROM sets  WHERE mtgoCode IS NULL OR mtgoCode = ''  ORDER BY name ASC  LIMIT 3; 
SELECT DISTINCT T2.language FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.mcmName = 'Archenemy' AND T1.code = 'ARC'; 
SELECT s.name, st.translation FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.id = 5; 
SELECT T1.language, T3.type  FROM foreign_data AS T1  JOIN cards AS T2 ON T1.uuid = T2.uuid  JOIN sets AS T3 ON T2.setCode = T3.code  WHERE T2.id = 206; 
SELECT c.id, f.name  FROM cards c  JOIN foreign_data f ON c.uuid = f.uuid  JOIN sets s ON c.setCode = s.code  WHERE f.language = 'Italian' AND s.block = 'Shadowmoor'  ORDER BY c.id ASC  LIMIT 2; 
SELECT T1.id FROM sets AS T1 JOIN foreign_data AS T2 ON T1.code = T2.multiverseid WHERE T1.isForeignOnly = 1 AND T1.isFoilOnly = 1 AND T2.language = 'Japanese'
SELECT T1.name FROM sets AS T1 INNER JOIN foreign_data AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Russian' ORDER BY T1.baseSetSize DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN T2.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.language = 'Chinese Simplified'
SELECT COUNT(*) FROM sets WHERE code IN ( SELECT setCode FROM foreign_data WHERE language = 'Japanese' ) AND ( mtgoCode IS NULL OR mtgoCode = '' )
SELECT COUNT(id), id FROM cards WHERE borderColor = 'black' GROUP BY id
SELECT COUNT(id), id FROM cards WHERE frameEffects = 'extendedart' GROUP BY id;
SELECT name FROM cards WHERE borderColor = 'black' AND isFullArt = 1; 
SELECT T1.language FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.id = 174; 
SELECT T1.name FROM sets AS T1 WHERE T1.code = 'ALL'
SELECT T1.language FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'A Pedra Fellwar'; 
SELECT code FROM sets WHERE releaseDate = '2007-07-13'; 
SELECT baseSetSize, setCode FROM sets WHERE block IN ('Masques', 'Mirage')
SELECT setCode FROM sets WHERE type = 'expansion'; 
SELECT T2.name AS foreign_name, T2.type  FROM cards AS T1  JOIN foreign_data AS T2 ON T1.uuid = T2.uuid  WHERE T1.watermark = 'boros'; 
SELECT T2.language, T2.flavorText, T1.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'colorpie';
SELECT CAST(SUM(CASE WHEN convertedManaCost = 10 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards WHERE setCode IN (SELECT code FROM sets WHERE name = 'Abyssal Horror') 
SELECT DISTINCT T2.setCode FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.format = 'commander'; 
SELECT T2.name, T2.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'abzan'; 
SELECT T2.language, T1.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'Azorius' GROUP BY T2.language, T1.type
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL; 
SELECT COUNT(*) FROM cards WHERE availability LIKE '%paper%' AND hand = '3'; 
SELECT name FROM cards WHERE isTextless = 0; 
SELECT convertedManaCost FROM cards WHERE name = 'Ancestor''s Chosen'; 
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND (power IS NULL OR power = '*'); 
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL; 
SELECT DISTINCT subtypes, supertypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer'; 
SELECT T1.purchaseUrls FROM cards AS T1 WHERE T1.promoTypes = 'bundle'
SELECT COUNT(DISTINCT artist) FROM cards WHERE borderColor = 'black' AND availability LIKE '%arena,mtgo%'
SELECT MAX(convertedManaCost) AS max_converted_mana_cost FROM cards WHERE name IN ('Serra Angel', 'Shrine Keeper'); 
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer'; 
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3; 
SELECT T2.translation FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T1.name = 'Ancestor''s Chosen' AND T2.language = 'Italian'
SELECT COUNT(*) FROM foreign_data WHERE uuid IN (SELECT uuid FROM cards WHERE name = 'Angel of Mercy') 
SELECT T1.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid INNER JOIN set_translations AS T3 ON T3.setCode = T1.setCode WHERE T3.translation = 'Hauptset Zehnte Edition'; 
SELECT EXISTS (     SELECT 1     FROM cards c     JOIN foreign_data fd ON c.uuid = fd.uuid     WHERE c.name = 'Ancestor''s Chosen'       AND fd.language = 'Korean' ); 
SELECT COUNT(*) FROM cards AS T1 JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T2.translation = 'Hauptset Zehnte Edition' AND T1.artist = 'Adam Rex'; 
SELECT T2.baseSetSize FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Hauptset Zehnte Edition'
SELECT T2.translation FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Eighth Edition' AND T2.language = 'Chinese Simplified'
SELECT EXISTS(SELECT 1 FROM cards WHERE name LIKE '%Angel of Mercy%' AND mtgoCode IS NOT NULL);
SELECT T2.releaseDate FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Ancestor''s Chosen'
SELECT T2.type FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.translation = 'Hauptset Zehnte Edition'; 
SELECT COUNT(DISTINCT s.id) AS set_count FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.block = 'Ice Age' AND st.language = 'Italian' AND st.translation IS NOT NULL; 
SELECT T2.isForeignOnly FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Adarkar Valkyrie'; 
SELECT COUNT(DISTINCT s.id) FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian' AND s.baseSetSize < 100; 
SELECT COUNT(*) FROM cards WHERE setCode = 'Coldsnap' AND borderColor = 'black'; 
SELECT T1.name FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' ORDER BY T1.convertedManaCost DESC LIMIT 1; 
SELECT DISTINCT artist FROM cards WHERE artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy') AND setCode = 'Coldsnap'; 
SELECT * FROM cards WHERE number = 4 AND setCode = (SELECT code FROM sets WHERE name = 'Coldsnap'); 
SELECT COUNT(*) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.convertedManaCost > 5 AND T1.setCode = 'Coldsnap' AND (T1.power = '*' OR T2.power IS NULL) 
SELECT T2.flavorText FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Ancestor''s Chosen' AND T2.language = 'Italian'
SELECT DISTINCT T2.language FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Ancestor''s Chosen' AND T2.flavorText IS NOT NULL
SELECT T2.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Ancestor''s Chosen' AND T2.language = 'German'; 
SELECT T2.text FROM sets AS T1 INNER JOIN foreign_data AS T2 ON T1.code = T2.set_code WHERE T1.name = 'Coldsnap' AND T2.language = 'Italian'; 
SELECT T2.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.setCode = 'Coldsnap' AND T2.language = 'Italian' ORDER BY T1.convertedManaCost DESC LIMIT 1
SELECT T1.date FROM rulings AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Reminisce'; 
SELECT CAST(COUNT(CASE WHEN convertedManaCost = 7 THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(*) FROM cards WHERE setCode IN ( SELECT code FROM sets WHERE name = 'Coldsnap' )
SELECT CAST(COUNT(CASE WHEN cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(*) FROM cards WHERE setCode = 'Coldsnap'
SELECT code FROM sets WHERE releaseDate = '2017-07-14'
SELECT keyruneCode FROM sets WHERE code = 'PKHC';
SELECT mcmId FROM sets WHERE code = 'SS2'; 
SELECT T1.mcmName FROM sets AS T1 JOIN foreign_data AS T2 ON T1.code = T2.set_code WHERE T1.release_date = '2017-06-09'; 
SELECT T2.type FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T1.name LIKE '%From the Vault: Lore%' 
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized'; 
SELECT c.name, r.text, CASE WHEN c.hasContentWarning = 1 THEN 'Yes' ELSE 'No' END AS HasMissingOrDegradedPropertiesAndValues FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Jim Pavelec'; 
SELECT T1.releaseDate FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T2.name = 'Evacuation' LIMIT 1
SELECT SUM(T1.baseSetSize) AS numberOfCards FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Rinascita di Alara'; 
SELECT T1.type FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Huitième édition'; 
SELECT T1.translation FROM set_translations AS T1 INNER JOIN foreign_data AS T2 ON T1.setCode = T2.language WHERE T2.name LIKE '%Tendo Ice Bridge%' 
SELECT COUNT(*) FROM set_translations WHERE setCode IN (SELECT code FROM sets WHERE name = 'Tenth Edition') AND translation IS NOT NULL; 
SELECT T2.translation FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T1.name = 'Fellwar Stone' AND T2.language = 'Japanese'; 
SELECT T1.name FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Journey into Nyx Hero''s Path' ORDER BY T1.convertedManaCost DESC LIMIT 1; 
SELECT T2.releaseDate FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.translation = 'Ola de frío'; 
SELECT T1.type FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T2.name = 'Samite Pilgrim'
SELECT COUNT(*) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'World Championship Decks 2004' AND T1.convertedManaCost = 3; 
SELECT T2.translation FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Mirrodin' AND T2.language = 'Chinese Simplified'; 
SELECT CAST(SUM(CASE WHEN isNonFoilOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards WHERE uuid IN (SELECT uuid FROM foreign_data WHERE language = 'Japanese') 
SELECT CAST(SUM(CASE WHEN T1.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Portuguese (Brazil)'; 
SELECT DISTINCT availability FROM cards WHERE artist != 'Aleksi Briclot' AND isTextless = 1; 
SELECT id FROM sets ORDER BY baseSetSize DESC LIMIT 1
SELECT artist FROM cards WHERE side IS NULL ORDER BY convertedManaCost DESC LIMIT 1
SELECT frameEffects FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL GROUP BY frameEffects ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM cards WHERE power IS NULL OR power = '*' AND hasFoil = 0 AND duelDeck = 'a'; 
SELECT id FROM sets WHERE type = 'commander' ORDER BY totalSetSize DESC LIMIT 1
SELECT c.name, c.manaCost  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE l.format = 'duel'  ORDER BY c.manaCost DESC  LIMIT 10; 
SELECT MIN(T1.originalReleaseDate), GROUP_CONCAT(DISTINCT T3.format) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid INNER JOIN sets AS T3 ON T1.setCode = T3.code WHERE T1.rarity = 'mythic' AND T2.status = 'legal' ORDER BY T1.originalReleaseDate ASC LIMIT 1;
SELECT COUNT(T1.id)  FROM cards AS T1  JOIN foreign_data AS T2 ON T1.uuid = T2.uuid  WHERE T1.artist = 'Volkan Baǵa' AND T2.language = 'French'; 
SELECT COUNT(*) FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.rarity = 'rare' AND c.types = 'Enchantment' AND c.name = 'Abundance' AND l.status = 'Legal'; 
SELECT T1.format, GROUP_CONCAT(T2.name) FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.status = 'Banned' GROUP BY T1.format ORDER BY COUNT(T1.status) DESC LIMIT 1
SELECT T2.language FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Battlebond'
SELECT artist, GROUP_CONCAT(DISTINCT format) AS formats FROM cards GROUP BY artist ORDER BY COUNT(*) ASC LIMIT 1; 
SELECT T3.status FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid JOIN sets AS T3 ON T2.setCode = T3.code WHERE T1.artist = 'D. Alexander Gregory' AND T1.frameVersion = '1997' AND T1.hasContentWarning = 1 AND T2.format = 'legacy'; 
SELECT T1.name, T2.format FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.edhrecRank = 1 AND T2.status = 'Banned'; 
SELECT AVG(T2.id), T1.language FROM foreign_data AS T1 INNER JOIN sets AS T2 ON T1.uuid = T2.code WHERE T2.releaseDate BETWEEN '2012-01-01' AND '2015-12-31' GROUP BY T1.language ORDER BY COUNT(T1.language) DESC LIMIT 1
SELECT artist FROM cards WHERE borderColor = 'black' AND availability = 'arena' GROUP BY artist
SELECT uuid FROM legalities WHERE format = 'oldschool' AND status IN ('banned', 'restricted'); 
SELECT COUNT(*)  FROM cards  WHERE artist = 'Matthew D. Wilson' AND availability LIKE '%paper%'; 
SELECT T2.text FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Kev Walker' ORDER BY T2.date DESC; 
SELECT DISTINCT c.name, l.format FROM cards c JOIN sets s ON c.setCode = s.code JOIN legalities l ON c.uuid = l.uuid WHERE s.name = 'Hour of Devastation' AND l.status = 'Legal'; 
SELECT DISTINCT s.name FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Korean' AND NOT EXISTS (     SELECT 1     FROM set_translations st2     WHERE st2.setCode = s.code       AND st2.language LIKE '%Japanese%' ); 
SELECT T1.frameVersion, T2.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid INNER JOIN legalities AS T3 ON T1.uuid = T3.uuid WHERE T1.artist = 'Allen Williams' AND T3.status = 'Banned' GROUP BY T1.frameVersion, T2.name
SELECT DisplayName FROM users WHERE DisplayName IN ('Harlan', 'Jarrod Dixon') ORDER BY Reputation DESC LIMIT 1
SELECT DisplayName FROM users WHERE STRFTIME('%Y', CreationDate) = '2011'; 
SELECT COUNT(Id) AS UserCount FROM users WHERE LastAccessDate > '2014-09-01'; 
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1
SELECT COUNT(*) FROM users WHERE Upvotes > 100 AND Downvotes > 1;
SELECT COUNT(DISTINCT UserId) FROM users WHERE Views > 10 AND STRFTIME('%Y', CreationDate) > '2013'; 
SELECT COUNT(*) FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'csgillespie'; 
SELECT Title FROM posts WHERE OwnerDisplayName = 'csgillespie'
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Title = 'Eliciting priors from experts'; 
SELECT Title FROM posts WHERE OwnerDisplayName = 'csgillespie' ORDER BY ViewCount DESC LIMIT 1; 
SELECT T1.DisplayName FROM users AS T1 JOIN posts AS T2 ON T1.Id = T2.OwnerUserId ORDER BY T2.FavoriteCount DESC LIMIT 1
SELECT SUM(T2.CommentCount) AS TotalComments FROM users AS T1 JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName = 'csgillespie'; 
SELECT MAX(posts.AnswerCount) AS MostAnswers FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'csgillespie'; 
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.LastEditorUserId WHERE p.Title = 'Examples for teaching: Correlation does not mean causation' ORDER BY p.LastEditDate DESC LIMIT 1; 
SELECT COUNT(*) AS NumberOfRootPosts FROM posts WHERE OwnerDisplayName = 'csgillespie' AND ParentId IS NULL; 
SELECT DISTINCT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ClosedDate IS NOT NULL; 
SELECT COUNT(*) FROM posts WHERE OwnerUserId IN ( SELECT Id FROM users WHERE Age > 65 ) AND Score >= 20
SELECT T2.Location FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Title = 'Eliciting priors from experts'; 
SELECT p.Body FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'bayesian'
SELECT p.Body FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId ORDER BY t.Count DESC LIMIT 1; 
SELECT COUNT(*) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'csgillespie'; 
SELECT Name FROM badges WHERE UserId IN (SELECT Id FROM users WHERE DisplayName = 'csgillespie') 
SELECT COUNT(*) FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie') AND STRFTIME('%Y', Date) = '2011'; 
SELECT T2.DisplayName FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id GROUP BY T1.UserId, T2.DisplayName ORDER BY COUNT(T1.Id) DESC LIMIT 1; 
SELECT AVG(posts.Score) AS AverageScore FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'csgillespie'; 
SELECT AVG(COUNT(b.Id) / COUNT(DISTINCT u.DisplayName)) AS AvgBadgesPerUser FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Views > 200; 
SELECT CAST(SUM(CASE WHEN u.Age > 65 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(p.Id) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Score > 5
SELECT COUNT(*) FROM votes WHERE UserId = 58 AND CreationDate LIKE '2010-07-19%'; 
SELECT CreationDate FROM votes GROUP BY CreationDate ORDER BY COUNT(Id) DESC LIMIT 1
SELECT COUNT(Id) FROM badges WHERE Name = 'Revival'; 
SELECT p.Title FROM posts p JOIN comments c ON p.Id = c.PostId ORDER BY c.Score DESC LIMIT 1; 
SELECT COUNT(c.Id) AS CommentCount FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.ViewCount = 1910; 
SELECT p.FavoriteCount FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.UserId = 3025 AND c.CreationDate = '2014-04-23 20:29:39.0'; 
SELECT Text FROM comments WHERE PostId = 107829 AND CommentCount = 1; 
SELECT CASE WHEN p.ClosedDate IS NULL THEN 'Not Well-Finished' ELSE 'Well-Finished' END AS PostStatus FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.UserId = 23853 AND c.CreationDate = '2013-07-12 09:08:18.0'; 
SELECT u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Id = 65041; 
SELECT COUNT(*) FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'Tiago Pasqualini'
SELECT T2.DisplayName FROM votes AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Id = 6347
SELECT COUNT(v.Id) AS NumberOfVotes FROM posts p JOIN votes v ON p.Id = v.PostId WHERE p.Title LIKE '%data visualization%'; 
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'DatEpicCoderGuyWhoPrograms'; 
SELECT CAST(COUNT(posts.Id) AS REAL) / COUNT(votes.Id) AS PostToVoteRatio FROM posts JOIN votes ON posts.OwnerUserId = votes.UserId AND posts.Id = votes.PostId WHERE posts.OwnerUserId = 24; 
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer'; 
SELECT Text FROM comments WHERE Score = 17
SELECT DisplayName FROM users WHERE WebsiteUrl = 'http://stackoverflow.com'; 
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'SilentGhost'; 
SELECT u.DisplayName FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text LIKE '%thank you user93%' AND c.UserId != 93; 
SELECT Text FROM comments WHERE UserDisplayName = 'A Lion'; 
SELECT u.DisplayName, u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Title = 'Understanding what Dassault iSight is doing?'
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'How does gentle boosting differ from AdaBoost?'; 
SELECT T2.DisplayName FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Necromancer' LIMIT 10
SELECT u.DisplayName AS Editor FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE p.Title = 'Open source tools for visualizing multi-dimensional data'; 
SELECT Title FROM posts WHERE LastEditorDisplayName = 'Vebjorn Ljosa'
SELECT SUM(T1.Score), T2.WebsiteUrl FROM posts AS T1 INNER JOIN users AS T2 ON T1.LastEditorUserId = T2.Id WHERE T2.DisplayName = 'Yevgeny'
SELECT c.Text FROM comments AS c JOIN posts AS p ON c.PostId = p.Id WHERE p.Title = 'Why square the difference instead of taking the absolute value in standard deviation?'
SELECT SUM(T2.BountyAmount) AS TotalBountyAmount FROM posts AS T1 JOIN votes AS T2 ON T1.Id = T2.PostId WHERE T1.Title LIKE '%data%'; 
SELECT u.DisplayName FROM users u JOIN votes v ON u.Id = v.UserId JOIN posts p ON v.PostId = p.Id WHERE v.BountyAmount = 50 AND p.Title LIKE '%variance%' 
SELECT AVG(posts.ViewCount) AS AvgViewCount, posts.Title, comments.Text FROM posts JOIN comments ON posts.Id = comments.PostId WHERE posts.Tags LIKE '%<humor>%';
SELECT COUNT(*) FROM comments WHERE UserId = 13; 
SELECT UserId FROM users ORDER BY Reputation DESC LIMIT 1; 
SELECT UserId FROM posts ORDER BY Views ASC LIMIT 1
SELECT COUNT(UserId) FROM badges WHERE Name = 'Supporter' AND STRFTIME('%Y', Date) = '2011'; 
SELECT COUNT(UserId) AS NumberOfUsersWithMoreThanFiveBadges FROM badges GROUP BY UserId HAVING COUNT(Name) > 5; 
SELECT COUNT(DISTINCT u.Id) AS NumberOfUsers FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'New York' AND b.Name IN ('Teacher', 'Supporter') GROUP BY u.Id HAVING COUNT(DISTINCT b.Name) = 2; 
SELECT u.DisplayName, u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Id = 1; 
SELECT u.UserId FROM users u JOIN posts p ON u.Id = p.OwnerUserId JOIN postHistory ph ON p.Id = ph.PostId WHERE p.Views >= 1000 GROUP BY u.UserId HAVING COUNT(DISTINCT ph.PostId) = 1; 
SELECT u.DisplayName, b.Name AS BadgeName FROM users u JOIN (     SELECT UserId, COUNT(Id) AS CommentCount     FROM comments     GROUP BY UserId     ORDER BY CommentCount DESC     LIMIT 1 ) c ON u.Id = c.UserId LEFT JOIN badges b ON u.Id = b.UserId; 
SELECT COUNT(DISTINCT u.Id) AS NumberOfUsers FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'India' AND b.Name = 'Teacher'; 
SELECT      ((SUM(CASE WHEN STRFTIME('%Y', Date) = '2010' THEN 1 ELSE 0 END) / COUNT(*)) * 100 -       (SUM(CASE WHEN STRFTIME('%Y', Date) = '2011' THEN 1 ELSE 0 END) / COUNT(*)) * 100) AS percentage_difference FROM      badges WHERE      Name = 'Student'; 
SELECT DISTINCT PostHistoryTypeId, COUNT(DISTINCT UserId) FROM postHistory WHERE PostId = 3720
SELECT p.Id, p.Title, p.ViewCount AS Popularity FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.RelatedPostId = 61217; 
SELECT Score, LinkTypeId FROM postLinks WHERE PostId = 395;
SELECT PostId, OwnerUserId FROM posts WHERE Score > 60; 
SELECT SUM(FavoriteCount) FROM posts WHERE OwnerUserId = 686 AND CreationDate LIKE '2011%' 
SELECT AVG(u.UpVotes) AS AvgUpVotes, AVG(u.Age) AS AvgAge FROM users u WHERE u.Id IN (     SELECT p.OwnerUserId     FROM posts p     GROUP BY p.OwnerUserId     HAVING COUNT(p.OwnerUserId) > 10 ) 
SELECT COUNT(UserId) FROM badges WHERE Name = 'Announcer'; 
SELECT Name FROM badges WHERE Date = '2010-07-19 19:39:08.0'
SELECT COUNT(Id) AS PositiveCommentsCount FROM comments WHERE Score > 60; 
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:16:14.0'
SELECT COUNT(Id) FROM posts WHERE Score = 10; 
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MAX(Reputation) FROM users) LIMIT 1; 
SELECT U.Reputation FROM users AS U JOIN badges AS B ON U.Id = B.UserId WHERE B.Date = '2010-07-19 19:39:08.0'; 
SELECT T1.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'Pierre' 
SELECT DISTINCT b.Date FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Location = 'Rochester, NY'; 
SELECT CAST(COUNT(CASE WHEN Name = 'Teacher' THEN UserId ELSE NULL END) AS REAL) * 100 / COUNT(UserId) AS Percentage FROM badges; 
SELECT CAST(SUM(CASE WHEN u.Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(b.UserId) AS PercentageOfTeenagers FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Organizer'; 
SELECT Score FROM comments WHERE CreationDate = '2010-07-19 19:19:56.0'; 
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:37:33.0'; 
SELECT u.Age FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'Vienna, Austria'; 
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Supporter' AND UserId IN ( SELECT Id FROM users WHERE Age BETWEEN 19 AND 65 )
SELECT SUM(ViewCount) AS TotalViews FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Date = '2010-07-19 19:39:08.0'; 
SELECT T1.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id ORDER BY T2.Reputation ASC LIMIT 1
SELECT T1.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'Sharpie'
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Supporter' AND UserId IN ( SELECT Id FROM users WHERE Age > 65 )
SELECT DisplayName FROM users WHERE Id = 30; 
SELECT COUNT(Id) FROM users WHERE Location = 'New York'; 
SELECT COUNT(*) FROM votes WHERE STRFTIME('%Y', CreationDate) = '2010'; 
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65; 
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN YEAR(CreationDate) = 2010 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN YEAR(CreationDate) = 2011 THEN 1 ELSE 0 END) AS Ratio FROM votes
SELECT T2.TagName FROM users AS T1 INNER JOIN postlinks AS T2 ON T1.Id = T2.PostId WHERE T1.DisplayName = 'John Salvatier' 
SELECT COUNT(*) FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'Daniel Vassallo'; 
SELECT COUNT(*) FROM users AS u JOIN votes AS v ON u.Id = v.UserId WHERE u.DisplayName = 'Harlan'; 
SELECT Id FROM posts WHERE OwnerDisplayName = 'slashnick' ORDER BY AnswerCount DESC LIMIT 1
SELECT DisplayName FROM posts WHERE OwnerDisplayName IN ('Harvey Motulsky', 'Noah Snyder') GROUP BY DisplayName ORDER BY SUM(ViewCount) DESC LIMIT 1
SELECT COUNT(*) FROM posts JOIN votes ON posts.Id = votes.PostId JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'Matt Parker' AND votes.VoteTypeId = 2 AND votes.PostId > 4; 
SELECT COUNT(c.Id) AS NegativeCommentsCount FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON c.UserId = u.Id WHERE c.Score < 60 AND u.DisplayName = 'Neil McGuigan'; 
SELECT DISTINCT t.TagName FROM badges b JOIN users u ON b.UserId = u.Id JOIN posts p ON b.PostId = p.Id JOIN postlinks pl ON p.Id = pl.PostId JOIN tags t ON pl.RelatedPostId = t.Id WHERE u.DisplayName = 'Mark Meckes' AND p.CommentCount = 0; 
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Organizer' GROUP BY u.DisplayName; 
SELECT CAST(SUM(CASE WHEN T3.TagName = 'r' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.Id) AS percentage FROM posts AS T1 INNER JOIN posthistory AS T2 ON T1.Id = T2.PostId INNER JOIN tags AS T3 ON T1.Tags LIKE '%' || T3.TagName || '%' WHERE T1.OwnerDisplayName = 'Community'; 
SELECT      (SUM(CASE WHEN p.OwnerDisplayName = 'Mornington' THEN p.ViewCount ELSE 0 END) -      SUM(CASE WHEN p.OwnerDisplayName = 'Amos' THEN p.ViewCount ELSE 0 END)) AS ViewCountDifference FROM      posts p; 
SELECT COUNT(UserId) FROM badges WHERE Name = 'Commentator' AND STRFTIME('%Y', Date) = '2014'; 
SELECT COUNT(*) FROM posts WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59'; 
SELECT DisplayName, Age FROM users ORDER BY Views DESC LIMIT 1
SELECT LastEditDate, LastEditorUserId FROM posts WHERE Title = 'Detecting a given face in a database of facial images'; 
SELECT COUNT(Id) FROM comments WHERE UserId = 13 AND Score < 60; 
SELECT p.Title, c.UserDisplayName FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.Score > 60; 
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.Location = 'North Pole' AND STRFTIME('%Y', T2.Date) = '2011'
SELECT u.DisplayName, u.WebsiteUrl FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.FavoriteCount > 150; 
SELECT COUNT(postHistory.Id) AS PostHistoryCounts, MAX(posts.LastEditDate) AS LastEditDate FROM posts JOIN postHistory ON posts.Id = postHistory.PostId WHERE posts.Title = 'What is the best introductory Bayesian statistics textbook?'
SELECT u.LastAccessDate, u.Location FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Outliers' ORDER BY u.LastAccessDate DESC; 
SELECT p.Title FROM posts p JOIN postlinks pl ON p.Id = pl.PostId WHERE p.Title = 'How to tell if something happened in a data set which monitors a value over time'; 
SELECT p.Id AS PostID, b.Name AS BadgeName FROM badges b JOIN users u ON b.UserId = u.Id JOIN posts p ON b.PostId = p.Id WHERE u.DisplayName = 'Samuel' AND STRFTIME('%Y', b.Date) = '2013'; 
SELECT OwnerDisplayName FROM posts ORDER BY ViewCount DESC LIMIT 1; 
SELECT u.DisplayName, u.Location FROM users u JOIN posts p ON u.Id = p.OwnerUserId JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'hypothesis-testing' LIMIT 1; 
SELECT p.Title, pl.LinkTypeId FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE p.Title = 'What are principal component scores?' 
SELECT UserDisplayName FROM posts WHERE Id = (SELECT ParentId FROM posts ORDER BY Score DESC LIMIT 1)
SELECT u.DisplayName, u.WebsiteUrl FROM users u JOIN votes v ON u.Id = v.UserId WHERE v.VoteTypeId = 8 ORDER BY v.BountyAmount DESC LIMIT 1; 
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5
SELECT COUNT(*) AS TagCount FROM tags WHERE Count BETWEEN 5000 AND 7000; 
SELECT OwnerUserId FROM posts ORDER BY FavoriteCount DESC LIMIT 1
SELECT Age FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users); 
SELECT COUNT(DISTINCT p.Id) FROM posts p JOIN votes v ON p.Id = v.PostId WHERE STRFTIME('%Y', p.CreaionDate) = '2011' AND v.BountyAmount = 50; 
SELECT Id FROM users ORDER BY Age ASC LIMIT 1; 
SELECT SUM(Score) FROM posts WHERE LasActivityDate LIKE '2010-07-19%' 
SELECT AVG(CASE WHEN STRFTIME('%Y', CreationDate) = '2010' AND AnswerCount <= 2 THEN 1 ELSE 0 END) / 12 AS AvgMonthlyLinksCreated FROM postLinks; 
SELECT PostId FROM votes WHERE UserId = 1465 ORDER BY FavoriteCount DESC LIMIT 1
SELECT p.Title FROM posts p JOIN postlinks pl ON p.Id = pl.PostId ORDER BY p.CreationDate ASC LIMIT 1; 
SELECT T2.DisplayName FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id GROUP BY T2.DisplayName ORDER BY COUNT(T1.Name) DESC LIMIT 1
SELECT MIN(CreationDate) FROM votes WHERE UserId IN (SELECT Id FROM users WHERE DisplayName = 'chl')
SELECT MIN(p.CreationDate) AS FirstPostDate FROM posts p JOIN users u ON p.OwnerUserId = u.Id ORDER BY u.Age ASC LIMIT 1; 
SELECT T1.UserDisplayName FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T2.Name = 'Autobiographer' ORDER BY T2.Date ASC LIMIT 1; 
SELECT COUNT(DISTINCT u.Id) AS UserCount FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE u.Location = 'United Kingdom' AND p.FavoriteCount >= 4; 
SELECT AVG(T2.PostId) AS AvgPostsVotedByOldestUsers FROM users AS T1 JOIN votes AS T2 ON T1.Id = T2.UserId WHERE T1.Age = (SELECT MAX(Age) FROM users); 
SELECT DisplayName FROM users ORDER BY Reputation DESC LIMIT 1; 
SELECT COUNT(Id) FROM users WHERE Reputation > 2000 AND Views > 1000; 
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65; 
SELECT COUNT(*)  FROM posts  WHERE OwnerDisplayName = 'Jay Stevens' AND STRFTIME('%Y', CreationDate) = '2010'; 
SELECT Id, Title FROM posts WHERE OwnerDisplayName = 'Harvey Motulsky' ORDER BY ViewCount DESC LIMIT 1
SELECT Id, Title FROM posts ORDER BY Score DESC LIMIT 1
SELECT AVG(Score) FROM posts WHERE OwnerDisplayName = 'Stephen Turner'
SELECT DISTINCT u.DisplayName FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE p.ViewCount > 20000 AND STRFTIME('%Y', p.CreaionDate) = '2011'
SELECT Id, OwnerDisplayName FROM posts WHERE CreationDate LIKE '2010%' ORDER BY FavoriteCount DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN YEAR(posts.CreationDate) = 2011 AND users.Reputation > 1000 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(posts.Id) AS Percentage FROM posts JOIN users ON posts.OwnerUserId = users.Id; 
SELECT CAST(SUM(CASE WHEN Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(Id) FROM users
SELECT SUM(p.ViewCount) AS TotalViews, u.DisplayName AS LastPoster FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Text = 'Computer Game Datasets' ORDER BY p.LasActivityDate DESC LIMIT 1; 
SELECT COUNT(*) FROM posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts); 
SELECT COUNT(*) FROM comments WHERE PostId = (SELECT Id FROM posts ORDER BY Score DESC LIMIT 1) 
SELECT COUNT(Id) AS NumberOfPosts FROM posts WHERE ViewCount > 35000 AND CommentCount = 0; 
SELECT u.DisplayName, u.Location FROM users u JOIN posts p ON u.Id = p.LastEditorUserId WHERE p.Id = 183 ORDER BY p.LastEditDate DESC LIMIT 1; 
SELECT Name  FROM badges  WHERE UserId IN (     SELECT Id      FROM users      WHERE DisplayName = 'Emmett' )  ORDER BY Date DESC  LIMIT 1; 
SELECT COUNT(*) AS NumberOfAdultUsersWithOver5000Upvotes FROM users WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000; 
SELECT julianday(b.Date) - julianday(u.CreationDate) AS days_to_get_badge FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Zolomon' LIMIT 1; 
SELECT u.Id AS UserId, COUNT(p.Id) AS PostCount, COUNT(c.Id) AS CommentCount FROM users u LEFT JOIN posts p ON u.Id = p.OwnerUserId LEFT JOIN comments c ON u.Id = c.UserId WHERE u.CreationDate = (SELECT MAX(CreationDate) FROM users) GROUP BY u.Id; 
SELECT TOP 10 c.Text, u.UserDisplayName FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON c.UserId = u.Id WHERE p.Title = 'Analysing wind data with R' ORDER BY c.CreationDate DESC; 
SELECT COUNT(UserId) FROM badges WHERE Name = 'Citizen Patrol'
SELECT COUNT(DISTINCT p.Id) FROM posts p JOIN post_tags pt ON p.Id = pt.PostId JOIN tags t ON pt.TagId = t.Id WHERE t.TagName = 'careers'
SELECT Reputation, ViewCount FROM users WHERE DisplayName = 'Jarrod Dixon'
SELECT      COUNT(CASE WHEN p.PostTypeId = 1 THEN c.Id ELSE NULL END) AS Comments,     COUNT(CASE WHEN p.PostTypeId = 2 THEN c.Id ELSE NULL END) AS Answers FROM      posts p JOIN      comments c ON p.Id = c.PostId WHERE      p.Title = 'Clustering 1D data'; 
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat'
SELECT COUNT(PostId) FROM votes WHERE BountyAmount >= 30; 
SELECT CAST(SUM(CASE WHEN p.Score > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(p.Id) FROM posts p JOIN users u ON p.OwnerUserId = u.Id ORDER BY u.Reputation DESC LIMIT 1
SELECT COUNT(*) FROM posts WHERE Score < 20; 
SELECT COUNT(*) FROM tags WHERE Id < 15 AND Count <= 20; 
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample'
SELECT u.Reputation, u.UpVotes FROM users AS u JOIN comments AS c ON u.Id = c.UserId WHERE c.Text LIKE 'fine, you win :)'
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title LIKE '%linear regression%'; 
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ViewCount BETWEEN 100 AND 150 ORDER BY c.Score DESC LIMIT 1
SELECT u.CreationDate, u.Age  FROM users u  JOIN comments c ON u.Id = c.UserId  WHERE c.Text LIKE '%http://%'; 
SELECT COUNT(DISTINCT c.PostId) AS PostCount FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.Score = 0 AND p.ViewCount < 5; 
SELECT COUNT(*) AS NumberOfPosts FROM posts WHERE CommentCount = 1 AND Id IN (     SELECT PostId     FROM comments     WHERE Score = 0 ); 
SELECT COUNT(DISTINCT u.Id) AS TotalUsers FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Score = 0 AND u.Age = 40; 
SELECT p.Id AS PostID, c.Text AS Comment FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Title = 'Group differences on a five point Likert item' 
SELECT u.UpVotes FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'R is also lazy evaluated.'; 
SELECT Text FROM comments WHERE UserDisplayName = 'Harvey Motulsky'; 
SELECT DISTINCT UserDisplayName FROM comments WHERE Score BETWEEN 1 AND 5 AND DownVotes = 0
SELECT CAST(SUM(CASE WHEN u.UpVotes = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(u.Id) FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Score BETWEEN 5 AND 10
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.superhero_name = '3-D Man'
SELECT COUNT(*) FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE sp.power_name = 'Super Strength'; 
SELECT COUNT(*) FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE sp.power_name = 'Super Strength' AND s.height_cm > 200; 
SELECT T1.full_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id GROUP BY T1.id HAVING COUNT(T2.power_id) > 15
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Blue'
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.skin_colour_id WHERE T2.superhero_name = 'Apocalypse'
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id INNER JOIN colour AS T4 ON T1.eye_colour_id = T4.id WHERE T4.colour = 'Blue' AND T3.power_name = 'Agility'
SELECT superhero_name FROM superhero WHERE eye_colour_id IN ( SELECT id FROM colour WHERE colour = 'Blue' ) AND hair_colour_id IN ( SELECT id FROM colour WHERE colour = 'Blond' )
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics'
SELECT s.superhero_name, s.height_cm FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics' ORDER BY s.height_cm DESC; 
SELECT T.publisher_name FROM ( SELECT DISTINCT T1.publisher_name AS publisher_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name = 'Sauron' ) t
SELECT c.colour, COUNT(s.superhero_name) AS count FROM superhero s JOIN colour c ON s.eye_colour_id = c.id JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics' GROUP BY c.colour ORDER BY count DESC;
SELECT AVG(height_cm) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics'
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower p ON hp.power_id = p.id JOIN publisher pu ON s.publisher_id = pu.id WHERE pu.publisher_name = 'Marvel Comics' AND p.power_name = 'Super Strength'; 
SELECT COUNT(*) FROM superhero AS s JOIN publisher AS p ON s.publisher_id = p.id WHERE p.publisher_name = 'DC Comics'; 
SELECT T.publisher_name FROM ( SELECT T1.publisher_name, MIN(T3.attribute_value) AS min_speed FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id INNER JOIN hero_attribute AS T3 ON T2.id = T3.hero_id INNER JOIN attribute AS T4 ON T3.attribute_id = T4.id WHERE T4.attribute_name = 'Speed' GROUP BY T1.publisher_name ) AS T ORDER BY T.min_speed ASC LIMIT 1
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE colour.colour = 'Gold' AND publisher.publisher_name = 'Marvel Comics'; 
SELECT T2.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name = 'Blue Beetle II'
SELECT COUNT(*) FROM superhero WHERE hair_colour_id = (SELECT id FROM colour WHERE colour = 'Blond') 
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T2.attribute_id = 1 ORDER BY T2.attribute_value ASC LIMIT 1
SELECT T2.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.superhero_name = 'Copycat' 
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Durability' AND ha.attribute_value < 50; 
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Death Touch'
SELECT COUNT(*) FROM superhero AS s JOIN hero_attribute AS ha ON s.id = ha.hero_id JOIN attribute AS a ON ha.attribute_id = a.id WHERE s.gender_id = 2 AND a.attribute_name = 'Strength' AND ha.attribute_value = 100;
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id GROUP BY T1.id ORDER BY COUNT(T2.power_id) DESC LIMIT 1
SELECT COUNT(*) FROM superhero WHERE race_id = ( SELECT id FROM race WHERE race = 'Vampire' )
SELECT      SUM(CASE WHEN T1.alignment = 'Bad' THEN 1 ELSE 0 END) * 100 / COUNT(T1.id) AS percentage_bad_alignment,     COUNT(CASE WHEN T1.publisher_name = 'Marvel Comics' AND T1.alignment = 'Bad' THEN 1 ELSE NULL END) AS count_marvel_bad_alignment FROM      superhero AS T1 INNER JOIN      alignment AS T2 ON T1.alignment_id = T2.id INNER JOIN      publisher AS T3 ON T1.publisher_id = T3.id; 
SELECT      CASE          WHEN SUM(CASE WHEN T1.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) > SUM(CASE WHEN T1.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) THEN 'Marvel Comics'         ELSE 'DC Comics'     END AS PublisherWithMoreSuperheroes,     ABS(SUM(CASE WHEN T1.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) - SUM(CASE WHEN T1.publisher_name = 'DC Comics' THEN 1 ELSE 0 END)) AS DifferenceInSuperheroes FROM      publisher AS T1 JOIN      superhero AS T2 ON T1.id = T2.publisher_id; 
SELECT id FROM publisher WHERE publisher_name = 'Star Trek'
SELECT AVG(attribute_value) FROM hero_attribute;
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL; 
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.id = 75
SELECT T2.power_name FROM superhero AS T1 INNER JOIN hero_power AS T3 ON T1.id = T3.hero_id INNER JOIN superpower AS T2 ON T3.power_id = T2.id WHERE T1.superhero_name = 'Deathlok'; 
SELECT AVG(weight_kg) FROM superhero WHERE gender_id = (SELECT id FROM gender WHERE gender = 'Female')
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.gender_id = 1 LIMIT 5
SELECT superhero_name FROM superhero WHERE race_id = 2;
SELECT superhero_name FROM superhero WHERE height_cm BETWEEN 170 AND 190 AND eye_colour_id = 1
SELECT T2.power_name FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T1.hero_id = 56
SELECT full_name FROM superhero WHERE race_id = ( SELECT id FROM race WHERE race = 'Demi-God' ) LIMIT 5
SELECT COUNT(*) FROM superhero WHERE alignment_id = 2; 
SELECT T2.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.weight_kg = 169
SELECT T3.colour FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id INNER JOIN colour AS T3 ON T1.hair_colour_id = T3.id WHERE T1.height_cm = 185 AND T2.race = 'Human'
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id ORDER BY T1.weight_kg DESC LIMIT 1 
SELECT CAST(SUM(CASE WHEN T1.publisher_id = 13 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM superhero AS T1 WHERE T1.height_cm BETWEEN 150 AND 180
SELECT superhero_name FROM superhero WHERE gender_id = 1 AND weight_kg > ( SELECT AVG(weight_kg) * 0.79 FROM superhero )
SELECT T2.power_name FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id GROUP BY T2.power_name ORDER BY COUNT(T2.power_name) DESC LIMIT 1
SELECT T2.attribute_value FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Abomination' AND T2.attribute_id = ( SELECT id FROM attribute WHERE attribute_name = 'Intelligence' )
SELECT T2.power_name FROM superhero AS T1 INNER JOIN superpower AS T2 ON T1.id = T2.id WHERE T1.id = 1
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Stealth'
SELECT T1.full_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Strength' ORDER BY T2.attribute_value DESC LIMIT 1
SELECT CAST(SUM(IIF(T1.skin_colour_id = 1, 1, 0)) AS REAL) / COUNT(*) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.skin_colour_id = T2.id WHERE T2.colour = 'No Colour'
SELECT COUNT(superhero_name) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics') 
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Dark Horse Comics' AND a.attribute_name = 'Durability' ORDER BY ha.attribute_value DESC LIMIT 1; 
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.full_name = 'Abraham Sapien'; 
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Flight'
SELECT T1.colour AS Eyes, T2.colour AS Hair, T3.colour AS SkinColour FROM colour AS T1 JOIN superhero AS T4 ON T1.id = T4.eye_colour_id JOIN colour AS T2 ON T2.id = T4.hair_colour_id JOIN colour AS T3 ON T3.id = T4.skin_colour_id JOIN gender AS T5 ON T5.id = T4.gender_id JOIN publisher AS T6 ON T6.id = T4.publisher_id WHERE T5.gender = 'Female' AND T6.publisher_name = 'Dark Horse Comics' 
SELECT T1.superhero_name, T3.publisher_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id INNER JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T1.hair_colour_id = T1.skin_colour_id AND T1.hair_colour_id = T1.eye_colour_id
SELECT T.race FROM superhero AS T WHERE T.superhero_name = 'A-Bomb' AND T.race IS NOT NULL; 
SELECT CAST(COUNT(CASE WHEN T1.skin_colour_id = ( SELECT id FROM colour WHERE colour = 'Blue' ) THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(*) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.skin_colour_id = T2.id INNER JOIN gender AS T3 ON T1.gender_id = T3.id WHERE T3.gender = 'Female'
SELECT s.superhero_name, r.race FROM superhero s JOIN race r ON s.race_id = r.id WHERE s.full_name = 'Charles Chandler'; 
SELECT T.gender FROM gender AS T JOIN superhero AS ST ON T.id = ST.gender_id WHERE ST.superhero_name = 'Agent 13'
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Adaptation'; 
SELECT COUNT(*) FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id WHERE s.superhero_name = 'Amazo'
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.full_name = 'Hunter Zolomon'
SELECT T1.height_cm FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Amber'
SELECT s.superhero_name FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.colour = 'Black' AND s.hair_colour_id = ( SELECT id FROM colour WHERE colour = 'Black' )
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.skin_colour_id = T2.id WHERE T2.colour = 'Gold'
SELECT full_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Vampire')
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T2.alignment = 'Neutral'
SELECT COUNT(*) FROM hero_attribute WHERE attribute_value = ( SELECT MAX(attribute_value) FROM hero_attribute WHERE attribute_id = ( SELECT id FROM attribute WHERE attribute_name = 'Strength' ) )
SELECT T1.race, T2.alignment FROM race AS T1 INNER JOIN alignment AS T2 ON T1.id = T2.id INNER JOIN superhero AS T3 ON T1.id = T3.race_id AND T2.id = T3.alignment_id WHERE T3.superhero_name = 'Cameron Hicks'
SELECT CAST(COUNT(CASE WHEN T1.gender = 'Female' AND T2.publisher_name = 'Marvel Comics' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T2.publisher_name = 'Marvel Comics') FROM gender AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.gender_id INNER JOIN publisher AS T3 ON T2.publisher_id = T3.id 
SELECT AVG(weight_kg) FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Alien')
SELECT (SUM(CASE WHEN full_name = 'Emil Blonsky' THEN weight_kg ELSE 0 END) - SUM(CASE WHEN full_name = 'Charles Chandler' THEN weight_kg ELSE 0 END)) AS weight_difference FROM superhero
SELECT AVG(height_cm) FROM superhero GROUP BY superhero_name
SELECT T2.power_name FROM superhero AS T1 INNER JOIN hero_power AS T3 ON T1.id = T3.hero_id INNER JOIN superpower AS T2 ON T3.power_id = T2.id WHERE T1.superhero_name = 'Abomination'
SELECT COUNT(*) FROM superhero WHERE race_id = 21 AND gender_id = 1
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Speed' ORDER BY T2.attribute_value DESC LIMIT 1
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3
SELECT a.attribute_name, ha.attribute_value FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE s.superhero_name = '3-D Man'; 
SELECT superhero_name FROM superhero WHERE eye_colour_id IN ( SELECT id FROM colour WHERE colour = 'Blue' ) AND hair_colour_id IN ( SELECT id FROM colour WHERE colour = 'Brown' )
SELECT T.publisher_name FROM ( SELECT DISTINCT CASE WHEN superhero_name = 'Hawkman' THEN publisher_name END AS publisher_name FROM superhero UNION SELECT DISTINCT CASE WHEN superhero_name = 'Karate Kid' THEN publisher_name END AS publisher_name FROM superhero UNION SELECT DISTINCT CASE WHEN superhero_name = 'Speedy' THEN publisher_name END AS publisher_name FROM superhero ) t WHERE t.publisher_name IS NOT NULL
SELECT COUNT(*) FROM superhero WHERE publisher_id = 1; 
SELECT CAST(COUNT(CASE WHEN T1.eye_colour_id = 7 THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(*) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Blue' 
SELECT CAST(SUM(CASE WHEN T1.gender_id = 1 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T1.gender_id = 2 THEN 1 ELSE 0 END) FROM gender AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.gender_id
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1
SELECT id FROM superpower WHERE power_name = 'Cryokinesis'
SELECT superhero_name FROM superhero WHERE id = 294
SELECT full_name FROM superhero WHERE weight_kg IS NULL OR weight_kg = 0; 
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.full_name = 'Karen Beecher-Duncan'
SELECT T2.power_name FROM superhero AS T1 INNER JOIN hero_power AS T3 ON T1.id = T3.hero_id INNER JOIN superpower AS T2 ON T3.power_id = T2.id WHERE T1.full_name = 'Helen Parr'
SELECT T1.race FROM race AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T2.weight_kg = 108 AND T2.height_cm = 188
SELECT T.publisher_name FROM publisher AS T JOIN superhero AS S ON T.id = S.publisher_id WHERE S.id = 38
SELECT r.race  FROM race r  JOIN superhero s ON r.id = s.race_id  JOIN hero_attribute ha ON s.id = ha.hero_id  WHERE ha.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute); 
SELECT T1.alignment, T4.power_name FROM alignment AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.alignment_id INNER JOIN hero_power AS T3 ON T2.id = T3.hero_id INNER JOIN superpower AS T4 ON T3.power_id = T4.id WHERE T2.superhero_name = 'Atom IV'
SELECT T1.full_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Blue' LIMIT 5
SELECT AVG(T2.attribute_value) FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.alignment_id = 3
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.skin_colour_id INNER JOIN hero_attribute AS T3 ON T2.id = T3.hero_id WHERE T3.attribute_value = 100
SELECT COUNT(*) FROM superhero WHERE gender_id = 2 AND alignment_id = 1; 
SELECT s.superhero_name FROM superhero AS s JOIN hero_attribute AS ha ON s.id = ha.hero_id WHERE ha.attribute_value BETWEEN 75 AND 80
SELECT T1.race FROM race AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.race_id INNER JOIN colour AS T3 ON T3.id = T2.hair_colour_id INNER JOIN gender AS T4 ON T4.id = T2.gender_id WHERE T3.colour = 'Blue' AND T4.gender = 'Male'
SELECT CAST(SUM(CASE WHEN T1.gender_id = 2 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM superhero AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T2.id = 2 
SELECT SUM(CASE WHEN T2.id = 7 THEN 1 ELSE 0 END) - SUM(CASE WHEN T2.id = 1 THEN 1 ELSE 0 END) AS difference FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.weight_kg IS NULL OR T1.weight_kg = 0 
SELECT T2.attribute_value FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T1.superhero_name = 'Hulk' AND T3.attribute_name = 'Strength'
SELECT T3.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.superhero_name = 'Ajax'; 
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.skin_colour_id = T2.id INNER JOIN alignment AS T3 ON T1.alignment_id = T3.id WHERE T2.colour = 'Green' AND T3.alignment = 'Bad'
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id INNER JOIN gender AS T3 ON T1.gender_id = T3.id WHERE T3.gender = 'Female' AND T2.publisher_name = 'Marvel Comics'
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Wind Control' ORDER BY T1.superhero_name ASC
SELECT T1.gender FROM gender AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.gender_id INNER JOIN hero_power AS T3 ON T2.id = T3.hero_id INNER JOIN superpower AS T4 ON T3.power_id = T4.id WHERE T4.power_name = 'Phoenix Force'
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'DC Comics' ORDER BY T1.weight_kg DESC LIMIT 1
SELECT AVG(s.height_cm) AS average_height FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.race != 'Human' AND p.publisher_name = 'Dark Horse Comics'; 
SELECT COUNT(*) AS fast_superheroes_count FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute_name = 'Speed' AND attribute_value = 100; 
SELECT SUM(CASE WHEN T1.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) - SUM(CASE WHEN T1.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS difference FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id
SELECT T2.attribute_name FROM superhero AS T1 INNER JOIN attribute AS T2 ON T1.id = T2.id INNER JOIN hero_attribute AS T3 ON T1.id = T3.hero_id WHERE T1.superhero_name = 'Black Panther' ORDER BY T3.attribute_value ASC LIMIT 1
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T2.superhero_name = 'Abomination'
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler'
SELECT      CAST(SUM(CASE WHEN T1.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS percentage_female_superheroes FROM      superhero AS T1 JOIN      publisher AS T2 ON T1.publisher_id = T2.id WHERE      T2.publisher_name = 'George Lucas'; 
SELECT CAST(COUNT(CASE WHEN T1.alignment = 'Good' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.id) FROM superhero AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T1.publisher_id = 5
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%'; 
SELECT hero_id FROM hero_attribute WHERE attribute_value = ( SELECT MIN(attribute_value) FROM hero_attribute )
SELECT full_name FROM superhero WHERE superhero_name = 'Alien'
SELECT full_name FROM superhero WHERE weight_kg < 100 AND eye_colour_id = (SELECT id FROM colour WHERE colour = 'Brown'); 
SELECT T2.attribute_value FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Aquababy' AND T2.attribute_id = ( SELECT id FROM attribute WHERE attribute_name = 'Intelligence' )
SELECT T1.weight_kg, T3.race FROM superhero AS T1 INNER JOIN race AS T3 ON T1.race_id = T3.id WHERE T1.id = 40; 
SELECT AVG(height_cm) FROM superhero WHERE alignment_id = 3
SELECT superhero.id FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Intelligence'
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.superhero_name = 'Blackwulf'
SELECT T1.power_name FROM superpower AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.power_id INNER JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero) 
SELECT T1.driverRef FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 20 AND T2.q1 IS NOT NULL ORDER BY T2.q1 DESC LIMIT 5; 
SELECT T1.surname FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 19 AND T2.q2 IS NOT NULL ORDER BY T2.q2 ASC LIMIT 1
SELECT DISTINCT YEAR FROM races WHERE circuitid IN (SELECT circuitid FROM circuits WHERE LOCATION = 'Shanghai') 
SELECT T1.url FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Circuit de Barcelona-Catalunya'
SELECT T2.name FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.country = 'Germany'
SELECT DISTINCT T1.position FROM constructorStandings AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T2.name = 'Renault'; 
SELECT COUNT(*) FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.year = 2010 AND T1.country NOT IN ('Asia', 'Europe') AND T2.name LIKE '%Grand Prix%'
SELECT DISTINCT T1.name FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.country = 'Spain' ORDER BY T1.name ASC
SELECT T1.lat, T1.lng FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Australian Grand Prix'
SELECT T1.url FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Sepang International Circuit'
SELECT T1.time FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Sepang International Circuit'
SELECT T1.lat, T1.lng FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Abu Dhabi Grand Prix'
SELECT T3.country FROM constructorResults AS T1 JOIN constructors AS T2 ON T1.constructorid = T2.constructorid JOIN circuits AS T3 ON T1.raceid = T3.circuitid WHERE T1.points = 1 AND T1.raceid = 24; 
SELECT q1 FROM qualifying WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Bruno' AND surname = 'Senna') AND raceId = 354; 
SELECT T1.nationality FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T2.q2 = '0:01:40' AND T2.raceid = 355; 
SELECT T1.number FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T2.q3 LIKE '1:54%' AND T2.raceid = 903; 
SELECT COUNT(*)  FROM results  JOIN races ON results.raceId = races.raceId  WHERE races.name = 'Bahrain Grand Prix' AND YEAR = 2007 AND time IS NULL; 
SELECT T1.year FROM seasons AS T1 INNER JOIN races AS T2 ON T1.year = T2.year WHERE T2.raceId = 901;
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE date = '2015-11-29') AND statusId = 1
SELECT d.driverId, d.forename, d.surname, d.dob FROM drivers d JOIN results r ON d.driverId = r.driverId AND r.raceId = 592 WHERE r.statusId = 1 ORDER BY d.dob ASC LIMIT 1; 
SELECT d.url FROM drivers d JOIN laptimes lt ON d.driverid = lt.driverid WHERE lt.laptime LIKE '1:27%' AND lt.raceid = 161; 
SELECT d.nationality FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 933 AND r.fastestLapSpeed = ( SELECT MAX(fastestLapSpeed) FROM results WHERE raceId = 933 ); 
SELECT T2.lat, T2.lng FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Malaysian Grand Prix'
SELECT T1.url FROM constructors AS T1 JOIN constructorResults AS T2 ON T1.constructorId = T2.constructorId WHERE T2.raceId = 9 ORDER BY T2.points DESC LIMIT 1
SELECT q1 FROM qualifying WHERE driverid = (SELECT driverid FROM drivers WHERE forename = 'Lucas' AND surname = 'di Grassi') AND raceid = 345; 
SELECT T1.nationality FROM drivers AS T1 INNER JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T2.q2 = '00:01:15' AND T2.raceid = 347
SELECT T2.code FROM qualifying AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T1.raceid = 45 AND T1.q3 = '01:33'
SELECT T1.time FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T1.raceid = 743 AND T2.forename = 'Bruce' AND T2.surname = 'McLaren'
SELECT T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.position = 2 AND T2.raceid = ( SELECT raceid FROM races WHERE name = 'San Marino Grand Prix' AND YEAR = 2006 )
SELECT T1.url FROM seasons AS T1 JOIN races AS T2 ON T1.year = T2.year WHERE T2.raceId = 901; 
SELECT COUNT(driverId) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE date = '2015-11-29') AND statusId != 1
SELECT T1.driverid, T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 872 AND T2.statusid = 1 ORDER BY T1.dob DESC LIMIT 1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 348 ORDER BY T2.milliseconds ASC LIMIT 1
SELECT T1.nationality FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId ORDER BY T2.fastestLapSpeed DESC LIMIT 1
SELECT ((SELECT T1.fastestLapSpeed FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Paul' AND T2.surname = 'di Resta' AND T1.raceId = 853) - (SELECT T1.fastestLapSpeed FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Paul' AND T2.surname = 'di Resta' AND T1.raceId = 854)) / (SELECT T1.fastestLapSpeed FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Paul' AND T2.surname = 'di Resta' AND T1.raceId = 853) * 100 AS percentage; 
SELECT CAST(SUM(CASE WHEN T2.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.driverid) AS "Race Completion Rate" FROM driverstandings AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid AND T1.driverid = T2.driverid WHERE T2.date = '1983-07-16'; 
SELECT MIN(year) AS first_year FROM races WHERE name = 'Singapore Grand Prix'; 
SELECT COUNT(raceId), name FROM races WHERE YEAR = 2005 ORDER BY name DESC; 
SELECT name FROM races WHERE YEAR = (SELECT MIN(YEAR) FROM races) AND MONTH = (SELECT MONTH(MIN(date)) FROM races); 
SELECT name, date FROM races WHERE year = 1999 ORDER BY round DESC LIMIT 1; 
SELECT YEAR FROM races GROUP BY YEAR ORDER BY SUM(round) DESC LIMIT 1
SELECT DISTINCT r.name FROM races r WHERE r.year = 2017 AND r.circuitId NOT IN (SELECT circuitId FROM races WHERE year = 2000) 
SELECT circuits.country, circuits.name AS circuit, circuits.location  FROM circuits  JOIN races ON circuits.circuitid = races.circuitid  WHERE races.year = (SELECT MIN(year) FROM races WHERE name LIKE '%European%Grand%Prix')  LIMIT 1; 
SELECT MAX(r.year) AS last_season FROM races r JOIN circuits c ON r.circuitid = c.circuitid WHERE r.name = 'British Grand Prix' AND c.name = 'Brands Hatch'; 
SELECT COUNT(DISTINCT T2.year) FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Silverstone' AND T2.name LIKE '%British%'
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = (SELECT raceid FROM races WHERE YEAR = 2010 AND name = 'Singapore Grand Prix') ORDER BY T2.position; 
SELECT T1.forename, T1.surname, MAX(T2.points) FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverid = T2.driverid
SELECT D.forename, D.surname, RS.points FROM drivers AS D JOIN results AS RS ON D.driverid = RS.driverid JOIN races AS R ON RS.raceid = R.raceid WHERE R.name = 'Chinese Grand Prix' AND R.year = 2017 ORDER BY RS.points DESC LIMIT 3
SELECT drivers.forename, drivers.surname, races.name FROM drivers JOIN laptimes ON drivers.driverid = laptimes.driverid JOIN races ON laptimes.raceid = races.raceid ORDER BY laptimes.milliseconds ASC LIMIT 1
SELECT AVG(l.milliseconds) AS avg_lap_time FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId JOIN laptimes l ON r.raceId = l.raceId AND r.driverId = l.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND ra.name = 'Malaysian Grand Prix' AND ra.year = 2009; 
SELECT CAST(SUM(CASE WHEN T1.surname = 'Hamilton' AND T2.position > 1 THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T1.surname = 'Hamilton' THEN 1 ELSE 0 END) FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.year >= 2010; 
SELECT T1.forename, T1.surname, T1.nationality, T2.points FROM drivers AS T1 JOIN driverstandings AS T2 ON T1.driverid = T2.driverid GROUP BY T1.driverid ORDER BY COUNT(T2.wins) DESC, SUM(T2.points) DESC LIMIT 1
SELECT MIN(YEAR(CURRENT_TIMESTAMP) - YEAR(dob)) AS age, forename, surname FROM drivers WHERE nationality = 'Japanese'
SELECT c.circuitName FROM circuits AS c JOIN races AS r ON c.circuitId = r.circuitId WHERE r.date BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY c.circuitName HAVING COUNT(r.raceId) = 4 
SELECT c.name AS circuit_name, c.location AS location, r.name AS race_name FROM circuits c JOIN races r ON c.circuitid = r.circuitid WHERE c.country = 'USA' AND r.year = 2006; 
SELECT r.name, c.name AS circuit_name, c.location FROM races r JOIN circuits c ON r.circuitid = c.circuitid WHERE MONTH(r.date) = 9 AND YEAR(r.date) = 2005; 
SELECT DISTINCT r.name FROM races r JOIN results res ON r.raceid = res.raceid JOIN drivers d ON res.driverid = d.driverid WHERE d.forename = 'Alex' AND d.surname = 'Yoong' AND res.position < 20; 
SELECT COUNT(*)  FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN circuits c ON r.raceId = c.circuitId WHERE d.forename = 'Michael' AND d.surname = 'Schumacher' AND c.name = 'Sepang International Circuit' AND r.points = (SELECT MAX(points) FROM results WHERE driverId = d.driverId AND raceId IN (SELECT raceId FROM circuits WHERE name = 'Sepang International Circuit')); 
SELECT r.name, r.year FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.forename = 'Michael' AND d.surname = 'Schumacher' ORDER BY res.fastestLap ASC LIMIT 1; 
SELECT AVG(T1.points) FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T2.surname = 'Irvine' AND T1.year = 2000; 
SELECT MIN(r.year), dr.points FROM races r JOIN results res ON r.raceid = res.raceid JOIN drivers dr ON res.driverid = dr.driverid WHERE dr.forename = 'Lewis' AND dr.surname = 'Hamilton'
SELECT T1.name, T2.country FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.year = 2017 ORDER BY T1.date
SELECT T2.name, T2.year, T1.location FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid ORDER BY T2.laps DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN T1.country = 'Germany' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name LIKE '%European Grand Prix%'
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit'
SELECT name FROM circuits WHERE lat = ( SELECT MAX(lat) FROM circuits WHERE name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring') )
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit'
SELECT country FROM circuits ORDER BY alt DESC LIMIT 1; 
SELECT COUNT(driverId) FROM drivers WHERE code IS NULL; 
SELECT T1.country FROM circuits AS T1 INNER JOIN drivers AS T2 ON T1.circuitid = T2.driverid ORDER BY T2.dob ASC LIMIT 1
SELECT surname FROM drivers WHERE nationality = 'Italian'
SELECT url FROM drivers WHERE forename = 'Anthony' AND surname = 'Davidson';
SELECT driverRef FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton'; 
SELECT T2.name FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.year = 2009 AND T1.name = 'Spanish Grand Prix'
SELECT DISTINCT year FROM races WHERE circuitid IN (SELECT circuitid FROM circuits WHERE name = 'Silverstone Circuit')
SELECT T1.url FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Silverstone'
SELECT T1.time FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.year BETWEEN 2010 AND 2019 AND T2.name = 'Abu Dhabi Circuit'; 
SELECT COUNT(*) AS race_count FROM races JOIN circuits ON races.circuitid = circuits.circuitid WHERE circuits.country = 'Italy'; 
SELECT T1.date FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Circuit de Barcelona-Catalunya' ORDER BY T1.date ASC
SELECT T1.url FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.year = 2009 AND T2.name = 'Spanish Grand Prix'
SELECT MIN(T1.fastestLapTime) AS FastestLapTime FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton'; 
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid ORDER BY T2.fastestlapspeed DESC LIMIT 1
SELECT drivers.driverRef FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN races ON results.raceId = races.raceId WHERE races.name = 'Canadian Grand Prix' AND results.position = 1; 
SELECT DISTINCT T1.name FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T3.forename = 'Lewis' AND T3.surname = 'Hamilton';
SELECT r.name FROM races r JOIN results res ON r.raceid = res.raceid JOIN drivers d ON res.driverid = d.driverid WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' ORDER BY res.rank ASC LIMIT 1; 
SELECT MAX(fastestLapSpeed) AS FastestLapSpeed FROM results JOIN races ON results.raceId = races.raceId WHERE races.name = 'Spanish Grand Prix'; 
SELECT DISTINCT YEAR FROM races WHERE raceid IN ( SELECT raceid FROM results WHERE driverid = ( SELECT driverid FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton' ) ) ORDER BY YEAR ASC
SELECT T2.positionOrder FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton' AND T3.year = 2008 AND T3.name = 'Chinese Grand Prix' ORDER BY T2.position DESC LIMIT 1; 
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.grid = 4 AND T2.raceid IN (SELECT raceid FROM races WHERE year = 1989 AND name = 'Australian Grand Prix')
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId IN ( SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix' ) AND statusId = 1;
SELECT MIN(milliseconds) AS fastest_lap_time FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races rs ON r.raceId = rs.raceId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND rs.year = 2008 AND rs.name = 'Australian Grand Prix'; 
SELECT T1.time FROM results AS T1 INNER JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.year = 2008 AND T2.name = 'Chinese Grand Prix' AND T1.position = 2
SELECT d.forename, d.surname, r.time, d.url FROM drivers d JOIN results r ON d.driverid = r.driverid JOIN races ra ON r.raceid = ra.raceid WHERE ra.year = 2008 AND ra.name = 'Australian Grand Prix' AND r.position = 1; 
SELECT COUNT(*) FROM results r JOIN drivers d ON r.driverid = d.driverid WHERE r.raceid = (SELECT raceid FROM races WHERE name = '2008 Australian Grand Prix') AND d.nationality = 'British'; 
SELECT COUNT(DISTINCT r.driverId) AS driver_count FROM results r JOIN races rs ON r.raceId = rs.raceId WHERE rs.year = 2008 AND rs.name = 'Chinese Grand Prix' AND r.time IS NOT NULL; 
SELECT SUM(points) FROM results AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton';
SELECT AVG(REPLACE(SUBSTR(T1.fastestLapTime, INSTR(T1.fastestLapTime, ':') + 1), '.', '')) / 1000 AS avgFastestLapTime FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton';
SELECT CAST(SUM(CASE WHEN T1.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) / COUNT(*) AS completion_rate FROM laptimes AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.year = 2008 AND T2.name = 'Australian Grand Prix'; 
SELECT      ((strftime('%J', SUBSTR(T1.time, -8)) - strftime('%J', '00:00:00')) -       (strftime('%J', SUBSTR(T1.time, -8)) - strftime('%J', T2.time))) /      (strftime('%J', SUBSTR(T1.time, -8)) - strftime('%J', T2.time)) * 100 AS percentage_faster FROM      results AS T1 JOIN      results AS T2 ON T2.driverid = (SELECT driverid FROM results WHERE raceid = 18 ORDER BY position DESC LIMIT 1) WHERE      T1.raceid = 18 AND T1.position = 1; 
SELECT COUNT(*) FROM circuits WHERE country = 'Australia' AND location = 'Adelaide';
SELECT lat, lng FROM circuits WHERE country = 'USA'
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND STRFTIME('%Y', dob) > '1980'; 
SELECT MAX(T1.points) FROM constructorResults AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T2.nationality = 'British'
SELECT T2.name FROM constructorStandings AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId ORDER BY points DESC LIMIT 1
SELECT T2.name FROM constructorstandings AS T1 JOIN constructors AS T2 ON T1.constructorid = T2.constructorid WHERE T1.raceid = 291 AND T1.points = 0
SELECT COUNT(DISTINCT constructorId) FROM constructorStandings WHERE nationality = 'Japanese' AND points = 0 AND raceId IN ( SELECT raceId FROM constructorStandings WHERE constructorId IN ( SELECT constructorId FROM constructorStandings WHERE nationality = 'Japanese' AND points = 0 ) GROUP BY constructorId HAVING COUNT(raceId) = 2 )
SELECT T1.name FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorid = T2.constructorid WHERE T2.position = 1
SELECT COUNT(*) FROM constructorResults cr JOIN constructors c ON cr.constructorId = c.constructorId WHERE c.nationality = 'French' AND cr.laps > 50; 
SELECT CAST(SUM(CASE WHEN T1.time IS NOT NULL AND T2.year BETWEEN 2007 AND 2009 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.driverid) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T1.driverid IN ( SELECT driverid FROM drivers WHERE nationality = 'Japanese' )
SELECT YEAR(r.raceId), AVG(TIME_TO_SEC(r.time)) AS avg_time_in_seconds FROM races r JOIN results res ON r.raceId = res.raceId AND res.position = 1 WHERE r.year < 1975 AND r.time IS NOT NULL GROUP BY YEAR(r.raceId) ORDER BY YEAR(r.raceId); 
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE STRFTIME('%Y', T1.dob) > '1975' AND T2.rank = 2;
SELECT COUNT(*) FROM drivers AS d JOIN results AS r ON d.driverid = r.driverid WHERE d.nationality = 'Italian' AND r.time IS NULL; 
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid ORDER BY T2.milliseconds ASC LIMIT 1; 
SELECT T2.fastestLap FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 2009 AND T2.position = 1 ORDER BY T2.fastestLapTime ASC LIMIT 1
SELECT AVG(fastestLapSpeed) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE year = 2009 AND name = 'Spanish Grand Prix'); 
SELECT r.name, s.year FROM races r JOIN seasons s ON r.year = s.year JOIN results res ON r.raceid = res.raceid WHERE res.milliseconds IS NOT NULL ORDER BY res.milliseconds ASC LIMIT 1; 
SELECT CAST(SUM(CASE WHEN T1.year < 1985 AND T2.laps > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.driverId) FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.year BETWEEN 2000 AND 2005; 
SELECT COUNT(DISTINCT driverId) FROM drivers WHERE nationality = 'French' AND EXISTS (     SELECT 1 FROM laptimes WHERE driverId = drivers.driverId AND TIME < '02:00.00' ); 
SELECT code FROM drivers WHERE nationality = 'American'; 
SELECT raceId FROM races WHERE YEAR = 2009
SELECT COUNT(driverId) FROM results WHERE raceId = 18; 
SELECT code FROM drivers ORDER BY dob DESC LIMIT 3; SELECT COUNT(*) FROM drivers WHERE nationality = 'Dutch' AND code IN (SELECT code FROM drivers ORDER BY dob DESC LIMIT 3);
SELECT driverRef FROM drivers WHERE forename = 'Robert' AND surname = 'Kubica'; 
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND STRFTIME('%Y', dob) = '1980';
SELECT T1.driverid ,  T1.forename ,  T1.surname FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid WHERE T1.nationality = 'German' AND STRFTIME('%Y', T1.dob) BETWEEN '1980' AND '1990' GROUP BY T1.driverid ORDER BY MIN(T2.milliseconds) ASC LIMIT 3
SELECT driverRef FROM drivers WHERE nationality = 'German' ORDER BY dob ASC LIMIT 1
SELECT T1.driverId, T1.code FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE STRFTIME('%Y', T1.dob) = '1971' AND T2.fastestLap IS NOT NULL ORDER BY T2.fastestLap ASC LIMIT 1
SELECT d.forename, d.surname, MAX(l.time) AS latest_lap_time FROM drivers d JOIN laptimes l ON d.driverid = l.driverid WHERE d.nationality = 'Spanish' AND STRFTIME('%Y', d.dob) < '1982' GROUP BY d.driverid ORDER BY latest_lap_time DESC LIMIT 10; 
SELECT YEAR FROM races WHERE raceId = (SELECT raceId FROM results ORDER BY fastestLapTime ASC LIMIT 1)
SELECT YEAR FROM races WHERE raceId = (SELECT raceId FROM results ORDER BY fastestLapSpeed DESC LIMIT 1) 
SELECT driverId FROM lapTimes WHERE lap = 1 ORDER BY time ASC LIMIT 5
SELECT COUNT(*) FROM results WHERE raceId BETWEEN 50 AND 100 AND statusId = 2 AND TIME IS NOT NULL; 
SELECT COUNT(*) AS circuit_count, LOCATION, lat, lng FROM circuits WHERE country = 'Austria' GROUP BY LOCATION, lat, lng;
SELECT number FROM results WHERE TIME IS NOT NULL GROUP BY number ORDER BY COUNT(*) DESC LIMIT 1 
SELECT T1.driverRef, T1.nationality, T1.dob FROM drivers AS T1 INNER JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 23 AND T2.q2 IS NOT NULL
SELECT MIN(races.year) AS year, circuits.name AS circuit_name, races.date AS race_date, races.time AS race_time FROM drivers JOIN qualifying ON drivers.driverid = qualifying.driverid JOIN races ON qualifying.raceid = races.raceid JOIN circuits ON races.circuitid = circuits.circuitid ORDER BY drivers.dob DESC, races.date ASC LIMIT 1; 
SELECT COUNT(*) AS american_drivers_with_puncture_status FROM results JOIN driverStandings ON results.driverId = driverStandings.driverId JOIN drivers ON driverStandings.driverId = drivers.driverId JOIN status ON results.statusId = status.statusId WHERE drivers.nationality = 'American' AND status.status = 'Puncture'; 
SELECT c.name, c.url FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId WHERE c.nationality = 'Italian' ORDER BY cs.points DESC LIMIT 1; 
SELECT T2.url FROM constructorStandings AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T1.wins = ( SELECT MAX(wins) FROM constructorStandings )
SELECT d.driverid, d.forename, d.surname, l.time FROM drivers d JOIN laptimes l ON d.driverid = l.driverid AND l.raceid IN (     SELECT raceid FROM races WHERE name = 'French Grand Prix' ) AND l.lap = 3 ORDER BY l.milliseconds DESC LIMIT 1; 
SELECT r.name, lt.milliseconds AS fastest_lap_time_ms FROM races r JOIN (     SELECT raceId, MIN(milliseconds) AS min_milliseconds     FROM lapTimes     WHERE lap = 1     GROUP BY raceId ) sub ON r.raceId = sub.raceId JOIN lapTimes lt ON r.raceId = lt.raceId AND lt.lap = 1 AND lt.milliseconds = sub.min_milliseconds; 
SELECT AVG(T2.fastestLapTime) AS avg_fastest_lap_time FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.year = 2006 AND T1.name = 'United States Grand Prix' AND T2.rank < 11; 
SELECT d.forename, d.surname FROM drivers d JOIN pitstops ps ON d.driverid = ps.driverid WHERE STRFTIME('%Y', d.dob) BETWEEN '1980' AND '1985' GROUP BY d.driverid ORDER BY AVG(ps.duration) ASC LIMIT 3
SELECT T1.forename, T1.surname, T2.time FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T3.name = 'Canadian Grand Prix' AND T3.year = 2008 AND T2.position = 1; 
SELECT T1.constructorRef, T1.url FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T3.year = 2009 AND T3.name = 'Singapore Grand Prix' ORDER BY T2.points DESC LIMIT 1
SELECT forename, surname, dob FROM drivers WHERE nationality = 'Austrian' AND STRFTIME('%Y', dob) BETWEEN '1981' AND '1991'
SELECT forename || ' ' || surname AS FullName, url AS WikiPediaPageLink, dob AS DateOfBirth FROM drivers WHERE nationality = 'German' AND STRFTIME('%Y', dob) BETWEEN '1971' AND '1985' ORDER BY dob DESC; 
SELECT location, country, lat, lng FROM circuits WHERE name = 'Hungaroring'
SELECT c.constructorId, c.name, c.nationality, SUM(cr.points) AS total_points FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId JOIN races r ON cr.raceId = r.raceId WHERE r.circuitId = (SELECT circuitId FROM circuits WHERE name = 'Circuit de Monaco') AND r.year BETWEEN 1980 AND 2010 GROUP BY c.constructorId ORDER BY total_points DESC LIMIT 1; 
SELECT AVG(points) AS average_score FROM results JOIN drivers ON results.driverid = drivers.driverid JOIN races ON results.raceid = races.raceid WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.country = 'Turkey' AND races.name = 'Turkish Grand Prix'; 
SELECT AVG(COUNT(*)) AS annual_average_races FROM races WHERE YEAR BETWEEN 2001 AND 2010; 
SELECT nationality FROM drivers GROUP BY nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT SUM(wins) AS total_victories FROM driverStandings WHERE position = 91; 
SELECT r.name AS race_name FROM races r JOIN results res ON r.raceid = res.raceid ORDER BY res.fastestlaptimes ASC LIMIT 1; 
SELECT circuits.name, circuits.location || ', ' || circuits.country FROM races JOIN circuits ON races.circuitid = circuits.circuitid ORDER BY races.date DESC LIMIT 1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid JOIN circuits AS T3 ON T3.circuitid = T2.circuitid WHERE T2.position = 1 AND T2.round = 3 AND T3.name = 'Marina Bay Street Circuit' AND YEAR(T2.date) = 2008; 
SELECT d.forename || ' ' || d.surname AS FullName, d.nationality, r.name AS RaceName FROM drivers d JOIN results res ON d.driverid = res.driverid JOIN races r ON res.raceid = r.raceid WHERE d.dob = (SELECT MIN(dob) FROM drivers) LIMIT 1; 
SELECT COUNT(*) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE name = 'Canadian Grand Prix') AND statusId = 3 GROUP BY driverId ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(wins) AS wins, forename, surname FROM drivers d JOIN driverstandings ds ON d.driverid = ds.driverid ORDER BY dob ASC LIMIT 1; 
SELECT MAX(duration) AS longest_pit_stop_duration FROM pitStops;
SELECT MIN(time) AS fastest_lap_time FROM laptimes; 
SELECT MAX(T1.duration) FROM pitstops AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton'
SELECT lap FROM pitstops WHERE driverid = (SELECT driverid FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton') AND raceid = (SELECT raceid FROM races WHERE name = 'Australian Grand Prix' AND YEAR = 2011) ORDER BY lap ASC LIMIT 1
SELECT D.forename, D.surname, P.duration FROM drivers AS D JOIN pitstops AS P ON D.driverid = P.driverid JOIN races AS R ON P.raceid = R.raceid WHERE R.year = 2011 AND R.name = 'Australian Grand Prix'; 
SELECT MIN(T1.time) AS lap_record FROM laptimes AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton'; 
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid ORDER BY T2.time ASC LIMIT 20
SELECT T2.position FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T1.surname = 'Hamilton' ORDER BY T2.fastestlaptime ASC LIMIT 1
SELECT MIN(T1.time) AS lap_record FROM laptimes AS T1 INNER JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.name = 'Austrian Grand Prix'
SELECT T2.time FROM circuits AS T1 INNER JOIN laptimes AS T2 ON T1.circuitid = T2.circuitid WHERE T1.country = 'Italy' ORDER BY T2.time ASC LIMIT 1
SELECT r.name FROM races r JOIN circuits c ON r.circuitid = c.circuitid WHERE c.name = 'Austrian Grand Prix Circuit' ORDER BY MIN(l.milliseconds) LIMIT 1; 
SELECT SUM(T2.duration) FROM races AS T1 INNER JOIN pitStops AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Austrian Grand Prix' AND T2.driverId IN ( SELECT driverId FROM results WHERE raceId = T1.raceId ORDER BY time LIMIT 1 )
SELECT T1.lat, T1.lng FROM circuits AS T1 JOIN qualifying AS T2 ON T1.circuitid = T2.circuitid WHERE T2.q1 = '1:29.488'
SELECT AVG(milliseconds) FROM pitStops WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')
SELECT AVG(T1.milliseconds) ,  T2.name FROM laptimes AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.country = 'Italy' GROUP BY T2.name
SELECT player_api_id FROM Player_Attributes ORDER BY overall_rating DESC LIMIT 1
SELECT MAX(height), player_name FROM Player ORDER BY height DESC LIMIT 1; 
SELECT preferred_foot FROM Player_Attributes WHERE potential = ( SELECT MIN(potential) FROM Player_Attributes )
SELECT COUNT(*) FROM Player_Attributes WHERE overall_rating BETWEEN 60 AND 65 AND defensive_work_rate = 'Low'
SELECT player_api_id FROM Player_Attributes GROUP BY player_api_id ORDER BY SUM(crossing) DESC LIMIT 5
SELECT T2.name FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.season = '2015/2016' GROUP BY T2.name ORDER BY SUM(T1.home_team_goal + T1.away_team_goal) DESC LIMIT 1
SELECT T1.team_long_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id WHERE T2.season = '2015/2016' AND T2.home_team_goal < T2.away_team_goal GROUP BY T1.team_long_name ORDER BY COUNT(*) ASC LIMIT 1; 
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.penalties DESC LIMIT 10
SELECT T2.team_long_name FROM `Match` AS T1 INNER JOIN Team AS T2 ON T1.away_team_api_id = T2.team_api_id WHERE T1.season = '2009/2010' AND T1.away_team_goal > T1.home_team_goal GROUP BY T2.team_long_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.team_long_name, T2.buildUpPlaySpeed FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id ORDER BY T2.buildUpPlaySpeed DESC LIMIT 4; 
SELECT l.name FROM League l JOIN Match m ON l.id = m.league_id WHERE m.season = '2015/2016' GROUP BY l.name ORDER BY SUM(CASE WHEN m.home_team_goal = m.away_team_goal THEN 1 ELSE 0 END) DESC LIMIT 1; 
SELECT TIMESTAMPDIFF(YEAR, T1.birthday, CURRENT_DATE) AS player_age FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.sprint_speed >= 97 AND YEAR(T2.date) BETWEEN 2013 AND 2015; 
SELECT l.name, COUNT(m.id) AS match_count FROM League l JOIN Match m ON l.id = m.league_id GROUP BY l.name ORDER BY match_count DESC LIMIT 1; 
SELECT AVG(height) FROM Player WHERE birthday BETWEEN '1990-01-01 00:00:00' AND '1996-01-01 00:00:00'
SELECT player_api_id FROM Player_Attributes WHERE date LIKE '2010%' GROUP BY player_api_id ORDER BY AVG(overall_rating) DESC LIMIT 1
SELECT DISTINCT team_fifa_api_id FROM Team_Attributes WHERE buildUpPlaySpeed > 50 AND buildUpPlaySpeed < 60; 
SELECT T.team_long_name  FROM Team AS T  JOIN Team_Attributes AS TA ON T.team_api_id = TA.team_api_id  WHERE strftime('%Y', TA.date) = '2012'  AND TA.buildUpPlayPassing > (SELECT AVG(buildUpPlayPassing) FROM Team_Attributes WHERE strftime('%Y', date) = '2012') ORDER BY TA.buildUpPlayPassing DESC; 
SELECT CAST(SUM(CASE WHEN T2.preferred_foot = 'left' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.player_fifa_api_id) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE STRFTIME('%Y', T1.birthday) BETWEEN '1987' AND '1992'
SELECT T1.name FROM League AS T1 INNER JOIN Match AS T2 ON T1.id = T2.league_id GROUP BY T1.id ORDER BY SUM(T2.home_team_goal + T2.away_team_goal) ASC LIMIT 5
SELECT AVG(T2.long_shots) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Ahmed Samir Farag'
SELECT P.player_name FROM Player AS P JOIN Player_Attributes AS PA ON P.player_api_id = PA.player_api_id WHERE P.height > 180 GROUP BY P.player_name ORDER BY AVG(PA.heading_accuracy) DESC LIMIT 10
SELECT T2.team_long_name FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlayDribblingClass = 'Normal' AND T1.date BETWEEN '2014-01-01 00:00:00' AND '2014-12-31 00:00:00' GROUP BY T2.team_long_name HAVING AVG(T1.chanceCreationPassing) > T1.chanceCreationPassing ORDER BY T1.chanceCreationPassing DESC
SELECT T2.name FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.season = '2009/2010' GROUP BY T2.name HAVING AVG(T1.home_team_goal) > AVG(T1.away_team_goal)
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers'
SELECT player_name FROM Player WHERE SUBSTR(birthday, 1, 7) = '1970-10'; 
SELECT DISTINCT attacking_work_rate FROM Player_Attributes WHERE player_api_id IN (SELECT player_api_id FROM Player WHERE player_name = 'Franco Zennaro')
SELECT T2.buildUpPlayPositioningClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'ADO Den Haag' AND T2.date LIKE '%2016%'; 
SELECT T.heading_accuracy FROM Player AS P JOIN Player_Attributes AS T ON P.player_api_id = T.player_api_id WHERE P.player_name = 'Francois Affolter' AND T.date = '2014-09-18 00:00:00' 
SELECT AVG(overall_rating) FROM Player_Attributes WHERE strftime('%Y', date) = '2011' AND player_name = 'Gabriel Tamas'
SELECT COUNT(*) FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.season = '2015/2016' AND T2.name = 'Scotland Premier League'
SELECT preferred_foot FROM Player ORDER BY birthday DESC LIMIT 1; 
SELECT Player.player_name, Player_Attributes.potential FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id ORDER BY Player_Attributes.potential DESC; 
SELECT COUNT(*) FROM Player AS P JOIN Player_Attributes AS PA ON P.player_api_id = PA.player_api_id WHERE P.weight < 130 AND PA.preferred_foot = 'left' AND PA.attacking_work_rate = 'high'; 
SELECT T.team_short_name FROM Team AS T JOIN Team_Attributes AS TA ON T.team_api_id = TA.team_api_id WHERE TA.chanceCreationPassingClass = 'Risky'
SELECT T.defensive_work_rate FROM Player AS P JOIN Player_Attributes AS PA ON P.player_api_id = PA.player_api_id WHERE P.player_name = 'David Wilson' AND PA.date = (SELECT MAX(date) FROM Player_Attributes WHERE player_api_id = P.player_api_id)
SELECT T1.birthday FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.overall_rating DESC LIMIT 1
SELECT T1.name FROM League AS T1 INNER JOIN Country AS T2 ON T1.country_id = T2.id WHERE T2.name = 'Netherlands'
SELECT AVG(T1.home_team_goal) FROM Match AS T1 INNER JOIN Country AS T2 ON T1.country_id = T2.id WHERE T2.name = 'Poland' AND T1.season = '2010/2011'
SELECT P.player_name, AVG(PA.finishing) AS avg_finishing_rate FROM Player AS P JOIN Player_Attributes AS PA ON P.player_api_id = PA.player_api_id WHERE P.height = (     SELECT MAX(height)     FROM Player ) OR P.height = (     SELECT MIN(height)     FROM Player ) GROUP BY P.player_name ORDER BY avg_finishing_rate DESC LIMIT 1; 
SELECT player_name FROM Player WHERE height > 180;
SELECT COUNT(*) FROM Player WHERE strftime('%Y', birthday) > '1990'
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Adam%' AND weight > 170
SELECT DISTINCT T2.player_name FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.overall_rating > 80 AND strftime('%Y', T1.date) BETWEEN '2008' AND '2010'
SELECT potential FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Doran') ORDER BY date DESC LIMIT 1; 
SELECT DISTINCT Player.player_name FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE Player_Attributes.preferred_foot = 'left'
SELECT T.team_long_name FROM Team AS T JOIN Team_Attributes AS TA ON T.team_api_id = TA.team_api_id WHERE TA.buildUpPlaySpeedClass = 'Fast' 
SELECT T2.buildUpPlayPassingClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_short_name = 'CLB' ORDER BY T2.date DESC LIMIT 1
SELECT T.team_short_name FROM Team AS T JOIN Team_Attributes AS TA ON T.team_api_id = TA.team_api_id WHERE TA.buildUpPlayPassing > 70 GROUP BY T.team_short_name ORDER BY SUM(TA.buildUpPlayPassing) DESC
SELECT AVG(t2.overall_rating) FROM Player AS t1 INNER JOIN Player_Attributes AS t2 ON t1.player_api_id = t2.player_api_id WHERE t1.height > 170 AND strftime('%Y', t2.date) BETWEEN '2010' AND '2015'
SELECT player_name FROM Player ORDER BY height ASC LIMIT 1
SELECT T1.name FROM Country AS T1 INNER JOIN League AS T2 ON T1.id = T2.country_id WHERE T2.name = 'Italy Serie A'
SELECT T.team_short_name FROM Team AS T JOIN Team_Attributes AS TA ON T.team_fifa_api_id = TA.team_fifa_api_id WHERE TA.buildUpPlaySpeed = 31 AND TA.buildUpPlayDribbling = 53 AND TA.buildUpPlayPassing = 32; 
SELECT AVG(T2.overall_rating) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Aaron Doran'
SELECT COUNT(*) FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T2.name = 'Germany 1. Bundesliga' AND strftime('%Y-%m', T1.date) BETWEEN '2008-08' AND '2008-10'; 
SELECT T1.team_short_name FROM Team AS T1 INNER JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id WHERE T2.home_team_goal = 10
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.balance = ( SELECT MAX(balance) FROM Player_Attributes ) AND T2.potential = 61
SELECT (SUM(CASE WHEN T1.player_name = 'Abdou Diallo' THEN T2.ball_control ELSE 0 END) / COUNT(CASE WHEN T1.player_name = 'Abdou Diallo' THEN T2.id ELSE NULL END)) - (SUM(CASE WHEN T1.player_name = 'Aaron Appindangoye' THEN T2.ball_control ELSE 0 END) / COUNT(CASE WHEN T1.player_name = 'Aaron Appindangoye' THEN T2.id ELSE NULL END)) AS diff_avg_ball_control FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id; 
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN'; 
SELECT player_name FROM Player WHERE player_name IN ('Aaron Lennon', 'Abdelaziz Barrada') ORDER BY birthday ASC LIMIT 1
SELECT player_name FROM Player ORDER BY height DESC LIMIT 1
SELECT COUNT(DISTINCT player_api_id) FROM Player_Attributes WHERE preferred_foot = 'left' AND attacking_work_rate = 'low'
SELECT T2.name FROM League AS T1 INNER JOIN Country AS T2 ON T1.country_id = T2.id WHERE T1.name = 'Belgium Jupiler League'
SELECT name FROM League WHERE country_id IN (SELECT id FROM Country WHERE name = 'Germany')
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.overall_rating DESC LIMIT 1
SELECT COUNT(DISTINCT T1.player_api_id) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE strftime('%Y', T1.birthday) < '1986' AND T2.defensive_work_rate = 'High' 
SELECT P.player_name, AVG(PA.crossing) AS avg_crossing FROM Player AS P JOIN Player_Attributes AS PA ON P.player_api_id = PA.player_api_id WHERE P.player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone') GROUP BY P.player_name ORDER BY avg_crossing DESC LIMIT 1; 
SELECT T.heading_accuracy FROM Player AS P JOIN Player_Attributes AS T ON P.player_api_id = T.player_api_id WHERE P.player_name = 'Ariel Borysiuk' ORDER BY T.date DESC LIMIT 1
SELECT COUNT(*) FROM Player AS P JOIN Player_Attributes AS PA ON P.player_api_id = PA.player_api_id WHERE P.height > 180 AND PA.volleys > 70; 
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.volleys > 70 AND T2.dribbling > 70
SELECT COUNT(*) FROM Match AS T1 INNER JOIN Country AS T2 ON T1.country_id = T2.id WHERE T1.season = '2008/2009' AND T2.name = 'Belgium'
SELECT MAX(long_passing) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.birthday ASC LIMIT 1
SELECT COUNT(*) FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T2.name = 'Belgium Jupiler League' AND SUBSTR(T1.date, 1, 7) = '2009-04'
SELECT T2.name FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.season = '2008/2009' GROUP BY T2.name ORDER BY COUNT(T1.match_api_id) DESC LIMIT 1
SELECT AVG(T2.overall_rating) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE strftime('%Y', T1.birthday) < '1986'
SELECT ((AVG(CASE WHEN T1.player_name = 'Ariel Borysiuk' THEN T2.overall_rating ELSE NULL END) - AVG(CASE WHEN T1.player_name = 'Paulin Puel' THEN T2.overall_rating ELSE NULL END)) / AVG(CASE WHEN T1.player_name = 'Paulin Puel' THEN T2.overall_rating ELSE NULL END)) * 100 AS PercentageDifference FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id
SELECT AVG(T2.buildUpPlaySpeed) FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Heart of Midlothian'
SELECT AVG(T1.overall_rating) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Pietro Marino'
SELECT SUM(T1.crossing) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Aaron Lennox'
SELECT T2.chanceCreationPassing, T2.chanceCreationPassingClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Ajax' ORDER BY T2.chanceCreationPassing DESC LIMIT 1
SELECT T2.preferred_foot FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Abdou Diallo' GROUP BY T2.preferred_foot
SELECT MAX(T1.overall_rating) AS Highest_Overall_Rating FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Dorlan Pabon'; 
SELECT AVG(away_team_goal)  FROM Match  JOIN Team ON Match.away_team_api_id = Team.team_api_id  WHERE Team.team_long_name = 'Parma' AND Match.country_id = (SELECT id FROM Country WHERE name = 'Italy') 
SELECT P.player_name FROM Player AS P JOIN Player_Attributes AS PA ON P.player_api_id = PA.player_api_id WHERE PA.overall_rating = 77 AND PA.date LIKE '2016-06-23%' ORDER BY P.birthday ASC LIMIT 1; 
SELECT AVG(overall_rating) AS overall_rating FROM Player_Attributes JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id WHERE Player.player_name = 'Aaron Mooy' AND date LIKE '2016-02-04%' 
SELECT potential FROM Player_Attributes WHERE player_api_id IN (SELECT player_api_id FROM Player WHERE player_name = 'Francesco Parravicini') AND date = '2010-08-30 00:00:00'
SELECT attacking_work_rate FROM Player_Attributes AS PA JOIN Player AS P ON PA.player_api_id = P.player_api_id WHERE P.player_name = 'Francesco Migliore' AND date LIKE '2015-05-01%'
SELECT T2.defensive_work_rate FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Kevin Berigaud' AND T2.date = '2013-02-22 00:00:00'; 
SELECT T1.date FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Kevin Constant' ORDER BY T1.crossing DESC LIMIT 1; 
SELECT T2.buildUpPlaySpeedClass  FROM Team AS T1  JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id  WHERE T1.team_long_name = 'Willem II' AND T2.date = '2011-02-22'; 
SELECT T1.buildUpPlayDribblingClass FROM Team_Attributes AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id WHERE T2.date = '2015-09-10 00:00:00' AND T2.home_team_short_name = 'LEI'; 
SELECT T2.buildUpPlayPassingClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'FC Lorient' AND T2.date LIKE '2010-02-22%' 
SELECT T1.chance_creation_passing_class FROM Team_Attributes AS T1 INNER JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id WHERE T2.date = '2013-09-20 00:00:00' AND T2.home_team_long_name = 'PEC Zwolle'; 
SELECT T2.chance_creation_crossing_class FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Hull City' AND T2.date = '2010-02-22 00:00:00'; 
SELECT T1.defenceAggressionClass FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_long_name = 'Hannover 96' AND T1.date LIKE '2015-09-10%' 
SELECT AVG(T2.overall_rating) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Marko Arnautovic' AND SUBSTR(T2.date, 1, 10) BETWEEN '2007-02-22' AND '2016-04-21'
SELECT CAST((T1.overall_rating - T2.overall_rating) AS REAL) * 100 / T1.overall_rating FROM Player_Attributes AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = 505942 AND T2.player_api_id = 155782 WHERE T1.date = '2013-07-12' AND T2.date = '2013-07-12'
SELECT player_name FROM Player ORDER BY height DESC LIMIT 1
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10
SELECT player_name FROM Player WHERE datetime('now','localtime') - datetime(birthday) > 34 * 365
SELECT SUM(home_team_goal) AS total_home_goals FROM Match JOIN Player ON Match.home_player_1 = Player.player_api_id OR Match.home_player_2 = Player.player_api_id OR Match.home_player_3 = Player.player_api_id OR Match.home_player_4 = Player.player_api_id OR Match.home_player_5 = Player.player_api_id OR Match.home_player_6 = Player.player_api_id OR Match.home_player_7 = Player.player_api_id OR Match.home_player_8 = Player.player_api_id OR Match.home_player_9 = Player.player_api_id OR Match.home_player_10 = Player.player_api_id OR Match.home_player_11 = Player.player_api_id WHERE Player.player_name = 'Aaron Lennon'; 
SELECT SUM(T1.away_team_goal) FROM Match AS T1 JOIN Player AS P ON T1.away_player_1 = P.player_api_id WHERE P.player_name IN ('Daan Smith', 'Filipe Ferreira')
SELECT SUM(T2.home_team_goal) FROM Player AS T1 INNER JOIN Match AS T2 ON T1.player_api_id = T2.home_player_1 WHERE strftime('%Y', 'now') - strftime('%Y', T1.birthday) < 31
SELECT T2.player_name FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T1.overall_rating DESC LIMIT 1 
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.potential DESC LIMIT 1
SELECT DISTINCT P.player_name FROM Player AS P JOIN Player_Attributes AS PA ON P.player_api_id = PA.player_api_id WHERE PA.attacking_work_rate = 'High' 
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.finishing = 1 ORDER BY julianday('now') - julianday(p.birthday) DESC LIMIT 1; 
SELECT DISTINCT T1.player_name FROM Player AS T1 JOIN Country AS T2 ON T1.nationality = T2.id WHERE T2.name = 'Belgium'
SELECT T3.country FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id INNER JOIN Country AS T3 ON T2.nationality = T3.id WHERE T1.vision > 89
SELECT T2.name FROM Player AS T1 INNER JOIN Country AS T2 ON T1.player_api_id = T2.id GROUP BY T2.id ORDER BY AVG(T1.weight) DESC LIMIT 1
SELECT T1.team_long_name FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeedClass = 'Slow'
SELECT T.team_short_name FROM Team AS T JOIN Team_Attributes AS TA ON T.team_api_id = TA.team_api_id WHERE TA.chanceCreationPassingClass = 'Safe'; 
SELECT AVG(T2.height) FROM Player AS T1 INNER JOIN Team AS T2 ON T1.player_api_id IN (T2.home_player_1, T2.home_player_2, T2.home_player_3, T2.home_player_4, T2.home_player_5, T2.home_player_6, T2.home_player_7, T2.home_player_8, T2.home_player_9, T2.home_player_10, T2.home_player_11, T2.away_player_1, T2.away_player_2, T2.away_player_3, T2.away_player_4, T2.away_player_5, T2.away_player_6, T2.away_player_7, T2.away_player_8, T2.away_player_9, T2.away_player_10, T2.away_player_11) WHERE T2.team_api_id IN ( SELECT team_api_id FROM Team WHERE team_long_name LIKE '%Italy%' )
SELECT player_name FROM Player WHERE height > 180 ORDER BY player_name LIMIT 3
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND birthday > '1990'
SELECT SUM(CASE WHEN id = 6 THEN jumping ELSE 0 END) - SUM(CASE WHEN id = 23 THEN jumping ELSE 0 END) AS difference FROM Player_Attributes
SELECT player_api_id FROM Player_Attributes WHERE preferred_foot = 'right' ORDER BY potential ASC LIMIT 5
SELECT COUNT(DISTINCT player_api_id) FROM Player_Attributes WHERE crossing = ( SELECT MAX(crossing) FROM Player_Attributes ) AND preferred_foot = 'left'
SELECT CAST(SUM(CASE WHEN T1.stamina > 80 AND T1.strength > 80 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Player_Attributes AS T1 
SELECT T1.name FROM Country AS T1 INNER JOIN League AS T2 ON T1.id = T2.country_id WHERE T2.name = 'Poland Ekstraklasa'
SELECT T1.home_team_goal, T1.away_team_goal FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.date LIKE '2008-09-24%' AND T2.name = 'Belgium Jupiler League'
SELECT T1.sprint_speed, T1.agility, T1.acceleration FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Alexis Blin'; 
SELECT buildUpPlaySpeedClass FROM Team_Attributes WHERE team_api_id = (SELECT team_api_id FROM Team WHERE team_long_name = 'KSV Cercle Brugge') ORDER BY date DESC LIMIT 1; 
SELECT COUNT(*) FROM Match WHERE season = '2015/2016' AND league_id = (SELECT id FROM League WHERE name = 'Italy Serie A')
SELECT MAX(home_team_goal) AS Highest_Home_Team_Score FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Netherlands Eredivisie') 
