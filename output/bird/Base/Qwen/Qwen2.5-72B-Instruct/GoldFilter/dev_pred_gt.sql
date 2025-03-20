SELECT MAX(`Free Meal Count (K-12)` / `Enrollment (K-12)`) AS highest_eligible_free_rate FROM `frpm` WHERE `County Name` = 'Alameda'	california_schools
SELECT `Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)` AS eligible_free_rate  FROM frpm  WHERE `Educational Option Type` = 'Continuation'  ORDER BY eligible_free_rate  LIMIT 3;	california_schools
SELECT s.Zip FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.`District Name` = 'Fresno County Office of Education' AND f.`Charter School (Y/N)` = 1	california_schools
SELECT s.MailStreet FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode ORDER BY f.`FRPM Count (K-12)` DESC LIMIT 1	california_schools
SELECT s.Phone  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE f.`Charter Funding Type` = 'Directly funded' AND f.`Charter School (Y/N)` = 1 AND s.OpenDate > '2000-01-01'	california_schools
SELECT COUNT(*)  FROM satscores ss  JOIN schools s  ON ss.cds = s.CDSCode  WHERE ss.AvgScrMath > 400 AND s.Virtual = 'F';	california_schools
SELECT s.School  FROM schools s  JOIN satscores ss ON s.CDSCode = ss.cds  WHERE ss.NumTstTakr > 500 AND s.Magnet = 1	california_schools
SELECT s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds ORDER BY ss.NumGE1500 DESC LIMIT 1	california_schools
SELECT s.NumTstTakr FROM satscores s JOIN frpm f ON s.cds = f.CDSCode WHERE f.`FRPM Count (K-12)` = (SELECT MAX(`FRPM Count (K-12)`) FROM frpm)	california_schools
SELECT COUNT(DISTINCT f.CDSCode)  FROM frpm f  JOIN satscores s ON f.`School Code` = s.cds  WHERE s.AvgScrMath > 560 AND f.`Charter Funding Type` = 'Directly funded'	california_schools
SELECT `FRPM Count (Ages 5-17)` FROM `frpm` WHERE `CDSCode` = (SELECT `cds` FROM `satscores` WHERE `AvgScrRead` = (SELECT MAX(`AvgScrRead`) FROM `satscores`))	california_schools
SELECT CDSCode FROM frpm WHERE `Enrollment (K-12)` + `Enrollment (Ages 5-17)` > 500	california_schools
SELECT MAX(f.`Free Meal Count (Ages 5-17)` / f.`Enrollment (Ages 5-17)`)  FROM frpm f  JOIN satscores s  ON f.CDSCode = s.cds  WHERE (s.NumGE1500 / s.NumTstTakr) > 0.3;	california_schools
SELECT s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.NumTstTakr > 0 ORDER BY (ss.NumGE1500 * 1.0 / ss.NumTstTakr) DESC LIMIT 3;	california_schools
SELECT s.NCESSchool, f.`Enrollment (Ages 5-17)`  FROM frpm f  JOIN schools s ON f.CDSCode = s.CDSCode  ORDER BY f.`Enrollment (Ages 5-17)` DESC  LIMIT 5;	california_schools
SELECT s.District, MAX(ss.AvgScrRead)  FROM satscores ss  JOIN schools s ON ss.cds = s.CDSCode  WHERE s.StatusType = 'Active'  GROUP BY s.District  ORDER BY MAX(ss.AvgScrRead) DESC  LIMIT 1;	california_schools
SELECT COUNT(*)  FROM satscores AS ss  JOIN schools AS s  ON ss.cds = s.CDSCode  WHERE s.County = 'Alameda' AND ss.NumTstTakr < 100 AND s.StatusType = 'Active'	california_schools
SELECT s.CDSCode, s.CharterNum, ss.AvgScrWrite  FROM schools s  JOIN satscores ss ON s.CDSCode = ss.cds  WHERE ss.AvgScrWrite > 499 AND s.CharterNum IS NOT NULL  ORDER BY ss.AvgScrWrite DESC;	california_schools
SELECT COUNT(DISTINCT s.CDSCode)  FROM schools s  JOIN satscores ss ON s.CDSCode = ss.cds  WHERE s.County = 'Fresno' AND s.FundingType = 'Direct' AND ss.NumTstTakr <= 250;	california_schools
SELECT s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds ORDER BY ss.AvgScrMath DESC LIMIT 1	california_schools
SELECT COUNT(*) FROM `frpm` AS f JOIN `schools` AS s ON f.CDSCode = s.CDSCode WHERE s.County = 'Amador' AND f.Low Grade = '9' AND f.High Grade = '12'	california_schools
SELECT COUNT(*) FROM `frpm` WHERE `County Name` = 'Los Angeles' AND `Free Meal Count (K-12)` > 500 AND `Free Meal Count (K-12)` < 700	california_schools
SELECT sname FROM satscores WHERE cname = 'Contra Costa' ORDER BY NumTstTakr DESC LIMIT 1	california_schools
SELECT s.School, s.StreetAbr FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE ABS(f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`) > 30	california_schools
SELECT `School Name`  FROM `frpm`  JOIN `satscores` ON `frpm.CDSCode` = `satscores.cds`  WHERE (`Free Meal Count (K-12)` / `Enrollment (K-12)`) > 0.1 AND `NumGE1500` IS NOT NULL AND `NumGE1500` > 0	california_schools
SELECT s.`sname`, f.`Charter Funding Type`  FROM `satscores` s  JOIN `frpm` f ON s.`cds` = f.`CDSCode`  WHERE f.`District Name` = 'Riverside'  GROUP BY s.`sname`, f.`Charter Funding Type`  HAVING AVG(s.`AvgScrMath`) > 400;	california_schools
SELECT s.`School Name`, s.`Street`, s.`City`, s.`State`, s.`Zip` FROM `frpm` f JOIN `schools` s ON f.`CDSCode` = s.`CDSCode` WHERE s.`County` = 'Monterey' AND f.`Free Meal Count (Ages 5-17)` > 800 AND s.`School Type` = 'High School'	california_schools
SELECT s.School, ss.AvgScrWrite, s.Phone  FROM satscores ss  JOIN schools s ON ss.cds = s.CDSCode  WHERE s.OpenDate > '1991-01-01' OR s.ClosedDate < '2000-01-01'	california_schools
SELECT s.School, s.DOC  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE s.FundingType = 'Locally funded'  AND (f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`) > (     SELECT AVG(`Enrollment (K-12)` - `Enrollment (Ages 5-17)`)      FROM frpm      JOIN schools ON frpm.CDSCode = schools.CDSCode      WHERE schools.FundingType = 'Locally funded' )	california_schools
SELECT s.OpenDate  FROM frpm f  JOIN schools s ON f.CDSCode = s.CDSCode  WHERE f.`Enrollment (K-12)` = (SELECT MAX(`Enrollment (K-12)`) FROM frpm)	california_schools
SELECT s.City, f.`Enrollment (K-12)`  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  ORDER BY f.`Enrollment (K-12)` ASC  LIMIT 5;	california_schools
SELECT (`Free Meal Count (K-12)` / `Enrollment (K-12)`) AS eligible_free_rate  FROM `frpm`  ORDER BY `Enrollment (K-12)` DESC  LIMIT 10, 2	california_schools
SELECT s.CDSCode, f.`FRPM Count (K-12)` / f.`Enrollment (K-12)` AS FRPM_Rate FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.SOC = '66' ORDER BY f.`FRPM Count (K-12)` DESC LIMIT 5	california_schools
SELECT s.Website, f.`School Name`  FROM frpm f  JOIN schools s ON f.CDSCode = s.CDSCode  WHERE f.`Free Meal Count (Ages 5-17)` BETWEEN 1900 AND 2000;	california_schools
SELECT (T1.`Free Meal Count (Ages 5-17)` / T1.`Enrollment (Ages 5-17)`) AS free_rate FROM `frpm` AS T1 INNER JOIN `schools` AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.AdmFName1 = 'Kacey' AND T2.AdmLName1 = 'Gibson'	california_schools
SELECT s.AdmEmail1 FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.`Charter School (Y/N)` = 1 ORDER BY f.`Enrollment (K-12)` ASC LIMIT 1	california_schools
SELECT s.AdmFName1, s.AdmLName1, s.AdmFName2, s.AdmLName2, s.AdmFName3, s.AdmLName3  FROM satscores ss  JOIN schools s ON ss.cds = s.CDSCode  WHERE ss.NumGE1500 = (SELECT MAX(NumGE1500) FROM satscores)	california_schools
SELECT s.Street, s.City, s.Zip, s.State  FROM schools s  JOIN satscores ss ON s.CDSCode = ss.cds  WHERE (ss.NumGE1500 * 1.0 / ss.NumTstTakr) =      (SELECT MIN(NumGE1500 * 1.0 / NumTstTakr)       FROM satscores       WHERE NumTstTakr > 0)	california_schools
SELECT `Website` FROM `schools` WHERE `CDSCode` IN (SELECT `cds` FROM `satscores` WHERE `NumTstTakr` BETWEEN 2000 AND 3000) AND `County` = 'Los Angeles'	california_schools
SELECT AVG(NumTstTakr)  FROM satscores  JOIN schools ON satscores.cds = schools.CDSCode  WHERE schools.County = 'Fresno' AND YEAR(schools.OpenDate) = 1980;	california_schools
SELECT s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.District = 'Fresno Unified' ORDER BY ss.AvgScrRead ASC LIMIT 1;	california_schools
SELECT s.School FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.Virtual = 'F' AND s.School IN (     SELECT s.School     FROM schools s     JOIN satscores ss ON s.CDSCode = ss.cds     WHERE s.Virtual = 'F'     GROUP BY s.County     ORDER BY AVG(ss.AvgScrRead) DESC     LIMIT 5 )	california_schools
SELECT EdOpsName FROM schools WHERE CDSCode = (SELECT cds FROM satscores WHERE AvgScrMath = (SELECT MAX(AvgScrMath) FROM satscores))	california_schools
SELECT AVG(ss.AvgScrMath) AS AvgMathScore, s.County  FROM satscores ss  JOIN schools s ON ss.cds = s.CDSCode  WHERE ss.cds IN (     SELECT cds      FROM satscores      WHERE AvgScrMath IS NOT NULL AND AvgScrRead IS NOT NULL AND AvgScrWrite IS NOT NULL      GROUP BY cds      ORDER BY (AVG(AvgScrMath) + AVG(AvgScrRead) + AVG(AvgScrWrite)) / 3      LIMIT 1 )  GROUP BY ss.cds, s.County;	california_schools
SELECT AVG(s.AvgScrWrite), sc.City  FROM satscores s  JOIN schools sc ON s.cds = sc.CDSCode  WHERE s.NumGE1500 = (SELECT MAX(NumGE1500) FROM satscores)  GROUP BY sc.City;	california_schools
SELECT s.School, AVG(ss.AvgScrWrite) AS AvgWritingScore FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.AdmFName1 = 'Ricci' AND s.AdmLName1 = 'Ulrich' GROUP BY s.School;	california_schools
SELECT s.School, f.`Enrollment (K-12)`  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE s.DOC = '31'  ORDER BY f.`Enrollment (K-12)` DESC  LIMIT 1;	california_schools
SELECT CAST(SUM(CASE WHEN strftime('%Y', OpenDate) = '1980' THEN 1 ELSE 0 END) AS REAL) / 12 AS MonthlyAverage FROM schools WHERE County = 'Alameda' AND DOC = '52'	california_schools
SELECT CAST(SUM(CASE WHEN DOC = '54' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN DOC = '52' THEN 1 ELSE 0 END) AS Ratio FROM schools WHERE County = 'Orange' AND StatusType = 'Merged'	california_schools
SELECT County, School, ClosedDate  FROM schools  WHERE StatusType = 'Closed'  GROUP BY County, School, ClosedDate  ORDER BY County, COUNT(School) DESC  LIMIT 1;	california_schools
SELECT s.School, s.Street AS PostalStreet FROM satscores ss JOIN schools s ON ss.cds = s.CDSCode WHERE ss.AvgScrMath = (SELECT DISTINCT AvgScrMath FROM satscores ORDER BY AvgScrMath DESC LIMIT 1 OFFSET 6) LIMIT 1;	california_schools
SELECT s.MailStreet, s.School  FROM schools s  JOIN satscores ss ON s.CDSCode = ss.cds  WHERE ss.AvgScrRead = (SELECT MIN(AvgScrRead) FROM satscores WHERE AvgScrRead IS NOT NULL)	california_schools
SELECT COUNT(*)  FROM satscores AS ss  JOIN schools AS s ON ss.cds = s.CDSCode  WHERE (ss.AvgScrRead + ss.AvgScrMath + ss.AvgScrWrite) >= 1500 AND s.MailCity = 'Lakeport'	california_schools
SELECT SUM(NumTstTakr) FROM satscores INNER JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.MailCity = 'Fresno'	california_schools
SELECT School, MailZip FROM schools WHERE AdmFName1 = 'Avetik' AND AdmLName1 = 'Atoian'	california_schools
SELECT CAST(COUNT(CASE WHEN County = 'Colusa' THEN 1 ELSE NULL END) AS REAL) / COUNT(CASE WHEN County = 'Humboldt' THEN 1 ELSE NULL END) FROM schools WHERE MailState = 'CA'	california_schools
SELECT COUNT(*)  FROM schools  WHERE MailState = 'CA' AND City = 'San Joaquin' AND StatusType = 'Active';	california_schools
SELECT s.Phone, s.Ext  FROM schools s  JOIN satscores ss ON s.CDSCode = ss.cds  WHERE ss.AvgScrWrite = (SELECT DISTINCT AvgScrWrite FROM satscores ORDER BY AvgScrWrite DESC LIMIT 1 OFFSET 332)	california_schools
SELECT School, Phone, Ext FROM schools WHERE Zip = '95203-3704'	california_schools
SELECT Website FROM schools WHERE (AdmFName1 = 'Mike' AND AdmLName1 = 'Larson') OR (AdmFName1 = 'Dante' AND AdmLName1 = 'Alvarez')	california_schools
SELECT Website FROM schools WHERE County = 'San Joaquin' AND Charter = 1 AND Virtual = 'P'	california_schools
SELECT COUNT(*) FROM schools WHERE City = 'Hickman' AND Charter = 1 AND DOC = '52'	california_schools
SELECT COUNT(s.CDSCode)  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE s.County = 'Los Angeles'  AND s.Charter = 0  AND (f.`Free Meal Count (K-12)` * 100 / f.`Enrollment (K-12)`) < 18;	california_schools
SELECT School, City, AdmFName1, AdmLName1 FROM schools WHERE Charter = 1 AND CharterNum = '00D2'	california_schools
SELECT COUNT(*) FROM `schools` WHERE `MailCity` = 'Hickman' AND `CharterNum` = '00D4'	california_schools
SELECT (COUNT(CASE WHEN FundingType = 'Locally funded' THEN 1 END) * 100.0 / COUNT(*)) AS Ratio FROM schools WHERE County = 'Santa Clara' AND Charter = 1	california_schools
SELECT COUNT(*) FROM schools WHERE FundingType = 'Directly Funded' AND County = 'Stanislaus' AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31'	california_schools
SELECT COUNT(*) FROM `schools` WHERE `City` = 'San Francisco' AND `DOCType` = 'Community College District' AND strftime('%Y', `ClosedDate`) = '1989'	california_schools
SELECT County  FROM schools  WHERE SOC = '11' AND ClosedDate BETWEEN '1980-01-01' AND '1989-12-31'  GROUP BY County  ORDER BY COUNT(*) DESC  LIMIT 1;	california_schools
SELECT NCESDist FROM schools WHERE SOC = '31'	california_schools
SELECT COUNT(*)  FROM schools  WHERE County = 'Alpine' AND StatusType IN ('Active', 'Closed') AND School LIKE '%District Community Day School%'	california_schools
SELECT `District Code` FROM `frpm` WHERE `CDSCode` IN (SELECT `CDSCode` FROM `schools` WHERE `City` = 'Fresno' AND `Magnet` = 0)	california_schools
SELECT SUM(`Enrollment (Ages 5-17)`)  FROM `frpm`  JOIN `schools` ON `frpm`.`CDSCode` = `schools`.`CDSCode`  WHERE `schools`.`City` = 'Fremont' AND `schools`.`EdOpsCode` = 'SSS' AND `frpm`.`Academic Year` = '2014-2015'	california_schools
SELECT t1.`FRPM Count (Ages 5-17)` FROM `frpm` AS t1 JOIN `schools` AS t2 ON t1.CDSCode = t2.CDSCode WHERE t2.MailStreet = 'PO Box 1040' AND t2.SOCType = 'Youth Authority Schools (Public)'	california_schools
SELECT `Low Grade` FROM `frpm` WHERE `EdOpsCode` = 'SPECON' AND `NCESDist` = '0613360' AND `CDSCode` IN (SELECT `CDSCode` FROM `schools` WHERE `NCESDist` = '0613360' AND `EdOpsCode` = 'SPECON')	california_schools
SELECT s.EILName, s.School  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE f.`County Code` = '37' AND f.`NSLP Provision Status` = 'Breakfast Provision 2'	california_schools
SELECT s.City  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE s.County = 'Merced' AND f.`NSLP Provision Status` = 'Lunch Provision 2' AND f.Low Grade = '9' AND f.High Grade = '12' AND s.EILCode = 'HS'	california_schools
SELECT s.School, (f.`FRPM Count (Ages 5-17)` / f.`Enrollment (Ages 5-17)`) * 100 AS 'Percent (%) Eligible FRPM (Ages 5-17)' FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.County = 'Los Angeles' AND s.GSserved = 'K-9'	california_schools
SELECT GSserved FROM schools WHERE City = 'Adelanto' GROUP BY GSserved ORDER BY COUNT(*) DESC LIMIT 1	california_schools
SELECT County, COUNT(*) AS NumberOfSchools FROM schools WHERE Virtual = 'F' AND County IN ('San Diego', 'Santa Barbara') GROUP BY County ORDER BY NumberOfSchools DESC LIMIT 1;	california_schools
SELECT s.`School Name`, s.`Latitude`, f.`School Type`  FROM `schools` s  JOIN `frpm` f ON s.`CDSCode` = f.`CDSCode`  ORDER BY s.`Latitude` DESC  LIMIT 1;	california_schools
SELECT s.City, f.`Low Grade`, f.`School Name`  FROM `schools` s  JOIN `frpm` f ON s.CDSCode = f.CDSCode  WHERE s.State = 'CA'  ORDER BY s.Latitude ASC  LIMIT 1;	california_schools
SELECT GSoffered FROM schools ORDER BY ABS(GSoffered) DESC LIMIT 1	california_schools
SELECT s.City, COUNT(s.CDSCode) AS NumberOfSchools FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.Magnet = 1 AND s.GSoffered = 'K-8' AND f.`NSLP Provision Status` = 'Multiple Provision Types' GROUP BY s.City;	california_schools
SELECT `AdmFName1`, `District` FROM `schools` WHERE `AdmFName1` IS NOT NULL GROUP BY `AdmFName1` ORDER BY COUNT(`AdmFName1`) DESC LIMIT 2	california_schools
SELECT `District Code`, (`Free Meal Count (K-12)` / `Enrollment (K-12)`) * 100 AS 'Percent Eligible Free (K-12)'  FROM `frpm`  JOIN `schools` ON `frpm`.`CDSCode` = `schools`.`CDSCode`  WHERE `schools`.`AdmFName1` = 'Alusine'	california_schools
SELECT `County`, `District`, `School`, `AdmLName1`  FROM `schools`  WHERE `CharterNum` = '40'	california_schools
SELECT AdmEmail1, AdmEmail2, AdmEmail3  FROM schools  WHERE County = 'San Bernardino'  AND District = 'San Bernardino City Unified'  AND SOC = '62'  AND DOC = '54'  AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31'  AND AdmEmail1 IS NOT NULL OR AdmEmail2 IS NOT NULL OR AdmEmail3 IS NOT NULL;	california_schools
SELECT `School`, `AdmEmail1`  FROM `schools`  WHERE `CDSCode` = (     SELECT `cds`      FROM `satscores`      WHERE `NumGE1500` IS NOT NULL      ORDER BY `NumGE1500` DESC      LIMIT 1 )	california_schools
SELECT COUNT(a.district_id)  FROM account a  JOIN district d ON a.district_id = d.district_id  WHERE a.frequency = 'POPLATEK PO OBRATU' AND d.A3 = 'East Bohemia'	financial
SELECT COUNT(DISTINCT a.account_id)  FROM account a  JOIN district d ON a.district_id = d.district_id  JOIN loan l ON a.account_id = l.account_id  WHERE d.A3 = 'Prague'	financial
SELECT CASE WHEN AVG(A12) > AVG(A13) THEN '1995' ELSE '1996' END AS higher_unemployment_year FROM district	financial
SELECT COUNT(DISTINCT c.district_id)  FROM client c  JOIN district d ON c.district_id = d.district_id  WHERE c.gender = 'F' AND d.A11 > 6000 AND d.A11 < 10000;	financial
SELECT COUNT(*)  FROM client c  JOIN district d ON c.district_id = d.district_id  WHERE c.gender = 'M' AND d.A3 = 'North Bohemia' AND d.A11 > 8000;	financial
SELECT a.account_id, (SELECT MAX(d2.A11) FROM district d2) - d.A11 AS salary_gap FROM account a JOIN client c ON a.district_id = c.district_id JOIN district d ON a.district_id = d.district_id WHERE c.gender = 'F' AND c.birth_date = (SELECT MIN(c2.birth_date) FROM client c2 WHERE c2.gender = 'F') ORDER BY d.A11 ASC LIMIT 1;	financial
SELECT a.account_id  FROM account a  JOIN district d ON a.district_id = d.district_id  JOIN client c ON a.district_id = c.district_id  WHERE c.birth_date = (SELECT MAX(birth_date) FROM client)  AND d.A11 = (SELECT MAX(A11) FROM district)	financial
SELECT COUNT(*)  FROM account a  JOIN disp d ON a.account_id = d.account_id  WHERE a.frequency = 'POPLATEK TYDNE' AND d.type = 'OWNER'	financial
SELECT DISTINCT c.client_id  FROM client c  JOIN disp d ON c.client_id = d.client_id  JOIN account a ON d.account_id = a.account_id  WHERE a.frequency = 'POPLATEK PO OBRATU' AND d.type = 'DISPONENT'	financial
SELECT a.account_id, a.frequency, l.amount  FROM account a  JOIN loan l ON a.account_id = l.account_id  WHERE l.date LIKE '1997%' AND a.frequency = 'POPLATEK TYDNE'  ORDER BY l.amount  LIMIT 1;	financial
SELECT l.account_id  FROM loan l JOIN account a ON l.account_id = a.account_id WHERE l.duration > 12 AND a.opening_date BETWEEN '1993-01-01' AND '1993-12-31' ORDER BY l.amount DESC LIMIT 1;	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c  JOIN district d ON c.district_id = d.district_id JOIN disp dp ON c.client_id = dp.client_id WHERE c.gender = 'F'  AND c.birth_date < '1950-01-01'  AND d.A2 = 'Sokolov';	financial
SELECT account_id FROM trans WHERE date = (SELECT MIN(date) FROM trans WHERE date >= '1995-01-01' AND date < '1996-01-01')	financial
SELECT DISTINCT a.account_id FROM account a JOIN trans t ON a.account_id = t.account_id WHERE a.date < '1997-01-01' AND t.amount > 3000;	financial
SELECT client_id FROM disp WHERE disp_id IN (SELECT disp_id FROM card WHERE issued = '1994-03-03')	financial
SELECT a.date FROM account a JOIN trans t ON a.account_id = t.account_id WHERE t.amount = 840 AND t.date = '1998-10-14'	financial
SELECT a.district_id  FROM account a  JOIN loan l ON a.account_id = l.account_id  WHERE l.date = '1994-08-25'	financial
SELECT MAX(amount) FROM trans WHERE account_id IN (SELECT account_id FROM account WHERE date = '1996-10-21')	financial
SELECT gender  FROM client  WHERE district_id = (     SELECT district_id      FROM district      ORDER BY A11 DESC      LIMIT 1 )  ORDER BY birth_date ASC  LIMIT 1	financial
SELECT t1.amount  FROM trans t1 JOIN account a ON t1.account_id = a.account_id JOIN (  SELECT l.account_id, MAX(l.amount) as max_loan  FROM loan l  GROUP BY l.account_id  ORDER BY max_loan DESC  LIMIT 1 ) t2 ON a.account_id = t2.account_id WHERE t1.date > a.date ORDER BY t1.date ASC LIMIT 1;	financial
SELECT COUNT(*) FROM client c JOIN district d ON c.district_id = d.district_id WHERE d.A2 = 'Jesenik' AND c.gender = 'F'	financial
SELECT d.disp_id FROM disp d JOIN trans t ON d.account_id = t.account_id WHERE t.amount = 5100 AND t.date = '1998-09-02'	financial
SELECT COUNT(*) FROM `account` a JOIN `district` d ON a.district_id = d.district_id WHERE d.A2 = 'Litomerice' AND YEAR(a.date) = 1996	financial
SELECT d.A2 FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F' AND c.birth_date = '1976-01-29'	financial
SELECT c.birth_date  FROM client c  JOIN account a ON c.district_id = a.district_id  JOIN loan l ON a.account_id = l.account_id  WHERE l.amount = 98832 AND l.date = '1996-01-03'	financial
SELECT a.account_id  FROM account a  JOIN district d ON a.district_id = d.district_id  WHERE d.A3 = 'Prague'  ORDER BY a.date  LIMIT 1;	financial
SELECT (CAST(COUNT(CASE WHEN c.gender = 'M' THEN 1 ELSE NULL END) AS REAL) / COUNT(c.gender)) * 100 AS male_percentage  FROM client c  JOIN district d ON c.district_id = d.district_id  WHERE d.A3 = 'south Bohemia'  GROUP BY d.A3  ORDER BY CAST(d.A4 AS INTEGER) DESC  LIMIT 1;	financial
SELECT ((t2.balance - t1.balance) / t1.balance) * 100 AS increase_rate FROM trans t1 JOIN trans t2 ON t1.account_id = t2.account_id JOIN loan ON t1.account_id = loan.account_id JOIN disp ON t1.account_id = disp.account_id JOIN client ON disp.client_id = client.client_id WHERE t1.date = '1993-03-22' AND t2.date = '1998-12-27' AND loan.date = '1993-07-05' AND disp.type = 'OWNER'	financial
SELECT (SUM(CASE WHEN status = 'A' THEN amount ELSE 0 END) / SUM(amount)) * 100 AS percentage FROM loan	financial
SELECT (SUM(CASE WHEN status = 'C' THEN amount ELSE 0 END) / SUM(amount)) * 100 AS percentage FROM loan WHERE amount < 100000	financial
SELECT a.account_id, d.A2 AS district_name, d.A3 AS district_region  FROM account a  JOIN district d ON a.district_id = d.district_id  WHERE a.date >= '1993-01-01' AND a.date <= '1993-12-31' AND a.frequency = 'POPLATEK PO OBRATU'	financial
SELECT a.account_id, a.frequency  FROM account a  JOIN district d ON a.district_id = d.district_id  WHERE d.A3 = 'east Bohemia' AND a.date BETWEEN '1995-01-01' AND '2000-12-31'	financial
SELECT account_id, date FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Prachatice')	financial
SELECT d.A2, d.A3  FROM district d  JOIN account a ON d.district_id = a.district_id  JOIN loan l ON a.account_id = l.account_id  WHERE l.account_id = 4990;	financial
SELECT a.account_id, d.A2 AS district, d.A3 AS region  FROM account a  JOIN district d ON a.district_id = d.district_id  JOIN loan l ON a.account_id = l.account_id  WHERE l.amount > 300000;	financial
SELECT l.loan_id, d.A2 AS district, d.A11 AS average_salary  FROM loan l  JOIN account a ON l.account_id = a.account_id  JOIN district d ON a.district_id = d.district_id  WHERE l.duration = 60;	financial
SELECT d.district_id, ((d.A13 - d.A12) / d.A12) * 100 AS unemployment_rate_increment FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.status = 'D'	financial
SELECT CAST(SUM(CASE WHEN d.A2 = 'Decin' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM account a  JOIN district d ON a.district_id = d.district_id  WHERE a.date >= '1993-01-01' AND a.date <= '1993-12-31'	financial
SELECT account_id FROM account WHERE account_id IN (SELECT account_id FROM statement WHERE type = 'POPLATEK MESICNE')	financial
SELECT d.A2, COUNT(*) AS female_account_holders FROM district d JOIN client c ON d.district_id = c.district_id JOIN disp dp ON c.client_id = dp.client_id WHERE c.gender = 'F' GROUP BY d.A2 ORDER BY female_account_holders DESC LIMIT 9;	financial
SELECT d.A2, t.amount  FROM trans t  JOIN account a ON t.account_id = a.account_id  JOIN district d ON a.district_id = d.district_id  WHERE t.type = 'VYDAJ' AND t.date LIKE '1996-01%'  ORDER BY t.amount DESC  LIMIT 10;	financial
SELECT COUNT(DISTINCT d.client_id)  FROM disp d  JOIN client c ON d.client_id = c.client_id  JOIN district ds ON c.district_id = ds.district_id  WHERE ds.A3 = 'South Bohemia' AND d.type = 'OWNER' AND d.client_id NOT IN (     SELECT DISTINCT d2.client_id      FROM disp d2      JOIN card ON d2.account_id = card.account_id )	financial
SELECT d.A3 FROM district d JOIN account a ON d.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.status IN ('C', 'D') GROUP BY d.A3 ORDER BY COUNT(*) DESC LIMIT 1	financial
SELECT AVG(loan.amount)  FROM loan  JOIN account ON loan.account_id = account.account_id  JOIN client ON account.district_id = client.district_id  WHERE client.gender = 'M'	financial
SELECT A2 AS district_name, A13 AS unemployment_rate FROM district ORDER BY A13 DESC LIMIT 1	financial
SELECT COUNT(*)  FROM `account`  WHERE `district_id` = (     SELECT `district_id`      FROM `district`      ORDER BY `A16` DESC      LIMIT 1 )	financial
SELECT COUNT(DISTINCT t.account_id)  FROM trans t  JOIN account a ON t.account_id = a.account_id  WHERE t.operation = 'VYBER KARTOU' AND a.frequency = 'POPLATEK MESICNE' AND t.balance < 0;	financial
SELECT COUNT(DISTINCT account_id)  FROM loan  WHERE date BETWEEN '1995-01-01' AND '1997-12-31'  AND amount >= 250000  AND account_id IN (SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE')	financial
SELECT COUNT(DISTINCT a.account_id)  FROM account a  JOIN loan l ON a.account_id = l.account_id  WHERE a.district_id = 1 AND (l.status = 'C' OR l.status = 'D')	financial
SELECT COUNT(*)  FROM client  WHERE gender = 'M' AND district_id = (     SELECT district_id      FROM district      ORDER BY A15 DESC      LIMIT 1 OFFSET 1 )	financial
SELECT COUNT(*)  FROM card  JOIN disp ON card.disp_id = disp.disp_id  WHERE card.type = 'gold' AND disp.type = 'OWNER'	financial
SELECT COUNT(account_id) FROM account WHERE district_id = (SELECT district_id FROM district WHERE A2 = 'Pisek')	financial
SELECT DISTINCT d.district_id  FROM district d  JOIN account a ON d.district_id = a.district_id  JOIN trans t ON a.account_id = t.account_id  WHERE t.amount > 10000 AND YEAR(t.date) = 1997;	financial
SELECT a.account_id  FROM account a  JOIN trans t ON a.account_id = t.account_id  JOIN district d ON a.district_id = d.district_id  WHERE t.k_symbol = 'SIPO' AND d.A2 = 'Pisek'	financial
SELECT DISTINCT account_id FROM disp WHERE disp_id IN (SELECT disp_id FROM card WHERE type = 'gold')	financial
SELECT AVG(amount) AS average_amount, strftime('%m', date) AS month  FROM trans  WHERE operation = 'VYBER KARTOU' AND strftime('%Y', date) = '2021'  GROUP BY month;	financial
SELECT DISTINCT d.client_id  FROM disp d  JOIN trans t ON d.account_id = t.account_id  WHERE t.operation = 'VYBER KARTOU' AND t.amount < (SELECT AVG(amount) FROM trans WHERE operation = 'VYBER KARTOU' AND date LIKE '1998%') AND t.date LIKE '1998%'	financial
SELECT DISTINCT c.client_id  FROM client c  JOIN disp d ON c.client_id = d.client_id  JOIN card cr ON d.disp_id = cr.disp_id  JOIN loan l ON d.account_id = l.account_id  WHERE c.gender = 'F'	financial
SELECT COUNT(*) FROM client AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' AND T2.A3 = 'south Bohemia'	financial
SELECT a.account_id  FROM account a  JOIN district d ON a.district_id = d.district_id  JOIN disp dp ON a.account_id = dp.account_id  WHERE d.A2 = 'Tabor' AND dp.type = 'OWNER'	financial
SELECT DISTINCT d.type  FROM disp d  JOIN account a ON d.account_id = a.account_id  JOIN district dis ON a.district_id = dis.district_id  WHERE d.type != 'OWNER' AND dis.A11 > 8000 AND dis.A11 <= 9000;	financial
SELECT COUNT(DISTINCT a.account_id)  FROM account a  JOIN district d ON a.district_id = d.district_id  JOIN trans t ON a.account_id = t.account_id  WHERE d.A3 = 'North Bohemia' AND t.bank = 'AB'	financial
SELECT DISTINCT d.A2  FROM district d  JOIN account a ON d.district_id = a.district_id  JOIN trans t ON a.account_id = t.account_id  WHERE t.type = 'VYDAJ'	financial
SELECT AVG(d.A15)  FROM district d  JOIN account a ON d.district_id = a.district_id  WHERE d.district_id > 4000 AND YEAR(a.date) >= 1997;	financial
SELECT COUNT(*)  FROM card  JOIN disp ON card.disp_id = disp.disp_id  WHERE card.type = 'classic' AND disp.type = 'OWNER'	financial
SELECT COUNT(*) FROM client AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'M' AND T2.A2 = 'Hl.m. Praha'	financial
SELECT (COUNT(CASE WHEN type = 'gold' AND issued < '1998-01-01' THEN 1 END) / COUNT(card_id) * 100.0) AS percent_gold FROM card	financial
SELECT d.client_id FROM disp d JOIN loan l ON d.account_id = l.account_id WHERE d.type = 'OWNER' AND l.amount = (SELECT MAX(amount) FROM loan)	financial
SELECT d.A15 FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.account_id = 532	financial
SELECT district_id FROM account WHERE account_id = (SELECT account_id FROM `order` WHERE order_id = 33333)	financial
SELECT t.*  FROM trans t JOIN disp d ON t.account_id = d.account_id WHERE d.client_id = 3356 AND t.operation = 'VYBER'	financial
SELECT COUNT(*)  FROM `account` a JOIN `loan` l ON a.account_id = l.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND l.amount < 200000;	financial
SELECT card.type FROM card INNER JOIN disp ON card.disp_id = disp.disp_id WHERE disp.client_id = 13539 AND disp.type = 'OWNER'	financial
SELECT d.A3 FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.client_id = 3541	financial
SELECT d.district_id FROM district d JOIN account a ON d.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.status = 'A' GROUP BY d.district_id ORDER BY COUNT(*) DESC LIMIT 1;	financial
SELECT c.client_id  FROM client c  JOIN account a ON c.district_id = a.district_id  JOIN order o ON a.account_id = o.account_id  WHERE o.order_id = 32423	financial
SELECT t.*  FROM `trans` t JOIN `account` a ON t.account_id = a.account_id WHERE a.district_id = 5;	financial
SELECT COUNT(*) FROM `account` a JOIN `district` d ON a.district_id = d.district_id WHERE d.A2 = 'Jesenik'	financial
SELECT DISTINCT d.client_id  FROM disp d  JOIN card c ON d.disp_id = c.disp_id  WHERE c.type = 'junior' AND c.issued >= '1997-01-01'	financial
SELECT CAST(SUM(CASE WHEN gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM client  WHERE district_id IN (SELECT district_id FROM district WHERE A11 > 10000)	financial
SELECT ((SUM(CASE WHEN l.date BETWEEN '1997-01-01' AND '1997-12-31' THEN l.amount ELSE 0 END) - SUM(CASE WHEN l.date BETWEEN '1996-01-01' AND '1996-12-31' THEN l.amount ELSE 0 END)) / SUM(CASE WHEN l.date BETWEEN '1996-01-01' AND '1996-12-31' THEN l.amount ELSE 0 END)) * 100 AS growth_rate FROM loan l JOIN disp d ON l.account_id = d.account_id JOIN client c ON d.client_id = c.client_id WHERE c.gender = 'M'	financial
SELECT COUNT(*) FROM `trans` WHERE `operation` = 'VYBER KARTOU' AND `date` > '1995-12-31'	financial
SELECT SUM(CASE WHEN A3 = 'north Bohemia' THEN A16 ELSE 0 END) - SUM(CASE WHEN A3 = 'east Bohemia' THEN A16 ELSE 0 END) AS difference FROM district	financial
SELECT type, COUNT(*)  FROM disp  WHERE account_id BETWEEN 1 AND 10  GROUP BY type;	financial
SELECT a.frequency, SUM(o.amount)  FROM account a  JOIN order o ON a.account_id = o.account_id  WHERE a.account_id = 3  GROUP BY a.frequency;	financial
SELECT YEAR(birth_date) FROM client WHERE client_id = 130	financial
SELECT COUNT(DISTINCT d.account_id)  FROM disp d  JOIN account a ON d.account_id = a.account_id  WHERE d.type = 'OWNER' AND a.frequency = 'POPLATEK PO OBRATU'	financial
SELECT l.amount, l.status  FROM loan l  JOIN account a ON l.account_id = a.account_id  JOIN client c ON a.district_id = c.district_id  WHERE c.client_id = 992;	financial
SELECT SUM(t.balance), c.gender  FROM trans t  JOIN account a ON t.account_id = a.account_id  JOIN client c ON a.district_id = c.district_id  WHERE c.client_id = 4 AND t.trans_id > 851;	financial
SELECT c.type FROM card AS c JOIN disp AS d ON c.disp_id = d.disp_id WHERE d.client_id = 9	financial
SELECT SUM(t.amount)  FROM `trans` t JOIN `account` a ON t.account_id = a.account_id JOIN `client` c ON a.district_id = c.district_id WHERE c.client_id = 617 AND YEAR(t.date) = 1998;	financial
SELECT c.client_id, c.birth_date  FROM client c  JOIN account a ON c.district_id = a.district_id  JOIN district d ON c.district_id = d.district_id  WHERE c.birth_date BETWEEN '1983-01-01' AND '1987-12-31'  AND d.A3 = 'East Bohemia'	financial
SELECT c.client_id  FROM client c  JOIN account a ON c.district_id = a.district_id  JOIN loan l ON a.account_id = l.account_id  WHERE c.gender = 'F'  ORDER BY l.amount DESC  LIMIT 3	financial
SELECT COUNT(DISTINCT c.district_id)  FROM client c  JOIN account a ON c.district_id = a.district_id  JOIN trans t ON a.account_id = t.account_id  WHERE c.gender = 'M'  AND c.birth_date BETWEEN '1974-01-01' AND '1976-12-31'  AND t.amount > 4000  AND t.k_symbol = 'SIPO'	financial
SELECT COUNT(*) FROM `account` a JOIN `district` d ON a.district_id = d.district_id WHERE d.A2 = 'Beroun' AND a.date > '1996-12-31'	financial
SELECT COUNT(*)  FROM client c  JOIN disp d ON c.client_id = d.client_id  JOIN card ca ON d.disp_id = ca.disp_id  WHERE c.gender = 'F' AND ca.type = 'junior'	financial
SELECT CAST(SUM(CASE WHEN c.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM client c  JOIN district d ON c.district_id = d.district_id  WHERE d.A3 = 'Prague'	financial
SELECT CAST(COUNT(CASE WHEN c.gender = 'M' THEN 1 END) AS REAL) * 100 / COUNT(*) FROM client c JOIN account a ON c.district_id = a.district_id WHERE a.frequency = 'POPLATEK TYDNE'	financial
SELECT COUNT(DISTINCT d.client_id)  FROM disp d  JOIN account a ON d.account_id = a.account_id  WHERE a.frequency = 'POPLATEK TYDNE' AND d.type = 'OWNER'	financial
SELECT a.account_id  FROM account a  JOIN loan l ON a.account_id = l.account_id  WHERE l.duration > 24 AND a.date < '1997-01-01'  ORDER BY l.amount ASC  LIMIT 1;	financial
SELECT a.account_id FROM account a JOIN client c ON a.district_id = c.district_id JOIN district d ON a.district_id = d.district_id WHERE c.gender = 'F' AND c.birth_date = (SELECT MIN(birth_date) FROM client WHERE gender = 'F') AND d.A11 = (SELECT MIN(A11) FROM district)	financial
SELECT COUNT(*)  FROM `client` c  JOIN `district` d ON c.district_id = d.district_id  WHERE YEAR(c.birth_date) = 1920 AND d.A3 = 'east Bohemia';	financial
SELECT COUNT(*) FROM `account` a JOIN `loan` l ON a.account_id = l.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND l.duration = 24	financial
SELECT AVG(payments) FROM loan WHERE status IN ('C', 'D') AND account_id IN (SELECT account_id FROM account WHERE frequency = 'POPLATEK PO OBRATU')	financial
SELECT T1.client_id, T3.A2 FROM disp AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.type = 'OWNER'	financial
SELECT c.client_id, DATE_PART('year', AGE(c.birth_date)) AS age FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card cr ON d.disp_id = cr.disp_id WHERE cr.type = 'gold' AND d.type = 'OWNER'	financial
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY COUNT(bond_type) DESC LIMIT 1	toxicology
SELECT COUNT(DISTINCT a.molecule_id)  FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '-' AND a.element = 'cl'	toxicology
SELECT AVG(CASE WHEN element = 'o' THEN 1 ELSE 0 END) AS avg_oxygen FROM atom WHERE molecule_id IN (SELECT molecule_id FROM bond WHERE bond_type = '-')	toxicology
SELECT AVG(bond_count)  FROM (     SELECT m.molecule_id, COUNT(b.bond_type) AS bond_count     FROM molecule m     LEFT JOIN bond b ON m.molecule_id = b.molecule_id     WHERE m.label = '+' AND b.bond_type = '-'     GROUP BY m.molecule_id ) AS subquery;	toxicology
SELECT COUNT(DISTINCT a.molecule_id)  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE a.element = 'na' AND m.label = '-'	toxicology
SELECT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '#' AND m.label = '+'	toxicology
SELECT (SUM(CASE WHEN a.element = 'c' THEN 1 ELSE 0 END) * 100.0 / COUNT(a.atom_id)) AS percentage  FROM atom a  JOIN bond b ON a.molecule_id = b.molecule_id  WHERE b.bond_type = '=';	toxicology
SELECT COUNT(*) FROM `bond` WHERE `bond_type` = '#'	toxicology
SELECT COUNT(*) FROM `atom` WHERE `element` != 'br'	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR099' AND label = '+'	toxicology
SELECT DISTINCT molecule_id FROM atom WHERE element = 'c'	toxicology
SELECT a.element  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  WHERE c.bond_id = 'TR004_8_9'	toxicology
SELECT DISTINCT a.element  FROM atom a  JOIN bond b ON a.molecule_id = b.molecule_id  WHERE b.bond_type = '=';	toxicology
SELECT label, COUNT(label) AS count_label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'h' GROUP BY label ORDER BY count_label DESC LIMIT 1;	toxicology
SELECT DISTINCT b.bond_type  FROM bond b  JOIN connected c ON b.bond_id = c.bond_id  JOIN atom a ON c.atom_id = a.atom_id  WHERE a.element = 'cl'	toxicology
SELECT atom_id, atom_id2 FROM connected WHERE bond_id IN (SELECT bond_id FROM bond WHERE bond_type = '-')	toxicology
SELECT a.atom_id  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  JOIN connected c ON a.atom_id = c.atom_id  WHERE m.label = '-'	toxicology
SELECT element, COUNT(element) AS count FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '-' GROUP BY element ORDER BY count ASC LIMIT 1	toxicology
SELECT b.bond_type FROM bond b JOIN connected c ON b.bond_id = c.bond_id WHERE (c.atom_id = 'TR004_8' AND c.atom_id2 = 'TR004_20') OR (c.atom_id = 'TR004_20' AND c.atom_id2 = 'TR004_8')	toxicology
SELECT DISTINCT label FROM molecule WHERE molecule_id NOT IN (SELECT molecule_id FROM atom WHERE element = 'sn')	toxicology
SELECT COUNT(DISTINCT a.atom_id)  FROM atom a  JOIN bond b ON a.molecule_id = b.molecule_id  JOIN connected c ON a.atom_id = c.atom_id  WHERE (a.element = 'i' OR a.element = 's') AND b.bond_type = '-'	toxicology
SELECT c.atom_id, c.atom_id2  FROM connected c  JOIN bond b ON c.bond_id = b.bond_id  WHERE b.bond_type = '#'	toxicology
SELECT DISTINCT a.atom_id  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  WHERE a.molecule_id = 'TR181'  UNION  SELECT DISTINCT c.atom_id2  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id2  WHERE a.molecule_id = 'TR181'	toxicology
SELECT CAST(COUNT(DISTINCT CASE WHEN a.element != 'f' THEN m.molecule_id ELSE NULL END) AS REAL) * 100 / COUNT(DISTINCT m.molecule_id)  FROM molecule m  LEFT JOIN atom a ON m.molecule_id = a.molecule_id  WHERE m.label = '+'	toxicology
SELECT CAST(SUM(CASE WHEN b.bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(b.molecule_id) AS percent  FROM bond b  JOIN molecule m ON b.molecule_id = m.molecule_id  WHERE m.label = '+'	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR000' ORDER BY element ASC LIMIT 3	toxicology
SELECT bond_id FROM bond WHERE molecule_id = 'TR001' AND bond_id = 'TR001_2_6'	toxicology
SELECT COUNT(CASE WHEN label = '+' THEN 1 END) - COUNT(CASE WHEN label = '-' THEN 1 END) AS difference FROM molecule	toxicology
SELECT atom_id, atom_id2 FROM connected WHERE bond_id = 'TR000_2_5'	toxicology
SELECT bond_id FROM connected WHERE atom_id2 = 'TR000_2'	toxicology
SELECT molecule_id FROM bond WHERE bond_type = '=' GROUP BY molecule_id ORDER BY molecule_id LIMIT 5	toxicology
SELECT CAST(SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) AS percent  FROM bond  WHERE molecule_id = 'TR008'  GROUP BY molecule_id	toxicology
SELECT CAST(SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(molecule_id) AS percent FROM molecule	toxicology
SELECT CAST(SUM(CASE WHEN element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(atom_id) AS percent FROM atom WHERE molecule_id = 'TR206'	toxicology
SELECT bond_type FROM bond WHERE molecule_id = 'TR000'	toxicology
SELECT a.element, m.label  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE m.molecule_id = 'TR060'	toxicology
SELECT bond_type, molecule_id, label  FROM bond  JOIN molecule ON bond.molecule_id = molecule.molecule_id  WHERE molecule_id = 'TR010'  GROUP BY bond_type  ORDER BY COUNT(bond_type) DESC  LIMIT 1;	toxicology
SELECT m.molecule_id  FROM molecule m  JOIN bond b ON m.molecule_id = b.molecule_id  WHERE b.bond_type = '-' AND m.label = '-'  ORDER BY m.molecule_id  LIMIT 3	toxicology
SELECT b.bond_id  FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id WHERE a.molecule_id = 'TR006' GROUP BY b.bond_id ORDER BY b.bond_id LIMIT 2	toxicology
SELECT COUNT(DISTINCT bond_id) FROM connected WHERE (atom_id = 'TR009_12' OR atom_id2 = 'TR009_12') AND bond_id IN (SELECT bond_id FROM bond WHERE molecule_id = 'TR009')	toxicology
SELECT COUNT(DISTINCT a.molecule_id)  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE m.label = '+' AND a.element = 'br'	toxicology
SELECT b.bond_type, c.atom_id, c.atom_id2  FROM bond b  JOIN connected c ON b.bond_id = c.bond_id  WHERE b.bond_id = 'TR001_6_9'	toxicology
SELECT m.molecule_id, CASE WHEN m.label = '+' THEN 'Carcinogenic' ELSE 'Not Carcinogenic' END AS is_carcinogenic FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR001_10'	toxicology
SELECT COUNT(DISTINCT molecule_id) FROM bond WHERE bond_type = '#'	toxicology
SELECT COUNT(bond_id) FROM connected WHERE atom_id LIKE 'TR%_19'	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR004'	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '-'	toxicology
SELECT DISTINCT m.molecule_id, m.label  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE SUBSTR(a.atom_id, 7, 2) BETWEEN '21' AND '25'  AND m.label = '+'	toxicology
SELECT c.bond_id FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.bond_id = a2.atom_id WHERE a1.element = 'p' AND a2.element = 'n' UNION SELECT c.bond_id FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.bond_id = a2.atom_id WHERE a1.element = 'n' AND a2.element = 'p'	toxicology
SELECT m.molecule_id, m.label  FROM molecule m  JOIN bond b ON m.molecule_id = b.molecule_id  WHERE b.bond_type = '='  GROUP BY m.molecule_id  ORDER BY COUNT(b.bond_type) DESC  LIMIT 1;	toxicology
SELECT CAST(COUNT(bond_id) AS REAL) / COUNT(DISTINCT atom_id) FROM connected WHERE atom_id IN (SELECT atom_id FROM atom WHERE element = 'i')	toxicology
SELECT bond.bond_type, bond.bond_id  FROM bond  JOIN connected ON bond.bond_id = connected.bond_id  WHERE SUBSTR(connected.atom_id, 7, 2) + 0 = 45;	toxicology
SELECT element FROM atom WHERE atom_id NOT IN (SELECT atom_id FROM connected)	toxicology
SELECT a1.atom_id, a2.atom_id  FROM atom a1  JOIN connected c ON a1.atom_id = c.atom_id  JOIN bond b ON c.bond_id = b.bond_id  JOIN atom a2 ON c.atom_id2 = a2.atom_id  WHERE b.molecule_id = 'TR041' AND b.bond_type = '#'	toxicology
SELECT a.element  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  WHERE c.bond_id = 'TR144_8_19'	toxicology
SELECT m.molecule_id, COUNT(b.bond_type) AS double_bond_count  FROM molecule m  JOIN bond b ON m.molecule_id = b.molecule_id  WHERE m.label = '+' AND b.bond_type = '='  GROUP BY m.molecule_id  ORDER BY double_bond_count DESC  LIMIT 1;	toxicology
SELECT element FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+') GROUP BY element ORDER BY COUNT(*) ASC LIMIT 1	toxicology
SELECT DISTINCT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id2 WHERE c.atom_id IN (SELECT atom_id FROM atom WHERE element = 'pb')	toxicology
SELECT DISTINCT a.element  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  JOIN bond b ON c.bond_id = b.bond_id  WHERE b.bond_type = '#'	toxicology
SELECT CAST(COUNT(t1.bond_id) AS REAL) * 100 / (SELECT COUNT(atom_id) FROM connected WHERE atom_id IN (SELECT atom_id FROM connected GROUP BY atom_id ORDER BY COUNT(atom_id) DESC LIMIT 1)) FROM bond AS t1 JOIN connected AS t2 ON t1.bond_id = t2.bond_id	toxicology
SELECT CAST(SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(b.bond_id) AS proportion FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '-';	toxicology
SELECT COUNT(*) FROM `atom` WHERE `element` IN ('c', 'h')	toxicology
SELECT atom_id2 FROM connected WHERE atom_id IN (SELECT atom_id FROM atom WHERE element = 's')	toxicology
SELECT bond.bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN atom ON connected.atom_id = atom.atom_id WHERE atom.element = 'sn'	toxicology
SELECT COUNT(DISTINCT element)  FROM atom  WHERE molecule_id IN (     SELECT molecule_id      FROM bond      WHERE bond_type = '-' )	toxicology
SELECT COUNT(*)  FROM atom a  JOIN bond b ON a.molecule_id = b.molecule_id  WHERE b.bond_type = '#' AND a.element IN ('p', 'br')	toxicology
SELECT bond_id FROM bond WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+')	toxicology
SELECT molecule_id FROM bond WHERE bond_type = '-' AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-')	toxicology
SELECT (CAST(COUNT(CASE WHEN a.element = 'cl' THEN a.atom_id END) AS REAL) / COUNT(a.atom_id)) * 100 AS percent FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id WHERE b.bond_type = '-'	toxicology
SELECT label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002')	toxicology
SELECT molecule_id FROM molecule WHERE label = '-'	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+' AND molecule_id BETWEEN 'TR000' AND 'TR030'	toxicology
SELECT bond_type FROM bond WHERE molecule_id BETWEEN 'TR000' AND 'TR050' ORDER BY molecule_id;	toxicology
SELECT a.element  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  WHERE c.bond_id = 'TR001_10_11'	toxicology
SELECT COUNT(DISTINCT b.bond_id)  FROM bond b  JOIN atom a ON b.molecule_id = a.molecule_id  WHERE a.element = 'i'	toxicology
SELECT CASE WHEN SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) > SUM(CASE WHEN m.label = '-' THEN 1 ELSE 0 END) THEN 'carcinogenic' ELSE 'non-carcinogenic' END AS result FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'ca'	toxicology
SELECT a1.element, a2.element  FROM connected c  JOIN atom a1 ON c.atom_id = a1.atom_id  JOIN atom a2 ON c.atom_id2 = a2.atom_id  WHERE c.bond_id = 'TR001_1_8'  AND a1.element = 'cl'  AND a2.element = 'c'	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN bond b ON m.molecule_id = b.molecule_id WHERE a.element = 'c' AND b.bond_type = '#' AND m.label = '-' LIMIT 2;	toxicology
SELECT CAST(COUNT(CASE WHEN a.element = 'cl' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(DISTINCT a.molecule_id) AS percentage  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE m.label = '+'	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR001'	toxicology
SELECT molecule_id FROM bond WHERE bond_type = '='	toxicology
SELECT c.atom_id, c.atom_id2  FROM connected c  JOIN bond b ON c.bond_id = b.bond_id  WHERE b.bond_type = '#'	toxicology
SELECT a.element  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  WHERE c.bond_id = 'TR000_1_2'	toxicology
SELECT COUNT(DISTINCT b.molecule_id)  FROM bond b  JOIN molecule m ON b.molecule_id = m.molecule_id  WHERE b.bond_type = '-' AND m.label = '-';	toxicology
SELECT m.label FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_id = 'TR001_10_11'	toxicology
SELECT b.bond_id, CASE WHEN m.label = '+' THEN 'carcinogenic' ELSE 'non-carcinogenic' END AS carcinogenic  FROM bond b  JOIN molecule m ON b.molecule_id = m.molecule_id  WHERE b.bond_type = '#';	toxicology
SELECT element, COUNT(*) AS tally FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '+' AND SUBSTR(atom.atom_id, 7, 1) = '4' GROUP BY element;	toxicology
SELECT m.label, CAST(SUM(CASE WHEN a.element = 'h' THEN 1 ELSE 0 END) AS REAL) / COUNT(a.element) AS ratio FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.molecule_id = 'TR006' GROUP BY m.label;	toxicology
SELECT m.label AS is_carcinogenic FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'ca'	toxicology
SELECT DISTINCT b.bond_type  FROM bond b  JOIN atom a ON b.molecule_id = a.molecule_id  WHERE a.element = 'c'	toxicology
SELECT a1.element, a2.element  FROM atom a1  JOIN connected c1 ON a1.atom_id = c1.atom_id  JOIN bond b ON c1.bond_id = b.bond_id  JOIN connected c2 ON b.bond_id = c2.bond_id  JOIN atom a2 ON c2.atom_id = a2.atom_id  WHERE b.bond_id = 'TR001_10_11' AND a1.atom_id != a2.atom_id	toxicology
SELECT CAST(COUNT(*) AS REAL) * 100 / (SELECT COUNT(*) FROM bond) FROM bond WHERE bond_type = '#'	toxicology
SELECT CAST(COUNT(CASE WHEN bond_type = '=' THEN bond_id ELSE NULL END) AS REAL) * 100 / COUNT(bond_id) AS percent FROM bond WHERE molecule_id = 'TR047'	toxicology
SELECT m.label  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE a.atom_id = 'TR001_1'	toxicology
SELECT label FROM molecule WHERE label = '+' AND molecule_id = 'TR151'	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR151' AND element IN ('cl', 'br', 'f', 'i', 'pb', 'te', 'sn')	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+'	toxicology
SELECT atom_id, molecule_id, element FROM atom WHERE element = 'c' AND substr(molecule_id, 3, 3) >= '010' AND substr(molecule_id, 3, 3) <= '050'	toxicology
SELECT COUNT(*) FROM `atom` WHERE `molecule_id` IN (SELECT `molecule_id` FROM `molecule` WHERE `label` = '+')	toxicology
SELECT b.bond_id  FROM bond b  JOIN molecule m ON b.molecule_id = m.molecule_id  WHERE b.bond_type = '=' AND m.label = '+'	toxicology
SELECT COUNT(*) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'h' AND m.label = '+'	toxicology
SELECT bond.molecule_id  FROM bond  JOIN connected ON bond.bond_id = connected.bond_id  WHERE connected.atom_id = 'TR000_1' AND bond.bond_id = 'TR000_1_2'	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c' AND m.label = '-'	toxicology
SELECT (CAST(COUNT(CASE WHEN m.label = '+' AND a.element = 'h' THEN m.molecule_id END) AS REAL) / COUNT(DISTINCT m.molecule_id)) * 100.0 AS percentage  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id;	toxicology
SELECT label FROM molecule WHERE label = '+' AND molecule_id = 'TR124'	toxicology
SELECT atom_id FROM atom WHERE molecule_id = 'TR186'	toxicology
SELECT bond_type FROM bond WHERE bond_id = 'TR007_4_19'	toxicology
SELECT a.element  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  WHERE c.bond_id = 'TR000_2_4'	toxicology
SELECT COUNT(b.bond_id), m.label  FROM bond b  JOIN molecule m ON b.molecule_id = m.molecule_id  WHERE b.molecule_id = 'TR006' AND b.bond_type = '=';	toxicology
SELECT m.molecule_id, a.element  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE m.label = '+'	toxicology
SELECT b.bond_id, c.atom_id, c.atom_id2  FROM bond b  JOIN connected c ON b.bond_id = c.bond_id  WHERE b.bond_type = '-'	toxicology
SELECT atom.molecule_id, GROUP_CONCAT(DISTINCT atom.element) AS elements FROM atom JOIN bond ON atom.molecule_id = bond.molecule_id WHERE bond.bond_type = '#' GROUP BY atom.molecule_id;	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE c.bond_id = 'TR000_2_3'	toxicology
SELECT COUNT(DISTINCT bond_id) FROM connected WHERE atom_id IN (SELECT atom_id FROM atom WHERE element = 'cl')	toxicology
SELECT a.atom_id, COUNT(DISTINCT b.bond_type) AS bond_count FROM atom a LEFT JOIN bond b ON a.molecule_id = b.molecule_id WHERE a.molecule_id = 'TR346' GROUP BY a.atom_id;	toxicology
SELECT COUNT(DISTINCT b.molecule_id) AS total_molecules, SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) AS carcinogenic_molecules FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '=';	toxicology
SELECT COUNT(DISTINCT a.molecule_id)  FROM atom a  LEFT JOIN bond b ON a.molecule_id = b.molecule_id  WHERE a.element != 's' AND (b.bond_type != '=' OR b.bond_type IS NULL)	toxicology
SELECT m.label FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_id = 'TR001_2_4'	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR001'	toxicology
SELECT COUNT(*) FROM `bond` WHERE `bond_type` = '-'	toxicology
SELECT m.molecule_id, m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'cl' AND m.label = '+'	toxicology
SELECT m.molecule_id, m.label  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE a.element = 'c' AND m.label = '-';	toxicology
SELECT CAST(SUM(CASE WHEN m.label = '+' AND a.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(DISTINCT a.molecule_id) AS percentage FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id;	toxicology
SELECT DISTINCT a.molecule_id  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  WHERE c.bond_id = 'TR001_1_7'	toxicology
SELECT COUNT(*) FROM `atom` a JOIN `connected` c ON a.atom_id = c.atom_id WHERE c.bond_id = 'TR001_3_4'	toxicology
SELECT b.bond_type FROM bond b JOIN connected c ON b.bond_id = c.bond_id WHERE c.atom_id = 'TR000_1' AND c.atom_id2 = 'TR000_2' OR c.atom_id = 'TR000_2' AND c.atom_id2 = 'TR000_1'	toxicology
SELECT T1.molecule_id FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T2.atom_id = 'TR000_2' AND T2.atom_id2 = 'TR000_4'	toxicology
SELECT element FROM atom WHERE atom_id = 'TR000_1'	toxicology
SELECT label FROM molecule WHERE label = 'TR000'	toxicology
SELECT CAST(SUM(CASE WHEN bond_type = '-' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) AS percentage FROM bond	toxicology
SELECT COUNT(DISTINCT a.molecule_id)  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE a.element = 'n' AND m.label = '+';	toxicology
SELECT DISTINCT a.molecule_id  FROM atom a  JOIN bond b ON a.molecule_id = b.molecule_id  WHERE a.element = 's' AND b.bond_type = '=';	toxicology
SELECT m.molecule_id, m.label  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE m.label = '-'  GROUP BY m.molecule_id  HAVING COUNT(a.atom_id) > 5;	toxicology
SELECT DISTINCT a.element  FROM atom a  JOIN bond b ON a.molecule_id = b.molecule_id  WHERE b.bond_type = '=' AND a.molecule_id = 'TR024'	toxicology
SELECT m.molecule_id, m.label, COUNT(a.atom_id) AS atom_count FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' GROUP BY m.molecule_id, m.label ORDER BY atom_count DESC LIMIT 1;	toxicology
SELECT (SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) / COUNT(DISTINCT m.molecule_id)) * 100.0 AS percentage  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  JOIN bond b ON m.molecule_id = b.molecule_id  WHERE a.element = 'h' AND b.bond_type = '#'	toxicology
SELECT COUNT(*) FROM `molecule` WHERE `label` = '+'	toxicology
SELECT COUNT(DISTINCT molecule_id) FROM bond WHERE bond_type = '-' AND molecule_id BETWEEN 'TR004' AND 'TR010'	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR008' AND element = 'c'	toxicology
SELECT element FROM atom WHERE atom_id = 'TR004_7' AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-')	toxicology
SELECT COUNT(DISTINCT a.molecule_id)  FROM atom a  JOIN bond b ON a.molecule_id = b.molecule_id  WHERE a.element = 'o' AND b.bond_type = '=';	toxicology
SELECT COUNT(DISTINCT b.molecule_id)  FROM bond b  JOIN molecule m ON b.molecule_id = m.molecule_id  WHERE b.bond_type = '#' AND m.label = '-'	toxicology
SELECT a.element, b.bond_type  FROM atom a  JOIN bond b ON a.molecule_id = b.molecule_id  JOIN connected c ON (a.atom_id = c.atom_id OR a.atom_id = c.atom_id2) AND b.bond_id = c.bond_id  WHERE a.molecule_id = 'TR002'	toxicology
SELECT a.atom_id  FROM atom a  JOIN bond b ON a.molecule_id = b.molecule_id  WHERE a.element = 'c' AND b.bond_type = '=' AND a.molecule_id = 'TR012'	toxicology
SELECT atom_id FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+') AND element = 'o'	toxicology
SELECT * FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL	card_games
SELECT * FROM `cards` WHERE `borderColor` IS NULL AND `cardKingdomId` IS NOT NULL AND `cardKingdomFoilId` IS NULL	card_games
SELECT name FROM cards WHERE faceConvertedManaCost = (SELECT MAX(faceConvertedManaCost) FROM cards)	card_games
SELECT id FROM cards WHERE edhrecRank < 100 AND frameVersion = '2015'	card_games
SELECT c.id, c.uuid  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE c.rarity = 'mythic' AND l.format = 'gladiator' AND l.status = 'Banned'	card_games
SELECT c.name, l.status  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE c.types = 'Artifact' AND c.side IS NULL AND l.format = 'vintage'	card_games
SELECT c.id, c.artist FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE (c.power = '*' OR c.power IS NULL)   AND l.format = 'commander'   AND l.status = 'Legal'	card_games
SELECT c.id, r.text, c.hasContentWarning  FROM cards c  LEFT JOIN rulings r ON c.uuid = r.uuid  WHERE c.artist = 'Stephen Daniele'  AND c.hasContentWarning = 1;	card_games
SELECT c.text AS card_text, r.text AS ruling_text  FROM cards c  JOIN rulings r ON c.uuid = r.uuid  WHERE c.name = 'Sublime Epiphany' AND c.number = '74s'	card_games
SELECT c.name, c.artist, c.isPromo  FROM cards c  JOIN rulings r ON c.uuid = r.uuid  GROUP BY c.uuid  ORDER BY COUNT(r.uuid) DESC  LIMIT 1;	card_games
SELECT fd.language FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE c.name = 'Annul' AND c.number = '29'	card_games
SELECT c.name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Japanese'	card_games
SELECT (CAST(SUM(CASE WHEN language = 'Chinese Simplified' THEN 1 ELSE 0 END) AS REAL) / COUNT(id)) * 100 AS percentage FROM foreign_data	card_games
SELECT s.name, s.totalSetSize  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE st.language = 'Italian'	card_games
SELECT COUNT(DISTINCT type) FROM cards WHERE artist = 'Aaron Boyd'	card_games
SELECT keywords FROM cards WHERE name = 'Angel of Mercy'	card_games
SELECT COUNT(*) FROM cards WHERE power = '*'	card_games
SELECT promoTypes FROM cards WHERE name = 'Duress'	card_games
SELECT borderColor FROM cards WHERE name = 'Ancestor''s Chosen'	card_games
SELECT originalType FROM cards WHERE name = 'Ancestor''s Chosen'	card_games
SELECT st.language FROM cards c JOIN set s ON c.id = s.card_id JOIN set_translations st ON s.set_translation_id = st.id WHERE c.name = 'Angel of Mercy'	card_games
SELECT COUNT(*)  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE l.status = 'restricted' AND c.isTextless = 0;	card_games
SELECT r.text FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.name = 'Condemn'	card_games
SELECT COUNT(*)  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE c.isStarter = 1 AND l.status = 'restricted'	card_games
SELECT l.status FROM legalities l JOIN cards c ON l.uuid = c.uuid WHERE c.name = 'Cloudchaser Eagle'	card_games
SELECT type FROM cards WHERE name = 'Benalish Knight'	card_games
SELECT `format` FROM `legalities` WHERE `uuid` = (SELECT `uuid` FROM `cards` WHERE `name` = 'Benalish Knight')	card_games
SELECT DISTINCT c.artist  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE fd.language = 'Phyrexian'	card_games
SELECT (COUNT(CASE WHEN borderColor = 'borderless' THEN id END) * 100.0 / COUNT(id)) AS percentage FROM cards	card_games
SELECT COUNT(*) FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE f.language = 'German' AND c.isReprint = 1	card_games
SELECT COUNT(*)  FROM cards c  JOIN foreign_data f ON c.uuid = f.uuid  WHERE c.borderColor = 'borderless' AND f.language = 'Russian'	card_games
SELECT CAST(COUNT(CASE WHEN fd.language = 'French' THEN c.id END) AS REAL) * 100 / COUNT(c.id)  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE c.isStorySpotlight = 1;	card_games
SELECT COUNT(*) FROM `cards` WHERE `toughness` = '99'	card_games
SELECT name FROM cards WHERE artist = 'Aaron Boyd'	card_games
SELECT COUNT(*) FROM `cards` WHERE `borderColor` = 'black' AND `availability` = 'mtgo'	card_games
SELECT id FROM cards WHERE convertedManaCost = 0.0	card_games
SELECT layout FROM cards WHERE keywords = 'Flying'	card_games
SELECT COUNT(*) FROM cards WHERE originalType = 'Summon - Angel' AND subtypes != 'Angel' AND subtypes IS NOT NULL;	card_games
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL	card_games
SELECT id FROM cards WHERE duelDeck = 'a'	card_games
SELECT edhrecRank FROM cards WHERE frameVersion = '2015'	card_games
SELECT DISTINCT c.artist  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE fd.language = 'Chinese Simplified'	card_games
SELECT c.name  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE c.availability = 'paper' AND fd.language = 'Japanese'  GROUP BY c.name  HAVING COUNT(DISTINCT c.availability) = 1 AND COUNT(DISTINCT fd.language) = 1	card_games
SELECT COUNT(*) FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.status = 'Banned' AND cards.borderColor = 'white'	card_games
SELECT c.uuid, fd.language  FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN foreign_data fd ON c.uuid = fd.uuid WHERE l.format = 'legacy'	card_games
SELECT r.text  FROM rulings r  JOIN cards c ON r.uuid = c.uuid  WHERE c.name = 'Beacon of Immortality'	card_games
SELECT COUNT(c.id) AS numberOfCards, l.id AS legalityStatus FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.frameVersion = 'future' GROUP BY l.id;	card_games
SELECT id, colors FROM cards WHERE setCode = 'OGW'	card_games
SELECT c.id, st.language  FROM cards c  JOIN set_translations st ON c.setCode = st.setCode  WHERE c.setCode = '10E' AND c.convertedManaCost = 5;	card_games
SELECT c.uuid, r.date  FROM cards c  JOIN rulings r ON c.uuid = r.uuid  WHERE c.originalType = 'Creature - Elf'	card_games
SELECT c.colors, l.format  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE c.id BETWEEN 1 AND 20;	card_games
SELECT c.name, c.uuid, fd.name AS foreign_name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.originalType = 'Artifact' AND c.colors = 'B'	card_games
SELECT c.name, r.date  FROM cards c  JOIN rulings r ON c.uuid = r.uuid  WHERE c.rarity = 'uncommon'  ORDER BY r.date ASC  LIMIT 3;	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'John Avon' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'UDON' AND availability = 'mtgo' AND hand = -1	card_games
SELECT COUNT(*) FROM cards WHERE frameVersion LIKE '%1993%' AND availability LIKE '%paper%' AND hasContentWarning = 1	card_games
SELECT manaCost FROM cards WHERE layout = 'normal' AND frameVersion = '2003' AND borderColor = 'black' AND availability = 'mtgo,paper'	card_games
SELECT SUM(CAST(REPLACE(manaCost, '{', '') AS INTEGER)) AS total_unconverted_mana FROM cards WHERE artist = 'Rob Alexander';	card_games
SELECT DISTINCT subtypes, supertypes FROM cards WHERE availability LIKE '%arena%' AND (subtypes IS NOT NULL OR supertypes IS NOT NULL)	card_games
SELECT setCode FROM set_translations WHERE language = 'Spanish'	card_games
SELECT CAST(SUM(CASE WHEN isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(id) FROM cards WHERE frameEffects = 'legendary'	card_games
SELECT (CAST(SUM(CASE WHEN isStorySpotlight = 1 AND isTextless = 0 THEN 1 ELSE 0 END) AS REAL) / COUNT(id)) * 100 AS percentage, id  FROM cards  WHERE isStorySpotlight = 1 AND isTextless = 0  ORDER BY id;	card_games
SELECT name, (100.0 * COUNT(*) OVER (PARTITION BY language) / COUNT(*) OVER ()) AS percentage  FROM foreign_data  WHERE language = 'Spanish'  ORDER BY name;	card_games
SELECT `language` FROM `set_translations` WHERE `setCode` IN (SELECT `code` FROM `sets` WHERE `baseSetSize` = 309)	card_games
SELECT COUNT(*) FROM `sets` AS s JOIN `set_translations` AS st ON s.code = st.setCode WHERE s.block = 'Commander' AND st.language = 'Portuguese (Brasil)'	card_games
SELECT c.id FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.types = 'Creature' AND l.status = 'Legal'	card_games
SELECT DISTINCT c.subtypes, c.supertypes  FROM cards c  JOIN foreign_data f ON c.uuid = f.uuid  WHERE f.language = 'German' AND c.subtypes IS NOT NULL AND c.supertypes IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE (power IS NULL OR power = '*') AND text LIKE '%triggered ability%'	card_games
SELECT COUNT(DISTINCT c.uuid)  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  JOIN rulings r ON c.uuid = r.uuid  WHERE l.format = 'premodern'  AND r.text = 'This is a triggered mana ability.'  AND c.side IS NULL;	card_games
SELECT c.id  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE c.artist = 'Erica Yang' AND c.availability = 'paper' AND l.format = 'pauper'	card_games
SELECT artist FROM cards WHERE uuid IN (SELECT uuid FROM foreign_data WHERE flavorText = 'Das perfekte Gegenmittel zu einer dichten Formation')	card_games
SELECT fd.name  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE fd.language = 'French' AND c.types = 'Creature' AND c.layout = 'normal' AND c.borderColor = 'black' AND c.artist = 'Matthew D. Wilson'	card_games
SELECT COUNT(DISTINCT c.uuid)  FROM cards c  JOIN rulings r ON c.uuid = r.uuid  WHERE c.rarity = 'rare' AND r.date = '2007-02-01'	card_games
SELECT st.language FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE s.baseSetSize = 180 AND s.block = 'Ravnica'	card_games
SELECT (CAST(COUNT(CASE WHEN c.hasContentWarning = 0 THEN 1 END) AS REAL) / COUNT(c.id)) * 100  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE l.format = 'commander' AND l.status = 'Legal'	card_games
SELECT CAST(SUM(CASE WHEN T2.language = 'French' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.power IS NULL OR T1.power = '*'	card_games
SELECT CAST(SUM(CASE WHEN st.language = 'Japanese' AND s.type = 'expansion' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(st.language)  FROM set_translations st  JOIN sets s ON st.setCode = s.code;	card_games
SELECT availability FROM cards WHERE artist = 'Daren Bader'	card_games
SELECT COUNT(*) FROM `cards` WHERE `borderColor` = 'borderless' AND `edhrecRank` > 12000	card_games
SELECT COUNT(*) FROM `cards` WHERE `isOversized` = 1 AND `isReprint` = 1 AND `isPromo` = 1	card_games
SELECT name FROM cards WHERE power IS NULL OR power = '*' AND promoTypes = 'arenaleague' ORDER BY name ASC LIMIT 3	card_games
SELECT language FROM foreign_data WHERE multiverseid = 149934	card_games
SELECT cardKingdomFoilId, cardKingdomId  FROM cards  WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL  ORDER BY cardKingdomFoilId  LIMIT 3	card_games
SELECT CAST(SUM(CASE WHEN isTextless = 1 AND layout = 'normal' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards	card_games
SELECT id FROM cards WHERE side IS NULL AND subtypes = 'Angel,Wizard'	card_games
SELECT `name`  FROM `sets`  WHERE `mtgoCode` IS NULL OR `mtgoCode` = ''  ORDER BY `name`  LIMIT 3	card_games
SELECT st.language FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE s.mcmName = 'Archenemy' AND s.code = 'ARC'	card_games
SELECT s.name, st.translation  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE s.id = 5;	card_games
SELECT st.language, s.type FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.id = 206	card_games
SELECT s.id, s.name  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE st.language = 'Italian' AND s.block = 'Shadowmoor'  ORDER BY s.name  LIMIT 2	card_games
SELECT s.id, s.name  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE s.isFoilOnly = 1 AND s.isForeignOnly = 1 AND st.language = 'Japanese'	card_games
SELECT s.code, s.baseSetSize  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE st.language = 'Russian'  ORDER BY s.baseSetSize DESC  LIMIT 1;	card_games
SELECT (CAST(SUM(CASE WHEN st.language = 'Chinese Simplified' AND s.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) / COUNT(s.isOnlineOnly)) * 100 AS percentage FROM sets s JOIN set_translations st ON s.code = st.setCode;	card_games
SELECT COUNT(DISTINCT s.code)  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE st.language = 'Japanese' AND (s.mtgoCode IS NULL OR s.mtgoCode = '')	card_games
SELECT id FROM cards WHERE borderColor = 'black'	card_games
SELECT COUNT(id) AS count, id FROM cards WHERE frameEffects = 'extendedart' GROUP BY id	card_games
SELECT id FROM cards WHERE borderColor = 'black' AND isFullArt = 1	card_games
SELECT language FROM set_translations WHERE id = 174	card_games
SELECT name FROM sets WHERE code = 'ALL'	card_games
SELECT language FROM foreign_data WHERE name = 'A Pedra Fellwar'	card_games
SELECT code FROM sets WHERE releaseDate = '2007-07-13'	card_games
SELECT baseSetSize, code FROM sets WHERE block IN ('Masques', 'Mirage')	card_games
SELECT code FROM sets WHERE type = 'expansion'	card_games
SELECT fd.name, c.type  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE c.watermark = 'boros'	card_games
SELECT fd.language, fd.flavorText, c.watermark  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE c.watermark = 'colorpie'	card_games
SELECT (CAST(COUNT(CASE WHEN cards.convertedManaCost = 10 THEN 1 ELSE NULL END) AS REAL) / COUNT(cards.convertedManaCost)) * 100 AS percentage  FROM cards  JOIN sets ON cards.setCode = sets.code  WHERE sets.name = 'Abyssal Horror'	card_games
SELECT code FROM sets WHERE type = 'expansion commander'	card_games
SELECT fd.name, c.type  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE c.watermark = 'abzan'	card_games
SELECT fd.language, c.type  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE c.watermark = 'azorius'	card_games
SELECT COUNT(*)  FROM `cards`  WHERE `artist` = 'Aaron Miller'  AND `cardKingdomFoilId` IS NOT NULL  AND `cardKingdomId` IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE availability LIKE '%paper%' AND hand = '3'	card_games
SELECT name FROM cards WHERE isTextless = 0	card_games
SELECT LENGTH(manaCost) - LENGTH(REPLACE(manaCost, '{', '')) + 1 AS unconvertedManaCost FROM cards WHERE name = 'Ancestor''s Chosen'	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND (power = '*' OR power IS NULL)	card_games
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL	card_games
SELECT subtypes, supertypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer'	card_games
SELECT purchaseUrls FROM cards WHERE promoTypes = 'bundle'	card_games
SELECT COUNT(DISTINCT artist)  FROM cards  WHERE border_color = 'black' AND availability LIKE '%arena,mtgo%'	card_games
SELECT name FROM cards WHERE name = 'Serra Angel' OR name = 'Shrine Keeper' ORDER BY convertedManaCost DESC LIMIT 1	card_games
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer'	card_games
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3	card_games
SELECT st.translation  FROM set_translations st  JOIN cards c ON st.setCode = c.setCode  WHERE st.language = 'Italian' AND c.name = 'Ancestor''s Chosen'	card_games
SELECT COUNT(DISTINCT `translation`) FROM `set_translations` WHERE `setCode` IN (SELECT `setCode` FROM `cards` WHERE `name` = 'Angel of Mercy')	card_games
SELECT c.name FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition'	card_games
SELECT st.translation  FROM cards c  JOIN set_translations st ON c.setCode = st.setCode  WHERE c.name = 'Ancestor''s Chosen' AND st.language = 'Korean'	card_games
SELECT COUNT(*) FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition' AND c.artist = 'Adam Rex'	card_games
SELECT baseSetSize FROM sets WHERE code = (SELECT setCode FROM set_translations WHERE translation = 'Hauptset Zehnte Edition')	card_games
SELECT st.translation FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE s.name = 'Eighth Edition' AND st.language = 'Chinese Simplified'	card_games
SELECT s.mtgoCode IS NOT NULL AS appearedOnline FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.name = 'Angel of Mercy'	card_games
SELECT s.releaseDate FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Ancestor''s Chosen'	card_games
SELECT s.type FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition'	card_games
SELECT COUNT(*) FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.block = 'Ice Age' AND st.language = 'Italian' AND st.translation IS NOT NULL	card_games
SELECT s.isForeignOnly FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Adarkar Valkyrie'	card_games
SELECT COUNT(DISTINCT s.code)  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE st.language = 'Italian' AND s.baseSetSize < 100;	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND setCode = (SELECT code FROM sets WHERE name = 'Coldsnap')	card_games
SELECT name FROM cards WHERE setCode = 'CSP' AND convertedManaCost = (SELECT MAX(convertedManaCost) FROM cards WHERE setCode = 'CSP')	card_games
SELECT artist FROM cards WHERE setCode IN (SELECT code FROM sets WHERE name = 'Coldsnap') AND artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy')	card_games
SELECT c.name FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap' AND c.number = '4'	card_games
SELECT COUNT(*)  FROM cards AS T1  JOIN sets AS T2 ON T1.setCode = T2.code  WHERE T2.name = 'Coldsnap' AND T1.convertedManaCost > 5 AND (T1.power = '*' OR T1.power IS NULL)	card_games
SELECT fd.flavorText FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE fd.language = 'Italian' AND c.name = 'Ancestor''s Chosen'	card_games
SELECT DISTINCT fd.language  FROM foreign_data fd  JOIN cards c ON fd.uuid = c.uuid  WHERE c.name = 'Ancestor''s Chosen' AND fd.flavorText IS NOT NULL	card_games
SELECT T2.type FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'German' AND T1.name = 'Ancestor''s Chosen'	card_games
SELECT c.name, fd.text  FROM cards c  JOIN sets s ON c.setCode = s.code  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE s.name = 'Coldsnap' AND fd.language = 'Italian'	card_games
SELECT fd.name  FROM foreign_data fd  JOIN cards c ON fd.uuid = c.uuid  JOIN sets s ON c.setCode = s.code  WHERE fd.language = 'Italian' AND s.name = 'Coldsnap'  AND c.convertedManaCost = (SELECT MAX(convertedManaCost) FROM cards WHERE setCode IN (SELECT code FROM sets WHERE name = 'Coldsnap'))	card_games
SELECT r.date  FROM rulings r  JOIN cards c ON r.uuid = c.uuid  WHERE c.name = 'Reminisce'	card_games
SELECT CAST(SUM(CASE WHEN c.convertedManaCost = 7 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM cards c  JOIN sets s ON c.setCode = s.code  WHERE s.name = 'Coldsnap'	card_games
SELECT CAST(SUM(CASE WHEN c.cardKingdomFoilId IS NOT NULL AND c.cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap'	card_games
SELECT code FROM sets WHERE releaseDate = '2017-07-14'	card_games
SELECT keyruneCode FROM sets WHERE code = 'PKHC'	card_games
SELECT mcmId FROM sets WHERE code = 'SS2'	card_games
SELECT mcmName FROM sets WHERE releaseDate = '2017-06-09'	card_games
SELECT type FROM sets WHERE name = 'From the Vault: Lore'	card_games
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized'	card_games
SELECT c.text, r.text, c.hasContentWarning  FROM cards c  JOIN rulings r ON c.uuid = r.uuid  WHERE c.artist = 'Jim Pavelec'	card_games
SELECT s.releaseDate FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Evacuation'	card_games
SELECT s.baseSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Rinascita di Alara'	card_games
SELECT s.type  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE st.translation = 'Huitième édition'	card_games
SELECT st.translation  FROM set_translations st  JOIN cards c ON st.setCode = c.setCode  WHERE st.language = 'French' AND c.name = 'Tendo Ice Bridge'	card_games
SELECT COUNT(*) FROM set_translations WHERE setCode IN (SELECT code FROM sets WHERE name = 'Tenth Edition') AND translation IS NOT NULL	card_games
SELECT st.translation  FROM set_translations st  JOIN cards c ON st.setCode = c.setCode  WHERE st.language = 'Japanese' AND c.name = 'Fellwar Stone'	card_games
SELECT c.name  FROM cards c  JOIN sets s ON c.setCode = s.code  WHERE s.name = 'Journey into Nyx Hero''s Path'  ORDER BY c.convertedManaCost DESC  LIMIT 1	card_games
SELECT s.releaseDate FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Ola de frío'	card_games
SELECT s.type FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Samite Pilgrim'	card_games
SELECT COUNT(*) FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'World Championship Decks 2004' AND c.convertedManaCost = 3.0	card_games
SELECT st.translation FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE st.language = 'Chinese Simplified' AND s.name = 'Mirrodin'	card_games
SELECT (SUM(CASE WHEN s.isNonFoilOnly = 1 THEN 1 ELSE 0 END) / COUNT(st.language)) * 100 AS percentage FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Japanese'	card_games
SELECT CAST(SUM(CASE WHEN s.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM sets s  JOIN set_translations st  ON s.code = st.setCode  WHERE st.language = 'Portuguese (Brazil)'	card_games
SELECT availability FROM cards WHERE artist = 'Aleksi Briclot' AND isTextless = 1	card_games
SELECT id FROM sets WHERE baseSetSize = (SELECT MAX(baseSetSize) FROM sets)	card_games
SELECT artist FROM cards WHERE side IS NULL ORDER BY convertedManaCost DESC LIMIT 1	card_games
SELECT frameEffects  FROM cards  WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL  GROUP BY frameEffects  ORDER BY COUNT(*) DESC  LIMIT 1	card_games
SELECT COUNT(*) FROM cards WHERE duelDeck = 'a' AND hasFoil = 0 AND (power IS NULL OR power = '*')	card_games
SELECT id FROM sets WHERE type = 'commander' ORDER BY totalSetSize DESC LIMIT 1	card_games
SELECT c.name, c.manaCost  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE l.format = 'duel'  ORDER BY LENGTH(c.manaCost) - LENGTH(REPLACE(c.manaCost, '{', '')) DESC  LIMIT 10;	card_games
SELECT c.originalReleaseDate, l.format  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE c.rarity = 'mythic' AND l.status = 'legal'  ORDER BY c.originalReleaseDate ASC  LIMIT 1;	card_games
SELECT COUNT(DISTINCT c.id)  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE c.artist = 'Volkan Baǵa' AND fd.language = 'French'	card_games
SELECT COUNT(DISTINCT c.id)  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE c.name = 'Abundance'  AND c.rarity = 'rare'  AND c.types = 'Enchantment'  AND l.status = 'Legal'	card_games
SELECT l.format, c.name FROM legalities l JOIN cards c ON l.uuid = c.uuid WHERE l.status = 'Banned' GROUP BY l.format HAVING COUNT(l.status) = (     SELECT MAX(banned_count)      FROM (         SELECT COUNT(status) AS banned_count         FROM legalities         WHERE status = 'Banned'         GROUP BY format     ) )	card_games
SELECT st.language FROM set_translations st INNER JOIN sets s ON st.id = s.id WHERE s.name = 'Battlebond'	card_games
SELECT c.artist, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.artist = (     SELECT artist     FROM cards     GROUP BY artist     ORDER BY COUNT(*) ASC     LIMIT 1 )	card_games
SELECT l.status  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE c.frameVersion = '1997'  AND c.artist = 'D. Alexander Gregory'  AND (c.hasContentWarning = 1 OR c.artist = 'Wizards of the Coast')  AND l.format = 'legacy'	card_games
SELECT c.name, l.format  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE c.edhrecRank = 1 AND l.status = 'Banned'	card_games
SELECT AVG(T1.id) AS annual_avg_sets, (SELECT language FROM set_translations WHERE id = (SELECT id FROM (SELECT id, COUNT(language) AS lang_count FROM set_translations GROUP BY id ORDER BY lang_count DESC LIMIT 1))) AS common_language FROM sets AS T1 WHERE T1.releaseDate BETWEEN '2012-01-01' AND '2015-12-31' GROUP BY YEAR(T1.releaseDate)	card_games
SELECT artist FROM cards WHERE availability = 'arena' AND artist IN (SELECT artist FROM cards WHERE artist IN (SELECT artist FROM cards WHERE availability = 'mtgo,paper') AND artist IN (SELECT artist FROM cards WHERE availability = 'arena'))	card_games
SELECT uuid FROM legalities WHERE `format` = 'oldschool' AND (`status` = 'banned' OR `status` = 'restricted')	card_games
SELECT COUNT(*) FROM `cards` WHERE `artist` = 'Matthew D. Wilson' AND `availability` = 'paper'	card_games
SELECT r.date, r.text  FROM rulings r  JOIN cards c ON r.uuid = c.uuid  WHERE c.artist = 'Kev Walker'  ORDER BY r.date DESC;	card_games
SELECT c.name, l.format FROM cards c JOIN sets s ON c.setCode = s.code JOIN legalities l ON c.uuid = l.uuid WHERE s.name = 'Hour of Devastation' AND l.status = 'Legal'	card_games
SELECT s.name FROM sets s WHERE s.code IN (SELECT setCode FROM set_translations WHERE language = 'Korean') AND s.code NOT IN (SELECT setCode FROM set_translations WHERE language = 'Japanese')	card_games
SELECT c.frameVersion, c.name  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE c.artist = 'Allen Williams' AND l.status = 'Banned'	card_games
SELECT DisplayName FROM users WHERE DisplayName IN ('Harlan', 'Jarrod Dixon') ORDER BY Reputation DESC LIMIT 1	codebase_community
SELECT DisplayName FROM users WHERE strftime('%Y', CreationDate) = '2011'	codebase_community
SELECT COUNT(*) FROM `users` WHERE `LastAccessDate` > '2014-09-01'	codebase_community
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1	codebase_community
SELECT COUNT(*) FROM users WHERE Upvotes > 100 AND Downvotes > 1	codebase_community
SELECT COUNT(*) FROM users WHERE Views > 10 AND CreationDate > '2013-12-31 23:59:59.999'	codebase_community
SELECT COUNT(*) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie'	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie'	codebase_community
SELECT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Eliciting priors from experts'	codebase_community
SELECT p.Title  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.DisplayName = 'csgillespie'  ORDER BY p.ViewCount DESC  LIMIT 1;	codebase_community
SELECT u.DisplayName  FROM users u  JOIN posts p ON u.Id = p.OwnerUserId  WHERE p.FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts)	codebase_community
SELECT SUM(CommentCount) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')	codebase_community
SELECT MAX(p.AnswerCount)  FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie'	codebase_community
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.LastEditorUserId WHERE p.Title = 'Examples for teaching: Correlation does not mean causation'	codebase_community
SELECT COUNT(*) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' AND p.ParentId IS NULL	codebase_community
SELECT u.DisplayName  FROM users u  JOIN posts p ON u.Id = p.OwnerUserId  WHERE p.ClosedDate IS NOT NULL	codebase_community
SELECT COUNT(*) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.Age > 65 AND p.Score >= 20	codebase_community
SELECT u.Location FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Title = 'Eliciting priors from experts'	codebase_community
SELECT p.Body FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'bayesian'	codebase_community
SELECT p.Body  FROM posts p  JOIN tags t ON p.Id = t.ExcerptPostId  WHERE t.Count = (SELECT MAX(Count) FROM tags)	codebase_community
SELECT COUNT(*) FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie'	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie'	codebase_community
SELECT COUNT(*)  FROM `badges` b JOIN `users` u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie' AND YEAR(b.Date) = 2011;	codebase_community
SELECT `DisplayName`  FROM `users`  WHERE `Id` = (     SELECT `UserId`      FROM `badges`      GROUP BY `UserId`      ORDER BY COUNT(`Id`) DESC      LIMIT 1 )	codebase_community
SELECT AVG(Score) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')	codebase_community
SELECT CAST(COUNT(b.Id) AS REAL) / COUNT(DISTINCT u.Id)  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.Views > 200;	codebase_community
SELECT CAST(SUM(CASE WHEN u.Age > 65 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(p.Id)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE p.Score > 5	codebase_community
SELECT COUNT(*) FROM `votes` WHERE `UserId` = 58 AND `CreationDate` = '2010-07-19'	codebase_community
SELECT CreationDate FROM votes GROUP BY CreationDate ORDER BY COUNT(Id) DESC LIMIT 1	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = 'Revival'	codebase_community
SELECT p.Title FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.Score = (SELECT MAX(Score) FROM comments)	codebase_community
SELECT COUNT(c.Id) FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ViewCount = 1910	codebase_community
SELECT p.FavoriteCount FROM posts p INNER JOIN comments c ON p.Id = c.PostId WHERE c.CreationDate = '2014-04-23 20:29:39.0' AND c.UserId = 3025	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ParentId = 107829 LIMIT 1	codebase_community
SELECT p.Id, CASE WHEN p.ClosedDate IS NULL THEN 'Not Well-Finished' ELSE 'Well-Finished' END AS PostStatus  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE c.CreationDate = '2013-07-12 09:08:18.0' AND c.UserId = 23853;	codebase_community
SELECT u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Id = 65041	codebase_community
SELECT COUNT(*) FROM `posts` p JOIN `users` u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Tiago Pasqualini'	codebase_community
SELECT u.DisplayName FROM users u JOIN votes v ON u.Id = v.UserId WHERE v.Id = 6347	codebase_community
SELECT COUNT(*) FROM votes WHERE PostId IN (SELECT Id FROM posts WHERE Title LIKE '%data visualization%')	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'DatEpicCoderGuyWhoPrograms'	codebase_community
SELECT CAST(COUNT(p.Id) AS FLOAT) / COUNT(v.Id)  FROM posts p  LEFT JOIN votes v ON p.OwnerUserId = v.UserId  WHERE p.OwnerUserId = 24;	codebase_community
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer'	codebase_community
SELECT Text FROM comments WHERE Score = 17	codebase_community
SELECT `DisplayName` FROM `users` WHERE `WebsiteUrl` = 'http://stackoverflow.com'	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'SilentGhost'	codebase_community
SELECT u.DisplayName FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'thank you user93!'	codebase_community
SELECT c.Text  FROM comments c  JOIN users u ON c.UserId = u.Id  WHERE u.DisplayName = 'A Lion.'	codebase_community
SELECT u.DisplayName, u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Title = 'Understanding what Dassault iSight is doing?'	codebase_community
SELECT c.Text  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE p.Title = 'How does gentle boosting differ from AdaBoost?';	codebase_community
SELECT u.DisplayName  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE b.Name = 'Necromancer'  LIMIT 10	codebase_community
SELECT u.DisplayName  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE p.Title = 'Open source tools for visualizing multi-dimensional data'	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Vebjorn Ljosa'	codebase_community
SELECT SUM(p.Score) AS TotalScore, u.WebsiteUrl  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  JOIN users e ON p.LastEditorUserId = e.Id  WHERE e.DisplayName = 'Yevgeny'  GROUP BY u.WebsiteUrl;	codebase_community
SELECT ph.Comment  FROM postHistory ph JOIN posts p ON ph.PostId = p.Id WHERE p.Title = 'Why square the difference instead of taking the absolute value in standard deviation?';	codebase_community
SELECT SUM(BountyAmount) FROM votes WHERE PostId IN (SELECT Id FROM posts WHERE Title LIKE '%data%')	codebase_community
SELECT u.DisplayName  FROM users u JOIN votes v ON u.Id = v.UserId JOIN posts p ON v.PostId = p.Id WHERE v.BountyAmount = 50 AND p.Title LIKE '%variance%'	codebase_community
SELECT p.Title, c.Text, AVG(p.ViewCount) AS AverageViewCount FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId JOIN comments c ON p.Id = c.PostId WHERE t.TagName = 'humor' GROUP BY p.Title, c.Text;	codebase_community
SELECT COUNT(*) FROM comments WHERE UserId = 13	codebase_community
SELECT Id FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users)	codebase_community
SELECT Id FROM users ORDER BY Views ASC LIMIT 1	codebase_community
SELECT COUNT(*) FROM `badges` WHERE `Name` = 'Supporter' AND STRFTIME('%Y', `Date`) = '2011'	codebase_community
SELECT COUNT(UserId) FROM badges GROUP BY UserId HAVING COUNT(Name) > 5	codebase_community
SELECT COUNT(DISTINCT b.UserId)  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.Location = 'New York, NY'  AND b.Name IN ('Teacher', 'Supporter')  GROUP BY b.UserId  HAVING COUNT(DISTINCT b.Name) = 2	codebase_community
SELECT u.Id, u.Reputation FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.PostId = 1	codebase_community
SELECT u.Id  FROM users u JOIN postHistory ph ON u.Id = ph.UserId JOIN posts p ON ph.PostId = p.Id WHERE p.ViewCount >= 1000 GROUP BY u.Id HAVING COUNT(DISTINCT ph.PostId) = 1;	codebase_community
SELECT b.Name  FROM badges b  JOIN users u ON b.UserId = u.Id  JOIN (     SELECT UserId, COUNT(Id) as comment_count      FROM comments      GROUP BY UserId ) c ON u.Id = c.UserId  WHERE c.comment_count = (     SELECT MAX(comment_count)      FROM (         SELECT COUNT(Id) as comment_count          FROM comments          GROUP BY UserId     ) )	codebase_community
SELECT COUNT(*) FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Location = 'India' AND b.Name = 'Teacher'	codebase_community
SELECT ((COUNT(CASE WHEN Name = 'Student' AND strftime('%Y', Date) = '2010' THEN 1 END) * 100.0 / COUNT(*)) - (COUNT(CASE WHEN Name = 'Student' AND strftime('%Y', Date) = '2011' THEN 1 END) * 100.0 / COUNT(*))) AS PercentageDifference FROM badges	codebase_community
SELECT ph.PostHistoryTypeId, COUNT(DISTINCT c.UserId)  FROM postHistory ph  LEFT JOIN comments c ON ph.PostId = c.PostId  WHERE ph.PostId = 3720  GROUP BY ph.PostHistoryTypeId;	codebase_community
SELECT p.Id, p.ViewCount  FROM posts p  JOIN postLinks pl ON p.Id = pl.PostId  WHERE pl.PostId = 61217;	codebase_community
SELECT p.Score, pl.LinkTypeId  FROM posts p  JOIN postLinks pl ON p.Id = pl.PostId  WHERE pl.LinkTypeId = 395;	codebase_community
SELECT p.Id, ph.UserId  FROM posts p  JOIN postHistory ph ON p.Id = ph.PostId  WHERE p.Score > 60	codebase_community
SELECT SUM(posts.FavoriteCount)  FROM postHistory  JOIN posts ON postHistory.PostId = posts.Id  WHERE postHistory.UserId = 686 AND strftime('%Y', postHistory.CreationDate) = '2011'	codebase_community
SELECT CAST(SUM(u.UpVotes) AS REAL) / COUNT(u.Id) AS AvgUpVotes, CAST(SUM(u.Age) AS REAL) / COUNT(u.Id) AS AvgAge  FROM users u  JOIN posts p ON u.Id = p.OwnerUserId  GROUP BY u.Id  HAVING COUNT(p.Id) > 10	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = 'Announcer'	codebase_community
SELECT Name FROM badges WHERE Date = '2010-07-19 19:39:08.0'	codebase_community
SELECT COUNT(*) FROM comments WHERE score > 60	codebase_community
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:25:47.0'	codebase_community
SELECT COUNT(*) FROM posts WHERE Score = 10	codebase_community
SELECT b.Name  FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MAX(Reputation) FROM users)	codebase_community
SELECT u.Reputation  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE b.Date = '2010-07-19 19:39:08.0'	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Pierre'	codebase_community
SELECT b.Date  FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Location = 'Rochester, NY'	codebase_community
SELECT (CAST(COUNT(CASE WHEN b.Name = 'Teacher' THEN b.UserId END) AS REAL) / COUNT(u.Id)) * 100  FROM badges b  JOIN users u ON b.UserId = u.Id	codebase_community
SELECT CAST(SUM(CASE WHEN u.Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(b.UserId)  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE b.Name = 'Organizer'	codebase_community
SELECT Score FROM comments WHERE CreationDate = '2010-07-19 19:19:56.0'	codebase_community
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:37:33.0'	codebase_community
SELECT users.Age  FROM users  JOIN badges ON users.Id = badges.UserId  WHERE users.Location = 'Vienna, Austria'	codebase_community
SELECT COUNT(*) FROM badges AS b JOIN users AS u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age BETWEEN 19 AND 65	codebase_community
SELECT u.Views FROM users u INNER JOIN badges b ON u.Id = b.UserId WHERE b.Date = '2010-07-19 19:39:07.0'	codebase_community
SELECT DISTINCT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MIN(Reputation) FROM users)	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Sharpie'	codebase_community
SELECT COUNT(*)  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE b.Name = 'Supporter' AND u.Age > 65	codebase_community
SELECT DisplayName FROM users WHERE Id = 30	codebase_community
SELECT COUNT(*) FROM `users` WHERE `Location` = 'New York, NY'	codebase_community
SELECT COUNT(*) FROM `votes` WHERE YEAR(CreationDate) = 2010	codebase_community
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT DisplayName FROM users WHERE Views = (SELECT MAX(Views) FROM users)	codebase_community
SELECT CAST(COUNT(CASE WHEN YEAR(CreationDate) = 2010 THEN 1 END) AS FLOAT) / COUNT(CASE WHEN YEAR(CreationDate) = 2011 THEN 1 END) FROM votes	codebase_community
SELECT t.TagName FROM tags t JOIN posts p ON t.ExcerptPostId = p.Id JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'John Salvatier'	codebase_community
SELECT COUNT(*) FROM postHistory WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Daniel Vassallo')	codebase_community
SELECT COUNT(*) FROM votes WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Harlan')	codebase_community
SELECT p.Id  FROM posts p  JOIN postHistory ph ON p.Id = ph.PostId  JOIN users u ON ph.UserId = u.Id  WHERE u.DisplayName = 'slashnick'  ORDER BY p.AnswerCount DESC  LIMIT 1;	codebase_community
SELECT p.Id, p.ViewCount, u.DisplayName  FROM posts p  JOIN postHistory ph ON p.Id = ph.PostId  JOIN users u ON ph.UserId = u.Id  WHERE u.DisplayName IN ('Harvey Motulsky', 'Noah Snyder')  ORDER BY p.ViewCount DESC  LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM posts p  JOIN postHistory ph ON p.Id = ph.PostId  JOIN users u ON ph.UserId = u.Id  JOIN votes v ON p.Id = v.PostId  WHERE u.DisplayName = 'Matt Parker'  GROUP BY p.Id  HAVING COUNT(v.Id) > 4;	codebase_community
SELECT COUNT(c.Id)  FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON p.OwnerUserId = u.Id WHERE c.Score < 60 AND u.DisplayName = 'Neil McGuigan'	codebase_community
SELECT DISTINCT p.Tags  FROM posts p  JOIN postHistory ph ON p.Id = ph.PostId  JOIN users u ON ph.UserId = u.Id  WHERE u.DisplayName = 'Mark Meckes' AND p.CommentCount = 0;	codebase_community
SELECT u.DisplayName  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE b.Name = 'Organizer'	codebase_community
SELECT CAST(COUNT(CASE WHEN t.TagName = 'r' THEN ph.PostId END) AS REAL) / COUNT(ph.PostId) AS percentage  FROM postHistory ph  JOIN users u ON ph.UserId = u.Id  JOIN tags t ON t.ExcerptPostId = ph.PostId  WHERE u.DisplayName = 'Community'	codebase_community
SELECT SUM(CASE WHEN u.DisplayName = 'Mornington' THEN p.ViewCount ELSE 0 END) - SUM(CASE WHEN u.DisplayName = 'Amos' THEN p.ViewCount ELSE 0 END) AS ViewCountDifference FROM posts p JOIN users u ON p.OwnerUserId = u.Id;	codebase_community
SELECT COUNT(*) FROM `badges` WHERE `Name` = 'Commentator' AND YEAR(`Date`) = 2014	codebase_community
SELECT COUNT(*) FROM `postHistory` WHERE `CreationDate` BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59'	codebase_community
SELECT `DisplayName`, `Age` FROM `users` WHERE `Views` = (SELECT MAX(`Views`) FROM `users`)	codebase_community
SELECT `LastEditDate`, `LastEditorUserId` FROM `posts` WHERE `Title` = 'Detecting a given face in a database of facial images'	codebase_community
SELECT COUNT(*) FROM `comments` WHERE `UserId` = 13 AND `Score` < 60;	codebase_community
SELECT p.Title, c.UserDisplayName  FROM posts p  JOIN comments c ON p.Id = c.PostId  WHERE c.Score > 60;	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE STRFTIME('%Y', b.Date) = '2011' AND u.Location = 'North Pole'	codebase_community
SELECT u.DisplayName, u.WebsiteUrl  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE p.FavoriteCount > 150;	codebase_community
SELECT p.Title, COUNT(ph.Id) AS PostHistoryCount, p.LastEditDate  FROM posts p  LEFT JOIN postHistory ph ON p.Id = ph.PostId  WHERE p.Title = 'What is the best introductory Bayesian statistics textbook?'  GROUP BY p.Id, p.Title, p.LastEditDate	codebase_community
SELECT users.LastAccessDate, users.Location  FROM users  JOIN badges ON users.Id = badges.UserId  WHERE badges.Name = 'Outliers'	codebase_community
SELECT p2.Title  FROM postLinks pl  JOIN posts p1 ON pl.PostId = p1.Id  JOIN posts p2 ON pl.RelatedPostId = p2.Id  WHERE p1.Title = 'How to tell if something happened in a data set which monitors a value over time'	codebase_community
SELECT ph.PostId, b.Name  FROM postHistory ph  JOIN badges b ON ph.UserId = b.UserId  WHERE ph.UserDisplayName = 'Samuel' AND YEAR(ph.CreationDate) = 2013 AND YEAR(b.Date) = 2013;	codebase_community
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ViewCount = (SELECT MAX(ViewCount) FROM posts)	codebase_community
SELECT u.DisplayName, u.Location  FROM users u  JOIN posts p ON u.Id = p.OwnerUserId  JOIN tags t ON p.Id = t.ExcerptPostId  WHERE t.TagName = 'hypothesis-testing'	codebase_community
SELECT p.Title, pl.LinkTypeId  FROM postLinks pl  JOIN posts p ON p.Id = pl.RelatedPostId  JOIN posts mainPost ON mainPost.Id = pl.PostId  WHERE mainPost.Title = 'What are principal component scores?';	codebase_community
SELECT u.DisplayName  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE p.Id = (     SELECT ParentId      FROM posts      WHERE ParentId IS NOT NULL      ORDER BY Score DESC      LIMIT 1 )	codebase_community
SELECT u.DisplayName, u.WebsiteUrl  FROM users u  JOIN votes v ON u.Id = v.UserId  WHERE v.VoteTypeId = 8  ORDER BY v.BountyAmount DESC  LIMIT 1;	codebase_community
SELECT Title FROM posts WHERE ViewCount IS NOT NULL ORDER BY ViewCount DESC LIMIT 5	codebase_community
SELECT COUNT(*) FROM `tags` WHERE `Count` BETWEEN 5000 AND 7000	codebase_community
SELECT OwnerUserId FROM posts WHERE FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts)	codebase_community
SELECT Age FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users)	codebase_community
SELECT COUNT(DISTINCT v.PostId)  FROM votes v  WHERE YEAR(v.CreationDate) = 2011 AND v.BountyAmount = 50;	codebase_community
SELECT Id FROM users WHERE Age = (SELECT MIN(Age) FROM users)	codebase_community
SELECT SUM(Score) FROM posts WHERE LasActivityDate LIKE '2010-07-19%'	codebase_community
SELECT CAST(COUNT(pl.Id) AS FLOAT) / 12 AS AvgMonthlyLinks FROM postLinks pl JOIN posts p ON pl.PostId = p.Id WHERE STRFTIME('%Y', pl.CreationDate) = '2010' AND p.AnswerCount <= 2	codebase_community
SELECT p.Id  FROM posts p  JOIN votes v ON p.Id = v.PostId  WHERE v.UserId = 1465  ORDER BY p.FavoriteCount DESC  LIMIT 1;	codebase_community
SELECT p.Title  FROM posts p  JOIN postLinks pl ON p.Id = pl.PostId  ORDER BY p.CreaionDate  LIMIT 1	codebase_community
SELECT u.DisplayName  FROM users u  JOIN badges b ON u.Id = b.UserId  GROUP BY u.Id  ORDER BY COUNT(b.Id) DESC  LIMIT 1;	codebase_community
SELECT MIN(CreationDate)  FROM votes  JOIN users ON votes.UserId = users.Id  WHERE users.DisplayName = 'chl'	codebase_community
SELECT MIN(p.CreaionDate)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.Age = (SELECT MAX(Age) FROM users)	codebase_community
SELECT u.DisplayName  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE b.Name = 'Autobiographer'  ORDER BY b.Date ASC  LIMIT 1	codebase_community
SELECT COUNT(DISTINCT p.OwnerUserId)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.Location = 'United Kingdom' AND p.FavoriteCount >= 4;	codebase_community
SELECT AVG(PostId) FROM votes WHERE UserId IN (SELECT Id FROM users WHERE Age = (SELECT MAX(Age) FROM users))	codebase_community
SELECT DisplayName FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users)	codebase_community
SELECT COUNT(*) FROM `users` WHERE `Reputation` > 2000 AND `Views` > 1000	codebase_community
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65	codebase_community
SELECT COUNT(p.Id)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.DisplayName = 'Jay Stevens' AND YEAR(p.CreaionDate) = 2010;	codebase_community
SELECT p.Id, p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky' ORDER BY p.ViewCount DESC LIMIT 1	codebase_community
SELECT p.Id, p.Title FROM posts p WHERE p.Score = (SELECT MAX(Score) FROM posts)	codebase_community
SELECT AVG(Score) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Stephen Turner')	codebase_community
SELECT u.DisplayName  FROM users u  JOIN posts p ON u.Id = p.OwnerUserId  WHERE p.ViewCount > 20000 AND YEAR(p.CreationDate) = 2011;	codebase_community
SELECT p.Id, u.DisplayName  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.CreationDate BETWEEN '2010-01-01' AND '2010-12-31'  ORDER BY p.FavoriteCount DESC  LIMIT 1;	codebase_community
SELECT (CAST(COUNT(p.Id) AS FLOAT) / (SELECT COUNT(Id) FROM posts)) * 100  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.Reputation > 1000 AND STRFTIME('%Y', p.CreaionDate) = '2011'	codebase_community
SELECT CAST(COUNT(Id) FILTER (WHERE Age BETWEEN 13 AND 18) AS REAL) * 100 / COUNT(Id) AS percentage FROM users;	codebase_community
SELECT p.ViewCount, u.DisplayName  FROM posts p  JOIN postHistory ph ON p.Id = ph.PostId  JOIN users u ON p.LastEditorUserId = u.Id  WHERE ph.Text = 'Computer Game Datasets'	codebase_community
SELECT COUNT(*) FROM `posts` WHERE `ViewCount` > (SELECT AVG(`ViewCount`) FROM `posts` WHERE `ViewCount` IS NOT NULL)	codebase_community
SELECT COUNT(*) FROM comments WHERE PostId = (SELECT Id FROM posts ORDER BY Score DESC LIMIT 1)	codebase_community
SELECT COUNT(*) FROM `posts` WHERE `ViewCount` > 35000 AND `CommentCount` = 0	codebase_community
SELECT u.DisplayName, u.Location  FROM users u  JOIN posts p ON u.Id = p.OwnerUserId  WHERE p.Id = 183  ORDER BY p.LastEditDate DESC  LIMIT 1;	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Emmett' ORDER BY b.Date DESC LIMIT 1	codebase_community
SELECT COUNT(*) FROM `users` WHERE `Age` BETWEEN 19 AND 65 AND `UpVotes` > 5000;	codebase_community
SELECT julianday(b.Date) - julianday(u.CreationDate) AS DaysToBadge FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Zolomon'	codebase_community
SELECT p.OwnerUserId, COUNT(p.Id) AS NumberOfPosts, COUNT(c.Id) AS NumberOfComments FROM posts p LEFT JOIN comments c ON p.Id = c.PostId WHERE p.OwnerUserId = (SELECT Id FROM users WHERE CreationDate = (SELECT MAX(CreationDate) FROM users)) GROUP BY p.OwnerUserId;	codebase_community
SELECT c.Text, u.DisplayName  FROM comments c  JOIN users u ON c.UserId = u.Id  JOIN posts p ON c.PostId = p.Id  WHERE p.Title = 'Analysing wind data with R'  ORDER BY c.CreationDate DESC  LIMIT 10;	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = 'Citizen Patrol'	codebase_community
SELECT COUNT(*) FROM tags WHERE TagName = 'careers'	codebase_community
SELECT Reputation, Views FROM users WHERE DisplayName = 'Jarrod Dixon'	codebase_community
SELECT AnswerCount, CommentCount FROM posts WHERE Title = 'Clustering 1D data'	codebase_community
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat'	codebase_community
SELECT COUNT(*) FROM votes WHERE BountyAmount >= 30	codebase_community
SELECT CAST(SUM(CASE WHEN p.Score > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(p.Id) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.Reputation = (SELECT MAX(Reputation) FROM users)	codebase_community
SELECT COUNT(*) FROM `posts` WHERE `Score` < 20;	codebase_community
SELECT COUNT(*) FROM `tags` WHERE `Id` < 15 AND `Count` <= 20;	codebase_community
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample'	codebase_community
SELECT u.Reputation, u.UpVotes FROM users u INNER JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'fine, you win :)'	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title LIKE '%linear regression%'	codebase_community
SELECT c.Text  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE p.ViewCount BETWEEN 100 AND 150  ORDER BY c.Score DESC  LIMIT 1	codebase_community
SELECT u.CreationDate, u.Age  FROM users u  JOIN comments c ON u.Id = c.UserId  WHERE c.Id IN (     SELECT Id      FROM comments      WHERE CreationDate LIKE '%http://%' )	codebase_community
SELECT COUNT(DISTINCT c.PostId)  FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.Score = 0 AND p.ViewCount < 5;	codebase_community
SELECT COUNT(*)  FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.CommentCount = 1 AND c.Score = 0;	codebase_community
SELECT COUNT(DISTINCT u.Id)  FROM comments c  JOIN users u ON c.UserId = u.Id  WHERE c.Score = 0 AND u.Age = 40;	codebase_community
SELECT p.Id, c.Text  FROM posts p  JOIN comments c ON p.Id = c.PostId  WHERE p.Title = 'Group differences on a five point Likert item'	codebase_community
SELECT u.UpVotes FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'R is also lazy evaluated.'	codebase_community
SELECT c.Text  FROM comments c  JOIN users u ON c.UserId = u.Id  WHERE u.DisplayName = 'Harvey Motulsky'	codebase_community
SELECT u.DisplayName FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Score BETWEEN 1 AND 5 AND u.DownVotes = 0	codebase_community
SELECT CAST(SUM(CASE WHEN u.UpVotes = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(c.Id)  FROM comments c  JOIN users u ON c.UserId = u.Id  WHERE c.Score BETWEEN 5 AND 10;	codebase_community
SELECT sp.power_name  FROM superhero sh  JOIN hero_power hp ON sh.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE sh.superhero_name = '3-D Man'	superhero
SELECT COUNT(DISTINCT hero_id)  FROM hero_power  JOIN superpower ON hero_power.power_id = superpower.id  WHERE superpower.power_name = 'Super Strength'	superhero
SELECT COUNT(*)  FROM superhero s  JOIN hero_power hp ON s.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'Super Strength' AND s.height_cm > 200;	superhero
SELECT full_name FROM superhero WHERE id IN (SELECT hero_id FROM hero_power GROUP BY hero_id HAVING COUNT(power_id) > 15)	superhero
SELECT COUNT(*) FROM `superhero` WHERE `eye_colour_id` = (SELECT `id` FROM `colour` WHERE `colour` = 'Blue')	superhero
SELECT c.colour FROM colour c JOIN superhero s ON c.id = s.skin_colour_id WHERE s.superhero_name = 'Apocalypse'	superhero
SELECT COUNT(DISTINCT hp.hero_id)  FROM hero_power hp  JOIN superpower sp ON hp.power_id = sp.id  JOIN superhero sh ON hp.hero_id = sh.id  JOIN colour c ON sh.eye_colour_id = c.id  WHERE sp.power_name = 'Agility' AND c.colour = 'Blue'	superhero
SELECT s.superhero_name  FROM superhero s  JOIN colour e ON s.eye_colour_id = e.id  JOIN colour h ON s.hair_colour_id = h.id  WHERE e.colour = 'Blue' AND h.colour = 'Blond'	superhero
SELECT COUNT(*) FROM `superhero` WHERE `publisher_id` = (SELECT `id` FROM `publisher` WHERE `publisher_name` = 'Marvel Comics')	superhero
SELECT s.superhero_name, s.height_cm  FROM superhero s  JOIN publisher p ON s.publisher_id = p.id  WHERE p.publisher_name = 'Marvel Comics'  ORDER BY s.height_cm DESC;	superhero
SELECT p.publisher_name  FROM publisher p  JOIN superhero s ON p.id = s.publisher_id  WHERE s.superhero_name = 'Sauron'	superhero
SELECT c.colour, COUNT(s.id) AS count FROM superhero s JOIN colour c ON s.eye_colour_id = c.id JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics' GROUP BY c.colour ORDER BY count DESC;	superhero
SELECT AVG(height_cm) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')	superhero
SELECT s.superhero_name  FROM superhero s  JOIN publisher p ON s.publisher_id = p.id  JOIN hero_power hp ON s.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE p.publisher_name = 'Marvel Comics' AND sp.power_name = 'Super Strength'	superhero
SELECT COUNT(*) FROM `superhero` AS sh JOIN `publisher` AS p ON sh.publisher_id = p.id WHERE p.publisher_name = 'DC Comics'	superhero
SELECT p.publisher_name FROM publisher p JOIN superhero s ON p.id = s.publisher_id JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' ORDER BY ha.attribute_value ASC LIMIT 1;	superhero
SELECT COUNT(*)  FROM `superhero` s JOIN `colour` c ON s.eye_colour_id = c.id JOIN `publisher` p ON s.publisher_id = p.id WHERE c.colour = 'Gold' AND p.publisher_name = 'Marvel Comics'	superhero
SELECT p.publisher_name  FROM publisher p  JOIN superhero s ON p.id = s.publisher_id  WHERE s.superhero_name = 'Blue Beetle II'	superhero
SELECT COUNT(*) FROM `superhero` s JOIN `colour` c ON s.hair_colour_id = c.id WHERE c.colour = 'Blond'	superhero
SELECT s.superhero_name  FROM superhero s  JOIN hero_attribute ha ON s.id = ha.hero_id  JOIN attribute a ON ha.attribute_id = a.id  WHERE a.attribute_name = 'Intelligence'  ORDER BY ha.attribute_value ASC  LIMIT 1;	superhero
SELECT r.race FROM race r JOIN superhero s ON r.id = s.race_id WHERE s.superhero_name = 'Copycat'	superhero
SELECT s.superhero_name  FROM superhero s  JOIN hero_attribute ha ON s.id = ha.hero_id  JOIN attribute a ON ha.attribute_id = a.id  WHERE a.attribute_name = 'Durability' AND ha.attribute_value < 50;	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Death Touch'	superhero
SELECT COUNT(*)  FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE g.gender = 'Female' AND a.attribute_name = 'Strength' AND ha.attribute_value = 100;	superhero
SELECT `superhero_name` FROM `superhero` WHERE `id` = (SELECT `hero_id` FROM `hero_power` GROUP BY `hero_id` ORDER BY COUNT(`hero_id`) DESC LIMIT 1)	superhero
SELECT COUNT(*) FROM `superhero` AS T1 JOIN `race` AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Vampire'	superhero
SELECT      CAST(SUM(CASE WHEN a.alignment = 'Bad' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(s.id) AS percentage,      SUM(CASE WHEN p.publisher_name = 'Marvel Comics' AND a.alignment = 'Bad' THEN 1 ELSE 0 END) AS marvel_bad_superheroes FROM      superhero s JOIN      alignment a ON s.alignment_id = a.id JOIN      publisher p ON s.publisher_id = p.id;	superhero
SELECT (SUM(CASE WHEN p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) - SUM(CASE WHEN p.publisher_name = 'DC Comics' THEN 1 ELSE 0 END)) AS difference FROM superhero s JOIN publisher p ON s.publisher_id = p.id	superhero
SELECT id FROM publisher WHERE publisher_name = 'Star Trek'	superhero
SELECT AVG(attribute_value) FROM hero_attribute	superhero
SELECT COUNT(*) FROM `superhero` WHERE `full_name` IS NULL OR `full_name` = '-'	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.id = 75	superhero
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id JOIN superhero sh ON hp.hero_id = sh.id WHERE sh.superhero_name = 'Deathlok'	superhero
SELECT AVG(s.weight_kg)  FROM superhero s  JOIN gender g ON s.gender_id = g.id  WHERE g.gender = 'Female'	superhero
SELECT sp.power_name FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE g.gender = 'Male' LIMIT 5;	superhero
SELECT superhero_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Alien')	superhero
SELECT `superhero_name` FROM `superhero` JOIN `colour` ON `superhero.eye_colour_id` = `colour.id` WHERE `height_cm` BETWEEN 170 AND 190 AND `colour.colour` = 'No Colour'	superhero
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id WHERE hp.hero_id = 56	superhero
SELECT `full_name` FROM `superhero` WHERE `race_id` = (SELECT `id` FROM `race` WHERE `race` = 'Demi-God') LIMIT 5	superhero
SELECT COUNT(*) FROM `superhero` WHERE `alignment_id` = (SELECT `id` FROM `alignment` WHERE `alignment` = 'Bad')	superhero
SELECT r.race FROM race r JOIN superhero s ON r.id = s.race_id WHERE s.weight_kg = 169	superhero
SELECT c.colour  FROM superhero s  JOIN race r ON s.race_id = r.id  JOIN colour c ON s.hair_colour_id = c.id  WHERE s.height_cm = 185 AND r.race = 'human'	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.weight_kg = (SELECT MAX(weight_kg) FROM superhero)	superhero
SELECT CAST(SUM(CASE WHEN p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM superhero s  JOIN publisher p ON s.publisher_id = p.id  WHERE s.height_cm BETWEEN 150 AND 180	superhero
SELECT superhero_name FROM superhero WHERE gender_id = (SELECT id FROM gender WHERE gender = 'Male') AND weight_kg > (SELECT AVG(weight_kg) * 0.79 FROM superhero)	superhero
SELECT power_name FROM superpower WHERE id = (SELECT power_id FROM hero_power GROUP BY power_id ORDER BY COUNT(power_id) DESC LIMIT 1)	superhero
SELECT `attribute_value` FROM `hero_attribute` WHERE `hero_id` = (SELECT `id` FROM `superhero` WHERE `superhero_name` = 'Abomination')	superhero
SELECT sp.power_name  FROM superpower sp  JOIN hero_power hp ON sp.id = hp.power_id  WHERE hp.hero_id = 1;	superhero
SELECT COUNT(DISTINCT hero_id) FROM hero_power WHERE power_id = (SELECT id FROM superpower WHERE power_name = 'stealth')	superhero
SELECT s.full_name  FROM superhero s  JOIN hero_attribute ha ON s.id = ha.hero_id  JOIN attribute a ON ha.attribute_id = a.id  WHERE a.attribute_name = 'Strength'  ORDER BY ha.attribute_value DESC  LIMIT 1;	superhero
SELECT CAST(COUNT(s.id) AS REAL) / COUNT(*) FROM superhero s JOIN colour c ON s.skin_colour_id = c.id WHERE c.colour = 'No Colour'	superhero
SELECT COUNT(*) FROM `superhero` AS sh JOIN `publisher` AS p ON sh.publisher_id = p.id WHERE p.publisher_name = 'Dark Horse Comics'	superhero
SELECT s.superhero_name  FROM superhero s  JOIN hero_attribute ha ON s.id = ha.hero_id  JOIN attribute a ON ha.attribute_id = a.id  JOIN publisher p ON s.publisher_id = p.id  WHERE p.publisher_name = 'Dark Horse Comics' AND a.attribute_name = 'Durability'  ORDER BY ha.attribute_value DESC  LIMIT 1;	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.full_name = 'Abraham Sapien'	superhero
SELECT s.superhero_name  FROM superhero s  JOIN hero_power hp ON s.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'Flight'	superhero
SELECT c1.colour AS eye_colour, c2.colour AS hair_colour, c3.colour AS skin_colour FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN publisher p ON s.publisher_id = p.id JOIN colour c1 ON s.eye_colour_id = c1.id JOIN colour c2 ON s.hair_colour_id = c2.id JOIN colour c3 ON s.skin_colour_id = c3.id WHERE g.gender = 'Female' AND p.publisher_name = 'Dark Horse Comics'	superhero
SELECT s.superhero_name, p.publisher_name  FROM superhero s  JOIN publisher p ON s.publisher_id = p.id  WHERE s.eye_colour_id = s.hair_colour_id AND s.hair_colour_id = s.skin_colour_id;	superhero
SELECT r.race FROM race r JOIN superhero s ON r.id = s.race_id WHERE s.superhero_name = 'A-Bomb'	superhero
SELECT CAST(COUNT(CASE WHEN c.colour = 'Blue' THEN s.id END) AS REAL) * 100 / COUNT(s.id)  FROM superhero s  JOIN gender g ON s.gender_id = g.id  JOIN colour c ON s.skin_colour_id = c.id  WHERE g.gender = 'Female'	superhero
SELECT T1.superhero_name, T2.race FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.full_name = 'Charles Chandler'	superhero
SELECT g.gender FROM gender g JOIN superhero s ON g.id = s.gender_id WHERE s.superhero_name = 'Agent 13'	superhero
SELECT sh.superhero_name  FROM superhero sh  JOIN hero_power hp ON sh.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'Adaptation'	superhero
SELECT COUNT(power_id) FROM hero_power WHERE hero_id = (SELECT id FROM superhero WHERE superhero_name = 'Amazo')	superhero
SELECT sp.power_name  FROM superhero sh  JOIN hero_power hp ON sh.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE sh.full_name = 'Hunter Zolomon'	superhero
SELECT height_cm FROM superhero WHERE eye_colour_id = (SELECT id FROM colour WHERE colour = 'Amber')	superhero
SELECT superhero_name FROM superhero WHERE eye_colour_id = (SELECT id FROM colour WHERE colour = 'Black') AND hair_colour_id = (SELECT id FROM colour WHERE colour = 'Black')	superhero
SELECT c.colour AS eye_colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  JOIN colour c2 ON s.skin_colour_id = c2.id  WHERE c2.colour = 'Gold'	superhero
SELECT s.full_name  FROM superhero s  JOIN race r ON s.race_id = r.id  WHERE r.race = 'Vampire'	superhero
SELECT superhero_name FROM superhero JOIN alignment ON superhero.alignment_id = alignment.id WHERE alignment.alignment = 'Neutral'	superhero
SELECT COUNT(hero_id)  FROM hero_attribute  WHERE attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Strength')  AND attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute WHERE attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Strength'))	superhero
SELECT r.race, a.alignment FROM superhero s JOIN race r ON s.race_id = r.id JOIN alignment a ON s.alignment_id = a.id WHERE s.superhero_name = 'Cameron Hicks'	superhero
SELECT CAST(SUM(CASE WHEN g.gender = 'Female' AND p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(CASE WHEN p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END)  FROM superhero s  JOIN gender g ON s.gender_id = g.id  JOIN publisher p ON s.publisher_id = p.id	superhero
SELECT AVG(weight_kg) FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Alien')	superhero
SELECT (SUM(CASE WHEN full_name = 'Emil Blonsky' THEN weight_kg ELSE 0 END) - SUM(CASE WHEN full_name = 'Charles Chandler' THEN weight_kg ELSE 0 END)) AS weight_difference FROM superhero	superhero
SELECT AVG(height_cm) AS average_height FROM superhero	superhero
SELECT sp.power_name  FROM superhero sh  JOIN hero_power hp ON sh.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE sh.superhero_name = 'Abomination'	superhero
SELECT COUNT(*) FROM `superhero` WHERE `race_id` = 21 AND `gender_id` = 1	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON a.id = ha.attribute_id WHERE a.attribute_name = 'Speed' ORDER BY ha.attribute_value DESC LIMIT 1	superhero
SELECT COUNT(*) FROM `superhero` WHERE `alignment_id` = 3	superhero
SELECT a.attribute_name, ha.attribute_value  FROM hero_attribute ha  JOIN superhero s ON ha.hero_id = s.id  JOIN attribute a ON ha.attribute_id = a.id  WHERE s.superhero_name = '3-D Man'	superhero
SELECT s.superhero_name  FROM superhero s  JOIN colour e ON e.id = s.eye_colour_id  JOIN colour h ON h.id = s.hair_colour_id  WHERE e.colour = 'Blue' AND h.colour = 'Brown'	superhero
SELECT p.publisher_name  FROM publisher p  JOIN superhero s ON p.id = s.publisher_id  WHERE s.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy')	superhero
SELECT COUNT(*) FROM `superhero` WHERE `publisher_id` = 1;	superhero
SELECT (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM `superhero`)) AS percentage  FROM `superhero`  WHERE `eye_colour_id` = 7;	superhero
SELECT CAST(COUNT(CASE WHEN g.gender = 'Male' THEN s.id END) AS REAL) / COUNT(CASE WHEN g.gender = 'Female' THEN s.id END) AS ratio  FROM superhero s  JOIN gender g ON s.gender_id = g.id	superhero
SELECT superhero_name FROM superhero WHERE height_cm = (SELECT MAX(height_cm) FROM superhero)	superhero
SELECT id FROM superpower WHERE power_name = 'cryokinesis'	superhero
SELECT superhero_name FROM superhero WHERE id = 294	superhero
SELECT full_name FROM superhero WHERE weight_kg = 0 OR weight_kg IS NULL	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.full_name = 'Karen Beecher-Duncan'	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.full_name = 'Helen Parr'	superhero
SELECT r.race FROM race r JOIN superhero s ON r.id = s.race_id WHERE s.weight_kg = 108 AND s.height_cm = 188;	superhero
SELECT p.publisher_name FROM publisher p JOIN superhero s ON p.id = s.publisher_id WHERE s.id = 38	superhero
SELECT r.race  FROM race r  JOIN superhero s ON r.id = s.race_id  JOIN hero_attribute ha ON s.id = ha.hero_id  WHERE ha.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute)	superhero
SELECT T1.superhero_name, T2.power_name  FROM superhero AS T1  JOIN hero_power AS T3 ON T1.id = T3.hero_id  JOIN superpower AS T2 ON T3.power_id = T2.id  WHERE T1.superhero_name = 'Atom IV'	superhero
SELECT superhero.superhero_name  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE colour.colour = 'Blue'  LIMIT 5;	superhero
SELECT AVG(attribute_value)  FROM hero_attribute  WHERE hero_id IN (     SELECT id      FROM superhero      WHERE alignment_id = 3 )	superhero
SELECT c.colour  FROM colour c  JOIN superhero s ON c.id = s.skin_colour_id  JOIN hero_attribute ha ON s.id = ha.hero_id  WHERE ha.attribute_value = 100;	superhero
SELECT COUNT(*) FROM `superhero` WHERE `alignment_id` = 1 AND `gender_id` = 2	superhero
SELECT superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE attribute_value BETWEEN 75 AND 80	superhero
SELECT r.race  FROM superhero s  JOIN gender g ON s.gender_id = g.id  JOIN colour c ON s.hair_colour_id = c.id  JOIN race r ON s.race_id = r.id  WHERE g.gender = 'Male' AND c.colour = 'Blue'	superhero
SELECT CAST(SUM(CASE WHEN g.id = 2 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(s.id)  FROM superhero s  JOIN gender g ON s.gender_id = g.id  JOIN alignment a ON s.alignment_id = a.id  WHERE a.id = 2;	superhero
SELECT SUM(CASE WHEN T2.id = 7 THEN 1 ELSE 0 END) - SUM(CASE WHEN T2.id = 1 THEN 1 ELSE 0 END) AS difference  FROM superhero AS T1  JOIN colour AS T2  ON T1.eye_colour_id = T2.id  WHERE T1.weight_kg = 0 OR T1.weight_kg IS NULL;	superhero
SELECT hero_attribute.attribute_value  FROM hero_attribute  JOIN attribute ON hero_attribute.attribute_id = attribute.id  JOIN superhero ON hero_attribute.hero_id = superhero.id  WHERE attribute.attribute_name = 'Strength' AND superhero.superhero_name = 'Hulk'	superhero
SELECT sp.power_name  FROM superhero s  JOIN hero_power hp ON s.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE s.superhero_name = 'Ajax'	superhero
SELECT COUNT(*)  FROM `superhero`  JOIN `colour` ON `superhero.skin_colour_id` = `colour.id`  JOIN `alignment` ON `superhero.alignment_id` = `alignment.id`  WHERE `colour.colour` = 'Green' AND `alignment.alignment` = 'Bad';	superhero
SELECT COUNT(*)  FROM `superhero` s JOIN `gender` g ON s.gender_id = g.id JOIN `publisher` p ON s.publisher_id = p.id WHERE g.gender = 'Female' AND p.publisher_name = 'Marvel Comics'	superhero
SELECT s.superhero_name  FROM superhero s  JOIN hero_power hp ON s.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'Wind Control'  ORDER BY s.superhero_name ASC	superhero
SELECT g.gender  FROM gender g  JOIN superhero s ON g.id = s.gender_id  JOIN hero_power hp ON s.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'Phoenix Force'	superhero
SELECT s.superhero_name  FROM superhero s  JOIN publisher p ON s.publisher_id = p.id  WHERE p.publisher_name = 'DC Comics'  ORDER BY s.weight_kg DESC  LIMIT 1;	superhero
SELECT AVG(height_cm) FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T2.race <> 'Human' AND T3.publisher_name = 'Dark Horse Comics'	superhero
SELECT COUNT(*)  FROM hero_attribute  JOIN attribute ON hero_attribute.attribute_id = attribute.id  WHERE attribute.attribute_name = 'Speed' AND hero_attribute.attribute_value = 100;	superhero
SELECT (SUM(CASE WHEN p.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) - SUM(CASE WHEN p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END)) AS difference FROM superhero s JOIN publisher p ON s.publisher_id = p.id	superhero
SELECT a.attribute_name  FROM attribute a  JOIN hero_attribute ha ON a.id = ha.attribute_id  JOIN superhero s ON ha.hero_id = s.id  WHERE s.superhero_name = 'Black Panther'  ORDER BY ha.attribute_value ASC  LIMIT 1;	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.superhero_name = 'Abomination'	superhero
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1	superhero
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler'	superhero
SELECT CAST(SUM(CASE WHEN g.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'George Lucas'	superhero
SELECT CAST(SUM(CASE WHEN a.alignment = 'Good' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(s.id)  FROM superhero s  JOIN publisher p ON s.publisher_id = p.id  JOIN alignment a ON s.alignment_id = a.id  WHERE p.publisher_name = 'Marvel Comics'	superhero
SELECT COUNT(*) FROM `superhero` WHERE `full_name` LIKE 'John%'	superhero
SELECT hero_id FROM hero_attribute ORDER BY attribute_value ASC LIMIT 1	superhero
SELECT full_name FROM superhero WHERE superhero_name = 'Alien'	superhero
SELECT `superhero`.`full_name`  FROM `superhero`  JOIN `colour` ON `superhero`.`eye_colour_id` = `colour`.`id`  WHERE `superhero`.`weight_kg` < 100 AND `colour`.`colour` = 'Auburn'	superhero
SELECT attribute_value FROM hero_attribute WHERE hero_id = (SELECT id FROM superhero WHERE superhero_name = 'Aquababy')	superhero
SELECT `superhero`.`weight_kg`, `race`.`race` FROM `superhero` JOIN `race` ON `superhero`.`race_id` = `race`.`id` WHERE `superhero`.`id` = 40;	superhero
SELECT AVG(height_cm) FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Neutral')	superhero
SELECT hero_id FROM hero_power WHERE power_id = (SELECT id FROM superpower WHERE power_name = 'Intelligence')	superhero
SELECT c.colour FROM colour c JOIN superhero s ON c.id = s.eye_colour_id WHERE s.superhero_name = 'Blackwulf'	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero)	superhero
SELECT d.driverRef FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 20 AND q.q1 IN (     SELECT MAX(q1)      FROM qualifying      WHERE raceId = 20      GROUP BY raceId      ORDER BY MAX(q1) DESC      LIMIT 5 )	formula_1
SELECT d.surname  FROM drivers d  JOIN qualifying q ON d.driverId = q.driverId  WHERE q.raceId = 19  ORDER BY q.q2  LIMIT 1;	formula_1
SELECT DISTINCT r.year  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE c.location = 'Shanghai'	formula_1
SELECT r.url FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Circuit de Barcelona-Catalunya' LIMIT 1	formula_1
SELECT r.name FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.country = 'Germany'	formula_1
SELECT cs.position  FROM constructorStandings cs JOIN constructors c ON cs.constructorId = c.constructorId WHERE c.name = 'Renault'	formula_1
SELECT COUNT(*) FROM `races` r JOIN `circuits` c ON r.circuitId = c.circuitId WHERE r.year = 2010 AND c.country NOT IN ('Malaysia', 'Bahrain', 'Spain', 'Turkey', 'Monaco')	formula_1
SELECT r.name FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.country = 'Spain'	formula_1
SELECT circuits.lat, circuits.lng FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE races.name = 'Australian Grand Prix'	formula_1
SELECT r.url  FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Sepang International Circuit'	formula_1
SELECT r.time FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Sepang International Circuit'	formula_1
SELECT lat, lng FROM circuits WHERE circuitId = (SELECT circuitId FROM races WHERE name = 'Abu Dhabi Grand Prix')	formula_1
SELECT c.nationality FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId WHERE cr.raceId = 24 AND cr.points = 1;	formula_1
SELECT q1 FROM qualifying JOIN drivers ON qualifying.driverId = drivers.driverId WHERE drivers.forename = 'Bruno' AND drivers.surname = 'Senna' AND raceId = 354;	formula_1
SELECT d.nationality FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 355 AND q.q2 = '0:01:40'	formula_1
SELECT number FROM qualifying WHERE raceId = 903 AND q3 LIKE '0:01:54%'	formula_1
SELECT COUNT(*)  FROM races r  JOIN results res ON r.raceId = res.raceId  WHERE r.name = 'Bahrain Grand Prix' AND r.year = 2007 AND res.time IS NULL;	formula_1
SELECT s.url FROM seasons s JOIN races r ON s.year = r.year WHERE r.raceId = 901	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE date = '2015-11-29') AND time IS NOT NULL	formula_1
SELECT d.forename, d.surname, d.dob FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 592 AND r.time IS NOT NULL ORDER BY d.dob ASC LIMIT 1;	formula_1
SELECT d.forename, d.surname, d.url FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE lt.raceId = 161 AND lt.time LIKE '1:27%'	formula_1
SELECT d.nationality  FROM drivers d  JOIN results r ON d.driverId = r.driverId  WHERE r.raceId = 933  ORDER BY CAST(REPLACE(r.fastestLapSpeed, ',', '.') AS REAL) DESC  LIMIT 1;	formula_1
SELECT c.lat, c.lng FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.name = 'Malaysian Grand Prix'	formula_1
SELECT c.url  FROM constructors c  JOIN constructorResults cr ON c.constructorId = cr.constructorId  WHERE cr.raceId = 9  ORDER BY cr.points DESC  LIMIT 1;	formula_1
SELECT q1 FROM qualifying WHERE raceId = 345 AND driverId = (SELECT driverId FROM drivers WHERE forename = 'Lucas' AND surname = 'di Grassi')	formula_1
SELECT d.nationality FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 347 AND q.q2 = '0:01:15'	formula_1
SELECT d.code FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 45 AND q.q3 LIKE '0:01:33%'	formula_1
SELECT r.time  FROM results r  JOIN drivers d ON r.driverId = d.driverId  WHERE r.raceId = 743 AND d.forename = 'Bruce' AND d.surname = 'McLaren'	formula_1
SELECT d.forename, d.surname  FROM drivers d  JOIN results r ON d.driverId = r.driverId  JOIN races ra ON r.raceId = ra.raceId  WHERE ra.name = 'San Marino Grand Prix' AND ra.year = 2006 AND r.position = 2;	formula_1
SELECT s.url FROM seasons s JOIN races r ON s.year = r.year WHERE r.raceId = 901	formula_1
SELECT COUNT(*) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE date = '2015-11-29') AND time IS NULL	formula_1
SELECT d.forename, d.surname, d.dob FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 872 AND r.time IS NOT NULL ORDER BY d.dob DESC LIMIT 1;	formula_1
SELECT d.forename, d.surname  FROM drivers d  JOIN lapTimes lt ON d.driverId = lt.driverId  WHERE lt.raceId = 348  ORDER BY lt.time  LIMIT 1;	formula_1
SELECT d.nationality  FROM drivers d  JOIN results r ON d.driverId = r.driverId  WHERE r.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results)	formula_1
SELECT ((CAST((SELECT fastestLapSpeed FROM results WHERE raceId = 853 AND driverId = (SELECT driverId FROM drivers WHERE forename = 'Paul' AND surname = 'di Resta')) AS REAL) - CAST((SELECT fastestLapSpeed FROM results WHERE raceId = 854 AND driverId = (SELECT driverId FROM drivers WHERE forename = 'Paul' AND surname = 'di Resta')) AS REAL)) / CAST((SELECT fastestLapSpeed FROM results WHERE raceId = 853 AND driverId = (SELECT driverId FROM drivers WHERE forename = 'Paul' AND surname = 'di Resta')) AS REAL)) * 100) AS percent_faster	formula_1
SELECT CAST(COUNT(CASE WHEN results.time IS NOT NULL THEN results.driverId END) AS REAL) / COUNT(results.driverId) AS race_completion_rate FROM races JOIN results ON races.raceId = results.raceId WHERE races.date = '1983-07-16'	formula_1
SELECT MIN(year) FROM races WHERE name = 'Singapore Grand Prix'	formula_1
SELECT COUNT(*), name FROM races WHERE year = 2005 ORDER BY name DESC	formula_1
SELECT name FROM races WHERE strftime('%Y-%m', date) = (SELECT strftime('%Y-%m', MIN(date)) FROM races)	formula_1
SELECT name, date FROM races WHERE year = 1999 AND round = (SELECT MAX(round) FROM races WHERE year = 1999)	formula_1
SELECT year FROM races GROUP BY year ORDER BY MAX(round) DESC LIMIT 1	formula_1
SELECT name FROM races WHERE year = 2017 AND name NOT IN (SELECT name FROM races WHERE year = 2000)	formula_1
SELECT c.country, c.name, c.location  FROM circuits c  JOIN races r ON c.circuitId = r.circuitId  WHERE r.name = 'European Grand Prix'  ORDER BY r.year ASC  LIMIT 1;	formula_1
SELECT MAX(year) FROM races WHERE name = 'British Grand Prix' AND circuitId IN (SELECT circuitId FROM circuits WHERE name = 'Brands Hatch')	formula_1
SELECT COUNT(*) FROM `races` WHERE `name` = 'British Grand Prix' AND `circuitId` = (SELECT `circuitId` FROM `circuits` WHERE `name` = 'Silverstone Circuit')	formula_1
SELECT d.forename, d.surname  FROM drivers d  JOIN driverStandings ds ON d.driverId = ds.driverId  JOIN races r ON ds.raceId = r.raceId  WHERE r.name = 'Singapore Grand Prix' AND r.year = 2010  ORDER BY ds.position;	formula_1
SELECT d.forename, d.surname, MAX(ds.points)  FROM drivers d  JOIN driverStandings ds ON d.driverId = ds.driverId;	formula_1
SELECT d.forename, d.surname, ds.points  FROM drivers d  JOIN driverStandings ds ON d.driverId = ds.driverId  JOIN races r ON r.raceId = ds.raceId  WHERE r.name = 'Chinese Grand Prix' AND r.year = 2017  ORDER BY ds.points DESC  LIMIT 3	formula_1
SELECT d.forename, d.surname, r.name, l.milliseconds FROM lapTimes l JOIN drivers d ON l.driverId = d.driverId JOIN races r ON l.raceId = r.raceId WHERE l.milliseconds = (SELECT MIN(milliseconds) FROM lapTimes)	formula_1
SELECT AVG(lapTimes.milliseconds) AS average_lap_time FROM lapTimes JOIN drivers ON lapTimes.driverId = drivers.driverId JOIN races ON lapTimes.raceId = races.raceId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.name = 'Malaysian Grand Prix' AND races.year = 2009;	formula_1
SELECT CAST(SUM(CASE WHEN ds.position > 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(ds.raceId)  FROM driverStandings ds  JOIN drivers d ON ds.driverId = d.driverId  JOIN races r ON ds.raceId = r.raceId  WHERE d.surname = 'Hamilton' AND r.year >= 2010;	formula_1
SELECT d.forename, d.surname, d.nationality, MAX(ds.points) AS max_points FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId GROUP BY d.driverId ORDER BY COUNT(ds.wins) DESC LIMIT 1;	formula_1
SELECT `forename`, `surname`, YEAR(CURRENT_TIMESTAMP) - YEAR(`dob`) AS age FROM `drivers` WHERE `nationality` = 'Japanese' ORDER BY `dob` DESC LIMIT 1;	formula_1
SELECT c.name  FROM circuits c  JOIN races r ON c.circuitId = r.circuitId  WHERE YEAR(r.date) BETWEEN 1990 AND 2000  GROUP BY c.name  HAVING COUNT(r.raceId) = 4;	formula_1
SELECT c.name, c.location, r.name  FROM circuits c  JOIN races r ON c.circuitId = r.circuitId  WHERE c.country = 'USA' AND r.year = 2006;	formula_1
SELECT r.name, c.name, c.location  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE MONTH(r.date) = 9 AND YEAR(r.date) = 2005;	formula_1
SELECT r.name, r.year, r.round  FROM races r  JOIN results res ON r.raceId = res.raceId  JOIN drivers d ON res.driverId = d.driverId  WHERE d.forename = 'Alex' AND d.surname = 'Yoong' AND res.position < 20;	formula_1
SELECT COUNT(ds.wins)  FROM driverStandings ds JOIN races r ON ds.raceId = r.raceId JOIN circuits c ON r.circuitId = c.circuitId JOIN drivers d ON ds.driverId = d.driverId WHERE c.name = 'Sepang International Circuit' AND d.forename = 'Michael' AND d.surname = 'Schumacher' AND ds.wins = 1;	formula_1
SELECT r.name, r.year  FROM races r  JOIN lapTimes l ON r.raceId = l.raceId  JOIN drivers d ON l.driverId = d.driverId  WHERE d.forename = 'Michael' AND d.surname = 'Schumacher'  ORDER BY l.milliseconds ASC  LIMIT 1;	formula_1
SELECT AVG(ds.points)  FROM driverStandings ds JOIN races r ON ds.raceId = r.raceId JOIN drivers d ON ds.driverId = d.driverId WHERE d.forename = 'Eddie' AND d.surname = 'Irvine' AND r.year = 2000;	formula_1
SELECT r.name, ds.points  FROM races r  JOIN driverStandings ds ON r.raceId = ds.raceId  JOIN drivers d ON ds.driverId = d.driverId  WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton'  ORDER BY r.year ASC  LIMIT 1;	formula_1
SELECT r.name, c.country, r.date  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE r.year = 2017  ORDER BY r.date;	formula_1
SELECT r.name, r.year, c.location  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  JOIN lapTimes l ON r.raceId = l.raceId  GROUP BY r.raceId  ORDER BY MAX(l.lap) DESC  LIMIT 1;	formula_1
SELECT (CAST(COUNT(CASE WHEN c.country = 'Germany' THEN r.circuitId ELSE NULL END) AS REAL) / COUNT(r.circuitId)) * 100  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE r.name = 'European Grand Prix'	formula_1
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit'	formula_1
SELECT name FROM circuits WHERE name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring') ORDER BY lat DESC LIMIT 1	formula_1
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit'	formula_1
SELECT country FROM circuits WHERE alt = (SELECT MAX(alt) FROM circuits)	formula_1
SELECT COUNT(*) FROM `drivers` WHERE `code` IS NULL	formula_1
SELECT nationality FROM drivers ORDER BY dob ASC LIMIT 1	formula_1
SELECT surname FROM drivers WHERE nationality = 'Italian'	formula_1
SELECT url FROM drivers WHERE forename = 'Anthony' AND surname = 'Davidson'	formula_1
SELECT driverRef FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton'	formula_1
SELECT c.name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.name = 'Spanish Grand Prix' AND r.year = 2009	formula_1
SELECT year FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = 'Silverstone Circuit')	formula_1
SELECT races.url FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.name = 'Silverstone'	formula_1
SELECT time FROM races WHERE year = 2010 AND circuitId = (SELECT circuitId FROM circuits WHERE name = 'Yas Marina Circuit')	formula_1
SELECT COUNT(*) FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.country = 'Italy'	formula_1
SELECT `date` FROM `races` WHERE `circuitId` = (SELECT `circuitId` FROM `circuits` WHERE `name` = 'Circuit de Barcelona-Catalunya')	formula_1
SELECT c.url FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.name = 'Spanish Grand Prix' AND r.year = 2009	formula_1
SELECT MIN(r.fastestLapTime)  FROM results r  JOIN drivers d ON r.driverId = d.driverId  WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton'	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId ORDER BY r.fastestLapSpeed DESC LIMIT 1	formula_1
SELECT d.driverRef FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Canadian Grand Prix' AND ra.year = 2007 AND r.positionOrder = 1;	formula_1
SELECT r.name  FROM results res  JOIN drivers d ON res.driverId = d.driverId  JOIN races r ON res.raceId = r.raceId  WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton'	formula_1
SELECT r.name  FROM results res  JOIN drivers d ON res.driverId = d.driverId  JOIN races r ON res.raceId = r.raceId  WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton'  ORDER BY res.rank ASC  LIMIT 1	formula_1
SELECT MAX(T2.fastestLapSpeed) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Spanish Grand Prix' AND T1.year = 2009	formula_1
SELECT DISTINCT races.year  FROM results  JOIN races ON results.raceId = races.raceId  JOIN drivers ON results.driverId = drivers.driverId  WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton'	formula_1
SELECT d.forename, d.surname, r.positionOrder  FROM drivers d  JOIN results r ON d.driverId = r.driverId  JOIN races ra ON r.raceId = ra.raceId  WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND ra.name = 'Chinese Grand Prix' AND ra.year = 2008;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Australian Grand Prix' AND ra.year = 1989 AND r.grid = 4	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND year = 2008) AND time IS NOT NULL	formula_1
SELECT fastestLap FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton') AND raceId = (SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND year = 2008)	formula_1
SELECT r.time  FROM results r  JOIN races ra ON r.raceId = ra.raceId  WHERE ra.year = 2008 AND ra.name = 'Chinese Grand Prix' AND r.positionOrder = 2	formula_1
SELECT d.forename, d.surname, d.url FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Australian Grand Prix' AND ra.year = 2008 AND r.time LIKE '%:%:%'	formula_1
SELECT COUNT(DISTINCT d.driverId)  FROM drivers d  JOIN results r ON d.driverId = r.driverId  JOIN races ra ON r.raceId = ra.raceId  WHERE d.nationality = 'British' AND ra.year = 2008 AND ra.name = 'Australian Grand Prix'	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Chinese Grand Prix' AND ra.year = 2008 AND r.time IS NOT NULL;	formula_1
SELECT SUM(points) AS total_points FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')	formula_1
SELECT AVG(CAST(SUBSTR(r.fastestLapTime, 4) AS REAL) + CAST(SUBSTR(r.fastestLapTime, 1, 2) AS REAL) * 60) AS average_fastest_lap_time FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.forename = 'Hamilton' AND d.surname = 'Lewis'	formula_1
SELECT CAST(COUNT(CASE WHEN results.time IS NOT NULL THEN results.raceId ELSE NULL END) AS REAL) / COUNT(races.raceId)  FROM races  JOIN results ON races.raceId = results.raceId  WHERE races.name = 'Australian Grand Prix' AND races.year = 2008;	formula_1
SELECT ((STRFTIME('%s', T2.time) - STRFTIME('%s', T1.time)) * 100.0 / (STRFTIME('%s', T2.time) - STRFTIME('%s', '00:00:00'))) AS percentage_faster FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Australian Grand Prix' AND T1.year = 2008 AND T2.positionOrder = 1 UNION SELECT ((STRFTIME('%s', T2.time, '+', (SELECT T3.time FROM results AS T3 WHERE T3.raceId = T1.raceId AND T3.positionOrder = 1)) - STRFTIME('%s', (SELECT T3.time FROM results AS T3 WHERE T3.raceId = T1.raceId AND T3.positionOrder = 1))) * 100.0 / STRFTIME('%s', T2.time, '+', (SELECT T3.time FROM results AS T3 WHERE T3.raceId = T1.raceId AND T3.positionOrder = 1)) - STRFTIME('%s', '00:00:00')) AS percentage_faster FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Australian Grand Prix' AND T1.year = 2008 AND T2.positionOrder = (SELECT MAX(positionOrder) FROM results WHERE raceId = (SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND year = 2008))	formula_1
SELECT COUNT(*) FROM circuits WHERE location = 'Adelaide' AND country = 'Australia'	formula_1
SELECT lat, lng FROM circuits WHERE country = 'USA'	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND dob > '1980-01-01'	formula_1
SELECT MAX(points) FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = 'British'	formula_1
SELECT c.name  FROM constructors c  JOIN constructorStandings cs ON c.constructorId = cs.constructorId  ORDER BY cs.points DESC  LIMIT 1	formula_1
SELECT c.name  FROM constructors c  LEFT JOIN constructorStandings cs ON c.constructorId = cs.constructorId AND cs.raceId = 291  WHERE cs.points IS NULL OR cs.points = 0;	formula_1
SELECT COUNT(*)  FROM constructors c  JOIN constructorStandings cs ON c.constructorId = cs.constructorId  WHERE c.nationality = 'Japanese'  GROUP BY c.constructorId  HAVING COUNT(cs.raceId) = 2 AND SUM(cs.points) = 0;	formula_1
SELECT c.name FROM constructors c JOIN results r ON c.constructorId = r.constructorId WHERE r.rank = 1	formula_1
SELECT COUNT(DISTINCT c.constructorId)  FROM constructors c  JOIN results r ON c.constructorId = r.constructorId  WHERE c.nationality = 'French' AND r.laps > 50;	formula_1
SELECT CAST(COUNT(CASE WHEN r.time IS NOT NULL THEN res.driverId END) AS REAL) * 100 / COUNT(res.driverId)  FROM results res  JOIN drivers d ON res.driverId = d.driverId  JOIN races ra ON res.raceId = ra.raceId  WHERE d.nationality = 'Japanese' AND ra.year BETWEEN 2007 AND 2009;	formula_1
SELECT r.year, AVG(CAST(SUBSTR(res.time, 1, 2) AS INTEGER) * 3600 + CAST(SUBSTR(res.time, 4, 2) AS INTEGER) * 60 + CAST(SUBSTR(res.time, 7, 6) AS REAL)) AS average_time FROM races r JOIN results res ON r.raceId = res.raceId JOIN driverStandings ds ON ds.raceId = r.raceId AND ds.driverId = res.driverId WHERE r.year < 1975 AND ds.position = 1 AND res.time IS NOT NULL GROUP BY r.year;	formula_1
SELECT d.forename, d.surname  FROM drivers d  JOIN results r ON d.driverId = r.driverId  WHERE d.dob > '1975-12-31' AND r.rank = 2;	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'Italian' AND driverId NOT IN (SELECT driverId FROM results WHERE time IS NOT NULL)	formula_1
SELECT d.forename, d.surname  FROM drivers d  JOIN results r ON d.driverId = r.driverId  ORDER BY r.fastestLapTime ASC  LIMIT 1;	formula_1
SELECT fastestLap FROM results WHERE raceId IN (SELECT raceId FROM races WHERE year = 2009) AND time LIKE '1:%'	formula_1
SELECT AVG(T2.fastestLapSpeed) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Spanish Grand Prix' AND T1.year = 2009	formula_1
SELECT r.name, r.year  FROM races r  JOIN results res  ON r.raceId = res.raceId  WHERE res.milliseconds IS NOT NULL  GROUP BY r.raceId  ORDER BY MIN(res.milliseconds)  LIMIT 1;	formula_1
SELECT CAST(COUNT(CASE WHEN YEAR(d.dob) < 1985 AND r.laps > 50 THEN 1 END) AS REAL) * 100 / COUNT(d.driverId)  FROM drivers d  JOIN results r ON d.driverId = r.driverId  JOIN races ra ON r.raceId = ra.raceId  WHERE ra.year BETWEEN 2000 AND 2005	formula_1
SELECT COUNT(DISTINCT d.driverId)  FROM drivers d  JOIN lapTimes lt ON d.driverId = lt.driverId  WHERE d.nationality = 'French' AND lt.time < '02:00.00'	formula_1
SELECT code FROM drivers WHERE nationality = 'America'	formula_1
SELECT raceId FROM races WHERE year = 2009	formula_1
SELECT COUNT(DISTINCT driverId) FROM driverStandings WHERE raceId = 18	formula_1
SELECT COUNT(*) FROM (SELECT nationality, dob FROM drivers ORDER BY dob DESC LIMIT 3) AS top3 WHERE nationality = 'Dutch'	formula_1
SELECT `driverRef` FROM `drivers` WHERE `forename` = 'Robert' AND `surname` = 'Kubica'	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND STRFTIME('%Y', dob) = '1980'	formula_1
SELECT d.driverId, d.dob, d.nationality, p.time  FROM drivers d  JOIN pitStops p ON d.driverId = p.driverId  WHERE d.nationality = 'German' AND d.dob BETWEEN '1980-01-01' AND '1990-12-31'  ORDER BY p.time ASC  LIMIT 3;	formula_1
SELECT driverRef FROM drivers WHERE nationality = 'German' ORDER BY dob ASC LIMIT 1	formula_1
SELECT d.driverId, d.code  FROM drivers d  JOIN results r ON d.driverId = r.driverId  WHERE YEAR(d.dob) = 1971  ORDER BY r.fastestLapTime ASC  LIMIT 1;	formula_1
SELECT d.driverId, MAX(ps.time) AS latest_lap_time FROM drivers d JOIN pitStops ps ON d.driverId = ps.driverId WHERE d.nationality = 'Spanish' AND d.dob < '1982-01-01' GROUP BY d.driverId ORDER BY latest_lap_time DESC LIMIT 10;	formula_1
SELECT r.year  FROM races r  JOIN results res ON r.raceId = res.raceId  WHERE res.fastestLapTime = (SELECT MIN(fastestLapTime) FROM results)	formula_1
SELECT year FROM races WHERE raceId IN (SELECT raceId FROM lapTimes GROUP BY raceId ORDER BY MAX(time) ASC LIMIT 1)	formula_1
SELECT driverId FROM lapTimes WHERE lap = 1 ORDER BY time ASC LIMIT 5	formula_1
SELECT COUNT(*) FROM results WHERE raceId > 50 AND raceId < 100 AND time IS NOT NULL AND statusId = 2;	formula_1
SELECT location, lat, lng FROM circuits WHERE country = 'Austria'	formula_1
SELECT raceId FROM results WHERE time IS NOT NULL GROUP BY raceId ORDER BY COUNT(*) DESC LIMIT 1	formula_1
SELECT d.driverRef, d.nationality, d.dob FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 23 AND q.q2 IS NOT NULL	formula_1
SELECT races.year, races.name, races.date, races.time  FROM races  JOIN qualifying ON races.raceId = qualifying.raceId  JOIN drivers ON qualifying.driverId = drivers.driverId  WHERE drivers.dob = (SELECT MAX(dob) FROM drivers WHERE driverId IN (SELECT driverId FROM qualifying GROUP BY driverId HAVING MIN(raceId)))  AND races.date = (SELECT MIN(date) FROM races WHERE raceId IN (SELECT raceId FROM qualifying WHERE driverId = (SELECT driverId FROM drivers WHERE dob = (SELECT MAX(dob) FROM drivers WHERE driverId IN (SELECT driverId FROM qualifying)))))	formula_1
SELECT COUNT(*)  FROM results r  JOIN drivers d ON r.driverId = d.driverId  JOIN status s ON r.statusId = s.statusId  WHERE d.nationality = 'American' AND s.status = 'Puncture'	formula_1
SELECT c.url  FROM constructors c  JOIN constructorStandings cs ON c.constructorId = cs.constructorId  WHERE c.nationality = 'Italian'  ORDER BY cs.points DESC  LIMIT 1;	formula_1
SELECT c.url  FROM constructors c  JOIN constructorStandings cs ON c.constructorId = cs.constructorId  GROUP BY c.constructorId  ORDER BY SUM(cs.wins) DESC  LIMIT 1	formula_1
SELECT driverId, MAX(time) AS slowest_time  FROM lapTimes  WHERE raceId = (SELECT raceId FROM races WHERE name = 'French Grand Prix') AND lap = 3  GROUP BY driverId  ORDER BY slowest_time DESC  LIMIT 1;	formula_1
SELECT raceId, MIN(milliseconds) AS fastest_lap_time FROM lapTimes WHERE lap = 1 GROUP BY raceId ORDER BY fastest_lap_time LIMIT 1;	formula_1
SELECT AVG(fastestLapTime) FROM results WHERE raceId = (SELECT raceId FROM races WHERE year = 2006 AND name = 'United States Grand Prix') AND rank < 11	formula_1
SELECT d.forename, d.surname, AVG(CAST(p.milliseconds AS REAL)) AS avg_pitstop_duration FROM drivers d JOIN pitStops p ON d.driverId = p.driverId WHERE d.nationality = 'German' AND d.dob BETWEEN '1980-01-01' AND '1985-12-31' GROUP BY d.driverId ORDER BY avg_pitstop_duration ASC LIMIT 3;	formula_1
SELECT r.name, res.time  FROM races r  JOIN results res ON r.raceId = res.raceId  WHERE r.name = 'Canadian Grand Prix' AND r.year = 2008 AND res.time LIKE '%:%:%.%';	formula_1
SELECT c.constructorRef, c.url  FROM constructors c  JOIN results r ON c.constructorId = r.constructorId  JOIN races ra ON r.raceId = ra.raceId  WHERE ra.name = 'Singapore Grand Prix' AND ra.year = 2009 AND r.time = (SELECT MIN(r.time) FROM results r WHERE r.raceId = (SELECT raceId FROM races WHERE name = 'Singapore Grand Prix' AND year = 2009))	formula_1
SELECT forename, surname, dob FROM drivers WHERE nationality = 'Austrian' AND dob BETWEEN '1981-01-01' AND '1991-12-31'	formula_1
SELECT forename || ' ' || surname AS full_name, url, dob  FROM drivers  WHERE nationality = 'German' AND dob BETWEEN '1971-01-01' AND '1985-12-31'  ORDER BY dob DESC;	formula_1
SELECT name, country, lat, lng FROM circuits WHERE name = 'Hungaroring'	formula_1
SELECT c.name, c.nationality, cr.points  FROM constructors c  JOIN constructorResults cr ON c.constructorId = cr.constructorId  JOIN races r ON r.year = cr.year  WHERE r.name = 'Monaco Grand Prix' AND r.year BETWEEN 1980 AND 2010  ORDER BY cr.points DESC  LIMIT 1;	formula_1
SELECT AVG(ds.points)  FROM driverStandings ds  JOIN drivers d ON ds.driverId = d.driverId  JOIN races r ON ds.raceId = r.raceId  WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND r.name = 'Turkish Grand Prix'	formula_1
SELECT AVG(COUNT(*)) AS annual_avg_races FROM races WHERE date BETWEEN '2000-01-01' AND '2010-12-31' GROUP BY year;	formula_1
SELECT nationality AS citizenship FROM drivers GROUP BY nationality ORDER BY COUNT(*) DESC LIMIT 1	formula_1
SELECT wins FROM driverStandings ORDER BY points ASC LIMIT 1 OFFSET 90	formula_1
SELECT r.name  FROM races r  JOIN results res  ON r.raceId = res.raceId  WHERE res.fastestLapTime = (SELECT MIN(fastestLapTime) FROM results)	formula_1
SELECT c.location FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.date = (SELECT MAX(date) FROM races)	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON r.year = 2008 AND r.circuitId = (SELECT circuitId FROM circuits WHERE name = 'Marina Bay Street Circuit') WHERE q.q3 = (SELECT MIN(q3) FROM qualifying)	formula_1
SELECT d.forename, d.surname, d.nationality, r.name  FROM drivers d  JOIN driverStandings ds ON d.driverId = ds.driverId  JOIN races r ON ds.raceId = r.raceId  WHERE d.dob = (SELECT MAX(dob) FROM drivers)  LIMIT 1;	formula_1
SELECT COUNT(*)  FROM results r  JOIN races ra ON r.raceId = ra.raceId  JOIN status s ON r.statusId = s.statusId  WHERE ra.name = 'Canadian Grand Prix' AND s.status = 'Accident'  GROUP BY r.driverId  ORDER BY COUNT(*) DESC  LIMIT 1;	formula_1
SELECT d.forename, d.surname, ds.wins  FROM drivers d  JOIN driverStandings ds ON d.driverId = ds.driverId  WHERE d.dob = (SELECT MIN(dob) FROM drivers)	formula_1
SELECT MAX(duration) FROM pitStops	formula_1
SELECT MIN(`time`) FROM `lapTimes`	formula_1
SELECT MAX(duration) FROM pitStops WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')	formula_1
SELECT lap FROM pitStops WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton') AND raceId = (SELECT raceId FROM races WHERE year = 2011 AND name = 'Australian Grand Prix')	formula_1
SELECT duration FROM pitStops WHERE raceId IN (SELECT raceId FROM races WHERE year = 2011 AND name = 'Australian Grand Prix')	formula_1
SELECT MIN(time) AS fastest_lap FROM lapTimes WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')	formula_1
SELECT d.forename, d.surname  FROM drivers d  JOIN lapTimes lt ON d.driverId = lt.driverId  GROUP BY d.driverId  ORDER BY MIN(lt.time)  LIMIT 20;	formula_1
SELECT position FROM lapTimes WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton') AND time = (SELECT MIN(time) FROM lapTimes WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton'))	formula_1
SELECT MIN(r.fastestLapTime) AS lap_record FROM results r JOIN races ra ON r.raceId = ra.raceId JOIN circuits c ON ra.circuitId = c.circuitId WHERE c.name = 'Austrian Grand Prix Circuit'	formula_1
SELECT c.circuitId, c.country, r.raceId  FROM circuits c  JOIN races r ON c.circuitId = r.circuitId  WHERE c.country = 'Italy'  ORDER BY r.raceId ASC;	formula_1
SELECT r.name FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Austrian Grand Prix Circuit' AND r.raceId IN (SELECT raceId FROM results GROUP BY raceId ORDER BY COUNT(*) DESC LIMIT 1)	formula_1
SELECT pitStops.duration  FROM pitStops  JOIN races ON races.raceId = pitStops.raceId  JOIN circuits ON circuits.circuitId = races.circuitId  WHERE races.name = 'Austrian Grand Prix' AND pitStops.duration = (     SELECT MIN(pitStops.duration)      FROM pitStops      JOIN races ON races.raceId = pitStops.raceId      WHERE races.name = 'Austrian Grand Prix' )	formula_1
SELECT c.lat, c.lng FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.raceId IN (SELECT raceId FROM lapTimes WHERE time = '1:29.488')	formula_1
SELECT AVG(milliseconds) FROM pitStops WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')	formula_1
SELECT AVG(milliseconds)  FROM lapTimes  JOIN races ON lapTimes.raceId = races.raceId  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE circuits.country = 'Italy'	formula_1
SELECT player_api_id FROM Player_Attributes WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)	european_football_2
SELECT player_name, height FROM Player WHERE height = (SELECT MAX(height) FROM Player)	european_football_2
SELECT preferred_foot FROM Player_Attributes WHERE potential = (SELECT MIN(potential) FROM Player_Attributes) LIMIT 1	european_football_2
SELECT COUNT(*) FROM `Player_Attributes` WHERE `overall_rating` >= 60 AND `overall_rating` < 65 AND `defensive_work_rate` = 'low'	european_football_2
SELECT id FROM Player_Attributes ORDER BY crossing DESC LIMIT 5	european_football_2
SELECT L.name  FROM Match M  JOIN League L ON M.league_id = L.id  WHERE M.season = '2015/2016'  GROUP BY L.name  ORDER BY SUM(M.home_team_goal + M.away_team_goal) DESC  LIMIT 1;	european_football_2
SELECT home_team, COUNT(*) AS lost_matches FROM matches WHERE season = '2015/2016' AND (home_team_goal - away_team_goal) < 0 GROUP BY home_team ORDER BY lost_matches LIMIT 1;	european_football_2
SELECT player_name FROM players ORDER BY penalties DESC LIMIT 10;	european_football_2
SELECT Team.team_long_name FROM Match JOIN Team ON Match.away_team_api_id = Team.team_api_id WHERE Match.season = '2009/2010' AND Match.league_id = (SELECT league_id FROM League WHERE name = 'Scotland Premier League') AND Match.away_team_goal > Match.home_team_goal GROUP BY Team.team_long_name ORDER BY COUNT(*) DESC LIMIT 1;	european_football_2
SELECT teamName, buildUpPlaySpeed FROM teams ORDER BY buildUpPlaySpeed DESC LIMIT 4;	european_football_2
SELECT L.name  FROM Match M  JOIN League L ON M.league_id = L.id  WHERE M.season = '2015/2016' AND M.home_team_goal = M.away_team_goal  GROUP BY L.name  ORDER BY COUNT(*) DESC  LIMIT 1;	european_football_2
SELECT strftime('%Y', 'now') - strftime('%Y', birthday) - (strftime('%m', 'now') || strftime('%d', 'now') < strftime('%m', birthday) || strftime('%d', birthday)) AS age  FROM Player  WHERE EXISTS (SELECT 1 FROM PlayerStats WHERE PlayerStats.player_id = Player.id AND sprint_speed >= 97 AND YEAR(date) >= '2013' AND YEAR(date) <= '2015')	european_football_2
SELECT league_name, COUNT(league_id) AS match_count FROM matches GROUP BY league_id ORDER BY match_count DESC LIMIT 1;	european_football_2
SELECT AVG(height) FROM Player WHERE birthday >= '1990-01-01 00:00:00' AND birthday < '1996-01-01 00:00:00'	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes WHERE substr(date,1,4) = '2010') AND substr(date,1,4) = '2010'	european_football_2
SELECT team_fifa_api_id FROM Team_Attributes WHERE buildUpPlaySpeed > 50 AND buildUpPlaySpeed < 60	european_football_2
SELECT team_long_name FROM team_attributes WHERE strftime('%Y', date) = '2012'   AND buildUpPlayPassing > (SELECT AVG(buildUpPlayPassing) FROM team_attributes WHERE buildUpPlayPassing IS NOT NULL AND strftime('%Y', date) = '2012')	european_football_2
SELECT (SUM(CASE WHEN preferred_foot = 'left' THEN 1 ELSE 0 END) * 100) / COUNT(player_fifa_api_id) AS percentage_left_footed FROM players WHERE YEAR(birthday) BETWEEN '1987' AND '1992';	european_football_2
SELECT league_name, SUM(home_team_goal + away_team_goal) AS total_goals FROM matches JOIN leagues ON matches.league_id = leagues.league_id GROUP BY league_name ORDER BY total_goals ASC LIMIT 5;	european_football_2
SELECT CAST(SUM(long_shots) AS FLOAT) / COUNT(player_fifa_api_id) AS average_long_shots FROM Player_Attributes WHERE player_fifa_api_id = (SELECT fifa_api_id FROM Player WHERE player_name = 'Ahmed Samir Farag');	european_football_2
SELECT P.name FROM Player P JOIN Player_Attributes PA ON P.player_api_id = PA.player_api_id WHERE P.height > 180 GROUP BY P.name ORDER BY SUM(PA.heading_accuracy) / COUNT(PA.player_fifa_api_id) DESC LIMIT 10;	european_football_2
SELECT team_long_name FROM Team WHERE buildUpPlayDribblingClass = 'Normal'   AND date >= '2014-01-01 00:00:00'   AND date <= '2014-01-31 00:00:00'   AND chanceCreationPassing < (SELECT AVG(chanceCreationPassing) FROM Team WHERE buildUpPlayDribblingClass = 'Normal' AND date >= '2014-01-01 00:00:00' AND date <= '2014-01-31 00:00:00') ORDER BY chanceCreationPassing DESC;	european_football_2
SELECT League.name FROM Match JOIN League ON Match.league_id = League.id WHERE Match.season = '2009/2010' GROUP BY League.name HAVING SUM(Match.home_team_goal) / COUNT(DISTINCT Match.id) > SUM(Match.away_team_goal) / COUNT(DISTINCT Match.id)	european_football_2
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers'	european_football_2
SELECT player_name FROM Player WHERE substr(birthday, 1, 4) = '1970' AND substr(birthday, 6, 2) = '10'	european_football_2
SELECT attacking_work_rate FROM players WHERE name = 'Franco Zennaro';	european_football_2
SELECT buildUpPlayPositioningClass  FROM team  WHERE team_long_name = 'ADO Den Haag';	european_football_2
SELECT heading_accuracy FROM football_player_stats WHERE player_name = 'Francois Affolter' AND date = '2014-09-18 00:00:00'	european_football_2
SELECT overall_rating  FROM players  WHERE name = 'Gabriel Tamas' AND strftime('%Y', date) = '2011';	european_football_2
SELECT COUNT(*)  FROM Match  JOIN League ON Match.league_id = League.id  WHERE League.name = 'Scotland Premier League' AND Match.season = '2015/2016';	european_football_2
SELECT preferred_foot FROM players WHERE birthday = (SELECT MAX(birthday) FROM players)	european_football_2
SELECT potential FROM Player_Attributes WHERE potential = (SELECT MAX(potential) FROM Player_Attributes)	european_football_2
SELECT COUNT(*)  FROM players  WHERE weight < 130 AND preferred_foot = 'left'	european_football_2
SELECT team_short_name FROM teams WHERE chanceCreationPassingClass = 'Risky'	european_football_2
SELECT defensive_work_rate  FROM players  WHERE name = 'David Wilson';	european_football_2
SELECT birthday FROM players WHERE overall_rating = (SELECT MAX(overall_rating) FROM players);	european_football_2
SELECT League.name FROM League WHERE League.country = 'Netherlands'	european_football_2
SELECT AVG(home_team_goal)  FROM Match  WHERE country_name = 'Poland' AND season = '2010/2011'	european_football_2
SELECT p.player_api_id, AVG(pa.finishing) AS avg_finishing FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.height IN ((SELECT MAX(height) FROM Player), (SELECT MIN(height) FROM Player)) GROUP BY p.player_api_id ORDER BY avg_finishing DESC LIMIT 1;	european_football_2
SELECT player_name FROM Player WHERE height > 180;	european_football_2
SELECT COUNT(*) FROM `Player` WHERE strftime('%Y', `birthday`) > '1990'	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND weight > 170	european_football_2
SELECT player_name FROM players WHERE overall_rating > 80 AND strftime('%Y', date) BETWEEN '2008' AND '2010'	european_football_2
SELECT potential  FROM players  WHERE name = 'Aaron Doran';	european_football_2
SELECT * FROM players WHERE preferred_foot = 'left'	european_football_2
SELECT team_long_name FROM teams WHERE buildUpPlaySpeedClass = 'Fast'	european_football_2
SELECT buildUpPlayPassingClass FROM teams WHERE team_short_name = 'CLB'	european_football_2
SELECT team_short_name FROM teams WHERE buildUpPlayPassing > 70	european_football_2
SELECT SUM(t2.overall_rating) / COUNT(t2.id) AS average_overall_rating FROM Player AS t1 JOIN Player_Attributes AS t2 ON t1.id = t2.player_id WHERE t1.height > 170 AND strftime('%Y', t2.date) BETWEEN '2010' AND '2015'	european_football_2
SELECT player_name FROM football_players WHERE height = (SELECT MIN(height) FROM football_players)	european_football_2
SELECT Country.name  FROM Country  JOIN League ON Country.id = League.country_id  WHERE League.name = 'Italy Serie A'	european_football_2
SELECT team_short_name FROM team WHERE buildUpPlaySpeed = 31 AND buildUpPlayDribbling = 53 AND buildUpPlayPassing = 32	european_football_2
SELECT AVG(overall_rating) AS average_overall_rating FROM players WHERE name = 'Aaron Doran';	european_football_2
SELECT COUNT(*)  FROM Match  JOIN League ON Match.league_id = League.id  WHERE League.name = 'Germany 1. Bundesliga'  AND strftime('%Y-%m', Match.date) BETWEEN '2008-08' AND '2008-10';	european_football_2
SELECT team_short_name FROM matches WHERE home_team_goal = 10	european_football_2
SELECT *  FROM football_players  WHERE potential = 61 AND balance = (SELECT MAX(balance) FROM football_players WHERE potential = 61)	european_football_2
SELECT (SUM(CASE WHEN player_name = 'Abdou Diallo' THEN ball_control ELSE 0 END) / COUNT(CASE WHEN player_name = 'Abdou Diallo' THEN id ELSE NULL END)) - (SUM(CASE WHEN player_name = 'Aaron Appindangoye' THEN ball_control ELSE 0 END) / COUNT(CASE WHEN player_name = 'Aaron Appindangoye' THEN id ELSE NULL END)) AS diff_avg_ball_control FROM players	european_football_2
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN'	european_football_2
SELECT player_name FROM Player WHERE player_name IN ('Aaron Lennon', 'Abdelaziz Barrada') ORDER BY birthday ASC LIMIT 1	european_football_2
SELECT player_name FROM Player WHERE height = (SELECT MAX(height) FROM Player)	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE preferred_foot = 'left' AND attacking_work_rate = 'low'	european_football_2
SELECT country FROM League WHERE name = 'Belgium Jupiler League'	european_football_2
SELECT League.name FROM League JOIN Country ON League.country_id = Country.id WHERE Country.name = 'Germany'	european_football_2
SELECT player_name FROM players WHERE overall_rating = (SELECT MAX(overall_rating) FROM players)	european_football_2
SELECT COUNT(DISTINCT player_id) FROM players WHERE strftime('%Y', birthday) < '1986' AND defensive_work_rate = 'high';	european_football_2
SELECT player_name FROM players WHERE player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone') ORDER BY crossing DESC LIMIT 1;	european_football_2
SELECT heading_accuracy FROM players WHERE name = 'Ariel Borysiuk';	european_football_2
SELECT COUNT(*)  FROM players  WHERE height > 180 AND volleys > 70;	european_football_2
SELECT name FROM players WHERE volleys > 70 AND dribbling > 70	european_football_2
SELECT COUNT(*)  FROM Match  JOIN Country ON Match.country_id = Country.id  WHERE Country.name = 'Belgium' AND Match.season = '2008/2009';	european_football_2
SELECT long_passing FROM players WHERE birthday = (SELECT MIN(birthday) FROM players)	european_football_2
SELECT COUNT(*) FROM `Match` WHERE `league_id` = (SELECT `id` FROM `League` WHERE `name` = 'Belgium Jupiler League') AND SUBSTR(`date`, 1, 7) = '2009-04'	european_football_2
SELECT L.name  FROM League L  JOIN Match M ON L.id = M.league_id  WHERE M.season = '2008/2009'  GROUP BY L.name  ORDER BY COUNT(M.id) DESC  LIMIT 1;	european_football_2
SELECT CAST(SUM(overall_rating) AS REAL) / COUNT(id) AS average_overall_rating FROM players WHERE strftime('%Y', birthday) < '1986';	european_football_2
SELECT (CAST((t1.overall_rating - t2.overall_rating) AS FLOAT) / t2.overall_rating) * 100 AS percentage_difference FROM (SELECT overall_rating FROM players WHERE player_name = 'Ariel Borysiuk') t1, (SELECT overall_rating FROM players WHERE player_name = 'Paulin Puel') t2	european_football_2
SELECT AVG(buildUpPlaySpeed)  FROM team  WHERE team_long_name = 'Heart of Midlothian';	european_football_2
SELECT AVG(T1.overall_rating) FROM player_ratings AS T1 JOIN players AS T2 ON T1.player_id = T2.player_id WHERE T2.player_name = 'Pietro Marino'	european_football_2
SELECT SUM(T1.crossing)  FROM Player_Stats AS T1  JOIN Players AS T2  ON T1.player_id = T2.player_id  WHERE T2.player_name = 'Aaron Lennox';	european_football_2
SELECT MAX(chanceCreationPassing) AS highest_chance_creation_passing_score, chanceCreationPassingClass  FROM match_statistics  WHERE team_long_name = 'Ajax'  GROUP BY chanceCreationPassingClass  ORDER BY highest_chance_creation_passing_score DESC  LIMIT 1;	european_football_2
SELECT preferred_foot FROM players WHERE player_name = 'Abdou Diallo'	european_football_2
SELECT MAX(overall_rating) FROM T2 WHERE player_name = 'Dorlan Pabon'	european_football_2
SELECT AVG(away_team_goal)  FROM Match  WHERE away_team_api_id = (SELECT team_api_id FROM Team WHERE team_long_name = 'Parma')  AND country_id = (SELECT id FROM Country WHERE name = 'Italy')	european_football_2
SELECT name FROM players WHERE overall_rating = 77 AND date LIKE '2016-06-23%' ORDER BY birthday ASC LIMIT 1;	european_football_2
SELECT overall_rating FROM players WHERE player_name = 'Aaron Mooy' AND date LIKE '2016-02-04%'	european_football_2
SELECT potential FROM players WHERE player_name = 'Francesco Parravicini' AND date = '2010-08-30 00:00:00'	european_football_2
SELECT attacking_work_rate FROM player_stats WHERE player_name = 'Francesco Migliore' AND date LIKE '2015-05-01%'	european_football_2
SELECT defensive_work_rate FROM player_stats WHERE player_name = 'Kevin Berigaud' AND date = '2013-02-22 00:00:00'	european_football_2
SELECT date FROM Player_Attributes WHERE player_name = 'Kevin Constant' AND crossing = (SELECT MAX(crossing) FROM Player_Attributes WHERE player_name = 'Kevin Constant') ORDER BY date ASC LIMIT 1	european_football_2
SELECT buildUpPlaySpeedClass FROM Team_Attributes WHERE team_long_name = 'Willem II' AND date = '2012-02-22'	european_football_2
SELECT build_up_play_dribbling_class  FROM match_data  WHERE team_short_name = 'LEI' AND date = '2015-09-10 00:00:00';	european_football_2
SELECT build_up_play_passing_class FROM team_attributes WHERE team_long_name = 'FC Lorient' AND date LIKE '2010-02-22%';	european_football_2
SELECT chance_creation_passing_class  FROM match  WHERE team_long_name = 'PEC Zwolle' AND date = '2013-09-20 00:00:00'	european_football_2
SELECT chance_creation_crossing_class  FROM match_details  WHERE team_long_name = 'Hull City' AND date = '2010-02-22 00:00:00'	european_football_2
SELECT defence_aggression_class FROM team_attributes WHERE team_long_name = 'Hannover 96' AND date LIKE '2015-09-10%'	european_football_2
SELECT AVG(overall_rating)  FROM player_ratings  WHERE player_name = 'Marko Arnautovic'  AND SUBSTR(date, 1, 10) BETWEEN '2007-02-22' AND '2016-04-21'	european_football_2
SELECT ((t1.overall_rating - t2.overall_rating) * 100.0 / t1.overall_rating)  FROM players t1, players t2  WHERE t1.player_name = 'Landon Donovan' AND t2.player_name = 'Jordan Bowery' AND t1.date = '2013-07-12' AND t2.date = '2013-07-12'	european_football_2
SELECT player_name FROM Player WHERE height = (SELECT MAX(height) FROM Player)	european_football_2
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10	european_football_2
SELECT player_name FROM Player WHERE datetime(CURRENT_TIMESTAMP, 'localtime') - datetime(birthday) > 34	european_football_2
SELECT COUNT(home_team_goal)  FROM matches  JOIN players ON matches.home_team_goal = players.player_id  WHERE players.player_name = 'Aaron Lennon';	european_football_2
SELECT SUM(away_team_goal)  FROM match_goals  WHERE player_name IN ('Daan Smith', 'Filipe Ferreira');	european_football_2
SELECT COUNT(*)  FROM Player  WHERE julianday('now') - julianday(birthday) < 365 * 31;	european_football_2
SELECT p.player_name  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE pa.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)	european_football_2
SELECT name FROM players WHERE potential = (SELECT MAX(potential) FROM players)	european_football_2
SELECT name FROM players WHERE attacking_work_rate = 'high';	european_football_2
SELECT name  FROM players  WHERE finishing = 1  ORDER BY datetime(CURRENT_TIMESTAMP, 'localtime') - datetime(birthday) DESC  LIMIT 1;	european_football_2
SELECT player_name FROM players WHERE country = 'Belgium'	european_football_2
SELECT p.name, c.country_name  FROM players p  JOIN countries c ON p.country_id = c.country_id  WHERE p.vision > 89;	european_football_2
SELECT country, AVG(weight) AS average_weight FROM players GROUP BY country ORDER BY average_weight DESC LIMIT 1;	european_football_2
SELECT team_long_name  FROM teams  WHERE buildUpPlaySpeedClass = 'Slow';	european_football_2
SELECT team_short_name FROM team WHERE chanceCreationPassingClass = 'Safe'	european_football_2
SELECT AVG(height) FROM Player WHERE id IN (SELECT id FROM Country WHERE id = 1)	european_football_2
SELECT player_name FROM Player WHERE height > 180 ORDER BY player_name LIMIT 3	european_football_2
SELECT COUNT(*) FROM `Player` WHERE `player_name` LIKE 'Aaron%' AND `birthday` > '1990-01-01'	european_football_2
SELECT (jumping - (SELECT jumping FROM players WHERE id = 23)) AS difference FROM players WHERE id = 6	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE potential IN (SELECT MIN(potential) FROM Player_Attributes WHERE preferred_foot = 'right') AND preferred_foot = 'right' LIMIT 5	european_football_2
SELECT COUNT(*)  FROM Player_Attributes  WHERE crossing = (SELECT MAX(crossing) FROM Player_Attributes) AND preferred_foot = 'left'	european_football_2
SELECT CAST(COUNT(*) AS REAL) * 100 / (SELECT COUNT(*) FROM Player_Attributes) FROM Player_Attributes WHERE stamina > 80 AND strength > 80	european_football_2
SELECT T2.name FROM League AS T1 JOIN Country AS T2 ON T1.country_id = T2.id WHERE T1.name = 'Poland Ekstraklasa'	european_football_2
SELECT home_team_goal, away_team_goal  FROM Match  JOIN League ON Match.league_id = League.id  WHERE Match.date LIKE '2008-09-24%' AND League.name = 'Belgium Jupiler League'	european_football_2
SELECT pa.sprint_speed, pa.agility, pa.acceleration  FROM Player_Attributes pa  JOIN Player p ON pa.player_api_id = p.player_api_id  WHERE p.player_name = 'Alexis Blin'	european_football_2
SELECT buildUpPlaySpeedClass  FROM team  WHERE team_long_name = 'KSV Cercle Brugge';	european_football_2
SELECT COUNT(*)  FROM games  WHERE season = '2015/2016' AND league = 'Italian Serie A'	european_football_2
SELECT MAX(home_team_goal) AS highest_score FROM matches WHERE league_id = (SELECT id FROM leagues WHERE name = 'Netherlands Eredivisie')	european_football_2
SELECT pa.finishing, pa.curve  FROM Player_Attributes pa  JOIN Player p ON pa.player_api_id = p.player_api_id  WHERE p.weight = (SELECT MAX(weight) FROM Player)	european_football_2
SELECT L.name, COUNT(M.id) AS game_count FROM Match M JOIN League L ON M.league_id = L.id WHERE M.season = '2015/2016' GROUP BY L.name ORDER BY game_count DESC LIMIT 4;	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id WHERE T2.away_team_goal = (SELECT MAX(away_team_goal) FROM Match)	european_football_2
SELECT overall_rating FROM Player_Attributes WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes) LIMIT 1	european_football_2
SELECT CAST(COUNT(CASE WHEN height < 180 AND overall_strength > 70 THEN 1 END) AS FLOAT) / COUNT(id) * 100 FROM players	european_football_2
SELECT    CASE      WHEN COUNT(CASE WHEN SEX = 'M' AND Admission = '+' THEN 1 END) > COUNT(CASE WHEN SEX = 'M' AND Admission = '-' THEN 1 END) THEN 'In-patient'     ELSE 'Out-patient'   END AS "More",   (COUNT(CASE WHEN SEX = 'M' AND Admission = '+' THEN 1 END) - COUNT(CASE WHEN SEX = 'M' AND Admission = '-' THEN 1 END)) * 100.0 / COUNT(CASE WHEN SEX = 'M' THEN 1 END) AS "DeviationPercentage" FROM Patient	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN strftime('%Y', Birthday) > '1930' THEN 1 ELSE NULL END) AS REAL) / COUNT(*) FROM Patient WHERE SEX = 'F'	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN Admission = '+' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(*) FROM Patient WHERE Birthday BETWEEN '1930-01-01' AND '1940-12-31'	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) AS FLOAT) / SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END) AS Ratio FROM Patient WHERE Diagnosis = 'SLE'	thrombosis_prediction
SELECT p.Diagnosis, l.Date  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.ID = 30609;	thrombosis_prediction
SELECT p.SEX, p.Birthday, e.`Examination Date`, e.Symptoms  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE p.ID = 163109;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.LDH > 500;	thrombosis_prediction
SELECT p.ID, YEAR(CURDATE()) - YEAR(p.Birthday) AS Age  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.RVVT = '+'	thrombosis_prediction
SELECT P.ID, P.SEX, P.Diagnosis  FROM Patient P  JOIN Examination E ON P.ID = E.ID  WHERE E.Thrombosis = 2;	thrombosis_prediction
SELECT p.ID  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE YEAR(p.Birthday) = 1937 AND l.`T-CHO` >= 250;	thrombosis_prediction
SELECT P.ID, P.SEX, P.Diagnosis  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.ALB < 3.5;	thrombosis_prediction
SELECT CAST(COUNT(DISTINCT CASE WHEN P.SEX = 'F' AND (L.TP < 6.0 OR L.TP > 8.5) THEN P.ID END) AS REAL) * 100 / COUNT(DISTINCT P.ID)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID;	thrombosis_prediction
SELECT AVG(`aCL IgG`)  FROM `Examination`  JOIN `Patient` ON `Examination`.`ID` = `Patient`.`ID`  WHERE `Patient`.`Admission` = '+' AND (STRFTIME('%Y', 'now') - STRFTIME('%Y', `Patient`.`Birthday`)) >= 50;	thrombosis_prediction
SELECT COUNT(*) FROM `Patient` WHERE `SEX` = 'F' AND YEAR(`Description`) = 1997 AND `Admission` = '-'	thrombosis_prediction
SELECT MIN(YEAR(`First Date`) - YEAR(`Birthday`)) AS Age FROM `Patient` WHERE `Birthday` IS NOT NULL	thrombosis_prediction
SELECT COUNT(*)  FROM Examination E  JOIN Patient P ON E.ID = P.ID  WHERE E.`Thrombosis` = 1 AND YEAR(E.`Examination Date`) = 1997 AND P.SEX = 'F'	thrombosis_prediction
SELECT MAX(YEAR(Birthday)) - MIN(YEAR(Birthday)) AS AgeGap  FROM Patient  WHERE ID IN (SELECT ID FROM Laboratory WHERE TG >= 200)	thrombosis_prediction
SELECT E.Symptoms, P.Diagnosis FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE P.Birthday = (SELECT MAX(Birthday) FROM Patient WHERE ID IN (SELECT ID FROM Examination WHERE Symptoms IS NOT NULL))	thrombosis_prediction
SELECT CAST(COUNT(DISTINCT ID) AS REAL) / 12  FROM Laboratory  JOIN Patient ON Laboratory.ID = Patient.ID  WHERE SEX = 'M' AND Date BETWEEN '1998-01-01' AND '1998-12-31'	thrombosis_prediction
SELECT L.Date, (YEAR(P.`First Date`) - YEAR(P.Birthday)) AS Age  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.Diagnosis = 'SJS'  ORDER BY P.Birthday ASC  LIMIT 1;	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN P.SEX = 'M' AND L.UA <= 8.0 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN P.SEX = 'F' AND L.UA <= 6.5 THEN 1 ELSE 0 END) AS Ratio  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE DATE_ADD(p.`First Date`, INTERVAL 1 YEAR) <= e.`Examination Date`	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE YEAR(e.`Examination Date`) BETWEEN 1990 AND 1993  AND (YEAR(e.`Examination Date`) - YEAR(p.Birthday)) < 18;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.SEX = 'M' AND l.`T-BIL` >= 2.0	thrombosis_prediction
SELECT Diagnosis, COUNT(Diagnosis) AS DiagnosisCount  FROM Examination  WHERE `Examination Date` BETWEEN '1985-01-01' AND '1995-12-31'  GROUP BY Diagnosis  ORDER BY DiagnosisCount DESC  LIMIT 1;	thrombosis_prediction
SELECT AVG(1999 - YEAR(P.Birthday)) AS AverageAge FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.Date BETWEEN '1991-10-01' AND '1991-10-30'	thrombosis_prediction
SELECT MAX(L.HGB) AS MaxHGB, P.Diagnosis, YEAR(L.Date) - YEAR(P.Birthday) AS Age FROM Laboratory L JOIN Patient P ON L.ID = P.ID GROUP BY L.ID, P.Diagnosis, P.Birthday ORDER BY MaxHGB DESC LIMIT 1;	thrombosis_prediction
SELECT ANA FROM Examination WHERE ID = 3605340 AND `Examination Date` = '1996-12-02'	thrombosis_prediction
SELECT CASE WHEN `T-CHO` < 250 THEN 'Normal' ELSE 'Not Normal' END AS Cholesterol_Status FROM `Laboratory` WHERE `ID` = 2927464 AND `Date` = '1995-09-04'	thrombosis_prediction
SELECT SEX FROM Patient WHERE Diagnosis = 'AORTITIS' ORDER BY `First Date` ASC LIMIT 1	thrombosis_prediction
SELECT E.`aCL IgM`  FROM `Examination` E  JOIN `Patient` P ON E.ID = P.ID  WHERE P.Diagnosis = 'SLE' AND P.Description = '1994-02-19' AND E.`Examination Date` = '1993-11-12'	thrombosis_prediction
SELECT P.SEX FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GPT = 9 AND L.Date = '1992-06-12'	thrombosis_prediction
SELECT (YEAR('1991-10-21') - YEAR(P.Birthday)) AS Age FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.Date = '1991-10-21' AND L.UA = 8.4;	thrombosis_prediction
SELECT COUNT(L.ID)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.`First Date` = '1991-06-13' AND P.Diagnosis = 'SJS' AND YEAR(L.`Date`) = 1995;	thrombosis_prediction
SELECT p.Diagnosis FROM Patient p INNER JOIN Examination e ON p.ID = e.ID WHERE e.`Examination Date` = '1997-01-27' AND e.Diagnosis LIKE '%SLE%' AND p.`First Date` IS NOT NULL;	thrombosis_prediction
SELECT E.Symptoms  FROM Examination E  JOIN Patient P ON E.ID = P.ID  WHERE P.Birthday = '1959-03-01' AND E.`Examination Date` = '1993-09-27'	thrombosis_prediction
SELECT (SUM(CASE WHEN Date LIKE '1981-11-%' THEN `T-CHO` END) - SUM(CASE WHEN Date LIKE '1981-12-%' THEN `T-CHO` END)) AS DecreaseRate FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE P.Birthday = '1959-02-18'	thrombosis_prediction
SELECT ID FROM Examination WHERE Diagnosis LIKE '%Behcet%' AND `Examination Date` BETWEEN '1997-01-01' AND '1997-12-31'	thrombosis_prediction
SELECT ID FROM Laboratory WHERE Date BETWEEN '1987-07-06' AND '1996-01-31' AND GPT > 30 AND ALB < 4 GROUP BY ID	thrombosis_prediction
SELECT ID FROM Patient WHERE SEX = 'F' AND strftime('%Y', Birthday) = '1964' AND Admission = '+'	thrombosis_prediction
SELECT COUNT(*)  FROM `Examination`  WHERE `Thrombosis` = 2  AND `ANA Pattern` = 'S'  AND `aCL IgM` > (SELECT AVG(`aCL IgM`) * 1.2 FROM `Examination`)	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN UA <= 6.5 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Laboratory WHERE `U-PRO` > 0 AND `U-PRO` < 30	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN Diagnosis = 'BEHCET' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Patient WHERE SEX = 'M' AND STRFTIME('%Y', `First Date`) = '1981'	thrombosis_prediction
SELECT P.ID  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.Admission = '-'  AND L.Date LIKE '1991-10-%'  AND L.`T-BIL` < 2.0;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient P  JOIN Examination E ON P.ID = E.ID  WHERE P.SEX = 'F' AND E.`ANA Pattern` != 'P' AND P.Birthday BETWEEN '1980-01-01' AND '1989-12-31'	thrombosis_prediction
SELECT P.SEX  FROM Patient P  JOIN Examination E ON P.ID = E.ID  JOIN Laboratory L ON P.ID = L.ID  WHERE E.Diagnosis LIKE '%PSS%' AND L.CRP > 2 AND L.CRE = 1 AND L.LDH = 123;	thrombosis_prediction
SELECT AVG(ALB) FROM Laboratory INNER JOIN Patient ON Laboratory.ID = Patient.ID WHERE SEX = 'F' AND Diagnosis = 'SLE' AND PLT > 400	thrombosis_prediction
SELECT Symptoms FROM Examination WHERE Diagnosis = 'SLE' GROUP BY Symptoms ORDER BY COUNT(*) DESC LIMIT 1	thrombosis_prediction
SELECT `First Date`, `Diagnosis` FROM `Patient` WHERE `ID` = 48473	thrombosis_prediction
SELECT COUNT(*) FROM `Patient` WHERE `SEX` = 'F' AND `Diagnosis` = 'APS'	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE YEAR(Date) = 1997 AND (ALB < 6 OR ALB > 8.5)	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN Symptoms LIKE '%thrombocytopenia%' AND Diagnosis LIKE '%SLE%' THEN 1 END) AS FLOAT) / COUNT(CASE WHEN Symptoms LIKE '%thrombocytopenia%' THEN 1 END) * 100 FROM Examination	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN SEX = 'F' THEN 1 ELSE 0 END) AS REAL) / COUNT(*) * 100  FROM Patient  WHERE Diagnosis = 'RA' AND YEAR(Birthday) = 1980;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE p.SEX = 'M'  AND p.Diagnosis = 'Behcet'  AND p.Admission = '-'  AND e.`Examination Date` BETWEEN '1995-01-01' AND '1997-12-31'	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.SEX = 'F' AND l.WBC < 3.5	thrombosis_prediction
SELECT DATEDIFF(`Examination Date`, `First Date`) FROM `Examination` JOIN `Patient` ON `Examination`.`ID` = `Patient`.`ID` WHERE `Patient`.`ID` = 821298;	thrombosis_prediction
SELECT CASE WHEN P.SEX = 'M' AND L.UA > 8.0 THEN 'Yes' WHEN P.SEX = 'F' AND L.UA > 6.5 THEN 'Yes' ELSE 'No' END AS Is_UA_Normal FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.ID = 57266;	thrombosis_prediction
SELECT Date FROM Laboratory WHERE ID = 48473 AND GOT >= 60	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.GOT < 60 AND YEAR(L.Date) = 1994;	thrombosis_prediction
SELECT DISTINCT P.ID  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.SEX = 'M' AND L.GPT >= 60;	thrombosis_prediction
SELECT p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GPT > 60 ORDER BY p.Birthday ASC	thrombosis_prediction
SELECT AVG(LDH) FROM Laboratory WHERE LDH < 500 AND LDH IS NOT NULL	thrombosis_prediction
SELECT P.ID, YEAR(CURDATE()) - YEAR(P.Birthday) AS Age  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.LDH BETWEEN 600 AND 800;	thrombosis_prediction
SELECT P.ID, P.Admission  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.ALP < 300;	thrombosis_prediction
SELECT p.ID, CASE WHEN l.ALP < 300 THEN 'Yes' ELSE 'No' END AS Is_ALP_Normal FROM Patient p LEFT JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday = '1982-04-01'	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.TP < 6.0	thrombosis_prediction
SELECT (L.TP - 8.5) AS Deviation FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE P.SEX = 'F' AND L.TP > 8.5;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.SEX = 'M' AND (l.ALB <= 3.5 OR l.ALB >= 5.5)  ORDER BY p.Birthday DESC;	thrombosis_prediction
SELECT p.ID, CASE WHEN l.ALB BETWEEN 3.5 AND 5.5 THEN 'Within Range' ELSE 'Out of Range' END AS Albumin_Status FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE YEAR(p.Birthday) = 1982;	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN L.UA > 6.5 THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(*) FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE P.SEX = 'F'	thrombosis_prediction
SELECT AVG(UA)  FROM (  SELECT L.UA, L.Date, P.SEX   FROM Laboratory L   JOIN Patient P ON L.ID = P.ID   WHERE (P.SEX = 'F' AND L.UA < 6.5) OR (P.SEX = 'M' AND L.UA < 8.0) ) AS NormalUA  WHERE Date = (  SELECT MAX(Date)   FROM Laboratory   WHERE ID = NormalUA.ID )	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.UN = 29;	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.Diagnosis = 'RA' AND L.UN < 30;	thrombosis_prediction
SELECT COUNT(DISTINCT L.ID)  FROM Laboratory L  JOIN Patient P ON L.ID = P.ID  WHERE P.SEX = 'M' AND L.CRE >= 1.5;	thrombosis_prediction
SELECT (SUM(CASE WHEN P.SEX = 'M' THEN 1 ELSE 0 END) > SUM(CASE WHEN P.SEX = 'F' THEN 1 ELSE 0 END)) AS Result  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.CRE >= 1.5;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.`T-BIL` = (SELECT MAX(`T-BIL`) FROM Laboratory)	thrombosis_prediction
SELECT P.SEX, GROUP_CONCAT(DISTINCT P.ID) AS Patient_IDs FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.`T-BIL` >= 2.0 GROUP BY P.SEX;	thrombosis_prediction
SELECT p.ID, l.`T-CHO` FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday = (SELECT MIN(Birthday) FROM Patient) ORDER BY l.`T-CHO` DESC LIMIT 1;	thrombosis_prediction
SELECT AVG(YEAR(CURDATE()) - YEAR(Birthday)) AS average_age  FROM Patient  WHERE SEX = 'M' AND ID IN (     SELECT ID      FROM Laboratory      WHERE `T-CHO` >= 250 )	thrombosis_prediction
SELECT P.ID, P.Diagnosis  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.TG > 300;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.TG >= 200 AND (YEAR(CURDATE()) - YEAR(p.Birthday)) > 50;	thrombosis_prediction
SELECT DISTINCT L.ID  FROM Laboratory L  JOIN Patient P ON L.ID = P.ID  WHERE P.Admission = '-' AND L.CPK < 250;	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND YEAR(T1.Birthday) BETWEEN '1936' AND '1956' AND T2.CPK >= 250	thrombosis_prediction
SELECT p.ID, p.SEX, DATE_PART('year', AGE(p.Birthday)) AS age  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.GLU >= 180 AND l.`T-CHO` < 250;	thrombosis_prediction
SELECT P.ID, L.GLU  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE YEAR(P.`First Date`) = 1991 AND L.GLU < 180;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.WBC <= 3.5 OR l.WBC >= 9.0  GROUP BY p.SEX  ORDER BY p.Birthday ASC;	thrombosis_prediction
SELECT P.ID, (strftime('%Y', 'now') - strftime('%Y', P.Birthday)) AS Age, P.Diagnosis  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.RBC < 3.5;	thrombosis_prediction
SELECT p.ID, p.Admission  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.SEX = 'F' AND (strftime('%Y', 'now') - strftime('%Y', p.Birthday)) >= 50 AND (l.RBC <= 3.5 OR l.RBC >= 6.0)	thrombosis_prediction
SELECT DISTINCT p.ID, p.SEX  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.Admission = '-' AND l.HGB < 10;	thrombosis_prediction
SELECT P.ID, P.SEX  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.Diagnosis = 'SLE' AND L.HGB > 10 AND L.HGB < 17  ORDER BY P.Birthday ASC  LIMIT 1;	thrombosis_prediction
SELECT P.ID, YEAR(CURRENT_TIMESTAMP) - YEAR(P.Birthday) AS Age FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.HCT >= 52 GROUP BY P.ID HAVING COUNT(L.ID) > 2	thrombosis_prediction
SELECT AVG(HCT) FROM Laboratory WHERE Date LIKE '1991%' AND HCT < 29;	thrombosis_prediction
SELECT      (SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE PLT < 100) -      (SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE PLT > 400) AS Difference,     (SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE PLT < 100) AS LowerThanNormal,     (SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE PLT > 400) AS HigherThanNormal	thrombosis_prediction
SELECT p.ID  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE YEAR(l.Date) = 1984  AND (YEAR(CURDATE()) - YEAR(p.Birthday)) < 50  AND l.PLT BETWEEN 100 AND 400	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T2.PT >= 14 AND T1.SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T2.PT >= 14 THEN 1 ELSE 0 END) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE DATE('now') - T1.Birthday > 55 * 365;	thrombosis_prediction
SELECT p.ID  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.`First Date` > '1992-12-31' AND l.PT < 14;	thrombosis_prediction
SELECT COUNT(*) FROM `Laboratory` WHERE `Date` > '1997-01-01' AND `APTT` < 45	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  JOIN Laboratory l ON p.ID = l.ID  WHERE e.Thrombosis = 0 AND l.APTT > 45;	thrombosis_prediction
SELECT COUNT(DISTINCT L.ID)  FROM Laboratory L  JOIN Patient P ON L.ID = P.ID  WHERE P.SEX = 'M' AND L.WBC > 3.5 AND L.WBC < 9.0 AND (L.FG <= 150 OR L.FG >= 450)	thrombosis_prediction
SELECT COUNT(DISTINCT L.ID)  FROM Laboratory L  JOIN Patient P ON L.ID = P.ID  WHERE P.Birthday > '1980-01-01' AND (L.FG < 150 OR L.FG > 450)	thrombosis_prediction
SELECT DISTINCT p.Diagnosis  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.`U-PRO` >= 30;	thrombosis_prediction
SELECT P.ID  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.Diagnosis = 'SLE' AND L.`U-PRO` BETWEEN 0 AND 30;	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE IGG >= 2000	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID)  FROM Examination E  JOIN Laboratory L ON E.ID = L.ID  WHERE L.IGG > 900 AND L.IGG < 2000 AND E.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT p.diagnosis FROM patients p WHERE p.IGA = (SELECT MAX(IGA) FROM patients WHERE IGA BETWEEN 80 AND 500)	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.IGA > 80 AND l.IGA < 500 AND p.`First Date` >= '1990-01-01'	thrombosis_prediction
SELECT Diagnosis  FROM Patient  WHERE ID IN (     SELECT ID      FROM Laboratory      WHERE IGM <= 40 OR IGM >= 400 )  GROUP BY Diagnosis  ORDER BY COUNT(*) DESC  LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE CRP = '+' AND Description IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.CRE >= 1.5 AND (YEAR(CURDATE()) - YEAR(p.Birthday)) < 70;	thrombosis_prediction
SELECT COUNT(DISTINCT L.ID)  FROM Laboratory L  JOIN Examination E ON L.ID = E.ID  WHERE L.RA IN ('-', '+-') AND E.KCT = '+'	thrombosis_prediction
SELECT P.Diagnosis  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.Birthday > '1985-01-01' AND L.RA IN ('-', '+-')	thrombosis_prediction
SELECT P.ID  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.RF < 20 AND (YEAR(CURDATE()) - YEAR(P.Birthday)) > 60;	thrombosis_prediction
SELECT COUNT(DISTINCT l.ID)  FROM Laboratory l JOIN Examination e ON l.ID = e.ID WHERE l.RF < 20 AND e.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID)  FROM Examination E  JOIN Laboratory L ON E.ID = L.ID  WHERE L.C3 > 35 AND E.`ANA Pattern` LIKE '%P%';	thrombosis_prediction
SELECT `ID` FROM `Examination` WHERE `aCL IgA` = (SELECT MAX(`aCL IgA`) FROM `Examination` WHERE `ID` IN (SELECT `ID` FROM `Laboratory` WHERE `HCT` NOT BETWEEN 29 AND 52))	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.Diagnosis LIKE '%APS%' AND l.C4 > 10;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.Admission = '+' AND (l.RNP = '-' OR l.RNP = '+-')	thrombosis_prediction
SELECT p.Birthday  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.RNP NOT IN ('-', '+-')  ORDER BY p.Birthday DESC  LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID)  FROM Patient P  JOIN Examination E ON P.ID = E.ID  WHERE E.SM IN ('-', '+-') AND E.Thrombosis = 0;	thrombosis_prediction
SELECT P.ID  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.SM NOT IN ('negative', '0')  ORDER BY P.Birthday DESC  LIMIT 3;	thrombosis_prediction
SELECT ID FROM Laboratory WHERE Date > '1997-01-01' AND SC170 IN ('negative', '0')	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE p.SEX = 'F' AND e.Symptoms IS NULL AND e.SSC170 IN ('negative', '0')	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.SSA IN ('-', '+-') AND YEAR(p.`First Date`) < 2000;	thrombosis_prediction
SELECT p.ID  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.SSA NOT IN ('negative', '0')  ORDER BY p.`First Date`  LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.Diagnosis = 'SLE' AND L.SSB IN ('-', '0')	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID)  FROM Examination E  JOIN Laboratory L ON E.ID = L.ID  WHERE L.SSB IN ('negative', '0') AND E.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.SEX = 'M'  AND l.SSB IN ('-', '+-')  AND l.CENTROMEA IN ('-', '+-');	thrombosis_prediction
SELECT DISTINCT p.Diagnosis  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.DNA >= 8;	thrombosis_prediction
SELECT COUNT(DISTINCT L.ID)  FROM Laboratory L  JOIN Patient P ON L.ID = P.ID  WHERE P.Description IS NULL AND L.DNA < 8;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.IGG > 900 AND L.IGG < 2000 AND P.Admission = '+';	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN p.Diagnosis = 'SLE' THEN l.ID END) AS REAL) * 100 / COUNT(l.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.GOT >= 60;	thrombosis_prediction
SELECT COUNT(DISTINCT L.ID)  FROM Laboratory L  JOIN Patient P ON L.ID = P.ID  WHERE P.SEX = 'M' AND L.GOT < 60;	thrombosis_prediction
SELECT MAX(Birthday) FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE GOT >= 60)	thrombosis_prediction
SELECT p.Birthday  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.GPT < 60  GROUP BY p.ID  ORDER BY MAX(l.GPT) DESC  LIMIT 3;	thrombosis_prediction
SELECT COUNT(P.ID)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.GOT < 60 AND P.SEX = 'M'	thrombosis_prediction
SELECT MIN(T1.`First Date`) FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T2.LDH < 500 ORDER BY T2.LDH DESC LIMIT 1	thrombosis_prediction
SELECT p.`First Date`, l.LDH  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.LDH >= 500  ORDER BY p.`First Date` DESC  LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.Admission = '+' AND l.ALP >= 300;	thrombosis_prediction
SELECT COUNT(DISTINCT L.ID)  FROM Laboratory L  JOIN Patient P ON L.ID = P.ID  WHERE P.Admission = '-' AND L.ALP < 300;	thrombosis_prediction
SELECT P.Diagnosis  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.TP < 6.0;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.Diagnosis = 'SJS' AND l.TP > 6.0 AND l.TP < 8.5;	thrombosis_prediction
SELECT `Date` FROM `Laboratory` WHERE `ALB` = (SELECT MAX(`ALB`) FROM `Laboratory` WHERE `ALB` > 3.5 AND `ALB` < 5.5)	thrombosis_prediction
SELECT COUNT(DISTINCT L.ID)  FROM Laboratory L  JOIN Patient P ON L.ID = P.ID  WHERE P.SEX = 'M' AND L.ALB > 3.5 AND L.ALB < 5.5 AND L.TP BETWEEN 6.0 AND 8.5;	thrombosis_prediction
SELECT E.`aCL IgG`, E.`aCL IgM`, E.`aCL IgA`  FROM `Examination` E  JOIN `Patient` P ON E.ID = P.ID  JOIN `Laboratory` L ON L.ID = P.ID  WHERE P.SEX = 'F' AND L.UA > 6.50  ORDER BY L.UA DESC  LIMIT 1;	thrombosis_prediction
SELECT MAX(ANA)  FROM Examination  WHERE ID IN (SELECT ID FROM Laboratory WHERE CRE < 1.5)	thrombosis_prediction
SELECT E.ID  FROM Examination E  JOIN Laboratory L ON E.ID = L.ID  WHERE L.CRE < 1.5  GROUP BY E.ID  HAVING E.`aCL IgA` = (SELECT MAX(`aCL IgA`) FROM Examination)	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID)  FROM Examination E  JOIN Laboratory L ON E.ID = L.ID  WHERE L.`T-BIL` >= 2.0 AND E.`ANA Pattern` LIKE '%P%'	thrombosis_prediction
SELECT E.ANA FROM Examination E JOIN Patient P ON E.ID = P.ID JOIN Laboratory L ON P.ID = L.ID WHERE L.`T-BIL` = (SELECT MAX(`T-BIL`) FROM Laboratory WHERE `T-BIL` < 2.0)	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID)  FROM Examination E  JOIN Laboratory L ON E.ID = L.ID  WHERE L.`T-CHO` >= 250 AND E.KCT = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID)  FROM Examination E  JOIN Laboratory L ON E.ID = L.ID  WHERE L.`T-CHO` < 250 AND E.`ANA Pattern` LIKE '%P%'	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID)  FROM Examination E  JOIN Laboratory L ON E.ID = L.ID  WHERE L.TG < 200 AND E.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT Diagnosis FROM Examination WHERE ID = (SELECT ID FROM Laboratory WHERE TG < 200 ORDER BY TG DESC LIMIT 1)	thrombosis_prediction
SELECT E.ID  FROM Examination E  JOIN Laboratory L ON E.ID = L.ID  WHERE E.Thrombosis = 0 AND L.CPK < 250;	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID)  FROM Examination E  JOIN Laboratory L ON E.ID = L.ID  WHERE L.CPK < 250 AND (E.KCT = '+' OR E.RVVT = '+' OR E.LAC = '+')	thrombosis_prediction
SELECT MIN(Birthday) FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE GLU > 180)	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  JOIN Examination E ON P.ID = E.ID  WHERE L.GLU < 180 AND E.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.Admission = '+' AND l.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.Diagnosis = 'SLE' AND L.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.RBC <= 3.5 OR l.RBC >= 6.0 AND p.Admission = '+'	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.PLT > 100 AND l.PLT < 400 AND p.Diagnosis IS NOT NULL;	thrombosis_prediction
SELECT L.PLT  FROM Laboratory L  JOIN Patient P ON L.ID = P.ID  WHERE P.Diagnosis = 'MCTD' AND L.PLT > 100 AND L.PLT < 400;	thrombosis_prediction
SELECT AVG(PT) FROM Laboratory WHERE ID IN (SELECT ID FROM Patient WHERE SEX = 'M') AND PT < 14	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID)  FROM Examination E  JOIN Laboratory L ON E.ID = L.ID  WHERE E.Thrombosis = 1 AND L.PT < 14;	thrombosis_prediction
SELECT m.major_name FROM major m JOIN member mb ON m.major_id = mb.link_to_major WHERE mb.first_name = 'Angela' AND mb.last_name = 'Sanders'	student_club
SELECT COUNT(*)  FROM `member` m  JOIN `major` ma  ON m.link_to_major = ma.major_id  WHERE ma.college = 'College of Engineering'	student_club
SELECT member.first_name, member.last_name  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.department = 'Art and Design Department'	student_club
SELECT COUNT(*) FROM `attendance` WHERE `link_to_event` = (SELECT `event_id` FROM `event` WHERE `event_name` = 'Women''s Soccer')	student_club
SELECT m.phone FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer'	student_club
SELECT COUNT(*)  FROM attendance a JOIN event e ON a.link_to_event = e.event_id JOIN member m ON a.link_to_member = m.member_id WHERE e.event_name = 'Women''s Soccer' AND m.t_shirt_size = 'Medium'	student_club
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event GROUP BY e.event_id, e.event_name ORDER BY COUNT(a.link_to_event) DESC LIMIT 1	student_club
SELECT t1.college FROM major AS t1 JOIN member AS t2 ON t1.major_id = t2.link_to_major WHERE t2.position = 'Vice President'	student_club
SELECT e.event_name  FROM event e  JOIN attendance a ON e.event_id = a.link_to_event  JOIN member m ON a.link_to_member = m.member_id  WHERE m.first_name = 'Maya' AND m.last_name = 'Mclean'	student_club
SELECT COUNT(*)  FROM attendance a JOIN event e ON a.link_to_event = e.event_id JOIN member m ON a.link_to_member = m.member_id WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison' AND STRFTIME('%Y', e.event_date) = '2019'	student_club
SELECT COUNT(*)  FROM event e  JOIN attendance a ON e.event_id = a.link_to_event  WHERE e.type = 'Meeting'  GROUP BY e.event_id  HAVING COUNT(a.link_to_event) > 10;	student_club
SELECT event_name FROM event WHERE event_id IN (SELECT link_to_event FROM attendance GROUP BY link_to_event HAVING COUNT(link_to_event) > 20) AND type != 'fundraiser'	student_club
SELECT CAST(COUNT(a.link_to_event) AS REAL) / COUNT(DISTINCT e.event_id)  FROM event e  JOIN attendance a ON e.event_id = a.link_to_event  WHERE e.type = 'Meeting' AND strftime('%Y', e.event_date) = '2020'	student_club
SELECT expense_description, MAX(cost) FROM expense WHERE expense_description IN ('Post Cards, Posters', 'Water, Cookies', 'Pizza', 'Posters', 'Parking') GROUP BY expense_description ORDER BY cost DESC LIMIT 1	student_club
SELECT COUNT(*) FROM `member` m JOIN `major` ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Environmental Engineering'	student_club
SELECT m.first_name, m.last_name  FROM member m  JOIN attendance a ON m.member_id = a.link_to_member  JOIN event e ON a.link_to_event = e.event_id  WHERE e.event_name = 'Laugh Out Loud'	student_club
SELECT m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Law and Constitutional Studies'	student_club
SELECT zip_code.county FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.first_name = 'Sherri' AND member.last_name = 'Ramsey'	student_club
SELECT T1.college FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Tyler' AND T2.last_name = 'Hewitt'	student_club
SELECT SUM(amount) FROM income WHERE link_to_member IN (SELECT member_id FROM member WHERE position = 'Vice President')	student_club
SELECT SUM(spent) FROM budget INNER JOIN event ON budget.link_to_event = event.event_id WHERE category = 'Food' AND event_name = 'September Meeting'	student_club
SELECT z.city, z.state FROM zip_code z JOIN member m ON z.zip_code = m.zip WHERE m.position = 'President'	student_club
SELECT m.first_name, m.last_name FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE z.state = 'Illinois'	student_club
SELECT SUM(spent) FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE budget.category = 'Advertisement' AND event.event_name = 'September Meeting'	student_club
SELECT m.department  FROM major m  JOIN member mb ON m.major_id = mb.link_to_major  WHERE mb.last_name IN ('Pierce', 'Guidi')  GROUP BY m.department  HAVING COUNT(DISTINCT mb.last_name) = 2;	student_club
SELECT SUM(amount) FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'October Speaker'	student_club
SELECT e.approved FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.event_name = 'October Meeting' AND ev.event_date = '2019-10-08T00:00:00' AND e.approved = 'true'	student_club
SELECT AVG(cost) AS average_cost  FROM expense e  JOIN member m ON e.link_to_member = m.member_id  WHERE m.first_name = 'Elijah' AND m.last_name = 'Allen'  AND (SUBSTR(e.expense_date, 6, 2) = '09' OR SUBSTR(e.expense_date, 6, 2) = '10')	student_club
SELECT SUM(CASE WHEN SUBSTR(e.event_date, 1, 4) = '2019' THEN b.spent ELSE 0 END) - SUM(CASE WHEN SUBSTR(e.event_date, 1, 4) = '2020' THEN b.spent ELSE 0 END) AS difference FROM event e JOIN budget b ON e.event_id = b.link_to_event;	student_club
SELECT location FROM event WHERE event_name = 'Spring Budget Review'	student_club
SELECT cost FROM expense WHERE expense_description = 'Posters' AND expense_date = '2019-09-04'	student_club
SELECT remaining FROM budget WHERE category = 'Food' AND amount = (SELECT MAX(amount) FROM budget WHERE category = 'Food')	student_club
SELECT notes FROM income WHERE source = 'Fundraising' AND date_received = '2019-09-14'	student_club
SELECT COUNT(*) FROM `major` WHERE `college` = 'College of Humanities and Social Sciences'	student_club
SELECT phone FROM member WHERE first_name = 'Carlo' AND last_name = 'Jacobs'	student_club
SELECT z.county FROM zip_code z JOIN member m ON z.zip_code = m.zip WHERE m.first_name = 'Adela' AND m.last_name = 'O''Gallagher'	student_club
SELECT COUNT(*) FROM `budget` JOIN `event` ON `budget.link_to_event` = `event.event_id` WHERE `event.event_name` = 'November Meeting' AND `budget.remaining` < 0	student_club
SELECT SUM(b.amount)  FROM budget b  JOIN event e ON b.link_to_event = e.event_id  WHERE e.event_name = 'September Speaker'	student_club
SELECT b.event_status FROM budget b JOIN expense e ON b.budget_id = e.link_to_budget WHERE e.expense_description = 'Post Cards, Posters' AND e.expense_date = '2019-08-20'	student_club
SELECT m.major_name  FROM member AS mem  JOIN major AS m ON mem.link_to_major = m.major_id  WHERE mem.first_name = 'Brent' AND mem.last_name = 'Thomason'	student_club
SELECT COUNT(*) FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Business' AND T1.t_shirt_size = 'Medium'	student_club
SELECT z.type FROM zip_code z JOIN member m ON z.zip_code = m.zip WHERE m.first_name = 'Christof' AND m.last_name = 'Nielson'	student_club
SELECT m.major_name  FROM major m  JOIN member mb  ON m.major_id = mb.link_to_major  WHERE mb.position = 'Vice President'	student_club
SELECT z.state FROM zip_code z JOIN member m ON z.zip_code = m.zip WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison'	student_club
SELECT m.department  FROM major m  JOIN member mm ON m.major_id = mm.link_to_major  WHERE mm.position = 'President'	student_club
SELECT date_received FROM income JOIN member ON income.link_to_member = member.member_id WHERE member.first_name = 'Connor' AND member.last_name = 'Hilton' AND income.source = 'Dues'	student_club
SELECT m.first_name, m.last_name FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.source = 'Dues' ORDER BY i.date_received ASC LIMIT 1	student_club
SELECT CAST(SUM(CASE WHEN e.event_name = 'Yearly Kickoff' THEN b.amount ELSE 0 END) AS REAL) / SUM(CASE WHEN e.event_name = 'October Meeting' THEN b.amount ELSE 0 END)  FROM budget b  JOIN event e  ON b.link_to_event = e.event_id  WHERE b.category = 'Advertisement'	student_club
SELECT (SUM(CASE WHEN category = 'Parking' THEN amount ELSE 0 END) / SUM(amount)) * 100 AS percentage  FROM budget  JOIN event ON budget.link_to_event = event.event_id  WHERE event_name = 'November Speaker'	student_club
SELECT SUM(cost) FROM expense WHERE expense_description = 'Pizza'	student_club
SELECT COUNT(DISTINCT city) FROM zip_code WHERE county = 'Orange County' AND state = 'Virginia'	student_club
SELECT department FROM major WHERE college = 'College of Humanities and Social Sciences'	student_club
SELECT z.city, z.county, z.state  FROM member m  JOIN zip_code z ON m.zip = z.zip_code  WHERE m.first_name = 'Amy' AND m.last_name = 'Firth'	student_club
SELECT expense_description FROM expense WHERE link_to_budget = (SELECT budget_id FROM budget ORDER BY remaining ASC LIMIT 1)	student_club
SELECT m.member_id  FROM member m  JOIN attendance a ON m.member_id = a.link_to_member  JOIN event e ON a.link_to_event = e.event_id  WHERE e.event_name = 'October Meeting'	student_club
SELECT college FROM major INNER JOIN member ON major.major_id = member.link_to_major WHERE member.link_to_major IS NOT NULL GROUP BY college ORDER BY COUNT(college) DESC LIMIT 1	student_club
SELECT m.major_name FROM major m JOIN member mb ON m.major_id = mb.link_to_major WHERE mb.phone = '809-555-3360'	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event GROUP BY e.event_name ORDER BY SUM(b.amount) DESC LIMIT 1	student_club
SELECT expense_description FROM expense WHERE link_to_member IN (SELECT member_id FROM member WHERE position = 'Vice President')	student_club
SELECT COUNT(*) FROM attendance INNER JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'Women''s Soccer'	student_club
SELECT i.date_received FROM income i JOIN member m ON i.link_to_member = m.member_id WHERE m.first_name = 'Casey' AND m.last_name = 'Mason'	student_club
SELECT COUNT(*) FROM `member` m JOIN `zip_code` z ON m.zip = z.zip_code WHERE z.state = 'Maryland'	student_club
SELECT COUNT(*) FROM attendance WHERE link_to_member = (SELECT member_id FROM member WHERE phone = '954-555-6240')	student_club
SELECT m.first_name, m.last_name  FROM member m  JOIN major ma ON m.link_to_major = ma.major_id  WHERE ma.department = 'School of Applied Sciences, Technology and Education'	student_club
SELECT e.event_name, MAX(b.spent / b.amount) AS ratio FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.status = 'Closed' GROUP BY e.event_name ORDER BY ratio DESC LIMIT 1;	student_club
SELECT COUNT(*) FROM `member` WHERE `position` = 'President'	student_club
SELECT MAX(spent) FROM budget	student_club
SELECT COUNT(*) FROM `event` WHERE `type` = 'Meeting' AND strftime('%Y', `event_date`) = '2020'	student_club
SELECT SUM(spent) FROM budget WHERE category = 'Food'	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member GROUP BY m.member_id HAVING COUNT(a.link_to_event) > 7	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id JOIN major mg ON m.link_to_major = mg.major_id WHERE mg.major_name = 'Interior Design' AND e.event_name = 'Community Theater'	student_club
SELECT m.first_name, m.last_name FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE z.city = 'Georgetown' AND z.state = 'South Carolina'	student_club
SELECT SUM(amount) FROM income WHERE link_to_member = (SELECT member_id FROM member WHERE first_name = 'Grant' AND last_name = 'Gilmour')	student_club
SELECT m.first_name, m.last_name FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.amount > 40	student_club
SELECT SUM(e.cost)  FROM expense e  JOIN budget b ON e.link_to_budget = b.budget_id  JOIN event ev ON b.link_to_event = ev.event_id  WHERE ev.event_name = 'Yearly Kickoff'	student_club
SELECT m.first_name, m.last_name FROM member m INNER JOIN expense e ON m.member_id = e.link_to_member INNER JOIN budget b ON e.link_to_budget = b.budget_id INNER JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.event_name = 'Yearly Kickoff'	student_club
SELECT m.first_name, m.last_name, i.source, i.amount  FROM income i  JOIN member m ON i.link_to_member = m.member_id  WHERE i.amount = (SELECT MAX(amount) FROM income)	student_club
SELECT e.event_name  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  JOIN expense ex ON b.budget_id = ex.link_to_budget  GROUP BY e.event_id  ORDER BY SUM(ex.cost) ASC  LIMIT 1	student_club
SELECT (SUM(CASE WHEN e.event_name = 'Yearly Kickoff' THEN ex.cost ELSE 0 END) / SUM(ex.cost)) * 100 AS percentage FROM event e JOIN budget b ON e.event_id = b.link_to_event JOIN expense ex ON b.budget_id = ex.link_to_budget	student_club
SELECT CAST(SUM(CASE WHEN major_name = 'Finance' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN major_name = 'Physics' THEN 1 ELSE 0 END) FROM major	student_club
SELECT source FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' GROUP BY source ORDER BY COUNT(*) DESC LIMIT 1	student_club
SELECT first_name, last_name, email FROM member WHERE position = 'Secretary'	student_club
SELECT COUNT(*) FROM `member` WHERE `link_to_major` = (SELECT `major_id` FROM `major` WHERE `major_name` = 'Physics Teaching')	student_club
SELECT COUNT(*)  FROM attendance  JOIN event ON attendance.link_to_event = event.event_id  WHERE event.event_name = 'Community Theater' AND strftime('%Y', event.event_date) = '2019'	student_club
SELECT COUNT(a.link_to_event) AS events_attended, m.major_name  FROM attendance a  JOIN member m ON a.link_to_member = m.member_id  JOIN major ma ON m.link_to_major = ma.major_id  WHERE m.first_name = 'Luisa' AND m.last_name = 'Guidi'  GROUP BY m.member_id, m.major_name;	student_club
SELECT AVG(spent) FROM budget WHERE category = 'Food' AND event_status = 'Closed'	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.category = 'Advertisement' ORDER BY b.spent DESC LIMIT 1	student_club
SELECT COUNT(*)  FROM member m  JOIN attendance a ON m.member_id = a.link_to_member  JOIN event e ON e.event_id = a.link_to_event  WHERE m.first_name = 'Maya' AND m.last_name = 'Mclean' AND e.event_name = 'Women''s Soccer'	student_club
SELECT (SUM(type = 'Community Service') / COUNT(*)) * 100 FROM event WHERE event_date BETWEEN '2019-01-01' AND '2019-12-31'	student_club
SELECT expense.cost FROM expense JOIN budget ON expense.link_to_budget = budget.budget_id JOIN event ON budget.link_to_event = event.event_id WHERE expense.expense_description = 'Posters' AND event.event_name = 'September Speaker'	student_club
SELECT t_shirt_size FROM member GROUP BY t_shirt_size ORDER BY COUNT(t_shirt_size) DESC LIMIT 1	student_club
SELECT e.event_name  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  WHERE b.event_status = 'Closed' AND b.remaining < 0  ORDER BY b.remaining ASC  LIMIT 1;	student_club
SELECT SUM(e.cost) AS total_value, ev.type  FROM event ev  JOIN budget b ON ev.event_id = b.link_to_event  JOIN expense e ON b.budget_id = e.link_to_budget  WHERE ev.event_name = 'October Meeting'  GROUP BY ev.type;	student_club
SELECT category, SUM(amount) AS total_budgeted FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event_name = 'April Speaker' GROUP BY category ORDER BY total_budgeted ASC;	student_club
SELECT * FROM budget WHERE category = 'Food' AND amount = (SELECT MAX(amount) FROM budget WHERE category = 'Food')	student_club
SELECT budget_id, category, amount  FROM budget  WHERE category = 'Advertisement'  ORDER BY amount DESC  LIMIT 3	student_club
SELECT SUM(cost) FROM expense WHERE expense_description = 'Parking'	student_club
SELECT SUM(cost) FROM expense WHERE expense_date = '2019-08-20'	student_club
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_cost FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE e.link_to_member = 'rec4BLdZHS2Blfp4v' GROUP BY m.first_name, m.last_name;	student_club
SELECT expense_description FROM expense JOIN member ON expense.link_to_member = member.member_id WHERE member.first_name = 'Sacha' AND member.last_name = 'Harrison'	student_club
SELECT expense_description FROM expense WHERE link_to_member IN (SELECT member_id FROM member WHERE t_shirt_size = 'X-Large')	student_club
SELECT m.zip  FROM member m  JOIN expense e ON m.member_id = e.link_to_member  WHERE e.cost < 50;	student_club
SELECT T1.major_name FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Phillip' AND T2.last_name = 'Cullen'	student_club
SELECT position FROM member WHERE link_to_major IN (SELECT major_id FROM major WHERE major_name = 'Business')	student_club
SELECT COUNT(*)  FROM `member` m  JOIN `major` mj ON m.link_to_major = mj.major_id  WHERE mj.major_name = 'Business' AND m.t_shirt_size = 'Medium'	student_club
SELECT DISTINCT e.type  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  WHERE b.remaining > 30;	student_club
SELECT DISTINCT b.category FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.location = 'MU 215'	student_club
SELECT b.category FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_date = '2020-03-24T12:00:00'	student_club
SELECT m.major_name FROM major m JOIN member mb ON m.major_id = mb.link_to_major WHERE mb.position = 'Vice President'	student_club
SELECT (SUM(CASE WHEN position = 'Member' AND link_to_major IN (SELECT major_id FROM major WHERE major_name = 'Business') THEN 1 ELSE 0 END) / COUNT(member_id)) * 100 FROM member	student_club
SELECT DISTINCT b.category  FROM budget b  JOIN event e ON b.link_to_event = e.event_id  WHERE e.location = 'MU 215'	student_club
SELECT COUNT(*) FROM `income` WHERE `amount` = 50	student_club
SELECT COUNT(*) FROM `member` WHERE `position` = 'Member' AND `t_shirt_size` = 'X-Large'	student_club
SELECT COUNT(major_id) FROM major WHERE college = 'College of Agriculture and Applied Sciences' AND department = 'School of Applied Sciences, Technology and Education'	student_club
SELECT m.last_name, maj.department, maj.college  FROM member m  JOIN major maj ON m.link_to_major = maj.major_id  WHERE maj.major_name = 'Environmental Engineering'  AND m.position = 'Member';	student_club
SELECT b.category FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.location = 'MU 215' AND e.type = 'Guest Speaker' AND b.spent = 0.0	student_club
SELECT z.city, z.state  FROM member m  JOIN major mj ON m.link_to_major = mj.major_id  JOIN zip_code z ON m.zip = z.zip_code  WHERE mj.department = 'Electrical and Computer Engineering Department' AND m.position = 'Member'	student_club
SELECT E.event_name FROM event E JOIN attendance A ON E.event_id = A.link_to_event JOIN member M ON A.link_to_member = M.member_id WHERE E.type = 'Social' AND M.position = 'Vice President' AND E.location = '900 E. Washington St.'	student_club
SELECT m.last_name, m.position FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.expense_description = 'Pizza' AND e.expense_date = '2019-09-10'	student_club
SELECT m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer' AND m.position = 'Member'	student_club
SELECT (COUNT(i.income_id) / (SELECT COUNT(*) FROM member WHERE t_shirt_size = 'Medium' AND position = 'Member')) * 100 AS percentage FROM income i JOIN member m ON i.link_to_member = m.member_id WHERE m.t_shirt_size = 'Medium' AND m.position = 'Member' AND i.amount = 50;	student_club
SELECT county FROM zip_code WHERE type = 'PO Box'	student_club
SELECT zip_code FROM zip_code WHERE type = 'PO Box' AND county = 'San Juan Municipio' AND state = 'Puerto Rico'	student_club
SELECT event_name FROM event WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20'	student_club
SELECT DISTINCT a.link_to_event  FROM attendance a  JOIN expense e ON a.link_to_member = e.link_to_member  WHERE e.cost > 50;	student_club
SELECT m.member_id, a.link_to_event  FROM member m  JOIN expense e ON m.member_id = e.link_to_member  JOIN attendance a ON m.member_id = a.link_to_member  WHERE e.approved = 'true' AND e.expense_date BETWEEN '2019-01-10' AND '2019-11-19'	student_club
SELECT m.college FROM major m JOIN member mb ON m.major_id = mb.link_to_major WHERE mb.first_name = 'Katy' AND mb.link_to_major = 'rec1N0upiVLy5esTO'	student_club
SELECT m.phone FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.college = 'College of Agriculture and Applied Sciences' AND ma.major_name = 'Business'	student_club
SELECT m.email  FROM expense e  JOIN member m ON e.link_to_member = m.member_id  WHERE e.expense_date BETWEEN '2019-09-10' AND '2019-11-19'  AND e.cost > 20;	student_club
SELECT COUNT(*)  FROM `member` m  JOIN `major` maj ON m.link_to_major = maj.major_id  WHERE maj.major_name = 'education' AND m.position = 'Member';	student_club
SELECT CAST(SUM(CASE WHEN remaining < 0 THEN 1 ELSE 0 END) AS REAL) / COUNT(budget_id) * 100 FROM budget	student_club
SELECT event_id, location, status FROM event WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31'	student_club
SELECT expense_description FROM expense GROUP BY expense_description HAVING AVG(cost) > 50	student_club
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large'	student_club
SELECT (SUM(type = 'PO Box') / COUNT(zip_code)) * 100 AS percentage FROM zip_code	student_club
SELECT e.event_name, e.location  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  WHERE b.remaining > 0;	student_club
SELECT e.event_name, e.event_date  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  JOIN expense ex ON b.budget_id = ex.link_to_budget  WHERE ex.expense_description = 'Pizza' AND ex.cost > 50 AND ex.cost < 100;	student_club
SELECT m.first_name, m.last_name, maj.major_name  FROM member m  JOIN expense e ON m.member_id = e.link_to_member  JOIN major maj ON m.link_to_major = maj.major_id  WHERE e.cost > 100;	student_club
SELECT z.city, z.county  FROM member m  JOIN income i ON m.member_id = i.link_to_member  JOIN zip_code z ON m.zip = z.zip_code  GROUP BY z.city, z.county  HAVING COUNT(i.amount) > 40;	student_club
SELECT m.member_id, SUM(e.cost) AS total_cost FROM member m JOIN expense e ON m.member_id = e.link_to_member JOIN budget b ON e.link_to_budget = b.budget_id GROUP BY m.member_id HAVING COUNT(DISTINCT b.link_to_event) > 1 ORDER BY total_cost DESC LIMIT 1;	student_club
SELECT AVG(cost) FROM expense WHERE link_to_member IN (SELECT member_id FROM member WHERE position != 'Member')	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event JOIN expense ex ON b.budget_id = ex.link_to_budget WHERE b.category = 'Parking' AND ex.cost < (SELECT SUM(ex2.cost) / COUNT(DISTINCT e2.event_id) FROM event e2 JOIN budget b2 ON e2.event_id = b2.link_to_event JOIN expense ex2 ON b2.budget_id = ex2.link_to_budget WHERE b2.category = 'Parking')	student_club
SELECT (SUM(e.cost) / COUNT(DISTINCT b.link_to_event)) * 100 AS percentage_cost FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.type = 'Meeting'	student_club
SELECT `link_to_budget` FROM `expense` WHERE `expense_description` = 'Water, Cookies' ORDER BY `cost` DESC LIMIT 1	student_club
SELECT m.first_name, m.last_name  FROM member m  JOIN expense e ON m.member_id = e.link_to_member  JOIN budget b ON e.link_to_budget = b.budget_id  GROUP BY m.member_id  ORDER BY SUM(b.spent) DESC  LIMIT 5	student_club
SELECT m.first_name, m.last_name, m.phone  FROM member m  JOIN expense e ON m.member_id = e.link_to_member  WHERE e.cost > (SELECT AVG(cost) FROM expense)  GROUP BY m.member_id;	student_club
SELECT (SUM(CASE WHEN z.state = 'New Jersey' THEN 1 ELSE 0 END) - SUM(CASE WHEN z.state = 'Vermont' THEN 1 ELSE 0 END)) / COUNT(m.position = 'Member') AS difference_percentage FROM member m JOIN zip_code z ON m.zip = z.zip_code;	student_club
SELECT m.major_name, m.department  FROM member AS mem  JOIN major AS m ON mem.link_to_major = m.major_id  WHERE mem.last_name = 'Gerke' AND mem.first_name = 'Garrett'	student_club
SELECT m.first_name, m.last_name, e.cost  FROM member m  JOIN expense e ON m.member_id = e.link_to_member  WHERE e.expense_description = 'Water, Veggie tray, supplies'	student_club
SELECT m.last_name, m.phone  FROM member m  JOIN major ma ON m.link_to_major = ma.major_id  WHERE ma.major_name = 'Elementary Education'	student_club
SELECT b.category, b.amount  FROM budget b  JOIN event e ON b.link_to_event = e.event_id  WHERE e.event_name = 'Officers meeting - January' AND b.category = 'Speaker Gifts'	student_club
SELECT e.event_name  FROM event e  JOIN budget b  ON e.event_id = b.link_to_event  WHERE b.category = 'Food'	student_club
SELECT m.first_name, m.last_name, i.amount  FROM member m  JOIN income i ON m.member_id = i.link_to_member  WHERE i.date_received = '2019-09-09'	student_club
SELECT b.category  FROM budget b  JOIN expense e ON b.budget_id = e.link_to_budget  WHERE e.expense_description = 'Posters'	student_club
SELECT m.first_name, m.last_name, maj.college  FROM member m  JOIN major maj ON m.link_to_major = maj.major_id  WHERE m.position = 'Secretary'	student_club
SELECT SUM(b.spent) AS total_spent, e.event_name  FROM budget b  JOIN event e ON b.link_to_event = e.event_id  WHERE b.category = 'Speaker Gifts'  GROUP BY e.event_name	student_club
SELECT T1.city FROM zip_code AS T1 JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T2.first_name = 'Garrett' AND T2.last_name = 'Gerke'	student_club
SELECT m.first_name, m.last_name, m.position  FROM member m  JOIN zip_code z ON m.zip = z.zip_code  WHERE z.city = 'Lincolnton' AND z.state = 'North Carolina' AND z.zip_code = 28092;	student_club
SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Premium'	debit_card_specializing
SELECT CAST(COUNT(CASE WHEN Currency = 'EUR' THEN 1 END) AS REAL) / COUNT(CASE WHEN Currency = 'CZK' THEN 1 END) FROM customers	debit_card_specializing
SELECT c.CustomerID, MIN(y.Consumption) AS MinConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'LAM' AND y.CustomerID BETWEEN 201201 AND 201212 GROUP BY c.CustomerID ORDER BY MinConsumption ASC LIMIT 1;	debit_card_specializing
SELECT AVG(Consumption) / 12 AS Average_Monthly_Consumption FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE customers.Segment = 'SME' AND yearmonth.Date BETWEEN '201301' AND '201312'	debit_card_specializing
SELECT c.CustomerID FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Currency = 'CZK' AND ym.Date BETWEEN '201101' AND '201112' GROUP BY c.CustomerID ORDER BY SUM(ym.Consumption) DESC LIMIT 1;	debit_card_specializing
SELECT COUNT(DISTINCT c.CustomerID)  FROM customers c  JOIN yearmonth ym ON c.CustomerID = ym.CustomerID  WHERE c.Segment = 'KAM' AND ym.Date BETWEEN '201201' AND '201212' AND ym.Consumption < 30000;	debit_card_specializing
SELECT SUM(CASE WHEN c.Currency = 'CZK' THEN y.Consumption ELSE 0 END) - SUM(CASE WHEN c.Currency = 'EUR' THEN y.Consumption ELSE 0 END) AS ConsumptionDifference FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE SUBSTR(y.Date, 1, 4) = '2012'	debit_card_specializing
SELECT SUBSTR(y.Date, 1, 4) AS Year, SUM(y.Consumption) AS TotalConsumption FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Currency = 'EUR' GROUP BY Year ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT c.Segment, SUM(y.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID GROUP BY c.Segment ORDER BY TotalConsumption ASC LIMIT 1;	debit_card_specializing
SELECT SUBSTR(Date, 1, 4) AS Year, SUM(Consumption) AS TotalConsumption FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'CZK') GROUP BY Year ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT y.Date, MAX(y.Consumption)  FROM yearmonth y  JOIN customers c ON y.CustomerID = c.CustomerID  WHERE c.Segment = 'SME' AND y.Date BETWEEN '201301' AND '201312'  GROUP BY y.Date  ORDER BY y.Consumption DESC  LIMIT 1;	debit_card_specializing
SELECT      (SUM(CASE WHEN c.Segment = 'SME' THEN y.Consumption ELSE 0 END) / COUNT(DISTINCT CASE WHEN c.Segment = 'SME' THEN y.CustomerID END)) -      (SUM(CASE WHEN c.Segment = 'LAM' THEN y.Consumption ELSE 0 END) / COUNT(DISTINCT CASE WHEN c.Segment = 'LAM' THEN y.CustomerID END)) AS SME_LAM_Diff,     (SUM(CASE WHEN c.Segment = 'LAM' THEN y.Consumption ELSE 0 END) / COUNT(DISTINCT CASE WHEN c.Segment = 'LAM' THEN y.CustomerID END)) -      (SUM(CASE WHEN c.Segment = 'KAM' THEN y.Consumption ELSE 0 END) / COUNT(DISTINCT CASE WHEN c.Segment = 'KAM' THEN y.CustomerID END)) AS LAM_KAM_Diff,     (SUM(CASE WHEN c.Segment = 'KAM' THEN y.Consumption ELSE 0 END) / COUNT(DISTINCT CASE WHEN c.Segment = 'KAM' THEN y.CustomerID END)) -      (SUM(CASE WHEN c.Segment = 'SME' THEN y.Consumption ELSE 0 END) / COUNT(DISTINCT CASE WHEN c.Segment = 'SME' THEN y.CustomerID END)) AS KAM_SME_Diff FROM      yearmonth y JOIN      customers c ON y.CustomerID = c.CustomerID WHERE      SUBSTR(y.Date, 1, 4) = '2013' AND c.Currency = 'CZK'	debit_card_specializing
SELECT      c.Segment,      (SUM(CASE WHEN y.Date LIKE '2013%' THEN y.Consumption ELSE 0 END) - SUM(CASE WHEN y.Date LIKE '2012%' THEN y.Consumption ELSE 0 END)) / SUM(CASE WHEN y.Date LIKE '2013%' THEN y.Consumption ELSE 0 END) * 100 AS PercentageChange FROM      customers c JOIN      yearmonth y ON c.CustomerID = y.CustomerID GROUP BY      c.Segment ORDER BY      PercentageChange DESC LIMIT 1  UNION ALL  SELECT      c.Segment,      (SUM(CASE WHEN y.Date LIKE '2013%' THEN y.Consumption ELSE 0 END) - SUM(CASE WHEN y.Date LIKE '2012%' THEN y.Consumption ELSE 0 END)) / SUM(CASE WHEN y.Date LIKE '2013%' THEN y.Consumption ELSE 0 END) * 100 AS PercentageChange FROM      customers c JOIN      yearmonth y ON c.CustomerID = y.CustomerID GROUP BY      c.Segment ORDER BY      PercentageChange ASC LIMIT 1	debit_card_specializing
SELECT SUM(Consumption) FROM yearmonth WHERE CustomerID = 6 AND Date BETWEEN '201308' AND '201311'	debit_card_specializing
SELECT SUM(CASE WHEN Country = 'CZE' AND Segment = 'Value for money' THEN 1 ELSE 0 END) - SUM(CASE WHEN Country = 'SVK' AND Segment = 'Value for money' THEN 1 ELSE 0 END) AS discount_difference FROM gasstations	debit_card_specializing
SELECT (t2.Consumption - t1.Consumption) AS Difference  FROM yearmonth t1  JOIN yearmonth t2 ON t1.Date = t2.Date  WHERE t1.CustomerID = 5 AND t2.CustomerID = 7 AND t1.Date = '201304'	debit_card_specializing
SELECT      (SUM(CASE WHEN Currency = 'CZK' THEN 1 ELSE 0 END) - SUM(CASE WHEN Currency = 'EUR' THEN 1 ELSE 0 END)) AS Amount_of_more_SMEs FROM      customers WHERE      Segment = 'SME'	debit_card_specializing
SELECT c.CustomerID, c.Segment, c.Currency, y.Consumption  FROM customers c  JOIN yearmonth y ON c.CustomerID = y.CustomerID  WHERE c.Segment = 'LAM' AND c.Currency = 'EUR' AND y.Date = '201310'  ORDER BY y.Consumption DESC  LIMIT 1;	debit_card_specializing
SELECT c.CustomerID, y.Consumption  FROM customers c  JOIN yearmonth y ON c.CustomerID = y.CustomerID  WHERE c.Segment = 'KAM'  ORDER BY y.Consumption DESC  LIMIT 1;	debit_card_specializing
SELECT SUM(ym.Consumption)  FROM yearmonth ym  JOIN customers c ON ym.CustomerID = c.CustomerID  WHERE c.Segment = 'KAM' AND ym.Date = '201305';	debit_card_specializing
SELECT CAST(COUNT(CASE WHEN y.Consumption > 46.73 THEN c.CustomerID END) AS REAL) * 100 / COUNT(c.CustomerID)  FROM customers c  JOIN yearmonth y ON c.CustomerID = y.CustomerID  WHERE c.Segment = 'LAM'	debit_card_specializing
SELECT Country, COUNT(*) AS Total FROM gasstations WHERE Segment = 'Value for money' GROUP BY Country ORDER BY Total DESC LIMIT 1;	debit_card_specializing
SELECT (COUNT(CASE WHEN Segment = 'KAM' THEN 1 END) / CAST(COUNT(CASE WHEN Segment = 'KAM' THEN 1 END) AS FLOAT)) * 100 AS Percentage FROM customers WHERE Currency = 'EUR' AND Segment = 'KAM'	debit_card_specializing
SELECT CAST(SUM(CASE WHEN Consumption > 528.3 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM yearmonth WHERE Date = '201202'	debit_card_specializing
SELECT (CAST(COUNT(CASE WHEN Segment = 'Premium' THEN 1 END) AS FLOAT) / COUNT(*)) * 100 AS PremiumPercentage FROM gasstations WHERE Country = 'SVK'	debit_card_specializing
SELECT CustomerID FROM yearmonth WHERE Date = '201309' ORDER BY Consumption DESC LIMIT 1	debit_card_specializing
SELECT c.Segment FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE y.Date = '201309' GROUP BY c.Segment ORDER BY SUM(y.Consumption) ASC LIMIT 1	debit_card_specializing
SELECT c.CustomerID  FROM customers c  JOIN yearmonth ym ON c.CustomerID = ym.CustomerID  WHERE c.Segment = 'SME' AND ym.Date = '201206'  ORDER BY ym.Consumption ASC  LIMIT 1;	debit_card_specializing
SELECT MAX(Consumption) FROM yearmonth WHERE Date LIKE '2012%'	debit_card_specializing
SELECT MAX(Consumption / 12) FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE customers.Currency = 'EUR'	debit_card_specializing
SELECT DISTINCT p.Description  FROM products p  JOIN transactions_1k t ON p.ProductID = t.ProductID  WHERE strftime('%Y%m', t.Date) = '201309'	debit_card_specializing
SELECT DISTINCT g.Country  FROM gasstations g  JOIN transactions_1k t ON g.GasStationID = t.GasStationID  WHERE strftime('%Y-%m', t.Date) = '2013-06'	debit_card_specializing
SELECT DISTINCT g.ChainID  FROM gasstations g  JOIN transactions_1k t ON g.GasStationID = t.GasStationID  JOIN customers c ON t.CustomerID = c.CustomerID  WHERE c.Currency = 'EUR'	debit_card_specializing
SELECT DISTINCT p.Description  FROM products p  JOIN transactions_1k t ON p.ProductID = t.ProductID  JOIN customers c ON t.CustomerID = c.CustomerID  WHERE c.Currency = 'EUR'	debit_card_specializing
SELECT AVG(Amount) AS AverageTotalPrice FROM transactions_1k WHERE Date BETWEEN '2012-01-01' AND '2012-01-31'	debit_card_specializing
SELECT COUNT(DISTINCT y.CustomerID)  FROM yearmonth y  JOIN customers c ON y.CustomerID = c.CustomerID  WHERE c.Currency = 'EUR' AND y.Consumption > 1000;	debit_card_specializing
SELECT p.Description  FROM products p  JOIN transactions_1k t ON p.ProductID = t.ProductID  JOIN gasstations g ON t.GasStationID = g.GasStationID  WHERE g.Country = 'CZE'	debit_card_specializing
SELECT DISTINCT T1.Time  FROM transactions_1k AS T1  JOIN gasstations AS T2  ON T1.GasStationID = T2.GasStationID  WHERE T2.ChainID = 11;	debit_card_specializing
SELECT COUNT(*)  FROM `transactions_1k` t JOIN `gasstations` g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE' AND t.Price > 1000;	debit_card_specializing
SELECT COUNT(*)  FROM `transactions_1k` t JOIN `gasstations` g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE' AND t.Date > '2012-01-01'	debit_card_specializing
SELECT AVG(t1.Price) FROM transactions_1k AS t1 JOIN gasstations AS t2 ON t1.GasStationID = t2.GasStationID WHERE t2.Country = 'CZE'	debit_card_specializing
SELECT AVG(t1.Price)  FROM transactions_1k t1 JOIN customers c ON t1.CustomerID = c.CustomerID WHERE c.Currency = 'EUR';	debit_card_specializing
SELECT CustomerID, SUM(Price) AS TotalSpent FROM transactions_1k WHERE Date = '2012-08-25' GROUP BY CustomerID ORDER BY TotalSpent DESC LIMIT 1;	debit_card_specializing
SELECT g.Country  FROM gasstations g  JOIN transactions_1k t ON g.GasStationID = t.GasStationID  WHERE t.Date = '2012-08-25'  ORDER BY t.Time ASC  LIMIT 1;	debit_card_specializing
SELECT c.Currency  FROM customers c  JOIN transactions_1k t  ON c.CustomerID = t.CustomerID  WHERE t.Date = '2012-08-24' AND t.Time = '16:25:00'	debit_card_specializing
SELECT Segment FROM customers WHERE CustomerID IN (SELECT CustomerID FROM transactions_1k WHERE CustomerID = (SELECT CustomerID FROM customers WHERE Segment IS NOT NULL LIMIT 1)) LIMIT 1	debit_card_specializing
SELECT COUNT(*)  FROM `transactions_1k`  WHERE `Date` = '2012-08-26' AND `Time` < '13:00:00' AND `CustomerID` IN (SELECT `CustomerID` FROM `customers` WHERE `Currency` = 'CZK')	debit_card_specializing
SELECT Segment FROM customers WHERE CustomerID = (SELECT MIN(CustomerID) FROM customers)	debit_card_specializing
SELECT T2.Country FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-24' AND T1.Time = '12:42:00'	debit_card_specializing
SELECT ProductID FROM transactions_1k WHERE Date = '2012-08-23' AND Time = '21:20:00'	debit_card_specializing
SELECT y.Date, y.Consumption  FROM yearmonth y JOIN transactions_1k t ON y.CustomerID = t.CustomerID WHERE t.Date = '2012-08-24' AND t.Price = 124.05 AND y.Date = '201201'	debit_card_specializing
SELECT COUNT(*)  FROM `transactions_1k` t JOIN `gasstations` g ON t.GasStationID = g.GasStationID WHERE t.Date = '2012-08-26' AND t.Time BETWEEN '08:00:00' AND '09:00:00' AND g.Country = 'CZE'	debit_card_specializing
SELECT c.Currency  FROM customers c  JOIN yearmonth ym ON c.CustomerID = ym.CustomerID  WHERE ym.Date = '201306' AND ym.Consumption = 214582.17;	debit_card_specializing
SELECT T1.Country FROM gasstations AS T1 JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.CardID = 667467	debit_card_specializing
SELECT gs.Country  FROM gasstations gs  JOIN transactions_1k t  ON gs.GasStationID = t.GasStationID  WHERE t.Date = '2012-08-24' AND t.Price = 548.4;	debit_card_specializing
SELECT CAST(COUNT(DISTINCT CASE WHEN c.Currency = 'EUR' THEN t.CustomerID END) AS REAL) * 100 / COUNT(DISTINCT t.CustomerID)  FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE t.Date = '2012-08-25'	debit_card_specializing
SELECT (y2012.Consumption - y2013.Consumption) / y2012.Consumption AS DecreaseRate FROM (     SELECT CustomerID, SUM(Consumption) AS Consumption     FROM yearmonth     WHERE Date LIKE '2012%'     GROUP BY CustomerID ) y2012 JOIN (     SELECT CustomerID, SUM(Consumption) AS Consumption     FROM yearmonth     WHERE Date LIKE '2013%'     GROUP BY CustomerID ) y2013 ON y2012.CustomerID = y2013.CustomerID JOIN transactions_1k t ON y2012.CustomerID = t.CustomerID WHERE t.Date = '2012-08-25' AND t.Price = 634.8;	debit_card_specializing
SELECT GasStationID, SUM(Price) AS TotalRevenue  FROM transactions_1k  GROUP BY GasStationID  ORDER BY TotalRevenue DESC  LIMIT 1;	debit_card_specializing
SELECT      CAST(SUM(CASE WHEN T2.Segment = 'Premium' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM      gasstations AS T2  WHERE      T2.Country = 'SVK'	debit_card_specializing
SELECT SUM(Price) AS TotalSpent FROM transactions_1k WHERE CustomerID = 38508;  SELECT SUM(Price) AS TotalSpent_Jan2012 FROM transactions_1k WHERE CustomerID = 38508 AND Date = '2012-01-01';	debit_card_specializing
SELECT p.Description, SUM(t.Amount) as Total_Sales FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID GROUP BY p.ProductID, p.Description ORDER BY Total_Sales DESC LIMIT 5;	debit_card_specializing
SELECT c.CustomerID, AVG(t.Price / t.Amount) AS AveragePricePerItem, c.Currency FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE c.CustomerID = (     SELECT CustomerID     FROM transactions_1k     GROUP BY CustomerID     ORDER BY SUM(Amount) DESC     LIMIT 1 ) GROUP BY c.CustomerID, c.Currency;	debit_card_specializing
SELECT g.Country  FROM gasstations g  JOIN transactions_1k t ON g.GasStationID = t.GasStationID  WHERE t.ProductID = 2  ORDER BY t.Price DESC  LIMIT 1;	debit_card_specializing
SELECT y.Consumption  FROM transactions_1k t  JOIN yearmonth y ON t.CustomerID = y.CustomerID  WHERE t.ProductID = 5 AND (t.Price / t.Amount) > 29 AND y.Date = '201208'	debit_card_specializing
