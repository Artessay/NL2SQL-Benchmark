SELECT MAX(`Free Meal Count (K-12)` * 1.0 / `Enrollment (K-12)`)  FROM frpm  WHERE `County Name` = 'Alameda County';	california_schools
SELECT `Percent (%) Eligible Free (Ages 5-17)` FROM frpm WHERE `School Type` = 'Continuation' ORDER BY `Percent (%) Eligible Free (Ages 5-17)` ASC LIMIT 3;	california_schools
SELECT DISTINCT s.Zip FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.`Charter School (Y/N)` = 1 AND s.County = 'Fresno' AND s.District = 'Fresno County Office of Education';	california_schools
SELECT s.MailStreet FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode ORDER BY f.`FRPM Count (K-12)` DESC LIMIT 1;	california_schools
SELECT s.Phone FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.`Charter School (Y/N)` = 1   AND f.`Charter Funding Type` = 'Direct'   AND s.OpenDate > '2000-01-01';	california_schools
SELECT COUNT(*)  FROM satscores  JOIN schools ON satscores.cds = schools.CDSCode  WHERE satscores.AvgScrMath > 400 AND schools.Virtual = 'F';	california_schools
SELECT s.School  FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds WHERE sat.NumTstTakr > 500 AND s.Magnet = 1;	california_schools
SELECT s.Phone FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds WHERE sat.NumGE1500 IS NOT NULL ORDER BY sat.NumGE1500 DESC LIMIT 1;	california_schools
SELECT s.NumTstTakr FROM satscores s JOIN frpm f ON s.cds = f.CDSCode WHERE f.`FRPM Count (K-12)` = (     SELECT MAX(`FRPM Count (K-12)`)     FROM frpm );	california_schools
SELECT COUNT(*)  FROM satscores  JOIN schools ON satscores.cds = schools.CDSCode  WHERE satscores.AvgScrMath > 560  AND schools.FundingType = 'Direct Funded';	california_schools
SELECT f.`FRPM Count (Ages 5-17)` FROM frpm f JOIN satscores s ON f.CDSCode = s.cds ORDER BY s.AvgScrRead DESC LIMIT 1;	california_schools
SELECT `CDSCode` FROM `frpm` WHERE (`Enrollment (K-12)` + `Enrollment (Ages 5-17)`) > 500;	california_schools
SELECT MAX(`Free Meal Count (Ages 5-17)` * 1.0 / `Enrollment (Ages 5-17)`)  FROM frpm  JOIN satscores ON frpm.CDSCode = satscores.cds  WHERE satscores.NumGE1500 * 1.0 / satscores.NumTstTakr > 0.3;	california_schools
SELECT s.Phone FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds ORDER BY CAST(sat.NumGE1500 AS REAL) / sat.NumTstTakr DESC LIMIT 3;	california_schools
SELECT s.NCESSchool FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode ORDER BY f.`Enrollment (Ages 5-17)` DESC LIMIT 5;	california_schools
SELECT s.District FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds WHERE s.StatusType = 'Active' GROUP BY s.District ORDER BY AVG(sat.AvgScrRead) DESC LIMIT 1;	california_schools
SELECT COUNT(*)  FROM satscores  WHERE cds IN (     SELECT CDSCode      FROM schools      WHERE County = 'Alameda' )  AND NumTstTakr < 100;	california_schools
SELECT s.School, s.CharterNum FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds WHERE sat.AvgScrWrite > 499 AND s.CharterNum IS NOT NULL ORDER BY sat.AvgScrWrite DESC;	california_schools
SELECT COUNT(*)  FROM satscores  JOIN schools ON satscores.cds = schools.CDSCode  WHERE schools.County = 'Fresno'    AND schools.FundingType = 'Directly Funded'    AND satscores.NumTstTakr <= 250;	california_schools
SELECT s.Phone FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds ORDER BY sat.AvgScrMath DESC LIMIT 1;	california_schools
SELECT COUNT(*)  FROM frpm  WHERE `County Name` = 'Amador'    AND `Low Grade` = '9'    AND `High Grade` = '12';	california_schools
SELECT COUNT(*)  FROM frpm  WHERE `County Name` = 'Los Angeles'    AND `Free Meal Count (K-12)` > 500    AND `FRPM Count (K-12)` < 700;	california_schools
SELECT s.School FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds WHERE s.County = 'Contra Costa' ORDER BY sat.NumTstTakr DESC LIMIT 1;	california_schools
SELECT      s.`School Name`,     sch.`Street`,     sch.`City`,     sch.`State`,     sch.`Zip` FROM      `frpm` s JOIN      `schools` sch ON s.`CDSCode` = sch.`CDSCode` WHERE      ABS(s.`Enrollment (K-12)` - s.`Enrollment (Ages 5-17)`) > 30;	california_schools
SELECT DISTINCT s.School FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode JOIN satscores sat ON s.CDSCode = sat.cds WHERE (f.`Free Meal Count (K-12)` / f.`Enrollment (K-12)`) > 0.1   AND sat.NumGE1500 > 0;	california_schools
SELECT s.School, f.`Charter Funding Type` FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds JOIN frpm f ON s.CDSCode = f.`CDSCode` WHERE s.County = 'Riverside' AND sat.AvgScrMath > 400 GROUP BY s.School, f.`Charter Funding Type` HAVING AVG(sat.AvgScrMath) > 400;	california_schools
SELECT s.School, s.Street, s.City, s.State, s.Zip FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.GSoffered LIKE '%12%'   AND f.`County Name` = 'Monterey'   AND f.`FRPM Count (Ages 5-17)` > 800;	california_schools
SELECT      s.School,      sat.AvgScrWrite,      s.Phone  FROM      schools s  JOIN      satscores sat  ON      s.CDSCode = sat.cds  WHERE      s.OpenDate > '1991-12-31'      OR (s.ClosedDate IS NOT NULL AND s.ClosedDate < '2000-01-01')      AND sat.AvgScrWrite IS NOT NULL;	california_schools
SELECT s.School, s.DOCType FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE (f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`) > (     SELECT AVG(f2.`Enrollment (K-12)` - f2.`Enrollment (Ages 5-17)`)     FROM frpm f2     JOIN schools s2 ON f2.CDSCode = s2.CDSCode     WHERE s2.FundingType = 'Locally Funded' ) AND s.FundingType = 'Locally Funded';	california_schools
SELECT s.OpenDate FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode ORDER BY f.`Enrollment (K-12)` DESC LIMIT 1;	california_schools
SELECT City FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode ORDER BY `Enrollment (K-12)` ASC LIMIT 5;	california_schools
SELECT `Percent (%) Eligible Free (K-12)`  FROM frpm  ORDER BY `Enrollment (K-12)` DESC  LIMIT 2 OFFSET 8;	california_schools
SELECT `Percent (%) Eligible FRPM (K-12)` FROM frpm WHERE `CDSCode` IN (     SELECT `CDSCode`     FROM schools     WHERE `EdOpsCode` = '66' ) ORDER BY `FRPM Count (K-12)` DESC LIMIT 5;	california_schools
SELECT s.Website, s.School FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.`Free Meal Count (Ages 5-17)` BETWEEN 1900 AND 2000;	california_schools
SELECT (`Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)`) AS free_rate FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE (schools.AdmFName1 = 'Kacey' AND schools.AdmLName1 = 'Gibson')    OR (schools.AdmFName2 = 'Kacey' AND schools.AdmLName2 = 'Gibson')    OR (schools.AdmFName3 = 'Kacey' AND schools.AdmLName3 = 'Gibson');	california_schools
SELECT s.AdmEmail1 FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.`Charter School (Y/N)` = 1 ORDER BY f.`Enrollment (K-12)` LIMIT 1;	california_schools
SELECT AdmFName1, AdmLName1, AdmFName2, AdmLName2, AdmFName3, AdmLName3 FROM schools JOIN satscores ON schools.CDSCode = satscores.cds ORDER BY satscores.NumGE1500 DESC LIMIT 1;	california_schools
SELECT s.Street, s.City, s.Zip, s.State FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds ORDER BY CAST(sat.NumGE1500 AS REAL) / sat.NumTstTakr ASC LIMIT 1;	california_schools
SELECT Website FROM schools JOIN satscores ON schools.CDSCode = satscores.cds WHERE County = 'Los Angeles'   AND NumTstTakr BETWEEN 2000 AND 3000;	california_schools
SELECT AVG(s.NumTstTakr)  FROM satscores s JOIN schools sch ON s.cds = sch.CDSCode WHERE sch.County = 'Fresno'    AND strftime('%Y', sch.OpenDate) = '1980';	california_schools
SELECT s.Phone FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds WHERE s.District = 'Fresno Unified' ORDER BY sat.AvgScrRead ASC LIMIT 1;	california_schools
SELECT s.School FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds WHERE s.Virtual = 'F' AND sat.AvgScrRead IS NOT NULL AND (     SELECT COUNT(*)     FROM satscores sat2     JOIN schools s2 ON sat2.cds = s2.CDSCode     WHERE s2.County = s.County     AND sat2.AvgScrRead > sat.AvgScrRead ) < 5	california_schools
SELECT `School Type` FROM frpm WHERE `CDSCode` = (SELECT cds FROM satscores ORDER BY AvgScrMath DESC LIMIT 1)	california_schools
SELECT      s.AvgScrMath,      f.`County Name` FROM      satscores s JOIN      frpm f ON s.cds = f.CDSCode ORDER BY      (s.AvgScrRead + s.AvgScrMath + s.AvgScrWrite) LIMIT 1;	california_schools
SELECT s.City, AVG(ss.AvgScrWrite) AS AverageWritingScore FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.NumGE1500 >= 1500 ORDER BY ss.NumTstTakr DESC LIMIT 1;	california_schools
SELECT s.School, sat.AvgScrWrite FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds WHERE s.AdmLName1 = 'Ulrich' AND s.AdmFName1 = 'Ricci'    OR s.AdmLName2 = 'Ulrich' AND s.AdmFName2 = 'Ricci'    OR s.AdmLName3 = 'Ulrich' AND s.AdmFName3 = 'Ricci';	california_schools
SELECT s.School, f.`Enrollment (K-12)` FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.DOC = '31' ORDER BY f.`Enrollment (K-12)` DESC LIMIT 1;	california_schools
SELECT COUNT(*) * 1.0 / 12 AS monthly_average FROM schools WHERE County = 'Alameda'   AND DOC = '52'   AND OpenDate >= '1980-01-01'   AND OpenDate < '1981-01-01';	california_schools
SELECT      CAST(SUM(CASE WHEN s.DOC = '54' AND s.County = 'Orange' THEN 1 ELSE 0 END) AS FLOAT) /      SUM(CASE WHEN s.DOC = '52' THEN 1 ELSE 0 END) AS ratio FROM schools s;	california_schools
SELECT County, School, ClosedDate FROM schools WHERE StatusType = 'Closed' AND County = (     SELECT County     FROM schools     WHERE StatusType = 'Closed'     GROUP BY County     ORDER BY COUNT(*) DESC     LIMIT 1 ) ORDER BY ClosedDate;	california_schools
SELECT      s.sname,     sch.MailStreet FROM      satscores s JOIN      schools sch ON s.cds = sch.CDSCode ORDER BY      s.AvgScrMath DESC LIMIT 1 OFFSET 6;	california_schools
SELECT s.MailStreet, s.School FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds ORDER BY sat.AvgScrRead ASC LIMIT 1;	california_schools
SELECT COUNT(*)  FROM satscores s JOIN schools sch ON s.cds = sch.CDSCode WHERE (s.AvgScrRead + s.AvgScrMath + s.AvgScrWrite) >= 1500   AND sch.MailCity = 'Lakeport';	california_schools
SELECT SUM(s.NumTstTakr)  FROM satscores s JOIN schools sch ON s.cds = sch.CDSCode WHERE sch.MailCity = 'Fresno';	california_schools
SELECT s.School, s.MailZip FROM schools s WHERE (s.AdmFName1 = 'Avetik' AND s.AdmLName1 = 'Atoian')    OR (s.AdmFName2 = 'Avetik' AND s.AdmLName2 = 'Atoian')    OR (s.AdmFName3 = 'Avetik' AND s.AdmLName3 = 'Atoian');	california_schools
SELECT      CAST(SUM(CASE WHEN s.County = 'Colusa' THEN 1 ELSE 0 END) AS FLOAT) /      SUM(CASE WHEN s.County = 'Humboldt' THEN 1 ELSE 0 END) AS ratio FROM schools s WHERE s.MailState = 'CA';	california_schools
SELECT COUNT(*)  FROM schools  WHERE MailState = 'CA'    AND City = 'San Joaquin'    AND StatusType = 'Active';	california_schools
SELECT s.Phone, s.Ext  FROM schools s  JOIN satscores sat ON s.CDSCode = sat.cds  ORDER BY sat.AvgScrWrite DESC  LIMIT 1 OFFSET 332	california_schools
SELECT s.Phone, s.Ext, s.School  FROM schools s  WHERE s.Zip = '95203-3704';	california_schools
SELECT Website FROM schools WHERE (AdmFName1 = 'Mike' AND AdmLName1 = 'Larson') OR (AdmFName2 = 'Mike' AND AdmLName2 = 'Larson') OR (AdmFName3 = 'Mike' AND AdmLName3 = 'Larson') OR (AdmFName1 = 'Dante' AND AdmLName1 = 'Alvarez') OR (AdmFName2 = 'Dante' AND AdmLName2 = 'Alvarez') OR (AdmFName3 = 'Dante' AND AdmLName3 = 'Alvarez');	california_schools
SELECT Website  FROM schools  WHERE County = 'San Joaquin'    AND Charter = 1    AND Virtual = 'P';	california_schools
SELECT COUNT(*)  FROM schools  WHERE City = 'Hickman'    AND DOC = '52'    AND Charter = 1;	california_schools
SELECT COUNT(*) FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.County = 'Los Angeles'   AND s.Charter = 0   AND (f.`Free Meal Count (K-12)` * 100.0 / f.`Enrollment (K-12)`) < 0.18;	california_schools
SELECT s.School, s.City, s.AdmFName1, s.AdmLName1, s.AdmFName2, s.AdmLName2, s.AdmFName3, s.AdmLName3 FROM schools s WHERE s.Charter = 1 AND s.CharterNum = '00D2';	california_schools
SELECT COUNT(*)  FROM schools  WHERE MailCity = 'Hickman' AND CharterNum = '00D4';	california_schools
SELECT      (COUNT(CASE WHEN `Charter Funding Type` = 'Locally Funded' THEN 1 END) * 100.0 / COUNT(*)) AS percentage_locally_funded FROM      frpm WHERE      `County Name` = 'Santa Clara';	california_schools
SELECT COUNT(*)  FROM schools  WHERE FundingType = 'Directly Funded'    AND County = 'Stanislaus'    AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31';	california_schools
SELECT SUM(CASE WHEN ClosedDate LIKE '1989%' AND County = 'San Francisco' THEN 1 ELSE 0 END) AS TotalClosures FROM schools WHERE District LIKE '%Community College%';	california_schools
SELECT County FROM schools WHERE SOC = '11'   AND ClosedDate >= '1980-01-01'   AND ClosedDate <= '1989-12-31' GROUP BY County ORDER BY COUNT(*) DESC LIMIT 1;	california_schools
SELECT NCESDist FROM schools WHERE SOC = '31';	california_schools
SELECT      COUNT(*) AS count_district_community_day_schools FROM      schools WHERE      County = 'Alpine'      AND SOCType = 'District Community Day School'     AND StatusType IN ('Active', 'Closed');	california_schools
SELECT DISTINCT `District Code`  FROM frpm  JOIN schools ON frpm.`CDSCode` = schools.`CDSCode`  WHERE schools.City = 'Fresno' AND schools.Magnet = 0;	california_schools
SELECT `Enrollment (Ages 5-17)` FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.School = 'State Special School'   AND schools.City = 'Fremont'   AND frpm.`Academic Year` = '2014-2015';	california_schools
SELECT `FRPM Count (Ages 5-17)`  FROM frpm  JOIN schools ON frpm.CDSCode = schools.CDSCode  WHERE schools.School = 'Youth Authority School' AND schools.MailStreet = 'PO Box 1040';	california_schools
SELECT `Low Grade` FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.EdOpsCode = 'SPECON' AND schools.NCESDist = '0613360';	california_schools
SELECT s.School, f.`Educational Option Type` FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.`County Code` = '37' AND f.`NSLP Provision Status` = 'Breakfast Provision 2';	california_schools
SELECT s.City FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.EILCode = 'HS'   AND f.`NSLP Provision Status` = '2'   AND f.`Low Grade` = '9'   AND f.`High Grade` = '12'   AND f.`County Name` = 'Merced';	california_schools
SELECT      s.`School`,      f.`Percent (%) Eligible FRPM (Ages 5-17)` FROM      schools s JOIN      frpm f ON s.`CDSCode` = f.`CDSCode` WHERE      s.`County` = 'Los Angeles'      AND f.`Low Grade` = 'K'      AND f.`High Grade` = '9';	california_schools
SELECT GSserved FROM schools WHERE City = 'Adelanto' GROUP BY GSserved ORDER BY COUNT(*) DESC LIMIT 1;	california_schools
SELECT      County,     COUNT(*) AS NumberOfSchools FROM      schools WHERE      Virtual = 'F'     AND County IN ('San Diego', 'Santa Barbara') GROUP BY      County ORDER BY      NumberOfSchools DESC LIMIT 1;	california_schools
SELECT `School Type`, `School Name`, `Latitude`  FROM `frpm`  JOIN `schools` ON `frpm`.`CDSCode` = `schools`.`CDSCode`  ORDER BY `Latitude` DESC  LIMIT 1;	california_schools
SELECT s.City, f.`Low Grade`, s.School FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.State = 'CA' ORDER BY s.Latitude ASC LIMIT 1;	california_schools
SELECT GSoffered FROM schools ORDER BY ABS(Longitude) DESC LIMIT 1;	california_schools
SELECT      COUNT(CASE WHEN f.`NSLP Provision Status` = 'Multiple Provision Types' THEN 1 END) AS schools_with_multiple_provision_types,     s.City,     COUNT(*) AS number_of_schools FROM      schools s INNER JOIN      frpm f ON s.CDSCode = f.CDSCode WHERE      s.Magnet = 1      AND s.GSoffered LIKE '%K-8%' GROUP BY      s.City;	california_schools
SELECT AdmFName1, District  FROM schools  WHERE AdmFName1 IS NOT NULL  GROUP BY AdmFName1, District  ORDER BY COUNT(*) DESC  LIMIT 2;	california_schools
SELECT      f.`Percent (%) Eligible Free (K-12)`,     f.`District Code` FROM      frpm f JOIN      schools s ON f.CDSCode = s.CDSCode WHERE      s.AdmFName1 = 'Alusine' OR s.AdmFName2 = 'Alusine' OR s.AdmFName3 = 'Alusine';	california_schools
SELECT s.AdmLName1, s.District, s.County, s.School FROM schools s WHERE s.CharterNum = '40';	california_schools
SELECT AdmEmail1, AdmEmail2, AdmEmail3 FROM schools WHERE County = 'San Bernardino'   AND District = 'San Bernardino City Unified'   AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31'   AND (SOC = '62' OR DOC = '54');	california_schools
SELECT s.AdmEmail1, s.School  FROM schools s  JOIN satscores sat ON s.CDSCode = sat.cds  ORDER BY sat.NumGE1500 DESC  LIMIT 1;	california_schools
SELECT COUNT(*)  FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.frequency = 'POPLATEK PO OBRATU' AND d.A3 = 'East Bohemia';	financial
SELECT COUNT(*)  FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A3 LIKE '%Prague%' AND a.account_id IN (SELECT DISTINCT account_id FROM loan);	financial
SELECT      CASE          WHEN AVG(A12) > AVG(A13) THEN '1995'         WHEN AVG(A12) < AVG(A13) THEN '1996'         ELSE 'Equal'     END AS higher_unemployment_year FROM district;	financial
SELECT COUNT(*)  FROM district d JOIN client c ON d.district_id = c.district_id WHERE c.gender = 'F' GROUP BY d.district_id HAVING AVG(d.A11) > 6000 AND AVG(d.A11) < 10000;	financial
SELECT COUNT(*)  FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'M'    AND d.A3 = 'North Bohemia'    AND d.A11 > 8000;	financial
SELECT      a.account_id,     (SELECT MAX(A11) FROM district) - (SELECT MIN(A11) FROM district WHERE district_id IN (         SELECT c.district_id          FROM client c          WHERE c.gender = 'F'          ORDER BY c.birth_date ASC          LIMIT 1     )) AS salary_gap FROM      account a JOIN      disp d ON a.account_id = d.account_id JOIN      client c ON d.client_id = c.client_id JOIN      district di ON c.district_id = di.district_id WHERE      c.gender = 'F' ORDER BY      c.birth_date ASC,      di.A11 ASC LIMIT 1;	financial
SELECT a.account_id FROM account a JOIN client c ON a.district_id = c.district_id JOIN district d ON c.district_id = d.district_id WHERE c.birth_date = (SELECT MAX(birth_date) FROM client) ORDER BY d.A11 DESC LIMIT 1;	financial
SELECT COUNT(*)  FROM account a JOIN disp d ON a.account_id = d.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND d.type = 'OWNER';	financial
SELECT DISTINCT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE d.type = 'DISPONENT' AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.status = 'A'    AND strftime('%Y', l.date) = '1997'   AND a.frequency = 'POPLATEK TYDNE' ORDER BY l.amount ASC LIMIT 1;	financial
SELECT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 12   AND a.date LIKE '1993%' ORDER BY l.amount DESC LIMIT 1;	financial
SELECT COUNT(*)  FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F'    AND c.birth_date < '1950-01-01'   AND d.A2 = 'Sokolov';	financial
SELECT account_id FROM account WHERE date = (     SELECT MIN(date)     FROM account     WHERE strftime('%Y', date) = '1995' );	financial
SELECT DISTINCT a.account_id FROM account a JOIN trans t ON a.account_id = t.account_id WHERE a.date < '1997-01-01'   AND t.balance > 3000;	financial
SELECT client_id FROM card JOIN disp ON card.disp_id = disp.disp_id WHERE issued = '1994-03-03';	financial
SELECT date FROM account WHERE account_id IN (SELECT account_id FROM trans WHERE amount = 840 AND date = '1998-10-14');	financial
SELECT a.district_id  FROM account a  JOIN loan l ON a.account_id = l.account_id  WHERE l.date = '1994-08-25';	financial
SELECT MAX(t.amount)  FROM trans t JOIN account a ON t.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id JOIN card c ON d.disp_id = c.disp_id WHERE c.issued = '1996-10-21';	financial
SELECT c.gender FROM client c JOIN account a ON c.account_id = a.account_id JOIN district d ON a.district_id = d.district_id ORDER BY c.birth_date ASC, d.A11 DESC LIMIT 1;	financial
SELECT t.amount  FROM trans t  JOIN loan l ON t.account_id = l.account_id  WHERE l.amount = (SELECT MAX(amount) FROM loan)  AND t.date > (SELECT date FROM account WHERE account_id = l.account_id)  ORDER BY t.date  LIMIT 1;	financial
SELECT COUNT(*)  FROM client c JOIN account a ON c.district_id = a.district_id JOIN district d ON c.district_id = d.district_id WHERE d.A2 = 'Jesenik' AND c.gender = 'F';	financial
SELECT t.account_id  FROM trans t  WHERE t.amount = 5100 AND t.date = '1998-09-02';	financial
SELECT COUNT(*)  FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Litomerice' AND strftime('%Y', a.date) = '1996';	financial
SELECT d.A2 FROM client c JOIN account a ON c.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE c.gender = 'F' AND c.birth_date = '1976-01-29';	financial
SELECT c.birth_date FROM client c JOIN account a ON c.account_id = a.account_id JOIN loan l ON a.account_id = l.account_id WHERE l.amount = 98832 AND l.date = '1996-01-03';	financial
SELECT a.account_id FROM account a JOIN client c ON a.district_id = c.district_id JOIN district d ON c.district_id = d.district_id WHERE d.A3 = 'Prague' ORDER BY a.date LIMIT 1;	financial
SELECT (COUNT(CASE WHEN c.gender = 'M' THEN 1 END) * 100.0 / COUNT(*)) AS percentage_male_clients FROM client c JOIN district d ON c.district_id = d.district_id WHERE d.A3 = 'Jihocesky kraj' ORDER BY d.A4 DESC LIMIT 1;	financial
SELECT ((t1.balance - t2.balance) * 100.0 / t2.balance) FROM trans t1 JOIN trans t2 ON t1.account_id = t2.account_id JOIN loan l ON t1.account_id = l.account_id WHERE l.date = '1993-07-05'   AND t1.date = '1998-12-27'   AND t2.date = '1993-03-22' ORDER BY l.date LIMIT 1;	financial
SELECT (SUM(CASE WHEN status = 'A' THEN amount ELSE 0 END) * 100.0 / SUM(amount)) AS percentage_fully_paid_no_issue FROM loan;	financial
SELECT (COUNT(CASE WHEN status = 'C' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM loan WHERE amount < 100000;	financial
SELECT a.account_id, d.A2, d.A3 FROM account a JOIN district d ON a.district_id = d.district_id WHERE strftime('%Y', a.date) = '1993'   AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT a.account_id, a.frequency FROM account a JOIN client c ON d.client_id = c.client_id JOIN disp d ON a.account_id = d.account_id JOIN district di ON c.district_id = di.district_id WHERE a.date BETWEEN '1995-01-01' AND '2000-12-31'   AND di.A3 = 'east Bohemia'   AND d.type = 'OWNER';	financial
SELECT a.account_id, a.date FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Prachatice';	financial
SELECT d.A2, d.A3  FROM district d  JOIN account a ON d.district_id = a.district_id  JOIN loan l ON a.account_id = l.account_id  WHERE l.loan_id = 4990;	financial
SELECT a.account_id, d.A2 AS district, d.A3 AS region FROM account a JOIN loan l ON a.account_id = l.account_id JOIN district d ON a.district_id = d.district_id WHERE l.amount > 300000;	financial
SELECT l.loan_id, d.A3, d.A11  FROM loan l  JOIN account a ON l.account_id = a.account_id  JOIN district d ON a.district_id = d.district_id  WHERE l.duration = 60;	financial
SELECT      d.A2 AS district,     ((d.A13 - d.A12) / d.A12) * 100 AS unemployment_increment_percentage FROM      loan l JOIN      account a ON l.account_id = a.account_id JOIN      district d ON a.district_id = d.district_id WHERE      l.status = 'D';	financial
SELECT      (COUNT(CASE WHEN d.A2 = 'Decin' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM      account a JOIN      district d ON a.district_id = d.district_id WHERE      strftime('%Y', a.date) = '1993';	financial
SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE';	financial
SELECT d.A2, COUNT(*) AS female_count FROM account a JOIN disp dp ON a.account_id = dp.account_id JOIN client c ON dp.client_id = c.client_id JOIN district d ON a.district_id = d.district_id WHERE c.gender = 'F' GROUP BY d.A2 ORDER BY female_count DESC LIMIT 9;	financial
SELECT d.A2, t.amount FROM trans t JOIN account a ON t.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE t.type = 'VYDAJ' AND t.date LIKE '1996-01%' ORDER BY t.amount DESC LIMIT 10;	financial
SELECT COUNT(*)  FROM client c JOIN account a ON c.client_id = a.district_id LEFT JOIN disp d ON c.client_id = d.client_id AND d.type = 'OWNER' LEFT JOIN card ca ON d.disp_id = ca.disp_id JOIN district di ON c.district_id = di.district_id WHERE di.A3 = 'South Bohemia' AND ca.card_id IS NULL;	financial
SELECT d.A3  FROM district d JOIN account a ON d.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.status IN ('C', 'D') ORDER BY l.amount DESC LIMIT 1;	financial
SELECT AVG(l.amount)  FROM loan l JOIN account a ON l.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id WHERE c.gender = 'M';	financial
SELECT A2, A6  FROM district  ORDER BY A13 DESC;	financial
SELECT COUNT(*)  FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A16 = (SELECT MAX(A16) FROM district)	financial
SELECT COUNT(*)  FROM trans t JOIN account a ON t.account_id = a.account_id WHERE t.operation = 'VYBER KARTOU'    AND a.frequency = 'POPLATEK MESICNE'   AND t.balance < 0;	financial
SELECT COUNT(*)  FROM loan l JOIN account a ON l.account_id = a.account_id WHERE l.date BETWEEN '1995-01-01' AND '1997-12-31'   AND l.amount >= 250000   AND l.status = 'A'   AND a.frequency = 'POPLATEK MESICNE';	financial
SELECT COUNT(*)  FROM loan  WHERE status IN ('C', 'D')  AND account_id IN (     SELECT account_id      FROM account      WHERE district_id = 1 );	financial
SELECT COUNT(*)  FROM client  WHERE gender = 'M'    AND district_id = (     SELECT district_id      FROM district      ORDER BY A15 DESC      LIMIT 1 OFFSET 1   );	financial
SELECT COUNT(*)  FROM card c JOIN disp d ON c.disp_id = d.disp_id WHERE c.type = 'gold' AND d.type = 'OWNER';	financial
SELECT COUNT(*) FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Pisek';	financial
SELECT DISTINCT d.A2 FROM district d JOIN account a ON d.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id WHERE t.amount > 10000   AND strftime('%Y', t.date) = '1997';	financial
SELECT DISTINCT a.account_id FROM account a JOIN order o ON a.account_id = o.account_id JOIN district d ON a.district_id = d.district_id WHERE o.k_symbol = 'SIPO' AND d.A2 = 'Pisek';	financial
SELECT a.account_id FROM account a JOIN disp d ON a.account_id = d.account_id JOIN card c ON d.disp_id = c.disp_id WHERE c.type = 'gold';	financial
SELECT AVG(t.amount)  FROM trans t  WHERE t.operation = 'VYBER KARTOU'    AND strftime('%Y', t.date) = '2021';	financial
SELECT DISTINCT a.account_id FROM account a JOIN trans t ON a.account_id = t.account_id WHERE t.operation = 'VYBER KARTOU'   AND t.amount < (SELECT AVG(amount) FROM trans WHERE operation = 'VYBER KARTOU')   AND strftime('%Y', t.date) = '1998';	financial
SELECT DISTINCT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card ca ON d.disp_id = ca.disp_id JOIN loan l ON d.account_id = l.account_id WHERE c.gender = 'F' AND d.type = 'OWNER';	financial
SELECT COUNT(*)  FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F' AND d.A3 = 'South Bohemia';	financial
SELECT a.account_id FROM account a JOIN district d ON a.district_id = d.district_id JOIN disp dp ON a.account_id = dp.account_id WHERE d.A2 = 'Tabor'   AND dp.type = 'OWNER';	financial
SELECT DISTINCT a.frequency FROM account a JOIN district d ON a.district_id = d.district_id LEFT JOIN disp dp ON a.account_id = dp.account_id AND dp.type = 'OWNER' WHERE d.A11 > 8000 AND d.A11 <= 9000 AND dp.disp_id IS NULL;	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN district d ON a.district_id = d.district_id JOIN trans t ON a.account_id = t.account_id WHERE d.A3 = 'North Bohemia' AND t.bank = 'AB';	financial
SELECT DISTINCT d.A2 FROM district d JOIN account a ON d.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id WHERE t.type = 'VYDAJ';	financial
SELECT AVG(A15)  FROM district  WHERE A15 > 4000    AND district_id IN (     SELECT DISTINCT district_id      FROM account      WHERE strftime('%Y', date) >= '1997'   );	financial
SELECT COUNT(*)  FROM card c JOIN disp d ON c.disp_id = d.disp_id WHERE c.type = 'classic' AND d.type = 'OWNER';	financial
SELECT COUNT(*)  FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'M' AND d.A2 = 'Hl.m. Praha';	financial
SELECT (COUNT(CASE WHEN type = 'gold' AND issued < '1998-01-01' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM card;	financial
SELECT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN loan l ON a.account_id = l.account_id WHERE d.type = 'OWNER' ORDER BY l.amount DESC LIMIT 1;	financial
SELECT d.A15  FROM district d  JOIN account a ON d.district_id = a.district_id  WHERE a.account_id = 532;	financial
SELECT a.district_id FROM account a JOIN `order` o ON a.account_id = o.account_id WHERE o.order_id = 33333;	financial
SELECT * FROM trans WHERE account_id IN (SELECT account_id FROM disp WHERE client_id = 3356) AND operation = 'VYBER';	financial
SELECT COUNT(*)  FROM account a JOIN loan l ON a.account_id = l.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND l.amount < 200000;	financial
SELECT c.type  FROM card c  JOIN disp d ON c.disp_id = d.disp_id  WHERE d.client_id = 13539;	financial
SELECT A3 FROM district WHERE district_id = (SELECT district_id FROM client WHERE client_id = 3541);	financial
SELECT a.district_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.status = 'A' GROUP BY a.district_id ORDER BY COUNT(*) DESC LIMIT 1;	financial
SELECT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN order o ON a.account_id = o.account_id WHERE o.order_id = 32423;	financial
SELECT t.*  FROM trans t JOIN account a ON t.account_id = a.account_id WHERE a.district_id = 5;	financial
SELECT COUNT(*) FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Jesenik';	financial
SELECT client.client_id FROM client JOIN disp ON client.client_id = disp.client_id JOIN card ON disp.disp_id = card.disp_id WHERE card.type = 'junior' AND card.issued >= '1997-01-01';	financial
SELECT      CAST(SUM(CASE WHEN c.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM      client c JOIN      account a ON c.account_id = a.account_id JOIN      district d ON a.district_id = d.district_id WHERE      d.A11 > 10000;	financial
SELECT      ((SUM(CASE WHEN strftime('%Y', l.date) = '1997' THEN l.amount ELSE 0 END) - SUM(CASE WHEN strftime('%Y', l.date) = '1996' THEN l.amount ELSE 0 END)) * 100.0 /      SUM(CASE WHEN strftime('%Y', l.date) = '1996' THEN l.amount ELSE 0 END)) AS growth_rate FROM loan l JOIN account a ON l.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id WHERE c.gender = 'M'     AND strftime('%Y', l.date) IN ('1996', '1997');	financial
SELECT COUNT(*)  FROM trans  WHERE operation = 'VYBER KARTOU'    AND date > '1995-12-31';	financial
SELECT      (SELECT SUM(A16) FROM district WHERE A3 = 'North Bohemia') -      (SELECT SUM(A16) FROM district WHERE A3 = 'East Bohemia') AS crime_difference;	financial
SELECT COUNT(*)  FROM disp  WHERE account_id BETWEEN 1 AND 10;	financial
SELECT frequency FROM account WHERE account_id = 3; SELECT k_symbol, SUM(amount) AS total_debit FROM trans WHERE account_id = 3 AND type = 'VYDAJ' GROUP BY k_symbol HAVING total_debit = 3539;	financial
SELECT strftime('%Y', birth_date) FROM client WHERE client_id = 130;	financial
SELECT COUNT(*)  FROM account a JOIN disp d ON a.account_id = d.account_id WHERE d.type = 'OWNER' AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT l.amount, l.payments, l.status  FROM loan l  JOIN account a ON l.account_id = a.account_id  JOIN disp d ON a.account_id = d.account_id  WHERE d.client_id = 992;	financial
SELECT t.balance, c.gender  FROM trans t  JOIN account a ON t.account_id = a.account_id  JOIN disp d ON a.account_id = d.account_id  JOIN client c ON d.client_id = c.client_id  WHERE c.client_id = 4 AND t.trans_id = 851;	financial
SELECT c.type  FROM card c  JOIN disp d ON c.disp_id = d.disp_id  WHERE d.client_id = 9;	financial
SELECT SUM(t.amount)  FROM trans t JOIN account a ON t.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id WHERE d.client_id = 617    AND strftime('%Y', t.date) = '1998'   AND t.type = 'VYDAJ';	financial
SELECT c.client_id FROM client c JOIN account a ON c.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE c.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND d.A3 = 'East Bohemia';	financial
SELECT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN loan l ON d.account_id = l.account_id WHERE c.gender = 'F' ORDER BY l.amount DESC LIMIT 3;	financial
SELECT COUNT(*)  FROM client c JOIN account a ON c.client_id = a.account_id JOIN `order` o ON a.account_id = o.account_id WHERE c.gender = 'M'    AND c.birth_date BETWEEN '1974-01-01' AND '1976-12-31'   AND o.k_symbol = 'SIPO'   AND o.amount > 4000;	financial
SELECT COUNT(*)  FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Beroun' AND a.date > '1996-12-31';	financial
SELECT COUNT(*)  FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card ca ON d.disp_id = ca.disp_id WHERE c.gender = 'F' AND ca.type = 'junior';	financial
SELECT CAST(SUM(CASE WHEN c.gender = 'F' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*)  FROM client c JOIN account a ON c.district_id = a.district_id JOIN district d ON a.district_id = d.district_id WHERE d.A3 LIKE '%Prague%';	financial
SELECT (COUNT(CASE WHEN c.gender = 'M' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM account a JOIN client c ON a.district_id = c.district_id WHERE a.frequency = 'POPLATEK TYDNE';	financial
SELECT COUNT(*)  FROM account a JOIN disp d ON a.account_id = d.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND d.type = 'OWNER';	financial
SELECT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 24 AND a.date < '1997-01-01' AND l.status = 'A' ORDER BY l.amount ASC LIMIT 1;	financial
SELECT a.account_id FROM account a JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id JOIN district dist ON c.district_id = dist.district_id WHERE c.gender = 'F' ORDER BY c.birth_date ASC, dist.A11 ASC LIMIT 1;	financial
SELECT COUNT(*)  FROM client c JOIN district d ON c.district_id = d.district_id WHERE strftime('%Y', c.birth_date) = '1920' AND d.A3 = 'east Bohemia';	financial
SELECT COUNT(*)  FROM loan l JOIN account a ON l.account_id = a.account_id WHERE l.duration = 24 AND a.frequency = 'POPLATEK TYDNE';	financial
SELECT AVG(l.amount)  FROM loan l JOIN account a ON l.account_id = a.account_id WHERE l.status IN ('C', 'D')    AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT c.client_id, c.district_id FROM client c JOIN disp d ON c.client_id = d.client_id WHERE d.type = 'OWNER';	financial
SELECT c.client_id, (strftime('%Y', 'now') - strftime('%Y', c.birth_date)) AS age FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card ca ON d.disp_id = ca.disp_id WHERE ca.type = 'gold' AND d.type = 'OWNER';	financial
SELECT bond_type  FROM bond  GROUP BY bond_type  ORDER BY COUNT(bond_type) DESC  LIMIT 1;	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '-' AND a.element = 'cl';	toxicology
SELECT AVG(CASE WHEN a.element = 'o' THEN 1 ELSE 0 END) FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-';	toxicology
SELECT CAST(SUM(CASE WHEN b.bond_type = '-' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(a.atom_id)  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  JOIN connected c ON a.atom_id = c.atom_id  JOIN bond b ON c.bond_id = b.bond_id  WHERE m.label = '+';	toxicology
SELECT COUNT(*)  FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'na' AND m.label = '-';	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '#' AND m.label = '+';	toxicology
SELECT CAST(SUM(CASE WHEN a.element = 'c' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(a.atom_id) FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '=';	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '#';	toxicology
SELECT COUNT(*) FROM atom WHERE element != 'br';	toxicology
SELECT COUNT(*)  FROM molecule  WHERE molecule_id BETWEEN 'TR000' AND 'TR099'    AND label = '+';	toxicology
SELECT DISTINCT molecule_id FROM atom WHERE element = 'c';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE c.bond_id = 'TR004_8_9';	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '=';	toxicology
SELECT label  FROM molecule  WHERE molecule_id IN (     SELECT DISTINCT molecule_id      FROM atom      WHERE element = 'h' )  GROUP BY label  ORDER BY COUNT(*) DESC  LIMIT 1;	toxicology
SELECT DISTINCT b.bond_type  FROM bond b  JOIN connected c ON b.bond_id = c.bond_id  JOIN atom a ON c.atom_id = a.atom_id  WHERE a.element = 'cl';	toxicology
SELECT c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-';	toxicology
SELECT a1.atom_id, a2.atom_id2 FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id JOIN molecule m ON a1.molecule_id = m.molecule_id WHERE m.label = '-';	toxicology
SELECT element FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '-' GROUP BY element ORDER BY COUNT(element) ASC LIMIT 1;	toxicology
SELECT b.bond_type  FROM bond b  JOIN connected c ON b.bond_id = c.bond_id  WHERE (c.atom_id = 'TR004_8' AND c.atom_id2 = 'TR004_20')     OR (c.atom_id = 'TR004_20' AND c.atom_id2 = 'TR004_8');	toxicology
SELECT DISTINCT label FROM molecule WHERE molecule_id NOT IN (SELECT DISTINCT molecule_id FROM atom WHERE element = 'sn') AND label IS NOT NULL;	toxicology
SELECT COUNT(DISTINCT a.atom_id)  FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id WHERE a.element IN ('i', 's')    AND b.bond_type = '-';	toxicology
SELECT c.atom_id, c.atom_id2  FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#';	toxicology
SELECT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE a.molecule_id = 'TR181';	toxicology
SELECT (COUNT(DISTINCT CASE WHEN a.element = 'f' THEN m.molecule_id END) * 100.0 / COUNT(DISTINCT m.molecule_id)) AS percentage FROM molecule m LEFT JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+';	toxicology
SELECT SUM(CASE WHEN b.bond_type = '#' THEN 1 ELSE 0 END) * 100.0 / COUNT(b.bond_id) AS percent FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.label = '+';	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR000' ORDER BY element LIMIT 3;	toxicology
SELECT atom_id, atom_id2 FROM connected WHERE bond_id = 'TR001_2_6';	toxicology
SELECT SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN label = '-' THEN 1 ELSE 0 END) FROM molecule;	toxicology
SELECT atom_id, atom_id2  FROM connected  WHERE bond_id = 'TR000_2_5';	toxicology
SELECT bond_id FROM connected WHERE atom_id2 = 'TR000_2';	toxicology
SELECT DISTINCT molecule_id  FROM bond  WHERE bond_type = '='  ORDER BY molecule_id  LIMIT 5;	toxicology
SELECT ROUND(CAST(SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(bond_id), 5) AS percent FROM bond WHERE molecule_id = 'TR008';	toxicology
SELECT ROUND(CAST(SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(molecule_id), 3) AS percent FROM molecule;	toxicology
SELECT ROUND(CAST(SUM(CASE WHEN element = 'h' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(atom_id), 4) AS percent FROM atom WHERE molecule_id = 'TR206';	toxicology
SELECT bond_type FROM bond WHERE molecule_id = 'TR000';	toxicology
SELECT a.element, m.label  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE m.molecule_id = 'TR060';	toxicology
SELECT bond_type, label FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.molecule_id = 'TR010' GROUP BY bond_type ORDER BY COUNT(bond_type) DESC LIMIT 1;	toxicology
SELECT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.label = '-' AND b.bond_type = '-' ORDER BY m.molecule_id LIMIT 3;	toxicology
SELECT bond_id  FROM bond  WHERE molecule_id = 'TR006'  ORDER BY bond_id  LIMIT 2;	toxicology
SELECT COUNT(*)  FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE (c.atom_id = 'TR009_12' OR c.atom_id2 = 'TR009_12')   AND b.molecule_id = 'TR009';	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' AND a.element = 'br';	toxicology
SELECT bond.bond_type, connected.atom_id, connected.atom_id2  FROM bond  JOIN connected ON bond.bond_id = connected.bond_id  WHERE bond.bond_id = 'TR001_6_9';	toxicology
SELECT m.molecule_id,         CASE WHEN m.label = '+' THEN 'carcinogenic' ELSE 'not carcinogenic' END  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE a.atom_id = 'TR001_10';	toxicology
SELECT COUNT(DISTINCT molecule_id) FROM bond WHERE bond_type = '#';	toxicology
SELECT COUNT(bond_id) FROM connected WHERE atom_id LIKE 'TR%_19' OR atom_id2 LIKE 'TR%_19';	toxicology
SELECT a.element FROM atom a WHERE a.molecule_id = 'TR004';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '-';	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE SUBSTR(a.atom_id, 7, 2) BETWEEN '21' AND '25' AND m.label = '+';	toxicology
SELECT b.bond_id, b.molecule_id, b.bond_type FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE (a1.element = 'p' AND a2.element = 'n') OR (a1.element = 'n' AND a2.element = 'p');	toxicology
SELECT m.label = '+' AS is_carcinogenic FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '=' GROUP BY m.molecule_id ORDER BY COUNT(b.bond_id) DESC LIMIT 1;	toxicology
SELECT CAST(COUNT(bond_id) AS FLOAT) / COUNT(DISTINCT atom_id)  FROM connected  WHERE atom_id IN (SELECT atom_id FROM atom WHERE element = 'i');	toxicology
SELECT b.bond_type, b.bond_id  FROM bond b  JOIN connected c ON b.bond_id = c.bond_id  WHERE CAST(SUBSTR(c.atom_id, 7, 2) AS INTEGER) = 45 OR CAST(SUBSTR(c.atom_id2, 7, 2) AS INTEGER) = 45;	toxicology
SELECT element FROM atom WHERE atom_id NOT IN (SELECT atom_id FROM connected);	toxicology
SELECT a.atom_id, a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.molecule_id = 'TR041' AND b.bond_type = '#';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE c.bond_id = 'TR144_8_19';	toxicology
SELECT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.label = '+' AND b.bond_type = '=' GROUP BY m.molecule_id ORDER BY COUNT(b.bond_id) DESC LIMIT 1;	toxicology
SELECT element FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '+' GROUP BY element ORDER BY COUNT(*) ASC LIMIT 1;	toxicology
SELECT c.atom_id2  FROM connected c  JOIN atom a ON c.atom_id = a.atom_id  WHERE a.element = 'pb';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#';	toxicology
SELECT      CAST(COUNT(b.bond_id) AS FLOAT) * 100 / (SELECT COUNT(*) FROM bond)  FROM      bond b     JOIN connected c ON b.bond_id = c.bond_id     JOIN atom a1 ON c.atom_id = a1.atom_id     JOIN atom a2 ON c.atom_id2 = a2.atom_id GROUP BY      a1.element, a2.element ORDER BY      COUNT(*) DESC LIMIT 1;	toxicology
SELECT CAST(SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) * 100.0 / COUNT(b.bond_id) AS DECIMAL(10,5))  FROM bond b  JOIN molecule m ON b.molecule_id = m.molecule_id  WHERE b.bond_type = '-';	toxicology
SELECT COUNT(*) FROM atom WHERE element IN ('c', 'h');	toxicology
SELECT c.atom_id2 FROM connected c JOIN atom a ON c.atom_id = a.atom_id WHERE a.element = 's';	toxicology
SELECT b.bond_type  FROM bond b  JOIN atom a ON b.molecule_id = a.molecule_id  WHERE a.element = 'sn';	toxicology
SELECT COUNT(DISTINCT a.element)  FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id WHERE b.bond_type = '-';	toxicology
SELECT COUNT(*)  FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#' AND (a.element = 'p' OR a.element = 'br');	toxicology
SELECT bond_id FROM bond WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+');	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '-' AND m.label = '-';	toxicology
SELECT CAST(SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(a.atom_id) AS percent FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-';	toxicology
SELECT label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002');	toxicology
SELECT molecule_id FROM molecule WHERE label = '-';	toxicology
SELECT COUNT(*)  FROM molecule  WHERE molecule_id BETWEEN 'TR000' AND 'TR030'    AND label = '+';	toxicology
SELECT bond_type  FROM bond  WHERE molecule_id BETWEEN 'TR000' AND 'TR050';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE c.bond_id = 'TR001_10_11';	toxicology
SELECT COUNT(b.bond_id)  FROM bond b JOIN atom a ON b.molecule_id = a.molecule_id WHERE a.element = 'i';	toxicology
SELECT label  FROM molecule  WHERE molecule_id IN (     SELECT DISTINCT molecule_id      FROM atom      WHERE element = 'ca' )  GROUP BY label  ORDER BY COUNT(*) DESC  LIMIT 1;	toxicology
SELECT CASE WHEN EXISTS (     SELECT 1      FROM connected c      JOIN atom a1 ON c.atom_id = a1.atom_id      JOIN atom a2 ON c.atom_id2 = a2.atom_id      WHERE c.bond_id = 'TR001_1_8'      AND a1.element = 'cl'      AND a2.element = 'c' ) OR EXISTS (     SELECT 1      FROM connected c      JOIN atom a1 ON c.atom_id = a1.atom_id      JOIN atom a2 ON c.atom_id2 = a2.atom_id      WHERE c.bond_id = 'TR001_1_8'      AND a1.element = 'c'      AND a2.element = 'cl' ) THEN 'Yes' ELSE 'No' END;	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id JOIN atom a ON m.molecule_id = a.molecule_id WHERE b.bond_type = '#'    AND a.element = 'c'   AND m.label = '-' LIMIT 2;	toxicology
SELECT CAST(SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(DISTINCT m.molecule_id) AS percentage FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+';	toxicology
SELECT a.element FROM atom a WHERE a.molecule_id = 'TR001';	toxicology
SELECT molecule_id FROM bond WHERE bond_type = '=';	toxicology
SELECT c.atom_id, c.atom_id2  FROM connected c  JOIN bond b ON c.bond_id = b.bond_id  WHERE b.bond_type = '#';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE c.bond_id = 'TR000_1_2';	toxicology
SELECT COUNT(*)  FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.label = '-' AND b.bond_type = '-';	toxicology
SELECT m.label FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_id = 'TR001_10_11';	toxicology
SELECT b.bond_id, m.label  FROM bond b  JOIN molecule m ON b.molecule_id = m.molecule_id  WHERE b.bond_type = '#';	toxicology
SELECT a.element  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE substr(a.atom_id, 7, 1) = '4' AND m.label = '+';	toxicology
SELECT CAST(SUM(CASE WHEN a.element = 'h' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(a.element) AS ratio, m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.molecule_id = 'TR006' GROUP BY m.label;	toxicology
SELECT m.label  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE a.element = 'ca';	toxicology
SELECT DISTINCT b.bond_type FROM bond b JOIN atom a ON b.molecule_id = a.molecule_id WHERE a.element = 'c';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE c.bond_id = 'TR001_10_11';	toxicology
SELECT      (COUNT(CASE WHEN b.bond_type = '#' THEN 1 END) * 100.0 / COUNT(DISTINCT m.molecule_id)) AS percentage FROM      molecule m LEFT JOIN      bond b ON m.molecule_id = b.molecule_id;	toxicology
SELECT CAST(SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(bond_id) AS percent FROM bond WHERE molecule_id = 'TR047';	toxicology
SELECT m.label  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE a.atom_id = 'TR001_1';	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR151';	toxicology
SELECT DISTINCT element FROM atom WHERE molecule_id = 'TR151';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+';	toxicology
SELECT atom_id  FROM atom  WHERE molecule_id IN (     SELECT molecule_id      FROM molecule      WHERE substr(molecule_id, 3, 3) >= '10' AND substr(molecule_id, 3, 3) <= '50' )  AND element = 'c';	toxicology
SELECT COUNT(*) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+';	toxicology
SELECT bond_id FROM bond WHERE bond_type = '=' AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+');	toxicology
SELECT COUNT(*)  FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'h' AND m.label = '+';	toxicology
SELECT molecule_id FROM bond WHERE bond_id = 'TR000_1_2';	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c' AND m.label = '-'	toxicology
SELECT (SUM(CASE WHEN m.label = '+' AND a.element = 'h' THEN 1 ELSE 0 END) * 100.0 / COUNT(DISTINCT m.molecule_id)) AS percentage FROM molecule m LEFT JOIN atom a ON m.molecule_id = a.molecule_id;	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR124';	toxicology
SELECT a.atom_id, a.element FROM atom a WHERE a.molecule_id = 'TR186';	toxicology
SELECT bond_type FROM bond WHERE bond_id = 'TR007_4_19';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE c.bond_id = 'TR001_2_4';	toxicology
SELECT COUNT(*) AS double_bond_count, m.label = '+' AS is_carcinogenic FROM molecule m LEFT JOIN bond b ON m.molecule_id = b.molecule_id AND b.bond_type = '=' WHERE m.molecule_id = 'TR006' GROUP BY m.molecule_id, m.label;	toxicology
SELECT m.molecule_id, a.element FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+';	toxicology
SELECT b.bond_id, c.atom_id, c.atom_id2, b.molecule_id FROM bond b JOIN connected c ON b.bond_id = c.bond_id WHERE b.bond_type = '-';	toxicology
SELECT DISTINCT m.molecule_id, a.element FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id WHERE b.bond_type = '#'	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE c.bond_id = 'TR000_2_3';	toxicology
SELECT COUNT(*)  FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE a1.element = 'cl' AND a2.element = 'cl';	toxicology
SELECT a.atom_id, COUNT(DISTINCT b.bond_type) AS bond_types_count FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id WHERE a.molecule_id = 'TR346' GROUP BY a.atom_id;	toxicology
SELECT      COUNT(DISTINCT b.molecule_id) AS molecule_count,     SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) AS carcinogenic_count FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '=';	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m  WHERE m.molecule_id NOT IN (     SELECT a.molecule_id      FROM atom a      WHERE a.element = 's' )  AND m.molecule_id NOT IN (     SELECT b.molecule_id      FROM bond b      WHERE b.bond_type = '=' );	toxicology
SELECT m.label FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_id = 'TR001_2_4';	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR001';	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '-';	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'cl' AND m.label = '+';	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'c' AND m.label = '-';	toxicology
SELECT CAST(SUM(CASE WHEN m.label = '+' AND a.element = 'cl' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(DISTINCT m.molecule_id) AS percentage FROM molecule m LEFT JOIN atom a ON m.molecule_id = a.molecule_id;	toxicology
SELECT molecule_id FROM bond WHERE bond_id = 'TR001_1_7';	toxicology
SELECT COUNT(*) FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE c.bond_id = 'TR001_3_4';	toxicology
SELECT b.bond_type  FROM bond b  JOIN connected c ON b.bond_id = c.bond_id  WHERE (c.atom_id = 'TR000_1' AND c.atom_id2 = 'TR000_2')     OR (c.atom_id = 'TR000_2' AND c.atom_id2 = 'TR000_1');	toxicology
SELECT molecule_id FROM atom WHERE atom_id = 'TR000_2' AND molecule_id IN (SELECT molecule_id FROM atom WHERE atom_id = 'TR000_4');	toxicology
SELECT element FROM atom WHERE atom_id = 'TR000_1';	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR000';	toxicology
SELECT CAST(SUM(CASE WHEN bond_type = '-' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(bond_id) AS percentage FROM bond;	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' AND a.element = 'n';	toxicology
SELECT DISTINCT m.molecule_id  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  JOIN connected c ON a.atom_id = c.atom_id  JOIN bond b ON c.bond_id = b.bond_id  WHERE a.element = 's' AND b.bond_type = '=';	toxicology
SELECT molecule_id FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-') GROUP BY molecule_id HAVING COUNT(atom_id) > 5;	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '=' AND a.molecule_id = 'TR024';	toxicology
SELECT molecule_id  FROM atom  WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+')  GROUP BY molecule_id  ORDER BY COUNT(atom_id) DESC  LIMIT 1;	toxicology
SELECT (SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) * 100.0 / COUNT(DISTINCT m.molecule_id))  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  JOIN connected c ON a.atom_id = c.atom_id  JOIN bond b ON c.bond_id = b.bond_id  WHERE a.element = 'h' AND b.bond_type = '#';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+';	toxicology
SELECT COUNT(DISTINCT b.molecule_id)  FROM bond b  WHERE b.molecule_id BETWEEN 'TR004' AND 'TR010'    AND b.bond_type = '-';	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR008' AND element = 'c';	toxicology
SELECT a.element FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR004_7' AND m.label = '-';	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id WHERE b.bond_type = '=' AND a.element = 'o';	toxicology
SELECT COUNT(*)  FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '#' AND m.label = '-';	toxicology
SELECT a.element, b.bond_type FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id WHERE a.molecule_id = 'TR002';	toxicology
SELECT a.atom_id  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  JOIN bond b ON c.bond_id = b.bond_id  WHERE a.element = 'c'  AND b.bond_type = '='  AND b.molecule_id = 'TR012';	toxicology
SELECT a.atom_id  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE m.label = '+' AND a.element = 'o';	toxicology
SELECT * FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT * FROM cards WHERE borderColor IS NULL   AND cardKingdomId IS NOT NULL   AND cardKingdomFoilId IS NULL;	card_games
SELECT name FROM cards WHERE faceConvertedManaCost = (SELECT MAX(faceConvertedManaCost) FROM cards);	card_games
SELECT name FROM cards WHERE frameVersion = '2015' AND edhrecRank < 100;	card_games
SELECT c.* FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'mythic'   AND l.format = 'gladiator'   AND l.status = 'Banned';	card_games
SELECT l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.types = 'Artifact'   AND c.side IS NULL   AND l.format = 'vintage';	card_games
SELECT c.id, c.artist FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE (c.power = '*' OR c.power IS NULL)   AND l.format = 'commander'   AND l.status = 'Legal';	card_games
SELECT c.id, r.text, CASE WHEN c.hasContentWarning = 1 THEN 'Yes' ELSE 'No' END AS hasContentWarning FROM cards c LEFT JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Stephen Daniele';	card_games
SELECT r.text FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.name = 'Sublime Epiphany' AND c.number = '74s';	card_games
SELECT c.name, c.artist, c.isPromo  FROM cards c  JOIN rulings r ON c.uuid = r.uuid  GROUP BY c.uuid  ORDER BY COUNT(r.uuid) DESC  LIMIT 1;	card_games
SELECT DISTINCT fd.language FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE LOWER(c.name) = 'annul' AND c.number = '29';	card_games
SELECT DISTINCT c.name FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE f.language = 'Japanese';	card_games
SELECT (COUNT(CASE WHEN language = 'Chinese Simplified' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM foreign_data;	card_games
SELECT s.name, s.totalSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian';	card_games
SELECT COUNT(DISTINCT type) FROM cards WHERE artist = 'Aaron Boyd';	card_games
SELECT keywords FROM cards WHERE name = 'Angel of Mercy';	card_games
SELECT COUNT(*) FROM cards WHERE power = '*';	card_games
SELECT promoTypes FROM cards WHERE name = 'Duress';	card_games
SELECT borderColor FROM cards WHERE name = 'Ancestor''s Chosen';	card_games
SELECT originalType FROM cards WHERE name = 'Ancestor''s Chosen';	card_games
SELECT DISTINCT st.language FROM cards c JOIN sets s ON c.setCode = s.code JOIN set_translations st ON s.code = st.setCode WHERE c.name = 'Angel of Mercy';	card_games
SELECT COUNT(*)  FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.status = 'restricted' AND c.isTextless = 0;	card_games
SELECT text FROM rulings WHERE uuid IN (SELECT uuid FROM cards WHERE name = 'Condemn');	card_games
SELECT COUNT(*)  FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.status = 'restricted' AND c.isStarter = 1;	card_games
SELECT l.status  FROM legalities l JOIN cards c ON l.uuid = c.uuid WHERE c.name = 'Cloudchaser Eagle';	card_games
SELECT type FROM cards WHERE name = 'Benalish Knight';	card_games
SELECT format, status  FROM legalities  WHERE uuid IN (     SELECT uuid      FROM cards      WHERE name = 'Benalish Knight' );	card_games
SELECT DISTINCT c.artist FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Phyrexian' AND c.artist IS NOT NULL;	card_games
SELECT (COUNT(CASE WHEN borderColor = 'borderless' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM cards;	card_games
SELECT COUNT(*)  FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'German' AND c.isReprint = 1;	card_games
SELECT COUNT(*)  FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.borderColor = 'borderless' AND fd.language = 'Russian';	card_games
SELECT      CAST(COUNT(CASE WHEN fd.language = 'French' THEN 1 END) AS FLOAT) * 100 / COUNT(*) AS percentage FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.isStorySpotlight = 1;	card_games
SELECT COUNT(*) FROM cards WHERE toughness = '99';	card_games
SELECT name FROM cards WHERE artist = 'Aaron Boyd';	card_games
SELECT COUNT(*)  FROM cards  WHERE borderColor = 'black'    AND availability LIKE '%mtgo%'    AND availability NOT LIKE '%paper%'    AND availability NOT LIKE '%arena%';	card_games
SELECT id FROM cards WHERE convertedManaCost = 0;	card_games
SELECT DISTINCT layout FROM cards WHERE keywords LIKE '%flying%';	card_games
SELECT COUNT(*)  FROM cards  WHERE originalType = 'Summon - Angel'    AND subtypes != 'Angel';	card_games
SELECT id  FROM cards  WHERE cardKingdomFoilId IS NOT NULL    AND cardKingdomId IS NOT NULL;	card_games
SELECT id FROM cards WHERE duelDeck = 'a';	card_games
SELECT edhrecRank FROM cards WHERE frameVersion = '2015';	card_games
SELECT DISTINCT c.artist FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Chinese Simplified';	card_games
SELECT c.* FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.availability LIKE '%paper%'   AND f.language = 'Japanese';	card_games
SELECT COUNT(*)  FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.status = 'Banned' AND c.borderColor = 'white';	card_games
SELECT c.uuid, f.language FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN foreign_data f ON c.uuid = f.uuid WHERE l.format = 'legacy';	card_games
SELECT r.text FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.name = 'Beacon of Immortality';	card_games
SELECT COUNT(*), l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.frameVersion = 'future' AND l.status = 'Legal' GROUP BY l.status;	card_games
SELECT name, colors FROM cards WHERE setCode = 'OGW';	card_games
SELECT c.name, st.language FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE c.setCode = '10E' AND c.convertedManaCost = 5;	card_games
SELECT c.name, r.date FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.originalType LIKE 'Creature - Elf%';	card_games
SELECT c.colors, l.format  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE c.id BETWEEN 1 AND 20;	card_games
SELECT DISTINCT c.name FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.originalType LIKE '%Artifact%'   AND c.colors = 'B'   AND f.language IS NOT NULL;	card_games
SELECT c.name FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.rarity = 'uncommon' ORDER BY r.date ASC LIMIT 3;	card_games
SELECT COUNT(*)  FROM cards  WHERE artist = 'John Avon'    AND cardKingdomId IS NOT NULL    AND cardKingdomFoilId IS NULL;	card_games
SELECT COUNT(*)  FROM cards  WHERE borderColor = 'white'    AND cardKingdomFoilId IS NOT NULL    AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*)  FROM cards  WHERE artist = 'UDON'    AND availability LIKE '%mtgo%'    AND hand = '-1';	card_games
SELECT COUNT(*)  FROM cards  WHERE frameVersion = '1993'    AND availability LIKE '%paper%'    AND hasContentWarning = 1;	card_games
SELECT manaCost FROM cards WHERE layout = 'normal' AND frameVersion = '2003' AND borderColor = 'black' AND availability = 'mtgo,paper';	card_games
SELECT SUM(LENGTH(manaCost) - LENGTH(REPLACE(manaCost, '{', ''))) AS total_unconverted_mana_cost FROM cards WHERE artist = 'Rob Alexander';	card_games
SELECT DISTINCT value AS card_type FROM (     SELECT json_each.value     FROM cards, json_each('["' || REPLACE(subtypes, '|', '","') || '"]')     WHERE availability LIKE '%arena%'     UNION     SELECT json_each.value     FROM cards, json_each('["' || REPLACE(supertypes, '|', '","') || '"]')     WHERE availability LIKE '%arena%' ) AS combined_types WHERE card_type IS NOT NULL AND card_type != '';	card_games
SELECT DISTINCT st.setCode FROM set_translations st WHERE st.language = 'Spanish';	card_games
SELECT CAST(COUNT(CASE WHEN isOnlineOnly = 1 THEN 1 END) AS FLOAT) * 100 / COUNT(*)  FROM cards  WHERE frameEffects = 'legendary';	card_games
SELECT      CAST(SUM(CASE WHEN isStorySpotlight = 1 AND isTextless = 0 THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) AS percentage,     id FROM cards WHERE isStorySpotlight = 1 AND isTextless = 0 GROUP BY id;	card_games
SELECT      c.name,     (CAST(SUM(CASE WHEN fd.language = 'Spanish' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*)) AS percentage FROM      cards c LEFT JOIN      foreign_data fd ON c.uuid = fd.uuid GROUP BY      c.name;	card_games
SELECT st.language FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE s.baseSetSize = 309;	card_games
SELECT COUNT(*)  FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE s.block = 'Commander' AND st.language = 'Portuguese (Brazil)';	card_games
SELECT DISTINCT c.id FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.types LIKE '%Creature%'   AND l.status = 'Legal';	card_games
SELECT DISTINCT ft.type  FROM foreign_data ft  WHERE ft.language = 'German'    AND ft.type IS NOT NULL;	card_games
SELECT COUNT(*)  FROM cards  WHERE (power IS NULL OR power = '*')    AND text LIKE '%triggered ability%';	card_games
SELECT COUNT(*)  FROM cards  JOIN legalities ON cards.uuid = legalities.uuid  JOIN rulings ON cards.uuid = rulings.uuid  WHERE legalities.format = 'premodern'    AND rulings.text = 'This is a triggered mana ability.'    AND cards.side IS NULL;	card_games
SELECT c.id FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.artist = 'Erica Yang'   AND l.format = 'pauper'   AND l.status = 'Legal'   AND c.availability LIKE '%paper%';	card_games
SELECT c.artist FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.text = 'Das perfekte Gegenmittel zu einer dichten Formation';	card_games
SELECT fd.name FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE fd.language = 'French'   AND c.type = 'Creature'   AND c.layout = 'normal'   AND c.borderColor = 'black'   AND c.artist = 'Matthew D. Wilson';	card_games
SELECT COUNT(*)  FROM cards  JOIN rulings ON cards.uuid = rulings.uuid  WHERE cards.rarity = 'rare'  AND rulings.date = '2007-02-01';	card_games
SELECT st.language FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE s.block = 'Ravnica' AND s.baseSetSize = 180;	card_games
SELECT (COUNT(CASE WHEN c.hasContentWarning = 0 THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM cards c INNER JOIN legalities l ON c.uuid = l.uuid WHERE l.format = 'commander' AND l.status = 'Legal';	card_games
SELECT CAST(COUNT(CASE WHEN fd.language = 'French' AND (c.power IS NULL OR c.power = '*') THEN 1 END) AS FLOAT) * 100 / COUNT(CASE WHEN c.power IS NULL OR c.power = '*' THEN 1 END) AS percentage FROM cards c LEFT JOIN foreign_data fd ON c.uuid = fd.uuid;	card_games
SELECT (COUNT(CASE WHEN st.language = 'Japanese' AND s.type = 'expansion' THEN 1 END) * 100.0 / COUNT(s.type)) AS percentage FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE s.type = 'expansion';	card_games
SELECT availability FROM cards WHERE artist = 'Daren Bader';	card_games
SELECT COUNT(*)  FROM cards  WHERE borderColor = 'borderless'    AND edhrecRank > 12000;	card_games
SELECT COUNT(*)  FROM cards  WHERE isOversized = 1    AND isReprint = 1    AND isPromo = 1;	card_games
SELECT name FROM cards WHERE power IS NULL OR power = '*'   AND promoTypes = 'arenaleague' ORDER BY name ASC LIMIT 3;	card_games
SELECT language FROM foreign_data WHERE multiverseid = 149934;	card_games
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL ORDER BY cardKingdomFoilId ASC LIMIT 3;	card_games
SELECT CAST(COUNT(CASE WHEN isTextless = 1 AND layout = 'normal' THEN 1 END) AS FLOAT) * 100 / COUNT(*) FROM cards;	card_games
SELECT number FROM cards WHERE side IS NULL AND subtypes LIKE '%Angel%' AND subtypes LIKE '%Wizard%';	card_games
SELECT name FROM sets WHERE mtgoCode IS NULL OR mtgoCode = '' ORDER BY name ASC LIMIT 3;	card_games
SELECT st.language FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE s.mcmName = 'Archenemy' AND s.code = 'ARC';	card_games
SELECT s.name, st.translation  FROM sets s  LEFT JOIN set_translations st ON s.code = st.setCode  WHERE s.id = 5;	card_games
SELECT language, type FROM sets WHERE id = 206;	card_games
SELECT s.id, s.code FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.block = 'Shadowmoor' AND st.language = 'Italian' ORDER BY s.name LIMIT 2;	card_games
SELECT s.id, s.code FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.isForeignOnly = 1   AND s.isFoilOnly = 1   AND st.language = 'Japanese';	card_games
SELECT st.setCode  FROM set_translations st  JOIN sets s ON st.setCode = s.code  WHERE st.language = 'Russian'  ORDER BY s.baseSetSize DESC  LIMIT 1;	card_games
SELECT (COUNT(CASE WHEN s.isOnlineOnly = 1 THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Chinese Simplified';	card_games
SELECT COUNT(*)  FROM sets  WHERE code IN (     SELECT setCode      FROM set_translations      WHERE language = 'Japanese' )  AND (mtgoCode IS NULL OR mtgoCode = '');	card_games
SELECT id FROM cards WHERE borderColor = 'black';	card_games
SELECT id, uuid FROM cards WHERE frameEffects = 'extendedart';	card_games
SELECT * FROM cards WHERE borderColor = 'black' AND isFullArt = 1;	card_games
SELECT language FROM set_translations WHERE setCode = (SELECT code FROM sets WHERE id = 174);	card_games
SELECT name FROM sets WHERE code = 'ALL';	card_games
SELECT language FROM foreign_data WHERE name = 'A Pedra Fellwar';	card_games
SELECT code FROM sets WHERE releaseDate = '2007-07-13';	card_games
SELECT baseSetSize, code FROM sets WHERE block IN ('Masques', 'Mirage');	card_games
SELECT code FROM sets WHERE type = 'expansion';	card_games
SELECT fd.name, fd.type FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE c.watermark = 'Boros';	card_games
SELECT f.language, f.flavorText, c.type FROM foreign_data f JOIN cards c ON f.uuid = c.uuid WHERE c.watermark = 'colorpie';	card_games
SELECT (COUNT(CASE WHEN convertedManaCost = 10 THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM cards WHERE name = 'Abyssal Horror';	card_games
SELECT code FROM sets WHERE type = 'commander';	card_games
SELECT fd.name, fd.type  FROM foreign_data fd  JOIN cards c ON fd.uuid = c.uuid  WHERE c.watermark = 'Abzan'	card_games
SELECT f.language, c.type FROM foreign_data f JOIN cards c ON f.uuid = c.uuid WHERE c.watermark = 'Azorius'	card_games
SELECT COUNT(*)  FROM cards  WHERE artist = 'Aaron Miller'    AND cardKingdomFoilId IS NOT NULL    AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE availability LIKE '%paper%' AND hand = '3';	card_games
SELECT name FROM cards WHERE isTextless = 0;	card_games
SELECT convertedManaCost FROM cards WHERE name = 'Ancestor''s Chosen';	card_games
SELECT COUNT(*)  FROM cards  WHERE borderColor = 'white' AND (power IS NULL OR power = '*');	card_games
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL;	card_games
SELECT subtypes, supertypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer';	card_games
SELECT purchaseUrls FROM cards WHERE promoTypes = 'bundle';	card_games
SELECT COUNT(DISTINCT artist)  FROM cards  WHERE borderColor = 'black'    AND availability LIKE '%arena,mtgo%';	card_games
SELECT      CASE          WHEN (SELECT convertedManaCost FROM cards WHERE name = 'Serra Angel') > (SELECT convertedManaCost FROM cards WHERE name = 'Shrine Keeper')          THEN 'Serra Angel'          ELSE 'Shrine Keeper'      END AS higher_mana_cost_card;	card_games
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer';	card_games
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3;	card_games
SELECT st.translation FROM set_translations st JOIN cards c ON st.setCode = c.setCode WHERE c.name = 'Ancestor''s Chosen' AND st.language = 'Italian';	card_games
SELECT COUNT(*)  FROM set_translations  WHERE setCode IN (     SELECT setCode      FROM cards      WHERE name = 'Angel of Mercy' );	card_games
SELECT c.name FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition';	card_games
SELECT EXISTS (     SELECT 1      FROM foreign_data fd     JOIN cards c ON fd.uuid = c.uuid     WHERE c.name = 'Ancestor''s Chosen' AND fd.language = 'Korean' ) AS has_korean_version;	card_games
SELECT COUNT(*)  FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition'  AND c.artist = 'Adam Rex';	card_games
SELECT baseSetSize FROM sets WHERE code = (SELECT setCode FROM set_translations WHERE translation = 'Hauptset Zehnte Edition');	card_games
SELECT st.translation  FROM set_translations st  JOIN sets s ON st.setCode = s.code  WHERE s.name = 'Eighth Edition' AND st.language = 'Chinese Simplified';	card_games
SELECT s.mtgoCode IS NOT NULL AS appeared_on_mtgo FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.name = 'Angel of Mercy';	card_games
SELECT s.releaseDate FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Ancestor''s Chosen';	card_games
SELECT s.type  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE st.translation = 'Hauptset Zehnte Edition';	card_games
SELECT COUNT(DISTINCT s.code)  FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.block = 'Ice Age' AND st.language = 'Italian' AND st.translation IS NOT NULL;	card_games
SELECT s.isForeignOnly  FROM sets s  JOIN cards c ON s.code = c.setCode  WHERE c.name = 'Adarkar Valkyrie';	card_games
SELECT COUNT(*)  FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian'    AND st.translation IS NOT NULL    AND s.baseSetSize < 100;	card_games
SELECT COUNT(*)  FROM cards  JOIN sets ON cards.setCode = sets.code  WHERE sets.name = 'Coldsnap' AND cards.borderColor = 'black';	card_games
SELECT name FROM cards WHERE setCode = (SELECT code FROM sets WHERE name = 'Coldsnap') ORDER BY convertedManaCost DESC LIMIT 1;	card_games
SELECT DISTINCT artist  FROM cards  WHERE setCode = (SELECT code FROM sets WHERE name = 'Coldsnap')    AND artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy');	card_games
SELECT c.name FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap' AND c.number = '4';	card_games
SELECT COUNT(*)  FROM cards T1 JOIN sets T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap'   AND T1.convertedManaCost > 5   AND (T1.power = '*' OR T1.power IS NULL);	card_games
SELECT fd.flavorText FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE c.name = 'Ancestor''s Chosen' AND fd.language = 'Italian';	card_games
SELECT DISTINCT fd.language FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE c.name = 'Ancestor''s Chosen' AND fd.flavorText IS NOT NULL;	card_games
SELECT fd.type  FROM foreign_data fd  JOIN cards c ON fd.uuid = c.uuid  WHERE c.name = 'Ancestor''s Chosen' AND fd.language = 'German';	card_games
SELECT r.text FROM rulings r JOIN cards c ON r.uuid = c.uuid JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap' AND r.language = 'Italian';	card_games
SELECT fd.name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap' AND fd.language = 'Italian' AND c.convertedManaCost = (     SELECT MAX(convertedManaCost)     FROM cards     WHERE setCode IN (SELECT code FROM sets WHERE name = 'Coldsnap') )	card_games
SELECT r.date FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.name = 'Reminisce';	card_games
SELECT (CAST(SUM(CASE WHEN c.convertedManaCost = 7 THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*)) AS percentage FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap';	card_games
SELECT      CAST(SUM(CASE WHEN c.cardKingdomFoilId IS NOT NULL AND c.cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) AS percentage FROM      cards c JOIN      sets s ON c.setCode = s.code WHERE      s.name = 'Coldsnap';	card_games
SELECT code FROM sets WHERE releaseDate = '2017-07-14';	card_games
SELECT keyruneCode FROM sets WHERE code = 'PKHC';	card_games
SELECT mcmId FROM sets WHERE code = 'SS2';	card_games
SELECT mcmName FROM sets WHERE releaseDate = '2017-06-09';	card_games
SELECT type FROM sets WHERE name = 'From the Vault: Lore';	card_games
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized';	card_games
SELECT c.name, r.text, CASE WHEN c.hasContentWarning = 1 THEN 'Yes' ELSE 'No' END AS has_degraded_properties FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Jim Pavelec';	card_games
SELECT s.releaseDate FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Evacuation';	card_games
SELECT baseSetSize FROM sets WHERE code IN (SELECT setCode FROM set_translations WHERE translation = 'Rinascita di Alara');	card_games
SELECT s.type FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Huitième édition';	card_games
SELECT st.translation  FROM set_translations st  JOIN cards c ON st.setCode = c.setCode  WHERE c.name = 'Tendo Ice Bridge' AND st.language = 'French';	card_games
SELECT COUNT(*) FROM set_translations WHERE setCode IN (SELECT code FROM sets WHERE name = 'Tenth Edition') AND translation IS NOT NULL;	card_games
SELECT st.translation  FROM set_translations st  JOIN sets s ON st.setCode = s.code  JOIN cards c ON c.setCode = s.code  WHERE c.name = 'Fellwar Stone' AND st.language = 'Japanese';	card_games
SELECT c.name FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Journey into Nyx Hero''s Path' ORDER BY c.convertedManaCost DESC LIMIT 1;	card_games
SELECT s.releaseDate  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE st.translation = 'Ola de frío';	card_games
SELECT s.type FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Samite Pilgrim';	card_games
SELECT COUNT(*)  FROM cards  JOIN sets ON cards.setCode = sets.code  WHERE sets.name = 'World Championship Decks 2004'  AND cards.convertedManaCost = 3;	card_games
SELECT st.translation  FROM set_translations st  JOIN sets s ON st.setCode = s.code  WHERE s.name = 'Mirrodin'  AND st.language = 'Chinese Simplified';	card_games
SELECT CAST(SUM(CASE WHEN s.isNonFoilOnly = 1 THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*)  FROM sets s INNER JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Japanese';	card_games
SELECT (SUM(s.isOnlineOnly) * 100.0 / COUNT(*)) AS percentage_online_only FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Portuguese (Brazil)';	card_games
SELECT availability FROM cards WHERE artist != 'Aleksi Briclot' AND isTextless = 1;	card_games
SELECT id FROM sets ORDER BY baseSetSize DESC LIMIT 1;	card_games
SELECT artist FROM cards WHERE side IS NULL ORDER BY convertedManaCost DESC LIMIT 1;	card_games
SELECT frameEffects FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL GROUP BY frameEffects ORDER BY COUNT(*) DESC LIMIT 1;	card_games
SELECT COUNT(*)  FROM cards  WHERE (power IS NULL OR power = '*')    AND hasFoil = 0    AND duelDeck = 'a';	card_games
SELECT id FROM sets WHERE type = 'commander' ORDER BY totalSetSize DESC LIMIT 1;	card_games
SELECT name, convertedManaCost FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.format = 'duel' AND legalities.status = 'Legal' ORDER BY convertedManaCost DESC LIMIT 10;	card_games
SELECT c.originalReleaseDate, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'mythic' AND l.status = 'Legal' ORDER BY c.originalReleaseDate ASC LIMIT 1;	card_games
SELECT COUNT(*)  FROM cards  JOIN foreign_data ON cards.uuid = foreign_data.uuid  WHERE cards.artist = 'Volkan Baǵa' AND foreign_data.language = 'French';	card_games
SELECT COUNT(*)  FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'rare'   AND c.types = 'Enchantment'   AND c.name = 'Abundance'   AND l.status = 'Legal';	card_games
SELECT      l.format,     c.name FROM      legalities l JOIN      cards c ON l.uuid = c.uuid WHERE      l.status = 'Banned' GROUP BY      l.format ORDER BY      COUNT(*) DESC LIMIT 1;	card_games
SELECT language FROM set_translations WHERE setCode IN (SELECT code FROM sets WHERE name = 'Battlebond');	card_games
SELECT artist, format FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE artist IN (     SELECT artist     FROM cards     GROUP BY artist     ORDER BY COUNT(*) ASC     LIMIT 1 )	card_games
SELECT l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.frameVersion = '1997'   AND c.artist = 'D. Alexander Gregory'   AND (c.hasContentWarning = 1 OR c.watermark = 'WotC')   AND l.format = 'legacy';	card_games
SELECT c.name, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.edhrecRank = 1 AND l.status = 'Banned';	card_games
SELECT AVG(set_count) AS annual_average_sets,         (SELECT language          FROM set_translations          GROUP BY language          ORDER BY COUNT(language) DESC          LIMIT 1) AS common_language FROM (     SELECT COUNT(*) AS set_count     FROM sets     WHERE releaseDate BETWEEN '2012-01-01' AND '2015-12-31'     GROUP BY strftime('%Y', releaseDate) );	card_games
SELECT DISTINCT artist FROM cards WHERE borderColor = 'black' AND availability = 'arena';	card_games
SELECT uuid FROM legalities WHERE format = 'oldschool' AND (status = 'banned' OR status = 'restricted');	card_games
SELECT COUNT(*)  FROM cards  WHERE artist = 'Matthew D. Wilson'    AND availability = 'paper';	card_games
SELECT text FROM rulings WHERE uuid IN (SELECT uuid FROM cards WHERE artist = 'Kev Walker') ORDER BY date DESC;	card_games
SELECT c.name, l.format FROM cards c JOIN sets s ON c.setCode = s.code JOIN legalities l ON c.uuid = l.uuid WHERE s.name = 'Hour of Devastation' AND l.status = 'Legal';	card_games
SELECT DISTINCT s.name FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE 'Korean' IN (SELECT language FROM set_translations WHERE setCode = s.code)   AND 'Japanese' NOT IN (SELECT language FROM set_translations WHERE setCode = s.code)	card_games
SELECT DISTINCT c.frameVersion, c.name, l.status FROM cards c LEFT JOIN legalities l ON c.uuid = l.uuid AND l.status = 'Banned' WHERE c.artist = 'Allen Williams';	card_games
SELECT DisplayName  FROM users  WHERE DisplayName IN ('Harlan', 'Jarrod Dixon')  ORDER BY Reputation DESC  LIMIT 1;	codebase_community
SELECT DisplayName FROM users WHERE strftime('%Y', CreationDate) = '2011';	codebase_community
SELECT COUNT(*) FROM users WHERE LastAccessDate > '2014-09-01';	codebase_community
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM users  WHERE UpVotes > 100 AND DownVotes > 1;	codebase_community
SELECT COUNT(*)  FROM users  WHERE Views > 10    AND strftime('%Y', CreationDate) > '2013';	codebase_community
SELECT COUNT(*)  FROM posts  WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie');	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Eliciting priors from experts';	codebase_community
SELECT Title  FROM posts  WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')  ORDER BY ViewCount DESC  LIMIT 1;	codebase_community
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId ORDER BY p.FavoriteCount DESC LIMIT 1;	codebase_community
SELECT SUM(p.CommentCount)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT MAX(p.AnswerCount) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT u.DisplayName FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE p.Title = 'Examples for teaching: Correlation does not mean causation';	codebase_community
SELECT COUNT(*)  FROM posts  WHERE OwnerUserId IN (SELECT Id FROM users WHERE DisplayName = 'csgillespie')    AND ParentId IS NULL;	codebase_community
SELECT DISTINCT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ClosedDate IS NOT NULL;	codebase_community
SELECT COUNT(*)  FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.Age > 65 AND p.Score >= 20;	codebase_community
SELECT u.Location FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Title = 'Eliciting priors from experts';	codebase_community
SELECT Body FROM posts WHERE Id = (SELECT ExcerptPostId FROM tags WHERE TagName = 'bayesian');	codebase_community
SELECT p.Body FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId ORDER BY t.Count DESC LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT COUNT(*)  FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie'    AND YEAR(b.Date) = 2011;	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId GROUP BY u.Id, u.DisplayName ORDER BY COUNT(b.Id) DESC LIMIT 1;	codebase_community
SELECT AVG(p.Score)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT AVG(badge_count)  FROM (     SELECT u.Id, COUNT(b.Id) AS badge_count     FROM users u     LEFT JOIN badges b ON u.Id = b.UserId     WHERE u.Views > 200     GROUP BY u.Id ) AS user_badge_counts;	codebase_community
SELECT      (COUNT(CASE WHEN u.Age > 65 THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      p.Score > 5;	codebase_community
SELECT COUNT(*) FROM votes WHERE UserId = 58 AND CreationDate = '2010-07-19';	codebase_community
SELECT CreationDate FROM votes GROUP BY CreationDate ORDER BY COUNT(Id) DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = 'Revival';	codebase_community
SELECT p.Title FROM posts p JOIN comments c ON p.Id = c.PostId ORDER BY c.Score DESC LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM comments  WHERE PostId = (SELECT Id FROM posts WHERE ViewCount = 1910);	codebase_community
SELECT p.FavoriteCount FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.UserId = 3025 AND c.CreationDate = '2014-04-23 20:29:39.0';	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ParentId = 107829 AND p.CommentCount = 1;	codebase_community
SELECT CASE WHEN p.ClosedDate IS NULL THEN 'not well-finished' ELSE 'well-finished' END FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.UserId = 23853 AND c.CreationDate = '2013-07-12 09:08:18.0';	codebase_community
SELECT u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Id = 65041;	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Tiago Pasqualini');	codebase_community
SELECT u.DisplayName FROM users u JOIN votes v ON u.Id = v.UserId WHERE v.Id = 6347;	codebase_community
SELECT COUNT(*)  FROM votes v JOIN posts p ON v.PostId = p.Id WHERE p.Title LIKE '%data visualization%';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'DatEpicCoderGuyWhoPrograms';	codebase_community
SELECT CAST(COUNT(p.Id) AS FLOAT) / COUNT(v.Id)  FROM posts p  LEFT JOIN votes v ON p.OwnerUserId = v.UserId  WHERE p.OwnerUserId = 24;	codebase_community
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer';	codebase_community
SELECT Text FROM comments WHERE Score = 17;	codebase_community
SELECT DisplayName FROM users WHERE WebsiteUrl = 'http://stackoverflow.com';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'SilentGhost';	codebase_community
SELECT u.DisplayName FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'thank you user93!';	codebase_community
SELECT c.Text FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.DisplayName = 'A Lion';	codebase_community
SELECT u.DisplayName, u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Title = 'Understanding what Dassault iSight is doing?';	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'How does gentle boosting differ from AdaBoost?';	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Necromancer' LIMIT 10;	codebase_community
SELECT u.DisplayName FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE p.Title = 'Open source tools for visualizing multi-dimensional data?';	codebase_community
SELECT Title FROM posts WHERE LastEditorUserId IN (SELECT Id FROM users WHERE DisplayName = 'Vebjorn Ljosa');	codebase_community
SELECT SUM(p.Score) AS TotalScore, u.WebsiteUrl FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Yevgeny' GROUP BY u.WebsiteUrl;	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'Why square the difference instead of taking the absolute value in standard deviation?'   AND c.UserId = p.LastEditorUserId;	codebase_community
SELECT SUM(v.BountyAmount)  FROM votes v  JOIN posts p ON v.PostId = p.Id  WHERE p.Title LIKE '%data%' AND v.BountyAmount IS NOT NULL;	codebase_community
SELECT u.DisplayName FROM users u JOIN votes v ON u.Id = v.UserId JOIN posts p ON v.PostId = p.Id WHERE v.BountyAmount = 50 AND p.Title LIKE '%variance%';	codebase_community
SELECT AVG(p.ViewCount), p.Title, ph.Text AS Comment FROM posts p JOIN tags t ON p.Tags LIKE '%' || t.TagName || '%' LEFT JOIN postHistory ph ON p.Id = ph.PostId WHERE t.TagName = 'humor' GROUP BY p.Title, ph.Text;	codebase_community
SELECT COUNT(*) FROM comments WHERE UserId = 13;	codebase_community
SELECT Id FROM users ORDER BY Reputation DESC LIMIT 1;	codebase_community
SELECT Id FROM users ORDER BY Views ASC LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM badges  WHERE Name = 'Supporter'    AND strftime('%Y', Date) = '2011';	codebase_community
SELECT COUNT(*)  FROM (     SELECT UserId      FROM badges      GROUP BY UserId      HAVING COUNT(Name) > 5 ) AS users_with_more_than_5_badges;	codebase_community
SELECT COUNT(DISTINCT u.Id)  FROM users u INNER JOIN badges b1 ON u.Id = b1.UserId INNER JOIN badges b2 ON u.Id = b2.UserId WHERE u.Location = 'New York'   AND b1.Name = 'Teacher'   AND b2.Name = 'Supporter';	codebase_community
SELECT u.DisplayName, u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Id = 1;	codebase_community
SELECT UserId FROM postHistory GROUP BY UserId, PostId HAVING COUNT(*) = 1 INTERSECT SELECT Id FROM users WHERE Views >= 1000;	codebase_community
SELECT u.Id, b.Name FROM users u JOIN (     SELECT UserId, COUNT(Id) as CommentCount     FROM comments     GROUP BY UserId     ORDER BY CommentCount DESC     LIMIT 1 ) c ON u.Id = c.UserId LEFT JOIN badges b ON u.Id = b.UserId;	codebase_community
SELECT COUNT(*)  FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'India' AND b.Name = 'Teacher';	codebase_community
SELECT      (COUNT(CASE WHEN strftime('%Y', Date) = '2010' THEN 1 END) * 100.0 / COUNT(*)) -      (COUNT(CASE WHEN strftime('%Y', Date) = '2011' THEN 1 END) * 100.0 / COUNT(*)) AS percentage_difference FROM badges  WHERE Name = 'Student';	codebase_community
SELECT PostHistoryTypeId, COUNT(DISTINCT UserId) AS UniqueUsers FROM postHistory WHERE PostId = 3720 GROUP BY PostHistoryTypeId;	codebase_community
SELECT p.Id, p.ViewCount FROM posts p JOIN postLinks pl ON p.Id = pl.RelatedPostId WHERE pl.PostId = 61217;  SELECT ViewCount FROM posts WHERE Id = 61217;	codebase_community
SELECT p.Score, pl.LinkTypeId FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE p.Id = 395;	codebase_community
SELECT Id, OwnerUserId FROM posts WHERE Score > 60;	codebase_community
SELECT SUM(p.FavoriteCount) FROM posts p WHERE p.OwnerUserId = 686   AND strftime('%Y', p.CreaionDate) = '2011';	codebase_community
SELECT AVG(u.UpVotes) AS average_upvotes, AVG(u.Age) AS average_age FROM users u JOIN posts p ON u.Id = p.OwnerUserId GROUP BY u.Id HAVING COUNT(p.Id) > 10;	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = 'Announcer';	codebase_community
SELECT Name FROM badges WHERE Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT COUNT(*) FROM comments WHERE Score > 60;	codebase_community
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:25:47.0';	codebase_community
SELECT COUNT(*) FROM posts WHERE Score = 10;	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT u.Reputation FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT b.Name  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.DisplayName = 'Pierre';	codebase_community
SELECT b.Date FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Location = 'Rochester, NY';	codebase_community
SELECT (COUNT(CASE WHEN b.Name = 'Teacher' THEN 1 END) * 100.0 / COUNT(u.Id)) AS percentage FROM users u LEFT JOIN badges b ON u.Id = b.UserId;	codebase_community
SELECT      CAST(COUNT(CASE WHEN u.Age BETWEEN 13 AND 18 THEN 1 END) AS FLOAT) * 100 / COUNT(*) AS percentage FROM      badges b JOIN      users u ON b.UserId = u.Id WHERE      b.Name = 'Organizer';	codebase_community
SELECT Score FROM comments WHERE CreationDate = '2010-07-19 19:19:56.0';	codebase_community
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:37:33.0';	codebase_community
SELECT u.Age FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'Vienna, Austria';	codebase_community
SELECT COUNT(*)  FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Supporter'    AND u.Age BETWEEN 19 AND 65;	codebase_community
SELECT u.Views FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT DISTINCT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MIN(Reputation) FROM users WHERE Reputation IS NOT NULL);	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Sharpie';	codebase_community
SELECT COUNT(*)  FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age > 65;	codebase_community
SELECT DisplayName FROM users WHERE Id = 30;	codebase_community
SELECT COUNT(*) FROM users WHERE Location = 'New York';	codebase_community
SELECT COUNT(*) FROM votes WHERE strftime('%Y', CreationDate) = '2010';	codebase_community
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT DisplayName FROM users WHERE Views = (SELECT MAX(Views) FROM users);	codebase_community
SELECT CAST(SUM(CASE WHEN strftime('%Y', CreationDate) = '2010' THEN 1 ELSE 0 END) AS FLOAT) / SUM(CASE WHEN strftime('%Y', CreationDate) = '2011' THEN 1 ELSE 0 END) FROM votes;	codebase_community
SELECT t.TagName FROM tags t JOIN posts p ON t.Id = p.Tags JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'John Salvatier';	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId IN (SELECT Id FROM users WHERE DisplayName = 'Daniel Vassallo');	codebase_community
SELECT COUNT(*)  FROM votes v JOIN users u ON v.UserId = u.Id WHERE u.DisplayName = 'Harlan';	codebase_community
SELECT Id FROM posts WHERE OwnerUserId IN (SELECT Id FROM users WHERE DisplayName = 'slashnick') ORDER BY AnswerCount DESC LIMIT 1;	codebase_community
SELECT      CASE          WHEN SUM(CASE WHEN u.DisplayName = 'Harvey Motulsky' THEN p.ViewCount ELSE 0 END) > SUM(CASE WHEN u.DisplayName = 'Noah Snyder' THEN p.ViewCount ELSE 0 END)          THEN 'Harvey Motulsky'          ELSE 'Noah Snyder'      END AS MorePopularUser FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName IN ('Harvey Motulsky', 'Noah Snyder');	codebase_community
SELECT COUNT(*)  FROM posts p JOIN users u ON p.OwnerUserId = u.Id JOIN votes v ON p.Id = v.PostId WHERE u.DisplayName = 'Matt Parker' GROUP BY p.Id HAVING COUNT(v.Id) > 4;	codebase_community
SELECT COUNT(*)  FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Neil McGuigan' AND c.Score < 60;	codebase_community
SELECT t.TagName FROM tags t JOIN posts p ON t.Id = p.Tags JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Mark Meckes' AND p.CommentCount = 0;	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Organizer';	codebase_community
SELECT      CAST(COUNT(CASE WHEN t.TagName = 'r' THEN 1 END) AS FLOAT) * 100 / COUNT(p.Id) AS percentage FROM      posts p     LEFT JOIN users u ON p.OwnerUserId = u.Id     LEFT JOIN (         SELECT PostId, SUBSTR(SUBSTR(Tags, INSTR(Tags, '<') + 1), 1, INSTR(SUBSTR(Tags, INSTR(Tags, '<') + 1), '>') - 1) AS TagName          FROM posts         WHERE Tags LIKE '%<r>%'     ) t ON p.Id = t.PostId WHERE      u.DisplayName = 'Community';	codebase_community
SELECT      SUM(CASE WHEN u.DisplayName = 'Mornington' THEN p.ViewCount ELSE 0 END) -      SUM(CASE WHEN u.DisplayName = 'Amos' THEN p.ViewCount ELSE 0 END) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName IN ('Mornington', 'Amos');	codebase_community
SELECT COUNT(*)  FROM badges  WHERE Name = 'Commentator' AND strftime('%Y', Date) = '2014';	codebase_community
SELECT COUNT(*) FROM posts WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59';	codebase_community
SELECT DisplayName, Age  FROM users  WHERE Views = (SELECT MAX(Views) FROM users);	codebase_community
SELECT LastEditDate, LastEditorUserId  FROM posts  WHERE Title = 'Detecting a given face in a database of facial images';	codebase_community
SELECT COUNT(*) FROM comments WHERE UserId = 13 AND Score < 60;	codebase_community
SELECT p.Title, u.DisplayName FROM posts p JOIN comments c ON p.Id = c.PostId JOIN users u ON c.UserId = u.Id WHERE c.Score > 60;	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Location = 'North Pole'   AND strftime('%Y', b.Date) = '2011';	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.FavoriteCount > 150;	codebase_community
SELECT COUNT(*) AS PostHistoryCount, MAX(ph.CreationDate) AS LastEditDate FROM postHistory ph JOIN posts p ON ph.PostId = p.Id WHERE p.Title = 'What is the best introductory Bayesian statistics textbook?';	codebase_community
SELECT u.LastAccessDate, u.Location FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Outliers';	codebase_community
SELECT p2.Title FROM posts p1 JOIN postLinks pl ON p1.Id = pl.PostId JOIN posts p2 ON pl.RelatedPostId = p2.Id WHERE p1.Title = 'How to tell if something happened in a data set which monitors a value over time';	codebase_community
SELECT p.Id AS PostId, b.Name AS BadgeName FROM posts p JOIN users u ON p.OwnerUserId = u.Id JOIN badges b ON u.Id = b.UserId WHERE u.DisplayName = 'Samuel'   AND strftime('%Y', p.CreaionDate) = '2013'   AND strftime('%Y', b.Date) = '2013';	codebase_community
SELECT OwnerDisplayName  FROM posts  ORDER BY ViewCount DESC  LIMIT 1;	codebase_community
SELECT u.DisplayName, u.Location  FROM users u  JOIN posts p ON u.Id = p.OwnerUserId  JOIN tags t ON p.Id = t.ExcerptPostId  WHERE t.TagName = 'hypothesis-testing';	codebase_community
SELECT p.Title, pl.LinkTypeId FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE p.Title = 'What are principal component scores?';	codebase_community
SELECT p2.Title  FROM posts p1  JOIN posts p2 ON p1.ParentId = p2.Id  WHERE p1.ParentId IS NOT NULL  ORDER BY p1.Score DESC  LIMIT 1;	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM users u JOIN votes v ON u.Id = v.UserId WHERE v.VoteTypeId = 8 ORDER BY v.BountyAmount DESC LIMIT 1;	codebase_community
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5;	codebase_community
SELECT COUNT(*) FROM tags WHERE Count BETWEEN 5000 AND 7000;	codebase_community
SELECT OwnerUserId  FROM posts  ORDER BY FavoriteCount DESC  LIMIT 1;	codebase_community
SELECT Age FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT COUNT(*)  FROM posts p JOIN votes v ON p.Id = v.PostId WHERE YEAR(v.CreationDate) = 2011 AND v.BountyAmount = 50;	codebase_community
SELECT Id FROM users WHERE Age = (SELECT MIN(Age) FROM users);	codebase_community
SELECT SUM(Score) FROM posts WHERE LasActivityDate LIKE '2010-07-19%';	codebase_community
SELECT AVG(link_count) AS average_monthly_links FROM (     SELECT COUNT(pl.Id) AS link_count     FROM postLinks pl     JOIN posts p ON pl.PostId = p.Id     WHERE YEAR(pl.CreationDate) = 2010       AND p.AnswerCount <= 2     GROUP BY MONTH(pl.CreationDate) ) AS monthly_counts;	codebase_community
SELECT p.Id FROM posts p JOIN votes v ON p.Id = v.PostId WHERE v.UserId = 1465 ORDER BY p.FavoriteCount DESC LIMIT 1;	codebase_community
SELECT p.Title FROM posts p JOIN postLinks pl ON p.Id = pl.PostId ORDER BY pl.CreationDate ASC LIMIT 1;	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId GROUP BY u.Id, u.DisplayName ORDER BY COUNT(b.Name) DESC LIMIT 1;	codebase_community
SELECT MIN(v.CreationDate)  FROM votes v JOIN users u ON v.UserId = u.Id WHERE u.DisplayName = 'chl';	codebase_community
SELECT MIN(p.CreaionDate)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.Age = (SELECT MIN(Age) FROM users WHERE Age IS NOT NULL);	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Autobiographer' ORDER BY b.Date ASC LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT u.Id)  FROM users u  JOIN posts p ON u.Id = p.OwnerUserId  WHERE u.Location = 'United Kingdom'    AND p.FavoriteCount >= 4;	codebase_community
SELECT AVG(v.PostId) FROM votes v JOIN users u ON v.UserId = u.Id WHERE u.Age = (SELECT MAX(Age) FROM users);	codebase_community
SELECT DisplayName FROM users ORDER BY Reputation DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM users WHERE Reputation > 2000 AND Views > 1000;	codebase_community
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT COUNT(*)  FROM posts  WHERE OwnerUserId IN (SELECT Id FROM users WHERE DisplayName = 'Jay Stevens')    AND strftime('%Y', CreaionDate) = '2010';	codebase_community
SELECT Id, Title FROM posts WHERE OwnerUserId IN (SELECT Id FROM users WHERE DisplayName = 'Harvey Motulsky') ORDER BY ViewCount DESC LIMIT 1;	codebase_community
SELECT Id, Title FROM posts ORDER BY Score DESC LIMIT 1;	codebase_community
SELECT AVG(p.Score)  FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Stephen Turner';	codebase_community
SELECT DISTINCT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ViewCount > 20000   AND strftime('%Y', p.CreaionDate) = '2011';	codebase_community
SELECT p.Id, u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE strftime('%Y', p.CreaionDate) = '2010' ORDER BY p.FavoriteCount DESC LIMIT 1;	codebase_community
SELECT      (COUNT(CASE WHEN u.Reputation > 1000 AND strftime('%Y', p.CreaionDate) = '2011' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM posts p JOIN users u ON p.OwnerUserId = u.Id;	codebase_community
SELECT (COUNT(CASE WHEN Age BETWEEN 13 AND 19 THEN 1 END) * 100.0 / COUNT(Id)) AS percentage FROM users;	codebase_community
SELECT p.ViewCount, u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Computer Game Datasets';	codebase_community
SELECT COUNT(*)  FROM posts  WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts);	codebase_community
SELECT COUNT(*)  FROM comments  WHERE PostId = (SELECT Id FROM posts ORDER BY Score DESC LIMIT 1);	codebase_community
SELECT COUNT(*)  FROM posts  WHERE ViewCount > 35000    AND CommentCount = 0;	codebase_community
SELECT u.DisplayName, u.Location FROM users u JOIN posts p ON u.Id = p.LastEditorUserId WHERE p.Id = 183;	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Emmett' ORDER BY b.Date DESC LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM users  WHERE Age BETWEEN 19 AND 65    AND UpVotes > 5000;	codebase_community
SELECT julianday(b.Date) - julianday(u.CreationDate) AS DaysToGetBadge FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Zolomon';	codebase_community
SELECT      (SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users ORDER BY CreationDate DESC LIMIT 1)) AS NumberOfPosts,     (SELECT COUNT(*) FROM comments WHERE UserId = (SELECT Id FROM users ORDER BY CreationDate DESC LIMIT 1)) AS NumberOfComments;	codebase_community
SELECT c.Text, u.DisplayName FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON c.UserId = u.Id WHERE p.Title = 'Analysing wind data with R' ORDER BY c.CreationDate DESC LIMIT 10;	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = 'Citizen Patrol';	codebase_community
SELECT COUNT(*)  FROM posts p JOIN tags t ON p.Tags LIKE '%' || t.TagName || '%' WHERE t.TagName = 'careers';	codebase_community
SELECT u.Reputation, p.ViewCount FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'Jarrod Dixon';	codebase_community
SELECT COUNT(c.Id) AS CommentCount, COUNT(p.Id) AS AnswerCount FROM posts p LEFT JOIN comments c ON c.PostId = p.Id WHERE p.Title = 'Clustering 1D data' OR p.ParentId IN (SELECT Id FROM posts WHERE Title = 'Clustering 1D data');	codebase_community
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat';	codebase_community
SELECT COUNT(*)  FROM votes  WHERE VoteTypeId = 8 AND BountyAmount >= 30;	codebase_community
SELECT      CAST(COUNT(CASE WHEN p.Score > 50 THEN 1 END) AS FLOAT) * 100 / COUNT(p.Id) FROM      posts p INNER JOIN      users u ON p.OwnerUserId = u.Id WHERE      u.Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT COUNT(*) FROM posts WHERE Score < 20;	codebase_community
SELECT COUNT(*)  FROM tags  WHERE Id < 15 AND Count <= 20;	codebase_community
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample';	codebase_community
SELECT u.Reputation, u.UpVotes FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'fine, you win :)';	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title LIKE '%linear regression%';	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ViewCount BETWEEN 100 AND 150 ORDER BY c.Score DESC LIMIT 1;	codebase_community
SELECT u.CreationDate, u.Age FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text LIKE '%http://%';	codebase_community
SELECT COUNT(*)  FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.Score = 0 AND p.ViewCount < 5;	codebase_community
SELECT COUNT(*)  FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.CommentCount = 1 AND c.Score = 0;	codebase_community
SELECT COUNT(DISTINCT u.Id)  FROM comments c  JOIN users u ON c.UserId = u.Id  WHERE c.Score = 0 AND u.Age = 40;	codebase_community
SELECT p.Id, c.Text FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Title = 'Group differences on a five point Likert item';	codebase_community
SELECT u.UpVotes  FROM users u  JOIN comments c ON u.Id = c.UserId  WHERE c.Text = 'R is also lazy evaluated.';	codebase_community
SELECT Text FROM comments WHERE UserId IN (SELECT Id FROM users WHERE DisplayName = 'Harvey Motulsky');	codebase_community
SELECT DISTINCT u.DisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score BETWEEN 1 AND 5   AND u.DownVotes = 0;	codebase_community
SELECT (COUNT(CASE WHEN u.UpVotes = 0 THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score BETWEEN 5 AND 10;	codebase_community
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id JOIN superhero s ON hp.hero_id = s.id WHERE s.superhero_name = '3-D Man';	superhero
SELECT COUNT(*)  FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Super Strength';	superhero
SELECT COUNT(*)  FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Super Strength' AND s.height_cm > 200;	superhero
SELECT s.full_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id GROUP BY s.full_name HAVING COUNT(hp.power_id) > 15;	superhero
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE colour.colour = 'Blue';	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.skin_colour_id = c.id WHERE s.superhero_name = 'Apocalypse';	superhero
SELECT COUNT(*)  FROM superhero s JOIN colour c ON s.eye_colour_id = c.id JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE c.colour = 'Blue' AND sp.power_name = 'Agility';	superhero
SELECT s.superhero_name FROM superhero s JOIN colour c1 ON s.eye_colour_id = c1.id JOIN colour c2 ON s.hair_colour_id = c2.id WHERE c1.colour = 'Blue' AND c2.colour = 'Blond';	superhero
SELECT COUNT(*)  FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics';	superhero
SELECT s.superhero_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics' ORDER BY s.height_cm DESC;	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name = 'Sauron';	superhero
SELECT c.colour, COUNT(s.id) AS count FROM superhero s JOIN publisher p ON s.publisher_id = p.id JOIN colour c ON s.eye_colour_id = c.id WHERE p.publisher_name = 'Marvel Comics' GROUP BY c.colour ORDER BY count DESC;	superhero
SELECT AVG(height_cm)  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE publisher.publisher_name = 'Marvel Comics';	superhero
SELECT s.superhero_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE p.publisher_name = 'Marvel Comics'   AND sp.power_name = 'Super Strength';	superhero
SELECT COUNT(*)  FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'DC Comics';	superhero
SELECT p.publisher_name FROM publisher p JOIN superhero s ON p.id = s.publisher_id JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' ORDER BY ha.attribute_value ASC LIMIT 1;	superhero
SELECT COUNT(*)  FROM superhero s JOIN colour c ON s.eye_colour_id = c.id JOIN publisher p ON s.publisher_id = p.id WHERE c.colour = 'Gold' AND p.publisher_name = 'Marvel Comics';	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name = 'Blue Beetle II';	superhero
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.hair_colour_id = colour.id  WHERE colour.colour = 'Blond';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Intelligence' ORDER BY ha.attribute_value ASC LIMIT 1;	superhero
SELECT r.race  FROM superhero s  JOIN race r ON s.race_id = r.id  WHERE s.superhero_name = 'Copycat';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Durability' AND ha.attribute_value < 50;	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Death Touch';	superhero
SELECT COUNT(*)  FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE g.gender = 'Female'    AND a.attribute_name = 'Strength'    AND ha.attribute_value = 100;	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id GROUP BY s.id, s.superhero_name ORDER BY COUNT(hp.power_id) DESC LIMIT 1;	superhero
SELECT COUNT(*)  FROM superhero s JOIN race r ON s.race_id = r.id WHERE r.race = 'Vampire';	superhero
SELECT      (SUM(CASE WHEN a.alignment = 'Bad' THEN 1 ELSE 0 END) * 100.0 / COUNT(s.id)) AS percentage_bad_alignment,     SUM(CASE WHEN a.alignment = 'Bad' AND p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS count_bad_alignment_marvel FROM superhero s JOIN alignment a ON s.alignment_id = a.id JOIN publisher p ON s.publisher_id = p.id;	superhero
SELECT      SUM(CASE WHEN p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) -      SUM(CASE WHEN p.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) AS difference FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name IN ('Marvel Comics', 'DC Comics');	superhero
SELECT id FROM publisher WHERE publisher_name = 'Star Trek';	superhero
SELECT AVG(attribute_value) FROM hero_attribute;	superhero
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL;	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.id = 75;	superhero
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id JOIN superhero s ON hp.hero_id = s.id WHERE s.superhero_name = 'Deathlok';	superhero
SELECT AVG(s.weight_kg) FROM superhero s JOIN gender g ON s.gender_id = g.id WHERE g.gender = 'Female';	superhero
SELECT DISTINCT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id JOIN superhero s ON hp.hero_id = s.id JOIN gender g ON s.gender_id = g.id WHERE g.gender = 'Male' LIMIT 5;	superhero
SELECT s.superhero_name FROM superhero s JOIN race r ON s.race_id = r.id WHERE r.race = 'Alien';	superhero
SELECT s.superhero_name FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.height_cm BETWEEN 170 AND 190   AND c.colour = 'No Colour';	superhero
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id WHERE hp.hero_id = 56;	superhero
SELECT s.full_name FROM superhero s JOIN race r ON s.race_id = r.id WHERE r.race = 'Demi-God' LIMIT 5;	superhero
SELECT COUNT(*)  FROM superhero  WHERE alignment_id = 2;	superhero
SELECT r.race  FROM superhero s  JOIN race r ON s.race_id = r.id  WHERE s.weight_kg = 169;	superhero
SELECT c.colour  FROM superhero s  JOIN race r ON s.race_id = r.id  JOIN colour c ON s.hair_colour_id = c.id  WHERE s.height_cm = 185 AND r.race = 'human';	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id ORDER BY s.weight_kg DESC LIMIT 1;	superhero
SELECT (SUM(CASE WHEN p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS percentage FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.height_cm BETWEEN 150 AND 180;	superhero
SELECT s.superhero_name FROM superhero s JOIN gender g ON s.gender_id = g.id WHERE g.gender = 'Male'   AND s.weight_kg > (SELECT AVG(weight_kg) * 0.79 FROM superhero);	superhero
SELECT power_name  FROM superpower  JOIN hero_power ON superpower.id = hero_power.power_id  GROUP BY power_name  ORDER BY COUNT(power_name) DESC  LIMIT 1;	superhero
SELECT ha.attribute_value FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = 'Abomination';	superhero
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id WHERE hp.hero_id = 1;	superhero
SELECT COUNT(*)  FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Stealth';	superhero
SELECT s.full_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Strength' ORDER BY ha.attribute_value DESC LIMIT 1;	superhero
SELECT AVG(CASE WHEN skin_colour_id = 1 THEN 1 ELSE 0 END) FROM superhero;	superhero
SELECT COUNT(*)  FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Dark Horse Comics';	superhero
SELECT s.superhero_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE p.publisher_name = 'Dark Horse Comics' AND a.attribute_name = 'Durability' ORDER BY ha.attribute_value DESC LIMIT 1;	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.full_name = 'Abraham Sapien';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Flight';	superhero
SELECT c1.colour AS eye_colour, c2.colour AS hair_colour, c3.colour AS skin_colour FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN publisher p ON s.publisher_id = p.id JOIN colour c1 ON s.eye_colour_id = c1.id JOIN colour c2 ON s.hair_colour_id = c2.id JOIN colour c3 ON s.skin_colour_id = c3.id WHERE g.gender = 'Female' AND p.publisher_name = 'Dark Horse Comics';	superhero
SELECT s.superhero_name, p.publisher_name  FROM superhero s  JOIN publisher p ON s.publisher_id = p.id  WHERE s.hair_colour_id = s.skin_colour_id    AND s.hair_colour_id = s.eye_colour_id;	superhero
SELECT r.race FROM superhero s JOIN race r ON s.race_id = r.id WHERE s.superhero_name = 'A-Bomb';	superhero
SELECT (CAST(SUM(CASE WHEN c.colour = 'Blue' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*))  FROM superhero s  JOIN gender g ON s.gender_id = g.id  JOIN colour c ON s.skin_colour_id = c.id  WHERE g.gender = 'Female';	superhero
SELECT s.superhero_name, r.race  FROM superhero s  JOIN race r ON s.race_id = r.id  WHERE s.full_name = 'Charles Chandler';	superhero
SELECT g.gender  FROM superhero s  JOIN gender g ON s.gender_id = g.id  WHERE s.superhero_name = 'Agent 13';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Adaptation';	superhero
SELECT COUNT(*)  FROM hero_power hp JOIN superhero s ON hp.hero_id = s.id WHERE s.superhero_name = 'Amazo';	superhero
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id JOIN superhero s ON hp.hero_id = s.id WHERE s.full_name = 'Hunter Zolomon';	superhero
SELECT s.height_cm FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.colour = 'Amber';	superhero
SELECT s.superhero_name  FROM superhero s JOIN colour c1 ON s.eye_colour_id = c1.id JOIN colour c2 ON s.hair_colour_id = c2.id WHERE c1.colour = 'Black' AND c2.colour = 'Black';	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.skin_colour_id IN (SELECT id FROM colour WHERE colour = 'Gold');	superhero
SELECT s.full_name FROM superhero s JOIN race r ON s.race_id = r.id WHERE r.race = 'Vampire';	superhero
SELECT superhero_name FROM superhero JOIN alignment ON superhero.alignment_id = alignment.id WHERE alignment.alignment = 'Neutral';	superhero
SELECT COUNT(*)  FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Strength'    AND ha.attribute_value = (     SELECT MAX(attribute_value)      FROM hero_attribute ha2     JOIN attribute a2 ON ha2.attribute_id = a2.id     WHERE a2.attribute_name = 'Strength'   );	superhero
SELECT r.race, a.alignment  FROM superhero s  JOIN race r ON s.race_id = r.id  JOIN alignment a ON s.alignment_id = a.id  WHERE s.superhero_name = 'Cameron Hicks';	superhero
SELECT (CAST(SUM(CASE WHEN g.gender = 'Female' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*))  FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics';	superhero
SELECT AVG(s.weight_kg)  FROM superhero s  JOIN race r ON s.race_id = r.id  WHERE r.race = 'Alien';	superhero
SELECT      (SELECT weight_kg FROM superhero WHERE full_name = 'Emil Blonsky') -      (SELECT weight_kg FROM superhero WHERE full_name = 'Charles Chandler') AS weight_difference;	superhero
SELECT AVG(height_cm) AS average_height FROM superhero;	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Abomination';	superhero
SELECT COUNT(*)  FROM superhero  WHERE race_id = 21 AND gender_id = 1;	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' ORDER BY ha.attribute_value DESC LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3;	superhero
SELECT a.attribute_name, ha.attribute_value FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE s.superhero_name = '3-D Man';	superhero
SELECT s.superhero_name  FROM superhero s JOIN colour c1 ON s.eye_colour_id = c1.id JOIN colour c2 ON s.hair_colour_id = c2.id WHERE c1.colour = 'Blue' AND c2.colour = 'Brown';	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy');	superhero
SELECT COUNT(*)  FROM superhero  WHERE publisher_id = 1;	superhero
SELECT (SUM(CASE WHEN c.colour = 'Blue' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS percentage FROM superhero s JOIN colour c ON s.eye_colour_id = c.id;	superhero
SELECT CAST(SUM(CASE WHEN s.gender_id = 1 THEN 1 ELSE 0 END) AS FLOAT) / SUM(CASE WHEN s.gender_id = 2 THEN 1 ELSE 0 END) AS ratio FROM superhero s JOIN gender g ON s.gender_id = g.id;	superhero
SELECT superhero_name FROM superhero WHERE height_cm = (SELECT MAX(height_cm) FROM superhero);	superhero
SELECT id FROM superpower WHERE power_name = 'Cryokinesis';	superhero
SELECT superhero_name FROM superhero WHERE id = 294;	superhero
SELECT full_name FROM superhero WHERE weight_kg IS NULL OR weight_kg = 0;	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.full_name = 'Karen Beecher-Duncan';	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.full_name = 'Helen Parr';	superhero
SELECT r.race FROM superhero s JOIN race r ON s.race_id = r.id WHERE s.weight_kg = 108 AND s.height_cm = 188;	superhero
SELECT p.publisher_name  FROM superhero s  JOIN publisher p ON s.publisher_id = p.id  WHERE s.id = 38;	superhero
SELECT r.race  FROM superhero s  JOIN hero_attribute ha ON s.id = ha.hero_id  JOIN race r ON s.race_id = r.id  WHERE ha.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute);	superhero
SELECT a.alignment, sp.power_name FROM superhero s JOIN alignment a ON s.alignment_id = a.id JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Atom IV';	superhero
SELECT s.full_name FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.colour = 'Blue' LIMIT 5;	superhero
SELECT AVG(ha.attribute_value) FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE s.alignment_id = 3;	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.skin_colour_id = c.id JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_value = 100;	superhero
SELECT COUNT(*)  FROM superhero  JOIN alignment ON superhero.alignment_id = alignment.id  JOIN gender ON superhero.gender_id = gender.id  WHERE alignment.id = 1 AND gender.id = 2;	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_value BETWEEN 75 AND 80;	superhero
SELECT r.race  FROM superhero s  JOIN race r ON s.race_id = r.id  JOIN colour c ON s.hair_colour_id = c.id  JOIN gender g ON s.gender_id = g.id  WHERE c.colour = 'Blue' AND g.gender = 'Male';	superhero
SELECT (SUM(CASE WHEN s.gender_id = 2 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS percentage FROM superhero s JOIN alignment a ON s.alignment_id = a.id WHERE a.id = 2;	superhero
SELECT      SUM(CASE WHEN T1.eye_colour_id = 7 THEN 1 ELSE 0 END) - SUM(CASE WHEN T1.eye_colour_id = 1 THEN 1 ELSE 0 END) FROM      superhero T1 WHERE      T1.weight_kg IS NULL OR T1.weight_kg = 0;	superhero
SELECT ha.attribute_value  FROM superhero s  JOIN hero_attribute ha ON s.id = ha.hero_id  JOIN attribute a ON ha.attribute_id = a.id  WHERE s.superhero_name = 'Hulk' AND a.attribute_name = 'Strength';	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Ajax';	superhero
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.skin_colour_id = colour.id  JOIN alignment ON superhero.alignment_id = alignment.id  WHERE colour.colour = 'Green' AND alignment.alignment = 'Bad';	superhero
SELECT COUNT(*)  FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN publisher p ON s.publisher_id = p.id WHERE g.gender = 'Female' AND p.publisher_name = 'Marvel Comics';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Wind Control' ORDER BY s.superhero_name;	superhero
SELECT g.gender FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id JOIN gender g ON s.gender_id = g.id WHERE sp.power_name = 'Phoenix Force';	superhero
SELECT s.superhero_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'DC Comics' ORDER BY s.weight_kg DESC LIMIT 1;	superhero
SELECT AVG(s.height_cm) FROM superhero s JOIN race r ON s.race_id = r.id JOIN publisher p ON s.publisher_id = p.id WHERE r.race != 'Human' AND p.publisher_name = 'Dark Horse Comics';	superhero
SELECT COUNT(*)  FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' AND ha.attribute_value = 100;	superhero
SELECT      SUM(CASE WHEN p.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) - SUM(CASE WHEN p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS difference FROM superhero s JOIN publisher p ON s.publisher_id = p.id;	superhero
SELECT a.attribute_name FROM attribute a JOIN hero_attribute ha ON a.id = ha.attribute_id JOIN superhero s ON s.id = ha.hero_id WHERE s.superhero_name = 'Black Panther' ORDER BY ha.attribute_value ASC LIMIT 1;	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.superhero_name = 'Abomination';	superhero
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1;	superhero
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler';	superhero
SELECT      (CAST(SUM(CASE WHEN g.gender = 'Female' THEN 1 ELSE 0 END) AS FLOAT) * 100.0 / COUNT(*)) AS percentage FROM superhero s JOIN publisher p ON s.publisher_id = p.id JOIN gender g ON s.gender_id = g.id WHERE p.publisher_name = 'George Lucas';	superhero
SELECT      (SUM(CASE WHEN a.alignment = 'Good' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS percentage FROM superhero s JOIN publisher p ON s.publisher_id = p.id JOIN alignment a ON s.alignment_id = a.id WHERE p.publisher_name = 'Marvel Comics';	superhero
SELECT COUNT(*)  FROM superhero  WHERE full_name LIKE 'John%'	superhero
SELECT hero_id FROM hero_attribute WHERE attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute);	superhero
SELECT full_name FROM superhero WHERE race_id IN (SELECT id FROM race WHERE race = 'Alien');	superhero
SELECT s.full_name FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.weight_kg < 100 AND c.colour = 'Brown';	superhero
SELECT ha.attribute_value  FROM hero_attribute ha  JOIN superhero s ON ha.hero_id = s.id  WHERE s.superhero_name = 'Aquababy';	superhero
SELECT s.weight_kg, r.race  FROM superhero s  JOIN race r ON s.race_id = r.id  WHERE s.id = 40;	superhero
SELECT AVG(s.height_cm)  FROM superhero s JOIN alignment a ON s.alignment_id = a.id WHERE a.alignment = 'Neutral';	superhero
SELECT DISTINCT ha.hero_id  FROM hero_attribute ha  JOIN attribute a ON ha.attribute_id = a.id  WHERE a.attribute_name = 'Intelligence';	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.superhero_name = 'Blackwulf';	superhero
SELECT DISTINCT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id JOIN superhero s ON hp.hero_id = s.id WHERE s.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero);	superhero
SELECT d.driverRef FROM qualifying q JOIN drivers d ON q.driverId = d.driverId WHERE q.raceId = 20 AND q.q1 IS NOT NULL ORDER BY q.q1 DESC LIMIT 5;	formula_1
SELECT d.surname FROM qualifying q JOIN drivers d ON q.driverId = d.driverId WHERE q.raceId = 19 AND q.q2 IS NOT NULL ORDER BY q.q2 ASC LIMIT 1;	formula_1
SELECT DISTINCT r.year FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.location = 'Shanghai';	formula_1
SELECT r.url FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Circuit de Barcelona-Catalunya';	formula_1
SELECT r.name FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.country = 'Germany';	formula_1
SELECT c.position FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN results res ON r.raceId = res.raceId JOIN constructors con ON res.constructorId = con.constructorId WHERE con.name = 'Renault';	formula_1
SELECT COUNT(*)  FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year = 2010    AND c.country NOT IN (     SELECT country FROM circuits WHERE country IN ('China', 'Japan', 'Bahrain', 'Malaysia', 'Singapore', 'Turkey', 'Russia')   )   AND c.country NOT IN (     SELECT country FROM circuits WHERE country IN ('Austria', 'Belgium', 'Czech Republic', 'France', 'Germany', 'Hungary', 'Italy', 'Netherlands', 'Portugal', 'Spain', 'Switzerland', 'United Kingdom', 'Monaco', 'Azerbaijan')   );	formula_1
SELECT r.name FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.country = 'Spain';	formula_1
SELECT c.lat, c.lng FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.name = 'Australian Grand Prix';	formula_1
SELECT url FROM races WHERE circuitId IN (SELECT circuitId FROM circuits WHERE name = 'Sepang International Circuit');	formula_1
SELECT r.time FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Sepang International Circuit';	formula_1
SELECT lat, lng FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE races.name = 'Abu Dhabi Grand Prix';	formula_1
SELECT c.nationality FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId WHERE cr.raceId = 24 AND cr.points = 1;	formula_1
SELECT q.q1 FROM qualifying q JOIN drivers d ON q.driverId = d.driverId WHERE d.forename = 'Bruno' AND d.surname = 'Senna' AND q.raceId = 354;	formula_1
SELECT d.nationality FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 355 AND q.q2 = '1:40.000';	formula_1
SELECT d.number FROM qualifying q JOIN drivers d ON q.driverId = d.driverId WHERE q.raceId = 903   AND q.q3 LIKE '1:54%';	formula_1
SELECT COUNT(*)  FROM results r JOIN races ra ON r.raceId = ra.raceId JOIN status s ON r.statusId = s.statusId WHERE ra.name = 'Bahrain Grand Prix'    AND ra.year = 2007    AND s.status != 'Finished';	formula_1
SELECT url FROM seasons WHERE year = (SELECT year FROM races WHERE raceId = 901);	formula_1
SELECT COUNT(*)  FROM results r JOIN races ra ON r.raceId = ra.raceId WHERE ra.date = '2015-11-29' AND r.time IS NOT NULL;	formula_1
SELECT d.driverId, d.forename, d.surname, d.dob FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 592 AND r.time IS NOT NULL ORDER BY d.dob ASC LIMIT 1;	formula_1
SELECT d.url FROM drivers d JOIN lapTimes l ON d.driverId = l.driverId WHERE l.raceId = 161 AND l.time LIKE '1:27%';	formula_1
SELECT d.nationality FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 933 ORDER BY CAST(r.fastestLapSpeed AS REAL) DESC LIMIT 1;	formula_1
SELECT c.lat, c.lng FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.name = 'Malaysian Grand Prix';	formula_1
SELECT c.url FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId WHERE cr.raceId = 9 ORDER BY cr.points DESC LIMIT 1;	formula_1
SELECT q.q1  FROM qualifying q  JOIN drivers d ON q.driverId = d.driverId  WHERE d.forename = 'Lucas' AND d.surname = 'di Grassi' AND q.raceId = 345;	formula_1
SELECT d.nationality FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 347 AND q.q2 = '1:15.000';	formula_1
SELECT d.code FROM qualifying q JOIN drivers d ON q.driverId = d.driverId WHERE q.raceId = 45 AND q.q3 LIKE '1:33%'	formula_1
SELECT time FROM results WHERE raceId = 743 AND driverId = (SELECT driverId FROM drivers WHERE forename = 'Bruce' AND surname = 'McLaren');	formula_1
SELECT d.forename, d.surname FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'San Marino Grand Prix'   AND ra.year = 2006   AND r.position = 2;	formula_1
SELECT s.url  FROM seasons s  JOIN races r ON s.year = r.year  WHERE r.raceId = 901;	formula_1
SELECT COUNT(*)  FROM results r JOIN races ra ON r.raceId = ra.raceId WHERE ra.date = '2015-11-29' AND r.time IS NULL;	formula_1
SELECT d.driverId, d.forename, d.surname, d.dob FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 872 AND r.time IS NOT NULL ORDER BY d.dob DESC LIMIT 1;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN lapTimes l ON r.raceId = l.raceId AND r.driverId = l.driverId WHERE r.raceId = 348 ORDER BY l.milliseconds ASC LIMIT 1;	formula_1
SELECT d.nationality FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results WHERE fastestLapSpeed IS NOT NULL) LIMIT 1;	formula_1
SELECT ((r1.fastestLapSpeed - r2.fastestLapSpeed) * 100.0 / r1.fastestLapSpeed) AS percentage_faster FROM results r1 JOIN results r2 ON r1.driverId = r2.driverId JOIN drivers d ON r1.driverId = d.driverId WHERE d.forename = 'Paul' AND d.surname = 'di Resta' AND r1.raceId = 853 AND r2.raceId = 854;	formula_1
SELECT      CAST(COUNT(CASE WHEN r.time IS NOT NULL THEN 1 END) AS FLOAT) * 100 / COUNT(r.driverId) AS race_completion_rate FROM      results r JOIN      races ra ON r.raceId = ra.raceId WHERE      ra.date = '1983-07-16';	formula_1
SELECT MIN(year) FROM races WHERE name = 'Singapore Grand Prix';	formula_1
SELECT COUNT(*), name  FROM races  WHERE year = 2005  ORDER BY name DESC;	formula_1
SELECT name  FROM races  WHERE year = (SELECT MIN(year) FROM races)    AND strftime('%m', date) = (SELECT strftime('%m', MIN(date)) FROM races);	formula_1
SELECT name, date FROM races WHERE year = 1999 AND round = (SELECT MAX(round) FROM races WHERE year = 1999);	formula_1
SELECT year FROM races GROUP BY year ORDER BY MAX(round) DESC LIMIT 1;	formula_1
SELECT name FROM races WHERE year = 2017 AND name NOT IN (SELECT name FROM races WHERE year = 2000);	formula_1
SELECT circuits.country, circuits.name, circuits.location FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE races.name = 'European Grand Prix' ORDER BY races.year ASC LIMIT 1;	formula_1
SELECT MAX(r.year) FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Brands Hatch' AND r.name = 'British Grand Prix';	formula_1
SELECT COUNT(*)  FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Silverstone Circuit' AND r.name = 'British Grand Prix';	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Singapore Grand Prix' AND ra.year = 2010 ORDER BY r.positionOrder;	formula_1
SELECT d.forename, d.surname, MAX(r.points) AS points FROM drivers d JOIN results r ON d.driverId = r.driverId GROUP BY d.driverId ORDER BY points DESC LIMIT 1;	formula_1
SELECT d.forename || ' ' || d.surname AS driver_name, r.points FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Chinese Grand Prix' AND ra.year = 2017 ORDER BY r.points DESC LIMIT 3;	formula_1
SELECT d.forename, d.surname, r.name FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId JOIN races r ON lt.raceId = r.raceId WHERE lt.milliseconds = (SELECT MIN(milliseconds) FROM lapTimes);	formula_1
SELECT AVG(lt.milliseconds)  FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId JOIN races r ON lt.raceId = r.raceId WHERE d.forename = 'Lewis'    AND d.surname = 'Hamilton'   AND r.name = 'Malaysian Grand Prix'   AND r.year = 2009;	formula_1
SELECT CAST(COUNT(CASE WHEN ds.position > 1 THEN 1 END) AS FLOAT) * 100 / COUNT(*) AS percentage FROM driverStandings ds JOIN drivers d ON ds.driverId = d.driverId JOIN races r ON ds.raceId = r.raceId WHERE d.surname = 'Hamilton' AND r.year >= 2010;	formula_1
SELECT d.forename, d.surname, d.nationality, MAX(rs.points) AS max_points FROM drivers d JOIN results rs ON d.driverId = rs.driverId WHERE rs.position = 1 GROUP BY d.driverId ORDER BY COUNT(rs.resultId) DESC LIMIT 1;	formula_1
SELECT YEAR(CURRENT_TIMESTAMP) - YEAR(dob) AS age, forename || ' ' || surname AS name FROM drivers WHERE nationality = 'Japanese' ORDER BY dob DESC LIMIT 1;	formula_1
SELECT c.name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.year BETWEEN 1990 AND 2000 GROUP BY c.circuitId, c.name HAVING COUNT(r.raceId) = 4;	formula_1
SELECT c.name AS circuit_name, c.location, r.name AS race_name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE c.country = 'USA' AND r.year = 2006;	formula_1
SELECT r.name, c.name, c.location FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year = 2005 AND strftime('%m', r.date) = '09';	formula_1
SELECT r.name  FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.forename = 'Alex' AND d.surname = 'Yoong' AND res.position < 20;	formula_1
SELECT COUNT(*)  FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId JOIN circuits c ON ra.circuitId = c.circuitId WHERE d.forename = 'Michael'    AND d.surname = 'Schumacher'   AND c.name = 'Sepang International Circuit'   AND r.position = 1;	formula_1
SELECT r.name, r.year FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.forename = 'Michael' AND d.surname = 'Schumacher' ORDER BY res.fastestLapTime LIMIT 1;	formula_1
SELECT AVG(r.points)  FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId WHERE d.forename = 'Eddie'    AND d.surname = 'Irvine'    AND ra.year = 2000;	formula_1
SELECT r.name, res.points FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' ORDER BY r.year ASC LIMIT 1;	formula_1
SELECT r.name, c.country, r.date FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year = 2017 ORDER BY r.date;	formula_1
SELECT r.name, r.year, c.location FROM races r JOIN results res ON r.raceId = res.raceId JOIN circuits c ON r.circuitId = c.circuitId ORDER BY res.laps DESC LIMIT 1;	formula_1
SELECT      (COUNT(CASE WHEN c.country = 'Germany' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM      races r JOIN      circuits c ON r.circuitId = c.circuitId WHERE      r.name = 'European Grand Prix';	formula_1
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit';	formula_1
SELECT name  FROM circuits  WHERE name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring')  ORDER BY lat DESC  LIMIT 1;	formula_1
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit';	formula_1
SELECT country FROM circuits WHERE alt = (SELECT MAX(alt) FROM circuits);	formula_1
SELECT COUNT(*) FROM drivers WHERE code IS NULL;	formula_1
SELECT nationality FROM drivers ORDER BY dob ASC LIMIT 1;	formula_1
SELECT surname FROM drivers WHERE nationality = 'Italian';	formula_1
SELECT url FROM drivers WHERE forename = 'Anthony' AND surname = 'Davidson';	formula_1
SELECT driverRef FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton';	formula_1
SELECT c.name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.name = 'Spanish Grand Prix' AND r.year = 2009;	formula_1
SELECT DISTINCT year FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = 'Silverstone Circuit');	formula_1
SELECT url FROM races WHERE circuitId IN (SELECT circuitId FROM circuits WHERE name = 'Silverstone Circuit');	formula_1
SELECT time FROM races WHERE year = 2010 AND circuitId = (SELECT circuitId FROM circuits WHERE name = 'Yas Marina Circuit');	formula_1
SELECT COUNT(*)  FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.country = 'Italy';	formula_1
SELECT r.date FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Circuit de Barcelona-Catalunya';	formula_1
SELECT url FROM circuits WHERE circuitId IN (SELECT circuitId FROM races WHERE name = 'Spanish Grand Prix' AND year = 2009);	formula_1
SELECT MIN(r.fastestLapTime)  FROM results r  JOIN drivers d ON r.driverId = d.driverId  WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.fastestLapSpeed IS NOT NULL ORDER BY CAST(r.fastestLapSpeed AS REAL) DESC LIMIT 1;	formula_1
SELECT d.driverRef FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Canadian Grand Prix' AND ra.year = 2007 AND r.position = 1;	formula_1
SELECT r.name, r.date FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT r.name FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' ORDER BY res.rank ASC LIMIT 1;	formula_1
SELECT MAX(r.fastestLapSpeed)  FROM results r JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Spanish Grand Prix' AND ra.year = 2009;	formula_1
SELECT DISTINCT r.year FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT r.positionOrder FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId WHERE d.forename = 'Lewis'    AND d.surname = 'Hamilton'   AND ra.name = 'Chinese Grand Prix'   AND ra.year = 2008;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Australian Grand Prix' AND ra.year = 1989 AND r.grid = 4;	formula_1
SELECT COUNT(*)  FROM results r JOIN races ra ON r.raceId = ra.raceId JOIN status s ON r.statusId = s.statusId WHERE ra.name = 'Australian Grand Prix'    AND ra.year = 2008    AND r.time IS NOT NULL;	formula_1
SELECT fastestLapTime  FROM results  JOIN drivers ON results.driverId = drivers.driverId  JOIN races ON results.raceId = races.raceId  WHERE drivers.forename = 'Lewis'    AND drivers.surname = 'Hamilton'    AND races.name = '2008 Australian Grand Prix';	formula_1
SELECT r.time  FROM results r JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2008    AND ra.name = 'Chinese Grand Prix'   AND r.position = 2;	formula_1
SELECT d.forename, d.surname, r.time, d.url  FROM results r  JOIN drivers d ON r.driverId = d.driverId  JOIN races ra ON r.raceId = ra.raceId  WHERE ra.year = 2008 AND ra.name = 'Australian Grand Prix' AND r.position = 1 AND r.time LIKE '%:%';	formula_1
SELECT COUNT(*)  FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE d.nationality = 'British'    AND ra.name = 'Australian Grand Prix'   AND ra.year = 2008;	formula_1
SELECT COUNT(DISTINCT d.driverId)  FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Chinese Grand Prix'    AND ra.year = 2008    AND r.time IS NOT NULL   AND d.driverId IN (     SELECT DISTINCT driverId      FROM results      GROUP BY driverId      HAVING COUNT(raceId) > 0   )	formula_1
SELECT SUM(r.points) AS total_points FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT AVG(     CAST(SUBSTR(r.fastestLapTime, 1, INSTR(r.fastestLapTime, ':') - 1) AS REAL) * 60 +     CAST(SUBSTR(r.fastestLapTime, INSTR(r.fastestLapTime, ':') + 1, 2) AS REAL) +     CAST(SUBSTR(r.fastestLapTime, INSTR(r.fastestLapTime, '.') + 1) AS REAL) / 1000 ) AS average_fastest_lap_time_seconds FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND r.fastestLapTime IS NOT NULL;	formula_1
SELECT CAST(COUNT(CASE WHEN r.time IS NOT NULL THEN 1 END) AS FLOAT) * 100 / COUNT(*) AS completion_rate FROM results r JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2008 AND ra.name = 'Australian Grand Prix';	formula_1
SELECT ((CAST(SUBSTR(r1.time, 1, INSTR(r1.time, ':') - 1) AS REAL) * 60 + CAST(SUBSTR(r1.time, INSTR(r1.time, ':') + 1, INSTR(SUBSTR(r1.time, INSTR(r1.time, ':') + 1), ':') - 1) AS REAL) + CAST(SUBSTR(r1.time, INSTR(r1.time, '.', -1) - 2, 2) AS REAL) / 1000.0 + CAST(SUBSTR(r1.time, INSTR(r1.time, '.', -1) + 1) AS REAL) / 1000.0) - (CAST(SUBSTR(r2.time, 1, INSTR(r2.time, ':') - 1) AS REAL) * 60 + CAST(SUBSTR(r2.time, INSTR(r2.time, ':') + 1, INSTR(SUBSTR(r2.time, INSTR(r2.time, ':') + 1), ':') - 1) AS REAL) + CAST(SUBSTR(r2.time, INSTR(r2.time, '.', -1) - 2, 2) AS REAL) / 1000.0 + CAST(SUBSTR(r2.time, INSTR(r2.time, '.', -1) + 1) AS REAL) / 1000.0)) / (CAST(SUBSTR(r1.time, 1, INSTR(r1.time, ':') - 1) AS REAL) * 60 + CAST(SUBSTR(r1.time, INSTR(r1.time, ':') + 1, INSTR(SUBSTR(r1.time, INSTR(r1.time, ':') + 1), ':') - 1) AS REAL) + CAST(SUBSTR(r1.time, INSTR(r1.time, '.', -1) - 2, 2) AS REAL) / 1000.0 + CAST(SUBSTR(r1.time, INSTR(r1.time, '.', -1) + 1) AS REAL) / 1000.0) * 100 FROM results r1 JOIN results r2 ON r1.raceId = r2.raceId JOIN races ra ON r1.raceId = ra.raceId WHERE ra.year = 2008 AND ra.name = 'Australian Grand Prix' AND r1.positionText = '1' AND r2.positionText != '1' AND r2.time IS NOT NULL ORDER BY (CAST(SUBSTR(r2.time, 1, INSTR(r2.time, ':') - 1) AS REAL) * 60 + CAST(SUBSTR(r2.time, INSTR(r2.time, ':') + 1, INSTR(SUBSTR(r2.time, INSTR(r2.time, ':') + 1), ':') - 1) AS REAL) + CAST(SUBSTR(r2.time, INSTR(r2.time, '.', -1) - 2, 2) AS REAL) / 1000.0 + CAST(SUBSTR(r2.time, INSTR(r2.time, '.', -1) + 1) AS REAL) / 1000.0) DESC LIMIT 1;	formula_1
SELECT COUNT(*) FROM circuits WHERE location = 'Adelaide' AND country = 'Australia';	formula_1
SELECT lat, lng FROM circuits WHERE country = 'USA';	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND strftime('%Y', dob) > '1980';	formula_1
SELECT MAX(cr.points) FROM constructorResults cr JOIN constructors c ON cr.constructorId = c.constructorId WHERE c.nationality = 'British';	formula_1
SELECT c.name FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId ORDER BY cr.points DESC LIMIT 1;	formula_1
SELECT c.name FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId WHERE cr.raceId = 291 AND cr.points = 0;	formula_1
SELECT COUNT(DISTINCT cr.constructorId)  FROM constructorResults cr JOIN constructors c ON cr.constructorId = c.constructorId WHERE c.nationality = 'Japanese'    AND cr.points = 0 GROUP BY cr.constructorId HAVING COUNT(cr.raceId) = 2;	formula_1
SELECT DISTINCT c.name FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId WHERE cs.position = 1;	formula_1
SELECT COUNT(*)  FROM constructors c JOIN results r ON c.constructorId = r.constructorId WHERE c.nationality = 'French' AND r.laps > 50;	formula_1
SELECT      CAST(COUNT(CASE WHEN r.time IS NOT NULL THEN 1 END) AS FLOAT) * 100 / COUNT(*) AS completion_percentage FROM      results r JOIN      drivers d ON r.driverId = d.driverId JOIN      races ra ON r.raceId = ra.raceId WHERE      d.nationality = 'Japanese'      AND ra.year BETWEEN 2007 AND 2009;	formula_1
SELECT r.year, AVG(CAST(SUBSTR(res.time, 1, INSTR(res.time, ':') - 1) AS REAL) * 3600 +                     CAST(SUBSTR(res.time, INSTR(res.time, ':') + 1, INSTR(SUBSTR(res.time, INSTR(res.time, ':') + 1), ':') - 1) AS REAL) * 60 +                     CAST(SUBSTR(res.time, INSTR(res.time, ':', INSTR(res.time, ':') + 1) + 1) AS REAL)) AS average_time_seconds FROM races r JOIN results res ON r.raceId = res.raceId JOIN driverStandings ds ON r.raceId = ds.raceId AND res.driverId = ds.driverId WHERE r.year < 1975 AND res.time IS NOT NULL AND ds.position = 1 GROUP BY r.year;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE strftime('%Y', d.dob) > '1975' AND r.rank = 2;	formula_1
SELECT COUNT(*)  FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE d.nationality = 'Italian' AND r.time IS NULL;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId ORDER BY CAST(r.fastestLapTime AS TIME) LIMIT 1;	formula_1
SELECT fastestLap  FROM results  JOIN races ON results.raceId = races.raceId  WHERE races.year = 2009 AND results.position = 1;	formula_1
SELECT avg(fastestLapSpeed)  FROM results  JOIN races ON results.raceId = races.raceId  WHERE races.name = 'Spanish Grand Prix' AND races.year = 2009;	formula_1
SELECT r.name, r.year FROM races r JOIN results res ON r.raceId = res.raceId WHERE res.milliseconds IS NOT NULL ORDER BY res.milliseconds ASC LIMIT 1;	formula_1
SELECT      CAST(COUNT(CASE WHEN d.dob < '1985-01-01' AND r.laps > 50 THEN 1 END) AS FLOAT) * 100 / COUNT(*) AS percentage FROM      results res     INNER JOIN drivers d ON res.driverId = d.driverId     INNER JOIN races r ON res.raceId = r.raceId WHERE      r.year BETWEEN 2000 AND 2005;	formula_1
SELECT COUNT(*)  FROM drivers d JOIN lapTimes l ON d.driverId = l.driverId WHERE d.nationality = 'French'    AND l.milliseconds < 120000;	formula_1
SELECT code FROM drivers WHERE nationality = 'American';	formula_1
SELECT raceId FROM races WHERE year = 2009;	formula_1
SELECT COUNT(*) FROM results WHERE raceId = 18;	formula_1
SELECT code, nationality  FROM drivers  ORDER BY dob DESC  LIMIT 3;  SELECT COUNT(*)  FROM drivers  WHERE nationality = 'Dutch'  ORDER BY dob DESC  LIMIT 3;	formula_1
SELECT driverRef FROM drivers WHERE forename = 'Robert' AND surname = 'Kubica';	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND strftime('%Y', dob) = '1980';	formula_1
SELECT d.driverRef, MIN(lt.time) AS earliest_lap_time FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE d.nationality = 'German' AND strftime('%Y', d.dob) BETWEEN '1980' AND '1990' GROUP BY d.driverId ORDER BY earliest_lap_time ASC LIMIT 3;	formula_1
SELECT driverRef FROM drivers WHERE nationality = 'German' ORDER BY dob ASC LIMIT 1;	formula_1
SELECT d.driverId, d.code FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE strftime('%Y', d.dob) = '1971'   AND r.fastestLapTime IS NOT NULL;	formula_1
SELECT d.driverId, d.forename, d.surname, MAX(lt.time) AS latest_lap_time FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE d.nationality = 'Spanish' AND strftime('%Y', d.dob) < '1982' GROUP BY d.driverId, d.forename, d.surname ORDER BY latest_lap_time DESC LIMIT 10;	formula_1
SELECT year FROM races r JOIN results res ON r.raceId = res.raceId WHERE res.fastestLapTime IS NOT NULL ORDER BY res.fastestLapTime ASC LIMIT 1;	formula_1
SELECT year FROM races r JOIN lapTimes l ON r.raceId = l.raceId ORDER BY CAST(l.time AS REAL) DESC LIMIT 1;	formula_1
SELECT driverId FROM lapTimes WHERE lap = 1 ORDER BY time ASC LIMIT 5;	formula_1
SELECT COUNT(*)  FROM results  WHERE raceId > 50 AND raceId < 100    AND statusId = 2    AND time IS NOT NULL;	formula_1
SELECT COUNT(*) AS times_held, location, lat, lng FROM circuits WHERE country = 'Austria' GROUP BY location, lat, lng;	formula_1
SELECT raceId FROM results WHERE time IS NOT NULL GROUP BY raceId ORDER BY COUNT(*) DESC LIMIT 1;	formula_1
SELECT d.driverRef, d.nationality, d.dob FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 23 AND q.q2 IS NOT NULL;	formula_1
SELECT      r.year,     d.forename || ' ' || d.surname AS driver_name,     r.date,     r.time FROM      drivers d JOIN      qualifying q ON d.driverId = q.driverId JOIN      races r ON q.raceId = r.raceId WHERE      d.dob = (SELECT MAX(dob) FROM drivers) ORDER BY      r.date LIMIT 1;	formula_1
SELECT COUNT(*)  FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN status s ON r.statusId = s.statusId WHERE d.nationality = 'American' AND s.status = 'Puncture';	formula_1
SELECT c.url FROM constructors c WHERE c.nationality = 'Italian' ORDER BY c.constructorId LIMIT 1;	formula_1
SELECT c.url FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId GROUP BY c.constructorId, c.url ORDER BY SUM(cr.points) DESC LIMIT 1;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId JOIN races r ON lt.raceId = r.raceId WHERE r.name = 'French Grand Prix' AND lt.lap = 3 ORDER BY lt.milliseconds DESC LIMIT 1;	formula_1
SELECT raceId, MIN(milliseconds) AS fastest_lap_time_ms FROM lapTimes WHERE lap = 1;	formula_1
SELECT AVG(r.fastestLapTime)  FROM results r JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2006 AND ra.name = 'United States Grand Prix' AND r.rank < 11;	formula_1
SELECT d.forename, d.surname, AVG(CAST(SUBSTR(p.duration, 1, INSTR(p.duration, '.') - 1) AS INTEGER) * 1000 + CAST(SUBSTR(p.duration, INSTR(p.duration, '.') + 1) AS INTEGER)) AS avg_pitstop_duration_ms FROM drivers d JOIN pitStops p ON d.driverId = p.driverId WHERE d.nationality = 'German' AND d.dob BETWEEN '1980-01-01' AND '1985-12-31' GROUP BY d.driverId, d.forename, d.surname ORDER BY avg_pitstop_duration_ms ASC LIMIT 3;	formula_1
SELECT d.forename, d.surname, r.time FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Canadian Grand Prix' AND ra.year = 2008 AND r.position = 1;	formula_1
SELECT c.constructorRef, c.url FROM results r JOIN constructors c ON r.constructorId = c.constructorId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Singapore Grand Prix' AND ra.year = 2009 AND r.position = 1;	formula_1
SELECT forename, surname, dob  FROM drivers  WHERE nationality = 'Austrian'    AND dob BETWEEN '1981-01-01' AND '1991-12-31';	formula_1
SELECT forename || ' ' || surname AS full_name, url, dob FROM drivers WHERE nationality = 'German' AND dob BETWEEN '1971-01-01' AND '1985-12-31' ORDER BY dob DESC;	formula_1
SELECT location, country, lat, lng FROM circuits WHERE name = 'Hungaroring';	formula_1
SELECT      cr.points,     c.name,     c.nationality FROM      constructorResults cr JOIN      races r ON cr.raceId = r.raceId JOIN      constructors c ON cr.constructorId = c.constructorId WHERE      r.name = 'Monaco Grand Prix'     AND r.year BETWEEN 1980 AND 2010 ORDER BY      cr.points DESC LIMIT 1;	formula_1
SELECT AVG(r.points)  FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId WHERE d.forename = 'Lewis'    AND d.surname = 'Hamilton'   AND ra.name = 'Turkish Grand Prix';	formula_1
SELECT AVG(race_count)  FROM (     SELECT year, COUNT(*) AS race_count     FROM races     WHERE year BETWEEN 2000 AND 2009     GROUP BY year );	formula_1
SELECT nationality FROM drivers GROUP BY nationality ORDER BY COUNT(*) DESC LIMIT 1;	formula_1
SELECT wins FROM driverStandings WHERE position = 91;	formula_1
SELECT r.name FROM races r JOIN results res ON r.raceId = res.raceId WHERE res.fastestLapTime IS NOT NULL ORDER BY res.fastestLapTime ASC LIMIT 1;	formula_1
SELECT c.location || ', ' || c.country AS full_location FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.date = (SELECT MAX(date) FROM races);	formula_1
SELECT d.forename, d.surname FROM qualifying q JOIN drivers d ON q.driverId = d.driverId JOIN races r ON q.raceId = r.raceId JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year = 2008   AND c.name = 'Marina Bay Street Circuit'   AND q.position = 1 ORDER BY q.q3 LIMIT 1;	formula_1
SELECT d.forename || ' ' || d.surname AS full_name, d.nationality, r.name AS first_race_name FROM drivers d JOIN results res ON d.driverId = res.driverId JOIN races r ON res.raceId = r.raceId WHERE d.dob = (SELECT MAX(dob) FROM drivers) ORDER BY r.date LIMIT 1;	formula_1
SELECT COUNT(*)  FROM results r JOIN races ra ON r.raceId = ra.raceId JOIN status s ON r.statusId = s.statusId WHERE ra.name = 'Canadian Grand Prix' AND s.status = 'Accident' GROUP BY r.driverId ORDER BY COUNT(*) DESC LIMIT 1;	formula_1
SELECT d.forename, d.surname, MAX(rs.wins) AS wins FROM drivers d JOIN driverStandings rs ON d.driverId = rs.driverId WHERE d.dob = (SELECT MIN(dob) FROM drivers) GROUP BY d.driverId, d.forename, d.surname;	formula_1
SELECT MAX(milliseconds) FROM pitStops;	formula_1
SELECT MIN(milliseconds) AS fastest_lap_time FROM lapTimes;	formula_1
SELECT MAX(p.duration)  FROM pitStops p  JOIN drivers d ON p.driverId = d.driverId  WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT lap FROM pitStops WHERE raceId IN (SELECT raceId FROM races WHERE year = 2011 AND name = 'Australian Grand Prix') AND driverId IN (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton');	formula_1
SELECT p.duration FROM pitStops p JOIN races r ON p.raceId = r.raceId WHERE r.name = 'Australian Grand Prix' AND r.year = 2011;	formula_1
SELECT MIN(time) AS lap_record FROM lapTimes JOIN drivers ON lapTimes.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN lapTimes l ON d.driverId = l.driverId ORDER BY CAST(SUBSTR(l.time, 1, INSTR(l.time, ':') - 1) AS INTEGER) * 60000 +          CAST(SUBSTR(l.time, INSTR(l.time, ':') + 1, INSTR(l.time, '.') - INSTR(l.time, ':') - 1) AS INTEGER) * 1000 +          CAST(SUBSTR(l.time, INSTR(l.time, '.') + 1) AS INTEGER) LIMIT 20;	formula_1
SELECT r.position FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' ORDER BY r.fastestLapTime ASC LIMIT 1;	formula_1
SELECT MIN(time)  FROM lapTimes  JOIN races ON lapTimes.raceId = races.raceId  WHERE races.name = 'Austrian Grand Prix';	formula_1
SELECT l.time, c.name AS circuit_name FROM lapTimes l JOIN races r ON l.raceId = r.raceId JOIN circuits c ON r.circuitId = c.circuitId WHERE c.country = 'Italy' ORDER BY l.milliseconds ASC LIMIT 1;	formula_1
SELECT r.name  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  JOIN lapTimes l ON r.raceId = l.raceId  WHERE c.name = 'Austrian Grand Prix'  ORDER BY l.milliseconds ASC  LIMIT 1;	formula_1
SELECT p.duration FROM pitStops p JOIN races r ON p.raceId = r.raceId JOIN lapTimes l ON p.raceId = l.raceId AND p.driverId = l.driverId WHERE r.name = 'Austrian Grand Prix' AND l.time = (     SELECT MIN(time)     FROM lapTimes lt     JOIN races ra ON lt.raceId = ra.raceId     WHERE ra.name = 'Austrian Grand Prix' );	formula_1
SELECT lat, lng FROM circuits JOIN races ON circuits.circuitId = races.circuitId JOIN results ON races.raceId = results.raceId WHERE results.fastestLapTime = '1:29.488';	formula_1
SELECT AVG(p.milliseconds)  FROM pitStops p JOIN drivers d ON p.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT AVG(lt.milliseconds) FROM lapTimes lt JOIN races r ON lt.raceId = r.raceId JOIN circuits c ON r.circuitId = c.circuitId WHERE c.country = 'Italy';	formula_1
SELECT player_api_id  FROM Player_Attributes  ORDER BY overall_rating DESC  LIMIT 1;	european_football_2
SELECT player_name, MAX(height) AS height FROM Player;	european_football_2
SELECT preferred_foot  FROM Player_Attributes  WHERE potential = (SELECT MIN(potential) FROM Player_Attributes)  LIMIT 1;	european_football_2
SELECT COUNT(*)  FROM Player_Attributes  WHERE overall_rating >= 60    AND overall_rating < 65    AND defensive_work_rate = 'low';	european_football_2
SELECT player_api_id FROM Player_Attributes ORDER BY crossing DESC LIMIT 5;	european_football_2
SELECT l.name FROM League l JOIN Match m ON l.id = m.league_id WHERE m.season = '2015/2016' GROUP BY l.name ORDER BY SUM(m.home_team_goal + m.away_team_goal) DESC LIMIT 1;	european_football_2
SELECT T.team_long_name FROM Team T JOIN Match M ON T.team_api_id = M.home_team_api_id WHERE M.season = '2015/2016'   AND (M.home_team_goal - M.away_team_goal) < 0 GROUP BY T.team_long_name ORDER BY COUNT(*) ASC LIMIT 1;	european_football_2
SELECT player_name FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id ORDER BY penalties DESC LIMIT 10;	european_football_2
SELECT T.team_long_name FROM Team AS T JOIN Match AS M ON T.team_api_id = M.away_team_api_id JOIN League AS L ON M.league_id = L.id WHERE L.name = 'Scotland Premier League'   AND M.season = '2009/2010'   AND M.away_team_goal > M.home_team_goal GROUP BY T.team_long_name ORDER BY COUNT(*) DESC LIMIT 1;	european_football_2
SELECT buildUpPlaySpeed FROM Team_Attributes ORDER BY buildUpPlaySpeed DESC LIMIT 4;	european_football_2
SELECT L.name FROM Match M JOIN League L ON M.league_id = L.id WHERE M.season = '2015/2016' GROUP BY L.name ORDER BY SUM(CASE WHEN M.home_team_goal = M.away_team_goal THEN 1 ELSE 0 END) DESC LIMIT 1;	european_football_2
SELECT DISTINCT p.player_name, (CAST(strftime('%Y', 'now') AS INTEGER) - CAST(strftime('%Y', p.birthday) AS INTEGER)) AS age FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.sprint_speed >= 97   AND pa.date BETWEEN '2013-01-01' AND '2015-12-31';	european_football_2
SELECT l.name, COUNT(m.id) AS match_count FROM Match m JOIN League l ON m.league_id = l.id GROUP BY l.name ORDER BY match_count DESC LIMIT 1;	european_football_2
SELECT AVG(height) FROM Player WHERE birthday >= '1990-01-01 00:00:00' AND birthday < '1996-01-01 00:00:00';	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE substr(date, 1, 4) = '2010'   AND overall_rating = (     SELECT MAX(overall_rating)     FROM Player_Attributes     WHERE substr(date, 1, 4) = '2010'       AND overall_rating > (         SELECT AVG(overall_rating)         FROM Player_Attributes         WHERE substr(date, 1, 4) = '2010'       )   );	european_football_2
SELECT team_fifa_api_id FROM Team_Attributes WHERE buildUpPlaySpeed > 50 AND buildUpPlaySpeed < 60;	european_football_2
SELECT DISTINCT T.team_long_name FROM Team T JOIN Team_Attributes TA ON T.team_api_id = TA.team_api_id WHERE strftime('%Y', TA.date) = '2012'   AND TA.buildUpPlayPassing > (     SELECT AVG(buildUpPlayPassing)     FROM Team_Attributes     WHERE buildUpPlayPassing IS NOT NULL       AND strftime('%Y', date) = '2012'   );	european_football_2
SELECT (SUM(CASE WHEN preferred_foot = 'left' THEN 1 ELSE 0 END) * 100.0 / COUNT(player_fifa_api_id)) AS percentage_left_foot FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE strftime('%Y', p.birthday) BETWEEN '1987' AND '1992';	european_football_2
SELECT      l.name,     SUM(m.home_team_goal + m.away_team_goal) AS total_goals FROM      Match m JOIN      League l ON m.league_id = l.id GROUP BY      l.name ORDER BY      total_goals ASC LIMIT 5;	european_football_2
SELECT AVG(pa.long_shots)  FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Ahmed Samir Farag';	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.height > 180 GROUP BY p.player_api_id, p.player_name ORDER BY AVG(pa.heading_accuracy) DESC LIMIT 10;	european_football_2
SELECT T.team_long_name FROM Team AS T JOIN Team_Attributes AS TA ON T.team_api_id = TA.team_api_id WHERE TA.buildUpPlayDribblingClass = 'Normal'   AND TA.date >= '2014-01-01 00:00:00'   AND TA.date <= '2014-12-31 23:59:59'   AND TA.chanceCreationPassing < (     SELECT AVG(chanceCreationPassing)     FROM Team_Attributes     WHERE buildUpPlayDribblingClass = 'Normal'       AND date >= '2014-01-01 00:00:00'       AND date <= '2014-12-31 23:59:59'   ) ORDER BY TA.chanceCreationPassing DESC;	european_football_2
SELECT L.name FROM Match M JOIN League L ON M.league_id = L.id WHERE M.season = '2009/2010' GROUP BY L.name HAVING AVG(M.home_team_goal) > AVG(M.away_team_goal);	european_football_2
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers';	european_football_2
SELECT player_name  FROM Player  WHERE substr(birthday, 1, 4) = '1970' AND substr(birthday, 6, 2) = '10';	european_football_2
SELECT pa.attacking_work_rate FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Franco Zennaro';	european_football_2
SELECT buildUpPlayPositioningClass  FROM Team_Attributes  JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id  WHERE Team.team_long_name = 'ADO Den Haag';	european_football_2
SELECT pa.heading_accuracy  FROM Player_Attributes pa  JOIN Player p ON pa.player_api_id = p.player_api_id  WHERE p.player_name = 'Francois Affolter'    AND pa.date = '2014-09-18 00:00:00';	european_football_2
SELECT overall_rating  FROM Player_Attributes  JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id  WHERE Player.player_name = 'Gabriel Tamas'  AND strftime('%Y', Player_Attributes.date) = '2011';	european_football_2
SELECT COUNT(*)  FROM Match m JOIN League l ON m.league_id = l.id WHERE m.season = '2015/2016' AND l.name = 'Scotland Premier League';	european_football_2
SELECT preferred_foot  FROM Player_Attributes  JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id  ORDER BY birthday DESC  LIMIT 1;	european_football_2
SELECT player_name FROM Player WHERE player_api_id IN (     SELECT player_api_id     FROM Player_Attributes     WHERE potential = (SELECT MAX(potential) FROM Player_Attributes) );	european_football_2
SELECT COUNT(*)  FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.weight < 130 AND pa.preferred_foot = 'left';	european_football_2
SELECT T.team_short_name FROM Team T JOIN Team_Attributes TA ON T.team_api_id = TA.team_api_id WHERE TA.chanceCreationPassingClass = 'Risky';	european_football_2
SELECT defensive_work_rate FROM Player_Attributes WHERE player_api_id IN (SELECT player_api_id FROM Player WHERE player_name = 'David Wilson');	european_football_2
SELECT p.birthday FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id ORDER BY pa.overall_rating DESC LIMIT 1;	european_football_2
SELECT League.name  FROM League  JOIN Country ON League.country_id = Country.id  WHERE Country.name = 'Netherlands';	european_football_2
SELECT AVG(m.home_team_goal) FROM Match m JOIN Country c ON m.country_id = c.id WHERE c.name = 'Poland' AND m.season = '2010/2011';	european_football_2
SELECT MAX(avg_finishing)  FROM (     SELECT AVG(pa.finishing) AS avg_finishing     FROM Player p     JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id     WHERE p.height = (SELECT MAX(height) FROM Player WHERE height IS NOT NULL)          UNION ALL          SELECT AVG(pa.finishing) AS avg_finishing     FROM Player p     JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id     WHERE p.height = (SELECT MIN(height) FROM Player WHERE height IS NOT NULL) ) AS finishing_rates;	european_football_2
SELECT player_name FROM Player WHERE height > 180;	european_football_2
SELECT COUNT(*) FROM Player WHERE strftime('%Y', birthday) > '1990';	european_football_2
SELECT COUNT(*)  FROM Player  WHERE player_name LIKE 'Adam %'    AND weight > 170;	european_football_2
SELECT DISTINCT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating > 80   AND strftime('%Y', pa.date) BETWEEN '2008' AND '2010';	european_football_2
SELECT potential FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Doran') LIMIT 1;	european_football_2
SELECT player_name FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE Player_Attributes.preferred_foot = 'left';	european_football_2
SELECT T.team_long_name FROM Team T JOIN Team_Attributes TA ON T.team_api_id = TA.team_api_id WHERE TA.buildUpPlaySpeedClass = 'Fast';	european_football_2
SELECT buildUpPlayPassingClass  FROM Team_Attributes  JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id  WHERE Team.team_short_name = 'CLB';	european_football_2
SELECT T1.team_short_name FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlayPassing > 70;	european_football_2
SELECT AVG(t2.overall_rating) FROM Player t1 JOIN Player_Attributes t2 ON t1.player_api_id = t2.player_api_id WHERE t1.height > 170   AND strftime('%Y', t2.date) >= '2010'   AND strftime('%Y', t2.date) <= '2015';	european_football_2
SELECT player_name FROM Player ORDER BY height ASC LIMIT 1;	european_football_2
SELECT c.name  FROM Country c  JOIN League l ON c.id = l.country_id  WHERE l.name = 'Italy Serie A';	european_football_2
SELECT T.team_short_name FROM Team T JOIN Team_Attributes TA ON T.team_api_id = TA.team_api_id WHERE TA.buildUpPlaySpeed = 31   AND TA.buildUpPlayDribbling = 53   AND TA.buildUpPlayPassing = 32;	european_football_2
SELECT AVG(overall_rating)  FROM Player_Attributes  JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id  WHERE Player.player_name = 'Aaron Doran';	european_football_2
SELECT COUNT(*)  FROM Match m JOIN League l ON m.league_id = l.id WHERE l.name = 'Germany 1. Bundesliga' AND strftime('%Y-%m', m.date) BETWEEN '2008-08' AND '2008-10';	european_football_2
SELECT T.team_short_name FROM Team T JOIN Match M ON T.team_api_id = M.home_team_api_id WHERE M.home_team_goal = 10;	european_football_2
SELECT player_name FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE potential = 61 AND balance = (     SELECT MAX(balance)     FROM Player_Attributes     WHERE potential = 61 );	european_football_2
SELECT      (SUM(CASE WHEN p.player_name = 'Abdou Diallo' THEN pa.ball_control ELSE 0 END) * 1.0 / COUNT(CASE WHEN p.player_name = 'Abdou Diallo' THEN pa.id ELSE NULL END))      -      (SUM(CASE WHEN p.player_name = 'Aaron Appindangoye' THEN pa.ball_control ELSE 0 END) * 1.0 / COUNT(CASE WHEN p.player_name = 'Aaron Appindangoye' THEN pa.id ELSE NULL END)) AS difference FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name IN ('Abdou Diallo', 'Aaron Appindangoye');	european_football_2
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN';	european_football_2
SELECT      CASE          WHEN p1.birthday < p2.birthday THEN p1.player_name         ELSE p2.player_name     END AS older_player FROM      Player p1, Player p2 WHERE      p1.player_name = 'Aaron Lennon'      AND p2.player_name = 'Abdelaziz Barrada';	european_football_2
SELECT player_name FROM Player ORDER BY height DESC LIMIT 1;	european_football_2
SELECT COUNT(*)  FROM Player_Attributes  WHERE preferred_foot = 'left' AND attacking_work_rate = 'low';	european_football_2
SELECT Country.name  FROM League  JOIN Country ON League.country_id = Country.id  WHERE League.name = 'Belgium Jupiler League';	european_football_2
SELECT l.name FROM League l JOIN Country c ON l.country_id = c.id WHERE c.name = 'Germany';	european_football_2
SELECT player_name FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id ORDER BY overall_rating DESC LIMIT 1;	european_football_2
SELECT COUNT(DISTINCT player_api_id)  FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE strftime('%Y', p.birthday) < '1986'    AND pa.defensive_work_rate = 'high';	european_football_2
SELECT player_name FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone') ORDER BY crossing DESC LIMIT 1;	european_football_2
SELECT pa.heading_accuracy FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Ariel Borysiuk';	european_football_2
SELECT COUNT(*)  FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.height > 180 AND pa.volleys > 70;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.volleys > 70 AND pa.dribbling > 70;	european_football_2
SELECT COUNT(*)  FROM Match m JOIN Country c ON m.country_id = c.id WHERE c.name = 'Belgium' AND m.season = '2008/2009';	european_football_2
SELECT pa.long_passing FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id ORDER BY p.birthday ASC LIMIT 1;	european_football_2
SELECT COUNT(*)  FROM Match  JOIN League ON Match.league_id = League.id  WHERE League.name = 'Belgium Jupiler League'  AND SUBSTR(Match.date, 1, 7) = '2009-04';	european_football_2
SELECT l.name FROM League l JOIN Match m ON l.id = m.league_id WHERE m.season = '2008/2009' GROUP BY l.name ORDER BY COUNT(m.id) DESC LIMIT 1;	european_football_2
SELECT AVG(overall_rating)  FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE strftime('%Y', p.birthday) < '1986';	european_football_2
SELECT ((SELECT MAX(overall_rating) FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Ariel Borysiuk') - (SELECT MAX(overall_rating) FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Paulin Puel')) * 100.0 / (SELECT MAX(overall_rating) FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Paulin Puel');	european_football_2
SELECT AVG(TA.buildUpPlaySpeed)  FROM Team_Attributes TA JOIN Team T ON TA.team_api_id = T.team_api_id WHERE T.team_long_name = 'Heart of Midlothian';	european_football_2
SELECT AVG(T1.overall_rating) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Pietro Marino';	european_football_2
SELECT SUM(T1.crossing)  FROM Player_Attributes AS T1  INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id  WHERE T2.player_name = 'Aaron Lennox';	european_football_2
SELECT MAX(chanceCreationPassing), chanceCreationPassingClass  FROM Team_Attributes  JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id  WHERE Team.team_long_name = 'Ajax'  GROUP BY chanceCreationPassingClass  ORDER BY MAX(chanceCreationPassing) DESC  LIMIT 1;	european_football_2
SELECT preferred_foot  FROM Player_Attributes  JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id  WHERE Player.player_name = 'Abdou Diallo';	european_football_2
SELECT MAX(T1.overall_rating)  FROM Player_Attributes AS T1  JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id  WHERE T2.player_name = 'Dorlan Pabon';	european_football_2
SELECT AVG(M.away_team_goal)  FROM Match M JOIN Team T ON M.away_team_api_id = T.team_api_id JOIN League L ON M.league_id = L.id JOIN Country C ON L.country_id = C.id WHERE T.team_long_name = 'Parma' AND C.name = 'Italy';	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating = 77   AND pa.date LIKE '2016-06-23%' ORDER BY p.birthday ASC LIMIT 1;	european_football_2
SELECT pa.overall_rating FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Aaron Mooy'   AND pa.date LIKE '2016-02-04%';	european_football_2
SELECT pa.potential  FROM Player_Attributes pa  JOIN Player p ON pa.player_api_id = p.player_api_id  WHERE p.player_name = 'Francesco Parravicini'    AND pa.date = '2010-08-30 00:00:00';	european_football_2
SELECT pa.attacking_work_rate FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Francesco Migliore'   AND pa.date LIKE '2015-05-01%';	european_football_2
SELECT pa.defensive_work_rate  FROM Player_Attributes pa  JOIN Player p ON pa.player_api_id = p.player_api_id  WHERE p.player_name = 'Kevin Berigaud'  AND pa.date = '2013-02-22 00:00:00';	european_football_2
SELECT date  FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Kevin Constant' ORDER BY pa.crossing DESC LIMIT 1;	european_football_2
SELECT buildUpPlaySpeedClass  FROM Team_Attributes  JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id  WHERE Team.team_long_name = 'Willem II' AND Team_Attributes.date = '2012-02-22';	european_football_2
SELECT buildUpPlayDribblingClass  FROM Team_Attributes  JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id  WHERE Team.team_short_name = 'LEI'  AND Team_Attributes.date = '2015-09-10 00:00:00';	european_football_2
SELECT ta.buildUpPlayPassingClass FROM Team_Attributes ta JOIN Team t ON ta.team_api_id = t.team_api_id WHERE t.team_long_name = 'FC Lorient'   AND ta.date LIKE '2010-02-22%';	european_football_2
SELECT chanceCreationPassingClass  FROM Team_Attributes  JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id  WHERE Team.team_long_name = 'PEC Zwolle'  AND Team_Attributes.date = '2013-09-20 00:00:00';	european_football_2
SELECT ta.chanceCreationCrossingClass FROM Team_Attributes ta JOIN Team t ON ta.team_api_id = t.team_api_id WHERE t.team_long_name = 'Hull City'   AND ta.date = '2010-02-22 00:00:00';	european_football_2
SELECT ta.defenceAggressionClass FROM Team_Attributes ta JOIN Team t ON ta.team_api_id = t.team_api_id WHERE t.team_long_name = 'Hannover 96'   AND ta.date LIKE '2015-09-10%';	european_football_2
SELECT AVG(overall_rating)  FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Marko Arnautovic'   AND SUBSTR(pa.date, 1, 10) BETWEEN '2007-02-22' AND '2016-04-21';	european_football_2
SELECT      ((ld.overall_rating - jb.overall_rating) * 100.0 / ld.overall_rating) AS percentage FROM      Player_Attributes ld, Player_Attributes jb, Player p1, Player p2 WHERE      p1.player_name = 'Landon Donovan'      AND p2.player_name = 'Jordan Bowery'     AND ld.player_api_id = p1.player_api_id      AND jb.player_api_id = p2.player_api_id     AND ld.date = '2013/7/12'      AND jb.date = '2013/7/12';	european_football_2
SELECT player_name  FROM Player  ORDER BY height DESC  LIMIT 1;	european_football_2
SELECT player_api_id  FROM Player  ORDER BY weight DESC  LIMIT 10;	european_football_2
SELECT player_name  FROM Player  WHERE (julianday('now') - julianday(birthday)) / 365.25 >= 35;	european_football_2
SELECT SUM(m.home_team_goal)  FROM Match m  JOIN Player p ON m.home_player_1 = p.player_api_id OR m.home_player_2 = p.player_api_id OR m.home_player_3 = p.player_api_id OR m.home_player_4 = p.player_api_id OR m.home_player_5 = p.player_api_id OR m.home_player_6 = p.player_api_id OR m.home_player_7 = p.player_api_id OR m.home_player_8 = p.player_api_id OR m.home_player_9 = p.player_api_id OR m.home_player_10 = p.player_api_id OR m.home_player_11 = p.player_api_id  WHERE p.player_name = 'Aaron Lennon';	european_football_2
SELECT SUM(m.away_team_goal)  FROM Match m JOIN Player p1 ON m.away_player_1 = p1.player_api_id OR m.away_player_2 = p1.player_api_id OR m.away_player_3 = p1.player_api_id OR m.away_player_4 = p1.player_api_id OR m.away_player_5 = p1.player_api_id OR m.away_player_6 = p1.player_api_id OR m.away_player_7 = p1.player_api_id OR m.away_player_8 = p1.player_api_id OR m.away_player_9 = p1.player_api_id OR m.away_player_10 = p1.player_api_id OR m.away_player_11 = p1.player_api_id JOIN Player p2 ON m.away_player_1 = p2.player_api_id OR m.away_player_2 = p2.player_api_id OR m.away_player_3 = p2.player_api_id OR m.away_player_4 = p2.player_api_id OR m.away_player_5 = p2.player_api_id OR m.away_player_6 = p2.player_api_id OR m.away_player_7 = p2.player_api_id OR m.away_player_8 = p2.player_api_id OR m.away_player_9 = p2.player_api_id OR m.away_player_10 = p2.player_api_id OR m.away_player_11 = p2.player_api_id WHERE (p1.player_name = 'Daan Smith' AND p2.player_name = 'Filipe Ferreira') OR (p1.player_name = 'Filipe Ferreira' AND p2.player_name = 'Daan Smith');	european_football_2
SELECT SUM(m.home_team_goal)  FROM Match m JOIN Player p ON m.home_player_1 = p.player_api_id OR m.home_player_2 = p.player_api_id OR m.home_player_3 = p.player_api_id OR m.home_player_4 = p.player_api_id OR m.home_player_5 = p.player_api_id OR m.home_player_6 = p.player_api_id OR m.home_player_7 = p.player_api_id OR m.home_player_8 = p.player_api_id OR m.home_player_9 = p.player_api_id OR m.home_player_10 = p.player_api_id OR m.home_player_11 = p.player_api_id WHERE (CAST((julianday('now') - julianday(p.birthday)) / 365.25 AS INTEGER)) <= 30	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id ORDER BY pa.overall_rating DESC LIMIT 1;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.potential = (SELECT MAX(potential) FROM Player_Attributes);	european_football_2
SELECT DISTINCT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.attacking_work_rate = 'high';	european_football_2
SELECT player_name  FROM Player  JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id  WHERE finishing = 1  ORDER BY datetime('now') - datetime(birthday) DESC  LIMIT 1;	european_football_2
SELECT p.player_name FROM Player p JOIN Match m ON p.player_api_id = m.home_player_1 OR p.player_api_id = m.away_player_1                 OR p.player_api_id = m.home_player_2 OR p.player_api_id = m.away_player_2                 OR p.player_api_id = m.home_player_3 OR p.player_api_id = m.away_player_3                 OR p.player_api_id = m.home_player_4 OR p.player_api_id = m.away_player_4                 OR p.player_api_id = m.home_player_5 OR p.player_api_id = m.away_player_5                 OR p.player_api_id = m.home_player_6 OR p.player_api_id = m.away_player_6                 OR p.player_api_id = m.home_player_7 OR p.player_api_id = m.away_player_7                 OR p.player_api_id = m.home_player_8 OR p.player_api_id = m.away_player_8                 OR p.player_api_id = m.home_player_9 OR p.player_api_id = m.away_player_9                 OR p.player_api_id = m.home_player_10 OR p.player_api_id = m.away_player_10                 OR p.player_api_id = m.home_player_11 OR p.player_api_id = m.away_player_11 JOIN Country c ON m.country_id = c.id WHERE c.name = 'Belgium';	european_football_2
SELECT DISTINCT c.name FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id JOIN Match m ON (m.home_player_1 = p.player_api_id OR m.home_player_2 = p.player_api_id OR m.home_player_3 = p.player_api_id OR m.home_player_4 = p.player_api_id OR m.home_player_5 = p.player_api_id OR m.home_player_6 = p.player_api_id OR m.home_player_7 = p.player_api_id OR m.home_player_8 = p.player_api_id OR m.home_player_9 = p.player_api_id OR m.home_player_10 = p.player_api_id OR m.home_player_11 = p.player_api_id OR m.away_player_1 = p.player_api_id OR m.away_player_2 = p.player_api_id OR m.away_player_3 = p.player_api_id OR m.away_player_4 = p.player_api_id OR m.away_player_5 = p.player_api_id OR m.away_player_6 = p.player_api_id OR m.away_player_7 = p.player_api_id OR m.away_player_8 = p.player_api_id OR m.away_player_9 = p.player_api_id OR m.away_player_10 = p.player_api_id OR m.away_player_11 = p.player_api_id) JOIN Country c ON m.country_id = c.id WHERE pa.vision > 89;	european_football_2
SELECT c.name FROM Country c JOIN League l ON c.id = l.country_id JOIN Match m ON l.id = m.league_id JOIN Player p ON p.player_api_id IN (     m.home_player_1, m.home_player_2, m.home_player_3, m.home_player_4, m.home_player_5,     m.home_player_6, m.home_player_7, m.home_player_8, m.home_player_9, m.home_player_10, m.home_player_11,     m.away_player_1, m.away_player_2, m.away_player_3, m.away_player_4, m.away_player_5,     m.away_player_6, m.away_player_7, m.away_player_8, m.away_player_9, m.away_player_10, m.away_player_11 ) GROUP BY c.id, c.name ORDER BY AVG(p.weight) DESC LIMIT 1;	european_football_2
SELECT T.team_long_name FROM Team T JOIN Team_Attributes TA ON T.team_api_id = TA.team_api_id WHERE TA.buildUpPlaySpeedClass = 'Slow';	european_football_2
SELECT T.team_short_name FROM Team AS T JOIN Team_Attributes AS TA ON T.team_api_id = TA.team_api_id WHERE TA.chanceCreationPassingClass = 'Safe';	european_football_2
SELECT AVG(P.height)  FROM Player P JOIN Match M ON P.player_api_id = M.home_player_1 OR P.player_api_id = M.away_player_1 JOIN Country C ON M.country_id = C.id WHERE C.name = 'Italy';	european_football_2
SELECT player_name  FROM Player  WHERE height > 180  ORDER BY player_name  LIMIT 3;	european_football_2
SELECT COUNT(*)  FROM Player  WHERE player_name LIKE 'Aaron%'    AND birthday > '1990-12-31 23:59:59';	european_football_2
SELECT      (SELECT jumping FROM Player_Attributes WHERE player_api_id = 6) -      (SELECT jumping FROM Player_Attributes WHERE player_api_id = 23) AS jumping_difference;	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE preferred_foot = 'right' ORDER BY potential ASC LIMIT 5;	european_football_2
SELECT COUNT(*)  FROM Player_Attributes  WHERE crossing = (SELECT MAX(crossing) FROM Player_Attributes)    AND preferred_foot = 'left';	european_football_2
SELECT      (COUNT(CASE WHEN strength > 80 AND stamina > 80 THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM Player_Attributes;	european_football_2
SELECT c.name  FROM Country c JOIN League l ON c.id = l.country_id WHERE l.name = 'Poland Ekstraklasa';	european_football_2
SELECT home_team_goal, away_team_goal  FROM Match  JOIN League ON Match.league_id = League.id  WHERE Match.date LIKE '2008-09-24%'  AND League.name = 'Belgium Jupiler League';	european_football_2
SELECT pa.sprint_speed, pa.agility, pa.acceleration  FROM Player_Attributes pa  JOIN Player p ON pa.player_api_id = p.player_api_id  WHERE p.player_name = 'Alexis Blin';	european_football_2
SELECT buildUpPlaySpeedClass  FROM Team_Attributes  WHERE team_api_id = (SELECT team_api_id FROM Team WHERE team_long_name = 'KSV Cercle Brugge')  LIMIT 1;	european_football_2
SELECT COUNT(*)  FROM Match m JOIN League l ON m.league_id = l.id WHERE l.name = 'Italy Serie A' AND m.season = '2015/2016';	european_football_2
SELECT MAX(M.home_team_goal) FROM Match M JOIN League L ON M.league_id = L.id WHERE L.name = 'Netherlands Eredivisie';	european_football_2
SELECT pa.finishing, pa.curve FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.weight = (SELECT MAX(weight) FROM Player);	european_football_2
SELECT l.name FROM Match m JOIN League l ON m.league_id = l.id WHERE m.season = '2015/2016' GROUP BY l.name ORDER BY COUNT(m.id) DESC LIMIT 4;	european_football_2
SELECT T.team_long_name FROM Team AS T JOIN Match AS M ON T.team_api_id = M.away_team_api_id ORDER BY M.away_team_goal DESC LIMIT 1;	european_football_2
SELECT player_name  FROM Player  JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id  ORDER BY overall_rating DESC  LIMIT 1;	european_football_2
SELECT (COUNT(CASE WHEN P.height < 180 AND PA.overall_rating > 70 THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM Player P JOIN Player_Attributes PA ON P.player_api_id = PA.player_api_id;	european_football_2
SELECT      CASE          WHEN COUNT(CASE WHEN Admission = '+' AND SEX = 'M' THEN 1 END) > COUNT(CASE WHEN Admission = '-' AND SEX = 'M' THEN 1 END) THEN 'in-patient'         ELSE 'outpatient'     END AS more_common,     (CAST(COUNT(CASE WHEN Admission = '+' AND SEX = 'M' THEN 1 END) AS FLOAT) - CAST(COUNT(CASE WHEN Admission = '-' AND SEX = 'M' THEN 1 END) AS FLOAT)) * 100.0 / NULLIF(COUNT(CASE WHEN Admission = '-' AND SEX = 'M' THEN 1 END), 0) AS percentage_deviation FROM Patient;	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN strftime('%Y', Birthday) > '1930' AND SEX = 'F' THEN 1 END) AS FLOAT) * 100 / COUNT(CASE WHEN SEX = 'F' THEN 1 END) FROM Patient;	thrombosis_prediction
SELECT      (COUNT(CASE WHEN Admission = '+' THEN 1 END) * 100.0 / COUNT(*)) AS percentage_inpatient FROM Patient WHERE strftime('%Y', Birthday) BETWEEN '1930' AND '1940';	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN Admission = '+' THEN 1 END) AS REAL) / COUNT(CASE WHEN Admission = '-' THEN 1 END) AS ratio FROM Patient WHERE Diagnosis = 'SLE';	thrombosis_prediction
SELECT p.Diagnosis, l.Date FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.ID = 30609;	thrombosis_prediction
SELECT p.SEX, p.Birthday, e.`Examination Date`, e.Symptoms FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.ID = '163109';	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.LDH > 500;	thrombosis_prediction
SELECT ID, CAST(strftime('%Y', 'now') - strftime('%Y', Birthday) AS INTEGER) AS age FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE RVVT = '+';	thrombosis_prediction
SELECT p.ID, p.SEX, p.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Thrombosis = 2;	thrombosis_prediction
SELECT p.* FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE strftime('%Y', p.Birthday) = '1937' AND l.`T-CHO` >= 250;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.ALB < 3.5;	thrombosis_prediction
SELECT (COUNT(CASE WHEN P.SEX = 'F' AND (L.TP < 6.0 OR L.TP > 8.5) THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM Patient P JOIN Laboratory L ON P.ID = L.ID;	thrombosis_prediction
SELECT AVG(`aCL IgG`)  FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  WHERE Patient.Admission = '+'    AND (strftime('%Y', 'now') - strftime('%Y', Patient.Birthday)) >= 50;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  WHERE SEX = 'F'    AND strftime('%Y', Description) = '1997'    AND Admission = '-';	thrombosis_prediction
SELECT MIN(YEAR(`First Date`) - YEAR(Birthday)) AS youngest_age FROM Patient WHERE `First Date` IS NOT NULL AND Birthday IS NOT NULL;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.Thrombosis = 1    AND p.SEX = 'F'    AND strftime('%Y', e.`Examination Date`) = '1997';	thrombosis_prediction
SELECT MAX(STRFTIME('%Y', Birthday)) - MIN(STRFTIME('%Y', Birthday)) AS age_gap FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE TG >= 200)	thrombosis_prediction
SELECT e.Symptoms, e.Diagnosis FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.Birthday = (SELECT MAX(Birthday) FROM Patient WHERE ID IN (SELECT ID FROM Examination))   AND e.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT CASE WHEN p.SEX = 'M' THEN l.ID END) / 12.0 FROM Laboratory l JOIN Patient p ON l.ID = p.ID WHERE l.Date BETWEEN '1998-01-01' AND '1998-12-31';	thrombosis_prediction
SELECT L.Date, (strftime('%Y', P.`First Date`) - strftime('%Y', P.Birthday)) AS age FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Diagnosis = 'SJS' ORDER BY P.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN p.SEX = 'M' AND l.UA <= 8.0 THEN 1 ELSE 0 END) AS FLOAT) /         SUM(CASE WHEN p.SEX = 'F' AND l.UA <= 6.5 THEN 1 ELSE 0 END) AS male_to_female_ratio FROM Patient p JOIN Laboratory l ON p.ID = l.ID;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  LEFT JOIN Examination e ON p.ID = e.ID  WHERE e.ID IS NULL OR (e.`Examination Date` IS NOT NULL AND (strftime('%Y', e.`Examination Date`) - strftime('%Y', p.`First Date`)) >= 1);	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE strftime('%Y', p.Birthday) > strftime('%Y', '1993-12-31', '-18 years')   AND strftime('%Y', e.`Examination Date`) BETWEEN '1990' AND '1993';	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.`T-BIL` >= 2.0;	thrombosis_prediction
SELECT Diagnosis FROM Examination WHERE `Examination Date` BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY Diagnosis ORDER BY COUNT(Diagnosis) DESC LIMIT 1;	thrombosis_prediction
SELECT AVG(1999 - CAST(strftime('%Y', p.Birthday) AS INTEGER))  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.Date BETWEEN '1991-10-01' AND '1991-10-31';	thrombosis_prediction
SELECT SUBTRACT(year(e.`Examination Date`), year(p.Birthday)) AS age, e.Diagnosis FROM Examination e JOIN Patient p ON e.ID = p.ID JOIN Laboratory l ON e.ID = l.ID AND e.`Examination Date` = l.Date WHERE l.HGB = (SELECT MAX(HGB) FROM Laboratory);	thrombosis_prediction
SELECT `ANA` FROM `Examination` WHERE `ID` = 3605340 AND `Examination Date` = '1996-12-02';	thrombosis_prediction
SELECT CASE WHEN T-CHO < 250 THEN 'Yes' ELSE 'No' END AS Cholesterol_Status FROM Laboratory WHERE ID = 2927464 AND Date = '1995-09-04';	thrombosis_prediction
SELECT SEX FROM Patient WHERE Diagnosis = 'AORTITIS' ORDER BY `First Date` ASC LIMIT 1;	thrombosis_prediction
SELECT `aCL IgM`  FROM Examination  WHERE ID IN (     SELECT ID      FROM Patient      WHERE Diagnosis = 'SLE' AND `Description` = '1994-02-19' )  AND `Examination Date` = '1993-11-12';	thrombosis_prediction
SELECT p.SEX FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GPT = 9 AND l.Date = '1992-06-12';	thrombosis_prediction
SELECT YEAR('1991-10-21') - YEAR(p.Birthday)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.UA = 8.4 AND l.Date = '1991-10-21';	thrombosis_prediction
SELECT COUNT(*)  FROM Laboratory  WHERE ID IN (     SELECT ID      FROM Patient      WHERE `First Date` = '1991-06-13' AND Diagnosis = 'SJS' )  AND strftime('%Y', Date) = '1995';	thrombosis_prediction
SELECT p.Diagnosis  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.Diagnosis = 'SLE' AND e.`Examination Date` = '1997-01-27';	thrombosis_prediction
SELECT e.Symptoms FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.Birthday = '1959-03-01' AND e.`Examination Date` = '1993-09-27';	thrombosis_prediction
SELECT (SUM(CASE WHEN p.Birthday = '1959-02-18' AND l.Date LIKE '1981-11-%' THEN l.`T-CHO` ELSE 0 END) - SUM(CASE WHEN p.Birthday = '1959-02-18' AND l.Date LIKE '1981-12-%' THEN l.`T-CHO` ELSE 0 END)) AS decrease_rate FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday = '1959-02-18' AND l.Date BETWEEN '1981-11-01' AND '1981-12-31';	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Diagnosis = 'Behcet'   AND e.`Examination Date` >= '1997-01-01'   AND e.`Examination Date` <= '1997-12-31';	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE e.`Examination Date` BETWEEN '1987-07-06' AND '1996-01-31'   AND l.GPT > 30   AND l.ALB < 4;	thrombosis_prediction
SELECT ID  FROM Patient  WHERE SEX = 'F'    AND strftime('%Y', Birthday) = '1964'    AND Admission = '+';	thrombosis_prediction
SELECT COUNT(*)  FROM Examination  WHERE Thrombosis = 2    AND `ANA Pattern` = 'S'    AND `aCL IgM` > (SELECT AVG(`aCL IgM`) * 1.2 FROM Examination);	thrombosis_prediction
SELECT (COUNT(CASE WHEN L.UA <= 6.5 THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM Laboratory L WHERE L.`U-PRO` > 0 AND L.`U-PRO` < 30;	thrombosis_prediction
SELECT (SUM(CASE WHEN Diagnosis = 'BEHCET' THEN 1 ELSE 0 END) * 100.0 / COUNT(*))  FROM Patient  WHERE SEX = 'M' AND strftime('%Y', `First Date`) = '1981';	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '-'   AND l.Date LIKE '1991-10%'   AND l.T-BIL < 2.0;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  WHERE SEX = 'F'    AND Birthday BETWEEN '1980-01-01' AND '1989-12-31'   AND ID NOT IN (     SELECT ID      FROM Examination      WHERE "ANA Pattern" = 'P'   );	thrombosis_prediction
SELECT p.SEX FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE e.Diagnosis = 'PSS'   AND l.CRP > '2+'   AND l.CRE = 1   AND l.LDH = 123;	thrombosis_prediction
SELECT AVG(L.ALB) FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE P.SEX = 'F' AND L.PLT > 400 AND P.Diagnosis = 'SLE';	thrombosis_prediction
SELECT Symptoms FROM Examination WHERE Diagnosis = 'SLE' GROUP BY Symptoms ORDER BY COUNT(*) DESC LIMIT 1;	thrombosis_prediction
SELECT `Description`, `Diagnosis` FROM `Patient` WHERE `ID` = 48473;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  WHERE Patient.SEX = 'F' AND Examination.Diagnosis = 'APS';	thrombosis_prediction
SELECT COUNT(DISTINCT L.ID)  FROM Laboratory L  WHERE YEAR(L.Date) = 1997 AND (L.TP <= 6 OR L.TP >= 8.5);	thrombosis_prediction
SELECT      CAST(SUM(CASE WHEN E.Diagnosis LIKE '%SLE%' AND P.Symptoms LIKE '%thrombocytopenia%' THEN 1 ELSE 0 END) AS FLOAT) * 100 /      SUM(CASE WHEN E.Diagnosis LIKE '%SLE%' THEN 1 ELSE 0 END) AS proportion FROM Examination E JOIN Patient P ON E.ID = P.ID;	thrombosis_prediction
SELECT (SUM(CASE WHEN P.SEX = 'F' THEN 1 ELSE 0 END) * 100.0 / COUNT(P.SEX))  FROM Patient P  WHERE YEAR(P.Birthday) = 1980 AND P.Diagnosis = 'RA';	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'M'    AND e.`Examination Date` BETWEEN '1995-01-01' AND '1997-12-31'   AND e.Diagnosis = 'Behcet'   AND p.Admission = '-';	thrombosis_prediction
SELECT COUNT(*)  FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE P.SEX = 'F' AND L.WBC < 3.5;	thrombosis_prediction
SELECT DATEDIFF(`Examination Date`, `First Date`)  FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  WHERE Patient.ID = 821298;	thrombosis_prediction
SELECT CASE WHEN (L.UA > 8.0 AND P.SEX = 'M') OR (L.UA > 6.5 AND P.SEX = 'F') THEN 'Yes' ELSE 'No' END AS UricAcidInRange FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE L.ID = 57266;	thrombosis_prediction
SELECT Date FROM Laboratory WHERE ID = 48473 AND GOT >= 60;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GOT < 60 AND strftime('%Y', l.Date) = '1994';	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.GPT >= 60;	thrombosis_prediction
SELECT p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GPT > 60 ORDER BY p.Birthday ASC;	thrombosis_prediction
SELECT AVG(LDH) FROM Laboratory WHERE LDH < 500;	thrombosis_prediction
SELECT ID, (strftime('%Y', 'now') - strftime('%Y', Birthday)) AS age FROM Patient WHERE ID IN (     SELECT ID     FROM Laboratory     WHERE LDH BETWEEN 600 AND 800 );	thrombosis_prediction
SELECT DISTINCT Admission  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.ALP < 300;	thrombosis_prediction
SELECT ID FROM Patient WHERE Birthday = '1982-04-01'; SELECT ALP < 300 AS is_ALP_normal FROM Laboratory WHERE ID = (SELECT ID FROM Patient WHERE Birthday = '1982-04-01');	thrombosis_prediction
SELECT DISTINCT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TP < 6.0;	thrombosis_prediction
SELECT TP - 8.5 AS deviation FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE Patient.SEX = 'F' AND Laboratory.TP > 8.5;	thrombosis_prediction
SELECT p.ID, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND (l.ALB <= 3.5 OR l.ALB >= 5.5) ORDER BY p.Birthday DESC;	thrombosis_prediction
SELECT      p.ID,     CASE          WHEN l.ALB BETWEEN 3.5 AND 5.5 THEN 'Within Normal Range'         ELSE 'Outside Normal Range'     END AS Albumin_Status FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      strftime('%Y', p.Birthday) = '1982';	thrombosis_prediction
SELECT      (COUNT(CASE WHEN L.UA > 6.5 AND P.SEX = 'F' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM      Laboratory L JOIN      Patient P ON L.ID = P.ID WHERE      P.SEX = 'F';	thrombosis_prediction
SELECT AVG(L.UA)  FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE L.UA < CASE WHEN P.SEX = 'M' THEN 8.0 ELSE 6.5 END AND L.Date = (     SELECT MAX(L2.Date)     FROM Laboratory L2     WHERE L2.ID = L.ID );	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.UN = 29;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Diagnosis = 'RA' AND Laboratory.UN < 30;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.CRE >= 1.5;	thrombosis_prediction
SELECT SUM(CASE WHEN P.SEX = 'M' AND L.CRE >= 1.5 THEN 1 ELSE 0 END) > SUM(CASE WHEN P.SEX = 'F' AND L.CRE >= 1.5 THEN 1 ELSE 0 END) AS result FROM Patient P JOIN Laboratory L ON P.ID = L.ID;	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday, L.`T-BIL` FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.`T-BIL` = (SELECT MAX(`T-BIL`) FROM Laboratory);	thrombosis_prediction
SELECT SEX, GROUP_CONCAT(DISTINCT Patient.ID)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.`T-BIL` >= 2.0  GROUP BY SEX;	thrombosis_prediction
SELECT L.ID, MAX(L.`T-CHO`) AS `T-CHO` FROM `Laboratory` L JOIN `Patient` P ON L.ID = P.ID WHERE P.Birthday = (SELECT MIN(Birthday) FROM Patient) GROUP BY L.ID ORDER BY `T-CHO` DESC LIMIT 1;	thrombosis_prediction
SELECT AVG(YEAR(CURDATE()) - YEAR(p.Birthday))  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.SEX = 'M' AND l.`T-CHO` >= 250;	thrombosis_prediction
SELECT DISTINCT p.ID, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TG > 300;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TG >= 200    AND (CAST(strftime('%Y', 'now') AS INTEGER) - CAST(strftime('%Y', p.Birthday) AS INTEGER)) > 50;	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '-' AND l.CPK < 250;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE strftime('%Y', P.Birthday) BETWEEN '1936' AND '1956'   AND P.SEX = 'M'   AND L.CPK >= 250;	thrombosis_prediction
SELECT p.ID, p.SEX, (strftime('%Y', 'now') - strftime('%Y', p.Birthday)) AS age FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GLU >= 180 AND l.`T-CHO` < 250;	thrombosis_prediction
SELECT L.ID, L.GLU FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE L.GLU < 180 AND strftime('%Y', P.Description) = '1991';	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.WBC <= 3.5 OR l.WBC >= 9.0 GROUP BY p.SEX ORDER BY (strftime('%Y', 'now') - strftime('%Y', p.Birthday)) ASC;	thrombosis_prediction
SELECT      p.ID,     (strftime('%Y', 'now') - strftime('%Y', p.Birthday)) AS age,     p.Diagnosis FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      l.RBC < 3.5;	thrombosis_prediction
SELECT p.ID, p.Admission FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'F'   AND (strftime('%Y', 'now') - strftime('%Y', p.Birthday)) >= 50   AND (l.RBC <= 3.5 OR l.RBC >= 6.0);	thrombosis_prediction
SELECT DISTINCT p.ID, p.SEX FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '-'   AND l.HGB < 10;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Diagnosis = 'SLE' AND Laboratory.HGB > 10 AND Laboratory.HGB < 17 ORDER BY Patient.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT p.ID, (strftime('%Y', 'now') - strftime('%Y', p.Birthday)) AS age FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.HCT >= 52 GROUP BY p.ID HAVING COUNT(p.ID) >= 2;	thrombosis_prediction
SELECT AVG(HCT) FROM Laboratory WHERE Date LIKE '1991%' AND HCT < 29;	thrombosis_prediction
SELECT SUM(CASE WHEN PLT < 100 THEN 1 ELSE 0 END) AS lower_than_normal, SUM(CASE WHEN PLT > 400 THEN 1 ELSE 0 END) AS higher_than_normal FROM Laboratory WHERE PLT <= 100 OR PLT >= 400;	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE YEAR(l.Date) = 1984   AND (YEAR(CURRENT_TIMESTAMP) - YEAR(p.Birthday)) < 50   AND l.PLT BETWEEN 100 AND 400;	thrombosis_prediction
SELECT      CAST(SUM(CASE WHEN L.PT >= 14 AND P.SEX = 'F' THEN 1 ELSE 0 END) AS FLOAT) * 100 / SUM(CASE WHEN L.PT >= 14 THEN 1 ELSE 0 END) AS percentage FROM      Patient P JOIN      Laboratory L ON P.ID = L.ID WHERE      (strftime('%Y', 'now') - strftime('%Y', P.Birthday)) > 55;	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE strftime('%Y', p.`First Date`) > '1992'   AND l.PT < 14;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination  WHERE `Examination Date` > '1997-01-01'  AND APTT < 45;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.APTT > 45 AND e.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M'   AND l.WBC > 3.5   AND l.WBC < 9.0   AND (l.FG <= 150 OR l.FG >= 450);	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday > '1980-01-01' AND (l.FG < 150 OR l.FG > 450);	thrombosis_prediction
SELECT DISTINCT p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.`U-PRO` >= 30;	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.`U-PRO` IS NOT NULL AND CAST(l.`U-PRO` AS INTEGER) > 0 AND CAST(l.`U-PRO` AS INTEGER) < 30 AND p.Diagnosis = 'SLE';	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE IGG >= 2000;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.IGG > 900 AND l.IGG < 2000 AND e.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.IGA BETWEEN 80 AND 500 ORDER BY l.IGA DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.IGA > 80 AND l.IGA < 500 AND YEAR(p.`First Date`) >= 1990;	thrombosis_prediction
SELECT Diagnosis  FROM Laboratory L  JOIN Patient P ON L.ID = P.ID  WHERE L.IGM <= 40 OR L.IGM >= 400  GROUP BY Diagnosis  ORDER BY COUNT(Diagnosis) DESC  LIMIT 1;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.CRP = '+' AND p.Description IS NULL;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.CRE >= 1.5    AND (YEAR(CURDATE()) - YEAR(P.Birthday)) < 70;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE l.RA IN ('-', '+-') AND e.KCT = '+';	thrombosis_prediction
SELECT p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday > '1985-01-01'   AND l.RA IN ('-', '+-');	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.RF < 20   AND (YEAR(CURDATE()) - YEAR(p.Birthday)) > 60;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.RF < 20 AND e.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.C3 > 35 AND e.`ANA Pattern` = 'P';	thrombosis_prediction
SELECT ID FROM Examination JOIN Laboratory ON Examination.ID = Laboratory.ID WHERE Laboratory.HCT <= 29 OR Laboratory.HCT >= 52 ORDER BY Examination.`aCL IgA` DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  JOIN Laboratory l ON p.ID = l.ID  WHERE e.Thrombosis = 1    AND l.C4 > 10;	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID)  FROM Patient AS T1  INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID  WHERE T2.RNP IN ('-', '+-') AND T1.Admission = '+';	thrombosis_prediction
SELECT MAX(p.Birthday)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.RNP NOT IN ('-', '+-');	thrombosis_prediction
SELECT COUNT(*)  FROM Examination  WHERE SM IN ('-', '+-') AND Thrombosis = 0;	thrombosis_prediction
SELECT ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE SM NOT IN ('negative', '0') ORDER BY Birthday DESC LIMIT 3;	thrombosis_prediction
SELECT DISTINCT e.ID FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE e.`Examination Date` > '1997-01-01'   AND l.SC170 IN ('negative', '0');	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID)  FROM Patient P JOIN Laboratory L ON P.ID = L.ID JOIN Examination E ON P.ID = E.ID WHERE L.SC170 IN ('negative', '0')   AND P.SEX = 'F'   AND E.Symptoms IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.SSA IN ('-', '+-')    AND YEAR(P.`First Date`) < 2000;	thrombosis_prediction
SELECT ID  FROM Laboratory  JOIN Patient ON Laboratory.ID = Patient.ID  WHERE SSA NOT IN ('negative', '0')  ORDER BY `First Date`  LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.SSB IN ('-', '+-')   AND e.Diagnosis = 'SLE';	thrombosis_prediction
SELECT COUNT(DISTINCT L.ID)  FROM Laboratory L  JOIN Examination E ON L.ID = E.ID  WHERE L.SSB IN ('negative', '0')    AND E.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID)  FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.CENTROMEA IN ('-', '+-')    AND L.SSB IN ('-', '+-')    AND P.SEX = 'M';	thrombosis_prediction
SELECT DISTINCT p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.DNA >= 8;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.DNA < '8' AND p.Description IS NULL;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.IGG > 900 AND L.IGG < 2000 AND P.Admission = '+';	thrombosis_prediction
SELECT (COUNT(CASE WHEN L.GOT >= 60 AND P.Diagnosis = 'SLE' THEN 1 END) * 1.0 / COUNT(CASE WHEN L.GOT >= 60 THEN 1 END)) * 100 FROM Laboratory L JOIN Patient P ON L.ID = P.ID;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.GOT < 60;	thrombosis_prediction
SELECT MIN(Birthday) FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE GOT >= 60);	thrombosis_prediction
SELECT p.Birthday  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.GPT < 60  ORDER BY l.GPT DESC  LIMIT 3;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GOT < 60 AND p.SEX = 'M';	thrombosis_prediction
SELECT MIN(p.`First Date`)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.LDH < 500  ORDER BY l.LDH DESC  LIMIT 1;	thrombosis_prediction
SELECT MAX(L.`Date`)  FROM `Laboratory` L  JOIN `Patient` P ON L.`ID` = P.`ID`  WHERE L.`LDH` >= 500 AND P.`First Date` = (SELECT MAX(`First Date`) FROM `Patient` WHERE `First Date` IS NOT NULL)	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.ALP >= 300 AND p.Admission = '+';	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '-' AND l.ALP < 300;	thrombosis_prediction
SELECT DISTINCT p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TP < 6.0;	thrombosis_prediction
SELECT COUNT(*)  FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE P.Diagnosis = 'SJS' AND L.TP > 6.0 AND L.TP < 8.5;	thrombosis_prediction
SELECT e.`Examination Date` FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.ALB > 3.5 AND l.ALB < 5.5 ORDER BY l.ALB DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.ALB > 3.5 AND l.ALB < 5.5 AND l.TP BETWEEN 6.0 AND 8.5;	thrombosis_prediction
SELECT `aCL IgG`, `aCL IgM`, `aCL IgA` FROM Examination JOIN Patient ON Examination.ID = Patient.ID JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'F' AND Laboratory.UA <= 6.50 ORDER BY Laboratory.UA DESC LIMIT 1;	thrombosis_prediction
SELECT MAX(e.ANA)  FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.CRE < 1.5;	thrombosis_prediction
SELECT ID  FROM Laboratory  JOIN Examination ON Laboratory.ID = Examination.ID  WHERE CRE < 1.5  ORDER BY `aCL IgA` DESC  LIMIT 1;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE L.`T-BIL` >= 2.0    AND E.`ANA Pattern` LIKE '%P%';	thrombosis_prediction
SELECT ANA  FROM Examination  JOIN Laboratory ON Examination.ID = Laboratory.ID  WHERE `T-BIL` < 2.0  ORDER BY `T-BIL` DESC  LIMIT 1;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE L.`T-CHO` >= 250 AND E.KCT = '-';	thrombosis_prediction
SELECT COUNT(*)  FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE L.`T-CHO` < 250 AND E.`ANA Pattern` = 'P';	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.TG < 200 AND e.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TG < 200 ORDER BY l.TG DESC LIMIT 1;	thrombosis_prediction
SELECT DISTINCT e.ID FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE e.Thrombosis = 0 AND l.CPK < 250;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.CPK < 250    AND (e.KCT = '+' OR e.RVVT = '+' OR e.LAC = '+');	thrombosis_prediction
SELECT MIN(P.Birthday)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.GLU > 180;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.GLU < 180 AND e.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '+' AND l.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis = 'SLE' AND l.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE (l.RBC <= 3.5 OR l.RBC >= 6.0)   AND p.Admission = '-';	thrombosis_prediction
SELECT COUNT(*)  FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE L.PLT > 100 AND L.PLT < 400 AND P.Diagnosis IS NOT NULL;	thrombosis_prediction
SELECT L.PLT  FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE L.PLT > 100 AND L.PLT < 400 AND P.Diagnosis = 'MCTD';	thrombosis_prediction
SELECT AVG(PT)  FROM Laboratory  JOIN Patient ON Laboratory.ID = Patient.ID  WHERE Patient.SEX = 'M' AND Laboratory.PT < 14;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE (e.Thrombosis = 1 OR e.Thrombosis = 2) AND l.PT < 14;	thrombosis_prediction
SELECT m.major_name FROM member mem JOIN major m ON mem.link_to_major = m.major_id WHERE mem.first_name = 'Angela' AND mem.last_name = 'Sanders';	student_club
SELECT COUNT(*)  FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.college = 'College of Engineering';	student_club
SELECT m.first_name, m.last_name  FROM member m  JOIN major ma ON m.link_to_major = ma.major_id  WHERE ma.department = 'Art and Design';	student_club
SELECT COUNT(*)  FROM attendance a JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = "Women's Soccer";	student_club
SELECT m.phone FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = "Women's Soccer";	student_club
SELECT COUNT(*)  FROM attendance a JOIN member m ON a.link_to_member = m.member_id JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = "Women's Soccer"    AND m.t_shirt_size = 'Medium';	student_club
SELECT link_to_event  FROM attendance  GROUP BY link_to_event  ORDER BY COUNT(link_to_member) DESC  LIMIT 1;	student_club
SELECT m.college FROM member mem JOIN major m ON mem.link_to_major = m.major_id WHERE mem.position = 'Vice President';	student_club
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.first_name = 'Maya' AND m.last_name = 'Mclean';	student_club
SELECT COUNT(*)  FROM attendance a JOIN event e ON a.link_to_event = e.event_id JOIN member m ON a.link_to_member = m.member_id WHERE m.first_name = 'Sacha'    AND m.last_name = 'Harrison'   AND strftime('%Y', e.event_date) = '2019';	student_club
SELECT COUNT(*)  FROM event e JOIN attendance a ON e.event_id = a.link_to_event WHERE e.type = 'Meeting' GROUP BY e.event_id HAVING COUNT(a.link_to_member) > 10;	student_club
SELECT event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event WHERE e.type != 'fundraiser' GROUP BY e.event_id, e.event_name HAVING COUNT(a.link_to_member) > 20;	student_club
SELECT AVG(attendance_count)  FROM (     SELECT COUNT(a.link_to_member) AS attendance_count     FROM event e     LEFT JOIN attendance a ON e.event_id = a.link_to_event     WHERE e.type = 'Meeting' AND substr(e.event_date, 1, 4) = '2020'     GROUP BY e.event_id ) AS meeting_attendance;	student_club
SELECT expense_description FROM expense ORDER BY cost DESC LIMIT 1;	student_club
SELECT COUNT(*)  FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Environmental Engineering';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Laugh Out Loud';	student_club
SELECT m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Law and Constitutional Studies';	student_club
SELECT z.county  FROM member m  JOIN zip_code z ON m.zip = z.zip_code  WHERE m.first_name = 'Sherri' AND m.last_name = 'Ramsey';	student_club
SELECT m.college FROM major m JOIN member mem ON m.major_id = mem.link_to_major WHERE mem.first_name = 'Tyler' AND mem.last_name = 'Hewitt';	student_club
SELECT SUM(amount)  FROM income  JOIN member ON income.link_to_member = member.member_id  WHERE member.position = 'Vice President';	student_club
SELECT b.spent  FROM budget b  JOIN event e ON b.link_to_event = e.event_id  WHERE e.event_name = 'September Meeting' AND b.category = 'Food';	student_club
SELECT z.city, z.state FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.position = 'President';	student_club
SELECT first_name, last_name  FROM member  JOIN zip_code ON member.zip = zip_code.zip_code  WHERE zip_code.state = 'Illinois';	student_club
SELECT SUM(b.spent)  FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE b.category = 'Advertisement' AND e.event_name = 'September Meeting';	student_club
SELECT m.department  FROM major m  JOIN member mem ON m.major_id = mem.link_to_major  WHERE (mem.first_name = 'Pierce' AND mem.last_name = 'Guidi') OR (mem.first_name = 'Guidi' AND mem.last_name = 'Pierce');	student_club
SELECT SUM(b.amount)  FROM budget b  JOIN event e ON b.link_to_event = e.event_id  WHERE e.event_name = 'October Speaker';	student_club
SELECT e.expense_description, e.approved FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.event_name = 'October Meeting' AND ev.event_date = '2019-10-08';	student_club
SELECT AVG(e.cost)  FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.first_name = 'Elijah'    AND m.last_name = 'Allen'   AND (SUBSTR(e.expense_date, 5, 2) = '09' OR SUBSTR(e.expense_date, 5, 2) = '10');	student_club
SELECT      SUM(CASE WHEN SUBSTR(e.event_date, 1, 4) = '2019' THEN b.spent ELSE 0 END) -      SUM(CASE WHEN SUBSTR(e.event_date, 1, 4) = '2020' THEN b.spent ELSE 0 END) FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE SUBSTR(e.event_date, 1, 4) IN ('2019', '2020');	student_club
SELECT location FROM event WHERE event_name = 'Spring Budget Review';	student_club
SELECT cost FROM expense WHERE expense_description = 'Posters' AND expense_date = '2019-09-04';	student_club
SELECT MAX(budget.remaining)  FROM budget  WHERE budget.category = 'Food';	student_club
SELECT notes FROM income WHERE source = 'Fundraising' AND date_received = '2019-09-14';	student_club
SELECT COUNT(*) FROM major WHERE college = 'College of Humanities and Social Sciences';	student_club
SELECT phone FROM member WHERE first_name = 'Carlo' AND last_name = 'Jacobs';	student_club
SELECT z.county FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Adela' AND m.last_name = 'O''Gallagher';	student_club
SELECT COUNT(*)  FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'November Meeting' AND b.remaining < 0;	student_club
SELECT SUM(b.amount)  FROM budget b  JOIN event e ON b.link_to_event = e.event_id  WHERE e.event_name = 'September Speaker';	student_club
SELECT e.status  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  JOIN expense exp ON b.budget_id = exp.link_to_budget  WHERE exp.expense_description = 'Post Cards, Posters'  AND exp.expense_date = '2019-8-20';	student_club
SELECT m.major_name FROM member mem JOIN major m ON mem.link_to_major = m.major_id WHERE mem.first_name = 'Brent' AND mem.last_name = 'Thomason';	student_club
SELECT COUNT(*)  FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Business' AND m.t_shirt_size = 'Medium';	student_club
SELECT z.type  FROM zip_code z  JOIN member m ON z.zip_code = m.zip  WHERE m.first_name = 'Christof' AND m.last_name = 'Nielson';	student_club
SELECT m.major_name  FROM member mem  JOIN major m ON mem.link_to_major = m.major_id  WHERE mem.position = 'Vice President';	student_club
SELECT z.state FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison';	student_club
SELECT m.position, ma.department  FROM member m  JOIN major ma ON m.link_to_major = ma.major_id  WHERE m.position = 'President';	student_club
SELECT i.date_received  FROM income i  JOIN member m ON i.link_to_member = m.member_id  WHERE m.first_name = 'Connor' AND m.last_name = 'Hilton' AND i.source = 'Dues';	student_club
SELECT first_name, last_name  FROM member  JOIN income ON member.member_id = income.link_to_member  WHERE source = 'Dues'  ORDER BY date_received  LIMIT 1;	student_club
SELECT CAST(SUM(CASE WHEN e.event_name = 'Yearly Kickoff' THEN b.amount ELSE 0 END) AS REAL) / SUM(CASE WHEN e.event_name = 'October Meeting' THEN b.amount ELSE 0 END) AS ratio FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE b.category = 'Advertisement';	student_club
SELECT (SUM(CASE WHEN b.category = 'Parking' THEN b.amount ELSE 0 END) * 100.0 / SUM(b.amount)) AS percentage FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'November Speaker';	student_club
SELECT SUM(cost) FROM expense WHERE expense_description = 'Pizza';	student_club
SELECT COUNT(DISTINCT city)  FROM zip_code  WHERE county = 'Orange County' AND state = 'Virginia';	student_club
SELECT DISTINCT department FROM major WHERE college = 'College of Humanities and Social Sciences';	student_club
SELECT z.city, z.county, z.state  FROM member m  JOIN zip_code z ON m.zip = z.zip_code  WHERE m.first_name = 'Amy' AND m.last_name = 'Firth';	student_club
SELECT e.expense_description FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id WHERE b.remaining = (SELECT MIN(remaining) FROM budget WHERE remaining IS NOT NULL);	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'October Meeting';	student_club
SELECT college FROM major JOIN member ON major.major_id = member.link_to_major GROUP BY college ORDER BY COUNT(*) DESC LIMIT 1;	student_club
SELECT m.major_name FROM member mem JOIN major m ON mem.link_to_major = m.major_id WHERE mem.phone = '809-555-3360';	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event ORDER BY b.amount DESC LIMIT 1;	student_club
SELECT e.expense_description FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.position = 'Vice President';	student_club
SELECT COUNT(*)  FROM attendance a JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer';	student_club
SELECT i.date_received  FROM income i  JOIN member m ON i.link_to_member = m.member_id  WHERE m.first_name = 'Casey' AND m.last_name = 'Mason';	student_club
SELECT COUNT(*) FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE z.state = 'Maryland';	student_club
SELECT COUNT(*)  FROM attendance a JOIN member m ON a.link_to_member = m.member_id WHERE m.phone = '954-555-6240';	student_club
SELECT m.first_name, m.last_name  FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.status = 'Closed' ORDER BY CAST(b.spent AS REAL) / b.amount DESC LIMIT 1;	student_club
SELECT COUNT(*) FROM member WHERE position = 'President';	student_club
SELECT MAX(spent) FROM budget;	student_club
SELECT COUNT(*)  FROM event  WHERE type = 'Meeting'    AND strftime('%Y', event_date) = '2020';	student_club
SELECT SUM(spent) FROM budget WHERE category = 'Food';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member GROUP BY m.member_id, m.first_name, m.last_name HAVING COUNT(a.link_to_event) > 7;	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE ma.major_name = 'Interior Design'   AND e.event_name = 'Community Theater';	student_club
SELECT m.first_name, m.last_name  FROM member m  JOIN zip_code z ON m.zip = z.zip_code  WHERE z.city = 'Georgetown' AND z.state = 'South Carolina';	student_club
SELECT SUM(i.amount)  FROM income i  JOIN member m ON i.link_to_member = m.member_id  WHERE m.first_name = 'Grant' AND m.last_name = 'Gilmour';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.amount > 40;	student_club
SELECT SUM(e.cost)  FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.event_name = 'Yearly Kickoff';	student_club
SELECT m.first_name, m.last_name  FROM member m JOIN budget b ON m.member_id = b.link_to_event JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'Yearly Kickoff';	student_club
SELECT m.first_name, m.last_name, i.source  FROM member m  JOIN income i ON m.member_id = i.link_to_member  WHERE i.amount = (SELECT MAX(amount) FROM income);	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event ORDER BY b.amount ASC LIMIT 1;	student_club
SELECT (SUM(CASE WHEN e.event_name = 'Yearly Kickoff' THEN exp.cost ELSE 0 END) * 100.0 / SUM(exp.cost)) AS percentage FROM expense exp JOIN budget b ON exp.link_to_budget = b.budget_id JOIN event e ON b.link_to_event = e.event_id;	student_club
SELECT CAST(SUM(CASE WHEN m.major_name = 'Finance' THEN 1 ELSE 0 END) AS FLOAT) / SUM(CASE WHEN m.major_name = 'Physics' THEN 1 ELSE 0 END) AS ratio FROM member mb JOIN major m ON mb.link_to_major = m.major_id;	student_club
SELECT source FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' GROUP BY source ORDER BY SUM(amount) DESC LIMIT 1;	student_club
SELECT first_name, last_name, email FROM member WHERE position = 'Secretary';	student_club
SELECT COUNT(*)  FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Physics Teaching';	student_club
SELECT COUNT(*)  FROM attendance a JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Community Theater'    AND strftime('%Y', e.event_date) = '2019';	student_club
SELECT COUNT(a.link_to_event) AS number_of_events, m.major_name  FROM attendance a  JOIN member mem ON a.link_to_member = mem.member_id  JOIN major m ON mem.link_to_major = m.major_id  WHERE mem.first_name = 'Luisa' AND mem.last_name = 'Guidi'  GROUP BY m.major_name;	student_club
SELECT SUM(b.spent) * 1.0 / COUNT(b.spent)  FROM budget b  JOIN event e ON b.link_to_event = e.event_id  WHERE b.category = 'Food' AND b.event_status = 'Closed';	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.category = 'Advertisement' ORDER BY b.spent DESC LIMIT 1;	student_club
SELECT CASE WHEN a.link_to_event IS NOT NULL THEN 'Yes' ELSE 'No' END FROM member m LEFT JOIN attendance a ON m.member_id = a.link_to_member LEFT JOIN event e ON a.link_to_event = e.event_id WHERE m.first_name = 'Maya' AND m.last_name = 'Mclean' AND e.event_name = 'Women''s Soccer';	student_club
SELECT (SUM(CASE WHEN type = 'Community Service' THEN 1 ELSE 0 END) * 100.0 / COUNT(event_id)) AS percentage_share FROM event WHERE event_date BETWEEN '2019-01-01' AND '2019-12-31';	student_club
SELECT e.cost FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE e.expense_description = 'Posters'   AND ev.event_name = 'September Speaker';	student_club
SELECT t_shirt_size FROM member GROUP BY t_shirt_size ORDER BY COUNT(t_shirt_size) DESC LIMIT 1;	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.status = 'Closed' AND b.remaining < 0 ORDER BY b.remaining ASC LIMIT 1;	student_club
SELECT e.category, SUM(ex.cost) AS total_value FROM expense ex JOIN budget b ON ex.link_to_budget = b.budget_id JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'October Meeting' AND ex.approved = 'Yes' GROUP BY e.category;	student_club
SELECT category, SUM(amount) AS amount_budgeted FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'April Speaker' GROUP BY category ORDER BY amount_budgeted ASC;	student_club
SELECT MAX(amount) FROM budget WHERE category = 'Food';	student_club
SELECT * FROM budget WHERE category = 'Advertising' ORDER BY amount DESC LIMIT 3;	student_club
SELECT SUM(e.cost)  FROM expense e  WHERE e.expense_description = 'Parking';	student_club
SELECT SUM(cost) FROM expense WHERE expense_date = '2019-08-20';	student_club
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_cost FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE m.member_id = 'rec4BLdZHS2Blfp4v' GROUP BY m.first_name, m.last_name;	student_club
SELECT e.expense_description FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison';	student_club
SELECT e.expense_description FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.t_shirt_size = 'X-Large';	student_club
SELECT m.zip FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost < 50;	student_club
SELECT m.major_name FROM major m JOIN member mem ON m.major_id = mem.link_to_major WHERE mem.first_name = 'Phillip' AND mem.last_name = 'Cullen';	student_club
SELECT m.position FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Business';	student_club
SELECT COUNT(*)  FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Business' AND m.t_shirt_size = 'Medium';	student_club
SELECT e.type FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.remaining > 30;	student_club
SELECT DISTINCT e.type FROM event e WHERE e.location = 'MU 215';	student_club
SELECT e.type FROM event e WHERE e.event_date = '2020-03-24T12:00:00';	student_club
SELECT m.major_name  FROM major m  JOIN member mem ON m.major_id = mem.link_to_major  WHERE mem.position = 'Vice President';	student_club
SELECT (SUM(CASE WHEN m.position = 'Member' AND maj.major_name = 'Business' THEN 1 ELSE 0 END) * 100.0 / COUNT(m.member_id))  FROM member m  LEFT JOIN major maj ON m.link_to_major = maj.major_id;	student_club
SELECT category  FROM budget  WHERE link_to_event IN (     SELECT event_id      FROM event      WHERE location = 'MU 215' );	student_club
SELECT COUNT(*) FROM income WHERE amount = 50;	student_club
SELECT COUNT(*) FROM member WHERE position = 'Member' AND t_shirt_size = 'X-Large';	student_club
SELECT COUNT(*)  FROM major  WHERE college = 'College of Agriculture and Applied Sciences'    AND department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT m.last_name, maj.department, maj.college FROM member m JOIN major maj ON m.link_to_major = maj.major_id WHERE maj.major_name = 'Environmental Engineering';	student_club
SELECT b.category FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.location = 'MU 215'   AND e.type = 'Guest Speaker'   AND b.spent = 0;	student_club
SELECT z.city, z.state FROM member m JOIN zip_code z ON m.zip = z.zip_code JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.department = 'Electrical and Computer Engineering Department'   AND m.position = 'Member';	student_club
SELECT e.event_name  FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE e.type = 'Social'    AND m.position = 'Vice President'   AND e.location = '900 E. Washington St.';	student_club
SELECT m.last_name, m.position FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.expense_description = 'Pizza' AND e.expense_date = '2019-09-10';	student_club
SELECT m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE m.position = 'Member' AND e.event_name = 'Women''s Soccer';	student_club
SELECT (COUNT(CASE WHEN i.amount = 50 THEN 1 END) * 100.0 / COUNT(m.member_id)) AS percentage FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE m.t_shirt_size = 'Medium' AND m.position = 'Member';	student_club
SELECT DISTINCT state FROM zip_code WHERE type = 'PO Box';	student_club
SELECT zip_code FROM zip_code WHERE type = 'PO Box' AND county = 'San Juan Municipio' AND state = 'Puerto Rico';	student_club
SELECT event_name AS game FROM event WHERE type = 'Game'   AND status = 'Closed'   AND event_date BETWEEN '2019-03-15' AND '2020-03-20';	student_club
SELECT DISTINCT e.event_id FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN expense exp ON a.link_to_member = exp.link_to_member WHERE exp.cost > 50;	student_club
SELECT m.first_name, m.last_name, a.link_to_event  FROM member m  JOIN expense e ON m.member_id = e.link_to_member  JOIN attendance a ON m.member_id = a.link_to_member  WHERE e.approved = 'true'  AND e.expense_date BETWEEN '2019-01-10' AND '2019-11-19';	student_club
SELECT m.college FROM member mem JOIN major m ON mem.link_to_major = m.major_id WHERE mem.first_name = 'Katy' AND mem.link_to_major = 'rec1N0upiVLy5esTO';	student_club
SELECT m.phone FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Business' AND ma.college = 'College of Agriculture and Applied Sciences';	student_club
SELECT DISTINCT m.email FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.expense_date BETWEEN '2019-09-10' AND '2019-11-19'   AND e.cost > 20;	student_club
SELECT COUNT(*)  FROM member m JOIN major maj ON m.link_to_major = maj.major_id WHERE maj.major_name = 'education' AND maj.college = 'College of Education & Human Services';	student_club
SELECT (SUM(CASE WHEN remaining < 0 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS percentage_over_budget FROM budget;	student_club
SELECT event_id, location, status  FROM event  WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31';	student_club
SELECT expense_description FROM expense GROUP BY expense_description HAVING AVG(cost) > 50;	student_club
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large';	student_club
SELECT (SUM(CASE WHEN type = 'PO Box' THEN 1 ELSE 0 END) * 100.0 / COUNT(zip_code)) FROM zip_code;	student_club
SELECT event_name, location  FROM event  JOIN budget ON event.event_id = budget.link_to_event  WHERE budget.remaining > 0;	student_club
SELECT e.event_name, e.event_date FROM event e JOIN budget b ON e.event_id = b.link_to_event JOIN expense exp ON b.budget_id = exp.link_to_budget WHERE exp.expense_description = 'Pizza'   AND exp.cost > 50   AND exp.cost < 100;	student_club
SELECT m.first_name, m.last_name, maj.major_name FROM member m JOIN expense e ON m.member_id = e.link_to_member JOIN major maj ON m.link_to_major = maj.major_id WHERE e.cost > 100;	student_club
SELECT DISTINCT z.city, z.state FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id JOIN zip_code z ON m.zip = z.zip_code JOIN income i ON m.member_id = i.link_to_member GROUP BY e.event_id HAVING COUNT(i.income_id) > 40;	student_club
SELECT m.member_id, m.first_name, m.last_name, SUM(e.cost) AS total_cost FROM member m JOIN expense e ON m.member_id = e.link_to_member JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE m.member_id IN (     SELECT e2.link_to_member     FROM expense e2     JOIN budget b2 ON e2.link_to_budget = b2.budget_id     GROUP BY e2.link_to_member     HAVING COUNT(DISTINCT b2.link_to_event) > 1 ) GROUP BY m.member_id, m.first_name, m.last_name ORDER BY total_cost DESC LIMIT 1;	student_club
SELECT AVG(e.cost)  FROM expense e  JOIN member m ON e.link_to_member = m.member_id  WHERE m.position != 'Member';	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event JOIN expense exp ON b.budget_id = exp.link_to_budget WHERE b.category = 'Parking' GROUP BY e.event_id, e.event_name HAVING AVG(exp.cost) < (     SELECT AVG(cost)     FROM expense exp2     JOIN budget b2 ON exp2.link_to_budget = b2.budget_id     WHERE b2.category = 'Parking' );	student_club
SELECT (SUM(e.cost) * 100.0 / COUNT(ev.event_id)) AS percentage FROM event ev JOIN budget b ON ev.event_id = b.link_to_event JOIN expense e ON b.budget_id = e.link_to_budget WHERE ev.type = 'Meeting';	student_club
SELECT link_to_budget FROM expense WHERE expense_description = 'Water, chips, cookies' ORDER BY cost DESC LIMIT 1;	student_club
SELECT m.first_name, m.last_name FROM member m JOIN expense e ON m.member_id = e.link_to_member GROUP BY m.member_id, m.first_name, m.last_name ORDER BY SUM(e.cost) DESC LIMIT 5;	student_club
SELECT m.first_name, m.last_name, m.phone FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost > (SELECT AVG(cost) FROM expense);	student_club
SELECT      (SUM(CASE WHEN z.state = 'New Jersey' THEN 1 ELSE 0 END) * 1.0 / COUNT(CASE WHEN m.position = 'Member' THEN 1 END)) -      (SUM(CASE WHEN z.state = 'Vermont' THEN 1 ELSE 0 END) * 1.0 / COUNT(CASE WHEN m.position = 'Member' THEN 1 END)) AS difference FROM member m JOIN zip_code z ON m.zip = z.zip_code;	student_club
SELECT m.major_name, m.department  FROM major m  JOIN member mb ON m.major_id = mb.link_to_major  WHERE mb.first_name = 'Garrett' AND mb.last_name = 'Gerke';	student_club
SELECT m.first_name, m.last_name, e.cost FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.expense_description = 'Water, Veggie tray, supplies';	student_club
SELECT m.last_name, m.phone FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Elementary Education';	student_club
SELECT b.category, b.amount FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'January Speaker';	student_club
SELECT DISTINCT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.category = 'Food';	student_club
SELECT m.first_name, m.last_name, i.amount FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.date_received = '9/9/2019';	student_club
SELECT b.category FROM budget b JOIN expense e ON b.budget_id = e.link_to_budget WHERE e.expense_description = 'Posters';	student_club
SELECT m.first_name, m.last_name, maj.college  FROM member m  JOIN major maj ON m.link_to_major = maj.major_id  WHERE m.position = 'Secretary';	student_club
SELECT SUM(b.spent) AS total_spent, e.event_name FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE b.category = 'Speaker Gifts' GROUP BY e.event_name;	student_club
SELECT z.city  FROM zip_code z  JOIN member m ON z.zip_code = m.zip  WHERE m.first_name = 'Garrett' AND m.last_name = 'Gerke';	student_club
SELECT m.first_name, m.last_name, m.position FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE z.city = 'Lincolnton' AND z.state = 'North Carolina' AND z.zip_code = 28092;	student_club
SELECT COUNT(*)  FROM gasstations  WHERE Country = 'CZE' AND Segment = 'Premium';	debit_card_specializing
SELECT      CAST(SUM(CASE WHEN Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN Currency = 'CZK' THEN 1 ELSE 0 END) AS ratio FROM customers;	debit_card_specializing
SELECT CustomerID  FROM yearmonth  JOIN customers ON yearmonth.CustomerID = customers.CustomerID  WHERE substr(Date, 1, 4) = '2012' AND customers.Segment = 'LAM'  ORDER BY Consumption ASC  LIMIT 1;	debit_card_specializing
SELECT AVG(Consumption) / 12  FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Segment = 'SME'    AND y.Date BETWEEN '201301' AND '201312';	debit_card_specializing
SELECT CustomerID FROM yearmonth WHERE Date BETWEEN '201101' AND '201112'   AND CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'CZK') ORDER BY Consumption DESC LIMIT 1;	debit_card_specializing
SELECT COUNT(DISTINCT c.CustomerID) FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'KAM'   AND y.Date BETWEEN '201201' AND '201212'   AND y.Consumption < 30000;	debit_card_specializing
SELECT      SUM(CASE WHEN c.Currency = 'CZK' THEN ym.Consumption ELSE 0 END) -      SUM(CASE WHEN c.Currency = 'EUR' THEN ym.Consumption ELSE 0 END) AS ConsumptionDifference FROM yearmonth ym JOIN customers c ON ym.CustomerID = c.CustomerID WHERE SUBSTR(ym.Date, 1, 4) = '2012';	debit_card_specializing
SELECT strftime('%Y', t.Date) AS Year FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR' GROUP BY Year ORDER BY SUM(t.Amount) DESC LIMIT 1;	debit_card_specializing
SELECT Segment  FROM customers  JOIN yearmonth ON customers.CustomerID = yearmonth.CustomerID  GROUP BY Segment  ORDER BY SUM(Consumption)  LIMIT 1;	debit_card_specializing
SELECT SUBSTR(Date, 1, 4) AS Year FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE customers.Currency = 'CZK' GROUP BY SUBSTR(Date, 1, 4) ORDER BY SUM(Consumption) DESC LIMIT 1;	debit_card_specializing
SELECT substr(Date, 5, 2) AS Month FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Segment = 'SME' AND substr(Date, 1, 4) = '2013' ORDER BY Consumption DESC LIMIT 1;	debit_card_specializing
SELECT      (SELECT AVG(Consumption) FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'SME') AND Date BETWEEN '201301' AND '201312') -      (SELECT AVG(Consumption) FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'LAM') AND Date BETWEEN '201301' AND '201312') AS SME_LAM_Diff,          (SELECT AVG(Consumption) FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'LAM') AND Date BETWEEN '201301' AND '201312') -      (SELECT AVG(Consumption) FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'KAM') AND Date BETWEEN '201301' AND '201312') AS LAM_KAM_Diff,          (SELECT AVG(Consumption) FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'KAM') AND Date BETWEEN '201301' AND '201312') -      (SELECT AVG(Consumption) FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'SME') AND Date BETWEEN '201301' AND '201312') AS KAM_SME_Diff;	debit_card_specializing
SELECT      c.Segment,     ((SUM(CASE WHEN SUBSTR(ym.Date, 1, 4) = '2013' THEN ym.Consumption ELSE 0 END) - SUM(CASE WHEN SUBSTR(ym.Date, 1, 4) = '2012' THEN ym.Consumption ELSE 0 END)) * 100.0 / SUM(CASE WHEN SUBSTR(ym.Date, 1, 4) = '2013' THEN ym.Consumption ELSE 0 END)) AS percentage_increase FROM      yearmonth ym JOIN      customers c ON ym.CustomerID = c.CustomerID WHERE      c.Currency = 'EUR' AND c.Segment IN ('SME', 'LAM', 'KAM') GROUP BY      c.Segment ORDER BY      percentage_increase DESC;	debit_card_specializing
SELECT SUM(Consumption)  FROM yearmonth  WHERE CustomerID = 6    AND Date BETWEEN '201308' AND '201311';	debit_card_specializing
SELECT      (SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Value for money') -      (SELECT COUNT(*) FROM gasstations WHERE Country = 'SVK' AND Segment = 'Value for money');	debit_card_specializing
SELECT      (SELECT Consumption FROM yearmonth WHERE CustomerID = 7 AND Date = '201304') -      (SELECT Consumption FROM yearmonth WHERE CustomerID = 5 AND Date = '201304') AS consumption_difference;	debit_card_specializing
SELECT      SUM(CASE WHEN c.Currency = 'CZK' AND c.Segment = 'SME' THEN 1 ELSE 0 END) -      SUM(CASE WHEN c.Currency = 'EUR' AND c.Segment = 'SME' THEN 1 ELSE 0 END) AS difference FROM customers c;	debit_card_specializing
SELECT c.CustomerID FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'LAM'   AND c.Currency = 'EUR'   AND y.Date = '201310' ORDER BY y.Consumption DESC LIMIT 1;	debit_card_specializing
SELECT CustomerID, MAX(Consumption) AS MaxConsumption FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'KAM') GROUP BY CustomerID ORDER BY MaxConsumption DESC LIMIT 1;	debit_card_specializing
SELECT SUM(Consumption)  FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Segment = 'KAM' AND y.Date = '201305';	debit_card_specializing
SELECT      (COUNT(CASE WHEN y.Consumption > 46.73 THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM      yearmonth y JOIN      customers c ON y.CustomerID = c.CustomerID WHERE      c.Segment = 'LAM';	debit_card_specializing
SELECT Country, COUNT(*) AS TotalValueForMoneyGasStations FROM gasstations WHERE Segment = 'Value for money' GROUP BY Country ORDER BY TotalValueForMoneyGasStations DESC;	debit_card_specializing
SELECT (COUNT(CASE WHEN Currency = 'EUR' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM customers WHERE Segment = 'KAM';	debit_card_specializing
SELECT      (COUNT(CASE WHEN Consumption > 528.3 THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM yearmonth WHERE Date = '201202';	debit_card_specializing
SELECT (COUNT(CASE WHEN Segment = 'Premium' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM gasstations WHERE Country = 'SVK';	debit_card_specializing
SELECT CustomerID FROM yearmonth WHERE Date = '201309' ORDER BY Consumption DESC LIMIT 1;	debit_card_specializing
SELECT c.Segment FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE y.Date = '201309' ORDER BY y.Consumption ASC LIMIT 1;	debit_card_specializing
SELECT c.CustomerID FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'SME' AND y.Date = '201206' ORDER BY y.Consumption ASC LIMIT 1;	debit_card_specializing
SELECT MAX(Consumption) FROM yearmonth WHERE Date LIKE '2012%'	debit_card_specializing
SELECT MAX(total_consumption / 12)  FROM (     SELECT SUM(y.Consumption) AS total_consumption     FROM yearmonth y     JOIN customers c ON y.CustomerID = c.CustomerID     WHERE c.Currency = 'EUR'     GROUP BY y.CustomerID );	debit_card_specializing
SELECT DISTINCT p.Description FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID WHERE strftime('%Y%m', t.Date) = '201309';	debit_card_specializing
SELECT DISTINCT g.Country FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID WHERE SUBSTR(t.Date, 1, 7) = '2013-06';	debit_card_specializing
SELECT DISTINCT g.ChainID FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR';	debit_card_specializing
SELECT DISTINCT p.Description FROM transactions_1k t JOIN products p ON t.ProductID = p.ProductID JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR';	debit_card_specializing
SELECT AVG(Price * Amount)  FROM transactions_1k  WHERE Date LIKE '2012-01%'	debit_card_specializing
SELECT COUNT(*)  FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Currency = 'EUR' AND y.Consumption > 1000;	debit_card_specializing
SELECT p.Description FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID JOIN products p ON t.ProductID = p.ProductID WHERE g.Country = 'CZE';	debit_card_specializing
SELECT DISTINCT Time FROM transactions_1k WHERE GasStationID IN (SELECT GasStationID FROM gasstations WHERE ChainID = 11);	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE' AND t.Price > 1000;	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE' AND t.Date > '2012-01-01';	debit_card_specializing
SELECT AVG(t.Price * t.Amount)  FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE';	debit_card_specializing
SELECT AVG(t.Price)  FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR';	debit_card_specializing
SELECT CustomerID FROM transactions_1k WHERE Date = '2012-08-25' ORDER BY Price DESC LIMIT 1;	debit_card_specializing
SELECT g.Country FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.Date = '2012-08-25' ORDER BY t.TransactionID LIMIT 1;	debit_card_specializing
SELECT c.Currency FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE t.Date = '2012-08-24' AND t.Time = '16:25:00';	debit_card_specializing
SELECT c.Segment FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE t.Date = '2012-08-23' AND t.Time = '21:20:00';	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE t.Date = '2012-08-26'    AND t.Time < '13:00:00'    AND c.Currency = 'CZK';	debit_card_specializing
SELECT c.Segment  FROM customers c  JOIN yearmonth y ON c.CustomerID = y.CustomerID  ORDER BY y.Date  LIMIT 1;	debit_card_specializing
SELECT g.Country FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.Date = '2012-08-24' AND t.Time = '12:42:00';	debit_card_specializing
SELECT ProductID  FROM transactions_1k  WHERE Date = '2012-08-23' AND Time = '21:20:00';	debit_card_specializing
SELECT y.Date, y.Consumption  FROM yearmonth y  JOIN transactions_1k t ON y.CustomerID = t.CustomerID  WHERE t.Date = '2012-08-24' AND t.Price = 124.05  AND SUBSTR(y.Date, 1, 4) = '2012'  AND SUBSTR(y.Date, 5, 2) = '01';	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.Date = '2012-08-26'    AND t.Time BETWEEN '08:00:00' AND '09:00:00'   AND g.Country = 'CZE';	debit_card_specializing
SELECT c.Currency FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE y.Date = '201306' AND y.Consumption = 214582.17;	debit_card_specializing
SELECT g.Country FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.CardID = 667467 LIMIT 1;	debit_card_specializing
SELECT c.Currency FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE t.Date = '2012-08-24' AND t.Price = 548.4;	debit_card_specializing
SELECT      (COUNT(CASE WHEN c.Currency = 'EUR' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE t.Date = '2012-08-25';	debit_card_specializing
SELECT      (SUM(CASE WHEN SUBSTR(Date, 1, 4) = '2012' THEN Consumption ELSE 0 END) -       SUM(CASE WHEN SUBSTR(Date, 1, 4) = '2013' THEN Consumption ELSE 0 END)) * 1.0 /      SUM(CASE WHEN SUBSTR(Date, 1, 4) = '2012' THEN Consumption ELSE 0 END) AS decrease_rate FROM yearmonth WHERE CustomerID IN (     SELECT CustomerID      FROM transactions_1k      WHERE Date = '2012-08-25' AND Price = 634.8 );	debit_card_specializing
SELECT GasStationID FROM transactions_1k GROUP BY GasStationID ORDER BY SUM(Amount * Price) DESC LIMIT 1;	debit_card_specializing
SELECT      (COUNT(CASE WHEN Segment = 'Premium' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM gasstations WHERE Country = 'SVK';	debit_card_specializing
SELECT SUM(t.Price * t.Amount) AS TotalSpent,         SUM(CASE WHEN y.Date = '201201' THEN y.Consumption ELSE 0 END) AS SpentInJanuary2012 FROM transactions_1k t LEFT JOIN yearmonth y ON t.CustomerID = y.CustomerID AND y.Date = '201201' WHERE t.CustomerID = 38508;	debit_card_specializing
SELECT p.Description FROM transactions_1k t JOIN products p ON t.ProductID = p.ProductID GROUP BY t.ProductID ORDER BY SUM(t.Amount) DESC LIMIT 5;	debit_card_specializing
SELECT      t.CustomerID,     SUM(t.Price) / SUM(t.Amount) AS average_price_per_item,     c.Currency FROM      transactions_1k t JOIN      customers c ON t.CustomerID = c.CustomerID GROUP BY      t.CustomerID, c.Currency ORDER BY      SUM(t.Price) DESC LIMIT 1;	debit_card_specializing
SELECT g.Country FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID WHERE t.ProductID = 2 ORDER BY t.Price DESC LIMIT 1;	debit_card_specializing
SELECT y.Consumption FROM yearmonth y JOIN transactions_1k t ON y.CustomerID = t.CustomerID WHERE t.ProductID = 5 AND (t.Price / t.Amount) > 29.00 AND y.Date = '201208';	debit_card_specializing
