SELECT MAX(`Free Meal Count (K-12)` / `Enrollment (K-12)`) FROM `frpm` JOIN `schools` ON `frpm`.`CDSCode` = `schools`.`CDSCode` WHERE `schools`.`County` = 'Alameda';	california_schools
SELECT      (frpm.`Free Meal Count (Ages 5-17)` / frpm.`Enrollment (Ages 5-17)`) AS eligible_free_rate FROM      frpm JOIN      schools ON frpm.CDSCode = schools.CDSCode WHERE      schools.StatusType = 'Continuation' ORDER BY      eligible_free_rate ASC LIMIT 3;	california_schools
SELECT schools.Zip FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode WHERE frpm."Charter School (Y/N)" = 1 AND schools.District = 'Fresno County Office of Education';	california_schools
SELECT s.MailStreet FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode ORDER BY f.`FRPM Count (K-12)` DESC LIMIT 1;	california_schools
SELECT schools.Phone FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode WHERE frpm.`Charter School (Y/N)` = 1 AND schools.OpenDate > '2000-01-01';	california_schools
SELECT COUNT(*) FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE AvgScrMath > 400 AND Virtual = 'F';	california_schools
SELECT satscores.sname FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE satscores.NumTstTakr > 500 AND schools.Magnet = 1;	california_schools
SELECT schools.Phone FROM schools JOIN satscores ON schools.CDSCode = satscores.cds GROUP BY schools.CDSCode ORDER BY SUM(satscores.NumGE1500) DESC LIMIT 1;	california_schools
SELECT SUM(s.NumTstTakr) FROM satscores s JOIN frpm f ON s.cds = f.CDSCode WHERE f.`FRPM Count (K-12)` = (SELECT MAX(`FRPM Count (K-12)`) FROM frpm WHERE `FRPM Count (K-12)` IS NOT NULL);	california_schools
SELECT COUNT(DISTINCT s.cds) FROM satscores s JOIN schools sc ON s.cds = sc.CDSCode WHERE s.AvgScrMath > 560 AND sc.Charter = 1;	california_schools
SELECT `FRPM Count (Ages 5-17)` FROM satscores JOIN frpm ON satscores.cds = frpm.CDSCode ORDER BY AvgScrRead DESC LIMIT 1;	california_schools
SELECT `CDSCode` FROM `frpm` WHERE (`Enrollment (K-12)` + `Enrollment (Ages 5-17)`) > 500;	california_schools
SELECT MAX(`Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)`) FROM satscores JOIN frpm ON satscores.cds = frpm.CDSCode WHERE `NumGE1500` / `NumTstTakr` > 0.3;	california_schools
SELECT schools.Phone FROM schools JOIN satscores ON schools.CDSCode = satscores.cds ORDER BY (satscores.NumGE1500 / satscores.NumTstTakr) DESC LIMIT 3;	california_schools
SELECT frpm.`CDSCode`, schools.`NCESSchool`, frpm.`Enrollment (Ages 5-17)` FROM frpm JOIN schools ON frpm.`CDSCode` = schools.`CDSCode` ORDER BY frpm.`Enrollment (Ages 5-17)` DESC LIMIT 5;	california_schools
SELECT sc.District, AVG(s.AvgScrRead) AS AvgReadingScore FROM satscores s JOIN schools sc ON s.cds = sc.CDSCode WHERE sc.StatusType = 'Active' AND s.rtype = 'Reading' GROUP BY sc.District ORDER BY AvgReadingScore DESC LIMIT 1;	california_schools
SELECT COUNT(*) FROM schools JOIN satscores ON schools.CDSCode = satscores.cds WHERE schools.County = 'Alameda' AND satscores.NumTstTakr < 100;	california_schools
SELECT s.CharterNum, ss.AvgScrWrite FROM satscores ss JOIN schools s ON ss.cds = s.CDSCode WHERE ss.AvgScrWrite > 499 AND s.CharterNum IS NOT NULL ORDER BY ss.AvgScrWrite DESC;	california_schools
SELECT COUNT(*) FROM schools JOIN satscores ON schools.CDSCode = satscores.cds WHERE schools.County = 'Fresno' AND schools.FundingType = 'Directly Funded' AND satscores.NumTstTakr <= 250;	california_schools
SELECT schools.Phone FROM schools JOIN satscores ON schools.CDSCode = satscores.cds ORDER BY satscores.AvgScrMath DESC LIMIT 1;	california_schools
SELECT COUNT(*) FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.County = 'Amador' AND frpm.`Low Grade` = '9' AND frpm.`High Grade` = '12';	california_schools
SELECT COUNT(*) FROM frpm WHERE "County Name" = 'Los Angeles' AND "Free Meal Count (K-12)" > 500 AND "FRPM Count (K-12)" < 700;	california_schools
SELECT s.sname FROM satscores s JOIN schools sc ON s.cds = sc.CDSCode WHERE sc.County = 'Contra Costa' ORDER BY s.NumTstTakr DESC LIMIT 1;	california_schools
SELECT frpm.`School Name`, schools.`Street`, schools.`City`, schools.`State`, schools.`Zip` FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE (frpm.`Enrollment (K-12)` - frpm.`Enrollment (Ages 5-17)`) > 30;	california_schools
SELECT frpm.`School Name` FROM frpm JOIN satscores ON frpm.CDSCode = satscores.cds WHERE (frpm.`Free Meal Count (K-12)` / frpm.`Enrollment (K-12)`) > 0.1 AND satscores.NumGE1500 > 0;	california_schools
SELECT s.School, s.FundingType FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds WHERE s.County = 'Riverside' AND sat.AvgScrMath > 400;	california_schools
SELECT schools.School, schools.Street, schools.City, schools.State, schools.Zip  FROM schools  JOIN frpm ON schools.CDSCode = frpm.CDSCode  WHERE schools.County = 'Monterey'  AND frpm.`Free Meal Count (Ages 5-17)` > 800  AND schools.StatusType = 'High School';	california_schools
SELECT      schools.School AS SchoolName,     satscores.AvgScrWrite AS WritingScore,     schools.Phone AS CommunicationNumber FROM      schools JOIN      satscores ON schools.CDSCode = satscores.cds WHERE      schools.OpenDate > '1991-12-31' OR schools.ClosedDate < '2000-01-01';	california_schools
SELECT schools.School, schools.DOCType FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.FundingType = 'Locally Funded' AND (`Enrollment (K-12)` - `Enrollment (Ages 5-17)`) > (     SELECT AVG(`Enrollment (K-12)` - `Enrollment (Ages 5-17)`)     FROM frpm     JOIN schools ON frpm.CDSCode = schools.CDSCode     WHERE schools.FundingType = 'Locally Funded' );	california_schools
SELECT s.OpenDate FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f."Enrollment (K-12)" = (SELECT MAX("Enrollment (K-12)") FROM frpm) ORDER BY s.OpenDate ASC LIMIT 1;	california_schools
SELECT s.City, SUM(f.`Enrollment (K-12)`) AS TotalEnrollment FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode GROUP BY s.City ORDER BY TotalEnrollment ASC LIMIT 5;	california_schools
SELECT      (Free Meal Count (K-12) / Enrollment (K-12)) AS EligibleFreeRate FROM frpm ORDER BY Enrollment (K-12) DESC LIMIT 2 OFFSET 9;	california_schools
SELECT      (frpm.`FRPM Count (K-12)` / frpm.`Enrollment (K-12)`) AS eligible_rate FROM      frpm JOIN      schools ON frpm.CDSCode = schools.CDSCode WHERE      schools.StatusType = '66' ORDER BY      frpm.`FRPM Count (K-12)` DESC LIMIT 5;	california_schools
SELECT frpm."School Name", schools.Website FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE frpm."Free Meal Count (Ages 5-17)" BETWEEN 1900 AND 2000;	california_schools
SELECT      (frpm.`Free Meal Count (Ages 5-17)` / frpm.`Enrollment (Ages 5-17)`) AS `Free Rate` FROM      frpm JOIN      schools ON frpm.CDSCode = schools.CDSCode WHERE      schools.AdmFName1 = 'Kacey' AND schools.AdmLName1 = 'Gibson';	california_schools
SELECT schools.AdmEmail1 FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode WHERE frpm.`Charter School (Y/N)` = 1 ORDER BY frpm.`Enrollment (K-12)` ASC LIMIT 1;	california_schools
SELECT      AdmFName1, AdmLName1,     AdmFName2, AdmLName2,     AdmFName3, AdmLName3 FROM schools WHERE CDSCode = (     SELECT cds     FROM satscores     ORDER BY NumGE1500 DESC     LIMIT 1 );	california_schools
SELECT schools.Street, schools.City, schools.State, schools.Zip FROM schools JOIN satscores ON schools.CDSCode = satscores.cds ORDER BY (satscores.NumGE1500 / satscores.NumTstTakr) ASC LIMIT 1;	california_schools
SELECT schools.Website FROM schools JOIN satscores ON schools.CDSCode = satscores.cds WHERE schools.County = 'Los Angeles County' AND satscores.NumTstTakr BETWEEN 2000 AND 3000;	california_schools
SELECT AVG(sat.NumTstTakr) FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds WHERE s.County = 'Fresno' AND s.OpenDate BETWEEN '1980-01-01' AND '1980-12-31'	california_schools
SELECT schools.Phone FROM schools JOIN satscores ON schools.CDSCode = satscores.cds WHERE satscores.dname = 'Fresno Unified' AND satscores.AvgScrRead IS NOT NULL ORDER BY satscores.AvgScrRead ASC LIMIT 1;	california_schools
SELECT      s.School FROM      schools s JOIN      satscores sc ON s.CDSCode = sc.cds WHERE      s.Virtual = 'F'     AND sc.AvgScrRead IS NOT NULL ORDER BY      s.County, sc.AvgScrRead DESC LIMIT 5;	california_schools
SELECT s.EdOpsName FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE sc.AvgScrMath = (SELECT MAX(AvgScrMath) FROM satscores);	california_schools
SELECT s.AvgScrMath, sc.County FROM satscores s JOIN schools sc ON s.cds = sc.CDSCode WHERE (s.AvgScrMath + s.AvgScrRead + s.AvgScrWrite) = (SELECT MIN(total_avg) FROM (SELECT (AvgScrMath + AvgScrRead + AvgScrWrite) AS total_avg FROM satscores JOIN schools ON satscores.cds = schools.CDSCode) AS sub)	california_schools
SELECT sc.City, s.AvgScrWrite FROM satscores s JOIN schools sc ON s.cds = sc.CDSCode WHERE s.NumGE1500 = (SELECT MAX(NumGE1500) FROM satscores);	california_schools
SELECT schools.School, satscores.AvgScrWrite FROM schools JOIN satscores ON schools.CDSCode = satscores.cds WHERE schools.AdmFName1 = 'Ricci' AND schools.AdmLName1 = 'Ulrich';	california_schools
SELECT schools.CDSCode, schools.School, frpm.`Enrollment (K-12)` FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode WHERE schools.DOC = '31' ORDER BY frpm.`Enrollment (K-12)` DESC LIMIT 1;	california_schools
SELECT COUNT(*) / 12 AS monthly_avg FROM schools WHERE County = 'Alameda' AND DOC = '52' AND OpenDate BETWEEN '1980-01-01' AND '1980-12-31';	california_schools
SELECT    SUM(CASE WHEN DOC = '54' THEN 1 ELSE 0 END) * 1.0 /    SUM(CASE WHEN DOC = '52' THEN 1 ELSE 0 END) AS ratio FROM schools WHERE County = 'Orange County';	california_schools
SELECT County, School, ClosedDate FROM schools WHERE StatusType = 'Closed' AND County IN (SELECT County FROM schools WHERE StatusType = 'Closed' GROUP BY County HAVING COUNT(*) = (SELECT MAX(ClosedCount) FROM (SELECT COUNT(*) AS ClosedCount FROM schools WHERE StatusType = 'Closed' GROUP BY County) AS CountyCounts)) ORDER BY County;	california_schools
SELECT s.sname, sc.MailStreet FROM satscores s JOIN schools sc ON s.cds = sc.CDSCode ORDER BY s.AvgScrMath DESC LIMIT 1 OFFSET 6;	california_schools
SELECT s.MailStreet, s.School FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds WHERE sat.AvgScrRead IS NOT NULL ORDER BY sat.AvgScrRead ASC LIMIT 1;	california_schools
SELECT COUNT(*) FROM schools JOIN satscores ON schools.CDSCode = satscores.cds WHERE schools.MailCity = 'Lakeport' AND (satscores.AvgScrRead + satscores.AvgScrMath + satscores.AvgScrWrite) >= 1500;	california_schools
SELECT SUM(NumTstTakr) FROM satscores JOIN schools ON schools.CDSCode = satscores.cds WHERE schools.MailCity = 'Fresno';	california_schools
SELECT School, MailZip FROM schools WHERE AdmFName1 = 'Avetik' AND AdmLName1 = 'Atoian';	california_schools
SELECT    SUM(CASE WHEN County = 'Colusa' THEN 1 ELSE 0 END) /    SUM(CASE WHEN County = 'Humboldt' THEN 1 ELSE 0 END) AS ratio FROM schools WHERE MailState = 'CA';	california_schools
SELECT COUNT(*) FROM schools WHERE MailState = 'CA' AND City = 'San Joaquin' AND StatusType = 'Active';	california_schools
SELECT schools.Phone, schools.Ext FROM schools JOIN satscores ON schools.CDSCode = satscores.cds ORDER BY satscores.AvgScrWrite DESC LIMIT 1 OFFSET 332;	california_schools
SELECT `School`, `Phone`, `Ext` FROM `schools` WHERE `Zip` = '95203-3704';	california_schools
SELECT Website FROM schools WHERE (AdmFName1 = 'Mike' AND AdmLName1 = 'Larson') OR (AdmFName1 = 'Dante' AND AdmLName1 = 'Alvarez') OR (AdmFName2 = 'Mike' AND AdmLName2 = 'Larson') OR (AdmFName2 = 'Dante' AND AdmLName2 = 'Alvarez') OR (AdmFName3 = 'Mike' AND AdmLName3 = 'Larson') OR (AdmFName3 = 'Dante' AND AdmLName3 = 'Alvarez');	california_schools
SELECT Website FROM schools WHERE County = 'San Joaquin' AND Virtual = 'P' AND Charter = 1;	california_schools
SELECT COUNT(*) FROM schools WHERE City = 'Hickman' AND DOC = '52' AND Charter = 1;	california_schools
SELECT COUNT(*) FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.Charter = 0 AND schools.County = 'Los Angeles' AND (frpm.`Free Meal Count (K-12)` * 100.0 / frpm.`Enrollment (K-12)`) < 0.18;	california_schools
SELECT AdmFName1, AdmLName1, AdmFName2, AdmLName2, AdmFName3, AdmLName3, School, City FROM schools WHERE Charter = 1 AND CharterNum = '00D2'	california_schools
SELECT COUNT(*) FROM schools WHERE MailCity = 'Hickman' AND CharterNum = '00D4';	california_schools
SELECT      (COUNT(CASE WHEN frpm."Charter Funding Type" = 'Locally Funded' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM      schools JOIN      frpm ON schools.CDSCode = frpm.CDSCode WHERE      schools.County = 'Santa Clara';	california_schools
SELECT COUNT(*) FROM schools WHERE County = 'Stanislaus' AND FundingType = 'Directly Funded' AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31';	california_schools
SELECT COUNT(*) FROM schools WHERE City = 'San Francisco' AND YEAR(ClosedDate) = 1989;	california_schools
SELECT County, COUNT(*) AS num_closures FROM schools WHERE SOC = '11' AND ClosedDate BETWEEN '1980-01-01' AND '1989-12-31' AND ClosedDate IS NOT NULL GROUP BY County ORDER BY num_closures DESC LIMIT 1;	california_schools
SELECT NCESDist FROM schools WHERE SOC = '31';	california_schools
SELECT COUNT(*) FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode WHERE schools.County = 'Alpine' AND frpm.`School Type` = 'Community Day School' AND schools.StatusType IN ('Active', 'Closed');	california_schools
SELECT frpm."District Code" FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode WHERE schools.Magnet = 0 AND schools.City = 'Fresno';	california_schools
SELECT frpm."Enrollment (Ages 5-17)"  FROM frpm  JOIN schools ON frpm.CDSCode = schools.CDSCode  WHERE schools.EdOpsCode = 'SSS'  AND schools.City = 'Fremont'  AND frpm."Academic Year" = '2014-2015';	california_schools
SELECT `Free Meal Count (Ages 5-17)` FROM `frpm` INNER JOIN `schools` ON `frpm`.`CDSCode` = `schools`.`CDSCode` WHERE `schools`.`MailStreet` = 'PO Box 1040' AND `schools`.`StatusType` = 'Youth Authority';	california_schools
SELECT `Low Grade` FROM `frpm` INNER JOIN `schools` ON `frpm`.`CDSCode` = `schools`.`CDSCode` WHERE `schools`.`EdOpsCode` = 'SPECON' AND `schools`.`NCESDist` = '0613360';	california_schools
SELECT `Educational Option Type`, `School Name` FROM frpm WHERE `County Code` = '37' AND `NSLP Provision Status` = '2';	california_schools
SELECT schools.City FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode WHERE schools.EILCode = 'HS' AND frpm.`Low Grade` = '9' AND frpm.`High Grade` = '12' AND frpm.`NSLP Provision Status` = '2' AND schools.County = 'Merced';	california_schools
SELECT schools.School, (frpm.`FRPM Count (Ages 5-17)` / frpm.`Enrollment (Ages 5-17)`) * 100 AS PercentEligibleFRPM FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.County = 'Los Angeles' AND frpm.`Low Grade` = 'K' AND frpm.`High Grade` = '9';	california_schools
SELECT GSoffered, COUNT(*) AS count FROM schools WHERE City = 'Adelanto' GROUP BY GSoffered ORDER BY count DESC LIMIT 1;	california_schools
SELECT County, COUNT(*) AS num_schools FROM schools WHERE Virtual = 'F' AND County IN ('San Diego', 'Santa Barbara') GROUP BY County ORDER BY num_schools DESC LIMIT 1;	california_schools
SELECT schools.School, schools.Latitude, frpm.`School Type` FROM schools JOIN frpm ON schools.CDSCode = frpm.cds ORDER BY schools.Latitude DESC LIMIT 1;	california_schools
SELECT      frpm.`School Name`,      schools.`City`,      frpm.`Low Grade` FROM      schools JOIN frpm ON schools.`CDSCode` = frpm.`CDSCode` WHERE      schools.`State` = 'CA' ORDER BY      schools.`Latitude` ASC LIMIT 1;	california_schools
SELECT GSoffered FROM schools ORDER BY ABS(Longitude) DESC LIMIT 1;	california_schools
SELECT COUNT(*) AS MultipleProvisionCount FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.Magnet = 1 AND f.`Low Grade` = 'K' AND f.`High Grade` = '8' AND f.`NSLP Provision Status` = 'Multiple Provision Types'; SELECT s.City COUNT(*) AS SchoolCount FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.Magnet = 1 AND f.`Low Grade` = 'K' AND f.`High Grade` = '8' GROUP BY s.City;	california_schools
WITH AdminNames AS (     SELECT AdmFName1 AS FirstName, District     FROM schools     UNION ALL     SELECT AdmFName2, District     FROM schools     UNION ALL     SELECT AdmFName3, District     FROM schools ), TopNames AS (     SELECT FirstName     FROM AdminNames     GROUP BY FirstName     ORDER BY COUNT(*) DESC     LIMIT 2 ) SELECT FirstName, District FROM AdminNames WHERE FirstName IN (SELECT FirstName FROM TopNames) GROUP BY FirstName, District ORDER BY FirstName, District	california_schools
SELECT      (frpm.`Free Meal Count (K-12)` / frpm.`Enrollment (K-12)` * 100) AS `Percent (%) Eligible Free (K-12)`,     frpm.`District Code` FROM      frpm JOIN      schools ON frpm.CDSCode = schools.CDSCode WHERE      schools.AdmFName1 = 'Alusine';	california_schools
SELECT AdmLName1, District, County, School FROM schools WHERE CharterNum = '40';	california_schools
SELECT AdmEmail1, AdmEmail2, AdmEmail3 FROM schools WHERE County = 'San Bernardino County' AND District = 'San Bernardino City Unified' AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND StatusType = 'Public' AND (SOC = '62' OR DOC = '54');	california_schools
SELECT s.sname, sc.AdmEmail1 FROM satscores s JOIN schools sc ON s.cds = sc.CDSCode ORDER BY s.NumGE1500 DESC LIMIT 1;	california_schools
SELECT COUNT(*) FROM account JOIN district ON account.district_id = district.district_id WHERE account.frequency = 'POPLATEK PO OBRATU' AND district.A3 = 'East Bohemia';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN district d ON a.district_id = d.district_id JOIN loan l ON a.account_id = l.account_id WHERE d.A3 = 'Prague';	financial
SELECT AVG(A12) AS avg_1995, AVG(A13) AS avg_1996 FROM district;	financial
SELECT COUNT(DISTINCT d.district_id) FROM district d JOIN client c ON d.district_id = c.district_id WHERE c.gender = 'F' AND d.A11 BETWEEN 6000 AND 10000;	financial
SELECT COUNT(*) FROM client JOIN district ON client.district_id = district.district_id WHERE client.gender = 'M' AND district.A3 = 'North Bohemia' AND district.A11 > 8000;	financial
SELECT d.account_id FROM disp d JOIN client c ON d.client_id = c.client_id JOIN district dt ON c.district_id = dt.district_id WHERE c.gender = 'F' AND c.birth_date = (SELECT MIN(birth_date) FROM client WHERE gender = 'F') AND dt.A11 = (     SELECT MIN(dt2.A11)     FROM client c2     JOIN district dt2 ON c2.district_id = dt2.district_id     WHERE c2.gender = 'F'     AND c2.birth_date = (SELECT MIN(birth_date) FROM client WHERE gender = 'F') );  SELECT (SELECT MAX(A11) FROM district) - (     SELECT dt.A11     FROM client c     JOIN district dt ON c.district_id = dt.district_id     WHERE c.gender = 'F'     AND c.birth_date = (SELECT MIN(birth_date) FROM client WHERE gender = 'F')     ORDER BY dt.A11 ASC     LIMIT 1 );	financial
SELECT d.account_id FROM disp d JOIN client c ON d.client_id = c.client_id JOIN district dt ON c.district_id = dt.district_id WHERE c.birth_date = (SELECT MAX(birth_date) FROM client) AND dt.A11 = (     SELECT MAX(A11)     FROM client c2     JOIN district dt2 ON c2.district_id = dt2.district_id     WHERE c2.birth_date = (SELECT MAX(birth_date) FROM client) );	financial
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND d.type = 'OWNER';	financial
SELECT DISTINCT client.client_id FROM client JOIN disp ON client.client_id = disp.client_id WHERE disp.type = 'DISPONENT' AND account.frequency = 'POPLATEK PO OBRATU';	financial
SELECT a.account_id FROM loan l JOIN account a ON l.account_id = a.account_id WHERE l.date BETWEEN '1997-01-01' AND '1997-12-31' AND a.frequency = 'POPLATEK TYDNE' AND l.amount = (     SELECT MIN(amount)     FROM loan     WHERE date BETWEEN '1997-01-01' AND '1997-12-31' );	financial
SELECT a.* FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 12 AND a.date BETWEEN '1993-01-01' AND '1993-12-31' AND l.amount = (SELECT MAX(l2.amount) FROM loan l2 JOIN account a2 ON l2.account_id = a2.account_id WHERE l2.duration > 12 AND a2.date BETWEEN '1993-01-01' AND '1993-12-31')	financial
SELECT COUNT(DISTINCT client.client_id) FROM client JOIN disp ON client.client_id = disp.client_id JOIN district ON client.district_id = district.district_id WHERE client.gender = 'F' AND client.birth_date < '1950-01-01' AND district.A2 = 'Sokolov';	financial
SELECT account_id FROM trans WHERE date = (SELECT MIN(date) FROM trans WHERE YEAR(date) = 1995);	financial
SELECT DISTINCT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE a.date < '1997-01-01' AND l.amount > 3000;	financial
SELECT d.client_id FROM card c JOIN disp d ON c.disp_id = d.disp_id WHERE c.issued = '1994-03-03';	financial
SELECT account.date FROM loan JOIN account ON loan.account_id = account.account_id WHERE loan.date = '1998-10-14' AND loan.amount = 840;	financial
SELECT a.district_id FROM loan l JOIN account a ON l.account_id = a.account_id WHERE l.date = '1994-08-25';	financial
SELECT MAX(amount) FROM trans WHERE account_id IN (SELECT account_id FROM disp WHERE client_id IN (SELECT client_id FROM card WHERE issued = '1996-10-21'));	financial
SELECT c.gender FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN district dis ON a.district_id = dis.district_id WHERE dis.A11 = (SELECT MAX(A11) FROM district) ORDER BY c.birth_date ASC LIMIT 1;	financial
SELECT t.amount FROM trans t JOIN account a ON t.account_id = a.account_id WHERE t.date > a.date AND t.account_id = (     SELECT account_id     FROM loan     ORDER BY amount DESC     LIMIT 1 ) ORDER BY t.date ASC LIMIT 1;	financial
SELECT COUNT(*) FROM account JOIN district ON account.district_id = district.district_id JOIN disp ON account.account_id = disp.account_id JOIN client ON disp.client_id = client.client_id WHERE district.A2 = 'Jesenik' AND disp.type = 'OWNER' AND client.gender = 'F';	financial
SELECT d.disp_id FROM trans t JOIN disp d ON t.account_id = d.account_id WHERE t.amount = 5100 AND t.date = '1998-09-02';	financial
SELECT COUNT(*) FROM account JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Litomerice' AND account.date BETWEEN '1996-01-01' AND '1996-12-31';	financial
SELECT d.A2 FROM client c JOIN disp ON c.client_id = disp.client_id JOIN account a ON disp.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE c.gender = 'F' AND c.birth_date = '1976-01-29'	financial
SELECT client.birth_date FROM loan JOIN account ON loan.account_id = account.account_id JOIN disp ON account.account_id = disp.account_id JOIN client ON disp.client_id = client.client_id WHERE loan.amount = 98832 AND loan.date = '1996-01-03';	financial
SELECT a.account_id FROM account a JOIN district d ON a.district_id = d.district_id JOIN disp disp ON a.account_id = disp.account_id WHERE d.A3 = 'Prague' AND disp.type = 'OWNER' ORDER BY a.date LIMIT 1;	financial
SELECT (COUNT(CASE WHEN gender = 'M' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM client WHERE district_id = (SELECT district_id FROM district WHERE A3 = 'South Bohemia' ORDER BY A4 DESC LIMIT 1);	financial
SELECT    (( (SELECT balance FROM trans WHERE account_id = (SELECT account_id FROM loan WHERE date = '1993-07-05') AND date = '1998-12-27') - (SELECT balance FROM trans WHERE account_id = (SELECT account_id FROM loan WHERE date = '1993-07-05') AND date = '1993-03-22') ) / (SELECT balance FROM trans WHERE account_id = (SELECT account_id FROM loan WHERE date = '1993-07-05') AND date = '1993-03-22') ) * 100 AS increase_rate;	financial
SELECT (SUM(CASE WHEN status = 'A' THEN amount ELSE 0 END) * 100.0 / SUM(amount)) AS percentage FROM loan;	financial
SELECT    (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM (SELECT DISTINCT account_id FROM loan WHERE amount < 100000) AS total)) AS percentage FROM (   SELECT DISTINCT account_id   FROM loan   WHERE amount < 100000   AND status = 'C' ) AS active_accounts;	financial
SELECT a.account_id, d.A2, d.A3 FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.date BETWEEN '1993-01-01' AND '1993-12-31' AND EXISTS (     SELECT 1     FROM trans t     WHERE t.account_id = a.account_id     AND t.date < a.date );	financial
SELECT account.account_id, account.frequency FROM account JOIN disp ON account.account_id = disp.account_id JOIN client ON disp.client_id = client.client_id JOIN district ON client.district_id = district.district_id WHERE district.A2 = 'east Bohemia' AND account.date BETWEEN '1995-01-01' AND '2000-12-31';	financial
SELECT account.account_id, account.date FROM account JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Prachatice';	financial
SELECT district.A2, district.A3 FROM loan JOIN account ON loan.account_id = account.account_id JOIN district ON account.district_id = district.district_id WHERE loan.loan_id = 4990;	financial
SELECT account.account_id, district.A2, district.A3 FROM loan JOIN account ON loan.account_id = account.account_id JOIN district ON account.district_id = district.district_id WHERE loan.amount > 300000;	financial
SELECT loan.loan_id, district.A3, district.A11 FROM loan JOIN account ON loan.account_id = account.account_id JOIN district ON account.district_id = district.district_id WHERE loan.duration = 60;	financial
SELECT district.A2 AS state, ((district.A13 - district.A12) / district.A12) * 100 AS percentage_increment FROM loan JOIN disp ON loan.account_id = disp.account_id JOIN client ON disp.client_id = client.client_id JOIN district ON client.district_id = district.district_id WHERE loan.status = 'D';	financial
SELECT (COUNT(CASE WHEN d.A2 = 'Decin' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM account a JOIN district d ON a.district_id = d.district_id WHERE YEAR(a.date) = 1993;	financial
SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE';	financial
SELECT d.A2, COUNT(*) AS num_females FROM client c JOIN disp ON c.client_id = disp.client_id JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F' GROUP BY d.district_id ORDER BY num_females DESC LIMIT 9;	financial
SELECT district.A2 AS district_name, SUM(trans.amount) AS total_withdrawal FROM trans JOIN account ON trans.account_id = account.account_id JOIN district ON account.district_id = district.district_id WHERE trans.type = 'VYDAJ' AND trans.date LIKE '1996-01%' GROUP BY district.A2 ORDER BY total_withdrawal DESC LIMIT 10;	financial
SELECT COUNT(*) FROM client JOIN district ON client.district_id = district.district_id WHERE district.A3 = 'South Bohemia' AND client.client_id NOT IN (SELECT DISTINCT disp.client_id FROM disp JOIN card ON disp.disp_id = card.disp_id)	financial
SELECT d.A3, SUM(l.amount) AS total_amount FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.status IN ('C', 'D') GROUP BY d.district_id ORDER BY total_amount DESC LIMIT 1;	financial
SELECT AVG(l.amount) FROM loan l JOIN disp d ON l.account_id = d.account_id JOIN client c ON d.client_id = c.client_id WHERE c.gender = 'M';	financial
SELECT A2 AS branch_location, A2 AS district_name FROM district ORDER BY A13 DESC LIMIT 1;	financial
SELECT COUNT(*) FROM account WHERE district_id = (SELECT district_id FROM district ORDER BY A16 DESC LIMIT 1)	financial
SELECT COUNT(DISTINCT trans.account_id) FROM trans JOIN account ON trans.account_id = account.account_id WHERE trans.operation = 'VYBER KARTOU' AND trans.balance < 0 AND account.frequency = 'POPLATEK MESICNE';	financial
SELECT COUNT(*) FROM loan JOIN account ON loan.account_id = account.account_id WHERE account.frequency = 'POPLATEK MESICNE' AND loan.date BETWEEN '1995-01-01' AND '1997-12-31' AND loan.amount >= 250000;	financial
SELECT COUNT(DISTINCT l.account_id) FROM loan l JOIN account a ON l.account_id = a.account_id WHERE l.status IN ('C', 'D') AND a.district_id = 1;	financial
SELECT COUNT(*) FROM client WHERE gender = 'M' AND district_id = (SELECT district_id FROM district WHERE A15 = (SELECT A15 FROM district ORDER BY A15 DESC LIMIT 1 OFFSET 1));	financial
SELECT COUNT(*) FROM card JOIN disp ON card.disp_id = disp.disp_id WHERE card.type = 'gold' AND disp.type = 'OWNER';	financial
SELECT COUNT(*) FROM account JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Pisek';	financial
SELECT DISTINCT a.district_id FROM trans t JOIN account a ON t.account_id = a.account_id WHERE YEAR(t.date) = 1997 AND t.amount > 10000;	financial
SELECT DISTINCT o.account_id FROM `order` o JOIN `account` a ON o.account_id = a.account_id JOIN `district` d ON a.district_id = d.district_id WHERE o.k_symbol = 'SIPO' AND d.A2 = 'Pisek';	financial
SELECT DISTINCT disp.account_id FROM card JOIN disp ON card.disp_id = disp.disp_id WHERE card.type = 'gold';	financial
SELECT AVG(amount) FROM trans WHERE operation = 'VYBER KARTOU' AND YEAR(date) = 2021;	financial
SELECT DISTINCT d.client_id FROM trans t JOIN disp d ON t.account_id = d.account_id WHERE t.operation = 'VYBER KARTOU' AND t.date BETWEEN '1998-01-01' AND '1998-12-31' AND d.type = 'OWNER' AND t.amount < (     SELECT AVG(t2.amount)     FROM trans t2     WHERE t2.operation = 'VYBER KARTOU'     AND t2.date BETWEEN '1998-01-01' AND '1998-12-31' );	financial
SELECT c.client_id, c.gender, c.birth_date, c.district_id FROM client c WHERE c.gender = 'F' AND EXISTS (     SELECT 1     FROM disp d     JOIN card ca ON d.disp_id = ca.disp_id     WHERE d.client_id = c.client_id ) AND EXISTS (     SELECT 1     FROM disp d     JOIN loan l ON d.account_id = l.account_id     WHERE d.client_id = c.client_id );	financial
SELECT COUNT(*) FROM client JOIN district ON client.district_id = district.district_id JOIN disp ON client.client_id = disp.client_id WHERE client.gender = 'F' AND district.A3 = 'South Bohemia';	financial
SELECT a.account_id FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Tabor' AND EXISTS (     SELECT 1     FROM disp     WHERE disp.account_id = a.account_id     AND disp.type = 'OWNER' );	financial
SELECT DISTINCT d.type FROM disp d JOIN account a ON d.account_id = a.account_id JOIN district dis ON a.district_id = dis.district_id WHERE dis.A11 BETWEEN 8000 AND 9000 AND d.type != 'OWNER'	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN district d ON a.district_id = d.district_id JOIN trans t ON a.account_id = t.account_id WHERE d.A3 = 'North Bohemia' AND t.bank = 'AB';	financial
SELECT DISTINCT d.A2 FROM trans t JOIN account a ON t.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE t.type = 'VYDAJ';	financial
SELECT AVG(A15) FROM district WHERE A15 > 4000 AND district_id IN (SELECT district_id FROM account GROUP BY district_id HAVING MIN(date) >= '1997-01-01')	financial
SELECT COUNT(*) FROM card JOIN disp ON card.disp_id = disp.disp_id WHERE card.type = 'classic' AND disp.type = 'OWNER';	financial
SELECT COUNT(*) FROM client JOIN district ON client.district_id = district.district_id WHERE district.A2 = 'Hl.m. Praha' AND client.gender = 'M';	financial
SELECT (COUNT(CASE WHEN type = 'gold' AND issued < '1998-01-01' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM card;	financial
SELECT c.client_id, c.gender, c.birth_date FROM client c JOIN disp d ON c.client_id = d.client_id WHERE d.account_id = (     SELECT account_id     FROM loan     ORDER BY amount DESC     LIMIT 1 ) AND d.type = 'OWNER';	financial
SELECT A15 FROM district WHERE district_id = (SELECT district_id FROM account WHERE account_id = 532);	financial
SELECT a.district_id FROM order o JOIN account a ON o.account_id = a.account_id WHERE o.order_id = 33333;	financial
SELECT * FROM trans JOIN disp ON trans.account_id = disp.account_id JOIN client ON disp.client_id = client.client_id WHERE client.client_id = 3356 AND trans.operation = 'VYBER';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN loan l ON a.account_id = l.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND l.amount < 200000;	financial
SELECT card.type FROM client JOIN disp ON client.client_id = disp.client_id JOIN card ON disp.disp_id = card.disp_id WHERE client.client_id = 13539;	financial
SELECT `A3` FROM `district` JOIN `client` ON `district`.`district_id` = `client`.`district_id` WHERE `client`.`client_id` = 3541;	financial
SELECT a.district_id FROM loan l JOIN account a ON l.account_id = a.account_id WHERE l.status = 'A' GROUP BY a.district_id ORDER BY COUNT(DISTINCT l.account_id) DESC LIMIT 1;	financial
SELECT client.client_id, client.gender, client.birth_date FROM `order` JOIN `disp` ON `order`.account_id = `disp`.account_id JOIN `client` ON `disp`.client_id = `client`.client_id WHERE `order`.order_id = 32423;	financial
SELECT * FROM trans JOIN account ON trans.account_id = account.account_id WHERE account.district_id = 5;	financial
SELECT COUNT(*) FROM account JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Jesenik';	financial
SELECT DISTINCT d.client_id FROM card c JOIN disp d ON c.disp_id = d.disp_id WHERE c.type = 'junior' AND c.issued >= '1997-01-01'	financial
SELECT      (COUNT(DISTINCT CASE WHEN gender = 'F' THEN client_id END) * 100.0 / COUNT(DISTINCT client_id)) AS percentage FROM      account JOIN district ON account.district_id = district.district_id JOIN disp ON account.account_id = disp.account_id JOIN client ON disp.client_id = client.client_id WHERE      district.A11 > 10000     AND disp.type = 'OWNER';	financial
SELECT      (SUM(CASE WHEN YEAR(date) = 1997 THEN amount ELSE 0 END) - SUM(CASE WHEN YEAR(date) = 1996 THEN amount ELSE 0 END)) /      SUM(CASE WHEN YEAR(date) = 1996 THEN amount ELSE 0 END) * 100 AS growth_rate FROM      loan JOIN disp ON loan.account_id = disp.account_id JOIN client ON disp.client_id = client.client_id WHERE      client.gender = 'M'     AND date BETWEEN '1996-01-01' AND '1997-12-31';	financial
SELECT COUNT(*) FROM trans WHERE operation = 'VYBER KARTOU' AND date > '1995-12-31';	financial
SELECT    (SELECT SUM(A16) FROM district WHERE A3 = 'NORTH BOHEMIA')    -    (SELECT SUM(A16) FROM district WHERE A3 = 'EAST BOHEMIA') AS difference;	financial
SELECT type, COUNT(*) AS count FROM disp WHERE account_id BETWEEN 1 AND 10 GROUP BY type;	financial
SELECT frequency FROM account WHERE account_id = 3; SELECT k_symbol, SUM(amount) AS total_debit FROM order WHERE account_id = 3 GROUP BY k_symbol HAVING SUM(amount) = 3539;	financial
SELECT EXTRACT(YEAR FROM birth_date) FROM client WHERE client_id = (SELECT client_id FROM disp WHERE account_id = 130 AND type = 'OWNER')	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN disp d ON a.account_id = d.account_id WHERE a.frequency = 'POPLATEK PO OBRATU' AND d.type = 'OWNER';	financial
SELECT      SUM(loan.amount) AS total_debt,     SUM(loan.payments) AS total_payments FROM      client JOIN disp ON client.client_id = disp.client_id JOIN account ON disp.account_id = account.account_id JOIN loan ON account.account_id = loan.account_id WHERE      client.client_id = 992;	financial
SELECT      COALESCE(SUM(t.amount), 0) AS total_sum,     c.gender FROM      client c JOIN      disp d ON c.client_id = d.client_id JOIN      account a ON d.account_id = a.account_id LEFT JOIN      trans t ON a.account_id = t.account_id WHERE      c.client_id = 4;	financial
SELECT card.type FROM client JOIN disp ON client.client_id = disp.client_id JOIN card ON disp.disp_id = card.disp_id WHERE client.client_id = 9;	financial
SELECT SUM(trans.amount) FROM trans JOIN disp ON trans.account_id = disp.account_id JOIN client ON disp.client_id = client.client_id WHERE client.client_id = 617 AND YEAR(trans.date) = 1998 AND trans.type = 'VYBER';	financial
SELECT client.client_id FROM client JOIN disp ON client.client_id = disp.client_id JOIN account ON disp.account_id = account.account_id JOIN district ON account.district_id = district.district_id WHERE client.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND district.A2 = 'East Bohemia';	financial
SELECT client.client_id FROM loan JOIN account ON loan.account_id = account.account_id JOIN disp ON account.account_id = disp.account_id JOIN client ON disp.client_id = client.client_id WHERE client.gender = 'F' GROUP BY client.client_id ORDER BY SUM(loan.amount) DESC LIMIT 3;	financial
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN disp d ON c.client_id = d.client_id JOIN order o ON d.account_id = o.account_id WHERE c.gender = 'M' AND c.birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND o.k_symbol = 'SIPO' AND o.amount > 4000;	financial
SELECT COUNT(*) FROM account JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Beroun' AND account.date > '1996-12-31';	financial
SELECT COUNT(DISTINCT client.client_id) FROM card JOIN disp ON card.disp_id = disp.disp_id JOIN client ON disp.client_id = client.client_id WHERE client.gender = 'F' AND card.type = 'junior';	financial
SELECT (COUNT(DISTINCT CASE WHEN client.gender = 'F' THEN client.client_id END) * 100.0 / COUNT(DISTINCT client.client_id)) AS percentage FROM client JOIN disp ON client.client_id = disp.client_id JOIN account ON disp.account_id = account.account_id JOIN district ON account.district_id = district.district_id WHERE district.A3 = 'Prague';	financial
SELECT    (COUNT(CASE WHEN gender = 'M' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM client WHERE client_id IN (   SELECT DISTINCT disp.client_id   FROM disp   JOIN account ON disp.account_id = account.account_id   WHERE account.frequency = 'POPLATEK TYDNE' );	financial
SELECT COUNT(DISTINCT d.client_id) FROM disp d JOIN account a ON d.account_id = a.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND d.type = 'OWNER';	financial
SELECT a.*  FROM account a  JOIN loan l ON a.account_id = l.account_id  WHERE l.duration > 24  AND a.date < '1997-01-01'  AND l.amount = (      SELECT MIN(l2.amount)      FROM loan l2      JOIN account a2 ON l2.account_id = a2.account_id      WHERE l2.duration > 24      AND a2.date < '1997-01-01'  )	financial
SELECT DISTINCT d.account_id FROM disp d JOIN client c ON d.client_id = c.client_id JOIN district ds ON c.district_id = ds.district_id WHERE c.gender = 'F' AND c.birth_date = (SELECT MIN(birth_date) FROM client WHERE gender = 'F') AND ds.A11 = (     SELECT MIN(A11)     FROM (         SELECT ds.A11         FROM client c         JOIN district ds ON c.district_id = ds.district_id         WHERE c.gender = 'F'         AND c.birth_date = (SELECT MIN(birth_date) FROM client WHERE gender = 'F')     ) AS sub );	financial
SELECT COUNT(*) FROM client JOIN district ON client.district_id = district.district_id WHERE YEAR(client.birth_date) = 1920 AND district.A3 = 'East Bohemia';	financial
SELECT COUNT(*) FROM loan JOIN account ON loan.account_id = account.account_id WHERE loan.duration = 24 AND account.frequency = 'POPLATEK TYDNE';	financial
SELECT AVG(loan.amount) FROM loan JOIN account ON loan.account_id = account.account_id WHERE loan.status IN ('C', 'D') AND account.frequency = 'POPLATEK PO OBRATU';	financial
SELECT c.client_id, c.district_id FROM client c JOIN disp d ON c.client_id = d.client_id GROUP BY c.client_id HAVING COUNT(*) = COUNT(CASE WHEN d.type = 'OWNER' THEN 1 END);	financial
SELECT c.client_id, TIMESTAMPDIFF(YEAR, c.birth_date, CURDATE()) AS age FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card ca ON d.disp_id = ca.disp_id WHERE ca.type = 'gold' AND d.type = 'OWNER';	financial
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY COUNT(*) DESC LIMIT 1;	toxicology
SELECT COUNT(DISTINCT a.molecule_id) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '-' AND a.element = 'cl';	toxicology
SELECT AVG(oxygen_count) FROM (SELECT COUNT(*) AS oxygen_count FROM atom WHERE element = 'o' AND molecule_id IN (SELECT DISTINCT molecule_id FROM bond WHERE bond_type = '-') GROUP BY molecule_id) AS counts;	toxicology
SELECT (SELECT COUNT(*) FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.label = '+' AND bond.bond_type = '-') / (SELECT COUNT(*) FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '+') AS average;	toxicology
SELECT COUNT(DISTINCT molecule.molecule_id) FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE atom.element = 'na' AND molecule.label = '-';	toxicology
SELECT molecule.molecule_id FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_type = '#' AND molecule.label = '+';	toxicology
SELECT      (COUNT(CASE WHEN element = 'c' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM atom WHERE molecule_id IN (     SELECT DISTINCT molecule_id     FROM bond     WHERE bond_type = '=' );	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '#';	toxicology
SELECT COUNT(*) FROM atom WHERE element != 'br';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+' AND molecule_id BETWEEN 'TR000' AND 'TR099';	toxicology
SELECT DISTINCT molecule_id FROM atom WHERE element = 'c';	toxicology
SELECT element FROM atom WHERE atom_id IN (SELECT atom_id FROM connected WHERE bond_id = 'TR004_8_9' UNION SELECT atom_id2 FROM connected WHERE bond_id = 'TR004_8_9')	toxicology
SELECT a1.element, a2.element FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN atom a1 ON connected.atom_id = a1.atom_id JOIN atom a2 ON connected.atom_id2 = a2.atom_id WHERE bond.bond_type = '=';	toxicology
SELECT molecule.label FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.element = 'h' GROUP BY molecule.label ORDER BY COUNT(*) DESC LIMIT 1;	toxicology
SELECT DISTINCT b.bond_type FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'cl';	toxicology
SELECT connected.atom_id, connected.atom_id2 FROM connected JOIN bond ON connected.bond_id = bond.bond_id WHERE bond.bond_type = '-';	toxicology
SELECT DISTINCT c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.label = '-';	toxicology
SELECT element FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '-' GROUP BY element HAVING COUNT(*) = (     SELECT MIN(cnt)     FROM (         SELECT COUNT(*) AS cnt         FROM atom         JOIN molecule ON atom.molecule_id = molecule.molecule_id         WHERE molecule.label = '-'         GROUP BY element     ) AS sub );	toxicology
SELECT bond_type FROM bond WHERE bond_id IN (SELECT bond_id FROM connected WHERE (atom_id = 'TR004_8' AND atom_id2 = 'TR004_20') OR (atom_id = 'TR004_20' AND atom_id2 = 'TR004_8'))	toxicology
SELECT label FROM molecule WHERE label NOT IN (SELECT label FROM molecule WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE element != 'sn'));	toxicology
SELECT COUNT(DISTINCT a.atom_id) FROM atom a WHERE a.element IN ('i', 's') AND EXISTS (SELECT 1 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-' AND (c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id));	toxicology
SELECT c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#';	toxicology
SELECT DISTINCT atom_id FROM connected WHERE atom_id IN (SELECT atom_id FROM atom WHERE molecule_id = 'TR181') OR atom_id2 IN (SELECT atom_id FROM atom WHERE molecule_id = 'TR181')	toxicology
SELECT      (COUNT(DISTINCT m.molecule_id) * 100.0) / (SELECT COUNT(DISTINCT molecule_id) FROM molecule WHERE label = '+') AS percentage FROM molecule m WHERE m.label = '+' AND NOT EXISTS (     SELECT 1     FROM atom a     WHERE a.molecule_id = m.molecule_id     AND a.element = 'f' );	toxicology
SELECT (SUM(bond_type = '#') * 100.0 / COUNT(bond_id)) AS percentage FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.label = '+';	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR000' GROUP BY element ORDER BY element ASC LIMIT 3;	toxicology
SELECT atom_id, atom_id2 FROM connected WHERE bond_id = 'TR001_2_6';	toxicology
SELECT SUM(label = '+') - SUM(label = '-') AS difference FROM molecule;	toxicology
SELECT atom_id, atom_id2 FROM connected WHERE bond_id = 'TR000_2_5';	toxicology
SELECT bond_id FROM connected WHERE atom_id2 = 'TR000_2';	toxicology
SELECT DISTINCT molecule_id FROM bond WHERE bond_type = '=' ORDER BY molecule_id LIMIT 5;	toxicology
SELECT    ROUND(100.0 * SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) / COUNT(bond_id), 5) AS percentage FROM bond WHERE molecule_id = 'TR008';	toxicology
SELECT ROUND(100.0 * SUM(label = '+') / COUNT(molecule_id), 3) AS percent FROM molecule;	toxicology
SELECT ROUND(100.0 * SUM(element = 'h') / COUNT(*) , 4) AS percent FROM atom WHERE molecule_id = 'TR206';	toxicology
SELECT bond_type FROM bond WHERE molecule_id = 'TR000';	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR060'; SELECT element FROM atom WHERE molecule_id = 'TR060';	toxicology
SELECT      (SELECT bond_type       FROM bond       WHERE molecule_id = 'TR010'       GROUP BY bond_type       ORDER BY COUNT(*) DESC       LIMIT 1) AS majority_bond_type,     (SELECT label       FROM molecule       WHERE molecule_id = 'TR010') AS carcinogenic_label;	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.label = '-' AND b.bond_type = '-' ORDER BY m.molecule_id LIMIT 3;	toxicology
SELECT * FROM bond WHERE molecule_id = 'TR006' ORDER BY bond_id LIMIT 2;	toxicology
SELECT COUNT(DISTINCT c.bond_id) FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.molecule_id = 'TR009' AND (c.atom_id = 'TR009_12' OR c.atom_id2 = 'TR009_12');	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' AND a.element = 'br';	toxicology
SELECT bond_type, atom_id, atom_id2 FROM bond JOIN connected ON bond.bond_id = connected.bond_id WHERE bond.bond_id = 'TR001_6_9';	toxicology
SELECT m.molecule_id, m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR001_10';	toxicology
SELECT COUNT(DISTINCT bond.molecule_id) FROM bond WHERE bond.bond_type = '#';	toxicology
SELECT COUNT(DISTINCT bond_id) FROM connected WHERE atom_id LIKE 'TR%_19' OR atom_id2 LIKE 'TR%_19';	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR004';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '-';	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' AND SUBSTR(a.atom_id, 7, 2) BETWEEN '21' AND '25';	toxicology
SELECT DISTINCT c.bond_id FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE (a1.element = 'p' AND a2.element = 'n') OR (a1.element = 'n' AND a2.element = 'p');	toxicology
SELECT label FROM molecule WHERE molecule_id = (SELECT molecule_id FROM bond WHERE bond_type = '=' GROUP BY molecule_id ORDER BY COUNT(*) DESC LIMIT 1)	toxicology
SELECT COUNT(bond_id) / COUNT(atom_id) AS average_bonds FROM atom JOIN connected ON atom.atom_id = connected.atom_id WHERE atom.element = 'i';	toxicology
SELECT bond.bond_type, bond.bond_id FROM bond JOIN connected ON bond.bond_id = connected.bond_id WHERE connected.atom_id IN (     SELECT atom_id     FROM atom     WHERE CAST(SUBSTR(atom_id, 7, 2) AS INTEGER) = 45 ) OR connected.atom_id2 IN (     SELECT atom_id     FROM atom     WHERE CAST(SUBSTR(atom_id, 7, 2) AS INTEGER) = 45 );	toxicology
SELECT element FROM atom WHERE atom_id NOT IN (SELECT atom_id FROM connected UNION SELECT atom_id2 FROM connected);	toxicology
SELECT a.atom_id, a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.molecule_id = 'TR041' AND b.bond_type = '#';	toxicology
SELECT element FROM atom WHERE atom_id IN (SELECT atom_id FROM connected WHERE bond_id = 'TR144_8_19' UNION SELECT atom_id2 FROM connected WHERE bond_id = 'TR144_8_19')	toxicology
SELECT molecule.molecule_id FROM molecule JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE molecule.label = '+' AND bond.bond_type = '=' GROUP BY molecule.molecule_id ORDER BY COUNT(bond.bond_id) DESC LIMIT 1;	toxicology
SELECT element FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+') GROUP BY element ORDER BY COUNT(*) ASC LIMIT 1;	toxicology
SELECT DISTINCT atom_id FROM connected WHERE atom_id IN (SELECT atom_id FROM atom WHERE element = 'pb') OR atom_id2 IN (SELECT atom_id FROM atom WHERE element = 'pb')	toxicology
SELECT a1.element, a2.element FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN atom a1 ON connected.atom_id = a1.atom_id JOIN atom a2 ON connected.atom_id2 = a2.atom_id WHERE bond.bond_type = '#';	toxicology
SELECT (MAX(cnt) * 100.0 / (SELECT COUNT(DISTINCT bond_id) FROM bond)) AS percentage FROM (SELECT LEAST(a1.element, a2.element) AS elem1, GREATEST(a1.element, a2.element) AS elem2, COUNT(*) AS cnt FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id GROUP BY elem1, elem2) AS sub;	toxicology
SELECT      ROUND((SUM(m.label = '+') * 100.0 / COUNT(b.bond_id)), 5) AS percentage FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '-';	toxicology
SELECT COUNT(*) FROM atom WHERE element IN ('c', 'h');	toxicology
SELECT `connected`.`atom_id2` FROM `connected` INNER JOIN `atom` ON `connected`.`atom_id2` = `atom`.`atom_id` WHERE `atom`.`element` = 's';	toxicology
SELECT DISTINCT b.bond_type FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'sn'	toxicology
SELECT COUNT(DISTINCT element) FROM atom WHERE molecule_id IN (SELECT DISTINCT molecule_id FROM bond WHERE bond_type = '-');	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id IN (SELECT b.molecule_id FROM bond b WHERE b.bond_type = '#' AND EXISTS (SELECT 1 FROM atom a2 WHERE a2.molecule_id = b.molecule_id AND a2.element IN ('p', 'br')))	toxicology
SELECT bond.bond_id FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.label = '+';	toxicology
SELECT DISTINCT m.molecule_id FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '-' AND m.label = '-';	toxicology
SELECT      (SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS percent FROM      connected c JOIN      bond b ON c.bond_id = b.bond_id JOIN      atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id WHERE      b.bond_type = '-';	toxicology
SELECT label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002');	toxicology
SELECT molecule_id FROM molecule WHERE label = '-';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+' AND molecule_id BETWEEN 'TR000' AND 'TR030';	toxicology
SELECT bond_type FROM bond WHERE molecule_id BETWEEN 'TR000' AND 'TR050';	toxicology
SELECT a1.element, a2.element FROM connected JOIN atom a1 ON connected.atom_id = a1.atom_id JOIN atom a2 ON connected.atom_id2 = a2.atom_id WHERE connected.bond_id = 'TR001_10_11';	toxicology
SELECT COUNT(DISTINCT bond_id) FROM connected WHERE atom_id IN (SELECT atom_id FROM atom WHERE element = 'i') OR atom_id2 IN (SELECT atom_id FROM atom WHERE element = 'i')	toxicology
SELECT MAX(label) FROM molecule WHERE molecule_id IN (SELECT DISTINCT molecule_id FROM atom WHERE element = 'ca')	toxicology
SELECT      CASE          WHEN (a1.element = 'cl' AND a2.element = 'c') OR (a1.element = 'c' AND a2.element = 'cl') THEN 'Yes'          ELSE 'No'      END AS result FROM      connected c JOIN      atom a1 ON c.atom_id = a1.atom_id JOIN      atom a2 ON c.atom_id2 = a2.atom_id WHERE      c.bond_id = 'TR001_1_8';	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.label = '-' AND a.element = 'c' AND b.bond_type = '#' LIMIT 2;	toxicology
SELECT      (SUM(CASE WHEN element = 'cl' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS percentage FROM      atom JOIN      molecule ON atom.molecule_id = molecule.molecule_id WHERE      molecule.label = '+';	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR001';	toxicology
SELECT molecule_id FROM bond WHERE bond_type = '=';	toxicology
SELECT atom_id, atom_id2 FROM connected JOIN bond ON connected.bond_id = bond.bond_id WHERE bond.bond_type = '#';	toxicology
SELECT a.element FROM atom a JOIN (     SELECT atom_id FROM connected WHERE bond_id = 'TR000_1_2'     UNION     SELECT atom_id2 FROM connected WHERE bond_id = 'TR000_1_2' ) AS connected_atoms ON a.atom_id = connected_atoms.atom_id;	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '-' AND m.label = '-';	toxicology
SELECT m.label FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_id = 'TR001_10_11';	toxicology
SELECT bond.bond_id, molecule.label  FROM bond  JOIN molecule ON bond.molecule_id = molecule.molecule_id  WHERE bond.bond_type = '#';	toxicology
SELECT element, COUNT(*) FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+') AND substr(atom_id, 7, 1) = '4' GROUP BY element;	toxicology
SELECT SUM(element = 'h') / COUNT(*) AS ratio, label FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.molecule_id = 'TR006';	toxicology
SELECT m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'ca';	toxicology
SELECT DISTINCT b.bond_type FROM bond b WHERE b.molecule_id IN (     SELECT a.molecule_id     FROM atom a     WHERE a.element = 'c' );	toxicology
SELECT a1.element, a2.element FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE c.bond_id = 'TR001_10_11';	toxicology
SELECT (SELECT COUNT(DISTINCT molecule_id) FROM bond WHERE bond_type = '#') * 100.0 / (SELECT COUNT(*) FROM molecule) AS percentage;	toxicology
SELECT (SUM(bond_type = '=') / COUNT(*)) * 100 AS percent FROM bond WHERE molecule_id = 'TR047';	toxicology
SELECT label FROM molecule WHERE molecule_id = (SELECT molecule_id FROM atom WHERE atom_id = 'TR001_1') AND label = '+';	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR151';	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR151';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+';	toxicology
SELECT * FROM atom WHERE element = 'c' AND substr(molecule_id, 3, 3) >= 10 AND substr(molecule_id, 3, 3) <= 50;	toxicology
SELECT COUNT(*) FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '+';	toxicology
SELECT bond.bond_id FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.label = '+' AND bond.bond_type = '=';	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+' AND EXISTS (SELECT 1 FROM atom WHERE atom.molecule_id = molecule.molecule_id AND element = 'h'));	toxicology
SELECT molecule_id FROM bond WHERE bond_id = 'TR000_1_2' AND EXISTS (SELECT 1 FROM connected WHERE bond_id = 'TR000_1_2' AND (atom_id = 'TR000_1' OR atom_id2 = 'TR000_1'));	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c' AND m.label = '-';	toxicology
SELECT    (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM molecule WHERE label = '+')) AS percentage FROM (   SELECT DISTINCT m.molecule_id   FROM molecule m   JOIN atom a ON m.molecule_id = a.molecule_id   WHERE m.label = '+'   AND a.element = 'h' ) AS has_h;	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR124';	toxicology
SELECT `atom_id`, `element` FROM `atom` WHERE `molecule_id` = 'TR186';	toxicology
SELECT bond_type FROM bond WHERE bond_id = 'TR007_4_19';	toxicology
SELECT element FROM atom WHERE atom_id IN (SELECT atom_id FROM connected WHERE bond_id = 'TR001_2_4' UNION SELECT atom_id2 FROM connected WHERE bond_id = 'TR001_2_4')	toxicology
SELECT COUNT(*) FROM bond WHERE molecule_id = 'TR006' AND bond_type = '='; SELECT label FROM molecule WHERE molecule_id = 'TR006';	toxicology
SELECT m.molecule_id, a.element FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+';	toxicology
SELECT      b.bond_id,     a1.atom_id AS atom1,     a1.element AS element1,     a2.atom_id AS atom2,     a2.element AS element2 FROM      bond b JOIN      connected c ON b.bond_id = c.bond_id JOIN      atom a1 ON c.atom_id = a1.atom_id JOIN      atom a2 ON c.atom_id2 = a2.atom_id WHERE      b.bond_type = '-';	toxicology
SELECT a.molecule_id, GROUP_CONCAT(a.element) AS elements FROM atom a WHERE a.molecule_id IN (SELECT b.molecule_id FROM bond b WHERE b.bond_type = '#') GROUP BY a.molecule_id;	toxicology
SELECT a1.element, a2.element FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE c.bond_id = 'TR000_2_3';	toxicology
SELECT COUNT(DISTINCT bond_id) FROM connected WHERE atom_id IN (SELECT atom_id FROM atom WHERE element = 'cl') OR atom_id2 IN (SELECT atom_id FROM atom WHERE element = 'cl')	toxicology
SELECT atom_id FROM atom WHERE molecule_id = 'TR346'; SELECT COUNT(DISTINCT bond_type) FROM bond WHERE molecule_id = 'TR346';	toxicology
SELECT COUNT(DISTINCT molecule_id) FROM bond WHERE bond_type = '='; SELECT COUNT(DISTINCT m.molecule_id) FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '=' AND m.label = '+';	toxicology
SELECT COUNT(*) FROM molecule m WHERE NOT EXISTS (SELECT 1 FROM atom a WHERE a.molecule_id = m.molecule_id AND a.element = 's') AND NOT EXISTS (SELECT 1 FROM bond b WHERE b.molecule_id = m.molecule_id AND b.bond_type = '=')	toxicology
SELECT label FROM molecule WHERE molecule_id = (SELECT molecule_id FROM bond WHERE bond_id = 'TR001_2_4')	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR001';	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '-';	toxicology
SELECT m.molecule_id FROM molecule m WHERE m.molecule_id IN (     SELECT DISTINCT molecule_id     FROM atom     WHERE element = 'cl' ) AND m.label = '+';	toxicology
SELECT molecule_id FROM molecule WHERE label = '-' AND molecule_id IN (     SELECT molecule_id     FROM atom     WHERE element = 'c' );	toxicology
SELECT    (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM molecule WHERE label = '+')) AS percentage FROM molecule WHERE label = '+' AND EXISTS (   SELECT 1   FROM atom   WHERE atom.molecule_id = molecule.molecule_id   AND element = 'cl' );	toxicology
SELECT molecule_id FROM bond WHERE bond_id = 'TR001_1_7';	toxicology
SELECT COUNT(DISTINCT a.element) FROM connected c JOIN atom a ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE c.bond_id = 'TR001_3_4';	toxicology
SELECT bond_type FROM bond WHERE bond_id IN (SELECT bond_id FROM connected WHERE (atom_id = 'TR000_1' AND atom_id2 = 'TR000_2') OR (atom_id = 'TR000_2' AND atom_id2 = 'TR000_1'));	toxicology
SELECT molecule_id FROM atom WHERE atom_id IN ('TR000_2', 'TR000_4')	toxicology
SELECT element FROM atom WHERE atom_id = 'TR000_1';	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR000';	toxicology
SELECT (COUNT(CASE WHEN bond_type = '-' THEN 1 END) * 100.0 / COUNT(bond_id)) AS percentage FROM bond;	toxicology
SELECT COUNT(DISTINCT a.molecule_id) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' AND a.element = 'n';	toxicology
SELECT DISTINCT a.molecule_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 's' AND b.bond_type = '=';	toxicology
SELECT a.molecule_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '-' GROUP BY a.molecule_id HAVING COUNT(*) > 5;	toxicology
SELECT DISTINCT a.element FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE b.molecule_id = 'TR024' AND b.bond_type = '=';	toxicology
SELECT a.molecule_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' GROUP BY a.molecule_id ORDER BY COUNT(*) DESC LIMIT 1;	toxicology
SELECT      (COUNT(CASE WHEN molecule.label = '+' THEN 1 END) * 100.0) / COUNT(*) AS percentage FROM      (SELECT DISTINCT molecule_id      FROM atom      JOIN connected ON atom.atom_id = connected.atom_id      JOIN bond ON connected.bond_id = bond.bond_id      WHERE atom.element = 'h' AND bond.bond_type = '#') AS filtered_molecules JOIN molecule ON filtered_molecules.molecule_id = molecule.molecule_id;	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+';	toxicology
SELECT COUNT(DISTINCT bond.molecule_id) FROM bond WHERE bond.bond_type = '-' AND bond.molecule_id BETWEEN 'TR004' AND 'TR010';	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR008' AND element = 'c';	toxicology
SELECT element FROM atom WHERE atom_id = 'TR004_7' AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-');	toxicology
SELECT COUNT(DISTINCT bond.molecule_id) FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN atom a1 ON connected.atom_id = a1.atom_id JOIN atom a2 ON connected.atom_id2 = a2.atom_id WHERE bond.bond_type = ' = ' AND (a1.element = 'o' OR a2.element = 'o')	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id IN (SELECT DISTINCT molecule_id FROM bond WHERE bond_type = '#') AND label = '-';	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR002' UNION SELECT bond_type FROM bond WHERE molecule_id = 'TR002'	toxicology
SELECT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = ' = ' AND b.molecule_id = 'TR012' AND a.element = 'c';	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' AND a.element = 'o';	toxicology
SELECT * FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT * FROM cards WHERE borderColor IS NULL AND (cardKingdomFoilId IS NULL OR cardKingdomId IS NULL);	card_games
SELECT name FROM cards WHERE faceConvertedManaCost = (SELECT MAX(faceConvertedManaCost) FROM cards);	card_games
SELECT name FROM cards WHERE frameVersion = '2015' AND edhrecRank < 100;	card_games
SELECT cards.*  FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.format = 'gladiator'  AND legalities.status = 'Banned'  AND cards.rarity = 'mythic';	card_games
SELECT l.status FROM legalities l JOIN cards c ON l.uuid = c.uuid WHERE c.types = 'Artifact' AND c.side IS NULL AND l.format = 'vintage';	card_games
SELECT cards.id, cards.artist FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.format = 'commander' AND legalities.status = 'Legal' AND (cards.power IS NULL OR cards.power = '*');	card_games
SELECT      c.id,     r.text,     c.hasContentWarning FROM      cards c JOIN      rulings r ON c.uuid = r.uuid WHERE      c.artist = 'Stephen Daniele';	card_games
SELECT rulings.text FROM rulings JOIN cards ON rulings.uuid = cards.uuid WHERE cards.name = 'Sublime Epiphany' AND cards.number = '74s';	card_games
SELECT c.name, c.artist, c.isPromo FROM cards c JOIN rulings r ON c.uuid = r.uuid GROUP BY c.id ORDER BY COUNT(r.uuid) DESC LIMIT 1;	card_games
SELECT DISTINCT fd.language FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE c.name = 'Annul' AND c.number = '29';	card_games
SELECT c.name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Japanese';	card_games
SELECT (COUNT(CASE WHEN language = 'Chinese Simplified' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM foreign_data;	card_games
SELECT s.code, st.translation, s.totalSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian' GROUP BY s.code;	card_games
SELECT COUNT(DISTINCT type) FROM cards WHERE artist = 'Aaron Boyd';	card_games
SELECT `keywords` FROM `cards` WHERE `name` = 'Angel of Mercy';	card_games
SELECT COUNT(*) FROM cards WHERE power = '*';	card_games
SELECT promoTypes FROM cards WHERE name = 'Duress';	card_games
SELECT borderColor FROM cards WHERE name = 'Ancestor''s Chosen';	card_games
SELECT originalType FROM cards WHERE name = 'Ancestor''s Chosen';	card_games
SELECT DISTINCT set_translations.language FROM set_translations JOIN cards ON set_translations.setCode = cards.setCode WHERE cards.name = 'Angel of Mercy';	card_games
SELECT COUNT(DISTINCT c.id) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.status = 'restricted' AND c.isTextless = 0;	card_games
SELECT rulings.text FROM cards JOIN rulings ON cards.uuid = rulings.uuid WHERE cards.name = 'Condemn';	card_games
SELECT COUNT(*) FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.status = 'restricted' AND cards.isStarter = 1;	card_games
SELECT legalities.format, legalities.status FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.name = 'Cloudchaser Eagle';	card_games
SELECT `type` FROM `cards` WHERE `name` = 'Benalish Knight';	card_games
SELECT l.format, l.status FROM legalities l JOIN cards c ON l.uuid = c.uuid WHERE c.name = 'Benalish Knight';	card_games
SELECT DISTINCT c.artist FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Phyrexian';	card_games
SELECT (COUNT(CASE WHEN borderColor = 'borderless' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM cards;	card_games
SELECT COUNT(DISTINCT cards.id) FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'German' AND cards.isReprint = 1;	card_games
SELECT COUNT(DISTINCT c.id) FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.borderColor = 'borderless' AND fd.language = 'Russian';	card_games
SELECT    (COUNT(DISTINCT CASE WHEN fd.language = 'French' THEN c.id END) * 100.0 / COUNT(DISTINCT c.id)) AS percentage FROM cards c LEFT JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.isStorySpotlight = 1;	card_games
SELECT COUNT(*) FROM cards WHERE toughness = '99';	card_games
SELECT name FROM cards WHERE artist = 'Aaron Boyd';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND availability = 'mtgo';	card_games
SELECT id FROM cards WHERE convertedManaCost = 0;	card_games
SELECT layout FROM cards WHERE keywords LIKE '%flying%';	card_games
SELECT COUNT(*) FROM cards WHERE originalType = 'Summon - Angel' AND subtypes != 'Angel';	card_games
SELECT id FROM cards WHERE hasFoil = 1 AND hasNonFoil = 1 AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT id FROM cards WHERE duelDeck = 'a';	card_games
SELECT edhrecRank FROM cards WHERE frameVersion = '2015';	card_games
SELECT DISTINCT c.artist FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Chinese Simplified';	card_games
SELECT DISTINCT c.id, c.name, c.uuid FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.availability = 'paper' AND fd.language = 'Japanese';	card_games
SELECT COUNT(DISTINCT cards.uuid) FROM legalities JOIN cards ON legalities.uuid = cards.uuid WHERE legalities.status = 'Banned' AND cards.borderColor = 'white';	card_games
SELECT c.uuid, fd.language FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN foreign_data fd ON c.uuid = fd.uuid WHERE l.format = 'legacy';	card_games
SELECT rulings.text FROM rulings JOIN cards ON rulings.uuid = cards.uuid WHERE cards.name = 'Beacon of Immortality';	card_games
SELECT COUNT(*) AS num_cards, legalities.status FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.frameVersion = 'future' GROUP BY legalities.status;	card_games
SELECT name, colors FROM cards WHERE setCode = 'OGW';	card_games
SELECT c.name, fd.language FROM cards c JOIN sets s ON c.setCode = s.code JOIN foreign_data fd ON c.uuid = fd.uuid WHERE s.code = '10E' AND c.convertedManaCost = 5;	card_games
SELECT cards.name, rulings.date FROM cards JOIN rulings ON cards.uuid = rulings.uuid WHERE cards.originalType = 'Creature - Elf';	card_games
SELECT cards.colors, legalities.format FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.id BETWEEN 1 AND 20;	card_games
SELECT c.id, c.name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.originalType = 'Artifact' AND c.colors = 'B' AND fd.language IS NOT NULL;	card_games
SELECT c.name FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.rarity = 'uncommon' ORDER BY r.date ASC LIMIT 3;	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'John Avon' AND hasFoil = 1 AND (cardKingdomId IS NULL OR cardKingdomFoilId IS NULL);	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'UDON' AND availability = 'mtgo' AND hand = '-1';	card_games
SELECT COUNT(*) FROM cards WHERE frameVersion = '1993' AND availability = 'paper' AND hasContentWarning = 1;	card_games
SELECT manaCost FROM cards WHERE layout = 'normal' AND frameVersion = '2003' AND borderColor = 'black' AND availability = 'mtgo,paper';	card_games
SELECT SUM(manaCost) FROM cards WHERE artist = 'Rob Alexander';	card_games
SELECT subtypes, supertypes FROM cards WHERE availability = 'arena';	card_games
SELECT DISTINCT c.setCode FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Spanish';	card_games
SELECT (COUNT(CASE WHEN isOnlineOnly = 1 THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM cards WHERE frameEffects = 'legendary'	card_games
SELECT      (COUNT(CASE WHEN isStorySpotlight = 1 AND isTextless = 0 THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM cards;	card_games
SELECT    (SUM(CASE WHEN language = 'Spanish' THEN id ELSE 0 END) * 100.0 / COUNT(*)) AS percentage FROM foreign_data;  SELECT c.name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Spanish' ORDER BY c.name;	card_games
SELECT language FROM set_translations WHERE setCode = (SELECT code FROM sets WHERE baseSetSize = 309);	card_games
SELECT COUNT(DISTINCT sets.code) FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.block = 'Commander' AND set_translations.language = 'Portuguese (Brasil)';	card_games
SELECT DISTINCT c.id FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.types = 'Creature' AND l.status = 'Legal' ORDER BY c.id;	card_games
SELECT DISTINCT fd.text FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'German' AND c.subtypes IS NOT NULL AND c.supertypes IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE (power IS NULL OR power = '*') AND text LIKE '%triggered ability%';	card_games
SELECT COUNT(*) FROM cards WHERE side IS NULL AND EXISTS (SELECT 1 FROM legalities WHERE legalities.uuid = cards.uuid AND format = 'premodern') AND EXISTS (SELECT 1 FROM rulings WHERE rulings.uuid = cards.uuid AND text = 'This is a triggered mana ability.');	card_games
SELECT id FROM cards WHERE artist = 'Erica Yang' AND availability = 'paper' AND uuid IN (SELECT uuid FROM legalities WHERE format = 'pauper' AND status = 'Legal');	card_games
SELECT c.artist FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.text = 'Das perfekte Gegenmittel zu einer dichten Formation' AND fd.language = 'German';	card_games
SELECT fd.name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.artist = 'Matthew D. Wilson' AND c.layout = 'normal' AND c.borderColor = 'black' AND c.type = 'Creature' AND fd.language = 'French';	card_games
SELECT COUNT(DISTINCT c.id) FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.rarity = 'rare' AND r.date = '2007-02-01';	card_games
SELECT translation FROM set_translations WHERE setCode = (SELECT code FROM sets WHERE baseSetSize = 180 AND block = 'Ravnica');	card_games
SELECT (COUNT(CASE WHEN cards.hasContentWarning = 0 THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.format = 'commander' AND legalities.status = 'Legal' GROUP BY cards.id;	card_games
SELECT      (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM cards WHERE power IS NULL OR power = '*')) AS percentage FROM cards WHERE power IS NULL OR power = '*' AND EXISTS (SELECT 1 FROM foreign_data fd WHERE fd.uuid = cards.uuid AND fd.language = 'French');	card_games
SELECT (COUNT(CASE WHEN s.type = 'expansion' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE st.language = 'Japanese';	card_games
SELECT availability FROM cards WHERE artist = 'Daren Bader';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'borderless' AND edhrecRank > 12000;	card_games
SELECT COUNT(*) FROM cards WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1;	card_games
SELECT name FROM cards WHERE (power IS NULL OR power = '*') AND promoTypes = 'arenaleague' ORDER BY name LIMIT 3;	card_games
SELECT `language` FROM `foreign_data` WHERE `multiverseid` = 149934;	card_games
SELECT cardKingdomFoilId, cardKingdomId FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL ORDER BY cardKingdomFoilId LIMIT 3;	card_games
SELECT (COUNT(CASE WHEN isTextless = 1 AND layout = 'normal' THEN 1 END) * 100.0 / COUNT(CASE WHEN isTextless = 1 THEN 1 END)) AS proportion FROM cards;	card_games
SELECT number FROM cards WHERE side IS NULL AND subtypes LIKE '%Angel%' AND subtypes LIKE '%Wizard%';	card_games
SELECT name FROM sets WHERE mtgoCode IS NULL OR mtgoCode = '' ORDER BY name ASC LIMIT 3;	card_games
SELECT DISTINCT language FROM set_translations WHERE setCode = 'ARC' AND setCode IN (SELECT code FROM sets WHERE mcmName = 'Archenemy');	card_games
SELECT sets.name, set_translations.translation FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.id = 5;	card_games
SELECT s.type, st.language FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.id = 206;	card_games
SELECT s.id FROM sets s JOIN cards c ON s.code = c.setCode JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Italian' AND s.block = 'Shadowmoor' ORDER BY s.id ASC LIMIT 2;	card_games
SELECT s.id FROM sets s JOIN cards c ON s.code = c.setCode JOIN foreign_data fd ON c.uuid = fd.uuid WHERE s.isForeignOnly = 0 AND s.isFoilOnly = 1 AND fd.language = 'Japanese';	card_games
SELECT s.code FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Russian' ORDER BY s.baseSetSize DESC LIMIT 1;	card_games
SELECT    (COUNT(CASE WHEN c.isOnlineOnly = 1 THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM (   SELECT DISTINCT c.id   FROM cards c   JOIN foreign_data fd ON c.uuid = fd.uuid   WHERE fd.language = 'Chinese Simplified' ) AS chinese_cards JOIN cards c ON chinese_cards.id = c.id;	card_games
SELECT COUNT(DISTINCT s.id) FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Japanese' AND (s.mtgoCode IS NULL OR s.mtgoCode = '');	card_games
SELECT id FROM cards WHERE borderColor = 'black';	card_games
SELECT id FROM cards WHERE frameEffects = 'extendedart';   SELECT COUNT(*) FROM cards WHERE frameEffects = 'extendedart';	card_games
SELECT name FROM cards WHERE borderColor = 'black' AND isFullArt = 1;	card_games
SELECT `language` FROM `set_translations` JOIN `sets` ON `set_translations`.`setCode` = `sets`.`code` WHERE `sets`.`id` = 174;	card_games
SELECT name FROM sets WHERE code = 'ALL';	card_games
SELECT fd.language FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.name = 'A Pedra Fellwar';	card_games
SELECT code FROM sets WHERE releaseDate = '2007-07-13';	card_games
SELECT baseSetSize, code FROM sets WHERE block IN ('Masques', 'Mirage');	card_games
SELECT code FROM sets WHERE type = 'expansion';	card_games
SELECT fd.name, c.type FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.watermark = 'Boros';	card_games
SELECT fd.language, fd.flavorText, c.type FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.watermark = 'colorpie';	card_games
SELECT (COUNT(convertedManaCost = 10) * 100.0 / COUNT(convertedManaCost)) AS percentage FROM cards WHERE name = 'Abyssal Horror';	card_games
SELECT `code` FROM `sets` WHERE `type` = 'expansion commander';	card_games
SELECT fd.name, c.type FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.watermark = 'Abzan';	card_games
SELECT f.language, c.type FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.watermark = 'azorius';	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE availability LIKE '%paper%' AND hand = '3';	card_games
SELECT name FROM cards WHERE isTextless = 0;	card_games
SELECT manaCost FROM cards WHERE name = 'Ancestor''s Chosen';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND (power IS NULL OR power = '*');	card_games
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL;	card_games
SELECT subtypes, supertypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer';	card_games
SELECT purchaseUrls FROM cards WHERE promoTypes = 'bundle';	card_games
SELECT COUNT(DISTINCT artist) FROM cards WHERE borderColor = 'black' AND availability LIKE '%arena,mtgo%';	card_games
SELECT name, convertedManaCost FROM cards WHERE name IN ('Serra Angel', 'Shrine Keeper') ORDER BY convertedManaCost DESC;	card_games
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer';	card_games
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3;	card_games
SELECT set_translations.translation  FROM cards  JOIN set_translations ON cards.setCode = set_translations.setCode  WHERE cards.name = 'Ancestor''s Chosen'  AND set_translations.language = 'Italian';	card_games
SELECT COUNT(*) FROM set_translations WHERE setCode IN (SELECT DISTINCT setCode FROM cards WHERE name = 'Angel of Mercy');	card_games
SELECT name FROM cards WHERE setCode = (SELECT setCode FROM set_translations WHERE translation = 'Hauptset Zehnte Edition');	card_games
SELECT EXISTS (SELECT 1 FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.name = 'Ancestor''s Chosen' AND foreign_data.language = 'Korean')	card_games
SELECT COUNT(*) FROM cards JOIN set_translations ON cards.setCode = set_translations.setCode WHERE set_translations.translation = 'Hauptset Zehnte Edition' AND cards.artist = 'Adam Rex';	card_games
SELECT baseSetSize FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE set_translations.translation = 'Hauptset Zehnte Edition';	card_games
SELECT set_translations.translation FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.name = 'Eighth Edition' AND set_translations.language = 'Chinese Simplified';	card_games
SELECT * FROM cards WHERE name = 'Angel of Mercy' AND mtgoCode IS NOT NULL;	card_games
SELECT releaseDate FROM sets WHERE code = (SELECT setCode FROM cards WHERE name = 'Ancestor''s Chosen');	card_games
SELECT type FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE set_translations.translation = 'Hauptset Zehnte Edition';	card_games
SELECT COUNT(DISTINCT set_translations.setCode) FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.block = 'Ice Age' AND set_translations.language = 'Italian' AND set_translations.translation IS NOT NULL;	card_games
SELECT isForeignOnly FROM cards WHERE name = 'Adarkar Valkyrie';	card_games
SELECT COUNT(DISTINCT s.code) FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian' AND st.translation IS NOT NULL AND s.baseSetSize < 100;	card_games
SELECT COUNT(*) FROM cards JOIN sets ON cards.setCode = sets.code WHERE sets.name = 'Coldsnap' AND cards.borderColor = 'black';	card_games
SELECT name FROM cards JOIN sets ON cards.setCode = sets.code WHERE sets.name = 'Coldsnap' AND cards.convertedManaCost = (SELECT MAX(convertedManaCost) FROM cards JOIN sets ON cards.setCode = sets.code WHERE sets.name = 'Coldsnap')	card_games
SELECT DISTINCT artist FROM cards JOIN sets ON cards.setCode = sets.code WHERE sets.name = 'Coldsnap' AND artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy');	card_games
SELECT * FROM cards WHERE setCode = (SELECT code FROM sets WHERE name = 'Coldsnap') AND number = '4';	card_games
SELECT COUNT(*) FROM cards JOIN sets ON cards.setCode = sets.code WHERE sets.name = 'Coldsnap' AND cards.convertedManaCost > 5 AND (cards.power = '*' OR cards.power IS NULL);	card_games
SELECT `foreign_data`.`flavorText` FROM `cards` JOIN `foreign_data` ON `cards`.`uuid` = `foreign_data`.`uuid` WHERE `cards`.`name` = 'Ancestor''s Chosen' AND `foreign_data`.`language` = 'Italian';	card_games
SELECT DISTINCT foreign_data.language FROM foreign_data JOIN cards ON foreign_data.uuid = cards.uuid WHERE cards.name = 'Ancestor''s Chosen' AND foreign_data.flavorText IS NOT NULL;	card_games
SELECT fd.type FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.name = 'Ancestor''s Chosen' AND fd.language = 'German';	card_games
SELECT rulings.text FROM rulings JOIN cards ON rulings.uuid = cards.uuid JOIN sets ON cards.setCode = sets.code WHERE sets.name = 'Coldsnap';	card_games
SELECT fd.name FROM cards c JOIN sets s ON c.setCode = s.code JOIN foreign_data fd ON c.uuid = fd.uuid WHERE s.name = 'Coldsnap' AND fd.language = 'Italian' AND c.convertedManaCost = (     SELECT MAX(convertedManaCost)     FROM cards c2     JOIN sets s2 ON c2.setCode = s2.code     WHERE s2.name = 'Coldsnap' );	card_games
SELECT date FROM rulings WHERE uuid = (SELECT uuid FROM cards WHERE name = 'Reminisce');	card_games
SELECT (COUNT(CASE WHEN convertedManaCost = 7 THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM cards JOIN sets ON cards.setCode = sets.code WHERE sets.name = 'Coldsnap';	card_games
SELECT (COUNT(CASE WHEN cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM cards JOIN sets ON cards.setCode = sets.code WHERE sets.name = 'Coldsnap';	card_games
SELECT code FROM sets WHERE releaseDate = '2017-07-14';	card_games
SELECT keyruneCode FROM sets WHERE code = 'PKHC';	card_games
SELECT mcmId FROM sets WHERE code = 'SS2';	card_games
SELECT mcmName FROM sets WHERE releaseDate = '2017-06-09';	card_games
SELECT type FROM sets WHERE name = 'From the Vault: Lore';	card_games
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized';	card_games
SELECT      c.id,     c.name,     r.text,     c.hasContentWarning FROM      cards c JOIN      rulings r ON c.uuid = r.uuid WHERE      c.artist = 'Jim Pavelec';	card_games
SELECT s.releaseDate FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.name = 'Evacuation';	card_games
SELECT baseSetSize FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE set_translations.translation = 'Rinascita di Alara';	card_games
SELECT type FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE set_translations.translation = 'Huitième édition';	card_games
SELECT set_translations.translation FROM set_translations JOIN cards ON set_translations.setCode = cards.setCode JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.name = 'Tendo Ice Bridge' AND foreign_data.language = 'French' AND set_translations.language = 'French';	card_games
SELECT COUNT(*) FROM set_translations WHERE setCode IN (SELECT code FROM sets WHERE name = 'Tenth Edition') AND translation IS NOT NULL;	card_games
SELECT set_translations.translation FROM cards JOIN set_translations ON cards.setCode = set_translations.setCode WHERE cards.name = 'Fellwar Stone' AND set_translations.language = 'Japanese';	card_games
SELECT c.name FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Journey into Nyx Hero''s Path' ORDER BY c.convertedManaCost DESC LIMIT 1;	card_games
SELECT releaseDate FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE set_translations.translation = 'Ola de frío';	card_games
SELECT sets.type FROM cards JOIN sets ON cards.setCode = sets.code WHERE cards.name = 'Samite Pilgrim';	card_games
SELECT COUNT(*) FROM cards JOIN sets ON cards.setCode = sets.code WHERE sets.name = 'World Championship Decks 2004' AND cards.convertedManaCost = 3;	card_games
SELECT translation FROM set_translations JOIN sets ON set_translations.setCode = sets.code WHERE sets.name = 'Mirrodin' AND set_translations.language = 'Chinese Simplified';	card_games
SELECT      (COUNT(CASE WHEN isNonFoilOnly = 1 THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM cards WHERE setCode IN (     SELECT DISTINCT setCode      FROM set_translations      WHERE language = 'Japanese' );	card_games
SELECT (SUM(CASE WHEN isOnlineOnly = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS percentage FROM cards WHERE setCode IN (SELECT code FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE set_translations.language = 'Portuguese (Brazil)');	card_games
SELECT availability FROM cards WHERE artist = 'Aleksi Briclot' AND isTextless = 1;	card_games
SELECT id FROM sets ORDER BY baseSetSize DESC LIMIT 1;	card_games
SELECT artist FROM cards WHERE side IS NULL AND convertedManaCost IS NOT NULL ORDER BY convertedManaCost DESC LIMIT 1;	card_games
SELECT MAX(frameEffects) FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE (power IS NULL OR power = '*') AND hasFoil = 0 AND duelDeck = 'a';	card_games
SELECT id FROM sets WHERE type = 'commander' ORDER BY totalSetSize DESC LIMIT 1;	card_games
SELECT cards.name, cards.manaCost FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.format = 'duel' AND legalities.status = 'Legal' ORDER BY cards.manaCost DESC LIMIT 10;	card_games
SELECT c.originalReleaseDate, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'mythic' AND l.status = 'Legal' AND c.originalReleaseDate = (     SELECT MIN(originalReleaseDate)     FROM cards     WHERE rarity = 'mythic' );	card_games
SELECT COUNT(DISTINCT cards.id) FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.artist = 'Volkan Baǵa' AND foreign_data.language = 'French';	card_games
SELECT COUNT(*) FROM cards WHERE rarity = 'rare' AND types = 'Enchantment' AND name = 'Abundance' AND NOT EXISTS (SELECT 1 FROM legalities WHERE legalities.uuid = cards.uuid AND legalities.status != 'Legal')	card_games
SELECT l.format, c.name FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.status = 'Banned' AND l.format = (     SELECT format     FROM legalities     WHERE status = 'Banned'     GROUP BY format     ORDER BY COUNT(*) DESC     LIMIT 1 );	card_games
SELECT set_translations.language FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.name = 'Battlebond';	card_games
SELECT l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.artist IN (     SELECT artist     FROM (         SELECT artist, COUNT(*) AS cnt         FROM cards         WHERE artist IS NOT NULL         GROUP BY artist     )     GROUP BY artist     HAVING COUNT(*) = (         SELECT MIN(cnt)         FROM (             SELECT COUNT(*) AS cnt             FROM cards             WHERE artist IS NOT NULL             GROUP BY artist         )     ) ) GROUP BY l.format;	card_games
SELECT l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.frameVersion = '1997' AND c.artist = 'D. Alexander Gregory' AND c.hasContentWarning = 1 AND l.format = 'legacy';	card_games
SELECT cards.name, legalities.format FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.edhrecRank = 1 AND legalities.status = 'Banned';	card_games
SELECT      (SELECT AVG(sets_per_year)       FROM (          SELECT COUNT(*) AS sets_per_year          FROM sets          WHERE releaseDate BETWEEN '2012-01-01' AND '2015-12-31'          GROUP BY EXTRACT(YEAR FROM releaseDate)      )) AS annual_average,     (SELECT language       FROM set_translations      WHERE setCode IN (          SELECT code          FROM sets          WHERE releaseDate BETWEEN '2012-01-01' AND '2015-12-31'      )      GROUP BY language      ORDER BY COUNT(*) DESC      LIMIT 1     ) AS common_language;	card_games
SELECT DISTINCT artist FROM cards WHERE borderColor = 'black' AND availability = 'arena';	card_games
SELECT uuid FROM legalities WHERE format = 'oldschool' AND status IN ('banned', 'restricted');	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability = 'paper';	card_games
SELECT rulings.text, rulings.date FROM rulings JOIN cards ON rulings.uuid = cards.uuid WHERE cards.artist = 'Kev Walker' ORDER BY rulings.date DESC;	card_games
SELECT cards.name, legalities.format FROM cards JOIN sets ON cards.setCode = sets.code JOIN legalities ON cards.uuid = legalities.uuid WHERE sets.name = 'Hour of Devastation' AND legalities.status = 'Legal';	card_games
SELECT name FROM sets WHERE EXISTS (SELECT 1 FROM set_translations WHERE set_translations.setCode = sets.code AND language = 'Korean') AND NOT EXISTS (SELECT 1 FROM set_translations WHERE set_translations.setCode = sets.code AND language LIKE '%Japanese%');	card_games
SELECT frameVersion FROM cards WHERE artist = 'Allen Williams'; SELECT * FROM cards WHERE artist = 'Allen Williams'; SELECT * FROM legalities WHERE status = 'Banned';	card_games
SELECT DisplayName FROM users WHERE DisplayName IN ('Harlan', 'Jarrod Dixon') ORDER BY Reputation DESC LIMIT 1;	codebase_community
SELECT DisplayName FROM users WHERE YEAR(CreationDate) = 2011;	codebase_community
SELECT COUNT(*) FROM users WHERE LastAccessDate > '2014-09-01';	codebase_community
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM users WHERE UpVotes > 100 AND DownVotes > 1;	codebase_community
SELECT COUNT(*) FROM users WHERE Views > 10 AND YEAR(CreationDate) > 2013;	codebase_community
SELECT COUNT(*) FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'csgillespie';	codebase_community
SELECT Title FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'csgillespie';	codebase_community
SELECT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Eliciting priors from experts';	codebase_community
SELECT Title FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'csgillespie' ORDER BY ViewCount DESC LIMIT 1;	codebase_community
SELECT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id ORDER BY p.FavoriteCount DESC LIMIT 1;	codebase_community
SELECT SUM(posts.CommentCount) FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'csgillespie';	codebase_community
SELECT MAX(AnswerCount) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')	codebase_community
SELECT u.DisplayName FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE p.Title = 'Examples for teaching: Correlation does not mean causation';	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie') AND ParentId IS NULL;	codebase_community
SELECT DISTINCT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ClosedDate IS NOT NULL;	codebase_community
SELECT COUNT(*) FROM posts INNER JOIN users ON posts.OwnerUserId = users.Id WHERE users.Age > 65 AND posts.Score >= 20;	codebase_community
SELECT users.Location FROM posts INNER JOIN users ON posts.OwnerUserId = users.Id WHERE posts.Title = 'Eliciting priors from experts';	codebase_community
SELECT Body FROM posts WHERE Id = (SELECT ExcerptPostId FROM tags WHERE TagName = 'bayesian');	codebase_community
SELECT Body FROM posts WHERE Id = (SELECT ExcerptPostId FROM tags ORDER BY Count DESC LIMIT 1)	codebase_community
SELECT COUNT(*) FROM badges JOIN users ON badges.UserId = users.Id WHERE users.DisplayName = 'csgillespie';	codebase_community
SELECT Name FROM badges JOIN users ON badges.UserId = users.Id WHERE users.DisplayName = 'csgillespie';	codebase_community
SELECT COUNT(*) FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie') AND YEAR(Date) = 2011;	codebase_community
SELECT DisplayName FROM users WHERE Id = (SELECT UserId FROM badges GROUP BY UserId ORDER BY COUNT(*) DESC LIMIT 1)	codebase_community
SELECT AVG(posts.Score) FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'csgillespie';	codebase_community
SELECT COUNT(badges.Id) / COUNT(users.DisplayName) AS average_badges FROM users LEFT JOIN badges ON users.Id = badges.UserId WHERE users.Views > 200;	codebase_community
SELECT (COUNT(CASE WHEN u.Age > 65 THEN p.Id END) * 100.0 / COUNT(p.Id)) AS percentage FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Score > 5;	codebase_community
SELECT COUNT(*) FROM votes WHERE UserId = 58 AND CreationDate = '2010-07-19';	codebase_community
SELECT CreationDate FROM votes GROUP BY CreationDate ORDER BY COUNT(Id) DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = 'Revival';	codebase_community
SELECT p.Title FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.Score = (SELECT MAX(Score) FROM comments);	codebase_community
SELECT COUNT(*) FROM comments JOIN posts ON comments.PostId = posts.Id WHERE posts.ViewCount = 1910;	codebase_community
SELECT FavoriteCount FROM posts WHERE Id = (SELECT PostId FROM comments WHERE UserId = 3025 AND CreationDate = '2014/4/23 20:29:39.0')	codebase_community
SELECT Text FROM comments WHERE PostId = (SELECT Id FROM posts WHERE ParentId = 107829 AND CommentCount = 1);	codebase_community
SELECT p.ClosedDate IS NOT NULL AS IsWellFinished FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.UserId = 23853 AND c.CreationDate = '2013-07-12 09:08:18.0';	codebase_community
SELECT Reputation FROM users WHERE Id = (SELECT OwnerUserId FROM posts WHERE Id = 65041);	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Tiago Pasqualini');	codebase_community
SELECT DisplayName FROM users JOIN votes ON users.Id = votes.UserId WHERE votes.Id = 6347;	codebase_community
SELECT COUNT(*) FROM votes WHERE PostId IN (SELECT Id FROM posts WHERE Title LIKE '%data visualization%')	codebase_community
SELECT Name FROM badges JOIN users ON badges.UserId = users.Id WHERE users.DisplayName = 'DatEpicCoderGuyWhoPrograms';	codebase_community
SELECT      (SELECT COUNT(*) FROM posts WHERE OwnerUserId = 24) * 1.0 /      (SELECT COUNT(*) FROM votes WHERE UserId = 24) AS ratio;	codebase_community
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer';	codebase_community
SELECT Text FROM comments WHERE Score = 17;	codebase_community
SELECT DisplayName FROM users WHERE WebsiteUrl = 'http://stackoverflow.com';	codebase_community
SELECT Name FROM badges JOIN users ON badges.UserId = users.Id WHERE users.DisplayName = 'SilentGhost';	codebase_community
SELECT UserDisplayName FROM comments WHERE Text = 'thank you user93!';	codebase_community
SELECT Text FROM comments WHERE UserDisplayName = 'A Lion';	codebase_community
SELECT u.DisplayName, u.Reputation FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Understanding what Dassault iSight is doing?';	codebase_community
SELECT Text FROM comments WHERE PostId = (SELECT Id FROM posts WHERE Title = 'How does gentle boosting differ from AdaBoost?');	codebase_community
SELECT DISTINCT users.DisplayName FROM users JOIN badges ON users.Id = badges.UserId WHERE badges.Name = 'Necromancer' LIMIT 10;	codebase_community
SELECT LastEditorDisplayName FROM posts WHERE Title = 'Open source tools for visualizing multi-dimensional data';	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Vebjorn Ljosa';	codebase_community
SELECT SUM(posts.Score) AS TotalScore, users.WebsiteUrl FROM posts JOIN users ON posts.LastEditorUserId = users.Id WHERE users.DisplayName = 'Yevgeny';	codebase_community
SELECT c.* FROM comments c WHERE c.UserId IN (SELECT ph.UserId FROM postHistory ph WHERE ph.PostId = (SELECT p.Id FROM posts p WHERE p.Title = 'Why square the difference instead of taking the absolute value in standard deviation?'));	codebase_community
SELECT SUM(v.BountyAmount) FROM votes v JOIN posts p ON v.PostId = p.Id WHERE p.Title LIKE '%data%';	codebase_community
SELECT u.DisplayName FROM votes v JOIN posts p ON v.PostId = p.Id JOIN users u ON v.UserId = u.Id WHERE v.BountyAmount = 50 AND p.Title LIKE '%variance%';	codebase_community
SELECT p.Title, c.Text, (SELECT AVG(ViewCount) FROM posts WHERE Tags LIKE '%humor%') AS AvgViewCount FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Tags LIKE '%humor%';	codebase_community
SELECT COUNT(*) FROM comments WHERE UserId = 13;	codebase_community
SELECT Id FROM users ORDER BY Reputation DESC LIMIT 1;	codebase_community
SELECT Id FROM users WHERE Views = (SELECT MIN(Views) FROM users);	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Supporter' AND YEAR(Date) = 2011;	codebase_community
SELECT COUNT(*) FROM (SELECT UserId FROM badges GROUP BY UserId HAVING COUNT(Name) > 5) AS subquery;	codebase_community
SELECT COUNT(*) FROM users WHERE Location = 'New York' AND Id IN (SELECT UserId FROM badges WHERE Name = 'Teacher') AND Id IN (SELECT UserId FROM badges WHERE Name = 'Supporter');	codebase_community
SELECT u.DisplayName, u.Reputation FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Id = 1;	codebase_community
SELECT u.Id FROM users u WHERE u.Views >= 1000 AND (SELECT COUNT(*) FROM postHistory WHERE UserId = u.Id) = (SELECT COUNT(DISTINCT PostId) FROM postHistory WHERE UserId = u.Id)	codebase_community
SELECT b.UserId, b.Name FROM badges b WHERE b.UserId IN (     SELECT UserId     FROM comments     GROUP BY UserId     HAVING COUNT(Id) = (         SELECT MAX(comment_count)         FROM (             SELECT COUNT(Id) AS comment_count             FROM comments             GROUP BY UserId         ) AS sub     ) );	codebase_community
SELECT COUNT(DISTINCT badges.UserId) FROM badges JOIN users ON badges.UserId = users.Id WHERE users.Location = 'India' AND badges.Name = 'Teacher';	codebase_community
SELECT (( (SELECT COUNT(*) FROM badges WHERE Name = 'Student' AND YEAR(Date) = 2010) * 1.0 / (SELECT COUNT(*) FROM badges WHERE Name = 'Student') * 100 ) - ( (SELECT COUNT(*) FROM badges WHERE Name = 'Student' AND YEAR(Date) = 2011) * 1.0 / (SELECT COUNT(*) FROM badges WHERE Name = 'Student') * 100 )) AS percentage_difference;	codebase_community
SELECT `PostHistoryTypeId` FROM `postHistory` WHERE `PostId` = 3720; SELECT COUNT(DISTINCT `UserId`) FROM `comments` WHERE `PostId` = 3720;	codebase_community
SELECT      p.Id AS RelatedPostId,     p.ViewCount FROM posts p WHERE p.Id IN (     SELECT RelatedPostId FROM postLinks WHERE PostId = 61217     UNION     SELECT PostId FROM postLinks WHERE RelatedPostId = 61217 ) UNION ALL SELECT      61217 AS RelatedPostId,     (SELECT ViewCount FROM posts WHERE Id = 61217) AS ViewCount	codebase_community
SELECT Score, LinkTypeId FROM posts JOIN postLinks ON posts.Id = postLinks.PostId WHERE posts.Id = 395;	codebase_community
SELECT Id, OwnerUserId FROM posts WHERE Score > 60;	codebase_community
SELECT SUM(FavoriteCount) FROM posts WHERE OwnerUserId = 686 AND YEAR(CreaionDate) = 2011;	codebase_community
SELECT      SUM(u.UpVotes) / COUNT(u.Id) AS avg_up_votes,     SUM(u.Age) / COUNT(u.Id) AS avg_age FROM users u WHERE u.Id IN (     SELECT UserId     FROM posts     GROUP BY UserId     HAVING COUNT(*) > 10 );	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Announcer';	codebase_community
SELECT Name FROM badges WHERE Date = '2010-07-19 19:39:08.0'	codebase_community
SELECT COUNT(*) FROM comments WHERE Score > 60;	codebase_community
SELECT `Text` FROM `comments` WHERE `CreationDate` = '2010-07-19 19:16:14.0';	codebase_community
SELECT COUNT(*) FROM posts WHERE Score = 10;	codebase_community
SELECT DISTINCT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT u.Reputation FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Teacher' AND b.Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT Name FROM badges JOIN users ON badges.UserId = users.Id WHERE users.DisplayName = 'Pierre';	codebase_community
SELECT b.Date FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Location = 'Rochester, NY';	codebase_community
SELECT (COUNT(DISTINCT CASE WHEN b.Name = 'Teacher' THEN b.UserId END) * 100.0 / COUNT(*)) AS percentage FROM users u LEFT JOIN badges b ON u.Id = b.UserId;	codebase_community
SELECT      (COUNT(CASE WHEN users.Age BETWEEN 13 AND 18 THEN 1 ELSE NULL END) * 100.0 / COUNT(*)) AS percentage FROM badges JOIN users ON badges.UserId = users.Id WHERE badges.Name = 'Organizer';	codebase_community
SELECT c.Score FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.CreaionDate = '2010-07-19 19:19:56.0'	codebase_community
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:37:33.0'	codebase_community
SELECT DISTINCT u.Age FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'Vienna, Austria';	codebase_community
SELECT COUNT(DISTINCT badges.UserId) FROM badges JOIN users ON badges.UserId = users.Id WHERE badges.Name = 'Supporter' AND users.Age BETWEEN 19 AND 65;	codebase_community
SELECT SUM(u.Views) FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Teacher' AND b.Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT DISTINCT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MIN(Reputation) FROM users);	codebase_community
SELECT Name FROM badges JOIN users ON badges.UserId = users.Id WHERE users.DisplayName = 'Sharpie';	codebase_community
SELECT COUNT(DISTINCT badges.UserId) FROM badges JOIN users ON badges.UserId = users.Id WHERE badges.Name = 'Supporter' AND users.Age > 65;	codebase_community
SELECT DisplayName FROM users WHERE Id = 30;	codebase_community
SELECT COUNT(*) FROM users WHERE Location = 'New York';	codebase_community
SELECT COUNT(*) FROM votes WHERE YEAR(CreationDate) = 2010;	codebase_community
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1;	codebase_community
SELECT DIVIDE(COUNT(CASE WHEN YEAR(CreationDate) = 2010 THEN Id END), COUNT(CASE WHEN YEAR(CreationDate) = 2011 THEN Id END)) FROM votes;	codebase_community
SELECT DISTINCT value AS TagName FROM users JOIN posts ON users.Id = posts.OwnerUserId CROSS APPLY STRING_SPLIT(posts.Tags, ',') WHERE users.DisplayName = 'John Salvatier';	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Daniel Vassallo');	codebase_community
SELECT COUNT(*) FROM votes INNER JOIN users ON votes.UserId = users.Id WHERE users.DisplayName = 'Harlan';	codebase_community
SELECT Id FROM posts WHERE OwnerDisplayName = 'slashnick' ORDER BY AnswerCount DESC LIMIT 1;	codebase_community
SELECT u.DisplayName, SUM(p.ViewCount) AS TotalViews FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName IN ('Harvey Motulsky', 'Noah Snyder') GROUP BY u.DisplayName ORDER BY TotalViews DESC;	codebase_community
SELECT COUNT(*) FROM posts WHERE DisplayName = 'Matt Parker' AND PostId > 4;	codebase_community
SELECT COUNT(*) FROM comments JOIN posts ON comments.PostId = posts.Id JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'Neil McGuigan' AND comments.Score < 60;	codebase_community
SELECT Tags FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Mark Meckes') AND CommentCount = 0;	codebase_community
SELECT DisplayName FROM users JOIN badges ON users.Id = badges.UserId WHERE badges.Name = 'Organizer';	codebase_community
SELECT (COUNT(CASE WHEN Tags LIKE '%r%' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM posts WHERE OwnerDisplayName = 'Community';	codebase_community
SELECT      (SELECT SUM(p.ViewCount) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Mornington') -      (SELECT SUM(p.ViewCount) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Amos') AS Difference;	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Commentator' AND YEAR(Date) = 2014;	codebase_community
SELECT COUNT(*) FROM posts WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2012-07-21 23:59:59'	codebase_community
SELECT DisplayName, Age FROM users WHERE Views = (SELECT MAX(Views) FROM users);	codebase_community
SELECT LastEditDate, LastEditorUserId FROM posts WHERE Title = 'Detecting a given face in a database of facial images';	codebase_community
SELECT COUNT(*) FROM comments WHERE UserId = 13 AND Score < 60;	codebase_community
SELECT posts.Title, comments.UserDisplayName FROM comments JOIN posts ON comments.PostId = posts.Id WHERE comments.Score > 60;	codebase_community
SELECT Name FROM badges JOIN users ON badges.UserId = users.Id WHERE users.Location = 'North Pole' AND YEAR(Date) = 2011;	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.FavoriteCount > 150;	codebase_community
SELECT      (SELECT COUNT(*) FROM postHistory WHERE PostId = p.Id) AS HistoryCount,     p.LastEditDate FROM posts p WHERE p.Title = 'What is the best introductory Bayesian statistics textbook?';	codebase_community
SELECT u.LastAccessDate, u.Location FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Outliers';	codebase_community
SELECT p.Title FROM postLinks pl JOIN posts p ON pl.RelatedPostId = p.Id WHERE pl.PostId = (SELECT Id FROM posts WHERE Title = 'How to tell if something happened in a data set which monitors a value over time')	codebase_community
SELECT p.Id, b.Name FROM users u JOIN badges b ON u.Id = b.UserId JOIN posts p ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'Samuel' AND YEAR(b.Date) = 2013 AND YEAR(p.CreationDate) = 2013;	codebase_community
SELECT OwnerDisplayName FROM posts ORDER BY ViewCount DESC LIMIT 1;	codebase_community
SELECT u.DisplayName, u.Location FROM tags t JOIN posts p ON t.ExcerptPostId = p.Id JOIN users u ON p.OwnerUserId = u.Id WHERE t.TagName = 'hypothesis-testing';	codebase_community
SELECT p.Title, pl.LinkTypeId FROM postLinks pl JOIN posts p ON pl.RelatedPostId = p.Id WHERE pl.PostId = (     SELECT Id     FROM posts     WHERE Title = 'What are principal component scores?'  );	codebase_community
SELECT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Id = (     SELECT ParentId     FROM posts     WHERE ParentId IS NOT NULL     ORDER BY Score DESC     LIMIT 1 );	codebase_community
SELECT DisplayName, WebsiteUrl FROM users WHERE Id IN (SELECT UserId FROM votes WHERE VoteTypeId = 8 AND BountyAmount = (SELECT MAX(BountyAmount) FROM votes WHERE VoteTypeId = 8));	codebase_community
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5;	codebase_community
SELECT COUNT(*) FROM tags WHERE Count BETWEEN 5000 AND 7000;	codebase_community
SELECT OwnerUserId FROM posts WHERE FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts);	codebase_community
SELECT Age FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT COUNT(DISTINCT PostId) FROM votes WHERE YEAR(CreationDate) = 2011 AND BountyAmount = 50;	codebase_community
SELECT Id FROM users WHERE Age = (SELECT MIN(Age) FROM users);	codebase_community
SELECT SUM(Score) FROM posts WHERE LasActivityDate LIKE '2010-07-19%';	codebase_community
SELECT COUNT(*) / 12 FROM postLinks JOIN posts ON postLinks.PostId = posts.Id WHERE YEAR(CreationDate) = 2010 AND AnswerCount <= 2	codebase_community
SELECT Id FROM posts WHERE Id IN (SELECT PostId FROM votes WHERE UserId = 1465) ORDER BY FavoriteCount DESC LIMIT 1;	codebase_community
SELECT p.Title FROM postLinks pl JOIN posts p ON pl.PostId = p.Id WHERE pl.CreationDate = (SELECT MIN(CreationDate) FROM postLinks);	codebase_community
SELECT DisplayName FROM users WHERE Id = (SELECT UserId FROM badges GROUP BY UserId ORDER BY COUNT(*) DESC LIMIT 1)	codebase_community
SELECT MIN(v.CreationDate) FROM votes v JOIN users u ON v.UserId = u.Id WHERE u.DisplayName = 'chl';	codebase_community
SELECT MIN(p.CreaionDate) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.Age = (SELECT MIN(Age) FROM users);	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Autobiographer' ORDER BY b.Date ASC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM users JOIN posts ON users.Id = posts.OwnerUserId WHERE users.Location = 'United Kingdom' GROUP BY users.Id HAVING SUM(posts.FavoriteCount) >= 4;	codebase_community
SELECT AVG(PostId) FROM votes WHERE UserId IN (SELECT Id FROM users WHERE Age = (SELECT MAX(Age) FROM users));	codebase_community
SELECT DisplayName FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT COUNT(*) FROM users WHERE Reputation > 2000 AND Views > 1000;	codebase_community
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT COUNT(*) FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'Jay Stevens' AND YEAR(posts.CreationDate) = 2010;	codebase_community
SELECT Id, Title FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Harvey Motulsky') ORDER BY ViewCount DESC LIMIT 1;	codebase_community
SELECT Id, Title FROM posts WHERE Score = (SELECT MAX(Score) FROM posts);	codebase_community
SELECT AVG(Score) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Stephen Turner');	codebase_community
SELECT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.ViewCount > 20000 AND YEAR(p.CreationDate) = 2011;	codebase_community
SELECT Id, OwnerDisplayName FROM posts WHERE YEAR(CreaionDate) = 2010 ORDER BY FavoriteCount DESC LIMIT 1;	codebase_community
SELECT (COUNT(CASE WHEN YEAR(posts.CreaionDate) = 2011 AND users.Reputation > 1000 THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM posts JOIN users ON posts.OwnerUserId = users.Id;	codebase_community
SELECT    (COUNT(CASE WHEN Age BETWEEN 13 AND 18 THEN 1 END) * 100.0 / COUNT(Id)) AS percentage FROM users;	codebase_community
SELECT p.ViewCount, u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Computer Game Datasets';	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts);	codebase_community
SELECT COUNT(*) FROM comments WHERE PostId IN (SELECT Id FROM posts WHERE Score = (SELECT MAX(Score) FROM posts));	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > 35000 AND CommentCount = 0;	codebase_community
SELECT DisplayName, Location FROM users WHERE Id = (SELECT LastEditorUserId FROM posts WHERE Id = 183);	codebase_community
SELECT Name FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Emmett') AND Date = (SELECT MAX(Date) FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Emmett'))	codebase_community
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000;	codebase_community
SELECT DATEDIFF(b.Date, u.CreationDate) FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.DisplayName = 'Zolomon' ORDER BY b.Date ASC LIMIT 1;	codebase_community
SELECT      (SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users ORDER BY CreationDate DESC LIMIT 1)) AS post_count,     (SELECT COUNT(*) FROM comments WHERE UserId = (SELECT Id FROM users ORDER BY CreationDate DESC LIMIT 1)) AS comment_count;	codebase_community
SELECT comments.Text, users.DisplayName FROM comments JOIN posts ON comments.PostId = posts.Id JOIN users ON comments.UserId = users.Id WHERE posts.Title = 'Analysing wind data with R' ORDER BY comments.CreationDate DESC LIMIT 10;	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Citizen Patrol';	codebase_community
SELECT COUNT(*) FROM posts WHERE Tags LIKE '%careers%';	codebase_community
SELECT Reputation, Views FROM users WHERE DisplayName = 'Jarrod Dixon';	codebase_community
SELECT      (SELECT COUNT(*) FROM comments WHERE PostId = (SELECT Id FROM posts WHERE Title = 'Clustering 1D data')) AS CommentCount,     (SELECT COUNT(*) FROM posts WHERE PostTypeId = 2 AND ParentId = (SELECT Id FROM posts WHERE Title = 'Clustering 1D data')) AS AnswerCount;	codebase_community
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat';	codebase_community
SELECT COUNT(DISTINCT PostId) FROM votes WHERE BountyAmount >= 30;	codebase_community
SELECT      (COUNT(CASE WHEN p.Score > 50 THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.Id = (SELECT Id FROM users ORDER BY Reputation DESC LIMIT 1);	codebase_community
SELECT COUNT(*) FROM posts WHERE Score < 20;	codebase_community
SELECT COUNT(*) FROM tags WHERE Id < 15 AND Count <= 20;	codebase_community
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample';	codebase_community
SELECT u.Reputation, u.UpVotes FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'fine, you win :)'	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title LIKE '%linear regression%';	codebase_community
SELECT Text FROM comments JOIN posts ON comments.PostId = posts.Id WHERE posts.ViewCount BETWEEN 100 AND 150 AND comments.Score = (SELECT MAX(Score) FROM comments JOIN posts ON comments.PostId = posts.Id WHERE posts.ViewCount BETWEEN 100 AND 150)	codebase_community
SELECT u.CreationDate, u.Age FROM users u JOIN comments c ON u.Id = c.UserId WHERE u.WebsiteUrl LIKE '%http://%';	codebase_community
SELECT COUNT(DISTINCT p.Id) FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.Score = 0 AND p.ViewCount < 5;	codebase_community
SELECT COUNT(*) FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.CommentCount = 1 AND c.Score = 0;	codebase_community
SELECT COUNT(DISTINCT users.Id) FROM comments JOIN users ON comments.UserId = users.Id WHERE comments.Score = 0 AND users.Age = 40;	codebase_community
SELECT posts.Id, comments.Text FROM posts JOIN comments ON posts.Id = comments.PostId WHERE posts.Title = 'Group differences on a five point Likert item';	codebase_community
SELECT UpVotes FROM users WHERE Id = (SELECT UserId FROM comments WHERE Text = 'R is also lazy evaluated.');	codebase_community
SELECT * FROM comments JOIN users ON comments.UserId = users.Id WHERE users.DisplayName = 'Harvey Motulsky';	codebase_community
SELECT DISTINCT users.DisplayName FROM comments JOIN users ON comments.UserId = users.Id WHERE comments.Score BETWEEN 1 AND 5 AND users.DownVotes = 0;	codebase_community
SELECT    (COUNT(DISTINCT CASE WHEN u.UpVotes = 0 THEN u.Id END) * 100.0 / COUNT(DISTINCT c.UserId)) AS percentage FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score BETWEEN 5 AND 10;	codebase_community
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id JOIN superhero s ON hp.hero_id = s.id WHERE s.superhero_name = '3-D Man';	superhero
SELECT COUNT(DISTINCT hero_id) FROM hero_power JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Super Strength';	superhero
SELECT COUNT(DISTINCT superhero.id) FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Super Strength' AND superhero.height_cm > 200;	superhero
SELECT s.full_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id GROUP BY s.id HAVING COUNT(hp.power_id) > 15;	superhero
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue';	superhero
SELECT colour.colour FROM superhero JOIN colour ON superhero.skin_colour_id = colour.id WHERE superhero.superhero_name = 'Apocalypse';	superhero
SELECT COUNT(DISTINCT superhero.id) FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE colour.colour = 'Blue' AND superpower.power_name = 'Agility';	superhero
SELECT superhero.superhero_name FROM superhero JOIN colour AS eye_colour ON superhero.eye_colour_id = eye_colour.id JOIN colour AS hair_colour ON superhero.hair_colour_id = hair_colour.id WHERE eye_colour.colour = 'Blue' AND hair_colour.colour = 'Blond';	superhero
SELECT COUNT(*) FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics';	superhero
SELECT s.superhero_name, s.height_cm FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics' ORDER BY s.height_cm DESC;	superhero
SELECT publisher.publisher_name FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.superhero_name = 'Sauron';	superhero
SELECT colour.colour, COUNT(*) AS count FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics' GROUP BY colour.colour ORDER BY count DESC;	superhero
SELECT AVG(superhero.height_cm) FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics';	superhero
SELECT superhero.superhero_name FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE publisher.publisher_name = 'Marvel Comics' AND superpower.power_name = 'Super Strength';	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = 4;	superhero
SELECT publisher.publisher_name FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.id IN (     SELECT hero_id     FROM hero_attribute     JOIN attribute ON hero_attribute.attribute_id = attribute.id     WHERE attribute.attribute_name = 'Speed'     AND hero_attribute.attribute_value = (         SELECT MIN(attribute_value)         FROM hero_attribute         JOIN attribute ON hero_attribute.attribute_id = attribute.id         WHERE attribute.attribute_name = 'Speed'     ) );	superhero
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id JOIN publisher ON superhero.publisher_id = publisher.id WHERE colour.colour = 'Gold' AND publisher.publisher_name = 'Marvel Comics';	superhero
SELECT publisher.publisher_name FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.superhero_name = 'Blue Beetle II';	superhero
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.hair_colour_id = colour.id WHERE colour.colour = 'Blond';	superhero
SELECT superhero.superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Intelligence' ORDER BY hero_attribute.attribute_value ASC LIMIT 1;	superhero
SELECT race.race FROM superhero JOIN race ON superhero.race_id = race.id WHERE superhero.superhero_name = 'Copycat';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_id = 4 AND ha.attribute_value < 50;	superhero
SELECT superhero.superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Death Touch';	superhero
SELECT COUNT(*) FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE superhero.gender_id = 2 AND hero_attribute.attribute_id = 2 AND hero_attribute.attribute_value = 100;	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id GROUP BY s.id ORDER BY COUNT(*) DESC LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Vampire');	superhero
SELECT      (COUNT(CASE WHEN alignment.alignment = 'Bad' THEN 1 END) * 100.0 / COUNT(*)) AS percentage,     COUNT(CASE WHEN alignment.alignment = 'Bad' AND publisher.publisher_name = 'Marvel Comics' THEN 1 END) AS marvel_count FROM superhero JOIN alignment ON superhero.alignment_id = alignment.id LEFT JOIN publisher ON superhero.publisher_id = publisher.id;	superhero
SELECT      SUM(CASE WHEN publisher.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) -      SUM(CASE WHEN publisher.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) AS difference FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id;	superhero
SELECT id FROM publisher WHERE publisher_name = 'Star Trek';	superhero
SELECT AVG(attribute_value) FROM hero_attribute;	superhero
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL;	superhero
SELECT colour.colour FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.id = 75;	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Deathlok';	superhero
SELECT AVG(weight_kg) FROM superhero JOIN gender ON superhero.gender_id = gender.id WHERE gender.gender = 'Female';	superhero
SELECT sp.power_name FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE g.gender = 'Male' LIMIT 5;	superhero
SELECT superhero.superhero_name FROM superhero JOIN race ON superhero.race_id = race.id WHERE race.race = 'Alien';	superhero
SELECT superhero_name FROM superhero WHERE height_cm BETWEEN 170 AND 190 AND eye_colour_id = 1;	superhero
SELECT power_name FROM hero_power JOIN superpower ON hero_power.power_id = superpower.id WHERE hero_power.hero_id = 56;	superhero
SELECT full_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Demi-God');	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 2;	superhero
SELECT race.race FROM superhero JOIN race ON superhero.race_id = race.id WHERE superhero.weight_kg = 169;	superhero
SELECT colour.colour  FROM superhero  JOIN race ON superhero.race_id = race.id  JOIN colour ON superhero.hair_colour_id = colour.id  WHERE superhero.height_cm = 185  AND race.race = 'human';	superhero
SELECT colour.colour FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.weight_kg = (SELECT MAX(weight_kg) FROM superhero);	superhero
SELECT (COUNT(CASE WHEN publisher.publisher_name = 'Marvel Comics' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.height_cm BETWEEN 150 AND 180;	superhero
SELECT superhero.superhero_name FROM superhero JOIN gender ON superhero.gender_id = gender.id WHERE gender.gender = 'Male' AND superhero.weight_kg > (SELECT 0.79 * AVG(weight_kg) FROM superhero);	superhero
SELECT sp.power_name FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id GROUP BY sp.power_name ORDER BY COUNT(*) DESC LIMIT 1;	superhero
SELECT ha.attribute_value FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE s.superhero_name = 'Abomination';	superhero
SELECT power_name FROM superpower WHERE id IN (SELECT power_id FROM hero_power WHERE hero_id = 1);	superhero
SELECT COUNT(DISTINCT hero_id) FROM hero_power JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'stealth';	superhero
SELECT superhero.full_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Strength' AND hero_attribute.attribute_value = (     SELECT MAX(attribute_value)     FROM hero_attribute     JOIN attribute ON hero_attribute.attribute_id = attribute.id     WHERE attribute.attribute_name = 'Strength' );	superhero
SELECT COUNT(*) / (SELECT COUNT(*) FROM superhero WHERE skin_colour_id = 1) AS average FROM superhero;	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics');	superhero
SELECT superhero.superhero_name FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE publisher.publisher_name = 'Dark Horse Comics' AND attribute.attribute_name = 'Durability' ORDER BY hero_attribute.attribute_value DESC LIMIT 1;	superhero
SELECT colour.colour FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.full_name = 'Abraham Sapien';	superhero
SELECT superhero.superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Flight';	superhero
SELECT      ec.colour AS eye_colour,     hc.colour AS hair_colour,     sc.colour AS skin_colour FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN publisher p ON s.publisher_id = p.id JOIN colour ec ON s.eye_colour_id = ec.id JOIN colour hc ON s.hair_colour_id = hc.id JOIN colour sc ON s.skin_colour_id = sc.id WHERE g.gender = 'Female' AND p.publisher_name = 'Dark Horse Comics';	superhero
SELECT s.superhero_name, p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.eye_colour_id = s.hair_colour_id AND s.hair_colour_id = s.skin_colour_id;	superhero
SELECT race.race FROM superhero JOIN race ON superhero.race_id = race.id WHERE superhero.superhero_name = 'A-Bomb';	superhero
SELECT    (SUM(CASE WHEN skin_colour_id = 5 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS percentage FROM superhero JOIN gender ON superhero.gender_id = gender.id WHERE gender.gender = 'Female';	superhero
SELECT superhero.superhero_name, race.race FROM superhero JOIN race ON superhero.race_id = race.id WHERE superhero.full_name = 'Charles Chandler';	superhero
SELECT gender.gender FROM superhero JOIN gender ON superhero.gender_id = gender.id WHERE superhero.superhero_name = 'Agent 13';	superhero
SELECT superhero.superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Adaptation';	superhero
SELECT COUNT(*) FROM hero_power WHERE hero_id = (SELECT id FROM superhero WHERE superhero_name = 'Amazo');	superhero
SELECT superpower.power_name FROM superpower JOIN hero_power ON superpower.id = hero_power.power_id JOIN superhero ON hero_power.hero_id = superhero.id WHERE superhero.full_name = 'Hunter Zolomon';	superhero
SELECT height_cm FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Amber';	superhero
SELECT superhero.superhero_name FROM superhero JOIN colour AS eye_col ON superhero.eye_colour_id = eye_col.id JOIN colour AS hair_col ON superhero.hair_colour_id = hair_col.id WHERE eye_col.colour = 'Black' AND hair_col.colour = 'Black';	superhero
SELECT eye.colour FROM superhero JOIN colour AS skin ON superhero.skin_colour_id = skin.id JOIN colour AS eye ON superhero.eye_colour_id = eye.id WHERE skin.colour = 'Gold';	superhero
SELECT superhero.full_name FROM superhero JOIN race ON superhero.race_id = race.id WHERE race.race = 'Vampire';	superhero
SELECT superhero.superhero_name FROM superhero JOIN alignment ON superhero.alignment_id = alignment.id WHERE alignment.alignment = 'Neutral';	superhero
SELECT COUNT(*) FROM hero_attribute WHERE attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Strength') AND attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute WHERE attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Strength'));	superhero
SELECT race.race, alignment.alignment FROM superhero JOIN race ON superhero.race_id = race.id JOIN alignment ON superhero.alignment_id = alignment.id WHERE superhero.superhero_name = 'Cameron Hicks';	superhero
SELECT      (COUNT(CASE WHEN g.gender = 'Female' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM      superhero s JOIN      gender g ON s.gender_id = g.id JOIN      publisher p ON s.publisher_id = p.id WHERE      p.publisher_name = 'Marvel Comics';	superhero
SELECT AVG(weight_kg) FROM superhero JOIN race ON superhero.race_id = race.id WHERE race.race = 'Alien';	superhero
SELECT (SELECT SUM(weight_kg) FROM superhero WHERE full_name = 'Emil Blonsky') - (SELECT SUM(weight_kg) FROM superhero WHERE full_name = 'Charles Chandler') AS difference;	superhero
SELECT SUM(height_cm) / COUNT(*) FROM superhero;	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Abomination';	superhero
SELECT COUNT(*) FROM superhero WHERE race_id = 21 AND gender_id = 1;	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' ORDER BY ha.attribute_value DESC LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3;	superhero
SELECT attribute.attribute_name, hero_attribute.attribute_value FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE superhero.superhero_name = '3-D Man';	superhero
SELECT superhero.superhero_name FROM superhero JOIN colour AS eye_colour ON superhero.eye_colour_id = eye_colour.id JOIN colour AS hair_colour ON superhero.hair_colour_id = hair_colour.id WHERE eye_colour.colour = 'Blue' AND hair_colour.colour = 'Brown';	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy');	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = 1;	superhero
SELECT (COUNT(*) * 100.0) / (SELECT COUNT(*) FROM superhero) AS percentage FROM superhero WHERE eye_colour_id = 7;	superhero
SELECT SUM(gender_id = 2) * 1.0 / SUM(gender_id = 1) AS ratio FROM superhero WHERE gender_id IN (1, 2);	superhero
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1;	superhero
SELECT id FROM superpower WHERE power_name = 'cryokinesis';	superhero
SELECT superhero_name FROM superhero WHERE id = 294;	superhero
SELECT full_name FROM superhero WHERE weight_kg = 0 OR weight_kg IS NULL;	superhero
SELECT colour.colour FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.full_name = 'Karen Beecher-Duncan';	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.full_name = 'Helen Parr';	superhero
SELECT race.race FROM superhero JOIN race ON superhero.race_id = race.id WHERE superhero.height_cm = 188 AND superhero.weight_kg = 108;	superhero
SELECT publisher.publisher_name FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.id = 38;	superhero
SELECT r.race FROM superhero s JOIN race r ON s.race_id = r.id WHERE s.id IN (SELECT hero_id FROM hero_attribute WHERE attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute));	superhero
SELECT a.alignment, sp.power_name FROM superhero s JOIN alignment a ON s.alignment_id = a.id JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Atom IV';	superhero
SELECT superhero.full_name FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue';	superhero
SELECT AVG(hero_attribute.attribute_value) FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE superhero.alignment_id = 3;	superhero
SELECT colour.colour FROM superhero JOIN colour ON superhero.skin_colour_id = colour.id JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE hero_attribute.attribute_value = 100;	superhero
SELECT COUNT(*) FROM superhero JOIN gender ON superhero.gender_id = gender.id JOIN alignment ON superhero.alignment_id = alignment.id WHERE gender.id = 2 AND alignment.id = 1;	superhero
SELECT superhero.superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE hero_attribute.attribute_value BETWEEN 75 AND 80;	superhero
SELECT r.race FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN colour c ON s.hair_colour_id = c.id JOIN race r ON s.race_id = r.id WHERE g.gender = 'Male' AND c.colour = 'Blue';	superhero
SELECT    (SUM(CASE WHEN gender_id = 2 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS percentage FROM superhero WHERE alignment_id = 2;	superhero
SELECT      SUM(CASE WHEN eye_colour_id = 7 THEN 1 ELSE 0 END) -      SUM(CASE WHEN eye_colour_id = 1 THEN 1 ELSE 0 END) AS difference FROM superhero WHERE weight_kg = 0 OR weight_kg IS NULL;	superhero
SELECT ha.attribute_value FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE s.superhero_name = 'Hulk' AND a.attribute_name = 'Strength';	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Ajax';	superhero
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.skin_colour_id = colour.id WHERE colour.colour = 'Green' AND superhero.alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad');	superhero
SELECT COUNT(*) FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics' AND superhero.gender_id = 2;	superhero
SELECT superhero.superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Wind Control' ORDER BY superhero.superhero_name;	superhero
SELECT s.gender_id FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Phoenix Force';	superhero
SELECT superhero.superhero_name FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'DC Comics' ORDER BY superhero.weight_kg DESC LIMIT 1;	superhero
SELECT AVG(s.height_cm) FROM superhero s JOIN race r ON s.race_id = r.id JOIN publisher p ON s.publisher_id = p.id WHERE r.race <> 'Human' AND p.publisher_name = 'Dark Horse Comics';	superhero
SELECT COUNT(*) FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Speed' AND hero_attribute.attribute_value = 100;	superhero
SELECT    SUM(CASE WHEN publisher.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) -    SUM(CASE WHEN publisher.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS difference FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id;	superhero
SELECT a.attribute_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE s.superhero_name = 'Black Panther' AND ha.attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute ha2 JOIN superhero s2 ON ha2.hero_id = s2.id WHERE s2.superhero_name = 'Black Panther')	superhero
SELECT colour.colour FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.superhero_name = 'Abomination';	superhero
SELECT superhero_name FROM superhero WHERE height_cm = (SELECT MAX(height_cm) FROM superhero);	superhero
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler';	superhero
SELECT (COUNT(CASE WHEN g.gender = 'Female' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM superhero s JOIN publisher p ON s.publisher_id = p.id JOIN gender g ON s.gender_id = g.id WHERE p.publisher_name = 'George Lucas';	superhero
SELECT (COUNT(CASE WHEN a.alignment = 'Good' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM superhero s JOIN publisher p ON s.publisher_id = p.id JOIN alignment a ON s.alignment_id = a.id WHERE p.publisher_name = 'Marvel Comics';	superhero
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%';	superhero
SELECT hero_id FROM hero_attribute WHERE attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute);	superhero
SELECT full_name FROM superhero WHERE superhero_name = 'Alien';	superhero
SELECT s.full_name FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.weight_kg < 100 AND c.colour = 'Brown';	superhero
SELECT ha.attribute_value FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE s.superhero_name = 'Aquababy';	superhero
SELECT weight_kg, race FROM superhero JOIN race ON superhero.race_id = race.id WHERE id = 40;	superhero
SELECT AVG(height_cm) FROM superhero WHERE alignment_id = 3;	superhero
SELECT hero_id FROM hero_power WHERE power_id = (SELECT id FROM superpower WHERE power_name = 'Intelligence');	superhero
SELECT colour.colour FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.superhero_name = 'Blackwulf';	superhero
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id JOIN superhero s ON hp.hero_id = s.id WHERE s.height_cm > 0.8 * (SELECT AVG(height_cm) FROM superhero);	superhero
SELECT d.driverRef FROM qualifying q JOIN drivers d ON q.driverId = d.driverId WHERE q.raceId = 20 AND q.q1 = (SELECT MAX(q1) FROM qualifying WHERE raceId = 20);	formula_1
SELECT d.surname FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 19 AND q.q2 = (SELECT MIN(q2) FROM qualifying WHERE raceId = 19);	formula_1
SELECT DISTINCT races.year FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.location = 'Shanghai';	formula_1
SELECT url FROM circuits WHERE name = 'Circuit de Barcelona-Catalunya';	formula_1
SELECT races.name FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.country = 'Germany';	formula_1
SELECT ds.position  FROM driverStandings ds  JOIN races r ON ds.raceId = r.raceId  JOIN constructorResults cr ON r.raceId = cr.raceId  JOIN constructors c ON cr.constructorId = c.constructorId  WHERE c.name = 'Renault';	formula_1
SELECT COUNT(*) FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE races.year = 2010 AND circuits.country NOT IN ('Asia', 'Europe');	formula_1
SELECT races.name FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.country = 'Spain';	formula_1
SELECT circuits.lat, circuits.lng FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE races.name = 'Australian Grand Prix';	formula_1
SELECT races.url FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.name = 'Sepang International Circuit';	formula_1
SELECT r.time FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Sepang International Circuit';	formula_1
SELECT circuits.lat, circuits.lng FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE races.name = 'Abu Dhabi Grand Prix';	formula_1
SELECT constructors.country FROM constructors JOIN constructorResults ON constructors.constructorId = constructorResults.constructorId WHERE constructorResults.raceId = 24 AND constructorResults.points = 1.0;	formula_1
SELECT q1 FROM qualifying JOIN drivers ON qualifying.driverId = drivers.driverId WHERE drivers.forename = 'Bruno' AND drivers.surname = 'Senna' AND qualifying.raceId = 354;	formula_1
SELECT d.nationality FROM qualifying q JOIN drivers d ON q.driverId = d.driverId WHERE q.raceId = 355 AND q.q2 = '0:01:40';	formula_1
SELECT driverId FROM qualifying WHERE raceId = 903 AND q3 LIKE '1:54%';	formula_1
SELECT COUNT(DISTINCT results.driverId) FROM results JOIN races ON results.raceId = races.raceId WHERE races.name = 'Bahrain Grand Prix' AND races.year = 2007 AND results.time IS NULL;	formula_1
SELECT url FROM seasons WHERE year = (SELECT year FROM races WHERE raceId = 901);	formula_1
SELECT COUNT(DISTINCT driverId) FROM results JOIN status ON results.statusId = status.statusId WHERE results.raceId = (SELECT raceId FROM races WHERE date = '2015-11-29') AND status.status = 'Finished';	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 592 AND r.time IS NOT NULL ORDER BY d.dob ASC LIMIT 1;	formula_1
SELECT d.url FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId WHERE lt.raceId = 161 AND lt.time LIKE '1:27%';	formula_1
SELECT d.nationality FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 933 AND r.fastestLapSpeed = (     SELECT MAX(fastestLapSpeed)     FROM results     WHERE raceId = 933 );	formula_1
SELECT circuits.lat, circuits.lng FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE races.name = 'Malaysian Grand Prix';	formula_1
SELECT constructors.url FROM constructors JOIN constructorResults ON constructors.constructorId = constructorResults.constructorId WHERE constructorResults.raceId = 9 ORDER BY constructorResults.points DESC LIMIT 1;	formula_1
SELECT q.q1 FROM qualifying q JOIN drivers d ON q.driverId = d.driverId WHERE q.raceId = 345 AND d.forename = 'Lucas' AND d.surname = 'di Grassi';	formula_1
SELECT d.nationality FROM qualifying q JOIN drivers d ON q.driverId = d.driverId WHERE q.raceId = 347 AND q.q2 = '0:01:15';	formula_1
SELECT d.code FROM qualifying q JOIN drivers d ON q.driverId = d.driverId WHERE q.raceId = 45 AND q.q3 LIKE 'M:SS%';	formula_1
SELECT r.time FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.forename = 'Bruce' AND d.surname = 'McLaren' AND r.raceId = 743;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2006 AND ra.name = 'San Marino Grand Prix' AND r.position = 2;	formula_1
SELECT s.url FROM races r JOIN seasons s ON r.year = s.year WHERE r.raceId = 901;	formula_1
SELECT COUNT(DISTINCT results.driverId) FROM results JOIN races ON results.raceId = races.raceId WHERE races.date = '2015-11-29' AND results.statusId != 1;	formula_1
SELECT d.forename, d.surname  FROM drivers d  JOIN results r ON d.driverId = r.driverId  WHERE r.raceId = 872 AND r.statusId = 1  ORDER BY d.dob DESC  LIMIT 1;	formula_1
SELECT d.forename || ' ' || d.surname AS full_name FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE lt.raceId = 348 ORDER BY lt.time ASC LIMIT 1;	formula_1
SELECT d.nationality FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results);	formula_1
SELECT    ( (CAST(r1.fastestLapSpeed AS REAL) - CAST(r2.fastestLapSpeed AS REAL)) / CAST(r1.fastestLapSpeed AS REAL) * 100 ) AS percentage FROM    drivers d   JOIN results r1 ON d.driverId = r1.driverId AND r1.raceId = 853   JOIN results r2 ON d.driverId = r2.driverId AND r2.raceId = 854 WHERE    d.forename = 'Paul' AND d.surname = 'di Resta';	formula_1
SELECT    (COUNT(CASE WHEN time IS NOT NULL THEN driverId END) * 100.0 / COUNT(driverId)) AS completion_rate FROM results JOIN races ON results.raceId = races.raceId WHERE races.date = '1983-07-16';	formula_1
SELECT MIN(year) FROM races WHERE name = 'Singapore Grand Prix';	formula_1
SELECT COUNT(*) FROM races WHERE year = 2005; SELECT name FROM races WHERE year = 2005 ORDER BY name DESC;	formula_1
SELECT name FROM races WHERE strftime('%Y-%m', date) = (SELECT strftime('%Y-%m', MIN(date)) FROM races);	formula_1
SELECT name, date FROM races WHERE year = 1999 AND round = (SELECT MAX(round) FROM races WHERE year = 1999);	formula_1
SELECT year FROM races GROUP BY year ORDER BY MAX(round) DESC LIMIT 1;	formula_1
SELECT name FROM races WHERE year = 2017 AND circuitId NOT IN (SELECT circuitId FROM races WHERE year = 2000);	formula_1
SELECT circuits.country, circuits.name, circuits.location FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE races.name = 'European Grand Prix' ORDER BY races.year ASC LIMIT 1;	formula_1
SELECT MAX(r.year) FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.name = 'British Grand Prix' AND c.name = 'Brands Hatch';	formula_1
SELECT COUNT(DISTINCT r.year) FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Silverstone Circuit' AND r.name = 'British Grand Prix';	formula_1
SELECT drivers.forename, drivers.surname FROM races JOIN results ON races.raceId = results.raceId JOIN drivers ON results.driverId = drivers.driverId WHERE races.name = 'Singapore Grand Prix' AND races.year = 2010 ORDER BY results.position;	formula_1
SELECT d.forename, d.surname, ds.points FROM driverStandings ds JOIN drivers d ON ds.driverId = d.driverId ORDER BY ds.points DESC LIMIT 1;	formula_1
SELECT d.forename, d.surname, r.points FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2017 AND ra.name = 'Chinese Grand Prix' ORDER BY r.points DESC LIMIT 3;	formula_1
SELECT d.forename, d.surname, r.name FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId JOIN races r ON lt.raceId = r.raceId WHERE lt.milliseconds = (SELECT MIN(milliseconds) FROM lapTimes);	formula_1
SELECT AVG(lapTimes.milliseconds) FROM lapTimes JOIN drivers ON lapTimes.driverId = drivers.driverId JOIN races ON lapTimes.raceId = races.raceId WHERE races.name = 'Malaysian Grand Prix' AND races.year = 2009 AND drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';	formula_1
SELECT (COUNT(CASE WHEN position > 1 THEN raceId ELSE NULL END) * 100.0 / COUNT(raceId)) AS percentage FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN races ON results.raceId = races.raceId WHERE drivers.surname = 'Hamilton' AND races.year >= 2010;	formula_1
SELECT d.forename, d.surname, d.nationality, MAX(ds.points) AS max_points FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId WHERE d.driverId = (     SELECT driverId     FROM (         SELECT driverId, SUM(wins) AS total_wins         FROM driverStandings         GROUP BY driverId     ) AS driver_wins     ORDER BY total_wins DESC     LIMIT 1 );	formula_1
SELECT forename || ' ' || surname AS name, (strftime('%Y', CURRENT_TIMESTAMP) - strftime('%Y', dob)) AS age FROM drivers WHERE nationality = 'Japanese' ORDER BY dob DESC LIMIT 1;	formula_1
SELECT circuits.name FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE races.year BETWEEN 1990 AND 2000 GROUP BY circuits.circuitId HAVING COUNT(races.raceId) = 4;	formula_1
SELECT circuits.name, circuits.location, races.name  FROM circuits  JOIN races ON circuits.circuitId = races.circuitId  WHERE races.year = 2006 AND circuits.country = 'USA';	formula_1
SELECT races.name, circuits.name, circuits.location FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE YEAR(races.date) = 2005 AND MONTH(races.date) = 9;	formula_1
SELECT races.name FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN races ON results.raceId = races.raceId WHERE drivers.forename = 'Alex' AND drivers.surname = 'Yoong' AND results.position < 20;	formula_1
SELECT COUNT(*) FROM (     SELECT r.raceId     FROM races r     JOIN circuits c ON r.circuitId = c.circuitId     WHERE c.name = 'Sepang International Circuit'     AND (         SELECT MAX(points) FROM results WHERE raceId = r.raceId     ) = (         SELECT points FROM results         WHERE raceId = r.raceId         AND driverId = (             SELECT driverId FROM drivers             WHERE forename = 'Michael' AND surname = 'Schumacher'         )     ) ) AS subquery;	formula_1
SELECT r.year, r.name FROM races r JOIN lapTimes lt ON r.raceId = lt.raceId JOIN drivers d ON lt.driverId = d.driverId WHERE d.forename = 'Michael' AND d.surname = 'Schumacher' ORDER BY lt.milliseconds ASC LIMIT 1;	formula_1
SELECT AVG(r.points) FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE d.forename = 'Eddie' AND d.surname = 'Irvine' AND ra.year = 2000;	formula_1
SELECT r.name, res.points FROM results res JOIN drivers d ON res.driverId = d.driverId JOIN races r ON res.raceId = r.raceId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' ORDER BY r.year ASC, r.round ASC LIMIT 1;	formula_1
SELECT races.name, circuits.country FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE races.year = 2017 ORDER BY races.date;	formula_1
SELECT r.name, r.year, c.location FROM races r JOIN circuits c ON r.circuitId = c.circuitId JOIN (SELECT raceId, MAX(laps) AS max_laps FROM results GROUP BY raceId) AS sub ON r.raceId = sub.raceId ORDER BY sub.max_laps DESC LIMIT 1;	formula_1
SELECT (COUNT(CASE WHEN circuits.country = 'Germany' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE races.name = 'European Grand Prix';	formula_1
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit';	formula_1
SELECT name FROM circuits WHERE name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring') ORDER BY lat DESC LIMIT 1;	formula_1
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit';	formula_1
SELECT country FROM circuits WHERE alt = (SELECT MAX(alt) FROM circuits);	formula_1
SELECT COUNT(*) FROM drivers WHERE code IS NULL;	formula_1
SELECT nationality FROM drivers WHERE dob = (SELECT MIN(dob) FROM drivers);	formula_1
SELECT surname FROM drivers WHERE nationality = 'italian';	formula_1
SELECT url FROM drivers WHERE forename = 'Anthony' AND surname = 'Davidson';	formula_1
SELECT driverRef FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton';	formula_1
SELECT circuits.name FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE races.name = 'Spanish Grand Prix' AND races.year = 2009;	formula_1
SELECT DISTINCT r.year FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Silverstone Circuit';	formula_1
SELECT races.url FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.name = 'Silverstone Circuit';	formula_1
SELECT races.date, races.time FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.name = 'Abu Dhabi Circuit' AND races.year = 2010;	formula_1
SELECT COUNT(*) FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.country = 'Italy';	formula_1
SELECT races.date FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.name = 'Barcelona-Catalunya';	formula_1
SELECT circuits.url FROM circuits JOIN races ON circuits.circuitId = races.circuitId JOIN seasons ON races.year = seasons.year WHERE races.name = 'Spanish Grand Prix' AND seasons.year = 2009;	formula_1
SELECT MIN(fr.fastestLapTime) FROM results fr JOIN drivers d ON fr.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT d.forename, d.surname FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE r.fastestLapSpeed IS NOT NULL ORDER BY r.fastestLapSpeed DESC LIMIT 1;	formula_1
SELECT d.driverRef FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Canadian Grand Prix' AND ra.year = 2007 AND r.position = 1;	formula_1
SELECT races.name, races.year, races.date FROM races JOIN results ON races.raceId = results.raceId WHERE results.driverId = (     SELECT driverId     FROM drivers     WHERE forename = 'Lewis' AND surname = 'Hamilton' );	formula_1
SELECT r.name FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' ORDER BY res.positionOrder ASC LIMIT 1;	formula_1
SELECT MAX(fastestLapSpeed) FROM results JOIN races ON results.raceId = races.raceId WHERE races.name = 'Spanish Grand Prix' AND races.year = 2009;	formula_1
SELECT DISTINCT races.year FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN races ON results.raceId = races.raceId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';	formula_1
SELECT r.positionOrder FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Chinese Grand Prix' AND ra.year = 2008 AND d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 1989 AND ra.name = 'Australian Grand Prix' AND r.grid = 4;	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix') AND time IS NOT NULL;	formula_1
SELECT MIN(time) FROM lapTimes WHERE raceId = (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix') AND driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton');	formula_1
SELECT r.time FROM results r JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Chinese Grand Prix' AND ra.year = 2008 AND r.position = 2;	formula_1
SELECT d.forename, d.surname, d.url FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE r.year = 2008 AND r.name = 'Australian Grand Prix' AND res.position = 1;	formula_1
SELECT COUNT(*) FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN races ON results.raceId = races.raceId WHERE races.year = 2008 AND races.name = 'Australian Grand Prix' AND drivers.nationality = 'British';	formula_1
SELECT COUNT(DISTINCT r.driverId) FROM results r JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2008 AND ra.name = 'Chinese Grand Prix' AND r.time IS NOT NULL;	formula_1
SELECT SUM(r.points) FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT AVG(total_seconds) FROM (     SELECT          (CAST(SUBSTR(fastestLapTime, 1, INSTR(fastestLapTime, ':') - 1) AS INTEGER) * 60 +          CAST(SUBSTR(SUBSTR(fastestLapTime, INSTR(fastestLapTime, ':') + 1), 1, INSTR(SUBSTR(fastestLapTime, INSTR(fastestLapTime, ':') + 1), '.') - 1) AS INTEGER) +          CAST(SUBSTR(SUBSTR(fastestLapTime, INSTR(fastestLapTime, ':') + 1), INSTR(SUBSTR(fastestLapTime, INSTR(fastestLapTime, ':') + 1), '.') + 1) AS INTEGER) / 1000) AS total_seconds     FROM results     JOIN drivers ON results.driverId = drivers.driverId     WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' ) AS subquery;	formula_1
SELECT      COUNT(CASE WHEN time IS NOT NULL THEN raceId END) * 1.0 / COUNT(raceId) AS rate FROM results WHERE raceId IN (     SELECT raceId      FROM races      WHERE year = 2008 AND name = 'Australian Grand Prix' );	formula_1
SELECT    (champion.milliseconds - last.milliseconds) * 100.0 / last.milliseconds AS percentage_faster FROM    (SELECT milliseconds FROM results WHERE raceId = (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix') AND position = 1) AS champion,   (SELECT milliseconds FROM results WHERE raceId = (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix') AND position = (SELECT MAX(position) FROM results WHERE raceId = (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix'))) AS last;	formula_1
SELECT COUNT(*) FROM circuits WHERE location = 'Adelaide' AND country = 'Australia';	formula_1
SELECT lat, lng FROM circuits WHERE country = 'USA';	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND dob > '1980-12-31';	formula_1
SELECT MAX(cr.points) FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId WHERE c.nationality = 'British';	formula_1
SELECT c.name FROM constructorResults cr JOIN constructors c ON cr.constructorId = c.constructorId GROUP BY c.constructorId ORDER BY SUM(cr.points) DESC LIMIT 1;	formula_1
SELECT `constructors`.`name` FROM `constructors` INNER JOIN `constructorResults` ON `constructors`.`constructorId` = `constructorResults`.`constructorId` WHERE `constructorResults`.`raceId` = 291 AND `constructorResults`.`points` = 0;	formula_1
SELECT COUNT(*) FROM constructors WHERE nationality = 'Japanese' AND constructorId IN (SELECT constructorId FROM constructorResults WHERE points = 0 GROUP BY constructorId HAVING COUNT(raceId) = 2)	formula_1
SELECT c.name FROM constructorStandings cs JOIN constructors c ON cs.constructorId = c.constructorId WHERE cs.position = 1;	formula_1
SELECT COUNT(DISTINCT c.constructorId) FROM constructors c JOIN drivers d ON c.constructorId = d.constructorId JOIN results r ON d.driverId = r.driverId WHERE c.nationality = 'French' AND r.laps > 50;	formula_1
SELECT      (COUNT(DISTINCT CASE WHEN r.time IS NOT NULL THEN d.driverId END) * 100.0 / COUNT(DISTINCT d.driverId)) AS completion_percentage FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE d.nationality = 'Japanese' AND ra.year BETWEEN 2007 AND 2009;	formula_1
SELECT      s.year,     AVG(         (CAST(SUBSTR(res.time, 1, INSTR(res.time, ':') - 1) AS INTEGER) * 3600 +          CAST(SUBSTR(res.time, INSTR(res.time, ':') + 1, INSTR(SUBSTR(res.time, INSTR(res.time, ':') + 1), ':') - 1) AS INTEGER) * 60 +          CAST(SUBSTR(res.time, INSTR(res.time, ':') + 1, INSTR(SUBSTR(res.time, INSTR(res.time, ':') + 1), ':') + 3) AS REAL))     ) AS avg_time_seconds FROM      seasons s JOIN      races r ON s.year = r.year JOIN      driverStandings ds ON r.raceId = ds.raceId JOIN      (SELECT           year,          driverId      FROM           (SELECT                s2.year,               ds2.driverId,               SUM(ds2.points) AS total_points           FROM                seasons s2           JOIN                races r2 ON s2.year = r2.year           JOIN                driverStandings ds2 ON r2.raceId = ds2.raceId           GROUP BY                s2.year, ds2.driverId          )      WHERE           (year, total_points) IN (              SELECT                   year,                   MAX(total_points)              FROM                   (SELECT                        s3.year,                       SUM(ds3.points) AS total_points                   FROM                        seasons s3                   JOIN                        races r3 ON s3.year = r3.year                   JOIN                        driverStandings ds3 ON r3.raceId = ds3.raceId                   GROUP BY                        s3.year                  )          )      ) AS champion_drivers ON s.year = champion_drivers.year AND ds.driverId = champion_drivers.driverId JOIN      results res ON r.raceId = res.raceId AND ds.driverId = res.driverId WHERE      s.year < 1975     AND res.time IS NOT NULL GROUP BY      s.year;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId WHERE strftime('%Y', d.dob) > '1975' AND ds.position = 2;	formula_1
SELECT COUNT(DISTINCT drivers.driverId) FROM drivers JOIN results ON drivers.driverId = results.driverId WHERE drivers.nationality = 'Italian' AND results.time IS NULL;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN lapTimes l ON d.driverId = l.driverId WHERE l.milliseconds = (SELECT MIN(milliseconds) FROM lapTimes);	formula_1
SELECT r.fastestLap FROM results r JOIN driverStandings ds ON r.driverId = ds.driverId AND r.raceId = ds.raceId JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2009 AND ds.position = 1 ORDER BY ra.round DESC LIMIT 1;	formula_1
SELECT AVG(fastestLapSpeed) FROM results WHERE raceId = (SELECT raceId FROM races WHERE name = 'Spanish Grand Prix' AND year = 2009);	formula_1
SELECT r.name, r.year FROM races r JOIN results res ON r.raceId = res.raceId WHERE res.milliseconds IS NOT NULL GROUP BY r.raceId ORDER BY MIN(res.milliseconds) ASC LIMIT 1;	formula_1
SELECT      (COUNT(DISTINCT CASE WHEN YEAR(d.dob) < 1985 AND laps.total_laps > 50 THEN d.driverId END) * 100.0 / COUNT(DISTINCT denom.driverId)) AS percentage FROM      (SELECT DISTINCT driverId FROM results JOIN races ON results.raceId = races.raceId WHERE races.year BETWEEN 2000 AND 2005) AS denom JOIN drivers d ON denom.driverId = d.driverId LEFT JOIN (     SELECT driverId, COUNT(*) AS total_laps     FROM lapTimes     WHERE raceId IN (SELECT raceId FROM races WHERE year BETWEEN 2000 AND 2005)     GROUP BY driverId ) AS laps ON denom.driverId = laps.driverId;	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId WHERE d.nationality = 'French' AND lt.milliseconds < 120000;	formula_1
SELECT `code` FROM `drivers` WHERE `nationality` = 'America';	formula_1
SELECT raceId FROM races WHERE year = 2009;	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = 18;	formula_1
SELECT driverId FROM drivers ORDER BY YEAR(dob) DESC LIMIT 3; SELECT COUNT(*) FROM drivers WHERE nationality = 'Dutch' AND driverId IN (SELECT driverId FROM drivers ORDER BY YEAR(dob) DESC LIMIT 3)	formula_1
SELECT `driverRef` FROM `drivers` WHERE `forename` = 'Robert' AND `surname` = 'Kubica';	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND strftime('%Y', dob) = '1980';	formula_1
SELECT d.driverId, d.forename, d.surname, MIN(l.time) AS earliest_lap_time FROM drivers d JOIN lapTimes l ON d.driverId = l.driverId WHERE d.nationality = 'German' AND strftime('%Y', d.dob) BETWEEN '1980' AND '1990' GROUP BY d.driverId ORDER BY earliest_lap_time ASC LIMIT 3;	formula_1
SELECT driverRef FROM drivers WHERE nationality = 'German' AND strftime('%Y', dob) = (SELECT MIN(strftime('%Y', dob)) FROM drivers WHERE nationality = 'German')	formula_1
SELECT d.driverId, d.code FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE YEAR(d.dob) = 1971 AND r.fastestLapTime = (     SELECT MIN(fastestLapTime)     FROM results     WHERE fastestLapTime IS NOT NULL )	formula_1
SELECT d.driverId, d.forename, d.surname, MAX(l.time) AS latest_lap_time FROM drivers d JOIN lapTimes l ON d.driverId = l.driverId WHERE d.nationality = 'Spanish' AND YEAR(d.dob) < 1982 GROUP BY d.driverId ORDER BY latest_lap_time DESC LIMIT 10;	formula_1
SELECT r.year FROM results res JOIN races r ON res.raceId = r.raceId ORDER BY res.fastestLapTime ASC LIMIT 1;	formula_1
SELECT r.year FROM lapTimes lt JOIN races r ON lt.raceId = r.raceId ORDER BY lt.time DESC LIMIT 1;	formula_1
SELECT driverId FROM lapTimes WHERE lap = 1 GROUP BY driverId ORDER BY MIN(time) DESC LIMIT 5;	formula_1
SELECT COUNT(*) FROM results WHERE statusId = 2 AND time IS NOT NULL AND raceId BETWEEN 50 AND 100;	formula_1
SELECT COUNT(*) AS count, name, lat, lng FROM circuits WHERE country = 'Austria';	formula_1
SELECT r.round FROM results AS res JOIN races AS r ON res.raceId = r.raceId WHERE res.time IS NOT NULL GROUP BY r.round ORDER BY COUNT(*) DESC LIMIT 1;	formula_1
SELECT drivers.driverRef, drivers.nationality, drivers.dob FROM drivers JOIN qualifying ON drivers.driverId = qualifying.driverId WHERE qualifying.raceId = 23 AND qualifying.q2 IS NOT NULL;	formula_1
SELECT r.year, r.name, r.date, r.time FROM races r JOIN qualifying q ON r.raceId = q.raceId JOIN drivers d ON q.driverId = d.driverId WHERE r.date = (SELECT MIN(date) FROM races) ORDER BY d.dob DESC LIMIT 1;	formula_1
SELECT COUNT(*) FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN status ON results.statusId = status.statusId WHERE drivers.nationality = 'American' AND status.status = 'Puncture';	formula_1
SELECT c.url FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId GROUP BY c.constructorId HAVING SUM(cr.points) = (     SELECT MAX(total_points)     FROM (         SELECT SUM(cr2.points) AS total_points         FROM constructors c2         JOIN constructorResults cr2 ON c2.constructorId = cr2.constructorId         WHERE c2.nationality = 'Italian'         GROUP BY c2.constructorId     ) ) AND c.nationality = 'Italian';	formula_1
SELECT c.url FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId GROUP BY c.constructorId ORDER BY SUM(cs.wins) DESC LIMIT 1;	formula_1
SELECT d.forename, d.surname FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId WHERE lt.raceId = (SELECT raceId FROM races WHERE name = 'French Grand Prix') AND lt.lap = 3 ORDER BY lt.time DESC LIMIT 1;	formula_1
SELECT r.name, l.milliseconds FROM lapTimes l JOIN races r ON l.raceId = r.raceId WHERE l.lap = 1 ORDER BY l.milliseconds ASC LIMIT 1;	formula_1
SELECT AVG(fastestLapTime) FROM results JOIN races ON results.raceId = races.raceId WHERE races.year = 2006 AND races.name LIKE '%United States Grand Prix%' AND results.positionOrder < 11;	formula_1
SELECT      d.forename,      d.surname,      SUM(CAST(p.duration AS REAL)) / COUNT(p.duration) AS avg_duration FROM      drivers d JOIN      pitStops p ON d.driverId = p.driverId WHERE      d.nationality = 'German'      AND strftime('%Y', d.dob) > 1980      AND strftime('%Y', d.dob) < 1985 GROUP BY      d.driverId ORDER BY      avg_duration ASC LIMIT 3;	formula_1
SELECT d.forename, d.surname, r.time FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE r.year = 2008 AND r.name = 'Canadian Grand Prix' AND res.position = 1;	formula_1
SELECT c.constructorRef, c.url FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId JOIN constructors c ON d.constructorId = c.constructorId WHERE r.year = 2009 AND r.name = 'Singapore Grand Prix' ORDER BY res.position ASC LIMIT 1;	formula_1
SELECT forename, surname, dob FROM drivers WHERE nationality = 'Austrian' AND YEAR(dob) BETWEEN 1981 AND 1991;	formula_1
SELECT CONCAT(forename, ' ', surname) AS full_name, url, dob FROM drivers WHERE nationality = 'German' AND YEAR(dob) BETWEEN 1971 AND 1985 ORDER BY dob DESC;	formula_1
SELECT location, country, lat, lng FROM circuits WHERE name = 'Hungaroring';	formula_1
SELECT c.name, c.nationality, SUM(cr.points) AS total_points FROM constructorResults cr JOIN races r ON cr.raceId = r.raceId JOIN constructors c ON cr.constructorId = c.constructorId WHERE r.name = 'Monaco Grand Prix' AND r.year BETWEEN 1980 AND 2010 GROUP BY c.constructorId ORDER BY total_points DESC LIMIT 1;	formula_1
SELECT AVG(results.points) FROM results JOIN races ON results.raceId = races.raceId JOIN drivers ON results.driverId = drivers.driverId WHERE races.name = 'Turkish Grand Prix' AND drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';	formula_1
SELECT COUNT(*) / 11.0 AS average FROM races WHERE date BETWEEN '2000-01-01' AND '2010-12-31';	formula_1
SELECT nationality FROM drivers GROUP BY nationality ORDER BY COUNT(*) DESC LIMIT 1;	formula_1
SELECT wins FROM driverStandings WHERE points = 91;	formula_1
SELECT races.name FROM races JOIN results ON races.raceId = results.raceId WHERE results.fastestLapTime = (SELECT MIN(fastestLapTime) FROM results)	formula_1
SELECT circuits.location, circuits.country FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE races.date = (SELECT MAX(date) FROM races);	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year = 2008 AND c.name = 'Marina Bay Street Circuit' ORDER BY q.q3 ASC LIMIT 1;	formula_1
SELECT d.forename, d.surname, d.nationality, r.name FROM drivers d JOIN results res ON d.driverId = res.driverId JOIN races r ON res.raceId = r.raceId WHERE d.dob = (SELECT MAX(dob) FROM drivers) ORDER BY r.date ASC LIMIT 1;	formula_1
SELECT MAX(accident_count) FROM (SELECT COUNT(*) AS accident_count FROM results WHERE raceId = (SELECT raceId FROM races WHERE name = 'Canadian Grand Prix') AND statusId = 3 GROUP BY driverId) AS counts;	formula_1
SELECT d.forename, d.surname, COALESCE(SUM(ds.wins), 0) AS total_wins FROM drivers d LEFT JOIN driverStandings ds ON d.driverId = ds.driverId WHERE d.dob = (SELECT MIN(dob) FROM drivers) GROUP BY d.driverId;	formula_1
SELECT MAX(duration) FROM pitStops;	formula_1
SELECT time FROM lapTimes ORDER BY milliseconds ASC LIMIT 1;	formula_1
SELECT MAX(duration) FROM pitStops WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')	formula_1
SELECT p.lap FROM pitStops p JOIN drivers d ON p.driverId = d.driverId JOIN races r ON p.raceId = r.raceId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND r.year = 2011 AND r.name = 'Australian Grand Prix';	formula_1
SELECT driverId, SUM(CAST(duration AS REAL)) AS total_duration FROM pitStops WHERE raceId = 841 GROUP BY driverId;	formula_1
SELECT MIN(lapTimes.time) FROM lapTimes JOIN drivers ON lapTimes.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN lapTimes l ON d.driverId = l.driverId WHERE l.time = (SELECT MIN(time) FROM lapTimes) ORDER BY d.forename, d.surname LIMIT 20;	formula_1
SELECT position FROM lapTimes WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton') AND time = (SELECT MIN(time) FROM lapTimes WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton'));	formula_1
SELECT MIN(lapTimes.time) FROM lapTimes JOIN races ON lapTimes.raceId = races.raceId JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.name = 'Austrian Grand Prix';	formula_1
SELECT circuits.name, MIN(lapTimes.time) AS fastest_lap_time FROM lapTimes JOIN races ON lapTimes.raceId = races.raceId JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.country = 'Italy' GROUP BY circuits.circuitId;	formula_1
SELECT races.name FROM races JOIN lapTimes ON races.raceId = lapTimes.raceId JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.name = 'Austrian Grand Prix' ORDER BY lapTimes.time ASC LIMIT 1;	formula_1
SELECT p.duration FROM pitStops p JOIN lapTimes l ON p.driverId = l.driverId AND p.raceId = l.raceId JOIN races r ON l.raceId = r.raceId JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Austrian Grand Prix Circuit' ORDER BY l.time ASC LIMIT 1;	formula_1
SELECT c.lat, c.lng FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN lapTimes l ON r.raceId = l.raceId WHERE l.time = '1:29.488';	formula_1
SELECT AVG(pitStops.milliseconds) FROM pitStops JOIN drivers ON pitStops.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';	formula_1
SELECT AVG(lapTimes.milliseconds) FROM lapTimes JOIN races ON lapTimes.raceId = races.raceId JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.country = 'Italy';	formula_1
SELECT player_api_id FROM Player_Attributes WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT player_name, height FROM Player ORDER BY height DESC LIMIT 1;	european_football_2
SELECT preferred_foot FROM Player_Attributes WHERE potential = (SELECT MIN(potential) FROM Player_Attributes);	european_football_2
SELECT COUNT(DISTINCT player_api_id) FROM Player_Attributes WHERE overall_rating >= 60 AND overall_rating < 65 AND defensive_work_rate = 'low';	european_football_2
SELECT player_api_id FROM Player_Attributes ORDER BY crossing DESC LIMIT 5;	european_football_2
SELECT L.name FROM Match M JOIN League L ON M.league_id = L.id WHERE M.season = '2015/2016' GROUP BY M.league_id ORDER BY SUM(M.home_team_goal + M.away_team_goal) DESC LIMIT 1;	european_football_2
SELECT      Team.team_long_name AS home_team,     COUNT(*) AS losses FROM      Match JOIN      Team ON Match.home_team_api_id = Team.team_api_id WHERE      Match.season = '2015/2016'     AND Match.home_team_goal < Match.away_team_goal GROUP BY      Match.home_team_api_id ORDER BY      losses ASC LIMIT 1;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id GROUP BY p.player_api_id ORDER BY MAX(pa.penalties) DESC LIMIT 10;	european_football_2
SELECT Team.team_long_name FROM Match JOIN League ON Match.league_id = League.id JOIN Team ON Match.away_team_api_id = Team.team_api_id WHERE League.name = 'Scotland Premier League' AND Match.season = '2009/2010' AND Match.away_team_goal > Match.home_team_goal GROUP BY Match.away_team_api_id ORDER BY COUNT(*) DESC LIMIT 1;	european_football_2
SELECT Team.team_long_name, MAX(Team_Attributes.buildUpPlaySpeed) AS buildUpPlaySpeed FROM Team_Attributes JOIN Team ON Team_Attributes.team_fifa_api_id = Team.team_fifa_api_id GROUP BY Team.team_fifa_api_id ORDER BY buildUpPlaySpeed DESC LIMIT 4;	european_football_2
SELECT League.name, SUM(home_team_goal = away_team_goal) AS draw_count FROM Match JOIN League ON Match.league_id = League.id WHERE Match.season = '2015/2016' GROUP BY League.id, League.name ORDER BY draw_count DESC LIMIT 1;	european_football_2
SELECT      p.player_name,     (JULIANDAY('now') - JULIANDAY(p.birthday)) / 365.25 AS age FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.sprint_speed >= 97 AND strftime('%Y', pa.date) BETWEEN '2013' AND '2015';	european_football_2
SELECT L.name, COUNT(*) AS match_count FROM Match M JOIN League L ON M.league_id = L.id GROUP BY L.id ORDER BY match_count DESC LIMIT 1;	european_football_2
SELECT AVG(height) FROM Player WHERE birthday >= '1990-01-01 00:00:00' AND birthday < '1996-01-01 00:00:00';	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE substr(date, 1, 4) = '2010' AND overall_rating = (     SELECT MAX(overall_rating)     FROM Player_Attributes     WHERE substr(date, 1, 4) = '2010' );	european_football_2
SELECT team_fifa_api_id FROM Team_Attributes WHERE buildUpPlaySpeed > 50 AND buildUpPlaySpeed < 60;	european_football_2
SELECT Team.team_long_name FROM Team JOIN Team_Attributes ON Team.team_api_id = Team_Attributes.team_api_id WHERE strftime('%Y', Team_Attributes.date) = '2012' AND Team_Attributes.buildUpPlayPassing > (     SELECT SUM(buildUpPlayPassing) / COUNT(*)     FROM Team_Attributes     WHERE strftime('%Y', date) = '2012' AND buildUpPlayPassing IS NOT NULL ) ORDER BY Team.team_long_name;	european_football_2
SELECT (SUM(CASE WHEN preferred_foot = 'left' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS percentage FROM Player WHERE SUBSTR(birthday, 1, 4) BETWEEN '1987' AND '1992';	european_football_2
SELECT League.name, SUM(Match.home_team_goal + Match.away_team_goal) AS total_goals FROM Match JOIN League ON Match.league_id = League.id GROUP BY League.id ORDER BY total_goals ASC LIMIT 5;	european_football_2
SELECT SUM(Player_Attributes.long_shots) / COUNT(Player_Attributes.player_fifa_api_id) FROM Player_Attributes JOIN Player ON Player_Attributes.player_fifa_api_id = Player.player_fifa_api_id WHERE Player.player_name = 'Ahmed Samir Farag';	european_football_2
SELECT p.player_name, SUM(pa.heading_accuracy) / COUNT(pa.player_fifa_api_id) AS avg_heading_accuracy FROM Player p JOIN Player_Attributes pa ON p.player_fifa_api_id = pa.player_fifa_api_id WHERE p.height > 180 GROUP BY p.player_fifa_api_id ORDER BY avg_heading_accuracy DESC LIMIT 10;	european_football_2
SELECT t.team_long_name FROM Team_Attributes ta JOIN Team t ON ta.team_fifa_api_id = t.team_fifa_api_id WHERE ta.buildUpPlayDribblingClass = 'Normal' AND ta.date BETWEEN '2014-01-01 00:00:00' AND '2014-01-31 00:00:00' AND ta.chanceCreationPassing < (     SELECT AVG(chanceCreationPassing)     FROM Team_Attributes     WHERE buildUpPlayDribblingClass = 'Normal'     AND date BETWEEN '2014-01-01 00:00:00' AND '2014-01-31 00:00:00' ) ORDER BY ta.chanceCreationPassing DESC;	european_football_2
SELECT League.name FROM Match JOIN League ON Match.league_id = League.id WHERE Match.season = '2009/2010' GROUP BY League.id HAVING (SUM(home_team_goal) * 1.0 / COUNT(DISTINCT Match.id)) > (SUM(away_team_goal) * 1.0 / COUNT(DISTINCT Match.id));	european_football_2
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers';	european_football_2
SELECT * FROM Player WHERE substr(birthday, 1, 4) = '1970' AND substr(birthday, 6, 2) = '10';	european_football_2
SELECT pa.attacking_work_rate FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name = 'Franco Zennaro';	european_football_2
SELECT Team_Attributes.buildUpPlayPositioningClass FROM Team JOIN Team_Attributes ON Team.team_api_id = Team_Attributes.team_api_id WHERE Team.team_long_name = 'ADO Den Haag';	european_football_2
SELECT pa.heading_accuracy FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name = 'Francois Affolter' AND pa.date = '2014-09-18 00:00:00';	european_football_2
SELECT pa.overall_rating FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Gabriel Tamas' AND strftime('%Y', pa.date) = '2011'	european_football_2
SELECT COUNT(*) FROM Match JOIN League ON Match.league_id = League.id WHERE League.name = 'Scotland Premier League' AND Match.season = '2015/2016';	european_football_2
SELECT pa.preferred_foot FROM Player p JOIN Player_Attributes pa ON p.player_fifa_api_id = pa.player_fifa_api_id ORDER BY p.birthday DESC LIMIT 1;	european_football_2
SELECT p.player_name, pa.potential FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.potential = (SELECT MAX(potential) FROM Player_Attributes);	european_football_2
SELECT COUNT(*) FROM Player WHERE weight < 130 AND preferred_foot = 'left';	european_football_2
SELECT DISTINCT Team.team_short_name FROM Team JOIN Team_Attributes ON Team.team_api_id = Team_Attributes.team_api_id WHERE Team_Attributes.chanceCreationPassingClass = 'Risky';	european_football_2
SELECT pa.defensive_work_rate FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id OR p.player_fifa_api_id = pa.player_fifa_api_id WHERE p.player_name = 'David Wilson';	european_football_2
SELECT p.birthday FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT `League`.`name` FROM `League` INNER JOIN `Country` ON `League`.`country_id` = `Country`.`id` WHERE `Country`.`name` = 'Netherlands';	european_football_2
SELECT AVG(home_team_goal) FROM Match JOIN Country ON Match.country_id = Country.id WHERE Country.name = 'Poland' AND season = '2010/2011';	european_football_2
SELECT p.player_name FROM Player p JOIN (     SELECT          p.player_api_id,         AVG(pa.finishing) AS avg_finishing     FROM Player p     JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id     GROUP BY p.player_api_id ) pf ON p.player_api_id = pf.player_api_id WHERE p.height = (SELECT MAX(height) FROM Player) OR p.height = (SELECT MIN(height) FROM Player) ORDER BY pf.avg_finishing DESC LIMIT 1;	european_football_2
SELECT player_name FROM Player WHERE height > 180;	european_football_2
SELECT COUNT(*) FROM Player WHERE strftime('%Y', birthday) = '1990';	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name = 'Adam' AND weight > 170;	european_football_2
SELECT DISTINCT Player.player_name FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE Player_Attributes.overall_rating > 80 AND strftime('%Y', Player_Attributes.date) BETWEEN '2008' AND '2010';	european_football_2
SELECT pa.potential FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name = 'Aaron Doran';	european_football_2
SELECT Player.player_name FROM Player JOIN Player_Attributes ON Player.player_fifa_api_id = Player_Attributes.player_fifa_api_id WHERE Player_Attributes.preferred_foot = 'left'	european_football_2
SELECT Team.team_long_name FROM Team JOIN Team_Attributes ON Team.team_fifa_api_id = Team_Attributes.team_fifa_api_id WHERE Team_Attributes.buildUpPlaySpeedClass = 'Fast';	european_football_2
SELECT Team_Attributes.buildUpPlayPassingClass FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE Team.team_short_name = 'CLB';	european_football_2
SELECT Team.team_short_name FROM Team JOIN Team_Attributes ON Team.team_api_id = Team_Attributes.team_api_id WHERE Team_Attributes.buildUpPlayPassing > 70;	european_football_2
SELECT SUM(Player_Attributes.overall_rating) / COUNT(Player_Attributes.id) FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE Player.height > 170 AND strftime('%Y', Player_Attributes.date) BETWEEN '2010' AND '2015'	european_football_2
SELECT player_name, height FROM Player WHERE height = (SELECT MIN(height) FROM Player);	european_football_2
SELECT Country.name FROM League JOIN Country ON League.country_id = Country.id WHERE League.name = 'Italy Serie A';	european_football_2
SELECT Team.team_short_name FROM Team JOIN Team_Attributes ON Team.team_fifa_api_id = Team_Attributes.team_fifa_api_id WHERE Team_Attributes.buildUpPlaySpeed = 31 AND Team_Attributes.buildUpPlayDribbling = 53 AND Team_Attributes.buildUpPlayPassing = 32;	european_football_2
SELECT AVG(pa.overall_rating) FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id OR p.player_fifa_api_id = pa.player_fifa_api_id WHERE p.player_name = 'Aaron Doran';	european_football_2
SELECT COUNT(*) FROM Match JOIN League ON Match.league_id = League.id WHERE League.name = 'Germany 1. Bundesliga' AND strftime('%Y-%m', date) BETWEEN '2008-08' AND '2008-10';	european_football_2
SELECT Team.team_short_name FROM Match JOIN Team ON Match.home_team_api_id = Team.team_api_id WHERE Match.home_team_goal = 10;	european_football_2
SELECT * FROM Player WHERE potential = 61 AND balance = (SELECT MAX(balance) FROM Player);	european_football_2
SELECT (SUM(CASE WHEN player_name = 'Abdou Diallo' THEN ball_control ELSE 0 END) / COUNT(CASE WHEN player_name = 'Abdou Diallo' THEN id ELSE NULL END)) - (SUM(CASE WHEN player_name = 'Aaron Appindangoye' THEN ball_control ELSE 0 END) / COUNT(CASE WHEN player_name = 'Aaron Appindangoye' THEN id ELSE NULL END)) AS difference FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id OR Player.player_fifa_api_id = Player_Attributes.player_fifa_api_id;	european_football_2
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN';	european_football_2
SELECT      CASE          WHEN (SELECT birthday FROM Player WHERE player_name = 'Aaron Lennon') < (SELECT birthday FROM Player WHERE player_name = 'Abdelaziz Barrada') THEN 'Aaron Lennon'         ELSE 'Abdelaziz Barrada'     END AS older_player;	european_football_2
SELECT player_name, height FROM Player WHERE height = (SELECT MAX(height) FROM Player);	european_football_2
SELECT COUNT(DISTINCT player_api_id) FROM Player_Attributes WHERE preferred_foot = 'left' AND attacking_work_rate = 'low';	european_football_2
SELECT Country.name FROM Country JOIN League ON Country.id = League.country_id WHERE League.name = 'Belgium Jupiler League';	european_football_2
SELECT name FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Germany');	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT COUNT(DISTINCT Player.player_api_id) FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE strftime('%Y', Player.birthday) < '1986' AND Player_Attributes.defensive_work_rate = 'high';	european_football_2
SELECT player_name, MAX(crossing) AS max_crossing FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone') GROUP BY player_name ORDER BY max_crossing DESC LIMIT 1;	european_football_2
SELECT pa.heading_accuracy FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Ariel Borysiuk';	european_football_2
SELECT COUNT(*) FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE Player.height > 180 AND Player_Attributes.voleys > 70;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.volleys > 70 AND pa.dribbling > 70;	european_football_2
SELECT COUNT(*) FROM Match WHERE country_id = 1 AND season = '2008/2009';	european_football_2
SELECT pa.long_passing FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id ORDER BY p.birthday ASC LIMIT 1;	european_football_2
SELECT COUNT(*) FROM Match JOIN League ON Match.league_id = League.id WHERE League.name = 'Belgium Jupiler League' AND SUBSTR(`date`, 1, 7) = '2009-04';	european_football_2
SELECT League.name FROM Match JOIN League ON Match.league_id = League.id WHERE Match.season = '2008/2009' GROUP BY Match.league_id ORDER BY COUNT(*) DESC LIMIT 1;	european_football_2
SELECT SUM(Player_Attributes.overall_rating) / COUNT(Player.id) FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE strftime('%Y', Player.birthday) < '1986';	european_football_2
SELECT (( (SELECT overall_rating FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Ariel Borysiuk') - (SELECT overall_rating FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Paulin Puel') ) * 100.0 / (SELECT overall_rating FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Paulin Puel')) AS percentage_difference;	european_football_2
SELECT AVG(TA.buildUpPlaySpeed) FROM Team_Attributes TA JOIN Team T ON TA.team_api_id = T.team_api_id WHERE T.team_long_name = 'Heart of Midlothian';	european_football_2
SELECT AVG(overall_rating) FROM Player_Attributes JOIN Player ON Player.player_api_id = Player_Attributes.player_api_id OR Player.player_fifa_api_id = Player_Attributes.player_fifa_api_id WHERE Player.player_name = 'Pietro Marino';	european_football_2
SELECT SUM(Player_Attributes.crossing) FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE Player.player_name = 'Aaron Lennox';	european_football_2
SELECT chanceCreationPassing AS max_score, chanceCreationPassingClass FROM Team_Attributes WHERE team_api_id = (SELECT team_api_id FROM Team WHERE team_long_name = 'Ajax') OR team_fifa_api_id = (SELECT team_fifa_api_id FROM Team WHERE team_long_name = 'Ajax') ORDER BY chanceCreationPassing DESC LIMIT 1;	european_football_2
SELECT pa.preferred_foot FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id OR p.player_fifa_api_id = pa.player_fifa_api_id WHERE p.player_name = 'Abdou Diallo';	european_football_2
SELECT MAX(pa.overall_rating) FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id OR p.player_fifa_api_id = pa.player_fifa_api_id WHERE p.player_name = 'Dorlan Pabon';	european_football_2
SELECT AVG(away_team_goal) FROM Match JOIN Team ON Match.away_team_api_id = Team.team_api_id WHERE Team.team_long_name = 'Parma' AND Match.country_id = 10257;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating = 77 AND pa.date LIKE '2016-06-23%' ORDER BY p.birthday ASC LIMIT 1;	european_football_2
SELECT pa.overall_rating FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id OR p.player_fifa_api_id = pa.player_fifa_api_id WHERE p.player_name = 'Aaron Mooy' AND pa.date LIKE '2016-02-04%';	european_football_2
SELECT pa.potential FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id OR p.player_fifa_api_id = pa.player_fifa_api_id WHERE p.player_name = 'Francesco Parravicini' AND pa.date = '2010-08-30 00:00:00';	european_football_2
SELECT pa.attacking_work_rate FROM Player p JOIN Player_Attributes pa ON pa.player_api_id = p.player_api_id OR pa.player_fifa_api_id = p.player_fifa_api_id WHERE p.player_name = 'Francesco Migliore' AND pa.date LIKE '2015-05-01%';	european_football_2
SELECT pa.defensive_work_rate FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name = 'Kevin Berigaud' AND pa.date = '2013-02-22 00:00:00';	european_football_2
SELECT MIN(date) FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Kevin Constant') AND crossing = (SELECT MAX(crossing) FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Kevin Constant'))	european_football_2
SELECT buildUpPlaySpeedClass FROM Team_Attributes WHERE (team_api_id = (SELECT team_api_id FROM Team WHERE team_long_name = 'Willem II') OR team_fifa_api_id = (SELECT team_fifa_api_id FROM Team WHERE team_long_name = 'Willem II')) AND date = '2012-02-22'	european_football_2
SELECT Team_Attributes.buildUpPlayDribblingClass FROM Team_Attributes JOIN Team ON Team.team_api_id = Team_Attributes.team_api_id WHERE Team.team_short_name = 'LEI' AND Team_Attributes.date = '2015-09-10 00:00:00';	european_football_2
SELECT buildUpPlayPassingClass FROM Team_Attributes WHERE (team_api_id = (SELECT team_api_id FROM Team WHERE team_long_name = 'FC Lorient') OR team_fifa_api_id = (SELECT team_fifa_api_id FROM Team WHERE team_long_name = 'FC Lorient')) AND date LIKE '2010-02-22%';	european_football_2
SELECT Team_Attributes.chanceCreationPassingClass FROM Team JOIN Team_Attributes ON Team.team_api_id = Team_Attributes.team_api_id WHERE Team.team_long_name = 'PEC Zwolle' AND Team_Attributes.date = '2013-09-20 00:00:00';	european_football_2
SELECT chanceCreationCrossingClass FROM Team_Attributes JOIN Team ON Team.team_api_id = Team_Attributes.team_api_id WHERE Team.team_long_name = 'Hull City' AND Team_Attributes.date = '2010-02-22 00:00:00'	european_football_2
SELECT Team_Attributes.defenceAggressionClass FROM Team JOIN Team_Attributes ON Team.team_fifa_api_id = Team_Attributes.team_fifa_api_id WHERE Team.team_long_name = 'Hannover 96' AND Team_Attributes.date LIKE '2015-09-10%';	european_football_2
SELECT AVG(overall_rating) FROM Player_Attributes JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id WHERE Player.player_name = 'Marko Arnautovic' AND SUBSTR(Player_Attributes.date, 1, 10) BETWEEN '2007-02-22' AND '2016-04-21';	european_football_2
SELECT      ( ( (SELECT pa.overall_rating FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name = 'Landon Donovan' AND pa.date = '2013-07-12') -           (SELECT pa.overall_rating FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name = 'Jordan Bowery' AND pa.date = '2013-07-12') )       * 100.0       /       (SELECT pa.overall_rating FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name = 'Landon Donovan' AND pa.date = '2013-07-12') ) AS percentage;	european_football_2
SELECT player_name FROM Player ORDER BY height DESC LIMIT 1;	european_football_2
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10;	european_football_2
SELECT player_name FROM Player WHERE datetime('CURRENT_TIMESTAMP','localtime') - datetime(birthday) > 34;	european_football_2
SELECT SUM(home_team_goal) FROM Match WHERE home_player_1 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon') OR home_player_2 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon') OR home_player_3 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon') OR home_player_4 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon') OR home_player_5 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon') OR home_player_6 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon') OR home_player_7 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon') OR home_player_8 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon') OR home_player_9 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon') OR home_player_10 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon') OR home_player_11 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon')	european_football_2
SELECT SUM(away_team_goal) FROM Match WHERE (away_player_1 IN (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR away_player_2 IN (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR away_player_3 IN (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR away_player_4 IN (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR away_player_5 IN (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR away_player_6 IN (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR away_player_7 IN (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR away_player_8 IN (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR away_player_9 IN (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR away_player_10 IN (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR away_player_11 IN (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith')) OR (away_player_1 IN (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira') OR away_player_2 IN (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira') OR away_player_3 IN (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira') OR away_player_4 IN (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira') OR away_player_5 IN (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira') OR away_player_6 IN (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira') OR away_player_7 IN (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira') OR away_player_8 IN (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira') OR away_player_9 IN (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira') OR away_player_10 IN (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira') OR away_player_11 IN (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira'));	european_football_2
SELECT SUM(m.home_team_goal) FROM Match m WHERE EXISTS (SELECT 1 FROM Player p WHERE p.player_api_id IN (m.home_player_1,m.home_player_2,m.home_player_3,m.home_player_4,m.home_player_5,m.home_player_6,m.home_player_7,m.home_player_8,m.home_player_9,m.home_player_10,m.home_player_11) AND JULIANDAY('now','localtime') - JULIANDAY(p.birthday) < 31 * 365)	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.potential = (SELECT MAX(potential) FROM Player_Attributes);	european_football_2
SELECT Player.player_name FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE Player_Attributes.attacking_work_rate = 'high';	european_football_2
SELECT player_name FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE Player_Attributes.finishing = 1 ORDER BY (julianday('now') - julianday(birthday)) DESC LIMIT 1;	european_football_2
SELECT DISTINCT Player.player_name FROM Player WHERE Player.player_api_id IN (     SELECT home_player_1 FROM Match     WHERE home_team_api_id IN (         SELECT team_api_id FROM Team         WHERE league_id IN (             SELECT id FROM League             WHERE country_id = (                 SELECT id FROM Country WHERE name = 'Belgium'             )         )     )     UNION     SELECT home_player_2 FROM Match     WHERE home_team_api_id IN (         SELECT team_api_id FROM Team         WHERE league_id IN (             SELECT id FROM League             WHERE country_id = (                 SELECT id FROM Country WHERE name = 'Belgium'             )         )     )     UNION     SELECT home_player_3 FROM Match     WHERE home_team_api_id IN (         SELECT team_api_id FROM Team         WHERE league_id IN (             SELECT id FROM League             WHERE country_id = (                 SELECT id FROM Country WHERE name = 'Belgium'             )         )     )     UNION     SELECT home_player_4 FROM Match     WHERE home_team_api_id IN (         SELECT team_api_id FROM Team         WHERE league_id IN (             SELECT id FROM League             WHERE country_id = (                 SELECT id FROM Country WHERE name = 'Belgium'             )         )     )     UNION     SELECT home_player_5 FROM Match     WHERE home_team_api_id IN (         SELECT team_api_id FROM Team         WHERE league_id IN (             SELECT id FROM League             WHERE country_id = (                 SELECT id FROM Country WHERE name = 'Belgium'             )         )     )     UNION     SELECT home_player_6 FROM Match     WHERE home_team_api_id IN (         SELECT team_api_id FROM Team         WHERE league_id IN (             SELECT id FROM League             WHERE country_id = (                 SELECT id FROM Country WHERE name = 'Belgium'             )         )     )     UNION     SELECT home_player_7 FROM Match     WHERE home_team_api_id IN (         SELECT team_api_id FROM Team         WHERE league_id IN (             SELECT id FROM League             WHERE country_id = (                 SELECT id FROM Country WHERE name = 'Belgium'             )         )     )     UNION     SELECT home_player_8 FROM Match     WHERE home_team_api_id IN (         SELECT team_api_id FROM Team         WHERE league_id IN (             SELECT id FROM League             WHERE country_id = (                 SELECT id FROM Country WHERE name = 'Belgium'             )         )     )     UNION     SELECT home_player_9 FROM Match     WHERE home_team_api_id IN (         SELECT team_api_id FROM Team         WHERE league_id IN (             SELECT id FROM League             WHERE country_id = (                 SELECT id FROM Country WHERE name = 'Belgium'             )         )     )     UNION     SELECT home_player_10 FROM Match     WHERE home_team_api_id IN (         SELECT team_api_id FROM Team         WHERE league_id IN (             SELECT id FROM League             WHERE country_id = (                 SELECT id FROM Country WHERE name = 'Belgium'             )         )     )     UNION     SELECT home_player_11 FROM Match     WHERE home_team_api_id IN (         SELECT team_api_id FROM Team         WHERE league_id IN (             SELECT id FROM League             WHERE country_id = (                 SELECT id FROM Country WHERE name = 'Belgium'             )         )     )     UNION     SELECT away_player_1 FROM Match     WHERE away_team_api_id IN (         SELECT team_api_id FROM Team         WHERE league_id IN (             SELECT id FROM League             WHERE country_id = (                 SELECT id FROM Country WHERE name = 'Belgium'             )         )     )     UNION     SELECT away_player_2 FROM Match     WHERE away_team_api_id IN (         SELECT team_api_id FROM Team         WHERE league_id IN (             SELECT id FROM League             WHERE country_id = (                 SELECT id FROM Country WHERE name = 'Belgium'             )         )     )     UNION     SELECT away_player_3 FROM Match     WHERE away_team_api_id IN (         SELECT team_api_id FROM Team         WHERE league_id IN (             SELECT id FROM League             WHERE country_id = (                 SELECT id FROM Country WHERE name = 'Belgium'             )         )     )     UNION     SELECT away_player_4 FROM Match     WHERE away_team_api_id IN (         SELECT team_api_id FROM Team         WHERE league_id IN (             SELECT id FROM League             WHERE country_id = (                 SELECT id FROM Country WHERE name = 'Belgium'             )         )     )     UNION     SELECT away_player_5 FROM Match     WHERE away_team_api_id IN (         SELECT team_api_id FROM Team         WHERE league_id IN (             SELECT id FROM League             WHERE country_id = (                 SELECT id FROM Country WHERE name = 'Belgium'             )         )     )     UNION     SELECT away_player_6 FROM Match     WHERE away_team_api_id IN (         SELECT team_api_id FROM Team         WHERE league_id IN (             SELECT id FROM League             WHERE country_id = (                 SELECT id FROM Country WHERE name = 'Belgium'             )         )     )     UNION     SELECT away_player_7 FROM Match     WHERE away_team_api_id IN (         SELECT team_api_id FROM Team         WHERE league_id IN (             SELECT id FROM League             WHERE country_id = (                 SELECT id FROM Country WHERE name = 'Belgium'             )         )     )     UNION     SELECT away_player_8 FROM Match     WHERE away_team_api_id IN (         SELECT team_api_id FROM Team         WHERE league_id IN (             SELECT id FROM League             WHERE country_id = (                 SELECT id FROM Country WHERE name = 'Belgium'             )         )     )     UNION     SELECT away_player_9 FROM Match     WHERE away_team_api_id IN (         SELECT team_api_id FROM Team         WHERE league_id IN (             SELECT id FROM League             WHERE country_id = (                 SELECT id FROM Country WHERE name = 'Belgium'             )         )     )     UNION     SELECT away_player_10 FROM Match     WHERE away_team_api_id IN (         SELECT team_api_id FROM Team         WHERE league_id IN (             SELECT id FROM League             WHERE country_id = (                 SELECT id FROM Country WHERE name = 'Belgium'             )         )     )     UNION     SELECT away_player_11 FROM Match     WHERE away_team_api_id IN (         SELECT team_api_id FROM Team         WHERE league_id IN (             SELECT id FROM League             WHERE country_id = (                 SELECT id FROM Country WHERE name = 'Belgium'             )         )     ) )	european_football_2
SELECT p.player_name, c.name AS country FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id JOIN Team t ON p.player_api_id = t.team_api_id JOIN Country c ON t.country_id = c.id WHERE pa.vision > 89;	european_football_2
SELECT Country.name, AVG(Player.weight) AS avg_weight FROM Player JOIN (     SELECT home_player_1 AS player_api_id, home_team_api_id AS team_api_id     FROM Match     UNION ALL     SELECT home_player_2 AS player_api_id, home_team_api_id AS team_api_id     FROM Match     UNION ALL     SELECT home_player_3 AS player_api_id, home_team_api_id AS team_api_id     FROM Match     UNION ALL     SELECT home_player_4 AS player_api_id, home_team_api_id AS team_api_id     FROM Match     UNION ALL     SELECT home_player_5 AS player_api_id, home_team_api_id AS team_api_id     FROM Match     UNION ALL     SELECT home_player_6 AS player_api_id, home_team_api_id AS team_api_id     FROM Match     UNION ALL     SELECT home_player_7 AS player_api_id, home_team_api_id AS team_api_id     FROM Match     UNION ALL     SELECT home_player_8 AS player_api_id, home_team_api_id AS team_api_id     FROM Match     UNION ALL     SELECT home_player_9 AS player_api_id, home_team_api_id AS team_api_id     FROM Match     UNION ALL     SELECT home_player_10 AS player_api_id, home_team_api_id AS team_api_id     FROM Match     UNION ALL     SELECT home_player_11 AS player_api_id, home_team_api_id AS team_api_id     FROM Match     UNION ALL     SELECT away_player_1 AS player_api_id, away_team_api_id AS team_api_id     FROM Match     UNION ALL     SELECT away_player_2 AS player_api_id, away_team_api_id AS team_api_id     FROM Match     UNION ALL     SELECT away_player_3 AS player_api_id, away_team_api_id AS team_api_id     FROM Match     UNION ALL     SELECT away_player_4 AS player_api_id, away_team_api_id AS team_api_id     FROM Match     UNION ALL     SELECT away_player_5 AS player_api_id, away_team_api_id AS team_api_id     FROM Match     UNION ALL     SELECT away_player_6 AS player_api_id, away_team_api_id AS team_api_id     FROM Match     UNION ALL     SELECT away_player_7 AS player_api_id, away_team_api_id AS team_api_id     FROM Match     UNION ALL     SELECT away_player_8 AS player_api_id, away_team_api_id AS team_api_id     FROM Match     UNION ALL     SELECT away_player_9 AS player_api_id, away_team_api_id AS team_api_id     FROM Match     UNION ALL     SELECT away_player_10 AS player_api_id, away_team_api_id AS team_api_id     FROM Match     UNION ALL     SELECT away_player_11 AS player_api_id, away_team_api_id AS team_api_id     FROM Match ) AS player_teams ON Player.player_api_id = player_teams.player_api_id JOIN Team ON player_teams.team_api_id = Team.team_api_id JOIN League ON Team.league_id = League.id JOIN Country ON League.country_id = Country.id GROUP BY Country.name ORDER BY avg_weight DESC LIMIT 1;	european_football_2
SELECT Team.team_long_name FROM Team JOIN Team_Attributes ON Team.team_api_id = Team_Attributes.team_api_id WHERE Team_Attributes.buildUpPlaySpeedClass = 'Slow';	european_football_2
SELECT Team.team_short_name FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE Team_Attributes.chanceCreationPassingClass = 'Safe';	european_football_2
SELECT AVG(p.height) FROM Player p WHERE p.player_api_id IN (SELECT home_player_1 FROM Match WHERE league_id = 10257 UNION ALL SELECT home_player_2 FROM Match WHERE league_id = 10257 UNION ALL SELECT home_player_3 FROM Match WHERE league_id = 10257 UNION ALL SELECT home_player_4 FROM Match WHERE league_id = 10257 UNION ALL SELECT home_player_5 FROM Match WHERE league_id = 10257 UNION ALL SELECT home_player_6 FROM Match WHERE league_id = 10257 UNION ALL SELECT home_player_7 FROM Match WHERE league_id = 10257 UNION ALL SELECT home_player_8 FROM Match WHERE league_id = 10257 UNION ALL SELECT home_player_9 FROM Match WHERE league_id = 10257 UNION ALL SELECT home_player_10 FROM Match WHERE league_id = 10257 UNION ALL SELECT home_player_11 FROM Match WHERE league_id = 10257 UNION ALL SELECT away_player_1 FROM Match WHERE league_id = 10257 UNION ALL SELECT away_player_2 FROM Match WHERE league_id = 10257 UNION ALL SELECT away_player_3 FROM Match WHERE league_id = 10257 UNION ALL SELECT away_player_4 FROM Match WHERE league_id = 10257 UNION ALL SELECT away_player_5 FROM Match WHERE league_id = 10257 UNION ALL SELECT away_player_6 FROM Match WHERE league_id = 10257 UNION ALL SELECT away_player_7 FROM Match WHERE league_id = 10257 UNION ALL SELECT away_player_8 FROM Match WHERE league_id = 10257 UNION ALL SELECT away_player_9 FROM Match WHERE league_id = 10257 UNION ALL SELECT away_player_10 FROM Match WHERE league_id = 10257 UNION ALL SELECT away_player_11 FROM Match WHERE league_id = 10257)	european_football_2
SELECT player_name FROM Player WHERE height > 180 ORDER BY player_name LIMIT 3;	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND birthday > '1990';	european_football_2
SELECT (SELECT jumping FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.id = 6) - (SELECT jumping FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.id = 23) AS difference;	european_football_2
SELECT Player.id FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE Player_Attributes.preferred_foot = 'right' AND Player_Attributes.potential = (SELECT MIN(potential) FROM Player_Attributes) ORDER BY Player_Attributes.potential ASC LIMIT 5;	european_football_2
SELECT COUNT(DISTINCT player_api_id) FROM Player_Attributes WHERE crossing = (SELECT MAX(crossing) FROM Player_Attributes) AND preferred_foot = 'left'	european_football_2
SELECT (COUNT(CASE WHEN strength > 80 AND stamina > 80 THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM Player_Attributes;	european_football_2
SELECT Country.name FROM League JOIN Country ON League.country_id = Country.id WHERE League.name = 'Poland Ekstraklasa';	european_football_2
SELECT home_team_goal, away_team_goal FROM Match JOIN League ON Match.league_id = League.id WHERE League.name = 'Belgium Jupiler League' AND Match.date LIKE '2008-09-24%';	european_football_2
SELECT pa.sprint_speed, pa.agility, pa.acceleration FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name = 'Alexis Blin';	european_football_2
SELECT buildUpPlaySpeedClass FROM Team_Attributes WHERE team_fifa_api_id = (SELECT team_fifa_api_id FROM Team WHERE team_long_name = 'KSV Cercle Brugge');	european_football_2
SELECT COUNT(*) FROM Match WHERE league_id = 10257 AND season = '2015/2016';	european_football_2
SELECT MAX(home_team_goal) FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Netherlands Eredivisie');	european_football_2
SELECT pa.finishing, pa.curve FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.weight = (SELECT MAX(weight) FROM Player);	european_football_2
SELECT L.name, COUNT(*) AS num_games FROM Match M JOIN League L ON M.league_id = L.id WHERE M.season = '2015/2016' GROUP BY L.id ORDER BY num_games DESC LIMIT 4;	european_football_2
SELECT Team.team_long_name FROM Match JOIN Team ON Match.away_team_api_id = Team.team_api_id GROUP BY Team.team_api_id ORDER BY SUM(Match.away_team_goal) DESC LIMIT 1;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id ORDER BY pa.overall_rating DESC LIMIT 1;	european_football_2
SELECT (COUNT(CASE WHEN Player.height < 180 AND Player_Attributes.overall_rating > 70 THEN 1 END) * 100.0 / COUNT(Player.id)) AS percentage FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id;	european_football_2
SELECT (COUNT(CASE WHEN Admission = '+' THEN 1 END) * 100.0 / COUNT(CASE WHEN Admission = '-' THEN 1 END)) AS percentage FROM Patient WHERE SEX = 'M';	thrombosis_prediction
SELECT (SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND YEAR(Birthday) > 1930) * 100.0 / (SELECT COUNT(*) FROM Patient WHERE SEX = 'F') AS percentage FROM Patient LIMIT 1;	thrombosis_prediction
SELECT (COUNT(CASE WHEN `Admission` = '+' THEN 1 END) * 100.0 / COUNT(*)) AS Percentage FROM `Patient` WHERE `Birthday` BETWEEN '1930-01-01' AND '1940-12-31';	thrombosis_prediction
SELECT    SUM(CASE WHEN `Admission` = '-' THEN 1 ELSE 0 END) /    SUM(CASE WHEN `Admission` = '+' THEN 1 ELSE 0 END) AS ratio FROM `Patient` WHERE `Diagnosis` = 'SLE';	thrombosis_prediction
SELECT `Diagnosis` FROM `Patient` WHERE `ID` = 30609; SELECT `Date` FROM `Laboratory` WHERE `ID` = 30609;	thrombosis_prediction
SELECT `SEX`, `Birthday`, `Examination Date`, `Symptoms` FROM `Patient` JOIN `Examination` ON `Patient`.`ID` = `Examination`.`ID` WHERE `Patient`.`ID` = 163109;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.LDH > 500;	thrombosis_prediction
SELECT Patient.ID, YEAR(CURRENT_TIMESTAMP) - YEAR(Patient.Birthday) AS Age FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.RVVT = '+';	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Diagnosis FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.Thrombosis = 2;	thrombosis_prediction
SELECT DISTINCT Patient.* FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE YEAR(Patient.Birthday) = 1937 AND Laboratory.T_CHO >= 250;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Diagnosis FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.ALB < 3.5;	thrombosis_prediction
SELECT      (COUNT(DISTINCT CASE WHEN l.TP < 6.0 OR l.TP > 8.5 THEN p.ID END) * 100.0 / COUNT(p.ID)) AS percentage FROM      Patient p LEFT JOIN      Laboratory l ON p.ID = l.ID WHERE      p.SEX = 'F';	thrombosis_prediction
SELECT AVG(Examination.`aCL IgG`) FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Patient.Admission = '+' AND (YEAR(CURRENT_TIMESTAMP) - YEAR(Patient.Birthday)) >= 50;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND YEAR(Description) = 1997 AND Admission = '-';	thrombosis_prediction
SELECT MIN(YEAR(`First Date`) - YEAR(`Birthday`)) FROM Patient WHERE `First Date` IS NOT NULL;	thrombosis_prediction
SELECT COUNT(*) FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Patient.SEX = 'F' AND Examination.Thrombosis = 1 AND YEAR(`Examination Date`) = 1997;	thrombosis_prediction
SELECT MAX(YEAR(Birthday)) - MIN(YEAR(Birthday)) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.TG >= 200;	thrombosis_prediction
SELECT e.Symptoms, p.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Birthday = (SELECT MAX(Birthday) FROM Patient) AND e.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT COUNT(Laboratory.ID) / 12 AS average FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Laboratory.Date BETWEEN '1998-01-01' AND '1998-12-31'	thrombosis_prediction
SELECT (YEAR(p.First_Date) - YEAR(p.Birthday)) AS Age_At_Arrival, (SELECT MAX(l.Date) FROM Laboratory l WHERE l.ID = p.ID) AS Lab_Date FROM Patient p WHERE p.Diagnosis = 'SJS' ORDER BY p.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT (SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.UA <= 8.0) * 1.0 / (SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'F' AND l.UA <= 6.5) AS ratio;	thrombosis_prediction
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE YEAR(e."Examination Date") - YEAR(p."First Date") >= 1;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE YEAR(Examination.`Examination Date`) BETWEEN 1990 AND 1993 AND YEAR(Patient.Birthday) < 18;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Laboratory.`T-BIL` >= 2.0;	thrombosis_prediction
SELECT Diagnosis, COUNT(*) AS cnt FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.`Examination Date` BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY Diagnosis ORDER BY cnt DESC LIMIT 1;	thrombosis_prediction
SELECT AVG(1999 - YEAR(Patient.Birthday)) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.Date BETWEEN '1991-10-01' AND '1991-10-30';	thrombosis_prediction
SELECT      YEAR(`Examination`.`Examination Date`) - YEAR(`Patient`.`Birthday`) AS Age,     `Patient`.`Diagnosis` FROM      `Patient` JOIN      `Examination` ON `Patient`.`ID` = `Examination`.`ID` JOIN      `Laboratory` ON `Laboratory`.`Date` = `Examination`.`Examination Date` ORDER BY      `Laboratory`.`HGB` DESC LIMIT 1;	thrombosis_prediction
SELECT `ANA` FROM `Examination` WHERE `ID` = 3605340 AND `Examination Date` = '1996-12-02';	thrombosis_prediction
SELECT `T-CHO` < 250 AS NormalStatus FROM `Laboratory` WHERE `ID` = 2927464 AND `Date` = '1995-09-04';	thrombosis_prediction
SELECT SEX FROM Patient WHERE Diagnosis = 'AORTITIS' ORDER BY First_Date ASC LIMIT 1;	thrombosis_prediction
SELECT `aCL IgM` FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.Diagnosis = 'SLE' AND Patient.Description = '1994-02-19' AND `Examination Date` = '1993/11/12';	thrombosis_prediction
SELECT Patient.SEX FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.Date = '1992-06-12' AND Laboratory.GPT = 9;	thrombosis_prediction
SELECT YEAR('1991-10-21') - YEAR(Patient.Birthday) FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE Laboratory.UA = '8.4' AND Laboratory.Date = '1991-10-21';	thrombosis_prediction
SELECT COUNT(Laboratory.ID) FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE Patient.`First Date` = '1991-06-13' AND Patient.Diagnosis = 'SJS' AND Laboratory.Date BETWEEN '1995-01-01' AND '1995-12-31'	thrombosis_prediction
SELECT p.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Diagnosis = 'SLE' AND e.`Examination Date` = '1997-01-27';	thrombosis_prediction
SELECT `Examination`.`Symptoms` FROM `Patient` JOIN `Examination` ON `Patient`.`ID` = `Examination`.`ID` WHERE `Patient`.`Birthday` = '1959-03-01' AND `Examination`.`Examination Date` = '1993-09-27';	thrombosis_prediction
SELECT      (SUM(CASE WHEN L.Date LIKE '1981-11-%' THEN L.`T-CHO` ELSE 0 END) - SUM(CASE WHEN L.Date LIKE '1981-12-%' THEN L.`T-CHO` ELSE 0 END)) AS DecreaseRate FROM      Patient P JOIN      Laboratory L ON P.ID = L.ID WHERE      P.Birthday = '1959-02-18';	thrombosis_prediction
SELECT ID FROM Patient WHERE Diagnosis = 'Behcet' AND YEAR(Description) >= '1997-1-1' AND YEAR(Description) < '1998-1-1'	thrombosis_prediction
SELECT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.Date BETWEEN '1987-07-06' AND '1996-01-31' AND Laboratory.GPT > 30 AND Laboratory.ALB < 4 ORDER BY Patient.ID;	thrombosis_prediction
SELECT ID FROM Patient WHERE SEX = 'F' AND YEAR(Birthday) = 1964 AND Admission = '+';	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Examination WHERE Thrombosis = 2 AND `ANA Pattern` = 'S' AND `aCL IgM` > (SELECT 0.4 * AVG(`aCL IgM`) FROM Examination)	thrombosis_prediction
SELECT      (COUNT(DISTINCT CASE WHEN CAST(l.U_PRO AS REAL) BETWEEN 0 AND 30 THEN p.ID END) * 100.0 / COUNT(DISTINCT CASE WHEN CAST(l.U_PRO AS REAL) BETWEEN 0 AND 30 THEN p.ID END)) AS percentage FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE EXISTS (SELECT 1 FROM Laboratory l2 WHERE l2.ID = p.ID AND l2.UA <= 6.5) AND CAST(l.U_PRO AS REAL) BETWEEN 0 AND 30;	thrombosis_prediction
SELECT (COUNT(CASE WHEN Diagnosis = 'BEHCET' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM Patient WHERE SEX = 'M' AND YEAR(`First Date`) = '1981';	thrombosis_prediction
SELECT Patient.* FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Admission = '-' AND Laboratory.Date LIKE '1991-10%' AND Laboratory.T_BIL < 2.0;	thrombosis_prediction
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.`ANA Pattern` != 'P' AND p.SEX = 'F' AND p.Birthday IS NOT NULL AND p.Birthday BETWEEN '1980-01-01' AND '1989-12-31';	thrombosis_prediction
SELECT Patient.SEX FROM Patient JOIN Examination ON Patient.ID = Examination.ID JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Examination.Diagnosis = 'PSS' AND Laboratory.CRE = 1 AND Laboratory.LDH = 123 AND Laboratory.CRP > 2;	thrombosis_prediction
SELECT AVG(LAB.ALB) FROM Patient PAT JOIN Laboratory LAB ON PAT.ID = LAB.ID WHERE PAT.SEX = 'F' AND PAT.Diagnosis = 'SLE' AND LAB.PLT > 400;	thrombosis_prediction
SELECT MAX(Examination.Symptoms) FROM Examination INNER JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.Diagnosis = 'SLE';	thrombosis_prediction
SELECT `Description`, `Diagnosis` FROM `Patient` WHERE `ID` = 48473;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND Diagnosis = 'APS';	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE YEAR(Laboratory.Date) = 1997 AND (Laboratory.TP <= 6 OR Laboratory.TP >= 8.5);	thrombosis_prediction
SELECT (SUM(CASE WHEN Patient.Diagnosis LIKE '%SLE%' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS Proportion FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.Symptoms LIKE '%thrombocytopenia%';	thrombosis_prediction
SELECT    (SUM(CASE WHEN SEX = 'F' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS percentage FROM Patient WHERE YEAR(Birthday) = 1980 AND Diagnosis = 'RA';	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'M' AND p.Diagnosis = 'Behcet' AND p.Admission = '-' AND e.`Examination Date` BETWEEN '1995-01-01' AND '1997-12-31'	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'F' AND Laboratory.WBC < 3.5;	thrombosis_prediction
SELECT DATEDIFF(Examination.`Examination Date`, Patient.`First Date`) FROM `Patient` JOIN `Examination` ON `Patient`.`ID` = `Examination`.`ID` WHERE `Patient`.`ID` = 821298;	thrombosis_prediction
SELECT      CASE          WHEN (Patient.SEX = 'M' AND Laboratory.UA > 8.0) OR (Patient.SEX = 'F' AND Laboratory.UA > 6.5) THEN 'Yes'          ELSE 'No'      END AS NormalRange FROM      Patient JOIN      Laboratory ON Patient.ID = Laboratory.ID WHERE      Patient.ID = 57266;	thrombosis_prediction
SELECT `Date` FROM `Laboratory` WHERE `ID` = 48473 AND `GOT` >= 60;	thrombosis_prediction
SELECT Patient.SEX, Patient.Birthday FROM Patient WHERE Patient.ID IN (SELECT Laboratory.ID FROM Laboratory WHERE YEAR(Laboratory.Date) = 1994 AND Laboratory.GOT < 60)	thrombosis_prediction
SELECT DISTINCT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Laboratory.GPT >= 60;	thrombosis_prediction
SELECT Patient.Diagnosis FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.GPT > 60 ORDER BY Patient.Birthday ASC;	thrombosis_prediction
SELECT AVG(LDH) FROM Laboratory WHERE LDH < 500;	thrombosis_prediction
SELECT Patient.ID, YEAR(CURRENT_TIMESTAMP) - YEAR(Patient.Birthday) AS age FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.LDH BETWEEN 600 AND 800;	thrombosis_prediction
SELECT Patient.Admission FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.ALP < 300;	thrombosis_prediction
SELECT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Birthday = '1982-04-01' AND Laboratory.ALP < 300;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.TP < 6.0;	thrombosis_prediction
SELECT (L.TP - 8.5) AS Deviation FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'F' AND L.TP > 8.5;	thrombosis_prediction
SELECT p.* FROM Patient p WHERE p.SEX = 'M' AND EXISTS (SELECT 1 FROM Laboratory l WHERE l.ID = p.ID AND (l.ALB <= 3.5 OR l.ALB >= 5.5)) ORDER BY p.Birthday DESC;	thrombosis_prediction
SELECT Patient.ID, Patient.Birthday, Laboratory.ALB FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE YEAR(Patient.Birthday) = 1982 AND Laboratory.ALB BETWEEN 3.5 AND 5.5;	thrombosis_prediction
SELECT (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Patient WHERE SEX = 'F')) AS percentage FROM (     SELECT DISTINCT Patient.ID     FROM Patient     JOIN Laboratory ON Patient.ID = Laboratory.ID     WHERE Patient.SEX = 'F' AND Laboratory.UA > 6.5 ) AS female_patients;	thrombosis_prediction
SELECT AVG(L.UA) FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE L.Date = (SELECT MAX(Date) FROM Laboratory L2 WHERE L2.ID = L.ID) AND ((P.SEX = 'M' AND L.UA < 8.0) OR (P.SEX = 'F' AND L.UA < 6.5));	thrombosis_prediction
SELECT DISTINCT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.UN = 29;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Diagnosis = 'RA' AND Laboratory.UN < 30;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Laboratory.CRE >= 1.5;	thrombosis_prediction
SELECT      CASE          WHEN (SELECT COUNT(*) FROM Patient WHERE SEX = 'M' AND ID IN (SELECT DISTINCT ID FROM Laboratory WHERE CRE >= 1.5)) >               (SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND ID IN (SELECT DISTINCT ID FROM Laboratory WHERE CRE >= 1.5))          THEN 'True'          ELSE 'False'      END AS result;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.T_BIL = (SELECT MAX(T_BIL) FROM Laboratory);	thrombosis_prediction
SELECT Patient.SEX, GROUP_CONCAT(DISTINCT Laboratory.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.T_BIL >= 2.0 GROUP BY Patient.SEX;	thrombosis_prediction
SELECT p.ID, l.T_CHO FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.T_CHO = (SELECT MAX(T_CHO) FROM Laboratory) ORDER BY p.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT SUM(YEAR(NOW()) - YEAR(P.Birthday)) / COUNT(*) FROM Patient P WHERE P.SEX = 'M' AND EXISTS (SELECT 1 FROM Laboratory L WHERE L.ID = P.ID AND L.`T-CHO` >= 250)	thrombosis_prediction
SELECT Patient.ID, Patient.Diagnosis FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.TG > 300;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TG >= 200 AND (YEAR(CURRENT_DATE) - YEAR(p.Birthday)) > 50;	thrombosis_prediction
SELECT DISTINCT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Admission = '-' AND Laboratory.CPK < 250;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE YEAR(p.Birthday) BETWEEN 1936 AND 1956 AND p.SEX = 'M' AND l.CPK >= 250;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, YEAR(CURRENT_TIMESTAMP) - YEAR(Patient.Birthday) AS Age FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.GLU >= 180 AND Laboratory.`T-CHO` < 250;	thrombosis_prediction
SELECT Patient.ID, Laboratory.GLU FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE YEAR(Patient.Description) = 1991 AND Laboratory.GLU < 180;	thrombosis_prediction
SELECT DISTINCT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.WBC <= 3.5 OR Laboratory.WBC >= 9.0 ORDER BY Patient.SEX, TIMESTAMPDIFF(YEAR, Patient.Birthday, CURDATE());	thrombosis_prediction
SELECT p.ID, YEAR(CURRENT_TIMESTAMP) - YEAR(p.Birthday) AS Age, p.Diagnosis FROM Patient p WHERE EXISTS (     SELECT 1     FROM Laboratory l     WHERE l.ID = p.ID     AND l.RBC < 3.5 );	thrombosis_prediction
SELECT Patient.ID, Patient.Admission FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'F' AND (YEAR(CURRENT_TIMESTAMP) - YEAR(Patient.Birthday)) >= 50 AND (Laboratory.RBC <= 3.5 OR Laboratory.RBC >= 6.0);	thrombosis_prediction
SELECT Patient.ID, Patient.SEX FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Admission = '-' AND Laboratory.HGB < 10;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Diagnosis = 'SLE' AND Laboratory.HGB > 10 AND Laboratory.HGB < 17 ORDER BY Patient.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT p.ID, SUBTRACT(YEAR(CURRENT_TIMESTAMP), YEAR(p.Birthday)) AS age FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.HCT >= 52 GROUP BY p.ID HAVING COUNT(*) >= 2;	thrombosis_prediction
SELECT AVG(HCT) FROM Laboratory WHERE Date LIKE '1991%' AND HCT < 29;	thrombosis_prediction
SELECT (SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.PLT < 100) - (SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.PLT > 400) AS difference;	thrombosis_prediction
SELECT DISTINCT Patient.*  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE YEAR(Laboratory.Date) = 1984  AND Patient.Birthday IS NOT NULL  AND (YEAR(CURRENT_TIMESTAMP) - YEAR(Patient.Birthday)) < 50  AND Laboratory.PLT BETWEEN 100 AND 400;	thrombosis_prediction
SELECT    (SUM(CASE WHEN Laboratory.PT >= 14 AND Patient.SEX = 'F' THEN 1 ELSE 0 END) * 100.0 / SUM(CASE WHEN Laboratory.PT >= 14 THEN 1 ELSE 0 END)) AS percentage FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE (YEAR(CURDATE()) - YEAR(Patient.Birthday)) > 55;	thrombosis_prediction
SELECT Patient.* FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE YEAR(Patient.`First Date`) > 1992 AND Laboratory.PT < 14;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE `Examination Date` > '1997-01-01' AND APTT IS NOT NULL AND APTT >= 45;	thrombosis_prediction
SELECT COUNT(DISTINCT Examination.ID) FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.APTT > 45 AND Examination.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Laboratory.WBC > 3.5 AND Laboratory.WBC < 9.0 AND (Laboratory.FG <= 150 OR Laboratory.FG >= 450);	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Birthday > '1980-01-01' AND (Laboratory.FG < 150 OR Laboratory.FG > 450);	thrombosis_prediction
SELECT DISTINCT Patient.Diagnosis FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.`U-PRO` >= 30;	thrombosis_prediction
SELECT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Diagnosis = 'SLE' AND CAST(Laboratory.`U-PRO` AS REAL) > 0 AND CAST(Laboratory.`U-PRO` AS REAL) < 30;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.IGG >= 2000;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.IGG > 900 AND Laboratory.IGG < 2000 AND Patient.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT Patient.Diagnosis FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.IGA BETWEEN 80 AND 500 ORDER BY Laboratory.IGA DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE YEAR(Patient.`First Date`) >= 1990 AND Laboratory.IGA > 80 AND Laboratory.IGA < 500;	thrombosis_prediction
SELECT Diagnosis FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.IGM <= 40 OR Laboratory.IGM >= 400 GROUP BY Diagnosis ORDER BY COUNT(*) DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.CRP = '+' AND p.Description IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.CRE >= 1.5 AND YEAR(CURDATE()) - YEAR(p.Birthday) < 70;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Patient.RA IN ('-', '+-') AND Examination.KCT = '+';	thrombosis_prediction
SELECT DISTINCT Patient.Diagnosis FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE YEAR(Patient.Birthday) >= 1985 AND Laboratory.RA IN ('-', '+-');	thrombosis_prediction
SELECT DISTINCT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE CAST(Laboratory.RF AS UNSIGNED) < 20 AND (YEAR(CURDATE()) - YEAR(Patient.Birthday)) > 60;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Examination ON Patient.ID = Examination.ID JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Examination.Thrombosis = '0' AND CAST(Laboratory.RF AS INTEGER) < 20;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Examination ON Patient.ID = Examination.ID JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Examination.`ANA Pattern` = 'P' AND Laboratory.`C3` > 35;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID JOIN Examination e ON p.ID = e.ID WHERE l.HCT <= 29 OR l.HCT >= 52 GROUP BY p.ID ORDER BY MAX(e.aCL IgA) DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Examination ON Patient.ID = Examination.ID JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Examination.Thrombosis = 1 AND Laboratory.C4 > 10;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Admission = '+' AND Laboratory.RNP IN ('-', '+-');	thrombosis_prediction
SELECT MAX(P.Birthday) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.RNP NOT IN ('-', '+-');	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.SM IN ('-', '+-') AND Patient.Thrombosis = 0;	thrombosis_prediction
SELECT DISTINCT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.SM NOT IN ('negative', '0') ORDER BY Patient.Birthday DESC LIMIT 3;	thrombosis_prediction
SELECT DISTINCT ID FROM Examination WHERE `Examination Date` > '1997-01-01' AND `SC170` IN ('negative','0');	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.SC170 IN ('negative', '0') AND Patient.SEX = 'F' AND Examination.Symptoms IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.SSA IN ('-', '+-') AND YEAR(Patient.`First Date`) < 2000;	thrombosis_prediction
SELECT `ID` FROM `Patient` WHERE `ID` IN (SELECT DISTINCT `ID` FROM `Laboratory` WHERE `SSA` NOT IN ('negative', '0')) ORDER BY `First Date` ASC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Examination ON Patient.ID = Examination.ID JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Examination.Diagnosis = 'SLE' AND Laboratory.SSB IN ('-', '+-');	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p WHERE EXISTS (     SELECT 1     FROM Laboratory lab     WHERE lab.ID = p.ID     AND lab.SSB IN ('negative', '0') ) AND EXISTS (     SELECT 1     FROM Examination e     WHERE e.ID = p.ID     AND e.Symptoms IS NOT NULL );	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Laboratory.CENTROMEA IN ('-', '+-') AND Laboratory.SSB IN ('-', '+-');	thrombosis_prediction
SELECT DISTINCT p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.DNA >= 8;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Description IS NULL AND Laboratory.DNA IS NOT NULL AND CAST(Laboratory.DNA AS REAL) < 8;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.IGG > 900 AND Laboratory.IGG < 2000 AND Patient.Admission = '+';	thrombosis_prediction
SELECT    (COUNT(CASE WHEN Diagnosis = 'SLE' THEN 1 END) * 1.0 / COUNT(*)) AS percentage FROM (   SELECT DISTINCT p.ID, p.Diagnosis   FROM Patient p   JOIN Laboratory l ON p.ID = l.ID   WHERE l.GOT >= 60 ) AS patients;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Laboratory.GOT < 60;	thrombosis_prediction
SELECT MAX(P.Birthday) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GOT >= 60;	thrombosis_prediction
SELECT Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.GPT < 60 ORDER BY Laboratory.GPT DESC LIMIT 3;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Laboratory.GOT < 60;	thrombosis_prediction
SELECT MIN(`Patient`.`First Date`) FROM `Patient` JOIN `Laboratory` ON `Patient`.`ID` = `Laboratory`.`ID` WHERE `Laboratory`.`LDH` < 500 AND `Laboratory`.`LDH` = (SELECT MAX(`LDH`) FROM `Laboratory` WHERE `LDH` < 500);	thrombosis_prediction
SELECT MAX(Date) FROM Laboratory WHERE ID = (SELECT ID FROM Patient ORDER BY `First Date` DESC LIMIT 1) AND LDH >= 500;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.ALP >= 300 AND Patient.Admission = '+';	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Admission = '-' AND Laboratory.ALP < 300;	thrombosis_prediction
SELECT DISTINCT Patient.Diagnosis FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.TP < 6.0;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Diagnosis = 'SJS' AND Laboratory.TP > 6.0 AND Laboratory.TP < 8.5;	thrombosis_prediction
SELECT e.`Examination Date` FROM `Examination` e JOIN `Laboratory` l ON e.ID = l.ID WHERE l.ALB > 3.5 AND l.ALB < 5.5 AND l.ALB = (SELECT MAX(ALB) FROM `Laboratory` WHERE ALB > 3.5 AND ALB < 5.5) ORDER BY e.`Examination Date` DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Laboratory.ALB > 3.5 AND Laboratory.ALB < 5.5 AND Laboratory.TP BETWEEN 6.0 AND 8.5;	thrombosis_prediction
SELECT `aCL IgG`, `aCL IgM`, `aCL IgA` FROM `Examination` WHERE `ID` = (SELECT `Patient`.`ID` FROM `Patient` JOIN `Laboratory` ON `Patient`.`ID` = `Laboratory`.`ID` WHERE `Patient`.`SEX` = 'F' AND `Laboratory`.`UA` > 6.50 ORDER BY `Laboratory`.`UA` DESC LIMIT 1)	thrombosis_prediction
SELECT MAX(ANA) FROM Examination WHERE ID IN (SELECT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.CRE < 1.5);	thrombosis_prediction
SELECT DISTINCT `Examination`.ID FROM `Patient` JOIN `Examination` ON `Patient`.ID = `Examination`.ID JOIN `Laboratory` ON `Patient`.ID = `Laboratory`.ID WHERE `Laboratory`.`CRE` < 1.5 AND `Examination`.`aCL IgA` = (     SELECT MAX(`Examination2`.`aCL IgA`)     FROM `Examination` AS `Examination2`     JOIN `Patient` ON `Examination2`.ID = `Patient`.ID     JOIN `Laboratory` ON `Examination2`.ID = `Laboratory`.ID     WHERE `Laboratory`.`CRE` < 1.5 );	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID JOIN Examination ON Patient.ID = Examination.ID WHERE Laboratory.`T-BIL` >= 2.0 AND Examination.`ANA Pattern` LIKE '%P%';	thrombosis_prediction
SELECT Examination.ANA FROM Examination JOIN Laboratory ON Examination.ID = Laboratory.ID WHERE Laboratory.`T-BIL` = (SELECT MAX(`T-BIL`) FROM Laboratory WHERE `T-BIL` < 2.0);	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID JOIN Examination ON Patient.ID = Examination.ID WHERE Laboratory.T_CHO >= 250 AND Examination.KCT = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID JOIN Examination e ON p.ID = e.ID WHERE l.`T-CHO` < 250 AND e.`ANA Pattern` = 'P';	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID JOIN Examination ON Patient.ID = Examination.ID WHERE Laboratory.TG < 200 AND Examination.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT Diagnosis FROM Patient WHERE ID = (SELECT ID FROM Laboratory WHERE TG < 200 ORDER BY TG DESC LIMIT 1)	thrombosis_prediction
SELECT Patient.ID FROM Patient JOIN Examination ON Patient.ID = Examination.ID JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Examination.Thrombosis = 0 AND Laboratory.CPK < 250;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE EXISTS (SELECT 1 FROM Laboratory WHERE ID = Patient.ID AND CPK < 250) AND EXISTS (SELECT 1 FROM Examination WHERE ID = Patient.ID AND (KCT = '+' OR RVVT = '+' OR LAC = '+'));	thrombosis_prediction
SELECT MIN(P.Birthday) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GLU > 180;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID JOIN Examination ON Patient.ID = Examination.ID WHERE Laboratory.GLU < 180 AND Examination.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Admission = '+' AND Laboratory.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Diagnosis = 'SLE' AND Laboratory.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT DISTINCT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Admission = '-' AND Laboratory.RBC IS NOT NULL AND (Laboratory.RBC <= 3.5 OR Laboratory.RBC >= 6.0);	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.PLT > 100 AND Laboratory.PLT < 400 AND Patient.Diagnosis IS NOT NULL;	thrombosis_prediction
SELECT Laboratory.PLT FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Diagnosis = 'MCTD' AND Laboratory.PLT > 100 AND Laboratory.PLT < 400;	thrombosis_prediction
SELECT AVG(Lab.PT) FROM Patient AS P JOIN Laboratory AS Lab ON P.ID = Lab.ID WHERE P.SEX = 'M' AND Lab.PT < 14;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE EXISTS (SELECT 1 FROM Examination WHERE Examination.ID = Patient.ID AND Thrombosis IN (1, 2)) AND EXISTS (SELECT 1 FROM Laboratory WHERE Laboratory.ID = Patient.ID AND PT < 14);	thrombosis_prediction
SELECT major.major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Angela' AND member.last_name = 'Sanders';	student_club
SELECT COUNT(*) FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.college = 'College of Engineering';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major mj ON m.link_to_major = mj.major_id WHERE mj.department = 'Art and Design' AND m.position = 'Student Club Member';	student_club
SELECT COUNT(DISTINCT attendance.link_to_member) FROM event JOIN attendance ON event.event_id = attendance.link_to_event JOIN member ON attendance.link_to_member = member.member_id JOIN major ON member.link_to_major = major.major_id WHERE event.event_name = 'Women''s Soccer' AND major.major_name = 'Student_Club';	student_club
SELECT m.phone FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id JOIN major mj ON m.link_to_major = mj.major_id WHERE e.event_name = 'Women''s Soccer' AND mj.major_name = 'Student Club';	student_club
SELECT COUNT(*) FROM event JOIN attendance ON event.event_id = attendance.link_to_event JOIN member ON attendance.link_to_member = member.member_id JOIN major ON member.link_to_major = major.major_id WHERE event.event_name = 'Women''s Soccer' AND member.t_shirt_size = 'Medium' AND major.major_name = 'Student_Club';	student_club
SELECT e.event_name FROM attendance a JOIN member m ON a.link_to_member = m.member_id JOIN major mj ON m.link_to_major = mj.major_id JOIN event e ON a.link_to_event = e.event_id WHERE mj.major_name = 'Student Club' GROUP BY e.event_id, e.event_name ORDER BY COUNT(*) DESC LIMIT 1;	student_club
SELECT major.college FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'Vice President';	student_club
SELECT DISTINCT event.event_name FROM event JOIN attendance ON event.event_id = attendance.link_to_event JOIN member ON attendance.link_to_member = member.member_id WHERE member.first_name = 'Maya' AND member.last_name = 'Mclean';	student_club
SELECT COUNT(DISTINCT attendance.link_to_event) FROM attendance JOIN member ON attendance.link_to_member = member.member_id JOIN event ON attendance.link_to_event = event.event_id WHERE member.first_name = 'Sacha' AND member.last_name = 'Harrison' AND event.type = 'Student_Club' AND YEAR(event.event_date) = 2019;	student_club
SELECT COUNT(*) FROM (SELECT event_id FROM attendance GROUP BY event_id HAVING COUNT(*) > 10) AS attended_events JOIN event ON attended_events.event_id = event.event_id WHERE event.type = 'Meeting';	student_club
SELECT event_name FROM event WHERE event_id IN (SELECT link_to_event FROM attendance GROUP BY link_to_event HAVING COUNT(*) > 20) AND type != 'fundraiser'	student_club
SELECT COUNT(event_id) / COUNT(DISTINCT event_name) AS average_attendance FROM event WHERE type = 'Meeting' AND YEAR(event_date) = 2020;	student_club
SELECT expense_description FROM expense ORDER BY cost DESC LIMIT 1;	student_club
SELECT COUNT(*) FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Environmental Engineering';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Laugh Out Loud';	student_club
SELECT last_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Law and Constitutional Studies';	student_club
SELECT zip_code.county FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.first_name = 'Sherri' AND member.last_name = 'Ramsey';	student_club
SELECT major.college FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Tyler' AND member.last_name = 'Hewitt';	student_club
SELECT SUM(income.amount) FROM income JOIN member ON income.link_to_member = member.member_id WHERE member.position = 'Vice President';	student_club
SELECT SUM(b.spent) FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'September Meeting' AND b.category = 'Food';	student_club
SELECT zip_code.city, zip_code.state FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.position = 'President';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN zip_code z ON m.zip = z.zip_code JOIN major mj ON m.link_to_major = mj.major_id WHERE mj.major_name = 'Student_Club' AND z.state = 'Illinois';	student_club
SELECT SUM(expense.cost)  FROM expense  JOIN budget ON expense.link_to_budget = budget.budget_id  JOIN event ON budget.link_to_event = event.event_id  JOIN member ON expense.link_to_member = member.member_id  JOIN major ON member.link_to_major = major.major_id  WHERE event.event_name = 'September Meeting'  AND expense.category = 'Advertisement'  AND major.major_name = 'Student_Club';	student_club
SELECT department FROM major WHERE major_id IN (SELECT link_to_major FROM member WHERE first_name = 'Pierce') AND major_id IN (SELECT link_to_major FROM member WHERE first_name = 'Guidi')	student_club
SELECT SUM(b.amount) FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'October Speaker';	student_club
SELECT e.approved FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.event_name = 'October Meeting' AND ev.event_date = '2019-10-08';	student_club
SELECT AVG(cost) FROM expense JOIN member ON expense.link_to_member = member.member_id WHERE member.first_name = 'Elijah' AND member.last_name = 'Allen' AND SUBSTRING(expense_date, 5, 2) IN ('09', '10');	student_club
SELECT (SUM(CASE WHEN SUBSTRING(event_date, 1, 4) = '2019' THEN budget.spent ELSE 0 END) - SUM(CASE WHEN SUBSTRING(event_date, 1, 4) = '2020' THEN budget.spent ELSE 0 END)) AS difference FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE event.type = 'Student_Club';	student_club
SELECT location FROM event WHERE event_name = 'Spring Budget Review';	student_club
SELECT SUM(expense.cost) FROM expense JOIN budget ON expense.link_to_budget = budget.budget_id JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'Posters' AND event.event_date = '2019-09-04';	student_club
SELECT remaining FROM budget WHERE category = 'Food' AND amount = (SELECT MAX(amount) FROM budget WHERE category = 'Food');	student_club
SELECT notes FROM income WHERE source = 'Fundraising' AND date_received = '2019-09-14';	student_club
SELECT COUNT(*) FROM major WHERE college = 'College of Humanities and Social Sciences';	student_club
SELECT phone FROM member WHERE first_name = 'Carlo' AND last_name = 'Jacobs';	student_club
SELECT zip_code.county FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.first_name = 'Adela' AND member.last_name = 'O''Gallagher';	student_club
SELECT COUNT(*) FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'November Meeting' AND budget.remaining < 0;	student_club
SELECT SUM(b.amount) FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.event_name = 'September Speaker';	student_club
SELECT event.status FROM expense JOIN budget ON expense.link_to_budget = budget.budget_id JOIN event ON budget.link_to_event = event.event_id WHERE expense.expense_description = 'Post Cards, Posters' AND expense.expense_date = '2019-8-20';	student_club
SELECT major.major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Brent' AND member.last_name = 'Thomason';	student_club
SELECT COUNT(*) FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Business' AND member.t_shirt_size = 'Medium';	student_club
SELECT zip_code.type FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.first_name = 'Christof' AND member.last_name = 'Nielson';	student_club
SELECT major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'Vice President';	student_club
SELECT zip_code.state FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.first_name = 'Sacha' AND member.last_name = 'Harrison';	student_club
SELECT maj.department FROM member m JOIN major maj ON m.link_to_major = maj.major_id WHERE m.position = 'President';	student_club
SELECT income.date_received FROM income JOIN member ON income.link_to_member = member.member_id WHERE member.first_name = 'Connor' AND member.last_name = 'Hilton' AND income.source = 'Dues';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.source = 'Dues' ORDER BY i.date_received ASC LIMIT 1;	student_club
SELECT      (SELECT SUM(amount) FROM budget       JOIN event ON budget.link_to_event = event.event_id       WHERE event.event_name = 'Yearly Kickoff' AND budget.category = 'Advertisement')      /     (SELECT SUM(amount) FROM budget       JOIN event ON budget.link_to_event = event.event_id       WHERE event.event_name = 'October Meeting' AND budget.category = 'Advertisement') AS ratio;	student_club
SELECT    (SUM(CASE WHEN category = 'Parking' THEN amount ELSE 0 END) / SUM(amount)) * 100 AS percentage FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'November Speaker';	student_club
SELECT SUM(cost) FROM expense WHERE expense_description = 'Pizza';	student_club
SELECT COUNT(DISTINCT city) FROM zip_code WHERE county = 'Orange County' AND state = 'Virginia';	student_club
SELECT DISTINCT department FROM major WHERE college = 'College of Humanities and Social Sciences';	student_club
SELECT zip_code.city, zip_code.county, zip_code.state FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.first_name = 'Amy' AND member.last_name = 'Firth';	student_club
SELECT expense.expense_description FROM expense JOIN budget ON expense.link_to_budget = budget.budget_id WHERE budget.remaining = (SELECT MIN(remaining) FROM budget);	student_club
SELECT member.first_name, member.last_name FROM member JOIN attendance ON member.member_id = attendance.link_to_member JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'October Meeting';	student_club
SELECT maj.college FROM member JOIN major ON member.link_to_major = major.major_id GROUP BY maj.college ORDER BY COUNT(*) DESC LIMIT 1;	student_club
SELECT major.major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.phone = '809-555-3360';	student_club
SELECT event_name FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE budget.amount = (SELECT MAX(amount) FROM budget);	student_club
SELECT expense.expense_description FROM expense INNER JOIN member ON expense.link_to_member = member.member_id WHERE member.position = 'Vice President';	student_club
SELECT COUNT(*) FROM attendance WHERE link_to_event = (SELECT event_id FROM event WHERE event_name = 'Women''s Soccer');	student_club
SELECT income.date_received FROM income JOIN member ON income.link_to_member = member.member_id WHERE member.first_name = 'Casey' AND member.last_name = 'Mason';	student_club
SELECT COUNT(*) FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE zip_code.state = 'Maryland';	student_club
SELECT COUNT(*) FROM attendance WHERE link_to_member = (SELECT member_id FROM member WHERE phone = '954-555-6240');	student_club
SELECT member.first_name, member.last_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.status = 'Closed' ORDER BY (b.spent / b.amount) DESC LIMIT 1;	student_club
SELECT COUNT(*) FROM member WHERE position = 'President';	student_club
SELECT MAX(spent) FROM budget;	student_club
SELECT COUNT(*) FROM event WHERE type = 'Meeting' AND YEAR(event_date) = 2020;	student_club
SELECT SUM(spent) FROM budget WHERE category = 'Food';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member GROUP BY m.member_id HAVING COUNT(a.link_to_event) > 7;	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major mj ON m.link_to_major = mj.major_id JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE mj.major_name = 'Interior Design' AND e.event_name = 'Community Theater';	student_club
SELECT member.first_name, member.last_name FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE zip_code.city = 'Georgetown' AND zip_code.state = 'South Carolina';	student_club
SELECT SUM(income.amount) FROM income JOIN member ON income.link_to_member = member.member_id WHERE member.first_name = 'Grant' AND member.last_name = 'Gilmour';	student_club
SELECT DISTINCT m.first_name, m.last_name FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.amount > 40;	student_club
SELECT SUM(expense.cost) FROM event JOIN budget ON event.event_id = budget.link_to_event JOIN expense ON budget.budget_id = expense.link_to_budget WHERE event.event_name = 'Yearly Kickoff';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Yearly Kickoff' GROUP BY m.member_id;	student_club
SELECT m.first_name, m.last_name, i.source FROM income i JOIN member m ON i.link_to_member = m.member_id ORDER BY i.amount DESC LIMIT 1;	student_club
SELECT event_name FROM event JOIN budget ON event.event_id = budget.link_to_event JOIN expense ON budget.budget_id = expense.link_to_budget GROUP BY event.event_id ORDER BY SUM(expense.cost) ASC LIMIT 1;	student_club
SELECT    (SUM(CASE WHEN ev.event_name = 'Yearly Kickoff' THEN e.cost ELSE 0 END) * 100.0 / SUM(e.cost)) AS percentage FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id;	student_club
SELECT SUM(major_name = 'Finance') / SUM(major_name = 'Physics') FROM member JOIN major ON member.link_to_major = major.major_id;	student_club
SELECT source FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' GROUP BY source ORDER BY SUM(amount) DESC LIMIT 1;	student_club
SELECT first_name, last_name, email FROM member WHERE position = 'Secretary';	student_club
SELECT COUNT(*) FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Physics Teaching';	student_club
SELECT COUNT(*) FROM attendance JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'Community Theater' AND YEAR(event.event_date) = 2019;	student_club
SELECT COUNT(*) AS event_count, mj.major_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN major mj ON m.link_to_major = mj.major_id WHERE m.first_name = 'Luisa' AND m.last_name = 'Guidi';	student_club
SELECT SUM(spent) / COUNT(spent) FROM budget WHERE category = 'Food' AND event_status = 'Closed'	student_club
SELECT event_name FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE category = 'Advertisement' ORDER BY spent DESC LIMIT 1;	student_club
SELECT 1 FROM member JOIN attendance ON member.member_id = attendance.link_to_member JOIN event ON attendance.link_to_event = event.event_id WHERE member.first_name = 'Maya' AND member.last_name = 'Mclean' AND event.event_name = 'Women''s Soccer'	student_club
SELECT (SUM(CASE WHEN type = 'Community Service' THEN 1 ELSE 0 END) / COUNT(event_id)) * 100 FROM event WHERE event_date BETWEEN '2019-01-01' AND '2019-12-31'	student_club
SELECT SUM(expense.cost) FROM event JOIN budget ON event.event_id = budget.link_to_event JOIN expense ON budget.budget_id = expense.link_to_budget WHERE event.event_name = 'September Speaker' AND expense.expense_description = 'Posters';	student_club
SELECT t_shirt_size FROM member GROUP BY t_shirt_size ORDER BY COUNT(*) DESC LIMIT 1;	student_club
SELECT event_name FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE event.status = 'Closed' AND budget.remaining < 0 ORDER BY budget.remaining ASC LIMIT 1;	student_club
SELECT expense.expense_description, SUM(expense.cost) AS total_value FROM expense JOIN budget ON expense.link_to_budget = budget.budget_id JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'October Meeting' AND expense.approved = 'Yes' GROUP BY expense.expense_description;	student_club
SELECT SUM(b.amount) AS total_budgeted FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.event_name = 'April Speaker'; SELECT b.category, SUM(b.amount) AS budgeted_amount FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.event_name = 'April Speaker' GROUP BY b.category ORDER BY budgeted_amount ASC;	student_club
SELECT MAX(amount) FROM budget WHERE category = 'Food'	student_club
SELECT * FROM budget WHERE category = 'Advertising' ORDER BY amount DESC LIMIT 3;	student_club
SELECT SUM(cost) FROM expense WHERE expense_description = 'Parking';	student_club
SELECT SUM(cost) FROM expense WHERE expense_date = '2019-08-20';	student_club
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_cost FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE m.member_id = 'rec4BLdZHS2Blfp4v' GROUP BY m.member_id;	student_club
SELECT expense.expense_description FROM expense JOIN member ON expense.link_to_member = member.member_id WHERE member.first_name = 'Sacha' AND member.last_name = 'Harrison';	student_club
SELECT DISTINCT expense.expense_description FROM member JOIN expense ON member.member_id = expense.link_to_member WHERE member.t_shirt_size = 'X-Large';	student_club
SELECT m.zip FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost < 50;	student_club
SELECT major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE first_name = 'Phillip' AND last_name = 'Cullen';	student_club
SELECT member.position FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Business';	student_club
SELECT COUNT(*) FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Business' AND member.t_shirt_size = 'Medium';	student_club
SELECT DISTINCT event.type FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE budget.remaining > 30;	student_club
SELECT DISTINCT type FROM event WHERE location = 'MU 215';	student_club
SELECT `type` FROM `event` WHERE `event_date` = '2020-03-24T12:00:00';	student_club
SELECT major_name FROM major WHERE major_id IN (SELECT link_to_major FROM member WHERE position = 'Vice President');	student_club
SELECT (SUM(CASE WHEN m.position = 'Member' AND mj.major_name = 'Business' THEN 1 ELSE 0 END) * 100.0 / COUNT(m.member_id)) AS percentage FROM member m LEFT JOIN major mj ON m.link_to_major = mj.major_id;	student_club
SELECT DISTINCT type FROM event WHERE location = 'MU 215';	student_club
SELECT COUNT(*) FROM income WHERE amount = 50;	student_club
SELECT COUNT(*) FROM member WHERE position = 'Member' AND t_shirt_size = 'X-Large';	student_club
SELECT COUNT(*) FROM major WHERE department = 'School of Applied Sciences, Technology and Education' AND college = 'College of Agriculture and Applied Sciences';	student_club
SELECT member.last_name, major.department, major.college FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Environmental Engineering';	student_club
SELECT budget.category FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE event.location = 'MU 215' AND event.type = 'Guest Speaker' AND budget.spent = 0;	student_club
SELECT zip_code.city, zip_code.state FROM member JOIN major ON member.link_to_major = major.major_id JOIN zip_code ON member.zip = zip_code.zip_code WHERE major.department = 'Electrical and Computer Engineering' AND member.position = 'Member';	student_club
SELECT event.event_name FROM event JOIN attendance ON event.event_id = attendance.link_to_event JOIN member ON attendance.link_to_member = member.member_id JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'Vice President' AND major.major_name = 'Student_Club' AND event.type = 'Social' AND event.location = '900 E. Washington St.';	student_club
SELECT member.last_name, member.position FROM member JOIN expense ON member.member_id = expense.link_to_member WHERE expense.expense_description = 'Pizza' AND expense.expense_date = '2019-09-10';	student_club
SELECT member.last_name FROM attendance JOIN event ON attendance.link_to_event = event.event_id JOIN member ON attendance.link_to_member = member.member_id WHERE event.event_name = 'Women''s Soccer' AND member.position = 'Member';	student_club
SELECT    (COUNT(CASE WHEN income.amount = 50 THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM member JOIN income ON member.member_id = income.link_to_member WHERE member.t_shirt_size = 'Medium' AND member.position = 'Member';	student_club
SELECT DISTINCT state FROM zip_code WHERE type = 'PO Box';	student_club
SELECT zip_code FROM zip_code WHERE type = 'PO Box' AND county = 'San Juan Municipio' AND state = 'Puerto Rico';	student_club
SELECT event_name FROM event WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20';	student_club
SELECT DISTINCT attendance.link_to_event FROM attendance JOIN member ON attendance.link_to_member = member.member_id JOIN expense ON member.member_id = expense.link_to_member WHERE expense.cost > 50;	student_club
SELECT member.member_id, member.first_name, member.last_name, attendance.link_to_event FROM expense JOIN member ON expense.link_to_member = member.member_id JOIN attendance ON expense.link_to_member = attendance.link_to_member WHERE expense.approved = 'true' AND expense.expense_date BETWEEN '2019-01-10' AND '2019-11-19';	student_club
SELECT major.college FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Katy' AND member.link_to_major = 'rec1N0upiVLy5esTO';	student_club
SELECT member.phone FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Business' AND major.college = 'College of Agriculture and Applied Sciences';	student_club
SELECT member.email FROM expense JOIN member ON expense.link_to_member = member.member_id WHERE expense.expense_date BETWEEN '2019-09-10' AND '2019-11-19' AND expense.cost > 20;	student_club
SELECT COUNT(*) FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'education' AND major.college = 'College of Education & Human Services';	student_club
SELECT (SUM(CASE WHEN remaining < 0 THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM budget;	student_club
SELECT event_id, location, status FROM event WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31';	student_club
SELECT * FROM expense WHERE cost > (SELECT SUM(cost)/COUNT(*) FROM expense);	student_club
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large';	student_club
SELECT (SUM(type = 'PO Box') * 100.0 / COUNT(zip_code)) AS percentage FROM zip_code;	student_club
SELECT event.event_name, event.location FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE budget.remaining > 0;	student_club
SELECT event.event_name, event.event_date FROM event JOIN expense ON event.event_id = expense.link_to_event WHERE expense.expense_description = 'Pizza' AND expense.cost > 50 AND expense.cost < 100;	student_club
SELECT m.first_name, m.last_name, maj.major_name FROM expense e JOIN member m ON e.link_to_member = m.member_id JOIN major maj ON m.link_to_major = maj.major_id WHERE e.cost > 100;	student_club
SELECT zip_code.city, zip_code.state FROM event JOIN attendance ON event.event_id = attendance.link_to_event JOIN member ON attendance.link_to_member = member.member_id JOIN zip_code ON member.zip = zip_code.zip_code GROUP BY event.event_id HAVING COUNT(*) > 40;	student_club
SELECT m.member_id, m.first_name, m.last_name, SUM(e.cost) AS total_cost FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN member m ON e.link_to_member = m.member_id GROUP BY m.member_id HAVING COUNT(DISTINCT b.link_to_event) > 1 ORDER BY total_cost DESC LIMIT 1;	student_club
SELECT SUM(expense.cost) / COUNT(event.event_id) FROM expense JOIN member ON expense.link_to_member = member.member_id JOIN budget ON expense.link_to_budget = budget.budget_id JOIN event ON budget.link_to_event = event.event_id WHERE member.position != 'Member';	student_club
SELECT event.event_name FROM event JOIN budget ON event.event_id = budget.link_to_event JOIN expense ON budget.budget_id = expense.link_to_budget WHERE expense.category = 'Parking' GROUP BY event.event_id HAVING SUM(expense.cost) < (     SELECT SUM(e.cost) / COUNT(DISTINCT b.link_to_event)     FROM expense e     JOIN budget b ON e.link_to_budget = b.budget_id     WHERE e.category = 'Parking' );	student_club
SELECT (SUM(expense.cost) / COUNT(event.event_id)) * 100 AS percentage FROM expense JOIN event ON expense.link_to_event = event.event_id WHERE event.type = 'Meeting';	student_club
SELECT link_to_budget FROM expense WHERE expense_description = 'Water, chips, cookies' ORDER BY cost DESC LIMIT 1;	student_club
SELECT m.first_name, m.last_name, MAX(e.cost) AS total_spent FROM member m JOIN expense e ON m.member_id = e.link_to_member GROUP BY m.member_id ORDER BY total_spent DESC LIMIT 5;	student_club
SELECT m.first_name, m.last_name, m.phone FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost > (SELECT AVG(cost) FROM expense);	student_club
SELECT    (SUM(CASE WHEN zip_code.state = 'New Jersey' THEN 1 ELSE 0 END) * 1.0 / COUNT(*) -     SUM(CASE WHEN zip_code.state = 'Vermont' THEN 1 ELSE 0 END) * 1.0 / COUNT(*)) AS difference FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.position = 'Member';	student_club
SELECT major.major_name, major.department FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Garrett' AND member.last_name = 'Gerke';	student_club
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_cost FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE e.expense_description = 'Water, Veggie tray, supplies' GROUP BY m.member_id;	student_club
SELECT member.last_name, member.phone FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Elementary Education';	student_club
SELECT b.category, b.amount FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.event_name = 'January Speaker';	student_club
SELECT DISTINCT event.event_name FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE budget.category = 'Food';	student_club
SELECT m.first_name, m.last_name, i.amount FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.date_received = '9/9/2019';	student_club
SELECT budget.category FROM expense JOIN budget ON expense.link_to_budget = budget.budget_id WHERE expense.expense_description = 'Posters';	student_club
SELECT first_name, last_name, college FROM member JOIN major ON member.link_to_major = major.major_id WHERE position = 'Secretary';	student_club
SELECT e.event_name, SUM(b.spent) AS total_spent FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE b.category = 'Speaker Gifts' GROUP BY e.event_id, e.event_name;	student_club
SELECT zip_code.city FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.first_name = 'Garrett' AND member.last_name = 'Gerke';	student_club
SELECT first_name, last_name, position FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE city = 'Lincolnton' AND state = 'North Carolina' AND zip = 28092;	student_club
SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Premium';	debit_card_specializing
SELECT COUNT(CASE WHEN Currency = 'EUR' THEN 1 END) / COUNT(CASE WHEN Currency = 'CZK' THEN 1 END) FROM customers;	debit_card_specializing
SELECT c.CustomerID FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'LAM' AND y.Date BETWEEN '201201' AND '201212' GROUP BY c.CustomerID ORDER BY SUM(y.Consumption) ASC LIMIT 1;	debit_card_specializing
SELECT AVG(Consumption) / 12 AS AverageMonthlyConsumption FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE customers.Segment = 'SME' AND yearmonth.Date BETWEEN '201301' AND '201312';	debit_card_specializing
SELECT c.CustomerID, SUM(y.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Currency = 'CZK' AND y.Date BETWEEN '201101' AND '201112' GROUP BY c.CustomerID ORDER BY TotalConsumption DESC;	debit_card_specializing
SELECT COUNT(*) FROM customers JOIN yearmonth ON customers.CustomerID = yearmonth.CustomerID WHERE customers.Segment = 'KAM' AND yearmonth.Date BETWEEN '201201' AND '201212' AND yearmonth.Consumption < 30000;	debit_card_specializing
SELECT      SUM(CASE WHEN c.Currency = 'CZK' THEN ym.Consumption ELSE 0 END) -      SUM(CASE WHEN c.Currency = 'EUR' THEN ym.Consumption ELSE 0 END) AS Difference FROM      yearmonth ym JOIN      customers c ON ym.CustomerID = c.CustomerID WHERE      ym.Date BETWEEN '201201' AND '201212';	debit_card_specializing
SELECT strftime('%Y', Date) AS Year FROM transactions_1k JOIN customers ON transactions_1k.CustomerID = customers.CustomerID WHERE customers.Currency = 'EUR' GROUP BY Year ORDER BY SUM(Amount * Price) DESC LIMIT 1;	debit_card_specializing
SELECT c.Segment, SUM(y.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment IS NOT NULL GROUP BY c.Segment ORDER BY TotalConsumption ASC LIMIT 1;	debit_card_specializing
SELECT SUBSTR(Date, 1, 4) AS Year, SUM(Consumption) AS Total FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE customers.Currency = 'CZK' GROUP BY Year ORDER BY Total DESC LIMIT 1;	debit_card_specializing
SELECT SUBSTR(Date, 5, 2) AS Month, SUM(Consumption) AS TotalConsumption FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE customers.Segment = 'SME' AND Date BETWEEN '201301' AND '201312' GROUP BY Month ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT      (sme.annual_average - lam.annual_average) AS SME_LAM,     (lam.annual_average - kam.annual_average) AS LAM_KAM,     (kam.annual_average - sme.annual_average) AS KAM_SME FROM      (SELECT          total_segment_consumption / count_min_customers AS annual_average       FROM          (SELECT              c.Segment,             SUM(t.total_consumption_2013) AS total_segment_consumption,             MIN(t.total_consumption_2013) AS min_consumption,             COUNT(*) AS count_min_customers          FROM              customers c          JOIN              (SELECT                  CustomerID,                 SUM(Consumption) AS total_consumption_2013              FROM                  yearmonth              WHERE                  Date BETWEEN '201301' AND '201312'              GROUP BY                  CustomerID) t          ON              c.CustomerID = t.CustomerID          GROUP BY              c.Segment) seg      WHERE          seg.Segment = 'SME') sme,     (SELECT          total_segment_consumption / count_min_customers AS annual_average       FROM          (SELECT              c.Segment,             SUM(t.total_consumption_2013) AS total_segment_consumption,             MIN(t.total_consumption_2013) AS min_consumption,             COUNT(*) AS count_min_customers          FROM              customers c          JOIN              (SELECT                  CustomerID,                 SUM(Consumption) AS total_consumption_2013              FROM                  yearmonth              WHERE                  Date BETWEEN '201301' AND '201312'              GROUP BY                  CustomerID) t          ON              c.CustomerID = t.CustomerID          GROUP BY              c.Segment) seg      WHERE          seg.Segment = 'LAM') lam,     (SELECT          total_segment_consumption / count_min_customers AS annual_average       FROM          (SELECT              c.Segment,             SUM(t.total_consumption_2013) AS total_segment_consumption,             MIN(t.total_consumption_2013) AS min_consumption,             COUNT(*) AS count_min_customers          FROM              customers c          JOIN              (SELECT                  CustomerID,                 SUM(Consumption) AS total_consumption_2013              FROM                  yearmonth              WHERE                  Date BETWEEN '201301' AND '201312'              GROUP BY                  CustomerID) t          ON              c.CustomerID = t.CustomerID          GROUP BY              c.Segment) seg      WHERE          seg.Segment = 'KAM') kam;	debit_card_specializing
SELECT      Segment,     (Total2013 - Total2012) AS Increase,     ( (Total2013 - Total2012) / Total2013 ) * 100 AS PercentageIncrease FROM (     SELECT          Segment,         SUM(Total2012) AS Total2012,         SUM(Total2013) AS Total2013     FROM (         SELECT              CustomerID,             Segment,             SUM(CASE WHEN SUBSTRING(Date, 1, 4) = '2012' THEN Consumption ELSE 0 END) AS Total2012,             SUM(CASE WHEN SUBSTRING(Date, 1, 4) = '2013' THEN Consumption ELSE 0 END) AS Total2013         FROM yearmonth         JOIN customers ON yearmonth.CustomerID = customers.CustomerID         WHERE customers.Currency = 'EUR'         GROUP BY CustomerID, Segment     ) AS sub     GROUP BY Segment ) AS totals ORDER BY PercentageIncrease DESC LIMIT 1;  SELECT      Segment,     (Total2013 - Total2012) AS Increase,     ( (Total2013 - Total2012) / Total2013 ) * 100 AS PercentageIncrease FROM (     SELECT          Segment,         SUM(Total2012) AS Total2012,         SUM(Total2013) AS Total2013     FROM (         SELECT              CustomerID,             Segment,             SUM(CASE WHEN SUBSTRING(Date, 1, 4) = '2012' THEN Consumption ELSE 0 END) AS Total2012,             SUM(CASE WHEN SUBSTRING(Date, 1, 4) = '2013' THEN Consumption ELSE 0 END) AS Total2013         FROM yearmonth         JOIN customers ON yearmonth.CustomerID = customers.CustomerID         WHERE customers.Currency = 'EUR'         GROUP BY CustomerID, Segment     ) AS sub     GROUP BY Segment ) AS totals ORDER BY PercentageIncrease ASC LIMIT 1;	debit_card_specializing
SELECT SUM(Consumption) FROM yearmonth WHERE CustomerID = 6 AND Date BETWEEN '201308' AND '201311';	debit_card_specializing
SELECT (SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Value for money') - (SELECT COUNT(*) FROM gasstations WHERE Country = 'SVK' AND Segment = 'Value for money')	debit_card_specializing
SELECT (SELECT Consumption FROM yearmonth WHERE CustomerID = 7 AND Date = '201304') - (SELECT Consumption FROM yearmonth WHERE CustomerID = 5 AND Date = '201304') AS Difference;	debit_card_specializing
SELECT (SELECT COUNT(*) FROM customers WHERE Segment = 'SME' AND Currency = 'CZK') - (SELECT COUNT(*) FROM customers WHERE Segment = 'SME' AND Currency = 'EUR') AS difference;	debit_card_specializing
SELECT customers.CustomerID FROM customers JOIN yearmonth ON customers.CustomerID = yearmonth.CustomerID WHERE customers.Segment = 'LAM' AND customers.Currency = 'EUR' AND yearmonth.Date = '201310' ORDER BY yearmonth.Consumption DESC LIMIT 1;	debit_card_specializing
SELECT c.CustomerID, SUM(y.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'LAM' GROUP BY c.CustomerID ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT SUM(Consumption) FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE customers.Segment = 'KAM' AND yearmonth.Date = '201305';	debit_card_specializing
SELECT (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM customers WHERE Segment = 'LAM')) AS percentage FROM (SELECT CustomerID FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'LAM') GROUP BY CustomerID HAVING SUM(Consumption) > 46.73) AS subquery;	debit_card_specializing
SELECT Country, COUNT(*) AS total FROM gasstations WHERE Segment = 'Value for money' GROUP BY Country;	debit_card_specializing
SELECT (COUNT(CASE WHEN c.Currency = 'EUR' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM customers c WHERE c.Segment = 'KAM';	debit_card_specializing
SELECT    (COUNT(CASE WHEN Consumption > 528.3 THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM yearmonth WHERE Date = '201202';	debit_card_specializing
SELECT (COUNT(CASE WHEN Segment = 'Premium' THEN 1 END) * 100.0 / COUNT(*)) AS Percentage FROM gasstations WHERE Country = 'SVK';	debit_card_specializing
SELECT CustomerID FROM yearmonth WHERE Date = '201309' GROUP BY CustomerID ORDER BY SUM(Consumption) DESC LIMIT 1;	debit_card_specializing
SELECT c.Segment, SUM(y.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE y.Date = '201309' GROUP BY c.Segment ORDER BY TotalConsumption ASC LIMIT 1;	debit_card_specializing
SELECT customers.CustomerID FROM customers JOIN yearmonth ON customers.CustomerID = yearmonth.CustomerID WHERE customers.Segment = 'SME' AND yearmonth.Date = '201206' ORDER BY yearmonth.Consumption ASC LIMIT 1;	debit_card_specializing
SELECT MAX(total) FROM (SELECT SUM(Consumption) AS total FROM yearmonth WHERE Date LIKE '2012%' GROUP BY Date)	debit_card_specializing
SELECT MAX(yearmonth.Consumption) FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE customers.Currency = 'EUR';	debit_card_specializing
SELECT p.Description FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID JOIN yearmonth y ON t.CustomerID = y.CustomerID WHERE y.Date = '201309';	debit_card_specializing
SELECT DISTINCT g.Country  FROM transactions_1k t  JOIN gasstations g ON t.GasStationID = g.GasStationID  WHERE t.Date BETWEEN '2013-06-01' AND '2013-06-30';	debit_card_specializing
SELECT DISTINCT g.ChainID FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR';	debit_card_specializing
SELECT p.Description FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID JOIN products p ON t.ProductID = p.ProductID WHERE c.Currency = 'EUR';	debit_card_specializing
SELECT AVG(Price) FROM transactions_1k WHERE Date LIKE '2012-01%';	debit_card_specializing
SELECT COUNT(DISTINCT c.CustomerID) FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Currency = 'EUR' AND y.Consumption > 1000;	debit_card_specializing
SELECT products.Description FROM products JOIN transactions_1k ON products.ProductID = transactions_1k.ProductID JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE gasstations.Country = 'CZE';	debit_card_specializing
SELECT DISTINCT Time FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE gasstations.ChainID = 11;	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE gasstations.Country = 'CZE' AND transactions_1k.Price > 1000;	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k INNER JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE gasstations.Country = 'CZE' AND transactions_1k.Date > '2012-01-01';	debit_card_specializing
SELECT AVG(Amount * Price) FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE gasstations.Country = 'CZE';	debit_card_specializing
SELECT AVG(t.Price) FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR';	debit_card_specializing
SELECT CustomerID FROM transactions_1k WHERE Date = '2012-08-25' GROUP BY CustomerID ORDER BY SUM(Amount * Price) DESC LIMIT 1;	debit_card_specializing
SELECT g.Country FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.Date = '2012-08-25' ORDER BY t.Time LIMIT 1;	debit_card_specializing
SELECT customers.Currency FROM transactions_1k JOIN customers ON transactions_1k.CustomerID = customers.CustomerID WHERE transactions_1k.Date = '2012-08-24' AND transactions_1k.Time = '16:25:00';	debit_card_specializing
SELECT c.Segment FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE y.Date = '201208';	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k JOIN customers ON transactions_1k.CustomerID = customers.CustomerID WHERE customers.Currency = 'CZK' AND transactions_1k.Date = '2012-08-26' AND transactions_1k.Time < '13:00:00';	debit_card_specializing
SELECT Segment FROM customers WHERE CustomerID = (SELECT MIN(CustomerID) FROM customers);	debit_card_specializing
SELECT g.Country FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.Date = '2012-08-24' AND t.Time = '12:42:00';	debit_card_specializing
SELECT ProductID FROM transactions_1k WHERE Date = '2012-08-23' AND Time = '21:20:00';	debit_card_specializing
SELECT Date, Consumption FROM yearmonth WHERE CustomerID = (SELECT CustomerID FROM transactions_1k WHERE Date = '2012-08-24' AND Amount * Price = 124.05) AND Date = '201201';	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE transactions_1k.Date = '2012-08-26' AND transactions_1k.Time BETWEEN '08:00:00' AND '09:00:00' AND gasstations.Country = 'CZE';	debit_card_specializing
SELECT c.Currency FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE y.Date = '201306' AND y.Consumption = 214582.17;	debit_card_specializing
SELECT g.Country FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.CardID = 667467;	debit_card_specializing
SELECT customers.Currency FROM customers JOIN yearmonth ON customers.CustomerID = yearmonth.CustomerID WHERE yearmonth.Date = '201208' AND yearmonth.Consumption = 548.4;	debit_card_specializing
SELECT      (COUNT(DISTINCT CASE WHEN c.Currency = 'EUR' THEN c.CustomerID END) * 100.0 / COUNT(DISTINCT c.CustomerID)) AS percentage FROM      customers c JOIN      transactions_1k t ON c.CustomerID = t.CustomerID WHERE      t.Date = '2012-08-25';	debit_card_specializing
SELECT      (SUM(CASE WHEN Date LIKE '2012%' THEN Consumption ELSE 0 END) -       SUM(CASE WHEN Date LIKE '2013%' THEN Consumption ELSE 0 END)) /      SUM(CASE WHEN Date LIKE '2012%' THEN Consumption ELSE 0 END) AS decrease_rate FROM yearmonth WHERE CustomerID = (     SELECT CustomerID      FROM transactions_1k      WHERE Date = '2012-08-25' AND Amount = 634.8 );	debit_card_specializing
SELECT g.GasStationID, SUM(t.Amount * t.Price) AS TotalRevenue FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.GasStationID IS NOT NULL GROUP BY g.GasStationID ORDER BY TotalRevenue DESC LIMIT 1;	debit_card_specializing
SELECT (COUNT(CASE WHEN Segment = 'Premium' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM gasstations WHERE Country = 'SVK';	debit_card_specializing
SELECT SUM(Amount * Price) FROM transactions_1k WHERE CustomerID = 38508; SELECT Consumption FROM yearmonth WHERE CustomerID = 38508 AND Date = '201201'	debit_card_specializing
SELECT p.Description, SUM(t.Amount * t.Price) AS TotalSales FROM transactions_1k t JOIN products p ON t.ProductID = p.ProductID GROUP BY p.ProductID ORDER BY TotalSales DESC LIMIT 5;	debit_card_specializing
SELECT      c.CustomerID,     (SELECT SUM(t.Price) / SUM(t.Amount) FROM transactions_1k t WHERE t.CustomerID = c.CustomerID) AS AvgPricePerItem,     c.Currency FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID GROUP BY c.CustomerID ORDER BY SUM(y.Consumption) DESC LIMIT 1;	debit_card_specializing
SELECT Country FROM gasstations WHERE GasStationID IN (SELECT GasStationID FROM transactions_1k WHERE ProductID = 2 AND Price = (SELECT MAX(Price) FROM transactions_1k WHERE ProductID = 2));	debit_card_specializing
SELECT ym.CustomerID, ym.Consumption FROM yearmonth ym WHERE ym.Date = '201208' AND ym.CustomerID IN (     SELECT t.CustomerID     FROM transactions_1k t     WHERE t.ProductID = 5     AND t.Price / t.Amount > 29.00 );	debit_card_specializing
