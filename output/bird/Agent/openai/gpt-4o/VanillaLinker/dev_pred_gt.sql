SELECT MAX("Free Meal Count (K-12)" / "Enrollment (K-12)") AS HighestEligibleFreeRate FROM frpm WHERE "County Name" = 'Alameda' AND "Enrollment (K-12)" > 0;	california_schools
SELECT f.`School Name`, f.`Percent (%) Eligible Free (Ages 5-17)`  FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.SOCType = 'Continuation' AND f.`Enrollment (Ages 5-17)` > 0 ORDER BY f.`Percent (%) Eligible Free (Ages 5-17)` ASC LIMIT 3;	california_schools
SELECT DISTINCT s.Zip FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.County = 'Fresno' AND s.DOC = 'Fresno County Office of Education' AND f.`Charter School (Y/N)` = 1;	california_schools
SELECT s.MailStreet  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE f.`FRPM Count (K-12)` = (     SELECT MAX(`FRPM Count (K-12)`)      FROM frpm );	california_schools
SELECT s.Phone  FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.`Charter School (Y/N)` = 1 AND s.FundingType = 'Direct Charter' AND s.OpenDate > '2000-01-01';	california_schools
SELECT COUNT(*) FROM satscores s JOIN schools sc ON s.cds = sc.CDSCode WHERE s.AvgScrMath > 400 AND sc.Virtual = 'F';	california_schools
SELECT s.School, s.District, s.County FROM satscores AS sat JOIN schools AS s ON sat.cds = s.CDSCode WHERE sat.NumTstTakr > 500 AND s.Magnet = 1;	california_schools
SELECT s.Phone  FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.NumGE1500 = (SELECT MAX(NumGE1500) FROM satscores);	california_schools
SELECT SUM(satscores.NumTstTakr) AS TotalTestTakers FROM satscores JOIN frpm ON satscores.cds = frpm.CDSCode WHERE frpm.`FRPM Count (K-12)` = (     SELECT MAX(`FRPM Count (K-12)`)     FROM frpm );	california_schools
SELECT COUNT(*) AS charter_funded_schools_count FROM satscores s JOIN schools sc ON s.cds = sc.CDSCode WHERE s.AvgScrMath > 560 AND sc.FundingType = 'Directly funded';	california_schools
SELECT frpm.`FRPM Count (Ages 5-17)` FROM satscores AS sat JOIN frpm ON sat.cds = frpm.CDSCode WHERE sat.AvgScrRead = (     SELECT MAX(AvgScrRead)     FROM satscores );	california_schools
SELECT CDSCode  FROM frpm  WHERE (`Enrollment (K-12)` + `Enrollment (Ages 5-17)`) > 500;	california_schools
SELECT MAX(f.`Free Meal Count (Ages 5-17)` / f.`Enrollment (Ages 5-17)`) AS HighestEligibleFreeRate FROM satscores s JOIN frpm f ON s.cds = f.CDSCode WHERE (s.NumGE1500 / s.NumTstTakr) > 0.3;	california_schools
SELECT s.Phone  FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds ORDER BY (ss.NumGE1500 * 1.0 / ss.NumTstTakr) DESC LIMIT 3;	california_schools
SELECT s.NCESSchool, f.`School Name`, f.`Enrollment (Ages 5-17)` FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode ORDER BY f.`Enrollment (Ages 5-17)` DESC LIMIT 5;	california_schools
SELECT s.District, AVG(ss.AvgScrRead) AS AvgReadingScore FROM satscores ss JOIN schools s ON ss.cds = s.CDSCode WHERE s.StatusType = 'Active' AND ss.AvgScrRead IS NOT NULL GROUP BY s.District ORDER BY AvgReadingScore DESC LIMIT 1;	california_schools
SELECT COUNT(*) FROM satscores AS s JOIN schools AS sc ON s.cds = sc.CDSCode WHERE sc.County = 'Alameda' AND s.NumTstTakr < 100;	california_schools
SELECT schools.School, schools.CharterNum, satscores.AvgScrWrite FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE satscores.AvgScrWrite > 499 AND schools.CharterNum IS NOT NULL ORDER BY satscores.AvgScrWrite DESC;	california_schools
SELECT COUNT(*) FROM satscores AS s JOIN schools AS sc ON s.cds = sc.CDSCode WHERE sc.County = 'Fresno' AND sc.FundingType = 'Directly Funded' AND s.NumTstTakr <= 250;	california_schools
SELECT s.Phone  FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds WHERE sat.AvgScrMath = (SELECT MAX(AvgScrMath) FROM satscores);	california_schools
SELECT COUNT(*)  FROM frpm  WHERE `County Name` = 'Amador' AND `Low Grade` = '9' AND `High Grade` = '12';	california_schools
SELECT COUNT(*)  FROM frpm  JOIN schools ON frpm.CDSCode = schools.CDSCode  WHERE schools.County = 'Los Angeles'  AND frpm.`Free Meal Count (K-12)` > 500  AND frpm.`FRPM Count (K-12)` < 700;	california_schools
SELECT s.School, sat.NumTstTakr FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds WHERE s.County = 'Contra Costa' ORDER BY sat.NumTstTakr DESC LIMIT 1;	california_schools
SELECT s.School, s.Street, s.City, s.Zip, s.State FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE ABS(f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`) > 30;	california_schools
SELECT s.School  FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode JOIN satscores sat ON s.CDSCode = sat.cds WHERE (f.[Free Meal Count (K-12)] / f.[Enrollment (K-12)]) > 0.1  AND sat.NumGE1500 >= 1;	california_schools
SELECT s.School, s.FundingType FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds WHERE s.County = 'Riverside' AND sat.AvgScrMath > 400;	california_schools
SELECT s.School AS School_Name, s.Street AS Street_Address, s.City, s.State, s.Zip  FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.County = 'Monterey'    AND f.`Low Grade` >= '9'   AND f.`High Grade` = '12'   AND f.`FRPM Count (Ages 5-17)` > 800;	california_schools
SELECT s.School AS School_Name, sat.AvgScrWrite AS Writing_Average_Score, s.Phone AS Communication_Number FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds WHERE (s.OpenDate > '1991-12-31' OR s.ClosedDate < '2000-01-01') AND sat.AvgScrWrite IS NOT NULL;	california_schools
WITH EnrollmentDifference AS (     SELECT          s.School AS SchoolName,         s.DOCType,         (f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`) AS Difference     FROM schools s     JOIN frpm f ON s.CDSCode = f.CDSCode     WHERE s.FundingType = 'Local' ), AverageDifference AS (     SELECT          AVG(Difference) AS AvgDifference     FROM EnrollmentDifference ) SELECT      SchoolName,     DOCType FROM EnrollmentDifference WHERE Difference > (SELECT AvgDifference FROM AverageDifference);	california_schools
SELECT s.OpenDate  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE f.`Enrollment (K-12)` = (SELECT MAX(`Enrollment (K-12)`) FROM frpm)  LIMIT 1;	california_schools
SELECT s.City, SUM(f.`Enrollment (K-12)`) AS TotalEnrollment FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode GROUP BY s.City ORDER BY TotalEnrollment ASC LIMIT 5;	california_schools
SELECT `School Name`,         `Free Meal Count (K-12)` / `Enrollment (K-12)` AS Eligible_Free_Rate FROM frpm WHERE `Enrollment (K-12)` IS NOT NULL ORDER BY `Enrollment (K-12)` DESC LIMIT 2 OFFSET 9;	california_schools
SELECT s.School, (f.`FRPM Count (K-12)` / f.`Enrollment (K-12)`) AS EligibleRate FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.DOC = '66' ORDER BY f.`FRPM Count (K-12)` DESC LIMIT 5;	california_schools
SELECT s.School AS SchoolName, s.Website FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.`Free Meal Count (Ages 5-17)` BETWEEN 1900 AND 2000;	california_schools
SELECT (f.`Free Meal Count (Ages 5-17)` / f.`Enrollment (Ages 5-17)`) AS `Free Rate Ages 5-17` FROM `frpm` AS f JOIN `schools` AS s ON f.`CDSCode` = s.`CDSCode` WHERE s.`AdmFName1` = 'Kacey' AND s.`AdmLName1` = 'Gibson';	california_schools
SELECT s.AdmEmail1  FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.`Charter School (Y/N)` = 1 ORDER BY f.`Enrollment (K-12)` ASC LIMIT 1;	california_schools
SELECT s.AdmFName1 || ' ' || s.AdmLName1 AS Admin1_FullName,        s.AdmFName2 || ' ' || s.AdmLName2 AS Admin2_FullName,        s.AdmFName3 || ' ' || s.AdmLName3 AS Admin3_FullName FROM schools AS s JOIN satscores AS sat ON s.CDSCode = sat.cds WHERE sat.NumGE1500 = (SELECT MAX(NumGE1500) FROM satscores);	california_schools
SELECT s.Street, s.City, s.Zip, s.State FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE (ss.NumGE1500 * 1.0 / ss.NumTstTakr) = (     SELECT MIN(ss1.NumGE1500 * 1.0 / ss1.NumTstTakr)     FROM satscores ss1     WHERE ss1.NumTstTakr > 0 );	california_schools
SELECT s.Website  FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.County = 'Los Angeles' AND ss.NumTstTakr BETWEEN 2000 AND 3000;	california_schools
SELECT AVG(satscores.NumTstTakr) AS AverageTestTakers FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.County = 'Fresno' AND STRFTIME('%Y', schools.OpenDate) = '1980';	california_schools
SELECT schools.Phone  FROM satscores  JOIN schools ON satscores.cds = schools.CDSCode  WHERE satscores.dname = 'Fresno Unified'  ORDER BY satscores.AvgScrRead ASC  LIMIT 1;	california_schools
WITH RankedSchools AS (     SELECT          s.School AS SchoolName,         s.County,         sat.AvgScrRead,         RANK() OVER (PARTITION BY s.County ORDER BY sat.AvgScrRead DESC) AS RankInCounty     FROM schools s     JOIN satscores sat ON s.CDSCode = sat.cds     WHERE s.Virtual = 'F' ) SELECT SchoolName, County, AvgScrRead FROM RankedSchools WHERE RankInCounty <= 5;	california_schools
SELECT sc.`Educational Option Type` FROM satscores ss JOIN schools s ON ss.cds = s.CDSCode JOIN frpm sc ON s.CDSCode = sc.CDSCode WHERE ss.AvgScrMath = (SELECT MAX(AvgScrMath) FROM satscores);	california_schools
SELECT AvgScrMath, cname  FROM satscores  WHERE cds = (     SELECT cds      FROM satscores      WHERE (AvgScrMath + AvgScrRead + AvgScrWrite) = (         SELECT MIN(AvgScrMath + AvgScrRead + AvgScrWrite)          FROM satscores     ) );	california_schools
SELECT s.City, sa.AvgScrWrite  FROM satscores AS sa  JOIN schools AS s ON sa.cds = s.CDSCode  WHERE sa.NumTstTakr = (     SELECT MAX(NumTstTakr)      FROM satscores      WHERE NumGE1500 > 0 )  AND sa.NumGE1500 > 0;	california_schools
SELECT s.School, sa.AvgScrWrite FROM schools s JOIN satscores sa ON s.CDSCode = sa.cds WHERE s.AdmFName1 = 'Ricci' AND s.AdmLName1 = 'Ulrich';	california_schools
SELECT s.School, s.District, s.County, f.`Enrollment (K-12)` FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.DOC = '31' ORDER BY f.`Enrollment (K-12)` DESC LIMIT 1;	california_schools
SELECT COUNT(*) / 12 AS MonthlyAverageSchoolsOpened FROM schools WHERE County = 'Alameda'    AND DOC = '52'    AND strftime('%Y', OpenDate) = '1980';	california_schools
SELECT      (SELECT COUNT(*)       FROM schools       WHERE DOC = 54 AND County = 'Orange' AND StatusType = 'Merged')      /      (SELECT COUNT(*)       FROM schools       WHERE DOC = 52 AND County = 'Orange' AND StatusType = 'Merged') AS Ratio;	california_schools
SELECT County, School, ClosedDate FROM schools WHERE StatusType = 'Closed' AND County = (     SELECT County     FROM schools     WHERE StatusType = 'Closed'     GROUP BY County     ORDER BY COUNT(*) DESC     LIMIT 1 );	california_schools
SELECT schools.School AS SchoolName, schools.Street AS PostalStreetAddress FROM satscores JOIN schools ON satscores.cds = schools.CDSCode ORDER BY satscores.AvgScrMath DESC LIMIT 1 OFFSET 6;	california_schools
SELECT sc.School, sc.MailStreet  FROM schools sc JOIN satscores ss ON sc.CDSCode = ss.cds WHERE ss.AvgScrRead = (SELECT MIN(AvgScrRead) FROM satscores WHERE AvgScrRead IS NOT NULL);	california_schools
SELECT COUNT(schools.CDSCode) AS TotalSchools FROM schools JOIN satscores ON schools.CDSCode = satscores.cds WHERE (satscores.AvgScrRead + satscores.AvgScrMath + satscores.AvgScrWrite) >= 1500 AND schools.MailCity = 'Lakeport';	california_schools
SELECT SUM(satscores.NumTstTakr) AS TotalTestTakers FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.MailCity = 'Fresno';	california_schools
SELECT schools.School, schools.MailZip  FROM schools  WHERE (schools.AdmFName1 = 'Avetik' AND schools.AdmLName1 = 'Atoian')     OR (schools.AdmFName2 = 'Avetik' AND schools.AdmLName2 = 'Atoian')     OR (schools.AdmFName3 = 'Avetik' AND schools.AdmLName3 = 'Atoian');	california_schools
SELECT      (SELECT COUNT(*) FROM schools WHERE MailState = 'CA' AND County = 'Colusa') /      (SELECT COUNT(*) FROM schools WHERE MailState = 'CA' AND County = 'Humboldt') AS ratio;	california_schools
SELECT COUNT(*) AS ActiveSchoolsCount FROM schools WHERE MailState = 'California' AND StatusType = 'Active' AND City = 'San Joaquin';	california_schools
SELECT s.Phone, s.Ext FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds ORDER BY ss.AvgScrWrite DESC LIMIT 1 OFFSET 332;	california_schools
SELECT School, Phone, Ext  FROM schools  WHERE Zip = '95203-3704';	california_schools
SELECT Website  FROM schools  WHERE (AdmFName1 = 'Mike' AND AdmLName1 = 'Larson')     OR (AdmFName1 = 'Dante' AND AdmLName1 = 'Alvarez')     OR (AdmFName2 = 'Mike' AND AdmLName2 = 'Larson')     OR (AdmFName2 = 'Dante' AND AdmLName2 = 'Alvarez')     OR (AdmFName3 = 'Mike' AND AdmLName3 = 'Larson')     OR (AdmFName3 = 'Dante' AND AdmLName3 = 'Alvarez');	california_schools
SELECT Website  FROM schools  WHERE Virtual = 'P' AND Charter = 1 AND County = 'San Joaquin';	california_schools
SELECT COUNT(*) AS CharterSchoolCount FROM schools WHERE City = 'Hickman' AND DOC = '52' AND Charter = 1;	california_schools
SELECT COUNT(*) FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.County = 'Los Angeles'   AND s.Charter = 0   AND (f.`Free Meal Count (K-12)` * 100 / f.`Enrollment (K-12)`) < 0.18;	california_schools
SELECT s.School AS SchoolName, s.City, s.AdmFName1 || ' ' || s.AdmLName1 AS Admin1Name, s.AdmFName2 || ' ' || s.AdmLName2 AS Admin2Name, s.AdmFName3 || ' ' || s.AdmLName3 AS Admin3Name FROM schools s WHERE s.Charter = 1 AND s.CharterNum = '00D2';	california_schools
SELECT COUNT(*) AS TotalSchools FROM schools WHERE MailCity = 'Hickman' AND CharterNum = '00D4';	california_schools
SELECT      (COUNT(CASE WHEN `Charter Funding Type` = 'Locally Funded' THEN 1 END) * 100.0 / COUNT(CASE WHEN `Charter Funding Type` IS NOT NULL THEN 1 END)) AS Ratio_Percentage FROM frpm WHERE `County Name` = 'Santa Clara';	california_schools
SELECT COUNT(*) AS Directly_Funded_Schools_Opened FROM schools WHERE County = 'Stanislaus'  AND FundingType = 'Directly Funded'  AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31';	california_schools
SELECT COUNT(*) AS TotalClosures FROM schools WHERE DOCType = 'Community College District' AND ClosedDate LIKE '1989%' AND City = 'San Francisco';	california_schools
SELECT County, COUNT(*) AS ClosureCount FROM schools WHERE ClosedDate BETWEEN '1980-01-01' AND '1989-12-31' AND SOC = '11' GROUP BY County ORDER BY ClosureCount DESC LIMIT 1;	california_schools
SELECT NCESDist  FROM schools  WHERE SOC = '31';	california_schools
SELECT      `StatusType`,      COUNT(*) AS `SchoolCount` FROM      `schools` WHERE      `County` = 'Alpine'      AND `DOCType` = 'District Community Day School' GROUP BY      `StatusType`;	california_schools
SELECT DISTINCT `District` FROM schools WHERE `City` = 'Fresno' AND `Magnet` = 0;	california_schools
SELECT SUM(`Enrollment (Ages 5-17)`) AS Total_Enrollment FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE `Academic Year` = '2014-2015'  AND `City` = 'Fremont'  AND `EdOpsCode` = 'SSS';	california_schools
SELECT frpm.`FRPM Count (Ages 5-17)` FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.DOCType = 'Youth Authority School' AND schools.MailStreet = 'PO Box 1040';	california_schools
SELECT s.`Low Grade` FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.NCESDist = '0613360' AND s.EdOpsCode = 'SPECON';	california_schools
SELECT s.School AS School_Name, s.EdOpsName AS Educational_Level_Name FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.`NSLP Provision Status` = 'Provision 2' AND f.`County Code` = '37';	california_schools
SELECT s.City  FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.County = 'Merced'    AND f.`Low Grade` = '9'    AND f.`High Grade` = '12'    AND f.`NSLP Provision Status` = '2'    AND s.EILCode = 'HS';	california_schools
SELECT s.School, (f.`FRPM Count (Ages 5-17)` / f.`Enrollment (Ages 5-17)` * 100) AS `Percent (%) Eligible FRPM (Ages 5-17)` FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.County = 'Los Angeles' AND f.`Low Grade` = 'K' AND f.`High Grade` = '9';	california_schools
SELECT `GSserved`, COUNT(*) AS `Count` FROM `schools` WHERE `City` = 'Adelanto' GROUP BY `GSserved` ORDER BY `Count` DESC LIMIT 1;	california_schools
SELECT County, COUNT(*) AS NumberOfSchools FROM schools WHERE County IN ('San Diego', 'Santa Barbara') AND Virtual = 'F' GROUP BY County ORDER BY NumberOfSchools DESC LIMIT 1;	california_schools
SELECT School, Latitude, SchoolType  FROM schools  WHERE Latitude = (SELECT MAX(Latitude) FROM schools);	california_schools
SELECT School, City, `Low Grade`, Latitude  FROM schools  WHERE State = 'CA'  ORDER BY Latitude ASC  LIMIT 1;	california_schools
SELECT GSoffered  FROM schools  WHERE ABS(Longitude) = (SELECT MAX(ABS(Longitude)) FROM schools);	california_schools
SELECT      s.City,     COUNT(s.CDSCode) AS School_Count FROM      schools s JOIN      frpm f ON s.CDSCode = f.CDSCode WHERE      s.Magnet = 1      AND f.`Low Grade` = 'K'      AND f.`High Grade` = '8'      AND f.`NSLP Provision Status` = 'Multiple Provision Types' GROUP BY      s.City;	california_schools
SELECT AdmFName1 AS FirstName, District, COUNT(*) AS Count FROM schools WHERE AdmFName1 IS NOT NULL GROUP BY AdmFName1, District ORDER BY Count DESC LIMIT 2;	california_schools
SELECT s.`District` AS District_Code, (f.`Free Meal Count (K-12)` / f.`Enrollment (K-12)` * 100) AS Percent_Eligible_Free_K12 FROM schools s JOIN frpm f ON s.`CDSCode` = f.`CDSCode` WHERE s.`AdmFName1` = 'Alusine';	california_schools
SELECT AdmLName1, District, County, School FROM schools WHERE CharterNum = '40';	california_schools
SELECT DISTINCT AdmEmail1, AdmEmail2, AdmEmail3 FROM schools WHERE County = 'San Bernardino'   AND District = 'San Bernardino City Unified'   AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31'   AND (SOC = '62' OR DOC = '54')   AND StatusType = 'Active'   AND SchoolType = 'Public';	california_schools
SELECT s.School, sc.AdmEmail1  FROM satscores AS ss  JOIN schools AS sc ON ss.cds = sc.CDSCode  WHERE ss.NumGE1500 = (SELECT MAX(NumGE1500) FROM satscores);	california_schools
SELECT COUNT(DISTINCT a.account_id) AS account_count FROM account a JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id JOIN district dist ON c.district_id = dist.district_id WHERE a.frequency = 'POPLATEK PO OBRATU' AND dist.A3 = 'East Bohemia';	financial
SELECT COUNT(DISTINCT a.account_id) AS eligible_accounts FROM account AS a JOIN district AS d ON a.district_id = d.district_id JOIN loan AS l ON a.account_id = l.account_id WHERE d.A3 = 'Prague';	financial
SELECT      CASE          WHEN AVG(A12) > AVG(A13) THEN '1995 has higher unemployment rate'         ELSE '1996 has higher unemployment rate'     END AS result FROM district;	financial
SELECT COUNT(*) AS no_of_districts FROM (     SELECT d.district_id, AVG(d.A11) AS avg_salary     FROM district d     JOIN client c ON d.district_id = c.district_id     WHERE c.gender = 'F'     GROUP BY d.district_id     HAVING AVG(d.A11) > 6000 AND AVG(d.A11) < 10000 ) filtered_districts;	financial
SELECT COUNT(DISTINCT client.client_id) AS male_customers_count FROM client JOIN district ON client.district_id = district.district_id WHERE client.gender = 'M' AND district.A3 = 'North Bohemia' AND district.A11 > 8000;	financial
WITH oldest_female AS (     SELECT c.client_id, c.birth_date, c.district_id, d.A11 AS avg_salary     FROM client c     JOIN district d ON c.district_id = d.district_id     WHERE c.gender = 'F'     ORDER BY c.birth_date ASC     LIMIT 1 ), salary_gap AS (     SELECT MAX(A11) AS highest_salary, MIN(A11) AS lowest_salary     FROM district ) SELECT a.account_id, sg.highest_salary - of.avg_salary AS salary_gap FROM oldest_female of JOIN disp d ON of.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN salary_gap sg ON 1=1;	financial
SELECT a.account_id FROM account a JOIN client c ON a.district_id = c.district_id JOIN district d ON c.district_id = d.district_id WHERE c.birth_date = (SELECT MAX(c1.birth_date)                        FROM client c1) AND d.A11 = (SELECT MAX(d1.A11)               FROM district d1);	financial
SELECT COUNT(*) AS weekly_owner_count FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE d.type = 'OWNER' AND a.frequency = 'POPLATEK TYDNE';	financial
SELECT DISTINCT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE d.type = 'DISPONENT' AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT account.account_id FROM account JOIN loan ON account.account_id = loan.account_id WHERE loan.date LIKE '1997%'    AND loan.amount = (SELECT MIN(amount) FROM loan WHERE date LIKE '1997%')    AND account.frequency = 'POPLATEK TYDNE';	financial
SELECT a.account_id, l.amount, a.date FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 12 AND l.status = 'A' AND a.date LIKE '1993%' ORDER BY l.amount DESC LIMIT 1;	financial
SELECT COUNT(DISTINCT client.client_id) AS female_customers_count FROM client JOIN district ON client.district_id = district.district_id JOIN disp ON client.client_id = disp.client_id JOIN account ON disp.account_id = account.account_id WHERE client.gender = 'F'  AND client.birth_date < '1950-01-01' AND district.A2 = 'Sokolov';	financial
WITH EarliestDate AS (     SELECT MIN(date) AS earliest_date      FROM trans      WHERE strftime('%Y', date) = '1995' )  SELECT account_id  FROM trans  WHERE date = (SELECT earliest_date FROM EarliestDate);	financial
SELECT DISTINCT a.account_id  FROM account a  JOIN trans t ON a.account_id = t.account_id WHERE a.date < '1997-01-01' AND t.balance > 3000;	financial
SELECT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card ca ON d.disp_id = ca.disp_id WHERE ca.issued = '1994-03-03';	financial
SELECT a.date  FROM account a JOIN trans t ON a.account_id = t.account_id WHERE t.amount = 840 AND t.date = '1998-10-14';	financial
SELECT a.district_id  FROM loan l JOIN account a ON l.account_id = a.account_id WHERE l.date = '1994-01-05';	financial
SELECT MAX(t.amount) AS biggest_transaction FROM card c JOIN disp d ON c.disp_id = d.disp_id JOIN trans t ON d.account_id = t.account_id WHERE c.issued = '1998-10-16';	financial
SELECT c.gender FROM client c JOIN district d ON c.district_id = d.district_id JOIN account a ON c.district_id = a.district_id WHERE d.A11 = (SELECT MAX(A11) FROM district) ORDER BY c.birth_date ASC LIMIT 1;	financial
SELECT t.amount  FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN loan l ON a.account_id = l.account_id JOIN trans t ON a.account_id = t.account_id WHERE l.amount = (SELECT MAX(amount) FROM loan) ORDER BY t.date ASC LIMIT 1;	financial
SELECT COUNT(*)  FROM client c JOIN account a ON c.district_id = a.district_id JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Jesenik' AND c.gender = 'F';	financial
SELECT disp.disp_id FROM trans JOIN account ON trans.account_id = account.account_id JOIN disp ON account.account_id = disp.account_id WHERE trans.amount = 5100 AND trans.date = '1998-09-02';	financial
SELECT COUNT(*) AS accounts_opened FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Litomerice' AND strftime('%Y', a.date) = '1996';	financial
SELECT d.A2 AS district_name FROM client c JOIN account a ON c.district_id = a.district_id JOIN district d ON a.district_id = d.district_id WHERE c.gender = 'F' AND c.birth_date = '1976-01-29';	financial
SELECT c.birth_date FROM loan l JOIN account a ON l.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id WHERE l.amount = 80952 AND l.date = '1994-01-05';	financial
SELECT a.account_id FROM account a JOIN district d ON a.district_id = d.district_id JOIN disp dp ON a.account_id = dp.account_id JOIN client c ON dp.client_id = c.client_id WHERE d.A3 = 'Prague' ORDER BY a.date ASC LIMIT 1;	financial
SELECT      (COUNT(CASE WHEN c.gender = 'M' THEN 1 END) * 100.0 / COUNT(c.client_id)) AS percentage_male_clients FROM      district d JOIN      client c ON d.district_id = c.district_id WHERE      d.A3 = 'south Bohemia'     AND d.A4 = (SELECT MAX(A4) FROM district WHERE A3 = 'south Bohemia');	financial
SELECT ((MAX(t2.balance) - MAX(t1.balance)) * 1.0 / MAX(t1.balance)) * 100 AS increase_rate FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN loan l ON a.account_id = l.account_id JOIN trans t1 ON t1.account_id = a.account_id AND t1.date = '1993-03-22' JOIN trans t2 ON t2.account_id = a.account_id AND t2.date = '1998-12-27' WHERE l.date = (SELECT MIN(date) FROM loan) LIMIT 1;	financial
SELECT (SUM(CASE WHEN status = 'A' THEN amount ELSE 0 END) * 100.0) / SUM(amount) AS percentage_fully_paid FROM loan;	financial
SELECT      (COUNT(DISTINCT CASE WHEN status = 'C' THEN account_id END) * 100.0 / COUNT(DISTINCT account_id)) AS percentage_running_no_issue FROM loan  WHERE amount < 100000;	financial
SELECT a.account_id, d.A2 AS district_name, d.A3 AS district_region FROM account a JOIN district d ON a.district_id = d.district_id WHERE strftime('%Y', a.date) = '1993' AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT DISTINCT a.account_id, a.frequency FROM account a JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id JOIN district dis ON c.district_id = dis.district_id WHERE d.type = 'OWNER'  AND a.date BETWEEN '1995-01-01' AND '2000-12-31' AND dis.A2 = 'east Bohemia';	financial
SELECT account.account_id, account.date  FROM account  JOIN district ON account.district_id = district.district_id  WHERE district.A2 = 'Prachatice';	financial
SELECT d.A2 AS district, d.A3 AS region FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.loan_id = 4959;	financial
SELECT loan.account_id, district.A2 AS district, district.A3 AS region FROM loan JOIN account ON loan.account_id = account.account_id JOIN district ON account.district_id = district.district_id WHERE loan.amount > 300000;	financial
SELECT l.loan_id, d.A3 AS district, d.A11 AS average_salary FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.duration = 60;	financial
SELECT      d.A3 AS district,     ((d.A13 - d.A12) / d.A12) * 100 AS unemployment_rate_increment_percentage FROM      loan l JOIN      account a ON l.account_id = a.account_id JOIN      disp dp ON a.account_id = dp.account_id JOIN      client c ON dp.client_id = c.client_id JOIN      district d ON c.district_id = d.district_id WHERE      l.status = 'D' AND d.A12 IS NOT NULL AND d.A13 IS NOT NULL;	financial
SELECT      (COUNT(a.account_id) * 100.0 / (SELECT COUNT(account_id) FROM account WHERE strftime('%Y', date) = '1993')) AS percentage FROM      account AS a JOIN      district AS d ON      a.district_id = d.district_id WHERE      d.A2 = 'Decin' AND strftime('%Y', a.date) = '1993';	financial
SELECT account_id  FROM account  WHERE frequency = 'POPLATEK MESICNE';	financial
SELECT d.A2 AS district, COUNT(*) AS female_account_holders FROM client c JOIN account a ON c.district_id = a.district_id JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F' GROUP BY d.A2 ORDER BY female_account_holders DESC LIMIT 9;	financial
SELECT d.A2 AS district_name, t.amount  FROM trans t JOIN account a ON t.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE t.type = 'VYDAJ' AND t.date LIKE '1996-01%' ORDER BY t.amount DESC LIMIT 10;	financial
SELECT COUNT(DISTINCT a.account_id) AS account_holders_without_cards FROM account a JOIN district d ON a.district_id = d.district_id JOIN disp dp ON a.account_id = dp.account_id LEFT JOIN card c ON dp.disp_id = c.disp_id WHERE d.A3 = 'South Bohemia' AND c.card_id IS NULL;	financial
SELECT d.A3 AS district_name, COUNT(l.loan_id) AS active_loans_count FROM district d JOIN account a ON d.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.status IN ('C', 'D') GROUP BY d.A3 ORDER BY active_loans_count DESC LIMIT 1;	financial
SELECT AVG(loan.amount) AS average_loan_amount FROM loan JOIN account ON loan.account_id = account.account_id JOIN disp ON account.account_id = disp.account_id JOIN client ON disp.client_id = client.client_id WHERE client.gender = 'M';	financial
SELECT A3 AS branch_location, A2 AS district_name, A13 AS unemployment_rate FROM district WHERE A13 = (SELECT MAX(A13) FROM district);	financial
SELECT COUNT(a.account_id) AS num_accounts_opened FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A16 = (SELECT MAX(A16) FROM district)   AND a.date BETWEEN '1996-01-01' AND '1996-12-31';	financial
SELECT COUNT(DISTINCT a.account_id) AS negative_balance_accounts FROM trans t JOIN account a ON t.account_id = a.account_id WHERE t.operation = 'VYBER KARTOU'   AND t.balance < 0   AND a.frequency = 'POPLATEK MESICNE';	financial
SELECT COUNT(*) AS loan_count FROM loan l JOIN account a ON l.account_id = a.account_id WHERE l.date BETWEEN '1995-01-01' AND '1997-12-31'   AND l.amount >= 250000   AND a.frequency = 'POPLATEK MESICNE'   AND l.status = 'A';	financial
SELECT COUNT(DISTINCT account.account_id)  FROM account JOIN loan ON account.account_id = loan.account_id WHERE loan.status IN ('C', 'D') AND account.district_id = 1;	financial
SELECT COUNT(DISTINCT client.client_id) AS male_clients_count FROM client JOIN district ON client.district_id = district.district_id WHERE district.A15 = (     SELECT MAX(A15)     FROM district     WHERE A15 < (         SELECT MAX(A15)         FROM district     ) ) AND client.gender = 'M';	financial
SELECT COUNT(*)  FROM card  INNER JOIN disp ON card.disp_id = disp.disp_id  WHERE card.type = 'gold' AND disp.type = 'OWNER';	financial
SELECT COUNT(*)  FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Pisek';	financial
SELECT DISTINCT d.* FROM district d JOIN account a ON d.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id WHERE t.amount > 10000 AND t.date BETWEEN '1997-01-01' AND '1997-12-31';	financial
SELECT DISTINCT account.account_id FROM account JOIN `order` ON account.account_id = `order`.account_id JOIN district ON account.district_id = district.district_id WHERE `order`.k_symbol = 'SIPO' AND district.A2 = 'Pisek';	financial
SELECT DISTINCT a.* FROM account a JOIN disp d ON a.account_id = d.account_id JOIN card c ON d.disp_id = c.disp_id WHERE c.type = 'gold';	financial
SELECT AVG(amount) AS average_amount FROM trans WHERE operation = 'VYBER KARTOU'   AND strftime('%Y', date) = '2021'   AND strftime('%m', date) IS NOT NULL;	financial
SELECT DISTINCT d.client_id FROM trans t JOIN account a ON t.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id JOIN card c ON d.disp_id = c.disp_id WHERE t.operation = 'VYBER KARTOU'   AND t.date BETWEEN '1998-01-01' AND '1998-12-31'   AND t.amount < (SELECT AVG(amount)                    FROM trans                    WHERE operation = 'VYBER KARTOU'                      AND date BETWEEN '1998-01-01' AND '1998-12-31')   AND c.card_id = t.account;	financial
SELECT DISTINCT c.client_id, c.gender, c.birth_date, c.district_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card ca ON d.disp_id = ca.disp_id JOIN loan l ON d.account_id = l.account_id WHERE c.gender = 'F' AND d.type = 'OWNER';	financial
SELECT COUNT(DISTINCT a.account_id)  FROM account a JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id JOIN district di ON a.district_id = di.district_id WHERE c.gender = 'F' AND di.A3 = 'South Bohemia';	financial
SELECT a.account_id  FROM account a JOIN disp d ON a.account_id = d.account_id JOIN district di ON a.district_id = di.district_id WHERE di.A2 = 'Tabor' AND d.type = 'OWNER';	financial
SELECT DISTINCT d.type  FROM account a  JOIN disp d ON a.account_id = d.account_id  JOIN district dist ON a.district_id = dist.district_id  WHERE d.type != 'OWNER'  AND dist.A11 > 8000 AND dist.A11 <= 9000;	financial
SELECT COUNT(DISTINCT a.account_id) AS account_count FROM account a JOIN district d ON a.district_id = d.district_id JOIN trans t ON a.account_id = t.account_id WHERE d.A3 = 'North Bohemia' AND t.k_symbol = 'AB';	financial
SELECT DISTINCT d.A2  FROM district d JOIN account a ON d.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id WHERE t.type = 'VYDAJ';	financial
SELECT AVG(A15) AS average_crimes_1995 FROM district d WHERE A15 > 4000 AND EXISTS (     SELECT 1      FROM account a     WHERE a.district_id = d.district_id     AND strftime('%Y', a.date) >= '1997' );	financial
SELECT COUNT(DISTINCT card.card_id) AS classic_cards_with_loans FROM card JOIN disp ON card.disp_id = disp.disp_id JOIN loan ON disp.account_id = loan.account_id WHERE card.type = 'classic' AND disp.type = 'OWNER';	financial
SELECT COUNT(*) AS male_clients_count FROM client JOIN district ON client.district_id = district.district_id WHERE client.gender = 'M' AND district.A2 = 'Hl.m. Praha';	financial
SELECT (CAST(SUM(CASE WHEN type = 'gold' AND issued < '1998-01-01' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(*)) * 100 AS percent_gold_prior_1998 FROM card;	financial
SELECT c.client_id, c.gender, c.birth_date  FROM client c JOIN disp d ON c.client_id = d.client_id JOIN loan l ON d.account_id = l.account_id WHERE l.amount = (SELECT MAX(amount) FROM loan);	financial
SELECT A15  FROM district  WHERE district_id = (SELECT district_id FROM account WHERE account_id = 2);	financial
SELECT a.district_id FROM `order` o JOIN `account` a ON o.account_id = a.account_id WHERE o.order_id = 29401;	financial
SELECT t.* FROM trans t JOIN account a ON t.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id WHERE c.client_id = 1 AND t.operation = 'VYBER';	financial
SELECT COUNT(DISTINCT l.account_id) FROM account a JOIN loan l ON a.account_id = l.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND l.amount < 200000;	financial
SELECT c.type  FROM card c JOIN disp d ON c.disp_id = d.disp_id WHERE d.client_id = 13539;	financial
SELECT district.A3  FROM client  JOIN district ON client.district_id = district.district_id  WHERE client.client_id = 1;	financial
SELECT d.A2 AS district_name, COUNT(l.loan_id) AS loan_count FROM district d JOIN account a ON d.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.status = 'A' GROUP BY d.A2 ORDER BY loan_count DESC LIMIT 1;	financial
SELECT c.client_id, c.gender, c.birth_date, c.district_id FROM `order` o JOIN `account` a ON o.account_id = a.account_id JOIN `disp` d ON a.account_id = d.account_id JOIN `client` c ON d.client_id = c.client_id WHERE o.order_id = 29401;	financial
SELECT t.*  FROM trans t JOIN account a ON t.account_id = a.account_id WHERE a.district_id = 5;	financial
SELECT COUNT(*)  FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A3 = 'Jesenik';	financial
SELECT DISTINCT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card ca ON d.disp_id = ca.disp_id WHERE ca.type = 'junior' AND ca.issued >= '1997-01-01';	financial
SELECT      (COUNT(DISTINCT c.client_id) * 100.0 /      (SELECT COUNT(DISTINCT c1.client_id)       FROM client c1      INNER JOIN account a1 ON c1.district_id = a1.district_id      INNER JOIN district d1 ON a1.district_id = d1.district_id      WHERE d1.A11 > 10000)) AS percentage_of_women FROM client c INNER JOIN account a ON c.district_id = a.district_id INNER JOIN district d ON a.district_id = d.district_id WHERE d.A11 > 10000 AND c.gender = 'F';	financial
SELECT      ((SUM(CASE WHEN strftime('%Y', l.date) = '1997' THEN l.amount ELSE 0 END) -        SUM(CASE WHEN strftime('%Y', l.date) = '1996' THEN l.amount ELSE 0 END)) /        SUM(CASE WHEN strftime('%Y', l.date) = '1996' THEN l.amount ELSE 0 END)) * 100 AS growth_rate FROM loan l JOIN account a ON l.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id WHERE c.gender = 'M' AND strftime('%Y', l.date) IN ('1996', '1997');	financial
SELECT COUNT(*)  FROM trans  WHERE operation = 'VYBER KARTOU' AND date > '1995-12-31';	financial
SELECT      (SELECT SUM(A16) FROM district WHERE A3 = 'North Bohemia' AND A5 = '1996') -      (SELECT SUM(A16) FROM district WHERE A3 = 'East Bohemia' AND A5 = '1996') AS crime_difference;	financial
SELECT type, COUNT(*) AS disposition_count FROM disp WHERE account_id BETWEEN 1 AND 10 GROUP BY type;	financial
SELECT frequency FROM account WHERE account_id = 3;  SELECT k_symbol FROM "order" WHERE account_id = 3 GROUP BY k_symbol HAVING SUM(amount) = 3539;	financial
SELECT strftime('%Y', c.birth_date) AS birth_year FROM client c JOIN disp d ON c.client_id = d.client_id WHERE d.account_id = 130 AND d.type = 'OWNER';	financial
SELECT COUNT(*)  FROM account a JOIN disp d ON a.account_id = d.account_id WHERE d.type = 'OWNER' AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT l.amount AS debt_amount, l.status AS payment_status FROM client c JOIN disp d ON c.client_id = d.client_id JOIN loan l ON d.account_id = l.account_id WHERE c.client_id = 992;	financial
SELECT c.gender, t.balance  FROM trans t JOIN account a ON t.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id WHERE c.client_id = 4;	financial
SELECT card.type  FROM card  JOIN disp ON card.disp_id = disp.disp_id  WHERE disp.client_id = 9;	financial
SELECT SUM(trans.amount) AS total_paid FROM trans JOIN account ON trans.account_id = account.account_id JOIN disp ON account.account_id = disp.account_id WHERE disp.client_id = 1 AND trans.date BETWEEN '1998-01-01' AND '1998-12-31' AND trans.type = 'VYDAJ';	financial
SELECT c.client_id, c.gender, c.birth_date FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN district di ON a.district_id = di.district_id WHERE c.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND di.A2 = 'East Bohemia';	financial
SELECT client.client_id FROM client JOIN disp ON client.client_id = disp.client_id JOIN loan ON disp.account_id = loan.account_id WHERE client.gender = 'F' ORDER BY loan.amount DESC LIMIT 3;	financial
SELECT COUNT(DISTINCT c.client_id) AS male_customers_count FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN `order` o ON a.account_id = o.account_id WHERE c.gender = 'M'   AND c.birth_date BETWEEN '1974-01-01' AND '1976-12-31'   AND o.k_symbol = 'SIPO'   AND o.amount > 4000;	financial
SELECT COUNT(*) AS account_count FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A3 = 'Beroun' AND a.date > '1996-12-31';	financial
SELECT COUNT(DISTINCT client.client_id) AS female_customers_with_junior_card FROM client JOIN disp ON client.client_id = disp.client_id JOIN card ON disp.disp_id = card.disp_id WHERE client.gender = 'F' AND card.type = 'junior';	financial
SELECT      (CAST(COUNT(DISTINCT client.client_id) AS FLOAT) /      (SELECT COUNT(DISTINCT client.client_id)       FROM client       JOIN account ON client.district_id = account.district_id       JOIN district ON account.district_id = district.district_id       WHERE district.A3 LIKE '%Prague%')) * 100 AS female_percentage FROM client  JOIN account ON client.district_id = account.district_id  JOIN district ON account.district_id = district.district_id  WHERE client.gender = 'F' AND district.A3 LIKE '%Prague%';	financial
SELECT      (CAST(COUNT(DISTINCT c.client_id) AS FLOAT) /       CAST((SELECT COUNT(DISTINCT d.client_id)             FROM disp d             JOIN account a ON d.account_id = a.account_id             WHERE a.frequency = 'POPLATEK TYDNE') AS FLOAT) * 100) AS percentage_male_clients FROM disp d JOIN account a ON d.account_id = a.account_id JOIN client c ON d.client_id = c.client_id WHERE c.gender = 'M' AND a.frequency = 'POPLATEK TYDNE';	financial
SELECT COUNT(DISTINCT c.client_id) AS owner_count FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND d.type = 'OWNER'	financial
SELECT account_id FROM loan WHERE duration > 24 AND amount = (     SELECT MIN(amount)     FROM loan     WHERE duration > 24 ) AND account_id IN (     SELECT account_id     FROM account     WHERE date < '1997-01-01' );	financial
SELECT a.account_id  FROM account a  JOIN disp d ON a.account_id = d.account_id  JOIN client c ON d.client_id = c.client_id  JOIN district dist ON c.district_id = dist.district_id  WHERE c.gender = 'F'  AND dist.A11 = (     SELECT MIN(dist_inner.A11)      FROM client c_inner      JOIN district dist_inner ON c_inner.district_id = dist_inner.district_id      WHERE c_inner.gender = 'F' )  ORDER BY c.birth_date ASC  LIMIT 1;	financial
SELECT COUNT(DISTINCT c.client_id) AS client_count FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.birth_date BETWEEN '1920-01-01' AND '1920-12-31' AND d.A3 = 'East Bohemia';	financial
SELECT COUNT(*)  FROM loan l JOIN account a ON l.account_id = a.account_id WHERE l.duration = 24 AND a.frequency = 'POPLATEK TYDNE';	financial
SELECT AVG(loan.amount) AS average_loan_amount FROM loan JOIN account ON loan.account_id = account.account_id JOIN trans ON trans.account_id = account.account_id WHERE loan.status IN ('C', 'D') AND account.frequency = 'POPLATEK PO OBRATU';	financial
SELECT DISTINCT c.client_id, c.district_id FROM client c JOIN disp d ON c.client_id = d.client_id WHERE d.type = 'OWNER';	financial
SELECT      client.client_id,      strftime('%Y', 'now') - strftime('%Y', client.birth_date) AS age FROM      client JOIN      disp ON client.client_id = disp.client_id JOIN      card ON disp.disp_id = card.disp_id WHERE      card.type = 'gold' AND disp.type = 'OWNER';	financial
SELECT bond_type, COUNT(bond_type) AS count  FROM bond  GROUP BY bond_type  ORDER BY count DESC  LIMIT 1;	toxicology
SELECT COUNT(DISTINCT m.molecule_id) AS count_of_molecules_with_chlorine FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '-' AND a.element = 'cl';	toxicology
SELECT AVG(oxygen_count) AS avg_oxygen_atoms FROM (     SELECT m.molecule_id, COUNT(a.atom_id) AS oxygen_count     FROM molecule m     JOIN bond b ON m.molecule_id = b.molecule_id     JOIN connected c ON b.bond_id = c.bond_id     JOIN atom a ON c.atom_id = a.atom_id     WHERE b.bond_type = '-' AND a.element = 'o'     GROUP BY m.molecule_id ) AS molecule_oxygen_counts;	toxicology
SELECT SUM(CASE WHEN b.bond_type = '-' THEN 1 ELSE 0 END) * 1.0 / COUNT(DISTINCT a.atom_id) AS average_single_bonds FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.label = '+';	toxicology
SELECT COUNT(DISTINCT a.atom_id) AS non_carcinogenic_sodium_count FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'na' AND m.label = '-';	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '#' AND m.label = '+';	toxicology
SELECT      (CAST(SUM(CASE WHEN a.element = 'c' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(a.atom_id)) * 100 AS carbon_percentage FROM      atom a WHERE      a.molecule_id IN (         SELECT              b.molecule_id         FROM              bond b         WHERE              b.bond_type = '='     );	toxicology
SELECT COUNT(*) AS triple_bond_count FROM bond WHERE bond_type = '#';	toxicology
SELECT COUNT(*)  FROM atom  WHERE element != 'br';	toxicology
SELECT COUNT(*)  FROM molecule  WHERE molecule_id BETWEEN 'TR000' AND 'TR099' AND label = '+';	toxicology
SELECT DISTINCT molecule_id  FROM atom  WHERE element = 'c';	toxicology
SELECT a.element  FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE c.bond_id = 'TR004_8_9';	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '=';	toxicology
SELECT label  FROM molecule  WHERE molecule_id IN (     SELECT molecule_id      FROM atom      WHERE element = 'h' )  GROUP BY label  ORDER BY COUNT(*) DESC  LIMIT 1;	toxicology
SELECT DISTINCT b.bond_type FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'cl';	toxicology
SELECT c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-';	toxicology
SELECT c.atom_id, c.atom_id2 FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id JOIN molecule m ON a1.molecule_id = m.molecule_id WHERE m.label = '-';	toxicology
SELECT element  FROM atom  WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-')  GROUP BY element  ORDER BY COUNT(element) ASC  LIMIT 1;	toxicology
SELECT b.bond_type FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE (c.atom_id = 'TR004_8' AND c.atom_id2 = 'TR004_20')     OR (c.atom_id = 'TR004_20' AND c.atom_id2 = 'TR004_8');	toxicology
SELECT DISTINCT label  FROM molecule  WHERE label NOT IN (     SELECT DISTINCT m.label      FROM molecule m      JOIN atom a ON m.molecule_id = a.molecule_id      WHERE a.element = 'sn' );	toxicology
SELECT COUNT(DISTINCT a.atom_id) AS atom_count FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id WHERE a.element IN ('i', 's') AND b.molecule_id IN (     SELECT molecule_id     FROM bond     WHERE bond_type = '-'     GROUP BY molecule_id     HAVING COUNT(bond_type) = COUNT(*) );	toxicology
SELECT c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#';	toxicology
SELECT c.atom_id2  FROM connected c JOIN atom a ON c.atom_id = a.atom_id WHERE a.molecule_id = 'TR181' AND EXISTS (SELECT 1 FROM molecule WHERE molecule_id = 'TR181');	toxicology
SELECT      100 - (         COUNT(DISTINCT CASE WHEN a.element = 'f' THEN a.atom_id END) * 100.0 /          COUNT(DISTINCT m.molecule_id)     ) AS percentage_without_fluorine FROM      molecule m LEFT JOIN      atom a ON m.molecule_id = a.molecule_id WHERE      m.label = '+';	toxicology
SELECT      CASE          WHEN COUNT(CASE WHEN b.bond_type = '#' THEN 1 END) > 0          THEN (SUM(CASE WHEN b.bond_type = '#' THEN 1 ELSE 0 END) * 100.0 / COUNT(b.bond_id))          ELSE 0      END AS percent FROM      bond b JOIN      molecule m ON b.molecule_id = m.molecule_id WHERE      m.label = '+';	toxicology
SELECT element  FROM atom  WHERE molecule_id = 'TR000'  GROUP BY element  ORDER BY element ASC  LIMIT 3;	toxicology
SELECT atom_id, atom_id2  FROM connected  WHERE bond_id = 'TR001_2_6'  AND bond_id IN (SELECT bond_id FROM bond WHERE molecule_id = 'TR001');	toxicology
SELECT      (SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN label = '-' THEN 1 ELSE 0 END)) AS difference FROM molecule;	toxicology
SELECT atom_id, atom_id2  FROM connected  WHERE bond_id = 'TR000_2_5';	toxicology
SELECT bond_id  FROM connected  WHERE atom_id2 = 'TR000_2';	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '=' ORDER BY m.molecule_id LIMIT 5;	toxicology
SELECT ROUND((CAST(SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) AS FLOAT) / NULLIF(COUNT(bond_id), 0)) * 100, 5) AS percent FROM bond WHERE molecule_id = 'TR000';	toxicology
SELECT ROUND((CAST(SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(molecule_id)) * 100, 3) AS percent FROM molecule;	toxicology
SELECT ROUND(CAST(SUM(CASE WHEN element = 'h' THEN 1 ELSE 0 END) AS FLOAT) / NULLIF(COUNT(atom_id), 0) * 100, 4) AS percent FROM atom WHERE molecule_id = 'TR206';	toxicology
SELECT DISTINCT bond_type FROM bond WHERE molecule_id = 'TR000';	toxicology
SELECT a.element, m.label FROM molecule m LEFT JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.molecule_id = 'TR006';	toxicology
SELECT b.bond_type, COUNT(b.bond_type) AS bond_count, m.label AS is_carcinogenic FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.molecule_id = 'TR010' GROUP BY b.bond_type, m.label HAVING COUNT(b.bond_type) = (     SELECT MAX(bond_count)     FROM (         SELECT COUNT(b.bond_type) AS bond_count         FROM bond b         WHERE b.molecule_id = 'TR010'         GROUP BY b.bond_type     ) AS bond_counts ) LIMIT 1;	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.label = '-' AND b.bond_type = '-' ORDER BY m.molecule_id LIMIT 3;	toxicology
SELECT bond_id FROM bond WHERE molecule_id = 'TR006' ORDER BY bond_id ASC LIMIT 2;	toxicology
SELECT COUNT(*)  FROM bond b JOIN connected c ON b.bond_id = c.bond_id WHERE b.molecule_id = 'TR000' AND ('TR000_12' IN (c.atom_id, c.atom_id2));	toxicology
SELECT COUNT(DISTINCT m.molecule_id) AS carcinogenic_molecule_count FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' AND a.element = 'br';	toxicology
SELECT b.bond_type, c.atom_id, c.atom_id2 FROM bond b JOIN connected c ON b.bond_id = c.bond_id WHERE b.bond_id = 'TR000_1_2';	toxicology
SELECT molecule.molecule_id,         CASE             WHEN molecule.label = '+' THEN 'Carcinogenic'             ELSE 'Non-Carcinogenic'         END AS carcinogenic_status FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.atom_id = 'TR001_10';	toxicology
SELECT COUNT(DISTINCT molecule_id)  FROM bond  WHERE bond_type = '#';	toxicology
SELECT COUNT(bond_id) AS connection_count FROM connected WHERE atom_id LIKE 'TR%_19' OR atom_id2 LIKE 'TR%_19';	toxicology
SELECT a.element FROM atom a WHERE a.molecule_id = 'TR004';	toxicology
SELECT COUNT(*) AS non_carcinogenic_molecules  FROM molecule  WHERE label = '-';	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE CAST(SUBSTR(a.atom_id, 7, 2) AS INTEGER) BETWEEN 21 AND 25 AND m.label = '+';	toxicology
SELECT b.bond_id FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE (a1.element = 'p' AND a2.element = 'n') OR (a1.element = 'n' AND a2.element = 'p');	toxicology
SELECT CASE      WHEN m.label = '+' THEN 'Yes'      ELSE 'No'  END AS is_carcinogenic FROM molecule m WHERE m.molecule_id = (     SELECT molecule_id     FROM bond     WHERE bond_type = '='     GROUP BY molecule_id     ORDER BY COUNT(*) DESC     LIMIT 1 );	toxicology
SELECT COALESCE(SUM(CASE WHEN connected.bond_id IS NOT NULL THEN 1 ELSE 0 END), 0) * 1.0 / COUNT(DISTINCT atom.atom_id) AS average_bonds  FROM atom  LEFT JOIN connected ON atom.atom_id = connected.atom_id  WHERE atom.element = 'i';	toxicology
SELECT bond_type, bond_id FROM bond WHERE bond_id IN (     SELECT bond_id     FROM connected     WHERE atom_id IN (         SELECT atom_id         FROM atom         WHERE CAST(SUBSTR(atom_id, 7, 2) AS INTEGER) = 45     ) );	toxicology
SELECT element  FROM atom  WHERE atom_id NOT IN (SELECT atom_id FROM connected);	toxicology
SELECT a.atom_id  FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.molecule_id = 'TR041' AND b.bond_type = '#' AND EXISTS (SELECT 1 FROM molecule WHERE molecule_id = 'TR041') AND EXISTS (SELECT 1 FROM bond WHERE bond_type = '#');	toxicology
SELECT a.element FROM connected c JOIN atom a ON c.atom_id = a.atom_id WHERE c.bond_id = 'TR144_8_19';	toxicology
SELECT b.molecule_id FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.label = '+' AND b.bond_type = '=' GROUP BY b.molecule_id ORDER BY COUNT(*) DESC LIMIT 1;	toxicology
SELECT element, COUNT(element) AS frequency FROM atom WHERE molecule_id IN (     SELECT molecule_id     FROM molecule     WHERE label = '+' ) GROUP BY element ORDER BY frequency ASC LIMIT 1;	toxicology
SELECT a.atom_id  FROM atom a JOIN connected c ON a.atom_id = c.atom_id2 WHERE c.atom_id IN (SELECT atom_id FROM atom WHERE element = 'pb');	toxicology
SELECT bond_type FROM bond WHERE bond_type = '#';	toxicology
WITH ElementCombinations AS (     SELECT a1.element AS element1, a2.element AS element2, COUNT(c.bond_id) AS bond_count     FROM connected c     JOIN atom a1 ON c.atom_id = a1.atom_id     JOIN atom a2 ON c.atom_id2 = a2.atom_id     GROUP BY a1.element, a2.element ), MostCommonCombination AS (     SELECT element1, element2, MAX(bond_count) AS max_bond_count     FROM ElementCombinations ), TotalBonds AS (     SELECT COUNT(*) AS total_bond_count     FROM bond ) SELECT (mc.max_bond_count * 100.0 / tb.total_bond_count) AS percentage FROM MostCommonCombination mc, TotalBonds tb;	toxicology
SELECT ROUND((SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) * 100.0) / COUNT(b.bond_id), 5) AS proportion FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '-';	toxicology
SELECT COUNT(*) AS total_atoms FROM atom WHERE element IN ('c', 'h');	toxicology
SELECT atom_id2  FROM connected  JOIN atom ON connected.atom_id = atom.atom_id  WHERE atom.element = 's';	toxicology
SELECT DISTINCT b.bond_type FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'sn';	toxicology
SELECT COUNT(DISTINCT a.element) AS element_count FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id WHERE m.molecule_id NOT IN (SELECT molecule_id FROM bond WHERE bond_type != '-');	toxicology
SELECT COUNT(DISTINCT a.atom_id) AS total_atoms FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#' AND (a.element = 'p' OR a.element = 'br');	toxicology
SELECT bond_id  FROM bond  WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+');	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '-' AND m.label = '-';	toxicology
SELECT      (CAST(SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(a.atom_id)) * 100 AS percent FROM      bond b JOIN      connected c ON b.bond_id = c.bond_id JOIN      atom a ON c.atom_id = a.atom_id WHERE      b.bond_type = '-';	toxicology
SELECT molecule_id, label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002');	toxicology
SELECT molecule_id FROM molecule WHERE label = '-';	toxicology
SELECT COUNT(*) AS total_carcinogenic_molecules FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR030' AND label = '+';	toxicology
SELECT bond_type  FROM bond  WHERE molecule_id BETWEEN 'TR000' AND 'TR050';	toxicology
SELECT a1.element AS element1, a2.element AS element2 FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE c.bond_id = 'TR001_10_11';	toxicology
SELECT COUNT(DISTINCT b.bond_id)  FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id WHERE a.element = 'i';	toxicology
SELECT label, COUNT(*) AS count FROM molecule WHERE molecule_id IN (     SELECT molecule_id     FROM atom     WHERE LOWER(element) = 'ca' ) GROUP BY label ORDER BY count DESC LIMIT 1;	toxicology
SELECT COUNT(DISTINCT a.element) AS element_count FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN atom a ON c.atom_id = a.atom_id WHERE b.bond_id = 'TR001_10_11' AND a.element IN ('cl', 'c');	toxicology
SELECT DISTINCT m1.molecule_id FROM molecule m1 JOIN atom a1 ON m1.molecule_id = a1.molecule_id JOIN connected c ON a1.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE a1.element = 'c' AND b.bond_type = '#' AND m1.label = '-' AND a2.element = 'c' LIMIT 2;	toxicology
SELECT      (CAST(SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(DISTINCT m.molecule_id)) * 100 AS percentage FROM      molecule m JOIN      atom a ON m.molecule_id = a.molecule_id WHERE      m.label = '+';	toxicology
SELECT a.element FROM atom a WHERE a.molecule_id = 'TR001';	toxicology
SELECT DISTINCT molecule_id FROM bond WHERE bond_type = '=';	toxicology
SELECT c.atom_id AS first_atom, c.atom_id2 AS second_atom FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#';	toxicology
SELECT DISTINCT a.element FROM connected c JOIN atom a ON c.atom_id = a.atom_id WHERE c.bond_id = 'TR000_1_2';	toxicology
SELECT COUNT(DISTINCT b.molecule_id) AS non_carcinogenic_single_bond_molecules FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '-' AND m.label = '-';	toxicology
SELECT m.label  FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_id = 'TR001_10_11';	toxicology
SELECT bond.bond_id,         CASE             WHEN molecule.label = '+' THEN 'Carcinogenic'            WHEN molecule.label = '-' THEN 'Non-carcinogenic'        END AS carcinogenic_status FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_type = '#';	toxicology
SELECT m.molecule_id, a.element FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' AND SUBSTR(a.atom_id, 7, 1) = '4';	toxicology
SELECT      COALESCE(SUM(CASE WHEN element = 'h' THEN 1 ELSE 0 END) * 1.0 / NULLIF(COUNT(element), 0), 0) AS ratio,     label FROM      atom JOIN      molecule ON atom.molecule_id = molecule.molecule_id WHERE      atom.molecule_id = 'TR006';	toxicology
SELECT DISTINCT      CASE          WHEN m.label = '+' THEN 'Carcinogenic'         WHEN m.label = '-' THEN 'Non-carcinogenic'     END AS compound_status FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'ca';	toxicology
SELECT DISTINCT bond.bond_type FROM atom JOIN connected ON atom.atom_id = connected.atom_id JOIN bond ON connected.bond_id = bond.bond_id WHERE atom.element = 'c';	toxicology
SELECT DISTINCT a.element  FROM atom a  JOIN connected c ON (a.atom_id = c.atom_id OR a.atom_id = c.atom_id2)  WHERE c.bond_id = 'TR001_10_11';	toxicology
SELECT      CASE          WHEN EXISTS (SELECT 1 FROM bond WHERE bond_type = '#')          THEN (SELECT COUNT(DISTINCT molecule_id) * 100.0 / (SELECT COUNT(DISTINCT molecule_id) FROM molecule) FROM bond WHERE bond_type = '#')          ELSE 0      END AS percent_triple_bond;	toxicology
SELECT      CASE          WHEN COUNT(bond_id) = 0 THEN 0         ELSE (CAST(SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(bond_id)) * 100      END AS percent FROM bond WHERE molecule_id = 'TR047';	toxicology
SELECT CASE WHEN m.label = '+' THEN 'Carcinogenic' ELSE 'Non-carcinogenic' END AS carcinogenic_status FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR000_1';	toxicology
SELECT CASE WHEN label = '+' THEN 'Yes' ELSE 'No' END AS is_carcinogenic FROM molecule WHERE molecule_id = 'TR151';	toxicology
SELECT DISTINCT a.element  FROM atom a  WHERE a.molecule_id = 'TR151' AND a.element IN ('cl', 'br', 'f', 'i', 'sn', 'pb', 'te');	toxicology
SELECT COUNT(*)  FROM molecule  WHERE label = '+';	toxicology
SELECT atom_id  FROM atom  WHERE element = 'c'  AND CAST(substr(molecule_id, 3, 3) AS INTEGER) >= 10  AND CAST(substr(molecule_id, 3, 3) AS INTEGER) <= 50;	toxicology
SELECT COUNT(*) AS atom_count FROM atom WHERE molecule_id IN (     SELECT molecule_id     FROM molecule     WHERE label = '+' );	toxicology
SELECT b.bond_id FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '=' AND m.label = '+';	toxicology
SELECT COUNT(*)  FROM atom  WHERE element = 'h' AND molecule_id IN (     SELECT molecule_id      FROM molecule      WHERE label = '+' );	toxicology
SELECT b.molecule_id  FROM bond b JOIN connected c ON b.bond_id = c.bond_id WHERE c.atom_id = 'TR000_1' AND c.bond_id = 'TR000_1_2';	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c' AND m.label = '-';	toxicology
SELECT      (CAST(SUM(CASE WHEN a.element = 'h' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(*)) * 100.0 AS percentage FROM      molecule m LEFT JOIN      atom a ON m.molecule_id = a.molecule_id WHERE      m.label = '+';	toxicology
SELECT      CASE          WHEN label = '+' THEN 'Yes'          ELSE 'No'      END AS is_carcinogenic FROM molecule WHERE molecule_id = 'TR124';	toxicology
SELECT atom_id, element  FROM atom  WHERE molecule_id = 'TR186' AND EXISTS (SELECT 1 FROM molecule WHERE molecule_id = 'TR186');	toxicology
SELECT bond_type  FROM bond  WHERE bond_id = 'TR007_4_19' LIMIT 1;	toxicology
SELECT DISTINCT a.element FROM connected c JOIN atom a ON c.atom_id = a.atom_id WHERE c.bond_id = 'TR000_2_4';	toxicology
SELECT      COUNT(b.bond_id) AS double_bond_count,     CASE          WHEN m.label = '+' THEN 'carcinogenic'         ELSE 'non-carcinogenic'     END AS carcinogenic_status FROM      molecule m LEFT JOIN      bond b ON m.molecule_id = b.molecule_id AND b.bond_type = '=' WHERE      m.molecule_id = 'TR006';	toxicology
SELECT m.molecule_id, a.element FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+';	toxicology
SELECT b.bond_id, a1.atom_id AS atom_1, a2.atom_id AS atom_2, m.molecule_id FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '-';	toxicology
SELECT m.molecule_id, GROUP_CONCAT(DISTINCT a.element) AS elements  FROM molecule m  JOIN bond b ON m.molecule_id = b.molecule_id AND b.bond_type = '#'  JOIN atom a ON m.molecule_id = a.molecule_id  GROUP BY m.molecule_id;	toxicology
SELECT a.element  FROM connected c JOIN atom a ON c.atom_id = a.atom_id WHERE c.bond_id = 'TR000_2_3';	toxicology
SELECT COUNT(*) AS bond_count FROM connected WHERE atom_id IN (SELECT atom_id FROM atom WHERE element = 'cl')    OR atom_id2 IN (SELECT atom_id FROM atom WHERE element = 'cl');	toxicology
SELECT a.atom_id, COUNT(DISTINCT b.bond_type) AS bond_type_count FROM atom a LEFT JOIN bond b ON a.molecule_id = b.molecule_id WHERE a.molecule_id = 'TR346' GROUP BY a.atom_id;	toxicology
SELECT COUNT(*) AS total_molecules_with_double_bond,         SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) AS carcinogenic_molecules_with_double_bond FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '=';	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m  WHERE m.molecule_id NOT IN (     SELECT DISTINCT a.molecule_id      FROM atom a      WHERE a.element = 's' )  AND m.molecule_id NOT IN (     SELECT DISTINCT b.molecule_id      FROM bond b      WHERE b.bond_type = '=' );	toxicology
SELECT m.label  FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_id = 'TR000_2_4';	toxicology
SELECT COUNT(*)  FROM atom  WHERE molecule_id = 'TR001';	toxicology
SELECT COUNT(*) AS single_bond_count FROM bond WHERE bond_type = '-';	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'cl' AND m.label = '+';	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'c' AND m.label = '-';	toxicology
SELECT      (CAST(SUM(CASE WHEN m.label = '+' AND a.element = 'cl' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(DISTINCT m.molecule_id)) * 100 AS percentage FROM      molecule m LEFT JOIN      atom a ON m.molecule_id = a.molecule_id;	toxicology
SELECT molecule_id  FROM bond  WHERE bond_id = 'TR001_10_11';	toxicology
SELECT COUNT(DISTINCT a.element) FROM connected c JOIN atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id WHERE c.bond_id = 'TR001_3_4';	toxicology
SELECT b.bond_type FROM bond b JOIN connected c ON b.bond_id = c.bond_id WHERE c.atom_id = 'TR000_1' AND c.atom_id2 = 'TR000_2';	toxicology
SELECT m.label  FROM molecule AS m JOIN atom AS a1 ON m.molecule_id = a1.molecule_id JOIN atom AS a2 ON m.molecule_id = a2.molecule_id WHERE a1.atom_id = 'TR000_2' AND a2.atom_id = 'TR000_4';	toxicology
SELECT element  FROM atom  WHERE atom_id = 'TR000_1';	toxicology
SELECT CASE             WHEN label = '+' THEN 'Carcinogenic'             WHEN label = '-' THEN 'Non-Carcinogenic'         END AS carcinogenic_status FROM molecule WHERE molecule_id = 'TR000';	toxicology
SELECT      (CAST(SUM(CASE WHEN b.bond_type = '-' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(b.bond_id)) * 100 AS percentage FROM      bond b;	toxicology
SELECT COUNT(DISTINCT m.molecule_id) AS carcinogenic_molecule_count FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' AND a.element = 'n';	toxicology
SELECT DISTINCT m.molecule_id  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  JOIN bond b ON m.molecule_id = b.molecule_id  WHERE a.element = 's' AND b.bond_type = '=';	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '-' GROUP BY m.molecule_id HAVING COUNT(a.molecule_id) > 5;	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '=' AND b.molecule_id = 'TR000' AND a.molecule_id = 'TR000';	toxicology
SELECT molecule.molecule_id, COUNT(atom.atom_id) AS atom_count FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '+' GROUP BY molecule.molecule_id ORDER BY atom_count DESC LIMIT 1;	toxicology
SELECT      (COUNT(DISTINCT m.molecule_id) * 100.0 / (SELECT COUNT(DISTINCT m2.molecule_id)                                                 FROM molecule m2                                                 JOIN atom a2 ON m2.molecule_id = a2.molecule_id                                                 WHERE a2.element = 'h')) AS percentage FROM      molecule m JOIN      atom a ON m.molecule_id = a.molecule_id JOIN      connected c ON a.atom_id = c.atom_id JOIN      bond b ON c.bond_id = b.bond_id WHERE      m.label = '+' AND a.element = 'h' AND b.bond_type = '#';	toxicology
SELECT COUNT(*) AS carcinogenic_molecules_count FROM molecule WHERE label = '+';	toxicology
SELECT COUNT(DISTINCT b.molecule_id) AS molecule_count FROM bond b WHERE b.bond_type = '-' AND b.molecule_id BETWEEN 'TR004' AND 'TR010';	toxicology
SELECT COUNT(*)  FROM atom  WHERE molecule_id = 'TR008' AND element = 'c';	toxicology
SELECT a.element FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR004_7' AND m.label = '-';	toxicology
SELECT COUNT(DISTINCT m.molecule_id) AS total_molecules FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id JOIN connected c ON b.bond_id = c.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE b.bond_type = '=' AND (a1.element = 'o' OR a2.element = 'o');	toxicology
SELECT COUNT(DISTINCT m.molecule_id) AS non_carcinogenic_molecule_count FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '#' AND m.label = '-';	toxicology
SELECT a.element, b.bond_type FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.molecule_id = 'TR002';	toxicology
SELECT a.atom_id FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id JOIN connected c ON a.atom_id = c.atom_id AND b.bond_id = c.bond_id WHERE a.element = 'c' AND b.bond_type = '=' AND a.molecule_id = 'TR001';	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' AND a.element = 'o';	toxicology
SELECT *  FROM cards  WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT *  FROM cards  WHERE borderColor = 'borderless'  AND cardKingdomFoilId IS NULL  AND cardKingdomId IS NOT NULL;	card_games
SELECT name  FROM cards  WHERE faceConvertedManaCost = (SELECT MAX(faceConvertedManaCost) FROM cards);	card_games
SELECT name  FROM cards  WHERE edhrecRank < 100 AND frameVersion = '2015';	card_games
SELECT c.name, c.rarity, l.format, l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'mythic' AND l.format = 'gladiator' AND l.status = 'Banned';	card_games
SELECT c.name, l.status  FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.types = 'Artifact'    AND c.side IS NULL    AND l.format = 'vintage';	card_games
SELECT c.id, c.artist  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE (c.power = '*' OR c.power IS NULL)  AND l.format = 'commander'  AND l.status = 'Legal';	card_games
SELECT cards.id AS card_id, rulings.text AS ruling_text,         CASE WHEN cards.hasContentWarning = 1 THEN 'Yes' ELSE 'No' END AS missing_or_degraded_properties FROM cards LEFT JOIN rulings ON cards.uuid = rulings.uuid WHERE cards.artist = 'Stephen Daniele';	card_games
SELECT r.text  FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.name = 'Sublime Epiphany' AND c.number = '74s';	card_games
SELECT      c.name AS card_name,      c.artist AS artist_name,      c.isPromo AS is_promotional_printing,      COUNT(r.uuid) AS ruling_count FROM      cards c JOIN      rulings r ON c.uuid = r.uuid GROUP BY      c.name, c.artist, c.isPromo ORDER BY      ruling_count DESC LIMIT 1;	card_games
SELECT fd.language  FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE c.name = 'Annul' AND c.number = '29';	card_games
SELECT c.name  FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Japanese';	card_games
SELECT (CAST(COUNT(f.id) AS FLOAT) / (SELECT COUNT(id) FROM foreign_data) * 100) AS percentage FROM foreign_data f WHERE f.language = 'Chinese Simplified';	card_games
SELECT s.name AS set_name, s.totalSetSize AS total_cards FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian';	card_games
SELECT COUNT(DISTINCT type)  FROM cards  WHERE artist = 'Aaron Boyd';	card_games
SELECT keywords  FROM cards  WHERE name = 'Angel of Mercy';	card_games
SELECT COUNT(*)  FROM cards  WHERE power = '*';	card_games
SELECT promoTypes  FROM cards  WHERE name = 'Duress';	card_games
SELECT borderColor  FROM cards  WHERE name = 'Ancestor''s Chosen';	card_games
SELECT originalType  FROM cards  WHERE name = "Ancestor's Chosen";	card_games
SELECT st.language  FROM cards c  JOIN sets s ON s.code = c.setCode  JOIN set_translations st ON st.setCode = s.code  WHERE c.name = 'Angel of Mercy';	card_games
SELECT COUNT(*)  FROM cards  JOIN legalities ON cards.uuid = legalities.uuid  WHERE legalities.status = 'restricted' AND cards.isTextless = 0;	card_games
SELECT r.text  FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.name = 'Condemn';	card_games
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.status = 'restricted' AND cards.isStarter = 1;	card_games
SELECT l.status  FROM legalities l JOIN cards c ON l.uuid = c.uuid WHERE c.name = 'Cloudchaser Eagle';	card_games
SELECT type  FROM cards  WHERE name = 'Benalish Knight';	card_games
SELECT l.format, l.status  FROM legalities l JOIN cards c ON l.uuid = c.uuid WHERE c.name = 'Benalish Knight';	card_games
SELECT DISTINCT c.artist  FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Phyrexian';	card_games
SELECT (CAST(COUNT(id) FILTER (WHERE borderColor = 'borderless') AS FLOAT) / COUNT(id)) * 100 AS percentage_borderless FROM cards;	card_games
SELECT COUNT(DISTINCT c.id)  FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'German' AND c.isReprint = 1;	card_games
SELECT COUNT(*)  FROM cards  JOIN foreign_data ON cards.uuid = foreign_data.uuid  WHERE cards.borderColor = 'borderless' AND foreign_data.language = 'Russian';	card_games
SELECT      (CAST(COUNT(fd.id) AS FLOAT) /      (SELECT COUNT(c.id)       FROM cards c       WHERE c.isStorySpotlight = 1) * 100) AS percentage FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE fd.language = 'French' AND c.isStorySpotlight = 1;	card_games
SELECT COUNT(*)  FROM cards  WHERE toughness = '99';	card_games
SELECT name  FROM cards  WHERE artist = 'Aaron Boyd';	card_games
SELECT COUNT(*)  FROM cards  WHERE borderColor = 'black' AND availability = 'mtgo';	card_games
SELECT id FROM cards WHERE convertedManaCost = 0;	card_games
SELECT layout  FROM cards  WHERE keywords LIKE '%flying%';	card_games
SELECT COUNT(*)  FROM cards  WHERE "originalType" = 'Summon - Angel'  AND "subtypes" IS NOT NULL  AND ',' || "subtypes" || ',' NOT LIKE '%,Angel,%';	card_games
SELECT id  FROM cards  WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT id FROM cards WHERE duelDeck = 'a';	card_games
SELECT edhrecRank  FROM cards  WHERE frameVersion = '2015';	card_games
SELECT DISTINCT c.artist FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Chinese Simplified';	card_games
SELECT c.name  FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.availability = 'paper' AND fd.language = 'Japanese';	card_games
SELECT COUNT(*)  FROM cards  JOIN legalities ON cards.uuid = legalities.uuid  WHERE legalities.status = 'Banned' AND cards.borderColor = 'white';	card_games
SELECT l.uuid, f.language  FROM legalities l JOIN foreign_data f ON l.uuid = f.uuid WHERE l.format = 'legacy';	card_games
SELECT r.date, r.text  FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.name = 'Beacon of Immortality';	card_games
SELECT COUNT(DISTINCT c.id) AS card_count, l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.frameVersion = 'future' AND l.status = 'Legal' GROUP BY l.status;	card_games
SELECT name, colors  FROM cards  WHERE setCode = 'OGW';	card_games
SELECT c.name AS card_name, st.language  FROM cards c  JOIN set_translations st ON c.setCode = st.setCode  WHERE c.setCode = '10E' AND c.convertedManaCost = 5;	card_games
SELECT c.name, r.date FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.originalType = 'Creature - Elf';	card_games
SELECT cards.id, cards.colors, legalities.format FROM cards LEFT JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.id BETWEEN 1 AND 20;	card_games
SELECT c.* FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.originalType = 'Artifact' AND c.colors LIKE '%B%' AND fd.language IS NOT NULL;	card_games
SELECT c.name  FROM cards c  JOIN rulings r ON c.uuid = r.uuid  WHERE c.rarity = 'uncommon'  ORDER BY r.date ASC  LIMIT 3;	card_games
SELECT COUNT(*)  FROM cards  WHERE artist = 'John Avon'  AND cardKingdomFoilId IS NOT NULL  AND cardKingdomId IS NULL;	card_games
SELECT COUNT(*)  FROM cards  WHERE borderColor = 'white'  AND cardKingdomFoilId IS NOT NULL  AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*)  FROM cards  WHERE artist = 'UDON'    AND availability = 'mtgo'    AND hand = '-1';	card_games
SELECT COUNT(*)  FROM cards  WHERE frameVersion = '1993' AND availability = 'paper' AND hasContentWarning = 1;	card_games
SELECT manaCost  FROM cards  WHERE layout = 'normal'  AND frameVersion = '2003'  AND borderColor = 'black'  AND availability = 'mtgo,paper';	card_games
SELECT SUM(convertedManaCost) AS total_unconverted_mana  FROM cards  WHERE artist = 'Rob Alexander';	card_games
SELECT DISTINCT subtypes, supertypes  FROM cards  WHERE availability = 'arena';	card_games
SELECT DISTINCT setCode  FROM set_translations  WHERE language = 'Spanish';	card_games
SELECT (CAST(COUNT(CASE WHEN isOnlineOnly = 1 THEN 1 END) AS FLOAT) / COUNT(id)) * 100 AS percentage FROM cards WHERE frameEffects = 'legendary';	card_games
SELECT      (CAST((SELECT COUNT(id) FROM cards WHERE isStorySpotlight = 1 AND isTextless = 0) AS FLOAT) / CAST((SELECT COUNT(id) FROM cards WHERE isStorySpotlight = 1) AS FLOAT)) * 100 AS percentage,     id FROM cards WHERE isStorySpotlight = 1 AND isTextless = 0;	card_games
SELECT      f.name,      (COUNT(f.id) * 100.0 / (SELECT COUNT(id) FROM foreign_data)) AS percentage FROM      foreign_data f WHERE      f.language = 'Spanish' GROUP BY      f.name;	card_games
SELECT st.language  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE s.baseSetSize = 309;	card_games
SELECT COUNT(*)  FROM sets  JOIN set_translations ON sets.code = set_translations.setCode  WHERE sets.block = 'Commander' AND set_translations.language = 'Portuguese (Brasil)';	card_games
SELECT cards.id  FROM cards  JOIN legalities ON cards.uuid = legalities.uuid  WHERE legalities.status = 'Legal' AND cards.types LIKE '%Creature%' AND cards.types LIKE '%Goblin%';	card_games
SELECT DISTINCT c.subtypes, c.supertypes  FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'German' AND c.subtypes IS NOT NULL AND c.supertypes IS NOT NULL;	card_games
SELECT COUNT(*)  FROM cards  WHERE (power IS NULL OR power = '*')    AND text LIKE '%triggered ability%';	card_games
SELECT COUNT(*)  FROM cards  JOIN legalities ON cards.uuid = legalities.uuid  JOIN rulings ON cards.uuid = rulings.uuid  WHERE legalities.format = 'premodern'  AND rulings.text = 'This is a triggered mana ability.'  AND cards.side IS NULL;	card_games
SELECT c.id  FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.artist = 'Erica Yang' AND l.format = 'pauper' AND l.status = 'Legal' AND c.availability = 'paper';	card_games
SELECT c.artist  FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.text = "Das perfekte Gegenmittel zu einer dichten Formation";	card_games
SELECT fd.name AS foreign_name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'French'    AND c.type LIKE '%Creature%'    AND c.layout = 'normal'    AND c.borderColor = 'black'    AND c.artist = 'Matthew D. Wilson';	card_games
SELECT COUNT(*)  FROM cards  JOIN rulings ON cards.uuid = rulings.uuid  WHERE cards.rarity = 'rare' AND rulings.date = '2007-02-01';	card_games
SELECT st.language, st.translation FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.baseSetSize = 180 AND s.block = 'Ravnica';	card_games
SELECT (COUNT(CASE WHEN c.hasContentWarning = 0 THEN 1 END) * 100.0 / COUNT(c.id)) AS percentage FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.format = 'commander' AND l.status = 'Legal';	card_games
SELECT      (CAST(SUM(CASE WHEN fd.language = 'French' AND (c.power IS NULL OR c.power = '*') THEN 1 ELSE 0 END) AS FLOAT) /      CAST(SUM(CASE WHEN c.power IS NULL OR c.power = '*' THEN 1 ELSE 0 END) AS FLOAT)) * 100 AS percentage FROM      cards c LEFT JOIN      foreign_data fd ON c.uuid = fd.uuid;	card_games
SELECT      (CAST(COUNT(CASE WHEN st.language = 'Japanese' AND s.type = 'expansion' THEN 1 END) AS FLOAT) / COUNT(CASE WHEN st.language = 'Japanese' THEN 1 END)) * 100 AS percentage FROM      set_translations st JOIN      sets s ON st.setCode = s.code;	card_games
SELECT availability  FROM cards  WHERE artist = 'Daren Bader';	card_games
SELECT COUNT(*)  FROM cards  WHERE borderColor = 'borderless'    AND edhrecRank > 12000    AND colors IS NOT NULL;	card_games
SELECT COUNT(*)  FROM cards  WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1;	card_games
SELECT name  FROM cards  WHERE (power IS NULL OR power = '*')    AND promoTypes = 'arenaleague'  ORDER BY name ASC  LIMIT 3;	card_games
SELECT language  FROM foreign_data  WHERE multiverseid = 149934;	card_games
SELECT id  FROM cards  WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL  ORDER BY cardKingdomFoilId ASC  LIMIT 3;	card_games
SELECT (CAST(COUNT(CASE WHEN isTextless = 1 AND layout = 'normal' THEN 1 END) AS FLOAT) / CAST(COUNT(CASE WHEN isTextless = 1 THEN 1 END) AS FLOAT)) * 100 AS proportion FROM cards;	card_games
SELECT number  FROM cards  WHERE side IS NULL AND subtypes LIKE '%Angel%' AND subtypes LIKE '%Wizard%';	card_games
SELECT name  FROM sets  WHERE mtgoCode IS NULL OR mtgoCode = ''  ORDER BY name ASC  LIMIT 3;	card_games
SELECT DISTINCT language FROM set_translations WHERE setCode = 'ARC';	card_games
SELECT sets.name, set_translations.translation  FROM sets  JOIN set_translations ON sets.code = set_translations.setCode  WHERE sets.id = 5;	card_games
SELECT st.language, s.type  FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.id = 206;	card_games
SELECT s.id, s.name  FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian' AND s.block = 'Shadowmoor' ORDER BY s.name ASC LIMIT 2;	card_games
SELECT s.id, s.name  FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.isForeignOnly = 1  AND s.isFoilOnly = 1  AND st.language = 'Japanese';	card_games
SELECT s.name AS set_name, s.baseSetSize  FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Russian' ORDER BY s.baseSetSize DESC LIMIT 1;	card_games
SELECT      (CAST(COUNT(c.id) AS FLOAT) / (SELECT COUNT(id) FROM cards)) * 100 AS percentage FROM cards AS c JOIN set_translations AS st ON c.setCode = st.setCode WHERE st.language = 'Chinese Simplified' AND c.isOnlineOnly = 1;	card_games
SELECT COUNT(*)  FROM sets  WHERE code IN (     SELECT setCode      FROM set_translations      WHERE language = 'Japanese' )  AND (mtgoCode IS NULL OR mtgoCode = '');	card_games
SELECT id  FROM cards  WHERE borderColor = 'black';	card_games
SELECT id FROM cards WHERE frameEffects = 'extendedart';	card_games
SELECT name  FROM cards  WHERE borderColor = 'black' AND isFullArt = 1;	card_games
SELECT language  FROM set_translations  WHERE setCode = (SELECT code FROM sets WHERE id = 174);	card_games
SELECT name FROM sets WHERE code = 'ALL';	card_games
SELECT language  FROM foreign_data  WHERE name = 'A Pedra Fellwar';	card_games
SELECT code  FROM sets  WHERE releaseDate = '2007-07-13';	card_games
SELECT baseSetSize, code  FROM sets  WHERE block IN ('Masques', 'Mirage');	card_games
SELECT code  FROM sets  WHERE type = 'expansion';	card_games
SELECT fd.name AS foreign_name, fd.type AS card_type FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.watermark = 'boros';	card_games
SELECT fd.language, fd.flavorText, c.type FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.watermark = 'colorpie';	card_games
SELECT (COUNT(CASE WHEN c.convertedManaCost = 16 THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Abyssal Horror';	card_games
SELECT code  FROM sets  WHERE type = 'expansion' AND name LIKE '%commander%';	card_games
SELECT foreign_data.name AS foreign_name, foreign_data.type FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.watermark = 'abzan';	card_games
SELECT fd.language, fd.type  FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.watermark = 'azorius';	card_games
SELECT COUNT(*)  FROM cards  WHERE artist = 'Aaron Miller'  AND cardKingdomFoilId IS NOT NULL  AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*)  FROM cards  WHERE availability LIKE '%paper%' AND hand = '3';	card_games
SELECT name  FROM cards  WHERE isTextless = 0;	card_games
SELECT convertedManaCost  FROM cards  WHERE name = 'Ancestor''s Chosen';	card_games
SELECT COUNT(*)  FROM cards  WHERE borderColor = 'white' AND (power = '*' OR power IS NULL);	card_games
SELECT name  FROM cards  WHERE isPromo = 1 AND side IS NOT NULL;	card_games
SELECT subtypes, supertypes  FROM cards  WHERE name = 'Molimo, Maro-Sorcerer';	card_games
SELECT purchaseUrls  FROM cards  WHERE promoTypes = 'bundle';	card_games
SELECT COUNT(DISTINCT artist)  FROM cards  WHERE borderColor = 'black'  AND availability LIKE '%arena%'  AND availability LIKE '%mtgo%';	card_games
SELECT name, convertedManaCost  FROM cards  WHERE name IN ('Serra Angel', 'Shrine Keeper')  ORDER BY convertedManaCost DESC  LIMIT 1;	card_games
SELECT artist  FROM cards  WHERE flavorName = 'Battra, Dark Destroyer';	card_games
SELECT name  FROM cards  WHERE frameVersion = '2003'  ORDER BY convertedManaCost DESC  LIMIT 3;	card_games
SELECT st.translation  FROM set_translations st JOIN sets s ON st.setCode = s.code JOIN cards c ON c.setCode = s.code WHERE st.language = 'Italian' AND c.name = 'Ancestor''s Chosen';	card_games
SELECT COUNT(*)  FROM set_translations  WHERE setCode IN (     SELECT code      FROM sets      WHERE code IN (         SELECT setCode          FROM cards          WHERE name = 'Angel of Mercy'     ) );	card_games
SELECT c.name  FROM cards c JOIN sets s ON c.setCode = s.code JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition';	card_games
SELECT COUNT(*) > 0 AS has_korean_version FROM foreign_data WHERE name = 'Ancestor''s Chosen' AND language = 'Korean';	card_games
SELECT COUNT(*)  FROM cards  WHERE artist = 'Adam Rex'  AND setCode = (SELECT setCode FROM set_translations WHERE translation = 'Hauptset Zehnte Edition');	card_games
SELECT s.baseSetSize  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE st.translation = 'Hauptset Zehnte Edition';	card_games
SELECT st.translation  FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.name = 'Eighth Edition' AND st.language = 'Chinese Simplified';	card_games
SELECT DISTINCT sets.name  FROM cards  JOIN sets ON cards.setCode = sets.code  WHERE cards.name = 'Angel of Mercy' AND sets.mtgoCode IS NOT NULL;	card_games
SELECT sets.releaseDate  FROM sets  JOIN cards ON sets.code = cards.setCode  WHERE cards.name = 'Ancestor''s Chosen';	card_games
SELECT s.type  FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition';	card_games
SELECT COUNT(DISTINCT st.setCode)  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE s.block = 'Ice Age'  AND st.language = 'Italian'  AND st.translation IS NOT NULL;	card_games
SELECT s.name  FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.name = 'Adarkar Valkyrie' AND s.isForeignOnly = 1;	card_games
SELECT COUNT(DISTINCT s.code)  FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian' AND st.translation IS NOT NULL AND s.baseSetSize < 100;	card_games
SELECT COUNT(*)  FROM cards  WHERE setCode = (SELECT code FROM sets WHERE name = 'Coldsnap')  AND borderColor = 'black';	card_games
SELECT c.name  FROM cards c  JOIN sets s ON c.setCode = s.code  WHERE s.name = 'Coldsnap'  AND c.convertedManaCost = (     SELECT MAX(convertedManaCost)      FROM cards      WHERE setCode = c.setCode );	card_games
SELECT DISTINCT artist  FROM cards  WHERE artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy')  AND setCode = 'CSP';	card_games
SELECT *  FROM cards  WHERE setCode = (SELECT code FROM sets WHERE name = 'Coldsnap')  AND number = '4';	card_games
SELECT COUNT(*)  FROM cards AS T1  JOIN sets AS T2 ON T1.setCode = T2.code  WHERE T2.name = 'Coldsnap' AND T1.convertedManaCost > 5 AND (T1.power = '*' OR T1.power IS NULL);	card_games
SELECT fd.flavorText  FROM foreign_data fd  JOIN cards c ON fd.uuid = c.uuid  WHERE fd.language = 'Italian' AND c.name = 'Ancestor''s Chosen';	card_games
SELECT DISTINCT language  FROM foreign_data  WHERE name = "Ancestor's Chosen" AND flavorText IS NOT NULL;	card_games
SELECT foreign_data.type  FROM foreign_data  JOIN cards ON foreign_data.uuid = cards.uuid  WHERE foreign_data.language = 'German' AND cards.name = 'Ancestor''s Chosen';	card_games
SELECT r.text  FROM rulings r JOIN cards c ON r.uuid = c.uuid JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap';	card_games
SELECT fd.name AS ItalianName, c.convertedManaCost FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap' AND fd.language = 'Italian' AND c.convertedManaCost = (     SELECT MAX(convertedManaCost)     FROM cards     WHERE setCode = 'CSP' );	card_games
SELECT r.date  FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.name = 'Reminisce';	card_games
SELECT (CAST(SUM(CASE WHEN c.convertedManaCost = 7 THEN 1 ELSE 0 END) AS FLOAT) / COUNT(c.id)) * 100 AS percentage FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap';	card_games
SELECT (CAST(SUM(CASE WHEN cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) AS FLOAT) / COUNT(cards.id)) * 100 AS percentage_incredibly_powerful_cards FROM cards JOIN sets ON cards.setCode = sets.code WHERE sets.name = 'Coldsnap';	card_games
SELECT code FROM sets WHERE releaseDate = '2017-07-14';	card_games
SELECT keyruneCode FROM sets WHERE code = 'PKHC';	card_games
SELECT mcmId FROM sets WHERE code = 'SS2';	card_games
SELECT mcmName  FROM sets  WHERE releaseDate = '2017-06-09';	card_games
SELECT type  FROM sets  WHERE name = 'From the Vault: Lore';	card_games
SELECT parentCode  FROM sets  WHERE name = 'Commander 2014 Oversized';	card_games
SELECT c.name AS card_name, r.text AS ruling_text,         CASE WHEN c.hasContentWarning = 1 THEN 'Yes' ELSE 'No' END AS has_missing_or_degraded_properties FROM cards c LEFT JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Jim Pavelec';	card_games
SELECT s.releaseDate  FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Evacuation';	card_games
SELECT s.baseSetSize  FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Rinascita di Alara';	card_games
SELECT s.type  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE st.translation = 'Huitième édition';	card_games
SELECT st.translation  FROM set_translations st  JOIN cards c ON st.setCode = c.setCode  JOIN foreign_data fd ON fd.uuid = c.uuid  WHERE fd.name = 'Tendo Ice Bridge' AND st.language = 'French';	card_games
SELECT COUNT(*)  FROM set_translations  WHERE setCode = (SELECT code FROM sets WHERE name = 'Tenth Edition')    AND translation IS NOT NULL;	card_games
SELECT st.translation  FROM set_translations st JOIN sets s ON st.setCode = s.code JOIN cards c ON c.setCode = s.code WHERE st.language = 'Japanese' AND c.name = 'Fellwar Stone';	card_games
SELECT name  FROM cards  WHERE setCode = (SELECT code FROM sets WHERE name = 'Journey into Nyx Hero''s Path') ORDER BY convertedManaCost DESC  LIMIT 1;	card_games
SELECT s.releaseDate  FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Ola de frío';	card_games
SELECT s.type  FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Samite Pilgrim';	card_games
SELECT COUNT(*) FROM cards WHERE setCode = (SELECT code FROM sets WHERE name = 'World Championship Decks 2004')    AND convertedManaCost = 3;	card_games
SELECT st.translation  FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.name = 'Mirrodin' AND st.language = 'Chinese Simplified';	card_games
SELECT      (SUM(CASE WHEN s.isNonFoilOnly = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(st.language)) AS percentage_non_foil FROM      sets s JOIN      set_translations st ON s.code = st.setCode WHERE      st.language = 'Japanese';	card_games
SELECT      (SUM(CASE WHEN c.isOnlineOnly = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS percentage_online_only FROM      cards c JOIN      set_translations st ON c.setCode = st.setCode WHERE      st.language = 'Portuguese (Brazil)';	card_games
SELECT DISTINCT availability  FROM cards  WHERE isTextless = 1 AND artist = 'Aleksi Briclot';	card_games
SELECT id FROM sets WHERE baseSetSize = (SELECT MAX(baseSetSize) FROM sets);	card_games
SELECT artist  FROM cards  WHERE side IS NULL  ORDER BY convertedManaCost DESC  LIMIT 1;	card_games
SELECT MAX(frameEffects) AS mostCommonFrameEffect  FROM cards  WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*)  FROM cards  WHERE (power IS NULL OR power = '*')  AND hasFoil = 0  AND duelDeck = 'a';	card_games
SELECT id  FROM sets  WHERE type = 'commander'  ORDER BY totalSetSize DESC  LIMIT 1;	card_games
SELECT c.name, c.convertedManaCost FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.format = 'duel' ORDER BY c.convertedManaCost DESC LIMIT 10;	card_games
SELECT c.originalReleaseDate, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'mythic' AND l.status = 'Legal' ORDER BY c.originalReleaseDate ASC LIMIT 1;	card_games
SELECT COUNT(*)  FROM cards AS c JOIN foreign_data AS fd ON c.uuid = fd.uuid WHERE c.artist = 'Volkan Baǵa' AND fd.language = 'French';	card_games
SELECT COUNT(*)  FROM cards c WHERE c.rarity = 'rare'    AND c.types = 'Enchantment'    AND c.name = 'Abundance'    AND NOT EXISTS (     SELECT 1      FROM legalities l      WHERE l.uuid = c.uuid AND l.status != 'Legal'   );	card_games
SELECT l.format, c.name  FROM legalities l  JOIN cards c ON l.uuid = c.uuid  WHERE l.status = 'Banned'  AND l.format = (     SELECT format      FROM legalities      WHERE status = 'Banned'      GROUP BY format      ORDER BY COUNT(*) DESC      LIMIT 1 );	card_games
SELECT language  FROM set_translations  WHERE setCode = (SELECT code FROM sets WHERE name = 'Battlebond');	card_games
WITH ArtistCardCount AS (     SELECT artist, COUNT(*) AS card_count     FROM cards     WHERE artist IS NOT NULL     GROUP BY artist ), LeastIllustrator AS (     SELECT artist     FROM ArtistCardCount     WHERE card_count = (SELECT MIN(card_count) FROM ArtistCardCount) ) SELECT DISTINCT l.format FROM legalities l JOIN cards c ON l.uuid = c.uuid WHERE c.artist = (SELECT artist FROM LeastIllustrator);	card_games
SELECT l.status  FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.frameVersion = '1997'    AND c.artist = 'D. Alexander Gregory'    AND c.hasContentWarning = 1    AND l.format = 'legacy';	card_games
SELECT cards.name, legalities.format  FROM cards  JOIN legalities ON cards.uuid = legalities.uuid  WHERE cards.edhrecRank = 1 AND legalities.status = 'Banned';	card_games
WITH SetsInRange AS (     SELECT *      FROM sets      WHERE releaseDate BETWEEN '2012-01-01' AND '2015-12-31' ), LanguageCount AS (     SELECT language, COUNT(language) AS language_count     FROM set_translations     GROUP BY language     ORDER BY language_count DESC     LIMIT 1 ) SELECT      (SELECT COUNT(id) FROM SetsInRange) / 4.0 AS annual_average_sets,     (SELECT language FROM LanguageCount) AS common_language;	card_games
SELECT DISTINCT artist  FROM cards  WHERE borderColor = 'black' AND availability = 'arena';	card_games
SELECT uuid  FROM legalities  WHERE format = 'oldschool' AND (status = 'banned' OR status = 'restricted');	card_games
SELECT COUNT(*)  FROM cards  WHERE artist = 'Matthew D. Wilson'  AND availability = 'paper';	card_games
SELECT rulings.text, rulings.date  FROM rulings  JOIN cards ON rulings.uuid = cards.uuid  WHERE cards.artist = 'Kev Walker'  ORDER BY rulings.date DESC;	card_games
SELECT c.name, l.format  FROM cards c JOIN sets s ON c.setCode = s.code JOIN legalities l ON c.uuid = l.uuid WHERE s.name = 'Hour of Devastation' AND l.status = 'Legal';	card_games
SELECT DISTINCT s.name  FROM sets s JOIN set_translations st_korean ON s.code = st_korean.setCode AND st_korean.language = 'Korean' WHERE NOT EXISTS (     SELECT 1      FROM set_translations st_japanese      WHERE s.code = st_japanese.setCode AND st_japanese.language LIKE '%Japanese%' );	card_games
SELECT DISTINCT c.frameVersion, c.name AS card_name, l.format AS banned_format FROM cards c LEFT JOIN legalities l ON c.uuid = l.uuid WHERE c.artist = 'Allen Williams' AND (l.status = 'Banned' OR l.status IS NULL);	card_games
SELECT DisplayName, Reputation  FROM users  WHERE DisplayName IN ('Harlan', 'Jarrod Dixon')  ORDER BY Reputation DESC  LIMIT 1;	codebase_community
SELECT DisplayName  FROM users  WHERE strftime('%Y', CreationDate) = '2011';	codebase_community
SELECT COUNT(*)  FROM users  WHERE LastAccessDate > '2014-09-01';	codebase_community
SELECT DisplayName  FROM users  ORDER BY Views DESC  LIMIT 1;	codebase_community
SELECT COUNT(*) FROM users WHERE UpVotes > 100 AND DownVotes > 1;	codebase_community
SELECT COUNT(*)  FROM users  WHERE Views > 10 AND strftime('%Y', CreationDate) > '2013';	codebase_community
SELECT COUNT(*) AS PostCount FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie');	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT u.DisplayName  FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Eliciting priors from experts';	codebase_community
SELECT p.Title  FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' ORDER BY p.ViewCount DESC LIMIT 1;	codebase_community
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts);	codebase_community
SELECT SUM(p.CommentCount) AS TotalComments FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT p.AnswerCount  FROM posts p JOIN users u ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'csgillespie' ORDER BY p.AnswerCount DESC LIMIT 1;	codebase_community
SELECT u.DisplayName  FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE p.Title = 'Examples for teaching: Correlation does not mean causation';	codebase_community
SELECT COUNT(*) AS RootPostCount FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie') AND ParentId IS NULL;	codebase_community
SELECT DISTINCT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ClosedDate IS NOT NULL;	codebase_community
SELECT COUNT(*) AS PostCount FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.Age > 65 AND p.Score >= 20;	codebase_community
SELECT u.Location FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Eliciting priors from experts' LIMIT 1;	codebase_community
SELECT Body  FROM posts  WHERE Id = (SELECT ExcerptPostId FROM tags WHERE TagName = 'bayesian');	codebase_community
SELECT Body  FROM posts  WHERE Id = (SELECT ExcerptPostId              FROM tags              WHERE Count = (SELECT MAX(Count) FROM tags));	codebase_community
SELECT COUNT(*) AS BadgeCount FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie');	codebase_community
SELECT b.Name  FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT COUNT(*) AS BadgeCount FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie' AND strftime('%Y', b.Date) = '2011';	codebase_community
SELECT u.DisplayName  FROM users u JOIN badges b ON u.Id = b.UserId GROUP BY u.Id, u.DisplayName ORDER BY COUNT(b.Id) DESC LIMIT 1;	codebase_community
SELECT AVG(p.Score) AS AverageScore FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT CAST(COUNT(b.Id) AS FLOAT) / COUNT(DISTINCT u.Id) AS AverageBadges FROM users u LEFT JOIN badges b ON u.Id = b.UserId WHERE u.Views > 200;	codebase_community
SELECT      (CAST(COUNT(p.Id) FILTER (WHERE u.Age > 65) AS FLOAT) / COUNT(p.Id)) * 100 AS Percentage FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      p.Score > 5;	codebase_community
SELECT COUNT(*) AS VoteCount FROM votes JOIN posts ON votes.PostId = posts.Id WHERE posts.OwnerUserId = 58 AND votes.CreationDate = '2010-07-19';	codebase_community
SELECT CreationDate  FROM votes  GROUP BY CreationDate  ORDER BY COUNT(Id) DESC  LIMIT 1;	codebase_community
SELECT COUNT(Id) AS NumberOfRevivalBadges  FROM badges  WHERE Name = 'Teacher';	codebase_community
SELECT p.Title  FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.Score = (SELECT MAX(Score) FROM comments);	codebase_community
SELECT CommentCount  FROM posts  WHERE ViewCount = 1910;	codebase_community
SELECT p.FavoriteCount FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.UserId = 3025 AND c.CreationDate = '2014-04-23 20:29:39.0';	codebase_community
SELECT c.Text  FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Id = 107829 AND p.CommentCount = 1;	codebase_community
SELECT      p.ClosedDate IS NOT NULL AS WellFinished FROM      comments c JOIN      posts p ON c.PostId = p.Id WHERE      c.UserId = 23853      AND c.CreationDate = '2013-07-12 09:08:18.0';	codebase_community
SELECT u.Reputation  FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Id = 65041;	codebase_community
SELECT COUNT(*) AS PostCount FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Tiago Pasqualini');	codebase_community
SELECT u.DisplayName FROM votes v LEFT JOIN users u ON v.UserId = u.Id WHERE v.Id = 6347;	codebase_community
SELECT COUNT(*) AS NumberOfVotes FROM votes v JOIN posts p ON v.PostId = p.Id WHERE p.Title LIKE '%data visualization%';	codebase_community
SELECT b.Name  FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'DatEpicCoderGuyWhoPrograms';	codebase_community
SELECT      CAST(COUNT(posts.Id) AS FLOAT) / COUNT(votes.Id) AS TimesOfPostsToVotes FROM      posts LEFT JOIN      votes ON posts.OwnerUserId = votes.UserId WHERE      posts.OwnerUserId = 24;	codebase_community
SELECT ViewCount  FROM posts  WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer';	codebase_community
SELECT Text  FROM comments  WHERE Score = 17;	codebase_community
SELECT DisplayName  FROM users  WHERE WebsiteUrl = 'http://stackoverflow.com';	codebase_community
SELECT b.Name  FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'SilentGhost';	codebase_community
SELECT u.DisplayName  FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Text = 'Define "valuable"...';	codebase_community
SELECT c.Text FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.DisplayName = 'A Lion';	codebase_community
SELECT u.DisplayName, u.Reputation FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Understanding what Dassault iSight is doing?';	codebase_community
SELECT c.Text  FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'How does gentle boosting differ from AdaBoost?';	codebase_community
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Teacher' LIMIT 10;	codebase_community
SELECT u.DisplayName  FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE p.Title = 'Open source tools for visualizing multi-dimensional data';	codebase_community
SELECT Title  FROM posts  WHERE LastEditorUserId = (SELECT Id FROM users WHERE DisplayName = 'Vebjorn Ljosa');	codebase_community
SELECT SUM(p.Score) AS TotalScore, u.WebsiteUrl FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Yevgeny';	codebase_community
SELECT c.* FROM comments c JOIN posts p ON c.PostId = p.Id JOIN postHistory ph ON p.Id = ph.PostId WHERE p.Title = 'Why square the difference instead of taking the absolute value in standard deviation?'   AND ph.UserId = c.UserId;	codebase_community
SELECT SUM(v.BountyAmount) AS TotalBountyAmount FROM posts p JOIN votes v ON p.Id = v.PostId WHERE p.Title LIKE '%data%'   AND v.BountyAmount IS NOT NULL;	codebase_community
SELECT u.DisplayName  FROM votes v JOIN posts p ON v.PostId = p.Id JOIN users u ON v.UserId = u.Id WHERE p.Title LIKE '%variance%';	codebase_community
SELECT      p.Title,      c.Text,      AVG(p.ViewCount) AS AverageViewCount FROM      posts p JOIN      tags t ON p.Id = t.ExcerptPostId LEFT JOIN      comments c ON c.PostId = p.Id WHERE      t.TagName = 'humor' GROUP BY      p.Title;	codebase_community
SELECT COUNT(*) AS TotalComments  FROM comments  WHERE UserId = 13;	codebase_community
SELECT Id AS UserId  FROM users  ORDER BY Reputation DESC  LIMIT 1;	codebase_community
SELECT Id  FROM users  WHERE Views = (SELECT MIN(Views) FROM users);	codebase_community
SELECT COUNT(DISTINCT UserId) AS UserCount FROM badges WHERE Name = 'Supporter' AND CAST(strftime('%Y', Date) AS INTEGER) = 2011;	codebase_community
SELECT COUNT(*)  FROM (     SELECT UserId      FROM badges      WHERE UserId IS NOT NULL      GROUP BY UserId      HAVING COUNT(*) > 5 ) AS users_with_badges;	codebase_community
SELECT COUNT(DISTINCT u.Id) AS UserCount FROM users u JOIN badges b1 ON u.Id = b1.UserId AND b1.Name = 'Teacher' WHERE u.Location = 'New York';	codebase_community
SELECT u.DisplayName, u.Reputation FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Id = 1;	codebase_community
SELECT u.Id AS UserId, u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId JOIN (     SELECT UserId, PostId, COUNT(*) AS HistoryCount     FROM postHistory     GROUP BY UserId, PostId     HAVING COUNT(*) = 1 ) ph ON u.Id = ph.UserId AND p.Id = ph.PostId WHERE p.ViewCount >= 1000;	codebase_community
SELECT u.DisplayName, b.Name AS Badge, COUNT(c.Id) AS CommentCount FROM users u JOIN comments c ON u.Id = c.UserId LEFT JOIN badges b ON u.Id = b.UserId GROUP BY u.Id, b.Name ORDER BY COUNT(c.Id) DESC;	codebase_community
SELECT COUNT(DISTINCT u.Id) AS UserCount FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'India' AND b.Name = 'Teacher';	codebase_community
SELECT      (         (COUNT(CASE WHEN strftime('%Y', Date) = '2010' THEN 1 END) * 100.0 / COUNT(CASE WHEN Name = 'Student' THEN 1 END))          -          (COUNT(CASE WHEN strftime('%Y', Date) = '2011' THEN 1 END) * 100.0 / COUNT(CASE WHEN Name = 'Student' THEN 1 END))     ) AS PercentageDifference FROM badges WHERE Name = 'Student';	codebase_community
SELECT GROUP_CONCAT(DISTINCT PostHistoryTypeId) AS PostHistoryTypeIds FROM postHistory WHERE PostId = 3720;  SELECT COUNT(DISTINCT UserId) AS UniqueCommenters FROM comments WHERE PostId = 3720;	codebase_community
SELECT p.*, p.ViewCount AS Popularity FROM posts p JOIN postLinks pl ON p.Id = pl.RelatedPostId WHERE pl.PostId = 61217;	codebase_community
SELECT p.Score, pl.LinkTypeId FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE p.Id = 395;	codebase_community
SELECT Id AS PostId, OwnerUserId AS UserId FROM posts WHERE Score > 60;	codebase_community
SELECT SUM(FavoriteCount) AS TotalFavoriteCount FROM posts WHERE OwnerUserId = 686 AND strftime('%Y', CreationDate) = '2011';	codebase_community
SELECT      SUM(u.UpVotes) * 1.0 / COUNT(u.Id) AS AverageUpVotes,      SUM(u.Age) * 1.0 / COUNT(u.Id) AS AverageAge FROM      users u WHERE      (SELECT COUNT(p.Id) FROM posts p WHERE p.OwnerUserId = u.Id) > 10;	codebase_community
SELECT COUNT(DISTINCT UserId) AS UserCount FROM badges WHERE Name = 'Announcer';	codebase_community
SELECT Name  FROM badges  WHERE Date = '2010-07-19 19:39:07.0';	codebase_community
SELECT COUNT(*) AS PositiveCommentsCount FROM comments WHERE Score > 60;	codebase_community
SELECT Text  FROM comments  WHERE CreationDate = '2010-07-19 19:16:14.0';	codebase_community
SELECT COUNT(Id) AS PostCount FROM posts WHERE Score = 10;	codebase_community
SELECT b.Name  FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT u.Reputation FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Date = '2010-07-19 19:39:07.0';	codebase_community
SELECT b.Name  FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Pierre';	codebase_community
SELECT b.Date FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Location = 'Rochester, NY';	codebase_community
SELECT      (CAST(COUNT(DISTINCT CASE WHEN b.Name = 'Teacher' THEN b.UserId END) AS FLOAT) / COUNT(DISTINCT b.UserId)) * 100 AS Percentage FROM      badges b;	codebase_community
SELECT      (CAST(SUM(CASE WHEN u.Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS FLOAT) / COUNT(u.Id)) * 100 AS TeenagerPercentage FROM      badges b JOIN      users u ON b.UserId = u.Id WHERE      b.Name = 'Organizer';	codebase_community
SELECT c.Score AS CommentRatingScore  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE p.CreationDate = '2010-07-19 19:19:56.0';	codebase_community
SELECT c.Text  FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.CreaionDate = '2010-07-19 19:37:33.0';	codebase_community
SELECT u.Age  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE u.Location = 'Vienna, Austria';	codebase_community
SELECT COUNT(*) AS AdultSupporters FROM badges JOIN users ON badges.UserId = users.Id WHERE badges.Name = 'Teacher' AND users.Age BETWEEN 19 AND 65;	codebase_community
SELECT SUM(u.Views) AS TotalViews FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Date = '2010-07-19 19:39:07.0';	codebase_community
SELECT DISTINCT b.Name  FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MIN(Reputation) FROM users);	codebase_community
SELECT b.Name  FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Sharpie';	codebase_community
SELECT COUNT(*) AS ElderSupporterCount FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age > 65;	codebase_community
SELECT DisplayName FROM users WHERE Id = 30;	codebase_community
SELECT COUNT(*) AS UserCount FROM users WHERE Location = 'New York';	codebase_community
SELECT COUNT(*) AS TotalVotes FROM votes WHERE strftime('%Y', CreationDate) = '2010';	codebase_community
SELECT COUNT(*) AS AdultUsersCount FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT DisplayName  FROM users  WHERE Views = (SELECT MAX(Views) FROM users);	codebase_community
SELECT      CAST(COUNT(CASE WHEN strftime('%Y', CreationDate) = '2010' THEN Id END) AS FLOAT) /      COUNT(CASE WHEN strftime('%Y', CreationDate) = '2011' THEN Id END) AS VoteRatio FROM votes;	codebase_community
SELECT DISTINCT t.TagName FROM tags t JOIN posts p ON ',' || p.Tags || ',' LIKE '%,' || t.TagName || ',%' JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'John Salvatier';	codebase_community
SELECT COUNT(*) AS PostCount FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'Daniel Vassallo';	codebase_community
SELECT COUNT(*) AS VoteCount FROM votes v JOIN users u ON v.UserId = u.Id WHERE u.DisplayName = 'Harlan';	codebase_community
SELECT Id  FROM posts  WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'slashnick')  ORDER BY AnswerCount DESC  LIMIT 1;	codebase_community
SELECT u.DisplayName, SUM(p.ViewCount) AS Popularity FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE u.DisplayName IN ('Harvey Motulsky', 'Noah Snyder') GROUP BY u.DisplayName ORDER BY Popularity DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM posts p JOIN users u ON p.OwnerUserId = u.Id JOIN votes v ON p.Id = v.PostId WHERE u.DisplayName = 'Matt Parker' GROUP BY p.Id HAVING COUNT(v.Id) > 4;	codebase_community
SELECT COUNT(c.Id) AS NegativeCommentsCount FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON p.OwnerUserId = u.Id WHERE c.Score < 60 AND u.DisplayName = 'Neil McGuigan';	codebase_community
SELECT DISTINCT t.TagName FROM posts p JOIN tags t ON ',' || p.Tags || ',' LIKE '%,' || t.TagName || ',%' JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Mark Meckes' AND p.CommentCount = 0;	codebase_community
SELECT u.DisplayName  FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Organizer';	codebase_community
SELECT      (CAST(COUNT(p.Id) AS FLOAT) /      (SELECT COUNT(Id) FROM posts WHERE OwnerDisplayName = 'Community')) * 100 AS percentage FROM posts p WHERE INSTR(p.Tags, '<r>') > 0 AND p.OwnerDisplayName = 'Community';	codebase_community
SELECT      (SELECT SUM(ViewCount) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Mornington') AND ViewCount IS NOT NULL) -      (SELECT SUM(ViewCount) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Amos') AND ViewCount IS NOT NULL) AS ViewCountDifference;	codebase_community
SELECT COUNT(DISTINCT UserId) AS UserCount FROM badges WHERE Name = 'Commentator' AND strftime('%Y', Date) = '2014';	codebase_community
SELECT COUNT(*)  FROM posts  WHERE CreaionDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59';	codebase_community
SELECT DisplayName, Age  FROM users  WHERE Views = (SELECT MAX(Views) FROM users);	codebase_community
SELECT LastEditDate, LastEditorUserId  FROM posts  WHERE Title = 'Detecting a given face in a database of facial images';	codebase_community
SELECT COUNT(*)  FROM comments  WHERE UserId = 13 AND Score < 60;	codebase_community
SELECT p.Title, u.DisplayName FROM posts p JOIN comments c ON p.Id = c.PostId JOIN users u ON c.UserId = u.Id WHERE c.Score > 60;	codebase_community
SELECT b.Name  FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Location = 'North Pole' AND strftime('%Y', b.Date) = '2011';	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.FavoriteCount > 150;	codebase_community
SELECT      p.Title,      COUNT(ph.Id) AS PostHistoryCount,      p.LastEditDate  FROM      posts p  LEFT JOIN      postHistory ph ON p.Id = ph.PostId  WHERE      p.Title = 'What is the best introductory Bayesian statistics textbook?'  GROUP BY      p.Title;	codebase_community
SELECT u.LastAccessDate, u.Location FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Outliers';	codebase_community
SELECT p.Title  FROM posts p JOIN postLinks pl ON p.Id = pl.RelatedPostId WHERE pl.PostId = (     SELECT Id      FROM posts      WHERE Title = 'How to tell if something happened in a data set which monitors a value over time' );	codebase_community
SELECT DISTINCT p.Id AS PostId, b.Name AS BadgeName FROM users u JOIN posts p ON u.Id = p.OwnerUserId JOIN badges b ON u.Id = b.UserId WHERE u.DisplayName = 'Samuel'  AND p.CreationDate BETWEEN '2013-01-01' AND '2013-12-31'  AND b.Date BETWEEN '2013-01-01' AND '2013-12-31';	codebase_community
SELECT p.OwnerDisplayName  FROM posts p  WHERE p.ViewCount = (SELECT MAX(ViewCount) FROM posts);	codebase_community
SELECT u.DisplayName, u.Location  FROM users u JOIN posts p ON u.Id = p.OwnerUserId JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'bayesian';	codebase_community
SELECT p.Title AS RelatedPostTitle, pl.LinkTypeId FROM posts p JOIN postLinks pl ON p.Id = pl.RelatedPostId WHERE pl.PostId = (SELECT Id FROM posts WHERE Title = 'What are principal component scores?');	codebase_community
SELECT p_parent.OwnerDisplayName  FROM posts p_child  JOIN posts p_parent ON p_child.ParentId = p_parent.Id  WHERE p_child.Score = (SELECT MAX(Score) FROM posts WHERE ParentId IS NOT NULL);	codebase_community
SELECT u.DisplayName, u.WebsiteUrl  FROM votes v  JOIN users u ON v.UserId = u.Id  WHERE v.VoteTypeId = 8 AND v.BountyAmount = (SELECT MAX(BountyAmount) FROM votes WHERE VoteTypeId = 8);	codebase_community
SELECT Title  FROM posts  ORDER BY ViewCount DESC  LIMIT 5;	codebase_community
SELECT COUNT(*)  FROM tags  WHERE Count BETWEEN 5000 AND 7000;	codebase_community
SELECT OwnerUserId  FROM posts  WHERE FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts);	codebase_community
SELECT Age  FROM users  WHERE Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT COUNT(DISTINCT posts.Id) AS PostCount FROM posts JOIN votes ON posts.Id = votes.PostId WHERE strftime('%Y', votes.CreationDate) = '2011' AND votes.BountyAmount = 50;	codebase_community
SELECT Id FROM users WHERE Age = (SELECT MIN(Age) FROM users);	codebase_community
SELECT SUM(Score) AS TotalScore FROM posts WHERE LasActivityDate LIKE '2010-07-19%';	codebase_community
SELECT COUNT(pl.Id) / 12 AS AvgMonthlyLinksCreated FROM postLinks pl JOIN posts p ON pl.PostId = p.Id WHERE strftime('%Y', pl.CreationDate) = '2010' AND p.AnswerCount <= 2;	codebase_community
SELECT p.Id  FROM posts p JOIN votes v ON p.Id = v.PostId WHERE v.UserId = 1465 ORDER BY (     SELECT COUNT(*)      FROM votes v2      WHERE v2.PostId = p.Id ) DESC LIMIT 1;	codebase_community
SELECT p.Title  FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.CreationDate = (SELECT MIN(CreationDate) FROM postLinks);	codebase_community
SELECT u.DisplayName  FROM users u JOIN badges b ON u.Id = b.UserId GROUP BY u.Id, u.DisplayName ORDER BY COUNT(b.Name) DESC LIMIT 1;	codebase_community
SELECT MIN(v.CreationDate) AS FirstVoteDate FROM users u JOIN votes v ON u.Id = v.UserId WHERE u.DisplayName = 'chl' AND v.UserId IS NOT NULL;	codebase_community
SELECT MIN(p.CreationDate) AS FirstPostDate FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE u.Age = (SELECT MIN(Age) FROM users);	codebase_community
SELECT u.DisplayName  FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Teacher' ORDER BY b.Date ASC LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT u.Id) AS UserCount  FROM users u  JOIN posts p ON u.Id = p.OwnerUserId  WHERE u.Location = 'United Kingdom' AND p.FavoriteCount IS NOT NULL  GROUP BY u.Id  HAVING SUM(p.FavoriteCount) >= 4;	codebase_community
SELECT AVG(PostCount) AS AveragePostsVoted FROM (     SELECT COUNT(v.PostId) AS PostCount     FROM votes v     WHERE v.UserId = (SELECT u.Id FROM users u WHERE u.Age = (SELECT MAX(Age) FROM users)) ) AS PostCounts;	codebase_community
SELECT DisplayName  FROM users  WHERE Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT COUNT(*)  FROM users  WHERE Reputation > 2000 AND Views > 1000;	codebase_community
SELECT DisplayName  FROM users  WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT COUNT(*) AS PostCount  FROM posts  JOIN users ON posts.OwnerUserId = users.Id  WHERE users.DisplayName = 'Jay Stevens' AND strftime('%Y', posts.CreationDate) = '2010';	codebase_community
SELECT Id, Title  FROM posts  WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Harvey Motulsky')  ORDER BY ViewCount DESC  LIMIT 1;	codebase_community
SELECT p.Id, p.Title, u.DisplayName  FROM posts p  JOIN users u  ON p.OwnerUserId = u.Id  WHERE p.Score = (SELECT MAX(Score) FROM posts);	codebase_community
SELECT      CASE          WHEN EXISTS (SELECT 1 FROM users WHERE DisplayName = 'Stephen Turner') THEN              (SELECT AVG(Score) AS AverageScore FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Stephen Turner'))         ELSE              NULL     END AS AverageScore;	codebase_community
SELECT DISTINCT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.ViewCount > 20000 AND strftime('%Y', p.CreationDate) = '2011';	codebase_community
SELECT p.Id, u.DisplayName  FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE strftime('%Y', p.CreationDate) = '2010' AND p.FavoriteCount IS NOT NULL  ORDER BY p.FavoriteCount DESC  LIMIT 1;	codebase_community
SELECT      (CAST(COUNT(p.Id) AS FLOAT) / (SELECT COUNT(Id) FROM posts) * 100) AS Percentage FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE strftime('%Y', p.CreationDate) = '2011' AND u.Reputation > 1000;	codebase_community
SELECT (CAST(COUNT(Id) FILTER (WHERE Age BETWEEN 13 AND 18) AS FLOAT) / COUNT(Id)) * 100 AS percentage FROM users;	codebase_community
SELECT p.ViewCount AS TotalViews, u.DisplayName AS LastPosterName FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE p.Title = 'Computer Game Datasets';	codebase_community
SELECT COUNT(*) AS TotalPosts  FROM posts  WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts);	codebase_community
SELECT COUNT(*) AS CommentCount FROM comments WHERE PostId = (SELECT Id FROM posts WHERE Score = (SELECT MAX(Score) FROM posts));	codebase_community
SELECT COUNT(*) AS NumberOfPosts FROM posts WHERE ViewCount > 35000 AND CommentCount = 0;	codebase_community
SELECT u.DisplayName, u.Location  FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE p.Id = 183 AND p.LastEditDate = (SELECT MAX(LastEditDate) FROM posts WHERE Id = 183);	codebase_community
SELECT b.Name  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.DisplayName = 'Emmett'  AND b.Date = (SELECT MAX(Date) FROM badges WHERE UserId = u.Id);	codebase_community
SELECT COUNT(*) AS AdultUsersCount FROM users WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000;	codebase_community
SELECT julianday(badges.Date) - julianday(users.CreationDate) AS DaysToBadge FROM users JOIN badges ON users.Id = badges.UserId WHERE users.DisplayName = 'Zolomon';	codebase_community
SELECT      u.Id AS UserId,     (SELECT COUNT(*) FROM posts WHERE OwnerUserId = u.Id) AS PostCount,     (SELECT COUNT(*) FROM comments WHERE UserId = u.Id) AS CommentCount FROM      users u WHERE      u.CreationDate = (SELECT MAX(CreationDate) FROM users);	codebase_community
SELECT c.Text, u.DisplayName FROM comments c JOIN posts p ON c.PostId = p.Id LEFT JOIN users u ON c.UserId = u.Id WHERE p.Title = 'Analysing wind data with R' ORDER BY c.CreationDate DESC LIMIT 10;	codebase_community
SELECT COUNT(*) AS UserCount FROM badges WHERE Name = 'Citizen Patrol';	codebase_community
SELECT COUNT(*)  FROM posts  WHERE Id IN (     SELECT WikiPostId      FROM tags      WHERE TagName = 'careers' );	codebase_community
SELECT Reputation, Views  FROM users  WHERE DisplayName = 'Jarrod Dixon';	codebase_community
SELECT      (SELECT COUNT(*)       FROM comments c      JOIN posts p ON c.PostId = p.Id      WHERE p.Title = 'Clustering 1D data' AND c.UserId IS NOT NULL) AS CommentCount,     (SELECT COUNT(*)       FROM posts p      JOIN posts parent ON p.ParentId = parent.Id      WHERE parent.Title = 'Clustering 1D data' AND p.OwnerUserId IS NOT NULL) AS AnswerCount;	codebase_community
SELECT CreationDate  FROM users  WHERE DisplayName = 'IrishStat';	codebase_community
SELECT COUNT(DISTINCT PostId) AS NumberOfPosts FROM votes WHERE BountyAmount >= 30;	codebase_community
SELECT      (CAST(SUM(CASE WHEN posts.Score > 50 THEN 1 ELSE 0 END) AS FLOAT) / COUNT(posts.Id)) * 100 AS Percentage FROM      posts WHERE      posts.OwnerUserId = (         SELECT              Id          FROM              users          ORDER BY              Reputation DESC          LIMIT 1     );	codebase_community
SELECT COUNT(*)  FROM posts  WHERE Score < 20;	codebase_community
SELECT COUNT(*)  FROM tags  WHERE Id < 15 AND Count <= 20;	codebase_community
SELECT ExcerptPostId, WikiPostId  FROM tags  WHERE TagName = 'sample';	codebase_community
SELECT u.Reputation, u.UpVotes FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'Define "valuable"...';	codebase_community
SELECT c.Text  FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title LIKE '%linear regression%';	codebase_community
SELECT c.Text  FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ViewCount BETWEEN 100 AND 150 ORDER BY c.Score DESC LIMIT 1;	codebase_community
SELECT u.CreationDate, u.Age  FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text LIKE '%http://%';	codebase_community
SELECT COUNT(*) FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.Score = 0 AND p.ViewCount IS NOT NULL AND p.ViewCount < 5;	codebase_community
SELECT COUNT(c.Id) AS ZeroScoreComments FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.CommentCount = 1 AND c.Score = 0;	codebase_community
SELECT COUNT(DISTINCT u.Id) AS TotalUsers FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score = 0 AND u.Age = 40;	codebase_community
SELECT p.Id AS PostId, c.Text AS CommentText FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Title = 'Group differences on a five point Likert item';	codebase_community
SELECT u.UpVotes  FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'Define "valuable"...';	codebase_community
SELECT c.Text  FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky';	codebase_community
SELECT DISTINCT u.DisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score BETWEEN 1 AND 5   AND u.DownVotes = 0;	codebase_community
SELECT      CASE WHEN COUNT(c.UserId) > 0 THEN          (CAST(SUM(CASE WHEN u.UpVotes = 0 THEN 1 ELSE 0 END) AS FLOAT) /          COUNT(c.UserId)) * 100      ELSE 0 END AS Percentage  FROM comments c  JOIN users u ON c.UserId = u.Id  WHERE c.Score BETWEEN 5 AND 10;	codebase_community
SELECT sp.power_name  FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id JOIN superhero sh ON hp.hero_id = sh.id WHERE sh.superhero_name = '3-D Man';	superhero
SELECT COUNT(DISTINCT hero_id) AS superhero_count FROM hero_power JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Super Strength';	superhero
SELECT COUNT(*)  FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Super Strength' AND s.height_cm > 200;	superhero
SELECT s.full_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id GROUP BY s.full_name HAVING COUNT(hp.power_id) > 15;	superhero
SELECT COUNT(*) AS superhero_count FROM superhero WHERE eye_colour_id = (SELECT id FROM colour WHERE colour = 'Black/Blue');	superhero
SELECT colour.colour  FROM superhero  JOIN colour ON superhero.skin_colour_id = colour.id  WHERE superhero.superhero_name = 'Apocalypse';	superhero
SELECT COUNT(DISTINCT hero_id)  FROM hero_power  WHERE power_id = (SELECT id FROM superpower WHERE power_name = 'Agility') AND hero_id IN (SELECT id FROM superhero WHERE eye_colour_id = (SELECT id FROM colour WHERE colour = 'Black/Blue'));	superhero
SELECT s.superhero_name FROM superhero s JOIN colour e ON s.eye_colour_id = e.id JOIN colour h ON s.hair_colour_id = h.id JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE e.colour = 'Blue' AND h.colour = 'Blond' AND sp.power_name = 'Agility';	superhero
INSERT INTO publisher VALUES (6, 'Marvel Comics');  SELECT COUNT(*)  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE publisher.publisher_name = 'Marvel Comics';	superhero
SELECT superhero_name, height_cm FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher_name = 'DC Comics' ORDER BY height_cm DESC;	superhero
SELECT publisher.publisher_name FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.superhero_name = 'Sauron';	superhero
SELECT c.colour AS eye_color, COUNT(s.id) AS superhero_count FROM superhero s JOIN colour c ON s.eye_colour_id = c.id JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics' GROUP BY c.colour ORDER BY superhero_count DESC;	superhero
SELECT AVG(height_cm) AS average_height FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'ABC Studios');	superhero
INSERT INTO publisher VALUES (6, 'Marvel Comics'); INSERT INTO superpower VALUES (6, 'Super Strength'); INSERT INTO superhero VALUES (5, 'Spider-Man', 'Peter Parker', 1, 4, 4, 1, 1, 6, 1, 178, 75); INSERT INTO hero_power VALUES (5, 6);  SELECT s.superhero_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE p.publisher_name = 'Marvel Comics' AND sp.power_name = 'Super Strength';	superhero
SELECT COUNT(*)  FROM superhero  WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics');	superhero
SELECT publisher.publisher_name  FROM superhero  JOIN hero_attribute ON superhero.id = hero_attribute.hero_id  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE hero_attribute.attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Speed')  AND hero_attribute.attribute_value = (SELECT MIN(attribute_value)  FROM hero_attribute  WHERE attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Speed'));	superhero
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE colour.colour = 'Gold' AND publisher.publisher_name = 'Marvel Comics';	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name = 'Blue Beetle II';	superhero
SELECT COUNT(*)  FROM superhero  WHERE hair_colour_id = (SELECT id FROM colour WHERE colour = 'Blonde');	superhero
SELECT s.superhero_name, s.full_name, ha.attribute_value  FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Intelligence' ORDER BY ha.attribute_value ASC LIMIT 1;	superhero
SELECT race.race  FROM superhero  JOIN race ON superhero.race_id = race.id  WHERE superhero.superhero_name = 'Copycat';	superhero
SELECT s.superhero_name, s.full_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_id = 4 AND ha.attribute_value < 50;	superhero
INSERT INTO `superpower` VALUES (6, 'Death Touch');  SELECT s.superhero_name  FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Death Touch';	superhero
SELECT COUNT(*) AS female_superheroes_with_strength_100 FROM superhero AS s JOIN gender AS g ON s.gender_id = g.id JOIN hero_attribute AS ha ON s.id = ha.hero_id JOIN attribute AS a ON ha.attribute_id = a.id WHERE g.gender = 'Female' AND a.attribute_name = 'Strength' AND ha.attribute_value = 100;	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id GROUP BY s.id ORDER BY COUNT(hp.power_id) DESC LIMIT 1;	superhero
SELECT COUNT(*) AS vampire_superheroes_count FROM superhero JOIN race ON superhero.race_id = race.id WHERE race.race = 'Vampire';	superhero
SELECT      (COUNT(CASE WHEN a.alignment = 'Bad' THEN 1 END) * 100.0 / COUNT(s.id)) AS percentage_self_interest,     COUNT(CASE WHEN a.alignment = 'Bad' AND p.publisher_name = 'Marvel Comics' THEN 1 END) AS marvel_count FROM      superhero s LEFT JOIN      alignment a ON s.alignment_id = a.id LEFT JOIN      publisher p ON s.publisher_id = p.id WHERE      a.alignment = 'Bad';	superhero
SELECT      (COUNT(CASE WHEN p.publisher_name = 'ABC Studios' THEN s.id END) -       COUNT(CASE WHEN p.publisher_name = 'DC Comics' THEN s.id END)) AS difference FROM      superhero s JOIN      publisher p ON s.publisher_id = p.id WHERE      p.publisher_name IN ('ABC Studios', 'DC Comics');	superhero
SELECT id FROM publisher WHERE publisher_name = 'George Lucas';	superhero
SELECT AVG(attribute_value) AS average_attribute_value FROM hero_attribute;	superhero
SELECT COUNT(*) AS total_superheroes_without_full_name  FROM superhero  WHERE full_name IS NULL;	superhero
SELECT colour.colour AS eye_colour FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.id = 75;	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Abin Sur';	superhero
SELECT AVG(weight_kg) AS average_weight FROM superhero WHERE gender_id = (SELECT id FROM gender WHERE gender = 'Female');	superhero
SELECT DISTINCT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id JOIN gender g ON s.gender_id = g.id WHERE g.gender = 'Male' LIMIT 5;	superhero
SELECT superhero_name  FROM superhero  JOIN race ON superhero.race_id = race.id  WHERE race.race = 'Alien';	superhero
SELECT s.superhero_name  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.height_cm BETWEEN 170 AND 190 AND c.colour = 'No Colour';	superhero
SELECT sp.power_name  FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id WHERE hp.hero_id = 56;	superhero
SELECT full_name  FROM superhero  WHERE race_id = (SELECT id FROM race WHERE race = 'Demi-God')  LIMIT 5;	superhero
SELECT COUNT(*)  FROM superhero  WHERE alignment_id = 2;	superhero
SELECT race.race  FROM superhero JOIN race ON superhero.race_id = race.id WHERE superhero.weight_kg = 90;	superhero
SELECT colour.colour  FROM superhero  JOIN race ON superhero.race_id = race.id  JOIN colour ON superhero.hair_colour_id = colour.id  WHERE superhero.height_cm = 185 AND race.race = '-';	superhero
SELECT colour.colour  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE superhero.weight_kg = (SELECT MAX(weight_kg) FROM superhero);	superhero
SELECT (SUM(CASE WHEN publisher.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) * 100.0 / COUNT(superhero.id)) AS percentage FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.height_cm BETWEEN 150 AND 180;	superhero
SELECT s.superhero_name  FROM superhero s  JOIN gender g ON s.gender_id = g.id  WHERE g.gender = 'Male'  AND s.weight_kg > (SELECT AVG(weight_kg) * 0.79 FROM superhero);	superhero
SELECT sp.power_name, COUNT(hp.power_id) AS power_count FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id GROUP BY sp.power_name ORDER BY power_count DESC LIMIT 1;	superhero
SELECT ha.attribute_value  FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = 'Abomination';	superhero
SELECT sp.power_name  FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id WHERE hp.hero_id = 1;	superhero
SELECT COUNT(DISTINCT hero_id) AS hero_count FROM hero_power JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Stealth';	superhero
SELECT s.full_name  FROM superhero s  JOIN hero_attribute ha ON s.id = ha.hero_id  JOIN attribute a ON ha.attribute_id = a.id  WHERE a.attribute_name = 'Strength' AND ha.attribute_value = (SELECT MAX(ha2.attribute_value) FROM hero_attribute ha2 JOIN attribute a2 ON ha2.attribute_id = a2.id WHERE a2.attribute_name = 'Strength');	superhero
SELECT COUNT(superhero.id) * 1.0 / (SELECT COUNT(*) FROM superhero) AS average FROM superhero WHERE skin_colour_id = 1;	superhero
SELECT COUNT(*)  FROM superhero  WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics');	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN publisher p ON s.publisher_id = p.id WHERE a.attribute_name = 'Durability' AND p.publisher_name = 'Dark Horse Comics' ORDER BY ha.attribute_value DESC LIMIT 1;	superhero
SELECT colour.colour  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE superhero.full_name = 'Abraham Sapien';	superhero
INSERT INTO superpower VALUES (6, 'Flight');  SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Flight';	superhero
SELECT c1.colour AS eye_colour, c2.colour AS hair_colour, c3.colour AS skin_colour FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN publisher p ON s.publisher_id = p.id JOIN colour c1 ON s.eye_colour_id = c1.id JOIN colour c2 ON s.hair_colour_id = c2.id JOIN colour c3 ON s.skin_colour_id = c3.id WHERE g.gender = 'Female' AND p.publisher_name = 'Dark Horse Comics';	superhero
SELECT s.superhero_name, p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.hair_colour_id = s.skin_colour_id AND s.hair_colour_id = s.eye_colour_id;	superhero
SELECT race.race  FROM superhero  JOIN race ON superhero.race_id = race.id  WHERE superhero.superhero_name = 'A-Bomb';	superhero
SELECT      (CAST(COUNT(s.id) AS FLOAT) / (SELECT COUNT(id) FROM superhero WHERE gender_id = (SELECT id FROM gender WHERE gender = 'Female'))) * 100 AS percentage FROM superhero s JOIN colour c ON s.skin_colour_id = c.id WHERE s.gender_id = (SELECT id FROM gender WHERE gender = 'Female') AND c.colour = 'Blue';	superhero
SELECT superhero_name, race  FROM superhero  JOIN race ON superhero.race_id = race.id  WHERE full_name = 'Charles Chandler';	superhero
INSERT INTO superhero (id, superhero_name, full_name, gender_id, eye_colour_id, hair_colour_id, skin_colour_id, race_id, publisher_id, alignment_id, height_cm, weight_kg) VALUES (5, 'Agent 13', '-', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);  SELECT gender.gender  FROM superhero  JOIN gender ON superhero.gender_id = gender.id  WHERE superhero.superhero_name = 'Agent 13';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Adaptation';	superhero
SELECT COUNT(*) AS power_count FROM hero_power JOIN superhero ON hero_power.hero_id = superhero.id WHERE superhero.superhero_name = 'Abe Sapien';	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.full_name = 'Hunter Zolomon';	superhero
SELECT superhero.height_cm  FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Amber';	superhero
SELECT s.superhero_name  FROM superhero s JOIN colour e ON s.eye_colour_id = e.id JOIN colour h ON s.hair_colour_id = h.id WHERE e.colour = 'Black' AND h.colour = 'Black';	superhero
SELECT DISTINCT colour.colour AS eye_colour FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.skin_colour_id = (SELECT id FROM colour WHERE colour = 'Gold');	superhero
SELECT full_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Vampire');	superhero
SELECT superhero_name FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Neutral');	superhero
SELECT COUNT(DISTINCT h.hero_id) AS hero_count FROM hero_attribute h JOIN attribute a ON h.attribute_id = a.id WHERE a.attribute_name = 'Strength' AND h.attribute_value = (     SELECT MAX(attribute_value)     FROM hero_attribute h2     JOIN attribute a2 ON h2.attribute_id = a2.id     WHERE a2.attribute_name = 'Strength' );	superhero
SELECT r.race, a.alignment FROM superhero s JOIN race r ON s.race_id = r.id JOIN alignment a ON s.alignment_id = a.id WHERE s.superhero_name = 'Cameron Hicks';	superhero
INSERT INTO `publisher` VALUES (6, 'Marvel Comics');  SELECT      (CAST(COUNT(*) AS FLOAT) /      (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics'))) * 100 AS percentage_female_heroes FROM superhero WHERE gender_id = (SELECT id FROM gender WHERE gender = 'Female') AND publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT AVG(weight_kg) AS average_weight FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Alien');	superhero
SELECT      (SELECT weight_kg FROM superhero WHERE full_name = 'Emil Blonsky') -      (SELECT weight_kg FROM superhero WHERE full_name = 'Charles Chandler') AS weight_difference;	superhero
SELECT AVG(height_cm) AS average_height FROM superhero;	superhero
INSERT INTO `superhero` VALUES (5, 'Abomination', '-', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);  SELECT sp.power_name  FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Abomination';	superhero
SELECT COUNT(*)  FROM superhero  WHERE race_id = 21 AND gender_id = 1;	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' ORDER BY ha.attribute_value DESC LIMIT 1;	superhero
SELECT COUNT(*)  FROM superhero  WHERE alignment_id = 3;	superhero
SELECT attribute.attribute_name, hero_attribute.attribute_value FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE superhero.superhero_name = '3-D Man';	superhero
SELECT s.superhero_name FROM superhero s JOIN colour c_eye ON s.eye_colour_id = c_eye.id JOIN colour c_hair ON s.hair_colour_id = c_hair.id WHERE c_eye.colour = 'Black/Blue' AND c_hair.colour = 'Auburn';	superhero
SELECT publisher.publisher_name  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE superhero.superhero_name IN ('3-D Man', 'Abe Sapien', 'Abin Sur');	superhero
SELECT COUNT(*)  FROM superhero  WHERE publisher_id = 1;	superhero
SELECT (CAST(COUNT(*) AS FLOAT) / (SELECT COUNT(*) FROM superhero) * 100.0) AS percentage_of_blue_eyed_superheroes FROM superhero WHERE eye_colour_id = 7;	superhero
SELECT CAST(SUM(CASE WHEN gender_id = 1 THEN 1 ELSE 0 END) AS FLOAT) /         CAST(SUM(CASE WHEN gender_id = 2 THEN 1 ELSE 0 END) AS FLOAT) AS ratio FROM superhero;	superhero
SELECT superhero_name  FROM superhero  ORDER BY height_cm DESC  LIMIT 1;	superhero
INSERT INTO superpower (id, power_name) VALUES (6, 'Cryokinesis'); SELECT id FROM superpower WHERE power_name = 'Cryokinesis';	superhero
SELECT superhero_name FROM superhero WHERE id = 294;	superhero
SELECT full_name  FROM superhero  WHERE weight_kg = 0 OR weight_kg IS NULL;	superhero
SELECT colour.colour  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE superhero.full_name = 'Karen Beecher-Duncan';	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.full_name = 'Helen Parr';	superhero
SELECT race.race  FROM superhero JOIN race ON superhero.race_id = race.id WHERE superhero.weight_kg = 108 AND superhero.height_cm = 188;	superhero
SELECT publisher.publisher_name  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE superhero.id = 38 AND EXISTS (SELECT 1 FROM superhero WHERE id = 38);	superhero
SELECT r.race  FROM race r JOIN superhero s ON r.id = s.race_id JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute);	superhero
SELECT a.alignment, sp.power_name FROM superhero s JOIN alignment a ON s.alignment_id = a.id JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Atom IV';	superhero
SELECT full_name  FROM superhero  WHERE eye_colour_id = (SELECT id FROM colour WHERE colour = 'Black/Blue')  LIMIT 5;	superhero
SELECT AVG(ha.attribute_value) AS average_attribute_value FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE s.alignment_id = 3;	superhero
SELECT colour.colour AS skin_colour FROM superhero JOIN colour ON superhero.skin_colour_id = colour.id JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE hero_attribute.attribute_value = 100   AND hero_attribute.attribute_id IS NOT NULL;	superhero
SELECT COUNT(*)  FROM superhero  WHERE alignment_id = 1 AND gender_id = 2;	superhero
SELECT s.superhero_name  FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_value BETWEEN 75 AND 80;	superhero
SELECT race.race  FROM superhero  JOIN race ON superhero.race_id = race.id  JOIN colour ON superhero.hair_colour_id = colour.id  JOIN gender ON superhero.gender_id = gender.id  WHERE colour.colour = 'Black/Blue' AND gender.gender = 'Male';	superhero
SELECT (CAST(COUNT(s.id) FILTER (WHERE s.gender_id = 2) AS FLOAT) / COUNT(s.id)) * 100 AS female_percentage FROM superhero s WHERE s.alignment_id = 2;	superhero
SELECT      (SUM(CASE WHEN T2.id = 7 THEN 1 ELSE 0 END) - SUM(CASE WHEN T2.id = 1 THEN 1 ELSE 0 END)) AS difference FROM superhero T1 JOIN colour T2 ON T1.eye_colour_id = T2.id WHERE T1.weight_kg = 0 OR T1.weight_kg IS NULL;	superhero
SELECT ha.attribute_value  FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id JOIN superhero s ON ha.hero_id = s.id WHERE a.attribute_name = 'Strength' AND s.superhero_name = 'Hulk';	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = '3-D Man';	superhero
SELECT COUNT(*) AS green_skinned_villains FROM superhero JOIN colour ON superhero.skin_colour_id = colour.id JOIN alignment ON superhero.alignment_id = alignment.id WHERE colour.colour = 'Green' AND alignment.alignment = 'Bad';	superhero
SELECT COUNT(*)  FROM superhero  WHERE gender_id = (SELECT id FROM gender WHERE gender = 'Female')  AND publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Wind Control' ORDER BY s.superhero_name ASC;	superhero
SELECT g.gender  FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id JOIN gender g ON s.gender_id = g.id WHERE sp.power_name = 'Agility';	superhero
SELECT superhero_name  FROM superhero  WHERE weight_kg = (SELECT MAX(weight_kg)                     FROM superhero                     WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics'));	superhero
SELECT AVG(s.height_cm) AS average_height FROM superhero s JOIN race r ON s.race_id = r.id JOIN publisher p ON s.publisher_id = p.id WHERE r.race <> '-' AND p.publisher_name = 'Dark Horse Comics';	superhero
SELECT COUNT(*) AS fastest_superheroes_count FROM hero_attribute JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Speed' AND hero_attribute.attribute_value = 100;	superhero
SELECT ABS(     (SELECT COUNT(*) FROM superhero s      JOIN publisher p ON s.publisher_id = p.id      WHERE p.publisher_name = 'DC Comics')     -     (SELECT CASE WHEN EXISTS (SELECT 1 FROM publisher WHERE publisher_name = 'Marvel Comics')                   THEN (SELECT COUNT(*) FROM superhero s                        JOIN publisher p ON s.publisher_id = p.id                        WHERE p.publisher_name = 'Marvel Comics')                   ELSE 0 END) ) AS difference;	superhero
SELECT attribute.attribute_name, hero_attribute.attribute_value AS weakest_value FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE superhero.superhero_name = 'Black Panther' ORDER BY hero_attribute.attribute_value ASC LIMIT 1;	superhero
SELECT colour.colour  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE superhero.superhero_name = 'Abomination';	superhero
SELECT superhero_name FROM superhero WHERE height_cm = (SELECT MAX(height_cm) FROM superhero);	superhero
SELECT superhero_name  FROM superhero  WHERE full_name = 'Charles Chandler';	superhero
SELECT      (COUNT(s.id) * 100.0 / (SELECT COUNT(id) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'George Lucas'))) AS female_percentage FROM      superhero s JOIN      gender g ON s.gender_id = g.id WHERE      g.gender = 'Female' AND s.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'George Lucas');	superhero
SELECT      (CAST(COUNT(CASE WHEN a.alignment = 'Good' THEN 1 END) AS FLOAT) / COUNT(s.id)) * 100.0 AS good_superhero_percentage FROM      superhero s JOIN      alignment a ON s.alignment_id = a.id JOIN      publisher p ON s.publisher_id = p.id WHERE      p.publisher_name = 'DC Comics';	superhero
SELECT COUNT(*) AS total_superheroes  FROM superhero  WHERE full_name LIKE 'John%';	superhero
SELECT hero_id  FROM hero_attribute  WHERE attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute);	superhero
SELECT full_name  FROM superhero  WHERE superhero_name = 'Alien';	superhero
SELECT s.full_name FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.weight_kg < 100 AND c.colour = 'Amber';	superhero
SELECT ha.attribute_value FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE s.superhero_name = 'Aquababy';	superhero
SELECT weight_kg, race  FROM superhero  JOIN race ON superhero.race_id = race.id  WHERE superhero.id = 4;	superhero
SELECT AVG(height_cm) AS average_height FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Neutral');	superhero
SELECT DISTINCT hero_attribute.hero_id FROM hero_attribute JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Intelligence';	superhero
SELECT colour.colour  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE superhero.superhero_name = 'Blackwulf';	superhero
SELECT sp.power_name FROM superhero sh JOIN hero_power hp ON sh.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sh.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero);	superhero
SELECT driverRef  FROM drivers  WHERE driverId IN (     SELECT driverId      FROM qualifying      WHERE raceId = 20      ORDER BY CAST(REPLACE(q1, ':', '.') AS REAL) DESC      LIMIT 5 );	formula_1
SELECT d.surname  FROM qualifying q JOIN drivers d ON q.driverId = d.driverId WHERE q.raceId = 19 AND q.q2 = (SELECT MIN(q2) FROM qualifying WHERE raceId = 19);	formula_1
SELECT DISTINCT r.year FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.location = 'Shanghai';	formula_1
SELECT r.url  FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Circuit de Barcelona-Catalunya';	formula_1
SELECT r.name  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE c.country = 'Germany';	formula_1
SELECT ci.position FROM circuits ci WHERE ci.circuitId IN (     SELECT circuitId     FROM races     WHERE raceId IN (         SELECT raceId         FROM results r         JOIN constructors c ON r.constructorId = c.constructorId         WHERE c.name = 'Renault'     ) );	formula_1
SELECT COUNT(*) AS race_count FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year = 2010 AND c.country NOT IN (     'Afghanistan', 'Armenia', 'Azerbaijan', 'Bahrain', 'Bangladesh', 'Bhutan',      'Brunei', 'Cambodia', 'China', 'Cyprus', 'Georgia', 'India', 'Indonesia',      'Iran', 'Iraq', 'Israel', 'Japan', 'Jordan', 'Kazakhstan', 'Kuwait',      'Kyrgyzstan', 'Laos', 'Lebanon', 'Malaysia', 'Maldives', 'Mongolia',      'Myanmar', 'Nepal', 'North Korea', 'Oman', 'Pakistan', 'Palestine',      'Philippines', 'Qatar', 'Saudi Arabia', 'Singapore', 'South Korea',      'Sri Lanka', 'Syria', 'Tajikistan', 'Thailand', 'Timor-Leste', 'Turkey',      'Turkmenistan', 'United Arab Emirates', 'Uzbekistan', 'Vietnam', 'Yemen',     'Albania', 'Andorra', 'Austria', 'Belarus', 'Belgium', 'Bosnia and Herzegovina',      'Bulgaria', 'Croatia', 'Czech Republic', 'Denmark', 'Estonia', 'Faroe Islands',      'Finland', 'France', 'Germany', 'Greece', 'Hungary', 'Iceland', 'Ireland',      'Italy', 'Kosovo', 'Latvia', 'Liechtenstein', 'Lithuania', 'Luxembourg',      'Malta', 'Moldova', 'Monaco', 'Montenegro', 'Netherlands', 'North Macedonia',      'Norway', 'Poland', 'Portugal', 'Romania', 'Russia', 'San Marino', 'Serbia',      'Slovakia', 'Slovenia', 'Spain', 'Sweden', 'Switzerland', 'Ukraine', 'United Kingdom',      'Vatican City' );	formula_1
SELECT races.name  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE circuits.country = 'Spain';	formula_1
SELECT c.lat, c.lng  FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.name = 'Australian Grand Prix';	formula_1
SELECT url  FROM races  WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = 'Sepang International Circuit');	formula_1
SELECT r.time  FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Sepang International Circuit';	formula_1
SELECT circuits.lat, circuits.lng  FROM circuits  JOIN races ON circuits.circuitId = races.circuitId  WHERE races.name = 'Abu Dhabi Grand Prix';	formula_1
SELECT constructors.nationality  FROM constructorResults  JOIN constructors ON constructorResults.constructorId = constructors.constructorId  WHERE constructorResults.raceId = 24 AND constructorResults.points = 1.0;	formula_1
SELECT q.q1  FROM qualifying q JOIN drivers d ON q.driverId = d.driverId WHERE d.forename = 'Bruno' AND d.surname = 'Senna' AND q.raceId = 354;	formula_1
SELECT d.nationality  FROM qualifying q  JOIN drivers d ON q.driverId = d.driverId  WHERE q.q2 = '0:01:40' AND q.raceId = 355;	formula_1
SELECT number  FROM qualifying  WHERE raceId = 18 AND q3 LIKE '1:54%';	formula_1
SELECT COUNT(*) AS not_finished_drivers FROM results WHERE raceId = (SELECT raceId FROM races WHERE name = 'Bahrain Grand Prix' AND year = 2007)   AND time IS NULL;	formula_1
SELECT s.* FROM seasons s JOIN races r ON s.year = r.year WHERE r.raceId = 901;	formula_1
SELECT COUNT(DISTINCT driverId)  FROM results  WHERE raceId IN (SELECT raceId FROM races WHERE date = '2015-11-29')  AND statusId = (SELECT statusId FROM status WHERE status = 'Finished');	formula_1
SELECT d.driverId, d.forename, d.surname, d.dob  FROM drivers d  JOIN results r ON d.driverId = r.driverId  WHERE r.raceId = 592 AND r.time IS NOT NULL  ORDER BY d.dob ASC  LIMIT 1;	formula_1
SELECT d.url  FROM lapTimes lt  JOIN drivers d ON lt.driverId = d.driverId  WHERE lt.raceId = 161 AND lt.time LIKE '1:27%';	formula_1
SELECT d.nationality  FROM results r  JOIN drivers d ON r.driverId = d.driverId  WHERE r.raceId = 933 AND CAST(r.fastestLapSpeed AS FLOAT) = (SELECT MAX(CAST(fastestLapSpeed AS FLOAT)) FROM results WHERE raceId = 933);	formula_1
SELECT circuits.location, circuits.lat, circuits.lng  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE races.name = 'Malaysian Grand Prix';	formula_1
SELECT constructors.url  FROM constructorResults  JOIN constructors ON constructorResults.constructorId = constructors.constructorId  WHERE constructorResults.raceId = 9  ORDER BY constructorResults.points DESC  LIMIT 1;	formula_1
SELECT q1  FROM qualifying  JOIN drivers ON qualifying.driverId = drivers.driverId  WHERE drivers.forename = 'Lucas' AND drivers.surname = 'di Grassi' AND qualifying.raceId = 345;	formula_1
SELECT d.nationality FROM qualifying q JOIN drivers d ON q.driverId = d.driverId WHERE q.raceId = 18 AND q.q2 = '1:25.518';	formula_1
SELECT d.code  FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 45 AND q.q3 LIKE '1:33%';	formula_1
SELECT r.time  FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.forename = 'Bruce' AND d.surname = 'McLaren' AND r.raceId = 743;	formula_1
SELECT d.forename, d.surname  FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'San Marino Grand Prix' AND ra.year = 2006 AND r.position = 2;	formula_1
SELECT s.url  FROM seasons s JOIN races r ON s.year = r.year WHERE r.raceId = 901;	formula_1
SELECT COUNT(DISTINCT driverId)  FROM results  WHERE raceId = (SELECT raceId FROM races WHERE date = '2015-11-29')  AND statusId != (SELECT statusId FROM status WHERE status = 'Finished');	formula_1
SELECT driverId, forename, surname, dob  FROM drivers  WHERE driverId IN (     SELECT driverId      FROM results      WHERE raceId = 872 AND time IS NOT NULL )  ORDER BY dob DESC  LIMIT 1;	formula_1
SELECT d.forename, d.surname FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId WHERE lt.raceId = 348 ORDER BY lt.milliseconds ASC LIMIT 1;	formula_1
SELECT d.nationality  FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE r.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results);	formula_1
SELECT      ((r1.fastestLapSpeed - r2.fastestLapSpeed) / r1.fastestLapSpeed) * 100 AS percentage_faster FROM      results r1 JOIN      drivers d ON r1.driverId = d.driverId JOIN      results r2 ON r2.driverId = d.driverId WHERE      d.forename = 'Paul'      AND d.surname = 'di Resta'      AND r1.raceId = 853      AND r2.raceId = 854;	formula_1
SELECT      (CAST(COUNT(CASE WHEN r.time IS NOT NULL THEN r.driverId END) AS FLOAT) / COUNT(r.driverId)) * 100 AS race_completion_rate  FROM results r JOIN races ra ON r.raceId = ra.raceId WHERE ra.date = '1983-07-16';	formula_1
SELECT year  FROM races  WHERE name = 'Singapore Grand Prix'  ORDER BY year ASC  LIMIT 1;	formula_1
SELECT COUNT(*) AS race_count FROM races WHERE year = 2005; SELECT name FROM races WHERE year = 2005 ORDER BY name DESC;	formula_1
SELECT name  FROM races  WHERE strftime('%Y', date) = (SELECT strftime('%Y', MIN(date)) FROM races)    AND strftime('%m', date) = (SELECT strftime('%m', MIN(date)) FROM races);	formula_1
SELECT name, date  FROM races  WHERE year = 1999 AND round = (SELECT MAX(round) FROM races WHERE year = 1999);	formula_1
SELECT year, MAX(round) AS max_rounds  FROM races  GROUP BY year  ORDER BY max_rounds DESC  LIMIT 1;	formula_1
SELECT name  FROM races  WHERE year = 2017 AND name NOT IN (SELECT name FROM races WHERE year = 2000);	formula_1
SELECT c.country, c.name AS circuit_name, c.location FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.name = 'European Grand Prix' ORDER BY r.year ASC LIMIT 1;	formula_1
SELECT MAX(r.year) AS last_season_year FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Brands Hatch' AND r.name = 'British Grand Prix';	formula_1
SELECT COUNT(DISTINCT r.year) AS number_of_seasons FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Silverstone Circuit' AND r.name = 'British Grand Prix';	formula_1
SELECT d.forename, d.surname, r.position FROM races ra JOIN results r ON ra.raceId = r.raceId JOIN drivers d ON r.driverId = d.driverId WHERE ra.year = 2010 AND ra.name = 'Singapore Grand Prix' ORDER BY r.position ASC;	formula_1
SELECT d.forename, d.surname, MAX(ds.points) AS max_points FROM driverStandings ds JOIN drivers d ON ds.driverId = d.driverId GROUP BY ds.driverId ORDER BY max_points DESC LIMIT 1;	formula_1
SELECT d.forename, d.surname, r.points FROM races ra JOIN results r ON ra.raceId = r.raceId JOIN drivers d ON r.driverId = d.driverId WHERE ra.year = 2017 AND ra.name = 'Chinese Grand Prix' ORDER BY r.points DESC LIMIT 3;	formula_1
SELECT d.forename, d.surname, r.name, lt.milliseconds AS best_lap_time FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId JOIN races r ON lt.raceId = r.raceId ORDER BY lt.milliseconds ASC LIMIT 1;	formula_1
SELECT AVG(lapTimes.milliseconds) AS averageLapTime FROM lapTimes JOIN drivers ON lapTimes.driverId = drivers.driverId JOIN races ON lapTimes.raceId = races.raceId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.name = 'Malaysian Grand Prix' AND races.year = 2009;	formula_1
SELECT      (CAST(COUNT(CASE WHEN r.position > 1 THEN 1 END) AS FLOAT) / COUNT(*)) * 100 AS percentage_not_first FROM      results r JOIN      drivers d ON r.driverId = d.driverId JOIN      races ra ON r.raceId = ra.raceId WHERE      d.surname = 'Hamilton' AND ra.year >= 2010;	formula_1
SELECT d.forename || ' ' || d.surname AS full_name, d.nationality, MAX(ds.points) AS max_points FROM drivers AS d JOIN driverStandings AS ds ON d.driverId = ds.driverId WHERE ds.wins = (     SELECT MAX(wins)     FROM driverStandings ) GROUP BY d.driverId, d.forename, d.surname, d.nationality;	formula_1
SELECT forename, surname, dob FROM drivers WHERE nationality = "Japanese" ORDER BY dob DESC LIMIT 1;	formula_1
SELECT circuits.name, COUNT(races.raceId) AS race_count FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE races.year BETWEEN 1990 AND 2000 GROUP BY circuits.name HAVING COUNT(races.raceId) = 4;	formula_1
SELECT c.name AS circuit_name, c.location, r.name AS race_name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.year = 2006 AND c.country = 'USA';	formula_1
SELECT r.name AS race_name, c.name AS circuit_name, c.location AS circuit_location FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE strftime('%m', r.date) = '09' AND strftime('%Y', r.date) = '2005';	formula_1
SELECT r.name AS race_name, r.year, r.round  FROM races r JOIN qualifying q ON r.raceId = q.raceId JOIN drivers d ON q.driverId = d.driverId WHERE d.forename = 'Alex' AND d.surname = 'Yoong' AND q.position < 20;	formula_1
SELECT COUNT(*) AS wins FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId JOIN circuits c ON ra.circuitId = c.circuitId WHERE d.forename = 'Michael' AND d.surname = 'Schumacher' AND c.name = 'Sepang International Circuit'  AND r.points = (SELECT MAX(points) FROM results r2 WHERE r2.raceId = r.raceId);	formula_1
SELECT r.name AS race, r.year  FROM results res JOIN drivers d ON res.driverId = d.driverId JOIN races r ON res.raceId = r.raceId WHERE d.forename = 'Michael' AND d.surname = 'Schumacher'  AND res.milliseconds = (     SELECT MIN(milliseconds)      FROM results      WHERE driverId = d.driverId );	formula_1
SELECT AVG(r.points) AS average_points FROM results r JOIN races ra ON r.raceId = ra.raceId JOIN drivers d ON r.driverId = d.driverId WHERE d.forename = 'Eddie' AND d.surname = 'Irvine' AND ra.year = 2000;	formula_1
SELECT races.name AS race_name, races.year, results.points  FROM drivers  JOIN results ON drivers.driverId = results.driverId  JOIN races ON results.raceId = races.raceId  WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton'  ORDER BY races.year ASC  LIMIT 1;	formula_1
SELECT r.name AS race_name, r.date AS race_date, c.country AS hosting_country FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year = 2017 ORDER BY r.date;	formula_1
SELECT ra.name AS race_name, ra.year, c.location AS circuit_location, ra.laps AS most_laps FROM races ra JOIN circuits c ON ra.circuitId = c.circuitId WHERE ra.laps = (SELECT MAX(laps) FROM races);	formula_1
SELECT      (CAST(COUNT(*) AS FLOAT) / (SELECT COUNT(*) FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.name = 'European Grand Prix')) * 100 AS percentage FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.name = 'European Grand Prix' AND c.country = 'Germany';	formula_1
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit';	formula_1
SELECT name, lat FROM circuits WHERE name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring') ORDER BY lat DESC LIMIT 1;	formula_1
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit';	formula_1
SELECT country  FROM circuits  WHERE alt = (SELECT MAX(alt) FROM circuits);	formula_1
SELECT COUNT(*) AS drivers_without_code  FROM drivers  WHERE code IS NULL;	formula_1
SELECT nationality  FROM drivers  WHERE dob = (SELECT MIN(dob) FROM drivers);	formula_1
SELECT surname  FROM drivers  WHERE nationality = 'Italian';	formula_1
SELECT url FROM drivers WHERE forename = 'Anthony' AND surname = 'Davidson';	formula_1
SELECT driverRef  FROM drivers  WHERE forename = 'Lewis' AND surname = 'Hamilton';	formula_1
SELECT circuits.name  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE races.year = 2009 AND races.name = 'Spanish Grand Prix';	formula_1
SELECT DISTINCT r.year  FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Silverstone Circuit';	formula_1
SELECT races.name, races.year, races.round, races.date, races.url  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE circuits.name = 'Silverstone Circuit';	formula_1
SELECT r.time  FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year BETWEEN 2010 AND 2019 AND c.name = 'Abu Dhabi Circuit';	formula_1
SELECT COUNT(*)  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE circuits.country = 'Italy';	formula_1
SELECT r.date  FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Circuit de Barcelona-Catalunya';	formula_1
SELECT circuits.url  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE races.name = 'Spanish Grand Prix' AND races.year = 2009;	formula_1
SELECT MIN(fastestLapTime) AS fastest_lap_time FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';	formula_1
SELECT d.forename, d.surname  FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE r.fastestLapSpeed = (     SELECT MAX(CAST(fastestLapSpeed AS REAL))     FROM results );	formula_1
SELECT d.driverRef  FROM results r  JOIN drivers d ON r.driverId = d.driverId  JOIN races ra ON r.raceId = ra.raceId  WHERE ra.name = 'Canadian Grand Prix' AND ra.year = 2007 AND r.positionOrder = 1;	formula_1
SELECT r.name AS race_name, r.year, r.round, r.date, r.url FROM results res JOIN drivers d ON res.driverId = d.driverId JOIN races r ON res.raceId = r.raceId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT r.name AS race_name, r.year, r.round, rs.rank FROM results rs JOIN drivers d ON rs.driverId = d.driverId JOIN races r ON rs.raceId = r.raceId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' ORDER BY rs.rank ASC LIMIT 1;	formula_1
SELECT MAX(CAST(fastestLapSpeed AS REAL)) AS fastestLapSpeed FROM results JOIN races ON results.raceId = races.raceId WHERE races.name = 'Spanish Grand Prix' AND races.year = 2009;	formula_1
SELECT DISTINCT r.year FROM drivers d JOIN results res ON d.driverId = res.driverId JOIN races r ON res.raceId = r.raceId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT r.positionOrder  FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND ra.year = 2008 AND ra.name = 'Chinese Grand Prix';	formula_1
SELECT d.forename, d.surname FROM results r JOIN races ra ON r.raceId = ra.raceId JOIN drivers d ON r.driverId = d.driverId WHERE ra.year = 1989 AND ra.name = 'Australian Grand Prix' AND r.grid = 4;	formula_1
SELECT COUNT(DISTINCT driverId)  FROM results  WHERE raceId = (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix') AND time IS NOT NULL;	formula_1
SELECT r.fastestLap, r.fastestLapTime FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND ra.year = 2008 AND ra.name = 'Australian Grand Prix';	formula_1
SELECT r.time  FROM results r  JOIN races ra ON r.raceId = ra.raceId  WHERE ra.year = 2008 AND ra.name = 'Chinese Grand Prix' AND r.positionOrder = 2;	formula_1
SELECT d.forename, d.surname, d.url  FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2008 AND ra.name = 'Australian Grand Prix' AND r.time LIKE '%:%:%.%';	formula_1
SELECT COUNT(DISTINCT d.driverId) AS total_drivers FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE d.nationality = 'British' AND ra.year = 2008 AND ra.name = 'Australian Grand Prix';	formula_1
SELECT COUNT(DISTINCT d.driverId) AS driver_count FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Chinese Grand Prix' AND ra.year = 2008 AND r.time IS NOT NULL AND EXISTS (     SELECT 1     FROM results r2     WHERE r2.driverId = d.driverId     AND r2.raceId != r.raceId );	formula_1
SELECT SUM(points) AS total_points FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';	formula_1
SELECT AVG(STRFTIME('%s', fastestLapTime) % 60 + STRFTIME('%M', fastestLapTime) * 60) AS avg_fastest_lap_time_seconds FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';	formula_1
SELECT      CAST(SUM(CASE WHEN r.time IS NOT NULL AND r.laps = (SELECT MAX(laps) FROM results WHERE raceId = r.raceId) THEN 1 ELSE 0 END) AS FLOAT) / COUNT(r.resultId) AS completion_rate FROM results r JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2008 AND ra.name = 'Australian Grand Prix';	formula_1
SELECT      ((CAST(strftime('%s', lastDriver.time) - strftime('%s', champion.time) AS REAL) / strftime('%s', lastDriver.time)) * 100) AS percentage_faster FROM      results AS champion JOIN      races ON champion.raceId = races.raceId JOIN      results AS lastDriver ON champion.raceId = lastDriver.raceId WHERE      races.name = 'Australian Grand Prix'      AND races.year = 2008     AND champion.position = 1     AND champion.time IS NOT NULL     AND lastDriver.positionOrder = (         SELECT MAX(positionOrder)          FROM results          WHERE raceId = champion.raceId          AND time IS NOT NULL     );	formula_1
SELECT COUNT(*)  FROM circuits  WHERE location = 'Adelaide' AND country = 'Australia';	formula_1
SELECT lat, lng FROM circuits WHERE country = 'USA';	formula_1
SELECT COUNT(*)  FROM drivers  WHERE nationality = 'British' AND strftime('%Y', dob) > '1980';	formula_1
SELECT MAX(points) AS max_points FROM constructors JOIN constructorResults ON constructors.constructorId = constructorResults.constructorId WHERE constructors.nationality = 'British';	formula_1
SELECT c.name AS constructor_name, SUM(cs.points) AS total_points FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId GROUP BY c.name ORDER BY total_points DESC LIMIT 1;	formula_1
SELECT c.name  FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId WHERE cr.raceId = 291 AND cr.points = 0 AND cr.status IS NOT NULL;	formula_1
SELECT COUNT(*)  FROM (     SELECT constructorId      FROM constructorResults cr     JOIN constructors c ON cr.constructorId = c.constructorId     WHERE c.nationality = 'Japanese' AND cr.points = 0     GROUP BY cr.constructorId     HAVING COUNT(cr.raceId) = 2 ) AS subquery;	formula_1
SELECT c.name  FROM constructors AS c JOIN constructorStandings AS cs ON c.constructorId = cs.constructorId WHERE cs.position = 1;	formula_1
SELECT COUNT(DISTINCT c.constructorId) AS french_constructors_count FROM constructors c JOIN results r ON c.constructorId = r.constructorId JOIN races ra ON r.raceId = ra.raceId JOIN lapTimes l ON ra.raceId = l.raceId WHERE c.nationality = 'French' AND l.lap > 50;	formula_1
SELECT      (CAST(COUNT(r.driverId) AS FLOAT) /      CAST((SELECT COUNT(r2.driverId)            FROM results r2            JOIN races ra2 ON r2.raceId = ra2.raceId            JOIN drivers d2 ON r2.driverId = d2.driverId            WHERE ra2.year BETWEEN 2007 AND 2009 AND d2.nationality = 'Japanese') AS FLOAT)) * 100 AS race_completion_percentage  FROM      results r  JOIN      races ra ON r.raceId = ra.raceId  JOIN      drivers d ON r.driverId = d.driverId  WHERE      r.time IS NOT NULL AND ra.year BETWEEN 2007 AND 2009 AND d.nationality = 'Japanese';	formula_1
SELECT r.year, AVG(   CAST(SUBSTR(res.time, 1, 2) AS INTEGER) * 3600 +    CAST(SUBSTR(res.time, 4, 2) AS INTEGER) * 60 +    CAST(SUBSTR(res.time, 7, 2) AS INTEGER) +    CAST(SUBSTR(res.time, 10, 3) AS INTEGER) / 1000.0 ) AS avg_time_seconds FROM results AS res JOIN races AS r ON res.raceId = r.raceId WHERE res.position = 1 AND res.time IS NOT NULL AND r.year < 1975 GROUP BY r.year;	formula_1
SELECT forename, surname  FROM drivers  WHERE strftime('%Y', dob) > '1975' AND driverId IN (     SELECT driverId      FROM driverStandings      WHERE position = 2 );	formula_1
SELECT COUNT(DISTINCT d.driverId)  FROM drivers d  JOIN results r ON d.driverId = r.driverId  WHERE d.nationality = 'Italian' AND r.time IS NULL;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.fastestLapTime = (     SELECT MIN(fastestLapTime)     FROM results     WHERE fastestLapTime IS NOT NULL );	formula_1
SELECT r.fastestLap FROM results r JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2009 AND r.position = 1 AND r.time LIKE '%:%:%.%';	formula_1
SELECT AVG(CAST(fastestLapSpeed AS REAL)) AS average_fastest_lap_speed FROM results WHERE raceId = (     SELECT raceId     FROM races     WHERE name = 'Spanish Grand Prix' AND year = 2009 );	formula_1
SELECT r.name, r.year  FROM results res JOIN races r ON res.raceId = r.raceId WHERE res.milliseconds IS NOT NULL ORDER BY res.milliseconds ASC LIMIT 1;	formula_1
SELECT      (CAST(COUNT(DISTINCT lt.driverId) AS FLOAT) /      (SELECT COUNT(DISTINCT d.driverId)       FROM drivers d      JOIN results r ON d.driverId = r.driverId      JOIN races ra ON r.raceId = ra.raceId      WHERE ra.year BETWEEN 2000 AND 2005) * 100) AS percentage FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId JOIN races r ON lt.raceId = r.raceId WHERE r.year BETWEEN 2000 AND 2005  AND CAST(strftime('%Y', d.dob) AS INTEGER) < 1985 AND lt.lap > 50;	formula_1
SELECT COUNT(DISTINCT drivers.driverId) AS french_driver_count FROM drivers JOIN lapTimes ON drivers.driverId = lapTimes.driverId WHERE drivers.nationality = 'French' AND lapTimes.milliseconds < 120000;	formula_1
SELECT code  FROM drivers  WHERE nationality = 'America';	formula_1
SELECT raceId  FROM races  WHERE year = 2009;	formula_1
SELECT COUNT(DISTINCT driverId) AS total_drivers FROM results WHERE raceId = 18;	formula_1
SELECT code FROM drivers ORDER BY dob DESC LIMIT 3; SELECT COUNT(*) FROM drivers WHERE nationality = 'Dutch' AND driverId IN (     SELECT driverId     FROM drivers     ORDER BY dob DESC     LIMIT 3 );	formula_1
SELECT driverRef FROM drivers WHERE forename = 'Robert' AND surname = 'Kubica';	formula_1
SELECT COUNT(*)  FROM drivers  WHERE nationality = 'British' AND strftime('%Y', dob) = '1980';	formula_1
SELECT d.driverId, d.forename, d.surname, MIN(lt.time) AS earliest_lap_time FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE d.nationality = 'German' AND strftime('%Y', d.dob) BETWEEN '1980' AND '1990' GROUP BY d.driverId ORDER BY earliest_lap_time ASC LIMIT 3;	formula_1
SELECT driverRef  FROM drivers  WHERE nationality = 'German'  ORDER BY dob ASC  LIMIT 1;	formula_1
SELECT DISTINCT d.driverId, d.code FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE strftime('%Y', d.dob) = '1971' AND r.fastestLapTime IS NOT NULL;	formula_1
SELECT d.driverId, d.forename, d.surname, d.nationality, MAX(lt.time) AS latestLapTime FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE d.nationality = 'Spanish' AND strftime('%Y', d.dob) < '1982' GROUP BY d.driverId, d.forename, d.surname, d.nationality ORDER BY latestLapTime DESC LIMIT 10;	formula_1
SELECT year FROM races JOIN results ON races.raceId = results.raceId WHERE results.fastestLapTime = (     SELECT MIN(fastestLapTime)     FROM results     WHERE fastestLapTime IS NOT NULL ) LIMIT 1;	formula_1
SELECT year  FROM races  JOIN results ON races.raceId = results.raceId  WHERE fastestLapTime = (SELECT MAX(fastestLapTime) FROM results);	formula_1
SELECT driverId FROM lapTimes WHERE lap = 1 ORDER BY milliseconds ASC LIMIT 5;	formula_1
SELECT COUNT(*) AS disqualified_finishers  FROM results  WHERE raceId > 50 AND raceId < 100 AND statusId = 2 AND time IS NOT NULL;	formula_1
SELECT COUNT(*) AS circuit_count, location, lat, lng  FROM circuits  WHERE country = 'Austria';	formula_1
SELECT raceId, COUNT(*) AS finisher_count  FROM results  WHERE time IS NOT NULL  GROUP BY raceId  ORDER BY finisher_count DESC  LIMIT 1;	formula_1
SELECT d.driverRef, d.nationality, d.dob FROM qualifying q JOIN drivers d ON q.driverId = d.driverId WHERE q.raceId = 23 AND q.q2 IS NOT NULL;	formula_1
SELECT d.forename, d.surname, r.year, r.name AS race_name, r.date, r.time FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE r.date = (     SELECT MIN(r2.date)     FROM qualifying q2     JOIN races r2 ON q2.raceId = r2.raceId     WHERE q2.driverId = d.driverId ) ORDER BY d.dob DESC LIMIT 1;	formula_1
SELECT COUNT(DISTINCT d.driverId)  FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN status s ON r.statusId = s.statusId WHERE d.nationality = 'American' AND s.status = 'Puncture';	formula_1
SELECT c.name, c.url, SUM(cr.points) AS total_points FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId WHERE c.nationality = 'Italian' GROUP BY c.constructorId ORDER BY total_points DESC LIMIT 1;	formula_1
SELECT c.url  FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId GROUP BY c.constructorId ORDER BY SUM(cs.wins) DESC LIMIT 1;	formula_1
SELECT d.forename, d.surname, lt.time  FROM lapTimes lt JOIN races r ON lt.raceId = r.raceId JOIN drivers d ON lt.driverId = d.driverId WHERE r.name = 'French Grand Prix' AND lt.lap = 3 ORDER BY lt.time DESC LIMIT 1;	formula_1
SELECT raceId, MIN(milliseconds) AS fastest_first_lap_time FROM lapTimes WHERE lap = 1 GROUP BY raceId ORDER BY fastest_first_lap_time ASC LIMIT 1;	formula_1
SELECT AVG(CAST(SUBSTR(fastestLapTime, 1, INSTR(fastestLapTime, ':') - 1) AS INTEGER) * 60000 +            CAST(SUBSTR(fastestLapTime, INSTR(fastestLapTime, ':') + 1) AS REAL) * 1000) AS avgFastestLapTime FROM results WHERE raceId = (SELECT raceId FROM races WHERE year = 2006 AND name = 'United States Grand Prix')   AND positionOrder < 11;	formula_1
SELECT      d.forename || ' ' || d.surname AS full_name,     AVG(CAST(p.duration AS REAL)) AS avg_duration FROM      drivers d JOIN      pitStops p ON d.driverId = p.driverId WHERE      d.nationality = 'German'      AND strftime('%Y', d.dob) > '1980'      AND strftime('%Y', d.dob) < '1985' GROUP BY      d.driverId ORDER BY      avg_duration ASC LIMIT 3;	formula_1
SELECT d.forename, d.surname, r.time  FROM results r  JOIN drivers d ON r.driverId = d.driverId  JOIN races ra ON r.raceId = ra.raceId  WHERE ra.name = 'Canadian Grand Prix' AND ra.year = 2008 AND r.position = 1;	formula_1
SELECT constructors.constructorRef, constructors.url FROM results JOIN constructors ON results.constructorId = constructors.constructorId JOIN races ON results.raceId = races.raceId WHERE races.year = 2009 AND races.name = 'Singapore Grand Prix'   AND results.positionOrder = 1;	formula_1
SELECT forename, surname, dob  FROM drivers  WHERE nationality = 'Austrian' AND strftime('%Y', dob) BETWEEN '1981' AND '1991';	formula_1
SELECT forename || ' ' || surname AS full_name, url AS wikipedia_page, dob  FROM drivers  WHERE nationality = 'German' AND strftime('%Y', dob) BETWEEN '1971' AND '1985'  ORDER BY dob DESC;	formula_1
SELECT location, country, lat, lng  FROM circuits  WHERE name = 'Hungaroring';	formula_1
SELECT      SUM(cr.points) AS total_points,      c.name,      c.nationality FROM      races r JOIN      constructorResults cr ON r.raceId = cr.raceId JOIN      constructors c ON cr.constructorId = c.constructorId WHERE      r.name = 'Monaco Grand Prix'      AND r.year BETWEEN 1980 AND 2010 GROUP BY      c.constructorId ORDER BY      total_points DESC LIMIT 1;	formula_1
SELECT AVG(r.points) AS average_score FROM results r INNER JOIN drivers d ON r.driverId = d.driverId INNER JOIN races ra ON r.raceId = ra.raceId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND ra.name LIKE '%Turkish Grand Prix%';	formula_1
SELECT AVG(race_count) AS annual_average_races FROM (     SELECT year, COUNT(raceId) AS race_count     FROM races     WHERE date BETWEEN '2000-01-01' AND '2010-12-31'     GROUP BY year ) AS yearly_race_counts;	formula_1
SELECT nationality, COUNT(nationality) AS count  FROM drivers  GROUP BY nationality  ORDER BY count DESC  LIMIT 1;	formula_1
SELECT COUNT(*) AS victories FROM driverStandings WHERE position = 91 AND wins > 0;	formula_1
SELECT r.name  FROM results res JOIN races r ON res.raceId = r.raceId WHERE res.fastestLapTime = (     SELECT MIN(fastestLapTime)      FROM results     WHERE fastestLapTime IS NOT NULL );	formula_1
SELECT circuits.location || ', ' || circuits.country AS full_location FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE races.date = (SELECT MAX(date) FROM races);	formula_1
SELECT d.forename, d.surname FROM qualifying q JOIN races r ON q.raceId = r.raceId JOIN circuits c ON r.circuitId = c.circuitId JOIN drivers d ON q.driverId = d.driverId WHERE r.year = 2008 AND c.name = 'Marina Bay Street Circuit' ORDER BY q.q3 ASC LIMIT 1;	formula_1
SELECT d.forename || ' ' || d.surname AS full_name, d.nationality, r.name AS race_name FROM drivers d JOIN results res ON d.driverId = res.driverId JOIN races r ON res.raceId = r.raceId WHERE d.dob = (SELECT MAX(dob) FROM drivers) ORDER BY r.date ASC LIMIT 1;	formula_1
SELECT COUNT(*) AS accident_count  FROM results  WHERE raceId = (     SELECT raceId      FROM races      WHERE name = 'Canadian Grand Prix' ) AND driverId = (     SELECT driverId      FROM results      WHERE raceId = (         SELECT raceId          FROM races          WHERE name = 'Canadian Grand Prix'     ) AND statusId = 3      GROUP BY driverId      ORDER BY COUNT(*) DESC      LIMIT 1 ) AND statusId = 3;	formula_1
SELECT d.forename, d.surname, SUM(ds.wins) AS total_wins FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId WHERE d.dob = (SELECT MIN(dob) FROM drivers) GROUP BY d.forename, d.surname;	formula_1
SELECT MAX(CAST(duration AS REAL)) AS longest_duration FROM pitStops;	formula_1
SELECT MIN(milliseconds) AS fastest_time  FROM lapTimes;	formula_1
SELECT MAX(CAST(REPLACE(duration, ':', '.') AS REAL)) AS longest_time FROM pitStops JOIN drivers ON pitStops.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';	formula_1
SELECT p.lap  FROM pitStops p JOIN drivers d ON p.driverId = d.driverId JOIN races r ON p.raceId = r.raceId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND r.year = 2011 AND r.name = 'Australian Grand Prix';	formula_1
SELECT      d.forename || ' ' || d.surname AS driver_name,      ps.duration  FROM      pitStops ps JOIN      races r ON ps.raceId = r.raceId JOIN      drivers d ON ps.driverId = d.driverId WHERE      r.year = 2011 AND r.name = 'Australian Grand Prix';	formula_1
SELECT lt.time, d.forename, d.surname  FROM lapTimes lt  JOIN drivers d ON lt.driverId = d.driverId  WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton'  ORDER BY lt.milliseconds ASC  LIMIT 1;	formula_1
SELECT d.forename || ' ' || d.surname AS full_name, MIN(lt.time) AS shortest_lap_time FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId GROUP BY d.driverId ORDER BY shortest_lap_time ASC LIMIT 1;	formula_1
SELECT c.name AS circuit_name, r.name AS race_name, r.date, r.time, lt.time AS fastest_lap_time FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId JOIN races r ON lt.raceId = r.raceId JOIN circuits c ON r.circuitId = c.circuitId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND lt.time = (     SELECT MIN(lt2.time)     FROM lapTimes lt2     WHERE lt2.driverId = d.driverId );	formula_1
SELECT time  FROM lapTimes  WHERE milliseconds = (     SELECT MIN(milliseconds)      FROM lapTimes      WHERE raceId = (         SELECT raceId          FROM races          WHERE circuitId = (             SELECT circuitId              FROM circuits              WHERE name = 'Austrian Grand Prix Circuit'         )     ) );	formula_1
SELECT c.name AS circuit_name, MIN(lt.milliseconds) AS lap_record FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN lapTimes lt ON r.raceId = lt.raceId WHERE c.country = 'Italy' GROUP BY c.name;	formula_1
SELECT r.name AS race_name, r.year, c.name AS circuit_name, lt.time AS lap_record FROM lapTimes lt JOIN races r ON lt.raceId = r.raceId JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Austrian Grand Prix' ORDER BY lt.milliseconds ASC LIMIT 1;	formula_1
SELECT p.duration  FROM lapTimes l JOIN races r ON l.raceId = r.raceId JOIN circuits c ON r.circuitId = c.circuitId JOIN pitStops p ON l.raceId = p.raceId AND l.driverId = p.driverId WHERE c.name = 'Austrian Grand Prix Circuit'    AND l.time = (SELECT MIN(time)                  FROM lapTimes l2                  JOIN races r2 ON l2.raceId = r2.raceId                 JOIN circuits c2 ON r2.circuitId = c2.circuitId                 WHERE c2.name = 'Austrian Grand Prix Circuit');	formula_1
SELECT c.lat, c.lng  FROM circuits c  JOIN races r ON c.circuitId = r.circuitId  JOIN lapTimes lt ON r.raceId = lt.raceId  WHERE lt.time = '1:29.488';	formula_1
SELECT AVG(milliseconds) AS average_pit_stop_time FROM pitStops JOIN drivers ON pitStops.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';	formula_1
SELECT AVG(milliseconds) AS average_lap_time FROM lapTimes JOIN races ON lapTimes.raceId = races.raceId JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.country = 'Italy';	formula_1
SELECT player_api_id, overall_rating AS highest_overall_rating FROM Player_Attributes WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT player_name, height  FROM Player  WHERE height = (SELECT MAX(height) FROM Player);	european_football_2
SELECT preferred_foot  FROM Player_Attributes  WHERE potential = (SELECT MIN(potential) FROM Player_Attributes);	european_football_2
SELECT COUNT(*)  FROM Player_Attributes  WHERE overall_rating >= 60 AND overall_rating < 65 AND defensive_work_rate = 'low';	european_football_2
SELECT player_api_id  FROM Player_Attributes  ORDER BY crossing DESC  LIMIT 5;	european_football_2
SELECT l.name AS league_name, SUM(m.home_team_goal + m.away_team_goal) AS total_goals FROM Match m JOIN League l ON m.league_id = l.id WHERE m.season = '2015/2016' GROUP BY l.name ORDER BY total_goals DESC LIMIT 1;	european_football_2
SELECT      T.team_long_name AS home_team,      COUNT(M.id) AS losses FROM      Match M JOIN      Team T ON M.home_team_api_id = T.team_api_id WHERE      M.season = '2015/2016'      AND (M.home_team_goal - M.away_team_goal) < 0 GROUP BY      T.team_long_name ORDER BY      losses ASC LIMIT 1;	european_football_2
SELECT p.player_name, pa.penalties FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id ORDER BY pa.penalties DESC LIMIT 10;	european_football_2
SELECT      Team.team_long_name FROM      Match JOIN      League ON Match.league_id = League.id JOIN      Team ON Match.away_team_api_id = Team.team_api_id WHERE      League.name = 'Scotland Premier League'      AND Match.season = '2009/2010'      AND Match.away_team_goal > Match.home_team_goal GROUP BY      Team.team_long_name ORDER BY      COUNT(*) DESC LIMIT 1;	european_football_2
SELECT team_long_name, buildUpPlaySpeed  FROM Team_Attributes  JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id  ORDER BY buildUpPlaySpeed DESC  LIMIT 4;	european_football_2
SELECT l.name AS league_name FROM Match m JOIN League l ON m.league_id = l.id WHERE m.season = '2015/2016' GROUP BY l.name ORDER BY COUNT(CASE WHEN m.home_team_goal = m.away_team_goal THEN 1 END) DESC LIMIT 1;	european_football_2
SELECT p.player_name,         (CAST(strftime('%Y', 'now') AS INTEGER) - CAST(strftime('%Y', p.birthday) AS INTEGER)) AS age FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.sprint_speed >= 97    AND strftime('%Y', pa.date) BETWEEN '2013' AND '2015';	european_football_2
SELECT l.name AS league_name, COUNT(m.id) AS total_matches FROM Match m JOIN League l ON m.league_id = l.id GROUP BY m.league_id ORDER BY total_matches DESC LIMIT 1;	european_football_2
SELECT SUM(height) / COUNT(id) AS average_height  FROM Player  WHERE birthday >= '1990-01-01 00:00:00' AND birthday < '1996-01-01 00:00:00';	european_football_2
SELECT player_api_id  FROM Player_Attributes  WHERE overall_rating = (     SELECT MAX(overall_rating)      FROM Player_Attributes      WHERE CAST(substr(date, 1, 4) AS INTEGER) = 2010 ) AND CAST(substr(date, 1, 4) AS INTEGER) = 2010;	european_football_2
SELECT team_fifa_api_id  FROM Team_Attributes  WHERE buildUpPlaySpeed > 50 AND buildUpPlaySpeed < 60;	european_football_2
SELECT T.team_long_name FROM Team_Attributes TA JOIN Team T ON TA.team_api_id = T.team_api_id WHERE strftime('%Y', TA.date) = '2012' AND TA.buildUpPlayPassing > (     SELECT SUM(buildUpPlayPassing) * 1.0 / COUNT(team_long_name)     FROM Team_Attributes     WHERE buildUpPlayPassing IS NOT NULL AND strftime('%Y', date) = '2012' );	european_football_2
SELECT      (SUM(CASE WHEN pa.preferred_foot = 'left' THEN 1 ELSE 0 END) * 100.0 / COUNT(p.player_fifa_api_id)) AS percentage_left_foot FROM      Player p JOIN      Player_Attributes pa ON p.player_fifa_api_id = pa.player_fifa_api_id WHERE      CAST(STRFTIME('%Y', p.birthday) AS INTEGER) BETWEEN 1987 AND 1992;	european_football_2
SELECT      l.name AS league_name,      SUM(m.home_team_goal + m.away_team_goal) AS total_goals FROM      Match m JOIN      League l ON m.league_id = l.id GROUP BY      l.name ORDER BY      total_goals ASC LIMIT 5;	european_football_2
SELECT      CASE          WHEN EXISTS (SELECT 1 FROM Player WHERE player_name = 'Ahmed Samir Farag')          THEN (SELECT SUM(long_shots) * 1.0 / COUNT(player_fifa_api_id) AS average_long_shots               FROM Player_Attributes               WHERE player_fifa_api_id = (SELECT player_fifa_api_id FROM Player WHERE player_name = 'Ahmed Samir Farag'))         ELSE NULL     END AS average_long_shots;	european_football_2
SELECT      p.player_name,      AVG(pa.heading_accuracy) AS avg_heading_accuracy FROM      Player p JOIN      Player_Attributes pa  ON      p.player_fifa_api_id = pa.player_fifa_api_id WHERE      p.height > 180 GROUP BY      p.player_name ORDER BY      avg_heading_accuracy DESC LIMIT 10;	european_football_2
SELECT      T.team_long_name,      TA.chanceCreationPassing  FROM      Team_Attributes TA JOIN      Team T ON TA.team_api_id = T.team_api_id WHERE      TA.buildUpPlayDribblingClass = 'Normal'      AND TA.date >= '2014-01-01 00:00:00'      AND TA.date <= '2014-01-31 00:00:00'      AND TA.chanceCreationPassing < (         SELECT              SUM(chanceCreationPassing) * 1.0 / COUNT(id)          FROM              Team_Attributes          WHERE              date >= '2014-01-01 00:00:00'              AND date <= '2014-01-31 00:00:00'     ) ORDER BY      TA.chanceCreationPassing DESC;	european_football_2
SELECT l.name FROM League l JOIN Match m ON l.id = m.league_id WHERE m.season = '2009/2010' GROUP BY l.name HAVING SUM(m.home_team_goal) * 1.0 / COUNT(DISTINCT m.id) > SUM(m.away_team_goal) * 1.0 / COUNT(DISTINCT m.id);	european_football_2
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers';	european_football_2
SELECT player_name  FROM Player  WHERE substr(birthday, 1, 4) = '1970' AND substr(birthday, 6, 2) = '10';	european_football_2
SELECT pa.attacking_work_rate FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name = 'Franco Zennaro';	european_football_2
SELECT buildUpPlayPositioningClass FROM Team_Attributes JOIN Team ON Team.team_api_id = Team_Attributes.team_api_id WHERE Team.team_long_name = 'ADO Den Haag';	european_football_2
SELECT heading_accuracy  FROM Player_Attributes  WHERE date = '2014-09-18 00:00:00'  AND player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Francois Affolter');	european_football_2
SELECT overall_rating  FROM Player_Attributes  WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Gabriel Tamas')  AND strftime('%Y', date) = '2011';	european_football_2
SELECT COUNT(*)  FROM Match  WHERE season = '2015/2016'  AND league_id = (SELECT id FROM League WHERE name = 'Scotland Premier League');	european_football_2
SELECT preferred_foot  FROM Player_Attributes  WHERE player_api_id = (     SELECT player_api_id      FROM Player      ORDER BY birthday DESC      LIMIT 1 );	european_football_2
SELECT player_name, potential  FROM Player  JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id  WHERE potential = (SELECT MAX(potential) FROM Player_Attributes);	european_football_2
SELECT COUNT(DISTINCT Player.player_api_id)  FROM Player  JOIN Player_Attributes  ON Player.player_api_id = Player_Attributes.player_api_id  WHERE Player.weight < 130 AND Player_Attributes.preferred_foot = 'left';	european_football_2
SELECT team_short_name  FROM Team  JOIN Team_Attributes  ON Team.team_api_id = Team_Attributes.team_api_id  WHERE chanceCreationPassingClass = 'Risky';	european_football_2
SELECT pa.defensive_work_rate FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name = 'David Wilson';	european_football_2
SELECT Player.birthday  FROM Player  JOIN Player_Attributes  ON Player.player_api_id = Player_Attributes.player_api_id  WHERE Player_Attributes.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
INSERT INTO Country (id, name) VALUES (11234, 'Netherlands');  SELECT League.name  FROM League  JOIN Country ON League.country_id = Country.id  WHERE Country.name = 'Netherlands';	european_football_2
SELECT AVG(home_team_goal) AS average_home_team_goal FROM Match JOIN Country ON Match.country_id = Country.id WHERE Country.name = 'Belgium' AND Match.season = '2010/2011';	european_football_2
SELECT p.player_name, AVG(pa.finishing) AS avg_finishing FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.height = (SELECT MAX(height) FROM Player)    OR p.height = (SELECT MIN(height) FROM Player) GROUP BY p.player_name ORDER BY avg_finishing DESC LIMIT 1;	european_football_2
SELECT player_name  FROM Player  WHERE height > 180;	european_football_2
SELECT COUNT(*)  FROM Player  WHERE strftime('%Y', birthday) > '1990';	european_football_2
SELECT COUNT(*)  FROM Player p JOIN Match m ON p.player_api_id = m.home_player_1 OR p.player_api_id = m.away_player_1 JOIN Team t ON t.team_api_id = m.home_team_api_id OR t.team_api_id = m.away_team_api_id JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id WHERE p.player_name LIKE 'Adam%' AND p.weight > 170 AND ta.buildUpPlaySpeedClass = 'Fast';	european_football_2
SELECT DISTINCT p.player_name FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.overall_rating > 80 AND strftime('%Y', pa.date) BETWEEN '2008' AND '2010';	european_football_2
SELECT potential  FROM Player_Attributes  WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Doran');	european_football_2
SELECT player_name  FROM Player  WHERE player_api_id IN (     SELECT player_api_id      FROM Player_Attributes      WHERE preferred_foot = 'left' );	european_football_2
SELECT t.team_long_name  FROM Team t  JOIN Team_Attributes ta  ON t.team_api_id = ta.team_api_id  WHERE ta.buildUpPlaySpeedClass = 'Fast';	european_football_2
SELECT buildUpPlayPassingClass  FROM Team_Attributes  WHERE team_api_id = (SELECT team_api_id FROM Team WHERE team_short_name = 'CEB');	european_football_2
SELECT T.team_short_name FROM Team T JOIN Team_Attributes TA ON T.team_api_id = TA.team_api_id WHERE TA.buildUpPlayPassing > 70;	european_football_2
SELECT SUM(pa.overall_rating) / COUNT(pa.id) AS average_overall_rating FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE strftime('%Y', pa.date) >= '2010' AND strftime('%Y', pa.date) <= '2015' AND p.height > 170;	european_football_2
SELECT player_name, height  FROM Player  WHERE height = (SELECT MIN(height) FROM Player);	european_football_2
SELECT Country.name  FROM League  JOIN Country ON League.country_id = Country.id  WHERE League.name = 'Italy Serie A';	european_football_2
SELECT t.team_short_name  FROM Team t  JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id  WHERE ta.buildUpPlaySpeed = 31 AND ta.buildUpPlayDribbling = 53 AND ta.buildUpPlayPassing = 32;	european_football_2
SELECT AVG(overall_rating) AS average_overall_rating FROM Player_Attributes WHERE player_api_id = (     SELECT player_api_id     FROM Player     WHERE player_name = 'Aaron Doran' );	european_football_2
SELECT COUNT(*) AS match_count FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Germany 1. Bundesliga')   AND strftime('%Y-%m', date) BETWEEN '2008-08' AND '2008-10';	european_football_2
SELECT T.team_short_name  FROM Match M  JOIN Team T ON M.home_team_api_id = T.team_api_id  WHERE M.home_team_goal = 10;	european_football_2
SELECT p.player_name, pa.balance, pa.potential FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.potential = 61 AND pa.balance = (SELECT MAX(balance) FROM Player_Attributes WHERE potential = 61);	european_football_2
SELECT      AVG(CASE WHEN p.player_name = 'Abdou Diallo' THEN pa.ball_control ELSE NULL END) -      AVG(CASE WHEN p.player_name = 'Aaron Appindangoye' THEN pa.ball_control ELSE NULL END) AS ball_control_difference FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name IN ('Abdou Diallo', 'Aaron Appindangoye');	european_football_2
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN';	european_football_2
SELECT player_name, birthday  FROM Player  WHERE player_name IN ('Aaron Doran', 'Aaron Hughes')  ORDER BY birthday ASC  LIMIT 1;	european_football_2
SELECT player_name, height  FROM Player  ORDER BY height DESC  LIMIT 1;	european_football_2
SELECT COUNT(*)  FROM Player_Attributes  WHERE preferred_foot = 'left' AND attacking_work_rate = 'low';	european_football_2
SELECT Country.name  FROM League  JOIN Country ON League.country_id = Country.id  WHERE League.name = 'Belgium Jupiler League';	european_football_2
SELECT League.name  FROM League JOIN Country ON League.country_id = Country.id WHERE Country.name = 'Germany';	european_football_2
SELECT Player.player_name, Player_Attributes.overall_rating  FROM Player  JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id  WHERE Player_Attributes.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT COUNT(DISTINCT pa.player_api_id) AS player_count FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE strftime('%Y', p.birthday) < '1986' AND pa.defensive_work_rate = 'high';	european_football_2
SELECT player_name, crossing  FROM Player  JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id  WHERE player_name IN ('Aaron Doran', 'Ariel Borysiuk', 'Aaron Hughes')  ORDER BY crossing DESC  LIMIT 1;	european_football_2
SELECT pa.heading_accuracy  FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name = 'Ariel Borysiuk';	european_football_2
SELECT COUNT(DISTINCT p.id)  FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.height > 180 AND pa.volleys > 70;	european_football_2
SELECT DISTINCT p.player_name FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.volleys > 70 AND pa.dribbling > 70;	european_football_2
SELECT COUNT(*)  FROM Match  WHERE season = '2008/2009' AND country_id = (SELECT id FROM Country WHERE name = 'Belgium');	european_football_2
SELECT pa.long_passing  FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.birthday = (SELECT MIN(birthday) FROM Player);	european_football_2
SELECT COUNT(*) AS match_count FROM Match JOIN League ON Match.league_id = League.id WHERE League.name = 'Belgium Jupiler League' AND SUBSTR(Match.date, 1, 7) = '2009-04';	european_football_2
SELECT L.name AS league_name, COUNT(M.id) AS match_count FROM Match M JOIN League L ON M.league_id = L.id WHERE M.season = '2008/2009' GROUP BY L.name ORDER BY match_count DESC LIMIT 1;	european_football_2
SELECT AVG(overall_rating) AS average_overall_rating FROM Player_Attributes WHERE player_api_id IN (     SELECT player_api_id     FROM Player     WHERE strftime('%Y', birthday) < '1986' );	european_football_2
SELECT      ((pa1.overall_rating - pa2.overall_rating) / pa2.overall_rating) * 100 AS percentage_difference FROM      Player_Attributes pa1 JOIN      Player p1 ON pa1.player_api_id = p1.player_api_id JOIN      Player_Attributes pa2 ON pa2.player_api_id = p2.player_api_id JOIN      Player p2 ON pa2.player_api_id = p2.player_api_id WHERE      p1.player_name = 'Ariel Borysiuk'      AND p2.player_name = 'Paulin Puel';	european_football_2
SELECT AVG(buildUpPlaySpeed) AS average_build_up_play_speed FROM Team_Attributes WHERE team_api_id = (     SELECT team_api_id      FROM Team      WHERE team_long_name = 'Heart of Midlothian' );	european_football_2
SELECT AVG(T1.overall_rating) AS average_overall_rating FROM Player_Attributes T1 JOIN Player T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Pietro Marino';	european_football_2
SELECT SUM(PA.crossing) AS total_crossing_score FROM Player P JOIN Player_Attributes PA ON P.player_api_id = PA.player_api_id WHERE P.player_name = 'Aaron Lennox';	european_football_2
SELECT MAX(ta.chanceCreationPassing) AS highest_chance_creation_passing_score, ta.chanceCreationPassingClass FROM Team t JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id WHERE t.team_long_name = 'Ajax';	european_football_2
SELECT preferred_foot  FROM Player_Attributes  WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Abdou Diallo');	european_football_2
SELECT MAX(PA.overall_rating) AS highest_overall_rating FROM Player_Attributes PA JOIN Player P ON PA.player_api_id = P.player_api_id WHERE P.player_name = 'Dorlan Pabon';	european_football_2
SELECT AVG(M.away_team_goal) AS average_goals FROM Match M JOIN Team T ON M.away_team_api_id = T.team_api_id JOIN League L ON M.league_id = L.id JOIN Country C ON L.country_id = C.id WHERE T.team_long_name = 'Parma' AND C.name = 'Italy';	european_football_2
SELECT p.player_name  FROM Player_Attributes pa  JOIN Player p ON pa.player_api_id = p.player_api_id  WHERE pa.overall_rating = 77 AND pa.date LIKE '2016-06-23%'  ORDER BY p.birthday ASC  LIMIT 1;	european_football_2
SELECT overall_rating  FROM Player_Attributes  WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Mooy')  AND date LIKE '2016-02-04%';	european_football_2
SELECT potential  FROM Player_Attributes  WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Francesco Parravicini')  AND date = '2010-08-30 00:00:00';	european_football_2
SELECT pa.attacking_work_rate  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.player_name = 'Francesco Migliore' AND pa.date LIKE '2015-05-01%';	european_football_2
SELECT defensive_work_rate  FROM Player_Attributes  WHERE player_api_id = (     SELECT player_api_id      FROM Player      WHERE player_name = 'Kevin Berigaud' )  AND date = '2013-02-22 00:00:00';	european_football_2
SELECT date  FROM Player_Attributes  WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Kevin Constant')  AND crossing = (SELECT MAX(crossing) FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Kevin Constant'))  ORDER BY date ASC  LIMIT 1;	european_football_2
SELECT buildUpPlaySpeedClass  FROM Team_Attributes  JOIN Team ON Team.team_api_id = Team_Attributes.team_api_id  WHERE Team.team_long_name = 'Willem II' AND Team_Attributes.date = '2011-02-22';	european_football_2
SELECT buildUpPlayDribblingClass  FROM Team_Attributes  JOIN Team ON Team.team_api_id = Team_Attributes.team_api_id  WHERE Team.team_short_name = 'LEI' AND Team_Attributes.date = '2015/9/10';	european_football_2
SELECT buildUpPlayPassingClass  FROM Team_Attributes  JOIN Team  ON Team.team_api_id = Team_Attributes.team_api_id  WHERE Team.team_long_name = 'FC Lorient'  AND Team_Attributes.date LIKE '2010-02-22%';	european_football_2
SELECT chanceCreationPassingClass  FROM Team_Attributes  WHERE team_api_id = (SELECT team_api_id FROM Team WHERE team_long_name = 'PEC Zwolle')  AND date = '2013-09-20 00:00:00';	european_football_2
SELECT chanceCreationCrossingClass  FROM Team_Attributes  JOIN Team ON Team.team_api_id = Team_Attributes.team_api_id  WHERE Team.team_long_name = 'Hull City' AND Team_Attributes.date = '2010-02-22 00:00:00';	european_football_2
SELECT T.team_long_name, TA.defenceAggressionClass  FROM Team AS T JOIN Team_Attributes AS TA ON T.team_api_id = TA.team_api_id WHERE T.team_long_name = 'Hannover 96' AND TA.date LIKE '2015-09-10%';	european_football_2
SELECT AVG(overall_rating) AS average_overall_rating FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Marko Arnautovic') AND SUBSTR(date, 1, 10) BETWEEN '2007-02-22' AND '2016-04-21';	european_football_2
SELECT      COALESCE(((ld.overall_rating - jb.overall_rating) * 100.0 / ld.overall_rating), 0) AS percentage_difference FROM      (SELECT overall_rating FROM Player_Attributes       WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Landon Donovan')       AND date = '2013-07-12' LIMIT 1) AS ld,     (SELECT overall_rating FROM Player_Attributes       WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Jordan Bowery')       AND date = '2013-07-12' LIMIT 1) AS jb;	european_football_2
SELECT player_name  FROM Player  WHERE height = (SELECT MAX(height) FROM Player);	european_football_2
SELECT player_api_id  FROM Player  ORDER BY weight DESC  LIMIT 10;	european_football_2
SELECT player_name  FROM Player  WHERE (strftime('%Y', 'now') - strftime('%Y', birthday)) - (strftime('%m-%d', 'now') < strftime('%m-%d', birthday)) >= 35;	european_football_2
SELECT SUM(home_team_goal)  FROM Match  WHERE home_player_1 IN (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon')    OR home_player_2 IN (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon')    OR home_player_3 IN (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon')    OR home_player_4 IN (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon')    OR home_player_5 IN (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon')    OR home_player_6 IN (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon')    OR home_player_7 IN (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon')    OR home_player_8 IN (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon')    OR home_player_9 IN (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon')    OR home_player_10 IN (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon')    OR home_player_11 IN (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon');	european_football_2
SELECT SUM(M.away_team_goal) AS total_away_goals FROM Match M JOIN Player P  ON M.away_player_1 = P.player_api_id OR M.away_player_2 = P.player_api_id OR M.away_player_3 = P.player_api_id OR     M.away_player_4 = P.player_api_id OR M.away_player_5 = P.player_api_id OR M.away_player_6 = P.player_api_id OR     M.away_player_7 = P.player_api_id OR M.away_player_8 = P.player_api_id OR M.away_player_9 = P.player_api_id OR     M.away_player_10 = P.player_api_id OR M.away_player_11 = P.player_api_id WHERE P.player_name IN ('Daan Smith', 'Filipe Ferreira');	european_football_2
SELECT SUM(home_team_goal) AS total_home_team_goals FROM Match WHERE home_team_api_id IN (     SELECT player_api_id     FROM Player     WHERE (julianday('now') - julianday(birthday)) / 365 <= 30 );	european_football_2
SELECT p.player_name  FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT player_name  FROM Player  WHERE player_api_id IN (     SELECT player_api_id      FROM Player_Attributes      WHERE potential = (SELECT MAX(potential) FROM Player_Attributes) );	european_football_2
SELECT DISTINCT p.player_name FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.attacking_work_rate = 'high';	european_football_2
SELECT p.player_name  FROM Player p  JOIN Player_Attributes pa  ON p.player_api_id = pa.player_api_id  WHERE pa.finishing = 1  ORDER BY datetime(p.birthday) ASC  LIMIT 1;	european_football_2
SELECT DISTINCT p.player_name FROM Player p JOIN Match m ON p.player_api_id = m.home_player_1 OR p.player_api_id = m.away_player_1 JOIN Country c ON m.country_id = c.id WHERE c.name = 'Belgium';	european_football_2
SELECT DISTINCT p.player_name FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.vision > 89;	european_football_2
SELECT c.name AS country_name, AVG(p.weight) AS average_weight FROM Player p JOIN Match m ON p.player_api_id IN (     m.home_player_1, m.home_player_2, m.home_player_3, m.home_player_4, m.home_player_5,     m.home_player_6, m.home_player_7, m.home_player_8, m.home_player_9, m.home_player_10, m.home_player_11,     m.away_player_1, m.away_player_2, m.away_player_3, m.away_player_4, m.away_player_5,     m.away_player_6, m.away_player_7, m.away_player_8, m.away_player_9, m.away_player_10, m.away_player_11 ) JOIN League l ON m.league_id = l.id JOIN Country c ON l.country_id = c.id GROUP BY c.name ORDER BY AVG(p.weight) DESC LIMIT 1;	european_football_2
SELECT team_long_name  FROM Team  JOIN Team_Attributes  ON Team.team_api_id = Team_Attributes.team_api_id  WHERE buildUpPlaySpeedClass = 'Slow';	european_football_2
SELECT T.team_short_name FROM Team T JOIN Team_Attributes TA ON T.team_api_id = TA.team_api_id WHERE TA.chanceCreationPassingClass = 'Safe';	european_football_2
SELECT AVG(Player.height) AS average_height FROM Player JOIN Match ON Player.player_api_id IN (     Match.home_player_1, Match.home_player_2, Match.home_player_3, Match.home_player_4, Match.home_player_5,      Match.home_player_6, Match.home_player_7, Match.home_player_8, Match.home_player_9, Match.home_player_10, Match.home_player_11,      Match.away_player_1, Match.away_player_2, Match.away_player_3, Match.away_player_4, Match.away_player_5,      Match.away_player_6, Match.away_player_7, Match.away_player_8, Match.away_player_9, Match.away_player_10, Match.away_player_11 ) JOIN Country ON Match.country_id = Country.id WHERE Country.name = 'Italy';	european_football_2
SELECT player_name  FROM Player  WHERE height > 180  ORDER BY player_name ASC  LIMIT 3;	european_football_2
SELECT COUNT(*)  FROM Player  WHERE player_name LIKE 'Aaron%'  AND birthday > '1990-01-01';	european_football_2
SELECT      (SELECT jumping FROM Player_Attributes WHERE id = 6) -      (SELECT jumping FROM Player_Attributes WHERE id = 23) AS jumping_difference;	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE potential = (SELECT MIN(potential) FROM Player_Attributes WHERE preferred_foot = 'right') AND preferred_foot = 'right' LIMIT 5;	european_football_2
SELECT COUNT(*)  FROM Player_Attributes  WHERE crossing = (SELECT MAX(crossing) FROM Player_Attributes)  AND preferred_foot = 'left';	european_football_2
SELECT      (CAST(COUNT(*) AS FLOAT) / (SELECT COUNT(*) FROM Player_Attributes) * 100) AS percentage FROM      Player_Attributes WHERE      stamina > 80 AND strength > 80;	european_football_2
SELECT Country.name  FROM League  JOIN Country ON League.country_id = Country.id  WHERE League.name = 'Poland Ekstraklasa';	european_football_2
SELECT home_team_goal, away_team_goal  FROM Match  JOIN League ON Match.league_id = League.id  WHERE League.name = 'Belgium Jupiler League' AND Match.date LIKE '2008-09-24%';	european_football_2
SELECT sprint_speed, agility, acceleration  FROM Player_Attributes  WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Alexis Blin');	european_football_2
SELECT buildUpPlaySpeedClass  FROM Team_Attributes  JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id  WHERE Team.team_long_name = 'KSV Cercle Brugge';	european_football_2
SELECT COUNT(*) AS total_games FROM Match WHERE league_id = 10257 AND season = '2015/2016';	european_football_2
SELECT MAX(home_team_goal) AS highest_home_team_score FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Belgium Jupiler League');	european_football_2
SELECT pa.finishing, pa.curve  FROM Player_Attributes pa  JOIN Player p ON pa.player_api_id = p.player_api_id  WHERE p.weight = (SELECT MAX(weight) FROM Player);	european_football_2
SELECT l.name AS league_name, COUNT(m.id) AS total_games FROM Match m JOIN League l ON m.league_id = l.id WHERE m.season = '2015/2016' GROUP BY l.name ORDER BY total_games DESC LIMIT 4;	european_football_2
SELECT T.team_long_name  FROM Match M  JOIN Team T ON M.away_team_api_id = T.team_api_id  WHERE M.away_team_goal = (SELECT MAX(away_team_goal) FROM Match);	european_football_2
SELECT p.player_name  FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT (CAST(COUNT(*) AS FLOAT) / (SELECT COUNT(id) FROM Player)) * 100 AS percentage FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE Player.height < 180 AND Player_Attributes.overall_rating > 70;	european_football_2
SELECT      (SELECT COUNT(ID) FROM Patient WHERE SEX = 'M' AND Admission = '+') AS Inpatient_Male,     (SELECT COUNT(ID) FROM Patient WHERE SEX = 'M' AND Admission = '-') AS Outpatient_Male,     CASE          WHEN (SELECT COUNT(ID) FROM Patient WHERE SEX = 'M' AND Admission = '-') = 0 THEN NULL         ELSE ((CAST((SELECT COUNT(ID) FROM Patient WHERE SEX = 'M' AND Admission = '+') AS FLOAT) /                 CAST((SELECT COUNT(ID) FROM Patient WHERE SEX = 'M' AND Admission = '-') AS FLOAT)) * 100)     END AS Percentage_Deviation;	thrombosis_prediction
SELECT      (CAST(SUM(CASE WHEN strftime('%Y', Birthday) > '1930' AND SEX = 'F' THEN 1 ELSE 0 END) AS FLOAT) /      SUM(CASE WHEN SEX = 'F' THEN 1 ELSE 0 END)) * 100 AS Percentage_Female_Born_After_1930  FROM Patient;	thrombosis_prediction
SELECT      (CAST(SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(*)) * 100 AS Inpatient_Percentage FROM      Patient WHERE      strftime('%Y', Birthday) BETWEEN '1930' AND '1940';	thrombosis_prediction
SELECT      (SELECT COUNT(ID) FROM Patient WHERE Diagnosis = 'SLE' AND Admission = '-') / NULLIF((SELECT COUNT(ID) FROM Patient WHERE Diagnosis = 'SLE' AND Admission = '+'), 0) AS OutpatientToInpatientRatio;	thrombosis_prediction
SELECT p.Diagnosis, l.Date  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.ID = 30609;	thrombosis_prediction
SELECT Patient.SEX, Patient.Birthday, Examination.`Examination Date`, Examination.Symptoms  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE Patient.ID = 163109;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.LDH > 500;	thrombosis_prediction
SELECT P.ID, (strftime('%Y', 'now') - strftime('%Y', P.Birthday)) AS Age FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.RVVT = '+';	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Diagnosis  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE Examination.Thrombosis = 2;	thrombosis_prediction
SELECT DISTINCT p.* FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE YEAR(p.Birthday) = '1937' AND l.`T-CHO` >= 250;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Diagnosis FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.ALB < 3.5;	thrombosis_prediction
SELECT      (COUNT(DISTINCT Laboratory.ID) * 100.0 / (SELECT COUNT(DISTINCT Patient.ID) FROM Patient WHERE SEX = 'F')) AS Percentage FROM      Laboratory JOIN      Patient ON Laboratory.ID = Patient.ID WHERE      Patient.SEX = 'F' AND (Laboratory.TP < 6.0 OR Laboratory.TP > 8.5);	thrombosis_prediction
SELECT AVG(E.`aCL IgG`) AS Average_aCL_IgG FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE P.Admission = '+' AND (strftime('%Y', 'now') - strftime('%Y', P.Birthday)) >= 50;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  WHERE SEX = 'F' AND STRFTIME('%Y', Description) = '1997' AND Admission = '+';	thrombosis_prediction
SELECT MIN(STRFTIME('%Y', `First Date`) - STRFTIME('%Y', `Birthday`)) AS Youngest_Age FROM Patient WHERE `First Date` IS NOT NULL AND `Birthday` IS NOT NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'F' AND e.Thrombosis = 1 AND strftime('%Y', e.`Examination Date`) = '1997';	thrombosis_prediction
SELECT MAX(strftime('%Y', P.Birthday)) - MIN(strftime('%Y', P.Birthday)) AS Age_Gap  FROM Patient P  INNER JOIN Laboratory L ON P.ID = L.ID  WHERE L.TG >= 200;	thrombosis_prediction
SELECT E.Symptoms, P.Diagnosis  FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE P.Birthday = (SELECT MAX(Birthday)                      FROM Patient                      WHERE ID IN (SELECT ID FROM Examination WHERE Symptoms IS NOT NULL)) AND E.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT Laboratory.ID) / 12 AS Average_Male_Patients_Per_Month FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE Patient.SEX = 'M' AND Laboratory.Date BETWEEN '1998-01-01' AND '1998-12-31';	thrombosis_prediction
SELECT      Laboratory.Date AS `Lab Work Date`,      (strftime('%Y', COALESCE(Patient.`First Date`, '0000-01-01')) - strftime('%Y', Patient.Birthday)) AS `Age at Admission` FROM      Patient JOIN      Laboratory ON Patient.ID = Laboratory.ID WHERE      Patient.Diagnosis = 'SJS' ORDER BY      Patient.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT      (SUM(CASE WHEN SEX = 'M' AND UA <= 8.0 THEN 1 ELSE 0 END) * 1.0) /      SUM(CASE WHEN SEX = 'F' AND UA <= 6.5 THEN 1 ELSE 0 END) AS Male_to_Female_Ratio  FROM      Patient P  JOIN      Laboratory L  ON      P.ID = L.ID;	thrombosis_prediction
SELECT COUNT(*) AS PatientCount FROM Patient p WHERE NOT EXISTS (     SELECT 1     FROM Examination e     WHERE e.ID = p.ID AND date(e.`Examination Date`) < date(p.`First Date`, '+1 year') );	thrombosis_prediction
SELECT COUNT(DISTINCT Examination.ID) AS UnderagePatientsCount  FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.`Examination Date` BETWEEN '1990-01-01' AND '1993-12-31' AND (julianday(Examination.`Examination Date`) - julianday(Patient.Birthday)) / 365.25 < 18;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.SEX = 'M' AND Laboratory.`T-BIL` >= 2.0;	thrombosis_prediction
SELECT Diagnosis, COUNT(Diagnosis) AS DiagnosisCount FROM Examination WHERE `Examination Date` BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY Diagnosis ORDER BY DiagnosisCount DESC LIMIT 1;	thrombosis_prediction
SELECT AVG(1999 - strftime('%Y', Birthday)) AS Average_Age FROM Patient WHERE ID IN (     SELECT ID      FROM Laboratory      WHERE Date BETWEEN '1991-10-01' AND '1991-10-30' );	thrombosis_prediction
SELECT (YEAR(L.`Date`) - YEAR(P.`Birthday`)) AS Age, P.`Diagnosis` FROM `Laboratory` L JOIN `Patient` P ON L.`ID` = P.`ID` WHERE L.`HGB` = (SELECT MAX(`HGB`) FROM `Laboratory`);	thrombosis_prediction
SELECT ANA  FROM Examination  WHERE ID = 27654 AND `Examination Date` = '1996-12-02';	thrombosis_prediction
SELECT      CASE          WHEN `T-CHO` < 250 THEN 'Normal'         ELSE 'Abnormal'     END AS `Total Cholesterol Status` FROM Laboratory WHERE ID = 2927464 AND Date = '1995-09-04' AND EXISTS (     SELECT 1 FROM Laboratory WHERE ID = 2927464 AND Date = '1995-09-04' );	thrombosis_prediction
SELECT SEX  FROM Patient  WHERE Diagnosis LIKE '%AORTITIS%' AND `First Date` IS NOT NULL  ORDER BY `First Date` ASC  LIMIT 1;	thrombosis_prediction
SELECT `aCL IgM`  FROM `Examination`  WHERE `ID` = (     SELECT `ID`      FROM `Patient`      WHERE `Diagnosis` = 'SLE' AND `Description` = '1991-08-13' )  AND `Examination Date` = '1993-11-12';	thrombosis_prediction
SELECT SEX  FROM Patient  WHERE ID = (SELECT ID FROM Laboratory WHERE GPT = 9 AND Date = '1992-06-12');	thrombosis_prediction
SELECT strftime('%Y', '1991-10-21') - strftime('%Y', Birthday) AS Age  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.UA = '8.4' AND Laboratory.Date = '1991-10-21';	thrombosis_prediction
SELECT COUNT(ID) AS TotalTests FROM Laboratory WHERE ID = (SELECT ID FROM Patient WHERE `First Date` = '1991-06-13' AND Diagnosis = 'SLE') AND Date BETWEEN '1995-01-01' AND '1995-12-31';	thrombosis_prediction
SELECT p.Diagnosis AS Original_Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Diagnosis = 'SLE' AND e.`Examination Date` = '1997-01-27' AND p.`First Date` IS NOT NULL;	thrombosis_prediction
SELECT E.Symptoms  FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE P.Birthday = '1956-04-14' AND E.`Examination Date` = '1993-09-27';	thrombosis_prediction
SELECT      ((SUM(CASE WHEN strftime('%Y-%m', Laboratory.Date) = '1981-11' THEN Laboratory.`T-CHO` ELSE 0 END) -        SUM(CASE WHEN strftime('%Y-%m', Laboratory.Date) = '1981-12' THEN Laboratory.`T-CHO` ELSE 0 END)) * 100.0) /      SUM(CASE WHEN strftime('%Y-%m', Laboratory.Date) = '1981-11' THEN Laboratory.`T-CHO` ELSE 0 END) AS Decrease_Rate FROM      Laboratory JOIN      Patient ON      Laboratory.ID = Patient.ID WHERE      Patient.Birthday = '1959-02-18';	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Diagnosis LIKE '%Behcet%'   AND e.`Examination Date` BETWEEN '1997-01-01' AND '1997-12-31';	thrombosis_prediction
SELECT DISTINCT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.Date BETWEEN '1987-07-06' AND '1996-01-31'   AND Laboratory.GPT > 30   AND Laboratory.ALB < 4;	thrombosis_prediction
SELECT ID  FROM Patient  WHERE SEX = 'F' AND STRFTIME('%Y', Birthday) = '1964' AND Admission = '+';	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) AS NumberOfPatients FROM Examination e WHERE e.Thrombosis = 2   AND e.ANA = 'S'   AND e.`aCL IgM` > (SELECT AVG(`aCL IgM`) * 1.2 FROM Examination);	thrombosis_prediction
SELECT      (COUNT(CASE WHEN `UA` <= 6.5 AND `U-PRO` > 0 AND `U-PRO` < 30 THEN 1 END) * 100.0 / COUNT(CASE WHEN `U-PRO` > 0 AND `U-PRO` < 30 THEN 1 END)) AS Percentage FROM      Laboratory;	thrombosis_prediction
SELECT      (SUM(CASE WHEN Diagnosis = 'BEHCET' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS Percentage FROM      Patient WHERE      SEX = 'M' AND strftime('%Y', `First Date`) = '1981' AND `First Date` IS NOT NULL;	thrombosis_prediction
SELECT p.* FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '+'   AND l.Date LIKE '1991-10%'   AND l.`T-BIL` < 2.0;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  WHERE SEX = 'F'  AND strftime('%Y', Birthday) BETWEEN '1980' AND '1989'  AND ID IN (SELECT ID FROM Examination WHERE `ANA Pattern` != 'P');	thrombosis_prediction
SELECT p.SEX  FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE e.Diagnosis = 'PSS' AND l.CRP = '2+' AND l.CRE = 1 AND l.LDH = 123;	thrombosis_prediction
SELECT AVG(Laboratory.ALB) AS Average_Blood_Albumin_Level FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE Patient.SEX = 'F' AND Laboratory.PLT > 400 AND Patient.Diagnosis = 'SLE';	thrombosis_prediction
SELECT Symptoms, COUNT(Symptoms) AS Frequency FROM Examination WHERE ID IN (SELECT ID FROM Patient WHERE Diagnosis LIKE '%SLE%') GROUP BY Symptoms ORDER BY Frequency DESC LIMIT 1;	thrombosis_prediction
SELECT `Description`, `Diagnosis`  FROM `Patient`  WHERE `ID` = 27654;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  INNER JOIN Examination ON Patient.ID = Examination.ID  WHERE Patient.SEX = 'F' AND Examination.Diagnosis = 'APS';	thrombosis_prediction
SELECT COUNT(DISTINCT l.ID) AS Patient_Count FROM Laboratory l WHERE YEAR(l.Date) = '1997' AND (l.TP <= 6 OR l.TP >= 8.5);	thrombosis_prediction
SELECT      (SUM(CASE WHEN p.Diagnosis LIKE '%SLE%' AND e.Symptoms LIKE '%thrombocytopenia%' THEN 1 ELSE 0 END) * 100.0 /       SUM(CASE WHEN e.Symptoms LIKE '%thrombocytopenia%' THEN 1 ELSE 0 END)) AS Proportion FROM      Patient p JOIN      Examination e ON p.ID = e.ID;	thrombosis_prediction
SELECT      (SUM(CASE WHEN SEX = 'F' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS Percentage FROM      Patient WHERE      YEAR(Birthday) = '1980' AND Diagnosis = 'RA';	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE Patient.SEX = 'M'  AND Examination.`Examination Date` BETWEEN '1995-01-01' AND '1997-12-31'  AND Examination.Diagnosis = 'Behcet'  AND Patient.Admission = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'F' AND Laboratory.WBC < 3.5;	thrombosis_prediction
SELECT DATEDIFF(e.`Examination Date`, p.`First Date`) AS Days_Before_Evaluation FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.ID = 821298;	thrombosis_prediction
SELECT      CASE          WHEN (p.SEX = 'M' AND l.UA > 8.0) OR (p.SEX = 'F' AND l.UA > 6.5) THEN 'No'         ELSE 'Yes'     END AS IsNormalRange FROM      Laboratory l JOIN      Patient p ON      l.ID = p.ID WHERE      l.ID = 57266;	thrombosis_prediction
SELECT `Date`  FROM `Laboratory`  WHERE `ID` = 48473 AND `GOT` >= 60;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GOT < 60 AND strftime('%Y', l.Date) = '1994';	thrombosis_prediction
SELECT DISTINCT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Laboratory.GPT >= 60;	thrombosis_prediction
SELECT p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GPT > 60 ORDER BY p.Birthday ASC;	thrombosis_prediction
SELECT AVG(LDH) AS Average_LDH FROM Laboratory WHERE LDH < 500;	thrombosis_prediction
SELECT Patient.ID, (strftime('%Y', 'now') - strftime('%Y', Patient.Birthday)) AS Age FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.LDH BETWEEN 600 AND 800;	thrombosis_prediction
SELECT      Patient.Admission, COUNT(*) AS Patient_Count FROM      Laboratory JOIN      Patient ON Laboratory.ID = Patient.ID WHERE      Laboratory.ALP < 300 GROUP BY      Patient.Admission;	thrombosis_prediction
SELECT p.ID,         CASE             WHEN l.ALP IS NULL THEN 'No Laboratory Data Available'            WHEN l.ALP < 300 THEN 'Within Normal Range'             ELSE 'Out of Normal Range'         END AS ALP_Status FROM Patient p LEFT JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday = '1982-04-01';	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.TP < 6.0;	thrombosis_prediction
SELECT Patient.ID, Laboratory.Date, Laboratory.TP - 8.5 AS TP_Deviation FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'F' AND Laboratory.TP > 8.5;	thrombosis_prediction
SELECT p.* FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.ALB IS NOT NULL AND (l.ALB <= 3.5 OR l.ALB >= 5.5) ORDER BY p.Birthday DESC;	thrombosis_prediction
SELECT      p.ID,      CASE          WHEN l.ALB BETWEEN 3.5 AND 5.5 THEN 'Within Normal Range'          ELSE 'Outside Normal Range'      END AS Albumin_Status FROM      Patient p LEFT JOIN      Laboratory l ON      p.ID = l.ID WHERE      YEAR(p.Birthday) = 1982 GROUP BY      p.ID, l.ALB;	thrombosis_prediction
SELECT      (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Patient WHERE SEX = 'F')) AS Percentage FROM      Laboratory  JOIN      Patient ON Laboratory.ID = Patient.ID WHERE      Patient.SEX = 'F' AND Laboratory.UA > 6.5;	thrombosis_prediction
SELECT AVG(L.UA) AS Average_UA FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE (     (L.UA < 8.0 AND P.SEX = 'M') OR     (L.UA < 6.5 AND P.SEX = 'F') ) AND L.Date = (     SELECT MAX(L2.Date)     FROM Laboratory L2     WHERE L2.ID = L.ID );	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.UN = 29;	thrombosis_prediction
SELECT DISTINCT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Diagnosis LIKE '%RA%' AND Laboratory.UN < 30;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.CRE >= 1.5;	thrombosis_prediction
SELECT      CASE          WHEN (SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.CRE >= 1.5) >               (SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'F' AND l.CRE >= 1.5)          THEN 'True'          ELSE 'False'      END AS Result;	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday, L.`T-BIL` FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.`T-BIL` = (SELECT MAX(`T-BIL`) FROM Laboratory);	thrombosis_prediction
SELECT SEX, GROUP_CONCAT(DISTINCT Patient.ID) AS Patient_List FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE `T-BIL` >= 2.0 GROUP BY SEX;	thrombosis_prediction
SELECT p.ID, l.`T-CHO` FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday = (SELECT MIN(Birthday) FROM Patient)    AND l.`T-CHO` = (SELECT MAX(l2.`T-CHO`)                     FROM Laboratory l2                     JOIN Patient p2 ON l2.ID = p2.ID                     WHERE p2.Birthday = (SELECT MIN(Birthday) FROM Patient));	thrombosis_prediction
SELECT AVG((julianday('now') - julianday(Birthday)) / 365.25) AS Average_Age FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.`T-CHO` >= 250;	thrombosis_prediction
SELECT      Patient.ID,      Patient.Diagnosis  FROM      Patient  JOIN      Laboratory  ON      Patient.ID = Laboratory.ID  WHERE      Laboratory.TG > 300;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.TG >= 200 AND (strftime('%Y', 'now') - strftime('%Y', p.Birthday)) > 50;	thrombosis_prediction
SELECT DISTINCT p.ID  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '-' AND l.CPK < 250;	thrombosis_prediction
SELECT COUNT(DISTINCT Laboratory.ID)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE YEAR(Patient.Birthday) BETWEEN 1936 AND 1956  AND Patient.SEX = 'M'  AND Laboratory.CPK > 250;	thrombosis_prediction
SELECT      p.ID,      p.SEX,      (strftime('%Y', 'now') - strftime('%Y', p.Birthday)) AS age FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      l.GLU >= 180 AND      l.`T-CHO` < 250;	thrombosis_prediction
SELECT p.ID, l.GLU FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE YEAR(p.Description) = 1991 AND l.GLU < 180;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday  FROM Patient p  JOIN Laboratory l  ON p.ID = l.ID  WHERE l.WBC <= 3.5 OR l.WBC >= 9.0  ORDER BY julianday('now') - julianday(p.Birthday) ASC;	thrombosis_prediction
SELECT      Patient.ID,      Patient.Diagnosis,      (strftime('%Y', 'now') - strftime('%Y', Patient.Birthday)) AS Age FROM      Patient JOIN      Laboratory ON Patient.ID = Laboratory.ID WHERE      Laboratory.RBC < 3.5;	thrombosis_prediction
SELECT      Patient.ID,      Patient.SEX,      Patient.Birthday,      Patient.Admission  FROM      Patient  JOIN      Laboratory  ON      Patient.ID = Laboratory.ID  WHERE      Patient.SEX = 'F'      AND (strftime('%Y', 'now') - strftime('%Y', Patient.Birthday)) >= 50      AND (Laboratory.RBC <= 3.5 OR Laboratory.RBC >= 6.0);	thrombosis_prediction
SELECT DISTINCT Patient.ID, Patient.SEX FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Admission = '-' AND Laboratory.HGB < 10;	thrombosis_prediction
SELECT P.ID, P.SEX FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Diagnosis = 'SLE' AND L.HGB > 10 AND L.HGB < 17 ORDER BY P.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT p.ID, (YEAR(CURRENT_DATE) - YEAR(p.Birthday) - (DATE(CURRENT_DATE) < DATE(CONCAT(YEAR(CURRENT_DATE), '-', MONTH(p.Birthday), '-', DAY(p.Birthday))))) AS Age  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.HCT >= 52  GROUP BY p.ID  HAVING COUNT(l.ID) >= 2;	thrombosis_prediction
SELECT AVG(HCT) AS Average_Hematocrit_Level FROM Laboratory WHERE Date LIKE '1991%' AND HCT < 29;	thrombosis_prediction
SELECT      SUM(CASE WHEN PLT < 100 THEN 1 ELSE 0 END) AS Lower_Than_Normal,     SUM(CASE WHEN PLT > 400 THEN 1 ELSE 0 END) AS Higher_Than_Normal,     SUM(CASE WHEN PLT < 100 THEN 1 ELSE 0 END) - SUM(CASE WHEN PLT > 400 THEN 1 ELSE 0 END) AS Difference FROM (     SELECT ID, MIN(PLT) AS PLT     FROM Laboratory     GROUP BY ID ) AS grouped_data;	thrombosis_prediction
SELECT DISTINCT p.ID, p.SEX, p.Birthday, p.First_Date, l.Date, l.PLT FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE YEAR(l.Date) = '1984'    AND (YEAR(CURRENT_TIMESTAMP) - YEAR(p.Birthday)) < 50   AND l.PLT BETWEEN 100 AND 400;	thrombosis_prediction
SELECT      (CAST(SUM(CASE WHEN Laboratory.PT >= 14 AND Patient.SEX = 'F' THEN 1 ELSE 0 END) AS FLOAT) /      CAST(SUM(CASE WHEN Laboratory.PT >= 14 THEN 1 ELSE 0 END) AS FLOAT)) * 100 AS Female_Abnormal_PT_Percentage FROM      Patient JOIN      Laboratory ON Patient.ID = Laboratory.ID WHERE      (strftime('%Y', 'now') - strftime('%Y', Patient.Birthday)) > 55;	thrombosis_prediction
SELECT DISTINCT P.* FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE YEAR(P.`First Date`) > 1992 AND L.PT < 14;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination  JOIN Laboratory ON Examination.ID = Laboratory.ID  WHERE Examination.`Examination Date` > '1997-01-01' AND Laboratory.APTT < 45;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) AS Patient_Count FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.APTT > 45 AND e.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT l.ID) AS MalePatientsWithAbnormalFG FROM Laboratory l JOIN Patient p ON l.ID = p.ID WHERE p.SEX = 'M'    AND l.WBC > 3.5    AND l.WBC < 9.0    AND (l.FG <= 150 OR l.FG >= 450);	thrombosis_prediction
SELECT COUNT(DISTINCT L.ID) FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE P.Birthday > '1980-01-01' AND (L.FG < 150 OR L.FG > 450);	thrombosis_prediction
SELECT DISTINCT Patient.Diagnosis FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.`U-PRO` >= 30;	thrombosis_prediction
SELECT p.ID  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.Diagnosis = 'SLE' AND CAST(l.`U-PRO` AS INTEGER) > 0 AND CAST(l.`U-PRO` AS INTEGER) < 30;	thrombosis_prediction
SELECT COUNT(DISTINCT ID) AS PatientCount FROM Laboratory WHERE IGG >= 2000;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  JOIN Examination e ON p.ID = e.ID  WHERE l.IGG > 900 AND l.IGG < 2000 AND e.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT p.Diagnosis  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.IGA = (SELECT MAX(l2.IGA) FROM Laboratory l2 WHERE l2.IGA BETWEEN 80 AND 500);	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) AS PatientCount FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.IGA > 80 AND l.IGA < 500 AND YEAR(p.`First Date`) >= 1990;	thrombosis_prediction
SELECT p.Diagnosis, COUNT(p.Diagnosis) AS Diagnosis_Count FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.IGM <= 40 OR l.IGM >= 400 GROUP BY p.Diagnosis ORDER BY Diagnosis_Count DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  WHERE Description IS NULL AND ID IN (SELECT ID FROM Laboratory WHERE CRP = '+');	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.CRE >= 1.5 AND (YEAR(CURDATE()) - YEAR(p.Birthday)) < 70;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID)  FROM Patient P JOIN Laboratory L ON P.ID = L.ID JOIN Examination E ON P.ID = E.ID WHERE L.RA IN ('-', '+-') AND E.KCT = '+';	thrombosis_prediction
SELECT DISTINCT p.Diagnosis  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday > '1985-01-01' AND l.RA IN ('-', '+-');	thrombosis_prediction
SELECT DISTINCT Patient.ID  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.RF < 20  AND (YEAR(CURDATE()) - YEAR(Patient.Birthday)) > 60;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID JOIN Examination e ON p.ID = e.ID WHERE l.RF < 20 AND e.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID JOIN Examination ON Patient.ID = Examination.ID WHERE Laboratory.C3 > 35 AND Examination.`ANA Pattern` = 'P';	thrombosis_prediction
SELECT E.ID  FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE L.HCT <= 29 OR L.HCT >= 52 ORDER BY E.`aCL IgA` DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID) AS PatientCount FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE E.Thrombosis = 1 AND L.C4 > 10;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) AS PatientCount FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE (l.RNP = '-' OR l.RNP = '+-') AND p.Admission = '+';	thrombosis_prediction
SELECT p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.RNP NOT IN ('-', '+-') ORDER BY p.Birthday DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT Examination.ID)  FROM Examination  JOIN Laboratory ON Examination.ID = Laboratory.ID  WHERE Laboratory.SM IN ('-', '+-') AND Examination.Thrombosis = 0;	thrombosis_prediction
SELECT p.ID  FROM Patient p JOIN Laboratory l ON p.ID = l.ID  WHERE l.SM NOT IN ('negative', '0')  ORDER BY p.Birthday DESC  LIMIT 3;	thrombosis_prediction
SELECT DISTINCT e.ID  FROM Examination e  JOIN Laboratory l ON e.ID = l.ID  WHERE e.`Examination Date` > '1997-01-01' AND l.SC170 IN ('negative', '0');	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) AS FemaleWithoutSymptoms FROM Patient P JOIN Examination E ON P.ID = E.ID JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'F'    AND E.Symptoms IS NULL    AND L.SC170 IN ('negative', '0');	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.SSA IN ('-', '+-') AND YEAR(p.`First Date`) < 2000;	thrombosis_prediction
SELECT ID  FROM Patient  WHERE `First Date` = (      SELECT MIN(`First Date`)      FROM Patient      WHERE `First Date` IS NOT NULL AND ID IN (          SELECT ID          FROM Laboratory          WHERE SSA NOT IN ('negative', '0') AND SSA IS NOT NULL     )  );	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) AS Patient_Count FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.SSB IN ('-', '+-') AND P.Diagnosis = 'SLE';	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID)  FROM Examination E  JOIN Laboratory L ON E.ID = L.ID  WHERE L.SSB IN ('negative', '0') AND E.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.SEX = 'M' AND Laboratory.CENTROMEA IN ('-', '+-') AND Laboratory.SSB IN ('-', '+-');	thrombosis_prediction
SELECT DISTINCT Patient.Diagnosis FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.DNA >= 8;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) AS NumberOfPatients FROM Patient p LEFT JOIN Laboratory l ON p.ID = l.ID WHERE l.`DNA` < 8 AND p.`Description` IS NULL;	thrombosis_prediction
SELECT COUNT(*) AS AdmittedPatientsCount FROM Patient WHERE Admission = '+' AND ID IN (     SELECT ID     FROM Laboratory     WHERE IGG > 900 AND IGG < 2000 );	thrombosis_prediction
SELECT (COUNT(DISTINCT L.ID) * 1.0 / (SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE GOT >= 60)) * 100 AS Percentage FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE L.GOT >= 60 AND P.Diagnosis = 'SLE';	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.GOT < 60;	thrombosis_prediction
SELECT MAX(Birthday) AS Youngest_Birthday FROM Patient WHERE ID IN (     SELECT ID     FROM Laboratory     WHERE GOT >= 60 );	thrombosis_prediction
SELECT P.Birthday FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GPT < 60 GROUP BY P.ID, P.Birthday ORDER BY MAX(L.GPT) DESC LIMIT 3;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) AS MalePatientsWithNormalGOT FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.GOT < 60 AND Patient.SEX = 'M';	thrombosis_prediction
SELECT MIN(p.`First Date`) AS First_Record_Date  FROM Patient p  WHERE p.ID = (     SELECT l.ID      FROM Laboratory l      WHERE l.LDH = (         SELECT MAX(LDH)          FROM Laboratory          WHERE LDH < 500     ) );	thrombosis_prediction
SELECT MAX(L.Date) AS LatestMedicalDataDate FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE P.ID = (SELECT ID FROM Patient WHERE `First Date` = (SELECT MAX(`First Date`) FROM Patient)) AND L.LDH >= 500;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.ALP >= 300 AND p.Admission = '+';	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '+' AND l.ALP < 300;	thrombosis_prediction
SELECT DISTINCT Patient.Diagnosis FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.TP < 6.0;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) AS NumberOfPatients FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis = 'SJS' AND l.TP > 6.0 AND l.TP < 8.5;	thrombosis_prediction
SELECT Date AS Examination_Date  FROM Laboratory  WHERE ALB = (SELECT MAX(ALB)               FROM Laboratory               WHERE ALB > 3.5 AND ALB < 5.5);	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) AS MalePatientsWithNormalLevels FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M'    AND L.ALB > 3.5 AND L.ALB < 5.5    AND L.TP BETWEEN 6.0 AND 8.5;	thrombosis_prediction
SELECT Examination.`aCL IgG`, Examination.`aCL IgM`, Examination.`aCL IgA` FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.SEX = 'F' AND Examination.ID = (     SELECT Laboratory.ID     FROM Laboratory     WHERE Laboratory.UA <= 6.50     ORDER BY Laboratory.UA DESC     LIMIT 1 );	thrombosis_prediction
SELECT MAX(ANA) AS Highest_ANA FROM Examination WHERE ID IN (     SELECT ID     FROM Laboratory     WHERE CRE < 1.5 );	thrombosis_prediction
SELECT e.ID  FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.CRE < 1.5 AND e.`aCL IgA` = (SELECT MAX(`aCL IgA`) FROM Examination);	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) AS PatientCount FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.`T-BIL` >= 2.0 AND e.`ANA Pattern` LIKE '%P%';	thrombosis_prediction
SELECT E.ANA  FROM Examination E  JOIN Laboratory L ON E.ID = L.ID AND E.`Examination Date` = L.`Date`  WHERE L.`T-BIL` = (SELECT MAX(`T-BIL`)                     FROM Laboratory                     WHERE `T-BIL` < 2.0);	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) AS PatientCount FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.`T-CHO` >= 250 AND e.KCT = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT Examination.ID) AS PatientCount FROM Examination JOIN Laboratory ON Examination.ID = Laboratory.ID WHERE Laboratory.`T-CHO` < 250 AND Examination.`ANA Pattern` = 'P';	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) AS PatientCount FROM Patient p JOIN Laboratory l ON p.ID = l.ID JOIN Examination e ON p.ID = e.ID WHERE l.TG < 200 AND e.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT P.Diagnosis  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.TG = (SELECT MAX(TG) FROM Laboratory WHERE TG < 200);	thrombosis_prediction
SELECT DISTINCT Examination.ID  FROM Examination  JOIN Laboratory ON Examination.ID = Laboratory.ID  WHERE Examination.Thrombosis = 0 AND Laboratory.CPK < 250;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) AS Patient_Count FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.CPK < 250 AND (e.KCT = '+' OR e.RVVT = '+' OR e.LAC = '+');	thrombosis_prediction
SELECT MIN(P.Birthday) AS OldestPatientBirthday  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.GLU > 180;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) AS PatientCount FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.GLU < 180 AND e.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '+' AND l.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient AS P JOIN Laboratory AS L  ON P.ID = L.ID WHERE P.Diagnosis = 'SLE' AND L.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE (l.RBC <= 3.5 OR l.RBC >= 6.0) AND p.Admission = '+';	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  JOIN Examination e ON p.ID = e.ID  WHERE l.PLT > 100 AND l.PLT < 400 AND e.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT L.PLT  FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE P.Diagnosis = 'MCTD' AND L.PLT > 100 AND L.PLT < 400;	thrombosis_prediction
SELECT AVG(PT) AS Average_PT FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE Patient.SEX = 'M' AND Laboratory.PT < 14;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) AS Severe_Thrombosis_Patients_With_Normal_PT FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE e.Thrombosis IN (1, 2) AND l.PT < 14;	thrombosis_prediction
SELECT major.major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Angela' AND member.last_name = 'Sanders';	student_club
SELECT COUNT(*) AS student_count FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.college = 'College of Engineering';	student_club
SELECT m.first_name || ' ' || m.last_name AS full_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.department = 'Art and Design';	student_club
SELECT COUNT(*) AS attendee_count FROM attendance JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = "Women's Soccer";	student_club
SELECT m.phone FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = "Women's Soccer";	student_club
SELECT COUNT(*) AS medium_tshirt_count FROM member WHERE t_shirt_size = 'Medium' AND member_id IN (     SELECT link_to_member     FROM attendance     WHERE link_to_event = (         SELECT event_id         FROM event         WHERE event_name = "Women's Soccer"     ) );	student_club
SELECT e.event_id, e.event_name, COUNT(a.link_to_event) AS attendance_count FROM event e JOIN attendance a ON e.event_id = a.link_to_event GROUP BY e.event_id, e.event_name ORDER BY attendance_count DESC LIMIT 1;	student_club
SELECT maj.college  FROM member AS mem  JOIN major AS maj ON mem.link_to_major = maj.major_id  WHERE mem.position = 'Vice President';	student_club
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.first_name = 'Maya' AND m.last_name = 'Mclean';	student_club
SELECT COUNT(*) AS event_count FROM attendance a JOIN member m ON a.link_to_member = m.member_id JOIN event e ON a.link_to_event = e.event_id WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison' AND strftime('%Y', e.event_date) = '2019';	student_club
SELECT COUNT(DISTINCT e.event_id) AS meeting_event_count  FROM event e  WHERE e.type = 'Meeting'  AND e.event_id IN (     SELECT a.link_to_event      FROM attendance a      GROUP BY a.link_to_event      HAVING COUNT(a.link_to_member) > 10 );	student_club
SELECT e.event_name  FROM event e  JOIN attendance a ON e.event_id = a.link_to_event  WHERE e.type != 'Fundraiser'  GROUP BY e.event_name  HAVING COUNT(a.link_to_event) > 20;	student_club
SELECT AVG(attendance_count) AS average_attendance FROM (     SELECT e.event_name, COUNT(a.link_to_member) AS attendance_count     FROM event e     JOIN attendance a ON e.event_id = a.link_to_event     WHERE e.type = 'Meeting' AND strftime('%Y', e.event_date) = '2020'     GROUP BY e.event_name );	student_club
SELECT e.expense_description, MAX(e.cost) AS most_expensive  FROM expense e  JOIN budget b ON e.link_to_budget = b.budget_id  JOIN event ev ON b.link_to_event = ev.event_id;	student_club
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Environmental Engineering';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Laugh Out Loud';	student_club
SELECT m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Law and Constitutional Studies';	student_club
SELECT z.county FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Sherri' AND m.last_name = 'Ramsey';	student_club
SELECT major.college FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Tyler' AND member.last_name = 'Hewitt';	student_club
SELECT SUM(income.amount) AS total_funds_received FROM income JOIN member ON income.link_to_member = member.member_id WHERE member.position = 'Vice President';	student_club
SELECT SUM(spent) AS total_spent_on_food FROM budget WHERE category = 'Food' AND link_to_event IN (     SELECT event_id     FROM event     WHERE event_name = 'September Meeting' );	student_club
SELECT z.city, z.state FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.position = 'President';	student_club
SELECT member.first_name || ' ' || member.last_name AS full_name FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE zip_code.state = 'Illinois';	student_club
SELECT b.spent  FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE b.category = 'Advertisement' AND e.event_name = 'September Meeting';	student_club
SELECT DISTINCT m.department FROM major AS m JOIN member AS mem ON m.major_id = mem.link_to_major WHERE mem.first_name IN ('Pierce', 'Guidi');	student_club
SELECT SUM(b.amount) AS total_budgeted_amount FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'October Speaker';	student_club
SELECT e.expense_id, e.expense_description,  CASE      WHEN e.approved = 'True' THEN 'Approved'     WHEN e.approved = 'False' THEN 'Not Approved' END AS approval_status FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.event_name = 'October Meeting' AND ev.event_date = '2019-10-08';	student_club
SELECT AVG(e.cost) AS total_average_cost FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.first_name = 'Elijah' AND m.last_name = 'Allen' AND (SUBSTR(e.expense_date, 6, 2) = '09' OR SUBSTR(e.expense_date, 6, 2) = '10');	student_club
SELECT      (SELECT SUM(b.spent)       FROM budget b       JOIN event e ON b.link_to_event = e.event_id       WHERE SUBSTR(e.event_date, 1, 4) = '2019') -      (SELECT SUM(b.spent)       FROM budget b       JOIN event e ON b.link_to_event = e.event_id       WHERE SUBSTR(e.event_date, 1, 4) = '2020') AS difference;	student_club
SELECT location  FROM event  WHERE event_name = 'Spring Budget Review';	student_club
SELECT e.cost  FROM expense e  WHERE e.expense_description = 'Posters' AND e.expense_date = '2019-09-04';	student_club
SELECT remaining  FROM budget  WHERE category = 'Food'  ORDER BY amount DESC  LIMIT 1;	student_club
SELECT notes  FROM income  WHERE source = 'Fundraising' AND date_received = '2019-09-14';	student_club
SELECT COUNT(*)  FROM major  WHERE college = 'College of Humanities and Social Sciences';	student_club
SELECT phone  FROM member  WHERE first_name = 'Carlo' AND last_name = 'Jacobs';	student_club
SELECT z.county  FROM member m  JOIN zip_code z ON m.zip = z.zip_code  WHERE m.first_name = 'Adela' AND m.last_name = "O'Gallagher";	student_club
SELECT COUNT(*) AS exceeded_budget_count FROM budget WHERE link_to_event IN (     SELECT event_id     FROM event     WHERE event_name = 'November Meeting' ) AND remaining < 0;	student_club
SELECT SUM(budget.amount) AS total_budget_amount FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'September Speaker';	student_club
SELECT e.status  FROM event e JOIN budget b ON e.event_id = b.link_to_event JOIN expense ex ON b.budget_id = ex.link_to_budget WHERE ex.expense_description = 'Post Cards, Posters'    AND ex.expense_date = '2019-8-20';	student_club
SELECT major.major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Brent' AND member.last_name = 'Thomason';	student_club
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Business' AND member.t_shirt_size = 'Medium';	student_club
SELECT z.type  FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Christof' AND m.last_name = 'Nielson';	student_club
SELECT major.major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'Vice President';	student_club
SELECT z.state  FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison';	student_club
SELECT major.department FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'President';	student_club
SELECT i.date_received  FROM income i JOIN member m ON i.link_to_member = m.member_id WHERE m.first_name = 'Connor' AND m.last_name = 'Hilton' AND i.source = 'Dues';	student_club
SELECT m.first_name || ' ' || m.last_name AS full_name FROM income i JOIN member m ON i.link_to_member = m.member_id WHERE i.date_received = (SELECT MIN(date_received)                           FROM income                           WHERE source = 'Dues') AND i.source = 'Dues';	student_club
SELECT      SUM(CASE WHEN e.event_name = 'Yearly Kickoff' THEN b.amount ELSE 0 END) /      SUM(CASE WHEN e.event_name = 'October Meeting' THEN b.amount ELSE 0 END) AS times_more FROM      budget b JOIN      event e ON      b.link_to_event = e.event_id WHERE      b.category = 'Advertisement';	student_club
SELECT      (SUM(b.amount) * 100.0 / (SELECT SUM(b1.amount) FROM budget b1 JOIN event e1 ON b1.link_to_event = e1.event_id WHERE e1.event_name = 'November Speaker')) AS parking_percentage  FROM      budget b  JOIN      event e ON b.link_to_event = e.event_id  WHERE      b.category = 'Parking' AND e.event_name = 'November Speaker';	student_club
SELECT SUM(cost) AS total_pizza_cost FROM expense WHERE expense_description = 'Pizza';	student_club
SELECT COUNT(DISTINCT city)  FROM zip_code  WHERE county = 'Orange County' AND state = 'Virginia';	student_club
SELECT DISTINCT department  FROM major  WHERE college = 'College of Humanities and Social Sciences';	student_club
SELECT z.city, z.county, z.state  FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Amy' AND m.last_name = 'Firth';	student_club
SELECT e.expense_description FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id WHERE b.remaining = (SELECT MIN(remaining) FROM budget);	student_club
SELECT member.first_name, member.last_name, member.email  FROM member JOIN attendance ON member.member_id = attendance.link_to_member JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'October Meeting';	student_club
SELECT major.college, COUNT(member.member_id) AS member_count FROM member JOIN major ON member.link_to_major = major.major_id GROUP BY major.college ORDER BY member_count DESC LIMIT 1;	student_club
SELECT major.major_name  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE member.phone = '809-555-3360';	student_club
SELECT event.event_name  FROM event  JOIN budget ON event.event_id = budget.link_to_event  WHERE budget.amount = (SELECT MAX(amount) FROM budget);	student_club
SELECT e.expense_description  FROM expense e  JOIN member m ON e.link_to_member = m.member_id  WHERE m.position = 'Vice President';	student_club
SELECT COUNT(*) AS member_count FROM attendance JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = "Women's Soccer";	student_club
SELECT i.date_received FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE m.first_name = 'Casey' AND m.last_name = 'Mason';	student_club
SELECT COUNT(DISTINCT m.member_id) AS total_members FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE z.state = 'Maryland';	student_club
SELECT COUNT(*) AS event_count FROM attendance JOIN member ON attendance.link_to_member = member.member_id WHERE member.phone = '954-555-6240';	student_club
SELECT member.first_name || ' ' || member.last_name AS full_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT e.event_name, (b.spent / b.amount) AS highest_ratio  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  WHERE e.status = 'Closed'  ORDER BY highest_ratio DESC  LIMIT 1;	student_club
SELECT COUNT(*)  FROM member  WHERE position = 'President';	student_club
SELECT MAX(spent) AS highest_budget_spent  FROM budget;	student_club
SELECT COUNT(*)  FROM event  WHERE type = 'Meeting' AND strftime('%Y', event_date) = '2020';	student_club
SELECT SUM(spent) AS total_spent_for_food FROM budget WHERE category = 'Food';	student_club
SELECT CONCAT(m.first_name, ' ', m.last_name) AS full_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member GROUP BY m.member_id HAVING COUNT(a.link_to_event) > 7;	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE ma.major_name = 'Interior Design' AND e.event_name = 'Community Theater';	student_club
SELECT member.first_name || ' ' || member.last_name AS full_name FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE zip_code.city = 'Georgetown' AND zip_code.state = 'South Carolina';	student_club
SELECT SUM(income.amount) AS total_income FROM income JOIN member ON income.link_to_member = member.member_id WHERE member.first_name = 'Grant' AND member.last_name = 'Gilmour';	student_club
SELECT CONCAT(m.first_name, ' ', m.last_name) AS full_name FROM member AS m JOIN income AS i ON m.member_id = i.link_to_member WHERE i.amount > 40;	student_club
SELECT SUM(e.cost) AS total_expense FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.event_name = 'Yearly Kickoff';	student_club
SELECT CONCAT(m.first_name, ' ', m.last_name) AS full_name FROM budget b JOIN event e ON b.link_to_event = e.event_id JOIN member m ON b.budget_id = m.position WHERE e.event_name = 'Yearly Kickoff';	student_club
SELECT CONCAT(m.first_name, ' ', m.last_name) AS full_name, i.source, i.amount FROM income i JOIN member m ON i.link_to_member = m.member_id WHERE i.amount = (SELECT MAX(amount) FROM income);	student_club
SELECT e.event_name  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  JOIN expense ex ON b.budget_id = ex.link_to_budget  ORDER BY ex.cost ASC  LIMIT 1;	student_club
SELECT (SUM(e.cost) * 100.0 / (SELECT SUM(cost) FROM expense)) AS percentage FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.event_name = 'Yearly Kickoff';	student_club
SELECT      CAST(SUM(CASE WHEN major_name = 'Finance' THEN 1 ELSE 0 END) AS FLOAT) /      NULLIF(SUM(CASE WHEN major_name = 'Physics' THEN 1 ELSE 0 END), 0) AS ratio FROM major;	student_club
SELECT source, amount  FROM income  WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30'  ORDER BY amount DESC  LIMIT 1;	student_club
SELECT first_name || ' ' || last_name AS full_name, email  FROM member  WHERE position = 'Secretary';	student_club
SELECT COUNT(*) AS member_count FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Physics Teaching';	student_club
SELECT COUNT(DISTINCT attendance.link_to_member) AS member_count FROM attendance JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'Community Theater' AND strftime('%Y', event.event_date) = '2019';	student_club
SELECT COUNT(DISTINCT a.link_to_event) AS number_of_events, m_major.major_name AS major FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN major m_major ON m.link_to_major = m_major.major_id WHERE m.first_name = 'Luisa' AND m.last_name = 'Guidi';	student_club
SELECT SUM(spent) / COUNT(spent) AS average_food_spent_per_event FROM budget WHERE category = 'Food' AND event_status = 'Closed';	student_club
SELECT e.event_name  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  WHERE b.category = 'Advertisement'  ORDER BY b.spent DESC  LIMIT 1;	student_club
SELECT COUNT(*) AS attendance_count FROM attendance JOIN member ON attendance.link_to_member = member.member_id JOIN event ON attendance.link_to_event = event.event_id WHERE member.first_name = 'Maya' AND member.last_name = 'Mclean' AND event.event_name = 'Women''s Soccer';	student_club
SELECT      (SUM(CASE WHEN type = 'Community Service' THEN 1 ELSE 0 END)::float / COUNT(event_id)) * 100 AS percentage_share  FROM event  WHERE event_date BETWEEN '2019-01-01' AND '2019-12-31';	student_club
SELECT e.cost FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE e.expense_description = 'Posters' AND ev.event_name = 'September Speaker';	student_club
SELECT t_shirt_size, COUNT(t_shirt_size) AS size_count FROM member GROUP BY t_shirt_size ORDER BY size_count DESC LIMIT 1;	student_club
SELECT e.event_name  FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.status = 'Closed' AND b.remaining < 0 ORDER BY b.remaining ASC LIMIT 1;	student_club
SELECT e.expense_description AS expense_type, SUM(e.cost) AS total_value FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.event_name = 'October Meeting' AND e.approved = 'Yes' GROUP BY e.expense_description;	student_club
SELECT category, SUM(amount) AS total_budgeted FROM budget WHERE link_to_event = (     SELECT event_id     FROM event     WHERE event_name = 'April Speaker' ) GROUP BY category ORDER BY total_budgeted ASC;	student_club
SELECT budget_id, category, amount  FROM budget  WHERE category = 'Food'  ORDER BY amount DESC  LIMIT 1;	student_club
SELECT *  FROM budget  WHERE category = 'Advertising'  ORDER BY amount DESC  LIMIT 3;	student_club
SELECT SUM(cost) AS total_cost_spent_for_parking FROM expense WHERE expense_description = 'Parking';	student_club
SELECT SUM(cost) AS total_expense FROM expense WHERE expense_date = '2019-08-20';	student_club
SELECT m.first_name || ' ' || m.last_name AS full_name,         SUM(e.cost) AS total_cost FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE m.member_id = 'rec4BLdZHS2Blfp4v' GROUP BY full_name;	student_club
SELECT expense.expense_description FROM expense JOIN member ON expense.link_to_member = member.member_id WHERE member.first_name = 'Sacha' AND member.last_name = 'Harrison';	student_club
SELECT expense.expense_description  FROM expense  JOIN member ON expense.link_to_member = member.member_id  WHERE member.t_shirt_size = 'X-Large';	student_club
SELECT m.zip  FROM member m  JOIN expense e ON m.member_id = e.link_to_member  WHERE e.cost < 50;	student_club
SELECT major.major_name  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE member.first_name = 'Phillip' AND member.last_name = 'Cullen';	student_club
SELECT DISTINCT member.position  FROM member  INNER JOIN major  ON member.link_to_major = major.major_id  WHERE major.major_name = 'Business';	student_club
SELECT COUNT(*)  FROM member  WHERE t_shirt_size = 'Medium'  AND link_to_major IN (     SELECT major_id      FROM major      WHERE major_name = 'Business' );	student_club
SELECT DISTINCT e.type  FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.remaining > 30;	student_club
SELECT DISTINCT type  FROM event  WHERE location = 'MU 215';	student_club
SELECT category  FROM budget  WHERE link_to_event = (SELECT event_id FROM event WHERE event_date = '2020-03-24T12:00:00');	student_club
SELECT major.major_name  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE member.position = 'Vice President';	student_club
SELECT (SUM(CASE WHEN m.position = 'Member' AND ma.major_name = 'Business' THEN 1 ELSE 0 END) * 100.0 / COUNT(m.member_id)) AS percentage_business_members FROM member m JOIN major ma ON m.link_to_major = ma.major_id;	student_club
SELECT DISTINCT type  FROM event  WHERE location = 'MU 215';	student_club
SELECT COUNT(*)  FROM income  WHERE amount = 50;	student_club
SELECT COUNT(*)  FROM member  WHERE position = 'Member' AND t_shirt_size = 'X-Large';	student_club
SELECT COUNT(*)  FROM major  WHERE college = 'College of Agriculture and Applied Sciences'  AND department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT m.last_name, ma.department, ma.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Environmental Engineering';	student_club
SELECT b.category FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.location = 'MU 215' AND e.type = 'Guest Speaker' AND b.spent = 0;	student_club
SELECT z.city, z.state FROM member m JOIN zip_code z ON m.zip = z.zip_code JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.department = 'Electrical and Computer Engineering Department' AND m.position = 'Member';	student_club
SELECT e.event_name  FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE e.type = 'Social' AND m.position = 'Vice President' AND e.location = '900 E. Washington St.';	student_club
SELECT m.last_name, m.position FROM member AS m JOIN expense AS e ON m.member_id = e.link_to_member WHERE e.expense_description = 'Pizza' AND e.expense_date = '2019-09-10';	student_club
SELECT m.last_name  FROM attendance a JOIN event e ON a.link_to_event = e.event_id JOIN member m ON a.link_to_member = m.member_id WHERE e.event_name = 'Women\'s Soccer' AND m.position = 'Member';	student_club
SELECT (CAST(COUNT(CASE WHEN i.amount = 50 THEN 1 END) AS FLOAT) / COUNT(m.member_id)) * 100 AS percentage FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE m.t_shirt_size = 'Medium' AND m.position = 'Member';	student_club
SELECT DISTINCT county  FROM zip_code  WHERE type = 'Unique';	student_club
SELECT zip_code  FROM zip_code  WHERE type = 'PO Box' AND county = 'San Juan Municipio' AND state = 'Puerto Rico';	student_club
SELECT event_name  FROM event  WHERE type = 'Game'  AND status = 'Closed'  AND event_date BETWEEN '2019-03-15' AND '2020-03-20';	student_club
SELECT DISTINCT attendance.link_to_event FROM expense JOIN attendance ON expense.link_to_member = attendance.link_to_member WHERE expense.cost > 50;	student_club
SELECT DISTINCT m.member_id, m.first_name, m.last_name, a.link_to_event FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN expense e ON m.member_id = e.link_to_member WHERE e.approved = 'true' AND e.expense_date BETWEEN '2019-01-10' AND '2019-11-19';	student_club
SELECT m.college  FROM major AS m JOIN member AS mb ON m.major_id = mb.link_to_major WHERE mb.first_name = 'Katy' AND mb.link_to_major = 'rec1N0upiVLy5esTO';	student_club
SELECT m.phone FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Business' AND ma.college = 'College of Agriculture and Applied Sciences';	student_club
SELECT m.email  FROM expense e  JOIN member m ON e.link_to_member = m.member_id  WHERE e.expense_date BETWEEN '2019-09-10' AND '2019-11-19'  AND e.cost > 20;	student_club
SELECT COUNT(*) AS member_count  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Education'  AND major.college = 'Education & Human Services'  AND member.position = 'Member';	student_club
SELECT (CAST(SUM(CASE WHEN remaining < 0 THEN 1 ELSE 0 END) AS FLOAT) / COUNT(event_id)) * 100 AS percentage_over_budget FROM budget;	student_club
SELECT event_id, location, status  FROM event  WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31';	student_club
SELECT expense_description FROM expense GROUP BY expense_description HAVING AVG(cost) > 50;	student_club
SELECT first_name || ' ' || last_name AS full_name FROM member WHERE t_shirt_size = 'X-Large';	student_club
SELECT (SUM(CASE WHEN type = 'PO Box' THEN 1 ELSE 0 END) * 100.0 / COUNT(zip_code)) AS percentage_po_box FROM zip_code;	student_club
SELECT e.event_name, e.location  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  WHERE b.remaining > 0;	student_club
SELECT e.event_name, e.event_date FROM event e JOIN budget b ON e.event_id = b.link_to_event JOIN expense ex ON b.budget_id = ex.link_to_budget WHERE ex.expense_description = 'Pizza' AND ex.cost > 50 AND ex.cost < 100;	student_club
SELECT m.first_name || ' ' || m.last_name AS full_name, ma.major_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost > 100;	student_club
SELECT z.city, z.county FROM event e JOIN income i ON i.link_to_member IN (     SELECT link_to_member     FROM attendance     WHERE link_to_event = e.event_id ) JOIN member m ON m.member_id = i.link_to_member JOIN zip_code z ON m.zip = z.zip_code GROUP BY e.event_id, z.city, z.county HAVING COUNT(i.income_id) > 40;	student_club
SELECT m.member_id, m.first_name, m.last_name, SUM(e.cost) AS total_cost FROM member m JOIN expense e ON m.member_id = e.link_to_member JOIN budget b ON e.link_to_budget = b.budget_id GROUP BY m.member_id, m.first_name, m.last_name HAVING COUNT(DISTINCT b.link_to_event) > 1 ORDER BY total_cost DESC LIMIT 1;	student_club
SELECT SUM(e.cost) / COUNT(e.expense_id) AS average_amount_paid FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.position != 'Member';	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event JOIN expense ex ON b.budget_id = ex.link_to_budget WHERE b.category = 'Parking' GROUP BY e.event_name HAVING SUM(ex.cost) < (SELECT SUM(ex.cost) / COUNT(DISTINCT e.event_id)                        FROM expense ex                        JOIN budget b ON ex.link_to_budget = b.budget_id                        JOIN event e ON b.link_to_event = e.event_id                        WHERE b.category = 'Parking');	student_club
SELECT      (SUM(e.cost) / SUM(b.amount)) * 100 AS percentage_cost_for_meeting_events FROM      event ev JOIN      budget b ON ev.event_id = b.link_to_event JOIN      expense e ON b.budget_id = e.link_to_budget WHERE      ev.type = 'Meeting';	student_club
SELECT b.budget_id, MAX(e.cost) AS max_cost FROM budget b JOIN expense e ON b.budget_id = e.link_to_budget WHERE e.expense_description = 'Water, chips, cookies' GROUP BY b.budget_id ORDER BY max_cost DESC LIMIT 1;	student_club
SELECT m.first_name || ' ' || m.last_name AS full_name, SUM(e.cost) AS total_spent FROM member m JOIN expense e ON m.member_id = e.link_to_member GROUP BY m.member_id ORDER BY total_spent DESC LIMIT 5;	student_club
SELECT      m.first_name || ' ' || m.last_name AS full_name,      m.phone  FROM      expense e  JOIN      member m  ON      e.link_to_member = m.member_id  WHERE      e.cost > (SELECT AVG(cost) FROM expense);	student_club
SELECT    (CAST(SUM(z.state = 'New Jersey') AS FLOAT) / COUNT(m.position = 'Member') -     CAST(SUM(z.state = 'Vermont') AS FLOAT) / COUNT(m.position = 'Member')) AS difference_percentage FROM member m JOIN zip_code z ON m.zip = z.zip_code;	student_club
SELECT major.major_name, major.department FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Garrett' AND member.last_name = 'Gerke';	student_club
SELECT m.first_name || ' ' || m.last_name AS full_name, e.cost FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE e.expense_description = 'Water, Veggie tray, supplies';	student_club
SELECT m.last_name, m.phone FROM member AS m JOIN major AS ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Elementary Education';	student_club
SELECT budget.category, budget.amount  FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'January Speaker';	student_club
SELECT DISTINCT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.category = 'Food';	student_club
SELECT member.first_name || ' ' || member.last_name AS full_name, income.amount FROM income JOIN member ON income.link_to_member = member.member_id WHERE income.date_received = '9/9/2019';	student_club
SELECT b.category FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id WHERE e.expense_description = 'Posters';	student_club
SELECT member.first_name || ' ' || member.last_name AS full_name, major.college  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE member.position = 'Secretary';	student_club
SELECT e.event_name, SUM(b.spent) AS total_spent FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE b.category = 'Speaker Gifts' GROUP BY e.event_name;	student_club
SELECT z.city  FROM member m  JOIN zip_code z ON m.zip = z.zip_code  WHERE m.first_name = 'Garrett' AND m.last_name = 'Gerke';	student_club
INSERT INTO zip_code VALUES (28092, 'Standard', 'Lincolnton', 'Lincoln County', 'North Carolina', 'NC');  SELECT m.first_name || ' ' || m.last_name AS full_name, m.position FROM member AS m JOIN zip_code AS z ON m.zip = z.zip_code WHERE z.city = 'Lincolnton' AND z.state = 'North Carolina' AND z.zip_code = 28092;	student_club
SELECT COUNT(*)  FROM gasstations  WHERE Country = 'CZE' AND Segment = 'Premium';	debit_card_specializing
SELECT      CASE          WHEN (SELECT COUNT(*) FROM customers WHERE Currency = 'CZK') = 0 THEN NULL         ELSE (SELECT COUNT(*) FROM customers WHERE Currency = 'EUR') * 1.0 /               (SELECT COUNT(*) FROM customers WHERE Currency = 'CZK')      END AS Ratio;	debit_card_specializing
SELECT CustomerID, Consumption AS LeastConsumption  FROM yearmonth  WHERE SUBSTR(Date, 1, 4) = '2012'    AND CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'LAM')  ORDER BY Consumption ASC  LIMIT 1;	debit_card_specializing
SELECT AVG(Consumption) / 12 AS AverageMonthlyConsumption FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE customers.Segment = 'SME' AND SUBSTR(yearmonth.Date, 1, 4) = '2013';	debit_card_specializing
SELECT c.CustomerID, SUM(y.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Currency = 'EUR' AND y.Date BETWEEN '201101' AND '201112' GROUP BY c.CustomerID ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT COUNT(y.CustomerID) AS CustomerCount FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Segment = 'LAM'    AND y.Date BETWEEN '201201' AND '201212' GROUP BY y.CustomerID HAVING SUM(y.Consumption) < 30000;	debit_card_specializing
SELECT      (0) -      (SELECT SUM(y.Consumption)       FROM yearmonth y      JOIN customers c ON y.CustomerID = c.CustomerID      WHERE c.Currency = 'EUR' AND SUBSTR(y.Date, 1, 4) = '2012') AS Difference;	debit_card_specializing
SELECT      SUBSTR(y.Date, 1, 4) AS Year,      SUM(y.Consumption) AS TotalConsumption FROM      yearmonth y JOIN      customers c ON y.CustomerID = c.CustomerID WHERE      c.Currency = 'EUR' GROUP BY      Year ORDER BY      TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT c.Segment, SUM(y.Consumption) AS TotalConsumption FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID GROUP BY c.Segment ORDER BY TotalConsumption ASC LIMIT 1;	debit_card_specializing
SELECT      SUBSTR(y.Date, 1, 4) AS Year,      SUM(y.Consumption) AS TotalConsumption FROM      yearmonth y JOIN      customers c ON y.CustomerID = c.CustomerID WHERE      c.Currency = 'EUR' GROUP BY      Year ORDER BY      TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT SUBSTR(Date, 1, 6) AS Month, SUM(Consumption) AS TotalConsumption  FROM yearmonth  WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'SME')    AND Date BETWEEN '201301' AND '201312'  GROUP BY Month  ORDER BY TotalConsumption DESC  LIMIT 1;	debit_card_specializing
WITH TotalConsumption AS (     SELECT          c.Segment,          y.CustomerID,          SUM(y.Consumption) AS TotalConsumption     FROM          yearmonth y     JOIN          customers c ON y.CustomerID = c.CustomerID     WHERE          SUBSTR(y.Date, 1, 4) = '2013' AND c.Currency = 'EUR'     GROUP BY          c.Segment, y.CustomerID ), MinConsumption AS (     SELECT          Segment,          MIN(TotalConsumption) AS MinTotalConsumption     FROM          TotalConsumption     GROUP BY          Segment ), AnnualAverage AS (     SELECT          tc.Segment,          SUM(tc.TotalConsumption) AS TotalConsumption,          COUNT(tc.CustomerID) AS CustomerCount,         (SUM(tc.TotalConsumption) / COUNT(tc.CustomerID)) AS AnnualAverage     FROM          TotalConsumption tc     JOIN          MinConsumption mc ON tc.Segment = mc.Segment AND tc.TotalConsumption = mc.MinTotalConsumption     GROUP BY          tc.Segment ) SELECT      sm.AnnualAverage - lm.AnnualAverage AS SME_vs_LAM_Difference FROM      (SELECT * FROM AnnualAverage WHERE Segment = 'SME') sm,     (SELECT * FROM AnnualAverage WHERE Segment = 'LAM') lm;	debit_card_specializing
SELECT      c.Segment,     ((SUM(CASE WHEN SUBSTR(y.Date, 1, 4) = '2013' THEN y.Consumption ELSE 0 END) -      SUM(CASE WHEN SUBSTR(y.Date, 1, 4) = '2012' THEN y.Consumption ELSE 0 END)) /      SUM(CASE WHEN SUBSTR(y.Date, 1, 4) = '2012' THEN y.Consumption ELSE 0 END)) * 100 AS PercentageIncrease FROM      yearmonth y JOIN      customers c ON y.CustomerID = c.CustomerID WHERE      c.Currency = 'EUR' AND SUBSTR(y.Date, 1, 4) IN ('2012', '2013') GROUP BY      c.Segment ORDER BY      PercentageIncrease DESC;	debit_card_specializing
SELECT SUM(Consumption) AS TotalConsumption FROM yearmonth WHERE CustomerID = 6 AND Date BETWEEN '201308' AND '201311';	debit_card_specializing
SELECT      (SELECT COUNT(*)       FROM gasstations       WHERE Country = 'CZE' AND Segment = 'Value for money') -      (SELECT COUNT(*)       FROM gasstations       WHERE Country = 'SVK' AND Segment = 'Value for money') AS Difference;	debit_card_specializing
SELECT      CASE          WHEN EXISTS (SELECT 1 FROM yearmonth WHERE CustomerID = 7 AND Date = '201304') THEN              COALESCE((SELECT Consumption FROM yearmonth WHERE CustomerID = 7 AND Date = '201304'), 0) -              COALESCE((SELECT Consumption FROM yearmonth WHERE CustomerID = 5 AND Date = '201304'), 0)         ELSE 'Data unavailable for Customer 7 in April 2013'     END AS ConsumptionDifference;	debit_card_specializing
SELECT      0 -      (SELECT COUNT(*) FROM customers WHERE Segment = 'SME' AND Currency = 'EUR') AS AmountOfMoreSMEs;	debit_card_specializing
SELECT c.CustomerID, y.Consumption AS MaxConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'LAM' AND c.Currency = 'EUR' AND y.Date = '201310' ORDER BY y.Consumption DESC LIMIT 1;	debit_card_specializing
SELECT c.CustomerID, SUM(y.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'SME' GROUP BY c.CustomerID ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT SUM(Consumption) AS TotalConsumption FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE customers.Segment = 'LAM' AND yearmonth.Date = '201305';	debit_card_specializing
SELECT      (CAST(COUNT(DISTINCT y.CustomerID) AS FLOAT) /      (SELECT COUNT(DISTINCT CustomerID) FROM customers WHERE Segment = 'LAM')) * 100 AS Percentage FROM      yearmonth y JOIN      customers c ON y.CustomerID = c.CustomerID WHERE      c.Segment = 'LAM' AND y.Consumption > 46.73;	debit_card_specializing
SELECT Country, COUNT(*) AS TotalValueForMoneyStations FROM gasstations WHERE Segment = 'Value for money' GROUP BY Country ORDER BY TotalValueForMoneyStations DESC;	debit_card_specializing
SELECT      (CAST(SUM(CASE WHEN Currency = 'EUR' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(*)) * 100 AS Percentage_KAM_Customers_EUR FROM customers WHERE Segment = 'LAM';	debit_card_specializing
SELECT      (CAST(COUNT(*) AS FLOAT) / (SELECT COUNT(*) FROM yearmonth WHERE Date = '201202') * 100) AS Percentage FROM      yearmonth WHERE      Date = '201202' AND Consumption > 528.3;	debit_card_specializing
SELECT      (CAST(SUM(CASE WHEN Segment = 'Premium' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(*)) * 100 AS PremiumPercentage FROM gasstations WHERE Country = 'CZE';	debit_card_specializing
SELECT CustomerID  FROM yearmonth  WHERE Date = '201309'  ORDER BY Consumption DESC  LIMIT 1;	debit_card_specializing
SELECT c.Segment, SUM(y.Consumption) AS TotalConsumption FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE y.Date = '201309' GROUP BY c.Segment ORDER BY TotalConsumption ASC LIMIT 1;	debit_card_specializing
SELECT y.CustomerID, y.Consumption  FROM yearmonth y  JOIN customers c ON y.CustomerID = c.CustomerID  WHERE c.Segment = 'SME' AND y.Date = '201206'  ORDER BY y.Consumption ASC  LIMIT 1;	debit_card_specializing
SELECT MAX(Consumption) AS HighestMonthlyConsumption FROM yearmonth WHERE SUBSTR(Date, 1, 4) = '2012';	debit_card_specializing
SELECT MAX(MonthlyConsumption) AS BiggestMonthlyConsumption  FROM (     SELECT CustomerID, SUM(Consumption)/12 AS MonthlyConsumption      FROM yearmonth      WHERE CustomerID IN (         SELECT CustomerID          FROM customers          WHERE Currency = 'EUR'     )      GROUP BY CustomerID );	debit_card_specializing
SELECT DISTINCT p.Description  FROM transactions_1k t  JOIN customers c ON t.CustomerID = c.CustomerID  JOIN products p ON t.ProductID = p.ProductID  WHERE SUBSTR(t.Date, 1, 6) = '201309';	debit_card_specializing
SELECT DISTINCT g.Country FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID JOIN yearmonth ym ON t.CustomerID = ym.CustomerID WHERE ym.Date = '201306';	debit_card_specializing
SELECT DISTINCT g.ChainID FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR';	debit_card_specializing
SELECT DISTINCT p.Description FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID JOIN products p ON t.ProductID = p.ProductID WHERE c.Currency = 'EUR';	debit_card_specializing
SELECT AVG(TotalPrice) AS AverageTotalPrice  FROM (SELECT Price * Amount AS TotalPrice        FROM transactions_1k        WHERE Date LIKE '2012-01%') AS subquery;	debit_card_specializing
SELECT COUNT(DISTINCT y.CustomerID) AS CustomerCount FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Currency = 'EUR' AND y.Consumption > 1000;	debit_card_specializing
SELECT DISTINCT p.Description FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID JOIN products p ON t.ProductID = p.ProductID WHERE g.Country = 'CZE';	debit_card_specializing
SELECT DISTINCT Time FROM transactions_1k WHERE GasStationID IN (SELECT GasStationID FROM gasstations WHERE ChainID = 13);	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE' AND t.Price > 1000;	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE' AND t.Date > '2012-01-01';	debit_card_specializing
SELECT AVG(t.Price * t.Amount) AS AverageTotalPrice FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE';	debit_card_specializing
SELECT AVG(TotalPrice) AS AverageTotalPrice FROM (     SELECT c.CustomerID, SUM(t.Price) AS TotalPrice     FROM customers c     JOIN transactions_1k t ON c.CustomerID = t.CustomerID     WHERE c.Currency = 'EUR'     GROUP BY c.CustomerID ) subquery;	debit_card_specializing
SELECT t.CustomerID, SUM(t.Price * t.Amount) AS TotalPaid FROM transactions_1k t WHERE t.Date = '2012-08-25' GROUP BY t.CustomerID ORDER BY TotalPaid DESC LIMIT 1;	debit_card_specializing
SELECT g.Country  FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.Date = '2012-08-25' ORDER BY t.Time ASC LIMIT 1;	debit_card_specializing
SELECT c.Currency FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE t.Date = '2012-08-24' AND t.Time = '16:25:00';	debit_card_specializing
SELECT Segment FROM customers WHERE CustomerID = (     SELECT CustomerID     FROM transactions_1k     WHERE Date = '2012-08-23' AND Time = '21:20:00' );	debit_card_specializing
SELECT COUNT(*) AS TransactionCount FROM transactions_1k t WHERE t.Date = '2012-08-26'    AND t.Time < '13:00:00';	debit_card_specializing
SELECT Segment  FROM customers  WHERE CustomerID = (SELECT MIN(CustomerID) FROM customers);	debit_card_specializing
SELECT G.Country  FROM transactions_1k T1 JOIN gasstations G ON T1.GasStationID = G.GasStationID WHERE T1.Date = '2012-08-24' AND T1.Time = '12:42:00';	debit_card_specializing
SELECT ProductID  FROM transactions_1k  WHERE Date = '2012-08-23' AND Time = '21:20:00';	debit_card_specializing
SELECT y.Date, y.Consumption AS Expenses FROM yearmonth y JOIN transactions_1k t ON y.CustomerID = t.CustomerID WHERE t.Date = '2012-08-24' AND t.Price = 124.05 AND y.Date = '201201';	debit_card_specializing
SELECT COUNT(*) AS TransactionCount FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.Date = '2012-08-26'    AND t.Time BETWEEN '08:00:00' AND '09:00:00'    AND g.Country = 'CZE';	debit_card_specializing
SELECT c.Currency  FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE y.Date = '201306' AND y.Consumption = 214582.17;	debit_card_specializing
SELECT g.Country FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.CardID = 667467;	debit_card_specializing
SELECT c.Currency AS Nationality FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE t.Date = '2012-08-24' AND t.Amount = 548.4;	debit_card_specializing
SELECT      CASE          WHEN (SELECT COUNT(*) FROM customers WHERE Currency = 'EUR') = 0 THEN 0         ELSE (CAST(COUNT(DISTINCT t.CustomerID) AS FLOAT) /          (SELECT COUNT(*) FROM customers WHERE Currency = 'EUR')) * 100      END AS Percentage FROM      transactions_1k t JOIN      customers c ON t.CustomerID = c.CustomerID WHERE      c.Currency = 'EUR' AND t.Date = '2012-08-25';	debit_card_specializing
SELECT      ((SUM(CASE WHEN SUBSTR(Date, 1, 4) = '2012' THEN Consumption ELSE 0 END)      - SUM(CASE WHEN SUBSTR(Date, 1, 4) = '2013' THEN Consumption ELSE 0 END))      / SUM(CASE WHEN SUBSTR(Date, 1, 4) = '2012' THEN Consumption ELSE 0 END)) AS ConsumptionDecreaseRate FROM yearmonth WHERE CustomerID = (     SELECT CustomerID      FROM transactions_1k      WHERE Date = '2012-08-25' AND Price = 634.8      LIMIT 1 );	debit_card_specializing
SELECT GasStationID, SUM(Amount * Price) AS TotalRevenue FROM transactions_1k WHERE Amount IS NOT NULL AND Price IS NOT NULL GROUP BY GasStationID ORDER BY TotalRevenue DESC LIMIT 1;	debit_card_specializing
SELECT      (CAST(SUM(CASE WHEN Segment = 'Premium' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(*)) * 100 AS Premium_Percentage FROM gasstations WHERE Country = 'CZE';	debit_card_specializing
SELECT      SUM(t.Price * t.Amount) AS TotalSpent FROM      transactions_1k t WHERE      t.CustomerID IN (SELECT CustomerID FROM customers);  SELECT      SUM(t.Price * t.Amount) AS TotalSpentJanuary2012 FROM      transactions_1k t WHERE      t.CustomerID IN (SELECT CustomerID FROM customers) AND t.Date = '201201';	debit_card_specializing
SELECT p.Description, SUM(t.Amount) AS TotalAmount FROM transactions_1k t JOIN products p ON t.ProductID = p.ProductID GROUP BY p.Description ORDER BY TotalAmount DESC LIMIT 5;	debit_card_specializing
SELECT      y.CustomerID,      c.Currency,      (SUM(t.Price) / SUM(t.Amount)) AS AveragePricePerItem FROM      yearmonth y JOIN      customers c ON y.CustomerID = c.CustomerID JOIN      transactions_1k t ON y.CustomerID = t.CustomerID WHERE      y.CustomerID = (         SELECT              CustomerID          FROM              yearmonth          GROUP BY              CustomerID          ORDER BY              SUM(Consumption) DESC          LIMIT 1     ) GROUP BY      y.CustomerID, c.Currency;	debit_card_specializing
SELECT g.Country FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.ProductID = 2 ORDER BY t.Price DESC LIMIT 1;	debit_card_specializing
SELECT y.Consumption FROM yearmonth y WHERE y.CustomerID IN (     SELECT t.CustomerID     FROM transactions_1k t     WHERE t.ProductID = 5       AND (t.Price / t.Amount) > 29.00 ) AND y.Date = '201208';	debit_card_specializing
