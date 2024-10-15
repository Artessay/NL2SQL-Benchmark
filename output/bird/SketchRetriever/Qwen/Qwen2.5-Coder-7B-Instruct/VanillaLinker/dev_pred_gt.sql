SELECT MAX(`Percent (%) Eligible Free (K-12)`) AS HighestEligibleFreeRate FROM frpm WHERE `County Name` = 'Alameda' AND `School Type` = 'K-12 Schools (Public)';	california_schools
SELECT `Percent (%) Eligible Free (Ages 5-17)` AS Rate FROM frpm WHERE `Age` BETWEEN 5 AND 17 AND `School Type` LIKE '%Continuation%' ORDER BY Rate ASC LIMIT 3;	california_schools
SELECT DISTINCT T2.Zip FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Charter School (Y/N)` = 1 AND T2.County = 'Fresno' AND T2.District = 'Fresno County Office of Education'	california_schools
SELECT T2.MailStreet, T2.MailCity, T2.MailState, T2.MailZip FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T1.FRPM_Count_K_12 DESC LIMIT 1;	california_schools
SELECT s.Phone FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.`Charter School (Y/N)` = 1 AND f.Opened > '2000-01-01';	california_schools
SELECT COUNT(DISTINCT f.School)  FROM frpm f  JOIN satscores s ON f.CDSCode = s.cds  WHERE s.AvgScrMath > 400 AND f.Virtual = 'F';	california_schools
SELECT s.School, s.Magnet FROM schools s JOIN satscores st ON s.CDSCode = st.cds WHERE st.NumTstTakr > 500 AND (s.Magnet = 1 OR s.Educational_Option_Type LIKE '%Magnet%')	california_schools
SELECT s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.NumGE1500 > 0 ORDER BY ss.NumGE1500 DESC LIMIT 1;	california_schools
SELECT s.School, f.[FRPM Count (K-12)], COUNT(st.NumTstTakr) AS NumberOfSATTestTakers FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode JOIN satscores st ON f.CDSCode = st.cds WHERE f.[FRPM Count (K-12)] = (     SELECT MAX([FRPM Count (K-12)])     FROM frpm ) GROUP BY s.School, f.[FRPM Count (K-12)] ORDER BY f.[FRPM Count (K-12)] DESC;	california_schools
SELECT COUNT(*) FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrMath > 560 AND T1.CharterFundingType = 'Directly funded'	california_schools
SELECT s.School, f.[FRPM Count (Ages 5-17)] FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode JOIN satscores st ON s.CDSCode = st.cds WHERE st.rtype = 'S' GROUP BY s.School, f.[FRPM Count (Ages 5-17)] ORDER BY AVG(st.AvgScrRead) DESC LIMIT 1;	california_schools
SELECT DISTINCT School_Code FROM frpm GROUP BY School_Code HAVING SUM(Enrollment (K-12)) + SUM(Enrollment (Ages 5-17)) > 500;	california_schools
SELECT MAX(f.`Percent (%) Eligible Free (Ages 5-17)`) AS HighestEligibleFreeRate FROM frpm f JOIN satscores s ON f.CDSCode = s.cds WHERE s.NumGE1500 / s.NumTstTakr > 0.3;	california_schools
SELECT s.Phone FROM schools s JOIN (  SELECT cds, CAST(NumGE1500 AS REAL) / NumTstTakr AS ExcellenceRate  FROM satscores ) ss ON s.CDSCode = ss.cds ORDER BY ss.ExcellenceRate DESC LIMIT 3;	california_schools
SELECT s.NCESDist AS NCES_School_Identification_Number, SUM(f.Enrollment_Ages_5_17) AS Total_Enrollment_Ages_5_17 FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode GROUP BY s.NCESDist ORDER BY Total_Enrollment_Ages_5_17 DESC LIMIT 5;	california_schools
SELECT s.District, AVG(ss.AvgScrRead) AS AvgReadingScore FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode JOIN satscores ss ON f.CDSCode = ss.cds WHERE s.StatusType = 'Active' GROUP BY s.District ORDER BY AvgReadingScore DESC LIMIT 1	california_schools
SELECT COUNT(*) FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.County = 'Alameda' AND T2.NumTstTakr < 100	california_schools
SELECT s.School, AVG(sw.AvgScrWrite) AS AvgWritingScore, s.CharterNum FROM frpm f JOIN satscores sw ON f.CDSCode = sw.cds JOIN schools s ON f.CDSCode = s.CDSCode WHERE sw.AvgScrWrite > 499 AND s.CharterNum IS NOT NULL GROUP BY s.School, s.CharterNum ORDER BY AvgWritingScore DESC;	california_schools
SELECT COUNT(s.CDSCode) FROM frpm f JOIN satscores s ON f.CDSCode = s.cds JOIN schools sc ON f.CDSCode = sc.CDSCode WHERE sc.City = 'Fresno' AND f.CharterFundingType = 'Directly funded' AND s.NumTstTakr <= 250;	california_schools
SELECT s.Phone FROM schools s JOIN (  SELECT cds, AVG(AvgScrMath) AS AvgMathScore  FROM satscores  GROUP BY cds ) sub ON s.CDSCode = sub.cds ORDER BY sub.AvgMathScore DESC LIMIT 1;	california_schools
SELECT COUNT(*) FROM frpm WHERE County = 'Amador' AND Low_Grade = '9' AND High_Grade = '12';	california_schools
SELECT COUNT(*) FROM frpm WHERE `County Name` = 'Los Angeles' AND `Free Meal Count (K-12)` > 500 AND `Free Meal Count (K-12)` < 700	california_schools
SELECT s.School, st.NumTstTakr FROM schools s JOIN satscores st ON s.CDSCode = st.cds WHERE s.County = 'Contra Costa' ORDER BY st.NumTstTakr DESC LIMIT 1;	california_schools
SELECT s.School, s.Street, s.City, s.Zip, s.State, f.[Enrollment (K-12)] - f.[Enrollment (Ages 5-17)] AS EnrollmentDifference FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE ABS(f.[Enrollment (K-12)] - f.[Enrollment (Ages 5-17)]) > 30;	california_schools
SELECT s.School FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode JOIN satscores st ON s.CDSCode = st.cds WHERE f.[Percent (%) Eligible Free (K-12)] > 0.1 AND st.NumGE1500 >= 1;	california_schools
SELECT s.School, s.FundingType FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`County Name` = 'Riverside' GROUP BY s.School, s.FundingType HAVING AVG(f.[AvgScrMath]) > 400;	california_schools
SELECT s.School, s.Street, s.City, s.State, s.Zip FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.County = 'Monterey' AND f.`School Type` = 'High Schools (Public)' AND f.`FRPM Count (Ages 15-17)` > 800;	california_schools
SELECT s.School AS School_Name, AVG(sw.AvgScrWrite) AS Avg_Writing_Score, s.Phone AS Communication_Number FROM frpm f JOIN satscores sw ON f.CDSCode = sw.cds JOIN schools s ON f.CDSCode = s.CDSCode WHERE (f.OpenDate > '1991-12-31' OR f.ClosedDate < '2000-01-01') GROUP BY s.School, s.Phone;	california_schools
SELECT s.School, s.DOCType, f.[Enrollment (K-12)] - f.[Enrollment (Ages 5-17)] AS Diff FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.FundingType = 'Directly funded' GROUP BY s.School, s.DOCType, f.[Enrollment (K-12)], f.[Enrollment (Ages 5-17)] HAVING ABS(f.[Enrollment (K-12)] - f.[Enrollment (Ages 5-17)]) > (     SELECT AVG(ABS([Enrollment (K-12)] - [Enrollment (Ages 5-17)]))     FROM frpm     JOIN schools ON frpm.CDSCode = schools.CDSCode     WHERE schools.FundingType = 'Directly funded' ) ORDER BY Diff DESC;	california_schools
SELECT s.OpenDate FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.LowGrade = 'K' AND f.HighGrade = '12' ORDER BY f.Enrollment DESC LIMIT 1;	california_schools
SELECT T2.City, SUM(T1.`Enrollment (K-12)`) AS TotalEnrollment FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.LowGrade = 'K' AND T1.HighGrade = '12' GROUP BY T2.City ORDER BY TotalEnrollment ASC LIMIT 5;	california_schools
SELECT      `School Name`,      `Percent (%) Eligible Free (K-12)` AS EligibleFreeRate FROM      `frpm` WHERE      `Low Grade` = 'K' AND `High Grade` = '12' ORDER BY      `Enrollment (K-12)` DESC LIMIT 10, 2;	california_schools
SELECT      frpm.School Name AS School,     frpm.`FRPM Count (K-12)` / frpm.`Enrollment (K-12)` AS Eligible Free or Reduced Price Meal Rate FROM      frpm WHERE      frpm.`Ownership Code` = 66 AND frpm.Low Grade = 'K' AND frpm.High Grade = '12' ORDER BY      frpm.`FRPM Count (K-12)` DESC LIMIT 5;	california_schools
SELECT s.Website, s.School  FROM frpm f  JOIN schools s ON f.CDSCode = s.CDSCode  WHERE f.Free_Meal_Count_Ages_5_17 BETWEEN 1900 AND 2000;	california_schools
SELECT AVG(`Percent (%) Eligible Free (Ages 5-17)`) AS FreeRate FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.District LIKE '%Kacey Gibson%' AND `Enrollment (Ages 5-17)` > 0;	california_schools
SELECT T2.AdmEmail1  FROM frpm AS T1  INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode  WHERE T1.`Charter School (Y/N)` = 1  ORDER BY T1.`Enrollment (K-12)` ASC  LIMIT 1;	california_schools
SELECT s.AdmFName1, s.AdmLName1, s.AdmFName2, s.AdmLName2, s.AdmFName3, s.AdmLName3 FROM schools s JOIN (     SELECT cds     FROM satscores     WHERE NumGE1500 = (         SELECT MAX(NumGE1500)         FROM satscores     ) ) ss ON s.CDSCode = ss.cds;	california_schools
SELECT s.Street, s.City, s.Zip, s.State FROM schools s JOIN (  SELECT cds, CAST(NumGE1500 AS REAL) / NumTstTakr AS ExcellenceRate  FROM satscores ) ss ON s.CDSCode = ss.cds ORDER BY ss.ExcellenceRate ASC LIMIT 1;	california_schools
SELECT T2.Website FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.County = 'Los Angeles' AND T1.NumTstTakr BETWEEN 2000 AND 3000	california_schools
SELECT AVG(s.NumTstTakr) AS AverageTestTakers FROM frpm f JOIN satscores s ON f.CDSCode = s.cds JOIN schools sch ON f.CDSCode = sch.CDSCode WHERE sch.City = 'Fresno' AND YEAR(sch.OpenDate) = 1980;	california_schools
SELECT s.Phone FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.District = 'Fresno Unified' GROUP BY f.School Name, s.Phone ORDER BY AVG(f.AvgScrRead) ASC LIMIT 1;	california_schools
SELECT s.School, s.County, AVG(ss.AvgScrRead) AS AvgReadingScore FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode JOIN satscores ss ON f.CDSCode = ss.cds WHERE s.Virtual = 'F' GROUP BY s.County, s.School ORDER BY s.County, AvgReadingScore DESC LIMIT 5;	california_schools
SELECT s.School, fr.Educational_Option_Type FROM frpm fr JOIN schools s ON fr.CDSCode = s.CDSCode JOIN (     SELECT cds, AVG(AvgScrMath) AS AvgMathScore     FROM satscores     GROUP BY cds ) sub ON fr.CDSCode = sub.cds ORDER BY sub.AvgMathScore DESC LIMIT 1;	california_schools
SELECT AVG(AvgScrMath + AvgScrRead + AvgScrWrite) AS AvgTotalScore, B.County FROM satscores A JOIN schools B ON A.cds = B.CDSCode GROUP BY B.County ORDER BY AVG(AvgScrMath + AvgScrRead + AvgScrWrite) ASC LIMIT 1;	california_schools
SELECT AVG(s.AvgScrWrite), s.City FROM satscores AS sa JOIN frpm AS f ON sa.cds = f.CDSCode JOIN schools AS s ON f.CDSCode = s.CDSCode WHERE sa.NumGE1500 >= 1500 GROUP BY s.School, s.City ORDER BY COUNT(sa.NumGE1500) DESC LIMIT 1;	california_schools
SELECT T2.School, AVG(T1.AvgScrWrite) AS AvgWritingScore FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.AdmFName1 = 'Ricci' AND T2.AdmLName1 = 'Ulrich' GROUP BY T2.School;	california_schools
SELECT T2.School, SUM(T1.`Enrollment (K-12)`) AS TotalEnrollment FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.DOC = 31 AND T1.LowGrade = 'K' AND T1.HighGrade = '12' GROUP BY T2.School ORDER BY TotalEnrollment DESC;	california_schools
SELECT COUNT(*) / 12 AS "Monthly Average" FROM schools WHERE OpenDate LIKE '1980%' AND DOC = 52;	california_schools
SELECT SUM(CASE WHEN T2.DOC = 54 THEN 1 ELSE 0 END) / SUM(CASE WHEN T2.DOC = 52 THEN 1 ELSE 0 END) AS Ratio FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.County = 'Orange';	california_schools
SELECT T2.County, T2.School, T2.ClosedDate FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.StatusType = 'Closed' GROUP BY T2.County, T2.School, T2.ClosedDate ORDER BY COUNT(T2.School) DESC LIMIT 1;	california_schools
SELECT s.Street, s.School  FROM schools s  JOIN satscores sa ON s.CDSCode = sa.cds  ORDER BY sa.AvgScrMath DESC  LIMIT 6, 1;	california_schools
SELECT s.MailStreet, s.School FROM schools AS s JOIN satscores AS ss ON s.CDSCode = ss.cds ORDER BY ss.AvgScrRead ASC LIMIT 1	california_schools
SELECT COUNT(s.CDSCode) FROM frpm f JOIN satscores s ON f.CDSCode = s.cds JOIN schools sc ON f.CDSCode = sc.CDSCode WHERE s.AvgScrRead + s.AvgScrMath + s.AvgScrWrite >= 1500 AND sc.MailCity = 'Lakeport';	california_schools
SELECT SUM(s.NumTstTakr) FROM satscores AS s JOIN schools AS sc ON s.cds = sc.CDSCode WHERE sc.MailCity = 'Fresno'	california_schools
SELECT T2.School, T2.MailZip FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.AdmFName1 = 'Avetik' AND T2.AdmLName1 = 'Atoian'	california_schools
SELECT CAST(SUM(CASE WHEN T2.County = 'Colusa' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T2.County = 'Humboldt' THEN 1 ELSE 0 END) AS Ratio FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.MailState = 'CA';	california_schools
SELECT COUNT(*) FROM frpm INNER JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.City = 'San Joaquin' AND schools.State = 'CA' AND schools.StatusType = 'Active';	california_schools
SELECT s.Phone, s.Ext FROM schools s JOIN (  SELECT ss.cds, AVG(ss.AvgScrWrite) AS avg_write_score  FROM satscores ss  GROUP BY ss.cds  ORDER BY avg_write_score DESC  LIMIT 332, 1 ) sub ON s.CDSCode = sub.cds;	california_schools
SELECT s.Phone, s.Ext, s.School FROM schools s WHERE s.Zip = '95203-3704';	california_schools
SELECT s.Website FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.AdmFName1 IN ('Mike', 'Dante') AND s.AdmLName1 IN ('Larson', 'Alvarez')	california_schools
SELECT Website FROM schools WHERE Charter = 1 AND Virtual = 'P' AND County = 'San Joaquin'	california_schools
SELECT COUNT(*) FROM frpm INNER JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.City = 'Hickman' AND schools.DOC = 52 AND schools.Charter = 1;	california_schools
SELECT COUNT(*)  FROM frpm  JOIN schools ON frpm.CDSCode = schools.CDSCode  WHERE schools.County = 'Los Angeles' AND schools.Charter = 0 AND frpm.[Percent (%) Eligible Free (K-12)] < 0.18;	california_schools
SELECT s.School AS School_Name, s.City, a.AdmFName1, a.AdmLName1, a.AdmFName2, a.AdmLName2, a.AdmFName3, a.AdmLName3 FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode JOIN schools a ON f.CDSCode = a.CDSCode AND a.Charter = 1 AND a.CharterNum = '00D2';	california_schools
SELECT COUNT(*) FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.MailCity = 'Hickman' AND T2.CharterNum = '00D4';	california_schools
SELECT      SUM(CASE WHEN T2.FundingType = 'Locally Funded' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS PercentageLocallyFunded FROM      frpm AS T1 JOIN      schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE      T2.County = 'Santa Clara';	california_schools
SELECT COUNT(*)  FROM schools  WHERE FundingType = 'Directly Funded'  AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31'  AND County = 'Stanislaus';	california_schools
SELECT COUNT(*) AS Total_Closures FROM schools WHERE ClosedDate BETWEEN '1989-01-01' AND '1989-12-31' AND City = 'San Francisco';	california_schools
SELECT T2.County FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Year` BETWEEN '1980' AND '1989' AND T2.SOC = 11 GROUP BY T2.County ORDER BY COUNT(T1.CDSCode) DESC LIMIT 1	california_schools
SELECT DISTINCT T2.NCESDist FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.SOC = 31	california_schools
SELECT StatusType, COUNT(*) AS SchoolCount FROM schools WHERE County = 'Alpine' AND SchoolType = 'District Community Day School' GROUP BY StatusType;	california_schools
SELECT District Code FROM schools WHERE City = 'Fresno' AND Magnet = 0	california_schools
SELECT COUNT(`Enrollment (Ages 5-17)`) AS NumberOfStudents FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE `School Name` = 'State Special School' AND City = 'Fremont' AND `Academic Year` = '2014-2015';	california_schools
SELECT SUM(`Free Meal Count (Ages 5-17)`) AS Total_Free_Reduced_Price_Meal_Count FROM `frpm` JOIN `schools` ON `frpm`.`CDSCode` = `schools`.`CDSCode` WHERE `Age` BETWEEN 5 AND 17 AND `School Name` = 'Youth Authority School' AND `Mailing Street Address` = 'PO Box 1040';	california_schools
SELECT MIN(frpm.LowGrade) FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.EdOpsCode = 'SPECON' AND schools.NCESDist = '0613360';	california_schools
SELECT DISTINCT T2.Educational_Level_Name, T2.School FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.Breakfast_Provision = 'Breakfast Provision 2' AND T1.County_Code = '37'	california_schools
SELECT T2.City  FROM frpm AS T1  JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode  WHERE T1.School Level = 'High Schools (Public)'  AND T1.Lunch Provision = '2'  AND T1.Lowest Grade = '9'  AND T1.Highest Grade = '12'  AND T2.County = 'Merced';	california_schools
SELECT s.School, f.[Percent (%) Eligible FRPM (Ages 5-17)] FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.County = 'Los Angeles' AND f.LowGrade = 'K' AND f.HighGrade = '9';	california_schools
SELECT Low_Grade, High_Grade FROM frpm WHERE City = 'Adelanto' GROUP BY Low_Grade, High_Grade ORDER BY COUNT(*) DESC LIMIT 1	california_schools
SELECT County, COUNT(*) AS NumberOfSchools FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE City IN ('San Diego', 'Santa Barbara') AND Virtual = 'F' GROUP BY County ORDER BY NumberOfSchools DESC LIMIT 1;	california_schools
SELECT T1.School, T1.Latitude, T1.School_Type FROM schools AS T1 ORDER BY T1.Latitude DESC LIMIT 1;	california_schools
SELECT T1.City, T1.School, MIN(T1.Latitude) AS Lowest_Latitude, MIN(T1.Lowest_Grade) AS Lowest_Grade FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.State = 'CA' GROUP BY T1.City, T1.School ORDER BY Lowest_Latitude ASC LIMIT 1;	california_schools
SELECT GSoffered FROM schools ORDER BY ABS(Longitude) DESC LIMIT 1;	california_schools
SELECT COUNT(DISTINCT T1.City), COUNT(T1.School) FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.GSoffered LIKE '%K-8%' AND T1.Magnet = 1 AND T2.NSLP_Provision_Status = 'Multiple Provision Types' GROUP BY T1.City	california_schools
SELECT AdmFName1 AS FirstName, District  FROM schools  GROUP BY AdmFName1, District  ORDER BY COUNT(*) DESC  LIMIT 2;	california_schools
SELECT s.District Code, f.[Percent (%) Eligible Free (K-12)] FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.AdmFName1 = 'Alusine';	california_schools
SELECT T2.AdmLName1, T2.District, T2.County, T2.School FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.Charter_School_Number = 40	california_schools
SELECT AdmEmail1, AdmEmail2, AdmEmail3 FROM schools WHERE County = 'San Bernardino' AND City = 'San Bernardino City Unified' AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND (SOC = 62 OR DOC = 54);	california_schools
SELECT s.School, s.AdmEmail1 FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode JOIN satscores st ON f.CDSCode = st.cds WHERE st.NumGE1500 > 0 GROUP BY s.School, s.AdmEmail1 ORDER BY SUM(st.NumGE1500) DESC LIMIT 1;	california_schools
SELECT COUNT(DISTINCT T1.account_id)  FROM account AS T1  JOIN disp AS T2 ON T1.account_id = T2.account_id  JOIN card AS T3 ON T2.disp_id = T3.disp_id  JOIN district AS T4 ON T1.district_id = T4.district_id  WHERE T4.A3 LIKE '%East Bohemia%' AND T3.type = 'POPLATEK PO OBRATU';	financial
SELECT COUNT(DISTINCT T1.account_id)  FROM account AS T1  JOIN district AS T2 ON T1.district_id = T2.district_id  WHERE T2.A3 = 'Prague' AND T1.account_id IN (SELECT account_id FROM loan WHERE status = 'A');	financial
SELECT      AVG(A12) AS avg_unemp_1995,      AVG(A13) AS avg_unemp_1996,      CASE          WHEN AVG(A12) > AVG(A13) THEN '1995'         ELSE '1996'     END AS higher_unemp_year FROM      district;	financial
SELECT COUNT(district_id) FROM client WHERE gender = 'F' GROUP BY district_id HAVING AVG(A11) > 6000 AND AVG(A11) < 10000;	financial
SELECT COUNT(client_id)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE gender = 'M' AND A3 LIKE '%North Bohemia%' AND A11 > 8000;	financial
SELECT MIN(A11) AS min_salary, MAX(A11) AS max_salary, max_salary - min_salary AS gap FROM (  SELECT AVG(T3.amount) AS A11, T1.account_id  FROM client AS T1  JOIN disp AS T2 ON T1.client_id = T2.client_id  JOIN trans AS T3 ON T2.account_id = T3.account_id  WHERE T1.gender = 'F'  GROUP BY T1.account_id ) AS subquery;	financial
SELECT T3.account_id FROM (     SELECT T2.client_id, AVG(T1.amount) AS avg_salary     FROM trans AS T1     JOIN disp AS T2 ON T1.account_id = T2.account_id     GROUP BY T2.client_id ) AS T3 JOIN client AS T4 ON T3.client_id = T4.client_id ORDER BY T4.birth_date DESC, T3.avg_salary DESC LIMIT 1;	financial
SELECT COUNT(DISTINCT d.client_id) AS owner_count FROM disp d JOIN account a ON d.account_id = a.account_id WHERE d.type = 'OWNER' AND a.frequency = 'POPLATEK TYDNE';	financial
SELECT d.client_id FROM disp d JOIN account a ON d.account_id = a.account_id WHERE d.type = 'DISPONENT' AND EXISTS (     SELECT 1     FROM trans t     WHERE t.account_id = a.account_id     AND t.date < d.date     AND t.k_symbol = 'POPLATEK PO OBRATU' ) GROUP BY d.client_id;	financial
SELECT T1.account_id, MIN(T2.amount) AS min_amount FROM account AS T1 JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE STRFTIME('%Y', T2.date) = '1997' GROUP BY T1.account_id ORDER BY min_amount ASC;	financial
SELECT a.account_id, MAX(l.amount) AS max_amount FROM account a JOIN disp d ON a.account_id = d.account_id JOIN loan l ON a.account_id = l.account_id WHERE a.date LIKE '1993%' AND l.duration > 12 GROUP BY a.account_id ORDER BY max_amount DESC;	financial
SELECT COUNT(*) FROM client WHERE gender = 'F' AND birth_date < '1950-01-01' AND district_id IN (SELECT district_id FROM district WHERE A2 = 'Sokolow')	financial
SELECT account_id FROM account WHERE STRFTIME('%Y', date) = '1995' ORDER BY date ASC LIMIT 1;	financial
SELECT DISTINCT T1.account_id FROM account AS T1 JOIN disp AS T2 ON T1.account_id = T2.account_id JOIN trans AS T3 ON T1.account_id = T3.account_id WHERE T1.date < '1997-01-01' AND T3.amount > 3000;	financial
SELECT T1.client_id FROM disp AS T1 INNER JOIN card AS T2 ON T1.disp_id = T2.disp_id WHERE T2.issued = '1994-03-03';	financial
SELECT T2.date AS account_opened_date FROM trans AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.amount = 840 AND T1.date = '1998-10-14';	financial
SELECT T2.district_id FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.date = '1994-08-25'	financial
SELECT MAX(T3.amount) AS max_transaction_amount FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN account AS T3 ON T2.account_id = T3.account_id JOIN card AS T4 ON T2.disp_id = T4.disp_id WHERE T4.issued = '1996-10-21';	financial
SELECT c.gender FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN district dt ON a.district_id = dt.district_id WHERE c.birth_date IN (     SELECT MIN(birth_date)     FROM client     WHERE client_id IN (         SELECT client_id         FROM disp         JOIN account ON disp.account_id = account.account_id         WHERE account_id IN (             SELECT account_id             FROM account             GROUP BY district_id             ORDER BY AVG(dt.A11) DESC             LIMIT 1         )     ) ) ORDER BY c.birth_date ASC LIMIT 1;	financial
SELECT t.amount  FROM trans t  JOIN disp d ON t.account_id = d.account_id  JOIN loan l ON d.client_id = l.client_id  WHERE l.amount = (SELECT MAX(amount) FROM loan)  ORDER BY t.date ASC  LIMIT 1;	financial
SELECT COUNT(DISTINCT T3.client_id) FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T1.district_id IN ( SELECT district_id FROM district WHERE A2 LIKE '%Jesenik%' ) AND T3.gender = 'F'	financial
SELECT T2.disp_id FROM trans AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id WHERE T1.amount = 5100 AND T1.date = '1998-09-02'	financial
SELECT COUNT(account_id) FROM account WHERE date LIKE '1996%' AND district_id IN (SELECT district_id FROM district WHERE A2 = 'Litomerice')	financial
SELECT T3.A2 FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN account AS T4 ON T2.account_id = T4.account_id JOIN district AS T3 ON T4.district_id = T3.district_id WHERE T1.gender = 'F' AND T1.birth_date = '1976-01-29';	financial
SELECT T1.birth_date FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id INNER JOIN loan AS T4 ON T3.account_id = T4.account_id WHERE T4.amount = 98832 AND T4.date = '1996-01-03'	financial
SELECT T2.account_id FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T1.A3 = 'Prague' ORDER BY T2.birth_date ASC LIMIT 1	financial
SELECT CAST(SUM(CASE WHEN T1.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.client_id) AS percentage_male_clients FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN account AS T3 ON T2.account_id = T3.account_id JOIN district AS T4 ON T3.district_id = T4.district_id WHERE T4.A3 = 'south Bohemia' ORDER BY T4.A4 DESC LIMIT 1;	financial
SELECT      ((t1.balance - t2.balance) / t2.balance) * 100 AS increase_rate FROM      trans t1 JOIN      trans t2 ON t1.account_id = t2.account_id AND t1.date >= '1993-03-22' AND t2.date <= '1998-12-27' WHERE      t1.date = (SELECT MIN(date) FROM loan WHERE date = '1993-07-05')     AND t2.date = (SELECT MAX(date) FROM trans WHERE account_id IN (SELECT account_id FROM disp WHERE client_id = (SELECT client_id FROM loan WHERE date = '1993-07-05') LIMIT 1));	financial
SELECT CAST(SUM(CASE WHEN T1.status = 'A' THEN T1.amount ELSE 0 END) AS REAL) * 100 / SUM(T1.amount) FROM loan AS T1 WHERE T1.status IN ('A', 'B', 'C', 'D')	financial
SELECT CAST(SUM(CASE WHEN T2.status = 'C' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.amount < 100000	financial
SELECT DISTINCT a.account_id, d.A2 AS district_name, d.A3 AS district_region FROM account a JOIN disp d ON a.account_id = d.account_id WHERE strftime('%Y', a.date) = '1993' AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT d.account_id, COUNT(a.frequency) AS frequency_of_statement_issuance FROM disp d JOIN account a ON d.account_id = a.account_id JOIN client c ON d.client_id = c.client_id JOIN district dis ON c.district_id = dis.district_id WHERE a.date BETWEEN '1995-01-01' AND '2000-12-31' AND dis.A2 LIKE '%East Bohemia%' GROUP BY d.account_id;	financial
SELECT T1.account_id, T1.date FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Prachatice'	financial
SELECT T3.A2 AS district, T3.A3 AS region FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.loan_id = 4990	financial
SELECT T1.account_id, T3.A2 AS district, T3.A3 AS region FROM loan AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T2.client_id = T3.district_id WHERE T1.amount > 300000	financial
SELECT T2.loan_id, T4.A3, AVG(T3.salary) AS average_salary FROM account AS T1 JOIN loan AS T2 ON T1.account_id = T2.account_id JOIN disp AS T3 ON T1.account_id = T3.account_id JOIN client AS T4 ON T3.client_id = T4.client_id JOIN district AS T5 ON T1.district_id = T5.district_id WHERE T2.duration = 60 GROUP BY T2.loan_id, T4.A3;	financial
SELECT d.A2 AS district, d.A3 AS state, ((d.A13 - d.A12) / d.A12) * 100 AS unemployment_rate_increment FROM loan l JOIN account a ON l.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id JOIN district d ON d.district_id = a.district_id WHERE l.status = 'D';	financial
SELECT CAST(SUM(CASE WHEN T2.district_id IN ( SELECT district_id FROM district WHERE A2 = 'Decin' ) THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM account AS T1 INNER JOIN client AS T2 ON T1.client_id = T2.client_id WHERE STRFTIME('%Y', T1.date) = '1993';	financial
SELECT DISTINCT account_id, date FROM account WHERE frequency = 'POPLATEK MESICNE'	financial
SELECT d.A2, COUNT(c.client_id) AS female_account_holders FROM district d JOIN client c ON d.district_id = c.district_id WHERE c.gender = 'F' GROUP BY d.A2 ORDER BY female_account_holders DESC LIMIT 9;	financial
SELECT d.A2, SUM(t.amount) AS total_withdrawals FROM district d JOIN account a ON d.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id WHERE t.type = 'VYDAJ' AND t.date LIKE '1996-01%' GROUP BY d.A2 ORDER BY total_withdrawals DESC LIMIT 10;	financial
SELECT COUNT(DISTINCT T1.client_id) AS count_of_account_holders FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id LEFT JOIN card AS T3 ON T2.account_id = T3.account_id WHERE T1.district_id IN (     SELECT district_id FROM district WHERE A3 LIKE '%South Bohemia%' ) AND T3.card_id IS NULL;	financial
SELECT T3.A3 FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T2.status IN ('C', 'D') GROUP BY T3.A3 ORDER BY COUNT(T2.loan_id) DESC LIMIT 1	financial
SELECT AVG(loan.amount) AS average_loan_amount FROM loan JOIN disp ON loan.account_id = disp.account_id JOIN client ON disp.client_id = client.client_id WHERE client.gender = 'M';	financial
SELECT T2.A2 AS district_name, T1.district_id AS branch_location FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE strftime('%Y', T1.date) = '1996' ORDER BY T2.A13 DESC;	financial
SELECT T1.district_id, COUNT(T2.account_id) AS account_count FROM district AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.A16 > 0 AND strftime('%Y', T2.date) = '1996' GROUP BY T1.district_id ORDER BY T1.A16 DESC LIMIT 1;	financial
SELECT COUNT(account_id) AS negative_balance_accounts FROM trans JOIN account ON trans.account_id = account.account_id WHERE operation = 'VYBER KARTOU' AND frequency = 'POPLATEK MESICNE' AND balance < 0;	financial
SELECT COUNT(*)  FROM loan  JOIN account ON loan.account_id = account.account_id  WHERE loan.date BETWEEN '1995-01-01' AND '1997-12-31'  AND loan.amount >= 250000  AND account.frequency = 'POPLATEK MESICNE'  AND loan.status = 'A';	financial
SELECT COUNT(DISTINCT T1.account_id)  FROM account AS T1  JOIN disp AS T2 ON T1.account_id = T2.account_id  WHERE T2.district_id = 1 AND (T1.status = 'C' OR T1.status = 'D');	financial
SELECT COUNT(client_id) AS male_clients_count FROM client WHERE district_id IN (     SELECT T1.district_id     FROM district AS T1     JOIN account AS T2 ON T1.district_id = T2.district_id     WHERE T2.date LIKE '1995%'     GROUP BY T1.district_id     ORDER BY SUM(CASE WHEN T1.A15 IS NOT NULL THEN T1.A15 ELSE 0 END) DESC     LIMIT 1 OFFSET 1 ) AND gender = 'M';	financial
SELECT COUNT(*) FROM card WHERE type = 'gold' AND disp_id IN (SELECT disp_id FROM disp WHERE type = 'OWNER');	financial
SELECT COUNT(account_id) FROM account WHERE district_id IN ( SELECT district_id FROM district WHERE A2 = 'Pisek' )	financial
SELECT T2.A2 FROM trans AS T1 JOIN district AS T2 ON T1.account_id = T2.district_id WHERE T1.amount > 10000 AND strftime('%Y', T1.date) = '1997';	financial
SELECT DISTINCT o.account_id FROM order o JOIN account a ON o.account_id = a.account_id WHERE o.k_symbol = 'SIPO' AND a.district_id = ( SELECT district_id FROM district WHERE A2 = 'Pisek' )	financial
SELECT T1.account_id FROM disp AS T1 INNER JOIN card AS T2 ON T1.disp_id = T2.disp_id WHERE T2.type = 'gold'	financial
SELECT AVG(amount) AS average_amount FROM trans WHERE type = 'VYBER KARTOU' AND STRFTIME('%Y', date) = '2021';	financial
SELECT d.client_id FROM disp d JOIN account a ON d.account_id = a.account_id JOIN trans t ON a.account_id = t.account_id WHERE t.operation = 'VYBER KARTOU' AND STRFTIME('%Y', t.date) = '1998' GROUP BY d.client_id HAVING AVG(t.amount) < (     SELECT AVG(amount)     FROM trans     WHERE operation = 'VYBER KARTOU'     AND STRFTIME('%Y', date) = '1998' );	financial
SELECT c.client_id, c.gender, c.birth_date FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card ca ON d.disp_id = ca.disp_id JOIN loan l ON d.account_id = l.account_id WHERE c.gender = 'F' AND ca.type IN ('gold', 'classic') AND l.status IN ('A', 'B', 'C', 'D') GROUP BY c.client_id, c.gender, c.birth_date;	financial
SELECT COUNT(client.client_id)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE client.gender = 'F' AND district.A3 LIKE '%south Bohemia%'	financial
SELECT DISTINCT T1.account_id FROM account AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id INNER JOIN disp AS T3 ON T1.account_id = T3.account_id WHERE T2.district_id = ( SELECT district_id FROM district WHERE A2 = 'Tabor' ) AND T3.type = 'OWNER'	financial
SELECT DISTINCT a.type AS account_type, d.A11 AS average_income FROM disp a JOIN account ac ON a.account_id = ac.account_id JOIN client c ON a.client_id = c.client_id JOIN district d ON c.district_id = d.district_id WHERE a.type != 'OWNER' GROUP BY d.A11 HAVING AVG(d.A11) BETWEEN 8000 AND 9000;	financial
SELECT COUNT(DISTINCT T1.account_id) AS account_count FROM trans AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 = 'North Bohemia' AND T1.bank = 'AB';	financial
SELECT T3.A2 FROM account AS T1 INNER JOIN trans AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T2.type = 'VYDAJ' GROUP BY T3.A2	financial
SELECT AVG(T1.A15) AS avg_crimes FROM district AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.A15 > 4000 AND MIN(T2.date) >= '1997-01-01';	financial
SELECT COUNT(*) FROM card AS c JOIN disp AS d ON c.card_id = d.card_id WHERE c.type = 'classic' AND d.type = 'OWNER'	financial
SELECT COUNT(client_id) FROM client WHERE gender = 'M' AND district_id IN ( SELECT district_id FROM district WHERE A2 = 'Hl.m. Praha' )	financial
SELECT CAST(SUM(CASE WHEN type = 'gold' AND issued < '1998-01-01' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM card;	financial
SELECT T4.name FROM disp AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN loan AS T3 ON T2.account_id = T3.account_id INNER JOIN client AS T4 ON T1.client_id = T4.client_id ORDER BY T3.amount DESC LIMIT 1	financial
SELECT SUM(T1.A15) AS committed_crimes FROM district AS T1 WHERE T1.district_id IN (     SELECT T3.district_id     FROM account AS T2     JOIN disp AS T3 ON T2.account_id = T3.account_id     WHERE T2.account_id = 532 AND T2.date LIKE '1995%' ) AND T1.A15 IS NOT NULL;	financial
SELECT T2.district_id FROM order AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.order_id = 33333;	financial
SELECT T1.date FROM trans AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id WHERE T2.client_id = 3356 AND T1.operation = 'VYBER';	financial
SELECT COUNT(DISTINCT d.account_id) AS weekly_issuance_accounts_with_loan_under_200000 FROM disp d JOIN account a ON d.account_id = a.account_id JOIN loan l ON a.account_id = l.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND l.amount < 200000;	financial
SELECT T2.type FROM disp AS T1 INNER JOIN card AS T2 ON T1.disp_id = T2.disp_id WHERE T1.client_id = 13539;	financial
SELECT T3.A3 FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T1.client_id = 3541;	financial
SELECT d.A2 AS district_name, COUNT(l.loan_id) AS account_count FROM district d JOIN account a ON d.district_id = a.district_id JOIN disp dp ON a.account_id = dp.account_id JOIN loan l ON dp.client_id = l.account_id AND l.status = 'A' GROUP BY d.A2 ORDER BY account_count DESC LIMIT 1;	financial
SELECT T1.client_id FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id INNER JOIN order AS T4 ON T3.account_id = T4.account_id WHERE T4.order_id = 32423	financial
SELECT T1.trans_id, T1.date, T1.type, T1.operation, T1.amount, T1.balance, T1.k_symbol, T1.bank, T1.account FROM trans AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.district_id = 5;	financial
SELECT COUNT(account_id) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Jesenik')	financial
SELECT client_id FROM disp WHERE card_id IN (SELECT card_id FROM card WHERE type = 'junior' AND issued >= '1997-01-01')	financial
SELECT CAST(SUM(CASE WHEN T3.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.client_id) FROM account AS T1 JOIN disp AS T2 ON T1.account_id = T2.account_id JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T1.district_id IN (     SELECT district_id     FROM district     GROUP BY district_id     HAVING AVG(A11) > 10000 );	financial
SELECT      (SUM(CASE WHEN strftime('%Y', T2.date) = '1997' THEN T2.amount ELSE 0 END) - SUM(CASE WHEN strftime('%Y', T2.date) = '1996' THEN T2.amount ELSE 0 END)) / SUM(CASE WHEN strftime('%Y', T2.date) = '1996' THEN T2.amount ELSE 0 END) * 100 AS growth_rate FROM      client AS T1 JOIN      disp AS T2 ON T1.client_id = T2.client_id JOIN      loan AS T3 ON T2.account_id = T3.account_id WHERE      T1.gender = 'M';	financial
SELECT COUNT(*) FROM trans WHERE type = 'VYBER KARTOU' AND date > '1995-12-31';	financial
SELECT SUM(CASE WHEN T1.A3 = 'East Bohemia' THEN T1.A16 ELSE 0 END) - SUM(CASE WHEN T1.A3 = 'North Bohemia' THEN T1.A16 ELSE 0 END) AS Crime_Difference FROM district AS T1 WHERE T1.A3 IN ('East Bohemia', 'North Bohemia') AND T1.A8 = 1996;	financial
SELECT disp.type, COUNT(*) AS count FROM disp JOIN account ON disp.account_id = account.account_id WHERE account.account_id BETWEEN 1 AND 10 GROUP BY disp.type;	financial
SELECT      COUNT(*) AS request_frequency,      SUM(CASE WHEN k_symbol LIKE '%SIPO%' THEN amount ELSE 0 END) AS total_debit_aim FROM      trans WHERE      account_id = 3;	financial
SELECT STRFTIME('%Y', T1.birth_date) AS birth_year FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id WHERE T2.account_id = 130;	financial
SELECT COUNT(DISTINCT T1.account_id) AS account_count FROM disp AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.type = 'OWNER' AND T2.frequency = 'POPLATEK PO OBRATU';	financial
SELECT SUM(T2.amount) AS total_debt, T2.status AS payment_status FROM client AS T1 INNER JOIN loan AS T2 ON T1.client_id = T2.account_id WHERE T1.client_id = 992;	financial
SELECT      SUM(t.amount),      c.gender  FROM      trans t  JOIN      disp d ON t.account_id = d.account_id  JOIN      client c ON d.client_id = c.client_id  WHERE      d.client_id = 4      AND t.trans_id > 851;	financial
SELECT T1.type FROM card AS T1 INNER JOIN disp AS T2 ON T1.card_id = T2.card_id WHERE T2.client_id = 9;	financial
SELECT SUM(amount) FROM trans WHERE account_id IN ( SELECT account_id FROM disp WHERE client_id = 617 ) AND date LIKE '1998%' AND type = 'VYBER'	financial
SELECT c.client_id, c.birth_date FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE c.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND a.district_id IN (SELECT district_id FROM district WHERE A8 = 2);	financial
SELECT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN loan l ON a.account_id = l.account_id WHERE c.gender = 'F' ORDER BY l.amount DESC LIMIT 3;	financial
SELECT COUNT(DISTINCT d.client_id) AS customer_count FROM disp d JOIN client c ON d.client_id = c.client_id JOIN trans t ON d.account_id = t.account_id WHERE c.gender = 'M' AND c.birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND t.type = 'PRIJEM' AND t.k_symbol = 'SIPO' AND t.amount > 4000;	financial
SELECT COUNT(account_id) FROM account WHERE district_id IN ( SELECT district_id FROM district WHERE A3 = 'Beroun' ) AND date > '1996-12-31';	financial
SELECT COUNT(*) FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card ca ON d.disp_id = ca.disp_id WHERE c.gender = 'F' AND ca.type = 'junior';	financial
SELECT CAST(SUM(CASE WHEN T3.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.account_id) AS percentage_female_clients FROM account AS T1 JOIN disp AS T2 ON T1.account_id = T2.account_id JOIN client AS T3 ON T2.client_id = T3.client_id JOIN district AS T4 ON T1.district_id = T4.district_id WHERE T4.A3 = 'Prague';	financial
SELECT CAST(SUM(CASE WHEN T1.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id WHERE T3.frequency = 'POPLATEK TYDNE';	financial
SELECT COUNT(DISTINCT d.client_id) AS owner_clients FROM disp d JOIN account a ON d.account_id = a.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND d.type = 'OWNER';	financial
SELECT T1.account_id FROM account AS T1 JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.duration > 24 AND T1.date < '1997-01-01' GROUP BY T1.account_id ORDER BY MIN(T2.amount) ASC;	financial
SELECT T1.account_id FROM disp AS T1 JOIN client AS T2 ON T1.client_id = T2.client_id WHERE T2.gender = 'F' GROUP BY T1.account_id ORDER BY MIN(T2.birth_date), AVG(T1.A11) LIMIT 1;	financial
SELECT COUNT(client_id) FROM client WHERE STRFTIME('%Y', birth_date) = '1920' AND district_id IN ( SELECT district_id FROM district WHERE A3 LIKE '%east Bohemia%' )	financial
SELECT COUNT(*) FROM account WHERE frequency = 'POPLATEK TYDNE'	financial
SELECT AVG(T2.amount) AS avg_loan_amount, T1.date AS statement_issuance_date FROM account AS T1 JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.status IN ('C', 'D') GROUP BY T1.date;	financial
SELECT DISTINCT d.client_id, c.district_id FROM disp d JOIN client c ON d.client_id = c.client_id WHERE d.type = 'OWNER' AND EXISTS (     SELECT 1     FROM order o     WHERE o.account_id = d.account_id ) OR EXISTS (     SELECT 1     FROM loan l     WHERE l.account_id = d.account_id )	financial
SELECT C.client_id, JULIANDAY(C.birth_date) - JULIANDAY('1970-01-01') / 365 AS age FROM client C JOIN disp D ON C.client_id = D.client_id JOIN card K ON D.disp_id = K.disp_id WHERE K.type = 'gold' AND D.type = 'OWNER'	financial
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY COUNT(bond_type) DESC LIMIT 1	toxicology
SELECT COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-' AND T2.element = 'cl'	toxicology
SELECT AVG(CASE WHEN T1.element = 'o' THEN 1 ELSE 0 END) AS avg_oxygen_atoms FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-';	toxicology
SELECT AVG(CASE WHEN T2.bond_type = '-' THEN 1 ELSE 0 END) FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-') AND element = 'na';	toxicology
SELECT m.label  FROM molecule m  JOIN bond b ON m.molecule_id = b.molecule_id  WHERE b.bond_type = '#' AND m.label = '+';	toxicology
SELECT CAST(COUNT(CASE WHEN T1.element = 'c' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.atom_id) AS percentage FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id JOIN bond AS T3 ON T2.molecule_id = T3.molecule_id WHERE T3.bond_type = '=';	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '#'	toxicology
SELECT COUNT(*) FROM atom WHERE element != 'br'	toxicology
SELECT COUNT(molecule_id) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR099' AND label = '+';	toxicology
SELECT DISTINCT molecule_id FROM atom WHERE element = 'c'	toxicology
SELECT DISTINCT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR004_8_9'	toxicology
SELECT DISTINCT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '='	toxicology
SELECT m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'h' GROUP BY m.label ORDER BY COUNT(m.label) DESC LIMIT 1;	toxicology
SELECT T2.bond_type FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'cl';	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-'	toxicology
SELECT DISTINCT a1.element, a2.element FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN atom a2 ON a2.atom_id = c.atom_id2 JOIN molecule m ON a1.molecule_id = m.molecule_id WHERE m.label = '-';	toxicology
SELECT element FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-') GROUP BY element ORDER BY COUNT(element) ASC LIMIT 1;	toxicology
SELECT T3.bond_type FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T1.bond_id = T3.bond_id WHERE (T2.atom_id = 'TR004_8' AND T1.atom_id2 = 'TR004_20') OR (T2.atom_id = 'TR004_20' AND T1.atom_id2 = 'TR004_8')	toxicology
SELECT DISTINCT label FROM molecule WHERE molecule_id NOT IN ( SELECT molecule_id FROM atom WHERE element != 'sn' )	toxicology
SELECT COUNT(DISTINCT T1.atom_id) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element IN ('i', 's') AND T3.bond_type = '-'	toxicology
SELECT T1.atom_id, T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id IN ( SELECT bond_id FROM bond WHERE bond_type = '#' )	toxicology
SELECT DISTINCT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE c.bond_id IN (     SELECT bond_id     FROM connected     WHERE atom_id IN (         SELECT atom_id         FROM atom         WHERE molecule_id = 'TR181'     ) );	toxicology
SELECT CAST(COUNT(DISTINCT CASE WHEN T1.element != 'f' THEN T2.molecule_id END) AS REAL) * 100 / COUNT(DISTINCT T2.molecule_id) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'	toxicology
SELECT SUM(CASE WHEN T1.bond_type = '#' THEN 1 ELSE 0 END) * 100 / COUNT(T1.bond_id) AS percent FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+';	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR000' GROUP BY element ORDER BY element ASC LIMIT 3;	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_2_6' AND T1.molecule_id = 'TR001'	toxicology
SELECT SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN label = '-' THEN 1 ELSE 0 END) AS difference FROM molecule;	toxicology
SELECT T1.atom_id FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_id = 'TR000_2_5'	toxicology
SELECT T1.bond_id FROM connected AS T1 WHERE T1.atom_id2 = 'TR000_2' AND T1.atom_id IN ( SELECT atom_id FROM atom WHERE molecule_id = 'TR000' )	toxicology
SELECT T1.label FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = ' = ' GROUP BY T1.label ORDER BY T1.label LIMIT 5	toxicology
SELECT CAST(SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) AS percent FROM bond WHERE molecule_id = 'TR008'	toxicology
SELECT CAST(COUNT(CASE WHEN label = '+' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(molecule_id) FROM molecule	toxicology
SELECT CAST(SUM(CASE WHEN element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(atom_id) AS percent FROM atom WHERE molecule_id = 'TR000'	toxicology
SELECT bond_type FROM bond WHERE molecule_id = 'TR000'	toxicology
SELECT T1.element, T3.toxicology, T2.label FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id LEFT JOIN toxicology AS T3 ON T2.molecule_id = T3.molecule_id WHERE T1.molecule_id = 'TR060';	toxicology
SELECT bond_type, COUNT(*) AS bond_count FROM bond WHERE molecule_id = 'TR010' GROUP BY bond_type ORDER BY bond_count DESC LIMIT 1; SELECT label FROM molecule WHERE molecule_id = 'TR010';	toxicology
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-' GROUP BY T1.molecule_id HAVING COUNT(DISTINCT T2.bond_id) = 1 ORDER BY T1.label ASC LIMIT 3;	toxicology
SELECT T1.bond_type FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = 'TR006' ORDER BY T1.bond_type LIMIT 2	toxicology
SELECT COUNT(*) FROM connected WHERE (atom_id = 'TR009_12' OR atom_id2 = 'TR009_12') AND molecule_id = 'TR009';	toxicology
SELECT COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.element = 'br'	toxicology
SELECT T1.bond_type, T3.atom_id, T4.atom_id2 FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T2.atom_id = T3.atom_id JOIN atom AS T4 ON T2.atom_id2 = T4.atom_id WHERE T1.bond_id = 'TR001_6_9';	toxicology
SELECT T1.label, CASE WHEN T1.label = '+' THEN 'Carcinogenic' ELSE 'Non-Carcinogenic' END AS carcinogenic_status FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.atom_id = 'TR001_10';	toxicology
SELECT COUNT(DISTINCT molecule_id) FROM bond WHERE bond_type = '#';	toxicology
SELECT COUNT(bond_id) FROM connected WHERE atom_id LIKE 'TR%_19' OR atom_id2 LIKE 'TR%_19'	toxicology
SELECT T.element FROM atom AS T WHERE T.molecule_id = 'TR004'	toxicology
SELECT COUNT(molecule_id) FROM molecule WHERE label = '-';	toxicology
SELECT m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE SUBSTR(a.atom_id, 7, 2) BETWEEN '21' AND '25' AND m.label = '+';	toxicology
SELECT b.bond_id FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE (a1.element = 'p' AND a2.element = 'n') OR (a1.element = 'n' AND a2.element = 'p');	toxicology
SELECT m.label, COUNT(b.bond_id) AS double_bonds FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = ' = ' GROUP BY m.molecule_id ORDER BY double_bonds DESC LIMIT 1;	toxicology
SELECT AVG(COUNT(T3.bond_id) / COUNT(DISTINCT T2.atom_id)) AS avg_bonds_per_i_atom FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id LEFT JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'i';	toxicology
SELECT T2.bond_type, T2.bond_id FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE CAST(SUBSTR(T1.atom_id, 7, 2) AS INT) = 45 OR CAST(SUBSTR(T1.atom_id2, 7, 2) AS INT) = 45;	toxicology
SELECT element FROM atom WHERE atom_id NOT IN (SELECT atom_id FROM connected);	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.molecule_id = 'TR041' AND T3.bond_type = '#'	toxicology
SELECT T.element FROM atom AS T WHERE T.molecule_id IN ( SELECT molecule_id FROM connected WHERE bond_id = 'TR144_8_19' )	toxicology
SELECT m.label FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '=' GROUP BY m.molecule_id ORDER BY COUNT(b.bond_id) DESC LIMIT 1;	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' GROUP BY T1.element ORDER BY COUNT(T1.element) ASC LIMIT 1	toxicology
SELECT DISTINCT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE a.element = 'pb';	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '#'	toxicology
SELECT CAST(SUM(CASE WHEN COUNT(*) = ( SELECT MAX(cnt) FROM ( SELECT COUNT(atom_id) AS cnt FROM atom GROUP BY molecule_id ) ) THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) FROM bond WHERE molecule_id IN ( SELECT molecule_id FROM atom GROUP BY molecule_id ORDER BY COUNT(molecule_id) DESC LIMIT 1 )	toxicology
SELECT CAST(COUNT(CASE WHEN T2.label = '+' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.bond_id) FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '-';	toxicology
SELECT COUNT(*) FROM atom WHERE element IN ('c', 'h');	toxicology
SELECT T1.atom_id2 FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T2.element = 's'	toxicology
SELECT T2.bond_type FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'sn' GROUP BY T2.bond_type	toxicology
SELECT COUNT(DISTINCT T1.element) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-'	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id IN ( SELECT molecule_id FROM bond WHERE bond_type = '#' AND molecule_id IN ( SELECT molecule_id FROM atom WHERE element IN ('p', 'br') ) )	toxicology
SELECT T1.bond_id FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'	toxicology
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-' AND T1.label != '+'	toxicology
SELECT CAST(SUM(CASE WHEN T1.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) AS percent FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-'	toxicology
SELECT label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002');	toxicology
SELECT molecule_id FROM molecule WHERE label = '-'	toxicology
SELECT SUM(CASE WHEN T1.label = '+' THEN 1 ELSE 0 END) AS total_carcinogenic_molecules FROM molecule AS T1 WHERE T1.molecule_id BETWEEN 'TR000' AND 'TR030';	toxicology
SELECT T1.bond_type FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.molecule_id BETWEEN 'TR000' AND 'TR050'	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_10_11'	toxicology
SELECT COUNT(T2.bond_id) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 'i'	toxicology
SELECT MAX(T1.label) AS majority_carcinogenicity FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'ca';	toxicology
SELECT EXISTS (  SELECT 1  FROM atom  WHERE bond_id = 'TR001_1_8' AND element = 'cl' ) AND EXISTS (  SELECT 1  FROM atom  WHERE bond_id = 'TR001_1_8' AND element = 'c' );	toxicology
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN connected AS T3 ON T2.atom_id = T3.atom_id INNER JOIN bond AS T4 ON T3.bond_id = T4.bond_id WHERE T2.element = 'c' AND T4.bond_type = '#' AND T1.label = '-' LIMIT 2	toxicology
SELECT CAST(COUNT(CASE WHEN T1.element = 'cl' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.molecule_id) AS percentage FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+';	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR001';	toxicology
SELECT molecule_id FROM bond WHERE bond_type = '=';	toxicology
SELECT T1.atom_id, T2.atom_id2 FROM connected AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id AND T1.atom_id < T2.atom_id JOIN bond AS B ON T1.bond_id = B.bond_id WHERE B.bond_type = '#' GROUP BY T1.atom_id, T2.atom_id2;	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR000_1_2'	toxicology
SELECT COUNT(DISTINCT T1.molecule_id) AS non_carcinogenic_single_bond_molecules FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-' AND T1.label = '-';	toxicology
SELECT T2.label FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_id = 'TR001_10_11'	toxicology
SELECT b.bond_id, m.label FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '#' AND m.label IN ('+', '-')	toxicology
SELECT SUBSTR(T1.atom_id, 7, 1) AS ToxicologyElement FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' AND SUBSTR(T1.atom_id, 7, 1) = '4' GROUP BY T1.molecule_id, SUBSTR(T1.atom_id, 7, 1)	toxicology
SELECT SUM(CASE WHEN element = 'h' THEN 1 ELSE 0 END) / COUNT(*) AS ratio, label FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule_id = 'TR006';	toxicology
SELECT T1.label FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'ca'	toxicology
SELECT T2.bond_type FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'c'	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_10_11' GROUP BY T1.element	toxicology
SELECT CAST(SUM(CASE WHEN T2.bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id;	toxicology
SELECT CAST(SUM(CASE WHEN T2.bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_id) AS percent FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = 'TR047';	toxicology
SELECT T1.label FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.atom_id = 'TR001_1'	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR151';	toxicology
SELECT DISTINCT element FROM atom WHERE molecule_id = 'TR151' AND element IN ('cl', 'c', 'h')	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+';	toxicology
SELECT atom_id FROM atom WHERE molecule_id BETWEEN 'TR010' AND 'TR050' AND element = 'c'	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+')	toxicology
SELECT T1.bond_id FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T1.bond_type = '=' AND T2.atom_id IN ( SELECT atom_id FROM atom WHERE molecule_id IN ( SELECT molecule_id FROM molecule WHERE label = '+' ) )	toxicology
SELECT COUNT(*)  FROM atom  WHERE molecule_id IN (  SELECT molecule_id   FROM molecule   WHERE label = '+' ) AND element = 'h';	toxicology
SELECT T1.molecule_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id JOIN connected AS T3 ON T2.bond_id = T3.bond_id WHERE T3.atom_id = 'TR000_1' AND T2.bond_id = 'TR000_1_2';	toxicology
SELECT atom_id FROM atom WHERE molecule_id IN (     SELECT molecule_id FROM molecule WHERE label = '-' ) AND element = 'c';	toxicology
SELECT CAST(COUNT(CASE WHEN T1.element = 'h' AND T3.label = '+' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id WHERE T1.element = 'h'	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR124'	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR186'	toxicology
SELECT T2.bond_type FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = 'TR007_4_19'	toxicology
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_2_4';	toxicology
SELECT COUNT(b.bond_type) AS double_bonds, m.label AS carcinogenicity FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.label = '+' AND b.bond_type = '=';	toxicology
SELECT T1.label, T2.element FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.element IN ('cl', 'c', 'h')	toxicology
SELECT T1.bond_id, T2.element AS atom1, T3.element AS atom2 FROM bond AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id AND T1.bond_id = ( SELECT bond_id FROM connected WHERE atom_id = T2.atom_id ) INNER JOIN atom AS T3 ON T1.molecule_id = T3.molecule_id AND T1.bond_id = ( SELECT bond_id FROM connected WHERE atom_id = T3.atom_id ) WHERE T1.bond_type = '-' GROUP BY T1.bond_id, T2.element, T3.element	toxicology
SELECT DISTINCT m.label, a.element FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN bond b ON m.molecule_id = b.molecule_id JOIN connected c ON a.atom_id = c.atom_id AND b.bond_id = c.bond_id WHERE b.bond_type = '#';	toxicology
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR000_2_3';	toxicology
SELECT COUNT(*) FROM atom WHERE element = 'cl';	toxicology
SELECT a.atom_id, COUNT(b.bond_type) AS bond_count FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE a.molecule_id = 'TR346' GROUP BY a.atom_id;	toxicology
SELECT COUNT(DISTINCT m.molecule_id) AS total_molecules_with_double_bond, SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) AS carcinogenic_molecules_with_double_bond FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '=';	toxicology
SELECT COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id JOIN bond AS T3 ON T1.molecule_id = T3.molecule_id WHERE T2.element != 's' AND T3.bond_type != '=';	toxicology
SELECT T2.label FROM connected AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_id = 'TR001_2_4'	toxicology
SELECT COUNT(atom_id) FROM atom WHERE molecule_id = 'TR001';	toxicology
SELECT COUNT(bond_id) FROM bond WHERE bond_type = '-'	toxicology
SELECT T1.label FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'cl' AND T1.label = '+'	toxicology
SELECT DISTINCT T2.label FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'c' AND T2.label = '-'	toxicology
SELECT CAST(COUNT(CASE WHEN T1.label = '+' AND T2.element = 'cl' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.molecule_id) AS percentage FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id	toxicology
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_id = 'TR001_1_7'	toxicology
SELECT COUNT(DISTINCT atom_id) AS num_elements FROM atom WHERE molecule_id IN (SELECT molecule_id FROM bond WHERE bond_id = 'TR001_3_4')	toxicology
SELECT T2.bond_type FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE (T1.atom_id = 'TR000_1' AND T1.atom_id2 = 'TR000_2') OR (T1.atom_id = 'TR000_2' AND T1.atom_id2 = 'TR000_1')	toxicology
SELECT T1.label FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.atom_id IN ('TR000_2', 'TR000_4')	toxicology
SELECT element FROM atom WHERE atom_id = 'TR000_1'	toxicology
SELECT CASE WHEN T1.label = '+' THEN 'Carcinogenic' ELSE 'Non-Carcinogenic' END AS carcinogenicity FROM molecule AS T1 WHERE T1.molecule_id = 'TR000'	toxicology
SELECT CAST(COUNT(CASE WHEN T2.bond_type = '-' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.atom_id) AS percentage FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id;	toxicology
SELECT COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'n' AND T1.label = '+'	toxicology
SELECT m.label  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  JOIN connected c ON a.atom_id = c.atom_id  JOIN bond b ON c.bond_id = b.bond_id  WHERE a.element = 's' AND b.bond_type = '=';	toxicology
SELECT T1.label FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-' GROUP BY T1.label HAVING COUNT(T2.atom_id) > 5	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '=' AND T1.molecule_id = 'TR024'	toxicology
SELECT m.label  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  GROUP BY m.molecule_id  ORDER BY COUNT(a.atom_id) DESC  LIMIT 1;	toxicology
SELECT CAST(COUNT(CASE WHEN T1.label = '+' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.molecule_id) AS percentage FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id JOIN connected AS T3 ON T2.atom_id = T3.atom_id JOIN bond AS T4 ON T3.bond_id = T4.bond_id WHERE T2.element = 'h' AND T4.bond_type = '#';	toxicology
SELECT COUNT(molecule_id) FROM molecule WHERE label = '+'	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR004' AND 'TR010' AND molecule_id IN (SELECT molecule_id FROM bond WHERE bond_type = '-')	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR008' AND element = 'c'	toxicology
SELECT T.element FROM atom AS T WHERE T.atom_id = 'TR004_7' AND T.molecule_id IN ( SELECT molecule_id FROM molecule WHERE label = '-' )	toxicology
SELECT COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN connected AS T3 ON T2.atom_id = T3.atom_id INNER JOIN bond AS T4 ON T3.bond_id = T4.bond_id WHERE T2.element = 'o' AND T4.bond_type = ' = '	toxicology
SELECT COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '#' AND T1.label = '-';	toxicology
SELECT T1.element, T2.bond_type FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR002'	toxicology
SELECT T1.atom_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'c' AND T3.bond_type = '=' AND T1.molecule_id = 'TR012';	toxicology
SELECT T1.atom_id FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' AND T1.element = 'o'	toxicology
SELECT name FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT name FROM cards WHERE borderColor = 'borderless' AND (cardKingdomFoilId IS NULL OR cardKingdomId IS NULL)	card_games
SELECT name FROM cards ORDER BY faceConvertedManaCost DESC LIMIT 1	card_games
SELECT name FROM cards WHERE edhrecRank < 100 AND frameVersion = 2015	card_games
SELECT T1.name  FROM cards AS T1  JOIN legalities AS T2 ON T1.uuid = T2.uuid  WHERE T1.rarity = 'mythic' AND T2.status = 'Banned' AND T2.format = 'gladiator';	card_games
SELECT T1.status FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.types = 'Artifact' AND T2.side IS NULL AND T1.format = 'vintage'	card_games
SELECT c.id, c.artist FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE (c.power = '*' OR c.power IS NULL) AND l.format = 'commander' AND l.status = 'Legal';	card_games
SELECT c.id, r.text, c.hasContentWarning FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Stephen Daniel';	card_games
SELECT T1.text FROM rulings AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Sublime Epiphany' AND T2.number = '74s'	card_games
SELECT T1.name, T1.artist, T1.isPromo FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid GROUP BY T1.id ORDER BY COUNT(T2.uuid) DESC LIMIT 1	card_games
SELECT T2.language FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Annul' AND T1.number = '29'	card_games
SELECT T1.name FROM foreign_data AS T1 JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.language = 'Japanese';	card_games
SELECT CAST(SUM(CASE WHEN T2.language = 'Chinese Simplified' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid;	card_games
SELECT s.name AS SetName, s.totalSetSize AS TotalCards FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian';	card_games
SELECT COUNT(DISTINCT type) FROM cards WHERE artist = 'Aaron Boyd';	card_games
SELECT keywords FROM cards WHERE name = 'Angel of Mercy';	card_games
SELECT COUNT(*) FROM cards WHERE power = '*';	card_games
SELECT promoTypes FROM cards WHERE name = 'Duress'	card_games
SELECT borderColor FROM cards WHERE name = 'Ancestor''s Chosen';	card_games
SELECT T1.originalType FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Ancestor''s Chosen';	card_games
SELECT T2.language FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Angel of Mercy' GROUP BY T2.language	card_games
SELECT COUNT(*)  FROM cards  JOIN legalities ON cards.uuid = legalities.uuid  WHERE legalities.status = 'restricted' AND cards.isTextless = 0;	card_games
SELECT T1.text FROM rulings AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Condemn';	card_games
SELECT COUNT(*) FROM cards WHERE uuid IN (SELECT uuid FROM legalities WHERE status = 'restricted') AND isStarter = 1;	card_games
SELECT T2.status FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Cloudchaser Eagle'	card_games
SELECT type FROM cards WHERE name = 'Benalish Knight';	card_games
SELECT T2.text FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Benalish Knight';	card_games
SELECT T1.artist FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Phyrexian';	card_games
SELECT CAST(SUM(CASE WHEN borderColor = 'borderless' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(id) FROM cards;	card_games
SELECT COUNT(DISTINCT c.uuid) FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'German' AND c.isReprint = 1;	card_games
SELECT COUNT(*) FROM cards AS c JOIN foreign_data AS fd ON c.uuid = fd.uuid WHERE c.borderColor = 'borderless' AND fd.language = 'Russian';	card_games
SELECT CAST(SUM(CASE WHEN T1.language = 'French' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.isStorySpotlight = 1;	card_games
SELECT COUNT(*) FROM cards WHERE toughness = 99;	card_games
SELECT name FROM cards WHERE artist = 'Aaron Boyd';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND availability LIKE '%mtgo%';	card_games
SELECT id FROM cards WHERE convertedManaCost = 0;	card_games
SELECT DISTINCT layout FROM cards WHERE keywords LIKE '%flying%'	card_games
SELECT COUNT(*) FROM cards WHERE originalType = 'Summon - Angel' AND subtypes NOT LIKE '%Angel%';	card_games
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT id FROM cards WHERE duelDeck = 'a';	card_games
SELECT edhrecRank FROM cards WHERE frameVersion = '2015';	card_games
SELECT DISTINCT T1.artist FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Chinese Simplified';	card_games
SELECT T1.name FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.availability LIKE '%paper%' AND T2.language = 'Japanese'	card_games
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.status = 'Banned' AND cards.borderColor = 'white';	card_games
SELECT T1.uuid, T2.language FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid INNER JOIN legalities AS T3 ON T1.uuid = T3.uuid WHERE T3.format = 'legacy'	card_games
SELECT text FROM rulings WHERE uuid IN (SELECT uuid FROM cards WHERE name = 'Beacon of Immortality');	card_games
SELECT COUNT(DISTINCT c.uuid), l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.frameVersion = 'future' AND l.status = 'legal';	card_games
SELECT T1.name, T1.colors FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.code = 'OGW';	card_games
SELECT T1.name, T2.language FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.setCode = '10E' AND T1.convertedManaCost = 5 GROUP BY T1.name, T2.language	card_games
SELECT c.name, r.date  FROM cards c  JOIN rulings r ON c.uuid = r.uuid  WHERE c.originalType = 'Creature - Elf';	card_games
SELECT DISTINCT C.colors, L.format FROM cards AS C JOIN legalities AS L ON C.uuid = L.uuid WHERE C.id BETWEEN 1 AND 20;	card_games
SELECT c.name  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE c.originalType = 'Artifact' AND c.colors = 'B' AND fd.language IS NOT NULL;	card_games
SELECT c.name FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.rarity = 'uncommon' ORDER BY r.date ASC LIMIT 3;	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'John Avon' AND hasFoil = 1 AND cardKingdomFoilId IS NULL;	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'UDON' AND availability = 'mtgo' AND hand = -1;	card_games
SELECT COUNT(*) FROM cards WHERE frameVersion = '1993' AND availability LIKE '%paper%' AND hasContentWarning = 1;	card_games
SELECT manaCost FROM cards WHERE layout = 'normal' AND frameVersion = '2003' AND borderColor = 'black' AND availability LIKE '%paper%' AND availability LIKE '%mtgo%';	card_games
SELECT SUM(convertedManaCost) AS total_unconverted_mana_cost FROM cards WHERE artist = 'Rob Alexander';	card_games
SELECT DISTINCT subtype, supertype FROM cards WHERE availability = 'arena';	card_games
SELECT T1.setCode FROM set_translations AS T1 INNER JOIN foreign_data AS T2 ON T1.translation = T2.name WHERE T1.language = 'Spanish'	card_games
SELECT CAST(SUM(CASE WHEN isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards WHERE frameEffects = 'legendary'	card_games
SELECT      CAST(SUM(CASE WHEN isStorySpotlight = 1 AND isTextless = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS percentage,     id FROM      cards WHERE      isStorySpotlight = 1;	card_games
SELECT      T2.name,      CAST(COUNT(CASE WHEN T1.language = 'Spanish' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.id) AS percentage FROM      foreign_data AS T1 JOIN      cards AS T2 ON T1.uuid = T2.uuid GROUP BY      T2.name;	card_games
SELECT DISTINCT T1.language FROM set_translations AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.baseSetSize = 309;	card_games
SELECT COUNT(*) FROM sets  JOIN set_translations ON sets.code = set_translations.setCode  WHERE set_translations.language = 'Português (Brasil)' AND sets.block = 'Commander';	card_games
SELECT id FROM cards WHERE type LIKE '%Creature%' AND uuid IN (SELECT uuid FROM legalities WHERE status = 'Legal')	card_games
SELECT T1.subtypes, T1.supertypes FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'German' AND T1.subtypes IS NOT NULL AND T1.supertypes IS NOT NULL GROUP BY T1.subtypes, T1.supertypes ORDER BY T1.subtypes, T1.supertypes;	card_games
SELECT COUNT(*) FROM cards WHERE power IS NULL OR power = '*' AND text LIKE '%triggered ability%';	card_games
SELECT COUNT(*) FROM cards  JOIN legalities ON cards.uuid = legalities.uuid  WHERE legalities.format = 'premodern'  AND cards.text LIKE '%This is a triggered mana ability.%'  AND cards.side IS NULL;	card_games
SELECT id FROM cards WHERE artist = 'Erica Yang' AND availability LIKE '%paper%' AND uuid IN ( SELECT uuid FROM legalities WHERE format = 'pauper' )	card_games
SELECT artist FROM cards WHERE uuid IN ( SELECT uuid FROM foreign_data WHERE text LIKE '%Das perfekte Gegenmittel zu einer dichten Formation%' )	card_games
SELECT T2.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Matthew D. Wilson' AND T1.borderColor = 'black' AND T1.type = 'Creature' AND T2.language = 'French' AND T1.layout = 'normal'	card_games
SELECT COUNT(*) FROM cards WHERE rarity = 'rare' AND uuid IN (SELECT uuid FROM rulings WHERE date = '2007-02-01');	card_games
SELECT T1.language FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.baseSetSize = 180 AND T2.block = 'Ravnica';	card_games
SELECT CAST(SUM(CASE WHEN hasContentWarning = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(id) FROM cards WHERE uuid IN (SELECT uuid FROM legalities WHERE format = 'commander' AND status = 'legal')	card_games
SELECT CAST(SUM(CASE WHEN T1.power IS NULL OR T1.power = '*' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'French';	card_games
SELECT CAST(SUM(CASE WHEN T2.language = 'Japanese' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.type = 'expansion';	card_games
SELECT T1.availability FROM cards AS T1 WHERE T1.artist = 'Daren Bader'	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'borderless' AND edhrecRank > 12000;	card_games
SELECT COUNT(*)  FROM cards  WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1;	card_games
SELECT name FROM cards WHERE power IS NULL OR power = '*' AND promoTypes LIKE '%arenaleague%' ORDER BY name ASC LIMIT 3;	card_games
SELECT T1.language FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.multiverseid = 149934	card_games
SELECT cardKingdomFoilId FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL ORDER BY cardKingdomFoilId ASC LIMIT 3	card_games
SELECT CAST(SUM(CASE WHEN isTextless = 1 AND layout = 'normal' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards	card_games
SELECT id FROM cards WHERE subtypes LIKE '%Angel%' AND subtypes LIKE '%Wizard%' AND otherFaceIds IS NULL;	card_games
SELECT name  FROM sets  WHERE mtgoCode IS NULL OR mtgoCode = ''  ORDER BY name ASC  LIMIT 3;	card_games
SELECT DISTINCT T2.language FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.mcmName = 'Archenemy' AND T1.code = 'ARC';	card_games
SELECT s.name, st.translation FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.id = 5;	card_games
SELECT T1.language, T3.type  FROM foreign_data AS T1  JOIN cards AS T2 ON T1.uuid = T2.uuid  JOIN sets AS T3 ON T2.setCode = T3.code  WHERE T2.id = 206;	card_games
SELECT c.id, f.name  FROM cards c  JOIN foreign_data f ON c.uuid = f.uuid  JOIN sets s ON c.setCode = s.code  WHERE f.language = 'Italian' AND s.block = 'Shadowmoor'  ORDER BY c.id ASC  LIMIT 2;	card_games
SELECT T1.id FROM sets AS T1 JOIN foreign_data AS T2 ON T1.code = T2.multiverseid WHERE T1.isForeignOnly = 1 AND T1.isFoilOnly = 1 AND T2.language = 'Japanese'	card_games
SELECT T1.name FROM sets AS T1 INNER JOIN foreign_data AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Russian' ORDER BY T1.baseSetSize DESC LIMIT 1	card_games
SELECT CAST(SUM(CASE WHEN T2.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.language = 'Chinese Simplified'	card_games
SELECT COUNT(*) FROM sets WHERE code IN ( SELECT setCode FROM foreign_data WHERE language = 'Japanese' ) AND ( mtgoCode IS NULL OR mtgoCode = '' )	card_games
SELECT COUNT(id), id FROM cards WHERE borderColor = 'black' GROUP BY id	card_games
SELECT COUNT(id), id FROM cards WHERE frameEffects = 'extendedart' GROUP BY id;	card_games
SELECT name FROM cards WHERE borderColor = 'black' AND isFullArt = 1;	card_games
SELECT T1.language FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.id = 174;	card_games
SELECT T1.name FROM sets AS T1 WHERE T1.code = 'ALL'	card_games
SELECT T1.language FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'A Pedra Fellwar';	card_games
SELECT code FROM sets WHERE releaseDate = '2007-07-13';	card_games
SELECT baseSetSize, setCode FROM sets WHERE block IN ('Masques', 'Mirage')	card_games
SELECT setCode FROM sets WHERE type = 'expansion';	card_games
SELECT T2.name AS foreign_name, T2.type  FROM cards AS T1  JOIN foreign_data AS T2 ON T1.uuid = T2.uuid  WHERE T1.watermark = 'boros';	card_games
SELECT T2.language, T2.flavorText, T1.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'colorpie';	card_games
SELECT CAST(SUM(CASE WHEN convertedManaCost = 10 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards WHERE setCode IN (SELECT code FROM sets WHERE name = 'Abyssal Horror')	card_games
SELECT DISTINCT T2.setCode FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.format = 'commander';	card_games
SELECT T2.name, T2.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'abzan';	card_games
SELECT T2.language, T1.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'Azorius' GROUP BY T2.language, T1.type	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE availability LIKE '%paper%' AND hand = '3';	card_games
SELECT name FROM cards WHERE isTextless = 0;	card_games
SELECT convertedManaCost FROM cards WHERE name = 'Ancestor''s Chosen';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND (power IS NULL OR power = '*');	card_games
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL;	card_games
SELECT DISTINCT subtypes, supertypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer';	card_games
SELECT T1.purchaseUrls FROM cards AS T1 WHERE T1.promoTypes = 'bundle'	card_games
SELECT COUNT(DISTINCT artist) FROM cards WHERE borderColor = 'black' AND availability LIKE '%arena,mtgo%'	card_games
SELECT MAX(convertedManaCost) AS max_converted_mana_cost FROM cards WHERE name IN ('Serra Angel', 'Shrine Keeper');	card_games
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer';	card_games
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3;	card_games
SELECT T2.translation FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T1.name = 'Ancestor''s Chosen' AND T2.language = 'Italian'	card_games
SELECT COUNT(*) FROM foreign_data WHERE uuid IN (SELECT uuid FROM cards WHERE name = 'Angel of Mercy')	card_games
SELECT T1.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid INNER JOIN set_translations AS T3 ON T3.setCode = T1.setCode WHERE T3.translation = 'Hauptset Zehnte Edition';	card_games
SELECT EXISTS (     SELECT 1     FROM cards c     JOIN foreign_data fd ON c.uuid = fd.uuid     WHERE c.name = 'Ancestor''s Chosen'       AND fd.language = 'Korean' );	card_games
SELECT COUNT(*) FROM cards AS T1 JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T2.translation = 'Hauptset Zehnte Edition' AND T1.artist = 'Adam Rex';	card_games
SELECT T2.baseSetSize FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Hauptset Zehnte Edition'	card_games
SELECT T2.translation FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Eighth Edition' AND T2.language = 'Chinese Simplified'	card_games
SELECT EXISTS(SELECT 1 FROM cards WHERE name LIKE '%Angel of Mercy%' AND mtgoCode IS NOT NULL);	card_games
SELECT T2.releaseDate FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Ancestor''s Chosen'	card_games
SELECT T2.type FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.translation = 'Hauptset Zehnte Edition';	card_games
SELECT COUNT(DISTINCT s.id) AS set_count FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.block = 'Ice Age' AND st.language = 'Italian' AND st.translation IS NOT NULL;	card_games
SELECT T2.isForeignOnly FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Adarkar Valkyrie';	card_games
SELECT COUNT(DISTINCT s.id) FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian' AND s.baseSetSize < 100;	card_games
SELECT COUNT(*) FROM cards WHERE setCode = 'Coldsnap' AND borderColor = 'black';	card_games
SELECT T1.name FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' ORDER BY T1.convertedManaCost DESC LIMIT 1;	card_games
SELECT DISTINCT artist FROM cards WHERE artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy') AND setCode = 'Coldsnap';	card_games
SELECT * FROM cards WHERE number = 4 AND setCode = (SELECT code FROM sets WHERE name = 'Coldsnap');	card_games
SELECT COUNT(*) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.convertedManaCost > 5 AND T1.setCode = 'Coldsnap' AND (T1.power = '*' OR T2.power IS NULL)	card_games
SELECT T2.flavorText FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Ancestor''s Chosen' AND T2.language = 'Italian'	card_games
SELECT DISTINCT T2.language FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Ancestor''s Chosen' AND T2.flavorText IS NOT NULL	card_games
SELECT T2.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Ancestor''s Chosen' AND T2.language = 'German';	card_games
SELECT T2.text FROM sets AS T1 INNER JOIN foreign_data AS T2 ON T1.code = T2.set_code WHERE T1.name = 'Coldsnap' AND T2.language = 'Italian';	card_games
SELECT T2.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.setCode = 'Coldsnap' AND T2.language = 'Italian' ORDER BY T1.convertedManaCost DESC LIMIT 1	card_games
SELECT T1.date FROM rulings AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Reminisce';	card_games
SELECT CAST(COUNT(CASE WHEN convertedManaCost = 7 THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(*) FROM cards WHERE setCode IN ( SELECT code FROM sets WHERE name = 'Coldsnap' )	card_games
SELECT CAST(COUNT(CASE WHEN cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(*) FROM cards WHERE setCode = 'Coldsnap'	card_games
SELECT code FROM sets WHERE releaseDate = '2017-07-14'	card_games
SELECT keyruneCode FROM sets WHERE code = 'PKHC';	card_games
SELECT mcmId FROM sets WHERE code = 'SS2';	card_games
SELECT T1.mcmName FROM sets AS T1 JOIN foreign_data AS T2 ON T1.code = T2.set_code WHERE T1.release_date = '2017-06-09';	card_games
SELECT T2.type FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T1.name LIKE '%From the Vault: Lore%'	card_games
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized';	card_games
SELECT c.name, r.text, CASE WHEN c.hasContentWarning = 1 THEN 'Yes' ELSE 'No' END AS HasMissingOrDegradedPropertiesAndValues FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Jim Pavelec';	card_games
SELECT T1.releaseDate FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T2.name = 'Evacuation' LIMIT 1	card_games
SELECT SUM(T1.baseSetSize) AS numberOfCards FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Rinascita di Alara';	card_games
SELECT T1.type FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Huitième édition';	card_games
SELECT T1.translation FROM set_translations AS T1 INNER JOIN foreign_data AS T2 ON T1.setCode = T2.language WHERE T2.name LIKE '%Tendo Ice Bridge%'	card_games
SELECT COUNT(*) FROM set_translations WHERE setCode IN (SELECT code FROM sets WHERE name = 'Tenth Edition') AND translation IS NOT NULL;	card_games
SELECT T2.translation FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T1.name = 'Fellwar Stone' AND T2.language = 'Japanese';	card_games
SELECT T1.name FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Journey into Nyx Hero''s Path' ORDER BY T1.convertedManaCost DESC LIMIT 1;	card_games
SELECT T2.releaseDate FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.translation = 'Ola de frío';	card_games
SELECT T1.type FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T2.name = 'Samite Pilgrim'	card_games
SELECT COUNT(*) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'World Championship Decks 2004' AND T1.convertedManaCost = 3;	card_games
SELECT T2.translation FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Mirrodin' AND T2.language = 'Chinese Simplified';	card_games
SELECT CAST(SUM(CASE WHEN isNonFoilOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards WHERE uuid IN (SELECT uuid FROM foreign_data WHERE language = 'Japanese')	card_games
SELECT CAST(SUM(CASE WHEN T1.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Portuguese (Brazil)';	card_games
SELECT DISTINCT availability FROM cards WHERE artist != 'Aleksi Briclot' AND isTextless = 1;	card_games
SELECT id FROM sets ORDER BY baseSetSize DESC LIMIT 1	card_games
SELECT artist FROM cards WHERE side IS NULL ORDER BY convertedManaCost DESC LIMIT 1	card_games
SELECT frameEffects FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL GROUP BY frameEffects ORDER BY COUNT(*) DESC LIMIT 1	card_games
SELECT COUNT(*) FROM cards WHERE power IS NULL OR power = '*' AND hasFoil = 0 AND duelDeck = 'a';	card_games
SELECT id FROM sets WHERE type = 'commander' ORDER BY totalSetSize DESC LIMIT 1	card_games
SELECT c.name, c.manaCost  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE l.format = 'duel'  ORDER BY c.manaCost DESC  LIMIT 10;	card_games
SELECT MIN(T1.originalReleaseDate), GROUP_CONCAT(DISTINCT T3.format) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid INNER JOIN sets AS T3 ON T1.setCode = T3.code WHERE T1.rarity = 'mythic' AND T2.status = 'legal' ORDER BY T1.originalReleaseDate ASC LIMIT 1;	card_games
SELECT COUNT(T1.id)  FROM cards AS T1  JOIN foreign_data AS T2 ON T1.uuid = T2.uuid  WHERE T1.artist = 'Volkan Baǵa' AND T2.language = 'French';	card_games
SELECT COUNT(*) FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.rarity = 'rare' AND c.types = 'Enchantment' AND c.name = 'Abundance' AND l.status = 'Legal';	card_games
SELECT T1.format, GROUP_CONCAT(T2.name) FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.status = 'Banned' GROUP BY T1.format ORDER BY COUNT(T1.status) DESC LIMIT 1	card_games
SELECT T2.language FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Battlebond'	card_games
SELECT artist, GROUP_CONCAT(DISTINCT format) AS formats FROM cards GROUP BY artist ORDER BY COUNT(*) ASC LIMIT 1;	card_games
SELECT T3.status FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid JOIN sets AS T3 ON T2.setCode = T3.code WHERE T1.artist = 'D. Alexander Gregory' AND T1.frameVersion = '1997' AND T1.hasContentWarning = 1 AND T2.format = 'legacy';	card_games
SELECT T1.name, T2.format FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.edhrecRank = 1 AND T2.status = 'Banned';	card_games
SELECT AVG(T2.id), T1.language FROM foreign_data AS T1 INNER JOIN sets AS T2 ON T1.uuid = T2.code WHERE T2.releaseDate BETWEEN '2012-01-01' AND '2015-12-31' GROUP BY T1.language ORDER BY COUNT(T1.language) DESC LIMIT 1	card_games
SELECT artist FROM cards WHERE borderColor = 'black' AND availability = 'arena' GROUP BY artist	card_games
SELECT uuid FROM legalities WHERE format = 'oldschool' AND status IN ('banned', 'restricted');	card_games
SELECT COUNT(*)  FROM cards  WHERE artist = 'Matthew D. Wilson' AND availability LIKE '%paper%';	card_games
SELECT T2.text FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Kev Walker' ORDER BY T2.date DESC;	card_games
SELECT DISTINCT c.name, l.format FROM cards c JOIN sets s ON c.setCode = s.code JOIN legalities l ON c.uuid = l.uuid WHERE s.name = 'Hour of Devastation' AND l.status = 'Legal';	card_games
SELECT DISTINCT s.name FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Korean' AND NOT EXISTS (     SELECT 1     FROM set_translations st2     WHERE st2.setCode = s.code       AND st2.language LIKE '%Japanese%' );	card_games
SELECT T1.frameVersion, T2.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid INNER JOIN legalities AS T3 ON T1.uuid = T3.uuid WHERE T1.artist = 'Allen Williams' AND T3.status = 'Banned' GROUP BY T1.frameVersion, T2.name	card_games
SELECT DisplayName FROM users WHERE DisplayName IN ('Harlan', 'Jarrod Dixon') ORDER BY Reputation DESC LIMIT 1	codebase_community
SELECT DisplayName FROM users WHERE STRFTIME('%Y', CreationDate) = '2011';	codebase_community
SELECT COUNT(Id) AS UserCount FROM users WHERE LastAccessDate > '2014-09-01';	codebase_community
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1	codebase_community
SELECT COUNT(*) FROM users WHERE Upvotes > 100 AND Downvotes > 1;	codebase_community
SELECT COUNT(DISTINCT UserId) FROM users WHERE Views > 10 AND STRFTIME('%Y', CreationDate) > '2013';	codebase_community
SELECT COUNT(*) FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT Title FROM posts WHERE OwnerDisplayName = 'csgillespie'	codebase_community
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Title = 'Eliciting priors from experts';	codebase_community
SELECT Title FROM posts WHERE OwnerDisplayName = 'csgillespie' ORDER BY ViewCount DESC LIMIT 1;	codebase_community
SELECT T1.DisplayName FROM users AS T1 JOIN posts AS T2 ON T1.Id = T2.OwnerUserId ORDER BY T2.FavoriteCount DESC LIMIT 1	codebase_community
SELECT SUM(T2.CommentCount) AS TotalComments FROM users AS T1 JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName = 'csgillespie';	codebase_community
SELECT MAX(posts.AnswerCount) AS MostAnswers FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'csgillespie';	codebase_community
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.LastEditorUserId WHERE p.Title = 'Examples for teaching: Correlation does not mean causation' ORDER BY p.LastEditDate DESC LIMIT 1;	codebase_community
SELECT COUNT(*) AS NumberOfRootPosts FROM posts WHERE OwnerDisplayName = 'csgillespie' AND ParentId IS NULL;	codebase_community
SELECT DISTINCT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ClosedDate IS NOT NULL;	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId IN ( SELECT Id FROM users WHERE Age > 65 ) AND Score >= 20	codebase_community
SELECT T2.Location FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Title = 'Eliciting priors from experts';	codebase_community
SELECT p.Body FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'bayesian'	codebase_community
SELECT p.Body FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId ORDER BY t.Count DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'csgillespie';	codebase_community
SELECT Name FROM badges WHERE UserId IN (SELECT Id FROM users WHERE DisplayName = 'csgillespie')	codebase_community
SELECT COUNT(*) FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie') AND STRFTIME('%Y', Date) = '2011';	codebase_community
SELECT T2.DisplayName FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id GROUP BY T1.UserId, T2.DisplayName ORDER BY COUNT(T1.Id) DESC LIMIT 1;	codebase_community
SELECT AVG(posts.Score) AS AverageScore FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'csgillespie';	codebase_community
SELECT AVG(COUNT(b.Id) / COUNT(DISTINCT u.DisplayName)) AS AvgBadgesPerUser FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Views > 200;	codebase_community
SELECT CAST(SUM(CASE WHEN u.Age > 65 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(p.Id) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Score > 5	codebase_community
SELECT COUNT(*) FROM votes WHERE UserId = 58 AND CreationDate LIKE '2010-07-19%';	codebase_community
SELECT CreationDate FROM votes GROUP BY CreationDate ORDER BY COUNT(Id) DESC LIMIT 1	codebase_community
SELECT COUNT(Id) FROM badges WHERE Name = 'Revival';	codebase_community
SELECT p.Title FROM posts p JOIN comments c ON p.Id = c.PostId ORDER BY c.Score DESC LIMIT 1;	codebase_community
SELECT COUNT(c.Id) AS CommentCount FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.ViewCount = 1910;	codebase_community
SELECT p.FavoriteCount FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.UserId = 3025 AND c.CreationDate = '2014-04-23 20:29:39.0';	codebase_community
SELECT Text FROM comments WHERE PostId = 107829 AND CommentCount = 1;	codebase_community
SELECT CASE WHEN p.ClosedDate IS NULL THEN 'Not Well-Finished' ELSE 'Well-Finished' END AS PostStatus FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.UserId = 23853 AND c.CreationDate = '2013-07-12 09:08:18.0';	codebase_community
SELECT u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Id = 65041;	codebase_community
SELECT COUNT(*) FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'Tiago Pasqualini'	codebase_community
SELECT T2.DisplayName FROM votes AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Id = 6347	codebase_community
SELECT COUNT(v.Id) AS NumberOfVotes FROM posts p JOIN votes v ON p.Id = v.PostId WHERE p.Title LIKE '%data visualization%';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'DatEpicCoderGuyWhoPrograms';	codebase_community
SELECT CAST(COUNT(posts.Id) AS REAL) / COUNT(votes.Id) AS PostToVoteRatio FROM posts JOIN votes ON posts.OwnerUserId = votes.UserId AND posts.Id = votes.PostId WHERE posts.OwnerUserId = 24;	codebase_community
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer';	codebase_community
SELECT Text FROM comments WHERE Score = 17	codebase_community
SELECT DisplayName FROM users WHERE WebsiteUrl = 'http://stackoverflow.com';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'SilentGhost';	codebase_community
SELECT u.DisplayName FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text LIKE '%thank you user93%' AND c.UserId != 93;	codebase_community
SELECT Text FROM comments WHERE UserDisplayName = 'A Lion';	codebase_community
SELECT u.DisplayName, u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Title = 'Understanding what Dassault iSight is doing?'	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'How does gentle boosting differ from AdaBoost?';	codebase_community
SELECT T2.DisplayName FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Necromancer' LIMIT 10	codebase_community
SELECT u.DisplayName AS Editor FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE p.Title = 'Open source tools for visualizing multi-dimensional data';	codebase_community
SELECT Title FROM posts WHERE LastEditorDisplayName = 'Vebjorn Ljosa'	codebase_community
SELECT SUM(T1.Score), T2.WebsiteUrl FROM posts AS T1 INNER JOIN users AS T2 ON T1.LastEditorUserId = T2.Id WHERE T2.DisplayName = 'Yevgeny'	codebase_community
SELECT c.Text FROM comments AS c JOIN posts AS p ON c.PostId = p.Id WHERE p.Title = 'Why square the difference instead of taking the absolute value in standard deviation?'	codebase_community
SELECT SUM(T2.BountyAmount) AS TotalBountyAmount FROM posts AS T1 JOIN votes AS T2 ON T1.Id = T2.PostId WHERE T1.Title LIKE '%data%';	codebase_community
SELECT u.DisplayName FROM users u JOIN votes v ON u.Id = v.UserId JOIN posts p ON v.PostId = p.Id WHERE v.BountyAmount = 50 AND p.Title LIKE '%variance%'	codebase_community
SELECT AVG(posts.ViewCount) AS AvgViewCount, posts.Title, comments.Text FROM posts JOIN comments ON posts.Id = comments.PostId WHERE posts.Tags LIKE '%<humor>%';	codebase_community
SELECT COUNT(*) FROM comments WHERE UserId = 13;	codebase_community
SELECT UserId FROM users ORDER BY Reputation DESC LIMIT 1;	codebase_community
SELECT UserId FROM posts ORDER BY Views ASC LIMIT 1	codebase_community
SELECT COUNT(UserId) FROM badges WHERE Name = 'Supporter' AND STRFTIME('%Y', Date) = '2011';	codebase_community
SELECT COUNT(UserId) AS NumberOfUsersWithMoreThanFiveBadges FROM badges GROUP BY UserId HAVING COUNT(Name) > 5;	codebase_community
SELECT COUNT(DISTINCT u.Id) AS NumberOfUsers FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'New York' AND b.Name IN ('Teacher', 'Supporter') GROUP BY u.Id HAVING COUNT(DISTINCT b.Name) = 2;	codebase_community
SELECT u.DisplayName, u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Id = 1;	codebase_community
SELECT u.UserId FROM users u JOIN posts p ON u.Id = p.OwnerUserId JOIN postHistory ph ON p.Id = ph.PostId WHERE p.Views >= 1000 GROUP BY u.UserId HAVING COUNT(DISTINCT ph.PostId) = 1;	codebase_community
SELECT u.DisplayName, b.Name AS BadgeName FROM users u JOIN (     SELECT UserId, COUNT(Id) AS CommentCount     FROM comments     GROUP BY UserId     ORDER BY CommentCount DESC     LIMIT 1 ) c ON u.Id = c.UserId LEFT JOIN badges b ON u.Id = b.UserId;	codebase_community
SELECT COUNT(DISTINCT u.Id) AS NumberOfUsers FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'India' AND b.Name = 'Teacher';	codebase_community
SELECT      ((SUM(CASE WHEN STRFTIME('%Y', Date) = '2010' THEN 1 ELSE 0 END) / COUNT(*)) * 100 -       (SUM(CASE WHEN STRFTIME('%Y', Date) = '2011' THEN 1 ELSE 0 END) / COUNT(*)) * 100) AS percentage_difference FROM      badges WHERE      Name = 'Student';	codebase_community
SELECT DISTINCT PostHistoryTypeId, COUNT(DISTINCT UserId) FROM postHistory WHERE PostId = 3720	codebase_community
SELECT p.Id, p.Title, p.ViewCount AS Popularity FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.RelatedPostId = 61217;	codebase_community
SELECT Score, LinkTypeId FROM postLinks WHERE PostId = 395;	codebase_community
SELECT PostId, OwnerUserId FROM posts WHERE Score > 60;	codebase_community
SELECT SUM(FavoriteCount) FROM posts WHERE OwnerUserId = 686 AND CreationDate LIKE '2011%'	codebase_community
SELECT AVG(u.UpVotes) AS AvgUpVotes, AVG(u.Age) AS AvgAge FROM users u WHERE u.Id IN (     SELECT p.OwnerUserId     FROM posts p     GROUP BY p.OwnerUserId     HAVING COUNT(p.OwnerUserId) > 10 )	codebase_community
SELECT COUNT(UserId) FROM badges WHERE Name = 'Announcer';	codebase_community
SELECT Name FROM badges WHERE Date = '2010-07-19 19:39:08.0'	codebase_community
SELECT COUNT(Id) AS PositiveCommentsCount FROM comments WHERE Score > 60;	codebase_community
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:16:14.0'	codebase_community
SELECT COUNT(Id) FROM posts WHERE Score = 10;	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MAX(Reputation) FROM users) LIMIT 1;	codebase_community
SELECT U.Reputation FROM users AS U JOIN badges AS B ON U.Id = B.UserId WHERE B.Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT T1.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'Pierre'	codebase_community
SELECT DISTINCT b.Date FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Location = 'Rochester, NY';	codebase_community
SELECT CAST(COUNT(CASE WHEN Name = 'Teacher' THEN UserId ELSE NULL END) AS REAL) * 100 / COUNT(UserId) AS Percentage FROM badges;	codebase_community
SELECT CAST(SUM(CASE WHEN u.Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(b.UserId) AS PercentageOfTeenagers FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Organizer';	codebase_community
SELECT Score FROM comments WHERE CreationDate = '2010-07-19 19:19:56.0';	codebase_community
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:37:33.0';	codebase_community
SELECT u.Age FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'Vienna, Austria';	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Supporter' AND UserId IN ( SELECT Id FROM users WHERE Age BETWEEN 19 AND 65 )	codebase_community
SELECT SUM(ViewCount) AS TotalViews FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT T1.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id ORDER BY T2.Reputation ASC LIMIT 1	codebase_community
SELECT T1.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'Sharpie'	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Supporter' AND UserId IN ( SELECT Id FROM users WHERE Age > 65 )	codebase_community
SELECT DisplayName FROM users WHERE Id = 30;	codebase_community
SELECT COUNT(Id) FROM users WHERE Location = 'New York';	codebase_community
SELECT COUNT(*) FROM votes WHERE STRFTIME('%Y', CreationDate) = '2010';	codebase_community
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1	codebase_community
SELECT CAST(SUM(CASE WHEN YEAR(CreationDate) = 2010 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN YEAR(CreationDate) = 2011 THEN 1 ELSE 0 END) AS Ratio FROM votes	codebase_community
SELECT T2.TagName FROM users AS T1 INNER JOIN postlinks AS T2 ON T1.Id = T2.PostId WHERE T1.DisplayName = 'John Salvatier'	codebase_community
SELECT COUNT(*) FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'Daniel Vassallo';	codebase_community
SELECT COUNT(*) FROM users AS u JOIN votes AS v ON u.Id = v.UserId WHERE u.DisplayName = 'Harlan';	codebase_community
SELECT Id FROM posts WHERE OwnerDisplayName = 'slashnick' ORDER BY AnswerCount DESC LIMIT 1	codebase_community
SELECT DisplayName FROM posts WHERE OwnerDisplayName IN ('Harvey Motulsky', 'Noah Snyder') GROUP BY DisplayName ORDER BY SUM(ViewCount) DESC LIMIT 1	codebase_community
SELECT COUNT(*) FROM posts JOIN votes ON posts.Id = votes.PostId JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'Matt Parker' AND votes.VoteTypeId = 2 AND votes.PostId > 4;	codebase_community
SELECT COUNT(c.Id) AS NegativeCommentsCount FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON c.UserId = u.Id WHERE c.Score < 60 AND u.DisplayName = 'Neil McGuigan';	codebase_community
SELECT DISTINCT t.TagName FROM badges b JOIN users u ON b.UserId = u.Id JOIN posts p ON b.PostId = p.Id JOIN postlinks pl ON p.Id = pl.PostId JOIN tags t ON pl.RelatedPostId = t.Id WHERE u.DisplayName = 'Mark Meckes' AND p.CommentCount = 0;	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Organizer' GROUP BY u.DisplayName;	codebase_community
SELECT CAST(SUM(CASE WHEN T3.TagName = 'r' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.Id) AS percentage FROM posts AS T1 INNER JOIN posthistory AS T2 ON T1.Id = T2.PostId INNER JOIN tags AS T3 ON T1.Tags LIKE '%' || T3.TagName || '%' WHERE T1.OwnerDisplayName = 'Community';	codebase_community
SELECT      (SUM(CASE WHEN p.OwnerDisplayName = 'Mornington' THEN p.ViewCount ELSE 0 END) -      SUM(CASE WHEN p.OwnerDisplayName = 'Amos' THEN p.ViewCount ELSE 0 END)) AS ViewCountDifference FROM      posts p;	codebase_community
SELECT COUNT(UserId) FROM badges WHERE Name = 'Commentator' AND STRFTIME('%Y', Date) = '2014';	codebase_community
SELECT COUNT(*) FROM posts WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59';	codebase_community
SELECT DisplayName, Age FROM users ORDER BY Views DESC LIMIT 1	codebase_community
SELECT LastEditDate, LastEditorUserId FROM posts WHERE Title = 'Detecting a given face in a database of facial images';	codebase_community
SELECT COUNT(Id) FROM comments WHERE UserId = 13 AND Score < 60;	codebase_community
SELECT p.Title, c.UserDisplayName FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.Score > 60;	codebase_community
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.Location = 'North Pole' AND STRFTIME('%Y', T2.Date) = '2011'	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.FavoriteCount > 150;	codebase_community
SELECT COUNT(postHistory.Id) AS PostHistoryCounts, MAX(posts.LastEditDate) AS LastEditDate FROM posts JOIN postHistory ON posts.Id = postHistory.PostId WHERE posts.Title = 'What is the best introductory Bayesian statistics textbook?'	codebase_community
SELECT u.LastAccessDate, u.Location FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Outliers' ORDER BY u.LastAccessDate DESC;	codebase_community
SELECT p.Title FROM posts p JOIN postlinks pl ON p.Id = pl.PostId WHERE p.Title = 'How to tell if something happened in a data set which monitors a value over time';	codebase_community
SELECT p.Id AS PostID, b.Name AS BadgeName FROM badges b JOIN users u ON b.UserId = u.Id JOIN posts p ON b.PostId = p.Id WHERE u.DisplayName = 'Samuel' AND STRFTIME('%Y', b.Date) = '2013';	codebase_community
SELECT OwnerDisplayName FROM posts ORDER BY ViewCount DESC LIMIT 1;	codebase_community
SELECT u.DisplayName, u.Location FROM users u JOIN posts p ON u.Id = p.OwnerUserId JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'hypothesis-testing' LIMIT 1;	codebase_community
SELECT p.Title, pl.LinkTypeId FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE p.Title = 'What are principal component scores?'	codebase_community
SELECT UserDisplayName FROM posts WHERE Id = (SELECT ParentId FROM posts ORDER BY Score DESC LIMIT 1)	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM users u JOIN votes v ON u.Id = v.UserId WHERE v.VoteTypeId = 8 ORDER BY v.BountyAmount DESC LIMIT 1;	codebase_community
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5	codebase_community
SELECT COUNT(*) AS TagCount FROM tags WHERE Count BETWEEN 5000 AND 7000;	codebase_community
SELECT OwnerUserId FROM posts ORDER BY FavoriteCount DESC LIMIT 1	codebase_community
SELECT Age FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT COUNT(DISTINCT p.Id) FROM posts p JOIN votes v ON p.Id = v.PostId WHERE STRFTIME('%Y', p.CreaionDate) = '2011' AND v.BountyAmount = 50;	codebase_community
SELECT Id FROM users ORDER BY Age ASC LIMIT 1;	codebase_community
SELECT SUM(Score) FROM posts WHERE LasActivityDate LIKE '2010-07-19%'	codebase_community
SELECT AVG(CASE WHEN STRFTIME('%Y', CreationDate) = '2010' AND AnswerCount <= 2 THEN 1 ELSE 0 END) / 12 AS AvgMonthlyLinksCreated FROM postLinks;	codebase_community
SELECT PostId FROM votes WHERE UserId = 1465 ORDER BY FavoriteCount DESC LIMIT 1	codebase_community
SELECT p.Title FROM posts p JOIN postlinks pl ON p.Id = pl.PostId ORDER BY p.CreationDate ASC LIMIT 1;	codebase_community
SELECT T2.DisplayName FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id GROUP BY T2.DisplayName ORDER BY COUNT(T1.Name) DESC LIMIT 1	codebase_community
SELECT MIN(CreationDate) FROM votes WHERE UserId IN (SELECT Id FROM users WHERE DisplayName = 'chl')	codebase_community
SELECT MIN(p.CreationDate) AS FirstPostDate FROM posts p JOIN users u ON p.OwnerUserId = u.Id ORDER BY u.Age ASC LIMIT 1;	codebase_community
SELECT T1.UserDisplayName FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T2.Name = 'Autobiographer' ORDER BY T2.Date ASC LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT u.Id) AS UserCount FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE u.Location = 'United Kingdom' AND p.FavoriteCount >= 4;	codebase_community
SELECT AVG(T2.PostId) AS AvgPostsVotedByOldestUsers FROM users AS T1 JOIN votes AS T2 ON T1.Id = T2.UserId WHERE T1.Age = (SELECT MAX(Age) FROM users);	codebase_community
SELECT DisplayName FROM users ORDER BY Reputation DESC LIMIT 1;	codebase_community
SELECT COUNT(Id) FROM users WHERE Reputation > 2000 AND Views > 1000;	codebase_community
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT COUNT(*)  FROM posts  WHERE OwnerDisplayName = 'Jay Stevens' AND STRFTIME('%Y', CreationDate) = '2010';	codebase_community
SELECT Id, Title FROM posts WHERE OwnerDisplayName = 'Harvey Motulsky' ORDER BY ViewCount DESC LIMIT 1	codebase_community
SELECT Id, Title FROM posts ORDER BY Score DESC LIMIT 1	codebase_community
SELECT AVG(Score) FROM posts WHERE OwnerDisplayName = 'Stephen Turner'	codebase_community
SELECT DISTINCT u.DisplayName FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE p.ViewCount > 20000 AND STRFTIME('%Y', p.CreaionDate) = '2011'	codebase_community
SELECT Id, OwnerDisplayName FROM posts WHERE CreationDate LIKE '2010%' ORDER BY FavoriteCount DESC LIMIT 1	codebase_community
SELECT CAST(SUM(CASE WHEN YEAR(posts.CreationDate) = 2011 AND users.Reputation > 1000 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(posts.Id) AS Percentage FROM posts JOIN users ON posts.OwnerUserId = users.Id;	codebase_community
SELECT CAST(SUM(CASE WHEN Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(Id) FROM users	codebase_community
SELECT SUM(p.ViewCount) AS TotalViews, u.DisplayName AS LastPoster FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Text = 'Computer Game Datasets' ORDER BY p.LasActivityDate DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts);	codebase_community
SELECT COUNT(*) FROM comments WHERE PostId = (SELECT Id FROM posts ORDER BY Score DESC LIMIT 1)	codebase_community
SELECT COUNT(Id) AS NumberOfPosts FROM posts WHERE ViewCount > 35000 AND CommentCount = 0;	codebase_community
SELECT u.DisplayName, u.Location FROM users u JOIN posts p ON u.Id = p.LastEditorUserId WHERE p.Id = 183 ORDER BY p.LastEditDate DESC LIMIT 1;	codebase_community
SELECT Name  FROM badges  WHERE UserId IN (     SELECT Id      FROM users      WHERE DisplayName = 'Emmett' )  ORDER BY Date DESC  LIMIT 1;	codebase_community
SELECT COUNT(*) AS NumberOfAdultUsersWithOver5000Upvotes FROM users WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000;	codebase_community
SELECT julianday(b.Date) - julianday(u.CreationDate) AS days_to_get_badge FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Zolomon' LIMIT 1;	codebase_community
SELECT u.Id AS UserId, COUNT(p.Id) AS PostCount, COUNT(c.Id) AS CommentCount FROM users u LEFT JOIN posts p ON u.Id = p.OwnerUserId LEFT JOIN comments c ON u.Id = c.UserId WHERE u.CreationDate = (SELECT MAX(CreationDate) FROM users) GROUP BY u.Id;	codebase_community
SELECT TOP 10 c.Text, u.UserDisplayName FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON c.UserId = u.Id WHERE p.Title = 'Analysing wind data with R' ORDER BY c.CreationDate DESC;	codebase_community
SELECT COUNT(UserId) FROM badges WHERE Name = 'Citizen Patrol'	codebase_community
SELECT COUNT(DISTINCT p.Id) FROM posts p JOIN post_tags pt ON p.Id = pt.PostId JOIN tags t ON pt.TagId = t.Id WHERE t.TagName = 'careers'	codebase_community
SELECT Reputation, ViewCount FROM users WHERE DisplayName = 'Jarrod Dixon'	codebase_community
SELECT      COUNT(CASE WHEN p.PostTypeId = 1 THEN c.Id ELSE NULL END) AS Comments,     COUNT(CASE WHEN p.PostTypeId = 2 THEN c.Id ELSE NULL END) AS Answers FROM      posts p JOIN      comments c ON p.Id = c.PostId WHERE      p.Title = 'Clustering 1D data';	codebase_community
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat'	codebase_community
SELECT COUNT(PostId) FROM votes WHERE BountyAmount >= 30;	codebase_community
SELECT CAST(SUM(CASE WHEN p.Score > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(p.Id) FROM posts p JOIN users u ON p.OwnerUserId = u.Id ORDER BY u.Reputation DESC LIMIT 1	codebase_community
SELECT COUNT(*) FROM posts WHERE Score < 20;	codebase_community
SELECT COUNT(*) FROM tags WHERE Id < 15 AND Count <= 20;	codebase_community
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample'	codebase_community
SELECT u.Reputation, u.UpVotes FROM users AS u JOIN comments AS c ON u.Id = c.UserId WHERE c.Text LIKE 'fine, you win :)'	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title LIKE '%linear regression%';	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ViewCount BETWEEN 100 AND 150 ORDER BY c.Score DESC LIMIT 1	codebase_community
SELECT u.CreationDate, u.Age  FROM users u  JOIN comments c ON u.Id = c.UserId  WHERE c.Text LIKE '%http://%';	codebase_community
SELECT COUNT(DISTINCT c.PostId) AS PostCount FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.Score = 0 AND p.ViewCount < 5;	codebase_community
SELECT COUNT(*) AS NumberOfPosts FROM posts WHERE CommentCount = 1 AND Id IN (     SELECT PostId     FROM comments     WHERE Score = 0 );	codebase_community
SELECT COUNT(DISTINCT u.Id) AS TotalUsers FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Score = 0 AND u.Age = 40;	codebase_community
SELECT p.Id AS PostID, c.Text AS Comment FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Title = 'Group differences on a five point Likert item'	codebase_community
SELECT u.UpVotes FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'R is also lazy evaluated.';	codebase_community
SELECT Text FROM comments WHERE UserDisplayName = 'Harvey Motulsky';	codebase_community
SELECT DISTINCT UserDisplayName FROM comments WHERE Score BETWEEN 1 AND 5 AND DownVotes = 0	codebase_community
SELECT CAST(SUM(CASE WHEN u.UpVotes = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(u.Id) FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Score BETWEEN 5 AND 10	codebase_community
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.superhero_name = '3-D Man'	superhero
SELECT COUNT(*) FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE sp.power_name = 'Super Strength';	superhero
SELECT COUNT(*) FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE sp.power_name = 'Super Strength' AND s.height_cm > 200;	superhero
SELECT T1.full_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id GROUP BY T1.id HAVING COUNT(T2.power_id) > 15	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Blue'	superhero
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.skin_colour_id WHERE T2.superhero_name = 'Apocalypse'	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id INNER JOIN colour AS T4 ON T1.eye_colour_id = T4.id WHERE T4.colour = 'Blue' AND T3.power_name = 'Agility'	superhero
SELECT superhero_name FROM superhero WHERE eye_colour_id IN ( SELECT id FROM colour WHERE colour = 'Blue' ) AND hair_colour_id IN ( SELECT id FROM colour WHERE colour = 'Blond' )	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics'	superhero
SELECT s.superhero_name, s.height_cm FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics' ORDER BY s.height_cm DESC;	superhero
SELECT T.publisher_name FROM ( SELECT DISTINCT T1.publisher_name AS publisher_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name = 'Sauron' ) t	superhero
SELECT c.colour, COUNT(s.superhero_name) AS count FROM superhero s JOIN colour c ON s.eye_colour_id = c.id JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics' GROUP BY c.colour ORDER BY count DESC;	superhero
SELECT AVG(height_cm) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics'	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower p ON hp.power_id = p.id JOIN publisher pu ON s.publisher_id = pu.id WHERE pu.publisher_name = 'Marvel Comics' AND p.power_name = 'Super Strength';	superhero
SELECT COUNT(*) FROM superhero AS s JOIN publisher AS p ON s.publisher_id = p.id WHERE p.publisher_name = 'DC Comics';	superhero
SELECT T.publisher_name FROM ( SELECT T1.publisher_name, MIN(T3.attribute_value) AS min_speed FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id INNER JOIN hero_attribute AS T3 ON T2.id = T3.hero_id INNER JOIN attribute AS T4 ON T3.attribute_id = T4.id WHERE T4.attribute_name = 'Speed' GROUP BY T1.publisher_name ) AS T ORDER BY T.min_speed ASC LIMIT 1	superhero
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE colour.colour = 'Gold' AND publisher.publisher_name = 'Marvel Comics';	superhero
SELECT T2.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name = 'Blue Beetle II'	superhero
SELECT COUNT(*) FROM superhero WHERE hair_colour_id = (SELECT id FROM colour WHERE colour = 'Blond')	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T2.attribute_id = 1 ORDER BY T2.attribute_value ASC LIMIT 1	superhero
SELECT T2.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.superhero_name = 'Copycat'	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Durability' AND ha.attribute_value < 50;	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Death Touch'	superhero
SELECT COUNT(*) FROM superhero AS s JOIN hero_attribute AS ha ON s.id = ha.hero_id JOIN attribute AS a ON ha.attribute_id = a.id WHERE s.gender_id = 2 AND a.attribute_name = 'Strength' AND ha.attribute_value = 100;	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id GROUP BY T1.id ORDER BY COUNT(T2.power_id) DESC LIMIT 1	superhero
SELECT COUNT(*) FROM superhero WHERE race_id = ( SELECT id FROM race WHERE race = 'Vampire' )	superhero
SELECT      SUM(CASE WHEN T1.alignment = 'Bad' THEN 1 ELSE 0 END) * 100 / COUNT(T1.id) AS percentage_bad_alignment,     COUNT(CASE WHEN T1.publisher_name = 'Marvel Comics' AND T1.alignment = 'Bad' THEN 1 ELSE NULL END) AS count_marvel_bad_alignment FROM      superhero AS T1 INNER JOIN      alignment AS T2 ON T1.alignment_id = T2.id INNER JOIN      publisher AS T3 ON T1.publisher_id = T3.id;	superhero
SELECT      CASE          WHEN SUM(CASE WHEN T1.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) > SUM(CASE WHEN T1.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) THEN 'Marvel Comics'         ELSE 'DC Comics'     END AS PublisherWithMoreSuperheroes,     ABS(SUM(CASE WHEN T1.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) - SUM(CASE WHEN T1.publisher_name = 'DC Comics' THEN 1 ELSE 0 END)) AS DifferenceInSuperheroes FROM      publisher AS T1 JOIN      superhero AS T2 ON T1.id = T2.publisher_id;	superhero
SELECT id FROM publisher WHERE publisher_name = 'Star Trek'	superhero
SELECT AVG(attribute_value) FROM hero_attribute;	superhero
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL;	superhero
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.id = 75	superhero
SELECT T2.power_name FROM superhero AS T1 INNER JOIN hero_power AS T3 ON T1.id = T3.hero_id INNER JOIN superpower AS T2 ON T3.power_id = T2.id WHERE T1.superhero_name = 'Deathlok';	superhero
SELECT AVG(weight_kg) FROM superhero WHERE gender_id = (SELECT id FROM gender WHERE gender = 'Female')	superhero
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.gender_id = 1 LIMIT 5	superhero
SELECT superhero_name FROM superhero WHERE race_id = 2;	superhero
SELECT superhero_name FROM superhero WHERE height_cm BETWEEN 170 AND 190 AND eye_colour_id = 1	superhero
SELECT T2.power_name FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T1.hero_id = 56	superhero
SELECT full_name FROM superhero WHERE race_id = ( SELECT id FROM race WHERE race = 'Demi-God' ) LIMIT 5	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 2;	superhero
SELECT T2.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.weight_kg = 169	superhero
SELECT T3.colour FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id INNER JOIN colour AS T3 ON T1.hair_colour_id = T3.id WHERE T1.height_cm = 185 AND T2.race = 'Human'	superhero
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id ORDER BY T1.weight_kg DESC LIMIT 1	superhero
SELECT CAST(SUM(CASE WHEN T1.publisher_id = 13 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM superhero AS T1 WHERE T1.height_cm BETWEEN 150 AND 180	superhero
SELECT superhero_name FROM superhero WHERE gender_id = 1 AND weight_kg > ( SELECT AVG(weight_kg) * 0.79 FROM superhero )	superhero
SELECT T2.power_name FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id GROUP BY T2.power_name ORDER BY COUNT(T2.power_name) DESC LIMIT 1	superhero
SELECT T2.attribute_value FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Abomination' AND T2.attribute_id = ( SELECT id FROM attribute WHERE attribute_name = 'Intelligence' )	superhero
SELECT T2.power_name FROM superhero AS T1 INNER JOIN superpower AS T2 ON T1.id = T2.id WHERE T1.id = 1	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Stealth'	superhero
SELECT T1.full_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Strength' ORDER BY T2.attribute_value DESC LIMIT 1	superhero
SELECT CAST(SUM(IIF(T1.skin_colour_id = 1, 1, 0)) AS REAL) / COUNT(*) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.skin_colour_id = T2.id WHERE T2.colour = 'No Colour'	superhero
SELECT COUNT(superhero_name) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics')	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Dark Horse Comics' AND a.attribute_name = 'Durability' ORDER BY ha.attribute_value DESC LIMIT 1;	superhero
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.full_name = 'Abraham Sapien';	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Flight'	superhero
SELECT T1.colour AS Eyes, T2.colour AS Hair, T3.colour AS SkinColour FROM colour AS T1 JOIN superhero AS T4 ON T1.id = T4.eye_colour_id JOIN colour AS T2 ON T2.id = T4.hair_colour_id JOIN colour AS T3 ON T3.id = T4.skin_colour_id JOIN gender AS T5 ON T5.id = T4.gender_id JOIN publisher AS T6 ON T6.id = T4.publisher_id WHERE T5.gender = 'Female' AND T6.publisher_name = 'Dark Horse Comics'	superhero
SELECT T1.superhero_name, T3.publisher_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id INNER JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T1.hair_colour_id = T1.skin_colour_id AND T1.hair_colour_id = T1.eye_colour_id	superhero
SELECT T.race FROM superhero AS T WHERE T.superhero_name = 'A-Bomb' AND T.race IS NOT NULL;	superhero
SELECT CAST(COUNT(CASE WHEN T1.skin_colour_id = ( SELECT id FROM colour WHERE colour = 'Blue' ) THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(*) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.skin_colour_id = T2.id INNER JOIN gender AS T3 ON T1.gender_id = T3.id WHERE T3.gender = 'Female'	superhero
SELECT s.superhero_name, r.race FROM superhero s JOIN race r ON s.race_id = r.id WHERE s.full_name = 'Charles Chandler';	superhero
SELECT T.gender FROM gender AS T JOIN superhero AS ST ON T.id = ST.gender_id WHERE ST.superhero_name = 'Agent 13'	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Adaptation';	superhero
SELECT COUNT(*) FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id WHERE s.superhero_name = 'Amazo'	superhero
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.full_name = 'Hunter Zolomon'	superhero
SELECT T1.height_cm FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Amber'	superhero
SELECT s.superhero_name FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.colour = 'Black' AND s.hair_colour_id = ( SELECT id FROM colour WHERE colour = 'Black' )	superhero
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.skin_colour_id = T2.id WHERE T2.colour = 'Gold'	superhero
SELECT full_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Vampire')	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T2.alignment = 'Neutral'	superhero
SELECT COUNT(*) FROM hero_attribute WHERE attribute_value = ( SELECT MAX(attribute_value) FROM hero_attribute WHERE attribute_id = ( SELECT id FROM attribute WHERE attribute_name = 'Strength' ) )	superhero
SELECT T1.race, T2.alignment FROM race AS T1 INNER JOIN alignment AS T2 ON T1.id = T2.id INNER JOIN superhero AS T3 ON T1.id = T3.race_id AND T2.id = T3.alignment_id WHERE T3.superhero_name = 'Cameron Hicks'	superhero
SELECT CAST(COUNT(CASE WHEN T1.gender = 'Female' AND T2.publisher_name = 'Marvel Comics' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T2.publisher_name = 'Marvel Comics') FROM gender AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.gender_id INNER JOIN publisher AS T3 ON T2.publisher_id = T3.id	superhero
SELECT AVG(weight_kg) FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Alien')	superhero
SELECT (SUM(CASE WHEN full_name = 'Emil Blonsky' THEN weight_kg ELSE 0 END) - SUM(CASE WHEN full_name = 'Charles Chandler' THEN weight_kg ELSE 0 END)) AS weight_difference FROM superhero	superhero
SELECT AVG(height_cm) FROM superhero GROUP BY superhero_name	superhero
SELECT T2.power_name FROM superhero AS T1 INNER JOIN hero_power AS T3 ON T1.id = T3.hero_id INNER JOIN superpower AS T2 ON T3.power_id = T2.id WHERE T1.superhero_name = 'Abomination'	superhero
SELECT COUNT(*) FROM superhero WHERE race_id = 21 AND gender_id = 1	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Speed' ORDER BY T2.attribute_value DESC LIMIT 1	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3	superhero
SELECT a.attribute_name, ha.attribute_value FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE s.superhero_name = '3-D Man';	superhero
SELECT superhero_name FROM superhero WHERE eye_colour_id IN ( SELECT id FROM colour WHERE colour = 'Blue' ) AND hair_colour_id IN ( SELECT id FROM colour WHERE colour = 'Brown' )	superhero
SELECT T.publisher_name FROM ( SELECT DISTINCT CASE WHEN superhero_name = 'Hawkman' THEN publisher_name END AS publisher_name FROM superhero UNION SELECT DISTINCT CASE WHEN superhero_name = 'Karate Kid' THEN publisher_name END AS publisher_name FROM superhero UNION SELECT DISTINCT CASE WHEN superhero_name = 'Speedy' THEN publisher_name END AS publisher_name FROM superhero ) t WHERE t.publisher_name IS NOT NULL	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = 1;	superhero
SELECT CAST(COUNT(CASE WHEN T1.eye_colour_id = 7 THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(*) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Blue'	superhero
SELECT CAST(SUM(CASE WHEN T1.gender_id = 1 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T1.gender_id = 2 THEN 1 ELSE 0 END) FROM gender AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.gender_id	superhero
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1	superhero
SELECT id FROM superpower WHERE power_name = 'Cryokinesis'	superhero
SELECT superhero_name FROM superhero WHERE id = 294	superhero
SELECT full_name FROM superhero WHERE weight_kg IS NULL OR weight_kg = 0;	superhero
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.full_name = 'Karen Beecher-Duncan'	superhero
SELECT T2.power_name FROM superhero AS T1 INNER JOIN hero_power AS T3 ON T1.id = T3.hero_id INNER JOIN superpower AS T2 ON T3.power_id = T2.id WHERE T1.full_name = 'Helen Parr'	superhero
SELECT T1.race FROM race AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T2.weight_kg = 108 AND T2.height_cm = 188	superhero
SELECT T.publisher_name FROM publisher AS T JOIN superhero AS S ON T.id = S.publisher_id WHERE S.id = 38	superhero
SELECT r.race  FROM race r  JOIN superhero s ON r.id = s.race_id  JOIN hero_attribute ha ON s.id = ha.hero_id  WHERE ha.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute);	superhero
SELECT T1.alignment, T4.power_name FROM alignment AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.alignment_id INNER JOIN hero_power AS T3 ON T2.id = T3.hero_id INNER JOIN superpower AS T4 ON T3.power_id = T4.id WHERE T2.superhero_name = 'Atom IV'	superhero
SELECT T1.full_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Blue' LIMIT 5	superhero
SELECT AVG(T2.attribute_value) FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.alignment_id = 3	superhero
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.skin_colour_id INNER JOIN hero_attribute AS T3 ON T2.id = T3.hero_id WHERE T3.attribute_value = 100	superhero
SELECT COUNT(*) FROM superhero WHERE gender_id = 2 AND alignment_id = 1;	superhero
SELECT s.superhero_name FROM superhero AS s JOIN hero_attribute AS ha ON s.id = ha.hero_id WHERE ha.attribute_value BETWEEN 75 AND 80	superhero
SELECT T1.race FROM race AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.race_id INNER JOIN colour AS T3 ON T3.id = T2.hair_colour_id INNER JOIN gender AS T4 ON T4.id = T2.gender_id WHERE T3.colour = 'Blue' AND T4.gender = 'Male'	superhero
SELECT CAST(SUM(CASE WHEN T1.gender_id = 2 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM superhero AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T2.id = 2	superhero
SELECT SUM(CASE WHEN T2.id = 7 THEN 1 ELSE 0 END) - SUM(CASE WHEN T2.id = 1 THEN 1 ELSE 0 END) AS difference FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.weight_kg IS NULL OR T1.weight_kg = 0	superhero
SELECT T2.attribute_value FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T1.superhero_name = 'Hulk' AND T3.attribute_name = 'Strength'	superhero
SELECT T3.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.superhero_name = 'Ajax';	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.skin_colour_id = T2.id INNER JOIN alignment AS T3 ON T1.alignment_id = T3.id WHERE T2.colour = 'Green' AND T3.alignment = 'Bad'	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id INNER JOIN gender AS T3 ON T1.gender_id = T3.id WHERE T3.gender = 'Female' AND T2.publisher_name = 'Marvel Comics'	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Wind Control' ORDER BY T1.superhero_name ASC	superhero
SELECT T1.gender FROM gender AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.gender_id INNER JOIN hero_power AS T3 ON T2.id = T3.hero_id INNER JOIN superpower AS T4 ON T3.power_id = T4.id WHERE T4.power_name = 'Phoenix Force'	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'DC Comics' ORDER BY T1.weight_kg DESC LIMIT 1	superhero
SELECT AVG(s.height_cm) AS average_height FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.race != 'Human' AND p.publisher_name = 'Dark Horse Comics';	superhero
SELECT COUNT(*) AS fast_superheroes_count FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute_name = 'Speed' AND attribute_value = 100;	superhero
SELECT SUM(CASE WHEN T1.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) - SUM(CASE WHEN T1.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS difference FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id	superhero
SELECT T2.attribute_name FROM superhero AS T1 INNER JOIN attribute AS T2 ON T1.id = T2.id INNER JOIN hero_attribute AS T3 ON T1.id = T3.hero_id WHERE T1.superhero_name = 'Black Panther' ORDER BY T3.attribute_value ASC LIMIT 1	superhero
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T2.superhero_name = 'Abomination'	superhero
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1	superhero
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler'	superhero
SELECT      CAST(SUM(CASE WHEN T1.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS percentage_female_superheroes FROM      superhero AS T1 JOIN      publisher AS T2 ON T1.publisher_id = T2.id WHERE      T2.publisher_name = 'George Lucas';	superhero
SELECT CAST(COUNT(CASE WHEN T1.alignment = 'Good' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.id) FROM superhero AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T1.publisher_id = 5	superhero
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%';	superhero
SELECT hero_id FROM hero_attribute WHERE attribute_value = ( SELECT MIN(attribute_value) FROM hero_attribute )	superhero
SELECT full_name FROM superhero WHERE superhero_name = 'Alien'	superhero
SELECT full_name FROM superhero WHERE weight_kg < 100 AND eye_colour_id = (SELECT id FROM colour WHERE colour = 'Brown');	superhero
SELECT T2.attribute_value FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Aquababy' AND T2.attribute_id = ( SELECT id FROM attribute WHERE attribute_name = 'Intelligence' )	superhero
SELECT T1.weight_kg, T3.race FROM superhero AS T1 INNER JOIN race AS T3 ON T1.race_id = T3.id WHERE T1.id = 40;	superhero
SELECT AVG(height_cm) FROM superhero WHERE alignment_id = 3	superhero
SELECT superhero.id FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Intelligence'	superhero
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.superhero_name = 'Blackwulf'	superhero
SELECT T1.power_name FROM superpower AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.power_id INNER JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero)	superhero
SELECT T1.driverRef FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 20 AND T2.q1 IS NOT NULL ORDER BY T2.q1 DESC LIMIT 5;	formula_1
SELECT T1.surname FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 19 AND T2.q2 IS NOT NULL ORDER BY T2.q2 ASC LIMIT 1	formula_1
SELECT DISTINCT YEAR FROM races WHERE circuitid IN (SELECT circuitid FROM circuits WHERE LOCATION = 'Shanghai')	formula_1
SELECT T1.url FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Circuit de Barcelona-Catalunya'	formula_1
SELECT T2.name FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.country = 'Germany'	formula_1
SELECT DISTINCT T1.position FROM constructorStandings AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T2.name = 'Renault';	formula_1
SELECT COUNT(*) FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.year = 2010 AND T1.country NOT IN ('Asia', 'Europe') AND T2.name LIKE '%Grand Prix%'	formula_1
SELECT DISTINCT T1.name FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.country = 'Spain' ORDER BY T1.name ASC	formula_1
SELECT T1.lat, T1.lng FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Australian Grand Prix'	formula_1
SELECT T1.url FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Sepang International Circuit'	formula_1
SELECT T1.time FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Sepang International Circuit'	formula_1
SELECT T1.lat, T1.lng FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Abu Dhabi Grand Prix'	formula_1
SELECT T3.country FROM constructorResults AS T1 JOIN constructors AS T2 ON T1.constructorid = T2.constructorid JOIN circuits AS T3 ON T1.raceid = T3.circuitid WHERE T1.points = 1 AND T1.raceid = 24;	formula_1
SELECT q1 FROM qualifying WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Bruno' AND surname = 'Senna') AND raceId = 354;	formula_1
SELECT T1.nationality FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T2.q2 = '0:01:40' AND T2.raceid = 355;	formula_1
SELECT T1.number FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T2.q3 LIKE '1:54%' AND T2.raceid = 903;	formula_1
SELECT COUNT(*)  FROM results  JOIN races ON results.raceId = races.raceId  WHERE races.name = 'Bahrain Grand Prix' AND YEAR = 2007 AND time IS NULL;	formula_1
SELECT T1.year FROM seasons AS T1 INNER JOIN races AS T2 ON T1.year = T2.year WHERE T2.raceId = 901;	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE date = '2015-11-29') AND statusId = 1	formula_1
SELECT d.driverId, d.forename, d.surname, d.dob FROM drivers d JOIN results r ON d.driverId = r.driverId AND r.raceId = 592 WHERE r.statusId = 1 ORDER BY d.dob ASC LIMIT 1;	formula_1
SELECT d.url FROM drivers d JOIN laptimes lt ON d.driverid = lt.driverid WHERE lt.laptime LIKE '1:27%' AND lt.raceid = 161;	formula_1
SELECT d.nationality FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 933 AND r.fastestLapSpeed = ( SELECT MAX(fastestLapSpeed) FROM results WHERE raceId = 933 );	formula_1
SELECT T2.lat, T2.lng FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Malaysian Grand Prix'	formula_1
SELECT T1.url FROM constructors AS T1 JOIN constructorResults AS T2 ON T1.constructorId = T2.constructorId WHERE T2.raceId = 9 ORDER BY T2.points DESC LIMIT 1	formula_1
SELECT q1 FROM qualifying WHERE driverid = (SELECT driverid FROM drivers WHERE forename = 'Lucas' AND surname = 'di Grassi') AND raceid = 345;	formula_1
SELECT T1.nationality FROM drivers AS T1 INNER JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T2.q2 = '00:01:15' AND T2.raceid = 347	formula_1
SELECT T2.code FROM qualifying AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T1.raceid = 45 AND T1.q3 = '01:33'	formula_1
SELECT T1.time FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T1.raceid = 743 AND T2.forename = 'Bruce' AND T2.surname = 'McLaren'	formula_1
SELECT T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.position = 2 AND T2.raceid = ( SELECT raceid FROM races WHERE name = 'San Marino Grand Prix' AND YEAR = 2006 )	formula_1
SELECT T1.url FROM seasons AS T1 JOIN races AS T2 ON T1.year = T2.year WHERE T2.raceId = 901;	formula_1
SELECT COUNT(driverId) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE date = '2015-11-29') AND statusId != 1	formula_1
SELECT T1.driverid, T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 872 AND T2.statusid = 1 ORDER BY T1.dob DESC LIMIT 1	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 348 ORDER BY T2.milliseconds ASC LIMIT 1	formula_1
SELECT T1.nationality FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId ORDER BY T2.fastestLapSpeed DESC LIMIT 1	formula_1
SELECT ((SELECT T1.fastestLapSpeed FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Paul' AND T2.surname = 'di Resta' AND T1.raceId = 853) - (SELECT T1.fastestLapSpeed FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Paul' AND T2.surname = 'di Resta' AND T1.raceId = 854)) / (SELECT T1.fastestLapSpeed FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Paul' AND T2.surname = 'di Resta' AND T1.raceId = 853) * 100 AS percentage;	formula_1
SELECT CAST(SUM(CASE WHEN T2.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.driverid) AS "Race Completion Rate" FROM driverstandings AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid AND T1.driverid = T2.driverid WHERE T2.date = '1983-07-16';	formula_1
SELECT MIN(year) AS first_year FROM races WHERE name = 'Singapore Grand Prix';	formula_1
SELECT COUNT(raceId), name FROM races WHERE YEAR = 2005 ORDER BY name DESC;	formula_1
SELECT name FROM races WHERE YEAR = (SELECT MIN(YEAR) FROM races) AND MONTH = (SELECT MONTH(MIN(date)) FROM races);	formula_1
SELECT name, date FROM races WHERE year = 1999 ORDER BY round DESC LIMIT 1;	formula_1
SELECT YEAR FROM races GROUP BY YEAR ORDER BY SUM(round) DESC LIMIT 1	formula_1
SELECT DISTINCT r.name FROM races r WHERE r.year = 2017 AND r.circuitId NOT IN (SELECT circuitId FROM races WHERE year = 2000)	formula_1
SELECT circuits.country, circuits.name AS circuit, circuits.location  FROM circuits  JOIN races ON circuits.circuitid = races.circuitid  WHERE races.year = (SELECT MIN(year) FROM races WHERE name LIKE '%European%Grand%Prix')  LIMIT 1;	formula_1
SELECT MAX(r.year) AS last_season FROM races r JOIN circuits c ON r.circuitid = c.circuitid WHERE r.name = 'British Grand Prix' AND c.name = 'Brands Hatch';	formula_1
SELECT COUNT(DISTINCT T2.year) FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Silverstone' AND T2.name LIKE '%British%'	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = (SELECT raceid FROM races WHERE YEAR = 2010 AND name = 'Singapore Grand Prix') ORDER BY T2.position;	formula_1
SELECT T1.forename, T1.surname, MAX(T2.points) FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverid = T2.driverid	formula_1
SELECT D.forename, D.surname, RS.points FROM drivers AS D JOIN results AS RS ON D.driverid = RS.driverid JOIN races AS R ON RS.raceid = R.raceid WHERE R.name = 'Chinese Grand Prix' AND R.year = 2017 ORDER BY RS.points DESC LIMIT 3	formula_1
SELECT drivers.forename, drivers.surname, races.name FROM drivers JOIN laptimes ON drivers.driverid = laptimes.driverid JOIN races ON laptimes.raceid = races.raceid ORDER BY laptimes.milliseconds ASC LIMIT 1	formula_1
SELECT AVG(l.milliseconds) AS avg_lap_time FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId JOIN laptimes l ON r.raceId = l.raceId AND r.driverId = l.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND ra.name = 'Malaysian Grand Prix' AND ra.year = 2009;	formula_1
SELECT CAST(SUM(CASE WHEN T1.surname = 'Hamilton' AND T2.position > 1 THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T1.surname = 'Hamilton' THEN 1 ELSE 0 END) FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.year >= 2010;	formula_1
SELECT T1.forename, T1.surname, T1.nationality, T2.points FROM drivers AS T1 JOIN driverstandings AS T2 ON T1.driverid = T2.driverid GROUP BY T1.driverid ORDER BY COUNT(T2.wins) DESC, SUM(T2.points) DESC LIMIT 1	formula_1
SELECT MIN(YEAR(CURRENT_TIMESTAMP) - YEAR(dob)) AS age, forename, surname FROM drivers WHERE nationality = 'Japanese'	formula_1
SELECT c.circuitName FROM circuits AS c JOIN races AS r ON c.circuitId = r.circuitId WHERE r.date BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY c.circuitName HAVING COUNT(r.raceId) = 4	formula_1
SELECT c.name AS circuit_name, c.location AS location, r.name AS race_name FROM circuits c JOIN races r ON c.circuitid = r.circuitid WHERE c.country = 'USA' AND r.year = 2006;	formula_1
SELECT r.name, c.name AS circuit_name, c.location FROM races r JOIN circuits c ON r.circuitid = c.circuitid WHERE MONTH(r.date) = 9 AND YEAR(r.date) = 2005;	formula_1
SELECT DISTINCT r.name FROM races r JOIN results res ON r.raceid = res.raceid JOIN drivers d ON res.driverid = d.driverid WHERE d.forename = 'Alex' AND d.surname = 'Yoong' AND res.position < 20;	formula_1
SELECT COUNT(*)  FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN circuits c ON r.raceId = c.circuitId WHERE d.forename = 'Michael' AND d.surname = 'Schumacher' AND c.name = 'Sepang International Circuit' AND r.points = (SELECT MAX(points) FROM results WHERE driverId = d.driverId AND raceId IN (SELECT raceId FROM circuits WHERE name = 'Sepang International Circuit'));	formula_1
SELECT r.name, r.year FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.forename = 'Michael' AND d.surname = 'Schumacher' ORDER BY res.fastestLap ASC LIMIT 1;	formula_1
SELECT AVG(T1.points) FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T2.surname = 'Irvine' AND T1.year = 2000;	formula_1
SELECT MIN(r.year), dr.points FROM races r JOIN results res ON r.raceid = res.raceid JOIN drivers dr ON res.driverid = dr.driverid WHERE dr.forename = 'Lewis' AND dr.surname = 'Hamilton'	formula_1
SELECT T1.name, T2.country FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.year = 2017 ORDER BY T1.date	formula_1
SELECT T2.name, T2.year, T1.location FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid ORDER BY T2.laps DESC LIMIT 1	formula_1
SELECT CAST(SUM(CASE WHEN T1.country = 'Germany' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name LIKE '%European Grand Prix%'	formula_1
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit'	formula_1
SELECT name FROM circuits WHERE lat = ( SELECT MAX(lat) FROM circuits WHERE name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring') )	formula_1
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit'	formula_1
SELECT country FROM circuits ORDER BY alt DESC LIMIT 1;	formula_1
SELECT COUNT(driverId) FROM drivers WHERE code IS NULL;	formula_1
SELECT T1.country FROM circuits AS T1 INNER JOIN drivers AS T2 ON T1.circuitid = T2.driverid ORDER BY T2.dob ASC LIMIT 1	formula_1
SELECT surname FROM drivers WHERE nationality = 'Italian'	formula_1
SELECT url FROM drivers WHERE forename = 'Anthony' AND surname = 'Davidson';	formula_1
SELECT driverRef FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton';	formula_1
SELECT T2.name FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.year = 2009 AND T1.name = 'Spanish Grand Prix'	formula_1
SELECT DISTINCT year FROM races WHERE circuitid IN (SELECT circuitid FROM circuits WHERE name = 'Silverstone Circuit')	formula_1
SELECT T1.url FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Silverstone'	formula_1
SELECT T1.time FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.year BETWEEN 2010 AND 2019 AND T2.name = 'Abu Dhabi Circuit';	formula_1
SELECT COUNT(*) AS race_count FROM races JOIN circuits ON races.circuitid = circuits.circuitid WHERE circuits.country = 'Italy';	formula_1
SELECT T1.date FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Circuit de Barcelona-Catalunya' ORDER BY T1.date ASC	formula_1
SELECT T1.url FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.year = 2009 AND T2.name = 'Spanish Grand Prix'	formula_1
SELECT MIN(T1.fastestLapTime) AS FastestLapTime FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton';	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid ORDER BY T2.fastestlapspeed DESC LIMIT 1	formula_1
SELECT drivers.driverRef FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN races ON results.raceId = races.raceId WHERE races.name = 'Canadian Grand Prix' AND results.position = 1;	formula_1
SELECT DISTINCT T1.name FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T3.forename = 'Lewis' AND T3.surname = 'Hamilton';	formula_1
SELECT r.name FROM races r JOIN results res ON r.raceid = res.raceid JOIN drivers d ON res.driverid = d.driverid WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' ORDER BY res.rank ASC LIMIT 1;	formula_1
SELECT MAX(fastestLapSpeed) AS FastestLapSpeed FROM results JOIN races ON results.raceId = races.raceId WHERE races.name = 'Spanish Grand Prix';	formula_1
SELECT DISTINCT YEAR FROM races WHERE raceid IN ( SELECT raceid FROM results WHERE driverid = ( SELECT driverid FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton' ) ) ORDER BY YEAR ASC	formula_1
SELECT T2.positionOrder FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton' AND T3.year = 2008 AND T3.name = 'Chinese Grand Prix' ORDER BY T2.position DESC LIMIT 1;	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.grid = 4 AND T2.raceid IN (SELECT raceid FROM races WHERE year = 1989 AND name = 'Australian Grand Prix')	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId IN ( SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix' ) AND statusId = 1;	formula_1
SELECT MIN(milliseconds) AS fastest_lap_time FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races rs ON r.raceId = rs.raceId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND rs.year = 2008 AND rs.name = 'Australian Grand Prix';	formula_1
SELECT T1.time FROM results AS T1 INNER JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.year = 2008 AND T2.name = 'Chinese Grand Prix' AND T1.position = 2	formula_1
SELECT d.forename, d.surname, r.time, d.url FROM drivers d JOIN results r ON d.driverid = r.driverid JOIN races ra ON r.raceid = ra.raceid WHERE ra.year = 2008 AND ra.name = 'Australian Grand Prix' AND r.position = 1;	formula_1
SELECT COUNT(*) FROM results r JOIN drivers d ON r.driverid = d.driverid WHERE r.raceid = (SELECT raceid FROM races WHERE name = '2008 Australian Grand Prix') AND d.nationality = 'British';	formula_1
SELECT COUNT(DISTINCT r.driverId) AS driver_count FROM results r JOIN races rs ON r.raceId = rs.raceId WHERE rs.year = 2008 AND rs.name = 'Chinese Grand Prix' AND r.time IS NOT NULL;	formula_1
SELECT SUM(points) FROM results AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton';	formula_1
SELECT AVG(REPLACE(SUBSTR(T1.fastestLapTime, INSTR(T1.fastestLapTime, ':') + 1), '.', '')) / 1000 AS avgFastestLapTime FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton';	formula_1
SELECT CAST(SUM(CASE WHEN T1.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) / COUNT(*) AS completion_rate FROM laptimes AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.year = 2008 AND T2.name = 'Australian Grand Prix';	formula_1
SELECT      ((strftime('%J', SUBSTR(T1.time, -8)) - strftime('%J', '00:00:00')) -       (strftime('%J', SUBSTR(T1.time, -8)) - strftime('%J', T2.time))) /      (strftime('%J', SUBSTR(T1.time, -8)) - strftime('%J', T2.time)) * 100 AS percentage_faster FROM      results AS T1 JOIN      results AS T2 ON T2.driverid = (SELECT driverid FROM results WHERE raceid = 18 ORDER BY position DESC LIMIT 1) WHERE      T1.raceid = 18 AND T1.position = 1;	formula_1
SELECT COUNT(*) FROM circuits WHERE country = 'Australia' AND location = 'Adelaide';	formula_1
SELECT lat, lng FROM circuits WHERE country = 'USA'	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND STRFTIME('%Y', dob) > '1980';	formula_1
SELECT MAX(T1.points) FROM constructorResults AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T2.nationality = 'British'	formula_1
SELECT T2.name FROM constructorStandings AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId ORDER BY points DESC LIMIT 1	formula_1
SELECT T2.name FROM constructorstandings AS T1 JOIN constructors AS T2 ON T1.constructorid = T2.constructorid WHERE T1.raceid = 291 AND T1.points = 0	formula_1
SELECT COUNT(DISTINCT constructorId) FROM constructorStandings WHERE nationality = 'Japanese' AND points = 0 AND raceId IN ( SELECT raceId FROM constructorStandings WHERE constructorId IN ( SELECT constructorId FROM constructorStandings WHERE nationality = 'Japanese' AND points = 0 ) GROUP BY constructorId HAVING COUNT(raceId) = 2 )	formula_1
SELECT T1.name FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorid = T2.constructorid WHERE T2.position = 1	formula_1
SELECT COUNT(*) FROM constructorResults cr JOIN constructors c ON cr.constructorId = c.constructorId WHERE c.nationality = 'French' AND cr.laps > 50;	formula_1
SELECT CAST(SUM(CASE WHEN T1.time IS NOT NULL AND T2.year BETWEEN 2007 AND 2009 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.driverid) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T1.driverid IN ( SELECT driverid FROM drivers WHERE nationality = 'Japanese' )	formula_1
SELECT YEAR(r.raceId), AVG(TIME_TO_SEC(r.time)) AS avg_time_in_seconds FROM races r JOIN results res ON r.raceId = res.raceId AND res.position = 1 WHERE r.year < 1975 AND r.time IS NOT NULL GROUP BY YEAR(r.raceId) ORDER BY YEAR(r.raceId);	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE STRFTIME('%Y', T1.dob) > '1975' AND T2.rank = 2;	formula_1
SELECT COUNT(*) FROM drivers AS d JOIN results AS r ON d.driverid = r.driverid WHERE d.nationality = 'Italian' AND r.time IS NULL;	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid ORDER BY T2.milliseconds ASC LIMIT 1;	formula_1
SELECT T2.fastestLap FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 2009 AND T2.position = 1 ORDER BY T2.fastestLapTime ASC LIMIT 1	formula_1
SELECT AVG(fastestLapSpeed) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE year = 2009 AND name = 'Spanish Grand Prix');	formula_1
SELECT r.name, s.year FROM races r JOIN seasons s ON r.year = s.year JOIN results res ON r.raceid = res.raceid WHERE res.milliseconds IS NOT NULL ORDER BY res.milliseconds ASC LIMIT 1;	formula_1
SELECT CAST(SUM(CASE WHEN T1.year < 1985 AND T2.laps > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.driverId) FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.year BETWEEN 2000 AND 2005;	formula_1
SELECT COUNT(DISTINCT driverId) FROM drivers WHERE nationality = 'French' AND EXISTS (     SELECT 1 FROM laptimes WHERE driverId = drivers.driverId AND TIME < '02:00.00' );	formula_1
SELECT code FROM drivers WHERE nationality = 'American';	formula_1
SELECT raceId FROM races WHERE YEAR = 2009	formula_1
SELECT COUNT(driverId) FROM results WHERE raceId = 18;	formula_1
SELECT code FROM drivers ORDER BY dob DESC LIMIT 3; SELECT COUNT(*) FROM drivers WHERE nationality = 'Dutch' AND code IN (SELECT code FROM drivers ORDER BY dob DESC LIMIT 3);	formula_1
SELECT driverRef FROM drivers WHERE forename = 'Robert' AND surname = 'Kubica';	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND STRFTIME('%Y', dob) = '1980';	formula_1
SELECT T1.driverid ,  T1.forename ,  T1.surname FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid WHERE T1.nationality = 'German' AND STRFTIME('%Y', T1.dob) BETWEEN '1980' AND '1990' GROUP BY T1.driverid ORDER BY MIN(T2.milliseconds) ASC LIMIT 3	formula_1
SELECT driverRef FROM drivers WHERE nationality = 'German' ORDER BY dob ASC LIMIT 1	formula_1
SELECT T1.driverId, T1.code FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE STRFTIME('%Y', T1.dob) = '1971' AND T2.fastestLap IS NOT NULL ORDER BY T2.fastestLap ASC LIMIT 1	formula_1
SELECT d.forename, d.surname, MAX(l.time) AS latest_lap_time FROM drivers d JOIN laptimes l ON d.driverid = l.driverid WHERE d.nationality = 'Spanish' AND STRFTIME('%Y', d.dob) < '1982' GROUP BY d.driverid ORDER BY latest_lap_time DESC LIMIT 10;	formula_1
SELECT YEAR FROM races WHERE raceId = (SELECT raceId FROM results ORDER BY fastestLapTime ASC LIMIT 1)	formula_1
SELECT YEAR FROM races WHERE raceId = (SELECT raceId FROM results ORDER BY fastestLapSpeed DESC LIMIT 1)	formula_1
SELECT driverId FROM lapTimes WHERE lap = 1 ORDER BY time ASC LIMIT 5	formula_1
SELECT COUNT(*) FROM results WHERE raceId BETWEEN 50 AND 100 AND statusId = 2 AND TIME IS NOT NULL;	formula_1
SELECT COUNT(*) AS circuit_count, LOCATION, lat, lng FROM circuits WHERE country = 'Austria' GROUP BY LOCATION, lat, lng;	formula_1
SELECT number FROM results WHERE TIME IS NOT NULL GROUP BY number ORDER BY COUNT(*) DESC LIMIT 1	formula_1
SELECT T1.driverRef, T1.nationality, T1.dob FROM drivers AS T1 INNER JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 23 AND T2.q2 IS NOT NULL	formula_1
SELECT MIN(races.year) AS year, circuits.name AS circuit_name, races.date AS race_date, races.time AS race_time FROM drivers JOIN qualifying ON drivers.driverid = qualifying.driverid JOIN races ON qualifying.raceid = races.raceid JOIN circuits ON races.circuitid = circuits.circuitid ORDER BY drivers.dob DESC, races.date ASC LIMIT 1;	formula_1
SELECT COUNT(*) AS american_drivers_with_puncture_status FROM results JOIN driverStandings ON results.driverId = driverStandings.driverId JOIN drivers ON driverStandings.driverId = drivers.driverId JOIN status ON results.statusId = status.statusId WHERE drivers.nationality = 'American' AND status.status = 'Puncture';	formula_1
SELECT c.name, c.url FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId WHERE c.nationality = 'Italian' ORDER BY cs.points DESC LIMIT 1;	formula_1
SELECT T2.url FROM constructorStandings AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T1.wins = ( SELECT MAX(wins) FROM constructorStandings )	formula_1
SELECT d.driverid, d.forename, d.surname, l.time FROM drivers d JOIN laptimes l ON d.driverid = l.driverid AND l.raceid IN (     SELECT raceid FROM races WHERE name = 'French Grand Prix' ) AND l.lap = 3 ORDER BY l.milliseconds DESC LIMIT 1;	formula_1
SELECT r.name, lt.milliseconds AS fastest_lap_time_ms FROM races r JOIN (     SELECT raceId, MIN(milliseconds) AS min_milliseconds     FROM lapTimes     WHERE lap = 1     GROUP BY raceId ) sub ON r.raceId = sub.raceId JOIN lapTimes lt ON r.raceId = lt.raceId AND lt.lap = 1 AND lt.milliseconds = sub.min_milliseconds;	formula_1
SELECT AVG(T2.fastestLapTime) AS avg_fastest_lap_time FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.year = 2006 AND T1.name = 'United States Grand Prix' AND T2.rank < 11;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN pitstops ps ON d.driverid = ps.driverid WHERE STRFTIME('%Y', d.dob) BETWEEN '1980' AND '1985' GROUP BY d.driverid ORDER BY AVG(ps.duration) ASC LIMIT 3	formula_1
SELECT T1.forename, T1.surname, T2.time FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T3.name = 'Canadian Grand Prix' AND T3.year = 2008 AND T2.position = 1;	formula_1
SELECT T1.constructorRef, T1.url FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T3.year = 2009 AND T3.name = 'Singapore Grand Prix' ORDER BY T2.points DESC LIMIT 1	formula_1
SELECT forename, surname, dob FROM drivers WHERE nationality = 'Austrian' AND STRFTIME('%Y', dob) BETWEEN '1981' AND '1991'	formula_1
SELECT forename || ' ' || surname AS FullName, url AS WikiPediaPageLink, dob AS DateOfBirth FROM drivers WHERE nationality = 'German' AND STRFTIME('%Y', dob) BETWEEN '1971' AND '1985' ORDER BY dob DESC;	formula_1
SELECT location, country, lat, lng FROM circuits WHERE name = 'Hungaroring'	formula_1
SELECT c.constructorId, c.name, c.nationality, SUM(cr.points) AS total_points FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId JOIN races r ON cr.raceId = r.raceId WHERE r.circuitId = (SELECT circuitId FROM circuits WHERE name = 'Circuit de Monaco') AND r.year BETWEEN 1980 AND 2010 GROUP BY c.constructorId ORDER BY total_points DESC LIMIT 1;	formula_1
SELECT AVG(points) AS average_score FROM results JOIN drivers ON results.driverid = drivers.driverid JOIN races ON results.raceid = races.raceid WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.country = 'Turkey' AND races.name = 'Turkish Grand Prix';	formula_1
SELECT AVG(COUNT(*)) AS annual_average_races FROM races WHERE YEAR BETWEEN 2001 AND 2010;	formula_1
SELECT nationality FROM drivers GROUP BY nationality ORDER BY COUNT(*) DESC LIMIT 1	formula_1
SELECT SUM(wins) AS total_victories FROM driverStandings WHERE position = 91;	formula_1
SELECT r.name AS race_name FROM races r JOIN results res ON r.raceid = res.raceid ORDER BY res.fastestlaptimes ASC LIMIT 1;	formula_1
SELECT circuits.name, circuits.location || ', ' || circuits.country FROM races JOIN circuits ON races.circuitid = circuits.circuitid ORDER BY races.date DESC LIMIT 1	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid JOIN circuits AS T3 ON T3.circuitid = T2.circuitid WHERE T2.position = 1 AND T2.round = 3 AND T3.name = 'Marina Bay Street Circuit' AND YEAR(T2.date) = 2008;	formula_1
SELECT d.forename || ' ' || d.surname AS FullName, d.nationality, r.name AS RaceName FROM drivers d JOIN results res ON d.driverid = res.driverid JOIN races r ON res.raceid = r.raceid WHERE d.dob = (SELECT MIN(dob) FROM drivers) LIMIT 1;	formula_1
SELECT COUNT(*) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE name = 'Canadian Grand Prix') AND statusId = 3 GROUP BY driverId ORDER BY COUNT(*) DESC LIMIT 1	formula_1
SELECT COUNT(wins) AS wins, forename, surname FROM drivers d JOIN driverstandings ds ON d.driverid = ds.driverid ORDER BY dob ASC LIMIT 1;	formula_1
SELECT MAX(duration) AS longest_pit_stop_duration FROM pitStops;	formula_1
SELECT MIN(time) AS fastest_lap_time FROM laptimes;	formula_1
SELECT MAX(T1.duration) FROM pitstops AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton'	formula_1
SELECT lap FROM pitstops WHERE driverid = (SELECT driverid FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton') AND raceid = (SELECT raceid FROM races WHERE name = 'Australian Grand Prix' AND YEAR = 2011) ORDER BY lap ASC LIMIT 1	formula_1
SELECT D.forename, D.surname, P.duration FROM drivers AS D JOIN pitstops AS P ON D.driverid = P.driverid JOIN races AS R ON P.raceid = R.raceid WHERE R.year = 2011 AND R.name = 'Australian Grand Prix';	formula_1
SELECT MIN(T1.time) AS lap_record FROM laptimes AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton';	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid ORDER BY T2.time ASC LIMIT 20	formula_1
SELECT T2.position FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T1.surname = 'Hamilton' ORDER BY T2.fastestlaptime ASC LIMIT 1	formula_1
SELECT MIN(T1.time) AS lap_record FROM laptimes AS T1 INNER JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.name = 'Austrian Grand Prix'	formula_1
SELECT T2.time FROM circuits AS T1 INNER JOIN laptimes AS T2 ON T1.circuitid = T2.circuitid WHERE T1.country = 'Italy' ORDER BY T2.time ASC LIMIT 1	formula_1
SELECT r.name FROM races r JOIN circuits c ON r.circuitid = c.circuitid WHERE c.name = 'Austrian Grand Prix Circuit' ORDER BY MIN(l.milliseconds) LIMIT 1;	formula_1
SELECT SUM(T2.duration) FROM races AS T1 INNER JOIN pitStops AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Austrian Grand Prix' AND T2.driverId IN ( SELECT driverId FROM results WHERE raceId = T1.raceId ORDER BY time LIMIT 1 )	formula_1
SELECT T1.lat, T1.lng FROM circuits AS T1 JOIN qualifying AS T2 ON T1.circuitid = T2.circuitid WHERE T2.q1 = '1:29.488'	formula_1
SELECT AVG(milliseconds) FROM pitStops WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')	formula_1
SELECT AVG(T1.milliseconds) ,  T2.name FROM laptimes AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.country = 'Italy' GROUP BY T2.name	formula_1
SELECT player_api_id FROM Player_Attributes ORDER BY overall_rating DESC LIMIT 1	european_football_2
SELECT MAX(height), player_name FROM Player ORDER BY height DESC LIMIT 1;	european_football_2
SELECT preferred_foot FROM Player_Attributes WHERE potential = ( SELECT MIN(potential) FROM Player_Attributes )	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE overall_rating BETWEEN 60 AND 65 AND defensive_work_rate = 'Low'	european_football_2
SELECT player_api_id FROM Player_Attributes GROUP BY player_api_id ORDER BY SUM(crossing) DESC LIMIT 5	european_football_2
SELECT T2.name FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.season = '2015/2016' GROUP BY T2.name ORDER BY SUM(T1.home_team_goal + T1.away_team_goal) DESC LIMIT 1	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id WHERE T2.season = '2015/2016' AND T2.home_team_goal < T2.away_team_goal GROUP BY T1.team_long_name ORDER BY COUNT(*) ASC LIMIT 1;	european_football_2
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.penalties DESC LIMIT 10	european_football_2
SELECT T2.team_long_name FROM `Match` AS T1 INNER JOIN Team AS T2 ON T1.away_team_api_id = T2.team_api_id WHERE T1.season = '2009/2010' AND T1.away_team_goal > T1.home_team_goal GROUP BY T2.team_long_name ORDER BY COUNT(*) DESC LIMIT 1	european_football_2
SELECT T1.team_long_name, T2.buildUpPlaySpeed FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id ORDER BY T2.buildUpPlaySpeed DESC LIMIT 4;	european_football_2
SELECT l.name FROM League l JOIN Match m ON l.id = m.league_id WHERE m.season = '2015/2016' GROUP BY l.name ORDER BY SUM(CASE WHEN m.home_team_goal = m.away_team_goal THEN 1 ELSE 0 END) DESC LIMIT 1;	european_football_2
SELECT TIMESTAMPDIFF(YEAR, T1.birthday, CURRENT_DATE) AS player_age FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.sprint_speed >= 97 AND YEAR(T2.date) BETWEEN 2013 AND 2015;	european_football_2
SELECT l.name, COUNT(m.id) AS match_count FROM League l JOIN Match m ON l.id = m.league_id GROUP BY l.name ORDER BY match_count DESC LIMIT 1;	european_football_2
SELECT AVG(height) FROM Player WHERE birthday BETWEEN '1990-01-01 00:00:00' AND '1996-01-01 00:00:00'	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE date LIKE '2010%' GROUP BY player_api_id ORDER BY AVG(overall_rating) DESC LIMIT 1	european_football_2
SELECT DISTINCT team_fifa_api_id FROM Team_Attributes WHERE buildUpPlaySpeed > 50 AND buildUpPlaySpeed < 60;	european_football_2
SELECT T.team_long_name  FROM Team AS T  JOIN Team_Attributes AS TA ON T.team_api_id = TA.team_api_id  WHERE strftime('%Y', TA.date) = '2012'  AND TA.buildUpPlayPassing > (SELECT AVG(buildUpPlayPassing) FROM Team_Attributes WHERE strftime('%Y', date) = '2012') ORDER BY TA.buildUpPlayPassing DESC;	european_football_2
SELECT CAST(SUM(CASE WHEN T2.preferred_foot = 'left' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.player_fifa_api_id) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE STRFTIME('%Y', T1.birthday) BETWEEN '1987' AND '1992'	european_football_2
SELECT T1.name FROM League AS T1 INNER JOIN Match AS T2 ON T1.id = T2.league_id GROUP BY T1.id ORDER BY SUM(T2.home_team_goal + T2.away_team_goal) ASC LIMIT 5	european_football_2
SELECT AVG(T2.long_shots) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Ahmed Samir Farag'	european_football_2
SELECT P.player_name FROM Player AS P JOIN Player_Attributes AS PA ON P.player_api_id = PA.player_api_id WHERE P.height > 180 GROUP BY P.player_name ORDER BY AVG(PA.heading_accuracy) DESC LIMIT 10	european_football_2
SELECT T2.team_long_name FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlayDribblingClass = 'Normal' AND T1.date BETWEEN '2014-01-01 00:00:00' AND '2014-12-31 00:00:00' GROUP BY T2.team_long_name HAVING AVG(T1.chanceCreationPassing) > T1.chanceCreationPassing ORDER BY T1.chanceCreationPassing DESC	european_football_2
SELECT T2.name FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.season = '2009/2010' GROUP BY T2.name HAVING AVG(T1.home_team_goal) > AVG(T1.away_team_goal)	european_football_2
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers'	european_football_2
SELECT player_name FROM Player WHERE SUBSTR(birthday, 1, 7) = '1970-10';	european_football_2
SELECT DISTINCT attacking_work_rate FROM Player_Attributes WHERE player_api_id IN (SELECT player_api_id FROM Player WHERE player_name = 'Franco Zennaro')	european_football_2
SELECT T2.buildUpPlayPositioningClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'ADO Den Haag' AND T2.date LIKE '%2016%';	european_football_2
SELECT T.heading_accuracy FROM Player AS P JOIN Player_Attributes AS T ON P.player_api_id = T.player_api_id WHERE P.player_name = 'Francois Affolter' AND T.date = '2014-09-18 00:00:00'	european_football_2
SELECT AVG(overall_rating) FROM Player_Attributes WHERE strftime('%Y', date) = '2011' AND player_name = 'Gabriel Tamas'	european_football_2
SELECT COUNT(*) FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.season = '2015/2016' AND T2.name = 'Scotland Premier League'	european_football_2
SELECT preferred_foot FROM Player ORDER BY birthday DESC LIMIT 1;	european_football_2
SELECT Player.player_name, Player_Attributes.potential FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id ORDER BY Player_Attributes.potential DESC;	european_football_2
SELECT COUNT(*) FROM Player AS P JOIN Player_Attributes AS PA ON P.player_api_id = PA.player_api_id WHERE P.weight < 130 AND PA.preferred_foot = 'left' AND PA.attacking_work_rate = 'high';	european_football_2
SELECT T.team_short_name FROM Team AS T JOIN Team_Attributes AS TA ON T.team_api_id = TA.team_api_id WHERE TA.chanceCreationPassingClass = 'Risky'	european_football_2
SELECT T.defensive_work_rate FROM Player AS P JOIN Player_Attributes AS PA ON P.player_api_id = PA.player_api_id WHERE P.player_name = 'David Wilson' AND PA.date = (SELECT MAX(date) FROM Player_Attributes WHERE player_api_id = P.player_api_id)	european_football_2
SELECT T1.birthday FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.overall_rating DESC LIMIT 1	european_football_2
SELECT T1.name FROM League AS T1 INNER JOIN Country AS T2 ON T1.country_id = T2.id WHERE T2.name = 'Netherlands'	european_football_2
SELECT AVG(T1.home_team_goal) FROM Match AS T1 INNER JOIN Country AS T2 ON T1.country_id = T2.id WHERE T2.name = 'Poland' AND T1.season = '2010/2011'	european_football_2
SELECT P.player_name, AVG(PA.finishing) AS avg_finishing_rate FROM Player AS P JOIN Player_Attributes AS PA ON P.player_api_id = PA.player_api_id WHERE P.height = (     SELECT MAX(height)     FROM Player ) OR P.height = (     SELECT MIN(height)     FROM Player ) GROUP BY P.player_name ORDER BY avg_finishing_rate DESC LIMIT 1;	european_football_2
SELECT player_name FROM Player WHERE height > 180;	european_football_2
SELECT COUNT(*) FROM Player WHERE strftime('%Y', birthday) > '1990'	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Adam%' AND weight > 170	european_football_2
SELECT DISTINCT T2.player_name FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.overall_rating > 80 AND strftime('%Y', T1.date) BETWEEN '2008' AND '2010'	european_football_2
SELECT potential FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Doran') ORDER BY date DESC LIMIT 1;	european_football_2
SELECT DISTINCT Player.player_name FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE Player_Attributes.preferred_foot = 'left'	european_football_2
SELECT T.team_long_name FROM Team AS T JOIN Team_Attributes AS TA ON T.team_api_id = TA.team_api_id WHERE TA.buildUpPlaySpeedClass = 'Fast'	european_football_2
SELECT T2.buildUpPlayPassingClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_short_name = 'CLB' ORDER BY T2.date DESC LIMIT 1	european_football_2
SELECT T.team_short_name FROM Team AS T JOIN Team_Attributes AS TA ON T.team_api_id = TA.team_api_id WHERE TA.buildUpPlayPassing > 70 GROUP BY T.team_short_name ORDER BY SUM(TA.buildUpPlayPassing) DESC	european_football_2
SELECT AVG(t2.overall_rating) FROM Player AS t1 INNER JOIN Player_Attributes AS t2 ON t1.player_api_id = t2.player_api_id WHERE t1.height > 170 AND strftime('%Y', t2.date) BETWEEN '2010' AND '2015'	european_football_2
SELECT player_name FROM Player ORDER BY height ASC LIMIT 1	european_football_2
SELECT T1.name FROM Country AS T1 INNER JOIN League AS T2 ON T1.id = T2.country_id WHERE T2.name = 'Italy Serie A'	european_football_2
SELECT T.team_short_name FROM Team AS T JOIN Team_Attributes AS TA ON T.team_fifa_api_id = TA.team_fifa_api_id WHERE TA.buildUpPlaySpeed = 31 AND TA.buildUpPlayDribbling = 53 AND TA.buildUpPlayPassing = 32;	european_football_2
SELECT AVG(T2.overall_rating) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Aaron Doran'	european_football_2
SELECT COUNT(*) FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T2.name = 'Germany 1. Bundesliga' AND strftime('%Y-%m', T1.date) BETWEEN '2008-08' AND '2008-10';	european_football_2
SELECT T1.team_short_name FROM Team AS T1 INNER JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id WHERE T2.home_team_goal = 10	european_football_2
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.balance = ( SELECT MAX(balance) FROM Player_Attributes ) AND T2.potential = 61	european_football_2
SELECT (SUM(CASE WHEN T1.player_name = 'Abdou Diallo' THEN T2.ball_control ELSE 0 END) / COUNT(CASE WHEN T1.player_name = 'Abdou Diallo' THEN T2.id ELSE NULL END)) - (SUM(CASE WHEN T1.player_name = 'Aaron Appindangoye' THEN T2.ball_control ELSE 0 END) / COUNT(CASE WHEN T1.player_name = 'Aaron Appindangoye' THEN T2.id ELSE NULL END)) AS diff_avg_ball_control FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id;	european_football_2
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN';	european_football_2
SELECT player_name FROM Player WHERE player_name IN ('Aaron Lennon', 'Abdelaziz Barrada') ORDER BY birthday ASC LIMIT 1	european_football_2
SELECT player_name FROM Player ORDER BY height DESC LIMIT 1	european_football_2
SELECT COUNT(DISTINCT player_api_id) FROM Player_Attributes WHERE preferred_foot = 'left' AND attacking_work_rate = 'low'	european_football_2
SELECT T2.name FROM League AS T1 INNER JOIN Country AS T2 ON T1.country_id = T2.id WHERE T1.name = 'Belgium Jupiler League'	european_football_2
SELECT name FROM League WHERE country_id IN (SELECT id FROM Country WHERE name = 'Germany')	european_football_2
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.overall_rating DESC LIMIT 1	european_football_2
SELECT COUNT(DISTINCT T1.player_api_id) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE strftime('%Y', T1.birthday) < '1986' AND T2.defensive_work_rate = 'High'	european_football_2
SELECT P.player_name, AVG(PA.crossing) AS avg_crossing FROM Player AS P JOIN Player_Attributes AS PA ON P.player_api_id = PA.player_api_id WHERE P.player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone') GROUP BY P.player_name ORDER BY avg_crossing DESC LIMIT 1;	european_football_2
SELECT T.heading_accuracy FROM Player AS P JOIN Player_Attributes AS T ON P.player_api_id = T.player_api_id WHERE P.player_name = 'Ariel Borysiuk' ORDER BY T.date DESC LIMIT 1	european_football_2
SELECT COUNT(*) FROM Player AS P JOIN Player_Attributes AS PA ON P.player_api_id = PA.player_api_id WHERE P.height > 180 AND PA.volleys > 70;	european_football_2
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.volleys > 70 AND T2.dribbling > 70	european_football_2
SELECT COUNT(*) FROM Match AS T1 INNER JOIN Country AS T2 ON T1.country_id = T2.id WHERE T1.season = '2008/2009' AND T2.name = 'Belgium'	european_football_2
SELECT MAX(long_passing) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.birthday ASC LIMIT 1	european_football_2
SELECT COUNT(*) FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T2.name = 'Belgium Jupiler League' AND SUBSTR(T1.date, 1, 7) = '2009-04'	european_football_2
SELECT T2.name FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.season = '2008/2009' GROUP BY T2.name ORDER BY COUNT(T1.match_api_id) DESC LIMIT 1	european_football_2
SELECT AVG(T2.overall_rating) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE strftime('%Y', T1.birthday) < '1986'	european_football_2
SELECT ((AVG(CASE WHEN T1.player_name = 'Ariel Borysiuk' THEN T2.overall_rating ELSE NULL END) - AVG(CASE WHEN T1.player_name = 'Paulin Puel' THEN T2.overall_rating ELSE NULL END)) / AVG(CASE WHEN T1.player_name = 'Paulin Puel' THEN T2.overall_rating ELSE NULL END)) * 100 AS PercentageDifference FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id	european_football_2
SELECT AVG(T2.buildUpPlaySpeed) FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Heart of Midlothian'	european_football_2
SELECT AVG(T1.overall_rating) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Pietro Marino'	european_football_2
SELECT SUM(T1.crossing) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Aaron Lennox'	european_football_2
SELECT T2.chanceCreationPassing, T2.chanceCreationPassingClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Ajax' ORDER BY T2.chanceCreationPassing DESC LIMIT 1	european_football_2
SELECT T2.preferred_foot FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Abdou Diallo' GROUP BY T2.preferred_foot	european_football_2
SELECT MAX(T1.overall_rating) AS Highest_Overall_Rating FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Dorlan Pabon';	european_football_2
SELECT AVG(away_team_goal)  FROM Match  JOIN Team ON Match.away_team_api_id = Team.team_api_id  WHERE Team.team_long_name = 'Parma' AND Match.country_id = (SELECT id FROM Country WHERE name = 'Italy')	european_football_2
SELECT P.player_name FROM Player AS P JOIN Player_Attributes AS PA ON P.player_api_id = PA.player_api_id WHERE PA.overall_rating = 77 AND PA.date LIKE '2016-06-23%' ORDER BY P.birthday ASC LIMIT 1;	european_football_2
SELECT AVG(overall_rating) AS overall_rating FROM Player_Attributes JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id WHERE Player.player_name = 'Aaron Mooy' AND date LIKE '2016-02-04%'	european_football_2
SELECT potential FROM Player_Attributes WHERE player_api_id IN (SELECT player_api_id FROM Player WHERE player_name = 'Francesco Parravicini') AND date = '2010-08-30 00:00:00'	european_football_2
SELECT attacking_work_rate FROM Player_Attributes AS PA JOIN Player AS P ON PA.player_api_id = P.player_api_id WHERE P.player_name = 'Francesco Migliore' AND date LIKE '2015-05-01%'	european_football_2
SELECT T2.defensive_work_rate FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Kevin Berigaud' AND T2.date = '2013-02-22 00:00:00';	european_football_2
SELECT T1.date FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Kevin Constant' ORDER BY T1.crossing DESC LIMIT 1;	european_football_2
SELECT T2.buildUpPlaySpeedClass  FROM Team AS T1  JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id  WHERE T1.team_long_name = 'Willem II' AND T2.date = '2011-02-22';	european_football_2
SELECT T1.buildUpPlayDribblingClass FROM Team_Attributes AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id WHERE T2.date = '2015-09-10 00:00:00' AND T2.home_team_short_name = 'LEI';	european_football_2
SELECT T2.buildUpPlayPassingClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'FC Lorient' AND T2.date LIKE '2010-02-22%'	european_football_2
SELECT T1.chance_creation_passing_class FROM Team_Attributes AS T1 INNER JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id WHERE T2.date = '2013-09-20 00:00:00' AND T2.home_team_long_name = 'PEC Zwolle';	european_football_2
SELECT T2.chance_creation_crossing_class FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Hull City' AND T2.date = '2010-02-22 00:00:00';	european_football_2
SELECT T1.defenceAggressionClass FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_long_name = 'Hannover 96' AND T1.date LIKE '2015-09-10%'	european_football_2
SELECT AVG(T2.overall_rating) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Marko Arnautovic' AND SUBSTR(T2.date, 1, 10) BETWEEN '2007-02-22' AND '2016-04-21'	european_football_2
SELECT CAST((T1.overall_rating - T2.overall_rating) AS REAL) * 100 / T1.overall_rating FROM Player_Attributes AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = 505942 AND T2.player_api_id = 155782 WHERE T1.date = '2013-07-12' AND T2.date = '2013-07-12'	european_football_2
SELECT player_name FROM Player ORDER BY height DESC LIMIT 1	european_football_2
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10	european_football_2
SELECT player_name FROM Player WHERE datetime('now','localtime') - datetime(birthday) > 34 * 365	european_football_2
SELECT SUM(home_team_goal) AS total_home_goals FROM Match JOIN Player ON Match.home_player_1 = Player.player_api_id OR Match.home_player_2 = Player.player_api_id OR Match.home_player_3 = Player.player_api_id OR Match.home_player_4 = Player.player_api_id OR Match.home_player_5 = Player.player_api_id OR Match.home_player_6 = Player.player_api_id OR Match.home_player_7 = Player.player_api_id OR Match.home_player_8 = Player.player_api_id OR Match.home_player_9 = Player.player_api_id OR Match.home_player_10 = Player.player_api_id OR Match.home_player_11 = Player.player_api_id WHERE Player.player_name = 'Aaron Lennon';	european_football_2
SELECT SUM(T1.away_team_goal) FROM Match AS T1 JOIN Player AS P ON T1.away_player_1 = P.player_api_id WHERE P.player_name IN ('Daan Smith', 'Filipe Ferreira')	european_football_2
SELECT SUM(T2.home_team_goal) FROM Player AS T1 INNER JOIN Match AS T2 ON T1.player_api_id = T2.home_player_1 WHERE strftime('%Y', 'now') - strftime('%Y', T1.birthday) < 31	european_football_2
SELECT T2.player_name FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T1.overall_rating DESC LIMIT 1	european_football_2
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.potential DESC LIMIT 1	european_football_2
SELECT DISTINCT P.player_name FROM Player AS P JOIN Player_Attributes AS PA ON P.player_api_id = PA.player_api_id WHERE PA.attacking_work_rate = 'High'	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.finishing = 1 ORDER BY julianday('now') - julianday(p.birthday) DESC LIMIT 1;	european_football_2
SELECT DISTINCT T1.player_name FROM Player AS T1 JOIN Country AS T2 ON T1.nationality = T2.id WHERE T2.name = 'Belgium'	european_football_2
SELECT T3.country FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id INNER JOIN Country AS T3 ON T2.nationality = T3.id WHERE T1.vision > 89	european_football_2
SELECT T2.name FROM Player AS T1 INNER JOIN Country AS T2 ON T1.player_api_id = T2.id GROUP BY T2.id ORDER BY AVG(T1.weight) DESC LIMIT 1	european_football_2
SELECT T1.team_long_name FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeedClass = 'Slow'	european_football_2
SELECT T.team_short_name FROM Team AS T JOIN Team_Attributes AS TA ON T.team_api_id = TA.team_api_id WHERE TA.chanceCreationPassingClass = 'Safe';	european_football_2
SELECT AVG(T2.height) FROM Player AS T1 INNER JOIN Team AS T2 ON T1.player_api_id IN (T2.home_player_1, T2.home_player_2, T2.home_player_3, T2.home_player_4, T2.home_player_5, T2.home_player_6, T2.home_player_7, T2.home_player_8, T2.home_player_9, T2.home_player_10, T2.home_player_11, T2.away_player_1, T2.away_player_2, T2.away_player_3, T2.away_player_4, T2.away_player_5, T2.away_player_6, T2.away_player_7, T2.away_player_8, T2.away_player_9, T2.away_player_10, T2.away_player_11) WHERE T2.team_api_id IN ( SELECT team_api_id FROM Team WHERE team_long_name LIKE '%Italy%' )	european_football_2
SELECT player_name FROM Player WHERE height > 180 ORDER BY player_name LIMIT 3	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND birthday > '1990'	european_football_2
SELECT SUM(CASE WHEN id = 6 THEN jumping ELSE 0 END) - SUM(CASE WHEN id = 23 THEN jumping ELSE 0 END) AS difference FROM Player_Attributes	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE preferred_foot = 'right' ORDER BY potential ASC LIMIT 5	european_football_2
SELECT COUNT(DISTINCT player_api_id) FROM Player_Attributes WHERE crossing = ( SELECT MAX(crossing) FROM Player_Attributes ) AND preferred_foot = 'left'	european_football_2
SELECT CAST(SUM(CASE WHEN T1.stamina > 80 AND T1.strength > 80 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Player_Attributes AS T1	european_football_2
SELECT T1.name FROM Country AS T1 INNER JOIN League AS T2 ON T1.id = T2.country_id WHERE T2.name = 'Poland Ekstraklasa'	european_football_2
SELECT T1.home_team_goal, T1.away_team_goal FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.date LIKE '2008-09-24%' AND T2.name = 'Belgium Jupiler League'	european_football_2
SELECT T1.sprint_speed, T1.agility, T1.acceleration FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Alexis Blin';	european_football_2
SELECT buildUpPlaySpeedClass FROM Team_Attributes WHERE team_api_id = (SELECT team_api_id FROM Team WHERE team_long_name = 'KSV Cercle Brugge') ORDER BY date DESC LIMIT 1;	european_football_2
SELECT COUNT(*) FROM Match WHERE season = '2015/2016' AND league_id = (SELECT id FROM League WHERE name = 'Italy Serie A')	european_football_2
SELECT MAX(home_team_goal) AS Highest_Home_Team_Score FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Netherlands Eredivisie')	european_football_2
SELECT T2.finishing, T2.curve FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T1.weight DESC LIMIT 1;	european_football_2
SELECT T2.name FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.season = '2015/2016' GROUP BY T2.name ORDER BY COUNT(T1.id) DESC LIMIT 4	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id ORDER BY T2.away_team_goal DESC LIMIT 1	european_football_2
SELECT T2.player_name FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T1.overall_rating DESC LIMIT 1	european_football_2
SELECT CAST(SUM(CASE WHEN T1.height < 180 AND T2.overall_rating > 70 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id	european_football_2
SELECT      SUM(CASE WHEN T2.SEX = 'M' AND T2.Admission = '+' THEN 1 ELSE 0 END) * 100.0 /      SUM(CASE WHEN T2.SEX = 'M' AND T2.Admission = '-' THEN 1 ELSE 0 END) AS DeviationPercentage FROM      Examination AS T1 JOIN      Patient AS T2 ON T1.ID = T2.ID;	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN strftime('%Y', Birthday) > '1930' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(SEX) FROM Patient WHERE SEX = 'F'	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T2.Admission = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T1.Birthday) BETWEEN '1930' AND '1940';	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END) AS Ratio FROM Examination WHERE Diagnosis = 'SLE';	thrombosis_prediction
SELECT DISTINCT T1.Diagnosis, T2.Date FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Patient_ID = 30609;	thrombosis_prediction
SELECT P.SEX, P.Birthday, E.`Examination Date`, E.Symptoms FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE P.ID = '163109';	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.LDH > 500;	thrombosis_prediction
SELECT P.ID, (strftime('%Y', 'now') - strftime('%Y', P.Birthday)) AS Age FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.RVVT = '+';	thrombosis_prediction
SELECT T1.ID, T2.SEX, T1.Diagnosis FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Thrombosis = 2	thrombosis_prediction
SELECT DISTINCT P.ID FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE STRFTIME('%Y', P.Birthday) = '1937' AND L.`T-CHO` >= 250;	thrombosis_prediction
SELECT P.ID, P.SEX, P.Diagnosis FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE L.ALB < 3.5;	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T2.SEX = 'F' AND (T1.TP < 6.0 OR T1.TP > 8.5) THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.ID) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID	thrombosis_prediction
SELECT AVG(T2.aCL IgG) AS Average_IgG_Concentration FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '+' AND STRFTIME('%Y', CURRENT_TIMESTAMP) - STRFTIME('%Y', T1.Birthday) >= '50';	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) AS FemalePatients FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE P.SEX = 'F' AND STRFTIME('%Y', P.Description) = '1997' AND P.Admission = '-';	thrombosis_prediction
SELECT MIN(YEAR(`First Date`) - YEAR(Birthday)) AS Youngest_Age FROM Patient;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) AS NumberOfWomenWithSeriousThrombosisCases FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.Thrombosis = 1 AND strftime('%Y', E.`Examination Date`) = '1997' AND P.SEX = 'F';	thrombosis_prediction
SELECT MAX(STRFTIME('%Y', Birthday)) - MIN(STRFTIME('%Y', Birthday)) AS AgeGap FROM Patient WHERE ID IN ( SELECT ID FROM Laboratory WHERE TG >= 200 )	thrombosis_prediction
SELECT T1.Symptoms, T1.Diagnosis  FROM Examination AS T1  JOIN Patient AS T2 ON T1.ID = T2.ID  WHERE T1.Symptoms IS NOT NULL  ORDER BY T2.Birthday DESC  LIMIT 1;	thrombosis_prediction
SELECT AVG(COUNT(DISTINCT T1.ID)) AS Average_Male_Patients FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.Date BETWEEN '1998-01-01' AND '1998-12-31' AND T1.SEX = 'M';	thrombosis_prediction
SELECT      MIN(T1.`Examination Date`) AS Lab_Completion_Date,     TIMESTAMPDIFF(YEAR, T2.Birthday, T2.`First Date`) AS Age_At_Arrival FROM      Examination AS T1 JOIN      Patient AS T2 ON T1.ID = T2.ID WHERE      T2.Diagnosis LIKE '%SJS%' ORDER BY      T2.Birthday ASC;	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T2.SEX = 'M' AND T1.UA <= 8.0 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T2.SEX = 'F' AND T1.UA <= 6.5 THEN 1 ELSE 0 END) AS Ratio FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.UA IS NOT NULL	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) AS PatientCount FROM Patient p LEFT JOIN Examination e ON p.ID = e.ID WHERE e.`Examination Date` IS NOT NULL AND STRFTIME('%Y', e.`Examination Date`) - STRFTIME('%Y', p.`First Date`) >= 1;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) AS Underage_Patients FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE STRFTIME('%Y', P.Birthday) < '1990' AND STRFTIME('%Y', E.`Examination Date`) BETWEEN '1990' AND '1993';	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) AS Male_Patients_with_Elevated_Total_Bilirubin FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.`T-BIL` >= 2.0;	thrombosis_prediction
SELECT Diagnosis FROM Examination WHERE `Examination Date` BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY Diagnosis ORDER BY COUNT(Diagnosis) DESC LIMIT 1;	thrombosis_prediction
SELECT AVG(STRFTIME('%Y', '1999') - STRFTIME('%Y', Birthday)) AS AverageAge FROM Patient WHERE ID IN ( SELECT ID FROM Laboratory WHERE Date BETWEEN '1991-10-01' AND '1991-10-30' )	thrombosis_prediction
SELECT T2.`Examination Date`, T2.HGB, T2.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID ORDER BY T2.HGB DESC LIMIT 1	thrombosis_prediction
SELECT ANA FROM Examination WHERE ID = 3605340 AND `Examination Date` = '1996-12-02';	thrombosis_prediction
SELECT CASE WHEN T2.T-CHO < 250 THEN 'Normal' ELSE 'Not Normal' END AS Total_Cholesterol_Status FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Patient_ID = 2927464 AND T1.Date = '1995-09-04';	thrombosis_prediction
SELECT T1.SEX FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'AORTITIS' ORDER BY T2.`Examination Date` ASC LIMIT 1	thrombosis_prediction
SELECT T1.`aCL IgM` FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Description = '1994-02-19' AND T1.Diagnosis = 'SLE' AND T1.`Examination Date` = '1993-11-12';	thrombosis_prediction
SELECT P.SEX FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.GPT = 9 AND L.Date = '1992-06-12';	thrombosis_prediction
SELECT strftime('%Y', T1.Date) - strftime('%Y', T2.Birthday) AS Age FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.UA = '8.4' AND T1.Date = '1991-10-21';	thrombosis_prediction
SELECT COUNT(DISTINCT L.ID)  FROM Examination E  JOIN Patient P ON E.ID = P.ID  JOIN Laboratory L ON P.ID = L.ID  WHERE P.`First Date` = '1991-06-13' AND E.Diagnosis = 'SJS' AND YEAR(L.Date) = 1995;	thrombosis_prediction
SELECT patient.Diagnosis AS Original_Diagnose FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.Date = '1997-01-27' AND patient.Diagnosis LIKE '%SLE%' ORDER BY patient.First_Date ASC LIMIT 1;	thrombosis_prediction
SELECT T1.Symptoms FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Birthday = '1959-03-01' AND T1.`Examination Date` = '1993-09-27';	thrombosis_prediction
SELECT      SUM(CASE WHEN T1.Birthday = '1959-02-18' AND strftime('%m', T2.Date) = '11' THEN T2.`T-CHO` ELSE 0 END) AS Nov_1981_Total_Cholesterol,     SUM(CASE WHEN T1.Birthday = '1959-02-18' AND strftime('%m', T2.Date) = '12' THEN T2.`T-CHO` ELSE 0 END) AS Dec_1981_Total_Cholesterol,     (SUM(CASE WHEN T1.Birthday = '1959-02-18' AND strftime('%m', T2.Date) = '11' THEN T2.`T-CHO` ELSE 0 END) - SUM(CASE WHEN T1.Birthday = '1959-02-18' AND strftime('%m', T2.Date) = '12' THEN T2.`T-CHO` ELSE 0 END)) / SUM(CASE WHEN T1.Birthday = '1959-02-18' AND strftime('%m', T2.Date) = '12' THEN T2.`T-CHO` ELSE 0 END) AS Decrease_Rate FROM      Patient AS T1 JOIN      Laboratory AS T2 ON T1.ID = T2.ID;	thrombosis_prediction
SELECT DISTINCT T1.ID FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Description >= '1997-01-01' AND T2.Description < '1998-01-01' AND T1.Diagnosis LIKE '%Behcet%'	thrombosis_prediction
SELECT T1.ID FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.`Examination Date` BETWEEN '1987-07-06' AND '1996-01-31' AND T2.GPT > 30 AND T2.ALB < 4 GROUP BY T1.ID ORDER BY T1.ID	thrombosis_prediction
SELECT COUNT(ID) AS NumberOfPatients, ID FROM Patient WHERE SEX = 'F' AND YEAR(Birthday) = 1964 AND Admission = '+' GROUP BY ID ORDER BY ID;	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID) AS NumberOfPatients FROM Examination E WHERE E.Thrombosis = 2 AND E.ANA = 'S' AND E.`aCL IgM` > (AVG(E.`aCL IgM`) * 1.2);	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN UA <= 6.5 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Laboratory WHERE U_PRO > 0 AND U_PRO < 30;	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T1.DIAGNOSIS = 'BEHCET' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND STRFTIME('%Y', T1.`First Date`) = '1981';	thrombosis_prediction
SELECT DISTINCT P.ID, P.Description FROM Patient AS P JOIN Examination AS E ON P.ID = E.ID JOIN Laboratory AS L ON P.ID = L.ID WHERE P.Admission = '-' AND L.Date LIKE '1991-10%' AND L.T_BIL < 2.0;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient AS P  JOIN Examination AS E ON P.ID = E.ID  WHERE P.SEX = 'F'  AND P.Birthday BETWEEN '1980-01-01' AND '1989-12-31'  AND E.ANA_PATTERN != 'P';	thrombosis_prediction
SELECT P.SEX FROM Patient P JOIN Examination E ON P.ID = E.ID JOIN Laboratory L ON P.ID = L.ID WHERE E.Diagnosis = 'PSS' AND L.CRP = 2 AND L.CRE = 1 AND L.LDH = 123;	thrombosis_prediction
SELECT AVG(L.ALB) FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE P.SEX = 'F' AND L.PLT > 400 AND P.Diagnosis = 'SLE'	thrombosis_prediction
SELECT Symptoms FROM Examination WHERE Diagnosis = 'SLE' GROUP BY Symptoms ORDER BY COUNT(Symptoms) DESC LIMIT 1	thrombosis_prediction
SELECT T2.Description, T1.Diagnosis FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.ID = 48473 ORDER BY T2.Description ASC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Patient AS P JOIN Examination AS E ON P.ID = E.ID WHERE P.SEX = 'F' AND E.Diagnosis LIKE '%APS%';	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T1.`Examination Date`) = '1997' AND (T2.tp < 6 OR T2.tp > 8.5);	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T1.Diagnosis LIKE '%SLE%' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Symptoms LIKE '%thrombocytopenia%'	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T1.SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T1.Birthday) = '1980' AND T2.Diagnosis = 'RA'	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID)  FROM Examination E  JOIN Patient P ON E.ID = P.ID  WHERE P.SEX = 'M'  AND E.`Examination Date` BETWEEN '1995-01-01' AND '1997-12-31'  AND E.Diagnosis LIKE '%Behcet%'  AND P.Admission = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND T2.WBC < 3.5;	thrombosis_prediction
SELECT DATEDIFF(T1.`Examination Date`, T2.`First Date`) AS DaysBeforeEvaluation FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.ID = 821298 ORDER BY T1.`Examination Date` ASC LIMIT 1	thrombosis_prediction
SELECT CASE WHEN UA > 8.0 AND SEX = 'M' OR UA > 6.5 AND SEX = 'F' THEN 'Yes' ELSE 'No' END AS "Within Normal Range" FROM Examination JOIN Laboratory ON Examination.ID = Laboratory.ID WHERE Examination.ID = 57266;	thrombosis_prediction
SELECT T1.`Examination Date` FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.ID = 48473 AND T2.GOT >= 60 ORDER BY T1.`Examination Date` DESC;	thrombosis_prediction
SELECT P.SEX, P.Birthday FROM Patient P JOIN Examination E ON P.ID = E.ID JOIN Laboratory L ON P.ID = L.ID WHERE L.GOT < 60 AND strftime('%Y', L.Date) = '1994';	thrombosis_prediction
SELECT DISTINCT L.ID FROM Laboratory AS L JOIN Examination AS E ON L.ID = E.ID JOIN Patient AS P ON L.ID = P.ID WHERE P.SEX = 'M' AND E.Diagnosis LIKE '%ALT%' AND L.GPT >= 60;	thrombosis_prediction
SELECT T2.Diagnosis FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.GPT > 60 ORDER BY T2.`Examination Date`;	thrombosis_prediction
SELECT AVG(LDH) FROM Laboratory WHERE LDH < 500	thrombosis_prediction
SELECT P.ID, TIMESTAMPDIFF(YEAR, P.Birthday, CURRENT_TIMESTAMP) AS Age FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.LDH BETWEEN 600 AND 800;	thrombosis_prediction
SELECT P.Admission FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.ALP < 300;	thrombosis_prediction
SELECT P.ID, L.ALP FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.Birthday = '1982-04-01' AND L.ALP < 300;	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.TP < 6.0;	thrombosis_prediction
SELECT P.ID, L.TP, (L.TP - 8.5) AS Deviation FROM Laboratory L INNER JOIN Patient P ON L.ID = P.ID WHERE P.SEX = 'F' AND L.TP > 8.5;	thrombosis_prediction
SELECT P.ID, P.Birthday FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.SEX = 'M' AND (L.ALB <= 3.5 OR L.ALB >= 5.5) ORDER BY P.Birthday DESC	thrombosis_prediction
SELECT P.ID, CASE WHEN L.ALB BETWEEN 3.5 AND 5.5 THEN 'Yes' ELSE 'No' END AS Albumin_Normal_Range FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE STRFTIME('%Y', P.Birthday) = '1982';	thrombosis_prediction
SELECT      SUM(CASE WHEN T1.SEX = 'F' AND T2.UA > 6.5 THEN 1 ELSE 0 END) * 100.0 / COUNT(T1.ID) AS Percentage FROM      Patient AS T1 JOIN      Laboratory AS T2 ON T1.ID = T2.ID;	thrombosis_prediction
SELECT AVG(L.UA) AS Average_UA_Index FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE (L.UA < 8.0 AND P.SEX = 'M') OR (L.UA < 6.5 AND P.SEX = 'F') ORDER BY L.Date DESC;	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.UN = 29	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday FROM Patient AS P JOIN Examination AS E ON P.ID = E.ID JOIN Laboratory AS L ON P.ID = L.ID WHERE E.Diagnosis = 'RA' AND L.UN < 30;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) AS NumberOfMalePatientsWithCreatinineOutOfNormalRange FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'M' AND e.CRE >= 1.5;	thrombosis_prediction
SELECT SUM(CASE WHEN T1.SEX = 'M' AND T2.CRE >= 1.5 THEN 1 ELSE 0 END) > SUM(CASE WHEN T1.SEX = 'F' AND T2.CRE >= 1.5 THEN 1 ELSE 0 END) AS Result FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday, L.[T-BIL] AS Highest_Bilirubin_Level FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE L.[T-BIL] = (SELECT MAX([T-BIL]) FROM Laboratory);	thrombosis_prediction
SELECT SEX ,  GROUP_CONCAT(DISTINCT ID) FROM Laboratory WHERE T_BIL >= 2.0 GROUP BY SEX	thrombosis_prediction
SELECT P.ID, L.T_cho FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID ORDER BY P.Birthday ASC, L.T_cho DESC LIMIT 1;	thrombosis_prediction
SELECT AVG(DIVIDE(SUM(YEAR(CURRENT_DATE()) - YEAR(Birthday)), COUNT(ID))) AS AverageAge FROM Patient P JOIN Examination E ON P.ID = E.ID JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.`T-CHO` >= 250;	thrombosis_prediction
SELECT DISTINCT P.ID, P.Description, E.Diagnosis FROM Patient AS P JOIN Examination AS E ON P.ID = E.ID JOIN Laboratory AS L ON P.ID = L.ID WHERE L.TG > 300;	thrombosis_prediction
SELECT COUNT(DISTINCT T2.ID)  FROM Laboratory AS T1  JOIN Patient AS T2 ON T1.ID = T2.ID  WHERE T1.TG >= 200 AND strftime('%Y', 'now') - strftime('%Y', T2.Birthday) > 50;	thrombosis_prediction
SELECT DISTINCT T1.ID FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '-' AND T2.CPK < 250	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID)  FROM Laboratory AS T1  INNER JOIN Patient AS T2 ON T1.ID = T2.ID  WHERE STRFTIME('%Y', T2.Birthday) BETWEEN '1936' AND '1956'  AND T2.SEX = 'M'  AND T1.CPK >= 250;	thrombosis_prediction
SELECT P.ID, P.SEX, strftime('%Y', 'now') - strftime('%Y', P.Birthday) AS Age FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GLU >= 180 AND L.`T-CHO` < 250;	thrombosis_prediction
SELECT P.ID, L.GLU FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE STRFTIME('%Y', P.Description) = '1991' AND L.GLU IS NOT NULL AND L.GLU < 180;	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday FROM Examination E JOIN Laboratory L ON E.ID = L.ID JOIN Patient P ON E.ID = P.ID WHERE L.WBC <= 3.5 OR L.WBC >= 9.0 GROUP BY P.SEX ORDER BY TIMESTAMPDIFF(YEAR, P.Birthday, CURRENT_DATE) ASC;	thrombosis_prediction
SELECT T1.ID, T1.Age, T2.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.RBC < 3.5	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday, L.RBC, P.Admission FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.SEX = 'F' AND STRFTIME('%Y', 'now') - STRFTIME('%Y', P.Birthday) >= 50 AND (L.RBC <= 3.5 OR L.RBC >= 6.0)	thrombosis_prediction
SELECT DISTINCT P.ID, P.SEX FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.Admission = '-' AND L.HGB < 10;	thrombosis_prediction
SELECT P.ID, P.SEX FROM Patient P JOIN Examination E ON P.ID = E.ID JOIN Laboratory L ON P.ID = L.ID WHERE E.Diagnosis = 'SLE' AND L.HGB BETWEEN 10 AND 17 ORDER BY P.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT P.ID, (strftime('%Y', 'now') - strftime('%Y', P.Birthday)) AS Age FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.HCT >= 52 GROUP BY P.ID HAVING COUNT(L.ID) > 2;	thrombosis_prediction
SELECT AVG(HCT) FROM Laboratory WHERE Date LIKE '1991%' AND HCT < 29;	thrombosis_prediction
SELECT      SUM(CASE WHEN T2.PLT < 100 THEN 1 ELSE 0 END) - SUM(CASE WHEN T2.PLT > 400 THEN 1 ELSE 0 END) AS Calculation FROM      Examination AS T1 INNER JOIN      Laboratory AS T2 ON T1.ID = T2.ID WHERE      T2.PLT IS NOT NULL AND (T2.PLT <= 100 OR T2.PLT >= 400);	thrombosis_prediction
SELECT DISTINCT P.ID, P.First_Name, P.Last_Name FROM Patient AS P JOIN Examination AS E ON P.ID = E.ID JOIN Laboratory AS L ON P.ID = L.ID WHERE STRFTIME('%Y', E.`Examination Date`) = '1984' AND strftime('%Y', 'now') - strftime('%Y', P.Birthday) < 50 AND L.PLT BETWEEN 100 AND 400;	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T2.SEX = 'F' AND T1.PT >= 14 THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T1.PT >= 14 THEN 1 ELSE 0 END) AS Percentage FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', CURRENT_TIMESTAMP) - STRFTIME('%Y', T2.Birthday) > 55;	thrombosis_prediction
SELECT DISTINCT P.ID FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE YEAR(P.`First Date`) > 1992 AND L.PT < 14;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE `Examination Date` > '1997-01-01' AND APTT IS NOT NULL AND APTT >= 45;	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.APTT > 45 AND T1.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID)  FROM Patient AS T1  JOIN Laboratory AS T2 ON T1.ID = T2.ID  WHERE T1.SEX = 'M'  AND T2.WBC BETWEEN 3.5 AND 9.0  AND (T2.FG <= 150 OR T2.FG >= 450);	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) AS NumberOfPatients FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Birthday > '1980-01-01' AND L.FG < 150 OR L.FG > 450;	thrombosis_prediction
SELECT DISTINCT T1.Diagnosis FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.`U-PRO` >= 30;	thrombosis_prediction
SELECT DISTINCT P.ID FROM Patient AS P JOIN Examination AS E ON P.ID = E.ID WHERE E.`U-PRO` BETWEEN 0 AND 30 AND E.Diagnosis = 'SLE';	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE IGG >= 2000;	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID) AS Number_of_Patients FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE E.Symptoms IS NOT NULL AND L.IGG BETWEEN 900 AND 2000;	thrombosis_prediction
SELECT P.Diagnosis FROM Patient AS P JOIN Examination AS E ON P.ID = E.ID WHERE E.IgA BETWEEN 80 AND 500 ORDER BY E.IgA DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) AS PatientCount FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.`aCL IgA` BETWEEN 80 AND 500 AND STRFTIME('%Y', p.`First Date`) >= '1990';	thrombosis_prediction
SELECT Diagnosis FROM Examination WHERE IGM <= 40 OR IGM >= 400 GROUP BY Diagnosis ORDER BY COUNT(Diagnosis) DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) AS PatientCount FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.CRP = '+' AND P.Description IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) AS NumberOfPatients FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.CRE >= 1.5 AND TIMESTAMPDIFF(YEAR, p.Birthday, CURDATE()) < 70;	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) AS PatientCount FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.RF IN ('-', '+-') AND T1.KCT = '+';	thrombosis_prediction
SELECT DISTINCT T1.Diagnosis FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Birthday >= '1985-01-01' AND T1.RF IN ('-', '+-');	thrombosis_prediction
SELECT DISTINCT P.ID FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.RF < 20 AND TIMESTAMPDIFF(YEAR, P.Birthday, CURDATE()) > 60	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) AS PatientCount FROM Laboratory AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.RF < 20 AND T2.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) AS NumberOfPatients FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.ANA = 256 AND T2.ANA Pattern = 'P' AND T2.C3 > 35;	thrombosis_prediction
SELECT T2.ID FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.HCT < 29 OR T1.HCT > 52 ORDER BY T2.`aCL IgA` DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) AS Number_of_Patients FROM Patient P JOIN Examination E ON P.ID = E.ID JOIN Laboratory L ON P.ID = L.ID WHERE E.Diagnosis LIKE '%thrombosis%' AND L.C4 > 10;	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.RNP IN ('-', '+-') AND T2.Admission = '+';	thrombosis_prediction
SELECT P.Birthday FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.RNP NOT IN ('-', '+-') ORDER BY P.Birthday DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) AS PatientCount FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE (T2.SM IN ('-', '+-') OR T2.SM = 0) AND T1.Thrombosis = 0;	thrombosis_prediction
SELECT P.ID FROM Patient P JOIN Examination E ON P.ID = E.ID JOIN Laboratory L ON P.ID = L.ID WHERE L.SM NOT IN ('negative', '0') ORDER BY P.Birthday DESC LIMIT 3;	thrombosis_prediction
SELECT DISTINCT T1.ID FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.`Examination Date` > '1997-01-01' AND T2.SC170 IN ('negative', '0')	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) AS Female_Patients FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T3.SC170 IN ('negative', '0') AND T1.SEX = 'F' AND T2.Symptoms IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) AS NumberOfPatients FROM Patient P JOIN Examination E ON P.ID = E.ID JOIN Laboratory L ON P.ID = L.ID WHERE L.SSA IN ('-', '+') AND STRFTIME('%Y', P.First_Date) < '2000';	thrombosis_prediction
SELECT P.ID FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.SSA NOT IN ('negative', '0') ORDER BY P.`First Date` LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.SSB IN ('-', '+-') AND T1.Diagnosis = 'SLE'	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.SSB IN ('negative', '0') AND T1.Symptoms IS NOT NULL	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID)  FROM Patient AS P  JOIN Laboratory AS L ON P.ID = L.ID  WHERE P.SEX = 'M' AND L.CENTROMEA IN ('-', '+-') AND L.SSB IN ('-', '+-');	thrombosis_prediction
SELECT DISTINCT T2.Diagnosis FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.DNA >= 8;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.DNA < 8 AND P.Description IS NULL	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) AS PatientCount FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.IGG BETWEEN 900 AND 2000 AND P.Admission = '+';	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T2.GOT >= 60 AND T1.Diagnosis = 'SLE' THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T2.GOT >= 60 THEN 1 ELSE 0 END) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID;	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.GOT < 60	thrombosis_prediction
SELECT MIN(P.Birthday) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GOT >= 60;	thrombosis_prediction
SELECT T2.Birthday FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.GPT < 60 ORDER BY T1.GPT DESC LIMIT 3	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.GOT < 60 AND P.SEX = 'M'	thrombosis_prediction
SELECT MIN(T1.`First Date`) AS First_Recorded_Date FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.LDH < 500;	thrombosis_prediction
SELECT T1.`Examination Date` FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.LDH >= 500 ORDER BY T1.`Examination Date` DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) AS Number_of_Patients FROM Laboratory L JOIN Examination E ON L.ID = E.ID JOIN Patient P ON L.ID = P.ID WHERE L.ALP >= 300 AND P.Admission = '+';	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Admission = '-' AND T1.ALP < 300	thrombosis_prediction
SELECT DISTINCT T1.Diagnosis FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.TP < 6.0;	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) AS NumberOfPatients FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'SJS' AND T2.TP BETWEEN 6.0 AND 8.5;	thrombosis_prediction
SELECT T1.`Examination Date` FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.ALB BETWEEN 3.5 AND 5.5 ORDER BY T2.ALB DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.ALB BETWEEN 3.5 AND 5.5 AND L.TP BETWEEN 6.0 AND 8.5	thrombosis_prediction
SELECT aCL_IgG, aCL_IgM, aCL_IgA FROM Examination WHERE ID IN (     SELECT ID FROM Laboratory WHERE UA > 6.50 AND SEX = 'F' ORDER BY UA DESC LIMIT 1 )	thrombosis_prediction
SELECT MAX(T1.ANA) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.CRE < 1.5	thrombosis_prediction
SELECT ID FROM Laboratory WHERE CRE < 1.5 AND aCL_IgA = ( SELECT MAX(aCL_IgA) FROM Laboratory )	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`T-BIL` >= 2.0 AND T2.`ANA Pattern` LIKE '%P%'	thrombosis_prediction
SELECT T2.ANA FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.`T-BIL` < 2.0 ORDER BY T1.`T-BIL` DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT L.ID) AS PatientCount FROM Laboratory L JOIN Examination E ON L.ID = E.ID WHERE L.T_cho >= 250 AND E.KCT = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) AS PatientCount FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.T_CHO < 250 AND T2.ANA_Pattern = 'P';	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 WHERE T1.TG < 200 AND T1.Symptoms IS NOT NULL	thrombosis_prediction
SELECT T1.Diagnosis FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.TG < 200 ORDER BY T2.TG DESC LIMIT 1;	thrombosis_prediction
SELECT T1.ID FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Thrombosis = 0 AND T2.CPK < 250	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) AS PatientCount FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.CPK < 250 AND (T1.KCT = '+' OR T1.RVVT = '+' OR T1.LAC = '+');	thrombosis_prediction
SELECT T2.Birthday FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.GLU > 180 ORDER BY T2.Birthday ASC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) AS PatientCount FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.GLU < 180 AND T1.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT T2.ID) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Admission = '+' AND T1.WBC BETWEEN 3.5 AND 9.0	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID) AS PatientCount FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE E.Diagnosis = 'SLE' AND L.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE (L.RBC <= 3.5 OR L.RBC >= 6.0) AND P.Admission = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID) AS PatientCount FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE E.PLT BETWEEN 100 AND 400 AND E.Diagnosis IS NOT NULL;	thrombosis_prediction
SELECT L.PLT FROM Laboratory AS L JOIN Examination AS E ON L.ID = E.ID WHERE E.Diagnosis = 'MCTD' AND L.PLT BETWEEN 100 AND 400	thrombosis_prediction
SELECT AVG(T2.PT) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.PT < 14	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Thrombosis IN (1, 2) AND T2.PT < 14	thrombosis_prediction
SELECT T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Angela' AND T1.last_name = 'Sanders'	student_club
SELECT COUNT(*) FROM member WHERE link_to_major IN (SELECT major_id FROM major WHERE college = 'College of Engineering');	student_club
SELECT T2.first_name, T2.last_name FROM club AS T1 INNER JOIN member AS T2 ON T1.member_id = T2.member_id WHERE T2.link_to_major IN ( SELECT major_id FROM major WHERE department = 'Art and Design' )	student_club
SELECT COUNT(*) FROM attendance AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'Women''s Soccer';	student_club
SELECT T3.phone FROM attendance AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id INNER JOIN member AS T3 ON T1.link_to_member = T3.member_id WHERE T2.event_name = 'Women''s Soccer';	student_club
SELECT COUNT(m.member_id) AS medium_tshirt_count FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer' AND m.t_shirt_size = 'Medium';	student_club
SELECT T1.event_name FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T2.link_to_member IN ( SELECT member_id FROM member WHERE position = 'Student' ) GROUP BY T1.event_name ORDER BY COUNT(T2.link_to_event) DESC LIMIT 1	student_club
SELECT T2.college FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Vice President' AND T1.first_name = 'Student' AND T1.last_name = 'Club'	student_club
SELECT T1.event_name FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T3.first_name = 'Maya' AND T3.last_name = 'Mclean'	student_club
SELECT COUNT(*) FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.type = 'Student_Club' AND T2.link_to_member IN ( SELECT member_id FROM member WHERE first_name = 'Sacha' AND last_name = 'Harrison' ) AND STRFTIME('%Y', T1.event_date) = '2019'	student_club
SELECT COUNT(DISTINCT link_to_event) AS meeting_count FROM attendance JOIN event ON attendance.link_to_event = event.event_id WHERE event.type = 'Meeting' GROUP BY link_to_event HAVING COUNT(link_to_event) > 10;	student_club
SELECT e.event_name FROM event e WHERE e.type != 'Fundraiser' AND (     SELECT COUNT(a.link_to_event)     FROM attendance a     WHERE a.link_to_event = e.event_id ) > 20;	student_club
SELECT AVG(COUNT(event_id)) / COUNT(DISTINCT event_name) AS avg_attendance FROM event JOIN attendance ON event.event_id = attendance.link_to_event WHERE STRFTIME('%Y', event_date) = '2020' AND type = 'Meeting';	student_club
SELECT expense_description, MAX(cost) FROM expense WHERE expense_description LIKE '%club%' OR expense_description LIKE '%events%' ORDER BY cost DESC LIMIT 1	student_club
SELECT COUNT(*) FROM member WHERE link_to_major IN (SELECT major_id FROM major WHERE major_name = 'Environmental Engineering')	student_club
SELECT T2.first_name, T2.last_name FROM attendance AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id INNER JOIN event AS T3 ON T1.link_to_event = T3.event_id WHERE T3.event_name = 'Laugh Out Loud' AND T2.position = 'Member'	student_club
SELECT T1.last_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Law and Constitutional Studies'	student_club
SELECT T1.county FROM zip_code AS T1 INNER JOIN member AS T2 ON T2.zip = T1.zip_code WHERE T2.first_name = 'Sherri' AND T2.last_name = 'Ramsey';	student_club
SELECT T1.college FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Tyler' AND T2.last_name = 'Hewitt'	student_club
SELECT SUM(amount) AS total_funds_received FROM income WHERE link_to_member IN (     SELECT member_id     FROM member     WHERE position = 'Vice President' );	student_club
SELECT SUM(T1.spent) AS total_spent_on_food FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'September Meeting' AND T1.category = 'Food';	student_club
SELECT T2.city, T2.state FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.position = 'President';	student_club
SELECT T.first_name, T.last_name FROM member AS T JOIN zip_code AS Z ON T.zip = Z.zip_code WHERE Z.state = 'Illinois'	student_club
SELECT SUM(b.spent) AS total_spent_on_advertisement FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'September Meeting' AND b.category = 'Advertisement';	student_club
SELECT DISTINCT m.department FROM member AS m JOIN attendance AS a ON m.member_id = a.link_to_member WHERE m.first_name IN ('Pierce', 'Guidi') AND m.last_name IN ('Pierce', 'Guidi');	student_club
SELECT SUM(b.amount) FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'October Speaker'	student_club
SELECT e.expense_description, e.approved  FROM expense e  JOIN budget b ON e.link_to_budget = b.budget_id  JOIN event ev ON b.link_to_event = ev.event_id  WHERE ev.event_name = 'October Meeting' AND ev.event_date LIKE '2019-10-08%' AND e.approved = 'true';	student_club
SELECT AVG(cost) FROM expense WHERE link_to_member IN ( SELECT member_id FROM member WHERE first_name = 'Elijah' AND last_name = 'Allen' ) AND STRFTIME('%m', expense_date) IN ('09', '10')	student_club
SELECT SUM(CASE WHEN strftime('%Y', T1.event_date) = '2019' THEN T2.spent ELSE 0 END) - SUM(CASE WHEN strftime('%Y', T1.event_date) = '2020' THEN T2.spent ELSE 0 END) AS difference FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event;	student_club
SELECT location FROM event WHERE event_name = 'Spring Budget Review';	student_club
SELECT SUM(cost) AS total_cost FROM expense WHERE expense_description LIKE '%Posters%' AND expense_date = '2019-09-04';	student_club
SELECT MAX(budget.remaining) AS remaining_of_biggest_food_budget FROM budget WHERE budget.category = 'Food';	student_club
SELECT notes FROM income WHERE date_received = '2019-09-14' AND source = 'Fundraising';	student_club
SELECT COUNT(major_name) AS major_count FROM major WHERE college = 'College of Humanities and Social Sciences';	student_club
SELECT phone FROM member WHERE first_name = 'Carlo' AND last_name = 'Jacobs';	student_club
SELECT T2.county FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Adela' AND T1.last_name = 'O''Gallagher'	student_club
SELECT COUNT(*)  FROM budget  JOIN event ON budget.link_to_event = event.event_id  WHERE event.event_name = 'November Meeting' AND budget.remaining < 0;	student_club
SELECT SUM(budget.amount) FROM budget INNER JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'September Speaker' AND budget.event_status = 'Open'	student_club
SELECT T1.event_status FROM event AS T1 JOIN expense AS T2 ON T1.event_id = T2.link_to_event WHERE T2.expense_description = 'Post Cards, Posters' AND T2.expense_date = '2019-08-20';	student_club
SELECT T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Brent' AND T1.last_name = 'Thomason'	student_club
SELECT COUNT(*)  FROM member  WHERE link_to_major IN (     SELECT major_id      FROM major      WHERE major_name = 'Business' ) AND t_shirt_size = 'Medium';	student_club
SELECT T1.type FROM zip_code AS T1 INNER JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T2.first_name = 'Christof' AND T2.last_name = 'Nielsen'	student_club
SELECT T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Vice President'	student_club
SELECT T2.state FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Sacha' AND T1.last_name = 'Harrison';	student_club
SELECT T1.department FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.position = 'President';	student_club
SELECT T1.date_received FROM income AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Connor' AND T2.last_name = 'Hilton' AND T1.source = 'Dues' ORDER BY T1.date_received DESC LIMIT 1	student_club
SELECT first_name, last_name FROM member WHERE member_id = (SELECT link_to_member FROM income WHERE source = 'Dues' ORDER BY date_received ASC LIMIT 1)	student_club
SELECT CAST(SUM(CASE WHEN T1.event_name = 'Yearly Kickoff' THEN T2.amount ELSE 0 END) AS REAL) / SUM(CASE WHEN T1.event_name = 'October Meeting' THEN T2.amount ELSE 0 END) AS ratio FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Advertisement';	student_club
SELECT CAST(SUM(CASE WHEN T1.category = 'Parking' THEN T1.amount ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'November Speaker'	student_club
SELECT SUM(cost) AS total_cost_of_pizzas FROM expense WHERE expense_description = 'Pizza';	student_club
SELECT COUNT(city) FROM zip_code WHERE county = 'Orange' AND state = 'Virginia';	student_club
SELECT DISTINCT T1.department FROM major AS T1 JOIN event AS T2 ON T1.major_id = T2.link_to_member WHERE T1.college = 'College of Humanities and Social Sciences'	student_club
SELECT T1.city, T1.county, T1.state FROM zip_code AS T1 INNER JOIN member AS T2 ON T2.zip = T1.zip_code WHERE T2.first_name = 'Amy' AND T2.last_name = 'Firth';	student_club
SELECT T1.expense_description FROM expense AS T1 JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id ORDER BY T2.remaining ASC LIMIT 1	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'October Meeting'	student_club
SELECT major.college FROM member JOIN major ON member.link_to_major = major.major_id GROUP BY major.college ORDER BY COUNT(major.college) DESC LIMIT 1	student_club
SELECT T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.phone = '809-555-3360'	student_club
SELECT e.event_name  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  ORDER BY b.amount DESC  LIMIT 1;	student_club
SELECT T1.expense_description FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.position = 'Vice President';	student_club
SELECT COUNT(link_to_member) AS member_count FROM attendance WHERE link_to_event = (SELECT event_id FROM event WHERE event_name = 'Women''s Soccer')	student_club
SELECT date_received FROM income WHERE link_to_member IN (SELECT member_id FROM member WHERE first_name = 'Casey' AND last_name = 'Mason');	student_club
SELECT COUNT(*) FROM member WHERE zip IN ( SELECT zip_code FROM zip_code WHERE state = 'Maryland' )	student_club
SELECT COUNT(*) AS event_count FROM attendance JOIN member ON attendance.link_to_member = member.member_id WHERE member.phone = '954-555-6240';	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.department = 'School of Applied Sciences, Technology and Education'	student_club
SELECT e.event_name, b.spent / b.amount AS ratio FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.status = 'Closed' ORDER BY ratio DESC LIMIT 1;	student_club
SELECT COUNT(*) FROM member WHERE position = 'President';	student_club
SELECT MAX(spent) AS highest_budget_spend FROM budget;	student_club
SELECT COUNT(*) FROM event WHERE type = 'Meeting' AND STRFTIME('%Y', event_date) = '2020';	student_club
SELECT SUM(spent) FROM budget WHERE category = 'Food';	student_club
SELECT T.first_name, T.last_name FROM ( SELECT member_id, COUNT(link_to_event) AS event_count FROM attendance GROUP BY member_id ) AS T WHERE T.event_count > 7 JOIN member ON T.member_id = member.member_id	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id JOIN major mj ON m.link_to_major = mj.major_id WHERE mj.major_name = 'Interior Design' AND e.event_name = 'Community Theater'	student_club
SELECT first_name, last_name FROM member WHERE zip IN ( SELECT zip_code FROM zip_code WHERE city = 'Georgetown' AND state = 'South Carolina' )	student_club
SELECT SUM(amount) AS income_generated FROM income JOIN member ON income.link_to_member = member.member_id WHERE first_name = 'Grant' AND last_name = 'Gilmour';	student_club
SELECT T.first_name, T.last_name FROM member AS T JOIN income AS I ON T.member_id = I.link_to_member WHERE I.amount > 40	student_club
SELECT SUM(expense.cost) AS total_expense FROM expense JOIN budget ON expense.link_to_budget = budget.budget_id JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'Yearly Kickoff';	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'Yearly Kickoff' AND T1.position = 'Student' GROUP BY T1.first_name, T1.last_name ORDER BY COUNT(*) DESC LIMIT 1	student_club
SELECT T2.first_name, T2.last_name, T1.source FROM income AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id GROUP BY T1.source ORDER BY SUM(T1.amount) DESC LIMIT 1	student_club
SELECT T1.event_name FROM event AS T1 JOIN expense AS T2 ON T1.event_id = T2.link_to_event ORDER BY T2.cost ASC LIMIT 1	student_club
SELECT (SUM(CASE WHEN T2.event_name = 'Yearly Kickoff' THEN T1.cost ELSE 0 END) / SUM(T1.cost)) * 100 AS percentage FROM expense AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id;	student_club
SELECT CAST(SUM(CASE WHEN T1.major_name = 'Finance' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T1.major_name = 'Physics' THEN 1 ELSE 0 END) FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major	student_club
SELECT source, SUM(amount) AS total_amount FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' GROUP BY source ORDER BY total_amount DESC LIMIT 1;	student_club
SELECT first_name, last_name, email FROM member WHERE position = 'Secretary'	student_club
SELECT COUNT(*)  FROM member  INNER JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Physics Teaching';	student_club
SELECT COUNT(*) FROM attendance AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'Community Theater' AND STRFTIME('%Y', T2.event_date) = '2019';	student_club
SELECT T1.major_name, COUNT(T3.link_to_event) AS num_events_attended FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major INNER JOIN attendance AS T3 ON T2.member_id = T3.link_to_member WHERE T2.first_name = 'Luisa' AND T2.last_name = 'Guidi'	student_club
SELECT AVG(spent) FROM budget WHERE category = 'Food' AND event_status = 'Closed';	student_club
SELECT T1.event_name FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Advertisement' ORDER BY T2.spent DESC LIMIT 1	student_club
SELECT CASE WHEN EXISTS (     SELECT 1 FROM attendance      JOIN member ON attendance.link_to_member = member.member_id      JOIN event ON attendance.link_to_event = event.event_id      WHERE member.first_name = 'Maya' AND member.last_name = 'Mclean' AND event.event_name = 'Women''s Soccer' ) THEN 'Yes' ELSE 'No' END AS attended;	student_club
SELECT CAST(COUNT(CASE WHEN type = 'Community Service' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(event_id) FROM event WHERE event_date LIKE '2019%'	student_club
SELECT SUM(T1.cost) AS total_poster_cost FROM expense AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'September Speaker' AND T1.expense_description = 'Posters';	student_club
SELECT t_shirt_size FROM member GROUP BY t_shirt_size ORDER BY COUNT(t_shirt_size) DESC LIMIT 1;	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.status = 'Closed' AND b.remaining < 0 ORDER BY b.remaining ASC LIMIT 1;	student_club
SELECT e.category, SUM(e.cost) AS total_value FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.event_name = 'October Meeting' AND e.approved = 'true' GROUP BY e.category;	student_club
SELECT category, SUM(amount) AS total_amount FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event_name = 'April Speaker' GROUP BY category ORDER BY total_amount ASC	student_club
SELECT budget_id FROM budget WHERE category = 'Food' ORDER BY amount DESC LIMIT 1	student_club
SELECT link_to_event, SUM(amount) AS total_amount FROM budget WHERE category = 'Advertisement' GROUP BY link_to_event ORDER BY total_amount DESC LIMIT 3	student_club
SELECT SUM(cost) FROM expense WHERE expense_description = 'Parking'	student_club
SELECT SUM(cost) AS total_expense FROM expense WHERE expense_date = '2019-08-20';	student_club
SELECT T2.first_name, T2.last_name, SUM(T1.cost) AS total_cost FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.link_to_member = 'rec4BLdZHS2Blfp4v'	student_club
SELECT T2.expense_description FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T1.first_name = 'Sacha' AND T1.last_name = 'Harrison'	student_club
SELECT T2.expense_description FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T1.t_shirt_size = 'X-Large'	student_club
SELECT DISTINCT m.zip FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost < 50;	student_club
SELECT T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Phillip' AND T1.last_name = 'Cullen';	student_club
SELECT T1.position FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Business'	student_club
SELECT COUNT(*) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Business' AND T1.t_shirt_size = 'Medium'	student_club
SELECT type FROM event WHERE event_id IN (SELECT link_to_event FROM budget WHERE remaining > 30)	student_club
SELECT DISTINCT type FROM event WHERE location = 'MU 215'	student_club
SELECT type FROM event WHERE event_date = '2020-03-24T12:00:00';	student_club
SELECT T1.major_name FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.position = 'Vice President'	student_club
SELECT CAST(SUM(CASE WHEN T2.position = 'Member' AND T1.major_name = 'Business' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.major_id) FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major	student_club
SELECT type FROM event WHERE location = 'MU 215' GROUP BY type	student_club
SELECT COUNT(*) FROM income WHERE amount = 50;	student_club
SELECT COUNT(*) FROM member WHERE position = 'Member' AND t_shirt_size = 'X-Large';	student_club
SELECT COUNT(major_id) FROM major WHERE department = 'School of Applied Sciences, Technology and Education' AND college = 'College of Agriculture and Applied Sciences';	student_club
SELECT m.last_name, ma.department, ma.college FROM member AS m JOIN major AS ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Environmental Engineering';	student_club
SELECT DISTINCT T1.category FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.location = 'MU 215' AND T2.type = 'Guest Speaker' AND T1.spent = 0;	student_club
SELECT T2.city, T2.state FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.position = 'Member' AND T1.link_to_major IN ( SELECT major_id FROM major WHERE department = 'Electrical and Computer Engineering Department' )	student_club
SELECT T1.event_name FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event INNER JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T3.position = 'Vice President' AND T1.location = '900 E. Washington St.' AND T1.type = 'Social'	student_club
SELECT T2.last_name, T2.position FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.expense_date = '2019-09-10' AND T1.expense_description = 'Pizza' LIMIT 1	student_club
SELECT m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer';	student_club
SELECT CAST(SUM(CASE WHEN T2.amount = 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.member_id) FROM member AS T1 INNER JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T1.t_shirt_size = 'Medium' AND T1.position = 'Member'	student_club
SELECT DISTINCT T2.country FROM zip_code AS T1 INNER JOIN event AS T2 ON T1.zip_code = T2.location WHERE T1.type = 'PO Box'	student_club
SELECT DISTINCT T1.zip FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T2.state = 'Puerto Rico' AND T2.type = 'PO Box'	student_club
SELECT event_name FROM event WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20';	student_club
SELECT DISTINCT T1.link_to_event FROM expense AS T1 JOIN income AS T2 ON T1.link_to_member = T2.link_to_member WHERE T1.cost > 50;	student_club
SELECT m.first_name, m.last_name, e.event_id, e.event_name, e.event_date FROM member AS m JOIN expense AS e ON m.member_id = e.link_to_member WHERE e.approved = 'true' AND e.expense_date BETWEEN '2019-01-10' AND '2019-11-19';	student_club
SELECT T1.college FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Katy' AND T1.major_id = 'rec1N0upiVLy5esTO'	student_club
SELECT T1.phone FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.college = 'College of Agriculture and Applied Sciences' AND T2.major_name = 'Business';	student_club
SELECT T1.email FROM member AS T1 JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T2.date_received BETWEEN '2019-09-10' AND '2019-11-19' AND T2.amount > 20;	student_club
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Education' AND major.college = 'College of Education & Human Services';	student_club
SELECT CAST(SUM(CASE WHEN T1.remaining < 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.event_id) AS percentage_over_budget FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id;	student_club
SELECT event_id, location, status FROM event WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31';	student_club
SELECT expense_description FROM expense GROUP BY expense_description HAVING AVG(cost) > 50	student_club
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large';	student_club
SELECT CAST(SUM(CASE WHEN type = 'PO Box' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(zip_code) FROM zip_code;	student_club
SELECT e.event_name, e.location FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.remaining > 0;	student_club
SELECT T1.event_name, T1.event_date FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event JOIN expense AS T3 ON T2.budget_id = T3.link_to_budget WHERE T3.expense_description = 'Pizza' AND T3.cost > 50 AND T3.cost < 100;	student_club
SELECT T1.first_name, T1.last_name, T3.major_name FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member INNER JOIN major AS T3 ON T1.link_to_major = T3.major_id WHERE T2.cost > 100 GROUP BY T1.first_name, T1.last_name, T3.major_name	student_club
SELECT T2.city, T2.country FROM income AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code GROUP BY T1.link_to_event HAVING COUNT(T1.income_id) > 40	student_club
SELECT m.member_id, m.first_name, m.last_name, SUM(e.cost) AS total_expenses FROM member m JOIN expense e ON m.member_id = e.link_to_member GROUP BY m.member_id HAVING COUNT(DISTINCT e.link_to_event) > 1 ORDER BY total_expenses DESC LIMIT 1;	student_club
SELECT AVG(T1.cost) FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.position != 'Member'	student_club
SELECT event_name FROM event WHERE event_id IN ( SELECT link_to_event FROM expense WHERE category = 'Parking' AND cost < ( SELECT SUM(cost) / COUNT(event_id) AS avg_cost FROM expense WHERE category = 'Parking' ) )	student_club
SELECT (SUM(CASE WHEN T1.type = 'Meeting' THEN T2.cost ELSE 0 END) / COUNT(T1.event_id)) * 100 AS percentage FROM event AS T1 INNER JOIN expense AS T2 ON T1.event_id = T2.link_to_event;	student_club
SELECT T1.category, SUM(T2.cost) AS total_cost FROM budget AS T1 JOIN expense AS T2 ON T1.budget_id = T2.link_to_budget WHERE T2.expense_description = 'Water, chips, cookies' GROUP BY T1.category ORDER BY total_cost DESC LIMIT 1;	student_club
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_spending FROM member m JOIN expense e ON m.member_id = e.link_to_member GROUP BY m.member_id ORDER BY total_spending DESC LIMIT 5;	student_club
SELECT m.first_name, m.last_name, m.phone FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost > (SELECT AVG(cost) FROM expense);	student_club
SELECT      (CAST(SUM(CASE WHEN T2.state = 'New Jersey' THEN 1 ELSE 0 END) AS REAL) / COUNT(T1.position)) -      (CAST(SUM(CASE WHEN T2.state = 'Vermont' THEN 1 ELSE 0 END) AS REAL) / COUNT(T1.position)) AS diff_percentage FROM      member AS T1 JOIN      zip_code AS T2 ON T1.zip = T2.zip_code WHERE      T1.position = 'Member';	student_club
SELECT T1.major_name, T1.department FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Garrett' AND T2.last_name = 'Gerke';	student_club
SELECT m.first_name, m.last_name, e.cost FROM member AS m JOIN expense AS e ON m.member_id = e.link_to_member WHERE e.expense_description = 'Water, Veggie tray, supplies';	student_club
SELECT T1.last_name, T1.phone FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Elementary Education';	student_club
SELECT T1.category, SUM(T1.amount) AS total_budgeted FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'January Speaker' GROUP BY T1.category;	student_club
SELECT T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Food'	student_club
SELECT T1.first_name, T1.last_name, T2.amount FROM member AS T1 INNER JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T2.date_received = '2019-09-09'	student_club
SELECT T2.category FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id WHERE T1.expense_description = 'Posters'	student_club
SELECT T1.first_name, T1.last_name, T2.college FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Secretary'	student_club
SELECT e.event_name, SUM(b.spent) AS total_amount_spent FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE b.category = 'Speaker Gifts' GROUP BY e.event_name ORDER BY total_amount_spent DESC;	student_club
SELECT T2.city FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Garrett' AND T1.last_name = 'Gerke';	student_club
SELECT first_name, last_name, position FROM member WHERE zip IN ( SELECT zip_code FROM zip_code WHERE city = 'Lincolnton' AND state = 'North Carolina' )	student_club
SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Premium'	debit_card_specializing
SELECT CAST(SUM(CASE WHEN Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN Currency = 'CZK' THEN 1 ELSE 0 END) AS Ratio FROM customers;	debit_card_specializing
SELECT CustomerID FROM yearmonth WHERE Date LIKE '2012%' AND CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'LAM') ORDER BY Consumption ASC LIMIT 1;	debit_card_specializing
SELECT AVG(AvgMonthlyConsumption) AS AverageMonthlyConsumption FROM (  SELECT SUM(Consumption) / 12 AS AvgMonthlyConsumption FROM yearmonth WHERE CustomerID IN ( SELECT CustomerID FROM customers WHERE Segment = 'SME' ) AND Date BETWEEN '201301' AND '201312' ) AS Subquery;	debit_card_specializing
SELECT T2.CustomerID, SUM(T1.Amount) AS TotalConsumption FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date BETWEEN '201101' AND '201112' AND T2.Currency = 'CZK' GROUP BY T2.CustomerID ORDER BY TotalConsumption DESC;	debit_card_specializing
SELECT COUNT(CustomerID) FROM yearmonth WHERE Date BETWEEN '201201' AND '201212' AND Consumption < 30000;	debit_card_specializing
SELECT SUM(CASE WHEN T1.Currency = 'CZK' THEN T2.Consumption ELSE 0 END) - SUM(CASE WHEN T1.Currency = 'EUR' THEN T2.Consumption ELSE 0 END) AS DifferenceInConsumption FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE strftime('%Y', T2.Date) = '2012';	debit_card_specializing
SELECT Date FROM transactions_1k WHERE Currency = 'EUR' GROUP BY strftime('%Y', Date) ORDER BY SUM(Price) DESC LIMIT 1	debit_card_specializing
SELECT Segment FROM yearmonth GROUP BY CustomerID, Segment ORDER BY SUM(Consumption) ASC LIMIT 1;	debit_card_specializing
SELECT SUBSTR(Date, 1, 4) AS Year, SUM(Consumption) AS TotalConsumption FROM yearmonth GROUP BY Year ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT Date, MAX(Consumption) AS PeakConsumption FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'SME') AND Date BETWEEN '201301' AND '201312' GROUP BY Date ORDER BY PeakConsumption DESC LIMIT 1;	debit_card_specializing
SELECT      (SUM(CASE WHEN T2.Segment = 'SME' THEN T1.Consumption ELSE 0 END) / COUNT(CASE WHEN T2.Segment = 'SME' THEN T1.CustomerID ELSE NULL END)) -      (SUM(CASE WHEN T2.Segment = 'LAM' THEN T1.Consumption ELSE 0 END) / COUNT(CASE WHEN T2.Segment = 'LAM' THEN T1.CustomerID ELSE NULL END)) AS diff_SME_LAM,          (SUM(CASE WHEN T2.Segment = 'LAM' THEN T1.Consumption ELSE 0 END) / COUNT(CASE WHEN T2.Segment = 'LAM' THEN T1.CustomerID ELSE NULL END)) -      (SUM(CASE WHEN T2.Segment = 'KAM' THEN T1.Consumption ELSE 0 END) / COUNT(CASE WHEN T2.Segment = 'KAM' THEN T1.CustomerID ELSE NULL END)) AS diff_LAM_KAM,          (SUM(CASE WHEN T2.Segment = 'KAM' THEN T1.Consumption ELSE 0 END) / COUNT(CASE WHEN T2.Segment = 'KAM' THEN T1.CustomerID ELSE NULL END)) -      (SUM(CASE WHEN T2.Segment = 'SME' THEN T1.Consumption ELSE 0 END) / COUNT(CASE WHEN T2.Segment = 'SME' THEN T1.CustomerID ELSE NULL END)) AS diff_KAM_SME FROM      yearmonth AS T1 INNER JOIN      customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE      T1.Date BETWEEN '201301' AND '201312';	debit_card_specializing
SELECT Segment,         ((SUM(CASE WHEN Date LIKE '2013%' THEN Consumption ELSE 0 END) -           SUM(CASE WHEN Date LIKE '2012%' THEN Consumption ELSE 0 END)) /         SUM(CASE WHEN Date LIKE '2013%' THEN Consumption ELSE 0 END)) * 100 AS PercentageIncrease FROM customers JOIN yearmonth ON customers.CustomerID = yearmonth.CustomerID WHERE Date LIKE '2012%' OR Date LIKE '2013%' GROUP BY Segment ORDER BY PercentageIncrease DESC;	debit_card_specializing
SELECT SUM(Consumption) FROM yearmonth WHERE CustomerID = 6 AND Date BETWEEN '201308' AND '201311'	debit_card_specializing
SELECT SUM(CASE WHEN Country = 'CZE' THEN 1 ELSE 0 END) - SUM(CASE WHEN Country = 'SVK' THEN 1 ELSE 0 END) AS Difference FROM gasstations WHERE Segment = 'Discount'	debit_card_specializing
SELECT SUM(CASE WHEN CustomerID = 7 THEN Consumption ELSE 0 END) - SUM(CASE WHEN CustomerID = 5 THEN Consumption ELSE 0 END) AS Difference FROM yearmonth WHERE Date = '201304';	debit_card_specializing
SELECT SUM(CASE WHEN T1.Currency = 'CZK' THEN 1 ELSE 0 END) - SUM(CASE WHEN T1.Currency = 'EUR' THEN 1 ELSE 0 END) AS Difference FROM customers AS T1 WHERE T1.Segment = 'SME';	debit_card_specializing
SELECT T1.CustomerID FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Currency = 'EUR' AND T2.Date LIKE '201310%' ORDER BY T2.Consumption DESC LIMIT 1	debit_card_specializing
SELECT c.CustomerID, SUM(y.Consumption) AS TotalConsumption FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID GROUP BY c.CustomerID ORDER BY TotalConsumption DESC;	debit_card_specializing
SELECT SUM(Consumption) AS TotalConsumption FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'KAM') AND Date = '201305';	debit_card_specializing
SELECT CAST(SUM(CASE WHEN T2.Consumption > 46.73 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.CustomerID) FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM';	debit_card_specializing
SELECT Country, COUNT(*) AS NumberOfValueForMoneyGasStations FROM gasstations WHERE Segment = 'Value for money' GROUP BY Country ORDER BY NumberOfValueForMoneyGasStations DESC LIMIT 1	debit_card_specializing
SELECT CAST(SUM(CASE WHEN T1.Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID	debit_card_specializing
SELECT CAST(SUM(CASE WHEN T1.Consumption > 528.3 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.CustomerID) FROM yearmonth AS T1 WHERE T1.Date LIKE '201202%'	debit_card_specializing
SELECT CAST(SUM(CASE WHEN Segment = 'Premium' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM gasstations WHERE Country = 'CZE'	debit_card_specializing
SELECT CustomerID FROM yearmonth WHERE Date = '201309' ORDER BY Consumption DESC LIMIT 1;	debit_card_specializing
SELECT T2.Segment FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date LIKE '201309%' ORDER BY T1.Consumption ASC LIMIT 1	debit_card_specializing
SELECT T1.CustomerID, SUM(T1.Amount) AS TotalConsumption FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Segment = 'SME' AND STRFTIME('%Y%m', T1.Date) = '201206' GROUP BY T1.CustomerID ORDER BY TotalConsumption ASC LIMIT 1;	debit_card_specializing
SELECT MAX(Consumption) AS HighestMonthlyConsumption FROM yearmonth WHERE Date LIKE '2012%';	debit_card_specializing
SELECT MAX(Consumption) FROM yearmonth WHERE CustomerID IN ( SELECT CustomerID FROM customers WHERE Currency = 'EUR' )	debit_card_specializing
SELECT T2.Description FROM transactions_1k AS T1 INNER JOIN products AS T2 ON T1.ProductID = T2.ProductID WHERE STRFTIME('%Y%m', T1.Date) = '201309'	debit_card_specializing
SELECT DISTINCT T2.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date LIKE '201306%'	debit_card_specializing
SELECT T2.ChainID FROM customers AS T1 INNER JOIN gasstations AS T2 ON T1.CustomerID = T2.GasStationID WHERE T1.Currency = 'EUR' GROUP BY T2.ChainID	debit_card_specializing
SELECT T2.Description FROM transactions_1k AS T1 INNER JOIN products AS T2 ON T1.ProductID = T2.ProductID WHERE T1.CustomerID IN ( SELECT CustomerID FROM customers WHERE Currency = 'EUR' )	debit_card_specializing
SELECT AVG(Price) AS AverageTotalPrice FROM transactions_1k WHERE Date LIKE '2012-01%'	debit_card_specializing
SELECT COUNT(DISTINCT ym.CustomerID) AS CustomerCount FROM yearmonth ym JOIN customers c ON ym.CustomerID = c.CustomerID WHERE c.Currency = 'EUR' AND ym.Consumption > 1000;	debit_card_specializing
SELECT T3.Description FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID INNER JOIN products AS T3 ON T1.ProductID = T3.ProductID WHERE T2.Country = 'CZE'	debit_card_specializing
SELECT DISTINCT Time FROM transactions_1k WHERE GasStationID IN (SELECT GasStationID FROM gasstations WHERE ChainID = 11)	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE' AND T1.Price > 1000;	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE' AND T1.Date > '2012-01-01'	debit_card_specializing
SELECT AVG(Price) FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE'	debit_card_specializing
SELECT AVG(Price) AS AverageTotalPrice FROM transactions_1k JOIN customers ON transactions_1k.CustomerID = customers.CustomerID WHERE customers.Currency = 'EUR';	debit_card_specializing
SELECT CustomerID FROM transactions_1k WHERE Date = '2012-08-25' GROUP BY CustomerID ORDER BY SUM(Amount) DESC LIMIT 1;	debit_card_specializing
SELECT T3.Country, T2.GasStationID  FROM transactions_1k AS T1  JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID  JOIN customers AS T3 ON T1.CustomerID = T3.CustomerID  WHERE T1.Date = '2012-08-25'  ORDER BY T1.Date ASC, T1.Time ASC  LIMIT 1;	debit_card_specializing
SELECT T1.Currency FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '2012-08-24' AND T2.Time = '16:25:00';	debit_card_specializing
SELECT T2.Segment FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date = '2012-08-23' AND T1.Time = '21:20:00'	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k WHERE Date = '2012-08-26' AND TIME < '13:00:00' AND CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'CZK');	debit_card_specializing
SELECT T1.Segment FROM customers AS T1 ORDER BY T1.CustomerID ASC LIMIT 1;	debit_card_specializing
SELECT T2.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-24' AND T1.Time = '12:42:00'	debit_card_specializing
SELECT ProductID FROM transactions_1k WHERE Date = '2012-08-23' AND Time = '21:20:00';	debit_card_specializing
SELECT SUM(T1.Amount), T1.Date, T1.Amount FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Amount = 124.05 AND T1.Date = '2012-08-24';	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-26' AND T1.Time BETWEEN '08:00:00' AND '09:00:00' AND T2.Country = 'CZE'	debit_card_specializing
SELECT T1.Currency FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Amount = 214582.17 AND strftime('%Y%m', T2.Date) = '201306'	debit_card_specializing
SELECT T3.Country FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID INNER JOIN gasstations AS T3 ON T1.GasStationID = T3.GasStationID WHERE T1.CardID = 667467	debit_card_specializing
SELECT T1.Country FROM gasstations AS T1 INNER JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Date = '2012-08-24' AND T2.Amount = 548.4	debit_card_specializing
SELECT CAST(SUM(CASE WHEN T1.Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '2012-08-25';	debit_card_specializing
SELECT (T1.Consumption - T2.Consumption) / T1.Consumption AS DecreaseRate FROM yearmonth AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID AND T1.Date LIKE '2012%' JOIN transactions_1k AS T3 ON T3.CustomerID = T1.CustomerID AND T3.Date = '2012-08-25' WHERE T3.Amount = 634.8;	debit_card_specializing
SELECT g.GasStationID, SUM(t.Amount * t.Price) AS TotalRevenue FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID GROUP BY g.GasStationID ORDER BY TotalRevenue DESC LIMIT 1	debit_card_specializing
SELECT CAST(SUM(CASE WHEN T2.Segment = 'Premium' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.Segment) FROM customers AS T1 INNER JOIN gasstations AS T2 ON T1.CustomerID = T2.GasStationID WHERE T2.Country = 'SVK'	debit_card_specializing
SELECT SUM(Amount) AS TotalSpent, SUM(CASE WHEN Date LIKE '201201%' THEN Amount ELSE 0 END) AS January2012Spent FROM transactions_1k WHERE CustomerID = 38508;	debit_card_specializing
SELECT p.Description FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID GROUP BY p.ProductID ORDER BY SUM(t.Amount) DESC LIMIT 5;	debit_card_specializing
SELECT c.CustomerID, AVG(t.Price) AS AvgPricePerItem, t.Currency  FROM transactions_1k t  JOIN customers c ON t.CustomerID = c.CustomerID  GROUP BY c.CustomerID, t.Currency  ORDER BY SUM(t.Amount * t.Price) DESC  LIMIT 1;	debit_card_specializing
SELECT T2.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.ProductID = 2 ORDER BY T1.Price DESC LIMIT 1	debit_card_specializing
SELECT T1.CustomerID, T3.ConsumptionStatus FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID JOIN yearmonth AS T3 ON T1.CustomerID = T3.CustomerID AND T3.Date LIKE '201208%' WHERE T1.ProductID = 5 AND T1.Price / T1.Amount > 29.00;	debit_card_specializing
