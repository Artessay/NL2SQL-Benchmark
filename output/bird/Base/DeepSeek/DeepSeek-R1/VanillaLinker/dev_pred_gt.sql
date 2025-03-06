SELECT MAX("Free Meal Count (K-12)" / "Enrollment (K-12)") FROM frpm WHERE "County Name" = 'Alameda';	california_schools
SELECT `School Name`, (`Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)`) AS eligible_rate  FROM frpm  WHERE `School Type` = 'Continuation'  ORDER BY eligible_rate ASC  LIMIT 3;	california_schools
SELECT DISTINCT schools.Zip  FROM frpm  JOIN schools ON frpm.CDSCode = schools.CDSCode  WHERE frpm.`Charter School (Y/N)` = 1  AND frpm.`County Name` = 'Fresno'  AND frpm.`District Name` = 'Fresno County Office of Education';	california_schools
SELECT schools.MailStreet  FROM frpm  JOIN schools ON frpm.CDSCode = schools.CDSCode  WHERE frpm.`FRPM Count (K-12)` = (SELECT MAX(`FRPM Count (K-12)`) FROM frpm);	california_schools
SELECT schools.Phone  FROM frpm  JOIN schools ON frpm.CDSCode = schools.CDSCode  WHERE frpm.`Charter School (Y/N)` = 1    AND frpm.`Charter Funding Type` = 'Direct'    AND schools.OpenDate > '2000-01-01';	california_schools
SELECT COUNT(*) FROM schools JOIN satscores ON schools.CDSCode = satscores.cds WHERE schools.Virtual = 'F' AND satscores.AvgScrMath > 400 AND satscores.rtype = 'S';	california_schools
SELECT satscores.sname  FROM satscores  JOIN schools ON satscores.cds = schools.CDSCode  WHERE satscores.NumTstTakr > 500  AND schools.Magnet = 1;	california_schools
SELECT schools.Phone  FROM schools  JOIN satscores ON schools.CDSCode = satscores.cds  WHERE satscores.NumGE1500 IS NOT NULL  ORDER BY satscores.NumGE1500 DESC  LIMIT 1;	california_schools
SELECT satscores.NumTstTakr  FROM satscores  JOIN frpm ON satscores.cds = frpm.CDSCode  WHERE frpm.`FRPM Count (K-12)` = (SELECT MAX(`FRPM Count (K-12)`) FROM frpm);	california_schools
SELECT COUNT(*)  FROM satscores  JOIN frpm ON satscores.cds = frpm.CDSCode  WHERE satscores.AvgScrMath > 560  AND frpm.`Charter Funding Type` = 'Direct';	california_schools
SELECT f.`FRPM Count (Ages 5-17)` FROM frpm f JOIN satscores s ON f.CDSCode = s.cds ORDER BY s.`AvgScrRead` DESC LIMIT 1;	california_schools
SELECT `CDSCode` FROM frpm WHERE (COALESCE(`Enrollment (K-12)`, 0) + COALESCE(`Enrollment (Ages 5-17)`, 0)) > 500;	california_schools
SELECT MAX(f.`Free Meal Count (Ages 5-17)` / f.`Enrollment (Ages 5-17)`) AS HighestEligibleFreeRate FROM frpm f JOIN satscores s ON f.CDSCode = s.cds WHERE 1.0 * s.NumGE1500 / s.NumTstTakr > 0.3;	california_schools
SELECT schools.Phone  FROM schools  JOIN satscores ON schools.CDSCode = satscores.cds  WHERE satscores.rtype = 'S'  ORDER BY (1.0 * satscores.NumGE1500 / satscores.NumTstTakr) DESC  LIMIT 3;	california_schools
SELECT schools.`NCESSchool`  FROM frpm  JOIN schools ON frpm.`CDSCode` = schools.`CDSCode`  ORDER BY frpm.`Enrollment (Ages 5-17)` DESC  LIMIT 5;	california_schools
SELECT schools.District, AVG(satscores.AvgScrRead) AS avg_read FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.StatusType = 'Active' GROUP BY schools.District ORDER BY avg_read DESC LIMIT 1;	california_schools
SELECT COUNT(*)  FROM frpm  JOIN satscores ON frpm.CDSCode = satscores.cds  WHERE frpm.`County Name` = 'Alameda'    AND frpm.`District Type` = 'Merged'    AND satscores.NumTstTakr < 100;	california_schools
SELECT      s.sname AS SchoolName,     s.AvgScrWrite,     sc.CharterNum,     RANK() OVER (ORDER BY s.AvgScrWrite DESC) AS Ranking FROM      satscores s JOIN      schools sc ON s.cds = sc.CDSCode WHERE      s.AvgScrWrite > 499     AND sc.CharterNum IS NOT NULL ORDER BY      Ranking;	california_schools
SELECT COUNT(*)  FROM schools  JOIN satscores ON schools.CDSCode = satscores.cds  WHERE schools.County = 'Fresno'  AND schools.FundingType = 'Directly Funded'  AND satscores.NumTstTakr <= 250  AND satscores.rtype = 'S';	california_schools
SELECT schools.Phone  FROM satscores  JOIN schools ON satscores.cds = schools.CDSCode  ORDER BY satscores.AvgScrMath DESC  LIMIT 1;	california_schools
SELECT COUNT(*) FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode WHERE schools.County = 'Amador' AND frpm.`Low Grade` = '9' AND frpm.`High Grade` = '12';	california_schools
SELECT COUNT(*)  FROM frpm  WHERE `County Name` = 'Los Angeles'    AND `Free Meal Count (K-12)` > 500    AND `FRPM Count (K-12)` < 700;	california_schools
SELECT satscores.sname FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.County = 'Contra Costa' ORDER BY satscores.NumTstTakr DESC LIMIT 1;	california_schools
SELECT s.`School`, s.`Street`, s.`City`, s.`State`, s.`Zip` FROM frpm f JOIN schools s ON f.`CDSCode` = s.`CDSCode` WHERE ABS(f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`) > 30;	california_schools
SELECT s.`School`  FROM schools s  JOIN frpm f ON s.`CDSCode` = f.`CDSCode`  JOIN satscores sc ON s.`CDSCode` = sc.`cds`  WHERE f.`Percent (%) Eligible Free (K-12)` > 0.1  AND sc.`NumGE1500` > 0;	california_schools
SELECT schools.School, schools.FundingType  FROM schools  JOIN satscores ON schools.CDSCode = satscores.cds  WHERE schools.County = 'Riverside'  AND satscores.AvgScrMath > 400;	california_schools
SELECT schools.School, schools.Street, schools.City, schools.State, schools.Zip  FROM frpm  JOIN schools ON frpm.CDSCode = schools.CDSCode  WHERE frpm.`FRPM Count (Ages 5-17` > 800  AND schools.City = 'Monterey'  AND frpm.`School Type` = 'High School';	california_schools
SELECT satscores.sname, satscores.AvgScrWrite, schools.Phone FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.OpenDate > '1991-12-31' OR schools.ClosedDate < '2000-01-01';	california_schools
SELECT s.School, s.DOCType  FROM frpm f  JOIN schools s ON f.CDSCode = s.CDSCode  WHERE s.FundingType = 'Local'  AND (f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`) > (     SELECT AVG(f2.`Enrollment (K-12)` - f2.`Enrollment (Ages 5-17)`)      FROM frpm f2      JOIN schools s2 ON f2.CDSCode = s2.CDSCode      WHERE s2.FundingType = 'Local' );	california_schools
SELECT s.OpenDate  FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode  WHERE f."Low Grade" = '1' AND f."High Grade" = '12'  ORDER BY f."Enrollment (K-12)" DESC  LIMIT 1;	california_schools
SELECT s.`City`  FROM schools s  JOIN frpm f ON s.`CDSCode` = f.`CDSCode`  WHERE f.`Enrollment (K-12)` IS NOT NULL  GROUP BY s.`City`  ORDER BY SUM(f.`Enrollment (K-12)`) ASC  LIMIT 5;	california_schools
SELECT `School Name`, (`Free Meal Count (K-12)` / `Enrollment (K-12)`) AS `Eligible Free Rate` FROM frpm WHERE `Enrollment (K-12)` > 0 ORDER BY `Enrollment (K-12)` DESC LIMIT 2 OFFSET 9;	california_schools
SELECT f.`School Name`, (f.`FRPM Count (K-12)` / f.`Enrollment (K-12)`) AS `Eligible Rate`  FROM frpm f  JOIN schools s ON f.CDSCode = s.CDSCode  WHERE s.SOC = '66'  ORDER BY f.`FRPM Count (K-12)` DESC  LIMIT 5;	california_schools
SELECT schools.School, schools.Website  FROM schools  JOIN frpm ON schools.CDSCode = frpm.CDSCode  WHERE frpm.`Free Meal Count (Ages 5-17)` BETWEEN 1900 AND 2000;	california_schools
SELECT (f.`Free Meal Count (Ages 5-17)` / f.`Enrollment (Ages 5-17)`) * 100 AS FreeRate  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE (s.AdmFName1 = 'Kacey' AND s.AdmLName1 = 'Gibson')     OR (s.AdmFName2 = 'Kacey' AND s.AdmLName2 = 'Gibson')     OR (s.AdmFName3 = 'Kacey' AND s.AdmLName3 = 'Gibson');	california_schools
SELECT schools.AdmEmail1, schools.AdmEmail2, schools.AdmEmail3 FROM frpm INNER JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE frpm.`Charter School (Y/N)` = 1 AND frpm.`Enrollment (K-12)` IS NOT NULL ORDER BY frpm.`Enrollment (K-12)` ASC LIMIT 1;	california_schools
SELECT TRIM(s.AdmFName1 || ' ' || s.AdmLName1) AS Administrator FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds WHERE sat.NumGE1500 = (SELECT MAX(NumGE1500) FROM satscores) AND s.AdmFName1 IS NOT NULL AND s.AdmLName1 IS NOT NULL UNION ALL SELECT TRIM(s.AdmFName2 || ' ' || s.AdmLName2) FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds WHERE sat.NumGE1500 = (SELECT MAX(NumGE1500) FROM satscores) AND s.AdmFName2 IS NOT NULL AND s.AdmLName2 IS NOT NULL UNION ALL SELECT TRIM(s.AdmFName3 || ' ' || s.AdmLName3) FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds WHERE sat.NumGE1500 = (SELECT MAX(NumGE1500) FROM satscores) AND s.AdmFName3 IS NOT NULL AND s.AdmLName3 IS NOT NULL;	california_schools
SELECT s.Street, s.City, s.Zip, s.State  FROM schools s  JOIN satscores sat ON s.CDSCode = sat.cds  WHERE sat.NumTstTakr > 0  ORDER BY (1.0 * sat.NumGE1500 / sat.NumTstTakr) ASC  LIMIT 1;	california_schools
SELECT s.Website  FROM schools s  JOIN satscores sc ON s.CDSCode = sc.cds  WHERE s.County = 'Los Angeles'  AND sc.NumTstTakr BETWEEN 2000 AND 3000;	california_schools
SELECT AVG(s.NumTstTakr)  FROM satscores s  JOIN schools sc ON s.cds = sc.CDSCode  WHERE sc.County = 'Fresno'  AND strftime('%Y', sc.OpenDate) = '1980';	california_schools
SELECT schools.Phone  FROM schools  JOIN satscores ON schools.CDSCode = satscores.cds  WHERE schools.District = 'Fresno Unified'  ORDER BY satscores.AvgScrRead ASC  LIMIT 1;	california_schools
WITH ranked_schools AS (     SELECT          s.School,         s.County,         sc.AvgScrRead,         ROW_NUMBER() OVER (PARTITION BY s.County ORDER BY sc.AvgScrRead DESC) AS rank     FROM schools s     INNER JOIN satscores sc ON s.CDSCode = sc.cds     WHERE s.Virtual = 'F' ) SELECT School FROM ranked_schools WHERE rank <= 5;	california_schools
SELECT frpm.`Educational Option Type`  FROM frpm  JOIN satscores ON frpm.CDSCode = satscores.cds  WHERE satscores.`AvgScrMath` = (SELECT MAX(`AvgScrMath`) FROM satscores);	california_schools
SELECT satscores.AvgScrMath, schools.County FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE satscores.AvgScrMath IS NOT NULL AND satscores.AvgScrRead IS NOT NULL AND satscores.AvgScrWrite IS NOT NULL AND (satscores.AvgScrMath + satscores.AvgScrRead + satscores.AvgScrWrite) = (SELECT MIN(AvgScrMath + AvgScrRead + AvgScrWrite) FROM satscores WHERE AvgScrMath IS NOT NULL AND AvgScrRead IS NOT NULL AND AvgScrWrite IS NOT NULL);	california_schools
SELECT s.`AvgScrWrite`, sc.`City`  FROM `satscores` s  JOIN `schools` sc ON s.`cds` = sc.`CDSCode`  WHERE s.`NumGE1500` = (SELECT MAX(`NumGE1500`) FROM `satscores`)  LIMIT 1;	california_schools
SELECT schools.School, satscores.AvgScrWrite  FROM schools  JOIN satscores ON schools.CDSCode = satscores.cds  WHERE (AdmFName1 = 'Ricci' AND AdmLName1 = 'Ulrich')     OR (AdmFName2 = 'Ricci' AND AdmLName2 = 'Ulrich')     OR (AdmFName3 = 'Ricci' AND AdmLName3 = 'Ulrich');	california_schools
SELECT schools.School, frpm.`Enrollment (K-12)`  FROM schools  JOIN frpm ON schools.CDSCode = frpm.CDSCode  WHERE schools.DOC = '31'  ORDER BY frpm.`Enrollment (K-12)` DESC  LIMIT 1;	california_schools
SELECT COUNT(CDSCode)/12.0 AS MonthlyAverage FROM schools WHERE County = 'Alameda'    AND DOC = '52'    AND strftime('%Y', OpenDate) = '1980';	california_schools
SELECT      (SELECT COUNT(*) FROM schools WHERE DOC = '54' AND County = 'Orange County' AND StatusType = 'Merged') * 1.0 /     (SELECT COUNT(*) FROM schools WHERE DOC = '52' AND County = 'Orange County' AND StatusType = 'Merged')  AS ratio;	california_schools
SELECT s.County, s.School, s.ClosedDate  FROM schools s  INNER JOIN (     SELECT County, COUNT(*) AS cnt      FROM schools      WHERE StatusType = 'Closed'      GROUP BY County      HAVING cnt = (         SELECT MAX(cnt)          FROM (             SELECT COUNT(*) AS cnt              FROM schools              WHERE StatusType = 'Closed'              GROUP BY County         )     ) ) AS top_counties ON s.County = top_counties.County  WHERE s.StatusType = 'Closed'  ORDER BY s.County, s.School;	california_schools
SELECT s.School, s.Street FROM satscores sat JOIN schools s ON sat.cds = s.CDSCode WHERE sat.AvgScrMath IS NOT NULL ORDER BY sat.AvgScrMath DESC LIMIT 1 OFFSET 6;	california_schools
SELECT s.`MailStreet`, s.`School` FROM schools s JOIN satscores sc ON s.`CDSCode` = sc.`cds` WHERE sc.`AvgScrRead` = (SELECT MIN(`AvgScrRead`) FROM satscores WHERE `rtype` = 'S') AND sc.`rtype` = 'S';	california_schools
SELECT COUNT(*)  FROM schools  JOIN satscores ON schools.CDSCode = satscores.cds  WHERE schools.MailCity = 'Lakeport'  AND (satscores.AvgScrRead + satscores.AvgScrMath + satscores.AvgScrWrite) >= 1500;	california_schools
SELECT SUM(satscores.NumTstTakr)  FROM schools  JOIN satscores ON schools.CDSCode = satscores.cds  WHERE schools.MailCity = 'Fresno';	california_schools
SELECT School, MailZip FROM schools  WHERE  (AdmFName1 = 'Avetik' AND AdmLName1 = 'Atoian') OR  (AdmFName2 = 'Avetik' AND AdmLName2 = 'Atoian') OR  (AdmFName3 = 'Avetik' AND AdmLName3 = 'Atoian');	california_schools
SELECT      (1.0 * SUM(CASE WHEN County = 'Colusa' THEN 1 ELSE 0 END)) / NULLIF(SUM(CASE WHEN County = 'Humboldt' THEN 1 ELSE 0 END), 0) AS ratio  FROM schools  WHERE MailState = 'CA';	california_schools
SELECT COUNT(*) FROM schools WHERE MailState = 'CA' AND City = 'San Joaquin' AND StatusType = 'Active';	california_schools
SELECT schools.Phone, schools.Ext FROM schools JOIN satscores ON schools.CDSCode = satscores.cds ORDER BY satscores.AvgScrWrite DESC LIMIT 1 OFFSET 332;	california_schools
SELECT `School`, `Phone`, `Ext` FROM `schools` WHERE `Zip` = '95203-3704';	california_schools
SELECT DISTINCT s.Website  FROM schools s  WHERE ((s.AdmFName1 || ' ' || s.AdmLName1 IN ('Mike Larson', 'Dante Alvarez'))      OR (s.AdmFName2 || ' ' || s.AdmLName2 IN ('Mike Larson', 'Dante Alvarez'))      OR (s.AdmFName3 || ' ' || s.AdmLName3 IN ('Mike Larson', 'Dante Alvarez')));	california_schools
SELECT Website FROM schools WHERE Charter = 1 AND Virtual = 'P' AND County = 'San Joaquin';	california_schools
SELECT COUNT(*)  FROM schools  WHERE Charter = 1    AND DOC = '52'    AND City = 'Hickman';	california_schools
SELECT COUNT(*) FROM frpm WHERE `County Name` = 'Los Angeles' AND `Charter School (Y/N)` = 0 AND (`Free Meal Count (K-12)` * 100.0 / `Enrollment (K-12)`) < 0.18;	california_schools
SELECT s.School, s.City,         CASE n.n            WHEN 1 THEN AdmFName1 || ' ' || AdmLName1            WHEN 2 THEN AdmFName2 || ' ' || AdmLName2            WHEN 3 THEN AdmFName3 || ' ' || AdmLName3        END AS AdministratorName FROM schools s CROSS JOIN (SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3) n WHERE s.Charter = 1 AND s.CharterNum = '00D2'   AND ((n.n = 1 AND AdmFName1 IS NOT NULL AND AdmLName1 IS NOT NULL)     OR (n.n = 2 AND AdmFName2 IS NOT NULL AND AdmLName2 IS NOT NULL)     OR (n.n = 3 AND AdmFName3 IS NOT NULL AND AdmLName3 IS NOT NULL));	california_schools
SELECT COUNT(*) FROM schools WHERE MailCity = 'Hickman' AND CharterNum = '00D4';	california_schools
SELECT      (COUNT(CASE WHEN s.FundingType = 'locally funded' THEN 1 END) * 100.0) / COUNT(*) AS ratio_percentage  FROM schools s  WHERE s.County = 'Santa Clara' AND s.Charter = 1;	california_schools
SELECT COUNT(*) FROM schools WHERE County = 'Stanislaus' AND FundingType = 'Directly Funded' AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31';	california_schools
SELECT COUNT(*)  FROM schools  WHERE City = 'San Francisco'    AND District LIKE '%Community College District%'    AND ClosedDate IS NOT NULL    AND strftime('%Y', ClosedDate) = '1989';	california_schools
SELECT schools.County, COUNT(*) AS ClosureCount FROM schools WHERE schools.SOC = '11' AND schools.ClosedDate IS NOT NULL AND YEAR(schools.ClosedDate) BETWEEN 1980 AND 1989 GROUP BY schools.County ORDER BY ClosureCount DESC LIMIT 1;	california_schools
SELECT `NCESDist` FROM `schools` WHERE `SOC` = '31';	california_schools
SELECT `StatusType`, COUNT(*) AS `Count` FROM schools WHERE `County` = 'Alpine' AND `DOCType` = 'District Community Day' GROUP BY `StatusType`;	california_schools
SELECT frpm.`District Code` FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode WHERE schools.City = 'Fresno' AND schools.Magnet = 0;	california_schools
SELECT `frpm`.`Enrollment (Ages 5-17)`  FROM `frpm`  JOIN `schools` ON `frpm`.`CDSCode` = `schools`.`CDSCode`  WHERE `schools`.`EdOpsCode` = 'SSS'  AND `frpm`.`Academic Year` = '2014-2015'  AND `schools`.`City` = 'Fremont';	california_schools
SELECT frpm.`Free Meal Count (Ages 5-17)`  FROM frpm  JOIN schools ON frpm.CDSCode = schools.CDSCode  WHERE schools.School = 'Youth Authority School'    AND schools.MailStreet = 'PO Box 1040';	california_schools
SELECT frpm.`Low Grade`  FROM schools  JOIN frpm ON schools.CDSCode = frpm.CDSCode  WHERE schools.NCESDist = '0613360'    AND schools.EdOpsCode = 'SPECON'  LIMIT 1;	california_schools
SELECT frpm.`School Name`, schools.EdOpsName  FROM frpm  JOIN schools ON frpm.CDSCode = schools.CDSCode  WHERE frpm.`County Code` = '37' AND frpm.`NSLP Provision Status` = '2';	california_schools
SELECT schools.City FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode WHERE schools.EILCode = 'HS' AND frpm."NSLP Provision Status" = '2' AND frpm."Low Grade" = '9' AND frpm."High Grade" = '12' AND schools.County = 'Merced';	california_schools
SELECT `School Name`, (`FRPM Count (Ages 5-17)` / `Enrollment (Ages 5-17)` * 100) AS `Percent Eligible FRPM (Ages 5-17)` FROM frpm WHERE `County Name` = 'Los Angeles' AND `Low Grade` = 'Kindergarten' AND `High Grade` = '9th Grade';	california_schools
SELECT `GSserved` FROM schools WHERE City = 'Adelanto' GROUP BY `GSserved` ORDER BY COUNT(*) DESC LIMIT 1;	california_schools
SELECT `County`, COUNT(*) AS `NumberOfSchools`  FROM `schools`  WHERE `County` IN ('San Diego', 'Santa Barbara')    AND `Virtual` = 'F'  GROUP BY `County`  ORDER BY `NumberOfSchools` DESC  LIMIT 1;	california_schools
SELECT s.`School`, s.`Latitude`, f.`School Type`  FROM schools s  JOIN frpm f ON s.`CDSCode` = f.`CDSCode`  ORDER BY s.`Latitude` DESC  LIMIT 1;	california_schools
SELECT s.`School`, s.`City`, f.`Low Grade`  FROM schools s  JOIN frpm f ON s.`CDSCode` = f.`CDSCode`  WHERE s.`State` = 'CA'  ORDER BY s.`Latitude` ASC  LIMIT 1;	california_schools
SELECT frpm.`Low Grade`, frpm.`High Grade` FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode ORDER BY ABS(schools.Longitude) DESC LIMIT 1;	california_schools
SELECT COUNT(*) FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.Magnet = 1 AND frpm.`Low Grade` = 'K' AND frpm.`High Grade` = '8th' AND frpm.`NSLP Provision Status` = 'Multiple Provision Types'; SELECT City, COUNT(*) FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE frpm.`Low Grade` = 'K' AND frpm.`High Grade` = '8th' GROUP BY City;	california_schools
WITH AllAdmins AS (     SELECT AdmFName1 AS FirstName, District FROM schools WHERE AdmFName1 IS NOT NULL     UNION ALL     SELECT AdmFName2, District FROM schools WHERE AdmFName2 IS NOT NULL     UNION ALL     SELECT AdmFName3, District FROM schools WHERE AdmFName3 IS NOT NULL ), NameCounts AS (     SELECT FirstName, COUNT(*) AS cnt     FROM AllAdmins     GROUP BY FirstName     ORDER BY cnt DESC     LIMIT 2 ) SELECT      nc.FirstName,     GROUP_CONCAT(DISTINCT a.District) AS Districts FROM NameCounts nc JOIN AllAdmins a ON nc.FirstName = a.FirstName GROUP BY nc.FirstName ORDER BY nc.cnt DESC;	california_schools
SELECT frpm.`Percent (%) Eligible Free (K-12)`, frpm.`District Code` FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.AdmFName1 = 'Alusine' OR schools.AdmFName2 = 'Alusine' OR schools.AdmFName3 = 'Alusine';	california_schools
SELECT s.`District`, s.`County`, s.`School`, s.`AdmLName1` FROM `schools` s WHERE s.`CharterNum` = '40';	california_schools
SELECT DISTINCT Email FROM (     SELECT AdmEmail1 AS Email FROM schools     WHERE County = 'San Bernardino' AND District = 'San Bernardino City Unified'      AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND StatusType = 'Public'      AND SOC = '62' AND DOC = '54' AND AdmEmail1 IS NOT NULL AND AdmEmail1 != ''     UNION     SELECT AdmEmail2 FROM schools     WHERE County = 'San Bernardino' AND District = 'San Bernardino City Unified'      AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND StatusType = 'Public'      AND SOC = '62' AND DOC = '54' AND AdmEmail2 IS NOT NULL AND AdmEmail2 != ''     UNION     SELECT AdmEmail3 FROM schools     WHERE County = 'San Bernardino' AND District = 'San Bernardino City Unified'      AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND StatusType = 'Public'      AND SOC = '62' AND DOC = '54' AND AdmEmail3 IS NOT NULL AND AdmEmail3 != '' ) WHERE Email IS NOT NULL;	california_schools
SELECT schools.School, schools.AdmEmail1 FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE satscores.NumGE1500 IS NOT NULL ORDER BY satscores.NumGE1500 DESC LIMIT 1;	california_schools
SELECT COUNT(DISTINCT a.account_id)  FROM account a  JOIN district d ON a.district_id = d.district_id  WHERE a.frequency = 'POPLATEK PO OBRATU'  AND d.A3 = 'East Bohemia';	financial
SELECT COUNT(DISTINCT a.account_id)  FROM account a  JOIN district d ON a.district_id = d.district_id  JOIN loan l ON a.account_id = l.account_id  WHERE d.A3 = 'Prague';	financial
SELECT      AVG(A12) AS avg_1995,     AVG(A13) AS avg_1996,     CASE          WHEN AVG(A12) > AVG(A13) THEN '1995'          ELSE '1996'      END AS higher_year  FROM district;	financial
SELECT COUNT(*)  FROM district  WHERE A11 > 6000 AND A11 < 10000;	financial
SELECT COUNT(*)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE client.gender = 'M'  AND district.A3 = 'North Bohemia'  AND district.A11 > 8000;	financial
SELECT a.account_id, (SELECT MAX(A11) FROM district) - (SELECT MIN(d_inner.A11) FROM client c_inner JOIN disp dp_inner ON c_inner.client_id = dp_inner.client_id JOIN district d_inner ON c_inner.district_id = d_inner.district_id WHERE c_inner.gender = 'F' AND dp_inner.type = 'OWNER' AND c_inner.birth_date = (SELECT MIN(birth_date) FROM client WHERE gender = 'F')) AS gap FROM account a JOIN disp dp ON a.account_id = dp.account_id JOIN client c ON dp.client_id = c.client_id JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F' AND dp.type = 'OWNER' AND c.birth_date = (SELECT MIN(birth_date) FROM client WHERE gender = 'F') AND d.A11 = (SELECT MIN(d_inner2.A11) FROM client c_inner2 JOIN disp dp_inner2 ON c_inner2.client_id = dp_inner2.client_id JOIN district d_inner2 ON c_inner2.district_id = d_inner2.district_id WHERE c_inner2.gender = 'F' AND dp_inner2.type = 'OWNER' AND c_inner2.birth_date = (SELECT MIN(birth_date) FROM client WHERE gender = 'F'));	financial
SELECT a.account_id  FROM account a  JOIN disp dp ON a.account_id = dp.account_id  JOIN client c ON dp.client_id = c.client_id  JOIN district d ON c.district_id = d.district_id  WHERE c.birth_date = (SELECT MAX(birth_date) FROM client)  AND d.A11 = (SELECT MAX(d2.A11)               FROM client c2               JOIN district d2 ON c2.district_id = d2.district_id               WHERE c2.birth_date = (SELECT MAX(birth_date) FROM client));	financial
SELECT COUNT(DISTINCT c.client_id)  FROM account a  JOIN disp d ON a.account_id = d.account_id  JOIN client c ON d.client_id = c.client_id  WHERE a.frequency = 'POPLATEK TYDNE' AND d.type = 'OWNER';	financial
SELECT DISTINCT c.client_id  FROM client c  JOIN disp d ON c.client_id = d.client_id  JOIN account a ON d.account_id = a.account_id  WHERE d.type = 'DISPONENT'  AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT l.account_id  FROM loan l  JOIN account a ON l.account_id = a.account_id  WHERE l.status = 'A'    AND strftime('%Y', l.date) = '1997'    AND a.frequency = 'POPLATEK TYDNE'    AND l.amount = (     SELECT MIN(amount)      FROM loan      WHERE status = 'A'        AND strftime('%Y', date) = '1997'   );	financial
SELECT l.account_id  FROM loan l  JOIN account a ON l.account_id = a.account_id  WHERE l.duration > 12  AND YEAR(a.date) = 1993  AND l.amount = (      SELECT MAX(l2.amount)      FROM loan l2      JOIN account a2 ON l2.account_id = a2.account_id      WHERE l2.duration > 12      AND YEAR(a2.date) = 1993  );	financial
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN disp d ON c.client_id = d.client_id AND d.type = 'OWNER' JOIN district di ON c.district_id = di.district_id WHERE c.gender = 'F' AND c.birth_date < '1950-01-01' AND di.A2 = 'Sokolov';	financial
SELECT DISTINCT t.account_id  FROM trans t  WHERE t.date = (     SELECT MIN(date)      FROM trans      WHERE strftime('%Y', date) = '1995' );	financial
SELECT DISTINCT a.account_id FROM account a JOIN trans t ON a.account_id = t.account_id WHERE a.date < '1997-01-01' AND t.balance > 3000 AND t.date = (     SELECT MAX(date)     FROM trans     WHERE account_id = a.account_id );	financial
SELECT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card ca ON d.disp_id = ca.disp_id WHERE ca.issued = '1994-03-03';	financial
SELECT a.date  FROM account a  JOIN trans t ON a.account_id = t.account_id  WHERE t.date = '1998-10-14' AND t.amount = 840;	financial
SELECT a.district_id  FROM account a  JOIN loan l ON a.account_id = l.account_id  WHERE l.date = '1994-08-25';	financial
SELECT MAX(t.amount) FROM trans t WHERE t.account_id IN (SELECT d.account_id FROM disp d WHERE d.client_id IN (SELECT d2.client_id FROM card c JOIN disp d2 ON c.disp_id = d2.disp_id WHERE c.issued = '1996-10-21'));	financial
SELECT c.gender  FROM client c  JOIN disp d ON c.client_id = d.client_id  JOIN account a ON d.account_id = a.account_id  JOIN (SELECT district_id FROM district WHERE A11 = (SELECT MAX(A11) FROM district)) AS high_salary  ON a.district_id = high_salary.district_id  WHERE d.type = 'OWNER'  ORDER BY c.birth_date ASC  LIMIT 1;	financial
SELECT t.amount  FROM trans t  JOIN account a ON t.account_id = a.account_id  JOIN (SELECT l.account_id FROM loan l ORDER BY l.amount DESC LIMIT 1) max_loan ON a.account_id = max_loan.account_id  WHERE t.date >= a.date  ORDER BY t.date  LIMIT 1;	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c  JOIN disp d ON c.client_id = d.client_id  JOIN account a ON d.account_id = a.account_id  JOIN district di ON a.district_id = di.district_id  WHERE di.A2 = 'Jesenik' AND c.gender = 'F' AND d.type = 'OWNER';	financial
SELECT d.disp_id  FROM trans t  JOIN account a ON t.account_id = a.account_id  JOIN disp d ON a.account_id = d.account_id  WHERE t.date = '1998-09-02' AND t.amount = 5100;	financial
SELECT COUNT(*)  FROM account  JOIN district ON account.district_id = district.district_id  WHERE district.A2 = 'Litomerice'  AND strftime('%Y', account.date) = '1996';	financial
SELECT district.A2  FROM client  JOIN disp ON client.client_id = disp.client_id  JOIN account ON disp.account_id = account.account_id  JOIN district ON account.district_id = district.district_id  WHERE client.gender = 'F'    AND client.birth_date = '1976-01-29'    AND disp.type = 'OWNER';	financial
SELECT c.birth_date  FROM client c  JOIN disp d ON c.client_id = d.client_id  JOIN loan l ON d.account_id = l.account_id  WHERE l.date = '1996-01-03' AND l.amount = 98832  AND d.type = 'OWNER';	financial
SELECT a.account_id  FROM account a  JOIN district d ON a.district_id = d.district_id  WHERE d.A3 = 'Prague'  ORDER BY a.date  LIMIT 1;	financial
SELECT      (SUM(CASE WHEN c.gender = 'M' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS male_percentage  FROM client c  WHERE c.district_id = (     SELECT d.district_id      FROM district d      WHERE d.A3 = 'south Bohemia'      ORDER BY CAST(d.A4 AS INTEGER) DESC      LIMIT 1 );	financial
WITH target_account AS (   SELECT account_id    FROM loan    WHERE date = '1993-07-05' AND status = 'A'    ORDER BY date    LIMIT 1 ),  start_balance AS (   SELECT balance    FROM trans    WHERE account_id = (SELECT account_id FROM target_account)      AND date <= '1993-03-22'    ORDER BY date DESC    LIMIT 1 ),  end_balance AS (   SELECT balance    FROM trans    WHERE account_id = (SELECT account_id FROM target_account)      AND date <= '1998-12-27'    ORDER BY date DESC    LIMIT 1 ) SELECT ((end_balance.balance - start_balance.balance) / start_balance.balance) * 100 AS increase_rate  FROM start_balance, end_balance;	financial
SELECT (SUM(CASE WHEN status = 'A' THEN amount ELSE 0 END) * 100.0 / SUM(amount)) AS percentage FROM loan;	financial
SELECT (COUNT(DISTINCT CASE WHEN status = 'C' THEN account_id END) * 100.0) / COUNT(DISTINCT account_id) AS percentage FROM loan WHERE amount < 100000;	financial
SELECT a.account_id, d.A2 AS district_name, d.A3 AS district_region FROM account a JOIN district d ON a.district_id = d.district_id WHERE YEAR(a.date) = 1993 AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT a.account_id, a.frequency  FROM account a  JOIN disp d ON a.account_id = d.account_id  JOIN client c ON d.client_id = c.client_id  JOIN district di ON c.district_id = di.district_id  WHERE d.type = 'OWNER'    AND di.A3 = 'east Bohemia'    AND a.date BETWEEN '1995-01-01' AND '2000-12-31';	financial
SELECT account.account_id, account.date FROM account JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Prachatice';	financial
SELECT d.A2 AS district, d.A3 AS region  FROM loan l  JOIN account a ON l.account_id = a.account_id  JOIN district d ON a.district_id = d.district_id  WHERE l.loan_id = 4990;	financial
SELECT a.account_id, d.A2 AS district, d.A3 AS region FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.amount > 300000;	financial
SELECT l.loan_id, d.A2 AS district, d.A11 AS average_salary  FROM loan l  JOIN account a ON l.account_id = a.account_id  JOIN district d ON a.district_id = d.district_id  WHERE l.duration = 60;	financial
SELECT      d.district_id,     ((d.A13 - d.A12) / d.A12) * 100 AS unemployment_increment_percentage FROM      loan l JOIN      account a ON l.account_id = a.account_id JOIN      disp dp ON a.account_id = dp.account_id AND dp.type = 'OWNER' JOIN      client c ON dp.client_id = c.client_id JOIN      district d ON c.district_id = d.district_id WHERE      l.status = 'D';	financial
SELECT (COUNT(CASE WHEN d.A2 = 'Decin' THEN 1 END) * 100.0) / COUNT(*) AS percentage FROM account a JOIN district d ON a.district_id = d.district_id WHERE YEAR(a.date) = 1993;	financial
SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE';	financial
SELECT d.A2 AS district_name, COUNT(*) AS female_count FROM client c JOIN disp dp ON c.client_id = dp.client_id JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F' AND dp.type = 'OWNER' GROUP BY c.district_id ORDER BY female_count DESC LIMIT 9;	financial
SELECT d.A2 AS district_name, t.amount  FROM trans t  JOIN account a ON t.account_id = a.account_id  JOIN district d ON a.district_id = d.district_id  WHERE t.type = 'VYDAJ' AND t.date LIKE '1996-01%'  ORDER BY t.amount DESC  LIMIT 10;	financial
SELECT COUNT(DISTINCT d.client_id)  FROM district di  JOIN account a ON di.district_id = a.district_id  JOIN disp d ON a.account_id = d.account_id  LEFT JOIN card c ON d.disp_id = c.disp_id  WHERE di.A3 = 'South Bohemia'  AND d.type = 'OWNER'  AND c.card_id IS NULL;	financial
SELECT d.A3 FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.status IN ('C','D') GROUP BY d.district_id ORDER BY COUNT(*) DESC LIMIT 1;	financial
SELECT AVG(l.amount) FROM loan l JOIN account a ON l.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id WHERE c.gender = 'M' AND d.type = 'OWNER';	financial
SELECT A2, A13 FROM district WHERE A13 = (SELECT MAX(A13) FROM district);	financial
SELECT COUNT(*) AS account_count FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A16 = (SELECT MAX(A16) FROM district));	financial
SELECT COUNT(DISTINCT a.account_id)  FROM account a  JOIN trans t ON a.account_id = t.account_id  WHERE a.frequency = 'POPLATEK MESICNE'  AND t.operation = 'VYBER KARTOU'  AND t.balance < 0;	financial
SELECT a.account_id, COUNT(l.loan_id) AS loan_count  FROM loan l  JOIN account a ON l.account_id = a.account_id  WHERE l.date BETWEEN '1995-01-01' AND '1997-12-31'    AND l.amount >= 250000    AND a.frequency = 'POPLATEK MESICNE'  GROUP BY a.account_id;	financial
SELECT COUNT(DISTINCT l.account_id)  FROM loan l  JOIN account a ON l.account_id = a.account_id  WHERE a.district_id = 1 AND l.status IN ('C', 'D');	financial
SELECT COUNT(*) FROM client WHERE gender = 'M' AND district_id IN (SELECT district_id FROM (SELECT district_id, DENSE_RANK() OVER (ORDER BY A15 DESC) AS rnk FROM district) WHERE rnk = 2);	financial
SELECT COUNT(*) FROM card JOIN disp ON card.disp_id = disp.disp_id WHERE card.type = 'gold' AND disp.type = 'OWNER';	financial
SELECT COUNT(a.account_id) FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Pisek';	financial
SELECT DISTINCT d.A2  FROM trans t  JOIN account a ON t.account_id = a.account_id  JOIN district d ON a.district_id = d.district_id  WHERE t.amount > 10000 AND strftime('%Y', t.date) = '1997';	financial
SELECT DISTINCT o.account_id FROM `order` o JOIN account a ON o.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE o.k_symbol = 'SIPO' AND d.A2 = 'Pisek';	financial
SELECT DISTINCT a.account_id FROM account a JOIN disp d ON a.account_id = d.account_id JOIN card c ON d.disp_id = c.disp_id WHERE c.type = 'gold';	financial
SELECT AVG(amount)  FROM trans  WHERE operation = 'VYBER KARTOU'    AND strftime('%Y', date) = '2021';	financial
SELECT DISTINCT d.client_id  FROM trans t  JOIN disp d ON t.account_id = d.account_id AND d.type = 'OWNER'  WHERE t.operation = 'VYBER KARTOU'    AND strftime('%Y', t.date) = '1998'    AND t.amount < (     SELECT AVG(amount)      FROM trans      WHERE operation = 'VYBER KARTOU'        AND strftime('%Y', date) = '1998'   );	financial
SELECT DISTINCT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id AND d.type = 'OWNER' JOIN card ca ON d.disp_id = ca.disp_id JOIN loan l ON d.account_id = l.account_id WHERE c.gender = 'F';	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c  JOIN disp d ON c.client_id = d.client_id  JOIN account a ON d.account_id = a.account_id  JOIN district di ON a.district_id = di.district_id  WHERE c.gender = 'F' AND di.A3 = 'south Bohemia';	financial
SELECT DISTINCT a.account_id   FROM account a   JOIN district d ON a.district_id = d.district_id   JOIN disp dp ON a.account_id = dp.account_id   WHERE d.A2 = 'Tabor' AND dp.type = 'OWNER';	financial
SELECT DISTINCT d.type  FROM disp d  JOIN account a ON d.account_id = a.account_id  JOIN district di ON a.district_id = di.district_id  WHERE d.type != 'OWNER'  AND di.A11 > 8000  AND di.A11 <= 9000;	financial
SELECT COUNT(DISTINCT a.account_id) FROM district d JOIN account a ON d.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id WHERE d.A3 = 'North Bohemia' AND t.bank = 'AB';	financial
SELECT DISTINCT district.A2  FROM district  JOIN account ON district.district_id = account.district_id  JOIN trans ON account.account_id = trans.account_id  WHERE trans.type = 'VYDAJ';	financial
SELECT AVG(d.A15)  FROM district d  WHERE d.A15 > 4000  AND EXISTS (     SELECT 1      FROM account a      WHERE a.district_id = d.district_id      AND a.date >= '1997-01-01' );	financial
SELECT COUNT(*)  FROM card c  INNER JOIN disp d ON c.disp_id = d.disp_id  INNER JOIN disp d_owner ON d.account_id = d_owner.account_id  WHERE c.type = 'classic' AND d_owner.type = 'OWNER';	financial
SELECT COUNT(*) FROM client JOIN district ON client.district_id = district.district_id WHERE district.A2 = 'Hl.m. Praha' AND client.gender = 'M';	financial
SELECT (SUM(CASE WHEN type = 'gold' AND issued < '1998-01-01' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS percentage FROM card;	financial
SELECT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id WHERE d.account_id = (SELECT l.account_id FROM loan l ORDER BY l.amount DESC LIMIT 1) AND d.type = 'OWNER';	financial
SELECT d.A15 FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.account_id = 532;	financial
SELECT a.district_id FROM `order` o JOIN account a ON o.account_id = a.account_id WHERE o.order_id = 33333;	financial
SELECT t.*  FROM trans t  JOIN account a ON t.account_id = a.account_id  JOIN disp d ON a.account_id = d.account_id  JOIN client c ON d.client_id = c.client_id  WHERE c.client_id = 3356 AND t.operation = 'VYBER';	financial
SELECT COUNT(DISTINCT a.account_id)  FROM account a  JOIN loan l ON a.account_id = l.account_id  WHERE a.frequency = 'POPLATEK TYDNE'    AND l.amount < 200000;	financial
SELECT card.type FROM client JOIN disp ON client.client_id = disp.client_id JOIN card ON disp.disp_id = card.disp_id WHERE client.client_id = 13539;	financial
SELECT d.A3 FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.client_id = 3541;	financial
SELECT d.A2  FROM district d  JOIN account a ON d.district_id = a.district_id  JOIN loan l ON a.account_id = l.account_id  WHERE l.status = 'A'  GROUP BY d.district_id  ORDER BY COUNT(DISTINCT a.account_id) DESC  LIMIT 1;	financial
SELECT c.client_id FROM `order` o JOIN account a ON o.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id WHERE o.order_id = 32423 AND d.type = 'OWNER';	financial
SELECT t.*  FROM trans t  JOIN account a ON t.account_id = a.account_id  WHERE a.district_id = 5;	financial
SELECT COUNT(*) FROM account JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Jesenik';	financial
SELECT DISTINCT d.client_id  FROM card c  JOIN disp d ON c.disp_id = d.disp_id  WHERE c.type = 'junior' AND c.issued >= '1997-01-01';	financial
SELECT      (COUNT(CASE WHEN c.gender = 'F' THEN 1 END) * 100.0 / COUNT(DISTINCT c.client_id)) AS percentage FROM      district d JOIN      account a ON d.district_id = a.district_id JOIN      disp dp ON a.account_id = dp.account_id AND dp.type = 'OWNER' JOIN      client c ON dp.client_id = c.client_id WHERE      d.A11 > 10000;	financial
SELECT     (SUM(CASE WHEN strftime('%Y', loan.date) = '1997' THEN loan.amount ELSE 0 END) -      SUM(CASE WHEN strftime('%Y', loan.date) = '1996' THEN loan.amount ELSE 0 END)) * 100.0 /      SUM(CASE WHEN strftime('%Y', loan.date) = '1996' THEN loan.amount ELSE 0 END) AS growth_rate  FROM loan  JOIN account ON loan.account_id = account.account_id  JOIN disp ON account.account_id = disp.account_id AND disp.type = 'OWNER'  JOIN client ON disp.client_id = client.client_id AND client.gender = 'M'  WHERE strftime('%Y', loan.date) IN ('1996', '1997');	financial
SELECT COUNT(*) FROM trans WHERE operation = 'VYBER KARTOU' AND YEAR(date) > 1995;	financial
SELECT (SELECT SUM(A16) FROM district WHERE A3 = 'North Bohemia') - (SELECT SUM(A16) FROM district WHERE A3 = 'East Bohemia') AS difference;	financial
SELECT type, COUNT(*) AS count FROM disp WHERE account_id BETWEEN 1 AND 10 GROUP BY type;	financial
SELECT a.frequency FROM account a WHERE a.account_id = 3;   SELECT t.k_symbol FROM trans t WHERE t.type = 'VYDAJ' GROUP BY t.k_symbol HAVING SUM(t.amount) = 3539;	financial
SELECT YEAR(client.birth_date) FROM client JOIN disp ON client.client_id = disp.client_id WHERE disp.account_id = 130 AND disp.type = 'OWNER';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN disp d ON a.account_id = d.account_id WHERE a.frequency = 'POPLATEK PO OBRATU' AND d.type = 'OWNER';	financial
SELECT l.amount AS debt_amount, l.status AS payment_status  FROM loan l  JOIN account a ON l.account_id = a.account_id  JOIN disp d ON a.account_id = d.account_id  JOIN client c ON d.client_id = c.client_id  WHERE c.client_id = 992 AND d.type = 'OWNER';	financial
SELECT      t.balance AS sum_balance,     c.gender  FROM      trans t      JOIN disp d ON t.account_id = d.account_id      JOIN client c ON d.client_id = c.client_id  WHERE      d.client_id = 4      AND d.type = 'OWNER'      AND t.trans_id = 851;	financial
SELECT card.type FROM client JOIN disp ON client.client_id = disp.client_id JOIN card ON disp.disp_id = card.disp_id WHERE client.client_id = 9;	financial
SELECT SUM(t.amount) AS total_paid  FROM client c  JOIN disp d ON c.client_id = d.client_id  JOIN trans t ON d.account_id = t.account_id  WHERE c.client_id = 617    AND t.type = 'VYDAJ'    AND strftime('%Y', t.date) = '1998';	financial
SELECT c.client_id  FROM client c  JOIN disp d ON c.client_id = d.client_id  JOIN account a ON d.account_id = a.account_id  JOIN district di ON a.district_id = di.district_id  WHERE di.A3 = 'East Bohemia'    AND strftime('%Y', c.birth_date) BETWEEN '1983' AND '1987'    AND d.type = 'OWNER';	financial
SELECT c.client_id  FROM loan l  JOIN account a ON l.account_id = a.account_id  JOIN disp d ON a.account_id = d.account_id AND d.type = 'OWNER'  JOIN client c ON d.client_id = c.client_id  WHERE c.gender = 'F'  ORDER BY l.amount DESC  LIMIT 3;	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c  JOIN disp d ON c.client_id = d.client_id AND d.type = 'OWNER'  JOIN account a ON d.account_id = a.account_id  JOIN `order` o ON a.account_id = o.account_id  WHERE c.gender = 'M'  AND YEAR(c.birth_date) BETWEEN 1974 AND 1976  AND o.k_symbol = 'SIPO'  AND o.amount > 4000;	financial
SELECT COUNT(*)  FROM account  JOIN district ON account.district_id = district.district_id  WHERE district.A2 = 'Beroun'  AND YEAR(account.date) > 1996;	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c  JOIN disp d ON c.client_id = d.client_id  JOIN card ca ON d.disp_id = ca.disp_id  WHERE c.gender = 'F' AND ca.type = 'junior' AND d.type = 'OWNER';	financial
SELECT      (COUNT(DISTINCT CASE WHEN c.gender = 'F' THEN c.client_id END) * 100.0) / COUNT(DISTINCT c.client_id) AS female_percentage FROM account a JOIN district d ON a.district_id = d.district_id JOIN disp dp ON a.account_id = dp.account_id JOIN client c ON dp.client_id = c.client_id WHERE d.A3 = 'Prague';	financial
SELECT      (100.0 * COUNT(CASE WHEN gender = 'M' THEN 1 END)) / COUNT(*) AS percentage FROM (     SELECT DISTINCT c.client_id, c.gender     FROM client c     INNER JOIN disp d ON d.client_id = c.client_id AND d.type = 'OWNER'     INNER JOIN account a ON a.account_id = d.account_id     WHERE a.frequency = 'POPLATEK TYDNE' ) AS weekly_clients;	financial
SELECT COUNT(DISTINCT d.client_id)  FROM account a  JOIN disp d ON a.account_id = d.account_id  WHERE a.frequency = 'POPLATEK TYDNE'  AND d.type = 'OWNER';	financial
SELECT l.account_id FROM loan l INNER JOIN account a ON l.account_id = a.account_id WHERE l.duration > 24 AND a.date < '1997-01-01' AND l.amount = (     SELECT MIN(l2.amount)     FROM loan l2     INNER JOIN account a2 ON l2.account_id = a2.account_id     WHERE l2.duration > 24     AND a2.date < '1997-01-01' );	financial
SELECT a.account_id  FROM client c  JOIN district d ON c.district_id = d.district_id  JOIN disp dp ON c.client_id = dp.client_id  JOIN account a ON dp.account_id = a.account_id  WHERE c.gender = 'F'  AND dp.type = 'OWNER'  AND c.birth_date = (SELECT MIN(birth_date) FROM client WHERE gender = 'F')  AND d.A11 = (SELECT MIN(d2.A11) FROM client c2 JOIN district d2 ON c2.district_id = d2.district_id WHERE c2.gender = 'F' AND c2.birth_date = (SELECT MIN(birth_date) FROM client WHERE gender = 'F'));	financial
SELECT COUNT(*)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE YEAR(client.birth_date) = 1920  AND district.A3 = 'east Bohemia';	financial
SELECT COUNT(*)  FROM loan  JOIN account ON loan.account_id = account.account_id  WHERE loan.duration = 24  AND account.frequency = 'POPLATEK TYDNE'  AND loan.status = 'A';	financial
SELECT AVG(l.amount)  FROM loan l  JOIN account a ON l.account_id = a.account_id  WHERE l.status IN ('C', 'D')  AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT DISTINCT c.client_id, c.district_id FROM client c JOIN disp d ON c.client_id = d.client_id WHERE d.type = 'OWNER';	financial
SELECT c.client_id, (strftime('%Y', a.date) - strftime('%Y', c.birth_date)) AS age  FROM client c  JOIN disp d ON c.client_id = d.client_id  JOIN card ca ON d.disp_id = ca.disp_id  JOIN account a ON d.account_id = a.account_id  WHERE d.type = 'OWNER' AND ca.type = 'gold';	financial
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY COUNT(*) DESC LIMIT 1;	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE m.label = '-' AND a.element = 'cl';	toxicology
SELECT AVG(oxygen_count) FROM (SELECT b.molecule_id, COUNT(CASE WHEN a.element = 'o' THEN 1 END) AS oxygen_count FROM (SELECT DISTINCT molecule_id FROM bond WHERE bond_type = '-') b LEFT JOIN atom a ON b.molecule_id = a.molecule_id GROUP BY b.molecule_id);	toxicology
SELECT AVG(bond_count) FROM (SELECT COUNT(b.bond_id) AS bond_count FROM molecule m LEFT JOIN bond b ON m.molecule_id = b.molecule_id AND b.bond_type = '-' WHERE m.label = '+' GROUP BY m.molecule_id);	toxicology
SELECT COUNT(DISTINCT molecule.molecule_id) FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.element = 'na' AND molecule.label = '-';	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.label = '+' AND b.bond_type = '#';	toxicology
SELECT (SUM(CASE WHEN a.element = 'c' THEN 1 ELSE 0 END) * 100.0) / COUNT(a.atom_id) AS percentage FROM atom a WHERE a.molecule_id IN (SELECT DISTINCT b.molecule_id FROM bond b WHERE b.bond_type = '=');	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '#';	toxicology
SELECT COUNT(*) FROM atom WHERE element != 'br';	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR099' AND label = '+';	toxicology
SELECT DISTINCT a.molecule_id  FROM atom a  WHERE a.element = 'c';	toxicology
SELECT a.element FROM atom a WHERE a.atom_id IN (SELECT c.atom_id FROM connected c WHERE c.bond_id = 'TR004_8_9') OR a.atom_id IN (SELECT c.atom_id2 FROM connected c WHERE c.bond_id = 'TR004_8_9');	toxicology
SELECT DISTINCT a1.element, a2.element FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE b.bond_type = '=';	toxicology
SELECT m.label  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE a.element = 'h'  GROUP BY m.label  ORDER BY COUNT(*) DESC  LIMIT 1;	toxicology
SELECT DISTINCT bond.bond_type FROM bond WHERE bond.bond_id IN (SELECT connected.bond_id FROM connected WHERE connected.atom_id IN (SELECT atom_id FROM atom WHERE element = 'cl') OR connected.atom_id2 IN (SELECT atom_id FROM atom WHERE element = 'cl'));	toxicology
SELECT c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-';	toxicology
SELECT DISTINCT c.atom_id, c.atom_id2 FROM connected c JOIN atom a ON c.atom_id = a.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '-';	toxicology
SELECT element FROM (     SELECT a.element, COUNT(*) AS cnt     FROM atom a     JOIN molecule m ON a.molecule_id = m.molecule_id     WHERE m.label = '-'     GROUP BY a.element     ORDER BY cnt ASC     LIMIT 1 );	toxicology
SELECT bond.bond_type FROM connected JOIN bond ON connected.bond_id = bond.bond_id WHERE (connected.atom_id = 'TR004_8' AND connected.atom_id2 = 'TR004_20') OR (connected.atom_id = 'TR004_20' AND connected.atom_id2 = 'TR004_8');	toxicology
SELECT DISTINCT m.label  FROM molecule m WHERE m.label NOT IN (     SELECT DISTINCT m2.label     FROM molecule m2     JOIN atom a ON m2.molecule_id = a.molecule_id     WHERE a.element != 'sn' );	toxicology
SELECT COUNT(DISTINCT a.atom_id)  FROM atom a  WHERE a.element IN ('i', 's')  AND a.molecule_id IN (     SELECT b.molecule_id      FROM bond b      GROUP BY b.molecule_id      HAVING SUM(CASE WHEN b.bond_type != '-' THEN 1 ELSE 0 END) = 0 );	toxicology
SELECT c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#';	toxicology
SELECT DISTINCT atom_id FROM connected WHERE bond_id IN (SELECT bond_id FROM bond WHERE molecule_id = 'TR181') UNION SELECT DISTINCT atom_id2 FROM connected WHERE bond_id IN (SELECT bond_id FROM bond WHERE molecule_id = 'TR181');	toxicology
SELECT (SUM(CASE WHEN NOT EXISTS (SELECT 1 FROM atom a WHERE a.molecule_id = m.molecule_id AND a.element = 'f') THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS percentage FROM molecule m WHERE m.label = '+';	toxicology
SELECT (SUM(CASE WHEN b.bond_type = '#' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS percent FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.label = '+';	toxicology
SELECT element FROM (   SELECT element   FROM atom   WHERE molecule_id = 'TR000'   GROUP BY element   ORDER BY COUNT(*) DESC, element   LIMIT 3 ) AS sub ORDER BY element;	toxicology
SELECT a1.element, a2.element FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE b.bond_id = 'TR001_2_6' AND b.molecule_id = 'TR001';	toxicology
SELECT (SUM(label = '+') - SUM(label = '-')) AS difference FROM molecule;	toxicology
SELECT atom_id, atom_id2 FROM connected WHERE bond_id = 'TR000_2_5';	toxicology
SELECT DISTINCT bond_id FROM connected WHERE atom_id2 IN (SELECT atom_id2 FROM connected WHERE atom_id = 'TR000_2');	toxicology
SELECT molecule_id FROM (SELECT molecule_id, COUNT(*) AS cnt FROM bond WHERE bond_type = ' = ' GROUP BY molecule_id ORDER BY cnt DESC, molecule_id LIMIT 5) ORDER BY molecule_id;	toxicology
SELECT ROUND((SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 5) AS percentage FROM bond WHERE molecule_id = 'TR008';	toxicology
SELECT ROUND((SUM(label = '+') * 100.0) / COUNT(*), 3) AS percent FROM molecule;	toxicology
SELECT ROUND((SUM(element = 'h') * 100.0 / COUNT(atom_id)), 4) AS percent FROM atom WHERE molecule_id = 'TR206' GROUP BY molecule_id;	toxicology
SELECT DISTINCT bond_type FROM bond WHERE molecule_id = 'TR000';	toxicology
SELECT DISTINCT a.element, m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.molecule_id = 'TR060';	toxicology
SELECT (SELECT bond_type FROM bond WHERE molecule_id = 'TR010' GROUP BY bond_type ORDER BY COUNT(*) DESC LIMIT 1) AS majority_bond_type, CASE WHEN label = '+' THEN 'Yes' ELSE 'No' END AS is_carcinogenic FROM molecule WHERE molecule_id = 'TR010';	toxicology
SELECT m.molecule_id  FROM molecule m  JOIN bond b ON m.molecule_id = b.molecule_id  WHERE m.label = '-' AND b.bond_type = '-'  GROUP BY m.molecule_id  ORDER BY m.molecule_id  LIMIT 3;	toxicology
SELECT bond_id FROM bond WHERE molecule_id = 'TR006' ORDER BY bond_id LIMIT 2;	toxicology
SELECT COUNT(DISTINCT bond.bond_id) FROM bond JOIN connected ON bond.bond_id = connected.bond_id WHERE bond.molecule_id = 'TR009' AND (connected.atom_id = 'TR009_12' OR connected.atom_id2 = 'TR009_12');	toxicology
SELECT COUNT(DISTINCT molecule.molecule_id) FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '+' AND atom.element = 'br';	toxicology
SELECT b.bond_type, c.atom_id, c.atom_id2 FROM bond b LEFT JOIN connected c ON b.bond_id = c.bond_id WHERE b.bond_id = 'TR001_6_9';	toxicology
SELECT m.molecule_id, CASE WHEN m.label = '+' THEN 'carcinogenic' ELSE 'not carcinogenic' END FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR001_10';	toxicology
SELECT COUNT(DISTINCT molecule_id) FROM bond WHERE bond_type = '#';	toxicology
SELECT COUNT(DISTINCT bond_id) FROM connected WHERE atom_id LIKE 'TR%\_19' ESCAPE '\' OR atom_id2 LIKE 'TR%\_19' ESCAPE '\';	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR004';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '-';	toxicology
SELECT DISTINCT a.molecule_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE SUBSTR(a.atom_id, 7, 2) BETWEEN '21' AND '25' AND m.label = '+';	toxicology
SELECT DISTINCT c.bond_id FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE (a1.element = 'p' AND a2.element = 'n') OR (a1.element = 'n' AND a2.element = 'p');	toxicology
SELECT CASE WHEN EXISTS (SELECT 1 FROM molecule WHERE molecule_id IN (SELECT molecule_id FROM bond WHERE bond_type = '=' GROUP BY molecule_id HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM bond WHERE bond_type = '=' GROUP BY molecule_id))) AND label = '+') THEN 'Yes' ELSE 'No' END;	toxicology
SELECT AVG(bond_count) AS average FROM (SELECT a.atom_id, COUNT(DISTINCT c.bond_id) AS bond_count FROM atom a LEFT JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE a.element = 'i' GROUP BY a.atom_id);	toxicology
SELECT DISTINCT b.bond_type, b.bond_id FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE CAST(SUBSTR(c.atom_id, 7, 2) AS INTEGER) = 45 OR CAST(SUBSTR(c.atom_id2, 7, 2) AS INTEGER) = 45;	toxicology
SELECT DISTINCT element FROM atom WHERE atom_id NOT IN (SELECT atom_id FROM connected UNION SELECT atom_id2 FROM connected);	toxicology
SELECT c.atom_id, c.atom_id2 FROM bond b JOIN connected c ON b.bond_id = c.bond_id WHERE b.molecule_id = 'TR041' AND b.bond_type = '#';	toxicology
SELECT a1.element, a2.element FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE c.bond_id = 'TR144_8_19' LIMIT 1;	toxicology
SELECT b.molecule_id  FROM molecule m  JOIN bond b ON m.molecule_id = b.molecule_id  WHERE m.label = '+' AND b.bond_type = '='  GROUP BY b.molecule_id  ORDER BY COUNT(*) DESC  LIMIT 1;	toxicology
SELECT element FROM (SELECT element, COUNT(*) AS cnt FROM atom JOIN molecule USING (molecule_id) WHERE label = '+' GROUP BY element) WHERE cnt = (SELECT MIN(cnt) FROM (SELECT COUNT(*) AS cnt FROM atom JOIN molecule USING (molecule_id) WHERE label = '+' GROUP BY element));	toxicology
SELECT DISTINCT a2.atom_id FROM atom a1 JOIN connected c ON a1.atom_id IN (c.atom_id, c.atom_id2) JOIN atom a2 ON (a2.atom_id = c.atom_id OR a2.atom_id = c.atom_id2) WHERE a1.element = 'pb' AND a2.atom_id != a1.atom_id;	toxicology
SELECT a1.element AS element1, a2.element AS element2 FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE b.bond_type = '#';	toxicology
WITH BondElementPairs AS (     SELECT          b.bond_id,         MIN(CASE WHEN a1.element < a2.element THEN a1.element || '-' || a2.element ELSE a2.element || '-' || a1.element END) AS element_pair     FROM bond b     LEFT JOIN connected c ON b.bond_id = c.bond_id     LEFT JOIN atom a1 ON c.atom_id = a1.atom_id     LEFT JOIN atom a2 ON c.atom_id2 = a2.atom_id     WHERE c.bond_id IS NOT NULL     GROUP BY b.bond_id ), ElementPairCounts AS (     SELECT element_pair, COUNT(*) AS count_pair     FROM BondElementPairs     GROUP BY element_pair ), MaxCount AS (     SELECT MAX(count_pair) AS max_count     FROM ElementPairCounts ), TotalBonds AS (     SELECT COUNT(*) AS total     FROM bond ) SELECT (SELECT max_count FROM MaxCount) * 100.0 / (SELECT total FROM TotalBonds) AS percentage;	toxicology
SELECT ROUND((SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 5) AS proportion FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '-';	toxicology
SELECT COUNT(*) FROM atom WHERE element IN ('c', 'h');	toxicology
SELECT c.atom_id2 FROM connected c JOIN atom a ON c.atom_id2 = a.atom_id WHERE a.element = 's';	toxicology
SELECT DISTINCT bond.bond_type FROM atom JOIN connected ON atom.atom_id = connected.atom_id OR atom.atom_id = connected.atom_id2 JOIN bond ON connected.bond_id = bond.bond_id WHERE atom.element = 'sn';	toxicology
SELECT COUNT(DISTINCT a.element) FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id WHERE b.bond_type = '-';	toxicology
SELECT COUNT(*)  FROM atom  WHERE element IN ('p', 'br')  AND molecule_id IN (     SELECT molecule_id      FROM bond      WHERE bond_type = '#' );	toxicology
SELECT b.bond_id  FROM bond b  JOIN molecule m ON b.molecule_id = m.molecule_id  WHERE m.label = '+';	toxicology
SELECT DISTINCT b.molecule_id  FROM bond b  JOIN molecule m ON b.molecule_id = m.molecule_id  WHERE b.bond_type = '-' AND m.label = '-';	toxicology
SELECT (SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END) * 100.0) / COUNT(a.atom_id) AS percentage FROM atom a WHERE a.molecule_id IN (SELECT DISTINCT b.molecule_id FROM bond b WHERE b.bond_type = '-');	toxicology
SELECT molecule_id, label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002');	toxicology
SELECT molecule_id FROM molecule WHERE label = '-';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+' AND molecule_id BETWEEN 'TR000' AND 'TR030';	toxicology
SELECT bond_type, molecule_id FROM bond WHERE molecule_id BETWEEN 'TR000' AND 'TR050';	toxicology
SELECT a1.element, a2.element  FROM bond b  JOIN connected c ON b.bond_id = c.bond_id  JOIN atom a1 ON c.atom_id = a1.atom_id  JOIN atom a2 ON c.atom_id2 = a2.atom_id  WHERE b.bond_id = 'TR001_10_11';	toxicology
SELECT COUNT(DISTINCT c.bond_id) FROM connected c JOIN atom a ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE a.element = 'i';	toxicology
SELECT MAX(m.label) FROM molecule m WHERE m.molecule_id IN (SELECT a.molecule_id FROM atom a WHERE a.element = 'ca');	toxicology
SELECT CASE WHEN EXISTS (SELECT 1 FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE c.bond_id = 'TR001_1_8' AND ((a1.element = 'cl' AND a2.element = 'c') OR (a1.element = 'c' AND a2.element = 'cl'))) THEN 'Yes' ELSE 'No' END;	toxicology
SELECT DISTINCT m.molecule_id  FROM molecule m  INNER JOIN bond b ON m.molecule_id = b.molecule_id AND b.bond_type = '#'  INNER JOIN atom a ON m.molecule_id = a.molecule_id AND a.element = 'c'  WHERE m.label = '-'  LIMIT 2;	toxicology
SELECT (SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS percentage FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+';	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR001';	toxicology
SELECT DISTINCT molecule_id FROM bond WHERE bond_type = '=';	toxicology
SELECT c.atom_id, c.atom_id2 FROM bond b JOIN connected c ON b.bond_id = c.bond_id WHERE b.bond_type = '#';	toxicology
SELECT a1.element, a2.element FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE c.bond_id = 'TR000_1_2';	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m  JOIN bond b ON m.molecule_id = b.molecule_id  WHERE m.label = '-' AND b.bond_type = '-';	toxicology
SELECT m.label FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_id = 'TR001_10_11';	toxicology
SELECT b.bond_id, CASE m.label WHEN '+' THEN 'carcinogenic' ELSE 'non-carcinogenic' END AS carcinogenic_status FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '#';	toxicology
SELECT a.element, COUNT(*) AS tally FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' AND SUBSTR(a.atom_id, 7, 1) = '4' GROUP BY a.element;	toxicology
SELECT    (SUM(CASE WHEN a.element = 'h' THEN 1 ELSE 0 END) * 1.0) / COUNT(*) AS ratio,   m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.molecule_id = 'TR006' GROUP BY m.molecule_id;	toxicology
SELECT CASE WHEN EXISTS (SELECT 1 FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'ca' AND m.label = '+') THEN 'Yes' ELSE 'No' END AS is_carcinogenic;	toxicology
SELECT DISTINCT b.bond_type FROM bond b WHERE b.bond_id IN (SELECT c.bond_id FROM connected c WHERE c.atom_id IN (SELECT a.atom_id FROM atom a WHERE a.element = 'c') OR c.atom_id2 IN (SELECT a.atom_id FROM atom a WHERE a.element = 'c'));	toxicology
SELECT DISTINCT a.element FROM connected c JOIN atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id WHERE c.bond_id = 'TR001_10_11';	toxicology
SELECT (COUNT(DISTINCT b.molecule_id) * 100.0 / NULLIF((SELECT COUNT(*) FROM molecule), 0)) AS percentage FROM bond b WHERE b.bond_type = '#';	toxicology
SELECT (SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS percent FROM bond WHERE molecule_id = 'TR047';	toxicology
SELECT m.label = '+' AS is_carcinogenic FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR001_1';	toxicology
SELECT CASE WHEN label = '+' THEN 'YES' ELSE 'NO' END AS carcinogenic FROM molecule WHERE molecule_id = 'TR151';	toxicology
SELECT DISTINCT element FROM atom WHERE molecule_id = 'TR151';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+';	toxicology
SELECT atom_id, molecule_id, element FROM atom WHERE element = 'c' AND CAST(SUBSTR(molecule_id, 3, 3) AS INTEGER) BETWEEN 10 AND 50;	toxicology
SELECT COUNT(a.atom_id)  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE m.label = '+';	toxicology
SELECT b.bond_id FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '=' AND m.label = '+';	toxicology
SELECT COUNT(*)  FROM atom  JOIN molecule USING (molecule_id)  WHERE molecule.label = '+' AND atom.element = 'h';	toxicology
SELECT molecule_id FROM bond WHERE bond_id = 'TR000_1_2';	toxicology
SELECT a.atom_id  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE a.element = 'c' AND m.label = '-';	toxicology
SELECT (SUM(CASE WHEN m.label = '+' AND EXISTS (SELECT 1 FROM atom a WHERE a.molecule_id = m.molecule_id AND a.element = 'h') THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS percentage FROM molecule m;	toxicology
SELECT CASE WHEN (SELECT label FROM molecule WHERE molecule_id = 'TR124') = '+' THEN 'Yes' ELSE 'No' END;	toxicology
SELECT atom_id, element FROM atom WHERE molecule_id = 'TR186';	toxicology
SELECT bond_type FROM bond WHERE bond_id = 'TR007_4_19';	toxicology
SELECT a1.element, a2.element FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE c.bond_id = 'TR001_2_4';	toxicology
SELECT      COUNT(b.bond_id) AS double_bond_count,     CASE m.label WHEN '+' THEN 'yes' ELSE 'no' END AS is_carcinogenic FROM molecule m LEFT JOIN bond b ON m.molecule_id = b.molecule_id AND b.bond_type = '=' WHERE m.molecule_id = 'TR006' GROUP BY m.molecule_id, m.label;	toxicology
SELECT DISTINCT m.molecule_id, a.element  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE m.label = '+';	toxicology
SELECT b.bond_id, b.bond_type, b.molecule_id, a1.element AS atom1_element, a2.element AS atom2_element FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE b.bond_type = '-' AND c.atom_id < c.atom_id2;	toxicology
SELECT DISTINCT b.molecule_id, GROUP_CONCAT(DISTINCT a.element) AS elements  FROM bond b  JOIN atom a ON b.molecule_id = a.molecule_id  WHERE b.bond_type = '#'  GROUP BY b.molecule_id;	toxicology
SELECT element FROM atom WHERE atom_id IN (SELECT atom_id FROM connected WHERE bond_id = 'TR000_2_3' UNION SELECT atom_id2 FROM connected WHERE bond_id = 'TR000_2_3');	toxicology
SELECT COUNT(DISTINCT bond_id) FROM connected WHERE atom_id IN (SELECT atom_id FROM atom WHERE element = 'cl') OR atom_id2 IN (SELECT atom_id FROM atom WHERE element = 'cl');	toxicology
SELECT a.atom_id, (SELECT COUNT(DISTINCT bond_type) FROM bond WHERE molecule_id = 'TR346') AS bond_type_count FROM atom a WHERE a.molecule_id = 'TR346';	toxicology
SELECT      (SELECT COUNT(DISTINCT b.molecule_id) FROM bond b WHERE b.bond_type = '=') AS total_double_bond_molecules,     (SELECT COUNT(DISTINCT b.molecule_id) FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '=' AND m.label = '+') AS carcinogenic_count;	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id NOT IN (SELECT molecule_id FROM atom WHERE element = 's') AND molecule_id NOT IN (SELECT molecule_id FROM bond WHERE bond_type = '=');	toxicology
SELECT m.label FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_id = 'TR001_2_4';	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR001';	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '-';	toxicology
SELECT DISTINCT a.molecule_id  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE a.element = 'cl' AND m.label = '+';	toxicology
SELECT m.molecule_id FROM molecule m WHERE m.label = '-' AND EXISTS (     SELECT 1     FROM atom a     WHERE a.molecule_id = m.molecule_id     AND a.element = 'c' );	toxicology
SELECT (SUM(CASE WHEN EXISTS (SELECT 1 FROM atom WHERE atom.molecule_id = m.molecule_id AND element = 'cl') THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS percentage FROM molecule m WHERE m.label = '+';	toxicology
SELECT molecule_id FROM bond WHERE bond_id = 'TR001_1_7';	toxicology
SELECT COUNT(DISTINCT a.element) + COUNT(DISTINCT b.element)  FROM connected c  LEFT JOIN atom a ON c.atom_id = a.atom_id  LEFT JOIN atom b ON c.atom_id2 = b.atom_id  WHERE c.bond_id = 'TR001_3_4';	toxicology
SELECT bond.bond_type FROM connected JOIN bond ON connected.bond_id = bond.bond_id WHERE (connected.atom_id = 'TR000_1' AND connected.atom_id2 = 'TR000_2') OR (connected.atom_id = 'TR000_2' AND connected.atom_id2 = 'TR000_1');	toxicology
SELECT a1.molecule_id FROM atom a1 JOIN atom a2 ON a1.molecule_id = a2.molecule_id WHERE a1.atom_id = 'TR000_2' AND a2.atom_id = 'TR000_4';	toxicology
SELECT element FROM atom WHERE atom_id = 'TR000_1';	toxicology
SELECT CASE WHEN label = '+' THEN 'carcinogenic' ELSE 'non-carcinogenic' END FROM molecule WHERE molecule_id = 'TR000';	toxicology
SELECT (SUM(bond_type = '-') * 100.0) / COUNT(*) AS percentage FROM bond;	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE m.label = '+' AND a.element = 'n';	toxicology
SELECT DISTINCT a.molecule_id FROM atom a JOIN connected c ON a.atom_id IN (c.atom_id, c.atom_id2) JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 's' AND b.bond_type = '=';	toxicology
SELECT m.molecule_id  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE m.label = '-'  GROUP BY m.molecule_id  HAVING COUNT(a.atom_id) > 5;	toxicology
SELECT DISTINCT a.element FROM atom a WHERE a.atom_id IN (SELECT atom_id FROM connected WHERE bond_id IN (SELECT bond_id FROM bond WHERE molecule_id = 'TR024' AND bond_type = '=') UNION SELECT atom_id2 FROM connected WHERE bond_id IN (SELECT bond_id FROM bond WHERE molecule_id = 'TR024' AND bond_type = '='));	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' GROUP BY m.molecule_id HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM molecule m2 JOIN atom a2 ON m2.molecule_id = a2.molecule_id WHERE m2.label = '+' GROUP BY m2.molecule_id));	toxicology
SELECT (SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS percentage FROM (SELECT DISTINCT b.molecule_id FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON a.atom_id IN (c.atom_id, c.atom_id2) WHERE b.bond_type = '#' AND a.element = 'h') AS eligible JOIN molecule m ON eligible.molecule_id = m.molecule_id;	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+';	toxicology
SELECT COUNT(DISTINCT b.molecule_id) FROM bond b WHERE b.bond_type = '-' AND b.molecule_id BETWEEN 'TR004' AND 'TR010';	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR008' AND element = 'c';	toxicology
SELECT a.element  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE a.atom_id = 'TR004_7' AND m.label = '-';	toxicology
SELECT COUNT(DISTINCT b.molecule_id)  FROM bond b  JOIN connected c ON b.bond_id = c.bond_id  JOIN atom a1 ON c.atom_id = a1.atom_id  JOIN atom a2 ON c.atom_id2 = a2.atom_id  WHERE b.bond_type = '='  AND (a1.element = 'o' OR a2.element = 'o');	toxicology
SELECT COUNT(DISTINCT b.molecule_id) FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '#' AND m.label = '-';	toxicology
SELECT element, NULL AS bond_type FROM atom WHERE molecule_id = 'TR002' UNION ALL SELECT NULL, bond_type FROM bond WHERE molecule_id = 'TR002';	toxicology
SELECT DISTINCT a.atom_id FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON (a.atom_id = c.atom_id OR a.atom_id = c.atom_id2) WHERE b.molecule_id = 'TR012' AND b.bond_type = '=' AND a.element = 'c';	toxicology
SELECT a.atom_id  FROM atom a  WHERE a.molecule_id IN (     SELECT m.molecule_id      FROM molecule m      JOIN atom a ON m.molecule_id = a.molecule_id      WHERE m.label = '+' AND a.element = 'o' );	toxicology
SELECT *  FROM cards  WHERE cardKingdomFoilId IS NOT NULL    AND cardKingdomId IS NOT NULL;	card_games
SELECT *  FROM cards  WHERE borderColor = 'borderless'    AND (cardKingdomFoilId IS NULL OR cardKingdomId IS NULL);	card_games
SELECT name  FROM cards  WHERE faceConvertedManaCost = (SELECT MAX(faceConvertedManaCost) FROM cards)  AND faceConvertedManaCost IS NOT NULL;	card_games
SELECT name FROM cards WHERE frameVersion = '2015' AND edhrecRank < 100;	card_games
SELECT DISTINCT c.*  FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'mythic'   AND l.format = 'gladiator'   AND l.status = 'Banned';	card_games
SELECT c.name, l.status  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE c.types = 'Artifact'    AND c.side IS NULL    AND l.format = 'vintage';	card_games
SELECT DISTINCT c.id, c.artist  FROM cards c  INNER JOIN legalities l ON c.uuid = l.uuid  WHERE (c.power = '*' OR c.power IS NULL)  AND l.format = 'commander'  AND l.status = 'Legal';	card_games
SELECT c.id, r.text, CASE WHEN c.hasContentWarning = 1 THEN 'Yes' ELSE 'No' END AS hasContentWarning FROM cards c LEFT JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Stephen Daniele';	card_games
SELECT rulings.date, rulings.text  FROM rulings  JOIN cards ON rulings.uuid = cards.uuid  WHERE cards.name = 'Sublime Epiphany' AND cards.number = '74s';	card_games
SELECT c.name, c.artist, c.isPromo  FROM cards c  JOIN rulings r ON c.uuid = r.uuid  GROUP BY c.uuid  ORDER BY COUNT(r.id) DESC  LIMIT 1;	card_games
SELECT DISTINCT fd.language  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE c.name = 'Annul' AND c.number = '29';	card_games
SELECT DISTINCT c.name  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE fd.language = 'Japanese';	card_games
SELECT (COUNT(DISTINCT f.uuid) * 100.0) / (SELECT COUNT(*) FROM cards) AS percentage FROM foreign_data f WHERE f.language = 'Chinese Simplified';	card_games
SELECT s.code, st.translation AS italianName, s.totalSetSize  FROM set_translations st  JOIN sets s ON st.setCode = s.code  WHERE st.language = 'Italian'  ORDER BY s.code;	card_games
SELECT COUNT(DISTINCT type) FROM cards WHERE artist = 'Aaron Boyd';	card_games
SELECT keywords FROM cards WHERE name = 'Angel of Mercy';	card_games
SELECT COUNT(*) FROM cards WHERE power = '*';	card_games
SELECT `promoTypes` FROM `cards` WHERE `name` = 'Duress';	card_games
SELECT borderColor FROM cards WHERE name = 'Ancestor''s Chosen';	card_games
SELECT originalType FROM cards WHERE name = 'Ancestor''s Chosen';	card_games
SELECT DISTINCT st.language FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE c.name = 'Angel of Mercy';	card_games
SELECT COUNT(DISTINCT c.id) FROM cards c INNER JOIN legalities l ON c.uuid = l.uuid WHERE l.status = 'restricted' AND c.isTextless = 0;	card_games
SELECT rulings.text FROM rulings JOIN cards ON rulings.uuid = cards.uuid WHERE cards.name = 'Condemn';	card_games
SELECT COUNT(DISTINCT c.uuid)  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE l.status = 'restricted' AND c.isStarter = 1;	card_games
SELECT legalities.status FROM legalities JOIN cards ON legalities.uuid = cards.uuid WHERE cards.name = 'Cloudchaser Eagle';	card_games
SELECT type FROM cards WHERE name = 'Benalish Knight';	card_games
SELECT l.format, l.status FROM legalities l JOIN cards c ON l.uuid = c.uuid WHERE c.name = 'Benalish Knight';	card_games
SELECT DISTINCT c.artist  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE fd.language = 'Phyrexian';	card_games
SELECT (SUM(CASE WHEN borderColor = 'borderless' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) FROM cards;	card_games
SELECT COUNT(DISTINCT c.uuid)  FROM cards c  JOIN foreign_data f ON c.uuid = f.uuid  WHERE f.language = 'German' AND c.isReprint = 1;	card_games
SELECT COUNT(DISTINCT c.uuid)  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE c.borderColor = 'borderless'  AND fd.language = 'Russian';	card_games
SELECT (COUNT(DISTINCT c.uuid) * 100.0 / (SELECT COUNT(*) FROM cards WHERE isStorySpotlight = 1)) AS percentage  FROM cards c  JOIN foreign_data f ON c.uuid = f.uuid  WHERE c.isStorySpotlight = 1 AND f.language = 'French';	card_games
SELECT COUNT(*) FROM cards WHERE toughness = '99';	card_games
SELECT name FROM cards WHERE artist = 'Aaron Boyd';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND availability = 'mtgo';	card_games
SELECT id FROM cards WHERE convertedManaCost = 0;	card_games
SELECT DISTINCT layout FROM cards WHERE keywords LIKE '%flying%';	card_games
SELECT COUNT(*)  FROM cards  WHERE originalType = 'Summon - Angel'    AND (',' || COALESCE(subtypes, '') || ',' NOT LIKE '%,Angel,%');	card_games
SELECT id  FROM cards  WHERE hasFoil = 1    AND cardKingdomFoilId IS NOT NULL    AND cardKingdomId IS NOT NULL;	card_games
SELECT id FROM cards WHERE duelDeck = 'a';	card_games
SELECT edhrecRank FROM cards WHERE frameVersion = '2015';	card_games
SELECT DISTINCT c.artist  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE fd.language = 'Chinese Simplified';	card_games
SELECT DISTINCT c.* FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.availability = 'paper' AND fd.language = 'Japanese';	card_games
SELECT COUNT(DISTINCT c.uuid)  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE l.status = 'Banned' AND c.borderColor = 'white';	card_games
SELECT l.uuid, fd.language  FROM legalities l  JOIN foreign_data fd ON l.uuid = fd.uuid  WHERE l.format = 'legacy';	card_games
SELECT rulings.text FROM rulings JOIN cards ON rulings.uuid = cards.uuid WHERE cards.name = 'Beacon of Immortality';	card_games
SELECT COUNT(DISTINCT c.uuid) AS card_count, l.status  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE c.frameVersion = 'future' AND l.status = 'Legal';	card_games
SELECT c.name, c.colors FROM cards c WHERE c.setCode = 'OGW';	card_games
SELECT DISTINCT c.name, fd.language  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE c.setCode = '10E' AND c.convertedManaCost = 5;	card_games
SELECT c.name, r.date  FROM cards c  LEFT JOIN rulings r ON c.uuid = r.uuid  WHERE c.originalType = 'Creature - Elf';	card_games
SELECT c.colors, l.format FROM cards c LEFT JOIN legalities l ON c.uuid = l.uuid WHERE c.id BETWEEN 1 AND 20;	card_games
SELECT DISTINCT cards.*  FROM cards  INNER JOIN foreign_data ON cards.uuid = foreign_data.uuid  WHERE cards.originalType = 'Artifact'    AND cards.colors = 'B';	card_games
SELECT c.name  FROM cards c  JOIN rulings r ON c.uuid = r.uuid  WHERE c.rarity = 'uncommon'  GROUP BY c.uuid  ORDER BY MIN(r.date) ASC  LIMIT 3;	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'John Avon' AND "cardKingdomFoilId" IS NULL;	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'UDON' AND availability = 'mtgo' AND hand = '-1';	card_games
SELECT COUNT(*) FROM cards WHERE frameVersion = '1993' AND availability = 'paper' AND hasContentWarning = 1;	card_games
SELECT manaCost FROM cards WHERE layout = 'normal' AND frameVersion = '2003' AND borderColor = 'black' AND availability = 'mtgo,paper';	card_games
SELECT SUM(LENGTH(manaCost) - LENGTH(REPLACE(manaCost, '{', ''))) FROM cards WHERE artist = 'Rob Alexander';	card_games
SELECT DISTINCT TRIM(value) AS type FROM cards, json_each('["' || REPLACE(COALESCE(subtypes, '') || ',' || COALESCE(supertypes, ''), ',', '","') || '"]') WHERE availability = 'arena' AND type != '' ORDER BY type;	card_games
SELECT DISTINCT c.setCode  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE fd.language = 'Spanish';	card_games
SELECT (AVG(CASE WHEN isOnlineOnly = 1 THEN 1.0 ELSE 0.0 END) * 100) AS percentage FROM cards WHERE frameEffects = 'legendary';	card_games
SELECT      (SUM(CASE WHEN isStorySpotlight = 1 AND isTextless = 1 THEN 1 ELSE 0 END) * 100.0) / (SELECT COUNT(*) FROM cards WHERE isStorySpotlight = 1) AS percentage FROM cards;  SELECT id FROM cards WHERE isStorySpotlight = 1 AND isTextless = 1;	card_games
SELECT      fd.name,     (COUNT(DISTINCT fd.uuid) * 100.0 / (SELECT COUNT(*) FROM cards)) AS percentage  FROM foreign_data fd  WHERE fd.language = 'Spanish'  GROUP BY fd.name;	card_games
SELECT DISTINCT st.language  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE s.baseSetSize = 309;	card_games
SELECT COUNT(*) FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE s.block = 'Commander' AND st.language = 'Portuguese (Brasil)';	card_games
SELECT DISTINCT c.id  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE c.types LIKE '%Creature%' AND l.status = 'Legal';	card_games
SELECT DISTINCT TRIM(subtypes) AS type FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'German' AND cards.subtypes IS NOT NULL AND cards.supertypes IS NOT NULL UNION SELECT DISTINCT TRIM(supertypes) AS type FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'German' AND cards.subtypes IS NOT NULL AND cards.supertypes IS NOT NULL;	card_games
SELECT COUNT(*)  FROM cards  WHERE (power IS NULL OR power = '*')  AND text LIKE '%triggered ability%';	card_games
SELECT COUNT(DISTINCT c.uuid) FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN rulings r ON c.uuid = r.uuid WHERE l.format = 'premodern'   AND r.text = 'This is a triggered mana ability.'   AND c.side IS NULL;	card_games
SELECT DISTINCT c.id  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE c.artist = 'Erica Yang'    AND c.availability = 'paper'    AND l.format = 'pauper'    AND l.status = 'Legal';	card_games
SELECT c.artist FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.text = 'Das perfekte Gegenmittel zu einer dichten Formation' AND fd.language = 'German';	card_games
SELECT fd.name  FROM cards c  INNER JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE c.type = 'Creature'  AND c.layout = 'normal'  AND c.borderColor = 'black'  AND c.artist = 'Matthew D. Wilson'  AND fd.language = 'French';	card_games
SELECT COUNT(DISTINCT c.uuid)  FROM cards c  JOIN rulings r ON c.uuid = r.uuid  WHERE c.rarity = 'rare' AND r.date = '2007-02-01';	card_games
SELECT DISTINCT st.language  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE s.block = 'Ravnica' AND s.baseSetSize = 180;	card_games
SELECT (SUM(CASE WHEN c.hasContentWarning = 0 THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS percentage FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.format = 'commander' AND l.status = 'Legal';	card_games
SELECT      (SELECT COUNT(DISTINCT c.uuid) FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE (c.power IS NULL OR c.power = '*') AND f.language = 'French') * 100.0 /      (SELECT COUNT(*) FROM cards WHERE power IS NULL OR power = '*') AS percentage;	card_games
SELECT      (SUM(CASE WHEN s.type = 'expansion' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS percentage  FROM      set_translations AS st  JOIN      sets AS s ON st.setCode = s.code  WHERE      st.language = 'Japanese';	card_games
SELECT DISTINCT availability FROM cards WHERE artist = 'Daren Bader';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'borderless' AND edhrecRank > 12000 AND colors IS NOT NULL AND colors != '';	card_games
SELECT COUNT(*) FROM cards WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1;	card_games
SELECT name  FROM cards  WHERE (power IS NULL OR power = '*')  AND promoTypes = 'arenaleague'  ORDER BY name  LIMIT 3;	card_games
SELECT fd.language FROM foreign_data fd WHERE fd.multiverseid = 149934;	card_games
SELECT cardKingdomFoilId, cardKingdomId FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL ORDER BY cardKingdomFoilId LIMIT 3;	card_games
SELECT      (COUNT(CASE WHEN layout = 'normal' THEN 1 END) * 100.0) / COUNT(*) AS proportion FROM cards WHERE isTextless = 1;	card_games
SELECT number FROM cards WHERE side IS NULL AND subtypes LIKE '%Angel%' AND subtypes LIKE '%Wizard%';	card_games
SELECT name  FROM sets  WHERE mtgoCode IS NULL OR mtgoCode = ''  ORDER BY name  LIMIT 3;	card_games
SELECT DISTINCT st.language  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE s.code = 'ARC' AND s.mcmName = 'Archenemy';	card_games
SELECT sets.name, set_translations.translation FROM sets LEFT JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.id = 5;	card_games
SELECT st.language, s.type FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.id = 206;	card_games
SELECT set_id, card_count FROM (     SELECT s.code AS set_id, COUNT(*) AS card_count     FROM sets s     JOIN cards c ON s.code = c.setCode     JOIN foreign_data fd ON c.uuid = fd.uuid     WHERE s.block = 'Shadowmoor' AND fd.language = 'Italian'     GROUP BY s.code     ORDER BY card_count DESC     LIMIT 2 ) AS top_sets ORDER BY set_id ASC;	card_games
SELECT sets.code  FROM sets  JOIN cards ON sets.code = cards.setCode  JOIN foreign_data ON cards.uuid = foreign_data.uuid  WHERE sets.isForeignOnly = 0    AND sets.isFoilOnly = 1    AND foreign_data.language = 'Japanese'  GROUP BY sets.code  LIMIT 1;	card_games
SELECT s.code FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Russian' ORDER BY s.baseSetSize DESC LIMIT 1;	card_games
SELECT (COUNT(CASE WHEN c.isOnlineOnly = 1 THEN 1 END) * 100.0) / COUNT(*) AS percentage FROM (SELECT DISTINCT uuid FROM foreign_data WHERE language = 'Chinese Simplified') AS chinese_cards JOIN cards c ON chinese_cards.uuid = c.uuid;	card_games
SELECT COUNT(*)  FROM sets s  WHERE (s.mtgoCode IS NULL OR s.mtgoCode = '')  AND s.code IN (     SELECT st.setCode      FROM set_translations st      GROUP BY st.setCode      HAVING COUNT(*) = SUM(CASE WHEN st.language = 'Japanese' THEN 1 ELSE 0 END)      AND COUNT(*) > 0 );	card_games
SELECT id FROM cards WHERE borderColor = 'black';	card_games
SELECT COUNT(*) FROM cards WHERE frameEffects = 'extendedart'; SELECT id FROM cards WHERE frameEffects = 'extendedart';	card_games
SELECT name FROM cards WHERE borderColor = 'black' AND isFullArt = 1;	card_games
SELECT st.language FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE s.id = 174;	card_games
SELECT name FROM sets WHERE code = 'ALL';	card_games
SELECT fd.language FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE c.name = 'A Pedra Fellwar';	card_games
SELECT code FROM sets WHERE releaseDate = '2007-07-13';	card_games
SELECT `baseSetSize`, `code` FROM `sets` WHERE `block` IN ('Masques', 'Mirage');	card_games
SELECT code FROM sets WHERE type = 'expansion';	card_games
SELECT fd.name AS foreign_name, c.type FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.watermark = 'Boros';	card_games
SELECT fd.language, fd.flavorText, c.type FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.watermark = 'colorpie';	card_games
SELECT      (COUNT(CASE WHEN c.convertedManaCost = 10 THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Abyssal Horror';	card_games
SELECT code FROM sets WHERE type IN ('expansion', 'commander');	card_games
SELECT fd.name AS foreign_name, c.type  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE c.watermark = 'Abzan';	card_games
SELECT fd.language, c.type  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE c.watermark = 'Azorius';	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE availability LIKE '%paper%' AND hand = '3';	card_games
SELECT name FROM cards WHERE isTextless = 0;	card_games
SELECT manaCost FROM cards WHERE name = 'Ancestor`s Chosen';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND (power = '*' OR power IS NULL);	card_games
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL;	card_games
SELECT subtypes, supertypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer';	card_games
SELECT `purchaseUrls` FROM `cards` WHERE `promoTypes` = 'bundle';	card_games
SELECT COUNT(DISTINCT artist) FROM cards WHERE borderColor = 'black' AND availability LIKE '%arena%' AND availability LIKE '%mtgo%' AND artist IS NOT NULL;	card_games
SELECT c1.name  FROM cards c1  WHERE c1.name IN ('Serra Angel', 'Shrine Keeper')  ORDER BY c1.convertedManaCost DESC  LIMIT 1;	card_games
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer';	card_games
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3;	card_games
SELECT st.translation  FROM set_translations st  WHERE st.language = 'Italian'  AND st.setCode = (SELECT c.setCode FROM cards c WHERE c.name = 'Ancestor''s Chosen');	card_games
SELECT COUNT(*) FROM set_translations WHERE setCode IN (SELECT setCode FROM cards WHERE name = 'Angel of Mercy');	card_games
SELECT cards.name  FROM cards  JOIN set_translations ON cards.setCode = set_translations.setCode  WHERE set_translations.translation = 'Hauptset Zehnte Edition' AND set_translations.language = 'German';	card_games
SELECT EXISTS (     SELECT 1      FROM cards      JOIN foreign_data ON cards.uuid = foreign_data.uuid      WHERE cards.name = 'Ancestor''s Chosen'      AND foreign_data.language = 'Korean' );	card_games
SELECT COUNT(*)  FROM cards  INNER JOIN set_translations ON cards.setCode = set_translations.setCode  WHERE set_translations.translation = 'Hauptset Zehnte Edition'  AND cards.artist = 'Adam Rex';	card_games
SELECT s.baseSetSize  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE st.translation = 'Hauptset Zehnte Edition';	card_games
SELECT set_translations.translation FROM set_translations JOIN sets ON set_translations.setCode = sets.code WHERE sets.name = 'Eighth Edition' AND set_translations.language = 'Chinese Simplified';	card_games
SELECT CASE WHEN EXISTS (     SELECT 1      FROM cards c      JOIN sets s ON c.setCode = s.code      WHERE c.name = 'Angel of Mercy'      AND s.mtgoCode IS NOT NULL ) THEN 'Yes' ELSE 'No' END AS result;	card_games
SELECT s.releaseDate FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.name = 'Ancestor''s Chosen';	card_games
SELECT s.type FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition';	card_games
SELECT COUNT(DISTINCT s.code) FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.block = 'Ice Age' AND st.language = 'Italian' AND st.translation IS NOT NULL;	card_games
SELECT EXISTS (     SELECT 1      FROM sets      JOIN cards ON sets.code = cards.setCode      WHERE cards.name = 'Adarkar Valkyrie'      AND sets.isForeignOnly = 1 );	card_games
SELECT COUNT(*)  FROM sets  INNER JOIN set_translations ON sets.code = set_translations.setCode  WHERE set_translations.language = 'Italian'    AND set_translations.translation IS NOT NULL    AND sets.baseSetSize < 10;	card_games
SELECT COUNT(*) FROM cards JOIN sets ON cards.setCode = sets.code WHERE sets.name = 'Coldsnap' AND cards.borderColor = 'black';	card_games
SELECT c.name  FROM cards c  JOIN sets s ON c.setCode = s.code  WHERE s.name = 'Coldsnap'  AND c.convertedManaCost = (     SELECT MAX(c2.convertedManaCost)      FROM cards c2      JOIN sets s2 ON c2.setCode = s2.code      WHERE s2.name = 'Coldsnap' );	card_games
SELECT DISTINCT c.artist  FROM cards c  JOIN sets s ON c.setCode = s.code  WHERE s.name = 'Coldsnap'  AND c.artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy');	card_games
SELECT c.* FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap' AND c.number = '4';	card_games
SELECT COUNT(*)  FROM cards  INNER JOIN sets ON cards.setCode = sets.code  WHERE sets.name = 'Coldsnap'  AND cards.convertedManaCost > 5  AND (cards.power = '*' OR cards.power IS NULL);	card_games
SELECT fd.flavorText  FROM foreign_data fd  JOIN cards c ON fd.uuid = c.uuid  WHERE c.name = 'Ancestor''s Chosen' AND fd.language = 'Italian';	card_games
SELECT DISTINCT fd.language  FROM foreign_data fd  JOIN cards c ON fd.uuid = c.uuid  WHERE c.name = 'Ancestor''s Chosen' AND fd.flavorText IS NOT NULL;	card_games
SELECT fd.type FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.name = 'Ancestor''s Chosen' AND fd.language = 'German';	card_games
SELECT rulings.text  FROM sets  JOIN cards ON sets.code = cards.setCode  JOIN foreign_data ON cards.uuid = foreign_data.uuid  JOIN rulings ON cards.uuid = rulings.uuid  WHERE sets.name = 'Coldsnap' AND foreign_data.language = 'Italian';	card_games
SELECT fd.name  FROM cards c  JOIN sets s ON c.setCode = s.code  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE s.name = 'Coldsnap'  AND fd.language = 'Italian'  AND c.convertedManaCost = (SELECT MAX(convertedManaCost) FROM cards c2 JOIN sets s2 ON c2.setCode = s2.code WHERE s2.name = 'Coldsnap');	card_games
SELECT rulings.date FROM rulings JOIN cards ON rulings.uuid = cards.uuid WHERE cards.name = 'Reminisce';	card_games
SELECT (100.0 * SUM(CASE WHEN c.convertedManaCost = 7 THEN 1 ELSE 0 END)) / SUM(c.convertedManaCost) AS percentage FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap';	card_games
SELECT (COUNT(CASE WHEN c.cardKingdomFoilId IS NOT NULL AND c.cardKingdomId IS NOT NULL THEN 1 END) * 100.0) / COUNT(*) AS percentage FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap';	card_games
SELECT code FROM sets WHERE releaseDate = '2017-07-14';	card_games
SELECT keyruneCode FROM sets WHERE code = 'PKHC';	card_games
SELECT mcmId FROM sets WHERE code = 'SS2';	card_games
SELECT mcmName FROM sets WHERE releaseDate = '2017-06-09';	card_games
SELECT type FROM sets WHERE name = 'From the Vault: Lore';	card_games
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized';	card_games
SELECT c.name, r.text, CASE WHEN c.hasContentWarning = 1 THEN 'Yes' ELSE 'No' END AS HasMissingOrDegradedProperties FROM cards c LEFT JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Jim Pavelec';	card_games
SELECT s.releaseDate FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.name = 'Evacuation';	card_games
SELECT s."baseSetSize" FROM sets s JOIN set_translations st ON s."code" = st."setCode" WHERE st."translation" = 'Rinascita di Alara';	card_games
SELECT s.type FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Huitième édition' AND st.language = 'French';	card_games
SELECT st.translation  FROM set_translations st  JOIN cards c ON st.setCode = c.setCode  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE fd.name = 'Tendo Ice Bridge' AND st.language = 'French';	card_games
SELECT COUNT(*) FROM set_translations WHERE setCode = (SELECT code FROM sets WHERE name = 'Tenth Edition') AND translation IS NOT NULL;	card_games
SELECT set_translations.translation FROM cards JOIN set_translations ON cards.setCode = set_translations.setCode WHERE cards.name = 'Fellwar Stone' AND set_translations.language = 'Japanese';	card_games
SELECT c.name FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Journey into Nyx Hero''s Path' ORDER BY c.convertedManaCost DESC LIMIT 1;	card_games
SELECT s."releaseDate" FROM sets s JOIN set_translations st ON s."code" = st."setCode" WHERE st."translation" = 'Ola de frío';	card_games
SELECT s.type FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.name = 'Samite Pilgrim';	card_games
SELECT COUNT(*) FROM cards JOIN sets ON cards.setCode = sets.code WHERE sets.name = 'World Championship Decks 2004' AND cards.convertedManaCost = 3;	card_games
SELECT set_translations.translation FROM set_translations JOIN sets ON set_translations.setCode = sets.code WHERE sets.name = 'Mirrodin' AND set_translations.language = 'Chinese Simplified';	card_games
SELECT AVG(s.isNonFoilOnly) * 100 AS percentage  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE st.language = 'Japanese';	card_games
SELECT    (SUM(CASE WHEN c.isOnlineOnly = 1 THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS percentage  FROM    cards c  WHERE    c.setCode IN (     SELECT        st.setCode      FROM        set_translations st      WHERE        st.language = 'Portuguese (Brazil)'   );	card_games
SELECT DISTINCT availability FROM cards WHERE artist = 'Aleksi Briclot' AND isTextless = 1;	card_games
SELECT id FROM sets WHERE baseSetSize = (SELECT MAX(baseSetSize) FROM sets);	card_games
SELECT c.artist  FROM cards c  WHERE c.side IS NULL  AND c.convertedManaCost = (     SELECT MAX(convertedManaCost)      FROM cards      WHERE side IS NULL )  LIMIT 1;	card_games
SELECT frameEffects FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL AND frameEffects IS NOT NULL GROUP BY frameEffects ORDER BY COUNT(*) DESC LIMIT 1;	card_games
SELECT COUNT(*) FROM cards WHERE (power IS NULL OR power = '*') AND hasFoil = 0 AND duelDeck = 'a';	card_games
SELECT id FROM sets WHERE type = 'commander' ORDER BY totalSetSize DESC LIMIT 1;	card_games
SELECT c.name, c.convertedManaCost  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE l.format = 'duel' AND l.status = 'Legal'  ORDER BY c.convertedManaCost DESC  LIMIT 10;	card_games
SELECT c.originalReleaseDate, l.format  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE c.rarity = 'mythic'  AND c.originalReleaseDate = (SELECT MIN(originalReleaseDate) FROM cards WHERE rarity = 'mythic')  AND l.status = 'Legal';	card_games
SELECT COUNT(DISTINCT cards.uuid)  FROM cards  JOIN foreign_data ON cards.uuid = foreign_data.uuid  WHERE cards.artist = 'Volkan Baǵa' AND foreign_data.language = 'French';	card_games
SELECT COUNT(*) FROM cards c WHERE c.name = 'Abundance'   AND c.types LIKE '%Enchantment%'   AND c.rarity = 'rare'   AND NOT EXISTS (     SELECT 1     FROM legalities l     WHERE l.uuid = c.uuid       AND l.status != 'Legal'   );	card_games
WITH banned_counts AS (     SELECT format, COUNT(*) AS cnt     FROM legalities     WHERE status = 'Banned'     GROUP BY format ), max_count AS (     SELECT MAX(cnt) AS max_cnt FROM banned_counts ) SELECT l.format, c.name FROM legalities l JOIN cards c ON l.uuid = c.uuid WHERE l.status = 'Banned' AND l.format IN (     SELECT format FROM banned_counts WHERE cnt = (SELECT max_cnt FROM max_count) );	card_games
SELECT st.language FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE s.name = 'Battlebond';	card_games
SELECT DISTINCT      c.artist,      l.format  FROM      cards c  JOIN      legalities l ON c.uuid = l.uuid  WHERE      c.artist = (         SELECT              artist          FROM              cards          GROUP BY              artist          ORDER BY              COUNT(*) ASC          LIMIT 1     );	card_games
SELECT l.status  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE c.frameVersion = '1997'  AND c.artist = 'D. Alexander Gregory'  AND c.hasContentWarning = 1  AND l.format = 'legacy';	card_games
SELECT c.name, l.format FROM cards c LEFT JOIN legalities l ON c.uuid = l.uuid AND l.status = 'Banned' WHERE c.edhrecRank = 1;	card_games
SELECT    (SELECT AVG(yearly_count) FROM (SELECT COUNT(*) AS yearly_count FROM sets WHERE releaseDate BETWEEN '2012-01-01' AND '2015-12-31' GROUP BY strftime('%Y', releaseDate))) AS annual_average,   (SELECT language FROM (SELECT fd.language, COUNT(*) AS cnt FROM sets s JOIN cards c ON s.code = c.setCode JOIN foreign_data fd ON c.uuid = fd.uuid WHERE s.releaseDate BETWEEN '2012-01-01' AND '2015-12-31' GROUP BY fd.language ORDER BY cnt DESC LIMIT 1)) AS common_language;	card_games
SELECT DISTINCT c.artist  FROM cards c  WHERE c.borderColor = 'black'    AND c.availability = 'arena';	card_games
SELECT DISTINCT l.uuid  FROM legalities l  WHERE l.format = 'oldschool'  AND l.status IN ('banned', 'restricted');	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability = 'paper';	card_games
SELECT r.text, r.date  FROM cards c  JOIN rulings r ON c.uuid = r.uuid  WHERE c.artist = 'Kev Walker'  ORDER BY r.date DESC;	card_games
SELECT c.name, l.format  FROM cards c  JOIN sets s ON c.setCode = s.code  JOIN legalities l ON c.uuid = l.uuid  WHERE s.name = 'Hour of Devastation' AND l.status = 'Legal';	card_games
SELECT s.name  FROM sets s  WHERE EXISTS (     SELECT 1      FROM set_translations st      WHERE st.setCode = s.code      AND st.language = 'Korean' )  AND NOT EXISTS (     SELECT 1      FROM set_translations st      WHERE st.setCode = s.code      AND st.language = 'Japanese' );	card_games
SELECT c.frameVersion, c.name,         CASE WHEN EXISTS (SELECT 1 FROM legalities l WHERE l.uuid = c.uuid AND l.status = 'Banned') THEN 'Banned' ELSE 'Legal' END AS status  FROM cards c  WHERE c.artist = 'Allen Williams';	card_games
SELECT u1.DisplayName, u1.Reputation  FROM users u1  WHERE u1.DisplayName = 'Harlan'  UNION  SELECT u2.DisplayName, u2.Reputation  FROM users u2  WHERE u2.DisplayName = 'Jarrod Dixon'  ORDER BY Reputation DESC  LIMIT 1;	codebase_community
SELECT `DisplayName` FROM `users` WHERE YEAR(`CreationDate`) = 2011;	codebase_community
SELECT COUNT(*) FROM users WHERE LastAccessDate > '2014-09-01';	codebase_community
SELECT `DisplayName` FROM `users` ORDER BY `Views` DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM users WHERE UpVotes > 100 AND DownVotes > 1;	codebase_community
SELECT COUNT(Id) FROM users WHERE Views > 10 AND strftime('%Y', CreationDate) > '2013';	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie');	codebase_community
SELECT p.Title  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT u.DisplayName  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE p.Title = 'Eliciting priors from experts';	codebase_community
SELECT p.Title  FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' ORDER BY p.ViewCount DESC LIMIT 1;	codebase_community
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts) LIMIT 1;	codebase_community
SELECT SUM(p.CommentCount) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT MAX(p.AnswerCount)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT u.DisplayName  FROM posts p  JOIN users u ON p.LastEditorUserId = u.Id  WHERE p.Title = 'Examples for teaching: Correlation does not mean causation';	codebase_community
SELECT COUNT(*)  FROM posts  JOIN users ON posts.OwnerUserId = users.Id  WHERE users.DisplayName = 'csgillespie'    AND posts.ParentId IS NULL;	codebase_community
SELECT DISTINCT u.DisplayName  FROM users u  JOIN posts p ON u.Id = p.OwnerUserId  WHERE p.ClosedDate IS NOT NULL;	codebase_community
SELECT COUNT(*) FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE users.Age > 65 AND posts.Score >= 20;	codebase_community
SELECT u.Location FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Eliciting priors from experts';	codebase_community
SELECT posts.Body FROM tags INNER JOIN posts ON tags.ExcerptPostId = posts.Id WHERE tags.TagName = 'bayesian';	codebase_community
SELECT p.Body  FROM tags t  JOIN posts p ON t.ExcerptPostId = p.Id  WHERE t.Count = (SELECT MAX(Count) FROM tags)  LIMIT 1;	codebase_community
SELECT COUNT(*) FROM badges JOIN users ON badges.UserId = users.Id WHERE users.DisplayName = 'csgillespie';	codebase_community
SELECT badges.Name  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE users.DisplayName = 'csgillespie';	codebase_community
SELECT COUNT(*)  FROM badges  INNER JOIN users ON badges.UserId = users.Id  WHERE users.DisplayName = 'csgillespie' AND YEAR(badges.Date) = 2011;	codebase_community
SELECT u.DisplayName  FROM users u  JOIN (     SELECT UserId, COUNT(Id) AS badge_count      FROM badges      GROUP BY UserId      ORDER BY badge_count DESC      LIMIT 1 ) AS top_user ON u.Id = top_user.UserId;	codebase_community
SELECT AVG(posts.Score) FROM users JOIN posts ON users.Id = posts.OwnerUserId WHERE users.DisplayName = 'csgillespie';	codebase_community
SELECT AVG(badge_count) FROM (SELECT u.Id, COUNT(b.Id) AS badge_count FROM users u LEFT JOIN badges b ON u.Id = b.UserId WHERE u.Views > 200 GROUP BY u.Id);	codebase_community
SELECT      (COUNT(CASE WHEN u.Age > 65 THEN p.Id END) * 100.0) / COUNT(p.Id) AS Percentage  FROM      posts p  INNER JOIN      users u ON p.OwnerUserId = u.Id  WHERE      p.Score > 5;	codebase_community
SELECT COUNT(*) FROM votes JOIN posts ON votes.PostId = posts.Id WHERE posts.OwnerUserId = 58 AND votes.CreationDate = '2010-07-19';	codebase_community
SELECT CreationDate FROM votes GROUP BY CreationDate HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM votes GROUP BY CreationDate));	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = 'Revival';	codebase_community
SELECT p.Title FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.Score = (SELECT MAX(Score) FROM comments);	codebase_community
SELECT COUNT(c.Id)  FROM posts p LEFT JOIN comments c ON p.Id = c.PostId WHERE p.ViewCount = 1910;	codebase_community
SELECT posts.FavoriteCount FROM comments JOIN posts ON comments.PostId = posts.Id WHERE comments.UserId = 3025 AND comments.CreationDate = '2014-04-23 20:29:39.0';	codebase_community
SELECT c.Text  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE p.ParentId = 107829 AND p.CommentCount = 1;	codebase_community
SELECT p.ClosedDate IS NOT NULL  FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.UserId = 23853 AND c.CreationDate = '2013-07-12 09:08:18.0';	codebase_community
SELECT u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Id = 65041;	codebase_community
SELECT COUNT(p.Id) FROM users u LEFT JOIN posts p ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'Tiago Pasqualini';	codebase_community
SELECT u.DisplayName FROM users u JOIN votes v ON u.Id = v.UserId WHERE v.Id = 6347;	codebase_community
SELECT COUNT(*) AS VoteCount  FROM votes  JOIN posts ON votes.PostId = posts.Id  WHERE posts.Title LIKE '%data visualization%';	codebase_community
SELECT badges.Name FROM badges INNER JOIN users ON badges.UserId = users.Id WHERE users.DisplayName = 'DatEpicCoderGuyWhoPrograms';	codebase_community
SELECT      (SELECT COUNT(*) FROM posts WHERE OwnerUserId = 24) * 1.0 /      (SELECT COUNT(*) FROM votes WHERE UserId = 24) AS post_vote_ratio;	codebase_community
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer';	codebase_community
SELECT Text FROM comments WHERE Score = 17;	codebase_community
SELECT `DisplayName` FROM `users` WHERE `WebsiteUrl` = 'http://stackoverflow.com';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'SilentGhost';	codebase_community
SELECT u.DisplayName  FROM comments c  JOIN users u ON c.UserId = u.Id  WHERE c.Text = 'thank you user93!';	codebase_community
SELECT comments.Text  FROM comments  JOIN users ON comments.UserId = users.Id  WHERE users.DisplayName = 'A Lion';	codebase_community
SELECT u.DisplayName, u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Title = 'Understanding what Dassault iSight is doing?';	codebase_community
SELECT c.Text  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE p.Title = 'How does gentle boosting differ from AdaBoost?';	codebase_community
SELECT users.DisplayName FROM users JOIN badges ON users.Id = badges.UserId WHERE badges.Name = 'Necromancer' GROUP BY users.Id LIMIT 10;	codebase_community
SELECT p.LastEditorDisplayName FROM posts p WHERE p.Title = 'Open source tools for visualizing multi-dimensional data';	codebase_community
SELECT p.Title  FROM posts p  JOIN users u ON p.LastEditorUserId = u.Id  WHERE u.DisplayName = 'Vebjorn Ljosa';	codebase_community
SELECT SUM(p.Score) AS TotalScore, u.WebsiteUrl  FROM posts p  JOIN users u ON p.LastEditorUserId = u.Id  WHERE u.DisplayName = 'Yevgeny'  GROUP BY u.WebsiteUrl;	codebase_community
SELECT c.*  FROM comments c  WHERE c.UserId IN (     SELECT DISTINCT ph.UserId      FROM postHistory ph      JOIN posts p ON ph.PostId = p.Id      WHERE p.Title = 'Why square the difference instead of taking the absolute value in standard deviation?'      AND ph.PostHistoryTypeId = 2 );	codebase_community
SELECT SUM(v.BountyAmount) AS TotalBounty FROM posts p JOIN votes v ON p.Id = v.PostId WHERE p.Title LIKE '%data%';	codebase_community
SELECT u.DisplayName  FROM votes v  JOIN posts p ON v.PostId = p.Id  JOIN users u ON v.UserId = u.Id  WHERE v.BountyAmount = 50  AND p.Title LIKE '%variance%';	codebase_community
WITH humor_posts AS (     SELECT Id, Title, ViewCount     FROM posts     WHERE Tags LIKE '%<humor>%' ), avg_view AS (     SELECT AVG(ViewCount) AS avg_count     FROM humor_posts ) SELECT hp.Title, c.Text AS Comment, av.avg_count AS AverageViewCount FROM humor_posts hp CROSS JOIN avg_view av LEFT JOIN comments c ON hp.Id = c.PostId;	codebase_community
SELECT COUNT(*) FROM comments WHERE UserId = 13;	codebase_community
SELECT Id FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT Id FROM users WHERE Views = (SELECT MIN(Views) FROM users);	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Supporter' AND YEAR(Date) = 2011;	codebase_community
SELECT COUNT(*) FROM (SELECT UserId FROM badges GROUP BY UserId HAVING COUNT(*) > 5) AS sub;	codebase_community
SELECT COUNT(*)  FROM users u  WHERE u.Location = 'New York'  AND EXISTS (SELECT 1 FROM badges b WHERE b.UserId = u.Id AND b.Name = 'Teacher')  AND EXISTS (SELECT 1 FROM badges b WHERE b.UserId = u.Id AND b.Name = 'Supporter');	codebase_community
SELECT u.Id, u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Id = 1;	codebase_community
SELECT u.Id  FROM users u  WHERE u.Views >= 1000  AND NOT EXISTS (     SELECT 1      FROM postHistory ph      WHERE ph.UserId = u.Id      GROUP BY ph.PostId      HAVING COUNT(*) > 1 )	codebase_community
SELECT u.Id, u.DisplayName, b.Name AS BadgeName  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE u.Id IN (     SELECT UserId      FROM comments      GROUP BY UserId      HAVING COUNT(*) = (         SELECT MAX(cnt)          FROM (             SELECT COUNT(*) AS cnt              FROM comments              WHERE UserId IS NOT NULL              GROUP BY UserId         )     ) );	codebase_community
SELECT COUNT(DISTINCT users.Id) FROM users INNER JOIN badges ON users.Id = badges.UserId WHERE users.Location = 'India' AND badges.Name = 'Teacher';	codebase_community
SELECT ((COUNT(CASE WHEN strftime('%Y', Date) = '2010' THEN 1 END) * 100.0) / COUNT(*)) - ((COUNT(CASE WHEN strftime('%Y', Date) = '2011' THEN 1 END) * 100.0) / COUNT(*)) AS percentage_difference FROM badges WHERE Name = 'Student';	codebase_community
SELECT      (SELECT GROUP_CONCAT(DISTINCT PostHistoryTypeId) FROM postHistory WHERE PostId = 3720) AS PostHistoryTypeIDs,     (SELECT COUNT(DISTINCT UserId) FROM comments WHERE PostId = 3720) AS UniqueCommentUsers;	codebase_community
SELECT pl.RelatedPostId, p.ViewCount AS Popularity  FROM postLinks pl  CROSS JOIN (SELECT ViewCount FROM posts WHERE Id = 61217) p  WHERE pl.PostId = 61217 AND pl.LinkTypeId = 1;	codebase_community
SELECT p.Score, pl.LinkTypeId  FROM posts p  JOIN postLinks pl ON p.Id = pl.PostId  WHERE p.Id = 395;	codebase_community
SELECT p.Id AS PostID, p.OwnerUserId AS UserID FROM posts p WHERE p.Score > 60;	codebase_community
SELECT SUM(FavoriteCount) FROM posts WHERE OwnerUserId = 686 AND strftime('%Y', CreaionDate) = '2011';	codebase_community
SELECT AVG(u.UpVotes) AS AverageUpVotes, AVG(u.Age) AS AverageAge FROM users u INNER JOIN (     SELECT OwnerUserId AS UserId     FROM posts     GROUP BY OwnerUserId     HAVING COUNT(Id) > 10 ) p ON u.Id = p.UserId;	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Announcer';	codebase_community
SELECT Name FROM badges WHERE Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT COUNT(*) FROM comments WHERE Score > 60;	codebase_community
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:25:47.0';	codebase_community
SELECT COUNT(Id) FROM posts WHERE Score = 10;	codebase_community
SELECT DISTINCT b.Name  FROM badges b  WHERE b.UserId IN (     SELECT u.Id      FROM users u      WHERE u.Reputation = (SELECT MAX(Reputation) FROM users) );	codebase_community
SELECT u.Reputation  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE b.Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Pierre';	codebase_community
SELECT badges.Date  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE users.Location = 'Rochester, NY';	codebase_community
SELECT (COUNT(DISTINCT badges.UserId) * 100.0 / (SELECT COUNT(*) FROM users)) AS Percentage FROM badges WHERE badges.Name = 'Teacher';	codebase_community
SELECT      (COUNT(CASE WHEN u.Age BETWEEN 13 AND 18 THEN 1 END) * 100.0) / COUNT(*) AS Percentage FROM (     SELECT DISTINCT UserId     FROM badges     WHERE Name = 'Organizer' ) b JOIN users u ON b.UserId = u.Id;	codebase_community
SELECT c.Score FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.CreaionDate = '2010-07-19 19:19:56.0';	codebase_community
SELECT comments.Text FROM comments JOIN posts ON comments.PostId = posts.Id WHERE posts.CreaionDate = '2010-07-19 19:37:33.0';	codebase_community
SELECT users.Age  FROM users  INNER JOIN badges ON users.Id = badges.UserId  WHERE users.Location = 'Vienna, Austria';	codebase_community
SELECT COUNT(DISTINCT b.UserId)  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE b.Name = 'Supporter' AND u.Age BETWEEN 19 AND 65;	codebase_community
SELECT SUM(u.Views)  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE b.Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT DISTINCT b.Name FROM badges b WHERE b.UserId IN (SELECT u.Id FROM users u WHERE u.Reputation = (SELECT MIN(Reputation) FROM users));	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Sharpie';	codebase_community
SELECT COUNT(DISTINCT b.UserId)  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE b.Name = 'Supporter' AND u.Age > 65;	codebase_community
SELECT `DisplayName` FROM `users` WHERE `Id` = 30;	codebase_community
SELECT COUNT(*) FROM users WHERE Location = 'New York';	codebase_community
SELECT COUNT(*) FROM votes WHERE strftime('%Y', CreationDate) = '2010';	codebase_community
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT DisplayName, Views  FROM users  WHERE Views = (SELECT MAX(Views) FROM users);	codebase_community
SELECT      (SUM(CASE WHEN YEAR(CreationDate) = 2010 THEN 1 ELSE 0 END) * 1.0) / NULLIF(SUM(CASE WHEN YEAR(CreationDate) = 2011 THEN 1 ELSE 0 END), 0) AS VoteRatio  FROM votes;	codebase_community
SELECT DISTINCT t.TagName  FROM users u JOIN posts p ON u.Id = p.OwnerUserId JOIN tags t ON p.Tags LIKE '%<' || t.TagName || '>%' WHERE u.DisplayName = 'John Salvatier';	codebase_community
SELECT COUNT(*)  FROM posts  INNER JOIN users ON posts.OwnerUserId = users.Id  WHERE users.DisplayName = 'Daniel Vassallo';	codebase_community
SELECT COUNT(*)  FROM votes  JOIN users ON votes.UserId = users.Id  WHERE users.DisplayName = 'Harlan';	codebase_community
SELECT posts.Id  FROM posts  JOIN users ON posts.OwnerUserId = users.Id  WHERE users.DisplayName = 'slashnick'  ORDER BY posts.AnswerCount DESC  LIMIT 1;	codebase_community
SELECT u.DisplayName  FROM users u  JOIN posts p ON u.Id = p.OwnerUserId  WHERE u.DisplayName IN ('Harvey Motulsky', 'Noah Snyder')  GROUP BY u.DisplayName  ORDER BY SUM(p.ViewCount) DESC  LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM users u  JOIN posts p ON u.Id = p.OwnerUserId  WHERE u.DisplayName = 'Matt Parker' AND p.Id > 4;	codebase_community
SELECT COUNT(*)  FROM users u JOIN posts p ON u.Id = p.OwnerUserId JOIN comments c ON p.Id = c.PostId WHERE u.DisplayName = 'Neil McGuigan'  AND c.Score < 60;	codebase_community
WITH user_posts AS (   SELECT substr(p.Tags, 2, length(p.Tags) - 2) AS TagsStr    FROM posts p   JOIN users u ON p.OwnerUserId = u.Id   WHERE u.DisplayName = 'Mark Meckes' AND p.CommentCount = 0 ), split_tags(tag, rest) AS (   SELECT '', TagsStr FROM user_posts   UNION ALL   SELECT     CASE        WHEN instr(rest, '><') > 0 THEN substr(rest, 1, instr(rest, '><') -1)       ELSE rest     END,     CASE       WHEN instr(rest, '><') > 0 THEN substr(rest, instr(rest, '><') +2)       ELSE ''     END   FROM split_tags   WHERE rest != '' ) SELECT DISTINCT tag  FROM split_tags  WHERE tag != '';	codebase_community
SELECT u.DisplayName  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE b.Name = 'Organizer';	codebase_community
SELECT      (COUNT(CASE WHEN LOWER(Tags) LIKE '%<r>%' THEN 1 END) * 100.0) / COUNT(*) AS percentage  FROM      posts  WHERE      OwnerDisplayName = 'Community';	codebase_community
SELECT      (SELECT COALESCE(SUM(p.ViewCount), 0) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Mornington')      -      (SELECT COALESCE(SUM(p.ViewCount), 0) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Amos')  AS difference;	codebase_community
SELECT COUNT(DISTINCT UserId)  FROM badges  WHERE Name = 'Commentator' AND strftime('%Y', Date) = '2014';	codebase_community
SELECT COUNT(*) FROM posts WHERE CreaionDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59';	codebase_community
SELECT DisplayName, Age FROM users WHERE Views = (SELECT MAX(Views) FROM users);	codebase_community
SELECT `LastEditDate`, `LastEditorUserId` FROM `posts` WHERE `Title` = 'Detecting a given face in a database of facial images';	codebase_community
SELECT COUNT(*) FROM comments WHERE UserId = 13 AND Score < 60;	codebase_community
SELECT p.Title, u.DisplayName  FROM posts p  INNER JOIN comments c ON p.Id = c.PostId  INNER JOIN users u ON c.UserId = u.Id  WHERE c.Score > 60;	codebase_community
SELECT badges.Name  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE users.Location = 'North Pole'  AND strftime('%Y', badges.Date) = '2011';	codebase_community
SELECT u.DisplayName, u.WebsiteUrl  FROM users u  INNER JOIN posts p ON u.Id = p.OwnerUserId  WHERE p.FavoriteCount > 150;	codebase_community
SELECT COUNT(ph.Id) AS PostHistoryCount, MAX(ph.CreationDate) AS LastEditDate  FROM posts p  JOIN postHistory ph ON p.Id = ph.PostId  WHERE p.Title = 'What is the best introductory Bayesian statistics textbook?'  GROUP BY p.Id;	codebase_community
SELECT users.LastAccessDate, users.Location  FROM users  INNER JOIN badges ON users.Id = badges.UserId  WHERE badges.Name = 'Outliers';	codebase_community
SELECT p2.Title  FROM posts p1  JOIN postLinks pl ON p1.Id = pl.PostId  JOIN posts p2 ON pl.RelatedPostId = p2.Id  WHERE p1.Title = 'How to tell if something happened in a data set which monitors a value over time'  AND pl.LinkTypeId = 1;	codebase_community
SELECT p.Id AS PostID, b.Name AS BadgeName FROM users u JOIN posts p ON u.Id = p.OwnerUserId JOIN badges b ON u.Id = b.UserId WHERE u.DisplayName = 'Samuel' AND STRFTIME('%Y', p.CreaionDate) = '2013' AND STRFTIME('%Y', b.Date) = '2013';	codebase_community
SELECT u.DisplayName  FROM users u  JOIN posts p ON u.Id = p.OwnerUserId  WHERE p.ViewCount = (SELECT MAX(ViewCount) FROM posts);	codebase_community
SELECT u.DisplayName, u.Location  FROM tags t  JOIN posts p ON t.ExcerptPostId = p.Id  JOIN users u ON p.OwnerUserId = u.Id  WHERE t.TagName = 'hypothesis-testing';	codebase_community
SELECT p2.Title, pl.LinkTypeId  FROM posts p1  JOIN postLinks pl ON p1.Id = pl.PostId  JOIN posts p2 ON pl.RelatedPostId = p2.Id  WHERE p1.Title = 'What are principal component scores?';	codebase_community
SELECT u.DisplayName  FROM posts AS child  JOIN posts AS parent ON child.ParentId = parent.Id  JOIN users AS u ON parent.OwnerUserId = u.Id  WHERE child.Score = (SELECT MAX(Score) FROM posts WHERE ParentId IS NOT NULL);	codebase_community
SELECT u.DisplayName, u.WebsiteUrl  FROM users u  JOIN votes v ON u.Id = v.UserId  WHERE v.VoteTypeId = 8  AND v.BountyAmount = (SELECT MAX(BountyAmount) FROM votes WHERE VoteTypeId = 8);	codebase_community
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5;	codebase_community
SELECT COUNT(*) FROM tags WHERE Count BETWEEN 5000 AND 7000;	codebase_community
SELECT OwnerUserId FROM posts WHERE FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts);	codebase_community
SELECT Age FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT COUNT(DISTINCT v.PostId)  FROM votes v  WHERE v.BountyAmount = 50 AND YEAR(v.CreationDate) = 2011;	codebase_community
SELECT Id FROM users WHERE Age = (SELECT MIN(Age) FROM users);	codebase_community
SELECT SUM(Score) FROM posts WHERE LasActivityDate LIKE '2010-07-19%';	codebase_community
SELECT COUNT(pl.Id)/12.0 AS AverageMonthlyLinks FROM postLinks pl JOIN posts p ON pl.PostId = p.Id WHERE YEAR(pl.CreationDate) = 2010 AND p.AnswerCount <= 2;	codebase_community
SELECT p.Id  FROM posts p  JOIN votes v ON p.Id = v.PostId  WHERE v.UserId = 1465  ORDER BY p.FavoriteCount DESC  LIMIT 1;	codebase_community
SELECT p.Title  FROM posts p  JOIN postLinks pl ON p.Id = pl.PostId  WHERE pl.CreationDate = (SELECT MIN(CreationDate) FROM postLinks);	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId GROUP BY b.UserId HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM badges GROUP BY UserId) AS tmp);	codebase_community
SELECT MIN(v.CreationDate)  FROM votes v  JOIN users u ON v.UserId = u.Id  WHERE u.DisplayName = 'chl';	codebase_community
SELECT MIN(p.CreaionDate) AS FirstPostDate  FROM users u  JOIN posts p ON u.Id = p.OwnerUserId  WHERE u.Age = (SELECT MIN(Age) FROM users);	codebase_community
SELECT u.DisplayName  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE b.Name = 'Autobiographer'  ORDER BY b.Date ASC  LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM users u  WHERE u.Location = 'United Kingdom'  AND EXISTS (     SELECT 1      FROM posts p      WHERE p.OwnerUserId = u.Id      AND p.FavoriteCount >= 4 );	codebase_community
SELECT AVG(post_count) FROM (SELECT UserId, COUNT(DISTINCT PostId) AS post_count FROM votes WHERE UserId IN (SELECT Id FROM users WHERE Age = (SELECT MAX(Age) FROM users)) GROUP BY UserId) AS t;	codebase_community
SELECT DisplayName FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT COUNT(*) FROM users WHERE Reputation > 2000 AND Views > 1000;	codebase_community
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT COUNT(*) FROM users INNER JOIN posts ON users.Id = posts.OwnerUserId WHERE users.DisplayName = 'Jay Stevens' AND YEAR(posts.CreaionDate) = 2010;	codebase_community
SELECT p.Id, p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky' ORDER BY p.ViewCount DESC LIMIT 1;	codebase_community
SELECT Id, Title FROM posts WHERE Score = (SELECT MAX(Score) FROM posts);	codebase_community
SELECT AVG(p.Score) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Stephen Turner';	codebase_community
SELECT DISTINCT u.DisplayName  FROM users u  JOIN posts p ON u.Id = p.OwnerUserId  WHERE p.ViewCount > 20000  AND YEAR(p.CreaionDate) = 2011;	codebase_community
SELECT p.Id, p.OwnerDisplayName  FROM posts p  WHERE YEAR(p.CreaionDate) = 2010  AND p.FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts WHERE YEAR(CreaionDate) = 2010);	codebase_community
SELECT (COUNT(CASE WHEN u.Reputation > 1000 THEN p.Id END) * 100.0) / COUNT(p.Id) AS Percentage FROM posts p LEFT JOIN users u ON p.OwnerUserId = u.Id WHERE YEAR(p.CreaionDate) = 2011;	codebase_community
SELECT (SUM(CASE WHEN Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS percentage FROM users;	codebase_community
SELECT p.ViewCount, u.DisplayName  FROM posts p  LEFT JOIN users u ON u.Id = COALESCE(p.LastEditorUserId, p.OwnerUserId)  WHERE p.Title = 'Computer Game Datasets';	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts);	codebase_community
SELECT COUNT(*) FROM comments WHERE PostId IN (SELECT Id FROM posts WHERE Score = (SELECT MAX(Score) FROM posts));	codebase_community
SELECT COUNT(*) AS NumberOfPosts FROM posts WHERE ViewCount > 35000 AND CommentCount = 0;	codebase_community
SELECT u.DisplayName, u.Location  FROM posts p  JOIN users u ON p.LastEditorUserId = u.Id  WHERE p.Id = 183  ORDER BY p.LastEditDate DESC  LIMIT 1;	codebase_community
SELECT badges.Name FROM badges JOIN users ON badges.UserId = users.Id WHERE users.DisplayName = 'Emmett' ORDER BY badges.Date DESC LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM users  WHERE Age BETWEEN 19 AND 65  AND UpVotes > 5000;	codebase_community
SELECT ROUND(JULIANDAY(b.Date) - JULIANDAY(u.CreationDate)) AS days_taken  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE u.DisplayName = 'Zolomon';	codebase_community
SELECT      (SELECT COUNT(*) FROM posts WHERE OwnerUserId = u.Id) AS post_count,     (SELECT COUNT(*) FROM comments WHERE UserId = u.Id) AS comment_count FROM users u ORDER BY u.CreationDate DESC LIMIT 1;	codebase_community
SELECT c.Text, u.DisplayName  FROM comments c  INNER JOIN posts p ON c.PostId = p.Id  INNER JOIN users u ON c.UserId = u.Id  WHERE p.Title = 'Analysing wind data with R'  ORDER BY c.CreationDate DESC  LIMIT 10;	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Citizen Patrol';	codebase_community
SELECT COUNT(*) FROM posts WHERE Tags LIKE '%<careers>%';	codebase_community
SELECT `Reputation`, `Views` FROM `users` WHERE `DisplayName` = 'Jarrod Dixon';	codebase_community
SELECT      (SELECT COUNT(*) FROM comments WHERE PostId = posts.Id AND UserId IS NOT NULL) +     (SELECT COUNT(*) FROM posts AS answers WHERE answers.ParentId = posts.Id AND answers.PostTypeId = 2 AND answers.OwnerUserId IS NOT NULL)      AS TotalCommentsAndAnswers FROM posts  WHERE Title = 'Clustering 1D data' AND PostTypeId = 1;	codebase_community
SELECT `CreationDate` FROM `users` WHERE `DisplayName` = 'IrishStat';	codebase_community
SELECT COUNT(DISTINCT v.PostId)  FROM votes v  WHERE v.BountyAmount >= 30;	codebase_community
SELECT      (AVG(CASE WHEN p.Score > 50 THEN 1.0 ELSE 0 END) * 100) AS Percentage FROM      posts p WHERE      p.OwnerUserId = (SELECT Id FROM users ORDER BY Reputation DESC LIMIT 1);	codebase_community
SELECT COUNT(*) FROM posts WHERE Score < 20;	codebase_community
SELECT COUNT(*) FROM tags WHERE Id < 15 AND Count <= 20;	codebase_community
SELECT `ExcerptPostId`, `WikiPostId` FROM `tags` WHERE `TagName` = 'sample';	codebase_community
SELECT users.Reputation, users.UpVotes  FROM users  INNER JOIN comments ON users.Id = comments.UserId  WHERE comments.Text = 'fine, you win :)';	codebase_community
SELECT c.Text  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE p.Title LIKE '%linear regression%';	codebase_community
SELECT c.Text  FROM comments c  INNER JOIN posts p ON c.PostId = p.Id  WHERE p.ViewCount BETWEEN 100 AND 150  AND c.Score = (     SELECT MAX(c2.Score)      FROM comments c2      INNER JOIN posts p2 ON c2.PostId = p2.Id      WHERE p2.ViewCount BETWEEN 100 AND 150 );	codebase_community
SELECT users.CreationDate, users.Age FROM users JOIN comments ON users.Id = comments.UserId WHERE comments.Text LIKE '%http://%';	codebase_community
SELECT COUNT(DISTINCT posts.Id) FROM comments JOIN posts ON comments.PostId = posts.Id WHERE comments.Score = 0 AND posts.ViewCount < 5;	codebase_community
SELECT COUNT(*)  FROM posts p  JOIN comments c ON p.Id = c.PostId  WHERE p.CommentCount = 1 AND c.Score = 0;	codebase_community
SELECT COUNT(DISTINCT users.Id)  FROM comments  JOIN users ON comments.UserId = users.Id  WHERE comments.Score = 0 AND users.Age = 40;	codebase_community
SELECT p.Id AS PostId, c.Text AS Comment FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Title = 'Group differences on a five point Likert item';	codebase_community
SELECT users.UpVotes FROM users JOIN comments ON users.Id = comments.UserId WHERE comments.Text = 'R is also lazy evaluated.';	codebase_community
SELECT comments.Text  FROM comments  JOIN users ON comments.UserId = users.Id  WHERE users.DisplayName = 'Harvey Motulsky';	codebase_community
SELECT DISTINCT u.DisplayName  FROM comments c  JOIN users u ON c.UserId = u.Id  WHERE c.Score BETWEEN 1 AND 5  AND u.DownVotes = 0;	codebase_community
SELECT      (COUNT(DISTINCT CASE WHEN u.UpVotes = 0 THEN c.UserId END) * 100.0) / COUNT(DISTINCT c.UserId) AS Percentage FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score BETWEEN 5 AND 10;	codebase_community
SELECT sp.power_name FROM superhero sh JOIN hero_power hp ON sh.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sh.superhero_name = '3-D Man';	superhero
SELECT COUNT(DISTINCT hp.hero_id) FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Super Strength';	superhero
SELECT COUNT(DISTINCT sh.id)  FROM superhero sh  JOIN hero_power hp ON sh.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'Super Strength' AND sh.height_cm > 200;	superhero
SELECT s.full_name  FROM superhero s  JOIN hero_power hp ON s.id = hp.hero_id  GROUP BY s.full_name  HAVING COUNT(hp.power_id) > 15;	superhero
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE colour.colour = 'Blue';	superhero
SELECT c.colour FROM superhero sh JOIN colour c ON sh.skin_colour_id = c.id WHERE sh.superhero_name = 'Apocalypse';	superhero
SELECT COUNT(DISTINCT sh.id)  FROM superhero sh  JOIN colour c ON sh.eye_colour_id = c.id AND c.colour = 'Blue'  JOIN hero_power hp ON sh.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id AND sp.power_name = 'Agility';	superhero
SELECT s.superhero_name  FROM superhero s  JOIN colour eye ON s.eye_colour_id = eye.id  JOIN colour hair ON s.hair_colour_id = hair.id  WHERE eye.colour = 'Blue' AND hair.colour = 'Blond';	superhero
SELECT COUNT(*) FROM superhero sh JOIN publisher p ON sh.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics';	superhero
SELECT s.superhero_name, s.height_cm, RANK() OVER (ORDER BY s.height_cm DESC) AS height_rank  FROM superhero s  JOIN publisher p ON s.publisher_id = p.id  WHERE p.publisher_name = 'Marvel Comics'  ORDER BY s.height_cm DESC, s.superhero_name;	superhero
SELECT p.publisher_name FROM superhero sh JOIN publisher p ON sh.publisher_id = p.id WHERE sh.superhero_name = 'Sauron';	superhero
SELECT c.colour, COUNT(s.id) AS popularity  FROM superhero s  JOIN publisher p ON s.publisher_id = p.id  JOIN colour c ON s.eye_colour_id = c.id  WHERE p.publisher_name = 'Marvel Comics'  GROUP BY c.colour  ORDER BY popularity DESC, c.colour;	superhero
SELECT AVG(sh.height_cm) FROM superhero sh JOIN publisher p ON sh.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics';	superhero
SELECT s.superhero_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE p.publisher_name = 'Marvel Comics' AND sp.power_name = 'Super Strength';	superhero
SELECT COUNT(*) FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'DC Comics';	superhero
SELECT p.publisher_name  FROM publisher p  JOIN superhero sh ON sh.publisher_id = p.id  JOIN hero_attribute ha ON ha.hero_id = sh.id  WHERE ha.attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Speed')  AND ha.attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute WHERE attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Speed'))  GROUP BY p.publisher_name;	superhero
SELECT COUNT(*)  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  JOIN publisher p ON s.publisher_id = p.id  WHERE c.colour = 'Gold' AND p.publisher_name = 'Marvel Comics';	superhero
SELECT p.publisher_name FROM superhero sh JOIN publisher p ON sh.publisher_id = p.id WHERE sh.superhero_name = 'Blue Beetle II';	superhero
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.hair_colour_id = colour.id WHERE colour.colour = 'Blond';	superhero
SELECT s.superhero_name, s.full_name  FROM superhero s  JOIN hero_attribute ha ON s.id = ha.hero_id  WHERE ha.attribute_id = 1  AND ha.attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute WHERE attribute_id = 1);	superhero
SELECT race.race FROM superhero JOIN race ON superhero.race_id = race.id WHERE superhero.superhero_name = 'Copycat';	superhero
SELECT sh.superhero_name  FROM superhero sh  JOIN hero_attribute ha ON sh.id = ha.hero_id  JOIN attribute a ON ha.attribute_id = a.id  WHERE a.attribute_name = 'Durability' AND ha.attribute_value < 50;	superhero
SELECT s.superhero_name  FROM superhero s  JOIN hero_power hp ON s.id = hp.hero_id  JOIN superpower p ON hp.power_id = p.id  WHERE p.power_name = 'Death Touch';	superhero
SELECT COUNT(DISTINCT sh.id)  FROM superhero sh  JOIN gender g ON sh.gender_id = g.id  JOIN hero_attribute ha ON sh.id = ha.hero_id  JOIN attribute a ON ha.attribute_id = a.id  WHERE g.gender = 'Female'  AND a.attribute_name = 'Strength'  AND ha.attribute_value = 100;	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id GROUP BY s.id ORDER BY COUNT(hp.power_id) DESC LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero JOIN race ON superhero.race_id = race.id WHERE race.race = 'Vampire';	superhero
SELECT    (COUNT(CASE WHEN a.alignment = 'Bad' THEN 1 END) * 100.0 / COUNT(*)) AS percentage,   COUNT(CASE WHEN a.alignment = 'Bad' AND p.publisher_name = 'Marvel Comics' THEN 1 END) AS marvel_count FROM superhero s LEFT JOIN alignment a ON s.alignment_id = a.id LEFT JOIN publisher p ON s.publisher_id = p.id;	superhero
SELECT      (SUM(CASE WHEN p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) -       SUM(CASE WHEN p.publisher_name = 'DC Comics' THEN 1 ELSE 0 END)) AS difference  FROM superhero sh  JOIN publisher p ON sh.publisher_id = p.id  WHERE p.publisher_name IN ('DC Comics', 'Marvel Comics');	superhero
SELECT id FROM publisher WHERE publisher_name = 'Star Trek';	superhero
SELECT AVG(attribute_value) FROM hero_attribute;	superhero
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL;	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.id = 75;	superhero
SELECT sp.power_name FROM superhero sh JOIN hero_power hp ON sh.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sh.superhero_name = 'Deathlok';	superhero
SELECT AVG(weight_kg) FROM superhero WHERE gender_id = (SELECT id FROM gender WHERE gender = 'Female');	superhero
SELECT DISTINCT sp.power_name  FROM superhero sh  JOIN hero_power hp ON sh.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE sh.gender_id = 1  LIMIT 5;	superhero
SELECT superhero.superhero_name FROM superhero JOIN race ON superhero.race_id = race.id WHERE race.race = 'Alien';	superhero
SELECT superhero.superhero_name  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE superhero.height_cm BETWEEN 170 AND 190  AND colour.colour = 'No Colour';	superhero
SELECT sp.power_name FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id WHERE hp.hero_id = 56;	superhero
SELECT s.full_name  FROM superhero s  JOIN race r ON s.race_id = r.id  WHERE r.race = 'Demi-God'  LIMIT 5;	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad');	superhero
SELECT race.race FROM superhero JOIN race ON superhero.race_id = race.id WHERE superhero.weight_kg = 169;	superhero
SELECT c.colour FROM superhero sh JOIN race r ON sh.race_id = r.id JOIN colour c ON sh.hair_colour_id = c.id WHERE r.race = 'Human' AND sh.height_cm = 185;	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.weight_kg = (SELECT MAX(weight_kg) FROM superhero);	superhero
SELECT (100.0 * SUM(CASE WHEN s.publisher_id = 13 THEN 1 ELSE 0 END)) / COUNT(*) AS percentage FROM superhero s WHERE s.height_cm BETWEEN 150 AND 180;	superhero
SELECT s.superhero_name  FROM superhero s  JOIN gender g ON s.gender_id = g.id  WHERE g.gender = 'Male'  AND s.weight_kg > (SELECT 0.79 * AVG(weight_kg) FROM superhero);	superhero
SELECT sp.power_name FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id GROUP BY hp.power_id ORDER BY COUNT(*) DESC LIMIT 1;	superhero
SELECT ha.attribute_value FROM superhero sh JOIN hero_attribute ha ON sh.id = ha.hero_id WHERE sh.superhero_name = 'Abomination';	superhero
SELECT sp.power_name FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id WHERE hp.hero_id = 1;	superhero
SELECT COUNT(DISTINCT hp.hero_id) FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Stealth';	superhero
SELECT sh.full_name  FROM superhero sh  JOIN hero_attribute ha ON sh.id = ha.hero_id  JOIN attribute a ON ha.attribute_id = a.id  WHERE a.attribute_name = 'Strength'  AND ha.attribute_value = (SELECT MAX(ha2.attribute_value) FROM hero_attribute ha2 JOIN attribute a2 ON ha2.attribute_id = a2.id WHERE a2.attribute_name = 'Strength');	superhero
SELECT CAST(COUNT(id) AS FLOAT) / SUM(CASE WHEN skin_colour_id = 1 THEN 1 ELSE 0 END) AS average FROM superhero;	superhero
SELECT COUNT(*)  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE publisher.publisher_name = 'Dark Horse Comics';	superhero
SELECT s.superhero_name  FROM superhero s  JOIN publisher p ON s.publisher_id = p.id  JOIN hero_attribute ha ON s.id = ha.hero_id  JOIN attribute a ON ha.attribute_id = a.id  WHERE p.publisher_name = 'Dark Horse Comics'    AND a.attribute_name = 'Durability'  ORDER BY ha.attribute_value DESC  LIMIT 1;	superhero
SELECT c.colour  FROM superhero sh  JOIN colour c ON sh.eye_colour_id = c.id  WHERE sh.full_name = 'Abraham Sapien';	superhero
SELECT s.superhero_name  FROM superhero s  JOIN hero_power hp ON s.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'Flight';	superhero
SELECT eye_col.colour AS eye_color, hair_col.colour AS hair_color, skin_col.colour AS skin_color  FROM superhero  JOIN gender ON superhero.gender_id = gender.id  JOIN publisher ON superhero.publisher_id = publisher.id  LEFT JOIN colour AS eye_col ON superhero.eye_colour_id = eye_col.id  LEFT JOIN colour AS hair_col ON superhero.hair_colour_id = hair_col.id  LEFT JOIN colour AS skin_col ON superhero.skin_colour_id = skin_col.id  WHERE gender.gender = 'Female' AND publisher.publisher_name = 'Dark Horse Comics';	superhero
SELECT superhero.superhero_name, publisher.publisher_name FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.eye_colour_id = superhero.hair_colour_id AND superhero.hair_colour_id = superhero.skin_colour_id;	superhero
SELECT r.race  FROM superhero sh  JOIN race r ON sh.race_id = r.id  WHERE sh.superhero_name = 'A-Bomb';	superhero
SELECT (COUNT(CASE WHEN c.colour = 'Blue' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM superhero s JOIN gender g ON s.gender_id = g.id LEFT JOIN colour c ON s.skin_colour_id = c.id WHERE g.gender = 'Female';	superhero
SELECT s.superhero_name, r.race  FROM superhero s  JOIN race r ON s.race_id = r.id  WHERE s.full_name = 'Charles Chandler';	superhero
SELECT g.gender  FROM superhero sh  JOIN gender g ON sh.gender_id = g.id  WHERE sh.superhero_name = 'Agent 13';	superhero
SELECT sh.superhero_name  FROM superhero sh  JOIN hero_power hp ON sh.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'Adaptation';	superhero
SELECT COUNT(*)  FROM superhero  JOIN hero_power ON superhero.id = hero_power.hero_id  WHERE superhero.superhero_name = 'Amazo';	superhero
SELECT sp.power_name FROM superhero sh JOIN hero_power hp ON sh.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sh.full_name = 'Hunter Zolomon';	superhero
SELECT s.height_cm  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE c.colour = 'Amber';	superhero
SELECT s.superhero_name  FROM superhero s  INNER JOIN colour eye ON s.eye_colour_id = eye.id  INNER JOIN colour hair ON s.hair_colour_id = hair.id  WHERE eye.colour = 'Black' AND hair.colour = 'Black';	superhero
SELECT DISTINCT c_eye.colour  FROM superhero s  JOIN colour c_skin ON s.skin_colour_id = c_skin.id  JOIN colour c_eye ON s.eye_colour_id = c_eye.id  WHERE c_skin.colour = 'Gold';	superhero
SELECT superhero.full_name FROM superhero JOIN race ON superhero.race_id = race.id WHERE race.race = 'Vampire';	superhero
SELECT s.superhero_name FROM superhero s JOIN alignment a ON s.alignment_id = a.id WHERE a.alignment = 'Neutral';	superhero
SELECT COUNT(*) FROM hero_attribute WHERE attribute_id = 2 AND attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute WHERE attribute_id = 2);	superhero
SELECT r.race, a.alignment  FROM superhero sh  JOIN race r ON sh.race_id = r.id  JOIN alignment a ON sh.alignment_id = a.id  WHERE sh.superhero_name = 'Cameron Hicks';	superhero
SELECT      (COUNT(CASE WHEN g.gender = 'Female' THEN 1 END) * 100.0) / COUNT(*) AS percentage FROM superhero sh JOIN publisher p ON sh.publisher_id = p.id JOIN gender g ON sh.gender_id = g.id WHERE p.publisher_name = 'Marvel Comics';	superhero
SELECT AVG(sh.weight_kg) FROM superhero sh JOIN race r ON sh.race_id = r.id WHERE r.race = 'Alien';	superhero
SELECT (SELECT SUM(s1.weight_kg) FROM superhero s1 WHERE s1.full_name = 'Emil Blonsky') - (SELECT SUM(s2.weight_kg) FROM superhero s2 WHERE s2.full_name = 'Charles Chandler') AS weight_difference;	superhero
SELECT superhero_name, AVG(height_cm) AS average_height FROM superhero GROUP BY id;	superhero
SELECT sp.power_name FROM superhero sh JOIN hero_power hp ON sh.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sh.superhero_name = 'Abomination';	superhero
SELECT COUNT(*)  FROM superhero  WHERE race_id = 21 AND gender_id = 1;	superhero
SELECT s.superhero_name  FROM superhero s  JOIN hero_attribute ha ON s.id = ha.hero_id  JOIN attribute a ON ha.attribute_id = a.id  WHERE a.attribute_name = 'Speed'  ORDER BY ha.attribute_value DESC  LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3;	superhero
SELECT a.attribute_name, ha.attribute_value  FROM superhero sh  JOIN hero_attribute ha ON sh.id = ha.hero_id  JOIN attribute a ON ha.attribute_id = a.id  WHERE sh.superhero_name = '3-D Man';	superhero
SELECT s.superhero_name FROM superhero s JOIN colour eye ON s.eye_colour_id = eye.id JOIN colour hair ON s.hair_colour_id = hair.id WHERE eye.colour = 'Blue' AND hair.colour = 'Brown';	superhero
SELECT s.superhero_name, p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy');	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = 1;	superhero
SELECT (COUNT(CASE WHEN eye_colour_id = 7 THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM superhero;	superhero
SELECT (SUM(CASE WHEN s.gender_id = 1 THEN 1 ELSE 0 END) * 1.0) / NULLIF(SUM(CASE WHEN s.gender_id = 2 THEN 1 ELSE 0 END), 0) AS male_to_female_ratio FROM superhero s;	superhero
SELECT superhero_name FROM superhero WHERE height_cm = (SELECT MAX(height_cm) FROM superhero);	superhero
SELECT id FROM superpower WHERE power_name = 'cryokinesis';	superhero
SELECT superhero_name FROM superhero WHERE id = 294;	superhero
SELECT full_name  FROM superhero  WHERE weight_kg IS NULL OR weight_kg = 0;	superhero
SELECT c.colour FROM superhero sh JOIN colour c ON sh.eye_colour_id = c.id WHERE sh.full_name = 'Karen Beecher-Duncan';	superhero
SELECT sp.power_name FROM superhero sh JOIN hero_power hp ON sh.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sh.full_name = 'Helen Parr';	superhero
SELECT r.race FROM superhero sh JOIN race r ON sh.race_id = r.id WHERE sh.weight_kg = 108 AND sh.height_cm = 188;	superhero
SELECT p.publisher_name  FROM superhero sh  JOIN publisher p ON sh.publisher_id = p.id  WHERE sh.id = 38;	superhero
SELECT r.race  FROM race r  JOIN superhero sh ON r.id = sh.race_id  WHERE sh.id IN (     SELECT hero_id      FROM hero_attribute      WHERE attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute) );	superhero
SELECT a.alignment, GROUP_CONCAT(sp.power_name) AS superpowers  FROM superhero sh  LEFT JOIN alignment a ON sh.alignment_id = a.id  LEFT JOIN hero_power hp ON sh.id = hp.hero_id  LEFT JOIN superpower sp ON hp.power_id = sp.id  WHERE sh.superhero_name = 'Atom IV'  GROUP BY sh.id;	superhero
SELECT superhero.full_name  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE colour.colour = 'Blue'  LIMIT 5;	superhero
SELECT AVG(ha.attribute_value) FROM superhero sh JOIN hero_attribute ha ON sh.id = ha.hero_id WHERE sh.alignment_id = 3;	superhero
SELECT DISTINCT c.colour  FROM superhero sh  JOIN hero_attribute ha ON sh.id = ha.hero_id  JOIN colour c ON sh.skin_colour_id = c.id  WHERE ha.attribute_value = 100;	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 1 AND gender_id = 2;	superhero
SELECT DISTINCT sh.superhero_name  FROM superhero sh  INNER JOIN hero_attribute ha ON sh.id = ha.hero_id  WHERE ha.attribute_value BETWEEN 75 AND 80;	superhero
SELECT race.race FROM superhero JOIN gender ON superhero.gender_id = gender.id JOIN colour ON superhero.hair_colour_id = colour.id JOIN race ON superhero.race_id = race.id WHERE gender.gender = 'Male' AND colour.colour = 'Blue';	superhero
SELECT (SUM(CASE WHEN gender_id = 2 THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS percentage FROM superhero WHERE alignment_id = 2;	superhero
SELECT      (SUM(CASE WHEN eye_colour_id = 7 THEN 1 ELSE 0 END) - SUM(CASE WHEN eye_colour_id = 1 THEN 1 ELSE 0 END)) AS difference  FROM superhero  WHERE weight_kg IS NULL OR weight_kg = 0;	superhero
SELECT ha.attribute_value  FROM superhero sh  JOIN hero_attribute ha ON sh.id = ha.hero_id  JOIN attribute a ON ha.attribute_id = a.id  WHERE sh.superhero_name = 'Hulk' AND a.attribute_name = 'Strength';	superhero
SELECT sp.power_name FROM superhero sh JOIN hero_power hp ON sh.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sh.superhero_name = 'Ajax';	superhero
SELECT COUNT(DISTINCT sh.id)  FROM superhero sh  JOIN colour c ON sh.skin_colour_id = c.id  JOIN alignment a ON sh.alignment_id = a.id  WHERE c.colour = 'Green' AND a.alignment = 'Bad';	superhero
SELECT COUNT(sh.id) FROM superhero sh JOIN gender g ON sh.gender_id = g.id JOIN publisher p ON sh.publisher_id = p.id WHERE g.gender = 'Female' AND p.publisher_name = 'Marvel Comics';	superhero
SELECT s.superhero_name  FROM superhero s  JOIN hero_power hp ON s.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'Wind Control'  ORDER BY s.superhero_name;	superhero
SELECT g.gender  FROM superhero sh  JOIN gender g ON sh.gender_id = g.id  JOIN hero_power hp ON sh.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'Phoenix Force';	superhero
SELECT s.superhero_name  FROM superhero s  JOIN publisher p ON s.publisher_id = p.id  WHERE p.publisher_name = 'DC Comics'  ORDER BY s.weight_kg DESC  LIMIT 1;	superhero
SELECT AVG(sh.height_cm) FROM superhero sh JOIN race r ON sh.race_id = r.id JOIN publisher p ON sh.publisher_id = p.id WHERE r.race <> 'Human' AND p.publisher_name = 'Dark Horse Comics';	superhero
SELECT COUNT(DISTINCT ha.hero_id) FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' AND ha.attribute_value = 100;	superhero
SELECT (SUM(CASE WHEN p.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) - SUM(CASE WHEN p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END)) AS difference FROM superhero s JOIN publisher p ON s.publisher_id = p.id;	superhero
SELECT a.attribute_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE s.superhero_name = 'Black Panther' ORDER BY ha.attribute_value ASC LIMIT 1;	superhero
SELECT c.colour  FROM superhero sh  JOIN colour c ON sh.eye_colour_id = c.id  WHERE sh.superhero_name = 'Abomination';	superhero
SELECT superhero_name FROM superhero WHERE height_cm = (SELECT MAX(height_cm) FROM superhero);	superhero
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler';	superhero
SELECT (SUM(CASE WHEN g.gender = 'Female' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS percentage FROM superhero s JOIN publisher p ON s.publisher_id = p.id JOIN gender g ON s.gender_id = g.id WHERE p.publisher_name = 'George Lucas';	superhero
SELECT (SUM(CASE WHEN a.alignment = 'Good' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS percentage FROM superhero sh JOIN publisher p ON sh.publisher_id = p.id JOIN alignment a ON sh.alignment_id = a.id WHERE p.publisher_name = 'Marvel Comics';	superhero
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%';	superhero
SELECT hero_id FROM hero_attribute WHERE attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute);	superhero
SELECT full_name FROM superhero WHERE superhero_name = 'Alien';	superhero
SELECT s.full_name  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.weight_kg < 100 AND c.colour = 'Brown';	superhero
SELECT ha.attribute_value  FROM superhero sh JOIN hero_attribute ha ON sh.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE sh.superhero_name = 'Aquababy';	superhero
SELECT s.weight_kg, r.race FROM superhero s LEFT JOIN race r ON s.race_id = r.id WHERE s.id = 40;	superhero
SELECT AVG(sh.height_cm)  FROM superhero sh  JOIN alignment a ON sh.alignment_id = a.id  WHERE a.alignment = 'Neutral';	superhero
SELECT DISTINCT s.id  FROM superhero s  JOIN hero_power hp ON s.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'Intelligence';	superhero
SELECT c.colour FROM superhero sh JOIN colour c ON sh.eye_colour_id = c.id WHERE sh.superhero_name = 'Blackwulf';	superhero
SELECT sp.power_name  FROM superhero sh JOIN hero_power hp ON sh.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sh.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero);	superhero
SELECT d.driverRef FROM qualifying q JOIN drivers d ON q.driverId = d.driverId WHERE q.raceId = 20 ORDER BY q.q1 DESC LIMIT 5;	formula_1
SELECT d.surname FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 19 AND q.q2 = (SELECT MIN(q2) FROM qualifying WHERE raceId = 19);	formula_1
SELECT DISTINCT races.year  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE circuits.location = 'Shanghai';	formula_1
SELECT c.url FROM circuits c WHERE c.name = 'Circuit de Barcelona-Catalunya';	formula_1
SELECT races.name FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.country = 'Germany';	formula_1
SELECT c.lat, c.lng  FROM circuits c  INNER JOIN races r ON c.circuitId = r.circuitId  INNER JOIN constructorResults cr ON r.raceId = cr.raceId  INNER JOIN constructors con ON cr.constructorId = con.constructorId  WHERE con.name = 'Renault';	formula_1
SELECT COUNT(*)  FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE races.year = 2010   AND circuits.country NOT IN ('Europe', 'Asia');	formula_1
SELECT races.name FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.country = 'Spain';	formula_1
SELECT c.lat, c.lng FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.name = 'Australian Grand Prix';	formula_1
SELECT races.url  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE circuits.name = 'Sepang International Circuit';	formula_1
SELECT r.time  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE c.name = 'Sepang International Circuit';	formula_1
SELECT c.lat, c.lng FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.name = 'Abu Dhabi Grand Prix';	formula_1
SELECT c.nationality FROM constructorResults cr JOIN constructors c ON cr.constructorId = c.constructorId WHERE cr.raceId = 24 AND cr.points = 1;	formula_1
SELECT q.q1 FROM qualifying q JOIN drivers d ON q.driverId = d.driverId WHERE d.forename = 'Bruno' AND d.surname = 'Senna' AND q.raceId = 354;	formula_1
SELECT d.nationality FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 355 AND q.q2 = '0:01:40';	formula_1
SELECT number FROM qualifying WHERE raceId = 903 AND q3 LIKE '1:54%';	formula_1
SELECT COUNT(*) FROM results JOIN races ON results.raceId = races.raceId WHERE races.name = 'Bahrain Grand Prix' AND races.year = 2007 AND results.time IS NULL;	formula_1
SELECT s.year, s.url FROM seasons s WHERE s.year = (SELECT year FROM races WHERE raceId = 901);	formula_1
SELECT COUNT(DISTINCT r.driverId)  FROM results r  JOIN races rc ON r.raceId = rc.raceId  WHERE rc.date = '2015-11-29' AND r.time IS NOT NULL;	formula_1
SELECT d.forename, d.surname  FROM results r  JOIN drivers d ON r.driverId = d.driverId  WHERE r.raceId = 592 AND r.time IS NOT NULL  ORDER BY d.dob ASC  LIMIT 1;	formula_1
SELECT d.url FROM drivers d JOIN lapTimes l ON d.driverId = l.driverId WHERE l.raceId = 161 AND l.time LIKE '1:27%';	formula_1
SELECT d.nationality FROM drivers d WHERE d.driverId = (SELECT r.driverId FROM results r WHERE r.raceId = 933 ORDER BY CAST(r.fastestLapSpeed AS REAL) DESC LIMIT 1);	formula_1
SELECT c.lat, c.lng, c.location  FROM circuits c  JOIN races r ON c.circuitId = r.circuitId  WHERE r.name = 'Malaysian Grand Prix';	formula_1
SELECT c.url FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId WHERE cr.raceId = 9 AND cr.points = (SELECT MAX(points) FROM constructorResults WHERE raceId = 9);	formula_1
SELECT q1 FROM qualifying JOIN drivers ON qualifying.driverId = drivers.driverId WHERE drivers.forename = 'Lucas' AND drivers.surname = 'di Grassi' AND qualifying.raceId = 345;	formula_1
SELECT d.nationality FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 347 AND q.q2 = '0:01:15';	formula_1
SELECT d.code  FROM qualifying q  JOIN drivers d ON q.driverId = d.driverId  WHERE q.raceId = 45 AND q.q3 LIKE '1:33%';	formula_1
SELECT r.time  FROM results r  JOIN drivers d ON r.driverId = d.driverId  JOIN status s ON r.statusId = s.statusId  WHERE d.forename = 'Bruce' AND d.surname = 'McLaren'  AND r.raceId = 743  AND s.status = 'Finished';	formula_1
SELECT d.forename, d.surname  FROM races r  JOIN results rs ON r.raceId = rs.raceId  JOIN drivers d ON rs.driverId = d.driverId  WHERE r.year = 2006 AND r.name = 'San Marino Grand Prix' AND rs.position = 2;	formula_1
SELECT s.url FROM seasons s WHERE s.year = (SELECT r.year FROM races r WHERE r.raceId = 901);	formula_1
SELECT COUNT(*) FROM results r JOIN races rc ON r.raceId = rc.raceId JOIN status s ON r.statusId = s.statusId WHERE rc.date = '2015-11-29' AND s.status != 'Finished';	formula_1
SELECT d.forename, d.surname  FROM drivers d  JOIN results r ON d.driverId = r.driverId  WHERE r.raceId = 872 AND r.time IS NOT NULL  ORDER BY d.dob DESC  LIMIT 1;	formula_1
SELECT d.forename || ' ' || d.surname AS full_name  FROM drivers d  JOIN lapTimes l ON d.driverId = l.driverId  WHERE l.raceId = 348  AND l.time = (SELECT MIN(time) FROM lapTimes WHERE raceId = 348)  LIMIT 1;	formula_1
SELECT d.nationality FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE CAST(r.fastestLapSpeed AS REAL) = (SELECT MAX(CAST(fastestLapSpeed AS REAL)) FROM results WHERE fastestLapSpeed IS NOT NULL) AND r.fastestLapSpeed IS NOT NULL;	formula_1
SELECT    ((r1.fastestLapSpeedNumeric - r2.fastestLapSpeedNumeric) / r1.fastestLapSpeedNumeric) * 100 AS percentage_faster FROM    (SELECT CAST(REPLACE(fastestLapSpeed, 'km/h', '') AS REAL) AS fastestLapSpeedNumeric     FROM results     WHERE raceId = 853 AND driverId = (SELECT driverId FROM drivers WHERE forename = 'Paul' AND surname = 'di Resta')) r1,   (SELECT CAST(REPLACE(fastestLapSpeed, 'km/h', '') AS REAL) AS fastestLapSpeedNumeric     FROM results     WHERE raceId = 854 AND driverId = (SELECT driverId FROM drivers WHERE forename = 'Paul' AND surname = 'di Resta')) r2;	formula_1
SELECT      res.driverId,      (SUM(CASE WHEN res.time IS NOT NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(res.driverId)) AS completion_rate  FROM      races r  JOIN      results res ON r.raceId = res.raceId  WHERE      r.date = '1983-07-16'  GROUP BY      res.driverId;	formula_1
SELECT MIN(year) FROM races WHERE name = 'Singapore Grand Prix';	formula_1
SELECT COUNT(*) FROM races WHERE year = 2005; SELECT name FROM races WHERE year = 2005 ORDER BY name DESC;	formula_1
SELECT r.name  FROM races r  WHERE      strftime('%Y-%m', r.date) = (         SELECT strftime('%Y-%m', MIN(date))          FROM races     );	formula_1
SELECT name, date FROM races WHERE year = 1999 AND round = (SELECT MAX(round) FROM races WHERE year = 1999);	formula_1
SELECT year FROM races GROUP BY year ORDER BY MAX(round) DESC LIMIT 1;	formula_1
SELECT r2017.name  FROM races r2017  WHERE r2017.year = 2017  AND r2017.circuitId NOT IN (     SELECT r2000.circuitId      FROM races r2000      WHERE r2000.year = 2000 );	formula_1
SELECT c.country, c.name AS circuit, c.location FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.name = 'European Grand Prix' AND r.year = (SELECT MIN(year) FROM races WHERE name = 'European Grand Prix');	formula_1
SELECT MAX(r.year)  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE c.name = 'Brands Hatch' AND r.name = 'British Grand Prix';	formula_1
SELECT COUNT(DISTINCT r.year)  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE c.name = 'Silverstone Circuit' AND r.name = 'British Grand Prix';	formula_1
SELECT d.forename, d.surname  FROM drivers d  JOIN results r ON d.driverId = r.driverId  JOIN races rc ON r.raceId = rc.raceId  WHERE rc.name = 'Singapore Grand Prix' AND rc.year = 2010  ORDER BY r.positionOrder;	formula_1
SELECT d.forename, d.surname, MAX(ds.points) AS points  FROM drivers d  JOIN driverStandings ds ON d.driverId = ds.driverId;	formula_1
SELECT d.forename, d.surname, r.points  FROM races rc  JOIN results r ON rc.raceId = r.raceId  JOIN drivers d ON r.driverId = d.driverId  WHERE rc.year = 2017 AND rc.name = 'Chinese Grand Prix'  ORDER BY r.points DESC  LIMIT 3;	formula_1
SELECT d.forename, d.surname, r.name, lt.milliseconds  FROM lapTimes lt  JOIN drivers d ON lt.driverId = d.driverId  JOIN races r ON lt.raceId = r.raceId  WHERE lt.milliseconds = (SELECT MIN(milliseconds) FROM lapTimes)  LIMIT 1;	formula_1
SELECT AVG(lapTimes.milliseconds)  FROM lapTimes  JOIN drivers ON lapTimes.driverId = drivers.driverId  JOIN races ON lapTimes.raceId = races.raceId  WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton'  AND races.name = 'Malaysian Grand Prix' AND races.year = 2009;	formula_1
SELECT (SUM(CASE WHEN res.positionOrder > 1 THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS percentage  FROM results res  JOIN drivers d ON res.driverId = d.driverId  JOIN races r ON res.raceId = r.raceId  WHERE d.surname = 'Hamilton' AND r.year >= 2010;	formula_1
SELECT d.forename || ' ' || d.surname AS driver_name, d.nationality, MAX(ds.points) AS max_point_scores FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId WHERE d.driverId = (SELECT driverId FROM driverStandings GROUP BY driverId ORDER BY SUM(wins) DESC LIMIT 1) GROUP BY d.driverId;	formula_1
SELECT d.forename || ' ' || d.surname AS name, MIN(YEAR(CURRENT_DATE) - YEAR(d.dob)) AS age FROM drivers d WHERE d.nationality = 'Japanese';	formula_1
SELECT c.circuitId, c.name, c.location, c.country  FROM circuits c  WHERE c.circuitId IN (     SELECT r.circuitId      FROM races r      WHERE CAST(SUBSTR(r.date, 1, 4) AS INTEGER) BETWEEN 1990 AND 2000      GROUP BY r.circuitId      HAVING COUNT(*) = 4 );	formula_1
SELECT circuits.name AS circuit_name, circuits.location, races.name AS race_name  FROM circuits  JOIN races ON circuits.circuitId = races.circuitId  WHERE circuits.country = 'USA' AND races.year = 2006;	formula_1
SELECT races.name AS raceName, circuits.name AS circuitName, circuits.location  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE YEAR(races.date) = 2005 AND MONTH(races.date) = 9;	formula_1
SELECT r.name, r.date  FROM drivers d  JOIN results res ON d.driverId = res.driverId  JOIN races r ON res.raceId = r.raceId  WHERE d.forename = 'Alex' AND d.surname = 'Yoong' AND res.position < 20;	formula_1
SELECT COUNT(*)  FROM results r  JOIN drivers d ON r.driverId = d.driverId  JOIN races ra ON r.raceId = ra.raceId  JOIN circuits c ON ra.circuitId = c.circuitId  WHERE c.name = 'Sepang International Circuit'  AND d.forename = 'Michael'  AND d.surname = 'Schumacher'  AND r.points = (     SELECT MAX(points)      FROM results      WHERE raceId = r.raceId );	formula_1
SELECT races.name AS race, races.year  FROM races  JOIN results ON races.raceId = results.raceId  JOIN drivers ON results.driverId = drivers.driverId  WHERE drivers.forename = 'Michael' AND drivers.surname = 'Schumacher'  ORDER BY results.milliseconds ASC  LIMIT 1;	formula_1
SELECT AVG(r.points) FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId WHERE d.forename = 'Eddie' AND d.surname = 'Irvine' AND ra.year = 2000;	formula_1
SELECT r.name AS first_race, res.points  FROM drivers d  JOIN results res ON d.driverId = res.driverId  JOIN races r ON res.raceId = r.raceId  WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton'  ORDER BY r.year, r.date  LIMIT 1;	formula_1
SELECT r.name, r.date, c.country  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE r.year = 2017  ORDER BY r.date;	formula_1
SELECT races.name, races.year, circuits.location  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE races.raceId IN (     SELECT results.raceId      FROM results      WHERE laps = (SELECT MAX(laps) FROM results) )  GROUP BY races.raceId;	formula_1
SELECT      (CAST(SUM(CASE WHEN circuits.country = 'Germany' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(*)) * 100 AS percentage  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE races.name = 'European Grand Prix';	formula_1
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit';	formula_1
SELECT name, lat FROM circuits WHERE name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring') ORDER BY lat DESC LIMIT 1;	formula_1
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit';	formula_1
SELECT country FROM circuits WHERE alt = (SELECT MAX(alt) FROM circuits);	formula_1
SELECT COUNT(*) FROM drivers WHERE code IS NULL;	formula_1
SELECT nationality FROM drivers ORDER BY dob ASC LIMIT 1;	formula_1
SELECT surname FROM drivers WHERE nationality = 'italian';	formula_1
SELECT url FROM drivers WHERE forename = 'Anthony' AND surname = 'Davidson';	formula_1
SELECT driverRef FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton';	formula_1
SELECT circuits.name FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE races.year = 2009 AND races.name = 'Spanish Grand Prix';	formula_1
SELECT DISTINCT races.year  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE circuits.name = 'Silverstone Circuit';	formula_1
SELECT r.url  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE c.name = 'Silverstone Circuit';	formula_1
SELECT races.date, races.time FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.name = 'Abu Dhabi Circuit' AND races.year BETWEEN 2010 AND 2019;	formula_1
SELECT COUNT(*) FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.country = 'Italy';	formula_1
SELECT races.date  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE circuits.name = 'Barcelona-Catalunya';	formula_1
SELECT c.url  FROM circuits c  JOIN races r ON c.circuitId = r.circuitId  WHERE r.name = 'Spanish Grand Prix' AND r.year = 2009;	formula_1
SELECT l.time  FROM lapTimes l  JOIN drivers d ON l.driverId = d.driverId  WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton'  ORDER BY l.milliseconds ASC  LIMIT 1;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE CAST(r.fastestLapSpeed AS REAL) = (SELECT MAX(CAST(fastestLapSpeed AS REAL)) FROM results WHERE fastestLapSpeed IS NOT NULL AND fastestLapSpeed != '');	formula_1
SELECT d.driverRef FROM drivers d JOIN results rs ON d.driverId = rs.driverId JOIN races r ON rs.raceId = r.raceId WHERE r.name = 'Canadian Grand Prix' AND r.year = 2007 AND rs.positionOrder = 1;	formula_1
SELECT DISTINCT r.name  FROM drivers d  JOIN results res ON d.driverId = res.driverId  JOIN races r ON res.raceId = r.raceId  WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT r.name, r.date  FROM races r  JOIN results res ON r.raceId = res.raceId  JOIN drivers d ON res.driverId = d.driverId  WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton'  ORDER BY res.rank ASC  LIMIT 1;	formula_1
SELECT MAX(CAST(results.fastestLapSpeed AS REAL))  FROM results  JOIN races ON results.raceId = races.raceId  WHERE races.year = 2009 AND races.name = 'Spanish Grand Prix';	formula_1
SELECT DISTINCT races.year FROM races JOIN results ON races.raceId = results.raceId JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';	formula_1
SELECT results.positionOrder  FROM results  JOIN drivers ON results.driverId = drivers.driverId  JOIN races ON results.raceId = races.raceId  WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton'  AND races.year = 2008 AND races.name = 'Chinese Grand Prix';	formula_1
SELECT d.forename, d.surname  FROM results r  JOIN drivers d ON r.driverId = d.driverId  JOIN races ra ON r.raceId = ra.raceId  WHERE ra.year = 1989 AND ra.name = 'Australian Grand Prix' AND r.grid = 4;	formula_1
SELECT COUNT(*)  FROM results  JOIN races ON results.raceId = races.raceId  WHERE races.year = 2008    AND races.name = 'Australian Grand Prix'    AND results.time IS NOT NULL;	formula_1
SELECT l.time AS fastest_lap_time  FROM drivers d  JOIN races r ON r.name = 'Australian Grand Prix' AND r.year = 2008  JOIN lapTimes l ON d.driverId = l.driverId AND r.raceId = l.raceId  WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton'  ORDER BY l.milliseconds ASC  LIMIT 1;	formula_1
SELECT results.time  FROM results  JOIN races ON results.raceId = races.raceId  WHERE races.year = 2008  AND races.name = 'Chinese Grand Prix'  AND results.positionOrder = 2;	formula_1
SELECT d.forename, d.surname, d.url  FROM races r  JOIN results rs ON r.raceId = rs.raceId  JOIN drivers d ON rs.driverId = d.driverId  WHERE r.year = 2008 AND r.name = 'Australian Grand Prix'  AND rs.positionOrder = 1 AND rs.time LIKE '%:%:%';	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2008 AND ra.name = 'Australian Grand Prix' AND d.nationality = 'British';	formula_1
SELECT COUNT(DISTINCT r.driverId)  FROM results r  JOIN races rc ON r.raceId = rc.raceId  WHERE rc.year = 2008 AND rc.name = 'Chinese Grand Prix' AND r.time IS NOT NULL;	formula_1
SELECT SUM(r.points) AS total_points FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT AVG((CAST(SUBSTR(fastestLapTime,1,INSTR(fastestLapTime,':')-1) AS REAL)*60)+CAST(SUBSTR(fastestLapTime,INSTR(fastestLapTime,':')+1) AS REAL)) FROM results JOIN drivers USING(driverId) WHERE drivers.forename='Lewis' AND drivers.surname='Hamilton' AND fastestLapTime IS NOT NULL;	formula_1
SELECT    (1.0 * SUM(CASE WHEN re.time IS NOT NULL THEN 1 ELSE 0 END)) / COUNT(*) AS completion_rate  FROM results re  JOIN races ra ON re.raceId = ra.raceId  WHERE ra.year = 2008 AND ra.name = 'Australian Grand Prix';	formula_1
SELECT ((last_driver.milliseconds - champion.milliseconds) * 100.0 / last_driver.milliseconds) AS percentage_faster FROM      (SELECT r.milliseconds       FROM results r       JOIN races rc ON r.raceId = rc.raceId       WHERE rc.year = 2008 AND rc.name = 'Australian Grand Prix' AND r.positionOrder = 1 AND r.time IS NOT NULL) champion,     (SELECT r.milliseconds       FROM results r       JOIN races rc ON r.raceId = rc.raceId       WHERE rc.year = 2008 AND rc.name = 'Australian Grand Prix' AND r.positionOrder = (SELECT MAX(positionOrder)                                                                                           FROM results r2                                                                                           JOIN races rc2 ON r2.raceId = rc2.raceId                                                                                           WHERE rc2.year = 2008 AND rc2.name = 'Australian Grand Prix' AND r2.time IS NOT NULL)       AND r.time IS NOT NULL) last_driver;	formula_1
SELECT COUNT(*) FROM circuits WHERE location = 'Adelaide' AND country = 'Australia';	formula_1
SELECT lat, lng FROM circuits WHERE country = 'USA';	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND CAST(strftime('%Y', dob) AS INTEGER) > 1980;	formula_1
SELECT MAX(cs.points) FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId WHERE c.nationality = 'British';	formula_1
SELECT c.name FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId ORDER BY cs.points DESC LIMIT 1;	formula_1
SELECT c.name  FROM constructors c  JOIN constructorResults cr ON c.constructorId = cr.constructorId  WHERE cr.raceId = 291 AND cr.points = 0;	formula_1
SELECT COUNT(*) FROM (SELECT c.constructorId FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId WHERE c.nationality = 'Japanese' AND cr.points = 0 GROUP BY c.constructorId HAVING COUNT(DISTINCT cr.raceId) = 2);	formula_1
SELECT DISTINCT c.name  FROM constructors c  JOIN constructorStandings cs ON c.constructorId = cs.constructorId  WHERE cs.position = 1;	formula_1
SELECT COUNT(DISTINCT c.constructorId) FROM constructors c JOIN results r ON c.constructorId = r.constructorId JOIN lapTimes l ON r.raceId = l.raceId AND r.driverId = l.driverId WHERE c.nationality = 'French' AND l.lap > 50;	formula_1
SELECT      (SUM(CASE WHEN res.time IS NOT NULL THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS completion_percentage FROM      results res JOIN      races rc ON res.raceId = rc.raceId JOIN      drivers d ON res.driverId = d.driverId WHERE      rc.year BETWEEN 2007 AND 2009     AND d.nationality = 'Japanese';	formula_1
SELECT      r.year,     AVG(         CAST(SUBSTR(res.time, 1, INSTR(res.time, ':') -1) * 3600 +          SUBSTR(SUBSTR(res.time, INSTR(res.time, ':') + 1), 1, INSTR(SUBSTR(res.time, INSTR(res.time, ':') + 1), ':') -1) * 60 +          SUBSTR(SUBSTR(SUBSTR(res.time, INSTR(res.time, ':') + 1), INSTR(SUBSTR(res.time, INSTR(res.time, ':') + 1), ':') + 1), 1, 2) +          SUBSTR(SUBSTR(SUBSTR(res.time, INSTR(res.time, ':') + 1), INSTR(SUBSTR(res.time, INSTR(res.time, ':') + 1), ':') + 1), 4) / 1000.0 AS REAL)     ) AS avg_time_seconds FROM results res JOIN races r ON res.raceId = r.raceId JOIN (     SELECT ds.driverId, r.year     FROM driverStandings ds     JOIN races r ON ds.raceId = r.raceId     JOIN (         SELECT year, MAX(round) AS max_round         FROM races         WHERE year < 1975         GROUP BY year     ) last_races ON r.year = last_races.year AND r.round = last_races.max_round     WHERE ds.position = 1 ) champ ON res.driverId = champ.driverId AND r.year = champ.year WHERE res.time IS NOT NULL GROUP BY r.year;	formula_1
SELECT DISTINCT d.forename, d.surname  FROM drivers d  JOIN driverStandings ds ON d.driverId = ds.driverId  WHERE YEAR(d.dob) > 1975 AND ds.position = 2;	formula_1
SELECT COUNT(DISTINCT d.driverId)  FROM drivers d  JOIN results r ON d.driverId = r.driverId  WHERE d.nationality = 'Italian' AND r.time IS NULL;	formula_1
SELECT d.forename, d.surname  FROM lapTimes lt  JOIN drivers d ON lt.driverId = d.driverId  ORDER BY lt.milliseconds ASC  LIMIT 1;	formula_1
WITH champion AS (     SELECT driverId      FROM driverStandings ds      JOIN races r ON ds.raceId = r.raceId      WHERE r.year = 2009      GROUP BY driverId      ORDER BY SUM(points) DESC      LIMIT 1 ) SELECT r.fastestLap  FROM results r  JOIN races ra ON r.raceId = ra.raceId  JOIN champion c ON r.driverId = c.driverId  WHERE ra.year = 2009 AND r.fastestLapTime IS NOT NULL  ORDER BY r.fastestLapTime  LIMIT 1;	formula_1
SELECT AVG(CAST(results.fastestLapSpeed AS REAL)) FROM results JOIN races ON results.raceId = races.raceId WHERE races.year = 2009 AND races.name = 'Spanish Grand Prix';	formula_1
SELECT races.name, races.year  FROM races  JOIN results ON races.raceId = results.raceId  WHERE results.milliseconds = (SELECT MIN(milliseconds) FROM results WHERE milliseconds IS NOT NULL);	formula_1
SELECT      (COUNT(DISTINCT CASE WHEN CAST(strftime('%Y', d.dob) AS INTEGER) < 1985 AND r.laps > 50 THEN d.driverId END) * 100.0) / COUNT(DISTINCT d.driverId) AS percentage FROM      results r JOIN      races rc ON r.raceId = rc.raceId JOIN      drivers d ON r.driverId = d.driverId WHERE      rc.year BETWEEN 2000 AND 2005;	formula_1
SELECT COUNT(DISTINCT d.driverId)  FROM drivers d  JOIN lapTimes lt ON d.driverId = lt.driverId  WHERE d.nationality = 'French'  AND (CAST(SUBSTR(lt.time, 1, INSTR(lt.time, ':') - 1) AS REAL) * 60 + CAST(SUBSTR(lt.time, INSTR(lt.time, ':') + 1) AS REAL)) < 120;	formula_1
SELECT code FROM drivers WHERE nationality = 'America';	formula_1
SELECT raceId FROM races WHERE year = 2009;	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = 18;	formula_1
SELECT code FROM drivers ORDER BY dob DESC LIMIT 3; SELECT COUNT(*) FROM (SELECT nationality FROM drivers ORDER BY dob DESC LIMIT 3) WHERE nationality = 'Dutch';	formula_1
SELECT driverRef FROM drivers WHERE forename = 'Robert' AND surname = 'Kubica';	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND strftime('%Y', dob) = '1980';	formula_1
SELECT d.forename, d.surname, MIN(l.time) AS earliest_lap_time FROM drivers d JOIN lapTimes l ON d.driverId = l.driverId WHERE d.nationality = 'German' AND strftime('%Y', d.dob) BETWEEN '1980' AND '1990' GROUP BY d.driverId ORDER BY earliest_lap_time ASC LIMIT 3;	formula_1
SELECT d.driverRef FROM drivers d WHERE d.nationality = 'German' AND d.dob = (SELECT MIN(dob) FROM drivers WHERE nationality = 'German');	formula_1
SELECT d.driverId, d.code FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE strftime('%Y', d.dob) = '1971' AND r.fastestLapTime IS NOT NULL AND r.fastestLapTime = (     SELECT MIN(r2.fastestLapTime)     FROM results r2     WHERE r2.raceId = r.raceId     AND r2.fastestLapTime IS NOT NULL );	formula_1
SELECT d.driverId, d.forename, d.surname, d.dob, MAX(l.time) AS latest_lap_time   FROM drivers d   JOIN lapTimes l ON d.driverId = l.driverId   WHERE d.nationality = 'Spanish' AND strftime('%Y', d.dob) < '1982'   GROUP BY d.driverId   ORDER BY latest_lap_time DESC   LIMIT 10;	formula_1
SELECT r.year  FROM races r  JOIN results res ON r.raceId = res.raceId  WHERE res.fastestLapTime IS NOT NULL  ORDER BY (CAST(substr(res.fastestLapTime, 1, instr(res.fastestLapTime, ':') - 1) AS INTEGER) * 60 + CAST(substr(res.fastestLapTime, instr(res.fastestLapTime, ':') + 1) AS REAL)) ASC  LIMIT 1;	formula_1
SELECT r.year  FROM lapTimes l  JOIN races r ON l.raceId = r.raceId  GROUP BY r.year  ORDER BY MAX(CAST(SUBSTR(l.time, 1, INSTR(l.time, ':') - 1) AS REAL) * 60 + CAST(SUBSTR(l.time, INSTR(l.time, ':') + 1) AS REAL)) DESC  LIMIT 1;	formula_1
SELECT driverId FROM lapTimes WHERE lap = 1 GROUP BY driverId ORDER BY MIN(milliseconds) ASC LIMIT 5;	formula_1
SELECT COUNT(*) FROM results WHERE raceId > 50 AND raceId < 100 AND statusId = 2 AND time IS NOT NULL;	formula_1
SELECT c.location, c.lat, c.lng, COUNT(r.raceId) AS times_held  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE c.country = 'Austria'  GROUP BY c.circuitId;	formula_1
SELECT r.round  FROM results res  JOIN races r ON res.raceId = r.raceId  WHERE res.time IS NOT NULL  GROUP BY res.raceId  ORDER BY COUNT(*) DESC  LIMIT 1;	formula_1
SELECT d.driverRef, d.nationality, d.dob  FROM qualifying q  JOIN drivers d ON q.driverId = d.driverId  WHERE q.raceId = 23 AND q.q2 IS NOT NULL;	formula_1
SELECT      r.year,      r.name,      r.date,      r.time  FROM      races r  JOIN      qualifying q ON r.raceId = q.raceId  JOIN      drivers d ON q.driverId = d.driverId  WHERE      d.driverId = (SELECT driverId FROM drivers ORDER BY dob DESC LIMIT 1)  ORDER BY      r.date ASC  LIMIT 1;	formula_1
SELECT COUNT(DISTINCT d.driverId)  FROM drivers d  JOIN results r ON d.driverId = r.driverId  JOIN status s ON r.statusId = s.statusId  WHERE d.nationality = 'American' AND s.status = 'Puncture';	formula_1
SELECT c.url  FROM constructors c  JOIN constructorResults cr ON c.constructorId = cr.constructorId  WHERE c.nationality = 'Italian'  GROUP BY c.constructorId  ORDER BY SUM(cr.points) DESC  LIMIT 1;	formula_1
SELECT c.url FROM constructors c JOIN (SELECT constructorId, SUM(wins) AS total_wins FROM constructorStandings GROUP BY constructorId ORDER BY total_wins DESC LIMIT 1) AS top ON c.constructorId = top.constructorId;	formula_1
SELECT d.forename, d.surname  FROM drivers d  JOIN lapTimes lt ON d.driverId = lt.driverId  JOIN races r ON lt.raceId = r.raceId  WHERE r.name = 'French Grand Prix' AND lt.lap = 3  AND lt.time = (SELECT MAX(time) FROM lapTimes JOIN races ON lapTimes.raceId = races.raceId WHERE races.name = 'French Grand Prix' AND lap = 3);	formula_1
SELECT races.raceId, MIN(lapTimes.milliseconds) AS fastest_time  FROM lapTimes  JOIN races ON lapTimes.raceId = races.raceId  WHERE lapTimes.lap = 1  GROUP BY races.raceId  ORDER BY fastest_time  LIMIT 1;	formula_1
SELECT printf('%d:%06.3f',CAST(avg_seconds/60 AS INTEGER),avg_seconds%60) FROM (SELECT AVG(CAST(SUBSTR(fastestLapTime,1,INSTR(fastestLapTime,':')-1)*60 AS REAL)+CAST(SUBSTR(fastestLapTime,INSTR(fastestLapTime,':')+1,2) AS REAL)+CAST(SUBSTR(fastestLapTime,INSTR(fastestLapTime,'.')+1) AS REAL)/1000) AS avg_seconds FROM results JOIN races ON results.raceId=races.raceId WHERE races.year=2006 AND races.name='United States Grand Prix' AND results.rank<11);	formula_1
SELECT d.forename || ' ' || d.surname AS full_name, AVG(p.milliseconds) AS avg_duration  FROM drivers d  JOIN pitStops p ON d.driverId = p.driverId  WHERE d.nationality = 'German' AND strftime('%Y', d.dob) BETWEEN '1980' AND '1985'  GROUP BY d.driverId  ORDER BY avg_duration  LIMIT 3;	formula_1
SELECT d.forename, d.surname, r.time  FROM races rc  JOIN results r ON rc.raceId = r.raceId  JOIN drivers d ON r.driverId = d.driverId  JOIN status s ON r.statusId = s.statusId  WHERE rc.name = 'Canadian Grand Prix' AND rc.year = 2008  AND r.positionOrder = 1 AND s.status = 'Finished';	formula_1
SELECT c.constructorRef, c.url FROM constructors c JOIN results r ON c.constructorId = r.constructorId JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2009 AND ra.name = 'Singapore Grand Prix' AND r.positionOrder = 1;	formula_1
SELECT forename, surname, dob FROM drivers WHERE nationality = 'Austrian' AND YEAR(dob) BETWEEN 1981 AND 1991;	formula_1
SELECT forename || ' ' || surname AS full_name, url, dob  FROM drivers  WHERE nationality = 'German'  AND strftime('%Y', dob) BETWEEN '1971' AND '1985'  ORDER BY dob DESC;	formula_1
SELECT location, country, lat, lng FROM circuits WHERE name = 'Hungaroring';	formula_1
SELECT SUM(cr.points) AS score, c.name, c.nationality FROM constructorResults cr JOIN races r ON cr.raceId = r.raceId JOIN constructors c ON cr.constructorId = c.constructorId WHERE r.name = 'Monaco Grand Prix' AND r.year BETWEEN 1980 AND 2010 GROUP BY cr.constructorId ORDER BY score DESC LIMIT 1;	formula_1
SELECT AVG(results.points) FROM results JOIN drivers ON results.driverId = drivers.driverId JOIN races ON results.raceId = races.raceId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.name = 'Turkish Grand Prix';	formula_1
SELECT AVG(races_per_year) FROM (SELECT COUNT(*) AS races_per_year FROM races WHERE date BETWEEN '2000-01-01' AND '2010-12-31' GROUP BY strftime('%Y', date)) AS sub;	formula_1
SELECT nationality, COUNT(*) AS count FROM drivers GROUP BY nationality ORDER BY count DESC LIMIT 1;	formula_1
WITH DriverTotal AS (     SELECT          driverId,         SUM(points) AS total_points,         MAX(wins) AS total_wins     FROM driverStandings     GROUP BY driverId ), RankedDrivers AS (     SELECT          driverId,         total_points,         total_wins,         ROW_NUMBER() OVER (ORDER BY total_points DESC) AS rank     FROM DriverTotal ) SELECT total_wins AS victories FROM RankedDrivers WHERE rank = 91;	formula_1
SELECT r.name  FROM races r  JOIN results res ON r.raceId = res.raceId  WHERE res.fastestLapTime = (SELECT MIN(fastestLapTime) FROM results)  LIMIT 1;	formula_1
SELECT c.location || ', ' || c.country AS full_location  FROM circuits c  JOIN races r ON c.circuitId = r.circuitId  WHERE r.date = (SELECT MAX(date) FROM races);	formula_1
SELECT d.forename || ' ' || d.surname AS full_name FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Marina Bay Street Circuit' AND r.year = 2008 AND q.q3 IS NOT NULL ORDER BY q.q3 LIMIT 1;	formula_1
SELECT      d.forename || ' ' || d.surname AS full_name,      d.nationality,      (SELECT r.name       FROM races r       JOIN results res ON r.raceId = res.raceId       WHERE res.driverId = d.driverId       ORDER BY r.date ASC       LIMIT 1) AS race_name  FROM drivers d  WHERE d.dob = (SELECT MAX(dob) FROM drivers);	formula_1
SELECT MAX(accident_count)  FROM (     SELECT res.driverId, COUNT(*) AS accident_count      FROM results res      JOIN races rc ON res.raceId = rc.raceId      WHERE rc.name = 'Canadian Grand Prix' AND res.statusId = 3      GROUP BY res.driverId );	formula_1
SELECT d.forename || ' ' || d.surname AS full_name, COUNT(r.resultId) AS wins  FROM drivers d  LEFT JOIN results r ON d.driverId = r.driverId AND r.positionOrder = 1  WHERE d.dob = (SELECT MIN(dob) FROM drivers)  GROUP BY d.driverId, d.forename, d.surname;	formula_1
SELECT MAX(milliseconds) AS longest_pitstop FROM pitStops;	formula_1
SELECT time FROM lapTimes WHERE milliseconds = (SELECT MIN(milliseconds) FROM lapTimes);	formula_1
SELECT MAX(p.duration)  FROM pitStops p  JOIN drivers d ON p.driverId = d.driverId  WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT ps.lap  FROM pitStops ps  JOIN drivers d ON ps.driverId = d.driverId  JOIN races r ON ps.raceId = r.raceId  WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton'  AND r.year = 2011 AND r.name = 'Australian Grand Prix';	formula_1
SELECT d.forename, d.surname, SUM(p.milliseconds)/1000.0 AS total_pit_time  FROM pitStops p  JOIN drivers d ON p.driverId = d.driverId  JOIN races r ON p.raceId = r.raceId  WHERE r.year = 2011 AND r.name = 'Australian Grand Prix'  GROUP BY p.driverId;	formula_1
SELECT lt.time, lt.milliseconds, lt.lap, c.name AS circuitName, r.year  FROM lapTimes lt  JOIN drivers d ON d.driverId = lt.driverId  JOIN races r ON r.raceId = lt.raceId  JOIN circuits c ON c.circuitId = r.circuitId  WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton'  ORDER BY lt.milliseconds ASC  LIMIT 1;	formula_1
SELECT      d.forename || ' ' || d.surname AS full_name FROM      drivers d JOIN      lapTimes lt ON d.driverId = lt.driverId ORDER BY      lt.milliseconds ASC LIMIT 20;	formula_1
SELECT c.name, l.position  FROM drivers d  JOIN lapTimes l ON d.driverId = l.driverId  JOIN races r ON l.raceId = r.raceId  JOIN circuits c ON r.circuitId = c.circuitId  WHERE d.surname = 'Hamilton'  AND l.time = (SELECT MIN(time) FROM lapTimes WHERE driverId = d.driverId)  LIMIT 1;	formula_1
SELECT lt.time AS lap_record  FROM circuits c  JOIN races r ON c.circuitId = r.circuitId  JOIN lapTimes lt ON r.raceId = lt.raceId  WHERE c.name = 'Austrian Grand Prix Circuit'  ORDER BY lt.milliseconds ASC  LIMIT 1;	formula_1
SELECT      c.name AS circuit_name,      d.forename || ' ' || d.surname AS driver_name,      MIN(lt.time) AS lap_time,      MIN(lt.milliseconds) AS milliseconds  FROM circuits c  JOIN races r ON c.circuitId = r.circuitId  JOIN lapTimes lt ON r.raceId = lt.raceId  JOIN drivers d ON lt.driverId = d.driverId  WHERE c.country = 'Italy'  GROUP BY c.circuitId;	formula_1
SELECT races.year, races.name  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  JOIN lapTimes ON races.raceId = lapTimes.raceId  WHERE circuits.name = 'Austrian Grand Prix Circuit'  ORDER BY lapTimes.milliseconds ASC  LIMIT 1;	formula_1
WITH fastest_lap AS (     SELECT l.raceId, l.driverId     FROM lapTimes l     JOIN races r ON l.raceId = r.raceId     WHERE r.circuitId = (SELECT circuitId FROM circuits WHERE country = 'Austria')     ORDER BY l.milliseconds ASC     LIMIT 1 ) SELECT SUM(p.milliseconds) AS total_pit_duration FROM pitStops p INNER JOIN fastest_lap fl ON p.raceId = fl.raceId AND p.driverId = fl.driverId;	formula_1
SELECT c.lat, c.lng FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN results res ON r.raceId = res.raceId GROUP BY c.circuitId HAVING MIN(res.fastestLapTime) = '1:29.488';	formula_1
SELECT AVG(p.milliseconds)  FROM pitStops p  JOIN drivers d ON p.driverId = d.driverId  WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT AVG(l.milliseconds) FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN lapTimes l ON r.raceId = l.raceId WHERE c.country = 'Italy';	formula_1
SELECT player_api_id FROM Player_Attributes WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes) LIMIT 1;	european_football_2
SELECT p.player_name, p.height FROM Player p WHERE p.height = (SELECT MAX(height) FROM Player);	european_football_2
SELECT preferred_foot FROM Player_Attributes WHERE potential = (SELECT MIN(potential) FROM Player_Attributes);	european_football_2
SELECT COUNT(DISTINCT pa.player_api_id)  FROM Player_Attributes pa  WHERE pa.overall_rating >= 60    AND pa.overall_rating < 65    AND pa.defensive_work_rate = 'low';	european_football_2
SELECT player_api_id  FROM Player_Attributes  GROUP BY player_api_id  ORDER BY MAX(crossing) DESC  LIMIT 5;	european_football_2
SELECT l.name  FROM Match m  JOIN League l ON m.league_id = l.id  WHERE m.season = '2015/2016'  GROUP BY m.league_id  ORDER BY SUM(m.home_team_goal + m.away_team_goal) DESC  LIMIT 1;	european_football_2
WITH Losses AS (     SELECT home_team_api_id,             SUM(CASE WHEN home_team_goal < away_team_goal THEN 1 ELSE 0 END) AS loss_count     FROM Match     WHERE season = '2015/2016'     GROUP BY home_team_api_id ) SELECT t.team_long_name FROM Losses l JOIN Team t ON l.home_team_api_id = t.team_api_id WHERE l.loss_count = (SELECT MIN(loss_count) FROM Losses);	european_football_2
SELECT p.player_name  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  GROUP BY p.player_api_id  ORDER BY MAX(pa.penalties) DESC  LIMIT 10;	european_football_2
SELECT t.team_long_name  FROM Match m  JOIN League l ON m.league_id = l.id  JOIN Team t ON m.away_team_api_id = t.team_api_id  WHERE l.name = 'Scotland Premier League'    AND m.season = '2009/2010'    AND m.away_team_goal > m.home_team_goal  GROUP BY m.away_team_api_id  ORDER BY COUNT(*) DESC  LIMIT 1;	european_football_2
SELECT t.team_long_name, MAX(ta.buildUpPlaySpeed) AS buildUpPlaySpeed  FROM Team_Attributes ta  JOIN Team t ON ta.team_api_id = t.team_api_id  GROUP BY ta.team_api_id  ORDER BY buildUpPlaySpeed DESC  LIMIT 4;	european_football_2
SELECT l.name  FROM Match m  JOIN League l ON m.league_id = l.id  WHERE m.season = '2015/2016' AND m.home_team_goal = m.away_team_goal  GROUP BY m.league_id  ORDER BY COUNT(*) DESC  LIMIT 1;	european_football_2
SELECT DISTINCT p.player_name,         (strftime('%Y', 'now') - strftime('%Y', p.birthday)) -         (strftime('%m-%d', 'now') < strftime('%m-%d', p.birthday)) AS age FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.sprint_speed >= 97    AND strftime('%Y', pa.date) BETWEEN '2013' AND '2015';	european_football_2
SELECT l.name, COUNT(*) AS num_matches  FROM Match m  JOIN League l ON m.league_id = l.id  GROUP BY m.league_id  ORDER BY num_matches DESC  LIMIT 1;	european_football_2
SELECT AVG(height) AS average_height FROM Player WHERE birthday >= '1990-01-01' AND birthday < '1996-01-01';	european_football_2
SELECT pa.player_api_id  FROM Player_Attributes pa  WHERE SUBSTR(pa.date, 1, 4) = '2010'  AND pa.overall_rating = (     SELECT MAX(overall_rating)      FROM Player_Attributes      WHERE SUBSTR(date, 1, 4) = '2010' );	european_football_2
SELECT team_fifa_api_id FROM Team_Attributes WHERE buildUpPlaySpeed > 50 AND buildUpPlaySpeed < 60;	european_football_2
SELECT DISTINCT t.team_long_name  FROM Team t  JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id  WHERE strftime('%Y', ta.date) = '2012'  AND ta.buildUpPlayPassing > (     SELECT AVG(buildUpPlayPassing)      FROM Team_Attributes      WHERE strftime('%Y', date) = '2012' AND buildUpPlayPassing IS NOT NULL );	european_football_2
WITH LatestPlayerAttributes AS (   SELECT      player_api_id,     preferred_foot,     ROW_NUMBER() OVER (PARTITION BY player_api_id ORDER BY date DESC) AS rn   FROM Player_Attributes ) SELECT    (COUNT(CASE WHEN lpa.preferred_foot = 'left' THEN 1 END) * 100.0) / COUNT(*) AS percentage FROM Player p JOIN LatestPlayerAttributes lpa ON p.player_api_id = lpa.player_api_id AND lpa.rn = 1 WHERE strftime('%Y', p.birthday) BETWEEN '1987' AND '1992';	european_football_2
SELECT l.name AS league_name, SUM(m.home_team_goal + m.away_team_goal) AS total_goals FROM Match m JOIN League l ON m.league_id = l.id GROUP BY l.name ORDER BY total_goals ASC LIMIT 5;	european_football_2
SELECT SUM(pa.long_shots) / COUNT(pa.player_fifa_api_id) FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name = 'Ahmed Samir Farag';	european_football_2
SELECT p.player_name  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.height > 180  GROUP BY p.player_api_id  ORDER BY AVG(pa.heading_accuracy) DESC  LIMIT 10;	european_football_2
SELECT t.team_long_name  FROM Team t  JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id  WHERE ta.buildUpPlayDribblingClass = 'Normal'    AND ta.date >= '2014-01-01 00:00:00'    AND ta.date <= '2014-01-31 00:00:00'  GROUP BY t.team_long_name  HAVING AVG(ta.chanceCreationPassing) < (      SELECT AVG(chanceCreationPassing)      FROM Team_Attributes      WHERE buildUpPlayDribblingClass = 'Normal'        AND date >= '2014-01-01 00:00:00'        AND date <= '2014-01-31 00:00:00'  )  ORDER BY AVG(ta.chanceCreationPassing) DESC;	european_football_2
SELECT League.name  FROM Match  JOIN League ON Match.league_id = League.id  WHERE Match.season = '2009/2010'  GROUP BY League.name  HAVING AVG(Match.home_team_goal) > AVG(Match.away_team_goal);	european_football_2
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers';	european_football_2
SELECT player_name  FROM Player  WHERE strftime('%Y', birthday) = '1970'    AND strftime('%m', birthday) = '10';	european_football_2
SELECT p_a.attacking_work_rate FROM Player p JOIN Player_Attributes p_a ON p.player_api_id = p_a.player_api_id WHERE p.player_name = 'Franco Zennaro' ORDER BY p_a.date DESC LIMIT 1;	european_football_2
SELECT ta.buildUpPlayPositioningClass  FROM Team_Attributes ta  JOIN Team t ON ta.team_api_id = t.team_api_id AND ta.team_fifa_api_id = t.team_fifa_api_id  WHERE t.team_long_name = 'ADO Den Haag';	european_football_2
SELECT pa.heading_accuracy FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name = 'Francois Affolter' AND pa.date = '2014-09-18 00:00:00';	european_football_2
SELECT pa.overall_rating  FROM Player_Attributes pa  JOIN Player p ON pa.player_api_id = p.player_api_id  WHERE p.player_name = 'Gabriel Tamas'  AND strftime('%Y', pa.date) = '2011';	european_football_2
SELECT COUNT(*)  FROM Match  JOIN League ON Match.league_id = League.id  WHERE League.name = 'Scotland Premier League'  AND Match.season = '2015/2016';	european_football_2
SELECT pa.preferred_foot FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.birthday = (SELECT MAX(birthday) FROM Player) ORDER BY pa.date DESC LIMIT 1;	european_football_2
SELECT DISTINCT p.player_name  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE pa.potential = (SELECT MAX(potential) FROM Player_Attributes);	european_football_2
SELECT COUNT(DISTINCT P.id)  FROM Player AS P JOIN Player_Attributes AS PA ON P.player_api_id = PA.player_api_id WHERE P.weight < 130 AND PA.preferred_foot = 'left';	european_football_2
SELECT DISTINCT t.team_short_name  FROM Team t  JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id  WHERE ta.chanceCreationPassingClass = 'Risky';	european_football_2
SELECT pa.defensive_work_rate  FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.player_name = 'David Wilson'  ORDER BY pa.date DESC  LIMIT 1;	european_football_2
SELECT p.birthday  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE pa.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)  LIMIT 1;	european_football_2
SELECT l.name  FROM League AS l  JOIN Country AS c ON l.country_id = c.id  WHERE c.name = 'Netherlands';	european_football_2
SELECT AVG(M.home_team_goal)  FROM Match AS M  JOIN Country AS C ON M.country_id = C.id  WHERE C.name = 'Poland' AND M.season = '2010/2011';	european_football_2
WITH player_avg AS (     SELECT p.player_api_id, AVG(pa.finishing) AS avg_finish, p.height      FROM Player p      JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id      GROUP BY p.player_api_id ),  max_min_heights AS (     SELECT MAX(height) AS max_h, MIN(height) AS min_h FROM Player ),  tallest_avg AS (     SELECT AVG(avg_finish) AS t_avg      FROM player_avg      WHERE height = (SELECT max_h FROM max_min_heights) ),  shortest_avg AS (     SELECT AVG(avg_finish) AS s_avg      FROM player_avg      WHERE height = (SELECT min_h FROM max_min_heights) ) SELECT CASE WHEN t_avg > s_avg THEN 'tallest' ELSE 'shortest' END AS group_with_highest_avg,         MAX(t_avg, s_avg) AS highest_average_finishing  FROM tallest_avg, shortest_avg;	european_football_2
SELECT player_name FROM Player WHERE height > 180;	european_football_2
SELECT COUNT(*) FROM Player WHERE strftime('%Y', birthday) > '1990';	european_football_2
SELECT COUNT(*) FROM Player WHERE (player_name LIKE 'Adam %' OR player_name = 'Adam') AND weight > 170;	european_football_2
SELECT DISTINCT p.player_name  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE pa.overall_rating > 80  AND strftime('%Y', pa.date) BETWEEN '2008' AND '2010';	european_football_2
SELECT pa.potential FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name = 'Aaron Doran' ORDER BY pa.date DESC LIMIT 1;	european_football_2
SELECT DISTINCT p.player_name  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE pa.preferred_foot = 'left';	european_football_2
SELECT DISTINCT t.team_long_name  FROM Team t  JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id  WHERE ta.buildUpPlaySpeedClass = 'Fast';	european_football_2
SELECT t_a."buildUpPlayPassingClass" FROM Team_Attributes t_a JOIN Team t ON t_a.team_api_id = t.team_api_id WHERE t.team_short_name = 'CLB' ORDER BY t_a.date DESC LIMIT 1;	european_football_2
SELECT DISTINCT t.team_short_name  FROM Team t  JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id  WHERE ta.buildUpPlayPassing > 70;	european_football_2
SELECT AVG(pa.overall_rating)  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.height > 170  AND strftime('%Y', pa.date) BETWEEN '2010' AND '2015';	european_football_2
SELECT player_name, height FROM Player WHERE height = (SELECT MIN(height) FROM Player);	european_football_2
SELECT Country.name  FROM League  JOIN Country ON League.country_id = Country.id  WHERE League.name = 'Italy Serie A';	european_football_2
SELECT t.team_short_name  FROM Team_Attributes ta  JOIN Team t ON ta.team_api_id = t.team_api_id  WHERE ta.buildUpPlaySpeed = 31    AND ta.buildUpPlayDribbling = 53    AND ta.buildUpPlayPassing = 32;	european_football_2
SELECT AVG(pa.overall_rating) FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name = 'Aaron Doran';	european_football_2
SELECT COUNT(*)  FROM Match  JOIN League ON Match.league_id = League.id  WHERE League.name = 'Germany 1. Bundesliga'    AND strftime('%Y-%m', Match.date) BETWEEN '2008-08' AND '2008-10';	european_football_2
SELECT DISTINCT t.team_short_name  FROM Team t  JOIN Match m ON t.team_api_id = m.home_team_api_id  WHERE m.home_team_goal = 10;	european_football_2
SELECT DISTINCT p.player_name  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE pa.potential = 61  AND pa.balance = (SELECT MAX(balance) FROM Player_Attributes);	european_football_2
SELECT      (AVG(CASE WHEN p.player_name = 'Abdou Diallo' THEN pa.ball_control END) -       AVG(CASE WHEN p.player_name = 'Aaron Appindangoye' THEN pa.ball_control END))      AS difference  FROM Player_Attributes pa  JOIN Player p ON pa.player_api_id = p.player_api_id  WHERE p.player_name IN ('Abdou Diallo', 'Aaron Appindangoye');	european_football_2
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN';	european_football_2
SELECT p1.player_name  FROM Player p1  WHERE p1.player_name = 'Aaron Lennon'  UNION ALL  SELECT p2.player_name  FROM Player p2  WHERE p2.player_name = 'Abdelaziz Barrada'  ORDER BY p1.birthday, p2.birthday  LIMIT 1;	european_football_2
SELECT player_name FROM Player WHERE height = (SELECT MAX(height) FROM Player);	european_football_2
SELECT COUNT(*)  FROM Player_Attributes  WHERE preferred_foot = 'left' AND attacking_work_rate = 'low';	european_football_2
SELECT c.name  FROM League l  JOIN Country c ON l.country_id = c.id  WHERE l.name = 'Belgium Jupiler League';	european_football_2
SELECT l.name FROM League l JOIN Country c ON l.country_id = c.id WHERE c.name = 'Germany';	european_football_2
SELECT DISTINCT p.player_name  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE pa.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT COUNT(DISTINCT p.player_api_id)  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE strftime('%Y', p.birthday) < '1986'    AND pa.defensive_work_rate = 'high';	european_football_2
SELECT p.player_name, MAX(pa.crossing) AS max_crossing  FROM Player AS p  JOIN Player_Attributes AS pa ON p.player_api_id = pa.player_api_id  WHERE p.player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone')  GROUP BY p.player_name  ORDER BY max_crossing DESC  LIMIT 1;	european_football_2
SELECT pa.heading_accuracy FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name = 'Ariel Borysiuk' ORDER BY pa.date DESC LIMIT 1;	european_football_2
SELECT COUNT(DISTINCT Player.player_api_id) FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE Player.height > 180 AND Player_Attributes.volleys > 70;	european_football_2
SELECT DISTINCT p.player_name  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE pa.volleys > 70 AND pa.dribbling > 70;	european_football_2
SELECT COUNT(*) FROM Match JOIN Country ON Match.country_id = Country.id WHERE Country.name = 'Belgium' AND Match.season = '2008/2009';	european_football_2
SELECT pa.long_passing  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.birthday = (SELECT MIN(birthday) FROM Player)  ORDER BY pa.date DESC  LIMIT 1;	european_football_2
SELECT COUNT(*)  FROM Match  JOIN League ON Match.league_id = League.id  WHERE League.name = 'Belgium Jupiler League'    AND SUBSTR(Match.date, 1, 7) = '2009-04';	european_football_2
SELECT l.name  FROM Match m  JOIN League l ON m.league_id = l.id  WHERE m.season = '2008/2009'  GROUP BY m.league_id  ORDER BY COUNT(*) DESC  LIMIT 1;	european_football_2
SELECT AVG(pa.overall_rating) FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id OR p.player_fifa_api_id = pa.player_fifa_api_id WHERE strftime('%Y', p.birthday) < '1986';	european_football_2
WITH Ariel AS (     SELECT overall_rating      FROM Player_Attributes      WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Ariel Borysiuk')      ORDER BY date DESC      LIMIT 1 ),  Paulin AS (     SELECT overall_rating      FROM Player_Attributes      WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Paulin Puel')      ORDER BY date DESC      LIMIT 1 ) SELECT ((Ariel.overall_rating - Paulin.overall_rating) * 100.0 / Paulin.overall_rating) AS percentage_higher  FROM Ariel, Paulin;	european_football_2
SELECT AVG(ta.buildUpPlaySpeed)  FROM Team_Attributes ta  JOIN Team t ON ta.team_api_id = t.team_api_id  WHERE t.team_long_name = 'Heart of Midlothian';	european_football_2
SELECT AVG(pa.overall_rating)  FROM Player_Attributes pa  JOIN Player p ON pa.player_api_id = p.player_api_id  WHERE p.player_name = 'Pietro Marino';	european_football_2
SELECT SUM(pa.crossing) FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name = 'Aaron Lennox';	european_football_2
SELECT ta.chanceCreationPassing, ta.chanceCreationPassingClass FROM Team_Attributes ta JOIN Team t ON ta.team_api_id = t.team_api_id WHERE t.team_long_name = 'Ajax' AND ta.chanceCreationPassing = (SELECT MAX(chanceCreationPassing) FROM Team_Attributes ta2 JOIN Team t2 ON ta2.team_api_id = t2.team_api_id WHERE t2.team_long_name = 'Ajax') LIMIT 1;	european_football_2
SELECT pa.preferred_foot  FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.player_name = 'Abdou Diallo'  ORDER BY pa.date DESC  LIMIT 1;	european_football_2
SELECT MAX(pa.overall_rating)  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.player_name = 'Dorlan Pabon';	european_football_2
SELECT AVG(M.away_team_goal)  FROM Match AS M  JOIN Team AS T ON M.away_team_api_id = T.team_api_id  WHERE T.team_long_name = 'Parma' AND M.country_id = 10257;	european_football_2
SELECT p.player_name  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE pa.overall_rating = 77    AND pa.date LIKE '2016-06-23%'  ORDER BY p.birthday ASC  LIMIT 1;	european_football_2
SELECT p_a.overall_rating  FROM Player AS p  JOIN Player_Attributes AS p_a ON p.player_api_id = p_a.player_api_id  WHERE p.player_name = 'Aaron Mooy' AND p_a.date LIKE '2016-02-04%';	european_football_2
SELECT Player_Attributes.potential FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE Player.player_name = 'Francesco Parravicini' AND Player_Attributes.date = '2010-08-30 00:00:00';	european_football_2
SELECT Player_Attributes.attacking_work_rate FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE Player.player_name = 'Francesco Migliore' AND Player_Attributes.date LIKE '2015-05-01%';	european_football_2
SELECT pa.defensive_work_rate  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.player_name = 'Kevin Berigaud' AND pa.date = '2013-02-22 00:00:00';	european_football_2
SELECT pa.date  FROM Player_Attributes pa  JOIN Player p ON pa.player_api_id = p.player_api_id  WHERE p.player_name = 'Kevin Constant'  AND pa.crossing = (SELECT MAX(crossing) FROM Player_Attributes WHERE player_api_id = p.player_api_id)  ORDER BY pa.date ASC  LIMIT 1;	european_football_2
SELECT Team_Attributes.buildUpPlaySpeedClass  FROM Team_Attributes  JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id  WHERE Team.team_long_name = 'Willem II' AND Team_Attributes.date = '2012-02-22';	european_football_2
SELECT Team_Attributes.buildUpPlayDribblingClass FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE Team.team_short_name = 'LEI' AND Team_Attributes.date = '2015-09-10 00:00:00';	european_football_2
SELECT Team_Attributes.buildUpPlayPassingClass FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE Team.team_long_name = 'FC Lorient' AND Team_Attributes.date LIKE '2010-02-22%';	european_football_2
SELECT ta.`chanceCreationPassingClass`  FROM Team_Attributes ta  JOIN Team t ON ta.team_api_id = t.team_api_id  WHERE t.team_long_name = 'PEC Zwolle' AND ta.date = '2013-09-20 00:00:00';	european_football_2
SELECT Team_Attributes.chanceCreationCrossingClass FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE Team.team_long_name = 'Hull City' AND Team_Attributes.date = '2010-02-22 00:00:00';	european_football_2
SELECT Team_Attributes.defenceAggressionClass FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE Team.team_long_name = 'Hannover 96' AND Team_Attributes.date LIKE '2015-09-10%';	european_football_2
SELECT AVG(pa.overall_rating)  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.player_name = 'Marko Arnautovic'  AND SUBSTR(pa.date, 1, 10) BETWEEN '2007-02-22' AND '2016-04-21';	european_football_2
SELECT ((Landon.overall_rating - Jordan.overall_rating) * 100.0 / Landon.overall_rating) AS percentage_higher FROM (SELECT pa.overall_rating        FROM Player p        JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id        WHERE p.player_name = 'Landon Donovan' AND DATE(pa.date) = '2013-07-12') AS Landon,      (SELECT pa.overall_rating        FROM Player p        JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id        WHERE p.player_name = 'Jordan Bowery' AND DATE(pa.date) = '2013-07-12') AS Jordan;	european_football_2
SELECT p.player_name  FROM Player p  WHERE p.height = (SELECT MAX(height) FROM Player);	european_football_2
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10;	european_football_2
SELECT player_name  FROM Player  WHERE DATE(birthday) <= DATE('now', '-35 years');	european_football_2
SELECT SUM(M.home_team_goal)  FROM Match M  JOIN Player P ON P.player_api_id IN (M.home_player_1, M.home_player_2, M.home_player_3, M.home_player_4, M.home_player_5, M.home_player_6, M.home_player_7, M.home_player_8, M.home_player_9, M.home_player_10, M.home_player_11)  WHERE P.player_name = 'Aaron Lennon';	european_football_2
SELECT SUM(m.away_team_goal)  FROM Match m  WHERE EXISTS (     SELECT 1      FROM Player p      WHERE p.player_name IN ('Daan Smith', 'Filipe Ferreira')      AND p.player_api_id IN (         m.away_player_1, m.away_player_2, m.away_player_3, m.away_player_4, m.away_player_5,          m.away_player_6, m.away_player_7, m.away_player_8, m.away_player_9, m.away_player_10, m.away_player_11     ) );	european_football_2
SELECT SUM(M.home_team_goal) AS total_goals FROM Match M WHERE M.home_player_1 IS NOT NULL AND M.home_player_2 IS NOT NULL AND M.home_player_3 IS NOT NULL AND M.home_player_4 IS NOT NULL AND M.home_player_5 IS NOT NULL AND M.home_player_6 IS NOT NULL AND M.home_player_7 IS NOT NULL AND M.home_player_8 IS NOT NULL AND M.home_player_9 IS NOT NULL AND M.home_player_10 IS NOT NULL AND M.home_player_11 IS NOT NULL AND NOT EXISTS (SELECT 1 FROM Player P WHERE P.player_api_id IN (M.home_player_1, M.home_player_2, M.home_player_3, M.home_player_4, M.home_player_5, M.home_player_6, M.home_player_7, M.home_player_8, M.home_player_9, M.home_player_10, M.home_player_11) AND (julianday('now') - julianday(P.birthday)) / 365.25 > 30);	european_football_2
SELECT p.player_name  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE pa.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)  GROUP BY p.player_name  LIMIT 1;	european_football_2
SELECT DISTINCT p.player_name  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE pa.potential = (SELECT MAX(potential) FROM Player_Attributes);	european_football_2
SELECT DISTINCT p.player_name  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE pa.attacking_work_rate = 'high';	european_football_2
SELECT p.player_name  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE pa.finishing = 1  ORDER BY p.birthday ASC  LIMIT 1;	european_football_2
SELECT DISTINCT p.player_name  FROM Player p  JOIN Match m      ON p.player_api_id IN (         m.home_player_1, m.home_player_2, m.home_player_3, m.home_player_4, m.home_player_5,          m.home_player_6, m.home_player_7, m.home_player_8, m.home_player_9, m.home_player_10,          m.home_player_11, m.away_player_1, m.away_player_2, m.away_player_3, m.away_player_4,          m.away_player_5, m.away_player_6, m.away_player_7, m.away_player_8, m.away_player_9,          m.away_player_10, m.away_player_11     )  JOIN League l ON m.league_id = l.id  JOIN Country c ON l.country_id = c.id  WHERE c.name = 'Belgium';	european_football_2
SELECT DISTINCT p.player_name, c.name AS country  FROM Player_Attributes pa  JOIN Player p ON pa.player_api_id = p.player_api_id  JOIN Match m ON pa.player_api_id IN (m.home_player_1, m.home_player_2, m.home_player_3, m.home_player_4, m.home_player_5, m.home_player_6, m.home_player_7, m.home_player_8, m.home_player_9, m.home_player_10, m.home_player_11, m.away_player_1, m.away_player_2, m.away_player_3, m.away_player_4, m.away_player_5, m.away_player_6, m.away_player_7, m.away_player_8, m.away_player_9, m.away_player_10, m.away_player_11)  JOIN Country c ON m.country_id = c.id  WHERE pa.vision > 89;	european_football_2
WITH PlayerCountries AS (     SELECT home_player_1 AS player_id, country_id FROM Match WHERE home_player_1 IS NOT NULL     UNION ALL     SELECT home_player_2, country_id FROM Match WHERE home_player_2 IS NOT NULL     UNION ALL     SELECT home_player_3, country_id FROM Match WHERE home_player_3 IS NOT NULL     UNION ALL     SELECT home_player_4, country_id FROM Match WHERE home_player_4 IS NOT NULL     UNION ALL     SELECT home_player_5, country_id FROM Match WHERE home_player_5 IS NOT NULL     UNION ALL     SELECT home_player_6, country_id FROM Match WHERE home_player_6 IS NOT NULL     UNION ALL     SELECT home_player_7, country_id FROM Match WHERE home_player_7 IS NOT NULL     UNION ALL     SELECT home_player_8, country_id FROM Match WHERE home_player_8 IS NOT NULL     UNION ALL     SELECT home_player_9, country_id FROM Match WHERE home_player_9 IS NOT NULL     UNION ALL     SELECT home_player_10, country_id FROM Match WHERE home_player_10 IS NOT NULL     UNION ALL     SELECT home_player_11, country_id FROM Match WHERE home_player_11 IS NOT NULL     UNION ALL     SELECT away_player_1, country_id FROM Match WHERE away_player_1 IS NOT NULL     UNION ALL     SELECT away_player_2, country_id FROM Match WHERE away_player_2 IS NOT NULL     UNION ALL     SELECT away_player_3, country_id FROM Match WHERE away_player_3 IS NOT NULL     UNION ALL     SELECT away_player_4, country_id FROM Match WHERE away_player_4 IS NOT NULL     UNION ALL     SELECT away_player_5, country_id FROM Match WHERE away_player_5 IS NOT NULL     UNION ALL     SELECT away_player_6, country_id FROM Match WHERE away_player_6 IS NOT NULL     UNION ALL     SELECT away_player_7, country_id FROM Match WHERE away_player_7 IS NOT NULL     UNION ALL     SELECT away_player_8, country_id FROM Match WHERE away_player_8 IS NOT NULL     UNION ALL     SELECT away_player_9, country_id FROM Match WHERE away_player_9 IS NOT NULL     UNION ALL     SELECT away_player_10, country_id FROM Match WHERE away_player_10 IS NOT NULL     UNION ALL     SELECT away_player_11, country_id FROM Match WHERE away_player_11 IS NOT NULL ),  DistinctPlayerCountries AS (     SELECT DISTINCT player_id, country_id FROM PlayerCountries ) SELECT co.name  FROM DistinctPlayerCountries dpc JOIN Player p ON dpc.player_id = p.player_api_id JOIN Country co ON dpc.country_id = co.id GROUP BY co.id ORDER BY AVG(p.weight) DESC LIMIT 1;	european_football_2
SELECT DISTINCT t.team_long_name  FROM Team t  JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id  WHERE ta.buildUpPlaySpeedClass = 'Slow';	european_football_2
SELECT DISTINCT t.team_short_name  FROM Team t  JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id  WHERE ta.chanceCreationPassingClass = 'Safe';	european_football_2
SELECT AVG(p.height)  FROM Player p  WHERE p.player_api_id IN (     SELECT home_player_1 FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Italy Serie A')      UNION      SELECT home_player_2 FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Italy Serie A')      UNION      SELECT home_player_3 FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Italy Serie A')      UNION      SELECT home_player_4 FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Italy Serie A')      UNION      SELECT home_player_5 FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Italy Serie A')      UNION      SELECT home_player_6 FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Italy Serie A')      UNION      SELECT home_player_7 FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Italy Serie A')      UNION      SELECT home_player_8 FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Italy Serie A')      UNION      SELECT home_player_9 FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Italy Serie A')      UNION      SELECT home_player_10 FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Italy Serie A')      UNION      SELECT home_player_11 FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Italy Serie A')      UNION      SELECT away_player_1 FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Italy Serie A')      UNION      SELECT away_player_2 FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Italy Serie A')      UNION      SELECT away_player_3 FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Italy Serie A')      UNION      SELECT away_player_4 FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Italy Serie A')      UNION      SELECT away_player_5 FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Italy Serie A')      UNION      SELECT away_player_6 FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Italy Serie A')      UNION      SELECT away_player_7 FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Italy Serie A')      UNION      SELECT away_player_8 FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Italy Serie A')      UNION      SELECT away_player_9 FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Italy Serie A')      UNION      SELECT away_player_10 FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Italy Serie A')      UNION      SELECT away_player_11 FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Italy Serie A') );	european_football_2
SELECT player_name  FROM Player  WHERE height > 180  ORDER BY player_name  LIMIT 3;	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND birthday > '1990-12-31';	european_football_2
SELECT (SELECT a.jumping FROM Player_Attributes a JOIN Player p ON a.player_api_id = p.player_api_id WHERE p.id = 6 ORDER BY a.date DESC LIMIT 1) - (SELECT a.jumping FROM Player_Attributes a JOIN Player p ON a.player_api_id = p.player_api_id WHERE p.id = 23 ORDER BY a.date DESC LIMIT 1) AS difference;	european_football_2
SELECT pa.player_api_id FROM Player_Attributes pa JOIN (     SELECT player_api_id, MAX(date) AS max_date     FROM Player_Attributes     GROUP BY player_api_id ) latest ON pa.player_api_id = latest.player_api_id AND pa.date = latest.max_date WHERE pa.preferred_foot = 'right' ORDER BY pa.potential ASC LIMIT 5;	european_football_2
SELECT COUNT(DISTINCT pa.player_api_id)  FROM Player_Attributes pa  WHERE pa.preferred_foot = 'left'  AND pa.crossing = (SELECT MAX(crossing) FROM Player_Attributes);	european_football_2
SELECT (COUNT(DISTINCT CASE WHEN strength > 80 AND stamina > 80 THEN player_api_id END) * 100.0) / COUNT(DISTINCT player_api_id) AS percentage FROM Player_Attributes;	european_football_2
SELECT c.name  FROM League l  JOIN Country c ON l.country_id = c.id  WHERE l.name = 'Poland Ekstraklasa';	european_football_2
SELECT home_team.team_long_name AS home_team, away_team.team_long_name AS away_team, home_team_goal, away_team_goal  FROM Match  INNER JOIN League ON Match.league_id = League.id  INNER JOIN Team home_team ON Match.home_team_api_id = home_team.team_api_id  INNER JOIN Team away_team ON Match.away_team_api_id = away_team.team_api_id  WHERE League.name = 'Belgium Jupiler League' AND date LIKE '2008-09-24%';	european_football_2
SELECT Player_Attributes.sprint_speed, Player_Attributes.agility, Player_Attributes.acceleration FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE Player.player_name = 'Alexis Blin' ORDER BY Player_Attributes.date DESC LIMIT 1;	european_football_2
SELECT Team_Attributes.buildUpPlaySpeedClass FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE Team.team_long_name = 'KSV Cercle Brugge' ORDER BY Team_Attributes.date DESC LIMIT 1;	european_football_2
SELECT COUNT(*) FROM Match JOIN League ON Match.league_id = League.id WHERE League.name = 'Italy Serie A' AND Match.season = '2015/2016';	european_football_2
SELECT MAX(M.home_team_goal)  FROM Match AS M  JOIN League AS L ON M.league_id = L.id  WHERE L.name = 'Netherlands Eredivisie';	european_football_2
SELECT p.player_api_id, pa.finishing AS finishing_rate, pa.curve AS curve_score  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.weight = (SELECT MAX(weight) FROM Player)  GROUP BY p.player_api_id  HAVING pa.date = MAX(pa.date);	european_football_2
SELECT l.name, COUNT(m.id) AS game_count  FROM Match m  JOIN League l ON m.league_id = l.id  WHERE m.season = '2015/2016'  GROUP BY l.name  ORDER BY game_count DESC  LIMIT 4;	european_football_2
SELECT t.team_long_name  FROM Team t  JOIN Match m ON t.team_api_id = m.away_team_api_id  WHERE m.away_team_goal = (SELECT MAX(away_team_goal) FROM Match)  GROUP BY t.team_long_name  LIMIT 1;	european_football_2
SELECT p.player_name  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE pa.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)  LIMIT 1;	european_football_2
SELECT      (SELECT COUNT(*)       FROM Player p       WHERE p.height < 180         AND EXISTS (SELECT 1                     FROM Player_Attributes pa                     WHERE pa.player_api_id = p.player_api_id                       AND pa.strength > 70)) * 100.0 /     (SELECT COUNT(*)       FROM Player       WHERE height < 180) AS percentage;	european_football_2
WITH counts AS (     SELECT          SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) AS in_patient,         SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END) AS outpatient     FROM Patient     WHERE SEX = 'M' ) SELECT      CASE          WHEN in_patient > outpatient THEN 'in-patient'          ELSE 'outpatient'      END AS more_group,     CASE          WHEN outpatient = 0 THEN              CASE WHEN in_patient = 0 THEN 0 ELSE NULL END          ELSE (in_patient * 100.0 / outpatient)      END AS percentage FROM counts;	thrombosis_prediction
SELECT (COUNT(CASE WHEN YEAR(Birthday) > 1930 THEN ID END) * 100.0) / COUNT(*) AS Percentage FROM Patient WHERE SEX = 'F';	thrombosis_prediction
SELECT (SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS Percentage FROM Patient WHERE YEAR(Birthday) BETWEEN 1930 AND 1940;	thrombosis_prediction
SELECT      (SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) * 1.0) / NULLIF(SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END), 0) AS ratio  FROM Patient  WHERE Diagnosis = 'SLE';	thrombosis_prediction
SELECT `Patient`.`Diagnosis`, `Laboratory`.`Date` FROM `Patient` LEFT JOIN `Laboratory` ON `Patient`.`ID` = `Laboratory`.`ID` WHERE `Patient`.`ID` = 30609;	thrombosis_prediction
SELECT `SEX`, `Birthday`, `Examination Date`, `Symptoms` FROM Patient INNER JOIN Examination ON Patient.ID = Examination.ID WHERE Patient.ID = 163109;	thrombosis_prediction
SELECT DISTINCT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.LDH > 500;	thrombosis_prediction
SELECT DISTINCT Patient.ID, (YEAR(CURRENT_DATE) - YEAR(Birthday)) AS age FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.RVVT = '+';	thrombosis_prediction
SELECT DISTINCT p.`ID`, p.`SEX`, p.`Diagnosis`  FROM Patient p  JOIN Examination e ON p.`ID` = e.`ID`  WHERE e.`Thrombosis` = 2;	thrombosis_prediction
SELECT DISTINCT Patient.*  FROM Patient  INNER JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE YEAR(Patient.Birthday) = 1937    AND Laboratory.`T-CHO` >= 250;	thrombosis_prediction
SELECT DISTINCT P.`ID`, P.`SEX`, P.`Diagnosis`  FROM `Patient` P  JOIN `Laboratory` L ON P.`ID` = L.`ID`  WHERE L.`ALB` < 3.5;	thrombosis_prediction
SELECT (COUNT(DISTINCT p.ID) FILTER (WHERE l.TP < 6.0 OR l.TP > 8.5) * 100.0) / COUNT(DISTINCT p.ID) AS Percentage FROM Patient p LEFT JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'F';	thrombosis_prediction
SELECT AVG(e.`aCL IgG`)  FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Admission = '+'    AND (YEAR(CURRENT_DATE) - YEAR(p.Birthday)) >= 50;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND YEAR(Description) = 1997 AND Admission = '-';	thrombosis_prediction
SELECT MIN(YEAR(`First Date`) - YEAR(Birthday)) FROM Patient WHERE `First Date` IS NOT NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Examination INNER JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.Thrombosis = 1 AND strftime('%Y', Examination.`Examination Date`) = '1997' AND Patient.SEX = 'F';	thrombosis_prediction
SELECT MAX(YEAR(p.Birthday)) - MIN(YEAR(p.Birthday)) AS age_gap FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TG >= 200;	thrombosis_prediction
SELECT e.Symptoms, p.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Birthday = (SELECT MAX(p2.Birthday) FROM Patient p2 JOIN Examination e2 ON p2.ID = e2.ID) AND e.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT AVG(monthly_count) FROM (SELECT COUNT(DISTINCT Laboratory.ID) AS monthly_count FROM Laboratory INNER JOIN Patient ON Laboratory.ID = Patient.ID WHERE Patient.SEX = 'M' AND Laboratory.Date BETWEEN '1998-01-01' AND '1998-12-31' GROUP BY strftime('%m', Laboratory.Date));	thrombosis_prediction
SELECT      (SELECT MAX(`Date`) FROM Laboratory WHERE ID = p.ID) AS `LabDate`,     YEAR(p.`First Date`) - YEAR(p.Birthday) AS `Age` FROM Patient p WHERE p.Diagnosis = 'SJS' ORDER BY p.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT      (SELECT CAST(COUNT(DISTINCT p.ID) AS FLOAT) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.UA <= 8.0) /     (SELECT CAST(COUNT(DISTINCT p.ID) AS FLOAT) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'F' AND l.UA <= 6.5) AS male_female_ratio;	thrombosis_prediction
SELECT COUNT(*) FROM Patient p WHERE p.`First Date` IS NOT NULL AND NOT EXISTS (SELECT 1 FROM Examination e WHERE e.ID = p.ID AND (YEAR(e.`Examination Date`) - YEAR(p.`First Date`)) < 1);	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE strftime('%Y', Examination.`Examination Date`) BETWEEN '1990' AND '1993'  AND (strftime('%Y', Examination.`Examination Date`) - strftime('%Y', Patient.Birthday)) < 18;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Laboratory.`T-BIL` >= 2.0;	thrombosis_prediction
SELECT p.Diagnosis, COUNT(DISTINCT p.ID) AS count_dx FROM Patient p INNER JOIN Examination e ON p.ID = e.ID WHERE e.`Examination Date` BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY p.Diagnosis ORDER BY count_dx DESC LIMIT 1;	thrombosis_prediction
SELECT AVG(1999 - YEAR(p.Birthday)) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.Date BETWEEN '1991-10-01' AND '1991-10-30';	thrombosis_prediction
SELECT (YEAR(E.`Examination Date`) - YEAR(P.Birthday)) AS Age, P.Diagnosis FROM Patient P JOIN Examination E ON P.ID = E.ID JOIN Laboratory L ON P.ID = L.ID AND E.`Examination Date` = L.Date WHERE L.HGB = (SELECT MAX(L2.HGB) FROM Laboratory L2 JOIN Examination E2 ON L2.ID = E2.ID AND L2.Date = E2.`Examination Date`) LIMIT 1;	thrombosis_prediction
SELECT `ANA` FROM `Examination` WHERE `ID` = 3605340 AND `Examination Date` = '1996-12-02';	thrombosis_prediction
SELECT `T-CHO` < 250 FROM Laboratory WHERE `ID` = 2927464 AND `Date` = '1995-09-04';	thrombosis_prediction
SELECT p.SEX  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.Diagnosis = 'AORTITIS'  ORDER BY e.`Examination Date` ASC  LIMIT 1;	thrombosis_prediction
SELECT `Examination`.`aCL IgM` FROM `Patient` INNER JOIN `Examination` ON `Patient`.`ID` = `Examination`.`ID` WHERE `Patient`.`Diagnosis` = 'SLE' AND `Patient`.`Description` = '1994-02-19' AND `Examination`.`Examination Date` = '1993-11-12';	thrombosis_prediction
SELECT Patient.SEX FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.Date = '1992-06-12' AND Laboratory.GPT = 9;	thrombosis_prediction
SELECT YEAR(Lab.`Date`) - YEAR(Pat.`Birthday`) AS Age  FROM Laboratory Lab  JOIN Patient Pat ON Lab.`ID` = Pat.`ID`  WHERE Lab.`UA` = 8.4 AND Lab.`Date` = '1991-10-21';	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Laboratory USING (ID)  WHERE Patient.`First Date` = '1991-06-13'    AND Patient.Diagnosis = 'SJS'    AND strftime('%Y', Laboratory.Date) = '1995';	thrombosis_prediction
SELECT p.Diagnosis  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.`Examination Date` = '1997-01-27'    AND e.Diagnosis = 'SLE';	thrombosis_prediction
SELECT `Examination`.`Symptoms` FROM `Patient` INNER JOIN `Examination` ON `Patient`.`ID` = `Examination`.`ID` WHERE `Patient`.`Birthday` = '1959-03-01' AND `Examination`.`Examination Date` = '1993-09-27';	thrombosis_prediction
SELECT ((SUM(CASE WHEN l.`Date` LIKE '1981-11-%' THEN l.`T-CHO` ELSE 0 END) - SUM(CASE WHEN l.`Date` LIKE '1981-12-%' THEN l.`T-CHO` ELSE 0 END)) / SUM(CASE WHEN l.`Date` LIKE '1981-11-%' THEN l.`T-CHO` ELSE 0 END)) * 100) AS DecreaseRate FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday = '1959-02-18';	thrombosis_prediction
SELECT Patient.ID  FROM Patient  WHERE Patient.Diagnosis = 'Behcet'    AND YEAR(Patient.Description) >= 1997    AND YEAR(Patient.Description) < 1998;	thrombosis_prediction
SELECT COUNT(DISTINCT l.ID)  FROM Laboratory l  WHERE l.Date BETWEEN '1987-07-06' AND '1996-01-31'    AND l.GPT > 30    AND l.ALB < 4;   SELECT DISTINCT l.ID  FROM Laboratory l  WHERE l.Date BETWEEN '1987-07-06' AND '1996-01-31'    AND l.GPT > 30    AND l.ALB < 4  ORDER BY l.ID;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND YEAR(Birthday) = 1964 AND Admission = '+'; SELECT ID FROM Patient WHERE SEX = 'F' AND YEAR(Birthday) = 1964 AND Admission = '+' ORDER BY ID;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID)  FROM Examination e  WHERE e.Thrombosis = 2    AND e.`ANA Pattern` = 'S'    AND e.`aCL IgM` > (SELECT AVG(`aCL IgM`) * 1.2 FROM Examination);	thrombosis_prediction
SELECT (SUM(CASE WHEN UA <= 6.5 THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS Percentage FROM Laboratory WHERE CAST(`U-PRO` AS REAL) > 0 AND CAST(`U-PRO` AS REAL) < 30;	thrombosis_prediction
SELECT      (SUM(CASE WHEN `Diagnosis` = 'BEHCET' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS Percentage  FROM      `Patient`  WHERE      `SEX` = 'M'      AND YEAR(`First Date`) = 1981;	thrombosis_prediction
SELECT DISTINCT Patient.ID  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.Admission = '-'    AND Laboratory.Date LIKE '1991-10%'    AND Laboratory.`T-BIL` < 2.0;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND YEAR(Birthday) BETWEEN 1980 AND 1989 AND ID NOT IN (SELECT ID FROM Examination WHERE `ANA Pattern` = 'P');	thrombosis_prediction
SELECT p.SEX  FROM Patient p  JOIN Examination e ON p.ID = e.ID  JOIN Laboratory l ON p.ID = l.ID  WHERE e.Diagnosis = 'PSS'    AND l.CRP = '2+'    AND l.CRE = 1    AND l.LDH = 123;	thrombosis_prediction
SELECT AVG(L.ALB) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'F' AND P.Diagnosis = 'SLE' AND L.PLT > 400;	thrombosis_prediction
SELECT e.Symptoms FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Diagnosis = 'SLE' GROUP BY e.Symptoms ORDER BY COUNT(*) DESC LIMIT 1;	thrombosis_prediction
SELECT `Description`, `Diagnosis` FROM `Patient` WHERE `ID` = 48473;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND (Diagnosis = 'APS' OR EXISTS (SELECT 1 FROM Examination WHERE Examination.ID = Patient.ID AND Examination.Diagnosis = 'APS'));	thrombosis_prediction
SELECT COUNT(DISTINCT Laboratory.ID)  FROM Laboratory  WHERE YEAR(Laboratory.Date) = 1997  AND (Laboratory.TP < 6 OR Laboratory.TP > 8.5);	thrombosis_prediction
SELECT      (COUNT(DISTINCT CASE WHEN p.Diagnosis LIKE '%SLE%' THEN p.ID END) * 100.0) /      COUNT(DISTINCT p.ID) AS proportion FROM Patient p INNER JOIN Examination e ON p.ID = e.ID WHERE e.Symptoms LIKE '%thrombocytopenia%';	thrombosis_prediction
SELECT (SUM(CASE WHEN SEX = 'F' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS percentage FROM Patient WHERE YEAR(Birthday) = 1980 AND Diagnosis = 'RA';	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  INNER JOIN Examination ON Patient.ID = Examination.ID  WHERE Patient.SEX = 'M'    AND Examination.`Examination Date` BETWEEN '1995-01-01' AND '1997-12-31'    AND Examination.Diagnosis = 'Behcet disease'    AND Patient.Admission = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'F' AND Laboratory.WBC < 3.5;	thrombosis_prediction
SELECT DATEDIFF(e.`Examination Date`, p.`First Date`) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.ID = 821298;	thrombosis_prediction
SELECT l.`UA`, CASE WHEN (p.`SEX` = 'M' AND l.`UA` > 8.0) OR (p.`SEX` = 'F' AND l.`UA` > 6.5) THEN 1 ELSE 0 END FROM Patient p JOIN Laboratory l ON p.`ID` = l.`ID` WHERE p.`ID` = 57266;	thrombosis_prediction
SELECT `Date` FROM `Laboratory` WHERE `ID` = 48473 AND `GOT` >= 60;	thrombosis_prediction
SELECT DISTINCT p.`ID`, p.`SEX`, p.`Birthday` FROM `Patient` p JOIN `Laboratory` l ON p.`ID` = l.`ID` WHERE l.`GOT` < 60 AND YEAR(l.`Date`) = 1994;	thrombosis_prediction
SELECT DISTINCT p.`ID`  FROM `Patient` p  JOIN `Laboratory` l ON p.`ID` = l.`ID`  WHERE p.`SEX` = 'M' AND l.`GPT` >= 60;	thrombosis_prediction
SELECT DISTINCT p.`Diagnosis`  FROM `Patient` p  JOIN `Laboratory` l ON p.`ID` = l.`ID`  WHERE l.`GPT` > 60  ORDER BY p.`Birthday` ASC;	thrombosis_prediction
SELECT AVG(LDH) FROM Laboratory WHERE LDH < 500;	thrombosis_prediction
SELECT DISTINCT Patient.ID, (YEAR(CURRENT_DATE) - YEAR(Patient.Birthday)) AS Age  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.LDH BETWEEN 600 AND 800;	thrombosis_prediction
SELECT P.Admission FROM Patient P WHERE EXISTS (SELECT 1 FROM Laboratory L WHERE L.ID = P.ID AND L.ALP < 300);	thrombosis_prediction
SELECT Patient.ID, Laboratory.ALP < 300 AS ALP_within_normal FROM Patient LEFT JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Birthday = '1982-04-01';	thrombosis_prediction
SELECT DISTINCT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.TP < 6.0;	thrombosis_prediction
SELECT p.`ID`, (l.`TP` - 8.5) AS `deviation` FROM `Patient` p JOIN `Laboratory` l ON p.`ID` = l.`ID` WHERE p.`SEX` = 'F' AND l.`TP` > 8.5;	thrombosis_prediction
SELECT Patient.*  FROM Patient  WHERE SEX = 'M'  AND EXISTS (     SELECT 1      FROM Laboratory      WHERE Laboratory.ID = Patient.ID      AND (ALB <= 3.5 OR ALB >= 5.5) )  ORDER BY Birthday DESC;	thrombosis_prediction
SELECT p.ID, CASE WHEN MIN(l.ALB) >= 3.5 AND MAX(l.ALB) <= 5.5 THEN 'Yes' ELSE 'No' END AS AlbuminWithinNormalRange FROM Patient p LEFT JOIN Laboratory l ON p.ID = l.ID WHERE YEAR(p.Birthday) = 1982 GROUP BY p.ID;	thrombosis_prediction
SELECT (COUNT(DISTINCT CASE WHEN l.UA > 6.5 THEN p.ID END) * 100.0) / COUNT(DISTINCT p.ID) AS percentage FROM Patient p LEFT JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'F';	thrombosis_prediction
SELECT AVG(l.UA) FROM Laboratory l JOIN Patient p ON l.ID = p.ID JOIN (SELECT ID, MAX(Date) AS LatestDate FROM Laboratory GROUP BY ID) latest ON l.ID = latest.ID AND l.Date = latest.LatestDate WHERE (p.SEX = 'M' AND l.UA < 8.0) OR (p.SEX = 'F' AND l.UA < 6.5);	thrombosis_prediction
SELECT DISTINCT Patient.ID, Patient.SEX, Patient.Birthday  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.UN = 29;	thrombosis_prediction
SELECT DISTINCT Patient.ID, Patient.SEX, Patient.Birthday  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.Diagnosis = 'RA' AND Laboratory.UN < 30;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'M' AND EXISTS (SELECT 1 FROM Laboratory WHERE Laboratory.ID = Patient.ID AND Laboratory.CRE >= 1.5);	thrombosis_prediction
SELECT (SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.CRE >= 1.5 AND P.SEX = 'M') > (SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.CRE >= 1.5 AND P.SEX = 'F') AS Result;	thrombosis_prediction
SELECT p.`ID`, p.`SEX`, p.`Birthday`, l.`T-BIL`  FROM `Patient` p  JOIN `Laboratory` l ON p.`ID` = l.`ID`  WHERE l.`T-BIL` = (SELECT MAX(`T-BIL`) FROM `Laboratory`);	thrombosis_prediction
SELECT P.SEX, GROUP_CONCAT(DISTINCT L.ID) AS Patients, COUNT(DISTINCT L.ID) AS Total  FROM Laboratory L  JOIN Patient P ON L.ID = P.ID  WHERE L.`T-BIL` >= 2.0  GROUP BY P.SEX;	thrombosis_prediction
SELECT p.`ID`, l.`T-CHO`  FROM `Patient` p  JOIN `Laboratory` l ON p.`ID` = l.`ID`  WHERE l.`T-CHO` = (SELECT MAX(`T-CHO`) FROM `Laboratory`)  ORDER BY p.`Birthday` ASC  LIMIT 1;	thrombosis_prediction
SELECT AVG(YEAR(CURDATE()) - YEAR(Birthday)) FROM Patient WHERE SEX = 'M' AND EXISTS (SELECT 1 FROM Laboratory WHERE Patient.ID = Laboratory.ID AND `T-CHO` >= 250);	thrombosis_prediction
SELECT DISTINCT P.`ID`, P.`Diagnosis`  FROM Patient P  JOIN Laboratory L ON P.`ID` = L.`ID`  WHERE L.`TG` > 300;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.TG >= 200  AND (YEAR(CURRENT_DATE) - YEAR(Patient.Birthday)) > 50;	thrombosis_prediction
SELECT DISTINCT Patient.ID  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.Admission = '-'  AND Laboratory.CPK < 250;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE YEAR(Patient.Birthday) BETWEEN 1936 AND 1956 AND Patient.SEX = 'M' AND Laboratory.CPK >= 250;	thrombosis_prediction
SELECT DISTINCT p.`ID`, p.`SEX`, (YEAR(CURRENT_DATE) - YEAR(p.`Birthday`)) AS age  FROM `Patient` p  JOIN `Laboratory` l ON p.`ID` = l.`ID`  WHERE l.`GLU` >= 180 AND l.`T-CHO` < 250;	thrombosis_prediction
SELECT p.`ID`, l.`GLU`  FROM `Patient` p  JOIN `Laboratory` l ON p.`ID` = l.`ID`  WHERE YEAR(p.`Description`) = 1991 AND l.`GLU` < 180;	thrombosis_prediction
SELECT DISTINCT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.WBC <= 3.5 OR Laboratory.WBC >= 9.0 ORDER BY Patient.SEX, Patient.Birthday DESC;	thrombosis_prediction
SELECT DISTINCT p.`ID`, (YEAR(CURRENT_DATE) - YEAR(p.`Birthday`)) AS Age, p.`Diagnosis`  FROM `Patient` p  JOIN `Laboratory` l ON p.`ID` = l.`ID`  WHERE l.`RBC` < 3.5;	thrombosis_prediction
SELECT Patient.ID, CASE WHEN Patient.Admission = '+' THEN 'Yes' ELSE 'No' END AS Admitted FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'F' AND (YEAR(CURDATE()) - YEAR(Patient.Birthday)) >= 50 AND (Laboratory.RBC <= 3.5 OR Laboratory.RBC >= 6.0) GROUP BY Patient.ID;   **Note:** The provided SQL might not handle patients with multiple lab entries correctly. A more accurate approach using EXISTS:  SELECT P.ID, CASE WHEN P.Admission = '+' THEN 'Yes' ELSE 'No' END AS Admitted FROM Patient P WHERE P.SEX = 'F' AND (YEAR(CURDATE()) - YEAR(P.Birthday)) >= 50 AND EXISTS (SELECT 1 FROM Laboratory L WHERE L.ID = P.ID AND (L.RBC <= 3.5 OR L.RBC >= 6.0));	thrombosis_prediction
SELECT DISTINCT P.`ID`, P.`SEX` FROM `Patient` P JOIN `Laboratory` L ON P.`ID` = L.`ID` WHERE P.`Admission` = '-' AND L.`HGB` < 10;	thrombosis_prediction
SELECT p.`ID`, p.`SEX` FROM Patient p JOIN Laboratory l ON p.`ID` = l.`ID` WHERE p.`Diagnosis` = 'SLE' AND l.`HGB` > 10 AND l.`HGB` < 17 ORDER BY p.`Birthday` ASC LIMIT 1;	thrombosis_prediction
SELECT p.ID, (YEAR(CURRENT_DATE) - YEAR(p.Birthday)) AS age  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.HCT >= 52  GROUP BY p.ID  HAVING COUNT(*) >= 2;	thrombosis_prediction
SELECT AVG(HCT) FROM Laboratory WHERE Date LIKE '1991%' AND HCT < 29;	thrombosis_prediction
SELECT    COUNT(DISTINCT CASE WHEN PLT < 100 THEN ID END) AS LowerCount,   COUNT(DISTINCT CASE WHEN PLT > 400 THEN ID END) AS HigherCount FROM Laboratory;	thrombosis_prediction
SELECT DISTINCT p.ID  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE YEAR(l.Date) = 1984    AND (YEAR(CURRENT_DATE) - YEAR(p.Birthday)) < 50    AND l.PLT BETWEEN 100 AND 400;	thrombosis_prediction
SELECT (SUM(CASE WHEN p.SEX = 'F' AND l.PT >= 14 THEN 1 ELSE 0 END) * 100.0) / NULLIF(SUM(CASE WHEN l.PT >= 14 THEN 1 ELSE 0 END), 0) AS Percentage FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE (YEAR(CURRENT_DATE) - YEAR(p.Birthday)) > 55;	thrombosis_prediction
SELECT Patient.`ID` FROM Patient WHERE YEAR(Patient.`First Date`) > 1992 AND EXISTS (     SELECT 1     FROM Laboratory     WHERE Laboratory.`ID` = Patient.`ID`     AND Laboratory.`PT` < 14 );	thrombosis_prediction
SELECT COUNT(*) FROM Examination e JOIN Laboratory l ON e.ID = l.ID AND e.`Examination Date` = l.Date WHERE e.`Examination Date` > '1997-01-01' AND l.APTT IS NOT NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT L.ID)  FROM Laboratory L  JOIN Examination E ON L.ID = E.ID  WHERE L.APTT > 45 AND E.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient WHERE Patient.SEX = 'M' AND EXISTS (SELECT 1 FROM Laboratory WHERE Laboratory.ID = Patient.ID AND Laboratory.WBC > 3.5 AND Laboratory.WBC < 9.0) AND EXISTS (SELECT 1 FROM Laboratory WHERE Laboratory.ID = Patient.ID AND (Laboratory.FG <= 150 OR Laboratory.FG >= 450));	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Birthday > '1980-01-01' AND (Laboratory.FG < 150 OR Laboratory.FG > 450);	thrombosis_prediction
SELECT DISTINCT p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE CAST(l.`U-PRO` AS INTEGER) >= 30;	thrombosis_prediction
SELECT DISTINCT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Diagnosis = 'SLE' AND CAST(Laboratory.`U-PRO` AS REAL) > 0 AND CAST(Laboratory.`U-PRO` AS REAL) < 30;	thrombosis_prediction
SELECT COUNT(DISTINCT Laboratory.ID) FROM Laboratory WHERE IGG >= 2000;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE EXISTS (SELECT 1 FROM Laboratory WHERE Laboratory.ID = Patient.ID AND IGG > 900 AND IGG < 2000) AND EXISTS (SELECT 1 FROM Examination WHERE Examination.ID = Patient.ID AND Symptoms IS NOT NULL);	thrombosis_prediction
SELECT Patient.Diagnosis FROM Patient WHERE Patient.ID = (SELECT Laboratory.ID FROM Laboratory WHERE Laboratory.IGA = (SELECT MAX(IGA) FROM Laboratory WHERE IGA BETWEEN 80 AND 500) LIMIT 1);	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.IGA > 80 AND Laboratory.IGA < 500 AND YEAR(Patient.`First Date`) >= 1990;	thrombosis_prediction
SELECT `Diagnosis` FROM (     SELECT p.`Diagnosis`, COUNT(*) as cnt     FROM Patient p     JOIN (         SELECT DISTINCT l.`ID`         FROM Laboratory l         WHERE l.`IGM` <= 40 OR l.`IGM` >= 400     ) t ON p.`ID` = t.`ID`     GROUP BY p.`Diagnosis`     ORDER BY cnt DESC     LIMIT 1 ) sub;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.CRP = '+' AND p.Description IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.CRE >= 1.5 AND (YEAR(CURDATE()) - YEAR(Patient.Birthday)) < 70;	thrombosis_prediction
SELECT COUNT(DISTINCT Laboratory.ID) FROM Laboratory JOIN Examination ON Laboratory.ID = Examination.ID WHERE Laboratory.RA IN ('-', '+-') AND Examination.KCT = '+';	thrombosis_prediction
SELECT DISTINCT Patient.Diagnosis  FROM Patient  INNER JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.Birthday > '1985-01-01'  AND Laboratory.RA IN ('-', '+-');	thrombosis_prediction
SELECT DISTINCT P.ID  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE (YEAR(CURDATE()) - YEAR(P.Birthday)) > 60  AND CAST(L.RF AS UNSIGNED) < 20;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P WHERE EXISTS (SELECT 1 FROM Laboratory L WHERE L.ID = P.ID AND CAST(L.RF AS INTEGER) < 20) AND NOT EXISTS (SELECT 1 FROM Examination E WHERE E.ID = P.ID AND E.Thrombosis = 1);	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE ID IN (SELECT DISTINCT l.ID FROM Laboratory l WHERE l.C3 > 35) AND ID IN (SELECT DISTINCT e.ID FROM Examination e WHERE e.`ANA Pattern` = 'P');	thrombosis_prediction
SELECT e.`ID`  FROM `Examination` e  WHERE e.`ID` IN (     SELECT l.`ID`      FROM `Laboratory` l      WHERE l.`HCT` <=29 OR l.`HCT` >=52 )  GROUP BY e.`ID`  ORDER BY MAX(e.`aCL IgA`) DESC  LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID)  FROM Examination E  WHERE E.Thrombosis = 1  AND EXISTS (     SELECT 1      FROM Laboratory L      WHERE L.ID = E.ID      AND L.C4 > 10 );	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  INNER JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.Admission = '+'  AND Laboratory.RNP IN ('-', '+-');	thrombosis_prediction
SELECT MAX(p.Birthday) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.RNP NOT IN ('-', '+-');	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient WHERE EXISTS (SELECT 1 FROM Laboratory WHERE Laboratory.ID = Patient.ID AND Laboratory.SM IN ('-', '+-')) AND EXISTS (SELECT 1 FROM Examination WHERE Examination.ID = Patient.ID AND Examination.Thrombosis = 0);	thrombosis_prediction
SELECT DISTINCT Patient.ID  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.SM NOT IN ('negative', '0')  ORDER BY Patient.Birthday DESC  LIMIT 3;	thrombosis_prediction
SELECT DISTINCT e.ID  FROM Examination e  JOIN Laboratory l ON e.ID = l.ID  WHERE e.`Examination Date` > '1997-01-01'  AND l.SC170 IN ('negative','0');	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.SC170 IN ('negative', '0') AND Patient.SEX = 'F' AND NOT EXISTS (     SELECT 1 FROM Examination     WHERE Examination.ID = Patient.ID     AND Examination.Symptoms IS NOT NULL );	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  INNER JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.SSA IN ('-', '+-')  AND Patient.`First Date` IS NOT NULL  AND YEAR(Patient.`First Date`) < 2000;	thrombosis_prediction
SELECT p.ID FROM Patient p WHERE EXISTS (SELECT 1 FROM Laboratory l WHERE l.ID = p.ID AND l.SSA NOT IN ('negative', '0')) ORDER BY p.`First Date` ASC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID INNER JOIN Examination ON Patient.ID = Examination.ID WHERE Laboratory.SSB IN ('negative', '0') AND Examination.Diagnosis = 'SLE';	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  WHERE EXISTS (     SELECT 1 FROM Laboratory      WHERE Laboratory.ID = Patient.ID AND SSB IN ('negative', '0') )  AND EXISTS (     SELECT 1 FROM Examination      WHERE Examination.ID = Patient.ID AND Symptoms IS NOT NULL );	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  WHERE Patient.SEX = 'M'  AND EXISTS (     SELECT 1      FROM Laboratory      WHERE Laboratory.ID = Patient.ID      AND CENTROMEA IN ('-', '+-')      AND SSB IN ('-', '+-') );	thrombosis_prediction
SELECT DISTINCT `Patient`.`Diagnosis` FROM `Patient` JOIN `Laboratory` ON `Patient`.`ID` = `Laboratory`.`ID` WHERE `Laboratory`.`DNA-II` >= 8;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient LEFT JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Description IS NULL AND (Laboratory.DNA IS NULL OR CAST(Laboratory.DNA AS REAL) < 8);  Wait, wait. The user's question is: How many patients have a normal anti-DNA level (DNA <8) yet their data (Description) is not recorded (IS NULL). The answer I thought earlier uses INNER JOIN, which would require the patient to have a lab record. But maybe the question is considering patients who have normal anti-DNA (i.e., their latest or any lab result is normal) and their Description is NULL. But if the patient has no lab records at all, then they don't have a normal level. But according to the question, it's patients who have a normal anti-DNA level. So if they have no lab records, they can't have a normal level, hence shouldn't be counted.  But in the initial answer, I used INNER JOIN, which requires a matching lab record. So the COUNT would be correct. However, the user's note says "data are not recorded refers to Description IS NULL". But the presence of lab data (Laboratory entries) is separate. So the correct approach is: patients with Description NULL, and in the Laboratory table, their DNA is <8. So the initial answer is correct.  Wait, but the problem states "patients have a normal anti-DNA level, yet their data are not recorded". If "their data are not recorded" refers to the Description being NULL, then the patient must have normal anti-DNA and Description NULL. So they need to have a lab entry with DNA <8 and their Description is NULL.  But the initial answer I wrote uses INNER JOIN, which would require a lab entry. Which is correct.  But maybe the user intended that if the lab data is not recorded (i.e., DNA is NULL), but that's not what the note says. The note says "data are not recorded refers to Description IS NULL". So the data in question is the Description in the Patient table. So the patient's Description is NULL (data not recorded) and they have a normal anti-DNA level (DNA <8). So the presence of lab data (with DNA <8) is required.  Thus, the correct SQL is:  SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  INNER JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.Description IS NULL  AND CAST(Laboratory.DNA AS REAL) < 8;  But wait, in the previous thinking, I considered using DNA-II, but the user's note says DNA. So if DNA is TEXT, but needs to be cast to a number.  But looking back, maybe the actual correct answer is:  SELECT COUNT(DISTINCT Patient.ID) FROM Patient WHERE Patient.Description IS NULL AND EXISTS (     SELECT 1     FROM Laboratory     WHERE Laboratory.ID = Patient.ID     AND CAST(Laboratory.DNA AS REAL) < 8 );  This uses EXISTS to check for at least one lab record with DNA <8. Which might be better than an INNER JOIN because it avoids multiple rows per patient. But COUNT(DISTINCT) in the INNER JOIN approach would also work.  But given that the user wants the number of unique patients, both approaches are correct.  But the sample data for Patient shows that only Patient 27654 has Description NULL. So the count would depend on whether this patient has any Laboratory entries with DNA <8. Since the sample data doesn't include Laboratory inserts, the exact answer can't be determined, but the SQL should be structured correctly.  But the user's note says "data are not recorded refers to Description IS NULL", which is in the Patient table. So the correct answer should select patients with Description IS NULL and at least one Laboratory entry where DNA <8.  Therefore, the correct SQL is:  SELECT COUNT(DISTINCT Patient.ID) FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Description IS NULL AND CAST(Laboratory.DNA AS REAL) < 8;  But now, I realize that in the initial answer I provided in the thinking step, the answer might not correctly handle cases where DNA is a non-numeric value, but the user's note says to assume DNA <8. So even if DNA is stored as a string like '7', CAST(DNA AS REAL) would work. However, if DNA is 'Normal' or 'Negative', the CAST would fail, resulting in NULL, and the condition would not be met, which is correct because only numeric DNA values <8 are considered normal.  But the user's note says "normal anti-DNA level refers to DNA <8", which implies that DNA is a numeric field. However, according to the schema, DNA is TEXT. So the correct approach is to CAST it as a REAL.  Therefore, the final answer is:  SELECT COUNT(DISTINCT Patient.ID) FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Description IS NULL AND CAST(Laboratory.DNA AS REAL) < 8;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.IGG > 900 AND Laboratory.IGG < 2000 AND Patient.Admission = '+';	thrombosis_prediction
SELECT      (SELECT COUNT(DISTINCT l.ID) FROM Laboratory l JOIN Patient p ON l.ID = p.ID WHERE l.GOT >= 60 AND p.Diagnosis = 'SLE') * 100.0 /      (SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE GOT >= 60) AS percentage;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Laboratory.GOT < 60;	thrombosis_prediction
SELECT MAX(Birthday) FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE GOT >= 60);	thrombosis_prediction
SELECT Patient.Birthday  FROM Patient  JOIN (     SELECT ID, MAX(GPT) AS MaxGPT      FROM Laboratory      WHERE GPT < 60      GROUP BY ID ) AS Lab ON Patient.ID = Lab.ID  ORDER BY Lab.MaxGPT DESC  LIMIT 3;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.GOT < 60 AND Patient.SEX = 'M';	thrombosis_prediction
WITH patient_ldh AS (     SELECT ID, MAX(LDH) AS max_ldh     FROM Laboratory     WHERE LDH < 500     GROUP BY ID ), highest_ldh AS (     SELECT MAX(max_ldh) AS highest_ldh     FROM patient_ldh ), eligible_patients AS (     SELECT ID     FROM patient_ldh     WHERE max_ldh = (SELECT highest_ldh FROM highest_ldh) ) SELECT MIN(p.`First Date`) FROM Patient p JOIN eligible_patients ep ON p.ID = ep.ID;	thrombosis_prediction
SELECT MAX(l.`Date`)  FROM Laboratory l  WHERE l.`ID` = (     SELECT p.`ID`      FROM Patient p      WHERE EXISTS (         SELECT 1          FROM Laboratory lab          WHERE lab.`ID` = p.`ID` AND lab.`LDH` >= 500     )      ORDER BY p.`First Date` DESC      LIMIT 1 );	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Admission = '+' AND Laboratory.ALP >= 300;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Admission = '-' AND Laboratory.ALP < 300;	thrombosis_prediction
SELECT DISTINCT p.`Diagnosis`  FROM `Patient` p  JOIN `Laboratory` l ON p.`ID` = l.`ID`  WHERE l.`TP` < 6.0;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P INNER JOIN Laboratory L ON P.ID = L.ID WHERE P.Diagnosis = 'SJS' AND L.TP > 6.0 AND L.TP < 8.5;	thrombosis_prediction
SELECT l.`Date`  FROM Laboratory l  WHERE l.ALB = (SELECT MAX(ALB) FROM Laboratory WHERE ALB > 3.5 AND ALB < 5.5);	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  INNER JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.SEX = 'M'    AND Laboratory.ALB > 3.5    AND Laboratory.ALB < 5.5    AND Laboratory.TP BETWEEN 6.0 AND 8.5;	thrombosis_prediction
SELECT E.`aCL IgG`, E.`aCL IgM`, E.`aCL IgA`  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  JOIN Examination E ON P.ID = E.ID  WHERE P.SEX = 'F'    AND L.UA = (SELECT MAX(L2.UA) FROM Laboratory L2 JOIN Patient P2 ON L2.ID = P2.ID WHERE P2.SEX = 'F' AND L2.UA > 6.50);	thrombosis_prediction
SELECT MAX(e.`ANA`) FROM `Examination` e JOIN `Laboratory` l ON e.`ID` = l.`ID` WHERE l.`CRE` < 1.5;	thrombosis_prediction
SELECT Examination.`ID`  FROM Examination  WHERE Examination.`ID` IN (     SELECT Laboratory.`ID`      FROM Laboratory      GROUP BY Laboratory.`ID`      HAVING MAX(Laboratory.`CRE`) < 1.5 )  AND Examination.`aCL IgA` = (     SELECT MAX(e2.`aCL IgA`)      FROM Examination e2      WHERE e2.`ID` IN (         SELECT Laboratory.`ID`          FROM Laboratory          GROUP BY Laboratory.`ID`          HAVING MAX(Laboratory.`CRE`) < 1.5     ) );	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  WHERE EXISTS (     SELECT 1 FROM Laboratory      WHERE Laboratory.ID = Patient.ID AND Laboratory.`T-BIL` >= 2.0 )  AND EXISTS (     SELECT 1 FROM Examination      WHERE Examination.ID = Patient.ID AND Examination.`ANA Pattern` LIKE '%P%' );	thrombosis_prediction
SELECT E.`ANA` FROM `Examination` E WHERE E.`ID` IN (SELECT L.`ID` FROM `Laboratory` L WHERE L.`T-BIL` = (SELECT MAX(L2.`T-BIL`) FROM `Laboratory` L2 WHERE L2.`T-BIL` < 2.0));	thrombosis_prediction
SELECT COUNT(DISTINCT Lab.ID) FROM Laboratory Lab JOIN Examination Ex ON Lab.ID = Ex.ID WHERE Lab.`T-CHO` >= 250 AND Ex.KCT = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient WHERE EXISTS (SELECT 1 FROM Laboratory WHERE Laboratory.ID = Patient.ID AND Laboratory.`T-CHO` < 250) AND EXISTS (SELECT 1 FROM Examination WHERE Examination.ID = Patient.ID AND Examination.`ANA Pattern` = 'P');	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE ID IN (SELECT DISTINCT l.ID FROM Laboratory l WHERE l.TG < 200) AND ID IN (SELECT DISTINCT e.ID FROM Examination e WHERE e.Symptoms IS NOT NULL);	thrombosis_prediction
SELECT p.Diagnosis FROM Patient p WHERE p.ID IN (SELECT l.ID FROM Laboratory l WHERE l.TG = (SELECT MAX(TG) FROM Laboratory WHERE TG < 200));	thrombosis_prediction
SELECT DISTINCT Patient.ID FROM Patient WHERE EXISTS (     SELECT 1 FROM Examination WHERE Examination.ID = Patient.ID AND Thrombosis = 0 ) AND EXISTS (     SELECT 1 FROM Laboratory WHERE Laboratory.ID = Patient.ID AND CPK < 250 );	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient WHERE EXISTS (     SELECT 1 FROM Laboratory     WHERE Laboratory.ID = Patient.ID AND CPK < 250 ) AND EXISTS (     SELECT 1 FROM Examination     WHERE Examination.ID = Patient.ID AND (KCT = '+' OR RVVT = '+' OR LAC = '+') );	thrombosis_prediction
SELECT MIN(p.Birthday)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.GLU > 180;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient WHERE EXISTS (SELECT 1 FROM Laboratory WHERE Laboratory.ID = Patient.ID AND Laboratory.GLU < 180) AND EXISTS (SELECT 1 FROM Examination WHERE Examination.ID = Patient.ID AND Examination.Thrombosis = 0);	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.Admission = '+'    AND Laboratory.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Diagnosis = 'SLE' AND Laboratory.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT DISTINCT Patient.ID  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.Admission = '-'    AND (Laboratory.RBC <= 3.5 OR Laboratory.RBC >= 6.0);	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE (Laboratory.PLT > 100 AND Laboratory.PLT < 400) AND Patient.Diagnosis IS NOT NULL;	thrombosis_prediction
SELECT l.PLT FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis = 'MCTD' AND l.PLT > 100 AND l.PLT < 400;	thrombosis_prediction
SELECT AVG(Lab.`PT`) FROM Patient P JOIN Laboratory Lab ON P.`ID` = Lab.`ID` WHERE P.`SEX` = 'M' AND Lab.`PT` < 14;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  WHERE EXISTS (     SELECT 1 FROM Examination      WHERE Examination.ID = Patient.ID AND Examination.Thrombosis IN (1, 2) )  AND EXISTS (     SELECT 1 FROM Laboratory      WHERE Laboratory.ID = Patient.ID AND Laboratory.PT < 14 );	thrombosis_prediction
SELECT mjr.major_name FROM member mbr JOIN major mjr ON mbr.link_to_major = mjr.major_id WHERE mbr.first_name = 'Angela' AND mbr.last_name = 'Sanders';	student_club
SELECT COUNT(*) FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE major.college = 'College of Engineering';	student_club
SELECT member.first_name || ' ' || member.last_name AS full_name FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE major.department = 'Art and Design';	student_club
SELECT COUNT(DISTINCT a.link_to_member) FROM attendance a JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer';	student_club
SELECT member.phone  FROM member  INNER JOIN attendance ON member.member_id = attendance.link_to_member  INNER JOIN event ON attendance.link_to_event = event.event_id  WHERE event.event_name = 'Women''s Soccer';	student_club
SELECT COUNT(DISTINCT m.member_id)  FROM member m  JOIN attendance a ON m.member_id = a.link_to_member  JOIN event e ON a.link_to_event = e.event_id  WHERE e.event_name = 'Women''s Soccer' AND m.t_shirt_size = 'Medium';	student_club
SELECT e.event_id, e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event GROUP BY e.event_id ORDER BY COUNT(*) DESC LIMIT 1;	student_club
SELECT mjr.college  FROM member AS m  JOIN major AS mjr ON m.link_to_major = mjr.major_id  WHERE m.position = 'Vice President';	student_club
SELECT e.event_name  FROM member m  JOIN attendance a ON m.member_id = a.link_to_member  JOIN event e ON a.link_to_event = e.event_id  WHERE m.first_name = 'Maya' AND m.last_name = 'Mclean';	student_club
SELECT COUNT(DISTINCT e.event_id)  FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison' AND strftime('%Y', e.event_date) = '2019';	student_club
SELECT COUNT(*) FROM (SELECT e.event_id FROM event e JOIN attendance a ON e.event_id = a.link_to_event WHERE e.type = 'Meeting' GROUP BY e.event_id HAVING COUNT(a.link_to_member) > 10);	student_club
SELECT e.event_name  FROM event e  JOIN attendance a ON e.event_id = a.link_to_event  WHERE e.type != 'fundraiser'  GROUP BY e.event_id  HAVING COUNT(a.link_to_member) > 20;	student_club
SELECT      COUNT(a.link_to_member) * 1.0 / COUNT(DISTINCT e.event_id)  FROM      event e  JOIN      attendance a ON e.event_id = a.link_to_event  WHERE      e.type = 'Meeting'      AND strftime('%Y', e.event_date) = '2020';	student_club
SELECT expense_description FROM expense WHERE cost = (SELECT MAX(cost) FROM expense);	student_club
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Environmental Engineering';	student_club
SELECT member.first_name, member.last_name FROM member JOIN attendance ON member.member_id = attendance.link_to_member JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'Laugh Out Loud';	student_club
SELECT member.last_name  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Law and Constitutional Studies';	student_club
SELECT zip_code.county FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.first_name = 'Sherri' AND member.last_name = 'Ramsey';	student_club
SELECT mjr.college  FROM member AS m  JOIN major AS mjr ON m.link_to_major = mjr.major_id  WHERE m.first_name = 'Tyler' AND m.last_name = 'Hewitt';	student_club
SELECT SUM(i.amount)  FROM member m  JOIN income i ON m.member_id = i.link_to_member  WHERE m.position = 'Vice President';	student_club
SELECT SUM(b.spent)  FROM budget b  JOIN event e ON b.link_to_event = e.event_id  WHERE b.category = 'Food' AND e.event_name = 'September Meeting';	student_club
SELECT z.city, z.state  FROM member m  JOIN zip_code z ON m.zip = z.zip_code  WHERE m.position = 'President';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE z.state = 'Illinois';	student_club
SELECT SUM(b.spent)  FROM budget b  JOIN event e ON b.link_to_event = e.event_id  WHERE e.event_name = 'September Meeting'  AND b.category = 'Advertisement';	student_club
SELECT DISTINCT major.department FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.last_name IN ('Pierce', 'Guidi');	student_club
SELECT SUM(b.amount) FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'October Speaker';	student_club
SELECT e.expense_id, e.approved  FROM event ev  JOIN budget b ON ev.event_id = b.link_to_event  JOIN expense e ON b.budget_id = e.link_to_budget  WHERE ev.event_name = 'October Meeting' AND ev.event_date = '2019-10-08';	student_club
SELECT AVG(e.cost) FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE m.first_name = 'Elijah' AND m.last_name = 'Allen' AND (SUBSTR(e.expense_date, 5, 2) = '09' OR SUBSTR(e.expense_date, 5, 2) = '10');	student_club
SELECT      (SUM(CASE WHEN SUBSTR(e.event_date, 1, 4) = '2019' THEN b.spent ELSE 0 END) -       SUM(CASE WHEN SUBSTR(e.event_date, 1, 4) = '2020' THEN b.spent ELSE 0 END)) AS difference  FROM budget b  JOIN event e ON b.link_to_event = e.event_id  WHERE SUBSTR(e.event_date, 1, 4) IN ('2019', '2020');	student_club
SELECT location FROM event WHERE event_name = 'Spring Budget Review';	student_club
SELECT SUM(e.cost)  FROM event ev  JOIN budget b ON ev.event_id = b.link_to_event  JOIN expense e ON b.budget_id = e.link_to_budget  WHERE ev.event_name = 'Posters' AND ev.event_date = '2019-09-04';	student_club
SELECT remaining FROM budget WHERE category = 'Food' AND amount = (SELECT MAX(amount) FROM budget WHERE category = 'Food');	student_club
SELECT notes FROM income WHERE source = 'Fundraising' AND date_received = '2019-09-14';	student_club
SELECT COUNT(*) FROM major WHERE college = 'College of Humanities and Social Sciences';	student_club
SELECT phone FROM member WHERE first_name = 'Carlo' AND last_name = 'Jacobs';	student_club
SELECT z.county  FROM member m  JOIN zip_code z ON m.zip = z.zip_code  WHERE m.first_name = 'Adela' AND m.last_name = 'O''Gallagher';	student_club
SELECT COUNT(*) FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'November Meeting' AND b.remaining < 0;	student_club
SELECT SUM(b.amount)  FROM budget b  JOIN event e ON b.link_to_event = e.event_id  WHERE e.event_name = 'September Speaker';	student_club
SELECT b.event_status FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id WHERE e.expense_description = 'Post Cards, Posters' AND e.expense_date = '2019-08-20';	student_club
SELECT mj.major_name  FROM member AS mem  JOIN major AS mj ON mem.link_to_major = mj.major_id  WHERE mem.first_name = 'Brent' AND mem.last_name = 'Thomason';	student_club
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Business' AND member.t_shirt_size = 'Medium';	student_club
SELECT z.type  FROM member m  JOIN zip_code z ON m.zip = z.zip_code  WHERE m.first_name = 'Christof' AND m.last_name = 'Nielson';	student_club
SELECT mjr.major_name FROM member mbr JOIN major mjr ON mbr.link_to_major = mjr.major_id WHERE mbr.position = 'Vice President';	student_club
SELECT z.state FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison';	student_club
SELECT major.department  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE member.position = 'President';	student_club
SELECT income.date_received FROM member JOIN income ON member.member_id = income.link_to_member WHERE member.first_name = 'Connor' AND member.last_name = 'Hilton' AND income.source = 'Dues';	student_club
SELECT m.first_name || ' ' || m.last_name AS full_name FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.source = 'Dues' ORDER BY i.date_received ASC LIMIT 1;	student_club
WITH yearly AS (     SELECT substr(e.event_date, 1,4) AS year, SUM(b.amount) AS yearly_amount      FROM budget b      JOIN event e ON b.link_to_event = e.event_id      WHERE e.event_name = 'Yearly Kickoff' AND b.category = 'Advertisement'      GROUP BY year ),  october AS (     SELECT substr(e.event_date, 1,4) AS year, SUM(b.amount) AS october_amount      FROM budget b      JOIN event e ON b.link_to_event = e.event_id      WHERE e.event_name = 'October Meeting' AND b.category = 'Advertisement'      GROUP BY year )  SELECT COUNT(*)  FROM yearly y  JOIN october o ON y.year = o.year  WHERE y.yearly_amount > o.october_amount;	student_club
SELECT (SUM(CASE WHEN b.category = 'Parking' THEN b.amount ELSE 0 END) * 100.0) / SUM(b.amount) AS percentage FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'November Speaker';	student_club
SELECT SUM(cost) FROM expense WHERE expense_description = 'Pizza';	student_club
SELECT COUNT(DISTINCT city) FROM zip_code WHERE county = 'Orange County' AND state = 'Virginia';	student_club
SELECT DISTINCT department FROM major WHERE college = 'College of Humanities and Social Sciences';	student_club
SELECT z.city, z.county, z.state FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Amy' AND m.last_name = 'Firth';	student_club
SELECT e.expense_description  FROM expense e  JOIN budget b ON e.link_to_budget = b.budget_id  WHERE b.remaining = (SELECT MIN(remaining) FROM budget);	student_club
SELECT m.*  FROM member m  JOIN attendance a ON m.member_id = a.link_to_member  JOIN event e ON a.link_to_event = e.event_id  WHERE e.event_name = 'October Meeting';	student_club
SELECT major.college  FROM member  JOIN major ON member.link_to_major = major.major_id  GROUP BY major.college  ORDER BY COUNT(member.member_id) DESC  LIMIT 1;	student_club
SELECT major.major_name  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE member.phone = '809-555-3360';	student_club
SELECT e.event_name  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  WHERE b.amount = (SELECT MAX(amount) FROM budget);	student_club
SELECT expense.* FROM expense JOIN member ON expense.link_to_member = member.member_id WHERE member.position = 'Vice President';	student_club
SELECT COUNT(DISTINCT a.link_to_member)  FROM attendance a  JOIN event e ON a.link_to_event = e.event_id  WHERE e.event_name = 'Women''s Soccer';	student_club
SELECT i.date_received  FROM member m  JOIN income i ON m.member_id = i.link_to_member  WHERE m.first_name = 'Casey' AND m.last_name = 'Mason';	student_club
SELECT COUNT(*)  FROM member  JOIN zip_code ON member.zip = zip_code.zip_code  WHERE zip_code.state = 'Maryland';	student_club
SELECT COUNT(*) FROM attendance JOIN member ON attendance.link_to_member = member.member_id WHERE member.phone = '954-555-6240';	student_club
SELECT member.first_name || ' ' || member.last_name AS full_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT e.event_name, (b.spent / b.amount) AS spend_to_budget_ratio FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.status = 'Closed' ORDER BY spend_to_budget_ratio DESC LIMIT 1;	student_club
SELECT COUNT(*) FROM member WHERE position = 'President';	student_club
SELECT MAX(spent) FROM budget;	student_club
SELECT COUNT(*) FROM event WHERE type = 'Meeting' AND strftime('%Y', event_date) = '2020';	student_club
SELECT SUM(spent) FROM budget WHERE category = 'Food';	student_club
SELECT m.first_name || ' ' || m.last_name AS student_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member GROUP BY m.member_id HAVING COUNT(a.link_to_event) > 7;	student_club
SELECT m.member_id, m.first_name, m.last_name  FROM member m  JOIN major maj ON m.link_to_major = maj.major_id  JOIN attendance a ON m.member_id = a.link_to_member  JOIN event e ON a.link_to_event = e.event_id  WHERE maj.major_name = 'Interior Design' AND e.event_name = 'Community Theater';	student_club
SELECT member.first_name || ' ' || member.last_name AS name  FROM member  INNER JOIN zip_code ON member.zip = zip_code.zip_code  WHERE zip_code.city = 'Georgetown' AND zip_code.state = 'South Carolina';	student_club
SELECT SUM(i.amount)  FROM income i  JOIN member m ON i.link_to_member = m.member_id  WHERE m.first_name = 'Grant' AND m.last_name = 'Gilmour';	student_club
SELECT DISTINCT m.first_name || ' ' || m.last_name AS student_name  FROM member m  JOIN income i ON m.member_id = i.link_to_member  WHERE i.amount > 40;	student_club
SELECT SUM(expense.cost) FROM expense JOIN budget ON expense.link_to_budget = budget.budget_id JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'Yearly Kickoff';	student_club
SELECT m.first_name, m.last_name  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  JOIN expense ex ON b.budget_id = ex.link_to_budget  JOIN member m ON ex.link_to_member = m.member_id  WHERE e.event_name = 'Yearly Kickoff';	student_club
SELECT m.first_name || ' ' || m.last_name AS full_name, i.source  FROM member m  JOIN income i ON m.member_id = i.link_to_member  WHERE i.amount = (SELECT MAX(amount) FROM income);	student_club
SELECT e.event_name  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  JOIN expense ex ON b.budget_id = ex.link_to_budget  GROUP BY e.event_id  ORDER BY SUM(ex.cost) ASC  LIMIT 1;	student_club
SELECT (SUM(CASE WHEN e.event_name = 'Yearly Kickoff' THEN exp.cost ELSE 0 END) * 100.0) / NULLIF(SUM(exp.cost), 0) AS percentage FROM expense exp LEFT JOIN budget b ON exp.link_to_budget = b.budget_id LEFT JOIN event e ON b.link_to_event = e.event_id;	student_club
SELECT      1.0 * SUM(major_name = 'Finance') / SUM(major_name = 'Physics')  FROM member  INNER JOIN major ON member.link_to_major = major.major_id;	student_club
SELECT source, SUM(amount) AS total_amount FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' GROUP BY source ORDER BY total_amount DESC LIMIT 1;	student_club
SELECT first_name || ' ' || last_name AS full_name, email FROM member WHERE position = 'Secretary';	student_club
SELECT COUNT(*) FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Physics Teaching';	student_club
SELECT COUNT(DISTINCT a.link_to_member)  FROM event e  JOIN attendance a ON e.event_id = a.link_to_event  WHERE e.event_name = 'Community Theater' AND strftime('%Y', e.event_date) = '2019';	student_club
SELECT COUNT(a.link_to_event) AS num_events, mj.major_name  FROM member AS mb  LEFT JOIN attendance AS a ON mb.member_id = a.link_to_member  LEFT JOIN major AS mj ON mb.link_to_major = mj.major_id  WHERE mb.first_name = 'Luisa' AND mb.last_name = 'Guidi';	student_club
SELECT SUM(spent)/COUNT(spent) FROM budget WHERE category = 'Food' AND event_status = 'Closed';	student_club
SELECT e.event_name  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  WHERE b.category = 'Advertisement'  ORDER BY b.spent DESC  LIMIT 1;	student_club
SELECT EXISTS (     SELECT 1      FROM member m      JOIN event e ON e.event_name = 'Women''s Soccer'      JOIN attendance a ON a.link_to_member = m.member_id AND a.link_to_event = e.event_id      WHERE m.first_name = 'Maya' AND m.last_name = 'Mclean' ) AS attended;	student_club
SELECT (SUM(CASE WHEN type = 'Community Service' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS percentage FROM event WHERE strftime('%Y', event_date) = '2019';	student_club
SELECT expense.cost FROM expense JOIN budget ON expense.link_to_budget = budget.budget_id JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'September Speaker' AND expense.expense_description = 'Posters';	student_club
SELECT t_shirt_size FROM member GROUP BY t_shirt_size ORDER BY COUNT(*) DESC LIMIT 1;	student_club
SELECT event.event_name  FROM event  JOIN budget ON event.event_id = budget.link_to_event  WHERE event.status = 'Closed' AND budget.remaining < 0  ORDER BY budget.remaining ASC  LIMIT 1;	student_club
SELECT budget.category AS type, SUM(expense.cost) AS total_value FROM event JOIN budget ON event.event_id = budget.link_to_event JOIN expense ON budget.budget_id = expense.link_to_budget WHERE event.event_name = 'October Meeting' AND expense.approved = 'Yes' GROUP BY budget.category;	student_club
SELECT budget.category, SUM(budget.amount) AS amount_budgeted  FROM event  JOIN budget ON event.event_id = budget.link_to_event  WHERE event.event_name = 'April Speaker'  GROUP BY budget.category  ORDER BY amount_budgeted ASC;	student_club
SELECT * FROM budget WHERE category = 'Food' ORDER BY amount DESC LIMIT 1;	student_club
SELECT *  FROM budget  WHERE category = 'Advertisement'  ORDER BY amount DESC  LIMIT 3;	student_club
SELECT SUM(cost) FROM expense WHERE expense_description = 'Parking';	student_club
SELECT SUM(cost) FROM expense WHERE expense_date = '2019-08-20';	student_club
SELECT m.first_name || ' ' || m.last_name AS full_name, SUM(e.cost) AS total_cost  FROM member m  JOIN expense e ON m.member_id = e.link_to_member  WHERE m.member_id = 'rec4BLdZHS2Blfp4v'  GROUP BY m.first_name, m.last_name;	student_club
SELECT DISTINCT e.expense_description  FROM member m JOIN expense e ON m.member_id = e.link_to_member  WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison';	student_club
SELECT DISTINCT e.expense_description  FROM expense e  JOIN member m ON e.link_to_member = m.member_id  WHERE m.t_shirt_size = 'X-Large';	student_club
SELECT DISTINCT m.zip  FROM member m  JOIN expense e ON m.member_id = e.link_to_member  WHERE e.cost < 50;	student_club
SELECT major.major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Phillip' AND member.last_name = 'Cullen';	student_club
SELECT member.position  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Business';	student_club
SELECT COUNT(*) FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Business' AND member.t_shirt_size = 'Medium';	student_club
SELECT DISTINCT e.type  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  WHERE b.remaining > 30;	student_club
SELECT type FROM event WHERE location = 'MU 215';	student_club
SELECT type FROM event WHERE event_date = '2020-03-24T12:00:00';	student_club
SELECT DISTINCT major.major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'Vice President';	student_club
SELECT (SUM(CASE WHEN m.position = 'Member' AND j.major_name = 'Business' THEN 1 ELSE 0 END) * 100.0) / COUNT(m.member_id) AS percentage FROM member m LEFT JOIN major j ON m.link_to_major = j.major_id;	student_club
SELECT DISTINCT type FROM event WHERE location = 'MU 215';	student_club
SELECT COUNT(*) FROM income WHERE amount = 50;	student_club
SELECT COUNT(*) FROM member WHERE position = 'Member' AND t_shirt_size = 'X-Large';	student_club
SELECT COUNT(*) FROM major WHERE college = 'College of Agriculture and Applied Sciences' AND department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT m.last_name, j.department, j.college  FROM member m  JOIN major j ON m.link_to_major = j.major_id  WHERE j.major_name = 'Environmental Engineering';	student_club
SELECT DISTINCT budget.category  FROM event  JOIN budget ON event.event_id = budget.link_to_event  WHERE event.location = 'MU 215'  AND event.type = 'Guest Speaker'  AND budget.spent = 0;	student_club
SELECT z.city, z.state FROM member m JOIN major ma ON m.link_to_major = ma.major_id JOIN zip_code z ON m.zip = z.zip_code WHERE ma.department = 'Electrical and Computer Engineering Department' AND m.position = 'Member';	student_club
SELECT DISTINCT e.event_name  FROM event e  JOIN attendance a ON e.event_id = a.link_to_event  JOIN member m ON a.link_to_member = m.member_id  WHERE e.type = 'Social'    AND e.location = '900 E. Washington St.'    AND m.position = 'Vice President';	student_club
SELECT member.last_name, member.position FROM member JOIN expense ON member.member_id = expense.link_to_member WHERE expense.expense_description = 'Pizza' AND expense.expense_date = '2019-09-10';	student_club
SELECT m.last_name  FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id  WHERE e.event_name = 'Women''s Soccer' AND m.position = 'Member';	student_club
SELECT     (COUNT(DISTINCT i.link_to_member) * 100.0) / COUNT(DISTINCT m.member_id) AS percentage FROM member m LEFT JOIN income i ON m.member_id = i.link_to_member AND i.amount = 50 WHERE m.t_shirt_size = 'Medium' AND m.position = 'Member';	student_club
SELECT DISTINCT state  FROM zip_code  WHERE type = 'PO Box';	student_club
SELECT zip_code FROM zip_code WHERE type = 'PO Box' AND county = 'San Juan Municipio' AND state = 'Puerto Rico';	student_club
SELECT event_name FROM event WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20';	student_club
SELECT DISTINCT a.link_to_event FROM attendance a JOIN expense e ON a.link_to_member = e.link_to_member WHERE e.cost > 50;	student_club
SELECT DISTINCT m.member_id, a.link_to_event FROM member m JOIN expense e ON m.member_id = e.link_to_member JOIN attendance a ON m.member_id = a.link_to_member WHERE e.approved = 'true' AND e.expense_date BETWEEN '2019-01-10' AND '2019-11-19';	student_club
SELECT major.college FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Katy' AND member.link_to_major = 'rec1N0upiVLy5esTO';	student_club
SELECT m.phone  FROM member m  JOIN major ma ON m.link_to_major = ma.major_id  WHERE ma.major_name = 'Business' AND ma.college = 'College of Agriculture and Applied Sciences';	student_club
SELECT DISTINCT m.email  FROM member m  JOIN expense e ON m.member_id = e.link_to_member  WHERE e.expense_date BETWEEN '2019-09-10' AND '2019-11-19'  AND e.cost > 20;	student_club
SELECT COUNT(*) FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'education' AND major.college = 'College of Education & Human Services';	student_club
SELECT (COUNT(DISTINCT CASE WHEN b.remaining < 0 THEN e.event_id END) * 100.0) / (SELECT COUNT(*) FROM event) AS percentage FROM event e LEFT JOIN budget b ON e.event_id = b.link_to_event;	student_club
SELECT event_id, location, status  FROM event  WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31';	student_club
SELECT * FROM expense WHERE expense_description IN (SELECT expense_description FROM expense GROUP BY expense_description HAVING AVG(cost) > 50);	student_club
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM member WHERE t_shirt_size = 'X-Large';	student_club
SELECT (SUM(type = 'PO Box') * 100.0) / COUNT(zip_code) FROM zip_code;	student_club
SELECT event.event_name, event.location  FROM event  INNER JOIN budget ON event.event_id = budget.link_to_event  WHERE budget.remaining > 0;	student_club
SELECT event.event_name, event.event_date FROM event JOIN budget ON event.event_id = budget.link_to_event JOIN expense ON budget.budget_id = expense.link_to_budget WHERE expense.expense_description = 'Pizza' AND expense.cost > 50 AND expense.cost < 100;	student_club
SELECT DISTINCT m.first_name, m.last_name, ma.major_name  FROM member m  JOIN expense e ON m.member_id = e.link_to_member  JOIN major ma ON m.link_to_major = ma.major_id  WHERE e.cost > 100;	student_club
SELECT z.city, z.state  FROM event e  JOIN zip_code z ON e.location = z.zip_code  WHERE e.event_id IN (     SELECT a.link_to_event      FROM attendance a      JOIN income i ON a.link_to_member = i.link_to_member      GROUP BY a.link_to_event      HAVING COUNT(i.income_id) > 40 );	student_club
SELECT m.member_id, m.first_name, m.last_name, SUM(e.cost) AS total_paid FROM member m JOIN expense e ON m.member_id = e.link_to_member JOIN budget b ON e.link_to_budget = b.budget_id GROUP BY m.member_id HAVING COUNT(DISTINCT b.link_to_event) > 1 ORDER BY total_paid DESC LIMIT 1;	student_club
SELECT SUM(e.cost)/COUNT(DISTINCT b.link_to_event) FROM expense e JOIN member m ON e.link_to_member = m.member_id JOIN budget b ON e.link_to_budget = b.budget_id WHERE m.position != 'Member';	student_club
SELECT e.event_name  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  JOIN expense ex ON b.budget_id = ex.link_to_budget  WHERE b.category = 'Parking'  GROUP BY e.event_id  HAVING SUM(ex.cost) < (      SELECT AVG(total_cost)      FROM (          SELECT SUM(ex2.cost) AS total_cost          FROM event e2          JOIN budget b2 ON e2.event_id = b2.link_to_event          JOIN expense ex2 ON b2.budget_id = ex2.link_to_budget          WHERE b2.category = 'Parking'          GROUP BY e2.event_id      )  );	student_club
SELECT (SUM(e.cost) / COUNT(DISTINCT ev.event_id)) * 100  FROM event ev  LEFT JOIN budget b ON ev.event_id = b.link_to_event  LEFT JOIN expense e ON b.budget_id = e.link_to_budget  WHERE ev.type = 'Meeting';	student_club
SELECT budget.category  FROM budget  JOIN expense ON budget.budget_id = expense.link_to_budget  WHERE expense.expense_description = 'Water, chips, cookies'  ORDER BY expense.cost DESC  LIMIT 1;	student_club
SELECT      m.first_name,      m.last_name  FROM      member m  JOIN      expense e ON m.member_id = e.link_to_member  GROUP BY      m.member_id  ORDER BY      SUM(e.cost) DESC  LIMIT 5;	student_club
SELECT DISTINCT m.first_name, m.last_name, m.phone  FROM member m  INNER JOIN expense e ON m.member_id = e.link_to_member  WHERE e.cost > (SELECT AVG(cost) FROM expense);	student_club
SELECT ((SUM(CASE WHEN z.state = 'New Jersey' THEN 1 ELSE 0 END) * 1.0 / COUNT(*)) - (SUM(CASE WHEN z.state = 'Vermont' THEN 1 ELSE 0 END) * 1.0 / COUNT(*))) * 100 AS difference FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.position = 'Member';	student_club
SELECT mj.major_name, mj.department  FROM member mem  JOIN major mj ON mem.link_to_major = mj.major_id  WHERE mem.first_name = 'Garrett' AND mem.last_name = 'Gerke';	student_club
SELECT m.first_name || ' ' || m.last_name AS full_name, e.cost  FROM member m  JOIN expense e ON m.member_id = e.link_to_member  WHERE e.expense_description = 'Water, Veggie tray, supplies';	student_club
SELECT m.last_name, m.phone  FROM member m  JOIN major ma ON m.link_to_major = ma.major_id  WHERE ma.major_name = 'Elementary Education';	student_club
SELECT budget.category, budget.amount FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'January Speaker';	student_club
SELECT DISTINCT e.event_name  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  WHERE b.category = 'Food';	student_club
SELECT m.first_name || ' ' || m.last_name AS full_name, i.amount FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.date_received = '9/9/2019';	student_club
SELECT b.category  FROM expense e  JOIN budget b ON e.link_to_budget = b.budget_id  WHERE e.expense_description = 'Posters';	student_club
SELECT m.first_name || ' ' || m.last_name AS full_name, ma.college  FROM member m  JOIN major ma ON m.link_to_major = ma.major_id  WHERE m.position = 'Secretary';	student_club
SELECT event.event_name, SUM(budget.spent) AS total_spent  FROM budget  JOIN event ON budget.link_to_event = event.event_id  WHERE budget.category = 'Speaker Gifts'  GROUP BY event.event_name;	student_club
SELECT z.city FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Garrett' AND m.last_name = 'Gerke';	student_club
SELECT member.first_name, member.last_name, member.position  FROM member  JOIN zip_code ON member.zip = zip_code.zip_code  WHERE zip_code.city = 'Lincolnton'  AND zip_code.state = 'North Carolina'  AND zip_code.zip_code = 28092;	student_club
SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Premium';	debit_card_specializing
SELECT      (1.0 * COUNT(CASE WHEN c.Currency = 'EUR' THEN 1 END)) / NULLIF(COUNT(CASE WHEN c.Currency = 'CZK' THEN 1 END), 0) AS Ratio FROM customers c;	debit_card_specializing
SELECT c.CustomerID FROM customers c LEFT JOIN yearmonth ym ON c.CustomerID = ym.CustomerID AND LEFT(ym.Date, 4) = '2012' WHERE c.Segment = 'LAM' GROUP BY c.CustomerID ORDER BY COALESCE(SUM(ym.Consumption), 0) ASC LIMIT 1;	debit_card_specializing
SELECT AVG(y.Consumption) / 12 AS AverageMonthlyConsumption FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Segment = 'SME' AND SUBSTR(y.Date, 1, 4) = '2013';	debit_card_specializing
SELECT t.CustomerID, SUM(t.Amount) AS TotalConsumption FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID JOIN products p ON t.ProductID = p.ProductID WHERE c.Currency = 'CZK'    AND strftime('%Y', t.Date) = '2011'    AND p.Description = 'Nafta' GROUP BY t.CustomerID ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT COUNT(*) FROM (SELECT c.CustomerID FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Segment = 'KAM' AND ym.Date BETWEEN '201201' AND '201212' GROUP BY c.CustomerID HAVING SUM(ym.Consumption) < 30000);	debit_card_specializing
SELECT      (SUM(CASE WHEN c.Currency = 'CZK' THEN ym.Consumption ELSE 0 END) -       SUM(CASE WHEN c.Currency = 'EUR' THEN ym.Consumption ELSE 0 END)) AS Difference  FROM yearmonth ym  JOIN customers c ON ym.CustomerID = c.CustomerID  WHERE ym.Date BETWEEN '201201' AND '201212';	debit_card_specializing
SELECT SUBSTR(ym.Date, 1, 4) AS Year, SUM(ym.Consumption) AS Total FROM yearmonth ym JOIN customers c ON ym.CustomerID = c.CustomerID WHERE c.Currency = 'EUR' GROUP BY Year ORDER BY Total DESC LIMIT 1;	debit_card_specializing
SELECT c.Segment  FROM customers c  JOIN yearmonth ym ON c.CustomerID = ym.CustomerID  GROUP BY c.Segment  ORDER BY SUM(ym.Consumption) ASC  LIMIT 1;	debit_card_specializing
SELECT SUBSTR(ym.Date, 1, 4) AS Year, SUM(ym.Consumption) AS TotalConsumption FROM yearmonth ym JOIN customers c ON ym.CustomerID = c.CustomerID JOIN transactions_1k t ON ym.CustomerID = t.CustomerID AND SUBSTR(t.Date, 1, 4) || SUBSTR(t.Date, 6, 2) = ym.Date JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE' GROUP BY Year ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT ym.Date  FROM yearmonth ym  JOIN customers c ON ym.CustomerID = c.CustomerID  WHERE c.Segment = 'SME' AND SUBSTR(ym.Date, 1, 4) = '2013'  GROUP BY ym.Date  ORDER BY SUM(ym.Consumption) DESC  LIMIT 1;	debit_card_specializing
WITH CustomerConsumption AS (     SELECT c.CustomerID, c.Segment, SUM(ym.Consumption) AS Total     FROM customers c     JOIN yearmonth ym ON c.CustomerID = ym.CustomerID     WHERE ym.Date BETWEEN '201301' AND '201312'     GROUP BY c.CustomerID, c.Segment ), SegmentMin AS (     SELECT Segment, MIN(Total) AS MinTotal     FROM CustomerConsumption     GROUP BY Segment ), MinimalCustomers AS (     SELECT cc.CustomerID, cc.Segment, cc.Total     FROM CustomerConsumption cc     JOIN SegmentMin sm ON cc.Segment = sm.Segment AND cc.Total = sm.MinTotal ), SegmentAvg AS (     SELECT Segment, SUM(Total) / COUNT(*) AS AvgConsumption     FROM MinimalCustomers     GROUP BY Segment ) SELECT      (SELECT AvgConsumption FROM SegmentAvg WHERE Segment = 'SME') - (SELECT AvgConsumption FROM SegmentAvg WHERE Segment = 'LAM') AS SME_LAM_Diff,     (SELECT AvgConsumption FROM SegmentAvg WHERE Segment = 'LAM') - (SELECT AvgConsumption FROM SegmentAvg WHERE Segment = 'KAM') AS LAM_KAM_Diff,     (SELECT AvgConsumption FROM SegmentAvg WHERE Segment = 'KAM') - (SELECT AvgConsumption FROM SegmentAvg WHERE Segment = 'SME') AS KAM_SME_Diff;	debit_card_specializing
WITH segments (Segment) AS (     SELECT 'SME' UNION ALL SELECT 'LAM' UNION ALL SELECT 'KAM' ), consumption AS (     SELECT          s.Segment,         SUM(CASE WHEN SUBSTR(ym.Date, 1, 4) = '2012' THEN ym.Consumption ELSE 0 END) AS c2012,         SUM(CASE WHEN SUBSTR(ym.Date, 1, 4) = '2013' THEN ym.Consumption ELSE 0 END) AS c2013     FROM segments s     LEFT JOIN customers c ON s.Segment = c.Segment AND c.Currency = 'EUR'     LEFT JOIN yearmonth ym ON c.CustomerID = ym.CustomerID     GROUP BY s.Segment ), percentages AS (     SELECT          Segment,         (c2013 - c2012) * 100.0 / NULLIF(c2013, 0) AS pct_increase     FROM consumption ) SELECT Segment, pct_increase FROM percentages WHERE pct_increase = (SELECT MAX(pct_increase) FROM percentages) UNION ALL SELECT Segment, pct_increase FROM percentages WHERE pct_increase = (SELECT MIN(pct_increase) FROM percentages);	debit_card_specializing
SELECT SUM(Consumption)  FROM yearmonth  WHERE CustomerID = 6  AND Date BETWEEN '201308' AND '201311';	debit_card_specializing
SELECT      (SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Value for money')      -      (SELECT COUNT(*) FROM gasstations WHERE Country = 'SVK' AND Segment = 'Value for money')      AS Difference;	debit_card_specializing
SELECT (y7.Consumption - y5.Consumption) AS Difference FROM yearmonth y7, yearmonth y5 WHERE y7.CustomerID = 7 AND y7.Date = '201304' AND y5.CustomerID = 5 AND y5.Date = '201304';	debit_card_specializing
SELECT (SELECT COUNT(*) FROM customers WHERE Segment = 'SME' AND Currency = 'CZK') - (SELECT COUNT(*) FROM customers WHERE Segment = 'SME' AND Currency = 'EUR') AS Difference;	debit_card_specializing
SELECT c.CustomerID, MAX(ym.Consumption)  FROM customers c  JOIN yearmonth ym ON c.CustomerID = ym.CustomerID  WHERE c.Segment = 'LAM' AND c.Currency = 'EUR' AND ym.Date = '201310'  GROUP BY c.CustomerID  ORDER BY MAX(ym.Consumption) DESC  LIMIT 1;	debit_card_specializing
SELECT c.CustomerID, SUM(ym.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Segment = 'LAM' GROUP BY c.CustomerID ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT SUM(ym.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Segment = 'KAM' AND ym.Date = '201305';	debit_card_specializing
SELECT (SUM(CASE WHEN total_consumption > 46.73 THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS percentage FROM (SELECT c.CustomerID, COALESCE(SUM(ym.Consumption), 0) AS total_consumption FROM customers c LEFT JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Segment = 'LAM' GROUP BY c.CustomerID) AS subquery;	debit_card_specializing
SELECT Country, COUNT(GasStationID) AS TotalValueForMoney  FROM gasstations  WHERE Segment = 'Value for money'  GROUP BY Country  ORDER BY TotalValueForMoney DESC;	debit_card_specializing
SELECT (COUNT(CASE WHEN c.Currency = 'EUR' THEN 1 END) * 100.0 / COUNT(*)) AS Percentage FROM customers c WHERE c.Segment = 'KAM';	debit_card_specializing
SELECT      (100.0 * SUM(CASE WHEN Consumption > 528.3 THEN 1 ELSE 0 END)) / COUNT(*) AS Percentage FROM yearmonth WHERE Date = '201202';	debit_card_specializing
SELECT (COUNT(CASE WHEN Segment = 'Premium' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM gasstations WHERE Country = 'SVK';	debit_card_specializing
SELECT CustomerID FROM yearmonth WHERE Date = '201309' ORDER BY Consumption DESC LIMIT 1;	debit_card_specializing
SELECT c.Segment  FROM customers c  JOIN yearmonth ym ON c.CustomerID = ym.CustomerID  WHERE ym.Date = '201309'  GROUP BY c.Segment  ORDER BY SUM(ym.Consumption) ASC  LIMIT 1;	debit_card_specializing
SELECT y.CustomerID  FROM customers c  JOIN yearmonth y ON c.CustomerID = y.CustomerID  WHERE c.Segment = 'SME' AND y.Date = '201206'  ORDER BY y.Consumption ASC  LIMIT 1;	debit_card_specializing
SELECT MAX(Consumption) FROM yearmonth WHERE substr(Date, 1, 4) = '2012';	debit_card_specializing
SELECT MAX(TotalConsumption / 12) AS BiggestMonthlyConsumption FROM (     SELECT y.CustomerID, SUM(y.Consumption) AS TotalConsumption     FROM yearmonth y     JOIN customers c ON y.CustomerID = c.CustomerID     WHERE c.Currency = 'EUR'     GROUP BY y.CustomerID ) AS CustomerTotals;	debit_card_specializing
SELECT p.Description  FROM transactions_1k t JOIN products p ON t.ProductID = p.ProductID WHERE strftime('%Y%m', t.Date) = '201309';	debit_card_specializing
SELECT DISTINCT g.Country  FROM transactions_1k t  JOIN gasstations g ON t.GasStationID = g.GasStationID  WHERE strftime('%Y%m', t.Date) = '201306';	debit_card_specializing
SELECT DISTINCT g.ChainID  FROM transactions_1k t  JOIN customers c ON t.CustomerID = c.CustomerID  JOIN gasstations g ON t.GasStationID = g.GasStationID  WHERE c.Currency = 'EUR';	debit_card_specializing
SELECT DISTINCT p.Description  FROM transactions_1k t  JOIN customers c ON t.CustomerID = c.CustomerID  JOIN products p ON t.ProductID = p.ProductID  WHERE c.Currency = 'EUR';	debit_card_specializing
SELECT AVG(Price * Amount) FROM transactions_1k WHERE strftime('%Y-%m', Date) = '2012-01';	debit_card_specializing
SELECT COUNT(DISTINCT c.CustomerID) FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Currency = 'EUR' AND ym.Consumption > 1000;	debit_card_specializing
SELECT p.Description  FROM transactions_1k t  JOIN gasstations g ON t.GasStationID = g.GasStationID  JOIN products p ON t.ProductID = p.ProductID  WHERE g.Country = 'CZE';	debit_card_specializing
SELECT DISTINCT t.Time  FROM transactions_1k t  JOIN gasstations g ON t.GasStationID = g.GasStationID  WHERE g.ChainID = 11;	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE' AND t.Price > 1000;	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k t  JOIN gasstations g ON t.GasStationID = g.GasStationID  WHERE g.Country = 'CZE'  AND t.Date > '2012-01-01';	debit_card_specializing
SELECT AVG(t.Price * t.Amount) FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE';	debit_card_specializing
SELECT AVG(t.Price * t.Amount)  FROM transactions_1k t  JOIN customers c ON t.CustomerID = c.CustomerID  WHERE c.Currency = 'EUR';	debit_card_specializing
SELECT transactions_1k.CustomerID, SUM(transactions_1k.Amount * transactions_1k.Price) AS TotalPaid FROM transactions_1k WHERE transactions_1k.Date = '2012-08-25' GROUP BY transactions_1k.CustomerID ORDER BY TotalPaid DESC LIMIT 1;	debit_card_specializing
SELECT g.Country  FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.Date = '2012-08-25' ORDER BY t.Time ASC LIMIT 1;	debit_card_specializing
SELECT c.Currency  FROM transactions_1k t  JOIN customers c ON t.CustomerID = c.CustomerID  WHERE t.Date = '2012-08-24' AND t.Time = '16:25:00';	debit_card_specializing
SELECT c.Segment FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE t.Date = '2012-08-23' AND t.Time = '21:20:00';	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k t  JOIN gasstations g ON t.GasStationID = g.GasStationID  WHERE t.Date = '2012-08-26'  AND t.Time < '13:00:00'  AND g.Country = 'CZE';	debit_card_specializing
SELECT Segment FROM customers WHERE CustomerID = (SELECT MIN(CustomerID) FROM customers);	debit_card_specializing
SELECT g.Country  FROM transactions_1k t  JOIN gasstations g ON t.GasStationID = g.GasStationID  WHERE t.Date = '2012-08-24' AND t.Time = '12:42:00';	debit_card_specializing
SELECT ProductID FROM transactions_1k WHERE Date = '2012-08-23' AND Time = '21:20:00';	debit_card_specializing
WITH target_customer AS (     SELECT CustomerID     FROM transactions_1k     WHERE Date = '2012-08-24' AND Price = 124.05 ) SELECT      t.Date,     t.Price AS Expense,     SUM(t.Price) OVER () AS TotalSpent FROM transactions_1k t JOIN target_customer tc ON t.CustomerID = tc.CustomerID WHERE strftime('%Y-%m', t.Date) = '2012-01';	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k  JOIN gasstations USING (GasStationID)  WHERE Date = '2012-08-26'    AND Time BETWEEN '08:00:00' AND '09:00:00'    AND gasstations.Country = 'CZE';	debit_card_specializing
SELECT c.Currency  FROM customers c  JOIN yearmonth ym ON c.CustomerID = ym.CustomerID  WHERE ym.Date = '201306' AND ym.Consumption = 214582.17;	debit_card_specializing
SELECT gasstations.Country  FROM transactions_1k  JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID  WHERE transactions_1k.CardID = 667467  LIMIT 1;	debit_card_specializing
SELECT gasstations.Country  FROM transactions_1k  JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID  WHERE transactions_1k.Date = '2012-08-24'  AND (transactions_1k.Amount * transactions_1k.Price) = 548.4;	debit_card_specializing
SELECT      (COUNT(DISTINCT CASE WHEN c.Currency = 'EUR' THEN t.CustomerID END) * 100.0)      /      COUNT(DISTINCT t.CustomerID) AS percentage FROM transactions_1k t LEFT JOIN customers c ON t.CustomerID = c.CustomerID WHERE t.Date = '2012-08-25';	debit_card_specializing
WITH target_customer AS (   SELECT CustomerID   FROM transactions_1k   WHERE Date = '2012-08-25' AND (Amount * Price) = 634.8 ) SELECT    (SUM(CASE WHEN SUBSTR(ym.Date, 1, 4) = '2012' THEN ym.Consumption ELSE 0 END) -     SUM(CASE WHEN SUBSTR(ym.Date, 1, 4) = '2013' THEN ym.Consumption ELSE 0 END)) /    SUM(CASE WHEN SUBSTR(ym.Date, 1, 4) = '2012' THEN ym.Consumption ELSE 0 END) AS DecreaseRate FROM yearmonth ym JOIN target_customer tc ON ym.CustomerID = tc.CustomerID;	debit_card_specializing
SELECT `GasStationID`  FROM `transactions_1k`  GROUP BY `GasStationID`  ORDER BY SUM(`Amount` * `Price`) DESC  LIMIT 1;	debit_card_specializing
SELECT      (COUNT(CASE WHEN g.Segment = 'Premium' THEN 1 END) * 100.0) / COUNT(*) AS Percentage FROM gasstations g WHERE g.Country = 'SVK';	debit_card_specializing
SELECT      SUM(t.Amount * t.Price) AS TotalAmountSpent,     SUM(CASE WHEN strftime('%Y%m', t.Date) = '201201' THEN t.Amount * t.Price ELSE 0 END) AS January2012Spent FROM transactions_1k t WHERE t.CustomerID = 38508;	debit_card_specializing
SELECT p.Description  FROM transactions_1k t  JOIN products p ON t.ProductID = p.ProductID  GROUP BY t.ProductID  ORDER BY SUM(t.Amount) DESC  LIMIT 5;	debit_card_specializing
SELECT      c.CustomerID,     (t.total_price / t.total_amount) AS average_price_per_item,     c.Currency FROM (     SELECT          CustomerID,         SUM(Price) AS total_price,         SUM(Amount) AS total_amount     FROM transactions_1k     GROUP BY CustomerID     ORDER BY total_price DESC     LIMIT 1 ) t JOIN customers c ON t.CustomerID = c.CustomerID;	debit_card_specializing
SELECT DISTINCT g.Country  FROM transactions_1k t  JOIN gasstations g ON t.GasStationID = g.GasStationID  WHERE t.ProductID = 2  AND t.Price = (SELECT MAX(Price) FROM transactions_1k WHERE ProductID = 2);	debit_card_specializing
SELECT ym.CustomerID, ym.Date, ym.Consumption FROM yearmonth ym WHERE ym.Date = '201208' AND ym.CustomerID IN (     SELECT DISTINCT t.CustomerID     FROM transactions_1k t     WHERE t.ProductID = 5     AND (t.Price / t.Amount) > 29.00 );	debit_card_specializing
