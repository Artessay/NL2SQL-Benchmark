SELECT MAX(`Free Meal Count (K-12)` / `Enrollment (K-12)`)  FROM frpm  WHERE `County Name` = 'Alameda County';	california_schools
SELECT `Percent (%) Eligible Free (Ages 5-17)` FROM frpm WHERE `School Type` = 'Continuation' ORDER BY `Percent (%) Eligible Free (Ages 5-17)` ASC LIMIT 3;	california_schools
SELECT DISTINCT s.Zip FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.`Charter School (Y/N)` = 1   AND f.`County Name` = 'Fresno County Office of Education';	california_schools
SELECT MailStreet FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode ORDER BY frpm.`FRPM Count (K-12)` DESC LIMIT 1;	california_schools
SELECT s.Phone FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.`Charter School (Y/N)` = 1   AND f.`Charter Funding Type` = 'Direct'   AND s.OpenDate > '2000-01-01';	california_schools
SELECT COUNT(*)  FROM satscores  JOIN schools ON satscores.cds = schools.CDSCode  WHERE satscores.AvgScrMath > 400    AND schools.Virtual = 'F';	california_schools
SELECT s.School  FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds WHERE sat.NumTstTakr > 500 AND s.Magnet = 1;	california_schools
SELECT s.Phone FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds ORDER BY sat.NumGE1500 DESC LIMIT 1;	california_schools
SELECT s.NumTstTakr FROM satscores s JOIN frpm f ON s.cds = f.CDSCode ORDER BY f.`FRPM Count (K-12)` DESC LIMIT 1;	california_schools
SELECT COUNT(*)  FROM satscores  JOIN frpm ON satscores.cds = frpm.CDSCode  WHERE satscores.AvgScrMath > 560    AND frpm.`Charter Funding Type` = 'Direct Funded';	california_schools
SELECT f.`FRPM Count (Ages 5-17)` FROM frpm f JOIN satscores s ON f.CDSCode = s.cds ORDER BY s.AvgScrRead DESC LIMIT 1;	california_schools
SELECT CDSCode FROM frpm WHERE `Enrollment (K-12)` + `Enrollment (Ages 5-17)` > 500;	california_schools
SELECT MAX(`Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)`)  FROM frpm  JOIN satscores ON frpm.CDSCode = satscores.cds  WHERE satscores.NumGE1500 * 1.0 / satscores.NumTstTakr > 0.3;	california_schools
SELECT s.Phone FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds ORDER BY CAST(sat.NumGE1500 AS FLOAT) / sat.NumTstTakr DESC LIMIT 3;	california_schools
SELECT schools.NCESSchool, frpm.`Enrollment (Ages 5-17)` FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode ORDER BY frpm.`Enrollment (Ages 5-17)` DESC LIMIT 5;	california_schools
SELECT dname FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.StatusType = 'Active' GROUP BY dname ORDER BY AVG(AvgScrRead) DESC LIMIT 1;	california_schools
SELECT COUNT(*)  FROM satscores  JOIN schools ON satscores.cds = schools.CDSCode  WHERE schools.County = 'Alameda' AND satscores.NumTstTakr < 100;	california_schools
SELECT      s.School,     sc.AvgScrWrite,     s.CharterNum FROM      schools s JOIN      satscores sc ON s.CDSCode = sc.cds WHERE      sc.AvgScrWrite > 499     AND s.CharterNum IS NOT NULL ORDER BY      sc.AvgScrWrite DESC;	california_schools
SELECT COUNT(*)  FROM satscores  JOIN schools ON satscores.cds = schools.CDSCode  WHERE schools.County = 'Fresno'    AND schools.FundingType = 'Directly Funded'    AND satscores.NumTstTakr <= 250;	california_schools
SELECT s.Phone FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds ORDER BY sat.AvgScrMath DESC LIMIT 1;	california_schools
SELECT COUNT(*)  FROM frpm  WHERE `County Name` = 'Amador'    AND `Low Grade` = '9'    AND `High Grade` = '12';	california_schools
SELECT COUNT(*)  FROM frpm  WHERE `County Name` = 'Los Angeles'    AND `Free Meal Count (K-12)` > 500    AND `FRPM Count (K-12)` < 700;	california_schools
SELECT s.School FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.`County Name` = 'Contra Costa' ORDER BY sat.NumTstTakr DESC LIMIT 1;	california_schools
SELECT      s.School,      s.Street,      s.City,      s.Zip,      s.State FROM      schools s JOIN      frpm f ON s.CDSCode = f.CDSCode WHERE      ABS(f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`) > 30;	california_schools
SELECT DISTINCT s.School FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode JOIN satscores sat ON s.CDSCode = sat.cds WHERE (f.`Free Meal Count (K-12)` / f.`Enrollment (K-12)`) > 0.1   AND sat.NumGE1500 >= 1	california_schools
SELECT DISTINCT s.School, s.FundingType FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.County = 'Riverside' GROUP BY s.School, s.FundingType HAVING AVG(sat.AvgScrMath) > 400;	california_schools
SELECT      s.School,      s.Street,      s.City,      s.State,      s.Zip FROM      schools s JOIN      frpm f ON s.CDSCode = f.CDSCode WHERE      s.GSserved LIKE '%12%'      AND f.`County Name` = 'Monterey'      AND f.`FRPM Count (Ages 5-17)` > 800;	california_schools
SELECT      s.School,      sat.AvgScrWrite,      s.Phone FROM      schools s JOIN      satscores sat ON s.CDSCode = sat.cds WHERE      s.OpenDate > '1991-12-31'      OR (s.ClosedDate < '2000-01-01' AND s.ClosedDate IS NOT NULL);	california_schools
SELECT `School Name`, `DOCType` FROM `frpm` f JOIN `schools` s ON f.`CDSCode` = s.`CDSCode` WHERE f.`Charter Funding Type` = 'Locally Funded'   AND (`Enrollment (K-12)` - `Enrollment (Ages 5-17)`) > (     SELECT AVG(`Enrollment (K-12)` - `Enrollment (Ages 5-17)`)     FROM `frpm`     WHERE `Charter Funding Type` = 'Locally Funded'   )	california_schools
SELECT s.OpenDate FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode ORDER BY f.`Enrollment (K-12)` DESC LIMIT 1;	california_schools
SELECT City FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode ORDER BY `Enrollment (K-12)` ASC LIMIT 5;	california_schools
SELECT `Percent (%) Eligible Free (K-12)` FROM frpm ORDER BY `Enrollment (K-12)` DESC LIMIT 2 OFFSET 8;	california_schools
SELECT `Percent (%) Eligible FRPM (K-12)` FROM frpm WHERE `District Code` = 66 ORDER BY `FRPM Count (K-12)` DESC LIMIT 5;	california_schools
SELECT s.Website, s.School  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE f.`Free Meal Count (Ages 5-17)` BETWEEN 1900 AND 2000;	california_schools
SELECT (`Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)`) AS free_rate FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.AdmFName1 = 'Kacey' AND schools.AdmLName1 = 'Gibson';	california_schools
SELECT s.AdmEmail1 FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.`Charter School (Y/N)` = 1 ORDER BY f.`Enrollment (K-12)` LIMIT 1;	california_schools
SELECT AdmFName1, AdmLName1  FROM schools  JOIN satscores ON schools.CDSCode = satscores.cds  ORDER BY satscores.NumGE1500 DESC  LIMIT 1;	california_schools
SELECT Street, City, Zip, State FROM schools JOIN satscores ON schools.CDSCode = satscores.cds ORDER BY CAST(NumGE1500 AS REAL) / NumTstTakr ASC LIMIT 1;	california_schools
SELECT s.Website FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.`County Name` = 'Los Angeles'   AND sat.NumTstTakr BETWEEN 2000 AND 3000;	california_schools
WITH node_scores AS (     SELECT AVG(satscores.NumTstTakr) AS avg_test_takers     FROM satscores     JOIN schools ON satscores.cds = schools.CDSCode     WHERE schools.County = 'Fresno'       AND strftime('%Y', schools.OpenDate) = '1980' ) SELECT * FROM node_scores;	california_schools
SELECT s.Phone FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds WHERE s.District = 'Fresno Unified' ORDER BY sat.AvgScrRead ASC LIMIT 1;	california_schools
SELECT s.School FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds WHERE s.Virtual = 'F' AND sat.AvgScrRead IS NOT NULL AND (     SELECT COUNT(*)     FROM satscores sat2     JOIN schools s2 ON sat2.cds = s2.CDSCode     WHERE s2.County = s.County     AND sat2.AvgScrRead > sat.AvgScrRead ) < 5	california_schools
SELECT `School Type`  FROM frpm  WHERE `CDSCode` = (     SELECT cds      FROM satscores      WHERE AvgScrMath = (SELECT MAX(AvgScrMath) FROM satscores) )	california_schools
SELECT      s.AvgScrMath,      sch.County  FROM      satscores s JOIN      schools sch ON s.cds = sch.CDSCode ORDER BY      (s.AvgScrRead + s.AvgScrMath + s.AvgScrWrite) ASC  LIMIT 1;	california_schools
SELECT s.AvgScrWrite, sch.City FROM satscores s JOIN schools sch ON s.cds = sch.CDSCode ORDER BY s.NumGE1500 DESC LIMIT 1;	california_schools
SELECT s.School, sat.AvgScrWrite FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds WHERE s.AdmFName1 = 'Ricci' AND s.AdmLName1 = 'Ulrich'    OR s.AdmFName2 = 'Ricci' AND s.AdmLName2 = 'Ulrich'    OR s.AdmFName3 = 'Ricci' AND s.AdmLName3 = 'Ulrich';	california_schools
SELECT s.School, f.`Enrollment (K-12)` FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.DOC = '31' ORDER BY f.`Enrollment (K-12)` DESC LIMIT 1;	california_schools
SELECT COUNT(*) * 1.0 / 12 AS monthly_average FROM schools WHERE County = 'Alameda'   AND DOC = '52'   AND OpenDate IS NOT NULL   AND OpenDate >= '1980-01-01'   AND OpenDate < '1981-01-01';	california_schools
SELECT      CAST(SUM(CASE WHEN s.DOC = '54' AND s.County = 'Orange' THEN 1 ELSE 0 END) AS REAL) /      SUM(CASE WHEN s.DOC = '52' THEN 1 ELSE 0 END) AS ratio FROM schools s;	california_schools
SELECT County, School, ClosedDate FROM schools WHERE StatusType = 'Closed' ORDER BY County, ClosedDate DESC;	california_schools
SELECT s.MailStreet, s.School FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds ORDER BY sat.AvgScrMath DESC LIMIT 1 OFFSET 6;	california_schools
SELECT s.MailStreet, s.School FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds ORDER BY sat.AvgScrRead ASC LIMIT 1;	california_schools
SELECT COUNT(*)  FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds WHERE (sat.AvgScrRead + sat.AvgScrMath + sat.AvgScrWrite) >= 1500   AND s.MailCity = 'Lakeport';	california_schools
SELECT SUM(s.NumTstTakr) FROM satscores s JOIN schools sch ON s.cds = sch.CDSCode WHERE sch.MailCity = 'Fresno';	california_schools
SELECT s.School, s.MailZip FROM schools s WHERE s.AdmLName1 = 'Atoian' AND s.AdmFName1 = 'Avetik';	california_schools
SELECT      CAST(COUNT(CASE WHEN s.County = 'Colusa' THEN 1 END) AS REAL) / COUNT(CASE WHEN s.County = 'Humboldt' THEN 1 END) AS ratio FROM      schools s WHERE      s.MailState = 'CA';	california_schools
SELECT COUNT(*)  FROM schools  WHERE MailState = 'CA'    AND City = 'San Joaquin'    AND StatusType = 'Active';	california_schools
SELECT s.Phone, s.Ext FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds ORDER BY sat.AvgScrWrite DESC LIMIT 1 OFFSET 332	california_schools
SELECT s.Phone, s.Ext, s.School  FROM schools s  WHERE s.Zip = '95203-3704';	california_schools
SELECT Website  FROM schools  WHERE (AdmFName1 = 'Mike' AND AdmLName1 = 'Larson')     OR (AdmFName2 = 'Mike' AND AdmLName2 = 'Larson')     OR (AdmFName3 = 'Mike' AND AdmLName3 = 'Larson')     OR (AdmFName1 = 'Dante' AND AdmLName1 = 'Alvarez')     OR (AdmFName2 = 'Dante' AND AdmLName2 = 'Alvarez')     OR (AdmFName3 = 'Dante' AND AdmLName3 = 'Alvarez');	california_schools
SELECT Website  FROM schools  WHERE Virtual = 'P'    AND Charter = 1    AND County = 'San Joaquin';	california_schools
SELECT COUNT(*)  FROM schools  WHERE City = 'Hickman'    AND DOC = '52'    AND Charter = 1;	california_schools
SELECT COUNT(*)  FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.County = 'Los Angeles'    AND s.Charter = 0    AND (f.`Free Meal Count (K-12)` * 100.0 / f.`Enrollment (K-12)`) < 0.18;	california_schools
SELECT s.School, s.City, s.AdmFName1 || ' ' || s.AdmLName1 AS AdminName1,        s.AdmFName2 || ' ' || s.AdmLName2 AS AdminName2,        s.AdmFName3 || ' ' || s.AdmLName3 AS AdminName3 FROM schools s WHERE s.Charter = 1 AND s.CharterNum = '00D2';	california_schools
SELECT COUNT(*)  FROM schools  WHERE MailCity = 'Hickman' AND CharterNum = '00D4';	california_schools
SELECT      (COUNT(CASE WHEN FundingType = 'Locally Funded' THEN 1 END) * 100.0 / COUNT(*)) AS percentage_locally_funded FROM      schools WHERE      County = 'Santa Clara';	california_schools
SELECT COUNT(*)  FROM schools  WHERE County = 'Stanislaus'    AND FundingType = 'Directly Funded'    AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31';	california_schools
SELECT SUM(CASE WHEN `ClosedDate` LIKE '1989%' AND `City` = 'San Francisco' AND `District Type` = 'Community College District' THEN 1 ELSE 0 END) AS TotalClosures FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode;	california_schools
SELECT County FROM schools WHERE SOC = '11'   AND ClosedDate BETWEEN '1980-01-01' AND '1989-12-31' GROUP BY County ORDER BY COUNT(*) DESC LIMIT 1;	california_schools
SELECT NCESDist  FROM schools  WHERE SOC = '31';	california_schools
SELECT      COUNT(*) AS total_count FROM      schools s WHERE      s.County = 'Alpine'     AND s.School LIKE '%District Community Day%'     AND (s.StatusType = 'Active' OR s.StatusType = 'Closed');	california_schools
SELECT `District Code`  FROM frpm  JOIN schools ON frpm.CDSCode = schools.CDSCode  WHERE schools.Magnet = 0 AND schools.City = 'Fresno'	california_schools
SELECT `Enrollment (Ages 5-17)` FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.School = 'State Special School'   AND schools.City = 'Fremont'   AND frpm.`Academic Year` = '2014-2015';	california_schools
SELECT `FRPM Count (Ages 5-17)`  FROM frpm  JOIN schools ON frpm.CDSCode = schools.CDSCode  WHERE schools.School = 'Youth Authority School' AND schools.MailStreet = 'PO Box 1040';	california_schools
SELECT `Low Grade`  FROM frpm  WHERE `District Code` = 613360    AND `CDSCode` IN (     SELECT `CDSCode`      FROM schools      WHERE `EdOpsCode` = 'SPECON'   );	california_schools
SELECT s.School, f.`Educational Option Type` FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.`County Code` = '37' AND f.`NSLP Provision Status` = 'Breakfast Provision 2';	california_schools
SELECT s.City FROM schools s JOIN frpm f ON s.CDSCode = f.`CDSCode` WHERE s.EILCode = 'HS'   AND f.`Low Grade` = '9'   AND f.`High Grade` = '12'   AND f.`County Name` = 'Merced'   AND f.`NSLP Provision Status` = '2';	california_schools
SELECT      s.School,     (f.`FRPM Count (Ages 5-17)` / f.`Enrollment (Ages 5-17)` * 100) AS `Percent (%) Eligible FRPM (Ages 5-17)` FROM      schools s JOIN      frpm f ON s.CDSCode = f.CDSCode WHERE      s.County = 'Los Angeles'     AND f.`Low Grade` = 'K'     AND f.`High Grade` = '9';	california_schools
SELECT GSserved FROM schools WHERE City = 'Adelanto' GROUP BY GSserved ORDER BY COUNT(*) DESC LIMIT 1;	california_schools
SELECT County, COUNT(*) AS SchoolCount FROM schools WHERE Virtual = 'F' AND County IN ('San Diego', 'Santa Barbara') GROUP BY County ORDER BY SchoolCount DESC LIMIT 1;	california_schools
SELECT s.`School Type`, sch.`School`, sch.`Latitude` FROM `frpm` s JOIN `schools` sch ON s.`CDSCode` = sch.`CDSCode` ORDER BY sch.`Latitude` DESC LIMIT 1;	california_schools
SELECT s.City, fr."Low Grade", s.School FROM schools s JOIN frpm fr ON s.CDSCode = fr.CDSCode WHERE s.State = 'CA' ORDER BY s.Latitude ASC LIMIT 1;	california_schools
SELECT GSoffered FROM schools ORDER BY ABS(Longitude) DESC LIMIT 1;	california_schools
SELECT      s.City,     COUNT(*) AS NumberOfSchools,     SUM(CASE WHEN f.`NSLP Provision Status` = 'Multiple Provision Types' THEN 1 ELSE 0 END) AS SchoolsWithMultipleProvisionTypes FROM      schools s INNER JOIN      frpm f ON s.CDSCode = f.CDSCode WHERE      s.Magnet = 1      AND s.GSoffered LIKE '%K-8%' GROUP BY      s.City;	california_schools
SELECT      AdmFName1,      District,      COUNT(*) as name_count FROM      schools WHERE      AdmFName1 IS NOT NULL GROUP BY      AdmFName1, District ORDER BY      name_count DESC LIMIT 2;	california_schools
SELECT `Percent (%) Eligible Free (K-12)`, `District Code` FROM frpm JOIN schools ON frpm.`CDSCode` = schools.`CDSCode` WHERE schools.`AdmFName1` = 'Alusine' OR schools.`AdmFName2` = 'Alusine' OR schools.`AdmFName3` = 'Alusine';	california_schools
SELECT s.AdmLName1, s.District, s.County, s.School  FROM schools s  WHERE s.CharterNum = '40';	california_schools
SELECT AdmEmail1, AdmEmail2, AdmEmail3 FROM schools WHERE County = 'San Bernardino'   AND District = 'San Bernardino City Unified'   AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31'   AND SOC = '62'   AND DOC = '54';	california_schools
SELECT schools.AdmEmail1, satscores.sname FROM satscores JOIN schools ON satscores.cds = schools.CDSCode ORDER BY satscores.NumGE1500 DESC LIMIT 1;	california_schools
SELECT COUNT(*)  FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.frequency = 'POPLATEK PO OBRATU' AND d.A3 = 'East Bohemia';	financial
SELECT COUNT(*)  FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A3 LIKE '%Prague%' AND a.account_id IN (SELECT DISTINCT account_id FROM loan WHERE status IN ('A', 'C'));	financial
SELECT    CASE      WHEN AVG(A12) > AVG(A13) THEN '1995'     ELSE '1996'   END AS higher_unemployment_year FROM district;	financial
SELECT COUNT(DISTINCT d.district_id)  FROM district d  JOIN client c ON d.district_id = c.district_id  WHERE c.gender = 'F'  GROUP BY d.district_id  HAVING AVG(d.A11) > 6000 AND AVG(d.A11) < 10000;	financial
SELECT COUNT(*)  FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'M'    AND d.A3 = 'North Bohemia'    AND d.A11 > 8000;	financial
SELECT      a.account_id,     (SELECT MAX(A11) FROM district) - (SELECT MIN(A11) FROM district) AS salary_gap FROM      account a JOIN      disp d ON a.account_id = d.account_id JOIN      client c ON d.client_id = c.client_id JOIN      district di ON c.district_id = di.district_id WHERE      c.gender = 'F' ORDER BY      c.birth_date ASC,      di.A11 ASC LIMIT 1;	financial
SELECT a.account_id FROM account a JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id JOIN district di ON c.district_id = di.district_id WHERE c.birth_date = (SELECT MAX(birth_date) FROM client)   AND di.A11 = (SELECT MAX(A11) FROM district);	financial
SELECT COUNT(*)  FROM account a JOIN disp d ON a.account_id = d.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND d.type = 'OWNER';	financial
SELECT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE d.type = 'DISPONENT' AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.status = 'A'   AND strftime('%Y', l.date) = '1997' ORDER BY l.amount ASC LIMIT 1;	financial
SELECT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 12   AND a.date LIKE '1993%'   AND l.amount = (     SELECT MAX(l2.amount)     FROM loan l2     JOIN account a2 ON l2.account_id = a2.account_id     WHERE l2.duration > 12       AND a2.date LIKE '1993%'   );	financial
SELECT COUNT(*)  FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F'    AND c.birth_date < '1950-01-01'    AND d.A2 = 'Sokolov';	financial
SELECT account_id FROM account WHERE date = (     SELECT MIN(date)     FROM account     WHERE strftime('%Y', date) = '1995' );	financial
WITH latest_trans AS (     SELECT          account_id,         balance,         ROW_NUMBER() OVER (PARTITION BY account_id ORDER BY date DESC) AS rn     FROM trans ) SELECT a.account_id FROM account a JOIN latest_trans lt ON a.account_id = lt.account_id WHERE a.date < '1997-01-01'   AND lt.rn = 1   AND lt.balance > 3000;	financial
SELECT client.client_id FROM client JOIN disp ON client.client_id = disp.client_id JOIN card ON disp.disp_id = card.disp_id WHERE card.issued = '1994-03-03';	financial
SELECT a.date  FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.date = '1998-10-14';	financial
SELECT a.district_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.date = '1994-01-05';	financial
SELECT MAX(t.amount)  FROM trans t  JOIN account a ON t.account_id = a.account_id  JOIN disp d ON a.account_id = d.account_id  JOIN card c ON d.disp_id = c.disp_id  WHERE c.issued = '1996-10-21';	financial
SELECT c.gender FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN district dist ON a.district_id = dist.district_id WHERE d.type = 'OWNER'   AND dist.A11 = (SELECT MAX(A11) FROM district) ORDER BY c.birth_date ASC LIMIT 1;	financial
SELECT t.amount FROM trans t JOIN account a ON t.account_id = a.account_id WHERE t.account_id = (     SELECT l.account_id     FROM loan l     ORDER BY l.amount DESC     LIMIT 1 ) AND t.date >= a.date ORDER BY t.date LIMIT 1;	financial
SELECT COUNT(*)  FROM client c JOIN account a ON c.district_id = a.district_id JOIN district d ON c.district_id = d.district_id WHERE d.A2 = 'Jesenik' AND c.gender = 'F';	financial
SELECT d.disp_id FROM disp d JOIN trans t ON d.account_id = t.account_id WHERE t.amount = 5100 AND t.date = '1998-09-02';	financial
SELECT COUNT(*)  FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Litomerice' AND strftime('%Y', a.date) = '1996';	financial
SELECT d.A2 FROM client c JOIN account a ON c.district_id = a.district_id JOIN district d ON a.district_id = d.district_id WHERE c.gender = 'F' AND c.birth_date = '1976-01-29';	financial
SELECT c.birth_date FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN loan l ON a.account_id = l.account_id WHERE l.amount = 98832 AND l.date = '1996-01-03';	financial
SELECT a.account_id FROM account a JOIN district d ON a.district_id = d.district_id JOIN disp ON a.account_id = disp.account_id WHERE d.A3 LIKE 'Praha%' AND disp.type = 'OWNER' ORDER BY a.date LIMIT 1;	financial
SELECT      (COUNT(CASE WHEN c.gender = 'M' THEN 1 END) * 100.0 / COUNT(c.client_id)) AS percentage_male_clients FROM client c JOIN district d ON c.district_id = d.district_id WHERE d.A3 = 'Jihocesky kraj'   AND d.A4 = (     SELECT MAX(A4)     FROM district     WHERE A3 = 'Jihocesky kraj'   );	financial
WITH first_loan AS (     SELECT account_id     FROM loan     ORDER BY date ASC     LIMIT 1 ), balance_1993 AS (     SELECT balance     FROM trans     WHERE account_id = (SELECT account_id FROM first_loan)       AND date <= '1993-03-22'     ORDER BY date DESC     LIMIT 1 ), balance_1998 AS (     SELECT balance     FROM trans     WHERE account_id = (SELECT account_id FROM first_loan)       AND date <= '1998-12-27'     ORDER BY date DESC     LIMIT 1 ) SELECT      CASE          WHEN (SELECT balance FROM balance_1993) IS NOT NULL           AND (SELECT balance FROM balance_1998) IS NOT NULL           AND (SELECT balance FROM balance_1993) > 0         THEN ((SELECT balance FROM balance_1998) - (SELECT balance FROM balance_1993)) * 100.0 / (SELECT balance FROM balance_1993)         ELSE NULL      END AS increase_rate;	financial
SELECT (SUM(CASE WHEN status = 'A' THEN amount ELSE 0 END) * 100.0 / SUM(amount)) AS percentage FROM loan;	financial
SELECT (COUNT(CASE WHEN status = 'C' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM loan WHERE amount < 100000;	financial
SELECT a.account_id, d.A2, d.A3 FROM account a JOIN district d ON a.district_id = d.district_id WHERE strftime('%Y', a.date) = '1993'   AND a.frequency = 'POPLATEK MESICNE';	financial
SELECT a.account_id, a.frequency FROM account a JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id JOIN district dis ON c.district_id = dis.district_id WHERE a.date >= '1995-01-01'    AND a.date < '2001-01-01'   AND d.type = 'OWNER'   AND LOWER(dis.A3) LIKE '%east%bohemia%';	financial
SELECT a.account_id, a.date FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Prachatice';	financial
SELECT d.A2, d.A3  FROM district d  JOIN account a ON d.district_id = a.district_id  JOIN loan l ON a.account_id = l.account_id  WHERE l.loan_id = 4990;	financial
SELECT a.account_id, d.A2 AS district, d.A3 AS region FROM account a JOIN loan l ON a.account_id = l.account_id JOIN district d ON a.district_id = d.district_id WHERE l.amount > 300000;	financial
SELECT l.loan_id, d.A3, d.A11 FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.duration = 60;	financial
SELECT      d.A2 AS district,     d.A3 AS state,     ((d.A13 - d.A12) / d.A12) * 100 AS unemployment_increment_rate_percentage FROM      loan l JOIN      account a ON l.account_id = a.account_id JOIN      district d ON a.district_id = d.district_id WHERE      l.status = 'D';	financial
SELECT      ROUND(         CAST(SUM(CASE WHEN UPPER(TRIM(d.A2)) = 'DECIN' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*),         2     ) FROM account a JOIN district d ON a.district_id = d.district_id WHERE strftime('%Y', a.date) = '1993';	financial
SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE';	financial
SELECT A2, COUNT(*) AS female_count FROM district JOIN account ON district.district_id = account.district_id JOIN disp ON account.account_id = disp.account_id JOIN client ON disp.client_id = client.client_id WHERE client.gender = 'F' GROUP BY A2 ORDER BY female_count DESC LIMIT 9;	financial
SELECT d.A2, t.amount FROM trans t JOIN account a ON t.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE t.type = 'VYDAJ' AND t.date LIKE '1996-01%' ORDER BY t.amount DESC LIMIT 10;	financial
SELECT COUNT(*)  FROM client c JOIN account a ON c.client_id = a.district_id LEFT JOIN disp d ON c.client_id = d.client_id AND d.type = 'OWNER' LEFT JOIN card ca ON d.disp_id = ca.disp_id JOIN district di ON c.district_id = di.district_id WHERE di.A3 = 'South Bohemia' AND ca.card_id IS NULL;	financial
SELECT d.A3 FROM district d JOIN account a ON d.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.status IN ('C', 'D') ORDER BY l.amount DESC LIMIT 1;	financial
SELECT AVG(l.amount)  FROM loan l  JOIN account a ON l.account_id = a.account_id  JOIN disp d ON a.account_id = d.account_id  JOIN client c ON d.client_id = c.client_id  WHERE c.gender = 'M';	financial
SELECT A2, A3 FROM district ORDER BY A13 DESC;	financial
SELECT COUNT(*)  FROM account  JOIN district ON account.district_id = district.district_id  WHERE district.A16 = (SELECT MAX(A16) FROM district)	financial
SELECT COUNT(*)  FROM account a JOIN trans t ON a.account_id = t.account_id WHERE t.operation = 'VYBER KARTOU'    AND a.frequency = 'POPLATEK MESICNE'   AND t.balance < 0;	financial
SELECT COUNT(*)  FROM loan l JOIN account a ON l.account_id = a.account_id WHERE l.date BETWEEN '1995-01-01' AND '1997-12-31'   AND l.amount >= 250000   AND a.frequency = 'POPLATEK MESICNE';	financial
SELECT COUNT(*)  FROM loan  WHERE status IN ('C', 'D')    AND account_id IN (     SELECT account_id      FROM account      WHERE district_id = 1   );	financial
SELECT COUNT(*)  FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'M'    AND d.district_id = (     SELECT district_id      FROM district      WHERE A15 IS NOT NULL      ORDER BY A15 DESC      LIMIT 1 OFFSET 1   );	financial
SELECT COUNT(*)  FROM card c JOIN disp d ON c.disp_id = d.disp_id WHERE c.type = 'gold' AND d.type = 'OWNER';	financial
SELECT COUNT(*) FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Pisek';	financial
SELECT DISTINCT d.A2 FROM district d JOIN account a ON d.district_id = a.district_id JOIN trans t ON a.account_id = t.trans_id WHERE t.amount > 10000   AND strftime('%Y', t.date) = '1997';	financial
SELECT DISTINCT a.account_id FROM account a JOIN `order` o ON a.account_id = o.account_id JOIN district d ON a.district_id = d.district_id WHERE o.k_symbol = 'SIPO' AND d.A2 = 'Pisek';	financial
SELECT DISTINCT a.account_id FROM account a JOIN disp d ON a.account_id = d.account_id JOIN card c ON d.disp_id = c.disp_id WHERE c.type = 'gold';	financial
SELECT AVG(t.amount) FROM trans t WHERE t.operation = 'VYBER KARTOU'   AND strftime('%Y', t.date) = '2021';	financial
SELECT DISTINCT a.account_id FROM account a JOIN trans t ON a.account_id = t.account_id WHERE t.operation = 'VYBER KARTOU'   AND strftime('%Y', t.date) = '1998'   AND t.amount < (     SELECT AVG(amount)     FROM trans     WHERE operation = 'VYBER KARTOU'       AND strftime('%Y', date) = '1998'   );	financial
SELECT DISTINCT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card ca ON d.disp_id = ca.disp_id JOIN loan l ON d.account_id = l.account_id WHERE c.gender = 'F' AND d.type = 'OWNER';	financial
SELECT COUNT(*) FROM account a JOIN disp dsp ON a.account_id = dsp.account_id JOIN client c ON dsp.client_id = c.client_id JOIN district dst ON c.district_id = dst.district_id WHERE c.gender = 'F'   AND dst.A3 = 'south Bohemia';	financial
SELECT a.account_id FROM account a JOIN district d ON a.district_id = d.district_id JOIN disp dp ON a.account_id = dp.account_id WHERE d.A2 = 'Tabor'   AND dp.type = 'OWNER';	financial
SELECT DISTINCT d.type FROM disp d JOIN account a ON d.account_id = a.account_id JOIN district dis ON a.district_id = dis.district_id WHERE dis.A11 > 8000 AND dis.A11 <= 9000   AND d.type != 'OWNER';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN district d ON a.district_id = d.district_id JOIN trans t ON a.account_id = t.account_id WHERE d.A3 = 'North Bohemia' AND t.bank = 'AB';	financial
SELECT DISTINCT d.A2 FROM district d JOIN account a ON d.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id WHERE t.type = 'VYDAJ';	financial
SELECT AVG(A15)  FROM district  WHERE A15 > 4000    AND district_id IN (     SELECT district_id      FROM account      WHERE CAST(strftime('%Y', date) AS INTEGER) >= 1997   );	financial
SELECT COUNT(*)  FROM card c JOIN disp d ON c.disp_id = d.disp_id JOIN account a ON d.account_id = a.account_id WHERE c.type = 'classic' AND d.type = 'OWNER';	financial
SELECT COUNT(*)  FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'M' AND d.A2 = 'Hl.m. Praha';	financial
SELECT (COUNT(CASE WHEN type = 'gold' AND issued < '1998-01-01' THEN 1 END) * 100.0 / COUNT(*)) FROM card;	financial
SELECT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN loan l ON a.account_id = l.account_id WHERE d.type = 'OWNER' ORDER BY l.amount DESC LIMIT 1;	financial
SELECT d.A15  FROM district d  JOIN account a ON d.district_id = a.district_id  WHERE a.account_id = 532;	financial
SELECT account.district_id FROM account JOIN `order` ON account.account_id = `order`.account_id WHERE `order`.order_id = 33333;	financial
SELECT * FROM trans WHERE account_id IN (SELECT account_id FROM disp WHERE client_id = 3356) AND operation = 'VYBER';	financial
SELECT COUNT(*)  FROM account a JOIN loan l ON a.account_id = l.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND l.amount < 200000;	financial
SELECT c.type FROM card c JOIN disp d ON c.disp_id = d.disp_id WHERE d.client_id = 13539;	financial
SELECT A3 FROM district WHERE district_id = (SELECT district_id FROM client WHERE client_id = 3541);	financial
SELECT district_id FROM account JOIN loan ON account.account_id = loan.account_id WHERE loan.status = 'A' GROUP BY district_id ORDER BY COUNT(*) DESC LIMIT 1;	financial
SELECT c.client_id  FROM client c  JOIN disp d ON c.client_id = d.client_id  JOIN account a ON d.account_id = a.account_id  JOIN `order` o ON a.account_id = o.account_id  WHERE o.order_id = 32423;	financial
SELECT t.* FROM trans t JOIN account a ON t.account_id = a.account_id WHERE a.district_id = 5;	financial
SELECT COUNT(*)  FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Jesenik';	financial
SELECT client.client_id FROM client JOIN disp ON client.client_id = disp.client_id JOIN card ON disp.disp_id = card.disp_id WHERE card.type = 'junior' AND card.issued >= '1997-01-01';	financial
SELECT      (COUNT(CASE WHEN c.gender = 'F' THEN 1 END) * 100.0 / COUNT(*)) AS percentage_women FROM client c JOIN account a ON c.district_id = a.district_id JOIN district d ON c.district_id = d.district_id WHERE d.A11 > 10000;	financial
SELECT      ((SUM(CASE WHEN strftime('%Y', l.date) = '1997' THEN l.amount ELSE 0 END) -        SUM(CASE WHEN strftime('%Y', l.date) = '1996' THEN l.amount ELSE 0 END)) * 100.0 /       NULLIF(SUM(CASE WHEN strftime('%Y', l.date) = '1996' THEN l.amount ELSE 0 END), 0)     ) AS growth_rate FROM loan l JOIN account a ON l.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id WHERE c.gender = 'M'   AND d.type = 'OWNER';	financial
SELECT COUNT(*)  FROM trans  WHERE operation = 'VYBER KARTOU'    AND date > '1995-12-31';	financial
SELECT      SUM(CASE WHEN A3 = 'NORTH BOHEMIA' THEN A16 ELSE 0 END) - SUM(CASE WHEN A3 = 'EAST BOHEMIA' THEN A16 ELSE 0 END) FROM district;	financial
SELECT COUNT(*)  FROM disp  WHERE account_id BETWEEN 1 AND 10;	financial
SELECT a.frequency, t.k_symbol FROM account a JOIN trans t ON a.account_id = t.account_id WHERE a.account_id = 3   AND t.amount = 3539   AND t.type = 'VYDAJ';	financial
SELECT strftime('%Y', c.birth_date) FROM client c JOIN disp d ON c.client_id = d.client_id WHERE c.client_id = 130 AND d.type = 'OWNER';	financial
SELECT COUNT(*)  FROM account a JOIN disp d ON a.account_id = d.account_id WHERE d.type = 'OWNER' AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT l.amount, l.payments, l.status  FROM loan l  JOIN account a ON l.account_id = a.account_id  JOIN disp d ON a.account_id = d.account_id  WHERE d.client_id = 992;	financial
SELECT t.balance, c.gender  FROM trans t  JOIN account a ON t.account_id = a.account_id  JOIN disp d ON a.account_id = d.account_id  JOIN client c ON d.client_id = c.client_id  WHERE t.trans_id = 851 AND c.client_id = 4;	financial
SELECT card.type FROM card JOIN disp ON card.disp_id = disp.disp_id WHERE disp.client_id = 9;	financial
SELECT COALESCE(SUM(t.amount), 0) + COALESCE(SUM(o.amount), 0) FROM disp d LEFT JOIN trans t ON d.account_id = t.account_id AND t.type = 'VYDAJ' AND strftime('%Y', t.date) = '1998' LEFT JOIN order o ON d.account_id = o.account_id AND strftime('%Y', o.date) = '1998' WHERE d.client_id = 617;	financial
SELECT c.client_id FROM client c JOIN account a ON c.district_id = a.district_id JOIN district d ON c.district_id = d.district_id WHERE c.birth_date BETWEEN '1983-01-01' AND '1987-12-31'   AND d.A3 = 'East Bohemia';	financial
SELECT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN loan l ON d.account_id = l.account_id WHERE c.gender = 'F' ORDER BY l.amount DESC LIMIT 3;	financial
SELECT COUNT(*)  FROM client c JOIN "order" o ON c.client_id = (     SELECT d.client_id      FROM disp d      WHERE d.account_id = o.account_id      AND d.type = 'OWNER' ) WHERE c.gender = 'M'  AND c.birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND o.k_symbol = 'SIPO' AND o.amount > 4000;	financial
SELECT COUNT(*)  FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Beroun' AND a.date > '1996-12-31';	financial
SELECT COUNT(*)  FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card ca ON d.disp_id = ca.disp_id WHERE c.gender = 'F' AND ca.type = 'junior';	financial
SELECT      CAST(SUM(CASE WHEN c.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM client c JOIN account a ON c.district_id = a.district_id JOIN district d ON a.district_id = d.district_id WHERE d.A3 LIKE '%Prague%';	financial
SELECT (COUNT(CASE WHEN c.gender = 'M' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM account a JOIN client c ON a.district_id = c.district_id WHERE a.frequency = 'POPLATEK TYDNE';	financial
SELECT COUNT(*)  FROM account a JOIN disp d ON a.account_id = d.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND d.type = 'OWNER';	financial
SELECT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 24   AND a.date < '1997-01-01' ORDER BY l.amount ASC LIMIT 1;	financial
SELECT a.account_id FROM account a JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id JOIN district di ON c.district_id = di.district_id WHERE c.gender = 'F' ORDER BY c.birth_date ASC, di.A11 ASC LIMIT 1;	financial
SELECT COUNT(*)  FROM client c JOIN district d ON c.district_id = d.district_id WHERE strftime('%Y', c.birth_date) = '1920'   AND (LOWER(d.A3) LIKE '%east%bohemia%' OR LOWER(d.A3) LIKE '%bohemia%east%' OR LOWER(d.A3) = 'east bohemia');	financial
SELECT COUNT(*)  FROM loan l JOIN account a ON l.account_id = a.account_id WHERE l.duration = 24 AND l.status = 'A' AND a.frequency = 'POPLATEK TYDNE';	financial
SELECT AVG(l.amount)  FROM loan l JOIN account a ON l.account_id = a.account_id WHERE l.status IN ('C', 'D')    AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT c.client_id, c.district_id FROM client c JOIN disp d ON c.client_id = d.client_id WHERE d.type = 'OWNER';	financial
SELECT c.client_id, (CAST(strftime('%Y', 'now') AS INTEGER) - CAST(strftime('%Y', c.birth_date) AS INTEGER)) AS age FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card ca ON d.disp_id = ca.disp_id WHERE ca.type = 'gold' AND d.type = 'OWNER';	financial
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY COUNT(bond_type) DESC LIMIT 1;	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '-' AND a.element = 'cl';	toxicology
SELECT AVG(oxygen_count)  FROM (     SELECT m.molecule_id, COUNT(CASE WHEN a.element = 'o' THEN 1 END) AS oxygen_count     FROM molecule m     JOIN atom a ON m.molecule_id = a.molecule_id     WHERE m.molecule_id IN (         SELECT molecule_id         FROM bond         GROUP BY molecule_id         HAVING COUNT(CASE WHEN bond_type != '-' THEN 1 END) = 0     )     GROUP BY m.molecule_id ) t;	toxicology
SELECT      CAST(SUM(CASE WHEN b.bond_type = '-' THEN 1 ELSE 0 END) AS FLOAT) / (         SELECT COUNT(*) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+'     ) AS average_single_bonded_carcinogenic FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.label = '+';	toxicology
SELECT COUNT(*)  FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'na' AND m.label = '-';	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '#' AND m.label = '+';	toxicology
SELECT      CAST(SUM(CASE WHEN a.element = 'c' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) AS carbon_percentage FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN atom a ON c.atom_id = a.atom_id WHERE b.bond_type = '=';	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '#';	toxicology
SELECT COUNT(*) FROM atom WHERE element != 'br';	toxicology
SELECT COUNT(*)  FROM molecule  WHERE molecule_id BETWEEN 'TR000' AND 'TR099'    AND label = '+';	toxicology
SELECT DISTINCT molecule_id FROM atom WHERE element = 'c';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR004_8_9';	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '=';	toxicology
SELECT label FROM molecule WHERE molecule_id IN (     SELECT molecule_id     FROM atom     WHERE element = 'h' ) GROUP BY label ORDER BY COUNT(*) DESC LIMIT 1;	toxicology
SELECT DISTINCT b.bond_type FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id WHERE a.element = 'cl' UNION SELECT DISTINCT b.bond_type FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id2 = a.atom_id WHERE a.element = 'cl';	toxicology
SELECT c.atom_id, c.atom_id2  FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-';	toxicology
SELECT a.atom_id, a2.atom_id AS connected_atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '-';	toxicology
SELECT element FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '-' GROUP BY element ORDER BY COUNT(element) ASC LIMIT 1;	toxicology
SELECT b.bond_type FROM bond b JOIN connected c ON b.bond_id = c.bond_id WHERE (c.atom_id = 'TR004_8' AND c.atom_id2 = 'TR004_20')    OR (c.atom_id = 'TR004_20' AND c.atom_id2 = 'TR004_8');	toxicology
SELECT DISTINCT label  FROM molecule WHERE label IS NOT NULL;	toxicology
SELECT COUNT(DISTINCT a.atom_id)  FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element IN ('i', 's') AND b.bond_type = '-';	toxicology
SELECT c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#';	toxicology
SELECT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE a.molecule_id = 'TR181';	toxicology
SELECT 100.0 - (COUNT(DISTINCT CASE WHEN a.element = 'f' THEN a.molecule_id END) * 100.0 / COUNT(DISTINCT m.molecule_id)) AS pct_no_fluorine FROM molecule m  LEFT JOIN atom a ON m.molecule_id = a.molecule_id  WHERE m.label = '+';	toxicology
SELECT      (SUM(CASE WHEN b.bond_type = '#' THEN 1 ELSE 0 END) * 100.0) / COUNT(b.bond_id) AS percent FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.label = '+';	toxicology
SELECT element FROM (     SELECT element     FROM atom     WHERE molecule_id = 'TR000'     GROUP BY element     ORDER BY COUNT(*) DESC     LIMIT 3 ) AS top_elements ORDER BY element;	toxicology
SELECT atom_id, atom_id2 FROM connected WHERE bond_id = 'TR001_2_6';	toxicology
SELECT SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN label = '-' THEN 1 ELSE 0 END) FROM molecule;	toxicology
SELECT atom_id, atom_id2 FROM connected WHERE bond_id = 'TR000_2_5';	toxicology
SELECT bond_id FROM connected WHERE atom_id2 = 'TR000_2';	toxicology
SELECT DISTINCT molecule_id  FROM bond  WHERE bond_type = '='  ORDER BY molecule_id  LIMIT 5;	toxicology
SELECT COALESCE(ROUND(CAST(SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) AS FLOAT) * 100 / NULLIF(COUNT(bond_id), 0), 5), 0.00000) AS percent FROM bond WHERE molecule_id = 'TR008';	toxicology
SELECT ROUND(CAST(SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(molecule_id), 3) AS percent FROM molecule;	toxicology
SELECT      CASE          WHEN COUNT(atom_id) > 0          THEN ROUND(CAST(SUM(CASE WHEN element = 'h' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(atom_id), 4)         ELSE NULL      END AS percent  FROM atom  WHERE molecule_id = 'TR206';	toxicology
SELECT bond_type FROM bond WHERE molecule_id = 'TR000';	toxicology
SELECT a.element, m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR006';	toxicology
SELECT 'No such molecule' AS bond_type, 'No such molecule' AS label;	toxicology
SELECT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.label = '-' AND b.bond_type = '-' ORDER BY m.molecule_id LIMIT 3;	toxicology
SELECT b.bond_id FROM bond b WHERE b.molecule_id = 'TR006' ORDER BY b.bond_id ASC LIMIT 2;	toxicology
SELECT COUNT(*)  FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.molecule_id = 'TR009'    AND (c.atom_id = 'TR009_12' OR c.atom_id2 = 'TR009_12');	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE m.label = '+' AND a.element = 'br';	toxicology
SELECT b.bond_type, c.atom_id, c.atom_id2  FROM bond b  JOIN connected c ON b.bond_id = c.bond_id  WHERE b.bond_id = 'TR001_6_9';	toxicology
SELECT m.molecule_id,         CASE WHEN m.label = '+' THEN 'carcinogenic' ELSE 'not carcinogenic' END AS carcinogenic_status FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR001_10';	toxicology
SELECT COUNT(DISTINCT molecule_id) FROM bond WHERE bond_type = '#';	toxicology
SELECT COUNT(*) FROM connected WHERE atom_id LIKE 'TR%_19' OR atom_id2 LIKE 'TR%_19';	toxicology
SELECT a.element FROM atom a WHERE a.molecule_id = 'TR004';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '-';	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE SUBSTR(a.atom_id, 7, 2) BETWEEN '21' AND '25'   AND m.label = '+';	toxicology
SELECT b.bond_id, b.molecule_id, b.bond_type FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE (a1.element = 'p' AND a2.element = 'n') OR (a1.element = 'n' AND a2.element = 'p');	toxicology
SELECT m.label = '+' AS is_carcinogenic FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '=' GROUP BY m.molecule_id, m.label ORDER BY COUNT(b.bond_id) DESC LIMIT 1;	toxicology
SELECT CAST(SUM(bond_count) AS FLOAT) / COUNT(*)  FROM (     SELECT a.atom_id, COUNT(DISTINCT c.bond_id) AS bond_count     FROM atom a     LEFT JOIN connected c ON a.atom_id = c.atom_id     WHERE a.element = 'i'     GROUP BY a.atom_id ) AS iodine_atoms;	toxicology
SELECT b.bond_type, b.bond_id FROM bond b JOIN connected c ON b.bond_id = c.bond_id WHERE CAST(SUBSTR(c.atom_id, 7) AS INTEGER) = 45     OR CAST(SUBSTR(c.atom_id2, 7) AS INTEGER) = 45;	toxicology
SELECT element FROM atom WHERE atom_id NOT IN (SELECT atom_id FROM connected) AND atom_id NOT IN (SELECT atom_id2 FROM connected);	toxicology
SELECT a.atom_id FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id JOIN connected c ON b.bond_id = c.bond_id WHERE a.molecule_id = 'TR041' AND b.bond_type = '#' AND (c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id);	toxicology
SELECT a.element FROM atom a WHERE a.atom_id IN (     SELECT c.atom_id FROM connected c WHERE c.bond_id = 'TR144_8_19'     UNION     SELECT c.atom_id2 FROM connected c WHERE c.bond_id = 'TR144_8_19' );	toxicology
SELECT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.label = '+' AND b.bond_type = '=' GROUP BY m.molecule_id ORDER BY COUNT(b.bond_id) DESC LIMIT 1;	toxicology
SELECT element FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '+' GROUP BY element ORDER BY COUNT(*) ASC LIMIT 1;	toxicology
SELECT c.atom_id2  FROM connected c  JOIN atom a ON c.atom_id = a.atom_id  WHERE a.element = 'pb' UNION SELECT c.atom_id  FROM connected c  JOIN atom a ON c.atom_id2 = a.atom_id  WHERE a.element = 'pb';	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#';	toxicology
SELECT      CAST(MAX(freq_count) AS FLOAT) * 100 / (SELECT COUNT(*) FROM bond) AS percentage FROM (     SELECT          CASE WHEN a1.element <= a2.element THEN a1.element ELSE a2.element END AS elem1,         CASE WHEN a1.element <= a2.element THEN a2.element ELSE a1.element END AS elem2,         COUNT(*) AS freq_count     FROM          connected c         INNER JOIN atom a1 ON c.atom_id = a1.atom_id         INNER JOIN atom a2 ON c.atom_id2 = a2.atom_id     WHERE          a1.atom_id < a2.atom_id OR (a1.atom_id, a2.atom_id) IN (             SELECT MIN(atom_id), MAX(atom_id)             FROM connected             GROUP BY bond_id         )     GROUP BY          CASE WHEN a1.element <= a2.element THEN a1.element ELSE a2.element END,         CASE WHEN a1.element <= a2.element THEN a2.element ELSE a1.element END ) AS subquery;	toxicology
SELECT ROUND(CAST(SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(b.bond_id), 5)  FROM bond b  JOIN molecule m ON b.molecule_id = m.molecule_id  WHERE b.bond_type = '-';	toxicology
SELECT COUNT(*)  FROM atom  WHERE element IN ('c', 'h');	toxicology
SELECT c.atom_id2 FROM connected c JOIN atom a ON c.atom_id = a.atom_id WHERE a.element = 's';	toxicology
SELECT DISTINCT b.bond_type FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'sn';	toxicology
SELECT COUNT(DISTINCT a.element) FROM atom a WHERE a.molecule_id IN (     SELECT molecule_id     FROM bond     GROUP BY molecule_id     HAVING COUNT(*) = SUM(CASE WHEN bond_type = '-' THEN 1 ELSE 0 END) );	toxicology
SELECT COUNT(*)  FROM atom a WHERE a.molecule_id IN (     SELECT b.molecule_id     FROM bond b     WHERE b.bond_type = '#' ) AND a.molecule_id IN (     SELECT a2.molecule_id     FROM atom a2     WHERE a2.element IN ('p', 'br') );	toxicology
SELECT bond_id FROM bond WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+');	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '-' AND m.label = '-';	toxicology
SELECT      CAST(SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(a.atom_id) AS percent FROM atom a WHERE a.molecule_id IN (     SELECT molecule_id      FROM bond      WHERE bond_type = '-' );	toxicology
SELECT label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002');	toxicology
SELECT molecule_id FROM molecule WHERE label = '-';	toxicology
SELECT COUNT(*)  FROM molecule  WHERE molecule_id BETWEEN 'TR000' AND 'TR030'    AND label = '+';	toxicology
SELECT b.bond_type FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.molecule_id >= 'TR000' AND m.molecule_id <= 'TR050';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id IN (c.atom_id, c.atom_id2) WHERE c.bond_id = 'TR001_10_11';	toxicology
SELECT COUNT(DISTINCT c.bond_id) FROM connected c JOIN atom a ON (c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id) WHERE a.element = 'i';	toxicology
SELECT label FROM molecule WHERE molecule_id IN (     SELECT DISTINCT molecule_id     FROM atom     WHERE element = 'ca' ) GROUP BY label ORDER BY COUNT(*) DESC LIMIT 1;	toxicology
SELECT CASE WHEN EXISTS (     SELECT 1     FROM connected c     JOIN bond b ON c.bond_id = b.bond_id     JOIN atom a1 ON c.atom_id = a1.atom_id     JOIN atom a2 ON c.atom_id2 = a2.atom_id     WHERE b.bond_id = 'TR001_1_8'       AND ((a1.element = 'c' AND a2.element = 'cl') OR (a1.element = 'cl' AND a2.element = 'c')) ) THEN 'Yes' ELSE 'No' END;	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON (c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id) WHERE b.bond_type = '='    AND a.element = 'c'   AND m.label = '-' LIMIT 2;	toxicology
SELECT CAST(SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) AS percentage FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+';	toxicology
SELECT a.element FROM atom a WHERE a.molecule_id = 'TR001';	toxicology
SELECT molecule_id FROM bond WHERE bond_type = '=';	toxicology
SELECT c.atom_id, c.atom_id2  FROM connected c  JOIN bond b ON c.bond_id = b.bond_id  WHERE b.bond_type = '#';	toxicology
SELECT m.label FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_id = 'TR000_1_2';	toxicology
SELECT COUNT(*)  FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.label = '-' AND b.bond_type = '-';	toxicology
SELECT m.label FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_id = 'TR001_10_11';	toxicology
SELECT b.bond_id, m.label  FROM bond b  JOIN molecule m ON b.molecule_id = m.molecule_id  WHERE b.bond_type = '#';	toxicology
SELECT element  FROM atom  WHERE substr(atom_id, 7, 1) = '4'    AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+');	toxicology
SELECT      CAST(SUM(CASE WHEN a.element = 'h' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(a.element) AS ratio,     m.label FROM molecule m LEFT JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.molecule_id = 'TR006' GROUP BY m.molecule_id, m.label;	toxicology
SELECT m.label  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE a.element = 'ca';	toxicology
SELECT DISTINCT b.bond_type FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON (c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id) WHERE a.element = 'c';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE c.bond_id = 'TR001_10_11'  UNION  SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id2 WHERE c.bond_id = 'TR001_10_11';	toxicology
SELECT (COUNT(CASE WHEN b.bond_type = '#' THEN 1 END) * 100.0 / COUNT(DISTINCT m.molecule_id)) AS percentage FROM molecule m LEFT JOIN bond b ON m.molecule_id = b.molecule_id;	toxicology
SELECT      CAST(SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) AS FLOAT) * 100.0 / NULLIF(COUNT(*), 0) AS percent FROM bond WHERE molecule_id = 'TR047';	toxicology
SELECT label FROM molecule WHERE molecule_id = (SELECT molecule_id FROM atom WHERE atom_id = 'TR001_1');	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR151';	toxicology
SELECT DISTINCT element FROM atom WHERE molecule_id = 'TR151';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+';	toxicology
SELECT atom_id, molecule_id, element FROM atom WHERE element = 'c'   AND molecule_id >= 'TR010'   AND molecule_id <= 'TR050';	toxicology
SELECT COUNT(*)  FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+';	toxicology
SELECT bond_id FROM bond WHERE bond_type = '=' AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+');	toxicology
SELECT COUNT(*)  FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'h' AND m.label = '+';	toxicology
SELECT molecule_id FROM bond WHERE bond_id = 'TR000_1_2';	toxicology
SELECT a.atom_id, 1.0 AS node_scores FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c' AND m.label = '-';	toxicology
SELECT    CAST(SUM(CASE      WHEN m.label = '+' AND EXISTS (       SELECT 1 FROM atom a WHERE a.molecule_id = m.molecule_id AND a.element = 'h'     ) THEN 1 ELSE 0    END) AS FLOAT) * 100.0 / COUNT(*) AS percentage FROM molecule m;	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR124';	toxicology
SELECT a.atom_id, a.element FROM atom a WHERE a.molecule_id = 'TR186';	toxicology
SELECT bond_type FROM bond WHERE bond_id = 'TR007_4_19';	toxicology
SELECT a.element FROM atom a WHERE a.atom_id IN (     SELECT atom_id FROM connected WHERE bond_id = 'TR000_2_4'     UNION     SELECT atom_id2 FROM connected WHERE bond_id = 'TR000_2_4' );	toxicology
SELECT COUNT(b.bond_id) AS double_bond_count, m.label = '+' AS is_carcinogenic FROM molecule m LEFT JOIN bond b ON m.molecule_id = b.molecule_id AND b.bond_type = '=' WHERE m.molecule_id = 'TR006' GROUP BY m.molecule_id, m.label;	toxicology
SELECT m.molecule_id, a.element FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+';	toxicology
SELECT b.bond_id, c.atom_id, c.atom_id2 FROM bond b JOIN connected c ON b.bond_id = c.bond_id WHERE b.bond_type = '-';	toxicology
SELECT DISTINCT m.molecule_id, a.element FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.molecule_id IN (     SELECT DISTINCT b.molecule_id     FROM bond b     WHERE b.bond_type = '#' ) ORDER BY m.molecule_id, a.element;	toxicology
SELECT a.element FROM atom a JOIN connected c ON (a.atom_id = c.atom_id OR a.atom_id = c.atom_id2) WHERE c.bond_id = 'TR000_2_3';	toxicology
SELECT COUNT(DISTINCT c.bond_id) FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE a1.element = 'cl' OR a2.element = 'cl';	toxicology
SELECT a.atom_id, COUNT(b.bond_type)  FROM atom a  LEFT JOIN bond b ON a.molecule_id = b.molecule_id  WHERE a.molecule_id = 'TR346'  GROUP BY a.atom_id;	toxicology
SELECT      COUNT(DISTINCT b.molecule_id) AS molecule_count,     SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) AS carcinogenic_count FROM      bond b JOIN      molecule m ON b.molecule_id = m.molecule_id WHERE      b.bond_type = '=';	toxicology
SELECT COUNT(*)  FROM molecule m  WHERE NOT EXISTS (     SELECT 1 FROM atom a      WHERE a.molecule_id = m.molecule_id AND a.element = 's' ) AND NOT EXISTS (     SELECT 1 FROM bond b      WHERE b.molecule_id = m.molecule_id AND b.bond_type = '=' );	toxicology
SELECT m.label FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_id = 'TR001_10_11';	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR001';	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '-';	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'cl' AND m.label = '+';	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'c' AND m.label = '-';	toxicology
SELECT      CAST(SUM(CASE          WHEN m.label = '+' AND EXISTS (             SELECT 1 FROM atom a WHERE a.molecule_id = m.molecule_id AND a.element = 'cl'         ) THEN 1 ELSE 0 END) AS FLOAT) * 100 /      NULLIF(SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END), 0) AS percentage FROM molecule m;	toxicology
SELECT molecule_id FROM bond WHERE bond_id = 'TR001_1_7';	toxicology
SELECT COUNT(*) FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE c.bond_id = 'TR001_3_4';	toxicology
SELECT b.bond_type  FROM bond b JOIN connected c ON b.bond_id = c.bond_id WHERE (c.atom_id = 'TR000_1' AND c.atom_id2 = 'TR000_2')     OR (c.atom_id = 'TR000_2' AND c.atom_id2 = 'TR000_1');	toxicology
SELECT molecule_id FROM atom WHERE atom_id = 'TR000_2' AND molecule_id IN (SELECT molecule_id FROM atom WHERE atom_id = 'TR000_4');	toxicology
SELECT element FROM atom WHERE atom_id = 'TR000_1';	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR000';	toxicology
SELECT CAST(SUM(CASE WHEN bond_type = '-' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(bond_id) AS percentage FROM bond;	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE m.label = '+' AND a.element = 'n';	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN connected c ON (a.atom_id = c.atom_id OR a.atom_id = c.atom_id2) JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 's' AND b.bond_type = '=';	toxicology
SELECT molecule_id FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-') GROUP BY molecule_id HAVING COUNT(atom_id) > 5;	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON (a.atom_id = c.atom_id OR a.atom_id = c.atom_id2) JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '='    AND b.molecule_id = 'TR001';	toxicology
SELECT molecule_id  FROM atom  WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+')  GROUP BY molecule_id  ORDER BY COUNT(atom_id) DESC  LIMIT 1;	toxicology
SELECT      CASE          WHEN COUNT(*) = 0 THEN 0.0         ELSE COUNT(CASE WHEN m.label = '+' THEN 1 END) * 100.0 / COUNT(*)     END AS percentage FROM molecule m WHERE m.molecule_id IN (     SELECT DISTINCT a.molecule_id     FROM atom a     JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2     JOIN bond b ON c.bond_id = b.bond_id     WHERE a.element = 'h' AND b.bond_type = '#' );	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+';	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.molecule_id BETWEEN 'TR004' AND 'TR010'   AND b.bond_type = '-';	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR008' AND element = 'c';	toxicology
SELECT a.element FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR004_7' AND m.label = '-';	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'o' AND b.bond_type = '=';	toxicology
SELECT COUNT(*)  FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '#' AND m.label = '-';	toxicology
SELECT a.element, b.bond_type FROM molecule m LEFT JOIN atom a ON m.molecule_id = a.molecule_id LEFT JOIN connected c ON a.atom_id = c.atom_id LEFT JOIN bond b ON c.bond_id = b.bond_id WHERE m.molecule_id = 'TR002';	toxicology
SELECT a.atom_id  FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.molecule_id = 'TR001'    AND a.element = 'c'    AND b.bond_type = '=';	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' AND a.element = 'o';	toxicology
SELECT * FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT * FROM cards WHERE borderColor = 'borderless' AND cardKingdomFoilId IS NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT name FROM cards WHERE faceConvertedManaCost = (     SELECT MAX(faceConvertedManaCost)     FROM cards );	card_games
SELECT name  FROM cards  WHERE frameVersion = '2015'    AND edhrecRank < 100;	card_games
SELECT c.* FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'mythic'   AND l.format = 'gladiator'   AND l.status = 'Banned';	card_games
SELECT l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.types LIKE '%Artifact%'   AND c.side IS NULL   AND l.format = 'vintage';	card_games
SELECT c.id, c.artist FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE (c.power = '*' OR c.power IS NULL)   AND l.format = 'commander'   AND l.status = 'Legal';	card_games
SELECT c.id, r.text, c.hasContentWarning FROM cards c LEFT JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Stephen Daniele';	card_games
SELECT r.text FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.name = 'Sublime Epiphany' AND c.number = '74s';	card_games
SELECT c.name, c.artist, c.isPromo FROM cards c INNER JOIN (     SELECT uuid     FROM rulings     GROUP BY uuid     ORDER BY COUNT(id) DESC     LIMIT 1 ) AS top_ruled ON c.uuid = top_ruled.uuid;	card_games
SELECT DISTINCT fd.language FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE LOWER(c.name) = 'annul' AND c.number = '29';	card_games
SELECT DISTINCT c.name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Japanese';	card_games
SELECT      (SELECT COUNT(DISTINCT uuid) FROM foreign_data WHERE language = 'Chinese Simplified') * 100.0 /      (SELECT COUNT(*) FROM cards) AS percentage;	card_games
SELECT st.translation, s.totalSetSize FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE st.language = 'Italian';	card_games
SELECT COUNT(DISTINCT type)  FROM cards  WHERE artist = 'Aaron Boyd';	card_games
SELECT keywords FROM cards WHERE name = 'Angel of Mercy';	card_games
SELECT COUNT(*) FROM cards WHERE power = '*';	card_games
SELECT promoTypes FROM cards WHERE name = 'Duress';	card_games
SELECT borderColor FROM cards WHERE name = 'Ancestor''s Chosen';	card_games
SELECT originalType FROM cards WHERE name = 'Ancestor''s Chosen';	card_games
WITH covered AS (     SELECT c.name, s.code     FROM cards c     JOIN sets s ON c.setCode = s.code ) SELECT DISTINCT st.language FROM covered JOIN set_translations st ON covered.code = st.setCode WHERE covered.name = 'Angel of Mercy';	card_games
SELECT COUNT(*)  FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE LOWER(l.status) = 'restricted' AND c.isTextless = 0;	card_games
SELECT r.text FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.name = 'Condemn';	card_games
SELECT COUNT(*)  FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.status = 'restricted' AND c.isStarter = 1;	card_games
SELECT l.status FROM legalities l JOIN cards c ON l.uuid = c.uuid WHERE LOWER(c.name) = 'cloudchaser eagle';	card_games
SELECT type FROM cards WHERE name = 'Benalish Knight';	card_games
SELECT l.format, l.status  FROM legalities l JOIN cards c ON l.uuid = c.uuid WHERE c.name = 'Benalish Knight';	card_games
SELECT DISTINCT c.artist FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE f.language IN ('ja', 'de', 'fr', 'es', 'it', 'ru', 'pt', 'ko', 'zh-Hans', 'zh-Hant')    OR f.language LIKE '%Japanese%'     OR f.language LIKE '%German%'     OR f.language LIKE '%French%'     OR f.language LIKE '%Spanish%'     OR f.language LIKE '%Italian%'     OR f.language LIKE '%Russian%'     OR f.language LIKE '%Portuguese%'     OR f.language LIKE '%Korean%'     OR f.language LIKE '%Chinese%';	card_games
SELECT (COUNT(CASE WHEN borderColor = 'borderless' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM cards;	card_games
SELECT COUNT(*) FROM cards c INNER JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.isReprint = 1   AND fd.language = 'German';	card_games
SELECT COUNT(*) FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.borderColor = 'borderless' AND f.language = 'Russian';	card_games
SELECT      (SUM(CASE          WHEN EXISTS (             SELECT 1 FROM foreign_data fd              WHERE fd.uuid = c.uuid AND fd.language = 'French'         ) THEN 1 ELSE 0 END     ) * 100.0 / COUNT(*)) AS french_percentage FROM cards c WHERE c.isStorySpotlight = 1;	card_games
SELECT COUNT(*) FROM cards WHERE toughness = '99';	card_games
SELECT name FROM cards WHERE artist = 'Aaron Boyd';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND availability = 'mtgo';	card_games
SELECT id FROM cards WHERE convertedManaCost = 0;	card_games
SELECT layout FROM cards WHERE keywords LIKE '%flying%'	card_games
SELECT COUNT(*)  FROM cards  WHERE originalType = 'Summon - Angel'    AND subtypes != 'Angel';	card_games
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL   AND cardKingdomId IS NOT NULL;	card_games
SELECT id FROM cards WHERE duelDeck = 'a';	card_games
SELECT edhrecRank FROM cards WHERE frameVersion = '2015';	card_games
SELECT DISTINCT c.artist FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Chinese Simplified';	card_games
SELECT c.* FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.availability LIKE '%paper%'   AND LOWER(fd.language) = 'japanese';	card_games
SELECT COUNT(DISTINCT c.uuid) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.status = 'Banned' AND c.borderColor = 'white';	card_games
SELECT c.uuid, f.language FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN foreign_data f ON c.uuid = f.uuid WHERE l.format = 'legacy';	card_games
SELECT r.text  FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.name = 'Beacon of Immortality';	card_games
SELECT LOWER(l.status) AS status, COUNT(DISTINCT c.uuid) AS card_count FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE LOWER(c.frameVersion) = 'future' GROUP BY LOWER(l.status);	card_games
SELECT name, colors FROM cards WHERE setCode = 'OGW';	card_games
SELECT c.name, fd.language FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.setCode = '10E' AND c.convertedManaCost = 5;	card_games
SELECT c.name, r.date FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.originalType LIKE 'Creature%Elf%';	card_games
SELECT colors, type FROM cards WHERE id BETWEEN 1 AND 20;	card_games
SELECT DISTINCT c.name FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.originalType LIKE '%Artifact%'   AND c.colors LIKE '%B%';	card_games
SELECT name FROM cards WHERE rarity = 'uncommon'   AND originalReleaseDate IS NOT NULL ORDER BY originalReleaseDate ASC LIMIT 3;	card_games
SELECT COUNT(*)  FROM cards  WHERE artist = 'John Avon'    AND cardKingdomId IS NOT NULL    AND cardKingdomFoilId IS NULL;	card_games
SELECT COUNT(*)  FROM cards  WHERE borderColor = 'white'    AND cardKingdomFoilId IS NOT NULL    AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*)  FROM cards  WHERE artist = 'UDON'    AND availability LIKE '%mtgo%'    AND hand = '-1';	card_games
SELECT COUNT(*)  FROM cards  WHERE frameVersion = '1993'    AND availability LIKE '%paper%'    AND hasContentWarning = 1;	card_games
SELECT manaCost FROM cards WHERE layout = 'normal' AND frameVersion = '2003' AND borderColor = 'black' AND availability = 'mtgo,paper';	card_games
SELECT SUM(convertedManaCost) AS total_converted_mana_cost FROM cards WHERE artist = 'Rob Alexander'   AND convertedManaCost IS NOT NULL;	card_games
SELECT DISTINCT subtypes, supertypes  FROM cards  WHERE availability LIKE '%arena%'  AND (subtypes IS NOT NULL OR supertypes IS NOT NULL);	card_games
SELECT DISTINCT st.setCode FROM set_translations st WHERE st.language = 'Spanish';	card_games
SELECT CAST(SUM(CASE WHEN isOnlineOnly = 1 THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*)  FROM cards  WHERE frameEffects = 'legendary';	card_games
SELECT      CAST(SUM(CASE WHEN isStorySpotlight = 1 AND isTextless = 1 THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) AS percentage,     id FROM cards WHERE isStorySpotlight = 1 AND isTextless = 1 GROUP BY id;	card_games
SELECT     c.name,     CAST(100.0 * SUM(CASE WHEN fd_spanish.uuid IS NOT NULL THEN 1 ELSE 0 END) OVER () / COUNT(*) OVER () AS FLOAT) AS spanish_percentage FROM      cards c LEFT JOIN      (SELECT DISTINCT uuid FROM foreign_data WHERE language = 'Spanish') fd_spanish     ON c.uuid = fd_spanish.uuid ORDER BY      c.name;	card_games
SELECT st.language FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE s.baseSetSize = 309;	card_games
SELECT COUNT(*) FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE s.type = 'commander'   AND st.language = 'Portuguese (Brasil)';	card_games
SELECT c.id FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.types LIKE '%Creature%' AND l.status = 'Legal';	card_games
WITH split_subtypes(uuid, remaining, subtype) AS (   SELECT uuid, subtypes || ',', '' FROM cards WHERE subtypes IS NOT NULL AND TRIM(subtypes) != ''   UNION ALL   SELECT uuid,          substr(remaining, instr(remaining, ',') + 1),          trim(substr(remaining, 1, instr(remaining, ',') - 1))   FROM split_subtypes   WHERE remaining != '' ), subtype_vals AS (   SELECT DISTINCT trim(subtype) AS type_name   FROM split_subtypes   JOIN foreign_data fd ON split_subtypes.uuid = fd.uuid   WHERE fd.language = 'German' AND subtype != '' ), split_supertypes(uuid, remaining, supertype) AS (   SELECT uuid, supertypes || ',', '' FROM cards WHERE supertypes IS NOT NULL AND TRIM(supertypes) != ''   UNION ALL   SELECT uuid,          substr(remaining, instr(remaining, ',') + 1),          trim(substr(remaining, 1, instr(remaining, ',') - 1))   FROM split_supertypes   WHERE remaining != '' ), supertype_vals AS (   SELECT DISTINCT trim(supertype) AS type_name   FROM split_supertypes   JOIN foreign_data fd ON split_supertypes.uuid = fd.uuid   WHERE fd.language = 'German' AND supertype != '' ) SELECT type_name FROM subtype_vals UNION SELECT type_name FROM supertype_vals ORDER BY type_name;	card_games
SELECT COUNT(*)  FROM cards  WHERE (power IS NULL OR power = '*')    AND text LIKE '%triggered ability%';	card_games
SELECT COUNT(*) FROM cards c WHERE c.side IS NULL   AND EXISTS (     SELECT 1 FROM legalities l     WHERE l.uuid = c.uuid AND l.format = 'premodern'   )   AND EXISTS (     SELECT 1 FROM rulings r     WHERE r.uuid = c.uuid       AND r.text LIKE '%triggered mana ability%'   );	card_games
SELECT c.id FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.artist = 'Erica Yang'   AND l.format = 'pauper'   AND l.status = 'Legal'   AND c.availability LIKE '%paper%';	card_games
SELECT c.artist FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.text = 'Das perfekte Gegenmittel zu einer dichten Formation';	card_games
SELECT fd.name FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE fd.language = 'French'   AND c.type LIKE '%Creature%'   AND c.layout = 'normal'   AND c.borderColor = 'black'   AND c.artist = 'Matthew D. Wilson';	card_games
SELECT COUNT(*)  FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.rarity = 'rare'    AND r.date = '2007-02-01';	card_games
SELECT st.language FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE s.baseSetSize = 180 AND s.block = 'Ravnica';	card_games
SELECT      (SUM(CASE WHEN c.hasContentWarning = 0 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS percentage FROM cards c INNER JOIN legalities l ON c.uuid = l.uuid WHERE l.format = 'commander'    AND l.status = 'Legal';	card_games
SELECT      CAST(         (SELECT COUNT(*)           FROM cards c           INNER JOIN foreign_data fd ON c.uuid = fd.uuid           WHERE (c.power IS NULL OR c.power = '*')             AND fd.language = 'French') AS FLOAT     ) * 100 /     (SELECT COUNT(*)       FROM cards       WHERE power IS NULL OR power = '*') AS percentage;	card_games
SELECT      AVG(CASE WHEN s.type = 'expansion' THEN 1.0 ELSE 0.0 END) * 100 FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE st.language = 'Japanese';	card_games
SELECT availability FROM cards WHERE artist = 'Daren Bader';	card_games
SELECT COUNT(*)  FROM cards  WHERE borderColor = 'borderless'    AND edhrecRank > 12000;	card_games
SELECT COUNT(*)  FROM cards  WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1;	card_games
SELECT name FROM cards WHERE (power IS NULL OR power = '*')   AND promoTypes = 'arenaleague' ORDER BY name ASC LIMIT 3;	card_games
SELECT fd.language FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE c.multiverseId = '149934';	card_games
SELECT id  FROM cards  WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL  ORDER BY cardKingdomFoilId ASC  LIMIT 3;	card_games
SELECT CAST(SUM(CASE WHEN isTextless = 1 AND layout = 'normal' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) FROM cards;	card_games
SELECT number FROM cards WHERE side IS NULL AND subtypes LIKE '%Angel%' AND subtypes LIKE '%Wizard%';	card_games
SELECT name  FROM sets  WHERE mtgoCode IS NULL OR mtgoCode = ''  ORDER BY name ASC  LIMIT 3;	card_games
SELECT st.language FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE s.mcmName = 'Archenemy' AND s.code = 'ARC';	card_games
SELECT s.name, st.translation  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE s.id = 5;	card_games
SELECT st.language, s.type FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.id = 206;	card_games
SELECT s.code, s.id FROM sets s WHERE s.block = 'Shadowmoor'   AND EXISTS (     SELECT 1     FROM cards c     JOIN foreign_data fd ON c.uuid = fd.uuid     WHERE c.setCode = s.code       AND fd.language = 'Italian'   ) ORDER BY s.name ASC LIMIT 2;	card_games
SELECT s.code FROM sets s WHERE s.isForeignOnly = 0   AND s.isFoilOnly = 1   AND EXISTS (     SELECT 1     FROM cards c     JOIN foreign_data fd ON c.uuid = fd.uuid     WHERE c.setCode = s.code       AND fd.language = 'Japanese'   );	card_games
SELECT s.name FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Russian' ORDER BY s.baseSetSize DESC LIMIT 1;	card_games
SELECT      CAST(COUNT(CASE WHEN c.isOnlineOnly = 1 THEN 1 END) AS FLOAT) * 100.0 / COUNT(*) AS percentage FROM cards c INNER JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Chinese Simplified';	card_games
SELECT COUNT(*)  FROM sets  WHERE code IN (     SELECT setCode      FROM set_translations      WHERE language = 'Japanese' )  AND (mtgoCode IS NULL OR mtgoCode = '');	card_games
SELECT id FROM cards WHERE borderColor = 'black';	card_games
SELECT id FROM cards WHERE frameEffects = 'extendedart';	card_games
SELECT * FROM cards WHERE borderColor = 'black' AND isFullArt = 1;	card_games
SELECT st.language FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE s.id = 174;	card_games
SELECT name FROM sets WHERE code = 'ALL';	card_games
SELECT fd.language FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE fd.name = 'A Pedra Fellwar';	card_games
SELECT code FROM sets WHERE releaseDate = '2007-07-13';	card_games
SELECT baseSetSize, code FROM sets WHERE block IN ('Masques', 'Mirage');	card_games
SELECT code FROM sets WHERE type = 'expansion';	card_games
SELECT fd.name, fd.type  FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE c.watermark = 'Boros';	card_games
SELECT fd.language, fd.flavorText, c.type FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE c.watermark = 'colorpie';	card_games
SELECT (COUNT(CASE WHEN c.convertedManaCost = 10 THEN 1 END) * 100.0 / COUNT(c.convertedManaCost)) AS percentage FROM cards c WHERE c.name = 'Abyssal Horror';	card_games
SELECT code FROM sets WHERE type = 'expansion' AND code IN (SELECT setCode FROM cards WHERE keywords LIKE '%commander%');	card_games
SELECT fd.name, fd.type  FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE c.watermark = 'abzan';	card_games
SELECT DISTINCT f.language, c.type  FROM foreign_data f JOIN cards c ON f.uuid = c.uuid  WHERE LOWER(COALESCE(c.watermark, '')) = 'azorius';	card_games
SELECT COUNT(*)  FROM cards  WHERE artist = 'Aaron Miller'    AND cardKingdomFoilId IS NOT NULL    AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE availability LIKE '%paper%' AND hand = '3';	card_games
SELECT name FROM cards WHERE isTextless = 0;	card_games
SELECT convertedManaCost FROM cards WHERE name = 'Ancestor''s Chosen';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND (power = '*' OR power IS NULL);	card_games
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL;	card_games
SELECT subtypes, supertypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer';	card_games
SELECT purchaseUrls FROM cards WHERE promoTypes = 'bundle';	card_games
SELECT COUNT(DISTINCT artist)  FROM cards  WHERE borderColor = 'black'    AND availability LIKE '%arena,mtgo%'	card_games
SELECT name FROM cards WHERE name IN ('Serra Angel', 'Shrine Keeper') ORDER BY convertedManaCost DESC LIMIT 1;	card_games
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer';	card_games
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3;	card_games
SELECT st.translation FROM set_translations st INNER JOIN cards c ON st.setCode = c.setCode WHERE c.name = 'Ancestor''s Chosen' AND st.language = 'Italian';	card_games
SELECT COUNT(*)  FROM set_translations st JOIN cards c ON st.setCode = c.setCode WHERE c.name = 'Angel of Mercy';	card_games
SELECT c.name FROM cards c JOIN sets s ON c.setCode = s.code JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition';	card_games
SELECT COUNT(*) > 0 AS has_korean_version FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE c.name = 'Ancestor''s Chosen'   AND fd.language = 'Korean';	card_games
SELECT COUNT(*)  FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition'    AND c.artist = 'Adam Rex';	card_games
SELECT s.baseSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition';	card_games
SELECT st.translation FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE s.name = 'Eighth Edition' AND st.language = 'Chinese Simplified';	card_games
SELECT s.mtgoCode IS NOT NULL  FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.name = 'Angel of Mercy';	card_games
SELECT s.releaseDate FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Ancestor''s Chosen';	card_games
SELECT s.type FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition';	card_games
SELECT COUNT(*)  FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.block = 'Ice Age' AND st.language = 'Italian' AND st.translation IS NOT NULL;	card_games
SELECT s.isForeignOnly  FROM cards c  JOIN sets s ON c.setCode = s.code  WHERE c.name = 'Adarkar Valkyrie';	card_games
SELECT COUNT(*)  FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian'   AND st.translation IS NOT NULL   AND s.baseSetSize < 100;	card_games
SELECT COUNT(*)  FROM cards  JOIN sets ON cards.setCode = sets.code  WHERE sets.name = 'Coldsnap'  AND cards.borderColor = 'black';	card_games
SELECT c.name FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap' ORDER BY c.convertedManaCost DESC LIMIT 1;	card_games
SELECT DISTINCT artist  FROM cards  WHERE artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy')  AND setCode = (SELECT code FROM sets WHERE name = 'Coldsnap');	card_games
SELECT * FROM cards WHERE number = '4' AND setCode = (SELECT code FROM sets WHERE name = 'Coldsnap');	card_games
SELECT COUNT(*)  FROM cards T1 JOIN sets T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap'   AND T1.convertedManaCost > 5   AND (T1.power = '*' OR T1.power IS NULL);	card_games
SELECT fd.flavorText FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE fd.language = 'Italian' AND c.name = 'Ancestor''s Chosen';	card_games
SELECT DISTINCT fd.language FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE c.name = 'Ancestor''s Chosen' AND fd.flavorText IS NOT NULL;	card_games
SELECT fd.type  FROM foreign_data fd  JOIN cards c ON fd.uuid = c.uuid  WHERE c.name = 'Ancestor''s Chosen' AND fd.language = 'German';	card_games
SELECT fd.text FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap'   AND fd.language = 'Italian';	card_games
WITH coldsnap_code AS (   SELECT code FROM sets WHERE name = 'Coldsnap' ), max_cmc AS (   SELECT MAX(convertedManaCost) AS max_cost   FROM cards   WHERE setCode = (SELECT code FROM coldsnap_code) ) SELECT fd.name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid CROSS JOIN coldsnap_code CROSS JOIN max_cmc WHERE c.setCode = coldsnap_code.code   AND fd.language = 'Italian'   AND c.convertedManaCost = max_cmc.max_cost;	card_games
SELECT date FROM rulings WHERE uuid IN (SELECT uuid FROM cards WHERE name = 'Reminisce');	card_games
SELECT (SUM(CASE WHEN c.convertedManaCost = 7 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS percentage FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap';	card_games
SELECT (SUM(CASE WHEN c.cardKingdomFoilId IS NOT NULL AND c.cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS percentage FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap';	card_games
SELECT code FROM sets WHERE releaseDate = '2017-07-14';	card_games
SELECT keyruneCode FROM sets WHERE code = 'PKHC';	card_games
SELECT mcmId FROM sets WHERE code = 'SS2';	card_games
SELECT mcmName FROM sets WHERE releaseDate = '2017-06-09';	card_games
SELECT type FROM sets WHERE name = 'From the Vault: Lore';	card_games
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized';	card_games
SELECT      c.name,      r.text,      CASE WHEN c.hasContentWarning = 1 THEN 'Yes' ELSE 'No' END AS has_degraded_properties FROM cards c LEFT JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Jim Pavelec';	card_games
SELECT s.releaseDate FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Evacuation';	card_games
SELECT s.baseSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Rinascita di Alara';	card_games
SELECT s.type FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Huitième édition';	card_games
SELECT st.translation FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid JOIN set_translations st ON c.setCode = st.setCode WHERE fd.name = 'Tendo Ice Bridge'   AND st.language = 'French';	card_games
SELECT COUNT(*)  FROM set_translations  WHERE setCode IN (SELECT code FROM sets WHERE name = 'Tenth Edition')    AND translation IS NOT NULL;	card_games
SELECT st.translation  FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE c.name = 'Fellwar Stone'   AND st.language = 'Japanese';	card_games
SELECT c.name FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Journey into Nyx Hero''s Path' ORDER BY c.convertedManaCost DESC LIMIT 1;	card_games
SELECT s.releaseDate FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Ola de frío';	card_games
SELECT s.type FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Samite Pilgrim';	card_games
SELECT COUNT(*)  FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'World Championship Decks 2004'    AND c.convertedManaCost = 3;	card_games
SELECT st.translation FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE s.name = 'Mirrodin' AND st.language = 'Chinese Simplified';	card_games
SELECT      CAST(SUM(CASE WHEN c.hasNonFoil = 1 AND c.hasFoil = 0 THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*)  FROM (     SELECT DISTINCT c.uuid, c.hasFoil, c.hasNonFoil     FROM foreign_data fd     JOIN cards c ON fd.uuid = c.uuid     WHERE fd.language = 'Japanese' ) AS distinct_japanese_cards;	card_games
SELECT      CAST(SUM(c.isOnlineOnly) AS FLOAT) * 100.0 / COUNT(*) AS percentage_online_only FROM cards c INNER JOIN (     SELECT DISTINCT uuid     FROM foreign_data     WHERE language = 'Portuguese (Brazil)' ) fd ON c.uuid = fd.uuid;	card_games
SELECT availability  FROM cards  WHERE artist = 'Aleksi Briclot' AND isTextless = 1;	card_games
SELECT id FROM sets ORDER BY baseSetSize DESC LIMIT 1;	card_games
SELECT artist FROM cards WHERE side IS NULL ORDER BY convertedManaCost DESC LIMIT 1;	card_games
SELECT frameEffects FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL GROUP BY frameEffects ORDER BY COUNT(*) DESC LIMIT 1;	card_games
SELECT COUNT(*)  FROM cards  WHERE (power IS NULL OR power = '*')    AND hasFoil = 0    AND duelDeck = 'a';	card_games
SELECT id FROM sets WHERE type = 'commander' ORDER BY totalSetSize DESC LIMIT 1;	card_games
SELECT c.name, c.convertedManaCost FROM cards c INNER JOIN legalities l ON c.uuid = l.uuid WHERE l.format = 'duel' AND l.status = 'Legal' ORDER BY c.convertedManaCost DESC LIMIT 10;	card_games
SELECT      c.originalReleaseDate,     GROUP_CONCAT(DISTINCT l.format) AS legal_formats FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'mythic'   AND l.status = 'Legal'   AND c.originalReleaseDate = (     SELECT MIN(originalReleaseDate)     FROM cards     WHERE rarity = 'mythic'       AND originalReleaseDate IS NOT NULL   ) GROUP BY c.originalReleaseDate;	card_games
SELECT COUNT(*)  FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.artist LIKE 'Volkan Ba%a' AND f.language = 'French';	card_games
SELECT COUNT(*) FROM cards c WHERE c.name = 'Abundance'   AND c.rarity = 'rare'   AND c.types LIKE '%Enchantment%'   AND NOT EXISTS (     SELECT 1     FROM legalities l     WHERE l.uuid = c.uuid       AND l.status != 'Legal'   );	card_games
WITH banned_counts AS (     SELECT          format,         COUNT(*) AS banned_count     FROM legalities     WHERE status = 'Banned'     GROUP BY format ), max_banned_format AS (     SELECT format     FROM banned_counts     WHERE banned_count = (SELECT MAX(banned_count) FROM banned_counts)     LIMIT 1 ) SELECT      mbf.format,     c.name FROM max_banned_format mbf JOIN legalities l ON mbf.format = l.format AND l.status = 'Banned' JOIN cards c ON l.uuid = c.uuid;	card_games
SELECT language FROM set_translations WHERE setCode IN (SELECT code FROM sets WHERE name = 'Battlebond');	card_games
WITH artist_counts AS (     SELECT          artist,         COUNT(*) AS card_count     FROM cards     WHERE artist IS NOT NULL     GROUP BY artist ), min_count AS (     SELECT MIN(card_count) AS min_cards     FROM artist_counts ) SELECT      ac.artist,     GROUP_CONCAT(DISTINCT l.format) AS formats FROM artist_counts ac JOIN min_count mc ON ac.card_count = mc.min_cards JOIN cards c ON c.artist = ac.artist JOIN legalities l ON c.uuid = l.uuid GROUP BY ac.artist;	card_games
SELECT l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.frameVersion = '1997'   AND c.artist = 'D. Alexander Gregory'   AND c.hasContentWarning = 1   AND l.format = 'legacy';	card_games
SELECT c.name, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.edhrecRank = 1 AND l.status = 'Banned';	card_games
SELECT      AVG(num_sets) AS average_annual_sets,     (SELECT st.language      FROM set_translations st      JOIN sets s ON st.setCode = s.code      WHERE s.releaseDate >= '2012-01-01'         AND s.releaseDate <= '2015-12-31'      GROUP BY st.language      ORDER BY COUNT(*) DESC      LIMIT 1     ) AS common_language FROM (     SELECT          COUNT(*) AS num_sets     FROM sets     WHERE releaseDate >= '2012-01-01'        AND releaseDate <= '2015-12-31'     GROUP BY strftime('%Y', releaseDate) ) AS yearly_counts;	card_games
SELECT DISTINCT artist FROM cards WHERE borderColor = 'black' AND availability = 'arena';	card_games
SELECT uuid FROM legalities WHERE format = 'oldschool' AND status IN ('banned', 'restricted');	card_games
SELECT COUNT(*)  FROM cards  WHERE artist = 'Matthew D. Wilson'    AND availability = 'paper';	card_games
SELECT r.text FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.artist = 'Kev Walker' ORDER BY r.date DESC;	card_games
SELECT c.name, l.format FROM cards c JOIN sets s ON c.setCode = s.code JOIN legalities l ON c.uuid = l.uuid WHERE s.name = 'Hour of Devastation' AND l.status = 'Legal';	card_games
SELECT DISTINCT s.name FROM sets s WHERE EXISTS (     SELECT 1 FROM set_translations st      WHERE st.setCode = s.code AND st.language = 'Korean' ) AND NOT EXISTS (     SELECT 1 FROM set_translations st      WHERE st.setCode = s.code AND st.language = 'Japanese' );	card_games
SELECT DISTINCT c.frameVersion, c.name FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.artist = 'Allen Williams' AND l.status = 'Banned';	card_games
SELECT DisplayName  FROM users  WHERE DisplayName IN ('Harlan', 'Jarrod Dixon')  ORDER BY Reputation DESC  LIMIT 1;	codebase_community
SELECT DisplayName FROM users WHERE strftime('%Y', CreationDate) = '2011';	codebase_community
SELECT COUNT(*) FROM users WHERE LastAccessDate > '2014-09-01';	codebase_community
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM users  WHERE UpVotes > 100 AND DownVotes > 1;	codebase_community
SELECT COUNT(*)  FROM users  WHERE Views > 10    AND CreationDate > '2013-12-31 23:59:59';	codebase_community
SELECT COUNT(*)  FROM posts  WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie');	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Eliciting priors from experts';	codebase_community
SELECT Title  FROM posts  JOIN users ON posts.OwnerUserId = users.Id  WHERE users.DisplayName = 'csgillespie'  ORDER BY ViewCount DESC  LIMIT 1;	codebase_community
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId ORDER BY p.FavoriteCount DESC LIMIT 1;	codebase_community
SELECT SUM(p.CommentCount)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT MAX(p.AnswerCount)  FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT u.DisplayName FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE p.Title = 'Examples for teaching: Correlation does not mean causation';	codebase_community
SELECT COUNT(*)  FROM posts  JOIN users ON posts.OwnerUserId = users.Id  WHERE users.DisplayName = 'csgillespie' AND posts.ParentId IS NULL;	codebase_community
SELECT DISTINCT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ClosedDate IS NOT NULL;	codebase_community
SELECT COUNT(*)  FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.Age > 65 AND p.Score >= 20;	codebase_community
SELECT u.Location FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Title = 'Eliciting priors from experts';	codebase_community
SELECT p.Body FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'bayesian';	codebase_community
SELECT p.Body FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.Count = (SELECT MAX(Count) FROM tags) LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT COUNT(*)  FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie' AND strftime('%Y', b.Date) = '2011';	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId GROUP BY u.Id, u.DisplayName ORDER BY COUNT(b.Id) DESC LIMIT 1;	codebase_community
SELECT AVG(p.Score)  FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT AVG(badge_count)  FROM (     SELECT u.Id, COUNT(b.Id) AS badge_count     FROM users u     LEFT JOIN badges b ON u.Id = b.UserId     WHERE u.Views > 200     GROUP BY u.Id ) AS user_badge_counts;	codebase_community
SELECT (COUNT(CASE WHEN u.Age > 65 THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Score > 5;	codebase_community
SELECT COUNT(*) FROM votes WHERE UserId = 58 AND CreationDate = '2010-07-19';	codebase_community
SELECT CreationDate FROM votes GROUP BY CreationDate ORDER BY COUNT(Id) DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = 'Revival';	codebase_community
SELECT p.Title FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.Score = (SELECT MAX(Score) FROM comments);	codebase_community
SELECT COUNT(*) FROM comments WHERE PostId IN (SELECT Id FROM posts WHERE ViewCount = 1910);	codebase_community
SELECT p.FavoriteCount FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.UserId = 3025 AND c.CreationDate = '2014-04-23 20:29:39.0';	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ParentId = 107829 AND p.CommentCount = 1;	codebase_community
SELECT CASE WHEN p.ClosedDate IS NULL THEN 'not well-finished' ELSE 'well-finished' END FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.UserId = 23853 AND c.CreationDate = '2013-07-12 09:08:18.0';	codebase_community
SELECT u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Id = 65041;	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId IN (SELECT Id FROM users WHERE DisplayName = 'Tiago Pasqualini');	codebase_community
SELECT u.DisplayName FROM users u JOIN votes v ON u.Id = v.UserId WHERE v.Id = 6347;	codebase_community
SELECT COUNT(*)  FROM votes v JOIN posts p ON v.PostId = p.Id WHERE LOWER(p.Title) LIKE '%data visualization%';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'DatEpicCoderGuyWhoPrograms';	codebase_community
SELECT CAST(COUNT(posts.Id) AS FLOAT) / COUNT(votes.Id) FROM users LEFT JOIN posts ON users.Id = posts.OwnerUserId LEFT JOIN votes ON users.Id = votes.UserId WHERE users.Id = 24;	codebase_community
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer';	codebase_community
SELECT Text FROM comments WHERE Score = 17;	codebase_community
SELECT DisplayName FROM users WHERE WebsiteUrl = 'http://stackoverflow.com';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'SilentGhost';	codebase_community
SELECT u.DisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Text = 'thank you user93!';	codebase_community
SELECT c.Text FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.DisplayName = 'A Lion';	codebase_community
SELECT u.DisplayName, u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Title = 'Understanding what Dassault iSight is doing?';	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'How does gentle boosting differ from AdaBoost?';	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Necromancer' LIMIT 10;	codebase_community
SELECT u.DisplayName FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE p.Title = 'Open source tools for visualizing multi-dimensional data?';	codebase_community
SELECT Title  FROM posts  WHERE LastEditorUserId IN (SELECT Id FROM users WHERE DisplayName = 'Vebjorn Ljosa');	codebase_community
SELECT SUM(p.Score) AS TotalScore, u.WebsiteUrl FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Yevgeny' GROUP BY u.WebsiteUrl;	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'Why square the difference instead of taking the absolute value in standard deviation?';	codebase_community
SELECT SUM(v.BountyAmount)  FROM votes v  JOIN posts p ON v.PostId = p.Id  WHERE p.Title LIKE '%data%' AND v.BountyAmount IS NOT NULL;	codebase_community
SELECT u.DisplayName FROM users u JOIN votes v ON u.Id = v.UserId JOIN posts p ON v.PostId = p.Id WHERE v.BountyAmount = 50 AND p.Title LIKE '%variance%';	codebase_community
SELECT      p.Title,     c.Text,     AVG(p.ViewCount) OVER () AS AverageViewCount FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Tags LIKE '%<humor>%';	codebase_community
SELECT COUNT(*) FROM comments WHERE UserId = 13;	codebase_community
SELECT Id FROM users ORDER BY Reputation DESC LIMIT 1;	codebase_community
SELECT Id FROM users ORDER BY Views ASC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = 'Supporter'   AND Date >= '2011-01-01'   AND Date < '2012-01-01';	codebase_community
SELECT COUNT(*)  FROM (     SELECT UserId      FROM badges      GROUP BY UserId      HAVING COUNT(Name) > 5 ) AS subquery;	codebase_community
SELECT COUNT(DISTINCT u.Id) FROM users u JOIN badges b1 ON u.Id = b1.UserId JOIN badges b2 ON u.Id = b2.UserId WHERE u.Location = 'New York'   AND b1.Name = 'Teacher'   AND b2.Name = 'Supporter';	codebase_community
SELECT u.DisplayName, u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Id = 1;	codebase_community
SELECT UserId FROM postHistory GROUP BY UserId, PostId HAVING COUNT(*) = 1 INTERSECT SELECT Id FROM users WHERE Views >= 1000	codebase_community
SELECT u.DisplayName, b.Name FROM users u JOIN (     SELECT UserId, COUNT(Id) as CommentCount     FROM comments     GROUP BY UserId     ORDER BY CommentCount DESC     LIMIT 1 ) c ON u.Id = c.UserId LEFT JOIN badges b ON u.Id = b.UserId;	codebase_community
SELECT COUNT(DISTINCT u.Id)  FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location LIKE '%India%' AND b.Name = 'Teacher';	codebase_community
SELECT      CASE          WHEN COUNT(*) = 0 THEN 0.0         ELSE (SUM(CASE WHEN strftime('%Y', Date) = '2010' THEN 1 ELSE 0 END) -                SUM(CASE WHEN strftime('%Y', Date) = '2011' THEN 1 ELSE 0 END)) * 100.0 / COUNT(*)     END AS pct_difference FROM badges  WHERE Name = 'Student';	codebase_community
SELECT PostHistoryTypeId, COUNT(DISTINCT UserId) AS UniqueUsers FROM postHistory WHERE PostId = 3720 GROUP BY PostHistoryTypeId;	codebase_community
SELECT p.Id, p.ViewCount  FROM posts p JOIN postLinks pl ON p.Id = pl.RelatedPostId WHERE pl.PostId = 61217;	codebase_community
SELECT p.Score, pl.LinkTypeId FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE p.Id = 395;	codebase_community
SELECT Id, OwnerUserId  FROM posts  WHERE Score > 60;	codebase_community
SELECT SUM(p.FavoriteCount) FROM posts p WHERE p.OwnerUserId = 686   AND strftime('%Y', p.CreaionDate) = '2011';	codebase_community
SELECT AVG(u.UpVotes) AS average_up_votes, AVG(u.Age) AS average_age FROM users u JOIN posts p ON u.Id = p.OwnerUserId GROUP BY u.Id HAVING COUNT(p.Id) > 10;	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = 'Announcer';	codebase_community
SELECT Name  FROM badges  WHERE Date = '2010-07-19 19:39:07.0';	codebase_community
SELECT COUNT(*) FROM comments WHERE Score > 60;	codebase_community
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:25:47.0';	codebase_community
SELECT COUNT(*) FROM posts WHERE Score = 10;	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT u.Reputation FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Date = '2010-07-19 19:39:07.0';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Pierre';	codebase_community
SELECT b.Date FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Location = 'Rochester, NY';	codebase_community
SELECT (COUNT(CASE WHEN b.Name = 'Teacher' THEN 1 END) * 100.0 / COUNT(u.Id)) AS percentage FROM users u LEFT JOIN badges b ON u.Id = b.UserId;	codebase_community
SELECT      CAST(SUM(CASE WHEN u.Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*)  FROM      badges b JOIN      users u ON b.UserId = u.Id  WHERE      b.Name = 'Organizer';	codebase_community
SELECT Score FROM comments WHERE CreationDate = '2010-07-19 19:19:56.0';	codebase_community
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:37:33.0';	codebase_community
SELECT u.Age FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'Vienna, Austria';	codebase_community
SELECT COUNT(*)  FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Supporter'    AND u.Age BETWEEN 19 AND 65;	codebase_community
SELECT u.Views FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Date = '2010-07-19 19:39:07.0';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MIN(Reputation) FROM users)	codebase_community
SELECT b.Name  FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Sharpie';	codebase_community
SELECT COUNT(*)  FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age > 65;	codebase_community
SELECT DisplayName FROM users WHERE Id = 30;	codebase_community
SELECT COUNT(*) FROM users WHERE Location = 'New York';	codebase_community
SELECT COUNT(*)  FROM votes  WHERE CreationDate >= '2010-01-01'    AND CreationDate < '2011-01-01';	codebase_community
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT DisplayName  FROM users  WHERE Views = (SELECT MAX(Views) FROM users);	codebase_community
SELECT      CAST(COUNT(CASE WHEN strftime('%Y', CreationDate) = '2010' THEN 1 END) AS FLOAT)      / NULLIF(COUNT(CASE WHEN strftime('%Y', CreationDate) = '2011' THEN 1 END), 0) FROM votes;	codebase_community
SELECT t.TagName FROM tags t JOIN posts p ON t.Id = p.Tags JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'John Salvatier';	codebase_community
SELECT COUNT(*)  FROM posts  WHERE OwnerUserId IN (     SELECT Id      FROM users      WHERE DisplayName = 'Daniel Vassallo' );	codebase_community
SELECT COUNT(*)  FROM votes v JOIN users u ON v.UserId = u.Id WHERE u.DisplayName = 'Harlan';	codebase_community
SELECT Id  FROM posts  WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'slashnick')  ORDER BY AnswerCount DESC  LIMIT 1;	codebase_community
SELECT      CASE          WHEN SUM(CASE WHEN u.DisplayName = 'Harvey Motulsky' THEN p.ViewCount ELSE 0 END) > SUM(CASE WHEN u.DisplayName = 'Noah Snyder' THEN p.ViewCount ELSE 0 END)          THEN 'Harvey Motulsky'          ELSE 'Noah Snyder'      END AS MorePopularUser FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName IN ('Harvey Motulsky', 'Noah Snyder');	codebase_community
SELECT COUNT(*)  FROM posts p JOIN users u ON p.OwnerUserId = u.Id JOIN votes v ON p.Id = v.PostId WHERE u.DisplayName = 'Matt Parker' GROUP BY p.Id HAVING COUNT(v.Id) > 4;	codebase_community
SELECT COUNT(*)  FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Neil McGuigan' AND c.Score < 60;	codebase_community
SELECT DISTINCT t.TagName FROM tags t JOIN posts p ON t.Id = p.Tags JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Mark Meckes'   AND p.CommentCount = 0;	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Organizer';	codebase_community
SELECT      CAST(COUNT(CASE WHEN p.Tags LIKE '%<r>%' THEN 1 END) AS FLOAT) * 100 / COUNT(p.Id) AS percentage FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Community';	codebase_community
SELECT      SUM(CASE WHEN u.DisplayName = 'Mornington' THEN p.ViewCount ELSE 0 END) -      SUM(CASE WHEN u.DisplayName = 'Amos' THEN p.ViewCount ELSE 0 END) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName IN ('Mornington', 'Amos');	codebase_community
SELECT COUNT(*)  FROM badges  WHERE Name = 'Commentator' AND strftime('%Y', Date) = '2014';	codebase_community
SELECT COUNT(*)  FROM posts  WHERE CreaionDate >= '2010-07-21'    AND CreaionDate < '2010-07-22';	codebase_community
SELECT DisplayName, Age FROM users WHERE Views = (SELECT MAX(Views) FROM users);	codebase_community
SELECT LastEditDate, LastEditorUserId  FROM posts  WHERE Title = 'Detecting a given face in a database of facial images';	codebase_community
SELECT COUNT(*) FROM comments WHERE UserId = 13 AND Score < 60;	codebase_community
SELECT p.Title, u.DisplayName FROM posts p JOIN comments c ON p.Id = c.PostId JOIN users u ON c.UserId = u.Id WHERE c.Score > 60;	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Location = 'North Pole'   AND strftime('%Y', b.Date) = '2011';	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.FavoriteCount > 150;	codebase_community
SELECT COUNT(*) AS post_history_count, MAX(ph.CreationDate) AS last_edit_date FROM postHistory ph JOIN posts p ON ph.PostId = p.Id WHERE p.Title = 'What is the best introductory Bayesian statistics textbook?';	codebase_community
SELECT u.LastAccessDate, u.Location FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Outliers';	codebase_community
SELECT p2.Title FROM posts p1 JOIN postLinks pl ON p1.Id = pl.PostId JOIN posts p2 ON pl.RelatedPostId = p2.Id WHERE p1.Title = 'How to tell if something happened in a data set which monitors a value over time';	codebase_community
SELECT DISTINCT c.PostId, b.Name AS BadgeName FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON p.OwnerUserId = u.Id JOIN badges b ON u.Id = b.UserId WHERE c.UserDisplayName = 'Samuel'   AND strftime('%Y', c.CreationDate) = '2013'   AND strftime('%Y', b.Date) = '2013';	codebase_community
SELECT OwnerDisplayName FROM posts ORDER BY ViewCount DESC LIMIT 1;	codebase_community
SELECT u.DisplayName, u.Location FROM users u JOIN posts p ON u.Id = p.OwnerUserId JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'hypothesis-testing';	codebase_community
SELECT p.Title, pl.LinkTypeId FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE p.Title = 'What are principal component scores?';	codebase_community
SELECT u.DisplayName FROM posts p JOIN posts parent ON p.ParentId = parent.Id JOIN users u ON parent.OwnerUserId = u.Id WHERE p.ParentId IS NOT NULL ORDER BY p.Score DESC LIMIT 1;	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM users u JOIN votes v ON u.Id = v.UserId WHERE v.VoteTypeId = 8 ORDER BY v.BountyAmount DESC LIMIT 1;	codebase_community
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5;	codebase_community
SELECT COUNT(*) FROM tags WHERE "Count" BETWEEN 5000 AND 7000;	codebase_community
SELECT OwnerUserId FROM posts ORDER BY FavoriteCount DESC LIMIT 1;	codebase_community
SELECT Age FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT COUNT(*) FROM posts p JOIN votes v ON p.Id = v.PostId WHERE strftime('%Y', p.CreationDate) = '2011'   AND v.BountyAmount = 50;	codebase_community
SELECT Id FROM users WHERE Age = (SELECT MIN(Age) FROM users);	codebase_community
SELECT SUM(Score) FROM posts WHERE LasActivityDate LIKE '2010-07-19%';	codebase_community
SELECT COUNT(pl.Id) / 12.0 AS average_monthly_links FROM postLinks pl JOIN posts p ON pl.PostId = p.Id WHERE strftime('%Y', pl.CreationDate) = '2010'   AND p.AnswerCount <= 2;	codebase_community
SELECT p.Id FROM posts p JOIN votes v ON p.Id = v.PostId WHERE v.UserId = 1465 ORDER BY p.FavoriteCount DESC LIMIT 1;	codebase_community
SELECT p.Title FROM posts p JOIN postLinks pl ON p.Id = pl.PostId ORDER BY pl.CreationDate ASC LIMIT 1;	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId GROUP BY u.Id, u.DisplayName ORDER BY COUNT(b.Name) DESC LIMIT 1;	codebase_community
SELECT MIN(v.CreationDate)  FROM votes v JOIN users u ON v.UserId = u.Id WHERE u.DisplayName = 'chl';	codebase_community
SELECT MIN(p.CreaionDate) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.Age = (SELECT MIN(Age) FROM users WHERE Age IS NOT NULL);	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Autobiographer' ORDER BY b.Date ASC LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT u.Id) FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE u.Location = 'United Kingdom'   AND p.FavoriteCount >= 4;	codebase_community
SELECT AVG(v.PostId)  FROM votes v JOIN users u ON v.UserId = u.Id WHERE u.Age = (SELECT MAX(Age) FROM users);	codebase_community
SELECT DisplayName FROM users ORDER BY Reputation DESC LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM users  WHERE Reputation > 2000 AND Views > 1000;	codebase_community
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT COUNT(*)  FROM posts  WHERE OwnerUserId IN (SELECT Id FROM users WHERE DisplayName = 'Jay Stevens')   AND strftime('%Y', CreationDate) = '2010';	codebase_community
SELECT Id, Title FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Harvey Motulsky') ORDER BY ViewCount DESC LIMIT 1;	codebase_community
SELECT Id, Title FROM posts ORDER BY Score DESC LIMIT 1;	codebase_community
SELECT AVG(p.Score)  FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Stephen Turner';	codebase_community
SELECT DISTINCT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ViewCount > 20000   AND strftime('%Y', p.CreationDate) = '2011';	codebase_community
SELECT p.Id, u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE strftime('%Y', p.CreaionDate) = '2010'   AND p.FavoriteCount IS NOT NULL ORDER BY p.FavoriteCount DESC LIMIT 1;	codebase_community
SELECT      (COUNT(CASE WHEN u.Reputation > 1000 THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE strftime('%Y', p.CreationDate) = '2011';	codebase_community
SELECT CAST(COUNT(CASE WHEN Age BETWEEN 13 AND 19 THEN 1 END) AS FLOAT) * 100 / COUNT(Id) AS percentage FROM users;	codebase_community
SELECT p.ViewCount, u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Computer Game Datasets' ORDER BY p.LasActivityDate DESC LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM posts  WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts);	codebase_community
SELECT COUNT(*)  FROM comments  WHERE PostId = (SELECT Id FROM posts ORDER BY Score DESC LIMIT 1);	codebase_community
SELECT COUNT(*)  FROM posts  WHERE ViewCount > 35000    AND CommentCount = 0;	codebase_community
SELECT u.DisplayName, u.Location FROM users u JOIN posts p ON u.Id = p.LastEditorUserId WHERE p.Id = 183;	codebase_community
SELECT b.Name  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.DisplayName = 'Emmett'  ORDER BY b.Date DESC  LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM users  WHERE Age BETWEEN 19 AND 65    AND UpVotes > 5000;	codebase_community
SELECT julianday(MIN(b.Date)) - julianday(u.CreationDate) AS DaysToGetBadge FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Zolomon';	codebase_community
SELECT      (SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users ORDER BY CreationDate DESC LIMIT 1)) AS post_count,     (SELECT COUNT(*) FROM comments WHERE UserId = (SELECT Id FROM users ORDER BY CreationDate DESC LIMIT 1)) AS comment_count;	codebase_community
SELECT c.Text, u.DisplayName FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON c.UserId = u.Id WHERE p.Title = 'Analysing wind data with R' ORDER BY c.CreationDate DESC LIMIT 10;	codebase_community
SELECT COUNT(*)  FROM badges  WHERE Name = 'Citizen Patrol';	codebase_community
SELECT COUNT(*)  FROM posts p JOIN tags t ON p.Tags LIKE '%' || t.TagName || '%' WHERE t.TagName = 'careers';	codebase_community
SELECT u.Reputation, p.ViewCount FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'Jarrod Dixon';	codebase_community
SELECT      COUNT(c.Id) AS CommentCount,     COUNT(p.Id) AS AnswerCount FROM      posts p LEFT JOIN      comments c ON p.Id = c.PostId WHERE      p.Title = 'Clustering 1D data';	codebase_community
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat';	codebase_community
SELECT COUNT(*)  FROM votes  WHERE VoteTypeId = 8 AND BountyAmount >= 30;	codebase_community
SELECT      CAST(COUNT(CASE WHEN p.Score > 50 THEN 1 END) AS FLOAT) * 100 / COUNT(p.Id) FROM      posts p INNER JOIN      users u ON p.OwnerUserId = u.Id WHERE      u.Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT COUNT(*) FROM posts WHERE Score < 20;	codebase_community
SELECT COUNT(*) FROM tags WHERE Id < 15 AND Count <= 20;	codebase_community
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample';	codebase_community
SELECT u.Reputation, u.UpVotes FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'fine, you win :)';	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title LIKE '%linear regression%';	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ViewCount BETWEEN 100 AND 150 ORDER BY c.Score DESC LIMIT 1;	codebase_community
SELECT u.CreationDate, u.Age FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text LIKE '%http://%';	codebase_community
SELECT COUNT(*)  FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.Score = 0 AND p.ViewCount < 5;	codebase_community
SELECT COUNT(*)  FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.CommentCount = 1 AND c.Score = 0;	codebase_community
SELECT COUNT(DISTINCT u.Id)  FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score = 0 AND u.Age = 40;	codebase_community
SELECT p.Id, c.Text FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Title = 'Group differences on a five point Likert item';	codebase_community
SELECT u.UpVotes FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'R is also lazy evaluated.';	codebase_community
SELECT c.Text FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky';	codebase_community
SELECT DISTINCT u.DisplayName FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Score BETWEEN 1 AND 5   AND u.DownVotes = 0;	codebase_community
SELECT      CAST(COUNT(CASE WHEN u.UpVotes = 0 THEN 1 END) AS FLOAT) * 100 / COUNT(*)  FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score BETWEEN 5 AND 10;	codebase_community
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id JOIN superhero s ON hp.hero_id = s.id WHERE s.superhero_name = '3-D Man';	superhero
SELECT COUNT(*)  FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Super Strength';	superhero
SELECT COUNT(*)  FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Super Strength' AND s.height_cm > 200;	superhero
SELECT s.full_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id GROUP BY s.id, s.full_name HAVING COUNT(hp.power_id) > 15	superhero
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE colour.colour = 'Blue';	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.skin_colour_id = c.id  WHERE s.superhero_name = 'Apocalypse';	superhero
SELECT COUNT(*)  FROM superhero s JOIN colour c ON s.eye_colour_id = c.id JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE c.colour = 'Blue' AND sp.power_name = 'Agility';	superhero
SELECT s.superhero_name FROM superhero s JOIN colour c1 ON s.eye_colour_id = c1.id JOIN colour c2 ON s.hair_colour_id = c2.id WHERE c1.colour = 'Blue' AND c2.colour = 'Blond';	superhero
SELECT COUNT(*)  FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics';	superhero
SELECT s.superhero_name, s.height_cm FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics' ORDER BY s.height_cm DESC;	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name = 'Sauron';	superhero
SELECT      colour.colour,      COUNT(superhero.id) AS popularity FROM      superhero JOIN      publisher ON superhero.publisher_id = publisher.id JOIN      colour ON superhero.eye_colour_id = colour.id WHERE      publisher.publisher_name = 'Marvel Comics' GROUP BY      colour.colour ORDER BY      popularity DESC;	superhero
SELECT AVG(height_cm)  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE publisher.publisher_name = 'Marvel Comics';	superhero
SELECT s.superhero_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE p.publisher_name = 'Marvel Comics' AND sp.power_name = 'Super Strength';	superhero
SELECT COUNT(*)  FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'DC Comics';	superhero
SELECT p.publisher_name FROM publisher p JOIN superhero s ON p.id = s.publisher_id JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' ORDER BY ha.attribute_value ASC LIMIT 1;	superhero
SELECT COUNT(*)  FROM superhero s JOIN colour c ON s.eye_colour_id = c.id JOIN publisher p ON s.publisher_id = p.id WHERE c.colour = 'Gold' AND p.publisher_name = 'Marvel Comics';	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name = 'Blue Beetle II';	superhero
SELECT COUNT(*)  FROM superhero s JOIN colour c ON s.hair_colour_id = c.id WHERE c.colour = 'Blond';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Intelligence' ORDER BY ha.attribute_value ASC LIMIT 1;	superhero
SELECT r.race FROM superhero s JOIN race r ON s.race_id = r.id WHERE s.superhero_name = 'Copycat';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Durability' AND ha.attribute_value < 50;	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Death Touch';	superhero
SELECT COUNT(*)  FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE g.gender = 'Female'    AND a.attribute_name = 'Strength'    AND ha.attribute_value = 100;	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id GROUP BY s.id, s.superhero_name ORDER BY COUNT(hp.power_id) DESC LIMIT 1;	superhero
SELECT COUNT(*)  FROM superhero s JOIN race r ON s.race_id = r.id WHERE r.race = 'Vampire';	superhero
SELECT      (SUM(CASE WHEN a.alignment = 'Bad' THEN 1 ELSE 0 END) * 100.0 / COUNT(s.id)) AS percentage_bad_alignment,     SUM(CASE WHEN a.alignment = 'Bad' AND p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS count_bad_alignment_marvel FROM superhero s JOIN alignment a ON s.alignment_id = a.id JOIN publisher p ON s.publisher_id = p.id;	superhero
SELECT      ABS(SUM(CASE WHEN p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) - SUM(CASE WHEN p.publisher_name = 'DC Comics' THEN 1 ELSE 0 END)) AS difference FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name IN ('Marvel Comics', 'DC Comics');	superhero
SELECT id FROM publisher WHERE publisher_name = 'Star Trek';	superhero
SELECT AVG(attribute_value) FROM hero_attribute;	superhero
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL;	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.id = 75;	superhero
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id JOIN superhero s ON hp.hero_id = s.id WHERE s.superhero_name = 'Deathlok';	superhero
SELECT AVG(s.weight_kg) FROM superhero s JOIN gender g ON s.gender_id = g.id WHERE g.gender = 'Female';	superhero
SELECT DISTINCT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id JOIN superhero s ON hp.hero_id = s.id JOIN gender g ON s.gender_id = g.id WHERE g.gender = 'Male' LIMIT 5;	superhero
SELECT superhero_name FROM superhero s JOIN race r ON s.race_id = r.id WHERE r.race = 'Alien';	superhero
SELECT s.superhero_name FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.height_cm BETWEEN 170 AND 190 AND c.colour = 'No Colour';	superhero
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id WHERE hp.hero_id = 56;	superhero
SELECT s.full_name FROM superhero s JOIN race r ON s.race_id = r.id WHERE r.race = 'Demi-God' LIMIT 5;	superhero
SELECT COUNT(*)  FROM superhero  WHERE alignment_id = 2;	superhero
SELECT r.race FROM superhero s JOIN race r ON s.race_id = r.id WHERE s.weight_kg = 169;	superhero
SELECT c.colour  FROM superhero s  JOIN race r ON s.race_id = r.id  JOIN colour c ON s.hair_colour_id = c.id  WHERE s.height_cm = 185 AND r.race = 'Human';	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id ORDER BY s.weight_kg DESC LIMIT 1;	superhero
SELECT (SUM(CASE WHEN p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS percentage FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.height_cm BETWEEN 150 AND 180;	superhero
SELECT s.superhero_name FROM superhero s JOIN gender g ON s.gender_id = g.id WHERE g.gender = 'Male'   AND s.weight_kg > (SELECT AVG(weight_kg) * 0.79 FROM superhero);	superhero
SELECT power_name FROM superpower JOIN hero_power ON superpower.id = hero_power.power_id GROUP BY power_name ORDER BY COUNT(hero_power.hero_id) DESC LIMIT 1;	superhero
SELECT ha.attribute_value  FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = 'Abomination';	superhero
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id WHERE hp.hero_id = 1;	superhero
SELECT COUNT(*)  FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Stealth';	superhero
SELECT s.full_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Strength' ORDER BY ha.attribute_value DESC LIMIT 1;	superhero
SELECT CAST(COUNT(superhero.id) AS FLOAT) / SUM(CASE WHEN superhero.skin_colour_id = 1 THEN 1 ELSE 0 END) AS average FROM superhero JOIN colour ON superhero.skin_colour_id = colour.id WHERE colour.id = 1;	superhero
SELECT COUNT(*)  FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Dark Horse Comics';	superhero
SELECT s.superhero_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE p.publisher_name = 'Dark Horse Comics' AND a.attribute_name = 'Durability' ORDER BY ha.attribute_value DESC LIMIT 1;	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.full_name = 'Abraham Sapien';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Flight';	superhero
SELECT c1.colour AS eye_colour, c2.colour AS hair_colour, c3.colour AS skin_colour FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN publisher p ON s.publisher_id = p.id JOIN colour c1 ON s.eye_colour_id = c1.id JOIN colour c2 ON s.hair_colour_id = c2.id JOIN colour c3 ON s.skin_colour_id = c3.id WHERE g.gender = 'Female' AND p.publisher_name = 'Dark Horse Comics';	superhero
SELECT s.superhero_name, p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.hair_colour_id = s.skin_colour_id AND s.hair_colour_id = s.eye_colour_id;	superhero
SELECT r.race FROM superhero s JOIN race r ON s.race_id = r.id WHERE s.superhero_name = 'A-Bomb';	superhero
SELECT (SUM(CASE WHEN c.colour = 'Blue' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS percentage FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN colour c ON s.skin_colour_id = c.id WHERE g.gender = 'Female';	superhero
SELECT s.superhero_name, r.race FROM superhero s JOIN race r ON s.race_id = r.id WHERE s.full_name = 'Charles Chandler';	superhero
SELECT g.gender  FROM superhero s  JOIN gender g ON s.gender_id = g.id  WHERE s.superhero_name = 'Agent 13';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Adaptation';	superhero
SELECT COUNT(*)  FROM hero_power hp JOIN superhero s ON hp.hero_id = s.id WHERE s.superhero_name = 'Amazo';	superhero
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id JOIN superhero s ON hp.hero_id = s.id WHERE s.full_name = 'Hunter Zolomon';	superhero
SELECT s.height_cm  FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.colour = 'Amber';	superhero
SELECT s.superhero_name FROM superhero s JOIN colour c1 ON s.eye_colour_id = c1.id JOIN colour c2 ON s.hair_colour_id = c2.id WHERE c1.colour = 'Black' AND c2.colour = 'Black';	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.skin_colour_id IN (SELECT id FROM colour WHERE colour = 'Gold');	superhero
SELECT s.full_name FROM superhero s JOIN race r ON s.race_id = r.id WHERE r.race = 'Vampire';	superhero
SELECT s.superhero_name FROM superhero s JOIN alignment a ON s.alignment_id = a.id WHERE a.alignment = 'Neutral';	superhero
SELECT COUNT(*)  FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Strength'    AND ha.attribute_value = (     SELECT MAX(attribute_value)      FROM hero_attribute ha2     JOIN attribute a2 ON ha2.attribute_id = a2.id     WHERE a2.attribute_name = 'Strength'   );	superhero
SELECT r.race, a.alignment  FROM superhero s  JOIN race r ON s.race_id = r.id  JOIN alignment a ON s.alignment_id = a.id  WHERE s.superhero_name = 'Cameron Hicks';	superhero
SELECT (SUM(CASE WHEN g.gender = 'Female' THEN 1 ELSE 0 END) * 100.0 / COUNT(*))  FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics';	superhero
SELECT AVG(s.weight_kg) FROM superhero s JOIN race r ON s.race_id = r.id WHERE r.race = 'Alien';	superhero
SELECT      (SELECT weight_kg FROM superhero WHERE full_name = 'Emil Blonsky') -      (SELECT weight_kg FROM superhero WHERE full_name = 'Charles Chandler');	superhero
SELECT AVG(height_cm) AS average_height FROM superhero;	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Abomination';	superhero
SELECT COUNT(*)  FROM superhero  WHERE race_id = 21 AND gender_id = 1;	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' ORDER BY ha.attribute_value DESC LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3;	superhero
SELECT a.attribute_name, ha.attribute_value FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE s.superhero_name = '3-D Man';	superhero
SELECT s.superhero_name FROM superhero s JOIN colour ce ON s.eye_colour_id = ce.id JOIN colour ch ON s.hair_colour_id = ch.id WHERE ce.colour = 'Blue' AND ch.colour = 'Brown';	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy');	superhero
SELECT COUNT(*)  FROM superhero  WHERE publisher_id = 1;	superhero
SELECT (SUM(CASE WHEN c.colour = 'Blue' THEN 1 ELSE 0 END) * 100.0 / COUNT(s.id)) AS percentage FROM superhero s JOIN colour c ON s.eye_colour_id = c.id;	superhero
SELECT CAST(SUM(CASE WHEN gender_id = 1 THEN 1 ELSE 0 END) AS FLOAT) / SUM(CASE WHEN gender_id = 2 THEN 1 ELSE 0 END) AS ratio FROM superhero;	superhero
SELECT superhero_name FROM superhero WHERE height_cm = (SELECT MAX(height_cm) FROM superhero);	superhero
SELECT id FROM superpower WHERE power_name = 'Cryokinesis';	superhero
SELECT superhero_name FROM superhero WHERE id = 294;	superhero
SELECT full_name FROM superhero WHERE weight_kg IS NULL OR weight_kg = 0;	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.full_name = 'Karen Beecher-Duncan';	superhero
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id JOIN superhero s ON hp.hero_id = s.id WHERE s.full_name = 'Helen Parr';	superhero
SELECT r.race FROM superhero s JOIN race r ON s.race_id = r.id WHERE s.weight_kg = 108 AND s.height_cm = 188;	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.id = 38;	superhero
SELECT r.race FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN race r ON s.race_id = r.id WHERE ha.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute);	superhero
SELECT a.alignment, sp.power_name  FROM superhero s  JOIN alignment a ON s.alignment_id = a.id  JOIN hero_power hp ON s.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE s.superhero_name = 'Atom IV';	superhero
SELECT s.full_name FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.colour = 'Blue' LIMIT 5;	superhero
SELECT AVG(ha.attribute_value) FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id JOIN alignment a ON s.alignment_id = a.id WHERE a.alignment = 'Neutral';	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.skin_colour_id = c.id JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_value = 100;	superhero
SELECT COUNT(*)  FROM superhero s JOIN alignment a ON s.alignment_id = a.id JOIN gender g ON s.gender_id = g.id WHERE a.alignment = 'Good' AND g.gender = 'Female';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_value BETWEEN 75 AND 80;	superhero
SELECT r.race  FROM superhero s JOIN race r ON s.race_id = r.id JOIN colour c ON s.hair_colour_id = c.id JOIN gender g ON s.gender_id = g.id WHERE c.colour LIKE '%Blue%' AND g.gender = 'Male';	superhero
SELECT      (CAST(SUM(CASE WHEN s.alignment_id = 2 AND g.id = 2 THEN 1 ELSE 0 END) AS FLOAT) * 100.0 / COUNT(CASE WHEN s.alignment_id = 2 THEN 1 END)) AS percentage FROM superhero s JOIN gender g ON s.gender_id = g.id;	superhero
SELECT SUM(CASE WHEN T1.eye_colour_id = 7 THEN 1 ELSE 0 END) - SUM(CASE WHEN T1.eye_colour_id = 1 THEN 1 ELSE 0 END) FROM superhero T1 WHERE T1.weight_kg IS NULL OR T1.weight_kg = 0;	superhero
SELECT ha.attribute_value FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE s.superhero_name = 'Hulk' AND a.attribute_name = 'Strength';	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Ajax';	superhero
SELECT COUNT(*)  FROM superhero s JOIN colour c ON s.skin_colour_id = c.id JOIN alignment a ON s.alignment_id = a.id WHERE c.colour = 'Green' AND a.alignment = 'Bad';	superhero
SELECT COUNT(*)  FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN publisher p ON s.publisher_id = p.id WHERE g.gender = 'Female' AND p.publisher_name = 'Marvel Comics';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Wind Control' ORDER BY s.superhero_name;	superhero
SELECT g.gender FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id JOIN gender g ON s.gender_id = g.id WHERE sp.power_name = 'Phoenix Force';	superhero
SELECT s.superhero_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'DC Comics' ORDER BY s.weight_kg DESC LIMIT 1;	superhero
SELECT AVG(s.height_cm) FROM superhero s JOIN race r ON s.race_id = r.id JOIN publisher p ON s.publisher_id = p.id WHERE r.race != 'Human' AND p.publisher_name = 'Dark Horse Comics';	superhero
SELECT COUNT(*)  FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' AND ha.attribute_value = 100;	superhero
SELECT      ABS(SUM(CASE WHEN p.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) - SUM(CASE WHEN p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END)) AS difference FROM      superhero s JOIN      publisher p ON s.publisher_id = p.id WHERE      p.publisher_name IN ('DC Comics', 'Marvel Comics');	superhero
SELECT a.attribute_name FROM attribute a JOIN hero_attribute ha ON a.id = ha.attribute_id JOIN superhero s ON s.id = ha.hero_id WHERE s.superhero_name = 'Black Panther' ORDER BY ha.attribute_value ASC LIMIT 1;	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.superhero_name = 'Abomination';	superhero
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1;	superhero
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler';	superhero
SELECT      (SUM(CASE WHEN g.gender = 'Female' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS percentage FROM superhero s JOIN publisher p ON s.publisher_id = p.id JOIN gender g ON s.gender_id = g.id WHERE p.publisher_name = 'George Lucas';	superhero
SELECT (SUM(CASE WHEN a.alignment = 'Good' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS percentage FROM superhero s JOIN publisher p ON s.publisher_id = p.id JOIN alignment a ON s.alignment_id = a.id WHERE p.publisher_name = 'Marvel Comics';	superhero
SELECT COUNT(*)  FROM superhero  WHERE full_name LIKE 'John%'	superhero
SELECT hero_id FROM hero_attribute ORDER BY attribute_value ASC LIMIT 1;	superhero
SELECT full_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Alien');	superhero
SELECT s.full_name FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.weight_kg < 100 AND c.colour = 'Brown';	superhero
SELECT ha.attribute_value FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE s.superhero_name = 'Aquababy';	superhero
SELECT s.weight_kg, r.race FROM superhero s JOIN race r ON s.race_id = r.id WHERE s.id = 40;	superhero
SELECT AVG(s.height_cm)  FROM superhero s JOIN alignment a ON s.alignment_id = a.id WHERE a.alignment = 'Neutral';	superhero
SELECT DISTINCT ha.hero_id FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Intelligence';	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.superhero_name = 'Blackwulf';	superhero
SELECT DISTINCT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id JOIN superhero s ON hp.hero_id = s.id WHERE s.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero);	superhero
SELECT d.driverRef FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 20 AND q.q1 IS NOT NULL ORDER BY      CASE          WHEN INSTR(q.q1, ':') > 0 THEN             CAST(SUBSTR(q.q1, 1, INSTR(q.q1, ':') - 1) AS INTEGER) * 60 +             CAST(SUBSTR(q.q1, INSTR(q.q1, ':') + 1) AS REAL)         ELSE             CAST(q.q1 AS REAL)     END DESC LIMIT 5;	formula_1
SELECT d.surname FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 19 ORDER BY q.q2 ASC LIMIT 1;	formula_1
SELECT DISTINCT r.year FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.location = 'Shanghai';	formula_1
SELECT r.url FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Circuit de Barcelona-Catalunya';	formula_1
SELECT r.name FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.country = 'Germany';	formula_1
SELECT cs.position FROM constructorStandings cs JOIN constructors con ON cs.constructorId = con.constructorId WHERE con.name = 'Renault';	formula_1
SELECT COUNT(*)  FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year = 2010   AND c.country NOT IN (     'Austria', 'Belgium', 'France', 'Germany', 'Hungary', 'Italy', 'Netherlands',     'Portugal', 'Spain', 'Turkey', 'United Kingdom', 'Monaco', 'Switzerland',     'Finland', 'Sweden', 'Norway', 'Denmark', 'Poland', 'Greece', 'Russia',     'Azerbaijan', 'Ukraine', 'Belarus', 'Czech Republic', 'Slovakia', 'Romania',     'Bulgaria', 'Croatia', 'Serbia', 'Albania', 'Montenegro', 'North Macedonia',     'Bosnia and Herzegovina', 'Moldova', 'Lithuania', 'Latvia', 'Estonia',     'Ireland', 'Iceland', 'Luxembourg', 'Andorra', 'San Marino', 'Vatican City',     'Bahrain', 'China', 'India', 'Japan', 'Malaysia', 'Qatar', 'Singapore',     'South Korea', 'Abu Dhabi', 'Saudi Arabia', 'Kazakhstan', 'Uzbekistan',     'Thailand', 'Indonesia', 'Vietnam', 'Philippines', 'Maldives', 'Cyprus',     'Georgia', 'Armenia', 'Iraq', 'Iran', 'Israel', 'Jordan', 'Lebanon', 'Syria'   );	formula_1
SELECT r.name FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.country = 'Spain';	formula_1
SELECT c.lat, c.lng FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.name = 'Australian Grand Prix';	formula_1
SELECT url FROM races WHERE circuitId IN (SELECT circuitId FROM circuits WHERE name = 'Sepang International Circuit');	formula_1
SELECT r.time FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Sepang International Circuit';	formula_1
SELECT c.lat, c.lng FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.name = 'Abu Dhabi Grand Prix';	formula_1
SELECT c.nationality FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId WHERE cr.raceId = 24 AND cr.points = 1;	formula_1
SELECT q.q1 FROM qualifying q JOIN drivers d ON q.driverId = d.driverId WHERE d.forename = 'Bruno' AND d.surname = 'Senna' AND q.raceId = 354;	formula_1
SELECT d.nationality FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 355 AND q.q2 = '1:40.000';	formula_1
SELECT d.number FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 903   AND q.q3 LIKE '1:54%'   AND q.q3 IS NOT NULL;	formula_1
SELECT COUNT(*)  FROM results r JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Bahrain Grand Prix'    AND ra.year = 2007    AND r.time IS NULL;	formula_1
SELECT s.url FROM seasons s JOIN races r ON s.year = r.year WHERE r.raceId = 901;	formula_1
SELECT COUNT(*) FROM results r JOIN races ra ON r.raceId = ra.raceId WHERE ra.date = '2015-11-29'   AND r.statusId = 1;	formula_1
SELECT d.driverId, d.forename, d.surname, d.dob FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 592 AND r.time IS NOT NULL ORDER BY d.dob ASC LIMIT 1;	formula_1
SELECT d.url FROM drivers d JOIN lapTimes l ON d.driverId = l.driverId WHERE l.raceId = 161 AND l.time LIKE '1:27%';	formula_1
SELECT d.nationality FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 933 ORDER BY CAST(r.fastestLapSpeed AS REAL) DESC LIMIT 1;	formula_1
SELECT c.lat, c.lng FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.name = 'Malaysian Grand Prix';	formula_1
SELECT c.url FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId WHERE cr.raceId = 9 ORDER BY cr.points DESC LIMIT 1;	formula_1
SELECT q1 FROM qualifying WHERE raceId = 345 AND driverId IN (SELECT driverId FROM drivers WHERE forename = 'Lucas' AND surname = 'di Grassi');	formula_1
SELECT d.nationality FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 347 AND q.q2 = '1:15.000';	formula_1
SELECT d.code FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 45 AND q.q3 LIKE '1:33%'	formula_1
SELECT r.time  FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.forename = 'Bruce' AND d.surname = 'McLaren' AND r.raceId = 743;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'San Marino Grand Prix'   AND ra.year = 2006   AND r.positionOrder = 2;	formula_1
SELECT s.url FROM seasons s JOIN races r ON s.year = r.year WHERE r.raceId = 901;	formula_1
SELECT COUNT(*) FROM results r JOIN races ra ON r.raceId = ra.raceId JOIN status s ON r.statusId = s.statusId WHERE ra.date = '2015-11-29'   AND s.status != 'Finished';	formula_1
SELECT d.driverId, d.forename, d.surname, d.dob FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 872 AND r.statusId = 1 ORDER BY d.dob DESC LIMIT 1;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN lapTimes l ON r.raceId = l.raceId AND r.driverId = l.driverId WHERE r.raceId = 348 ORDER BY l.milliseconds ASC LIMIT 1;	formula_1
SELECT d.nationality FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.fastestLapSpeed = (     SELECT MAX(fastestLapSpeed)     FROM results     WHERE fastestLapSpeed IS NOT NULL );	formula_1
SELECT      ((r1.fastestLapSpeed - r2.fastestLapSpeed) * 100.0 / r1.fastestLapSpeed) AS percent_faster FROM      results r1 JOIN      results r2 ON r1.driverId = r2.driverId JOIN      drivers d ON r1.driverId = d.driverId WHERE      d.forename = 'Paul'      AND d.surname = 'di Resta'     AND r1.raceId = 853     AND r2.raceId = 854;	formula_1
SELECT      (SUM(CASE WHEN s.status = 'Finished' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS percentage FROM results r JOIN races ra ON r.raceId = ra.raceId JOIN status s ON r.statusId = s.statusId WHERE ra.date = '1983-07-16';	formula_1
SELECT MIN(year) FROM races WHERE name = 'Singapore Grand Prix';	formula_1
SELECT COUNT(*) FROM races WHERE year = 2005; SELECT name FROM races WHERE year = 2005 ORDER BY name DESC;	formula_1
SELECT name FROM races WHERE strftime('%Y-%m', date) = (     SELECT strftime('%Y-%m', MIN(date))     FROM races );	formula_1
SELECT name, date  FROM races  WHERE year = 1999  ORDER BY round DESC  LIMIT 1;	formula_1
SELECT year  FROM races  GROUP BY year  ORDER BY COUNT(*) DESC  LIMIT 1;	formula_1
SELECT name  FROM races r2017 WHERE r2017.year = 2017   AND NOT EXISTS (     SELECT 1      FROM races r2000      WHERE r2000.year = 2000        AND r2000.name = r2017.name   );	formula_1
SELECT c.country, c.name, c.location  FROM circuits c  JOIN races r ON c.circuitId = r.circuitId  WHERE r.name = 'European Grand Prix'  ORDER BY r.year  LIMIT 1;	formula_1
SELECT MAX(r.year) FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name LIKE '%Brands Hatch%'   AND r.name LIKE '%British Grand Prix%';	formula_1
SELECT COUNT(*)  FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Silverstone Circuit' AND r.name = 'British Grand Prix';	formula_1
SELECT d.forename || ' ' || d.surname AS driver_name FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.name = 'Singapore Grand Prix'   AND r.year = 2010 ORDER BY ds.position;	formula_1
SELECT d.forename, d.surname, SUM(rs.points) AS points FROM driverStandings rs JOIN drivers d ON rs.driverId = d.driverId GROUP BY d.driverId, d.forename, d.surname ORDER BY points DESC LIMIT 1;	formula_1
SELECT d.forename, d.surname, r.points FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2017 AND ra.name = 'Chinese Grand Prix' ORDER BY r.points DESC LIMIT 3;	formula_1
SELECT d.forename, d.surname, r.name FROM results res JOIN drivers d ON res.driverId = d.driverId JOIN races r ON res.raceId = r.raceId WHERE res.milliseconds = (SELECT MIN(milliseconds) FROM results WHERE milliseconds IS NOT NULL);	formula_1
SELECT AVG(lt.milliseconds)  FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId JOIN races r ON lt.raceId = r.raceId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton'   AND r.name = 'Malaysian Grand Prix' AND r.year = 2009;	formula_1
SELECT    CAST(COUNT(CASE WHEN r.position IS NULL OR r.position != '1' THEN 1 END) AS FLOAT) * 100 / COUNT(*) AS percentage FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId WHERE d.surname = 'Hamilton'   AND d.forename = 'Lewis'   AND ra.year >= 2010;	formula_1
SELECT      d.forename,     d.surname,     d.nationality,     MAX(r.points) AS max_points FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.position = 1 GROUP BY d.driverId ORDER BY COUNT(*) DESC LIMIT 1;	formula_1
SELECT      CAST((julianday('now') - julianday(dob)) / 365.25 AS INTEGER) AS age,     forename,     surname FROM drivers WHERE nationality = 'Japanese' ORDER BY dob DESC LIMIT 1;	formula_1
SELECT c.name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.year BETWEEN 1990 AND 2000 GROUP BY c.circuitId, c.name HAVING COUNT(*) = 4;	formula_1
SELECT c.name AS circuit_name, c.location, r.name AS race_name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE c.country = 'USA' AND r.year = 2006;	formula_1
SELECT r.name, c.name, c.location FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year = 2005 AND strftime('%m', r.date) = '09';	formula_1
SELECT r.name FROM races r JOIN results re ON r.raceId = re.raceId JOIN drivers d ON re.driverId = d.driverId WHERE d.forename = 'Alex' AND d.surname = 'Yoong' AND re.position < 20;	formula_1
SELECT COUNT(*)  FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId JOIN circuits c ON ra.circuitId = c.circuitId WHERE d.forename = 'Michael'    AND d.surname = 'Schumacher'   AND c.name = 'Sepang International Circuit'   AND r.position = 1;	formula_1
SELECT r.name, r.year FROM races r JOIN lapTimes lt ON r.raceId = lt.raceId JOIN drivers d ON lt.driverId = d.driverId WHERE d.forename = 'Michael'   AND d.surname = 'Schumacher'   AND lt.milliseconds IS NOT NULL ORDER BY lt.milliseconds LIMIT 1;	formula_1
SELECT AVG(r.points) FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId WHERE d.forename = 'Eddie'   AND d.surname = 'Irvine'   AND ra.year = 2000;	formula_1
SELECT r.name, res.points  FROM races r  JOIN results res ON r.raceId = res.raceId  JOIN drivers d ON res.driverId = d.driverId  WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton'  ORDER BY r.year ASC, r.round ASC  LIMIT 1;	formula_1
SELECT r.name, c.country, r.date FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year = 2017 ORDER BY r.date;	formula_1
SELECT      r.name AS race_name,     r.year,     c.location AS circuit_location FROM races r JOIN circuits c ON r.circuitId = c.circuitId JOIN results res ON r.raceId = res.raceId ORDER BY res.laps DESC LIMIT 1;	formula_1
SELECT (COUNT(CASE WHEN c.country = 'Germany' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.name = 'European Grand Prix';	formula_1
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit';	formula_1
SELECT name FROM circuits WHERE name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring') ORDER BY lat DESC LIMIT 1;	formula_1
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit';	formula_1
SELECT country FROM circuits WHERE alt = (SELECT MAX(alt) FROM circuits);	formula_1
SELECT COUNT(*) FROM drivers WHERE code IS NULL;	formula_1
SELECT nationality FROM drivers WHERE dob = (SELECT MIN(dob) FROM drivers);	formula_1
SELECT surname FROM drivers WHERE nationality = 'Italian';	formula_1
SELECT url FROM drivers WHERE forename = 'Anthony' AND surname = 'Davidson';	formula_1
SELECT driverRef FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton';	formula_1
SELECT c.name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.name = 'Spanish Grand Prix' AND r.year = 2009;	formula_1
SELECT DISTINCT r.year FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name LIKE '%Silverstone%';	formula_1
SELECT url FROM races WHERE circuitId IN (SELECT circuitId FROM circuits WHERE name = 'Silverstone Circuit');	formula_1
SELECT time  FROM races  WHERE year = 2010 AND name = 'Abu Dhabi Grand Prix';	formula_1
SELECT COUNT(*)  FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.country = 'Italy';	formula_1
SELECT r.date FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name LIKE '%Circuit de Barcelona-Catalunya%' OR c.name LIKE '%Barcelona%Catalunya%';	formula_1
SELECT DISTINCT c.url FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.name = 'Spanish Grand Prix' AND r.year = 2009;	formula_1
SELECT MIN(r.fastestLapTime)  FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.fastestLapSpeed IS NOT NULL ORDER BY CAST(r.fastestLapSpeed AS REAL) DESC LIMIT 1;	formula_1
SELECT d.driverRef FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Canadian Grand Prix'    AND ra.year = 2007    AND r.position = 1;	formula_1
SELECT DISTINCT r.name FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT r.name FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.forename = 'Lewis'    AND d.surname = 'Hamilton' ORDER BY res.positionOrder ASC LIMIT 1;	formula_1
SELECT MAX(CAST(r.fastestLapSpeed AS REAL)) AS max_fastest_lap_speed FROM results r JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Spanish Grand Prix'   AND ra.year = 2009   AND r.fastestLapSpeed IS NOT NULL   AND TRIM(r.fastestLapSpeed) != ''   AND TRIM(r.fastestLapSpeed, '0123456789.') = '';	formula_1
SELECT DISTINCT r.year FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT r.positionOrder FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId WHERE d.forename = 'Lewis'    AND d.surname = 'Hamilton'   AND ra.name = 'Chinese Grand Prix'   AND ra.year = 2008;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 1989   AND ra.name = 'Australian Grand Prix'   AND r.grid = 4;	formula_1
SELECT COUNT(*)  FROM results r JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Australian Grand Prix'    AND ra.year = 2008    AND r.time IS NOT NULL;	formula_1
SELECT fastestLapTime  FROM results  JOIN drivers ON results.driverId = drivers.driverId  JOIN races ON results.raceId = races.raceId  WHERE drivers.forename = 'Lewis'    AND drivers.surname = 'Hamilton'    AND races.name = '2008 Australian Grand Prix';	formula_1
SELECT r.time  FROM results r JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2008    AND ra.name = 'Chinese Grand Prix'   AND r.position = 2;	formula_1
SELECT d.forename, d.surname, r.time, d.url FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2008    AND ra.name = 'Australian Grand Prix'   AND r.positionOrder = 1;	formula_1
SELECT COUNT(*)  FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE d.nationality = 'British'    AND ra.name = 'Australian Grand Prix'    AND ra.year = 2008;	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2008   AND ra.name = 'Chinese Grand Prix'   AND r.time IS NOT NULL;	formula_1
SELECT SUM(r.points)  FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT AVG(     CASE          WHEN INSTR(r.fastestLapTime, ':') > 0 AND INSTR(r.fastestLapTime, '.') > 0 THEN             CAST(SUBSTR(r.fastestLapTime, 1, INSTR(r.fastestLapTime, ':') - 1) AS REAL) * 60 +             CAST(SUBSTR(r.fastestLapTime, INSTR(r.fastestLapTime, ':') + 1, INSTR(r.fastestLapTime, '.') - INSTR(r.fastestLapTime, ':') - 1) AS REAL) +             CAST('0.' || SUBSTR(r.fastestLapTime, INSTR(r.fastestLapTime, '.') + 1) AS REAL)         WHEN INSTR(r.fastestLapTime, '.') > 0 THEN             CAST(SUBSTR(r.fastestLapTime, 1, INSTR(r.fastestLapTime, '.') - 1) AS REAL) +             CAST('0.' || SUBSTR(r.fastestLapTime, INSTR(r.fastestLapTime, '.') + 1) AS REAL)         ELSE             CAST(r.fastestLapTime AS REAL)     END ) AS average_fastest_lap_time_seconds FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.forename = 'Lewis'   AND d.surname = 'Hamilton'   AND r.fastestLapTime IS NOT NULL   AND TRIM(r.fastestLapTime) != '';	formula_1
SELECT CAST(COUNT(CASE WHEN r.time IS NOT NULL THEN 1 END) AS FLOAT) * 100 / COUNT(*) AS completion_rate FROM results r JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2008 AND ra.name = 'Australian Grand Prix';	formula_1
WITH race_info AS (     SELECT raceId      FROM races      WHERE year = 2008 AND name = 'Australian Grand Prix' ), champion AS (     SELECT milliseconds     FROM results     WHERE raceId IN (SELECT raceId FROM race_info)       AND positionOrder = 1       AND milliseconds IS NOT NULL ), last_driver AS (     SELECT milliseconds     FROM results r     WHERE raceId IN (SELECT raceId FROM race_info)       AND time IS NOT NULL       AND positionOrder = (           SELECT MAX(positionOrder)           FROM results           WHERE raceId IN (SELECT raceId FROM race_info)             AND time IS NOT NULL       ) ) SELECT      ((ld.milliseconds - c.milliseconds) * 100.0 / ld.milliseconds) AS percentage_faster FROM champion c CROSS JOIN last_driver ld;	formula_1
SELECT COUNT(*) FROM circuits WHERE location = 'Adelaide' AND country = 'Australia';	formula_1
SELECT lat, lng FROM circuits WHERE country = 'USA';	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND dob > '1980-12-31';	formula_1
SELECT MAX(cr.points)  FROM constructorResults cr JOIN constructors c ON cr.constructorId = c.constructorId WHERE c.nationality = 'British';	formula_1
SELECT c.name FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId ORDER BY cr.points DESC LIMIT 1;	formula_1
SELECT c.name FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId WHERE cr.raceId = 291 AND cr.points = 0;	formula_1
SELECT COUNT(*)  FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId WHERE c.nationality = 'Japanese' AND cr.points = 0 GROUP BY c.constructorId HAVING COUNT(cr.raceId) = 2;	formula_1
SELECT DISTINCT c.name FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId WHERE cs.position = 1;	formula_1
SELECT COUNT(*)  FROM constructors c JOIN results r ON c.constructorId = r.constructorId WHERE c.nationality = 'French' AND r.laps > 50;	formula_1
SELECT      CAST(COUNT(CASE WHEN res.time IS NOT NULL THEN 1 END) AS FLOAT) * 100 / COUNT(*) AS race_completion_percentage FROM      results res JOIN      drivers d ON res.driverId = d.driverId JOIN      races r ON res.raceId = r.raceId WHERE      d.nationality = 'Japanese'     AND r.year BETWEEN 2007 AND 2009;	formula_1
SELECT      r.year,     AVG(         CAST(SUBSTR(res.time, 1, INSTR(res.time, ':') - 1) AS REAL) * 3600 +         CAST(SUBSTR(res.time, INSTR(res.time, ':') + 1, INSTR(SUBSTR(res.time, INSTR(res.time, ':') + 1), ':') - 1) AS REAL) * 60 +         CAST(SUBSTR(res.time, INSTR(res.time, ':') + INSTR(SUBSTR(res.time, INSTR(res.time, ':') + 1), ':'), LENGTH(res.time)) AS REAL)     ) AS average_time_seconds FROM races r JOIN results res ON r.raceId = res.raceId WHERE r.year < 1975   AND res.time IS NOT NULL   AND res.positionOrder = 1   AND res.time NOT LIKE '+%'   AND res.time NOT LIKE '%-%' GROUP BY r.year;	formula_1
SELECT DISTINCT d.forename, d.surname FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId WHERE CAST(strftime('%Y', d.dob) AS INTEGER) > 1975   AND ds.position = 2;	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN status s ON r.statusId = s.statusId WHERE d.nationality = 'Italian' AND s.status != 'Finished';	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.fastestLapTime IS NOT NULL ORDER BY CAST(r.fastestLapTime AS TIME) LIMIT 1;	formula_1
SELECT r.fastestLap FROM results r JOIN races ra ON r.raceId = ra.raceId JOIN driverStandings ds ON r.raceId = ds.raceId AND r.driverId = ds.driverId WHERE ra.year = 2009   AND ra.round = (SELECT MAX(round) FROM races WHERE year = 2009)   AND ds.position = 1   AND r.fastestLap IS NOT NULL LIMIT 1;	formula_1
SELECT AVG(CAST(r.fastestLapSpeed AS REAL)) FROM results r JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Spanish Grand Prix'   AND ra.year = 2009   AND r.fastestLapSpeed IS NOT NULL   AND r.fastestLapSpeed != '';	formula_1
SELECT r.name, r.year FROM races r JOIN results res ON r.raceId = res.raceId WHERE res.milliseconds IS NOT NULL AND res.statusId = 1 ORDER BY res.milliseconds ASC LIMIT 1;	formula_1
SELECT      CAST(COUNT(DISTINCT CASE          WHEN d.dob < '1985-01-01' AND r.laps > 50 THEN d.driverId          ELSE NULL      END) AS FLOAT) * 100 /      COUNT(DISTINCT d.driverId) AS percentage FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.year BETWEEN 2000 AND 2005;	formula_1
SELECT COUNT(*)  FROM drivers d JOIN lapTimes l ON d.driverId = l.driverId WHERE d.nationality = 'French' AND l.milliseconds < 120000;	formula_1
SELECT code FROM drivers WHERE nationality = 'American';	formula_1
SELECT raceId FROM races WHERE year = 2009;	formula_1
SELECT COUNT(*) FROM results WHERE raceId = 18;	formula_1
SELECT code, nationality = 'Dutch' AS is_netherlandic FROM drivers ORDER BY dob DESC LIMIT 3;	formula_1
SELECT driverRef FROM drivers WHERE forename = 'Robert' AND surname = 'Kubica';	formula_1
SELECT COUNT(*)  FROM drivers  WHERE nationality = 'British' AND strftime('%Y', dob) = '1980';	formula_1
SELECT d.driverRef, MIN(lt.milliseconds) AS earliest_lap_ms FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE d.nationality = 'German'    AND strftime('%Y', d.dob) BETWEEN '1980' AND '1990' GROUP BY d.driverId ORDER BY earliest_lap_ms ASC LIMIT 3;	formula_1
SELECT driverRef  FROM drivers  WHERE nationality = 'German'  ORDER BY dob  LIMIT 1;	formula_1
SELECT DISTINCT d.driverId, d.code FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE strftime('%Y', d.dob) = '1971'   AND r.fastestLapTime IS NOT NULL;	formula_1
SELECT      d.driverId,     d.forename,     d.surname,     lt.time AS latest_lap_time FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE d.nationality = 'Spanish'   AND d.dob < '1982-01-01' ORDER BY lt.milliseconds DESC LIMIT 10;	formula_1
SELECT r.year FROM races r JOIN results res ON r.raceId = res.raceId WHERE res.fastestLapTime IS NOT NULL    AND TRIM(res.fastestLapTime) != ''   AND res.fastestLapTime GLOB '*[0-9]*' ORDER BY (     CASE          WHEN INSTR(res.fastestLapTime, ':') > 0 THEN             CAST(SUBSTR(res.fastestLapTime, 1, INSTR(res.fastestLapTime, ':') - 1) AS INTEGER) * 60000 +             CAST(SUBSTR(res.fastestLapTime, INSTR(res.fastestLapTime, ':') + 1, INSTR(res.fastestLapTime, '.') - INSTR(res.fastestLapTime, ':') - 1) AS INTEGER) * 1000 +             CAST(SUBSTR(res.fastestLapTime, INSTR(res.fastestLapTime, '.') + 1) AS INTEGER)         ELSE             CAST(SUBSTR(res.fastestLapTime, 1, INSTR(res.fastestLapTime, '.') - 1) AS INTEGER) * 1000 +             CAST(SUBSTR(res.fastestLapTime, INSTR(res.fastestLapTime, '.') + 1) AS INTEGER)     END ) ASC LIMIT 1;	formula_1
SELECT r.year FROM races r JOIN lapTimes l ON r.raceId = l.raceId WHERE l.milliseconds IS NOT NULL ORDER BY l.milliseconds DESC LIMIT 1;	formula_1
SELECT driverId FROM lapTimes WHERE lap = 1 ORDER BY milliseconds ASC LIMIT 5;	formula_1
SELECT COUNT(*)  FROM results r WHERE r.raceId > 50 AND r.raceId < 100   AND r.statusId = 2   AND r.time IS NOT NULL;	formula_1
SELECT COUNT(*) AS times_held, location, lat, lng FROM circuits WHERE country = 'Austria' GROUP BY location, lat, lng;	formula_1
SELECT r.round FROM races r JOIN results res ON r.raceId = res.raceId WHERE res.time IS NOT NULL GROUP BY r.round ORDER BY COUNT(*) DESC LIMIT 1;	formula_1
SELECT d.driverRef, d.nationality, d.dob FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 23 AND q.q2 IS NOT NULL;	formula_1
WITH youngest_driver AS (     SELECT driverId, forename, surname     FROM drivers     WHERE dob = (SELECT MAX(dob) FROM drivers) ), first_qualifying_race AS (     SELECT          r.year,         y.forename,         y.surname,         r.name,         r.date,         r.time     FROM qualifying q     JOIN youngest_driver y ON q.driverId = y.driverId     JOIN races r ON q.raceId = r.raceId     ORDER BY r.date ASC, r.time ASC     LIMIT 1 ) SELECT * FROM first_qualifying_race;	formula_1
SELECT COUNT(*)  FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN status s ON r.statusId = s.statusId WHERE d.nationality = 'American' AND s.status = 'Puncture';	formula_1
SELECT c.url FROM constructors c WHERE c.nationality = 'Italian' ORDER BY c.constructorId DESC LIMIT 1;	formula_1
SELECT c.url FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId GROUP BY c.constructorId, c.url ORDER BY SUM(cr.points) DESC LIMIT 1;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN lapTimes l ON d.driverId = l.driverId JOIN races r ON l.raceId = r.raceId WHERE r.name = 'French Grand Prix' AND l.lap = 3 ORDER BY l.milliseconds DESC LIMIT 1;	formula_1
SELECT raceId, MIN(milliseconds) AS fastest_lap_time_ms FROM lapTimes WHERE lap = 1 GROUP BY raceId ORDER BY fastest_lap_time_ms ASC LIMIT 1;	formula_1
SELECT AVG(     CASE         WHEN r.fastestLapTime LIKE '%:%' THEN             (CAST(SUBSTR(r.fastestLapTime, 1, INSTR(r.fastestLapTime, ':') - 1) AS INTEGER) * 60000 +              CAST(SUBSTR(r.fastestLapTime, INSTR(r.fastestLapTime, ':') + 1,                           INSTR(r.fastestLapTime, '.') - INSTR(r.fastestLapTime, ':') - 1) AS INTEGER) * 1000 +              CAST(SUBSTR(r.fastestLapTime, INSTR(r.fastestLapTime, '.') + 1) AS INTEGER))         ELSE             (CAST(SUBSTR(r.fastestLapTime, 1, INSTR(r.fastestLapTime, '.') - 1) AS INTEGER) * 1000 +              CAST(SUBSTR(r.fastestLapTime, INSTR(r.fastestLapTime, '.') + 1) AS INTEGER))     END ) FROM results r JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2006   AND ra.name = 'United States Grand Prix'   AND r.positionOrder <= 10   AND r.fastestLapTime IS NOT NULL   AND r.fastestLapTime GLOB '*[0-9]:[0-9]*.[0-9]*' OR r.fastestLapTime GLOB '[0-9]*.[0-9]*';	formula_1
SELECT d.forename, d.surname, AVG(CAST(REPLACE(p.duration, '.', '') AS REAL)) AS avg_pitstop_duration FROM drivers d JOIN pitStops p ON d.driverId = p.driverId WHERE d.nationality = 'German' AND d.dob BETWEEN '1980-01-01' AND '1985-12-31' GROUP BY d.driverId, d.forename, d.surname ORDER BY avg_pitstop_duration ASC LIMIT 3;	formula_1
SELECT      d.forename,     d.surname,     printf('%02d:%02d:%02d.%03d',         r.milliseconds / 3600000,         (r.milliseconds % 3600000) / 60000,         (r.milliseconds % 60000) / 1000,         r.milliseconds % 1000     ) AS finish_time FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Canadian Grand Prix'   AND ra.year = 2008   AND r.position = 1;	formula_1
SELECT c.constructorRef, c.url FROM constructors c JOIN results r ON c.constructorId = r.constructorId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Singapore Grand Prix'    AND ra.year = 2009    AND r.position = 1;	formula_1
SELECT forename, surname, dob FROM drivers WHERE nationality = 'Austrian'   AND dob >= '1981-01-01'   AND dob <= '1991-12-31';	formula_1
SELECT forename || ' ' || surname AS full_name, url, dob FROM drivers WHERE nationality = 'German' AND dob BETWEEN '1971-01-01' AND '1985-12-31' ORDER BY dob DESC;	formula_1
SELECT location, country, lat, lng FROM circuits WHERE name = 'Hungaroring';	formula_1
SELECT      cr.points,     c.name,     c.nationality FROM      constructorResults cr JOIN      races r ON cr.raceId = r.raceId JOIN      constructors c ON cr.constructorId = c.constructorId WHERE      r.name = 'Monaco Grand Prix'     AND r.year BETWEEN 1980 AND 2010 ORDER BY      cr.points DESC LIMIT 1;	formula_1
SELECT AVG(r.points)  FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId WHERE d.forename = 'Lewis'    AND d.surname = 'Hamilton'    AND ra.name = 'Turkish Grand Prix';	formula_1
SELECT AVG(race_count)  FROM (     SELECT year, COUNT(*) AS race_count     FROM races     WHERE date BETWEEN '2000-01-01' AND '2010-12-31'     GROUP BY year ) AS yearly_race_counts;	formula_1
SELECT nationality FROM drivers GROUP BY nationality ORDER BY COUNT(*) DESC LIMIT 1;	formula_1
WITH DriverCareerPoints AS (     SELECT          ds.driverId,         SUM(ds.points) AS total_points,         SUM(ds.wins) AS total_wins     FROM driverStandings ds     GROUP BY ds.driverId ), RankedDrivers AS (     SELECT          driverId,         total_wins,         RANK() OVER (ORDER BY total_points DESC) AS global_rank     FROM DriverCareerPoints ) SELECT total_wins FROM RankedDrivers WHERE global_rank = 91;	formula_1
SELECT r.name FROM races r JOIN results res ON r.raceId = res.raceId WHERE res.fastestLapTime IS NOT NULL ORDER BY res.fastestLapTime ASC LIMIT 1;	formula_1
SELECT c.location || ', ' || c.country AS full_location FROM circuits c JOIN races r ON c.circuitId = r.circuitId ORDER BY r.date DESC LIMIT 1;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year = 2008   AND c.name = 'Marina Bay Street Circuit'   AND q.position = 1;	formula_1
SELECT      d.forename || ' ' || d.surname AS full_name,     d.nationality,     r.name AS first_race_name FROM drivers d JOIN results res ON d.driverId = res.driverId JOIN races r ON res.raceId = r.raceId WHERE d.dob = (SELECT MAX(dob) FROM drivers) ORDER BY r.date LIMIT 1;	formula_1
SELECT COUNT(*) AS accident_count FROM results r JOIN races ra ON r.raceId = ra.raceId JOIN status s ON r.statusId = s.statusId WHERE ra.name = 'Canadian Grand Prix' AND s.status = 'Accident' GROUP BY r.driverId ORDER BY accident_count DESC LIMIT 1;	formula_1
SELECT d.forename, d.surname, COALESCE(SUM(ds.wins), 0) AS wins FROM drivers d LEFT JOIN driverStandings ds ON d.driverId = ds.driverId WHERE d.dob = (SELECT MIN(dob) FROM drivers WHERE dob IS NOT NULL) GROUP BY d.driverId, d.forename, d.surname;	formula_1
SELECT MAX(duration) FROM pitStops;	formula_1
SELECT time  FROM lapTimes  WHERE milliseconds IS NOT NULL  ORDER BY milliseconds ASC  LIMIT 1;	formula_1
SELECT MAX(p.duration)  FROM pitStops p  JOIN drivers d ON p.driverId = d.driverId  WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT ps.lap FROM pitStops ps JOIN races r ON ps.raceId = r.raceId JOIN drivers d ON ps.driverId = d.driverId WHERE r.year = 2011    AND r.name = 'Australian Grand Prix'   AND d.forename = 'Lewis'    AND d.surname = 'Hamilton';	formula_1
SELECT d.forename, d.surname, p.duration FROM pitStops p JOIN races r ON p.raceId = r.raceId JOIN drivers d ON p.driverId = d.driverId WHERE r.year = 2011 AND r.name = 'Australian Grand Prix';	formula_1
SELECT MIN(milliseconds) FROM lapTimes JOIN drivers ON lapTimes.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN lapTimes l ON d.driverId = l.driverId ORDER BY CAST(l.milliseconds AS INTEGER) LIMIT 20;	formula_1
SELECT c.name, lt.position FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId JOIN races r ON lt.raceId = r.raceId JOIN circuits c ON r.circuitId = c.circuitId WHERE d.forename = 'Lewis'    AND d.surname = 'Hamilton'   AND lt.milliseconds IS NOT NULL ORDER BY lt.milliseconds ASC LIMIT 1;	formula_1
SELECT MIN(lt.milliseconds) AS fastest_lap_ms FROM lapTimes lt JOIN races r ON lt.raceId = r.raceId WHERE r.name = 'Austrian Grand Prix';	formula_1
WITH FastestLaps AS (     SELECT          c.circuitId,         c.name AS circuit_name,         l.time AS lap_time,         l.milliseconds,         ROW_NUMBER() OVER (PARTITION BY c.circuitId ORDER BY l.milliseconds ASC) AS rn     FROM circuits c     JOIN races r ON c.circuitId = r.circuitId     JOIN lapTimes l ON r.raceId = l.raceId     WHERE c.country = 'Italy' ) SELECT      circuit_name,     milliseconds AS min_millis,     lap_time FROM FastestLaps WHERE rn = 1 ORDER BY min_millis;	formula_1
SELECT r.name FROM races r JOIN circuits c ON r.circuitId = c.circuitId JOIN results res ON r.raceId = res.raceId WHERE c.name = 'Austrian Grand Prix' ORDER BY res.fastestLapTime ASC LIMIT 1;	formula_1
SELECT duration FROM pitStops WHERE raceId IN (     SELECT raceId     FROM races     WHERE name = 'Austrian Grand Prix' ) AND driverId = (     SELECT l.driverId     FROM lapTimes l     JOIN races r ON l.raceId = r.raceId     WHERE r.name = 'Austrian Grand Prix'     ORDER BY l.milliseconds     LIMIT 1 );	formula_1
SELECT c.lat, c.lng FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN lapTimes l ON r.raceId = l.raceId GROUP BY c.circuitId, c.lat, c.lng HAVING MIN(l.milliseconds) = 89488;	formula_1
SELECT AVG(p.milliseconds)  FROM pitStops p JOIN drivers d ON p.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT AVG(lt.milliseconds) FROM lapTimes lt JOIN races r ON lt.raceId = r.raceId JOIN circuits c ON r.circuitId = c.circuitId WHERE c.country = 'Italy';	formula_1
SELECT player_api_id FROM Player_Attributes WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT player_name, height FROM Player ORDER BY height DESC LIMIT 1;	european_football_2
SELECT preferred_foot  FROM Player_Attributes  WHERE potential = (SELECT MIN(potential) FROM Player_Attributes);	european_football_2
SELECT COUNT(*)  FROM Player_Attributes  WHERE overall_rating >= 60    AND overall_rating < 65    AND defensive_work_rate = 'low';	european_football_2
SELECT player_api_id FROM Player_Attributes ORDER BY crossing DESC LIMIT 5;	european_football_2
SELECT L.name FROM Match M JOIN League L ON M.league_id = L.id WHERE M.season = '2015/2016' GROUP BY L.name ORDER BY SUM(M.home_team_goal + M.away_team_goal) DESC LIMIT 1;	european_football_2
SELECT T.team_long_name FROM Team AS T JOIN Match AS M ON T.team_api_id = M.home_team_api_id WHERE M.season = '2015/2016'   AND M.home_team_goal IS NOT NULL   AND M.away_team_goal IS NOT NULL GROUP BY T.team_api_id, T.team_long_name ORDER BY SUM(CASE WHEN M.home_team_goal < M.away_team_goal THEN 1 ELSE 0 END) ASC, T.team_long_name LIMIT 1;	european_football_2
SELECT player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id ORDER BY pa.penalties DESC LIMIT 10;	european_football_2
SELECT T.team_long_name FROM Team AS T JOIN Match AS M ON T.team_api_id = M.away_team_api_id JOIN League AS L ON M.league_id = L.id WHERE L.name = 'Scotland Premier League'   AND M.season = '2009/2010'   AND M.away_team_goal > M.home_team_goal GROUP BY T.team_long_name ORDER BY COUNT(*) DESC LIMIT 1;	european_football_2
SELECT buildUpPlaySpeed FROM Team_Attributes ORDER BY buildUpPlaySpeed DESC LIMIT 4;	european_football_2
SELECT l.name FROM Match m JOIN League l ON m.league_id = l.id WHERE m.season = '2015/2016' GROUP BY l.name ORDER BY SUM(CASE WHEN m.home_team_goal = m.away_team_goal THEN 1 ELSE 0 END) DESC LIMIT 1;	european_football_2
SELECT DISTINCT p.player_name,        CAST(strftime('%Y', 'now') AS INTEGER) - CAST(strftime('%Y', p.birthday) AS INTEGER) AS age FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.sprint_speed >= 97   AND pa.date >= '2013-01-01'   AND pa.date <= '2015-12-31';	european_football_2
SELECT l.name, COUNT(m.id) AS match_count FROM Match m JOIN League l ON m.league_id = l.id GROUP BY l.id, l.name ORDER BY match_count DESC LIMIT 1;	european_football_2
SELECT AVG(height)  FROM Player  WHERE birthday >= '1990-01-01 00:00:00' AND birthday < '1996-01-01 00:00:00';	european_football_2
WITH yearly_data AS (   SELECT player_api_id, overall_rating   FROM Player_Attributes   WHERE substr(date, 1, 4) = '2010' ), above_avg AS (   SELECT player_api_id, overall_rating   FROM yearly_data   WHERE overall_rating > (SELECT AVG(overall_rating) FROM yearly_data) ) SELECT player_api_id FROM above_avg WHERE overall_rating = (SELECT MAX(overall_rating) FROM above_avg);	european_football_2
SELECT team_fifa_api_id  FROM Team_Attributes  WHERE buildUpPlaySpeed > 50 AND buildUpPlaySpeed < 60;	european_football_2
SELECT DISTINCT T.team_long_name FROM Team T JOIN Team_Attributes TA ON T.team_api_id = TA.team_api_id WHERE strftime('%Y', TA.date) = '2012'   AND TA.buildUpPlayPassing IS NOT NULL   AND TA.buildUpPlayPassing > (     SELECT AVG(TA2.buildUpPlayPassing)     FROM Team_Attributes TA2     WHERE strftime('%Y', TA2.date) = '2012'       AND TA2.buildUpPlayPassing IS NOT NULL   );	european_football_2
SELECT      CAST(SUM(CASE WHEN pa.preferred_foot = 'left' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) AS percentage FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.birthday >= '1987-01-01' AND p.birthday < '1993-01-01';	european_football_2
SELECT      l.name,     SUM(m.home_team_goal + m.away_team_goal) AS total_goals FROM      Match m JOIN      League l ON m.league_id = l.id GROUP BY      l.name ORDER BY      total_goals ASC LIMIT 5;	european_football_2
SELECT AVG(long_shots)  FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Ahmed Samir Farag';	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.height > 180 GROUP BY p.player_api_id, p.player_name ORDER BY AVG(pa.heading_accuracy) DESC LIMIT 10;	european_football_2
SELECT T.team_long_name FROM Team T JOIN Team_Attributes TA ON T.team_api_id = TA.team_api_id WHERE TA.buildUpPlayDribblingClass = 'Normal'   AND TA.date >= '2014-01-01 00:00:00'   AND TA.date <= '2014-01-31 00:00:00' GROUP BY T.team_api_id, T.team_long_name HAVING AVG(TA.chanceCreationPassing) < (     SELECT AVG(chanceCreationPassing)     FROM Team_Attributes     WHERE buildUpPlayDribblingClass = 'Normal'       AND date >= '2014-01-01 00:00:00'       AND date <= '2014-01-31 00:00:00' ) ORDER BY AVG(TA.chanceCreationPassing) DESC;	european_football_2
SELECT L.name FROM League L JOIN Match M ON L.id = M.league_id WHERE M.season = '2009/2010' GROUP BY L.name HAVING AVG(M.home_team_goal) > AVG(M.away_team_goal);	european_football_2
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers';	european_football_2
SELECT player_name, birthday FROM Player WHERE substr(birthday, 1, 4) = '1970' AND substr(birthday, 6, 2) = '10';	european_football_2
SELECT pa.attacking_work_rate FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Franco Zennaro';	european_football_2
SELECT buildUpPlayPositioningClass  FROM Team_Attributes  WHERE team_api_id = (SELECT team_api_id FROM Team WHERE team_long_name = 'ADO Den Haag')  LIMIT 1;	european_football_2
SELECT pa.heading_accuracy FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Francois Affolter'   AND pa.date = '2014-09-18 00:00:00';	european_football_2
SELECT pa.overall_rating FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Gabriel Tamas'   AND strftime('%Y', pa.date) = '2011';	european_football_2
SELECT COUNT(*)  FROM Match m JOIN League l ON m.league_id = l.id WHERE m.season = '2015/2016' AND l.name = 'Scotland Premier League';	european_football_2
SELECT pa.preferred_foot FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.birthday = (     SELECT MAX(birthday)     FROM Player     WHERE birthday IS NOT NULL ) AND pa.date = (     SELECT MAX(date)     FROM Player_Attributes     WHERE player_api_id = p.player_api_id ) ORDER BY pa.id DESC LIMIT 1;	european_football_2
SELECT player_name FROM Player WHERE player_api_id IN (     SELECT player_api_id     FROM Player_Attributes     WHERE potential = (SELECT MAX(potential) FROM Player_Attributes) );	european_football_2
SELECT COUNT(*)  FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.weight < 130 AND pa.preferred_foot = 'left';	european_football_2
SELECT T.team_short_name FROM Team T JOIN Team_Attributes TA ON T.team_api_id = TA.team_api_id WHERE TA.chanceCreationPassingClass = 'Risky';	european_football_2
SELECT defensive_work_rate  FROM Player_Attributes  WHERE player_api_id IN (SELECT player_api_id FROM Player WHERE player_name = 'David Wilson');	european_football_2
SELECT p.birthday FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id ORDER BY pa.overall_rating DESC LIMIT 1;	european_football_2
SELECT League.name  FROM League  JOIN Country ON League.country_id = Country.id  WHERE Country.name = 'Netherlands';	european_football_2
SELECT AVG(m.home_team_goal) FROM Match m JOIN Country c ON m.country_id = c.id WHERE c.name = 'Poland' AND m.season = '2010/2011';	european_football_2
SELECT MAX(avg_finishing) AS highest_average_finishing_rate FROM (     SELECT AVG(pa.finishing) AS avg_finishing     FROM Player p     JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id     WHERE p.height = (SELECT MAX(height) FROM Player)     GROUP BY p.player_api_id     UNION ALL     SELECT AVG(pa.finishing) AS avg_finishing     FROM Player p     JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id     WHERE p.height = (SELECT MIN(height) FROM Player)     GROUP BY p.player_api_id );	european_football_2
SELECT player_name FROM Player WHERE height > 180;	european_football_2
SELECT COUNT(*) FROM Player WHERE strftime('%Y', birthday) > '1990';	european_football_2
SELECT COUNT(*)  FROM Player  WHERE player_name LIKE 'Adam %'    AND weight > 170;	european_football_2
SELECT DISTINCT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating > 80   AND strftime('%Y', pa.date) BETWEEN '2008' AND '2010';	european_football_2
SELECT pa.potential FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Aaron Doran' ORDER BY pa.date DESC LIMIT 1;	european_football_2
SELECT player_name FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE Player_Attributes.preferred_foot = 'left';	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeedClass = 'Fast';	european_football_2
SELECT buildUpPlayPassingClass  FROM Team_Attributes ta JOIN Team t ON ta.team_api_id = t.team_api_id WHERE t.team_short_name = 'CLB';	european_football_2
SELECT T.team_short_name FROM Team T JOIN Team_Attributes TA ON T.team_api_id = TA.team_api_id WHERE TA.buildUpPlayPassing > 70;	european_football_2
SELECT AVG(t2.overall_rating) FROM Player t1 JOIN Player_Attributes t2 ON t1.player_api_id = t2.player_api_id WHERE t1.height > 170   AND strftime('%Y', t2.date) BETWEEN '2010' AND '2015';	european_football_2
SELECT player_name FROM Player ORDER BY height ASC LIMIT 1;	european_football_2
SELECT c.name  FROM Country c  JOIN League l ON c.id = l.country_id  WHERE l.name = 'Italy Serie A';	european_football_2
SELECT T.team_short_name FROM Team_Attributes TA JOIN Team T ON TA.team_api_id = T.team_api_id WHERE TA.buildUpPlaySpeed = 31   AND TA.buildUpPlayDribbling = 53   AND TA.buildUpPlayPassing = 32;	european_football_2
SELECT AVG(overall_rating)  FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Aaron Doran';	european_football_2
SELECT COUNT(*)  FROM Match m JOIN League l ON m.league_id = l.id WHERE l.name = 'Germany 1. Bundesliga'   AND strftime('%Y-%m', m.date) BETWEEN '2008-08' AND '2008-10';	european_football_2
SELECT T.team_short_name FROM Team T JOIN Match M ON T.team_api_id = M.home_team_api_id WHERE M.home_team_goal = 10;	european_football_2
SELECT player_name  FROM Player  JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id  WHERE potential = 61  ORDER BY balance DESC  LIMIT 1;	european_football_2
SELECT      (SUM(CASE WHEN p.player_name = 'Abdou Diallo' THEN pa.ball_control ELSE 0 END) * 1.0 / COUNT(CASE WHEN p.player_name = 'Abdou Diallo' THEN pa.id ELSE NULL END)) -      (SUM(CASE WHEN p.player_name = 'Aaron Appindangoye' THEN pa.ball_control ELSE 0 END) * 1.0 / COUNT(CASE WHEN p.player_name = 'Aaron Appindangoye' THEN pa.id ELSE NULL END)) AS difference FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name IN ('Abdou Diallo', 'Aaron Appindangoye');	european_football_2
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN';	european_football_2
SELECT      CASE          WHEN p1.birthday < p2.birthday THEN 'Aaron Lennon'         ELSE 'Abdelaziz Barrada'     END AS older_player FROM Player p1, Player p2 WHERE p1.player_name = 'Aaron Lennon' AND p2.player_name = 'Abdelaziz Barrada';	european_football_2
SELECT player_name FROM Player ORDER BY height DESC LIMIT 1;	european_football_2
SELECT COUNT(*)  FROM Player_Attributes  WHERE preferred_foot = 'left'    AND attacking_work_rate = 'low';	european_football_2
SELECT c.name FROM Country c JOIN League l ON c.id = l.country_id WHERE l.name = 'Belgium Jupiler League';	european_football_2
SELECT l.name FROM League l JOIN Country c ON l.country_id = c.id WHERE c.name = 'Germany';	european_football_2
SELECT player_name FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id ORDER BY overall_rating DESC LIMIT 1;	european_football_2
SELECT COUNT(DISTINCT Player.player_api_id) FROM Player_Attributes JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id WHERE Player.birthday < '1986-01-01'   AND Player_Attributes.defensive_work_rate = 'high';	european_football_2
SELECT player_name  FROM Player_Attributes pa  JOIN Player p ON pa.player_api_id = p.player_api_id  WHERE p.player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone')  ORDER BY pa.crossing DESC  LIMIT 1;	european_football_2
SELECT pa.heading_accuracy FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Ariel Borysiuk';	european_football_2
SELECT COUNT(*)  FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.height > 180 AND pa.volleys > 70;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.volleys > 70 AND pa.dribbling > 70;	european_football_2
SELECT COUNT(*)  FROM Match m JOIN Country c ON m.country_id = c.id WHERE m.season = '2008/2009' AND c.name = 'Belgium';	european_football_2
SELECT long_passing FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id ORDER BY p.birthday ASC LIMIT 1;	european_football_2
SELECT COUNT(*)  FROM `Match` m JOIN `League` l ON m.league_id = l.id WHERE l.name = 'Belgium Jupiler League'    AND SUBSTR(m.date, 1, 7) = '2009-04';	european_football_2
SELECT l.name FROM League l JOIN Match m ON l.id = m.league_id WHERE m.season = '2008/2009' GROUP BY l.name ORDER BY COUNT(m.id) DESC LIMIT 1;	european_football_2
SELECT AVG(pa.overall_rating) FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE strftime('%Y', p.birthday) < '1986';	european_football_2
SELECT      ((SELECT overall_rating FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Ariel Borysiuk' LIMIT 1) -       (SELECT overall_rating FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Paulin Puel' LIMIT 1)) * 100.0 /      (SELECT overall_rating FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Paulin Puel' LIMIT 1) AS percentage_difference;	european_football_2
SELECT AVG(buildUpPlaySpeed)  FROM Team_Attributes  JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id  WHERE Team.team_long_name = 'Heart of Midlothian';	european_football_2
SELECT AVG(T1.overall_rating)  FROM Player_Attributes T1  JOIN Player T2 ON T1.player_api_id = T2.player_api_id  WHERE T2.player_name = 'Pietro Marino';	european_football_2
SELECT SUM(T1.crossing)  FROM Player_Attributes AS T1  JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id  WHERE T2.player_name = 'Aaron Lennox';	european_football_2
SELECT chanceCreationPassing, chanceCreationPassingClass FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE Team.team_long_name = 'Ajax' ORDER BY chanceCreationPassing DESC LIMIT 1;	european_football_2
SELECT preferred_foot  FROM Player_Attributes  WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Abdou Diallo')  LIMIT 1;	european_football_2
SELECT MAX(T1.overall_rating)  FROM Player_Attributes AS T1  INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id  WHERE T2.player_name = 'Dorlan Pabon';	european_football_2
SELECT AVG(away_team_goal)  FROM Match  JOIN Team ON Match.away_team_api_id = Team.team_api_id  JOIN Country ON Match.country_id = Country.id  WHERE Team.team_long_name = 'Parma' AND Country.name = 'Italy';	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating = 77   AND pa.date >= '2016-06-23'   AND pa.date < '2016-06-24' ORDER BY p.birthday ASC LIMIT 1;	european_football_2
SELECT pa.overall_rating FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Aaron Mooy'   AND pa.date LIKE '2016-02-04%';	european_football_2
SELECT pa.potential FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Francesco Parravicini'   AND pa.date LIKE '2010-08-30%';	european_football_2
SELECT pa.attacking_work_rate FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Francesco Migliore'   AND pa.date LIKE '2015-05-01%';	european_football_2
SELECT defensive_work_rate  FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Kevin Berigaud'    AND DATE(pa.date) = '2013-02-22';	european_football_2
SELECT date  FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Kevin Constant' ORDER BY pa.crossing DESC, pa.date ASC LIMIT 1;	european_football_2
SELECT buildUpPlaySpeedClass  FROM Team_Attributes TA JOIN Team T ON TA.team_api_id = T.team_api_id WHERE T.team_long_name = 'Willem II'   AND TA.date LIKE '2012-02-22%';	european_football_2
SELECT ta.buildUpPlayDribblingClass FROM Team_Attributes ta JOIN Team t ON ta.team_api_id = t.team_api_id WHERE t.team_short_name = 'LEI'   AND ta.date <= '2015-09-10 23:59:59' ORDER BY ta.date DESC LIMIT 1;	european_football_2
SELECT ta.buildUpPlayPassingClass FROM Team_Attributes ta JOIN Team t ON ta.team_api_id = t.team_api_id WHERE t.team_long_name = 'FC Lorient'   AND ta.date LIKE '2010-02-22%';	european_football_2
SELECT ta.chanceCreationPassingClass  FROM Team_Attributes ta JOIN Team t ON ta.team_api_id = t.team_api_id WHERE t.team_long_name = 'PEC Zwolle'   AND ta.date LIKE '2013-09-20%';	european_football_2
SELECT ta.chanceCreationCrossingClass FROM Team_Attributes ta JOIN Team t ON ta.team_api_id = t.team_api_id WHERE t.team_long_name = 'Hull City'   AND ta.date = '2010-02-22 00:00:00';	european_football_2
SELECT ta.defenceAggressionClass FROM Team_Attributes ta JOIN Team t ON ta.team_api_id = t.team_api_id WHERE t.team_long_name = 'Hannover 96'   AND ta.date LIKE '2015-09-10%';	european_football_2
SELECT AVG(overall_rating)  FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Marko Arnautovic'   AND SUBSTR(pa.date, 1, 10) BETWEEN '2007-02-22' AND '2016-04-21';	european_football_2
WITH donovan_rating AS (     SELECT pa.overall_rating     FROM Player p     JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id     WHERE p.player_name = 'Landon Donovan'       AND pa.date <= '2013-07-12 23:59:59'     ORDER BY pa.date DESC     LIMIT 1 ), bowery_rating AS (     SELECT pa.overall_rating     FROM Player p     JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id     WHERE p.player_name = 'Jordan Bowery'       AND pa.date <= '2013-07-12 23:59:59'     ORDER BY pa.date DESC     LIMIT 1 ) SELECT      CAST((dr.overall_rating - br.overall_rating) AS FLOAT) * 100.0 / br.overall_rating AS percentage_higher FROM donovan_rating dr CROSS JOIN bowery_rating br WHERE dr.overall_rating IS NOT NULL    AND br.overall_rating IS NOT NULL    AND br.overall_rating > 0;	european_football_2
SELECT player_name FROM Player ORDER BY height DESC LIMIT 1;	european_football_2
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10;	european_football_2
SELECT player_name FROM (   SELECT player_name,          strftime('%Y', 'now') - strftime('%Y', birthday) -            (CASE WHEN strftime('%m-%d', 'now') < strftime('%m-%d', birthday) THEN 1 ELSE 0 END) AS age   FROM Player ) WHERE age >= 35;	european_football_2
SELECT COUNT(*)  FROM Match m JOIN Player p ON p.player_name = 'Aaron Lennon' WHERE p.player_api_id IN (     m.home_player_1, m.home_player_2, m.home_player_3,     m.home_player_4, m.home_player_5, m.home_player_6,     m.home_player_7, m.home_player_8, m.home_player_9,     m.home_player_10, m.home_player_11 ) AND m.goal LIKE '%"' || CAST(p.player_api_id AS TEXT) || '"%'	european_football_2
SELECT COUNT(*)  FROM Match m,       (SELECT 'Daan Smith' AS player_name UNION SELECT 'Filipe Ferreira') target_players WHERE m.goal LIKE '%' || target_players.player_name || '%';	european_football_2
SELECT SUM(m.home_team_goal) AS total_goals FROM Match m WHERE EXISTS (     SELECT 1     FROM Player p     WHERE p.player_api_id IN (         m.home_player_1, m.home_player_2, m.home_player_3,         m.home_player_4, m.home_player_5, m.home_player_6,         m.home_player_7, m.home_player_8, m.home_player_9,         m.home_player_10, m.home_player_11     )     AND (julianday('now') - julianday(p.birthday)) / 365.25 <= 30 );	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id ORDER BY pa.overall_rating DESC LIMIT 1;	european_football_2
SELECT player_name FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE potential = (SELECT MAX(potential) FROM Player_Attributes);	european_football_2
SELECT DISTINCT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.attacking_work_rate = 'high';	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.finishing = 1 ORDER BY p.birthday ASC LIMIT 1;	european_football_2
SELECT DISTINCT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id JOIN Match m ON pa.match_api_id = m.match_api_id JOIN Country c ON m.country_id = c.id WHERE c.name = 'Belgium';	european_football_2
SELECT DISTINCT p.player_name, pa.vision FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.vision > 89;	european_football_2
WITH match_players AS (     SELECT home_player_1 AS player_api_id, league_id FROM Match WHERE home_player_1 IS NOT NULL     UNION ALL SELECT home_player_2, league_id FROM Match WHERE home_player_2 IS NOT NULL     UNION ALL SELECT home_player_3, league_id FROM Match WHERE home_player_3 IS NOT NULL     UNION ALL SELECT home_player_4, league_id FROM Match WHERE home_player_4 IS NOT NULL     UNION ALL SELECT home_player_5, league_id FROM Match WHERE home_player_5 IS NOT NULL     UNION ALL SELECT home_player_6, league_id FROM Match WHERE home_player_6 IS NOT NULL     UNION ALL SELECT home_player_7, league_id FROM Match WHERE home_player_7 IS NOT NULL     UNION ALL SELECT home_player_8, league_id FROM Match WHERE home_player_8 IS NOT NULL     UNION ALL SELECT home_player_9, league_id FROM Match WHERE home_player_9 IS NOT NULL     UNION ALL SELECT home_player_10, league_id FROM Match WHERE home_player_10 IS NOT NULL     UNION ALL SELECT home_player_11, league_id FROM Match WHERE home_player_11 IS NOT NULL     UNION ALL SELECT away_player_1, league_id FROM Match WHERE away_player_1 IS NOT NULL     UNION ALL SELECT away_player_2, league_id FROM Match WHERE away_player_2 IS NOT NULL     UNION ALL SELECT away_player_3, league_id FROM Match WHERE away_player_3 IS NOT NULL     UNION ALL SELECT away_player_4, league_id FROM Match WHERE away_player_4 IS NOT NULL     UNION ALL SELECT away_player_5, league_id FROM Match WHERE away_player_5 IS NOT NULL     UNION ALL SELECT away_player_6, league_id FROM Match WHERE away_player_6 IS NOT NULL     UNION ALL SELECT away_player_7, league_id FROM Match WHERE away_player_7 IS NOT NULL     UNION ALL SELECT away_player_8, league_id FROM Match WHERE away_player_8 IS NOT NULL     UNION ALL SELECT away_player_9, league_id FROM Match WHERE away_player_9 IS NOT NULL     UNION ALL SELECT away_player_10, league_id FROM Match WHERE away_player_10 IS NOT NULL     UNION ALL SELECT away_player_11, league_id FROM Match WHERE away_player_11 IS NOT NULL ) SELECT c.name FROM Country c JOIN League l ON c.id = l.country_id JOIN match_players mp ON l.id = mp.league_id JOIN Player p ON mp.player_api_id = p.player_api_id GROUP BY c.id, c.name ORDER BY AVG(p.weight) DESC LIMIT 1;	european_football_2
SELECT T.team_long_name FROM Team T JOIN Team_Attributes TA ON T.team_api_id = TA.team_api_id WHERE TA.buildUpPlaySpeedClass = 'Slow';	european_football_2
SELECT T.team_short_name FROM Team T JOIN Team_Attributes TA ON T.team_api_id = TA.team_api_id WHERE TA.chanceCreationPassingClass = 'Safe';	european_football_2
SELECT AVG(P.height) FROM Player P JOIN Match M ON P.player_api_id IN (     M.home_player_1, M.home_player_2, M.home_player_3,     M.home_player_4, M.home_player_5, M.home_player_6,     M.home_player_7, M.home_player_8, M.home_player_9,     M.home_player_10, M.home_player_11,     M.away_player_1, M.away_player_2, M.away_player_3,     M.away_player_4, M.away_player_5, M.away_player_6,     M.away_player_7, M.away_player_8, M.away_player_9,     M.away_player_10, M.away_player_11 ) JOIN League L ON M.league_id = L.id JOIN Country C ON L.country_id = C.id WHERE C.name = 'Italy';	european_football_2
SELECT player_name FROM Player WHERE height > 180 ORDER BY player_name ASC LIMIT 3;	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND birthday > '1990-12-31 23:59:59';	european_football_2
SELECT      (SELECT jumping FROM Player_Attributes WHERE player_api_id = 6) -      (SELECT jumping FROM Player_Attributes WHERE player_api_id = 23) AS difference	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE preferred_foot = 'right' ORDER BY potential ASC LIMIT 5;	european_football_2
SELECT COUNT(*)  FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.crossing = (SELECT MAX(crossing) FROM Player_Attributes)   AND pa.preferred_foot = 'left';	european_football_2
SELECT      (COUNT(CASE WHEN strength > 80 AND stamina > 80 THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM Player_Attributes;	european_football_2
SELECT c.name  FROM Country c JOIN League l ON c.id = l.country_id WHERE l.name = 'Poland Ekstraklasa';	european_football_2
SELECT home_team_goal, away_team_goal FROM Match JOIN League ON Match.league_id = League.id WHERE Match.date LIKE '2008-09-24%'   AND League.name = 'Belgium Jupiler League';	european_football_2
SELECT pa.sprint_speed, pa.agility, pa.acceleration FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Alexis Blin';	european_football_2
SELECT buildUpPlaySpeedClass  FROM Team_Attributes  WHERE team_api_id = (SELECT team_api_id FROM Team WHERE team_long_name = 'KSV Cercle Brugge')  LIMIT 1;	european_football_2
SELECT COUNT(*)  FROM Match m JOIN League l ON m.league_id = l.id WHERE l.name = 'Italy Serie A' AND m.season = '2015/2016';	european_football_2
SELECT MAX(home_team_goal) FROM Match m JOIN League l ON m.league_id = l.id WHERE l.name = 'Netherlands Eredivisie';	european_football_2
SELECT finishing, curve  FROM Player_Attributes  WHERE player_api_id = (     SELECT player_api_id      FROM Player      ORDER BY weight DESC      LIMIT 1 );	european_football_2
SELECT l.name FROM Match m JOIN League l ON m.league_id = l.id WHERE m.season = '2015/2016' GROUP BY l.name ORDER BY COUNT(m.id) DESC LIMIT 4;	european_football_2
SELECT T.team_long_name FROM Team T JOIN Match M ON T.team_api_id = M.away_team_api_id GROUP BY T.team_api_id, T.team_long_name ORDER BY SUM(M.away_team_goal) DESC LIMIT 1;	european_football_2
SELECT player_name FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id ORDER BY overall_rating DESC LIMIT 1;	european_football_2
SELECT (COUNT(CASE WHEN P.height < 180 AND PA.overall_rating > 70 THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM Player P JOIN Player_Attributes PA ON P.player_api_id = PA.player_api_id;	european_football_2
SELECT      CASE          WHEN COUNT(CASE WHEN Admission = '+' AND SEX = 'M' THEN 1 END) > COUNT(CASE WHEN Admission = '-' AND SEX = 'M' THEN 1 END) THEN 'in-patient'         ELSE 'outpatient'     END AS more_common,     (CAST(COUNT(CASE WHEN Admission = '+' AND SEX = 'M' THEN 1 END) AS REAL) * 100 / NULLIF(COUNT(CASE WHEN Admission = '-' AND SEX = 'M' THEN 1 END), 0)) - 100 AS percentage_deviation FROM Patient;	thrombosis_prediction
SELECT      CAST(COUNT(CASE WHEN CAST(strftime('%Y', Birthday) AS INTEGER) > 1930 AND SEX = 'F' THEN 1 END) AS FLOAT) * 100      / NULLIF(COUNT(CASE WHEN SEX = 'F' THEN 1 END), 0) FROM Patient;	thrombosis_prediction
SELECT      (SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS percentage_inpatient FROM Patient WHERE Birthday BETWEEN '1930-01-01' AND '1940-12-31';	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN p.Admission = '+' THEN 1 ELSE 0 END) AS FLOAT) / SUM(CASE WHEN p.Admission = '-' THEN 1 ELSE 0 END)  FROM Patient p  WHERE p.Diagnosis = 'SLE';	thrombosis_prediction
SELECT p.Diagnosis, l.Date FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.ID = 30609;	thrombosis_prediction
SELECT p.SEX, p.Birthday, e.`Examination Date`, e.Symptoms FROM Patient p LEFT JOIN Examination e ON p.ID = e.ID WHERE p.ID = '163109';	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.LDH > 500;	thrombosis_prediction
SELECT e.ID,         CAST(strftime('%Y', 'now') AS INTEGER) - CAST(strftime('%Y', p.Birthday) AS INTEGER) AS age FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.RVVT = '+';	thrombosis_prediction
SELECT p.ID, p.SEX, p.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Thrombosis = 2;	thrombosis_prediction
SELECT DISTINCT p.* FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE substr(p.Birthday, 1, 4) = '1937'   AND l.T_CHO >= 250;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.ALB < 3.5;	thrombosis_prediction
SELECT (COUNT(CASE WHEN P.SEX = 'F' AND (L.TP < 6.0 OR L.TP > 8.5) THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM Patient P JOIN Laboratory L ON P.ID = L.ID;	thrombosis_prediction
SELECT AVG(e.`aCL IgG`) FROM `Examination` e JOIN `Patient` p ON e.`ID` = p.`ID` WHERE p.`Admission` = '+'   AND p.`Birthday` <= DATE('now', '-50 years');	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  WHERE SEX = 'F'    AND Description >= '1997-01-01'    AND Description < '1998-01-01'    AND Admission = '-';	thrombosis_prediction
SELECT MIN(     CASE          WHEN strftime('%m-%d', "First Date") >= strftime('%m-%d', Birthday)         THEN CAST(strftime('%Y', "First Date") AS INTEGER) - CAST(strftime('%Y', Birthday) AS INTEGER)         ELSE CAST(strftime('%Y', "First Date") AS INTEGER) - CAST(strftime('%Y', Birthday) AS INTEGER) - 1     END ) AS youngest_age FROM Patient WHERE "First Date" IS NOT NULL AND Birthday IS NOT NULL;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE P.SEX = 'F'    AND E.Thrombosis = 1    AND strftime('%Y', E.`Examination Date`) = '1997';	thrombosis_prediction
SELECT MAX(STRFTIME('%Y', p.Birthday)) - MIN(STRFTIME('%Y', p.Birthday)) AS age_gap FROM Patient p WHERE EXISTS (     SELECT 1      FROM Laboratory l      WHERE l.ID = p.ID AND l.TG >= 200 );	thrombosis_prediction
SELECT e.Symptoms, e.Diagnosis FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.Symptoms IS NOT NULL ORDER BY p.Birthday DESC LIMIT 1;	thrombosis_prediction
SELECT CAST(COUNT(DISTINCT L.ID) AS FLOAT) / 12 AS average_male_patients_per_month FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE L.Date BETWEEN '1998-01-01' AND '1998-12-31'   AND P.SEX = 'M';	thrombosis_prediction
SELECT L.Date,         CAST(          (strftime('%Y', P.`First Date`) - strftime('%Y', P.Birthday)) -          CASE             WHEN strftime('%m-%d', P.`First Date`) < strftime('%m-%d', P.Birthday)             THEN 1 ELSE 0           END           AS INTEGER        ) AS age FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Diagnosis = 'SJS' ORDER BY P.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN L.UA <= 8.0 AND P.SEX = 'M' THEN 1 ELSE 0 END) AS FLOAT) / SUM(CASE WHEN L.UA <= 6.5 AND P.SEX = 'F' THEN 1 ELSE 0 END) AS ratio FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE (L.UA <= 8.0 AND P.SEX = 'M') OR (L.UA <= 6.5 AND P.SEX = 'F');	thrombosis_prediction
SELECT COUNT(*) FROM Patient P INNER JOIN (     SELECT ID, MIN(`Examination Date`) AS First_Exam_Date     FROM Examination     WHERE `Examination Date` IS NOT NULL     GROUP BY ID ) E ON P.ID = E.ID WHERE P.`First Date` IS NOT NULL   AND E.First_Exam_Date >= DATE(P.`First Date`, '+1 year');	thrombosis_prediction
SELECT COUNT(*) FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE CAST((julianday(E.`Examination Date`) - julianday(P.Birthday)) / 365.25 AS INTEGER) < 18   AND E.`Examination Date` BETWEEN '1990-01-01' AND '1993-12-31';	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.`T-BIL` >= 2.0;	thrombosis_prediction
SELECT Diagnosis FROM Examination WHERE `Examination Date` BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY Diagnosis ORDER BY COUNT(Diagnosis) DESC LIMIT 1;	thrombosis_prediction
SELECT AVG(1999 - CAST(strftime('%Y', p.Birthday) AS INTEGER)) FROM Patient p INNER JOIN Laboratory l ON p.ID = l.ID WHERE l.Date >= '1991-10-01' AND l.Date < '1991-11-01';	thrombosis_prediction
SELECT      CAST(strftime('%Y', e.`Examination Date`) AS INTEGER) -      CAST(strftime('%Y', p.Birthday) AS INTEGER) -     CASE          WHEN strftime('%m-%d', e.`Examination Date`) < strftime('%m-%d', p.Birthday)          THEN 1 ELSE 0      END AS age,     e.Diagnosis FROM Examination e JOIN Patient p ON e.ID = p.ID JOIN Laboratory l ON e.ID = l.ID AND e.`Examination Date` = l.Date WHERE l.HGB IS NOT NULL ORDER BY l.HGB DESC LIMIT 1;	thrombosis_prediction
SELECT `ANA` FROM `Examination` WHERE `ID` = 3605340 AND `Examination Date` = '1996-12-02';	thrombosis_prediction
SELECT CASE WHEN `T-CHO` < 250 THEN 'Normal' ELSE 'Abnormal' END AS Cholesterol_Status FROM Laboratory WHERE ID = 2927464 AND Date = '1995-09-04';	thrombosis_prediction
SELECT p.SEX  FROM Patient p  WHERE p.Diagnosis = 'AORTITIS'  ORDER BY p.`First Date` ASC  LIMIT 1;	thrombosis_prediction
SELECT `aCL IgM` FROM Examination WHERE ID IN (SELECT ID FROM Patient WHERE Diagnosis = 'SLE' AND Description = '1994-02-19') AND `Examination Date` = '1993-11-12';	thrombosis_prediction
SELECT SEX  FROM Patient  WHERE ID IN (     SELECT ID      FROM Laboratory      WHERE GPT = 9 AND Date = '1992-06-12' );	thrombosis_prediction
SELECT CAST(strftime('%Y', L.Date) AS INTEGER) - CAST(strftime('%Y', P.Birthday) AS INTEGER) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.UA = 8.4    AND L.Date = '1991-10-21';	thrombosis_prediction
SELECT COUNT(*)  FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE P.`First Date` = '1991-06-13'   AND P.Diagnosis = 'SJS'   AND strftime('%Y', L.Date) = '1995';	thrombosis_prediction
SELECT p.Diagnosis  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.Diagnosis = 'SLE' AND e.`Examination Date` = '1997-01-27';	thrombosis_prediction
SELECT e.Symptoms FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.Birthday = '1959-03-01'   AND e.`Examination Date` = '1993-09-27';	thrombosis_prediction
SELECT    CAST((nov.T_CHOL - dec.T_CHOL) AS REAL) * 100 / nov.T_CHOL AS decrease_rate_percent FROM Patient P INNER JOIN (     SELECT ID, AVG(`T-CHO`) AS T_CHOL     FROM Laboratory      WHERE `Date` >= '1981-11-01' AND `Date` < '1981-12-01'     GROUP BY ID ) nov ON P.ID = nov.ID INNER JOIN (     SELECT ID, AVG(`T-CHO`) AS T_CHOL     FROM Laboratory      WHERE `Date` >= '1981-12-01' AND `Date` < '1982-01-01'     GROUP BY ID ) dec ON P.ID = dec.ID WHERE P.Birthday = '1959-02-18'   AND nov.T_CHOL IS NOT NULL    AND dec.T_CHOL IS NOT NULL    AND nov.T_CHOL > 0;	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Diagnosis = 'Behcet'   AND e.`Examination Date` >= '1997-01-01'   AND e.`Examination Date` <= '1997-12-31';	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE e.`Examination Date` BETWEEN '1987-07-06' AND '1996-01-31'   AND l.GPT > 30   AND l.ALB < 4;	thrombosis_prediction
SELECT ID  FROM Patient  WHERE SEX = 'F'    AND strftime('%Y', Birthday) = '1964'    AND Admission = '+';	thrombosis_prediction
SELECT COUNT(*)  FROM Examination  WHERE Thrombosis = 2    AND `ANA Pattern` = 'S'    AND `aCL IgM` > (SELECT AVG(`aCL IgM`) * 1.2 FROM Examination);	thrombosis_prediction
SELECT (SUM(CASE WHEN L.UA <= 6.5 THEN 1 ELSE 0 END) * 100.0 / COUNT(*))  FROM Laboratory L  WHERE L.`U-PRO` > 0 AND L.`U-PRO` < 30;	thrombosis_prediction
SELECT      (SUM(CASE WHEN Diagnosis = 'BEHCET' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS percentage FROM Patient WHERE SEX = 'M' AND strftime('%Y', `First Date`) = '1981';	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '-'   AND l.Date >= '1991-10-01'   AND l.Date < '1991-11-01'   AND l.`T-BIL` < 2.0;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE P.SEX = 'F'   AND P.Birthday >= '1980-01-01'   AND P.Birthday < '1990-01-01'   AND (E.`ANA Pattern` IS NULL OR E.`ANA Pattern` != 'P');	thrombosis_prediction
SELECT p.SEX FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis = 'PSS'   AND l.CRP > 2   AND l.CRE = 1   AND l.LDH = 123;	thrombosis_prediction
SELECT AVG(L.ALB) FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE P.SEX = 'F' AND L.PLT > 400 AND P.Diagnosis = 'SLE';	thrombosis_prediction
SELECT Symptoms FROM Examination WHERE Diagnosis = 'SLE' GROUP BY Symptoms ORDER BY COUNT(*) DESC LIMIT 1;	thrombosis_prediction
SELECT Description, Diagnosis FROM Patient WHERE ID = 48473;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE P.SEX = 'F' AND E.Diagnosis = 'APS';	thrombosis_prediction
SELECT COUNT(DISTINCT ID)  FROM Laboratory  WHERE strftime('%Y', `Date`) = '1997'    AND (TP <= 6 OR TP >= 8.5);	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN e.`Symptoms` LIKE '%thrombocytopenia%' AND p.`Diagnosis` = 'SLE' THEN 1 ELSE 0 END) AS FLOAT) * 100 / SUM(CASE WHEN e.`Symptoms` LIKE '%thrombocytopenia%' THEN 1 ELSE 0 END) AS proportion FROM `Examination` e JOIN `Patient` p ON e.`ID` = p.`ID`;	thrombosis_prediction
SELECT      CAST(SUM(CASE WHEN SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(*)  FROM Patient WHERE strftime('%Y', Birthday) = '1980'   AND Diagnosis LIKE '%RA%';	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'M'   AND e.`Examination Date` BETWEEN '1995-01-01' AND '1997-12-31'   AND e.Diagnosis LIKE '%Behcet%'   AND p.Admission = '-';	thrombosis_prediction
SELECT COUNT(*)  FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'F' AND L.WBC < 3.5;	thrombosis_prediction
SELECT julianday(`Examination Date`) - julianday(`First Date`) FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.ID = 821298;	thrombosis_prediction
SELECT CASE WHEN (L.UA > 8.0 AND P.SEX = 'M') OR (L.UA > 6.5 AND P.SEX = 'F') THEN 'No' ELSE 'Yes' END AS UA_Normal_Range FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE L.ID = 57266;	thrombosis_prediction
SELECT `Date` FROM `Laboratory` WHERE `ID` = 48473 AND `GOT` >= 60;	thrombosis_prediction
SELECT DISTINCT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GOT < 60 AND strftime('%Y', l.Date) = '1994';	thrombosis_prediction
SELECT DISTINCT L1.ID FROM Laboratory L1 JOIN Patient P ON L1.ID = P.ID WHERE P.SEX = 'M'   AND L1.GPT >= 60;	thrombosis_prediction
SELECT p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GPT > 60 ORDER BY p.Birthday ASC;	thrombosis_prediction
SELECT AVG(LDH) FROM Laboratory WHERE LDH < 500;	thrombosis_prediction
SELECT DISTINCT      Patient.ID,      (strftime('%Y', 'now') - strftime('%Y', Patient.Birthday)) AS age FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.LDH BETWEEN 600 AND 800   AND Patient.Birthday IS NOT NULL;	thrombosis_prediction
SELECT DISTINCT p.Admission FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.ALP < 300;	thrombosis_prediction
SELECT ID, CASE WHEN ALP < 300 THEN 'Yes' ELSE 'No' END AS ALP_within_normal_range FROM Laboratory WHERE ID IN (SELECT ID FROM Patient WHERE Birthday = '1982-04-01');	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.TP < 6.0;	thrombosis_prediction
SELECT TP - 8.5 AS deviation FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE Patient.SEX = 'F' AND Laboratory.TP > 8.5;	thrombosis_prediction
SELECT * FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND (l.ALB <= 3.5 OR l.ALB >= 5.5) ORDER BY p.Birthday DESC;	thrombosis_prediction
SELECT      p.ID,     CASE          WHEN MAX(CASE WHEN l.ALB BETWEEN 3.5 AND 5.5 THEN 1 ELSE 0 END) = 1 THEN 'Yes'         WHEN MAX(l.ALB) IS NULL THEN 'No Data'         ELSE 'No'     END AS Albumin_Normal_Range FROM Patient p LEFT JOIN Laboratory l ON p.ID = l.ID WHERE strftime('%Y', p.Birthday) = '1982' GROUP BY p.ID;	thrombosis_prediction
SELECT      CAST(SUM(CASE WHEN p.SEX = 'F' AND l.UA > 6.5 THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID;	thrombosis_prediction
SELECT AVG(latest_labs.UA)  FROM (     SELECT l.ID, l.UA     FROM Laboratory l     JOIN Patient p ON l.ID = p.ID     WHERE l.Date = (         SELECT MAX(l2.Date)         FROM Laboratory l2         WHERE l2.ID = l.ID     )     AND (         (p.SEX = 'M' AND l.UA < 8.0) OR         (p.SEX = 'F' AND l.UA < 6.5)     ) ) AS latest_labs;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.UN = 29;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis LIKE '%RA%' AND l.UN < 30;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.CRE >= 1.5;	thrombosis_prediction
SELECT      SUM(CASE WHEN P.SEX = 'M' THEN 1 ELSE 0 END) > SUM(CASE WHEN P.SEX = 'F' THEN 1 ELSE 0 END) AS result FROM Patient P WHERE EXISTS (     SELECT 1      FROM Laboratory L      WHERE L.ID = P.ID AND L.CRE >= 1.5 );	thrombosis_prediction
SELECT L.`ID`, P.`SEX`, P.`Birthday`, MAX(L.`T-BIL`) AS max_tbil FROM `Laboratory` L JOIN `Patient` P ON L.`ID` = P.`ID` WHERE L.`T-BIL` IS NOT NULL GROUP BY L.`ID`, P.`SEX`, P.`Birthday` ORDER BY max_tbil DESC LIMIT 1;	thrombosis_prediction
SELECT p.SEX, GROUP_CONCAT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l."T-BIL" >= 2.0 GROUP BY p.SEX;	thrombosis_prediction
SELECT L.ID, MAX(L.`T-CHO`) AS `T-CHO` FROM `Laboratory` L JOIN `Patient` P ON L.ID = P.ID WHERE P.Birthday = (SELECT MIN(Birthday) FROM Patient) GROUP BY L.ID ORDER BY `T-CHO` DESC LIMIT 1;	thrombosis_prediction
SELECT AVG(CAST(strftime('%Y', 'now') AS INTEGER) - CAST(strftime('%Y', p.Birthday) AS INTEGER)) FROM Patient p WHERE p.SEX = 'M'    AND p.ID IN (SELECT l.ID FROM Laboratory l WHERE l.`T-CHO` >= 250);	thrombosis_prediction
SELECT DISTINCT p.ID, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TG > 300;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TG >= 200   AND p.Birthday < date('now', '-50 years');	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '-' AND l.CPK < 250;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.Birthday >= '1936-01-01'    AND P.Birthday <= '1956-12-31'   AND P.SEX = 'M'    AND L.CPK >= 250;	thrombosis_prediction
SELECT DISTINCT p.ID, p.SEX, (CAST(strftime('%Y', 'now') AS INTEGER) - CAST(strftime('%Y', p.Birthday) AS INTEGER)) AS age FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GLU >= 180 AND l."T-CHO" < 250;	thrombosis_prediction
SELECT L.ID, L.GLU FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE L.GLU < 180   AND P.Description IS NOT NULL   AND strftime('%Y', P.Description) = '1991';	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.WBC <= 3.5 OR l.WBC >= 9.0 ORDER BY p.SEX, p.Birthday DESC;	thrombosis_prediction
SELECT DISTINCT     p.ID,      (strftime('%Y', 'now') - strftime('%Y', p.Birthday) -          (CASE WHEN strftime('%m-%d', 'now') < strftime('%m-%d', p.Birthday) THEN 1 ELSE 0 END)) AS age,      p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.RBC < 3.5;	thrombosis_prediction
SELECT DISTINCT p.ID, p.Admission FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'F'   AND (CAST(strftime('%Y', 'now') AS INTEGER) - CAST(strftime('%Y', p.Birthday) AS INTEGER) -        CASE             WHEN strftime('%m-%d', p.Birthday) > strftime('%m-%d', 'now') THEN 1             ELSE 0         END) >= 50   AND l.RBC IS NOT NULL   AND (l.RBC <= 3.5 OR l.RBC >= 6.0);	thrombosis_prediction
SELECT DISTINCT p.ID, p.SEX FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '-' AND l.HGB < 10;	thrombosis_prediction
SELECT P.ID, P.SEX FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Diagnosis = 'SLE' AND L.HGB > 10 AND L.HGB < 17 ORDER BY P.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT p.ID,        CAST(strftime('%Y', 'now') AS INTEGER) - CAST(strftime('%Y', p.Birthday) AS INTEGER) AS age FROM Patient p INNER JOIN Laboratory l ON p.ID = l.ID WHERE l.HCT >= 52 GROUP BY p.ID HAVING COUNT(*) >= 2;	thrombosis_prediction
SELECT AVG(HCT) FROM Laboratory WHERE Date >= '1991-01-01' AND Date < '1992-01-01' AND HCT < 29;	thrombosis_prediction
SELECT      SUM(CASE WHEN PLT < 100 THEN 1 ELSE 0 END) AS lower_than_normal,     SUM(CASE WHEN PLT > 400 THEN 1 ELSE 0 END) AS higher_than_normal FROM Laboratory WHERE PLT <= 100 OR PLT >= 400;	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE strftime('%Y', l.Date) = '1984'   AND (julianday('now') - julianday(p.Birthday)) / 365.25 < 50   AND l.PLT BETWEEN 100 AND 400;	thrombosis_prediction
SELECT      CAST(SUM(CASE WHEN P.SEX = 'F' AND L.PT >= 14 THEN 1 ELSE 0 END) AS REAL) * 100 /           NULLIF(SUM(CASE WHEN L.PT >= 14 THEN 1 ELSE 0 END), 0) AS percentage FROM      Patient P     INNER JOIN Laboratory L ON P.ID = L.ID WHERE      P.Birthday <= date('now', '-55 years');	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.`First Date` > '1992-12-31'   AND l.PT < 14;	thrombosis_prediction
SELECT COUNT(*) FROM Examination E INNER JOIN Laboratory L ON E.ID = L.ID WHERE E.`Examination Date` > '1997-01-01'   AND L.APTT < 45;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.APTT > 45 AND e.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M'    AND l.WBC > 3.5    AND l.WBC < 9.0    AND (l.FG <= 150 OR l.FG >= 450);	thrombosis_prediction
SELECT COUNT(DISTINCT L.ID) FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE P.Birthday > '1980-01-01'   AND (L.FG < 150 OR L.FG > 450);	thrombosis_prediction
SELECT DISTINCT p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.`U-PRO` >= 30;	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.`U-PRO` IS NOT NULL AND CAST(l.`U-PRO` AS INTEGER) > 0 AND CAST(l.`U-PRO` AS INTEGER) < 30 AND p.Diagnosis = 'SLE';	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE IGG >= 2000;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE L.IGG > 900 AND L.IGG < 2000 AND E.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT p.Diagnosis  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.IGA BETWEEN 80 AND 500  ORDER BY l.IGA DESC  LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.IGA > 80    AND l.IGA < 500   AND p.`First Date` >= '1990-01-01';	thrombosis_prediction
SELECT Diagnosis FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE L.IGM <= 40 OR L.IGM >= 400 GROUP BY Diagnosis ORDER BY COUNT(Diagnosis) DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.CRP = '+' AND p.Description IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.CRE >= 1.5   AND (CAST((julianday('now') - julianday(P.Birthday)) / 365.25 AS INTEGER)) < 70   AND P.Birthday IS NOT NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID)  FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.RA IN ('-', '+-') AND e.KCT = '+';	thrombosis_prediction
SELECT p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday >= '1985-01-01'   AND l.RA IN ('-', '+-');	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE (     (l.RF GLOB '[0-9]*' AND CAST(l.RF AS REAL) < 20)     OR LOWER(l.RF) IN ('negative', 'neg', '<20', '< 20')     OR LOWER(l.RF) LIKE '%normal%' ) AND (strftime('%Y', 'now') - strftime('%Y', p.Birthday)) -      (CASE          WHEN strftime('%m-%d', 'now') >= strftime('%m-%d', p.Birthday) THEN 0          ELSE 1      END) > 60;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE L.RF < 20 AND E.Thrombosis = '0';	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE l.C3 > 35 AND e.`ANA Pattern` = 'P';	thrombosis_prediction
SELECT Examination.ID  FROM Examination  JOIN Laboratory ON Examination.ID = Laboratory.ID  WHERE Laboratory.HCT <= 29 OR Laboratory.HCT >= 52  ORDER BY Examination.`aCL IgA` DESC  LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT L.ID)  FROM Laboratory L JOIN Examination E ON L.ID = E.ID WHERE E.Thrombosis = 1 AND L.C4 > 10;	thrombosis_prediction
SELECT COUNT(DISTINCT L.ID)  FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE L.RNP IN ('-', '+-') AND P.Admission = '+';	thrombosis_prediction
SELECT MAX(Birthday)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE RNP NOT IN ('-', '+-');	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory L JOIN Examination E ON L.ID = E.ID WHERE L.SM IN ('-', '0')    AND E.Thrombosis = 0;	thrombosis_prediction
SELECT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.SM NOT IN ('negative', '0') ORDER BY Patient.Birthday DESC LIMIT 3;	thrombosis_prediction
SELECT DISTINCT e.ID FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE e.`Examination Date` > '1997-01-01'   AND l.SC170 IN ('negative', '0');	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID)  FROM Patient P JOIN Laboratory L ON P.ID = L.ID JOIN Examination E ON P.ID = E.ID WHERE L.SC170 IN ('negative', '0')   AND P.SEX = 'F'   AND E.Symptoms IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.SSA IN ('-', '+-')   AND p.`First Date` < '2000-01-01';	thrombosis_prediction
SELECT Patient.ID  FROM Laboratory  JOIN Patient ON Laboratory.ID = Patient.ID  WHERE SSA NOT IN ('negative', '0')  ORDER BY Patient.`First Date`  LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.SSB IN ('-', '+-')    AND p.Diagnosis = 'SLE';	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.SSB IN ('negative', '0')   AND e.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID)  FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.CENTROMEA IN ('-', '+-')    AND L.SSB IN ('-', '+-')    AND P.SEX = 'M';	thrombosis_prediction
SELECT DISTINCT p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.DNA >= 8;	thrombosis_prediction
SELECT COUNT(DISTINCT L.ID) FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE L.DNA < '8' AND P.Description IS NULL;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.IGG > 900 AND L.IGG < 2000 AND P.Admission = '+';	thrombosis_prediction
SELECT (COUNT(CASE WHEN L.GOT >= 60 AND P.Diagnosis = 'SLE' THEN 1 END) * 1.0 / COUNT(CASE WHEN L.GOT >= 60 THEN 1 END)) * 100 AS percentage FROM Laboratory L JOIN Patient P ON L.ID = P.ID;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.GOT < 60;	thrombosis_prediction
SELECT MIN(Birthday) FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE GOT >= 60);	thrombosis_prediction
SELECT `Birthday`  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GPT < 60 ORDER BY l.GPT DESC LIMIT 3;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GOT < 60 AND P.SEX = 'M';	thrombosis_prediction
SELECT p.`First Date` FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.LDH < 500 ORDER BY l.LDH DESC LIMIT 1;	thrombosis_prediction
SELECT MAX(L.Date) FROM Laboratory L INNER JOIN Patient P ON L.ID = P.ID WHERE L.LDH >= 500   AND P.`First Date` = (     SELECT MAX(P2.`First Date`)     FROM Patient P2     INNER JOIN Laboratory L2 ON P2.ID = L2.ID     WHERE L2.LDH >= 500       AND P2.`First Date` IS NOT NULL   );	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.ALP >= 300 AND p.Admission = '+';	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '-' AND l.ALP < 300;	thrombosis_prediction
SELECT DISTINCT p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TP < 6.0;	thrombosis_prediction
SELECT COUNT(*)  FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE P.Diagnosis = 'SJS' AND L.TP > 6.0 AND L.TP < 8.5;	thrombosis_prediction
SELECT e.`Examination Date` FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.ALB > 3.5 AND l.ALB < 5.5 ORDER BY l.ALB DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.ALB > 3.5 AND l.ALB < 5.5 AND l.TP BETWEEN 6.0 AND 8.5;	thrombosis_prediction
SELECT e.`aCL IgG`, e.`aCL IgM`, e.`aCL IgA` FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.SEX = 'F'   AND e.ID = (     SELECT l.ID     FROM Laboratory l     JOIN Patient p2 ON l.ID = p2.ID     WHERE p2.SEX = 'F' AND l.UA <= 6.50     ORDER BY l.UA DESC     LIMIT 1   );	thrombosis_prediction
SELECT MAX(e.ANA)  FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.CRE < 1.5;	thrombosis_prediction
SELECT Examination.ID  FROM Laboratory  JOIN Examination ON Laboratory.ID = Examination.ID  WHERE CRE < 1.5  ORDER BY `aCL IgA` DESC  LIMIT 1;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE L.`T-BIL` >= 2.0 AND E.`ANA Pattern` LIKE '%P%';	thrombosis_prediction
SELECT ANA  FROM Examination  JOIN Laboratory ON Examination.ID = Laboratory.ID  WHERE `T-BIL` < 2.0  ORDER BY `T-BIL` DESC  LIMIT 1;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE L.`T-CHO` >= 250 AND E.KCT = '-';	thrombosis_prediction
SELECT COUNT(*)  FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE L.`T-CHO` < 250 AND E.`ANA Pattern` = 'P';	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.TG < 200 AND e.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TG < 200 ORDER BY l.TG DESC LIMIT 1;	thrombosis_prediction
SELECT DISTINCT e.ID FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE e.Thrombosis = 0 AND l.CPK < 250;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE L.CPK < 250    AND (E.KCT = '+' OR E.RVVT = '+' OR E.LAC = '+');	thrombosis_prediction
SELECT MIN(P.Birthday)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.GLU > 180;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.GLU < 180 AND e.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '+' AND l.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis = 'SLE' AND l.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE (l.RBC <= 3.5 OR l.RBC >= 6.0)   AND p.Admission = '-';	thrombosis_prediction
SELECT COUNT(*)  FROM Laboratory l JOIN Patient p ON l.ID = p.ID WHERE l.PLT > 100 AND l.PLT < 400 AND p.Diagnosis IS NOT NULL;	thrombosis_prediction
SELECT L.PLT FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE L.PLT > 100 AND L.PLT < 400 AND P.Diagnosis = 'MCTD';	thrombosis_prediction
SELECT AVG(PT)  FROM Laboratory  JOIN Patient ON Laboratory.ID = Patient.ID  WHERE Patient.SEX = 'M' AND Laboratory.PT < 14;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE (e.Thrombosis = 1 OR e.Thrombosis = 2)   AND l.PT < 14;	thrombosis_prediction
SELECT m.major_name FROM member mem JOIN major m ON mem.link_to_major = m.major_id WHERE mem.first_name = 'Angela' AND mem.last_name = 'Sanders';	student_club
SELECT COUNT(*)  FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.college = 'College of Engineering';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.department = 'Art and Design Department';	student_club
SELECT COUNT(*)  FROM attendance a JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer';	student_club
SELECT m.phone FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer';	student_club
SELECT COUNT(*)  FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer'   AND m.t_shirt_size = 'Medium';	student_club
SELECT link_to_event FROM attendance GROUP BY link_to_event ORDER BY COUNT(link_to_member) DESC LIMIT 1;	student_club
SELECT m.college FROM member mem JOIN major m ON mem.link_to_major = m.major_id WHERE mem.position LIKE '%Vice President%';	student_club
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.first_name = 'Maya' AND m.last_name LIKE 'McLean';	student_club
SELECT COUNT(*)  FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.first_name = 'Sacha'    AND m.last_name = 'Harrison'   AND strftime('%Y', e.event_date) = '2019';	student_club
SELECT COUNT(*)  FROM (     SELECT e.event_id     FROM event e     JOIN attendance a ON e.event_id = a.link_to_event     WHERE e.type = 'Meeting'     GROUP BY e.event_id     HAVING COUNT(a.link_to_member) > 10 ) AS meeting_events;	student_club
SELECT event_name FROM event WHERE event_id IN (     SELECT link_to_event     FROM attendance     GROUP BY link_to_event     HAVING COUNT(link_to_member) > 20 ) AND type != 'fundraiser';	student_club
SELECT AVG(attendee_count) AS average_attendance FROM (     SELECT e.event_id, COUNT(a.link_to_member) AS attendee_count     FROM event e     LEFT JOIN attendance a ON e.event_id = a.link_to_event     WHERE e.type = 'Meeting'       AND strftime('%Y', e.event_date) = '2020'     GROUP BY e.event_id ) AS meeting_attendance;	student_club
SELECT MAX(cost) AS most_expensive_item FROM expense;	student_club
SELECT COUNT(*)  FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Environmental Engineering';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Laugh Out Loud';	student_club
SELECT m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Law and Constitutional Studies';	student_club
SELECT z.county FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Sherri' AND m.last_name = 'Ramsey';	student_club
SELECT m.college FROM major m, member mem WHERE mem.link_to_major = m.major_id   AND mem.first_name = 'Tyler'   AND mem.last_name = 'Hewitt';	student_club
SELECT SUM(i.amount)  FROM income i  JOIN member m ON i.link_to_member = m.member_id  WHERE m.position = 'Vice President';	student_club
SELECT b.spent FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE b.category = 'Food' AND e.event_name = 'September Meeting';	student_club
SELECT z.city, z.state  FROM member m  JOIN zip_code z ON m.zip = z.zip_code  WHERE m.position = 'President';	student_club
SELECT first_name, last_name  FROM member  JOIN zip_code ON member.zip = zip_code.zip_code  WHERE zip_code.state = 'Illinois';	student_club
SELECT b.spent FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE b.category = 'Advertisement' AND e.event_name = 'September Meeting';	student_club
SELECT m.department FROM major m INNER JOIN member mem ON m.major_id = mem.link_to_major WHERE mem.first_name = 'Pierce' OR mem.last_name = 'Guidi' GROUP BY m.department HAVING SUM(CASE WHEN mem.first_name = 'Pierce' THEN 1 ELSE 0 END) >= 1    AND SUM(CASE WHEN mem.last_name = 'Guidi' THEN 1 ELSE 0 END) >= 1;	student_club
SELECT SUM(b.amount)  FROM budget b  JOIN event e ON b.link_to_event = e.event_id  WHERE e.event_name = 'October Speaker';	student_club
SELECT e.expense_description, e.approved FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.event_name = 'October Meeting' AND ev.event_date = '2019-10-08';	student_club
SELECT AVG(e.cost) AS average_cost FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.first_name = 'Elijah'    AND m.last_name = 'Allen'   AND SUBSTR(e.expense_date, 6, 2) IN ('09', '10');	student_club
SELECT      SUM(CASE WHEN substr(e.event_date, 1, 4) = '2019' THEN b.spent ELSE 0 END) -      SUM(CASE WHEN substr(e.event_date, 1, 4) = '2020' THEN b.spent ELSE 0 END) FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_date IS NOT NULL   AND length(e.event_date) >= 4   AND substr(e.event_date, 1, 4) IN ('2019', '2020');	student_club
SELECT location FROM event WHERE event_name = 'Spring Budget Review';	student_club
SELECT cost FROM expense WHERE expense_description = 'Posters' AND expense_date = '2019-09-04';	student_club
SELECT remaining  FROM budget  WHERE category = 'Food'  ORDER BY amount DESC  LIMIT 1;	student_club
SELECT notes FROM income WHERE source = 'Fundraising' AND date_received = '2019-09-14';	student_club
SELECT COUNT(*) FROM major WHERE college = 'College of Humanities and Social Sciences';	student_club
SELECT phone FROM member WHERE first_name = 'Carlo' AND last_name = 'Jacobs';	student_club
SELECT z.county FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Adela' AND m.last_name = 'O''Gallagher';	student_club
SELECT COUNT(*)  FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'November Meeting' AND b.remaining < 0;	student_club
SELECT SUM(b.amount)  FROM budget b  JOIN event e ON b.link_to_event = e.event_id  WHERE e.event_name = 'September Speaker';	student_club
SELECT e.status FROM event e JOIN budget b ON e.event_id = b.link_to_event JOIN expense exp ON b.budget_id = exp.link_to_budget WHERE exp.expense_description = 'Post Cards, Posters'   AND exp.expense_date = '2019-8-20';	student_club
SELECT major.major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Brent' AND member.last_name = 'Thomason';	student_club
SELECT COUNT(*)  FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Business' AND m.t_shirt_size = 'Medium';	student_club
SELECT z.type  FROM zip_code z  JOIN member m ON z.zip_code = m.zip  WHERE m.first_name = 'Christof' AND m.last_name = 'Nielson';	student_club
SELECT m.major_name FROM member mem JOIN major m ON mem.link_to_major = m.major_id WHERE mem.position = 'Vice President';	student_club
SELECT z.state  FROM member m  JOIN zip_code z ON m.zip = z.zip_code  WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison';	student_club
SELECT ma.department FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.position = 'President';	student_club
SELECT i.date_received  FROM income i  JOIN member m ON i.link_to_member = m.member_id  WHERE m.first_name = 'Connor' AND m.last_name = 'Hilton' AND i.source = 'Dues';	student_club
SELECT m.first_name, m.last_name  FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.source = 'Dues'   AND i.date_received IS NOT NULL ORDER BY DATE(i.date_received) ASC LIMIT 1;	student_club
SELECT CAST(SUM(CASE WHEN e.event_name = 'Yearly Kickoff' THEN b.amount ELSE 0 END) AS REAL) / SUM(CASE WHEN e.event_name = 'October Meeting' THEN b.amount ELSE 0 END)  FROM budget b  JOIN event e ON b.link_to_event = e.event_id  WHERE b.category = 'Advertisement';	student_club
SELECT (SUM(CASE WHEN b.category = 'Parking' THEN b.amount ELSE 0 END) * 100.0 / SUM(b.amount)) AS percentage FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'November Speaker';	student_club
SELECT SUM(cost) FROM expense WHERE expense_description = 'Pizza';	student_club
SELECT COUNT(DISTINCT city)  FROM zip_code  WHERE county = 'Orange County' AND state = 'Virginia';	student_club
SELECT DISTINCT department FROM major WHERE college = 'College of Humanities and Social Sciences';	student_club
SELECT z.city, z.county, z.state  FROM member m  JOIN zip_code z ON m.zip = z.zip_code  WHERE m.first_name = 'Amy' AND m.last_name = 'Firth';	student_club
SELECT e.expense_description FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id WHERE b.remaining = (SELECT MIN(remaining) FROM budget WHERE remaining IS NOT NULL);	student_club
SELECT m.* FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'October Meeting';	student_club
SELECT m.college FROM major m JOIN member mb ON m.major_id = mb.link_to_major GROUP BY m.college ORDER BY COUNT(*) DESC LIMIT 1;	student_club
SELECT m.major_name FROM member mem JOIN major m ON mem.link_to_major = m.major_id WHERE mem.phone = '809-555-3360';	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event ORDER BY b.amount DESC LIMIT 1;	student_club
SELECT e.expense_description FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.position = 'Vice President';	student_club
SELECT COUNT(*)  FROM attendance a JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer';	student_club
SELECT i.date_received FROM income i JOIN member m ON i.link_to_member = m.member_id WHERE m.first_name = 'Casey' AND m.last_name = 'Mason';	student_club
SELECT COUNT(*)  FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE z.state = 'Maryland';	student_club
SELECT COUNT(*)  FROM attendance a JOIN member m ON a.link_to_member = m.member_id WHERE m.phone = '954-555-6240';	student_club
SELECT m.first_name, m.last_name  FROM member m  JOIN major ma ON m.link_to_major = ma.major_id  WHERE ma.department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.status = 'Closed' ORDER BY CAST(b.spent AS REAL) / b.amount DESC LIMIT 1;	student_club
SELECT COUNT(*) FROM member WHERE position = 'President';	student_club
SELECT MAX(spent) FROM budget;	student_club
SELECT COUNT(*)  FROM event  WHERE type = 'Meeting'   AND event_date >= '2020-01-01'   AND event_date < '2021-01-01';	student_club
SELECT SUM(spent) FROM budget WHERE category = 'Food';	student_club
SELECT first_name, last_name FROM member WHERE member_id IN (     SELECT link_to_member     FROM attendance     GROUP BY link_to_member     HAVING COUNT(link_to_event) > 7 );	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major maj ON m.link_to_major = maj.major_id JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE maj.major_name = 'Interior Design'   AND e.event_name = 'Community Theater';	student_club
SELECT m.first_name, m.last_name  FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE z.city = 'Georgetown' AND z.state = 'South Carolina';	student_club
SELECT SUM(income.amount) FROM income JOIN member ON income.link_to_member = member.member_id WHERE member.first_name = 'Grant' AND member.last_name = 'Gilmour';	student_club
SELECT DISTINCT m.first_name, m.last_name FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.amount > 40;	student_club
SELECT SUM(e.cost)  FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.event_name = 'Yearly Kickoff';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN event ev ON m.member_id = ev.link_to_member WHERE ev.event_name = 'Yearly Kickoff';	student_club
SELECT m.first_name, m.last_name, i.source FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.amount = (SELECT MAX(amount) FROM income);	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event ORDER BY b.spent ASC LIMIT 1;	student_club
SELECT (SUM(CASE WHEN e.event_name = 'Yearly Kickoff' THEN ex.cost ELSE 0 END) * 100.0 / SUM(ex.cost)) AS percentage FROM expense ex JOIN budget b ON ex.link_to_budget = b.budget_id JOIN event e ON b.link_to_event = e.event_id;	student_club
SELECT      CAST(SUM(CASE WHEN m.major_name = 'Finance' THEN 1 ELSE 0 END) AS FLOAT)      / NULLIF(SUM(CASE WHEN m.major_name = 'Physics' THEN 1 ELSE 0 END), 0) AS ratio FROM member mb JOIN major m ON mb.link_to_major = m.major_id;	student_club
SELECT source FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' GROUP BY source ORDER BY SUM(amount) DESC LIMIT 1;	student_club
SELECT first_name, last_name, email FROM member WHERE position = 'Secretary';	student_club
SELECT COUNT(*)  FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Physics Teaching';	student_club
SELECT COUNT(*)  FROM attendance a JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Community Theater'   AND substr(e.event_date, 1, 4) = '2019';	student_club
SELECT      COUNT(a.link_to_event) AS number_of_events,      MAX(m.major_name) AS major_name FROM member mem  JOIN major m ON mem.link_to_major = m.major_id  LEFT JOIN attendance a ON a.link_to_member = mem.member_id  WHERE mem.first_name = 'Luisa' AND mem.last_name = 'Guidi';	student_club
SELECT SUM(spent) * 1.0 / COUNT(spent)  FROM budget  WHERE category = 'Food' AND event_status = 'Closed';	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.category = 'Advertisement' ORDER BY b.spent DESC LIMIT 1;	student_club
SELECT    CASE      WHEN EXISTS (       SELECT 1        FROM member m       JOIN attendance a ON m.member_id = a.link_to_member       JOIN event e ON a.link_to_event = e.event_id       WHERE m.first_name = 'Maya'          AND m.last_name = 'Mclean'          AND e.event_name = 'Women''s Soccer'     ) THEN 'Yes'      ELSE 'No'    END AS attended;	student_club
SELECT (SUM(CASE WHEN type = 'Community Service' THEN 1 ELSE 0 END) * 100.0 / COUNT(event_id)) AS percentage_share FROM event WHERE event_date BETWEEN '2019-01-01' AND '2019-12-31';	student_club
SELECT e.cost FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE e.expense_description = 'Posters'   AND ev.event_name = 'September Speaker';	student_club
SELECT t_shirt_size FROM (     SELECT t_shirt_size, COUNT(*) AS size_count     FROM member     WHERE t_shirt_size IS NOT NULL     GROUP BY t_shirt_size     ORDER BY size_count DESC ) LIMIT 1;	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.status = 'Closed' AND b.remaining < 0 ORDER BY b.remaining ASC LIMIT 1;	student_club
SELECT b.category, SUM(ex.cost) AS total_value FROM expense ex JOIN budget b ON ex.link_to_budget = b.budget_id JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'October Meeting'    AND ex.approved = 'Yes' GROUP BY b.category;	student_club
SELECT category, SUM(amount) AS amount_budgeted FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'April Speaker' GROUP BY category ORDER BY amount_budgeted ASC;	student_club
SELECT MAX(amount)  FROM budget  WHERE category = 'Food';	student_club
SELECT * FROM budget WHERE category = 'Advertising' ORDER BY amount DESC LIMIT 3;	student_club
SELECT SUM(cost)  FROM expense  WHERE expense_description = 'Parking';	student_club
SELECT SUM(cost) FROM expense WHERE expense_date = '2019-08-20';	student_club
SELECT m.first_name, m.last_name, COALESCE(SUM(e.cost), 0) AS total_cost FROM member m LEFT JOIN expense e ON m.member_id = e.link_to_member WHERE m.member_id = 'rec4BLdZHS2Blfp4v' GROUP BY m.member_id, m.first_name, m.last_name;	student_club
SELECT e.expense_description FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison';	student_club
SELECT e.expense_description FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.t_shirt_size = 'X-Large';	student_club
SELECT DISTINCT m.zip FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost < 50;	student_club
SELECT m.major_name  FROM major m JOIN member mem ON m.major_id = mem.link_to_major WHERE mem.first_name = 'Phillip' AND mem.last_name = 'Cullen';	student_club
SELECT m.position FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Business';	student_club
SELECT COUNT(*)  FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Business' AND m.t_shirt_size = 'Medium';	student_club
SELECT e.type FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.remaining > 30;	student_club
SELECT type FROM event WHERE location = 'MU 215';	student_club
SELECT e.type  FROM event e  WHERE e.event_date = '2020-03-24T12:00:00';	student_club
SELECT m.major_name  FROM member mem  JOIN major m ON mem.link_to_major = m.major_id  WHERE mem.position = 'Vice President';	student_club
SELECT      COUNT(CASE WHEN m.position = 'Member' AND maj.major_name = 'Business' THEN 1 END) * 100.0 /      NULLIF(COUNT(CASE WHEN m.position = 'Member' THEN 1 END), 0) AS percentage FROM member m LEFT JOIN major maj ON m.link_to_major = maj.major_id;	student_club
SELECT type FROM event WHERE location = 'MU 215';	student_club
SELECT COUNT(*) FROM income WHERE amount = 50;	student_club
SELECT COUNT(*)  FROM member  WHERE position = 'Member' AND t_shirt_size = 'X-Large';	student_club
SELECT COUNT(*)  FROM major  WHERE college = 'College of Agriculture and Applied Sciences'    AND department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT m.last_name, maj.department, maj.college FROM member m JOIN major maj ON m.link_to_major = maj.major_id WHERE maj.major_name = 'Environmental Engineering';	student_club
SELECT b.category FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.location = 'MU 215'   AND e.type = 'Guest Speaker'   AND b.spent = 0;	student_club
SELECT z.city, z.state FROM member m JOIN zip_code z ON m.zip = z.zip_code JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.department = 'Electrical and Computer Engineering Department' AND m.position = 'Member';	student_club
SELECT DISTINCT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE e.type = 'Social'   AND m.position = 'Vice President'   AND e.location = '900 E. Washington St.';	student_club
SELECT m.last_name, m.position FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.expense_description = 'Pizza' AND e.expense_date = '2019-09-10';	student_club
SELECT m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE m.position = 'Member' AND e.event_name = 'Women''s Soccer';	student_club
SELECT      CAST(SUM(has_donated_50) AS FLOAT) * 100.0 / COUNT(*) AS percentage FROM (     SELECT          m.member_id,         MAX(CASE WHEN i.amount = 50 THEN 1 ELSE 0 END) AS has_donated_50     FROM member m     LEFT JOIN income i ON m.member_id = i.link_to_member     WHERE m.t_shirt_size = 'Medium' AND m.position = 'Member'     GROUP BY m.member_id ) t;	student_club
SELECT DISTINCT state FROM zip_code WHERE type = 'PO Box';	student_club
SELECT zip_code  FROM zip_code  WHERE type = 'PO Box'    AND county = 'San Juan Municipio'    AND state = 'Puerto Rico';	student_club
SELECT event_name  FROM event  WHERE type = 'Game'    AND status = 'Closed'    AND event_date BETWEEN '2019-03-15' AND '2020-03-20';	student_club
SELECT DISTINCT e.event_id FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN income i ON a.link_to_member = i.link_to_member WHERE i.amount > 50;	student_club
SELECT DISTINCT      m.member_id,      m.first_name,      m.last_name,      a.link_to_event FROM member m JOIN expense e ON m.member_id = e.link_to_member JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id JOIN attendance a ON m.member_id = a.link_to_member                  AND a.link_to_event = ev.event_id WHERE e.approved = 'true'   AND e.expense_date BETWEEN '2019-01-10' AND '2019-11-19';	student_club
SELECT maj.college FROM member mem JOIN major maj ON mem.link_to_major = maj.major_id WHERE mem.first_name = 'Katy'   AND maj.major_id = 'rec1N0upiVLy5esTO';	student_club
SELECT m.phone FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Business' AND ma.college = 'College of Agriculture and Applied Sciences';	student_club
SELECT m.email FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.expense_date BETWEEN '2019-09-10' AND '2019-11-19'   AND e.cost > 20;	student_club
SELECT COUNT(*)  FROM member m JOIN major maj ON m.link_to_major = maj.major_id WHERE LOWER(TRIM(maj.major_name)) = 'education'   AND LOWER(TRIM(maj.college)) = 'college of education & human services';	student_club
SELECT (SUM(CASE WHEN b.remaining < 0 THEN 1 ELSE 0 END) * 100.0 / COUNT(e.event_id)) AS percentage_over_budget FROM event e JOIN budget b ON e.event_id = b.link_to_event;	student_club
SELECT event_id, location, status  FROM event  WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31';	student_club
SELECT expense_description FROM expense GROUP BY expense_description HAVING AVG(cost) > 50;	student_club
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large';	student_club
SELECT CAST(SUM(CASE WHEN type = 'PO Box' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(zip_code) FROM zip_code;	student_club
SELECT event_name, location  FROM event  JOIN budget ON event.event_id = budget.link_to_event  WHERE budget.remaining > 0;	student_club
SELECT e.event_name, e.event_date FROM event e JOIN budget b ON e.event_id = b.link_to_event JOIN expense exp ON b.budget_id = exp.link_to_budget WHERE exp.expense_description = 'Pizza'   AND exp.cost > 50   AND exp.cost < 100;	student_club
SELECT m.first_name, m.last_name, maj.major_name FROM member m JOIN expense e ON m.member_id = e.link_to_member JOIN major maj ON m.link_to_major = maj.major_id WHERE e.cost > 100;	student_club
SELECT z.city, z.state FROM event e JOIN zip_code z ON e.location = z.zip_code JOIN budget b ON e.event_id = b.link_to_event GROUP BY e.event_id, z.city, z.state HAVING COUNT(b.budget_id) > 40;	student_club
WITH multi_event_members AS (     SELECT          m.member_id,         m.first_name,         m.last_name,         SUM(e.cost) AS total_cost     FROM member m     JOIN expense e ON m.member_id = e.link_to_member     JOIN budget b ON e.link_to_budget = b.budget_id     GROUP BY m.member_id, m.first_name, m.last_name     HAVING COUNT(DISTINCT b.link_to_event) > 1 ) SELECT      first_name,      last_name,      total_cost FROM multi_event_members ORDER BY total_cost DESC LIMIT 1;	student_club
SELECT CAST(SUM(e.cost) AS FLOAT) / COUNT(m.member_id) AS avg_amount_paid_per_student FROM member m LEFT JOIN expense e ON m.member_id = e.link_to_member WHERE m.position IS NULL OR m.position != 'Member';	student_club
WITH parking_costs_per_event AS (     SELECT          e.event_id,         e.event_name,         COALESCE(SUM(exp.cost), 0) AS total_parking_cost     FROM event e     JOIN budget b ON e.event_id = b.link_to_event     JOIN expense exp ON b.budget_id = exp.link_to_budget     WHERE b.category = 'Parking'     GROUP BY e.event_id, e.event_name ), avg_parking_cost AS (     SELECT AVG(total_parking_cost) AS avg_cost     FROM parking_costs_per_event ) SELECT pce.event_name FROM parking_costs_per_event pce CROSS JOIN avg_parking_cost WHERE pce.total_parking_cost < avg_parking_cost.avg_cost;	student_club
SELECT (SUM(e.cost) * 100.0 / COUNT(ev.event_id)) AS percentage FROM event ev LEFT JOIN budget b ON ev.event_id = b.link_to_event LEFT JOIN expense e ON b.budget_id = e.link_to_budget WHERE ev.type = 'Meeting';	student_club
SELECT b.budget_id FROM budget b JOIN expense e ON b.budget_id = e.link_to_budget WHERE e.expense_description = 'Water, chips, cookies' ORDER BY e.cost DESC LIMIT 1;	student_club
SELECT m.first_name, m.last_name FROM member m JOIN expense e ON m.member_id = e.link_to_member GROUP BY m.member_id ORDER BY SUM(e.cost) DESC LIMIT 5;	student_club
SELECT m.first_name, m.last_name, m.phone FROM member m JOIN expense e ON m.member_id = e.link_to_member GROUP BY m.member_id HAVING MIN(e.cost) > (SELECT AVG(cost) FROM expense);	student_club
SELECT      (SUM(CASE WHEN z.state = 'New Jersey' THEN 1.0 ELSE 0.0 END) / COUNT(*)) -      (SUM(CASE WHEN z.state = 'Vermont' THEN 1.0 ELSE 0.0 END) / COUNT(*)) AS difference FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.position = 'Member';	student_club
SELECT m.major_name, m.department FROM member me JOIN major m ON me.link_to_major = m.major_id WHERE me.first_name = 'Garrett' AND me.last_name = 'Gerke';	student_club
SELECT m.first_name, m.last_name, e.cost FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.expense_description = 'Water, Veggie tray, supplies';	student_club
SELECT m.last_name, m.phone FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Elementary Education';	student_club
SELECT b.category, b.amount FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'January Speaker';	student_club
SELECT DISTINCT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.category = 'Food';	student_club
SELECT m.first_name, m.last_name, i.amount FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.date_received = '9/9/2019';	student_club
SELECT b.category FROM budget b JOIN expense e ON b.budget_id = e.link_to_budget WHERE e.expense_description = 'Posters';	student_club
SELECT m.first_name, m.last_name, ma.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.position = 'Secretary';	student_club
SELECT SUM(b.spent) AS total_spent, e.event_name FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE b.category = 'Speaker Gifts' GROUP BY e.event_name;	student_club
SELECT z.city  FROM zip_code z  JOIN member m ON z.zip_code = m.zip  WHERE m.first_name = 'Garrett' AND m.last_name = 'Gerke';	student_club
SELECT m.first_name, m.last_name, m.position FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE z.city = 'Lincolnton' AND z.state = 'North Carolina' AND z.zip_code = 28092;	student_club
SELECT COUNT(*)  FROM gasstations  WHERE Country = 'CZE' AND Segment = 'Premium';	debit_card_specializing
SELECT CAST(SUM(CASE WHEN Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN Currency = 'CZK' THEN 1 ELSE 0 END) AS ratio FROM customers;	debit_card_specializing
SELECT yearmonth.CustomerID  FROM yearmonth  JOIN customers ON yearmonth.CustomerID = customers.CustomerID  WHERE substr(yearmonth.Date, 1, 4) = '2012'    AND customers.Segment = 'LAM'  ORDER BY yearmonth.Consumption ASC  LIMIT 1;	debit_card_specializing
SELECT AVG(Consumption) / 12 FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Segment = 'SME'   AND y.Date >= '201301' AND y.Date <= '201312';	debit_card_specializing
SELECT CustomerID FROM yearmonth WHERE Date BETWEEN '201101' AND '201112'   AND CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'CZK') ORDER BY Consumption DESC LIMIT 1;	debit_card_specializing
SELECT COUNT(DISTINCT c.CustomerID) FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'KAM'   AND y.Date BETWEEN '201201' AND '201212'   AND y.Consumption < 30000;	debit_card_specializing
SELECT      SUM(CASE WHEN c.Currency = 'CZK' THEN y.Consumption ELSE 0 END) -      SUM(CASE WHEN c.Currency = 'EUR' THEN y.Consumption ELSE 0 END) AS Difference FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE SUBSTR(y.Date, 1, 4) = '2012';	debit_card_specializing
SELECT SUBSTR(t.Date, 1, 4) AS Year FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR' GROUP BY SUBSTR(t.Date, 1, 4) ORDER BY SUM(t.Amount * t.Price) DESC LIMIT 1;	debit_card_specializing
SELECT c.Segment FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID GROUP BY c.Segment ORDER BY SUM(y.Consumption) LIMIT 1;	debit_card_specializing
SELECT SUBSTR(y.Date, 1, 4) AS year FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Currency = 'CZK' GROUP BY year ORDER BY SUM(y.Consumption) DESC LIMIT 1;	debit_card_specializing
SELECT SUBSTR(Date, 5, 2) AS Month FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Segment = 'SME'    AND SUBSTR(Date, 1, 4) = '2013' ORDER BY Consumption DESC LIMIT 1;	debit_card_specializing
WITH yearly_totals AS (     SELECT          c.Segment,         y.CustomerID,         SUM(y.Consumption) AS total_consumption     FROM yearmonth y     JOIN customers c ON y.CustomerID = c.CustomerID     WHERE SUBSTR(y.Date, 1, 4) = '2013'     GROUP BY c.Segment, y.CustomerID ), ranked_by_segment AS (     SELECT          Segment,         total_consumption,         ROW_NUMBER() OVER (PARTITION BY Segment ORDER BY total_consumption ASC) AS rn     FROM yearly_totals ), segment_mins AS (     SELECT Segment, total_consumption     FROM ranked_by_segment     WHERE rn = 1 ), pivoted_segments AS (     SELECT         COALESCE(SUM(CASE WHEN Segment = 'SME' THEN total_consumption END), 0) AS sme_consumption,         COALESCE(SUM(CASE WHEN Segment = 'LAM' THEN total_consumption END), 0) AS lam_consumption,         COALESCE(SUM(CASE WHEN Segment = 'KAM' THEN total_consumption END), 0) AS kam_consumption     FROM segment_mins ) SELECT     sme_consumption - lam_consumption AS SME_LAM_Diff,     lam_consumption - kam_consumption AS LAM_KAM_Diff FROM pivoted_segments;	debit_card_specializing
SELECT      c.Segment,     (         (SUM(CASE WHEN SUBSTR(ym.Date, 1, 4) = '2013' THEN ym.Consumption ELSE 0 END) -           SUM(CASE WHEN SUBSTR(ym.Date, 1, 4) = '2012' THEN ym.Consumption ELSE 0 END)         ) / NULLIF(SUM(CASE WHEN SUBSTR(ym.Date, 1, 4) = '2012' THEN ym.Consumption ELSE 0 END), 0)     ) * 100 AS percentage_increase FROM      yearmonth ym JOIN      customers c ON ym.CustomerID = c.CustomerID WHERE      c.Currency = 'EUR'      AND c.Segment IN ('SME', 'LAM', 'KAM') GROUP BY      c.Segment ORDER BY      percentage_increase DESC;	debit_card_specializing
SELECT SUM(Consumption) FROM yearmonth WHERE CustomerID = 6 AND Date >= '201308' AND Date <= '201311';	debit_card_specializing
SELECT      (SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Value for money') -      (SELECT COUNT(*) FROM gasstations WHERE Country = 'SVK' AND Segment = 'Value for money');	debit_card_specializing
SELECT      COALESCE((SELECT Consumption FROM yearmonth WHERE CustomerID = 7 AND Date = '201304'), 0) -      (SELECT Consumption FROM yearmonth WHERE CustomerID = 5 AND Date = '201304')     AS consumption_difference;	debit_card_specializing
SELECT      SUM(CASE WHEN c.Currency = 'CZK' AND c.Segment = 'SME' THEN 1 ELSE 0 END) -      SUM(CASE WHEN c.Currency = 'EUR' AND c.Segment = 'SME' THEN 1 ELSE 0 END) AS difference FROM customers c WHERE c.Segment = 'SME';	debit_card_specializing
SELECT c.CustomerID FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'LAM'   AND c.Currency = 'EUR'   AND y.Date = '201310' ORDER BY y.Consumption DESC LIMIT 1;	debit_card_specializing
SELECT CustomerID, MAX(Consumption) AS MaxConsumption FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'KAM') GROUP BY CustomerID ORDER BY MaxConsumption DESC LIMIT 1;	debit_card_specializing
SELECT SUM(Consumption)  FROM yearmonth  JOIN customers ON yearmonth.CustomerID = customers.CustomerID  WHERE customers.Segment = 'KAM' AND yearmonth.Date = '201305';	debit_card_specializing
SELECT (COUNT(CASE WHEN y.Consumption > 46.73 THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Segment = 'LAM';	debit_card_specializing
SELECT Country, COUNT(*) AS Total_Value_For_Money_Gas_Stations FROM gasstations WHERE Segment = 'Value for money' GROUP BY Country ORDER BY Total_Value_For_Money_Gas_Stations DESC;	debit_card_specializing
SELECT (COUNT(CASE WHEN Currency = 'EUR' THEN 1 END) * 100.0 / COUNT(*))  FROM customers  WHERE Segment = 'KAM';	debit_card_specializing
SELECT      COALESCE(COUNT(CASE WHEN Consumption > 528.3 THEN 1 END) * 100.0 / COUNT(*), 0.0) AS percentage FROM yearmonth WHERE Date = '201202';	debit_card_specializing
SELECT (COUNT(CASE WHEN Segment = 'Premium' THEN 1 END) * 100.0 / COUNT(*))  FROM gasstations  WHERE Country = 'SVK';	debit_card_specializing
SELECT CustomerID FROM yearmonth WHERE Date = '201309' ORDER BY Consumption DESC LIMIT 1;	debit_card_specializing
SELECT c.Segment FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE y.Date = '201309' ORDER BY y.Consumption ASC LIMIT 1;	debit_card_specializing
SELECT c.CustomerID FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'SME' AND y.Date = '201206' ORDER BY y.Consumption ASC LIMIT 1;	debit_card_specializing
SELECT MAX(Consumption) FROM yearmonth WHERE SUBSTR(Date, 1, 4) = '2012'	debit_card_specializing
SELECT MAX(total_consumption / 12) AS biggest_monthly_consumption FROM (     SELECT y.CustomerID, SUM(y.Consumption) AS total_consumption     FROM yearmonth y     JOIN customers c ON y.CustomerID = c.CustomerID     WHERE c.Currency = 'EUR'     GROUP BY y.CustomerID );	debit_card_specializing
SELECT DISTINCT p.Description FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID WHERE substr(t.Date, 1, 4) = '2013' AND substr(t.Date, 6, 2) = '09';	debit_card_specializing
SELECT DISTINCT gs.Country FROM gasstations gs JOIN transactions_1k t ON gs.GasStationID = t.GasStationID WHERE strftime('%Y%m', t.Date) = '201306';	debit_card_specializing
SELECT DISTINCT gs.ChainID FROM gasstations gs JOIN transactions_1k t ON gs.GasStationID = t.GasStationID JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR';	debit_card_specializing
SELECT DISTINCT p.Description FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR';	debit_card_specializing
SELECT AVG(Price * Amount)  FROM transactions_1k  WHERE Date >= '2012-01-01' AND Date < '2012-02-01';	debit_card_specializing
SELECT COUNT(*)  FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Currency = 'EUR' AND y.Consumption > 1000;	debit_card_specializing
SELECT p.Description FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID JOIN products p ON t.ProductID = p.ProductID WHERE g.Country = 'CZE';	debit_card_specializing
SELECT DISTINCT t.Time FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.ChainID = 11;	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE' AND t.Price > 1000;	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE' AND t.Date > '2012-01-01';	debit_card_specializing
SELECT AVG(t.Price * t.Amount)  FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE';	debit_card_specializing
SELECT AVG(t.Price)  FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR';	debit_card_specializing
SELECT CustomerID FROM transactions_1k WHERE Date = '2012-08-25' GROUP BY CustomerID ORDER BY SUM(Amount * Price) DESC LIMIT 1;	debit_card_specializing
SELECT g.Country FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.Date = '2012-08-25' ORDER BY t.TransactionID ASC LIMIT 1;	debit_card_specializing
SELECT c.Currency FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE t.Date = '2012-08-24' AND t.Time = '16:25:00';	debit_card_specializing
SELECT c.Segment FROM customers c INNER JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE t.Date = '2012-08-23' AND t.Time = '21:20:00';	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.Date = '2012-08-26'   AND t.Time < '13:00:00'   AND g.Country = 'CZE';	debit_card_specializing
SELECT c.Segment FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID ORDER BY y.Date, c.CustomerID LIMIT 1;	debit_card_specializing
SELECT T2.Country FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-24' AND T1.Time = '12:42:00';	debit_card_specializing
SELECT ProductID FROM transactions_1k WHERE Date = '2012-08-23' AND Time = '21:20:00';	debit_card_specializing
SELECT y.Date, y.Consumption FROM yearmonth y WHERE y.Date = '201201'   AND y.CustomerID IN (     SELECT CustomerID     FROM transactions_1k     WHERE Date = '2012-08-24'       AND ABS(Amount * Price - 124.05) < 0.01   );	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.Date = '2012-08-26'    AND t.Time BETWEEN '08:00:00' AND '09:00:00'   AND g.Country = 'CZE';	debit_card_specializing
SELECT c.Currency FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE y.Date = '201306'   AND ABS(y.Consumption - 214582.17) < 0.01;	debit_card_specializing
SELECT g.Country FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.CardID = 667467 LIMIT 1;	debit_card_specializing
SELECT c.Currency FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE t.Date = '2012-08-24'   AND ABS(t.Amount * t.Price - 548.4) < 0.01;	debit_card_specializing
SELECT      COUNT(CASE WHEN c.Currency = 'EUR' THEN 1 END) * 100.0 / COUNT(*) AS percentage FROM      customers c INNER JOIN      transactions_1k t ON c.CustomerID = t.CustomerID WHERE      t.Date = '2012-08-25';	debit_card_specializing
WITH yearly_consumption AS (     SELECT          CustomerID,         SUM(CASE WHEN Date LIKE '2012%' THEN Consumption ELSE 0 END) AS cons_2012,         SUM(CASE WHEN Date LIKE '2013%' THEN Consumption ELSE 0 END) AS cons_2013     FROM yearmonth     GROUP BY CustomerID ) SELECT      (yc.cons_2012 - yc.cons_2013) * 1.0 / yc.cons_2012 AS decrease_rate FROM yearly_consumption yc JOIN (     SELECT CustomerID     FROM transactions_1k     WHERE Date = '2012-08-25'       AND ABS(Amount * Price - 634.8) < 0.01     ORDER BY TransactionID     LIMIT 1 ) t ON t.CustomerID = yc.CustomerID WHERE yc.cons_2012 > 0;	debit_card_specializing
SELECT GasStationID FROM transactions_1k GROUP BY GasStationID ORDER BY SUM(Amount * Price) DESC LIMIT 1;	debit_card_specializing
SELECT      (COUNT(CASE WHEN gs.Segment = 'Premium' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM      gasstations gs WHERE      gs.Country = 'SVK';	debit_card_specializing
SELECT      SUM(t.Amount * t.Price) AS total_spent,     SUM(CASE          WHEN t.Date = '201201' THEN t.Amount * t.Price ELSE 0 END     ) AS january_2012_spent FROM transactions_1k t WHERE t.CustomerID = 38508;	debit_card_specializing
SELECT p.Description FROM transactions_1k t JOIN products p ON t.ProductID = p.ProductID GROUP BY p.ProductID, p.Description ORDER BY SUM(t.Amount) DESC LIMIT 5;	debit_card_specializing
SELECT      t.CustomerID,     SUM(t.Price) / SUM(t.Amount) AS average_price_per_item,     c.Currency FROM      transactions_1k t JOIN      customers c ON t.CustomerID = c.CustomerID GROUP BY      t.CustomerID, c.Currency ORDER BY      SUM(t.Price) DESC LIMIT 1;	debit_card_specializing
SELECT g.Country FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID WHERE t.ProductID = 2 ORDER BY t.Price DESC LIMIT 1;	debit_card_specializing
SELECT y.Consumption FROM yearmonth y WHERE y.Date = '201208'   AND y.CustomerID IN (     SELECT DISTINCT t.CustomerID     FROM transactions_1k t     WHERE t.ProductID = 5       AND (t.Price / t.Amount) > 29.00   );	debit_card_specializing
