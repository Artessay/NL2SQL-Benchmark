SELECT MAX(`Free Meal Count (K-12)` / `Enrollment (K-12)`)  FROM frpm  JOIN schools USING (CDSCode)  WHERE schools.County = 'Alameda';	california_schools
SELECT (`Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)`) AS eligible_rate FROM frpm JOIN schools USING (CDSCode) WHERE schools.EdOpsName = 'Continuation'   AND `Enrollment (Ages 5-17)` IS NOT NULL   AND `Free Meal Count (Ages 5-17)` IS NOT NULL   AND `Enrollment (Ages 5-17)` != 0 ORDER BY eligible_rate ASC LIMIT 3;	california_schools
SELECT schools.Zip  FROM schools  JOIN frpm ON schools.CDSCode = frpm.CDSCode  WHERE frpm.`Charter School (Y/N)` = 1  AND schools.County = 'Fresno'  AND schools.District = 'Fresno County Office of Education';	california_schools
SELECT schools.MailStreet  FROM schools  JOIN frpm ON schools.CDSCode = frpm.CDSCode  WHERE frpm.`FRPM Count (K-12)` IS NOT NULL  ORDER BY frpm.`FRPM Count (K-12)` DESC  LIMIT 1;	california_schools
SELECT schools.Phone  FROM schools  JOIN frpm ON schools.CDSCode = frpm.CDSCode  WHERE frpm.`Charter School (Y/N)` = 1  AND frpm.`Charter Funding Type` = 'Direct'  AND schools.OpenDate > '2000-01-01';	california_schools
SELECT COUNT(*)  FROM schools  JOIN satscores ON schools.CDSCode = satscores.cds  WHERE schools.Virtual = 'F'  AND satscores.AvgScrMath > 400	california_schools
SELECT schools.School  FROM schools  JOIN satscores ON schools.CDSCode = satscores.cds  WHERE satscores.NumTstTakr > 500  AND schools.Magnet = 1;	california_schools
SELECT schools.Phone  FROM schools  JOIN satscores ON schools.CDSCode = satscores.cds  WHERE satscores.NumGE1500 = (SELECT MAX(NumGE1500) FROM satscores);	california_schools
SELECT SUM(s.NumTstTakr)  FROM satscores s JOIN (     SELECT CDSCode      FROM frpm      WHERE `FRPM Count (K-12)` = (SELECT MAX(`FRPM Count (K-12)`) FROM frpm) ) f ON s.cds = f.CDSCode	california_schools
SELECT COUNT(*)  FROM satscores s JOIN frpm f ON s.cds = f.CDSCode WHERE s.AvgScrMath > 560 AND f.`Charter Funding Type` = 'Direct';	california_schools
SELECT frpm.`FRPM Count (Ages 5-17)` FROM frpm INNER JOIN satscores ON frpm.CDSCode = satscores.cds WHERE satscores.AvgScrRead = (SELECT MAX(AvgScrRead) FROM satscores);	california_schools
SELECT CDSCode  FROM frpm  WHERE (`Enrollment (K-12)` + `Enrollment (Ages 5-17)`) > 500;	california_schools
SELECT MAX(`Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)`)  FROM frpm  JOIN satscores ON frpm.CDSCode = satscores.cds  WHERE (satscores.NumGE1500 / satscores.NumTstTakr) > 0.3;	california_schools
SELECT schools.Phone FROM satscores INNER JOIN schools ON satscores.cds = schools.CDSCode ORDER BY (CAST(satscores.NumGE1500 AS REAL) / NULLIF(satscores.NumTstTakr, 0)) DESC LIMIT 3;	california_schools
SELECT schools.NCESSchool  FROM frpm  JOIN schools ON frpm.CDSCode = schools.CDSCode  ORDER BY frpm."Enrollment (Ages 5-17)" DESC  LIMIT 5;	california_schools
SELECT schools.District, AVG(satscores.AvgScrRead) AS avg_reading  FROM satscores  JOIN schools ON satscores.cds = schools.CDSCode  WHERE schools.StatusType = 'Active'  GROUP BY schools.District  ORDER BY avg_reading DESC  LIMIT 1;	california_schools
SELECT COUNT(*)  FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE s.District = 'Alameda'  AND sc.NumTstTakr < 100;	california_schools
SELECT RANK() OVER (ORDER BY s.AvgScrWrite DESC) AS rank, s.sname, s.AvgScrWrite, sch.CharterNum FROM satscores s JOIN schools sch ON s.cds = sch.CDSCode WHERE s.AvgScrWrite > 499 AND sch.CharterNum IS NOT NULL	california_schools
SELECT COUNT(*)  FROM schools  JOIN satscores ON schools.CDSCode = satscores.cds  WHERE schools.County = 'Fresno'  AND schools.FundingType = 'Direct'  AND satscores.NumTstTakr <= 250;	california_schools
SELECT schools.Phone  FROM schools  JOIN satscores ON schools.CDSCode = satscores.cds  WHERE satscores.AvgScrMath = (SELECT MAX(AvgScrMath) FROM satscores)	california_schools
SELECT COUNT(*)  FROM frpm  WHERE `County Name` = 'Amador'  AND `Low Grade` = '9'  AND `High Grade` = '12';	california_schools
SELECT COUNT(*)  FROM frpm  JOIN schools USING (CDSCode)  WHERE schools.County = 'Los Angeles'  AND `Free Meal Count (K-12)` > 500  AND `FRPM Count (K-12)` < 700;	california_schools
SELECT schools.School  FROM satscores  JOIN schools ON satscores.cds = schools.CDSCode  WHERE schools.County = 'Contra Costa'  ORDER BY satscores.NumTstTakr DESC  LIMIT 1;	california_schools
SELECT frpm.`School Name`, schools.Street || ', ' || schools.City || ', ' || schools.State AS Full_Address FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE (frpm.`Enrollment (K-12)` - frpm.`Enrollment (Ages 5-17)`) > 30	california_schools
SELECT schools.School FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode JOIN satscores ON frpm.CDSCode = satscores.cds WHERE (`Free Meal Count (K-12)` / `Enrollment (K-12)`) > 0.1 AND satscores.NumGE1500 >= 1;	california_schools
SELECT schools.School, schools.FundingType FROM schools JOIN satscores ON schools.CDSCode = satscores.cds WHERE schools.County = 'Riverside' AND satscores.AvgScrMath > 400;	california_schools
SELECT s.School, s.Street, s.City, s.State, s.Zip  FROM frpm AS f  INNER JOIN schools AS s ON f.CDSCode = s.CDSCode  WHERE f.CountyName = 'Monterey'  AND f.`High Grade` = '12'  AND f.`FRPM Count (Ages 5-17)` > 800;	california_schools
SELECT schools.School AS SchoolName, satscores.AvgScrWrite, schools.Phone AS CommunicationNumber FROM schools JOIN satscores ON schools.CDSCode = satscores.cds WHERE schools.OpenDate > '1991-12-31' OR schools.ClosedDate < '2000-01-01';	california_schools
SELECT frpm.`School Name`, schools.DOCType FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.FundingType = 'Local' AND (frpm.`Enrollment (K-12)` - frpm.`Enrollment (Ages 5-17)`) > (     SELECT AVG(frpm2.`Enrollment (K-12)` - frpm2.`Enrollment (Ages 5-17)`)     FROM frpm AS frpm2     JOIN schools AS schools2 ON frpm2.CDSCode = schools2.CDSCode     WHERE schools2.FundingType = 'Local' );	california_schools
SELECT s.OpenDate  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE f."Low Grade" = '1' AND f."High Grade" = '12'  AND f."Enrollment (K-12)" = (     SELECT MAX("Enrollment (K-12)")      FROM frpm      WHERE "Low Grade" = '1' AND "High Grade" = '12' )  LIMIT 1;	california_schools
SELECT schools.City, SUM(frpm."Enrollment (K-12)") AS total_enrollment FROM frpm JOIN schools USING (CDSCode) WHERE frpm."Enrollment (K-12)" IS NOT NULL GROUP BY schools.City ORDER BY total_enrollment ASC LIMIT 5;	california_schools
SELECT      CDSCode,      (`Free Meal Count (K-12)` / `Enrollment (K-12)`) AS eligible_free_rate FROM frpm WHERE `Enrollment (K-12)` IS NOT NULL      AND `Free Meal Count (K-12)` IS NOT NULL ORDER BY `Enrollment (K-12)` DESC LIMIT 2 OFFSET 9;	california_schools
SELECT frpm."School Name", (frpm."FRPM Count (K-12)" / frpm."Enrollment (K-12)") AS eligible_rate FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.DOC = '66' ORDER BY frpm."FRPM Count (K-12)" DESC LIMIT 5;	california_schools
SELECT schools.School, schools.Website FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE `frpm`.`Free Meal Count (Ages 5-17)` BETWEEN 1900 AND 2000;	california_schools
SELECT (`Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)`) AS free_rate  FROM frpm  JOIN schools ON frpm.CDSCode = schools.CDSCode  WHERE (AdmFName1 = 'Kacey' AND AdmLName1 = 'Gibson')     OR (AdmFName2 = 'Kacey' AND AdmLName2 = 'Gibson')     OR (AdmFName3 = 'Kacey' AND AdmLName3 = 'Gibson');	california_schools
SELECT schools.AdmEmail1  FROM schools  JOIN frpm ON schools.CDSCode = frpm.CDSCode  WHERE frpm.`Charter School (Y/N)` = 1  ORDER BY frpm.`Enrollment (K-12)` ASC  LIMIT 1;	california_schools
SELECT      AdmFName1 || ' ' || AdmLName1 AS Admin1,     AdmFName2 || ' ' || AdmLName2 AS Admin2,     AdmFName3 || ' ' || AdmLName3 AS Admin3 FROM schools WHERE CDSCode = (     SELECT cds      FROM satscores      ORDER BY NumGE1500 DESC      LIMIT 1 )	california_schools
SELECT schools.Street, schools.City, schools.Zip, schools.State FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE NumTstTakr > 0 ORDER BY (CAST(NumGE1500 AS REAL) / CAST(NumTstTakr AS REAL)) ASC LIMIT 1;	california_schools
SELECT schools.Website  FROM schools  JOIN satscores ON schools.CDSCode = satscores.cds  WHERE schools.County = 'Los Angeles'  AND satscores.NumTstTakr BETWEEN 2000 AND 3000;	california_schools
SELECT AVG(s.NumTstTakr)  FROM schools sch  JOIN satscores s ON sch.CDSCode = s.cds  WHERE sch.County = 'Fresno'  AND sch.OpenDate BETWEEN '1980-01-01' AND '1980-12-31'	california_schools
SELECT schools.Phone  FROM schools  JOIN satscores ON schools.CDSCode = satscores.cds  WHERE schools.District = 'Fresno Unified'  ORDER BY satscores.AvgScrRead ASC  LIMIT 1;	california_schools
SELECT sub.School FROM (     SELECT schools.School, schools.County,             RANK() OVER (PARTITION BY schools.County ORDER BY satscores.AvgScrRead DESC) AS rnk     FROM schools     INNER JOIN satscores ON schools.CDSCode = satscores.cds     WHERE schools.Virtual = 'F' ) AS sub WHERE sub.rnk <=5;	california_schools
SELECT "School Type" FROM frpm  JOIN satscores ON frpm.CDSCode = satscores.cds  WHERE satscores.AvgScrMath = (SELECT MAX(AvgScrMath) FROM satscores WHERE AvgScrMath IS NOT NULL);	california_schools
SELECT s.AvgScrMath, sch.County FROM satscores s JOIN schools sch ON s.cds = sch.CDSCode WHERE (s.AvgScrMath + s.AvgScrRead + s.AvgScrWrite) = (     SELECT MIN(AvgScrMath + AvgScrRead + AvgScrWrite)      FROM satscores );	california_schools
SELECT s.AvgScrWrite, sc.City FROM satscores s JOIN schools sc ON s.cds = sc.CDSCode WHERE s.NumGE1500 = (SELECT MAX(NumGE1500) FROM satscores);	california_schools
SELECT schools.School, satscores.AvgScrWrite FROM schools JOIN satscores ON schools.CDSCode = satscores.cds WHERE      (schools.AdmFName1 = 'Ricci' AND schools.AdmLName1 = 'Ulrich') OR     (schools.AdmFName2 = 'Ricci' AND schools.AdmLName2 = 'Ulrich') OR     (schools.AdmFName3 = 'Ricci' AND schools.AdmLName3 = 'Ulrich');	california_schools
SELECT s.School AS "School Name", f."Enrollment (K-12)" FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.DOC = 31 AND f."Enrollment (K-12)" = (     SELECT MAX(f2."Enrollment (K-12)")     FROM frpm f2     WHERE f2.CDSCode IN (SELECT CDSCode FROM schools WHERE DOC = 31) );	california_schools
SELECT (COUNT(schools.CDSCode) / 12.0) AS monthly_average  FROM schools  WHERE schools.County = 'Alameda'  AND schools.DOC = '52'  AND strftime('%Y', schools.OpenDate) = '1980';	california_schools
SELECT      (SUM(CASE WHEN DOC = 54 THEN 1 ELSE 0 END) * 1.0) /      SUM(CASE WHEN DOC = 52 THEN 1 ELSE 0 END) AS ratio FROM schools WHERE County = 'Orange';	california_schools
WITH CountyClosedSchools AS (     SELECT County, COUNT(*) AS closed_count,             RANK() OVER (ORDER BY COUNT(*) DESC) AS rank     FROM schools     WHERE StatusType = 'Closed'     GROUP BY County ) SELECT s.County, s.School, s.ClosedDate FROM schools s JOIN CountyClosedSchools ccs ON s.County = ccs.County WHERE ccs.rank = 1 AND s.StatusType = 'Closed' ORDER BY s.County, s.School;	california_schools
SELECT schools.School AS SchoolName, schools.MailStreet AS PostalStreetAddress FROM satscores JOIN schools ON satscores.cds = schools.CDSCode ORDER BY satscores.AvgScrMath DESC OFFSET 6 LIMIT 1;	california_schools
SELECT schools.MailStreet, satscores.sname FROM schools JOIN satscores ON schools.CDSCode = satscores.cds WHERE satscores.AvgScrRead IS NOT NULL ORDER BY satscores.AvgScrRead ASC LIMIT 1;	california_schools
SELECT COUNT(*)  FROM schools  JOIN satscores USING (CDSCode) WHERE (AvgScrRead + AvgScrMath + AvgScrWrite) >= 1500  AND schools.MailCity = 'Lakeport'	california_schools
SELECT SUM(s.NumTstTakr)  FROM satscores s JOIN schools sch ON s.cds = sch.CDSCode WHERE sch.MailCity = 'Fresno'	california_schools
SELECT schools.School, schools.MailZip  FROM schools  WHERE  (     (AdmFName1 = 'Avetik' AND AdmLName1 = 'Atoian' AND AdmFName1 IS NOT NULL AND AdmLName1 IS NOT NULL)     OR     (AdmFName2 = 'Avetik' AND AdmLName2 = 'Atoian' AND AdmFName2 IS NOT NULL AND AdmLName2 IS NOT NULL)     OR     (AdmFName3 = 'Avetik' AND AdmLName3 = 'Atoian' AND AdmFName3 IS NOT NULL AND AdmLName3 IS NOT NULL) );	california_schools
SELECT      (SELECT COUNT(*) FROM schools WHERE County = 'Colusa' AND MailState = 'California')      /     (SELECT COUNT(*) FROM schools WHERE County = 'Humboldt' AND MailState = 'California')	california_schools
SELECT COUNT(*)  FROM schools  WHERE MailState = 'CA'  AND City = 'San Joaquin'  AND StatusType = 'Active';	california_schools
SELECT schools.Phone, schools.Ext FROM satscores JOIN schools ON satscores.cds = schools.CDSCode ORDER BY satscores.AvgScrWrite DESC LIMIT 332, 1;	california_schools
SELECT schools.School, schools.Phone, schools.Ext  FROM schools  WHERE schools.Zip = '95203-3704';	california_schools
SELECT Website  FROM schools  WHERE      (AdmFName1 = 'Mike' AND AdmLName1 = 'Larson')      OR (AdmFName2 = 'Mike' AND AdmLName2 = 'Larson')      OR (AdmFName3 = 'Mike' AND AdmLName3 = 'Larson')      OR (AdmFName1 = 'Dante' AND AdmLName1 = 'Alvarez')      OR (AdmFName2 = 'Dante' AND AdmLName2 = 'Alvarez')      OR (AdmFName3 = 'Dante' AND AdmLName3 = 'Alvarez');	california_schools
SELECT Website  FROM schools  WHERE Charter = 1  AND Virtual = 'P'  AND County = 'San Joaquin'	california_schools
SELECT COUNT(*)  FROM schools  WHERE Charter = 1  AND City = 'Hickman'  AND DOC = 52;	california_schools
SELECT COUNT(*)  FROM schools  JOIN frpm USING (CDSCode) WHERE schools.Charter = 0  AND schools.County = 'Los Angeles'  AND (`Free Meal Count (K-12)` / `Enrollment (K-12)`) * 100 < 0.18	california_schools
SELECT School, City, AdmFName1 || ' ' || AdmLName1 AS Administrator FROM schools WHERE Charter = 1 AND CharterNum = '00D2' AND AdmFName1 IS NOT NULL AND AdmLName1 IS NOT NULL  UNION ALL  SELECT School, City, AdmFName2 || ' ' || AdmLName2 AS Administrator FROM schools WHERE Charter = 1 AND CharterNum = '00D2' AND AdmFName2 IS NOT NULL AND AdmLName2 IS NOT NULL  UNION ALL  SELECT School, City, AdmFName3 || ' ' || AdmLName3 AS Administrator FROM schools WHERE Charter = 1 AND CharterNum = '00D2' AND AdmFName3 IS NOT NULL AND AdmLName3 IS NOT NULL	california_schools
SELECT COUNT(*)  FROM schools  WHERE MailCity = 'Hickman'  AND CharterNum = '00D4'	california_schools
SELECT      (COUNT(CASE WHEN FundingType = 'Local' THEN 1 END) * 100.0 / COUNT(*)) AS ratio_percentage FROM schools WHERE County = 'Santa Clara' AND Charter = 1;	california_schools
SELECT COUNT(*)  FROM schools  WHERE County = 'Stanislaus'  AND FundingType = 'Directly Funded'  AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31'	california_schools
SELECT COUNT(*)  FROM schools  WHERE      EXTRACT(YEAR FROM ClosedDate) = 1989      AND City = 'San Francisco'      AND DOCType = 'Community College District';	california_schools
SELECT County, COUNT(*) AS closure_count  FROM schools  WHERE SOC = 11  AND ClosedDate BETWEEN '1980-01-01' AND '1989-12-31'  GROUP BY County  ORDER BY closure_count DESC  LIMIT 1;	california_schools
SELECT NCESDist FROM schools WHERE SOC = '31'	california_schools
SELECT StatusType, COUNT(*)  FROM schools  WHERE County = 'Alpine'  AND EdOpsName = 'District Community Day School'  GROUP BY StatusType;	california_schools
SELECT frpm.`District Code`  FROM frpm  JOIN schools ON frpm.CDSCode = schools.CDSCode  WHERE schools.City = 'Fresno'  AND schools.Magnet = 0;	california_schools
SELECT SUM(`Enrollment (Ages 5-17)`)  FROM frpm  JOIN schools USING (`CDSCode`) WHERE schools.EdOpsCode = 'SSS'  AND schools.City = 'Fremont'  AND frpm.`Academic Year` = '2014-2015'	california_schools
SELECT frpm.`FRPM Count (Ages 5-17)` FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.School = 'Youth Authority School' AND schools.MailStreet = 'PO Box 1040'	california_schools
SELECT frpm.`Low Grade`  FROM schools  JOIN frpm ON schools.CDSCode = frpm.CDSCode  WHERE schools.NCESDist = '0613360'  AND schools.EdOpsCode = 'SPECON';	california_schools
SELECT "School Name", "Educational Option Type" FROM frpm WHERE "NSLP Provision Status" = 'Breakfast Provision 2' AND "County Code" = '37';	california_schools
SELECT schools.City  FROM frpm  JOIN schools USING (CDSCode)  WHERE `County Name` = 'Merced'  AND `Low Grade` = '9'  AND `High Grade` = '12'  AND `NSLP Provision Status` = 'Provision 2'  AND schools.EILCode = 'HS'	california_schools
SELECT `School Name`, `Percent (%) Eligible FRPM (Ages 5-17)`  FROM frpm  WHERE `County Name` = 'Los Angeles'  AND `Low Grade` = 'K'  AND `High Grade` = '9'	california_schools
SELECT `frpm`.`Low Grade`, `frpm`.`High Grade`, COUNT(*) AS count FROM `schools` JOIN `frpm` ON `schools`.`CDSCode` = `frpm`.`CDSCode` WHERE `schools`.`City` = 'Adelanto' GROUP BY `frpm`.`Low Grade`, `frpm`.`High Grade` ORDER BY count DESC LIMIT 1;	california_schools
SELECT County, COUNT(*) AS num_schools FROM schools WHERE County IN ('San Diego', 'Santa Barbara') AND Virtual = 'F' GROUP BY County ORDER BY num_schools DESC LIMIT 1;	california_schools
SELECT s.School AS SchoolName, s.Latitude, f.`School Type` FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode ORDER BY s.Latitude DESC LIMIT 1;	california_schools
SELECT schools.City, frpm.`Low Grade`, schools.School FROM schools INNER JOIN frpm ON schools.CDSCode = frpm.CDSCode WHERE schools.State = 'CA' ORDER BY schools.Latitude ASC LIMIT 1;	california_schools
SELECT `Low Grade`, `High Grade`  FROM schools  JOIN frpm USING (`CDSCode`) WHERE ABS(Longitude) = (SELECT MAX(ABS(Longitude)) FROM schools)	california_schools
SELECT COUNT(*)  FROM schools  JOIN frpm ON schools.CDSCode = frpm.CDSCode  WHERE schools.Magnet = 1  AND frpm.`Low Grade` = 'K'  AND frpm.`High Grade` = '8'  AND frpm.`NSLP Provision Status` = 'Multiple Provision Types';  SELECT schools.City, COUNT(*)  FROM schools  JOIN frpm ON schools.CDSCode = frpm.CDSCode  WHERE schools.Magnet = 1  AND frpm.`Low Grade` = 'K'  AND frpm.`High Grade` = '8'  AND frpm.`NSLP Provision Status` = 'Multiple Provision Types'  GROUP BY schools.City;	california_schools
WITH admin_names AS (     SELECT AdmFName1 AS fname, District FROM schools WHERE AdmFName1 IS NOT NULL     UNION ALL     SELECT AdmFName2, District FROM schools WHERE AdmFName2 IS NOT NULL     UNION ALL     SELECT AdmFName3, District FROM schools WHERE AdmFName3 IS NOT NULL ), name_counts AS (     SELECT fname, COUNT(*) AS cnt,            ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS rnk     FROM admin_names     GROUP BY fname ) SELECT an.fname, an.District FROM admin_names an JOIN name_counts nc ON an.fname = nc.fname WHERE nc.rnk <= 2 ORDER BY an.fname, an.District;	california_schools
SELECT frpm.`Percent (%) Eligible Free (K-12)`, frpm.`District Code`  FROM frpm  JOIN schools ON frpm.CDSCode = schools.CDSCode  WHERE schools.AdmFName1 = 'Alusine'  OR schools.AdmFName2 = 'Alusine'  OR schools.AdmFName3 = 'Alusine';	california_schools
SELECT schools.AdmLName1 AS Administrator_LastName, schools.District, schools.County, schools.School  FROM schools  WHERE schools.CharterNum = '40';	california_schools
SELECT AdmEmail1, AdmEmail2, AdmEmail3  FROM schools  WHERE County = 'San Bernardino'  AND District = 'San Bernardino City Unified'  AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31'  AND StatusType = 'Public'  AND (SOC = '62' OR DOC = '54');	california_schools
SELECT schools.School, schools.AdmEmail1 FROM schools JOIN satscores ON schools.CDSCode = satscores.cds ORDER BY satscores.NumGE1500 DESC LIMIT 1;	california_schools
SELECT COUNT(*)  FROM account a  JOIN district d ON a.district_id = d.district_id  WHERE a.frequency = 'POPLATEK PO OBRATU'  AND d.A3 = 'East Bohemia';	financial
SELECT COUNT(*)  FROM account  JOIN district ON account.district_id = district.district_id  WHERE district.A3 = 'Prague';	financial
SELECT AVG(A12) AS avg_1995, AVG(A13) AS avg_1996 FROM district;	financial
SELECT COUNT(*)  FROM district d WHERE A11 > 6000 AND A11 < 10000  AND EXISTS (SELECT 1 FROM client c WHERE c.district_id = d.district_id AND c.gender = 'F')	financial
SELECT COUNT(*)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE client.gender = 'M'  AND district.A3 = 'North Bohemia'  AND district.A11 > 8000;	financial
SELECT a.account_id,      (SELECT MAX(d.A11) FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F') -      (SELECT MIN(d.A11) FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F' AND c.birth_date = (SELECT MIN(birth_date) FROM client WHERE gender = 'F')) AS gap FROM client cl JOIN district d ON cl.district_id = d.district_id JOIN disp dp ON cl.client_id = dp.client_id JOIN account a ON dp.account_id = a.account_id WHERE cl.gender = 'F' AND cl.birth_date = (SELECT MIN(birth_date) FROM client WHERE gender = 'F') AND d.A11 = (SELECT MIN(district.A11) FROM client c JOIN district district ON c.district_id = district.district_id WHERE c.gender = 'F' AND c.birth_date = (SELECT MIN(birth_date) FROM client WHERE gender = 'F'))	financial
SELECT account_id FROM disp WHERE client_id IN (     SELECT c.client_id     FROM client c     JOIN district d ON c.district_id = d.district_id     WHERE c.birth_date = (SELECT MAX(birth_date) FROM client)       AND d.A11 = (SELECT MAX(district.A11) FROM district JOIN client ON district.district_id = client.district_id) );	financial
SELECT COUNT(DISTINCT client_id)  FROM disp  JOIN account USING (account_id)  WHERE account.frequency = 'POPLATEK TYDNE'  AND disp.type = 'OWNER';	financial
SELECT client_id  FROM disp  WHERE account_id IN (SELECT account_id FROM account WHERE frequency = 'POPLATEK PO OBRATU')  AND type = 'DISPONENT'	financial
SELECT a.account_id  FROM account a  JOIN loan l ON a.account_id = l.account_id  WHERE l.date LIKE '1997%'  AND a.frequency = 'POPLATEK TYDNE'  AND l.amount = (SELECT MIN(amount) FROM loan WHERE date LIKE '1997%');	financial
SELECT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 12   AND a.date LIKE '1993%'   AND l.amount = (     SELECT MAX(l2.amount)     FROM loan l2     JOIN account a2 ON l2.account_id = a2.account_id     WHERE l2.duration > 12       AND a2.date LIKE '1993%'   );	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c  JOIN district d ON c.district_id = d.district_id  JOIN disp ON c.client_id = disp.client_id  WHERE c.gender = 'F'  AND c.birth_date < '1950-01-01'  AND d.A2 = 'Sokolov'	financial
SELECT account_id  FROM trans  WHERE date = (SELECT MIN(date) FROM trans WHERE YEAR(date) = 1995);	financial
SELECT a.account_id FROM account a JOIN trans t ON a.account_id = t.account_id JOIN (     SELECT account_id, MAX(date) AS max_date     FROM trans     GROUP BY account_id ) lt ON t.account_id = lt.account_id AND t.date = lt.max_date WHERE a.date < '1997-01-01' AND t.balance > 3000;	financial
SELECT client.client_id  FROM client  JOIN disp ON client.client_id = disp.client_id  JOIN card ON disp.disp_id = card.disp_id  WHERE card.issued = '1994-03-03';	financial
SELECT account.date  FROM account  JOIN trans ON account.account_id = trans.account_id  WHERE trans.amount = 840 AND trans.date = '1998-10-14'	financial
SELECT a.district_id  FROM loan l  JOIN account a ON l.account_id = a.account_id  WHERE l.date = '1994-08-25'	financial
SELECT MAX(t.amount)  FROM trans t  WHERE t.account_id IN (     SELECT d.account_id      FROM disp d      WHERE d.client_id IN (         SELECT d2.client_id          FROM disp d2          WHERE d2.disp_id IN (             SELECT c.disp_id              FROM card c              WHERE c.issued = '1996-10-21'         )     ) );	financial
SELECT c.gender  FROM client c  JOIN disp d ON c.client_id = d.client_id  JOIN account a ON d.account_id = a.account_id  WHERE a.district_id = (SELECT district_id FROM district ORDER BY A11 DESC LIMIT 1)  AND d.type = 'OWNER'  ORDER BY c.birth_date ASC  LIMIT 1;	financial
SELECT t.amount  FROM trans t  JOIN account a ON t.account_id = a.account_id  JOIN disp d ON a.account_id = d.account_id AND d.type = 'OWNER'  JOIN loan l ON a.account_id = l.account_id  WHERE l.amount = (SELECT MAX(amount) FROM loan)  AND t.date >= a.date  ORDER BY t.date, t.trans_id  LIMIT 1;	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c  JOIN disp d ON c.client_id = d.client_id  JOIN account a ON d.account_id = a.account_id  JOIN district dist ON a.district_id = dist.district_id  WHERE dist.A2 = 'Jesenik'  AND d.type = 'OWNER'  AND c.gender = 'F';	financial
SELECT disp.disp_id  FROM trans  JOIN disp ON trans.account_id = disp.account_id  WHERE trans.date = '1998-09-02' AND trans.amount = 5100;	financial
SELECT COUNT(*)  FROM account  JOIN district ON account.district_id = district.district_id  WHERE district.A2 = 'Litomerice'  AND YEAR(account.date) = 1996;	financial
SELECT d.A2  FROM district d  JOIN account a ON d.district_id = a.district_id  JOIN disp ON a.account_id = disp.account_id  JOIN client c ON disp.client_id = c.client_id  WHERE c.gender = 'F'  AND c.birth_date = '1976-01-29'  AND disp.type = 'OWNER';	financial
SELECT c.birth_date  FROM loan l  JOIN account a ON l.account_id = a.account_id  JOIN disp d ON a.account_id = d.account_id  JOIN client c ON d.client_id = c.client_id  WHERE l.amount = 80952 AND l.date = '1994-01-05' AND d.type = 'OWNER';	financial
SELECT a.account_id FROM account a JOIN district d ON a.district_id = d.district_id JOIN disp ON a.account_id = disp.account_id WHERE d.A3 = 'Prague' AND disp.type = 'OWNER' ORDER BY a.date ASC LIMIT 1;	financial
SELECT      (SUM(CASE WHEN c.gender = 'M' THEN 1 ELSE 0 END) * 100.0 / COUNT(c.client_id)) AS percentage FROM client c WHERE c.district_id = (     SELECT district_id      FROM district      WHERE A3 = 'Jihočeský kraj'      ORDER BY A4 DESC      LIMIT 1 );	financial
SELECT ((new_balance - old_balance)/NULLIF(old_balance, 0))*100 AS increase_rate FROM (     SELECT          (SELECT balance FROM trans WHERE account_id = (SELECT account_id FROM loan ORDER BY date ASC LIMIT 1) AND date <= '1998-12-27' ORDER BY date DESC, trans_id DESC LIMIT 1) AS new_balance,         (SELECT balance FROM trans WHERE account_id = (SELECT account_id FROM loan ORDER BY date ASC LIMIT 1) AND date <= '1993-03-22' ORDER BY date DESC, trans_id DESC LIMIT 1) AS old_balance ) AS balances;	financial
SELECT (SUM(CASE WHEN status = 'A' THEN amount ELSE 0 END) / SUM(amount) * 100.0) AS percentage FROM loan;	financial
SELECT (SUM(CASE WHEN status = 'C' THEN amount ELSE 0 END) / SUM(amount)) * 100 AS percentage FROM loan WHERE amount < 100000;	financial
SELECT account.account_id, district.A2 AS district_name, district.A3 AS district_region FROM account JOIN district ON account.district_id = district.district_id WHERE account.frequency = 'POPLATEK PO OBRATU' AND YEAR(account.date) = 1993;	financial
SELECT a.account_id, d.client_id, a.frequency  FROM account a  JOIN district dist ON a.district_id = dist.district_id  JOIN disp d ON a.account_id = d.account_id AND d.type = 'OWNER'  WHERE dist.A2 = 'east Bohemia'  AND a.date BETWEEN '1995-01-01' AND '2000-12-31';	financial
SELECT account.account_id, account.date FROM account JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Prachatice';	financial
SELECT d.A2 AS district, d.A3 AS region FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.loan_id = 4990;	financial
SELECT loan.account_id, district.A2 AS district, district.A3 AS region FROM loan JOIN account ON loan.account_id = account.account_id JOIN district ON account.district_id = district.district_id WHERE loan.amount > 300000;	financial
SELECT l.loan_id, d.A3 AS district, d.A11 AS average_salary FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.duration = 60;	financial
SELECT d.district_id, d.A2 AS state, ((d.A13 - d.A12)/d.A12)*100 AS unemployment_rate_increment FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.status = 'D';	financial
SELECT      (SUM(CASE WHEN d.A2 = 'Decin' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS percentage FROM account a JOIN district d ON a.district_id = d.district_id WHERE YEAR(a.date) = 1993;	financial
SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE'	financial
SELECT d.A2, COUNT(*) AS num_female FROM account a JOIN district d ON a.district_id = d.district_id JOIN disp ON a.account_id = disp.account_id JOIN client c ON disp.client_id = c.client_id WHERE c.gender = 'F' GROUP BY d.district_id ORDER BY num_female DESC LIMIT 9;	financial
SELECT d.A2 AS district_name, SUM(t.amount) AS total_withdrawal FROM trans t JOIN account a ON t.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE t.type = 'VYDAJ' AND t.date LIKE '1996-01%' GROUP BY d.district_id, d.A2 ORDER BY total_withdrawal DESC LIMIT 10;	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN district dis ON a.district_id = dis.district_id WHERE dis.A3 = 'South Bohemia'  AND d.type = 'OWNER' AND c.client_id NOT IN (     SELECT client_id FROM disp d2      JOIN card c2 ON d2.disp_id = c2.disp_id );	financial
SELECT d.A3  FROM district d  JOIN account a ON d.district_id = a.district_id  JOIN loan l ON a.account_id = l.account_id  WHERE l.status IN ('C', 'D')  GROUP BY d.district_id, d.A3  ORDER BY COUNT(l.loan_id) DESC  LIMIT 1;	financial
SELECT AVG(l.amount)  FROM loan l JOIN account a ON l.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id WHERE c.gender = 'M' AND d.type = 'OWNER'	financial
SELECT A2 AS district_name, A2 AS branch_location FROM district WHERE A13 = (SELECT MAX(A13) FROM district);	financial
SELECT COUNT(*)  FROM account  WHERE district_id IN (     SELECT district_id      FROM district      WHERE A16 = (SELECT MAX(A16) FROM district) );	financial
SELECT COUNT(DISTINCT a.account_id)  FROM account a  JOIN trans t ON a.account_id = t.account_id  WHERE a.frequency = 'POPLATEK MESICNE'  AND t.operation = 'VYBER KARTOU'  AND t.balance < 0;	financial
SELECT COUNT(*)  FROM loan  JOIN account ON loan.account_id = account.account_id  WHERE loan.date BETWEEN '1995-01-01' AND '1997-12-31'  AND loan.amount >= 250000  AND account.frequency = 'POPLATEK MESICNE';	financial
SELECT COUNT(DISTINCT a.account_id)  FROM account a  JOIN loan l ON a.account_id = l.account_id  WHERE a.district_id = 1  AND l.status IN ('C', 'D')	financial
SELECT COUNT(*)  FROM client  WHERE gender = 'M'  AND district_id IN (     SELECT district_id      FROM district      WHERE A15 = (         SELECT MAX(A15)          FROM district          WHERE A15 < (             SELECT MAX(A15)              FROM district              WHERE A15 IS NOT NULL         )     ) );	financial
SELECT COUNT(*)  FROM card  JOIN disp ON card.disp_id = disp.disp_id  WHERE card.type = 'gold'  AND disp.type = 'OWNER';	financial
SELECT COUNT(a.account_id)  FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Pisek';	financial
SELECT DISTINCT d.A2  FROM district d  JOIN account a ON d.district_id = a.district_id  JOIN trans t ON a.account_id = t.account_id  WHERE t.amount > 10000 AND t.date BETWEEN '1997-01-01' AND '1997-12-31';	financial
SELECT DISTINCT o.account_id FROM `order` o JOIN account a ON o.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE o.k_symbol = 'SIPO' AND d.A2 = 'Pisek';	financial
SELECT DISTINCT a.account_id FROM account a JOIN disp d ON a.account_id = d.account_id JOIN card c ON d.disp_id = c.disp_id WHERE c.type = 'gold';	financial
SELECT      DATE_FORMAT(trans.date, '%Y-%m') AS month_year,     AVG(trans.amount) AS average_amount FROM trans WHERE      trans.operation = 'VYBER KARTOU'     AND YEAR(trans.date) = 2021     AND EXISTS (         SELECT 1          FROM disp          JOIN card ON disp.disp_id = card.disp_id         WHERE disp.account_id = trans.account_id     ) GROUP BY      DATE_FORMAT(trans.date, '%Y-%m');	financial
SELECT DISTINCT c.client_id FROM trans t JOIN account a ON t.account_id = a.account_id JOIN disp d ON d.account_id = a.account_id AND d.type = 'OWNER' JOIN client c ON d.client_id = c.client_id WHERE t.operation = 'VYBER KARTOU' AND YEAR(t.date) = 1998 AND t.amount < (     SELECT AVG(amount)      FROM trans      WHERE operation = 'VYBER KARTOU'      AND YEAR(date) = 1998 ) AND EXISTS (     SELECT 1      FROM card c2      JOIN disp d2 ON c2.disp_id = d2.disp_id      WHERE d2.account_id = a.account_id );	financial
SELECT DISTINCT client.client_id FROM client JOIN disp ON client.client_id = disp.client_id AND disp.type = 'OWNER' JOIN account ON disp.account_id = account.account_id JOIN loan ON account.account_id = loan.account_id JOIN card ON disp.disp_id = card.disp_id WHERE client.gender = 'F';	financial
SELECT COUNT(DISTINCT a.account_id)  FROM client c  JOIN disp d ON c.client_id = d.client_id  JOIN account a ON d.account_id = a.account_id  JOIN district dist ON a.district_id = dist.district_id  WHERE c.gender = 'F' AND dist.A3 = 'south Bohemia';	financial
SELECT a.*  FROM account a  JOIN district d ON a.district_id = d.district_id  WHERE d.A2 = 'Tabor'  AND EXISTS (     SELECT 1      FROM disp      WHERE disp.account_id = a.account_id      AND disp.type = 'OWNER' );	financial
SELECT d.type AS account_type  FROM disp d  JOIN account a ON d.account_id = a.account_id  JOIN district dis ON a.district_id = dis.district_id  WHERE a.account_id NOT IN (SELECT account_id FROM disp WHERE type = 'OWNER')  GROUP BY d.type  HAVING AVG(dis.A11) BETWEEN 8000 AND 9000;	financial
SELECT COUNT(DISTINCT a.account_id)  FROM trans t  JOIN account a ON t.account_id = a.account_id  JOIN district d ON a.district_id = d.district_id  WHERE d.A3 = 'North Bohemia' AND t.bank = 'AB'	financial
SELECT DISTINCT d.A2  FROM trans t  JOIN account a ON t.account_id = a.account_id  JOIN district d ON a.district_id = d.district_id  WHERE t.type = 'VYDAJ'	financial
SELECT AVG(d.A15)  FROM district d WHERE d.A15 > 4000  AND EXISTS (     SELECT 1      FROM account a      WHERE a.district_id = d.district_id      AND a.date >= '1997-01-01' );	financial
SELECT COUNT(*)  FROM card  JOIN disp ON card.disp_id = disp.disp_id  WHERE card.type = 'classic'  AND disp.type = 'OWNER';	financial
SELECT COUNT(client.client_id)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE client.gender = 'M' AND district.A2 = 'Hl.m. Praha'	financial
SELECT (COUNT(CASE WHEN type = 'gold' AND issued < '1998' THEN 1 END) * 100.0 / COUNT(*)) FROM card;	financial
SELECT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id WHERE d.account_id IN (     SELECT account_id FROM loan WHERE amount = (SELECT MAX(amount) FROM loan) ) AND d.type = 'OWNER'	financial
SELECT d.A15  FROM account a  JOIN district d ON a.district_id = d.district_id  WHERE a.account_id = 532;	financial
SELECT district_id  FROM account  WHERE account_id = (SELECT account_id FROM `order` WHERE order_id = 33333)	financial
SELECT *  FROM trans  JOIN disp ON trans.account_id = disp.account_id  WHERE disp.client_id = 3356  AND trans.operation = 'VYBER';	financial
SELECT COUNT(*)  FROM account a WHERE a.frequency = 'POPLATEK TYDNE' AND EXISTS (     SELECT 1      FROM loan l      WHERE l.account_id = a.account_id      AND l.amount < 200000 );	financial
SELECT card.type  FROM client  JOIN disp ON client.client_id = disp.client_id  JOIN card ON disp.disp_id = card.disp_id  WHERE client.client_id = 13539;	financial
SELECT d.A3  FROM client c  JOIN district d ON c.district_id = d.district_id  WHERE c.client_id = 3541;	financial
SELECT district.district_id FROM loan JOIN account ON loan.account_id = account.account_id JOIN district ON account.district_id = district.district_id WHERE loan.status = 'A' GROUP BY district.district_id ORDER BY COUNT(DISTINCT account.account_id) DESC LIMIT 1;	financial
SELECT client.client_id, client.gender, client.birth_date, client.district_id  FROM `order`  JOIN account ON order.account_id = account.account_id  JOIN disp ON account.account_id = disp.account_id  JOIN client ON disp.client_id = client.client_id  WHERE order.order_id = 32423;	financial
SELECT trans.*  FROM trans  JOIN account ON trans.account_id = account.account_id  WHERE account.district_id = 5;	financial
SELECT COUNT(*)  FROM account  JOIN district ON account.district_id = district.district_id  WHERE district.A2 = 'Jesenik';	financial
SELECT DISTINCT client.client_id FROM client JOIN disp ON client.client_id = disp.client_id JOIN card ON disp.disp_id = card.disp_id WHERE card.type = 'junior' AND card.issued >= '1997-01-01';	financial
SELECT      (COUNT(CASE WHEN c.gender = 'F' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM account a JOIN district d ON a.district_id = d.district_id JOIN disp dis ON a.account_id = dis.account_id JOIN client c ON dis.client_id = c.client_id WHERE d.A11 > 10000   AND dis.type = 'OWNER';	financial
SELECT      ((SUM(CASE WHEN EXTRACT(YEAR FROM loan.date) = 1997 THEN loan.amount ELSE 0 END)        - SUM(CASE WHEN EXTRACT(YEAR FROM loan.date) = 1996 THEN loan.amount ELSE 0 END))       / NULLIF(SUM(CASE WHEN EXTRACT(YEAR FROM loan.date) = 1996 THEN loan.amount ELSE 0 END), 0))      * 100 AS growth_rate FROM loan JOIN account ON loan.account_id = account.account_id WHERE EXISTS (     SELECT 1      FROM disp      JOIN client ON disp.client_id = client.client_id      WHERE disp.account_id = account.account_id        AND client.gender = 'M' ) AND EXTRACT(YEAR FROM loan.date) BETWEEN 1996 AND 1997;	financial
SELECT COUNT(*)  FROM trans  WHERE operation = 'VYBER KARTOU'  AND date > '1995-12-31';	financial
SELECT      (SUM(CASE WHEN A3 = 'North Bohemia' THEN A16 ELSE 0 END)      - SUM(CASE WHEN A3 = 'East Bohemia' THEN A16 ELSE 0 END))  FROM district;	financial
SELECT      SUM(CASE WHEN type = 'OWNER' THEN 1 ELSE 0 END) AS owner_count,     SUM(CASE WHEN type = 'DISPONENT' THEN 1 ELSE 0 END) AS disponent_count FROM disp WHERE account_id BETWEEN 1 AND 10;	financial
SELECT COUNT(*) FROM `order` WHERE account_id = 3 AND k_symbol = 'SIPO'; SELECT k_symbol FROM `order` WHERE amount = 3539;	financial
SELECT YEAR(client.birth_date) FROM client WHERE client_id = (SELECT client_id FROM disp WHERE account_id = 130 AND type = 'OWNER');	financial
SELECT COUNT(DISTINCT a.account_id)  FROM account a JOIN disp d ON a.account_id = d.account_id WHERE d.type = 'OWNER'  AND a.frequency = 'POPLATEK PO OBRATU'	financial
SELECT SUM(l.amount) AS total_debt, l.status FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN loan l ON a.account_id = l.account_id WHERE c.client_id = 992 GROUP BY l.status;	financial
SELECT COALESCE(t.balance, 0) AS account_balance, c.gender FROM client c JOIN disp d ON c.client_id = d.client_id LEFT JOIN trans t ON d.account_id = t.account_id AND t.trans_id = 851 WHERE c.client_id = 4 AND d.type = 'OWNER';	financial
SELECT type FROM card  JOIN disp ON card.disp_id = disp.disp_id  WHERE disp.client_id = 9;	financial
SELECT SUM(t.amount)  FROM trans t  JOIN account a ON t.account_id = a.account_id  JOIN disp d ON d.account_id = a.account_id  WHERE d.client_id = 617  AND YEAR(t.date) = 1998  AND t.type = 'VYBER';	financial
SELECT DISTINCT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN district dist ON a.district_id = dist.district_id WHERE c.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND dist.A3 = 'East Bohemia';	financial
SELECT client.client_id FROM loan JOIN account ON loan.account_id = account.account_id JOIN disp ON account.account_id = disp.account_id JOIN client ON disp.client_id = client.client_id WHERE client.gender = 'F' GROUP BY client.client_id ORDER BY SUM(loan.amount) DESC LIMIT 3;	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c  JOIN disp d ON c.client_id = d.client_id  JOIN `order` o ON d.account_id = o.account_id  WHERE c.gender = 'M'  AND c.birth_date BETWEEN '1974-01-01' AND '1976-12-31'  AND o.k_symbol = 'SIPO'  AND o.amount > 4000;	financial
SELECT COUNT(*)  FROM account  JOIN district ON account.district_id = district.district_id  WHERE district.A2 = 'Beroun'  AND account.date > '1996-12-31';	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card cd ON d.disp_id = cd.disp_id WHERE c.gender = 'F' AND cd.type = 'junior';	financial
SELECT      (COUNT(DISTINCT CASE WHEN c.gender = 'F' THEN c.client_id END) /       NULLIF(COUNT(DISTINCT c.client_id), 0)) * 100  FROM client c  JOIN disp d ON c.client_id = d.client_id  JOIN account a ON d.account_id = a.account_id  JOIN district dist ON a.district_id = dist.district_id  WHERE dist.A3 = 'Prague'	financial
SELECT      (COUNT(DISTINCT CASE WHEN c.gender = 'M' THEN c.client_id END) /       COUNT(DISTINCT c.client_id) * 1.0) * 100 AS percentage FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE a.frequency = 'POPLATEK TYDNE';	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c  JOIN disp d ON c.client_id = d.client_id  JOIN account a ON d.account_id = a.account_id  WHERE a.frequency = 'POPLATEK TYDNE'  AND d.type = 'OWNER';	financial
SELECT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 24     AND a.date < '1997-01-01'     AND l.amount = (         SELECT MIN(l2.amount)         FROM loan l2         JOIN account a2 ON l2.account_id = a2.account_id         WHERE l2.duration > 24             AND a2.date < '1997-01-01'     )	financial
SELECT a.account_id FROM account a JOIN disp ON a.account_id = disp.account_id JOIN client c ON disp.client_id = c.client_id JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F'     AND c.birth_date = (SELECT MIN(birth_date) FROM client WHERE gender = 'F')     AND d.A11 = (         SELECT MIN(d2.A11)         FROM district d2         JOIN client c2 ON d2.district_id = c2.district_id         WHERE c2.gender = 'F' AND c2.birth_date = (SELECT MIN(birth_date) FROM client WHERE gender = 'F')     );	financial
SELECT COUNT(*)  FROM client JOIN district ON client.district_id = district.district_id WHERE      client.birth_date BETWEEN '1920-01-01' AND '1920-12-31'     AND district.A3 = 'East Bohemia';	financial
SELECT COUNT(*)  FROM loan l  JOIN account a ON l.account_id = a.account_id  WHERE l.duration = 24  AND a.frequency = 'POPLATEK TYDNE';	financial
SELECT AVG(l.amount)  FROM loan l WHERE l.status IN ('C', 'D') AND EXISTS (     SELECT 1      FROM trans t      WHERE t.account_id = l.account_id      AND t.type = 'POPLATEK PO OBRATU' );	financial
SELECT c.client_id, c.district_id FROM client c WHERE EXISTS (SELECT 1 FROM disp d WHERE d.client_id = c.client_id AND d.type = 'OWNER') AND NOT EXISTS (SELECT 1 FROM disp d WHERE d.client_id = c.client_id AND d.type = 'DISPONENT');	financial
SELECT client.client_id, TIMESTAMPDIFF(YEAR, client.birth_date, CURDATE()) AS age FROM client WHERE EXISTS (     SELECT 1      FROM disp      WHERE disp.client_id = client.client_id      AND disp.type = 'OWNER' )  AND EXISTS (     SELECT 1      FROM card      JOIN disp d ON card.disp_id = d.disp_id      WHERE d.client_id = client.client_id      AND card.type = 'gold' );	financial
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY COUNT(*) DESC LIMIT 1;	toxicology
SELECT COUNT(*) FROM molecule m WHERE m.label = '-' AND EXISTS (SELECT 1 FROM atom a WHERE a.molecule_id = m.molecule_id AND a.element = 'cl');	toxicology
SELECT AVG(o_count) AS average_oxygen FROM (     SELECT m.molecule_id, COUNT(CASE WHEN a.element = 'o' THEN 1 END) AS o_count     FROM molecule m     LEFT JOIN atom a ON m.molecule_id = a.molecule_id     WHERE m.molecule_id IN (         SELECT molecule_id FROM bond GROUP BY molecule_id HAVING COUNT(*) = COUNT(CASE WHEN bond_type = '-' THEN 1 END)     )     GROUP BY m.molecule_id ) AS subquery;	toxicology
SELECT      (SELECT COUNT(*) FROM bond WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+') AND bond_type = '-')      /      (SELECT COUNT(*) FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+'))  AS average;	toxicology
SELECT COUNT(*)  FROM molecule m WHERE m.label = '-'  AND EXISTS (     SELECT 1      FROM atom a      WHERE a.molecule_id = m.molecule_id      AND a.element = 'na' );	toxicology
SELECT DISTINCT m.molecule_id  FROM molecule m  JOIN bond b ON m.molecule_id = b.molecule_id  WHERE b.bond_type = '#'  AND m.label = '+';	toxicology
SELECT      SUM(CASE WHEN element = 'c' THEN 1 ELSE 0 END) / COUNT(atom_id)  FROM atom  WHERE molecule_id IN (SELECT molecule_id FROM bond WHERE bond_type = '=');	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '#';	toxicology
SELECT COUNT(*) FROM atom WHERE element != 'br' OR element IS NULL;	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR099' AND label = '+'	toxicology
SELECT DISTINCT molecule_id FROM atom WHERE element = 'c';	toxicology
SELECT element FROM atom  WHERE atom_id IN (     SELECT atom_id FROM connected WHERE bond_id = 'TR004_8_9'     UNION     SELECT atom_id2 FROM connected WHERE bond_id = 'TR004_8_9' )	toxicology
SELECT DISTINCT a.element  FROM bond  JOIN connected ON bond.bond_id = connected.bond_id  JOIN atom a ON connected.atom_id = a.atom_id  WHERE bond.bond_type = '='  UNION  SELECT DISTINCT a.element  FROM bond  JOIN connected ON bond.bond_id = connected.bond_id  JOIN atom a ON connected.atom_id2 = a.atom_id  WHERE bond.bond_type = '=';	toxicology
SELECT m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'h' GROUP BY m.label ORDER BY COUNT(*) DESC LIMIT 1;	toxicology
SELECT DISTINCT bond.bond_type  FROM bond  JOIN connected ON bond.bond_id = connected.bond_id  JOIN atom ON connected.atom_id = atom.atom_id OR connected.atom_id2 = atom.atom_id  WHERE atom.element = 'cl';	toxicology
SELECT connected.atom_id, connected.atom_id2  FROM connected  JOIN bond ON connected.bond_id = bond.bond_id  WHERE bond.bond_type = '-';	toxicology
SELECT c.atom_id, c.atom_id2  FROM connected c  JOIN bond b ON c.bond_id = b.bond_id  JOIN molecule m ON b.molecule_id = m.molecule_id  WHERE m.label = '-';	toxicology
SELECT element  FROM atom  JOIN molecule ON atom.molecule_id = molecule.molecule_id  WHERE molecule.label = '-'  GROUP BY element  ORDER BY COUNT(*) ASC  LIMIT 1;	toxicology
SELECT bond.bond_type  FROM bond  JOIN connected ON bond.bond_id = connected.bond_id  WHERE (connected.atom_id = 'TR004_8' AND connected.atom_id2 = 'TR004_20')     OR (connected.atom_id = 'TR004_20' AND connected.atom_id2 = 'TR004_8')	toxicology
SELECT label FROM (SELECT '+' AS label UNION SELECT '-') AS all_labels WHERE label NOT IN (SELECT m.label FROM molecule m WHERE EXISTS (SELECT 1 FROM atom a WHERE a.molecule_id = m.molecule_id AND a.element != 'sn'));	toxicology
SELECT COUNT(DISTINCT a.atom_id)  FROM atom a  WHERE a.molecule_id IN (SELECT b.molecule_id FROM bond b WHERE b.bond_type = '-')  AND (a.element = 'i' OR a.element = 's');	toxicology
SELECT atom_id, atom_id2 FROM connected JOIN bond ON connected.bond_id = bond.bond_id WHERE bond.bond_type = '#';	toxicology
SELECT atom_id2 AS connected_atom FROM connected WHERE atom_id IN (SELECT atom_id FROM atom WHERE molecule_id = 'TR181')  UNION  SELECT atom_id AS connected_atom FROM connected WHERE atom_id2 IN (SELECT atom_id FROM atom WHERE molecule_id = 'TR181')	toxicology
SELECT    ( (SELECT COUNT(*) FROM molecule        WHERE label = '+'        AND molecule_id NOT IN (SELECT DISTINCT a.molecule_id FROM atom a WHERE a.element = 'f') )     /      (SELECT COUNT(*) FROM molecule WHERE label = '+')    ) * 100 AS percentage;	toxicology
SELECT (SUM(CASE WHEN bond.bond_type = '#' THEN 1 ELSE 0 END) * 100.0 / COUNT(bond.bond_id)) AS percent FROM molecule JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE molecule.label = '+'	toxicology
SELECT DISTINCT element FROM atom WHERE molecule_id = 'TR000' ORDER BY element LIMIT 3;	toxicology
SELECT atom_id, atom_id2 FROM connected INNER JOIN bond USING (bond_id) WHERE bond.bond_id = 'TR001_2_6' AND bond.molecule_id = 'TR001';	toxicology
SELECT SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN label = '-' THEN 1 ELSE 0 END) FROM molecule;	toxicology
SELECT atom_id, atom_id2 FROM connected WHERE bond_id = 'TR000_2_5'	toxicology
SELECT bond_id FROM connected WHERE atom_id2 = 'TR000_2'	toxicology
SELECT molecule.molecule_id  FROM molecule  JOIN bond ON molecule.molecule_id = bond.molecule_id  WHERE bond.bond_type = '='  GROUP BY molecule.molecule_id  ORDER BY molecule.molecule_id  LIMIT 5;	toxicology
SELECT (SUM(bond_type = '=') / COUNT(bond_id)) * 100 AS percent FROM bond WHERE molecule_id = 'TR008';	toxicology
SELECT ROUND((SUM(label = '+') / COUNT(molecule_id)) * 100, 3) AS percent FROM molecule;	toxicology
SELECT ROUND((SUM(element = 'h') / COUNT(atom_id)) * 100, 4) AS percent FROM atom WHERE molecule_id = 'TR206'	toxicology
SELECT bond_type FROM bond WHERE molecule_id = 'TR000';	toxicology
SELECT m.label, GROUP_CONCAT(a.element) AS elements   FROM molecule m   LEFT JOIN atom a ON m.molecule_id = a.molecule_id   WHERE m.molecule_id = 'TR060'   GROUP BY m.molecule_id;	toxicology
SELECT      (SELECT bond_type FROM bond WHERE molecule_id = 'TR010' GROUP BY bond_type ORDER BY COUNT(*) DESC LIMIT 1) AS majority_bond_type,     (SELECT label FROM molecule WHERE molecule_id = 'TR010') AS carcinogenic_label;	toxicology
SELECT m.molecule_id FROM molecule m WHERE m.label = '-' AND EXISTS (     SELECT 1     FROM bond b     WHERE b.molecule_id = m.molecule_id     AND b.bond_type = '-' ) ORDER BY m.molecule_id LIMIT 3;	toxicology
SELECT bond_id FROM bond WHERE molecule_id = 'TR006' ORDER BY bond_id ASC LIMIT 2;	toxicology
SELECT COUNT(DISTINCT bond.bond_id)  FROM connected JOIN bond ON connected.bond_id = bond.bond_id WHERE (connected.atom_id = 'TR009_12' OR connected.atom_id2 = 'TR009_12')  AND bond.molecule_id = 'TR009';	toxicology
SELECT COUNT(*)  FROM molecule  WHERE label = '+'  AND EXISTS (     SELECT 1      FROM atom      WHERE atom.molecule_id = molecule.molecule_id      AND element = 'br' );	toxicology
SELECT bond.bond_type, c.atom_id, c.atom_id2  FROM bond  JOIN connected c ON bond.bond_id = c.bond_id  WHERE bond.bond_id = 'TR001_6_9'	toxicology
SELECT molecule.molecule_id, molecule.label   FROM atom   JOIN molecule ON atom.molecule_id = molecule.molecule_id   WHERE atom.atom_id = 'TR001_10';	toxicology
SELECT COUNT(DISTINCT molecule_id) FROM bond WHERE bond_type = '#';	toxicology
SELECT COUNT(DISTINCT bond_id) FROM connected WHERE atom_id LIKE 'TR\_%\_19' ESCAPE '\' OR atom_id2 LIKE 'TR\_%\_19' ESCAPE '\';	toxicology
SELECT DISTINCT element FROM atom WHERE molecule_id = 'TR004';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '-';	toxicology
SELECT DISTINCT m.molecule_id  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE SUBSTR(a.atom_id,7,2) BETWEEN '21' AND '25'  AND m.label = '+'	toxicology
SELECT DISTINCT c.bond_id  FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE (a1.element = 'p' AND a2.element = 'n') OR (a1.element = 'n' AND a2.element = 'p');	toxicology
SELECT m.label  FROM molecule m  JOIN bond b ON m.molecule_id = b.molecule_id  WHERE b.bond_type = '='  GROUP BY m.molecule_id  HAVING COUNT(b.bond_id) = (     SELECT MAX(double_bonds_count)      FROM (         SELECT COUNT(*) AS double_bonds_count          FROM bond          WHERE bond_type = '='          GROUP BY molecule_id     ) AS sub );	toxicology
SELECT AVG(bond_count) AS average_bonds FROM (     SELECT a.atom_id, COUNT(DISTINCT c.bond_id) AS bond_count     FROM atom a     LEFT JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2     WHERE a.element = 'i'     GROUP BY a.atom_id ) AS subquery;	toxicology
SELECT DISTINCT b.bond_type, b.bond_id FROM bond b JOIN connected c ON b.bond_id = c.bond_id WHERE SUBSTR(c.atom_id,7,2)+0 =45 OR SUBSTR(c.atom_id2,7,2)+0 =45;	toxicology
SELECT element  FROM atom  WHERE atom_id NOT IN (     SELECT atom_id FROM connected     UNION     SELECT atom_id2 FROM connected );	toxicology
SELECT atom_id, atom_id2  FROM connected  JOIN bond USING (bond_id)  WHERE bond.molecule_id = 'TR041' AND bond.bond_type = '#';	toxicology
SELECT element  FROM atom  WHERE atom_id IN (     SELECT atom_id FROM connected WHERE bond_id = 'TR144_8_19'      UNION      SELECT atom_id2 FROM connected WHERE bond_id = 'TR144_8_19' );	toxicology
SELECT bond.molecule_id FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_type = '='  AND molecule.label = '+' GROUP BY bond.molecule_id HAVING COUNT(*) = (     SELECT MAX(sub_cnt)     FROM (         SELECT COUNT(*) AS sub_cnt         FROM bond         JOIN molecule ON bond.molecule_id = molecule.molecule_id         WHERE bond.bond_type = '='          AND molecule.label = '+'         GROUP BY bond.molecule_id     ) AS max_counts );	toxicology
SELECT element  FROM (     SELECT element, COUNT(*) AS cnt      FROM atom      JOIN molecule USING (molecule_id)      WHERE molecule.label = '+'      GROUP BY element ) AS sub  ORDER BY cnt ASC  LIMIT 1;	toxicology
SELECT c1.atom_id2 AS connected_atom  FROM connected c1  JOIN atom a ON c1.atom_id = a.atom_id  WHERE a.element = 'pb'  UNION  SELECT c2.atom_id AS connected_atom  FROM connected c2  JOIN atom a ON c2.atom_id2 = a.atom_id  WHERE a.element = 'pb'	toxicology
SELECT a.element FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON a.atom_id = c.atom_id WHERE b.bond_type = '#' UNION SELECT a.element FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON a.atom_id = c.atom_id2 WHERE b.bond_type = '#';	toxicology
WITH bond_elements AS (     SELECT          bond.bond_id,         GROUP_CONCAT(DISTINCT a.element ORDER BY a.element SEPARATOR '-') AS element_pair     FROM bond     JOIN connected c ON bond.bond_id = c.bond_id     JOIN atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id     GROUP BY bond.bond_id ), pair_counts AS (     SELECT element_pair, COUNT(*) AS cnt     FROM bond_elements     GROUP BY element_pair ), total_bonds AS (     SELECT COUNT(*) AS total FROM bond ) SELECT ROUND((MAX(cnt) / (SELECT total FROM total_bonds)) * 100, 2) AS percentage FROM pair_counts;	toxicology
SELECT (SUM(m.label = '+') * 100.0 / COUNT(b.bond_id)) AS proportion FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '-';	toxicology
SELECT COUNT(*) FROM atom WHERE element IN ('c', 'h');	toxicology
SELECT connected.atom_id2  FROM atom  JOIN connected ON atom.atom_id = connected.atom_id  WHERE atom.element = 's';	toxicology
SELECT DISTINCT b.bond_type FROM bond b JOIN connected c ON b.bond_id = c.bond_id WHERE c.atom_id IN (SELECT atom_id FROM atom WHERE element = 'sn')    OR c.atom_id2 IN (SELECT atom_id FROM atom WHERE element = 'sn');	toxicology
SELECT COUNT(DISTINCT element) FROM atom WHERE molecule_id IN (SELECT molecule_id FROM bond GROUP BY molecule_id HAVING COUNT(*) = COUNT(CASE WHEN bond_type = '-' THEN 1 END))	toxicology
SELECT COUNT(*)  FROM atom  WHERE molecule_id IN (SELECT molecule_id FROM bond WHERE bond_type = '#')  AND (element = 'p' OR element = 'br');	toxicology
SELECT bond.bond_id  FROM bond  JOIN molecule ON bond.molecule_id = molecule.molecule_id  WHERE molecule.label = '+'	toxicology
SELECT m.molecule_id  FROM molecule m  WHERE m.label = '-'  AND NOT EXISTS (     SELECT 1      FROM bond b      WHERE b.molecule_id = m.molecule_id      AND b.bond_type != '-' );	toxicology
SELECT      (SUM(         CASE WHEN a1.element = 'cl' THEN 1 ELSE 0 END +          CASE WHEN a2.element = 'cl' THEN 1 ELSE 0 END     ) * 100.0      /      (COUNT(*) * 2)     ) AS percentage FROM      bond b JOIN connected c ON b.bond_id = c.bond_id LEFT JOIN atom a1 ON c.atom_id = a1.atom_id LEFT JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE      b.bond_type = '-';	toxicology
SELECT molecule_id, label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002')	toxicology
SELECT molecule_id FROM molecule WHERE label = '-';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+' AND molecule_id BETWEEN 'TR000' AND 'TR030';	toxicology
SELECT molecule_id, bond_type FROM bond WHERE molecule_id BETWEEN 'TR000' AND 'TR050';	toxicology
SELECT element  FROM atom  WHERE atom_id IN (     SELECT atom_id FROM connected WHERE bond_id = 'TR001_10_11'     UNION     SELECT atom_id2 FROM connected WHERE bond_id = 'TR001_10_11' );	toxicology
SELECT COUNT(DISTINCT c.bond_id)  FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id  JOIN atom a2 ON c.atom_id2 = a2.atom_id  WHERE a1.element = 'i' OR a2.element = 'i';	toxicology
SELECT m.label FROM molecule m JOIN (     SELECT DISTINCT molecule_id     FROM atom     WHERE element = 'ca' ) AS ca_molecules USING (molecule_id) GROUP BY m.label ORDER BY COUNT(*) DESC LIMIT 1;	toxicology
SELECT      CASE          WHEN              (SELECT COUNT(DISTINCT element)               FROM atom               WHERE atom_id IN (                  SELECT atom_id                   FROM connected                   WHERE bond_id = 'TR001_1_8'                  UNION                   SELECT atom_id2                   FROM connected                   WHERE bond_id = 'TR001_1_8'              )              AND element IN ('cl', 'c')             ) = 2          THEN 'Yes'          ELSE 'No'      END AS result;	toxicology
SELECT m.molecule_id  FROM bond b  JOIN molecule m ON b.molecule_id = m.molecule_id  WHERE b.bond_type = '#'  AND m.label = '-'  AND EXISTS (     SELECT 1      FROM atom a      WHERE a.molecule_id = m.molecule_id      AND a.element = 'c' )  GROUP BY m.molecule_id  LIMIT 2;	toxicology
SELECT (SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END) * 100.0 / COUNT(a.atom_id)) AS percentage FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+'	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR001';	toxicology
SELECT molecule_id FROM bond WHERE bond_type = '=';	toxicology
SELECT DISTINCT c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#';	toxicology
SELECT element  FROM atom  WHERE atom_id IN (     SELECT atom_id FROM connected WHERE bond_id = 'TR000_1_2'     UNION     SELECT atom_id2 FROM connected WHERE bond_id = 'TR000_1_2' );	toxicology
SELECT COUNT(*) FROM molecule m WHERE m.label = '-' AND EXISTS (SELECT 1 FROM bond b WHERE b.molecule_id = m.molecule_id AND b.bond_type = '-') AND NOT EXISTS (SELECT 1 FROM bond b WHERE b.molecule_id = m.molecule_id AND b.bond_type != '-');	toxicology
SELECT m.label  FROM bond AS b  JOIN molecule AS m ON b.molecule_id = m.molecule_id  WHERE b.bond_id = 'TR001_10_11'	toxicology
SELECT bond.bond_id,  CASE WHEN molecule.label = '+' THEN 'Yes' ELSE 'No' END AS carcinogenic FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_type = '#';	toxicology
SELECT element, COUNT(*)  FROM atom  JOIN molecule USING (molecule_id)  WHERE molecule.label = '+'  AND substr(atom_id, 7, 1) = '4'  GROUP BY element;	toxicology
SELECT m.label,         (SELECT SUM(CASE WHEN a.element = 'h' THEN 1 ELSE 0 END) / COUNT(a.element)          FROM atom a          WHERE a.molecule_id = 'TR006') AS ratio  FROM molecule m  WHERE m.molecule_id = 'TR006';	toxicology
SELECT CASE WHEN EXISTS (     SELECT 1      FROM molecule m      JOIN atom a ON m.molecule_id = a.molecule_id      WHERE a.element = 'ca' AND m.label = '+' ) THEN 'Yes' ELSE 'No' END;	toxicology
SELECT bond_type FROM bond WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'c')	toxicology
SELECT      CASE a.element         WHEN 'cl' THEN 'Chlorine'         WHEN 'c' THEN 'Carbon'         WHEN 'h' THEN 'Hydrogen'         WHEN 'o' THEN 'Oxygen'         WHEN 's' THEN 'Sulfur'         WHEN 'n' THEN 'Nitrogen'         WHEN 'p' THEN 'Phosphorus'         WHEN 'na' THEN 'Sodium'         WHEN 'br' THEN 'Bromine'         WHEN 'f' THEN 'Fluorine'         WHEN 'i' THEN 'Iodine'         WHEN 'sn' THEN 'Tin'         WHEN 'pb' THEN 'Lead'         WHEN 'te' THEN 'Tellurium'         WHEN 'ca' THEN 'Calcium'     END AS element_name FROM atom a WHERE a.atom_id IN (     SELECT atom_id FROM connected WHERE bond_id = 'TR001_10_11'     UNION     SELECT atom_id2 FROM connected WHERE bond_id = 'TR001_10_11' );	toxicology
SELECT      (SELECT COUNT(DISTINCT molecule_id) FROM bond WHERE bond_type = '#') * 100.0      / (SELECT COUNT(*) FROM molecule) AS percentage;	toxicology
SELECT (SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) * 100.0 / COUNT(bond_id)) AS percent FROM bond WHERE molecule_id = 'TR047'	toxicology
SELECT label FROM molecule WHERE molecule_id = (SELECT molecule_id FROM atom WHERE atom_id = 'TR001_1');	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR151';	toxicology
SELECT DISTINCT element FROM atom WHERE molecule_id = 'TR151';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+'	toxicology
SELECT atom_id FROM atom WHERE element = 'c' AND CAST(SUBSTR(molecule_id,3,3) AS UNSIGNED) BETWEEN 10 AND 50;	toxicology
SELECT COUNT(*) FROM atom JOIN molecule USING (molecule_id) WHERE molecule.label = '+';	toxicology
SELECT bond.bond_id  FROM bond  JOIN molecule ON bond.molecule_id = molecule.molecule_id  WHERE bond.bond_type = '=' AND molecule.label = '+';	toxicology
SELECT COUNT(a.atom_id)  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE m.label = '+'  AND EXISTS (     SELECT 1      FROM atom a2      WHERE a2.molecule_id = a.molecule_id      AND a2.element = 'h' );	toxicology
SELECT molecule_id  FROM bond  JOIN connected ON bond.bond_id = connected.bond_id  WHERE connected.atom_id = 'TR000_1'  AND bond.bond_id = 'TR000_1_2';	toxicology
SELECT atom.atom_id FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.element = 'c' AND molecule.label = '-';	toxicology
SELECT      (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM molecule)) AS percentage FROM molecule m WHERE m.label = '+' AND EXISTS (SELECT 1 FROM atom a WHERE a.molecule_id = m.molecule_id AND a.element = 'h');	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR124';	toxicology
SELECT * FROM atom WHERE molecule_id = 'TR186';	toxicology
SELECT bond_type FROM bond WHERE bond_id = 'TR007_4_19'	toxicology
SELECT element FROM atom WHERE atom_id IN (     SELECT atom_id FROM connected WHERE bond_id = 'TR001_2_4'     UNION     SELECT atom_id2 FROM connected WHERE bond_id = 'TR001_2_4' );	toxicology
SELECT COUNT(b.bond_id) AS double_bonds, m.label AS carcinogenic  FROM molecule m  LEFT JOIN bond b ON m.molecule_id = b.molecule_id AND b.bond_type = '='  WHERE m.molecule_id = 'TR006'  GROUP BY m.molecule_id;	toxicology
SELECT m.molecule_id, GROUP_CONCAT(DISTINCT a.element ORDER BY a.element) AS elements FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' GROUP BY m.molecule_id;	toxicology
SELECT bond.bond_id, molecule.label, a1.element, a2.element FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id JOIN connected c ON bond.bond_id = c.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE bond.bond_type = '-';	toxicology
SELECT molecule_id, GROUP_CONCAT(DISTINCT element ORDER BY element) AS elements FROM atom WHERE molecule_id IN (     SELECT DISTINCT molecule_id FROM bond WHERE bond_type = '#' ) GROUP BY molecule_id;	toxicology
SELECT element  FROM atom  WHERE atom_id IN (     SELECT atom_id FROM connected WHERE bond_id = 'TR000_2_3'      UNION      SELECT atom_id2 FROM connected WHERE bond_id = 'TR000_2_3' );	toxicology
SELECT COUNT(DISTINCT c.bond_id)  FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE a1.element = 'cl' OR a2.element = 'cl';	toxicology
SELECT atom_id FROM atom WHERE molecule_id = 'TR346'; SELECT COUNT(DISTINCT bond_type) FROM bond WHERE molecule_id = 'TR346';	toxicology
SELECT      COUNT(DISTINCT b.molecule_id) AS total_double_bond_molecules,     COUNT(DISTINCT CASE WHEN m.label = '+' THEN b.molecule_id END) AS carcinogenic_count FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '=';	toxicology
SELECT COUNT(*)  FROM molecule m WHERE NOT EXISTS (     SELECT 1      FROM atom a      WHERE a.molecule_id = m.molecule_id      AND a.element = 's' ) AND NOT EXISTS (     SELECT 1      FROM bond b      WHERE b.molecule_id = m.molecule_id      AND b.bond_type = '=' );	toxicology
SELECT m.label  FROM bond b  JOIN molecule m ON b.molecule_id = m.molecule_id  WHERE b.bond_id = 'TR001_2_4';	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR001'	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '-';	toxicology
SELECT m.molecule_id  FROM molecule m  WHERE m.label = '+'  AND EXISTS (     SELECT 1      FROM atom a      WHERE a.molecule_id = m.molecule_id      AND a.element = 'cl' );	toxicology
SELECT m.molecule_id  FROM molecule m  WHERE m.molecule_id IN (SELECT a.molecule_id FROM atom a WHERE a.element = 'c')  AND m.label = '-';	toxicology
SELECT      (SELECT COUNT(*)       FROM molecule       WHERE label = '+'         AND EXISTS (SELECT 1 FROM atom WHERE atom.molecule_id = molecule.molecule_id AND element = 'cl')     ) * 100.0 /      (SELECT COUNT(*) FROM molecule WHERE label = '+') AS percentage	toxicology
SELECT molecule_id FROM bond WHERE bond_id = 'TR001_1_7';	toxicology
SELECT COUNT(DISTINCT a.element)  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2  WHERE c.bond_id = 'TR001_3_4';	toxicology
SELECT bond.bond_type  FROM bond  JOIN connected ON bond.bond_id = connected.bond_id  WHERE (connected.atom_id = 'TR000_1' AND connected.atom_id2 = 'TR000_2')     OR (connected.atom_id = 'TR000_2' AND connected.atom_id2 = 'TR000_1');	toxicology
SELECT molecule_id FROM atom WHERE atom_id IN ('TR000_2', 'TR000_4') GROUP BY molecule_id HAVING COUNT(*) = 2;	toxicology
SELECT element FROM atom WHERE atom_id = 'TR000_1';	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR000';	toxicology
SELECT (SUM(CASE WHEN bond_type = '-' THEN 1 ELSE 0 END) * 1.0 / COUNT(bond_id)) AS percentage FROM bond;	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE a.element = 'n' AND m.label = '+'	toxicology
SELECT DISTINCT b.molecule_id FROM bond b JOIN connected c ON b.bond_id = c.bond_id LEFT JOIN atom a1 ON c.atom_id = a1.atom_id LEFT JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE b.bond_type = '=' AND (a1.element = 's' OR a2.element = 's');	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id GROUP BY m.molecule_id, m.label HAVING COUNT(a.atom_id) > 5 AND m.label = '-';	toxicology
SELECT a.element  FROM bond b  JOIN connected c ON b.bond_id = c.bond_id  JOIN atom a ON a.atom_id = c.atom_id  WHERE b.molecule_id = 'TR024' AND b.bond_type = '='  UNION  SELECT a.element  FROM bond b  JOIN connected c ON b.bond_id = c.bond_id  JOIN atom a ON a.atom_id = c.atom_id2  WHERE b.molecule_id = 'TR024' AND b.bond_type = '='	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' GROUP BY m.molecule_id HAVING COUNT(a.atom_id) = (     SELECT MAX(sub.cnt)     FROM (         SELECT COUNT(a.atom_id) AS cnt         FROM molecule m2         JOIN atom a ON m2.molecule_id = a.molecule_id         WHERE m2.label = '+'         GROUP BY m2.molecule_id     ) AS sub );	toxicology
SELECT      (SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS percentage FROM molecule m WHERE EXISTS (     SELECT 1      FROM bond b     JOIN connected c ON b.bond_id = c.bond_id     JOIN atom a1 ON c.atom_id = a1.atom_id     JOIN atom a2 ON c.atom_id2 = a2.atom_id     WHERE b.molecule_id = m.molecule_id     AND b.bond_type = '#'     AND (a1.element = 'h' OR a2.element = 'h') );	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+'	toxicology
SELECT COUNT(*) FROM molecule m WHERE m.molecule_id BETWEEN 'TR004' AND 'TR010' AND EXISTS (SELECT 1 FROM bond b WHERE b.molecule_id = m.molecule_id AND b.bond_type = '-');	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR008' AND element = 'c'	toxicology
SELECT element  FROM atom  JOIN molecule ON atom.molecule_id = molecule.molecule_id  WHERE atom.atom_id = 'TR004_7' AND molecule.label = '-';	toxicology
SELECT COUNT(*) FROM (   SELECT bond.molecule_id    FROM bond    JOIN connected ON bond.bond_id = connected.bond_id    JOIN atom a ON a.atom_id = connected.atom_id    WHERE bond.bond_type = '=' AND a.element = 'o'   UNION    SELECT bond.molecule_id    FROM bond    JOIN connected ON bond.bond_id = connected.bond_id    JOIN atom a ON a.atom_id = connected.atom_id2    WHERE bond.bond_type = '=' AND a.element = 'o' ) AS sub;	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m  JOIN bond b ON m.molecule_id = b.molecule_id  WHERE b.bond_type = '#' AND m.label = '-';	toxicology
SELECT a.element, b.bond_type FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id WHERE a.molecule_id = 'TR002';	toxicology
SELECT a.atom_id  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2  JOIN bond b ON c.bond_id = b.bond_id  WHERE b.molecule_id = 'TR012'  AND b.bond_type = '='  AND a.element = 'c'	toxicology
SELECT atom_id FROM atom WHERE molecule_id IN (     SELECT m.molecule_id      FROM molecule m     JOIN atom a ON m.molecule_id = a.molecule_id     WHERE m.label = '+' AND a.element = 'o' );	toxicology
SELECT * FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT * FROM cards  WHERE borderColor = 'borderless'  AND (cardKingdomFoilId IS NULL OR cardKingdomId IS NULL);	card_games
SELECT name  FROM cards  WHERE faceConvertedManaCost > convertedManaCost  AND faceConvertedManaCost IS NOT NULL  AND convertedManaCost IS NOT NULL;	card_games
SELECT name FROM cards WHERE frameVersion = '2015' AND edhrecRank < 100;	card_games
SELECT DISTINCT c.name  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE l.format = 'gladiator'  AND l.status = 'Banned'  AND c.rarity = 'mythic'	card_games
SELECT cards.name, legalities.status FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.types = 'Artifact' AND cards.side IS NULL AND legalities.format = 'vintage'	card_games
SELECT c.id, c.artist  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE (c.power = '*' OR c.power IS NULL)  AND l.format = 'commander'  AND l.status = 'Legal';	card_games
SELECT     c.id,     GROUP_CONCAT(r.text, ' | ') AS ruling_texts,     CASE WHEN c.hasContentWarning = 1 THEN 'Yes' ELSE 'No' END AS has_missing_degraded_properties FROM     cards c LEFT JOIN     rulings r ON c.uuid = r.uuid WHERE     c.artist = 'Stephen Daniele' GROUP BY     c.id;	card_games
SELECT rulings.date, rulings.text  FROM rulings  JOIN cards ON rulings.uuid = cards.uuid  WHERE cards.name = 'Sublime Epiphany'  AND cards.number = '74s';	card_games
SELECT c.name, c.artist, c.isPromo FROM cards c JOIN rulings r ON c.uuid = r.uuid GROUP BY c.id, c.name, c.artist, c.isPromo ORDER BY COUNT(r.id) DESC LIMIT 1;	card_games
SELECT DISTINCT fd.language  FROM foreign_data fd  JOIN cards c ON fd.uuid = c.uuid  WHERE c.name = 'Annul' AND c.number = '29';	card_games
SELECT DISTINCT c.name  FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE f.language = 'Japanese'	card_games
SELECT (CAST(COUNT(DISTINCT fd.uuid) AS REAL) / (SELECT COUNT(*) FROM cards)) * 100  FROM foreign_data fd  WHERE fd.language = 'Chinese Simplified'	card_games
SELECT st.translation, s.totalSetSize FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE st.language = 'Italian';	card_games
SELECT COUNT(DISTINCT      CASE          WHEN type LIKE '% %' THEN SUBSTR(type, 1, INSTR(type, ' ') -1)         ELSE type     END )  FROM cards  WHERE artist = 'Aaron Boyd';	card_games
SELECT keywords FROM cards WHERE name = 'Angel of Mercy';	card_games
SELECT COUNT(*) FROM cards WHERE power = '*'	card_games
SELECT promoTypes FROM cards WHERE name = 'Duress';	card_games
SELECT borderColor FROM cards WHERE name = 'Ancestor''s Chosen';	card_games
SELECT originalType FROM cards WHERE name = 'Ancestor''s Chosen'	card_games
SELECT DISTINCT st.language  FROM set_translations st  JOIN sets s ON st.setCode = s.code  WHERE st.setCode IN (SELECT c.setCode FROM cards c WHERE c.name = 'Angel of Mercy');	card_games
SELECT COUNT(DISTINCT c.id)  FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.status = 'restricted'  AND c.isTextless = 0;	card_games
SELECT rulings.text  FROM rulings  JOIN cards ON rulings.uuid = cards.uuid  WHERE cards.name = 'Condemn';	card_games
SELECT COUNT(*)  FROM cards  JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.status = 'restricted'  AND cards.isStarter = 1;	card_games
SELECT legalities.format, legalities.status  FROM legalities  JOIN cards ON legalities.uuid = cards.uuid  WHERE cards.name = 'Cloudchaser Eagle';	card_games
SELECT type FROM cards WHERE name = 'Benalish Knight';	card_games
SELECT legalities.format, legalities.status  FROM legalities  JOIN cards ON legalities.uuid = cards.uuid  WHERE cards.name = 'Benalish Knight';	card_games
SELECT DISTINCT c.artist  FROM cards c  JOIN foreign_data f ON c.uuid = f.uuid  WHERE f.language = 'Phyrexian';	card_games
SELECT      ROUND((CAST(COUNT(CASE WHEN borderColor = 'borderless' THEN 1 END) AS REAL) / COUNT(*) * 100), 2) AS percentage FROM cards;	card_games
SELECT COUNT(DISTINCT c.id)  FROM cards c  JOIN foreign_data f ON c.uuid = f.uuid  WHERE f.language = 'German'  AND c.isReprint = 1;	card_games
SELECT COUNT(DISTINCT c.id)  FROM cards c  JOIN foreign_data f ON c.uuid = f.uuid  WHERE c.borderColor = 'borderless'  AND f.language = 'Russian';	card_games
SELECT      ((         SELECT COUNT(*)          FROM foreign_data fd         JOIN cards c ON fd.uuid = c.uuid         WHERE c.isStorySpotlight = 1 AND fd.language = 'French'     ) * 100.0 /      (         SELECT COUNT(*)          FROM cards          WHERE isStorySpotlight = 1     )) AS percentage;	card_games
SELECT COUNT(*) FROM cards WHERE toughness = '99'	card_games
SELECT name FROM cards WHERE artist = 'Aaron Boyd';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND availability = 'mtgo'	card_games
SELECT id FROM cards WHERE convertedManaCost = 0;	card_games
SELECT layout FROM cards WHERE keywords LIKE '%flying%';	card_games
SELECT COUNT(*)  FROM cards  WHERE originalType = 'Summon - Angel'  AND subtypes <> 'Angel';	card_games
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT id FROM cards WHERE duelDeck = 'a';	card_games
SELECT edhrecRank FROM cards WHERE frameVersion = '2015';	card_games
SELECT DISTINCT c.artist  FROM cards c  JOIN foreign_data f ON c.uuid = f.uuid  WHERE f.language = 'Chinese Simplified'	card_games
SELECT c.*  FROM cards c WHERE c.availability = 'paper' AND EXISTS (     SELECT 1      FROM foreign_data fd      WHERE fd.uuid = c.uuid        AND fd.language = 'Japanese' );	card_games
SELECT COUNT(DISTINCT c.id)  FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.status = 'Banned'  AND c.borderColor = 'white'	card_games
SELECT c.uuid, f.language FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN foreign_data f ON c.uuid = f.uuid WHERE l.format = 'legacy'	card_games
SELECT r.date, r.text  FROM rulings r  JOIN cards c ON r.uuid = c.uuid  WHERE c.name = 'Beacon of Immortality';	card_games
SELECT COUNT(DISTINCT c.uuid) AS card_count, l.status, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.frameVersion = 'future' AND l.status = 'Legal' GROUP BY l.format, l.status;	card_games
SELECT c.name, c.colorIdentity  FROM cards c  WHERE c.setCode = 'OGW'	card_games
SELECT c.name, f.language FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.setCode = '10E' AND c.convertedManaCost = 5	card_games
SELECT c.name, r.date FROM cards c LEFT JOIN rulings r ON c.uuid = r.uuid WHERE c.originalType = 'Creature - Elf';	card_games
SELECT c.id, c.colors, GROUP_CONCAT(l.format) AS formats FROM cards c LEFT JOIN legalities l ON c.uuid = l.uuid WHERE c.id BETWEEN 1 AND 20 GROUP BY c.id, c.colors;	card_games
SELECT * FROM cards  WHERE originalType = 'Artifact'  AND colors = 'B'  AND EXISTS (SELECT 1 FROM foreign_data WHERE foreign_data.uuid = cards.uuid);	card_games
SELECT c.name FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.rarity = 'uncommon' GROUP BY c.uuid, c.name ORDER BY MIN(r.date) ASC LIMIT 3;	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'John Avon' AND (cardKingdomId IS NULL OR cardKingdomFoilId IS NULL);	card_games
SELECT COUNT(*)  FROM cards  WHERE borderColor = 'white'  AND cardKingdomFoilId IS NOT NULL  AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*)  FROM cards  WHERE artist = 'UDON'  AND availability = 'mtgo'  AND hand = '-1';	card_games
SELECT COUNT(*)  FROM cards  WHERE frameVersion = '1993'  AND availability = 'paper'  AND hasContentWarning = 1;	card_games
SELECT manaCost FROM cards WHERE layout = 'normal' AND frameVersion = '2003' AND borderColor = 'black' AND availability = 'mtgo,paper';	card_games
SELECT SUM(CAST(manaCost AS REAL)) FROM cards WHERE artist = 'Rob Alexander';	card_games
SELECT DISTINCT supertypes FROM cards WHERE availability = 'arena' UNION SELECT DISTINCT subtypes FROM cards WHERE availability = 'arena';	card_games
SELECT DISTINCT c.setCode FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE f.language = 'Spanish'	card_games
SELECT (CAST(COUNT(CASE WHEN isOnlineOnly = 1 THEN 1 END) AS REAL) / COUNT(*) * 100) AS percentage  FROM cards  WHERE frameEffects = 'legendary';	card_games
SELECT    ROUND(     (CAST(SUM(CASE WHEN isStorySpotlight = 1 AND isTextless = 0 THEN 1 ELSE 0 END) AS REAL)       /       NULLIF(SUM(CASE WHEN isStorySpotlight = 1 THEN 1 ELSE 0 END), 0) * 100), 2   ) AS percentage,   id FROM cards WHERE isStorySpotlight = 1 AND isTextless = 0;	card_games
SELECT (COUNT(DISTINCT fd.uuid) * 100.0 / (SELECT COUNT(*) FROM cards)) AS percentage FROM foreign_data fd WHERE fd.language = 'Spanish';  SELECT DISTINCT c.name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Spanish';	card_games
SELECT DISTINCT st.language  FROM set_translations st JOIN sets s ON st.setCode = s.code  WHERE s.baseSetSize = 309;	card_games
SELECT COUNT(DISTINCT s.code)  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE s.block = 'Commander'  AND st.language = 'Portuguese (Brasil)'	card_games
SELECT DISTINCT c.id FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.types = 'Creature' AND l.status = 'Legal'	card_games
SELECT DISTINCT c.subtypes, c.supertypes  FROM cards c  JOIN foreign_data f ON c.uuid = f.uuid  WHERE f.language = 'German'  AND c.subtypes IS NOT NULL  AND c.supertypes IS NOT NULL;	card_games
SELECT COUNT(*)  FROM cards  WHERE (power IS NULL OR power = '*')  AND text LIKE '%triggered ability%'	card_games
SELECT COUNT(*)  FROM cards  WHERE side IS NULL  AND EXISTS (     SELECT 1      FROM legalities      WHERE legalities.uuid = cards.uuid      AND format = 'premodern' )  AND EXISTS (     SELECT 1      FROM rulings      WHERE rulings.uuid = cards.uuid      AND text = 'This is a triggered mana ability.' );	card_games
SELECT cards.id  FROM cards  JOIN legalities ON cards.uuid = legalities.uuid  WHERE cards.artist = 'Erica Yang'  AND cards.availability = 'paper'  AND legalities.format = 'pauper'  AND legalities.status = 'Legal'	card_games
SELECT c.artist  FROM cards c  JOIN foreign_data f ON c.uuid = f.uuid  WHERE f.language = 'German'  AND f.text LIKE '%Das perfekte Gegenmittel zu einer dichten Formation%'	card_games
SELECT fd.name  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE c.artist = 'Matthew D. Wilson'  AND c.type LIKE '%Creature%'  AND c.layout = 'normal'  AND c.borderColor = 'black'  AND fd.language = 'French';	card_games
SELECT COUNT(DISTINCT c.id)  FROM cards c  JOIN rulings r ON c.uuid = r.uuid  WHERE c.rarity = 'rare'  AND r.date = '2007-02-01'  AND r.text IS NOT NULL;	card_games
SELECT language FROM set_translations WHERE setCode = (SELECT code FROM sets WHERE baseSetSize = 180 AND block = 'Ravnica')	card_games
SELECT      (CAST(SUM(c.hasContentWarning = 0) AS REAL) / COUNT(c.id)) * 100  FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.format = 'commander' AND l.status = 'Legal';	card_games
SELECT      (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM cards WHERE power IS NULL OR power = '*'))  FROM      cards c WHERE      (power IS NULL OR power = '*')      AND EXISTS (         SELECT 1          FROM foreign_data fd          WHERE c.uuid = fd.uuid          AND fd.language = 'French'     )	card_games
SELECT      ROUND(         (CAST(COUNT(DISTINCT CASE WHEN s.type = 'expansion' THEN st.setCode END) AS REAL) /           CAST(COUNT(DISTINCT st.setCode) AS REAL)) * 100, 2     ) AS percentage FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE st.language = 'Japanese';	card_games
SELECT availability FROM cards WHERE artist = 'Daren Bader';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'borderless' AND edhrecRank > 12000 AND colors IS NOT NULL;	card_games
SELECT COUNT(*)  FROM cards  WHERE isOversized = 1  AND isReprint = 1  AND isPromo = 1;	card_games
SELECT * FROM cards  WHERE (power IS NULL OR power = '*')  AND promoTypes = 'arenaleague'  ORDER BY name ASC  LIMIT 3;	card_games
SELECT language FROM foreign_data WHERE multiverseid = 149934;	card_games
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL ORDER BY cardKingdomFoilId ASC LIMIT 3;	card_games
SELECT      (COUNT(CASE WHEN isTextless = 1 AND layout = 'normal' THEN 1 END) * 100.0 /       COUNT(CASE WHEN isTextless = 1 THEN 1 END)) AS proportion FROM cards;	card_games
SELECT number FROM cards WHERE side IS NULL AND subtypes LIKE '%Angel%' AND subtypes LIKE '%Wizard%';	card_games
SELECT name FROM sets WHERE mtgoCode IS NULL OR mtgoCode = '' ORDER BY name ASC LIMIT 3;	card_games
SELECT DISTINCT st.language  FROM set_translations st  JOIN sets s ON st.setCode = s.code  WHERE s.code = 'ARC'  AND s.mcmName = 'Archenemy';	card_games
SELECT sets.name, set_translations.translation  FROM sets  JOIN set_translations ON sets.code = set_translations.setcode  WHERE sets.id = 5;	card_games
SELECT s.type, st.language  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE s.id = 206;	card_games
SELECT s.id, s.code, s.name  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE s.block = 'Shadowmoor'  AND st.language = 'Italian'  GROUP BY s.id, s.code, s.name  ORDER BY s.name  LIMIT 2;	card_games
SELECT s.id AS set_id, s.code, s.name FROM sets s WHERE s.isForeignOnly = 0 AND s.isFoilOnly = 1 AND EXISTS (     SELECT 1     FROM set_translations st     WHERE st.setCode = s.code     AND st.language = 'Japanese' );	card_games
SELECT s.name  FROM sets s JOIN set_translations st ON s.code = st.setcode WHERE st.language = 'Russian' ORDER BY s.baseSetSize DESC LIMIT 1;	card_games
SELECT      (COUNT(DISTINCT CASE WHEN c.isOnlineOnly = 1 THEN c.uuid END) * 100.0 /       COUNT(DISTINCT c.uuid)) AS percentage FROM      cards c JOIN      foreign_data f ON c.uuid = f.uuid WHERE      f.language = 'Chinese Simplified';	card_games
SELECT COUNT(*)  FROM sets  WHERE EXISTS (SELECT 1 FROM set_translations                WHERE set_translations.setCode = sets.code                AND language = 'Japanese') AND (mtgoCode IS NULL OR mtgoCode = '');	card_games
SELECT id FROM cards WHERE borderColor = 'black'; SELECT COUNT(*) FROM cards WHERE borderColor = 'black';	card_games
SELECT COUNT(*) FROM cards WHERE frameEffects = 'extendedart'; SELECT id FROM cards WHERE frameEffects = 'extendedart';	card_games
SELECT * FROM cards WHERE borderColor = 'black' AND isFullArt = 1;	card_games
SELECT language FROM set_translations  JOIN sets ON set_translations.setCode = sets.code  WHERE sets.id = 174;	card_games
SELECT name FROM sets WHERE code = 'ALL';	card_games
SELECT DISTINCT fd.language  FROM foreign_data fd  JOIN cards c ON fd.uuid = c.uuid  WHERE c.name = 'A Pedra Fellwar'	card_games
SELECT code FROM sets WHERE releaseDate = '2007-07-13';	card_games
SELECT code, baseSetSize FROM sets WHERE block IN ('Masques', 'Mirage')	card_games
SELECT code FROM sets WHERE type = 'expansion';	card_games
SELECT fd.name AS foreign_name, c.type FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.watermark = 'Boros';	card_games
SELECT fd.language, fd.flavorText, c.type  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE c.watermark IS NOT NULL;	card_games
SELECT (COUNT(CASE WHEN c.convertedManaCost = 10 THEN 1 END) * 100.0 / COUNT(c.convertedManaCost)) AS percentage  FROM cards c  JOIN sets s ON c.setCode = s.code  WHERE s.name = 'Abyssal Horror'	card_games
SELECT code FROM sets WHERE type = 'commander';	card_games
SELECT fd.name, fd.type FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.watermark = 'Abzan' AND fd.language <> 'English';	card_games
SELECT DISTINCT fd.language, c.type FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.watermark = 'azorius';	card_games
SELECT COUNT(*)  FROM cards  WHERE artist = 'Aaron Miller'  AND cardKingdomFoilId IS NOT NULL  AND cardKingdomId IS NOT NULL	card_games
SELECT COUNT(*)  FROM cards  WHERE availability LIKE '%paper%'  AND hand = '3';	card_games
SELECT name FROM cards WHERE isTextless = 0;	card_games
SELECT convertedManaCost FROM cards WHERE name = 'Ancestor`s Chosen';	card_games
SELECT COUNT(*)  FROM cards  WHERE borderColor = 'white'  AND (power = '*' OR power IS NULL)	card_games
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL;	card_games
SELECT supertypes, subtypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer';	card_games
SELECT purchaseUrls FROM cards WHERE promoTypes = 'bundle';	card_games
SELECT COUNT(DISTINCT artist)  FROM cards  WHERE borderColor = 'black'  AND availability LIKE '%arena,mtgo%';	card_games
SELECT name, convertedManaCost FROM cards WHERE name IN ('Serra Angel', 'Shrine Keeper') ORDER BY convertedManaCost DESC LIMIT 1;	card_games
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer';	card_games
SELECT name  FROM cards  WHERE frameVersion = '2003'  ORDER BY convertedManaCost DESC  LIMIT 3;	card_games
SELECT translation  FROM set_translations  WHERE setCode = (SELECT setCode FROM cards WHERE name = 'Ancestor''s Chosen')  AND language = 'Italian';	card_games
SELECT COUNT(*)  FROM set_translations  WHERE setCode IN (     SELECT setCode      FROM cards      WHERE name = 'Angel of Mercy' );	card_games
SELECT name FROM cards WHERE setCode = (SELECT setCode FROM set_translations WHERE translation = 'Hauptset Zehnte Edition');	card_games
SELECT * FROM foreign_data  JOIN cards ON foreign_data.uuid = cards.uuid  WHERE cards.name = 'Ancestor''s Chosen'  AND foreign_data.language = 'Korean';	card_games
SELECT COUNT(*)  FROM cards  WHERE setCode = (SELECT setCode FROM set_translations WHERE translation = 'Hauptset Zehnte Edition')  AND artist = 'Adam Rex'	card_games
SELECT baseSetSize FROM sets WHERE code = (SELECT setCode FROM set_translations WHERE translation = 'Hauptset Zehnte Edition')	card_games
SELECT st.translation  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE s.name = 'Eighth Edition' AND st.language = 'Chinese Simplified';	card_games
SELECT EXISTS (     SELECT 1     FROM cards     JOIN sets ON cards.setCode = sets.code     WHERE cards.name = 'Angel of Mercy' AND sets.mtgoCode IS NOT NULL );	card_games
SELECT sets.releaseDate  FROM sets  JOIN cards ON sets.code = cards.setCode  WHERE cards.name = 'Ancestor''s Chosen';	card_games
SELECT sets.type  FROM sets  JOIN set_translations ON sets.code = set_translations.setCode  WHERE set_translations.translation = 'Hauptset Zehnte Edition';	card_games
SELECT COUNT(*)  FROM sets s WHERE s.block = 'Ice Age' AND EXISTS (     SELECT 1      FROM set_translations st     WHERE st.setCode = s.code     AND st.language = 'Italian'     AND st.translation IS NOT NULL );	card_games
SELECT s.isForeignOnly  FROM cards c  JOIN sets s ON c.setCode = s.code  WHERE c.name = 'Adarkar Valkyrie';	card_games
SELECT COUNT(DISTINCT s.id)  FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian'  AND st.translation IS NOT NULL  AND s.baseSetSize < 10;	card_games
SELECT COUNT(*)  FROM cards  WHERE setCode = (SELECT code FROM sets WHERE name = 'Coldsnap')  AND borderColor = 'black'	card_games
SELECT c.name  FROM cards c  JOIN sets s ON c.setCode = s.code  WHERE s.name = 'Coldsnap'  AND c.convertedManaCost = (     SELECT MAX(convertedManaCost)      FROM cards      WHERE setCode = s.code );	card_games
SELECT DISTINCT c.artist  FROM cards c  JOIN sets s ON c.setCode = s.code  WHERE s.name = 'Coldsnap'  AND c.artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy')	card_games
SELECT * FROM cards  JOIN sets ON cards.setCode = sets.code  WHERE sets.name = 'Coldsnap' AND cards.number = '4';	card_games
SELECT COUNT(*)  FROM cards  JOIN sets ON cards.setCode = sets.code  WHERE sets.name = 'Coldsnap'  AND cards.convertedManaCost > 5  AND (cards.power = '*' OR cards.power IS NULL)	card_games
SELECT fd.flavorText  FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.name = 'Ancestor''s Chosen'  AND fd.language = 'Italian';	card_games
SELECT DISTINCT fd.language  FROM foreign_data fd  JOIN cards c ON fd.uuid = c.uuid  WHERE c.name = 'Ancestor''s Chosen'  AND fd.flavorText IS NOT NULL;	card_games
SELECT fd.type  FROM foreign_data fd  JOIN cards c ON fd.uuid = c.uuid  WHERE c.name = 'Ancestor''s Chosen'  AND fd.language = 'German';	card_games
SELECT      f.text AS italian_text,     c.name AS card_name FROM      cards c JOIN      foreign_data f ON c.uuid = f.uuid  WHERE      c.setCode = (SELECT code FROM sets WHERE name = 'Coldsnap')      AND f.language = 'Italian';	card_games
SELECT foreign_data.name  FROM cards  JOIN foreign_data ON cards.uuid = foreign_data.uuid  WHERE cards.setCode = (SELECT code FROM sets WHERE name = 'Coldsnap') AND foreign_data.language = 'Italian' AND cards.convertedManaCost = (     SELECT MAX(convertedManaCost)      FROM cards      WHERE setCode = (SELECT code FROM sets WHERE name = 'Coldsnap') )	card_games
SELECT rulings.date  FROM rulings  JOIN cards ON rulings.uuid = cards.uuid  WHERE cards.name = 'Reminisce';	card_games
SELECT      (SUM(convertedManaCost = 7) / SUM(convertedManaCost)) * 100 AS percentage FROM cards JOIN sets ON cards.setCode = sets.code WHERE sets.name = 'Coldsnap';	card_games
SELECT      (COUNT(CASE WHEN cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM cards WHERE setCode = (SELECT code FROM sets WHERE name = 'Coldsnap');	card_games
SELECT code FROM sets WHERE releaseDate = '2017-07-14';	card_games
SELECT keyruneCode FROM sets WHERE code = 'PKHC';	card_games
SELECT mcmId FROM sets WHERE code = 'SS2';	card_games
SELECT mcmName FROM sets WHERE releaseDate = '2017-06-09'	card_games
SELECT type FROM sets WHERE name = 'From the Vault: Lore';	card_games
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized'	card_games
SELECT c.name, c.artist, r.text AS ruling_text, CASE WHEN c.hasContentWarning = 1 THEN 'Yes' ELSE 'No' END AS has_missing_degraded_properties FROM cards c LEFT JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Jim Pavelec'	card_games
SELECT s.releaseDate  FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Evacuation';	card_games
SELECT s.baseSetSize  FROM set_translations st  JOIN sets s ON st.setCode = s.code  WHERE st.translation = 'Rinascita di Alara'	card_games
SELECT sets.type  FROM sets  JOIN set_translations  ON sets.code = set_translations.setCode  WHERE set_translations.translation = 'Huitième édition'	card_games
SELECT st.translation  FROM set_translations st  JOIN cards c ON st.setCode = c.setCode  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE fd.name = 'Tendo Ice Bridge'  AND fd.language = 'French'  AND st.language = 'French';	card_games
SELECT COUNT(*)  FROM set_translations  WHERE setCode = (SELECT code FROM sets WHERE name = 'Tenth Edition')  AND translation IS NOT NULL;	card_games
SELECT translation  FROM set_translations  WHERE setCode = (SELECT setCode FROM cards WHERE name = 'Fellwar Stone')  AND language = 'Japanese';	card_games
SELECT name  FROM cards  WHERE setCode = (SELECT code FROM sets WHERE name = 'Journey into Nyx Hero''s Path')  ORDER BY convertedManaCost DESC  LIMIT 1;	card_games
SELECT s.releaseDate  FROM sets s  INNER JOIN set_translations st ON s.code = st.setCode  WHERE st.translation = 'Ola de frío';	card_games
SELECT sets.type  FROM cards  JOIN sets ON cards.setCode = sets.code  WHERE cards.name = 'Samite Pilgrim';	card_games
SELECT COUNT(*)  FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'World Championship Decks 2004'  AND c.convertedManaCost = 3;	card_games
SELECT st.translation  FROM set_translations st  JOIN sets s ON st.setCode = s.code  WHERE s.name = 'Mirrodin'  AND st.language = 'Chinese Simplified';	card_games
SELECT      (COUNT(CASE WHEN s.isNonFoilOnly = 1 THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM (     SELECT DISTINCT c.uuid, c.setCode     FROM cards c     JOIN foreign_data fd ON c.uuid = fd.uuid     WHERE fd.language = 'Japanese' ) AS qualified_cards JOIN sets s ON qualified_cards.setCode = s.code;	card_games
SELECT      (SUM(c.isOnlineOnly) * 100.0 / COUNT(*)) AS percentage FROM (     SELECT DISTINCT c.uuid, c.isOnlineOnly     FROM cards c     JOIN foreign_data fd ON c.uuid = fd.uuid     WHERE fd.language = 'Portuguese (Brazil)' ) AS subquery;	card_games
SELECT availability FROM cards WHERE artist = 'Aleksi Briclot' AND isTextless = 1;	card_games
SELECT id FROM sets ORDER BY baseSetSize DESC LIMIT 1;	card_games
SELECT artist  FROM cards  WHERE side IS NULL  AND convertedManaCost = (SELECT MAX(convertedManaCost) FROM cards WHERE side IS NULL);	card_games
SELECT frameEffects  FROM cards  WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL  GROUP BY frameEffects  ORDER BY COUNT(*) DESC  LIMIT 1;	card_games
SELECT COUNT(*)  FROM cards  WHERE (power IS NULL OR power = '*')  AND hasFoil = 0  AND duelDeck = 'a';	card_games
SELECT id FROM sets WHERE type = 'Commander' ORDER BY totalSetSize DESC LIMIT 1;	card_games
SELECT cards.name, cards.convertedManaCost  FROM cards  JOIN legalities ON cards.uuid = legalities.uuid  WHERE legalities.format = 'duel' AND legalities.status = 'Legal'  ORDER BY cards.convertedManaCost DESC  LIMIT 10;	card_games
SELECT      (SELECT MIN(originalReleaseDate) FROM cards WHERE rarity = 'mythic') AS release_date,     l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.originalReleaseDate = (SELECT MIN(originalReleaseDate) FROM cards WHERE rarity = 'mythic') AND c.rarity = 'mythic' AND l.status = 'Legal';	card_games
SELECT COUNT(*)  FROM cards c WHERE c.artist = 'Volkan Baǵa' AND EXISTS (     SELECT 1      FROM foreign_data f      WHERE f.uuid = c.uuid      AND f.language = 'French' );	card_games
SELECT COUNT(*)  FROM cards c WHERE c.name = 'Abundance' AND c.types = 'Enchantment' AND c.rarity = 'rare' AND NOT EXISTS (     SELECT 1      FROM legalities l      WHERE l.uuid = c.uuid      AND l.status <> 'Legal' );	card_games
SELECT l.format, c.name FROM legalities l JOIN cards c ON l.uuid = c.uuid WHERE l.status = 'Banned' AND l.format IN (     SELECT format     FROM (         SELECT format, RANK() OVER (ORDER BY COUNT(*) DESC) AS rnk         FROM legalities         WHERE status = 'Banned'         GROUP BY format     ) ranked     WHERE rnk = 1 );	card_games
SELECT st.language  FROM set_translations st  JOIN sets s ON st.setCode = s.code  WHERE s.name = 'Battlebond';	card_games
SELECT DISTINCT l.format FROM legalities l JOIN cards c ON l.uuid = c.uuid WHERE c.artist IN (     SELECT artist     FROM cards     WHERE artist IS NOT NULL     GROUP BY artist     HAVING COUNT(*) = (         SELECT MIN(cnt)          FROM (             SELECT COUNT(*) AS cnt              FROM cards              GROUP BY artist         )     ) );	card_games
SELECT legalities.status FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.frameVersion = '1997' AND cards.artist = 'D. Alexander Gregory' AND cards.hasContentWarning = 1 AND legalities.format = 'legacy';	card_games
SELECT c.name, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.edhrecRank = 1 AND l.status = 'Banned'	card_games
SELECT      (SELECT AVG(cnt) FROM (         SELECT COUNT(*) AS cnt         FROM sets         WHERE releaseDate BETWEEN '2012-01-01' AND '2015-12-31'         GROUP BY strftime('%Y', releaseDate)     )) AS annual_average,     (SELECT language       FROM foreign_data      GROUP BY language      ORDER BY COUNT(*) DESC      LIMIT 1) AS common_language	card_games
SELECT DISTINCT artist  FROM cards  WHERE borderColor = 'black'  AND availability = 'arena';	card_games
SELECT uuid FROM legalities WHERE format = 'oldschool' AND status IN ('banned', 'restricted');	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability = 'paper'	card_games
SELECT text, date FROM rulings JOIN cards ON rulings.uuid = cards.uuid WHERE artist = 'Kev Walker' ORDER BY date DESC;	card_games
SELECT cards.name, legalities.format FROM cards JOIN sets ON cards.setCode = sets.code JOIN legalities ON cards.uuid = legalities.uuid WHERE sets.name = 'Hour of Devastation' AND legalities.status = 'Legal'	card_games
SELECT s.name  FROM sets s  WHERE EXISTS (     SELECT 1      FROM set_translations st      WHERE st.setCode = s.code      AND st.language = 'Korean' )  AND NOT EXISTS (     SELECT 1      FROM set_translations st      WHERE st.setCode = s.code      AND st.language LIKE '%Japanese%' );	card_games
SELECT      c.frameVersion,     c.name,     CASE WHEN EXISTS (         SELECT 1          FROM legalities l          WHERE l.uuid = c.uuid          AND l.status = 'Banned'     ) THEN 'Banned' ELSE 'Not Banned' END AS banned_status FROM      cards c WHERE      c.artist = 'Allen Williams';	card_games
SELECT DisplayName  FROM users  WHERE DisplayName IN ('Harlan', 'Jarrod Dixon')  ORDER BY Reputation DESC  LIMIT 1;	codebase_community
SELECT DisplayName FROM users WHERE YEAR(CreationDate) = 2011;	codebase_community
SELECT COUNT(*) FROM users WHERE LastAccessDate > '2014-09-01'	codebase_community
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM users  WHERE UpVotes > 100 AND DownVotes > 1;	codebase_community
SELECT COUNT(*)  FROM users  WHERE Views > 10  AND YEAR(CreationDate) > 2013;	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')	codebase_community
SELECT p.Title  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT users.DisplayName  FROM users  JOIN posts ON users.Id = posts.OwnerUserId  WHERE posts.Title = 'Eliciting priors from experts'	codebase_community
SELECT Title  FROM posts  WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')  ORDER BY ViewCount DESC  LIMIT 1;	codebase_community
SELECT u.DisplayName  FROM users u  JOIN posts p ON u.Id = p.OwnerUserId  WHERE p.FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts);	codebase_community
SELECT SUM(p.CommentCount)  FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie'	codebase_community
SELECT MAX(p.AnswerCount)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.DisplayName = 'csgillespie'	codebase_community
SELECT DisplayName  FROM users  WHERE Id = (     SELECT LastEditorUserId      FROM posts      WHERE Title = 'Examples for teaching: Correlation does not mean causation' );	codebase_community
SELECT COUNT(*)  FROM posts  WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')  AND ParentId IS NULL;	codebase_community
SELECT DISTINCT u.DisplayName  FROM users u  JOIN posts p ON u.Id = p.OwnerUserId  WHERE p.ClosedDate IS NOT NULL;	codebase_community
SELECT COUNT(*)  FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.Age > 65  AND p.Score >= 20;	codebase_community
SELECT users.Location  FROM posts  JOIN users ON posts.OwnerUserId = users.Id  WHERE posts.Title = 'Eliciting priors from experts'	codebase_community
SELECT Body  FROM posts  JOIN tags ON posts.Id = tags.ExcerptPostId  WHERE tags.TagName = 'bayesian';	codebase_community
SELECT p.Body  FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.Count = (SELECT MAX(Count) FROM tags)	codebase_community
SELECT COUNT(b.Id)  FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie'	codebase_community
SELECT b.Name  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT COUNT(*)  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE users.DisplayName = 'csgillespie'  AND YEAR(badges.Date) = 2011;	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId GROUP BY u.Id, u.DisplayName HAVING COUNT(b.Id) = (     SELECT MAX(sub.badge_count)     FROM (         SELECT COUNT(*) AS badge_count         FROM badges         GROUP BY UserId     ) AS sub );	codebase_community
SELECT AVG(posts.Score)  FROM users  JOIN posts ON users.Id = posts.OwnerUserId  WHERE users.DisplayName = 'csgillespie'	codebase_community
SELECT COUNT(b.Id) * 1.0 / COUNT(DISTINCT u.Id) AS average_badges FROM users u LEFT JOIN badges b ON u.Id = b.UserId WHERE u.Views > 200;	codebase_community
SELECT      (COUNT(CASE WHEN u.Age > 65 THEN p.Id END) * 100.0 / COUNT(p.Id)) AS percentage FROM posts p LEFT JOIN users u ON p.OwnerUserId = u.Id WHERE p.Score > 5;	codebase_community
SELECT COUNT(*) FROM votes WHERE UserId = 58 AND CreationDate = '2010-07-19'	codebase_community
SELECT CreationDate  FROM votes  GROUP BY CreationDate  HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM votes GROUP BY CreationDate) AS sub);	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = 'Revival'	codebase_community
SELECT p.Title  FROM posts p  JOIN comments c ON p.Id = c.PostId  WHERE c.Score = (SELECT MAX(Score) FROM comments)	codebase_community
SELECT COUNT(*) FROM comments WHERE PostId = (SELECT Id FROM posts WHERE ViewCount = 1910);	codebase_community
SELECT p.FavoriteCount  FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.UserId = 3025  AND c.CreationDate = '2014-04-23 20:29:39.0'	codebase_community
SELECT c.Text  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE p.ParentId = 107829 AND p.CommentCount = 1;	codebase_community
SELECT CASE WHEN p.ClosedDate IS NOT NULL THEN 'Yes' ELSE 'No' END  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE c.UserId = 23853 AND c.CreationDate = '2013-07-12 09:08:18.0'	codebase_community
SELECT u.Reputation  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE p.Id = 65041;	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Tiago Pasqualini')	codebase_community
SELECT DisplayName FROM users JOIN votes ON users.Id = votes.UserId WHERE votes.Id = 6347;	codebase_community
SELECT COUNT(*) FROM votes  WHERE PostId = (SELECT Id FROM posts WHERE Title LIKE '%data visualization%');	codebase_community
SELECT b.Name  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.DisplayName = 'DatEpicCoderGuyWhoPrograms'	codebase_community
SELECT (SELECT COUNT(p.Id) FROM posts p WHERE p.OwnerUserId = 24) / (SELECT COUNT(v.Id) FROM votes v WHERE v.UserId = 24);	codebase_community
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer';	codebase_community
SELECT Text FROM comments WHERE Score = 17;	codebase_community
SELECT DisplayName  FROM users  WHERE WebsiteUrl = 'http://stackoverflow.com'	codebase_community
SELECT b.Name  FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'SilentGhost';	codebase_community
SELECT u.DisplayName  FROM comments c  JOIN users u ON c.UserId = u.Id  WHERE c.Text = 'thank you user93!'	codebase_community
SELECT c.Text  FROM comments c  JOIN users u ON c.UserId = u.Id  WHERE u.DisplayName = 'A Lion'	codebase_community
SELECT users.DisplayName, users.Reputation  FROM posts  JOIN users ON posts.OwnerUserId = users.Id  WHERE posts.Title = 'Understanding what Dassault iSight is doing?';	codebase_community
SELECT Text  FROM comments  WHERE PostId = (SELECT Id FROM posts WHERE Title = 'How does gentle boosting differ from AdaBoost?');	codebase_community
SELECT DISTINCT u.DisplayName  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE b.Name = 'Necromancer'  LIMIT 10;	codebase_community
SELECT users.DisplayName  FROM posts  JOIN users ON posts.LastEditorUserId = users.Id  WHERE posts.Title = 'Open source tools for visualizing multi-dimensional data?';	codebase_community
SELECT p.Title  FROM posts p  JOIN users u ON p.LastEditorUserId = u.Id  WHERE u.DisplayName = 'Vebjorn Ljosa'	codebase_community
SELECT SUM(p.Score) AS TotalScore, u.WebsiteUrl FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Yevgeny';	codebase_community
SELECT c.*  FROM comments c WHERE c.UserId IN (     SELECT DISTINCT ph.UserId      FROM postHistory ph      JOIN posts p ON ph.PostId = p.Id      WHERE p.Title = 'Why square the difference instead of taking the absolute value in standard deviation?' );	codebase_community
SELECT SUM(BountyAmount)  FROM votes  JOIN posts ON votes.PostId = posts.Id  WHERE posts.Title LIKE '%data%'  AND BountyAmount IS NOT NULL;	codebase_community
SELECT u.DisplayName  FROM users u  JOIN votes v ON u.Id = v.UserId  JOIN posts p ON v.PostId = p.Id  WHERE v.BountyAmount = 50  AND p.Title LIKE '%variance%'	codebase_community
SELECT p.Title, c.Text, (SELECT AVG(p2.ViewCount) FROM posts p2 WHERE p2.Tags LIKE '%<humor>%') AS AverageViewCount FROM posts p LEFT JOIN comments c ON p.Id = c.PostId WHERE p.Tags LIKE '%<humor>%';	codebase_community
SELECT COUNT(*) FROM comments WHERE UserId = 13;	codebase_community
SELECT Id FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users)	codebase_community
SELECT Id FROM users ORDER BY Views LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Supporter' AND YEAR(Date) = 2011;	codebase_community
SELECT COUNT(*) FROM (SELECT UserId FROM badges GROUP BY UserId HAVING COUNT(Name) >5) AS sub;	codebase_community
SELECT COUNT(u.Id)  FROM users u  WHERE u.Location = 'New York'  AND EXISTS (SELECT 1 FROM badges WHERE UserId = u.Id AND Name = 'Teacher')  AND EXISTS (SELECT 1 FROM badges WHERE UserId = u.Id AND Name = 'Supporter');	codebase_community
SELECT users.DisplayName, users.Reputation FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE posts.Id = 1;	codebase_community
SELECT p.OwnerUserId AS UserId FROM posts p  LEFT JOIN (     SELECT PostId, COUNT(*) AS hist_count      FROM postHistory      GROUP BY PostId ) AS ph_counts  ON p.Id = ph_counts.PostId  WHERE p.ViewCount >=1000  GROUP BY p.OwnerUserId  HAVING      SUM(         CASE WHEN ph_counts.hist_count = 1 THEN 1               ELSE 0          END     ) = COUNT(p.Id)	codebase_community
SELECT b.Name AS Badge FROM badges b JOIN (     SELECT UserId     FROM comments     GROUP BY UserId     HAVING COUNT(*) = (         SELECT MAX(comment_count)         FROM (             SELECT COUNT(*) AS comment_count             FROM comments             GROUP BY UserId         ) AS sub     ) ) AS top_users ON b.UserId = top_users.UserId;	codebase_community
SELECT COUNT(DISTINCT u.Id)  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE u.Location = 'India' AND b.Name = 'Teacher'	codebase_community
SELECT      ((cnt_2010 / total * 100) - (cnt_2011 / total * 100)) AS percentage_difference FROM (     SELECT         COUNT(CASE WHEN YEAR(Date) = 2010 THEN 1 END) AS cnt_2010,         COUNT(CASE WHEN YEAR(Date) = 2011 THEN 1 END) AS cnt_2011,         COUNT(*) AS total     FROM badges     WHERE Name = 'Student' ) AS sub;	codebase_community
SELECT      (SELECT GROUP_CONCAT(PostHistoryTypeId) FROM postHistory WHERE PostId = 3720) AS PostHistoryTypeIDs,     (SELECT COUNT(DISTINCT UserId) FROM comments WHERE PostId = 3720) AS UniqueCommenters;	codebase_community
SELECT p.Id, p.ViewCount FROM posts p WHERE p.Id IN (     SELECT RelatedPostId FROM postLinks WHERE PostId = 61217     UNION     SELECT PostId FROM postLinks WHERE RelatedPostId = 61217 );	codebase_community
SELECT p.Score, pl.LinkTypeId  FROM posts p JOIN postLinks pl ON p.Id = pl.PostId  WHERE p.Id = 395;	codebase_community
SELECT posts.PostId, posts.OwnerUserId  FROM posts  WHERE posts.Score > 60	codebase_community
SELECT SUM(FavoriteCount) FROM posts WHERE OwnerUserId = 686 AND YEAR(CreaionDate) = 2011;	codebase_community
SELECT      (SUM(u.UpVotes) / COUNT(u.Id)) AS avg_upvotes,     (SUM(u.Age) / COUNT(u.Id)) AS avg_age FROM users u JOIN (     SELECT OwnerUserId     FROM posts     GROUP BY OwnerUserId     HAVING COUNT(*) > 10 ) AS qualified ON u.Id = qualified.OwnerUserId;	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Announcer'	codebase_community
SELECT Name FROM badges WHERE Date = '2010-07-19 19:39:08.0'	codebase_community
SELECT COUNT(*) FROM comments WHERE Score > 60;	codebase_community
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:25:47.0'	codebase_community
SELECT COUNT(Id) FROM posts WHERE Score = 10;	codebase_community
SELECT b.Name  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.Reputation = (SELECT MAX(Reputation) FROM users)	codebase_community
SELECT users.Reputation  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE badges.Date = '2010-07-19 19:39:08.0'	codebase_community
SELECT b.Name  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.DisplayName = 'Pierre'	codebase_community
SELECT badges.Date FROM badges JOIN users ON badges.UserId = users.Id WHERE users.Location = 'Rochester, NY'	codebase_community
SELECT      (SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Teacher') * 100.0 /      (SELECT COUNT(*) FROM users) AS percentage	codebase_community
SELECT      (COUNT(CASE WHEN u.Age BETWEEN 13 AND 18 THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Organizer'	codebase_community
SELECT c.Score  FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.CreaionDate = '2010-07-19 19:19:56.0'	codebase_community
SELECT c.Text  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE p.CreaionDate = '2010-07-19 19:37:33.0'	codebase_community
SELECT users.Age  FROM users  INNER JOIN badges ON users.Id = badges.UserId  WHERE users.Location = 'Vienna, Austria'	codebase_community
SELECT COUNT(DISTINCT b.UserId)  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE b.Name = 'Supporter'  AND u.Age BETWEEN 19 AND 65;	codebase_community
SELECT SUM(u.Views)  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE b.Date = '2010-07-19 19:39:08.0'	codebase_community
SELECT Name FROM badges WHERE UserId IN (SELECT Id FROM users WHERE Reputation = (SELECT MIN(Reputation) FROM users))	codebase_community
SELECT Name FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Sharpie')	codebase_community
SELECT COUNT(DISTINCT b.UserId)  FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age > 65;	codebase_community
SELECT DisplayName FROM users WHERE Id = 30;	codebase_community
SELECT COUNT(*)  FROM users  WHERE Location = 'New York'	codebase_community
SELECT COUNT(*) FROM votes WHERE YEAR(CreationDate) = 2010;	codebase_community
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT DisplayName  FROM users  WHERE Views = (SELECT MAX(Views) FROM users)	codebase_community
SELECT (SELECT COUNT(*) FROM votes WHERE YEAR(CreationDate) = 2010) / (SELECT COUNT(*) FROM votes WHERE YEAR(CreationDate) = 2011)	codebase_community
SELECT DISTINCT t.TagName  FROM tags t  JOIN posts p ON p.Tags LIKE '%' || '<' || t.TagName || '>' || '%'  WHERE p.OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'John Salvatier');	codebase_community
SELECT COUNT(p.Id)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.DisplayName = 'Daniel Vassallo'	codebase_community
SELECT COUNT(*)  FROM Votes  WHERE UserId = (SELECT Id FROM Users WHERE DisplayName = 'Harlan');	codebase_community
SELECT posts.Id FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'slashnick' ORDER BY posts.AnswerCount DESC LIMIT 1;	codebase_community
SELECT p.Id, p.ViewCount, u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName IN ('Harvey Motulsky', 'Noah Snyder') ORDER BY p.ViewCount DESC LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM posts  WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Matt Parker')  AND Id >4;	codebase_community
SELECT COUNT(*)  FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Neil McGuigan' AND c.Score < 60;	codebase_community
SELECT p.Tags  FROM posts p  WHERE p.OwnerUserId = (SELECT u.Id FROM users u WHERE u.DisplayName = 'Mark Meckes')  AND p.CommentCount = 0;	codebase_community
SELECT u.DisplayName  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE b.Name = 'Organizer';	codebase_community
SELECT (COUNT(CASE WHEN Tags LIKE '%<r>%' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM posts WHERE OwnerDisplayName = 'Community';	codebase_community
SELECT      (SUM(CASE WHEN u.DisplayName = 'Mornington' THEN p.ViewCount ELSE 0 END)      - SUM(CASE WHEN u.DisplayName = 'Amos' THEN p.ViewCount ELSE 0 END))  FROM posts p JOIN users u ON p.OwnerUserId = u.Id;	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Commentator' AND YEAR(Date) = 2014;	codebase_community
SELECT COUNT(*) FROM posts WHERE CreaionDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59'	codebase_community
SELECT DisplayName, Age  FROM users  WHERE Views = (SELECT MAX(Views) FROM users)	codebase_community
SELECT LastEditDate, LastEditorUserId FROM posts WHERE Title = 'Detecting a given face in a database of facial images'	codebase_community
SELECT COUNT(*) FROM comments WHERE UserId = 13 AND Score < 60;	codebase_community
SELECT posts.Title, comments.UserDisplayName FROM comments JOIN posts ON comments.PostId = posts.Id WHERE comments.Score > 60;	codebase_community
SELECT b.Name  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.Location = 'North Pole'  AND YEAR(b.Date) = 2011;	codebase_community
SELECT DISTINCT u.DisplayName, u.WebsiteUrl  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE p.FavoriteCount > 150;	codebase_community
SELECT COUNT(ph.Id) AS PostHistoryCount, MAX(ph.CreationDate) AS LastEditDate FROM posts p LEFT JOIN postHistory ph ON p.Id = ph.PostId WHERE p.Title = 'What is the best introductory Bayesian statistics textbook?';	codebase_community
SELECT u.LastAccessDate, u.Location  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE b.Name = 'Outliers'	codebase_community
SELECT p2.Title  FROM posts p1  JOIN postLinks pl ON p1.Id = pl.PostId  JOIN posts p2 ON pl.RelatedPostId = p2.Id  WHERE p1.Title = 'How to tell if something happened in a data set which monitors a value over time'	codebase_community
SELECT p.PostId, NULL AS Name FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Samuel' AND YEAR(p.CreaionDate) = 2013 UNION ALL SELECT NULL, b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Samuel' AND YEAR(b.Date) = 2013	codebase_community
SELECT DisplayName  FROM users  WHERE Id = (     SELECT OwnerUserId      FROM posts      ORDER BY ViewCount DESC      LIMIT 1 );	codebase_community
SELECT u.DisplayName, u.Location  FROM tags t  JOIN posts p ON t.ExcerptPostId = p.Id  JOIN users u ON p.OwnerUserId = u.Id  WHERE t.TagName = 'hypothesis-testing'	codebase_community
SELECT pl.LinkTypeId, p.Title FROM postLinks pl JOIN posts p ON      p.Id = CASE          WHEN pl.PostId = (SELECT Id FROM posts WHERE Title = 'What are principal component scores?')          THEN pl.RelatedPostId          ELSE pl.PostId      END WHERE      pl.PostId = (SELECT Id FROM posts WHERE Title = 'What are principal component scores?')      OR      pl.RelatedPostId = (SELECT Id FROM posts WHERE Title = 'What are principal component scores?');	codebase_community
SELECT u.DisplayName  FROM users u  JOIN posts p ON u.Id = p.OwnerUserId  JOIN posts c ON p.Id = c.ParentId  WHERE c.Score = (SELECT MAX(Score) FROM posts WHERE ParentId IS NOT NULL);	codebase_community
SELECT u.DisplayName, u.WebsiteUrl  FROM votes v  JOIN users u ON v.UserId = u.Id  WHERE v.VoteTypeId = 8  AND v.BountyAmount = (SELECT MAX(BountyAmount) FROM votes WHERE VoteTypeId = 8);	codebase_community
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5;	codebase_community
SELECT COUNT(*) FROM tags WHERE `Count` BETWEEN 5000 AND 7000;	codebase_community
SELECT OwnerUserId FROM posts ORDER BY FavoriteCount DESC LIMIT 1;	codebase_community
SELECT Age FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users)	codebase_community
SELECT COUNT(DISTINCT p.Id)  FROM posts p  JOIN votes v ON p.Id = v.PostId  WHERE YEAR(p.CreaionDate) = 2011  AND v.BountyAmount = 50;	codebase_community
SELECT Id FROM users WHERE Age = (SELECT MIN(Age) FROM users);	codebase_community
SELECT SUM(Score) FROM posts WHERE LasActivityDate LIKE '2010-07-19%';	codebase_community
SELECT COUNT(pl.Id) / 12 FROM postLinks pl JOIN posts p ON pl.PostId = p.Id WHERE YEAR(pl.CreationDate) = 2010 AND p.AnswerCount <= 2;	codebase_community
SELECT posts.Id FROM posts INNER JOIN votes ON posts.Id = votes.PostId WHERE votes.UserId = 1465 ORDER BY posts.FavoriteCount DESC LIMIT 1;	codebase_community
SELECT Title FROM posts WHERE Id = (SELECT PostId FROM postLinks WHERE CreationDate = (SELECT MIN(CreationDate) FROM postLinks));	codebase_community
SELECT u.DisplayName  FROM users u  JOIN badges b ON u.Id = b.UserId  GROUP BY u.Id, u.DisplayName  HAVING COUNT(b.Id) = (     SELECT MAX(c)      FROM (         SELECT COUNT(*) AS c          FROM badges          GROUP BY UserId     ) sub );	codebase_community
SELECT MIN(v.CreationDate)  FROM votes v  JOIN users u ON v.UserId = u.Id  WHERE u.DisplayName = 'chl'	codebase_community
SELECT MIN(p.CreaionDate)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.Age = (SELECT MIN(Age) FROM users)	codebase_community
SELECT u.DisplayName  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE b.Name = 'Autobiographer'  ORDER BY b.Date ASC, b.Id ASC  LIMIT 1	codebase_community
SELECT COUNT(*)  FROM users  WHERE Location = 'United Kingdom'  AND Id IN (     SELECT OwnerUserId      FROM posts      GROUP BY OwnerUserId      HAVING SUM(COALESCE(FavoriteCount, 0)) >=4 );	codebase_community
SELECT AVG(v.PostId)  FROM votes v  JOIN users u ON v.UserId = u.Id  WHERE u.Age = (SELECT MAX(Age) FROM users)	codebase_community
SELECT DisplayName  FROM users  WHERE Reputation = (SELECT MAX(Reputation) FROM users)	codebase_community
SELECT COUNT(*)  FROM users  WHERE Reputation > 2000 AND Views > 1000;	codebase_community
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT COUNT(*)  FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Jay Stevens'  AND YEAR(p.CreaionDate) = 2010	codebase_community
SELECT posts.Id, posts.Title  FROM posts  INNER JOIN users ON posts.OwnerUserId = users.Id  WHERE users.DisplayName = 'Harvey Motulsky'  ORDER BY posts.ViewCount DESC  LIMIT 1;	codebase_community
SELECT Id, Title FROM posts WHERE Score = (SELECT MAX(Score) FROM posts)	codebase_community
SELECT AVG(p.Score)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.DisplayName = 'Stephen Turner';	codebase_community
SELECT DISTINCT u.DisplayName  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE p.ViewCount > 20000  AND YEAR(p.CreaionDate) = 2011;	codebase_community
SELECT p.Id, u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE YEAR(p.CreationDate) = 2010 ORDER BY p.FavoriteCount DESC LIMIT 1;	codebase_community
SELECT (COUNT(CASE WHEN u.Reputation > 1000 THEN 1 END) * 100.0 / COUNT(p.Id)) FROM posts p LEFT JOIN users u ON p.OwnerUserId = u.Id WHERE YEAR(p.CreaionDate) = 2011;	codebase_community
SELECT (COUNT(CASE WHEN Age BETWEEN 13 AND 18 THEN Id END) * 100.0 / COUNT(Id)) AS percentage FROM users;	codebase_community
SELECT p.ViewCount AS TotalViews, u.DisplayName  FROM posts p  JOIN users u ON u.Id = COALESCE(p.LastEditorUserId, p.OwnerUserId)  WHERE p.Text = 'Computer Game Datasets';	codebase_community
SELECT COUNT(*)  FROM posts  WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts);	codebase_community
SELECT COUNT(*)  FROM comments  WHERE PostId IN (     SELECT Id      FROM posts      WHERE Score = (SELECT MAX(Score) FROM posts) );	codebase_community
SELECT COUNT(*)  FROM posts  WHERE ViewCount > 35000  AND CommentCount = 0;	codebase_community
SELECT u.DisplayName, u.Location FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE p.Id = 183;	codebase_community
SELECT Name  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE users.DisplayName = 'Emmett'  ORDER BY Date DESC  LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM users  WHERE Age BETWEEN 19 AND 65  AND UpVotes > 5000;	codebase_community
SELECT DATEDIFF(b.Date, u.CreationDate)  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE u.DisplayName = 'Zolomon'  ORDER BY b.Date  LIMIT 1;	codebase_community
SELECT      (SELECT COUNT(*) FROM posts WHERE OwnerUserId IN (SELECT Id FROM users WHERE CreationDate = (SELECT MAX(CreationDate) FROM users))) AS Posts,     (SELECT COUNT(*) FROM comments WHERE UserId IN (SELECT Id FROM users WHERE CreationDate = (SELECT MAX(CreationDate) FROM users))) AS Comments;	codebase_community
SELECT c.Text, c.UserDisplayName FROM comments c WHERE c.PostId = (SELECT p.Id FROM posts p WHERE p.Title = 'Analysing wind data with R') ORDER BY c.CreationDate DESC LIMIT 10;	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Citizen Patrol';	codebase_community
SELECT COUNT(*) FROM posts WHERE Tags LIKE '%careers%'	codebase_community
SELECT Reputation, Views FROM users WHERE DisplayName = 'Jarrod Dixon';	codebase_community
SELECT      (SELECT COUNT(*) FROM comments WHERE PostId = p.Id AND UserId IS NOT NULL) AS CommentCount,     (SELECT COUNT(*) FROM posts WHERE ParentId = p.Id AND PostTypeId = 2 AND OwnerUserId IS NOT NULL) AS AnswerCount FROM posts p WHERE p.Title = 'Clustering 1D data'	codebase_community
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat';	codebase_community
SELECT COUNT(DISTINCT PostId) FROM votes WHERE BountyAmount >= 30;	codebase_community
SELECT      (COUNT(CASE WHEN p.Score > 50 THEN 1 END) * 100.0 / COUNT(p.Id)) AS percentage FROM posts p WHERE p.OwnerUserId = (SELECT Id FROM users ORDER BY Reputation DESC LIMIT 1)	codebase_community
SELECT COUNT(*)  FROM posts  WHERE Score < 20;	codebase_community
SELECT COUNT(*) FROM tags WHERE Id < 15 AND `Count` <= 20;	codebase_community
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample'	codebase_community
SELECT users.Reputation, users.UpVotes  FROM users  JOIN comments ON users.Id = comments.UserId  WHERE comments.Text = 'fine, you win :)';	codebase_community
SELECT c.Text  FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title LIKE '%linear regression%';	codebase_community
SELECT c.Text  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE p.ViewCount BETWEEN 100 AND 150  ORDER BY c.Score DESC  LIMIT 1;	codebase_community
SELECT u.CreationDate, u.Age  FROM users u  JOIN comments c ON u.Id = c.UserId  WHERE c.Text LIKE '%http://%'	codebase_community
SELECT COUNT(DISTINCT p.Id)  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE c.Score = 0 AND p.ViewCount < 5;	codebase_community
SELECT COUNT(*)  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE p.CommentCount = 1 AND c.Score = 0;	codebase_community
SELECT COUNT(DISTINCT u.Id)  FROM users u  JOIN comments c ON u.Id = c.UserId  WHERE c.Score = 0 AND u.Age = 40	codebase_community
SELECT p.Id AS PostID, c.Text AS Comment  FROM posts p  JOIN comments c ON p.Id = c.PostId  WHERE p.Title = 'Group differences on a five point Likert item'	codebase_community
SELECT COUNT(*)  FROM votes v JOIN posts p ON v.PostId = p.Id WHERE p.OwnerUserId = (SELECT UserId FROM comments WHERE Text = 'R is also lazy evaluated.')  AND v.VoteTypeId = 2;	codebase_community
SELECT c.Text  FROM comments c  JOIN users u ON c.UserId = u.Id  WHERE u.DisplayName = 'Harvey Motulsky'	codebase_community
SELECT DISTINCT u.DisplayName  FROM comments c  JOIN users u ON c.UserId = u.Id  WHERE c.Score BETWEEN 1 AND 5  AND u.DownVotes = 0;	codebase_community
SELECT (COUNT(CASE WHEN u.UpVotes = 0 THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score BETWEEN 5 AND 10;	codebase_community
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id JOIN superhero s ON hp.hero_id = s.id WHERE s.superhero_name = '3-D Man'	superhero
SELECT COUNT(DISTINCT hp.hero_id)  FROM hero_power hp  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'Super Strength'	superhero
SELECT COUNT(*)  FROM superhero h JOIN hero_power hp ON h.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Super Strength'  AND h.height_cm > 200;	superhero
SELECT superhero.full_name FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id GROUP BY superhero.id, superhero.full_name HAVING COUNT(superhero.full_name) > 15;	superhero
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE colour.colour = 'Blue';	superhero
SELECT colour.colour FROM superhero JOIN colour ON superhero.skin_colour_id = colour.id WHERE superhero.superhero_name = 'Apocalypse';	superhero
SELECT COUNT(DISTINCT s.id)  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id AND c.colour = 'Blue'  JOIN hero_power hp ON hp.hero_id = s.id  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'Agility';	superhero
SELECT superhero_name  FROM superhero  JOIN colour AS eye_color ON superhero.eye_colour_id = eye_color.id  JOIN colour AS hair_color ON superhero.hair_colour_id = hair_color.id  WHERE eye_color.colour = 'Blue'  AND hair_color.colour = 'Blond';	superhero
SELECT COUNT(*)  FROM superhero s  JOIN publisher p ON s.publisher_id = p.id  WHERE p.publisher_name = 'Marvel Comics'	superhero
SELECT superhero_name AS name,         height_cm,        RANK() OVER (ORDER BY height_cm DESC) AS rank FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics' ORDER BY height_cm DESC;	superhero
SELECT p.publisher_name  FROM publisher p  JOIN superhero s ON p.id = s.publisher_id  WHERE s.superhero_name = 'Sauron'	superhero
SELECT c.colour, COUNT(s.id) AS popularity  FROM superhero s  JOIN publisher p ON s.publisher_id = p.id  JOIN colour c ON s.eye_colour_id = c.id  WHERE p.publisher_name = 'Marvel Comics'  GROUP BY c.colour  ORDER BY popularity DESC;	superhero
SELECT AVG(height_cm)  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE publisher.publisher_name = 'Marvel Comics'	superhero
SELECT superhero.superhero_name FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE publisher.publisher_name = 'Marvel Comics' AND superpower.power_name = 'Super Strength';	superhero
SELECT COUNT(*) FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE publisher.publisher_name = 'DC Comics';	superhero
SELECT publisher.publisher_name  FROM publisher  JOIN superhero ON publisher.id = superhero.publisher_id  JOIN hero_attribute ON superhero.id = hero_attribute.hero_id  WHERE hero_attribute.attribute_id = 3  AND hero_attribute.attribute_value = (     SELECT MIN(attribute_value)      FROM hero_attribute      WHERE attribute_id = 3 );	superhero
SELECT COUNT(*)  FROM superhero h JOIN publisher p ON h.publisher_id = p.id JOIN colour c ON h.eye_colour_id = c.id WHERE p.publisher_name = 'Marvel Comics'  AND c.colour = 'Gold';	superhero
SELECT publisher.publisher_name FROM publisher JOIN superhero ON publisher.id = superhero.publisher_id WHERE superhero.superhero_name = 'Blue Beetle II';	superhero
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.hair_colour_id = colour.id  WHERE colour.colour = 'Blond'	superhero
SELECT superhero.superhero_name  FROM superhero  JOIN hero_attribute ON superhero.id = hero_attribute.hero_id  WHERE hero_attribute.attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Intelligence')  ORDER BY hero_attribute.attribute_value ASC  LIMIT 1;	superhero
SELECT race.race  FROM superhero  JOIN race ON superhero.race_id = race.id  WHERE superhero.superhero_name = 'Copycat';	superhero
SELECT superhero.superhero_name  FROM superhero  JOIN hero_attribute ON superhero.id = hero_attribute.hero_id  JOIN attribute ON hero_attribute.attribute_id = attribute.id  WHERE attribute.attribute_name = 'Durability'  AND hero_attribute.attribute_value < 50;	superhero
SELECT superhero.superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Death Touch'	superhero
SELECT COUNT(DISTINCT s.id)  FROM superhero s  JOIN gender g ON s.gender_id = g.id  JOIN hero_attribute ha ON s.id = ha.hero_id  JOIN attribute a ON ha.attribute_id = a.id  WHERE g.gender = 'Female'  AND a.attribute_name = 'Strength'  AND ha.attribute_value = 100;	superhero
SELECT superhero.superhero_name FROM superhero LEFT JOIN hero_power ON superhero.id = hero_power.hero_id GROUP BY superhero.id, superhero.superhero_name ORDER BY COUNT(hero_power.power_id) DESC LIMIT 1;	superhero
SELECT COUNT(*)  FROM superhero  JOIN race ON superhero.race_id = race.id  WHERE race.race = 'Vampire';	superhero
SELECT ROUND((COUNT(CASE WHEN al.alignment = 'Bad' THEN 1 END) * 100.0 / COUNT(s.id)), 2) AS percentage, COUNT(CASE WHEN al.alignment = 'Bad' AND p.publisher_name = 'Marvel Comics' THEN 1 END) AS marvel_count FROM superhero s LEFT JOIN alignment al ON s.alignment_id = al.id LEFT JOIN publisher p ON s.publisher_id = p.id;	superhero
SELECT      (SELECT COUNT(*) FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics') -      (SELECT COUNT(*) FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'DC Comics') AS difference;	superhero
SELECT id FROM publisher WHERE publisher_name = 'Star Trek'	superhero
SELECT AVG(attribute_value) FROM hero_attribute;	superhero
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL;	superhero
SELECT colour.colour  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE superhero.id = 75;	superhero
SELECT sp.power_name  FROM superhero h  JOIN hero_power hp ON h.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE h.superhero_name = 'Deathlok'	superhero
SELECT AVG(s.weight_kg)  FROM superhero s  JOIN gender g ON s.gender_id = g.id  WHERE g.gender = 'Female'	superhero
SELECT DISTINCT sp.power_name  FROM superhero h  JOIN gender g ON h.gender_id = g.id  JOIN hero_power hp ON h.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE g.gender = 'Male'  LIMIT 5;	superhero
SELECT superhero.superhero_name FROM superhero INNER JOIN race ON superhero.race_id = race.id WHERE race.race = 'Alien';	superhero
SELECT superhero_name  FROM superhero  WHERE height_cm BETWEEN 170 AND 190  AND eye_colour_id = 1;	superhero
SELECT power_name FROM superpower JOIN hero_power ON superpower.id = hero_power.power_id WHERE hero_power.hero_id = 56;	superhero
SELECT s.full_name FROM superhero s JOIN race r ON s.race_id = r.id WHERE r.race = 'Demi-God';	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 2;	superhero
SELECT race.race FROM superhero JOIN race ON superhero.race_id = race.id WHERE superhero.weight_kg = 169;	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.hair_colour_id = c.id  JOIN race r ON s.race_id = r.id  WHERE s.height_cm = 185 AND r.race = 'human';	superhero
SELECT colour.colour  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE superhero.weight_kg = (SELECT MAX(weight_kg) FROM superhero);	superhero
SELECT      ROUND((COUNT(CASE WHEN s.publisher_id = 13 THEN 1 END) * 100.0 / COUNT(*)), 2) AS percentage FROM superhero s WHERE s.height_cm BETWEEN 150 AND 180;	superhero
SELECT superhero_name  FROM superhero  WHERE gender_id = 1  AND weight_kg > (SELECT 0.79 * AVG(weight_kg) FROM superhero);	superhero
SELECT sp.power_name FROM (     SELECT power_id, COUNT(*) AS cnt     FROM hero_power     GROUP BY power_id ) AS pc JOIN superpower sp ON pc.power_id = sp.id WHERE pc.cnt = (     SELECT MAX(cnt)     FROM (         SELECT COUNT(*) AS cnt         FROM hero_power         GROUP BY power_id     ) AS sub );	superhero
SELECT a.attribute_name, ha.attribute_value  FROM superhero s  JOIN hero_attribute ha ON s.id = ha.hero_id  JOIN attribute a ON ha.attribute_id = a.id  WHERE s.superhero_name = 'Abomination';	superhero
SELECT power_name  FROM superpower  JOIN hero_power ON superpower.id = hero_power.power_id  WHERE hero_power.hero_id = 1;	superhero
SELECT COUNT(DISTINCT hp.hero_id)  FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'stealth'	superhero
SELECT s.full_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_id = (     SELECT id FROM attribute WHERE attribute_name = 'Strength' ) AND ha.attribute_value = (     SELECT MAX(attribute_value) FROM hero_attribute      WHERE attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Strength') )	superhero
SELECT COUNT(superhero.id) / SUM(CASE WHEN skin_colour_id = 1 THEN 1 ELSE 0 END) FROM superhero;	superhero
SELECT COUNT(*)  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE publisher.publisher_name = 'Dark Horse Comics';	superhero
SELECT s.superhero_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE p.publisher_name = 'Dark Horse Comics' AND a.attribute_name = 'Durability' AND ha.attribute_value = (     SELECT MAX(ha2.attribute_value)     FROM hero_attribute ha2     JOIN superhero s2 ON ha2.hero_id = s2.id     JOIN publisher p2 ON s2.publisher_id = p2.id     JOIN attribute a2 ON ha2.attribute_id = a2.id     WHERE p2.publisher_name = 'Dark Horse Comics'     AND a2.attribute_name = 'Durability' );	superhero
SELECT colour.colour  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE superhero.full_name = 'Abraham Sapien';	superhero
SELECT superhero.superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Flight';	superhero
SELECT      ce.colour AS eye_colour,     ch.colour AS hair_colour,     cs.colour AS skin_colour FROM superhero h JOIN gender g ON h.gender_id = g.id AND g.gender = 'Female' JOIN publisher p ON h.publisher_id = p.id AND p.publisher_name = 'Dark Horse Comics' LEFT JOIN colour ce ON h.eye_colour_id = ce.id LEFT JOIN colour ch ON h.hair_colour_id = ch.id LEFT JOIN colour cs ON h.skin_colour_id = cs.id;	superhero
SELECT superhero.superhero_name, publisher.publisher_name FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.eye_colour_id = superhero.hair_colour_id AND superhero.hair_colour_id = superhero.skin_colour_id;	superhero
SELECT race.race  FROM superhero  JOIN race ON superhero.race_id = race.id  WHERE superhero.superhero_name = 'A-Bomb';	superhero
SELECT      (SUM(CASE WHEN c.colour = 'Blue' THEN 1 ELSE 0 END) / COUNT(*) * 100) AS percentage FROM superhero s JOIN gender g ON s.gender_id = g.id LEFT JOIN colour c ON s.skin_colour_id = c.id WHERE g.gender = 'Female';	superhero
SELECT superhero.superhero_name, race.race FROM superhero JOIN race ON superhero.race_id = race.id WHERE superhero.full_name = 'Charles Chandler';	superhero
SELECT gender.gender  FROM superhero  JOIN gender ON superhero.gender_id = gender.id  WHERE superhero.superhero_name = 'Agent 13';	superhero
SELECT superhero.superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Adaptation';	superhero
SELECT COUNT(hp.power_id)  FROM superhero s  JOIN hero_power hp ON s.id = hp.hero_id  WHERE s.superhero_name = 'Amazo';	superhero
SELECT sp.power_name  FROM superhero h  JOIN hero_power hp ON h.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE h.full_name = 'Hunter Zolomon';	superhero
SELECT s.height_cm FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.colour = 'Amber';	superhero
SELECT superhero.superhero_name FROM superhero JOIN colour AS eye_colour ON superhero.eye_colour_id = eye_colour.id JOIN colour AS hair_colour ON superhero.hair_colour_id = hair_colour.id WHERE eye_colour.colour = 'Black' AND hair_colour.colour = 'Black';	superhero
SELECT eye.colour  FROM superhero h  JOIN colour skin ON h.skin_colour_id = skin.id  JOIN colour eye ON h.eye_colour_id = eye.id  WHERE skin.colour = 'Gold'	superhero
SELECT superhero.full_name  FROM superhero  JOIN race ON superhero.race_id = race.id  WHERE race.race = 'Vampire'	superhero
SELECT superhero.superhero_name FROM superhero JOIN alignment ON superhero.alignment_id = alignment.id WHERE alignment.alignment = 'Neutral'	superhero
SELECT COUNT(*)  FROM hero_attribute  WHERE attribute_id = 2  AND attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute WHERE attribute_id = 2);	superhero
SELECT race.race, alignment.alignment FROM superhero JOIN race ON superhero.race_id = race.id JOIN alignment ON superhero.alignment_id = alignment.id WHERE superhero.superhero_name = 'Cameron Hicks';	superhero
SELECT      (SUM(CASE WHEN g.gender = 'Female' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS percentage FROM superhero h JOIN publisher p ON h.publisher_id = p.id JOIN gender g ON h.gender_id = g.id WHERE p.publisher_name = 'Marvel Comics';	superhero
SELECT AVG(s.weight_kg)  FROM superhero s JOIN race r ON s.race_id = r.id WHERE r.race = 'Alien'	superhero
SELECT (SELECT weight_kg FROM superhero WHERE full_name = 'Emil Blonsky') - (SELECT weight_kg FROM superhero WHERE full_name = 'Charles Chandler') AS difference;	superhero
SELECT AVG(height_cm) AS average_height FROM superhero	superhero
SELECT sp.power_name  FROM superpower sp  JOIN hero_power hp ON sp.id = hp.power_id  JOIN superhero s ON hp.hero_id = s.id  WHERE s.superhero_name = 'Abomination';	superhero
SELECT COUNT(*) FROM superhero WHERE race_id = 21 AND gender_id = 1;	superhero
SELECT superhero.superhero_name  FROM superhero  JOIN hero_attribute ON superhero.id = hero_attribute.hero_id  JOIN attribute ON hero_attribute.attribute_id = attribute.id  WHERE attribute.attribute_name = 'Speed'  ORDER BY hero_attribute.attribute_value DESC  LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3;	superhero
SELECT attribute.attribute_name, hero_attribute.attribute_value FROM hero_attribute JOIN attribute ON hero_attribute.attribute_id = attribute.id JOIN superhero ON hero_attribute.hero_id = superhero.id WHERE superhero.superhero_name = '3-D Man';	superhero
SELECT superhero.superhero_name FROM superhero JOIN colour AS eye_color ON superhero.eye_colour_id = eye_color.id JOIN colour AS hair_color ON superhero.hair_colour_id = hair_color.id WHERE eye_color.colour = 'Blue' AND hair_color.colour = 'Brown';	superhero
SELECT s.superhero_name, p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy')	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = 1;	superhero
SELECT (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM superhero)) AS percentage FROM superhero WHERE eye_colour_id = 7;	superhero
SELECT      SUM(CASE WHEN gender_id = 1 THEN 1 ELSE 0 END) * 1.0 /     SUM(CASE WHEN gender_id = 2 THEN 1 ELSE 0 END) AS ratio FROM superhero;	superhero
SELECT superhero_name  FROM superhero  WHERE height_cm = (SELECT MAX(height_cm) FROM superhero)	superhero
SELECT id FROM superpower WHERE power_name = 'cryokinesis'；  Wait, but in the problem's extra knowledge, it says "cryokinesis refers to power_name = 'cryokinesis'". However, looking at the provided superpower data, none of the entries have 'cryokinesis' as a power_name. The closest might be 'Cold Resistance' (ID 5), but according to the user's instruction, we must strictly follow the given mapping. Since the user explicitly states that cryokinesis corresponds to power_name 'cryokinesis', even if it's not present in the provided data, the correct SQL is as above. However, there's a typo in the SQL above with a Chinese comma. Let me correct that:  SELECT id FROM superpower WHERE power_name = 'cryokinesis';	superhero
SELECT superhero_name FROM superhero WHERE id = 294;	superhero
SELECT full_name FROM superhero WHERE weight_kg = 0 OR weight_kg IS NULL;	superhero
SELECT colour.colour  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE superhero.full_name = 'Karen Beecher-Duncan';	superhero
SELECT sp.power_name FROM superhero h JOIN hero_power hp ON h.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE h.full_name = 'Helen Parr';	superhero
SELECT race.race  FROM superhero  JOIN race ON superhero.race_id = race.id  WHERE superhero.weight_kg = 108  AND superhero.height_cm = 188;	superhero
SELECT publisher.publisher_name  FROM publisher  JOIN superhero ON publisher.id = superhero.publisher_id  WHERE superhero.id = 38;	superhero
SELECT race.race FROM superhero JOIN race ON superhero.race_id = race.id JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE hero_attribute.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute);	superhero
SELECT a.alignment, sp.power_name FROM superhero h JOIN alignment a ON h.alignment_id = a.id LEFT JOIN hero_power hp ON h.id = hp.hero_id LEFT JOIN superpower sp ON hp.power_id = sp.id WHERE h.superhero_name = 'Atom IV';	superhero
SELECT superhero.full_name FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue' LIMIT 5;	superhero
SELECT AVG(ha.attribute_value)  FROM superhero s  JOIN hero_attribute ha ON s.id = ha.hero_id  WHERE s.alignment_id = 3;	superhero
SELECT DISTINCT colour.colour FROM superhero JOIN colour ON superhero.skin_colour_id = colour.id JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE hero_attribute.attribute_value = 100;	superhero
SELECT COUNT(*)  FROM superhero  WHERE alignment_id = 1 AND gender_id = 2;	superhero
SELECT DISTINCT superhero.superhero_name  FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE hero_attribute.attribute_value BETWEEN 75 AND 80;	superhero
SELECT race.race  FROM superhero  JOIN colour ON superhero.hair_colour_id = colour.id  JOIN gender ON superhero.gender_id = gender.id  JOIN race ON superhero.race_id = race.id  WHERE colour.colour = 'Blue' AND gender.gender = 'Male';	superhero
SELECT      (COUNT(CASE WHEN s.gender_id = 2 THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM superhero s WHERE s.alignment_id = 2;	superhero
SELECT      (SUM(CASE WHEN eye_colour_id = 7 THEN 1 ELSE 0 END) - SUM(CASE WHEN eye_colour_id = 1 THEN 1 ELSE 0 END)) AS difference FROM superhero WHERE weight_kg = 0 OR weight_kg IS NULL;	superhero
SELECT ha.attribute_value  FROM superhero s  JOIN hero_attribute ha ON s.id = ha.hero_id  JOIN attribute a ON ha.attribute_id = a.id  WHERE s.superhero_name = 'Hulk'  AND a.attribute_name = 'Strength';	superhero
SELECT sp.power_name  FROM superhero h  JOIN hero_power hp ON h.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE h.superhero_name = 'Ajax';	superhero
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.skin_colour_id = colour.id  JOIN alignment ON superhero.alignment_id = alignment.id  WHERE colour.colour = 'Green' AND alignment.alignment = 'Bad';	superhero
SELECT COUNT(*)  FROM superhero h JOIN gender g ON h.gender_id = g.id JOIN publisher p ON h.publisher_id = p.id WHERE g.gender = 'Female'  AND p.publisher_name = 'Marvel Comics';	superhero
SELECT superhero.superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Wind Control' ORDER BY superhero.superhero_name;	superhero
SELECT g.gender  FROM superhero h  JOIN gender g ON h.gender_id = g.id  JOIN hero_power hp ON h.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'Phoenix Force';	superhero
SELECT superhero_name FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'DC Comics' ORDER BY weight_kg DESC LIMIT 1;	superhero
SELECT AVG(s.height_cm)  FROM superhero s JOIN publisher p ON s.publisher_id = p.id JOIN race r ON s.race_id = r.id WHERE p.publisher_name = 'Dark Horse Comics'  AND r.race <> 'Human';	superhero
SELECT COUNT(DISTINCT ha.hero_id)  FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' AND ha.attribute_value = 100;	superhero
SELECT      (SUM(CASE WHEN p.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) -       SUM(CASE WHEN p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END)) AS difference FROM superhero s JOIN publisher p ON s.publisher_id = p.id;	superhero
SELECT attribute.attribute_name FROM attribute JOIN hero_attribute ON attribute.id = hero_attribute.attribute_id WHERE hero_attribute.hero_id = (SELECT id FROM superhero WHERE superhero_name = 'Black Panther') AND hero_attribute.attribute_value = (     SELECT MIN(attribute_value)      FROM hero_attribute      WHERE hero_id = (SELECT id FROM superhero WHERE superhero_name = 'Black Panther') );	superhero
SELECT colour.colour  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE superhero.superhero_name = 'Abomination';	superhero
SELECT superhero_name  FROM superhero  WHERE height_cm = (SELECT MAX(height_cm) FROM superhero)	superhero
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler'	superhero
SELECT      (SUM(CASE WHEN g.gender = 'Female' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS percentage FROM superhero h JOIN publisher p ON h.publisher_id = p.id JOIN gender g ON h.gender_id = g.id WHERE p.publisher_name = 'George Lucas';	superhero
SELECT      (COUNT(CASE WHEN a.alignment = 'Good' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM superhero h JOIN publisher p ON h.publisher_id = p.id LEFT JOIN alignment a ON h.alignment_id = a.id WHERE p.publisher_name = 'Marvel Comics';	superhero
SELECT COUNT(*)  FROM superhero  WHERE full_name LIKE 'John%';	superhero
SELECT hero_id FROM hero_attribute WHERE attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute)	superhero
SELECT full_name FROM superhero WHERE superhero_name = 'Alien'	superhero
SELECT full_name FROM superhero WHERE weight_kg < 100 AND eye_colour_id = 7;	superhero
SELECT a.attribute_name, ha.attribute_value  FROM superhero s  JOIN hero_attribute ha ON s.id = ha.hero_id  JOIN attribute a ON ha.attribute_id = a.id  WHERE s.superhero_name = 'Aquababy'	superhero
SELECT s.weight_kg, r.race FROM superhero s LEFT JOIN race r ON s.race_id = r.id WHERE s.id = 40;	superhero
SELECT AVG(height_cm) FROM superhero WHERE alignment_id = 3;	superhero
SELECT superhero.id  FROM superhero  JOIN hero_power ON superhero.id = hero_power.hero_id  JOIN superpower ON hero_power.power_id = superpower.id  WHERE superpower.power_name = 'Intelligence';	superhero
SELECT colour.colour  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE superhero.superhero_name = 'Blackwulf';	superhero
SELECT sp.power_name FROM superhero h JOIN hero_power hp ON h.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE h.height_cm > (SELECT 0.8 * AVG(height_cm) FROM superhero);	superhero
SELECT drivers.driverRef  FROM drivers  JOIN qualifying ON drivers.driverId = qualifying.driverId  WHERE qualifying.raceId = 20  ORDER BY qualifying.q1 DESC  LIMIT 5;	formula_1
SELECT drivers.surname  FROM drivers  JOIN qualifying ON drivers.driverId = qualifying.driverId  WHERE qualifying.raceId = 19 AND qualifying.q2 IS NOT NULL  ORDER BY qualifying.q2 ASC  LIMIT 1;	formula_1
SELECT DISTINCT year FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.location = 'Shanghai';	formula_1
SELECT races.url  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE circuits.name = 'Circuit de Barcelona-Catalunya';	formula_1
SELECT races.name  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE circuits.country = 'Germany';	formula_1
SELECT circuits.name AS circuit, cs.position  FROM constructorStandings cs  JOIN races r ON cs.raceId = r.raceId  JOIN circuits ON r.circuitId = circuits.circuitId  WHERE cs.constructorId = (SELECT constructorId FROM constructors WHERE name = 'Renault');	formula_1
SELECT COUNT(*)  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE races.year = 2010  AND circuits.country NOT IN ('Asia', 'Europe');	formula_1
SELECT races.name FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.country = 'Spain';	formula_1
SELECT c.lat, c.lng FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.name = 'Australian Grand Prix';	formula_1
SELECT races.url  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE circuits.name = 'Sepang International Circuit';	formula_1
SELECT races.time  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE circuits.name = 'Sepang International Circuit';	formula_1
SELECT circuits.lat, circuits.lng  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE races.name = 'Abu Dhabi Grand Prix';	formula_1
SELECT constructors.nationality  FROM constructors  JOIN constructorResults ON constructors.constructorId = constructorResults.constructorId  WHERE constructorResults.raceId = 24 AND constructorResults.points = 1.0;	formula_1
SELECT q.q1  FROM qualifying q JOIN drivers d ON q.driverId = d.driverId WHERE q.raceId = 354  AND d.forename = 'Bruno'  AND d.surname = 'Senna';	formula_1
SELECT d.nationality  FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 355 AND q.q2 = '0:01:40';	formula_1
SELECT drivers.number FROM drivers JOIN qualifying ON drivers.driverId = qualifying.driverId WHERE qualifying.raceId = 903 AND qualifying.q3 LIKE '1:54%'	formula_1
SELECT COUNT(*)  FROM results  WHERE raceId = (SELECT raceId FROM races WHERE year = 2007 AND name = 'Bahrain Grand Prix')  AND time IS NULL;	formula_1
SELECT url FROM seasons  WHERE year = (SELECT year FROM races WHERE raceId = 901)	formula_1
SELECT COUNT(*)  FROM results  WHERE raceId = (SELECT raceId FROM races WHERE date = '2015-11-29')  AND time IS NOT NULL;	formula_1
SELECT drivers.forename, drivers.surname  FROM drivers  JOIN results ON drivers.driverId = results.driverId  WHERE results.raceId = 592 AND results.time IS NOT NULL  ORDER BY drivers.dob ASC  LIMIT 1;	formula_1
SELECT d.url  FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId WHERE lt.raceId = 161  AND lt.time LIKE '1:27%';	formula_1
SELECT drivers.nationality  FROM drivers  JOIN results ON drivers.driverId = results.driverId  WHERE results.raceId = 933  AND results.fastestLapSpeed IS NOT NULL  ORDER BY CAST(results.fastestLapSpeed AS REAL) DESC  LIMIT 1;	formula_1
SELECT circuits.lat, circuits.lng  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE races.name = 'Malaysian Grand Prix';	formula_1
SELECT constructors.url  FROM constructors  JOIN constructorResults  ON constructors.constructorId = constructorResults.constructorId  WHERE constructorResults.raceId = 9  ORDER BY constructorResults.points DESC  LIMIT 1;	formula_1
SELECT q.q1  FROM qualifying q JOIN drivers d ON q.driverId = d.driverId WHERE d.forename = 'Lucas' AND d.surname = 'di Grassi' AND q.raceId = 345;	formula_1
SELECT drivers.nationality  FROM qualifying  JOIN drivers ON qualifying.driverId = drivers.driverId  WHERE qualifying.raceId = 347  AND qualifying.q2 = '0:01:15';	formula_1
SELECT d.code  FROM qualifying q  JOIN drivers d ON q.driverId = d.driverId  WHERE q.raceId = 45 AND q.q3 LIKE '1:33%';	formula_1
SELECT r.time  FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE r.raceId = 743  AND d.forename = 'Bruce'  AND d.surname = 'McLaren';	formula_1
SELECT drivers.forename, drivers.surname FROM results JOIN races ON results.raceId = races.raceId JOIN drivers ON results.driverId = drivers.driverId WHERE races.year = 2006 AND races.name = 'San Marino Grand Prix' AND results.position = 2;	formula_1
SELECT s.url  FROM seasons s  JOIN races r ON s.year = r.year  WHERE r.raceId = 901;	formula_1
SELECT COUNT(*)  FROM results  WHERE raceId = (SELECT raceId FROM races WHERE date = '2015-11-29')  AND statusId != 1;	formula_1
SELECT d.forename, d.surname, d.dob FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 872 AND r.time IS NOT NULL ORDER BY d.dob DESC LIMIT 1;	formula_1
SELECT drivers.forename || ' ' || drivers.surname  FROM drivers  JOIN lapTimes ON drivers.driverId = lapTimes.driverId  WHERE lapTimes.raceId = 348  AND lapTimes.time = (     SELECT MIN(time)      FROM lapTimes      WHERE raceId = 348 )	formula_1
SELECT drivers.nationality  FROM drivers  JOIN results ON drivers.driverId = results.driverId  WHERE results.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results)	formula_1
SELECT      ((CAST(r853.fastestLapSpeed AS REAL) - CAST(r854.fastestLapSpeed AS REAL)) / CAST(r853.fastestLapSpeed AS REAL)) * 100 AS percentage FROM      results r853 JOIN      results r854 ON r853.driverId = r854.driverId WHERE      r853.raceId = 853      AND r854.raceId = 854      AND r853.driverId = (SELECT driverId FROM drivers WHERE forename = 'Paul' AND surname = 'di Resta');	formula_1
SELECT (COUNT(CASE WHEN time IS NOT NULL THEN driverId END) * 1.0 / COUNT(driverId)) AS completion_rate FROM results WHERE raceId = (SELECT raceId FROM races WHERE date = '1983-07-16')	formula_1
SELECT MIN(year) FROM races WHERE name = 'Singapore Grand Prix';	formula_1
SELECT COUNT(*) FROM races WHERE year = 2005; SELECT name FROM races WHERE year = 2005 ORDER BY name DESC;	formula_1
SELECT name FROM races WHERE strftime('%Y', date) = (SELECT strftime('%Y', MIN(date)) FROM races) AND strftime('%m', date) = (SELECT strftime('%m', MIN(date)) FROM races);	formula_1
SELECT name, date  FROM races  WHERE year = 1999  AND round = (SELECT MAX(round) FROM races WHERE year = 1999)	formula_1
SELECT year  FROM (     SELECT year, MAX(round) AS max_round      FROM races      GROUP BY year ) AS subquery  ORDER BY max_round DESC  LIMIT 1;	formula_1
SELECT name  FROM races  WHERE year = 2017  AND circuitId NOT IN (SELECT circuitId FROM races WHERE year = 2000);	formula_1
SELECT c.country, c.name, c.location FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.name = 'European Grand Prix' ORDER BY r.year ASC LIMIT 1;	formula_1
SELECT MAX(r.year)  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE r.name = 'British Grand Prix'  AND c.name = 'Brands Hatch';	formula_1
SELECT COUNT(DISTINCT r.year)  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE c.name = 'Silverstone Circuit'  AND r.name = 'British Grand Prix';	formula_1
SELECT drivers.forename || ' ' || drivers.surname AS driver_name FROM results JOIN races ON results.raceId = races.raceId JOIN drivers ON results.driverId = drivers.driverId WHERE races.year = 2010 AND races.name = 'Singapore Grand Prix' ORDER BY results.positionOrder;	formula_1
SELECT drivers.forename, drivers.surname, MAX(ds.points) AS points FROM driverStandings ds JOIN drivers ON ds.driverId = drivers.driverId GROUP BY ds.driverId ORDER BY points DESC LIMIT 1;	formula_1
SELECT d.forename, d.surname, r.points FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE r.raceId = (     SELECT raceId      FROM races      WHERE year = 2017 AND name = 'Chinese Grand Prix' ) ORDER BY r.points DESC LIMIT 3;	formula_1
SELECT drivers.forename, drivers.surname, races.name FROM lapTimes JOIN drivers ON lapTimes.driverId = drivers.driverId JOIN races ON lapTimes.raceId = races.raceId WHERE lapTimes.milliseconds = (SELECT MIN(milliseconds) FROM lapTimes);	formula_1
SELECT AVG(milliseconds)  FROM lapTimes  JOIN drivers ON lapTimes.driverId = drivers.driverId  JOIN races ON lapTimes.raceId = races.raceId  WHERE drivers.forename = 'Lewis'  AND drivers.surname = 'Hamilton'  AND races.name = 'Malaysian Grand Prix'  AND races.year = 2009;	formula_1
SELECT      (CAST(SUM(CASE WHEN r.position > 1 THEN 1 ELSE 0 END) AS REAL) / COUNT(*)) * 100 AS percentage FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ON r.raceId = races.raceId WHERE d.surname = 'Hamilton' AND races.year >= 2010;	formula_1
SELECT drivers.forename || ' ' || drivers.surname AS driver_name, drivers.nationality, MAX(driverStandings.points) AS max_points FROM drivers JOIN driverStandings ON drivers.driverId = driverStandings.driverId GROUP BY drivers.driverId, drivers.forename, drivers.surname, drivers.nationality ORDER BY MAX(driverStandings.wins) DESC LIMIT 1;	formula_1
SELECT (YEAR(CURRENT_TIMESTAMP) - YEAR(dob)) AS age, forename, surname FROM drivers WHERE nationality = 'Japanese' ORDER BY dob DESC LIMIT 1;	formula_1
SELECT circuits.name  FROM circuits  JOIN races ON circuits.circuitId = races.circuitId  WHERE races.year BETWEEN 1990 AND 2000  GROUP BY circuits.circuitId  HAVING COUNT(races.raceId) = 4;	formula_1
SELECT circuits.name AS circuit_name, circuits.location, races.name AS race_name FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE circuits.country = 'USA' AND races.year = 2006;	formula_1
SELECT races.name, circuits.name, circuits.location FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE YEAR(races.date) = 2005 AND MONTH(races.date) = 9;	formula_1
SELECT races.name, races.year FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN races ON results.raceId = races.raceId WHERE drivers.forename = 'Alex' AND drivers.surname = 'Yoong' AND results.position < 20;	formula_1
SELECT COUNT(*)  FROM results r JOIN races ON r.raceId = races.raceId JOIN circuits ON races.circuitId = circuits.circuitId JOIN drivers ON r.driverId = drivers.driverId WHERE circuits.name = 'Sepang International Circuit' AND drivers.forename = 'Michael'  AND drivers.surname = 'Schumacher' AND r.points = (     SELECT MAX(points)      FROM results      WHERE raceId = r.raceId );	formula_1
SELECT races.name, races.year  FROM races  JOIN lapTimes ON races.raceId = lapTimes.raceId  WHERE lapTimes.driverId = (SELECT driverId FROM drivers WHERE forename = 'Michael' AND surname = 'Schumacher')  AND lapTimes.milliseconds = (SELECT MIN(milliseconds) FROM lapTimes WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Michael' AND surname = 'Schumacher'))  LIMIT 1;	formula_1
SELECT AVG(r.points)  FROM results r  JOIN races rc ON r.raceId = rc.raceId  WHERE rc.year = 2000  AND r.driverId = (SELECT driverId FROM drivers WHERE forename = 'Eddie' AND surname = 'Irvine')	formula_1
SELECT res.points  FROM drivers d  JOIN results res ON d.driverId = res.driverId  JOIN races r ON res.raceId = r.raceId  WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton'  ORDER BY r.year ASC, r.date ASC, r.round ASC  LIMIT 1;	formula_1
SELECT races.name, circuits.country FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE races.year = 2017 ORDER BY races.date;	formula_1
SELECT races.name, races.year, circuits.location FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE races.raceId IN (     SELECT raceId      FROM (         SELECT raceId, MAX(lap) AS max_lap          FROM lapTimes          GROUP BY raceId     ) AS subq      WHERE max_lap = (         SELECT MAX(max_lap)          FROM (             SELECT MAX(lap) AS max_lap              FROM lapTimes              GROUP BY raceId         ) AS subq2     ) )	formula_1
SELECT      (COUNT(CASE WHEN c.country = 'Germany' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.name = 'European Grand Prix';	formula_1
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit'	formula_1
SELECT name, lat  FROM circuits  WHERE name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring')  ORDER BY lat DESC  LIMIT 1;	formula_1
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit';	formula_1
SELECT country FROM circuits WHERE alt = (SELECT MAX(alt) FROM circuits)	formula_1
SELECT COUNT(*) FROM drivers WHERE code IS NULL;	formula_1
SELECT nationality FROM drivers WHERE dob = (SELECT MIN(dob) FROM drivers);	formula_1
SELECT surname FROM drivers WHERE nationality = 'italian';	formula_1
SELECT url FROM drivers WHERE forename = 'Anthony' AND surname = 'Davidson';	formula_1
SELECT driverRef FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton'	formula_1
SELECT circuits.name  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE races.year = 2009 AND races.name = 'Spanish Grand Prix';	formula_1
SELECT DISTINCT year FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.name = 'Silverstone Circuit';	formula_1
SELECT races.url, races.year, races.name, races.date  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE circuits.name = 'Silverstone Circuit';	formula_1
SELECT r.time  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE c.name = 'Abu Dhabi Circuit'  AND r.year BETWEEN 2010 AND 2019;	formula_1
SELECT COUNT(*)  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE circuits.country = 'Italy';	formula_1
SELECT DISTINCT r.date  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE c.name = 'Barcelona-Catalunya';	formula_1
SELECT circuits.url  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE races.year = 2009 AND races.name = 'Spanish Grand Prix';	formula_1
SELECT MIN(results.fastestLapTime)  FROM results  JOIN drivers ON results.driverId = drivers.driverId  WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE CAST(r.fastestLapSpeed AS REAL) = (     SELECT MAX(CAST(fastestLapSpeed AS REAL))     FROM results     WHERE fastestLapSpeed IS NOT NULL );	formula_1
SELECT d.driverRef FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Canadian Grand Prix'  AND ra.year = 2007  AND r.position = 1;	formula_1
SELECT races.*  FROM races  JOIN results ON races.raceId = results.raceId  JOIN drivers ON results.driverId = drivers.driverId  WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';	formula_1
SELECT races.name, races.year FROM races  JOIN results ON races.raceId = results.raceId  WHERE results.driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')  AND results.position = (SELECT MIN(position) FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton'));	formula_1
SELECT MAX(fastestLapSpeed)  FROM results  JOIN races ON results.raceId = races.raceId  WHERE races.year = 2009 AND races.name = 'Spanish Grand Prix';	formula_1
SELECT DISTINCT r.year  FROM races r  JOIN results res ON r.raceId = res.raceId  JOIN drivers d ON res.driverId = d.driverId  WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton'	formula_1
SELECT r.positionOrder  FROM results r  JOIN races rc ON r.raceId = rc.raceId  JOIN drivers d ON r.driverId = d.driverId  WHERE rc.name = 'Chinese Grand Prix'  AND rc.year = 2008  AND d.forename = 'Lewis'  AND d.surname = 'Hamilton';	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races rc ON r.raceId = rc.raceId WHERE rc.year = 1989 AND rc.name = 'Australian Grand Prix' AND r.grid = 4;	formula_1
SELECT COUNT(DISTINCT r.driverId)  FROM results r  JOIN races rc ON r.raceId = rc.raceId  WHERE rc.year = 2008  AND rc.name = 'Australian Grand Prix'  AND r.time IS NOT NULL;	formula_1
SELECT time, lap  FROM lapTimes  WHERE raceId = (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix')  AND driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')  ORDER BY milliseconds ASC  LIMIT 1;	formula_1
SELECT r.time  FROM results r JOIN races rc ON r.raceId = rc.raceId WHERE rc.year = 2008  AND rc.name = 'Chinese Grand Prix'  AND r.position = 2;	formula_1
SELECT drivers.forename, drivers.surname, drivers.url  FROM drivers  JOIN results ON drivers.driverId = results.driverId  JOIN races ON results.raceId = races.raceId  WHERE races.year = 2008  AND races.name = 'Australian Grand Prix'  AND results.position = 1  AND results.statusId = 1;	formula_1
SELECT COUNT(DISTINCT r.driverId)  FROM results r  JOIN drivers d ON r.driverId = d.driverId  WHERE r.raceId = (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix')  AND d.nationality = 'British'	formula_1
SELECT COUNT(DISTINCT r.driverId)  FROM results r  JOIN races rc ON r.raceId = rc.raceId  WHERE rc.year = 2008 AND rc.name = 'Chinese Grand Prix' AND r.time IS NOT NULL;	formula_1
SELECT SUM(points) FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')	formula_1
SELECT AVG(     CAST(SUBSTR(r.fastestLapTime, 1, INSTR(r.fastestLapTime, ':') - 1) AS REAL) * 60 +     CAST(SUBSTR(r.fastestLapTime, INSTR(r.fastestLapTime, ':') + 1) AS REAL) )  FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND r.fastestLapTime IS NOT NULL;	formula_1
SELECT      CAST(COUNT(r.time) AS REAL) / COUNT(*) AS rate FROM races ra JOIN results r ON ra.raceId = r.raceId WHERE ra.year = 2008 AND ra.name = 'Australian Grand Prix'	formula_1
SELECT ((last_ms - champion_ms)*100.0 / last_ms) AS percentage_faster FROM (     SELECT          (SELECT milliseconds FROM results WHERE raceId = (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix') AND position = 1) AS champion_ms,         (SELECT milliseconds FROM results WHERE raceId = (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix') AND position = (SELECT MAX(position) FROM results WHERE raceId = (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix') AND time IS NOT NULL)) AS last_ms )	formula_1
SELECT COUNT(*) FROM circuits WHERE country = 'Australia' AND location = 'Adelaide';	formula_1
SELECT lat, lng FROM circuits WHERE country = 'USA';	formula_1
SELECT COUNT(*)  FROM drivers WHERE nationality = 'British'  AND strftime('%Y', dob) > '1980';	formula_1
SELECT MAX(cs.points)  FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId WHERE c.nationality = 'British'	formula_1
SELECT constructors.name FROM constructorStandings JOIN constructors ON constructorStandings.constructorId = constructors.constructorId GROUP BY constructorStandings.constructorId ORDER BY SUM(constructorStandings.points) DESC LIMIT 1;	formula_1
SELECT constructors.name  FROM constructors  JOIN constructorResults ON constructors.constructorId = constructorResults.constructorId  WHERE constructorResults.raceId = 291  AND constructorResults.points = 0;	formula_1
SELECT COUNT(*)  FROM constructors c WHERE c.nationality = 'Japanese'  AND (     SELECT COUNT(*)      FROM constructorResults cr      WHERE cr.constructorId = c.constructorId      AND cr.points = 0 ) = 2;	formula_1
SELECT DISTINCT c.name FROM constructorStandings cs JOIN constructors c ON cs.constructorId = c.constructorId WHERE cs.position = 1;	formula_1
SELECT COUNT(DISTINCT c.constructorId)  FROM constructors c  WHERE c.nationality = 'French'  AND EXISTS (     SELECT 1      FROM lapTimes lt      JOIN results r ON lt.raceId = r.raceId AND lt.driverId = r.driverId      WHERE r.constructorId = c.constructorId      AND lt.lap > 50 );	formula_1
SELECT      (COUNT(CASE WHEN r.time IS NOT NULL THEN 1 END) * 100.0 / COUNT(*)) AS completion_percentage FROM      drivers d JOIN      results r ON d.driverId = r.driverId JOIN      races ra ON r.raceId = ra.raceId WHERE      d.nationality = 'Japanese'     AND ra.year BETWEEN 2007 AND 2009;	formula_1
WITH champion_drivers AS (     SELECT r.year, ds.driverId     FROM driverStandings ds     JOIN races r ON ds.raceId = r.raceId     JOIN (         SELECT year, raceId FROM races          WHERE (year, round) IN (SELECT year, MAX(round) FROM races GROUP BY year)     ) AS last_races ON r.raceId = last_races.raceId     WHERE ds.position = 1 ),  champion_times AS (     SELECT cd.year,             CAST( substr(res.time, 1, 2) AS INTEGER ) * 3600 +            CAST( substr(res.time, 4, 2) AS INTEGER ) * 60 +            CAST( substr(res.time, 7, 2) AS INTEGER ) +            (CAST( substr(res.time, 10, 3) AS REAL ) / 1000) AS time_seconds     FROM champion_drivers cd     JOIN results res ON cd.driverId = res.driverId     JOIN races r ON res.raceId = r.raceId AND cd.year = r.year     WHERE res.statusId = 1     AND res.time IS NOT NULL )  SELECT year, AVG(time_seconds) AS avg_time FROM champion_times GROUP BY year;	formula_1
SELECT DISTINCT d.forename, d.surname FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId WHERE ds.position = 2 AND strftime('%Y', d.dob) > '1975';	formula_1
SELECT COUNT(DISTINCT d.driverId)  FROM drivers d  JOIN results r ON d.driverId = r.driverId  WHERE d.nationality = 'Italian' AND r.time IS NULL;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN lapTimes l ON d.driverId = l.driverId WHERE l.milliseconds = (SELECT MIN(milliseconds) FROM lapTimes WHERE milliseconds IS NOT NULL)	formula_1
SELECT lap FROM lapTimes  WHERE raceId = (SELECT raceId FROM races WHERE year = 2009 ORDER BY date DESC LIMIT 1)  AND driverId = (SELECT driverId FROM driverStandings                  WHERE raceId = (SELECT raceId FROM races WHERE year = 2009 ORDER BY date DESC LIMIT 1)                  AND position = 1)  ORDER BY milliseconds ASC  LIMIT 1;	formula_1
SELECT AVG(CAST(fastestLapSpeed AS REAL))  FROM results  WHERE raceId = (     SELECT raceId      FROM races      WHERE year = 2009 AND name = 'Spanish Grand Prix' );	formula_1
SELECT races.name, races.year FROM races JOIN (     SELECT raceId, MIN(milliseconds) AS min_time     FROM results     WHERE milliseconds IS NOT NULL     GROUP BY raceId ) AS race_min ON races.raceId = race_min.raceId WHERE race_min.min_time = (     SELECT MIN(min_time)     FROM (         SELECT MIN(milliseconds) AS min_time         FROM results         WHERE milliseconds IS NOT NULL         GROUP BY raceId     ) AS sub );	formula_1
SELECT      (SELECT COUNT(*)       FROM (          SELECT d.driverId          FROM drivers d          JOIN results r ON d.driverId = r.driverId          JOIN races race ON r.raceId = race.raceId          WHERE d.dob < '1985-01-01'          AND race.year BETWEEN 2000 AND 2005          AND r.laps > 50          GROUP BY d.driverId      )) * 100.0 /      (SELECT COUNT(*)       FROM (          SELECT r.driverId          FROM results r          JOIN races race ON r.raceId = race.raceId          WHERE race.year BETWEEN 2000 AND 2005          GROUP BY r.driverId      )) AS percentage;	formula_1
SELECT COUNT(DISTINCT d.driverId)  FROM drivers d  JOIN lapTimes l ON d.driverId = l.driverId  WHERE d.nationality = 'French'  AND l.milliseconds < 120000;	formula_1
SELECT code FROM drivers WHERE nationality = 'America';	formula_1
SELECT raceId FROM races WHERE year = 2009;	formula_1
SELECT COUNT(*) FROM results WHERE raceId = 18;	formula_1
SELECT code FROM drivers ORDER BY dob DESC LIMIT 3; SELECT COUNT(*) FROM drivers WHERE nationality = 'Dutch' AND code IN (SELECT code FROM drivers ORDER BY dob DESC LIMIT 3);	formula_1
SELECT driverRef FROM drivers WHERE forename = 'Robert' AND surname = 'Kubica'	formula_1
SELECT COUNT(*)  FROM drivers  WHERE nationality = 'British'  AND YEAR(dob) = 1980;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE d.nationality = 'German'  AND YEAR(d.dob) BETWEEN 1980 AND 1990 GROUP BY d.driverId, d.forename, d.surname ORDER BY MIN(lt.time)  LIMIT 3;	formula_1
SELECT driverRef  FROM drivers  WHERE nationality = 'German'  ORDER BY dob ASC  LIMIT 1;	formula_1
SELECT DISTINCT d.driverId, d.code FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE YEAR(d.dob) = 1971 AND r.fastestLapTime IS NOT NULL;	formula_1
SELECT d.driverId, d.forename, d.surname, MAX(lt.milliseconds) AS latest_lap_time FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE d.nationality = 'Spanish'    AND strftime('%Y', d.dob) < '1982' GROUP BY d.driverId ORDER BY latest_lap_time DESC LIMIT 10;	formula_1
SELECT races.year  FROM races  JOIN results ON races.raceId = results.raceId  WHERE results.fastestLapTime = (     SELECT MIN(fastestLapTime)      FROM results      WHERE fastestLapTime IS NOT NULL )	formula_1
SELECT races.year  FROM races  JOIN lapTimes ON races.raceId = lapTimes.raceId  WHERE lapTimes.milliseconds = (SELECT MAX(milliseconds) FROM lapTimes);	formula_1
SELECT driverId  FROM lapTimes  WHERE lap = 1  GROUP BY driverId  ORDER BY MIN(time) ASC  LIMIT 5;	formula_1
SELECT COUNT(*)  FROM results  WHERE raceId > 50  AND raceId < 100  AND statusId = 2  AND time IS NOT NULL;	formula_1
SELECT circuits.location, circuits.lat, circuits.lng, COUNT(races.raceId) AS times_held FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE circuits.country = 'Austria' GROUP BY circuits.circuitId;	formula_1
SELECT races.round AS race_number FROM results JOIN races ON results.raceId = races.raceId WHERE results.time IS NOT NULL GROUP BY races.raceId, races.round ORDER BY COUNT(*) DESC LIMIT 1;	formula_1
SELECT drivers.driverRef, drivers.nationality, drivers.dob FROM drivers JOIN qualifying ON drivers.driverId = qualifying.driverId WHERE qualifying.raceId = 23 AND qualifying.q2 IS NOT NULL;	formula_1
SELECT r.year, r.name, r.date, r.time FROM races r JOIN qualifying q ON r.raceId = q.raceId JOIN drivers d ON q.driverId = d.driverId WHERE d.driverId = (     SELECT driverId      FROM drivers      WHERE EXISTS (SELECT 1 FROM qualifying WHERE qualifying.driverId = drivers.driverId)     ORDER BY dob DESC      LIMIT 1 ) AND r.date = (     SELECT MIN(r2.date)     FROM races r2     JOIN qualifying q2 ON r2.raceId = q2.raceId     WHERE q2.driverId = (         SELECT driverId          FROM drivers          WHERE EXISTS (SELECT 1 FROM qualifying WHERE qualifying.driverId = drivers.driverId)         ORDER BY dob DESC          LIMIT 1     ) );	formula_1
SELECT COUNT(DISTINCT d.driverId)  FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN status s ON r.statusId = s.statusId WHERE d.nationality = 'American'  AND s.status = 'Puncture';	formula_1
SELECT c.name, c.url  FROM constructors c  JOIN constructorStandings cs ON c.constructorId = cs.constructorId  WHERE c.nationality = 'Italian'  GROUP BY c.constructorId, c.name, c.url  ORDER BY SUM(cs.points) DESC  LIMIT 1;	formula_1
SELECT c.url  FROM constructors c  JOIN constructorStandings cs ON c.constructorId = cs.constructorId  GROUP BY c.constructorId  ORDER BY SUM(cs.wins) DESC  LIMIT 1;	formula_1
SELECT drivers.forename, drivers.surname FROM drivers JOIN lapTimes ON drivers.driverId = lapTimes.driverId WHERE lapTimes.raceId IN (SELECT raceId FROM races WHERE name = 'French Grand Prix') AND lapTimes.lap = 3 AND lapTimes.milliseconds = (     SELECT MAX(milliseconds)      FROM lapTimes      WHERE raceId IN (SELECT raceId FROM races WHERE name = 'French Grand Prix')      AND lap = 3 );	formula_1
SELECT r.name, r.year, lt.milliseconds  FROM races r  JOIN lapTimes lt ON r.raceId = lt.raceId  WHERE lt.lap = 1  ORDER BY lt.milliseconds ASC  LIMIT 1;	formula_1
SELECT AVG(     CAST(         substr(fastestLapTime, 1, instr(fastestLapTime, ':') - 1) * 60 +         substr(fastestLapTime, instr(fastestLapTime, ':') + 1)     AS REAL) )  FROM results  WHERE raceId = (     SELECT raceId      FROM races      WHERE year = 2006 AND name = 'United States Grand Prix' )  AND rank < 11;	formula_1
SELECT drivers.forename || ' ' || drivers.surname AS driver_name, AVG(pitStops.milliseconds / 1000.0) AS avg_duration FROM drivers INNER JOIN pitStops ON drivers.driverId = pitStops.driverId WHERE drivers.nationality = 'German' AND strftime('%Y', drivers.dob) BETWEEN '1980' AND '1985' GROUP BY drivers.driverId ORDER BY avg_duration ASC LIMIT 3;	formula_1
SELECT d.forename, d.surname, r.time  FROM results r  JOIN races rc ON r.raceId = rc.raceId  JOIN drivers d ON r.driverId = d.driverId  WHERE rc.name = 'Canadian Grand Prix'  AND rc.year = 2008  AND r.position = 1  AND r.statusId = 1;	formula_1
SELECT constructors.constructorRef, constructors.url FROM constructors JOIN constructorStandings ON constructors.constructorId = constructorStandings.constructorId WHERE constructorStandings.raceId = (     SELECT raceId      FROM races      WHERE year = 2009 AND name = 'Singapore Grand Prix' ) AND constructorStandings.position = 1;	formula_1
SELECT forename, surname, dob FROM drivers WHERE nationality = 'Austrian' AND YEAR(dob) BETWEEN 1981 AND 1991;	formula_1
SELECT forename || ' ' || surname AS full_name, url, dob FROM drivers WHERE nationality = 'German' AND strftime('%Y', dob) BETWEEN '1971' AND '1985' ORDER BY dob DESC;	formula_1
SELECT location, country, lat, lng FROM circuits WHERE name = 'Hungaroring';	formula_1
SELECT c.name, c.nationality, SUM(cr.points) AS total_points FROM races r JOIN constructorResults cr ON r.raceId = cr.raceId JOIN constructors c ON cr.constructorId = c.constructorId WHERE r.name = 'Monaco Grand Prix' AND r.year BETWEEN 1980 AND 2010 GROUP BY c.constructorId, c.name, c.nationality ORDER BY total_points DESC LIMIT 1;	formula_1
SELECT AVG(r.points)  FROM results r  JOIN drivers d ON r.driverId = d.driverId  JOIN races rc ON r.raceId = rc.raceId  WHERE d.forename = 'Lewis'  AND d.surname = 'Hamilton'  AND rc.name = 'Turkish Grand Prix';	formula_1
SELECT AVG(race_count)  FROM (     SELECT COUNT(*) AS race_count      FROM races      WHERE year BETWEEN 2000 AND 2010      GROUP BY year )	formula_1
SELECT nationality, COUNT(*) AS count  FROM drivers  GROUP BY nationality  ORDER BY count DESC  LIMIT 1;	formula_1
SELECT dw.total_wins FROM (     SELECT driverId, SUM(wins) AS total_wins     FROM driverStandings     GROUP BY driverId ) dw INNER JOIN (     SELECT driverId, RANK() OVER (ORDER BY SUM(points) DESC) AS points_rank     FROM driverStandings     GROUP BY driverId ) dp ON dw.driverId = dp.driverId WHERE dp.points_rank = 91;	formula_1
SELECT races.name FROM races JOIN results ON races.raceId = results.raceId WHERE results.fastestLapTime = (SELECT MIN(fastestLapTime) FROM results);	formula_1
SELECT circuits.name, circuits.location || ', ' || circuits.country AS full_location FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE races.date = (SELECT MAX(date) FROM races) ORDER BY races.date DESC LIMIT 1;	formula_1
SELECT d.forename || ' ' || d.surname AS full_name FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Marina Bay Street Circuit' AND r.year = 2008 AND q.position = 1;	formula_1
SELECT d.forename || ' ' || d.surname AS full_name, d.nationality, r.name AS first_race_name FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId WHERE d.dob = (SELECT MAX(dob) FROM drivers) ORDER BY r.date ASC LIMIT 1;	formula_1
SELECT MAX(accident_count) AS max_accidents FROM (     SELECT driverId, COUNT(*) AS accident_count     FROM results     WHERE raceId IN (SELECT raceId FROM races WHERE name = 'Canadian Grand Prix')       AND statusId = 3     GROUP BY driverId ) AS subquery;	formula_1
SELECT d.forename, d.surname,         (SELECT MAX(wins) FROM driverStandings WHERE driverId = d.driverId) AS total_wins FROM drivers d WHERE d.dob = (SELECT MIN(dob) FROM drivers);	formula_1
SELECT MAX(milliseconds) FROM pitStops;	formula_1
SELECT time FROM lapTimes ORDER BY milliseconds ASC LIMIT 1;	formula_1
SELECT MAX(CAST(duration AS REAL)) FROM pitStops WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton');	formula_1
SELECT ps.lap  FROM pitStops ps  JOIN races r ON ps.raceId = r.raceId  JOIN drivers d ON ps.driverId = d.driverId  WHERE r.year = 2011  AND r.name = 'Australian Grand Prix'  AND d.forename = 'Lewis'  AND d.surname = 'Hamilton'	formula_1
SELECT d.forename || ' ' || d.surname AS driver, SUM(CAST(p.duration AS REAL)) AS total_pit_time FROM pitStops p JOIN drivers d ON p.driverId = d.driverId WHERE p.raceId = (SELECT raceId FROM races WHERE year = 2011 AND name = 'Australian Grand Prix') GROUP BY p.driverId, driver;	formula_1
SELECT l.time  FROM lapTimes l  JOIN drivers d ON l.driverId = d.driverId  WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton'  ORDER BY l.milliseconds ASC  LIMIT 1;	formula_1
SELECT drivers.forename || ' ' || drivers.surname AS full_name FROM drivers JOIN (     SELECT driverId, MIN(time) AS shortest_time     FROM lapTimes     GROUP BY driverId ) AS driver_min ON drivers.driverId = driver_min.driverId ORDER BY driver_min.shortest_time LIMIT 20;	formula_1
SELECT lt.position  FROM lapTimes lt  JOIN drivers d ON lt.driverId = d.driverId  WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton'  AND lt.milliseconds = (     SELECT MIN(milliseconds)      FROM lapTimes      WHERE driverId = d.driverId );	formula_1
SELECT MIN(time) AS fastest_lap_time  FROM lapTimes  JOIN races ON lapTimes.raceId = races.raceId  WHERE races.name = 'Austrian Grand Prix';	formula_1
WITH FastestLaps AS (     SELECT c.name, lt.time, RANK() OVER (PARTITION BY c.circuitId ORDER BY lt.milliseconds) AS rnk     FROM circuits c     JOIN races r ON c.circuitId = r.circuitId     JOIN lapTimes lt ON r.raceId = lt.raceId     WHERE c.country = 'Italy' ) SELECT name, time FROM FastestLaps WHERE rnk = 1;	formula_1
SELECT r.* FROM races r JOIN lapTimes lt ON r.raceId = lt.raceId WHERE r.name = 'Austrian Grand Prix' AND lt.milliseconds = (     SELECT MIN(milliseconds)     FROM lapTimes     JOIN races ON lapTimes.raceId = races.raceId     WHERE races.name = 'Austrian Grand Prix' );	formula_1
SELECT SUM(pitStops.milliseconds) AS total_pit_stop_time FROM pitStops JOIN (     SELECT lt.driverId, lt.raceId     FROM lapTimes lt     JOIN races r ON lt.raceId = r.raceId     WHERE r.name = 'Austrian Grand Prix'     ORDER BY lt.milliseconds ASC     LIMIT 1 ) AS fastest_lap ON pitStops.driverId = fastest_lap.driverId AND pitStops.raceId = fastest_lap.raceId;	formula_1
SELECT c.lat, c.lng FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN lapTimes l ON r.raceId = l.raceId GROUP BY c.circuitId HAVING MIN(l.time) = '1:29.488';	formula_1
SELECT AVG(pitStops.milliseconds)  FROM pitStops  JOIN drivers ON pitStops.driverId = drivers.driverId  WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';	formula_1
SELECT AVG(lapTimes.milliseconds)  FROM lapTimes  JOIN races ON lapTimes.raceId = races.raceId  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE circuits.country = 'Italy';	formula_1
SELECT player_api_id FROM Player_Attributes WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)	european_football_2
SELECT player_name, height  FROM Player  ORDER BY height DESC  LIMIT 1;	european_football_2
SELECT preferred_foot  FROM Player_Attributes  WHERE potential = (SELECT MIN(potential) FROM Player_Attributes)	european_football_2
SELECT COUNT(DISTINCT pa.player_api_id)  FROM Player_Attributes pa  WHERE pa.overall_rating >= 60  AND pa.overall_rating < 65  AND pa.defensive_work_rate = 'low'	european_football_2
SELECT p.id, MAX(pa.crossing) AS max_crossing FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id GROUP BY p.id ORDER BY max_crossing DESC LIMIT 5;	european_football_2
SELECT L.name  FROM Match M  JOIN League L ON M.league_id = L.id  WHERE M.season = '2015/2016'  GROUP BY L.id, L.name  ORDER BY SUM(M.home_team_goal + M.away_team_goal) DESC  LIMIT 1;	european_football_2
SELECT t.team_long_name AS home_team, COUNT(*) AS total_losses FROM Match m JOIN Team t ON m.home_team_api_id = t.team_api_id WHERE m.season = '2015/2016' AND m.home_team_goal < m.away_team_goal GROUP BY m.home_team_api_id, t.team_long_name ORDER BY total_losses ASC LIMIT 1;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id GROUP BY p.player_api_id ORDER BY MAX(pa.penalties) DESC LIMIT 10;	european_football_2
SELECT Team.team_long_name FROM Match JOIN Team ON Match.away_team_api_id = Team.team_api_id WHERE Match.league_id = (SELECT id FROM League WHERE name = 'Scotland Premier League') AND Match.season = '2009/2010' AND Match.away_team_goal > Match.home_team_goal GROUP BY Match.away_team_api_id, Team.team_long_name ORDER BY COUNT(*) DESC LIMIT 1;	european_football_2
SELECT t.team_long_name, sub.max_speed FROM (     SELECT team_api_id, MAX(buildUpPlaySpeed) AS max_speed     FROM Team_Attributes     GROUP BY team_api_id     ORDER BY max_speed DESC     LIMIT 4 ) AS sub JOIN Team t ON sub.team_api_id = t.team_api_id;	european_football_2
SELECT League.name  FROM Match  JOIN League ON Match.league_id = League.id  WHERE Match.season = '2015/2016'  AND home_team_goal = away_team_goal  GROUP BY League.id, League.name  ORDER BY COUNT(*) DESC  LIMIT 1;	european_football_2
SELECT p.player_name, CAST((JULIANDAY('now') - JULIANDAY(p.birthday)) / 365.25 AS INTEGER) AS current_age FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.sprint_speed >= 97  AND strftime('%Y', pa.date) BETWEEN '2013' AND '2015';	european_football_2
SELECT l.name, m.total_matches  FROM (     SELECT league_id, COUNT(*) AS total_matches      FROM Match      GROUP BY league_id ) m  JOIN League l ON m.league_id = l.id  ORDER BY m.total_matches DESC  LIMIT 1;	european_football_2
SELECT SUM(height) / COUNT(id) AS average_height  FROM Player  WHERE birthday >= '1990-01-01 00:00:00'  AND birthday < '1996-01-01 00:00:00'	european_football_2
SELECT DISTINCT player_api_id FROM Player_Attributes WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes WHERE substr(date,1,4) = '2010') AND substr(date,1,4) = '2010';	european_football_2
SELECT team_fifa_api_id  FROM Team  JOIN Team_Attributes  ON Team.team_fifa_api_id = Team_Attributes.team_fifa_api_id  WHERE buildUpPlaySpeed > 50 AND buildUpPlaySpeed < 60;	european_football_2
SELECT Team.team_long_name  FROM Team  JOIN Team_Attributes ON Team.team_api_id = Team_Attributes.team_api_id  WHERE strftime('%Y', Team_Attributes.date) = '2012'  AND Team_Attributes.buildUpPlayPassing > (     SELECT AVG(buildUpPlayPassing)      FROM Team_Attributes      WHERE strftime('%Y', date) = '2012'      AND buildUpPlayPassing IS NOT NULL );	european_football_2
SELECT (SUM(CASE WHEN pa.preferred_foot = 'left' THEN 1 ELSE 0 END) * 100.0 / COUNT(pa.player_fifa_api_id)) AS percentage FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE strftime('%Y', p.birthday) BETWEEN '1987' AND '1992'	european_football_2
SELECT l.name, SUM(m.home_team_goal + m.away_team_goal) AS total_goals FROM League l JOIN Match m ON l.id = m.league_id GROUP BY l.id, l.name ORDER BY total_goals ASC LIMIT 5;	european_football_2
SELECT SUM(pa.long_shots) / COUNT(pa.player_fifa_api_id) AS average_long_shots FROM Player p JOIN Player_Attributes pa ON p.player_fifa_api_id = pa.player_fifa_api_id WHERE p.player_name = 'Ahmed Samir Farag';	european_football_2
SELECT p.player_name, AVG(pa.heading_accuracy) AS avg_head FROM Player p JOIN Player_Attributes pa ON p.player_fifa_api_id = pa.player_fifa_api_id WHERE p.height > 180 GROUP BY p.id ORDER BY avg_head DESC LIMIT 10;	european_football_2
WITH TeamAverages AS (     SELECT          t.team_long_name,         AVG(ta.chanceCreationPassing) AS team_avg     FROM Team_Attributes ta     JOIN Team t          ON ta.team_api_id = t.team_api_id          OR ta.team_fifa_api_id = t.team_fifa_api_id      WHERE          ta.buildUpPlayDribblingClass = 'Normal'         AND ta.date BETWEEN '2014-01-01 00:00:00' AND '2014-01-31 00:00:00'     GROUP BY          t.team_api_id, t.team_long_name ), OverallAverage AS (     SELECT AVG(team_avg) AS overall_avg FROM TeamAverages ) SELECT      team_long_name FROM TeamAverages, OverallAverage WHERE team_avg < overall_avg ORDER BY team_avg DESC;	european_football_2
SELECT League.name  FROM Match  JOIN League ON Match.league_id = League.id  WHERE Match.season = '2009/2010'  GROUP BY League.id  HAVING AVG(home_team_goal) > AVG(away_team_goal);	european_football_2
SELECT team_short_name  FROM Team  WHERE team_long_name = 'Queens Park Rangers';	european_football_2
SELECT player_name  FROM Player  WHERE substr(birthday, 1, 7) = '1970-10';	european_football_2
SELECT pa.attacking_work_rate FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name = 'Franco Zennaro';	european_football_2
SELECT ta.buildupplaypositioningclass  FROM Team t  JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id  WHERE t.team_long_name = 'ADO Den Haag'  ORDER BY ta.date DESC  LIMIT 1;	european_football_2
SELECT pa.heading_accuracy  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.player_name = 'Francois Affolter'  AND pa.date = '2014-09-18 00:00:00';	european_football_2
SELECT pa.overall_rating FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name = 'Gabriel Tamas' AND strftime('%Y', pa.date) = '2011';	european_football_2
SELECT COUNT(*)  FROM Match  JOIN League ON Match.league_id = League.id  WHERE League.name = 'Scotland Premier League'  AND Match.season = '2015/2016';	european_football_2
SELECT pa.preferred_foot  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.birthday = (SELECT MAX(birthday) FROM Player);	european_football_2
SELECT Player.player_name  FROM Player  JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id  WHERE Player_Attributes.potential = (SELECT MAX(potential) FROM Player_Attributes)	european_football_2
SELECT COUNT(DISTINCT p.player_api_id)  FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.weight < 130 AND pa.preferred_foot = 'left';	european_football_2
SELECT DISTINCT T.team_short_name FROM Team T JOIN Team_Attributes TA ON T.team_api_id = TA.team_api_id WHERE TA.chanceCreationPassingClass = 'Risky';	european_football_2
SELECT pa.defensive_work_rate  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.player_name = 'David Wilson'  ORDER BY pa.date DESC  LIMIT 1;	european_football_2
SELECT P.birthday  FROM Player P  JOIN Player_Attributes PA ON P.player_api_id = PA.player_api_id  WHERE PA.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)	european_football_2
SELECT League.name  FROM League  JOIN Country ON League.country_id = Country.id  WHERE Country.name = 'Netherlands';	european_football_2
SELECT AVG(home_team_goal) AS average_home_team_goal  FROM Match  JOIN Country ON Match.country_id = Country.id  WHERE Country.name = 'Poland' AND season = '2010/2011'	european_football_2
SELECT MAX(avg_finishing) AS highest_avg FROM (     SELECT AVG(pa.finishing) AS avg_finishing     FROM Player p     JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id     WHERE p.height = (SELECT MAX(height) FROM Player)     UNION ALL     SELECT AVG(pa.finishing) AS avg_finishing     FROM Player p     JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id     WHERE p.height = (SELECT MIN(height) FROM Player) );	european_football_2
SELECT player_name FROM Player WHERE height > 180;	european_football_2
SELECT COUNT(*) FROM Player WHERE strftime('%Y', birthday) = '1990'	european_football_2
SELECT COUNT(*)  FROM Player  WHERE player_name LIKE 'Adam%'  AND weight > 170;	european_football_2
SELECT DISTINCT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating > 80 AND strftime('%Y', pa.date) BETWEEN '2008' AND '2010'	european_football_2
SELECT pa.potential  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.player_name = 'Aaron Doran';	european_football_2
SELECT DISTINCT p.player_name  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE pa.preferred_foot = 'left';	european_football_2
SELECT DISTINCT t.team_long_name FROM Team t JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id WHERE ta.buildUpPlaySpeedClass = 'Fast'	european_football_2
SELECT ta.buildUpPlayPassingClass  FROM Team t  JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id  WHERE t.team_short_name = 'CLB';	european_football_2
SELECT DISTINCT t.team_short_name FROM Team t JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id WHERE ta.buildUpPlayPassing > 70;	european_football_2
SELECT SUM(t2.overall_rating)*1.0 / COUNT(t2.id) AS average_overall_rating FROM Player t1 JOIN Player_Attributes t2 ON t1.player_api_id = t2.player_api_id WHERE t1.height > 170  AND strftime('%Y', t2.date) BETWEEN '2010' AND '2015'	european_football_2
SELECT player_name, MIN(height) AS shortest_height FROM Player GROUP BY player_name ORDER BY shortest_height LIMIT 1;	european_football_2
SELECT Country.name  FROM League  JOIN Country ON League.country_id = Country.id  WHERE League.name = 'Italy Serie A';	european_football_2
SELECT Team.team_short_name  FROM Team  JOIN Team_Attributes  ON Team.team_api_id = Team_Attributes.team_api_id  WHERE Team_Attributes.buildUpPlaySpeed = 31  AND Team_Attributes.buildUpPlayDribbling = 53  AND Team_Attributes.buildUpPlayPassing = 32;	european_football_2
SELECT AVG(overall_rating)  FROM Player_Attributes  JOIN Player ON Player.player_api_id = Player_Attributes.player_api_id  WHERE Player.player_name = 'Aaron Doran'	european_football_2
SELECT COUNT(*)  FROM Match  WHERE league_id = 7809  AND strftime('%Y-%m', date) BETWEEN '2008-08' AND '2008-10';	european_football_2
SELECT DISTINCT team_short_name  FROM Team  JOIN Match ON Team.team_api_id = Match.home_team_api_id  WHERE Match.home_team_goal = 10;	european_football_2
SELECT DISTINCT P.player_name FROM Player P JOIN Player_Attributes PA ON P.player_api_id = PA.player_api_id WHERE PA.potential = 61  AND PA.balance = (SELECT MAX(balance) FROM Player_Attributes WHERE potential = 61)	european_football_2
SELECT      (SELECT AVG(ball_control)       FROM Player p       JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id       WHERE p.player_name = 'Abdou Diallo')      -      (SELECT AVG(ball_control)       FROM Player p       JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id       WHERE p.player_name = 'Aaron Appindangoye') AS difference	european_football_2
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN';	european_football_2
SELECT player_name  FROM Player  WHERE player_name IN ('Aaron Lennon', 'Abdelaziz Barrada')  ORDER BY birthday ASC  LIMIT 1	european_football_2
SELECT player_name  FROM Player  WHERE height = (SELECT MAX(height) FROM Player);	european_football_2
SELECT COUNT(DISTINCT pa.player_api_id)  FROM Player_Attributes pa  WHERE pa.preferred_foot = 'left'  AND pa.attacking_work_rate = 'low';	european_football_2
SELECT Country.name  FROM League  JOIN Country ON League.country_id = Country.id  WHERE League.name = 'Belgium Jupiler League';	european_football_2
SELECT l.name  FROM League l  JOIN Country c ON l.country_id = c.id  WHERE c.name = 'Germany';	european_football_2
SELECT p.player_name  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE pa.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT COUNT(DISTINCT p.player_api_id)  FROM Player p  JOIN Player_Attributes pa  ON p.player_api_id = pa.player_api_id  WHERE strftime('%Y', p.birthday) < '1986'  AND pa.defensive_work_rate = 'high'	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone') GROUP BY p.player_name ORDER BY MAX(pa.crossing) DESC LIMIT 1;	european_football_2
SELECT pa.heading_accuracy  FROM Player_Attributes pa  JOIN Player p ON pa.player_api_id = p.player_api_id  WHERE p.player_name = 'Ariel Borysiuk'  ORDER BY pa.date DESC  LIMIT 1;	european_football_2
SELECT COUNT(DISTINCT p.player_api_id)  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.height > 180  AND pa.volleys > 70;	european_football_2
SELECT DISTINCT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.volleys > 70 AND pa.dribbling > 70;	european_football_2
SELECT COUNT(*)  FROM Match  WHERE country_id = (SELECT id FROM Country WHERE name = 'Belgium')  AND season = '2008/2009';	european_football_2
SELECT pa.long_passing  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.birthday = (SELECT MIN(birthday) FROM Player)  ORDER BY pa.date DESC  LIMIT 1;	european_football_2
SELECT COUNT(*)  FROM Match  WHERE league_id = 1  AND SUBSTR(`date`, 1, 7) = '2009-04'	european_football_2
SELECT League.name  FROM Match  JOIN League ON Match.league_id = League.id  WHERE Match.season = '2008/2009'  GROUP BY League.name  ORDER BY COUNT(*) DESC  LIMIT 1;	european_football_2
SELECT SUM(pa.overall_rating) * 1.0 / COUNT(pa.id) AS average_rating  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE strftime('%Y', p.birthday) < '1986'	european_football_2
SELECT    (((     (SELECT pa.overall_rating       FROM Player p       JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id       WHERE p.player_name = 'Ariel Borysiuk'     )      -      (SELECT pa.overall_rating       FROM Player p       JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id       WHERE p.player_name = 'Paulin Puel'     )   )    /    (SELECT pa.overall_rating     FROM Player p     JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id     WHERE p.player_name = 'Paulin Puel'   ))    * 100) AS percentage_diff;	european_football_2
SELECT AVG(buildUpPlaySpeed)  FROM Team_Attributes  WHERE team_fifa_api_id = (     SELECT team_fifa_api_id      FROM Team      WHERE team_long_name = 'Heart of Midlothian' )	european_football_2
SELECT AVG(pa.overall_rating)  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.player_name = 'Pietro Marino'	european_football_2
SELECT SUM(crossing)  FROM Player  JOIN Player_Attributes USING (player_api_id)  WHERE player_name = 'Aaron Lennox'	european_football_2
SELECT ta.chanceCreationPassing, ta.chanceCreationPassingClass FROM Team_Attributes ta JOIN Team t ON ta.team_api_id = t.team_api_id WHERE t.team_long_name = 'Ajax' ORDER BY ta.chanceCreationPassing DESC LIMIT 1;	european_football_2
SELECT preferred_foot  FROM Player_Attributes  JOIN Player ON Player.player_api_id = Player_Attributes.player_api_id  WHERE Player.player_name = 'Abdou Diallo';	european_football_2
SELECT MAX(pa.overall_rating)  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.player_name = 'Dorlan Pabon'	european_football_2
SELECT AVG(away_team_goal) FROM Match JOIN Team ON Match.away_team_api_id = Team.team_api_id WHERE Team.team_long_name = 'Parma' AND Match.country_id = 10257;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating = 77 AND pa.date LIKE '2016-06-23%' ORDER BY p.birthday ASC LIMIT 1;	european_football_2
SELECT pa.overall_rating FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name = 'Aaron Mooy' AND pa.date LIKE '2016-02-04%';	european_football_2
SELECT pa.potential  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.player_name = 'Francesco Parravicini'  AND pa.date = '2010-08-30 00:00:00'	european_football_2
SELECT pa.attacking_work_rate  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.player_name = 'Francesco Migliore'  AND pa.date LIKE '2015-05-01%';	european_football_2
SELECT pa.defensive_work_rate  FROM Player_Attributes pa  JOIN Player p ON pa.player_api_id = p.player_api_id  WHERE p.player_name = 'Kevin Berigaud'  AND pa.date = '2013-02-22 00:00:00'	european_football_2
SELECT MIN(pa.date)  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.player_name = 'Kevin Constant'      AND pa.crossing = (SELECT MAX(crossing) FROM Player_Attributes WHERE player_api_id = p.player_api_id);	european_football_2
SELECT ta.buildupplay_speedclass  FROM Team t  JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id  WHERE t.team_long_name = 'Willem II'  AND ta.date = '2012-02-22';	european_football_2
SELECT ta.buildUpPlayDribblingClass  FROM Team t  JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id  WHERE t.team_short_name = 'LEI'  AND ta.date = '2015-09-10 00:00:00';	european_football_2
SELECT Team_Attributes.buildUpPlayPassingClass  FROM Team  JOIN Team_Attributes  ON Team.team_api_id = Team_Attributes.team_api_id  WHERE Team.team_long_name = 'FC Lorient'  AND Team_Attributes.date LIKE '2010-02-22%';	european_football_2
SELECT ta.chanceCreationPassingClass  FROM Team t  JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id  WHERE t.team_long_name = 'PEC Zwolle'  AND ta.date = '2013-09-20 00:00:00';	european_football_2
SELECT ta.chanceCreationCrossingClass  FROM Team t  JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id  WHERE t.team_long_name = 'Hull City'  AND ta.date = '2010-02-22 00:00:00'	european_football_2
SELECT ta.defenceAggressionClass  FROM Team t  JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id  WHERE t.team_long_name = 'Hannover 96'  AND ta.date LIKE '2015-09-10%';	european_football_2
SELECT AVG(pa.overall_rating)  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.player_name = 'Marko Arnautovic'  AND pa.date BETWEEN '2007-02-22' AND '2016-04-21';	european_football_2
SELECT ((l.landon_rating - j.jordan_rating) / l.landon_rating * 100) AS percentage FROM (     SELECT pa.overall_rating AS landon_rating     FROM Player p     JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id     WHERE p.player_name = 'Landon Donovan' AND pa.date = '2013/7/12' ) l, (     SELECT pa.overall_rating AS jordan_rating     FROM Player p     JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id     WHERE p.player_name = 'Jordan Bowery' AND pa.date = '2013/7/12' ) j;	european_football_2
SELECT player_name FROM Player WHERE height = (SELECT MAX(height) FROM Player);	european_football_2
SELECT player_api_id  FROM Player  WHERE weight IS NOT NULL  ORDER BY weight DESC  LIMIT 10;	european_football_2
SELECT player_name  FROM Player  WHERE datetime(birthday, '+35 years') <= datetime('now');	european_football_2
SELECT SUM(m.home_team_goal)  FROM Match m WHERE      m.home_player_1 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon')      OR m.home_player_2 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon')      OR m.home_player_3 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon')      OR m.home_player_4 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon')      OR m.home_player_5 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon')      OR m.home_player_6 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon')      OR m.home_player_7 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon')      OR m.home_player_8 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon')      OR m.home_player_9 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon')      OR m.home_player_10 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon')      OR m.home_player_11 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon');	european_football_2
SELECT SUM(m.away_team_goal)  FROM Match m WHERE      m.away_player_1 IN (SELECT player_api_id FROM Player WHERE player_name IN ('Daan Smith', 'Filipe Ferreira'))      OR m.away_player_2 IN (SELECT player_api_id FROM Player WHERE player_name IN ('Daan Smith', 'Filipe Ferreira'))      OR m.away_player_3 IN (SELECT player_api_id FROM Player WHERE player_name IN ('Daan Smith', 'Filipe Ferreira'))      OR m.away_player_4 IN (SELECT player_api_id FROM Player WHERE player_name IN ('Daan Smith', 'Filipe Ferreira'))      OR m.away_player_5 IN (SELECT player_api_id FROM Player WHERE player_name IN ('Daan Smith', 'Filipe Ferreira'))      OR m.away_player_6 IN (SELECT player_api_id FROM Player WHERE player_name IN ('Daan Smith', 'Filipe Ferreira'))      OR m.away_player_7 IN (SELECT player_api_id FROM Player WHERE player_name IN ('Daan Smith', 'Filipe Ferreira'))      OR m.away_player_8 IN (SELECT player_api_id FROM Player WHERE player_name IN ('Daan Smith', 'Filipe Ferreira'))      OR m.away_player_9 IN (SELECT player_api_id FROM Player WHERE player_name IN ('Daan Smith', 'Filipe Ferreira'))      OR m.away_player_10 IN (SELECT player_api_id FROM Player WHERE player_name IN ('Daan Smith', 'Filipe Ferreira'))      OR m.away_player_11 IN (SELECT player_api_id FROM Player WHERE player_name IN ('Daan Smith', 'Filipe Ferreira'));	european_football_2
SELECT SUM(m.home_team_goal) AS total_goals FROM Match m WHERE EXISTS (     SELECT 1     FROM Player p     WHERE p.player_api_id IN (         m.home_player_1, m.home_player_2, m.home_player_3, m.home_player_4,         m.home_player_5, m.home_player_6, m.home_player_7, m.home_player_8,         m.home_player_9, m.home_player_10, m.home_player_11     )     AND ((julianday('now') - julianday(p.birthday)) / 365.25) <= 30 );	european_football_2
SELECT p.player_name  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE pa.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT DISTINCT p.player_name  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE pa.potential = (SELECT MAX(potential) FROM Player_Attributes);	european_football_2
SELECT DISTINCT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.attacking_work_rate = 'high';	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.finishing = 1 ORDER BY (julianday('now') - julianday(p.birthday)) DESC LIMIT 1;	european_football_2
SELECT DISTINCT p.player_name FROM Player p WHERE p.player_api_id IN (     SELECT home_player_1 FROM Match WHERE league_id IN (SELECT id FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Belgium'))     UNION ALL SELECT home_player_2 FROM Match WHERE league_id IN (SELECT id FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Belgium'))     UNION ALL SELECT home_player_3 FROM Match WHERE league_id IN (SELECT id FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Belgium'))     UNION ALL SELECT home_player_4 FROM Match WHERE league_id IN (SELECT id FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Belgium'))     UNION ALL SELECT home_player_5 FROM Match WHERE league_id IN (SELECT id FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Belgium'))     UNION ALL SELECT home_player_6 FROM Match WHERE league_id IN (SELECT id FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Belgium'))     UNION ALL SELECT home_player_7 FROM Match WHERE league_id IN (SELECT id FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Belgium'))     UNION ALL SELECT home_player_8 FROM Match WHERE league_id IN (SELECT id FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Belgium'))     UNION ALL SELECT home_player_9 FROM Match WHERE league_id IN (SELECT id FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Belgium'))     UNION ALL SELECT home_player_10 FROM Match WHERE league_id IN (SELECT id FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Belgium'))     UNION ALL SELECT home_player_11 FROM Match WHERE league_id IN (SELECT id FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Belgium'))     UNION ALL SELECT away_player_1 FROM Match WHERE league_id IN (SELECT id FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Belgium'))     UNION ALL SELECT away_player_2 FROM Match WHERE league_id IN (SELECT id FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Belgium'))     UNION ALL SELECT away_player_3 FROM Match WHERE league_id IN (SELECT id FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Belgium'))     UNION ALL SELECT away_player_4 FROM Match WHERE league_id IN (SELECT id FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Belgium'))     UNION ALL SELECT away_player_5 FROM Match WHERE league_id IN (SELECT id FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Belgium'))     UNION ALL SELECT away_player_6 FROM Match WHERE league_id IN (SELECT id FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Belgium'))     UNION ALL SELECT away_player_7 FROM Match WHERE league_id IN (SELECT id FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Belgium'))     UNION ALL SELECT away_player_8 FROM Match WHERE league_id IN (SELECT id FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Belgium'))     UNION ALL SELECT away_player_9 FROM Match WHERE league_id IN (SELECT id FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Belgium'))     UNION ALL SELECT away_player_10 FROM Match WHERE league_id IN (SELECT id FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Belgium'))     UNION ALL SELECT away_player_11 FROM Match WHERE league_id IN (SELECT id FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Belgium')) );	european_football_2
SELECT DISTINCT p.player_name, c.name FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id JOIN Match m ON p.player_api_id IN (     m.home_player_1, m.home_player_2, m.home_player_3, m.home_player_4, m.home_player_5, m.home_player_6, m.home_player_7, m.home_player_8, m.home_player_9, m.home_player_10, m.home_player_11,     m.away_player_1, m.away_player_2, m.away_player_3, m.away_player_4, m.away_player_5, m.away_player_6, m.away_player_7, m.away_player_8, m.away_player_9, m.away_player_10, m.away_player_11 ) JOIN League l ON m.league_id = l.id JOIN Country c ON l.country_id = c.id WHERE pa.vision >= 90;	european_football_2
WITH all_players AS (     SELECT league_id, home_player_1 AS player_api_id FROM Match     UNION ALL SELECT league_id, home_player_2 FROM Match     UNION ALL SELECT league_id, home_player_3 FROM Match     UNION ALL SELECT league_id, home_player_4 FROM Match     UNION ALL SELECT league_id, home_player_5 FROM Match     UNION ALL SELECT league_id, home_player_6 FROM Match     UNION ALL SELECT league_id, home_player_7 FROM Match     UNION ALL SELECT league_id, home_player_8 FROM Match     UNION ALL SELECT league_id, home_player_9 FROM Match     UNION ALL SELECT league_id, home_player_10 FROM Match     UNION ALL SELECT league_id, home_player_11 FROM Match     UNION ALL SELECT league_id, away_player_1 FROM Match     UNION ALL SELECT league_id, away_player_2 FROM Match     UNION ALL SELECT league_id, away_player_3 FROM Match     UNION ALL SELECT league_id, away_player_4 FROM Match     UNION ALL SELECT league_id, away_player_5 FROM Match     UNION ALL SELECT league_id, away_player_6 FROM Match     UNION ALL SELECT league_id, away_player_7 FROM Match     UNION ALL SELECT league_id, away_player_8 FROM Match     UNION ALL SELECT league_id, away_player_9 FROM Match     UNION ALL SELECT league_id, away_player_10 FROM Match     UNION ALL SELECT league_id, away_player_11 FROM Match ), country_players AS (     SELECT DISTINCT L.country_id, P.weight     FROM all_players ap     JOIN League L ON ap.league_id = L.id     JOIN Player P ON ap.player_api_id = P.player_api_id ) SELECT C.name FROM country_players cp JOIN Country C ON cp.country_id = C.id GROUP BY C.name ORDER BY AVG(cp.weight) DESC LIMIT 1;	european_football_2
SELECT t.team_long_name FROM Team t JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id WHERE ta.buildUpPlaySpeedClass = 'Slow';	european_football_2
SELECT DISTINCT T.team_short_name FROM Team T JOIN Team_Attributes TA ON T.team_api_id = TA.team_api_id WHERE TA.chanceCreationPassingClass = 'Safe'	european_football_2
SELECT AVG(p.height)  FROM Player p JOIN (     SELECT DISTINCT player_api_id      FROM (         SELECT home_player_1 AS player_api_id FROM Match WHERE league_id IN (SELECT id FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy'))         UNION ALL         SELECT home_player_2 FROM Match WHERE league_id IN (SELECT id FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy'))         UNION ALL         SELECT home_player_3 FROM Match WHERE league_id IN (SELECT id FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy'))         UNION ALL         SELECT home_player_4 FROM Match WHERE league_id IN (SELECT id FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy'))         UNION ALL         SELECT home_player_5 FROM Match WHERE league_id IN (SELECT id FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy'))         UNION ALL         SELECT home_player_6 FROM Match WHERE league_id IN (SELECT id FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy'))         UNION ALL         SELECT home_player_7 FROM Match WHERE league_id IN (SELECT id FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy'))         UNION ALL         SELECT home_player_8 FROM Match WHERE league_id IN (SELECT id FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy'))         UNION ALL         SELECT home_player_9 FROM Match WHERE league_id IN (SELECT id FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy'))         UNION ALL         SELECT home_player_10 FROM Match WHERE league_id IN (SELECT id FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy'))         UNION ALL         SELECT home_player_11 FROM Match WHERE league_id IN (SELECT id FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy'))         UNION ALL         SELECT away_player_1 FROM Match WHERE league_id IN (SELECT id FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy'))         UNION ALL         SELECT away_player_2 FROM Match WHERE league_id IN (SELECT id FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy'))         UNION ALL         SELECT away_player_3 FROM Match WHERE league_id IN (SELECT id FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy'))         UNION ALL         SELECT away_player_4 FROM Match WHERE league_id IN (SELECT id FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy'))         UNION ALL         SELECT away_player_5 FROM Match WHERE league_id IN (SELECT id FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy'))         UNION ALL         SELECT away_player_6 FROM Match WHERE league_id IN (SELECT id FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy'))         UNION ALL         SELECT away_player_7 FROM Match WHERE league_id IN (SELECT id FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy'))         UNION ALL         SELECT away_player_8 FROM Match WHERE league_id IN (SELECT id FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy'))         UNION ALL         SELECT away_player_9 FROM Match WHERE league_id IN (SELECT id FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy'))         UNION ALL         SELECT away_player_10 FROM Match WHERE league_id IN (SELECT id FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy'))         UNION ALL         SELECT away_player_11 FROM Match WHERE league_id IN (SELECT id FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy'))     ) ) AS players ON p.player_api_id = players.player_api_id;	european_football_2
SELECT player_name  FROM Player  WHERE height > 180  ORDER BY player_name ASC  LIMIT 3;	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND birthday > '1990'	european_football_2
SELECT (p6.jumping - p23.jumping) AS difference FROM (     SELECT jumping      FROM Player      JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id     WHERE Player.id = 6     ORDER BY date DESC      LIMIT 1 ) AS p6, (     SELECT jumping      FROM Player      JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id     WHERE Player.id = 23     ORDER BY date DESC      LIMIT 1 ) AS p23;	european_football_2
SELECT p.id FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.preferred_foot = 'right' AND pa.potential = (SELECT MIN(potential) FROM Player_Attributes WHERE preferred_foot = 'right') ORDER BY pa.potential, p.id LIMIT 5;	european_football_2
SELECT COUNT(DISTINCT pa.player_api_id)  FROM Player_Attributes pa WHERE pa.crossing = (SELECT MAX(crossing) FROM Player_Attributes WHERE preferred_foot = 'left') AND pa.preferred_foot = 'left';	european_football_2
SELECT      (CAST(COUNT(DISTINCT pa.player_api_id) AS REAL) /       (SELECT COUNT(DISTINCT pa2.player_api_id) FROM Player_Attributes pa2)) * 100 AS percentage FROM Player_Attributes pa WHERE pa.strength > 80 AND pa.stamina > 80;	european_football_2
SELECT Country.name  FROM Country  JOIN League ON Country.id = League.country_id  WHERE League.name = 'Poland Ekstraklasa'	european_football_2
SELECT home_team_goal, away_team_goal FROM Match JOIN League ON Match.league_id = League.id WHERE Match.date LIKE '2008-09-24%'  AND League.name = 'Belgium Jupiler League'	european_football_2
SELECT pa.sprint_speed, pa.agility, pa.acceleration FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name = 'Alexis Blin' ORDER BY pa.date DESC LIMIT 1;	european_football_2
SELECT ta.buildUpPlaySpeedClass  FROM Team t  JOIN Team_Attributess ta ON t.team_api_id = ta.team_api_id  WHERE t.team_long_name = 'KSV Cercle Brugge';	european_football_2
SELECT COUNT(*) FROM Match WHERE season = '2015/2016' AND league_id = 10257;	european_football_2
SELECT MAX(home_team_goal) FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Netherlands Eredivisie');	european_football_2
SELECT pa.finishing, pa.curve FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.weight = (SELECT MAX(weight) FROM Player);	european_football_2
SELECT League.name, COUNT(Match.id) AS match_count FROM Match JOIN League ON Match.league_id = League.id WHERE Match.season = '2015/2016' GROUP BY League.id ORDER BY match_count DESC LIMIT 4;	european_football_2
SELECT Team.team_long_name  FROM Match  JOIN Team ON Match.away_team_api_id = Team.team_api_id  WHERE Match.away_team_goal = (SELECT MAX(away_team_goal) FROM Match)	european_football_2
SELECT p.player_name  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE pa.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)  LIMIT 1;	european_football_2
SELECT (CAST(COUNT(CASE WHEN p.height < 180 AND pa.overall_rating > 70 THEN 1 END) AS REAL) / COUNT(p.id)) * 100 AS percentage FROM Player p LEFT JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id;	european_football_2
SELECT      SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) AS inpatient_count,     SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END) AS outpatient_count,     (SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) * 1.0 / NULLIF(SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END), 0)) AS percentage FROM Patient WHERE SEX = 'M';	thrombosis_prediction
SELECT (COUNT(CASE WHEN YEAR(Birthday) > 1930 THEN 1 END) / COUNT(*)) * 100 AS percentage FROM Patient WHERE SEX = 'F';	thrombosis_prediction
SELECT      (COUNT(CASE WHEN Admission = '+' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM Patient WHERE Birthday BETWEEN '1930-01-01' AND '1940-12-31'	thrombosis_prediction
SELECT      (SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) /       SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END)) AS ratio FROM Patient WHERE Diagnosis = 'SLE';	thrombosis_prediction
SELECT p.Diagnosis, l.Date  FROM Patient p  LEFT JOIN Laboratory l ON p.ID = l.ID  WHERE p.ID = 30609;	thrombosis_prediction
SELECT Patient.SEX, Patient.Birthday, Examination.`Examination Date`, Examination.Symptoms  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE Patient.ID = 163109;	thrombosis_prediction
SELECT DISTINCT p.ID, p.SEX, p.Birthday  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.LDH > 500;	thrombosis_prediction
SELECT P.ID, (YEAR(CURRENT_TIMESTAMP) - YEAR(P.Birthday)) AS age FROM Patient P WHERE EXISTS (     SELECT 1      FROM Examination E      WHERE E.ID = P.ID      AND E.RVVT = '+' );	thrombosis_prediction
SELECT DISTINCT p.ID, p.SEX, p.Diagnosis  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.Thrombosis = 2;	thrombosis_prediction
SELECT DISTINCT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE YEAR(Patient.Birthday) = 1937 AND Laboratory.`T-CHO` >= 250;	thrombosis_prediction
SELECT DISTINCT p.ID, p.SEX, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.ALB < 3.5;	thrombosis_prediction
SELECT      (         (SELECT COUNT(DISTINCT p.ID)           FROM Patient p           JOIN Laboratory l ON p.ID = l.ID           WHERE p.SEX = 'F'             AND (l.TP < 6.0 OR l.TP > 8.5)         )          /          (SELECT COUNT(*)           FROM Patient           WHERE SEX = 'F'         )     ) * 100 AS percentage;	thrombosis_prediction
SELECT AVG(`aCL IgG`)  FROM Examination  JOIN Patient USING (`ID`) WHERE Patient.Admission = '+'  AND (YEAR(CURDATE()) - YEAR(Patient.Birthday)) >= 50;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND YEAR(Description) = 1997 AND Admission = '-';	thrombosis_prediction
SELECT MIN(YEAR(`First Date`) - YEAR(`Birthday`)) FROM Patient WHERE `First Date` IS NOT NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE YEAR(e.`Examination Date`) = 1997  AND e.Thrombosis = 1  AND p.SEX = 'F'	thrombosis_prediction
SELECT MAX(YEAR(`Birthday`) - MIN(YEAR(`Birthday`))  FROM `Patient`  WHERE `ID` IN (SELECT `ID` FROM `Laboratory` WHERE `TG` >= 200);	thrombosis_prediction
SELECT E.Symptoms, P.Diagnosis  FROM Patient P  JOIN Examination E ON P.ID = E.ID  WHERE P.Birthday = (SELECT MAX(Birthday) FROM Patient)  AND E.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT COUNT(L.ID) / 12 AS average FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.Date BETWEEN '1998-01-01' AND '1998-12-31';	thrombosis_prediction
SELECT      (SELECT MAX(`Date`) FROM Laboratory WHERE ID = p.ID) AS LabCompletionDate,     TIMESTAMPDIFF(YEAR, p.Birthday, p.FirstDate) AS AgeAtFirstVisit FROM Patient p WHERE p.Diagnosis = 'SJS' AND p.Birthday = (SELECT MIN(Birthday) FROM Patient WHERE Diagnosis = 'SJS');	thrombosis_prediction
SELECT      (SUM(CASE WHEN p.SEX = 'M' AND l.UA <= 8.0 THEN 1 ELSE 0 END) /       SUM(CASE WHEN p.SEX = 'F' AND l.UA <= 6.5 THEN 1 ELSE 0 END))  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID;	thrombosis_prediction
SELECT COUNT(*) FROM (     SELECT p.ID     FROM Patient p     LEFT JOIN Examination e ON p.ID = e.ID     GROUP BY p.ID     HAVING          (MIN(e.`Examination Date`) IS NULL) OR          (YEAR(MIN(e.`Examination Date`)) - YEAR(p.`First Date`) >= 1) ) AS patients;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID)  FROM Examination e  INNER JOIN Patient p ON e.ID = p.ID  WHERE YEAR(e.`Examination Date`) BETWEEN 1990 AND 1993  AND (YEAR(e.`Examination Date`) - YEAR(p.Birthday)) < 18;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.`T-BIL` >= 2.0;	thrombosis_prediction
SELECT Diagnosis, COUNT(*) as cnt FROM Patient WHERE ID IN (     SELECT DISTINCT ID FROM Examination     WHERE `Examination Date` BETWEEN '1985-01-01' AND '1995-12-31' ) GROUP BY Diagnosis ORDER BY cnt DESC LIMIT 1;	thrombosis_prediction
SELECT AVG(1999 - YEAR(P.Birthday))  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.Date BETWEEN '1991-10-01' AND '1991-10-30'	thrombosis_prediction
SELECT (YEAR(l.Date) - YEAR(p.Birthday)) AS age, p.Diagnosis FROM Laboratory l JOIN Patient p ON l.ID = p.ID WHERE l.HGB = (SELECT MAX(HGB) FROM Laboratory);	thrombosis_prediction
SELECT ANA FROM Examination WHERE ID = 3605340 AND `Examination Date` = '1996-12-02';	thrombosis_prediction
SELECT CASE WHEN `T-CHO` < 250 THEN 'Yes' ELSE 'No' END  FROM Laboratory  WHERE ID = 2927464 AND `Date` = '1995-09-04';	thrombosis_prediction
SELECT SEX  FROM Patient  WHERE Diagnosis LIKE '%AORTITIS%'  ORDER BY `First Date` ASC  LIMIT 1;	thrombosis_prediction
SELECT `aCL IgM`  FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  WHERE Patient.Diagnosis = 'SLE'  AND Patient.Description = '1994-02-19'  AND Examination.`Examination Date` = '1993-11-12';	thrombosis_prediction
SELECT Patient.SEX  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.Date = '1992-06-12'  AND Laboratory.GPT = 9;	thrombosis_prediction
SELECT (YEAR('1991-10-21') - YEAR(Patient.Birthday)) AS age  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.Date = '1991-10-21' AND Laboratory.UA = '8.4'	thrombosis_prediction
SELECT COUNT(*)  FROM Laboratory  WHERE ID = (     SELECT ID      FROM Patient      WHERE `First Date` = '1991-06-13'      AND Diagnosis = 'SJS' ) AND Date BETWEEN '1995-01-01' AND '1995-12-31';	thrombosis_prediction
SELECT Patient.Diagnosis  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE Examination.`Examination Date` = '1997-01-27'  AND Examination.Diagnosis = 'SLE';	thrombosis_prediction
SELECT Symptoms  FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.Birthday = '1959-03-01'  AND e.`Examination Date` = '1993-09-27';	thrombosis_prediction
SELECT (nov_sum - dec_sum) AS decrease_rate FROM (     SELECT          SUM(CASE WHEN `Date` LIKE '1981-11%' THEN `T-CHO` ELSE 0 END) AS nov_sum,         SUM(CASE WHEN `Date` LIKE '1981-12%' THEN `T-CHO` ELSE 0 END) AS dec_sum     FROM Laboratory     WHERE ID = (SELECT ID FROM Patient WHERE `Birthday` = '1959-02-18') ) AS sub;	thrombosis_prediction
SELECT Patient.ID  FROM Patient  WHERE Patient.Diagnosis = 'Behcet'  AND Patient.Description BETWEEN '1997-01-01' AND '1997-12-31';	thrombosis_prediction
SELECT DISTINCT ID FROM Laboratory WHERE Date BETWEEN '1987-07-06' AND '1996-01-31' AND GPT > 30 AND ALB < 4;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND YEAR(Birthday) = 1964 AND Admission = '+';   SELECT ID FROM Patient WHERE SEX = 'F' AND YEAR(Birthday) = 1964 AND Admission = '+' ORDER BY ID;	thrombosis_prediction
SELECT COUNT(DISTINCT `Examination`.`ID`)  FROM `Examination`  WHERE `Thrombosis` = 2  AND `ANA Pattern` = 'S'  AND `aCL IgM` >= (1.2 * (SELECT AVG(`aCL IgM`) FROM `Examination` WHERE `aCL IgM` IS NOT NULL));	thrombosis_prediction
SELECT      (SUM(CASE WHEN UA <= 6.5 AND CAST(`U-PRO` AS REAL) > 0 AND CAST(`U-PRO` AS REAL) < 30 THEN 1.0 ELSE 0 END) /       SUM(CASE WHEN CAST(`U-PRO` AS REAL) > 0 AND CAST(`U-PRO` AS REAL) < 30 THEN 1.0 ELSE 0 END)     ) * 100 AS percentage FROM Laboratory;	thrombosis_prediction
SELECT      (COUNT(CASE WHEN Diagnosis = 'BEHCET' THEN 1 END) / COUNT(*) * 100) AS percentage  FROM Patient  WHERE SEX = 'M' AND YEAR(`First Date`) = 1981;	thrombosis_prediction
SELECT DISTINCT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Admission = '-' AND Laboratory.Date LIKE '1991-10%' AND Laboratory.`T-BIL` < 2.0;	thrombosis_prediction
SELECT COUNT(*) FROM Patient p WHERE p.SEX = 'F' AND p.Birthday BETWEEN '1980-01-01' AND '1989-12-31' AND NOT EXISTS (SELECT 1 FROM Examination e WHERE e.ID = p.ID AND e.`ANA Pattern` = 'P');	thrombosis_prediction
SELECT Patient.SEX  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Examination.Diagnosis = 'PSS'  AND Laboratory.CRP = '>2'  AND Laboratory.CRE = 1  AND Laboratory.LDH = 123;	thrombosis_prediction
SELECT AVG(LABORATORY.ALB)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.SEX = 'F'  AND Patient.Diagnosis = 'SLE'  AND Laboratory.PLT > 400;	thrombosis_prediction
SELECT E.Symptoms, COUNT(*) AS symptom_count FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE P.Diagnosis = 'SLE' GROUP BY E.Symptoms ORDER BY symptom_count DESC LIMIT 1;	thrombosis_prediction
SELECT Description AS `First Documented Date`, Diagnosis FROM Patient WHERE ID = 48473;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND Diagnosis = 'APS'	thrombosis_prediction
SELECT COUNT(DISTINCT L.ID)  FROM Laboratory L  WHERE YEAR(L.Date) = 1997 AND (L.TP <= 6 OR L.TP >= 8.5);	thrombosis_prediction
SELECT      (CAST(SUM(CASE WHEN p.Diagnosis LIKE '%SLE%' THEN 1 ELSE 0 END) AS REAL) / COUNT(DISTINCT p.ID)) * 100 AS proportion FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Symptoms LIKE '%thrombocytopenia%';	thrombosis_prediction
SELECT (SUM(CASE WHEN SEX = 'F' THEN 1 ELSE 0 END) / COUNT(*) * 100) AS percentage  FROM Patient  WHERE YEAR(Birthday) = 1980 AND Diagnosis = 'RA'	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  WHERE SEX = 'M'  AND Admission = '-'  AND Diagnosis = 'Behcet'  AND EXISTS (SELECT 1 FROM Examination WHERE Examination.ID = Patient.ID AND `Examination Date` BETWEEN '1995-01-01' AND '1997-12-31');	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.SEX = 'F' AND Laboratory.WBC < 3.5;	thrombosis_prediction
SELECT DATEDIFF((SELECT MIN(`Examination Date`) FROM Examination WHERE ID = 821298), (SELECT `First Date` FROM Patient WHERE ID = 821298));	thrombosis_prediction
SELECT      CASE          WHEN EXISTS (             SELECT 1              FROM Patient p              JOIN Laboratory l ON p.ID = l.ID              WHERE p.ID = 57266                AND ( (p.SEX = 'M' AND l.UA > 8.0) OR (p.SEX = 'F' AND l.UA > 6.5) )         )          THEN 'Yes'          ELSE 'No'      END AS Result;	thrombosis_prediction
SELECT `Date` FROM Laboratory WHERE `ID` = 48473 AND `GOT` >= 60;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE YEAR(l.Date) = 1994 AND l.GOT < 60;	thrombosis_prediction
SELECT DISTINCT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.GPT >= 60;	thrombosis_prediction
SELECT DISTINCT Patient.Diagnosis  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.GPT > 60  ORDER BY Patient.Birthday ASC;	thrombosis_prediction
SELECT AVG(LDH) FROM Laboratory WHERE LDH < 500 AND LDH IS NOT NULL	thrombosis_prediction
SELECT Patient.ID, (YEAR(CURRENT_TIMESTAMP) - YEAR(Patient.Birthday)) AS age FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.LDH BETWEEN 600 AND 800;	thrombosis_prediction
SELECT Patient.Admission  FROM Patient  INNER JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.ALP < 300;	thrombosis_prediction
SELECT Patient.ID,  CASE WHEN Laboratory.ALP < 300 THEN 'Yes' ELSE 'No' END  FROM Patient  LEFT JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.Birthday = '1982-04-01';	thrombosis_prediction
SELECT DISTINCT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TP < 6.0 AND l.TP IS NOT NULL	thrombosis_prediction
SELECT (LAB.TP - 8.5) AS deviation   FROM Patient P   JOIN Laboratory LAB ON P.ID = LAB.ID   WHERE P.SEX = 'F' AND LAB.TP > 8.5;	thrombosis_prediction
SELECT p.* FROM Patient p WHERE p.SEX = 'M'  AND EXISTS (     SELECT 1      FROM Laboratory l      WHERE l.ID = p.ID      AND (l.ALB <= 3.5 OR l.ALB >= 5.5) ) ORDER BY p.Birthday DESC;	thrombosis_prediction
SELECT P.ID,         CASE WHEN EXISTS (SELECT 1 FROM Laboratory L WHERE L.ID = P.ID AND L.ALB BETWEEN 3.5 AND 5.5) THEN 'Yes' ELSE 'No' END AS Albumin_Normal FROM Patient P WHERE YEAR(P.Birthday) = 1982;	thrombosis_prediction
SELECT      ROUND(         (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Patient WHERE SEX = 'F'))      , 2) AS percentage FROM Patient p WHERE p.SEX = 'F' AND EXISTS (     SELECT 1      FROM Laboratory l      WHERE l.ID = p.ID      AND l.UA > 6.5 );	thrombosis_prediction
SELECT AVG(l.UA) AS average_UA FROM Patient p JOIN Laboratory l ON p.ID = l.ID JOIN (     SELECT ID, MAX(Date) AS latest_date     FROM Laboratory     GROUP BY ID ) latest ON l.ID = latest.ID AND l.Date = latest.latest_date WHERE      (p.SEX = 'M' AND l.UA < 8.0) OR     (p.SEX = 'F' AND l.UA < 6.5);	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.UN = 29;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Diagnosis = 'RA' AND Laboratory.UN < 30;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.SEX = 'M' AND l.CRE >= 1.5;	thrombosis_prediction
SELECT CASE WHEN (SUM(CASE WHEN p.SEX = 'M' THEN 1 ELSE 0 END) > SUM(CASE WHEN p.SEX = 'F' THEN 1 ELSE 0 END)) THEN 'True' ELSE 'False' END FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.CRE >= 1.5;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.`T-BIL` = (SELECT MAX(`T-BIL`) FROM Laboratory)	thrombosis_prediction
SELECT p.SEX, GROUP_CONCAT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.`T-BIL` >= 2.0  GROUP BY p.SEX	thrombosis_prediction
SELECT p.ID, l.`T-CHO`  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.`T-CHO` = (SELECT MAX(`T-CHO`) FROM Laboratory)  ORDER BY p.Birthday ASC  LIMIT 1;	thrombosis_prediction
SELECT AVG(YEAR(NOW()) - YEAR(Patient.Birthday)) AS average_age  FROM Patient  INNER JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.SEX = 'M'  AND Laboratory.`T-CHO` >= 250  AND Patient.Birthday IS NOT NULL;	thrombosis_prediction
SELECT DISTINCT Patient.ID, Patient.Diagnosis  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.TG > 300;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.TG >= 200  AND (YEAR(CURDATE()) - YEAR(Patient.Birthday)) > 50	thrombosis_prediction
SELECT DISTINCT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Admission = '-' AND Laboratory.CPK < 250;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE YEAR(Patient.Birthday) BETWEEN 1936 AND 1956  AND Patient.SEX = 'M'  AND Laboratory.CPK >= 250;	thrombosis_prediction
SELECT P.ID, P.SEX, (YEAR(CURRENT_TIMESTAMP) - YEAR(P.Birthday)) AS age FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GLU >= 180 AND L.`T-CHO` < 250;	thrombosis_prediction
SELECT P.ID, L.GLU FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE YEAR(P.Description) = 1991 AND L.GLU < 180;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.WBC <= 3.5 OR Laboratory.WBC >= 9.0 ORDER BY Patient.SEX, Patient.Birthday DESC;	thrombosis_prediction
SELECT Patient.ID,         (YEAR(CURRENT_TIMESTAMP) - YEAR(Patient.Birthday)) AS Age,         Patient.Diagnosis FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.RBC < 3.5;	thrombosis_prediction
SELECT Patient.ID, Patient.Admission FROM Patient WHERE Patient.SEX = 'F' AND (CAST(strftime('%Y', 'now') AS INTEGER) - CAST(strftime('%Y', Patient.Birthday) AS INTEGER)) >=50 AND EXISTS (     SELECT 1     FROM Laboratory     WHERE Laboratory.ID = Patient.ID     AND (Laboratory.RBC <= 3.5 OR Laboratory.RBC >=6.0) );	thrombosis_prediction
SELECT DISTINCT P.ID, P.SEX  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.Admission = '-' AND L.HGB < 10;	thrombosis_prediction
SELECT p.ID, p.SEX FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis = 'SLE' AND l.HGB > 10 AND l.HGB < 17 ORDER BY p.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT Patient.ID, (YEAR(CURRENT_TIMESTAMP) - YEAR(Patient.Birthday)) AS age FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.HCT >= 52 GROUP BY Patient.ID HAVING COUNT(Laboratory.ID) > 2;	thrombosis_prediction
SELECT AVG(HCT)  FROM Laboratory  WHERE Date LIKE '1991%' AND HCT < 29;	thrombosis_prediction
SELECT      (COUNT(DISTINCT CASE WHEN PLT < 100 THEN ID END)       - COUNT(DISTINCT CASE WHEN PLT > 400 THEN ID END))  FROM Laboratory WHERE PLT <= 100 OR PLT >= 400;	thrombosis_prediction
SELECT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE YEAR(Laboratory.Date) = 1984 AND (YEAR(CURDATE()) - YEAR(Patient.Birthday)) < 50 AND Laboratory.PLT BETWEEN 100 AND 400;	thrombosis_prediction
SELECT (COUNT(DISTINCT CASE WHEN P.SEX = 'F' THEN P.ID END) / COUNT(DISTINCT P.ID)) * 100 AS percentage FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE (YEAR(CURRENT_TIMESTAMP) - YEAR(P.Birthday)) > 55 AND L.PT >= 14;	thrombosis_prediction
SELECT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE YEAR(Patient.`First Date`) > 1992 AND Laboratory.PT < 14;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e WHERE `Examination Date` > '1997-01-01'  AND EXISTS (SELECT 1 FROM Laboratory l WHERE l.ID = e.ID AND l.APTT < 45);	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p WHERE EXISTS (SELECT 1 FROM Laboratory l WHERE l.ID = p.ID AND l.APTT > 45) AND EXISTS (SELECT 1 FROM Examination e WHERE e.ID = p.ID AND e.Thrombosis = 0);	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p WHERE p.SEX = 'M' AND EXISTS (     SELECT 1      FROM Laboratory l      WHERE l.ID = p.ID      AND l.WBC > 3.5      AND l.WBC < 9.0 ) AND EXISTS (     SELECT 1      FROM Laboratory l      WHERE l.ID = p.ID      AND (l.FG <= 150 OR l.FG >= 450) );	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.Birthday > '1980-01-01'  AND (Laboratory.FG < 150 OR Laboratory.FG > 450);	thrombosis_prediction
SELECT DISTINCT Patient.Diagnosis FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.`U-PRO` >= 30;	thrombosis_prediction
SELECT Patient.ID  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.Diagnosis = 'SLE'  AND CAST(Laboratory.`U-PRO` AS REAL) > 0  AND CAST(Laboratory.`U-PRO` AS REAL) < 30;	thrombosis_prediction
SELECT COUNT(DISTINCT Laboratory.ID)  FROM Laboratory  WHERE IGG >= 2000;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID JOIN Examination e ON p.ID = e.ID WHERE l.IGG > 900 AND l.IGG < 2000  AND e.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT P.Diagnosis  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.IGA = (SELECT MAX(IGA) FROM Laboratory WHERE IGA BETWEEN 80 AND 500);	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.`First Date` >= '1990-01-01' AND l.IGA > 80 AND l.IGA < 500;	thrombosis_prediction
SELECT p.Diagnosis, COUNT(*) AS cnt FROM Patient p WHERE EXISTS (     SELECT 1      FROM Laboratory l     WHERE l.ID = p.ID        AND (l.IGM <= 40 OR l.IGM >= 400) ) GROUP BY p.Diagnosis ORDER BY cnt DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.CRP = '+'  AND p.Description IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.CRE >= 1.5  AND (YEAR(CURDATE()) - YEAR(p.Birthday)) < 70;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID AND e.KCT = '+'  JOIN Laboratory l ON p.ID = l.ID AND l.RA IN ('-', '+-');	thrombosis_prediction
SELECT Patient.Diagnosis  FROM Patient  WHERE YEAR(Patient.Birthday) >= 1985  AND EXISTS (     SELECT 1      FROM Laboratory      WHERE Laboratory.ID = Patient.ID      AND Laboratory.RA IN ('-', '+-') );	thrombosis_prediction
SELECT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE CAST(L.RF AS INTEGER) < 20 AND (YEAR(CURDATE()) - YEAR(P.Birthday)) > 60;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  WHERE EXISTS (SELECT 1 FROM Laboratory l WHERE l.ID = p.ID AND CAST(l.RF AS INTEGER) < 20)  AND EXISTS (SELECT 1 FROM Examination e WHERE e.ID = p.ID AND e.Thrombosis = 0);	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P WHERE EXISTS (SELECT 1 FROM Examination E WHERE E.ID = P.ID AND E.`ANA Pattern` = 'P') AND EXISTS (SELECT 1 FROM Laboratory L WHERE L.ID = P.ID AND L.C3 > 35);	thrombosis_prediction
SELECT E.ID FROM Examination E WHERE E.ID IN (     SELECT L.ID      FROM Laboratory L      WHERE L.HCT <= 29 OR L.HCT >= 52 ) GROUP BY E.ID ORDER BY MAX(E.`aCL IgA`) DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  JOIN Laboratory l ON p.ID = l.ID  WHERE e.Thrombosis = 1 AND l.C4 > 10;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '+'  AND l.RNP IN ('-', '+-');	thrombosis_prediction
SELECT P.Birthday FROM Patient P WHERE EXISTS (     SELECT 1      FROM Laboratory L      WHERE L.ID = P.ID      AND L.RNP NOT IN ('-', '+-') ) ORDER BY P.Birthday DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.Thrombosis = 0  AND EXISTS (     SELECT 1      FROM Laboratory l      WHERE l.ID = p.ID      AND l.SM IN ('-', '+-') );	thrombosis_prediction
SELECT DISTINCT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.SM NOT IN ('negative', '0') ORDER BY P.Birthday DESC LIMIT 3;	thrombosis_prediction
SELECT DISTINCT E.ID FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE E.`Examination Date` > '1997-01-01' AND L.SC170 IN ('negative', '0');	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  WHERE p.SEX = 'F'  AND EXISTS (SELECT 1 FROM Laboratory l WHERE l.ID = p.ID AND l.SC170 IN ('negative', '0'))  AND NOT EXISTS (SELECT 1 FROM Examination e WHERE e.ID = p.ID AND e.Symptoms IS NOT NULL);	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.SSA IN ('-', '+-')  AND p.`First Date` < '2000-01-01'	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.SSA NOT IN ('negative', '0') ORDER BY p.`First Date` ASC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT l.ID)  FROM Laboratory l  JOIN Patient p ON l.ID = p.ID  WHERE l.SSB IN ('negative', '0')  AND p.Diagnosis = 'SLE'	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID)  FROM Examination e  WHERE e.SSB IN ('negative', '0')  AND EXISTS (     SELECT 1      FROM Examination e2      WHERE e2.ID = e.ID      AND e2.Symptoms IS NOT NULL );	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.CENTROMEA IN ('-', '+-')    AND l.SSB IN ('-', '+-')    AND p.SEX = 'M';	thrombosis_prediction
SELECT DISTINCT P.Diagnosis FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.DNA >= 8;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.Description IS NULL AND L.DNA < 8 AND L.DNA IS NOT NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.IGG > 900 AND l.IGG < 2000  AND p.Admission = '+'	thrombosis_prediction
SELECT      (COUNT(DISTINCT CASE WHEN p.Diagnosis = 'SLE' AND l.GOT >= 60 THEN p.ID END) * 1.0       /       COUNT(DISTINCT CASE WHEN l.GOT >= 60 THEN p.ID END)) AS percentage FROM Patient p JOIN Laboratory l ON p.ID = l.ID;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.SEX = 'M' AND L.GOT < 60;	thrombosis_prediction
SELECT MAX(P.Birthday)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.GOT >= 60;	thrombosis_prediction
SELECT p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GPT < 60 GROUP BY p.ID ORDER BY MAX(l.GPT) DESC LIMIT 3;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  WHERE SEX = 'M'  AND ID IN (SELECT ID FROM Laboratory WHERE GOT < 60);	thrombosis_prediction
SELECT MIN(p.`First Date`)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.LDH = (SELECT MAX(LDH) FROM Laboratory WHERE LDH < 500)	thrombosis_prediction
SELECT MAX(date) FROM (     SELECT `Examination Date` AS date FROM Examination      JOIN (         SELECT P.ID          FROM Patient P          JOIN Laboratory L ON P.ID = L.ID          WHERE L.LDH >=500 AND P.First_Date = (             SELECT MAX(P2.First_Date)              FROM Patient P2              JOIN Laboratory L2 ON P2.ID = L2.ID              WHERE L2.LDH >=500         )     ) AS target ON Examination.ID = target.ID     UNION ALL     SELECT `Date` FROM Laboratory      JOIN (         SELECT P.ID          FROM Patient P          JOIN Laboratory L ON P.ID = L.ID          WHERE L.LDH >=500 AND P.First_Date = (             SELECT MAX(P2.First_Date)              FROM Patient P2              JOIN Laboratory L2 ON P2.ID = L2.ID              WHERE L2.LDH >=500         )     ) AS target ON Laboratory.ID = target.ID ) AS all_dates;	thrombosis_prediction
SELECT COUNT(DISTINCT L.ID)  FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE L.ALP >= 300 AND P.Admission = '+'	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.Admission = '-' AND l.ALP < 300;	thrombosis_prediction
SELECT DISTINCT Patient.Diagnosis FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.TP < 6.0;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.Diagnosis = 'SJS'  AND l.TP > 6.0  AND l.TP < 8.5;	thrombosis_prediction
SELECT Date  FROM Laboratory  WHERE ALB = (SELECT MAX(ALB) FROM Laboratory WHERE ALB BETWEEN 3.5 AND 5.5)	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.SEX = 'M'  AND l.ALB > 3.5  AND l.ALB < 5.5  AND l.TP BETWEEN 6.0 AND 8.5;	thrombosis_prediction
SELECT e.`aCL IgG`, e.`aCL IgM`, e.`aCL IgA` FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.SEX = 'F' AND p.ID IN (     SELECT l.ID     FROM Laboratory l     JOIN Patient p2 ON l.ID = p2.ID     WHERE p2.SEX = 'F'     AND l.UA = (         SELECT MAX(l3.UA)         FROM Laboratory l3         JOIN Patient p3 ON l3.ID = p3.ID         WHERE p3.SEX = 'F'         AND l3.UA > 6.50     ) );	thrombosis_prediction
SELECT MAX(ANA) FROM Examination WHERE ID IN (SELECT ID FROM Laboratory WHERE CRE < 1.5)	thrombosis_prediction
SELECT E.ID FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE L.CRE < 1.5 AND E.`aCL IgA` = (     SELECT MAX(E2.`aCL IgA`)     FROM Examination E2     JOIN Laboratory L2 ON E2.ID = L2.ID     WHERE L2.CRE < 1.5 );	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  JOIN Examination e ON p.ID = e.ID  WHERE l.`T-BIL` >= 2.0  AND e.`ANA Pattern` LIKE '%P%';	thrombosis_prediction
SELECT Examination.ANA  FROM Examination  INNER JOIN Laboratory ON Examination.ID = Laboratory.ID  WHERE Laboratory.`T-BIL` = (SELECT MAX(`T-BIL`) FROM Laboratory WHERE `T-BIL` < 2.0)	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p WHERE EXISTS (     SELECT 1 FROM Laboratory l WHERE l.ID = p.ID AND l.`T-CHO` >= 250 )  AND EXISTS (     SELECT 1 FROM Examination e WHERE e.ID = p.ID AND e.KCT = '-' );	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p WHERE  EXISTS (SELECT 1 FROM Examination e WHERE e.ID = p.ID AND e.`ANA Pattern` = 'P') AND EXISTS (SELECT 1 FROM Laboratory l WHERE l.ID = p.ID AND l.`T-CHO` < 250);	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p WHERE EXISTS (SELECT 1 FROM Laboratory l WHERE l.ID = p.ID AND l.TG < 200) AND EXISTS (SELECT 1 FROM Examination e WHERE e.ID = p.ID AND e.Symptoms IS NOT NULL);	thrombosis_prediction
SELECT p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TG = (SELECT MAX(TG) FROM Laboratory WHERE TG < 200)	thrombosis_prediction
SELECT Patient.ID  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Examination.Thrombosis = 0  AND Laboratory.CPK < 250;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p WHERE EXISTS (     SELECT 1 FROM Laboratory l WHERE l.ID = p.ID AND l.CPK < 250 )  AND EXISTS (     SELECT 1 FROM Examination e WHERE e.ID = p.ID AND (e.KCT = '+' OR e.RVVT = '+' OR e.LAC = '+') );	thrombosis_prediction
SELECT MIN(P.Birthday)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.GLU > 180;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  WHERE ID IN (SELECT ID FROM Laboratory WHERE GLU < 180)  AND ID IN (SELECT ID FROM Examination WHERE Thrombosis = 0);	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.Admission = '+'  AND l.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.Diagnosis = 'SLE'  AND L.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT DISTINCT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE (Laboratory.RBC <= 3.5 OR Laboratory.RBC >= 6.0) AND Patient.Admission = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.PLT > 100 AND l.PLT < 400  AND p.Diagnosis IS NOT NULL;	thrombosis_prediction
SELECT Laboratory.PLT  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.Diagnosis = 'MCTD'  AND Laboratory.PLT > 100  AND Laboratory.PLT < 400;	thrombosis_prediction
SELECT AVG(Laboratory.PT)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.SEX = 'M' AND Laboratory.PT < 14;	thrombosis_prediction
SELECT COUNT(*) FROM Patient p WHERE EXISTS (SELECT 1 FROM Examination e WHERE e.ID = p.ID AND e.Thrombosis IN (1,2)) AND EXISTS (SELECT 1 FROM Laboratory l WHERE l.ID = p.ID AND l.PT < 14);	thrombosis_prediction
SELECT major.major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Angela' AND member.last_name = 'Sanders';	student_club
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.college = 'College of Engineering';	student_club
SELECT member.first_name, member.last_name  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.department = 'Art and Design Department'  AND member.position LIKE '%Student_Club%';	student_club
SELECT COUNT(*)  FROM member  JOIN attendance ON member.member_id = attendance.link_to_member  WHERE attendance.link_to_event = (SELECT event_id FROM event WHERE event_name = 'Women''s Soccer')  AND member.position = 'Student_Club'	student_club
SELECT phone  FROM member  WHERE position = 'Student_Club'  AND member_id IN (     SELECT link_to_member      FROM attendance      WHERE link_to_event = (         SELECT event_id          FROM event          WHERE event_name = 'Women''s Soccer'     ) );	student_club
SELECT COUNT(*)  FROM member  JOIN attendance ON member.member_id = attendance.link_to_member  JOIN event ON attendance.link_to_event = event.event_id  WHERE event.event_name = 'Women''s Soccer'  AND member.position = 'Student_Club'  AND member.t_shirt_size = 'Medium'	student_club
SELECT e.event_id, e.event_name  FROM event e  JOIN attendance a ON e.event_id = a.link_to_event  WHERE e.type = 'Student_Club'  GROUP BY e.event_id, e.event_name  HAVING COUNT(a.link_to_member) = (     SELECT MAX(sub_cnt)      FROM (         SELECT COUNT(*) AS sub_cnt          FROM attendance a_sub          JOIN event e_sub ON a_sub.link_to_event = e_sub.event_id          WHERE e_sub.type = 'Student_Club'          GROUP BY a_sub.link_to_event     ) AS subquery );	student_club
SELECT major.college  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE member.position = 'Vice President';	student_club
SELECT event.event_name  FROM member  JOIN attendance ON member.member_id = attendance.link_to_member  JOIN event ON attendance.link_to_event = event.event_id  WHERE member.first_name = 'Maya' AND member.last_name = 'Mclean';	student_club
SELECT COUNT(*)  FROM attendance  JOIN event ON attendance.link_to_event = event.event_id  JOIN member ON attendance.link_to_member = member.member_id  WHERE member.first_name = 'Sacha'  AND member.last_name = 'Harrison'  AND event.type = 'Student_Club'  AND strftime('%Y', event.event_date) = '2019'	student_club
SELECT COUNT(*)  FROM event  WHERE type = 'Meeting'  AND event_id IN (     SELECT link_to_event      FROM attendance      GROUP BY link_to_event      HAVING COUNT(*) > 10 )	student_club
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event WHERE e.type <> 'fundraiser' GROUP BY e.event_id HAVING COUNT(a.link_to_event) > 20;	student_club
SELECT (COUNT(event.event_id) / COUNT(DISTINCT event.event_name)) AS average_attendance FROM attendance JOIN event ON attendance.link_to_event = event.event_id WHERE event.type = 'Meeting' AND YEAR(event.event_date) = 2020;	student_club
SELECT expense.expense_description, MAX(expense.cost)  FROM expense  INNER JOIN budget ON expense.link_to_budget = budget.budget_id  WHERE budget.link_to_event IS NOT NULL;	student_club
SELECT COUNT(*)  FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Environmental Engineering'	student_club
SELECT member.first_name, member.last_name FROM member JOIN attendance ON member.member_id = attendance.link_to_member JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'Laugh Out Loud';	student_club
SELECT member.last_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Law and Constitutional Studies';	student_club
SELECT zip_code.county  FROM member  JOIN zip_code ON member.zip = zip_code.zip_code  WHERE member.first_name = 'Sherri' AND member.last_name = 'Ramsey'	student_club
SELECT major.college  FROM major  JOIN member ON major.major_id = member.link_to_major  WHERE member.first_name = 'Tyler' AND member.last_name = 'Hewitt'	student_club
SELECT SUM(income.amount)  FROM member  JOIN income ON member.member_id = income.link_to_member  WHERE member.position = 'Vice President'	student_club
SELECT SUM(b.spent)  FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'September Meeting' AND b.category = 'Food'	student_club
SELECT zip_code.city, zip_code.short_state  FROM member  JOIN zip_code ON member.zip = zip_code.zip_code  WHERE member.position = 'President';	student_club
SELECT first_name, last_name FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE zip_code.state = 'Illinois';	student_club
SELECT SUM(b.spent)  FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'September Meeting'  AND b.category = 'Advertisement';	student_club
SELECT m.department FROM major m JOIN member p ON m.major_id = p.link_to_major AND p.last_name = 'Pierce' JOIN member g ON m.major_id = g.link_to_major AND g.last_name = 'Guidi';	student_club
SELECT SUM(b.amount)  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  WHERE e.event_name = 'October Speaker'	student_club
SELECT e.expense_description, e.approved  FROM expense e  JOIN budget b ON e.link_to_budget = b.budget_id  JOIN event ev ON b.link_to_event = ev.event_id  WHERE ev.event_name = 'October Meeting'  AND ev.event_date = '2019-10-08'	student_club
SELECT AVG(e.cost)  FROM expense e  JOIN member m ON e.link_to_member = m.member_id  WHERE m.first_name = 'Elijah' AND m.last_name = 'Allen'  AND SUBSTR(e.expense_date,6,2) IN ('09','10')	student_club
SELECT      (SUM(CASE WHEN SUBSTR(e.event_date, 1, 4) = '2019' THEN b.spent ELSE 0 END)       -       SUM(CASE WHEN SUBSTR(e.event_date, 1, 4) = '2020' THEN b.spent ELSE 0 END)) AS difference FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.type = 'Student_Club';	student_club
SELECT location FROM event WHERE event_name = 'Spring Budget Review';	student_club
SELECT SUM(cost) AS total_cost FROM expense JOIN budget ON expense.link_to_budget = budget.budget_id JOIN event ON budget.link_to_event = event.event_id WHERE event.event_date = '2019-09-04' AND expense.expense_description = 'Posters';	student_club
SELECT remaining  FROM budget  WHERE category = 'Food'  ORDER BY amount DESC  LIMIT 1;	student_club
SELECT notes FROM income WHERE source = 'Fundraising' AND date_received = '2019-09-14';	student_club
SELECT COUNT(*) FROM major WHERE college = 'College of Humanities and Social Sciences';	student_club
SELECT phone FROM member WHERE first_name = 'Carlo' AND last_name = 'Jacobs';	student_club
SELECT zip_code.county  FROM member  JOIN zip_code ON member.zip = zip_code.zip_code  WHERE member.first_name = 'Adela'  AND member.last_name = 'O''Gallagher'	student_club
SELECT COUNT(*)  FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'November Meeting' AND b.remaining < 0;	student_club
SELECT SUM(b.amount)  FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'September Speaker'	student_club
SELECT budget.event_status  FROM expense  JOIN budget ON expense.link_to_budget = budget.budget_id  WHERE expense.expense_description = 'Post Cards, Posters'  AND expense.expense_date = '2019-8-20'	student_club
SELECT major.major_name  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE member.first_name = 'Brent'  AND member.last_name = 'Thomason';	student_club
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Business'  AND member.t_shirt_size = 'Medium'	student_club
SELECT zip_code.type  FROM member  JOIN zip_code ON member.zip = zip_code.zip_code  WHERE member.first_name = 'Christof' AND member.last_name = 'Nielson';	student_club
SELECT major.major_name  FROM major  JOIN member ON major.major_id = member.link_to_major  WHERE member.position = 'Vice President';	student_club
SELECT zip_code.state  FROM member  JOIN zip_code ON member.zip = zip_code.zip_code  WHERE member.first_name = 'Sacha' AND member.last_name = 'Harrison'	student_club
SELECT m.department  FROM member AS mem  JOIN major AS m ON mem.link_to_major = m.major_id  WHERE mem.position = 'President'	student_club
SELECT income.date_received FROM income JOIN member ON income.link_to_member = member.member_id WHERE member.first_name = 'Connor' AND member.last_name = 'Hilton' AND income.source = 'Dues';	student_club
SELECT m.first_name, m.last_name  FROM member m  JOIN income i ON m.member_id = i.link_to_member  WHERE i.source = 'Dues'  ORDER BY i.date_received ASC  LIMIT 1;	student_club
SELECT      (SELECT SUM(b.amount)       FROM budget b       JOIN event e ON b.link_to_event = e.event_id       WHERE b.category = 'Advertisement' AND e.event_name = 'Yearly Kickoff')      /      (SELECT SUM(b.amount)       FROM budget b       JOIN event e ON b.link_to_event = e.event_id       WHERE b.category = 'Advertisement' AND e.event_name = 'October Meeting')  AS ratio;	student_club
SELECT      (SUM(CASE WHEN b.category = 'Parking' THEN b.amount ELSE 0 END) / SUM(b.amount)) * 100 AS parking_percentage FROM      budget b JOIN      event e ON b.link_to_event = e.event_id WHERE      e.event_name = 'November Speaker';	student_club
SELECT SUM(cost)  FROM expense  WHERE expense_description = 'Pizza'	student_club
SELECT COUNT(DISTINCT city) FROM zip_code WHERE county = 'Orange County' AND state = 'Virginia';	student_club
SELECT DISTINCT department FROM major WHERE college = 'College of Humanities and Social Sciences';	student_club
SELECT zip_code.city, zip_code.county, zip_code.state  FROM member  JOIN zip_code ON member.zip = zip_code.zip_code  WHERE member.first_name = 'Amy' AND member.last_name = 'Firth'	student_club
SELECT expense.expense_description  FROM expense  JOIN budget ON expense.link_to_budget = budget.budget_id  WHERE budget.remaining = (SELECT MIN(remaining) FROM budget)	student_club
SELECT member.*  FROM member  JOIN attendance ON member.member_id = attendance.link_to_member  JOIN event ON attendance.link_to_event = event.event_id  WHERE event.event_name = 'October Meeting';	student_club
SELECT mj.college, COUNT(mb.member_id) AS member_count FROM member mb JOIN major mj ON mb.link_to_major = mj.major_id GROUP BY mj.college ORDER BY member_count DESC LIMIT 1;	student_club
SELECT major.major_name  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE member.phone = '809-555-3360';	student_club
SELECT event.event_name  FROM event  JOIN budget ON event.event_id = budget.link_to_event  WHERE budget.amount = (SELECT MAX(amount) FROM budget)	student_club
SELECT e.*  FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.position = 'Vice President';	student_club
SELECT COUNT(*)  FROM attendance  WHERE link_to_event = (     SELECT event_id      FROM event      WHERE event_name = 'Women''s Soccer' );	student_club
SELECT income.date_received  FROM income  INNER JOIN member ON income.link_to_member = member.member_id  WHERE member.first_name = 'Casey' AND member.last_name = 'Mason';	student_club
SELECT COUNT(*)  FROM member  JOIN zip_code ON member.zip = zip_code.zip_code  WHERE zip_code.state = 'Maryland';	student_club
SELECT COUNT(*) FROM attendance WHERE link_to_member = (SELECT member_id FROM member WHERE phone = '954-555-6240')	student_club
SELECT m.first_name, m.last_name  FROM member m  JOIN major ma ON m.link_to_major = ma.major_id  WHERE ma.department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT event.event_name  FROM event  JOIN budget ON event.event_id = budget.link_to_event  WHERE event.status = 'Closed'  ORDER BY (budget.spent / budget.amount) DESC  LIMIT 1;	student_club
SELECT COUNT(*)  FROM member  WHERE position = 'President'	student_club
SELECT MAX(spent) FROM budget;	student_club
SELECT COUNT(*) FROM event WHERE type = 'Meeting' AND YEAR(event_date) = 2020;	student_club
SELECT SUM(spent)  FROM budget  WHERE category = 'Food'	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member GROUP BY m.member_id, m.first_name, m.last_name HAVING COUNT(a.link_to_event) > 7;	student_club
SELECT m.first_name, m.last_name  FROM member m JOIN major ma ON m.link_to_major = ma.major_id JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE ma.major_name = 'Interior Design'  AND e.event_name = 'Community Theater'	student_club
SELECT member.first_name, member.last_name FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE zip_code.city = 'Georgetown' AND zip_code.state = 'South Carolina';	student_club
SELECT SUM(income.amount)  FROM income  JOIN member ON income.link_to_member = member.member_id  WHERE member.first_name = 'Grant' AND member.last_name = 'Gilmour'	student_club
SELECT member.first_name, member.last_name FROM member JOIN income ON member.member_id = income.link_to_member WHERE income.amount > 40;	student_club
SELECT SUM(expense.cost)  FROM event  JOIN budget ON event.event_id = budget.link_to_event  JOIN expense ON budget.budget_id = expense.link_to_budget  WHERE event.event_name = 'Yearly Kickoff'	student_club
SELECT m.first_name, m.last_name  FROM member m  JOIN attendance a ON m.member_id = a.link_to_member  JOIN event e ON a.link_to_event = e.event_id  WHERE e.event_name = 'Yearly Kickoff'  AND m.position = 'Budget Manager';	student_club
SELECT member.first_name, member.last_name, income.source FROM income JOIN member ON income.link_to_member = member.member_id WHERE income.amount = (SELECT MAX(amount) FROM income)	student_club
SELECT event.event_name  FROM event  JOIN budget ON budget.link_to_event = event.event_id  JOIN expense ON expense.link_to_budget = budget.budget_id  WHERE expense.cost = (SELECT MIN(cost) FROM expense)	student_club
SELECT      (SUM(CASE WHEN e.event_name = 'Yearly Kickoff' THEN ex.cost ELSE 0 END) / SUM(ex.cost)) * 100 AS percentage FROM expense ex JOIN budget b ON ex.link_to_budget = b.budget_id JOIN event e ON b.link_to_event = e.event_id;	student_club
SELECT      CAST(SUM(CASE WHEN m.major_name = 'Finance' THEN 1 ELSE 0 END) AS REAL) /      SUM(CASE WHEN m.major_name = 'Physics' THEN 1 ELSE 0 END) AS ratio FROM member mem JOIN major m ON mem.link_to_major = m.major_id;	student_club
SELECT source  FROM income  WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30'  GROUP BY source  ORDER BY SUM(amount) DESC  LIMIT 1	student_club
SELECT first_name, last_name, email FROM member WHERE position = 'Secretary';	student_club
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Physics Teaching'	student_club
SELECT COUNT(*)  FROM attendance  JOIN event ON attendance.link_to_event = event.event_id  WHERE event.event_name = 'Community Theater'  AND strftime('%Y', event.event_date) = '2019';	student_club
SELECT      (SELECT COUNT(*) FROM attendance WHERE link_to_member = mem.member_id) AS event_count,     m.major_name FROM member mem JOIN major m ON mem.link_to_major = m.major_id WHERE mem.first_name = 'Luisa' AND mem.last_name = 'Guidi'	student_club
SELECT AVG(spent)  FROM budget  WHERE category = 'Food'  AND event_status = 'Closed'	student_club
SELECT event.event_name  FROM event  JOIN budget ON event.event_id = budget.link_to_event  WHERE budget.category = 'Advertisement'  ORDER BY budget.spent DESC  LIMIT 1;	student_club
SELECT * FROM attendance  JOIN member ON attendance.link_to_member = member.member_id  JOIN event ON attendance.link_to_event = event.event_id  WHERE member.first_name = 'Maya' AND member.last_name = 'Mclean' AND event.event_name = 'Women''s Soccer';	student_club
SELECT (SUM(type = 'Community Service') / COUNT(event_id)) * 100 AS percentage FROM event WHERE status = 'Student_Club'  AND event_date BETWEEN '2019-01-01' AND '2019-12-31'	student_club
SELECT expense.cost  FROM expense  JOIN budget ON expense.link_to_budget = budget.budget_id  JOIN event ON budget.link_to_event = event.event_id  WHERE event.event_name = 'September Speaker'  AND expense.expense_description = 'Posters';	student_club
SELECT t_shirt_size, COUNT(*) AS count  FROM member  GROUP BY t_shirt_size  ORDER BY count DESC  LIMIT 1;	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.status = 'Closed' AND b.remaining < 0 AND b.remaining = (     SELECT MIN(b2.remaining)     FROM budget b2     JOIN event e2 ON b2.link_to_event = e2.event_id     WHERE e2.status = 'Closed' AND b2.remaining < 0 );	student_club
SELECT budget.category AS expense_type, SUM(expense.cost) AS total_value FROM event JOIN budget ON event.event_id = budget.link_to_event JOIN expense ON budget.budget_id = expense.link_to_budget WHERE event.event_name = 'October Meeting' AND expense.approved = 'Approved' GROUP BY budget.category;	student_club
SELECT category, SUM(amount) AS total_budgeted FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'April Speaker' GROUP BY category ORDER BY total_budgeted ASC;	student_club
SELECT * FROM budget  WHERE category = 'Food'  AND amount = (SELECT MAX(amount) FROM budget WHERE category = 'Food')	student_club
SELECT * FROM budget WHERE category = 'Advertisement' ORDER BY amount DESC LIMIT 3;	student_club
SELECT SUM(cost)  FROM expense  WHERE expense_description = 'Parking';	student_club
SELECT SUM(cost)  FROM expense  WHERE expense_date = '2019-08-20'	student_club
SELECT      m.first_name || ' ' || m.last_name AS full_name,     COALESCE(SUM(e.cost), 0) AS total_cost FROM member m LEFT JOIN expense e ON m.member_id = e.link_to_member WHERE m.member_id = 'rec4BLdZHS2Blfp4v' GROUP BY m.member_id, m.first_name, m.last_name;	student_club
SELECT expense.expense_description FROM member JOIN expense ON member.member_id = expense.link_to_member WHERE member.first_name = 'Sacha' AND member.last_name = 'Harrison';	student_club
SELECT DISTINCT expense.expense_description FROM member JOIN expense ON member.member_id = expense.link_to_member WHERE member.t_shirt_size = 'X-Large'	student_club
SELECT DISTINCT m.zip  FROM member m  JOIN expense e ON m.member_id = e.link_to_member  WHERE e.cost < 50;	student_club
SELECT major.major_name  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE member.first_name = 'Phillip' AND member.last_name = 'Cullen';	student_club
SELECT member.position  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Business';	student_club
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Business'  AND member.t_shirt_size = 'Medium';	student_club
SELECT event.type  FROM event  JOIN budget ON event.event_id = budget.link_to_event  WHERE budget.remaining > 30  GROUP BY event.type;	student_club
SELECT type  FROM event  WHERE location = 'MU 215';	student_club
SELECT budget.category  FROM event  JOIN budget ON event.event_id = budget.link_to_event  WHERE event.event_date = '2020-03-24T12:00:00';	student_club
SELECT major.major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'Vice President';	student_club
SELECT      (SUM(CASE WHEN m.position = 'Member' AND ma.major_name = 'Business' THEN 1 ELSE 0 END) * 100.0 / COUNT(m.member_id)) AS percentage FROM member m LEFT JOIN major ma ON m.link_to_major = ma.major_id;	student_club
SELECT budget.category  FROM event  JOIN budget ON event.event_id = budget.link_to_event  WHERE event.location = 'MU 215';	student_club
SELECT COUNT(*) FROM income WHERE amount = 50	student_club
SELECT COUNT(*)  FROM member  WHERE position = 'Member' AND t_shirt_size = 'X-Large'	student_club
SELECT COUNT(major_id)  FROM major  WHERE college = 'College of Agriculture and Applied Sciences'  AND department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT member.last_name, major.department, major.college  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Environmental Engineering';	student_club
SELECT budget.category  FROM budget  JOIN event ON budget.link_to_event = event.event_id  WHERE event.location = 'MU 215'  AND event.type = 'Guest Speaker'  AND budget.spent = 0;	student_club
SELECT zip_code.city, zip_code.state FROM member JOIN major ON member.link_to_major = major.major_id JOIN zip_code ON member.zip = zip_code.zip_code WHERE major.department = 'Electrical and Computer Engineering Department' AND member.position = 'Member';	student_club
SELECT event.event_name  FROM event  JOIN attendance ON event.event_id = attendance.link_to_event  JOIN member ON attendance.link_to_member = member.member_id  WHERE event.type = 'Social'  AND event.location = '900 E. Washington St.'  AND member.position = 'Vice President';	student_club
SELECT m.last_name, m.position FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.expense_description = 'Pizza' AND e.expense_date = '2019-09-10'	student_club
SELECT member.last_name FROM member JOIN attendance ON member.member_id = attendance.link_to_member JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'Women''s Soccer' AND member.position = 'Member'	student_club
SELECT      (COUNT(DISTINCT CASE WHEN i.amount = 50 AND i.source = 'Student_Club' THEN m.member_id END) * 100.0 /       COUNT(m.member_id)) AS percentage FROM member m LEFT JOIN income i ON m.member_id = i.link_to_member WHERE m.t_shirt_size = 'Medium' AND m.position = 'Member';	student_club
SELECT DISTINCT state FROM zip_code WHERE type = 'PO Box'	student_club
SELECT zip_code FROM zip_code WHERE type = 'PO Box' AND county = 'San Juan Municipio' AND state = 'Puerto Rico';	student_club
SELECT event_name  FROM event  WHERE type = 'Game'  AND status = 'Closed'  AND event_date BETWEEN '2019-03-15' AND '2020-03-20'	student_club
SELECT DISTINCT a.link_to_event FROM attendance a WHERE a.link_to_member IN (     SELECT e.link_to_member     FROM expense e     WHERE e.cost > 50 );	student_club
SELECT      m.*,     a.link_to_event FROM      member m JOIN      expense e ON m.member_id = e.link_to_member JOIN      attendance a ON m.member_id = a.link_to_member WHERE      e.approved = 'true'      AND e.expense_date BETWEEN '2019-01-10' AND '2019-11-19';	student_club
SELECT major.college  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE member.first_name = 'Katy'  AND member.link_to_major = 'rec1N0upiVLy5esTO'	student_club
SELECT phone  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Business'  AND major.college = 'College of Agriculture and Applied Sciences'	student_club
SELECT DISTINCT m.email FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost > 20 AND e.expense_date BETWEEN '2019-09-10' AND '2019-11-19'	student_club
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'education'  AND major.college = 'College of Education & Human Services';	student_club
SELECT (SUM(has_over) / COUNT(event_id) * 1.0) * 100 AS percentage FROM (     SELECT e.event_id,             MAX(CASE WHEN b.remaining < 0 THEN 1 ELSE 0 END) AS has_over     FROM event e     INNER JOIN budget b ON e.event_id = b.link_to_event     GROUP BY e.event_id );	student_club
SELECT event_id, location, status  FROM event  WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31'	student_club
SELECT * FROM expense WHERE cost > 50;	student_club
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large';	student_club
SELECT (SUM(type = 'PO Box') * 100.0 / COUNT(*)) FROM zip_code;	student_club
SELECT event_name, location  FROM event  JOIN budget ON event.event_id = budget.link_to_event  WHERE budget.remaining > 0	student_club
SELECT DISTINCT e.event_name, e.event_date FROM event e JOIN budget b ON e.event_id = b.link_to_event JOIN expense ex ON b.budget_id = ex.link_to_budget WHERE ex.expense_description = 'Pizza'  AND ex.cost > 50  AND ex.cost < 100;	student_club
SELECT      m.first_name || ' ' || m.last_name AS full_name,     mj.major_name FROM member m JOIN expense e ON m.member_id = e.link_to_member JOIN major mj ON m.link_to_major = mj.major_id WHERE e.cost > 100;	student_club
SELECT z.city, z.state AS country FROM event e INNER JOIN zip_code z ON e.location = CAST(z.zip_code AS TEXT) WHERE e.event_id IN (     SELECT e.event_id     FROM event e     JOIN attendance a ON e.event_id = a.link_to_event     JOIN income i ON a.link_to_member = i.link_to_member     GROUP BY e.event_id     HAVING COUNT(i.income_id) > 40 )	student_club
SELECT m.*  FROM member m  JOIN (     SELECT e.link_to_member AS member_id, SUM(e.cost) AS total_cost      FROM expense e      JOIN budget b ON e.link_to_budget = b.budget_id      GROUP BY e.link_to_member      HAVING COUNT(DISTINCT b.link_to_event) > 1 ) sub  ON m.member_id = sub.member_id  ORDER BY sub.total_cost DESC  LIMIT 1;	student_club
SELECT SUM(e.cost) / COUNT(b.link_to_event) AS average_amount FROM member m JOIN expense e ON m.member_id = e.link_to_member JOIN budget b ON e.link_to_budget = b.budget_id WHERE m.position <> 'Member';	student_club
SELECT ev.event_name FROM event ev LEFT JOIN budget b ON ev.event_id = b.link_to_event AND b.category = 'Parking' LEFT JOIN expense exp ON b.budget_id = exp.link_to_budget GROUP BY ev.event_id, ev.event_name HAVING COALESCE(SUM(exp.cost), 0) < (     SELECT (SUM(e.cost) / COUNT(DISTINCT b2.link_to_event))     FROM expense e     JOIN budget b2 ON e.link_to_budget = b2.budget_id     WHERE b2.category = 'Parking' )	student_club
SELECT      (SUM(e.cost) / COUNT(DISTINCT ev.event_id)) * 100 AS percentage FROM      event ev LEFT JOIN budget b ON ev.event_id = b.link_to_event LEFT JOIN expense e ON b.budget_id = e.link_to_budget WHERE ev.type = 'Meeting';	student_club
SELECT e.link_to_budget AS budget_id FROM expense e WHERE e.expense_description = 'Water, chips, cookies' ORDER BY e.cost DESC LIMIT 1;	student_club
SELECT member.first_name, member.last_name, SUM(expense.cost) AS total_spent FROM expense JOIN member ON expense.link_to_member = member.member_id GROUP BY member.member_id, member.first_name, member.last_name ORDER BY total_spent DESC LIMIT 5;	student_club
SELECT DISTINCT m.first_name, m.last_name, m.phone FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost > (SELECT AVG(cost) FROM expense)	student_club
SELECT      (         (SELECT COUNT(*) FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.position = 'Member' AND z.state = 'New Jersey')          -          (SELECT COUNT(*) FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.position = 'Member' AND z.state = 'Vermont')     ) * 1.0      /      (SELECT COUNT(*) FROM member WHERE position = 'Member')      AS difference;	student_club
SELECT major.major_name, major.department FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Garrett' AND member.last_name = 'Gerke'	student_club
SELECT CONCAT(m.first_name, ' ', m.last_name) AS full_name, e.cost FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.expense_description = 'Water, Veggie tray, supplies'	student_club
SELECT m.last_name, m.phone FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Elementary Education';	student_club
SELECT budget.category, budget.amount FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'January Speaker';	student_club
SELECT event.event_name  FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE budget.category = 'Food';	student_club
SELECT member.first_name, member.last_name, income.amount FROM member JOIN income ON member.member_id = income.link_to_member WHERE income.date_received = '9/9/2019'	student_club
SELECT budget.category  FROM expense  JOIN budget ON expense.link_to_budget = budget.budget_id  WHERE expense.expense_description = 'Posters'	student_club
SELECT member.first_name, member.last_name, major.college  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE member.position = 'Secretary'	student_club
SELECT event.event_name, SUM(budget.spent) AS total_spent FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE budget.category = 'Speaker Gifts' GROUP BY event.event_name;	student_club
SELECT zip_code.city  FROM member  JOIN zip_code ON member.zip = zip_code.zip_code  WHERE member.first_name = 'Garrett' AND member.last_name = 'Gerke';	student_club
SELECT member.first_name, member.last_name, member.position  FROM member  JOIN zip_code ON member.zip = zip_code.zip_code  WHERE zip_code.city = 'Lincolnton'  AND zip_code.state = 'North Carolina'  AND zip_code.zip_code = 28092;	student_club
SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Premium';	debit_card_specializing
SELECT (SELECT COUNT(*) FROM customers WHERE Currency = 'EUR') / (SELECT COUNT(*) FROM customers WHERE Currency = 'CZK') AS ratio;	debit_card_specializing
SELECT c.CustomerID FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'LAM' AND y.Date BETWEEN '201201' AND '201212' GROUP BY c.CustomerID ORDER BY SUM(y.Consumption) ASC LIMIT 1;	debit_card_specializing
SELECT AVG(y.Consumption)/12 AS average_monthly_consumption FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Segment = 'SME' AND y.Date BETWEEN '201301' AND '201312';	debit_card_specializing
SELECT c.CustomerID, SUM(y.Consumption) AS total_consumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Currency = 'CZK'   AND y.Date BETWEEN '201101' AND '201112' GROUP BY c.CustomerID ORDER BY total_consumption DESC;	debit_card_specializing
SELECT COUNT(*)  FROM (     SELECT c.CustomerID     FROM customers c     JOIN yearmonth y ON c.CustomerID = y.CustomerID     WHERE c.Segment = 'KAM'     AND y.Date BETWEEN '201201' AND '201212'     GROUP BY c.CustomerID     HAVING SUM(y.Consumption) < 30000 );	debit_card_specializing
SELECT      (SUM(CASE WHEN c.Currency = 'CZK' THEN y.Consumption ELSE 0 END) -       SUM(CASE WHEN c.Currency = 'EUR' THEN y.Consumption ELSE 0 END)) AS difference FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE y.Date BETWEEN '201201' AND '201212';	debit_card_specializing
SELECT SUBSTR(y.Date,1,4) AS year FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Currency = 'EUR' GROUP BY year ORDER BY SUM(y.Consumption) DESC LIMIT 1;	debit_card_specializing
SELECT customers.Segment, SUM(yearmonth.Consumption) AS total_consumption FROM customers LEFT JOIN yearmonth ON customers.CustomerID = yearmonth.CustomerID GROUP BY customers.Segment ORDER BY total_consumption ASC LIMIT 1;	debit_card_specializing
SELECT substr(Date, 1,4) AS Year, SUM(Consumption) AS Total   FROM yearmonth   JOIN customers ON yearmonth.CustomerID = customers.CustomerID   WHERE customers.Currency = 'CZK'   GROUP BY substr(Date, 1,4)   ORDER BY Total DESC   LIMIT 1;	debit_card_specializing
SELECT substr(Date,5,2) AS month, SUM(Consumption) AS total   FROM customers   JOIN yearmonth USING (CustomerID)   WHERE customers.Segment = 'SME'   AND substr(Date,1,4) = '2013'   GROUP BY substr(Date,1,6)   ORDER BY total DESC   LIMIT 1;	debit_card_specializing
WITH customer_2013 AS (     SELECT c.CustomerID, c.Segment, COALESCE(SUM(y.Consumption), 0) AS total_2013     FROM customers c     LEFT JOIN yearmonth y          ON c.CustomerID = y.CustomerID          AND y.Date BETWEEN '201301' AND '201312'     GROUP BY c.CustomerID, c.Segment ), segment_min AS (     SELECT Segment, MIN(total_2013) AS min_total     FROM customer_2013     GROUP BY Segment ), min_customers AS (     SELECT c.Segment, c.total_2013     FROM customer_2013 c     JOIN segment_min s          ON c.Segment = s.Segment          AND c.total_2013 = s.min_total ), segment_averages AS (     SELECT Segment, SUM(total_2013)/COUNT(*) AS avg_consumption     FROM min_customers     GROUP BY Segment ) SELECT      (SELECT avg_consumption FROM segment_averages WHERE Segment = 'SME') -      (SELECT avg_consumption FROM segment_averages WHERE Segment = 'LAM') AS "SME-LAM",     (SELECT avg_consumption FROM segment_averages WHERE Segment = 'LAM') -      (SELECT avg_consumption FROM segment_averages WHERE Segment = 'KAM') AS "LAM-KAM",     (SELECT avg_consumption FROM segment_averages WHERE Segment = 'KAM') -      (SELECT avg_consumption FROM segment_averages WHERE Segment = 'SME') AS "KAM-SME";	debit_card_specializing
WITH segment_totals AS (     SELECT         c.Segment,         SUM(CASE WHEN substr(y.Date, 1, 4) = '2012' THEN y.Consumption ELSE 0 END) AS total_2012,         SUM(CASE WHEN substr(y.Date, 1, 4) = '2013' THEN y.Consumption ELSE 0 END) AS total_2013     FROM customers c     JOIN yearmonth y ON c.CustomerID = y.CustomerID     WHERE c.Currency = 'EUR'     AND c.Segment IN ('SME', 'LAM', 'KAM')     GROUP BY c.Segment ), calculated AS (     SELECT         Segment,         ((total_2013 - total_2012) / total_2013) * 100 AS percentage_increase     FROM segment_totals     WHERE total_2013 != 0 ) SELECT     Segment,     percentage_increase,     CASE          WHEN percentage_increase = (SELECT MAX(percentage_increase) FROM calculated) THEN 'Highest'         WHEN percentage_increase = (SELECT MIN(percentage_increase) FROM calculated) THEN 'Lowest'     END AS status FROM calculated WHERE percentage_increase IN (     (SELECT MAX(percentage_increase) FROM calculated),     (SELECT MIN(percentage_increase) FROM calculated) ) ORDER BY percentage_increase DESC;	debit_card_specializing
SELECT SUM(Consumption)  FROM yearmonth  WHERE CustomerID = 6 AND Date BETWEEN '201308' AND '201311'	debit_card_specializing
SELECT      (SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Value for money')      -      (SELECT COUNT(*) FROM gasstations WHERE Country = 'SVK' AND Segment = 'Value for money')  AS discount_difference;	debit_card_specializing
SELECT      (SELECT Consumption FROM yearmonth WHERE CustomerID = 7 AND Date = '201304') -      (SELECT Consumption FROM yearmonth WHERE CustomerID = 5 AND Date = '201304')  AS consumption_difference;	debit_card_specializing
SELECT      (SELECT COUNT(*) FROM customers WHERE Segment = 'SME' AND Currency = 'CZK')    -      (SELECT COUNT(*) FROM customers WHERE Segment = 'SME' AND Currency = 'EUR')  AS difference;	debit_card_specializing
SELECT c.CustomerID  FROM customers c  JOIN yearmonth y ON c.CustomerID = y.CustomerID  WHERE c.Segment = 'LAM'  AND c.Currency = 'EUR'  AND y.Date = '201310'  ORDER BY y.Consumption DESC  LIMIT 1;	debit_card_specializing
SELECT c.CustomerID, SUM(y.Consumption) AS total_consumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'LAM' GROUP BY c.CustomerID ORDER BY total_consumption DESC LIMIT 1;	debit_card_specializing
SELECT SUM(y.Consumption)  FROM customers c  JOIN yearmonth y ON c.CustomerID = y.CustomerID  WHERE c.Segment = 'KAM' AND y.Date = '201305';	debit_card_specializing
SELECT    (SELECT COUNT(DISTINCT y.CustomerID)     FROM yearmonth y    JOIN customers c ON y.CustomerID = c.CustomerID    WHERE c.Segment = 'LAM' AND y.Consumption > 46.73)     * 100.0     /     (SELECT COUNT(*)      FROM customers      WHERE Segment = 'LAM')  AS percentage;	debit_card_specializing
SELECT Country, COUNT(*) AS total_value_for_money  FROM gasstations  WHERE Segment = 'Value for money'  GROUP BY Country;	debit_card_specializing
SELECT      (CAST(COUNT(*) AS REAL) / (SELECT COUNT(*) FROM customers WHERE Segment = 'KAM') * 100) AS percentage FROM customers WHERE Segment = 'KAM' AND Currency = 'EUR';	debit_card_specializing
SELECT      (COUNT(CASE WHEN Consumption > 528.3 THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM yearmonth WHERE Date = '201202';	debit_card_specializing
SELECT      (COUNT(CASE WHEN Segment = 'Premium' THEN 1 END) * 100.0 / COUNT(*) ) AS percentage FROM gasstations WHERE Country = 'SVK'	debit_card_specializing
SELECT CustomerID  FROM yearmonth  WHERE Date = '201309'  ORDER BY Consumption DESC  LIMIT 1;	debit_card_specializing
SELECT c.Segment  FROM customers c  JOIN yearmonth y ON c.CustomerID = y.CustomerID  WHERE y.Date = '201309'  GROUP BY c.Segment  ORDER BY SUM(y.Consumption) ASC  LIMIT 1;	debit_card_specializing
SELECT c.CustomerID FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'SME' AND y.Date = '201206' ORDER BY y.Consumption ASC LIMIT 1;	debit_card_specializing
SELECT MAX(Consumption)  FROM yearmonth  WHERE substr(Date, 1, 4) = '2012'	debit_card_specializing
SELECT MAX(Consumption)  FROM yearmonth  JOIN customers ON customers.CustomerID = yearmonth.CustomerID  WHERE customers.Currency = 'EUR';	debit_card_specializing
SELECT DISTINCT p.Description FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID WHERE strftime('%Y-%m', t.Date) = '2013-09'	debit_card_specializing
SELECT DISTINCT g.Country FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID WHERE t.Date = '201306'	debit_card_specializing
SELECT DISTINCT g.ChainID FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR'	debit_card_specializing
SELECT DISTINCT p.Description  FROM products p  JOIN transactions_1k t ON p.ProductID = t.ProductID  JOIN customers c ON t.CustomerID = c.CustomerID  WHERE c.Currency = 'EUR'	debit_card_specializing
SELECT AVG(Amount * Price)  FROM transactions_1k  WHERE Date LIKE '2012-01%';	debit_card_specializing
SELECT COUNT(DISTINCT c.CustomerID)  FROM customers c  JOIN yearmonth y ON c.CustomerID = y.CustomerID  WHERE c.Currency = 'EUR'  AND y.Consumption > 1000;	debit_card_specializing
SELECT products.Description  FROM products  JOIN transactions_1k ON products.ProductID = transactions_1k.ProductID  JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID  WHERE gasstations.Country = 'CZE';	debit_card_specializing
SELECT DISTINCT Time  FROM transactions_1k AS t  JOIN gasstations AS g ON t.GasStationID = g.GasStationID  WHERE g.ChainID = 11;	debit_card_specializing
SELECT COUNT(t.TransactionID)  FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE' AND t.Price > 1000;	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k  JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID  WHERE gasstations.Country = 'CZE'  AND transactions_1k.Date > '2012-01-01';	debit_card_specializing
SELECT AVG(t.Price * t.Amount) AS average_total_price FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE';	debit_card_specializing
SELECT AVG(t.Amount * t.Price)  FROM customers c  JOIN transactions_1k t ON c.CustomerID = t.CustomerID  WHERE c.Currency = 'EUR'	debit_card_specializing
SELECT CustomerID  FROM transactions_1k  WHERE Date = '2012-08-25'  GROUP BY CustomerID  ORDER BY SUM(Amount * Price) DESC  LIMIT 1;	debit_card_specializing
SELECT gs.Country  FROM transactions_1k AS t  JOIN gasstations AS gs ON t.GasStationID = gs.GasStationID  WHERE t.Date = '2012-08-25'  AND t.Amount > 0  AND t.CustomerID IS NOT NULL  ORDER BY t.Time ASC  LIMIT 1;	debit_card_specializing
SELECT customers.Currency  FROM customers  JOIN transactions_1k ON customers.CustomerID = transactions_1k.CustomerID  WHERE transactions_1k.Date = '2012-08-24' AND transactions_1k.Time = '16:25:00';	debit_card_specializing
SELECT customers.Segment  FROM customers  JOIN transactions_1k ON customers.CustomerID = transactions_1k.CustomerID  WHERE transactions_1k.Date = '2012-08-23'  AND transactions_1k.Time = '21:20:00';	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'CZK'  AND t.Date = '2012-08-26'  AND t.Time < '13:00:00'	debit_card_specializing
SELECT Segment FROM customers WHERE CustomerID = (SELECT MIN(CustomerID) FROM customers)	debit_card_specializing
SELECT g.Country  FROM gasstations g  JOIN transactions_1k t ON g.GasStationID = t.GasStationID  WHERE t.Date = '2012-08-24' AND t.Time = '12:42:00';	debit_card_specializing
SELECT ProductID FROM transactions_1k WHERE Date = '2012-08-23' AND Time = '21:20:00';	debit_card_specializing
SELECT Date, Consumption  FROM yearmonth  WHERE CustomerID = (     SELECT CustomerID      FROM transactions_1k      WHERE Date = '2012-08-24' AND Amount = 124.05 )  AND Date = '201201';	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k t  JOIN gasstations g ON t.GasStationID = g.GasStationID  WHERE t.Date = '2012-08-26'  AND t.Time BETWEEN '08:00:00' AND '09:00:00'  AND g.Country = 'CZE'	debit_card_specializing
SELECT c.Currency  FROM customers c  JOIN yearmonth y ON c.CustomerID = y.CustomerID  WHERE y.Date = '201306' AND y.Consumption = 214582.17;	debit_card_specializing
SELECT gs.Country  FROM gasstations gs  JOIN transactions_1k t ON gs.GasStationID = t.GasStationID  WHERE t.CardID = 667467;	debit_card_specializing
SELECT g.Country FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.Date = '2012-08-24' AND (t.Amount * t.Price) = 548.4;	debit_card_specializing
SELECT      (COUNT(DISTINCT c.CustomerID) * 100.0 /      (SELECT COUNT(DISTINCT t.CustomerID) FROM transactions_1k t WHERE t.Date = '2012-08-25')) AS percentage FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE t.Date = '2012-08-25' AND c.Currency = 'EUR';	debit_card_specializing
SELECT      ((consumption_2012 - consumption_2013) / consumption_2012) AS decrease_rate FROM (     SELECT          SUM(CASE WHEN substr(Date,1,4)='2012' THEN Consumption ELSE 0 END) AS consumption_2012,         SUM(CASE WHEN substr(Date,1,4)='2013' THEN Consumption ELSE 0 END) AS consumption_2013     FROM yearmonth     WHERE CustomerID = (         SELECT CustomerID FROM transactions_1k          WHERE Date = '2012-08-25' AND Amount = 634.8     ) );	debit_card_specializing
SELECT GasStationID, SUM(Amount * Price) AS total_revenue FROM transactions_1k WHERE GasStationID IS NOT NULL GROUP BY GasStationID ORDER BY total_revenue DESC LIMIT 1;	debit_card_specializing
SELECT      (CAST(COUNT(CASE WHEN LOWER(Segment) = 'premium' THEN 1 END) AS REAL) / COUNT(*) * 100) AS percentage_premium FROM gasstations WHERE Country = 'SVK';	debit_card_specializing
SELECT      SUM(Amount * Price) AS total_spent,     SUM(CASE WHEN Date = '201201' THEN Amount * Price ELSE 0 END) AS january_2012_spent FROM transactions_1k WHERE CustomerID = 38508;	debit_card_specializing
SELECT p.Description, SUM(t.Amount) AS total_sales FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID GROUP BY p.ProductID, p.Description ORDER BY total_sales DESC LIMIT 5;	debit_card_specializing
SELECT c.Currency, t.AvgPricePerItem, t.CustomerID  FROM (     SELECT CustomerID, SUM(Price) / SUM(Amount) AS AvgPricePerItem, SUM(Price) AS TotalSpent      FROM transactions_1k      GROUP BY CustomerID     ORDER BY TotalSpent DESC      LIMIT 1 ) t  JOIN customers c ON t.CustomerID = c.CustomerID;	debit_card_specializing
SELECT g.Country FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID WHERE t.ProductID = 2    AND t.Price = (SELECT MAX(Price) FROM transactions_1k WHERE ProductID = 2);	debit_card_specializing
SELECT y.CustomerID, y.Consumption  FROM yearmonth y WHERE y.Date = '201208'  AND y.CustomerID IN (     SELECT t.CustomerID      FROM transactions_1k t      WHERE t.ProductID =5      AND (t.Price / t.Amount) > 29.00 );	debit_card_specializing
