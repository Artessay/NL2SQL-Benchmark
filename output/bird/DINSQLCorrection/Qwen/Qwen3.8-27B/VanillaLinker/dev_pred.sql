SELECT MAX(`Free Meal Count (K-12)` / `Enrollment (K-12)`) AS highest_eligible_free_rate FROM frpm WHERE `County Name` = 'Alameda';
SELECT      `Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)` AS eligible_free_rate FROM      frpm WHERE      `School Type` = 'Continuation' ORDER BY      eligible_free_rate ASC LIMIT 3;
SELECT DISTINCT T1.Zip FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`Charter School (Y/N)` = 1   AND T1.District = 'Fresno County Office of Education'
SELECT T1.MailStreet FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T2.`FRPM Count (K-12)` DESC LIMIT 1;
SELECT DISTINCT s.Phone FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.`Charter School (Y/N)` = 1   AND f.`Charter Funding Type` = 'Directly funded'   AND s.OpenDate > '2000-01-01';
SELECT COUNT(*) FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath > 400   AND T2.Virtual = 'F';
SELECT DISTINCT T1.School FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumTstTakr > 500   AND T1.Magnet = 1
SELECT s.Phone FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds ORDER BY sat.NumGE1500 DESC LIMIT 1;
SELECT s.NumTstTakr FROM satscores s JOIN frpm f ON s.cds = f.CDSCode WHERE f.`FRPM Count (K-12)` = (     SELECT MAX(`FRPM Count (K-12)`)     FROM frpm );
SELECT COUNT(*)  FROM satscores s JOIN frpm f ON s.cds = f.CDSCode WHERE s.AvgScrMath > 560 AND f.`Charter Funding Type` = 'Directly funded';
SELECT f.`FRPM Count (Ages 5-17)` FROM satscores s JOIN frpm f ON s.cds = f.CDSCode WHERE s.AvgScrRead = (SELECT MAX(AvgScrRead) FROM satscores) LIMIT 1;
SELECT CDSCode FROM frpm WHERE `Enrollment (K-12)` + `Enrollment (Ages 5-17)` > 500;
SELECT MAX(T2.`Free Meal Count (Ages 5-17)` / T2.`Enrollment (Ages 5-17)`) AS highest_eligible_free_rate FROM satscores AS T1 INNER JOIN frpm AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumGE1500 / T1.NumTstTakr > 0.3;
SELECT DISTINCT     T1.Phone FROM schools AS T1 INNER JOIN satscores AS T2     ON T1.CDSCode = T2.cds ORDER BY     T2.NumGE1500 / T2.NumTstTakr DESC LIMIT 3
SELECT T2.NCESSchool FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T1.`Enrollment (Ages 5-17)` DESC LIMIT 5
SELECT s.District FROM satscores t JOIN schools s ON t.cds = s.CDSCode WHERE s.StatusType = 'Active' GROUP BY s.District ORDER BY AVG(t.AvgScrRead) DESC LIMIT 1;
SELECT COUNT(*)  FROM satscores s JOIN schools sc ON s.cds = sc.CDSCode WHERE (s.dname LIKE '%Alameda%' OR s.cname LIKE '%Alameda%')   AND s.NumTstTakr < 100;
SELECT      s.CharterNum,     sats.AvgScrWrite,     RANK() OVER (ORDER BY sats.AvgScrWrite DESC) AS rank FROM satscores sats JOIN schools s ON sats.cds = s.CDSCode WHERE sats.AvgScrWrite > 499   AND s.CharterNum IS NOT NULL ORDER BY sats.AvgScrWrite DESC;
SELECT COUNT(*)  FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds WHERE s.County = 'Fresno'   AND s.FundingType = 'Directly Funded'   AND sat.NumTstTakr <= 250;
SELECT s.Phone FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds ORDER BY sat.AvgScrMath DESC LIMIT 1;
SELECT COUNT(*)  FROM frpm  WHERE County Name = 'Amador'    AND Low Grade = '9'    AND High Grade = '12';
SELECT COUNT(*)  FROM frpm  WHERE County Name = 'Los Angeles'    AND `Free Meal Count (K-12)` > 500    AND `FRPM Count (K-12)` < 700;
SELECT T1.School FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.County = 'Contra Costa' ORDER BY T2.NumTstTakr DESC LIMIT 1;
SELECT      T1.School,     T1.Street FROM schools AS T1 INNER JOIN frpm AS T2     ON T1.CDSCode = T2.CDSCode WHERE (T2.`Enrollment (K-12)` - T2.`Enrollment (Ages 5-17)`) > 30
SELECT DISTINCT T1."School Name" FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1."Free Meal Count (K-12)" / T1."Enrollment (K-12)" > 0.1   AND T2.NumGE1500 > 0
SELECT s.FundingType FROM satscores sat JOIN schools s ON sat.cds = s.CDSCode WHERE sat.cname = 'Riverside' GROUP BY s.FundingType HAVING AVG(sat.AvgScrMath) > 400;
SELECT      s.School,     s.Street,     s.City,     s.State,     s.Zip FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.City = 'Monterey'     AND f.`School Type` = 'High'     AND f.`Free Meal Count (Ages 5-17)` > 800;
SELECT      s.School AS school_name,     sat.AvgScrWrite AS avg_writing_score,     s.Phone AS communication_number FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds WHERE s.OpenDate > '1991-12-31' OR s.ClosedDate < '2000-01-01'
SELECT      s.School,     s.DOCType FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.FundingType = 'Locally Funded'   AND (f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`) > (       SELECT AVG(f2.`Enrollment (K-12)` - f2.`Enrollment (Ages 5-17)`)       FROM frpm f2       JOIN schools s2 ON f2.CDSCode = s2.CDSCode       WHERE s2.FundingType = 'Locally Funded'   )
SELECT s.OpenDate FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode ORDER BY f.`Enrollment (K-12)` DESC LIMIT 1;
SELECT DISTINCT s.City FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`Enrollment (K-12)` IS NOT NULL ORDER BY f.`Enrollment (K-12)` ASC LIMIT 5;
SELECT      `Free Meal Count (K-12)` / `Enrollment (K-12)` AS eligible_free_rate FROM      frpm ORDER BY      `Enrollment (K-12)` DESC LIMIT 2 OFFSET 9;
SELECT      T1.`FRPM Count (K-12)` / T1.`Enrollment (K-12)` AS eligible_free_or_reduced_price_meal_rate FROM frpm AS T1 INNER JOIN schools AS T2     ON T1.CDSCode = T2.CDSCode WHERE      T1.`Low Grade` = '01'      AND T1.`High Grade` = '12'     AND T2.DOC = '66' ORDER BY      T1.`FRPM Count (K-12)` DESC LIMIT 5;
SELECT DISTINCT s.Website, s.School FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.`Free Meal Count (Ages 5-17)` BETWEEN 1900 AND 2000;
SELECT    T1.`Free Meal Count (Ages 5-17)` / T1.`Enrollment (Ages 5-17)` AS free_rate FROM frpm AS T1 INNER JOIN schools AS T2   ON T1.CDSCode = T2.CDSCode WHERE    T2.AdmFName1 = 'Kacey' AND T2.AdmLName1 = 'Gibson'   OR T2.AdmFName2 = 'Kacey' AND T2.AdmLName2 = 'Gibson'   OR T2.AdmFName3 = 'Kacey' AND T2.AdmLName3 = 'Gibson';
SELECT s.AdmEmail1 FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`Charter School (Y/N)` = 1 ORDER BY f.`Enrollment (K-12)` ASC LIMIT 1;
SELECT      s.AdmFName1,     s.AdmLName1,     s.AdmFName2,     s.AdmLName2,     s.AdmFName3,     s.AdmLName3 FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds ORDER BY sat.NumGE1500 DESC LIMIT 1;
SELECT      s.Street,     s.City,     s.Zip,     s.State FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds ORDER BY (sat.NumGE1500 * 1.0 / sat.NumTstTakr) ASC LIMIT 1;
SELECT s.Website FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds WHERE s.County = 'Los Angeles'   AND sat.NumTstTakr BETWEEN 2000 AND 3000;
SELECT    AVG(T2.NumTstTakr) FROM schools AS T1 INNER JOIN satscores AS T2   ON T1.CDSCode = T2.cds WHERE    T1.County = 'Fresno'   AND T1.OpenDate BETWEEN '1980-01-01' AND '1980-12-31'
SELECT T1.Phone FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.dname = 'Fresno Unified' ORDER BY T2.AvgScrRead ASC LIMIT 1;
SELECT s.School FROM (     SELECT          s.CDSCode,         s.School,         s.County,         RANK() OVER (PARTITION BY s.County ORDER BY sat.AvgScrRead DESC) as rank     FROM schools s     JOIN satscores sat ON s.CDSCode = sat.cds     WHERE s.Virtual = 'F' ) ranked WHERE rank <= 5;
SELECT DISTINCT T1.EdOpsName FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds ORDER BY T2.AvgScrMath DESC LIMIT 1
SELECT      s.AvgScrMath,     sc.County FROM satscores s JOIN schools sc ON s.cds = sc.CDSCode WHERE (s.AvgScrMath + s.AvgScrRead + s.AvgScrWrite) = (     SELECT MIN(s2.AvgScrMath + s2.AvgScrRead + s2.AvgScrWrite)     FROM satscores s2     WHERE s2.AvgScrMath IS NOT NULL        AND s2.AvgScrRead IS NOT NULL        AND s2.AvgScrWrite IS NOT NULL ) AND s.AvgScrMath IS NOT NULL  AND s.AvgScrRead IS NOT NULL  AND s.AvgScrWrite IS NOT NULL;
SELECT      s.AvgScrWrite,     sc.City FROM satscores s JOIN schools sc ON s.cds = sc.CDSCode ORDER BY s.NumGE1500 DESC LIMIT 1;
SELECT DISTINCT s.sname, s.AvgScrWrite FROM satscores s JOIN schools sc ON s.cds = sc.CDSCode WHERE (sc.AdmFName1 = 'Ricci' AND sc.AdmLName1 = 'Ulrich')    OR (sc.AdmFName2 = 'Ricci' AND sc.AdmLName2 = 'Ulrich')
SELECT s.School FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.DOC = '31' ORDER BY f.`Enrollment (K-12)` DESC LIMIT 1;
SELECT CAST(COUNT(*) AS REAL) / 12 AS monthly_average FROM schools WHERE County = 'Alameda'   AND DOC = '52'   AND OpenDate IS NOT NULL   AND strftime('%Y', OpenDate) = '1980';
SELECT      CAST(SUM(CASE WHEN s.DOC = '54' AND s.County = 'Orange' AND s.StatusType = 'Merged' THEN 1 ELSE 0 END) AS FLOAT) /     NULLIF(SUM(CASE WHEN s.DOC = '52' AND s.County = 'Orange' AND s.StatusType = 'Merged' THEN 1 ELSE 0 END), 0) AS ratio FROM schools s;
SELECT      s.County,     s.School,     s.ClosedDate FROM schools s WHERE s.StatusType = 'Closed'     AND s.County = (         SELECT County         FROM schools         WHERE StatusType = 'Closed'         GROUP BY County         ORDER BY COUNT(*) DESC         LIMIT 1     ) ORDER BY s.ClosedDate;
SELECT T1.Street, T1.School FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds ORDER BY T2.AvgScrMath DESC LIMIT 6, 1;
SELECT      s.MailStreet,     s.School FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds WHERE sat.AvgScrRead IS NOT NULL ORDER BY sat.AvgScrRead ASC LIMIT 1;
SELECT COUNT(*) FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.MailCity = 'Lakeport'   AND (T1.AvgScrRead + T1.AvgScrMath + T1.AvgScrWrite) >= 1500;
SELECT SUM(T1.NumTstTakr) FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.MailCity = 'Fresno'
SELECT DISTINCT      s.School,     s.MailZip FROM schools s WHERE s.AdmFName1 = 'Avetik' AND s.AdmLName1 = 'Atoian'    OR s.AdmFName2 = 'Avetik' AND s.AdmLName2 = 'Atoian'    OR s.AdmFName3 = 'Avetik' AND s.AdmLName3 = 'Atoian';
SELECT    CAST(COUNT(CASE WHEN T1.County = 'Colusa' THEN 1 END) AS REAL) /    COUNT(CASE WHEN T1.County = 'Humboldt' THEN 1 END) AS ratio FROM schools AS T1 WHERE T1.MailState = 'CA';
SELECT COUNT(*)  FROM schools  WHERE MailState = 'CA'    AND City = 'San Joaquin'    AND StatusType = 'Active';
SELECT s.Phone, s.Ext FROM satscores sat JOIN schools s ON sat.cds = s.CDSCode ORDER BY sat.AvgScrWrite DESC LIMIT 1 OFFSET 332;
SELECT      s.Phone,     s.Ext,     s.School FROM schools s WHERE s.Zip = '95203-3704';
SELECT DISTINCT T1.Website FROM schools AS T1 WHERE T1.AdmFName1 = 'Mike' AND T1.AdmLName1 = 'Larson'    OR T1.AdmFName1 = 'Dante' AND T1.AdmLName1 = 'Alvarez'    OR T1.AdmFName2 = 'Mike' AND T1.AdmLName2 = 'Larson'    OR T1.AdmFName2 = 'Dante' AND T1.AdmLName2 = 'Alvarez'    OR T1.AdmFName3 = 'Mike' AND T1.AdmLName3 = 'Larson'    OR T1.AdmFName3 = 'Dante' AND T1.AdmLName3 = 'Alvarez';
SELECT      s.Website FROM      schools s WHERE      s.Virtual = 'P'     AND s.Charter = 1     AND s.County = 'San Joaquin';
SELECT COUNT(*)  FROM schools  WHERE City = 'Hickman'    AND Charter = 1    AND DOC = 52;
SELECT COUNT(*)  FROM frpm  WHERE `County Name` = 'Los Angeles'    AND `Charter School (Y/N)` = 0    AND (`Free Meal Count (K-12)` * 100.0 / `Enrollment (K-12)`) < 0.18;
SELECT DISTINCT     T1.School,     T1.City,     T1.AdmFName1,     T1.AdmLName1,     T1.AdmFName2,     T1.AdmLName2,     T1.AdmFName3,     T1.AdmLName3 FROM schools AS T1 WHERE T1.Charter = 1   AND T1.CharterNum = '00D2'
SELECT COUNT(*)  FROM schools  WHERE MailCity = 'Hickman'    AND CharterNum = '00D4';
SELECT    CAST(COUNT(CASE WHEN T1.FundingType = 'Locally funded' THEN 1 END) AS REAL) * 100 / COUNT(T1.FundingType) AS ratio_percentage FROM schools AS T1 WHERE T1.County = 'Santa Clara'   AND T1.FundingType IS NOT NULL;
SELECT COUNT(*)  FROM schools  WHERE County = 'Stanislaus'    AND FundingType = 'Directly Funded'    AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31';
SELECT COUNT(*)  FROM schools  WHERE DOCType = 'Community College District'    AND ClosedDate LIKE '1989%'    AND City = 'San Francisco';
SELECT County FROM schools WHERE SOC = '11'   AND ClosedDate >= '1980-01-01'   AND ClosedDate <= '1989-12-31' GROUP BY County ORDER BY COUNT(*) DESC LIMIT 1;
SELECT DISTINCT NCESDist FROM schools WHERE SOC = '31'   AND SOC IS NOT NULL;
SELECT COUNT(*)  FROM schools  WHERE County = 'Alpine'    AND DOCType = 'District Community Day School'    AND StatusType IN ('Active', 'Closed');
SELECT DISTINCT T1.District FROM schools AS T1 WHERE T1.Magnet = 0   AND T1.City = 'Fresno'
SELECT      SUM(T1.`Enrollment (Ages 5-17)`)  FROM `frpm` AS T1  INNER JOIN `schools` AS T2      ON T1.CDSCode = T2.CDSCode  WHERE      T2.`EdOpsCode` = 'SSS'      AND T2.`City` = 'Fremont'      AND T1.`Academic Year` = '2014-2015';
SELECT T1.`FRPM Count (Ages 5-17)` FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.School = 'Youth Authority School'   AND T2.MailStreet = 'PO Box 1040';
SELECT MIN(T1.`Low Grade`) FROM `frpm` AS T1 INNER JOIN `schools` AS T2 ON T1.`CDSCode` = T2.`CDSCode` WHERE T2.`NCESDist` = '0613360' AND T2.`EdOpsCode` = 'SPECON';
SELECT      f.`Educational Option Type`,     f.`School Name` FROM frpm f WHERE f.`County Code` = '37'   AND f.`NSLP Provision Status` = '2';
SELECT s.City FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.EILCode = 'HS'   AND f.`NSLP Provision Status` = '2'   AND f.`Low Grade` = '09'   AND f.`High Grade` = '12'   AND s.County = 'Merced';
SELECT      T1.School,     T2.`FRPM Count (Ages 5-17)` / T2.`Enrollment (Ages 5-17)` * 100 FROM schools AS T1 INNER JOIN frpm AS T2     ON T1.CDSCode = T2.CDSCode WHERE      T1.County = 'Los Angeles'     AND T1.GSserved = 'K-9'
SELECT GSserved FROM schools WHERE City = 'Adelanto' GROUP BY GSserved ORDER BY COUNT(*) DESC LIMIT 1;
SELECT COUNT(*) AS amount FROM schools WHERE County IN ('San Diego', 'Santa Barbara')   AND Virtual = 'F' GROUP BY County ORDER BY COUNT(*) DESC LIMIT 1;
SELECT      T1.SchoolType,     T2.School,     T2.Latitude FROM frpm AS T1 INNER JOIN schools AS T2     ON T1.CDSCode = T2.CDSCode ORDER BY T2.Latitude DESC LIMIT 1;
SELECT      s.City,     f.`Low Grade`,     s.School FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.State = 'CA' ORDER BY s.Latitude ASC LIMIT 1;
SELECT GSoffered FROM schools WHERE ABS(Longitude) = (SELECT MAX(ABS(Longitude)) FROM schools) LIMIT 1;
SELECT      s.City,     COUNT(*) AS number_of_schools FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.Magnet = 1     AND s.GSserved = 'K-8'     AND f.`NSLP Provision Status` = 'Multiple Provision Types' GROUP BY s.City ORDER BY s.City;
WITH admin_names AS (     SELECT AdmFName1 AS first_name, District     FROM schools     WHERE AdmFName1 IS NOT NULL AND AdmFName1 != ''     UNION ALL     SELECT AdmFName2 AS first_name, District     FROM schools     WHERE AdmFName2 IS NOT NULL AND AdmFName2 != ''     UNION ALL     SELECT AdmFName3 AS first_name, District     FROM schools     WHERE AdmFName3 IS NOT NULL AND AdmFName3 != '' ), name_counts AS (     SELECT first_name, COUNT(*) as count     FROM admin_names     GROUP BY first_name     ORDER BY count DESC     LIMIT 2 ) SELECT nc.first_name, an.District FROM name_counts nc JOIN admin_names an ON nc.first_name = an.first_name ORDER BY nc.first_name, an.District;
SELECT      T1.`Free Meal Count (K-12)` / T1.`Enrollment (K-12)` * 100 AS `Percent (%) Eligible Free (K-12)`,     T1.`District Code` FROM frpm AS T1 INNER JOIN schools AS T2     ON T1.CDSCode = T2.CDSCode WHERE T2.`AdmFName1` = 'Alusine'
SELECT      T1.AdmLName1,     T1.District,     T1.County,     T1.School FROM      schools AS T1 WHERE      T1.CharterNum = '40'
SELECT DISTINCT     T1.AdmEmail1,     T1.AdmEmail2,     T1.AdmEmail3 FROM schools AS T1 WHERE     T1.County = 'San Bernardino'     AND T1.District = 'San Bernardino City Unified'     AND T1.OpenDate BETWEEN '2009-01-01' AND '2010-12-31'     AND T1.SOC = '62'     AND T1.DOC = '54'
SELECT s.School, s.AdmEmail1 FROM satscores sat JOIN schools s ON sat.cds = s.CDSCode ORDER BY sat.NumGE1500 DESC LIMIT 1;
SELECT COUNT(*)  FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.frequency = 'POPLATEK PO OBRATU'   AND d.A3 = 'East Bohemia';
SELECT COUNT(*)  FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A3 = 'Prague';
SELECT    CASE      WHEN AVG(A12) > AVG(A13) THEN '1995'     ELSE '1996'   END AS higher_unemployment_year FROM district;
SELECT COUNT(*) FROM (SELECT d.district_id FROM district d JOIN client c ON d.district_id = c.district_id WHERE c.gender = 'F' GROUP BY d.district_id HAVING AVG(d.A11) > 6000 AND AVG(d.A11) < 10000);
SELECT COUNT(*)  FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'M'   AND d.A3 = 'North Bohemia'   AND d.A11 > 8000;
SELECT      a.account_id,     (SELECT MAX(d.A11) - MIN(d.A11)       FROM client c       JOIN district d ON c.district_id = d.district_id       WHERE c.gender = 'F') AS salary_gap FROM client c JOIN district d ON c.district_id = d.district_id JOIN disp dp ON c.client_id = dp.client_id JOIN account a ON dp.account_id = a.account_id WHERE c.gender = 'F' AND d.A11 = (SELECT MIN(d2.A11)               FROM client c2               JOIN district d2 ON c2.district_id = d2.district_id               WHERE c2.gender = 'F') AND c.birth_date = (SELECT MIN(c3.birth_date)                      FROM client c3                      JOIN district d3 ON c3.district_id = d3.district_id                      WHERE c3.gender = 'F'                      AND d3.A11 = (SELECT MIN(d4.A11)                                    FROM client c4                                    JOIN district d4 ON c4.district_id = d4.district_id                                    WHERE c4.gender = 'F'))
SELECT DISTINCT a.account_id FROM client c JOIN district d ON c.district_id = d.district_id JOIN disp dp ON c.client_id = dp.client_id JOIN account a ON dp.account_id = a.account_id WHERE c.birth_date = (SELECT MAX(birth_date) FROM client) AND d.A11 = (     SELECT MAX(d2.A11)     FROM client c2     JOIN district d2 ON c2.district_id = d2.district_id     WHERE c2.birth_date = (SELECT MAX(birth_date) FROM client) );
SELECT COUNT(*)  FROM disp d JOIN account a ON d.account_id = a.account_id WHERE a.frequency = 'POPLATEK TYDNE'   AND d.type = 'OWNER';
SELECT DISTINCT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE d.type = 'DISPONENT'   AND a.frequency = 'POPLATEK PO OBRATU';
SELECT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.date LIKE '1997%'   AND l.status = 'A'   AND a.frequency = 'POPLATEK TYDNE'   AND l.amount = (     SELECT MIN(l2.amount)     FROM loan l2     WHERE l2.date LIKE '1997%'       AND l2.status = 'A'   );
SELECT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 12   AND a.date LIKE '1993-%'   AND l.amount = (     SELECT MAX(l2.amount)     FROM account a2     JOIN loan l2 ON a2.account_id = l2.account_id     WHERE l2.duration > 12       AND a2.date LIKE '1993-%'   );
SELECT COUNT(DISTINCT c.client_id)  FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN district dist ON c.district_id = dist.district_id WHERE c.gender = 'F'   AND c.birth_date < '1950-01-01'   AND dist.A2 = 'Sokolov';
SELECT account_id FROM trans WHERE date = (     SELECT MIN(date)     FROM trans     WHERE date LIKE '1995%' ) AND date LIKE '1995%';
SELECT DISTINCT a.account_id FROM account a JOIN trans t ON a.account_id = t.account_id WHERE a.date < '1997-01-01' AND t.balance > 3000;
SELECT DISTINCT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card ca ON d.disp_id = ca.disp_id WHERE ca.issued = '1994-03-03';
SELECT a.date FROM trans t JOIN account a ON t.account_id = a.account_id WHERE t.amount = 840   AND t.date = '1998-10-14';
SELECT DISTINCT a.district_id FROM loan l JOIN account a ON l.account_id = a.account_id WHERE l.date = '1994-08-25';
SELECT MAX(t.amount) FROM trans t JOIN disp d ON t.account_id = d.account_id JOIN card c ON d.disp_id = c.disp_id WHERE c.issued = '1996-10-21';
SELECT c.gender FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN district dist ON a.district_id = dist.district_id WHERE dist.A11 = (SELECT MAX(A11) FROM district) ORDER BY c.birth_date ASC LIMIT 1;
SELECT t.amount FROM trans t JOIN account a ON t.account_id = a.account_id WHERE t.account_id = (     SELECT l.account_id     FROM loan l     ORDER BY l.amount DESC     LIMIT 1 ) AND t.date > a.date ORDER BY t.date ASC LIMIT 1;
SELECT COUNT(*)  FROM client c JOIN account a ON c.district_id = a.district_id JOIN district d ON a.district_id = d.district_id WHERE c.gender = 'F'   AND d.A2 = 'Jesenik';
SELECT T1.disp_id FROM disp AS T1 INNER JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T2.amount = 5100 AND T2.date = '1998-09-02'
SELECT COUNT(*)  FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Litomerice'   AND a.date LIKE '1996%';
SELECT DISTINCT d.A2 FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F'   AND c.birth_date = '1976-01-29';
SELECT c.birth_date FROM client c JOIN disp d ON c.client_id = d.client_id JOIN loan l ON d.account_id = l.account_id WHERE l.amount = 98832   AND l.date = '1996-01-03';
SELECT a.account_id FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A3 = 'Prague' ORDER BY a.date ASC LIMIT 1;
SELECT      CAST(SUM(CASE WHEN c.gender = 'M' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) AS percentage_male FROM client c JOIN district d ON c.district_id = d.district_id WHERE d.A3 = 'south Bohemia'   AND d.A4 = (       SELECT MAX(A4)        FROM district        WHERE A3 = 'south Bohemia'   );
SELECT      ((t2.balance - t1.balance) * 100.0 / t1.balance) AS increase_rate FROM      (         SELECT account_id         FROM loan         WHERE date = '1993-07-05'         ORDER BY loan_id         LIMIT 1     ) l JOIN      trans t1 ON l.account_id = t1.account_id AND t1.date = '1993-03-22' JOIN      trans t2 ON l.account_id = t2.account_id AND t2.date = '1998-12-27';
SELECT    CAST(SUM(CASE WHEN status = 'A' THEN amount ELSE 0 END) AS REAL) * 100 / SUM(amount) AS percentage FROM loan;
SELECT    CAST(SUM(CASE WHEN status = 'C' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS percentage FROM loan WHERE amount < 100000;
SELECT DISTINCT a.account_id, d.A2, d.A3 FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.date >= '1993-01-01' AND a.date < '1994-01-01' AND EXISTS (     SELECT 1      FROM trans t      WHERE t.account_id = a.account_id      AND t.date < a.date )
SELECT DISTINCT a.account_id, a.frequency FROM account a JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id JOIN district dist ON c.district_id = dist.district_id WHERE d.type = 'OWNER'   AND dist.A3 = 'east Bohemia'   AND a.date >= '1995-01-01'   AND a.date <= '2000-12-31';
SELECT a.account_id, a.date FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Prachatice'
SELECT      d.A2 AS district,     d.A3 AS region FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.loan_id = 4990;
SELECT      l.account_id,     d.A2 AS district,     d.A3 AS region FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.amount > 300000;
SELECT      l.loan_id,     d.A3 AS district,     d.A11 AS average_salary FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.duration = 60;
SELECT      d.A2 AS district,     ((d.A13 - d.A12) / d.A12) * 100 AS unemployment_increment_percentage FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.status = 'D';
SELECT      (COUNT(CASE WHEN d.A2 = 'Decin' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM account a JOIN district d ON a.district_id = d.district_id WHERE strftime('%Y', a.date) = '1993';
SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE';
SELECT      d.A2 AS district,     COUNT(c.client_id) AS number_of_female_account_holders FROM district d JOIN client c ON d.district_id = c.district_id JOIN disp disp ON c.client_id = disp.client_id JOIN account a ON disp.account_id = a.account_id WHERE c.gender = 'F' GROUP BY d.district_id, d.A2 ORDER BY number_of_female_account_holders DESC LIMIT 9;
SELECT      d.A2 AS district_name,     t.amount FROM      trans t JOIN      account a ON t.account_id = a.account_id JOIN      district d ON a.district_id = d.district_id WHERE      t.type = 'VYDAJ'     AND t.date LIKE '1996-01%' ORDER BY      t.amount DESC LIMIT 10;
SELECT COUNT(*)  FROM client c JOIN district d ON c.district_id = d.district_id JOIN disp disp ON c.client_id = disp.client_id AND disp.type = 'OWNER' LEFT JOIN card card ON disp.disp_id = card.disp_id WHERE d.A3 = 'South Bohemia' AND card.card_id IS NULL;
SELECT d.A3 FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.status IN ('C', 'D') ORDER BY l.amount DESC LIMIT 1;
SELECT AVG(T1.amount) FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN disp AS T3 ON T2.account_id = T3.account_id INNER JOIN client AS T4 ON T3.client_id = T4.client_id WHERE T4.gender = 'M'
SELECT      d.A4 AS branch_location,     d.A2 AS district_name FROM district d WHERE d.A13 = (     SELECT MAX(A13)     FROM district );
SELECT COUNT(a.account_id) AS num_accounts FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A16 = (     SELECT MAX(A16)     FROM district );
SELECT COUNT(DISTINCT T1.account_id) AS count FROM trans AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.operation = 'VYBER KARTOU'   AND T1.balance < 0   AND T2.frequency = 'POPLATEK MESICNE'
SELECT COUNT(*) FROM loan l JOIN account a ON l.account_id = a.account_id WHERE l.date BETWEEN '1995-01-01' AND '1997-12-31'   AND l.amount >= 250000   AND a.frequency = 'POPLATEK MESICNE';
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN loan l ON a.account_id = l.account_id WHERE a.district_id = 1   AND l.status IN ('C', 'D');
SELECT COUNT(*)  FROM client  WHERE district_id = (     SELECT district_id      FROM district      ORDER BY A15 DESC      LIMIT 1 OFFSET 1 )  AND gender = 'M';
SELECT COUNT(*)  FROM card c JOIN disp d ON c.disp_id = d.disp_id WHERE c.type = 'gold'    AND d.type = 'OWNER';
SELECT COUNT(*)  FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Pisek';
SELECT DISTINCT a.district_id FROM trans t JOIN account a ON t.account_id = a.account_id WHERE t.amount > 10000   AND t.date BETWEEN '1997-01-01' AND '1997-12-31';
SELECT DISTINCT o.account_id FROM `order` o JOIN account a ON o.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE o.k_symbol = 'SIPO'   AND d.A2 = 'Pisek';
SELECT DISTINCT a.account_id FROM account a JOIN disp d ON a.account_id = d.account_id JOIN card c ON d.disp_id = c.disp_id WHERE c.type = 'gold';
SELECT AVG(T1.amount) AS average_amount FROM trans AS T1 WHERE T1.operation = 'VYBER KARTOU'   AND strftime('%Y', T1.date) = '2021'   AND strftime('%m', T1.date) = '01';
SELECT DISTINCT d.client_id FROM trans t JOIN disp d ON t.account_id = d.account_id WHERE t.operation = 'VYBER KARTOU'   AND t.date >= '1998-01-01'   AND t.date < '1999-01-01'   AND t.amount < (     SELECT AVG(amount)     FROM trans     WHERE operation = 'VYBER KARTOU'       AND date >= '1998-01-01'       AND date < '1999-01-01'   );
SELECT DISTINCT c.client_id, c.gender, c.birth_date FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card cd ON d.disp_id = cd.disp_id JOIN loan l ON d.account_id = l.account_id WHERE c.gender = 'F';
SELECT COUNT(*)  FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN district dist ON a.district_id = dist.district_id WHERE c.gender = 'F'    AND dist.A3 = 'south Bohemia';
SELECT DISTINCT a.account_id FROM account a JOIN district d ON a.district_id = d.district_id JOIN disp disp ON a.account_id = disp.account_id WHERE d.A2 = 'Tabor'   AND disp.type = 'OWNER';
SELECT DISTINCT d.type FROM disp d JOIN account a ON d.account_id = a.account_id JOIN district dist ON a.district_id = dist.district_id WHERE d.type != 'OWNER'   AND dist.A11 > 8000   AND dist.A11 <= 9000;
SELECT COUNT(*)  FROM trans t JOIN account a ON t.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE d.A3 = 'North Bohemia'   AND t.bank = 'AB';
SELECT DISTINCT d.A2 FROM district d JOIN account a ON d.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id WHERE t.type = 'VYDAJ';
SELECT AVG(d.A15)  FROM district d WHERE d.A15 > 4000 AND EXISTS (     SELECT 1      FROM account a      WHERE a.district_id = d.district_id      AND a.date >= '1997-01-01' );
SELECT COUNT(*)  FROM card c JOIN disp d ON c.disp_id = d.disp_id WHERE c.type = 'classic'    AND d.type = 'OWNER';
SELECT COUNT(*)  FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'M'    AND d.A2 = 'Hl.m. Praha';
SELECT    CAST(SUM(CASE WHEN type = 'gold' AND issued < '1998-01-01' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM card;
SELECT c.client_id FROM loan l JOIN disp d ON l.account_id = d.account_id JOIN client c ON d.client_id = c.client_id WHERE d.type = 'OWNER' AND l.amount = (SELECT MAX(amount) FROM loan);
SELECT d.A15 FROM district d JOIN account a ON d.district_id = a.district_id WHERE a.account_id = 532;
SELECT district_id  FROM account  WHERE account_id = (     SELECT account_id      FROM `order`      WHERE order_id = 33333 );
SELECT T1.* FROM trans AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id WHERE T2.client_id = 3356   AND T1.operation = 'VYBER'
SELECT COUNT(*) FROM account a JOIN loan l ON a.account_id = l.account_id WHERE a.frequency = 'POPLATEK TYDNE'   AND l.amount < 200000;
SELECT T1.type FROM card AS T1 INNER JOIN disp AS T2 ON T1.disp_id = T2.disp_id WHERE T2.client_id = 13539
SELECT d.A3 FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.client_id = 3541;
SELECT d.district_id FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.status = 'A' GROUP BY d.district_id ORDER BY COUNT(a.account_id) DESC LIMIT 1;
SELECT c.client_id FROM `order` o JOIN disp d ON o.account_id = d.account_id JOIN client c ON d.client_id = c.client_id WHERE o.order_id = 32423;
SELECT t.* FROM trans t JOIN account a ON t.account_id = a.account_id WHERE a.district_id = 5;
SELECT COUNT(*)  FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Jesenik';
SELECT DISTINCT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card ca ON d.disp_id = ca.disp_id WHERE ca.type = 'junior'   AND ca.issued >= '1997-01-01';
SELECT      CAST(SUM(CASE WHEN c.gender = 'F' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) AS percentage FROM client c JOIN district d ON c.district_id = d.district_id WHERE d.A11 > 10000;
SELECT      (SUM(CASE WHEN strftime('%Y', l.date) = '1997' THEN l.amount ELSE 0 END) -       SUM(CASE WHEN strftime('%Y', l.date) = '1996' THEN l.amount ELSE 0 END)) * 100.0 /      NULLIF(SUM(CASE WHEN strftime('%Y', l.date) = '1996' THEN l.amount ELSE 0 END), 0) AS growth_rate FROM loan l JOIN account a ON l.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id WHERE c.gender = 'M'   AND strftime('%Y', l.date) IN ('1996', '1997');
SELECT COUNT(*)  FROM trans  WHERE operation = 'VYBER KARTOU'    AND date > '1995-12-31';
SELECT      (SELECT SUM(A16) FROM district WHERE A3 = 'north Bohemia') -      (SELECT SUM(A16) FROM district WHERE A3 = 'east Bohemia') AS difference
SELECT COUNT(*)  FROM disp  WHERE account_id BETWEEN 1 AND 10;
SELECT      a.frequency,     t.k_symbol FROM account a LEFT JOIN trans t ON a.account_id = t.account_id WHERE a.account_id = 3 GROUP BY a.frequency, t.k_symbol HAVING SUM(CASE WHEN t.type = 'VYDAJ' THEN t.amount ELSE 0 END) = 3539;
SELECT      strftime('%Y', T1.birth_date) AS birth_year FROM client AS T1 INNER JOIN disp AS T2     ON T1.client_id = T2.client_id WHERE T2.client_id = 130   AND T2.type = 'OWNER';
SELECT COUNT(*) FROM account a JOIN disp d ON a.account_id = d.account_id WHERE d.type = 'OWNER'   AND a.frequency = 'POPLATEK PO OBRATU';
SELECT      l.amount AS debt_amount,     l.status AS payment_status FROM client c JOIN disp d ON c.client_id = d.client_id JOIN loan l ON d.account_id = l.account_id WHERE c.client_id = 992;
SELECT      t.balance AS sum_after_transaction_851,     c.gender AS owner_gender FROM trans t JOIN disp d ON t.account_id = d.account_id JOIN client c ON d.client_id = c.client_id WHERE t.trans_id = 851   AND d.type = 'OWNER'   AND c.client_id = 4;
SELECT T1.type FROM card AS T1 INNER JOIN disp AS T2 ON T1.disp_id = T2.disp_id WHERE T2.client_id = 9
SELECT SUM(t.amount) FROM client c JOIN disp d ON c.client_id = d.client_id JOIN trans t ON d.account_id = t.account_id WHERE c.client_id = 617   AND t.type = 'VYDAJ'   AND strftime('%Y', t.date) = '1998';
SELECT DISTINCT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN district dist ON a.district_id = dist.district_id WHERE c.birth_date BETWEEN '1983-01-01' AND '1987-12-31'   AND dist.A3 = 'East Bohemia';
SELECT DISTINCT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN loan l ON d.account_id = l.account_id WHERE c.gender = 'F' ORDER BY l.amount DESC LIMIT 3;
SELECT COUNT(*) FROM client c JOIN disp d ON c.client_id = d.client_id JOIN trans t ON d.account_id = t.account_id WHERE c.gender = 'M'   AND c.birth_date BETWEEN '1974-01-01' AND '1976-12-31'   AND t.k_symbol = 'SIPO'   AND t.amount > 4000;
SELECT COUNT(*)  FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Beroun'    AND a.date > '1996-12-31';
SELECT COUNT(*) FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card ca ON d.disp_id = ca.disp_id WHERE c.gender = 'F'   AND ca.type = 'junior';
SELECT      CAST(SUM(CASE WHEN c.gender = 'F' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) AS percentage FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN district dist ON a.district_id = dist.district_id WHERE dist.A3 LIKE '%Prague%';
SELECT    CAST(SUM(CASE WHEN c.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS percentage FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE a.frequency = 'POPLATEK TYDNE';
SELECT COUNT(*)  FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE a.frequency = 'POPLATEK TYDNE'   AND d.type = 'OWNER';
SELECT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 24   AND a.date < '1997-01-01'   AND l.amount = (     SELECT MIN(l2.amount)     FROM account a2     JOIN loan l2 ON a2.account_id = l2.account_id     WHERE l2.duration > 24       AND a2.date < '1997-01-01'   );
SELECT DISTINCT d.account_id FROM client c JOIN district dist ON c.district_id = dist.district_id JOIN disp d ON c.client_id = d.client_id WHERE c.gender = 'F'   AND c.birth_date = (     SELECT MIN(birth_date)     FROM client     WHERE gender = 'F'   )   AND dist.A11 = (     SELECT MIN(dist2.A11)     FROM client c2     JOIN district dist2 ON c2.district_id = dist2.district_id     WHERE c2.gender = 'F'       AND c2.birth_date = (         SELECT MIN(birth_date)         FROM client         WHERE gender = 'F'       )   );
SELECT COUNT(*)  FROM client c JOIN district d ON c.district_id = d.district_id WHERE d.A3 = 'east Bohemia'   AND strftime('%Y', c.birth_date) = '1920';
SELECT COUNT(*)  FROM loan l JOIN account a ON l.account_id = a.account_id WHERE l.duration = 24    AND a.frequency = 'POPLATEK TYDNE';
SELECT AVG(l.amount)  FROM loan l JOIN account a ON l.account_id = a.account_id WHERE l.status IN ('C', 'D')   AND a.frequency = 'POPLATEK PO OBRATU';
SELECT DISTINCT c.client_id, c.district_id FROM client c JOIN disp d ON c.client_id = d.client_id WHERE d.type = 'OWNER';
SELECT      c.client_id,     (strftime('%Y', 'now') - strftime('%Y', c.birth_date)) AS age FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card cd ON d.disp_id = cd.disp_id WHERE cd.type = 'gold'   AND d.type = 'OWNER';
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY COUNT(bond_type) DESC LIMIT 1;
SELECT COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-'   AND T2.element = 'cl'
SELECT AVG(oxygen_count) AS average_oxygen_atoms FROM (     SELECT          b.molecule_id,         SUM(CASE WHEN a.element = 'o' THEN 1 ELSE 0 END) AS oxygen_count     FROM bond b     JOIN atom a ON b.molecule_id = a.molecule_id     WHERE b.bond_type = '-'     GROUP BY b.molecule_id ) AS single_bonded_molecules;
SELECT      CAST(SUM(CASE WHEN b.bond_type = '-' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(a.atom_id) AS average_single_bonds FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+';
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'na'   AND m.label = '-';
SELECT DISTINCT T1.molecule_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '#'   AND T1.label = '+'
SELECT      CAST(SUM(CASE WHEN a.element = 'c' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(a.atom_id) AS percentage FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id IN (     SELECT DISTINCT b.molecule_id      FROM bond b      WHERE b.bond_type = '=' );
SELECT COUNT(*)  FROM bond  WHERE bond_type = '#';
SELECT COUNT(*)  FROM atom  WHERE element != 'br';
SELECT COUNT(*)  FROM molecule  WHERE molecule_id BETWEEN 'TR000' AND 'TR099'    AND label = '+';
SELECT DISTINCT T1.molecule_id FROM atom AS T1 WHERE T1.element = 'c'
SELECT DISTINCT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR004_8_9' UNION SELECT DISTINCT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id2 WHERE T2.bond_id = 'TR004_8_9'
SELECT DISTINCT a.element FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id WHERE b.bond_type = '='
SELECT m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'h' GROUP BY m.label ORDER BY COUNT(*) DESC LIMIT 1;
SELECT DISTINCT T3.bond_type FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'cl'
SELECT DISTINCT     c.atom_id,     c.atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-';
SELECT DISTINCT c.atom_id, c.atom_id2 FROM connected c JOIN atom a ON c.atom_id = a.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '-';
SELECT a.element FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '-' GROUP BY a.element ORDER BY COUNT(a.element) ASC LIMIT 1;
SELECT T1.bond_type FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE (T2.atom_id = 'TR004_8' AND T2.atom_id2 = 'TR004_20')    OR (T2.atom_id = 'TR004_20' AND T2.atom_id2 = 'TR004_8')
SELECT DISTINCT m.label FROM molecule m WHERE m.molecule_id NOT IN (     SELECT DISTINCT a.molecule_id     FROM atom a     WHERE a.element = 'sn' ) AND m.label IN ('+', '-');
SELECT COUNT(DISTINCT T1.atom_id) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element IN ('i', 's')   AND T3.bond_type = '-';
SELECT c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#';
SELECT DISTINCT T1.atom_id FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id2 = T2.atom_id WHERE T2.molecule_id = 'TR181' UNION SELECT DISTINCT T1.atom_id2 FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T2.molecule_id = 'TR181'
SELECT      (COUNT(CASE WHEN f.molecule_id IS NULL THEN 1 END) * 100.0 / COUNT(m.molecule_id)) AS percentage FROM molecule m LEFT JOIN (     SELECT DISTINCT a.molecule_id     FROM atom a     WHERE a.element = 'f' ) f ON m.molecule_id = f.molecule_id WHERE m.label = '+';
SELECT      SUM(CASE WHEN b.bond_type = '#' THEN 1 ELSE 0 END) * 100.0 / COUNT(b.bond_id) AS percent FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.label = '+';
SELECT DISTINCT element FROM atom WHERE molecule_id = 'TR000' ORDER BY element ASC LIMIT 3;
SELECT      a1.atom_id,     a2.atom_id FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE c.bond_id = 'TR001_2_6'   AND a1.molecule_id = 'TR001';
SELECT      SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) -      SUM(CASE WHEN label = '-' THEN 1 ELSE 0 END) AS difference FROM      molecule;
SELECT atom_id  FROM connected  WHERE bond_id = 'TR000_2_5';
SELECT bond_id FROM connected WHERE atom_id2 = 'TR000_2';
SELECT DISTINCT T1.molecule_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '=' ORDER BY T1.molecule_id LIMIT 5;
SELECT      CAST(SUM(CASE WHEN T1.bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.bond_id) AS percentage FROM bond T1 WHERE T1.molecule_id = 'TR008';
SELECT      CAST(SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(molecule_id) AS percent FROM      molecule;
SELECT      CAST(SUM(CASE WHEN T1.element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) AS percentage FROM      atom T1 WHERE      T1.molecule_id = 'TR206';
SELECT DISTINCT T1.bond_type FROM bond AS T1 WHERE T1.molecule_id = 'TR000'
SELECT      a.element,     m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.molecule_id = 'TR060';
SELECT      b.bond_type,     m.label FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.molecule_id = 'TR010' GROUP BY b.bond_type, m.label ORDER BY COUNT(b.bond_id) DESC LIMIT 1;
SELECT DISTINCT T1.molecule_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-'   AND T2.bond_type = '-' ORDER BY T1.molecule_id LIMIT 3;
SELECT bond_id FROM bond WHERE molecule_id = 'TR006' ORDER BY bond_id ASC LIMIT 2;
SELECT COUNT(*)  FROM connected  WHERE bond_id IN (     SELECT bond_id      FROM bond      WHERE molecule_id = 'TR009' )  AND (atom_id = 'TR009_12' OR atom_id2 = 'TR009_12');
SELECT COUNT(*) FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+'   AND a.element = 'br';
SELECT      T1.bond_type,     T2.atom_id,     T2.atom_id2 FROM bond AS T1 INNER JOIN connected AS T2     ON T1.bond_id = T2.bond_id WHERE T1.bond_id = 'TR001_6_9';
SELECT      m.molecule_id,     m.label FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      a.atom_id = 'TR001_10';
SELECT COUNT(DISTINCT T1.molecule_id) FROM bond AS T1 WHERE T1.bond_type = '#'
SELECT COUNT(*)  FROM connected  WHERE atom_id LIKE 'TR%_19' OR atom_id2 LIKE 'TR%_19';
SELECT element FROM atom WHERE molecule_id = 'TR004';
SELECT COUNT(*)  FROM molecule  WHERE label = '-';
SELECT DISTINCT T1.molecule_id FROM atom AS T1 JOIN molecule AS T2   ON T1.molecule_id = T2.molecule_id WHERE SUBSTR(T1.atom_id, 7, 2) BETWEEN '21' AND '25'   AND T2.label = '+'
SELECT DISTINCT b.bond_id FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE (a1.element = 'p' AND a2.element = 'n')    OR (a1.element = 'n' AND a2.element = 'p');
SELECT m.label = '+' AS is_carcinogenic FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '=' GROUP BY m.molecule_id, m.label ORDER BY COUNT(b.bond_id) DESC LIMIT 1;
SELECT CAST(COUNT(DISTINCT T3.bond_id) AS REAL) / COUNT(DISTINCT T1.atom_id) AS average_bonds FROM atom T1 INNER JOIN connected T3 ON T1.atom_id = T3.atom_id WHERE T1.element = 'i'
SELECT T1.bond_type, T1.bond_id FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE SUBSTR(T2.atom_id, 7, 2) + 0 = 45    OR SUBSTR(T2.atom_id2, 7, 2) + 0 = 45
SELECT DISTINCT a.element FROM atom a WHERE a.atom_id NOT IN (     SELECT atom_id     FROM connected     UNION     SELECT atom_id2     FROM connected );
SELECT      T1.atom_id,     T1.atom_id2 FROM connected AS T1 INNER JOIN bond AS T2     ON T1.bond_id = T2.bond_id WHERE      T2.molecule_id = 'TR041'     AND T2.bond_type = '#';
SELECT DISTINCT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR144_8_19' UNION SELECT DISTINCT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id2 WHERE T2.bond_id = 'TR144_8_19'
SELECT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.label = '+'   AND b.bond_type = '=' GROUP BY m.molecule_id ORDER BY COUNT(b.bond_id) DESC LIMIT 1;
SELECT a.element FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' GROUP BY a.element ORDER BY COUNT(*) ASC LIMIT 1;
SELECT DISTINCT T1.atom_id2 FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T2.element = 'pb'
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#';
SELECT      (COUNT(DISTINCT c.bond_id) * 100.0 / (SELECT COUNT(*) FROM bond)) AS percentage FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE      CASE          WHEN a1.element <= a2.element THEN a1.element || '-' || a2.element         ELSE a2.element || '-' || a1.element     END = (         SELECT element_combination         FROM (             SELECT                  CASE                      WHEN a1.element <= a2.element THEN a1.element || '-' || a2.element                     ELSE a2.element || '-' || a1.element                 END AS element_combination,                 COUNT(DISTINCT c.bond_id) AS cnt             FROM connected c             JOIN atom a1 ON c.atom_id = a1.atom_id             JOIN atom a2 ON c.atom_id2 = a2.atom_id             GROUP BY element_combination             ORDER BY cnt DESC             LIMIT 1         ) AS most_common     )
SELECT    CAST(SUM(CASE WHEN T3.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.bond_id) AS proportion FROM bond AS T1 JOIN molecule AS T3   ON T1.molecule_id = T3.molecule_id WHERE T1.bond_type = '-';
SELECT COUNT(*)  FROM atom  WHERE element IN ('c', 'h');
SELECT c.atom_id2 FROM connected c JOIN atom a ON c.atom_id = a.atom_id WHERE a.element = 's'
SELECT DISTINCT   T3.bond_type FROM atom AS T1 INNER JOIN connected AS T2   ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3   ON T2.bond_id = T3.bond_id WHERE   T1.element = 'sn'
SELECT COUNT(DISTINCT a.element) FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id WHERE b.bond_type = '-';
SELECT COUNT(*)  FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.molecule_id IN (     SELECT b.molecule_id      FROM bond b      WHERE b.bond_type = '#' ) AND a.element IN ('p', 'br');
SELECT T1.bond_id FROM bond AS T1 JOIN molecule AS T2   ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'
SELECT DISTINCT b.molecule_id FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '-'   AND m.label = '-';
SELECT      CAST(SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(a.atom_id) AS percent FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id IN (     SELECT DISTINCT b.molecule_id      FROM bond b      WHERE b.bond_type = '-' );
SELECT label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002');
SELECT molecule_id FROM molecule WHERE label = '-';
SELECT COUNT(*)  FROM molecule  WHERE label = '+'    AND molecule_id BETWEEN 'TR000' AND 'TR030';
SELECT bond_type FROM bond WHERE molecule_id BETWEEN 'TR000' AND 'TR050';
SELECT T3.element FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id INNER JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T1.bond_id = 'TR001_10_11' UNION SELECT T3.element FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id INNER JOIN atom AS T3 ON T2.atom_id2 = T3.atom_id WHERE T1.bond_id = 'TR001_10_11'
SELECT COUNT(DISTINCT c.bond_id) FROM connected c JOIN atom a ON c.atom_id = a.atom_id WHERE a.element = 'i';
SELECT MAX(m.label) AS majority_label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'ca';
SELECT      CASE          WHEN (a1.element = 'cl' AND a2.element = 'c') OR (a1.element = 'c' AND a2.element = 'cl')          THEN 'Yes'         ELSE 'No'     END AS has_chlorine_and_carbon FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE c.bond_id = 'TR001_1_8' LIMIT 1;
SELECT DISTINCT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id JOIN atom a ON m.molecule_id = a.molecule_id WHERE b.bond_type = '#'   AND m.label = '-'   AND a.element = 'c' LIMIT 2;
SELECT    CAST(SUM(CASE WHEN T1.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) AS percentage FROM atom AS T1 JOIN molecule AS T2   ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'
SELECT DISTINCT a.element FROM atom a WHERE a.molecule_id = 'TR001';
SELECT molecule_id FROM bond WHERE bond_type = '=';
SELECT      T1.atom_id,     T1.atom_id2 FROM connected AS T1 INNER JOIN bond AS T2     ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '#';
SELECT DISTINCT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR000_1_2' UNION SELECT DISTINCT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id2 WHERE T2.bond_id = 'TR000_1_2'
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '-'   AND m.label = '-';
SELECT m.label FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_id = 'TR001_10_11';
SELECT      T1.bond_id,     CASE          WHEN T2.label = '+' THEN 'carcinogenic'         ELSE 'non-carcinogenic'     END AS carcinogenic FROM bond AS T1 JOIN molecule AS T2     ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '#';
SELECT      a.element,     COUNT(*) AS count FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+'   AND SUBSTR(a.atom_id, 7, 1) = '4' GROUP BY a.element;
SELECT      m.label,     CAST(SUM(CASE WHEN a.element = 'h' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(a.element) AS ratio FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      a.molecule_id = 'TR006' GROUP BY      m.label;
SELECT    m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'ca';
SELECT DISTINCT T2.bond_type FROM atom AS T1 INNER JOIN connected AS T3 ON T1.atom_id = T3.atom_id INNER JOIN bond AS T2 ON T3.bond_id = T2.bond_id WHERE T1.element = 'c'
SELECT DISTINCT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_10_11' UNION SELECT DISTINCT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id2 WHERE T2.bond_id = 'TR001_10_11'
SELECT      CAST(COUNT(DISTINCT b.molecule_id) AS FLOAT) * 100 / (SELECT COUNT(*) FROM molecule) AS percentage FROM bond b WHERE b.bond_type = '#';
SELECT      (SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS percent FROM bond WHERE molecule_id = 'TR047';
SELECT    CASE      WHEN m.label = '+' THEN 'carcinogenic'     ELSE 'not carcinogenic'   END AS carcinogenic_status FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR001_1';
SELECT label FROM molecule WHERE molecule_id = 'TR151';
SELECT DISTINCT T1.element FROM atom AS T1 WHERE T1.molecule_id = 'TR151'   AND T1.element IN ('cl', 'br', 'i', 'pb', 'te', 'sn', 's', 'f');
SELECT COUNT(*)  FROM molecule  WHERE label = '+';
SELECT T1.atom_id FROM atom AS T1 WHERE T1.element = 'c'   AND T1.molecule_id IS NOT NULL   AND SUBSTR(T1.molecule_id, 3, 3) >= '10'   AND SUBSTR(T1.molecule_id, 3, 3) <= '50'
SELECT COUNT(*) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+';
SELECT DISTINCT b.bond_id FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '='   AND m.label = '+';
SELECT COUNT(*) FROM atom WHERE element = 'h'   AND molecule_id IN (     SELECT molecule_id     FROM molecule     WHERE label = '+'   );
SELECT T1.molecule_id FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T2.atom_id = 'TR000_1'   AND T1.bond_id = 'TR000_1_2'
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c'   AND m.label = '-';
SELECT      CAST(SUM(CASE WHEN m.label = '+' AND a.element = 'h' THEN 1 ELSE 0 END) AS FLOAT) * 100.0 / COUNT(m.molecule_id) AS percentage FROM molecule m LEFT JOIN atom a ON m.molecule_id = a.molecule_id;
SELECT label FROM molecule WHERE molecule_id = 'TR124';
SELECT atom_id FROM atom WHERE molecule_id = 'TR186';
SELECT bond_type FROM bond WHERE bond_id = 'TR007_4_19';
SELECT DISTINCT a1.element, a2.element FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE c.bond_id = 'TR001_2_4';
SELECT    COUNT(CASE WHEN T2.bond_type = '=' THEN 1 ELSE NULL END) AS double_bond_count,   CASE WHEN T1.label = '+' THEN 'carcinogenic' ELSE 'non-carcinogenic' END AS carcinogenic_status FROM molecule T1 LEFT JOIN bond T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR006';
SELECT DISTINCT m.molecule_id, a.element FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' ORDER BY m.molecule_id, a.element;
SELECT      T1.bond_id,     T2.atom_id,     T2.atom_id2 FROM bond AS T1 INNER JOIN connected AS T2     ON T1.bond_id = T2.bond_id WHERE T1.bond_type = '-';
SELECT DISTINCT m.molecule_id, a.element FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id JOIN atom a ON m.molecule_id = a.molecule_id WHERE b.bond_type = '#' ORDER BY m.molecule_id, a.element;
SELECT DISTINCT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR000_2_3' UNION SELECT DISTINCT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id2 WHERE T2.bond_id = 'TR000_2_3'
SELECT COUNT(DISTINCT c.bond_id) FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE a1.element = 'cl' OR a2.element = 'cl';
SELECT      a.atom_id,     (SELECT COUNT(DISTINCT b.bond_type)       FROM bond b       WHERE b.molecule_id = 'TR346') AS bond_type_count FROM atom a WHERE a.molecule_id = 'TR346';
SELECT      COUNT(DISTINCT m.molecule_id) AS total_molecules_with_double_bond,     COUNT(DISTINCT CASE WHEN m.label = '+' THEN m.molecule_id END) AS carcinogenic_molecules FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '=';
SELECT COUNT(*)  FROM molecule m WHERE m.molecule_id NOT IN (     SELECT DISTINCT a.molecule_id      FROM atom a      WHERE a.element = 's' ) AND m.molecule_id NOT IN (     SELECT DISTINCT b.molecule_id      FROM bond b      WHERE b.bond_type = '=' );
SELECT m.label FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_id = 'TR001_2_4';
SELECT COUNT(*)  FROM atom  WHERE molecule_id = 'TR001';
SELECT COUNT(*)  FROM bond  WHERE bond_type = '-';
SELECT DISTINCT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'cl'   AND m.label = '+';
SELECT DISTINCT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'c'   AND m.label = '-';
SELECT    CAST(SUM(CASE WHEN T1.label = '+' AND T2.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) AS percentage FROM molecule T1 JOIN atom T2 ON T1.molecule_id = T2.molecule_id;
SELECT molecule_id  FROM bond  WHERE bond_id = 'TR001_1_7';
SELECT COUNT(*)  FROM connected  WHERE bond_id = 'TR001_3_4';
SELECT T2.bond_type FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T1.atom_id = 'TR000_1'   AND T1.atom_id2 = 'TR000_2';
SELECT T1.molecule_id FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.atom_id = 'TR000_2'   AND T2.atom_id2 = 'TR000_4'
SELECT element FROM atom WHERE atom_id = 'TR000_1';
SELECT label  FROM molecule  WHERE molecule_id = 'TR000';
SELECT    CAST(SUM(CASE WHEN T1.bond_type = '-' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.bond_id) AS percentage FROM bond AS T1;
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+'   AND a.element = 'n';
SELECT DISTINCT a.molecule_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 's'   AND b.bond_type = '=';
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-' GROUP BY T1.molecule_id HAVING COUNT(T2.molecule_id) > 5
SELECT DISTINCT a.element FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN atom a ON c.atom_id = a.atom_id WHERE b.bond_type = '='   AND a.molecule_id = 'TR024';
SELECT      m.molecule_id FROM      molecule m JOIN      atom a ON m.molecule_id = a.molecule_id WHERE      m.label = '+' GROUP BY      m.molecule_id ORDER BY      COUNT(a.molecule_id) DESC LIMIT 1;
SELECT      CAST(SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) AS FLOAT) * 100.0 / COUNT(*) AS percentage FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON b.molecule_id = m.molecule_id WHERE a.element = 'h'      AND b.bond_type = '#';
SELECT COUNT(*)  FROM molecule  WHERE label = '+';
SELECT COUNT(DISTINCT molecule_id) FROM bond WHERE molecule_id BETWEEN 'TR004' AND 'TR010' AND bond_type = '-';
SELECT COUNT(*)  FROM atom  WHERE molecule_id = 'TR008'    AND element = 'c';
SELECT T1.element FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR004_7' AND T2.label = '-'
SELECT COUNT(DISTINCT a.molecule_id) FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'o'   AND b.bond_type = '=';
SELECT COUNT(*)  FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '#'   AND m.label = '-';
SELECT a.element, b.bond_type FROM atom a CROSS JOIN bond b WHERE a.molecule_id = 'TR002'   AND b.molecule_id = 'TR002';
SELECT T1.atom_id FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'c'   AND T3.bond_type = '='   AND T1.molecule_id = 'TR012'
SELECT DISTINCT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+'   AND a.element = 'o';
SELECT name FROM cards WHERE cardKingdomFoilId IS NOT NULL   AND cardKingdomId IS NOT NULL;
SELECT * FROM cards WHERE borderColor = 'borderless'   AND cardKingdomFoilId IS NULL   AND cardKingdomId IS NOT NULL;
SELECT name, MAX(faceConvertedManaCost) AS max_face_converted_mana_cost FROM cards GROUP BY name ORDER BY max_face_converted_mana_cost DESC;
SELECT name FROM cards WHERE frameVersion = '2015'   AND edhrecRank < 100;
SELECT DISTINCT c.* FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'mythic'   AND l.status = 'Banned'   AND l.format = 'gladiator';
SELECT T2.status FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.types = 'Artifact'   AND T1.side IS NULL   AND T2.format = 'vintage'
SELECT DISTINCT     c.id,     c.artist FROM cards AS c JOIN legalities AS l     ON c.uuid = l.uuid WHERE     l.format = 'commander'     AND l.status = 'Legal'     AND (c.power = '*' OR c.power IS NULL);
SELECT      c.id,     r.text AS ruling_text,     c.hasContentWarning FROM      cards c LEFT JOIN      rulings r ON c.uuid = r.uuid WHERE      c.artist = 'Stephen Daniele'     AND c.hasContentWarning = 1;
SELECT T1.text FROM rulings AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Sublime Epiphany' AND T2.number = '74s'
SELECT      c.name,     c.artist,     c.isPromo FROM cards c JOIN rulings r ON c.uuid = r.uuid GROUP BY c.uuid ORDER BY COUNT(r.uuid) DESC LIMIT 1;
SELECT DISTINCT fd.language FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE c.name = 'Annul'   AND c.number = '29';
SELECT DISTINCT c.name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Japanese';
SELECT    CAST(SUM(CASE WHEN fd.language = 'Chinese Simplified' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(fd.id) AS percentage FROM foreign_data fd;
SELECT      st.translation,     s.totalSetSize FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE st.language = 'Italian';
SELECT COUNT(DISTINCT T1.type)  FROM cards AS T1 WHERE T1.artist = 'Aaron Boyd'
SELECT keywords  FROM cards  WHERE name = 'Angel of Mercy';
SELECT COUNT(*)  FROM cards  WHERE power = '*';
SELECT promoTypes FROM cards WHERE name = 'Duress';
SELECT borderColor FROM cards WHERE name = 'Ancestor''s Chosen';
SELECT originalType FROM cards WHERE name = 'Ancestor''s Chosen';
SELECT DISTINCT st.language FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE c.name = 'Angel of Mercy';
SELECT COUNT(*)  FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.status = 'restricted'   AND c.isTextless = 0;
SELECT T1.text FROM rulings AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Condemn'
SELECT COUNT(*)  FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.status = 'restricted'    AND c.isStarter = 1;
SELECT T1.status FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Cloudchaser Eagle'
SELECT type FROM cards WHERE name = 'Benalish Knight';
SELECT T1.format FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Benalish Knight'
SELECT DISTINCT c.artist FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Phyrexian';
SELECT    CAST(SUM(CASE WHEN borderColor = 'borderless' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(id) AS percentage FROM cards;
SELECT COUNT(*)  FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'German'    AND c.isReprint = 1;
SELECT COUNT(*)  FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.borderColor = 'borderless'   AND fd.language = 'Russian';
SELECT    CAST(COUNT(CASE WHEN fd.language = 'French' THEN c.id END) AS REAL) * 100 / COUNT(c.id) AS percentage FROM cards c LEFT JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.isStorySpotlight = 1;
SELECT COUNT(*)  FROM cards  WHERE toughness = '99';
SELECT name FROM cards WHERE artist = 'Aaron Boyd';
SELECT COUNT(*)  FROM cards  WHERE borderColor = 'black'    AND availability = 'mtgo';
SELECT id FROM cards WHERE convertedManaCost = 0;
SELECT DISTINCT      T1.layout FROM cards AS T1 WHERE T1.keywords LIKE '%flying%'
SELECT COUNT(*)  FROM cards  WHERE originalType = 'Summon - Angel'    AND subtypes != 'Angel';
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL
SELECT id FROM cards WHERE duelDeck = 'a';
SELECT edhrecRank FROM cards WHERE frameVersion = '2015';
SELECT DISTINCT c.artist FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Chinese Simplified';
SELECT DISTINCT c.name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.availability = 'paper'   AND fd.language = 'Japanese';
SELECT COUNT(*)  FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.status = 'Banned'   AND c.borderColor = 'white';
SELECT DISTINCT     l.uuid,     fd.language FROM legalities l JOIN foreign_data fd ON l.uuid = fd.uuid WHERE l.format = 'legacy';
SELECT T1.text FROM rulings AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Beacon of Immortality'
SELECT      COUNT(DISTINCT T1.uuid) AS card_count,     T2.status AS legality_status FROM cards T1 INNER JOIN legalities T2 ON T1.uuid = T2.uuid WHERE T1.frameVersion = 'future' GROUP BY T2.status
SELECT      c.name,     c.colors FROM      cards c WHERE      c.setCode = 'OGW';
SELECT      c.name AS card_name,     st.translation,     st.language FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE c.setCode = '10E'   AND c.convertedManaCost = 5;
SELECT      c.name,     r.date FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.originalType = 'Creature - Elf';
SELECT      c.colors,     l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.id BETWEEN 1 AND 20
SELECT DISTINCT c.name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.originalType = 'Artifact'   AND c.colors = 'B'   AND fd.language IS NOT NULL;
SELECT T1.name FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'uncommon' ORDER BY T2.date ASC LIMIT 3
SELECT COUNT(*)  FROM cards  WHERE artist = 'John Avon'    AND (cardKingdomId IS NULL OR cardKingdomFoilId IS NULL);
SELECT COUNT(*)  FROM cards  WHERE borderColor = 'white'    AND cardKingdomFoilId IS NOT NULL    AND cardKingdomId IS NOT NULL;
SELECT COUNT(*)  FROM cards  WHERE artist = 'UDON'    AND availability = 'mtgo'    AND hand = '-1';
SELECT COUNT(*)  FROM cards  WHERE frameVersion = '1993'    AND availability = 'paper'    AND hasContentWarning = 1;
SELECT    manaCost FROM    cards WHERE    layout = 'normal'   AND frameVersion = '2003'   AND borderColor = 'black'   AND availability = 'mtgo,paper';
SELECT SUM(manaCost) FROM cards WHERE artist = 'Rob Alexander';
SELECT DISTINCT      subtypes,     supertypes FROM cards WHERE availability = 'arena'
SELECT DISTINCT T1.setCode FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Spanish'
SELECT    CAST(SUM(CASE WHEN isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(id) AS percentage FROM cards WHERE frameEffects = 'legendary';
SELECT    id,   (SELECT CAST(SUM(CASE WHEN isStorySpotlight = 1 AND isTextless = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(id) FROM cards) AS percentage FROM cards ORDER BY id;
SELECT    c.name,   CAST(SUM(CASE WHEN fd.language = 'Spanish' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(c.id) AS percentage FROM cards c LEFT JOIN foreign_data fd ON c.uuid = fd.uuid GROUP BY c.name ORDER BY c.name;
SELECT DISTINCT     T1.translation FROM set_translations AS T1 INNER JOIN sets AS T2     ON T1.setCode = T2.code WHERE     T2.baseSetSize = 309
SELECT COUNT(*) FROM set_translations AS st JOIN sets AS s ON st.setCode = s.code WHERE s.block = 'Commander'   AND st.language = 'Portuguese (Brasil)';
SELECT c.id FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.types = 'Creature'   AND l.status = 'Legal';
SELECT DISTINCT     c.subtypes,     c.supertypes FROM cards AS c JOIN foreign_data AS f ON c.uuid = f.uuid WHERE f.language = 'German'   AND c.subtypes IS NOT NULL   AND c.supertypes IS NOT NULL;
SELECT COUNT(*)  FROM cards  WHERE (power IS NULL OR power = '*')    AND text LIKE '%triggered ability%';
SELECT COUNT(*)  FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN rulings r ON c.uuid = r.uuid WHERE l.format = 'premodern'   AND r.text = 'This is a triggered mana ability.'   AND c.side IS NULL;
SELECT DISTINCT c.id FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.artist = 'Erica Yang'   AND l.format = 'pauper'   AND l.status = 'Legal'   AND c.availability = 'paper';
SELECT    c.artist FROM    cards c   JOIN foreign_data f ON c.uuid = f.uuid WHERE    f.text = 'Das perfekte Gegenmittel zu einer dichten Formation';
SELECT T1.name FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.language = 'French'   AND T2.type = 'Creature'   AND T2.layout = 'normal'   AND T2.borderColor = 'black'   AND T2.artist = 'Matthew D. Wilson'
SELECT COUNT(*)  FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.rarity = 'rare'   AND r.date = '2007-02-01';
SELECT DISTINCT   T3.translation FROM sets AS T1 INNER JOIN set_translations AS T3   ON T1.code = T3.setCode WHERE T1.baseSetSize = 180   AND T1.block = 'Ravnica'
SELECT    CAST(SUM(CASE WHEN C.hasContentWarning = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(C.id) AS percentage FROM cards C INNER JOIN legalities L ON C.uuid = L.uuid WHERE L.format = 'commander'    AND L.status = 'Legal';
SELECT    CAST(COUNT(DISTINCT CASE WHEN T2.language = 'French' AND (T1.power IS NULL OR T1.power = '*') THEN T1.uuid END) AS REAL) * 100 /    COUNT(DISTINCT CASE WHEN T1.power IS NULL OR T1.power = '*' THEN T1.uuid END) AS percentage FROM cards T1 LEFT JOIN foreign_data T2   ON T1.uuid = T2.uuid WHERE T1.power IS NULL OR T1.power = '*';
SELECT    CAST(COUNT(CASE WHEN T1.language = 'Japanese' AND T2.type = 'expansion' THEN 1 END) AS REAL) * 100 / COUNT(CASE WHEN T1.language = 'Japanese' THEN 1 END) AS percentage FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.language = 'Japanese';
SELECT availability FROM cards WHERE artist = 'Daren Bader';
SELECT COUNT(*)  FROM cards  WHERE borderColor = 'borderless'    AND edhrecRank > 12000;
SELECT COUNT(*)  FROM cards  WHERE isOversized = 1    AND isReprint = 1    AND isPromo = 1;
SELECT name FROM cards WHERE (power IS NULL OR power = '*')   AND promoTypes = 'arenaleague' ORDER BY name ASC LIMIT 3;
SELECT language  FROM foreign_data  WHERE multiverseid = 149934;
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL    AND cardKingdomId IS NOT NULL ORDER BY cardKingdomFoilId ASC LIMIT 3;
SELECT    CAST(SUM(CASE WHEN isTextless = 1 AND layout = 'normal' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards;
SELECT    number FROM    cards WHERE    side IS NULL   AND subtypes LIKE '%Angel%'   AND subtypes LIKE '%Wizard%';
SELECT name FROM sets WHERE mtgoCode IS NULL OR mtgoCode = '' ORDER BY name ASC LIMIT 3;
SELECT DISTINCT   T1.language FROM set_translations AS T1 INNER JOIN sets AS T2   ON T1.setCode = T2.code WHERE   T2.mcmName = 'Archenemy' AND T2.code = 'ARC'
SELECT      s.name AS set_name,     st.translation FROM sets s LEFT JOIN set_translations st ON s.code = st.setCode WHERE s.id = 5;
SELECT      st.language,     s.type FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.id = 206;
SELECT DISTINCT s.id, s.name FROM sets s JOIN cards c ON s.code = c.setCode JOIN foreign_data fd ON c.uuid = fd.uuid WHERE s.block = 'Shadowmoor'   AND fd.language = 'Italian' ORDER BY s.name ASC LIMIT 2;
SELECT DISTINCT s.id FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.isForeignOnly = 1   AND s.isFoilOnly = 1   AND st.language = 'Japanese';
SELECT s.name FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Russian' ORDER BY s.baseSetSize DESC LIMIT 1;
SELECT      CAST(SUM(CASE WHEN c.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) AS percentage FROM cards c INNER JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Chinese Simplified';
SELECT COUNT(*)  FROM sets s WHERE s.isForeignOnly = 1    AND (s.mtgoCode IS NULL OR s.mtgoCode = '')   AND EXISTS (     SELECT 1      FROM set_translations st      WHERE st.setCode = s.code        AND st.language = 'Japanese'   );
SELECT id FROM cards WHERE borderColor = 'black';
SELECT COUNT(*), id FROM cards WHERE frameEffects = 'extendedart' GROUP BY id;
SELECT name FROM cards WHERE borderColor = 'black'   AND isFullArt = 1 LIMIT 1;
SELECT language  FROM set_translations  WHERE setCode = (     SELECT code      FROM sets      WHERE id = 174 );
SELECT name  FROM sets  WHERE code = 'ALL';
SELECT DISTINCT fd.language FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE c.name = 'A Pedra Fellwar';
SELECT code  FROM sets  WHERE releaseDate = '2007-07-13';
SELECT      baseSetSize,     code FROM sets WHERE block IN ('Masques', 'Mirage');
SELECT code FROM sets WHERE type = 'expansion';
SELECT fd.name, c.type FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.watermark = 'Boros';
SELECT      fd.language,     fd.flavorText,     c.type FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.watermark = 'colorpie';
SELECT      CAST(COUNT(CASE WHEN T1.convertedManaCost = 10 THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.convertedManaCost) AS percentage FROM cards AS T1 INNER JOIN sets AS T2     ON T1.setCode = T2.code WHERE T2.name = 'Abyssal Horror';
SELECT code FROM sets WHERE type = 'expansion'   AND block = 'commander';
SELECT fd.name, c.type FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.watermark = 'abzan';
SELECT DISTINCT      fd.language,     c.type FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.watermark = 'Azorius';
SELECT COUNT(*)  FROM cards  WHERE artist = 'Aaron Miller'    AND cardKingdomFoilId IS NOT NULL    AND cardKingdomId IS NOT NULL;
SELECT COUNT(*)  FROM cards  WHERE availability LIKE '%paper%'    AND hand = '3';
SELECT name FROM cards WHERE isTextless = 0;
SELECT convertedManaCost  FROM cards  WHERE name = 'Ancestor`s Chosen';
SELECT COUNT(*)  FROM cards  WHERE borderColor = 'white'    AND (power = '*' OR power IS NULL);
SELECT DISTINCT c.name FROM cards c WHERE c.isPromo = 1   AND c.side IS NOT NULL;
SELECT subtypes, supertypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer';
SELECT purchaseUrls FROM cards WHERE promoTypes = 'bundle';
SELECT COUNT(DISTINCT artist)  FROM cards  WHERE borderColor = 'black'    AND availability LIKE '%arena,mtgo%';
SELECT name FROM cards WHERE name IN ('Serra Angel', 'Shrine Keeper') ORDER BY convertedManaCost DESC LIMIT 1;
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer';
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3;
SELECT T3.translation FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code INNER JOIN set_translations AS T3 ON T2.code = T3.setCode WHERE T1.name = 'Ancestor''s Chosen'   AND T3.language = 'Italian'
SELECT COUNT(*) FROM set_translations st JOIN sets s ON st.setCode = s.code JOIN cards c ON c.setCode = s.code WHERE c.name = 'Angel of Mercy';
SELECT DISTINCT c.name FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition';
SELECT    CASE      WHEN COUNT(*) > 0 THEN 'Yes'      ELSE 'No'    END AS has_korean_version FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE c.name = 'Ancestor''s Chosen'   AND fd.language = 'Korean';
SELECT COUNT(*)  FROM cards c JOIN sets s ON c.setCode = s.code JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition'   AND c.artist = 'Adam Rex';
SELECT T1.baseSetSize FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Hauptset Zehnte Edition'
SELECT T1.translation FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Eighth Edition' AND T1.language = 'Chinese Simplified'
SELECT    CASE      WHEN s.mtgoCode IS NOT NULL THEN 'Yes'     ELSE 'No'   END AS appeared_on_mtgo FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.name = 'Angel of Mercy' LIMIT 1;
SELECT releaseDate  FROM sets  WHERE name = 'Ancestor''s Chosen';
SELECT DISTINCT s.type FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition';
SELECT COUNT(*) FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.block = 'Ice Age'   AND st.language = 'Italian'   AND st.translation IS NOT NULL;
SELECT    CASE      WHEN s.isForeignOnly = 1 THEN 'Yes'     ELSE 'No'   END AS is_only_available_outside_us FROM sets s JOIN cards c ON c.setCode = s.code WHERE c.name = 'Adarkar Valkyrie' LIMIT 1;
SELECT COUNT(*)  FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian'   AND st.translation IS NOT NULL   AND s.baseSetSize < 100;
SELECT COUNT(*)  FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap'    AND c.borderColor = 'black';
SELECT c.name FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap' ORDER BY c.convertedManaCost DESC LIMIT 1;
SELECT DISTINCT T1.artist FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap'   AND T1.artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy')
SELECT T1.name FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap'   AND T1.number = '4'
SELECT COUNT(*)  FROM cards AS c JOIN sets AS s ON c.setCode = s.code WHERE s.name = 'Coldsnap'   AND c.convertedManaCost > 5   AND (c.power = '*' OR c.power IS NULL);
SELECT T1.flavorText FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Ancestor''s Chosen' AND T1.language = 'Italian'
SELECT DISTINCT fd.language FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE c.name = 'Ancestor''s Chosen'   AND fd.flavorText IS NOT NULL;
SELECT T1.type FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Ancestor''s Chosen' AND T1.language = 'German'
SELECT T1.text FROM rulings AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid INNER JOIN sets AS T3 ON T2.setCode = T3.code WHERE T3.name = 'Coldsnap'
SELECT fd.name FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE c.setCode = (     SELECT code     FROM sets     WHERE name = 'Coldsnap' ) AND fd.language = 'Italian' AND c.convertedManaCost = (     SELECT MAX(convertedManaCost)     FROM cards     WHERE setCode = (         SELECT code         FROM sets         WHERE name = 'Coldsnap'     ) );
SELECT T1.date FROM rulings AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Reminisce'
SELECT    CAST(SUM(CASE WHEN T1.convertedManaCost = 7 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM cards AS T1 INNER JOIN sets AS T2    ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap'
SELECT    CAST(SUM(CASE WHEN T1.cardKingdomFoilId IS NOT NULL AND T1.cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM cards AS T1 INNER JOIN sets AS T2   ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap'
SELECT code  FROM sets  WHERE releaseDate = '2017-07-14';
SELECT keyruneCode FROM sets WHERE code = 'PKHC';
SELECT mcmId FROM sets WHERE code = 'SS2';
SELECT mcmName FROM sets WHERE releaseDate = '2017-06-09';
SELECT type FROM sets WHERE name = 'From the Vault: Lore';
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized';
SELECT      c.name,     r.text AS ruling_text,     c.hasContentWarning FROM      cards c JOIN      rulings r ON c.uuid = r.uuid WHERE      c.artist = 'Jim Pavelec';
SELECT T1.releaseDate FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T2.name = 'Evacuation'
SELECT T1.baseSetSize FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Rinascita di Alara'
SELECT DISTINCT s.type FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Huitième édition';
SELECT T3.translation FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid INNER JOIN sets AS T4 ON T1.setCode = T4.code INNER JOIN set_translations AS T3 ON T4.code = T3.setCode WHERE T2.name = 'Tendo Ice Bridge'   AND T3.language = 'French'
SELECT COUNT(*)  FROM set_translations  WHERE setCode IN (     SELECT code      FROM sets      WHERE name = 'Tenth Edition' )  AND translation IS NOT NULL;
SELECT T3.translation FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code INNER JOIN set_translations AS T3 ON T2.code = T3.setCode WHERE T1.name = 'Fellwar Stone'   AND T3.language = 'Japanese'
SELECT T1.name FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Journey into Nyx Hero''s Path' ORDER BY T1.convertedManaCost DESC LIMIT 1
SELECT T1.releaseDate FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Ola de frío'
SELECT DISTINCT T2.type FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Samite Pilgrim'
SELECT COUNT(*)  FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'World Championship Decks 2004'   AND c.convertedManaCost = 3.0;
SELECT T2.translation FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Mirrodin'   AND T2.language = 'Chinese Simplified'
SELECT    CAST(SUM(CASE WHEN s.isNonFoilOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS percentage FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Japanese';
SELECT      CAST(SUM(CASE WHEN c.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) AS percentage FROM cards c INNER JOIN set_translations st ON c.setCode = st.setCode WHERE st.language = 'Portuguese (Brazil)';
SELECT DISTINCT availability FROM cards WHERE artist = 'Aleksi Briclot'   AND isTextless = 1;
SELECT id FROM sets ORDER BY baseSetSize DESC LIMIT 1;
SELECT artist FROM cards WHERE side IS NULL ORDER BY convertedManaCost DESC LIMIT 1;
SELECT      c.frameEffects FROM      cards c WHERE      c.cardKingdomFoilId IS NOT NULL     AND c.cardKingdomId IS NOT NULL GROUP BY      c.frameEffects ORDER BY      COUNT(*) DESC LIMIT 1;
SELECT COUNT(*)  FROM cards  WHERE (power IS NULL OR power = '*')    AND hasFoil = 0    AND duelDeck = 'a';
SELECT id FROM sets WHERE type = 'commander' ORDER BY totalSetSize DESC LIMIT 1;
SELECT T1.name FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.format = 'duel' ORDER BY T1.convertedManaCost DESC LIMIT 10
SELECT      c.originalReleaseDate,     l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'mythic'   AND l.status = 'Legal'   AND c.originalReleaseDate = (     SELECT MIN(originalReleaseDate)      FROM cards      WHERE rarity = 'mythic'   );
SELECT COUNT(*)  FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.artist = 'Volkan Baǵa'   AND f.language = 'French';
SELECT COUNT(*)  FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'rare'    AND c.types = 'Enchantment'    AND c.name = 'Abundance'   AND l.status = 'Legal';
SELECT l.format, c.name FROM legalities l JOIN cards c ON l.uuid = c.uuid WHERE l.status = 'Banned'   AND l.format = (     SELECT format     FROM legalities     WHERE status = 'Banned'     GROUP BY format     ORDER BY COUNT(*) DESC     LIMIT 1   ) ORDER BY l.format, c.name;
SELECT st.translation FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.name = 'Battlebond';
SELECT l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.artist = (     SELECT artist     FROM cards     WHERE artist IS NOT NULL     GROUP BY artist     ORDER BY COUNT(*) ASC     LIMIT 1 );
SELECT T1.status FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.frameVersion = '1997'   AND T2.artist = 'D. Alexander Gregory'   AND T1.format = 'legacy'   AND T2.hasContentWarning = 1
SELECT      c.name,     l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.edhrecRank = 1   AND l.status = 'Banned';
SELECT      CAST(COUNT(s.id) AS REAL) / 4.0 AS annual_average_sets,     (SELECT st2.language       FROM set_translations st2       GROUP BY st2.language       ORDER BY COUNT(st2.id) DESC       LIMIT 1) AS common_language FROM sets s WHERE s.releaseDate BETWEEN '2012-01-01' AND '2015-12-31';
SELECT DISTINCT artist FROM cards WHERE borderColor = 'black'   AND availability = 'arena';
SELECT uuid  FROM legalities  WHERE format = 'oldschool'    AND status IN ('banned', 'restricted');
SELECT COUNT(*)  FROM cards  WHERE artist = 'Matthew D. Wilson'    AND availability = 'paper';
SELECT T1.text FROM rulings AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.artist = 'Kev Walker' ORDER BY T1.date DESC
SELECT      c.name,     l.format FROM cards c JOIN sets s ON c.setCode = s.code JOIN legalities l ON c.uuid = l.uuid WHERE s.name = 'Hour of Devastation'   AND l.status = 'Legal';
SELECT DISTINCT s.name FROM sets s WHERE s.code IN (     SELECT setCode     FROM set_translations     WHERE language = 'Korean' ) AND s.code NOT IN (     SELECT setCode     FROM set_translations     WHERE language LIKE '%Japanese%' );
SELECT DISTINCT     c.frameVersion,     c.name,     CASE WHEN l.status = 'Banned' THEN 'Banned' ELSE NULL END AS banned_status FROM cards c LEFT JOIN legalities l ON c.uuid = l.uuid WHERE c.artist = 'Allen Williams' ORDER BY c.frameVersion, c.name;
SELECT DisplayName, Reputation FROM users WHERE DisplayName IN ('Harlan', 'Jarrod Dixon') ORDER BY Reputation DESC LIMIT 1;
SELECT DisplayName FROM users WHERE strftime('%Y', CreationDate) = '2011'
SELECT COUNT(*)  FROM users  WHERE LastAccessDate > '2014-09-01';
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1;
SELECT COUNT(*)  FROM users  WHERE UpVotes > 100    AND DownVotes > 1;
SELECT COUNT(*)  FROM users  WHERE Views > 10    AND STRFTIME('%Y', CreationDate) > '2013';
SELECT COUNT(*)  FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie';
SELECT p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie';
SELECT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Eliciting priors from experts';
SELECT p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' ORDER BY p.ViewCount DESC LIMIT 1;
SELECT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id ORDER BY p.FavoriteCount DESC LIMIT 1;
SELECT SUM(p.CommentCount) AS TotalComments FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie';
SELECT COUNT(*) AS answer_count FROM posts AS answers JOIN users AS u ON answers.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie'   AND answers.PostTypeId = 2 GROUP BY answers.ParentId ORDER BY answer_count DESC LIMIT 1;
SELECT u.DisplayName FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE p.Title = 'Examples for teaching: Correlation does not mean causation';
SELECT COUNT(*)  FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie'   AND p.ParentId IS NULL;
SELECT DISTINCT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ClosedDate IS NOT NULL;
SELECT COUNT(*)  FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.Age > 65    AND p.Score >= 20;
SELECT u.Location FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Eliciting priors from experts';
SELECT T2.Body FROM tags AS T1 INNER JOIN posts AS T2 ON T1.ExcerptPostId = T2.Id WHERE T1.TagName = 'bayesian'
SELECT p.Body FROM tags t JOIN posts p ON t.ExcerptPostId = p.Id ORDER BY t.Count DESC LIMIT 1;
SELECT COUNT(*)  FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie';
SELECT DISTINCT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie';
SELECT COUNT(*)  FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie'   AND YEAR(b.Date) = 2011;
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId GROUP BY u.Id, u.DisplayName ORDER BY COUNT(b.Id) DESC LIMIT 1;
SELECT AVG(p.Score) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie';
SELECT CAST(COUNT(T1.Id) AS REAL) / COUNT(T2.DisplayName) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.Views > 200
SELECT    CAST(SUM(CASE WHEN T2.Age > 65 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.Id) AS percentage FROM posts AS T1 INNER JOIN users AS T2   ON T1.OwnerUserId = T2.Id WHERE T1.Score > 5;
SELECT COUNT(*)  FROM votes  WHERE UserId = 58    AND CreationDate = '2010-07-19';
SELECT CreationDate FROM votes GROUP BY CreationDate ORDER BY COUNT(Id) DESC LIMIT 1;
SELECT COUNT(Id)  FROM badges  WHERE Name = 'Revival';
SELECT p.Title FROM posts p JOIN comments c ON p.Id = c.PostId ORDER BY c.Score DESC LIMIT 1;
SELECT CommentCount  FROM posts  WHERE ViewCount = 1910;
SELECT T1.FavoriteCount FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T2.UserId = 3025 AND T2.CreationDate = '2014-04-23 20:29:39.0'
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ParentId = 107829   AND p.CommentCount = 1;
SELECT    CASE      WHEN p.ClosedDate IS NULL THEN 'no'      ELSE 'yes'    END AS well_finished FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.UserId = 23853   AND c.CreationDate = '2013-07-12 09:08:18.0';
SELECT T1.Reputation FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T2.Id = 65041
SELECT COUNT(*)  FROM posts  WHERE OwnerDisplayName = 'Tiago Pasqualini';
SELECT u.DisplayName FROM votes v JOIN users u ON v.UserId = u.Id WHERE v.Id = 6347;
SELECT COUNT(*)  FROM votes v JOIN posts p ON v.PostId = p.Id WHERE p.Title LIKE '%data visualization%';
SELECT T1.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'DatEpicCoderGuyWhoPrograms'
SELECT    CAST(COUNT(DISTINCT p.Id) AS REAL) / (SELECT COUNT(Id) FROM votes WHERE UserId = 24) AS ratio FROM    posts p WHERE    p.OwnerUserId = 24;
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer';
SELECT Text FROM comments WHERE Score = 17;
SELECT DisplayName FROM users WHERE WebsiteUrl = 'http://stackoverflow.com'
SELECT T1.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'SilentGhost'
SELECT u.DisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Text = 'thank you user93!';
SELECT c.Text FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.DisplayName = 'A Lion.';
SELECT      u.DisplayName,     u.Reputation FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Understanding what Dassault iSight is doing?';
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'How does gentle boosting differ from AdaBoost?';
SELECT DISTINCT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Necromancer' LIMIT 10;
SELECT      u.DisplayName FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE p.Title = 'Open source tools for visualizing multi-dimensional data?';
SELECT DISTINCT p.Title FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Vebjorn Ljosa';
SELECT      SUM(p.Score) AS TotalScore,     u.WebsiteUrl FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Yevgeny';
SELECT DISTINCT c.* FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.LastEditorUserId IN (     SELECT u.Id     FROM users u     JOIN posts p2 ON u.Id = p2.LastEditorUserId     WHERE p2.Title = 'Why square the difference instead of taking the absolute value in standard deviation?' );
SELECT SUM(v.BountyAmount) FROM votes v JOIN posts p ON v.PostId = p.Id WHERE p.Title LIKE '%data%';
SELECT DISTINCT u.DisplayName FROM votes v JOIN posts p ON v.PostId = p.Id JOIN users u ON v.UserId = u.Id WHERE v.BountyAmount = 50   AND p.Title LIKE '%variance%';
SELECT      AVG(p.ViewCount) AS AverageViewCount,     p.Title,     c.Text AS Comment FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Tags LIKE '%<humor>%' GROUP BY p.Id, p.Title, c.Text;
SELECT COUNT(*)  FROM comments  WHERE UserId = 13;
SELECT Id FROM users ORDER BY Reputation DESC LIMIT 1;
SELECT Id FROM users ORDER BY Views ASC LIMIT 1;
SELECT COUNT(*)  FROM badges  WHERE Name = 'Supporter'    AND strftime('%Y', Date) = '2011';
SELECT COUNT(*)  FROM (     SELECT UserId      FROM badges      GROUP BY UserId      HAVING COUNT(Name) > 5 ) AS subquery;
SELECT COUNT(*) FROM (SELECT T1.UserId FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.Location = 'New York' AND T1.Name IN ('Teacher', 'Supporter') GROUP BY T1.UserId HAVING COUNT(DISTINCT T1.Name) = 2)
SELECT      u.DisplayName,     u.Reputation FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Id = 1;
SELECT ph.UserId FROM postHistory ph JOIN users u ON ph.UserId = u.Id WHERE u.Views >= 1000   AND ph.UserId NOT IN (     SELECT ph2.UserId     FROM postHistory ph2     GROUP BY ph2.UserId, ph2.PostId     HAVING COUNT(*) > 1   )
SELECT T1.Name FROM badges AS T1 INNER JOIN comments AS T2 ON T1.UserId = T2.UserId GROUP BY T1.UserId ORDER BY COUNT(T2.Id) DESC LIMIT 1
SELECT COUNT(*) FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'India'   AND b.Name = 'Teacher';
SELECT    (     (       SELECT COUNT(*)        FROM badges        WHERE Name = 'Student' AND strftime('%Y', Date) = '2010'     ) * 100.0 /      (       SELECT COUNT(*)        FROM badges        WHERE Name = 'Student'     )   ) -    (     (       SELECT COUNT(*)        FROM badges        WHERE Name = 'Student' AND strftime('%Y', Date) = '2011'     ) * 100.0 /      (       SELECT COUNT(*)        FROM badges        WHERE Name = 'Student'     )   ) AS percentage_difference
SELECT      ph.PostHistoryTypeId,     COUNT(DISTINCT c.UserId) AS UniqueUserCount FROM postHistory ph LEFT JOIN comments c ON ph.PostId = c.PostId WHERE ph.PostId = 3720 GROUP BY ph.PostHistoryTypeId;
SELECT      pl.PostId,     p.ViewCount FROM postLinks pl JOIN posts p ON pl.PostId = p.Id WHERE pl.RelatedPostId = 61217
SELECT p.Score, pl.LinkTypeId FROM postLinks pl JOIN posts p ON pl.PostId = p.Id WHERE pl.PostId = 395;
SELECT      p.Id AS PostId,     p.OwnerUserId AS UserId FROM      posts p WHERE      p.Score > 60;
SELECT SUM(FavoriteCount)  FROM posts  WHERE OwnerUserId = 686    AND strftime('%Y', CreaionDate) = '2011';
SELECT    CAST(SUM(UpVotes) AS REAL) / COUNT(Id) AS avg_up_votes,   CAST(SUM(Age) AS REAL) / COUNT(Id) AS avg_age FROM users WHERE Id IN (   SELECT OwnerUserId   FROM posts   GROUP BY OwnerUserId   HAVING COUNT(Id) > 10 );
SELECT COUNT(UserId)  FROM badges  WHERE Name = 'Announcer';
SELECT Name FROM badges WHERE Date = '2010-07-19 19:39:08.0'
SELECT COUNT(*)  FROM comments  WHERE Score > 60;
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:25:47.0';
SELECT COUNT(Id) FROM posts WHERE Score = 10
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (     SELECT MAX(Reputation)     FROM users );
SELECT T1.Reputation FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T2.Date = '2010-07-19 19:39:08.0'
SELECT T1.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'Pierre'
SELECT DISTINCT T1.Date FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.Location = 'Rochester, NY'
SELECT    CAST(SUM(CASE WHEN b.Name = 'Teacher' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(b.UserId) AS percentage FROM badges b;
SELECT    CAST(SUM(CASE WHEN T1.Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.Id) AS percentage FROM users AS T1 INNER JOIN badges AS T2   ON T1.Id = T2.UserId WHERE T2.Name = 'Organizer'
SELECT T1.Score FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T2.CreaionDate = '2010-07-19 19:19:56.0'
SELECT T1.Text FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T2.CreaionDate = '2010-07-19 19:37:33.0'
SELECT DISTINCT u.Age FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'Vienna, Austria';
SELECT COUNT(*) FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Supporter'   AND u.Age BETWEEN 19 AND 65;
SELECT      SUM(T1.Views)  FROM users AS T1 INNER JOIN badges AS T2      ON T1.Id = T2.UserId WHERE      T2.Date = '2010-07-19 19:39:08.0';
SELECT DISTINCT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MIN(Reputation) FROM users);
SELECT T1.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'Sharpie'
SELECT COUNT(*)  FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Supporter'    AND u.Age > 65;
SELECT DisplayName FROM users WHERE Id = 30;
SELECT COUNT(*)  FROM users  WHERE Location = 'New York';
SELECT COUNT(*)  FROM votes  WHERE YEAR(CreationDate) = 2010;
SELECT COUNT(*)  FROM users  WHERE Age BETWEEN 19 AND 65;
SELECT DisplayName FROM users WHERE Views = (SELECT MAX(Views) FROM users)
SELECT      CAST(COUNT(CASE WHEN YEAR(CreationDate) = 2010 THEN Id END) AS REAL) * 1.0 /      COUNT(CASE WHEN YEAR(CreationDate) = 2011 THEN Id END) AS ratio FROM votes;
SELECT DISTINCT t.TagName FROM tags t JOIN posts p ON t.ExcerptPostId = p.Id OR t.WikiPostId = p.Id JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'John Salvatier';
SELECT COUNT(*)  FROM posts  WHERE OwnerDisplayName = 'Daniel Vassallo';
SELECT COUNT(*)  FROM votes v JOIN users u ON v.UserId = u.Id WHERE u.DisplayName = 'Harlan';
SELECT p.Id FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'slashnick' ORDER BY p.AnswerCount DESC LIMIT 1;
SELECT      p.OwnerDisplayName,     SUM(p.ViewCount) AS TotalViewCount FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName IN ('Harvey Motulsky', 'Noah Snyder') GROUP BY p.OwnerDisplayName ORDER BY TotalViewCount DESC LIMIT 1;
SELECT COUNT(*)  FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Matt Parker'    AND p.Id > 4;
SELECT COUNT(*)  FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.DisplayName = 'Neil McGuigan'   AND c.Score < 60;
SELECT DISTINCT T1.Tags FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'Mark Meckes' AND T1.CommentCount = 0
SELECT DISTINCT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Organizer';
SELECT      CAST(COUNT(CASE WHEN t.TagName = 'r' THEN p.Id END) AS REAL) * 100 / COUNT(p.Id) AS percentage FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE p.OwnerDisplayName = 'Community';
SELECT    (SELECT SUM(ViewCount) FROM posts WHERE OwnerDisplayName = 'Mornington') -    (SELECT SUM(ViewCount) FROM posts WHERE OwnerDisplayName = 'Amos') AS difference
SELECT COUNT(*)  FROM badges  WHERE Name = 'Commentator'    AND strftime('%Y', Date) = '2014';
SELECT COUNT(*)  FROM posts  WHERE CreaionDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59';
SELECT DisplayName, Age FROM users WHERE Views = (SELECT MAX(Views) FROM users)
SELECT LastEditDate, LastEditorUserId FROM posts WHERE Title = 'Detecting a given face in a database of facial images';
SELECT COUNT(*)  FROM comments  WHERE UserId = 13    AND Score < 60;
SELECT DISTINCT     p.Title,     c.UserDisplayName FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.Score > 60;
SELECT DISTINCT T1.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.Location = 'North Pole' AND STRFTIME('%Y', T1.Date) = '2011'
SELECT DISTINCT   u.DisplayName,   u.WebsiteUrl FROM posts p JOIN users u   ON p.OwnerUserId = u.Id WHERE p.FavoriteCount > 150;
SELECT      COUNT(ph.Id) AS post_history_count,     p.LastEditDate FROM posts p LEFT JOIN postHistory ph ON p.Id = ph.PostId WHERE p.Title = 'What is the best introductory Bayesian statistics textbook?' GROUP BY p.Id, p.LastEditDate;
SELECT      u.LastAccessDate,     u.Location FROM users u INNER JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Outliers';
SELECT p2.Title FROM posts p1 JOIN postLinks pl ON p1.Id = pl.PostId JOIN posts p2 ON pl.RelatedPostId = p2.Id WHERE p1.Title = 'How to tell if something happened in a data set which monitors a value over time';
SELECT DISTINCT   p.Id,   b.Name FROM posts p JOIN badges b   ON p.OwnerUserId = b.UserId JOIN users u   ON p.OwnerUserId = u.Id WHERE   u.DisplayName = 'Samuel'   AND YEAR(p.CreaionDate) = 2013   AND YEAR(b.Date) = 2013;
SELECT OwnerDisplayName FROM posts ORDER BY ViewCount DESC LIMIT 1;
SELECT DISTINCT     u.DisplayName,     u.Location FROM tags AS t JOIN posts AS p ON t.ExcerptPostId = p.Id JOIN users AS u ON p.OwnerUserId = u.Id WHERE t.TagName = 'hypothesis-testing';
SELECT p.Title, pl.LinkTypeId FROM postLinks pl JOIN posts p ON pl.RelatedPostId = p.Id WHERE pl.PostId = (     SELECT Id     FROM posts     WHERE Title = 'What are principal component scores?' );
SELECT p2.OwnerDisplayName FROM posts p1 JOIN posts p2 ON p1.ParentId = p2.Id WHERE p1.ParentId IS NOT NULL ORDER BY p1.Score DESC LIMIT 1;
SELECT u.DisplayName, u.WebsiteUrl FROM votes v JOIN users u ON v.UserId = u.Id WHERE v.VoteTypeId = 8 ORDER BY v.BountyAmount DESC LIMIT 1;
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5;
SELECT COUNT(*)  FROM tags  WHERE Count BETWEEN 5000 AND 7000;
SELECT OwnerUserId FROM posts ORDER BY FavoriteCount DESC LIMIT 1;
SELECT Age  FROM users  WHERE Reputation = (SELECT MAX(Reputation) FROM users) LIMIT 1;
SELECT COUNT(*) FROM votes WHERE YEAR(CreationDate) = 2011   AND BountyAmount = 50;
SELECT Id FROM users WHERE Age = (SELECT MIN(Age) FROM users) LIMIT 1;
SELECT SUM(Score)  FROM posts  WHERE LasActivityDate LIKE '2010-07-19%';
SELECT CAST(COUNT(*) AS REAL) / 12 AS average_monthly_links FROM postLinks AS pl INNER JOIN posts AS p ON pl.PostId = p.Id WHERE YEAR(pl.CreationDate) = 2010   AND p.AnswerCount <= 2;
SELECT p.Id FROM posts p JOIN votes v ON p.Id = v.PostId WHERE v.UserId = 1465 ORDER BY p.FavoriteCount DESC LIMIT 1;
SELECT p.Title FROM postLinks pl JOIN posts p ON pl.PostId = p.Id ORDER BY pl.CreationDate ASC LIMIT 1;
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId GROUP BY u.Id, u.DisplayName ORDER BY COUNT(b.Name) DESC LIMIT 1;
SELECT MIN(T1.CreationDate) FROM votes AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'chl'
SELECT MIN(T1.CreaionDate) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.Age = (     SELECT MIN(Age)     FROM users )
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Autobiographer' ORDER BY b.Date ASC LIMIT 1;
SELECT COUNT(DISTINCT T1.Id) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.Location = 'United Kingdom'   AND T2.FavoriteCount >= 4;
SELECT AVG(T1.PostId) FROM votes AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.Age = (     SELECT MAX(Age)     FROM users )
SELECT DisplayName FROM users ORDER BY Reputation DESC LIMIT 1;
SELECT COUNT(*)  FROM users  WHERE Reputation > 2000    AND Views > 1000;
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65
SELECT COUNT(*)  FROM posts  WHERE OwnerDisplayName = 'Jay Stevens'    AND YEAR(CreaionDate) = 2010;
SELECT p.Id, p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky' ORDER BY p.ViewCount DESC LIMIT 1;
SELECT Id, Title FROM posts ORDER BY Score DESC LIMIT 1;
SELECT AVG(Score)  FROM posts  WHERE OwnerDisplayName = 'Stephen Turner';
SELECT DISTINCT T1.DisplayName FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T2.ViewCount > 20000   AND YEAR(T2.CreaionDate) = 2011
SELECT      p.Id,     u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE strftime('%Y', p.CreaionDate) = '2010' ORDER BY p.FavoriteCount DESC LIMIT 1;
SELECT    CAST(COUNT(CASE WHEN YEAR(p.CreaionDate) = 2011 AND u.Reputation > 1000 THEN p.Id END) AS REAL) * 100 / COUNT(p.Id) FROM posts p JOIN users u ON p.OwnerUserId = u.Id;
SELECT      CAST(COUNT(CASE WHEN Age BETWEEN 13 AND 18 THEN Id END) AS REAL) * 100 / COUNT(Id) AS percentage FROM      users;
SELECT      p.ViewCount,     u.DisplayName FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE p.Title = 'Computer Game Datasets';
SELECT COUNT(*)  FROM posts  WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts);
SELECT COUNT(*)  FROM comments  WHERE PostId = (     SELECT Id      FROM posts      ORDER BY Score DESC      LIMIT 1 );
SELECT COUNT(*)  FROM posts  WHERE ViewCount > 35000    AND CommentCount = 0;
SELECT      u.DisplayName,     u.Location FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE p.Id = 183;
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Emmett' ORDER BY b.Date DESC LIMIT 1;
SELECT COUNT(*)  FROM users  WHERE Age BETWEEN 19 AND 65    AND UpVotes > 5000;
SELECT      DATEDIFF(b.Date, u.CreationDate) AS days_to_get_badge FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Zolomon';
SELECT      COUNT(DISTINCT p.Id) AS NumberOfPosts,     COUNT(DISTINCT c.Id) AS NumberOfComments FROM users u LEFT JOIN posts p ON u.Id = p.OwnerUserId LEFT JOIN comments c ON u.Id = c.UserId WHERE u.CreationDate = (SELECT MAX(CreationDate) FROM users);
SELECT c.Text, c.UserDisplayName FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'Analysing wind data with R' ORDER BY c.CreationDate DESC LIMIT 10;
SELECT COUNT(*)  FROM badges  WHERE Name = 'Citizen Patrol';
SELECT COUNT(*)  FROM posts p JOIN tags t ON p.Tags LIKE '%' || t.TagName || '%' WHERE t.TagName = 'careers';
SELECT Reputation, Views FROM users WHERE DisplayName = 'Jarrod Dixon';
SELECT      (SELECT COUNT(*) FROM comments WHERE PostId = p.Id) AS comment_count,     (SELECT COUNT(*) FROM posts WHERE ParentId = p.Id) AS answer_count FROM posts p WHERE p.Title = 'Clustering 1D data';
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat';
SELECT COUNT(*)  FROM votes  WHERE BountyAmount >= 30;
SELECT      CAST(SUM(CASE WHEN p.Score > 50 THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) AS percentage FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.Reputation = (SELECT MAX(Reputation) FROM users)
SELECT COUNT(*)  FROM posts  WHERE Score < 20;
SELECT COUNT(*)  FROM tags  WHERE Id < 15    AND Count <= 20;
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample';
SELECT      u.Reputation,     u.UpVotes FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'fine, you win :)';
SELECT T1.Text FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T2.Title LIKE '%linear regression%'
SELECT T1.Text FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T2.ViewCount BETWEEN 100 AND 150 ORDER BY T1.Score DESC LIMIT 1
SELECT DISTINCT   T1.CreationDate,   T2.Age FROM comments AS T1 JOIN users AS T2   ON T1.UserId = T2.Id WHERE T1.Text LIKE '%http://%'
SELECT COUNT(*) FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.Score = 0   AND p.ViewCount < 5;
SELECT COUNT(*)  FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.CommentCount = 1    AND c.Score = 0;
SELECT COUNT(DISTINCT T1.UserId) FROM comments AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Score = 0   AND T2.Age = 40;
SELECT      p.Id AS PostId,     c.Text AS Comment FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Title = 'Group differences on a five point Likert item';
SELECT T1.UpVotes FROM users AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.UserId WHERE T2.Text = 'R is also lazy evaluated.'
SELECT c.Text FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky';
SELECT DISTINCT   T1.UserDisplayName FROM comments AS T1 JOIN users AS T2   ON T1.UserId = T2.Id WHERE   T1.Score BETWEEN 1 AND 5   AND T2.DownVotes = 0;
SELECT    CAST(COUNT(CASE WHEN T2.UpVotes = 0 THEN T1.UserId END) AS REAL) * 100 / COUNT(T1.UserId) FROM comments AS T1 INNER JOIN users AS T2   ON T1.UserId = T2.Id WHERE T1.Score BETWEEN 5 AND 10
SELECT T2.power_name FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id INNER JOIN superhero AS T3 ON T1.hero_id = T3.id WHERE T3.superhero_name = '3-D Man'
SELECT COUNT(*) FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Super Strength';
SELECT COUNT(*) FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Super Strength'   AND s.height_cm > 200;
SELECT T1.full_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id GROUP BY T1.full_name HAVING COUNT(T2.power_id) > 15
SELECT COUNT(*)  FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.colour = 'Blue';
SELECT c.colour FROM superhero s JOIN colour c ON s.skin_colour_id = c.id WHERE s.superhero_name = 'Apocalypse';
SELECT COUNT(*) FROM superhero s JOIN colour c ON s.eye_colour_id = c.id JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE c.colour = 'Blue'   AND sp.power_name = 'Agility';
SELECT DISTINCT s.superhero_name FROM superhero s JOIN colour c1 ON s.eye_colour_id = c1.id JOIN colour c2 ON s.hair_colour_id = c2.id WHERE c1.colour = 'Blue'   AND c2.colour = 'Blond';
SELECT COUNT(*)  FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics';
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics' ORDER BY T1.height_cm DESC
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name = 'Sauron';
SELECT      s.superhero_name,     c.colour AS eye_colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics' ORDER BY (     SELECT COUNT(s2.id)     FROM superhero s2     JOIN colour c2 ON s2.eye_colour_id = c2.id     WHERE c2.id = c.id ) DESC;
SELECT AVG(T1.height_cm) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics'
SELECT DISTINCT s.superhero_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE p.publisher_name = 'Marvel Comics'   AND sp.power_name = 'Super Strength';
SELECT COUNT(*)  FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'DC Comics';
SELECT DISTINCT p.publisher_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN publisher p ON s.publisher_id = p.id WHERE a.attribute_name = 'Speed' AND ha.attribute_value = (     SELECT MIN(ha2.attribute_value)     FROM hero_attribute ha2     JOIN attribute a2 ON ha2.attribute_id = a2.id     WHERE a2.attribute_name = 'Speed' );
SELECT COUNT(*)  FROM superhero s JOIN colour c ON s.eye_colour_id = c.id JOIN publisher p ON s.publisher_id = p.id WHERE c.colour = 'Gold'    AND p.publisher_name = 'Marvel Comics';
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name = 'Blue Beetle II';
SELECT COUNT(*)  FROM superhero s JOIN colour c ON s.hair_colour_id = c.id WHERE c.colour = 'Blond';
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Intelligence' ORDER BY T2.attribute_value ASC LIMIT 1;
SELECT T2.race FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.superhero_name = 'Copycat'
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Durability'   AND T2.attribute_value < 50;
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Death Touch'
SELECT COUNT(*) FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE g.gender = 'Female'   AND a.attribute_name = 'Strength'   AND ha.attribute_value = 100;
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id GROUP BY T1.superhero_name ORDER BY COUNT(T2.power_id) DESC LIMIT 1;
SELECT COUNT(*)  FROM superhero s JOIN race r ON s.race_id = r.id WHERE r.race = 'Vampire';
SELECT      CAST(SUM(CASE WHEN a.alignment = 'Bad' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(s.id) AS percentage_bad_alignment,     SUM(CASE WHEN a.alignment = 'Bad' AND p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS count_bad_marvel FROM superhero s LEFT JOIN alignment a ON s.alignment_id = a.id LEFT JOIN publisher p ON s.publisher_id = p.id;
SELECT      (SELECT COUNT(*)       FROM superhero s      JOIN publisher p ON s.publisher_id = p.id      WHERE p.publisher_name = 'Marvel Comics') -     (SELECT COUNT(*)       FROM superhero s      JOIN publisher p ON s.publisher_id = p.id      WHERE p.publisher_name = 'DC Comics') AS difference;
SELECT id FROM publisher WHERE publisher_name = 'Star Trek';
SELECT AVG(attribute_value)  FROM hero_attribute;
SELECT COUNT(*)  FROM superhero  WHERE full_name IS NULL;
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.id = 75;
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.superhero_name = 'Deathlok'
SELECT AVG(T1.weight_kg) FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T2.gender = 'Female'
SELECT DISTINCT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id JOIN superhero s ON hp.hero_id = s.id JOIN gender g ON s.gender_id = g.id WHERE g.gender = 'Male' LIMIT 5;
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Alien'
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.height_cm BETWEEN 170 AND 190 AND T2.colour = 'No Colour'
SELECT T2.power_name FROM hero_power AS T1 JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T1.hero_id = 56;
SELECT DISTINCT T1.full_name FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Demi-God' LIMIT 5
SELECT COUNT(*)  FROM superhero s JOIN alignment a ON s.alignment_id = a.id WHERE a.alignment = 'Bad';
SELECT T2.race FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.weight_kg = 169;
SELECT T3.colour FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id INNER JOIN colour AS T3 ON T1.hair_colour_id = T3.id WHERE T2.race = 'Human'   AND T1.height_cm = 185;
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id ORDER BY T1.weight_kg DESC LIMIT 1;
SELECT      CAST(SUM(CASE WHEN p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS percentage FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.height_cm BETWEEN 150 AND 180;
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T2.gender = 'Male' AND T1.weight_kg > (     SELECT AVG(weight_kg) * 0.79     FROM superhero )
SELECT      sp.power_name FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id GROUP BY sp.power_name ORDER BY COUNT(sp.power_name) DESC LIMIT 1;
SELECT ha.attribute_value FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = 'Abomination';
SELECT T2.power_name FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T1.hero_id = 1;
SELECT COUNT(*) FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Stealth';
SELECT T1.full_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Strength' ORDER BY T2.attribute_value DESC LIMIT 1;
SELECT    CAST(COUNT(T1.id) AS REAL) / SUM(CASE WHEN T1.skin_colour_id = 1 THEN 1 ELSE 0 END) AS average FROM superhero AS T1
SELECT COUNT(*)  FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Dark Horse Comics';
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id INNER JOIN publisher AS T4 ON T1.publisher_id = T4.id WHERE T3.attribute_name = 'Durability'   AND T4.publisher_name = 'Dark Horse Comics' ORDER BY T2.attribute_value DESC LIMIT 1;
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.full_name = 'Abraham Sapien';
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Flight'
SELECT      c1.colour AS eye_colour,     c2.colour AS hair_colour,     c3.colour AS skin_colour FROM superhero s JOIN colour c1 ON s.eye_colour_id = c1.id JOIN colour c2 ON s.hair_colour_id = c2.id JOIN colour c3 ON s.skin_colour_id = c3.id JOIN gender g ON s.gender_id = g.id JOIN publisher p ON s.publisher_id = p.id WHERE g.gender = 'Female'   AND p.publisher_name = 'Dark Horse Comics';
SELECT T1.superhero_name, T2.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.hair_colour_id = T1.skin_colour_id   AND T1.hair_colour_id = T1.eye_colour_id;
SELECT r.race FROM superhero s JOIN race r ON s.race_id = r.id WHERE s.superhero_name = 'A-Bomb';
SELECT      CAST(SUM(CASE WHEN c.colour = 'Blue' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS percentage FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN colour c ON s.skin_colour_id = c.id WHERE g.gender = 'Female';
SELECT T1.superhero_name, T2.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.full_name = 'Charles Chandler'
SELECT T2.gender FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T1.superhero_name = 'Agent 13';
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Adaptation';
SELECT COUNT(*)  FROM hero_power hp JOIN superhero s ON hp.hero_id = s.id WHERE s.superhero_name = 'Amazo';
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id JOIN superhero s ON hp.hero_id = s.id WHERE s.full_name = 'Hunter Zolomon';
SELECT T1.height_cm FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Amber'
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id INNER JOIN colour AS T3 ON T1.hair_colour_id = T3.id WHERE T2.colour = 'Black' AND T3.colour = 'Black'
SELECT DISTINCT c1.colour FROM superhero s JOIN colour c1 ON s.eye_colour_id = c1.id JOIN colour c2 ON s.skin_colour_id = c2.id WHERE c2.colour = 'Gold';
SELECT s.full_name FROM superhero s JOIN race r ON s.race_id = r.id WHERE r.race = 'Vampire';
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T2.alignment = 'Neutral'
SELECT COUNT(*)  FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Strength'   AND ha.attribute_value = (     SELECT MAX(attribute_value)      FROM hero_attribute      WHERE attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Strength')   );
SELECT      r.race,     a.alignment FROM superhero s JOIN race r ON s.race_id = r.id JOIN alignment a ON s.alignment_id = a.id WHERE s.superhero_name = 'Cameron Hicks';
SELECT      CAST(SUM(CASE WHEN g.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics';
SELECT AVG(T1.weight_kg) FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Alien'
SELECT      (SELECT SUM(weight_kg) FROM superhero WHERE full_name = 'Emil Blonsky') -      (SELECT SUM(weight_kg) FROM superhero WHERE full_name = 'Charles Chandler') AS difference
SELECT      s.superhero_name,     AVG(s.height_cm) AS average_height FROM superhero s GROUP BY s.superhero_name;
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.superhero_name = 'Abomination'
SELECT COUNT(*)  FROM superhero s JOIN gender g ON s.gender_id = g.id WHERE s.race_id = 21    AND g.id = 1;
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Speed' ORDER BY T2.attribute_value DESC LIMIT 1;
SELECT COUNT(*)  FROM superhero  WHERE alignment_id = 3;
SELECT      a.attribute_name,     ha.attribute_value FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id JOIN attribute a ON ha.attribute_id = a.id WHERE s.superhero_name = '3-D Man';
SELECT T1.superhero_name FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id JOIN colour AS T3 ON T1.hair_colour_id = T3.id WHERE T2.colour = 'Blue'   AND T3.colour = 'Brown';
SELECT DISTINCT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy');
SELECT COUNT(*)  FROM superhero  WHERE publisher_id = 1;
SELECT    CAST(SUM(CASE WHEN c.colour = 'Blue' THEN 1 ELSE 0 END) AS FLOAT) * 100.0 / COUNT(s.superhero_name) AS percentage FROM superhero s JOIN colour c ON s.eye_colour_id = c.id;
SELECT      CAST(SUM(CASE WHEN g.gender = 'Male' THEN 1 ELSE 0 END) AS REAL) * 1.0 /      SUM(CASE WHEN g.gender = 'Female' THEN 1 ELSE 0 END) AS ratio FROM superhero s JOIN gender g ON s.gender_id = g.id;
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1;
SELECT id FROM superpower WHERE power_name = 'Cryokinesis';
SELECT superhero_name FROM superhero WHERE id = 294;
SELECT full_name FROM superhero WHERE weight_kg = 0 OR weight_kg IS NULL;
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.full_name = 'Karen Beecher-Duncan';
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.full_name = 'Helen Parr'
SELECT T2.race FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.weight_kg = 108   AND T1.height_cm = 188;
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.id = 38;
SELECT T3.race FROM hero_attribute AS T1 INNER JOIN superhero AS T2 ON T1.hero_id = T2.id INNER JOIN race AS T3 ON T2.race_id = T3.id ORDER BY T1.attribute_value DESC LIMIT 1;
SELECT      a.alignment,     sp.power_name FROM superhero s JOIN alignment a ON s.alignment_id = a.id JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Atom IV';
SELECT DISTINCT T1.full_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Blue' LIMIT 5
SELECT AVG(T1.attribute_value)  FROM hero_attribute AS T1 INNER JOIN superhero AS T2 ON T1.hero_id = T2.id WHERE T2.alignment_id = 3
SELECT DISTINCT c.colour FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN colour c ON s.skin_colour_id = c.id WHERE ha.attribute_value = 100;
SELECT COUNT(*)  FROM superhero s JOIN alignment a ON s.alignment_id = a.id JOIN gender g ON s.gender_id = g.id WHERE a.alignment = 'Good'    AND g.gender = 'Female';
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T2.attribute_value BETWEEN 75 AND 80
SELECT DISTINCT r.race FROM superhero s JOIN race r ON s.race_id = r.id JOIN gender g ON s.gender_id = g.id JOIN colour c ON s.hair_colour_id = c.id WHERE c.colour = 'Blue'   AND g.gender = 'Male';
SELECT      CAST(SUM(CASE WHEN g.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(*) AS percentage FROM superhero s JOIN alignment a ON s.alignment_id = a.id JOIN gender g ON s.gender_id = g.id WHERE a.alignment = 'Bad';
SELECT    SUM(CASE WHEN T1.eye_colour_id = 7 THEN 1 ELSE 0 END) -    SUM(CASE WHEN T1.eye_colour_id = 1 THEN 1 ELSE 0 END) AS difference FROM superhero T1 WHERE T1.weight_kg = 0 OR T1.weight_kg IS NULL;
SELECT T3.attribute_value FROM hero_attribute AS T3 INNER JOIN attribute AS T1 ON T3.attribute_id = T1.id INNER JOIN superhero AS T2 ON T3.hero_id = T2.id WHERE T1.attribute_name = 'Strength'   AND T2.superhero_name = 'Hulk';
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.superhero_name = 'Ajax'
SELECT COUNT(*)  FROM superhero s JOIN colour c ON s.skin_colour_id = c.id JOIN alignment a ON s.alignment_id = a.id WHERE c.colour = 'Green'    AND a.alignment = 'Bad';
SELECT COUNT(*)  FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN publisher p ON s.publisher_id = p.id WHERE g.gender = 'Female'    AND p.publisher_name = 'Marvel Comics';
SELECT DISTINCT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Wind Control' ORDER BY s.superhero_name;
SELECT DISTINCT g.gender FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id JOIN gender g ON s.gender_id = g.id WHERE sp.power_name = 'Phoenix Force';
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'DC Comics' ORDER BY T1.weight_kg DESC LIMIT 1;
SELECT AVG(T1.height_cm) FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id INNER JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T2.race <> 'Human'   AND T3.publisher_name = 'Dark Horse Comics';
SELECT COUNT(*) FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed'   AND ha.attribute_value = 100;
SELECT      SUM(CASE WHEN p.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) -      SUM(CASE WHEN p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS difference FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name IN ('DC Comics', 'Marvel Comics');
SELECT T2.attribute_name FROM hero_attribute AS T1 INNER JOIN attribute AS T2 ON T1.attribute_id = T2.id INNER JOIN superhero AS T3 ON T1.hero_id = T3.id WHERE T3.superhero_name = 'Black Panther' ORDER BY T1.attribute_value ASC LIMIT 1;
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.superhero_name = 'Abomination';
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1;
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler';
SELECT      CAST(SUM(CASE WHEN g.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(*) AS percentage FROM superhero s JOIN publisher p ON s.publisher_id = p.id JOIN gender g ON s.gender_id = g.id WHERE p.publisher_name = 'George Lucas';
SELECT      CAST(SUM(CASE WHEN a.alignment = 'Good' THEN 1 ELSE 0 END) AS FLOAT) * 100.0 / COUNT(*) AS percentage FROM superhero s JOIN publisher p ON s.publisher_id = p.id JOIN alignment a ON s.alignment_id = a.id WHERE p.publisher_name = 'Marvel Comics';
SELECT COUNT(*)  FROM superhero  WHERE full_name LIKE 'John%';
SELECT hero_id FROM hero_attribute ORDER BY attribute_value ASC LIMIT 1;
SELECT T1.full_name FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Alien'
SELECT T1.full_name FROM superhero AS T1 WHERE T1.weight_kg < 100   AND T1.eye_colour_id = (     SELECT id     FROM colour     WHERE colour = 'Brown'   );
SELECT ha.attribute_value FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = 'Aquababy';
SELECT      s.weight_kg,     r.race FROM superhero s JOIN race r ON s.race_id = r.id WHERE s.id = 40;
SELECT AVG(T1.height_cm) FROM superhero AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T2.alignment = 'Neutral'
SELECT T1.hero_id FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T2.power_name = 'Intelligence'
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.superhero_name = 'Blackwulf';
SELECT DISTINCT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id JOIN superhero s ON hp.hero_id = s.id WHERE s.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero);
SELECT DISTINCT     T1.driverRef FROM drivers AS T1 INNER JOIN qualifying AS T2     ON T1.driverId = T2.driverId WHERE     T2.raceId = 20     AND T2.q1 IN (         SELECT q1         FROM qualifying         WHERE raceId = 20         ORDER BY q1 DESC         LIMIT 5     )
SELECT T1.surname FROM drivers AS T1 INNER JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 19 ORDER BY T2.q2 ASC LIMIT 1;
SELECT DISTINCT T1.year FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.location = 'Shanghai'
SELECT DISTINCT T1.url FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Circuit de Barcelona-Catalunya'
SELECT DISTINCT T1.name FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.country = 'Germany'
SELECT DISTINCT T1.position FROM constructorStandings AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T2.name = 'Renault'
SELECT COUNT(*)  FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year = 2010   AND c.country NOT IN ('Japan', 'China', 'India', 'Malaysia', 'Singapore', 'Bahrain', 'Abu Dhabi', 'Qatar', 'UAE', 'Korea', 'Thailand', 'Vietnam', 'Indonesia', 'Philippines', 'Australia', 'New Zealand', 'South Africa', 'Morocco', 'Tunisia', 'Egypt', 'Israel', 'Turkey', 'Greece', 'Italy', 'Spain', 'Portugal', 'France', 'Germany', 'Austria', 'Switzerland', 'Belgium', 'Netherlands', 'Luxembourg', 'Monaco', 'San Marino', 'Andorra', 'Liechtenstein', 'Iceland', 'Norway', 'Sweden', 'Finland', 'Denmark', 'Estonia', 'Latvia', 'Lithuania', 'Poland', 'Czech Republic', 'Slovakia', 'Hungary', 'Romania', 'Bulgaria', 'Serbia', 'Croatia', 'Bosnia and Herzegovina', 'Montenegro', 'Albania', 'Macedonia', 'Slovenia', 'Ukraine', 'Belarus', 'Moldova', 'Russia', 'Armenia', 'Azerbaijan', 'Georgia', 'Cyprus', 'Lebanon', 'Syria', 'Iraq', 'Jordan', 'Saudi Arabia', 'Yemen', 'Oman', 'Kuwait', 'Qatar', 'Bahrain', 'United Arab Emirates', 'Iran', 'Pakistan', 'Afghanistan', 'Nepal', 'Bangladesh', 'Sri Lanka', 'Myanmar', 'Cambodia', 'Laos', 'Brunei', 'East Timor', 'Papua New Guinea', 'Fiji', 'Samoa', 'Tonga', 'Vanuatu', 'Solomon Islands', 'Kiribati', 'Marshall Islands', 'Palau', 'Nauru', 'Tuvalu');
SELECT DISTINCT T1.name FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.country = 'Spain'
SELECT DISTINCT   T1.lat,   T1.lng FROM circuits AS T1 JOIN races AS T2   ON T1.circuitId = T2.circuitId WHERE   T2.name = 'Australian Grand Prix';
SELECT T1.url FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Sepang International Circuit'
SELECT T1.time FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Sepang International Circuit'
SELECT T1.lat, T1.lng FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Abu Dhabi Grand Prix'
SELECT DISTINCT     T4.country FROM     constructorResults AS T1 JOIN     constructors AS T2 ON     T1.constructorId = T2.constructorId JOIN     races AS T3 ON     T1.raceId = T3.raceId JOIN     circuits AS T4 ON     T3.circuitId = T4.circuitId WHERE     T1.points = 1   AND T1.raceId = 24
SELECT T1.q1 FROM qualifying AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 354 AND T2.forename = 'Bruno' AND T2.surname = 'Senna'
SELECT DISTINCT   d.nationality FROM qualifying AS q JOIN drivers AS d   ON q.driverId = d.driverId WHERE q.raceId = 355   AND q.q2 = '0:01:40';
SELECT T1.number FROM drivers AS T1 INNER JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 903 AND T2.q3 LIKE '1:54%'
SELECT COUNT(*)  FROM results r JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Bahrain Grand Prix'   AND ra.year = 2007   AND r.time IS NULL;
SELECT s.url FROM seasons s JOIN races r ON s.year = r.year WHERE r.raceId = 901;
SELECT COUNT(T1.driverId) AS num_drivers FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.date = '2015-11-29' AND T1.time IS NOT NULL
SELECT      T1.dob FROM      drivers AS T1     INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE      T2.raceId = 592     AND T2.time IS NOT NULL ORDER BY      T1.dob ASC LIMIT 1;
SELECT      d.url FROM      lapTimes lt JOIN      drivers d ON lt.driverId = d.driverId WHERE      lt.raceId = 161     AND lt.time LIKE '1:27%';
SELECT DISTINCT d.nationality FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE r.raceId = 933 AND r.fastestLapSpeed = (     SELECT MAX(fastestLapSpeed)     FROM results     WHERE raceId = 933 );
SELECT DISTINCT   T1.lat,   T1.lng FROM circuits AS T1 INNER JOIN races AS T2   ON T1.circuitId = T2.circuitId WHERE   T2.name = 'Malaysian Grand Prix'
SELECT T3.url FROM constructorResults AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN constructors AS T3 ON T1.constructorId = T3.constructorId WHERE T2.raceId = 9 ORDER BY T1.points DESC LIMIT 1;
SELECT T1.q1 FROM qualifying AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 345 AND T2.forename = 'Lucas' AND T2.surname = 'di Grassi'
SELECT DISTINCT     d.nationality FROM qualifying AS q JOIN drivers AS d     ON q.driverId = d.driverId WHERE q.raceId = 347   AND q.q2 = '0:01:15';
SELECT T1.code FROM drivers AS T1 INNER JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 45 AND T2.q3 LIKE '1:33%'
SELECT T1.time FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Bruce'   AND T2.surname = 'McLaren'   AND T1.raceId = 743
SELECT T1.forename, T1.surname FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T3.name = 'San Marino Grand Prix'   AND T3.year = 2006   AND T2.position = 2
SELECT T1.url FROM seasons AS T1 INNER JOIN races AS T2 ON T1.year = T2.year WHERE T2.raceId = 901
SELECT COUNT(T1.driverId) AS num_drivers FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.date = '2015-11-29' AND T1.time IS NOT NULL
SELECT      d.forename,     d.surname FROM      results r JOIN      drivers d ON r.driverId = d.driverId WHERE      r.raceId = 872     AND r.time IS NOT NULL ORDER BY      d.dob DESC LIMIT 1;
SELECT      d.forename,     d.surname FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId WHERE lt.raceId = 348 ORDER BY lt.milliseconds ASC LIMIT 1;
SELECT DISTINCT d.nationality FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.fastestLapSpeed = (     SELECT MAX(fastestLapSpeed)     FROM results     WHERE fastestLapSpeed IS NOT NULL );
SELECT    CAST(     (       SELECT T1.fastestLapSpeed        FROM results AS T1        INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId        WHERE T2.forename = 'Paul'          AND T2.surname = 'di Resta'          AND T1.raceId = 853     ) -      (       SELECT T1.fastestLapSpeed        FROM results AS T1        INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId        WHERE T2.forename = 'Paul'          AND T2.surname = 'di Resta'          AND T1.raceId = 854     ) * 100.0 /      (       SELECT T1.fastestLapSpeed        FROM results AS T1        INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId        WHERE T2.forename = 'Paul'          AND T2.surname = 'di Resta'          AND T1.raceId = 853     ) AS percentage
SELECT    CAST(COUNT(CASE WHEN T1.time IS NOT NULL THEN T1.driverId END) AS REAL) * 100 / COUNT(T1.driverId) AS race_completion_rate FROM results AS T1 INNER JOIN races AS T2   ON T1.raceId = T2.raceId WHERE T2.date = '1983-07-16';
SELECT MIN(T1.year) FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Singapore Grand Prix'
SELECT name FROM races WHERE year = 2005 ORDER BY name DESC;
SELECT DISTINCT T1.name FROM races AS T1 WHERE T1.year = (     SELECT MIN(strftime('%Y', date))     FROM races ) AND strftime('%m', T1.date) = (     SELECT strftime('%m', MIN(date))     FROM races )
SELECT T1.name, T1.date FROM races AS T1 WHERE T1.year = 1999 ORDER BY T1.round DESC LIMIT 1
SELECT year FROM races GROUP BY year ORDER BY COUNT(raceId) DESC LIMIT 1;
SELECT T1.name FROM races AS T1 WHERE T1.year = 2017   AND T1.circuitId NOT IN (     SELECT T2.circuitId     FROM races AS T2     WHERE T2.year = 2000   );
SELECT DISTINCT   T1.country,   T1.name,   T1.location FROM circuits AS T1 INNER JOIN races AS T2   ON T1.circuitId = T2.circuitId WHERE T2.name = 'European Grand Prix' ORDER BY T2.year ASC LIMIT 1;
SELECT MAX(T1.year) FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Brands Hatch'   AND T1.name = 'British Grand Prix'
SELECT COUNT(DISTINCT T1.year) FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Silverstone Circuit'   AND T1.name = 'British Grand Prix'
SELECT DISTINCT     d.forename,     d.surname FROM driverStandings AS ds JOIN drivers AS d ON ds.driverId = d.driverId JOIN races AS r ON ds.raceId = r.raceId WHERE r.year = 2010   AND r.name = 'Singapore Grand Prix' ORDER BY ds.position;
SELECT      d.forename,     d.surname,     ds.points FROM driverStandings ds JOIN drivers d ON ds.driverId = d.driverId ORDER BY ds.points DESC LIMIT 1;
SELECT      d.forename,     d.surname,     r.points FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2017    AND ra.name = 'Chinese Grand Prix' ORDER BY r.points DESC LIMIT 3;
SELECT      d.forename,     d.surname,     r.name FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId JOIN races r ON lt.raceId = r.raceId WHERE lt.milliseconds = (     SELECT MIN(milliseconds)     FROM lapTimes     WHERE milliseconds IS NOT NULL );
SELECT      AVG(lt.milliseconds) AS average_lap_time FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId JOIN races r ON lt.raceId = r.raceId WHERE d.forename = 'Lewis'    AND d.surname = 'Hamilton'   AND r.name = 'Malaysian Grand Prix'   AND r.year = 2009;
SELECT    CAST(COUNT(CASE WHEN T1.surname = 'Hamilton' AND T3.position > 1 THEN T3.raceId END) AS REAL) * 100 /    COUNT(CASE WHEN T1.surname = 'Hamilton' THEN T3.raceId END) FROM drivers T1 INNER JOIN results T3 ON T1.driverId = T3.driverId INNER JOIN races T4 ON T3.raceId = T4.raceId WHERE T4.year >= 2010
SELECT      d.forename,     d.surname,     d.nationality,     MAX(ds.points) AS max_points FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId GROUP BY d.driverId ORDER BY SUM(ds.wins) DESC LIMIT 1;
SELECT      YEAR(CURRENT_TIMESTAMP) - YEAR(T1.dob) AS age,     T1.forename,     T1.surname FROM drivers T1 WHERE T1.nationality = 'Japanese' ORDER BY T1.dob DESC LIMIT 1;
SELECT T1.name FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.year BETWEEN 1990 AND 2000 GROUP BY T1.circuitId HAVING COUNT(T2.raceId) = 4
SELECT DISTINCT     c.name AS circuit_name,     c.location,     r.name AS race_name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE c.country = 'USA'   AND r.year = 2006;
SELECT DISTINCT     T1.name,     T2.name,     T2.location FROM races AS T1 JOIN circuits AS T2     ON T1.circuitId = T2.circuitId WHERE     MONTH(T1.date) = 9     AND YEAR(T1.date) = 2005;
SELECT DISTINCT T1.name FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T3.forename = 'Alex'   AND T3.surname = 'Yoong'   AND T2.position < 20
SELECT COUNT(*)  FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId JOIN circuits c ON ra.circuitId = c.circuitId WHERE d.forename = 'Michael'    AND d.surname = 'Schumacher'   AND c.name = 'Sepang International Circuit'   AND r.points = (     SELECT MAX(r2.points)      FROM results r2      WHERE r2.raceId = r.raceId   );
SELECT      T1.name AS race,     T1.year AS year FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T2.driverId = T3.driverId INNER JOIN lapTimes AS T4 ON T2.raceId = T4.raceId AND T2.driverId = T4.driverId WHERE      T3.forename = 'Michael'      AND T3.surname = 'Schumacher' ORDER BY      T4.milliseconds ASC LIMIT 1;
SELECT AVG(T1.points)  FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T1.raceId = T3.raceId WHERE T2.forename = 'Eddie'    AND T2.surname = 'Irvine'    AND T3.year = 2000
SELECT      T1.year,     T3.points FROM seasons AS T1 INNER JOIN races AS T2 ON T1.year = T2.year INNER JOIN results AS T3 ON T2.raceId = T3.raceId INNER JOIN drivers AS T4 ON T3.driverId = T4.driverId WHERE T4.forename = 'Lewis'    AND T4.surname = 'Hamilton' ORDER BY T1.year ASC LIMIT 1;
SELECT      r.name AS race_name,     c.country FROM      races r JOIN      circuits c ON r.circuitId = c.circuitId WHERE      r.year = 2017 ORDER BY      r.date;
SELECT      T2.name AS race_name,     T2.year,     T3.location AS circuit_location FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN circuits AS T3 ON T2.circuitId = T3.circuitId WHERE T1.laps = (     SELECT MAX(laps)     FROM results ) LIMIT 1;
SELECT    CAST(SUM(CASE WHEN T2.country = 'Germany' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM races AS T1 INNER JOIN circuits AS T2    ON T1.circuitId = T2.circuitId WHERE T1.name = 'European Grand Prix'
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit'
SELECT name FROM circuits WHERE name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring') ORDER BY lat DESC LIMIT 1;
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit';
SELECT country FROM circuits ORDER BY alt DESC LIMIT 1;
SELECT COUNT(*) FROM drivers WHERE code IS NULL;
SELECT T1.nationality FROM drivers AS T1 ORDER BY T1.dob ASC LIMIT 1
SELECT surname FROM drivers WHERE nationality = 'Italian';
SELECT url  FROM drivers  WHERE forename = 'Anthony' AND surname = 'Davidson';
SELECT driverRef FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton';
SELECT T1.name FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.year = 2009   AND T2.name = 'Spanish Grand Prix'
SELECT DISTINCT T1.year FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Silverstone Circuit'
SELECT T1.url FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Silverstone Circuit'
SELECT T1.time FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.year = 2010   AND T2.name = 'Abu Dhabi Circuit'
SELECT COUNT(*)  FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.country = 'Italy';
SELECT DISTINCT     T1.date FROM races AS T1 INNER JOIN circuits AS T2     ON T1.circuitId = T2.circuitId WHERE     T2.name = 'Circuit de Barcelona-Catalunya'
SELECT DISTINCT c.url FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.name = 'Spanish Grand Prix'   AND r.year = 2009;
SELECT MIN(T1.fastestLapTime) FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Lewis'   AND T2.surname = 'Hamilton'
SELECT DISTINCT     T1.forename,     T1.surname FROM drivers AS T1 JOIN results AS T2     ON T1.driverId = T2.driverId ORDER BY     T2.fastestLapSpeed DESC LIMIT 1;
SELECT T1.driverRef FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T3.name = 'Canadian Grand Prix'   AND T3.year = 2007   AND T2.position = 1
SELECT DISTINCT T1.name FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T3.forename = 'Lewis' AND T3.surname = 'Hamilton'
SELECT      T1.name FROM      races AS T1 JOIN      results AS T2 ON T1.raceId = T2.raceId JOIN      drivers AS T3 ON T2.driverId = T3.driverId WHERE      T3.forename = 'Lewis'      AND T3.surname = 'Hamilton' ORDER BY      T2.rank ASC LIMIT 1;
SELECT MAX(T1.fastestLapSpeed) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Spanish Grand Prix' AND T2.year = 2009
SELECT DISTINCT T1.year FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T3.forename = 'Lewis' AND T3.surname = 'Hamilton'
SELECT T1.positionOrder FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T1.raceId = T3.raceId WHERE T2.forename = 'Lewis'   AND T2.surname = 'Hamilton'   AND T3.name = 'Chinese Grand Prix'   AND T3.year = 2008
SELECT DISTINCT     T1.forename,     T1.surname FROM drivers AS T1 JOIN results AS T2     ON T1.driverId = T2.driverId JOIN races AS T3     ON T2.raceId = T3.raceId JOIN circuits AS T4     ON T3.circuitId = T4.circuitId WHERE     T3.year = 1989     AND T3.name = 'Australian Grand Prix'     AND T2.grid = 4
SELECT COUNT(T1.driverId) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.year = 2008   AND T2.name = 'Australian Grand Prix'   AND T1.time IS NOT NULL
SELECT      T1.fastestLapTime FROM      results AS T1 INNER JOIN      races AS T2 ON T1.raceId = T2.raceId INNER JOIN      drivers AS T3 ON T1.driverId = T3.driverId WHERE      T2.name = 'Australian Grand Prix'     AND T2.year = 2008     AND T3.forename = 'Lewis'     AND T3.surname = 'Hamilton'
SELECT T1.time FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.year = 2008   AND T2.name = 'Chinese Grand Prix'   AND T1.position = 2
SELECT      d.forename,     d.surname,     d.url FROM results r JOIN races ra ON r.raceId = ra.raceId JOIN drivers d ON r.driverId = d.driverId WHERE ra.year = 2008   AND ra.name = 'Australian Grand Prix'   AND r.position = 1   AND r.time IS NOT NULL   AND r.time != ''   AND r.time LIKE '__:__:__.___';
SELECT COUNT(T1.driverId) FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T1.nationality = 'British'   AND T3.year = 2008   AND T3.name = 'Australian Grand Prix';
SELECT COUNT(DISTINCT T1.driverId) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Chinese Grand Prix'   AND T2.year = 2008   AND T1.time IS NOT NULL   AND T1.driverId IN (     SELECT driverId     FROM results     GROUP BY driverId     HAVING COUNT(raceId) > 0   );
SELECT      SUM(T1.points) AS total_points FROM      results AS T1 INNER JOIN      drivers AS T2  ON      T1.driverId = T2.driverId WHERE      T2.forename = 'Lewis'      AND T2.surname = 'Hamilton'
SELECT      AVG(         CAST(SUBSTR(r.fastestLapTime, 1, INSTR(r.fastestLapTime, ':') - 1) AS INTEGER) * 60 +          CAST(SUBSTR(r.fastestLapTime, INSTR(r.fastestLapTime, ':') + 1) AS REAL)     ) AS average_fastest_lap_time_seconds FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.forename = 'Lewis'    AND d.surname = 'Hamilton'   AND r.fastestLapTime IS NOT NULL;
SELECT    CAST(COUNT(CASE WHEN T1.time IS NOT NULL THEN T1.raceId END) AS REAL) * 100 / COUNT(T1.raceId) AS rate FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.year = 2008    AND T2.name = 'Australian Grand Prix';
SELECT    CAST(     (       (         (           CAST(SUBSTR(T2.time, 1, 2) AS INTEGER) * 3600 +           CAST(SUBSTR(T2.time, 4, 2) AS INTEGER) * 60 +           CAST(SUBSTR(T2.time, 7, 2) AS INTEGER) +           CAST(SUBSTR(T2.time, 10, 3) AS REAL) / 1000         ) -         (           CAST(SUBSTR(T1.time, 1, 2) AS INTEGER) * 3600 +           CAST(SUBSTR(T1.time, 4, 2) AS INTEGER) * 60 +           CAST(SUBSTR(T1.time, 7, 2) AS INTEGER) +           CAST(SUBSTR(T1.time, 10, 3) AS REAL) / 1000         )       ) /       (         CAST(SUBSTR(T2.time, 1, 2) AS INTEGER) * 3600 +         CAST(SUBSTR(T2.time, 4, 2) AS INTEGER) * 60 +         CAST(SUBSTR(T2.time, 7, 2) AS INTEGER) +         CAST(SUBSTR(T2.time, 10, 3) AS REAL) / 1000       )     ) * 100   AS REAL) AS percentage_faster FROM results T1 INNER JOIN races R ON T1.raceId = R.raceId INNER JOIN results T2 ON T1.raceId = T2.raceId WHERE R.year = 2008   AND R.name = 'Australian Grand Prix'   AND T1.position = 1   AND T1.time IS NOT NULL   AND T2.position = (     SELECT MAX(position)     FROM results     WHERE raceId = R.raceId       AND time IS NOT NULL   )   AND T2.time IS NOT NULL;
SELECT COUNT(*)  FROM circuits  WHERE location = 'Adelaide' AND country = 'Australia';
SELECT      lat,     lng FROM      circuits WHERE      country = 'USA';
SELECT COUNT(*)  FROM drivers  WHERE nationality = 'British'    AND dob > '1980-01-01';
SELECT MAX(cr.points) FROM constructorResults AS cr JOIN constructors AS c ON cr.constructorId = c.constructorId WHERE c.nationality = 'British';
SELECT      c.name FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId ORDER BY cr.points DESC LIMIT 1;
SELECT DISTINCT     c.name FROM constructorResults AS cr JOIN constructors AS c     ON cr.constructorId = c.constructorId WHERE cr.raceId = 291   AND cr.points = 0;
SELECT COUNT(*)  FROM constructorResults AS cr JOIN constructors AS c ON cr.constructorId = c.constructorId WHERE c.nationality = 'Japanese'   AND cr.points = 0 GROUP BY cr.constructorId HAVING COUNT(cr.raceId) = 2;
SELECT DISTINCT   c.name FROM constructorStandings cs JOIN constructors c ON cs.constructorId = c.constructorId WHERE cs.position = 1
SELECT COUNT(*) FROM constructors AS c JOIN results AS r ON c.constructorId = r.constructorId WHERE c.nationality = 'France'   AND r.laps > 50;
SELECT    CAST(SUM(CASE WHEN T1.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.driverId) AS completion_percentage FROM results T1 INNER JOIN drivers T2 ON T1.driverId = T2.driverId INNER JOIN races T3 ON T1.raceId = T3.raceId WHERE T2.nationality = 'Japanese'   AND T3.year BETWEEN 2007 AND 2009;
SELECT      r.year,     AVG(         CAST(SUBSTR(res.time, 1, 2) AS REAL) * 3600 +         CAST(SUBSTR(res.time, 4, 2) AS REAL) * 60 +         CAST(SUBSTR(res.time, 7, 2) AS REAL) +         CAST(SUBSTR(res.time, 10) AS REAL) / 1000     ) AS avg_time_seconds FROM results res JOIN races r ON res.raceId = r.raceId WHERE res.position = 1     AND res.time IS NOT NULL     AND r.year < 1975 GROUP BY r.year;
SELECT DISTINCT   T1.forename,   T1.surname FROM drivers AS T1 JOIN driverStandings AS T2   ON T1.driverId = T2.driverId WHERE   strftime('%Y', T1.dob) > '1975'   AND T2.position = 2;
SELECT COUNT(*)  FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE d.nationality = 'Italian'   AND r.time IS NULL;
SELECT DISTINCT   T1.forename,   T1.surname FROM drivers AS T1 JOIN results AS T2   ON T1.driverId = T2.driverId WHERE T2.fastestLapTime IS NOT NULL ORDER BY   T2.fastestLapTime ASC LIMIT 1;
SELECT      T1.fastestLap FROM      results AS T1 INNER JOIN      races AS T2 ON T1.raceId = T2.raceId WHERE      T2.year = 2009     AND T1.position = 1     AND T1.time IS NOT NULL     AND T1.time LIKE '%:%:%.%' ORDER BY      T1.fastestLap ASC LIMIT 1;
SELECT AVG(T1.fastestLapSpeed) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Spanish Grand Prix' AND T2.year = 2009
SELECT      r.name,     r.year FROM results res JOIN races r ON res.raceId = r.raceId WHERE res.milliseconds IS NOT NULL ORDER BY res.milliseconds ASC LIMIT 1;
SELECT    CAST(COUNT(CASE WHEN strftime('%Y', T1.dob) < 1985 AND T3.laps > 50 THEN T1.driverId END) AS REAL) * 100 / COUNT(T1.driverId) AS percentage FROM drivers T1 INNER JOIN results T3 ON T1.driverId = T3.driverId INNER JOIN races T2 ON T3.raceId = T2.raceId WHERE T2.year BETWEEN 2000 AND 2005
SELECT COUNT(*)  FROM lapTimes AS lt JOIN drivers AS d ON lt.driverId = d.driverId WHERE d.nationality = 'French'   AND lt.milliseconds < 120000;
SELECT code FROM drivers WHERE nationality = 'America';
SELECT raceId FROM races WHERE year = 2009;
SELECT COUNT(driverId) AS driver_count FROM results WHERE raceId = 18;
SELECT      GROUP_CONCAT(code),     SUM(CASE WHEN nationality = 'Dutch' THEN 1 ELSE 0 END) AS dutch_count FROM (     SELECT code, nationality     FROM drivers     ORDER BY dob DESC     LIMIT 3 ) AS top3_youngest;
SELECT driverRef FROM drivers WHERE forename = 'Robert' AND surname = 'Kubica';
SELECT COUNT(*)  FROM drivers  WHERE nationality = 'British'    AND strftime('%Y', dob) = '1980';
SELECT T1.forename, T1.surname FROM drivers AS T1 INNER JOIN lapTimes AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = 'German'   AND strftime('%Y', T1.dob) BETWEEN '1980' AND '1990' GROUP BY T1.driverId ORDER BY MIN(T2.time) ASC LIMIT 3;
SELECT driverRef FROM drivers WHERE nationality = 'German' ORDER BY dob ASC LIMIT 1;
SELECT DISTINCT   d.driverId,   d.code FROM drivers d JOIN results r   ON d.driverId = r.driverId WHERE   strftime('%Y', d.dob) = '1971'   AND r.fastestLapTime IS NOT NULL;
SELECT DISTINCT   T1.forename,   T1.surname FROM drivers AS T1 INNER JOIN lapTimes AS T2   ON T1.driverId = T2.driverId WHERE   T1.nationality = 'Spanish'   AND strftime('%Y', T1.dob) < '1982' ORDER BY   T2.time DESC LIMIT 10;
SELECT DISTINCT T1.year FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.fastestLapTime IS NOT NULL ORDER BY T2.fastestLapTime ASC LIMIT 1
SELECT      T1.year FROM races AS T1 INNER JOIN lapTimes AS T2     ON T1.raceId = T2.raceId ORDER BY      T2.milliseconds DESC LIMIT 1;
SELECT driverId FROM lapTimes WHERE lap = 1 ORDER BY time ASC LIMIT 5;
SELECT COUNT(*)  FROM results  WHERE raceId > 50    AND raceId < 100    AND statusId = 2    AND time IS NOT NULL;
SELECT      COUNT(*) AS number_of_times,     T1.location,     T1.lat,     T1.lng FROM circuits AS T1 WHERE T1.country = 'Austria' GROUP BY T1.location, T1.lat, T1.lng;
SELECT      r.raceId FROM      results res JOIN      races r ON res.raceId = r.raceId WHERE      res.time IS NOT NULL GROUP BY      r.raceId ORDER BY      COUNT(*) DESC LIMIT 1;
SELECT DISTINCT     T1.driverRef,     T1.nationality,     T1.dob FROM drivers AS T1 INNER JOIN qualifying AS T2     ON T1.driverId = T2.driverId WHERE     T2.raceId = 23     AND T2.q2 IS NOT NULL
SELECT      T1.year,     T1.name,     T1.date,     T1.time FROM races AS T1 WHERE T1.raceId = (     SELECT T2.raceId     FROM qualifying AS T2     INNER JOIN races AS T3 ON T2.raceId = T3.raceId     WHERE T2.driverId = (         SELECT driverId         FROM drivers         ORDER BY dob DESC         LIMIT 1     )     ORDER BY T3.date ASC     LIMIT 1 )
SELECT COUNT(*)  FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN status s ON r.statusId = s.statusId WHERE d.nationality = 'American'    AND s.status = 'Puncture';
SELECT      c.url FROM      constructors c JOIN      constructorStandings cs ON c.constructorId = cs.constructorId WHERE      c.nationality = 'Italian' ORDER BY      cs.points DESC LIMIT 1;
SELECT      c.url FROM      constructors c JOIN      constructorStandings cs ON c.constructorId = cs.constructorId GROUP BY      c.constructorId, c.url ORDER BY      SUM(cs.wins) DESC LIMIT 1;
SELECT      d.forename,     d.surname FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId JOIN races r ON lt.raceId = r.raceId WHERE r.name = 'French Grand Prix'   AND lt.lap = 3 ORDER BY lt.milliseconds DESC LIMIT 1;
SELECT      r.raceId,     lt.milliseconds FROM lapTimes lt JOIN races r ON lt.raceId = r.raceId WHERE lt.lap = 1 ORDER BY lt.milliseconds ASC LIMIT 1;
SELECT    AVG(     CAST(SUBSTR(T1.fastestLapTime, 1, INSTR(T1.fastestLapTime, ':') - 1) AS REAL) * 60 +      CAST(SUBSTR(T1.fastestLapTime, INSTR(T1.fastestLapTime, ':') + 1) AS REAL)   ) FROM results AS T1 INNER JOIN races AS T2   ON T1.raceId = T2.raceId WHERE    T2.year = 2006   AND T2.name = 'United States Grand Prix'   AND T1.rank < 11;
SELECT      T1.forename,     T1.surname FROM drivers AS T1 INNER JOIN pitStops AS T2      ON T1.driverId = T2.driverId WHERE      T1.nationality = 'German'     AND 1980 < strftime('%Y', T1.dob) AND strftime('%Y', T1.dob) < 1985 GROUP BY      T1.driverId ORDER BY      SUM(T2.milliseconds) / COUNT(T2.milliseconds) ASC LIMIT 3;
SELECT      d.forename,     d.surname,     r.time FROM results r JOIN races ra ON r.raceId = ra.raceId JOIN drivers d ON r.driverId = d.driverId WHERE ra.name = 'Canadian Grand Prix'   AND ra.year = 2008   AND r.position = 1;
SELECT DISTINCT   T4.constructorRef,   T4.url FROM   races AS T1   JOIN results AS T2 ON T1.raceId = T2.raceId   JOIN drivers AS T3 ON T2.driverId = T3.driverId   JOIN constructors AS T4 ON T2.constructorId = T4.constructorId WHERE   T1.name = 'Singapore Grand Prix'   AND T1.year = 2009 ORDER BY   T2.time DESC LIMIT 1;
SELECT      forename,     surname,     dob FROM      drivers WHERE      nationality = 'Austrian'     AND dob BETWEEN '1981-01-01' AND '1991-12-31';
SELECT      d.forename || ' ' || d.surname AS full_name,     d.url,     d.dob FROM      drivers d WHERE      d.nationality = 'German'     AND d.dob BETWEEN '1971-01-01' AND '1985-12-31' ORDER BY      d.dob DESC;
SELECT      c.location,     c.country,     c.lat,     c.lng FROM circuits c WHERE c.name = 'Hungaroring';
SELECT      T1.points,     T3.name,     T3.nationality FROM constructorResults AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN constructors AS T3 ON T1.constructorId = T3.constructorId WHERE T2.name = 'Monaco Grand Prix'   AND T2.year BETWEEN 1980 AND 2010 ORDER BY T1.points DESC LIMIT 1;
SELECT AVG(T1.points) AS average_score FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T1.raceId = T3.raceId WHERE T2.forename = 'Lewis'   AND T2.surname = 'Hamilton'   AND T3.name = 'Turkish Grand Prix'
SELECT    CAST(COUNT(*) AS REAL) / 10 AS annual_average_races FROM    races WHERE    date BETWEEN '2000-01-01' AND '2010-12-31';
SELECT nationality FROM drivers GROUP BY nationality ORDER BY COUNT(*) DESC LIMIT 1;
SELECT      T1.wins FROM      driverStandings AS T1 WHERE      T1.position = 91 LIMIT 1;
SELECT T1.name FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId ORDER BY T2.fastestLapTime ASC LIMIT 1
SELECT      c.location,     c.country FROM races r JOIN circuits c ON r.circuitId = c.circuitId ORDER BY r.date DESC LIMIT 1;
SELECT DISTINCT     T1.forename,     T1.surname FROM drivers AS T1 JOIN qualifying AS T2     ON T1.driverId = T2.driverId JOIN races AS T3     ON T2.raceId = T3.raceId JOIN circuits AS T4     ON T3.circuitId = T4.circuitId WHERE     T4.name = 'Marina Bay Street Circuit'     AND T3.year = 2008     AND T3.round = 3     AND T2.q3 = (         SELECT MIN(q3)         FROM qualifying         WHERE raceId = T3.raceId     )
SELECT      d.forename,     d.surname,     d.nationality,     r.name AS race_name FROM      drivers d JOIN      results res ON d.driverId = res.driverId JOIN      races r ON res.raceId = r.raceId WHERE      d.dob = (SELECT MAX(dob) FROM drivers) ORDER BY      r.year ASC, r.round ASC LIMIT 1;
SELECT COUNT(*) AS accident_count FROM results r JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Canadian Grand Prix'   AND r.statusId = 3   AND r.driverId = (     SELECT r2.driverId     FROM results r2     JOIN races ra2 ON r2.raceId = ra2.raceId     WHERE ra2.name = 'Canadian Grand Prix'       AND r2.statusId = 3     GROUP BY r2.driverId     ORDER BY COUNT(*) DESC     LIMIT 1   );
SELECT      COUNT(T3.resultId) AS wins,     T2.forename,     T2.surname FROM drivers AS T2 LEFT JOIN results AS T3      ON T2.driverId = T3.driverId WHERE T2.dob = (     SELECT MIN(dob)      FROM drivers ) AND T3.position = 1 GROUP BY T2.driverId, T2.forename, T2.surname;
SELECT MAX(duration) FROM pitStops;
SELECT time FROM lapTimes ORDER BY milliseconds ASC LIMIT 1
SELECT MAX(T1.duration) FROM pitStops AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Lewis'   AND T2.surname = 'Hamilton'
SELECT ps.lap FROM pitStops ps JOIN drivers d ON ps.driverId = d.driverId JOIN races r ON ps.raceId = r.raceId WHERE d.forename = 'Lewis'   AND d.surname = 'Hamilton'   AND r.year = 2011   AND r.name = 'Australian Grand Prix';
SELECT      d.forename,     d.surname,     ps.duration FROM pitStops ps JOIN drivers d ON ps.driverId = d.driverId JOIN races r ON ps.raceId = r.raceId WHERE r.year = 2011   AND r.name = 'Australian Grand Prix' ORDER BY ps.driverId, ps.stop;
SELECT MIN(T1.time) FROM lapTimes AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Lewis'   AND T2.surname = 'Hamilton'
SELECT DISTINCT     T1.forename,     T1.surname FROM drivers AS T1 INNER JOIN lapTimes AS T2     ON T1.driverId = T2.driverId ORDER BY     T2.milliseconds ASC LIMIT 20
SELECT lt.position FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId WHERE d.forename = 'Lewis'    AND d.surname = 'Hamilton'   AND lt.milliseconds = (     SELECT MIN(lt2.milliseconds)     FROM lapTimes lt2     JOIN drivers d2 ON lt2.driverId = d2.driverId     WHERE d2.forename = 'Lewis'        AND d2.surname = 'Hamilton'   );
SELECT MIN(T1.milliseconds) FROM lapTimes AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN circuits AS T3 ON T2.circuitId = T3.circuitId WHERE T3.name = 'Austrian Grand Prix Circuit'
SELECT      T1.circuitId,     T1.name,     T2.time FROM circuits AS T1 INNER JOIN lapTimes AS T2 ON T1.circuitId = (     SELECT circuitId      FROM races      WHERE raceId = T2.raceId ) WHERE T1.country = 'Italy' ORDER BY T2.milliseconds ASC LIMIT 1;
SELECT T1.name FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId INNER JOIN lapTimes AS T3 ON T1.raceId = T3.raceId WHERE T2.name = 'Austrian Grand Prix Circuit' ORDER BY T3.milliseconds ASC LIMIT 1
SELECT DISTINCT   T3.duration FROM   circuits AS T1   JOIN races AS T2 ON T1.circuitId = T2.circuitId   JOIN lapTimes AS T4 ON T2.raceId = T4.raceId   JOIN pitStops AS T3 ON T2.raceId = T3.raceId WHERE   T1.name = 'Austrian Grand Prix Circuit'   AND T4.time = (     SELECT MIN(T4.time)     FROM lapTimes AS T4     JOIN races AS T2 ON T2.raceId = T4.raceId     JOIN circuits AS T1 ON T1.circuitId = T2.circuitId     WHERE T1.name = 'Austrian Grand Prix Circuit'   )   AND T3.driverId = T4.driverId
SELECT DISTINCT   T1.lat,   T1.lng FROM circuits AS T1 JOIN races AS T2   ON T1.circuitId = T2.circuitId JOIN lapTimes AS T3   ON T2.raceId = T3.raceId WHERE T3.time = '1:29.488'
SELECT      AVG(T1.milliseconds) AS average_time FROM pitStops AS T1 INNER JOIN drivers AS T2     ON T1.driverId = T2.driverId WHERE      T2.forename = 'Lewis'      AND T2.surname = 'Hamilton'
SELECT      AVG(lt.milliseconds) AS average_lap_time FROM lapTimes lt JOIN races r ON lt.raceId = r.raceId JOIN circuits c ON r.circuitId = c.circuitId WHERE c.country = 'Italy';
SELECT T1.player_api_id FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.overall_rating DESC LIMIT 1
SELECT player_name, height FROM Player ORDER BY height DESC LIMIT 1;
SELECT preferred_foot FROM Player_Attributes ORDER BY potential ASC LIMIT 1;
SELECT COUNT(*)  FROM Player_Attributes  WHERE overall_rating >= 60    AND overall_rating < 65    AND defensive_work_rate = 'low';
SELECT      p.player_api_id FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id GROUP BY p.player_api_id ORDER BY MAX(pa.crossing) DESC LIMIT 5;
SELECT      l.name FROM      Match m JOIN      League l ON m.league_id = l.id WHERE      m.season = '2015/2016' GROUP BY      l.name ORDER BY      SUM(m.home_team_goal + m.away_team_goal) DESC LIMIT 1;
SELECT      T1.team_long_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id WHERE T2.season = '2015/2016'   AND T2.home_team_goal < T2.away_team_goal GROUP BY T1.team_long_name ORDER BY COUNT(*) ASC LIMIT 1;
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.penalties DESC LIMIT 10
SELECT      T1.team_long_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id JOIN League AS T3 ON T2.league_id = T3.id WHERE      T3.name = 'Scotland Premier League'     AND T2.season = '2009/2010'     AND T2.away_team_goal > T2.home_team_goal GROUP BY      T1.team_api_id ORDER BY      COUNT(*) DESC LIMIT 1;
SELECT DISTINCT   T1.buildUpPlaySpeed FROM Team_Attributes AS T1 ORDER BY   T1.buildUpPlaySpeed DESC LIMIT 4;
SELECT      T1.name FROM League AS T1 INNER JOIN Match AS T2 ON T1.id = T2.league_id WHERE T2.season = '2015/2016' GROUP BY T1.name ORDER BY SUM(CASE WHEN T2.home_team_goal = T2.away_team_goal THEN 1 ELSE 0 END) DESC LIMIT 1;
SELECT    T1.player_name,   (strftime('%Y', 'now') - strftime('%Y', T1.birthday)) AS age FROM Player AS T1 INNER JOIN Player_Attributes AS T2   ON T1.player_api_id = T2.player_api_id WHERE T2.sprint_speed >= 97   AND strftime('%Y', T2.date) >= '2013'   AND strftime('%Y', T2.date) <= '2015'
SELECT      L.name,     COUNT(M.league_id) AS match_count FROM League L JOIN Match M ON L.id = M.league_id GROUP BY L.id, L.name ORDER BY match_count DESC LIMIT 1;
SELECT      CAST(SUM(height) AS REAL) / COUNT(id) AS average_height FROM      Player WHERE      birthday >= '1990-01-01 00:00:00'      AND birthday < '1996-01-01 00:00:00';
SELECT player_api_id FROM Player_Attributes WHERE substr(date, 1, 4) = '2010' ORDER BY overall_rating DESC LIMIT 1;
SELECT DISTINCT team_fifa_api_id FROM Team_Attributes WHERE buildUpPlaySpeed > 50   AND buildUpPlaySpeed < 60;
SELECT DISTINCT   T1.team_long_name FROM Team AS T1 INNER JOIN Team_Attributes AS T2   ON T1.team_api_id = T2.team_api_id WHERE   T2.buildUpPlayPassing > (     SELECT AVG(T3.buildUpPlayPassing)     FROM Team_Attributes AS T3     WHERE strftime('%Y', T3.date) = '2012'       AND T3.buildUpPlayPassing IS NOT NULL   )   AND strftime('%Y', T2.date) = '2012'
SELECT      CAST(SUM(CASE WHEN PA.preferred_foot = 'left' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(P.player_fifa_api_id) AS percentage FROM Player P JOIN Player_Attributes PA ON P.player_fifa_api_id = PA.player_fifa_api_id WHERE strftime('%Y', P.birthday) BETWEEN '1987' AND '1992';
SELECT      L.name AS league_name,     SUM(M.home_team_goal + M.away_team_goal) AS total_goals FROM Match M JOIN League L ON M.league_id = L.id GROUP BY L.id, L.name ORDER BY total_goals ASC LIMIT 5;
SELECT      CAST(SUM(T1.long_shots) AS REAL) / COUNT(T1.player_fifa_api_id) AS average_long_shots FROM Player_Attributes AS T1 INNER JOIN Player AS T2      ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Ahmed Samir Farag';
SELECT      T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2      ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.height > 180 GROUP BY T1.player_name ORDER BY SUM(T2.heading_accuracy) * 1.0 / COUNT(T2.player_fifa_api_id) DESC LIMIT 10
SELECT DISTINCT     T1.team_long_name FROM Team_Attributes AS T1 INNER JOIN Team AS T2     ON T1.team_api_id = T2.team_api_id WHERE     T1.buildUpPlayDribblingClass = 'Normal'     AND T1.date >= '2014-01-01 00:00:00'     AND T1.date <= '2014-01-31 00:00:00'     AND T1.chanceCreationPassing < (         SELECT             AVG(chanceCreationPassing)         FROM Team_Attributes         WHERE             buildUpPlayDribblingClass = 'Normal'             AND date >= '2014-01-01 00:00:00'             AND date <= '2014-01-31 00:00:00'     ) ORDER BY     T1.chanceCreationPassing DESC;
SELECT DISTINCT   T1.name FROM League AS T1 JOIN Match AS T2   ON T1.id = T2.league_id WHERE   T2.season = '2009/2010' GROUP BY   T1.name HAVING   AVG(T2.home_team_goal) > AVG(T2.away_team_goal)
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers';
SELECT player_name FROM Player WHERE substr(birthday, 1, 4) = '1970'   AND substr(birthday, 6, 2) = '10';
SELECT T1.attacking_work_rate FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Franco Zennaro'
SELECT      T2.buildUpPlayPositioningClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2     ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'ADO Den Haag';
SELECT T2.heading_accuracy FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Francois Affolter' AND T2.date = '2014-09-18 00:00:00'
SELECT T1.overall_rating FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Gabriel Tamas' AND strftime('%Y', T1.date) = '2011'
SELECT COUNT(*)  FROM Match m JOIN League l ON m.league_id = l.id WHERE m.season = '2015/2016'   AND l.name = 'Scotland Premier League';
SELECT      pa.preferred_foot FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id ORDER BY p.birthday DESC LIMIT 1;
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.potential = (     SELECT MAX(potential)     FROM Player_Attributes )
SELECT COUNT(*)  FROM Player  WHERE weight < 130    AND player_api_id IN (     SELECT player_api_id      FROM Player_Attributes      WHERE preferred_foot = 'left'   );
SELECT DISTINCT T1.team_short_name FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.chanceCreationPassingClass = 'Risky'
SELECT DISTINCT   T1.defensive_work_rate FROM Player_Attributes AS T1 INNER JOIN Player AS T2   ON T1.player_api_id = T2.player_api_id WHERE   T2.player_name = 'David Wilson'
SELECT T1.birthday FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.overall_rating DESC LIMIT 1
SELECT T1.name FROM League AS T1 INNER JOIN Country AS T2 ON T1.country_id = T2.id WHERE T2.name = 'Netherlands'
SELECT      AVG(T1.home_team_goal) AS average_home_team_goal FROM      Match AS T1 JOIN      Country AS T2      ON T1.country_id = T2.id WHERE      T2.name = 'Poland'     AND T1.season = '2010/2011'
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.height = (SELECT MAX(height) FROM Player)    OR p.height = (SELECT MIN(height) FROM Player) GROUP BY p.player_api_id, p.player_name ORDER BY AVG(pa.finishing) DESC LIMIT 1;
SELECT player_name FROM Player WHERE height > 180;
SELECT COUNT(*)  FROM Player  WHERE strftime('%Y', birthday) > '1990';
SELECT COUNT(*)  FROM Player  WHERE player_name LIKE 'Adam%'    AND weight > 170;
SELECT DISTINCT   T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2   ON T1.player_api_id = T2.player_api_id WHERE   T2.overall_rating > 80   AND strftime('%Y', T2.date) BETWEEN '2008' AND '2010'
SELECT T1.potential FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Aaron Doran'
SELECT player_name FROM Player WHERE player_api_id IN (     SELECT player_api_id     FROM Player_Attributes     WHERE preferred_foot = 'left' );
SELECT DISTINCT T1.team_long_name FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeedClass = 'Fast'
SELECT T2.buildUpPlayPassingClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_short_name = 'CLB'
SELECT DISTINCT T1.team_short_name FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlayPassing > 70
SELECT    SUM(T1.overall_rating) / COUNT(T1.id) AS average_overall_rating FROM Player_Attributes AS T1 INNER JOIN Player AS T2   ON T1.player_api_id = T2.player_api_id WHERE    strftime('%Y', T1.date) >= '2010'    AND strftime('%Y', T1.date) <= '2015'   AND T2.height > 170;
SELECT player_name FROM Player ORDER BY height ASC LIMIT 1;
SELECT T1.name FROM Country AS T1 JOIN League AS T2 ON T1.id = T2.country_id WHERE T2.name = 'Italy Serie A'
SELECT T1.team_short_name FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeed = 31   AND T2.buildUpPlayDribbling = 53   AND T2.buildUpPlayPassing = 32;
SELECT AVG(T1.overall_rating) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Aaron Doran'
SELECT COUNT(*)  FROM Match AS m JOIN League AS l ON m.league_id = l.id WHERE l.name = 'Germany 1. Bundesliga'   AND strftime('%Y-%m', m.date) BETWEEN '2008-08' AND '2008-10';
SELECT DISTINCT T1.team_short_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id WHERE T2.home_team_goal = 10
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.potential = 61 AND T2.balance = (     SELECT MAX(balance)     FROM Player_Attributes     WHERE potential = 61 )
SELECT      AVG(CASE WHEN T1.player_name = 'Abdou Diallo' THEN T2.ball_control ELSE NULL END) -      AVG(CASE WHEN T1.player_name = 'Aaron Appindangoye' THEN T2.ball_control ELSE NULL END) AS difference FROM Player T1 INNER JOIN Player_Attributes T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name IN ('Abdou Diallo', 'Aaron Appindangoye');
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN';
SELECT player_name  FROM Player  WHERE player_name IN ('Aaron Lennon', 'Abdelaziz Barrada')  ORDER BY birthday ASC  LIMIT 1;
SELECT player_name FROM Player ORDER BY height DESC LIMIT 1;
SELECT COUNT(*)  FROM Player_Attributes  WHERE preferred_foot = 'left'    AND attacking_work_rate = 'low';
SELECT T2.name FROM League AS T1 INNER JOIN Country AS T2 ON T1.country_id = T2.id WHERE T1.name = 'Belgium Jupiler League'
SELECT DISTINCT T1.name FROM League AS T1 INNER JOIN Country AS T2 ON T1.country_id = T2.id WHERE T2.name = 'Germany'
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.overall_rating DESC LIMIT 1;
SELECT COUNT(DISTINCT T1.player_api_id) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE strftime('%Y', T1.birthday) < '1986'   AND T2.defensive_work_rate = 'high'
SELECT      p.player_name,     pa.crossing FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone') ORDER BY pa.crossing DESC LIMIT 1;
SELECT T2.heading_accuracy FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Ariel Borysiuk'
SELECT COUNT(*) FROM Player AS p JOIN Player_Attributes AS pa ON p.player_api_id = pa.player_api_id WHERE p.height > 180   AND pa.volleys > 70;
SELECT DISTINCT   T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2   ON T1.player_api_id = T2.player_api_id WHERE   T2.volleys > 70 AND T2.dribbling > 70;
SELECT COUNT(*)  FROM Match m JOIN Country c ON m.country_id = c.id WHERE c.name = 'Belgium'   AND m.season = '2008/2009';
SELECT T1.long_passing FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.birthday ASC LIMIT 1;
SELECT COUNT(*)  FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T2.name = 'Belgium Jupiler League'   AND SUBSTR(T1.date, 1, 7) = '2009-04'
SELECT T1.name FROM League AS T1 INNER JOIN Match AS T2 ON T1.id = T2.league_id WHERE T2.season = '2008/2009' GROUP BY T1.name ORDER BY COUNT(*) DESC LIMIT 1;
SELECT      CAST(SUM(T1.overall_rating) AS REAL) / COUNT(T1.id) AS average_overall_rating FROM Player_Attributes AS T1 INNER JOIN Player AS T2      ON T1.player_api_id = T2.player_api_id WHERE strftime('%Y', T2.birthday) < '1986';
SELECT    CAST((T1.overall_rating - T2.overall_rating) AS REAL) * 100 / T2.overall_rating FROM Player_Attributes AS T1 INNER JOIN Player AS P1 ON T1.player_api_id = P1.player_api_id INNER JOIN Player_Attributes AS T2 ON T2.player_api_id = (     SELECT player_api_id FROM Player WHERE player_name = 'Paulin Puel' ) INNER JOIN Player AS P2 ON T2.player_api_id = P2.player_api_id WHERE P1.player_name = 'Ariel Borysiuk'   AND P2.player_name = 'Paulin Puel'   AND T1.overall_rating = (     SELECT MAX(overall_rating)      FROM Player_Attributes      WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Ariel Borysiuk')   )   AND T2.overall_rating = (     SELECT MAX(overall_rating)      FROM Player_Attributes      WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Paulin Puel')   );
SELECT AVG(T1.buildUpPlaySpeed) FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_long_name = 'Heart of Midlothian'
SELECT AVG(T1.overall_rating)  FROM Player_Attributes AS T1  INNER JOIN Player AS T2  ON T1.player_api_id = T2.player_api_id  WHERE T2.player_name = 'Pietro Marino'
SELECT SUM(T1.crossing)  FROM Player_Attributes AS T1  INNER JOIN Player AS T2  ON T1.player_api_id = T2.player_api_id  WHERE T2.player_name = 'Aaron Lennox'
SELECT      MAX(T1.chanceCreationPassing) AS highest_chance_creation_passing,     T1.chanceCreationPassingClass FROM Team_Attributes AS T1 INNER JOIN Team AS T2      ON T1.team_api_id = T2.team_api_id WHERE T2.team_long_name = 'Ajax' ORDER BY T1.chanceCreationPassing DESC LIMIT 1;
SELECT T1.preferred_foot FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Abdou Diallo'
SELECT MAX(T1.overall_rating) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Dorlan Pabon'
SELECT AVG(T1.away_team_goal) AS average_goals FROM Match AS T1 INNER JOIN Team AS T2 ON T1.away_team_api_id = T2.team_api_id INNER JOIN Country AS T3 ON T1.country_id = T3.id WHERE T2.team_long_name = 'Parma'   AND T3.name = 'Italy'
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.overall_rating = 77 AND T2.date LIKE '2016-06-23%' ORDER BY T1.birthday ASC LIMIT 1
SELECT T1.overall_rating FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Aaron Mooy' AND T1.date LIKE '2016-02-04%'
SELECT T1.potential FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Francesco Parravicini' AND T1.date = '2010-08-30 00:00:00'
SELECT T1.attacking_work_rate FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Francesco Migliore' AND T1.date LIKE '2015-05-01%'
SELECT T1.defensive_work_rate FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Kevin Berigaud' AND T1.date = '2013-02-22 00:00:00'
SELECT T1.date FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Kevin Constant' ORDER BY T1.crossing DESC, T1.date ASC LIMIT 1
SELECT T1.buildUpPlaySpeedClass FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_long_name = 'Willem II' AND T1.date = '2012-02-22'
SELECT T1.buildUpPlayDribblingClass FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_short_name = 'LEI' AND T1.date = '2015-09-10 00:00:00'
SELECT      T2.buildUpPlayPassingClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2     ON T1.team_api_id = T2.team_api_id WHERE      T1.team_long_name = 'FC Lorient'     AND T2.date LIKE '2010-02-22%';
SELECT T1.chanceCreationPassingClass FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_long_name = 'PEC Zwolle' AND T1.date = '2013-09-20 00:00:00'
SELECT      T1.chanceCreationCrossingClass FROM Team_Attributes AS T1 INNER JOIN Team AS T2     ON T1.team_api_id = T2.team_api_id WHERE      T2.team_long_name = 'Hull City'     AND T1.date = '2010-02-22 00:00:00';
SELECT T2.defenceAggressionClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Hannover 96' AND T2.date LIKE '2015-09-10%'
SELECT      AVG(T1.overall_rating) FROM Player_Attributes AS T1 INNER JOIN Player AS T2     ON T1.player_api_id = T2.player_api_id WHERE      T2.player_name = 'Marko Arnautovic'     AND SUBSTR(T1.date, 1, 10) BETWEEN '2007-02-22' AND '2016-04-21';
SELECT      (CAST(T1.overall_rating AS REAL) - T2.overall_rating) * 100.0 / T1.overall_rating AS percentage FROM      Player_Attributes T1     JOIN Player P1 ON T1.player_api_id = P1.player_api_id     JOIN Player_Attributes T2 ON T2.date = T1.date     JOIN Player P2 ON T2.player_api_id = P2.player_api_id WHERE      P1.player_name = 'Landon Donovan'     AND P2.player_name = 'Jordan Bowery'     AND T1.date = '2013-07-12'     AND T2.date = '2013-07-12';
SELECT player_name FROM (     SELECT          player_name,         RANK() OVER (ORDER BY height DESC) AS height_rank     FROM Player ) ranked_players WHERE height_rank = 1;
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10;
SELECT player_name FROM Player WHERE datetime(CURRENT_TIMESTAMP, 'localtime') - datetime(birthday) > 34;
SELECT SUM(T1.home_team_goal)  FROM Match AS T1  INNER JOIN Player AS T2  ON T1.home_player_1 = T2.player_api_id     OR T1.home_player_2 = T2.player_api_id     OR T1.home_player_3 = T2.player_api_id     OR T1.home_player_4 = T2.player_api_id     OR T1.home_player_5 = T2.player_api_id     OR T1.home_player_6 = T2.player_api_id     OR T1.home_player_7 = T2.player_api_id     OR T1.home_player_8 = T2.player_api_id     OR T1.home_player_9 = T2.player_api_id     OR T1.home_player_10 = T2.player_api_id     OR T1.home_player_11 = T2.player_api_id  WHERE T2.player_name = 'Aaron Lennon'
SELECT      (SELECT SUM(m.away_team_goal)       FROM Match m       WHERE m.away_player_1 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith')          OR m.away_player_2 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith')          OR m.away_player_3 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith')          OR m.away_player_4 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith')          OR m.away_player_5 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith')          OR m.away_player_6 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith')          OR m.away_player_7 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith')          OR m.away_player_8 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith')          OR m.away_player_9 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith')          OR m.away_player_10 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith')          OR m.away_player_11 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith')) +      (SELECT SUM(m.away_team_goal)       FROM Match m       WHERE m.away_player_1 = (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira')          OR m.away_player_2 = (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira')          OR m.away_player_3 = (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira')          OR m.away_player_4 = (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira')          OR m.away_player_5 = (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira')          OR m.away_player_6 = (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira')          OR m.away_player_7 = (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira')          OR m.away_player_8 = (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira')          OR m.away_player_9 = (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira')          OR m.away_player_10 = (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira')          OR m.away_player_11 = (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira')) AS total_goals
SELECT      SUM(M.home_team_goal) AS total_home_goals FROM      Match M JOIN      Player P ON M.home_player_1 = P.player_api_id     OR M.home_player_2 = P.player_api_id     OR M.home_player_3 = P.player_api_id     OR M.home_player_4 = P.player_api_id     OR M.home_player_5 = P.player_api_id     OR M.home_player_6 = P.player_api_id     OR M.home_player_7 = P.player_api_id     OR M.home_player_8 = P.player_api_id     OR M.home_player_9 = P.player_api_id     OR M.home_player_10 = P.player_api_id     OR M.home_player_11 = P.player_api_id WHERE      julianday('now') - julianday(P.birthday) <= 30 * 365.25;
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.overall_rating DESC LIMIT 1;
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.potential = (     SELECT MAX(potential)     FROM Player_Attributes )
SELECT DISTINCT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.attacking_work_rate = 'high';
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.finishing = 1 ORDER BY T1.birthday ASC LIMIT 1
SELECT DISTINCT p.player_name FROM Player p JOIN Match m ON p.player_api_id IN (     m.home_player_1, m.home_player_2, m.home_player_3, m.home_player_4, m.home_player_5,     m.home_player_6, m.home_player_7, m.home_player_8, m.home_player_9, m.home_player_10, m.home_player_11,     m.away_player_1, m.away_player_2, m.away_player_3, m.away_player_4, m.away_player_5,     m.away_player_6, m.away_player_7, m.away_player_8, m.away_player_9, m.away_player_10, m.away_player_11 ) JOIN Country c ON m.country_id = c.id WHERE c.name = 'Belgium';
SELECT DISTINCT c.name AS country FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id JOIN Match m ON (p.player_api_id = m.home_player_1      OR p.player_api_id = m.home_player_2      OR p.player_api_id = m.home_player_3      OR p.player_api_id = m.home_player_4      OR p.player_api_id = m.home_player_5      OR p.player_api_id = m.home_player_6      OR p.player_api_id = m.home_player_7      OR p.player_api_id = m.home_player_8      OR p.player_api_id = m.home_player_9      OR p.player_api_id = m.home_player_10      OR p.player_api_id = m.home_player_11     OR p.player_api_id = m.away_player_1      OR p.player_api_id = m.away_player_2      OR p.player_api_id = m.away_player_3      OR p.player_api_id = m.away_player_4      OR p.player_api_id = m.away_player_5      OR p.player_api_id = m.away_player_6      OR p.player_api_id = m.away_player_7      OR p.player_api_id = m.away_player_8      OR p.player_api_id = m.away_player_9      OR p.player_api_id = m.away_player_10      OR p.player_api_id = m.away_player_11) JOIN Country c ON m.country_id = c.id WHERE pa.vision > 89;
SELECT c.name FROM Country c JOIN Match m ON c.id = m.country_id JOIN Player p ON (p.player_api_id = m.home_player_1      OR p.player_api_id = m.home_player_2      OR p.player_api_id = m.home_player_3      OR p.player_api_id = m.home_player_4      OR p.player_api_id = m.home_player_5      OR p.player_api_id = m.home_player_6      OR p.player_api_id = m.home_player_7      OR p.player_api_id = m.home_player_8      OR p.player_api_id = m.home_player_9      OR p.player_api_id = m.home_player_10      OR p.player_api_id = m.home_player_11     OR p.player_api_id = m.away_player_1      OR p.player_api_id = m.away_player_2      OR p.player_api_id = m.away_player_3      OR p.player_api_id = m.away_player_4      OR p.player_api_id = m.away_player_5      OR p.player_api_id = m.away_player_6      OR p.player_api_id = m.away_player_7      OR p.player_api_id = m.away_player_8      OR p.player_api_id = m.away_player_9      OR p.player_api_id = m.away_player_10      OR p.player_api_id = m.away_player_11) GROUP BY c.name ORDER BY AVG(p.weight) DESC LIMIT 1;
SELECT DISTINCT T1.team_long_name FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeedClass = 'Slow'
SELECT DISTINCT T1.team_short_name FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.chanceCreationPassingClass = 'Safe'
SELECT AVG(T1.height) FROM Player AS T1 JOIN Match AS T2 ON T1.player_api_id = T2.home_player_1 JOIN Country AS T3 ON T2.country_id = T3.id WHERE T3.name = 'Italy'
SELECT player_name FROM Player WHERE height > 180 ORDER BY player_name ASC LIMIT 3;
SELECT COUNT(*)  FROM Player  WHERE player_name LIKE 'Aaron%'    AND birthday > '1990';
SELECT    (SELECT jumping FROM Player_Attributes WHERE id = 6) -    (SELECT jumping FROM Player_Attributes WHERE id = 23) AS difference
SELECT T1.player_api_id FROM Player_Attributes AS T1 WHERE T1.preferred_foot = 'right' ORDER BY T1.potential ASC LIMIT 5
SELECT COUNT(*)  FROM Player_Attributes  WHERE crossing = (SELECT MAX(crossing) FROM Player_Attributes)    AND preferred_foot = 'left';
SELECT    CAST(SUM(CASE WHEN T1.strength > 80 AND T1.stamina > 80 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM Player_Attributes AS T1
SELECT DISTINCT c.name FROM Country c JOIN League l ON c.id = l.country_id WHERE l.name = 'Poland Ekstraklasa';
SELECT      T1.home_team_goal,     T1.away_team_goal FROM Match AS T1 INNER JOIN League AS T2     ON T1.league_id = T2.id WHERE      T1.date LIKE '2008-09-24%'     AND T2.name = 'Belgium Jupiler League'
SELECT      pa.sprint_speed,     pa.agility,     pa.acceleration FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Alexis Blin';
SELECT DISTINCT   T2.buildUpPlaySpeedClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2   ON T1.team_api_id = T2.team_api_id WHERE   T1.team_long_name = 'KSV Cercle Brugge';
SELECT COUNT(*)  FROM Match  WHERE season = '2015/2016'    AND league_id = (     SELECT id      FROM League      WHERE name = 'Italy Serie A'   );
SELECT MAX(T1.home_team_goal) FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id INNER JOIN Country AS T3 ON T2.country_id = T3.id WHERE T3.name = 'Netherlands'   AND T2.name = 'Eredivisie';
SELECT      pa.finishing,     pa.curve FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.weight = (SELECT MAX(weight) FROM Player);
SELECT      T1.name FROM League AS T1 INNER JOIN Match AS T2 ON T1.id = T2.league_id WHERE T2.season = '2015/2016' GROUP BY T1.name ORDER BY COUNT(T2.id) DESC LIMIT 4
SELECT T1.team_long_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id ORDER BY T2.away_team_goal DESC LIMIT 1;
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.overall_rating DESC LIMIT 1
SELECT      CAST(COUNT(CASE WHEN p.height < 180 AND pa.strength > 70 THEN 1 END) AS FLOAT) * 100 / COUNT(p.id) AS percentage FROM Player p LEFT JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id;
SELECT      CASE          WHEN SUM(CASE WHEN SEX = 'M' AND Admission = '+' THEN 1 ELSE 0 END) >               SUM(CASE WHEN SEX = 'M' AND Admission = '-' THEN 1 ELSE 0 END)          THEN 'in-patient'         ELSE 'outpatient'     END AS larger_group,     (SUM(CASE WHEN SEX = 'M' AND Admission = '+' THEN 1 ELSE 0 END) * 1.0 /       NULLIF(SUM(CASE WHEN SEX = 'M' AND Admission = '-' THEN 1 ELSE 0 END), 0)) AS percentage_deviation FROM Patient;
SELECT    CAST(COUNT(CASE WHEN YEAR(Birthday) > 1930 THEN ID END) AS REAL) * 100 / COUNT(ID) AS percentage FROM Patient WHERE SEX = 'F';
SELECT    CAST(SUM(CASE WHEN T1.Admission = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM Patient AS T1 WHERE T1.Birthday BETWEEN '1930-01-01' AND '1940-12-31';
SELECT      CAST(COUNT(CASE WHEN Admission = '+' THEN ID END) AS REAL) * 1.0 /      COUNT(CASE WHEN Admission = '-' THEN ID END) AS ratio FROM Patient WHERE Diagnosis = 'SLE';
SELECT      p.Diagnosis,     l.Date FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.ID = 30609;
SELECT      T1.SEX,     T1.Birthday,     T2.`Examination Date`,     T2.Symptoms FROM Patient AS T1 INNER JOIN Examination AS T2     ON T1.ID = T2.ID WHERE T1.ID = 163109;
SELECT DISTINCT     T1.ID,     T1.SEX,     T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2     ON T1.ID = T2.ID WHERE     T2.LDH > 500
SELECT      T1.ID,     (STRFTIME('%Y', 'NOW') - STRFTIME('%Y', T1.Birthday)) AS age FROM Patient AS T1 INNER JOIN Examination AS T2     ON T1.ID = T2.ID WHERE T2.RVVT = '+';
SELECT DISTINCT     p.ID,     p.SEX,     p.Diagnosis FROM Patient AS p JOIN Examination AS e     ON p.ID = e.ID WHERE e.Thrombosis = 2;
SELECT DISTINCT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T1.Birthday) = '1937'   AND T2.`T-CHO` >= 250
SELECT DISTINCT     T1.ID,     T1.SEX,     T1.Diagnosis FROM Patient AS T1 INNER JOIN Laboratory AS T2     ON T1.ID = T2.ID WHERE     T2.ALB < 3.5
SELECT    CAST(COUNT(DISTINCT CASE WHEN T2.TP < 6.0 OR T2.TP > 8.5 THEN T1.ID END) AS REAL) * 100 / COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Laboratory AS T2   ON T1.ID = T2.ID WHERE T1.SEX = 'F';
SELECT AVG(T1.`aCL IgG`) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Admission = '+'   AND (STRFTIME('%Y', 'now') - STRFTIME('%Y', T2.Birthday)) >= 50;
SELECT COUNT(*)  FROM Patient  WHERE SEX = 'F'    AND STRFTIME('%Y', Description) = '1997'    AND Admission = '-';
SELECT MIN(SUBSTR(`First Date`, 1, 4) - SUBSTR(`Birthday`, 1, 4)) AS age FROM Patient WHERE `First Date` IS NOT NULL   AND `Birthday` IS NOT NULL;
SELECT COUNT(*)  FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.`Examination Date` >= '1997-01-01'    AND e.`Examination Date` < '1998-01-01'   AND e.Thrombosis = 1   AND p.SEX = 'F';
SELECT MAX(YEAR(p.Birthday)) - MIN(YEAR(p.Birthday)) AS age_gap FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TG >= 200;
SELECT e.Symptoms, p.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Symptoms IS NOT NULL ORDER BY p.Birthday DESC LIMIT 1;
SELECT    CAST(COUNT(T1.ID) AS REAL) / 12 AS average_male_patients_per_month FROM Patient AS T1 INNER JOIN Laboratory AS T2   ON T1.ID = T2.ID WHERE T1.SEX = 'M'   AND T2.Date BETWEEN '1998-01-01' AND '1998-12-31';
SELECT      l.Date AS laboratory_date,     (strftime('%Y', p.`First Date`) - strftime('%Y', p.Birthday)) AS age_at_arrival FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis = 'SJS' ORDER BY p.Birthday ASC LIMIT 1;
SELECT    CAST(SUM(CASE WHEN T1.SEX = 'M' AND T2.UA <= 8.0 THEN 1 ELSE 0 END) AS REAL) * 1.0 /    SUM(CASE WHEN T1.SEX = 'F' AND T2.UA <= 6.5 THEN 1 ELSE 0 END) AS ratio FROM Patient AS T1 INNER JOIN Laboratory AS T2   ON T1.ID = T2.ID;
SELECT COUNT(*) FROM Patient AS P JOIN Examination AS E ON P.ID = E.ID WHERE SUBSTR(E.`Examination Date`, 1, 4) - SUBSTR(P.`First Date`, 1, 4) >= 1;
SELECT COUNT(*) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`Examination Date` BETWEEN '1990-01-01' AND '1993-12-31' AND (strftime('%Y', T2.`Examination Date`) - strftime('%Y', T1.Birthday)) < 18
SELECT COUNT(*) FROM Patient AS p JOIN Laboratory AS l ON p.ID = l.ID WHERE p.SEX = 'M'   AND l.`T-BIL` >= 2.0;
SELECT p.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.`Examination Date` BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY p.Diagnosis ORDER BY COUNT(p.Diagnosis) DESC LIMIT 1;
SELECT    AVG(1999 - STRFTIME('%Y', T1.Birthday)) AS average_age FROM Patient AS T1 INNER JOIN Laboratory AS T2   ON T1.ID = T2.ID WHERE T2.Date BETWEEN '1991-10-01' AND '1991-10-30';
SELECT      SUBSTR(CAST(T1.`Examination Date` AS TEXT), 1, 4) - SUBSTR(CAST(T2.Birthday AS TEXT), 1, 4) AS age,     T2.Diagnosis FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID AND T1.`Examination Date` = T3.Date WHERE T3.HGB = (     SELECT MAX(HGB)      FROM Laboratory ) LIMIT 1;
SELECT `ANA` FROM `Examination` WHERE `ID` = 3605340   AND `Examination Date` = '1996-12-02';
SELECT    CASE      WHEN T-CHO < 250 THEN 'yes'     ELSE 'no'   END FROM Laboratory WHERE ID = 2927464   AND Date = '1995-09-04';
SELECT T1.SEX FROM Patient AS T1 WHERE T1.Diagnosis = 'AORTITIS' ORDER BY T1.First Date ASC LIMIT 1;
SELECT T1.`aCL IgM` FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'SLE'   AND T2.`Description` = '1994-02-19'   AND T1.`Examination Date` = '1993-11-12';
SELECT    CASE      WHEN T1.SEX = 'M' THEN 'man'     WHEN T1.SEX = 'F' THEN 'women'   END FROM Patient AS T1 INNER JOIN Laboratory AS T2   ON T1.ID = T2.ID WHERE    T2.GPT = 9    AND T2.Date = '1992-06-12';
SELECT      SUBSTR(T1.Date, 1, 4) - SUBSTR(T2.Birthday, 1, 4) AS age FROM      Laboratory AS T1 JOIN      Patient AS T2 ON      T1.ID = T2.ID WHERE      T1.UA = 8.4     AND T1.Date = '1991-10-21';
SELECT COUNT(T1.ID) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.`First Date` = '1991-06-13'   AND T2.Diagnosis = 'SJS'   AND T1.Date LIKE '1995%';
SELECT T1.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'SLE' AND T2.`Examination Date` = '1997-01-27'
SELECT T1.Symptoms FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Birthday = '1959-03-01' AND T1.`Examination Date` = '1993-09-27'
SELECT    (     SUM(CASE WHEN P.Birthday = '1959-02-18' AND L.Date LIKE '1981-11-%' THEN L.`T-CHO` ELSE 0 END) -     SUM(CASE WHEN P.Birthday = '1959-02-18' AND L.Date LIKE '1981-12-%' THEN L.`T-CHO` ELSE 0 END)   ) AS decrease_rate FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Birthday = '1959-02-18'   AND (L.Date LIKE '1981-11-%' OR L.Date LIKE '1981-12-%');
SELECT DISTINCT T1.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'Behcet' AND T2.`Examination Date` >= '1997-01-01' AND T2.`Examination Date` < '1998-01-01'
SELECT DISTINCT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.Date BETWEEN '1987-07-06' AND '1996-01-31'   AND T2.GPT > 30   AND T2.ALB < 4
SELECT ID FROM Patient WHERE SEX = 'F'   AND strftime('%Y', Birthday) = '1964'   AND Admission = '+';
SELECT COUNT(*)  FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.Thrombosis = 2    AND e.ANA Pattern = 'S'   AND e.`aCL IgM` > (SELECT AVG(`aCL IgM`) FROM Examination) * 1.2;
SELECT    CAST(SUM(CASE WHEN T1.UA <= 6.5 THEN 1 ELSE 0 END) AS REAL) * 100 /    SUM(CASE WHEN T1.`U-PRO` > 0 AND T1.`U-PRO` < 30 THEN 1 ELSE 0 END) AS percentage FROM Laboratory AS T1 WHERE T1.`U-PRO` > 0 AND T1.`U-PRO` < 30;
SELECT    CAST(SUM(CASE WHEN T1.Diagnosis = 'BEHCET' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM Patient AS T1 WHERE T1.SEX = 'M'    AND YEAR(T1.`First Date`) = 1981;
SELECT DISTINCT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '-'   AND T2.Date LIKE '1991-10%'   AND T2.`T-BIL` < 2.0;
SELECT COUNT(*) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`ANA Pattern` != 'P'   AND T1.SEX = 'F'   AND T1.Birthday BETWEEN '1980-01-01' AND '1989-12-31';
SELECT      T1.SEX FROM      Patient AS T1     INNER JOIN Examination AS T2 ON T1.ID = T2.ID     INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE      T2.Diagnosis = 'PSS'     AND T3.CRP = '2+'     AND T3.CRE = 1     AND T3.LDH = 123;
SELECT AVG(T1.ALB) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.SEX = 'F'   AND T1.PLT > 400   AND T2.Diagnosis = 'SLE';
SELECT T1.symptoms FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'SLE' GROUP BY T1.symptoms ORDER BY COUNT(*) DESC LIMIT 1;
SELECT      Description,     Diagnosis FROM      Patient WHERE      ID = 48473;
SELECT COUNT(*)  FROM Patient  WHERE SEX = 'F'    AND Diagnosis = 'APS';
SELECT COUNT(*) FROM Laboratory WHERE YEAR(`Date`) = 1997   AND (TP <= 6 OR TP >= 8.5);
SELECT      CAST(SUM(CASE WHEN Diagnosis LIKE '%SLE%' THEN 1 ELSE 0 END) AS FLOAT) * 100 /      COUNT(*) AS proportion FROM Examination WHERE Symptoms LIKE '%thrombocytopenia%';
SELECT    CAST(SUM(CASE WHEN T1.SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.SEX) AS percentage FROM Patient AS T1 WHERE YEAR(T1.Birthday) = 1980   AND T1.Diagnosis = 'RA';
SELECT COUNT(*) FROM Patient AS P JOIN Examination AS E ON P.ID = E.ID WHERE P.SEX = 'M'   AND E.`Examination Date` BETWEEN '1995-01-01' AND '1997-12-31'   AND E.Diagnosis = 'Behcet'   AND P.Admission = '-';
SELECT COUNT(*) FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.SEX = 'F'   AND L.WBC < 3.5;
SELECT DATEDIFF(`Examination Date`, `First Date`) AS days FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.ID = 821298;
SELECT      CASE          WHEN p.SEX = 'M' AND l.UA > 8.0 THEN 'Yes'         WHEN p.SEX = 'F' AND l.UA > 6.5 THEN 'Yes'         ELSE 'No'     END AS within_normal_range FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.ID = 57266;
SELECT `Date` FROM `Laboratory` WHERE `ID` = 48473   AND `GOT` >= 60;
SELECT DISTINCT   T1.ID,   T1.SEX,   T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2   ON T1.ID = T2.ID WHERE   T2.GOT < 60   AND STRFTIME('%Y', T2.Date) = '1994';
SELECT DISTINCT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M'   AND T2.GPT >= 60;
SELECT DISTINCT   T1.Diagnosis FROM Patient AS T1 JOIN Laboratory AS T2   ON T1.ID = T2.ID WHERE T2.GPT > 60 ORDER BY T1.Birthday DESC;
SELECT AVG(LDH)  FROM Laboratory  WHERE LDH < 500;
SELECT      T1.ID,     STRFTIME('%Y', 'now') - STRFTIME('%Y', T1.Birthday) AS age FROM Patient AS T1 INNER JOIN Laboratory AS T2     ON T1.ID = T2.ID WHERE T2.LDH BETWEEN 600 AND 800;
SELECT    T1.Admission FROM Patient AS T1 INNER JOIN Laboratory AS T2   ON T1.ID = T2.ID WHERE T2.ALP < 300
SELECT      p.ID,     CASE          WHEN l.ALP < 300 THEN 'Yes'         ELSE 'No'     END AS ALP_within_normal_range FROM      Patient p LEFT JOIN      Laboratory l ON p.ID = l.ID WHERE      p.Birthday = '1982-04-01';
SELECT DISTINCT   T1.ID,   T1.SEX,   T1.Birthday FROM Patient AS T1 JOIN Laboratory AS T2   ON T1.ID = T2.ID WHERE T2.TP < 6.0;
SELECT      T1.ID,     T2.TP - 8.5 AS deviation FROM Patient AS T1 INNER JOIN Laboratory AS T2     ON T1.ID = T2.ID WHERE      T1.SEX = 'F'     AND T2.TP > 8.5;
SELECT DISTINCT   T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2   ON T1.ID = T2.ID WHERE   T1.SEX = 'M'   AND (T2.ALB <= 3.5 OR T2.ALB >= 5.5) ORDER BY T1.Birthday DESC;
SELECT      T1.ID,     CASE          WHEN T2.ALB BETWEEN 3.5 AND 5.5 THEN 'Yes'         ELSE 'No'     END AS AlbuminWithinNormalRange FROM Patient T1 JOIN Laboratory T2 ON T1.ID = T2.ID WHERE strftime('%Y', T1.Birthday) = '1982';
SELECT      CAST(SUM(CASE WHEN L.UA > 6.5 THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) AS percentage FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'F';
SELECT AVG(l.UA) AS avg_ua FROM Laboratory l JOIN Patient p ON l.ID = p.ID WHERE l.Date = (     SELECT MAX(l2.Date)     FROM Laboratory l2     WHERE l2.ID = l.ID ) AND (     (p.SEX = 'M' AND l.UA < 8.0)     OR     (p.SEX = 'F' AND l.UA < 6.5) );
SELECT DISTINCT     p.ID,     p.SEX,     p.Birthday FROM Patient AS p JOIN Laboratory AS l     ON p.ID = l.ID WHERE l.UN = 29;
SELECT DISTINCT   p.ID,   p.SEX,   p.Birthday FROM Patient AS p JOIN Laboratory AS l   ON p.ID = l.ID WHERE p.Diagnosis = 'RA'   AND l.UN < 30;
SELECT COUNT(*) FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.SEX = 'M'   AND L.CRE >= 1.5;
SELECT    CASE      WHEN SUM(CASE WHEN T1.SEX = 'M' THEN 1 ELSE 0 END) > SUM(CASE WHEN T1.SEX = 'F' THEN 1 ELSE 0 END)      THEN 'True'      ELSE 'False'    END  FROM Patient AS T1 JOIN Laboratory AS T2    ON T1.ID = T2.ID WHERE T2.CRE >= 1.5;
SELECT      T1.ID,     T1.SEX,     T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2     ON T1.ID = T2.ID WHERE T2.`T-BIL` = (     SELECT MAX(`T-BIL`)     FROM Laboratory )
SELECT      T1.SEX,     GROUP_CONCAT(DISTINCT T1.ID) AS patient_ids FROM Patient AS T1 INNER JOIN Laboratory AS T2     ON T1.ID = T2.ID WHERE T2.`T-BIL` >= 2.0 GROUP BY T1.SEX;
SELECT      T1.ID,     T2.T_CHO FROM Patient AS T1 INNER JOIN Laboratory AS T2      ON T1.ID = T2.ID ORDER BY      T1.Birthday ASC,     T2.T_CHO DESC LIMIT 1;
SELECT    CAST(SUM(YEAR(CURDATE()) - YEAR(T1.Birthday)) AS REAL) * 1.0 / COUNT(T1.ID) AS average_age FROM Patient AS T1 INNER JOIN Laboratory AS T2   ON T1.ID = T2.ID WHERE T1.SEX = 'M'   AND T2.`T-CHO` >= 250;
SELECT DISTINCT   T1.ID,   T1.Diagnosis FROM Patient AS T1 INNER JOIN Laboratory AS T2   ON T1.ID = T2.ID WHERE T2.TG > 300;
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.TG >= 200   AND (STRFTIME('%Y', 'now') - STRFTIME('%Y', T1.Birthday)) > 50;
SELECT DISTINCT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '-'   AND T2.CPK < 250;
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M'   AND YEAR(T1.Birthday) BETWEEN 1936 AND 1956   AND T2.CPK >= 250;
SELECT      T1.ID,     T1.SEX,     CAST(strftime('%Y', 'now') AS INTEGER) - CAST(strftime('%Y', T1.Birthday) AS INTEGER) AS age FROM Patient AS T1 INNER JOIN Laboratory AS T2     ON T1.ID = T2.ID WHERE T2.GLU >= 180   AND T2.`T-CHO` < 250;
SELECT T1.ID, T2.GLU FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GLU < 180 AND STRFTIME('%Y', T1.Description) = '1991'
SELECT      p.ID,     p.SEX,     p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.WBC <= 3.5 OR l.WBC >= 9.0 ORDER BY p.SEX, p.Birthday DESC;
SELECT DISTINCT   T1.ID,   T1.Diagnosis,   STRFTIME('%Y', 'NOW') - STRFTIME('%Y', T1.Birthday) AS age FROM Patient AS T1 JOIN Laboratory AS T2   ON T1.ID = T2.ID WHERE T2.RBC < 3.5;
SELECT      T1.ID,     T1.ADMISSION FROM      Patient AS T1 JOIN      Laboratory AS T2 ON      T1.ID = T2.ID WHERE      T1.SEX = 'F'     AND (STRFTIME('%Y', 'NOW') - STRFTIME('%Y', T1.Birthday)) >= 50     AND (T2.RBC <= 3.5 OR T2.RBC >= 6.0)
SELECT DISTINCT   T1.ID,   T1.SEX FROM Patient AS T1 INNER JOIN Laboratory AS T2   ON T1.ID = T2.ID WHERE   T1.Admission = '-' AND T2.HGB < 10
SELECT      T1.ID,     T1.SEX FROM Patient AS T1 INNER JOIN Laboratory AS T2     ON T1.ID = T2.ID WHERE      T1.Diagnosis = 'SLE'     AND T2.HGB > 10     AND T2.HGB < 17 ORDER BY      T1.Birthday ASC LIMIT 1;
SELECT      T1.ID,     (STRFTIME('%Y', 'NOW') - STRFTIME('%Y', T1.Birthday)) AS age FROM Patient AS T1 INNER JOIN Laboratory AS T2      ON T1.ID = T2.ID WHERE T2.HCT >= 52 GROUP BY T1.ID HAVING COUNT(T2.ID) > 2;
SELECT AVG(HCT) FROM Laboratory WHERE Date LIKE '1991%'   AND HCT < 29;
SELECT    SUM(CASE WHEN T1.PLT < 100 THEN 1 ELSE 0 END) - SUM(CASE WHEN T1.PLT > 400 THEN 1 ELSE 0 END) AS difference FROM Laboratory AS T1 WHERE T1.PLT <= 100 OR T1.PLT >= 400;
SELECT DISTINCT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE YEAR(T2.Date) = 1984   AND (YEAR(CURRENT_TIMESTAMP) - YEAR(T1.Birthday)) < 50   AND T2.PLT BETWEEN 100 AND 400
SELECT      CAST(SUM(CASE WHEN p.SEX = 'F' THEN 1 ELSE 0 END) AS FLOAT) * 100 / SUM(1) AS percentage FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE (CAST(strftime('%Y', CURRENT_TIMESTAMP) AS INTEGER) - CAST(strftime('%Y', p.Birthday) AS INTEGER)) > 55   AND l.PT >= 14;
SELECT DISTINCT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE YEAR(T1.`First Date`) > 1992 AND T2.PT < 14
SELECT COUNT(*) FROM Examination JOIN Laboratory ON Examination.ID = Laboratory.ID WHERE `Examination Date` > '1997-01-01'   AND APTT < 45;
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.APTT > 45   AND T2.Thrombosis = 0;
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M'   AND T2.WBC > 3.5   AND T2.WBC < 9.0   AND (T2.FG <= 150 OR T2.FG >= 450);
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Birthday > '1980-01-01'   AND (T2.FG < 150 OR T2.FG > 450)
SELECT DISTINCT T1.Diagnosis FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.`U-PRO` >= 30
SELECT DISTINCT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'SLE'   AND T2.`U-PRO` > 0   AND T2.`U-PRO` < 30;
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.IGG >= 2000;
SELECT COUNT(*) FROM Examination AS E JOIN Laboratory AS L   ON E.ID = L.ID WHERE L.IGG > 900   AND L.IGG < 2000   AND E.Symptoms IS NOT NULL;
SELECT T1.Diagnosis FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.IGA BETWEEN 80 AND 500 ORDER BY T2.IGA DESC LIMIT 1;
SELECT COUNT(*) FROM Patient AS T1 JOIN Laboratory AS T2   ON T1.ID = T2.ID WHERE T2.IGA > 80   AND T2.IGA < 500   AND YEAR(T1.`First Date`) >= 1990;
SELECT p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.IGM <= 40 OR l.IGM >= 400 GROUP BY p.Diagnosis ORDER BY COUNT(*) DESC LIMIT 1;
SELECT COUNT(*) FROM Patient WHERE ID IN (     SELECT ID     FROM Laboratory     WHERE CRP = '+' ) AND Description IS NULL;
SELECT COUNT(*) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.CRE >= 1.5   AND (YEAR(CURDATE()) - YEAR(T1.Birthday)) < 70;
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID INNER JOIN Examination AS T3 ON T1.ID = T3.ID WHERE T2.RA IN ('-', '+-')   AND T3.KCT = '+';
SELECT DISTINCT   T1.Diagnosis FROM Patient AS T1 INNER JOIN Laboratory AS T2   ON T1.ID = T2.ID WHERE   T1.Birthday >= '1985-01-01'   AND T2.RA IN ('-', '+-')
SELECT DISTINCT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.RF < 20   AND (YEAR(CURDATE()) - YEAR(T1.Birthday)) > 60
SELECT COUNT(*) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID INNER JOIN Examination AS T3 ON T1.ID = T3.ID WHERE T2.RF < 20   AND T3.Thrombosis = 0;
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID INNER JOIN Examination AS T3 ON T1.ID = T3.ID WHERE T2.C3 > 35   AND T3.ANA_Pattern = 'P';
SELECT T1.ID FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.HCT <= 29 OR T2.HCT >= 52 ORDER BY T1.`aCL IgA` DESC LIMIT 1;
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE e.Thrombosis = 1   AND l.C4 > 10;
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.RNP IN ('-', '+-')   AND T1.Admission = '+';
SELECT T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.RNP NOT IN ('-', '+-') ORDER BY T1.Birthday DESC LIMIT 1;
SELECT COUNT(*) FROM Examination AS E JOIN Laboratory AS L   ON E.ID = L.ID WHERE L.SM IN ('-', '+-')   AND E.Thrombosis = 0;
SELECT DISTINCT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.SM NOT IN ('negative', '0') ORDER BY T1.Birthday DESC LIMIT 3;
SELECT DISTINCT T1.ID FROM Examination AS T1 INNER JOIN Laboratory AS T2   ON T1.ID = T2.ID WHERE T1.`Examination Date` > '1997-01-01'   AND T2.SC170 IN ('negative', '0');
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID INNER JOIN Examination AS T3 ON T1.ID = T3.ID WHERE T2.SC170 IN ('negative', '0')   AND T1.SEX = 'F'   AND T3.Symptoms IS NULL;
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.SSA IN ('-', '+-')   AND YEAR(T1.`First Date`) < 2000;
SELECT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.SSA NOT IN ('negative', '0') ORDER BY T1.`First Date` ASC LIMIT 1;
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.SSB IN ('-', '+-') AND T1.Diagnosis = 'SLE';
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SSB IN ('negative', '0')   AND T2.Symptoms IS NOT NULL;
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.CENTROMEA IN ('-', '+-')   AND T2.SSB IN ('-', '+-')   AND T1.SEX = 'M';
SELECT DISTINCT   T1.Diagnosis FROM Patient AS T1 JOIN Laboratory AS T2   ON T1.ID = T2.ID WHERE T2.DNA >= 8;
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.DNA < 8   AND T1.Description IS NULL;
SELECT COUNT(*)  FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.IGG > 900    AND L.IGG < 2000    AND P.Admission = '+';
SELECT    CAST(COUNT(CASE WHEN T1.GOT >= 60 AND T2.Diagnosis = 'SLE' THEN T1.ID END) AS REAL) * 100 / COUNT(CASE WHEN T1.GOT >= 60 THEN T1.ID END) FROM Laboratory AS T1 JOIN Patient AS T2   ON T1.ID = T2.ID WHERE T1.GOT >= 60;
SELECT COUNT(*) FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.SEX = 'M'   AND L.GOT < 60;
SELECT MAX(T1.Birthday) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GOT >= 60;
SELECT DISTINCT T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GPT < 60 ORDER BY T2.GPT DESC LIMIT 3
SELECT COUNT(*)  FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GOT < 60   AND T1.SEX = 'M';
SELECT T1.`First Date` FROM `Patient` AS T1 INNER JOIN `Laboratory` AS T2 ON T1.`ID` = T2.`ID` WHERE T2.`LDH` < 500 ORDER BY T2.`LDH` DESC LIMIT 1;
SELECT MAX(T1.Date) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.LDH >= 500 AND T2.ID = (     SELECT ID     FROM Patient     ORDER BY `First Date` DESC     LIMIT 1 );
SELECT COUNT(*)  FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.ALP >= 300   AND T1.Admission = '+';
SELECT COUNT(*) FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.Admission = '-'   AND L.ALP < 300;
SELECT DISTINCT   T1.Diagnosis FROM Patient AS T1 JOIN Laboratory AS T2   ON T1.ID = T2.ID WHERE   T2.TP < 6.0;
SELECT COUNT(*) FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.Diagnosis = 'SJS'   AND L.TP > 6.0   AND L.TP < 8.5;
SELECT T1.`Examination Date` FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.ALB > 3.5   AND T2.ALB < 5.5 ORDER BY T2.ALB DESC LIMIT 1;
SELECT COUNT(*) FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.SEX = 'M'   AND L.ALB > 3.5   AND L.ALB < 5.5   AND L.TP BETWEEN 6.0 AND 8.5;
SELECT e.`aCL IgG`, e.`aCL IgM`, e.`aCL IgA` FROM Patient p JOIN Laboratory l ON p.ID = l.ID JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'F'   AND l.UA > 6.50 ORDER BY l.UA DESC LIMIT 1;
SELECT MAX(T1.ANA) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.CRE < 1.5;
SELECT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID INNER JOIN Examination AS T3 ON T1.ID = T3.ID WHERE T2.CRE < 1.5 ORDER BY T3.`aCL IgA` DESC LIMIT 1;
SELECT COUNT(*) FROM Patient AS p JOIN Laboratory AS l ON p.ID = l.ID JOIN Examination AS e ON p.ID = e.ID WHERE l.`T-BIL` >= 2.0   AND e.`ANA Pattern` LIKE '%P%';
SELECT T1.ANA FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.`T-BIL` < 2.0 ORDER BY T2.`T-BIL` DESC LIMIT 1;
SELECT COUNT(*) FROM Examination AS E JOIN Laboratory AS L   ON E.ID = L.ID WHERE L.`T-CHO` >= 250   AND E.KCT = '-';
SELECT COUNT(*) FROM Patient AS p JOIN Laboratory AS l ON p.ID = l.ID JOIN Examination AS e ON p.ID = e.ID WHERE l.`T-CHO` < 250   AND e.`ANA Pattern` = 'P';
SELECT COUNT(*) FROM Examination AS E JOIN Patient AS P ON E.ID = P.ID JOIN Laboratory AS L ON E.ID = L.ID WHERE L.TG < 200   AND E.Symptoms IS NOT NULL;
SELECT T1.Diagnosis FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.TG < 200 ORDER BY T2.TG DESC LIMIT 1;
SELECT DISTINCT T1.ID FROM Examination AS T1 JOIN Laboratory AS T2   ON T1.ID = T2.ID WHERE T1.Thrombosis = 0   AND T2.CPK < 250;
SELECT COUNT(*) FROM Examination AS E JOIN Patient AS P ON E.ID = P.ID JOIN Laboratory AS L ON E.ID = L.ID WHERE L.CPK < 250   AND (E.KCT = '+' OR E.RVVT = '+' OR E.LAC = '+');
SELECT T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GLU > 180 ORDER BY T1.Birthday ASC LIMIT 1;
SELECT COUNT(*) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID INNER JOIN Examination AS T3 ON T1.ID = T3.ID WHERE T2.GLU < 180   AND T3.Thrombosis = 0;
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '+'   AND T2.WBC BETWEEN 3.5 AND 9.0;
SELECT COUNT(*) FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.Diagnosis = 'SLE'   AND L.WBC BETWEEN 3.5 AND 9.0;
SELECT DISTINCT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE (T2.RBC <= 3.5 OR T2.RBC >= 6.0)   AND T1.Admission = '-'
SELECT COUNT(*)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.PLT > 100    AND l.PLT < 400   AND p.Diagnosis IS NOT NULL;
SELECT T1.PLT FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'MCTD'   AND T1.PLT > 100   AND T1.PLT < 400;
SELECT AVG(T1.PT) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.SEX = 'M'   AND T1.PT < 14;
SELECT COUNT(*) FROM Examination AS E JOIN Laboratory AS L   ON E.ID = L.ID WHERE E.Thrombosis IN (1, 2)   AND L.PT < 14;
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Angela' AND T1.last_name = 'Sanders'
SELECT COUNT(*)  FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.college = 'College of Engineering';
SELECT DISTINCT   m.first_name,   m.last_name FROM member AS m JOIN major AS ma   ON m.link_to_major = ma.major_id WHERE ma.department = 'Art and Design';
SELECT COUNT(*)  FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id JOIN major maj ON m.link_to_major = maj.major_id WHERE e.event_name = 'Women''s Soccer'   AND maj.major_name = 'Student_Club';
SELECT DISTINCT T1.phone FROM member AS T1 INNER JOIN attendance AS T2 ON T1.member_id = T2.link_to_member INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'Women''s Soccer'
SELECT COUNT(*)  FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer'   AND m.position = 'Student_Club'   AND m.t_shirt_size = 'Medium';
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.position = 'Student_Club' GROUP BY e.event_id, e.event_name ORDER BY COUNT(a.link_to_event) DESC LIMIT 1;
SELECT m.college FROM member me JOIN major m ON me.link_to_major = m.major_id WHERE me.position = 'Vice President'
SELECT DISTINCT T1.event_name FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T3.first_name = 'Maya' AND T3.last_name = 'Mclean'
SELECT COUNT(*) FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE e.type = 'Student_Club'   AND m.first_name = 'Sacha'   AND m.last_name = 'Harrison'   AND YEAR(e.event_date) = 2019;
SELECT COUNT(*)  FROM event e JOIN attendance a ON e.event_id = a.link_to_event GROUP BY e.event_id HAVING COUNT(a.link_to_member) > 10    AND e.type = 'Meeting';
SELECT T1.event_name FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.type != 'Fundraiser' GROUP BY T1.event_id HAVING COUNT(T2.link_to_member) > 20
SELECT      CAST(COUNT(a.link_to_event) AS REAL) / COUNT(DISTINCT e.event_name) AS average_attendance FROM event e JOIN attendance a ON e.event_id = a.link_to_event WHERE e.type = 'Meeting'      AND strftime('%Y', e.event_date) = '2020';
SELECT expense_description FROM expense ORDER BY cost DESC LIMIT 1;
SELECT COUNT(*)  FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Environmental Engineering';
SELECT DISTINCT     T1.first_name,     T1.last_name FROM member AS T1 JOIN attendance AS T2     ON T1.member_id = T2.link_to_member JOIN event AS T3     ON T2.link_to_event = T3.event_id WHERE     T3.event_name = 'Laugh Out Loud'
SELECT DISTINCT T1.last_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Law and Constitutional Studies'
SELECT T3.county FROM member AS T1 INNER JOIN zip_code AS T3 ON T1.zip = T3.zip_code WHERE T1.first_name = 'Sherri' AND T1.last_name = 'Ramsey'
SELECT DISTINCT m.college FROM member AS mem JOIN major AS m ON mem.link_to_major = m.major_id WHERE mem.first_name = 'Tyler' AND mem.last_name = 'Hewitt';
SELECT T1.amount FROM income AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.position = 'Vice President'
SELECT      SUM(T1.spent) FROM budget AS T1 INNER JOIN event AS T2     ON T1.link_to_event = T2.event_id WHERE      T1.category = 'Food'     AND T2.event_name = 'September Meeting'
SELECT DISTINCT   z.city,   z.state FROM member AS m JOIN zip_code AS z   ON m.zip = z.zip_code WHERE m.position = 'President';
SELECT DISTINCT     T1.first_name,     T1.last_name FROM member AS T1 JOIN zip_code AS T2     ON T1.zip = T2.zip_code WHERE     T2.state = 'Illinois'
SELECT SUM(T1.spent) FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Advertisement'   AND T2.event_name = 'September Meeting'
SELECT DISTINCT T1.department FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Pierce' AND T2.last_name = 'Guidi'
SELECT SUM(T1.amount) FROM budget AS T1 JOIN event AS T2   ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'October Speaker'
SELECT      e.expense_description,     e.approved FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.event_name = 'October Meeting'   AND ev.event_date = '2019-10-08';
SELECT AVG(T1.cost) FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Elijah'   AND T2.last_name = 'Allen'   AND (SUBSTR(T1.expense_date, 6, 2) = '09' OR SUBSTR(T1.expense_date, 6, 2) = '10');
SELECT      SUM(CASE WHEN SUBSTR(e.event_date, 1, 4) = '2019' THEN b.spent ELSE 0 END) -     SUM(CASE WHEN SUBSTR(e.event_date, 1, 4) = '2020' THEN b.spent ELSE 0 END) AS difference FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE SUBSTR(e.event_date, 1, 4) IN ('2019', '2020');
SELECT location FROM event WHERE event_name = 'Spring Budget Review';
SELECT T1.cost FROM expense AS T1 WHERE T1.expense_description = 'Posters'   AND T1.expense_date = '2019-09-04'
SELECT remaining FROM budget WHERE category = 'Food' ORDER BY amount DESC LIMIT 1;
SELECT notes FROM income WHERE source = 'Fundraising'   AND date_received = '2019-09-14';
SELECT COUNT(*)  FROM major  WHERE college = 'College of Humanities and Social Sciences';
SELECT phone FROM member WHERE first_name = 'Carlo' AND last_name = 'Jacobs';
SELECT T3.county FROM member AS T1 JOIN zip_code AS T3 ON T1.zip = T3.zip_code WHERE T1.first_name = 'Adela' AND T1.last_name = 'O''Gallagher';
SELECT COUNT(*)  FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'November Meeting'   AND b.remaining < 0;
SELECT SUM(T1.amount) FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'September Speaker'
SELECT T1.event_status FROM budget AS T1 INNER JOIN expense AS T2 ON T1.budget_id = T2.link_to_budget WHERE T2.expense_description = 'Post Cards, Posters' AND T2.expense_date = '2019-8-20'
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Brent' AND T1.last_name = 'Thomason'
SELECT COUNT(*)  FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Business'    AND m.t_shirt_size = 'Medium';
SELECT z.type FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Christof' AND m.last_name = 'Nielson';
SELECT T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Vice President'
SELECT z.state FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison';
SELECT DISTINCT m.department FROM major m JOIN member mem ON m.major_id = mem.link_to_major WHERE mem.position = 'President';
SELECT T1.date_received FROM income AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Connor' AND T2.last_name = 'Hilton' AND T1.source = 'Dues'
SELECT      m.first_name,     m.last_name FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.source = 'Dues' ORDER BY i.date_received ASC LIMIT 1;
SELECT    SUM(CASE WHEN T1.event_name = 'Yearly Kickoff' THEN T2.amount ELSE 0 END) * 1.0 /    SUM(CASE WHEN T1.event_name = 'October Meeting' THEN T2.amount ELSE 0 END) AS ratio FROM event T1 INNER JOIN budget T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Advertisement';
SELECT      CAST(SUM(CASE WHEN T1.category = 'Parking' THEN T1.amount ELSE 0 END) AS REAL) * 100 / SUM(T1.amount) FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'November Speaker'
SELECT SUM(T1.cost) FROM expense AS T1 WHERE T1.expense_description = 'Pizza'
SELECT COUNT(DISTINCT city)  FROM zip_code  WHERE county = 'Orange County'    AND state = 'Virginia';
SELECT DISTINCT department FROM major WHERE college = 'College of Humanities and Social Sciences';
SELECT z.city, z.county, z.state FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Amy' AND m.last_name = 'Firth';
SELECT T1.expense_description FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id WHERE T2.remaining = (     SELECT MIN(remaining)     FROM budget )
SELECT DISTINCT m.* FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'October Meeting';
SELECT T1.college FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major GROUP BY T1.college ORDER BY COUNT(T2.member_id) DESC LIMIT 1;
SELECT T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.phone = '809-555-3360'
SELECT T1.event_name FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event ORDER BY T2.amount DESC LIMIT 1;
SELECT T1.expense_description FROM expense AS T1 INNER JOIN member AS T2   ON T1.link_to_member = T2.member_id WHERE T2.position = 'Vice President';
SELECT COUNT(*)  FROM attendance a JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer';
SELECT T1.date_received FROM income AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Casey' AND T2.last_name = 'Mason'
SELECT COUNT(*)  FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE z.state = 'Maryland';
SELECT COUNT(*)  FROM attendance a JOIN member m ON a.link_to_member = m.member_id WHERE m.phone = '954-555-6240';
SELECT DISTINCT   m.first_name,   m.last_name FROM member AS m JOIN major AS ma   ON m.link_to_major = ma.major_id WHERE ma.department = 'School of Applied Sciences, Technology and Education';
SELECT      T1.event_name FROM event AS T1 INNER JOIN budget AS T2     ON T1.event_id = T2.link_to_event WHERE T1.status = 'Closed' ORDER BY T2.spent / T2.amount DESC LIMIT 1;
SELECT COUNT(*)  FROM member  WHERE position = 'President';
SELECT MAX(spent) FROM budget;
SELECT COUNT(*)  FROM event  WHERE type = 'Meeting'    AND YEAR(event_date) = 2020;
SELECT SUM(spent) FROM budget WHERE category = 'Food'
SELECT      m.first_name,     m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member GROUP BY m.member_id, m.first_name, m.last_name HAVING COUNT(a.link_to_event) > 7;
SELECT DISTINCT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id INNER JOIN attendance AS T3 ON T1.member_id = T3.link_to_member INNER JOIN event AS T4 ON T3.link_to_event = T4.event_id WHERE T2.major_name = 'Interior Design'   AND T4.event_name = 'Community Theater';
SELECT DISTINCT   T1.first_name,   T1.last_name FROM member AS T1 JOIN zip_code AS T2   ON T1.zip = T2.zip_code WHERE   T2.city = 'Georgetown' AND T2.state = 'South Carolina';
SELECT SUM(T1.amount) FROM income AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Grant' AND T2.last_name = 'Gilmour'
SELECT      m.first_name,     m.last_name FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.amount > 40;
SELECT SUM(T1.cost) FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'Yearly Kickoff'
SELECT DISTINCT      m.first_name,      m.last_name FROM member m JOIN budget b ON m.member_id = b.link_to_event JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'Yearly Kickoff';
SELECT      m.first_name,     m.last_name,     i.source FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.amount = (     SELECT MAX(amount)     FROM income );
SELECT T1.event_name FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event JOIN expense AS T3 ON T2.budget_id = T3.link_to_budget ORDER BY T3.cost ASC LIMIT 1;
SELECT    CAST(SUM(CASE WHEN T1.event_name = 'Yearly Kickoff' THEN T3.cost ELSE 0 END) AS REAL) * 100 / SUM(T3.cost) AS percentage FROM event T1 JOIN budget T2 ON T1.event_id = T2.link_to_event JOIN expense T3 ON T2.budget_id = T3.link_to_budget
SELECT    SUM(CASE WHEN m.major_name = 'Finance' THEN 1 ELSE 0 END) * 1.0 /    SUM(CASE WHEN m.major_name = 'Physics' THEN 1 ELSE 0 END) AS ratio FROM major m;
SELECT source FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' ORDER BY amount DESC LIMIT 1;
SELECT      first_name,      last_name,      email FROM      member WHERE      position = 'Secretary';
SELECT COUNT(*)  FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Physics Teaching';
SELECT COUNT(*)  FROM attendance a JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Community Theater'    AND YEAR(e.event_date) = 2019;
SELECT COUNT(T1.event_id) AS number_of_events, T3.major_name FROM attendance AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id INNER JOIN major AS T3 ON T2.link_to_major = T3.major_id WHERE T2.first_name = 'Luisa' AND T2.last_name = 'Guidi' GROUP BY T3.major_name
SELECT      SUM(b.spent) / COUNT(b.spent) AS average_spent_on_food FROM      budget b WHERE      b.category = 'Food'     AND b.event_status = 'Closed';
SELECT T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Advertisement' ORDER BY T2.spent DESC LIMIT 1;
SELECT    CASE      WHEN COUNT(*) > 0 THEN 'Yes'      ELSE 'No'    END AS attended FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE e.event_name = 'Women''s Soccer'   AND m.first_name = 'Maya'   AND m.last_name = 'Mclean';
SELECT      CAST(SUM(CASE WHEN type = 'Community Service' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(event_id) AS percentage FROM event WHERE event_date BETWEEN '2019-01-01' AND '2019-12-31';
SELECT T1.cost FROM expense AS T1 INNER JOIN budget AS T2   ON T1.link_to_budget = T2.budget_id INNER JOIN event AS T3   ON T2.link_to_event = T3.event_id WHERE T1.expense_description = 'Posters'   AND T3.event_name = 'September Speaker';
SELECT t_shirt_size FROM member GROUP BY t_shirt_size ORDER BY COUNT(t_shirt_size) DESC LIMIT 1;
SELECT T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.status = 'Closed' AND T2.remaining < 0 ORDER BY T2.remaining ASC LIMIT 1;
SELECT      T1.expense_description,     SUM(T1.cost) AS total_value FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'October Meeting'   AND T1.approved = 'Yes' GROUP BY T1.expense_description;
SELECT      SUM(b.amount) AS total_budgeted,     b.category FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'April Speaker' GROUP BY b.category ORDER BY b.amount ASC;
SELECT MAX(amount) FROM budget WHERE category = 'Food';
SELECT amount FROM budget WHERE category = 'Advertisement' ORDER BY amount DESC LIMIT 3;
SELECT SUM(cost)  FROM expense  WHERE expense_description = 'Parking'
SELECT SUM(cost) AS total_expense FROM expense WHERE expense_date = '2019-08-20';
SELECT      m.first_name,     m.last_name,     SUM(e.cost) AS total_cost FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE m.member_id = 'rec4BLdZHS2Blfp4v' GROUP BY m.first_name, m.last_name;
SELECT T1.expense_description FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Sacha' AND T2.last_name = 'Harrison'
SELECT DISTINCT T1.expense_description FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.t_shirt_size = 'X-Large'
SELECT DISTINCT T1.zip FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.cost < 50
SELECT T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Phillip' AND T1.last_name = 'Cullen'
SELECT DISTINCT T1.position FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Business'
SELECT COUNT(*)  FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Business'    AND m.t_shirt_size = 'Medium';
SELECT DISTINCT T1.type FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.remaining > 30
SELECT DISTINCT type FROM event WHERE location = 'MU 215';
SELECT type FROM event WHERE event_date = '2020-03-24T12:00:00';
SELECT T1.major_name FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.position = 'Vice President'
SELECT    CAST(SUM(CASE WHEN m.position = 'Member' AND ma.major_name = 'Business' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(m.member_id) AS percentage FROM member m LEFT JOIN major ma ON m.link_to_major = ma.major_id;
SELECT DISTINCT type FROM event WHERE location = 'MU 215';
SELECT COUNT(*)  FROM income  WHERE amount = 50;
SELECT COUNT(*)  FROM member  WHERE position = 'Member'    AND t_shirt_size = 'X-Large';
SELECT COUNT(*)  FROM major  WHERE college = 'College of Agriculture and Applied Sciences'    AND department = 'School of Applied Sciences, Technology and Education';
SELECT      m.last_name,     ma.department,     ma.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Environmental Engineering';
SELECT T1.category FROM budget AS T1 JOIN event AS T2   ON T1.link_to_event = T2.event_id WHERE T2.location = 'MU 215'   AND T2.type = 'Guest Speaker'   AND T1.spent = 0;
SELECT DISTINCT   z.city,   z.state FROM member AS m JOIN major AS ma ON m.link_to_major = ma.major_id JOIN zip_code AS z ON m.zip = z.zip_code WHERE ma.department = 'Electrical and Computer Engineering'   AND m.position = 'Member';
SELECT DISTINCT T1.event_name FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T1.type = 'Social'   AND T3.position = 'Vice President'   AND T1.location = '900 E. Washington St.';
SELECT      m.last_name,     m.position FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.expense_description = 'Pizza'   AND e.expense_date = '2019-09-10';
SELECT DISTINCT T1.last_name FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T1.position = 'Member'   AND T3.event_name = 'Women''s Soccer';
SELECT      CAST(SUM(CASE WHEN i.amount = 50 THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(m.member_id) AS percentage FROM member m LEFT JOIN income i ON m.member_id = i.link_to_member WHERE m.t_shirt_size = 'Medium'
SELECT DISTINCT state FROM zip_code WHERE type = 'PO Box'
SELECT zip_code FROM zip_code WHERE type = 'PO Box'   AND county = 'San Juan Municipio'   AND state = 'Puerto Rico';
SELECT event_name FROM event WHERE type = 'Game'   AND status = 'Closed'   AND event_date BETWEEN '2019-03-15' AND '2020-03-20';
SELECT DISTINCT T1.link_to_event FROM expense AS T1 WHERE T1.cost > 50
SELECT DISTINCT      m.first_name,     m.last_name,     a.link_to_event FROM member m JOIN expense e ON m.member_id = e.link_to_member JOIN attendance a ON m.member_id = a.link_to_member WHERE e.approved = 'true'   AND e.expense_date BETWEEN '2019-01-10' AND '2019-11-19';
SELECT T2.college FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Katy'   AND T1.link_to_major = 'rec1N0upiVLy5esTO';
SELECT T1.phone FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.college = 'College of Agriculture and Applied Sciences'   AND T2.major_name = 'Business'
SELECT DISTINCT m.email FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost > 20   AND e.expense_date BETWEEN '2019-09-10' AND '2019-11-19';
SELECT COUNT(*)  FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.college = 'College of Education & Human Services';
SELECT    CAST(SUM(CASE WHEN T1.remaining < 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.event_id) AS percentage FROM budget AS T1
SELECT      event_id,     location,     status FROM      event WHERE      event_date BETWEEN '2019-11-01' AND '2020-03-31';
SELECT expense_description FROM expense GROUP BY expense_description HAVING SUM(cost) / COUNT(expense_id) > 50;
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large';
SELECT      CAST(SUM(CASE WHEN type = 'PO Box' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(zip_code) AS percentage FROM      zip_code;
SELECT      e.event_name,     e.location FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.remaining > 0;
SELECT DISTINCT T1.event_name, T1.event_date FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event JOIN expense AS T3 ON T2.budget_id = T3.link_to_budget WHERE T3.expense_description = 'Pizza'   AND T3.cost > 50   AND T3.cost < 100
SELECT DISTINCT     T1.first_name,     T1.last_name,     T3.major_name FROM member AS T1 INNER JOIN expense AS T2     ON T1.member_id = T2.link_to_member INNER JOIN major AS T3     ON T1.link_to_major = T3.major_id WHERE T2.cost > 100;
SELECT DISTINCT z.city, z.state FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id JOIN income i ON m.member_id = i.link_to_member JOIN zip_code z ON m.zip = z.zip_code GROUP BY e.event_id HAVING COUNT(i.income_id) > 40;
SELECT e.cost FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id WHERE e.link_to_member IN (     SELECT e2.link_to_member     FROM expense e2     JOIN budget b2 ON e2.link_to_budget = b2.budget_id     GROUP BY e2.link_to_member     HAVING COUNT(DISTINCT b2.link_to_event) > 1 ) ORDER BY e.cost DESC LIMIT 1;
SELECT      SUM(e.cost) / COUNT(ev.event_id) AS average_amount_paid FROM member m JOIN expense e ON m.member_id = e.link_to_member JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE m.position != 'Member';
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event JOIN expense ex ON b.budget_id = ex.link_to_budget WHERE b.category = 'Parking' AND ex.cost < (     SELECT SUM(ex2.cost) / COUNT(DISTINCT e2.event_id)     FROM event e2     JOIN budget b2 ON e2.event_id = b2.link_to_event     JOIN expense ex2 ON b2.budget_id = ex2.link_to_budget     WHERE b2.category = 'Parking' );
SELECT      SUM(e.cost) * 100.0 / COUNT(ev.event_id) AS percentage FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.type = 'Meeting';
SELECT T1.budget_id FROM budget AS T1 INNER JOIN expense AS T2 ON T1.budget_id = T2.link_to_budget WHERE T2.expense_description = 'Water, chips, cookies' ORDER BY T2.cost DESC LIMIT 1;
SELECT      T1.first_name,     T1.last_name FROM member AS T1 INNER JOIN expense AS T2     ON T1.member_id = T2.link_to_member ORDER BY T2.cost DESC LIMIT 5;
SELECT      m.first_name,     m.last_name,     m.phone FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost > (SELECT AVG(cost) FROM expense);
SELECT    (     SUM(CASE WHEN z.state = 'New Jersey' THEN 1 ELSE 0 END) * 1.0 / COUNT(CASE WHEN m.position = 'Member' THEN 1 END)   ) - (     SUM(CASE WHEN z.state = 'Vermont' THEN 1 ELSE 0 END) * 1.0 / COUNT(CASE WHEN m.position = 'Member' THEN 1 END)   ) AS percentage_difference FROM member m JOIN zip_code z ON m.zip = z.zip_code;
SELECT      m.major_name,     m.department FROM member AS mem JOIN major AS m ON mem.link_to_major = m.major_id WHERE      mem.first_name = 'Garrett'      AND mem.last_name = 'Gerke';
SELECT      m.first_name,     m.last_name,     e.cost FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.expense_description = 'Water, Veggie tray, supplies';
SELECT      m.last_name,     m.phone FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Elementary Education';
SELECT      T1.category,      T1.amount FROM budget AS T1 INNER JOIN event AS T2     ON T1.link_to_event = T2.event_id WHERE      T2.event_name = 'January Speaker';
SELECT DISTINCT T1.event_name FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Food'
SELECT      m.first_name,     m.last_name,     i.amount FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.date_received = '9/9/2019';
SELECT b.category FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id WHERE e.expense_description = 'Posters';
SELECT      m.first_name,     m.last_name,     ma.college FROM member m LEFT JOIN major ma ON m.link_to_major = ma.major_id WHERE m.position = 'Secretary';
SELECT      SUM(b.spent) AS total_spent,     e.event_name FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE b.category = 'Speaker Gifts' GROUP BY e.event_name;
SELECT T3.city FROM member AS T1 INNER JOIN zip_code AS T3 ON T1.zip = T3.zip_code WHERE T1.first_name = 'Garrett' AND T1.last_name = 'Gerke'
SELECT      m.first_name,     m.last_name,     m.position FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE z.city = 'Lincolnton'   AND z.state = 'North Carolina'   AND z.zip_code = 28092;
SELECT COUNT(*)  FROM gasstations  WHERE Country = 'CZE'    AND Segment = 'Premium';
SELECT    CAST(COUNT(CASE WHEN Currency = 'EUR' THEN 1 END) AS REAL) * 1.0 /    COUNT(CASE WHEN Currency = 'CZK' THEN 1 END) AS ratio FROM customers;
SELECT T1.CustomerID FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Segment = 'LAM'   AND T1.Date BETWEEN '201201' AND '201212' ORDER BY T1.Consumption ASC LIMIT 1;
SELECT      AVG(T1.Consumption) / 12 AS average_monthly_consumption FROM yearmonth AS T1 INNER JOIN customers AS T2     ON T1.CustomerID = T2.CustomerID WHERE T2.Segment = 'SME'   AND T1.Date BETWEEN '201301' AND '201312';
SELECT c.CustomerID FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Currency = 'CZK'   AND ym.Date BETWEEN '201101' AND '201112' GROUP BY c.CustomerID ORDER BY SUM(ym.Consumption) DESC LIMIT 1;
SELECT COUNT(DISTINCT c.CustomerID) FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Segment = 'KAM'   AND ym.Date BETWEEN '201201' AND '201212'   AND ym.Consumption < 30000;
SELECT    (SELECT SUM(T1.Consumption)     FROM yearmonth AS T1    INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID    WHERE T2.Currency = 'CZK'       AND T1.Date BETWEEN '201201' AND '201212')    -    (SELECT SUM(T1.Consumption)     FROM yearmonth AS T1    INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID    WHERE T2.Currency = 'EUR'       AND T1.Date BETWEEN '201201' AND '201212') AS difference
SELECT      SUBSTR(ym.Date, 1, 4) AS year FROM      yearmonth ym JOIN      customers c ON ym.CustomerID = c.CustomerID WHERE      c.Currency = 'EUR' GROUP BY      SUBSTR(ym.Date, 1, 4) ORDER BY      SUM(ym.Consumption) DESC LIMIT 1;
SELECT      c.Segment FROM      customers c JOIN      yearmonth ym ON c.CustomerID = ym.CustomerID GROUP BY      c.Segment ORDER BY      SUM(ym.Consumption) ASC LIMIT 1;
SELECT      SUBSTR(ym.Date, 1, 4) AS year FROM      yearmonth ym JOIN      customers c ON ym.CustomerID = c.CustomerID WHERE      c.Currency = 'CZK' GROUP BY      SUBSTR(ym.Date, 1, 4) ORDER BY      SUM(ym.Consumption) DESC LIMIT 1;
SELECT ym.Date FROM yearmonth ym JOIN customers c ON ym.CustomerID = c.CustomerID WHERE c.Segment = 'SME'   AND ym.Date BETWEEN '201301' AND '201312' ORDER BY ym.Consumption DESC LIMIT 1;
WITH customer_consumption_2013 AS (     SELECT          c.CustomerID,         c.Segment,         SUM(ym.Consumption) AS total_consumption     FROM customers c     JOIN yearmonth ym ON c.CustomerID = ym.CustomerID     WHERE ym.Date BETWEEN '201301' AND '201312'     GROUP BY c.CustomerID, c.Segment ), min_consumption_per_segment AS (     SELECT          Segment,         MIN(total_consumption) AS min_consumption     FROM customer_consumption_2013     GROUP BY Segment ), lowest_consumption_customers AS (     SELECT          cc.Segment,         cc.total_consumption     FROM customer_consumption_2013 cc     JOIN min_consumption_per_segment mcs          ON cc.Segment = mcs.Segment          AND cc.total_consumption = mcs.min_consumption ), segment_averages AS (     SELECT          Segment,         AVG(total_consumption) AS avg_consumption     FROM lowest_consumption_customers     GROUP BY Segment ) SELECT      (SELECT avg_consumption FROM segment_averages WHERE Segment = 'SME') -      (SELECT avg_consumption FROM segment_averages WHERE Segment = 'LAM') AS sme_lam_diff,     (SELECT avg_consumption FROM segment_averages WHERE Segment = 'LAM') -      (SELECT avg_consumption FROM segment_averages WHERE Segment = 'KAM') AS lam_kam_diff,     (SELECT avg_consumption FROM segment_averages WHERE Segment = 'KAM') -      (SELECT avg_consumption FROM segment_averages WHERE Segment = 'SME') AS kam_sme_diff FROM (SELECT 1) AS dummy;
WITH segment_consumption AS (     SELECT          c.Segment,         SUM(CASE WHEN substr(ym.Date, 1, 4) = '2012' THEN ym.Consumption ELSE 0 END) AS consumption_2012,         SUM(CASE WHEN substr(ym.Date, 1, 4) = '2013' THEN ym.Consumption ELSE 0 END) AS consumption_2013     FROM customers c     JOIN yearmonth ym ON c.CustomerID = ym.CustomerID     WHERE c.Currency = 'EUR'       AND c.Segment IN ('SME', 'LAM', 'KAM')     GROUP BY c.Segment ), percentage_increase AS (     SELECT          Segment,         consumption_2012,         consumption_2013,         ((consumption_2013 - consumption_2012) / consumption_2013) * 100 AS pct_increase     FROM segment_consumption     WHERE consumption_2013 > 0 ) SELECT      (SELECT Segment FROM percentage_increase ORDER BY pct_increase DESC LIMIT 1) AS biggest_increase_segment,     (SELECT Segment FROM percentage_increase ORDER BY pct_increase ASC LIMIT 1) AS lowest_increase_segment FROM percentage_increase LIMIT 1;
SELECT SUM(Consumption)  FROM yearmonth  WHERE CustomerID = 6    AND Date BETWEEN '201308' AND '201311'
SELECT      (SELECT COUNT(*)       FROM gasstations       WHERE Country = 'CZE' AND Segment = 'Discount') -      (SELECT COUNT(*)       FROM gasstations       WHERE Country = 'SVK' AND Segment = 'Discount') AS difference;
SELECT      (SELECT Consumption FROM yearmonth WHERE CustomerID = 7 AND Date = '201304') -      (SELECT Consumption FROM yearmonth WHERE CustomerID = 5 AND Date = '201304') AS difference;
SELECT    (SELECT COUNT(*) FROM customers WHERE Segment = 'SME' AND Currency = 'CZK') -    (SELECT COUNT(*) FROM customers WHERE Segment = 'SME' AND Currency = 'EUR') AS difference
SELECT T1.CustomerID FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM'   AND T1.Currency = 'EUR'   AND T2.Date = '201310' ORDER BY T2.Consumption DESC LIMIT 1;
SELECT c.CustomerID, y.Consumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'KAM' ORDER BY y.Consumption DESC LIMIT 1;
SELECT SUM(T1.Consumption) FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Segment = 'KAM'   AND T1.Date = '201305';
SELECT    CAST(SUM(CASE WHEN T2.Consumption > 46.73 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM customers AS T1 INNER JOIN yearmonth AS T2   ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM'
SELECT      Country,     COUNT(*) AS TotalValueForMoneyGasStations FROM gasstations WHERE Segment = 'Value for money' GROUP BY Country ORDER BY TotalValueForMoneyGasStations DESC;
SELECT    CAST(SUM(CASE WHEN T1.Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM customers AS T1 WHERE T1.Segment = 'KAM';
SELECT    CAST(SUM(CASE WHEN T1.Consumption > 528.3 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM yearmonth AS T1 WHERE T1.Date = '201202'
SELECT    CAST(SUM(CASE WHEN T1.Segment = 'Premium' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM gasstations AS T1 WHERE T1.Country = 'SVK';
SELECT CustomerID FROM yearmonth WHERE Date = '201309' ORDER BY Consumption DESC LIMIT 1;
SELECT      c.Segment FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE ym.Date = '201309' ORDER BY ym.Consumption ASC LIMIT 1;
SELECT T1.CustomerID FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'SME' AND T2.Date = '201206' ORDER BY T2.Consumption ASC LIMIT 1;
SELECT MAX(Consumption) FROM yearmonth WHERE Date LIKE '2012%';
SELECT MAX(T1.total_consumption / 12) AS max_monthly_consumption FROM (     SELECT CustomerID, SUM(Consumption) AS total_consumption     FROM yearmonth     GROUP BY CustomerID ) AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Currency = 'EUR'
SELECT DISTINCT T1.Description FROM products AS T1 INNER JOIN transactions_1k AS T2 ON T1.ProductID = T2.ProductID WHERE T2.Date LIKE '2013-09%'
SELECT DISTINCT gs.Country FROM gasstations gs JOIN transactions_1k t ON gs.GasStationID = t.GasStationID WHERE strftime('%Y%m', t.Date) = '201306';
SELECT DISTINCT gs.ChainID FROM gasstations gs JOIN transactions_1k t ON gs.GasStationID = t.GasStationID JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR';
SELECT DISTINCT p.Description FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR';
SELECT AVG(Price)  FROM transactions_1k  WHERE Date LIKE '2012-01%';
SELECT COUNT(*) FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Currency = 'EUR'   AND ym.Consumption > 1000;
SELECT DISTINCT p.Description FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE';
SELECT DISTINCT T1.Time FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.ChainID = 11
SELECT COUNT(*) FROM transactions_1k AS t JOIN gasstations AS g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE'   AND t.Price > 1000;
SELECT COUNT(*)  FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE'   AND t.Date > '2012-01-01';
SELECT AVG(T1.Price)  FROM transactions_1k AS T1 INNER JOIN gasstations AS T2  ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE'
SELECT      AVG(t.Price) AS average_total_price FROM      transactions_1k t JOIN      customers c ON t.CustomerID = c.CustomerID WHERE      c.Currency = 'EUR';
SELECT c.CustomerID FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE t.Date = '2012-08-25' ORDER BY t.Price DESC LIMIT 1;
SELECT DISTINCT gs.Country FROM transactions_1k t JOIN gasstations gs ON t.GasStationID = gs.GasStationID WHERE t.Date = '2012-08-25' ORDER BY t.Time ASC LIMIT 1;
SELECT DISTINCT c.Currency FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE t.Date = '2012-08-24'   AND t.Time = '16:25:00';
SELECT DISTINCT   c.Segment FROM customers AS c JOIN transactions_1k AS t   ON c.CustomerID = t.CustomerID WHERE t.Date = '2012-08-23'   AND t.Time = '21:20:00';
SELECT COUNT(*)  FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'CZK'   AND t.Date = '2012-08-26'   AND t.Time < '13:00:00';
SELECT c.Segment FROM customers c ORDER BY c.CustomerID ASC LIMIT 1;
SELECT T2.Country FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-24' AND T1.Time = '12:42:00'
SELECT ProductID FROM transactions_1k WHERE Date = '2012-08-23' AND Time = '21:20:00';
SELECT      T2.Consumption,     T2.Date FROM      transactions_1k AS T1 JOIN      yearmonth AS T2 ON      T1.CustomerID = T2.CustomerID WHERE      T1.Date = '2012-08-24'     AND T1.Price = 124.05     AND T2.Date LIKE '201201%';
SELECT COUNT(*)  FROM transactions_1k AS t JOIN gasstations AS g ON t.GasStationID = g.GasStationID WHERE t.Date = '2012-08-26'   AND t.Time BETWEEN '08:00:00' AND '09:00:00'   AND g.Country = 'CZE';
SELECT c.Currency FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE ym.Date = '201306'   AND ym.Consumption = 214582.17;
SELECT DISTINCT gs.Country FROM transactions_1k t JOIN gasstations gs ON t.GasStationID = gs.GasStationID WHERE t.CardID = 667467;
SELECT c.Currency FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE t.Date = '2012-08-24'   AND t.Amount = 548.4;
SELECT    CAST(SUM(CASE WHEN c.Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS percentage FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE t.Date = '2012-08-25';
SELECT      (SUM(CASE WHEN ym.Date LIKE '2012%' THEN ym.Consumption ELSE 0 END) -       SUM(CASE WHEN ym.Date LIKE '2013%' THEN ym.Consumption ELSE 0 END)) /      NULLIF(SUM(CASE WHEN ym.Date LIKE '2012%' THEN ym.Consumption ELSE 0 END), 0) AS consumption_decrease_rate FROM yearmonth ym WHERE ym.CustomerID = (     SELECT t.CustomerID      FROM transactions_1k t      WHERE t.Date = '2012-08-25' AND t.Price = 634.8 );
SELECT      gs.GasStationID FROM      gasstations gs JOIN      transactions_1k t ON gs.GasStationID = t.GasStationID GROUP BY      gs.GasStationID ORDER BY      SUM(t.Amount * t.Price) DESC LIMIT 1;
SELECT    CAST(SUM(CASE WHEN T1.Segment = 'Premium' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS percentage FROM gasstations T1 WHERE T1.Country = 'SVK';
SELECT      (SELECT SUM(Amount) FROM transactions_1k WHERE CustomerID = 38508) AS total_amount,     (SELECT SUM(Consumption) FROM yearmonth WHERE CustomerID = 38508 AND Date = '201201') AS jan_2012_spent;
SELECT      p.Description FROM transactions_1k t JOIN products p ON t.ProductID = p.ProductID GROUP BY p.ProductID, p.Description ORDER BY SUM(t.Amount) DESC LIMIT 5;
SELECT      c.CustomerID,     SUM(t.Price) / SUM(t.Amount) AS average_price_per_item,     c.Currency FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE c.CustomerID = (     SELECT CustomerID      FROM yearmonth      GROUP BY CustomerID      ORDER BY SUM(Consumption) DESC      LIMIT 1 ) GROUP BY c.CustomerID, c.Currency;
SELECT g.Country FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.ProductID = 2    AND t.Amount = 1 ORDER BY t.Price DESC LIMIT 1;
SELECT DISTINCT ym.CustomerID, ym.Consumption FROM yearmonth ym JOIN transactions_1k t ON ym.CustomerID = t.CustomerID WHERE t.ProductID = 5   AND t.Price / t.Amount > 29.00   AND ym.Date = '201208';
