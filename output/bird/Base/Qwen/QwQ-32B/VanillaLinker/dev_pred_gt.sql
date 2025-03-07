SELECT MAX(`Free Meal Count (K-12)` / `Enrollment (K-12)`)  FROM frpm  WHERE `County Name` = 'Alameda County'  AND `Enrollment (K-12)` > 0;	california_schools
SELECT (`Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)`) AS eligible_rate FROM frpm WHERE `Educational Option Type` = 'Continuation'     AND `Enrollment (Ages 5-17)` > 0 ORDER BY eligible_rate ASC LIMIT 3;	california_schools
SELECT schools.Zip FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode WHERE frpm.`Charter School (Y/N)` = 1 AND schools.District = 'Fresno County Office of Education';	california_schools
SELECT s.MailStreet  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  ORDER BY f.`FRPM Count (K-12)` DESC  LIMIT 1;	california_schools
SELECT schools.Phone  FROM schools  JOIN frpm ON schools.CDSCode = frpm.CDSCode  WHERE schools.OpenDate > '2000-01-01'  AND frpm.`Charter School (Y/N)` = 1  AND frpm.`Charter Funding Type` = 'Direct';	california_schools
SELECT COUNT(*)  FROM schools  JOIN satscores ON schools.CDSCode = satscores.cds  WHERE satscores.AvgScrMath > 400  AND schools.Virtual = 'F'	california_schools
SELECT schools.CDSCode, schools.School, schools.County, schools.District  FROM schools  JOIN satscores ON schools.CDSCode = satscores.cds  WHERE satscores.NumTstTakr > 500  AND schools.Magnet = 1;	california_schools
SELECT schools.Phone  FROM schools  INNER JOIN satscores ON schools.CDSCode = satscores.cds  ORDER BY satscores.NumGE1500 DESC  LIMIT 1;	california_schools
SELECT SUM(s.NumTstTakr)  FROM satscores s JOIN frpm f ON s.cds = f.CDSCode WHERE f.`FRPM Count (K-12)` = (SELECT MAX(`FRPM Count (K-12)`) FROM frpm)	california_schools
SELECT COUNT(*)  FROM satscores  JOIN schools ON schools.CDSCode = satscores.cds WHERE satscores.AvgScrMath > 560  AND schools.FundingType = 'Direct';	california_schools
SELECT frpm.`FRPM Count (Ages 5-17)`  FROM frpm  WHERE frpm.CDSCode = (     SELECT cds      FROM satscores      ORDER BY AvgScrRead DESC      LIMIT 1 )	california_schools
SELECT `CDSCode` FROM `frpm` WHERE (`Enrollment (K-12)` + `Enrollment (Ages 5-17)`) > 500	california_schools
SELECT MAX(`Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)`)  FROM frpm  JOIN satscores ON frpm.CDSCode = satscores.cds  WHERE (satscores.NumGE1500 / satscores.NumTstTakr) > 0.3	california_schools
WITH RankedSchools AS (     SELECT          sch.Phone,         DENSE_RANK() OVER (ORDER BY (s.NumGE1500 * 1.0 / s.NumTstTakr) DESC) as rnk     FROM satscores s     JOIN schools sch ON s.cds = sch.CDSCode     WHERE s.NumTstTakr != 0 ) SELECT DISTINCT Phone FROM RankedSchools WHERE rnk <= 3;	california_schools
SELECT schools.NCESSchool FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode ORDER BY frpm."Enrollment (Ages 5-17)" DESC LIMIT 5;	california_schools
SELECT schools.District, AVG(satscores.AvgScrRead) AS avg_reading FROM schools JOIN satscores ON schools.CDSCode = satscores.cds WHERE schools.StatusType = 'Active' GROUP BY schools.District ORDER BY avg_reading DESC LIMIT 1;	california_schools
SELECT COUNT(*)  FROM schools  JOIN satscores ON schools.CDSCode = satscores.cds  WHERE schools.County = 'Alameda'  AND satscores.NumTstTakr < 100;	california_schools
SELECT schools.CharterNum, satscores.AvgScrWrite, RANK() OVER (ORDER BY satscores.AvgScrWrite DESC) AS rank  FROM satscores  JOIN schools ON satscores.cds = schools.CDSCode  WHERE satscores.AvgScrWrite > 499  AND schools.CharterNum IS NOT NULL;	california_schools
SELECT COUNT(*)  FROM schools  JOIN satscores ON schools.CDSCode = satscores.cds  WHERE schools.County = 'Fresno'  AND schools.FundingType = 'Direct'  AND satscores.NumTstTakr <= 250;	california_schools
SELECT schools.Phone FROM schools JOIN satscores ON schools.CDSCode = satscores.cds WHERE satscores.AvgScrMath = (SELECT MAX(AvgScrMath) FROM satscores);	california_schools
SELECT COUNT(*)  FROM frpm  JOIN schools USING (CDSCode) WHERE schools.County = 'Amador'  AND frpm.`Low Grade` = '9'  AND frpm.`High Grade` = '12';	california_schools
SELECT COUNT(*)  FROM frpm  JOIN schools USING (CDSCode) WHERE schools.County = 'Los Angeles' AND `Free Meal Count (K-12)` > 500  AND `FRPM Count (K-12)` < 700;	california_schools
SELECT schools.School, satscores.NumTstTakr FROM schools JOIN satscores ON schools.CDSCode = satscores.cds WHERE schools.County = 'Contra Costa' ORDER BY satscores.NumTstTakr DESC LIMIT 1;	california_schools
SELECT frpm.`School Name`,         schools.Street || ' ' || schools.StreetAbr || ', ' || schools.City || ', ' || schools.State || ' ' || schools.Zip AS Full_Address FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE (frpm.`Enrollment (K-12)` - frpm.`Enrollment (Ages 5-17)`) > 30;	california_schools
SELECT frpm.`School Name`  FROM frpm  JOIN satscores ON frpm.CDSCode = satscores.cds  WHERE (frpm.`Free Meal Count (K-12)` / frpm.`Enrollment (K-12)`) > 0.1  AND satscores.NumGE1500 >= 1;	california_schools
SELECT schools.School, schools.FundingType FROM schools JOIN satscores ON schools.CDSCode = satscores.cds WHERE schools.County = 'Riverside' AND satscores.AvgScrMath > 400;	california_schools
SELECT schools.School, schools.Street, schools.City, schools.State, schools.Zip FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.County = 'Monterey' AND frpm.`High Grade` = '12' AND frpm.`FRPM Count (Ages 5-17)` > 800;	california_schools
SELECT satscores.sname AS SchoolName, satscores.AvgScrWrite, schools.Phone FROM schools JOIN satscores ON schools.CDSCode = satscores.cds WHERE (schools.OpenDate > '1991-12-31' OR schools.ClosedDate < '2000-01-01')	california_schools
SELECT s.School, s.DOCType FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.FundingType = 'Local' AND (f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`) > (     SELECT AVG(f2.`Enrollment (K-12)` - f2.`Enrollment (Ages 5-17)`)     FROM frpm f2     JOIN schools s2 ON f2.CDSCode = s2.CDSCode     WHERE s2.FundingType = 'Local' );	california_schools
SELECT schools.OpenDate  FROM schools  JOIN frpm ON schools.CDSCode = frpm.CDSCode  WHERE frpm."Low Grade" = '1' AND frpm."High Grade" = '12'  ORDER BY frpm."Enrollment (K-12)" DESC  LIMIT 1;	california_schools
SELECT schools.City, SUM(frpm."Enrollment (K-12)") AS total_enrollment  FROM frpm  JOIN schools USING (CDSCode)  GROUP BY schools.City  ORDER BY total_enrollment ASC  LIMIT 5;	california_schools
WITH RankedSchools AS (     SELECT          "Free Meal Count (K-12)" / "Enrollment (K-12)" AS eligible_free_rate,         ROW_NUMBER() OVER (ORDER BY "Enrollment (K-12)" DESC) AS rn     FROM frpm     WHERE "Enrollment (K-12)" > 0 ) SELECT eligible_free_rate FROM RankedSchools WHERE rn IN (10, 11);	california_schools
SELECT s.`School`,         (f.`FRPM Count (K-12)` / f.`Enrollment (K-12)`) AS `Eligible FRPM Rate` FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.DOC = '66' ORDER BY f.`FRPM Count (K-12)` DESC LIMIT 5;	california_schools
SELECT schools.Website, frpm.`School Name`  FROM frpm  JOIN schools ON frpm.CDSCode = schools.CDSCode  WHERE frpm.`Free Meal Count (Ages 5-17)` BETWEEN 1900 AND 2000;	california_schools
SELECT      (`Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)`) AS free_rate  FROM frpm  JOIN schools  ON frpm.CDSCode = schools.CDSCode  WHERE (AdmFName1 = 'Kacey' AND AdmLName1 = 'Gibson')     OR (AdmFName2 = 'Kacey' AND AdmLName2 = 'Gibson')     OR (AdmFName3 = 'Kacey' AND AdmLName3 = 'Gibson')	california_schools
SELECT schools.AdmEmail1  FROM frpm  JOIN schools USING (CDSCode)  WHERE `Charter School (Y/N)` = 1  ORDER BY `Enrollment (K-12)` ASC  LIMIT 1;	california_schools
SELECT      s.AdmFName1 || ' ' || s.AdmLName1 AS Admin1,     s.AdmFName2 || ' ' || s.AdmLName2 AS Admin2,     s.AdmFName3 || ' ' || s.AdmLName3 AS Admin3 FROM schools s JOIN satscores st ON s.CDSCode = st.cds WHERE st.NumGE1500 = (SELECT MAX(NumGE1500) FROM satscores);	california_schools
SELECT schools.Street, schools.City, schools.Zip, schools.State  FROM schools  JOIN satscores ON schools.CDSCode = satscores.cds  ORDER BY (satscores.NumGE1500 / satscores.NumTstTakr) ASC  LIMIT 1;	california_schools
SELECT schools.Website  FROM schools  JOIN satscores ON schools.CDSCode = satscores.cds  WHERE schools.County = 'Los Angeles'  AND satscores.NumTstTakr BETWEEN 2000 AND 3000	california_schools
SELECT AVG(s.NumTstTakr)  FROM schools sch  JOIN satscores s ON sch.CDSCode = s.cds  WHERE sch.County = 'Fresno'  AND sch.OpenDate BETWEEN '1980-01-01' AND '1980-12-31'	california_schools
SELECT schools.Phone FROM schools JOIN satscores ON schools.CDSCode = satscores.cds WHERE schools.District = 'Fresno Unified' ORDER BY satscores.AvgScrRead ASC LIMIT 1;	california_schools
SELECT School  FROM (   SELECT      schools.School,     ROW_NUMBER() OVER (PARTITION BY schools.County ORDER BY satscores.AvgScrRead DESC) AS rnk   FROM schools   JOIN satscores ON schools.CDSCode = satscores.cds   WHERE schools.Virtual = 'F' AND satscores.AvgScrRead IS NOT NULL ) AS sub WHERE rnk <=5;	california_schools
SELECT "Educational Option Type"  FROM frpm  JOIN satscores ON frpm.CDSCode = satscores.cds  WHERE satscores.AvgScrMath = (SELECT MAX(AvgScrMath) FROM satscores)	california_schools
SELECT s.AvgScrMath, sch.County FROM satscores s JOIN schools sch ON s.cds = sch.CDSCode WHERE (s.AvgScrMath + s.AvgScrRead + s.AvgScrWrite) = (     SELECT MIN(AvgScrMath + AvgScrRead + AvgScrWrite) FROM satscores );	california_schools
SELECT s.AvgScrWrite, sch.City FROM satscores s JOIN schools sch ON s.cds = sch.CDSCode WHERE s.NumGE1500 = (SELECT MAX(NumGE1500) FROM satscores);	california_schools
SELECT schools.School, satscores.AvgScrWrite FROM schools JOIN satscores ON schools.CDSCode = satscores.cds WHERE      (AdmFName1 = 'Ricci' AND AdmLName1 = 'Ulrich') OR     (AdmFName2 = 'Ricci' AND AdmLName2 = 'Ulrich') OR     (AdmFName3 = 'Ricci' AND AdmLName3 = 'Ulrich');	california_schools
SELECT s.School, f.`Enrollment (K-12)` FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.DOC = 31 AND f.`Enrollment (K-12)` = (     SELECT MAX(`Enrollment (K-12)`)      FROM frpm      WHERE CDSCode IN (SELECT CDSCode FROM schools WHERE DOC = 31) ) ORDER BY f.`Enrollment (K-12)` DESC;	california_schools
SELECT COUNT(*) / 12 AS monthly_avg FROM schools WHERE County = 'Alameda' AND DOC = '52' AND OpenDate IS NOT NULL AND YEAR(OpenDate) = 1980;	california_schools
SELECT      (CAST(COUNT(CASE WHEN DOC = '54' THEN 1 END) AS REAL) /       COUNT(CASE WHEN DOC = '52' THEN 1 END)) AS ratio FROM schools WHERE County = 'Orange';	california_schools
SELECT s.County, s.School, s.ClosedDate FROM schools s WHERE s.StatusType = 'Closed'      AND s.County = (         SELECT County          FROM schools          WHERE StatusType = 'Closed'          GROUP BY County          ORDER BY COUNT(*) DESC          LIMIT 1     )	california_schools
SELECT s.School AS SchoolName, s.MailStreet || ' ' || s.MailStrAbr AS PostalStreetAddress FROM satscores sc JOIN schools s ON sc.cds = s.CDSCode ORDER BY sc.AvgScrMath DESC LIMIT 1 OFFSET 6;	california_schools
SELECT s.MailStreet, s.School  FROM schools s  JOIN satscores ss ON s.CDSCode = ss.cds  WHERE ss.AvgScrRead = (SELECT MIN(AvgScrRead) FROM satscores WHERE AvgScrRead IS NOT NULL);	california_schools
SELECT COUNT(*)  FROM satscores s JOIN schools sch ON s.cds = sch.CDSCode WHERE sch.MailCity = 'Lakeport'  AND (s.AvgScrRead + s.AvgScrMath + s.AvgScrWrite) >= 1500;	california_schools
SELECT SUM(s.NumTstTakr)  FROM schools AS s  JOIN satscores AS sc ON s.CDSCode = sc.cds  WHERE s.MailCity = 'Fresno'	california_schools
SELECT School, MailZip  FROM schools  WHERE      (AdmFName1 = 'Avetik' AND AdmLName1 = 'Atoian') OR      (AdmFName2 = 'Avetik' AND AdmLName2 = 'Atoian') OR      (AdmFName3 = 'Avetik' AND AdmLName3 = 'Atoian')	california_schools
SELECT      (COUNT(CASE WHEN County = 'Colusa' THEN 1 END) * 1.0 /       COUNT(CASE WHEN County = 'Humboldt' THEN 1 END)) AS ratio FROM schools WHERE MailState = 'CA';	california_schools
SELECT COUNT(*)  FROM schools  WHERE MailState = 'CA'  AND City = 'San Joaquin'  AND StatusType = 'Active';	california_schools
SELECT schools.Phone, schools.Ext FROM schools INNER JOIN (     SELECT cds      FROM satscores      ORDER BY AvgScrWrite DESC      LIMIT 1 OFFSET 332 ) AS ranked ON schools.CDSCode = ranked.cds;	california_schools
SELECT School, Phone, Ext FROM schools WHERE Zip = '95203-3704';	california_schools
SELECT Website  FROM schools  WHERE      (AdmFName1 = 'Mike' AND AdmLName1 = 'Larson')      OR (AdmFName1 = 'Dante' AND AdmLName1 = 'Alvarez')      OR (AdmFName2 = 'Mike' AND AdmLName2 = 'Larson')      OR (AdmFName2 = 'Dante' AND AdmLName2 = 'Alvarez')      OR (AdmFName3 = 'Mike' AND AdmLName3 = 'Larson')      OR (AdmFName3 = 'Dante' AND AdmLName3 = 'Alvarez');	california_schools
SELECT Website  FROM schools  WHERE Charter = 1  AND Virtual = 'P'  AND County = 'San Joaquin'	california_schools
SELECT COUNT(*)  FROM schools  WHERE Charter = 1  AND City = 'Hickman'  AND DOC = 52;	california_schools
SELECT COUNT(*)  FROM schools  JOIN frpm USING (CDSCode) WHERE schools.County = 'Los Angeles'  AND schools.Charter = 0  AND ((frpm.`Free Meal Count (K-12)` / frpm.`Enrollment (K-12)`) * 100) < 0.18	california_schools
SELECT School AS SchoolName, City, AdmFName1 || ' ' || AdmLName1 AS AdministratorName  FROM schools  WHERE Charter = 1 AND CharterNum = '00D2'  AND AdmFName1 IS NOT NULL AND AdmLName1 IS NOT NULL   UNION ALL   SELECT School, City, AdmFName2 || ' ' || AdmLName2  FROM schools  WHERE Charter = 1 AND CharterNum = '00D2'  AND AdmFName2 IS NOT NULL AND AdmLName2 IS NOT NULL   UNION ALL   SELECT School, City, AdmFName3 || ' ' || AdmLName3  FROM schools  WHERE Charter = 1 AND CharterNum = '00D2'  AND AdmFName3 IS NOT NULL AND AdmLName3 IS NOT NULL;	california_schools
SELECT COUNT(*)  FROM schools  WHERE MailCity = 'Hickman'  AND CharterNum = '00D4'	california_schools
SELECT      (COUNT(CASE WHEN FundingType = 'Locally Funded' THEN 1 END) * 100.0 / COUNT(*)) AS ratio FROM schools WHERE County = 'Santa Clara County' AND Charter = 1;	california_schools
SELECT COUNT(*)  FROM schools WHERE County = 'Stanislaus'  AND FundingType = 'Directly Funded'  AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31'	california_schools
SELECT COUNT(DISTINCT s.District)  FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.City = 'San Francisco' AND strftime('%Y', s.ClosedDate) = '1989' AND f.`District Type` = 'Community College District';	california_schools
SELECT County, COUNT(*) AS closure_count  FROM schools  WHERE SOC = 11  AND ClosedDate BETWEEN '1980-01-01' AND '1989-12-31'  GROUP BY County  ORDER BY closure_count DESC  LIMIT 1;	california_schools
SELECT NCESDist FROM schools WHERE SOC = 31;	california_schools
SELECT StatusType, COUNT(*) AS Count  FROM schools  WHERE County = 'Alpine'  AND EdOpsName = 'Community Day School'  AND Charter = 0  GROUP BY StatusType;	california_schools
SELECT DISTINCT frpm.`District Code`  FROM schools  JOIN frpm ON schools.CDSCode = frpm.CDSCode  WHERE schools.City = 'Fresno'  AND schools.Magnet = 0;	california_schools
SELECT SUM(`Enrollment (Ages 5-17)`)  FROM frpm  JOIN schools USING (CDSCode)  WHERE frpm.`Academic Year` = '2014-2015'  AND schools.EdOpsCode = 'SSS'  AND schools.City = 'Fremont';	california_schools
SELECT frpm.`FRPM Count (Ages 5-17)`  FROM frpm  INNER JOIN schools ON frpm.CDSCode = schools.CDSCode  WHERE schools.MailStreet = 'PO Box 1040'  AND frpm.`School Type` = 'Youth Authority School';	california_schools
SELECT frpm.`Low Grade`  FROM schools  JOIN frpm ON schools.CDSCode = frpm.CDSCode  WHERE schools.NCESDist = '0613360'  AND schools.EdOpsCode = 'SPECON';	california_schools
SELECT `School Name`, `School Type`  FROM `frpm`  WHERE `NSLP Provision Status` = 'Breakfast Provision 2'  AND `County Code` = '37';	california_schools
SELECT schools.City  FROM frpm  JOIN schools USING (CDSCode)  WHERE schools.County = 'Merced'  AND frpm.`Low Grade` = '9'  AND frpm.`High Grade` = '12'  AND frpm.`NSLP Provision Status` = '2'  AND schools.EILCode = 'HS'	california_schools
SELECT `School Name`, `Percent (%) Eligible FRPM (Ages 5-17)`  FROM frpm  WHERE `County Name` = 'Los Angeles'  AND `Low Grade` = 'K'  AND `High Grade` = '9';	california_schools
SELECT `Low Grade`, `High Grade`, COUNT(*) AS count FROM schools JOIN frpm USING (CDSCode) WHERE City = 'Adelanto' GROUP BY `Low Grade`, `High Grade` ORDER BY count DESC LIMIT 1;	california_schools
SELECT County, COUNT(*)  FROM schools  WHERE Virtual = 'F' AND County IN ('San Diego', 'Santa Barbara')  GROUP BY County;	california_schools
SELECT frpm."School Type", schools.School, schools.Latitude  FROM schools  JOIN frpm ON schools.CDSCode = frpm.CDSCode  WHERE schools.Latitude = (SELECT MAX(Latitude) FROM schools)	california_schools
SELECT s.City, s.School, f.`Low Grade`  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE s.State = 'CA'  ORDER BY s.Latitude ASC  LIMIT 1;	california_schools
SELECT frpm.`Low Grade`, frpm.`High Grade`  FROM frpm  INNER JOIN schools s ON frpm.CDSCode = s.CDSCode  WHERE ABS(s.Longitude) = (SELECT MAX(ABS(Longitude)) FROM schools);	california_schools
SELECT schools.City, COUNT(schools.CDSCode) AS SchoolCount FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode WHERE schools.Magnet = 1 AND frpm.`Low Grade` = 'K' AND frpm.`High Grade` = '8' AND frpm.`NSLP Provision Status` = 'Multiple Provision Types' GROUP BY schools.City;	california_schools
WITH all_admins AS (     SELECT AdmFName1 AS fname, District     FROM schools     WHERE AdmFName1 IS NOT NULL     UNION ALL     SELECT AdmFName2, District     FROM schools     WHERE AdmFName2 IS NOT NULL     UNION ALL     SELECT AdmFName3, District     FROM schools     WHERE AdmFName3 IS NOT NULL ), top_names AS (     SELECT fname, COUNT(*) AS total     FROM all_admins     GROUP BY fname     ORDER BY total DESC     LIMIT 2 ) SELECT a.fname, a.District FROM all_admins a JOIN top_names tn ON a.fname = tn.fname ORDER BY tn.total DESC, a.fname, a.District;	california_schools
SELECT frpm.`Percent (%) Eligible Free (K-12)`, frpm.`District Code` FROM frpm INNER JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.AdmFName1 = 'Alusine' OR schools.AdmFName2 = 'Alusine' OR schools.AdmFName3 = 'Alusine';	california_schools
SELECT schools.AdmLName1 AS Administrator_LastName, schools.District, schools.County, schools.School  FROM schools  WHERE schools.CharterNum = '40'	california_schools
SELECT AdmEmail1, AdmEmail2, AdmEmail3 FROM schools WHERE County = 'San Bernardino' AND District = 'San Bernardino City Unified' AND StatusType = 'Public' AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND (SOC = '62' OR DOC = '54')	california_schools
SELECT schools.School, schools.AdmEmail1 FROM schools INNER JOIN satscores ON schools.CDSCode = satscores.cds WHERE satscores.NumGE1500 = (SELECT MAX(NumGE1500) FROM satscores);	california_schools
SELECT COUNT(DISTINCT a.account_id)  FROM account a  JOIN district d ON a.district_id = d.district_id  WHERE a.frequency = 'POPLATEK PO OBRATU'  AND d.A3 = 'East Bohemia';	financial
SELECT COUNT(*)  FROM account  JOIN district ON account.district_id = district.district_id  LEFT JOIN loan ON account.account_id = loan.account_id  WHERE district.A3 = 'Prague'  AND loan.loan_id IS NULL;	financial
SELECT AVG(A12) AS avg_1995, AVG(A13) AS avg_1996 FROM district;	financial
SELECT COUNT(*)  FROM district d WHERE EXISTS (SELECT 1 FROM client c WHERE c.district_id = d.district_id AND c.gender = 'F') AND d.A11 > 6000  AND d.A11 < 10000;	financial
SELECT COUNT(*)  FROM client c  JOIN district d ON c.district_id = d.district_id  WHERE c.gender = 'M'  AND d.A3 = 'North Bohemia'  AND d.A11 > 8000;	financial
SELECT a.account_id,     (SELECT MAX(d_max.A11) FROM client c_max JOIN district d_max ON c_max.district_id = d_max.district_id WHERE c_max.gender = 'F') -     (SELECT MIN(d_min.A11) FROM client c_min JOIN district d_min ON c_min.district_id = d_min.district_id WHERE c_min.gender = 'F') AS gap FROM account a JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id JOIN district dist ON c.district_id = dist.district_id WHERE c.gender = 'F' AND c.birth_date = (SELECT MIN(c2.birth_date) FROM client c2 WHERE c2.gender = 'F') AND dist.A11 = (SELECT MIN(d_min.A11) FROM client c_min JOIN district d_min ON c_min.district_id = d_min.district_id WHERE c_min.gender = 'F');	financial
SELECT a.account_id FROM client c JOIN district d ON c.district_id = d.district_id JOIN disp ON c.client_id = disp.client_id JOIN account a ON disp.account_id = a.account_id WHERE c.birth_date = (SELECT MAX(birth_date) FROM client) AND d.A11 = (     SELECT MAX(d2.A11)      FROM client c2      JOIN district d2 ON c2.district_id = d2.district_id      WHERE c2.birth_date = (SELECT MAX(birth_date) FROM client) );	financial
SELECT COUNT(DISTINCT d.client_id)  FROM disp d  JOIN account a ON d.account_id = a.account_id  WHERE a.frequency = 'POPLATEK TYDNE' AND d.type = 'OWNER';	financial
SELECT client.client_id FROM client JOIN disp ON client.client_id = disp.client_id JOIN account ON disp.account_id = account.account_id WHERE account.frequency = 'POPLATEK PO OBRATU' AND disp.type = 'DISPONENT';	financial
SELECT account.account_id FROM account JOIN loan ON account.account_id = loan.account_id WHERE loan.date BETWEEN '1997-01-01' AND '1997-12-31' AND account.frequency = 'POPLATEK TYDNE' AND loan.amount = (SELECT MIN(amount) FROM loan WHERE date BETWEEN '1997-01-01' AND '1997-12-31');	financial
SELECT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 12 AND strftime('%Y', a.date) = '1993' AND l.amount = (     SELECT MAX(l2.amount)     FROM loan l2     JOIN account a2 ON l2.account_id = a2.account_id     WHERE l2.duration > 12     AND strftime('%Y', a2.date) = '1993' );	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c JOIN district d ON c.district_id = d.district_id JOIN disp ON c.client_id = disp.client_id WHERE c.gender = 'F'  AND c.birth_date < '1950-01-01'  AND d.A2 = 'Sokolov'	financial
SELECT account_id  FROM account  WHERE date = (SELECT MIN(date) FROM account WHERE date BETWEEN '1995-01-01' AND '1995-12-31')	financial
SELECT a.account_id  FROM account a  JOIN trans t ON a.account_id = t.account_id  WHERE a.date < '1997-01-01'  AND t.balance > 3000  AND t.date = (SELECT MAX(t2.date) FROM trans t2 WHERE t2.account_id = a.account_id);	financial
SELECT client.client_id  FROM card  JOIN disp ON card.disp_id = disp.disp_id  JOIN client ON disp.client_id = client.client_id  WHERE card.issued = '1994-03-03';	financial
SELECT date  FROM account  WHERE account_id = (     SELECT account_id      FROM trans      WHERE amount = 840 AND date = '1998-10-14' );	financial
SELECT a.district_id FROM loan l JOIN account a ON l.account_id = a.account_id WHERE l.date = '1994-08-25';	financial
SELECT MAX(t.amount)  FROM trans t WHERE t.account_id IN (     SELECT d.account_id      FROM disp d     WHERE d.client_id IN (         SELECT d2.client_id          FROM disp d2         WHERE d2.disp_id IN (             SELECT c.disp_id              FROM card c             WHERE c.issued = '1996-10-21'         )     ) );	financial
SELECT c.gender  FROM client c  JOIN disp d ON c.client_id = d.client_id AND d.type = 'OWNER'  WHERE c.district_id = (SELECT district_id FROM district ORDER BY A11 DESC LIMIT 1)  AND c.birth_date = (SELECT MIN(c2.birth_date) FROM client c2 JOIN disp d2 ON c2.client_id = d2.client_id AND d2.type = 'OWNER' WHERE c2.district_id = (SELECT district_id FROM district ORDER BY A11 DESC LIMIT 1))  LIMIT 1;	financial
SELECT t.amount  FROM trans t  WHERE t.account_id = (SELECT l.account_id FROM loan l ORDER BY l.amount DESC LIMIT 1)  AND t.date >= (SELECT a.date FROM account a WHERE a.account_id = (SELECT l.account_id FROM loan l ORDER BY l.amount DESC LIMIT 1))  ORDER BY t.date ASC, t.trans_id ASC  LIMIT 1;	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c JOIN disp d ON c.client_id = d.client_id  JOIN account a ON d.account_id = a.account_id  JOIN district dist ON a.district_id = dist.district_id WHERE c.gender = 'F'  AND d.type = 'OWNER'  AND dist.A2 = 'Jesenik';	financial
SELECT disp.disp_id FROM trans JOIN account ON trans.account_id = account.account_id JOIN disp ON disp.account_id = account.account_id WHERE trans.amount = 5100 AND trans.date = '1998-09-02';	financial
SELECT COUNT(*)  FROM account  JOIN district ON account.district_id = district.district_id  WHERE district.A2 = 'Litomerice'  AND YEAR(account.date) = 1996;	financial
SELECT d.A2  FROM client c  JOIN disp dis ON c.client_id = dis.client_id  JOIN account a ON dis.account_id = a.account_id  JOIN district d ON a.district_id = d.district_id  WHERE c.gender = 'F'  AND c.birth_date = '1976-01-29'  AND dis.type = 'OWNER'	financial
SELECT client.birth_date  FROM client  JOIN disp ON client.client_id = disp.client_id  JOIN account ON disp.account_id = account.account_id  JOIN loan ON account.account_id = loan.account_id  WHERE loan.amount = 80952 AND loan.date = '1994-01-05' AND disp.type = 'OWNER';	financial
SELECT a.account_id FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A3 = 'Prague' ORDER BY a.date ASC LIMIT 1;	financial
SELECT      (COUNT(CASE WHEN c.gender = 'M' THEN 1 END) * 100.0 / COUNT(c.client_id)) AS percentage FROM client c WHERE c.district_id = (     SELECT d.district_id     FROM district d     WHERE d.A3 = 'South Bohemia'     ORDER BY d.A4 DESC     LIMIT 1 );	financial
SELECT      ((new_balance - old_balance)/old_balance)*100 AS increase_rate FROM (     SELECT          (SELECT balance           FROM trans           WHERE account_id = a.account_id             AND date <= '1998-12-27'           ORDER BY date DESC LIMIT 1) AS new_balance,         (SELECT balance           FROM trans           WHERE account_id = a.account_id             AND date <= '1993-03-22'           ORDER BY date DESC LIMIT 1) AS old_balance     FROM account a     JOIN loan l ON a.account_id = l.account_id     JOIN disp d ON a.account_id = d.account_id     WHERE l.date = (SELECT MIN(date) FROM loan)     AND d.type = 'OWNER'     LIMIT 1 ) AS sub;	financial
SELECT (SUM(CASE WHEN status = 'A' THEN amount ELSE 0 END) * 100.0 / SUM(amount)) AS percentage FROM loan;	financial
SELECT (SUM(CASE WHEN status = 'C' THEN amount ELSE 0 END) * 100.0 / SUM(amount)) AS percentage FROM loan WHERE amount < 100000;	financial
SELECT account.account_id, district.A2 AS district_name, district.A3 AS district_region FROM account JOIN district ON account.district_id = district.district_id WHERE YEAR(account.date) = 1993 AND account.frequency = 'POPLATEK PO OBRATU';	financial
SELECT disp.client_id AS account_holder, a.account_id, a.frequency FROM account a JOIN district d ON a.district_id = d.district_id JOIN disp ON a.account_id = disp.account_id WHERE disp.type = 'OWNER' AND d.A2 = 'east Bohemia' AND a.date BETWEEN '1995-01-01' AND '2000-12-31';	financial
SELECT account.account_id, account.date FROM account JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Prachatice';	financial
SELECT district.A2 AS district, district.A3 AS region FROM loan JOIN account ON loan.account_id = account.account_id JOIN district ON account.district_id = district.district_id WHERE loan.loan_id = '4990'	financial
SELECT l.account_id, d.A2 AS district, d.A3 AS region FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.amount > 300000;	financial
SELECT l.loan_id, d.A3 AS district, d.A11 AS average_salary FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.duration = 60;	financial
SELECT d.A3 AS district, d.A2 AS state, ((d.A13 - d.A12)/d.A12)*100 AS unemployment_increment FROM loan l JOIN account a ON l.account_id = a.account_id JOIN disp d1 ON a.account_id = d1.account_id AND d1.type = 'OWNER' JOIN client c ON d1.client_id = c.client_id JOIN district d ON c.district_id = d.district_id WHERE l.status = 'D' GROUP BY d.district_id;	financial
SELECT      (COUNT(CASE WHEN d.A2 = 'Decin' THEN 1 END) * 1.0 / COUNT(*)) * 100 AS percentage FROM account a JOIN district d ON a.district_id = d.district_id WHERE YEAR(a.date) = 1993;	financial
SELECT account_id  FROM account  WHERE frequency = 'POPLATEK MESICNE'	financial
SELECT d.A2, COUNT(DISTINCT c.client_id) AS female_count FROM account a JOIN disp dp ON a.account_id = dp.account_id JOIN client c ON dp.client_id = c.client_id JOIN district d ON a.district_id = d.district_id WHERE c.gender = 'F' GROUP BY d.district_id, d.A2 ORDER BY female_count DESC LIMIT 9;	financial
SELECT d.A2 AS district_name, SUM(t.amount) AS total_withdrawal FROM trans t JOIN account a ON t.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE t.type = 'VYDAJ'    AND t.date LIKE '1996-01%' GROUP BY d.A2 ORDER BY total_withdrawal DESC LIMIT 10;	financial
SELECT COUNT(DISTINCT d.client_id)  FROM disp d  JOIN account a ON d.account_id = a.account_id  JOIN district dist ON a.district_id = dist.district_id  WHERE d.type = 'OWNER'  AND dist.A3 = 'South Bohemia'  AND NOT EXISTS (     SELECT 1      FROM card c      JOIN disp disp_card ON c.disp_id = disp_card.disp_id      WHERE disp_card.client_id = d.client_id );	financial
SELECT d.A3 FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.status IN ('C', 'D') GROUP BY d.district_id, d.A3 ORDER BY COUNT(l.loan_id) DESC LIMIT 1;	financial
SELECT AVG(l.amount)  FROM loan l  JOIN account a ON l.account_id = a.account_id  JOIN disp d ON d.account_id = a.account_id AND d.type = 'OWNER'  JOIN client c ON c.client_id = d.client_id  WHERE c.gender = 'M'	financial
SELECT A2 AS district_name, A3 AS branch_location FROM district WHERE A13 = (SELECT MAX(A13) FROM district);	financial
SELECT COUNT(*)  FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A16 = (SELECT MAX(A16) FROM district) AND YEAR(a.date) = 1996;	financial
SELECT COUNT(DISTINCT a.account_id)  FROM account a JOIN trans t ON a.account_id = t.account_id WHERE a.frequency = 'POPLATEK MESICNE' AND t.type = 'VYBER KARTOU' AND t.balance < 0;	financial
SELECT COUNT(*)  FROM loan  JOIN account USING (account_id)  WHERE loan.date BETWEEN '1995-01-01' AND '1997-12-31'  AND loan.amount >= 250000  AND account.frequency = 'POPLATEK MESICNE'	financial
SELECT COUNT(DISTINCT a.account_id)  FROM account a  JOIN loan l ON a.account_id = l.account_id  WHERE a.district_id = 1  AND l.status IN ('C', 'D');	financial
SELECT COUNT(*)  FROM client  WHERE district_id IN (     SELECT district_id      FROM district      WHERE A15 = (         SELECT MAX(A15)          FROM district          WHERE A15 < (SELECT MAX(A15) FROM district)     ) )  AND gender = 'M';	financial
SELECT COUNT(*)  FROM card  JOIN disp ON card.disp_id = disp.disp_id  WHERE card.type = 'gold' AND disp.type = 'OWNER';	financial
SELECT COUNT(*)  FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Pisek'	financial
SELECT d.A2  FROM district d  JOIN account a ON d.district_id = a.district_id  JOIN trans t ON a.account_id = t.account_id  WHERE t.amount > 10000 AND YEAR(t.date) = 1997  GROUP BY d.district_id;	financial
SELECT DISTINCT o.account_id FROM `order` o JOIN account a ON o.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE o.k_symbol = 'SIPO' AND d.A2 = 'Pisek';	financial
SELECT DISTINCT a.account_id FROM account a JOIN disp d ON a.account_id = d.account_id JOIN card c ON d.disp_id = c.disp_id WHERE c.type = 'gold'	financial
SELECT      YEAR(t.date) AS year,     MONTH(t.date) AS month,     AVG(t.amount) AS average_amount FROM trans t WHERE t.operation = 'VYBER KARTOU'  AND YEAR(t.date) = 2021 AND EXISTS (     SELECT 1      FROM disp d      JOIN card c ON d.disp_id = c.disp_id     WHERE d.account_id = t.account_id ) GROUP BY YEAR(t.date), MONTH(t.date);	financial
SELECT DISTINCT c.client_id FROM trans t JOIN account a ON t.account_id = a.account_id JOIN disp d ON d.account_id = a.account_id AND d.type = 'OWNER' JOIN client c ON d.client_id = c.client_id WHERE t.date BETWEEN '1998-01-01' AND '1998-12-31'   AND t.operation = 'VYBER KARTOU'   AND t.amount < (     SELECT AVG(tt.amount)     FROM trans tt     WHERE YEAR(tt.date) = 1998       AND tt.operation = 'VYBER KARTOU'   );	financial
SELECT DISTINCT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id AND d.type = 'OWNER' JOIN account a ON d.account_id = a.account_id JOIN loan l ON a.account_id = l.account_id JOIN card cr ON d.disp_id = cr.disp_id WHERE c.gender = 'F';	financial
SELECT COUNT(DISTINCT a.account_id)  FROM account a  JOIN district d ON a.district_id = d.district_id  JOIN disp ON a.account_id = disp.account_id  JOIN client c ON disp.client_id = c.client_id  WHERE d.A3 = 'south Bohemia'  AND c.gender = 'F'  AND disp.type = 'OWNER'	financial
SELECT DISTINCT a.*  FROM account a  JOIN district d ON a.district_id = d.district_id  JOIN disp ON a.account_id = disp.account_id  WHERE d.A2 = 'Tabor' AND disp.type = 'OWNER';	financial
SELECT DISTINCT d.type  FROM disp d  JOIN account a ON d.account_id = a.account_id  JOIN district dist ON a.district_id = dist.district_id  WHERE d.type != 'OWNER'  AND dist.A11 > 8000  AND dist.A11 <= 9000;	financial
SELECT COUNT(DISTINCT a.account_id)  FROM account a JOIN district d ON a.district_id = d.district_id JOIN trans t ON a.account_id = t.account_id WHERE d.A3 = 'North Bohemia'  AND t.bank = 'AB';	financial
SELECT DISTINCT d.A2 FROM district d JOIN account a ON d.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id WHERE t.type = 'VYDAJ'	financial
SELECT AVG(d.A15)  FROM district d WHERE d.A15 > 4000  AND EXISTS (     SELECT 1      FROM account a      WHERE a.district_id = d.district_id      AND a.date >= '1997-01-01' );	financial
SELECT COUNT(*)  FROM card  JOIN disp ON card.disp_id = disp.disp_id  WHERE card.type = 'classic'  AND disp.type = 'OWNER';	financial
SELECT COUNT(client.client_id)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE client.gender = 'M' AND district.A2 = 'Hl.m. Praha';	financial
SELECT (COUNT(CASE WHEN type = 'gold' AND issued < '1998-01-01' THEN 1 END) * 100.0 / COUNT(*)) FROM card;	financial
SELECT c.client_id  FROM client c  JOIN disp d ON c.client_id = d.client_id  JOIN loan l ON d.account_id = l.account_id  WHERE l.amount = (SELECT MAX(amount) FROM loan)  AND d.type = 'OWNER'	financial
SELECT A15 FROM district WHERE district_id = (SELECT district_id FROM account WHERE account_id = 532)	financial
SELECT account.district_id  FROM account  JOIN `order` ON account.account_id = `order`.account_id  WHERE `order`.order_id = 33333;	financial
SELECT trans.*  FROM trans  JOIN disp ON trans.account_id = disp.account_id  WHERE disp.client_id = 3356  AND trans.operation = 'VYBER'	financial
SELECT COUNT(*)  FROM account a WHERE a.frequency = 'POPLATEK TYDNE' AND EXISTS (SELECT 1 FROM loan l WHERE l.account_id = a.account_id AND l.amount < 200000);	financial
SELECT card.type  FROM client  JOIN disp ON client.client_id = disp.client_id  JOIN card ON disp.disp_id = card.disp_id  WHERE client.client_id = 13539;	financial
SELECT d.A3 AS region  FROM client c  JOIN district d ON c.district_id = d.district_id  WHERE c.client_id = 3541;	financial
SELECT d.district_id, COUNT(*) AS loan_count FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.status = 'A' GROUP BY d.district_id ORDER BY loan_count DESC LIMIT 1;	financial
SELECT client.client_id FROM client JOIN disp ON client.client_id = disp.client_id JOIN account ON disp.account_id = account.account_id JOIN `order` ON account.account_id = `order`.account_id WHERE `order`.order_id = 32423;	financial
SELECT trans.*  FROM trans JOIN account ON trans.account_id = account.account_id WHERE account.district_id =5;	financial
SELECT COUNT(*)  FROM account  JOIN district ON account.district_id = district.district_id  WHERE district.A2 = 'Jesenik';	financial
SELECT DISTINCT client.client_id FROM client JOIN disp ON client.client_id = disp.client_id JOIN card ON disp.disp_id = card.disp_id WHERE card.type = 'junior' AND card.issued >= '1997-01-01';	financial
SELECT      (COUNT(DISTINCT CASE WHEN client.gender = 'F' THEN client.client_id END) * 100.0 /       COUNT(DISTINCT client.client_id)) AS percentage FROM account JOIN district ON account.district_id = district.district_id JOIN disp ON disp.account_id = account.account_id JOIN client ON client.client_id = disp.client_id WHERE district.A11 > 10000 AND disp.type = 'OWNER';	financial
SELECT ((sum_1997 - sum_1996) / sum_1996) * 100 AS growth_rate FROM (SELECT SUM(CASE WHEN YEAR(l.date) = 1997 THEN l.amount ELSE 0 END) AS sum_1997, SUM(CASE WHEN YEAR(l.date) = 1996 THEN l.amount ELSE 0 END) AS sum_1996 FROM loan l WHERE l.account_id IN (SELECT a.account_id FROM account a JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id WHERE c.gender = 'M') AND YEAR(l.date) BETWEEN 1996 AND 1997) AS s;	financial
SELECT COUNT(*)  FROM trans  WHERE operation = 'VYBER KARTOU'  AND date > '1995-12-31';	financial
SELECT      (SUM(CASE WHEN A3 = 'North Bohemia' THEN A16 ELSE 0 END) -       SUM(CASE WHEN A3 = 'East Bohemia' THEN A16 ELSE 0 END))  AS difference  FROM district;	financial
SELECT      SUM(CASE WHEN type = 'OWNER' THEN 1 ELSE 0 END) AS owner_count,     SUM(CASE WHEN type = 'DISPONENT' THEN 1 ELSE 0 END) AS disponent_count FROM disp WHERE account_id BETWEEN 1 AND 10;	financial
SELECT frequency FROM account WHERE account_id = 3; SELECT k_symbol FROM `order` WHERE amount = 3539;	financial
SELECT YEAR(client.birth_date)  FROM client  JOIN disp ON client.client_id = disp.client_id  WHERE disp.account_id = 130 AND disp.type = 'OWNER';	financial
SELECT COUNT(DISTINCT a.account_id)  FROM account a  JOIN disp d ON a.account_id = d.account_id  WHERE d.type = 'OWNER'  AND a.frequency = 'POPLATEK PO OBRATU'	financial
SELECT      COALESCE(SUM(l.amount), 0) AS total_debt,     GROUP_CONCAT(DISTINCT l.status) AS payment_status FROM client c LEFT JOIN disp d ON c.client_id = d.client_id LEFT JOIN account a ON d.account_id = a.account_id LEFT JOIN loan l ON a.account_id = l.account_id WHERE c.client_id = 992;	financial
SELECT t.balance, c.gender  FROM client c  JOIN disp d ON c.client_id = 4 AND d.client_id = 4 AND d.type = 'OWNER'  JOIN account a ON a.account_id = d.account_id  LEFT JOIN trans t ON a.account_id = t.account_id AND t.trans_id = 851;	financial
SELECT card.type  FROM card  JOIN disp ON card.disp_id = disp.disp_id  WHERE disp.client_id = 9;	financial
SELECT SUM(t.amount)  FROM trans t  JOIN disp d ON t.account_id = d.account_id  WHERE d.client_id = 617  AND YEAR(t.date) = 1998  AND t.type = 'VYBER';	financial
SELECT DISTINCT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN district dist ON a.district_id = dist.district_id WHERE c.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND dist.A2 = 'East Bohemia';	financial
SELECT client.client_id FROM client JOIN disp ON client.client_id = disp.client_id JOIN loan ON disp.account_id = loan.account_id WHERE client.gender = 'F' GROUP BY client.client_id ORDER BY SUM(loan.amount) DESC LIMIT 3;	financial
SELECT COUNT(DISTINCT client.client_id) FROM client JOIN disp ON client.client_id = disp.client_id JOIN `order` ON disp.account_id = `order`.account_id WHERE client.gender = 'M' AND client.birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND `order`.k_symbol = 'SIPO' AND `order`.amount > 4000;	financial
SELECT COUNT(*)  FROM account  JOIN district ON account.district_id = district.district_id  WHERE district.A2 = 'Beroun'  AND account.date > '1996-12-31';	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card cd ON d.disp_id = cd.disp_id WHERE c.gender = 'F' AND cd.type = 'junior';	financial
SELECT      (COUNT(DISTINCT CASE WHEN c.gender = 'F' THEN c.client_id END) * 1.0 / COUNT(DISTINCT c.client_id)) * 100  FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN district dist ON a.district_id = dist.district_id WHERE dist.A3 = 'Prague'	financial
SELECT      (COUNT(CASE WHEN c.gender = 'M' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM (     SELECT DISTINCT c.client_id, c.gender     FROM client c     JOIN disp d ON c.client_id = d.client_id     JOIN account a ON d.account_id = a.account_id     WHERE a.frequency = 'POPLATEK TYDNE' ) AS sub;	financial
SELECT COUNT(DISTINCT d.client_id)  FROM account a JOIN disp d ON a.account_id = d.account_id WHERE a.frequency = 'POPLATEK TYDNE'  AND d.type = 'OWNER';	financial
SELECT a.* FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 24    AND a.date < '1997-01-01'    AND l.amount = (     SELECT MIN(l2.amount)      FROM loan l2      JOIN account a2 ON l2.account_id = a2.account_id      WHERE l2.duration > 24        AND a2.date < '1997-01-01'   );	financial
SELECT a.account_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN district dist ON c.district_id = dist.district_id WHERE c.gender = 'F'   AND c.birth_date = (SELECT MIN(birth_date) FROM client WHERE gender = 'F')   AND dist.A11 = (     SELECT MIN(district.A11)     FROM district     JOIN client ON district.district_id = client.district_id     WHERE client.gender = 'F'        AND client.birth_date = (SELECT MIN(birth_date) FROM client WHERE gender = 'F')   )	financial
SELECT COUNT(*)  FROM client  JOIN district USING (district_id)  WHERE YEAR(birth_date) = 1920  AND A3 = 'east Bohemia';	financial
SELECT COUNT(*)  FROM loan  JOIN account ON loan.account_id = account.account_id  WHERE loan.duration = 24  AND account.frequency = 'POPLATEK TYDNE'	financial
SELECT AVG(l.amount)  FROM loan l WHERE l.status IN ('C', 'D')  AND EXISTS (     SELECT 1      FROM trans t      WHERE t.account_id = l.account_id      AND t.type = 'POPLATEK PO OBRATU' );	financial
SELECT c.client_id AS ID, c.district_id AS district  FROM client c  WHERE EXISTS (SELECT 1 FROM disp d WHERE d.client_id = c.client_id AND d.type = 'OWNER')  AND NOT EXISTS (SELECT 1 FROM disp d WHERE d.client_id = c.client_id AND d.type = 'DISPONENT');	financial
SELECT c.client_id, TIMESTAMPDIFF(YEAR, c.birth_date, CURDATE()) AS age FROM client c WHERE EXISTS (     SELECT 1 FROM card ca JOIN disp d ON ca.disp_id = d.disp_id     WHERE d.client_id = c.client_id AND ca.type = 'gold' ) AND EXISTS (     SELECT 1 FROM disp d WHERE d.client_id = c.client_id AND d.type = 'OWNER' );	financial
SELECT bond_type  FROM bond  GROUP BY bond_type  ORDER BY COUNT(*) DESC  LIMIT 1;	toxicology
SELECT COUNT(*)  FROM molecule m  WHERE m.label = '-'  AND EXISTS (     SELECT 1      FROM atom a      WHERE a.molecule_id = m.molecule_id      AND a.element = 'cl' );	toxicology
SELECT AVG(o_count) FROM (     SELECT m.molecule_id, COUNT(CASE WHEN a.element = 'o' THEN 1 END) AS o_count     FROM molecule m     LEFT JOIN atom a ON m.molecule_id = a.molecule_id     WHERE m.molecule_id IN (         SELECT b.molecule_id          FROM bond b         GROUP BY b.molecule_id         HAVING COUNT(*) = SUM(CASE WHEN bond_type = '-' THEN 1 ELSE 0 END)     )     GROUP BY m.molecule_id ) AS sub;	toxicology
SELECT      (SELECT COUNT(*) FROM bond WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+') AND bond_type = '-')      /      (SELECT COUNT(*) FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+')) AS average;	toxicology
SELECT COUNT(*) FROM molecule  WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'na')  AND label = '-';	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '#' AND m.label = '+'	toxicology
SELECT      SUM(CASE WHEN element = 'c' THEN 1 ELSE 0 END) / COUNT(atom_id) AS percentage FROM atom WHERE molecule_id IN (SELECT DISTINCT b.molecule_id FROM bond b WHERE b.bond_type = '=');	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '#';	toxicology
SELECT COUNT(*) FROM atom WHERE element != 'br'	toxicology
SELECT COUNT(*)  FROM molecule  WHERE molecule_id BETWEEN 'TR000' AND 'TR099'  AND label = '+'	toxicology
SELECT DISTINCT a.molecule_id FROM atom a WHERE a.element = 'c';	toxicology
SELECT element  FROM atom  WHERE atom_id IN (     SELECT atom_id FROM connected WHERE bond_id = 'TR004_8_9'      UNION      SELECT atom_id2 FROM connected WHERE bond_id = 'TR004_8_9' );	toxicology
SELECT DISTINCT a.element  FROM bond b  JOIN connected c ON b.bond_id = c.bond_id  JOIN atom a ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2  WHERE b.bond_type = '=';	toxicology
SELECT label  FROM molecule  JOIN atom USING (molecule_id)  WHERE element = 'h'  GROUP BY label  ORDER BY COUNT(*) DESC  LIMIT 1;	toxicology
SELECT b.bond_type  FROM bond b  JOIN connected c ON b.bond_id = c.bond_id  JOIN atom a ON c.atom_id = a.atom_id  WHERE a.element = 'cl'  UNION   SELECT b.bond_type  FROM bond b  JOIN connected c ON b.bond_id = c.bond_id  JOIN atom a ON c.atom_id2 = a.atom_id  WHERE a.element = 'cl';	toxicology
SELECT atom_id, atom_id2  FROM connected  JOIN bond USING (bond_id)  WHERE bond_type = '-';	toxicology
SELECT c.atom_id, c.atom_id2  FROM connected c  JOIN bond b ON c.bond_id = b.bond_id  JOIN molecule m ON b.molecule_id = m.molecule_id  WHERE m.label = '-';	toxicology
SELECT element FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '-' GROUP BY element HAVING COUNT(*) = (     SELECT MIN(cnt)      FROM (         SELECT COUNT(*) AS cnt          FROM atom          JOIN molecule ON atom.molecule_id = molecule.molecule_id          WHERE molecule.label = '-'          GROUP BY element     ) AS min_counts );	toxicology
SELECT bond_type  FROM bond  JOIN connected ON bond.bond_id = connected.bond_id  WHERE (atom_id = 'TR004_8' AND atom_id2 = 'TR004_20')     OR (atom_id = 'TR004_20' AND atom_id2 = 'TR004_8')	toxicology
SELECT label FROM (SELECT '+' AS label UNION SELECT '-' AS label) AS all_labels WHERE label NOT IN (SELECT m.label FROM molecule m WHERE EXISTS (SELECT 1 FROM atom a WHERE a.molecule_id = m.molecule_id AND a.element != 'sn'));	toxicology
SELECT COUNT(DISTINCT atom.atom_id)  FROM atom  WHERE atom.molecule_id IN (SELECT bond.molecule_id FROM bond WHERE bond.bond_type = '-')  AND (atom.element = 'i' OR atom.element = 's');	toxicology
SELECT connected.atom_id, connected.atom_id2 FROM connected JOIN bond ON connected.bond_id = bond.bond_id WHERE bond.bond_type = '#';	toxicology
SELECT atom_id2 AS connected_atom FROM connected WHERE atom_id IN (SELECT atom_id FROM atom WHERE molecule_id = 'TR181') UNION SELECT atom_id FROM connected WHERE atom_id2 IN (SELECT atom_id FROM atom WHERE molecule_id = 'TR181');	toxicology
SELECT      (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM molecule WHERE label = '+'))  FROM molecule  WHERE label = '+'  AND molecule_id NOT IN (SELECT DISTINCT molecule_id FROM atom WHERE element = 'f');	toxicology
SELECT (SUM(CASE WHEN bond_type = '#' THEN 1 ELSE 0 END) * 100.0 / COUNT(bond_id)) AS percent FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.label = '+'	toxicology
SELECT DISTINCT element  FROM atom  WHERE molecule_id = 'TR000'  ORDER BY element ASC  LIMIT 3;	toxicology
SELECT c.atom_id, c.atom_id2  FROM connected c  JOIN bond b ON c.bond_id = b.bond_id  WHERE b.molecule_id = 'TR001' AND c.bond_id = 'TR001_2_6'	toxicology
SELECT      (SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) -       SUM(CASE WHEN label = '-' THEN 1 ELSE 0 END)) AS difference FROM molecule;	toxicology
SELECT atom_id, atom_id2 FROM connected WHERE bond_id = 'TR000_2_5'	toxicology
SELECT bond_id FROM connected WHERE atom_id2 = 'TR000_2'	toxicology
SELECT DISTINCT molecule.molecule_id  FROM bond  JOIN molecule ON bond.molecule_id = molecule.molecule_id  WHERE bond.bond_type = '='  ORDER BY molecule.molecule_id  LIMIT 5;	toxicology
SELECT ROUND((SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) * 100.0 / COUNT(bond_id)),5) AS percent FROM bond WHERE molecule_id = 'TR008';	toxicology
SELECT ROUND((SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) * 100.0 / COUNT(molecule_id)), 3) AS percent FROM molecule;	toxicology
SELECT ROUND((SUM(CASE WHEN element = 'h' THEN 1 ELSE 0 END) / COUNT(atom_id) * 100)::numeric, 4) AS percent FROM atom WHERE molecule_id = 'TR206'	toxicology
SELECT bond_type FROM bond WHERE molecule_id = 'TR000';	toxicology
SELECT m.label, a.element  FROM molecule m  LEFT JOIN atom a ON m.molecule_id = a.molecule_id  WHERE m.molecule_id = 'TR060';	toxicology
SELECT      (SELECT bond_type       FROM bond       WHERE molecule_id = 'TR010'       GROUP BY bond_type       ORDER BY COUNT(*) DESC       LIMIT 1) AS majority_bond_type,     (SELECT label       FROM molecule       WHERE molecule_id = 'TR010') AS carcinogenic_label;	toxicology
SELECT m.molecule_id  FROM molecule m  WHERE m.label = '-'  AND EXISTS (SELECT 1 FROM bond b WHERE b.molecule_id = m.molecule_id AND b.bond_type = '-')  ORDER BY m.molecule_id  LIMIT 3;	toxicology
SELECT bond_id FROM bond WHERE molecule_id = 'TR006' ORDER BY bond_id ASC LIMIT 2;	toxicology
SELECT COUNT(DISTINCT c.bond_id)  FROM connected c  JOIN bond b ON c.bond_id = b.bond_id  WHERE (c.atom_id = 'TR009_12' OR c.atom_id2 = 'TR009_12')  AND b.molecule_id = 'TR009'	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE a.element = 'br' AND m.label = '+';	toxicology
SELECT bond.bond_type, connected.atom_id, connected.atom_id2  FROM bond  JOIN connected ON bond.bond_id = connected.bond_id  WHERE bond.bond_id = 'TR001_6_9';	toxicology
SELECT m.molecule_id, m.label  FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.atom_id = 'TR001_10';	toxicology
SELECT COUNT(DISTINCT molecule_id) FROM bond WHERE bond_type = '#';	toxicology
SELECT COUNT(DISTINCT bond_id) FROM connected WHERE atom_id LIKE 'TR%_19' OR atom_id2 LIKE 'TR%_19'	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR004';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '-'	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' AND SUBSTR(a.atom_id,7,2) BETWEEN '21' AND '25'	toxicology
SELECT bond.bond_id FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN atom a1 ON connected.atom_id = a1.atom_id JOIN atom a2 ON connected.atom_id2 = a2.atom_id WHERE (a1.element = 'p' AND a2.element = 'n') OR (a1.element = 'n' AND a2.element = 'p');	toxicology
SELECT m.label FROM molecule m WHERE m.molecule_id = (     SELECT molecule_id     FROM bond     WHERE bond_type = '='     GROUP BY molecule_id     ORDER BY COUNT(*) DESC     LIMIT 1 );	toxicology
SELECT AVG(bond_count) AS average_bonds FROM (     SELECT a.atom_id, COUNT(DISTINCT c.bond_id) AS bond_count     FROM atom a     LEFT JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2     WHERE a.element = 'i'     GROUP BY a.atom_id ) AS subquery;	toxicology
SELECT bond.bond_type, bond.bond_id FROM bond JOIN connected ON bond.bond_id = connected.bond_id WHERE connected.atom_id IN (     SELECT atom_id FROM atom WHERE SUBSTR(atom_id,7,2)+0 =45 ) OR connected.atom_id2 IN (     SELECT atom_id FROM atom WHERE SUBSTR(atom_id,7,2)+0 =45 );	toxicology
SELECT element FROM atom WHERE atom_id NOT IN (SELECT atom_id FROM connected UNION SELECT atom_id2 FROM connected);	toxicology
SELECT a.atom_id, a.element FROM atom a WHERE a.atom_id IN (     SELECT c.atom_id FROM connected c     JOIN bond b ON c.bond_id = b.bond_id     WHERE b.molecule_id = 'TR041' AND b.bond_type = '#'     UNION     SELECT c.atom_id2 FROM connected c     JOIN bond b ON c.bond_id = b.bond_id     WHERE b.molecule_id = 'TR041' AND b.bond_type = '#' );	toxicology
SELECT element  FROM atom  WHERE atom_id IN (     SELECT atom_id      FROM connected      WHERE bond_id = 'TR144_8_19'     UNION     SELECT atom_id2      FROM connected      WHERE bond_id = 'TR144_8_19' );	toxicology
SELECT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.label = '+' AND b.bond_type = '=' GROUP BY m.molecule_id HAVING COUNT(b.bond_id) = (     SELECT MAX(dbl_bonds)     FROM (         SELECT COUNT(bond_id) AS dbl_bonds         FROM bond         JOIN molecule m ON bond.molecule_id = m.molecule_id         WHERE m.label = '+' AND bond.bond_type = '='         GROUP BY bond.molecule_id     ) AS max_counts );	toxicology
SELECT element FROM (     SELECT a.element, COUNT(*) AS cnt     FROM molecule m     JOIN atom a ON m.molecule_id = a.molecule_id     WHERE m.label = '+'     GROUP BY a.element ) AS element_counts WHERE cnt = (SELECT MIN(cnt) FROM element_counts);	toxicology
SELECT atom_id2 AS atom_id FROM connected WHERE atom_id IN (SELECT atom_id FROM atom WHERE element = 'pb')  UNION  SELECT atom_id FROM connected WHERE atom_id2 IN (SELECT atom_id FROM atom WHERE element = 'pb')	toxicology
SELECT element FROM atom  WHERE atom_id IN (     SELECT atom_id FROM connected      WHERE bond_id IN (SELECT bond_id FROM bond WHERE bond_type = '#')     UNION     SELECT atom_id2 FROM connected      WHERE bond_id IN (SELECT bond_id FROM bond WHERE bond_type = '#') );	toxicology
WITH combo_counts AS (     SELECT          CONCAT(LEAST(a1.element, a2.element), '-', GREATEST(a1.element, a2.element)) AS combo,         COUNT(*) AS combo_count     FROM connected c1     JOIN atom a1 ON c1.atom_id = a1.atom_id     JOIN atom a2 ON c1.atom_id2 = a2.atom_id     WHERE c1.atom_id < c1.atom_id2     GROUP BY combo ), aggregates AS (     SELECT          MAX(combo_count) AS max_count,         SUM(combo_count) AS total_bonds     FROM combo_counts ) SELECT (max_count * 100.0 / total_bonds) AS percentage FROM aggregates;	toxicology
SELECT ROUND((SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) * 100.0 / COUNT(b.bond_id)), 5) AS proportion FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '-';	toxicology
SELECT COUNT(*) FROM atom WHERE element IN ('c', 'h')	toxicology
SELECT connected.atom_id2 FROM connected JOIN atom ON connected.atom_id2 = atom.atom_id WHERE atom.element = 's';	toxicology
SELECT DISTINCT bond.bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id WHERE connected.atom_id IN (SELECT atom_id FROM atom WHERE element = 'sn')    OR connected.atom_id2 IN (SELECT atom_id FROM atom WHERE element = 'sn');	toxicology
SELECT COUNT(DISTINCT a.element) FROM atom a WHERE a.molecule_id IN (SELECT m.molecule_id FROM molecule m WHERE NOT EXISTS (SELECT 1 FROM bond b WHERE b.molecule_id = m.molecule_id AND b.bond_type != '-'));	toxicology
SELECT COUNT(*)  FROM atom  WHERE molecule_id IN (     SELECT m.molecule_id      FROM molecule m      WHERE EXISTS (         SELECT 1          FROM bond b          WHERE b.molecule_id = m.molecule_id          AND b.bond_type = '#'     )      AND EXISTS (         SELECT 1          FROM atom a          WHERE a.molecule_id = m.molecule_id          AND a.element IN ('p', 'br')     ) )	toxicology
SELECT bond.bond_id FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.label = '+'	toxicology
SELECT m.molecule_id  FROM molecule m  WHERE m.label = '-'  AND m.molecule_id IN (SELECT b.molecule_id FROM bond b WHERE b.bond_type = '-');	toxicology
SELECT      SUM(CASE WHEN element = 'cl' THEN 1 ELSE 0 END) * 1.0 / COUNT(*) AS percent FROM (     SELECT a.element     FROM connected c     JOIN bond b ON c.bond_id = b.bond_id AND b.bond_type = '-'     JOIN atom a ON a.atom_id = c.atom_id     UNION ALL     SELECT a.element     FROM connected c     JOIN bond b ON c.bond_id = b.bond_id AND b.bond_type = '-'     JOIN atom a ON a.atom_id = c.atom_id2 ) AS all_elements;	toxicology
SELECT label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002')	toxicology
SELECT molecule_id FROM molecule WHERE label = '-'	toxicology
SELECT COUNT(*)  FROM molecule  WHERE label = '+'  AND molecule_id BETWEEN 'TR000' AND 'TR030';	toxicology
SELECT molecule_id, bond_type FROM bond WHERE molecule_id BETWEEN 'TR000' AND 'TR050';	toxicology
SELECT element FROM atom WHERE atom_id IN (SELECT atom_id FROM connected WHERE bond_id = 'TR001_10_11' UNION SELECT atom_id2 FROM connected WHERE bond_id = 'TR001_10_11');	toxicology
SELECT COUNT(DISTINCT c.bond_id)  FROM connected c  JOIN atom a1 ON c.atom_id = a1.atom_id  JOIN atom a2 ON c.atom_id2 = a2.atom_id  WHERE a1.element = 'i' OR a2.element = 'i';	toxicology
SELECT      CASE          WHEN (SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'ca' AND m.label = '+') >              (SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'ca' AND m.label = '-')          THEN '+'         ELSE '-'     END;	toxicology
SELECT      CASE WHEN EXISTS (         SELECT 1          FROM bond b         JOIN connected c ON b.bond_id = c.bond_id         JOIN atom a1 ON c.atom_id = a1.atom_id         JOIN atom a2 ON c.atom_id2 = a2.atom_id         WHERE b.bond_id = 'TR001_1_8'         AND ((a1.element = 'cl' AND a2.element = 'c') OR (a1.element = 'c' AND a2.element = 'cl'))     ) THEN 'Yes' ELSE 'No' END;	toxicology
SELECT molecule.molecule_id  FROM molecule  WHERE molecule.label = '-'  AND EXISTS (     SELECT 1      FROM bond      WHERE bond.molecule_id = molecule.molecule_id      AND bond.bond_type = '#' )  AND EXISTS (     SELECT 1      FROM atom      WHERE atom.molecule_id = molecule.molecule_id      AND atom.element = 'c' )  LIMIT 2;	toxicology
SELECT      (SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END) * 100.0 / COUNT(a.atom_id)) AS percentage FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      m.label = '+';	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR001';	toxicology
SELECT molecule_id FROM bond WHERE bond_type = '=';	toxicology
SELECT connected.atom_id, connected.atom_id2  FROM connected  JOIN bond ON connected.bond_id = bond.bond_id  WHERE bond.bond_type = '#';	toxicology
SELECT a1.element, a2.element, m.label  FROM bond b  JOIN connected c ON b.bond_id = c.bond_id  JOIN atom a1 ON a1.atom_id = c.atom_id  JOIN atom a2 ON a2.atom_id = c.atom_id2  JOIN molecule m ON m.molecule_id = b.molecule_id  WHERE b.bond_id = 'TR000_1_2'  LIMIT 1;	toxicology
SELECT COUNT(*)  FROM molecule m  WHERE m.label = '-'  AND NOT EXISTS (SELECT 1 FROM bond b WHERE b.molecule_id = m.molecule_id AND b.bond_type != '-');	toxicology
SELECT m.label  FROM bond b  JOIN molecule m ON b.molecule_id = m.molecule_id  WHERE b.bond_id = 'TR001_10_11';	toxicology
SELECT bond.bond_id, molecule.label FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_type = '#';	toxicology
SELECT element, COUNT(*) AS count  FROM atom  JOIN molecule USING (molecule_id)  WHERE substr(atom_id,7,1) = '4' AND label = '+'  GROUP BY element;	toxicology
SELECT      (SUM(CASE WHEN a.element = 'h' THEN 1 ELSE 0 END) * 1.0 / COUNT(a.element)) AS ratio,     m.label FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      a.molecule_id = 'TR006';	toxicology
SELECT DISTINCT m.label  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE a.element = 'ca';	toxicology
SELECT bond_type FROM bond WHERE molecule_id IN (SELECT DISTINCT molecule_id FROM atom WHERE element = 'c')	toxicology
SELECT element FROM atom WHERE atom_id IN (CONCAT(SUBSTR('TR001_10_11',1,5), '_', SUBSTR('TR001_10_11',7,2)), CONCAT(SUBSTR('TR001_10_11',1,5), '_', SUBSTR('TR001_10_11',10,2)))	toxicology
SELECT      ((SELECT COUNT(DISTINCT molecule_id) FROM bond WHERE bond_type = '#') * 100.0      /      (SELECT COUNT(*) FROM molecule)) AS percentage;	toxicology
SELECT      (SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) * 100.0 / COUNT(bond_id)) AS percent FROM bond WHERE molecule_id = 'TR047';	toxicology
SELECT label FROM molecule WHERE molecule_id = (SELECT molecule_id FROM atom WHERE atom_id = 'TR001_1')	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR151';	toxicology
SELECT DISTINCT element FROM atom WHERE molecule_id = 'TR151';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+'	toxicology
SELECT atom_id FROM atom WHERE element = 'c' AND (SUBSTR(molecule_id,3,3) >= 10 AND SUBSTR(molecule_id,3,3) <=50)	toxicology
SELECT COUNT(*)  FROM atom  JOIN molecule ON atom.molecule_id = molecule.molecule_id  WHERE molecule.label = '+';	toxicology
SELECT bond.bond_id FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_type = '=' AND molecule.label = '+';	toxicology
SELECT SUM(atom_count) AS total_atoms FROM (     SELECT COUNT(*) AS atom_count     FROM atom a     JOIN molecule m ON a.molecule_id = m.molecule_id     WHERE m.label = '+'     GROUP BY a.molecule_id     HAVING COUNT(CASE WHEN a.element = 'h' THEN 1 END) > 0 ) AS sub;	toxicology
SELECT bond.molecule_id  FROM bond  JOIN connected ON bond.bond_id = connected.bond_id  WHERE connected.atom_id = 'TR000_1'  AND bond.bond_id = 'TR000_1_2';	toxicology
SELECT atom.atom_id  FROM atom  JOIN molecule ON atom.molecule_id = molecule.molecule_id  WHERE atom.element = 'c'  AND molecule.label = '-';	toxicology
SELECT      (SELECT COUNT(*)       FROM molecule m      WHERE m.label = '+'      AND EXISTS (SELECT 1 FROM atom a WHERE a.molecule_id = m.molecule_id AND a.element = 'h')     ) * 100.0      / (SELECT COUNT(*) FROM molecule) AS percentage;	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR124';	toxicology
SELECT atom_id, element FROM atom WHERE molecule_id = 'TR186'	toxicology
SELECT bond_type FROM bond WHERE bond_id = 'TR007_4_19'	toxicology
SELECT a.element, a2.element FROM connected c JOIN atom a ON c.atom_id = a.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE c.bond_id = 'TR001_2_4'	toxicology
SELECT      (SELECT COUNT(*) FROM bond WHERE molecule_id = 'TR006' AND bond_type = '=') AS double_bonds,     (SELECT label FROM molecule WHERE molecule_id = 'TR006') AS carcinogenic;	toxicology
SELECT DISTINCT m.molecule_id, a.element FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+'	toxicology
SELECT bond.bond_id, bond.molecule_id, connected.atom_id, connected.atom_id2 FROM bond JOIN connected ON bond.bond_id = connected.bond_id WHERE bond.bond_type = '-';	toxicology
SELECT DISTINCT m.molecule_id, a.element FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.molecule_id IN (     SELECT b.molecule_id     FROM bond b     WHERE b.bond_type = '#' );	toxicology
SELECT element  FROM atom  WHERE atom_id IN (     SELECT atom_id FROM connected WHERE bond_id = 'TR000_2_3'     UNION     SELECT atom_id2 FROM connected WHERE bond_id = 'TR000_2_3' );	toxicology
SELECT COUNT(DISTINCT c.bond_id)  FROM connected c JOIN atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id WHERE a.element = 'cl';	toxicology
SELECT a.atom_id,         (SELECT COUNT(DISTINCT b.bond_type)          FROM bond b          WHERE b.molecule_id = 'TR346') AS bond_type_count FROM atom a WHERE a.molecule_id = 'TR346';	toxicology
SELECT      COUNT(DISTINCT b.molecule_id) AS total_double_bond_molecules,     COUNT(DISTINCT CASE WHEN m.label = '+' THEN b.molecule_id END) AS carcinogenic_count FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '=';	toxicology
SELECT COUNT(*) FROM molecule m WHERE  NOT EXISTS (SELECT 1 FROM atom a WHERE a.molecule_id = m.molecule_id AND a.element = 's') AND NOT EXISTS (SELECT 1 FROM bond b WHERE b.molecule_id = m.molecule_id AND b.bond_type = '=')	toxicology
SELECT m.label  FROM bond b  JOIN molecule m ON b.molecule_id = m.molecule_id  WHERE b.bond_id = 'TR001_2_4';	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR001'	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '-';	toxicology
SELECT DISTINCT m.molecule_id  FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'cl' AND m.label = '+'	toxicology
SELECT DISTINCT m.molecule_id  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE a.element = 'c' AND m.label = '-';	toxicology
SELECT      (CAST(SUM(has_cl) AS FLOAT) / COUNT(*)) * 100 AS percentage FROM (     SELECT m.molecule_id,             CASE WHEN EXISTS (SELECT 1 FROM atom a WHERE a.molecule_id = m.molecule_id AND a.element = 'cl') THEN 1 ELSE 0 END AS has_cl     FROM molecule m     WHERE m.label = '+' ) sub;	toxicology
SELECT molecule_id FROM bond WHERE bond_id = 'TR001_1_7';	toxicology
SELECT COUNT(DISTINCT a.element)  FROM connected AS c  JOIN atom AS a ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2  WHERE c.bond_id = 'TR001_3_4';	toxicology
SELECT bond_type  FROM bond  JOIN connected ON bond.bond_id = connected.bond_id  WHERE (atom_id = 'TR000_1' AND atom_id2 = 'TR000_2')     OR (atom_id = 'TR000_2' AND atom_id2 = 'TR000_1');	toxicology
SELECT a1.molecule_id  FROM atom a1  JOIN atom a2 ON a1.molecule_id = a2.molecule_id  WHERE a1.atom_id = 'TR000_2'  AND a2.atom_id = 'TR000_4';	toxicology
SELECT element FROM atom WHERE atom_id = 'TR000_1'	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR000';	toxicology
SELECT SUM(bond_type = '-') / COUNT(bond_id) AS percentage FROM bond;	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE m.label = '+'  AND a.element = 'n';	toxicology
SELECT DISTINCT b.molecule_id FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE b.bond_type = '=' AND (a1.element = 's' OR a2.element = 's');	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '-' GROUP BY m.molecule_id HAVING COUNT(a.atom_id) > 5	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.molecule_id = 'TR024' AND b.bond_type = '=';	toxicology
SELECT molecule_id FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+') GROUP BY molecule_id HAVING COUNT(*) = (     SELECT MAX(cnt)      FROM (         SELECT COUNT(*) AS cnt         FROM atom         WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+')         GROUP BY molecule_id     ) AS subquery )	toxicology
SELECT      (SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS percentage FROM (     SELECT DISTINCT m.molecule_id, m.label     FROM molecule m     JOIN atom a ON m.molecule_id = a.molecule_id AND a.element = 'h'     JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2     JOIN bond b ON c.bond_id = b.bond_id AND b.bond_type = '#' ) AS sub;	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+';	toxicology
SELECT COUNT(*) FROM molecule m WHERE m.molecule_id BETWEEN 'TR004' AND 'TR010' AND EXISTS (SELECT 1 FROM bond b WHERE b.molecule_id = m.molecule_id AND b.bond_type = '-');	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR008' AND element = 'c'	toxicology
SELECT element  FROM atom  JOIN molecule USING (molecule_id)  WHERE atom.atom_id = 'TR004_7' AND molecule.label = '-';	toxicology
SELECT COUNT(DISTINCT b.molecule_id)  FROM bond b  JOIN connected c ON b.bond_id = c.bond_id  JOIN atom a1 ON c.atom_id = a1.atom_id  JOIN atom a2 ON c.atom_id2 = a2.atom_id  WHERE b.bond_type = '=' AND (a1.element = 'o' OR a2.element = 'o');	toxicology
SELECT COUNT(*)  FROM molecule  WHERE molecule_id IN (SELECT DISTINCT molecule_id FROM bond WHERE bond_type = '#')  AND label = '-';	toxicology
SELECT element AS item FROM atom WHERE molecule_id = 'TR002' UNION ALL SELECT bond_type AS item FROM bond WHERE molecule_id = 'TR002'	toxicology
SELECT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '=' AND a.element = 'c' AND b.molecule_id = 'TR012';	toxicology
SELECT atom_id FROM atom WHERE molecule_id IN (SELECT m.molecule_id FROM molecule m WHERE m.label = '+' AND EXISTS (SELECT 1 FROM atom a WHERE a.molecule_id = m.molecule_id AND a.element = 'o'))	toxicology
SELECT * FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT * FROM cards  WHERE borderColor = 'borderless'  AND (cardKingdomFoilId IS NULL OR cardKingdomId IS NULL);	card_games
SELECT name FROM cards WHERE faceConvertedManaCost > convertedManaCost;	card_games
SELECT name FROM cards WHERE frameVersion = '2015' AND edhrecRank < 100;	card_games
SELECT cards.*  FROM cards  JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.rarity = 'mythic'  AND legalities.format = 'gladiator'  AND legalities.status = 'Banned';	card_games
SELECT cards.name, legalities.status FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.types = 'Artifact' AND cards.side IS NULL AND legalities.format = 'vintage';	card_games
SELECT cards.id, cards.artist FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.format = 'commander'  AND legalities.status = 'Legal'  AND (cards.power = '*' OR cards.power IS NULL);	card_games
SELECT c.id, r.text AS ruling_text, CASE WHEN c.hasContentWarning = 1 THEN 'Yes' ELSE 'No' END AS has_missing_degraded  FROM cards c  LEFT JOIN rulings r ON c.uuid = r.uuid  WHERE c.artist = 'Stephen Daniele';	card_games
SELECT rulings.date, rulings.text  FROM rulings  JOIN cards ON rulings.uuid = cards.uuid  WHERE cards.name = 'Sublime Epiphany'  AND cards.number = '74s';	card_games
SELECT c.name, c.artist, c.isPromo FROM cards c JOIN rulings r ON c.uuid = r.uuid GROUP BY c.uuid, c.name, c.artist HAVING COUNT(r.id) = (     SELECT MAX(cnt)     FROM (         SELECT COUNT(r.id) AS cnt         FROM cards c         JOIN rulings r ON c.uuid = r.uuid         GROUP BY c.uuid     ) AS subquery );	card_games
SELECT DISTINCT fd.language  FROM foreign_data AS fd JOIN cards AS c ON fd.uuid = c.uuid  WHERE c.name = 'Annul' AND c.number = '29';	card_games
SELECT DISTINCT c.name  FROM cards c  JOIN foreign_data f ON c.uuid = f.uuid  WHERE f.language = 'Japanese'	card_games
SELECT      ((         SELECT COUNT(DISTINCT uuid)          FROM foreign_data          WHERE language = 'Chinese Simplified'     ) * 100.0      /      (         SELECT COUNT(*)          FROM cards     )) AS percentage;	card_games
SELECT st.translation AS set_name, s.totalSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian';	card_games
SELECT COUNT(DISTINCT types) FROM cards WHERE artist = 'Aaron Boyd';	card_games
SELECT keywords FROM cards WHERE name = 'Angel of Mercy';	card_games
SELECT COUNT(*) FROM cards WHERE power = '*';	card_games
SELECT promoTypes FROM cards WHERE name = 'Duress';	card_games
SELECT borderColor FROM cards WHERE name = 'Ancestor''s Chosen';	card_games
SELECT originalType FROM cards WHERE name = 'Ancestor''s Chosen';	card_games
SELECT language  FROM set_translations  WHERE setCode = (SELECT setCode FROM cards WHERE name = 'Angel of Mercy');	card_games
SELECT COUNT(DISTINCT c.id)  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE l.status = 'restricted'  AND c.isTextless = 0	card_games
SELECT r.text  FROM rulings r  JOIN cards c ON r.uuid = c.uuid  WHERE c.name = 'Condemn';	card_games
SELECT COUNT(DISTINCT c.id)  FROM cards c  INNER JOIN legalities l ON c.uuid = l.uuid  WHERE l.status = 'restricted'  AND c.isStarter = 1;	card_games
SELECT l.format, l.status  FROM legalities l  JOIN cards c ON l.uuid = c.uuid  WHERE c.name = 'Cloudchaser Eagle';	card_games
SELECT type FROM cards WHERE name = 'Benalish Knight';	card_games
SELECT legalities.format, legalities.status  FROM cards  JOIN legalities ON cards.uuid = legalities.uuid  WHERE cards.name = 'Benalish Knight';	card_games
SELECT DISTINCT c.artist FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE f.language = 'Phyrexian';	card_games
SELECT      (CAST(SUM(CASE WHEN borderColor = 'borderless' THEN 1 ELSE 0 END) AS REAL) / COUNT(id)) * 100 AS percentage FROM cards;	card_games
SELECT COUNT(DISTINCT c.id)  FROM cards c  JOIN foreign_data f ON c.uuid = f.uuid  WHERE f.language = 'German'  AND c.isReprint = 1;	card_games
SELECT COUNT(DISTINCT c.id)  FROM cards c  JOIN foreign_data f ON c.uuid = f.uuid  WHERE c.borderColor = 'borderless'  AND f.language = 'Russian'	card_games
SELECT    (COUNT(CASE WHEN fd.language = 'French' THEN 1 END) * 100.0 /     COUNT(*)) AS percentage FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.isStorySpotlight = 1;	card_games
SELECT COUNT(*) FROM cards WHERE toughness = '99'	card_games
SELECT name FROM cards WHERE artist = 'Aaron Boyd';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND availability = 'mtgo';	card_games
SELECT id FROM cards WHERE convertedManaCost = 0;	card_games
SELECT DISTINCT layout FROM cards WHERE keywords LIKE '%flying%';	card_games
SELECT COUNT(*)  FROM cards  WHERE originalType = 'Summon - Angel'  AND subtypes <> 'Angel';	card_games
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT id FROM cards WHERE duelDeck = 'a'	card_games
SELECT edhrecRank FROM cards WHERE frameVersion = '2015'	card_games
SELECT c.artist  FROM cards c  JOIN foreign_data f ON c.uuid = f.uuid  WHERE f.language = 'Chinese Simplified';	card_games
SELECT DISTINCT c.*  FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.availability = 'paper'  AND f.language = 'Japanese';	card_games
SELECT COUNT(DISTINCT c.uuid)  FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.status = 'Banned'  AND c.borderColor = 'white'	card_games
SELECT c.uuid, f.language FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN foreign_data f ON c.uuid = f.uuid WHERE l.format = 'legacy';	card_games
SELECT r.date, r.text  FROM rulings r  JOIN cards c ON r.uuid = c.uuid  WHERE c.name = 'Beacon of Immortality';	card_games
SELECT      (SELECT COUNT(*) FROM cards WHERE frameVersion = 'future') AS future_frame_count,     l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.frameVersion = 'future' AND l.status = 'Legal' GROUP BY l.status;	card_games
SELECT name, colors FROM cards WHERE setCode = 'OGW'	card_games
SELECT c.name, GROUP_CONCAT(DISTINCT fd.language) AS languages FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.setCode = '10E'  AND c.convertedManaCost = 5 GROUP BY c.name;	card_games
SELECT cards.name, rulings.date FROM cards JOIN rulings ON cards.uuid = rulings.uuid WHERE cards.originalType = 'Creature - Elf';	card_games
SELECT c.id, c.colors, GROUP_CONCAT(DISTINCT l.format) AS formats FROM cards c LEFT JOIN legalities l ON c.uuid = l.uuid AND l.status = 'Legal' WHERE c.id BETWEEN 1 AND 20 GROUP BY c.id, c.colors;	card_games
SELECT DISTINCT c.*  FROM cards c WHERE c.originalType = 'Artifact'  AND c.colors = 'B'  AND EXISTS (     SELECT 1      FROM foreign_data f      WHERE f.uuid = c.uuid );	card_games
SELECT c.name  FROM cards c  JOIN rulings r ON c.uuid = r.uuid  WHERE c.rarity = 'uncommon'  GROUP BY c.uuid  ORDER BY MIN(r.date) ASC  LIMIT 3;	card_games
SELECT COUNT(*)  FROM cards  WHERE artist = 'John Avon'  AND (cardKingdomId IS NULL OR cardKingdomFoilId IS NULL);	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL	card_games
SELECT COUNT(*)  FROM cards  WHERE artist = 'UDON'  AND availability = 'mtgo'  AND hand = '-1'	card_games
SELECT COUNT(*) FROM cards  WHERE frameVersion = '1993'  AND availability = 'paper'  AND hasContentWarning = 1;	card_games
SELECT manaCost FROM cards WHERE layout = 'normal' AND frameVersion = '2003' AND borderColor = 'black' AND availability = 'mtgo,paper';	card_games
SELECT SUM(CAST(manaCost AS REAL)) FROM cards WHERE artist = 'Rob Alexander';	card_games
SELECT supertypes AS type FROM cards WHERE availability = 'arena' UNION SELECT subtypes AS type FROM cards WHERE availability = 'arena';	card_games
SELECT DISTINCT c.setCode  FROM cards c  JOIN foreign_data f ON c.uuid = f.uuid  WHERE f.language = 'Spanish';	card_games
SELECT (CAST(COUNT(CASE WHEN isOnlineOnly = 1 THEN 1 END) AS REAL) / COUNT(id)) * 100 AS percentage  FROM cards  WHERE frameEffects = 'legendary'	card_games
SELECT ROUND((CAST(COUNT(*) AS REAL) / (SELECT COUNT(*) FROM cards WHERE isStorySpotlight = 1)) * 100, 2) AS percentage FROM cards WHERE isStorySpotlight = 1 AND isTextless = 0; SELECT id FROM cards WHERE isStorySpotlight = 1 AND isTextless = 0;	card_games
SELECT      (COUNT(DISTINCT fd.uuid) * 100.0 / (SELECT COUNT(*) FROM cards)) AS percentage FROM foreign_data fd WHERE fd.language = 'Spanish';  SELECT DISTINCT c.name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Spanish';	card_games
SELECT set_translations.language FROM set_translations JOIN sets ON set_translations.setCode = sets.code WHERE sets.baseSetSize = 309;	card_games
SELECT COUNT(*)  FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.block = 'Commander'  AND st.language = 'Portuguese (Brasil)'	card_games
SELECT DISTINCT cards.id  FROM cards  JOIN legalities ON cards.uuid = legalities.uuid  WHERE cards.types = 'Creature'  AND legalities.status = 'Legal'	card_games
SELECT fd.type  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE fd.language = 'German'  AND c.subtypes IS NOT NULL  AND c.supertypes IS NOT NULL;	card_games
SELECT COUNT(*)  FROM cards  WHERE (power IS NULL OR power = '*')  AND text LIKE '%triggered ability%'	card_games
SELECT COUNT(*)  FROM cards WHERE EXISTS (     SELECT 1 FROM legalities      WHERE legalities.uuid = cards.uuid      AND legalities.format = 'premodern'      AND legalities.status = 'Legal' ) AND EXISTS (     SELECT 1 FROM rulings      WHERE rulings.uuid = cards.uuid      AND rulings.text = 'This is a triggered mana ability.' ) AND cards.side IS NULL;	card_games
SELECT cards.id FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.artist = 'Erica Yang' AND legalities.format = 'pauper' AND legalities.status = 'Legal' AND cards.availability = 'paper'	card_games
SELECT cards.artist FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'German' AND (foreign_data.flavorText LIKE '%Das perfekte Gegenmittel zu einer dichten Formation%'      OR foreign_data.text LIKE '%Das perfekte Gegenmittel zu einer dichten Formation%');	card_games
SELECT fd.name  FROM foreign_data fd  JOIN cards c ON fd.uuid = c.uuid  WHERE c.artist = 'Matthew D. Wilson'  AND c.layout = 'normal'  AND c.borderColor = 'black'  AND c.type LIKE '%Creature%'  AND fd.language = 'French'	card_games
SELECT COUNT(DISTINCT c.uuid)  FROM cards c  JOIN rulings r ON c.uuid = r.uuid  WHERE c.rarity = 'rare'  AND r.date = '2007-02-01'  AND r.text IS NOT NULL;	card_games
SELECT st.language  FROM set_translations st  JOIN sets s ON st.setCode = s.code  WHERE s.block = 'Ravnica'  AND s.baseSetSize = 180;	card_games
SELECT      (COUNT(CASE WHEN c.hasContentWarning = 0 THEN 1 END) * 100.0 / COUNT(*) ) AS percentage FROM legalities l JOIN cards c ON l.uuid = c.uuid WHERE l.format = 'commander' AND l.status = 'Legal';	card_games
SELECT      (COUNT(CASE WHEN fd.language = 'French' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.power IS NULL OR c.power = '*';	card_games
SELECT    (COUNT(DISTINCT CASE WHEN s.type = 'expansion' THEN st.setCode END) * 100.0 / COUNT(DISTINCT st.setCode)) AS percentage FROM    set_translations st   INNER JOIN sets s ON st.setCode = s.code WHERE    st.language = 'Japanese'	card_games
SELECT availability FROM cards WHERE artist = 'Daren Bader';	card_games
SELECT COUNT(*)  FROM cards  WHERE borderColor = 'borderless'  AND edhrecRank > 12000;	card_games
SELECT COUNT(*)  FROM cards  WHERE isOversized = 1  AND isReprint = 1  AND isPromo = 1	card_games
SELECT name  FROM cards  WHERE promoTypes = 'arenaleague'  AND (power IS NULL OR power = '*')  ORDER BY name ASC  LIMIT 3;	card_games
SELECT language FROM foreign_data WHERE multiverseid = 149934;	card_games
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL ORDER BY cardKingdomFoilId ASC LIMIT 3;	card_games
SELECT      (CAST(COUNT(CASE WHEN isTextless = 1 AND layout = 'normal' THEN 1 END) AS REAL) /       NULLIF(COUNT(CASE WHEN isTextless = 1 THEN 1 END), 0)) * 100  FROM cards;	card_games
SELECT number  FROM cards  WHERE side IS NULL  AND subtypes LIKE '%Angel%'  AND subtypes LIKE '%Wizard%'	card_games
SELECT name, code FROM sets WHERE mtgoCode IS NULL OR mtgoCode = '' ORDER BY name LIMIT 3;	card_games
SELECT DISTINCT st.language  FROM set_translations st  JOIN sets s ON st.setCode = s.code  WHERE s.code = 'ARC' AND s.mcmName = 'Archenemy';	card_games
SELECT s.name, st.translation  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE s.id = 5;	card_games
SELECT st.language, s.type  FROM sets AS s JOIN set_translations AS st ON s.code = st.setCode WHERE s.id = 206;	card_games
SELECT sets.code, sets.name  FROM sets  JOIN cards ON sets.code = cards.setCode  JOIN foreign_data ON cards.uuid = foreign_data.uuid  WHERE sets.block = 'Shadowmoor'  AND foreign_data.language = 'Italian'  GROUP BY sets.code, sets.name  ORDER BY sets.name ASC  LIMIT 2;	card_games
SELECT sets.id  FROM sets  WHERE sets.isForeignOnly = 0  AND sets.isFoilOnly = 1  AND EXISTS (     SELECT 1      FROM cards      JOIN foreign_data ON cards.uuid = foreign_data.uuid      WHERE cards.setCode = sets.code      AND foreign_data.language = 'Japanese' );	card_games
SELECT s.name, s.code, s.baseSetSize  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE st.language = 'Russian'  ORDER BY s.baseSetSize DESC  LIMIT 1;	card_games
SELECT (CAST(COUNT(c.isOnlineOnly = 1) AS REAL) / CAST(COUNT(c.isOnlineOnly) AS REAL)) * 100 AS percentage FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Chinese Simplified';	card_games
SELECT COUNT(*)  FROM sets s WHERE (s.mtgoCode IS NULL OR s.mtgoCode = '') AND EXISTS (SELECT 1 FROM set_translations st WHERE st.setCode = s.code AND st.language = 'Japanese') AND NOT EXISTS (SELECT 1 FROM set_translations st WHERE st.setCode = s.code AND st.language != 'Japanese')	card_games
SELECT id FROM cards WHERE borderColor = 'black';	card_games
SELECT COUNT(id) FROM cards WHERE frameEffects = 'extendedart'; SELECT id FROM cards WHERE frameEffects = 'extendedart';	card_games
SELECT name FROM cards WHERE borderColor = 'black' AND isFullArt = 1;	card_games
SELECT language FROM set_translations  JOIN sets ON set_translations.setCode = sets.code  WHERE sets.id = 174;	card_games
SELECT name FROM sets WHERE code = 'ALL';	card_games
SELECT DISTINCT fd.language  FROM foreign_data fd  JOIN cards c ON fd.uuid = c.uuid  WHERE c.name = 'A Pedra Fellwar';	card_games
SELECT code FROM sets WHERE releaseDate = '2007-07-13';	card_games
SELECT code, baseSetSize FROM sets WHERE block IN ('Masques', 'Mirage')	card_games
SELECT code FROM sets WHERE type = 'expansion';	card_games
SELECT fd.name AS foreign_name, c.type FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.watermark = 'Boros';	card_games
SELECT fd.language, fd.flavorText, c.type FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.watermark = 'colorpie';	card_games
SELECT (COUNT(CASE WHEN convertedManaCost = 10 THEN 1 END) / CAST(COUNT(*) AS REAL)) * 100  FROM cards  WHERE setCode = (SELECT code FROM sets WHERE name = 'Abyssal Horror');	card_games
SELECT code FROM sets WHERE type = 'commander';	card_games
SELECT fd.name AS foreign_name, c.type FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.watermark = 'Abzan';	card_games
SELECT fd.language, c.type  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE c.watermark = 'Azorius';	card_games
SELECT COUNT(*)  FROM cards  WHERE artist = 'Aaron Miller'  AND cardKingdomFoilId IS NOT NULL  AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*)  FROM cards  WHERE availability LIKE '%paper%'  AND hand = '3';	card_games
SELECT name FROM cards WHERE isTextless = 0;	card_games
SELECT manaCost FROM cards WHERE name = 'Ancestor`s Chosen';	card_games
SELECT COUNT(*)  FROM cards  WHERE borderColor = 'white'  AND (power IS NULL OR power = '*');	card_games
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL;	card_games
SELECT supertypes, subtypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer'	card_games
SELECT purchaseUrls FROM cards WHERE promoTypes = 'bundle'	card_games
SELECT COUNT(DISTINCT artist) FROM cards WHERE borderColor = 'black' AND availability LIKE '%arena%' AND availability LIKE '%mtgo%' AND artist IS NOT NULL;	card_games
SELECT      CASE          WHEN serra.convertedManaCost > shrine.convertedManaCost THEN 'Serra Angel'         ELSE 'Shrine Keeper'     END FROM      (SELECT convertedManaCost FROM cards WHERE name = 'Serra Angel') AS serra,     (SELECT convertedManaCost FROM cards WHERE name = 'Shrine Keeper') AS shrine;	card_games
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer';	card_games
SELECT name  FROM cards  WHERE frameVersion = '2003'  ORDER BY convertedManaCost DESC  LIMIT 3;	card_games
SELECT translation  FROM set_translations  WHERE language = 'Italian'  AND setCode = (SELECT setCode FROM cards WHERE name = 'Ancestor''s Chosen')	card_games
SELECT COUNT(*) FROM set_translations WHERE setCode IN (SELECT setCode FROM cards WHERE name = 'Angel of Mercy')	card_games
SELECT name FROM cards WHERE setCode = (SELECT setCode FROM set_translations WHERE translation = 'Hauptset Zehnte Edition')	card_games
SELECT * FROM cards  JOIN foreign_data ON cards.uuid = foreign_data.uuid  WHERE cards.name = 'Ancestor''s Chosen' AND foreign_data.language = 'Korean';	card_games
SELECT COUNT(*)  FROM cards  WHERE setCode = (SELECT setCode FROM set_translations WHERE translation = 'Hauptset Zehnte Edition')  AND artist = 'Adam Rex';	card_games
SELECT s.baseSetSize  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE st.translation = 'Hauptset Zehnte Edition'	card_games
SELECT translation  FROM set_translations  JOIN sets ON set_translations.setCode = sets.code  WHERE sets.name = 'Eighth Edition'  AND set_translations.language = 'Chinese Simplified';	card_games
SELECT * FROM cards  JOIN sets ON cards.setCode = sets.code  WHERE cards.name = 'Angel of Mercy'  AND sets.mtgoCode IS NOT NULL;	card_games
SELECT s.releaseDate  FROM cards c  JOIN sets s ON c.setCode = s.code  WHERE c.name = 'Ancestor''s Chosen'	card_games
SELECT sets.type FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE set_translations.translation = 'Hauptset Zehnte Edition';	card_games
SELECT COUNT(*)  FROM sets  WHERE block = 'Ice Age'  AND EXISTS (     SELECT 1      FROM set_translations      WHERE set_translations.setCode = sets.code      AND language = 'Italian'      AND translation IS NOT NULL );	card_games
SELECT s.isForeignOnly  FROM sets s  JOIN cards c ON s.code = c.setCode  WHERE c.name = 'Adarkar Valkyrie';	card_games
SELECT COUNT(*)  FROM sets s JOIN set_translations st ON s.code = st.setCode  WHERE st.language = 'Italian'  AND st.translation IS NOT NULL  AND s.baseSetSize < 10;	card_games
SELECT COUNT(*)  FROM cards  JOIN sets ON cards.setCode = sets.code  WHERE sets.name = 'Coldsnap'  AND cards.borderColor = 'black'	card_games
SELECT name  FROM cards  WHERE setCode = (SELECT code FROM sets WHERE name = 'Coldsnap')  AND convertedManaCost = (     SELECT MAX(convertedManaCost)      FROM cards      WHERE setCode = (SELECT code FROM sets WHERE name = 'Coldsnap') );	card_games
SELECT DISTINCT artist  FROM cards  WHERE setCode = (SELECT code FROM sets WHERE name = 'Coldsnap')  AND artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy');	card_games
SELECT * FROM cards  WHERE setCode = (SELECT code FROM sets WHERE name = 'Coldsnap')  AND number = '4';	card_games
SELECT COUNT(*)  FROM cards  WHERE setCode = (SELECT code FROM sets WHERE name = 'Coldsnap')  AND convertedManaCost > 5  AND (power = '*' OR power IS NULL);	card_games
SELECT foreign_data.flavorText  FROM foreign_data  JOIN cards ON foreign_data.uuid = cards.uuid  WHERE cards.name = 'Ancestor''s Chosen'  AND foreign_data.language = 'Italian';	card_games
SELECT DISTINCT fd.language FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE c.name = 'Ancestor''s Chosen' AND fd.flavorText IS NOT NULL;	card_games
SELECT fd.type  FROM foreign_data AS fd JOIN cards AS c ON fd.uuid = c.uuid WHERE c.name = 'Ancestor''s Chosen'  AND fd.language = 'German';	card_games
SELECT fd.text  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  JOIN sets s ON c.setCode = s.code  WHERE s.name = 'Coldsnap'  AND fd.language = 'Italian';	card_games
SELECT fd.name FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap'   AND fd.language = 'Italian'   AND c.convertedManaCost = (     SELECT MAX(convertedManaCost)      FROM cards      WHERE setCode = s.code   );	card_games
SELECT rulings.date  FROM rulings  JOIN cards ON rulings.uuid = cards.uuid  WHERE cards.name = 'Reminisce';	card_games
SELECT      (CAST(SUM(CASE WHEN c.convertedManaCost = 7 THEN 1 ELSE 0 END) AS REAL) /       SUM(c.convertedManaCost)) * 100 AS percentage FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap';	card_games
SELECT      (CAST(SUM(CASE WHEN c.cardKingdomFoilId IS NOT NULL AND c.cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) AS REAL) /       CAST(COUNT(*) AS REAL)) * 100 AS percentage FROM      cards c JOIN      sets s ON c.setCode = s.code WHERE      s.name = 'Coldsnap'	card_games
SELECT code FROM sets WHERE releaseDate = '2017-07-14';	card_games
SELECT keyruneCode FROM sets WHERE code = 'PKHC';	card_games
SELECT mcmId FROM sets WHERE code = 'SS2';	card_games
SELECT mcmName FROM sets WHERE releaseDate = '2017-06-09';	card_games
SELECT type FROM sets WHERE name = 'From the Vault: Lore'	card_games
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized'	card_games
SELECT c.name, r.text AS ruling_text, CASE WHEN c.hasContentWarning = 1 THEN 'Missing/Degraded Properties Present' ELSE 'No Missing/Degraded Properties' END AS property_status FROM cards c LEFT JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Jim Pavelec'	card_games
SELECT releaseDate  FROM sets  JOIN cards ON sets.code = cards.setCode  WHERE cards.name = 'Evacuation';	card_games
SELECT s.baseSetSize  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE st.translation = 'Rinascita di Alara'	card_games
SELECT sets.type  FROM set_translations  JOIN sets ON set_translations.setCode = sets.code  WHERE set_translations.translation = 'Huitième édition';	card_games
SELECT st.translation FROM set_translations st JOIN sets s ON st.setCode = s.code JOIN cards c ON c.setCode = s.code JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.name = 'Tendo Ice Bridge' AND fd.language = 'French' AND st.language = 'French';	card_games
SELECT COUNT(*)  FROM set_translations  WHERE setCode = (SELECT code FROM sets WHERE name = 'Tenth Edition')  AND translation IS NOT NULL;	card_games
SELECT translation  FROM set_translations  WHERE setCode = (SELECT setCode FROM cards WHERE name = 'Fellwar Stone')  AND language = 'Japanese'	card_games
SELECT c.name  FROM cards c  JOIN sets s ON c.setCode = s.code  WHERE s.name = 'Journey into Nyx Hero''s Path'      AND c.convertedManaCost IS NOT NULL  ORDER BY c.convertedManaCost DESC  LIMIT 1;	card_games
SELECT sets.releaseDate  FROM sets  JOIN set_translations ON sets.code = set_translations.setCode  WHERE set_translations.translation = 'Ola de frío';	card_games
SELECT s.type  FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Samite Pilgrim';	card_games
SELECT COUNT(*)  FROM cards  JOIN sets ON cards.setCode = sets.code  WHERE sets.name = 'World Championship Decks 2004'  AND cards.convertedManaCost = 3;	card_games
SELECT st.translation  FROM set_translations st  JOIN sets s ON st.setCode = s.code  WHERE s.name = 'Mirrodin' AND st.language = 'Chinese Simplified';	card_games
SELECT      (COUNT(DISTINCT CASE WHEN s.isNonFoilOnly = 1 THEN c.uuid END) * 100.0 /       COUNT(DISTINCT c.uuid)) AS percentage FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid JOIN sets s ON c.setCode = s.code WHERE fd.language = 'Japanese';	card_games
SELECT      (SUM(isOnlineOnly) * 100.0 / COUNT(*)) AS percentage FROM (     SELECT DISTINCT c.uuid, c.isOnlineOnly     FROM cards c     JOIN foreign_data fd ON c.uuid = fd.uuid     WHERE fd.language = 'Portuguese (Brazil)' );	card_games
SELECT DISTINCT availability FROM cards WHERE artist = 'Aleksi Briclot' AND isTextless = 1;	card_games
SELECT id FROM sets WHERE baseSetSize = (SELECT MAX(baseSetSize) FROM sets);	card_games
SELECT artist  FROM cards  WHERE convertedManaCost = (SELECT MAX(convertedManaCost) FROM cards WHERE side IS NULL) AND side IS NULL;	card_games
SELECT frameEffects  FROM cards  WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL  GROUP BY frameEffects  ORDER BY COUNT(*) DESC  LIMIT 1;	card_games
SELECT COUNT(*)  FROM cards  WHERE (power IS NULL OR power = '*')  AND hasFoil = 0  AND duelDeck = 'a'	card_games
SELECT id FROM sets WHERE type = 'commander' AND totalSetSize = (SELECT MAX(totalSetSize) FROM sets WHERE type = 'commander') LIMIT 1;	card_games
SELECT cards.name, cards.convertedManaCost FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.format = 'duel' AND legalities.status = 'Legal' ORDER BY cards.convertedManaCost DESC LIMIT 10;	card_games
SELECT      (SELECT MIN(originalReleaseDate) FROM cards WHERE rarity = 'mythic') AS release_date,     GROUP_CONCAT(DISTINCT legalities.format) AS legal_formats FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE      cards.rarity = 'mythic'     AND cards.originalReleaseDate = (SELECT MIN(originalReleaseDate) FROM cards WHERE rarity = 'mythic')     AND legalities.status = 'Legal';	card_games
SELECT COUNT(DISTINCT c.id)  FROM cards c  JOIN foreign_data f ON c.uuid = f.uuid  WHERE c.artist = 'Volkan Baǵa'  AND f.language = 'French'	card_games
SELECT COUNT(*)  FROM cards c WHERE c.rarity = 'rare'  AND c.types = 'Enchantment'  AND c.name = 'Abundance' AND NOT EXISTS (     SELECT 1      FROM legalities l      WHERE l.uuid = c.uuid      AND l.status != 'Legal' );	card_games
SELECT      l.format,      COUNT(*) AS banned_count,     GROUP_CONCAT(c.name) AS card_names FROM legalities l JOIN cards c ON l.uuid = c.uuid WHERE l.status = 'Banned' GROUP BY l.format HAVING banned_count = (     SELECT MAX(sub.cnt)     FROM (         SELECT COUNT(*) AS cnt         FROM legalities         WHERE status = 'Banned'         GROUP BY format     ) sub )	card_games
SELECT language FROM set_translations WHERE setCode = (SELECT code FROM sets WHERE name = 'Battlebond')	card_games
SELECT l.format  FROM legalities l  JOIN cards c ON l.uuid = c.uuid  WHERE c.artist = (     SELECT artist      FROM cards      WHERE artist IS NOT NULL      GROUP BY artist      ORDER BY COUNT(*) ASC      LIMIT 1 );	card_games
SELECT l.status  FROM legalities l  JOIN cards c ON l.uuid = c.uuid  WHERE c.frameVersion = '1997'  AND c.artist = 'D. Alexander Gregory'  AND c.hasContentWarning = 1  AND l.format = 'legacy'	card_games
SELECT c.name, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.edhrecRank = 1 AND l.status = 'Banned';	card_games
SELECT      (SELECT AVG(cnt) FROM (         SELECT COUNT(*) AS cnt          FROM sets          WHERE releaseDate BETWEEN '2012-01-01' AND '2015-12-31'          GROUP BY strftime('%Y', releaseDate)     )) AS annual_average,     (SELECT language       FROM foreign_data       GROUP BY language       ORDER BY COUNT(*) DESC       LIMIT 1) AS common_language;	card_games
SELECT DISTINCT artist  FROM cards  WHERE borderColor = 'black' AND availability = 'arena'	card_games
SELECT uuid FROM legalities WHERE format = 'oldschool' AND status IN ('banned', 'restricted');	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability = 'paper'	card_games
SELECT rulings.text, rulings.date FROM rulings JOIN cards ON rulings.uuid = cards.uuid WHERE cards.artist = 'Kev Walker' ORDER BY rulings.date DESC;	card_games
SELECT cards.name, legalities.format FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.setCode = (SELECT code FROM sets WHERE name = 'Hour of Devastation') AND legalities.status = 'Legal'	card_games
SELECT s.name  FROM sets s  WHERE EXISTS (     SELECT 1      FROM set_translations st      WHERE st.setCode = s.code      AND st.language = 'Korean' )  AND NOT EXISTS (     SELECT 1      FROM set_translations st      WHERE st.setCode = s.code      AND st.language LIKE '%Japanese%' );	card_games
SELECT c.frameVersion, c.name,        CASE WHEN MAX(l.status = 'Banned') THEN 'Yes' ELSE 'No' END AS isBanned FROM cards c LEFT JOIN legalities l ON c.uuid = l.uuid WHERE c.artist = 'Allen Williams' GROUP BY c.uuid;	card_games
SELECT      CASE          WHEN MAX(CASE WHEN DisplayName = 'Harlan' THEN Reputation END) >               MAX(CASE WHEN DisplayName = 'Jarrod Dixon' THEN Reputation END)               THEN 'Harlan'          ELSE 'Jarrod Dixon'      END  FROM users  WHERE DisplayName IN ('Harlan', 'Jarrod Dixon')	codebase_community
SELECT DisplayName FROM users WHERE YEAR(CreationDate) = 2011;	codebase_community
SELECT COUNT(*) FROM users WHERE LastAccessDate > '2014-09-01'	codebase_community
SELECT DisplayName  FROM users  WHERE Views = (SELECT MAX(Views) FROM users)	codebase_community
SELECT COUNT(*)  FROM users  WHERE UpVotes > 100 AND DownVotes > 1	codebase_community
SELECT COUNT(*) FROM users WHERE Views > 10 AND YEAR(CreationDate) > 2013	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')	codebase_community
SELECT p.Title  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.DisplayName = 'csgillespie'	codebase_community
SELECT users.DisplayName  FROM posts  JOIN users ON posts.OwnerUserId = users.Id  WHERE posts.Title = 'Eliciting priors from experts';	codebase_community
SELECT Title  FROM posts  WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')  ORDER BY ViewCount DESC  LIMIT 1;	codebase_community
SELECT users.DisplayName  FROM users  JOIN posts ON users.Id = posts.OwnerUserId  WHERE posts.FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts);	codebase_community
SELECT SUM(p.CommentCount)  FROM posts p  WHERE p.OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')	codebase_community
SELECT AnswerCount  FROM posts  WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')  ORDER BY AnswerCount DESC  LIMIT 1;	codebase_community
SELECT users.DisplayName  FROM posts  JOIN users ON users.Id = posts.LastEditorUserId  WHERE posts.Title = 'Examples for teaching: Correlation does not mean causation'	codebase_community
SELECT COUNT(p.Id)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.DisplayName = 'csgillespie' AND p.ParentId IS NULL	codebase_community
SELECT DISTINCT u.DisplayName  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE p.ClosedDate IS NOT NULL	codebase_community
SELECT COUNT(p.Id)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.Age > 65  AND p.Score >= 20;	codebase_community
SELECT u.Location  FROM users u  JOIN posts p ON u.Id = p.OwnerUserId  WHERE p.Title = 'Eliciting priors from experts'	codebase_community
SELECT Body FROM posts WHERE Id = (SELECT ExcerptPostId FROM tags WHERE TagName = 'bayesian')	codebase_community
SELECT Body FROM posts WHERE Id = (SELECT ExcerptPostId FROM tags WHERE Count = (SELECT MAX(Count) FROM tags) AND ExcerptPostId IS NOT NULL)	codebase_community
SELECT COUNT(*) FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')	codebase_community
SELECT b.Name  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT COUNT(*)  FROM badges  WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')  AND YEAR(Date) = 2011	codebase_community
SELECT u.DisplayName  FROM users u  JOIN badges b ON u.Id = b.UserId  GROUP BY u.Id  ORDER BY COUNT(b.Id) DESC  LIMIT 1;	codebase_community
SELECT AVG(p.Score)  FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'csgillespie'	codebase_community
SELECT AVG(badge_count) FROM (SELECT COUNT(b.Id) AS badge_count FROM users u LEFT JOIN badges b ON u.Id = b.UserId WHERE u.Views > 200 GROUP BY u.Id) AS subquery;	codebase_community
SELECT (COUNT(CASE WHEN u.Age > 65 THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM posts p LEFT JOIN users u ON p.OwnerUserId = u.Id WHERE p.Score >5;	codebase_community
SELECT COUNT(*) FROM votes WHERE UserId = 58 AND CreationDate = '2010-07-19'	codebase_community
SELECT CreationDate  FROM (     SELECT CreationDate, COUNT(*) AS vote_count      FROM votes      GROUP BY CreationDate ) AS sub  WHERE vote_count = (     SELECT MAX(vote_count)      FROM (         SELECT COUNT(*) AS vote_count          FROM votes          GROUP BY CreationDate     ) AS sub2 )	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = 'Revival'	codebase_community
SELECT p.Title  FROM posts p  JOIN comments c ON p.Id = c.PostId  WHERE c.Score = (SELECT MAX(Score) FROM comments);	codebase_community
SELECT COUNT(*)  FROM comments  WHERE PostId = (SELECT Id FROM posts WHERE ViewCount = 1910);	codebase_community
SELECT FavoriteCount  FROM posts  WHERE Id = (     SELECT PostId      FROM comments      WHERE UserId = 3025      AND CreationDate = '2014-04-23 20:29:39.0' );	codebase_community
SELECT Text FROM comments WHERE PostId = (SELECT Id FROM posts WHERE ParentId = 107829 AND CommentCount = 1);	codebase_community
SELECT p.ClosedDate IS NOT NULL AS IsWellFinished FROM posts p WHERE p.Id = (     SELECT c.PostId     FROM comments c     WHERE c.UserId = 23853 AND c.CreationDate = '2013-07-12 09:08:18.0' );	codebase_community
SELECT Reputation FROM users WHERE Id = (SELECT OwnerUserId FROM posts WHERE Id = 65041);	codebase_community
SELECT COUNT(*)  FROM posts  WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Tiago Pasqualini')	codebase_community
SELECT users.DisplayName  FROM votes  JOIN users ON votes.UserId = users.Id  WHERE votes.Id = 6347;	codebase_community
SELECT COUNT(*)  FROM votes v  JOIN posts p ON v.PostId = p.Id  WHERE p.Title LIKE '%data visualization%';	codebase_community
SELECT Name FROM badges  JOIN users ON badges.UserId = users.Id  WHERE users.DisplayName = 'DatEpicCoderGuyWhoPrograms'	codebase_community
SELECT (SELECT COUNT(p.Id) FROM posts p WHERE p.OwnerUserId = 24) / (SELECT COUNT(v.Id) FROM votes v WHERE v.UserId = 24)	codebase_community
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer';	codebase_community
SELECT Text FROM comments WHERE Score = 17	codebase_community
SELECT DisplayName  FROM users  WHERE WebsiteUrl = 'http://stackoverflow.com'	codebase_community
SELECT Name FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'SilentGhost')	codebase_community
SELECT u.DisplayName  FROM users u  JOIN comments c ON u.Id = c.UserId  WHERE c.Text = 'thank you user93!'	codebase_community
SELECT c.Text  FROM comments c  JOIN users u ON c.UserId = u.Id  WHERE u.DisplayName = 'A Lion'	codebase_community
SELECT u.DisplayName, u.Reputation FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Understanding what Dassault iSight is doing?';	codebase_community
SELECT c.Text  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE p.Title = 'How does gentle boosting differ from AdaBoost?';	codebase_community
SELECT u.DisplayName  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE b.Name = 'Necromancer'  LIMIT 10;	codebase_community
SELECT users.DisplayName  FROM posts  JOIN users ON posts.LastEditorUserId = users.Id  WHERE posts.Title = 'Open source tools for visualizing multi-dimensional data?';	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Vebjorn Ljosa'	codebase_community
SELECT u.WebsiteUrl, SUM(p.Score) AS TotalScore FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Yevgeny' GROUP BY u.WebsiteUrl;	codebase_community
SELECT * FROM comments  WHERE UserId = (     SELECT LastEditorUserId      FROM posts      WHERE Title = 'Why square the difference instead of taking the absolute value in standard deviation?' );	codebase_community
SELECT SUM(v.BountyAmount)  FROM posts p  JOIN votes v ON p.Id = v.PostId  WHERE p.Title LIKE '%data%'	codebase_community
SELECT users.DisplayName  FROM votes  JOIN posts ON votes.PostId = posts.Id  JOIN users ON votes.UserId = users.Id  WHERE votes.BountyAmount = 50  AND posts.Title LIKE '%variance%'	codebase_community
SELECT p.Title, c.Text AS Comment, AVG(p.ViewCount) OVER() AS AverageViewCount FROM Posts p LEFT JOIN Comments c ON p.Id = c.PostId WHERE p.Tags LIKE '%<humor>%';	codebase_community
SELECT COUNT(*) FROM comments WHERE UserId = 13;	codebase_community
SELECT Id FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users)	codebase_community
SELECT Id FROM users WHERE Views = (SELECT MIN(Views) FROM users);	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Supporter' AND YEAR(Date) = 2011;	codebase_community
SELECT COUNT(*) FROM (SELECT UserId FROM badges GROUP BY UserId HAVING COUNT(Name) > 5) AS sub;	codebase_community
SELECT COUNT(*)  FROM users u WHERE u.Location = 'New York' AND EXISTS (SELECT 1 FROM badges WHERE UserId = u.Id AND Name = 'Teacher') AND EXISTS (SELECT 1 FROM badges WHERE UserId = u.Id AND Name = 'Supporter');	codebase_community
SELECT users.DisplayName, users.Reputation  FROM posts  JOIN users ON posts.OwnerUserId = users.Id  WHERE posts.Id = 1;	codebase_community
SELECT OwnerUserId FROM (     SELECT p.OwnerUserId, p.Id, p.ViewCount, COUNT(ph.Id) AS cnt     FROM posts p     LEFT JOIN postHistory ph ON p.Id = ph.PostId     GROUP BY p.Id, p.OwnerUserId, p.ViewCount ) AS sub GROUP BY OwnerUserId HAVING      SUM(CASE WHEN ViewCount >= 1000 THEN 1 ELSE 0 END) =      SUM(CASE WHEN ViewCount >= 1000 AND cnt = 1 THEN 1 ELSE 0 END)     AND      SUM(CASE WHEN ViewCount >= 1000 THEN 1 ELSE 0 END) >= 1	codebase_community
SELECT b.UserId, b.Name  FROM badges b  INNER JOIN (     SELECT UserId      FROM comments      WHERE UserId IS NOT NULL      GROUP BY UserId      HAVING COUNT(*) = (         SELECT MAX(c.cnt)          FROM (             SELECT COUNT(*) AS cnt              FROM comments              WHERE UserId IS NOT NULL              GROUP BY UserId         ) AS c     ) ) AS top_users ON b.UserId = top_users.UserId	codebase_community
SELECT COUNT(DISTINCT u.Id)  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE b.Name = 'Teacher' AND u.Location = 'India'	codebase_community
SELECT      ((CAST(cnt_2010 AS REAL) / total * 100) - (CAST(cnt_2011 AS REAL) / total * 100)) AS percentage_difference FROM (     SELECT          SUM(CASE WHEN strftime('%Y', Date) = '2010' THEN 1 ELSE 0 END) AS cnt_2010,         SUM(CASE WHEN strftime('%Y', Date) = '2011' THEN 1 ELSE 0 END) AS cnt_2011,         COUNT(*) AS total     FROM badges     WHERE Name = 'Student' );	codebase_community
SELECT      (SELECT GROUP_CONCAT(DISTINCT PostHistoryTypeId) FROM postHistory WHERE PostId = 3720) AS post_history_type_ids,     (SELECT COUNT(DISTINCT UserId) FROM comments WHERE PostId = 3720) AS unique_commenters_count;	codebase_community
SELECT p.Id, p.ViewCount  FROM posts p  JOIN (     SELECT RelatedPostId AS post_id FROM postLinks WHERE PostId = 61217      UNION      SELECT PostId AS post_id FROM postLinks WHERE RelatedPostId = 61217 ) AS related ON p.Id = related.post_id;	codebase_community
SELECT p.Score, pl.LinkTypeId FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE p.Id = 395;	codebase_community
SELECT Id AS PostID, OwnerUserId AS UserID FROM posts WHERE Score > 60;	codebase_community
SELECT SUM(FavoriteCount) FROM posts WHERE OwnerUserId = 686 AND strftime('%Y', CreaionDate) = '2011'	codebase_community
SELECT AVG(u.UpVotes) AS average_upvotes, AVG(u.Age) AS average_age FROM users u WHERE u.Id IN (     SELECT p.OwnerUserId     FROM posts p     GROUP BY p.OwnerUserId     HAVING COUNT(p.Id) > 10 )	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Announcer'	codebase_community
SELECT Name FROM badges WHERE Date = '2010-07-19 19:39:08.0'	codebase_community
SELECT COUNT(*) FROM comments WHERE Score > 60	codebase_community
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:25:47.0';	codebase_community
SELECT COUNT(*) FROM posts WHERE Score = 10;	codebase_community
SELECT Name  FROM badges  WHERE UserId IN (     SELECT Id      FROM users      WHERE Reputation = (SELECT MAX(Reputation) FROM users) )	codebase_community
SELECT u.Reputation  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE b.Date = '2010-07-19 19:39:08.0'	codebase_community
SELECT Name FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Pierre')	codebase_community
SELECT Date FROM badges  JOIN users ON badges.UserId = users.Id  WHERE users.Location = 'Rochester, NY'	codebase_community
SELECT      ( (SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Teacher')        /        (SELECT COUNT(*) FROM users)      ) * 100 AS percentage;	codebase_community
SELECT      (COUNT(CASE WHEN u.Age BETWEEN 13 AND 18 THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM      badges b JOIN      users u ON b.UserId = u.Id WHERE      b.Name = 'Organizer'	codebase_community
SELECT c.Score  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE p.CreaionDate = '2010-07-19 19:19:56.0'	codebase_community
SELECT c.Text  FROM comments c INNER JOIN posts p ON c.PostId = p.Id WHERE p.CreaionDate = '2010-07-19 19:37:33.0'	codebase_community
SELECT users.Age  FROM users  JOIN badges ON users.Id = badges.UserId  WHERE users.Location = 'Vienna, Austria'	codebase_community
SELECT COUNT(DISTINCT users.Id)  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE badges.Name = 'Supporter'  AND users.Age BETWEEN 19 AND 65;	codebase_community
SELECT SUM(u.Views)  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE b.Date = '2010-07-19 19:39:08.0'	codebase_community
SELECT DISTINCT b.Name  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.Reputation = (SELECT MIN(Reputation) FROM users)	codebase_community
SELECT Name  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE users.DisplayName = 'Sharpie'	codebase_community
SELECT COUNT(DISTINCT u.Id)  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE b.Name = 'Supporter' AND u.Age > 65;	codebase_community
SELECT DisplayName FROM users WHERE Id = 30;	codebase_community
SELECT COUNT(*) FROM users WHERE Location = 'New York'	codebase_community
SELECT COUNT(*) FROM votes WHERE YEAR(CreationDate) = 2010;	codebase_community
SELECT COUNT(*)  FROM users  WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT DisplayName  FROM users  WHERE Views = (SELECT MAX(Views) FROM users)	codebase_community
SELECT      (SELECT COUNT(*) FROM votes WHERE YEAR(CreationDate) = 2010)      /      (SELECT COUNT(*) FROM votes WHERE YEAR(CreationDate) = 2011) AS ratio;	codebase_community
SELECT DISTINCT t.TagName  FROM tags t  JOIN posts p ON p.Tags LIKE '%' || '<' || t.TagName || '>' || '%'  WHERE p.OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'John Salvatier');	codebase_community
SELECT COUNT(*)  FROM posts  WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Daniel Vassallo')	codebase_community
SELECT COUNT(*)  FROM votes v  JOIN users u ON v.UserId = u.Id  WHERE u.DisplayName = 'Harlan';	codebase_community
SELECT Id FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'slashnick') ORDER BY AnswerCount DESC LIMIT 1;	codebase_community
SELECT DisplayName, SUM(ViewCount) AS total_views FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE DisplayName IN ('Harvey Motulsky', 'Noah Snyder') GROUP BY DisplayName ORDER BY total_views DESC LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM posts  WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Matt Parker')  AND Id > 4;	codebase_community
SELECT COUNT(*)  FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Neil McGuigan' AND c.Score < 60	codebase_community
SELECT p.Tags FROM posts p INNER JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Mark Meckes' AND p.CommentCount = 0;	codebase_community
SELECT DISTINCT users.DisplayName  FROM users  JOIN badges ON users.Id = badges.UserId  WHERE badges.Name = 'Organizer';	codebase_community
SELECT      (COUNT(CASE WHEN Tags LIKE '%<r>%' THEN PostId END) * 100.0 / COUNT(PostId)) AS percentage FROM posts WHERE OwnerDisplayName = 'Community';	codebase_community
SELECT      (SUM(CASE WHEN u.DisplayName = 'Mornington' THEN p.ViewCount ELSE 0 END) -       SUM(CASE WHEN u.DisplayName = 'Amos' THEN p.ViewCount ELSE 0 END)) AS difference FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName IN ('Mornington', 'Amos');	codebase_community
SELECT COUNT(DISTINCT UserId)  FROM badges  WHERE Name = 'Commentator' AND YEAR(Date) = 2014;	codebase_community
SELECT COUNT(*) FROM posts WHERE CreaionDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59'	codebase_community
SELECT DisplayName, Age FROM Users WHERE Views = (SELECT MAX(Views) FROM Users);	codebase_community
SELECT LastEditDate, LastEditorUserId FROM posts WHERE Title = 'Detecting a given face in a database of facial images';	codebase_community
SELECT COUNT(*) FROM comments WHERE UserId = 13 AND Score < 60;	codebase_community
SELECT p.Title, c.UserDisplayName FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.Score > 60;	codebase_community
SELECT b.Name  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.Location = 'North Pole'  AND YEAR(b.Date) = 2011;	codebase_community
SELECT u.DisplayName, u.WebsiteUrl  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE p.FavoriteCount > 150;	codebase_community
SELECT COUNT(ph.Id) AS PostHistoryCount, MAX(ph.CreationDate) AS LastEditDate  FROM posts p  JOIN postHistory ph ON p.Id = ph.PostId  WHERE p.Title = 'What is the best introductory Bayesian statistics textbook?'	codebase_community
SELECT u.LastAccessDate, u.Location  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE b.Name = 'Outliers'	codebase_community
SELECT p.Title  FROM posts p  JOIN postLinks pl ON p.Id = pl.RelatedPostId  WHERE pl.PostId = (SELECT Id FROM posts WHERE Title = 'How to tell if something happened in a data set which monitors a value over time')  AND pl.LinkTypeId = 1;	codebase_community
SELECT p.Id AS PostId, NULL AS BadgeName FROM posts p WHERE OwnerUserId IN (     SELECT UserId FROM comments WHERE UserDisplayName = 'Samuel'     UNION     SELECT UserId FROM postHistory WHERE UserDisplayName = 'Samuel' ) AND YEAR(p.CreationDate) = 2013 UNION SELECT NULL AS PostId, b.Name AS BadgeName FROM badges b WHERE b.UserId IN (     SELECT UserId FROM comments WHERE UserDisplayName = 'Samuel'     UNION     SELECT UserId FROM postHistory WHERE UserDisplayName = 'Samuel' ) AND YEAR(b.Date) = 2013;	codebase_community
SELECT DisplayName  FROM users  JOIN posts ON users.Id = posts.OwnerUserId  WHERE posts.ViewCount = (SELECT MAX(ViewCount) FROM posts)	codebase_community
SELECT users.DisplayName, users.Location  FROM tags  JOIN posts ON tags.ExcerptPostId = posts.Id  JOIN users ON posts.OwnerUserId = users.Id  WHERE tags.TagName = 'hypothesis-testing'	codebase_community
WITH OriginalPost AS (     SELECT Id FROM posts WHERE Title = 'What are principal component scores?' ) SELECT      pl.LinkTypeId,     p.Title FROM postLinks pl JOIN posts p ON pl.RelatedPostId = p.Id WHERE pl.PostId = (SELECT Id FROM OriginalPost) UNION SELECT      pl.LinkTypeId,     p.Title FROM postLinks pl JOIN posts p ON pl.PostId = p.Id WHERE pl.RelatedPostId = (SELECT Id FROM OriginalPost);	codebase_community
SELECT DisplayName  FROM users  JOIN posts ON users.Id = posts.OwnerUserId  WHERE posts.Id = (     SELECT ParentId      FROM posts      WHERE ParentId IS NOT NULL      ORDER BY Score DESC      LIMIT 1 );	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM users u JOIN votes v ON u.Id = v.UserId WHERE v.VoteTypeId = 8    AND v.BountyAmount = (SELECT MAX(BountyAmount) FROM votes WHERE VoteTypeId = 8)	codebase_community
SELECT Title  FROM posts  ORDER BY ViewCount DESC  LIMIT 5;	codebase_community
SELECT COUNT(*) FROM tags WHERE Count BETWEEN 5000 AND 7000;	codebase_community
SELECT OwnerUserId FROM posts WHERE FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts)	codebase_community
SELECT Age FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users)	codebase_community
SELECT COUNT(p.Id)  FROM posts p  WHERE YEAR(p.CreaionDate) = 2011  AND EXISTS (SELECT 1 FROM votes v WHERE v.PostId = p.Id AND v.BountyAmount = 50);	codebase_community
SELECT Id FROM users WHERE Age = (SELECT MIN(Age) FROM users)	codebase_community
SELECT SUM(Score)  FROM posts  WHERE LasActivityDate LIKE '2010-07-19%';	codebase_community
SELECT COUNT(pl.Id) / 12 FROM postLinks pl JOIN posts p ON pl.PostId = p.Id WHERE YEAR(pl.CreationDate) = 2010 AND p.AnswerCount <= 2;	codebase_community
SELECT p.Id  FROM posts p  JOIN votes v ON p.Id = v.PostId  WHERE v.UserId = 1465  ORDER BY p.FavoriteCount DESC  LIMIT 1;	codebase_community
SELECT p.Title  FROM posts p  JOIN postLinks pl ON p.Id = pl.PostId  WHERE pl.CreationDate = (SELECT MIN(CreationDate) FROM postLinks)	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId GROUP BY u.Id, u.DisplayName HAVING COUNT(b.Id) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM badges GROUP BY UserId) AS sub)	codebase_community
SELECT MIN(v.CreationDate)  FROM votes v  JOIN users u ON v.UserId = u.Id  WHERE u.DisplayName = 'chl';	codebase_community
SELECT MIN(p.CreaionDate)  FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.Age = (SELECT MIN(Age) FROM users);	codebase_community
SELECT users.DisplayName  FROM users  JOIN badges ON users.Id = badges.UserId  WHERE badges.Name = 'Autobiographer'  ORDER BY badges.Date ASC  LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM (     SELECT u.Id     FROM users u     LEFT JOIN posts p ON u.Id = p.OwnerUserId     WHERE u.Location = 'United Kingdom'     GROUP BY u.Id     HAVING SUM(COALESCE(p.FavoriteCount, 0)) >=4 ) AS sub;	codebase_community
SELECT AVG(PostId)  FROM votes  WHERE UserId IN (     SELECT Id      FROM users      WHERE Age = (SELECT MAX(Age) FROM users) )	codebase_community
SELECT DisplayName  FROM Users  WHERE Reputation = (SELECT MAX(Reputation) FROM Users);	codebase_community
SELECT COUNT(*)  FROM users  WHERE Reputation > 2000 AND Views > 1000;	codebase_community
SELECT DisplayName  FROM users  WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT COUNT(*) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Jay Stevens' AND YEAR(p.CreationDate) = 2010;	codebase_community
SELECT posts.Id, posts.Title  FROM posts  JOIN users ON posts.OwnerUserId = users.Id  WHERE users.DisplayName = 'Harvey Motulsky'  ORDER BY posts.ViewCount DESC  LIMIT 1;	codebase_community
SELECT Id, Title FROM posts WHERE Score = (SELECT MAX(Score) FROM posts)	codebase_community
SELECT AVG(p.Score)  FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Stephen Turner'	codebase_community
SELECT DISTINCT u.DisplayName  FROM users u  JOIN posts p ON u.Id = p.OwnerUserId  WHERE p.ViewCount > 20000  AND YEAR(p.CreaionDate) = 2011;	codebase_community
SELECT p.Id, u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE YEAR(p.CreaionDate) = 2010 AND p.FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts WHERE YEAR(CreaionDate) = 2010);	codebase_community
SELECT      (COUNT(CASE WHEN u.Reputation > 1000 THEN 1 END) * 100.0 / COUNT(p.Id))  FROM posts p LEFT JOIN users u ON p.OwnerUserId = u.Id WHERE YEAR(p.CreaionDate) = 2011;	codebase_community
SELECT (COUNT(CASE WHEN Age BETWEEN 13 AND 18 THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM users;	codebase_community
SELECT p.ViewCount AS total_views, u.DisplayName AS user_name  FROM posts p  JOIN users u ON p.LastEditorUserId = u.Id  WHERE p.Title = 'Computer Game Datasets'	codebase_community
SELECT COUNT(*)  FROM posts  WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts);	codebase_community
SELECT COUNT(*) FROM comments WHERE PostId IN (SELECT Id FROM posts WHERE Score = (SELECT MAX(Score) FROM posts));	codebase_community
SELECT COUNT(*)  FROM posts  WHERE ViewCount > 35000 AND CommentCount = 0;	codebase_community
SELECT u.DisplayName, u.Location  FROM users u  INNER JOIN posts p ON u.Id = p.LastEditorUserId  WHERE p.Id = 183;	codebase_community
SELECT b.Name  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.DisplayName = 'Emmett'  ORDER BY b.Date DESC  LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM users  WHERE Age BETWEEN 19 AND 65  AND UpVotes > 5000;	codebase_community
SELECT julianday(MIN(b.Date)) - julianday(u.CreationDate) AS days  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE u.DisplayName = 'Zolomon';	codebase_community
SELECT      (SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users ORDER BY CreationDate DESC LIMIT 1)) AS PostCount,     (SELECT COUNT(*) FROM comments WHERE UserId = (SELECT Id FROM users ORDER BY CreationDate DESC LIMIT 1)) AS CommentCount;	codebase_community
SELECT c.Text, u.DisplayName  FROM comments c  JOIN users u ON c.UserId = u.Id  WHERE c.PostId = (SELECT Id FROM posts WHERE Title = 'Analysing wind data with R')  ORDER BY c.CreationDate DESC  LIMIT 10;	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Citizen Patrol';	codebase_community
SELECT COUNT(*) FROM posts WHERE Tags LIKE '%careers%';	codebase_community
SELECT Reputation, Views FROM users WHERE DisplayName = 'Jarrod Dixon';	codebase_community
SELECT      (SELECT COUNT(*) FROM comments WHERE PostId = p.Id) AS CommentCount,     (SELECT COUNT(*) FROM posts WHERE ParentId = p.Id AND PostTypeId = 2) AS AnswerCount FROM posts p WHERE p.Title = 'Clustering 1D data';	codebase_community
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat';	codebase_community
SELECT COUNT(DISTINCT PostId) FROM votes WHERE BountyAmount >=30;	codebase_community
SELECT      (COUNT(CASE WHEN p.Score > 50 THEN 1 END) * 100.0 / NULLIF(COUNT(p.Id), 0)) AS percentage FROM posts p WHERE p.OwnerUserId = (     SELECT Id      FROM users      ORDER BY Reputation DESC      LIMIT 1 );	codebase_community
SELECT COUNT(*) FROM posts WHERE Score < 20;	codebase_community
SELECT COUNT(*) FROM tags WHERE Id < 15 AND Count <= 20;	codebase_community
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample';	codebase_community
SELECT users.Reputation, users.UpVotes  FROM users  JOIN comments ON users.Id = comments.UserId  WHERE comments.Text = 'fine, you win :)';	codebase_community
SELECT Text FROM comments WHERE PostId IN (SELECT Id FROM posts WHERE Title LIKE '%linear regression%')	codebase_community
SELECT c.Text  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE p.ViewCount BETWEEN 100 AND 150  ORDER BY c.Score DESC  LIMIT 1;	codebase_community
SELECT u.CreationDate, u.Age  FROM users u  JOIN comments c ON u.Id = c.UserId  WHERE c.Text LIKE '%http://%';	codebase_community
SELECT COUNT(DISTINCT p.Id)  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE c.Score = 0 AND p.ViewCount < 5;	codebase_community
SELECT COUNT(*)  FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.CommentCount = 1 AND c.Score = 0;	codebase_community
SELECT COUNT(DISTINCT u.Id)  FROM users u  JOIN comments c ON u.Id = c.UserId  WHERE c.Score = 0 AND u.Age = 40;	codebase_community
SELECT posts.Id AS PostID, comments.Text AS Comment  FROM posts  JOIN comments ON posts.Id = comments.PostId  WHERE posts.Title = 'Group differences on a five point Likert item';	codebase_community
SELECT users.UpVotes  FROM users  WHERE users.Id = (SELECT comments.UserId FROM comments WHERE comments.Text = 'R is also lazy evaluated.');	codebase_community
SELECT c.Text  FROM comments c  JOIN users u ON c.UserId = u.Id  WHERE u.DisplayName = 'Harvey Motulsky';	codebase_community
SELECT DISTINCT u.DisplayName  FROM users u  JOIN comments c ON u.Id = c.UserId  WHERE c.Score BETWEEN 1 AND 5  AND u.DownVotes = 0;	codebase_community
SELECT (COUNT(CASE WHEN u.UpVotes = 0 THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score BETWEEN 5 AND 10;	codebase_community
SELECT sp.power_name  FROM superhero s  JOIN hero_power hp ON s.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE s.superhero_name = '3-D Man'	superhero
SELECT COUNT(DISTINCT hp.hero_id)  FROM hero_power hp  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'Super Strength'	superhero
SELECT COUNT(*)  FROM superhero  JOIN hero_power ON superhero.id = hero_power.hero_id  JOIN superpower ON hero_power.power_id = superpower.id  WHERE superpower.power_name = 'Super Strength'  AND superhero.height_cm > 200;	superhero
SELECT superhero.full_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id GROUP BY superhero.id, superhero.full_name HAVING COUNT(superhero.full_name) > 15;	superhero
SELECT COUNT(*)  FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.colour = 'Blue';	superhero
SELECT colour.colour  FROM superhero  JOIN colour ON superhero.skin_colour_id = colour.id  WHERE superhero.superhero_name = 'Apocalypse';	superhero
SELECT COUNT(DISTINCT s.id)  FROM superhero s JOIN colour c ON s.eye_colour_id = c.id JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE c.colour = 'Blue' AND sp.power_name = 'Agility';	superhero
SELECT superhero.superhero_name FROM superhero JOIN colour AS eye_colour ON superhero.eye_colour_id = eye_colour.id AND eye_colour.colour = 'Blue' JOIN colour AS hair_colour ON superhero.hair_colour_id = hair_colour.id AND hair_colour.colour = 'Blond'	superhero
SELECT COUNT(*) FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE publisher.publisher_name = 'Marvel Comics';	superhero
SELECT superhero_name, RANK() OVER (ORDER BY height_cm DESC) AS rank FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics' ORDER BY height_cm DESC;	superhero
SELECT publisher.publisher_name  FROM publisher  JOIN superhero ON publisher.id = superhero.publisher_id  WHERE superhero.superhero_name = 'Sauron'	superhero
SELECT c.colour AS eye_color, COUNT(s.id) AS popularity FROM superhero s JOIN publisher p ON s.publisher_id = p.id JOIN colour c ON s.eye_colour_id = c.id WHERE p.publisher_name = 'Marvel Comics' GROUP BY c.colour ORDER BY popularity DESC;	superhero
SELECT AVG(height_cm)  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE publisher.publisher_name = 'Marvel Comics'	superhero
SELECT superhero.superhero_name  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  JOIN hero_power ON superhero.id = hero_power.hero_id  JOIN superpower ON hero_power.power_id = superpower.id  WHERE publisher.publisher_name = 'Marvel Comics'  AND superpower.power_name = 'Super Strength';	superhero
SELECT COUNT(*)  FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'DC Comics';	superhero
SELECT publisher.publisher_name  FROM publisher  JOIN superhero ON publisher.id = superhero.publisher_id  JOIN hero_attribute ON superhero.id = hero_attribute.hero_id  WHERE hero_attribute.attribute_id = 3  AND hero_attribute.attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute WHERE attribute_id = 3);	superhero
SELECT COUNT(*)  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE publisher.publisher_name = 'Marvel Comics'  AND colour.colour = 'Gold';	superhero
SELECT publisher.publisher_name  FROM publisher  JOIN superhero ON publisher.id = superhero.publisher_id  WHERE superhero.superhero_name = 'Blue Beetle II'	superhero
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.hair_colour_id = colour.id  WHERE colour.colour = 'Blond';	superhero
SELECT superhero.superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Intelligence' ORDER BY hero_attribute.attribute_value ASC LIMIT 1;	superhero
SELECT race.race  FROM superhero  JOIN race ON superhero.race_id = race.id  WHERE superhero.superhero_name = 'Copycat'	superhero
SELECT superhero.superhero_name  FROM superhero  JOIN hero_attribute ON superhero.id = hero_attribute.hero_id  JOIN attribute ON hero_attribute.attribute_id = attribute.id  WHERE attribute.attribute_name = 'Durability' AND hero_attribute.attribute_value < 50;	superhero
SELECT superhero.superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Death Touch';	superhero
SELECT COUNT(*)  FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE g.gender = 'Female'  AND a.attribute_name = 'Strength'  AND ha.attribute_value = 100;	superhero
SELECT superhero.superhero_name FROM superhero LEFT JOIN hero_power ON superhero.id = hero_power.hero_id GROUP BY superhero.id, superhero.superhero_name ORDER BY COUNT(hero_power.power_id) DESC LIMIT 1;	superhero
SELECT COUNT(*)  FROM superhero s  JOIN race r ON s.race_id = r.id  WHERE r.race = 'Vampire'	superhero
SELECT      ROUND((COUNT(CASE WHEN a.alignment = 'Bad' THEN 1 END) * 100.0 / COUNT(s.id)), 2) AS percentage_bad,     COUNT(CASE WHEN a.alignment = 'Bad' AND p.publisher_name = 'Marvel Comics' THEN 1 END) AS marvel_count FROM superhero s LEFT JOIN alignment a ON s.alignment_id = a.id LEFT JOIN publisher p ON s.publisher_id = p.id;	superhero
SELECT      (SELECT COUNT(*) FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics') -      (SELECT COUNT(*) FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'DC Comics') AS difference	superhero
SELECT id FROM publisher WHERE publisher_name = 'Star Trek';	superhero
SELECT AVG(attribute_value) FROM hero_attribute;	superhero
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL	superhero
SELECT colour.colour  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE superhero.id = 75;	superhero
SELECT sp.power_name  FROM superpower sp  INNER JOIN hero_power hp ON sp.id = hp.power_id  WHERE hp.hero_id = (SELECT s.id FROM superhero s WHERE s.superhero_name = 'Deathlok')	superhero
SELECT AVG(s.weight_kg)  FROM superhero s  JOIN gender g ON s.gender_id = g.id  WHERE g.gender = 'Female'	superhero
SELECT DISTINCT sp.power_name  FROM superhero h  JOIN hero_power hp ON h.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE h.gender_id = 1  LIMIT 5;	superhero
SELECT superhero.superhero_name FROM superhero JOIN race ON superhero.race_id = race.id WHERE race.race = 'Alien';	superhero
SELECT superhero_name  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE superhero.height_cm BETWEEN 170 AND 190  AND colour.colour = 'No Colour';	superhero
SELECT power_name  FROM superpower  JOIN hero_power ON superpower.id = hero_power.power_id  WHERE hero_power.hero_id = 56;	superhero
SELECT s.full_name  FROM superhero s  JOIN race r ON s.race_id = r.id  WHERE r.race = 'Demi-God'  LIMIT 5;	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 2;	superhero
SELECT race.race FROM superhero JOIN race ON superhero.race_id = race.id WHERE superhero.weight_kg = 169;	superhero
SELECT c.colour  FROM superhero s JOIN colour c ON s.hair_colour_id = c.id JOIN race r ON s.race_id = r.id WHERE s.height_cm = 185 AND r.race = 'human';	superhero
SELECT c.colour  FROM superhero h JOIN colour c ON h.eye_colour_id = c.id WHERE h.weight_kg = (SELECT MAX(weight_kg) FROM superhero);	superhero
SELECT (COUNT(CASE WHEN s.publisher_id = 13 THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM superhero s WHERE s.height_cm BETWEEN 150 AND 180;	superhero
SELECT superhero_name FROM superhero WHERE gender_id = 1 AND weight_kg > (0.79 * (SELECT AVG(weight_kg) FROM superhero))	superhero
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id GROUP BY sp.power_name HAVING COUNT(*) = (SELECT MAX(c) FROM (SELECT COUNT(*) AS c FROM hero_power GROUP BY power_id) AS counts);	superhero
SELECT ha.attribute_value  FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE s.superhero_name = 'Abomination';	superhero
SELECT power_name FROM superpower  JOIN hero_power ON superpower.id = hero_power.power_id  WHERE hero_power.hero_id = 1;	superhero
SELECT COUNT(DISTINCT hp.hero_id)  FROM hero_power hp  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'stealth';	superhero
SELECT superhero.full_name  FROM superhero  JOIN hero_attribute ON superhero.id = hero_attribute.hero_id  JOIN attribute ON hero_attribute.attribute_id = attribute.id  WHERE attribute.attribute_name = 'Strength'  AND hero_attribute.attribute_value = (     SELECT MAX(attribute_value)      FROM hero_attribute      JOIN attribute a ON hero_attribute.attribute_id = a.id      WHERE a.attribute_name = 'Strength' );	superhero
SELECT COUNT(s.id) / SUM(CASE WHEN s.skin_colour_id = 1 THEN 1 ELSE 0 END) AS average FROM superhero s;	superhero
SELECT COUNT(*)  FROM superhero  WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics');	superhero
SELECT superhero.superhero_name  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  JOIN hero_attribute ON superhero.id = hero_attribute.hero_id  WHERE publisher.publisher_name = 'Dark Horse Comics'  AND hero_attribute.attribute_id = 4  AND hero_attribute.attribute_value = (     SELECT MAX(attribute_value)      FROM hero_attribute ha      JOIN superhero s ON ha.hero_id = s.id      JOIN publisher p ON s.publisher_id = p.id      WHERE p.publisher_name = 'Dark Horse Comics'      AND ha.attribute_id = 4 );	superhero
SELECT c.colour  FROM superhero h JOIN colour c ON h.eye_colour_id = c.id WHERE h.full_name = 'Abraham Sapien';	superhero
SELECT superhero.superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Flight';	superhero
SELECT e.colour AS eye_colour, hc.colour AS hair_colour, sc.colour AS skin_colour FROM superhero h JOIN gender g ON h.gender_id = g.id JOIN publisher p ON h.publisher_id = p.id LEFT JOIN colour e ON h.eye_colour_id = e.id LEFT JOIN colour hc ON h.hair_colour_id = hc.id LEFT JOIN colour sc ON h.skin_colour_id = sc.id WHERE g.gender = 'Female' AND p.publisher_name = 'Dark Horse Comics';	superhero
SELECT superhero.superhero_name, publisher.publisher_name FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.hair_colour_id = superhero.eye_colour_id AND superhero.hair_colour_id = superhero.skin_colour_id;	superhero
SELECT race.race  FROM superhero  JOIN race ON superhero.race_id = race.id  WHERE superhero.superhero_name = 'A-Bomb'	superhero
SELECT (SUM(CASE WHEN c.colour = 'Blue' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS percentage FROM superhero s JOIN gender g ON s.gender_id = g.id LEFT JOIN colour c ON s.skin_colour_id = c.id WHERE g.gender = 'Female';	superhero
SELECT superhero.superhero_name, race.race FROM superhero JOIN race ON superhero.race_id = race.id WHERE superhero.full_name = 'Charles Chandler';	superhero
SELECT gender.gender  FROM superhero  JOIN gender ON superhero.gender_id = gender.id  WHERE superhero.superhero_name = 'Agent 13';	superhero
SELECT superhero.superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Adaptation';	superhero
SELECT COUNT(*)  FROM hero_power  WHERE hero_id = (SELECT id FROM superhero WHERE superhero_name = 'Amazo')	superhero
SELECT sp.power_name  FROM superhero h  JOIN hero_power hp ON h.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE h.full_name = 'Hunter Zolomon';	superhero
SELECT s.height_cm FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.colour = 'Amber';	superhero
SELECT s.superhero_name  FROM superhero s JOIN colour e ON s.eye_colour_id = e.id JOIN colour h ON s.hair_colour_id = h.id WHERE e.colour = 'Black' AND h.colour = 'Black';	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  JOIN colour sc ON s.skin_colour_id = sc.id  WHERE sc.colour = 'Gold';	superhero
SELECT superhero.full_name FROM superhero JOIN race ON superhero.race_id = race.id WHERE race.race = 'Vampire';	superhero
SELECT superhero.superhero_name  FROM superhero  JOIN alignment ON superhero.alignment_id = alignment.id  WHERE alignment.alignment = 'Neutral';	superhero
SELECT COUNT(*)  FROM hero_attribute  WHERE attribute_id = 2  AND attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute WHERE attribute_id = 2)	superhero
SELECT r.race, a.alignment FROM superhero s JOIN race r ON s.race_id = r.id JOIN alignment a ON s.alignment_id = a.id WHERE s.superhero_name = 'Cameron Hicks';	superhero
SELECT      (COUNT(CASE WHEN g.gender = 'Female' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM superhero h JOIN publisher p ON h.publisher_id = p.id JOIN gender g ON h.gender_id = g.id WHERE p.publisher_name = 'Marvel Comics';	superhero
SELECT AVG(s.weight_kg)  FROM superhero s JOIN race r ON s.race_id = r.id WHERE r.race = 'Alien';	superhero
SELECT (SELECT SUM(weight_kg) FROM superhero WHERE full_name = 'Emil Blonsky') - (SELECT SUM(weight_kg) FROM superhero WHERE full_name = 'Charles Chandler') AS difference;	superhero
SELECT SUM(height_cm) / COUNT(*) AS average_height FROM superhero WHERE height_cm IS NOT NULL;	superhero
SELECT power_name  FROM superhero  JOIN hero_power ON superhero.id = hero_power.hero_id  JOIN superpower ON hero_power.power_id = superpower.id  WHERE superhero.superhero_name = 'Abomination';	superhero
SELECT COUNT(*)  FROM superhero  WHERE race_id = 21 AND gender_id = 1;	superhero
SELECT superhero.superhero_name  FROM superhero  INNER JOIN hero_attribute ON superhero.id = hero_attribute.hero_id  WHERE hero_attribute.attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Speed')  AND hero_attribute.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute WHERE attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Speed'));	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3;	superhero
SELECT attribute.attribute_name, hero_attribute.attribute_value  FROM hero_attribute  JOIN attribute ON hero_attribute.attribute_id = attribute.id  WHERE hero_attribute.hero_id = 1;	superhero
SELECT s.superhero_name FROM superhero s JOIN colour ec ON s.eye_colour_id = ec.id AND ec.colour = 'Blue' JOIN colour hc ON s.hair_colour_id = hc.id AND hc.colour = 'Brown'	superhero
SELECT publisher.publisher_name  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE superhero.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy');	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = 1;	superhero
SELECT (COUNT(CASE WHEN s.eye_colour_id = 7 THEN 1 END) * 100.0 / COUNT(s.id)) AS percentage FROM superhero s;	superhero
SELECT (SUM(gender_id = 1) * 1.0 / SUM(gender_id = 2)) AS ratio FROM superhero;	superhero
SELECT superhero_name  FROM superhero  WHERE height_cm = (SELECT MAX(height_cm) FROM superhero)	superhero
SELECT id FROM superpower WHERE power_name = 'cryokinesis';	superhero
SELECT superhero_name FROM superhero WHERE id = 294;	superhero
SELECT full_name  FROM superhero  WHERE weight_kg = 0 OR weight_kg IS NULL;	superhero
SELECT colour.colour  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE superhero.full_name = 'Karen Beecher-Duncan';	superhero
SELECT sp.power_name  FROM superhero h  JOIN hero_power hp ON h.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE h.full_name = 'Helen Parr';	superhero
SELECT race.race FROM superhero JOIN race ON superhero.race_id = race.id WHERE superhero.weight_kg = 108 AND superhero.height_cm = 188;	superhero
SELECT publisher.publisher_name FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.id = 38;	superhero
SELECT race.race FROM superhero JOIN race ON superhero.race_id = race.id WHERE superhero.id IN (     SELECT hero_id     FROM hero_attribute     WHERE attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute) )	superhero
SELECT alignment.alignment, superpower.power_name FROM superhero JOIN alignment ON superhero.alignment_id = alignment.id LEFT JOIN hero_power ON superhero.id = hero_power.hero_id LEFT JOIN superpower ON hero_power.power_id = superpower.id WHERE superhero.superhero_name = 'Atom IV';	superhero
SELECT superhero.full_name  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE colour.colour = 'Blue'  LIMIT 5;	superhero
SELECT AVG(ha.attribute_value)  FROM superhero h  JOIN hero_attribute ha ON h.id = ha.hero_id  WHERE h.alignment_id = 3;	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.skin_colour_id = c.id  JOIN hero_attribute ha ON s.id = ha.hero_id  WHERE ha.attribute_value = 100;	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 1 AND gender_id = 2	superhero
SELECT DISTINCT superhero.superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE hero_attribute.attribute_value BETWEEN 75 AND 80;	superhero
SELECT race.race FROM superhero JOIN gender ON superhero.gender_id = gender.id JOIN colour ON superhero.hair_colour_id = colour.id JOIN race ON superhero.race_id = race.id WHERE gender.gender = 'Male' AND colour.colour = 'Blue';	superhero
SELECT      (COUNT(CASE WHEN gender_id = 2 THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM superhero WHERE alignment_id = 2;	superhero
SELECT      (SUM(CASE WHEN eye_colour_id = 7 THEN 1 ELSE 0 END) -       SUM(CASE WHEN eye_colour_id = 1 THEN 1 ELSE 0 END))  FROM superhero  WHERE weight_kg = 0 OR weight_kg IS NULL;	superhero
SELECT ha.attribute_value  FROM superhero h JOIN hero_attribute ha ON h.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE h.superhero_name = 'Hulk' AND a.attribute_name = 'Strength';	superhero
SELECT sp.power_name  FROM superhero h  JOIN hero_power hp ON h.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE h.superhero_name = 'Ajax';	superhero
SELECT COUNT(*)  FROM superhero  JOIN alignment ON superhero.alignment_id = alignment.id  JOIN colour ON superhero.skin_colour_id = colour.id  WHERE alignment.alignment = 'Bad'  AND colour.colour = 'Green';	superhero
SELECT COUNT(*)  FROM superhero  WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')  AND gender_id = (SELECT id FROM gender WHERE gender = 'Female');	superhero
SELECT superhero.superhero_name FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Wind Control' ORDER BY superhero.superhero_name ASC;	superhero
SELECT g.gender  FROM superhero h JOIN gender g ON h.gender_id = g.id JOIN hero_power hp ON h.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Phoenix Force';	superhero
SELECT superhero_name  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE publisher.publisher_name = 'DC Comics'  ORDER BY weight_kg DESC  LIMIT 1;	superhero
SELECT AVG(s.height_cm)  FROM superhero s  JOIN publisher p ON s.publisher_id = p.id  JOIN race r ON s.race_id = r.id  WHERE p.publisher_name = 'Dark Horse Comics'  AND r.race <> 'Human';	superhero
SELECT COUNT(DISTINCT s.id)  FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed'  AND ha.attribute_value = 100;	superhero
SELECT      (SELECT COUNT(*) FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'DC Comics') -      (SELECT COUNT(*) FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics') AS difference;	superhero
SELECT a.attribute_name  FROM superhero s  JOIN hero_attribute ha ON s.id = ha.hero_id  JOIN attribute a ON ha.attribute_id = a.id  WHERE s.superhero_name = 'Black Panther'  AND ha.attribute_value = (     SELECT MIN(attribute_value)      FROM hero_attribute      WHERE hero_id = s.id );	superhero
SELECT colour.colour  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE superhero.superhero_name = 'Abomination';	superhero
SELECT superhero_name  FROM superhero  WHERE height_cm = (SELECT MAX(height_cm) FROM superhero)	superhero
SELECT superhero_name  FROM superhero  WHERE full_name = 'Charles Chandler'	superhero
SELECT      (COUNT(CASE WHEN g.gender = 'Female' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM superhero h JOIN publisher p ON h.publisher_id = p.id LEFT JOIN gender g ON h.gender_id = g.id WHERE p.publisher_name = 'George Lucas';	superhero
SELECT      ROUND((COUNT(CASE WHEN a.alignment = 'Good' THEN 1 END) * 100.0 / COUNT(*)), 2) AS percentage FROM superhero h JOIN publisher p ON h.publisher_id = p.id JOIN alignment a ON h.alignment_id = a.id WHERE p.publisher_name = 'Marvel Comics';	superhero
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%'	superhero
SELECT hero_id  FROM hero_attribute  WHERE attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute)	superhero
SELECT superhero.full_name  FROM superhero  JOIN race ON superhero.race_id = race.id  WHERE race.race = 'Alien';	superhero
SELECT superhero.full_name  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE superhero.weight_kg < 100 AND colour.colour = 'Brown';  Wait, but in the provided data, there is no 'Brown' in the colour table. This suggests that perhaps the user made an error in the colour entries. Alternatively, maybe the eye_colour_id refers to a colour not listed here, but given the data provided, the correct SQL based on the given tables would have to use the colour table's entries. Since there is no 'Brown', the query would return nothing, but the user expects an answer.   Alternatively, perhaps the user intended for the 'Auburn' (id 3) to be considered brown. If that's the case, then the eye_colour_id would be 3. Let me check the superhero entries again:  Looking at superhero's eye_colour_id:  - The first entry (id1) has 9 (no colour entry)  - The second (id3) has 7 (no colour entry)  - Third (id4) has 7 (same as above)  Since there's no brown in colour table, the problem might have a mistake. But given the problem requires an answer, perhaps the intended answer is to use the eye_colour_id 7 (as per the superhero entries with that ID) even though the colour isn't listed. Therefore, the SQL would be:  SELECT full_name FROM superhero WHERE weight_kg < 100 AND eye_colour_id =7;  Thus, the final SQL is:  SELECT full_name FROM superhero WHERE weight_kg < 100 AND eye_colour_id = 7;	superhero
SELECT a.attribute_name, ha.attribute_value FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE s.superhero_name = 'Aquababy';	superhero
SELECT superhero.weight_kg, race.race FROM superhero LEFT JOIN race ON superhero.race_id = race.id WHERE superhero.id = 40;	superhero
SELECT AVG(height_cm)  FROM superhero  JOIN alignment ON superhero.alignment_id = alignment.id  WHERE alignment.alignment = 'Neutral'	superhero
SELECT superhero.id FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Intelligence';	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.superhero_name = 'Blackwulf';	superhero
SELECT p.power_name FROM superhero h JOIN hero_power hp ON h.id = hp.hero_id JOIN superpower p ON hp.power_id = p.id WHERE h.height_cm > (SELECT 0.8 * AVG(height_cm) FROM superhero);	superhero
SELECT d.driverRef FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 20 ORDER BY q.q1 DESC LIMIT 5;	formula_1
SELECT drivers.surname  FROM drivers  JOIN qualifying ON drivers.driverId = qualifying.driverId  WHERE qualifying.raceId = 19  ORDER BY qualifying.q2  LIMIT 1;	formula_1
SELECT DISTINCT r.year FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.location = 'Shanghai';	formula_1
SELECT races.url  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE circuits.name = 'Circuit de Barcelona-Catalunya'	formula_1
SELECT races.name  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE circuits.country = 'Germany'	formula_1
SELECT c.name AS circuit_name, cs.position  FROM constructorStandings cs  JOIN constructors co ON cs.constructorId = co.constructorId  JOIN races r ON cs.raceId = r.raceId  JOIN circuits c ON r.circuitId = c.circuitId  WHERE co.name = 'Renault';	formula_1
SELECT COUNT(*)  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE races.year = 2010  AND circuits.country NOT IN ('Asia', 'Europe');	formula_1
SELECT races.name FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.country = 'Spain';	formula_1
SELECT circuits.lat, circuits.lng  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE races.name = 'Australian Grand Prix'	formula_1
SELECT races.url  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE circuits.name = 'Sepang International Circuit';	formula_1
SELECT races.time  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE circuits.name = 'Sepang International Circuit';	formula_1
SELECT circuits.lat, circuits.lng FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE races.name = 'Abu Dhabi Grand Prix';	formula_1
SELECT constructors.nationality  FROM constructorResults  JOIN constructors ON constructorResults.constructorId = constructors.constructorId  WHERE constructorResults.raceId = 24  AND constructorResults.points = 1.0;	formula_1
SELECT q.q1  FROM qualifying q JOIN drivers d ON q.driverId = d.driverId WHERE q.raceId = 354  AND d.forename = 'Bruno'  AND d.surname = 'Senna';	formula_1
SELECT drivers.nationality  FROM qualifying  JOIN drivers ON qualifying.driverId = drivers.driverId  WHERE qualifying.raceId = 355  AND qualifying.q2 = '0:01:40';	formula_1
SELECT number FROM qualifying WHERE raceId = 903 AND q3 LIKE '1:54%'	formula_1
SELECT COUNT(*)  FROM results  WHERE raceId = (SELECT raceId FROM races WHERE year = 2007 AND name = 'Bahrain Grand Prix')  AND time IS NULL;	formula_1
SELECT url FROM seasons WHERE year = (SELECT year FROM races WHERE raceId = 901)	formula_1
SELECT COUNT(*)  FROM results  WHERE raceId = (SELECT raceId FROM races WHERE date = '2015-11-29')  AND time IS NOT NULL;	formula_1
SELECT drivers.* FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE results.raceId = 592 AND results.time IS NOT NULL ORDER BY drivers.dob ASC LIMIT 1;	formula_1
SELECT drivers.forename, drivers.surname, drivers.url FROM lapTimes JOIN drivers ON lapTimes.driverId = drivers.driverId WHERE lapTimes.raceId = 161 AND lapTimes.time LIKE '1:27%'	formula_1
SELECT d.nationality  FROM drivers d  JOIN results r ON d.driverId = r.driverId  WHERE r.raceId = 933  AND CAST(r.fastestLapSpeed AS REAL) = (     SELECT MAX(CAST(fastestLapSpeed AS REAL))      FROM results      WHERE raceId = 933  );	formula_1
SELECT circuits.lat, circuits.lng  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE races.name = 'Malaysian Grand Prix';	formula_1
SELECT constructors.url  FROM constructors  JOIN constructorResults ON constructors.constructorId = constructorResults.constructorId  WHERE constructorResults.raceId = 9  AND constructorResults.points = (     SELECT MAX(points)      FROM constructorResults      WHERE raceId = 9 )	formula_1
SELECT q1 FROM qualifying WHERE raceId = 345 AND driverId = (SELECT driverId FROM drivers WHERE forename = 'Lucas' AND surname = 'di Grassi')	formula_1
SELECT drivers.nationality  FROM drivers  JOIN qualifying ON drivers.driverId = qualifying.driverId  WHERE qualifying.raceId = 347 AND qualifying.q2 = '0:01:15';	formula_1
SELECT drivers.code FROM drivers JOIN qualifying ON drivers.driverId = qualifying.driverId WHERE qualifying.raceId = 45 AND qualifying.q3 LIKE '1:33%';	formula_1
SELECT r.time  FROM results r  JOIN drivers d ON r.driverId = d.driverId  WHERE d.forename = 'Bruce'  AND d.surname = 'McLaren'  AND r.raceId = 743;	formula_1
SELECT drivers.forename, drivers.surname  FROM results  JOIN drivers ON results.driverId = drivers.driverId  JOIN races ON results.raceId = races.raceId  WHERE races.year = 2006  AND races.name = 'San Marino Grand Prix'  AND results.position = 2;	formula_1
SELECT url FROM seasons WHERE year = (SELECT year FROM races WHERE raceId = 901);	formula_1
SELECT COUNT(*)  FROM results  WHERE raceId = (SELECT raceId FROM races WHERE date = '2015-11-29')  AND statusId != 1;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 872 AND r.time IS NOT NULL ORDER BY d.dob DESC LIMIT 1;	formula_1
SELECT drivers.forename || ' ' || drivers.surname  FROM drivers  JOIN lapTimes ON drivers.driverId = lapTimes.driverId  WHERE lapTimes.raceId = 348  ORDER BY lapTimes.time ASC  LIMIT 1;	formula_1
SELECT nationality  FROM drivers  WHERE driverId = (     SELECT driverId      FROM results      WHERE fastestLapSpeed IS NOT NULL      ORDER BY CAST(fastestLapSpeed AS REAL) DESC      LIMIT 1 );	formula_1
SELECT      ((speed853 - speed854) / speed853) * 100 AS percentage FROM (     SELECT          (SELECT CAST(fastestLapSpeed AS REAL)           FROM results           WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Paul' AND surname = 'di Resta')           AND raceId = 853) AS speed853,         (SELECT CAST(fastestLapSpeed AS REAL)           FROM results           WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Paul' AND surname = 'di Resta')           AND raceId = 854) AS speed854 ) AS sub;	formula_1
SELECT (COUNT(CASE WHEN r.time IS NOT NULL THEN r.driverId END) * 1.0 / COUNT(r.driverId)) AS completion_rate FROM results r JOIN races rc ON r.raceId = rc.raceId WHERE rc.date = '1983-07-16';	formula_1
SELECT MIN(year) FROM races WHERE name = 'Singapore Grand Prix';	formula_1
SELECT COUNT(*) FROM races WHERE year = 2005; SELECT name FROM races WHERE year = 2005 ORDER BY name DESC;	formula_1
SELECT name  FROM races  WHERE strftime('%Y-%m', date) = (     SELECT strftime('%Y-%m', MIN(date))      FROM races );	formula_1
SELECT name, date  FROM races  WHERE year = 1999  AND round = (SELECT MAX(round) FROM races WHERE year = 1999);	formula_1
SELECT year FROM races GROUP BY year HAVING MAX(round) = (     SELECT MAX(max_r)     FROM (         SELECT MAX(round) AS max_r         FROM races         GROUP BY year     ) sub );	formula_1
SELECT name  FROM races  WHERE year = 2017  AND circuitId NOT IN (     SELECT circuitId      FROM races      WHERE year = 2000 );	formula_1
SELECT c.country, c.name, c.location FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.name = 'European Grand Prix' ORDER BY r.year ASC LIMIT 1;	formula_1
SELECT MAX(year)  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE races.name = 'British Grand Prix'  AND circuits.name = 'Brands Hatch';	formula_1
SELECT COUNT(DISTINCT r.year)  FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.name = 'British Grand Prix' AND c.name = 'Silverstone';	formula_1
SELECT drivers.forename || ' ' || drivers.surname AS driver_name FROM driverStandings JOIN drivers ON driverStandings.driverId = drivers.driverId WHERE driverStandings.raceId = (     SELECT raceId      FROM races      WHERE year = 2010 AND name = 'Singapore Grand Prix' ) ORDER BY driverStandings.position;	formula_1
SELECT d.forename, d.surname, ds.points FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId ORDER BY ds.points DESC LIMIT 1;	formula_1
SELECT d.forename, d.surname, ds.points FROM driverStandings ds JOIN races r ON ds.raceId = r.raceId JOIN drivers d ON ds.driverId = d.driverId WHERE r.year = 2017 AND r.name = 'Chinese Grand Prix' ORDER BY ds.points DESC LIMIT 3;	formula_1
SELECT drivers.forename, drivers.surname, races.name FROM lapTimes JOIN drivers ON lapTimes.driverId = drivers.driverId JOIN races ON lapTimes.raceId = races.raceId WHERE lapTimes.milliseconds = (     SELECT MIN(milliseconds) FROM lapTimes )	formula_1
SELECT AVG(lapTimes.milliseconds)  FROM lapTimes  JOIN races ON lapTimes.raceId = races.raceId  JOIN drivers ON lapTimes.driverId = drivers.driverId  WHERE races.name = 'Malaysian Grand Prix'  AND races.year = 2009  AND drivers.forename = 'Lewis'  AND drivers.surname = 'Hamilton';	formula_1
SELECT      (CAST(SUM(CASE WHEN r.position > 1 THEN 1 ELSE 0 END) AS REAL) / COUNT(*)) * 100 AS percentage FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId WHERE d.surname = 'Hamilton' AND ra.year >= 2010;	formula_1
SELECT      d.forename || ' ' || d.surname AS driver_name,     d.nationality,     MAX(ds.points) AS max_points FROM driverStandings ds JOIN drivers d ON ds.driverId = d.driverId GROUP BY ds.driverId, d.forename, d.surname, d.nationality ORDER BY SUM(ds.wins) DESC, MAX(ds.points) DESC LIMIT 1;	formula_1
SELECT d.forename, d.surname, (YEAR(CURRENT_TIMESTAMP) - YEAR(d.dob)) AS age  FROM drivers d  WHERE d.nationality = 'Japanese'  ORDER BY d.dob DESC  LIMIT 1;	formula_1
SELECT c.name  FROM circuits c  JOIN races r ON c.circuitId = r.circuitId  WHERE r.year BETWEEN 1990 AND 2000  GROUP BY c.circuitId, c.name  HAVING COUNT(r.raceId) = 4;	formula_1
SELECT circuits.name AS circuit_name, circuits.location, races.name AS race_name FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE circuits.country = 'USA' AND races.year = 2006;	formula_1
SELECT r.name AS race_name, c.name AS circuit_name, c.location FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE YEAR(r.date) = 2005 AND MONTH(r.date) = 9;	formula_1
SELECT races.name, races.year, races.date FROM races JOIN results ON races.raceId = results.raceId WHERE results.driverId = (SELECT driverId FROM drivers WHERE forename = 'Alex' AND surname = 'Yoong') AND results.position < 20;	formula_1
SELECT COUNT(*)  FROM results res JOIN races r ON res.raceId = r.raceId JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Sepang International Circuit' AND res.driverId = (SELECT driverId FROM drivers WHERE forename = 'Michael' AND surname = 'Schumacher') AND res.points = (     SELECT MAX(points)      FROM results      WHERE raceId = res.raceId );	formula_1
SELECT races.name, races.year  FROM races  WHERE raceId = (     SELECT raceId      FROM lapTimes      WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Michael' AND surname = 'Schumacher')      ORDER BY milliseconds      LIMIT 1 );	formula_1
SELECT AVG(r.points)  FROM results r JOIN races ON r.raceId = races.raceId JOIN drivers d ON r.driverId = d.driverId WHERE d.forename = 'Eddie' AND d.surname = 'Irvine' AND races.year = 2000;	formula_1
SELECT races.year, races.name, r.points FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ON r.raceId = races.raceId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' ORDER BY races.date ASC LIMIT 1;	formula_1
SELECT races.name, circuits.country, races.date FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE races.year = 2017 ORDER BY races.date;	formula_1
SELECT races.name, races.year, circuits.location FROM races JOIN circuits ON races.circuitId = circuits.circuitId JOIN (     SELECT raceId, MAX(laps) AS max_laps     FROM results     GROUP BY raceId ) AS max_race_laps ON races.raceId = max_race_laps.raceId WHERE max_laps = (     SELECT MAX(max_laps)     FROM (         SELECT MAX(laps) AS max_laps         FROM results         GROUP BY raceId     ) AS sub );	formula_1
SELECT      (CAST(COUNT(CASE WHEN c.country = 'Germany' THEN 1 END) AS REAL) / COUNT(*) * 100) AS percentage FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.name = 'European Grand Prix';	formula_1
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit';	formula_1
SELECT name, MAX(lat)  FROM circuits  WHERE name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring')  GROUP BY name  ORDER BY lat DESC  LIMIT 1;	formula_1
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit'	formula_1
SELECT country  FROM circuits  WHERE alt = (SELECT MAX(alt) FROM circuits)	formula_1
SELECT COUNT(*) FROM drivers WHERE code IS NULL;	formula_1
SELECT nationality  FROM drivers  WHERE dob = (SELECT MIN(dob) FROM drivers)	formula_1
SELECT surname FROM drivers WHERE nationality = 'italian';	formula_1
SELECT url FROM drivers WHERE forename = 'Anthony' AND surname = 'Davidson';	formula_1
SELECT driverRef FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton';	formula_1
SELECT circuits.name  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE races.year = 2009 AND races.name = 'Spanish Grand Prix';	formula_1
SELECT DISTINCT r.year  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE c.name = 'Silverstone Circuit';	formula_1
SELECT races.year, races.round, races.name, races.date, races.time, races.url, circuits.url AS circuit_url  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE circuits.name = 'Silverstone Circuit';	formula_1
SELECT races.time  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE circuits.name = 'Abu Dhabi Circuit'  AND races.year = 2010;	formula_1
SELECT COUNT(*)  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE circuits.country = 'Italy';	formula_1
SELECT races.date  FROM circuits  JOIN races ON circuits.circuitId = races.circuitId  WHERE circuits.name = 'Barcelona-Catalunya';	formula_1
SELECT circuits.url  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE races.year = 2009 AND races.name = 'Spanish Grand Prix';	formula_1
SELECT MIN(fastestLapTime) AS fastest_lap_time  FROM results  JOIN drivers ON results.driverId = drivers.driverId  WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton'  AND fastestLapTime IS NOT NULL;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE CAST(r.fastestLapSpeed AS REAL) = (     SELECT MAX(CAST(fastestLapSpeed AS REAL))     FROM results     WHERE fastestLapSpeed IS NOT NULL ) AND r.fastestLapSpeed IS NOT NULL;	formula_1
SELECT drivers.driverRef  FROM drivers  JOIN results ON drivers.driverId = results.driverId  JOIN races ON results.raceId = races.raceId  WHERE races.name = 'Canadian Grand Prix'  AND races.year = 2007  AND results.position = 1;	formula_1
SELECT races.year, races.round, races.name, races.date FROM races JOIN results ON races.raceId = results.raceId WHERE results.driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton');	formula_1
SELECT races.year, races.name, circuits.name AS circuit, races.date FROM races JOIN circuits ON races.circuitId = circuits.circuitId JOIN results ON races.raceId = results.raceId WHERE results.driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton') AND results.rank = (SELECT MIN(rank) FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton'));	formula_1
SELECT MAX(cast(re.fastestLapSpeed AS REAL))  FROM results re  JOIN races r ON re.raceId = r.raceId  WHERE r.year = 2009 AND r.name = 'Spanish Grand Prix'  AND re.fastestLapSpeed IS NOT NULL;	formula_1
SELECT DISTINCT r.year  FROM races r  JOIN results res ON r.raceId = res.raceId  JOIN drivers d ON res.driverId = d.driverId  WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton'	formula_1
SELECT positionOrder  FROM results  JOIN drivers ON results.driverId = drivers.driverId  JOIN races ON results.raceId = races.raceId  WHERE drivers.forename = 'Lewis'  AND drivers.surname = 'Hamilton'  AND races.year = 2008  AND races.name = 'Chinese Grand Prix';	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 1989 AND ra.name = 'Australian Grand Prix' AND r.grid = 4;	formula_1
SELECT COUNT(*)  FROM results  WHERE raceId = (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix')  AND time IS NOT NULL;	formula_1
SELECT lt.time  FROM lapTimes lt JOIN races r ON lt.raceId = r.raceId JOIN drivers d ON lt.driverId = d.driverId WHERE r.year = 2008  AND r.name = 'Australian Grand Prix'  AND d.forename = 'Lewis'  AND d.surname = 'Hamilton'  ORDER BY lt.milliseconds ASC  LIMIT 1;	formula_1
SELECT r.time  FROM results r JOIN races rc ON r.raceId = rc.raceId WHERE rc.year = 2008  AND rc.name = 'Chinese Grand Prix'  AND r.positionOrder = 2;	formula_1
SELECT d.forename || ' ' || d.surname AS champion, d.url  FROM drivers d  JOIN results r ON d.driverId = r.driverId  JOIN races rc ON r.raceId = rc.raceId  WHERE rc.year = 2008  AND rc.name = 'Australian Grand Prix'  AND r.position = 1  AND r.statusId = (SELECT statusId FROM status WHERE status = 'Finished');	formula_1
SELECT COUNT(DISTINCT r.driverId)  FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE r.raceId = (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix')  AND d.nationality = 'British'	formula_1
SELECT COUNT(DISTINCT r.driverId)  FROM results r  JOIN races ON r.raceId = races.raceId  WHERE races.year = 2008  AND races.name = 'Chinese Grand Prix'  AND r.time IS NOT NULL;	formula_1
SELECT SUM(points)  FROM results  JOIN drivers ON results.driverId = drivers.driverId  WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';	formula_1
SELECT AVG(     CAST(SUBSTR(r.fastestLapTime, 1, INSTR(r.fastestLapTime, ':') - 1) AS REAL) * 60 +     CAST(SUBSTR(r.fastestLapTime, INSTR(r.fastestLapTime, ':') + 1) AS REAL) )  FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND r.fastestLapTime IS NOT NULL;	formula_1
SELECT      CAST(COUNT(r.time) AS REAL) / COUNT(*) AS rate FROM results r JOIN races rc ON r.raceId = rc.raceId WHERE rc.year = 2008 AND rc.name = 'Australian Grand Prix'	formula_1
SELECT      ((last_time_sec - champ_time_sec) / last_time_sec) * 100 AS percentage_faster FROM (     SELECT          (SELECT              CASE                  WHEN INSTR(r.time, ':', INSTR(r.time, ':') + 1) > 0 THEN                      CAST(SUBSTR(r.time, 1, INSTR(r.time, ':') - 1) AS REAL) * 3600                      + CAST(SUBSTR(r.time, INSTR(r.time, ':') + 1,                          INSTR(r.time, ':', INSTR(r.time, ':') + 1) - INSTR(r.time, ':') - 1) AS REAL) * 60                      + CAST(SUBSTR(r.time, INSTR(r.time, ':', INSTR(r.time, ':') + 1) + 1) AS REAL)                 ELSE                      CAST(SUBSTR(r.time, 1, INSTR(r.time, ':') - 1) AS REAL) * 60                      + CAST(SUBSTR(r.time, INSTR(r.time, ':') + 1) AS REAL)             END           FROM results r           WHERE r.raceId = (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix')             AND r.statusId = 1             AND r.time IS NOT NULL             AND r.positionOrder = 1) AS champ_time_sec,          (SELECT              CASE                  WHEN INSTR(r.time, ':', INSTR(r.time, ':') + 1) > 0 THEN                      CAST(SUBSTR(r.time, 1, INSTR(r.time, ':') - 1) AS REAL) * 3600                      + CAST(SUBSTR(r.time, INSTR(r.time, ':') + 1,                          INSTR(r.time, ':', INSTR(r.time, ':') + 1) - INSTR(r.time, ':') - 1) AS REAL) * 60                      + CAST(SUBSTR(r.time, INSTR(r.time, ':', INSTR(r.time, ':') + 1) + 1) AS REAL)                 ELSE                      CAST(SUBSTR(r.time, 1, INSTR(r.time, ':') - 1) AS REAL) * 60                      + CAST(SUBSTR(r.time, INSTR(r.time, ':') + 1) AS REAL)             END           FROM results r           WHERE r.raceId = (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix')             AND r.statusId = 1             AND r.time IS NOT NULL             AND r.positionOrder = (SELECT MAX(positionOrder)                                    FROM results                                    WHERE raceId = (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix')                                      AND statusId = 1                                      AND time IS NOT NULL)) AS last_time_sec ) AS subquery;	formula_1
SELECT COUNT(*) FROM circuits WHERE country = 'Australia' AND location = 'Adelaide';	formula_1
SELECT lat, lng FROM circuits WHERE country = 'USA';	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND CAST(strftime('%Y', dob) AS INTEGER) > 1980;	formula_1
SELECT MAX(cr.points)  FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId WHERE c.nationality = 'British';	formula_1
SELECT constructors.name, SUM(constructorResults.points) AS total_points FROM constructorResults JOIN constructors ON constructorResults.constructorId = constructors.constructorId GROUP BY constructorResults.constructorId, constructors.name ORDER BY total_points DESC LIMIT 1;	formula_1
SELECT constructors.name  FROM constructors  JOIN constructorResults ON constructors.constructorId = constructorResults.constructorId  WHERE constructorResults.raceId = 291  AND constructorResults.points = 0;	formula_1
SELECT COUNT(*)  FROM (     SELECT c.constructorId     FROM constructors c     JOIN constructorResults cr ON c.constructorId = cr.constructorId     WHERE c.nationality = 'Japanese' AND cr.points = 0     GROUP BY c.constructorId     HAVING COUNT(cr.raceId) = 2 ) AS subquery;	formula_1
SELECT DISTINCT c.name  FROM constructorStandings cs  JOIN constructors c ON cs.constructorId = c.constructorId  WHERE cs.position = 1;	formula_1
SELECT COUNT(DISTINCT c.constructorId)  FROM lapTimes lt  JOIN results r ON lt.raceId = r.raceId AND lt.driverId = r.driverId  JOIN constructors c ON r.constructorId = c.constructorId  WHERE lt.lap > 50 AND c.nationality = 'French';	formula_1
SELECT      (SUM(CASE WHEN r.time IS NOT NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS completion_percentage FROM      drivers d JOIN      results r ON d.driverId = r.driverId JOIN      races ra ON r.raceId = ra.raceId WHERE      d.nationality = 'Japanese'     AND ra.year BETWEEN 2007 AND 2009;	formula_1
SELECT races.year, AVG(     CAST(SUBSTR(results.time, 1, INSTR(results.time, ':') - 1) AS REAL) * 60 +     CAST(SUBSTR(results.time, INSTR(results.time, ':') + 1, INSTR(results.time, '.') - INSTR(results.time, ':') - 1) AS REAL) +     CAST(SUBSTR(results.time, INSTR(results.time, '.') + 1) AS REAL) / 1000 ) AS average_time FROM results JOIN races ON results.raceId = races.raceId WHERE races.year < 1975   AND results.position = 1   AND results.time IS NOT NULL   AND results.statusId = 1 GROUP BY races.year;	formula_1
SELECT DISTINCT d.forename, d.surname FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId WHERE strftime('%Y', d.dob) > '1975' AND ds.position = 2;	formula_1
SELECT COUNT(DISTINCT d.driverId)  FROM drivers d  JOIN results r ON d.driverId = r.driverId  WHERE d.nationality = 'Italian' AND r.time IS NULL;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN lapTimes l ON d.driverId = l.driverId WHERE l.milliseconds = (SELECT MIN(milliseconds) FROM lapTimes);	formula_1
SELECT lap  FROM lapTimes  WHERE driverId = (     SELECT ds.driverId      FROM driverStandings ds      JOIN races r ON ds.raceId = r.raceId      WHERE r.year = 2009        AND ds.position = 1        AND r.round = (SELECT MAX(round) FROM races WHERE year = 2009) )  AND raceId IN (     SELECT raceId FROM races WHERE year = 2009 )  ORDER BY milliseconds ASC  LIMIT 1;	formula_1
SELECT AVG(CAST(fastestLapSpeed AS REAL))  FROM results  JOIN races USING (raceId)  WHERE races.year = 2009 AND races.name = 'Spanish Grand Prix';	formula_1
SELECT races.name, races.year FROM races JOIN (     SELECT raceId, MIN(milliseconds) AS min_ms     FROM results     WHERE milliseconds IS NOT NULL     GROUP BY raceId ) AS race_min ON races.raceId = race_min.raceId ORDER BY race_min.min_ms LIMIT 1;	formula_1
SELECT     (COUNT(DISTINCT CASE WHEN d.dob < '1985-01-01' AND r.laps > 50 THEN d.driverId END) * 100.0      / COUNT(DISTINCT d.driverId)) AS percentage FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.year BETWEEN 2000 AND 2005;	formula_1
SELECT COUNT(DISTINCT l.driverId)  FROM lapTimes l JOIN drivers d ON l.driverId = d.driverId WHERE d.nationality = 'French'  AND l.milliseconds < 120000;	formula_1
SELECT code FROM drivers WHERE nationality = 'America'	formula_1
SELECT raceId FROM races WHERE year = 2009;	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = 18;	formula_1
SELECT code FROM drivers ORDER BY dob DESC LIMIT 3; SELECT COUNT(*) FROM drivers WHERE nationality = 'Dutch' AND driverId IN (SELECT driverId FROM drivers ORDER BY dob DESC LIMIT 3);	formula_1
SELECT driverRef FROM drivers WHERE forename = 'Robert' AND surname = 'Kubica';	formula_1
SELECT COUNT(*)  FROM drivers  WHERE nationality = 'British'  AND strftime('%Y', dob) = '1980'	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE d.nationality = 'German' AND strftime('%Y', d.dob) BETWEEN '1980' AND '1990' GROUP BY d.driverId ORDER BY MIN(lt.milliseconds) ASC LIMIT 3;	formula_1
SELECT driverRef  FROM drivers  WHERE nationality = 'German'  ORDER BY dob ASC  LIMIT 1;	formula_1
SELECT d.driverId, d.code FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE YEAR(d.dob) = 1971 AND r.fastestLapTime IS NOT NULL;	formula_1
SELECT d.forename, d.surname, MAX(l.time) AS latest_lap_time FROM drivers d JOIN lapTimes l ON d.driverId = l.driverId WHERE d.nationality = 'Spanish' AND strftime('%Y', d.dob) < '1982' GROUP BY d.driverId, d.forename, d.surname ORDER BY latest_lap_time DESC LIMIT 10;	formula_1
SELECT races.year  FROM races  JOIN lapTimes ON races.raceId = lapTimes.raceId  WHERE lapTimes.milliseconds = (SELECT MIN(milliseconds) FROM lapTimes);	formula_1
SELECT races.year FROM lapTimes JOIN races ON lapTimes.raceId = races.raceId WHERE lapTimes.milliseconds = (SELECT MAX(milliseconds) FROM lapTimes)	formula_1
SELECT driverId FROM lapTimes WHERE lap = 1 GROUP BY driverId ORDER BY MIN(milliseconds) ASC LIMIT 5;	formula_1
SELECT COUNT(*)  FROM results  WHERE raceId > 50 AND raceId < 100  AND statusId = 2  AND time IS NOT NULL;	formula_1
SELECT location, lat, lng FROM circuits WHERE country = 'Austria';	formula_1
SELECT races.round  FROM races  JOIN (     SELECT raceId, COUNT(*) AS finishers      FROM results      WHERE time IS NOT NULL      GROUP BY raceId      ORDER BY finishers DESC      LIMIT 1 ) AS max_race ON races.raceId = max_race.raceId;	formula_1
SELECT drivers.driverRef, drivers.nationality, drivers.dob  FROM qualifying  JOIN drivers ON qualifying.driverId = drivers.driverId  WHERE qualifying.raceId = 23  AND qualifying.q2 IS NOT NULL;	formula_1
SELECT r.year, r.name, r.date, r.time FROM races r JOIN qualifying q ON r.raceId = q.raceId WHERE q.driverId = (SELECT driverId FROM drivers ORDER BY dob DESC LIMIT 1) ORDER BY r.date, r.time LIMIT 1	formula_1
SELECT COUNT(DISTINCT d.driverId)  FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN status s ON r.statusId = s.statusId WHERE d.nationality = 'American'  AND s.status = 'Puncture'	formula_1
SELECT c.name, c.url  FROM constructors c  JOIN constructorResults cr ON c.constructorId = cr.constructorId  WHERE c.nationality = 'Italian'  GROUP BY c.constructorId, c.name, c.url  ORDER BY SUM(cr.points) DESC  LIMIT 1;	formula_1
SELECT constructors.url  FROM constructors  JOIN (     SELECT constructorId, SUM(wins) AS total_wins      FROM constructorStandings      GROUP BY constructorId ) AS cs ON constructors.constructorId = cs.constructorId  WHERE cs.total_wins = (     SELECT MAX(total_wins)      FROM (         SELECT SUM(wins) AS total_wins          FROM constructorStandings          GROUP BY constructorId     ) );	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId JOIN races r ON lt.raceId = r.raceId WHERE r.name = 'French Grand Prix' AND lt.lap = 3 ORDER BY lt.milliseconds DESC LIMIT 1;	formula_1
SELECT raceId, milliseconds  FROM lapTimes  WHERE lap = 1  ORDER BY milliseconds ASC  LIMIT 1;	formula_1
SELECT      printf('%d:%.3f',          CAST(AVG(total_seconds) / 60 AS INTEGER),          AVG(total_seconds) % 60     ) AS average_fastest_lap_time FROM (     SELECT          (CAST(SUBSTR(r.fastestLapTime, 1, INSTR(r.fastestLapTime, ':') -1) AS REAL) * 60          + CAST(SUBSTR(r.fastestLapTime, INSTR(r.fastestLapTime, ':') +1) AS REAL)) AS total_seconds     FROM results r     JOIN races race ON r.raceId = race.raceId     WHERE race.year = 2006      AND race.name = 'United States Grand Prix'     AND r.rank <=10 );	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN pitStops ps ON d.driverId = ps.driverId WHERE d.nationality = 'German' AND strftime('%Y', d.dob) BETWEEN '1980' AND '1985' GROUP BY d.driverId, d.forename, d.surname HAVING COUNT(ps.duration) > 0 ORDER BY AVG(CAST(ps.duration AS REAL)) ASC LIMIT 3;	formula_1
SELECT d.forename || ' ' || d.surname AS driver_name, r.time FROM races rcs JOIN results r ON rcs.raceId = r.raceId JOIN drivers d ON r.driverId = d.driverId WHERE rcs.name = 'Canadian Grand Prix'  AND rcs.year = 2008  AND r.position = 1;	formula_1
SELECT constructors.constructorRef, constructors.url FROM constructors JOIN constructorStandings ON constructors.constructorId = constructorStandings.constructorId WHERE constructorStandings.raceId = (     SELECT raceId      FROM races      WHERE year = 2009 AND name = 'Singapore Grand Prix' ) AND constructorStandings.position = 1;	formula_1
SELECT forename || ' ' || surname AS full_name, dob FROM drivers WHERE nationality = 'Austrian'  AND strftime('%Y', dob) BETWEEN '1981' AND '1991';	formula_1
SELECT forename || ' ' || surname AS full_name, url, dob  FROM drivers  WHERE nationality = 'German'  AND strftime('%Y', dob) BETWEEN '1971' AND '1985'  ORDER BY dob DESC;	formula_1
SELECT location, country, lat, lng FROM circuits WHERE name = 'Hungaroring';	formula_1
SELECT c.name, c.nationality, SUM(cr.points) AS total_points FROM constructorResults cr JOIN races r ON cr.raceId = r.raceId JOIN constructors c ON cr.constructorId = c.constructorId WHERE r.name = 'Monaco Grand Prix' AND r.year BETWEEN 1980 AND 2010 GROUP BY c.constructorId, c.name, c.nationality ORDER BY total_points DESC LIMIT 1;	formula_1
SELECT AVG(r.points)  FROM results r JOIN races rc ON r.raceId = rc.raceId JOIN drivers d ON r.driverId = d.driverId WHERE rc.name = 'Turkish Grand Prix'  AND d.forename = 'Lewis'  AND d.surname = 'Hamilton';	formula_1
SELECT AVG(race_count)  FROM (     SELECT COUNT(*) AS race_count     FROM races     WHERE year BETWEEN 2000 AND 2010     GROUP BY year );	formula_1
SELECT nationality, COUNT(*) AS total FROM drivers GROUP BY nationality ORDER BY total DESC LIMIT 1;	formula_1
WITH driver_rankings AS (     SELECT          ds.driverId,         SUM(ds.points) AS total_points,         SUM(ds.wins) AS total_victories     FROM driverStandings ds     GROUP BY ds.driverId ), ranked_drivers AS (     SELECT          driverId,         total_victories,         DENSE_RANK() OVER (ORDER BY total_points DESC) AS points_rank     FROM driver_rankings ) SELECT total_victories  FROM ranked_drivers  WHERE points_rank = 91;	formula_1
SELECT races.name FROM races JOIN results ON races.raceId = results.raceId WHERE results.fastestLapTime = (SELECT MIN(fastestLapTime) FROM results WHERE fastestLapTime IS NOT NULL);	formula_1
SELECT c.name, c.location || ', ' || c.country AS full_location FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.date = (SELECT MAX(date) FROM races);	formula_1
SELECT drivers.forename || ' ' || drivers.surname AS full_name FROM qualifying JOIN races ON qualifying.raceId = races.raceId JOIN circuits ON races.circuitId = circuits.circuitId JOIN drivers ON qualifying.driverId = drivers.driverId WHERE races.year = 2008 AND circuits.name = 'Marina Bay Street Circuit' AND races.round = 3 AND qualifying.position = 1;	formula_1
SELECT      CONCAT(d.forename, ' ', d.surname) AS full_name,     d.nationality,     r.name AS first_race FROM drivers d JOIN results res ON d.driverId = res.driverId JOIN races r ON res.raceId = r.raceId WHERE d.dob = (SELECT MAX(dob) FROM drivers) ORDER BY r.date ASC, r.round ASC LIMIT 1;	formula_1
SELECT MAX(accident_count)  FROM (     SELECT driverId, COUNT(*) AS accident_count      FROM results      WHERE raceId IN (SELECT raceId FROM races WHERE name = 'Canadian Grand Prix')      AND statusId = 3      GROUP BY driverId )	formula_1
SELECT      (SELECT forename || ' ' || surname FROM drivers WHERE dob = (SELECT MIN(dob) FROM drivers)) AS full_name,     (SELECT SUM(wins) FROM driverStandings WHERE driverId = (SELECT driverId FROM drivers WHERE dob = (SELECT MIN(dob) FROM drivers))) AS total_wins;	formula_1
SELECT duration FROM pitStops ORDER BY milliseconds DESC LIMIT 1;	formula_1
SELECT time FROM lapTimes ORDER BY milliseconds ASC LIMIT 1;	formula_1
SELECT MAX(CAST(duration AS REAL))  FROM pitStops  WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')	formula_1
SELECT pitStops.lap  FROM pitStops  JOIN drivers ON pitStops.driverId = drivers.driverId  JOIN races ON pitStops.raceId = races.raceId  WHERE drivers.forename = 'Lewis'  AND drivers.surname = 'Hamilton'  AND races.year = 2011  AND races.name = 'Australian Grand Prix';	formula_1
SELECT d.forename || ' ' || d.surname AS driver,         SUM(CAST(p.duration AS REAL)) AS total_pit_time FROM pitStops p JOIN races r ON p.raceId = r.raceId JOIN drivers d ON p.driverId = d.driverId WHERE r.year = 2011 AND r.name = 'Australian Grand Prix' GROUP BY d.driverId, d.forename, d.surname;	formula_1
SELECT lt.time  FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' ORDER BY lt.milliseconds ASC  LIMIT 1;	formula_1
SELECT drivers.forename, drivers.surname  FROM lapTimes  JOIN drivers ON lapTimes.driverId = drivers.driverId  ORDER BY lapTimes.milliseconds ASC  LIMIT 20;	formula_1
SELECT position FROM lapTimes  WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')  ORDER BY milliseconds ASC  LIMIT 1;	formula_1
SELECT MIN(time) FROM lapTimes  JOIN races ON lapTimes.raceId = races.raceId  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE circuits.name = 'Austrian Grand Prix Circuit';	formula_1
SELECT c.name, MIN(lt.time) AS fastest_lap_time FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN lapTimes lt ON r.raceId = lt.raceId WHERE c.country = 'Italy' GROUP BY c.circuitId, c.name;	formula_1
SELECT r.year, r.name, r.date  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  JOIN lapTimes lt ON r.raceId = lt.raceId  WHERE c.name = 'Austrian Grand Prix'  ORDER BY lt.milliseconds ASC  LIMIT 1;	formula_1
SELECT duration FROM pitStops WHERE raceId = (SELECT raceId FROM lapTimes GROUP BY raceId HAVING MIN(time)) AND driverId = (SELECT driverId FROM lapTimes WHERE time = (SELECT MIN(time) FROM lapTimes GROUP BY raceId HAVING MIN(time)));	formula_1
SELECT circuits.lat, circuits.lng FROM circuits JOIN races ON circuits.circuitId = races.circuitId JOIN lapTimes ON races.raceId = lapTimes.raceId GROUP BY circuits.circuitId HAVING MIN(lapTimes.time) = '1:29.488'	formula_1
SELECT AVG(pitStops.milliseconds)  FROM pitStops  JOIN drivers ON pitStops.driverId = drivers.driverId  WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton'	formula_1
SELECT AVG(lapTimes.milliseconds)  FROM lapTimes  JOIN races ON lapTimes.raceId = races.raceId  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE circuits.country = 'Italy'	formula_1
SELECT player_api_id FROM Player_Attributes WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)	european_football_2
SELECT player_name, height  FROM Player  WHERE height = (SELECT MAX(height) FROM Player)	european_football_2
SELECT preferred_foot  FROM Player_Attributes  WHERE potential = (SELECT MIN(potential) FROM Player_Attributes);	european_football_2
SELECT COUNT(DISTINCT pa.player_api_id)  FROM Player_Attributes pa WHERE pa.overall_rating >=60  AND pa.overall_rating <65  AND pa.defensive_work_rate = 'low'	european_football_2
SELECT p.id, MAX(pa.crossing) AS max_crossing FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id GROUP BY p.id ORDER BY max_crossing DESC LIMIT 5;	european_football_2
SELECT League.name  FROM Match  JOIN League ON Match.league_id = League.id  WHERE Match.season = '2015/2016'  GROUP BY League.id  ORDER BY SUM(Match.home_team_goal + Match.away_team_goal) DESC  LIMIT 1;	european_football_2
SELECT T.team_long_name AS home_team, COUNT(*) AS total_losses FROM Match M JOIN Team T ON M.home_team_api_id = T.team_api_id WHERE M.season = '2015/2016' AND M.home_team_goal < M.away_team_goal GROUP BY M.home_team_api_id, T.team_long_name ORDER BY total_losses ASC LIMIT 1;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id GROUP BY p.player_api_id, p.player_name ORDER BY MAX(pa.penalties) DESC LIMIT 10;	european_football_2
SELECT T.team_long_name FROM Match M JOIN League L ON M.league_id = L.id JOIN Team T ON M.away_team_api_id = T.team_api_id WHERE L.name = 'Scotland Premier League' AND M.season = '2009/2010' AND M.away_team_goal > M.home_team_goal GROUP BY T.team_long_name ORDER BY COUNT(*) DESC LIMIT 1;	european_football_2
SELECT MAX(buildUpPlaySpeed) AS speed FROM Team_Attributes GROUP BY team_api_id ORDER BY speed DESC LIMIT 4;	european_football_2
SELECT l.name FROM Match m JOIN League l ON m.league_id = l.id WHERE m.season = '2015/2016' AND m.home_team_goal = m.away_team_goal GROUP BY l.name ORDER BY COUNT(*) DESC LIMIT 1;	european_football_2
SELECT      p.player_name,     (CAST(strftime('%Y', 'now') AS INTEGER) - CAST(strftime('%Y', p.birthday) AS INTEGER)) -      CASE WHEN strftime('%m-%d', 'now') < strftime('%m-%d', p.birthday) THEN 1 ELSE 0 END AS age FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.sprint_speed >= 97      AND strftime('%Y', pa.date) BETWEEN '2013' AND '2015';	european_football_2
SELECT L.name, COUNT(*) AS total_matches FROM Match M JOIN League L ON M.league_id = L.id GROUP BY M.league_id, L.name HAVING COUNT(*) = (     SELECT MAX(cnt)      FROM (         SELECT COUNT(*) AS cnt          FROM Match          GROUP BY league_id     ) AS sub );	european_football_2
SELECT SUM(height) * 1.0 / COUNT(id) AS average_height  FROM Player  WHERE birthday >= '1990-01-01 00:00:00'  AND birthday < '1996-01-01 00:00:00'	european_football_2
SELECT DISTINCT pa.player_api_id FROM Player_Attributes pa WHERE pa.overall_rating = (     SELECT MAX(overall_rating)     FROM Player_Attributes     WHERE substr(date, 1, 4) = '2010' )  AND substr(pa.date, 1, 4) = '2010';	european_football_2
SELECT DISTINCT team_fifa_api_id  FROM Team_Attributes  WHERE buildUpPlaySpeed > 50 AND buildUpPlaySpeed < 60;	european_football_2
SELECT DISTINCT T.team_long_name FROM Team T JOIN Team_Attributes TA ON T.team_api_id = TA.team_api_id WHERE TA.buildUpPlayPassing > (     SELECT AVG(buildUpPlayPassing)     FROM Team_Attributes     WHERE strftime('%Y', date) = '2012'      AND buildUpPlayPassing IS NOT NULL ) AND strftime('%Y', TA.date) = '2012';	european_football_2
SELECT      (SUM(pa.preferred_foot = 'left') * 100.0 / COUNT(p.player_fifa_api_id)) AS percentage FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE strftime('%Y', p.birthday) BETWEEN '1987' AND '1992'	european_football_2
SELECT name, total_goals FROM (     SELECT L.name, SUM(M.home_team_goal + M.away_team_goal) AS total_goals     FROM League L     LEFT JOIN Match M ON L.id = M.league_id     GROUP BY L.id     ORDER BY total_goals DESC     LIMIT 5 )  ORDER BY total_goals ASC;	european_football_2
SELECT SUM(pa.long_shots) / COUNT(pa.player_fifa_api_id)  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.player_name = 'Ahmed Samir Farag';	european_football_2
SELECT p.player_name, (SUM(pa.heading_accuracy) / COUNT(pa.player_fifa_api_id)) AS avg_heading FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.height > 180 GROUP BY p.player_api_id, p.player_name ORDER BY avg_heading DESC LIMIT 10;	european_football_2
SELECT t.team_long_name FROM Team_Attributes ta JOIN Team t ON ta.team_api_id = t.team_api_id WHERE ta.buildUpPlayDribblingClass = 'Normal' AND ta.date BETWEEN '2014-01-01 00:00:00' AND '2014-01-31 00:00:00' GROUP BY t.team_long_name HAVING AVG(ta.chanceCreationPassing) < (     SELECT AVG(avg_ccp)     FROM (         SELECT AVG(ta2.chanceCreationPassing) AS avg_ccp         FROM Team_Attributes ta2         JOIN Team t2 ON ta2.team_api_id = t2.team_api_id         WHERE ta2.buildUpPlayDribblingClass = 'Normal'         AND ta2.date BETWEEN '2014-01-01 00:00:00' AND '2014-01-31 00:00:00'         GROUP BY t2.team_long_name     ) AS sub ) ORDER BY AVG(ta.chanceCreationPassing) DESC;	european_football_2
SELECT League.name FROM Match JOIN League ON Match.league_id = League.id WHERE Match.season = '2009/2010' GROUP BY League.name HAVING AVG(home_team_goal) > AVG(away_team_goal);	european_football_2
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers';	european_football_2
SELECT player_name  FROM Player  WHERE substr(birthday, 1, 7) = '1970-10';	european_football_2
SELECT pa.attacking_work_rate  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.player_name = 'Franco Zennaro';	european_football_2
SELECT buildUpPlayPositioningClass  FROM Team  JOIN Team_Attributes ON Team.team_api_id = Team_Attributes.team_api_id  WHERE Team.team_long_name = 'ADO Den Haag';	european_football_2
SELECT pa.heading_accuracy  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.player_name = 'Francois Affolter'  AND pa.date = '2014-09-18 00:00:00'	european_football_2
SELECT pa.overall_rating  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.player_name = 'Gabriel Tamas'  AND strftime('%Y', pa.date) = '2011';	european_football_2
SELECT COUNT(*)  FROM Match  WHERE league_id = (SELECT id FROM League WHERE name = 'Scotland Premier League')  AND season = '2015/2016'	european_football_2
SELECT pa.preferred_foot  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.birthday = (SELECT MAX(birthday) FROM Player)  LIMIT 1;	european_football_2
SELECT p.player_name  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE pa.potential = (SELECT MAX(potential) FROM Player_Attributes);	european_football_2
SELECT COUNT(DISTINCT p.player_api_id)  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.weight < 130  AND pa.preferred_foot = 'left';	european_football_2
SELECT DISTINCT t.team_short_name FROM Team t JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id WHERE ta.chanceCreationPassingClass = 'Risky'	european_football_2
SELECT pa.defensive_work_rate  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.player_name = 'David Wilson'  ORDER BY pa.date DESC  LIMIT 1;	european_football_2
SELECT P.birthday FROM Player P JOIN Player_Attributes PA ON P.player_api_id = PA.player_api_id WHERE PA.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)	european_football_2
SELECT League.name  FROM League  JOIN Country ON League.country_id = Country.id  WHERE Country.name = 'Netherlands';	european_football_2
SELECT AVG(home_team_goal)  FROM Match  JOIN Country ON Match.country_id = Country.id  WHERE Country.name = 'Poland' AND Match.season = '2010/2011';	european_football_2
SELECT GREATEST(     (SELECT AVG(pa.finishing)       FROM Player p       JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id       WHERE p.height = (SELECT MAX(height) FROM Player)),     (SELECT AVG(pa.finishing)       FROM Player p       JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id       WHERE p.height = (SELECT MIN(height) FROM Player)) ) AS highest_avg_finishing;	european_football_2
SELECT player_name FROM Player WHERE height > 180;	european_football_2
SELECT COUNT(*) FROM Player WHERE strftime('%Y', birthday) = '1990';	european_football_2
SELECT COUNT(*)  FROM Player  WHERE player_name LIKE 'Adam%' AND weight > 170	european_football_2
SELECT DISTINCT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating > 80 AND strftime('%Y', pa.date) BETWEEN '2008' AND '2010'	european_football_2
SELECT pa.potential  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.player_name = 'Aaron Doran';	european_football_2
SELECT DISTINCT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.preferred_foot = 'left';	european_football_2
SELECT DISTINCT t.team_long_name FROM Team t JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id WHERE ta.buildUpPlaySpeedClass = 'Fast';	european_football_2
SELECT ta.buildUpPlayPassingClass  FROM Team t  JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id  WHERE t.team_short_name = 'CLB'  ORDER BY ta.date DESC  LIMIT 1;	european_football_2
SELECT DISTINCT t.team_short_name FROM Team t JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id WHERE ta.buildUpPlayPassing > 70;	european_football_2
SELECT SUM(pa.overall_rating) * 1.0 / COUNT(pa.id) AS average_rating FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE strftime('%Y', pa.date) BETWEEN '2010' AND '2015' AND p.height > 170;	european_football_2
SELECT player_name FROM Player WHERE height = (SELECT MIN(height) FROM Player);	european_football_2
SELECT Country.name  FROM League  JOIN Country ON League.country_id = Country.id  WHERE League.name = 'Italy Serie A';	european_football_2
SELECT Team.team_short_name FROM Team JOIN Team_Attributes ON Team.team_api_id = Team_Attributes.team_api_id WHERE Team_Attributes.buildUpPlaySpeed = 31 AND Team_Attributes.buildUpPlayDribbling = 53 AND Team_Attributes.buildUpPlayPassing = 32;	european_football_2
SELECT AVG(pa.overall_rating)  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.player_name = 'Aaron Doran';	european_football_2
SELECT COUNT(*) FROM Match  WHERE league_id = (SELECT id FROM League WHERE name = 'Germany 1. Bundesliga')  AND strftime('%Y-%m', date) BETWEEN '2008-08' AND '2008-10';	european_football_2
SELECT DISTINCT t.team_short_name FROM Team t JOIN Match m ON t.team_api_id = m.home_team_api_id WHERE m.home_team_goal = 10;	european_football_2
SELECT Player.player_name  FROM Player  JOIN Player_Attributes  ON Player.player_api_id = Player_Attributes.player_api_id  WHERE Player_Attributes.potential = 61  AND Player_Attributes.balance = (     SELECT MAX(balance)      FROM Player_Attributes      WHERE potential = 61 );	european_football_2
SELECT      (SUM(CASE WHEN p.player_name = 'Abdou Diallo' THEN pa.ball_control ELSE 0 END) /       COUNT(CASE WHEN p.player_name = 'Abdou Diallo' THEN pa.id ELSE NULL END))      -      (SUM(CASE WHEN p.player_name = 'Aaron Appindangoye' THEN pa.ball_control ELSE 0 END) /       COUNT(CASE WHEN p.player_name = 'Aaron Appindangoye' THEN pa.id ELSE NULL END))  FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name IN ('Abdou Diallo', 'Aaron Appindangoye')	european_football_2
SELECT team_long_name  FROM Team  WHERE team_short_name = 'GEN'	european_football_2
SELECT player_name  FROM Player  WHERE player_name IN ('Aaron Lennon', 'Abdelaziz Barrada')  ORDER BY birthday ASC  LIMIT 1;	european_football_2
SELECT player_name, height FROM Player WHERE height = (SELECT MAX(height) FROM Player)	european_football_2
SELECT COUNT(DISTINCT player_api_id)  FROM Player_Attributes  WHERE preferred_foot = 'left' AND attacking_work_rate = 'low'	european_football_2
SELECT Country.name  FROM League  JOIN Country ON League.country_id = Country.id  WHERE League.name = 'Belgium Jupiler League'	european_football_2
SELECT League.name  FROM League  JOIN Country ON League.country_id = Country.id  WHERE Country.name = 'Germany';	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT COUNT(DISTINCT pa.player_api_id)  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE strftime('%Y', p.birthday) < '1986'  AND pa.defensive_work_rate = 'high';	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone') GROUP BY p.player_name ORDER BY MAX(pa.crossing) DESC LIMIT 1;	european_football_2
SELECT pa.heading_accuracy  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.player_name = 'Ariel Borysiuk'  ORDER BY pa.date DESC  LIMIT 1;	european_football_2
SELECT COUNT(DISTINCT p.player_api_id)  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.height > 180 AND pa.volleys > 70;	european_football_2
SELECT DISTINCT p.player_name  FROM Player p  JOIN Player_Attributes pa  ON p.player_api_id = pa.player_api_id  WHERE pa.volleys > 70 AND pa.dribbling > 70;	european_football_2
SELECT COUNT(*)  FROM Match  JOIN Country ON Match.country_id = Country.id  WHERE Country.name = 'Belgium'  AND Match.season = '2008/2009';	european_football_2
SELECT pa.long_passing  FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.birthday = (SELECT MIN(birthday) FROM Player);	european_football_2
SELECT COUNT(*)  FROM Match  JOIN League ON Match.league_id = League.id  WHERE League.name = 'Belgium Jupiler League'  AND SUBSTR(date, 1, 7) = '2009-04'	european_football_2
SELECT League.name  FROM Match  JOIN League ON Match.league_id = League.id  WHERE Match.season = '2008/2009'  GROUP BY League.id, League.name  ORDER BY COUNT(*) DESC  LIMIT 1;	european_football_2
SELECT AVG(pa.overall_rating)  FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE strftime('%Y', p.birthday) < '1986'	european_football_2
SELECT    ((ab.ab_rating - pp.pp_rating) / pp.pp_rating * 100) AS percentage FROM   (SELECT pa.overall_rating     FROM Player p     JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id     WHERE p.player_name = 'Ariel Borysiuk'    ORDER BY pa.date DESC    LIMIT 1) ab(ab_rating),   (SELECT pa.overall_rating     FROM Player p     JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id     WHERE p.player_name = 'Paulin Puel'    ORDER BY pa.date DESC    LIMIT 1) pp(pp_rating);	european_football_2
SELECT AVG(buildUpPlaySpeed)  FROM Team  JOIN Team_Attributes USING(team_fifa_api_id)  WHERE team_long_name = 'Heart of Midlothian'	european_football_2
SELECT AVG(pa.overall_rating)  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.player_name = 'Pietro Marino';	european_football_2
SELECT SUM(pa.crossing)  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.player_name = 'Aaron Lennox'	european_football_2
SELECT chanceCreationPassing, chanceCreationPassingClass  FROM Team  JOIN Team_Attributes ON Team.team_api_id = Team_Attributes.team_api_id  WHERE team_long_name = 'Ajax'  ORDER BY chanceCreationPassing DESC  LIMIT 1;	european_football_2
SELECT preferred_foot  FROM Player_Attributes  JOIN Player ON Player.player_api_id = Player_Attributes.player_api_id  WHERE Player.player_name = 'Abdou Diallo';	european_football_2
SELECT MAX(pa.overall_rating)  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.player_name = 'Dorlan Pabon'	european_football_2
SELECT AVG(away_team_goal)  FROM Match  WHERE away_team_api_id = (SELECT team_api_id FROM Team WHERE team_long_name = 'Parma')  AND country_id = (SELECT id FROM Country WHERE name = 'Italy')	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating = 77 AND pa.date LIKE '2016-06-23%' ORDER BY p.birthday ASC LIMIT 1;	european_football_2
SELECT pa.overall_rating FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name = 'Aaron Mooy' AND pa.date LIKE '2016-02-04%'	european_football_2
SELECT pa.potential  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.player_name = 'Francesco Parravicini'  AND pa.date = '2010-08-30 00:00:00'	european_football_2
SELECT pa.attacking_work_rate  FROM Player_Attributes pa  JOIN Player p ON pa.player_api_id = p.player_api_id  WHERE p.player_name = 'Francesco Migliore'  AND pa.date LIKE '2015-05-01%'	european_football_2
SELECT pa.defensive_work_rate  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.player_name = 'Kevin Berigaud'  AND pa.date = '2013-02-22 00:00:00';	european_football_2
SELECT pa.date FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name = 'Kevin Constant' AND pa.crossing = (     SELECT MAX(crossing)     FROM Player_Attributes     WHERE player_api_id = p.player_api_id ) ORDER BY pa.date ASC LIMIT 1;	european_football_2
SELECT ta.buildUpPlaySpeedClass  FROM Team t  JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id  WHERE t.team_long_name = 'Willem II'  AND ta.date = '2012-02-22';	european_football_2
SELECT ta.buildUpPlayDribblingClass  FROM Team_Attributes ta  JOIN Team t ON ta.team_api_id = t.team_api_id  WHERE t.team_short_name = 'LEI'  AND ta.date = '2015-09-10 00:00:00';	european_football_2
SELECT ta.buildUpPlayPassingClass  FROM Team t  JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id  WHERE t.team_long_name = 'FC Lorient'  AND ta.date LIKE '2010-02-22%';	european_football_2
SELECT ta.chanceCreationPassingClass  FROM Team t  JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id  WHERE t.team_long_name = 'PEC Zwolle'  AND ta.date = '2013-09-20 00:00:00';	european_football_2
SELECT ta.chanceCreationCrossingClass  FROM Team t  JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id AND t.team_fifa_api_id = ta.team_fifa_api_id  WHERE t.team_long_name = 'Hull City'  AND ta.date = '2010-02-22 00:00:00'	european_football_2
SELECT ta.defenceAggressionClass  FROM Team t  JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id  WHERE t.team_long_name = 'Hannover 96'  AND ta.date LIKE '2015-09-10%'	european_football_2
SELECT AVG(pa.overall_rating)  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.player_name = 'Marko Arnautovic'  AND pa.date BETWEEN '2007-02-22' AND '2016-04-21';	european_football_2
SELECT      ((ld.overall_rating - jb.overall_rating) * 100.0 / ld.overall_rating) AS percentage FROM     (SELECT pa.overall_rating       FROM Player p       JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id       WHERE p.player_name = 'Landon Donovan' AND pa.date = '2013/7/12') AS ld,     (SELECT pa.overall_rating       FROM Player p       JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id       WHERE p.player_name = 'Jordan Bowery' AND pa.date = '2013/7/12') AS jb;	european_football_2
SELECT player_name  FROM Player  WHERE height = (SELECT MAX(height) FROM Player)	european_football_2
SELECT player_api_id  FROM Player  WHERE weight IS NOT NULL  ORDER BY weight DESC  LIMIT 10;	european_football_2
SELECT player_name FROM Player WHERE (julianday('now') - julianday(birthday))/365.25 > 34;	european_football_2
SELECT SUM(m.home_team_goal)  FROM Match m  WHERE EXISTS (     SELECT 1      FROM Player p      WHERE p.player_name = 'Aaron Lennon'      AND (m.home_player_1 = p.player_api_id OR m.home_player_2 = p.player_api_id OR m.home_player_3 = p.player_api_id OR m.home_player_4 = p.player_api_id OR m.home_player_5 = p.player_api_id OR m.home_player_6 = p.player_api_id OR m.home_player_7 = p.player_api_id OR m.home_player_8 = p.player_api_id OR m.home_player_9 = p.player_api_id OR m.home_player_10 = p.player_api_id OR m.home_player_11 = p.player_api_id) );	european_football_2
SELECT SUM(m.away_team_goal)  FROM Match m WHERE EXISTS (     SELECT 1      FROM Player p      WHERE p.player_name IN ('Daan Smith', 'Filipe Ferreira')      AND (         m.away_player_1 = p.player_api_id OR          m.away_player_2 = p.player_api_id OR          m.away_player_3 = p.player_api_id OR          m.away_player_4 = p.player_api_id OR          m.away_player_5 = p.player_api_id OR          m.away_player_6 = p.player_api_id OR          m.away_player_7 = p.player_api_id OR          m.away_player_8 = p.player_api_id OR          m.away_player_9 = p.player_api_id OR          m.away_player_10 = p.player_api_id OR          m.away_player_11 = p.player_api_id     ) );	european_football_2
SELECT SUM(m.home_team_goal)  FROM Match m WHERE EXISTS (     SELECT 1      FROM Player p     WHERE          (p.player_api_id = m.home_player_1          OR p.player_api_id = m.home_player_2          OR p.player_api_id = m.home_player_3          OR p.player_api_id = m.home_player_4          OR p.player_api_id = m.home_player_5          OR p.player_api_id = m.home_player_6          OR p.player_api_id = m.home_player_7          OR p.player_api_id = m.home_player_8          OR p.player_api_id = m.home_player_9          OR p.player_api_id = m.home_player_10          OR p.player_api_id = m.home_player_11)         AND (JULIANDAY('now') - JULIANDAY(p.birthday)) / 365.25 <= 30 );	european_football_2
SELECT p.player_name  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE pa.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)	european_football_2
SELECT p.player_name  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE pa.potential = (SELECT MAX(potential) FROM Player_Attributes)	european_football_2
SELECT DISTINCT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.attacking_work_rate = 'high'	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.finishing = 1 ORDER BY (JULIANDAY('now') - JULIANDAY(p.birthday)) DESC LIMIT 1;	european_football_2
SELECT DISTINCT p.player_name FROM Player p JOIN Match m ON p.player_api_id IN (m.home_player_1, m.home_player_2, m.home_player_3, m.home_player_4, m.home_player_5, m.home_player_6, m.home_player_7, m.home_player_8, m.home_player_9, m.home_player_10, m.home_player_11, m.away_player_1, m.away_player_2, m.away_player_3, m.away_player_4, m.away_player_5, m.away_player_6, m.away_player_7, m.away_player_8, m.away_player_9, m.away_player_10, m.away_player_11) WHERE m.country_id = (SELECT id FROM Country WHERE name = 'Belgium');	european_football_2
SELECT DISTINCT p.player_name, c.name AS country FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id JOIN Match m ON      m.home_player_1 = pa.player_api_id OR      m.home_player_2 = pa.player_api_id OR      m.home_player_3 = pa.player_api_id OR      m.home_player_4 = pa.player_api_id OR      m.home_player_5 = pa.player_api_id OR      m.home_player_6 = pa.player_api_id OR      m.home_player_7 = pa.player_api_id OR      m.home_player_8 = pa.player_api_id OR      m.home_player_9 = pa.player_api_id OR      m.home_player_10 = pa.player_api_id OR      m.home_player_11 = pa.player_api_id OR      m.away_player_1 = pa.player_api_id OR      m.away_player_2 = pa.player_api_id OR      m.away_player_3 = pa.player_api_id OR      m.away_player_4 = pa.player_api_id OR      m.away_player_5 = pa.player_api_id OR      m.away_player_6 = pa.player_api_id OR      m.away_player_7 = pa.player_api_id OR      m.away_player_8 = pa.player_api_id OR      m.away_player_9 = pa.player_api_id OR      m.away_player_10 = pa.player_api_id OR      m.away_player_11 = pa.player_api_id  JOIN League l ON m.league_id = l.id JOIN Country c ON l.country_id = c.id WHERE pa.vision >= 90;	european_football_2
SELECT c.name  FROM (     SELECT home_player_1 AS player_api_id, country_id FROM Match     UNION ALL SELECT home_player_2, country_id FROM Match     UNION ALL SELECT home_player_3, country_id FROM Match     UNION ALL SELECT home_player_4, country_id FROM Match     UNION ALL SELECT home_player_5, country_id FROM Match     UNION ALL SELECT home_player_6, country_id FROM Match     UNION ALL SELECT home_player_7, country_id FROM Match     UNION ALL SELECT home_player_8, country_id FROM Match     UNION ALL SELECT home_player_9, country_id FROM Match     UNION ALL SELECT home_player_10, country_id FROM Match     UNION ALL SELECT home_player_11, country_id FROM Match     UNION ALL SELECT away_player_1, country_id FROM Match     UNION ALL SELECT away_player_2, country_id FROM Match     UNION ALL SELECT away_player_3, country_id FROM Match     UNION ALL SELECT away_player_4, country_id FROM Match     UNION ALL SELECT away_player_5, country_id FROM Match     UNION ALL SELECT away_player_6, country_id FROM Match     UNION ALL SELECT away_player_7, country_id FROM Match     UNION ALL SELECT away_player_8, country_id FROM Match     UNION ALL SELECT away_player_9, country_id FROM Match     UNION ALL SELECT away_player_10, country_id FROM Match     UNION ALL SELECT away_player_11, country_id FROM Match ) AS all_players JOIN Player p ON all_players.player_api_id = p.player_api_id JOIN Country c ON all_players.country_id = c.id GROUP BY c.id ORDER BY AVG(p.weight) DESC LIMIT 1;	european_football_2
SELECT DISTINCT t.team_long_name FROM Team t JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id WHERE ta.buildUpPlaySpeedClass = 'Slow'	european_football_2
SELECT DISTINCT T.team_short_name FROM Team T JOIN Team_Attributes TA ON T.team_api_id = TA.team_api_id WHERE TA.chanceCreationPassingClass = 'Safe';	european_football_2
SELECT AVG(p.height)  FROM Player p WHERE p.player_api_id IN (     SELECT home_player_1 FROM Match WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy')     UNION ALL SELECT home_player_2 FROM Match WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy')     UNION ALL SELECT home_player_3 FROM Match WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy')     UNION ALL SELECT home_player_4 FROM Match WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy')     UNION ALL SELECT home_player_5 FROM Match WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy')     UNION ALL SELECT home_player_6 FROM Match WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy')     UNION ALL SELECT home_player_7 FROM Match WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy')     UNION ALL SELECT home_player_8 FROM Match WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy')     UNION ALL SELECT home_player_9 FROM Match WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy')     UNION ALL SELECT home_player_10 FROM Match WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy')     UNION ALL SELECT home_player_11 FROM Match WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy')     UNION ALL SELECT away_player_1 FROM Match WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy')     UNION ALL SELECT away_player_2 FROM Match WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy')     UNION ALL SELECT away_player_3 FROM Match WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy')     UNION ALL SELECT away_player_4 FROM Match WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy')     UNION ALL SELECT away_player_5 FROM Match WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy')     UNION ALL SELECT away_player_6 FROM Match WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy')     UNION ALL SELECT away_player_7 FROM Match WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy')     UNION ALL SELECT away_player_8 FROM Match WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy')     UNION ALL SELECT away_player_9 FROM Match WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy')     UNION ALL SELECT away_player_10 FROM Match WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy')     UNION ALL SELECT away_player_11 FROM Match WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy') );	european_football_2
SELECT player_name  FROM Player  WHERE height > 180  ORDER BY player_name  LIMIT 3;	european_football_2
SELECT COUNT(*)  FROM Player  WHERE player_name LIKE 'Aaron%'  AND birthday > '1990'	european_football_2
SELECT      (SELECT pa1.jumping       FROM Player p       JOIN Player_Attributes pa1 ON p.player_api_id = pa1.player_api_id      WHERE p.id = 6      ORDER BY pa1.date DESC LIMIT 1)   -     (SELECT pa2.jumping       FROM Player p       JOIN Player_Attributes pa2 ON p.player_api_id = pa2.player_api_id      WHERE p.id = 23      ORDER BY pa2.date DESC LIMIT 1) AS difference;	european_football_2
SELECT p.id FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.preferred_foot = 'right' GROUP BY p.id ORDER BY MIN(pa.potential) ASC LIMIT 5;	european_football_2
SELECT COUNT(DISTINCT pa.player_api_id)  FROM Player_Attributes pa  WHERE pa.crossing = (SELECT MAX(crossing) FROM Player_Attributes WHERE preferred_foot = 'left')  AND pa.preferred_foot = 'left'	european_football_2
SELECT      (SELECT COUNT(DISTINCT pa.player_api_id)       FROM Player_Attributes pa       WHERE pa.strength > 80 AND pa.stamina > 80) * 100.0 /      (SELECT COUNT(*) FROM Player) AS percentage;	european_football_2
SELECT Country.name  FROM League  JOIN Country ON League.country_id = Country.id  WHERE League.name = 'Poland Ekstraklasa';	european_football_2
SELECT home_team_goal, away_team_goal  FROM Match  JOIN League ON Match.league_id = League.id  WHERE date LIKE '2008-09-24%'  AND League.name = 'Belgium Jupiler League';	european_football_2
SELECT pa.sprint_speed, pa.agility, pa.acceleration FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name = 'Alexis Blin';	european_football_2
SELECT ta.buildUpPlaySpeedClass  FROM Team t  JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id  WHERE t.team_long_name = 'KSV Cercle Brugge'  ORDER BY ta.date DESC  LIMIT 1;	european_football_2
SELECT COUNT(*)  FROM Match  WHERE league_id = 10257 AND season = '2015/2016'	european_football_2
SELECT MAX(home_team_goal)  FROM Match  JOIN League ON Match.league_id = League.id  WHERE League.name = 'Netherlands Eredivisie';	european_football_2
SELECT pa.finishing, pa.curve FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.weight = (SELECT MAX(weight) FROM Player)	european_football_2
SELECT L.name, COUNT(M.id) AS game_count FROM Match M JOIN League L ON M.league_id = L.id WHERE M.season = '2015/2016' GROUP BY L.id, L.name ORDER BY game_count DESC LIMIT 4;	european_football_2
SELECT DISTINCT T.team_long_name  FROM Team T  JOIN Match M ON T.team_api_id = M.away_team_api_id  WHERE M.away_team_goal = (SELECT MAX(away_team_goal) FROM Match)	european_football_2
SELECT p.player_name  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  ORDER BY pa.overall_rating DESC  LIMIT 1;	european_football_2
SELECT      ( (SELECT COUNT(*)          FROM Player p         WHERE p.height < 180          AND EXISTS (SELECT 1 FROM Player_Attributes pa                      WHERE pa.player_api_id = p.player_api_id                      AND pa.overall_rating >70)     ) * 100.0 / (SELECT COUNT(*) FROM Player) ) AS percentage;	european_football_2
SELECT      SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) AS inpatient_count,     SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END) AS outpatient_count,     ROUND(         (SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) * 100.0           / NULLIF(SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END), 0)), 2     ) AS percentage FROM Patient WHERE SEX = 'M'	thrombosis_prediction
SELECT (COUNT(CASE WHEN YEAR(Birthday) > 1930 THEN 1 END) / COUNT(*)) * 100 AS percentage FROM Patient WHERE SEX = 'F';	thrombosis_prediction
SELECT (COUNT(CASE WHEN Admission = '+' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM Patient WHERE Birthday BETWEEN '1930-01-01' AND '1940-12-31'	thrombosis_prediction
SELECT      CAST(SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END) AS REAL) /      CAST(SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) AS REAL)  FROM Patient  WHERE Diagnosis = 'SLE'	thrombosis_prediction
SELECT Diagnosis FROM Patient WHERE ID = 30609; SELECT Date FROM Laboratory WHERE ID = 30609;	thrombosis_prediction
SELECT Patient.SEX, Patient.Birthday, Examination.`Examination Date`, Examination.Symptoms  FROM Patient  LEFT JOIN Examination ON Patient.ID = Examination.ID  WHERE Patient.ID = 163109;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.LDH > 500;	thrombosis_prediction
SELECT Patient.ID, (YEAR(CURDATE()) - YEAR(Patient.Birthday)) AS age FROM Patient INNER JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.RVVT = '+';	thrombosis_prediction
SELECT P.ID, P.SEX, P.Diagnosis  FROM Patient P  INNER JOIN Examination E ON P.ID = E.ID  WHERE E.Thrombosis = 2;	thrombosis_prediction
SELECT Patient.ID FROM Patient WHERE YEAR(Patient.Birthday) = 1937 AND EXISTS (     SELECT 1     FROM Laboratory     WHERE Laboratory.ID = Patient.ID     AND Laboratory.`T-CHO` >= 250 );	thrombosis_prediction
SELECT DISTINCT p.ID, p.SEX, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.ALB < 3.5;	thrombosis_prediction
SELECT      (COUNT(DISTINCT CASE WHEN l.TP < 6.0 OR l.TP > 8.5 THEN p.ID END) /       COUNT(DISTINCT p.ID)) * 100  FROM Patient p LEFT JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'F';	thrombosis_prediction
SELECT AVG(e.`aCL IgG`)  FROM `Patient` p  JOIN `Examination` e ON p.ID = e.ID  WHERE p.Admission = '+'  AND (YEAR(CURRENT_TIMESTAMP) - YEAR(p.Birthday)) >= 50	thrombosis_prediction
SELECT COUNT(*)  FROM Patient WHERE SEX = 'F'  AND YEAR(Description) = 1997  AND Admission = '-';	thrombosis_prediction
SELECT MIN(YEAR(`First Date`) - YEAR(`Birthday`)) AS youngest_age  FROM Patient  WHERE `First Date` IS NOT NULL;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  WHERE SEX = 'F'  AND ID IN (     SELECT ID      FROM Examination      WHERE Thrombosis = 1      AND "Examination Date" BETWEEN '1997-01-01' AND '1997-12-31' );	thrombosis_prediction
SELECT MAX(YEAR(P.Birthday)) - MIN(YEAR(P.Birthday))  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.TG >= 200;	thrombosis_prediction
SELECT Patient.Diagnosis, Examination.Symptoms  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE Patient.ID = (     SELECT ID      FROM Patient      WHERE EXISTS (SELECT 1 FROM Examination WHERE Examination.ID = Patient.ID)      ORDER BY Birthday DESC      LIMIT 1 )  AND Examination.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT COUNT(p.ID) / 12 AS average  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.SEX = 'M'  AND l.Date BETWEEN '1998-01-01' AND '1998-12-31'	thrombosis_prediction
SELECT      (SELECT Date FROM Laboratory WHERE ID = P.ID) AS laboratory_date,     strftime('%Y', P.`First Date`) - strftime('%Y', P.Birthday) AS age FROM Patient P WHERE P.Diagnosis = 'SJS' ORDER BY P.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT      (SUM(CASE WHEN p.SEX = 'M' AND l.UA <= 8.0 THEN 1 ELSE 0 END) /       SUM(CASE WHEN p.SEX = 'F' AND l.UA <= 6.5 THEN 1 ELSE 0 END)) AS ratio FROM Patient p JOIN Laboratory l ON p.ID = l.ID;	thrombosis_prediction
SELECT COUNT(*)  FROM (     SELECT p.ID, MIN(e.`Examination Date`) AS first_exam, p.`First Date`     FROM Patient p     LEFT JOIN Examination e ON p.ID = e.ID     GROUP BY p.ID ) AS sub WHERE first_exam IS NULL OR (YEAR(first_exam) - YEAR(`First Date`) >= 1)	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE YEAR(e.`Examination Date`) BETWEEN 1990 AND 1993  AND (YEAR(e.`Examination Date`) - YEAR(p.Birthday)) < 18;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.SEX = 'M' AND l.`T-BIL` >= 2.0;	thrombosis_prediction
SELECT Diagnosis, COUNT(*) AS cnt FROM Patient WHERE ID IN (     SELECT ID FROM Examination     WHERE `Examination Date` BETWEEN '1985-01-01' AND '1995-12-31' ) GROUP BY Diagnosis ORDER BY cnt DESC LIMIT 1;	thrombosis_prediction
SELECT AVG(1999 - YEAR(Patient.Birthday))  FROM Patient  INNER JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.Date BETWEEN '1991-10-01' AND '1991-10-30'	thrombosis_prediction
SELECT (YEAR(E.`Examination Date`) - YEAR(P.Birthday)) AS age, P.Diagnosis FROM Patient P JOIN Laboratory L ON P.ID = L.ID JOIN Examination E ON P.ID = E.ID AND E.`Examination Date` = L.Date WHERE L.HGB = (SELECT MAX(HGB) FROM Laboratory) LIMIT 1;	thrombosis_prediction
SELECT ANA FROM Examination WHERE ID = 3605340 AND `Examination Date` = '1996-12-02'	thrombosis_prediction
SELECT CASE WHEN `T-CHO` < 250 THEN 'Normal' ELSE 'Abnormal' END  FROM Laboratory  WHERE `ID` = 2927464 AND `Date` = '1995-09-04';	thrombosis_prediction
SELECT p.SEX  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.Diagnosis = 'AORTITIS'  ORDER BY e.`Examination Date` ASC  LIMIT 1;	thrombosis_prediction
SELECT `Examination`.`aCL IgM`  FROM `Patient`  JOIN `Examination` ON `Patient`.`ID` = `Examination`.`ID`  WHERE `Patient`.`Diagnosis` = 'SLE'  AND `Patient`.`Description` = '1994-02-19'  AND `Examination`.`Examination Date` = '1993-11-12';	thrombosis_prediction
SELECT Patient.SEX  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.Date = '1992-06-12' AND Laboratory.GPT = 9;	thrombosis_prediction
SELECT (YEAR(l.Date) - YEAR(p.Birthday)) AS age  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.Date = '1991-10-21' AND l.UA = 8.4;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.`First Date` = '1991-06-13'  AND p.Diagnosis = 'SJS'  AND l.Date BETWEEN '1995-01-01' AND '1995-12-31';	thrombosis_prediction
SELECT Patient.Diagnosis  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE Examination.`Examination Date` = '1997-01-27'  AND Examination.Diagnosis = 'SLE';	thrombosis_prediction
SELECT Symptoms  FROM Examination  JOIN Patient USING (ID)  WHERE Patient.Birthday = '1959-03-01'  AND `Examination Date` = '1993-09-27';	thrombosis_prediction
SELECT      SUM(CASE WHEN `Date` LIKE '1981-11%' THEN `T-CHO` ELSE 0 END) -      SUM(CASE WHEN `Date` LIKE '1981-12%' THEN `T-CHO` ELSE 0 END)  FROM `Laboratory`  WHERE `ID` = (SELECT `ID` FROM `Patient` WHERE `Birthday` = '1959-02-18')  AND `Date` LIKE '1981-11%' OR `Date` LIKE '1981-12%';	thrombosis_prediction
SELECT ID FROM Patient WHERE Diagnosis LIKE '%Behcet%' AND YEAR(Description) >= 1997 AND YEAR(Description) < 1998;	thrombosis_prediction
SELECT DISTINCT ID  FROM Laboratory  WHERE Date BETWEEN '1987-07-06' AND '1996-01-31'  AND GPT > 30  AND ALB < 4;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND YEAR(Birthday) = 1964 AND Admission = '+'; SELECT ID FROM Patient WHERE SEX = 'F' AND YEAR(Birthday) = 1964 AND Admission = '+' ORDER BY ID;	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Examination  WHERE Thrombosis = 2  AND `ANA Pattern` = 'S'  AND `aCL IgM` >= (SELECT 1.2 * AVG(`aCL IgM`) FROM Examination);	thrombosis_prediction
SELECT      (COUNT(CASE WHEN has_low THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM (     SELECT          L.ID,         MAX(CASE WHEN CAST(`U-PRO` AS REAL) > 0 AND CAST(`U-PRO` AS REAL) < 30 THEN 1 ELSE 0 END) AS in_range,         MAX(CASE WHEN UA <= 6.5 THEN 1 ELSE 0 END) AS has_low     FROM Laboratory L     GROUP BY L.ID     HAVING in_range = 1 ) AS subquery;	thrombosis_prediction
SELECT      (COUNT(CASE WHEN Diagnosis = 'BEHCET' THEN 1 END) / COUNT(*) ) * 100 AS percentage  FROM Patient  WHERE SEX = 'M' AND YEAR(`First Date`) = 1981;	thrombosis_prediction
SELECT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Admission = '-' AND Laboratory.Date LIKE '1991-10%' AND Laboratory.`T-BIL` < 2.0;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  WHERE SEX = 'F'  AND Birthday BETWEEN '1980-01-01' AND '1989-12-31'  AND NOT EXISTS (     SELECT 1      FROM Examination      WHERE Examination.ID = Patient.ID      AND `ANA Pattern` = 'P only' );	thrombosis_prediction
SELECT Patient.SEX  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.Diagnosis = 'PSS'  AND Laboratory.CRP = '2+'  AND Laboratory.CRE = 1  AND Laboratory.LDH = 123;	thrombosis_prediction
SELECT AVG(LABORATORY.ALB)  FROM PATIENT  JOIN LABORATORY ON PATIENT.ID = LABORATORY.ID  WHERE PATIENT.SEX = 'F'  AND PATIENT.DIAGNOSIS = 'SLE'  AND LABORATORY.PLT > 400;	thrombosis_prediction
SELECT Symptoms, COUNT(*) AS cnt FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE P.Diagnosis = 'SLE' GROUP BY Symptoms ORDER BY cnt DESC LIMIT 1;	thrombosis_prediction
SELECT `Description`, `Diagnosis` FROM `Patient` WHERE `ID` = 48473;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND Diagnosis = 'APS'	thrombosis_prediction
SELECT COUNT(DISTINCT L.ID)  FROM Laboratory L  WHERE YEAR(L.Date) = 1997  AND (L.TP <= 6 OR L.TP >= 8.5)	thrombosis_prediction
SELECT      (COUNT(DISTINCT CASE WHEN p.Diagnosis LIKE '%SLE%' THEN p.ID END) * 100.0) /      COUNT(DISTINCT p.ID)  FROM      Patient p JOIN      Examination e ON p.ID = e.ID WHERE      e.Symptoms LIKE '%thrombocytopenia%';	thrombosis_prediction
SELECT      (SUM(CASE WHEN SEX = 'F' THEN 1 ELSE 0 END) / COUNT(*) ) * 100  FROM Patient  WHERE YEAR(Birthday) = 1980  AND Diagnosis = 'RA'	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'M'  AND e.`Examination Date` BETWEEN '1995-01-01' AND '1997-12-31'  AND p.Diagnosis = 'Behcet'  AND p.Admission = '-';	thrombosis_prediction
SELECT COUNT(*)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.SEX = 'F' AND L.WBC < 3.5;	thrombosis_prediction
SELECT DATEDIFF(e.`Examination Date`, p.`First Date`)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE p.ID = 821298;	thrombosis_prediction
SELECT CASE      WHEN (p.SEX = 'M' AND l.UA > 8.0) OR (p.SEX = 'F' AND l.UA > 6.5) THEN 'Yes'      ELSE 'No'  END  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.ID = 57266;	thrombosis_prediction
SELECT `Date` FROM `Laboratory` WHERE `ID` = 48473 AND `GOT` >= 60;	thrombosis_prediction
SELECT DISTINCT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE YEAR(l.Date) = 1994 AND l.GOT < 60;	thrombosis_prediction
SELECT DISTINCT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.GPT >= 60	thrombosis_prediction
SELECT Patient.Diagnosis  FROM Patient  INNER JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.GPT > 60  ORDER BY Patient.Birthday ASC;	thrombosis_prediction
SELECT AVG(LDH) FROM Laboratory WHERE LDH < 500;	thrombosis_prediction
SELECT Patient.ID, (YEAR(CURRENT_TIMESTAMP) - YEAR(Patient.Birthday)) AS age  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.LDH BETWEEN 600 AND 800;	thrombosis_prediction
SELECT DISTINCT Patient.Admission FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.ALP < 300;	thrombosis_prediction
SELECT Patient.ID,         CASE WHEN Laboratory.ALP < 300 THEN 'Yes' ELSE 'No' END AS ALP_Normal  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.Birthday = '1982-04-01';	thrombosis_prediction
SELECT DISTINCT p.ID, p.SEX, p.Birthday  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.TP < 6.0;	thrombosis_prediction
SELECT (Laboratory.TP - 8.5) AS deviation  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.SEX = 'F' AND Laboratory.TP > 8.5;	thrombosis_prediction
SELECT P.* FROM Patient P WHERE P.SEX = 'M'  AND EXISTS (     SELECT 1      FROM Laboratory L      WHERE L.ID = P.ID      AND (L.ALB <= 3.5 OR L.ALB >= 5.5) ) ORDER BY P.Birthday DESC;	thrombosis_prediction
SELECT P.ID,      CASE          WHEN EXISTS (SELECT 1 FROM Laboratory L WHERE L.ID = P.ID AND L.ALB BETWEEN 3.5 AND 5.5) THEN 'Yes'         ELSE 'No'     END AS AlbuminInRange FROM Patient P WHERE YEAR(P.Birthday) = 1982;	thrombosis_prediction
SELECT      (COUNT(DISTINCT CASE WHEN l.UA > 6.5 THEN p.ID END) * 100.0 / COUNT(DISTINCT p.ID)) AS percentage FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'F';	thrombosis_prediction
SELECT AVG(L.UA)  FROM Laboratory L JOIN (     SELECT ID, MAX(`Date`) AS latest_date     FROM Laboratory     GROUP BY ID ) AS Latest ON L.ID = Latest.ID AND L.`Date` = Latest.latest_date JOIN Patient P ON L.ID = P.ID WHERE      (P.SEX = 'M' AND L.UA < 8.0) OR      (P.SEX = 'F' AND L.UA < 6.5);	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.UN = 29;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Diagnosis = 'RA' AND Laboratory.UN < 30;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.SEX = 'M' AND L.CRE >= 1.5	thrombosis_prediction
SELECT      CASE          WHEN SUM(CASE WHEN P.SEX = 'M' THEN 1 ELSE 0 END) > SUM(CASE WHEN P.SEX = 'F' THEN 1 ELSE 0 END)          THEN 'True'          ELSE 'False'      END  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.CRE >= 1.5;	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday FROM Patient P INNER JOIN Laboratory L ON P.ID = L.ID WHERE L.`T-BIL` = (SELECT MAX(`T-BIL`) FROM Laboratory);	thrombosis_prediction
SELECT Patient.SEX, GROUP_CONCAT(DISTINCT Patient.ID)  FROM Patient INNER JOIN Laboratory USING (ID) WHERE `T-BIL` >= 2.0 GROUP BY Patient.SEX	thrombosis_prediction
SELECT p.ID, l.`T-CHO`  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.`T-CHO` = (SELECT MAX(`T-CHO`) FROM Laboratory)  ORDER BY p.Birthday ASC  LIMIT 1;	thrombosis_prediction
SELECT AVG(YEAR(NOW()) - YEAR(Patient.Birthday))  FROM Patient  WHERE SEX = 'M'  AND EXISTS (     SELECT 1      FROM Laboratory      WHERE Laboratory.ID = Patient.ID      AND `T-CHO` >= 250 );	thrombosis_prediction
SELECT Patient.ID, Patient.Diagnosis FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.TG > 300;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l USING (ID)  WHERE l.TG >= 200  AND (YEAR(CURRENT_TIMESTAMP) - YEAR(p.Birthday)) > 50;	thrombosis_prediction
SELECT DISTINCT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Admission = '-' AND Laboratory.CPK < 250;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.SEX = 'M'  AND YEAR(P.Birthday) BETWEEN 1936 AND 1956  AND L.CPK >= 250;	thrombosis_prediction
SELECT P.ID, P.SEX, (CAST(strftime('%Y', 'now') AS INTEGER) - CAST(strftime('%Y', P.Birthday) AS INTEGER)) AS Age FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GLU >= 180 AND L.`T-CHO` < 250;	thrombosis_prediction
SELECT Patient.ID, Laboratory.GLU  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE YEAR(Patient.Description) = 1991  AND Laboratory.GLU < 180;	thrombosis_prediction
SELECT DISTINCT P.ID, P.SEX, P.Birthday FROM Patient P INNER JOIN Laboratory L ON P.ID = L.ID WHERE L.WBC <= 3.5 OR L.WBC >= 9.0 ORDER BY P.SEX, P.Birthday DESC;	thrombosis_prediction
SELECT Patient.ID, Patient.Diagnosis, (YEAR(CURRENT_TIMESTAMP) - YEAR(Patient.Birthday)) AS Age FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.RBC < 3.5;	thrombosis_prediction
SELECT Patient.ID, Patient.Admission FROM Patient WHERE Patient.SEX = 'F' AND (YEAR(CURRENT_TIMESTAMP) - YEAR(Patient.Birthday)) >= 50 AND EXISTS (     SELECT 1     FROM Laboratory     WHERE Laboratory.ID = Patient.ID     AND (Laboratory.RBC <= 3.5 OR Laboratory.RBC >= 6.0) );	thrombosis_prediction
SELECT P.ID, P.SEX FROM Patient P WHERE P.Admission = '-' AND EXISTS (     SELECT 1 FROM Laboratory L WHERE L.ID = P.ID AND L.HGB < 10 );	thrombosis_prediction
SELECT Patient.ID, Patient.SEX  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.Diagnosis = 'SLE'  AND Laboratory.HGB BETWEEN 10 AND 17  ORDER BY Patient.Birthday ASC  LIMIT 1;	thrombosis_prediction
SELECT p.ID, (YEAR(CURRENT_TIMESTAMP) - YEAR(p.Birthday)) AS age FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.HCT >= 52 GROUP BY p.ID HAVING COUNT(l.ID) >= 2;	thrombosis_prediction
SELECT AVG(HCT)  FROM Laboratory  WHERE Date LIKE '1991%' AND HCT < 29;	thrombosis_prediction
SELECT      SUM(CASE WHEN PLT < 100 THEN 1 ELSE 0 END) AS lower_count,     SUM(CASE WHEN PLT > 400 THEN 1 ELSE 0 END) AS higher_count,     (SUM(CASE WHEN PLT < 100 THEN 1 ELSE 0 END) - SUM(CASE WHEN PLT > 400 THEN 1 ELSE 0 END)) AS difference FROM Laboratory WHERE (PLT <= 100 OR PLT >= 400) AND PLT IS NOT NULL;	thrombosis_prediction
SELECT Patient.ID  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE YEAR(Laboratory.Date) = 1984  AND (YEAR(CURRENT_TIMESTAMP) - YEAR(Patient.Birthday)) < 50  AND Laboratory.PLT BETWEEN 100 AND 400;	thrombosis_prediction
SELECT      (SUM(p.SEX = 'F') / COUNT(*)) * 100 AS percentage FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE      (YEAR(CURDATE()) - YEAR(p.Birthday)) > 55      AND l.PT >= 14;	thrombosis_prediction
SELECT Patient.*  FROM Patient  INNER JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE YEAR(Patient.`First Date`) > 1992  AND Laboratory.PT < 14;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE `Examination Date` > '1997-01-01' AND APTT < 45 AND APTT IS NOT NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Examination WHERE APTT > 45 AND Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  WHERE p.SEX = 'M'  AND EXISTS (     SELECT 1      FROM Laboratory l      WHERE l.ID = p.ID      AND l.WBC > 3.5      AND l.WBC < 9.0 )  AND EXISTS (     SELECT 1      FROM Laboratory l      WHERE l.ID = p.ID      AND (l.FG <= 150 OR l.FG >= 450) );	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.Birthday > '1980-01-01'  AND (l.FG < 150 OR l.FG > 450)	thrombosis_prediction
SELECT DISTINCT p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.`U-PRO` >= 30;	thrombosis_prediction
SELECT Patient.ID  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.Diagnosis = 'SLE'  AND CAST(Laboratory.`U-PRO` AS REAL) > 0  AND CAST(Laboratory.`U-PRO` AS REAL) < 30;	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE IGG >= 2000;	thrombosis_prediction
SELECT COUNT(*) FROM Patient p WHERE EXISTS (SELECT 1 FROM Laboratory l WHERE l.ID = p.ID AND IGG > 900 AND IGG < 2000) AND EXISTS (SELECT 1 FROM Examination e WHERE e.ID = p.ID AND Symptoms IS NOT NULL);	thrombosis_prediction
SELECT P.Diagnosis  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.IGA = (SELECT MAX(L2.IGA) FROM Laboratory L2 WHERE L2.IGA BETWEEN 80 AND 500);	thrombosis_prediction
SELECT COUNT(*) FROM Patient p WHERE p.`First Date` IS NOT NULL AND YEAR(p.`First Date`) >= 1990 AND EXISTS (SELECT 1 FROM Laboratory l WHERE l.ID = p.ID AND l.IGA > 80 AND l.IGA < 500);	thrombosis_prediction
SELECT Diagnosis, COUNT(*) AS cnt  FROM Patient  WHERE EXISTS (     SELECT 1      FROM Laboratory      WHERE Laboratory.ID = Patient.ID      AND (Laboratory.IGM <= 40 OR Laboratory.IGM >= 400) )  GROUP BY Diagnosis  ORDER BY cnt DESC  LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.Description IS NULL AND l.CRP = '+'	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.CRE >= 1.5  AND (YEAR(CURDATE()) - YEAR(p.Birthday)) < 70  AND p.Birthday IS NOT NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  JOIN Laboratory l ON p.ID = l.ID  WHERE e.KCT = '+' AND l.RA IN ('-', '+-');	thrombosis_prediction
SELECT DISTINCT p.Diagnosis  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE YEAR(p.Birthday) >= 1985  AND l.RA IN ('-', '+-')	thrombosis_prediction
SELECT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE CAST(Laboratory.RF AS UNSIGNED) < 20  AND (YEAR(CURDATE()) - YEAR(Patient.Birthday)) > 60;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID JOIN Examination e ON p.ID = e.ID WHERE l.RF < 20 AND e.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  WHERE EXISTS (SELECT 1 FROM Examination e WHERE e.ID = p.ID AND e.`ANA Pattern` = 'P')  AND EXISTS (SELECT 1 FROM Laboratory l WHERE l.ID = p.ID AND l.C3 > 35);	thrombosis_prediction
SELECT E.ID FROM Examination E WHERE E.ID IN (SELECT L.ID FROM Laboratory L WHERE L.HCT <= 29 OR L.HCT >= 52) ORDER BY E.`aCL IgA` DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  JOIN Laboratory l ON p.ID = l.ID  WHERE e.Thrombosis = 1 AND l.C4 > 10	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '+'  AND l.RNP IN ('-', '+-');	thrombosis_prediction
SELECT Patient.Birthday FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.RNP NOT IN ('-', '+-') ORDER BY Patient.Birthday DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID) FROM Examination E WHERE E.SM IN ('-', '+-') AND E.Thrombosis = 0;	thrombosis_prediction
SELECT DISTINCT P.ID  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.SM NOT IN ('negative', '0')  ORDER BY P.Birthday DESC  LIMIT 3;	thrombosis_prediction
SELECT DISTINCT E.ID FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE E.`Examination Date` > '1997-01-01' AND L.SC170 IN ('negative', '0');	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.SEX = 'F'  AND l.SC170 IN ('negative', '0')  AND NOT EXISTS (     SELECT 1      FROM Examination e      WHERE e.ID = p.ID      AND e.Symptoms IS NOT NULL );	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.SSA IN ('-', '+-')  AND YEAR(p.`First Date`) < 2000;	thrombosis_prediction
SELECT P.ID  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.SSA NOT IN ('negative', '0')  ORDER BY P.`First Date` ASC  LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE p.Diagnosis = 'SLE'  AND e.SSB IN ('-', '+-');	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  WHERE EXISTS (     SELECT 1      FROM Laboratory l      WHERE l.ID = p.ID      AND l.SSB IN ('negative', '0') )  AND EXISTS (     SELECT 1      FROM Examination e      WHERE e.ID = p.ID      AND e.Symptoms IS NOT NULL );	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.SEX = 'M'  AND l.CENTROMEA IN ('-', '+-')  AND l.SSB IN ('-', '+-');	thrombosis_prediction
SELECT DISTINCT P.Diagnosis  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.DNA >= 8;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID)  FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Description IS NULL AND L.DNA < 8;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Laboratory USING (ID) WHERE Patient.Admission = '+'  AND Laboratory.IGG > 900  AND Laboratory.IGG < 2000;	thrombosis_prediction
SELECT      (COUNT(DISTINCT CASE WHEN p.Diagnosis = 'SLE' THEN p.ID END) * 1.0 / COUNT(DISTINCT p.ID)) * 100 AS percentage FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GOT >= 60;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID)  FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.GOT < 60;	thrombosis_prediction
SELECT MAX(P.Birthday)  FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GOT >=60;	thrombosis_prediction
SELECT p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GPT < 60 GROUP BY p.ID, p.Birthday ORDER BY MAX(l.GPT) DESC LIMIT 3;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Laboratory USING (ID) WHERE SEX = 'M' AND GOT < 60;	thrombosis_prediction
SELECT MIN(p.`First Date`)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.LDH = (SELECT MAX(LDH) FROM Laboratory WHERE LDH < 500);	thrombosis_prediction
SELECT MAX(date) AS latest_date FROM ( SELECT `Examination Date` AS date FROM Examination WHERE ID = (SELECT ID FROM Patient WHERE First_Date = (SELECT MAX(First_Date) FROM Patient) AND EXISTS (SELECT 1 FROM Laboratory WHERE Laboratory.ID = Patient.ID AND LDH >=500)) UNION ALL SELECT `Date` FROM Laboratory WHERE ID = (SELECT ID FROM Patient WHERE First_Date = (SELECT MAX(First_Date) FROM Patient) AND EXISTS (SELECT 1 FROM Laboratory WHERE Laboratory.ID = Patient.ID AND LDH >=500)) ) AS all_dates;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.ALP >= 300  AND p.Admission = '+'	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.Admission = '-' AND l.ALP < 300;	thrombosis_prediction
SELECT DISTINCT P.Diagnosis  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.TP < 6.0;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.Diagnosis = 'SJS'  AND l.TP > 6.0  AND l.TP < 8.5;	thrombosis_prediction
SELECT Date  FROM Laboratory  WHERE ALB = (SELECT MAX(ALB) FROM Laboratory WHERE ALB > 3.5 AND ALB < 5.5);	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.SEX = 'M'  AND L.ALB > 3.5  AND L.ALB < 5.5  AND L.TP BETWEEN 6.0 AND 8.5;	thrombosis_prediction
SELECT E.`aCL IgG`, E.`aCL IgM`, E.`aCL IgA`  FROM Examination E  JOIN Patient P ON E.ID = P.ID  WHERE P.SEX = 'F'  AND E.ID IN (     SELECT L.ID      FROM Laboratory L      JOIN Patient P ON L.ID = P.ID      WHERE P.SEX = 'F'      AND L.UA = (         SELECT MAX(L2.UA)          FROM Laboratory L2          JOIN Patient P2 ON L2.ID = P2.ID          WHERE P2.SEX = 'F'          AND L2.UA > 6.50     ) );	thrombosis_prediction
SELECT MAX(e.ANA)  FROM Examination e  WHERE EXISTS (     SELECT 1      FROM Laboratory l      WHERE l.ID = e.ID      AND l.CRE < 1.5 );	thrombosis_prediction
SELECT E.ID  FROM Examination E  WHERE E.`aCL IgA` = (     SELECT MAX(E2.`aCL IgA`)      FROM Examination E2      WHERE E2.ID IN (         SELECT L.ID          FROM Laboratory L          WHERE L.CRE < 1.5     ) )  AND E.ID IN (     SELECT L.ID      FROM Laboratory L      WHERE L.CRE < 1.5 );	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p WHERE EXISTS (     SELECT 1      FROM Laboratory l      WHERE l.ID = p.ID        AND l.T_BIL >= 2.0 )  AND EXISTS (     SELECT 1      FROM Examination e      WHERE e.ID = p.ID        AND e.ANA_Pattern LIKE '%P%' )	thrombosis_prediction
SELECT E.ANA  FROM Examination E  JOIN Laboratory L ON E.ID = L.ID  WHERE L.`T-BIL` = (SELECT MAX(`T-BIL`) FROM Laboratory WHERE `T-BIL` < 2.0)	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p WHERE EXISTS (SELECT 1 FROM Laboratory l WHERE l.ID = p.ID AND l.`T-CHO` >= 250) AND EXISTS (SELECT 1 FROM Examination e WHERE e.ID = p.ID AND e.KCT = '-');	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p WHERE EXISTS (SELECT 1 FROM Laboratory l WHERE l.ID = p.ID AND l.`T-CHO` < 250) AND EXISTS (SELECT 1 FROM Examination e WHERE e.ID = p.ID AND e.`ANA Pattern` = 'P');	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p WHERE EXISTS (SELECT 1 FROM Laboratory l WHERE l.ID = p.ID AND l.TG < 200) AND EXISTS (SELECT 1 FROM Examination e WHERE e.ID = p.ID AND e.Symptoms IS NOT NULL);	thrombosis_prediction
SELECT p.Diagnosis  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.TG < 200  ORDER BY l.TG DESC  LIMIT 1;	thrombosis_prediction
SELECT Patient.ID  FROM Patient  WHERE EXISTS (     SELECT 1      FROM Examination      WHERE Examination.ID = Patient.ID      AND Thrombosis = 0 )  AND EXISTS (     SELECT 1      FROM Laboratory      WHERE Laboratory.ID = Patient.ID      AND CPK < 250 );	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p WHERE  EXISTS (SELECT 1 FROM Laboratory l WHERE l.ID = p.ID AND l.CPK < 250) AND EXISTS (SELECT 1 FROM Examination e WHERE e.ID = p.ID AND (e.KCT = '+' OR e.RVVT = '+' OR e.LAC = '+'));	thrombosis_prediction
SELECT MIN(P.Birthday)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.GLU > 180;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.GLU < 180 AND e.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '+' AND l.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.Diagnosis = 'SLE' AND L.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT DISTINCT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Admission = '-' AND (Laboratory.RBC <= 3.5 OR Laboratory.RBC >= 6.0);	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.PLT > 100 AND l.PLT < 400 AND l.PLT IS NOT NULL AND p.Diagnosis IS NOT NULL;	thrombosis_prediction
SELECT Laboratory.PLT  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.Diagnosis = 'MCTD'  AND Laboratory.PLT > 100  AND Laboratory.PLT < 400;	thrombosis_prediction
SELECT AVG(L.PT)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.SEX = 'M' AND L.PT < 14;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p  WHERE EXISTS (     SELECT 1      FROM Examination e      WHERE e.ID = p.ID AND e.Thrombosis IN (1,2) )  AND EXISTS (     SELECT 1      FROM Laboratory l      WHERE l.ID = p.ID AND l.PT < 14 );	thrombosis_prediction
SELECT major.major_name  FROM major  JOIN member ON major.major_id = member.link_to_major  WHERE member.first_name = 'Angela' AND member.last_name = 'Sanders';	student_club
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.college = 'College of Engineering'	student_club
SELECT m.first_name, m.last_name  FROM member m  JOIN major ma ON m.link_to_major = ma.major_id  WHERE ma.department = 'Art and Design Department';	student_club
SELECT COUNT(*)  FROM attendance  JOIN event ON attendance.link_to_event = event.event_id  WHERE event.event_name = 'Women''s Soccer';	student_club
SELECT m.phone FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer';	student_club
SELECT COUNT(*)  FROM member  JOIN attendance ON member.member_id = attendance.link_to_member  JOIN event ON event.event_id = attendance.link_to_event  WHERE event.event_name = 'Women''s Soccer'  AND member.position = 'Student_Club'  AND member.t_shirt_size = 'Medium'	student_club
SELECT event.*, COUNT(attendance.link_to_event) AS attendance_count FROM event JOIN attendance ON event.event_id = attendance.link_to_event GROUP BY event.event_id ORDER BY attendance_count DESC LIMIT 1;	student_club
SELECT major.college  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE member.position = 'Vice President'	student_club
SELECT e.event_name  FROM member m  JOIN attendance a ON m.member_id = a.link_to_member  JOIN event e ON a.link_to_event = e.event_id  WHERE m.first_name = 'Maya' AND m.last_name = 'Mclean';	student_club
SELECT COUNT(*)  FROM attendance a JOIN member m ON a.link_to_member = m.member_id JOIN event e ON a.link_to_event = e.event_id WHERE m.first_name = 'Sacha'  AND m.last_name = 'Harrison'  AND e.type = 'Student_Club'  AND YEAR(e.event_date) = 2019;	student_club
SELECT COUNT(*)  FROM (     SELECT e.event_id     FROM event e     JOIN attendance a ON e.event_id = a.link_to_event     WHERE e.type = 'Meeting'     GROUP BY e.event_id     HAVING COUNT(event_id) > 10 ) AS sub;	student_club
SELECT e.event_name FROM event e JOIN (     SELECT link_to_event, COUNT(*) AS attendee_count     FROM attendance     GROUP BY link_to_event ) a ON e.event_id = a.link_to_event WHERE e.type != 'fundraiser' AND a.attendee_count > 20;	student_club
SELECT AVG(attendee_count) AS average_attendance FROM (SELECT COUNT(*) AS attendee_count FROM attendance a JOIN event e ON a.link_to_event = e.event_id WHERE e.type = 'Meeting' AND YEAR(e.event_date) = 2020 GROUP BY a.link_to_event) AS subquery;	student_club
SELECT expense_description, cost FROM expense JOIN budget ON expense.link_to_budget = budget.budget_id JOIN event ON budget.link_to_event = event.event_id ORDER BY cost DESC LIMIT 1;	student_club
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Environmental Engineering'	student_club
SELECT member.first_name, member.last_name FROM member JOIN attendance ON member.member_id = attendance.link_to_member JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'Laugh Out Loud';	student_club
SELECT member.last_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Law and Constitutional Studies';	student_club
SELECT zip_code.county  FROM member  JOIN zip_code ON member.zip = zip_code.zip_code  WHERE member.first_name = 'Sherri' AND member.last_name = 'Ramsey';	student_club
SELECT major.college  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE member.first_name = 'Tyler' AND member.last_name = 'Hewitt'	student_club
SELECT SUM(amount)  FROM income  JOIN member ON income.link_to_member = member.member_id  WHERE member.position = 'Vice President'	student_club
SELECT SUM(b.spent)  FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'September Meeting'  AND b.category = 'Food';	student_club
SELECT z.city, z.state FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.position = 'President';	student_club
SELECT first_name, last_name FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE zip_code.state = 'Illinois';	student_club
SELECT SUM(b.spent)  FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'September Meeting'  AND b.category = 'Advertisement';	student_club
SELECT m.department  FROM major m  JOIN member p ON m.major_id = p.link_to_major  JOIN member g ON m.major_id = g.link_to_major  WHERE p.last_name = 'Pierce'  AND g.last_name = 'Guidi';	student_club
SELECT SUM(b.amount)  FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.event_name = 'October Speaker'	student_club
SELECT e.approved, e.expense_description  FROM expense e  JOIN budget b ON e.link_to_budget = b.budget_id  JOIN event ev ON b.link_to_event = ev.event_id  WHERE ev.event_name = 'October Meeting' AND ev.event_date = '2019-10-08'	student_club
SELECT AVG(e.cost) AS total_average_cost FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE SUBSTR(e.expense_date, 6, 2) IN ('09', '10') AND m.first_name = 'Elijah' AND m.last_name = 'Allen';	student_club
SELECT      (SUM(CASE WHEN LEFT(e.event_date,4) = '2019' THEN b.spent ELSE 0 END) -       SUM(CASE WHEN LEFT(e.event_date,4) = '2020' THEN b.spent ELSE 0 END)) AS difference FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.type = 'Student_Club'	student_club
SELECT location FROM event WHERE event_name = 'Spring Budget Review';	student_club
SELECT expense.cost  FROM expense  WHERE expense.expense_description = 'Posters'  AND expense.expense_date = '2019-09-04'	student_club
SELECT remaining  FROM budget  WHERE category = 'Food'  AND amount = (SELECT MAX(amount) FROM budget WHERE category = 'Food')	student_club
SELECT notes  FROM income  WHERE source = 'Fundraising'  AND date_received = '2019-09-14'	student_club
SELECT COUNT(*) FROM major WHERE college = 'College of Humanities and Social Sciences';	student_club
SELECT phone FROM member WHERE first_name = 'Carlo' AND last_name = 'Jacobs';	student_club
SELECT zip_code.county  FROM member  JOIN zip_code ON member.zip = zip_code.zip_code  WHERE member.first_name = 'Adela' AND member.last_name = 'O''Gallagher'	student_club
SELECT COUNT(*)  FROM budget  JOIN event ON budget.link_to_event = event.event_id  WHERE event.event_name = 'November Meeting'  AND budget.remaining < 0;	student_club
SELECT SUM(b.amount)  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  WHERE e.event_name = 'September Speaker'	student_club
SELECT budget.event_status  FROM expense  JOIN budget ON expense.link_to_budget = budget.budget_id  WHERE expense.expense_description = 'Post Cards, Posters'  AND expense.expense_date = '2019-8-20';	student_club
SELECT major.major_name  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE member.first_name = 'Brent'  AND member.last_name = 'Thomason'	student_club
SELECT COUNT(m.member_id)  FROM member m  JOIN major ma ON m.link_to_major = ma.major_id  WHERE ma.major_name = 'Business' AND m.t_shirt_size = 'Medium'	student_club
SELECT zip_code.type  FROM member  JOIN zip_code ON member.zip = zip_code.zip_code  WHERE member.first_name = 'Christof' AND member.last_name = 'Nielson'	student_club
SELECT major.major_name  FROM major  JOIN member ON major.major_id = member.link_to_major  WHERE member.position = 'Vice President';	student_club
SELECT zip_code.state  FROM member  JOIN zip_code ON member.zip = zip_code.zip_code  WHERE member.first_name = 'Sacha' AND member.last_name = 'Harrison'	student_club
SELECT major.department  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE member.position = 'President'	student_club
SELECT i.date_received FROM income i JOIN member m ON i.link_to_member = m.member_id WHERE m.first_name = 'Connor' AND m.last_name = 'Hilton' AND i.source = 'Dues';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.source = 'Dues' ORDER BY i.date_received ASC LIMIT 1;	student_club
SELECT      (SUM(CASE WHEN e.event_name = 'Yearly Kickoff' THEN b.amount ELSE 0 END) /       SUM(CASE WHEN e.event_name = 'October Meeting' THEN b.amount ELSE 0 END))  FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE b.category = 'Advertisement'	student_club
SELECT      (SUM(CASE WHEN b.category = 'Parking' THEN b.amount ELSE 0 END) / SUM(b.amount)) * 100 AS percentage FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'November Speaker';	student_club
SELECT SUM(cost)  FROM expense  WHERE expense_description = 'Pizza'	student_club
SELECT COUNT(DISTINCT city) FROM zip_code WHERE county = 'Orange County' AND state = 'Virginia';	student_club
SELECT DISTINCT department FROM major WHERE college = 'College of Humanities and Social Sciences';	student_club
SELECT z.city, z.county, z.state FROM zip_code z JOIN member m ON z.zip_code = m.zip WHERE m.first_name = 'Amy' AND m.last_name = 'Firth';	student_club
SELECT expense_description  FROM expense  WHERE link_to_budget IN (     SELECT budget_id      FROM budget      WHERE remaining = (SELECT MIN(remaining) FROM budget) );	student_club
SELECT m.*  FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'October Meeting';	student_club
SELECT major.college, COUNT(member.member_id) AS member_count FROM member JOIN major ON member.link_to_major = major.major_id GROUP BY major.college ORDER BY member_count DESC LIMIT 1;	student_club
SELECT major.major_name  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE member.phone = '809-555-3360'	student_club
SELECT event.event_name  FROM event  JOIN budget ON event.event_id = budget.link_to_event  WHERE budget.amount = (SELECT MAX(amount) FROM budget)	student_club
SELECT * FROM expense  JOIN member ON expense.link_to_member = member.member_id  WHERE member.position = 'Vice President';	student_club
SELECT COUNT(*)  FROM attendance  JOIN event ON attendance.link_to_event = event.event_id  WHERE event.event_name = 'Women''s Soccer';	student_club
SELECT income.date_received  FROM income  JOIN member ON income.link_to_member = member.member_id  WHERE member.first_name = 'Casey' AND member.last_name = 'Mason'	student_club
SELECT COUNT(*)  FROM member  JOIN zip_code ON member.zip = zip_code.zip_code  WHERE zip_code.state = 'Maryland';	student_club
SELECT COUNT(*)  FROM attendance  WHERE link_to_member = (SELECT member_id FROM member WHERE phone = '954-555-6240');	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT event.event_id, event.event_name  FROM event  JOIN budget ON event.event_id = budget.link_to_event  WHERE event.status = 'Closed'  GROUP BY event.event_id, event.event_name  ORDER BY (SUM(budget.spent)/SUM(budget.amount)) DESC  LIMIT 1;	student_club
SELECT COUNT(*) FROM member WHERE position = 'President'	student_club
SELECT MAX(spent) FROM budget;	student_club
SELECT COUNT(*)  FROM event  WHERE type = 'Meeting'  AND YEAR(event_date) = 2020;	student_club
SELECT SUM(spent) FROM budget WHERE category = 'Food'	student_club
SELECT m.first_name || ' ' || m.last_name AS full_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member GROUP BY m.member_id HAVING COUNT(a.link_to_event) > 7;	student_club
SELECT member.first_name, member.last_name  FROM member  JOIN major ON member.link_to_major = major.major_id  JOIN attendance ON member.member_id = attendance.link_to_member  JOIN event ON attendance.link_to_event = event.event_id  WHERE major.major_name = 'Interior Design'  AND event.event_name = 'Community Theater'	student_club
SELECT m.first_name, m.last_name FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE z.city = 'Georgetown' AND z.state = 'South Carolina';	student_club
SELECT SUM(income.amount)  FROM income  JOIN member ON income.link_to_member = member.member_id  WHERE member.first_name = 'Grant' AND member.last_name = 'Gilmour';	student_club
SELECT DISTINCT m.first_name, m.last_name  FROM member m  JOIN income i ON m.member_id = i.link_to_member  WHERE i.amount > 40;	student_club
SELECT SUM(e.cost)  FROM expense e  JOIN budget b ON e.link_to_budget = b.budget_id  JOIN event ev ON b.link_to_event = ev.event_id  WHERE ev.event_name = 'Yearly Kickoff'	student_club
SELECT member.first_name, member.last_name  FROM member  JOIN attendance ON member.member_id = attendance.link_to_member  JOIN event ON attendance.link_to_event = event.event_id  WHERE event.event_name = 'Yearly Kickoff'  AND member.position = 'Budget Manager';	student_club
SELECT m.first_name, m.last_name, i.source FROM income i JOIN member m ON i.link_to_member = m.member_id WHERE i.amount = (SELECT MAX(amount) FROM income);	student_club
SELECT event.event_name  FROM event  JOIN budget ON event.event_id = budget.link_to_event  JOIN expense ON budget.budget_id = expense.link_to_budget  GROUP BY event.event_id, event.event_name  ORDER BY SUM(expense.cost) ASC  LIMIT 1;	student_club
SELECT      (SUM(CASE WHEN e.event_name = 'Yearly Kickoff' THEN ex.cost ELSE 0 END) / SUM(ex.cost)) * 100 AS percentage FROM      expense ex JOIN      budget b ON ex.link_to_budget = b.budget_id JOIN      event e ON b.link_to_event = e.event_id;	student_club
SELECT      SUM(CASE WHEN major_name = 'Finance' THEN 1 ELSE 0 END) /      SUM(CASE WHEN major_name = 'Physics' THEN 1 ELSE 0 END)  FROM major;	student_club
SELECT source, SUM(amount) AS total_amount FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' GROUP BY source ORDER BY total_amount DESC LIMIT 1;	student_club
SELECT first_name, last_name, email FROM member WHERE position = 'Secretary';	student_club
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Physics Teaching';	student_club
SELECT COUNT(*)  FROM attendance a JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Community Theater'  AND YEAR(e.event_date) = 2019;	student_club
SELECT m.major_name AS major_name, COUNT(a.link_to_event) AS event_count FROM member AS mem LEFT JOIN major AS m ON mem.link_to_major = m.major_id LEFT JOIN attendance AS a ON mem.member_id = a.link_to_member WHERE mem.first_name = 'Luisa' AND mem.last_name = 'Guidi' GROUP BY mem.member_id, m.major_name	student_club
SELECT AVG(spent) FROM budget WHERE category = 'Food' AND event_status = 'Closed'	student_club
SELECT event.event_name  FROM event  JOIN budget ON event.event_id = budget.link_to_event  WHERE budget.category = 'Advertisement'  AND budget.spent = (SELECT MAX(spent) FROM budget WHERE category = 'Advertisement')	student_club
SELECT EXISTS (     SELECT 1     FROM member m     JOIN attendance a ON m.member_id = a.link_to_member     JOIN event e ON a.link_to_event = e.event_id     WHERE m.first_name = 'Maya'      AND m.last_name = 'Mclean'      AND e.event_name = 'Women''s Soccer' );	student_club
SELECT (SUM(type = 'Community Service') / COUNT(event_id)) * 100 AS percentage FROM event WHERE event_date BETWEEN '2019-01-01' AND '2019-12-31';	student_club
SELECT e.cost  FROM event AS ev  JOIN budget AS b ON ev.event_id = b.link_to_event  JOIN expense AS e ON b.budget_id = e.link_to_budget  WHERE ev.event_name = 'September Speaker'  AND e.expense_description = 'Posters';	student_club
SELECT t_shirt_size, COUNT(*) AS size_count FROM member WHERE t_shirt_size IS NOT NULL GROUP BY t_shirt_size HAVING COUNT(*) = (     SELECT MAX(temp.size_count)     FROM (         SELECT COUNT(*) AS size_count         FROM member         WHERE t_shirt_size IS NOT NULL         GROUP BY t_shirt_size     ) temp );	student_club
SELECT e.event_name  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  WHERE e.status = 'Closed'  AND b.remaining < 0  ORDER BY b.remaining ASC  LIMIT 1;	student_club
SELECT e.expense_description AS expense_type, SUM(e.cost) AS total_value FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.event_name = 'October Meeting' AND e.approved = 'Approved' GROUP BY e.expense_description;	student_club
SELECT budget.category, SUM(budget.amount) AS total_budgeted FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE event.event_name = 'April Speaker' GROUP BY budget.category ORDER BY total_budgeted ASC;	student_club
SELECT MAX(amount) FROM budget WHERE category = 'Food';	student_club
SELECT budget_id, amount  FROM budget  WHERE category = 'Advertisement'  ORDER BY amount DESC  LIMIT 3;	student_club
SELECT SUM(cost) FROM expense WHERE expense_description = 'Parking'	student_club
SELECT SUM(cost) AS total_expense FROM expense WHERE expense_date = '2019-08-20'	student_club
SELECT      m.first_name || ' ' || m.last_name AS full_name,     COALESCE(SUM(e.cost), 0) AS total_cost FROM member m LEFT JOIN expense e ON m.member_id = e.link_to_member WHERE m.member_id = 'rec4BLdZHS2Blfp4v' GROUP BY m.member_id;	student_club
SELECT expense.expense_description  FROM expense  JOIN member ON expense.link_to_member = member.member_id  WHERE member.first_name = 'Sacha' AND member.last_name = 'Harrison';	student_club
SELECT DISTINCT e.expense_description FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.t_shirt_size = 'X-Large'	student_club
SELECT DISTINCT m.zip  FROM member m  JOIN expense e ON m.member_id = e.link_to_member  WHERE e.cost < 50;	student_club
SELECT major.major_name  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE member.first_name = 'Phillip' AND member.last_name = 'Cullen'	student_club
SELECT member.position  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Business';	student_club
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Business'  AND member.t_shirt_size = 'Medium'	student_club
SELECT DISTINCT event.type FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE budget.remaining > 30;	student_club
SELECT type  FROM event  WHERE location = 'MU 215'	student_club
SELECT budget.category  FROM budget  JOIN event ON budget.link_to_event = event.event_id  WHERE event.event_date = '2020-03-24T12:00:00'	student_club
SELECT major.major_name  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE member.position = 'Vice President'	student_club
SELECT      (COUNT(CASE WHEN m.position = 'Member' AND mj.major_name = 'Business' THEN 1 END) / CAST(COUNT(m.member_id) AS REAL)) * 100 AS percentage FROM member m LEFT JOIN major mj ON m.link_to_major = mj.major_id;	student_club
SELECT DISTINCT type  FROM event  WHERE location = 'MU 215';	student_club
SELECT COUNT(*) FROM income WHERE amount = 50;	student_club
SELECT COUNT(*)  FROM member  WHERE position = 'Member'  AND t_shirt_size = 'X-Large'	student_club
SELECT COUNT(*) FROM major WHERE college = 'College of Agriculture and Applied Sciences' AND department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT member.last_name, major.department, major.college FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Environmental Engineering'	student_club
SELECT budget.category  FROM event  JOIN budget ON event.event_id = budget.link_to_event  WHERE event.location = 'MU 215'  AND event.type = 'Guest Speaker'  AND budget.spent = 0;	student_club
SELECT zip_code.city, zip_code.state FROM member JOIN major ON member.link_to_major = major.major_id JOIN zip_code ON member.zip = zip_code.zip_code WHERE major.department = 'Electrical and Computer Engineering Department' AND member.position = 'Member'	student_club
SELECT e.event_name  FROM event e  JOIN attendance a ON e.event_id = a.link_to_event  JOIN member m ON a.link_to_member = m.member_id  WHERE e.type = 'Social'  AND e.location = '900 E. Washington St.'  AND m.position = 'Vice President';	student_club
SELECT member.last_name, member.position FROM member JOIN expense ON member.member_id = expense.link_to_member WHERE expense.expense_description = 'Pizza' AND expense.expense_date = '2019-09-10'	student_club
SELECT m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer' AND m.position = 'Member';	student_club
SELECT      ( (SELECT COUNT(*)         FROM income i        JOIN member m ON i.link_to_member = m.member_id        WHERE m.t_shirt_size = 'Medium'           AND m.position = 'Member'          AND i.amount = 50          AND i.source = 'Student_Club')        * 1.0 /        (SELECT COUNT(*)         FROM member         WHERE t_shirt_size = 'Medium'           AND position = 'Member')       ) * 100 AS percentage;	student_club
SELECT DISTINCT state FROM zip_code WHERE type = 'PO Box';	student_club
SELECT zip_code  FROM zip_code  WHERE type = 'PO Box'  AND county = 'San Juan Municipio'  AND state = 'Puerto Rico';	student_club
SELECT event_name  FROM event  WHERE type = 'Game'  AND status = 'Closed'  AND event_date BETWEEN '2019-03-15' AND '2020-03-20';	student_club
SELECT DISTINCT a.link_to_event  FROM attendance a WHERE a.link_to_member IN (     SELECT e.link_to_member      FROM expense e      WHERE e.cost > 50 );	student_club
SELECT m.member_id, m.first_name, m.last_name, a.link_to_event FROM member m JOIN attendance a ON m.member_id = a.link_to_member WHERE EXISTS (     SELECT 1     FROM expense e     WHERE e.link_to_member = m.member_id     AND e.approved = 'true'     AND e.expense_date BETWEEN '2019-01-10' AND '2019-11-19' )	student_club
SELECT major.college  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE member.first_name = 'Katy'  AND member.link_to_major = 'rec1N0upiVLy5esTO';	student_club
SELECT phone  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Business'  AND major.college = 'College of Agriculture and Applied Sciences';	student_club
SELECT DISTINCT m.email FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.expense_date BETWEEN '2019-09-10' AND '2019-11-19' AND e.cost > 20;	student_club
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Education'  AND major.college = 'College of Education & Human Services'	student_club
SELECT (SUM(remaining < 0) * 100.0 / COUNT(link_to_event)) AS percentage FROM budget;	student_club
SELECT event_id, location, status FROM event WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31'	student_club
SELECT * FROM expense WHERE (SELECT AVG(cost) FROM expense) > 50;	student_club
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large'	student_club
SELECT (SUM(type = 'PO Box') / CAST(COUNT(zip_code) AS REAL)) * 100 AS percentage_po_box FROM zip_code;	student_club
SELECT event.event_name, event.location FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE budget.remaining > 0;	student_club
SELECT event.event_name, event.event_date FROM expense JOIN budget ON expense.link_to_budget = budget.budget_id JOIN event ON budget.link_to_event = event.event_id WHERE expense.expense_description = 'Pizza'  AND expense.cost > 50  AND expense.cost < 100;	student_club
SELECT m.first_name, m.last_name, maj.major_name FROM member m JOIN expense e ON m.member_id = e.link_to_member JOIN major maj ON m.link_to_major = maj.major_id WHERE e.cost > 100;	student_club
SELECT z.city, z.state AS country FROM event e JOIN zip_code z ON CAST(e.location AS INTEGER) = z.zip_code WHERE e.event_id IN (     SELECT e.event_id     FROM event e     JOIN attendance a ON e.event_id = a.link_to_event     JOIN member m ON a.link_to_member = m.member_id     LEFT JOIN income i ON m.member_id = i.link_to_member     GROUP BY e.event_id     HAVING SUM(i.amount) > 40 );	student_club
SELECT member_id, first_name, last_name FROM (     SELECT          m.member_id,         m.first_name,         m.last_name,         SUM(e.cost) AS total_cost,         COUNT(DISTINCT b.link_to_event) AS event_count     FROM member m     JOIN expense e ON m.member_id = e.link_to_member     JOIN budget b ON e.link_to_budget = b.budget_id     GROUP BY m.member_id, m.first_name, m.last_name     HAVING event_count > 1 ) AS sub ORDER BY total_cost DESC LIMIT 1;	student_club
SELECT SUM(e.cost) / COUNT(ev.event_id) AS average_amount FROM member m JOIN expense e ON m.member_id = e.link_to_member JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE m.position != 'Member'	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event JOIN expense exp ON b.budget_id = exp.link_to_budget WHERE b.category = 'Parking' GROUP BY e.event_id, e.event_name HAVING SUM(exp.cost) < (     SELECT AVG(total_parking)     FROM (         SELECT SUM(exp2.cost) AS total_parking         FROM budget b2         JOIN expense exp2 ON b2.budget_id = exp2.link_to_budget         WHERE b2.category = 'Parking'         GROUP BY b2.link_to_event     ) AS avg_sub );	student_club
SELECT (SUM(e.cost) / COUNT(DISTINCT ev.event_id)) * 100 AS percentage FROM event ev LEFT JOIN budget b ON ev.event_id = b.link_to_event LEFT JOIN expense e ON b.budget_id = e.link_to_budget WHERE ev.type = 'Meeting'	student_club
SELECT link_to_budget, SUM(cost) AS total_cost  FROM expense  WHERE expense_description = 'Water, chips, cookies'  GROUP BY link_to_budget  ORDER BY total_cost DESC  LIMIT 1;	student_club
SELECT member.first_name || ' ' || member.last_name AS full_name FROM member JOIN expense ON member.member_id = expense.link_to_member GROUP BY member.member_id ORDER BY MAX(expense.cost) DESC LIMIT 5;	student_club
SELECT m.first_name || ' ' || m.last_name AS full_name, m.phone FROM member m JOIN expense e ON m.member_id = e.link_to_member GROUP BY m.member_id, m.first_name, m.last_name, m.phone HAVING MIN(e.cost) > (SELECT AVG(cost) FROM expense);	student_club
SELECT      ( (CAST(SUM(z.state = 'New Jersey') AS REAL) / COUNT(*))      - (CAST(SUM(z.state = 'Vermont') AS REAL) / COUNT(*)) )  FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.position = 'Member';	student_club
SELECT major.major_name, major.department FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Garrett' AND member.last_name = 'Gerke';	student_club
SELECT member.first_name || ' ' || member.last_name AS full_name, expense.cost FROM expense JOIN member ON expense.link_to_member = member.member_id WHERE expense.expense_description = 'Water, Veggie tray, supplies'	student_club
SELECT member.last_name, member.phone FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Elementary Education';	student_club
SELECT budget.category, budget.amount FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'January Speaker';	student_club
SELECT event.event_name  FROM event  JOIN budget ON event.event_id = budget.link_to_event  WHERE budget.category = 'Food'	student_club
SELECT member.first_name || ' ' || member.last_name AS full_name, income.amount FROM income JOIN member ON income.link_to_member = member.member_id WHERE income.date_received = '9/9/2019'	student_club
SELECT budget.category  FROM expense  JOIN budget ON expense.link_to_budget = budget.budget_id  WHERE expense.expense_description = 'Posters';	student_club
SELECT CONCAT(m.first_name, ' ', m.last_name) AS full_name, ma.college  FROM member m  JOIN major ma ON m.link_to_major = ma.major_id  WHERE m.position = 'Secretary';	student_club
SELECT e.event_name, SUM(b.spent) AS total_spent FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE b.category = 'Speaker Gifts' GROUP BY e.event_name	student_club
SELECT zip_code.city  FROM member  JOIN zip_code ON member.zip = zip_code.zip_code  WHERE member.first_name = 'Garrett' AND member.last_name = 'Gerke'	student_club
SELECT m.first_name, m.last_name, m.position FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE z.city = 'Lincolnton'  AND z.state = 'North Carolina'  AND m.zip = 28092;	student_club
SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Premium'	debit_card_specializing
SELECT      (COUNT(CASE WHEN Currency = 'EUR' THEN 1 END)::float /       COUNT(CASE WHEN Currency = 'CZK' THEN 1 END)) AS ratio FROM customers;	debit_card_specializing
SELECT c.CustomerID FROM customers c LEFT JOIN yearmonth y ON c.CustomerID = y.CustomerID AND y.Date BETWEEN '201201' AND '201212' WHERE c.Segment = 'LAM' GROUP BY c.CustomerID ORDER BY SUM(y.Consumption) ASC LIMIT 1;	debit_card_specializing
SELECT AVG(Consumption) / 12 AS average_monthly_consumption FROM customers JOIN yearmonth ON customers.CustomerID = yearmonth.CustomerID WHERE customers.Segment = 'SME'  AND yearmonth.Date BETWEEN '201301' AND '201312';	debit_card_specializing
SELECT c.CustomerID, SUM(y.Consumption) AS total_consumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Currency = 'CZK' AND y.Date BETWEEN '201101' AND '201112' GROUP BY c.CustomerID ORDER BY total_consumption DESC;	debit_card_specializing
SELECT COUNT(*)  FROM (     SELECT y.CustomerID     FROM customers c     JOIN yearmonth y ON c.CustomerID = y.CustomerID     WHERE c.Segment = 'KAM'        AND y.Date BETWEEN '201201' AND '201212'     GROUP BY y.CustomerID     HAVING SUM(y.Consumption) < 30000 );	debit_card_specializing
SELECT      (SUM(CASE WHEN c.Currency = 'CZK' THEN y.Consumption ELSE 0 END) -       SUM(CASE WHEN c.Currency = 'EUR' THEN y.Consumption ELSE 0 END)) AS difference FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE y.Date BETWEEN '201201' AND '201212';	debit_card_specializing
SELECT substr(y.Date, 1,4) AS year, SUM(Consumption) AS total FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Currency = 'EUR' GROUP BY year ORDER BY total DESC LIMIT 1;	debit_card_specializing
SELECT c.Segment, SUM(y.Consumption) as total FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID GROUP BY c.Segment ORDER BY total ASC LIMIT 1;	debit_card_specializing
SELECT substr(y.Date,1,4) AS year, SUM(y.Consumption) AS total  FROM yearmonth y  JOIN customers c ON y.CustomerID = c.CustomerID  WHERE c.Currency = 'CZK'  GROUP BY substr(y.Date,1,4)  ORDER BY total DESC  LIMIT 1;	debit_card_specializing
SELECT substr(Date,5,2) AS Month, SUM(Consumption) AS TotalConsumption FROM customers JOIN yearmonth USING (CustomerID) WHERE customers.Segment = 'SME' AND Date BETWEEN '201301' AND '201312' GROUP BY Month ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
WITH customer_2013 AS (     SELECT          c.CustomerID,         c.Segment,         SUM(y.Consumption) AS total_consumption     FROM customers c     JOIN yearmonth y ON c.CustomerID = y.CustomerID     WHERE substr(y.Date,1,4) = '2013'     GROUP BY c.CustomerID, c.Segment ), segment_min AS (     SELECT          Segment,         MIN(total_consumption) AS min_total     FROM customer_2013     GROUP BY Segment ), min_customers AS (     SELECT          c.CustomerID,         c.Segment,         c.total_consumption     FROM customer_2013 c     JOIN segment_min s ON c.Segment = s.Segment AND c.total_consumption = s.min_total ), segment_averages AS (     SELECT          Segment,         SUM(total_consumption) / COUNT(*) AS avg_consumption     FROM min_customers     GROUP BY Segment ) SELECT      (SELECT avg_consumption FROM segment_averages WHERE Segment = 'SME') -      (SELECT avg_consumption FROM segment_averages WHERE Segment = 'LAM') AS "SME-LAM",     (SELECT avg_consumption FROM segment_averages WHERE Segment = 'LAM') -      (SELECT avg_consumption FROM segment_averages WHERE Segment = 'KAM') AS "LAM-KAM",     (SELECT avg_consumption FROM segment_averages WHERE Segment = 'KAM') -      (SELECT avg_consumption FROM segment_averages WHERE Segment = 'SME') AS "KAM-SME";	debit_card_specializing
WITH segment_stats AS (     SELECT         c.Segment,         SUM(CASE WHEN substr(ym.Date,1,4) = '2012' THEN ym.Consumption ELSE 0 END) AS Consump2012,         SUM(CASE WHEN substr(ym.Date,1,4) = '2013' THEN ym.Consumption ELSE 0 END) AS Consump2013     FROM customers c     JOIN yearmonth ym ON c.CustomerID = ym.CustomerID     WHERE c.Currency = 'EUR'     AND substr(ym.Date,1,4) IN ('2012', '2013')     GROUP BY c.Segment ), calculation AS (     SELECT         Segment,         CASE             WHEN Consump2013 = 0 THEN -99999.99             ELSE ((Consump2013 - Consump2012) / Consump2013) * 100         END AS percentage_increase     FROM segment_stats ) SELECT     Segment,     percentage_increase,     CASE         WHEN percentage_increase = (SELECT MAX(percentage_increase) FROM calculation) THEN 'Biggest'         WHEN percentage_increase = (SELECT MIN(percentage_increase) FROM calculation) THEN 'Lowest'     END AS Status FROM calculation WHERE Segment IN ('SME', 'LAM', 'KAM');	debit_card_specializing
SELECT SUM(Consumption)  FROM yearmonth  WHERE CustomerID = 6 AND Date BETWEEN '201308' AND '201311'	debit_card_specializing
SELECT      (COUNT(CASE WHEN Country = 'CZE' AND Segment = 'Value for money' THEN 1 END)       - COUNT(CASE WHEN Country = 'SVK' AND Segment = 'Value for money' THEN 1 END))  AS difference  FROM gasstations;	debit_card_specializing
SELECT      (SELECT Consumption FROM yearmonth WHERE CustomerID = 7 AND Date = '201304') -      (SELECT Consumption FROM yearmonth WHERE CustomerID = 5 AND Date = '201304')  AS consumption_difference;	debit_card_specializing
SELECT      SUM(CASE WHEN Currency = 'CZK' THEN 1 ELSE 0 END) -      SUM(CASE WHEN Currency = 'EUR' THEN 1 ELSE 0 END) AS difference FROM customers WHERE Segment = 'SME';	debit_card_specializing
SELECT customers.CustomerID  FROM customers  JOIN yearmonth ON customers.CustomerID = yearmonth.CustomerID  WHERE customers.Segment = 'LAM'  AND customers.Currency = 'EUR'  AND yearmonth.Date = '201310'  ORDER BY yearmonth.Consumption DESC  LIMIT 1;	debit_card_specializing
SELECT c.CustomerID, SUM(y.Consumption) AS total_consumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'LAM' GROUP BY c.CustomerID ORDER BY total_consumption DESC LIMIT 1;	debit_card_specializing
SELECT SUM(y.Consumption)  FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Segment = 'KAM'  AND y.Date = '201305'	debit_card_specializing
SELECT    (CAST(COUNT(*) AS REAL) / (SELECT COUNT(*) FROM customers WHERE Segment = 'LAM')) * 100 AS percentage FROM customers WHERE Segment = 'LAM' AND EXISTS (SELECT 1 FROM yearmonth WHERE CustomerID = customers.CustomerID AND Consumption > 46.73)	debit_card_specializing
SELECT Country, COUNT(GasStationID) AS total_value_for_money  FROM gasstations  WHERE Segment = 'Value for money'  GROUP BY Country  ORDER BY total_value_for_money DESC;	debit_card_specializing
SELECT (COUNT(CASE WHEN Currency = 'EUR' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM customers WHERE Segment = 'KAM';	debit_card_specializing
SELECT      (COUNT(CASE WHEN Consumption > 528.3 THEN 1 END) * 100.0 / COUNT(*) ) AS percentage FROM yearmonth WHERE Date = '201202';	debit_card_specializing
SELECT      (COUNT(CASE WHEN Segment = 'Premium' THEN 1 END) * 100.0 / COUNT(*)) AS percentage_premium FROM gasstations WHERE Country = 'SVK';	debit_card_specializing
SELECT CustomerID  FROM yearmonth  WHERE Date = '201309'  ORDER BY Consumption DESC  LIMIT 1	debit_card_specializing
SELECT c.Segment  FROM customers c  JOIN yearmonth y ON c.CustomerID = y.CustomerID  WHERE y.Date = '201309'  GROUP BY c.Segment  ORDER BY SUM(y.Consumption) ASC  LIMIT 1;	debit_card_specializing
SELECT c.CustomerID FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'SME' AND y.Date = '201206' ORDER BY y.Consumption ASC LIMIT 1;	debit_card_specializing
SELECT MAX(Consumption) FROM yearmonth WHERE substr(Date,1,4) = '2012'	debit_card_specializing
SELECT MAX(total_consumption / 12)  FROM (     SELECT SUM(y.Consumption) AS total_consumption      FROM customers c      JOIN yearmonth y ON c.CustomerID = y.CustomerID      WHERE c.Currency = 'EUR'      GROUP BY c.CustomerID );	debit_card_specializing
SELECT DISTINCT p.Description FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID WHERE t.Date >= '2013-09-01' AND t.Date < '2013-10-01';	debit_card_specializing
SELECT DISTINCT g.Country FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID WHERE substr(t.Date, 1, 6) = '201306';	debit_card_specializing
SELECT DISTINCT g.ChainID FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR';	debit_card_specializing
SELECT p.Description  FROM transactions_1k t  JOIN customers c ON t.CustomerID = c.CustomerID  JOIN products p ON t.ProductID = p.ProductID  WHERE c.Currency = 'EUR';	debit_card_specializing
SELECT AVG(Price * Amount)  FROM transactions_1k  WHERE Date LIKE '2012-01%'	debit_card_specializing
SELECT COUNT(DISTINCT c.CustomerID)  FROM customers c  JOIN yearmonth y ON c.CustomerID = y.CustomerID  WHERE c.Currency = 'EUR' AND y.Consumption > 1000;	debit_card_specializing
SELECT DISTINCT p.Description FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE'	debit_card_specializing
SELECT DISTINCT Time  FROM transactions_1k  JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID  WHERE gasstations.ChainID = 11;	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE' AND t.Price > 1000;	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k t  JOIN gasstations g ON t.GasStationID = g.GasStationID  WHERE g.Country = 'CZE' AND t.Date > '2012-01-01'	debit_card_specializing
SELECT AVG(t.Amount * t.Price) AS average_total_price FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE'	debit_card_specializing
SELECT AVG(t.Amount * t.Price)  FROM customers c  JOIN transactions_1k t ON c.CustomerID = t.CustomerID  WHERE c.Currency = 'EUR'	debit_card_specializing
SELECT c.CustomerID, SUM(t.Amount * t.Price) AS total_spent FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE t.Date = '2012-08-25' GROUP BY c.CustomerID ORDER BY total_spent DESC LIMIT 1;	debit_card_specializing
SELECT gs.Country  FROM transactions_1k AS t  JOIN gasstations AS gs ON t.GasStationID = gs.GasStationID  WHERE t.Date = '2012-08-25'  AND t.Amount > 0  AND t.CustomerID IS NOT NULL  ORDER BY t.Time ASC  LIMIT 1;	debit_card_specializing
SELECT c.Currency  FROM transactions_1k t  JOIN customers c ON t.CustomerID = c.CustomerID  WHERE t.Date = '2012-08-24'  AND t.Time = '16:25:00';	debit_card_specializing
SELECT customers.Segment  FROM customers  JOIN transactions_1k ON customers.CustomerID = transactions_1k.CustomerID  WHERE transactions_1k.Date = '2012-08-23'  AND transactions_1k.Time = '21:20:00';	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k AS t JOIN customers AS c ON t.CustomerID = c.CustomerID WHERE t.Date = '2012-08-26'  AND t.Time < '13:00:00'  AND c.Currency = 'CZK';	debit_card_specializing
SELECT Segment FROM customers WHERE CustomerID = (SELECT MIN(CustomerID) FROM customers)	debit_card_specializing
SELECT gasstations.Country  FROM transactions_1k  JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID  WHERE transactions_1k.Date = '2012-08-24'  AND transactions_1k.Time = '12:42:00';	debit_card_specializing
SELECT ProductID FROM transactions_1k WHERE Date = '2012-08-23' AND Time = '21:20:00'	debit_card_specializing
SELECT      (SELECT SUM(t2.Price)       FROM transactions_1k t2       WHERE t2.CustomerID = t1.CustomerID         AND t2.Date BETWEEN '2012-01-01' AND '2012-01-31') AS total_spent,     t1.Date,      t1.Price AS expense FROM transactions_1k t1 WHERE      t1.CustomerID IN (         SELECT CustomerID          FROM transactions_1k          WHERE Date = '2012-08-24'            AND Price = 124.05     )     AND t1.Date BETWEEN '2012-01-01' AND '2012-01-31';	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k AS t JOIN gasstations AS g ON t.GasStationID = g.GasStationID WHERE t.Date = '2012-08-26'  AND t.Time BETWEEN '08:00:00' AND '09:00:00'  AND g.Country = 'CZE'	debit_card_specializing
SELECT c.Currency  FROM customers c  JOIN yearmonth y ON c.CustomerID = y.CustomerID  WHERE y.Date = '201306' AND y.Consumption = 214582.17;	debit_card_specializing
SELECT g.Country  FROM gasstations g  JOIN transactions_1k t ON g.GasStationID = t.GasStationID  WHERE t.CardID = 667467;	debit_card_specializing
SELECT g.Country FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID WHERE t.Date = '2012-08-24' AND t.CustomerID IN (     SELECT CustomerID     FROM transactions_1k     WHERE Date = '2012-08-24'     GROUP BY CustomerID     HAVING SUM(Amount * Price) = 548.4 )	debit_card_specializing
SELECT      (COUNT(CASE WHEN c.Currency = 'EUR' THEN 1 END) * 100.0)      / COUNT(DISTINCT t.CustomerID) AS percentage FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE t.Date = '2012-08-25'	debit_card_specializing
SELECT      (consumption_2012 - consumption_2013) / consumption_2012 AS decrease_rate FROM (     SELECT          SUM(CASE WHEN LEFT(y.Date,4) = '2012' THEN Consumption ELSE 0 END) AS consumption_2012,         SUM(CASE WHEN LEFT(y.Date,4) = '2013' THEN Consumption ELSE 0 END) AS consumption_2013     FROM yearmonth y     WHERE y.CustomerID = (         SELECT t.CustomerID          FROM transactions_1k t          WHERE t.Date = '2012-08-25'          AND t.Amount = 634.8     ) );	debit_card_specializing
SELECT gasstations.GasStationID, SUM(transactions_1k.Amount * transactions_1k.Price) AS total_revenue FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID GROUP BY gasstations.GasStationID ORDER BY total_revenue DESC LIMIT 1;	debit_card_specializing
SELECT      (COUNT(CASE WHEN g.Segment = 'Premium' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM gasstations g WHERE g.Country = 'SVK';	debit_card_specializing
SELECT      SUM(Amount * Price) AS total_spent,     SUM(CASE WHEN strftime('%Y%m', Date) = '201201' THEN Amount * Price ELSE 0 END) AS jan2012_spent FROM transactions_1k WHERE CustomerID = 38508;	debit_card_specializing
SELECT p.Description, SUM(t.Amount) AS total_sales FROM transactions_1k t JOIN products p ON t.ProductID = p.ProductID GROUP BY p.ProductID, p.Description ORDER BY total_sales DESC LIMIT 5;	debit_card_specializing
WITH ranked AS (     SELECT          c.CustomerID,         SUM(t.Price * t.Amount) AS total_spending,         SUM(t.Price) AS total_price,         SUM(t.Amount) AS total_amount,         c.Currency,         RANK() OVER (ORDER BY SUM(t.Price * t.Amount) DESC) AS rnk     FROM transactions_1k t     JOIN customers c ON t.CustomerID = c.CustomerID     GROUP BY c.CustomerID ) SELECT CustomerID, (total_price / total_amount) AS average_price_per_item, Currency FROM ranked WHERE rnk = 1;	debit_card_specializing
SELECT g.Country  FROM gasstations g  JOIN transactions_1k t ON g.GasStationID = t.GasStationID  WHERE t.ProductID = 2  AND t.Price = (SELECT MAX(Price) FROM transactions_1k WHERE ProductID = 2);	debit_card_specializing
SELECT y.CustomerID, y.Consumption  FROM yearmonth y WHERE y.Date = '201208'  AND y.CustomerID IN (     SELECT t.CustomerID      FROM transactions_1k t      WHERE t.ProductID = 5      AND (t.Price / t.Amount) > 29.00 );	debit_card_specializing
