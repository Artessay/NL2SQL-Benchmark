SELECT MAX(`Free Meal Count (K-12)` / `Enrollment (K-12)`) AS max_eligible_rate  FROM frpm  WHERE `County Name` = 'Alameda'  AND `Enrollment (K-12)` > 0  AND `Free Meal Count (K-12)` > 0;	california_schools
SELECT      `School Name`,     (`Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)`) AS EligibleFreeRate FROM      frpm WHERE      `Educational Option Type` = 'Continuation'     AND `Enrollment (Ages 5-17)` > 0 ORDER BY      EligibleFreeRate ASC LIMIT 3;	california_schools
SELECT s.Zip  FROM frpm f INNER JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`Charter School (Y/N)` = 1 AND s.County = 'Fresno';	california_schools
SELECT T2.MailStreet  FROM frpm AS T1  INNER JOIN schools AS T2  ON T1.CDSCode = T2.CDSCode  WHERE T1.`FRPM Count (K-12)` IS NOT NULL  ORDER BY T1.`FRPM Count (K-12)` DESC  LIMIT 1;	california_schools
SELECT s.Phone  FROM frpm f  INNER JOIN schools s  ON f.CDSCode = s.CDSCode  WHERE f.`Charter School (Y/N)` = 1 AND s.FundingType = 'Direct Charter' AND s.OpenDate > '2000-01-01';	california_schools
SELECT COUNT(*) AS NumSchools FROM satscores INNER JOIN schools ON satscores.cds = schools.CDSCode WHERE AvgScrMath > 400 AND Virtual = 'F'	california_schools
SELECT sname, cds, dname FROM satscores INNER JOIN schools ON satscores.cds = schools.CDSCode WHERE NumTstTakr > 500 AND Magnet = 1;	california_schools
SELECT s.Phone FROM schools s INNER JOIN satscores sa ON s.CDSCode = sa.cds WHERE sa.NumGE1500 = (SELECT MAX(NumGE1500) FROM satscores) LIMIT 1;	california_schools
SELECT SUM(s.NumTstTakr) AS TotalTestTakers FROM satscores s WHERE s.cds IN (     SELECT f.CDSCode     FROM frpm f     WHERE `FRPM Count (K-12)` = (         SELECT MAX(`FRPM Count (K-12)`)         FROM frpm     ) );	california_schools
SELECT COUNT(*)  FROM satscores s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.AvgScrMath > 560 AND f.CharterSchoolYN = 1;	california_schools
SELECT `FRPM Count (Ages 5-17)` FROM frpm WHERE CDSCode = ( SELECT cds FROM satscores WHERE AvgScrRead = ( SELECT MAX(AvgScrRead) FROM satscores ) )	california_schools
SELECT CDSCode FROM frpm WHERE [Enrollment (K-12)] + [Enrollment (Ages 5-17)] > 500	california_schools
SELECT MAX(`Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)`) AS max_free_rate FROM satscores INNER JOIN frpm ON cds = CDSCode WHERE (NumGE1500 / NumTstTakr) > 0.3 AND `Enrollment (Ages 5-17)` > 0;	california_schools
SELECT s.Phone FROM schools s JOIN satscores sa ON s.CDSCode = sa.cds WHERE sa.NumGE1500 IS NOT NULL AND sa.NumTstTakr > 0 ORDER BY (sa.NumGE1500 / sa.NumTstTakr) DESC LIMIT 3;	california_schools
SELECT s.NCESSchool, f.`Enrollment (Ages 5-17)` FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode ORDER BY f.`Enrollment (Ages 5-17)` DESC LIMIT 5;	california_schools
SELECT district FROM (   SELECT scho.District AS district, AVG(sat.AvgScrRead) AS avg_read_score   FROM schools scho   JOIN satscores sat ON scho.CDSCode = sat.cds   WHERE scho.StatusType = 'Active'   GROUP BY scho.District   ORDER BY avg_read_score DESC ) AS subquery WHERE ROWNUM <= 1;	california_schools
SELECT COUNT(DISTINCT s.CDSCode)  FROM frpm f  INNER JOIN satscores sa ON f.CDSCode = sa.cds  INNER JOIN schools sc ON sa.cds = sc.CDSCode  WHERE sc.County = 'Alameda' AND sa.NumTstTakr < 100;	california_schools
SELECT s.School, ss.AvgScrWrite, s.CharterNum FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.AvgScrWrite > 499 AND s.CharterNum IS NOT NULL ORDER BY ss.AvgScrWrite DESC;	california_schools
SELECT COUNT(DISTINCT s.CDSCode) FROM satscores sc INNER JOIN schools s ON sc.cds = s.CDSCode WHERE sc.rtype = 'S'   AND s.County = 'Fresno'   AND s.FundingType = 'Directly Funded'   AND sc.NumTstTakr <= 250;	california_schools
SELECT s.Phone FROM schools s WHERE s.CDSCode IN (SELECT sa.cds FROM satscores sa WHERE sa.rtype = 'S' AND sa.AvgScrMath = (SELECT MAX(AvgScrMath) FROM satscores WHERE rtype = 'S'));	california_schools
SELECT COUNT(CDSCode)  FROM frpm  WHERE `County Name` = 'Amador' AND `Low Grade` = '9' AND `High Grade` = '12';	california_schools
SELECT COUNT(CDSCode) FROM frpm WHERE `County Name` = 'Los Angeles' AND `Free Meal Count (K-12)` > 500 AND `FRPM Count (K-12)` < 700;	california_schools
SELECT      s.School,     SUM(sa.NumTstTakr) as total_takers FROM      schools s INNER JOIN      satscores sa ON s.CDSCode = sa.cds WHERE      s.County = 'Contra Costa' GROUP BY      s.School ORDER BY      total_takers DESC LIMIT 1;	california_schools
SELECT s.School, s.Street || ', ' || s.City || ', ' || s.Zip AS Address FROM frpm f INNER JOIN schools s ON f.CDSCode = s.CDSCode WHERE (f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`) > 30;	california_schools
SELECT f.[School Name] FROM frpm f INNER JOIN satscores s ON f.CDSCode = s.cds WHERE f.[Percent (%) Eligible Free (K-12)] > 0.1 AND s.NumGE1500 >= 1;	california_schools
SELECT SchoolName, FundingType FROM schools WHERE County = 'SpecificCounty';	california_schools
SELECT      s.School,     COALESCE(frs.`School Name`, 'N/A') AS s_name,     COALESCE(s.Street, 'N/A'),     COALESCE(s.City, 'N/A'),     COALESCE(s.State, 'N/A'),     COALESCE(s.Zip, 'N/A') FROM `frpm` frs JOIN schools s ON frs.CDSCode = s.CDSCode WHERE frs.`County Name` = 'Monterey' AND frs.`FRPM Count (Ages 5-17)` > 800	california_schools
SELECT s.SchoolName, AVG(sa.AvgScrWrite) AS AverageWritingScore, s.Phone FROM schools s INNER JOIN satscores sa ON s.CDSCode = sa.cds WHERE OpenDate > '1991-12-31' OR ClosedDate < '2000-01-01' GROUP BY s.SchoolName	california_schools
WITH avg_diff AS (   SELECT AVG(f.Enrollment_K12 - f.Enrollment_Ages_5_17) AS avg_diff   FROM frpm f   INNER JOIN schools s ON f.CDSCode = s.CDSCode   WHERE s.FundingType = 'Local' ) SELECT s.School, s.DOCType FROM frpm f INNER JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.FundingType = 'Local' AND (f.[Enrollment (K-12)] - f.[Enrollment (Ages 5-17)]) > (SELECT avg_diff FROM avg_diff);	california_schools
SELECT s.OpenDate FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`Enrollment (K-12)` = (SELECT MAX(`Enrollment (K-12)`) FROM frpm) LIMIT 1;	california_schools
SELECT City FROM schools INNER JOIN frpm ON schools.CDSCode = frpm.CDSCode ORDER BY `Enrollment (K-12)` ASC LIMIT 5	california_schools
SELECT      s.SchoolName,     (f.`Free Meal Count (K-12)` / f.`Enrollment (K-12)`) AS EligibleFreeRate FROM (     SELECT          CDSCode,         SchoolName,         `Enrollment (K-12)`,         ROW_NUMBER() OVER (ORDER BY `Enrollment (K-12)` DESC) AS Rank     FROM frpm ) s WHERE Rank IN (10, 11);	california_schools
SELECT `School Name`, `FRPM Count (K-12)`, (`FRPM Count (K-12)` / `Enrollment (K-12)`) AS EligibleFreeRate FROM frpm WHERE `EdOpsCode` = '66' ORDER BY `FRPM Count (K-12)` DESC LIMIT 5	california_schools
SELECT s.Website, f.`School Name` FROM frpm f INNER JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`Free Meal Count (Ages 5-17)` BETWEEN 1900 AND 2000	california_schools
SELECT      (T1.`Free Meal Count (Ages 5-17)` / T1.`Enrollment (Ages 5-17)`) * 100 AS FreeRate FROM frpm T1 JOIN schools T2 ON T1.CDSCode = T2.CDSCode WHERE      (T2.AdmFName1 = 'Kacey' AND T2.AdmLName1 = 'Gibson')     OR (T2.AdmFName2 = 'Kacey' AND T2.AdmLName2 = 'Gibson')     OR (T2.AdmFName3 = 'Kacey' AND T2.AdmLName3 = 'Gibson');	california_schools
SELECT T2.AdmEmail1 || T2.AdmEmail2 || T2.AdmEmail3 AS Administrator_Email FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Charter School (Y/N)` = 1 AND T1.`Enrollment (K-12)` = (     SELECT MIN(`Enrollment (K-12)`)     FROM frpm     WHERE `Charter School (Y/N)` = 1 ) LIMIT 1;	california_schools
SELECT s.AdmFName1, s.AdmLName1, s.AdmFName2, s.AdmLName2, s.AdmFName3, s.AdmLName3  FROM schools s  WHERE s.CDSCode IN (   SELECT sc.cds    FROM satscores sc    WHERE sc.NumGE1500 = (SELECT MAX(NumGE1500) FROM satscores) );	california_schools
SELECT s.Street, s.City, s.State, s.Zip FROM schools s INNER JOIN satscores sc ON s.CDSCode = sc.cds WHERE (sc.NumGE1500 / sc.NumTstTakr) = (     SELECT MIN(NumGE1500 / NumTstTakr)     FROM satscores );	california_schools
SELECT T2.Website FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode INNER JOIN satscores AS T3 ON T1.CDSCode = T3.cds WHERE T1.`County Name` = 'Los Angeles' AND T3.NumTstTakr BETWEEN 2000 AND 3000	california_schools
SELECT AVG(sa.NumTstTakr) FROM schools s, satscores sa WHERE s.CDSCode = sa.cds AND s.County = 'Fresno' AND s.OpenDate BETWEEN '1980-01-01' AND '1980-12-31';	california_schools
SELECT s.Phone FROM schools s JOIN satscores sa ON s.CDSCode = sa.cds WHERE s.District = 'Fresno Unified' AND sa.AvgScrRead IS NOT NULL ORDER BY sa.AvgScrRead ASC LIMIT 1;	california_schools
SELECT      s.School AS SchoolName,     s.County AS CountyName,     ss.AvgScrRead AS AverageReadingScore FROM (     SELECT          s.CDSCode,         s.School,         s.County,         ss.AvgScrRead,         RANK() OVER (PARTITION BY s.County ORDER BY ss.AvgScrRead DESC) AS RankWithinCounty     FROM schools s     JOIN satscores ss ON s.CDSCode = ss.cds     WHERE s.Virtual = 'F' AND ss.AvgScrRead IS NOT NULL ) AS Subquery WHERE RankWithinCounty <= 5;	california_schools
SELECT T1.`Educational Option Type` FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrMath = (SELECT MAX(AvgScrMath) FROM satscores) LIMIT 1;	california_schools
SELECT s.AvgScrMath, sc.County  FROM satscores s  JOIN schools sc ON s.CDSCode = sc.CDSCode  WHERE (s.AvgScrRead + s.AvgScrMath + s.AvgScrWrite) = (     SELECT MIN(AvgScrRead + AvgScrMath + AvgScrWrite)      FROM satscores );	california_schools
WITH SchoolPerformance AS (     SELECT          CDSCode,         SUM(NumGE1500) AS TotalHighScorers     FROM satscores     WHERE (AvgScrRead + AvgScrMath + AvgScrWrite) >= 1500     GROUP BY CDSCode ), TopSchool AS (     SELECT TOP 1 CDSCode     FROM SchoolPerformance     ORDER BY TotalHighScorers DESC ) SELECT      (SELECT AVG(AvgScrWrite) FROM satscores WHERE CDSCode = ts.CDSCode AND (AvgScrRead + AvgScrMath + AvgScrWrite) >= 1500) AS AverageWriting,     (SELECT City FROM schools WHERE CDSCode = ts.CDSCode) AS City FROM TopSchool ts;	california_schools
SELECT s.sname, AVG(sa.AvgScrWrite) AS Average_Writing_Score FROM schools s JOIN satscores sa ON s.CDSCode = sa.cds WHERE s.AdmFName1 = 'Ricci' AND s.AdmLName1 = 'Ulrich' GROUP BY s.sname;	california_schools
SELECT s.School, f.`Enrollment (K-12)`  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE s.DOC = '31'  ORDER BY f.`Enrollment (K-12)` DESC;	california_schools
SELECT CAST(COUNT(*) AS REAL) / 12 FROM schools WHERE County = 'Alameda' AND DOC = '52' AND strftime('%Y', OpenDate) = '1980';	california_schools
SELECT      (SUM(CASE WHEN DOC = 54 AND County = 'Orange' THEN 1 ELSE 0 END) * 1.0) /      NULLIF(SUM(CASE WHEN DOC = 52 AND County = 'Orange' THEN 1 ELSE 0 END), 0) AS Ratio FROM schools;	california_schools
SELECT      County,     School,     ClosedDate,     COUNT(*) OVER (PARTITION BY County) AS NumberOfClosedSchools FROM schools WHERE StatusType = 'Closed' ORDER BY County;	california_schools
SELECT s.Street, s.City, sc.School  FROM satscores  JOIN schools s ON satscores.cds = s.CDSCode  WHERE rtype = 'S'  ORDER BY AvgScrMath DESC  LIMIT 6,1;	california_schools
SELECT s.MailStreet, s.School  FROM schools s  INNER JOIN satscores sa ON s.CDSCode = sa.cds  WHERE sa.AvgScrRead IS NOT NULL  ORDER BY sa.AvgScrRead ASC  LIMIT 1;	california_schools
SELECT COUNT(DISTINCT s.CDSCode) FROM satscores sa INNER JOIN schools s ON sa.CDSCode = s.CDSCode WHERE s.MailCity = 'Lakeport' AND (sa.AvgScrRead + sa.AvgScrMath + sa.AvgScrWrite) >= 1500;	california_schools
SELECT      s.SchoolName,     SUM(sa.NumTstTakr) AS TotalTestTakers FROM      schools s INNER JOIN      satscores sa ON s.CDSCode = sa.cds WHERE      s.MailCity = 'Fresno' GROUP BY      s.School;	california_schools
SELECT School, MailZip FROM schools WHERE (AdmFName1 = 'Avetik' AND AdmLName1 = 'Atoian') OR (AdmFName2 = 'Avetik' AND AdmLName2 = 'Atoian') OR (AdmFName3 = 'Avetik' AND AdmLName3 = 'Atoian');	california_schools
SELECT    COUNT(CASE WHEN County = 'Colusa' AND MailState = 'CA' THEN CDSCode ELSE NULL END) /    COUNT(CASE WHEN County = 'Humboldt' AND MailState = 'CA' THEN CDSCode ELSE NULL END) AS Ratio FROM schools;	california_schools
SELECT COUNT(*) FROM schools WHERE StatusType = 'Active' AND MailState = 'CA' AND City = 'San Joaquin';	california_schools
SELECT Phone, Ext FROM (     SELECT s.Phone, s.Ext, ROW_NUMBER() OVER (ORDER BY sc.AvgScrWrite DESC) AS RowNum     FROM schools s     JOIN satscores sc ON s.CDSCode = sc.cds ) WHERE RowNum = 333;	california_schools
SELECT `Phone`, `Ext`, `School` FROM `schools` WHERE `Zip` = '95203-3704'	california_schools
SELECT `Website` FROM `schools` WHERE (`AdmFName1` = 'Mike' AND `AdmLName1` = 'Larson')    OR (`AdmFName2` = 'Mike' AND `AdmLName2` = 'Larson')    OR (`AdmFName3` = 'Mike' AND `AdmLName3` = 'Larson')    OR (`AdmFName1` = 'Dante' AND `AdmLName1` = 'Alvarez')    OR (`AdmFName2` = 'Dante' AND `AdmLName2` = 'Alvarez')    OR (`AdmFName3` = 'Dante' AND `AdmLName3` = 'Alvarez');	california_schools
SELECT `Website` FROM `schools` WHERE `Virtual` = 'P' AND `Charter` = 1 AND `County` = 'San Joaquin';	california_schools
SELECT COUNT(*)  FROM schools  WHERE City = 'Hickman' AND Charter = 1 AND DOC = '52';	california_schools
SELECT COUNT(*) FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.Charter = 0 AND frpm.`County Name` = 'Los Angeles' AND `Percent (%) Eligible Free (K-12)` < 0.18;	california_schools
SELECT DISTINCT School, City, AdmFName1 || ' ' || AdmLName1 AS Admin1, AdmFName2 || ' ' || AdmLName2 AS Admin2, AdmFName3 || ' ' || AdmLName3 AS Admin3 FROM schools WHERE Charter = 1 AND CharterNum = '00D2'	california_schools
SELECT COUNT(*) FROM schools WHERE MailCity = 'Hickman' AND CharterNum = '00D4';	california_schools
SELECT      (SELECT COUNT(*) FROM schools WHERE County = 'Santa Clara' AND FundingType = 'Local') /      (SELECT COUNT(*) FROM schools WHERE County = 'Santa Clara' AND FundingType IS NOT NULL) * 100;	california_schools
SELECT COUNT(*) FROM schools  WHERE FundingType = 'Directly Funded'  AND County = 'Stanislaus'  AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31';	california_schools
SELECT COUNT(*) FROM schools WHERE City = 'San Francisco' AND District LIKE '%Community%College%' AND strftime('%Y', ClosedDate) = '1989';	california_schools
SELECT County, COUNT(ClosedDate) AS ClosureCount  FROM schools  WHERE SOC = '11' AND ClosedDate BETWEEN '1980-01-01' AND '1989-12-31' GROUP BY County ORDER BY ClosureCount DESC;	california_schools
SELECT NCESDist FROM schools WHERE SOC IS NOT NULL AND SOCType = 31	california_schools
SELECT s.StatusType, COUNT(*)  FROM frpm f INNER JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`County Name` = 'Alpine' AND f.`School Type` = 'District Community Day' GROUP BY s.StatusType;	california_schools
SELECT T1.`District Code` FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.Magnet = 0 AND T2.City = 'Fresno';	california_schools
SELECT frpm.`Enrollment (Ages 5-17)` FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.EdOpsCode = 'SSS'   AND schools.County = 'Fremont'   AND frpm.`Academic Year` = '2014-2015';	california_schools
SELECT f.`Free Meal Count (Ages 5-17)` FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.School = 'Youth Authority School' AND s.MailStreet = 'PO Box 1040';	california_schools
SELECT `Low Grade` FROM frpm INNER JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.NCESDist = '0613360' AND schools.EdOpsCode = 'SPECON';	california_schools
SELECT T1.`School Name`, T2.`EdOpsName` FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`NSLP Provision Status` = '2' AND T1.`County Code` = '37';	california_schools
SELECT T2.City FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.CountyName = 'Merced' AND T1.LowGrade = '9' AND T1.HighGrade = '12' AND T1.NSLPProvisionStatus = 2 AND T2.EILCode = 'HS'	california_schools
SELECT s.SchoolName,         ROUND(100 * f.`FRPM Count (Ages 5-17)` / f.`Enrollment (Ages 5-17)`, 2) AS PercentEligibleFRPM FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`Low Grade` = 'K'   AND f.`High Grade` = '09'   AND f.`County Name` = 'Los Angeles';	california_schools
SELECT Low_Grade, High_Grade, COUNT(*) as CountOfGradeSpan FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.City = 'Adelanto' GROUP BY Low_Grade, High_Grade ORDER BY CountOfGradeSpan DESC;	california_schools
SELECT County, COUNT(*) as num_virtual_schools  FROM schools  WHERE Virtual = 'F' AND (County = 'San Diego' OR County = 'Santa Barbara')  GROUP BY County;	california_schools
SELECT f.`School Type`, s.School, s.Latitude  FROM frpm f  INNER JOIN schools s  ON f.CDSCode = s.CDSCode  ORDER BY s.Latitude DESC  LIMIT 1;	california_schools
SELECT s.City AS City, s.School AS SchoolName, f.`Low Grade` AS LowGrade FROM schools s INNER JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.State = 'CA' ORDER BY s.Latitude ASC LIMIT 1	california_schools
SELECT `Low Grade`, `High Grade` FROM frpm WHERE CDSCode = (SELECT CDSCode FROM schools ORDER BY ABS(Longitude) DESC LIMIT 1);	california_schools
WITH k8_magnet_cities AS (   SELECT s.City, f.Educational Option Type    FROM frpm f   INNER JOIN schools s ON f.CDSCode = s.CDSCode   WHERE f.Magnet = 1 AND f.Low Grade = 'K' AND f.High Grade = '8' ) SELECT COUNT(*) as total_k8_magnet_schools, City, COUNT(City) as number_of_schools_in_city FROM k8_magnet_cities GROUP BY City;	california_schools
WITH AllFirstNames AS (   SELECT AdmFName1 AS FirstName, District FROM YourTable   UNION ALL   SELECT AdmFName2, District FROM YourTable WHERE AdmFName2 IS NOT NULL   UNION ALL   SELECT AdmFName3, District FROM YourTable WHERE AdmFName3 IS NOT NULL ), FirstNameCounts AS (   SELECT      FirstName,     COUNT(*) as Count   FROM AllFirstNames   GROUP BY FirstName ) SELECT    A.FirstName,   A.District FROM AllFirstNames A JOIN (   SELECT FirstName, ROW_NUMBER() OVER (ORDER BY Count DESC) as RowNum   FROM FirstNameCounts ) B ON A.FirstName = B.FirstName AND B.RowNum <= 2;	california_schools
SELECT CAST((T1.`Free Meal Count (K-12)` / T1.`Enrollment (K-12)`) * 100 AS REAL) AS "Percent (%) Eligible Free (K-12)", T1.`District Code` FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.AdmFName1 = 'Alusine' OR T2.AdmFName2 = 'Alusine' OR T2.AdmFName3 = 'Alusine';	california_schools
SELECT AdmLName1 AS AdministratorLastname, District, County, School FROM schools WHERE CharterNum = '40'	california_schools
SELECT AdmEmail1, AdmEmail2, AdmEmail3 FROM schools WHERE County = 'San Bernardino' AND District = 'City of San Bernardino' AND (SOC = 62 OR DOC = 54) AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31';	california_schools
SELECT T1.School, T1.AdmEmail1 FROM schools AS T1 WHERE T1.CDSCode = (   SELECT T2.cds FROM satscores AS T2 WHERE T2.rtype = 'S' AND T2.NumGE1500 > 0 ORDER BY T2.NumGE1500 DESC LIMIT 1 );	california_schools
SELECT COUNT(a.account_id)  FROM account a  JOIN district d ON a.district_id = d.district_id  WHERE a.frequency = 'POPLATEK PO OBRATU' AND d.A3 = 'VYCHODNÍ ČECHY';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A3 = 'Prague' AND a.account_id IN (SELECT account_id FROM loan);	financial
SELECT AVG(A12) AS avg_1995, AVG(A13) AS avg_1996 FROM district;	financial
SELECT      COUNT(*) AS number_of_districts FROM (     SELECT          district,         AVG(salary) AS avg_female_salary     FROM          data     WHERE          gender = 'F'     GROUP BY          district     HAVING          AVG(salary) BETWEEN 6000 AND 10000 ) AS districts_with_avg_salary;	financial
SELECT COUNT(*)  FROM client c  INNER JOIN district d ON c.district_id = d.district_id  WHERE c.gender = 'M' AND d.A3 = 'North Bohemia' AND d.A11 > 8000;	financial
WITH ranked_female_clients AS (     SELECT c.client_id, c.birth_date, d.A11,            ROW_NUMBER() OVER (PARTITION BY d.district_id ORDER BY c.birth_date) AS oldest_in_district     FROM client c     JOIN district d ON c.district_id = d.district_id     WHERE c.gender = 'F' ), min_A11 AS (     SELECT MIN(A11) AS min_val     FROM ranked_female_clients ) SELECT ac.account_number, rfc.birth_date FROM ranked_female_clients rfc JOIN account ac ON rfc.client_id = ac.client_id WHERE rfc.A11 = (SELECT min_val FROM min_A11) AND rfc.oldest_in_district = 1;	financial
WITH top_districts AS (     SELECT district_id     FROM district     WHERE A11 = (SELECT MAX(A11) FROM district) ), clients_in_top AS (     SELECT c.client_id, c.birth_date     FROM client c     WHERE c.district_id IN (SELECT district_id FROM top_districts) ), max_birthdate AS (     SELECT MAX(birth_date) as max_bd     FROM clients_in_top ) SELECT cit.client_id  FROM clients_in_top cit WHERE cit.birth_date = (SELECT max_bd FROM max_birthdate);	financial
SELECT COUNT(DISTINCT d.client_id) FROM account a JOIN disp d ON a.account_id = d.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND d.type = 'OWNER';	financial
SELECT d.client_id  FROM disp d  WHERE d.account_id IN (   SELECT a.account_id    FROM account a    WHERE a.frequency = 'POPLATEK PO OBRATU' );	financial
SELECT l.account_id FROM Loans l JOIN Accounts a ON l.account_id = a.account_id WHERE EXTRACT(YEAR FROM l.date) = 1997   AND a.frequency = 'POPLATEK TYDNE'   AND l.amount = (     SELECT MIN(l2.amount)     FROM Loans l2     JOIN Accounts a2 ON l2.account_id = a2.account_id     WHERE EXTRACT(YEAR FROM l2.date) = 1997       AND a2.frequency = 'POPLATEK TYDNE'   );	financial
SELECT a.account_id FROM account a INNER JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 12 AND a.date BETWEEN '1993-01-01' AND '1993-12-31' GROUP BY a.account_id HAVING MAX(l.amount) = (     SELECT MAX(max_amount)     FROM (         SELECT a.account_id, MAX(l.amount) as max_amount         FROM account a         INNER JOIN loan l ON a.account_id = l.account_id         WHERE l.duration > 12 AND a.date BETWEEN '1993-01-01' AND '1993-12-31'         GROUP BY a.account_id     ) sub );	financial
SELECT COUNT(T1.client_id) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' AND T1.birth_date < '1950-01-01' AND T2.A2 = 'Sokolov'	financial
SELECT account_id FROM trans WHERE date = ( SELECT MIN(date) FROM trans WHERE STRFTIME('%Y', date) = '1995' ) AND STRFTIME('%Y', date) = '1995';	financial
SELECT DISTINCT a.account_id FROM account a JOIN trans t ON a.account_id = t.account_id WHERE a.date < '1997-01-01' AND t.balance > 3000 AND t.trans_id = (SELECT MAX(trans_id) FROM trans WHERE account_id = a.account_id);	financial
SELECT T.client_id FROM disp AS T INNER JOIN card AS C ON T.disp_id = C.disp_id WHERE C.issue_date = '1994-03-03'	financial
SELECT T1.date  FROM account T1  WHERE T1.account_id = (     SELECT T2.account_id      FROM trans T2      WHERE T2.amount = 840 AND T2.date = '1998-10-14' );	financial
SELECT T1.district_id FROM account AS T1 JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.date = '1994-08-25';	financial
SELECT MAX(t.amount) AS max_amount FROM trans t JOIN disp d ON t.account_id = d.account_id JOIN card c ON d.disp_id = c.disp_id WHERE c.issued = '1996-10-21';	financial
SELECT c.gender FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE a.district_id IN (SELECT district_id FROM district WHERE A11 = (SELECT MAX(A11) FROM district)) ORDER BY c.birth_date ASC LIMIT 1;	financial
SELECT t1.amount AS First_Transaction_Amount FROM trans t1 WHERE t1.account_id = (   SELECT t2.account_id   FROM loan t2   WHERE t2.amount = (     SELECT MAX(amount)     FROM loan   ) ) ORDER BY t1.date ASC LIMIT 1;	financial
SELECT COUNT(DISTINCT c.client_id) AS number_of_female_clients_at_jesenik FROM client c WHERE c.gender = 'F' AND c.client_id IN (SELECT client_id FROM disp);	financial
SELECT d.disp_id  FROM disp d  INNER JOIN trans t ON d.account_id = t.account_id  WHERE t.amount = 5100 AND t.date = '1998-09-02';	financial
SELECT COUNT(*) FROM account  JOIN district ON account.district_id = district.district_id  WHERE STRFTIME('%Y', date) = '1996' AND A2 = 'Litomerice';	financial
SELECT d.A2 AS district_name FROM client c JOIN disp di ON c.client_id = di.client_id JOIN account a ON di.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE c.gender = 'F' AND c.birth_date = '1976-01-29';	financial
SELECT c.birth_date FROM loan l JOIN account a ON l.account_id = a.account_id JOIN client c ON a.client_id = c.client_id WHERE l.amount = 98832 AND l.date = '1996-01-03';	financial
SELECT a.account_id  FROM account a  WHERE a.district_id = (SELECT id FROM district WHERE A3 = 'Prague')  ORDER BY a.date ASC  LIMIT 1;	financial
SELECT      (COUNT(CASE WHEN gender = 'M' THEN 1 ELSE NULL END) / COUNT(district_id)) * 100 AS percentage_male FROM client WHERE district_id = (     SELECT district_id     FROM district     WHERE A3 = 'South Bohemia'     ORDER BY A4 DESC     LIMIT 1 );	financial
WITH account_id AS (     SELECT t.account_id     FROM loan l     WHERE l.status = 'A'     ORDER BY l.loan_date ASC     LIMIT 1 ), balance_b AS (     SELECT t.balance     FROM trans t     WHERE t.account_id = (SELECT * FROM account_id)       AND t.trans_date <= '1993-03-22'     ORDER BY t.trans_date DESC     LIMIT 1 ), balance_a AS (     SELECT t.balance     FROM trans t     WHERE t.account_id = (SELECT * FROM account_id)       AND t.trans_date <= '1998-12-27'     ORDER BY t.trans_date DESC     LIMIT 1 ) SELECT ((COALESCE(a.balance, 0) - COALESCE(b.balance, 0)) / COALESCE(b.balance, 1)) * 100 AS increase_rate FROM balance_a a CROSS JOIN balance_b b;	financial
SELECT CAST((SUM(CASE WHEN status = 'A' THEN amount ELSE 0 END)) AS REAL) * 100 / SUM(amount) FROM loan;	financial
SELECT      (COUNT(CASE WHEN status = 'C' THEN loan_id END) / COUNT(loan_id)) * 100 FROM      loan WHERE      amount < 100000;	financial
SELECT      a.account_id,     d.A2 AS district_name,     d.A3 AS region FROM account a INNER JOIN district d ON a.branch_id = d.branch_id WHERE a.date BETWEEN '1993-01-01' AND '1993-12-31';	financial
SELECT a.account_id, a.frequency FROM account a JOIN client c ON a.account_id = c.account_id JOIN district d ON c.district_id = d.district_id WHERE a.date BETWEEN '1995-01-01' AND '2000-12-31' AND d.region_name = 'east Bohemia';	financial
SELECT a.account_id, a.date  FROM account a  INNER JOIN district d ON a.district_id = d.district_id  WHERE d.A2 = 'Prachatice';	financial
SELECT d.A2 AS district, d.A3 AS region FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.id = 4990;	financial
SELECT a.account_id, d.A2 AS district, d.A3 AS region  FROM loan l  JOIN account a ON l.account_id = a.account_id  JOIN district d ON a.district_id = d.district_id  WHERE l.amount > 300000;	financial
SELECT l.loan_id, d.A3 AS district, d.A11 AS average_salary  FROM loan l  INNER JOIN account a ON l.account_id = a.account_id  INNER JOIN district d ON a.district_id = d.district_id  WHERE l.duration = 60;	financial
SELECT DISTINCT d.district_id, ((d.A13 - d.A12) / d.A12) * 100 AS unemployment_increment FROM loan l INNER JOIN account a ON l.account_id = a.account_id INNER JOIN district d ON a.district_id = d.district_id WHERE l.status = 'D' AND d.A12 IS NOT NULL AND d.A13 IS NOT NULL;	financial
WITH TotalAccounts AS (     SELECT COUNT(*) as TotalCount FROM Account WHERE strftime('%Y', date) = '1993' ), DecinAccounts AS (     SELECT COUNT(D.district_id) as DecinCount FROM Account A     JOIN District D ON A.district_id = D.district_id     WHERE strftime('%Y', A.date) = '1993' AND D.A2 = 'Decin' ) SELECT ROUND((DecinCount / TotalCount) * 100, 2) AS Percentage FROM DecinAccounts, TotalAccounts;	financial
SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE';	financial
SELECT      c.district_id,     COUNT(DISTINCT c.client_id) AS female_account_holder_count FROM      client c INNER JOIN      disp d ON c.client_id = d.client_id WHERE      c.gender = 'F' GROUP BY      c.district_id ORDER BY      female_account_holder_count DESC LIMIT 9;	financial
SELECT d.A2 AS District_Name, SUM(t.amount) AS Total_Withdrawals    FROM trans t    JOIN account a ON t.account_id = a.account_id    JOIN district d ON a.district_id = d.id    WHERE t.type = 'VYDAJ' AND t.date LIKE '1996-01%'    GROUP BY d.A2    ORDER BY Total_Withdrawals DESC    LIMIT 10;	financial
SELECT COUNT(*)  FROM client c JOIN district d ON c.district_id = d.district_id WHERE d.A3 = 'South Bohemia' AND c.client_id NOT IN (     SELECT dp.client_id     FROM disp dp     JOIN card ca ON dp.disp_id = ca.disp_id );	financial
SELECT A3 FROM (   SELECT d.A3, SUM(l.amount) as total_amount   FROM loan l   JOIN account a ON l.account_id = a.account_id   JOIN district d ON a.district_id = d.district_id   WHERE l.status IN ('C', 'D')   GROUP BY d.A3   ORDER BY total_amount DESC ) AS subquery LIMIT 1;	financial
SELECT AVG(l.amount) AS average_loan_amount FROM loan l INNER JOIN disp d ON l.account_id = d.account_id INNER JOIN client c ON d.client_id = c.client_id WHERE c.gender = 'M';	financial
SELECT A2 AS District_Name, A13 AS Unemployment_Rate_1996     FROM district     ORDER BY A13 DESC;	financial
SELECT      COUNT(a.account_id) AS number_of_accounts FROM      accounts a JOIN      branches b ON a.branch_id = b.branch_id JOIN      districts d ON b.district_id = d.district_id WHERE      EXTRACT(YEAR FROM a.open_date) = 2023     AND d.A16 = (SELECT MAX(A16) FROM districts);	financial
SELECT COUNT(DISTINCT t.account_id)  FROM trans t  INNER JOIN account a ON t.account_id = a.account_id  WHERE t.operation = 'VYBER KARTOU' AND t.balance < 0 AND a.frequency = 'POPLATEK MESICNE';	financial
SELECT COUNT(*)  FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.frequency = 'POPLATEK MESICNE'   AND T1.date BETWEEN '1995-01-01' AND '1997-12-31'   AND T1.amount >= 250000;	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.status IN ('C', 'D') AND a.district_id = 1;	financial
WITH ranked_districts AS (     SELECT district_id, A15,            RANK() OVER (ORDER BY A15 DESC) as crime_rank     FROM district     WHERE A15 IS NOT NULL ) SELECT district_id INTO @second_highest_district FROM ranked_districts WHERE crime_rank = 2;  SELECT COUNT(c.client_id) AS male_client_count FROM client c JOIN account a ON c.account_id = a.account_id WHERE a.district_id = @second_highest_district AND c.gender = 'M';	financial
SELECT      COUNT(c.card_id) AS count_gold_owner_cards FROM      card c INNER JOIN      disp d ON c.disp_id = d.disp_id WHERE      c.type = 'gold' AND d.type = 'OWNER';	financial
SELECT COUNT(a.account_id) FROM account a INNER JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Pisek';	financial
SELECT      t.account_id,     ab.district,     COUNT(t.trans_id) AS number_of_transactions,     SUM(t.amount) AS total_amount FROM      trans t JOIN      account a ON t.account_id = a.account_id JOIN      branch b ON a.branch_id = b.branch_id WHERE      EXTRACT(YEAR FROM t.date_trans) = 1997     AND t.amount > 10000 GROUP BY      ab.district;	financial
SELECT DISTINCT account_id FROM order WHERE k_symbol = 'SIPO';	financial
SELECT d.account_id FROM disp d JOIN card c ON d.disp_id = c.disp_id WHERE c.type = 'gold';	financial
SELECT      AVG(total_amount) AS avg_monthly_credit FROM (     SELECT          STRFTIME('%m', date) AS month_num,         SUM(amount) as total_amount     FROM trans     WHERE operation = 'VYBER KARTOU'       AND STRFTIME('%Y', date) = '2021'     GROUP BY STRFTIME('%m', date) );	financial
SELECT DISTINCT t.account_id  FROM trans t  WHERE operation = 'VYBER KARTOU'      AND date LIKE '1998%'      AND amount < (SELECT AVG(amount) FROM trans WHERE operation = 'VYBER KARTOU' AND date LIKE '1998%');	financial
SELECT c.client_id FROM client c WHERE c.gender = 'F' AND EXISTS (   SELECT 1   FROM disp d   JOIN card ca ON d.account_id = ca.account_id   WHERE d.client_id = c.client_id ) AND EXISTS (   SELECT 1   FROM disp d   JOIN loan l ON d.account_id = l.account_id   WHERE d.client_id = c.client_id );	financial
SELECT COUNT(DISTINCT d.account_id) FROM disp d JOIN client c ON d.client_id = c.client_id WHERE c.gender = 'F' AND c.district_id IN (     SELECT district_id      FROM district      WHERE A3 = 'South Bohemia' );	financial
SELECT DISTINCT a.account_id  FROM account a  JOIN district d ON a.district_id = d.district_id  JOIN disp di ON a.account_id = di.account_id  WHERE d.A2 = 'Tabor' AND di.type = 'OWNER';	financial
SELECT      a.frequency,     COUNT(a.account_id) as count_of_accounts FROM      account a LEFT JOIN      disp d ON a.account_id = d.account_id AND d.type != 'OWNER' LEFT JOIN      client c ON a.account_id = c.account_id LEFT JOIN      district dt ON c.district_id = dt.district_id WHERE      dt.A11 BETWEEN 8000 AND 9000 GROUP BY      a.frequency;	financial
SELECT COUNT(DISTINCT a.account_id) FROM district d JOIN account a ON d.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id WHERE d.A3 = 'North Bohemia' AND t.bank = 'AB';	financial
SELECT DISTINCT d.A2  FROM trans t JOIN account a ON t.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE t.type = 'VYDAJ';	financial
SELECT AVG(d.A15) FROM district d WHERE d.A15 > 4000 AND EXISTS ( SELECT 1 FROM account a WHERE a.district_id = d.district_id AND a.date >= '1997-01-01' )	financial
SELECT COUNT(*)  FROM card C  INNER JOIN disp D ON C.disp_id = D.disp_id  WHERE C.type = 'classic' AND D.type = 'OWNER';	financial
SELECT COUNT(*)  FROM client  INNER JOIN district  ON client.district_id = district.district_id  WHERE client.gender = 'M' AND district.A2 = 'Hl.m. Praha';	financial
SELECT      ( (SELECT COUNT(*) FROM card WHERE type = 'gold' AND issued < '1998-01-01') /        (SELECT COUNT(*) FROM card) ) * 100;	financial
SELECT d.client_id  FROM loan l JOIN disp d ON l.account_id = d.account_id AND d.role = 'OWNER' WHERE l.amount = ( SELECT MAX(amount) FROM loan );	financial
SELECT d.A15 FROM district d JOIN account a ON d.district_id = a.district_id WHERE a.account_id = 532;	financial
SELECT a.district_id FROM account a JOIN order o ON a.account_id = o.account_id WHERE o.order_id = 33333;	financial
SELECT DISTINCT t.* FROM trans t WHERE t.operation = 'VYBER' AND t.account_id IN (     SELECT d.account_id     FROM disp d     WHERE d.client_id = 3356 )	financial
SELECT COUNT(DISTINCT l.account_id)  FROM account a  JOIN loan l ON a.account_id = l.account_id  WHERE a.frequency = 'POPLATEK TYDNE' AND l.amount < 200000;	financial
SELECT c.type FROM card c JOIN disp d ON c.disp_id = d.disp_id WHERE d.client_id = 13539;	financial
SELECT d.A3 FROM district d INNER JOIN client c ON d.district_id = c.district_id WHERE c.client_id = 3541;	financial
SELECT a.district_id, COUNT(DISTINCT a.account_id) AS account_count FROM loan l INNER JOIN account a ON l.account_id = a.account_id WHERE l.status = 'A' GROUP BY a.district_id ORDER BY account_count DESC;	financial
SELECT T3.*  FROM order AS T1 JOIN disp AS T2 ON T1.account_id = T2.account_id JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T1.order_id = 32423;	financial
SELECT t.* FROM trans t INNER JOIN account a ON t.account_id = a.account_id WHERE a.district_id = 5;	financial
SELECT COUNT(a.account_id)  FROM account a INNER JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Jesenik';	financial
SELECT DISTINCT d.client_id  FROM card c  INNER JOIN disp d ON c.disp_id = d.disp_id  WHERE c.type = 'junior' AND c.date >= '1997-01-01';	financial
SELECT      (COUNT(CASE WHEN c.gender = 'F' THEN 1 ELSE NULL END) / COUNT(c.client_id)) * 100 AS percentage_female FROM      client c WHERE      c.client_id IN (         SELECT              a.client_id         FROM              account a             JOIN district d ON a.district_id = d.district_id         WHERE              d.A11 > 10000         GROUP BY              a.client_id     );	financial
WITH male_loan_amounts AS (     SELECT          strftime('%Y', l.date) AS year,         SUM(l.amount) AS total_amount     FROM loan l     JOIN account a ON l.account_id = a.account_id     JOIN disp d ON a.account_id = d.account_id     JOIN client c ON d.client_id = c.client_id     WHERE c.gender = 'M'     GROUP BY strftime('%Y', l.date) ) SELECT      ((sum_1997 - sum_1996) / sum_1996) * 100 AS growth_rate FROM (     SELECT          total_amount AS sum_1996,         LEAD(total_amount, 1) OVER (ORDER BY year) AS sum_1997     FROM male_loan_amounts     WHERE year IN ('1996', '1997') );	financial
SELECT COUNT(*) FROM trans WHERE operation = 'VYBER KARTOU' AND DATE > '1995-12-31';	financial
SELECT      (SUM(CASE WHEN A3 = 'North Bohemia' THEN A16 ELSE 0 END) -      SUM(CASE WHEN A3 = 'East Bohemia' THEN A16 ELSE 0 END)) AS crime_difference FROM district;	financial
SELECT      SUM(CASE WHEN type = 'OWNER' THEN 1 ELSE 0 END) AS owner_count,     SUM(CASE WHEN type = 'DISPONENT' THEN 1 ELSE 0 END) AS disponent_count FROM disp WHERE account_id BETWEEN 1 AND 10;	financial
SELECT COUNT(*) AS frequency FROM trans WHERE operation = 'VYDAJ' AND account_id = 3;	financial
SELECT EXTRACT(YEAR FROM c.birth_date) FROM client c JOIN disp d ON c.client_id = d.client_id WHERE d.account_id = 130 AND d.type = 'OWNER';	financial
SELECT COUNT(DISTINCT a.account_id)  FROM account a  JOIN disp d ON a.account_id = d.account_id  WHERE a.frequency = 'POPLATEK PO OBRATU' AND d.type = 'OWNER';	financial
SELECT      SUM(l.amount) AS total_debt,     SUM(t.amount) AS total_paid FROM loan l LEFT JOIN trans t ON l.account_id = t.account_id WHERE l.status != 'A' GROUP BY l.account_id;	financial
SELECT t.balance, c.sex  FROM trans t  JOIN account a ON t.account_id = a.account_id  JOIN disp d ON a.account_id = d.account_id  JOIN client c ON d.client_id = c.client_id  WHERE d.client_id = 4 AND d.type = 'OWNER' AND t.trans_id = 851;	financial
SELECT c.type  FROM card c JOIN disp d ON c.disp_id = d.disp_id JOIN client cl ON d.client_id = cl.client_id WHERE cl.client_id = 9;	financial
SELECT SUM(t.amount) AS total FROM trans t JOIN account a ON t.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id WHERE c.client_id = 617 AND t.date LIKE '1998%'	financial
SELECT c.client_id FROM client c JOIN account a ON c.district_id = a.district_id JOIN district d ON a.district_id = d.id WHERE EXTRACT(YEAR FROM c.birth_date) BETWEEN 1983 AND 1987   AND d.name = 'East Bohemia';	financial
SELECT c.client_id FROM loan l INNER JOIN account a ON l.account_id = a.account_id INNER JOIN disp d ON a.account_id = d.account_id INNER JOIN client c ON d.client_id = c.client_id WHERE c.gender = 'F' GROUP BY c.client_id ORDER BY SUM(l.amount) DESC LIMIT 3;	financial
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN disp d ON c.client_id = d.client_id JOIN order o ON d.account_id = o.account_id WHERE c.gender = 'M' AND c.birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND o.k_symbol = 'SIPO' AND o.amount > 4000;	financial
SELECT COUNT(a.account_id) FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Beroun' AND a.date > '1996-12-31';	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c  INNER JOIN disp d ON c.client_id = d.client_id  INNER JOIN card ca ON d.disp_id = ca.disp_id  WHERE c.gender = 'F' AND ca.type = 'junior';	financial
SELECT      COUNT(CASE WHEN gender = 'F' THEN client_id END) AS female_count,     COUNT(client_id) AS total_clients,     (COUNT(CASE WHEN gender = 'F' THEN client_id END) / COUNT(client_id)) * 100 AS female_percentage FROM clients WHERE city = 'Prague';	financial
SELECT      (COUNT(CASE WHEN c.gender = 'M' THEN a.account_id ELSE NULL END) / COUNT(a.account_id)) * 100 AS percentage_male_clients_weekly_statements FROM      account a JOIN      client c ON a.client_id = c.client_id WHERE      a.frequency = 'POPLATEK TYDNE';	financial
SELECT COUNT(DISTINCT d.client_id) FROM account a JOIN disp d ON a.account_id = d.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND d.type = 'OWNER';	financial
SELECT a.account_id FROM accounts a JOIN loans l ON a.account_id = l.account_id WHERE a.date < '1997-01-01' AND l.duration > 24 AND l.amount = (     SELECT MIN(l2.amount)     FROM accounts a2     JOIN loans l2 ON a2.account_id = l2.account_id     WHERE a2.date < '1997-01-01' AND l2.duration > 24 );	financial
SELECT c.id AS account_number FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F' ORDER BY c.birth_date ASC, d.A11 ASC LIMIT 1;	financial
SELECT COUNT(c.client_id) FROM client c JOIN district d ON c.district_id = d.district_id WHERE strftime('%Y', c.birth_date) = '1920' AND d.A3 = 'East Bohemia';	financial
SELECT COUNT(*)  FROM loan  INNER JOIN account  ON loan.account_id = account.account_id  WHERE loan.duration = 24 AND account.frequency = 'POPLATEK TYDNE';	financial
SELECT AVG(l.amount) AS average_amount FROM loan l INNER JOIN account a ON l.account_id = a.account_id WHERE l.status IN ('C', 'D') AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT c.client_id, c.district_id  FROM client c  WHERE c.client_id NOT IN (     SELECT d.client_id      FROM disp d      WHERE d.type = 'DISPONENT' );	financial
SELECT DISTINCT c.client_id  FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account_credit_cards acc ON d.account_id = acc.account_id WHERE d.type = 'OWNER' AND acc.card_type = 'gold';	financial
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY COUNT(bond_type) DESC LIMIT 1;	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '-' AND a.element = 'cl';	toxicology
WITH double_bond_molecules AS (   SELECT DISTINCT molecule_id   FROM bond   WHERE bond_type = '-' ) SELECT AVG(o_count) AS average_oxygen_atoms FROM (   SELECT COUNT(a.atom_id) AS o_count   FROM double_bond_molecules dbm   LEFT JOIN atom a ON dbm.molecule_id = a.molecule_id AND a.element = 'O'   GROUP BY dbm.molecule_id ) sub;	toxicology
SELECT    CAST(     (SELECT COUNT(*) FROM bond WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+') AND bond_type = '-')      AS REAL   ) /    (SELECT COUNT(*) FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+'))  AS average_single_bonds_per_atom;	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'na'   AND m.label = '-'   AND a.molecule_id IS NOT NULL;	toxicology
SELECT m.molecule_id FROM molecule m WHERE m.label = '+' AND m.molecule_id IN (SELECT b.molecule_id FROM bond b WHERE b.bond_type = '#');	toxicology
SELECT      (SUM(IIF(element = 'c', 1, 0)) / COUNT(atom_id)) * 100 AS carbon_percentage FROM atom WHERE molecule_id IN (     SELECT DISTINCT molecule_id FROM bond WHERE bond_type = '=' );	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '#';	toxicology
SELECT COUNT(*) FROM atom WHERE element != 'br';	toxicology
SELECT COUNT(*) FROM `molecule` WHERE `label` = '+' AND `molecule_id` BETWEEN 'TR000' AND 'TR099';	toxicology
SELECT DISTINCT molecule_id FROM atom WHERE element = 'c';	toxicology
SELECT DISTINCT a.element  FROM atom a  WHERE a.atom_id IN (     SELECT c.atom_id FROM connected c WHERE c.bond_id = 'TR004_8_9'     UNION      SELECT c.atom_id2 FROM connected c WHERE c.bond_id = 'TR004_8_9' );	toxicology
SELECT DISTINCT T3.element AS elem1, T4.element AS elem2  FROM bond AS T1  INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id  INNER JOIN atom AS T3 ON T2.atom_id = T3.atom_id  INNER JOIN atom AS T4 ON T2.atom_id2 = T4.atom_id  WHERE T1.bond_type = '=';	toxicology
To determine the most numerous label among atoms containing hydrogen, we need to count each label's occurrences for such atoms and select the one with the highest count. Here's how it's done:  SELECT m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'h' GROUP BY m.label ORDER BY COUNT(a.atom_id) DESC LIMIT 1;	toxicology
SELECT DISTINCT b.bond_type FROM connected c LEFT JOIN atom a1 ON c.atom_id = a1.atom_id AND a1.element = 'Cl' LEFT JOIN atom a2 ON c.atom_id2 = a2.atom_id AND a2.element = 'Cl' JOIN bond b ON c.bond_id = b.bond_id WHERE (a1.atom_id IS NOT NULL) OR (a2.atom_id IS NOT NULL);	toxicology
SELECT DISTINCT a1.atom_id, a2.atom_id  FROM connected c1  JOIN connected c2 ON c1.bond_id = c2.bond_id  WHERE c1.bond_type = '-' AND c1.atom_id < c2.atom_id;	toxicology
SELECT c.atom_id, c.atom_id2  FROM connected c  WHERE c.molecule_id IN (SELECT m.molecule_id FROM molecule m WHERE m.label = '-');	toxicology
SELECT element FROM (   SELECT a.element, COUNT(a.atom_id) as count    FROM atom a   JOIN molecule m ON a.molecule_id = m.molecule_id   WHERE m.label = '-'   GROUP BY a.element ) ORDER BY count ASC LIMIT 1;	toxicology
SELECT T1.bond_type FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE (T2.atom_id = 'TR004_8' AND T2.atom_id2 = 'TR004_20') OR (T2.atom_id = 'TR004_20' AND T2.atom_id2 = 'TR004_8');	toxicology
SELECT label FROM molecule WHERE molecule_id NOT IN (   SELECT molecule_id FROM atom WHERE element = 'sn' ) AND label IN ('+', '-') AND label NOT IN (   SELECT label FROM molecule WHERE molecule_id NOT IN (     SELECT molecule_id FROM atom WHERE element = 'sn'   ) );	toxicology
SELECT COUNT(DISTINCT a.atom_id)  FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element IN ('i', 's') AND m.molecule_id NOT IN (   SELECT b1.molecule_id    FROM bond b1    WHERE b1.bond_type != '-' )	toxicology
SELECT T1.atom_id, T1.atom_id2 FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '#'	toxicology
SELECT DISTINCT atom_id FROM (   SELECT atom_id2 AS atom_id   FROM connected   WHERE atom_id IN (SELECT atom_id FROM atom WHERE molecule_id = 'TR181')   UNION   SELECT atom_id   FROM connected   WHERE atom_id2 IN (SELECT atom_id FROM atom WHERE molecule_id = 'TR181') ) AS t;	toxicology
SELECT      (COUNT(DISTINCT CASE WHEN a.element != 'f' THEN m.molecule_id END) * 100) / COUNT(DISTINCT m.molecule_id) FROM molecule m LEFT JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' GROUP BY m.molecule_id HAVING a.element != 'f';	toxicology
SELECT      SUM(CASE WHEN bond.bond_type = '#' THEN 1 ELSE 0 END) * 100 / COUNT(bond.bond_id) AS percent FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.label = '+';	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR000' GROUP BY element ORDER BY COUNT(*) DESC, element ASC LIMIT 3;	toxicology
SELECT atom_id, atom_id2 FROM connected WHERE bond_id = 'TR001_2_6';	toxicology
SELECT SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN label = '-' THEN 1 ELSE 0 END) AS difference FROM molecule;	toxicology
SELECT atom_id, atom_id2 FROM connected WHERE bond_id = 'TR000_2_5';	toxicology
SELECT DISTINCT bond_id FROM connected WHERE atom_id2 = 'TR000_2';	toxicology
SELECT m.label FROM (     SELECT b.molecule_id, COUNT(*) as count     FROM bond b     WHERE b.bond_type = '='     GROUP BY b.molecule_id     HAVING COUNT(b.bond_type) >= 1 ) AS sub JOIN molecule m ON sub.molecule_id = m.molecule_id ORDER BY m.label ASC LIMIT 5;	toxicology
SELECT CAST(ROUND(CAST(SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(bond_id) * 100, 5) AS TEXT) || '%' AS result FROM bond WHERE molecule_id = 'TR008';	toxicology
SELECT ROUND((SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) / COUNT(molecule_id)) * 100, 3) AS percentage;	toxicology
SELECT CAST( (SUM(CASE WHEN element = 'h' THEN 1 ELSE 0 END) / COUNT(atom_id)) * 100 AS DECIMAL(10,4) ) FROM atom WHERE molecule_id = 'TR206';	toxicology
SELECT bond_type FROM bond WHERE molecule_id = 'TR000';	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR060'; SELECT DISTINCT element FROM atom WHERE molecule_id = 'TR060';	toxicology
SELECT bond_type     FROM bond     WHERE molecule_id = 'TR010'    GROUP BY bond_type    ORDER BY COUNT(*) DESC    LIMIT 1;	toxicology
SELECT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '-' AND m.label = '-' ORDER BY m.molecule_id ASC LIMIT 3;	toxicology
SELECT DISTINCT bond_type FROM bond WHERE molecule_id = 'TR006' ORDER BY bond_type ASC LIMIT 2;	toxicology
SELECT COUNT(*)  FROM connected  WHERE (atom_id = 'TR009_12' OR atom_id2 = 'TR009_12')  AND bond_id IN (     SELECT bond_id FROM bond WHERE molecule_id = 'TR009' );	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' AND a.element = 'br';	toxicology
SELECT b.bond_type, c.atom_id, c.atom_id2  FROM bond b  JOIN connected c ON b.bond_id = c.bond_id  WHERE b.bond_id = 'TR001_6_9';	toxicology
SELECT m.molecule_id, m.label  FROM atom a  INNER JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE a.atom_id = 'TR001_10';	toxicology
SELECT COUNT(DISTINCT molecule_id) AS number_of_molecules_with_triple_bond  FROM bond  WHERE bond_type = '#';	toxicology
SELECT COUNT(*) / 2 AS num_connections  FROM connected  WHERE atom_id LIKE 'TR%_19' OR atom_id2 LIKE 'TR%_19';	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR004';	toxicology
To determine how many molecules are not carcinogenic, we count the rows in the `molecule` table where the `label` is '-'.  **Answer:**   SELECT COUNT(*) FROM molecule WHERE label = '-';	toxicology
SELECT DISTINCT a.molecule_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE SUBSTR(a.atom_id, 7, 2) BETWEEN '21' AND '25' AND m.label = '+';	toxicology
SELECT DISTINCT T1.bond_id FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id = T2.atom_id JOIN atom AS T3 ON T1.atom_id2 = T3.atom_id WHERE (T2.element = 'p' AND T3.element = 'n')     OR (T2.element = 'n' AND T3.element = 'p')	toxicology
SELECT T.label FROM (   SELECT m.molecule_id, COUNT(b.bond_type) AS num_bonds, m.label   FROM bond b   LEFT JOIN molecule m ON b.molecule_id = m.molecule_id   WHERE b.bond_type = '='   GROUP BY b.molecule_id ) T WHERE T.num_bonds = (SELECT MAX(num_bonds) FROM (   SELECT m.molecule_id, COUNT(b.bond_type) AS num_bonds   FROM bond b   LEFT JOIN molecule m ON b.molecule_id = m.molecule_id   WHERE b.bond_type = '='   GROUP BY b.molecule_id ))	toxicology
python import pandas as pd  def calculate_average_neighbor_degree(df, node='I'):     """     Calculate the average degree of node 'I's neighbors for each year.          Parameters:     df (DataFrame): DataFrame with columns 'A', 'B', and 'Year'.     node (str): The target node to analyze. Default is 'I'.          Returns:     dict: A dictionary where keys are years and values are the average degree of the node's neighbors for that year.     """     # Ensure the input is a DataFrame     if not isinstance(df, pd.DataFrame):         raise ValueError("Input must be a pandas DataFrame")          required_columns = ['A', 'B', 'Year']     if not all(col in df.columns for col in required_columns):         raise ValueError(f"DataFrame must contain columns: {required_columns}")          years = df['Year'].unique()     average_degrees = {}          for year in years:         # Filter edges for the current year         yearly_edges = df[df['Year'] == year]                  if yearly_edges.empty:             average_degrees[year] = 0.0             continue                  # Calculate frequency of each node as A or B (this gives their degree for the year)         freq_A = yearly_edges['A'].value_counts()         freq_B = yearly_edges['B'].value_counts()         node_degrees = freq_A.add(freq_B, fill_value=0)  # Sum frequencies from both A and B                  # Find all neighbors of 'I' in this year's edges         i_neighbors = set()         for _, row in yearly_edges.iterrows():             if row['A'] == node:                 i_neighbors.add(row['B'])             elif row['B'] == node:                 i_neighbors.add(row['A'])                  # If there are no neighbors, average degree is 0         if not i_neighbors:             average_degrees[year] = 0.0             continue                  # Calculate the sum of degrees of all neighbors for this year         total_degree = node_degrees.reindex(i_neighbors, fill_value=0).sum()                  # Compute the average degree         avg_degree = total_degree / len(i_neighbors)         average_degrees[year] = avg_degree          return average_degrees  # Example usage: if __name__ == "__main__":     data = {         'A': ['I', 'A', 'B', 'C', 'D', 'E'],         'B': ['A', 'B', 'I', 'I', 'F', 'F'],         'Year': [2020, 2020, 2021, 2021, 2022, 2022]     }          df = pd.DataFrame(data)     result = calculate_average_neighbor_degree(df)     print(result)	toxicology
SELECT DISTINCT T3.bond_type, T2.bond_id FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE SUBSTR(T1.atom_id, 7, 2) + 0 = 45	toxicology
SELECT element FROM atom WHERE atom_id NOT IN (   SELECT atom_id FROM connected    UNION    SELECT atom_id2 FROM connected );	toxicology
SELECT atom_id, atom_id2 FROM connected WHERE bond_id IN (SELECT bond_id FROM bond WHERE molecule_id = 'TR041' AND bond_type = '#');	toxicology
SELECT DISTINCT a1.element AS element1, a2.element AS element2  FROM connected c  INNER JOIN bond b ON c.bond_id = b.bond_id  INNER JOIN atom a1 ON c.atom_id = a1.atom_id  INNER JOIN atom a2 ON c.atom_id2 = a2.atom_id  WHERE b.bond_id = 'TR144_8_19';	toxicology
SELECT m.molecule_id, COUNT(b.bond_id) as double_bonds_count FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '=' AND m.label = '+' GROUP BY m.molecule_id ORDER BY double_bonds_count DESC LIMIT 1;	toxicology
WITH CarcinogenicMolecules AS (     SELECT molecule_id FROM molecule WHERE label = '+' ), ElementsInCarcinogens AS (     SELECT a.element FROM atom a     JOIN CarcinogenicMolecules m ON a.molecule_id = m.molecule_id ) SELECT element, COUNT(*) as count  FROM ElementsInCarcinogens  GROUP BY element  ORDER BY count ASC  LIMIT 1;	toxicology
SELECT DISTINCT T2.atom_id2 AS connected_atom FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 'pb';	toxicology
SELECT a1.element AS Atom1,        a2.element AS Atom2 FROM bond b JOIN connected c ON b.bond_id = c.bond_id LEFT JOIN atom a1 ON c.atom_id = a1.atom_id LEFT JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE b.bond_type = '#';	toxicology
WITH counts AS (   SELECT      MIN(a1.element, a2.element) as elem1,     MAX(a1.element, a2.element) as elem2,     COUNT(*) as cnt   FROM connected c   JOIN atom a1 ON c.atom1 = a1.id   JOIN atom a2 ON c.atom2 = a2.id   GROUP BY MIN(a1.element, a2.element), MAX(a1.element, a2.element) ), max_count AS (   SELECT MAX(cnt) as max_cnt FROM counts ), top_pairs AS (   SELECT elem1, elem2, cnt   FROM counts   WHERE cnt = (SELECT max_cnt FROM max_count) ), total_bonds AS (   SELECT COUNT(*) as total FROM connected )  SELECT    elem1,   elem2,   cnt,   (SUM(cnt) * 1.0 / (SELECT total FROM total_bonds)) * 100 AS percentage FROM top_pairs;	toxicology
SELECT      CAST(         (COUNT(CASE WHEN m.label = '+' THEN b.bond_id END) / COUNT(b.bond_id)) * 100          AS DECIMAL(5,2)     ) FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '-';	toxicology
SELECT COUNT(*) FROM atom WHERE element IN ('c', 'h');	toxicology
SELECT atom_id FROM atom WHERE element = 's';	toxicology
SELECT DISTINCT b.bond_type FROM atom a INNER JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 INNER JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'sn';	toxicology
To determine how many different elements are present in molecules with at least one single bond, we need to:  1. Identify all molecules that have a single bond (bond_type = '-') from the `bond` table. 2. Collect all unique elements (`element`) from these identified molecules using the `atom` table.  **Answer:**  SELECT COUNT(DISTINCT a.element) FROM atom a WHERE a.molecule_id IN (SELECT b.molecule_id FROM bond b WHERE b.bond_type = '-')	toxicology
SELECT COUNT(*)  FROM atom a WHERE a.molecule_id IN (   SELECT b.molecule_id FROM bond b WHERE b.bond_type = '#' ) AND a.molecule_id IN (   SELECT a2.molecule_id FROM atom a2 WHERE a2.element IN ('p', 'br') );	toxicology
SELECT b.bond_id FROM bond b INNER JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.label = '+';	toxicology
SELECT m.molecule_id  FROM molecule m  WHERE m.label = '-'  AND m.molecule_id IN (SELECT b.molecule_id FROM bond b WHERE b.bond_type = '-');	toxicology
SELECT      (COUNT(CASE WHEN a.element = 'cl' THEN 1 END) / COUNT(a.atom_id)) * 100 AS cl_percentage FROM atom a WHERE a.molecule_id IN (     SELECT DISTINCT b.molecule_id FROM bond b WHERE b.bond_type = '-' );	toxicology
SELECT `label` FROM `molecule` WHERE `molecule_id` IN ('TR000', 'TR001', 'TR002');	toxicology
SELECT molecule_id FROM molecule WHERE label = '-';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+' AND molecule_id BETWEEN 'TR000' AND 'TR030';	toxicology
SELECT bond_type FROM bond WHERE molecule_id LIKE 'TR%' AND CAST(substr(molecule_id, 3) AS INT) BETWEEN 0 AND 50;	toxicology
SELECT DISTINCT T1.element AS element1, T2.element AS element2 FROM atom T1 JOIN connected C ON T1.atom_id = C.atom_id JOIN atom T2 ON C.atom_id2 = T2.atom_id WHERE C.bond_id = 'TR001_10_11';	toxicology
SELECT COUNT(DISTINCT c.bond_id) FROM connected c LEFT JOIN atom a1 ON c.atom_id = a1.atom_id LEFT JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE a1.element = 'i' OR a2.element = 'i';	toxicology
SELECT      SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0) AS carcinogenic_count,     SUM(CASE WHEN m.label = '-' THEN 1 ELSE 0) AS non_carcinogenic_count FROM (     SELECT DISTINCT molecule_id      FROM atom      WHERE element = 'ca' ) a JOIN molecule m ON a.molecule_id = m.molecule_id;	toxicology
SELECT c.* FROM connected c JOIN atom a ON c.atom_id = a.atom_id JOIN atom b ON c.atom_id2 = b.atom_id WHERE c.bond_id = 'TR001_1_8' AND (a.element = 'cl' AND b.element = 'c' OR a.element = 'c' AND b.element = 'cl');	toxicology
SELECT m.molecule_id FROM molecule m WHERE m.label = '-' AND EXISTS (   SELECT 1    FROM bond b    WHERE b.molecule_id = m.molecule_id      AND b.bond_type = '#' ) AND EXISTS (   SELECT 1    FROM atom a    WHERE a.molecule_id = m.molecule_id      AND a.element = 'c' ) LIMIT 2;	toxicology
SELECT      (SUM(CASE WHEN A.element = 'cl' THEN 1 ELSE 0 END) / COUNT(A.atom_id)) * 100  FROM      Atom A JOIN      Molecule M ON A.molecule_id = M.molecule_id WHERE      M.label = '+';	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR001';	toxicology
SELECT DISTINCT molecule_id FROM bond WHERE bond_type = ' = '	toxicology
SELECT T1.atom_id, T1.atom_id2  FROM connected AS T1  INNER JOIN bond AS T2  ON T1.bond_id = T2.bond_id  WHERE T2.bond_type = '#';	toxicology
SELECT T1.element FROM atom AS T1 WHERE T1.atom_id IN ( SELECT T2.atom_id FROM connected AS T2 WHERE T2.bond_id = 'TR000_1_2' )	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m INNER JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.label = '-' AND b.bond_type = '-';	toxicology
SELECT T2.label FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_id = 'TR001_10_11' LIMIT 1;	toxicology
SELECT b.bond_id, CASE m.label WHEN '+' THEN 'carcinogenic' ELSE 'non-carcinogenic' END AS carcinogenic FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '#'	toxicology
To solve the problem, we need to count the elements of the 4th atom in each molecule that is labeled as carcinogenic (label '+'). The approach involves joining the `molecule` and `atom` tables, filtering for the required conditions, and then grouping by the element to tally the counts.  **Answer:**  SELECT      a.element,     COUNT(*) AS tally FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      m.label = '+' AND substr(a.atom_id, 7, 1) = '4' GROUP BY      a.element;	toxicology
SELECT      (SUM(CASE WHEN element = 'h' THEN 1 ELSE 0 END) / COUNT(atom_id)) AS hydrogen_ratio,     (SELECT label FROM molecule WHERE molecule_id = 'TR006') AS label FROM atom WHERE molecule_id = 'TR006';	toxicology
SELECT * FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE element = 'ca' AND label = '+';	toxicology
SELECT DISTINCT b.bond_type  FROM bond b  INNER JOIN connected c ON b.bond_id = c.bond_id  INNER JOIN atom a ON c.atom_id = a.atom_id  WHERE a.element = 'c';	toxicology
SELECT element AS Element1 FROM atom WHERE atom_id = 'TR001_10' UNION SELECT element AS Element2 FROM atom WHERE atom_id = 'TR001_11';	toxicology
SELECT      (COUNT(DISTINCT b.molecule_id) / (SELECT COUNT(molecule_id) FROM molecule)) * 100 FROM bond b WHERE b.bond_type = '#';	toxicology
SELECT      (SELECT COUNT(*) FROM bond WHERE molecule_id = 'TR047' AND bond_type = '=') /      (SELECT COUNT(*) FROM bond WHERE molecule_id = 'TR047') * 100;	toxicology
SELECT label FROM molecule WHERE molecule_id = (SELECT molecule_id FROM atom WHERE atom_id = 'TR001_1');	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR151' AND label = '+'	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR151' AND element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca')	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+';	toxicology
SELECT atom_id FROM atom WHERE substr(molecule_id, 3, 3) BETWEEN 10 AND 50 AND element = 'c';	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+');	toxicology
SELECT bond_id FROM bond WHERE bond_type = ' = ' AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+');	toxicology
SELECT COUNT(a.atom_id) FROM atom a INNER JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'h' AND m.label = '+';	toxicology
SELECT b.molecule_id  FROM bond b  WHERE b.bond_id = 'TR000_1_2'  AND (b.bond_id IN (     SELECT c.bond_id      FROM connected c      WHERE c.atom_id = 'TR000_1' OR c.atom_id2 = 'TR000_1' ));	toxicology
SELECT A.atom_id FROM atom A INNER JOIN molecule M ON A.molecule_id = M.molecule_id WHERE A.element = 'c' AND M.label = '-';	toxicology
SELECT      (COUNT(DISTINCT CASE WHEN m.label = '+' AND a.element = 'h' THEN m.molecule_id END) / COUNT(DISTINCT a.molecule_id)) * 100.0 AS percentage FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id;	toxicology
SELECT 1 FROM molecule WHERE molecule_id = 'TR124' AND label = '+';	toxicology
SELECT * FROM atom WHERE molecule_id = 'TR186';	toxicology
SELECT bond_type FROM bond WHERE bond_id = 'TR007_4_19'	toxicology
SELECT a1.element AS element1, a2.element AS element2 FROM connected c INNER JOIN atom a1 ON c.atom_id = a1.atom_id INNER JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE c.bond_id = 'TR001_2_4';	toxicology
SELECT      (SELECT COUNT(*) FROM bond WHERE molecule_id = 'TR006' AND bond_type = ' = ') AS double_bonds,     (SELECT label FROM molecule WHERE molecule_id = 'TR006') AS is_carcinogenic;	toxicology
SELECT DISTINCT m.molecule_id AS name, a.element  FROM molecule m  LEFT JOIN atom a ON m.molecule_id = a.molecule_id  WHERE m.label = '+';	toxicology
SELECT bond.bond_id, connected.atom_id, connected.atom_id2  FROM bond  INNER JOIN connected  ON bond.bond_id = connected.bond_id  WHERE bond.bond_type = '-';	toxicology
SELECT      m.molecule_id,     GROUP_CONCAT(DISTINCT a.element) AS elements FROM atom a JOIN (     SELECT DISTINCT molecule_id FROM bond WHERE bond_type = '#' ) m ON a.molecule_id = m.molecule_id GROUP BY m.molecule_id;	toxicology
SELECT a1.element AS atom1_element, a2.element AS atom2_element  FROM connected c  JOIN atom a1 ON c.atom_id = a1.atom_id  JOIN atom a2 ON c.atom_id2 = a2.atom_id  WHERE c.bond_id = 'TR000_2_3';	toxicology
SELECT COUNT(DISTINCT bond_id)  FROM connected  WHERE atom_id IN (SELECT atom_id FROM atom WHERE element = 'cl')     OR atom_id2 IN (SELECT atom_id FROM atom WHERE element = 'cl');	toxicology
SELECT atom_id FROM atom WHERE molecule_id = 'TR346';	toxicology
SELECT COUNT(*)  FROM molecule  WHERE molecule_id IN (     SELECT DISTINCT molecule_id      FROM bond      WHERE bond_type = '=' )  AND label = '+'	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m LEFT JOIN atom a ON m.molecule_id = a.molecule_id AND a.element = 's' LEFT JOIN bond b ON m.molecule_id = b.molecule_id AND b.bond_type = '=' WHERE a.atom_id IS NULL AND b.bond_id IS NULL;	toxicology
SELECT m.label FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_id = 'TR001_2_4';	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR001';	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '-';	toxicology
SELECT m.molecule_id FROM molecule m WHERE m.molecule_id IN ( SELECT DISTINCT a.molecule_id FROM atom a WHERE a.element = 'cl' ) AND m.label = '+'	toxicology
SELECT DISTINCT m.molecule_id FROM atom a INNER JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c' AND m.label = '-';	toxicology
SELECT      (COUNT(DISTINCT a.molecule_id) / (SELECT COUNT(*) FROM molecule WHERE label = '+')) * 100 AS chloro_percentage FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'Cl' AND m.label = '+';	toxicology
SELECT molecule_id FROM bond WHERE bond_id = 'TR001_1_7';	toxicology
SELECT COUNT(DISTINCT a1.element)  FROM atom a1  JOIN connected c ON a1.atom_id = c.atom_id  WHERE c.bond_id = 'TR001_3_4'  UNION  SELECT COUNT(DISTINCT a2.element)  FROM atom a2  JOIN connected c ON a2.atom_id = c.atom_id2  WHERE c.bond_id = 'TR001_3_4';	toxicology
SELECT b.bond_type  FROM connected c  INNER JOIN bond b ON c.bond_id = b.bond_id  WHERE (c.atom_id = 'TR000_1' AND c.atom_id2 = 'TR000_2')     OR (c.atom_id = 'TR000_2' AND c.atom_id2 = 'TR000_1');	toxicology
SELECT molecule_id FROM atom WHERE atom_id = 'TR000_2' OR atom_id = 'TR000_4';	toxicology
SELECT element FROM atom WHERE atom_id = 'TR000_1'	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR000';	toxicology
SELECT (COUNT(CASE WHEN bond_type = '-' THEN bond_id END) / COUNT(bond_id)) * 100 FROM bond;	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' AND a.element = 'n';	toxicology
SELECT m.molecule_id  FROM molecule m  WHERE EXISTS (     SELECT 1      FROM atom a      WHERE a.molecule_id = m.molecule_id AND a.element = 's' )  AND EXISTS (     SELECT 1      FROM bond b      WHERE b.molecule_id = m.molecule_id AND b.bond_type = '=' );	toxicology
SELECT m.molecule_id FROM molecule m INNER JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '-' GROUP BY m.molecule_id HAVING COUNT(a.atom_id) > 5;	toxicology
SELECT DISTINCT T3.element FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id INNER JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T1.molecule_id = 'TR024' AND T1.bond_type = '='	toxicology
SELECT m.molecule_id FROM molecule m LEFT JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' GROUP BY m.molecule_id ORDER BY COUNT(a.atom_id) DESC LIMIT 1;	toxicology
SELECT      (SUM(IIF(m.label = '+', 1, 0)) / COUNT(*)) * 100 AS percentage FROM molecule m WHERE EXISTS (     SELECT 1     FROM atom a     JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2     JOIN bond b ON c.bond_id = b.bond_id     WHERE a.element = 'h' AND b.bond_type = '#'      AND a.molecule_id = m.molecule_id );	toxicology
SELECT COUNT(molecule_id) FROM molecule WHERE label = '+';	toxicology
SELECT COUNT(DISTINCT b.molecule_id) FROM bond b WHERE b.bond_type = '-' AND b.molecule_id BETWEEN 'TR004' AND 'TR010';	toxicology
SELECT COUNT(atom_id) FROM atom WHERE molecule_id = 'TR008' AND element = 'c';	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '-' AND T1.atom_id = 'TR004_7'	toxicology
SELECT COUNT(DISTINCT b.molecule_id) AS num_molecules_with_oxygen_double_bond FROM bond b JOIN connected c ON b.bond_id = c.bond_id LEFT JOIN atom a1 ON c.atom_id = a1.atom_id LEFT JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE b.bond_type = '=' AND (a1.element = 'O' OR a2.element = 'O');	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.label = '-' AND b.bond_type = '#';	toxicology
SELECT T1.element, T2.bond_type  FROM atom AS T1  LEFT JOIN bond AS T2  ON T1.molecule_id = T2.molecule_id  WHERE T1.molecule_id = 'TR002';	toxicology
SELECT DISTINCT a.atom_id FROM molecule m INNER JOIN atom a ON m.molecule_id = a.molecule_id INNER JOIN connected c ON a.atom_id = c.atom_id INNER JOIN bond b ON c.bond_id = b.bond_id WHERE m.molecule_id = 'TR012'   AND a.element = 'c'   AND b.bond_type = '='	toxicology
SELECT DISTINCT T1.atom_id FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' AND T1.element = 'o'	toxicology
SELECT * FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT * FROM cards WHERE borderColor IS NULL AND (cardKingdomFoilId IS NULL OR cardKingdomId IS NULL);	card_games
SELECT name, MAX(faceConvertedManaCost) AS max_face_converted_mana  FROM cards  GROUP BY name;	card_games
SELECT name  FROM cards  WHERE frameVersion = '2015' AND edhrecRank < 100;	card_games
SELECT c.name  FROM cards c  INNER JOIN legalities l  ON c.uuid = l.uuid  WHERE c.rarity = 'mythic' AND l.format = 'gladiator' AND l.status = 'Banned';	card_games
SELECT DISTINCT c.name, c.uuid, l.status AS vintage_legality FROM cards c INNER JOIN legalities l ON c.uuid = l.uuid WHERE c.type = 'Artifact' AND c.side IS NULL AND l.format = 'vintage' AND l.status = 'Legal';	card_games
SELECT DISTINCT c.id, c.artist FROM cards c INNER JOIN legalities l ON c.uuid = l.uuid WHERE c.power IN ('*', NULL) AND l.format = 'commander' AND l.status = 'Legal';	card_games
SELECT c.id FROM cards c WHERE LOWER(c.artist) = 'stephen daniel' AND c.hasContentWarning = 1 AND EXISTS (SELECT 1 FROM rulings r WHERE r.uuid = c.uuid);	card_games
SELECT text FROM rulings INNER JOIN cards ON rulings.uuid = cards.uuid WHERE cards.name = 'Sublime Epiphany' AND cards.number = '74s';	card_games
SELECT c.name, c.artist, c.isPromo FROM cards c JOIN (     SELECT uuid, COUNT(*) as ruling_count     FROM rulings     GROUP BY uuid ) r ON c.uuid = r.uuid ORDER BY r.ruling_count DESC LIMIT 1;	card_games
SELECT fd.language FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE LOWER(c.name) = 'annul' AND c.number = '29';	card_games
SELECT c.name FROM cards c INNER JOIN foreign_data f ON c.uuid = f.uuid WHERE f.language = 'Japanese';	card_games
SELECT (COUNT(CASE WHEN language = 'Chinese Simplified' THEN id ELSE NULL END) / COUNT(id)) * 100 FROM set_translations;	card_games
SELECT s.totalSetSize, st.translation  FROM sets s INNER JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian';	card_games
SELECT COUNT(DISTINCT type)  FROM cards  WHERE artist = 'Aaron Boyd';	card_games
To find the keyword for the card 'Angel of Mercy', we'll look in the `cards` table where the `name` is 'Angel of Mercy'.  **Answer:**  SELECT keywords FROM cards WHERE name = 'Angel of Mercy' LIMIT 1	card_games
SELECT COUNT(*) FROM cards WHERE power = '*';	card_games
To find the promotion type for the card named 'Duress', we need to query the `promoTypes` field in the `cards` table.  **Answer:** SELECT promoTypes FROM cards WHERE name = 'Duress';	card_games
SELECT borderColor FROM cards WHERE name = 'Ancestor''s Chosen';	card_games
SELECT originalType FROM cards WHERE name = 'Ancestor''s Chosen';	card_games
SELECT T.language FROM cards C JOIN sets S ON C.setCode = S.code JOIN set_translations T ON S.code = T.setCode WHERE C.name = 'Angel of Mercy';	card_games
SELECT COUNT(c.uuid)  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE l.status = 'restricted' AND c.isTextless = 0;	card_games
SELECT r.text  FROM rulings r  INNER JOIN cards c  ON r.uuid = c.uuid  WHERE c.name = 'Condemn';	card_games
SELECT COUNT(*)  FROM cards  INNER JOIN legalities  ON cards.uuid = legalities.uuid  WHERE legalities.status = 'restricted' AND cards.isStarter = 1;	card_games
SELECT l.status  FROM cards c  INNER JOIN legalities l ON c.uuid = l.uuid  WHERE c.name = 'Cloudchaser Eagle';	card_games
SELECT type FROM cards WHERE name = 'Benalish Knight';	card_games
SELECT l.format, l.status  FROM cards c  INNER JOIN legalities l  ON c.uuid = l.uuid  WHERE c.name = 'Benalish Knight';	card_games
SELECT DISTINCT c.artist  FROM cards c  INNER JOIN foreign_data f  ON c.uuid = f.uuid  WHERE f.language = 'Phyrexian';	card_games
SELECT      (COUNT(CASE WHEN borderColor = 'borderless' THEN id END) / COUNT(id)) * 100 AS borderless_percentage FROM cards;	card_games
SELECT COUNT(DISTINCT c.uuid)  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE fd.language = 'German' AND c.isReprint = 1;	card_games
SELECT COUNT(DISTINCT c.uuid) FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.borderColor = 'borderless' AND fd.language = 'Russian';	card_games
SELECT      (COUNT(fd.uuid) / COUNT(c.uuid)) * 100 AS french_percentage FROM      cards c LEFT JOIN      foreign_data fd ON c.uuid = fd.uuid AND fd.language = 'French' WHERE      c.isStorySpotlight = 1;	card_games
SELECT COUNT(*) FROM cards WHERE toughness = '99';	card_games
SELECT name FROM cards WHERE artist = 'Aaron Boyd';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND availability = 'mtgo';	card_games
SELECT id FROM cards WHERE convertedManaCost = 0;	card_games
To find the distinct card layouts of all cards that have the 'flying' keyword, you can use the following SQL query:  SELECT DISTINCT layout FROM cards WHERE keywords LIKE '%flying%'	card_games
SELECT COUNT(*) FROM cards WHERE originalType = 'Summon - Angel' AND subtypes != 'Angel';	card_games
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT id FROM cards WHERE duelDeck = 'a';	card_games
To list the EDHREC rank for cards with a frame version of 2015, you can use the following SQL query:  SELECT edhrecRank FROM cards WHERE frameVersion = '2015';	card_games
SELECT DISTINCT artist  FROM cards  WHERE setCode IN (     SELECT setCode      FROM set_translations      WHERE language = 'Chinese Simplified' );	card_games
SELECT c.*  FROM cards c INNER JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.availability = 'paper' AND fd.language = 'Japanese';	card_games
SELECT COUNT(DISTINCT c.uuid)  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE l.status = 'Banned' AND c.borderColor = 'white';	card_games
SELECT l.uuid, f.language FROM legalities l INNER JOIN foreign_data f ON l.uuid = f.uuid WHERE l.format = 'legacy';	card_games
SELECT r.text  FROM rulings r  INNER JOIN cards c ON r.uuid = c.uuid  WHERE c.name = 'Beacon of Immortality';	card_games
SELECT COUNT(DISTINCT c.uuid) AS future_frame_legal_cards_count  FROM cards c  INNER JOIN legalities l ON c.uuid = l.uuid  WHERE c.frameVersion = 'future' AND l.status = 'legal';	card_games
SELECT name, colors FROM cards WHERE setCode = 'OGW';	card_games
SELECT c.name, st.language  FROM cards c JOIN sets s ON c.setCode = s.code LEFT JOIN set_translations st ON s.code = st.setCode WHERE c.setCode = '10E' AND c.convertedManaCost = 5;	card_games
SELECT c.name, r.date  FROM cards c  INNER JOIN rulings r  ON c.uuid = r.uuid  WHERE c.originalType = 'Creature - Elf';	card_games
SELECT c.colors, s.code AS format FROM cards c INNER JOIN sets s ON c.setCode = s.code WHERE c.id BETWEEN 1 AND 20;	card_games
SELECT c.name, c.type, c.text, c.code FROM cards c WHERE c.type = 'analysis'   AND c.code LIKE 'ONE%'   AND EXISTS (     SELECT 1     FROM foreign_data fd     WHERE fd.uuid = c.uuid   );	card_games
SELECT c.name FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.rarity = 'uncommon' GROUP BY c.name ORDER BY MIN(r.date) ASC LIMIT 3;	card_games
SELECT COUNT(*)  FROM cards  WHERE artist = 'John Avon' AND (cardKingdomId IS NULL OR cardKingdomFoilId IS NULL);	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'UDON' AND availability = 'mtgo' AND hand = -1;	card_games
SELECT COUNT(*) FROM cards WHERE frameVersion = '1993' AND availability = 'paper' AND hasContentWarning = 1;	card_games
SELECT manaCost FROM cards WHERE layout = 'normal' AND frameVersion = 2003 AND borderColor = 'black' AND availability = 'mtgo,paper';	card_games
SELECT SUM(convertedManaCost) AS total_mana_cost FROM cards WHERE artist = 'Rob Alexander';	card_games
SELECT subtypes, supertypes FROM cards WHERE availability = 'arena';	card_games
SELECT setCode FROM set_translations WHERE language = 'Spanish';	card_games
SELECT CAST(COUNT(CASE WHEN isOnlineOnly = 1 THEN id END) AS REAL) / COUNT(id) * 100 FROM cards WHERE frameEffects = 'legendary'	card_games
SELECT (COUNT(CASE WHEN isStorySpotlight = 1 AND isTextless = 0 THEN id END) / COUNT(id)) * 100 AS percentage FROM cards WHERE isStorySpotlight = 1;	card_games
SELECT      c.name,     (SELECT COUNT(DISTINCT fd.uuid) FROM foreign_data fd WHERE fd.language = 'Spanish') / (SELECT COUNT(uuid) FROM cards) * 100 AS spanish_percentage FROM      cards c JOIN      foreign_data fd ON c.uuid = fd.uuid WHERE      fd.language = 'Spanish' GROUP BY      c.name;	card_games
SELECT DISTINCT language FROM set_translations WHERE setCode = (SELECT code FROM sets WHERE baseSetSize = 309);	card_games
SELECT COUNT(DISTINCT st.setCode) FROM set_translations st INNER JOIN sets s ON st.setCode = s.code WHERE st.language = 'Portuguese (Brasil)' AND s.block = 'Commander';	card_games
SELECT c.id FROM cards c INNER JOIN legalities l ON c.uuid = l.uuid WHERE c.type = 'Creature' AND l.status = 'Legal';	card_games
SELECT subtypes, supertypes FROM cards WHERE subtypes IS NOT NULL AND supertypes IS NOT NULL;	card_games
SELECT COUNT(*)  FROM cards  WHERE (power IS NULL OR power = '*') AND LOWER(text) LIKE '%triggered ability%';	card_games
SELECT COUNT(DISTINCT c.uuid) FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN rulings r ON c.uuid = r.uuid WHERE l.format = 'premodern'   AND l.status = 'Legal'   AND r.text LIKE '%This is a triggered mana ability.%'   AND c.side IS NULL;	card_games
SELECT c.id  FROM cards c INNER JOIN legalities l ON c.uuid = l.uuid WHERE c.artist = 'Erica Yang'    AND l.format = 'pauper'   AND l.status = 'Legal'   AND c.availability = 'paper';	card_games
SELECT artist FROM cards WHERE text = 'Das perfekte Gegenmittel zu einer dichten Formation';	card_games
SELECT fd.translation  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE c.type = 'Creature' AND c.layout = 'normal' AND c.borderColor = 'black' AND c.artist = 'Matthew D. Wilson' AND fd.language = 'French';	card_games
SELECT COUNT(DISTINCT c.uuid)  FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.rarity = 'rare' AND r.date = '2007-02-01';	card_games
SELECT st.language  FROM sets s  INNER JOIN set_translations st ON s.code = st.setCode  WHERE s.block = 'Ravnica' AND s.baseSetSize = 180;	card_games
SELECT      (COUNT(CASE WHEN c.hasContentWarning = 0 THEN l.id END) / COUNT(l.id)) * 100 AS percentage FROM      legalities l INNER JOIN      cards c ON l.uuid = c.uuid WHERE      l.format = 'commander' AND l.status = 'Legal';	card_games
SELECT    (COUNT(CASE WHEN fd.language = 'French' AND (c.power IS NULL OR c.power = '*') THEN c.uuid END) / COUNT(CASE WHEN c.power IS NULL OR c.power = '*' THEN c.uuid END)) * 100 AS percentage_french_without_power FROM cards c LEFT JOIN foreign_data fd ON c.uuid = fd.uuid;	card_games
SELECT      (COUNT(CASE WHEN s.type = 'expansion' THEN st.id END) / COUNT(st.id)) * 100 AS percentage_expansion FROM      set_translations st JOIN      sets s ON st.setCode = s.code WHERE      st.language = 'Japanese';	card_games
SELECT availability FROM cards WHERE artist = 'Daren Bader';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'borderless' AND edhrecRank > 12000 AND colors IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1;	card_games
SELECT name FROM cards WHERE promoTypes = 'arenaleague' AND (power IS NULL OR power = '*') ORDER BY name LIMIT 3;	card_games
SELECT language FROM foreign_data WHERE multiverseid = 149934;	card_games
SELECT id, cardKingdomId, cardKingdomFoilId FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL ORDER BY cardKingdomFoilId ASC LIMIT 3;	card_games
SELECT CAST(COUNT(CASE WHEN layout = 'normal' THEN uuid ELSE NULL END) AS FLOAT) / COUNT(uuid) * 100 FROM cards WHERE isTextless = 1	card_games
SELECT number FROM cards WHERE side IS NULL AND subtypes LIKE '%Angel%' AND subtypes LIKE '%Wizard%';	card_games
SELECT name FROM sets WHERE mtgoCode IS NULL OR mtgoCode = '' ORDER BY name ASC LIMIT 3	card_games
SELECT st.language  FROM sets s INNER JOIN set_translations st ON s.code = st.setCode WHERE s.mcmName = 'Archenemy' AND s.code = 'ARC';	card_games
SELECT s.name, st.language, st.translation  FROM sets s  INNER JOIN set_translations st  ON s.code = st.setCode  WHERE s.id = 5;	card_games
SELECT st.language, s.type  FROM sets s  INNER JOIN set_translations st  ON s.code = st.setCode  WHERE s.id = 206;	card_games
SELECT s.id, st.translation  FROM sets s  INNER JOIN set_translations st  ON s.code = st.setCode  WHERE s.block = 'Shadowmoor' AND st.language = 'Italian' ORDER BY st.translation  LIMIT 2;	card_games
SELECT s.id  FROM sets s  INNER JOIN set_translations st ON s.code = st.setCode  WHERE s.isForeignOnly = 1 AND s.isFoilOnly = 1 AND st.language = 'Japanese';	card_games
SELECT s.name, st.translation, s.baseSetSize FROM sets s INNER JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Russian' ORDER BY s.baseSetSize DESC LIMIT 1;	card_games
SELECT      (COUNT(CASE WHEN isOnlineOnly = 1 THEN id ELSE NULL END) * 1.0) / COUNT(*) AS proportion FROM cards WHERE language = 'Chinese Simplified';	card_games
SELECT COUNT(DISTINCT st.setcode) FROM set_translations st INNER JOIN sets s ON st.setcode = s.code WHERE st.language = 'Japanese'   AND (s.mtgoCode IS NULL OR s.mtgoCode = '');	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'black'; SELECT id FROM cards WHERE borderColor = 'black';	card_games
SELECT id FROM cards WHERE frameEffects = 'extendedart';	card_games
SELECT * FROM cards WHERE borderColor = 'black' AND isFullArt = 1;	card_games
SELECT st.language FROM set_translations st INNER JOIN sets s ON st.setCode = s.code WHERE s.id = 174;	card_games
SELECT name FROM sets WHERE code = 'ALL';	card_games
SELECT f.language  FROM cards c  JOIN foreign_data f ON c.uuid = f.uuid  WHERE c.name = 'A Pedra Fellwar';	card_games
SELECT code FROM sets WHERE releaseDate = '2007-07-13';	card_games
SELECT baseSetSize, code FROM sets WHERE block = 'Masques' OR block = 'Mirage';	card_games
SELECT code FROM sets WHERE type = 'expansion'	card_games
SELECT      name AS foreign_name,     type FROM      cards WHERE      watermark = 'Boros';	card_games
SELECT fd.language, fd.flavorText, c.type  FROM cards c  INNER JOIN foreign_data fd  ON c.uuid = fd.uuid  WHERE c.watermark = 'colorpie';	card_games
SELECT      (COUNT(CASE WHEN c.convertedManaCost = 10 THEN 1 ELSE NULL END) / COUNT(*)) * 100 AS PercentageOfCMC10 FROM      cards c INNER JOIN      sets s ON c.setCode = s.code WHERE      s.name = 'Abyssal Horror';	card_games
SELECT code FROM sets WHERE type = 'expansion';	card_games
SELECT T2.name, T1.type  FROM cards AS T1 INNER JOIN foreign_data AS T2  ON T1.uuid = T2.uuid WHERE T1.watermark = 'abzan';	card_games
SELECT fd.language, c.type  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE c.watermark = 'Azorius';	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE availability LIKE '%paper%' AND hand = '3';	card_games
SELECT name FROM cards WHERE isTextless = 0;	card_games
SELECT manaCost FROM cards WHERE name = 'Ancestor`s Chosen';	card_games
SELECT COUNT(*) FROM cards  WHERE borderColor = 'white' AND (power = '*' OR power IS NULL);	card_games
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL;	card_games
SELECT subtypes, supertypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer';	card_games
SELECT purchaseUrls FROM cards WHERE promoTypes = 'bundle'	card_games
SELECT COUNT(DISTINCT artist)  FROM cards  WHERE border = 'Black' AND availability LIKE '%arena%' AND availability LIKE '%mtgo%';	card_games
SELECT name, convertedManaCost  FROM cards  WHERE name = 'Serra Angel' OR name = 'Shrine Keeper';	card_games
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer';	card_games
SELECT name  FROM cards  WHERE frameVersion = '2003'  ORDER BY convertedManaCost DESC  LIMIT 3;	card_games
SELECT st.translation  FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE c.name = 'Ancestor''s Chosen' AND st.language = 'Italian';	card_games
SELECT COUNT(*)  FROM set_translations  WHERE setCode = (SELECT setCode FROM cards WHERE name = 'Angel of Mercy');	card_games
SELECT name  FROM cards  WHERE setCcode = '10E';	card_games
SELECT fd.* FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.name = 'Ancestor''s Chosen' AND fd.language = 'Korean';	card_games
SELECT COUNT(*)  FROM cards  WHERE artist = 'Adam Rex' AND setCode = '10E';	card_games
SELECT s.baseSetSize  FROM sets s  INNER JOIN set_translations st  ON s.code = st.setCode  WHERE st.translation = 'Hauptset Zehnte Edition';	card_games
SELECT st.translation  FROM sets s INNER JOIN set_translations st ON s.code = st.setCode WHERE s.name = 'Eighth Edition' AND st.language = 'Chinese Simplified';	card_games
SELECT c.name, s.mtgoCode  FROM cards c  INNER JOIN sets s ON c.setCode = s.code  WHERE c.name = 'Angel of Mercy' AND s.mtgoCode IS NOT NULL;	card_games
SELECT s.releaseDate  FROM cards c  INNER JOIN sets s  ON c.setCode = s.code  WHERE c.name = 'Ancestor''s Chosen';	card_games
SELECT s.type  FROM sets s  INNER JOIN set_translations st  ON s.code = st.setCode  WHERE st.translation = 'Hauptset Zehnte Edition';	card_games
SELECT COUNT(DISTINCT s.code)  FROM sets s  JOIN set_translations st ON s.code = st.setcode  WHERE s.block = 'Ice Age' AND st.language = 'Italian' AND st.translation IS NOT NULL;	card_games
SELECT s.isForeignOnly  FROM cards c  JOIN sets s ON c.setCode = s.code  WHERE c.name = 'Adarkar Valkyrie';	card_games
SELECT COUNT(*) FROM set_translations st INNER JOIN sets s ON st.setCode = s.code WHERE st.language = 'Italian' AND s.baseSetSize < 100;	card_games
SELECT COUNT(*)  FROM cards  WHERE set_name = 'Coldsnap' AND border_color = 'black';	card_games
SELECT c.* FROM cards c JOIN sets s ON c.set_id = s.id WHERE s.name = 'Coldsnap' ORDER BY c.convertedManaCost DESC LIMIT 1;	card_games
SELECT DISTINCT c.artist FROM cards c JOIN sets s ON c.PrintedSetCode = s.code WHERE s.name = 'Coldsnap';	card_games
SELECT c.* FROM cards c INNER JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap' AND c.number = 4;	card_games
SELECT COUNT(*) FROM cards WHERE (power IS NULL OR power = '*') AND convertedManaCost > 5 AND name = 'Coldsnap'	card_games
SELECT      fd.flavorText AS italian_flavor_text FROM      cards c LEFT JOIN      foreign_data fd ON c.uuid = fd.uuid AND fd.language = 'Italian' WHERE      c.name = 'Ancestor''s Chosen';	card_games
SELECT language FROM foreign_data  WHERE uuid = (SELECT uuid FROM cards WHERE name = 'Ancestor''s Chosen')  AND flavorText IS NOT NULL;	card_games
SELECT fd.text AS german_type FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE c.name = 'Ancestor''s Chosen' AND fd.language = 'German';	card_games
SELECT r.* FROM cards c JOIN sets s ON c.setCode = s.code JOIN rulings r ON c.uuid = r.uuid WHERE s.name = 'Coldsnap';	card_games
SELECT c.name AS "Card Name", fd.translation AS "Italian Name" FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid AND fd.language = 'Italian' WHERE c.setCode = (SELECT code FROM sets WHERE name = 'Coldsnap') AND c.convertedManaCost = (     SELECT MAX(c2.convertedManaCost)     FROM cards c2     WHERE c2.setCode = (SELECT code FROM sets WHERE name = 'Coldsnap') );	card_games
SELECT r.date  FROM rulings r  INNER JOIN cards c  ON r.uuid = c.uuid  WHERE c.name = 'Reminisce';	card_games
SELECT      (COUNT(CASE WHEN c.convertedManaCost = 7 THEN 1 ELSE NULL END) / COUNT(c.id)) * 100 AS percentage FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap';	card_games
SELECT      CAST(         SUM(CASE              WHEN name = 'Coldsnap' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL THEN 1              ELSE 0          END) /          SUM(CASE WHEN name = 'Coldsnap' THEN 1 ELSE 0 END) * 100      ) AS PERCENTAGE FROM cards;	card_games
SELECT code FROM sets WHERE releaseDate = '2017-07-14';	card_games
SELECT keyruneCode FROM sets WHERE code = 'PKHC';	card_games
SELECT mcmId FROM sets WHERE code = 'SS2';	card_games
SELECT mcmName FROM sets WHERE releaseDate = '2017-06-09';	card_games
SELECT type FROM sets WHERE name = 'From the Vault: Lore';	card_games
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized';	card_games
SELECT c.name, r.text, c.hasContentWarning  FROM cards c INNER JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Jim Pavelec'	card_games
SELECT s.releaseDate FROM sets s INNER JOIN cards c ON s.code = c.setCode WHERE c.name = 'Evacuation'	card_games
SELECT s.baseSetSize  FROM sets s  INNER JOIN set_translations st  ON s.code = st.setCode  WHERE st.translation = 'Rinascita di Alara' AND st.language = 'Italian';	card_games
SELECT s.type  FROM sets s  INNER JOIN set_translations st ON s.code = st.setCode  WHERE st.translation = 'Huitième édition';	card_games
SELECT st.name AS french_set_name FROM foreign_data fd JOIN cards c ON fd.card_uuid = c.uuid JOIN set_translations st ON c.setcode = st.setCode AND st.language = 'French' WHERE fd.translation = 'Tendo Ice Bridge' AND fd.language = 'French';	card_games
SELECT COUNT(*) FROM set_translations WHERE setCode = (SELECT code FROM sets WHERE name = 'Tenth Edition');	card_games
SELECT st.translation  FROM set_translations st WHERE st.setCode = (SELECT c.setCode FROM cards c WHERE c.name = 'Fellwar Stone') AND st.language = 'Japanese';	card_games
SELECT c.name, c.convertedManaCost  FROM cards c INNER JOIN sets s ON c.setCode = s.code  WHERE s.name = 'Journey into Nyx Hero''s Path' ORDER BY c.convertedManaCost DESC  LIMIT 1;	card_games
SELECT s.releaseDate  FROM sets s  INNER JOIN set_translations st  ON s.code = st.setCode  WHERE st.translation = 'Ola de frío';	card_games
SELECT s.type  FROM sets s JOIN cards c ON s.id = c.set_id WHERE c.name = 'Samite Pilgrim';	card_games
SELECT COUNT(c.id) FROM sets s JOIN cards c ON s.code = c.setCode WHERE s.name = 'World Championship Decks 2004' AND c.convertedManaCost = 3;	card_games
SELECT st.translation FROM sets s INNER JOIN set_translations st ON s.code = st.setcode WHERE s.name = 'Mirrodin' AND st.language = 'Chinese Simplified';	card_games
SELECT      (COUNT(CASE WHEN s.isNonFoilOnly = 1 THEN 1 ELSE NULL END) / COUNT(s.code)) * 100 AS japanese_non_foil_percentage FROM sets s WHERE EXISTS (     SELECT 1 FROM set_translations st WHERE st.setCode = s.code AND st.language = 'Japanese' );	card_games
SELECT      (SUM(s.isOnlineOnly) * 100.0) / COUNT(s.setCode) FROM      sets s WHERE      s.code IN (         SELECT DISTINCT st.setCode         FROM set_translations st         WHERE st.language = 'Portuguese (Brazil)'     );	card_games
SELECT DISTINCT availability FROM cards WHERE artist = 'Aleksi Briclot' AND isTextless = 1;	card_games
SELECT id FROM sets WHERE baseSetSize = (SELECT MAX(baseSetSize) FROM sets)	card_games
SELECT artist  FROM cards  WHERE side IS NULL AND cmc = (     SELECT MAX(cmc)      FROM cards      WHERE side IS NULL );	card_games
SELECT frameEffects, COUNT(*) as count FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL GROUP BY frameEffects ORDER BY count DESC LIMIT 1;	card_games
SELECT COUNT(*) FROM cards  WHERE power IS NULL OR power = '*'  AND hasFoil = 0 AND duelDeck = 'a';	card_games
SELECT id FROM sets WHERE type = 'commander' ORDER BY totalSetSize DESC LIMIT 1;	card_games
SELECT c.name, c.convertedManaCost  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE l.format = 'duel'  ORDER BY c.convertedManaCost DESC  LIMIT 10;	card_games
SELECT      c.originalReleaseDate,     GROUP_CONCAT(l.format) AS legal_formats FROM      cards c JOIN      legalities l ON c.uuid = l.uuid WHERE      c.rarity = 'mythic'      AND l.status = 'Legal'     AND c.originalReleaseDate = (SELECT MIN(originalReleaseDate) FROM cards WHERE rarity = 'mythic') GROUP BY      c.name, c.uuid, c.originalReleaseDate;	card_games
SELECT COUNT(*) FROM cards INNER JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.artist = 'Volkan Baǵa' AND foreign_data.language = 'French';	card_games
SELECT COUNT(*)  FROM cards c WHERE c.name = 'Abundance'   AND c.type LIKE '%Enchantment%'   AND c.rarity = 'rare'   AND (SELECT COUNT(*) FROM legalities l WHERE l.uuid = c.uuid AND l.status != 'Legal') = 0;	card_games
SELECT l.format, c.name AS card_name FROM legalities l JOIN cards c ON l.uuid = c.uuid WHERE l.status = 'Banned' AND l.format IN (   SELECT format   FROM (     SELECT l.format, COUNT(*) as cnt     FROM legalities l     WHERE l.status = 'Banned'     GROUP BY l.format   ) sub_banned   WHERE cnt = (SELECT MAX(cnt) FROM (     SELECT l.format, COUNT(*) as cnt     FROM legalities l     WHERE l.status = 'Banned'     GROUP BY l.format   ) max_sub) );	card_games
SELECT st.translation  FROM sets s  INNER JOIN set_translations st ON s.code = st.setcode  WHERE s.name = 'Battlebond';	card_games
WITH ranked_artists AS (   SELECT artist,          COUNT(*) as cnt,          RANK() OVER (ORDER BY COUNT(*) ASC) as rank_cnt   FROM cards   GROUP BY artist ) SELECT ra.artist, l.format FROM ranked_artists ra JOIN cards c ON ra.artist = c.artist JOIN legalities l ON c.uuid = l.uuid WHERE ra.rank_cnt = 1;	card_games
SELECT l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.frameVersion = '1997' AND c.artist = 'D. Alexander Gregory' AND l.format = 'legacy' AND c.hasContentWarning = 1	card_games
SELECT DISTINCT c.name, l.format  FROM cards c  INNER JOIN legalities l ON c.uuid = l.uuid  WHERE c.edhrecRank = 1 AND l.status = 'Banned';	card_games
WITH filtered_sets AS (     SELECT code, releaseDate      FROM sets      WHERE releaseDate BETWEEN '2012-01-01' AND '2015-12-31' ), set_count_per_year AS (     SELECT          EXTRACT(YEAR FROM releaseDate) AS year,         COUNT(DISTINCT code) AS count     FROM filtered_sets     GROUP BY EXTRACT(YEAR FROM releaseDate) ), common_language AS (     SELECT          language,         COUNT(*) as count     FROM set_translations     WHERE setCode IN (SELECT code FROM filtered_sets)     GROUP BY language ) SELECT      (AVG(count) OVER ()) AS average_annual_sets,     (SELECT language FROM common_language ORDER BY count DESC LIMIT 1) AS common_language;	card_games
SELECT artist FROM cards WHERE borderColor = 'black' AND availability = 'arena';	card_games
SELECT uuid FROM legalities WHERE format = 'oldschool' AND status IN ('banned', 'restricted');	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability = 'paper';	card_games
SELECT r.date, r.text  FROM rulings r  JOIN cards c ON r.uuid = c.uuid  WHERE c.artist = 'Kev Walker'  ORDER BY r.date DESC;	card_games
SELECT c.name, l.isCommanderLegal FROM cards c JOIN sets s ON c.setCode = s.code AND s.name = 'Hour of Devastation' JOIN legalities l ON c.uuid = l.uuid;	card_games
SELECT s.name  FROM sets s WHERE s.code IN (SELECT st1.setCode FROM set_translations st1 WHERE st1.language = 'Korean') AND s.code NOT IN (SELECT st2.setCode FROM set_translations st2 WHERE st2.language LIKE '%Japanese%');	card_games
SELECT c.frameVersion, l.status  FROM cards c  INNER JOIN legalities l  ON c.uuid = l.uuid  WHERE c.artist = 'Allen Williams' AND l.status = 'Banned';	card_games
SELECT Reputation AS HarlanReputation FROM users WHERE DisplayName = 'Harlan' UNION ALL SELECT Reputation AS JarrodDixonReputation FROM users WHERE DisplayName = 'Jarrod Dixon';	codebase_community
SELECT DisplayName FROM users WHERE CreationDate IS NOT NULL AND YEAR(CreationDate) = 2011;	codebase_community
SELECT COUNT(Id) FROM users WHERE LastAccessDate > '2014-09-01';	codebase_community
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1;	codebase_community
SELECT COUNT(Id) FROM users WHERE UpVotes > 100 AND DownVotes > 1;	codebase_community
SELECT COUNT(*) FROM users WHERE Views > 10 AND CAST(strftime('%Y', CreationDate) AS INT) > 2013	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie');	codebase_community
SELECT p.Title  FROM Posts p INNER JOIN Users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT u.DisplayName  FROM posts p  INNER JOIN users u ON p.OwnerUserId = u.Id  WHERE p.Title = 'Eliciting priors from experts';	codebase_community
SELECT p.Title  FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'csgillespie' ORDER BY p.ViewCount DESC LIMIT 1;	codebase_community
SELECT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts);	codebase_community
SELECT SUM(p.CommentCount) AS TotalComments FROM posts p WHERE p.OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie');	codebase_community
SELECT MAX(AnswerCount) AS MaxAnswers FROM posts WHERE OwnerDisplayName = 'csgillespie';	codebase_community
SELECT u.DisplayName  FROM posts p  INNER JOIN users u ON p.LastEditorUserId = u.Id  WHERE p.Title = 'Examples for teaching: Correlation does not mean causation';	codebase_community
SELECT COUNT(*) AS RootPostCount FROM posts INNER JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'csgillespie' AND posts.ParentId IS NULL;	codebase_community
SELECT OwnerDisplayName FROM posts WHERE ClosedDate IS NOT NULL	codebase_community
SELECT COUNT(p.Id) FROM posts p INNER JOIN users u ON p.OwnerUserId = u.Id WHERE u.Age > 65 AND p.Score >= 20;	codebase_community
SELECT u.Location FROM posts p INNER JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Eliciting priors from experts'	codebase_community
SELECT p.Body FROM tags t INNER JOIN posts p ON t.ExcerptPostId = p.Id WHERE t.TagName = 'bayesian';	codebase_community
SELECT p.Body  FROM tags t  JOIN posts p ON t.ExcerptPostId = p.Id  WHERE t.Count = (SELECT MAX(Count) FROM tags)  LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM badges  INNER JOIN users ON badges.UserId = users.Id  WHERE users.DisplayName = 'csgillespie';	codebase_community
SELECT b.Name  FROM users u  INNER JOIN badges b ON u.Id = b.UserId  WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT COUNT(*)  FROM badges  INNER JOIN users ON badges.UserId = users.Id  WHERE users.DisplayName = 'csgillespie' AND YEAR(badges.Date) = 2011;	codebase_community
SELECT u.DisplayName FROM (   SELECT UserId, COUNT(Id) AS BadgeCount   FROM badges   GROUP BY UserId ) b JOIN users u ON b.UserId = u.Id WHERE b.BadgeCount = (SELECT MAX(BadgeCount) FROM (SELECT UserId, COUNT(Id) AS BadgeCount FROM badges GROUP BY UserId) AS sub);	codebase_community
SELECT AVG(Score) AS average_score FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie');	codebase_community
SELECT      SUM(COALESCE(bc.cnt, 0)) / COUNT(u.Id) AS average_badges FROM users u LEFT JOIN (     SELECT UserId, COUNT(Id) as cnt     FROM badges     GROUP BY UserId ) bc ON u.Id = bc.UserId WHERE u.Views > 200;	codebase_community
SELECT      (COUNT(CASE WHEN u.Age > 65 THEN p.Id END) / COUNT(p.Id)) * 100 AS percentage_elder_owned FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      p.Score > 5;	codebase_community
SELECT COUNT(Id) FROM votes WHERE UserId = 58 AND CreationDate = '2010-07-19';	codebase_community
SELECT CreationDate FROM votes GROUP BY CreationDate ORDER BY COUNT(Id) DESC LIMIT 1;	codebase_community
SELECT COUNT(Id) FROM badges WHERE Name = 'Revival';	codebase_community
SELECT Title FROM Posts WHERE Id = (SELECT PostId FROM Comments WHERE Score = (SELECT MAX(Score) FROM Comments));	codebase_community
SELECT COUNT(*) FROM comments WHERE PostId = (SELECT Id FROM posts WHERE ViewCount = 1910);	codebase_community
SELECT FavoriteCount  FROM posts  WHERE Id = (     SELECT PostId      FROM comments      WHERE UserId = 3025 AND CreationDate = '2014/04/23 20:29:39.0' );	codebase_community
SELECT c.Text FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.ParentId = 107829 AND p.CommentCount = '1';	codebase_community
SELECT c.*, p.ClosedDate  FROM comments c  INNER JOIN posts p ON c.PostId = p.Id  WHERE UserId = 23853 AND CreationDate = '2013-07-12 09:08:18.0';	codebase_community
SELECT u.Reputation FROM users u INNER JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Id = '65041'	codebase_community
SELECT COUNT(p.Id)  FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Tiago Pasqualini';	codebase_community
SELECT u.DisplayName  FROM votes v  INNER JOIN users u ON v.UserId = u.Id  WHERE v.Id = '6347';	codebase_community
SELECT COUNT(v.Id)  FROM votes v INNER JOIN posts p ON v.PostId = p.Id WHERE p.Title LIKE '%data visualization%';	codebase_community
SELECT b.Name  FROM badges b  INNER JOIN users u  ON b.UserId = u.Id  WHERE u.DisplayName = 'DatEpicCoderGuyWhoPrograms';	codebase_community
SELECT      (SELECT COUNT(Id) FROM posts WHERE OwnerUserId = 24) /      (SELECT COUNT(Id) FROM votes WHERE UserId = 24) AS PostToVoteRatio;	codebase_community
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer';	codebase_community
SELECT Text FROM comments WHERE Score = 17;	codebase_community
SELECT DisplayName FROM users WHERE WebsiteUrl = 'http://stackoverflow.com';	codebase_community
To determine the badge name obtained by the user 'SilentGhost', we need to join the `users` and `badges` tables based on the `UserId`. The DisplayName in the `users` table should match 'SilentGhost' to identify the correct user, and then retrieve their badge from the `badges` table.  **Answer:** SELECT b.Name FROM users u INNER JOIN badges b ON u.Id = b.UserId WHERE u.DisplayName = 'SilentGhost';	codebase_community
SELECT UserDisplayName FROM comments WHERE Text = 'thank you user93!';	codebase_community
SELECT c.Text  FROM users u INNER JOIN comments c ON u.Id = c.UserId WHERE u.DisplayName = 'A Lion';	codebase_community
SELECT u.DisplayName, u.Reputation  FROM users u  INNER JOIN posts p  ON u.Id = p.OwnerUserId  WHERE p.Title = 'Understanding what Dassault iSight is doing?';	codebase_community
SELECT c.Text  FROM comments c WHERE c.PostId = (SELECT p.Id FROM posts p WHERE p.Title = 'How does gentle boosting differ from AdaBoost?')	codebase_community
SELECT DISTINCT u.DisplayName  FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Necromancer' LIMIT 10;	codebase_community
SELECT COALESCE(u.DisplayName, 'No Editor') AS Editor FROM posts p LEFT JOIN users u ON p.LastEditorUserId = u.Id WHERE p.Title = 'Open source tools for visualizing multi-dimensional data';	codebase_community
SELECT Title FROM posts WHERE LastEditorDisplayName = 'Vebjorn Ljosa';	codebase_community
SELECT u.WebsiteUrl, SUM(p.Score) AS TotalScore FROM posts p INNER JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Yevgeny' GROUP BY u.WebsiteUrl;	codebase_community
SELECT Id FROM Posts WHERE Title = 'Why square...'	codebase_community
SELECT SUM(v.BountyAmount) AS TotalBounty FROM votes v INNER JOIN posts p ON v.PostId = p.Id WHERE p.Title LIKE '%data%';	codebase_community
SELECT u.DisplayName  FROM votes v  INNER JOIN posts p ON v.PostId = p.Id  INNER JOIN users u ON v.UserId = u.Id  WHERE v.BountyAmount = 50 AND p.Title LIKE '%variance%';	codebase_community
SELECT p.*, t.TagName  FROM Posts p JOIN PostTags pt ON p.PostId = pt.PostId JOIN Tags t ON pt.TagId = t.TagId WHERE t.TagName = 'humor';	codebase_community
SELECT COUNT(*) FROM comments WHERE UserId = 13;	codebase_community
SELECT Id FROM Users ORDER BY Reputation DESC LIMIT 1;	codebase_community
SELECT Id FROM users WHERE Views = (SELECT MIN(Views) FROM users);	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Supporter' AND strftime('%Y', Date) = '2011';	codebase_community
SELECT COUNT(UserId) FROM (   SELECT UserId, COUNT(Name) AS BadgeCount    FROM badges    WHERE UserId IS NOT NULL    GROUP BY UserId    HAVING COUNT(Name) > 5 )	codebase_community
SELECT COUNT(DISTINCT u.Id)  FROM users u WHERE u.Location = 'New York' AND u.Id IN (   SELECT b1.UserId FROM badges b1 WHERE b1.Name = 'Teacher'    INTERSECT    SELECT b2.UserId FROM badges b2 WHERE b2.Name = 'Supporter' );	codebase_community
SELECT p.OwnerUserId AS UserId, u.Reputation  FROM posts p  INNER JOIN users u ON p.OwnerUserId = u.Id  WHERE p.Id = 1;	codebase_community
SELECT u.Id, u.DisplayName FROM Users u JOIN (     SELECT p.UserId, COUNT(p.Id) as PostCount, SUM(p.Views) as TotalViews     FROM Posts p     GROUP BY p.UserId ) sub ON u.UserId = sub.UserId WHERE sub.PostCount = 1 AND sub.TotalViews >= 1000;	codebase_community
WITH CommentCounts AS (     SELECT UserId, COUNT(Id) as CommentCount     FROM comments     GROUP BY UserId ) SELECT u.DisplayName, cc.CommentCount, b.Name as BadgeName, b.Date as BadgeDate FROM users u LEFT JOIN CommentCounts cc ON u.Id = cc.UserId LEFT JOIN badges b ON u.Id = b.UserId ORDER BY cc.CommentCount DESC;	codebase_community
SELECT COUNT(DISTINCT u.Id)  FROM users u  INNER JOIN badges b ON u.Id = b.UserId  WHERE u.Location = 'India' AND b.Name = 'Teacher';	codebase_community
SELECT      ((SELECT COUNT(Date) FROM badges WHERE YEAR(Date)=2010 AND Name='Student') / (SELECT COUNT(Name) FROM badges WHERE Name='Student')) * 100 -      ((SELECT COUNT(Date) FROM badges WHERE YEAR(Date)=2011 AND Name='Student') / (SELECT COUNT(Name) FROM badges WHERE Name='Student')) * 100	codebase_community
SELECT PostHistoryTypeId FROM postHistory WHERE PostId = 3720; SELECT COUNT(DISTINCT UserId) FROM comments WHERE PostId = 3720;	codebase_community
SELECT p.Id, p.CreationDate, p.Score, p.ViewCount, p.Title FROM posts p WHERE p.Id IN (     SELECT pl.PostId      FROM postLinks pl      WHERE pl.RelatedPostId = 61217 );  SELECT ViewCount AS Popularity FROM posts WHERE Id = 61217;	codebase_community
SELECT p.Score, pl.LinkTypeId  FROM posts p  INNER JOIN postLinks pl ON p.Id = pl.PostId  WHERE p.Id = 395;	codebase_community
SELECT Id, OwnerUserId FROM posts WHERE Score > 60;	codebase_community
SELECT SUM(FavoriteCount) FROM posts WHERE OwnerUserId = 686 AND STRFTIME('%Y', CreationDate) = '2011'	codebase_community
WITH UserPostCount AS (     SELECT OwnerUserId, COUNT(*) as PostCount     FROM posts     WHERE OwnerUserId IS NOT NULL     GROUP BY OwnerUserId ) SELECT      (Sum(u.UpVotes) / COUNT(u.Id)) as AvgUpVotes,     (Sum(u.Age) / COUNT(u.Id)) as AvgAge FROM users u JOIN UserPostCount c ON u.Id = c.OwnerUserId WHERE c.PostCount > 10;	codebase_community
SELECT COUNT(DISTINCT UserId) AS NumberOfUsers FROM badges WHERE Name = 'Announcer';	codebase_community
SELECT Name FROM badges WHERE Date = '2010-07-19 19:39:08.0'	codebase_community
SELECT COUNT(*) FROM comments WHERE Score > 60	codebase_community
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:25:47.0';	codebase_community
SELECT COUNT(Id) FROM posts WHERE Score = 10;	codebase_community
SELECT Name  FROM badges  WHERE UserId IN (   SELECT Id    FROM users    WHERE Reputation = (SELECT MAX(Reputation) FROM users) );	codebase_community
SELECT DISTINCT u.Reputation FROM users u INNER JOIN badges b ON u.Id = b.UserId WHERE b.Date = '2010-07-19 19:39:08.0'	codebase_community
SELECT b.Name  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.DisplayName = 'Pierre';	codebase_community
SELECT b.Date  FROM badges b  INNER JOIN users u ON b.UserId = u.Id  WHERE u.Location = 'Rochester, NY';	codebase_community
SELECT      (CAST(         (SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Teacher') AS REAL     ) /      (SELECT COUNT(Id) FROM users)     ) * 100;	codebase_community
SELECT      (COUNT(CASE WHEN u.Age BETWEEN 13 AND 18 THEN b.UserId END) / COUNT(b.UserId)) * 100 AS TeenagerPercentage FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Organizer';	codebase_community
SELECT c.Score  FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.CreaionDate = '2010-07-19 19:19:56.0';	codebase_community
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:37:33.0'	codebase_community
SELECT DISTINCT u.Age  FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'Vienna, Austria';	codebase_community
SELECT COUNT(DISTINCT b.UserId)  FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age BETWEEN 19 AND 65;	codebase_community
SELECT u.Views  FROM badges b  INNER JOIN users u ON b.UserId = u.Id  WHERE b.Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT Name FROM Badges WHERE UserId IN (SELECT Id FROM Users WHERE Reputation = (SELECT MIN(Reputation) FROM Users));	codebase_community
SELECT b.Name  FROM badges b  INNER JOIN users u ON b.UserId = u.Id  WHERE u.DisplayName = 'Sharpie';	codebase_community
SELECT COUNT(DISTINCT b.UserId) FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age > 65;	codebase_community
SELECT DisplayName FROM users WHERE Id = 30;	codebase_community
SELECT COUNT(Id) FROM users WHERE Location = 'New York';	codebase_community
SELECT COUNT(*) FROM votes WHERE YEAR(CreationDate) = 2010;	codebase_community
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT DisplayName FROM users WHERE Views = (SELECT MAX(Views) FROM users);	codebase_community
SELECT      COUNT(CASE WHEN YEAR(CreationDate) = 2010 THEN Id ELSE NULL END) AS Votes2010,     COUNT(CASE WHEN YEAR(CreationDate) = 2011 THEN Id ELSE NULL END) AS Votes2011,     (COUNT(CASE WHEN YEAR(CreationDate) = 2010 THEN Id ELSE NULL END) * 1.0 /       COUNT(CASE WHEN YEAR(CreationDate) = 2011 THEN Id ELSE NULL END)) AS Ratio FROM votes;	codebase_community
SELECT DISTINCT tagName FROM (   SELECT unnest(string_to_array(Tags, ',')) as tagName   FROM posts   WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'John Salvatier') ) AS sub;	codebase_community
SELECT COUNT(*) AS NumberOfPosts FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Daniel Vassallo';	codebase_community
SELECT COUNT(*) FROM votes WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Harlan');	codebase_community
SELECT p.Id  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.DisplayName = 'slashnick'  ORDER BY p.AnswerCount DESC  LIMIT 1;	codebase_community
SELECT MAX(ViewCount) FROM posts AS p JOIN users AS u ON p.OwnerUserId = u.Id WHERE u.DisplayName IN ('Harvey Motulsky', 'Noah Snyder');	codebase_community
SELECT COUNT(*)  FROM users  JOIN posts ON users.Id = posts.OwnerUserId  WHERE users.DisplayName = 'Matt Parker' AND posts.PostId > 4;	codebase_community
SELECT COUNT(c.Id)  FROM comments c  JOIN users u ON c.UserId = u.Id  WHERE u.DisplayName = 'Neil McGuigan' AND c.Score < 60;	codebase_community
WITH MarkPosts AS (     SELECT p.Tags     FROM users u     JOIN posts p ON u.Id = p.OwnerUserId     WHERE u.DisplayName = 'Mark Meckes' AND p.CommentCount = 0 ) SELECT DISTINCT value AS TagName FROM MarkPosts CROSS APPLY STRING_SPLIT(Tags, ',');	codebase_community
SELECT DisplayName FROM Users INNER JOIN Badges ON Users.Id = Badges.UserId WHERE Name = 'Organizer'	codebase_community
SELECT COUNT(DISTINCT pt.PostId) FROM posts p JOIN PostTags pt ON p.Id = pt.PostId JOIN tags t ON pt.TagId = t.Id WHERE p.OwnerDisplayName = 'Community'   AND t.Name = 'r';	codebase_community
SELECT      SUM(CASE WHEN u.DisplayName = 'Mornington' THEN p.ViewCount ELSE 0 END) -      SUM(CASE WHEN u.DisplayName = 'Amos' THEN p.ViewCount ELSE 0 END) FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id;	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Commentator' AND strftime('%Y', Date) = '2014';	codebase_community
SELECT COUNT(*) FROM posts WHERE CreaionDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59';	codebase_community
SELECT u.DisplayName, u.Age  FROM users u WHERE u.Views = (SELECT MAX(Views) FROM users);	codebase_community
SELECT LastEditDate, LastEditorUserId FROM posts WHERE Title = 'Detecting a given face in a database of facial images'	codebase_community
SELECT COUNT(*) FROM comments WHERE UserId = 13 AND Score < 60;	codebase_community
SELECT p.Title, c.UserDisplayName  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE c.Score > 60;	codebase_community
SELECT DISTINCT b.Name  FROM badges b  INNER JOIN users u ON b.UserId = u.Id  WHERE YEAR(b.Date) = 2011 AND u.Location = 'North Pole';	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM users u INNER JOIN posts p ON u.Id = p.OwnerUserId WHERE p.FavoriteCount > 150	codebase_community
SELECT COUNT(ph.PostId) AS PostHistoryCount, MAX(ph.CreationDate) AS LastEditDate FROM postHistory ph INNER JOIN posts p ON ph.PostId = p.Id WHERE p.Title = 'What is the best introductory Bayesian statistics textbook?'	codebase_community
SELECT U.LastAccessDate, U.Location  FROM Users U  INNER JOIN Badges B ON U.Id = B.UserId  WHERE B.Name = 'Outliers';	codebase_community
SELECT Title FROM posts WHERE Id IN (   SELECT RelatedPostId FROM postLinks WHERE PostId = (SELECT Id FROM posts WHERE Title = 'How to tell if something happened in a data set which monitors a value over time') );	codebase_community
SELECT p.Id AS PostId, NULL AS BadgeName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Samuel' AND YEAR(p.CreationDate) = 2013  UNION ALL  SELECT NULL AS PostId, b.Name AS BadgeName FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Samuel' AND YEAR(b.Date) = 2013;	codebase_community
SELECT OwnerDisplayName FROM posts WHERE ViewCount = (SELECT MAX(ViewCount) FROM posts);	codebase_community
SELECT u.DisplayName, u.Location FROM tags t INNER JOIN posts p ON t.ExcerptPostId = p.Id INNER JOIN users u ON p.OwnerUserId = u.Id WHERE t.TagName = 'hypothesis-testing';	codebase_community
SELECT p2.Title, pl.LinkTypeId   FROM postLinks pl   INNER JOIN posts p1 ON pl.PostId = p1.Id   INNER JOIN posts p2 ON pl.RelatedPostId = p2.Id   WHERE p1.Title = 'What are principal component scores?';	codebase_community
SELECT u.DisplayName FROM (     SELECT ParentId     FROM posts     WHERE ParentId IS NOT NULL     ORDER BY Score DESC     LIMIT 1 ) c JOIN posts p ON c.ParentId = p.Id JOIN users u ON p.OwnerUserId = u.Id;	codebase_community
SELECT u.DisplayName, u.WebsiteUrl  FROM votes v  JOIN users u ON v.UserId = u.Id  WHERE v.VoteTypeId = 8 AND v.BountyAmount = ( SELECT MAX(BountyAmount) FROM votes WHERE VoteTypeId = 8 )	codebase_community
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5;	codebase_community
SELECT COUNT(*) FROM tags WHERE Count BETWEEN 5000 AND 7000;	codebase_community
To find the owner user ID of the most valuable post, which is determined by the highest `FavoriteCount`, we can use a subquery to first determine the maximum value and then retrieve the corresponding `OwnerUserId`.  **Answer:**   SELECT OwnerUserId FROM posts WHERE FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts);	codebase_community
The most influential user is determined by having the highest reputation. To find their age:  SELECT Age FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users) LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT p.Id) FROM votes v JOIN posts p ON v.PostId = p.Id WHERE YEAR(p.CreationDate) = 2011 AND v.BountyAmount = 50;	codebase_community
SELECT Id FROM users WHERE Age IS NOT NULL ORDER BY Age ASC LIMIT 1;	codebase_community
SELECT SUM(Score) FROM posts WHERE LasActivityDate LIKE '2010-07-19%';	codebase_community
SELECT COUNT(pl.Id) / 12  FROM postLinks pl INNER JOIN posts p ON pl.PostId = p.Id WHERE YEAR(pl.CreationDate) = 2010 AND p.AnswerCount <= 2;	codebase_community
SELECT v.PostId FROM votes v INNER JOIN posts p ON v.PostId = p.Id WHERE v.UserId = 1465 GROUP BY v.PostId ORDER BY MAX(p.FavoriteCount) DESC LIMIT 1;	codebase_community
SELECT p.Title  FROM posts p JOIN postLinks pl ON p.Id = pl.PostId ORDER BY pl.CreationDate ASC LIMIT 1;	codebase_community
SELECT DisplayName FROM users WHERE Id = ( SELECT UserId FROM badges GROUP BY UserId ORDER BY COUNT(Name) DESC LIMIT 1 );	codebase_community
SELECT MIN(CreationDate) AS FirstVoteDate FROM votes WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'chl');	codebase_community
SELECT MIN(p.CreaionDate)  FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE u.Age = (SELECT MIN(Age) FROM users);	codebase_community
SELECT u.DisplayName  FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Autobiographer' ORDER BY b.Date ASC  LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT p.OwnerUserId)  FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.Location = 'United Kingdom' AND p.FavoriteCount >= 4;	codebase_community
SELECT AVG(num_votes) AS average_posts_voted FROM (   SELECT u.id, COUNT(v.userid) as num_votes   FROM users u   LEFT JOIN votes v ON u.id = v.userid   WHERE u.age = (SELECT MAX(age) FROM users)   GROUP BY u.id ) sub;	codebase_community
SELECT DisplayName FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT COUNT(Id) FROM `users` WHERE Reputation > 2000 AND Views > 1000;	codebase_community
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT COUNT(*)  FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Jay Stevens') AND YEAR(CreationDate) = 2010;	codebase_community
SELECT p.Id, p.Title FROM posts p INNER JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky' ORDER BY p.ViewCount DESC LIMIT 1;	codebase_community
SELECT Id, Title FROM posts ORDER BY Score DESC LIMIT 1;	codebase_community
SELECT AVG(p.Score)  FROM users u  JOIN posts p ON u.Id = p.OwnerUserId  WHERE u.DisplayName = 'Stephen Turner';	codebase_community
SELECT DISTINCT u.DisplayName  FROM Users u INNER JOIN Posts p ON u.Id = p.OwnerUserId WHERE p.ViewCount > 20000 AND YEAR(p.CreationDate) = 2011;	codebase_community
SELECT p.Id, u.DisplayName  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE STRFTIME('%Y', p.CreationDate) = '2010'  ORDER BY p.FavoriteCount DESC  LIMIT 1;	codebase_community
SELECT      CAST(         COUNT(CASE WHEN u.Reputation > 1000 THEN p.Id END) AS FLOAT      ) / COUNT(p.Id) * 100 AS Percentage FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE YEAR(p.CreationDate) = 2011;	codebase_community
SELECT CAST(COUNT(Id) AS float) * 100 / (SELECT COUNT(Id) FROM users) AS percentage FROM users WHERE Age BETWEEN 13 AND 18;	codebase_community
SELECT      p.Views AS Views,     u.DisplayName AS DisplayName FROM      posts p INNER JOIN      users u ON p.UserId = u.Id WHERE      p.Title LIKE '%data analysis%' OR p.Content LIKE '%data analysis%';	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts);	codebase_community
SELECT COUNT(*) FROM comments WHERE postid IN (SELECT id FROM posts WHERE score = (SELECT MAX(score) FROM posts));	codebase_community
SELECT COUNT(Id) FROM posts WHERE ViewCount > 35000 AND CommentCount = 0;	codebase_community
SELECT u.DisplayName, u.Location  FROM users u  INNER JOIN posts p ON u.Id = p.LastEditorUserId  WHERE p.Id = 183;	codebase_community
SELECT b.Name FROM badges b INNER JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Emmett' AND b.Date = (SELECT MAX(Date) FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Emmett'));	codebase_community
SELECT COUNT(*)  FROM users  WHERE Age BETWEEN 19 AND 65  AND UpVotes > 5000;	codebase_community
SELECT (MIN(b.Date) - u.CreationDate) AS TimeTaken  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.DisplayName = 'Zolomon';	codebase_community
SELECT      (SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT UserId FROM users WHERE CreationDate = (SELECT MAX(CreationDate) FROM users))) AS PostCount,     (SELECT COUNT(*) FROM comments WHERE UserId = (SELECT UserId FROM users WHERE CreationDate = (SELECT MAX(CreationDate) FROM users))) AS CommentCount;	codebase_community
SELECT c.Text, c.UserDisplayName FROM comments c INNER JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'Analysing wind data with R' ORDER BY c.CreationDate DESC LIMIT 10;	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Citizen Patrol';	codebase_community
SELECT COUNT(*) FROM Posts WHERE Tags LIKE '%careers%';	codebase_community
SELECT Reputation, Views FROM users WHERE DisplayName = 'Jarrod Dixon';	codebase_community
SELECT      (SELECT COUNT(*) FROM comments WHERE PostId = (SELECT Id FROM posts WHERE Title = 'Clustering 1D data')) AS CommentCount,     (SELECT COUNT(*) FROM posts WHERE ParentId = (SELECT Id FROM posts WHERE Title = 'Clustering 1D data') AND PostTypeId = 2) AS AnswerCount;	codebase_community
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat';	codebase_community
SELECT COUNT(DISTINCT PostId) FROM votes WHERE BountyAmount >= 30 AND BountyAmount IS NOT NULL;	codebase_community
SELECT      (COUNT(CASE WHEN Score > 50 THEN 1 ELSE NULL END) * 1.0 / COUNT(Id)) * 100 AS percentage FROM posts WHERE OwnerUserId = (     SELECT Id     FROM users     WHERE Reputation = (SELECT MAX(Reputation) FROM users)     LIMIT 1 );	codebase_community
SELECT COUNT(*) FROM posts WHERE Score < 20;	codebase_community
SELECT COUNT(Id) FROM tags WHERE Id < 15 AND Count <= 20;	codebase_community
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample';	codebase_community
SELECT u.Reputation, u.UpVotes  FROM users u INNER JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'fine, you win :)';	codebase_community
SELECT c.Text  FROM comments c  INNER JOIN posts p ON c.PostId = p.Id  WHERE p.Title LIKE '%linear regression%';	codebase_community
SELECT MAX(c.Score) AS max_score FROM comments c WHERE c.PostId IN (     SELECT p.Id     FROM posts p     WHERE p.ViewCount BETWEEN 100 AND 150 );	codebase_community
SELECT u.CreationDate, u.Age  FROM users u  INNER JOIN comments c  ON u.Id = c.UserId  WHERE c.Text LIKE '%http://%';	codebase_community
SELECT COUNT(DISTINCT c.PostId) as count_posts FROM comments c WHERE c.Score = 0;  SELECT COUNT(*)  FROM (     SELECT DISTINCT c.PostId AS pid     FROM comments c     WHERE c.Score = 0 ) AS sub INNER JOIN posts p ON sub.pid = p.Id WHERE p.ViewCount < 5;	codebase_community
SELECT COUNT(*) FROM posts INNER JOIN comments ON posts.Id = comments.PostId WHERE posts.CommentCount = 1 AND comments.Score = 0;	codebase_community
SELECT COUNT(DISTINCT u.Id)  FROM comments c INNER JOIN users u ON c.UserId = u.Id WHERE c.Score = 0 AND u.Age = 40;	codebase_community
SELECT p.Id AS PostID, c.Text AS Comments  FROM posts p  INNER JOIN comments c ON p.Id = c.PostId  WHERE p.Title = 'Group differences on a five point Likert item';	codebase_community
SELECT UpVotes FROM users WHERE Id = (SELECT UserId FROM comments WHERE Text = 'R is also lazy evaluated.');	codebase_community
SELECT c.Text FROM comments c INNER JOIN users u ON c.UserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky';	codebase_community
SELECT u.UserDisplayName  FROM comments c  INNER JOIN users u ON c.UserId = u.Id  WHERE c.Score BETWEEN 1 AND 5 AND u.DownVotes = 0;	codebase_community
SELECT      ( ( SELECT COUNT(*) FROM users u WHERE u.Id IN ( SELECT DISTINCT UserId FROM comments c WHERE c.Score BETWEEN 5 AND 10 ) AND u.UpVotes = 0 ) /        ( SELECT COUNT(DISTINCT UserId) FROM comments c WHERE c.Score BETWEEN 5 AND 10 ) ) * 100 AS zero_upvotes_percentage;	codebase_community
SELECT sp.power_name  FROM superpower sp  JOIN hero_power hp ON sp.id = hp.power_id  JOIN superhero s ON hp.hero_id = s.id  WHERE s.superhero_name = '3-D Man';	superhero
SELECT COUNT(DISTINCT hp.hero_id)  FROM hero_power hp WHERE hp.power_id = (SELECT id FROM superpower WHERE power_name = 'Super Strength');	superhero
SELECT COUNT(s.id) AS count FROM superhero s WHERE s.height_cm > 200 AND s.id IN (     SELECT hp.hero_id     FROM hero_power hp     JOIN superpower p ON hp.power_id = p.id     WHERE p.power_name = 'Super Strength' );	superhero
SELECT s.full_name FROM superhero s WHERE s.id IN (     SELECT hp.hero_id FROM hero_power hp     GROUP BY hp.hero_id     HAVING COUNT(*) > 15 )	superhero
SELECT COUNT(s.id) FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.color_name = 'Blue';	superhero
SELECT colour FROM superhero  INNER JOIN colour ON superhero.skin_colour_id = colour.id  WHERE superhero_name = 'Apocalypse';	superhero
SELECT COUNT(s.id)  FROM superhero s  JOIN hero_power hp ON s.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'Agility'  AND s.eye_colour_id = (SELECT id FROM colour WHERE power_name = 'Blue');	superhero
SELECT s.superhero_name  FROM superhero s  INNER JOIN colour c1 ON s.eye_colour_id = c1.id  INNER JOIN colour c2 ON s.hair_colour_id = c2.id  WHERE c1.colour = 'Blue' AND c2.colour = 'Blond';	superhero
SELECT COUNT(s.id) FROM superhero s INNER JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics';	superhero
SELECT superhero_name, full_name, height_cm,        DENSE_RANK() OVER (ORDER BY height_cm DESC) AS height_rank FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics' ORDER BY height_cm DESC;	superhero
SELECT p.publisher_name FROM publisher p INNER JOIN superhero s ON p.id = s.publisher_id WHERE s.superhero_name = 'Sauron';	superhero
SELECT COUNT(s.id) AS count_eye_color, c.colour FROM superhero s JOIN publisher p ON s.publisher_id = p.id JOIN colour c ON s.eye_colour_id = c.id WHERE p.publisher_name = 'Marvel Comics' GROUP BY c.colour ORDER BY count_eye_color DESC	superhero
SELECT AVG(height_cm) FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics';	superhero
SELECT DISTINCT s.id, s.full_name  FROM superhero s JOIN publisher p ON s.publisher_id = p.id JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE p.publisher_name = 'Marvel Comics' AND sp.power_name = 'Super Strength';	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = 4;	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.id IN (     SELECT ha.hero_id     FROM hero_attribute ha     JOIN attribute a ON ha.attribute_id = a.id     WHERE a.attribute_name = 'Speed'     AND ha.attribute_value = (SELECT MIN(ha2.attribute_value)                               FROM hero_attribute ha2                              JOIN attribute a2 ON ha2.attribute_id = a2.id                              WHERE a2.attribute_name = 'Speed') )	superhero
SELECT COUNT(*) FROM superhero INNER JOIN colour ON superhero.eye_colour_id = colour.id INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE colour.colour = 'Gold' AND publisher.publisher_name = 'Marvel Comics';	superhero
SELECT p.publisher_name  FROM superhero s  INNER JOIN publisher p  ON s.publisher_id = p.id  WHERE s.superhero_name = 'Blue Beetle II';	superhero
SELECT COUNT(*) AS number_of_blonde_superheroes FROM superhero INNER JOIN colour ON superhero.hair_colour_id = colour.id WHERE colour.power_name = 'Blond';	superhero
SELECT s.name  FROM superhero s  JOIN hero_attribute ha ON s.id = ha.hero_id  WHERE ha.attribute_id = 1  ORDER BY ha.attribute_value ASC  LIMIT 1;	superhero
SELECT r.race FROM superhero s INNER JOIN race r ON s.race_id = r.id WHERE s.superhero_name = 'Copycat';	superhero
SELECT s.superhero_name  FROM superhero s  JOIN hero_attribute ha ON s.id = ha.hero_id  JOIN attribute a ON ha.attribute_id = a.id  WHERE a.attribute_name = 'Durability' AND ha.attribute_value < 50;	superhero
SELECT s.superhero_name  FROM superhero s INNER JOIN hero_power hp ON s.id = hp.hero_id INNER JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Death Touch';	superhero
SELECT COUNT(*) AS count FROM superhero INNER JOIN gender ON superhero.gender_id = gender.id INNER JOIN hero_attribute ON superhero.id = hero_attribute.hero_id INNER JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE gender.gender = 'Female'   AND attribute.attribute_name = 'Strength'   AND hero_attribute.attribute_value = 100;	superhero
SELECT superhero_name FROM (     SELECT s.superhero_name, COUNT(hp.power_id) as power_count,     ROW_NUMBER() OVER (ORDER BY COUNT(hp.power_id) DESC) as row_num     FROM superhero s     LEFT JOIN hero_power hp ON s.id = hp.hero_id     GROUP BY s.superhero_name ) AS subquery WHERE row_num = 1;	superhero
SELECT COUNT(s.id) FROM superhero s JOIN race r ON s.race_id = r.id WHERE r.race = 'Vampire';	superhero
WITH BadAlignmentCount AS (     SELECT          COUNT(CASE WHEN a.alignment = 'Bad' THEN s.id END) AS BadCount,         COUNT(s.id) AS TotalCount     FROM superhero s     JOIN alignment a ON s.alignment_id = a.id ), MarvelCount AS (     SELECT          COUNT(CASE WHEN p.publisher_name = 'Marvel Comics' AND a.alignment = 'Bad' THEN s.id END) AS MarvelBadCount     FROM superhero s     JOIN alignment a ON s.alignment_id = a.id     JOIN publisher p ON s.publisher_id = p.id ) SELECT      ROUND((BadCount / TotalCount) * 100, 2) AS Percentage,     MarvelBadCount AS MarvelCount FROM BadAlignmentCount, MarvelCount;	superhero
SELECT    COALESCE(SUM(CASE WHEN p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END), 0) -    COALESCE(SUM(CASE WHEN p.publisher_name = 'DC Comics' THEN 1 ELSE 0 END), 0) AS difference FROM superhero s LEFT JOIN publisher p ON s.publisher_id = p.id;	superhero
SELECT id FROM publisher WHERE publisher_name = 'Star Trek';	superhero
SELECT AVG(attribute_value) FROM hero_attribute;	superhero
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL;	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.id = 75;	superhero
To retrieve the superpowers of the superhero named Deathlok, we need to join the relevant tables. Here's how:  SELECT sp.power_name FROM superhero s INNER JOIN hero_power hp ON s.id = hp.hero_id INNER JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Deathlok';	superhero
SELECT AVG(weight_kg) FROM superhero INNER JOIN gender ON superhero.gender_id = gender.id WHERE gender.gender = 'Female';	superhero
SELECT DISTINCT p.power_name  FROM superpower p INNER JOIN hero_power hp ON p.id = hp.power_id INNER JOIN superhero s ON hp.hero_id = s.id WHERE g.gender = 'Male' ORDER BY p.power_name;	superhero
SELECT s.superhero_name  FROM superhero s  JOIN race r ON s.race_id = r.id  WHERE r.race = 'Alien';	superhero
SELECT superhero_name FROM superhero WHERE height_cm BETWEEN 170 AND 190 AND eye_colour_id = 1;	superhero
SELECT s.power_name FROM superpower s JOIN hero_power hp ON s.id = hp.power_id WHERE hp.hero_id = 56;	superhero
SELECT s.full_name FROM superhero s JOIN race r ON s.race_id = r.id WHERE r.race = 'Demi-God' LIMIT 5;	superhero
To determine how many superheroes are considered 'Bad', we query the `superhero` table where `alignment_id` equals 2.  SELECT COUNT(*) FROM superhero WHERE alignment_id = 2;	superhero
SELECT DISTINCT T1.race FROM race AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T2.weight_kg = 169;	superhero
SELECT c.power_name  FROM superhero s  JOIN race r ON s.race_id = r.id  WHERE s.height_cm = 185 AND r.power_name = 'human';	superhero
SELECT c.color  FROM colour c  JOIN superhero s ON c.id = s.eye_colour_id  WHERE s.weight_kg = (SELECT MAX(weight_kg) FROM superhero);	superhero
SELECT      (COUNT(CASE WHEN p.publisher_name = 'Marvel Comics' THEN s.id ELSE NULL END) / COUNT(s.id)) * 100 AS percentage FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.height_cm BETWEEN 150 AND 180;	superhero
SELECT s.superhero_name FROM superhero s INNER JOIN gender g ON s.gender_id = g.id WHERE g.gender = 'Male' AND s.weight_kg > ( SELECT AVG(weight_kg) * 0.79 FROM superhero );	superhero
SELECT sp.power_name, COUNT(*) as power_count FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id GROUP BY sp.power_name ORDER BY power_count DESC LIMIT 1;	superhero
SELECT ha.attribute_value  FROM superhero s  INNER JOIN hero_attribute ha ON s.id = ha.hero_id  WHERE s.superhero_name = 'Abomination';	superhero
SELECT sp.power_name FROM superpower sp INNER JOIN hero_power hp ON sp.id = hp.power_id WHERE hp.hero_id = 1;	superhero
SELECT COUNT(DISTINCT hp.hero_id) FROM hero_power hp JOIN superpower s ON hp.power_id = s.id WHERE s.power_name = 'Stealth';	superhero
SELECT ha.hero_id, a.power_name, ha.attribute_value AS durability_value FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id WHERE a.power_name = 'Durability' AND ha.attribute_value = (     SELECT MAX(ha2.attribute_value)     FROM hero_attribute ha2     WHERE ha2.attribute_id = 4  );	superhero
SELECT COUNT(CASE WHEN skin_colour_id = 1 THEN id END) / COUNT(*) FROM superhero;	superhero
SELECT COUNT(s.id)  FROM superhero s  INNER JOIN publisher p  ON s.publisher_id = p.id  WHERE p.publisher_name = 'Dark Horse Comics';	superhero
SELECT S.superhero_name FROM superhero S JOIN publisher P ON S.publisher_id = P.id AND P.publisher_name = 'Dark Horse Comics' JOIN hero_attribute HA ON S.id = HA.hero_id JOIN attribute A ON HA.attribute_id = A.id AND A.attribute_name = 'Durability' WHERE HA.attribute_value = (   SELECT MAX(HA2.attribute_value)   FROM superhero S2   JOIN publisher P2 ON S2.publisher_id = P2.id AND P2.publisher_name = 'Dark Horse Comics'   JOIN hero_attribute HA2 ON S2.id = HA2.hero_id   JOIN attribute A2 ON HA2.attribute_id = A2.id AND A2.attribute_name = 'Durability' );	superhero
SELECT c.colour FROM superhero s INNER JOIN colour c ON s.eye_colour_id = c.id WHERE s.full_name = 'Abraham Sapien';	superhero
SELECT s.superhero_name  FROM superhero s  INNER JOIN hero_power hp ON s.id = hp.hero_id  INNER JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'Flight';	superhero
SELECT ec.color AS eye_color, hc.color AS hair_color, sc.color AS skin_color FROM superhero s INNER JOIN publisher p ON s.publisher_id = p.id INNER JOIN colour ec ON s.eye_colour_id = ec.id INNER JOIN colour hc ON s.hair_colour_id = hc.id INNER JOIN colour sc ON s.skin_colour_id = sc.id WHERE p.publisher_name = 'Dark Horse Comics' AND s.gender_id = 2;	superhero
SELECT superhero_name, publisher_name  FROM superhero  INNER JOIN publisher  ON superhero.publisher_id = publisher.id  WHERE eye_colour_id = hair_colour_id AND eye_colour_id = skin_colour_id;	superhero
SELECT r.race AS group_name FROM superhero s JOIN race r ON s.race_id = r.id WHERE s.superhero_name = 'A-Bomb';	superhero
SELECT      (COUNT(CASE WHEN c.color_name = 'Blue' THEN 1 ELSE NULL END) / COUNT(s.id)) * 100 FROM superhero s JOIN colour c ON s.skin_colour_id = c.id WHERE s.gender_id = 2;	superhero
SELECT s.superhero_name, r.race  FROM superhero s  INNER JOIN race r ON s.race_id = r.id  WHERE s.full_name = 'Charles Chandler';	superhero
SELECT g.gender FROM gender g INNER JOIN superhero s ON g.id = s.gender_id WHERE s.superhero_name = 'Agent 13';	superhero
SELECT DISTINCT s.superhero_name  FROM superhero s  INNER JOIN hero_power hp ON s.id = hp.hero_id  INNER JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'Adaptation';	superhero
SELECT COUNT(*)  FROM superhero  JOIN hero_power  ON superhero.id = hero_power.hero_id  WHERE superhero.superhero_name = 'Amazo';	superhero
SELECT T3.power_name FROM superhero AS T1  JOIN hero_power AS T2 ON T1.id = T2.hero_id  JOIN superpower AS T3 ON T2.power_id = T3.id  WHERE T1.full_name = 'Hunter Zolomon';	superhero
SELECT s.height_cm FROM superhero s INNER JOIN colour c ON s.eye_colour_id = c.id WHERE c.colour = 'Amber';	superhero
SELECT superhero_name FROM superhero WHERE eye_colour_id = 4 AND hair_colour_id = 4;	superhero
SELECT DISTINCT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.skin_colour_id = T2.id WHERE T2.colour = 'Gold'	superhero
SELECT s.full_name  FROM superhero s  JOIN race r ON s.race_id = r.id  WHERE r.race = 'Vampire';	superhero
SELECT s.superhero_name FROM superhero s INNER JOIN alignment a ON s.alignment_id = a.id WHERE a.alignment = 'Neutral';	superhero
SELECT COUNT(DISTINCT ha.hero_id) FROM hero_attribute ha WHERE ha.attribute_id = 2 AND ha.attribute_value = (     SELECT MAX(ha2.attribute_value)     FROM hero_attribute ha2     WHERE ha2.attribute_id = 2 );	superhero
SELECT r.race, a.alignment  FROM superhero s  INNER JOIN race r ON s.race_id = r.id  INNER JOIN alignment a ON s.alignment_id = a.id  WHERE s.superhero_name = 'Cameron Hicks';	superhero
SELECT      (COUNT(CASE WHEN p.publisher_name = 'Marvel Comics' THEN s.id ELSE NULL END) / COUNT(s.id)) * 100  FROM superhero s  JOIN gender g ON s.gender_id = g.id  JOIN publisher p ON s.publisher_id = p.id  WHERE g.gender = 'Female';	superhero
SELECT AVG(weight_kg) FROM superhero WHERE race_id = 2;	superhero
SELECT (SELECT weight_kg FROM superhero WHERE full_name = 'Emil Blonsky') - (SELECT weight_kg FROM superhero WHERE full_name = 'Charles Chandler');	superhero
SELECT AVG(height_cm) FROM superhero;	superhero
SELECT s.power_name  FROM superpower s JOIN hero_power hp ON s.id = hp.power_id JOIN superhero su ON hp.hero_id = su.id WHERE su.superhero_name = 'Abomination';	superhero
SELECT COUNT(*) FROM superhero WHERE race_id = 21 AND gender_id = 1;	superhero
SELECT s.superhero_name  FROM superhero s  JOIN hero_attribute ha ON s.id = ha.hero_id  JOIN attribute a ON ha.attribute_id = a.id  WHERE a.attribute_name = 'Speed'  ORDER BY ha.attribute_value DESC  LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3;	superhero
SELECT a.attribute_name, ha.attribute_value  FROM superhero s  JOIN hero_attribute ha ON s.id = ha.hero_id  JOIN attribute a ON ha.attribute_id = a.id  WHERE s.superhero_name = '3-D Man';	superhero
SELECT superhero_name FROM superhero INNER JOIN colour c1 ON eye_colour_id = c1.id AND c1.colour = 'Blue' INNER JOIN colour c2 ON hair_colour_id = c2.id AND c2.colour = 'Brown';	superhero
SELECT p.publisher_name AS Publisher, s.superhero_name AS Superhero  FROM superhero s  INNER JOIN publisher p ON s.publisher_id = p.id  WHERE s.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy');	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = 1;	superhero
SELECT      (CAST((SELECT COUNT(id) FROM superhero WHERE eye_colour_id = 7) AS REAL) /       (SELECT COUNT(id) FROM superhero) * 100.0);	superhero
SELECT SUM(CASE WHEN gender_id = 2 THEN 1 ELSE 0 END) / SUM(CASE WHEN gender_id = 1 THEN 1 ELSE 0 END) AS ratio FROM superhero;	superhero
SELECT superhero_name FROM superhero WHERE height_cm = (SELECT MAX(height_cm) FROM superhero);	superhero
;	superhero
SELECT superhero_name FROM superhero WHERE id = 294;	superhero
SELECT full_name FROM superhero WHERE weight_kg = 0 OR weight_kg IS NULL;	superhero
SELECT colour.colour FROM colour INNER JOIN superhero ON superhero.eye_colour_id = colour.id WHERE superhero.full_name = 'Karen Beecher-Duncan';	superhero
SELECT sp.power_name  FROM superhero s  INNER JOIN hero_power hp ON s.id = hp.hero_id  INNER JOIN superpower sp ON hp.power_id = sp.id  WHERE s.full_name = 'Helen Parr';	superhero
SELECT race FROM race WHERE id = (SELECT race_id FROM superhero WHERE weight_kg = 108 AND height_cm = 188);	superhero
SELECT p.publisher_name  FROM superhero s  INNER JOIN publisher p  ON s.publisher_id = p.id  WHERE s.id = 38;	superhero
SELECT name, height  FROM superhero  ORDER BY height DESC  LIMIT 1;	superhero
SELECT a.alignment, sp.power_name  FROM superhero s INNER JOIN alignment a ON s.alignment_id = a.id INNER JOIN hero_power hp ON s.id = hp.hero_id INNER JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Atom IV';	superhero
SELECT T1.full_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Blue' LIMIT 5	superhero
SELECT AVG(ha.attribute_value) AS averageAttributeValue FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE s.alignment_id = 3;	superhero
SELECT c.colour FROM colour c INNER JOIN superhero s ON c.id = s.skin_colour_id INNER JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_value = 100;	superhero
SELECT COUNT(id)  FROM superhero  WHERE alignment_id = 1 AND gender_id = 2;	superhero
SELECT s.superhero_name  FROM superhero s  INNER JOIN hero_attribute ha  ON s.id = ha.hero_id  WHERE ha.attribute_value BETWEEN 75 AND 80;	superhero
SELECT T4.race FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id INNER JOIN colour AS T3 ON T1.hair_colour_id = T3.id INNER JOIN race AS T4 ON T1.race_id = T4.id WHERE T2.gender = 'Male' AND T3.colour = 'Blue';	superhero
SELECT      (COUNT(CASE WHEN gender_id = 2 THEN 1 ELSE NULL END) / COUNT(id)) * 100.0  FROM superhero  WHERE alignment_id = 2;	superhero
SELECT SUM(CASE WHEN T.eye_colour_id = 7 THEN 1 ELSE 0 END) - SUM(CASE WHEN T.eye_colour_id = 1 THEN 1 ELSE 0 END) AS diff FROM superhero T WHERE T.weight_kg = 0 OR T.weight_kg IS NULL	superhero
To find Hulk's strength:  SELECT ha.attribute_value  FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE s.superhero_name = 'Hulk' AND ha.attribute_id = 2;  However, considering the provided data doesn't include Hulk, but following the structure...  The correct SQL query is:  SELECT ha.attribute_value FROM superhero AS s INNER JOIN hero_attribute AS ha ON s.id = ha.hero_id WHERE s.superhero_name = 'Hulk' AND ha.attribute_id = 2;	superhero
SELECT s.power_name  FROM superpower s INNER JOIN hero_power hp ON s.id = hp.power_id INNER JOIN superhero su ON hp.hero_id = su.id WHERE su.superhero_name = 'Ajax';	superhero
SELECT COUNT(*) FROM superhero INNER JOIN colour ON superhero.skin_colour_id = colour.id INNER JOIN alignment ON superhero.alignment_id = alignment.id WHERE colour.colour = 'Green' AND alignment.name = 'Bad';	superhero
SELECT COUNT(*) FROM superhero INNER JOIN gender ON superhero.gender_id = gender.id INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE gender.gender = 'Female' AND publisher.publisher_name = 'Marvel Comics';	superhero
SELECT DISTINCT s.superhero_name  FROM superhero s  JOIN hero_power hp ON s.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'Wind Control'  ORDER BY s.superhero_name ASC;	superhero
SELECT g.gender  FROM superpower sp  JOIN hero_power hp ON sp.id = hp.power_id  JOIN superhero s ON hp.hero_id = s.id  JOIN gender g ON s.gender_id = g.id  WHERE sp.power_name = 'Phoenix Force';	superhero
SELECT s.superhero_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'DC Comics' AND s.weight_kg = (SELECT MAX(weight_kg) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics'));	superhero
SELECT AVG(height_cm) FROM superhero s JOIN race r ON s.race_id = r.id JOIN publisher p ON s.publisher_id = p.id WHERE r.race != 'Human' AND p.publisher_name = 'Dark Horse Comics';	superhero
SELECT COUNT(hero_id) FROM hero_attribute WHERE attribute_id = 3 AND attribute_value = 100;	superhero
SELECT    (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')) -    (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')) AS difference;	superhero
SELECT T2.attribute_name  FROM hero_attribute AS T1  JOIN superhero AS T3 ON T1.hero_id = T3.id AND T3.superhero_name = 'Black Panther' JOIN attribute AS T2 ON T1.attribute_id = T2.id  ORDER BY T1.attribute_value ASC  LIMIT 1;	superhero
SELECT colour FROM colour INNER JOIN superhero ON superhero.eye_colour_id = colour.id WHERE superhero.superhero_name = 'Abomination';	superhero
SELECT superhero_name FROM superhero WHERE height_cm = (SELECT MAX(height_cm) FROM superhero);	superhero
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler';	superhero
SELECT      (SUM(CASE WHEN s.gender_id = 2 THEN 1 ELSE 0 END) * 100.0) / COUNT(s.id) AS percentage_female FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'George Lucas';	superhero
SELECT    (SUM(CASE WHEN a.alignment = 'Good' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS percentage FROM superhero s JOIN publisher p ON s.publisher_id = p.id JOIN alignment a ON s.alignment_id = a.id WHERE p.publisher_name = 'Marvel Comics';	superhero
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%';	superhero
SELECT hero_id FROM hero_attribute WHERE attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute);	superhero
SELECT s.full_name FROM superhero s JOIN race r ON s.race_id = r.id WHERE r.race = 'Alien';	superhero
SELECT s.full_name FROM superhero s INNER JOIN colour c ON s.eye_colour_id = c.id WHERE s.weight_kg < 100 AND c.power_name = 'Brown';	superhero
SELECT ha.attribute_value  FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE s.superhero_name = 'Aquababy';	superhero
SELECT s.weight_kg, r.race FROM superhero s INNER JOIN race r ON s.race_id = r.id WHERE s.id = 40;	superhero
SELECT AVG(height_cm) FROM superhero WHERE alignment_id = 3;	superhero
SELECT s.id  FROM superhero s  INNER JOIN hero_power hp ON s.id = hp.hero_id  INNER JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'Intelligence';	superhero
SELECT colour FROM superhero INNER JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.superhero_name = 'Blackwulf';	superhero
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id JOIN superhero s ON hp.hero_id = s.id WHERE s.height_cm > ( SELECT 0.8 * AVG(height_cm) FROM superhero )	superhero
SELECT d.driverRef  FROM drivers d  JOIN qualifying q ON d.driverId = q.driverId  WHERE q.raceId = 20  ORDER BY q.q1 DESC  LIMIT 5;	formula_1
SELECT d.surname FROM drivers d INNER JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 19 AND q.q2 = (SELECT MIN(q2) FROM qualifying WHERE raceId = 19);	formula_1
To find the years when races were held at the Shanghai International Circuit, we need to join the `races` and `circuits` tables. Here's how to do it:  SELECT DISTINCT r.year  FROM races r INNER JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Shanghai International Circuit';	formula_1
SELECT url FROM circuits WHERE name = 'Circuit de Barcelona-Catalunya';	formula_1
SELECT r.name FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.country = 'Germany';	formula_1
SELECT c.position FROM circuits AS c JOIN constructors AS co ON c.builtBy = co.constructorId WHERE co.constructorName = 'Renault';	formula_1
SELECT COUNT(raceId)  FROM races  WHERE year = 2010 AND country NOT LIKE '%Europe%' AND country NOT LIKE '%Asia%';	formula_1
SELECT r.name  FROM races r JOIN circuits c ON r.circuitid = c.circuitid WHERE c.country = 'Spain';	formula_1
SELECT c.lat, c.lng  FROM circuits c  INNER JOIN races r  ON c.circuitId = r.circuitId  WHERE r.name = 'Australian Grand Prix';	formula_1
SELECT url FROM races AS r INNER JOIN circuits AS c ON r.circuitid = c.circuitid WHERE c.name = 'Sepang International Circuit';	formula_1
SELECT time FROM races WHERE circuit_name = 'Sepang International Circuit';	formula_1
SELECT lat, lng FROM races WHERE name = 'Abu Dhabi Grand Prix'	formula_1
SELECT constructors.nationality FROM constructors JOIN results ON constructors.constructorId = results.constructorId WHERE results.raceId = 24 AND results.points = 1;	formula_1
SELECT q1 FROM qualifying INNER JOIN drivers ON qualifying.driverId = drivers.driverId WHERE raceId = 354 AND forename = 'Bruno' AND surname = 'Senna';	formula_1
SELECT d.nationality  FROM qualifying q  INNER JOIN drivers d ON q.driverId = d.driverId  WHERE q.raceId = 355 AND q.q2 = '0:01:40';	formula_1
SELECT number FROM qualifying WHERE raceId = 903 AND q3 LIKE '1:54%';	formula_1
SELECT COUNT(*)  FROM results r JOIN races r2 ON r.raceId = r2.raceId WHERE r.time IS NULL AND r2.name = 'Bahrain Grand Prix' AND r2.year = 2007;	formula_1
SELECT `year` FROM races WHERE raceId = 901	formula_1
SELECT COUNT(DISTINCT r.driverId) AS number_of_finishers FROM results r JOIN races rc ON r.raceId = rc.raceId WHERE rc.date = '2015-11-29' AND r.time IS NOT NULL;	formula_1
SELECT d.forename, d.surname, d.dob  FROM results r  JOIN drivers d ON r.driverId = d.driverId  WHERE r.raceId = 592 AND r.time IS NOT NULL  ORDER BY d.dob ASC  LIMIT 1;	formula_1
SELECT d.url  FROM drivers d JOIN laptimes l ON d.driverId = l.driverId WHERE l.raceId = 161 AND l.time LIKE '1:27%';	formula_1
SELECT DISTINCT d.nationality  FROM results r  JOIN drivers d ON r.driverId = d.driverId  WHERE r.raceId = 933 AND r.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results WHERE raceId = 933);	formula_1
SELECT lat, lng FROM races WHERE name = 'Malaysian Grand Prix'	formula_1
SELECT c.url FROM constructors c WHERE c.constructorId = (SELECT cr.constructorId FROM constructorResults cr WHERE cr.raceId = 9 ORDER BY cr.points DESC LIMIT 1);	formula_1
SELECT q.q1 FROM qualifying q INNER JOIN drivers d ON q.driverId = d.driverId WHERE d.forename = 'Lucas' AND d.surname = 'di Grassi' AND q.raceId = 345;	formula_1
SELECT d.nationality  FROM drivers d  JOIN qualifying q ON d.driverId = q.driverId  WHERE q.raceId = 347 AND q.q2 = '0:01:15';	formula_1
SELECT d.code FROM qualifying q INNER JOIN drivers d ON q.driverId = d.driverId WHERE q.raceId = 45 AND q.q3 LIKE '01:33%'	formula_1
SELECT r.time  FROM results r  JOIN drivers d ON r.driverId = d.driverId  WHERE r.raceId = 743 AND d.name = 'Bruce McLaren';	formula_1
SELECT d.forename, d.surname  FROM drivers AS d JOIN results AS r ON d.driverId = r.driverId JOIN races AS rc ON r.raceId = rc.raceId JOIN status AS s ON r.statusId = s.statusId WHERE rc.name = 'San Marino Grand Prix' AND EXTRACT(YEAR FROM rc.date) = 2006 AND r.position = 2 AND s.status = 'Finished';	formula_1
SELECT url FROM seasons WHERE seasonId = (SELECT seasonId FROM races WHERE raceId = 901);	formula_1
SELECT COUNT(*)  FROM results  WHERE raceId = 18 AND statusId IN (2, 3, 4, 5);	formula_1
SELECT d.forename, d.surname, d.dob FROM drivers d WHERE d.driverId IN ( SELECT r.driverId FROM results r WHERE r.raceId = 872 AND r.time IS NOT NULL ) ORDER BY d.dob DESC LIMIT 1	formula_1
SELECT d.firstName, d.lastName FROM drivers d WHERE d.driverId = (     SELECT r.driverId     FROM results r     WHERE r.raceId = 348     ORDER BY r.fastestLapTime ASC     LIMIT 1 );	formula_1
SELECT d.nationality FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results);	formula_1
SELECT      (((         SELECT fastestLapSpeed          FROM results          WHERE raceId = 853 AND driverId = (             SELECT driverId              FROM drivers              WHERE forename = 'Paul' AND surname = 'di Resta'         )     ) - (         SELECT fastestLapSpeed          FROM results          WHERE raceId = 854 AND driverId = (             SELECT driverId              FROM drivers              WHERE forename = 'Paul' AND surname = 'di Resta'         )     )) / (         SELECT fastestLapSpeed          FROM results          WHERE raceId = 853 AND driverId = (             SELECT driverId              FROM drivers              WHERE forename = 'Paul' AND surname = 'di Resta'         )     ) * 100) AS percent Faster;	formula_1
SELECT      (COUNT(CASE WHEN time IS NOT NULL THEN driverid END) / COUNT(driverid)) * 100 AS completion_rate FROM      races r JOIN      results re ON r.raceid = re.raceid WHERE      r.date = '1983-07-16'	formula_1
SELECT MIN(year) FROM races WHERE location = 'Marina Bay Street Circuit'	formula_1
SELECT COUNT(*) AS number_of_races FROM races WHERE year = 2005; SELECT name, date FROM races WHERE year = 2005 ORDER BY date DESC;	formula_1
SELECT name FROM races WHERE YEAR(date) = (SELECT YEAR(min_date)) AND MONTH(date) = (SELECT MONTH(min_date)) FROM (SELECT MIN(date) AS min_date FROM races) AS subquery;	formula_1
SELECT name, date FROM races WHERE EXTRACT(YEAR FROM date) = 1999 AND round = (SELECT MAX(round) FROM races WHERE EXTRACT(YEAR FROM date) = 1999);	formula_1
SELECT year FROM races GROUP BY year ORDER BY COUNT(*) DESC LIMIT 1;	formula_1
SELECT name FROM races WHERE year = 2017 AND name NOT IN (SELECT name FROM races WHERE year = 2000);	formula_1
SELECT country, circuit AS location FROM races WHERE raceName = 'European Grand Prix' ORDER BY year ASC LIMIT 1	formula_1
SELECT MAX(year) FROM races WHERE name = 'British Grand Prix' AND circuit = 'Brands Hatch';	formula_1
SELECT COUNT(*)  FROM races  INNER JOIN circuits ON races.circuit_id = circuits.circuit_id  WHERE races.name = 'British Grand Prix' AND circuits.name = 'Silverstone Circuit';	formula_1
SELECT d.forename, d.surname FROM drivers AS d JOIN results AS r ON d.driverId = r.driverId WHERE r.raceId = 18 ORDER BY r.position;	formula_1
SELECT      d.forename AS "First Name",     d.surname AS "Last Name",     SUM(r.points) AS "Total Points" FROM drivers d JOIN results r ON d.driverId = r.driverId GROUP BY d.driverId, d.forename, d.surname ORDER BY "Total Points" DESC;	formula_1
SELECT d.forename, d.surname, res.points FROM results res JOIN races r ON res.raceId = r.raceId JOIN drivers d ON res.driverId = d.driverId WHERE r.name = 'Chinese Grand Prix' AND r.year = 2017 AND res.statusId = 1 ORDER BY res.points DESC LIMIT 3;	formula_1
SELECT MIN(lap_times.milliseconds) AS best_lap_time,        drivers.forename || ' ' || drivers.surname AS driver_name,        races.name AS race_name FROM lap_times INNER JOIN drivers ON lap_times.driver_id = drivers.driver_id INNER JOIN races ON lap_times.race_id = races.race_id;	formula_1
SELECT      (r.milliseconds / r.laps) AS average_lap_time FROM      results r JOIN      races ra ON r.raceId = ra.raceId WHERE      ra.name = 'Malaysian Grand Prix'     AND r.driverId = (         SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton'     );	formula_1
SELECT      ((COUNT(CASE WHEN r.position > 1 THEN r.raceId ELSE NULL END)) / COUNT(r.raceId)) * 100 AS PercentageNotFirst FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races rc ON r.raceId = rc.raceId WHERE d.surname = 'Hamilton' AND rc.year >=2010;	formula_1
SELECT d.forename, d.surname, d.nationality, MAX(r.points) as max_points FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.position = 1 GROUP BY d.driverId ORDER BY COUNT(r.position) DESC LIMIT 1;	formula_1
SELECT name, YEAR(CURRENT_TIMESTAMP) - YEAR(dob) AS age FROM drivers WHERE nationality = 'Japanese' ORDER BY dob DESC LIMIT 1;	formula_1
SELECT name  FROM circuits  WHERE id IN (     SELECT circuitId      FROM races      WHERE YEAR(date) BETWEEN 1990 AND 2000      GROUP BY circuitId      HAVING COUNT(*) >= 4 )	formula_1
SELECT c.name AS CircuitName, c.location AS CircuitLocation, r.name AS RaceName FROM races r INNER JOIN circuits c ON r.circuitId = c.circuitId WHERE YEAR(r.date) = 2006 AND c.location LIKE '%USA%';	formula_1
SELECT raceName, circuitName, location FROM races WHERE MONTH(date) = 9 AND YEAR(date) = 2005;	formula_1
SELECT r.* FROM races r INNER JOIN results res ON r.raceId = res.raceId INNER JOIN drivers d ON res.driverId = d.driverId WHERE d.forename = 'Alex' AND d.surname = 'Yoong' AND res.position < 20	formula_1
SELECT COUNT(*) FROM Races r JOIN Results res ON r.raceId = res.raceId JOIN Drivers d ON res.driverId = d.driverId WHERE r.name = 'Sepang International Circuit'   AND d.lastName = 'Schumacher'   AND res.points = (     SELECT MAX(res2.points)      FROM Races r2      JOIN Results res2 ON r2.raceId = res2.raceId     WHERE r2.name = 'Sepang International Circuit'   );	formula_1
SELECT r.raceId, r.year FROM results AS res JOIN drivers AS d ON res.driverId = d.driverId JOIN races AS rac ON res.raceId = rac.raceId WHERE d.forename = 'Michael' AND d.surname = 'Schumacher' ORDER BY res.fastestLapTime ASC LIMIT 1;	formula_1
SELECT AVG(r.points) AS average_points FROM results r JOIN races USING(raceId) WHERE year = 2000 AND driverId = (SELECT driverId FROM drivers WHERE forename = 'Eddie' AND surname = 'Irvine');	formula_1
SELECT r.points FROM results r WHERE r.driverId = (   SELECT d.driverId   FROM drivers d   WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' ) AND r.time = (   SELECT MIN(r2.time)   FROM results r2   WHERE r2.driverId = (     SELECT d2.driverId     FROM drivers d2     WHERE d2.forename = 'Lewis' AND d2.surname = 'Hamilton'   ) );	formula_1
SELECT r.name AS race_name, c.name AS country_name  FROM races r JOIN countries c ON r.countryid = c.countryid WHERE year = 2017 ORDER BY r.date;	formula_1
SELECT r.name, r.year, c.location  FROM races r JOIN circuits c ON r.race_circuit_id = c.circuit_id WHERE r.laps = (SELECT MAX(laps) FROM races);	formula_1
SELECT (COUNT(CASE WHEN country = 'Germany' THEN 1 ELSE NULL END) / COUNT(*) * 100) AS percentage FROM races WHERE name = 'European Grand Prix';	formula_1
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit'	formula_1
SELECT MAX(lat) AS max_latitude FROM circuits WHERE circuitName IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring');	formula_1
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit';	formula_1
SELECT country FROM circuits WHERE alt = (SELECT MAX(alt) FROM circuits);	formula_1
SELECT COUNT(*) FROM drivers WHERE code IS NULL;	formula_1
SELECT nationality FROM drivers ORDER BY dob ASC LIMIT 1;	formula_1
SELECT lastname FROM drivers WHERE nationality = 'italian';	formula_1
SELECT website FROM drivers WHERE driverName = 'Anthony Davidson';	formula_1
SELECT driverRef FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton';	formula_1
SELECT c.name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.year = 2009 AND r.name = 'Spanish Grand Prix';	formula_1
SELECT DISTINCT year FROM races WHERE circuit = 'Silverstone Circuit';	formula_1
SELECT r.url, r.name, r.date, r.location  FROM races r INNER JOIN circuits c  ON r.circuitId = c.circuitId WHERE c.name = 'Silverstone Circuit';	formula_1
SELECT r.start_time  FROM races AS r JOIN circuits AS c ON r.circuit_id = c.circuit_id WHERE c.name = 'Abu Dhabi' AND YEAR(r.date) = 2010;	formula_1
SELECT COUNT(r.raceid) FROM races r INNER JOIN circuits c ON r.circuitid = c.circuitid INNER JOIN countries co ON c.countryid = co.countryid WHERE co.name = 'Italy';	formula_1
SELECT date FROM races WHERE circuitName = 'Barcelona-Catalunya';	formula_1
SELECT url FROM races WHERE year = 2009 AND name = 'Spanish Grand Prix'	formula_1
SELECT MIN(fastestLapTime) AS fastest_time FROM results WHERE driverId = 1;	formula_1
SELECT d.forename, d.surname  FROM drivers d  INNER JOIN results r ON d.driverId = r.driverId  WHERE r.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results);	formula_1
SELECT d.driverRef  FROM results r JOIN races rc ON r.raceId = rc.raceId  JOIN drivers d ON r.driverId = d.driverId  WHERE rc.name = 'Canadian Grand Prix' AND rc.year = 2007 AND r.position = 1;	formula_1
SELECT DISTINCT raceId FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton');	formula_1
SELECT r.name  FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' ORDER BY res.rank ASC LIMIT 1;	formula_1
SELECT MAX(r.fastestLapSpeed) AS fastest_lap_speed FROM results r INNER JOIN races ra ON r.raceId = ra.id WHERE ra.name = 'Spanish Grand Prix' AND r.fastestLapSpeed IS NOT NULL;	formula_1
SELECT DISTINCT YEAR(r.date) AS year  FROM drivers d  INNER JOIN results re ON d.driverId = re.driverId  INNER JOIN races r ON re.raceId = r.raceId  WHERE d.driverName = 'Lewis Hamilton';	formula_1
SELECT r.positionOrder FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND r.raceId = 18;	formula_1
SELECT D.Forename, D.Surname  FROM Drivers AS D JOIN Qualifying AS Q ON D.DriverId = Q.DriverId WHERE Q.RaceId = 18 AND Q.Position = 4;	formula_1
SELECT COUNT(DISTINCT r.driverId) AS number_of_drivers FROM results r JOIN races ras ON r.raceId = ras.raceId WHERE ras.year = 2008 AND ras.name = 'Australian Grand Prix' AND r.time IS NOT NULL;	formula_1
SELECT fastestLapTime  FROM results  WHERE raceId = 841 AND driverId = 1;	formula_1
SELECT r.time FROM races AS rc INNER JOIN results AS r ON rc.raceId = r.raceId WHERE rc.name = 'Australian Grand Prix' AND rc.year = 2008 AND r.position = 2	formula_1
SELECT D.driverName, D.url  FROM results R JOIN races RC ON R.raceId = RC.raceId AND RC.name = 'Australian Grand Prix' AND RC.year = 2008 JOIN drivers D ON R.driverId = D.driverId WHERE R.position = 1 AND R.statusId = 1;	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE d.nationality = 'British' AND r.raceId = 841;	formula_1
SELECT COUNT(DISTINCT r.driverId)  FROM results r  WHERE r.raceId = 841 AND r.time IS NOT NULL;	formula_1
SELECT SUM(p.points) AS total_points FROM results p JOIN drivers d ON p.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT AVG(     (CAST(SUBSTR(fastestLapTime, 1, INSTR(fastestLapTime, ':') - 1) AS INT) * 60)     + CAST(SUBSTR(fastestLapTime, INSTR(fastestLapTime, ':') + 1, INSTR(fastestLapTime, '.') - INSTR(fastestLapTime, ':') - 1) AS INT)     + CAST(SUBSTR(fastestLapTime, INSTR(fastestLapTime, '.') + 1) AS INT) / 1000 ) AS average_fastest_lap_seconds FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.name = 'Lewis Hamilton' AND fastestLapTime IS NOT NULL;	formula_1
SELECT      COUNT(CASE WHEN time IS NOT NULL THEN resultId END) / COUNT(resultId) * 100 AS completion_rate FROM      results WHERE      raceId = 18;	formula_1
;	formula_1
SELECT COUNT(*) FROM circuits WHERE location = 'Adelaide' AND country = 'Australia';	formula_1
SELECT lat, lng FROM circuits WHERE country = 'USA';	formula_1
SELECT COUNT(*) AS count FROM drivers WHERE YEAR(dob) > 1980 AND nationality = 'British';	formula_1
SELECT MAX(cs.points) AS max_points FROM constructor_standings cs INNER JOIN constructors c ON cs.constructorId = c.constructorId WHERE c.nationality = 'British';	formula_1
SELECT ConstructorId, Points FROM constructorstandings WHERE Points = (SELECT MAX(Points) FROM constructorstandings);	formula_1
SELECT DISTINCT c.constructorName  FROM constructors c INNER JOIN results r ON c.constructorId = r.constructorId WHERE r.raceId = 291 AND r.points = 0;	formula_1
SELECT COUNT(c.constructorId) FROM constructors c JOIN constructor_results cr ON c.constructorId = cr.constructorId WHERE c.nationality = 'Japanese' AND cr.points = 0 GROUP BY c.constructorId HAVING COUNT(cr.raceId) = 2;	formula_1
SELECT DISTINCT constructorId FROM constructorstandings WHERE position = 1;	formula_1
SELECT COUNT(DISTINCT c.constructorId) AS french_constructors_over_50_laps FROM constructors c INNER JOIN results r ON c.constructorId = r.constructorId WHERE c.nationality = 'French' AND r.laps > 50;	formula_1
WITH completed_races AS (     SELECT          d.driverid,         COUNT(r.resultid) AS total_completed     FROM          results r     JOIN          races rc ON r.raceid = rc.raceid     JOIN          drivers d ON r.driverid = d.driverid     WHERE          EXTRACT(YEAR FROM rc.date) BETWEEN 2007 AND 2009         AND d.nationality = 'Japanese'         AND r.time IS NOT NULL     GROUP BY          d.driverid ), total_entries AS (     SELECT          d.driverid,         COUNT(r.resultid) AS total_races     FROM          results r     JOIN          races rc ON r.raceid = rc.raceid     JOIN          drivers d ON r.driverid = d.driverid     WHERE          EXTRACT(YEAR FROM rc.date) BETWEEN 2007 AND 2009         AND d.nationality = 'Japanese'     GROUP BY          d.driverid ) SELECT      ROUND(         (COALESCE(cr.total_completed, 0) * 100.0) / COALESCE(te.total_races, 1),         2     ) AS race_completion_percentage FROM      completed_races cr FULL OUTER JOIN      total_entries te USING (driverid);	formula_1
SELECT      date_part('year', r.time) as race_year,     AVG(         CAST(SUBSTRING(r.time FROM 1 FOR 2) AS INTEGER)*3600 +         CAST(SUBSTRING(r.time FROM 4 FOR 2) AS INTEGER)*60 +         CAST(SUBSTRING(r.time FROM 7 FOR 2) AS INTEGER) +          (CAST(SUBSTRING(r.time FROM 10 FOR 3) AS DECIMAL)/1000)     ) as avg_time_seconds FROM races r JOIN results res ON r.raceid = res.raceid WHERE date_part('year', r.time) < 2000 AND res.statusid = 'FINISHED' GROUP BY race_year;	formula_1
SELECT d.forename, d.surname FROM drivers d INNER JOIN results r ON d.driverId = r.driverId WHERE YEAR(d.dob) > 1975 AND r.position = 2;	formula_1
SELECT COUNT(*)  FROM results INNER JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.nationality = 'Italian' AND results.time IS NULL;	formula_1
SELECT d.forename, d.surname FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE r.fastestLapTime IS NOT NULL ORDER BY r.fastestLapTime ASC LIMIT 1;	formula_1
WITH championshipStandings AS (     SELECT          res.driverId,         SUM(res.points) AS totalPoints     FROM results res     JOIN races r ON res.raceId = r.raceId     WHERE r.year = 2009     GROUP BY res.driverId ), championDriver AS (     SELECT driverId     FROM championshipStandings     ORDER BY totalPoints DESC     LIMIT 1 ) SELECT      res.fastestLap FROM results res JOIN races r ON res.raceId = r.raceId WHERE r.year = 2009 AND res.driverId = (SELECT driverId FROM championDriver) ORDER BY res.milliseconds ASC LIMIT 1;	formula_1
SELECT AVG(f.fastestLapSpeed) FROM results f JOIN races r ON f.raceId = r.raceId WHERE r.name = 'Spanish Grand Prix' AND YEAR(r.date) = 2009;	formula_1
SELECT r.name, r.year FROM races r JOIN (     SELECT raceId, MIN(milliseconds) as min_time     FROM results     WHERE milliseconds IS NOT NULL     GROUP BY raceId ) sub ON r.raceId = sub.raceId ORDER BY sub.min_time ASC LIMIT 1;	formula_1
SELECT      (COUNT(DISTINCT CASE WHEN d.dob < '1985-01-01' AND r.laps > 50 THEN d.driverId END) / COUNT(DISTINCT d.driverId)) * 100 AS percentage FROM results r JOIN races rc ON r.raceID = rc.raceID JOIN drivers d ON r.driverID = d.driverID WHERE YEAR(rc.date) BETWEEN 2000 AND 2015;	formula_1
SELECT COUNT(d.driverId) FROM laptimes AS lt JOIN drivers AS d ON lt.driverId = d.driverId WHERE d.nationality = 'French' AND lt.timems < 120;	formula_1
SELECT number FROM drivers WHERE nationality = 'America';	formula_1
SELECT raceId FROM races WHERE year = 2009;	formula_1
SELECT COUNT(DISTINCT driverId) AS numberOfDrivers  FROM results  WHERE raceId = 18;	formula_1
SELECT COUNT(*) FROM drivers  WHERE driverId IN (     SELECT TOP 3 driverId FROM drivers ORDER BY YEAR(dob) DESC ) AND nationality = 'NL';	formula_1
SELECT driverRef FROM drivers WHERE name = 'Robert Kubica';	formula_1
SELECT COUNT(*)  FROM drivers  WHERE Nationality = 'British' AND YEAR(dob) = 1980;	formula_1
SELECT      d.name,      MIN(r.fastestLapTime) AS earliest_lap_time FROM      drivers d INNER JOIN      results r ON d.driverId = r.driverId WHERE      d.nationality = 'German'     AND YEAR(d.dob) BETWEEN 1980 AND 1990 GROUP BY      d.driverId, d.name ORDER BY      earliest_lap_time ASC LIMIT 3;	formula_1
SELECT driverRef  FROM drivers  WHERE nationality = 'German'  AND dob = (SELECT MIN(dob) FROM drivers WHERE nationality = 'German');	formula_1
SELECT DISTINCT d.driverId, d.code FROM drivers d INNER JOIN results r ON d.driverId = r.driverId WHERE YEAR(d.dob) = 1971 AND r.fastestLapTime IS NOT NULL;	formula_1
WITH MaxLapTimes AS (     SELECT          d.driverId,         MAX(q.lap_time) as max_lap     FROM          drivers d     LEFT JOIN (         SELECT              driverId,             q1 AS lap_time         FROM              qualifying         UNION ALL         SELECT              driverId,             q2 AS lap_time         FROM              qualifying         UNION ALL         SELECT              driverId,             q3 AS lap_time         FROM              qualifying     ) q ON d.driverId = q.driverId     WHERE          d.nationality = 'Spanish'         AND EXTRACT(YEAR FROM d.birthdate) < 1982     GROUP BY          d.driverId ) SELECT      d.name,     mlt.max_lap FROM      MaxLapTimes mlt JOIN      drivers d ON mlt.driverId = d.driverId ORDER BY      mlt.max_lap DESC LIMIT 10;	formula_1
SELECT      strftime('%Y', r.date) FROM      results res JOIN      races r ON res.raceId = r.raceId WHERE      res.fastestLapTime IS NOT NULL ORDER BY      res.fastestLapTime ASC LIMIT 1;	formula_1
;	formula_1
SELECT driverId FROM (     SELECT driverId, MIN(time) AS min_time      FROM lap_times      WHERE lap = 1      GROUP BY driverId ) ORDER BY min_time ASC LIMIT 5;	formula_1
SELECT COUNT(*) FROM results WHERE raceId > 50 AND raceId < 100 AND statusId = 2 AND time IS NOT NULL;	formula_1
SELECT name AS CircuitName, location, lat, lng, COUNT(*) AS NumberOfRaces FROM circuits WHERE country = 'Austria' GROUP BY name, location, lat, lng;	formula_1
SELECT raceId, COUNT(time) AS num_finishers  FROM results  GROUP BY raceId  ORDER BY num_finishers DESC  LIMIT 1;	formula_1
SELECT d.driverRef, d.nationality, d.dob FROM qualifying q INNER JOIN drivers d ON q.driverId = d.driverId WHERE q.raceId = 23 AND q.q2 IS NOT NULL;	formula_1
SELECT      r.name AS RaceName,     YEAR(r.date) AS Year,     r.date AS Date,     r.time AS Time FROM races r JOIN qualifying q ON r.raceId = q.raceId WHERE q.driverId = (SELECT driverId FROM drivers ORDER BY dob DESC LIMIT 1) ORDER BY r.date ASC LIMIT 1;	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN status s ON r.statusId = s.statusId WHERE d.nationality = 'American' AND s.status = 'Puncture';	formula_1
SELECT c.name, c.website  FROM constructors c  JOIN constructorStandings cs ON c.constructorId = cs.constructorId  WHERE c.nationality = 'Italian'  ORDER BY cs.points DESC  LIMIT 1;	formula_1
SELECT c.website FROM (     SELECT constructor_id, COUNT(*) as win_count     FROM results     WHERE position = 1     GROUP BY constructor_id ) AS constructor_wins JOIN constructors c ON constructor_wins.constructor_id = c.constructor_id ORDER BY constructor_wins.win_count DESC LIMIT 1;	formula_1
SELECT d.driverName FROM lap_times lt JOIN races r ON lt.raceId = r.raceId AND r.name = 'French Grand Prix' JOIN drivers d ON lt.driverId = d.driverId WHERE lt.lap = 3 AND lt.time = (SELECT MAX(lt2.time)                 FROM lap_times lt2                WHERE lt2.raceId = (SELECT raceId FROM races WHERE name = 'French Grand Prix')                 AND lt2.lap = 3);	formula_1
SELECT raceId, MIN(time) AS fastest_time FROM lap_times WHERE lap = 1;	formula_1
SELECT AVG(fastestLapTime) AS average_fastest_lap_time FROM results JOIN races ON results.raceId = races.raceId WHERE races.year = 2006    AND races.name LIKE '%United States Grand Prix%'   AND results.rank < 11   AND fastestLapTime IS NOT NULL;	formula_1
SELECT d.forename, d.surname, AVG(p.duration) AS avg_duration FROM drivers d JOIN pit_stops p ON d.driverid = p.driverid WHERE d.nationality = 'German' AND YEAR(d.dob) BETWEEN 1981 AND 1984 GROUP BY d.forename, d.surname ORDER BY avg_duration ASC LIMIT 3;	formula_1
SELECT d.forename, d.surname, r.time  FROM races AS r JOIN results AS res ON r.raceId = res.raceId JOIN drivers AS d ON res.driverId = d.driverId WHERE r.name = 'Canadian Grand Prix' AND r.year = 2008 AND res.position = 1;	formula_1
SELECT T1.constructorRef AS "constructor reference name", T1.url AS website  FROM constructors AS T1  JOIN results AS T2 ON T1.constructorId = T2.constructorId  WHERE T2.raceId = 841 AND T2.position = 1;	formula_1
SELECT forename, surname, dob FROM drivers WHERE nationality = 'Austrian' AND YEAR(dob) BETWEEN 1981 AND 1991 ORDER BY surname;	formula_1
SELECT forename, surname, wikipedia, dob FROM drivers WHERE nationality = 'German' AND YEAR(dob) BETWEEN 1971 AND 1985 ORDER BY dob DESC	formula_1
SELECT location, country_name, lat, lng FROM circuits WHERE circuitName = 'Hungaroring'	formula_1
SELECT c.constructorName, c.nationality, SUM(r.points) as total_points FROM results r JOIN constructors c ON r.constructorId = c.constructorId GROUP BY c.constructorName, c.nationality ORDER BY total_points DESC LIMIT 1;	formula_1
SELECT AVG(r.points) AS average_score FROM results r INNER JOIN races rc ON r.raceId = rc.raceId INNER JOIN drivers d ON r.driverId = d.driverId WHERE rc.name = 'Turkish Grand Prix' AND d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT AVG(YearCount) AS AveragePerYear FROM (     SELECT DATEPART(year, date) AS Year, COUNT(*) AS YearCount     FROM races     WHERE date >= '2000-01-01' AND date <= '2010-12-31'     GROUP BY DATEPART(year, date) ) AS Subquery;	formula_1
SELECT nationality FROM drivers GROUP BY nationality ORDER BY COUNT(nationality) DESC LIMIT 1;	formula_1
WITH ranked_drivers AS (   SELECT      driverId,     SUM(points) as total_points,     RANK() OVER (ORDER BY SUM(points) DESC) as points_rank   FROM results   GROUP BY driverId ) SELECT COUNT(*) as number_of_wins FROM results res WHERE res.driverId IN (SELECT rd.driverId FROM ranked_drivers rd WHERE rd.points_rank = 91) AND res.position = 1;	formula_1
SELECT r.name AS race_name FROM (     SELECT raceId, MIN(fastestLapTime) as min_time     FROM results     GROUP BY raceId ) res JOIN races r ON res.raceId = r.id ORDER BY res.min_time ASC LIMIT 1;	formula_1
SELECT location || ' ' || country AS full_location  FROM races  WHERE date = (SELECT MAX(date) FROM races);	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE r.year = 2008 AND r.name = 'Marina Bay Street Circuit' AND q.q3 = (SELECT MIN(q3) FROM qualifying) LIMIT 1;	formula_1
SELECT    CONCAT(d.forename, ' ', d.surname) AS full_name,   d.nationality,   (SELECT r.name FROM results re    JOIN races r ON re.raceId = r.raceId    WHERE re.driverId = d.driverId    ORDER BY r.date ASC    LIMIT 1) AS first_race_name FROM drivers d WHERE d.dob = (SELECT MAX(dob) FROM drivers);	formula_1
SELECT MAX(accidents) AS max_accidents FROM (     SELECT r.driverId, COUNT(s.statusId) AS accidents     FROM results r     JOIN races ON r.raceId = races.raceId     WHERE races.name = 'Canadian Grand Prix' AND s.statusId = 3     GROUP BY r.driverId );	formula_1
SELECT      COUNT(r.position) AS Wins,     d.forename || ' ' || d.surname AS FullName FROM      drivers d JOIN      results r ON d.driverid = r.driverid WHERE      d.dob = (SELECT MIN(dob) FROM drivers)     AND r.position = 1;	formula_1
SELECT duration, milliseconds FROM pitstops WHERE duration = (SELECT MAX(duration) FROM pitstops);	formula_1
SELECT MIN(fastestLapTime) FROM results WHERE fastestLapTime IS NOT NULL	formula_1
To determine the longest time Lewis Hamilton spent at a pit stop, we need to find the maximum duration from his pit stops. Assuming `driverId=1` corresponds to Lewis Hamilton, the query is as follows:  SELECT MAX(duration) AS longest_pit_stop_time FROM pitstops WHERE driverId = 1;	formula_1
SELECT p.lap FROM pit_stops p INNER JOIN races r ON p.raceId = r.raceId WHERE r.year = 2011 AND r.name LIKE '%Australian Grand Prix%' AND p.driverId = 1;	formula_1
SELECT d.driverName, SUM(ps.duration) AS pitTime FROM pit_stops ps INNER JOIN races r ON ps.raceId = r.raceId INNER JOIN drivers d ON ps.driverId = d.driverId WHERE r.year = 2011 AND r.name = 'Australian Grand Prix' GROUP BY d.driverName	formula_1
SELECT MIN(fastestLapTime) AS lap_record  FROM results  INNER JOIN drivers ON results.driverId = drivers.driverId  WHERE drivers.name = 'Lewis Hamilton';	formula_1
WITH processed_times AS (     SELECT          r.driverId,         r.fastestLapTime,         (SUBSTR(r.fastestLapTime, 1, INSTR(r.fastestLapTime, ':') - 1) * 60 +          SUBSTR(r.fastestLapTime, INSTR(r.fastestLapTime, ':') + 1,                  INSTR(r.fastestLapTime, '.') - INSTR(r.fastestLapTime, ':') - 1) +          (SUBSTR(r.fastestLapTime, INSTR(r.fastestLapTime, '.') + 1) / 1000)) as time_seconds     FROM          results r     WHERE          r.fastestLapTime IS NOT NULL ), driver_min_times AS (     SELECT          driverId,         MIN(time_seconds) as min_time_seconds     FROM          processed_times     GROUP BY          driverId ) SELECT      d.driverId,      d.firstName,      d.lastName,      dma.min_time_seconds FROM      drivers d JOIN      driver_min_times dma ON d.driverId = dma.driverId ORDER BY      dma.min_time_seconds ASC LIMIT 20;	formula_1
SELECT r.position FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.driverName = 'Lewis Hamilton' AND r.fastestLap = 1;	formula_1
SELECT MIN(fastestLapTime) AS lapRecord  FROM results  WHERE raceId = 18;	formula_1
SELECT c.name AS circuitName, MIN(r.fastestLapTime) AS fastestLapRecord FROM results r JOIN races ra ON r.raceId = ra.raceId JOIN circuits c ON ra.circuitId = c.circuitId WHERE c.country = 'Italy' GROUP BY c.name ORDER BY fastestLapRecord ASC;	formula_1
WITH all_laps AS (     SELECT 'Qualifying' as session_type, q.raceId, q.driverId, q.lapTime     FROM qualifying q     WHERE q.raceId IN (SELECT raceId FROM races WHERE name LIKE '%Austrian Grand Prix%')          UNION ALL          SELECT 'Race' as session_type, r.raceId, r.driverId, r.fastestLapTime     FROM results r     WHERE r.raceId IN (SELECT raceId FROM races WHERE name LIKE '%Austrian Grand Prix%') ), min_lap AS (     SELECT MIN(l.lapTime) as min_time,            l.raceId,            ROW_NUMBER() OVER (ORDER BY l.lapTime ASC) as row_num     FROM all_laps l ) SELECT r.name AS race_name,        ml.min_time AS fastest_lap FROM min_lap ml JOIN races r ON ml.raceId = r.raceId WHERE ml.row_num = 1;	formula_1
SELECT      SUM(CAST(REGEXP_REPLACE(ps.Duration, '[^0-9.]', '') AS DECIMAL(10,2))) as total_pit_time FROM races r INNER JOIN results res ON r.RaceId = res.RaceId AND res.fastestLap = 1 INNER JOIN pit_stops ps ON res.DriverId = ps.DriverId AND ps.RaceId = r.RaceId WHERE r.Name = 'Austrian Grand Prix Circuit';	formula_1
SELECT c.lat, c.lng  FROM circuits c  INNER JOIN lap_records lr ON c.circuitId = lr.circuitId  WHERE lr.recordTime = '1:29.488';	formula_1
SELECT AVG(milliseconds) FROM pit_stops WHERE driverId = 1	formula_1
SELECT AVG(millisecond)  FROM lap_times  WHERE country = 'Italy';	formula_1
SELECT player_api_id FROM Player WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player);	european_football_2
SELECT MAX(height), name FROM Player	european_football_2
SELECT preferred_foot FROM Player WHERE potential = (SELECT MIN(potential) FROM Player) LIMIT 1	european_football_2
SELECT COUNT(*) FROM Player WHERE overall_rating >= 60 AND overall_rating <= 65 AND defensive_work_rate = 'low';	european_football_2
SELECT player_api_id FROM Player ORDER BY crossing DESC LIMIT 5;	european_football_2
SELECT L.name AS league_name FROM Match M JOIN League L ON M.league_id = L.league_id WHERE M.season = '2015/2016' GROUP BY L.name ORDER BY SUM(M.home_team_goal + M.away_team_goal) DESC LIMIT 1;	european_football_2
SELECT home_team_api_id, COUNT(*) as losses FROM MATCHES WHERE season = '2015/2016' AND home_team_goal < away_team_goal GROUP BY home_team_api_id ORDER BY losses ASC LIMIT 1;	european_football_2
SELECT player_name FROM Player ORDER BY penalties DESC LIMIT 10;	european_football_2
SELECT T.team_long_name FROM (     SELECT m.away_team_api_id, COUNT(*) as win_count      FROM Match m     JOIN League l ON m.league_id = l.league_id     WHERE l.name = 'Scotland Premier League'     AND m.season = '2009/2010'     AND m.away_team_goal > m.home_team_goal     GROUP BY m.away_team_api_id ) AS sub JOIN Team T ON sub.away_team_api_id = T.team_api_id ORDER BY win_count DESC LIMIT 1;	european_football_2
SELECT team_name, buildUpPlaySpeed FROM Team ORDER BY buildUpPlaySpeed DESC LIMIT 4	european_football_2
SELECT l.name FROM Match m JOIN League l ON m.league_id = l.league_id WHERE m.season = '2015/2016' GROUP BY l.name ORDER BY COUNT(CASE WHEN home_team_goal = away_team_goal THEN 1 END) DESC LIMIT 1;  Wait, no, that might not group correctly. The correct approach is to first aggregate the draws per league in a subquery and then order them.  Here's the corrected SQL:  SELECT l.name FROM (     SELECT m.league_id,            COUNT(CASE WHEN home_team_goal = away_team_goal THEN 1 ELSE NULL END) as draw_count     FROM Match m     WHERE m.season = '2015/2016'     GROUP BY m.league_id ) AS subquery JOIN League l ON subquery.league_id = l.league_id ORDER BY subquery.draw_count DESC LIMIT 1;	european_football_2
SELECT (DATE_FORMAT(FROM_UNIXTIME(NOW()), '%Y') - DATE_FORMAT(FROM_UNIXTIME(birthday), '%Y')) AS age FROM Player WHERE sprint_speed >= 97;	european_football_2
SELECT l.name, COUNT(m.league_id) as total_matches FROM League l JOIN Match m ON l.id = m.league_id GROUP BY l.id ORDER BY total_matches DESC LIMIT 1;	european_football_2
SELECT SUM(height) / COUNT(id) AS average_height FROM Player WHERE birthday >= '1990-01-01' AND birthday < '1996-01-01';	european_football_2
SELECT player_api_id FROM (     SELECT DISTINCT M.player_api_id, P.overall_rating      FROM Match M      JOIN Player P ON M.player_api_id = P.player_api_id      WHERE substr(M.date, 1, 4) = '2010' ) GROUP BY player_api_id ORDER BY MAX(overall_rating) DESC LIMIT 1;	european_football_2
SELECT team_fifa_api_id FROM Team WHERE buildUpPlaySpeed > 50 AND buildUpPlaySpeed < 60;	european_football_2
SELECT      t.team_name,     AVG(m.build_up_play_passing_accuracy) AS avg_build_up_accuracy FROM      Teams t LEFT JOIN      Matches m ON t.team_api_id = m.home_team_api_id OR t.team_api_id = m.away_team_api_id GROUP BY      t.team_name;	european_football_2
SELECT      (COUNT(CASE WHEN preferred_foot = 'left' THEN player_fifa_api_id END) * 100.0 / COUNT(player_fifa_api_id)) AS percentage_left_foot_players FROM Player WHERE YEAR(birthday) BETWEEN 1987 AND 1992;	european_football_2
SELECT L.name AS LeagueName, SUM(M.home_team_goal + M.away_team_goal) AS TotalGoals FROM Match M JOIN League L ON M.league_id = L.LeagueID GROUP BY L.name ORDER BY TotalGoals ASC LIMIT 5;	european_football_2
SELECT      SUM(E.long_shot) / COUNT(*) AS avg_long_shots FROM Player P JOIN Event E ON P.player_fifa_api_id = E.player_fifa_api_id WHERE P.player_name = 'Ahmed Samir Farag';	european_football_2
SELECT      p.player_name,     AVG(pp.heading_accuracy) AS avg_heading_accuracy FROM      Player p LEFT JOIN      Player_Performance pp ON p.player_api_id = pp.player_api_id WHERE      p.height > 180 GROUP BY      p.player_name, p.player_api_id ORDER BY      avg_heading_accuracy DESC LIMIT 10;	european_football_2
SELECT T2.team_long_name, AVG(T1.chanceCreationPassing) AS avg_passing FROM Team_Attributes AS T1 INNER JOIN Match AS T ON T.home_team_api_id = T1.team_api_id WHERE T.buildUpPlayDribblingClass = 'Normal' AND T.date >= '2014-01-01 00:00:00' AND T.date <= '2014-12-31 00:00:00' GROUP BY T2.team_long_name HAVING AVG(T1.chanceCreationPassing) < (SELECT AVG(chanceCreationPassing) FROM Team_Attributes WHERE buildUpPlayDribblingClass = 'Normal') ORDER BY avg_passing DESC;	european_football_2
SELECT T1.name FROM League AS T1 INNER JOIN Match AS T2 ON T1.id = T2.league_id WHERE T2.season = '2009/2010' GROUP BY T1.id HAVING AVG(T2.home_team_goal) > AVG(T2.away_team_goal);	european_football_2
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers';	european_football_2
SELECT player_api_id, firstname, lastname   FROM Player   WHERE substr(birthday,1,4) = '1970' AND substr(birthday,5,2) = '10';	european_football_2
SELECT      SUM(m.shoton) AS total_shots_on_target FROM      Player p JOIN      Match m ON p.player_api_id = m.home_player_1     OR p.player_api_id = m.home_player_2     OR p.player_api_id = m.home_player_3     OR p.player_api_id = m.home_player_4     OR p.player_api_id = m.home_player_5     OR p.player_api_id = m.home_player_6     OR p.player_api_id = m.home_player_7     OR p.player_api_id = m.home_player_8     OR p.player_api_id = m.home_player_9     OR p.player_api_id = m.home_player_10     OR p.player_api_id = m.home_player_11     OR p.player_api_id = m.away_player_1     OR p.player_api_id = m.away_player_2     OR p.player_api_id = m.away_player_3     OR p.player_api_id = m.away_player_4     OR p.player_api_id = m.away_player_5     OR p.player_api_id = m.away_player_6     OR p.player_api_id = m.away_player_7     OR p.player_api_id = m.away_player_8     OR p.player_api_id = m.away_player_9     OR p.player_api_id = m.away_player_10     OR p.player_api_id = m.away_player_11 WHERE      p.player_name = 'Franco Zennaro';	european_football_2
SELECT buildUpPlayPositioningClass  FROM Match  WHERE home_team_api_id = (SELECT team_api_id FROM Team WHERE team_long_name = 'ADO Den Haag')  OR away_team_api_id = (SELECT team_api_id FROM Team WHERE team_long_name = 'ADO Den Haag');	european_football_2
SELECT m.heading_accuracy  FROM Match m WHERE m.date = '2014-09-18 00:00:00' AND (     m.home_player_1 = (SELECT p.player_api_id FROM Player p WHERE p.player_name = 'Francois Affolter')     OR m.home_player_2 = (SELECT p.player_api_id FROM Player p WHERE p.player_name = 'Francois Affolter')     OR m.home_player_3 = (SELECT p.player_api_id FROM Player p WHERE p.player_name = 'Francois Affolter')     OR m.home_player_4 = (SELECT p.player_api_id FROM Player p WHERE p.player_name = 'Francois Affolter')     OR m.home_player_5 = (SELECT p.player_api_id FROM Player p WHERE p.player_name = 'Francois Affolter')     OR m.home_player_6 = (SELECT p.player_api_id FROM Player p WHERE p.player_name = 'Francois Affolter')     OR m.home_player_7 = (SELECT p.player_api_id FROM Player p WHERE p.player_name = 'Francois Affolter')     OR m.home_player_8 = (SELECT p.player_api_id FROM Player p WHERE p.player_name = 'Francois Affolter')     OR m.home_player_9 = (SELECT p.player_api_id FROM Player p WHERE p.player_name = 'Francois Affolter')     OR m.home_player_10 = (SELECT p.player_api_id FROM Player p WHERE p.player_name = 'Francois Affolter')     OR m.home_player_11 = (SELECT p.player_api_id FROM Player p WHERE p.player_name = 'Francois Affolter')     OR m.away_player_1 = (SELECT p.player_api_id FROM Player p WHERE p.player_name = 'Francois Affolter')     OR m.away_player_2 = (SELECT p.player_api_id FROM Player p WHERE p.player_name = 'Francois Affolter')     OR m.away_player_3 = (SELECT p.player_api_id FROM Player p WHERE p.player_name = 'Francois Affolter')     OR m.away_player_4 = (SELECT p.player_api_id FROM Player p WHERE p.player_name = 'Francois Affolter')     OR m.away_player_5 = (SELECT p.player_api_id FROM Player p WHERE p.player_name = 'Francois Affolter')     OR m.away_player_6 = (SELECT p.player_api_id FROM Player p WHERE p.player_name = 'Francois Affolter')     OR m.away_player_7 = (SELECT p.player_api_id FROM Player p WHERE p.player_name = 'Francois Affolter')     OR m.away_player_8 = (SELECT p.player_api_id FROM Player p WHERE p.player_name = 'Francois Affolter')     OR m.away_player_9 = (SELECT p.player_api_id FROM Player p WHERE p.player_name = 'Francois Affolter')     OR m.away_player_10 = (SELECT p.player_api_id FROM Player p WHERE p.player_name = 'Francois Affolter')     OR m.away_player_11 = (SELECT p.player_api_id FROM Player p WHERE p.player_name = 'Francois Affolter') );	european_football_2
SELECT AVG(rating) AS average_rating FROM (     SELECT          CASE             WHEN home_player_1 = (SELECT player_api_id FROM Player WHERE player_name = 'Gabriel Tamas') THEN home_player_rating_1             WHEN home_player_2 = (SELECT player_api_id FROM Player WHERE player_name = 'Gabriel Tamas') THEN home_player_rating_2             WHEN home_player_3 = (SELECT player_api_id FROM Player WHERE player_name = 'Gabriel Tamas') THEN home_player_rating_3              WHEN away_player_1 = (SELECT player_api_id FROM Player WHERE player_name = 'Gabriel Tamas') THEN away_player_rating_1             WHEN away_player_2 = (SELECT player_api_id FROM Player WHERE player_name = 'Gabriel Tamas') THEN away_player_rating_2           END AS rating     FROM Match     WHERE strftime('%Y', date) = '2011' ) AS subquery WHERE rating IS NOT NULL;	european_football_2
SELECT COUNT(*)  FROM Match  INNER JOIN League  ON Match.league_id = League.id  WHERE Match.season = '2015/2016' AND League.name = 'Scotland Premier League';	european_football_2
SELECT preferred_foot FROM Player WHERE birth_date = (SELECT MAX(birth_date) FROM Player)	european_football_2
SELECT * FROM Player WHERE potential = (SELECT MAX(potential) FROM Player);	european_football_2
SELECT COUNT(*) FROM Player WHERE weight < 130 AND preferred_foot = 'left';	european_football_2
SELECT team_short_name FROM Team WHERE chanceCreationPassingClass = 'Risky';	european_football_2
SELECT defensive_work_rate FROM Player WHERE player_name = 'David Wilson';	european_football_2
SELECT birthday FROM Player WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player);	european_football_2
SELECT L.name FROM League AS L JOIN Country AS C ON L.country_id = C.id WHERE C.name = 'Netherlands';	european_football_2
SELECT      AVG(M.home_team_goal) AS avg_home_goals FROM      Match M JOIN      Country C ON M.country_id = C.id WHERE      C.name = 'Poland' AND M.season = '2010/2011';	european_football_2
WITH max_min AS (   SELECT MAX(height) as max_h, MIN(height) as min_h FROM Player ), tallest_player AS (   SELECT player_name, finishing    FROM Player    WHERE height = (SELECT max_h FROM max_min)   LIMIT 1 ), shortest_player AS (   SELECT player_name, finishing    FROM Player    WHERE height = (SELECT min_h FROM max_min)   LIMIT 1  )  SELECT    tp.player_name AS tallest_name,   tp.finishing AS tallest_avg_finish,   sp.player_name AS shortest_name,   sp.finishing AS shortest_avg_finish,   CASE      WHEN tp.finishing > sp.finishing THEN 'Tallest'     WHEN tp.finishing < sp.finishing THEN 'Shortest'     ELSE 'Both have the same average finishing rate'   END AS who_has_higher_avg FROM tallest_player tp CROSS JOIN shortest_player sp;	european_football_2
SELECT player_name FROM Player WHERE height > 180;	european_football_2
SELECT COUNT(*) FROM Player WHERE strftime('%Y', birthday) > '1990';	european_football_2
SELECT COUNT(*) FROM Player WHERE first_name = 'Adam' AND weight > 170;	european_football_2
WITH matches_2008_2010 AS (     SELECT          home_player_1, home_player_2, ..., home_player_11,         away_player_1, away_player_2, ..., away_player_11     FROM Match     WHERE STRFTIME('%Y', date) BETWEEN '2008' AND '2010' ), players_08_10 AS (     SELECT DISTINCT player_api_id     FROM (         SELECT home_player_1 AS player_api_id FROM matches_2008_2010         UNION         SELECT home_player_2 AS player_api_id FROM matches_2008_2010             UNION         SELECT away_player_1 AS player_api_id FROM matches_2008_2010       ) AS all_players ) SELECT p.player_name FROM Player p WHERE p.overall_rating > 80 AND p.player_api_id IN (SELECT player_api_id FROM players_08_2010);	european_football_2
SELECT potential FROM Player WHERE name = 'Aaron Doran';	european_football_2
SELECT * FROM Player WHERE preferred_foot = 'left';	european_football_2
SELECT T.team_long_name  FROM Team AS T INNER JOIN BuildUpPlay AS BUP ON T.team_api_id = BUP.team_api_id WHERE BUP.buildUpPlaySpeedClass = 'Fast';	european_football_2
SELECT buildUpPlayPassingClass FROM Team_Attributes INNER JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE Team.team_short_name = 'CLB'	european_football_2
SELECT team_short_name FROM Team WHERE buildUpPlayPassing > 70;	european_football_2
WITH PlayersInPeriod AS (     SELECT DISTINCT m.home_player_1 AS player_id     FROM Match m     WHERE strftime('%Y', m.date) BETWEEN '2010' AND '2015'     UNION     SELECT m.home_player_2 AS player_id FROM Match m WHERE strftime('%Y', m.date) BETWEEN '2010' AND '2015'    ) SELECT AVG(p.overall_rating) AS avg_rating FROM Player p WHERE p.height > 170 AND p.player_api_id IN (SELECT player_id FROM PlayersInPeriod);	european_football_2
SELECT * FROM Player WHERE height = (SELECT MIN(height) FROM Player);	european_football_2
SELECT c.name  FROM Country c  INNER JOIN League l  ON c.id = l.country_id  WHERE l.name = 'Italy Serie A';	european_football_2
SELECT team_short_name FROM Team WHERE buildUpPlaySpeed = 31 AND buildUpPlayDribbling = 53 AND buildUpPlayPassing = 32	european_football_2
SELECT AVG(overall_rating) FROM Player WHERE player_name = 'Aaron Doran';	european_football_2
SELECT COUNT(*)  FROM Match JOIN League ON Match.league_id = League.id WHERE League.name = 'Germany 1. Bundesliga'    AND strftime('%Y-%m', date) BETWEEN '2008-08' AND '2008-10';	european_football_2
SELECT DISTINCT T.team_short_name FROM Team T INNER JOIN Match M ON T.team_api_id = M.home_team_api_id WHERE M.home_team_goal = 10;	european_football_2
SELECT player_name, balance  FROM Player WHERE potential = 61 AND balance = (SELECT MAX(balance) FROM Player WHERE potential = 61);	european_football_2
SELECT    (SELECT AVG(ball_control) FROM Player WHERE player_name = 'Abdou Diallo') -    (SELECT AVG(ball_control) FROM Player WHERE player_name = 'Aaron Appindangoye')	european_football_2
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN';	european_football_2
SELECT player_name, birthday FROM Player WHERE player_name = 'Aaron Lennon' OR player_name = 'Abdelaziz Barrada' ORDER BY birthday ASC;	european_football_2
SELECT * FROM Player WHERE height = (SELECT MAX(height) FROM Player);	european_football_2
SELECT COUNT(*) FROM Player WHERE preferred_foot = 'left' AND attacking_work_rate = 'low';	european_football_2
SELECT C.name  FROM Country C INNER JOIN League L ON C.id = L.country_id WHERE L.name = 'Belgium Jupiler League';	european_football_2
SELECT l.*  FROM League l JOIN Country c ON l.country_id = c.id WHERE c.name = 'Germany';	european_football_2
SELECT player_name, overall_rating FROM Player ORDER BY overall_rating DESC LIMIT 1;	european_football_2
SELECT COUNT(DISTINCT player_api_id)  FROM Player  WHERE strftime('%Y', birthday) < '1986'  AND defensive_work_rate = 'high';	european_football_2
SELECT player_name, crossing FROM Player WHERE player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone') ORDER BY crossing DESC;	european_football_2
SELECT heading_accuracy FROM Player WHERE player_name = 'Ariel Borysiuk'	european_football_2
SELECT COUNT(*) FROM Player WHERE height > 180 AND volleys > 70	european_football_2
SELECT player_name FROM Player WHERE volleys > 70 AND dribbling > 70;	european_football_2
SELECT COUNT(*)  FROM Match m INNER JOIN Country c ON m.country_id = c.country_id WHERE m.season = '2008/2009' AND c.name = 'Belgium';	european_football_2
SELECT long_passing FROM Player_Attributes WHERE player_api_id = ( SELECT player_api_id FROM Player ORDER BY birthday ASC LIMIT 1 )	european_football_2
SELECT COUNT(*)  FROM Match  INNER JOIN League  ON Match.league_id = League.league_id  WHERE League.name = 'Belgium Jupiler League'  AND SUBSTR(`date`, 1, 7) = '2009-04';	european_football_2
SELECT L.name  FROM League AS L  JOIN Match AS M ON L.id = M.league_id  WHERE M.season = '2008/2009'  GROUP BY L.name  ORDER BY COUNT(M.id) DESC  LIMIT 1;	european_football_2
SELECT AVG(overall_rating) FROM Player WHERE strftime('%Y', birthday) < '1986';	european_football_2
SELECT      (((         (SELECT overall_rating FROM Player WHERE player_name = 'Ariel Borysiuk') -          (SELECT overall_rating FROM Player WHERE player_name = 'Paulin Puel')     ) /      (SELECT overall_rating FROM Player WHERE player_name = 'Paulin Puel')) * 100) AS Percentage_Higher;	european_football_2
SELECT AVG(tm.buildUpPlaySpeed) AS average_build_up_speed FROM Team t JOIN Team_Metrics tm ON t.team_api_id = tm.team_api_id WHERE t.team_long_name = 'Heart of Midlothian';	european_football_2
SELECT AVG(overall_rating) AS average_rating FROM Player WHERE player_name = 'Pietro Marino';	european_football_2
SELECT SUM(T2.crossing) FROM Player AS T1 INNER JOIN T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Aaron Lennox'	european_football_2
SELECT chanceCreationPassing, chanceCreationPassingClass  FROM TeamStats WHERE team_long_name = 'Ajax' ORDER BY chanceCreationPassing DESC LIMIT 1;	european_football_2
SELECT preferred_foot FROM Player WHERE player_name = 'Abdou Diallo';	european_football_2
SELECT MAX(T2.overall_rating) AS highest_rating FROM Player AS T2 WHERE T2.player_name = 'Dorlan Pabon';	european_football_2
SELECT AVG(M.away_team_goal) AS average_goals FROM Match M JOIN Team T ON M.away_team_api_id = T.team_api_id WHERE T.team_long_name = 'Parma' AND M.country_id = (SELECT C.id FROM Country C WHERE C.name = 'Italy');	european_football_2
SELECT p.player_name FROM Player AS p  JOIN Player_Attributes AS pa ON p.player_api_id = pa.player_api_id  WHERE pa.overall_rating = 77 AND pa.date LIKE '2016-06-23%'  ORDER BY CAST(SUBSTR(p.birthday, 1, 4) AS INT) ASC  LIMIT 1;	european_football_2
SELECT p.player_name , ps.overall_rating FROM Player AS p INNER JOIN Player_Stats AS ps ON p.player_api_id = ps.player_api_id WHERE p.player_name = 'Aaron Mooy' AND ps.date LIKE '2016-02-04%';	european_football_2
SELECT pa.potential  FROM Player  JOIN Player_Attributes pa ON Player.player_api_id = pa.player_api_id  WHERE Player.player_name = 'Francesco Parravicini'  AND pa.date = '2010-08-30 00:00:00';	european_football_2
SELECT ps.attacking_work_rate FROM Player_Statistics ps WHERE ps.player_name = 'Francesco Migliore' AND ps.date = '2015-05-01';	european_football_2
SELECT pm.defensive_work_rate  FROM Player p JOIN Player_Match pm ON p.player_api_id = pm.player_api_id WHERE p.player_name = 'Kevin Berigaud' AND pm.match_date = '2013-02-22';	european_football_2
SELECT m.date AS "Date of Highest Crossing" FROM Player p JOIN Match m ON p.player_api_id = m.player_api_id WHERE p.player_name = 'Kevin Constant' AND m.cross = (SELECT MAX(cross)                FROM Match                WHERE player_api_id = (SELECT player_api_id                                       FROM Player                                       WHERE player_name = 'Kevin Constant'));	european_football_2
SELECT t3.build_up_play_speed_class  FROM Match m INNER JOIN Team t1 ON m.home_team_api_id = t1.team_api_id OR m.away_team_api_id = t1.team_api_id INNER JOIN Team_Attributes t3 ON t1.team_fifa_api_id = t3.team_fifa_api_id AND m.date = t3.date WHERE t1.team_long_name = 'Willem II' AND m.date = '2012-02-22';	european_football_2
SELECT      m.match_id,     t.team_short_name AS team_name,     CASE         WHEN m.home_team_api_id = t.team_api_id THEN m.home_build_up_play_dribbling_class         ELSE m.away_build_up_play_dribbling_class     END AS build_up_stat FROM Team t LEFT JOIN Match m ON      (t.team_api_id = m.home_team_api_id OR t.team_api_id = m.away_team_api_id) WHERE t.team_short_name = 'LEI' AND m.date = '2015-09-10';	european_football_2
SELECT ta.build_up_play_passing_class  FROM Team_Attributes ta JOIN Team t ON ta.team_api_id = t.team_api_id WHERE t.team_long_name = 'FC Lorient'   AND ta.date LIKE '2010-02-22%';	european_football_2
SELECT T1.chance_creation_passing_class FROM Match AS T1 INNER JOIN Team AS T2 ON T1.home_team_api_id = T2.team_api_id OR T1.away_team_api_id = T2.team_api_id WHERE T2.team_long_name = 'PEC Zwolle' AND T1.date = '2013-09-20 00:00:00';	european_football_2
SELECT M.chance_creation_crossing_class  FROM Match AS M  LEFT JOIN Team AS T ON M.home_team_api_id = T.team_api_id OR M.away_team_api_id = T.team_api_id  WHERE T.team_long_name = 'Hull City' AND M.date = '2010-02-22 00:00:00';	european_football_2
SELECT ts.defence_aggression_class FROM Team_Stats ts JOIN Match m ON ts.match_id = m.id WHERE m.date LIKE '2015-09-10%'   AND ts.team_api_id = (SELECT t.team_api_id FROM Team t WHERE t.team_long_name = 'Hannover 96');	european_football_2
SELECT AVG(T2.overall_rating) AS average_rating FROM Player AS T1 JOIN (   SELECT player_api_id, overall_rating, date   FROM Match   WHERE date BETWEEN '2007-02-22' AND '2016-04-21' ) AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Marko Arnautovic';	european_football_2
SELECT      ((Landon_Rating - Jordan_Rating) / Landon_Rating) * 100 AS Percentage_Higher FROM      (         SELECT overall_rating AS Landon_Rating         FROM Player         WHERE player_name = 'Landon Donovan' AND date = '2013-07-12'     ) LD,     (         SELECT overall_rating AS Jordan_Rating         FROM Player         WHERE player_name = 'Jordan Bowery' AND date = '2013-07-12'     ) JB;	european_football_2
SELECT name FROM Player WHERE height = (SELECT MAX(height) FROM Player);	european_football_2
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10	european_football_2
SELECT name FROM Player WHERE (strftime('%Y', CURRENT_TIMESTAMP) - strftime('%Y', birthday)) > 34	european_football_2
SELECT SUM(M.home_team_goal) AS total_goals FROM Match M WHERE M.home_player_1 = (SELECT P.player_api_id FROM Player P WHERE P.player_name = 'Aaron Lennon')    OR M.home_player_2 = (SELECT P.player_api_id FROM Player P WHERE P.player_name = 'Aaron Lennon')    OR M.home_player_3 = (SELECT P.player_api_id FROM Player P WHERE P.player_name = 'Aaron Lennon')    OR M.home_player_4 = (SELECT P.player_api_id FROM Player P WHERE P.player_name = 'Aaron Lennon')    OR M.home_player_5 = (SELECT P.player_api_id FROM Player P WHERE P.player_name = 'Aaron Lennon')    OR M.home_player_6 = (SELECT P.player_api_id FROM Player P WHERE P.player_name = 'Aaron Lennon')    OR M.home_player_7 = (SELECT P.player_api_id FROM Player P WHERE P.player_name = 'Aaron Lennon')    OR M.home_player_8 = (SELECT P.player_api_id FROM Player P WHERE P.player_name = 'Aaron Lennon')    OR M.home_player_9 = (SELECT P.player_api_id FROM Player P WHERE P.player_name = 'Aaron Lennon')    OR M.home_player_10 = (SELECT P.player_api_id FROM Player P WHERE P.player_name = 'Aaron Lennon')    OR M.home_player_11 = (SELECT P.player_api_id FROM Player P WHERE P.player_name = 'Aaron Lennon');	european_football_2
SELECT      SUM(M.awayteam_goal) AS total_goals FROM      Match M WHERE      (M.away_player_1 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR      M.away_player_2 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR      M.away_player_3 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR      M.away_player_4 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR      M.away_player_5 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR      M.away_player_6 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR      M.away_player_7 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR      M.away_player_8 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR      M.away_player_9 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR      M.away_player_10 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR      M.away_player_11 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith'))     OR      (M.away_player_1 = (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira') OR      M.away_player_2 = (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira') OR      M.away_player_3 = (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira') OR      M.away_player_4 = (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira') OR      M.away_player_5 = (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira') OR      M.away_player_6 = (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira') OR      M.away_player_7 = (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira') OR      M.away_player_8 = (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira') OR      M.away_player_9 = (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira') OR      M.away_player_10 = (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira') OR      M.away_player_11 = (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira'));	european_football_2
WITH MatchDetails AS (     SELECT m.id,            SUBSTR(m.goal, 0, INSTR(m.goal, '-') - 1) AS home_goals_str,            SUBSTR(m.goal, INSTR(m.goal, '-') + 1) AS away_goals_str     FROM Match m ), ParsedAges AS (     SELECT m.id,            CAST(md.home_goals_str AS INTEGER) AS home_goals,            CASE WHEN EXISTS (                SELECT 1                FROM Player p                WHERE p.player_api_id IN (m.home_player_1, m.home_player_2, m.home_player_3,                                          m.home_player_4, m.home_player_5, m.home_player_6,                                          m.home_player_7, m.home_player_8, m.home_player_9,                                          m.home_player_10, m.home_player_11)                AND (DATE('now') - p.birth_date) / 365 <= 30            ) THEN 1 ELSE 0 END AS has_young_player     FROM Match m     INNER JOIN MatchDetails md ON m.id = md.id ) SELECT SUM(pa.home_goals) AS total_home_goals FROM ParsedAges pa WHERE pa.has_young_player = 1;	european_football_2
SELECT player_name FROM Player WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player);	european_football_2
SELECT player_name FROM Player WHERE potential = (SELECT MAX(potential) FROM Player);	european_football_2
SELECT player_name FROM Player WHERE attacking_work_rate = 'high';	european_football_2
SELECT firstname, lastname FROM Player WHERE finishing = 1 ORDER BY datetime(CURRENT_TIMESTAMP,'localtime') - birthday DESC LIMIT 1;	european_football_2
SELECT player_name FROM Player INNER JOIN Country ON Player.country_id = Country.id WHERE Country.name = 'Belgium'	european_football_2
SELECT player_name, country FROM Player WHERE vision >= 90	european_football_2
SELECT nationality, AVG(weight) as avg_weight FROM Player GROUP BY nationality ORDER BY avg_weight DESC LIMIT 1;	european_football_2
SELECT team_long_name FROM Team WHERE buildUpPlaySpeedClass = 'Slow';	european_football_2
SELECT t.team_short_name FROM Team AS t INNER JOIN TeamAttributes AS ta ON t.team_api_id = ta.team_api_id WHERE ta.chanceCreationPassingClass = 'Safe'	european_football_2
SELECT AVG(height) as avg_height FROM Player WHERE nationality = 'Italy';	european_football_2
SELECT player_name FROM Player WHERE height > 180 ORDER BY player_name ASC LIMIT 3;	european_football_2
SELECT COUNT(*) FROM Player WHERE firstname LIKE 'Aaron%' AND birthday > '1990'	european_football_2
SELECT ( (SELECT jumping FROM Player WHERE id = 23) - (SELECT jumping FROM Player WHERE id = 6) ) AS difference;	european_football_2
SELECT player_api_id, potential FROM Player WHERE preferred_foot = 'right' ORDER BY potential ASC LIMIT 5;	european_football_2
SELECT COUNT(*) FROM Player WHERE crossing = (SELECT MAX(crossing) FROM Player) AND preferred_foot = 'left';	european_football_2
SELECT (CAST((SELECT COUNT(*) FROM Player WHERE strength > 80 AND stamina > 80) AS REAL) / (SELECT COUNT(*) FROM Player)) * 100;	european_football_2
SELECT c.name  FROM League l JOIN Country c ON l.country_id = c.id WHERE l.name = 'Poland Ekstraklasa';	european_football_2
SELECT home_team_goal, away_team_goal FROM Match WHERE date LIKE '2008-09-24%' AND league_id = (SELECT id FROM League WHERE name = 'Belgium Jupiler League');	european_football_2
SELECT sprint_speed, agility, acceleration FROM Player WHERE player_name = 'Alexis Blin';	european_football_2
SELECT buildUpPlaySpeedClass FROM Team WHERE team_long_name = 'KSV Cercle Brugge'	european_football_2
SELECT COUNT(*)  FROM Match  JOIN League ON Match.league_id = League.id  WHERE Match.season = '2015/2016' AND League.name = 'Serie A';	european_football_2
SELECT MAX(M.home_team_goal) AS Highest_Score FROM Match M INNER JOIN League L ON M.league_id = L.league_id INNER JOIN Country C ON L.country_id = C.country_id WHERE C.country_name = 'Netherlands' AND L.league_name = 'Eredivisie';	european_football_2
SELECT finishing, curve FROM Player WHERE weight = (SELECT MAX(weight) FROM Player);	european_football_2
SELECT L.name, COUNT(M.id) AS num_games FROM Match M JOIN League L ON M.league_id = L.id WHERE M.season = '2015/2016' GROUP BY L.name ORDER BY num_games DESC LIMIT 4;	european_football_2
SELECT T.team_long_name AS away_team_name FROM (     SELECT away_team_api_id, SUM(away_team_goal) AS total_away_goals     FROM Match     GROUP BY away_team_api_id ) AS M JOIN Team T ON M.away_team_api_id = T.team_api_id ORDER BY M.total_away_goals DESC LIMIT 1;	european_football_2
SELECT player_name FROM Player WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player)	european_football_2
SELECT (COUNT(CASE WHEN height < 180 AND overall_rating > 70 THEN player_api_id END) / COUNT(player_api_id)) * 100 FROM Player	european_football_2
SELECT      CAST(COUNT(CASE WHEN Admission = '+' THEN ID END) AS REAL) / COUNT(*) * 100 AS PercentMaleInpatients FROM Patient WHERE SEX = 'M';	thrombosis_prediction
SELECT      (CAST(COUNT(CASE WHEN strftime('%Y', Birthday) > '1930' THEN ID END) AS REAL) / COUNT(ID)) * 100 FROM Patient WHERE SEX = 'F';	thrombosis_prediction
SELECT      (CAST(COUNT(CASE WHEN Admission = '+' THEN ID ELSE NULL END) AS REAL) / COUNT(ID)) * 100 FROM Patient WHERE Birthday LIKE '193%' OR Birthday LIKE '1940%'	thrombosis_prediction
SELECT      (SELECT COUNT(ID) FROM Patient WHERE Diagnosis = 'SLE' AND Admission = '-') /      (SELECT COUNT(ID) FROM Patient WHERE Diagnosis = 'SLE' AND Admission = '+') AS Ratio;	thrombosis_prediction
SELECT Diagnosis FROM Patient WHERE ID = 30609; SELECT Date FROM Laboratory WHERE ID = 30609;	thrombosis_prediction
SELECT P.SEX, P.Birthday, E.`Examination Date`, E.Symptoms FROM Patient P INNER JOIN Examination E ON P.ID = E.ID WHERE P.ID = '163109'	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday FROM Patient P INNER JOIN Laboratory L ON P.ID = L.ID WHERE L.LDH > 500;	thrombosis_prediction
SELECT P.ID, (year(current_timestamp) - year(P.Birthday)) AS Age FROM Patient P INNER JOIN Examination E ON P.ID = E.ID WHERE E.RVVT = '+';	thrombosis_prediction
SELECT P.ID, P.SEX, P.Diagnosis FROM Patient P INNER JOIN Examination E ON P.ID = E.ID WHERE E.Thrombosis = 2;	thrombosis_prediction
SELECT * FROM Patient WHERE STRFTIME('%Y', Birthday) = '1937' AND EXISTS (     SELECT 1     FROM Laboratory     WHERE Patient.ID = Laboratory.ID     AND `T-CHO` >= 250 )	thrombosis_prediction
SELECT P.ID, P.SEX, P.Diagnosis  FROM Patient P  INNER JOIN Laboratory L  ON P.ID = L.ID  WHERE L.ALB < 3.5;	thrombosis_prediction
SELECT      (COUNT(DISTINCT CASE          WHEN L.TP < 6 OR L.TP > 8.5 THEN P.ID          ELSE NULL END) /       COUNT(P.ID)) * 100 AS abnormal_percentage FROM Patient P LEFT JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'F';	thrombosis_prediction
SELECT AVG(E.`aCL IgG`) AS average_aCL_IgG FROM Patient P INNER JOIN Examination E ON P.ID = E.ID WHERE P.Admission = '+' AND (YEAR(CURRENT_TIMESTAMP) - YEAR(P.Birthday)) >= 50;	thrombosis_prediction
SELECT COUNT(ID) FROM Patient WHERE SEX = 'F' AND YEAR(Description) = 1997 AND Admission = '-';	thrombosis_prediction
SELECT MIN(YEAR(`First Date`) - YEAR(`Birthday`)) AS Age FROM Patient WHERE `First Date` IS NOT NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID)  FROM Examination E INNER JOIN Patient P ON E.ID = P.ID WHERE E.Thrombosis = 1 AND P.SEX = 'F' AND strftime('%Y', `Examination Date`) = '1997';	thrombosis_prediction
SELECT MAX(YEAR(Birthday)) - MIN(YEAR(Birthday)) AS AgeGap FROM Patient WHERE ID IN (   SELECT DISTINCT ID    FROM Laboratory    WHERE TG >= 200 )	thrombosis_prediction
SELECT E.Symptoms, E.Diagnosis  FROM Examination E  WHERE E.ID IN (     SELECT P.ID      FROM Patient P      WHERE P.Birthday = (SELECT MAX(Birthday) FROM Patient) ) AND E.Symptoms IS NOT NULL;	thrombosis_prediction
WITH Months AS (     SELECT '1998-01' AS Month     UNION SELECT '1998-02'     UNION SELECT '1998-03'     UNION SELECT '1998-04'     UNION SELECT '1998-05'     UNION SELECT '1998-06'     UNION SELECT '1998-07'     UNION SELECT '1998-08'     UNION SELECT '1998-09'     UNION SELECT '1998-10'     UNION SELECT '1998-11'     UNION SELECT '1998-12' ), MonthlyCounts AS (     SELECT          STRFTIME('%Y-%m', l.Date) AS Month,         COUNT(DISTINCT p.PatientID) AS PatientCount     FROM          Patient p     JOIN          Laboratory l ON p.PatientID = l.PatientID     WHERE          p.Gender = 'Male'         AND l.Date >= '1998-01-01'         AND l.Date <= '1998-12-31'     GROUP BY          STRFTIME('%Y-%m', l.Date) )  SELECT      AVG(COALESCE(mc.PatientCount, 0)) AS AverageMonthlyPatients FROM      Months m LEFT JOIN      MonthlyCounts mc ON m.Month = mc.Month;	thrombosis_prediction
WITH RankedPatients AS (   SELECT      ID,     `First Date`,     Birthday,     ROW_NUMBER() OVER (ORDER BY Birthday ASC) as RowNum   FROM Patient   WHERE Diagnosis = 'SJS' ), LabDates AS (   SELECT      ID,      MAX(Date) AS LatestDate   FROM Laboratory   GROUP BY ID ) SELECT    LD.LatestDate,   strftime('%Y', RP.`First Date`) - strftime('%Y', RP.Birthday) as AgeUponArrival FROM RankedPatients RP LEFT JOIN LabDates LD ON RP.ID = LD.ID WHERE RowNum = 1;	thrombosis_prediction
SELECT    (SELECT COUNT(DISTINCT P.ID)     FROM Patient P     INNER JOIN Laboratory L ON P.ID = L.ID     WHERE P.SEX = 'M' AND L.UA <= 8) AS MaleCount,      (SELECT COUNT(DISTINCT P.ID)     FROM Patient P     INNER JOIN Laboratory L ON P.ID = L.ID     WHERE P.SEX = 'F' AND L.UA <= 6.5) AS FemaleCount,    (MaleCount * 1.0 / FemaleCount) AS Ratio FROM dual;	thrombosis_prediction
SELECT COUNT(P.ID) FROM Patient P LEFT JOIN (     SELECT ID, MIN(`Examination Date`) AS FirstExamDate     FROM Examination     GROUP BY ID ) E ON P.ID = E.ID WHERE E.FirstExamDate IS NULL  OR YEAR(E.FirstExamDate) - YEAR(P.`First Date`) >= 1;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P INNER JOIN Examination E ON P.ID = E.ID WHERE STRFTIME('%Y', `Examination Date`) BETWEEN '1990' AND '1993' AND (STRFTIME('%Y', `Examination Date`) - STRFTIME('%Y', Birthday)) < 18	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'M' AND ID IN ( SELECT ID FROM Laboratory WHERE `T-BIL` >= 2.0 )	thrombosis_prediction
SELECT Diagnosis FROM Examination WHERE `Examination Date` BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY Diagnosis ORDER BY COUNT(*) DESC LIMIT 1;	thrombosis_prediction
SELECT AVG(1999 - YEAR(P.Birthday)) AS AverageAge FROM Patient P WHERE P.ID IN (     SELECT L.ID      FROM Laboratory L     WHERE L.Date BETWEEN '1991-10-01' AND '1991-10-31' ) AND P.Birthday IS NOT NULL;	thrombosis_prediction
SELECT TOP 1      (YEAR(E.ExaminationDate) - YEAR(P.Birthday)) AS Age,     E.Diagnosis FROM      Patient P JOIN      Examination E ON P.ID = E.PatientID JOIN      Laboratory L ON E.PatientID = L.PatientID AND E.ExaminationDate = L.Date ORDER BY      L.HGB DESC;	thrombosis_prediction
SELECT `ANA` FROM `Examination` WHERE `ID` = 3605340 AND `Examination Date` = '1996-12-02';	thrombosis_prediction
SELECT `T-CHO` FROM `Laboratory` WHERE `ID` = '2927464' AND `Date` = '1995-09-04';	thrombosis_prediction
SELECT SEX  FROM Patient  WHERE Diagnosis = 'AORTITIS' ORDER BY `First Date` ASC  LIMIT 1;	thrombosis_prediction
SELECT `aCL IgM` FROM Examination WHERE ID = (SELECT ID FROM Patient WHERE Diagnosis = 'SLE' AND Description = '1994-02-19') AND `Examination Date` = '1993-11-12';	thrombosis_prediction
SELECT P.SEX  FROM Laboratory L  INNER JOIN Patient P ON L.ID = P.ID  WHERE L.Date = '1992-06-12' AND L.GPT = 9;	thrombosis_prediction
SELECT YEAR(`Date`) - YEAR(T2.`Birthday`) AS Age  FROM `Laboratory` AS T1  JOIN `Patient` AS T2  ON T1.ID = T2.ID  WHERE T1.UA = '8.4' AND T1.Date = '1991-10-21';	thrombosis_prediction
SELECT COUNT(L.ID) AS Number_of_Tests_1995 FROM Patient P INNER JOIN Laboratory L ON P.ID = L.ID WHERE P.`First Date` = '1991-06-13' AND P.Diagnosis = 'SJS' AND L.Date BETWEEN '1995-01-01' AND '1995-12-31';	thrombosis_prediction
SELECT p.Diagnosis FROM Patient p WHERE p.ID IN (     SELECT e.PatientID     FROM Examination e     WHERE e.Diagnosis = 'SLE' AND e.ExaminationDate = '1997-01-27' );	thrombosis_prediction
To find the symptoms for the patient born on 1959/3/1 during their examination on 1993/9/27.  SELECT E.Symptoms FROM Examination E INNER JOIN Patient P ON E.ID = P.ID WHERE P.Birthday = '1959-03-01' AND E.`Examination Date` = '1993-09-27'	thrombosis_prediction
SELECT      SUM(CASE WHEN Date LIKE '1981-11-%' THEN T_CHo ELSE 0 END) -      SUM(CASE WHEN Date LIKE '1981-12-%' THEN T_CHo ELSE 0 END) AS DecreaseRate FROM Laboratory WHERE ID = (SELECT ID FROM Patient WHERE Birthday = '1959-02-18');	thrombosis_prediction
SELECT P.ID, P.Description FROM Patient P WHERE P.Diagnosis = 'Behcet' AND YEAR(P.Description) = 1997;	thrombosis_prediction
SELECT DISTINCT ID  FROM Laboratory  WHERE Date BETWEEN '1987-07-06' AND '1996-01-31' AND GPT > 30  AND ALB < 4;	thrombosis_prediction
SELECT ID FROM Patient WHERE SEX = 'F' AND strftime('%Y', Birthday) = '1964' AND Admission = '+';	thrombosis_prediction
SELECT COUNT(*) FROM Examination  WHERE Thrombosis = 2 AND `ANA Pattern` = 'S' AND `aCL IgM` >= (SELECT AVG(`aCL IgM`) * 1.2 FROM Examination);	thrombosis_prediction
WITH     NormalProteinuria AS (         SELECT DISTINCT PatientID FROM Laboratory WHERE U_PRO > 0 AND U_PRO < 30     ),     LowUA AS (         SELECT DISTINCT PatientID FROM Laboratory WHERE UA <= 6.5     ) SELECT      COUNT(DISTINCT L.PatientID) * 100.0 /  (SELECT COUNT(*) FROM NormalProteinuria) AS PercentageLowUA FROM LowUA L LEFT JOIN NormalProteinuria N ON L.PatientID = N.PatientID;	thrombosis_prediction
SELECT ROUND((CASE WHEN Diagnosis = 'BEHCET' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS Percentage FROM Patient WHERE SEX = 'M' AND STRFTIME('%Y', `First Date`) = '1981'	thrombosis_prediction
SELECT DISTINCT P.ID FROM Patient P INNER JOIN Laboratory L ON P.ID = L.ID WHERE P.Admission = '-' AND L.Date LIKE '1991-10%' AND L.T_BIL < 2.0	thrombosis_prediction
SELECT COUNT(*)  FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Patient.SEX = 'F'  AND (Examination.`ANA Pattern` != 'P' OR Examination.`ANA Pattern` IS NULL) AND strftime('%Y', Patient.Birthday) BETWEEN 1980 AND 1989;	thrombosis_prediction
SELECT SEX FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Diagnosis = 'PSS' AND CRP > 2 AND CRE = 1 AND LDH = 123	thrombosis_prediction
SELECT AVG(L.ALB) FROM Patient P INNER JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'F' AND P.Diagnosis = 'SLE' AND L.PLT > 400;	thrombosis_prediction
WITH SLE_Patients AS (   SELECT E.Symptoms   FROM Examination E   JOIN Patient P ON E.ID = P.ID   WHERE P.Diagnosis = 'SLE' ) SELECT Symptom, COUNT(*) as Frequency FROM (   SELECT split_part(Symptoms, ',', n) as Symptom   FROM SLE_Patients   CROSS JOIN generate_series(1, (length(Symptoms) - length(replace(Symptoms, ',', '')) + 1)) as n ) AS expanded GROUP BY Symptom ORDER BY Frequency DESC LIMIT 1;	thrombosis_prediction
SELECT `Description`, `Diagnosis` FROM `Patient` WHERE `ID` = 48473	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND Diagnosis = 'APS';	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE YEAR(Date) = '1997' AND (TP <= 6 OR TP >= 8.5);	thrombosis_prediction
WITH ITP_Patients AS (     SELECT DISTINCT E.PatientID AS ID     FROM Examination E     WHERE E.Diagnosis LIKE '%ITP%' ), SLE_Patients AS (     SELECT DISTINCT P.ID     FROM Patient P     WHERE P.Diagnosis LIKE '%SLE%'     UNION     SELECT DISTINCT E.PatientID     FROM Examination E     WHERE E.Diagnosis LIKE '%SLE%' ) SELECT      COUNT(DISTINCT ITP.ID) * 100.0 / (SELECT COUNT(*) FROM ITP_Patients) AS Proportion FROM ITP_Patients ITP WHERE ITP.ID IN (SELECT ID FROM SLE_Patients);	thrombosis_prediction
SELECT (CAST(SUM(CASE WHEN SEX = 'F' THEN 1 ELSE 0 END) AS REAL) / COUNT(SEX)) * 100 FROM Patient WHERE STRFTIME('%Y', Birthday) = '1980' AND Diagnosis = 'RA';	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P INNER JOIN Examination E ON P.ID = E.ID WHERE P.SEX = 'M' AND E.`Examination Date` >= '1995-01-01' AND E.`Examination Date` <= '1997-12-31' AND P.Diagnosis LIKE '%Behcet%' AND P.Admission = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID)  FROM Patient P  INNER JOIN Laboratory L ON P.ID = L.ID  WHERE P.SEX = 'F' AND L.WBC < 3.5;	thrombosis_prediction
SELECT DATEDIFF(`Examination Date`, `First Date`)  FROM Patient  INNER JOIN Examination  ON Patient.ID = Examination.ID  WHERE Patient.ID = 821298;	thrombosis_prediction
SELECT P.SEX, L.UA FROM Patient P INNER JOIN Laboratory L ON P.ID = L.ID WHERE P.ID = 57266 AND (P.SEX = 'M' AND L.UA > 8.0 OR P.SEX = 'F' AND L.UA > 6.5);	thrombosis_prediction
SELECT `Date` FROM `Laboratory` WHERE `ID` = 48473 AND `GOT` >= 60;	thrombosis_prediction
SELECT P.SEX, P.Birthday FROM Patient P INNER JOIN Laboratory L ON P.ID = L.ID WHERE L.GOT < 60 AND strftime('%Y', L.Date) = '1994'	thrombosis_prediction
SELECT DISTINCT P.ID FROM Patient P INNER JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.GPT >= 60;	thrombosis_prediction
SELECT DISTINCT p.Diagnosis FROM Patient p INNER JOIN Laboratory l ON p.ID = l.ID WHERE l.GPT > 60 ORDER BY p.Birthday ASC;	thrombosis_prediction
SELECT AVG(LDH) FROM Laboratory WHERE LDH < 500;	thrombosis_prediction
SELECT P.ID, (YEAR(CURRENT_TIMESTAMP) - YEAR(P.Birthday)) AS Age FROM Patient P INNER JOIN Laboratory L ON P.ID = L.ID WHERE L.LDH BETWEEN 600 AND 800;	thrombosis_prediction
SELECT P.Admission FROM Patient P INNER JOIN Laboratory L ON P.ID = L.ID WHERE L.ALP < 300;	thrombosis_prediction
SELECT p.ID  FROM Patient p  INNER JOIN Laboratory l ON p.ID = l.ID  WHERE p.Birthday = '1982-04-01' AND l.ALP < 300;	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday FROM Patient P INNER JOIN Laboratory L ON P.ID = L.ID WHERE L.TP < 6.0	thrombosis_prediction
SELECT P.ID, L.Date, L.TP, L.TP - 8.5 AS Deviation FROM Patient P INNER JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'F' AND L.TP > 8.5	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday, L.ALB FROM Patient P INNER JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND (L.ALB <= 3.5 OR L.ALB >= 5.5) ORDER BY P.Birthday DESC;	thrombosis_prediction
SELECT P.ID, CASE WHEN L.ALB BETWEEN 3.5 AND 5.5 THEN 'Yes' ELSE 'No' END AS AlbuminInRange FROM Patient P INNER JOIN Laboratory L ON P.ID = L.ID WHERE YEAR(P.Birthday) = 1982;	thrombosis_prediction
SELECT      ( CAST( ( SELECT COUNT(*) FROM Patient p INNER JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'F' AND l.UA > 6.5 ) AS REAL ) / ( SELECT COUNT(*) FROM Patient WHERE SEX = 'F' ) ) * 100;	thrombosis_prediction
SELECT AVG(L.UA) AS average_UA FROM Patient P INNER JOIN Laboratory L ON P.ID = L.ID WHERE (P.SEX = 'M' AND L.UA < 8.0) OR (P.SEX = 'F' AND L.UA < 6.5) AND L.Date = (SELECT MAX(Date) FROM Laboratory WHERE ID = P.ID)	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday FROM Patient P INNER JOIN Laboratory L ON P.ID = L.ID WHERE L.UN = 29;	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday  FROM Patient P  INNER JOIN Laboratory L ON P.ID = L.ID  WHERE P.Diagnosis = 'RA' AND L.UN < 30;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P INNER JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.CRE >= 1.5;	thrombosis_prediction
SELECT (CASE WHEN SUM(CASE WHEN SEX = 'M' AND CRE >= 1.5 THEN 1 ELSE 0 END) > SUM(CASE WHEN SEX = 'F' AND CRE >= 1.5 THEN 1 ELSE 0 END) THEN 'True' ELSE 'False' END) AS Result FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday, l.`T-BIL` FROM Laboratory l JOIN Patient p ON l.ID = p.ID WHERE l.`T-BIL` = (SELECT MAX(`T-BIL`) FROM Laboratory);	thrombosis_prediction
SELECT SEX, GROUP_CONCAT(DISTINCT P.ID) FROM Patient AS P INNER JOIN Laboratory AS L ON P.ID = L.ID WHERE L.`T-BIL` >= 2.0 GROUP BY P.SEX	thrombosis_prediction
SELECT p.ID, MAX(l.T_CHO) as MaxT FROM Patient p JOIN Laboratory l ON p.ID = l.ID GROUP BY p.ID ORDER BY MaxT DESC, p.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT AVG(YEAR(NOW()) - YEAR(P.Birthday)) AS AverageAge FROM Patient P INNER JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.`T-CHO` >= 250;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday, p.Diagnosis FROM Patient p WHERE EXISTS (     SELECT 1     FROM Laboratory l     WHERE l.ID = p.ID AND l.TG > 300 );	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P INNER JOIN Laboratory L ON P.ID = L.ID WHERE L.TG >= 200 AND YEAR(CURRENT_TIMESTAMP) - YEAR(P.Birthday) > 50;	thrombosis_prediction
SELECT DISTINCT P.ID  FROM Patient P  INNER JOIN Laboratory L  ON P.ID = L.ID  WHERE P.Admission = '-' AND L.CPK < 250;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE strftime('%Y', P.Birthday) BETWEEN '1936' AND '1956' AND P.SEX = 'M' AND L.CPK >= 250;	thrombosis_prediction
SELECT DISTINCT P.ID, P.SEX, (YEAR(CURRENT_TIMESTAMP) - YEAR(P.Birthday)) AS AGE FROM Patient P INNER JOIN Laboratory L ON P.ID = L.ID WHERE L.GLU >= 180 AND L.T_CHO < 250	thrombosis_prediction
SELECT p.ID, l.GLU  FROM Patient p  INNER JOIN Laboratory l  ON p.ID = l.ID  WHERE YEAR(p.Description) = 1991 AND l.GLU < 180;	thrombosis_prediction
SELECT DISTINCT P.ID, P.SEX, P.Birthday FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.WBC <= 3.5 OR L.WBC >= 9.0 ORDER BY SEX ASC, Birthday ASC;	thrombosis_prediction
SELECT P.Diagnosis, P.ID, SUBTRACT(YEAR(CURRENT_TIMESTAMP), YEAR(P.Birthday)) AS AGE FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.RBC < 3.5;	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday, L.RBC, P.Admission FROM Patient AS P INNER JOIN Laboratory AS L ON P.ID = L.ID WHERE P.SEX = 'F' AND TIMESTAMPDIFF(YEAR, P.Birthday, CURRENT_TIMESTAMP) >= 50 AND (L.RBC <= 3.5 OR L.RBC >= 6.0);	thrombosis_prediction
SELECT P.ID, P.SEX  FROM Patient P WHERE P.Admission = '-' AND EXISTS (     SELECT 1      FROM Laboratory L      WHERE L.ID = P.ID AND L.HGB < 10 );	thrombosis_prediction
SELECT DISTINCT P.ID, P.SEX FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Diagnosis = 'SLE' AND L.HGB > 10 AND L.HGB < 17 ORDER BY P.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT P.ID, YEAR(CURRENT_TIMESTAMP) - YEAR(P.Birthday) AS Age FROM Patient P WHERE EXISTS (     SELECT 1     FROM Laboratory L     WHERE L.ID = P.ID AND L.HCT >= 52     GROUP BY L.ID     HAVING COUNT(L.ID) > 1 );	thrombosis_prediction
SELECT AVG(HCT) FROM Laboratory WHERE Date LIKE '1991%' AND HCT < 29	thrombosis_prediction
SELECT COUNT(DISTINCT CASE WHEN PLT < 100 THEN ID END) AS lower_count,        COUNT(DISTINCT CASE WHEN PLT > 400 THEN ID END) AS higher_count,        COUNT(DISTINCT CASE WHEN PLT < 100 THEN ID END) - COUNT(DISTINCT CASE WHEN PLT > 400 THEN ID END) AS comparison FROM Laboratory;	thrombosis_prediction
SELECT DISTINCT P.ID FROM Patient AS P INNER JOIN Laboratory AS L ON P.ID = L.ID WHERE strftime('%Y', L.Date) = '1984' AND (strftime('%Y', 'now') - strftime('%Y', P.Birthday)) < 50 AND L.PLT BETWEEN 100 AND 400	thrombosis_prediction
SELECT      (SUM(CASE WHEN P.SEX = 'F' AND E.PT >= 14 THEN 1 ELSE 0 END) / SUM(CASE WHEN E.PT >= 14 THEN 1 ELSE 0 END)) * 100 AS PercentageOfFemaleWithAbnormalPT FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE YEAR(CURRENT_TIMESTAMP) - YEAR(P.Birthday) > 55;	thrombosis_prediction
SELECT DISTINCT P.ID FROM Patient P INNER JOIN Laboratory L ON P.ID = L.ID WHERE strftime('%Y', P.`First Date`) > '1992' AND L.PT < 14	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE `Examination Date` > '1997-01-01' AND APTT >= 45	thrombosis_prediction
SELECT COUNT(DISTINCT L.ID) AS PatientCount FROM Laboratory L LEFT JOIN Examination E      ON L.ID = E.ID AND E.Thrombosis = 1 WHERE L.APPT > 45 AND E.ID IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P INNER JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.WBC > 3.5 AND L.WBC < 9.0 AND (L.FG <= 150 OR L.FG >= 450);	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID)  FROM Patient P  INNER JOIN Laboratory L  ON P.ID = L.ID  WHERE P.Birthday > '1980-01-01'  AND (L.FG < 150 OR L.FG > 450);	thrombosis_prediction
SELECT DISTINCT P.Diagnosis FROM Patient P INNER JOIN Laboratory L ON P.ID = L.ID WHERE L.`U-PRO` >= 30;	thrombosis_prediction
SELECT DISTINCT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Diagnosis = 'SLE' AND L.`U-PRO` IS NOT NULL AND CAST(L.`U-PRO` AS REAL) > 0 AND CAST(L.`U-PRO` AS REAL) < 30;	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE IGG >= 2000;	thrombosis_prediction
SELECT COUNT(*) FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE IGG > 900 AND IGG < 2000 AND Symptoms IS NOT NULL;	thrombosis_prediction
SELECT Diagnosis FROM Patient WHERE ID = (   SELECT ID FROM Laboratory    WHERE IGA BETWEEN 80 AND 500    ORDER BY IGA DESC    LIMIT 1 )	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P INNER JOIN Laboratory L ON P.ID = L.ID WHERE L.IGA > 80 AND L.IGA < 500 AND P.`First Date` >= '1990-01-01';	thrombosis_prediction
SELECT Diagnosis FROM ( SELECT P.Diagnosis, COUNT(*) as cnt FROM Patient P INNER JOIN Laboratory L ON P.ID = L.ID WHERE L.IGM <= 40 OR L.IGM >= 400 GROUP BY P.Diagnosis ) ORDER BY cnt DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT L.ID) FROM Laboratory L INNER JOIN Patient P ON L.ID = P.ID WHERE L.CRP = '+' AND P.Description IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.CRE >= 1.5 AND (YEAR(CURDATE()) - YEAR(P.Birthday)) < 70	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P WHERE EXISTS (   SELECT 1    FROM Laboratory L    WHERE L.ID = P.ID AND L.RA IN ('-', '+-') ) AND EXISTS (   SELECT 1    FROM Examination E    WHERE E.ID = P.ID AND E.KCT = '+' );	thrombosis_prediction
SELECT Diagnosis FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE YEAR(Birthday) >= 1985 AND RF IN ('-', '+-')	thrombosis_prediction
SELECT DISTINCT P.ID FROM Patient P INNER JOIN Laboratory L ON P.ID = L.ID WHERE L.RF < 20 AND YEAR(CURDATE()) - YEAR(P.Birthday) > 60;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Examination E ON P.ID = E.ID JOIN Laboratory L ON P.ID = L.ID WHERE E.Thrombosis = 0 AND CAST(L.RF AS INTEGER) < 20;	thrombosis_prediction
SELECT COUNT(DISTINCT L.ID) FROM Laboratory L INNER JOIN Examination E ON L.ID = E.ID WHERE L.C3 > 35 AND E.`ANA Pattern` = 'P';	thrombosis_prediction
SELECT P.ID, L.HCT, E.`aCL IgA` FROM Patient P INNER JOIN Laboratory L ON P.ID = L.ID INNER JOIN Examination E ON P.ID = E.ID WHERE L.HCT <= 29 OR L.HCT >= 52 ORDER BY E.`aCL IgA` DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT p.id) FROM Patient p WHERE EXISTS (     SELECT 1      FROM Examination e      WHERE e.id = p.id AND e.Thrombosis = 1 ) AND EXISTS (     SELECT 1      FROM Laboratory l      WHERE l.id = p.id AND l.C4 > 10 );	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P INNER JOIN Laboratory L ON P.ID = L.ID WHERE L.RNP IN ('-', '+-') AND P.Admission = '+'	thrombosis_prediction
SELECT MAX(Birthday) FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE RNP NOT IN ('-', '+-');	thrombosis_prediction
SELECT COUNT(DISTINCT l.PatientID) AS PatientCount FROM Laboratory l WHERE l.SM IN ('-', '+-') AND EXISTS (     SELECT 1 FROM Examination e     WHERE e.PatientID = l.PatientID AND e.Thrombosis = 0 );	thrombosis_prediction
SELECT p.ID FROM Patient p WHERE p.ID IN (SELECT l.ID FROM Laboratory l WHERE l.SM NOT IN ('negative', '0')) ORDER BY p.Birthday DESC LIMIT 3;	thrombosis_prediction
SELECT DISTINCT E.ID FROM Examination E WHERE E.`Examination Date` > '1997-01-01' AND EXISTS (     SELECT 1     FROM Laboratory L     WHERE L.ID = E.ID AND L.SC70 IN ('negative', '0') );	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P WHERE P.SEX = 'F' AND EXISTS (   SELECT 1 FROM Laboratory L WHERE L.ID = P.ID AND L.Result IN ('negative', '0') ) AND NOT EXISTS (   SELECT 1 FROM Examination E WHERE E.ID = P.ID AND E.Symptoms IS NOT NULL );	thrombosis_prediction
To determine how many patients with normal anti-SSA levels visited the hospital before 2000, we need to count distinct patient IDs where anti-SSA is either '-' or '+-' in the Laboratory table, and their first visit was before the year 2000 as recorded in the Patient table.  **Answer:**  SELECT COUNT(DISTINCT P.ID) FROM Patient P INNER JOIN Laboratory L ON P.ID = L.ID WHERE L.SSA IN('-','+-') AND YEAR(P.`First Date`) < 2000	thrombosis_prediction
SELECT P.ID FROM Patient P INNER JOIN Laboratory L ON P.ID = L.ID WHERE L.SSA NOT IN('negative', '0') ORDER BY P.`First Date` ASC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID) FROM Examination E INNER JOIN Laboratory L ON E.ID = L.ID WHERE L.SSB IN ('-', '0') AND E.Diagnosis = 'SLE';	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e INNER JOIN Laboratory l ON e.ID = l.ID WHERE l.SSB IN ('negative', '0') AND e.Symptoms IS NOT NULL	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID)  FROM Patient P  INNER JOIN Laboratory L ON P.ID = L.ID  WHERE L.CENTROMEA IN ('-', '+-')    AND L.SSB IN ('-', '+-')    AND P.SEX = 'M';	thrombosis_prediction
SELECT DISTINCT T1.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T3.DNA >= 8;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) AS NumberOfPatients FROM Patient P INNER JOIN Laboratory L ON P.ID = L.ID WHERE L.DNA < 8 AND P.Description IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.IGG > 900 AND l.IGG < 2000 AND p.Admission = '+';	thrombosis_prediction
SELECT      (CAST(         COUNT(DISTINCT CASE WHEN COALESCE(P.Diagnosis, E.Diagnosis) = 'SLE' THEN L.ID END) AS REAL        ) /        COUNT(DISTINCT L.ID)     ) * 100 FROM      Laboratory L LEFT JOIN      Patient P ON L.ID = P.ID LEFT JOIN      Examination E ON L.ID = E.ID WHERE      L.GOT >= 60;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P INNER JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.GOT < 60;	thrombosis_prediction
SELECT MAX(P.Birthday) AS YoungestBirthdate FROM Patient P INNER JOIN Laboratory L ON P.ID = L.ID WHERE L.GOT >= 60;	thrombosis_prediction
SELECT P.Birthday FROM (   SELECT ID, MAX(GPT) as max_gpt   FROM Laboratory   WHERE GPT < 60   GROUP BY ID ) AS sub JOIN Patient P ON sub.ID = P.ID ORDER BY sub.max_gpt DESC LIMIT 3;	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory INNER JOIN Patient ON Laboratory.ID = Patient.ID WHERE GOT < 60 AND SEX = 'M';	thrombosis_prediction
SELECT MIN(P.`First Date`)  FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.LDH = (SELECT MAX(LDH) FROM Laboratory WHERE LDH < 500);	thrombosis_prediction
SELECT MAX(l.Date) AS latest_date FROM Laboratory l WHERE l.ID = (     SELECT p1.ID     FROM Patient p1     WHERE EXISTS(         SELECT 1         FROM Laboratory l1         WHERE l1.ID = p1.ID AND l1.LDH >= 500     )     ORDER BY p1.FirstDate DESC     LIMIT 1 ) AND l.LDH >= 500;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P INNER JOIN Laboratory L ON P.ID = L.ID WHERE L.ALP >= 300 AND P.Admission = '+'	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P INNER JOIN Laboratory L ON P.ID = L.ID WHERE P.Admission = '-' AND L.ALP < 300;	thrombosis_prediction
SELECT DISTINCT P.Diagnosis  FROM Patient P  INNER JOIN Laboratory L  ON P.ID = L.ID  WHERE L.TP < 6.0;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P INNER JOIN Laboratory L ON P.ID = L.ID WHERE P.Diagnosis = 'SJS' AND L.TP > 6.0 AND L.TP < 8.5	thrombosis_prediction
SELECT Date FROM Laboratory WHERE ALB = (SELECT MAX(ALB) FROM Laboratory WHERE ALB > 3.5 AND ALB < 5.5);	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory AS L INNER JOIN Patient AS P ON L.ID = P.ID WHERE P.SEX = 'M' AND L.ALB > 3.5 AND L.ALB < 5.5 AND (L.TP BETWEEN 6.0 AND 8.5)	thrombosis_prediction
SELECT E.`aCL IgG`, E.`aCL IgM`, E.`aCL IgA` FROM Patient P JOIN Laboratory L ON P.ID = L.ID JOIN Examination E ON P.ID = E.ID WHERE P.SEX = 'F' AND L.UA > 6.50 ORDER BY L.UA DESC LIMIT 1;	thrombosis_prediction
SELECT MAX(ANA) FROM Examination WHERE ID IN (SELECT ID FROM Laboratory WHERE CRE < 1.5);	thrombosis_prediction
SELECT E.ID  FROM Examination E JOIN Laboratory L ON E.ID = L.ID AND E.`Examination Date` = L.Date WHERE L.CRE < 1.5 AND E.aCL_IgA = (     SELECT MAX(E2.aCL_IgA)     FROM Examination E2     JOIN Laboratory L2 ON E2.ID = L2.ID AND E2.`Examination Date` = L2.Date     WHERE L2.CRE < 1.5 );	thrombosis_prediction
SELECT COUNT(*) FROM Examination INNER JOIN Laboratory ON Examination.ID = Laboratory.ID WHERE `T-BIL` >= 2.0 AND `ANA Pattern` LIKE '%P%';	thrombosis_prediction
SELECT T1.ANA FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.`T-BIL` = (SELECT MAX(`T-BIL`) FROM Laboratory WHERE `T-BIL` < 2.0);	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID)  FROM Examination E INNER JOIN Patient P ON E.ID = P.ID INNER JOIN Laboratory L ON E.ID = L.ID WHERE L.`T-CHO` >= 250 AND E.KCT = '-';	thrombosis_prediction
SELECT COUNT(*)  FROM Examination INNER JOIN Laboratory ON Examination.ID = Laboratory.ID WHERE `T-CHO` < 250 AND `ANA Pattern` = 'P';	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID) FROM Examination E INNER JOIN Laboratory L ON E.ID = L.ID WHERE L.TG < 200 AND E.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT P.Diagnosis FROM Patient P INNER JOIN Laboratory L ON P.ID = L.ID WHERE L.TG < 200 AND L.TG = (SELECT MAX(TG) FROM Laboratory WHERE TG < 200)	thrombosis_prediction
SELECT DISTINCT E.ID FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE Thrombosis = 0 AND CPK < 250;	thrombosis_prediction
SELECT COUNT(*) FROM Examination E INNER JOIN Laboratory L ON E.ID = L.ID WHERE L.CPK < 250 AND (E.KCT = '+' OR E.RVVT = '+' OR E.LAC = '+');	thrombosis_prediction
SELECT MIN(P.Birthday) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GLU > 180;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Examination E ON P.ID = E.ID JOIN Laboratory L ON P.ID = L.ID WHERE L.GLU < 180 AND E.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Admission = '+' AND L.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P INNER JOIN Laboratory L ON P.ID = L.ID WHERE P.Diagnosis = 'SLE' AND L.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT DISTINCT P.ID  FROM Patient P  INNER JOIN Laboratory L  ON P.ID = L.ID  WHERE P.Admission = '-' AND (L.RBC <= 3.5 OR L.RBC >= 6.0);	thrombosis_prediction
WITH NormalLabPatients AS (     SELECT DISTINCT PatientID     FROM Lab     WHERE PLT > 100 AND PLT < 400 ) SELECT COUNT(*) FROM NormalLabPatients nlp WHERE EXISTS (     SELECT 1     FROM Examination e     WHERE e.PatientID = nlp.PatientID     AND e.Diagnosis IS NOT NULL );	thrombosis_prediction
SELECT PLT FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'MCTD' AND (PLT > 100 AND PLT < 400)	thrombosis_prediction
SELECT AVG(L.PT) AS Average_PT FROM Laboratory L INNER JOIN Patient P ON L.ID = P.ID WHERE P.SEX = 'M' AND L.PT < 14;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Examination E INNER JOIN Patient P ON E.ID = P.ID WHERE E.Thrombosis IN (1, 2) AND E.PT < 14;	thrombosis_prediction
SELECT T1.major_name FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Angela' AND T2.last_name = 'Sanders';	student_club
SELECT COUNT(DISTINCT m.member_id)  FROM member m  JOIN major mj ON m.link_to_major = mj.major_id  WHERE mj.college = 'College of Engineering';	student_club
SELECT m.first_name, m.last_name  FROM member m  INNER JOIN major ma  ON m.link_to_major = ma.major_id  WHERE ma.department = 'Art and Design';	student_club
SELECT COUNT(DISTINCT T2.link_to_member)  FROM event AS T1  JOIN attendance AS T2  ON T1.event_id = T2.link_to_event  WHERE T1.event_name = 'Women''s Soccer';	student_club
SELECT phone FROM member WHERE member_id IN ( SELECT link_to_member FROM attendance WHERE link_to_event = ( SELECT event_id FROM event WHERE event_name = 'Women''s Soccer' ) );	student_club
SELECT COUNT(*)  FROM member  JOIN attendance ON member.member_id = attendance.link_to_member  JOIN event ON attendance.link_to_event = event.event_id  WHERE event.event_name = 'Women\'s Soccer' AND member.t_shirt_size = 'Medium';	student_club
SELECT e.event_name, e.event_date, a.attendance_count FROM event e JOIN (     SELECT link_to_event, COUNT(*) AS attendance_count     FROM attendance     GROUP BY link_to_event ) a ON e.event_id = a.link_to_event ORDER BY a.attendance_count DESC LIMIT 1;	student_club
SELECT m1.college FROM major AS m1 INNER JOIN member AS m2 ON m1.major_id = m2.link_to_major WHERE m2.position = 'Vice President';	student_club
SELECT T1.event_name FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event INNER JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T3.first_name = 'Maya' AND T3.last_name = 'McLean';	student_club
SELECT COUNT(DISTINCT e.event_id) AS number_of_events FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE m.first_name = 'Sacha'   AND m.last_name = 'Harrison'   AND e.type = 'Student_Club'   AND e.event_date LIKE '2019-%';	student_club
SELECT COUNT(*) FROM (   SELECT e.event_id   FROM event e   INNER JOIN attendance a ON e.event_id = a.link_to_event   WHERE e.type = 'Meeting'   GROUP BY e.event_id   HAVING COUNT(a.link_to_member) > 10 ) AS subquery;	student_club
SELECT e.event_name FROM event e JOIN (     SELECT link_to_event, COUNT(link_to_member) as attendance_count     FROM attendance     GROUP BY link_to_event     HAVING attendance_count > 20 ) a ON e.event_id = a.link_to_event WHERE e.type != 'fundraiser';	student_club
WITH MeetingAttendance AS (     SELECT          e.event_id,         COUNT(a.link_to_member) as attendees_count     FROM          event e     LEFT JOIN          attendance a ON e.event_id = a.link_to_event     WHERE          STRFTIME('%Y', e.event_date) = '2020' AND e.type = 'Meeting'     GROUP BY          e.event_id ) SELECT      (SUM(attendees_count)) / COUNT(event_id) as average_attendance FROM      MeetingAttendance;	student_club
SELECT expense_description, cost  FROM expense  WHERE cost = (SELECT MAX(cost) FROM expense);	student_club
SELECT COUNT(*)  FROM member  INNER JOIN major  ON member.link_to_major = major.major_id  WHERE major.major_name = 'Environmental Engineering';	student_club
SELECT m.first_name || ' ' || m.last_name  FROM member m  INNER JOIN attendance a ON m.member_id = a.link_to_member  INNER JOIN event e ON a.link_to_event = e.event_id  WHERE e.event_name = 'Laugh Out Loud';	student_club
SELECT T1.last_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Law and Constitutional Studies'	student_club
SELECT T1.county FROM zip_code AS T1 INNER JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T2.first_name = 'Sherri' AND T2.last_name = 'Ramsey';	student_club
SELECT T2.college  FROM member AS T1  INNER JOIN major AS T2  ON T1.link_to_major = T2.major_id  WHERE T1.first_name = 'Tyler' AND T1.last_name = 'Hewitt';	student_club
SELECT SUM(T1.amount) AS total_funds FROM income AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.position = 'Vice President';	student_club
SELECT SUM(b.spent) AS total_food_spent FROM budget b INNER JOIN event e ON b.link_to_event = e.event_id WHERE b.category = 'Food' AND e.event_name = 'September Meeting';	student_club
SELECT T2.city, T2.state  FROM member AS T1  INNER JOIN zip_code AS T2  ON T1.zip = T2.zip_code  WHERE T1.position = 'President';	student_club
SELECT first_name || ' ' || last_name FROM member INNER JOIN zip_code ON member.zip = zip_code.zip_code WHERE state = 'Illinois'	student_club
SELECT SUM(b.spent) FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'September Meeting' AND b.category = 'Advertisement';	student_club
SELECT mj.department FROM member AS m INNER JOIN major AS mj ON m.link_to_major = mj.major_id WHERE m.last_name = 'Pierce' OR m.last_name = 'Guidi';	student_club
SELECT SUM(b.amount) AS total_budgeted_amount  FROM budget b  JOIN event e ON b.link_to_event = e.event_id  WHERE e.event_name = 'October Speaker';	student_club
SELECT e.expense_description, e.approved  FROM expense e  INNER JOIN budget b ON e.link_to_budget = b.budget_id  INNER JOIN event evt ON b.link_to_event = evt.event_id  WHERE evt.event_name = 'October Meeting' AND evt.event_date = '2019-10-08';	student_club
SELECT AVG(T2.cost) AS average_cost FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T1.first_name = 'Elijah' AND T1.last_name = 'Allen' AND (CAST(SUBSTR(T2.expense_date, 5, 2) AS INTEGER) = 9 OR CAST(SUBSTR(T2.expense_date, 5, 2) AS INTEGER) = 10);	student_club
SELECT      (SUM(CASE WHEN substr(e.event_date, 1, 4) = '2019' THEN b.spent END) -       SUM(CASE WHEN substr(e.event_date, 1, 4) = '2020' THEN b.spent END)) AS difference FROM budget b JOIN event e ON b.link_to_event = e.event_id;	student_club
SELECT location FROM event WHERE event_name = 'Spring Budget Review';	student_club
SELECT cost FROM expense WHERE expense_description = 'Posters' AND expense_date = '2019-09-04';	student_club
SELECT remaining FROM budget WHERE category = 'Food' AND amount = ( SELECT MAX(amount) FROM budget WHERE category = 'Food' )	student_club
SELECT notes FROM income WHERE source = 'Fundraising' AND date_received = '2019-09-14';	student_club
SELECT COUNT(DISTINCT major_id) FROM major WHERE college = 'College of Humanities and Social Sciences';	student_club
SELECT phone FROM member WHERE first_name = 'Carlo' AND last_name = 'Jacobs';	student_club
SELECT T1.county FROM zip_code AS T1 INNER JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T2.first_name = 'Adela' AND T2.last_name = 'O\'Gallagher'	student_club
SELECT COUNT(*)  FROM budget  INNER JOIN event  ON budget.link_to_event = event.event_id  WHERE event.event_name = 'November Meeting' AND budget.remaining < 0;	student_club
SELECT SUM(b.amount) FROM budget b INNER JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'September Speaker';	student_club
SELECT T1.event_status  FROM budget AS T1  INNER JOIN expense AS T2  ON T1.budget_id = T2.link_to_budget  WHERE T2.expense_description = 'Post Cards, Posters' AND T2.expense_date = '2019-08-20';	student_club
SELECT T2.major_name  FROM member AS T1  INNER JOIN major AS T2  ON T1.link_to_major = T2.major_id  WHERE T1.first_name = 'Brent' AND T1.last_name = 'Thomason';	student_club
SELECT COUNT(member.member_id)  FROM member  INNER JOIN major  ON member.link_to_major = major.major_id  WHERE major.major_name = 'Business' AND member.t_shirt_size = 'Medium';	student_club
SELECT T1.type  FROM zip_code AS T1  INNER JOIN member AS T2  ON T1.zip_code = T2.zip  WHERE T2.first_name = 'Christof' AND T2.last_name = 'Nielson';	student_club
SELECT major.major_name FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'Vice President';	student_club
SELECT T1.state  FROM zip_code AS T1  INNER JOIN member AS T2  ON T1.zip_code = T2.zip  WHERE T2.first_name = 'Sacha' AND T2.last_name = 'Harrison';	student_club
SELECT m.department FROM major m INNER JOIN member me ON m.major_id = me.link_to_major WHERE me.position = 'President';	student_club
SELECT i.date_received  FROM income i  INNER JOIN member m ON i.link_to_member = m.member_id  WHERE m.first_name = 'Connor' AND m.last_name = 'Hilton' AND i.source = 'Dues';	student_club
SELECT m.first_name, m.last_name  FROM income AS i  INNER JOIN member AS m ON i.link_to_member = m.member_id  WHERE i.source = 'Dues'  AND i.date_received = (SELECT MIN(date_received) FROM income WHERE source = 'Dues')  LIMIT 1;	student_club
SELECT    SUM(CASE WHEN e.event_name = 'Yearly Kickoff' THEN b.amount ELSE 0 END) /    SUM(CASE WHEN e.event_name = 'October Meeting' THEN b.amount ELSE 0 END) AS ratio FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE b.category = 'Advertisement';	student_club
SELECT (SUM(CASE WHEN category = 'Parking' THEN amount ELSE 0 END) / SUM(amount)) * 100 FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event_name = 'November Speaker';	student_club
SELECT SUM(cost) FROM expense WHERE expense_description = 'Pizza';	student_club
SELECT COUNT(DISTINCT city) FROM zip_code WHERE county = 'Orange County' AND state = 'Virginia';	student_club
SELECT DISTINCT department FROM major WHERE college = 'College of Humanities and Social Sciences';	student_club
SELECT T2.city, T2.county, T2.state  FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Amy' AND T1.last_name = 'Firth';	student_club
SELECT T2.expense_description  FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id WHERE T2.budget_id = (     SELECT budget_id      FROM budget      ORDER BY remaining      LIMIT 1 );	student_club
SELECT m.* FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE e.event_name = 'October Meeting';	student_club
SELECT T1.college, COUNT(T2.member_id) as cnt  FROM major AS T1  JOIN member AS T2 ON T1.major_id = T2.link_to_major  GROUP BY T1.college  ORDER BY cnt DESC  LIMIT 1;	student_club
SELECT T1.major_name FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.phone = "809-555-3360"	student_club
SELECT T1.event_name, MAX(T2.amount) AS max_amount FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event GROUP BY T1.event_name HAVING MAX(T2.amount) = (SELECT MAX(amount) FROM budget);	student_club
To list all expenses incurred by the vice president, you need to join the `member` table with the `expense` table based on the member's ID. Since the vice president’s position is stored in the `position` column of the `member` table, we'll filter for that position.  SELECT T1.expense_description FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.position = 'Vice President';	student_club
SELECT COUNT(DISTINCT T2.link_to_member)  FROM event AS T1  INNER JOIN attendance AS T2  ON T1.event_id = T2.link_to_event  WHERE T1.event_name = 'Women''s Soccer';	student_club
SELECT i.date_received  FROM income i  INNER JOIN member m ON i.link_to_member = m.member_id  WHERE m.first_name = 'Casey' AND m.last_name = 'Mason';	student_club
SELECT COUNT(*) FROM member INNER JOIN zip_code ON member.zip = zip_code.zip_code WHERE zip_code.state = 'Maryland';	student_club
SELECT COUNT(*)  FROM attendance  WHERE link_to_member IN (   SELECT member_id    FROM member    WHERE phone = '954-555-6240' );	student_club
SELECT first_name || ' ' || last_name FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE major.department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT e.event_name, (b.spent / b.amount) AS ratio FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.status = 'Closed' ORDER BY ratio DESC LIMIT 1;	student_club
SELECT COUNT(member_id) FROM member WHERE position = 'President';	student_club
SELECT MAX(spent) FROM budget;	student_club
SELECT COUNT(*) FROM event WHERE type = 'Meeting' AND STRFTIME('%Y', event_date) = '2020';	student_club
SELECT SUM(spent) FROM budget WHERE category = 'Food';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member GROUP BY m.first_name, m.last_name HAVING COUNT(a.link_to_event) > 7;	student_club
SELECT m.member_id, m.first_name, m.last_name  FROM member m INNER JOIN major mj ON m.link_to_major = mj.major_id AND mj.major_name = 'Interior Design' INNER JOIN attendance a ON m.member_id = a.link_to_member INNER JOIN event e ON a.link_to_event = e.event_id  WHERE e.event_name = 'Community Theater';	student_club
SELECT first_name, last_name  FROM member  INNER JOIN zip_code  ON member.zip = zip_code.zip_code  WHERE zip_code.city = 'Georgetown' AND zip_code.state = 'South Carolina';	student_club
SELECT SUM(i.amount) FROM income i INNER JOIN member m ON i.link_to_member = m.member_id WHERE m.first_name = 'Grant' AND m.last_name = 'Gilmour';	student_club
SELECT m.first_name, m.last_name  FROM member m  INNER JOIN income i  ON m.member_id = i.link_to_member  WHERE i.amount > 40;	student_club
SELECT SUM(cost) FROM expense JOIN budget ON expense.link_to_budget = budget.budget_id JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'Yearly Kickoff';	student_club
SELECT m.first_name, m.last_name  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  JOIN expense ex ON b.budget_id = ex.link_to_budget  JOIN member m ON ex.link_to_member = m.member_id  WHERE e.event_name = 'Yearly Kickoff';	student_club
SELECT m.first_name, m.last_name, i.source FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.amount = (SELECT MAX(amount) FROM income);	student_club
SELECT e.event_name FROM expense exp JOIN budget bud ON exp.link_to_budget = bud.budget_id JOIN event e ON bud.link_to_event = e.event_id GROUP BY e.event_id ORDER BY SUM(exp.cost) ASC LIMIT 1;	student_club
SELECT      ((         SELECT SUM(e.cost) AS total_yearly_cost         FROM expense e         JOIN budget b ON e.link_to_budget = b.budget_id         JOIN event ev ON b.link_to_event = ev.event_id         WHERE ev.event_name = 'Yearly Kickoff'     ) / (         SELECT SUM(e.cost) AS total_all_costs         FROM expense e         JOIN budget b ON e.link_to_budget = b.budget_id         JOIN event ev ON b.link_to_event = ev.event_id     )) * 100;	student_club
SELECT      SUM(CASE WHEN major_name = 'Finance' THEN 1 ELSE 0 END) /      SUM(CASE WHEN major_name = 'Physics' THEN 1 ELSE 0 END) AS finance_physics_ratio FROM major;	student_club
SELECT source FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' GROUP BY source ORDER BY SUM(amount) DESC LIMIT 1;	student_club
SELECT first_name || ' ' || last_name AS full_name, email FROM member WHERE position = 'Secretary';	student_club
SELECT COUNT(m.member_id) FROM member m INNER JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Physics Teaching';	student_club
SELECT COUNT(DISTINCT m.member_id) FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE e.event_name = 'Community Theater' AND YEAR(e.event_date) = 2019;	student_club
SELECT      COUNT(DISTINCT T1.link_to_event) AS number_of_events_attended,     T3.major_name AS major FROM      member AS T1 INNER JOIN      attendance AS T2 ON T1.member_id = T2.link_to_member INNER JOIN      major AS T3 ON T1.link_to_major = T3.major_id WHERE      T1.first_name = 'Luisa' AND T1.last_name = 'Guidi';	student_club
SELECT AVG(spent) FROM (   SELECT spent FROM budget WHERE category = 'Food' AND event_status = 'Closed' );	student_club
SELECT e.event_name FROM event e WHERE e.event_id = (     SELECT b.link_to_event     FROM budget b     WHERE b.category = 'Advertisement'     GROUP BY b.link_to_event     ORDER BY SUM(b.spent) DESC     LIMIT 1 );	student_club
SELECT m.member_id, e.event_id  FROM member m  INNER JOIN attendance a ON m.member_id = a.link_to_member  INNER JOIN event e ON a.link_to_event = e.event_id  WHERE m.first_name = 'Maya' AND m.last_name = 'Mclean' AND e.event_name = 'Women''s Soccer';	student_club
SELECT      (SUM(CASE WHEN type = 'Community Service' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS percentage FROM      event WHERE      event_date BETWEEN '2019-01-01' AND '2019-12-31';	student_club
SELECT ex.cost  FROM event AS e  INNER JOIN budget AS b ON e.event_id = b.link_to_event  INNER JOIN expense AS ex ON b.budget_id = ex.link_to_budget  WHERE e.event_name = 'September Speaker' AND ex.expense_description = 'Posters';	student_club
SELECT t_shirt_size FROM member GROUP BY t_shirt_size HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT t_shirt_size, COUNT(*) as count FROM member GROUP BY t_shirt_size));	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.status = 'Closed' AND b.remaining < 0 ORDER BY b.remaining ASC LIMIT 1;	student_club
SELECT T3.expense_description AS "Type of Expenses", SUM(T3.cost) AS total_value FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event INNER JOIN expense AS T3 ON T2.budget_id = T3.link_to_budget WHERE T1.event_name = 'October Meeting' AND T3.approved = 'Approved' GROUP BY T3.expense_description	student_club
SELECT      b.category,     SUM(b.amount) AS total_budgeted_amount FROM      budget b JOIN      event e ON b.link_to_event = e.event_id WHERE      e.event_name = 'April Speaker' GROUP BY      b.category ORDER BY      total_budgeted_amount ASC;	student_club
SELECT MAX(amount) FROM budget WHERE category = 'Food';	student_club
SELECT amount FROM budget WHERE category = 'Advertisement' ORDER BY amount DESC LIMIT 3;	student_club
SELECT SUM(cost) AS total_parking_cost FROM expense WHERE expense_description = 'Parking';	student_club
SELECT SUM(cost) AS total_expense FROM expense WHERE expense_date = '2019-08-20';	student_club
SELECT m.first_name || ' ' || m.last_name AS full_name, SUM(e.cost) AS total_cost  FROM member m  LEFT JOIN expense e ON m.member_id = e.link_to_member  WHERE e.link_to_member = 'rec4BLdZHS2Blfp4v'  GROUP BY m.first_name, m.last_name;	student_club
SELECT T1.expense_description FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Sacha' AND T2.last_name = 'Harrison'	student_club
SELECT T1.expense_description  FROM expense AS T1  INNER JOIN member AS T2  ON T1.link_to_member = T2.member_id  WHERE T2.t_shirt_size = 'X-Large';	student_club
SELECT DISTINCT T1.zip FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.cost < 50	student_club
SELECT m.major_name FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Phillip' AND member.last_name = 'Cullen';	student_club
SELECT T1.position  FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Business';	student_club
SELECT COUNT(member.member_id)  FROM member  INNER JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Business' AND member.t_shirt_size = 'Medium';	student_club
SELECT DISTINCT e.type  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  WHERE b.remaining > 30;	student_club
SELECT DISTINCT b.category FROM event e INNER JOIN budget b ON e.event_id = b.link_to_event WHERE e.location = 'MU 215';	student_club
SELECT type FROM event WHERE event_date = '2020-03-24T12:00:00';	student_club
SELECT T1.major_name FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.position = 'Vice President'	student_club
SELECT      (SUM(CASE WHEN m.major_name = 'Business' THEN 1 ELSE 0 END) / COUNT(*) * 100) AS percentage_business_majors FROM member JOIN major ON member.link_to_major = major.major_id;	student_club
SELECT type FROM event WHERE location = 'MU 215';	student_club
SELECT COUNT(*) FROM income WHERE amount = 50;	student_club
SELECT COUNT(*) FROM member WHERE position = 'Member' AND t_shirt_size = 'X-Large';	student_club
SELECT COUNT(*) FROM major WHERE college = 'College of Agriculture and Applied Sciences' AND department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT m.last_name, ma.department, ma.college  FROM member m  INNER JOIN major ma ON m.link_to_major = ma.major_id  WHERE ma.major_name = 'Environmental Engineering';	student_club
SELECT T1.category FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.location = 'MU 215' AND T2.type = 'Guest Speaker' AND T1.spent = 0	student_club
To list the city and state of members enrolled under the Electrical and Computer Engineering department, we join the `member`, `major`, and `zip_code` tables.   We filter for members with position 'Member' and the specific department.  SELECT z.city, z.short_state FROM zip_code z INNER JOIN member m ON z.zip_code = m.zip INNER JOIN major ma ON m.link_to_major = ma.major_id WHERE m.position = 'Member' AND ma.department = 'Electrical and Computer Engineering';	student_club
SELECT e.event_name FROM attendance a INNER JOIN event e ON a.link_to_event = e.event_id INNER JOIN member m ON a.link_to_member = m.member_id WHERE e.type = 'Social' AND e.location = '900 E. Washington St' AND m.position = 'Vice President';	student_club
SELECT m.last_name, m.position  FROM expense e  INNER JOIN member m  ON e.link_to_member = m.member_id  WHERE e.expense_description = 'Pizza' AND e.expense_date = '2019-09-10';	student_club
SELECT m.last_name  FROM member m  INNER JOIN attendance a ON m.member_id = a.link_to_member  INNER JOIN event e ON a.link_to_event = e.event_id  WHERE e.event_name = 'Women's Soccer' AND m.position = 'Member';	student_club
SELECT      (SUM(CASE WHEN EXISTS (         SELECT 1 FROM income i WHERE i.member_id = m.member_id AND i.amount = 50     ) THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS percentage FROM member m JOIN major mj ON m.major_id = mj.major_id WHERE m.t_shirt_size = 'Medium'     AND m.position = 'Member'     AND mj.name LIKE '%Student_Club%';	student_club
SELECT DISTINCT state FROM zip_code WHERE type = 'PO Box';	student_club
SELECT zip_code FROM zip_code WHERE type = 'PO Box' AND state = 'Puerto Rico' AND county = 'San Juan Municipio';	student_club
SELECT event_name FROM event WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20';	student_club
SELECT DISTINCT T1.link_to_event  FROM attendance AS T1  INNER JOIN income AS T2  ON T1.link_to_member = T2.link_to_member  WHERE T2.amount > 50;	student_club
SELECT DISTINCT T1.first_name, T1.last_name, T2.link_to_event  FROM member AS T1  LEFT JOIN attendance AS T2 ON T1.member_id = T2.link_to_member  WHERE T1.member_id IN (     SELECT link_to_member      FROM expense      WHERE approved = 'true'      AND expense_date BETWEEN '2019-01-10' AND '2019-11-19' )	student_club
SELECT T2.college FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Katy' AND T1.link_to_major = 'rec1N0upiVLy5esTO';	student_club
SELECT T1.phone FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Business' AND T2.college = 'College of Agriculture and Applied Sciences';	student_club
SELECT DISTINCT m.email  FROM expense e  INNER JOIN member m  ON e.link_to_member = m.member_id  WHERE e.expense_date BETWEEN '2019-09-10' AND '2019-11-19'    AND e.cost > 20;	student_club
SELECT COUNT(m.member_id) FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'education' AND ma.college = 'College of Education & Human Services';	student_club
SELECT      (CAST(COUNT(DISTINCT CASE WHEN b.remaining < 0 THEN e.event_id END) AS FLOAT) / COUNT(e.event_id)) * 100 AS percentage_over_budget FROM event e LEFT JOIN budget b ON e.event_id = b.link_to_event;	student_club
SELECT event_id, location, status FROM event WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31';	student_club
SELECT * FROM expense WHERE cost > 50;	student_club
SELECT first_name || last_name AS full_name FROM member WHERE t_shirt_size = 'X-Large';	student_club
SELECT (SUM(CASE WHEN type = 'PO Box' THEN 1 ELSE 0 END) / COUNT(zip_code)) * 100 FROM zip_code;	student_club
SELECT e.event_name, e.location  FROM event e  INNER JOIN budget b  ON e.event_id = b.link_to_event  WHERE b.remaining > 0;	student_club
SELECT DISTINCT e.event_name, e.event_date  FROM expense ex INNER JOIN budget b ON ex.link_to_budget = b.budget_id INNER JOIN event e ON b.link_to_event = e.event_id WHERE ex.expense_description = 'Pizza' AND ex.cost > 50 AND ex.cost < 100;	student_club
SELECT T1.first_name, T1.last_name, T3.major_name FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member INNER JOIN major AS T3 ON T1.link_to_major = T3.major_id WHERE T2.cost > 100	student_club
WITH event_income_counts AS (     SELECT          e.event_id,         COUNT(i.id) as income_count     FROM event e     LEFT JOIN attendance a ON e.event_id = a.link_to_event     LEFT JOIN member m ON a.link_to_member = m.member_id     LEFT JOIN income i ON m.member_id = i.link_to_member     GROUP BY e.event_id ) SELECT      SPLIT_PART(e.location, ',', 1) AS city,     TRIM(SPLIT_PART(e.location, ',', 2)) AS country FROM event e JOIN event_income_counts cic ON e.event_id = cic.event_id WHERE cic.income_count > 40;	student_club
SELECT T.member_id, SUM(E.cost) AS total_amount FROM expense E JOIN budget B ON E.link_to_budget = B.budget_id JOIN event Ev ON B.link_to_event = Ev.event_id WHERE E.link_to_member IN (   SELECT E.link_to_member   FROM expense E   JOIN budget B ON E.link_to_budget = B.budget_id   JOIN event Ev ON B.link_to_event = Ev.event_id   GROUP BY E.link_to_member   HAVING COUNT(DISTINCT Ev.event_id) > 1 ) GROUP BY T.member_id ORDER BY total_amount DESC LIMIT 1;	student_club
SELECT      SUM(e.cost) / COUNT(DISTINCT bud.link_to_event) AS average_amount_paid FROM member m JOIN expense e ON m.member_id = e.link_to_member JOIN budget bud ON e.link_to_budget = bud.budget_id WHERE m.position != 'Member';	student_club
WITH parking_costs AS (     SELECT          e.event_id,         e.event_name,         COALESCE(SUM(b.amount), 0) AS total_parking_cost     FROM          events e     LEFT JOIN          budget b ON e.event_id = b.event_id AND b.category = 'Parking'     GROUP BY          e.event_id, e.event_name ), average_parking_cost AS (     SELECT          AVG(total_parking_cost) AS avg_cost     FROM          parking_costs ) SELECT      pc.event_name,     pc.total_parking_cost FROM      parking_costs pc WHERE      pc.total_parking_cost < (SELECT avg_cost FROM average_parking_cost);	student_club
SELECT (SUM(e.cost) * 100 / COUNT(ev.event_id)) FROM expense e INNER JOIN budget b ON e.link_to_budget = b.budget_id INNER JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.type = 'Meeting'	student_club
SELECT T1.budget_id FROM budget AS T1 INNER JOIN expense AS T2 ON T1.link_to_event = T2.link_to_budget WHERE T2.expense_description = 'Water, chips, cookies' ORDER BY T2.cost DESC LIMIT 1;	student_club
SELECT      m.first_name || ' ' || m.last_name AS full_name,     MAX(e.cost) AS max_spending FROM      member m JOIN      expense e ON m.member_id = e.link_to_member GROUP BY      m.member_id, m.first_name, m.last_name ORDER BY      max_spending DESC LIMIT 5;	student_club
SELECT T1.first_name, T1.last_name, T1.phone FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member GROUP BY T1.member_id HAVING MIN(T2.cost) > (SELECT AVG(cost) FROM expense);	student_club
SELECT (SUM(IIF(state = 'New Jersey', 1, 0)) / COUNT(position = 'Member')) - (SUM(IIF(state = 'Vermont', 1, 0)) / COUNT(position = 'Member')) FROM member	student_club
SELECT M.major_name, M.department FROM member  INNER JOIN major M ON member.link_to_major = M.major_id  WHERE member.first_name = 'Garrett' AND member.last_name = 'Gerke';	student_club
SELECT first_name || ' ' || last_name AS full_name, cost FROM member INNER JOIN expense ON member.member_id = expense.link_to_member WHERE expense.expense_description = 'Water, Veggie tray, supplies';	student_club
SELECT T1.last_name, T1.phone FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Elementary Education'	student_club
SELECT T2.category, T2.amount FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'January Speaker';	student_club
SELECT T1.event_name  FROM event AS T1  INNER JOIN budget AS T2  ON T1.event_id = T2.link_to_event  WHERE T2.category = 'Food';	student_club
SELECT m.first_name, m.last_name, i.amount FROM income AS i INNER JOIN member AS m ON i.link_to_member = m.member_id WHERE i.date_received = '9/9/2019'	student_club
SELECT b.category  FROM expense e  INNER JOIN budget b ON e.link_to_budget = b.budget_id  WHERE e.expense_description = 'Posters';	student_club
SELECT m.first_name AS full_name, mj.college AS college  FROM member m  INNER JOIN major mj  ON m.link_to_major = mj.major_id  WHERE m.position = 'Secretary';	student_club
SELECT      COALESCE(e.event_name, 'Total') AS event_name,     SUM(b.spent) AS total_spent FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE b.category = 'Speaker Gifts' GROUP BY ROLLUP(e.event_name);	student_club
SELECT T2.city FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Garrett' AND T1.last_name = 'Gerke';	student_club
SELECT m.first_name, m.last_name, m.position FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE z.city = 'Lincolnton' AND z.state = 'North Carolina' AND z.zip_code = 28092;	student_club
SELECT COUNT(*) FROM gasstations WHERE country = 'CZE' AND segment = 'Premium';	debit_card_specializing
SELECT COUNT(CASE WHEN Currency = 'EUR' THEN CustomerID END) / COUNT(CASE WHEN Currency = 'CZK' THEN CustomerID END) AS EUR_CZK_ratio FROM customers	debit_card_specializing
SELECT y.CustomerID, SUM(y.Consumption) as TotalConsumption FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Segment = 'LAM'   AND y.Date LIKE '2012%' GROUP BY y.CustomerID HAVING SUM(y.Consumption) = (     SELECT MIN(TotalConsumption)     FROM (         SELECT y.CustomerID, SUM(y.Consumption) as TotalConsumption         FROM yearmonth y         JOIN customers c ON y.CustomerID = c.CustomerID         WHERE c.Segment = 'LAM'           AND y.Date LIKE '2012%'         GROUP BY y.CustomerID     ) AS subquery )	debit_card_specializing
SELECT AVG(ym.Consumption) AS AverageMonthlyConsumption FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Segment = 'SME' AND ym.Date LIKE '2013%';	debit_card_specializing
SELECT CustomerID, SUM(Consumption) AS TotalConsumption FROM yearmonth WHERE Date BETWEEN '201101' AND '201112' AND Currency = 'CZK' GROUP BY CustomerID ORDER BY TotalConsumption DESC	debit_card_specializing
SELECT COUNT(DISTINCT c.CustomerID) FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'KAM' AND y.Date BETWEEN '201201' AND '201212' AND y.Consumption < 30000;	debit_card_specializing
SELECT      SUM(CASE          WHEN c.Currency = 'CZK' THEN y.Consumption          ELSE 0      END) -      SUM(CASE          WHEN c.Currency = 'EUR' THEN y.Consumption          ELSE 0      END) AS ConsumptionDifference FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE STRFTIME('%Y', y.Date) = '2012';	debit_card_specializing
SELECT      substr(ym.Date, 1, 4) AS Year,     SUM(ym.Consumption) AS Total_Consumption FROM      yearmonth ym JOIN      customers c ON ym.CustomerID = c.CustomerID WHERE      c.Currency = 'EUR' GROUP BY      substr(ym.Date, 1, 4) ORDER BY      Total_Consumption DESC;	debit_card_specializing
SELECT c.Segment, SUM(ym.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID GROUP BY c.Segment ORDER BY TotalConsumption ASC;	debit_card_specializing
SELECT      substr(ym.Date, 1, 4) AS Year,     SUM(ym.Consumption) AS TotalConsumption FROM      yearmonth ym JOIN      customers c ON ym.CustomerID = c.CustomerID WHERE      c.Currency = 'CZK' GROUP BY      substr(ym.Date, 1, 4) ORDER BY      TotalConsumption DESC;	debit_card_specializing
SELECT      EXTRACT(MONTH FROM sale_date) AS sales_month,     SUM(amount) AS total_sales FROM      sales WHERE      EXTRACT(YEAR FROM sale_date) = 2023   GROUP BY      EXTRACT(MONTH FROM sale_date) ORDER BY      total_sales DESC LIMIT 1;	debit_card_specializing
WITH CustomerTotals AS (     SELECT c.CustomerID, c.Segment, SUM(ym.Consumption) as TotalConsumption     FROM customers c     JOIN yearmonth ym ON c.CustomerID = ym.CustomerID     WHERE ym.Date LIKE '2013%'     GROUP BY c.CustomerID, c.Segment ), MinPerSegment AS (     SELECT Segment, MIN(TotalConsumption) as MinTotal     FROM CustomerTotals     GROUP BY Segment ), CustomerMins AS (     SELECT ct.CustomerID, ct.Segment, ct.TotalConsumption     FROM CustomerTotals ct     JOIN MinPerSegment mps ON ct.Segment = mps.Segment AND ct.TotalConsumption = mps.MinTotal ), SegmentAverages AS (     SELECT Segment, AVG(TotalConsumption) as AvgMinConsumption     FROM CustomerMins     GROUP BY Segment ) SELECT      (SMEA - LAMA) as SME_minus_LAM,     (LAMA - SMEA) as LAM_minus_SME FROM (     SELECT          MAX(CASE WHEN Segment = 'SME' THEN AvgMinConsumption END) as SMEA,         MAX(CASE WHEN Segment = 'LAM' THEN AvgMinConsumption END) as LAMA     FROM SegmentAverages ) AS avgs;	debit_card_specializing
WITH YearlyConsumption AS (     SELECT          c.Segment,         substr(ym.Date, 1,4) as Year,         SUM(ym.Consumption) as TotalConsumption     FROM          customers c     JOIN          yearmonth ym ON c.CustomerID = ym.CustomerID     WHERE          c.Currency = 'EUR'     GROUP BY          c.Segment, substr(ym.Date, 1,4) ), SegmentTotals AS (     SELECT          Segment,         SUM(CASE WHEN Year = '2012' THEN TotalConsumption ELSE 0 END) as Y2012,         SUM(CASE WHEN Year = '2013' THEN TotalConsumption ELSE 0 END) as Y2013     FROM          YearlyConsumption     GROUP BY          Segment ) SELECT      Segment,     ((Y2013 - Y2012) / Y2013) * 100 as PercentageIncrease FROM      SegmentTotals;	debit_card_specializing
SELECT SUM(Consumption) AS TotalConsumption FROM yearmonth WHERE CustomerID = 6 AND Date BETWEEN '201308' AND '201311';	debit_card_specializing
SELECT      (SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Value for money') -      (SELECT COUNT(*) FROM gasstations WHERE Country = 'SVK' AND Segment = 'Value for money');	debit_card_specializing
SELECT IFNULL((SELECT Consumption FROM yearmonth WHERE CustomerID = 7 AND Date = '201304'), 0) - (SELECT Consumption FROM yearmonth WHERE CustomerID = 5 AND Date = '201304') AS Difference;	debit_card_specializing
SELECT      (EUR - CZK) AS More_SMEs_EUR_Than_CZK FROM (     SELECT          COUNT(CASE WHEN Currency = 'CZK' THEN 1 END) AS CZK,         COUNT(CASE WHEN Currency = 'EUR' THEN 1 END) AS EUR     FROM customers     WHERE Segment = 'SME' );	debit_card_specializing
SELECT c.CustomerID, y.Consumption  FROM customers c  JOIN yearmonth y ON c.CustomerID = y.CustomerID  WHERE c.Segment = 'LAM' AND c.Currency = 'EUR' AND y.Date = '201310' ORDER BY y.Consumption DESC  LIMIT 1;	debit_card_specializing
SELECT      CustomerID,      SUM(Consumption) AS TotalConsumption FROM      yearmonth GROUP BY      CustomerID ORDER BY      TotalConsumption DESC;	debit_card_specializing
SELECT SUM(y.Consumption) FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'LAM' AND y.Date = '201305';	debit_card_specializing
SELECT ROUND(     (         (SELECT COUNT(*) FROM yearmonth WHERE Consumption > 46.73 AND CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'LAM'))         /          (SELECT COUNT(CustomerID) FROM customers WHERE Segment = 'LAM')     ) * 100 )	debit_card_specializing
SELECT Country, COUNT(*) as total  FROM gasstations  WHERE Segment = 'Value for money'  GROUP BY Country  ORDER BY total DESC;	debit_card_specializing
SELECT      (COUNT(CASE WHEN Currency = 'EUR' THEN 1 ELSE NULL END) * 100.0 / COUNT(*)) AS Percentage FROM      customers WHERE      Segment = 'LAM';	debit_card_specializing
SELECT      ((SELECT COUNT(DISTINCT CustomerID) FROM yearmonth WHERE Date = '201202' AND Consumption > 528.3) * 100.0 /       (SELECT COUNT(DISTINCT CustomerID) FROM yearmonth WHERE Date = '201202')) AS Percentage;	debit_card_specializing
SELECT      (COUNT(CASE WHEN Segment = 'Premium' THEN GasStationID END) / COUNT(GasStationID)) * 100  FROM gasstations  WHERE Country = 'SVK';	debit_card_specializing
SELECT CustomerID FROM yearmonth WHERE Date = '201309' AND Consumption = (SELECT MAX(Consumption) FROM yearmonth WHERE Date = '201309');	debit_card_specializing
SELECT Segment, SUM(Consumption) AS TotalConsumption FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE Date = '201309' GROUP BY Segment ORDER BY TotalConsumption ASC LIMIT 1;	debit_card_specializing
SELECT c.CustomerID FROM yearmonth y JOIN customers c ON c.CustomerID = y.CustomerID WHERE y.Date = '201206' AND c.Segment = 'SME' ORDER BY y.Consumption ASC LIMIT 1;	debit_card_specializing
SELECT MAX(Consumption) FROM yearmonth WHERE substr(Date, 1, 4) = '2012';	debit_card_specializing
SELECT MAX(y.Consumption)  FROM yearmonth y  WHERE y.CustomerID IN (SELECT c.CustomerID FROM customers c WHERE c.Currency = 'EUR');	debit_card_specializing
SELECT DISTINCT T2.Description  FROM (     SELECT T.ProductID      FROM transactions_1k T      INNER JOIN yearmonth Y      ON T.CustomerID = Y.CustomerID      WHERE Y.Date LIKE '201309' ) AS T1  INNER JOIN products T2  ON T1.ProductID = T2.ProductID;	debit_card_specializing
SELECT DISTINCT g.Country  FROM gasstations g WHERE g.GasStationID IN (     SELECT t.GasStationID      FROM transactions_1k t     WHERE strftime('%Y%m', t.Date) = '201306' );	debit_card_specializing
SELECT DISTINCT g.ChainID FROM gasstations g WHERE g.GasStationID IN (     SELECT t.GasStationID     FROM transactions_1k t     JOIN customers c ON t.CustomerID = c.CustomerID     WHERE c.Currency = 'EUR' )	debit_card_specializing
SELECT DISTINCT p.Description FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID AND c.Currency = 'EUR' JOIN products p ON t.ProductID = p.ProductID;	debit_card_specializing
SELECT AVG(Amount * Price) AS average_total_price FROM transactions_1k WHERE Date LIKE '2012-01%' AND Amount IS NOT NULL AND Price IS NOT NULL;	debit_card_specializing
SELECT COUNT(DISTINCT c.CustomerID) FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Currency = 'EUR' AND y.Consumption > 1000;	debit_card_specializing
SELECT T3.Description  FROM transactions_1k AS T1  INNER JOIN gasstations AS T2  ON T1.GasStationID = T2.GasStationID  WHERE T2.Country = 'CZE'  INNER JOIN products AS T3  ON T1.ProductID = T3.ProductID;	debit_card_specializing
SELECT T1.Time FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.ChainID = 11	debit_card_specializing
SELECT COUNT(t.TransactionID) FROM transactions_1k t INNER JOIN gasstations gs ON t.GasStationID = gs.GasStationID WHERE gs.Country = 'CZE' AND t.Price > 1000;	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k  INNER JOIN gasstations  ON transactions_1k.GasStationID = gasstations.GasStationID  WHERE gasstations.Country = 'CZE' AND transactions_1k.Date > '2012-01-01';	debit_card_specializing
SELECT AVG(t.Amount * t.Price) AS AverageTotalPrice FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE';	debit_card_specializing
SELECT AVG(t.Amount * t.Price) AS average_total_price FROM transactions_1k t INNER JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR';	debit_card_specializing
SELECT CustomerID, SUM(Amount) AS Total FROM transactions_1k WHERE Date = '2012-08-25' GROUP BY CustomerID ORDER BY Total DESC LIMIT 1	debit_card_specializing
SELECT T2.Country  FROM transactions_1k AS T1  INNER JOIN gasstations AS T2  ON T1.GasStationID = T2.GasStationID  WHERE T1.Date = '2012-08-25'  AND T1.CustomerID IS NOT NULL  ORDER BY T1.Time ASC  LIMIT 1;	debit_card_specializing
SELECT c.Currency  FROM customers c  INNER JOIN transactions_1k t  ON c.CustomerID = t.CustomerID  WHERE t.Date = '2012-08-24' AND t.Time = '16:25:00';	debit_card_specializing
SELECT T1.Segment FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '2012-08-23' AND T2.Time = '21:20:00';	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE t.Date = '2012-08-26' AND t.Time < '13:00:00' AND c.Currency = 'CZK';	debit_card_specializing
SELECT Segment FROM customers WHERE CustomerID = (SELECT MIN(CustomerID) FROM customers);	debit_card_specializing
SELECT T2.Country FROM gasstations AS T2 INNER JOIN transactions_1k AS T1 ON T2.GasStationID = T1.GasStationID WHERE T1.Date = '2012-08-24' AND T1.Time = '12:42:00'	debit_card_specializing
SELECT ProductID FROM transactions_1k WHERE Date = '2012-08-23' AND Time = '21:20:00';	debit_card_specializing
SELECT T2.Consumption, T2.Date  FROM yearmonth AS T2 WHERE T2.CustomerID = (     SELECT T1.CustomerID      FROM transactions_1k AS T1      WHERE T1.Amount = 124.05 AND T1.Date = '2012-08-24' ) AND T2.Date LIKE '201201%';	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k  JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID  WHERE Date = '2012-08-26' AND Time BETWEEN '08:00:00' AND '09:00:00' AND Country = 'CZE';	debit_card_specializing
SELECT T1.Currency FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '201306' AND T2.Consumption = 214582.17	debit_card_specializing
SELECT Country FROM gasstations WHERE GasStationID IN (SELECT GasStationID FROM transactions_1k WHERE CardID = 667467)	debit_card_specializing
SELECT gs.Country  FROM transactions_1k t JOIN gasstations gs ON t.GasStationID = gs.GasStationID WHERE t.Date = '2012-08-24' AND t.Amount = 548.4;	debit_card_specializing
SELECT      ( ( SELECT COUNT(DISTINCT c.CustomerID) FROM customers c INNER JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE t.Date = '2012-08-25' AND c.Currency = 'EUR' ) / ( SELECT COUNT(DISTINCT CustomerID) FROM transactions_1k WHERE Date = '2012-08-25' ) ) * 100;	debit_card_specializing
SELECT      (sum_2012 - sum_2013) / sum_2012 AS decrease_rate FROM (     SELECT          (SELECT SUM(Consumption) FROM yearmonth WHERE CustomerID = (SELECT CustomerID FROM transactions_1k WHERE Amount = 634.8 AND Date = '2012-08-25') AND Date LIKE '2012%') AS sum_2012,         (SELECT SUM(Consumption) FROM yearmonth WHERE CustomerID = (SELECT CustomerID FROM transactions_1k WHERE Amount = 634.8 AND Date = '2012-08-25') AND Date LIKE '2013%') AS sum_2013 ) AS subquery;	debit_card_specializing
SELECT      t.GasStationID,     SUM(t.Amount * t.Price) AS TotalRevenue FROM      transactions_1k t WHERE      t.Amount IS NOT NULL AND t.Price IS NOT NULL GROUP BY      t.GasStationID ORDER BY      TotalRevenue DESC;	debit_card_specializing
SELECT      100 * (         SUM(CASE WHEN Segment = 'Premium' THEN 1 ELSE 0 END) /          COUNT(GasStationID)     ) AS PercentageOfPremium FROM gasstations WHERE Country = 'SVK';	debit_card_specializing
SELECT Amount FROM transactions_1k WHERE CustomerID = 38508 AND GasStationID IS NOT NULL;  SELECT Amount FROM transactions_1k WHERE CustomerID = 38508 AND Date = '201201' AND GasStationID IS NOT NULL;	debit_card_specializing
SELECT p.ProductID, p.Description  FROM transactions_1k t INNER JOIN products p ON t.ProductID = p.ProductID GROUP BY p.ProductID, p.Description ORDER BY SUM(t.Amount) DESC LIMIT 5;	debit_card_specializing
SELECT    (Subquery.SumPrice / Subquery.SumAmount) AS AvgPricePerItem,   c.Currency FROM (   SELECT      t.CustomerID,     SUM(t.Price) AS SumPrice,     SUM(t.Amount) AS SumAmount,     SUM(t.Price * t.Amount) AS TotalSpending   FROM transactions_1k t   GROUP BY t.CustomerID ) AS Subquery JOIN customers c ON Subquery.CustomerID = c.CustomerID ORDER BY Subquery.TotalSpending DESC LIMIT 1;	debit_card_specializing
SELECT Country FROM gasstations WHERE GasStationID = (   SELECT GasStationID FROM transactions_1k    WHERE ProductID = 2    ORDER BY (Price / Amount) DESC LIMIT 1 );	debit_card_specializing
SELECT y.CustomerID, y.Consumption FROM yearmonth y WHERE y.Date = '201208' AND y.CustomerID IN (     SELECT t.CustomerID     FROM transactions_1k t     WHERE t.ProductID = 5 AND (t.Price / t.Amount) > 29 )	debit_card_specializing
