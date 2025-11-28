SELECT MAX(`Free Meal Count (K-12)` / `Enrollment (K-12)`) AS HighestEligibleFreeRate FROM frpm WHERE `County Name` = 'Alameda'    AND `Enrollment (K-12)` IS NOT NULL    AND `Enrollment (K-12)` > 0;	california_schools
SELECT s.School, f.`Percent (%) Eligible Free (Ages 5-17)` FROM schools AS s JOIN frpm AS f ON s.CDSCode = f.CDSCode WHERE s.EdOpsName = 'Continuation' ORDER BY f.`Percent (%) Eligible Free (Ages 5-17)` ASC LIMIT 3;	california_schools
SELECT s.Zip  FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.County = 'Fresno' AND s.DOC = 'Fresno County Office of Education' AND f.`Charter School (Y/N)` = 1;	california_schools
SELECT s.MailStreet  FROM schools AS s JOIN frpm AS f ON s.CDSCode = f.CDSCode WHERE f.`FRPM Count (K-12)` = (     SELECT MAX(`FRPM Count (K-12)`)      FROM frpm );	california_schools
SELECT DISTINCT s.Phone  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE f.`Charter School (Y/N)` = 1    AND s.FundingType = 'Direct'    AND s.OpenDate > '2000-01-01';	california_schools
SELECT COUNT(*) AS NumberOfSchools FROM satscores AS s JOIN schools AS sc ON s.cds = sc.CDSCode WHERE s.AvgScrMath > 400 AND sc.Virtual = 'F';	california_schools
SELECT s.School, s.District, s.County FROM satscores AS sat JOIN schools AS s ON sat.cds = s.CDSCode WHERE sat.NumTstTakr > 500 AND s.Magnet = 1;	california_schools
SELECT s.Phone FROM schools s JOIN satscores sa ON s.CDSCode = sa.cds WHERE sa.NumGE1500 = (SELECT MAX(NumGE1500) FROM satscores);	california_schools
SELECT s.NumTstTakr  FROM satscores s JOIN frpm f ON s.cds = f.CDSCode WHERE f.`FRPM Count (K-12)` = (     SELECT MAX(`FRPM Count (K-12)`)      FROM frpm );	california_schools
SELECT COUNT(*) AS DirectlyCharterFundedSchools FROM satscores AS s JOIN schools AS sc ON s.cds = sc.CDSCode WHERE s.AvgScrMath > 560 AND sc.FundingType = 'Directly funded';	california_schools
SELECT frpm.`FRPM Count (Ages 5-17)` FROM satscores AS sat JOIN frpm ON sat.cds = frpm.CDSCode WHERE sat.AvgScrRead = (     SELECT MAX(AvgScrRead)     FROM satscores );	california_schools
SELECT s.CDSCode FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE (f.`Enrollment (K-12)` + f.`Enrollment (Ages 5-17)`) > 500;	california_schools
SELECT MAX("Free Meal Count (Ages 5-17)" / "Enrollment (Ages 5-17)") AS HighestEligibleFreeRate FROM frpm WHERE "CDSCode" IN (     SELECT cds     FROM satscores     WHERE CAST(NumGE1500 AS REAL) / CAST(NumTstTakr AS REAL) > 0.3 );	california_schools
SELECT s.Phone FROM schools AS s JOIN satscores AS sat ON s.CDSCode = sat.cds ORDER BY (CAST(sat.NumGE1500 AS FLOAT) / CAST(sat.NumTstTakr AS FLOAT)) DESC LIMIT 3;	california_schools
SELECT s.NCESSchool, f.`School Name`, f.`Enrollment (Ages 5-17)` FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode ORDER BY f.`Enrollment (Ages 5-17)` DESC LIMIT 5;	california_schools
SELECT s.District, MAX(ss.AvgScrRead) AS HighestAvgScoreReading FROM satscores ss JOIN schools s ON ss.cds = s.CDSCode WHERE s.StatusType = 'Active' GROUP BY s.District ORDER BY HighestAvgScoreReading DESC LIMIT 1;	california_schools
SELECT COUNT(*)  FROM schools AS s JOIN satscores AS ss ON s.CDSCode = ss.cds WHERE s.County = 'Alameda' AND ss.NumTstTakr < 100;	california_schools
SELECT s.School, s.CharterNum, ss.AvgScrWrite  FROM satscores ss JOIN schools s ON ss.cds = s.CDSCode WHERE ss.AvgScrWrite > 499 AND s.CharterNum IS NOT NULL ORDER BY ss.AvgScrWrite DESC;	california_schools
SELECT COUNT(*) FROM satscores AS s JOIN schools AS sc ON s.cds = sc.CDSCode WHERE sc.County = 'Fresno' AND sc.FundingType = 'Directly Funded' AND s.NumTstTakr <= 250;	california_schools
SELECT s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.AvgScrMath = (SELECT MAX(AvgScrMath) FROM satscores);	california_schools
SELECT COUNT(*) FROM frpm WHERE `County Name` = 'Amador' AND `Low Grade` = '9' AND `High Grade` = '12';	california_schools
SELECT COUNT(*) FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.County = 'Los Angeles'    AND frpm.`Free Meal Count (K-12)` > 500    AND frpm.`FRPM Count (K-12)` < 700;	california_schools
SELECT s.School, ss.NumTstTakr FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.County = 'Contra Costa' ORDER BY ss.NumTstTakr DESC LIMIT 1;	california_schools
SELECT s.School, s.Street, s.City, s.Zip, s.State FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE ABS(f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`) > 30;	california_schools
SELECT s.School  FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode JOIN satscores sat ON s.CDSCode = sat.cds WHERE (f.`Free Meal Count (K-12)` / f.`Enrollment (K-12)`) > 0.1    AND sat.NumGE1500 >= 1;	california_schools
SELECT s.School, s.FundingType FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds WHERE s.County = 'Riverside' GROUP BY s.School, s.FundingType HAVING AVG(sat.AvgScrMath) > 400;	california_schools
SELECT s.School AS SchoolName, s.Street, s.City, s.State, s.Zip FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.County = 'Monterey' AND f.`High Grade` = '12' AND f.`FRPM Count (Ages 5-17)` > 800;	california_schools
SELECT      schools.School AS School_Name,      satscores.AvgScrWrite AS Average_Writing_Score,      schools.Phone AS Communication_Number FROM      schools JOIN      satscores ON schools.CDSCode = satscores.cds WHERE      (schools.OpenDate > '1991-12-31' OR schools.ClosedDate < '2000-01-01')     AND satscores.AvgScrWrite IS NOT NULL;	california_schools
WITH EnrollmentDifference AS (     SELECT          s.School AS SchoolName,         s.DOCType,         (f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`) AS Difference     FROM          schools s     JOIN          frpm f ON s.CDSCode = f.CDSCode     WHERE          s.FundingType = 'Local' ), AverageDifference AS (     SELECT          AVG(Difference) AS AvgDiff     FROM          EnrollmentDifference ) SELECT      SchoolName,     DOCType FROM      EnrollmentDifference WHERE      Difference > (SELECT AvgDiff FROM AverageDifference);	california_schools
SELECT OpenDate  FROM schools  WHERE CDSCode = (     SELECT CDSCode      FROM frpm      WHERE `Enrollment (K-12)` = (         SELECT MAX(`Enrollment (K-12)`)          FROM frpm     ) );	california_schools
SELECT City, `Enrollment (K-12)` FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode ORDER BY `Enrollment (K-12)` ASC LIMIT 5;	california_schools
SELECT `School Name`,         (`Free Meal Count (K-12)` / `Enrollment (K-12)`) AS Eligible_Free_Rate_K12  FROM `frpm`  ORDER BY `Enrollment (K-12)` DESC  LIMIT 2 OFFSET 9;	california_schools
SELECT s.School, (f.`FRPM Count (K-12)` / f.`Enrollment (K-12)`) AS Eligible_FRPM_Rate FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.DOC = '66' ORDER BY f.`FRPM Count (K-12)` DESC LIMIT 5;	california_schools
SELECT s.School, s.Website FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.`Free Meal Count (Ages 5-17)` BETWEEN 1900 AND 2000;	california_schools
SELECT (f.`Free Meal Count (Ages 5-17)` / f.`Enrollment (Ages 5-17)`) AS FreeRate FROM frpm AS f JOIN schools AS s ON f.`CDSCode` = s.`CDSCode` WHERE s.`AdmFName1` = 'Kacey' AND s.`AdmLName1` = 'Gibson';	california_schools
SELECT s.AdmEmail1  FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.`Charter School (Y/N)` = 1 ORDER BY f.`Enrollment (K-12)` ASC LIMIT 1;	california_schools
SELECT AdmFName1, AdmLName1, AdmFName2, AdmLName2, AdmFName3, AdmLName3 FROM schools JOIN satscores ON schools.CDSCode = satscores.cds WHERE satscores.NumGE1500 = (     SELECT MAX(NumGE1500)     FROM satscores );	california_schools
SELECT Street, City, Zip, State  FROM schools  WHERE CDSCode = (     SELECT cds      FROM satscores      WHERE NumGE1500 / NumTstTakr = (         SELECT MIN(NumGE1500 * 1.0 / NumTstTakr)          FROM satscores     ) );	california_schools
SELECT s.Website  FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.County = 'Los Angeles' AND ss.NumTstTakr BETWEEN 2000 AND 3000;	california_schools
SELECT AVG(satscores.NumTstTakr) AS AverageTestTakers FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.County = 'Fresno' AND strftime('%Y', schools.OpenDate) = '1980';	california_schools
SELECT s.Phone  FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds  WHERE ss.dname = 'Fresno Unified'  ORDER BY ss.AvgScrRead ASC  LIMIT 1;	california_schools
SELECT s.School AS VirtualSchoolName, sc.County, sa.AvgScrRead FROM schools s JOIN satscores sa ON s.CDSCode = sa.cds JOIN (     SELECT County, AVG(AvgScrRead) AS AvgScrRead, RANK() OVER (PARTITION BY County ORDER BY AVG(AvgScrRead) DESC) AS CountyRank     FROM schools sc     JOIN satscores sa ON sc.CDSCode = sa.cds     WHERE sc.Virtual = 'F'     GROUP BY County, sc.CDSCode ) sc ON s.County = sc.County AND sa.AvgScrRead = sc.AvgScrRead WHERE sc.CountyRank <= 5 AND s.Virtual = 'F';	california_schools
SELECT s.EdOpsName  FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.AvgScrMath = (SELECT MAX(AvgScrMath) FROM satscores);	california_schools
SELECT AvgScrMath, cname  FROM satscores  WHERE cds = (     SELECT cds      FROM satscores      ORDER BY (AvgScrMath + AvgScrRead + AvgScrWrite) ASC      LIMIT 1 );	california_schools
SELECT s.City, sa.AvgScrWrite FROM satscores sa JOIN schools s ON sa.cds = s.CDSCode WHERE sa.NumGE1500 >= (     SELECT MAX(NumTstTakr)     FROM satscores     WHERE NumGE1500 >= 1500 );	california_schools
SELECT s.School, sa.AvgScrWrite FROM schools s JOIN satscores sa ON s.CDSCode = sa.cds WHERE s.AdmFName1 = 'Ricci' AND s.AdmLName1 = 'Ulrich';	california_schools
SELECT s.School, s.District, s.County, f.`Enrollment (K-12)` FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.DOC = '31' ORDER BY f.`Enrollment (K-12)` DESC LIMIT 1;	california_schools
SELECT COUNT(*) / 12 AS MonthlyAverageSchoolsOpened FROM schools WHERE County = 'Alameda'   AND DOC = '52'   AND strftime('%Y', OpenDate) = '1980';	california_schools
SELECT      (SELECT COUNT(*)       FROM schools       WHERE County = 'Orange' AND DOC = 54) /     (SELECT COUNT(*)       FROM schools       WHERE County = 'Orange' AND DOC = 52) AS Ratio;	california_schools
SELECT County, School, ClosedDate  FROM schools  WHERE StatusType = 'Closed'  GROUP BY County, School  ORDER BY COUNT(School) DESC;	california_schools
SELECT s.School, s.MailStreet  FROM satscores AS sat JOIN schools AS s ON sat.cds = s.CDSCode ORDER BY sat.AvgScrMath DESC LIMIT 1 OFFSET 6;	california_schools
SELECT s.MailStreet, s.School FROM satscores AS ss JOIN schools AS s ON ss.cds = s.CDSCode WHERE ss.AvgScrRead = (SELECT MIN(AvgScrRead) FROM satscores);	california_schools
SELECT COUNT(*) AS TotalSchools FROM satscores AS s JOIN schools AS sc ON s.cds = sc.CDSCode WHERE (s.AvgScrRead + s.AvgScrMath + s.AvgScrWrite) >= 1500   AND sc.MailCity = 'Lakeport';	california_schools
SELECT SUM(satscores.NumTstTakr) AS TotalTestTakers FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.MailCity = 'Fresno';	california_schools
SELECT School, MailZip  FROM schools  WHERE AdmFName1 = 'Avetik' AND AdmLName1 = 'Atoian';	california_schools
SELECT      (SELECT COUNT(*) FROM schools WHERE MailState = 'California' AND County = 'Colusa') * 1.0 /      (SELECT COUNT(*) FROM schools WHERE MailState = 'California' AND County = 'Humboldt') AS Ratio;	california_schools
SELECT COUNT(*) AS ActiveSchoolCount FROM schools WHERE MailState = 'CA' AND City = 'San Joaquin' AND StatusType = 'Active';	california_schools
SELECT s.Phone, s.Ext FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds ORDER BY ss.AvgScrWrite DESC LIMIT 1 OFFSET 332;	california_schools
SELECT School, Phone, Ext FROM schools WHERE Zip = '95203-3704';	california_schools
SELECT Website  FROM schools  WHERE (AdmFName1 = 'Mike' AND AdmLName1 = 'Larson')     OR (AdmFName2 = 'Mike' AND AdmLName2 = 'Larson')     OR (AdmFName3 = 'Mike' AND AdmLName3 = 'Larson')     OR (AdmFName1 = 'Dante' AND AdmLName1 = 'Alvarez')     OR (AdmFName2 = 'Dante' AND AdmLName2 = 'Alvarez')     OR (AdmFName3 = 'Dante' AND AdmLName3 = 'Alvarez');	california_schools
SELECT Website  FROM schools  WHERE County = 'San Joaquin' AND Virtual = 'P' AND Charter = 1;	california_schools
SELECT COUNT(*)  FROM schools  WHERE City = 'Hickman' AND Charter = 1 AND DOC = '52';	california_schools
SELECT COUNT(schools.CDSCode) AS TotalNonCharteredSchools FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode WHERE schools.County = 'Los Angeles'    AND schools.Charter = 0    AND (frpm.`Free Meal Count (K-12)` * 100 / frpm.`Enrollment (K-12)`) < 0.18;	california_schools
SELECT      s.School AS SchoolName,      s.City AS CityName,      s.AdmFName1 || ' ' || s.AdmLName1 AS Admin1FullName,      s.AdmFName2 || ' ' || s.AdmLName2 AS Admin2FullName,      s.AdmFName3 || ' ' || s.AdmLName3 AS Admin3FullName FROM      schools s WHERE      s.Charter = 1      AND s.CharterNum = '00D2';	california_schools
SELECT COUNT(*) AS TotalSchools FROM schools WHERE MailCity = 'Hickman' AND CharterNum = '00D4';	california_schools
SELECT      (COUNT(CASE WHEN `Charter Funding Type` = 'Locally Funded' THEN 1 END) * 100.0 / COUNT(*)) AS Ratio_Percentage FROM      frpm WHERE      `County Name` = 'Santa Clara'      AND `Charter School (Y/N)` = 1;	california_schools
SELECT COUNT(*) AS DirectlyFundedSchoolsOpened FROM schools WHERE County = 'Stanislaus'  AND FundingType = 'Directly Funded'  AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31';	california_schools
SELECT COUNT(*) AS TotalClosures FROM schools WHERE DOCType = 'Community College District'  AND ClosedDate LIKE '1989%'  AND City = 'San Francisco';	california_schools
SELECT County, COUNT(*) AS NumClosures FROM schools WHERE SOC = '11' AND ClosedDate BETWEEN '1980-01-01' AND '1989-12-31' GROUP BY County ORDER BY NumClosures DESC LIMIT 1;	california_schools
SELECT NCESDist  FROM schools  WHERE SOC = '31';	california_schools
SELECT      schools.StatusType,      COUNT(schools.CDSCode) AS SchoolCount FROM      schools WHERE      schools.DOCType = 'District Community Day School'     AND schools.County = 'Alpine' GROUP BY      schools.StatusType;	california_schools
SELECT District Code  FROM schools  WHERE Magnet = 0 AND City = 'Fresno';	california_schools
SELECT SUM(`Enrollment (Ages 5-17)`) AS Total_Enrolled FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.EdOpsCode = 'SSS'  AND schools.City = 'Fremont'  AND frpm.`Academic Year` = '2014-2015';	california_schools
SELECT frpm.`FRPM Count (Ages 5-17)` FROM frpm JOIN schools ON frpm.`CDSCode` = schools.`CDSCode` WHERE schools.`DOCType` = 'Youth Authority' AND schools.`MailStreet` = 'PO Box 1040';	california_schools
SELECT f.`Low Grade` FROM schools s JOIN frpm f ON s.`CDSCode` = f.`CDSCode` WHERE s.`NCESDist` = '0613360' AND s.`EdOpsCode` = 'SPECON';	california_schools
SELECT s.School, s.EdOpsName  FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.`NSLP Provision Status` = 'Breakfast Provision 2' AND f.`County Code` = '37';	california_schools
SELECT s.City  FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE f.`Low Grade` = '9'  AND f.`High Grade` = '12'  AND f.`NSLP Provision Status` = 'Provision 2'  AND s.County = 'Merced'  AND s.EILCode = 'HS';	california_schools
SELECT s.School, s.County, f.`Percent (%) Eligible FRPM (Ages 5-17)` FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.County = 'Los Angeles' AND f.`Low Grade` = 'K' AND f.`High Grade` = '9';	california_schools
SELECT GSserved, COUNT(*) AS Frequency FROM schools WHERE City = 'Adelanto' GROUP BY GSserved ORDER BY Frequency DESC LIMIT 1;	california_schools
SELECT County, COUNT(*) AS SchoolCount FROM schools WHERE County IN ('San Diego', 'Santa Barbara') AND Virtual = 'F' GROUP BY County ORDER BY SchoolCount DESC LIMIT 1;	california_schools
SELECT s.School, f.`School Type`, s.Latitude FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.Latitude = (SELECT MAX(Latitude) FROM schools);	california_schools
SELECT s.School, s.City, f.`Low Grade`, s.Latitude FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.State = 'CA' ORDER BY s.Latitude ASC LIMIT 1;	california_schools
SELECT GSoffered  FROM schools  WHERE ABS(Longitude) = (SELECT MAX(ABS(Longitude)) FROM schools);	california_schools
SELECT      s.City,      COUNT(s.CDSCode) AS NumberOfSchools FROM      schools s JOIN      frpm f ON s.CDSCode = f.CDSCode WHERE      s.GSserved = 'K-8' AND      s.Magnet = 1 AND      f.`NSLP Provision Status` = 'Multiple Provision Types' GROUP BY      s.City;	california_schools
SELECT AdmFName1 AS FirstName, District, COUNT(*) AS Frequency FROM schools WHERE AdmFName1 IS NOT NULL GROUP BY AdmFName1, District ORDER BY Frequency DESC LIMIT 2;	california_schools
SELECT s.District, f.`Percent (%) Eligible Free (K-12)` FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.AdmFName1 = 'Alusine';	california_schools
SELECT sc.AdmLName1 AS AdministratorLastName, sc.District AS DistrictName, sc.County AS CountyName, sc.School AS SchoolName FROM schools sc JOIN frpm f ON sc.CDSCode = f.CDSCode WHERE sc.CharterNum = '40';	california_schools
SELECT DISTINCT AdmEmail1, AdmEmail2, AdmEmail3 FROM schools WHERE County = 'San Bernardino'    AND District = 'San Bernardino City Unified'   AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31'   AND (SOC = '62' OR DOC = '54');	california_schools
SELECT sc.School, sc.AdmEmail1  FROM satscores ss JOIN schools sc ON ss.cds = sc.CDSCode WHERE ss.NumGE1500 = (SELECT MAX(NumGE1500) FROM satscores);	california_schools
SELECT COUNT(DISTINCT a.account_id) AS account_count FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.frequency = 'POPLATEK PO OBRATU' AND d.A3 = 'East Bohemia';	financial
SELECT COUNT(DISTINCT account.account_id) AS eligible_accounts FROM account JOIN district ON account.district_id = district.district_id JOIN loan ON account.account_id = loan.account_id WHERE district.A3 = 'Prague';	financial
SELECT      CASE          WHEN AVG(A12) > AVG(A13) THEN '1995'         ELSE '1996'     END AS Year_With_Higher_Unemployment_Percentage FROM district;	financial
SELECT COUNT(DISTINCT d.district_id) AS no_of_districts FROM district d JOIN client c ON d.district_id = c.district_id WHERE c.gender = 'F' AND d.A11 > 6000 AND d.A11 < 10000;	financial
SELECT COUNT(DISTINCT c.client_id) AS male_customers_count FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'M' AND d.A3 = 'North Bohemia' AND d.A11 > 8000;	financial
SELECT a.account_id,         (SELECT MAX(d.A11) - MIN(d.A11)          FROM district d) AS salary_gap FROM account a JOIN client c ON a.district_id = c.district_id JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F' ORDER BY c.birth_date ASC, d.A11 ASC LIMIT 1;	financial
SELECT a.account_id FROM client c JOIN district d ON c.district_id = d.district_id JOIN disp dp ON c.client_id = dp.client_id JOIN account a ON dp.account_id = a.account_id WHERE c.birth_date = (SELECT MAX(c2.birth_date)                        FROM client c2                        JOIN district d2 ON c2.district_id = d2.district_id                       WHERE d2.A11 = (SELECT MAX(d3.A11) FROM district d3));	financial
SELECT COUNT(*) AS weekly_owner_count FROM disp JOIN account ON disp.account_id = account.account_id WHERE disp.type = 'OWNER' AND account.frequency = 'POPLATEK TYDNE';	financial
SELECT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE d.type = 'DISPONENT' AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT account.account_id, loan.amount, account.frequency FROM loan JOIN account ON loan.account_id = account.account_id WHERE loan.date LIKE '1997%' AND loan.amount = (     SELECT MIN(amount)     FROM loan     WHERE date LIKE '1997%' ) AND account.frequency = 'POPLATEK TYDNE';	financial
SELECT a.account_id, l.amount, a.date  FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 12    AND l.amount = (     SELECT MAX(l2.amount)      FROM loan l2      WHERE l2.duration > 12   )   AND strftime('%Y', a.date) = '1993';	financial
SELECT COUNT(DISTINCT a.account_id)  FROM account a JOIN client c ON a.district_id = c.district_id JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F' AND c.birth_date < '1950-01-01' AND d.A2 = 'Sokolov';	financial
SELECT account_id, MIN(date) AS earliest_date FROM trans WHERE date LIKE '1995%' GROUP BY account_id ORDER BY earliest_date ASC LIMIT 1;	financial
SELECT DISTINCT a.account_id FROM account a JOIN trans t ON a.account_id = t.account_id WHERE a.date < '1997-01-01'  AND t.balance > 3000;	financial
SELECT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card cr ON d.disp_id = cr.disp_id WHERE cr.issued = '1994-03-03';	financial
SELECT a.date  FROM trans t JOIN account a ON t.account_id = a.account_id WHERE t.amount = 840 AND t.date = '1998-10-14';	financial
SELECT account.district_id  FROM loan  JOIN account ON loan.account_id = account.account_id  WHERE loan.date = '1994-08-25';	financial
SELECT MAX(t.amount) AS biggest_transaction_amount FROM card c JOIN disp d ON c.disp_id = d.disp_id JOIN trans t ON d.account_id = t.account_id WHERE c.issued = '1996-10-21';	financial
SELECT c.gender FROM client c JOIN account a ON c.district_id = a.district_id JOIN district d ON c.district_id = d.district_id WHERE c.birth_date = (     SELECT MIN(c2.birth_date)     FROM client c2     JOIN account a2 ON c2.district_id = a2.district_id     JOIN district d2 ON c2.district_id = d2.district_id     WHERE d2.A11 = (         SELECT MAX(A11)         FROM district     ) ) LIMIT 1;	financial
WITH biggest_loan AS (     SELECT account_id, MAX(amount) AS max_loan     FROM loan ) SELECT t.amount FROM trans t WHERE t.account_id = (SELECT account_id FROM biggest_loan) AND t.date = (SELECT MIN(date) FROM trans WHERE account_id = t.account_id);	financial
SELECT COUNT(DISTINCT client.client_id) AS female_clients_count FROM client JOIN district ON client.district_id = district.district_id JOIN account ON client.district_id = account.district_id WHERE district.A2 = 'Jesenik' AND client.gender = 'F';	financial
SELECT disp.disp_id  FROM trans JOIN account ON trans.account_id = account.account_id JOIN disp ON account.account_id = disp.account_id WHERE trans.amount = 5100 AND trans.date = '1998-09-02';	financial
SELECT COUNT(*) AS num_accounts FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Litomerice' AND strftime('%Y', a.date) = '1996';	financial
SELECT d.A2 AS district_name FROM client c JOIN account a ON c.district_id = a.district_id JOIN district d ON a.district_id = d.district_id WHERE c.gender = 'F' AND c.birth_date = '1976-01-29';	financial
SELECT c.birth_date FROM loan l JOIN account a ON l.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id WHERE l.amount = 98832 AND l.date = '1996-01-03';	financial
SELECT a.account_id FROM account a JOIN district d ON a.district_id = d.district_id JOIN disp dp ON a.account_id = dp.account_id JOIN client c ON dp.client_id = c.client_id WHERE d.A3 = 'Prague' ORDER BY a.date ASC LIMIT 1;	financial
SELECT      (CAST(COUNT(CASE WHEN c.gender = 'M' THEN 1 END) AS FLOAT) / COUNT(c.client_id)) * 100 AS male_percentage FROM      district d JOIN      client c ON d.district_id = c.district_id WHERE      d.A3 = 'south Bohemia'     AND d.A4 = (SELECT MAX(A4) FROM district WHERE A3 = 'south Bohemia');	financial
WITH FirstLoan AS (     SELECT client_id, loan_id, l.account_id     FROM loan l     JOIN disp d ON l.account_id = d.account_id     WHERE l.date = '1993-07-05'     LIMIT 1 ), BalanceInfo AS (     SELECT          t.account_id,         MAX(CASE WHEN t.date = '1998-12-27' THEN t.balance ELSE NULL END) AS balance_date_A,         MAX(CASE WHEN t.date = '1993-03-22' THEN t.balance ELSE NULL END) AS balance_date_B     FROM trans t     JOIN FirstLoan fl ON t.account_id = fl.account_id     GROUP BY t.account_id ) SELECT      account_id,     (CAST(balance_date_A - balance_date_B AS REAL) / balance_date_B) * 100 AS increase_rate FROM BalanceInfo;	financial
SELECT (SUM(amount) FILTER (WHERE status = 'A') * 100.0 / SUM(amount)) AS percentage_paid_no_issue FROM loan;	financial
SELECT      (COUNT(DISTINCT CASE WHEN status = 'C' AND amount < 100000 THEN account_id END) * 100.0 / COUNT(DISTINCT account_id)) AS percentage_running_no_issue FROM loan;	financial
SELECT      a.account_id,      d.A2 AS district_name,      d.A3 AS district_region FROM      account a JOIN      district d ON a.district_id = d.district_id WHERE      a.date BETWEEN '1993-01-01' AND '1993-12-31'     AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT a.account_id, a.frequency, c.client_id, c.gender, c.birth_date FROM account a JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id JOIN district dis ON c.district_id = dis.district_id WHERE dis.A3 = 'east Bohemia' AND d.type = 'OWNER' AND a.date BETWEEN '1995-01-01' AND '2000-12-31';	financial
SELECT account.account_id, account.date  FROM account  JOIN district ON account.district_id = district.district_id  WHERE district.A2 = 'Prachatice';	financial
SELECT d.A2 AS district, d.A3 AS region FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.loan_id = 4990;	financial
SELECT a.account_id, d.A2 AS district, d.A3 AS region FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.amount > 300000;	financial
SELECT l.loan_id, d.A3 AS district, d.A11 AS average_salary FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.duration = 60;	financial
SELECT d.A3 AS district,         ((d.A13 - d.A12) / d.A12) * 100 AS unemployment_rate_increment FROM loan l JOIN account a ON l.account_id = a.account_id JOIN disp dp ON a.account_id = dp.account_id JOIN client c ON dp.client_id = c.client_id JOIN district d ON c.district_id = d.district_id WHERE l.status = 'D';	financial
SELECT      (COUNT(a.account_id) * 100.0 / (SELECT COUNT(account_id) FROM account WHERE strftime('%Y', date) = '1993')) AS percentage FROM      account a JOIN      district d ON a.district_id = d.district_id WHERE      d.A2 = 'Decin' AND strftime('%Y', a.date) = '1993';	financial
SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE';	financial
SELECT d.A2 AS district_name, COUNT(*) AS female_account_holders FROM client c JOIN account a ON c.district_id = a.district_id JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F' GROUP BY d.A2 ORDER BY female_account_holders DESC LIMIT 9;	financial
SELECT d.A2 AS district_name, t.amount  FROM trans t JOIN account a ON t.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE t.type = 'VYDAJ' AND t.date LIKE '1996-01%' ORDER BY t.amount DESC LIMIT 10;	financial
SELECT COUNT(DISTINCT a.account_id) AS no_card_holders FROM account a JOIN district d ON a.district_id = d.district_id LEFT JOIN disp dp ON a.account_id = dp.account_id LEFT JOIN card c ON dp.disp_id = c.disp_id WHERE d.A3 = 'South Bohemia' AND c.card_id IS NULL;	financial
SELECT d.A3 AS district_name, COUNT(l.loan_id) AS active_loan_count FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.status IN ('C', 'D') GROUP BY d.A3 ORDER BY active_loan_count DESC LIMIT 1;	financial
SELECT AVG(loan.amount) AS average_loan_amount FROM loan JOIN account ON loan.account_id = account.account_id JOIN disp ON account.account_id = disp.account_id JOIN client ON disp.client_id = client.client_id WHERE client.gender = 'M';	financial
SELECT A3 AS branch_location, A2 AS district_name, A13 AS unemployment_rate_1996 FROM district WHERE A13 = (SELECT MAX(A13) FROM district);	financial
SELECT COUNT(a.account_id) AS num_accounts_opened FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.district_id = (     SELECT district_id     FROM district     WHERE A16 = (SELECT MAX(A16) FROM district) );	financial
SELECT COUNT(DISTINCT t.account_id) FROM trans t JOIN account a ON t.account_id = a.account_id WHERE t.operation = 'VYBER KARTOU' AND t.balance < 0 AND a.frequency = 'POPLATEK MESICNE';	financial
SELECT COUNT(*) AS loan_count FROM loan l JOIN account a ON l.account_id = a.account_id WHERE l.amount >= 250000    AND a.frequency = 'POPLATEK MESICNE'    AND l.status = 'A'    AND l.date BETWEEN '1995-01-01' AND '1997-12-31';	financial
SELECT COUNT(DISTINCT account.account_id)  FROM account JOIN loan ON account.account_id = loan.account_id WHERE loan.status IN ('C', 'D') AND account.district_id = 1;	financial
SELECT COUNT(c.client_id) AS male_clients_count FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'M' AND d.A15 = (     SELECT MAX(A15)     FROM district     WHERE A15 < (         SELECT MAX(A15)         FROM district     ) );	financial
SELECT COUNT(*) AS high_level_credit_cards_count FROM card c JOIN disp d ON c.disp_id = d.disp_id WHERE c.type = 'gold' AND d.type = 'OWNER';	financial
SELECT COUNT(*)  FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Pisek';	financial
SELECT DISTINCT d.district_id FROM district d JOIN account a ON d.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id WHERE t.amount > 10000 AND strftime('%Y', t.date) = '1997';	financial
SELECT DISTINCT a.account_id FROM account a JOIN `order` o ON a.account_id = o.account_id JOIN district d ON a.district_id = d.district_id WHERE o.k_symbol = 'SIPO' AND d.A3 = 'Pisek';	financial
SELECT DISTINCT a.account_id FROM account a JOIN disp d ON a.account_id = d.account_id JOIN card c ON d.disp_id = c.disp_id WHERE c.type = 'gold';	financial
SELECT AVG(amount) AS average_amount FROM trans WHERE operation = 'VYBER KARTOU' AND strftime('%Y', date) = '2021';	financial
SELECT DISTINCT d.client_id FROM trans t JOIN account a ON t.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id JOIN card c ON d.disp_id = c.disp_id WHERE t.operation = 'VYBER KARTOU'    AND t.amount < (SELECT AVG(amount)                    FROM trans                    WHERE operation = 'VYBER KARTOU' AND strftime('%Y', date) = '1998')   AND strftime('%Y', t.date) = '1998';	financial
SELECT DISTINCT c.client_id, c.gender, c.birth_date FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN card cr ON d.disp_id = cr.disp_id JOIN loan l ON a.account_id = l.account_id WHERE c.gender = 'F' AND d.type = 'OWNER';	financial
SELECT COUNT(DISTINCT a.account_id) AS female_clients_accounts FROM client c JOIN district d ON c.district_id = d.district_id JOIN account a ON c.district_id = a.district_id WHERE c.gender = 'F' AND d.A3 = 'South Bohemia';	financial
SELECT a.account_id  FROM account a JOIN district d ON a.district_id = d.district_id JOIN disp dp ON a.account_id = dp.account_id WHERE d.A2 = 'Tabor' AND dp.type = 'OWNER';	financial
SELECT DISTINCT a.frequency FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A11 > 8000 AND d.A11 <= 9000 AND a.account_id NOT IN (     SELECT disp.account_id     FROM disp     WHERE disp.type = 'OWNER' );	financial
SELECT COUNT(DISTINCT a.account_id) AS num_accounts FROM account a JOIN district d ON a.district_id = d.district_id JOIN trans t ON a.account_id = t.account_id WHERE d.A3 = 'North Bohemia' AND t.bank = 'AB';	financial
SELECT DISTINCT d.A2  FROM district d JOIN account a ON d.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id WHERE t.type = 'VYDAJ';	financial
SELECT AVG(d.A15) AS avg_crimes_1995 FROM district d JOIN account a ON d.district_id = a.district_id WHERE d.A15 > 4000 AND strftime('%Y', a.date) >= '1997';	financial
SELECT COUNT(*) AS classic_card_count FROM card JOIN disp ON card.disp_id = disp.disp_id WHERE card.type = 'classic' AND disp.type = 'OWNER';	financial
SELECT COUNT(*) AS male_clients_count FROM client JOIN district ON client.district_id = district.district_id WHERE client.gender = 'M' AND district.A2 = 'Hl.m. Praha';	financial
SELECT      (CAST(SUM(CASE WHEN type = 'gold' AND issued < '1998-01-01' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(*)) * 100 AS percent_gold_prior_1998 FROM card;	financial
SELECT c.client_id, c.gender, c.birth_date FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN loan l ON a.account_id = l.account_id WHERE l.amount = (SELECT MAX(amount) FROM loan) AND d.type = 'OWNER';	financial
SELECT d.A15  FROM account a  JOIN district d ON a.district_id = d.district_id  WHERE a.account_id = 532;	financial
SELECT a.district_id FROM `order` o JOIN account a ON o.account_id = a.account_id WHERE o.order_id = 33333;	financial
SELECT *  FROM trans t JOIN disp d ON t.account_id = d.account_id WHERE d.client_id = 3356 AND t.operation = 'VYBER';	financial
SELECT COUNT(DISTINCT l.account_id) AS weekly_accounts_with_loans_under_200000 FROM account a JOIN loan l ON a.account_id = l.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND l.amount < 200000;	financial
SELECT c.type  FROM card c JOIN disp d ON c.disp_id = d.disp_id WHERE d.client_id = 13539;	financial
SELECT d.A3  FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.client_id = 3541;	financial
SELECT d.A2 AS district_name, COUNT(l.loan_id) AS total_loans FROM district d JOIN account a ON d.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.status = 'A' GROUP BY d.A2 ORDER BY total_loans DESC LIMIT 1;	financial
SELECT c.client_id, c.gender, c.birth_date FROM `order` o JOIN `account` a ON o.account_id = a.account_id JOIN `disp` d ON a.account_id = d.account_id JOIN `client` c ON d.client_id = c.client_id WHERE o.order_id = 32423;	financial
SELECT t.* FROM trans t JOIN account a ON t.account_id = a.account_id WHERE a.district_id = 5;	financial
SELECT COUNT(*)  FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A3 = 'Jesenik';	financial
SELECT DISTINCT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card ca ON d.disp_id = ca.disp_id WHERE ca.type = 'junior' AND ca.issued >= '1997-01-01';	financial
SELECT      (COUNT(DISTINCT client.client_id) * 100.0 / (SELECT COUNT(DISTINCT client_id)      FROM client      JOIN account ON client.district_id = account.district_id      JOIN district ON account.district_id = district.district_id      WHERE district.A11 > 10000)) AS percentage_of_women FROM client JOIN account ON client.district_id = account.district_id JOIN district ON account.district_id = district.district_id WHERE district.A11 > 10000 AND client.gender = 'F';	financial
SELECT      ((SUM(CASE WHEN strftime('%Y', l.date) = '1997' THEN l.amount ELSE 0 END) -        SUM(CASE WHEN strftime('%Y', l.date) = '1996' THEN l.amount ELSE 0 END)) * 100.0 /        SUM(CASE WHEN strftime('%Y', l.date) = '1996' THEN l.amount ELSE 0 END)) AS growth_rate FROM loan l JOIN account a ON l.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id WHERE c.gender = 'M' AND strftime('%Y', l.date) IN ('1996', '1997');	financial
SELECT COUNT(*)  FROM trans  WHERE operation = 'VYBER KARTOU' AND date > '1995-01-01';	financial
SELECT      ABS(         (SELECT SUM(A16) FROM district WHERE A3 = 'North Bohemia') -         (SELECT SUM(A16) FROM district WHERE A3 = 'East Bohemia')     ) AS crime_difference_1996;	financial
SELECT type, COUNT(*) AS disposition_count FROM disp WHERE account_id BETWEEN 1 AND 10 GROUP BY type;	financial
SELECT frequency FROM account WHERE account_id = 3;  SELECT k_symbol FROM `order` WHERE account_id = 3 AND amount = 3539;	financial
SELECT STRFTIME('%Y', birth_date) AS year_of_birth FROM client WHERE client_id = (SELECT client_id                     FROM disp                     WHERE account_id = 130 AND type = 'OWNER');	financial
SELECT COUNT(*) FROM account JOIN disp ON account.account_id = disp.account_id WHERE disp.type = 'OWNER' AND account.frequency = 'POPLATEK PO OBRATU';	financial
SELECT      l.amount AS debt_amount,      l.status AS payment_status FROM      loan l JOIN      account a ON l.account_id = a.account_id JOIN      disp d ON a.account_id = d.account_id WHERE      d.client_id = 992;	financial
SELECT c.gender, SUM(t.amount) AS total_amount FROM disp d JOIN client c ON d.client_id = c.client_id JOIN trans t ON d.account_id = t.account_id WHERE d.type = 'OWNER' AND c.client_id = 4 AND t.trans_id = 851;	financial
SELECT c.type  FROM card c JOIN disp d ON c.disp_id = d.disp_id WHERE d.client_id = 9;	financial
SELECT SUM(t.amount) AS total_paid FROM trans t JOIN account a ON t.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id WHERE d.client_id = 617 AND strftime('%Y', t.date) = '1998' AND t.type = 'VYDAJ';	financial
SELECT c.client_id, c.birth_date  FROM client c JOIN district d ON c.district_id = d.district_id JOIN account a ON d.district_id = a.district_id WHERE c.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND d.A2 = 'East Bohemia';	financial
SELECT l.loan_id FROM loan l JOIN account a ON l.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id WHERE c.gender = 'F' ORDER BY l.amount DESC LIMIT 3;	financial
SELECT COUNT(DISTINCT client.client_id) AS male_customers_count FROM client JOIN disp ON client.client_id = disp.client_id JOIN `order` ON disp.account_id = `order`.account_id WHERE client.gender = 'M'   AND client.birth_date BETWEEN '1974-01-01' AND '1976-12-31'   AND `order`.k_symbol = 'SIPO'   AND `order`.amount > 4000;	financial
SELECT COUNT(*)  FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A3 = 'Beroun' AND a.date > '1996-12-31';	financial
SELECT COUNT(DISTINCT c.client_id) AS female_customers_with_junior_card FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card ca ON d.disp_id = ca.disp_id WHERE c.gender = 'F' AND ca.type = 'junior';	financial
SELECT    (CAST(COUNT(DISTINCT c.client_id) FILTER (WHERE c.gender = 'F') AS FLOAT) / COUNT(DISTINCT c.client_id)) * 100 AS female_percentage FROM client c JOIN district d ON c.district_id = d.district_id JOIN account a ON c.district_id = a.district_id WHERE d.A3 LIKE '%Prague%';	financial
SELECT      (CAST(COUNT(DISTINCT c.client_id) FILTER (WHERE c.gender = 'M') AS FLOAT) / COUNT(DISTINCT c.client_id)) * 100 AS percentage_male_clients FROM      account a JOIN      disp d ON a.account_id = d.account_id JOIN      client c ON d.client_id = c.client_id WHERE      a.frequency = 'POPLATEK TYDNE';	financial
SELECT COUNT(*) AS weekly_owner_clients FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE d.type = 'OWNER' AND a.frequency = 'POPLATEK TYDNE';	financial
SELECT account.account_id, loan.amount, loan.duration, account.date FROM loan JOIN account ON loan.account_id = account.account_id WHERE loan.duration > 24 AND account.date < '1997-01-01' ORDER BY loan.amount ASC LIMIT 1;	financial
SELECT a.account_id FROM account a JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id JOIN district dist ON c.district_id = dist.district_id WHERE c.gender = 'F' ORDER BY c.birth_date ASC, dist.A11 ASC LIMIT 1;	financial
SELECT COUNT(DISTINCT c.client_id) AS client_count FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.birth_date BETWEEN '1920-01-01' AND '1920-12-31'   AND d.A3 = 'east Bohemia';	financial
SELECT COUNT(*) AS loan_accounts_count FROM loan l JOIN account a ON l.account_id = a.account_id WHERE l.duration = 24 AND a.frequency = 'POPLATEK TYDNE';	financial
SELECT AVG(amount) AS average_loan_amount FROM loan JOIN account ON loan.account_id = account.account_id WHERE loan.status IN ('C', 'D') AND account.frequency = 'POPLATEK PO OBRATU';	financial
SELECT DISTINCT c.client_id, c.district_id FROM client c JOIN disp d ON c.client_id = d.client_id WHERE d.type = 'OWNER';	financial
SELECT      c.client_id,      (strftime('%Y', 'now') - strftime('%Y', c.birth_date)) AS age  FROM      client c JOIN      disp d ON c.client_id = d.client_id JOIN      card cr ON d.disp_id = cr.disp_id WHERE      cr.type = 'gold' AND d.type = 'OWNER';	financial
SELECT bond_type, COUNT(bond_type) AS bond_count FROM bond GROUP BY bond_type ORDER BY bond_count DESC LIMIT 1;	toxicology
SELECT COUNT(DISTINCT a.molecule_id)  FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '-' AND a.element = 'cl';	toxicology
SELECT AVG(oxygen_count) AS avg_oxygen_atoms FROM (     SELECT m.molecule_id,             SUM(CASE WHEN a.element = 'o' THEN 1 ELSE 0 END) AS oxygen_count     FROM molecule m     JOIN bond b ON m.molecule_id = b.molecule_id     JOIN connected c ON b.bond_id = c.bond_id     JOIN atom a ON c.atom_id = a.atom_id     WHERE b.bond_type = '-'     GROUP BY m.molecule_id ) AS molecule_oxygen_counts;	toxicology
SELECT AVG(single_bond_count) AS average_single_bonded_carcinogenic_molecules FROM (     SELECT m.molecule_id, COUNT(b.bond_id) AS single_bond_count     FROM molecule m     LEFT JOIN bond b ON m.molecule_id = b.molecule_id     WHERE m.label = '+' AND b.bond_type = '-'     GROUP BY m.molecule_id ) subquery;	toxicology
SELECT COUNT(DISTINCT a.atom_id) AS non_carcinogenic_sodium_atoms FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'na' AND m.label = '-';	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '#' AND m.label = '+';	toxicology
SELECT      (CAST(SUM(CASE WHEN a.element = 'c' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(a.atom_id)) * 100 AS carbon_percentage FROM      molecule m JOIN      bond b ON m.molecule_id = b.molecule_id JOIN      connected c ON b.bond_id = c.bond_id JOIN      atom a ON c.atom_id = a.atom_id WHERE      b.bond_type = '=';	toxicology
SELECT COUNT(*)  FROM bond  WHERE bond_type = '#';	toxicology
SELECT COUNT(*)  FROM atom  WHERE element != 'br';	toxicology
SELECT COUNT(*) AS carcinogenic_molecule_count FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR099' AND label = '+';	toxicology
SELECT DISTINCT molecule_id  FROM atom  WHERE element = 'c';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE c.bond_id = 'TR004_8_9';	toxicology
SELECT DISTINCT a.element FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id WHERE b.bond_type = '=';	toxicology
SELECT m.label, COUNT(m.label) AS label_count FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'h' GROUP BY m.label ORDER BY label_count DESC LIMIT 1;	toxicology
SELECT DISTINCT b.bond_type FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'cl';	toxicology
SELECT c.atom_id, c.atom_id2 FROM connected AS c JOIN bond AS b ON c.bond_id = b.bond_id WHERE b.bond_type = '-';	toxicology
SELECT c.atom_id, c.atom_id2  FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id JOIN molecule m ON a1.molecule_id = m.molecule_id WHERE m.label = '-';	toxicology
SELECT element  FROM atom  WHERE molecule_id IN (     SELECT molecule_id      FROM molecule      WHERE label = '-' )  GROUP BY element  ORDER BY COUNT(element) ASC  LIMIT 1;	toxicology
SELECT b.bond_type FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE (c.atom_id = 'TR004_8' AND c.atom_id2 = 'TR004_20') OR (c.atom_id = 'TR004_20' AND c.atom_id2 = 'TR004_8');	toxicology
SELECT DISTINCT label  FROM molecule  WHERE label NOT IN (     SELECT DISTINCT m.label      FROM molecule m     JOIN atom a ON m.molecule_id = a.molecule_id      WHERE a.element = 'sn' );	toxicology
SELECT COUNT(DISTINCT a.atom_id) AS atom_count FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id WHERE a.element IN ('i', 's') AND b.bond_type = '-';	toxicology
SELECT c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#';	toxicology
SELECT c.atom_id2  FROM connected c JOIN atom a ON c.atom_id = a.atom_id WHERE a.molecule_id = 'TR181';	toxicology
SELECT      100 - (         (COUNT(DISTINCT CASE WHEN a.element = 'f' THEN a.atom_id END) * 100.0) /         COUNT(DISTINCT m.molecule_id)     ) AS percentage_without_fluorine FROM      molecule m LEFT JOIN      atom a ON m.molecule_id = a.molecule_id WHERE      m.label = '+';	toxicology
SELECT      (CAST(SUM(CASE WHEN b.bond_type = '#' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(b.bond_id)) AS percent FROM      bond b JOIN      molecule m ON b.molecule_id = m.molecule_id WHERE      m.label = '+';	toxicology
SELECT element, COUNT(*) AS count FROM atom WHERE molecule_id = 'TR000' GROUP BY element ORDER BY element ASC LIMIT 3;	toxicology
SELECT a1.atom_id AS atom1, a2.atom_id AS atom2 FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE c.bond_id = 'TR001_2_6' AND a1.molecule_id = 'TR001' AND a2.molecule_id = 'TR001';	toxicology
SELECT      (SELECT COUNT(*) FROM molecule WHERE label = '+') -      (SELECT COUNT(*) FROM molecule WHERE label = '-') AS difference;	toxicology
SELECT atom_id, atom_id2  FROM connected  WHERE bond_id = 'TR000_2_5';	toxicology
SELECT bond_id  FROM connected  WHERE atom_id2 = 'TR000_2';	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '=' ORDER BY m.molecule_id LIMIT 5;	toxicology
SELECT      CAST(COALESCE(SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END), 0) AS FLOAT) /      CAST(COUNT(bond_id) AS FLOAT) * 100 AS percent FROM bond WHERE molecule_id = 'TR008';	toxicology
SELECT ROUND(100.0 * SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) / COUNT(molecule_id), 3) AS percent FROM molecule;	toxicology
SELECT ROUND((CAST(SUM(CASE WHEN element = 'h' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(atom_id)) * 100, 4) AS percent FROM atom WHERE molecule_id = 'TR206';	toxicology
SELECT DISTINCT bond_type  FROM bond  WHERE molecule_id = 'TR000';	toxicology
SELECT a.element, m.label FROM molecule m LEFT JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.molecule_id = 'TR060';	toxicology
SELECT b.bond_type,         m.label AS carcinogenic FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.molecule_id = 'TR010' GROUP BY b.bond_type, m.label ORDER BY COUNT(b.bond_type) DESC LIMIT 1;	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.label = '-' AND b.bond_type = '-' ORDER BY m.molecule_id LIMIT 3;	toxicology
SELECT bond_id FROM bond WHERE molecule_id = 'TR006' ORDER BY bond_id ASC LIMIT 2;	toxicology
SELECT COUNT(*)  FROM connected WHERE bond_id IN (     SELECT bond_id      FROM bond      WHERE molecule_id = 'TR009' ) AND ('TR009_12' IN (atom_id, atom_id2));	toxicology
SELECT COUNT(DISTINCT m.molecule_id) AS carcinogenic_bromine_molecules FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' AND a.element = 'br';	toxicology
SELECT b.bond_type, c.atom_id, c.atom_id2 FROM bond b JOIN connected c ON b.bond_id = c.bond_id WHERE b.bond_id = 'TR001_6_9';	toxicology
SELECT m.molecule_id,         CASE             WHEN m.label = '+' THEN 'carcinogenic'            ELSE 'not carcinogenic'        END AS carcinogenic_status FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.atom_id = 'TR001_10';	toxicology
SELECT COUNT(DISTINCT molecule_id)  FROM bond  WHERE bond_type = '#';	toxicology
SELECT COUNT(*) AS connection_count FROM connected WHERE atom_id LIKE 'TR%_19';	toxicology
SELECT element  FROM atom  WHERE molecule_id = 'TR004';	toxicology
SELECT COUNT(*) AS non_carcinogenic_count  FROM molecule  WHERE label = '-';	toxicology
SELECT DISTINCT m.molecule_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE SUBSTR(a.atom_id, 7, 2) BETWEEN '21' AND '25' AND m.label = '+';	toxicology
SELECT b.bond_id FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE (a1.element = 'p' AND a2.element = 'n') OR (a1.element = 'n' AND a2.element = 'p');	toxicology
SELECT label  FROM molecule  WHERE molecule_id = (     SELECT molecule_id      FROM bond      WHERE bond_type = '='      GROUP BY molecule_id      ORDER BY COUNT(bond_id) DESC      LIMIT 1 );	toxicology
SELECT      COUNT(bond_id) * 1.0 / COUNT(DISTINCT atom.atom_id) AS average_bonds FROM      atom LEFT JOIN      connected ON atom.atom_id = connected.atom_id WHERE      atom.element = 'i';	toxicology
SELECT bond_type, bond_id  FROM bond  WHERE SUBSTR(bond_id, 7, 2) + 0 = 45;	toxicology
SELECT element  FROM atom  WHERE atom_id NOT IN (SELECT atom_id FROM connected);	toxicology
SELECT a.atom_id, a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.molecule_id = 'TR041' AND b.bond_type = '#';	toxicology
SELECT a.element FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id WHERE b.bond_id = 'TR144_8_19';	toxicology
SELECT molecule_id, COUNT(*) AS double_bond_count  FROM bond  WHERE molecule_id IN (     SELECT molecule_id      FROM molecule      WHERE label = '+' ) AND bond_type = '=' GROUP BY molecule_id ORDER BY double_bond_count DESC LIMIT 1;	toxicology
SELECT a.element, COUNT(a.element) AS element_count FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' GROUP BY a.element ORDER BY element_count ASC LIMIT 1;	toxicology
SELECT a.atom_id, a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id2 WHERE c.atom_id IN (     SELECT atom_id     FROM atom     WHERE element = 'pb' );	toxicology
SELECT a.element  FROM bond AS b JOIN connected AS c ON b.bond_id = c.bond_id JOIN atom AS a ON c.atom_id = a.atom_id WHERE b.bond_type = '#';	toxicology
SELECT      (COUNT(bond.bond_id) * 100.0 / (         SELECT MAX(element_count)          FROM (             SELECT COUNT(atom.atom_id) AS element_count             FROM atom             GROUP BY atom.element         ) AS subquery     )) AS percentage_common_combination FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN atom AS a1 ON connected.atom_id = a1.atom_id JOIN atom AS a2 ON connected.atom_id2 = a2.atom_id WHERE a1.element || '-' || a2.element IN (     SELECT a.element || '-' || b.element     FROM atom AS a     JOIN atom AS b ON a.atom_id != b.atom_id     GROUP BY a.element || '-' || b.element     ORDER BY COUNT(a.element || '-' || b.element) DESC     LIMIT 1 );	toxicology
SELECT ROUND(SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) * 100.0 / COUNT(b.bond_id), 5) AS proportion FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '-';	toxicology
SELECT COUNT(*) AS total_atoms FROM atom WHERE element IN ('c', 'h');	toxicology
SELECT c.atom_id2 FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE a.element = 's';	toxicology
SELECT b.bond_type FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'sn';	toxicology
SELECT COUNT(DISTINCT a.element) AS element_count FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id WHERE b.bond_type = '-';	toxicology
SELECT COUNT(a.atom_id) AS total_atoms FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id WHERE b.bond_type = '#' AND a.element IN ('p', 'br');	toxicology
SELECT bond_id  FROM bond  WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+');	toxicology
SELECT DISTINCT m.molecule_id  FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '-' AND m.label = '-';	toxicology
SELECT      (CAST(SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(a.atom_id)) * 100 AS percent FROM      molecule m JOIN      bond b ON m.molecule_id = b.molecule_id JOIN      connected c ON b.bond_id = c.bond_id JOIN      atom a ON c.atom_id = a.atom_id WHERE      b.bond_type = '-';	toxicology
SELECT molecule_id, label  FROM molecule  WHERE molecule_id IN ('TR000', 'TR001', 'TR002');	toxicology
SELECT molecule_id  FROM molecule  WHERE label = '-';	toxicology
SELECT COUNT(*) AS total_carcinogenic_molecules FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR030' AND label = '+';	toxicology
SELECT molecule_id, bond_type  FROM bond  WHERE molecule_id BETWEEN 'TR000' AND 'TR050';	toxicology
SELECT a1.element AS element1, a2.element AS element2 FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE c.bond_id = 'TR001_10_11';	toxicology
SELECT COUNT(DISTINCT b.bond_id)  FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id WHERE a.element = 'i';	toxicology
SELECT label, COUNT(*) AS count FROM molecule WHERE molecule_id IN (     SELECT molecule_id     FROM atom     WHERE element = 'ca' ) GROUP BY label ORDER BY COUNT(*) DESC LIMIT 1;	toxicology
SELECT COUNT(*) AS count FROM connected JOIN atom a1 ON connected.atom_id = a1.atom_id JOIN atom a2 ON connected.atom_id2 = a2.atom_id WHERE connected.bond_id = 'TR001_1_8' AND        ((a1.element = 'cl' AND a2.element = 'c') OR         (a1.element = 'c' AND a2.element = 'cl'));	toxicology
SELECT DISTINCT m1.molecule_id, m2.molecule_id FROM molecule m1 JOIN bond b1 ON m1.molecule_id = b1.molecule_id JOIN connected c1 ON b1.bond_id = c1.bond_id JOIN atom a1 ON c1.atom_id = a1.atom_id JOIN molecule m2 ON m2.molecule_id = b1.molecule_id WHERE a1.element = 'c' AND b1.bond_type = '#' AND m1.label = '-' AND m2.label = '-' LIMIT 2;	toxicology
SELECT      (CAST(SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(a.atom_id)) * 100 AS percentage FROM      molecule m JOIN      atom a ON m.molecule_id = a.molecule_id WHERE      m.label = '+';	toxicology
SELECT element  FROM atom  WHERE molecule_id = 'TR001';	toxicology
SELECT DISTINCT molecule_id  FROM bond  WHERE bond_type = '=';	toxicology
SELECT c.atom_id AS first_atom, c.atom_id2 AS second_atom FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#';	toxicology
SELECT a.element FROM connected c JOIN atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id WHERE c.bond_id = 'TR000_1_2';	toxicology
SELECT COUNT(DISTINCT b.molecule_id) AS non_carcinogenic_single_bond_molecules FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '-' AND m.label = '-';	toxicology
SELECT m.label FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_id = 'TR001_10_11';	toxicology
SELECT b.bond_id,         CASE             WHEN m.label = '+' THEN 'Carcinogenic'             WHEN m.label = '-' THEN 'Non-carcinogenic'         END AS carcinogenic_status FROM bond AS b JOIN molecule AS m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '#';	toxicology
SELECT a.element, COUNT(*) AS tally FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' AND SUBSTR(a.atom_id, 7, 1) = '4' GROUP BY a.element;	toxicology
SELECT (CAST(SUM(CASE WHEN element = 'h' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(element)) AS ratio, label FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.molecule_id = 'TR006';	toxicology
SELECT DISTINCT      CASE          WHEN m.label = '+' THEN 'Carcinogenic'         WHEN m.label = '-' THEN 'Non-carcinogenic'     END AS carcinogenic_status FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'ca';	toxicology
SELECT DISTINCT b.bond_type FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'c';	toxicology
SELECT DISTINCT a.element  FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE c.bond_id = 'TR001_10_11';	toxicology
SELECT      (CAST(COUNT(DISTINCT b.molecule_id) AS FLOAT) /      (SELECT COUNT(DISTINCT molecule_id) FROM molecule) * 100) AS percentage_of_triple_bond FROM      bond b WHERE      b.bond_type = '#';	toxicology
SELECT      100.0 * SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) / COUNT(bond_id) AS percent FROM      bond WHERE      molecule_id = 'TR047';	toxicology
SELECT CASE             WHEN m.label = '+' THEN 'Carcinogenic'            ELSE 'Not Carcinogenic'        END AS molecule_status FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR001_1';	toxicology
SELECT      CASE          WHEN label = '+' THEN 'Yes'         ELSE 'No'     END AS is_carcinogenic FROM      molecule WHERE      molecule_id = 'TR151';	toxicology
SELECT element  FROM atom  WHERE molecule_id = 'TR151' AND element IN ('cl', 'br', 'f', 'i', 'sn', 'pb', 'te');	toxicology
SELECT COUNT(*)  FROM molecule  WHERE label = '+';	toxicology
SELECT atom_id  FROM atom  WHERE element = 'c'  AND substr(molecule_id, 3, 3) >= 10  AND substr(molecule_id, 3, 3) <= 50;	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+');	toxicology
SELECT b.bond_id FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '=' AND m.label = '+';	toxicology
SELECT COUNT(a.atom_id)  FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'h' AND m.label = '+';	toxicology
SELECT b.molecule_id FROM bond AS b JOIN connected AS c ON b.bond_id = c.bond_id WHERE c.atom_id = 'TR000_1' AND b.bond_id = 'TR000_1_2';	toxicology
SELECT a.atom_id  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE a.element = 'c' AND m.label = '-';	toxicology
SELECT      (CAST(SUM(CASE WHEN m.label = '+' AND a.element = 'h' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(m.molecule_id)) * 100.0 AS percentage FROM      molecule m JOIN      atom a ON      m.molecule_id = a.molecule_id;	toxicology
SELECT CASE WHEN label = '+' THEN 'Yes' ELSE 'No' END AS is_carcinogenic FROM molecule WHERE molecule_id = 'TR124';	toxicology
SELECT atom_id, element  FROM atom  WHERE molecule_id = 'TR186';	toxicology
SELECT bond_type  FROM bond  WHERE bond_id = 'TR007_4_19';	toxicology
SELECT DISTINCT a.element FROM connected c JOIN atom a ON c.atom_id = a.atom_id WHERE c.bond_id = 'TR001_2_4';	toxicology
SELECT COUNT(b.bond_id) AS double_bond_count,         CASE WHEN m.label = '+' THEN 'carcinogenic' ELSE 'non-carcinogenic' END AS is_carcinogenic FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.molecule_id = 'TR006' AND b.bond_type = ' = ';	toxicology
SELECT DISTINCT m.molecule_id, a.element FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+';	toxicology
SELECT b.bond_id, a1.atom_id AS atom_1, a2.atom_id AS atom_2, b.molecule_id FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE b.bond_type = '-';	toxicology
SELECT DISTINCT m.molecule_id, a.element FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON a.molecule_id = m.molecule_id WHERE b.bond_type = '#';	toxicology
SELECT a.element FROM connected c JOIN atom a ON c.atom_id = a.atom_id WHERE c.bond_id = 'TR000_2_3';	toxicology
SELECT COUNT(*) AS bond_count FROM connected WHERE atom_id IN (SELECT atom_id FROM atom WHERE element = 'cl')    OR atom_id2 IN (SELECT atom_id FROM atom WHERE element = 'cl');	toxicology
SELECT a.atom_id, COUNT(DISTINCT b.bond_type) AS bond_type_count FROM molecule m LEFT JOIN atom a ON m.molecule_id = a.molecule_id LEFT JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.molecule_id = 'TR346' GROUP BY a.atom_id;	toxicology
SELECT      COUNT(DISTINCT CASE WHEN m.label = '+' THEN m.molecule_id END) AS carcinogenic_molecules,     COUNT(DISTINCT b.molecule_id) AS total_molecules_with_double_bond FROM      bond b JOIN      molecule m ON b.molecule_id = m.molecule_id WHERE      b.bond_type = '=';	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m WHERE m.molecule_id NOT IN (     SELECT DISTINCT a.molecule_id      FROM atom a      WHERE a.element = 's' ) AND m.molecule_id NOT IN (     SELECT DISTINCT b.molecule_id      FROM bond b      WHERE b.bond_type = '=' );	toxicology
SELECT m.label  FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_id = 'TR001_2_4';	toxicology
SELECT COUNT(*)  FROM atom  WHERE molecule_id = 'TR001';	toxicology
SELECT COUNT(*)  FROM bond  WHERE bond_type = '-';	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'cl' AND m.label = '+';	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'c' AND m.label = '-';	toxicology
SELECT      (CAST(SUM(CASE WHEN m.label = '+' AND a.element = 'cl' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(m.molecule_id)) * 100 AS percentage FROM      molecule m JOIN      atom a ON m.molecule_id = a.molecule_id;	toxicology
SELECT molecule_id  FROM bond  WHERE bond_id = 'TR001_1_7';	toxicology
SELECT COUNT(DISTINCT a.element) AS element_count FROM connected c JOIN atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id WHERE c.bond_id = 'TR001_3_4';	toxicology
SELECT b.bond_type FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE c.atom_id = 'TR000_1' AND c.atom_id2 = 'TR000_2';	toxicology
SELECT m.molecule_id, m.label FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id JOIN molecule m ON a1.molecule_id = m.molecule_id WHERE a1.atom_id = 'TR000_2' AND a2.atom_id = 'TR000_4';	toxicology
SELECT element  FROM atom  WHERE atom_id = 'TR000_1';	toxicology
SELECT      CASE          WHEN label = '+' THEN 'Carcinogenic'         WHEN label = '-' THEN 'Non-carcinogenic'     END AS carcinogenic_status FROM molecule WHERE molecule_id = 'TR000';	toxicology
SELECT      (CAST(SUM(CASE WHEN b.bond_type = '-' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(b.bond_id)) * 100 AS percentage FROM      bond b;	toxicology
SELECT COUNT(DISTINCT m.molecule_id) AS carcinogenic_molecule_count FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' AND a.element = 'n';	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN bond b ON m.molecule_id = b.molecule_id JOIN connected c ON b.bond_id = c.bond_id WHERE a.element = 's' AND b.bond_type = '=';	toxicology
SELECT molecule_id FROM atom WHERE molecule_id IN (     SELECT molecule_id     FROM molecule     WHERE label = '-' ) GROUP BY molecule_id HAVING COUNT(molecule_id) > 5;	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '=' AND b.molecule_id = 'TR024';	toxicology
SELECT molecule.molecule_id, COUNT(atom.atom_id) AS atom_count FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '+' GROUP BY molecule.molecule_id ORDER BY atom_count DESC LIMIT 1;	toxicology
SELECT      (COUNT(DISTINCT m.molecule_id) * 100.0 / (SELECT COUNT(*) FROM molecule WHERE label = '+')) AS percentage FROM      molecule m JOIN      atom a ON m.molecule_id = a.molecule_id JOIN      connected c ON a.atom_id = c.atom_id JOIN      bond b ON c.bond_id = b.bond_id WHERE      m.label = '+' AND a.element = 'h' AND b.bond_type = '#';	toxicology
SELECT COUNT(*) AS carcinogenic_molecules FROM molecule WHERE label = '+';	toxicology
SELECT COUNT(DISTINCT b.molecule_id) AS single_bond_molecule_count FROM bond AS b WHERE b.bond_type = '-' AND b.molecule_id BETWEEN 'TR004' AND 'TR010';	toxicology
SELECT COUNT(*)  FROM atom  WHERE molecule_id = 'TR008' AND element = 'c';	toxicology
SELECT a.element FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR004_7' AND m.label = '-';	toxicology
SELECT COUNT(DISTINCT m.molecule_id) AS total_molecules FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id WHERE a.element = 'o' AND b.bond_type = '=';	toxicology
SELECT COUNT(*)  FROM molecule  WHERE molecule_id IN (     SELECT DISTINCT bond.molecule_id      FROM bond      WHERE bond.bond_type = '#' )  AND label = '-';	toxicology
SELECT a.element, b.bond_type FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id WHERE a.molecule_id = 'TR002';	toxicology
SELECT a.atom_id FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id JOIN connected c ON c.bond_id = b.bond_id WHERE a.molecule_id = 'TR012' AND a.element = 'c' AND b.bond_type = '=';	toxicology
SELECT atom.atom_id FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '+' AND atom.element = 'o';	toxicology
SELECT *  FROM cards  WHERE cardKingdomFoilId IS NOT NULL  AND cardKingdomId IS NOT NULL;	card_games
SELECT *  FROM cards  WHERE borderColor = 'borderless'  AND cardKingdomFoilId IS NULL  AND cardKingdomId IS NOT NULL;	card_games
SELECT name  FROM cards  WHERE faceConvertedManaCost = (SELECT MAX(faceConvertedManaCost) FROM cards);	card_games
SELECT name  FROM cards  WHERE edhrecRank < 100 AND frameVersion = '2015';	card_games
SELECT c.name, c.rarity, l.format, l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'mythic' AND l.format = 'gladiator' AND l.status = 'Banned';	card_games
SELECT c.name, l.status  FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.types = 'Artifact' AND c.side IS NULL AND l.format = 'vintage';	card_games
SELECT c.id, c.artist  FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE (c.power = '*' OR c.power IS NULL)    AND l.format = 'commander'    AND l.status = 'Legal';	card_games
SELECT c.id AS card_id, r.text AS ruling_text  FROM cards c LEFT JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Stephen Daniele' AND c.hasContentWarning = 1;	card_games
SELECT rulings.date, rulings.text  FROM rulings  INNER JOIN cards ON rulings.uuid = cards.uuid  WHERE cards.name = 'Sublime Epiphany' AND cards.number = '74s';	card_games
SELECT c.name AS card_name, c.artist AS card_artist, c.isPromo AS is_promotional_printing FROM cards c JOIN rulings r ON c.uuid = r.uuid GROUP BY c.name, c.artist, c.isPromo ORDER BY COUNT(r.uuid) DESC LIMIT 1;	card_games
SELECT fd.language  FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE c.name = 'Annul' AND c.number = '29';	card_games
SELECT c.name  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE fd.language = 'Japanese';	card_games
SELECT      (CAST(SUM(CASE WHEN language = 'Chinese Simplified' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(id)) * 100 AS percentage FROM foreign_data;	card_games
SELECT s.name AS set_name, s.totalSetSize AS total_cards FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian';	card_games
SELECT COUNT(DISTINCT type)  FROM cards  WHERE artist = 'Aaron Boyd';	card_games
SELECT keywords  FROM cards  WHERE name = 'Angel of Mercy';	card_games
SELECT COUNT(*)  FROM cards  WHERE power = '*';	card_games
SELECT promoTypes  FROM cards  WHERE name = 'Duress';	card_games
SELECT borderColor  FROM cards  WHERE name = 'Ancestor''s Chosen';	card_games
SELECT originalType  FROM cards  WHERE name = "Ancestor's Chosen";	card_games
SELECT st.language, st.translation  FROM cards c JOIN sets s ON c.setCode = s.code JOIN set_translations st ON s.code = st.setCode WHERE c.name = 'Angel of Mercy';	card_games
SELECT COUNT(DISTINCT c.id)  FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.status = 'restricted' AND c.isTextless = 0;	card_games
SELECT r.text  FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.name = 'Condemn';	card_games
SELECT COUNT(DISTINCT c.id) AS count_of_cards FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.status = 'restricted' AND c.isStarter = 1;	card_games
SELECT l.status  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE c.name = 'Cloudchaser Eagle';	card_games
SELECT type  FROM cards  WHERE name = 'Benalish Knight';	card_games
SELECT l.format, l.status  FROM legalities l JOIN cards c ON l.uuid = c.uuid WHERE c.name = 'Benalish Knight';	card_games
SELECT DISTINCT c.artist FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Phyrexian' AND c.artist IS NOT NULL;	card_games
SELECT (CAST(COUNT(CASE WHEN borderColor = 'borderless' THEN id END) AS FLOAT) / COUNT(id)) * 100 AS percentage_borderless_cards FROM cards;	card_games
SELECT COUNT(DISTINCT c.id) AS reprinted_german_cards_count FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'German' AND c.isReprint = 1;	card_games
SELECT COUNT(*) FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.borderColor = 'borderless' AND foreign_data.language = 'Russian';	card_games
SELECT      (CAST(COUNT(fd.id) AS FLOAT) / (SELECT COUNT(c.id) FROM cards c WHERE c.isStorySpotlight = 1) * 100) AS percentage FROM      foreign_data fd JOIN      cards c ON fd.uuid = c.uuid WHERE      fd.language = 'French' AND c.isStorySpotlight = 1;	card_games
SELECT COUNT(*)  FROM cards  WHERE toughness = '99';	card_games
SELECT name  FROM cards  WHERE artist = 'Aaron Boyd';	card_games
SELECT COUNT(*)  FROM cards  WHERE borderColor = 'black' AND availability = 'mtgo';	card_games
SELECT id FROM cards WHERE convertedManaCost = 0;	card_games
SELECT DISTINCT layout  FROM cards  WHERE keywords LIKE '%flying%';	card_games
SELECT COUNT(*)  FROM cards  WHERE originalType = 'Summon - Angel'  AND (subtypes IS NULL OR subtypes != 'Angel');	card_games
SELECT id  FROM cards  WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT id  FROM cards  WHERE duelDeck = 'a';	card_games
SELECT edhrecRank  FROM cards  WHERE frameVersion = '2015';	card_games
SELECT DISTINCT c.artist  FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Chinese Simplified';	card_games
SELECT c.name  FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.availability = 'paper' AND fd.language = 'Japanese';	card_games
SELECT COUNT(DISTINCT c.id) AS banned_white_border_count FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.status = 'Banned' AND c.borderColor = 'white';	card_games
SELECT l.uuid, fd.language  FROM legalities l  JOIN foreign_data fd  ON l.uuid = fd.uuid  WHERE l.format = 'legacy';	card_games
SELECT rulings.date, rulings.text  FROM rulings  JOIN cards ON rulings.uuid = cards.uuid  WHERE cards.name = 'Beacon of Immortality';	card_games
SELECT COUNT(c.id) AS card_count, l.status  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE c.frameVersion = 'future' AND l.status = 'Legal'  GROUP BY l.status;	card_games
SELECT name, colors  FROM cards  WHERE setCode = 'OGW';	card_games
SELECT c.name AS card_name, st.language, st.translation FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE c.setCode = '10E' AND c.convertedManaCost = 5;	card_games
SELECT c.name AS card_name, r.date AS ruling_date FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.originalType = 'Creature - Elf';	card_games
SELECT cards.id, cards.colors, legalities.format  FROM cards  LEFT JOIN legalities ON cards.uuid = legalities.uuid  WHERE cards.id BETWEEN 1 AND 20;	card_games
SELECT c.id, c.name, c.originalType, c.colors, fd.language FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.originalType = 'Artifact' AND c.colors = 'B';	card_games
SELECT c.name  FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.rarity = 'uncommon' ORDER BY r.date ASC LIMIT 3;	card_games
SELECT COUNT(*)  FROM cards  WHERE artist = 'John Avon'    AND cardKingdomId IS NOT NULL    AND cardKingdomFoilId IS NOT NULL    AND power IS NULL;	card_games
SELECT COUNT(*)  FROM cards  WHERE borderColor = 'white'  AND cardKingdomFoilId IS NOT NULL  AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*)  FROM cards  WHERE artist = 'UDON'  AND availability = 'mtgo'  AND hand = '-1';	card_games
SELECT COUNT(*)  FROM cards  WHERE frameVersion = '1993' AND availability = 'paper' AND hasContentWarning = 1;	card_games
SELECT manaCost  FROM cards  WHERE layout = 'normal'    AND frameVersion = '2003'    AND borderColor = 'black'    AND availability = 'mtgo,paper';	card_games
SELECT SUM(convertedManaCost) AS total_unconverted_mana FROM cards WHERE artist = 'Rob Alexander';	card_games
SELECT DISTINCT subtypes, supertypes  FROM cards  WHERE availability = 'arena';	card_games
SELECT DISTINCT setCode  FROM set_translations  WHERE language = 'Spanish';	card_games
SELECT (CAST(COUNT(CASE WHEN isOnlineOnly = 1 THEN 1 END) AS FLOAT) / COUNT(id)) * 100 AS percentage FROM cards WHERE frameEffects = 'legendary';	card_games
SELECT      (CAST(COUNT(CASE WHEN isStorySpotlight = 1 AND isTextless = 0 THEN id END) AS FLOAT) / COUNT(id)) * 100 AS percentage,     GROUP_CONCAT(CASE WHEN isStorySpotlight = 1 AND isTextless = 0 THEN id END) AS ids FROM cards;	card_games
SELECT     fd.name,     (COUNT(CASE WHEN fd.language = 'Spanish' THEN fd.id END) * 100.0 / COUNT(fd.id)) AS percentage FROM     foreign_data fd GROUP BY     fd.name;	card_games
SELECT st.language  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE s.baseSetSize = 309;	card_games
SELECT COUNT(*)  FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.block = 'Commander' AND st.language = 'Portuguese (Brasil)';	card_games
SELECT cards.id  FROM cards  JOIN legalities ON cards.uuid = legalities.uuid  WHERE legalities.status = 'Legal' AND cards.types = 'Creature';	card_games
SELECT DISTINCT c.subtypes, c.supertypes  FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'German' AND c.subtypes IS NOT NULL AND c.supertypes IS NOT NULL;	card_games
SELECT COUNT(*)  FROM cards  WHERE (power IS NULL OR power = '*')    AND text LIKE '%triggered ability%';	card_games
SELECT COUNT(*)  FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN rulings r ON c.uuid = r.uuid WHERE l.format = 'premodern'    AND r.text = 'This is a triggered mana ability.'    AND c.side IS NULL;	card_games
SELECT c.id FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.artist = 'Erica Yang' AND c.availability = 'paper' AND l.format = 'pauper' AND l.status = 'Legal';	card_games
SELECT c.artist  FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.text = "Das perfekte Gegenmittel zu einer dichten Formation";	card_games
SELECT fd.name AS foreign_name FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE fd.language = 'French'   AND c.type LIKE '%Creature%'   AND c.layout = 'normal'   AND c.borderColor = 'black'   AND c.artist = 'Matthew D. Wilson';	card_games
SELECT COUNT(*)  FROM cards  JOIN rulings ON cards.uuid = rulings.uuid  WHERE cards.rarity = 'rare' AND rulings.date = '2007-02-01';	card_games
SELECT DISTINCT st.language  FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.baseSetSize = 180 AND s.block = 'Ravnica';	card_games
SELECT (COUNT(c.id) * 100.0 / (SELECT COUNT(c.id) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.format = 'commander' AND l.status = 'Legal')) AS percentage FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.format = 'commander' AND l.status = 'Legal' AND c.hasContentWarning = 0;	card_games
SELECT      (CAST(SUM(CASE WHEN fd.language = 'French' AND (c.power IS NULL OR c.power = '*') THEN 1 ELSE 0 END) AS FLOAT) /      CAST(SUM(CASE WHEN c.power IS NULL OR c.power = '*' THEN 1 ELSE 0 END) AS FLOAT)) * 100 AS percentage FROM      cards c LEFT JOIN      foreign_data fd ON      c.uuid = fd.uuid;	card_games
SELECT      (CAST(COUNT(CASE WHEN st.language = 'Japanese' AND s.type = 'expansion' THEN 1 END) AS FLOAT) /      CAST(COUNT(CASE WHEN st.language = 'Japanese' THEN 1 END) AS FLOAT)) * 100 AS percentage_of_expansion_sets FROM      set_translations st JOIN      sets s ON st.setCode = s.code;	card_games
SELECT availability  FROM cards  WHERE artist = 'Daren Bader';	card_games
SELECT COUNT(*)  FROM cards  WHERE borderColor = 'borderless'    AND edhrecRank > 12000    AND colors IS NOT NULL;	card_games
SELECT COUNT(*)  FROM cards  WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1;	card_games
SELECT name  FROM cards  WHERE (power IS NULL OR power = '*')    AND promoTypes = 'arenaleague'  ORDER BY name ASC  LIMIT 3;	card_games
SELECT language  FROM foreign_data  WHERE multiverseid = 149934;	card_games
SELECT id  FROM cards  WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL  ORDER BY cardKingdomFoilId ASC  LIMIT 3;	card_games
SELECT (CAST(COUNT(*) AS FLOAT) / (SELECT COUNT(*) FROM cards WHERE isTextless = 1) * 100) AS proportion  FROM cards  WHERE isTextless = 1 AND layout = 'normal';	card_games
SELECT number  FROM cards  WHERE side IS NULL AND subtypes LIKE '%Angel%' AND subtypes LIKE '%Wizard%';	card_games
SELECT name  FROM sets  WHERE mtgoCode IS NULL OR mtgoCode = ''  ORDER BY name ASC  LIMIT 3;	card_games
SELECT language  FROM set_translations  WHERE setCode = 'ARC' AND EXISTS (     SELECT 1      FROM sets      WHERE code = 'ARC' AND mcmName = 'Archenemy' );	card_games
SELECT sets.name AS set_name, set_translations.translation AS set_translation FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.id = 5;	card_games
SELECT st.language, s.type  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE s.id = 206;	card_games
SELECT s.id, s.name  FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian' AND s.block = 'Shadowmoor' ORDER BY s.name ASC LIMIT 2;	card_games
SELECT s.id, s.name  FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.isForeignOnly = 1 AND s.isFoilOnly = 1 AND st.language = 'Japanese';	card_games
SELECT s.name AS set_name, s.baseSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Russian' ORDER BY s.baseSetSize DESC LIMIT 1;	card_games
SELECT      (CAST(COUNT(DISTINCT c.uuid) AS FLOAT) / (SELECT COUNT(*) FROM cards) * 100) AS percentage FROM      cards c JOIN      set_translations st ON st.setCode = c.setCode WHERE      st.language = 'Chinese Simplified'      AND c.isOnlineOnly = 1;	card_games
SELECT COUNT(DISTINCT sets.code)  FROM sets  JOIN set_translations ON sets.code = set_translations.setCode  WHERE set_translations.language = 'Japanese'  AND (sets.mtgoCode IS NULL OR sets.mtgoCode = '');	card_games
SELECT id  FROM cards  WHERE borderColor = 'black';	card_games
SELECT COUNT(*) AS total_cards, GROUP_CONCAT(id) AS card_ids  FROM cards  WHERE frameEffects = 'extendedart';	card_games
SELECT name  FROM cards  WHERE borderColor = 'black' AND isFullArt = 1;	card_games
SELECT language  FROM set_translations  WHERE setCode = (SELECT code FROM sets WHERE id = 174);	card_games
SELECT name  FROM sets  WHERE code = 'ALL';	card_games
SELECT DISTINCT language  FROM foreign_data  WHERE name = 'A Pedra Fellwar';	card_games
SELECT code  FROM sets  WHERE releaseDate = '2007-07-13';	card_games
SELECT baseSetSize, code  FROM sets  WHERE block IN ('Masques', 'Mirage');	card_games
SELECT code FROM sets WHERE type = 'expansion';	card_games
SELECT fd.name AS foreign_name, fd.type AS card_type FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.watermark = 'boros';	card_games
SELECT fd.language, fd.flavorText, c.type FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.watermark = 'colorpie';	card_games
SELECT (COUNT(c.convertedManaCost = 10) * 100.0 / COUNT(*)) AS percentage FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Abyssal Horror';	card_games
SELECT code  FROM sets  WHERE type = 'expansion commander';	card_games
SELECT fd.name AS foreign_name, fd.type  FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.watermark = 'abzan';	card_games
SELECT fd.language, fd.type FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.watermark = 'azorius';	card_games
SELECT COUNT(*)  FROM cards  WHERE artist = 'Aaron Miller'  AND cardKingdomFoilId IS NOT NULL  AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*)  FROM cards  WHERE availability LIKE '%paper%'  AND hand = '3';	card_games
SELECT name  FROM cards  WHERE isTextless = 0;	card_games
SELECT convertedManaCost  FROM cards  WHERE name = 'Ancestor`s Chosen';	card_games
SELECT COUNT(*)  FROM cards  WHERE borderColor = 'white' AND (power = '*' OR power IS NULL);	card_games
SELECT name  FROM cards  WHERE isPromo = 1 AND side IS NOT NULL;	card_games
SELECT subtypes, supertypes  FROM cards  WHERE name = 'Molimo, Maro-Sorcerer';	card_games
SELECT purchaseUrls  FROM cards  WHERE promoTypes = 'bundle';	card_games
SELECT COUNT(DISTINCT artist)  FROM cards  WHERE borderColor = 'black'  AND availability LIKE '%arena,mtgo%';	card_games
SELECT name, convertedManaCost  FROM cards  WHERE name IN ('Serra Angel', 'Shrine Keeper')  ORDER BY convertedManaCost DESC  LIMIT 1;	card_games
SELECT artist  FROM cards  WHERE flavorName = 'Battra, Dark Destroyer';	card_games
SELECT name  FROM cards  WHERE frameVersion = '2003'  ORDER BY convertedManaCost DESC  LIMIT 3;	card_games
SELECT st.translation  FROM set_translations st JOIN sets s ON st.setCode = s.code JOIN cards c ON c.setCode = s.code WHERE st.language = 'Italian' AND c.name = 'Ancestor''s Chosen';	card_games
SELECT COUNT(*)  FROM set_translations  WHERE setCode IN (     SELECT setCode      FROM cards      WHERE name = 'Angel of Mercy' );	card_games
SELECT c.name  FROM cards c JOIN sets s ON c.setCode = s.code JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition';	card_games
SELECT st.translation  FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE c.name = 'Ancestor''s Chosen' AND st.language = 'Korean';	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Adam Rex' AND setCode = (     SELECT setCode     FROM set_translations     WHERE translation = 'Hauptset Zehnte Edition' );	card_games
SELECT s.baseSetSize  FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition';	card_games
SELECT st.translation  FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.name = 'Eighth Edition' AND st.language = 'Chinese Simplified';	card_games
SELECT s.name  FROM cards c  JOIN sets s ON c.setCode = s.code  WHERE c.name = 'Angel of Mercy' AND s.mtgoCode IS NOT NULL;	card_games
SELECT sets.releaseDate  FROM sets  JOIN cards ON sets.code = cards.setCode  WHERE cards.name = 'Ancestor''s Chosen';	card_games
SELECT s.type  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE st.translation = 'Hauptset Zehnte Edition';	card_games
SELECT COUNT(DISTINCT s.code)  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE s.block = 'Ice Age' AND st.language = 'Italian' AND st.translation IS NOT NULL;	card_games
SELECT s.name, s.isForeignOnly FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Adarkar Valkyrie';	card_games
SELECT COUNT(DISTINCT s.code) AS set_count FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian' AND st.translation IS NOT NULL AND s.baseSetSize < 100;	card_games
SELECT COUNT(*) FROM cards WHERE setCode = (SELECT code FROM sets WHERE name = 'Coldsnap') AND borderColor = 'black';	card_games
SELECT c.name  FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap' AND c.convertedManaCost = (     SELECT MAX(convertedManaCost)      FROM cards      WHERE setCode = s.code );	card_games
SELECT DISTINCT artist  FROM cards  WHERE artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy')  AND setCode = (SELECT code FROM sets WHERE name = 'Coldsnap');	card_games
SELECT *  FROM cards  WHERE setCode = (SELECT code FROM sets WHERE name = 'Coldsnap')  AND number = '4';	card_games
SELECT COUNT(*)  FROM cards C JOIN sets S ON C.setCode = S.code WHERE S.name = 'Coldsnap'  AND C.convertedManaCost > 5  AND (C.power = '*' OR C.power IS NULL);	card_games
SELECT f.flavorText  FROM foreign_data f JOIN cards c ON f.uuid = c.uuid WHERE c.name = 'Ancestor''s Chosen' AND f.language = 'Italian';	card_games
SELECT DISTINCT language  FROM foreign_data  WHERE name = 'Ancestor''s Chosen' AND flavorText IS NOT NULL;	card_games
SELECT f.type  FROM foreign_data f JOIN cards c ON f.uuid = c.uuid WHERE f.language = 'German' AND c.name = 'Ancestor''s Chosen';	card_games
SELECT r.text  FROM rulings r JOIN cards c ON r.uuid = c.uuid JOIN sets s ON c.setCode = s.code JOIN set_translations st ON s.code = st.setCode WHERE s.name = 'Coldsnap' AND st.language = 'Italian';	card_games
SELECT fd.name AS italian_name FROM cards c JOIN sets s ON c.setCode = s.code JOIN foreign_data fd ON c.uuid = fd.uuid WHERE s.name = 'Coldsnap' AND fd.language = 'Italian' AND c.convertedManaCost = (     SELECT MAX(convertedManaCost)     FROM cards c2     JOIN sets s2 ON c2.setCode = s2.code     WHERE s2.name = 'Coldsnap' );	card_games
SELECT r.date  FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.name = 'Reminisce';	card_games
SELECT      (CAST(SUM(CASE WHEN c.convertedManaCost = 7 THEN 1 ELSE 0 END) AS FLOAT) / COUNT(c.id)) * 100 AS percentage FROM      cards c JOIN      sets s ON c.setCode = s.code WHERE      s.name = 'Coldsnap';	card_games
SELECT      (CAST(SUM(CASE WHEN cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) AS FLOAT) /      CAST(COUNT(*) AS FLOAT)) * 100 AS percentage_incredibly_powerful FROM cards WHERE setCode = (SELECT code FROM sets WHERE name = 'Coldsnap');	card_games
SELECT code FROM sets WHERE releaseDate = '2017-07-14';	card_games
SELECT keyruneCode FROM sets WHERE code = 'PKHC';	card_games
SELECT mcmId  FROM sets  WHERE code = 'SS2';	card_games
SELECT mcmName  FROM sets  WHERE releaseDate = '2017-06-09';	card_games
SELECT type  FROM sets  WHERE name = "From the Vault: Lore";	card_games
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized';	card_games
SELECT c.name AS card_name, r.text AS ruling_text, c.hasContentWarning AS has_missing_or_degraded_properties FROM cards c LEFT JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Jim Pavelec';	card_games
SELECT s.releaseDate  FROM sets s JOIN cards c ON c.setCode = s.code WHERE c.name = 'Evacuation';	card_games
SELECT s.baseSetSize  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE st.translation = 'Rinascita di Alara';	card_games
SELECT s.type  FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Huitième édition';	card_games
SELECT st.translation  FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE c.name = 'Tendo Ice Bridge' AND st.language = 'French';	card_games
SELECT COUNT(*)  FROM set_translations  WHERE setCode = (SELECT code FROM sets WHERE name = 'Tenth Edition')    AND translation IS NOT NULL;	card_games
SELECT st.translation  FROM set_translations st JOIN sets s ON st.setCode = s.code JOIN cards c ON s.code = c.setCode WHERE st.language = 'Japanese' AND c.name = 'Fellwar Stone';	card_games
SELECT c.name, MAX(c.convertedManaCost) AS max_convertedManaCost FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Journey into Nyx Hero''s Path' GROUP BY c.name ORDER BY max_convertedManaCost DESC LIMIT 1;	card_games
SELECT s.releaseDate  FROM sets s  JOIN set_translations st  ON s.code = st.setCode  WHERE st.translation = 'Ola de frío';	card_games
SELECT sets.type  FROM sets  JOIN cards ON sets.code = cards.setCode  WHERE cards.name = 'Samite Pilgrim';	card_games
SELECT COUNT(*)  FROM cards  JOIN sets ON cards.setCode = sets.code  WHERE sets.name = 'World Championship Decks 2004' AND cards.convertedManaCost = 3;	card_games
SELECT st.translation  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE s.name = 'Mirrodin' AND st.language = 'Chinese Simplified';	card_games
SELECT      (SUM(CASE WHEN s.isNonFoilOnly = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS percentage_non_foil FROM      set_translations st JOIN      sets s ON st.setCode = s.code WHERE      st.language = 'Japanese';	card_games
SELECT (SUM(c.isOnlineOnly = 1) * 100.0) / SUM(st.language = 'Portuguese (Brazil)') AS percentage_online_only FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE st.language = 'Portuguese (Brazil)';	card_games
SELECT DISTINCT availability  FROM cards  WHERE artist = 'Aleksi Briclot' AND isTextless = 1;	card_games
SELECT id  FROM sets  WHERE baseSetSize = (SELECT MAX(baseSetSize) FROM sets);	card_games
SELECT artist  FROM cards  WHERE side IS NULL  ORDER BY convertedManaCost DESC  LIMIT 1;	card_games
SELECT frameEffects, COUNT(frameEffects) AS count FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL GROUP BY frameEffects ORDER BY count DESC LIMIT 1;	card_games
SELECT COUNT(*)  FROM cards  WHERE (power IS NULL OR power = '*')  AND hasFoil = 0  AND duelDeck = 'a';	card_games
SELECT id  FROM sets  WHERE type = 'commander'  ORDER BY totalSetSize DESC  LIMIT 1;	card_games
SELECT c.name, c.manaCost, c.convertedManaCost FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.format = 'duel' ORDER BY c.convertedManaCost DESC LIMIT 10;	card_games
SELECT c.originalReleaseDate, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'mythic' AND l.status = 'Legal' ORDER BY c.originalReleaseDate ASC LIMIT 1;	card_games
SELECT COUNT(DISTINCT c.id) AS card_count FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.artist = 'Volkan Baǵa' AND fd.language = 'French';	card_games
SELECT COUNT(DISTINCT c.id) AS rare_enchantment_abundance_count FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'rare'    AND c.types = 'Enchantment'    AND c.name = 'Abundance'    AND NOT EXISTS (     SELECT 1      FROM legalities l2      WHERE l2.uuid = c.uuid AND l2.status != 'Legal'   );	card_games
SELECT      l.format,      c.name FROM      legalities l JOIN      cards c ON l.uuid = c.uuid WHERE      l.status = 'Banned' AND l.format = (         SELECT              l1.format         FROM              legalities l1         WHERE              l1.status = 'Banned'         GROUP BY              l1.format         ORDER BY              COUNT(l1.status) DESC         LIMIT 1     );	card_games
SELECT language  FROM set_translations  WHERE setCode = (SELECT code FROM sets WHERE name = 'Battlebond');	card_games
WITH ArtistCardCount AS (     SELECT          artist,         COUNT(*) AS card_count     FROM          cards     WHERE          artist IS NOT NULL     GROUP BY          artist     ORDER BY          card_count ASC     LIMIT 1 ), CardsByLeastIllustrator AS (     SELECT          c.uuid     FROM          cards c     INNER JOIN          ArtistCardCount acc     ON          c.artist = acc.artist ) SELECT      DISTINCT l.format FROM      legalities l INNER JOIN      CardsByLeastIllustrator cbli ON      l.uuid = cbli.uuid;	card_games
SELECT l.status  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE c.frameVersion = '1997'    AND c.artist = 'D. Alexander Gregory'    AND c.hasContentWarning = 1    AND l.format = 'legacy';	card_games
SELECT c.name, l.format  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE c.edhrecRank = 1 AND l.status = 'Banned';	card_games
SELECT AVG(set_count) AS annual_average_sets, common_language FROM (     SELECT COUNT(id) AS set_count,             MAX(language_count) AS common_language     FROM (         SELECT s.id, st.language, COUNT(st.language) AS language_count         FROM sets s         LEFT JOIN set_translations st ON s.code = st.setCode         WHERE s.releaseDate BETWEEN '2012-01-01' AND '2015-12-31'         GROUP BY st.language, s.id     ) subquery ) final_query;	card_games
SELECT DISTINCT artist FROM cards WHERE borderColor = 'black' AND availability = 'arena';	card_games
SELECT uuid  FROM legalities  WHERE format = 'oldschool' AND (status = 'banned' OR status = 'restricted');	card_games
SELECT COUNT(*)  FROM cards  WHERE artist = 'Matthew D. Wilson' AND availability = 'paper';	card_games
SELECT rulings.text, rulings.date  FROM rulings  JOIN cards ON rulings.uuid = cards.uuid  WHERE cards.artist = 'Kev Walker'  ORDER BY rulings.date DESC;	card_games
SELECT cards.name AS card_name, legalities.format AS legal_format FROM cards JOIN sets ON cards.setCode = sets.code JOIN legalities ON cards.uuid = legalities.uuid WHERE sets.name = 'Hour of Devastation' AND legalities.status = 'Legal';	card_games
SELECT DISTINCT s.name FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Korean' AND s.code NOT IN (     SELECT st2.setCode     FROM set_translations st2     WHERE st2.language LIKE '%Japanese%' );	card_games
SELECT DISTINCT      c.frameVersion AS frame_styles,      c.name AS card_name,      l.format AS banned_format  FROM      cards c  LEFT JOIN      legalities l ON c.uuid = l.uuid  WHERE      c.artist = 'Allen Williams'      OR l.status = 'Banned';	card_games
SELECT DisplayName, Reputation  FROM users  WHERE DisplayName IN ('Harlan', 'Jarrod Dixon')  ORDER BY Reputation DESC  LIMIT 1;	codebase_community
SELECT DisplayName FROM users WHERE strftime('%Y', CreationDate) = '2011';	codebase_community
SELECT COUNT(*)  FROM users  WHERE LastAccessDate > '2014-09-01';	codebase_community
SELECT DisplayName  FROM users  ORDER BY Views DESC  LIMIT 1;	codebase_community
SELECT COUNT(*) AS UserCount FROM users WHERE UpVotes > 100 AND DownVotes > 1;	codebase_community
SELECT COUNT(*)  FROM users  WHERE Views > 10 AND strftime('%Y', CreationDate) > '2013';	codebase_community
SELECT COUNT(*) AS PostCount FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie');	codebase_community
SELECT p.Title  FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Eliciting priors from experts';	codebase_community
SELECT p.Title  FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' ORDER BY p.ViewCount DESC LIMIT 1;	codebase_community
SELECT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts);	codebase_community
SELECT SUM(posts.CommentCount) AS TotalComments FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'csgillespie';	codebase_community
SELECT MAX(p.AnswerCount) AS MaxAnswerCount FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT u.DisplayName  FROM posts p  JOIN users u ON p.LastEditorUserId = u.Id  WHERE p.Title = 'Examples for teaching: Correlation does not mean causation';	codebase_community
SELECT COUNT(*)  FROM posts  WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')  AND ParentId IS NULL;	codebase_community
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ClosedDate IS NOT NULL;	codebase_community
SELECT COUNT(*) AS PostCount FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.Age > 65 AND p.Score >= 20;	codebase_community
SELECT u.Location  FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Eliciting priors from experts';	codebase_community
SELECT Body  FROM posts  WHERE Id = (SELECT ExcerptPostId FROM tags WHERE TagName = 'bayesian');	codebase_community
SELECT Body  FROM posts  WHERE Id = (SELECT ExcerptPostId              FROM tags              WHERE Count = (SELECT MAX(Count) FROM tags));	codebase_community
SELECT COUNT(*) AS BadgeCount FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie');	codebase_community
SELECT b.Name  FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT COUNT(*)  FROM badges  WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')    AND strftime('%Y', Date) = '2011';	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId GROUP BY u.Id, u.DisplayName ORDER BY COUNT(b.Id) DESC LIMIT 1;	codebase_community
SELECT AVG(p.Score) AS AverageScore FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT AVG(BadgeCount) AS AverageBadges FROM (     SELECT u.DisplayName, COUNT(b.Id) AS BadgeCount     FROM users u     LEFT JOIN badges b ON u.Id = b.UserId     WHERE u.Views > 200     GROUP BY u.DisplayName ) AS BadgeCounts;	codebase_community
SELECT      (CAST(COUNT(p.Id) FILTER (WHERE u.Age > 65) AS FLOAT) / COUNT(p.Id)) * 100 AS Percentage FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Score > 5;	codebase_community
SELECT COUNT(*) AS VoteCount FROM votes WHERE UserId = 58 AND CreationDate = '2010-07-19';	codebase_community
SELECT CreationDate, COUNT(Id) AS VoteCount FROM votes GROUP BY CreationDate ORDER BY VoteCount DESC LIMIT 1;	codebase_community
SELECT COUNT(Id) AS RevivalBadgeCount FROM badges WHERE Name = 'Revival';	codebase_community
SELECT p.Title  FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.Score = (SELECT MAX(Score) FROM comments);	codebase_community
SELECT p.CommentCount FROM posts p WHERE p.ViewCount = 1910;	codebase_community
SELECT p.FavoriteCount FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.UserId = '3025' AND c.CreationDate = '2014-04-23 20:29:39.0';	codebase_community
SELECT c.Text  FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ParentId = 107829 AND p.CommentCount = 1;	codebase_community
SELECT p.ClosedDate IS NOT NULL AS IsWellFinished FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.UserId = 23853 AND c.CreationDate = '2013-07-12 09:08:18.0';	codebase_community
SELECT Reputation  FROM users  WHERE Id = (SELECT OwnerUserId              FROM posts              WHERE Id = 65041);	codebase_community
SELECT COUNT(*) AS PostCount FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Tiago Pasqualini';	codebase_community
SELECT u.DisplayName FROM votes v JOIN users u ON v.UserId = u.Id WHERE v.Id = 6347;	codebase_community
SELECT COUNT(*) AS VoteCount FROM votes WHERE PostId IN (     SELECT Id     FROM posts     WHERE Title LIKE '%data visualization%' );	codebase_community
SELECT b.Name  FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'DatEpicCoderGuyWhoPrograms';	codebase_community
SELECT      CAST(COUNT(posts.Id) AS FLOAT) / CAST(COUNT(votes.Id) AS FLOAT) AS Times FROM      posts LEFT JOIN      votes ON posts.OwnerUserId = votes.UserId WHERE      posts.OwnerUserId = 24;	codebase_community
SELECT ViewCount  FROM posts  WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer';	codebase_community
SELECT Text  FROM comments  WHERE Score = 17;	codebase_community
SELECT DisplayName  FROM users  WHERE WebsiteUrl = 'http://stackoverflow.com';	codebase_community
SELECT b.Name  FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'SilentGhost';	codebase_community
SELECT u.DisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Text = 'thank you user93!';	codebase_community
SELECT c.Text  FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.DisplayName = 'A Lion';	codebase_community
SELECT u.DisplayName, u.Reputation  FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Understanding what Dassault iSight is doing?';	codebase_community
SELECT c.Text  FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'How does gentle boosting differ from AdaBoost?';	codebase_community
SELECT u.DisplayName  FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Necromancer' LIMIT 10;	codebase_community
SELECT u.DisplayName  FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE p.Title = 'Open source tools for visualizing multi-dimensional data';	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Vebjorn Ljosa';	codebase_community
SELECT u.WebsiteUrl, SUM(p.Score) AS TotalScore FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Yevgeny' GROUP BY u.WebsiteUrl;	codebase_community
SELECT c.* FROM comments c JOIN posts p ON c.PostId = p.Id JOIN postHistory ph ON ph.PostId = p.Id WHERE p.Title = 'Why square the difference instead of taking the absolute value in standard deviation?'   AND ph.UserId = c.UserId;	codebase_community
SELECT SUM(BountyAmount) AS TotalBountyAmount FROM votes WHERE PostId IN (     SELECT Id     FROM posts     WHERE Title LIKE '%data%' );	codebase_community
SELECT u.DisplayName  FROM votes v JOIN posts p ON v.PostId = p.Id JOIN users u ON v.UserId = u.Id WHERE v.BountyAmount = 50 AND p.Title LIKE '%variance%';	codebase_community
SELECT      p.Title,      c.Text,      AVG(p.ViewCount) AS AverageViewCount FROM      posts p JOIN      tags t ON t.ExcerptPostId = p.Id LEFT JOIN      comments c ON c.PostId = p.Id WHERE      t.TagName = 'humor' GROUP BY      p.Id;	codebase_community
SELECT COUNT(*) AS TotalComments FROM comments WHERE UserId = 13;	codebase_community
SELECT Id  FROM users  ORDER BY Reputation DESC  LIMIT 1;	codebase_community
SELECT Id  FROM users  ORDER BY Views ASC  LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT UserId) AS UserCount FROM badges WHERE Name = 'Supporter' AND strftime('%Y', Date) = '2011';	codebase_community
SELECT COUNT(DISTINCT UserId) AS UserCount FROM (     SELECT UserId, COUNT(Name) AS BadgeCount     FROM badges     GROUP BY UserId     HAVING COUNT(Name) > 5 ) AS UsersWithBadges;	codebase_community
SELECT COUNT(DISTINCT u.Id) AS UserCount FROM users u JOIN badges b1 ON u.Id = b1.UserId AND b1.Name = 'Teacher' JOIN badges b2 ON u.Id = b2.UserId AND b2.Name = 'Supporter' WHERE u.Location = 'New York';	codebase_community
SELECT u.DisplayName, u.Reputation FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Id = 1;	codebase_community
SELECT u.Id, u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId JOIN (     SELECT UserId, PostId     FROM postHistory     GROUP BY UserId, PostId     HAVING COUNT(*) = 1 ) ph ON u.Id = ph.UserId AND p.Id = ph.PostId WHERE p.ViewCount >= 1000;	codebase_community
SELECT u.DisplayName, b.Name AS Badge, COUNT(c.Id) AS CommentCount FROM users u JOIN comments c ON u.Id = c.UserId LEFT JOIN badges b ON u.Id = b.UserId GROUP BY u.Id, u.DisplayName, b.Name ORDER BY CommentCount DESC LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT u.Id) AS UsersWithTeacherBadgeFromIndia FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'India' AND b.Name = 'Teacher';	codebase_community
SELECT      ABS(         (COUNT(CASE WHEN strftime('%Y', Date) = '2010' AND Name = 'Student' THEN 1 END) * 100.0 / COUNT(Name)) -         (COUNT(CASE WHEN strftime('%Y', Date) = '2011' AND Name = 'Student' THEN 1 END) * 100.0 / COUNT(Name))     ) AS PercentageDifference FROM badges;	codebase_community
SELECT      ph.PostHistoryTypeId,     (SELECT COUNT(DISTINCT c.UserId)       FROM comments c       WHERE c.PostId = 3720) AS UniqueCommenters FROM postHistory ph WHERE ph.PostId = 3720;	codebase_community
SELECT p.*, p.ViewCount AS Popularity FROM postLinks pl JOIN posts p ON pl.RelatedPostId = p.Id WHERE pl.PostId = 61217;	codebase_community
SELECT p.Score, pl.LinkTypeId FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE p.Id = 395;	codebase_community
SELECT Id AS PostId, OwnerUserId  FROM posts  WHERE Score > 60;	codebase_community
SELECT COALESCE(SUM(FavoriteCount), 0) AS TotalFavoriteCount FROM posts WHERE OwnerUserId = 686 AND strftime('%Y', CreaionDate) = '2011';	codebase_community
WITH UserPostCounts AS (     SELECT          p.OwnerUserId,          COUNT(*) AS PostCount     FROM          posts p     GROUP BY          p.OwnerUserId     HAVING          COUNT(*) > 10 ) SELECT      AVG(u.UpVotes) AS AverageUpVotes,      AVG(u.Age) AS AverageAge FROM      users u INNER JOIN      UserPostCounts upc  ON      u.Id = upc.OwnerUserId;	codebase_community
SELECT COUNT(DISTINCT UserId) AS NumberOfUsers FROM badges WHERE Name = 'Announcer';	codebase_community
SELECT Name  FROM badges  WHERE Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT COUNT(*) AS PositiveCommentsCount FROM comments WHERE Score > 60;	codebase_community
SELECT Text  FROM comments  WHERE CreationDate = '2010-07-19 19:25:47.0';	codebase_community
SELECT COUNT(Id) AS PostCount FROM posts WHERE Score = 10;	codebase_community
SELECT b.Name  FROM badges b  JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT u.Reputation  FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT b.Name  FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Pierre';	codebase_community
SELECT b.Date FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Location = 'Rochester, NY';	codebase_community
SELECT      (CAST(COUNT(DISTINCT CASE WHEN Name = 'Teacher' THEN UserId END) AS FLOAT) / COUNT(DISTINCT UserId)) * 100 AS Percentage FROM badges;	codebase_community
SELECT      (CAST(COUNT(DISTINCT u.Id) FILTER (WHERE u.Age BETWEEN 13 AND 18) AS FLOAT) / COUNT(DISTINCT u.Id)) * 100 AS TeenagerPercentage FROM      users u JOIN      badges b ON u.Id = b.UserId WHERE      b.Name = 'Organizer';	codebase_community
SELECT c.Score  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE p.CreaionDate = '2010-07-19 19:19:56.0';	codebase_community
SELECT c.Text  FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.CreaionDate = '2010-07-19 19:37:33.0';	codebase_community
SELECT u.Age FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'Vienna, Austria';	codebase_community
SELECT COUNT(*) AS AdultSupporterCount FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Supporter' AND u.Age BETWEEN 19 AND 65;	codebase_community
SELECT SUM(u.Views) AS TotalViews FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT DISTINCT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MIN(Reputation) FROM users);	codebase_community
SELECT b.Name  FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Sharpie';	codebase_community
SELECT COUNT(*)  FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age > 65;	codebase_community
SELECT DisplayName  FROM users  WHERE Id = 30;	codebase_community
SELECT COUNT(*) AS UserCount FROM users WHERE Location = 'New York';	codebase_community
SELECT COUNT(*) AS TotalVotes FROM votes WHERE strftime('%Y', CreationDate) = '2010';	codebase_community
SELECT COUNT(*) AS AdultUserCount FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT DisplayName, MAX(Views) AS MaxViews FROM users;	codebase_community
SELECT      CAST(COUNT(CASE WHEN strftime('%Y', CreationDate) = '2010' THEN Id END) AS FLOAT) /      NULLIF(COUNT(CASE WHEN strftime('%Y', CreationDate) = '2011' THEN Id END), 0) AS VoteRatio FROM votes;	codebase_community
SELECT DISTINCT t.TagName FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'John Salvatier';	codebase_community
SELECT COUNT(*) AS PostCount FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'Daniel Vassallo';	codebase_community
SELECT COUNT(v.Id) AS VoteCount FROM votes v JOIN users u ON v.UserId = u.Id WHERE u.DisplayName = 'Harlan';	codebase_community
SELECT p.Id  FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'slashnick' ORDER BY p.AnswerCount DESC LIMIT 1;	codebase_community
SELECT u.DisplayName, SUM(p.ViewCount) AS TotalPopularity FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName IN ('Harvey Motulsky', 'Noah Snyder') GROUP BY u.DisplayName ORDER BY TotalPopularity DESC LIMIT 1;	codebase_community
SELECT COUNT(*) AS PostCount FROM posts WHERE OwnerUserId IN (     SELECT Id     FROM users     WHERE DisplayName = 'Matt Parker' ) AND Id IN (     SELECT PostId     FROM votes     GROUP BY PostId     HAVING COUNT(*) > 4 );	codebase_community
SELECT COUNT(c.Id) AS NegativeCommentsCount FROM posts p JOIN users u ON p.OwnerUserId = u.Id JOIN comments c ON p.Id = c.PostId WHERE u.DisplayName = 'Neil McGuigan' AND c.Score < 60;	codebase_community
SELECT DISTINCT t.TagName FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId OR p.Id = t.WikiPostId JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Mark Meckes' AND p.CommentCount = 0;	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Organizer';	codebase_community
SELECT      (CAST(COUNT(DISTINCT p.Id) AS FLOAT) /      (SELECT COUNT(DISTINCT Id) FROM posts WHERE OwnerDisplayName = 'Community')) * 100 AS percentage FROM posts p JOIN tags t ON p.Tags LIKE '%' || t.TagName || '%' WHERE t.TagName = 'r' AND p.OwnerDisplayName = 'Community';	codebase_community
SELECT      (COALESCE((SELECT SUM(ViewCount) FROM posts p1 JOIN users u1 ON p1.OwnerUserId = u1.Id WHERE u1.DisplayName = 'Mornington'), 0) -      COALESCE((SELECT SUM(ViewCount) FROM posts p2 JOIN users u2 ON p2.OwnerUserId = u2.Id WHERE u2.DisplayName = 'Amos'), 0)) AS ViewCountDifference;	codebase_community
SELECT COUNT(DISTINCT UserId) AS UserCount FROM badges WHERE Name = 'Commentator' AND strftime('%Y', Date) = '2014';	codebase_community
SELECT COUNT(*) AS TotalPosts FROM posts WHERE CreaionDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59';	codebase_community
SELECT DisplayName, Age  FROM users  WHERE Views = (SELECT MAX(Views) FROM users);	codebase_community
SELECT LastEditDate, LastEditorUserId  FROM posts  WHERE Title = 'Detecting a given face in a database of facial images';	codebase_community
SELECT COUNT(*) AS NegativeCommentCount FROM comments WHERE UserId = 13 AND Score < 60;	codebase_community
SELECT p.Title, u.DisplayName FROM posts p JOIN comments c ON p.Id = c.PostId JOIN users u ON c.UserId = u.Id WHERE c.Score > 60;	codebase_community
SELECT b.Name  FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Location = 'North Pole' AND strftime('%Y', b.Date) = '2011';	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.FavoriteCount > 150;	codebase_community
SELECT      COUNT(ph.Id) AS PostHistoryCount,      MAX(ph.CreationDate) AS LastEditDate FROM posts p JOIN postHistory ph ON p.Id = ph.PostId WHERE p.Title = "What is the best introductory Bayesian statistics textbook?" GROUP BY p.Id;	codebase_community
SELECT u.LastAccessDate, u.Location FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Outliers';	codebase_community
SELECT p.Title AS RelatedPostTitle FROM posts p JOIN postLinks pl ON p.Id = pl.RelatedPostId WHERE pl.PostId = (SELECT Id FROM posts WHERE Title = 'How to tell if something happened in a data set which monitors a value over time');	codebase_community
SELECT p.Id AS PostId, b.Name AS BadgeName FROM posts p JOIN users u ON p.OwnerUserId = u.Id JOIN badges b ON b.UserId = u.Id WHERE u.DisplayName = 'Samuel'    AND strftime('%Y', p.CreaionDate) = '2013'    AND strftime('%Y', b.Date) = '2013';	codebase_community
SELECT p.OwnerDisplayName FROM posts p WHERE p.ViewCount = (SELECT MAX(ViewCount) FROM posts);	codebase_community
SELECT u.DisplayName, u.Location  FROM users u JOIN posts p ON u.Id = p.OwnerUserId JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'hypothesis-testing';	codebase_community
SELECT p2.Title AS RelatedPostTitle, pl.LinkTypeId FROM posts p1 JOIN postLinks pl ON p1.Id = pl.PostId JOIN posts p2 ON pl.RelatedPostId = p2.Id WHERE p1.Title = 'What are principal component scores?';	codebase_community
SELECT u.DisplayName  FROM posts p  JOIN users u ON p.ParentId = u.Id  WHERE p.ParentId IS NOT NULL  ORDER BY p.Score DESC  LIMIT 1;	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM votes v JOIN users u ON v.UserId = u.Id WHERE v.VoteTypeId = 8 ORDER BY v.BountyAmount DESC LIMIT 1;	codebase_community
SELECT Title  FROM posts  ORDER BY ViewCount DESC  LIMIT 5;	codebase_community
SELECT COUNT(*)  FROM tags  WHERE Count BETWEEN 5000 AND 7000;	codebase_community
SELECT OwnerUserId  FROM posts  WHERE FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts);	codebase_community
SELECT Age  FROM users  WHERE Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT COUNT(DISTINCT p.Id) AS PostCount FROM posts p JOIN votes v ON p.Id = v.PostId WHERE strftime('%Y', v.CreationDate) = '2011' AND v.BountyAmount = 50;	codebase_community
SELECT Id FROM users WHERE Age = (SELECT MIN(Age) FROM users);	codebase_community
SELECT SUM(Score) AS TotalScore FROM posts WHERE LasActivityDate LIKE '2010-07-19%';	codebase_community
SELECT COUNT(pl.Id) / 12 AS AverageMonthlyLinks FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE strftime('%Y', pl.CreationDate) = '2010' AND p.AnswerCount <= 2;	codebase_community
SELECT p.Id  FROM posts p JOIN votes v ON p.Id = v.PostId WHERE v.UserId = 1465 ORDER BY p.FavoriteCount DESC LIMIT 1;	codebase_community
SELECT p.Title  FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.CreationDate = (SELECT MIN(CreationDate) FROM postLinks);	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId GROUP BY u.Id ORDER BY COUNT(b.Name) DESC LIMIT 1;	codebase_community
SELECT MIN(v.CreationDate) AS FirstVoteDate FROM votes v JOIN users u ON v.UserId = u.Id WHERE u.DisplayName = 'chl';	codebase_community
SELECT MIN(p.CreaionDate) AS FirstPostDate FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE u.Age = (SELECT MIN(Age) FROM users);	codebase_community
SELECT u.DisplayName  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE b.Name = 'Autobiographer'  ORDER BY b.Date ASC  LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT u.Id) AS UserCount FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE u.Location = 'United Kingdom' GROUP BY u.Id HAVING SUM(p.FavoriteCount) >= 4;	codebase_community
SELECT AVG(PostId) AS AveragePostsVoted FROM votes WHERE UserId IN (     SELECT Id     FROM users     WHERE Age = (SELECT MAX(Age) FROM users) );	codebase_community
SELECT DisplayName  FROM users  WHERE Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT COUNT(*) AS UserCount FROM users WHERE Reputation > 2000 AND Views > 1000;	codebase_community
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT COUNT(*) AS PostCount FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Jay Stevens' AND strftime('%Y', p.CreaionDate) = '2010';	codebase_community
SELECT p.Id, p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky' ORDER BY p.ViewCount DESC LIMIT 1;	codebase_community
SELECT Id, Title  FROM posts  WHERE Score = (SELECT MAX(Score) FROM posts);	codebase_community
SELECT AVG(Score) AS AverageScore FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Stephen Turner');	codebase_community
SELECT DISTINCT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.ViewCount > 20000 AND strftime('%Y', p.CreaionDate) = '2011';	codebase_community
SELECT p.Id, u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE strftime('%Y', p.CreaionDate) = '2010' ORDER BY p.FavoriteCount DESC LIMIT 1;	codebase_community
SELECT      (CAST(COUNT(p.Id) AS FLOAT) / (SELECT COUNT(Id) FROM posts WHERE strftime('%Y', CreaionDate) = '2011') * 100) AS Percentage FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      strftime('%Y', p.CreaionDate) = '2011' AND u.Reputation > 1000;	codebase_community
SELECT (CAST(COUNT(Id) FILTER (WHERE Age BETWEEN 13 AND 18) AS FLOAT) / COUNT(Id)) * 100 AS percentage FROM users;	codebase_community
SELECT p.ViewCount AS TotalViews, u.DisplayName AS LastUser FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE p.Body = 'Computer Game Datasets';	codebase_community
SELECT COUNT(*) AS TotalPosts FROM posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts);	codebase_community
SELECT COUNT(*) AS CommentCount FROM comments WHERE PostId = (SELECT Id FROM posts WHERE Score = (SELECT MAX(Score) FROM posts));	codebase_community
SELECT COUNT(*) AS NumberOfPosts FROM posts WHERE ViewCount > 35000 AND CommentCount = 0;	codebase_community
SELECT u.DisplayName, u.Location FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE p.Id = 183 ORDER BY p.LastEditDate DESC LIMIT 1;	codebase_community
SELECT b.Name  FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Emmett' ORDER BY b.Date DESC LIMIT 1;	codebase_community
SELECT COUNT(*) AS NumberOfAdultUsers FROM users WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000;	codebase_community
SELECT julianday(badges.Date) - julianday(users.CreationDate) AS DaysToBadge FROM users JOIN badges ON users.Id = badges.UserId WHERE users.DisplayName = 'Zolomon';	codebase_community
SELECT      u.Id AS UserId,      COUNT(DISTINCT p.Id) AS PostCount,      COUNT(DISTINCT c.Id) AS CommentCount FROM      users u LEFT JOIN      posts p ON u.Id = p.OwnerUserId LEFT JOIN      comments c ON u.Id = c.UserId WHERE      u.CreationDate = (SELECT MAX(CreationDate) FROM users) GROUP BY      u.Id;	codebase_community
SELECT c.Text, u.DisplayName  FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON c.UserId = u.Id WHERE p.Title = 'Analysing wind data with R' ORDER BY c.CreationDate DESC LIMIT 10;	codebase_community
SELECT COUNT(DISTINCT UserId) AS UserCount FROM badges WHERE Name = 'Citizen Patrol';	codebase_community
SELECT COUNT(*) AS PostCount FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId OR p.Id = t.WikiPostId WHERE t.TagName = 'careers';	codebase_community
SELECT Reputation, Views  FROM users  WHERE DisplayName = 'Jarrod Dixon';	codebase_community
SELECT      (SELECT COUNT(*) FROM comments WHERE PostId = (SELECT Id FROM posts WHERE Title = 'Clustering 1D data')) AS CommentCount,     (SELECT COUNT(*) FROM posts WHERE ParentId = (SELECT Id FROM posts WHERE Title = 'Clustering 1D data')) AS AnswerCount;	codebase_community
SELECT CreationDate  FROM users  WHERE DisplayName = 'IrishStat';	codebase_community
SELECT COUNT(DISTINCT PostId) AS NumberOfPosts FROM votes WHERE BountyAmount >= 30;	codebase_community
WITH influential_user AS (     SELECT Id     FROM users     ORDER BY Reputation DESC     LIMIT 1 ), stats_posts AS (     SELECT *     FROM posts     WHERE OwnerUserId = (SELECT Id FROM influential_user) ), total_posts AS (     SELECT COUNT(Id) AS total_count     FROM stats_posts ), high_score_posts AS (     SELECT COUNT(Id) AS high_score_count     FROM stats_posts     WHERE Score > 50 ) SELECT      (CAST((SELECT high_score_count FROM high_score_posts) AS FLOAT) /      CAST((SELECT total_count FROM total_posts) AS FLOAT)) * 100 AS percentage;	codebase_community
SELECT COUNT(*)  FROM posts  WHERE Score < 20;	codebase_community
SELECT COUNT(*)  FROM tags  WHERE Id < 15 AND Count <= 20;	codebase_community
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample';	codebase_community
SELECT u.Reputation, u.UpVotes FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'fine, you win :)';	codebase_community
SELECT c.Text  FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title LIKE '%linear regression%';	codebase_community
SELECT c.Text  FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.ViewCount BETWEEN 100 AND 150 ORDER BY c.Score DESC LIMIT 1;	codebase_community
SELECT u.CreationDate, u.Age FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text LIKE '%http://%';	codebase_community
SELECT COUNT(DISTINCT c.PostId) AS PostCount FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.Score = 0 AND p.ViewCount < 5;	codebase_community
SELECT COUNT(c.Id) AS ZeroScoreComments FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.CommentCount = 1 AND c.Score = 0;	codebase_community
SELECT COUNT(DISTINCT u.Id) AS TotalUsers FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score = 0 AND u.Age = 40;	codebase_community
SELECT p.Id AS PostId, c.Text AS CommentText FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Title = 'Group differences on a five point Likert item';	codebase_community
SELECT u.UpVotes FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = "R is also lazy evaluated.";	codebase_community
SELECT c.Text  FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky';	codebase_community
SELECT DISTINCT u.DisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score BETWEEN 1 AND 5 AND u.DownVotes = 0;	codebase_community
SELECT      (CAST(COUNT(c.UserId) AS FLOAT) /      (SELECT COUNT(UserId) FROM comments c2       JOIN users u2 ON c2.UserId = u2.Id       WHERE c2.Score BETWEEN 5 AND 10) * 100) AS Percentage FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score BETWEEN 5 AND 10 AND u.UpVotes = 0;	codebase_community
SELECT sp.power_name  FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id JOIN superhero sh ON hp.hero_id = sh.id WHERE sh.superhero_name = '3-D Man';	superhero
SELECT COUNT(DISTINCT hero_id) AS superhero_count FROM hero_power WHERE power_id = (SELECT id FROM superpower WHERE power_name = 'Super Strength');	superhero
SELECT COUNT(*)  FROM superhero  WHERE id IN (     SELECT hero_id      FROM hero_power      WHERE power_id = (         SELECT id          FROM superpower          WHERE power_name = 'Super Strength'     ) ) AND height_cm > 200;	superhero
SELECT s.full_name  FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id GROUP BY s.full_name HAVING COUNT(hp.power_id) > 15;	superhero
SELECT COUNT(*) AS blue_eyed_superheroes FROM superhero WHERE eye_colour_id = (SELECT id FROM colour WHERE colour = 'Blue');	superhero
SELECT colour.colour  FROM superhero  JOIN colour ON superhero.skin_colour_id = colour.id  WHERE superhero.superhero_name = 'Apocalypse';	superhero
SELECT COUNT(DISTINCT superhero.id) AS blue_eyed_agility_superheroes FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE colour.colour = 'Blue' AND superpower.power_name = 'Agility';	superhero
SELECT s.superhero_name FROM superhero s JOIN colour ec ON s.eye_colour_id = ec.id JOIN colour hc ON s.hair_colour_id = hc.id WHERE ec.colour = 'Blue' AND hc.colour = 'Blond';	superhero
SELECT COUNT(*)  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE publisher.publisher_name = 'Marvel Comics';	superhero
SELECT superhero_name, height_cm FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics' ORDER BY height_cm DESC;	superhero
SELECT publisher.publisher_name  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE superhero.superhero_name = 'Sauron';	superhero
SELECT c.colour, COUNT(s.id) AS colour_count FROM superhero s JOIN colour c ON s.eye_colour_id = c.id JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics' GROUP BY c.colour ORDER BY colour_count DESC;	superhero
SELECT AVG(height_cm) AS average_height FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT sh.superhero_name, sh.full_name FROM superhero sh JOIN publisher p ON sh.publisher_id = p.id JOIN hero_power hp ON sh.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE p.publisher_name = 'Marvel Comics' AND sp.power_name = 'Super Strength';	superhero
SELECT COUNT(*)  FROM superhero  WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics');	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' ORDER BY ha.attribute_value ASC LIMIT 1;	superhero
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE colour.colour = 'Gold' AND publisher.publisher_name = 'Marvel Comics';	superhero
SELECT publisher.publisher_name FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.superhero_name = 'Blue Beetle II';	superhero
SELECT COUNT(*)  FROM superhero  WHERE hair_colour_id = (SELECT id FROM colour WHERE colour = 'Blond');	superhero
SELECT s.superhero_name, s.full_name, ha.attribute_value  FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Intelligence' ORDER BY ha.attribute_value ASC LIMIT 1;	superhero
SELECT race  FROM race  WHERE id = (SELECT race_id FROM superhero WHERE superhero_name = 'Copycat');	superhero
SELECT s.superhero_name, s.full_name  FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Durability' AND ha.attribute_value < 50;	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Death Touch';	superhero
SELECT COUNT(*)  FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE g.gender = 'Female' AND a.attribute_name = 'Strength' AND ha.attribute_value = 100;	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id GROUP BY s.superhero_name ORDER BY COUNT(hp.power_id) DESC LIMIT 1;	superhero
SELECT COUNT(*) AS vampire_superhero_count FROM superhero JOIN race ON superhero.race_id = race.id WHERE race.race = 'Vampire';	superhero
SELECT      (COUNT(CASE WHEN a.alignment = 'Bad' THEN s.id END) * 100.0 / COUNT(s.id)) AS percentage_self_interest,     COUNT(CASE WHEN a.alignment = 'Bad' AND p.publisher_name = 'Marvel Comics' THEN s.id END) AS marvel_self_interest FROM superhero s INNER JOIN alignment a ON s.alignment_id = a.id INNER JOIN publisher p ON s.publisher_id = p.id;	superhero
SELECT ABS(     (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')) -     (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')) ) AS difference_in_superheroes;	superhero
SELECT id FROM publisher WHERE publisher_name = 'Star Trek';	superhero
SELECT AVG(attribute_value) AS average_attribute_value FROM hero_attribute;	superhero
SELECT COUNT(*) AS total_superheroes_without_full_name FROM superhero WHERE full_name IS NULL;	superhero
SELECT colour.colour  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE superhero.id = 75;	superhero
SELECT sp.power_name  FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id JOIN superhero sh ON hp.hero_id = sh.id WHERE sh.superhero_name = 'Deathlok';	superhero
SELECT AVG(weight_kg) AS average_weight FROM superhero WHERE gender_id = (SELECT id FROM gender WHERE gender = 'Female');	superhero
SELECT DISTINCT sp.power_name FROM superhero sh JOIN hero_power hp ON sh.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id JOIN gender g ON sh.gender_id = g.id WHERE g.gender = 'Male' LIMIT 5;	superhero
SELECT superhero_name  FROM superhero  JOIN race ON superhero.race_id = race.id  WHERE race.race = 'Alien';	superhero
SELECT s.superhero_name FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.height_cm BETWEEN 170 AND 190 AND c.colour = 'No Colour';	superhero
SELECT sp.power_name  FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id WHERE hp.hero_id = 56;	superhero
SELECT full_name  FROM superhero  WHERE race_id = (SELECT id FROM race WHERE race = 'Demi-God')  LIMIT 5;	superhero
SELECT COUNT(*)  FROM superhero  WHERE alignment_id = 2;	superhero
SELECT race.race  FROM superhero  JOIN race ON superhero.race_id = race.id  WHERE superhero.weight_kg = 169;	superhero
SELECT colour.colour  FROM superhero  JOIN colour ON superhero.hair_colour_id = colour.id  JOIN race ON superhero.race_id = race.id  WHERE superhero.height_cm = 185 AND race.race = 'human';	superhero
SELECT colour.colour  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE superhero.weight_kg = (SELECT MAX(weight_kg) FROM superhero);	superhero
SELECT (COUNT(CASE WHEN publisher.publisher_name = 'Marvel Comics' THEN 1 END) * 100.0 / COUNT(superhero.id)) AS percentage FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.height_cm BETWEEN 150 AND 180;	superhero
SELECT s.superhero_name FROM superhero s JOIN gender g ON s.gender_id = g.id WHERE g.gender = 'Male' AND s.weight_kg > (SELECT AVG(weight_kg) * 0.79 FROM superhero);	superhero
SELECT sp.power_name, COUNT(hp.power_id) AS power_count FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id GROUP BY sp.power_name ORDER BY power_count DESC LIMIT 1;	superhero
SELECT ha.attribute_value FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = 'Abomination';	superhero
SELECT sp.power_name FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id WHERE hp.hero_id = 1;	superhero
SELECT COUNT(DISTINCT hero_id) AS hero_count FROM hero_power JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'stealth';	superhero
SELECT s.full_name  FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Strength' ORDER BY ha.attribute_value DESC LIMIT 1;	superhero
SELECT COUNT(superhero.id) * 1.0 / SUM(skin_colour_id = 1) AS average_no_skin_colour FROM superhero WHERE skin_colour_id = 1;	superhero
SELECT COUNT(*)  FROM superhero  WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics');	superhero
SELECT s.superhero_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE p.publisher_name = 'Dark Horse Comics' AND a.attribute_name = 'Durability' ORDER BY ha.attribute_value DESC LIMIT 1;	superhero
SELECT colour.colour  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE superhero.full_name = 'Abraham Sapien';	superhero
SELECT s.superhero_name  FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Flight';	superhero
SELECT c1.colour AS eye_colour, c2.colour AS hair_colour, c3.colour AS skin_colour FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN publisher p ON s.publisher_id = p.id JOIN colour c1 ON s.eye_colour_id = c1.id JOIN colour c2 ON s.hair_colour_id = c2.id JOIN colour c3 ON s.skin_colour_id = c3.id WHERE g.gender = 'Female' AND p.publisher_name = 'Dark Horse Comics';	superhero
SELECT s.superhero_name, p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.hair_colour_id = s.skin_colour_id AND s.hair_colour_id = s.eye_colour_id;	superhero
SELECT race.race  FROM superhero  JOIN race ON superhero.race_id = race.id  WHERE superhero.superhero_name = 'A-Bomb';	superhero
SELECT      (CAST(COUNT(s.id) AS FLOAT) / (SELECT COUNT(id) FROM superhero WHERE gender_id = (SELECT id FROM gender WHERE gender = 'Female'))) * 100 AS percentage_blue_female_superheroes FROM superhero s WHERE s.gender_id = (SELECT id FROM gender WHERE gender = 'Female')  AND s.skin_colour_id = (SELECT id FROM colour WHERE colour = 'Blue');	superhero
SELECT superhero_name, race  FROM superhero  JOIN race ON superhero.race_id = race.id  WHERE full_name = 'Charles Chandler';	superhero
SELECT gender.gender FROM superhero JOIN gender ON superhero.gender_id = gender.id WHERE superhero.superhero_name = 'Agent 13';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Adaptation';	superhero
SELECT COUNT(*) AS power_count  FROM hero_power  WHERE hero_id = (SELECT id FROM superhero WHERE superhero_name = 'Amazo');	superhero
SELECT sp.power_name FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id JOIN superhero sh ON hp.hero_id = sh.id WHERE sh.full_name = 'Hunter Zolomon';	superhero
SELECT superhero.height_cm FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Amber';	superhero
SELECT s.superhero_name FROM superhero s JOIN colour e ON s.eye_colour_id = e.id JOIN colour h ON s.hair_colour_id = h.id WHERE e.colour = 'Black' AND h.colour = 'Black';	superhero
SELECT DISTINCT colour.colour AS eye_colour FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.skin_colour_id = (SELECT id FROM colour WHERE colour = 'Gold');	superhero
SELECT `full_name` FROM `superhero` WHERE `race_id` = (SELECT `id` FROM `race` WHERE `race` = 'Vampire');	superhero
SELECT superhero_name  FROM superhero  WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Neutral');	superhero
SELECT COUNT(DISTINCT hero_id)  FROM hero_attribute  WHERE attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Strength')  AND attribute_value = (SELECT MAX(attribute_value)                         FROM hero_attribute                         WHERE attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Strength'));	superhero
SELECT r.race, a.alignment FROM superhero s JOIN race r ON s.race_id = r.id JOIN alignment a ON s.alignment_id = a.id WHERE s.superhero_name = 'Cameron Hicks';	superhero
SELECT (CAST(COUNT(*) AS FLOAT) / (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics'))) * 100 AS percent_female_heroes  FROM superhero  WHERE gender_id = (SELECT id FROM gender WHERE gender = 'Female')  AND publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT AVG(weight_kg) AS average_weight FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Alien');	superhero
SELECT      (SELECT weight_kg FROM superhero WHERE full_name = 'Emil Blonsky') -      (SELECT weight_kg FROM superhero WHERE full_name = 'Charles Chandler') AS weight_difference;	superhero
SELECT superhero_name, AVG(height_cm) AS average_height FROM superhero GROUP BY superhero_name;	superhero
SELECT sp.power_name  FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id JOIN superhero sh ON hp.hero_id = sh.id WHERE sh.superhero_name = 'Abomination';	superhero
SELECT COUNT(*)  FROM superhero  WHERE race_id = 21 AND gender_id = 1;	superhero
SELECT s.superhero_name  FROM superhero s  JOIN hero_attribute ha ON s.id = ha.hero_id  JOIN attribute a ON ha.attribute_id = a.id  WHERE a.attribute_name = 'Speed'  ORDER BY ha.attribute_value DESC  LIMIT 1;	superhero
SELECT COUNT(*)  FROM superhero  WHERE alignment_id = 3;	superhero
SELECT a.attribute_name, ha.attribute_value FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = '3-D Man';	superhero
SELECT s.superhero_name FROM superhero s JOIN colour e ON s.eye_colour_id = e.id JOIN colour h ON s.hair_colour_id = h.id WHERE e.colour = 'Blue' AND h.colour = 'Brown';	superhero
SELECT publisher.publisher_name FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy');	superhero
SELECT COUNT(*)  FROM superhero  WHERE publisher_id = 1;	superhero
SELECT (CAST(COUNT(*) AS FLOAT) / (SELECT COUNT(*) FROM superhero) * 100) AS percentage FROM superhero WHERE eye_colour_id = 7;	superhero
SELECT      (CAST(SUM(CASE WHEN gender_id = 2 THEN 1 ELSE 0 END) AS FLOAT) /      CAST(SUM(CASE WHEN gender_id = 1 THEN 1 ELSE 0 END) AS FLOAT)) AS ratio FROM superhero;	superhero
SELECT superhero_name  FROM superhero  WHERE height_cm = (SELECT MAX(height_cm) FROM superhero);	superhero
SELECT id FROM superpower WHERE power_name = 'Cryokinesis';	superhero
SELECT superhero_name FROM superhero WHERE id = 294;	superhero
SELECT full_name  FROM superhero  WHERE weight_kg IS NULL OR weight_kg = 0;	superhero
SELECT colour.colour  FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.full_name = 'Karen Beecher-Duncan';	superhero
SELECT sp.power_name FROM superhero AS sh JOIN hero_power AS hp ON sh.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE sh.full_name = 'Helen Parr';	superhero
SELECT race.race  FROM superhero  JOIN race ON superhero.race_id = race.id  WHERE superhero.weight_kg = 108 AND superhero.height_cm = 188;	superhero
SELECT publisher_name  FROM publisher  WHERE id = (SELECT publisher_id FROM superhero WHERE id = 38);	superhero
SELECT r.race FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id JOIN race r ON s.race_id = r.id WHERE ha.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute);	superhero
SELECT a.alignment, sp.power_name FROM superhero s LEFT JOIN alignment a ON s.alignment_id = a.id LEFT JOIN hero_power hp ON s.id = hp.hero_id LEFT JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Atom IV';	superhero
SELECT s.full_name  FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.colour = 'Blue' LIMIT 5;	superhero
SELECT AVG(ha.attribute_value) AS average_attribute_value FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE s.alignment_id = 3;	superhero
SELECT colour.colour AS skin_colour FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN colour ON superhero.skin_colour_id = colour.id WHERE hero_attribute.attribute_value = 100;	superhero
SELECT COUNT(*)  FROM superhero  WHERE alignment_id = 1 AND gender_id = 2;	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_value BETWEEN 75 AND 80;	superhero
SELECT race.race  FROM superhero  JOIN race ON superhero.race_id = race.id  JOIN gender ON superhero.gender_id = gender.id  JOIN colour ON superhero.hair_colour_id = colour.id  WHERE gender.gender = 'Male' AND colour.colour = 'Blue';	superhero
SELECT      (CAST(SUM(CASE WHEN s.gender_id = 2 THEN 1 ELSE 0 END) AS FLOAT) / COUNT(s.id)) * 100.0 AS female_percentage FROM      superhero s WHERE      s.alignment_id = 2;	superhero
SELECT      (SELECT COUNT(*)       FROM superhero T1       JOIN colour T2 ON T1.eye_colour_id = T2.id       WHERE (T1.weight_kg = 0 OR T1.weight_kg IS NULL) AND T2.id = 7)      -      (SELECT COUNT(*)       FROM superhero T1       JOIN colour T2 ON T1.eye_colour_id = T2.id       WHERE (T1.weight_kg = 0 OR T1.weight_kg IS NULL) AND T2.id = 1) AS difference;	superhero
SELECT ha.attribute_value FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE s.superhero_name = 'Hulk' AND a.attribute_name = 'Strength';	superhero
SELECT sp.power_name FROM superhero sh JOIN hero_power hp ON sh.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sh.superhero_name = 'Ajax';	superhero
SELECT COUNT(*)  FROM superhero  WHERE skin_colour_id = (SELECT id FROM colour WHERE colour = 'Green')  AND alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad');	superhero
SELECT COUNT(*)  FROM superhero  WHERE gender_id = (SELECT id FROM gender WHERE gender = 'Female')  AND publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Wind Control' ORDER BY s.superhero_name ASC;	superhero
SELECT gender.gender FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id JOIN gender ON superhero.gender_id = gender.id WHERE superpower.power_name = 'Phoenix Force';	superhero
SELECT superhero_name  FROM superhero  WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')  ORDER BY weight_kg DESC  LIMIT 1;	superhero
SELECT AVG(s.height_cm) AS average_height FROM superhero s JOIN race r ON s.race_id = r.id JOIN publisher p ON s.publisher_id = p.id WHERE r.race <> 'Human' AND p.publisher_name = 'Dark Horse Comics';	superhero
SELECT COUNT(*) AS fastest_superheroes_count FROM hero_attribute JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Speed' AND hero_attribute.attribute_value = 100;	superhero
SELECT      ABS(         (SELECT COUNT(*) FROM superhero s           JOIN publisher p ON s.publisher_id = p.id           WHERE p.publisher_name = 'DC Comics') -          (SELECT COUNT(*) FROM superhero s           JOIN publisher p ON s.publisher_id = p.id           WHERE p.publisher_name = 'Marvel Comics')     ) AS difference;	superhero
SELECT a.attribute_name, ha.attribute_value FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id WHERE ha.hero_id = (SELECT id FROM superhero WHERE superhero_name = 'Black Panther') ORDER BY ha.attribute_value ASC LIMIT 1;	superhero
SELECT colour.colour  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE superhero.superhero_name = 'Abomination';	superhero
SELECT superhero_name, height_cm  FROM superhero  WHERE height_cm = (SELECT MAX(height_cm) FROM superhero);	superhero
SELECT superhero_name  FROM superhero  WHERE full_name = 'Charles Chandler';	superhero
SELECT      (COUNT(s.id) * 100.0 / (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'George Lucas'))) AS female_percentage FROM superhero s JOIN gender g ON s.gender_id = g.id WHERE s.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'George Lucas') AND g.gender = 'Female';	superhero
SELECT (CAST(COUNT(s.id) AS FLOAT) / (SELECT COUNT(id) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics'))) * 100 AS percentage_good_superheroes FROM superhero s WHERE s.alignment_id = (SELECT id FROM alignment WHERE alignment = 'Good')  AND s.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT COUNT(*) AS total_superheroes FROM superhero WHERE full_name LIKE 'John%';	superhero
SELECT hero_id  FROM hero_attribute  WHERE attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute);	superhero
SELECT full_name  FROM superhero  WHERE race_id = (SELECT id FROM race WHERE race = 'Alien');	superhero
SELECT s.full_name  FROM superhero s JOIN colour e ON s.eye_colour_id = e.id WHERE s.weight_kg < 100 AND e.colour = 'Brown';	superhero
SELECT ha.attribute_value  FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE s.superhero_name = 'Aquababy';	superhero
SELECT weight_kg, race  FROM superhero  JOIN race ON superhero.race_id = race.id  WHERE superhero.id = 40;	superhero
SELECT AVG(height_cm) AS average_height FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Neutral');	superhero
SELECT hero_id  FROM hero_power  WHERE power_id = (SELECT id FROM superpower WHERE power_name = 'Intelligence');	superhero
SELECT colour.colour  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE superhero.superhero_name = 'Blackwulf';	superhero
SELECT sp.power_name FROM superhero sh JOIN hero_power hp ON sh.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sh.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero);	superhero
SELECT d.driverRef FROM qualifying q JOIN drivers d ON q.driverId = d.driverId WHERE q.raceId = 20 ORDER BY q.q1 DESC LIMIT 5;	formula_1
SELECT d.surname  FROM qualifying q JOIN drivers d ON q.driverId = d.driverId WHERE q.raceId = 19 ORDER BY q.q2 ASC LIMIT 1;	formula_1
SELECT DISTINCT r.year  FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.location = 'Shanghai';	formula_1
SELECT r.url  FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Circuit de Barcelona-Catalunya';	formula_1
SELECT races.name  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE circuits.country = 'Germany';	formula_1
SELECT r.position FROM results r JOIN constructors c ON r.constructorId = c.constructorId JOIN races ra ON r.raceId = ra.raceId JOIN circuits ci ON ra.circuitId = ci.circuitId WHERE c.name = 'Renault';	formula_1
SELECT COUNT(*) AS race_count FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year = 2010 AND c.country NOT IN ('Asia', 'Europe');	formula_1
SELECT races.name FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.country = 'Spain';	formula_1
SELECT circuits.lat, circuits.lng  FROM circuits  JOIN races ON circuits.circuitId = races.circuitId  WHERE races.name = 'Australian Grand Prix';	formula_1
SELECT url  FROM races  WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = 'Sepang International Circuit');	formula_1
SELECT r.time  FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Sepang International Circuit';	formula_1
SELECT circuits.lat, circuits.lng FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE races.name = 'Abu Dhabi Grand Prix';	formula_1
SELECT constructors.nationality  FROM constructorResults JOIN constructors ON constructorResults.constructorId = constructors.constructorId WHERE constructorResults.raceId = 24 AND constructorResults.points = 1;	formula_1
SELECT q.q1  FROM qualifying q JOIN drivers d ON q.driverId = d.driverId WHERE d.forename = 'Bruno' AND d.surname = 'Senna' AND q.raceId = 354;	formula_1
SELECT d.nationality FROM qualifying q JOIN drivers d ON q.driverId = d.driverId WHERE q.raceId = 355 AND q.q2 = '0:01:40';	formula_1
SELECT number  FROM qualifying  WHERE raceId = 903 AND q3 LIKE '1:54%';	formula_1
SELECT COUNT(*)  FROM results  WHERE raceId = (SELECT raceId FROM races WHERE name = 'Bahrain Grand Prix' AND year = 2007)  AND time IS NULL;	formula_1
SELECT s.url  FROM seasons s  JOIN races r ON s.year = r.year  WHERE r.raceId = 901;	formula_1
SELECT COUNT(*) AS finished_drivers FROM results WHERE raceId IN (SELECT raceId FROM races WHERE date = '2015-11-29') AND time IS NOT NULL;	formula_1
SELECT d.driverId, d.forename, d.surname, d.dob  FROM drivers d  JOIN results r ON d.driverId = r.driverId  WHERE r.raceId = 592 AND r.time IS NOT NULL  ORDER BY d.dob ASC  LIMIT 1;	formula_1
SELECT d.url  FROM lapTimes lt  JOIN drivers d ON lt.driverId = d.driverId  WHERE lt.raceId = 161 AND lt.time LIKE '1:27%';	formula_1
SELECT d.nationality  FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE r.raceId = 933 ORDER BY CAST(r.fastestLapSpeed AS REAL) DESC LIMIT 1;	formula_1
SELECT circuits.location, circuits.lat, circuits.lng  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE races.name = 'Malaysian Grand Prix';	formula_1
SELECT c.url  FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId WHERE cr.raceId = 9 ORDER BY cr.points DESC LIMIT 1;	formula_1
SELECT q1  FROM qualifying  WHERE raceId = 345 AND driverId = (SELECT driverId FROM drivers WHERE forename = 'Lucas' AND surname = 'di Grassi');	formula_1
SELECT d.nationality FROM qualifying q JOIN drivers d ON q.driverId = d.driverId WHERE q.raceId = 347 AND q.q2 = '0:01:15';	formula_1
SELECT d.code  FROM qualifying q JOIN drivers d ON q.driverId = d.driverId WHERE q.raceId = 45 AND q.q3 LIKE '1:33%';	formula_1
SELECT r.time  FROM results r  JOIN drivers d ON r.driverId = d.driverId  WHERE d.forename = 'Bruce' AND d.surname = 'McLaren' AND r.raceId = 743;	formula_1
SELECT d.forename, d.surname FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'San Marino Grand Prix' AND ra.year = 2006 AND r.position = 2;	formula_1
SELECT s.url  FROM races r  JOIN seasons s ON r.year = s.year  WHERE r.raceId = 901;	formula_1
SELECT COUNT(*)  FROM results  WHERE raceId = (SELECT raceId FROM races WHERE date = '2015-11-29')  AND statusId != (SELECT statusId FROM status WHERE status = 'Finished');	formula_1
SELECT driverId, forename, surname, dob  FROM drivers  WHERE driverId IN (     SELECT driverId      FROM results      WHERE raceId = 872 AND time IS NOT NULL )  ORDER BY dob DESC  LIMIT 1;	formula_1
SELECT d.forename || ' ' || d.surname AS full_name FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId WHERE lt.raceId = 348 ORDER BY lt.time ASC LIMIT 1;	formula_1
SELECT d.nationality  FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.fastestLapSpeed = (     SELECT MAX(fastestLapSpeed)      FROM results );	formula_1
SELECT      ((CAST(r1.fastestLapSpeed AS REAL) - CAST(r2.fastestLapSpeed AS REAL)) * 100 / CAST(r1.fastestLapSpeed AS REAL)) AS percentage_faster FROM      results r1 JOIN      drivers d1 ON r1.driverId = d1.driverId JOIN      results r2 ON r2.driverId = d1.driverId WHERE      d1.forename = 'Paul' AND d1.surname = 'di Resta'      AND r1.raceId = 853      AND r2.raceId = 854;	formula_1
SELECT      (COUNT(CASE WHEN r.time IS NOT NULL THEN r.driverId END) * 100.0 / COUNT(r.driverId)) AS completion_rate FROM      results r JOIN      races ra ON r.raceId = ra.raceId WHERE      ra.date = '1983-07-16';	formula_1
SELECT year  FROM races  WHERE name = 'Singapore Grand Prix'  ORDER BY year ASC  LIMIT 1;	formula_1
WITH ordered_races AS (     SELECT name     FROM races     WHERE year = 2005     ORDER BY name DESC ) SELECT     COUNT(*) AS number_of_races,     GROUP_CONCAT(name, ', ') AS race_names FROM ordered_races;	formula_1
SELECT name  FROM races  WHERE year = (SELECT MIN(year) FROM races)  AND strftime('%m', date) = (SELECT strftime('%m', MIN(date)) FROM races);	formula_1
SELECT name, date  FROM races  WHERE year = 1999 AND round = (SELECT MAX(round) FROM races WHERE year = 1999);	formula_1
SELECT year, MAX(round) AS max_rounds FROM races GROUP BY year ORDER BY max_rounds DESC LIMIT 1;	formula_1
SELECT name  FROM races  WHERE year = 2017 AND name NOT IN (SELECT name FROM races WHERE year = 2000);	formula_1
SELECT circuits.country, circuits.name AS circuit_name, circuits.location FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE races.year = (SELECT MIN(year) FROM races WHERE name LIKE '%European Grand Prix%');	formula_1
SELECT MAX(r.year) AS last_season FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Brands Hatch' AND r.name = 'British Grand Prix';	formula_1
SELECT COUNT(DISTINCT year) AS seasons_hosted FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.name = 'Silverstone Circuit' AND races.name = 'British Grand Prix';	formula_1
SELECT d.forename, d.surname, ds.position FROM races r JOIN driverStandings ds ON r.raceId = ds.raceId JOIN drivers d ON ds.driverId = d.driverId WHERE r.year = 2010 AND r.name = 'Singapore Grand Prix' ORDER BY ds.position;	formula_1
SELECT d.forename, d.surname, SUM(ds.points) AS total_points FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId GROUP BY d.driverId ORDER BY total_points DESC LIMIT 1;	formula_1
SELECT d.forename, d.surname, ds.points FROM driverStandings ds JOIN drivers d ON ds.driverId = d.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.year = 2017 AND r.name = 'Chinese Grand Prix' ORDER BY ds.points DESC LIMIT 3;	formula_1
SELECT d.forename, d.surname, r.name, MIN(l.milliseconds) AS best_lap_time FROM lapTimes l JOIN drivers d ON l.driverId = d.driverId JOIN races r ON l.raceId = r.raceId GROUP BY l.driverId, l.raceId ORDER BY best_lap_time ASC LIMIT 1;	formula_1
SELECT AVG(lapTimes.milliseconds) AS averageLapTime FROM lapTimes JOIN drivers ON lapTimes.driverId = drivers.driverId JOIN races ON lapTimes.raceId = races.raceId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.name = 'Malaysian Grand Prix' AND races.year = 2009;	formula_1
SELECT      (CAST(COUNT(CASE WHEN r.position > 1 THEN r.raceId END) AS FLOAT) / COUNT(r.raceId)) * 100 AS percentage FROM      results r JOIN      drivers d ON r.driverId = d.driverId JOIN      races ra ON r.raceId = ra.raceId WHERE      d.surname = 'Hamilton' AND ra.year >= 2010;	formula_1
SELECT d.forename || ' ' || d.surname AS full_name, d.nationality, MAX(ds.points) AS max_points FROM driverStandings ds JOIN drivers d ON ds.driverId = d.driverId GROUP BY ds.driverId ORDER BY SUM(ds.wins) DESC LIMIT 1;	formula_1
SELECT forename, surname, CAST(strftime('%Y', CURRENT_TIMESTAMP) AS INTEGER) - CAST(strftime('%Y', dob) AS INTEGER) AS age FROM drivers WHERE nationality = 'Japanese' ORDER BY dob DESC LIMIT 1;	formula_1
SELECT c.circuitId, c.name, COUNT(r.raceId) AS race_count FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.year BETWEEN 1990 AND 2000 GROUP BY c.circuitId, c.name HAVING COUNT(r.raceId) = 4;	formula_1
SELECT circuits.name AS circuit_name, circuits.location, races.name AS race_name FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE circuits.country = 'USA' AND races.year = 2006;	formula_1
SELECT r.name AS race_name, c.name AS circuit_name, c.location  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE strftime('%m', r.date) = '09' AND strftime('%Y', r.date) = '2005';	formula_1
SELECT r.name AS race_name, r.year, r.round, r.date  FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.forename = 'Alex' AND d.surname = 'Yoong' AND res.position < 20;	formula_1
SELECT COUNT(*) AS wins FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId JOIN circuits c ON ra.circuitId = c.circuitId WHERE d.forename = 'Michael' AND d.surname = 'Schumacher' AND c.name = 'Sepang International Circuit' AND r.points = (     SELECT MAX(r2.points)     FROM results r2     WHERE r2.raceId = r.raceId );	formula_1
SELECT races.name AS race, races.year  FROM results  JOIN drivers ON results.driverId = drivers.driverId  JOIN races ON results.raceId = races.raceId  WHERE drivers.forename = 'Michael' AND drivers.surname = 'Schumacher'  ORDER BY results.milliseconds ASC  LIMIT 1;	formula_1
SELECT AVG(r.points) AS average_points FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId WHERE d.forename = 'Eddie' AND d.surname = 'Irvine' AND ra.year = 2000;	formula_1
SELECT r.name AS race_name, r.year, re.points  FROM drivers d JOIN results re ON d.driverId = re.driverId JOIN races r ON re.raceId = r.raceId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' ORDER BY r.year ASC LIMIT 1;	formula_1
SELECT r.name AS race_name, c.country, r.date FROM races AS r JOIN circuits AS c ON r.circuitId = c.circuitId WHERE r.year = 2017 ORDER BY r.date;	formula_1
SELECT r.name AS race_name, r.year, c.location AS circuit_location, MAX(res.laps) AS most_laps FROM results res JOIN races r ON res.raceId = r.raceId JOIN circuits c ON r.circuitId = c.circuitId GROUP BY r.raceId, r.name, r.year, c.location ORDER BY most_laps DESC LIMIT 1;	formula_1
SELECT      (CAST(COUNT(*) AS FLOAT) /      (SELECT COUNT(*) FROM races       INNER JOIN circuits ON races.circuitId = circuits.circuitId       WHERE races.name = 'European Grand Prix') * 100) AS percentage FROM races  INNER JOIN circuits ON races.circuitId = circuits.circuitId  WHERE circuits.country = 'Germany' AND races.name = 'European Grand Prix';	formula_1
SELECT lat, lng  FROM circuits  WHERE name = 'Silverstone Circuit';	formula_1
SELECT name, lat  FROM circuits  WHERE name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring')  ORDER BY lat DESC  LIMIT 1;	formula_1
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit';	formula_1
SELECT country  FROM circuits  WHERE alt = (SELECT MAX(alt) FROM circuits);	formula_1
SELECT COUNT(*) FROM drivers WHERE code IS NULL;	formula_1
SELECT country  FROM circuits  WHERE circuitId = (     SELECT circuitId      FROM races      WHERE raceId = (         SELECT raceId          FROM driverStandings          WHERE driverId = (             SELECT driverId              FROM drivers              ORDER BY dob ASC              LIMIT 1         )         LIMIT 1     )     LIMIT 1 );	formula_1
SELECT surname  FROM drivers  WHERE nationality = 'Italian';	formula_1
SELECT url  FROM drivers  WHERE forename = 'Anthony' AND surname = 'Davidson';	formula_1
SELECT driverRef  FROM drivers  WHERE forename = 'Lewis' AND surname = 'Hamilton';	formula_1
SELECT c.name  FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year = 2009 AND r.name = 'Spanish Grand Prix';	formula_1
SELECT DISTINCT races.year FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.name = 'Silverstone Circuit';	formula_1
SELECT races.name AS race_name, races.year, races.round, races.date, races.url AS race_url, circuits.name AS circuit_name, circuits.location, circuits.country, circuits.url AS circuit_url FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.name = 'Silverstone Circuit';	formula_1
SELECT r.time  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE r.year BETWEEN 2010 AND 2019 AND c.name = 'Abu Dhabi Circuit';	formula_1
SELECT COUNT(*) AS total_races FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.country = 'Italy';	formula_1
SELECT r.date FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Barcelona-Catalunya';	formula_1
SELECT c.url  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE r.name = 'Spanish Grand Prix' AND r.year = 2009;	formula_1
SELECT MIN(fastestLapTime) AS fastestLapTime FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';	formula_1
SELECT d.forename, d.surname  FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE r.fastestLapSpeed = (SELECT MAX(CAST(fastestLapSpeed AS REAL)) FROM results);	formula_1
SELECT d.driverRef  FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Canadian Grand Prix' AND ra.year = 2007 AND r.position = 1;	formula_1
SELECT r.name AS race_name, r.year, r.round, r.date FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT races.name, races.year, races.round, races.date FROM results JOIN drivers ON results.driverId = drivers.driverId JOIN races ON results.raceId = races.raceId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' ORDER BY results.rank ASC LIMIT 1;	formula_1
SELECT MAX(CAST(fastestLapSpeed AS REAL)) AS fastest_lap_speed FROM results JOIN races ON results.raceId = races.raceId WHERE races.name = 'Spanish Grand Prix' AND races.year = 2009;	formula_1
SELECT DISTINCT r.year FROM drivers d JOIN results res ON d.driverId = res.driverId JOIN races r ON res.raceId = r.raceId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT r.positionOrder  FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND ra.year = 2008 AND ra.name = 'Chinese Grand Prix';	formula_1
SELECT d.forename, d.surname FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 1989 AND ra.name = 'Australian Grand Prix' AND r.grid = 4;	formula_1
SELECT COUNT(*) AS finished_drivers FROM results r JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2008 AND ra.name = 'Australian Grand Prix' AND r.time IS NOT NULL;	formula_1
SELECT r.fastestLapTime FROM results r JOIN races ra ON r.raceId = ra.raceId JOIN drivers d ON r.driverId = d.driverId WHERE ra.name = 'Australian Grand Prix' AND ra.year = 2008 AND d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT r.time FROM results r JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2008 AND ra.name = 'Chinese Grand Prix' AND r.rank = 2;	formula_1
SELECT d.forename, d.surname, d.url  FROM results r  JOIN drivers d ON r.driverId = d.driverId  JOIN races ra ON r.raceId = ra.raceId  WHERE ra.year = 2008 AND ra.name = 'Australian Grand Prix' AND r.position = 1;	formula_1
SELECT COUNT(DISTINCT d.driverId) AS driver_count FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE d.nationality = 'British' AND ra.year = 2008 AND ra.name = 'Australian Grand Prix';	formula_1
SELECT COUNT(DISTINCT d.driverId) AS driver_count FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2008 AND ra.name = 'Chinese Grand Prix' AND r.time IS NOT NULL AND EXISTS (     SELECT 1     FROM results r2     WHERE r2.driverId = d.driverId     AND r2.raceId != r.raceId );	formula_1
SELECT SUM(points) AS total_points FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';	formula_1
SELECT AVG(     CAST(SUBSTR(fastestLapTime, 1, 2) AS INTEGER) * 60 +      CAST(SUBSTR(fastestLapTime, 4, 2) AS INTEGER) +      CAST(SUBSTR(fastestLapTime, 7, 3) AS REAL) / 1000 ) AS average_fastest_lap_time_in_seconds FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';	formula_1
SELECT      CAST(COUNT(CASE WHEN time IS NOT NULL THEN raceId END) AS FLOAT) / COUNT(raceId) AS completion_rate FROM results WHERE raceId = (     SELECT raceId      FROM races      WHERE year = 2008 AND name = 'Australian Grand Prix' );	formula_1
SELECT      (         (             (                 CAST(SUBSTR(last_driver.time, 1, INSTR(last_driver.time, ':') - 1) AS INTEGER) * 3600000 +                 CAST(SUBSTR(last_driver.time, INSTR(last_driver.time, ':') + 1, INSTR(SUBSTR(last_driver.time, INSTR(last_driver.time, ':') + 1), ':') - 1) AS INTEGER) * 60000 +                 CAST(SUBSTR(last_driver.time, INSTR(SUBSTR(last_driver.time, INSTR(last_driver.time, ':') + 1), ':') + INSTR(last_driver.time, ':') + 1) AS REAL) * 1000             ) -              (                 CAST(SUBSTR(champion.time, 1, INSTR(champion.time, ':') - 1) AS INTEGER) * 3600000 +                 CAST(SUBSTR(champion.time, INSTR(champion.time, ':') + 1, INSTR(SUBSTR(champion.time, INSTR(champion.time, ':') + 1), ':') - 1) AS INTEGER) * 60000 +                 CAST(SUBSTR(champion.time, INSTR(SUBSTR(champion.time, INSTR(champion.time, ':') + 1), ':') + INSTR(champion.time, ':') + 1) AS REAL) * 1000             )         ) /          (             CAST(SUBSTR(last_driver.time, 1, INSTR(last_driver.time, ':') - 1) AS INTEGER) * 3600000 +             CAST(SUBSTR(last_driver.time, INSTR(last_driver.time, ':') + 1, INSTR(SUBSTR(last_driver.time, INSTR(last_driver.time, ':') + 1), ':') - 1) AS INTEGER) * 60000 +             CAST(SUBSTR(last_driver.time, INSTR(SUBSTR(last_driver.time, INSTR(last_driver.time, ':') + 1), ':') + INSTR(last_driver.time, ':') + 1) AS REAL) * 1000         )     ) * 100 AS percentage_faster FROM results AS champion JOIN results AS last_driver ON champion.raceId = last_driver.raceId JOIN races ON champion.raceId = races.raceId WHERE races.name = 'Australian Grand Prix' AND races.year = 2008    AND champion.position = 1    AND last_driver.positionOrder = (SELECT MAX(positionOrder) FROM results WHERE raceId = champion.raceId)   AND last_driver.time IS NOT NULL    AND champion.time IS NOT NULL;	formula_1
SELECT COUNT(*)  FROM circuits  WHERE location = 'Adelaide' AND country = 'Australia';	formula_1
SELECT lat, lng FROM circuits WHERE country = 'USA';	formula_1
SELECT COUNT(*)  FROM drivers  WHERE nationality = 'British' AND CAST(strftime('%Y', dob) AS INTEGER) > 1980;	formula_1
SELECT MAX(cr.points) AS max_points FROM constructorResults cr JOIN constructors c ON cr.constructorId = c.constructorId WHERE c.nationality = 'British';	formula_1
SELECT c.name, MAX(cs.points) AS highest_points FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId GROUP BY c.name ORDER BY highest_points DESC LIMIT 1;	formula_1
SELECT c.name  FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId WHERE cr.raceId = 291 AND cr.points = 0;	formula_1
SELECT COUNT(*)  FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId WHERE c.nationality = 'Japanese' GROUP BY c.constructorId HAVING COUNT(cr.raceId) = 2 AND SUM(cr.points) = 0;	formula_1
SELECT DISTINCT c.name FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId WHERE cs.position = 1;	formula_1
SELECT COUNT(DISTINCT constructors.constructorId) AS french_constructors_count FROM constructors JOIN results ON constructors.constructorId = results.constructorId JOIN lapTimes ON results.driverId = lapTimes.driverId AND results.raceId = lapTimes.raceId WHERE constructors.nationality = 'French' AND lapTimes.lap > 50;	formula_1
SELECT      (CAST(COUNT(r.driverId) AS FLOAT) /       (SELECT COUNT(res.driverId)        FROM results res        JOIN drivers d ON res.driverId = d.driverId        JOIN races ra ON res.raceId = ra.raceId        WHERE d.nationality = 'Japanese' AND ra.year BETWEEN 2007 AND 2009)) * 100 AS completion_percentage FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId WHERE d.nationality = 'Japanese' AND r.time IS NOT NULL AND ra.year BETWEEN 2007 AND 2009;	formula_1
SELECT r.year, AVG((CAST(SUBSTR(res.time, 1, 2) AS INTEGER) * 3600) +                     (CAST(SUBSTR(res.time, 4, 2) AS INTEGER) * 60) +                     CAST(SUBSTR(res.time, 7, 6) AS REAL)) AS average_champion_time_seconds FROM results res JOIN races r ON res.raceId = r.raceId WHERE r.year < 1975 AND res.position = 1 AND res.time IS NOT NULL GROUP BY r.year;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId WHERE CAST(strftime('%Y', d.dob) AS INTEGER) > 1975 AND ds.position = 2;	formula_1
SELECT COUNT(DISTINCT d.driverId)  FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE d.nationality = 'Italian' AND r.time IS NULL;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.fastestLapTime = (     SELECT MIN(fastestLapTime)     FROM results     WHERE fastestLapTime IS NOT NULL );	formula_1
SELECT r.fastestLap FROM results r JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2009 AND r.position = 1 AND r.time LIKE '%:%:%.%'	formula_1
SELECT AVG(CAST(fastestLapSpeed AS REAL)) AS average_fastest_lap_speed FROM results WHERE raceId = (SELECT raceId FROM races WHERE year = 2009 AND name = 'Spanish Grand Prix');	formula_1
SELECT r.name, r.year FROM results res JOIN races r ON res.raceId = r.raceId WHERE res.milliseconds IS NOT NULL ORDER BY res.milliseconds ASC LIMIT 1;	formula_1
SELECT      (CAST(COUNT(DISTINCT lt.driverId) AS FLOAT) /      (SELECT COUNT(DISTINCT driverId)       FROM drivers       WHERE strftime('%Y', dob) < '1985'       AND EXISTS           (SELECT 1            FROM races r            JOIN lapTimes lt ON r.raceId = lt.raceId            WHERE lt.lap > 50 AND r.year BETWEEN 2000 AND 2005))) * 100 AS percentage FROM lapTimes lt JOIN races r ON lt.raceId = r.raceId JOIN drivers d ON lt.driverId = d.driverId WHERE strftime('%Y', d.dob) < '1985'  AND lt.lap > 50 AND r.year BETWEEN 2000 AND 2005;	formula_1
SELECT COUNT(DISTINCT d.driverId) AS FrenchDriversCount FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE d.nationality = 'French' AND lt.milliseconds < 120000;	formula_1
SELECT code  FROM drivers  WHERE nationality = 'America';	formula_1
SELECT raceId FROM races WHERE year = 2009;	formula_1
SELECT COUNT(DISTINCT driverId) AS driver_count FROM results WHERE raceId = 18;	formula_1
SELECT code  FROM drivers  WHERE nationality = 'Dutch'  ORDER BY dob DESC  LIMIT 3;	formula_1
SELECT driverRef  FROM drivers  WHERE forename = 'Robert' AND surname = 'Kubica';	formula_1
SELECT COUNT(*)  FROM drivers  WHERE nationality = 'British' AND strftime('%Y', dob) = '1980';	formula_1
SELECT d.driverId, d.forename, d.surname, d.dob, d.nationality, MIN(lt.time) AS earliestLapTime FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE d.nationality = 'German' AND strftime('%Y', d.dob) BETWEEN '1980' AND '1990' GROUP BY d.driverId, d.forename, d.surname, d.dob, d.nationality ORDER BY earliestLapTime ASC LIMIT 3;	formula_1
SELECT driverRef  FROM drivers  WHERE nationality = 'German'  ORDER BY dob ASC  LIMIT 1;	formula_1
SELECT DISTINCT d.driverId, d.code FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE strftime('%Y', d.dob) = '1971' AND r.fastestLapTime IS NOT NULL;	formula_1
SELECT d.driverId, d.forename, d.surname, d.nationality, d.dob, MAX(lt.time) AS latestLapTime FROM drivers AS d JOIN lapTimes AS lt ON d.driverId = lt.driverId WHERE d.nationality = 'Spanish' AND strftime('%Y', d.dob) < '1982' GROUP BY d.driverId ORDER BY latestLapTime DESC LIMIT 10;	formula_1
SELECT year  FROM races  WHERE raceId = (     SELECT raceId      FROM results      WHERE fastestLapTime = (         SELECT MIN(fastestLapTime)          FROM results     ) );	formula_1
SELECT r.year  FROM lapTimes lt JOIN races r ON lt.raceId = r.raceId WHERE lt.time = (SELECT MAX(time) FROM lapTimes);	formula_1
SELECT driverId FROM lapTimes WHERE lap = 1 ORDER BY milliseconds ASC LIMIT 5;	formula_1
SELECT COUNT(*) AS disqualified_finishers  FROM results  WHERE statusId = 2 AND time IS NOT NULL AND raceId > 50 AND raceId < 100;	formula_1
SELECT location, lat, lng  FROM circuits  WHERE country = 'Austria';	formula_1
SELECT raceId, COUNT(*) AS finisher_count FROM results WHERE time IS NOT NULL GROUP BY raceId ORDER BY finisher_count DESC LIMIT 1;	formula_1
SELECT d.driverRef, d.nationality, d.dob  FROM qualifying q JOIN drivers d ON q.driverId = d.driverId WHERE q.raceId = 23 AND q.q2 IS NOT NULL;	formula_1
SELECT d.forename, d.surname, r.year, r.name AS race_name, r.date, r.time FROM qualifying q JOIN drivers d ON q.driverId = d.driverId JOIN races r ON q.raceId = r.raceId WHERE d.dob = (SELECT MAX(dob) FROM drivers WHERE driverId IN (SELECT driverId FROM qualifying)) AND r.date = (SELECT MIN(date) FROM races WHERE raceId IN (SELECT raceId FROM qualifying));	formula_1
SELECT COUNT(DISTINCT d.driverId)  FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN status s ON r.statusId = s.statusId WHERE d.nationality = 'American' AND s.status = 'Puncture';	formula_1
SELECT c.name, c.url, SUM(cr.points) AS total_points FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId WHERE c.nationality = 'Italian' GROUP BY c.constructorId, c.name, c.url ORDER BY total_points DESC LIMIT 1;	formula_1
SELECT c.url  FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId GROUP BY c.constructorId ORDER BY SUM(cs.wins) DESC LIMIT 1;	formula_1
SELECT d.forename, d.surname, lt.time FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId JOIN races r ON lt.raceId = r.raceId WHERE r.name = 'French Grand Prix' AND lt.lap = 3 ORDER BY lt.time DESC LIMIT 1;	formula_1
SELECT raceId, MIN(milliseconds) AS fastest_first_lap_time FROM lapTimes WHERE lap = 1 GROUP BY raceId ORDER BY fastest_first_lap_time ASC LIMIT 1;	formula_1
SELECT AVG(CAST(REPLACE(results.fastestLapTime, ':', '.') AS REAL)) AS average_fastest_lap_time FROM results JOIN races ON results.raceId = races.raceId WHERE races.year = 2006 AND races.name = 'United States Grand Prix' AND results.rank < 11;	formula_1
SELECT d.forename || ' ' || d.surname AS full_name, AVG(CAST(ps.duration AS REAL)) AS avg_pit_stop_duration FROM drivers d JOIN pitStops ps ON d.driverId = ps.driverId WHERE d.nationality = 'German'   AND STRFTIME('%Y', d.dob) > '1980'   AND STRFTIME('%Y', d.dob) < '1985' GROUP BY d.driverId ORDER BY avg_pit_stop_duration ASC LIMIT 3;	formula_1
SELECT d.forename, d.surname, r.time FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Canadian Grand Prix' AND ra.year = 2008 AND r.position = 1;	formula_1
SELECT c.constructorRef, c.url FROM results r JOIN constructors c ON r.constructorId = c.constructorId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Singapore Grand Prix' AND ra.year = 2009 ORDER BY r.time DESC LIMIT 1;	formula_1
SELECT forename, surname, dob  FROM drivers  WHERE nationality = 'Austrian' AND strftime('%Y', dob) BETWEEN '1981' AND '1991';	formula_1
SELECT forename || ' ' || surname AS full_name, url, dob  FROM drivers  WHERE nationality = 'German' AND strftime('%Y', dob) BETWEEN '1971' AND '1985'  ORDER BY dob DESC;	formula_1
SELECT location, country, lat, lng  FROM circuits  WHERE name = 'Hungaroring';	formula_1
SELECT      c.name AS constructor_name,      c.nationality AS constructor_nationality,      SUM(cr.points) AS total_points FROM      constructorResults cr JOIN      constructors c ON cr.constructorId = c.constructorId JOIN      races r ON cr.raceId = r.raceId WHERE      r.name = 'Monaco Grand Prix'      AND r.year BETWEEN 1980 AND 2010 GROUP BY      c.name, c.nationality ORDER BY      total_points DESC LIMIT 1;	formula_1
SELECT AVG(r.points) AS average_score FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId JOIN circuits c ON ra.circuitId = c.circuitId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND c.name = 'Turkish Grand Prix';	formula_1
SELECT AVG(race_count) AS annual_average_races FROM (     SELECT year, COUNT(raceId) AS race_count     FROM races     WHERE date BETWEEN '2000-01-01' AND '2010-12-31'     GROUP BY year ) subquery;	formula_1
SELECT nationality, COUNT(nationality) AS count  FROM drivers  GROUP BY nationality  ORDER BY count DESC  LIMIT 1;	formula_1
SELECT COUNT(*) AS victories FROM driverStandings WHERE driverId = (     SELECT driverId     FROM driverStandings     WHERE points = (         SELECT DISTINCT points         FROM driverStandings         ORDER BY points DESC         LIMIT 1 OFFSET 90     ) ) AND wins > 0;	formula_1
SELECT r.name  FROM results res JOIN races r ON res.raceId = r.raceId WHERE res.fastestLapTime = (SELECT MIN(fastestLapTime) FROM results WHERE fastestLapTime IS NOT NULL);	formula_1
SELECT c.location || ', ' || c.country AS full_location FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.date = (SELECT MAX(date) FROM races);	formula_1
SELECT d.forename || ' ' || d.surname AS full_name FROM qualifying q JOIN races r ON q.raceId = r.raceId JOIN circuits c ON r.circuitId = c.circuitId JOIN drivers d ON q.driverId = d.driverId WHERE r.year = 2008 AND c.name = 'Marina Bay Street Circuit' AND q.q3 = (SELECT MIN(q3) FROM qualifying WHERE raceId = r.raceId);	formula_1
SELECT (d.forename || ' ' || d.surname) AS full_name,         d.nationality,         r.name AS race_name FROM drivers d JOIN results res ON d.driverId = res.driverId JOIN races r ON res.raceId = r.raceId WHERE d.dob = (SELECT MAX(dob) FROM drivers) ORDER BY r.date ASC LIMIT 1;	formula_1
SELECT COUNT(*) AS accident_count  FROM results  WHERE driverId = (     SELECT driverId      FROM results      WHERE raceId = (         SELECT raceId          FROM races          WHERE name = 'Canadian Grand Prix'     ) AND statusId = 3      GROUP BY driverId      ORDER BY COUNT(*) DESC      LIMIT 1 ) AND statusId = 3;	formula_1
SELECT d.forename || ' ' || d.surname AS full_name, SUM(ds.wins) AS total_wins FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId WHERE d.dob = (SELECT MIN(dob) FROM drivers) GROUP BY d.forename, d.surname;	formula_1
SELECT MAX(CAST(duration AS REAL)) AS longest_pitstop_time FROM pitStops;	formula_1
SELECT MIN(milliseconds) AS fastest_time  FROM lapTimes;	formula_1
SELECT MAX(CAST(duration AS REAL)) AS longest_pit_stop_time FROM pitStops WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton');	formula_1
SELECT ps.lap FROM pitStops ps JOIN drivers d ON ps.driverId = d.driverId JOIN races r ON ps.raceId = r.raceId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND r.year = 2011 AND r.name = 'Australian Grand Prix';	formula_1
SELECT d.forename, d.surname, ps.duration  FROM pitStops ps JOIN drivers d ON ps.driverId = d.driverId JOIN races r ON ps.raceId = r.raceId WHERE r.year = 2011 AND r.name = 'Australian Grand Prix';	formula_1
SELECT lt.time, lt.milliseconds, d.forename, d.surname FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' ORDER BY lt.milliseconds ASC LIMIT 1;	formula_1
SELECT d.forename, d.surname, lt.time  FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId WHERE lt.time = (     SELECT MIN(lt2.time)     FROM lapTimes lt2 ) LIMIT 20;	formula_1
WITH FastestLap AS (     SELECT MIN(milliseconds) AS fastest_time     FROM lapTimes lt     JOIN drivers d ON lt.driverId = d.driverId     WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' ) SELECT c.name AS circuit_name, lt.position AS driver_position FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId JOIN races r ON lt.raceId = r.raceId JOIN circuits c ON r.circuitId = c.circuitId JOIN FastestLap fl ON lt.milliseconds = fl.fastest_time WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT MIN(lapTimes.time) AS lap_record FROM lapTimes JOIN races ON lapTimes.raceId = races.raceId JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.name = 'Austrian Grand Prix Circuit';	formula_1
SELECT c.name AS circuit_name, lt.time AS lap_record FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN lapTimes lt ON r.raceId = lt.raceId WHERE c.country = 'Italy' ORDER BY lt.milliseconds ASC LIMIT 1;	formula_1
SELECT r.name AS race_name, r.year, r.date, lt.time AS lap_record_time FROM lapTimes lt JOIN races r ON lt.raceId = r.raceId JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Austrian Grand Prix Circuit' ORDER BY lt.milliseconds ASC LIMIT 1;	formula_1
SELECT ps.duration  FROM lapTimes lt JOIN races r ON lt.raceId = r.raceId JOIN circuits c ON r.circuitId = c.circuitId JOIN pitStops ps ON lt.raceId = ps.raceId AND lt.driverId = ps.driverId WHERE c.name = 'Austrian Grand Prix Circuit'  AND lt.milliseconds = (SELECT MIN(milliseconds)                         FROM lapTimes lt2                         JOIN races r2 ON lt2.raceId = r2.raceId                         JOIN circuits c2 ON r2.circuitId = c2.circuitId                         WHERE c2.name = 'Austrian Grand Prix Circuit');	formula_1
SELECT circuits.lat, circuits.lng  FROM circuits JOIN lapTimes ON circuits.circuitId = lapTimes.raceId WHERE lapTimes.time = '1:29.488';	formula_1
SELECT AVG(milliseconds) AS average_pit_stop_time FROM pitStops JOIN drivers ON pitStops.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';	formula_1
SELECT AVG(lt.milliseconds) AS average_lap_time FROM lapTimes lt JOIN races r ON lt.raceId = r.raceId JOIN circuits c ON r.circuitId = c.circuitId WHERE c.country = 'Italy';	formula_1
SELECT player_api_id  FROM Player_Attributes  WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT player_name, height  FROM Player  WHERE height = (SELECT MAX(height) FROM Player);	european_football_2
SELECT preferred_foot  FROM Player_Attributes  WHERE potential = (SELECT MIN(potential) FROM Player_Attributes);	european_football_2
SELECT COUNT(*)  FROM Player_Attributes  WHERE overall_rating >= 60 AND overall_rating < 65 AND defensive_work_rate = 'low';	european_football_2
SELECT Player_Attributes.player_api_id, Player.player_name, MAX(Player_Attributes.crossing) AS max_crossing FROM Player_Attributes JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id GROUP BY Player_Attributes.player_api_id, Player.player_name ORDER BY max_crossing DESC LIMIT 5;	european_football_2
SELECT l.name AS league_name, SUM(m.home_team_goal + m.away_team_goal) AS total_goals FROM Match m JOIN League l ON m.league_id = l.id WHERE m.season = '2015/2016' GROUP BY l.name ORDER BY total_goals DESC LIMIT 1;	european_football_2
SELECT      T.team_long_name AS home_team,      COUNT(M.id) AS losses FROM      Match M JOIN      Team T ON      M.home_team_api_id = T.team_api_id WHERE      M.season = '2015/2016' AND      (M.home_team_goal - M.away_team_goal) < 0 GROUP BY      T.team_long_name ORDER BY      losses ASC LIMIT 1;	european_football_2
SELECT      p.player_name,      pa.penalties  FROM      Player_Attributes pa JOIN      Player p  ON      pa.player_api_id = p.player_api_id  ORDER BY      pa.penalties DESC  LIMIT 10;	european_football_2
SELECT T.team_long_name FROM Match M JOIN League L ON M.league_id = L.id JOIN Team T ON M.away_team_api_id = T.team_api_id WHERE L.name = 'Scotland Premier League'    AND M.season = '2009/2010'    AND M.away_team_goal > M.home_team_goal GROUP BY T.team_long_name ORDER BY COUNT(*) DESC LIMIT 1;	european_football_2
SELECT      t.team_long_name,      ta.buildUpPlaySpeed  FROM      Team_Attributes ta JOIN      Team t  ON      ta.team_api_id = t.team_api_id  ORDER BY      ta.buildUpPlaySpeed DESC  LIMIT 4;	european_football_2
SELECT L.name AS league_name FROM Match M JOIN League L ON M.league_id = L.id WHERE M.season = '2015/2016' GROUP BY L.name ORDER BY SUM(home_team_goal = away_team_goal) DESC LIMIT 1;	european_football_2
SELECT p.player_name, (strftime('%Y', 'now') - strftime('%Y', p.birthday)) AS age FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.sprint_speed >= 97  AND strftime('%Y', pa.date) >= '2013'  AND strftime('%Y', pa.date) <= '2015';	european_football_2
SELECT l.name AS league_name, COUNT(m.id) AS total_matches FROM Match m JOIN League l ON m.league_id = l.id GROUP BY l.id, l.name ORDER BY total_matches DESC LIMIT 1;	european_football_2
SELECT SUM(height) * 1.0 / COUNT(id) AS average_height  FROM Player  WHERE birthday >= '1990-01-01 00:00:00' AND birthday < '1996-01-01 00:00:00';	european_football_2
SELECT player_api_id  FROM Player_Attributes  WHERE substr(date, 1, 4) = '2010'  AND overall_rating = (     SELECT MAX(overall_rating)      FROM Player_Attributes      WHERE substr(date, 1, 4) = '2010' );	european_football_2
SELECT team_fifa_api_id  FROM Team_Attributes  WHERE buildUpPlaySpeed > 50 AND buildUpPlaySpeed < 60;	european_football_2
SELECT t.team_long_name FROM Team_Attributes ta JOIN Team t ON ta.team_api_id = t.team_api_id WHERE strftime('%Y', ta.date) = '2012' AND ta.buildUpPlayPassing > (     SELECT SUM(buildUpPlayPassing) * 1.0 / COUNT(team_long_name)     FROM Team_Attributes ta2     JOIN Team t2 ON ta2.team_api_id = t2.team_api_id     WHERE strftime('%Y', ta2.date) = '2012' AND ta2.buildUpPlayPassing IS NOT NULL );	european_football_2
SELECT      (SUM(CASE WHEN pa.preferred_foot = 'left' THEN 1 ELSE 0 END) * 100.0) / COUNT(DISTINCT p.player_fifa_api_id) AS percentage_left_foot FROM      Player p JOIN      Player_Attributes pa ON      p.player_fifa_api_id = pa.player_fifa_api_id WHERE      strftime('%Y', p.birthday) BETWEEN '1987' AND '1992';	european_football_2
SELECT l.name AS league_name, SUM(m.home_team_goal + m.away_team_goal) AS total_goals FROM League l JOIN Match m ON l.id = m.league_id GROUP BY l.name ORDER BY total_goals ASC LIMIT 5;	european_football_2
SELECT AVG(long_shots) AS average_long_shots FROM Player_Attributes WHERE player_fifa_api_id = (SELECT player_fifa_api_id FROM Player WHERE player_name = 'Ahmed Samir Farag');	european_football_2
SELECT      p.player_name,      AVG(pa.heading_accuracy) AS avg_heading_accuracy FROM      Player p JOIN      Player_Attributes pa  ON      p.player_fifa_api_id = pa.player_fifa_api_id WHERE      p.height > 180 GROUP BY      p.player_name ORDER BY      avg_heading_accuracy DESC LIMIT 10;	european_football_2
SELECT      T.team_long_name  FROM      Team_Attributes TA JOIN      Team T ON TA.team_api_id = T.team_api_id  WHERE      TA.buildUpPlayDribblingClass = 'Normal'      AND TA.date >= '2014-01-01 00:00:00'      AND TA.date <= '2014-01-31 00:00:00'      AND TA.chanceCreationPassing < (         SELECT AVG(chanceCreationPassing)          FROM Team_Attributes          WHERE              buildUpPlayDribblingClass = 'Normal'              AND date >= '2014-01-01 00:00:00'              AND date <= '2014-01-31 00:00:00'     )  ORDER BY      TA.chanceCreationPassing DESC;	european_football_2
SELECT L.name  FROM League L JOIN Match M ON L.id = M.league_id WHERE M.season = '2009/2010' GROUP BY L.name HAVING SUM(M.home_team_goal) / COUNT(DISTINCT M.id) > SUM(M.away_team_goal) / COUNT(DISTINCT M.id);	european_football_2
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers';	european_football_2
SELECT player_name  FROM Player  WHERE substr(birthday, 1, 4) = '1970' AND substr(birthday, 6, 2) = '10';	european_football_2
SELECT pa.attacking_work_rate  FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name = 'Franco Zennaro';	european_football_2
SELECT Team.team_long_name, Team_Attributes.buildUpPlayPositioningClass FROM Team JOIN Team_Attributes ON Team.team_api_id = Team_Attributes.team_api_id WHERE Team.team_long_name = 'ADO Den Haag';	european_football_2
SELECT pa.heading_accuracy  FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name = 'Francois Affolter' AND pa.date = '2014-09-18 00:00:00';	european_football_2
SELECT overall_rating  FROM Player_Attributes  WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Gabriel Tamas')  AND strftime('%Y', date) = '2011';	european_football_2
SELECT COUNT(*) AS match_count FROM Match JOIN League ON Match.league_id = League.id WHERE Match.season = '2015/2016' AND League.name = 'Scotland Premier League';	european_football_2
SELECT preferred_foot  FROM Player  JOIN Player_Attributes  ON Player.player_api_id = Player_Attributes.player_api_id  WHERE Player.birthday = (SELECT MAX(birthday) FROM Player)  LIMIT 1;	european_football_2
SELECT player_name, potential  FROM Player_Attributes  JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id  WHERE potential = (SELECT MAX(potential) FROM Player_Attributes);	european_football_2
SELECT COUNT(*)  FROM Player  JOIN Player_Attributes  ON Player.player_api_id = Player_Attributes.player_api_id  WHERE Player.weight < 130 AND Player_Attributes.preferred_foot = 'left';	european_football_2
SELECT team_short_name  FROM Team  JOIN Team_Attributes ON Team.team_api_id = Team_Attributes.team_api_id  WHERE chanceCreationPassingClass = 'Risky';	european_football_2
SELECT pa.defensive_work_rate  FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name = 'David Wilson';	european_football_2
SELECT Player.birthday  FROM Player  JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id  WHERE Player_Attributes.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT League.name  FROM League  JOIN Country ON League.country_id = Country.id  WHERE Country.name = 'Netherlands';	european_football_2
SELECT AVG(home_team_goal) AS average_home_team_goal FROM Match JOIN Country ON Match.country_id = Country.id WHERE Country.name = 'Poland' AND Match.season = '2010/2011';	european_football_2
SELECT player_name, AVG(finishing) AS avg_finishing FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.height = (SELECT MAX(height) FROM Player)    OR p.height = (SELECT MIN(height) FROM Player) GROUP BY player_name ORDER BY avg_finishing DESC LIMIT 1;	european_football_2
SELECT player_name  FROM Player  WHERE height > 180;	european_football_2
SELECT COUNT(*)  FROM Player  WHERE strftime('%Y', birthday) > '1990';	european_football_2
SELECT COUNT(*)  FROM Player  WHERE player_name LIKE 'Adam %' AND weight > 170;	european_football_2
SELECT DISTINCT p.player_name FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.overall_rating > 80 AND strftime('%Y', pa.date) BETWEEN '2008' AND '2010';	european_football_2
SELECT potential  FROM Player_Attributes  WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Doran');	european_football_2
SELECT player_name  FROM Player  JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id  WHERE preferred_foot = 'left';	european_football_2
SELECT Team.team_long_name FROM Team JOIN Team_Attributes ON Team.team_api_id = Team_Attributes.team_api_id WHERE Team_Attributes.buildUpPlaySpeedClass = 'Fast';	european_football_2
SELECT buildUpPlayPassingClass  FROM Team_Attributes  JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id  WHERE Team.team_short_name = 'CLB';	european_football_2
SELECT t.team_short_name  FROM Team t JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id WHERE ta.buildUpPlayPassing > 70;	european_football_2
SELECT SUM(t2.overall_rating) / COUNT(t2.id) AS average_overall_rating FROM Player AS t1 JOIN Player_Attributes AS t2 ON t1.player_api_id = t2.player_api_id WHERE t1.height > 170 AND strftime('%Y', t2.date) >= '2010' AND strftime('%Y', t2.date) <= '2015';	european_football_2
SELECT player_name, height  FROM Player  WHERE height = (SELECT MIN(height) FROM Player);	european_football_2
SELECT Country.name  FROM Country  JOIN League ON Country.id = League.country_id  WHERE League.name = 'Italy Serie A';	european_football_2
SELECT T.team_short_name FROM Team_Attributes TA JOIN Team T ON TA.team_api_id = T.team_api_id WHERE TA.buildUpPlaySpeed = 31   AND TA.buildUpPlayDribbling = 53   AND TA.buildUpPlayPassing = 32;	european_football_2
SELECT AVG(pa.overall_rating) AS average_overall_rating FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name = 'Aaron Doran';	european_football_2
SELECT COUNT(*) AS match_count FROM Match JOIN League ON Match.league_id = League.id WHERE League.name = 'Germany 1. Bundesliga'  AND strftime('%Y-%m', Match.date) BETWEEN '2008-08' AND '2008-10';	european_football_2
SELECT T.team_short_name  FROM Match M JOIN Team T ON M.home_team_api_id = T.team_api_id WHERE M.home_team_goal = 10;	european_football_2
SELECT p.player_name, pa.balance, pa.potential FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.balance = (SELECT MAX(balance) FROM Player_Attributes WHERE potential = 61) AND pa.potential = 61;	european_football_2
SELECT      (AVG(CASE WHEN p.player_name = 'Abdou Diallo' THEN pa.ball_control ELSE NULL END) -       AVG(CASE WHEN p.player_name = 'Aaron Appindangoye' THEN pa.ball_control ELSE NULL END)) AS difference FROM      Player_Attributes pa JOIN      Player p  ON      pa.player_api_id = p.player_api_id WHERE      p.player_name IN ('Abdou Diallo', 'Aaron Appindangoye');	european_football_2
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN';	european_football_2
SELECT player_name, birthday  FROM Player  WHERE player_name IN ('Aaron Lennon', 'Abdelaziz Barrada')  ORDER BY birthday ASC  LIMIT 1;	european_football_2
SELECT player_name, height  FROM Player  WHERE height = (SELECT MAX(height) FROM Player);	european_football_2
SELECT COUNT(*)  FROM Player_Attributes  WHERE preferred_foot = 'left' AND attacking_work_rate = 'low';	european_football_2
SELECT Country.name  FROM League  JOIN Country ON League.country_id = Country.id  WHERE League.name = 'Belgium Jupiler League';	european_football_2
SELECT League.name  FROM League  JOIN Country ON League.country_id = Country.id  WHERE Country.name = 'Germany';	european_football_2
SELECT Player.player_name, Player_Attributes.overall_rating  FROM Player  JOIN Player_Attributes  ON Player.player_api_id = Player_Attributes.player_api_id  ORDER BY Player_Attributes.overall_rating DESC  LIMIT 1;	european_football_2
SELECT COUNT(DISTINCT Player.id) AS player_count FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE strftime('%Y', Player.birthday) < '1986' AND Player_Attributes.defensive_work_rate = 'high';	european_football_2
SELECT p.player_name, pa.crossing FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone') ORDER BY pa.crossing DESC LIMIT 1;	european_football_2
SELECT pa.heading_accuracy FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name = 'Ariel Borysiuk';	european_football_2
SELECT COUNT(DISTINCT pa.player_api_id) AS player_count FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.height > 180 AND pa.volleys > 70;	european_football_2
SELECT DISTINCT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.volleys > 70 AND pa.dribbling > 70;	european_football_2
SELECT COUNT(*)  FROM Match  WHERE season = '2008/2009'  AND country_id = (SELECT id FROM Country WHERE name = 'Belgium');	european_football_2
SELECT pa.long_passing  FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.birthday = (SELECT MIN(birthday) FROM Player);	european_football_2
SELECT COUNT(*) AS match_count FROM Match AS m JOIN League AS l ON m.league_id = l.id WHERE l.name = 'Belgium Jupiler League' AND SUBSTR(m.date, 1, 7) = '2009-04';	european_football_2
SELECT L.name AS league_name FROM Match M JOIN League L ON M.league_id = L.id WHERE M.season = '2008/2009' GROUP BY L.name ORDER BY COUNT(M.id) DESC LIMIT 1;	european_football_2
SELECT AVG(overall_rating) AS average_overall_rating FROM Player_Attributes WHERE player_api_id IN (     SELECT player_api_id     FROM Player     WHERE strftime('%Y', birthday) < '1986' );	european_football_2
WITH Latest_Player_Attributes AS (     SELECT          player_api_id,          overall_rating,          MAX(date) AS latest_date     FROM          Player_Attributes     GROUP BY          player_api_id ) SELECT      (         (             (pa1.overall_rating - pa2.overall_rating) * 1.0 / pa2.overall_rating         ) * 100     ) AS percentage_difference FROM      Player p1 INNER JOIN      Latest_Player_Attributes pa1 ON p1.player_api_id = pa1.player_api_id INNER JOIN      Player p2 ON p2.player_api_id = pa2.player_api_id INNER JOIN      Latest_Player_Attributes pa2 ON p2.player_api_id = pa2.player_api_id WHERE      p1.player_name = 'Ariel Borysiuk'      AND p2.player_name = 'Paulin Puel';	european_football_2
SELECT AVG(buildUpPlaySpeed) AS average_build_up_play_speed FROM Team_Attributes WHERE team_api_id = (     SELECT team_api_id     FROM Team     WHERE team_long_name = 'Heart of Midlothian' );	european_football_2
SELECT AVG(T1.overall_rating) AS average_overall_rating FROM Player_Attributes T1 JOIN Player T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Pietro Marino';	european_football_2
SELECT SUM(PA.crossing) AS total_crossing_score FROM Player P JOIN Player_Attributes PA ON P.player_api_id = PA.player_api_id WHERE P.player_name = 'Aaron Lennox';	european_football_2
SELECT MAX(ta.chanceCreationPassing) AS highest_chance_creation_passing_score, ta.chanceCreationPassingClass FROM Team t JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id WHERE t.team_long_name = 'Ajax';	european_football_2
SELECT preferred_foot  FROM Player_Attributes  WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Abdou Diallo');	european_football_2
SELECT MAX(PA.overall_rating) AS highest_overall_rating FROM Player AS P JOIN Player_Attributes AS PA ON P.player_api_id = PA.player_api_id WHERE P.player_name = 'Dorlan Pabon';	european_football_2
SELECT AVG(m.away_team_goal) AS average_goals FROM Match m JOIN Team t ON m.away_team_api_id = t.team_api_id JOIN League l ON m.league_id = l.id JOIN Country c ON l.country_id = c.id WHERE t.team_long_name = 'Parma' AND c.name = 'Italy';	european_football_2
SELECT p.player_name  FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.overall_rating = 77 AND pa.date LIKE '2016-06-23%' ORDER BY p.birthday ASC LIMIT 1;	european_football_2
SELECT pa.overall_rating  FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name = 'Aaron Mooy' AND pa.date LIKE '2016-02-04%';	european_football_2
SELECT potential  FROM Player_Attributes  WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Francesco Parravicini')  AND date = '2010-08-30 00:00:00';	european_football_2
SELECT pa.attacking_work_rate  FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name = 'Francesco Migliore' AND pa.date LIKE '2015-05-01%';	european_football_2
SELECT pa.defensive_work_rate  FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name = 'Kevin Berigaud' AND pa.date = '2013-02-22 00:00:00';	european_football_2
SELECT pa.date FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Kevin Constant' ORDER BY pa.crossing DESC, pa.date ASC LIMIT 1;	european_football_2
SELECT buildUpPlaySpeedClass  FROM Team_Attributes  WHERE team_api_id = (SELECT team_api_id FROM Team WHERE team_long_name = 'Willem II')  AND date = '2012-02-22';	european_football_2
SELECT ta.buildUpPlayDribblingClass FROM Team_Attributes ta JOIN Team t ON ta.team_api_id = t.team_api_id WHERE t.team_short_name = 'LEI' AND ta.date = '2015-09-10 00:00:00';	european_football_2
SELECT buildUpPlayPassingClass  FROM Team_Attributes  INNER JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id  WHERE Team.team_long_name = 'FC Lorient' AND date LIKE '2010-02-22%';	european_football_2
SELECT ta.chanceCreationPassingClass  FROM Team t JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id WHERE t.team_long_name = 'PEC Zwolle' AND ta.date = '2013-09-20 00:00:00';	european_football_2
SELECT ta.chanceCreationCrossingClass  FROM Team_Attributes ta JOIN Team t ON ta.team_api_id = t.team_api_id WHERE t.team_long_name = 'Hull City' AND ta.date = '2010-02-22 00:00:00';	european_football_2
SELECT defenceAggressionClass  FROM Team_Attributes  WHERE team_api_id = (SELECT team_api_id FROM Team WHERE team_long_name = 'Hannover 96')  AND date LIKE '2015-09-10%';	european_football_2
SELECT AVG(pa.overall_rating) AS average_overall_rating FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name = 'Marko Arnautovic'    AND SUBSTR(pa.date, 1, 10) BETWEEN '2007-02-22' AND '2016-04-21';	european_football_2
SELECT      ((ld.overall_rating - jb.overall_rating) * 100.0 / ld.overall_rating) AS percentage FROM      (SELECT overall_rating FROM Player_Attributes       WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Landon Donovan')       AND date = '2013-07-12') ld,     (SELECT overall_rating FROM Player_Attributes       WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Jordan Bowery')       AND date = '2013-07-12') jb;	european_football_2
SELECT player_name  FROM Player  WHERE height = (SELECT MAX(height) FROM Player);	european_football_2
SELECT player_api_id  FROM Player  ORDER BY weight DESC  LIMIT 10;	european_football_2
SELECT player_name  FROM Player  WHERE (julianday('now') - julianday(birthday)) / 365.25 > 34;	european_football_2
SELECT SUM(home_team_goal) AS total_home_goals FROM Match JOIN Player ON Match.home_player_1 = Player.player_api_id WHERE Player.player_name = 'Aaron Lennon';	european_football_2
SELECT SUM(m.away_team_goal) AS total_away_goals FROM `Match` m JOIN `Player` p1 ON m.away_player_1 = p1.player_api_id OR                    m.away_player_2 = p1.player_api_id OR                    m.away_player_3 = p1.player_api_id OR                    m.away_player_4 = p1.player_api_id OR                    m.away_player_5 = p1.player_api_id OR                    m.away_player_6 = p1.player_api_id OR                    m.away_player_7 = p1.player_api_id OR                    m.away_player_8 = p1.player_api_id OR                    m.away_player_9 = p1.player_api_id OR                    m.away_player_10 = p1.player_api_id OR                    m.away_player_11 = p1.player_api_id WHERE p1.player_name IN ('Daan Smith', 'Filipe Ferreira');	european_football_2
SELECT SUM(M.home_team_goal) AS total_home_team_goals FROM Match AS M JOIN Player AS P ON M.home_player_1 = P.player_api_id  WHERE (julianday('now') - julianday(P.birthday)) / 365.25 <= 30;	european_football_2
SELECT p.player_name  FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT player_name  FROM Player  WHERE player_api_id = (     SELECT player_api_id      FROM Player_Attributes      WHERE potential = (SELECT MAX(potential) FROM Player_Attributes) );	european_football_2
SELECT DISTINCT P.player_name FROM Player_Attributes PA JOIN Player P ON PA.player_api_id = P.player_api_id WHERE PA.attacking_work_rate = 'high';	european_football_2
SELECT p.player_name  FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.finishing = 1 ORDER BY datetime(p.birthday) ASC LIMIT 1;	european_football_2
SELECT DISTINCT Player.player_name FROM Player JOIN Match ON Player.player_api_id IN (     Match.home_player_1, Match.home_player_2, Match.home_player_3, Match.home_player_4, Match.home_player_5,      Match.home_player_6, Match.home_player_7, Match.home_player_8, Match.home_player_9, Match.home_player_10,      Match.home_player_11, Match.away_player_1, Match.away_player_2, Match.away_player_3, Match.away_player_4,      Match.away_player_5, Match.away_player_6, Match.away_player_7, Match.away_player_8, Match.away_player_9,      Match.away_player_10, Match.away_player_11 ) JOIN Country ON Match.country_id = Country.id WHERE Country.name = 'Belgium';	european_football_2
SELECT DISTINCT p.player_name, c.name AS country_name FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id JOIN Match m ON p.player_api_id IN (m.home_player_1, m.home_player_2, m.home_player_3, m.home_player_4, m.home_player_5, m.home_player_6, m.home_player_7, m.home_player_8, m.home_player_9, m.home_player_10, m.home_player_11, m.away_player_1, m.away_player_2, m.away_player_3, m.away_player_4, m.away_player_5, m.away_player_6, m.away_player_7, m.away_player_8, m.away_player_9, m.away_player_10, m.away_player_11) JOIN Country c ON m.country_id = c.id WHERE pa.vision > 89;	european_football_2
SELECT c.name AS country_name, MAX(avg_weight) AS heaviest_avg_weight FROM (     SELECT co.id AS country_id, AVG(p.weight) AS avg_weight     FROM Player p     JOIN Match m ON p.player_api_id IN (         m.home_player_1, m.home_player_2, m.home_player_3, m.home_player_4, m.home_player_5,         m.home_player_6, m.home_player_7, m.home_player_8, m.home_player_9, m.home_player_10, m.home_player_11,         m.away_player_1, m.away_player_2, m.away_player_3, m.away_player_4, m.away_player_5,         m.away_player_6, m.away_player_7, m.away_player_8, m.away_player_9, m.away_player_10, m.away_player_11     )     JOIN Country co ON m.country_id = co.id     GROUP BY co.id ) avg_weights JOIN Country c ON avg_weights.country_id = c.id;	european_football_2
SELECT team_long_name  FROM Team  JOIN Team_Attributes  ON Team.team_api_id = Team_Attributes.team_api_id  WHERE buildUpPlaySpeedClass = 'Slow';	european_football_2
SELECT DISTINCT t.team_short_name FROM Team t JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id WHERE ta.chanceCreationPassingClass = 'Safe';	european_football_2
SELECT AVG(height) AS average_height FROM Player WHERE player_api_id IN (     SELECT DISTINCT home_player_1      FROM Match      WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy')     UNION     SELECT DISTINCT home_player_2      FROM Match      WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy')     UNION     SELECT DISTINCT home_player_3      FROM Match      WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy')     UNION     SELECT DISTINCT home_player_4      FROM Match      WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy')     UNION     SELECT DISTINCT home_player_5      FROM Match      WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy')     UNION     SELECT DISTINCT home_player_6      FROM Match      WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy')     UNION     SELECT DISTINCT home_player_7      FROM Match      WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy')     UNION     SELECT DISTINCT home_player_8      FROM Match      WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy')     UNION     SELECT DISTINCT home_player_9      FROM Match      WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy')     UNION     SELECT DISTINCT home_player_10      FROM Match      WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy')     UNION     SELECT DISTINCT home_player_11      FROM Match      WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy')     UNION     SELECT DISTINCT away_player_1      FROM Match      WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy')     UNION     SELECT DISTINCT away_player_2      FROM Match      WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy')     UNION     SELECT DISTINCT away_player_3      FROM Match      WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy')     UNION     SELECT DISTINCT away_player_4      FROM Match      WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy')     UNION     SELECT DISTINCT away_player_5      FROM Match      WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy')     UNION     SELECT DISTINCT away_player_6      FROM Match      WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy')     UNION     SELECT DISTINCT away_player_7      FROM Match      WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy')     UNION     SELECT DISTINCT away_player_8      FROM Match      WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy')     UNION     SELECT DISTINCT away_player_9      FROM Match      WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy')     UNION     SELECT DISTINCT away_player_10      FROM Match      WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy')     UNION     SELECT DISTINCT away_player_11      FROM Match      WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy') );	european_football_2
SELECT player_name FROM Player WHERE height > 180 ORDER BY player_name ASC LIMIT 3;	european_football_2
SELECT COUNT(*)  FROM Player  WHERE player_name LIKE 'Aaron%' AND birthday > '1990';	european_football_2
SELECT      (SELECT jumping FROM Player_Attributes WHERE id = 6) -      (SELECT jumping FROM Player_Attributes WHERE id = 23) AS jumping_difference;	european_football_2
SELECT player_api_id  FROM Player_Attributes  WHERE preferred_foot = 'right'  ORDER BY potential ASC  LIMIT 5;	european_football_2
SELECT COUNT(DISTINCT player_api_id)  FROM Player_Attributes  WHERE crossing = (SELECT MAX(crossing) FROM Player_Attributes)  AND preferred_foot = 'left';	european_football_2
SELECT      (CAST(COUNT(*) AS FLOAT) / (SELECT COUNT(*) FROM Player_Attributes) * 100) AS percentage FROM      Player_Attributes WHERE      stamina > 80 AND strength > 80;	european_football_2
SELECT c.name  FROM League l JOIN Country c ON l.country_id = c.id WHERE l.name = 'Poland Ekstraklasa';	european_football_2
SELECT m.home_team_goal, m.away_team_goal FROM Match m JOIN League l ON m.league_id = l.id WHERE l.name = 'Belgium Jupiler League' AND m.date LIKE '2008-09-24%';	european_football_2
SELECT pa.sprint_speed, pa.agility, pa.acceleration FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name = 'Alexis Blin';	european_football_2
SELECT buildUpPlaySpeedClass  FROM Team_Attributes  JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id  WHERE Team.team_long_name = 'KSV Cercle Brugge';	european_football_2
SELECT COUNT(*)  FROM Match  WHERE season = '2015/2016' AND league_id = (SELECT id FROM League WHERE name = 'Italy Serie A');	european_football_2
SELECT MAX(m.home_team_goal) AS highest_home_team_score FROM Match m JOIN League l ON m.league_id = l.id WHERE l.name = 'Netherlands Eredivisie';	european_football_2
SELECT pa.finishing, pa.curve  FROM Player p  JOIN Player_Attributes pa  ON p.player_api_id = pa.player_api_id  WHERE p.weight = (SELECT MAX(weight) FROM Player);	european_football_2
SELECT l.name AS league_name, COUNT(m.id) AS total_games FROM Match m JOIN League l ON m.league_id = l.id WHERE m.season = '2015/2016' GROUP BY l.name ORDER BY total_games DESC LIMIT 4;	european_football_2
SELECT T.team_long_name  FROM Match M JOIN Team T ON M.away_team_api_id = T.team_api_id WHERE M.away_team_goal = (SELECT MAX(away_team_goal) FROM Match);	european_football_2
SELECT P.player_name  FROM Player_Attributes PA  JOIN Player P ON PA.player_api_id = P.player_api_id  WHERE PA.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT (CAST(COUNT(*) AS FLOAT) / (SELECT COUNT(*) FROM Player)) * 100 AS percentage FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE Player.height < 180 AND Player_Attributes.strength > 70;	european_football_2
SELECT      (COUNT(CASE WHEN Admission = '+' THEN ID END) - COUNT(CASE WHEN Admission = '-' THEN ID END)) * 100.0 / COUNT(CASE WHEN Admission = '-' THEN ID END) AS Percentage_Deviation FROM Patient WHERE SEX = 'M';	thrombosis_prediction
SELECT      (CAST(COUNT(CASE WHEN strftime('%Y', Birthday) > '1930' AND SEX = 'F' THEN ID END) AS FLOAT) / COUNT(CASE WHEN SEX = 'F' THEN ID END)) * 100 AS Percentage_Female_Born_After_1930 FROM Patient;	thrombosis_prediction
SELECT      (CAST(SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(*)) * 100 AS Inpatient_Percentage FROM      Patient WHERE      strftime('%Y', Birthday) BETWEEN '1930' AND '1940';	thrombosis_prediction
SELECT      (SELECT COUNT(ID)       FROM Patient       WHERE Diagnosis = 'SLE' AND Admission = '+') /      (SELECT COUNT(ID)       FROM Patient       WHERE Diagnosis = 'SLE' AND Admission = '-') AS Ratio;	thrombosis_prediction
SELECT P.Diagnosis, L.Date  FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.ID = 30609;	thrombosis_prediction
SELECT      Patient.SEX,      Patient.Birthday,      Examination.`Examination Date`,      Examination.Symptoms  FROM      Patient  JOIN      Examination  ON      Patient.ID = Examination.ID  WHERE      Patient.ID = 163109;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.LDH > 500;	thrombosis_prediction
SELECT Patient.ID,         strftime('%Y', CURRENT_TIMESTAMP) - strftime('%Y', Patient.Birthday) -         (strftime('%m-%d', CURRENT_TIMESTAMP) < strftime('%m-%d', Patient.Birthday)) AS Age FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.RVVT = '+';	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Diagnosis FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.Thrombosis = 2;	thrombosis_prediction
SELECT DISTINCT Patient.ID, Patient.SEX, Patient.Birthday, Laboratory.`T-CHO` FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE strftime('%Y', Patient.Birthday) = '1937'    AND Laboratory.`T-CHO` >= 250;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Diagnosis FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.ALB < 3.5;	thrombosis_prediction
SELECT      (COUNT(DISTINCT l.ID) * 100.0 / (SELECT COUNT(DISTINCT p.ID) FROM Patient p WHERE p.SEX = 'F')) AS percentage FROM      Laboratory l INNER JOIN      Patient p ON l.ID = p.ID WHERE      p.SEX = 'F' AND (l.TP < 6.0 OR l.TP > 8.5);	thrombosis_prediction
SELECT AVG(E.`aCL IgG`) AS Average_IgG FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE P.Admission = '+' AND (strftime('%Y', 'now') - strftime('%Y', P.Birthday)) >= 50;	thrombosis_prediction
SELECT COUNT(*) AS FemalePatients1997 FROM Patient WHERE SEX = 'F' AND strftime('%Y', Description) = '1997' AND Admission = '-';	thrombosis_prediction
SELECT MIN(CAST(strftime('%Y', `First Date`) AS INTEGER) - CAST(strftime('%Y', `Birthday`) AS INTEGER)) AS Youngest_Age FROM Patient WHERE `First Date` IS NOT NULL AND `Birthday` IS NOT NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) AS FemalePatientsWithSevereThrombosis FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE P.SEX = 'F'    AND E.Thrombosis = 1    AND strftime('%Y', E.`Examination Date`) = '1997';	thrombosis_prediction
SELECT (MAX(strftime('%Y', Birthday)) - MIN(strftime('%Y', Birthday))) AS Age_Gap FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE TG >= 200);	thrombosis_prediction
SELECT e.Symptoms, e.Diagnosis FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.Birthday = (SELECT MAX(Birthday) FROM Patient WHERE ID IN (SELECT ID FROM Examination))   AND e.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT COUNT(ID) / 12 AS Average_Male_Patients_Per_Month FROM Laboratory WHERE ID IN (SELECT ID FROM Patient WHERE SEX = 'M') AND Date BETWEEN '1998-01-01' AND '1998-12-31';	thrombosis_prediction
SELECT      Laboratory.Date AS Medical_Lab_Date,      (strftime('%Y', Patient.`First Date`) - strftime('%Y', Patient.Birthday)) AS Age_At_Arrival FROM      Patient JOIN      Laboratory ON Patient.ID = Laboratory.ID WHERE      Patient.Diagnosis = 'SJS' ORDER BY      Patient.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT      (SELECT COUNT(*) FROM Laboratory l       JOIN Patient p ON l.ID = p.ID       WHERE p.SEX = 'M' AND l.UA <= 8.0) /     (SELECT COUNT(*) FROM Laboratory l       JOIN Patient p ON l.ID = p.ID       WHERE p.SEX = 'F' AND l.UA <= 6.5) AS male_to_female_ratio;	thrombosis_prediction
SELECT COUNT(*) AS Number_of_Patients FROM Patient WHERE ID NOT IN (     SELECT DISTINCT Examination.ID     FROM Examination     INNER JOIN Patient ON Examination.ID = Patient.ID     WHERE julianday(Examination.`Examination Date`) - julianday(Patient.`First Date`) >= 365 );	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) AS UnderagePatientsCount FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE (strftime('%Y', e.`Examination Date`) BETWEEN '1990' AND '1993') AND (CAST(strftime('%Y', e.`Examination Date`) AS INTEGER) - CAST(strftime('%Y', p.Birthday) AS INTEGER)) < 18;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.`T-BIL` >= 2.0;	thrombosis_prediction
SELECT Diagnosis, COUNT(Diagnosis) AS DiagnosisCount FROM Examination WHERE `Examination Date` BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY Diagnosis ORDER BY DiagnosisCount DESC LIMIT 1;	thrombosis_prediction
SELECT AVG(1999 - strftime('%Y', Birthday)) AS Average_Age FROM Patient WHERE ID IN (     SELECT ID     FROM Laboratory     WHERE Date BETWEEN '1991-10-01' AND '1991-10-30' );	thrombosis_prediction
SELECT      (strftime('%Y', `Examination`.`Examination Date`) - strftime('%Y', `Patient`.`Birthday`)) AS Age,      `Examination`.`Diagnosis` FROM      `Patient` JOIN      `Examination` ON `Patient`.`ID` = `Examination`.`ID` WHERE      `Examination`.`ID` IN (SELECT `ID` FROM `Laboratory` WHERE `HGB` = (SELECT MAX(`HGB`) FROM `Laboratory`));	thrombosis_prediction
SELECT ANA  FROM Examination  WHERE ID = 3605340 AND `Examination Date` = '1996-12-02';	thrombosis_prediction
SELECT      CASE          WHEN `T-CHO` < 250 THEN 'Normal'          ELSE 'Abnormal'      END AS `Total Cholesterol Status` FROM      Laboratory WHERE      ID = 2927464 AND      Date = '1995-09-04';	thrombosis_prediction
SELECT SEX  FROM Patient  WHERE Diagnosis = 'AORTITIS'  ORDER BY `First Date` ASC  LIMIT 1;	thrombosis_prediction
SELECT `aCL IgM` FROM `Examination` WHERE `ID` = (     SELECT `ID`     FROM `Patient`     WHERE `Diagnosis` = 'SLE' AND `Description` = '1994-02-19' ) AND `Examination Date` = '1993-11-12';	thrombosis_prediction
SELECT SEX  FROM Patient  WHERE ID = (SELECT ID FROM Laboratory WHERE GPT = 9 AND Date = '1992-06-12');	thrombosis_prediction
SELECT (strftime('%Y', '1991-10-21') - strftime('%Y', Birthday)) AS Age  FROM Patient  WHERE ID = (SELECT ID FROM Laboratory WHERE UA = 8.4 AND Date = '1991-10-21');	thrombosis_prediction
SELECT COUNT(ID) AS Total_Laboratory_Tests FROM Laboratory WHERE ID = (SELECT ID FROM Patient WHERE `First Date` = '1991-06-13' AND Diagnosis = 'SJS')    AND strftime('%Y', Date) = '1995';	thrombosis_prediction
SELECT p.Diagnosis  FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.`Examination Date` = '1997-01-27' AND p.Diagnosis LIKE '%SLE%' AND p.`First Date` IS NOT NULL;	thrombosis_prediction
SELECT Symptoms  FROM Examination  WHERE ID = (SELECT ID FROM Patient WHERE Birthday = '1959-03-01')  AND `Examination Date` = '1993-09-27';	thrombosis_prediction
SELECT      ((SUM(CASE WHEN Laboratory.Date LIKE '1981-11-%' THEN Laboratory.`T-CHO` ELSE 0 END) -      SUM(CASE WHEN Laboratory.Date LIKE '1981-12-%' THEN Laboratory.`T-CHO` ELSE 0 END)) /      SUM(CASE WHEN Laboratory.Date LIKE '1981-11-%' THEN Laboratory.`T-CHO` ELSE 0 END)) * 100 AS DecreaseRate FROM      Laboratory JOIN      Patient ON      Laboratory.ID = Patient.ID WHERE      Patient.Birthday = '1959-02-18';	thrombosis_prediction
SELECT DISTINCT Patient.ID  FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Patient.Diagnosis = 'Behcet'  AND Examination.`Examination Date` >= '1997-01-01'  AND Examination.`Examination Date` < '1998-01-01';	thrombosis_prediction
SELECT DISTINCT L.ID FROM Laboratory L WHERE L.Date BETWEEN '1987-07-06' AND '1996-01-31'   AND L.GPT > 30   AND L.ALB < 4;	thrombosis_prediction
SELECT ID  FROM Patient  WHERE SEX = 'F' AND strftime('%Y', Birthday) = '1964' AND Admission = '+';	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) AS Number_of_Patients FROM Examination e WHERE e.Thrombosis = 2    AND e.ANA = 'S'    AND e.`aCL IgM` > (SELECT AVG(`aCL IgM`) * 1.2 FROM Examination);	thrombosis_prediction
SELECT      100.0 * COUNT(CASE WHEN UA <= 6.5 THEN 1 END) / COUNT(*) AS percentage FROM      Laboratory WHERE      `U-PRO` > 0 AND `U-PRO` < 30;	thrombosis_prediction
SELECT      (SUM(CASE WHEN Diagnosis = 'BEHCET' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS percentage FROM      Patient WHERE      SEX = 'M' AND strftime('%Y', `First Date`) = '1981';	thrombosis_prediction
SELECT DISTINCT p.* FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '-'   AND l.Date LIKE '1991-10%'   AND l.`T-BIL` < 2.0;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  WHERE SEX = 'F'  AND STRFTIME('%Y', Birthday) BETWEEN '1980' AND '1989'  AND ID NOT IN (     SELECT ID      FROM Examination      WHERE `ANA Pattern` = 'P' );	thrombosis_prediction
SELECT p.SEX  FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE e.Diagnosis = 'PSS' AND l.CRP > 2 AND l.CRE = 1 AND l.LDH = 123;	thrombosis_prediction
SELECT AVG(Laboratory.ALB) AS Average_Blood_Albumin_Level FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE Patient.SEX = 'F'    AND Laboratory.PLT > 400    AND Patient.Diagnosis = 'SLE';	thrombosis_prediction
SELECT Symptoms, COUNT(Symptoms) AS Frequency FROM Examination WHERE ID IN (SELECT ID FROM Patient WHERE Diagnosis = 'SLE') GROUP BY Symptoms ORDER BY Frequency DESC LIMIT 1;	thrombosis_prediction
SELECT Description, Diagnosis  FROM Patient  WHERE ID = 48473;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  WHERE SEX = 'F' AND Diagnosis = 'APS';	thrombosis_prediction
SELECT COUNT(DISTINCT L.ID) AS PatientCount FROM Laboratory L WHERE strftime('%Y', L.Date) = '1997' AND (L.TP <= 6 OR L.TP >= 8.5);	thrombosis_prediction
SELECT      (CAST(SUM(CASE WHEN p.Diagnosis LIKE '%SLE%' AND e.Symptoms LIKE '%thrombocytopenia%' THEN 1 ELSE 0 END) AS FLOAT) /      CAST(SUM(CASE WHEN e.Symptoms LIKE '%thrombocytopenia%' THEN 1 ELSE 0 END) AS FLOAT)) * 100 AS Proportion FROM      Patient p JOIN      Examination e ON      p.ID = e.ID;	thrombosis_prediction
SELECT      (SUM(CASE WHEN SEX = 'F' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS Percentage FROM      Patient WHERE      strftime('%Y', Birthday) = '1980' AND      Diagnosis = 'RA';	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) AS MalePatientsCount FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'M'   AND e.`Examination Date` BETWEEN '1995-01-01' AND '1997-12-31'   AND p.Diagnosis = 'Behcet'   AND p.Admission = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.SEX = 'F' AND Laboratory.WBC < 3.5;	thrombosis_prediction
SELECT CAST(julianday(e.`Examination Date`) - julianday(p.`First Date`) AS INTEGER) AS Days_Before_Evaluation FROM `Patient` p JOIN `Examination` e ON p.`ID` = e.`ID` WHERE p.`ID` = 821298;	thrombosis_prediction
SELECT      CASE          WHEN p.SEX = 'M' AND l.UA <= 8.0 THEN 'Within normal range'         WHEN p.SEX = 'F' AND l.UA <= 6.5 THEN 'Within normal range'         ELSE 'Out of normal range'     END AS UricAcidStatus FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      p.ID = 57266;	thrombosis_prediction
SELECT `Date`  FROM `Laboratory`  WHERE `ID` = 48473 AND `GOT` >= 60;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GOT < 60 AND strftime('%Y', l.Date) = '1994';	thrombosis_prediction
SELECT DISTINCT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.GPT >= 60;	thrombosis_prediction
SELECT Patient.Diagnosis  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.GPT > 60  ORDER BY Patient.Birthday ASC;	thrombosis_prediction
SELECT AVG(LDH) AS Average_LDH  FROM Laboratory  WHERE LDH < 500;	thrombosis_prediction
SELECT Patient.ID,         (strftime('%Y', 'now') - strftime('%Y', Patient.Birthday)) AS Age FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.LDH BETWEEN 600 AND 800;	thrombosis_prediction
SELECT Patient.Admission, COUNT(*) AS Patient_Count FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE Laboratory.ALP < 300 GROUP BY Patient.Admission;	thrombosis_prediction
SELECT p.ID,         CASE             WHEN l.ALP < 300 THEN 'Yes'             ELSE 'No'         END AS ALP_Normal_Range FROM Patient p LEFT JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday = '1982-04-01';	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.TP < 6.0;	thrombosis_prediction
SELECT Patient.ID, (Laboratory.TP - 8.5) AS TP_Deviation FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'F' AND Laboratory.TP > 8.5;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND (Laboratory.ALB <= 3.5 OR Laboratory.ALB >= 5.5) ORDER BY Patient.Birthday DESC;	thrombosis_prediction
SELECT      p.ID,      CASE          WHEN l.ALB BETWEEN 3.5 AND 5.5 THEN 'Within Normal Range'          ELSE 'Out of Normal Range'      END AS Albumin_Status FROM      Patient p LEFT JOIN      Laboratory l ON      p.ID = l.ID WHERE      strftime('%Y', p.Birthday) = '1982';	thrombosis_prediction
SELECT      (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Patient WHERE SEX = 'F')) AS Percentage FROM      Laboratory  JOIN      Patient  ON      Laboratory.ID = Patient.ID WHERE      Patient.SEX = 'F' AND Laboratory.UA > 6.5;	thrombosis_prediction
SELECT AVG(L.UA) AS Average_UA FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE L.Date = (     SELECT MAX(L1.Date)     FROM Laboratory L1     WHERE L1.ID = L.ID ) AND ((P.SEX = 'M' AND L.UA < 8.0) OR (P.SEX = 'F' AND L.UA < 6.5));	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.UN = 29;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis = 'RA' AND l.UN < 30;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) AS MalePatientsWithAbnormalCRE FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Laboratory.CRE >= 1.5;	thrombosis_prediction
SELECT      CASE          WHEN (SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.CRE >= 1.5) >               (SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'F' AND l.CRE >= 1.5)          THEN 'True'          ELSE 'False'      END AS Result;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday, l.`T-BIL` FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.`T-BIL` = (SELECT MAX(`T-BIL`) FROM Laboratory);	thrombosis_prediction
SELECT SEX, GROUP_CONCAT(DISTINCT Patient.ID) AS Patient_List FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.`T-BIL` >= 2.0 GROUP BY SEX;	thrombosis_prediction
SELECT p.ID, l.`T-CHO`  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday = (SELECT MIN(Birthday) FROM Patient) ORDER BY l.`T-CHO` DESC LIMIT 1;	thrombosis_prediction
SELECT AVG(     CAST(strftime('%Y', CURRENT_DATE) AS INTEGER) -      CAST(strftime('%Y', P.Birthday) AS INTEGER) -     CASE          WHEN strftime('%m-%d', CURRENT_DATE) < strftime('%m-%d', P.Birthday) THEN 1          ELSE 0      END ) AS Average_Age FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.`T-CHO` >= 250;	thrombosis_prediction
SELECT P.ID, P.Diagnosis  FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.TG > 300;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.TG >= 200  AND (strftime('%Y', 'now') - strftime('%Y', Patient.Birthday)) > 50;	thrombosis_prediction
SELECT DISTINCT Patient.ID  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.Admission = '-' AND Laboratory.CPK < 250;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) AS MalePatientsWithHighCPK FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE strftime('%Y', p.Birthday) BETWEEN 1936 AND 1956   AND p.SEX = 'M'   AND l.CPK >= 250;	thrombosis_prediction
SELECT      Patient.ID,     Patient.SEX,     strftime('%Y', 'now') - strftime('%Y', Patient.Birthday) AS Age FROM      Patient JOIN      Laboratory ON Patient.ID = Laboratory.ID WHERE      Laboratory.GLU >= 180 AND Laboratory.`T-CHO` < 250;	thrombosis_prediction
SELECT Patient.ID, Laboratory.GLU FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE strftime('%Y', Patient.Description) = '1991' AND Laboratory.GLU < 180;	thrombosis_prediction
SELECT      p.ID,      p.SEX,      p.Birthday FROM      Patient p JOIN      Laboratory l  ON      p.ID = l.ID WHERE      l.WBC <= 3.5 OR l.WBC >= 9.0 GROUP BY      p.SEX, p.ID ORDER BY      DATE('now') - DATE(p.Birthday) ASC;	thrombosis_prediction
SELECT      Patient.ID,      (strftime('%Y', 'now') - strftime('%Y', Patient.Birthday)) AS Age,      Patient.Diagnosis  FROM      Laboratory  JOIN      Patient  ON      Laboratory.ID = Patient.ID  WHERE      Laboratory.RBC < 3.5;	thrombosis_prediction
SELECT      p.ID,      p.SEX,      p.Birthday,      p.Admission FROM      Patient p JOIN      Laboratory l ON      p.ID = l.ID WHERE      p.SEX = 'F'      AND (strftime('%Y', 'now') - strftime('%Y', p.Birthday)) >= 50     AND (l.RBC <= 3.5 OR l.RBC >= 6.0);	thrombosis_prediction
SELECT DISTINCT Patient.ID, Patient.SEX FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Admission = '-' AND Laboratory.HGB < 10;	thrombosis_prediction
SELECT p.ID, p.SEX FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis = 'SLE' AND l.HGB > 10 AND l.HGB < 17 ORDER BY p.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT      p.ID,      strftime('%Y', 'now') - strftime('%Y', p.Birthday) AS Age FROM      Patient p JOIN      Laboratory l ON      p.ID = l.ID WHERE      l.HCT >= 52 GROUP BY      p.ID HAVING      COUNT(l.ID) > 2;	thrombosis_prediction
SELECT AVG(HCT) AS Average_Hematocrit_Level FROM Laboratory WHERE Date LIKE '1991%' AND HCT < 29;	thrombosis_prediction
SELECT      (SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE PLT < 100) AS Lower_Than_Normal,     (SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE PLT > 400) AS Higher_Than_Normal,     (SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE PLT < 100) -      (SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE PLT > 400) AS Calculation;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday, l.Date, l.PLT FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE strftime('%Y', l.Date) = '1984'   AND (strftime('%Y', '1984-01-01') - strftime('%Y', p.Birthday)) < 50   AND l.PLT BETWEEN 100 AND 400;	thrombosis_prediction
SELECT (CAST(SUM(CASE WHEN PT >= 14 AND SEX = 'F' THEN 1 ELSE 0 END) AS FLOAT) / SUM(CASE WHEN PT >= 14 THEN 1 ELSE 0 END)) * 100 AS FemalePercentageWithAbnormalPT FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE (strftime('%Y', 'now') - strftime('%Y', Birthday)) > 55;	thrombosis_prediction
SELECT DISTINCT p.* FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE strftime('%Y', p.`First Date`) > '1992'   AND l.PT < 14;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination JOIN Laboratory ON Examination.ID = Laboratory.ID WHERE `Examination Date` > '1997-01-01' AND Laboratory.`APTT` < 45;	thrombosis_prediction
SELECT COUNT(DISTINCT Examination.ID)  FROM Examination  JOIN Laboratory ON Examination.ID = Laboratory.ID  WHERE Laboratory.APTT > 45 AND Examination.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT l.ID) AS MalePatientsWithAbnormalFG FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M'   AND l.WBC > 3.5    AND l.WBC < 9.0   AND (l.FG <= 150 OR l.FG >= 450);	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) AS PatientCount FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday > '1980-01-01' AND (l.FG < 150 OR l.FG > 450);	thrombosis_prediction
SELECT DISTINCT p.Diagnosis  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.`U-PRO` >= 30;	thrombosis_prediction
SELECT p.ID  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis = 'SLE' AND CAST(l.`U-PRO` AS INTEGER) > 0 AND CAST(l.`U-PRO` AS INTEGER) < 30;	thrombosis_prediction
SELECT COUNT(DISTINCT ID) AS PatientCount FROM Laboratory WHERE IGG >= 2000;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID JOIN Examination ON Patient.ID = Examination.ID WHERE Laboratory.IGG > 900 AND Laboratory.IGG < 2000 AND Examination.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT P.Diagnosis  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.IGA = (     SELECT MAX(IGA)      FROM Laboratory      WHERE IGA BETWEEN 80 AND 500 );	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.IGA > 80 AND Laboratory.IGA < 500    AND CAST(strftime('%Y', Patient.`First Date`) AS INTEGER) >= 1990;	thrombosis_prediction
SELECT p.Diagnosis, COUNT(p.Diagnosis) AS DiagnosisCount FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.IGM <= 40 OR l.IGM >= 400 GROUP BY p.Diagnosis ORDER BY DiagnosisCount DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  WHERE Description IS NULL AND ID IN (SELECT ID FROM Laboratory WHERE CRP = '+');	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) AS NumberOfPatients FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.CRE >= 1.5   AND (     CAST(strftime('%Y', 'now') AS INTEGER)      - CAST(strftime('%Y', p.Birthday) AS INTEGER)     - (strftime('%m-%d', 'now') < strftime('%m-%d', p.Birthday))   ) < 70;	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID) AS PatientCount FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE L.RA IN ('-', '+-') AND E.KCT = '+';	thrombosis_prediction
SELECT DISTINCT p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE strftime('%Y', p.Birthday) >= '1985' AND l.RA IN ('-', '+-');	thrombosis_prediction
SELECT p.ID  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE CAST(l.RF AS REAL) < 20    AND (CAST(strftime('%Y', 'now') AS INTEGER) - CAST(strftime('%Y', p.Birthday) AS INTEGER)) > 60;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) AS PatientCount FROM Patient p JOIN Laboratory l ON p.ID = l.ID JOIN Examination e ON p.ID = e.ID WHERE CAST(l.RF AS REAL) < 20 AND e.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) AS PatientCount FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.C3 > 35 AND e.`ANA Pattern` = 'P';	thrombosis_prediction
SELECT E.ID FROM Examination E JOIN Patient P ON E.ID = P.ID JOIN Laboratory L ON P.ID = L.ID WHERE L.HCT NOT BETWEEN 29 AND 52 ORDER BY E.`aCL IgA` DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) AS NumberOfPatients FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE e.Thrombosis = 1 AND l.C4 > 10;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.RNP IN ('-', '+-') AND Patient.Admission = '+';	thrombosis_prediction
SELECT p.Birthday  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.RNP NOT IN ('-', '+-') ORDER BY p.Birthday DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID JOIN Examination ON Patient.ID = Examination.ID WHERE Laboratory.SM IN ('-', '+-') AND Examination.Thrombosis = 0;	thrombosis_prediction
SELECT ID  FROM Patient  WHERE ID IN (     SELECT ID      FROM Laboratory      WHERE SM NOT IN ('negative', '0') )  ORDER BY Birthday DESC  LIMIT 3;	thrombosis_prediction
SELECT DISTINCT e.ID  FROM Examination e  JOIN Laboratory l ON e.ID = l.ID  WHERE e.`Examination Date` > '1997-01-01'  AND l.SC170 IN ('negative', '0');	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) AS Female_No_Symptom_Count FROM Patient P JOIN Laboratory L ON P.ID = L.ID LEFT JOIN Examination E ON P.ID = E.ID WHERE P.SEX = 'F'    AND L.SC170 IN ('negative', '0')    AND E.Symptoms IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) AS Patient_Count FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.SSA IN ('-', '+-') AND strftime('%Y', P.`First Date`) < '2000';	thrombosis_prediction
SELECT ID  FROM Patient  WHERE `First Date` = (     SELECT MIN(`First Date`)      FROM Patient      WHERE ID IN (         SELECT ID          FROM Laboratory          WHERE SSA NOT IN ('negative', '0')     ) );	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.SSB IN ('-', '+-') AND P.Diagnosis = 'SLE';	thrombosis_prediction
SELECT COUNT(DISTINCT Examination.ID)  FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.SSB IN ('negative', '0') AND Examination.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.SEX = 'M' AND Laboratory.CENTROMEA IN ('-', '+-') AND Laboratory.SSB IN ('-', '+-');	thrombosis_prediction
SELECT DISTINCT P.Diagnosis  FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.DNA >= 8;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) AS NumberOfPatients FROM Patient p LEFT JOIN Laboratory l ON p.ID = l.ID WHERE l.`DNA` < 8 AND p.`Description` IS NULL;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  WHERE Admission = '+' AND ID IN (     SELECT ID      FROM Laboratory      WHERE IGG > 900 AND IGG < 2000 );	thrombosis_prediction
SELECT      (COUNT(DISTINCT l.ID) * 1.0 / (SELECT COUNT(DISTINCT l2.ID)                                     FROM Laboratory l2                                     JOIN Patient p2 ON l2.ID = p2.ID                                     WHERE l2.GOT >= 60)) * 100 AS percentage FROM Laboratory l JOIN Patient p ON l.ID = p.ID WHERE l.GOT >= 60 AND p.Diagnosis = 'SLE';	thrombosis_prediction
SELECT COUNT(*)  FROM Patient AS p JOIN Laboratory AS l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.GOT < 60;	thrombosis_prediction
SELECT MAX(Patient.Birthday) AS YoungestBirthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.GOT >= 60;	thrombosis_prediction
SELECT `Birthday` FROM `Patient` WHERE `ID` IN (     SELECT `ID`     FROM `Laboratory`     WHERE `GPT` < 60     ORDER BY `GPT` DESC     LIMIT 3 );	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) AS MaleCount FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.GOT < 60 AND Patient.SEX = 'M';	thrombosis_prediction
SELECT MIN(Patient.`First Date`) AS First_Recorded_Date  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.LDH < 500  ORDER BY Laboratory.LDH DESC  LIMIT 1;	thrombosis_prediction
SELECT MAX(L.Date) AS LatestMedicalDataRecorded FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE P.ID = (SELECT ID FROM Patient WHERE `First Date` = (SELECT MAX(`First Date`) FROM Patient))   AND L.LDH >= 500;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  WHERE ID IN (     SELECT ID      FROM Laboratory      WHERE ALP >= 300 )  AND Admission = '+';	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) AS NumberOfPatients FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '-' AND l.ALP < 300;	thrombosis_prediction
SELECT DISTINCT p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TP < 6.0;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) AS PatientCount FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis = 'SJS' AND l.TP > 6.0 AND l.TP < 8.5;	thrombosis_prediction
SELECT l.Date AS Examination_Date FROM Laboratory l WHERE l.ALB = (     SELECT MAX(ALB)     FROM Laboratory     WHERE ALB > 3.5 AND ALB < 5.5 );	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) AS MalePatientCount FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Laboratory.ALB > 3.5 AND Laboratory.ALB < 5.5 AND Laboratory.TP BETWEEN 6.0 AND 8.5;	thrombosis_prediction
SELECT e.`aCL IgG`, e.`aCL IgM`, e.`aCL IgA` FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.SEX = 'F' AND e.ID = (     SELECT l.ID     FROM Laboratory l     JOIN Patient p ON l.ID = p.ID     WHERE p.SEX = 'F' AND l.UA <= 6.50     ORDER BY l.UA DESC     LIMIT 1 );	thrombosis_prediction
SELECT MAX(ANA) AS Highest_ANA  FROM Examination  WHERE ID IN (     SELECT ID      FROM Laboratory      WHERE CRE < 1.5 );	thrombosis_prediction
SELECT e.ID  FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.CRE < 1.5 ORDER BY e.`aCL IgA` DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT Examination.ID)  FROM Examination  JOIN Laboratory ON Examination.ID = Laboratory.ID  WHERE Laboratory.`T-BIL` >= 2.0 AND Examination.`ANA Pattern` LIKE '%P%';	thrombosis_prediction
SELECT E.ANA  FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE L.`T-BIL` = (     SELECT MAX(`T-BIL`)      FROM Laboratory      WHERE `T-BIL` < 2.0 );	thrombosis_prediction
SELECT COUNT(DISTINCT Examination.ID) FROM Examination JOIN Laboratory ON Examination.ID = Laboratory.ID WHERE Laboratory.`T-CHO` >= 250 AND Examination.`KCT` = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) AS PatientCount FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.`T-CHO` < 250 AND e.`ANA Pattern` = 'P';	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID JOIN Examination e ON p.ID = e.ID WHERE l.TG < 200 AND e.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT P.Diagnosis  FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.TG < 200 ORDER BY L.TG DESC LIMIT 1;	thrombosis_prediction
SELECT DISTINCT e.ID FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE e.Thrombosis = 0 AND l.CPK < 250;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) AS PositiveCoagulationCount FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.CPK < 250 AND (e.KCT = '+' OR e.RVVT = '+' OR e.LAC = '+');	thrombosis_prediction
SELECT Birthday  FROM Patient  WHERE ID = (     SELECT ID      FROM Laboratory      WHERE GLU > 180      ORDER BY Date ASC      LIMIT 1 )  ORDER BY Birthday ASC  LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID JOIN Examination e ON p.ID = e.ID WHERE l.GLU < 180 AND e.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '+' AND l.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis = 'SLE' AND l.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT DISTINCT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE (Laboratory.RBC <= 3.5 OR Laboratory.RBC >= 6.0) AND Patient.Admission = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT l.ID) AS Patient_Count FROM Laboratory l JOIN Patient p ON l.ID = p.ID WHERE l.PLT > 100 AND l.PLT < 400 AND p.Diagnosis IS NOT NULL;	thrombosis_prediction
SELECT L.ID, L.Date, L.PLT FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE P.Diagnosis = 'MCTD' AND L.PLT > 100 AND L.PLT < 400;	thrombosis_prediction
SELECT AVG(Laboratory.PT) AS Average_Prothrombin_Time FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE Patient.SEX = 'M' AND Laboratory.PT < 14;	thrombosis_prediction
SELECT COUNT(DISTINCT Examination.ID)  FROM Examination  JOIN Laboratory ON Examination.ID = Laboratory.ID  WHERE Examination.Thrombosis IN (1, 2) AND Laboratory.PT < 14;	thrombosis_prediction
SELECT major.major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Angela' AND member.last_name = 'Sanders';	student_club
SELECT COUNT(*) AS student_count FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.college = 'College of Engineering';	student_club
SELECT m.first_name || ' ' || m.last_name AS full_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.department = 'Art and Design';	student_club
SELECT COUNT(*) AS students_attended FROM attendance JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'Women''s Soccer';	student_club
SELECT m.phone FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer';	student_club
SELECT COUNT(*) AS medium_tshirt_count FROM attendance JOIN event ON attendance.link_to_event = event.event_id JOIN member ON attendance.link_to_member = member.member_id WHERE event.event_name = "Women's Soccer" AND member.t_shirt_size = 'Medium';	student_club
SELECT e.event_name, COUNT(a.link_to_member) AS attendance_count FROM event e JOIN attendance a ON e.event_id = a.link_to_event GROUP BY e.event_id ORDER BY attendance_count DESC LIMIT 1;	student_club
SELECT major.college  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE member.position = 'Vice President';	student_club
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.first_name = 'Maya' AND m.last_name = 'Mclean';	student_club
SELECT COUNT(a.link_to_event) AS events_attended FROM attendance a JOIN member m ON a.link_to_member = m.member_id JOIN event e ON a.link_to_event = e.event_id WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison' AND strftime('%Y', e.event_date) = '2019';	student_club
SELECT COUNT(DISTINCT e.event_id) AS meeting_count FROM event e JOIN attendance a ON e.event_id = a.link_to_event WHERE e.type = 'Meeting' GROUP BY e.event_id HAVING COUNT(a.link_to_member) > 10;	student_club
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event WHERE e.type != 'Fundraiser' GROUP BY e.event_id HAVING COUNT(a.link_to_event) > 20;	student_club
SELECT COUNT(a.link_to_event) * 1.0 / COUNT(DISTINCT e.event_name) AS average_attendance FROM attendance a JOIN event e ON a.link_to_event = e.event_id WHERE e.type = 'Meeting' AND strftime('%Y', e.event_date) = '2020';	student_club
SELECT expense_description, MAX(cost) AS most_expensive_item FROM expense WHERE approved = 'Yes';	student_club
SELECT COUNT(*) AS member_count FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Environmental Engineering';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Laugh Out Loud';	student_club
SELECT m.last_name FROM member AS m JOIN major AS ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Law and Constitutional Studies';	student_club
SELECT z.county  FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Sherri' AND m.last_name = 'Ramsey';	student_club
SELECT m.college FROM member me JOIN major m ON me.link_to_major = m.major_id WHERE me.first_name = 'Tyler' AND me.last_name = 'Hewitt';	student_club
SELECT SUM(amount) AS total_funds_received FROM income WHERE link_to_member IN (     SELECT member_id      FROM member      WHERE position = 'Vice President' );	student_club
SELECT SUM(spent) AS total_spent_on_food FROM budget WHERE category = 'Food'  AND link_to_event IN (SELECT event_id FROM event WHERE event_name = 'September Meeting');	student_club
SELECT z.city, z.state FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.position = 'President';	student_club
SELECT m.first_name || ' ' || m.last_name AS full_name FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE z.state = 'Illinois';	student_club
SELECT SUM(b.spent) AS total_spent FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE b.category = 'Advertisement' AND e.event_name = 'September Meeting';	student_club
SELECT DISTINCT m.department FROM member me JOIN major m ON me.link_to_major = m.major_id WHERE me.last_name IN ('Pierce', 'Guidi');	student_club
SELECT SUM(budget.amount) AS total_budgeted_amount FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'October Speaker';	student_club
SELECT e.expense_id, e.expense_description, e.approved FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.event_name = 'October Meeting' AND ev.event_date = '2019-10-08';	student_club
SELECT AVG(e.cost) AS average_cost FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.first_name = 'Elijah' AND m.last_name = 'Allen' AND (SUBSTR(e.expense_date, 6, 2) = '09' OR SUBSTR(e.expense_date, 6, 2) = '10');	student_club
SELECT      (SUM(CASE WHEN SUBSTR(e.event_date, 1, 4) = '2019' THEN b.spent ELSE 0 END) -       SUM(CASE WHEN SUBSTR(e.event_date, 1, 4) = '2020' THEN b.spent ELSE 0 END)) AS spent_difference FROM      event e JOIN      budget b ON e.event_id = b.link_to_event;	student_club
SELECT location  FROM event  WHERE event_name = 'Spring Budget Review';	student_club
SELECT e.cost  FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.event_name = 'Posters' AND ev.event_date = '2019-09-04';	student_club
SELECT remaining  FROM budget  WHERE category = 'Food'    AND amount = (SELECT MAX(amount) FROM budget WHERE category = 'Food');	student_club
SELECT notes  FROM income  WHERE source = 'Fundraising' AND date_received = '2019-09-14';	student_club
SELECT COUNT(*)  FROM major  WHERE college = 'College of Humanities and Social Sciences';	student_club
SELECT phone  FROM member  WHERE first_name = 'Carlo' AND last_name = 'Jacobs';	student_club
SELECT z.county  FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Adela' AND m.last_name = "O'Gallagher";	student_club
SELECT COUNT(*) AS exceeded_budget_count FROM budget WHERE link_to_event = (     SELECT event_id     FROM event     WHERE event_name = 'November Meeting' ) AND remaining < 0;	student_club
SELECT SUM(amount) AS total_budget_amount FROM budget WHERE link_to_event = (SELECT event_id FROM event WHERE event_name = 'September Speaker');	student_club
SELECT e.status  FROM event e JOIN budget b ON e.event_id = b.link_to_event JOIN expense ex ON b.budget_id = ex.link_to_budget WHERE ex.expense_description = 'Post Cards, Posters' AND ex.expense_date = '2019-8-20';	student_club
SELECT m.major_name FROM member mb JOIN major m ON mb.link_to_major = m.major_id WHERE mb.first_name = 'Brent' AND mb.last_name = 'Thomason';	student_club
SELECT COUNT(*) AS medium_size_count FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Business' AND member.t_shirt_size = 'Medium';	student_club
SELECT z.type  FROM member m  JOIN zip_code z ON m.zip = z.zip_code  WHERE m.first_name = 'Christof' AND m.last_name = 'Nielson';	student_club
SELECT major.major_name  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE member.position = 'Vice President';	student_club
SELECT z.state  FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison';	student_club
SELECT major.department  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE member.position = 'President';	student_club
SELECT i.date_received FROM income i JOIN member m ON i.link_to_member = m.member_id WHERE m.first_name = 'Connor' AND m.last_name = 'Hilton' AND i.source = 'Dues';	student_club
SELECT m.first_name || ' ' || m.last_name AS full_name FROM income i JOIN member m ON i.link_to_member = m.member_id WHERE i.date_received = (     SELECT MIN(date_received)     FROM income     WHERE source = 'Dues' ) AND i.source = 'Dues';	student_club
SELECT      SUM(CASE WHEN e.event_name = 'Yearly Kickoff' THEN b.amount ELSE 0 END) /      SUM(CASE WHEN e.event_name = 'October Meeting' THEN b.amount ELSE 0 END) AS times_budget_more FROM      budget b JOIN      event e ON b.link_to_event = e.event_id WHERE      b.category = 'Advertisement';	student_club
SELECT (SUM(b.amount) * 100.0 / (SELECT SUM(amount) FROM budget b2 INNER JOIN event e2 ON b2.link_to_event = e2.event_id WHERE e2.event_name = 'November Speaker')) AS percentage FROM budget b INNER JOIN event e ON b.link_to_event = e.event_id WHERE b.category = 'Parking' AND e.event_name = 'November Speaker';	student_club
SELECT SUM(cost) AS total_pizza_cost  FROM expense  WHERE expense_description = 'Pizza';	student_club
SELECT COUNT(DISTINCT city)  FROM zip_code  WHERE county = 'Orange County' AND state = 'Virginia';	student_club
SELECT DISTINCT department  FROM major  WHERE college = 'College of Humanities and Social Sciences';	student_club
SELECT zip_code.city, zip_code.county, zip_code.state  FROM member  JOIN zip_code ON member.zip = zip_code.zip_code  WHERE member.first_name = 'Amy' AND member.last_name = 'Firth';	student_club
SELECT e.expense_description FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id WHERE b.remaining = (SELECT MIN(remaining) FROM budget);	student_club
SELECT m.member_id, m.first_name, m.last_name, m.email, m.position, m.t_shirt_size, m.phone, m.zip, m.link_to_major FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'October Meeting';	student_club
SELECT major.college, COUNT(member.member_id) AS member_count FROM member JOIN major ON member.link_to_major = major.major_id GROUP BY major.college ORDER BY member_count DESC LIMIT 1;	student_club
SELECT major.major_name  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE member.phone = '809-555-3360';	student_club
SELECT event.event_name  FROM event  JOIN budget ON event.event_id = budget.link_to_event  ORDER BY budget.amount DESC  LIMIT 1;	student_club
SELECT e.expense_description  FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.position = 'Vice President';	student_club
SELECT COUNT(DISTINCT a.link_to_member) AS attendee_count FROM attendance a JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = "Women's Soccer";	student_club
SELECT i.date_received  FROM income i JOIN member m ON i.link_to_member = m.member_id WHERE m.first_name = 'Casey' AND m.last_name = 'Mason';	student_club
SELECT COUNT(DISTINCT m.member_id) AS maryland_members_count FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE z.state = 'Maryland';	student_club
SELECT COUNT(*) AS event_count FROM attendance a JOIN member m ON a.link_to_member = m.member_id WHERE m.phone = '954-555-6240';	student_club
SELECT m.first_name || ' ' || m.last_name AS full_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT e.event_name, MAX(b.spent / b.amount) AS max_spend_to_budget_ratio FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.status = 'Closed' GROUP BY e.event_name ORDER BY max_spend_to_budget_ratio DESC LIMIT 1;	student_club
SELECT COUNT(*) AS number_of_presidents FROM member WHERE position = 'President';	student_club
SELECT MAX(spent) AS highest_budget_spent  FROM budget;	student_club
SELECT COUNT(*) FROM event WHERE type = 'Meeting' AND substr(event_date, 1, 4) = '2020';	student_club
SELECT SUM(spent) AS total_spent_for_food FROM budget WHERE category = 'Food';	student_club
SELECT (m.first_name || ' ' || m.last_name) AS full_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member GROUP BY m.member_id, m.first_name, m.last_name HAVING COUNT(a.link_to_event) > 7;	student_club
SELECT m.first_name, m.last_name  FROM member m JOIN major ma ON m.link_to_major = ma.major_id JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE ma.major_name = 'Interior Design' AND e.event_name = 'Community Theater';	student_club
SELECT m.first_name || ' ' || m.last_name AS full_name FROM member AS m JOIN zip_code AS z ON m.zip = z.zip_code WHERE z.city = 'Georgetown' AND z.state = 'South Carolina';	student_club
SELECT COUNT(income.amount) AS total_income_generated  FROM income  JOIN member ON income.link_to_member = member.member_id  WHERE member.first_name = 'Grant' AND member.last_name = 'Gilmour';	student_club
SELECT m.first_name || ' ' || m.last_name AS full_name FROM member AS m JOIN income AS i ON m.member_id = i.link_to_member WHERE i.amount > 40;	student_club
SELECT SUM(e.cost) AS total_expense FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.event_name = 'Yearly Kickoff';	student_club
SELECT m.first_name || ' ' || m.last_name AS full_name FROM member m JOIN budget b ON m.member_id = b.budget_id JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'Yearly Kickoff';	student_club
SELECT      member.first_name || ' ' || member.last_name AS full_name,      income.source  FROM      income  JOIN      member  ON      income.link_to_member = member.member_id  WHERE      income.amount = (SELECT MAX(amount) FROM income);	student_club
SELECT e.event_name  FROM event e JOIN budget b ON e.event_id = b.link_to_event JOIN expense ex ON b.budget_id = ex.link_to_budget WHERE ex.cost = (SELECT MIN(cost) FROM expense);	student_club
SELECT      (SUM(e.cost) FILTER (WHERE ev.event_name = 'Yearly Kickoff') / SUM(e.cost)) * 100 AS percentage FROM      expense e JOIN      budget b ON e.link_to_budget = b.budget_id JOIN      event ev ON b.link_to_event = ev.event_id;	student_club
SELECT CAST(SUM(CASE WHEN major_name = 'Finance' THEN 1 ELSE 0 END) AS FLOAT) /         SUM(CASE WHEN major_name = 'Physics' THEN 1 ELSE 0 END) AS ratio FROM major;	student_club
SELECT source, MAX(amount) AS top_funds  FROM income  WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30';	student_club
SELECT first_name || ' ' || last_name AS full_name, email FROM member WHERE position = 'Secretary';	student_club
SELECT COUNT(*)  FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Physics Teaching';	student_club
SELECT COUNT(DISTINCT attendance.link_to_member) AS total_attendees FROM attendance JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'Community Theater' AND strftime('%Y', event.event_date) = '2019';	student_club
SELECT COUNT(attendance.link_to_event) AS number_of_events_attended, major.major_name  FROM member  JOIN attendance ON member.member_id = attendance.link_to_member  JOIN major ON member.link_to_major = major.major_id  WHERE member.first_name = 'Luisa' AND member.last_name = 'Guidi';	student_club
SELECT AVG(spent) AS average_food_spent_per_event FROM budget WHERE category = 'Food' AND event_status = 'Closed';	student_club
SELECT e.event_name  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  WHERE b.category = 'Advertisement'  ORDER BY b.spent DESC  LIMIT 1;	student_club
SELECT COUNT(*) > 0 AS attended FROM attendance JOIN member ON attendance.link_to_member = member.member_id JOIN event ON attendance.link_to_event = event.event_id WHERE member.first_name = 'Maya' AND member.last_name = 'Mclean' AND event.event_name = 'Women''s Soccer';	student_club
SELECT (SUM(CASE WHEN type = 'Community Service' THEN 1 ELSE 0 END) * 100.0 / COUNT(event_id)) AS percentage_share FROM event WHERE event_date BETWEEN '2019-01-01' AND '2019-12-31';	student_club
SELECT e.cost  FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE e.expense_description = 'Posters' AND ev.event_name = 'September Speaker';	student_club
SELECT t_shirt_size, COUNT(t_shirt_size) AS count FROM member GROUP BY t_shirt_size ORDER BY count DESC LIMIT 1;	student_club
SELECT e.event_name  FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.status = 'Closed' AND b.remaining < 0 ORDER BY b.remaining ASC LIMIT 1;	student_club
SELECT e.expense_description AS type_of_expense, SUM(e.cost) AS total_value FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.event_name = 'October Meeting' AND e.approved = 'Yes' GROUP BY e.expense_description;	student_club
SELECT category, SUM(amount) AS total_budgeted FROM budget WHERE link_to_event = (SELECT event_id FROM event WHERE event_name = 'April Speaker') GROUP BY category ORDER BY total_budgeted ASC;	student_club
SELECT budget_id, amount  FROM budget  WHERE category = 'Food'  ORDER BY amount DESC  LIMIT 1;	student_club
SELECT *  FROM budget  WHERE category = 'Advertising'  ORDER BY amount DESC  LIMIT 3;	student_club
SELECT SUM(cost) AS total_parking_cost FROM expense WHERE expense_description = 'Parking';	student_club
SELECT SUM(cost) AS total_expense FROM expense WHERE expense_date = '2019-08-20';	student_club
SELECT m.first_name || ' ' || m.last_name AS full_name, SUM(e.cost) AS total_cost FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE m.member_id = 'rec4BLdZHS2Blfp4v';	student_club
SELECT e.expense_description FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison';	student_club
SELECT e.expense_description FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.t_shirt_size = 'X-Large';	student_club
SELECT m.zip  FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost < 50;	student_club
SELECT major.major_name  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE member.first_name = 'Phillip' AND member.last_name = 'Cullen';	student_club
SELECT DISTINCT m.position  FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Business';	student_club
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Business' AND member.t_shirt_size = 'Medium';	student_club
SELECT DISTINCT e.type  FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.remaining > 30;	student_club
SELECT DISTINCT type  FROM event  WHERE location = 'MU 215';	student_club
SELECT b.category FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.event_date = '2020-03-24T12:00:00';	student_club
SELECT major.major_name  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE member.position = 'Vice President';	student_club
SELECT (SUM(CASE WHEN m.position = 'Member' AND ma.major_name = 'Business' THEN 1 ELSE 0 END) * 100.0 / COUNT(m.member_id)) AS percentage_of_business_members FROM member m JOIN major ma ON m.link_to_major = ma.major_id;	student_club
SELECT DISTINCT type  FROM event  WHERE location = 'MU 215';	student_club
SELECT COUNT(*) AS income_count FROM income WHERE amount = 50;	student_club
SELECT COUNT(*)  FROM member  WHERE position = 'Member' AND t_shirt_size = 'X-Large';	student_club
SELECT COUNT(*)  FROM major  WHERE college = 'College of Agriculture and Applied Sciences'  AND department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT member.last_name, major.department, major.college FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Environmental Engineering';	student_club
SELECT b.category FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.location = 'MU 215' AND e.type = 'Guest Speaker' AND b.spent = 0;	student_club
SELECT DISTINCT z.city, z.state FROM member m JOIN major ma ON m.link_to_major = ma.major_id JOIN zip_code z ON m.zip = z.zip_code WHERE ma.department = 'Electrical and Computer Engineering Department' AND m.position = 'Member';	student_club
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE e.type = 'Social' AND m.position = 'Vice President' AND e.location = '900 E. Washington St.';	student_club
SELECT m.last_name, m.position FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE e.expense_description = 'Pizza' AND e.expense_date = '2019-09-10';	student_club
SELECT m.last_name FROM member AS m JOIN attendance AS a ON m.member_id = a.link_to_member JOIN event AS e ON a.link_to_event = e.event_id WHERE m.position = 'Member' AND e.event_name = 'Women''s Soccer';	student_club
SELECT (COUNT(CASE WHEN i.amount = 50 THEN 1 END) * 100.0 / COUNT(m.member_id)) AS percentage FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE m.t_shirt_size = 'Medium' AND m.position = 'Member';	student_club
SELECT DISTINCT county  FROM zip_code  WHERE type = 'PO Box';	student_club
SELECT zip_code  FROM zip_code  WHERE type = 'PO Box' AND county = 'San Juan Municipio' AND state = 'Puerto Rico';	student_club
SELECT event_name  FROM event  WHERE type = 'Game'  AND status = 'Closed'  AND event_date BETWEEN '2019-03-15' AND '2020-03-20';	student_club
SELECT DISTINCT attendance.link_to_event FROM attendance JOIN expense ON attendance.link_to_member = expense.link_to_member WHERE expense.cost > 50;	student_club
SELECT DISTINCT      member.member_id,      member.first_name,      member.last_name,      attendance.link_to_event  FROM      member  JOIN      expense ON member.member_id = expense.link_to_member  JOIN      attendance ON member.member_id = attendance.link_to_member  WHERE      expense.approved = 'true'      AND expense.expense_date BETWEEN '2019-01-10' AND '2019-11-19';	student_club
SELECT major.college  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE member.first_name = 'Katy' AND member.link_to_major = 'rec1N0upiVLy5esTO';	student_club
SELECT m.phone FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Business' AND ma.college = 'College of Agriculture and Applied Sciences';	student_club
SELECT DISTINCT m.email FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE e.expense_date BETWEEN '2019-09-10' AND '2019-11-19'    AND e.cost > 20;	student_club
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Education'    AND major.college = 'Education & Human Services'    AND member.position = 'Member';	student_club
SELECT (CAST(SUM(CASE WHEN b.remaining < 0 THEN 1 ELSE 0 END) AS FLOAT) / COUNT(e.event_id)) * 100 AS percentage_over_budget FROM event e LEFT JOIN budget b ON e.event_id = b.link_to_event;	student_club
SELECT event_id, location, status  FROM event  WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31';	student_club
SELECT expense_description  FROM expense  GROUP BY expense_description  HAVING AVG(cost) > 50;	student_club
SELECT first_name || ' ' || last_name AS full_name FROM member WHERE t_shirt_size = 'X-Large';	student_club
SELECT (SUM(CASE WHEN type = 'PO Box' THEN 1 ELSE 0 END) * 1.0 / COUNT(zip_code)) * 100 AS percentage_po_box FROM zip_code;	student_club
SELECT e.event_name, e.location FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.remaining > 0;	student_club
SELECT e.event_name, e.event_date FROM event e JOIN budget b ON e.event_id = b.link_to_event JOIN expense ex ON b.budget_id = ex.link_to_budget WHERE ex.expense_description = 'Pizza' AND ex.cost > 50 AND ex.cost < 100;	student_club
SELECT      member.first_name || ' ' || member.last_name AS full_name,     major.major_name FROM      member JOIN      major ON member.link_to_major = major.major_id JOIN      expense ON member.member_id = expense.link_to_member WHERE      expense.cost > 100;	student_club
SELECT z.city, z.county FROM event e JOIN budget b ON e.event_id = b.link_to_event JOIN income i ON i.link_to_member IN (     SELECT m.member_id     FROM member m     WHERE m.zip = z.zip_code ) JOIN zip_code z ON e.location = z.zip_code GROUP BY e.event_id HAVING COUNT(i.income_id) > 40;	student_club
SELECT m.member_id, m.first_name, m.last_name, SUM(e.cost) AS total_cost FROM member m JOIN expense e ON m.member_id = e.link_to_member JOIN budget b ON e.link_to_budget = b.budget_id GROUP BY m.member_id HAVING COUNT(DISTINCT b.link_to_event) > 1 ORDER BY total_cost DESC LIMIT 1;	student_club
SELECT AVG(e.cost) AS average_amount_paid FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.position != 'Member';	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event JOIN expense ex ON b.budget_id = ex.link_to_budget WHERE b.category = 'Parking' GROUP BY e.event_name HAVING AVG(ex.cost) < (     SELECT SUM(ex2.cost) / COUNT(e2.event_id)     FROM event e2     JOIN budget b2 ON e2.event_id = b2.link_to_event     JOIN expense ex2 ON b2.budget_id = ex2.link_to_budget     WHERE b2.category = 'Parking' );	student_club
SELECT (SUM(e.cost) / COUNT(DISTINCT ev.event_id)) * 100 AS percentage_of_cost FROM event ev JOIN budget b ON ev.event_id = b.link_to_event JOIN expense e ON b.budget_id = e.link_to_budget WHERE ev.type = 'Meeting';	student_club
SELECT b.budget_id, b.category, MAX(e.cost) AS max_allowed_amount FROM budget b JOIN expense e ON b.budget_id = e.link_to_budget WHERE e.expense_description = 'Water, chips, cookies' GROUP BY b.budget_id, b.category ORDER BY max_allowed_amount DESC LIMIT 1;	student_club
SELECT m.first_name || ' ' || m.last_name AS full_name, SUM(e.cost) AS total_spent FROM member m JOIN expense e ON m.member_id = e.link_to_member GROUP BY m.member_id ORDER BY total_spent DESC LIMIT 5;	student_club
SELECT m.first_name || ' ' || m.last_name AS full_name, m.phone FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost > (SELECT AVG(cost) FROM expense);	student_club
SELECT      (CAST(SUM(z.state = 'New Jersey') AS REAL) / COUNT(m.position = 'Member') -      CAST(SUM(z.state = 'Vermont') AS REAL) / COUNT(m.position = 'Member')) AS percentage_difference FROM member m JOIN zip_code z ON m.zip = z.zip_code;	student_club
SELECT m.major_name, m.department  FROM member mem JOIN major m ON mem.link_to_major = m.major_id WHERE mem.first_name = 'Garrett' AND mem.last_name = 'Gerke';	student_club
SELECT      m.first_name || ' ' || m.last_name AS full_name,      e.cost FROM      member AS m JOIN      expense AS e ON      m.member_id = e.link_to_member WHERE      e.expense_description = 'Water, Veggie tray, supplies';	student_club
SELECT member.last_name, member.phone  FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Elementary Education';	student_club
SELECT budget.category, budget.amount FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'January Speaker';	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.category = 'Food';	student_club
SELECT member.first_name || ' ' || member.last_name AS full_name, income.amount  FROM income  JOIN member ON income.link_to_member = member.member_id  WHERE income.date_received = '9/9/2019';	student_club
SELECT b.category  FROM expense e  JOIN budget b ON e.link_to_budget = b.budget_id  WHERE e.expense_description = 'Posters';	student_club
SELECT member.first_name || ' ' || member.last_name AS full_name, major.college FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'Secretary';	student_club
SELECT e.event_name, SUM(b.spent) AS total_spent FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE b.category = 'Speaker Gifts' GROUP BY e.event_name;	student_club
SELECT z.city  FROM member m  JOIN zip_code z ON m.zip = z.zip_code  WHERE m.first_name = 'Garrett' AND m.last_name = 'Gerke';	student_club
SELECT member.first_name || ' ' || member.last_name AS full_name, member.position FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE zip_code.city = 'Lincolnton' AND zip_code.state = 'North Carolina' AND zip_code.zip_code = 28092;	student_club
SELECT COUNT(*)  FROM gasstations  WHERE Country = 'CZE' AND Segment = 'Premium';	debit_card_specializing
SELECT      (SELECT COUNT(*) FROM customers WHERE Currency = 'EUR') * 1.0 /      (SELECT COUNT(*) FROM customers WHERE Currency = 'CZK') AS Ratio;	debit_card_specializing
SELECT CustomerID, MIN(Consumption) AS LeastConsumption FROM yearmonth WHERE SUBSTR(Date, 1, 4) = '2012' AND CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'LAM');	debit_card_specializing
SELECT AVG(Consumption) / 12 AS AverageMonthlyConsumption FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE customers.Segment = 'SME' AND SUBSTR(yearmonth.Date, 1, 4) = '2013';	debit_card_specializing
SELECT c.CustomerID, SUM(y.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Currency = 'CZK' AND y.Date BETWEEN '201101' AND '201112' GROUP BY c.CustomerID ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT COUNT(DISTINCT y.CustomerID) AS CustomerCount FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Segment = 'KAM'   AND y.Date BETWEEN '201201' AND '201212' GROUP BY y.CustomerID HAVING SUM(y.Consumption) < 30000;	debit_card_specializing
SELECT      (SELECT SUM(y.Consumption)       FROM yearmonth y       JOIN customers c ON y.CustomerID = c.CustomerID       WHERE SUBSTR(y.Date, 1, 4) = '2012' AND c.Currency = 'CZK')      -      (SELECT SUM(y.Consumption)       FROM yearmonth y       JOIN customers c ON y.CustomerID = c.CustomerID       WHERE SUBSTR(y.Date, 1, 4) = '2012' AND c.Currency = 'EUR')      AS Difference;	debit_card_specializing
SELECT strftime('%Y', t.Date) AS Year, SUM(t.Amount) AS TotalGasUse FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR' GROUP BY Year ORDER BY TotalGasUse DESC LIMIT 1;	debit_card_specializing
SELECT c.Segment, SUM(y.Consumption) AS TotalConsumption FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID GROUP BY c.Segment ORDER BY TotalConsumption ASC LIMIT 1;	debit_card_specializing
SELECT SUBSTR(y.Date, 1, 4) AS Year, SUM(y.Consumption) AS TotalConsumption FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Currency = 'CZK' GROUP BY Year ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT Date, MAX(Consumption) AS PeakConsumption FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'SME')   AND SUBSTR(Date, 1, 4) = '2013' GROUP BY Date ORDER BY PeakConsumption DESC LIMIT 1;	debit_card_specializing
WITH SegmentConsumption AS (     SELECT          c.Segment,         ym.CustomerID,         SUM(ym.Consumption) AS TotalConsumption     FROM          yearmonth ym     JOIN          customers c ON ym.CustomerID = c.CustomerID     WHERE          ym.Date BETWEEN '201301' AND '201312'     GROUP BY          c.Segment, ym.CustomerID ), LeastConsumptionPerSegment AS (     SELECT          Segment,         MIN(TotalConsumption) AS LeastConsumption     FROM          SegmentConsumption     GROUP BY          Segment ), AnnualAverageConsumption AS (     SELECT          lc.Segment,         lc.LeastConsumption / COUNT(sc.CustomerID) AS AnnualAverage     FROM          LeastConsumptionPerSegment lc     JOIN          SegmentConsumption sc ON lc.Segment = sc.Segment AND lc.LeastConsumption = sc.TotalConsumption     GROUP BY          lc.Segment ), Differences AS (     SELECT          (SELECT AnnualAverage FROM AnnualAverageConsumption WHERE Segment = 'SME') -          (SELECT AnnualAverage FROM AnnualAverageConsumption WHERE Segment = 'LAM') AS SME_LAM_Difference,         (SELECT AnnualAverage FROM AnnualAverageConsumption WHERE Segment = 'LAM') -          (SELECT AnnualAverage FROM AnnualAverageConsumption WHERE Segment = 'KAM') AS LAM_KAM_Difference,         (SELECT AnnualAverage FROM AnnualAverageConsumption WHERE Segment = 'KAM') -          (SELECT AnnualAverage FROM AnnualAverageConsumption WHERE Segment = 'SME') AS KAM_SME_Difference ) SELECT * FROM Differences;	debit_card_specializing
WITH yearly_consumption AS (     SELECT          c.Segment,         SUBSTR(y.Date, 1, 4) AS Year,         SUM(y.Consumption) AS TotalConsumption     FROM yearmonth y     JOIN customers c ON y.CustomerID = c.CustomerID     WHERE c.Currency = 'EUR'     GROUP BY c.Segment, SUBSTR(y.Date, 1, 4) ), percentage_changes AS (     SELECT          yc2012.Segment,         ((yc2013.TotalConsumption - yc2012.TotalConsumption) / yc2013.TotalConsumption) * 100 AS PercentageChange     FROM yearly_consumption yc2012     JOIN yearly_consumption yc2013 ON yc2012.Segment = yc2013.Segment     WHERE yc2012.Year = '2012' AND yc2013.Year = '2013' ) SELECT      Segment,     MAX(PercentageChange) AS MaxPercentageIncrease,     MIN(PercentageChange) AS MinPercentageIncrease FROM percentage_changes;	debit_card_specializing
SELECT SUM(Consumption) AS TotalConsumption FROM yearmonth WHERE CustomerID = 6 AND Date BETWEEN '201308' AND '201311';	debit_card_specializing
SELECT      (SELECT COUNT(*)       FROM gasstations       WHERE Country = 'CZE' AND Segment = 'Value for money') -      (SELECT COUNT(*)       FROM gasstations       WHERE Country = 'SVK' AND Segment = 'Value for money') AS Difference;	debit_card_specializing
SELECT      (SELECT Consumption FROM yearmonth WHERE CustomerID = 7 AND Date = '201304') -      (SELECT Consumption FROM yearmonth WHERE CustomerID = 5 AND Date = '201304') AS ConsumptionDifference;	debit_card_specializing
SELECT      (SELECT COUNT(*) FROM customers WHERE Segment = 'SME' AND Currency = 'CZK') -      (SELECT COUNT(*) FROM customers WHERE Segment = 'SME' AND Currency = 'EUR') AS SME_Difference;	debit_card_specializing
SELECT CustomerID, MAX(Consumption) AS HighestConsumption FROM yearmonth WHERE Date = '201310' AND CustomerID IN (     SELECT CustomerID     FROM customers     WHERE Segment = 'LAM' AND Currency = 'EUR' );	debit_card_specializing
SELECT c.CustomerID, MAX(y.Consumption) AS MaxConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'KAM' GROUP BY c.CustomerID ORDER BY MaxConsumption DESC LIMIT 1;	debit_card_specializing
SELECT SUM(Consumption) AS TotalConsumption FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE customers.Segment = 'KAM' AND yearmonth.Date = '201305';	debit_card_specializing
SELECT      (CAST(COUNT(DISTINCT y.CustomerID) AS FLOAT) /      (SELECT COUNT(DISTINCT CustomerID) FROM customers WHERE Segment = 'LAM')) * 100 AS Percentage FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Segment = 'LAM' AND y.Consumption > 46.73;	debit_card_specializing
SELECT Country, COUNT(*) AS TotalValueForMoneyStations FROM gasstations WHERE Segment = 'Value for money' GROUP BY Country;	debit_card_specializing
SELECT      (CAST(SUM(CASE WHEN Currency = 'EUR' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(CustomerID)) * 100 AS Percentage_KAM_Uses_Euro FROM customers WHERE Segment = 'KAM';	debit_card_specializing
SELECT      (CAST(COUNT(*) AS FLOAT) / (SELECT COUNT(*) FROM yearmonth WHERE SUBSTR(Date, 1, 6) = '201202')) * 100 AS Percentage FROM      yearmonth WHERE      SUBSTR(Date, 1, 6) = '201202' AND Consumption > 528.3;	debit_card_specializing
SELECT    (CAST(SUM(CASE WHEN Segment = 'Premium' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(*)) * 100 AS PremiumPercentage FROM gasstations WHERE Country = 'SVK';	debit_card_specializing
SELECT CustomerID  FROM yearmonth  WHERE Date = '201309'  ORDER BY Consumption DESC  LIMIT 1;	debit_card_specializing
SELECT c.Segment, SUM(y.Consumption) AS TotalConsumption FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE y.Date = '201309' GROUP BY c.Segment ORDER BY TotalConsumption ASC LIMIT 1;	debit_card_specializing
SELECT CustomerID, MIN(Consumption) AS MinConsumption FROM yearmonth WHERE Date = '201206' AND CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'SME');	debit_card_specializing
SELECT MAX(Consumption) AS HighestMonthlyConsumption FROM yearmonth WHERE SUBSTR(Date, 1, 4) = '2012';	debit_card_specializing
SELECT MAX(MonthlyConsumption) AS BiggestMonthlyConsumption FROM (     SELECT SUM(Consumption) / 12 AS MonthlyConsumption     FROM yearmonth     WHERE CustomerID IN (         SELECT CustomerID         FROM customers         WHERE Currency = 'EUR'     )     GROUP BY CustomerID, strftime('%Y%m', Date) );	debit_card_specializing
SELECT DISTINCT p.Description FROM transactions_1k t JOIN products p ON t.ProductID = p.ProductID JOIN yearmonth ym ON t.CustomerID = ym.CustomerID WHERE ym.Date = '201309';	debit_card_specializing
SELECT DISTINCT g.Country FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID JOIN yearmonth y ON t.CustomerID = y.CustomerID WHERE y.Date = '201306';	debit_card_specializing
SELECT DISTINCT g.ChainID FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR';	debit_card_specializing
SELECT DISTINCT p.Description FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID JOIN products p ON t.ProductID = p.ProductID WHERE c.Currency = 'EUR';	debit_card_specializing
SELECT AVG(Price) AS AverageTotalPrice  FROM transactions_1k  WHERE Date LIKE '2012-01%';	debit_card_specializing
SELECT COUNT(DISTINCT y.CustomerID) AS CustomerCount FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Currency = 'EUR' AND y.Consumption > 1000;	debit_card_specializing
SELECT DISTINCT p.Description FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID JOIN products p ON t.ProductID = p.ProductID WHERE g.Country = 'CZE';	debit_card_specializing
SELECT DISTINCT Time  FROM transactions_1k  WHERE GasStationID IN (SELECT GasStationID FROM gasstations WHERE ChainID = 11);	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k AS t JOIN gasstations AS g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE' AND t.Price > 1000;	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k  WHERE GasStationID IN (SELECT GasStationID FROM gasstations WHERE Country = 'CZE')  AND Date > '2012-01-01';	debit_card_specializing
SELECT AVG(t.Price) AS AverageTotalPrice FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE';	debit_card_specializing
SELECT AVG(t.Price) AS AverageTotalPrice FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR';	debit_card_specializing
SELECT CustomerID, SUM(Price) AS TotalPaid FROM transactions_1k WHERE Date = '2012-08-25' GROUP BY CustomerID ORDER BY TotalPaid DESC LIMIT 1;	debit_card_specializing
SELECT g.Country  FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.Date = '2012-08-25' ORDER BY t.TransactionID ASC LIMIT 1;	debit_card_specializing
SELECT c.Currency FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE t.Date = '2012-08-24' AND t.Time = '16:25:00';	debit_card_specializing
SELECT c.Segment  FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE t.Date = '2012-08-23' AND t.Time = '21:20:00';	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k  JOIN customers ON transactions_1k.CustomerID = customers.CustomerID  WHERE transactions_1k.Date = '2012-08-26'  AND transactions_1k.Time < '13:00:00'  AND customers.Currency = 'CZK';	debit_card_specializing
SELECT Segment  FROM customers  WHERE CustomerID = (SELECT MIN(CustomerID) FROM customers);	debit_card_specializing
SELECT G.Country  FROM transactions_1k T JOIN gasstations G ON T.GasStationID = G.GasStationID WHERE T.Date = '2012-08-24' AND T.Time = '12:42:00';	debit_card_specializing
SELECT ProductID  FROM transactions_1k  WHERE Date = '2012-08-23' AND Time = '21:20:00';	debit_card_specializing
SELECT y.Date, y.Consumption  FROM yearmonth y JOIN transactions_1k t ON y.CustomerID = t.CustomerID WHERE t.Price = 124.05 AND t.Date = '2012-08-24' AND y.Date = '201201';	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.Date = '2012-08-26'  AND t.Time BETWEEN '08:00:00' AND '09:00:00'  AND g.Country = 'CZE';	debit_card_specializing
SELECT c.Currency FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE y.Date = '201306' AND y.Consumption = 214582.17;	debit_card_specializing
SELECT g.Country FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.CardID = 667467;	debit_card_specializing
SELECT g.Country  FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.Date = '2012-08-24' AND t.Amount = 548.4;	debit_card_specializing
SELECT      (CAST(COUNT(DISTINCT t.CustomerID) AS FLOAT) /      (SELECT COUNT(*) FROM customers WHERE Currency = 'EUR')) * 100 AS Percentage FROM      transactions_1k t JOIN      customers c ON t.CustomerID = c.CustomerID WHERE      c.Currency = 'EUR'      AND t.Date = '2012-08-25';	debit_card_specializing
SELECT      ((SUM(CASE WHEN SUBSTR(Date, 1, 4) = '2012' THEN Consumption ELSE 0 END) -        SUM(CASE WHEN SUBSTR(Date, 1, 4) = '2013' THEN Consumption ELSE 0 END)) /      SUM(CASE WHEN SUBSTR(Date, 1, 4) = '2012' THEN Consumption ELSE 0 END)) AS ConsumptionDecreaseRate FROM yearmonth WHERE CustomerID = (     SELECT CustomerID      FROM transactions_1k     WHERE Date = '2012-08-25' AND Price = 634.8 );	debit_card_specializing
SELECT GasStationID, SUM(Amount * Price) AS Revenue FROM transactions_1k GROUP BY GasStationID ORDER BY Revenue DESC LIMIT 1;	debit_card_specializing
SELECT      (COUNT(CASE WHEN Segment = 'Premium' THEN GasStationID END) * 100.0 / COUNT(GasStationID)) AS PremiumPercentage FROM      gasstations WHERE      Country = 'SVK';	debit_card_specializing
SELECT      SUM(CASE WHEN t.Date = '201201' THEN t.Price ELSE 0 END) AS TotalSpentJanuary2012,     SUM(t.Price) AS TotalSpent FROM      transactions_1k t WHERE      t.CustomerID = 38508;	debit_card_specializing
SELECT p.Description, SUM(t.Amount) AS TotalAmountSold FROM transactions_1k t JOIN products p ON t.ProductID = p.ProductID GROUP BY p.Description ORDER BY TotalAmountSold DESC LIMIT 5;	debit_card_specializing
SELECT      c.CustomerID,     c.Currency,     SUM(t.Price) AS TotalSpent,     SUM(t.Price) / SUM(t.Amount) AS AvgPricePerItem FROM      transactions_1k t JOIN      customers c ON t.CustomerID = c.CustomerID GROUP BY      c.CustomerID, c.Currency ORDER BY      TotalSpent DESC LIMIT 1;	debit_card_specializing
SELECT g.Country FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.ProductID = 2 ORDER BY t.Price DESC LIMIT 1;	debit_card_specializing
SELECT y.Consumption  FROM transactions_1k t JOIN yearmonth y ON t.CustomerID = y.CustomerID WHERE t.ProductID = 5    AND (t.Price / t.Amount) > 29.00    AND y.Date = '201208';	debit_card_specializing
