SELECT MAX(`Percent (%) Eligible Free (K-12)`) AS HighestEligibleFreeRate FROM frpm WHERE `County Name` = 'Alameda';	california_schools
SELECT `Percent (%) Eligible Free (Ages 5-17)` FROM frpm WHERE `School Type` = 'Continuation' ORDER BY `Percent (%) Eligible Free (Ages 5-17)` ASC LIMIT 3;	california_schools
SELECT DISTINCT T2.Zip  FROM frpm AS T1  JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode  WHERE T1.`Charter School (Y/N)` = 1 AND T2.County = 'Fresno';	california_schools
SELECT T1.MailingStreet FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T2.FRPM_Count_K_12 DESC LIMIT 1	california_schools
SELECT T1.Phone FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`Charter School (Y/N)` = 1 AND T1.OpenDate > '2000-01-01';	california_schools
SELECT COUNT(*)  FROM satscores AS T1  JOIN schools AS T2 ON T1.cds = T2.CDSCode  WHERE T1.AvgScrMath > 400 AND T2.Virtual = 'F';	california_schools
SELECT s.School, s.Magnet FROM schools s JOIN satscores sa ON s.CDSCode = sa.cds WHERE sa.NumTstTakr > 500 AND (s.Magnet = 1 OR s.MagOffer = 1) ORDER BY sa.AvgScrRead DESC;	california_schools
SELECT T1.Phone FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumGE1500 > 0 ORDER BY T2.NumGE1500 DESC LIMIT 1	california_schools
SELECT COUNT(*) AS NumSATTestTakers FROM frpm JOIN satscores ON frpm.CDSCode = satscores.cds ORDER BY frpm.[FRPM Count (K-12)] DESC LIMIT 1;	california_schools
SELECT COUNT(*) FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrMath > 560 AND T1.`Charter Funding Type` = 'Directly funded'	california_schools
SELECT f.FRPM Count (Ages 5-17) FROM frpm f JOIN satscores s ON f.CDSCode = s.cds ORDER BY s.AvgScrRead DESC LIMIT 1;	california_schools
SELECT CDSCode FROM frpm WHERE Enrollment (K-12) + Enrollment (Ages 5-17) > 500;	california_schools
SELECT MAX(f.`Percent (%) Eligible Free (Ages 5-17)`) AS MaxEligibleFreeRate FROM frpm f JOIN satscores s ON f.CDSCode = s.cds WHERE s.NumGE1500 / s.NumTstTakr > 0.3;	california_schools
SELECT T2.Phone FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumGE1500 IS NOT NULL AND T1.NumTstTakr IS NOT NULL ORDER BY CAST(T1.NumGE1500 AS REAL) / T1.NumTstTakr DESC LIMIT 3;	california_schools
SELECT T1.NCESDist, T2.School, T2.Enrollment FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T2.Enrollment DESC LIMIT 5;	california_schools
SELECT T2.District, AVG(T1.AvgScrRead) AS AvgReadingScore FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.StatusType = 'Active' GROUP BY T2.District ORDER BY AvgReadingScore DESC LIMIT 1	california_schools
SELECT COUNT(*) FROM satscores WHERE NumTstTakr < 100;	california_schools
SELECT T1.CDSCode, T1.CharterNumber FROM frpm AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrWrite > 499 AND T1.CharterNumber IS NOT NULL ORDER BY T2.AvgScrWrite DESC;	california_schools
SELECT COUNT(*)  FROM frpm  JOIN satscores ON frpm.CDSCode = satscores.cds  WHERE frpm.County = 'Fresno' AND frpm.Charter Funding Type = 'Directly funded' AND satscores.NumTstTakr <= 250;	california_schools
SELECT T1.Phone FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds ORDER BY T2.AvgScrMath DESC LIMIT 1	california_schools
SELECT COUNT(*) FROM frpm WHERE County = 'Amador' AND Low_Grade = '9' AND High_Grade = '12';	california_schools
SELECT COUNT(*)  FROM frpm  JOIN schools ON frpm.CDSCode = schools.CDSCode  WHERE schools.County = 'Los Angeles'  AND frpm.`Free Meal Count (K-12)` > 500  AND frpm.`FRPM Count (K-12)` < 700;	california_schools
SELECT s.School, ss.NumTstTakr FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.County = 'Contra Costa' ORDER BY ss.NumTstTakr DESC LIMIT 1;	california_schools
SELECT s.School, s.Street, s.StreetAbr, s.City, s.Zip, s.State, f.`Enrollment (K-12)`, f.`Enrollment (Ages 5-17)` FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE ABS(f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`) > 30;	california_schools
SELECT s.School, f.[Percent (%) Eligible Free (K-12)], st.AvgScrRead, st.AvgScrMath, st.AvgScrWrite FROM frpm f JOIN satscores st ON f.CDSCode = st.cds JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.[Percent (%) Eligible Free (K-12)] > 0.1 AND st.NumGE1500 >= 1;	california_schools
SELECT s.School, s.FundingType  FROM schools s  JOIN satscores sa ON s.CDSCode = sa.cds  WHERE sa.AvgScrMath > 400 AND s.County = 'Riverside'  GROUP BY s.School, s.FundingType;	california_schools
SELECT s.School, s.Street, s.City, s.State, s.Zip  FROM frpm f  JOIN schools s ON f.CDSCode = s.CDSCode  WHERE s.District = 'Monterey' AND f.`Enrollment (Ages 15-17)` > 800;	california_schools
SELECT s.School, ss.AvgScrWrite, s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.OpenDate > '1991-12-31' OR s.ClosedDate < '2000-01-01';	california_schools
SELECT s.School, s.DOCType, AVG(f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`) AS avg_diff FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`Charter Funding Type` = 'Locally Funded' GROUP BY s.School, s.DOCType HAVING avg_diff > (SELECT AVG(f2.`Enrollment (K-12)` - f2.`Enrollment (Ages 5-17)`)                     FROM frpm f2                     JOIN schools s2 ON f2.CDSCode = s2.CDSCode                     WHERE f2.`Charter Funding Type` = 'Locally Funded') ORDER BY avg_diff DESC;	california_schools
SELECT T2.OpenDate  FROM frpm AS T1  JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode  WHERE T1.LowGrade = 'K' AND T1.HighGrade = '12'  ORDER BY T1.Enrollment DESC  LIMIT 1;	california_schools
SELECT T2.City FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T1.`Enrollment (K-12)` ASC LIMIT 5	california_schools
SELECT `Percent (%) Eligible Free (K-12)`, `Enrollment (K-12)` FROM frpm ORDER BY `Enrollment (K-12)` DESC LIMIT 10;	california_schools
SELECT s.School, f.`Percent (%) Eligible FRPM (K-12)` FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.StatusType = 'Active' AND f.`Ownership Code` = 66 ORDER BY f.`FRPM Count (K-12)` DESC LIMIT 5;	california_schools
SELECT s.Website, s.School  FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`Free Meal Count (Ages 5-17)` BETWEEN 1900 AND 2000;	california_schools
SELECT "Percent (%) Eligible Free (Ages 5-17)"  FROM frpm  JOIN schools ON frpm.CDSCode = schools.CDSCode  WHERE schools.School LIKE '%Kacey Gibson%';	california_schools
SELECT T1.AdmEmail1 FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`Charter School (Y/N)` = 1 ORDER BY T2.`Enrollment (K-12)` ASC LIMIT 1;	california_schools
SELECT T1.AdmFName1, T1.AdmLName1, T1.AdmFName2, T1.AdmLName2, T1.AdmFName3, T1.AdmLName3 FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumGE1500 = (SELECT MAX(NumGE1500) FROM satscores) LIMIT 1;	california_schools
SELECT s.Street, s.City, s.Zip, s.State FROM schools s JOIN satscores sa ON s.CDSCode = sa.cds ORDER BY sa.NumGE1500 / sa.NumTstTakr ASC LIMIT 1;	california_schools
SELECT T2.Website FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumTstTakr BETWEEN 2000 AND 3000;	california_schools
SELECT AVG(s.NumTstTakr) AS AverageTestTakers FROM satscores s JOIN schools sch ON s.cds = sch.CDSCode WHERE sch.City = 'Fresno' AND STRFTIME('%Y', sch.OpenDate) = '1980';	california_schools
SELECT T1.Phone FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.District = 'Fresno Unified' ORDER BY T2.AvgScrRead ASC LIMIT 1	california_schools
SELECT s.School, AVG(ss.AvgScrRead) AS AvgReadingScore FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.Virtual = 'F' GROUP BY s.County, s.School ORDER BY AvgReadingScore DESC LIMIT 5;	california_schools
SELECT T2.School FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrMath DESC LIMIT 1	california_schools
SELECT AVG(AvgScrMath + AvgScrRead + AvgScrWrite) AS AvgScore, T2.County FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY AvgScrMath + AvgScrRead + AvgScrWrite ASC LIMIT 1;	california_schools
SELECT AVG(T2.AvgScrWrite), T1.City FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumGE1500 > 0 GROUP BY T1.City ORDER BY SUM(T2.NumGE1500) DESC LIMIT 1	california_schools
SELECT s.School, AVG(ss.AvgScrWrite) AS AvgWritingScore FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.AdmFName1 = 'Ricci' AND s.AdmLName1 = 'Ulrich' GROUP BY s.School;	california_schools
SELECT s.School, s.County, s.State, f.[Enrollment (K-12)] FROM schools AS s JOIN frpm AS f ON s.CDSCode = f.CDSCode WHERE s.DOC = 31 ORDER BY f.[Enrollment (K-12)] DESC;	california_schools
SELECT COUNT(*) / 12 AS "Monthly Average" FROM schools WHERE STRFTIME('%Y', OpenDate) = '1980' AND DOC = 52;	california_schools
SELECT SUM(CASE WHEN T1.DOC = 52 THEN 1 ELSE 0 END) AS Elementary_School_District,         SUM(CASE WHEN T1.DOC = 54 THEN 1 ELSE 0 END) AS Unified_School_District FROM schools AS T1 WHERE T1.County = 'Orange';	california_schools
SELECT DISTINCT s.County, s.School, s.ClosedDate FROM schools s WHERE s.StatusType = 'Closed' ORDER BY s.ClosedDate DESC;	california_schools
SELECT T2.Street, T2.School  FROM satscores AS T1  JOIN schools AS T2 ON T1.cds = T2.CDSCode  ORDER BY T1.AvgScrMath DESC  LIMIT 1 OFFSET 6;	california_schools
SELECT T1.MailStreet, T1.School FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds ORDER BY T2.AvgScrRead ASC LIMIT 1	california_schools
SELECT COUNT(s.CDSCode) FROM satscores s JOIN schools sc ON s.cds = sc.CDSCode WHERE (s.AvgScrRead + s.AvgScrMath + s.AvgScrWrite) >= 1500 AND sc.MailCity = 'Lakeport';	california_schools
SELECT COUNT(*) AS TotalTestTakers FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.MailCity = 'Fresno';	california_schools
SELECT s.School, s.MailZip FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.AdmFName1 = 'Avetik' AND s.AdmLName1 = 'Atoian';	california_schools
SELECT CAST(SUM(CASE WHEN County = 'Colusa' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN County = 'Humboldt' THEN 1 ELSE 0 END) AS Ratio FROM schools;	california_schools
SELECT COUNT(*) FROM schools WHERE State = 'CA' AND City = 'San Joaquin' AND StatusType = 'Active';	california_schools
SELECT T1.Phone, T1.Ext  FROM schools AS T1  JOIN satscores AS T2 ON T1.CDSCode = T2.cds  ORDER BY T2.AvgScrWrite DESC  LIMIT 1 OFFSET 332;	california_schools
SELECT Phone, Ext, School FROM schools WHERE Zip = '95203-3704';	california_schools
SELECT Website FROM schools WHERE AdmFName1 = 'Mike' AND AdmLName1 = 'Larson' OR AdmFName2 = 'Mike' AND AdmLName2 = 'Larson' OR AdmFName3 = 'Mike' AND AdmLName3 = 'Larson' OR AdmFName1 = 'Dante' AND AdmLName1 = 'Alvarez' OR AdmFName2 = 'Dante' AND AdmLName2 = 'Alvarez' OR AdmFName3 = 'Dante' AND AdmLName3 = 'Alvarez';	california_schools
SELECT Website FROM schools WHERE Charter = 1 AND State = 'CA' AND County = 'San Joaquin' AND Virtual = 'P';	california_schools
SELECT COUNT(*) FROM schools WHERE City = 'Hickman' AND DOC = 52 AND Charter = 1;	california_schools
SELECT COUNT(*)  FROM frpm  JOIN schools ON frpm.CDSCode = schools.CDSCode  WHERE schools.County = 'Los Angeles' AND frpm.Charter = 0 AND frpm.`Percent (%) Eligible Free (K-12)` < 0.18;	california_schools
SELECT s.School, s.City, sa.AdmFName1, sa.AdmLName1, sa.AdmFName2, sa.AdmLName2, sa.AdmFName3, sa.AdmLName3  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  JOIN sat_scores ss ON s.CDSCode = ss.cds  JOIN admin_info ai ON s.CDSCode = ai.school_id  WHERE f.Charter = 1 AND f.CharterNumber = '00D2';	california_schools
SELECT COUNT(*)  FROM schools  WHERE MailingCity = 'Hickman' AND CharterNum = '00D4';	california_schools
SELECT      SUM(CASE WHEN frpm.`Charter Funding Type` = 'Locally Funded' THEN 1 ELSE 0 END) AS Locally_Funded_Schools,     COUNT(frpm.CDSCode) AS Total_Charter_Schools FROM      frpm JOIN      schools ON frpm.CDSCode = schools.CDSCode WHERE      schools.County = 'Santa Clara';	california_schools
SELECT COUNT(*) FROM schools WHERE FundingType = 'Directly Funded' AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31' AND County = 'Stanislaus';	california_schools
SELECT COUNT(*) FROM schools WHERE City = 'San Francisco' AND ClosedDate BETWEEN '1989-01-01' AND '1989-12-31';	california_schools
SELECT T2.County  FROM schools AS T1  JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode  WHERE T1.SOC = '11' AND T1.ClosedDate BETWEEN '1980-01-01' AND '1989-12-31'  GROUP BY T2.County  ORDER BY COUNT(T1.CDSCode) DESC  LIMIT 1;	california_schools
SELECT NCESDist FROM schools WHERE SOC = '31';	california_schools
SELECT COUNT(*)  FROM schools  WHERE County = 'Alpine' AND District = 'District Community Day School' AND StatusType IN ('Active', 'Closed');	california_schools
SELECT DistrictCode FROM schools WHERE City = 'Fresno' AND Magnet = 0;	california_schools
SELECT "Enrollment (Ages 5-17)"  FROM frpm  JOIN schools ON frpm.CDSCode = schools.CDSCode  WHERE schools.School = 'State Special School' AND schools.City = 'Fremont' AND frpm.`Academic Year` = '2014-2015';	california_schools
SELECT T1.`Free Meal Count (Ages 5-17)` FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.School = 'Youth Authority School' AND T2.MailStreet = 'PO Box 1040';	california_schools
SELECT T2.LowGrade FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.NCESDist = '0613360' AND T1.EdOpsCode = 'SPECON' ORDER BY T2.LowGrade ASC LIMIT 1	california_schools
SELECT T2.School FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Charter Funding Type` = 'Breakfast Provision 2' AND T2.`County Code` = '37'	california_schools
SELECT T2.City  FROM frpm AS T1  JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode  WHERE T1.EducationalOptionType = 'High Schools (Public)'  AND T1.LowGrade = '9'  AND T1.HighGrade = '12'  AND T1.Lunch Provision 2 = 1  AND T2.County = 'Merced';	california_schools
SELECT s.School, f.[Percent (%) Eligible FRPM (Ages 5-17)] FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.County = 'Los Angeles' AND f.LowGrade = 'K' AND f.HighGrade = '9';	california_schools
SELECT T1.GSserved FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.City = 'Adelanto' GROUP BY T1.GSserved ORDER BY COUNT(T1.GSserved) DESC LIMIT 1	california_schools
SELECT COUNT(*) AS NumberOfSchools FROM schools WHERE County IN ('San Diego', 'Santa Barbara') AND Virtual = 'F';	california_schools
SELECT School, Latitude, Longitude, School Type FROM schools ORDER BY Latitude DESC LIMIT 1;	california_schools
SELECT T.School, T.LowestGrade FROM (     SELECT S.School, MIN(S.Latitude) AS LowestLatitude, MIN(FR.LowGrade) AS LowestGrade     FROM schools S     JOIN frpm FR ON S.CDSCode = FR.CDSCode     WHERE S.State = 'CA'     GROUP BY S.School ) T ORDER BY T.LowestLatitude ASC LIMIT 1;	california_schools
SELECT GSoffered FROM schools ORDER BY ABS(Longitude) DESC LIMIT 1;	california_schools
SELECT COUNT(DISTINCT City), COUNT(*) AS NumberOfSchools FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE Magnet = 1 AND GSoffered = 'K-8' AND NSLP_Provision_Status = 'Multiple Provision Types' GROUP BY City;	california_schools
SELECT AdmFName1, District, COUNT(*) AS FirstNameCount FROM schools GROUP BY AdmFName1, District ORDER BY FirstNameCount DESC LIMIT 2;	california_schools
SELECT T1.`Percent (%) Eligible Free (K-12)`, T2.`District Code` FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`AdmFName1` = 'Alusine';	california_schools
SELECT T2.AdmLName1, T2.District, T2.County, T2.School  FROM schools AS T1  JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode  WHERE T1.CharterNum = '40';	california_schools
SELECT AdmEmail1, AdmEmail2, AdmEmail3  FROM schools  WHERE County = 'San Bernardino' AND City = 'San Bernardino City Unified' AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND (SOC = 62 OR DOC = 54);	california_schools
SELECT s.School, s.AdmEmail1 FROM schools s JOIN satscores sa ON s.CDSCode = sa.cds WHERE sa.AvgScrRead >= 1500 AND sa.AvgScrMath >= 1500 AND sa.AvgScrWrite >= 1500 ORDER BY sa.NumGE1500 DESC LIMIT 1;	california_schools
SELECT COUNT(DISTINCT d.district_id) AS account_count FROM district d JOIN account a ON d.district_id = a.district_id JOIN disp dp ON a.account_id = dp.account_id WHERE d.A3 LIKE '%East Bohemia%' AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT COUNT(DISTINCT T1.account_id) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 = 'Prague' AND T1.frequency = 'POPLATEK MESICNE'	financial
SELECT A12 AS Unemployment_1995, A13 AS Unemployment_1996 FROM district WHERE A1 AND A2 = 'Hl.m. Praha' ORDER BY ABS(A12 - A13) DESC LIMIT 1;	financial
SELECT COUNT(*) FROM district WHERE A11 > 6000 AND A11 < 10000;	financial
SELECT AVG(T1.A11) AS avg_salary FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.gender = 'M' AND T1.A3 LIKE '%North Bohemia%' GROUP BY T1.district_id HAVING COUNT(T2.client_id) > 0 AND AVG(T1.A11) > 8000;	financial
SELECT AVG(T1.A11) AS avg_salary FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.gender = 'F' GROUP BY T2.client_id ORDER BY MIN(T2.birth_date) ASC LIMIT 1; SELECT MAX(AVG(T1.A11)) - MIN(AVG(T1.A11)) AS salary_gap FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.gender = 'F';	financial
SELECT DISTINCT T1.account_id FROM account AS T1 JOIN disp AS T2 ON T1.account_id = T2.account_id JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T3.birth_date IN (     SELECT MIN(birth_date)     FROM client ) ORDER BY AVG(T3.A11) DESC LIMIT 1;	financial
SELECT COUNT(DISTINCT d.client_id) AS customer_count FROM disp d JOIN account a ON d.account_id = a.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND d.type = 'OWNER';	financial
SELECT T1.client_id FROM disp AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.frequency = 'POPLATEK PO OBRATU'	financial
SELECT a.account_id, a.date, a.frequency FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.status = 'A' AND STRFTIME('%Y', l.date) = '1997' ORDER BY l.amount ASC LIMIT 1;	financial
SELECT T1.account_id, T1.amount FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.duration > 12 AND STRFTIME('%Y', T2.date) = '1993' ORDER BY T1.amount DESC LIMIT 1;	financial
SELECT COUNT(client_id) FROM client WHERE gender = 'F' AND birth_date < '1950-01-01' AND district_id IN (SELECT district_id FROM district WHERE A2 = 'Sokolov');	financial
SELECT T1.account_id FROM account AS T1 INNER JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE STRFTIME('%Y', T2.date) = '1995' ORDER BY T2.date ASC LIMIT 1	financial
SELECT DISTINCT T1.account_id  FROM account AS T1  JOIN disp AS T2 ON T1.account_id = T2.account_id  WHERE T1.date < '1997-01-01' AND T1.amount > 3000;	financial
SELECT T1.client_id FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN card AS T3 ON T2.disp_id = T3.disp_id WHERE T3.issued = '1994-03-03'	financial
SELECT T1.date FROM account AS T1 INNER JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T2.amount = 840 AND T2.date = '1998-10-14'	financial
SELECT T1.district_id FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id INNER JOIN loan AS T3 ON T2.account_id = T3.account_id WHERE T3.date = '1994-08-25'	financial
SELECT MAX(amount) FROM trans WHERE account_id IN (SELECT account_id FROM disp WHERE disp_id = (SELECT disp_id FROM card WHERE issued = '1996-10-21'))	financial
SELECT c.gender FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN district dt ON c.district_id = dt.district_id WHERE c.birth_date = (     SELECT MIN(birth_date)     FROM client     WHERE district_id IN (         SELECT district_id         FROM (             SELECT district_id, AVG(A11) AS avg_salary             FROM client             JOIN disp ON client.client_id = disp.client_id             JOIN account ON disp.account_id = account.account_id             JOIN district ON client.district_id = district.district_id             GROUP BY district_id         )         ORDER BY avg_salary DESC         LIMIT 1     ) ) ORDER BY c.birth_date ASC LIMIT 1;	financial
SELECT T1.amount FROM trans AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.account_id = ( SELECT T4.account_id FROM loan AS T3 INNER JOIN disp AS T4 ON T3.account_id = T4.account_id ORDER BY T3.amount DESC LIMIT 1 ) ORDER BY T1.date ASC LIMIT 1	financial
SELECT COUNT(client_id) AS female_clients_in_jesenik FROM client JOIN disp ON client.client_id = disp.client_id JOIN account ON disp.account_id = account.account_id JOIN district ON client.district_id = district.district_id WHERE district.A2 = 'Jesenik' AND client.gender = 'F';	financial
SELECT T1.disp_id FROM disp AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T3.amount = 5100 AND T3.date LIKE '1998-09-02%'	financial
SELECT COUNT(account_id) AS account_count FROM account JOIN disp ON account.account_id = disp.account_id JOIN client ON disp.client_id = client.client_id JOIN district ON client.district_id = district.district_id WHERE district.A2 = 'Litomerice' AND strftime('%Y', account.date) = '1996';	financial
SELECT T2.A2 FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' AND T1.birth_date = '1976-01-29'	financial
SELECT T1.birth_date FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id INNER JOIN loan AS T4 ON T3.account_id = T4.account_id WHERE T4.amount = 98832 AND STRFTIME('%Y-%m-%d', T4.date) = '1996-01-03';	financial
SELECT T1.account_id FROM disp AS T1  JOIN client AS T2 ON T1.client_id = T2.client_id  JOIN district AS T3 ON T2.district_id = T3.district_id  WHERE T3.A3 = 'Prague'  ORDER BY T2.birth_date ASC  LIMIT 1;	financial
SELECT CAST(SUM(CASE WHEN T1.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.client_id) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 LIKE '%south Bohemia%' ORDER BY T2.A4 DESC LIMIT 1	financial
SELECT      c.client_id,     (t2.balance - t1.balance) / t2.balance * 100 AS increase_rate FROM      trans t1 JOIN      trans t2 ON t1.account_id = t2.account_id AND t1.date = '1993-03-22' AND t2.date = '1998-12-27' JOIN      disp d ON t1.account_id = d.account_id JOIN      loan l ON d.client_id = l.client_id AND l.date = '1993-07-05' JOIN      client c ON d.client_id = c.client_id;	financial
SELECT CAST(SUM(CASE WHEN status = 'A' THEN amount ELSE 0 END) AS REAL) * 100 / SUM(amount) FROM loan	financial
SELECT CAST(SUM(CASE WHEN status = 'C' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS percentage_running FROM loan WHERE amount < 100000;	financial
SELECT a.account_id, d.A2 AS district_name, d.A3 AS district_region FROM account a JOIN disp d ON a.account_id = d.account_id WHERE strftime('%Y', a.date) = '1993' AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT T1.account_id, T1.frequency  FROM account AS T1  JOIN disp AS T2 ON T1.account_id = T2.account_id  JOIN client AS T3 ON T2.client_id = T3.client_id  JOIN district AS T4 ON T3.district_id = T4.district_id  WHERE T4.A2 LIKE '%east Bohemia%' AND T1.date BETWEEN '1995-01-01' AND '2000-12-31';	financial
SELECT T1.account_id, T2.date FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.A2 = 'Prachatice' ORDER BY T2.date;	financial
SELECT T2.A2, T2.A3 FROM loan AS T1 INNER JOIN district AS T2 ON T1.account_id = T2.district_id WHERE T1.loan_id = 4990;	financial
SELECT T1.account_id, T3.A2, T3.A3  FROM loan AS T1  JOIN account AS T2 ON T1.account_id = T2.account_id  JOIN district AS T3 ON T2.district_id = T3.district_id  WHERE T1.amount > 300000;	financial
SELECT T1.loan_id, T3.A3, AVG(T2.salary) AS avg_salary FROM loan AS T1 JOIN disp AS T2 ON T1.account_id = T2.account_id JOIN client AS T3 ON T2.client_id = T3.client_id JOIN account AS T4 ON T2.account_id = T4.account_id JOIN district AS T5 ON T4.district_id = T5.district_id WHERE T1.duration = 60 GROUP BY T1.loan_id, T3.A3;	financial
SELECT      d.A12 AS unemployment_rate_1995,      d.A13 AS unemployment_rate_1996,      ((d.A13 - d.A12) / d.A12) * 100 AS unemployment_increment_percentage FROM      district d JOIN      account a ON d.district_id = a.district_id JOIN      loan l ON a.account_id = l.account_id WHERE      l.status = 'D';	financial
SELECT CAST(SUM(CASE WHEN T2.A2 = 'Decin' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE STRFTIME('%Y', T1.date) = '1993'	financial
SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE';	financial
SELECT d.A2, COUNT(c.client_id) AS female_count FROM district d JOIN client c ON d.district_id = c.district_id WHERE c.gender = 'F' GROUP BY d.A2 ORDER BY female_count DESC LIMIT 9;	financial
SELECT d.A2, SUM(t.amount) AS total_withdrawals FROM trans t JOIN account a ON t.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id WHERE t.type = 'VYDAJ' AND t.date LIKE '1996-01%' GROUP BY d.A2 ORDER BY total_withdrawals DESC LIMIT 10;	financial
SELECT COUNT(client_id) FROM client WHERE district_id IN ( SELECT district_id FROM district WHERE A3 = 'South Bohemia' ) AND client_id NOT IN ( SELECT client_id FROM card )	financial
SELECT T1.A3  FROM district AS T1  JOIN account AS T2 ON T1.district_id = T2.district_id  JOIN loan AS T3 ON T2.account_id = T3.account_id  WHERE T3.status IN ('C', 'D')  GROUP BY T1.A3  ORDER BY COUNT(T3.loan_id) DESC  LIMIT 1;	financial
SELECT AVG(loan.amount) AS average_loan_amount FROM client JOIN disp ON client.client_id = disp.client_id JOIN loan ON disp.account_id = loan.account_id WHERE client.gender = 'M';	financial
SELECT T1.A2, T1.A13 FROM district AS T1 ORDER BY T1.A13 DESC;	financial
SELECT COUNT(account_id) AS account_count FROM disp JOIN district ON disp.district_id = district.district_id WHERE district.A16 = (SELECT MAX(A16) FROM district WHERE date LIKE '1996%');	financial
SELECT COUNT(DISTINCT t1.account_id) AS negative_balance_accounts FROM trans AS t1 JOIN account AS t2 ON t1.account_id = t2.account_id WHERE t1.operation = 'VYBER KARTOU' AND t2.frequency = 'POPLATEK MESICNE' AND t1.balance < 0;	financial
SELECT COUNT(DISTINCT l.account_id) AS approved_loans FROM loan l JOIN account a ON l.account_id = a.account_id WHERE l.date BETWEEN '1995-01-01' AND '1997-12-31' AND l.amount >= 250000 AND a.frequency = 'POPLATEK MESICNE';	financial
SELECT COUNT(*) FROM loan WHERE status IN ('C', 'D') AND account_id IN (SELECT account_id FROM disp WHERE client_id IN (SELECT client_id FROM district WHERE district_id = 1));	financial
SELECT COUNT(client_id) AS male_clients_count FROM client WHERE district_id = (     SELECT district_id     FROM district     ORDER BY A15 DESC     LIMIT 1 OFFSET 1 ) AND gender = 'M';	financial
SELECT COUNT(*) FROM card AS c JOIN disp AS d ON c.card_id = d.card_id WHERE c.type = 'gold' AND d.type = 'OWNER';	financial
SELECT COUNT(account_id) FROM account WHERE district_id = ( SELECT district_id FROM district WHERE A2 = 'Pisek' )	financial
SELECT T2.A2 AS district_name FROM trans AS T1 JOIN district AS T2 ON T1.account_id = T2.district_id WHERE T1.amount > 10000 AND strftime('%Y', T1.date) = '1997';	financial
SELECT account.account_id FROM account JOIN disp ON account.account_id = disp.account_id JOIN `order` ON account.account_id = `order`.account_id WHERE `order`.k_symbol = 'SIPO' AND `order`.bank_to = 'Pisek';	financial
SELECT DISTINCT T1.account_id FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN card AS T3 ON T2.disp_id = T3.disp_id WHERE T3.type = 'gold'	financial
SELECT AVG(amount) AS average_credit_card_amount FROM trans WHERE type = 'PRIJEM' AND k_symbol = 'VYBER KARTOU' AND date LIKE '2021%';	financial
SELECT DISTINCT T1.account_id FROM disp AS T1 JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T2.date BETWEEN '1998-01-01' AND '1998-12-31'   AND T2.type = 'PRIJEM'   AND T2.operation = 'VYBER KARTOU'   AND T2.amount < (     SELECT AVG(amount)     FROM trans     WHERE date BETWEEN '1998-01-01' AND '1998-12-31'       AND type = 'PRIJEM'       AND operation = 'VYBER KARTOU'   );	financial
SELECT c.client_id, c.gender, d.account_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card ca ON d.disp_id = ca.disp_id JOIN loan l ON d.account_id = l.account_id WHERE c.gender = 'F' AND ca.type = 'credit';	financial
SELECT COUNT(*) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' AND T2.A3 LIKE '%South Bohemia%'	financial
SELECT a.account_id FROM account a JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id JOIN district dis ON c.district_id = dis.district_id WHERE dis.A2 = 'Tabor' AND d.type = 'OWNER';	financial
SELECT DISTINCT T1.type  FROM card AS T1  JOIN disp AS T2 ON T1.card_id = T2.card_id  WHERE T2.type != 'OWNER'  AND T2.account_id IN (     SELECT account_id      FROM account      WHERE district_id IN (         SELECT district_id          FROM client          GROUP BY district_id          HAVING AVG(T1.A11) BETWEEN 8000 AND 9000     ) )	financial
SELECT COUNT(DISTINCT t1.account_id) AS account_count FROM trans t1 JOIN account a ON t1.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE d.A3 LIKE '%North Bohemia%' AND t1.bank = 'AB';	financial
SELECT T1.A2 FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id INNER JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T3.type = 'VYDAJ'	financial
SELECT AVG(T1.A15) AS avg_crimes FROM district AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.A15 > 4000 AND T2.date >= '1997-01-01';	financial
SELECT COUNT(*) AS classic_cards_eligible_for_loan FROM card c JOIN disp d ON c.card_id = d.card_id WHERE c.type = 'classic' AND d.type = 'OWNER';	financial
SELECT COUNT(client_id)  FROM client  JOIN disp ON client.client_id = disp.client_id  JOIN account ON disp.account_id = account.account_id  JOIN district ON client.district_id = district.district_id  WHERE district.A2 = 'Hl.m. Praha' AND client.gender = 'M';	financial
SELECT CAST(SUM(CASE WHEN type = 'gold' AND issued < '1998-01-01' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM card	financial
SELECT T3.name FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id ORDER BY T1.amount DESC LIMIT 1	financial
SELECT T2.A15 AS committed_crimes FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.account_id = 532;	financial
SELECT T1.district_id FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id WHERE T3.account_id = 33333	financial
SELECT t.date, t.amount FROM trans t JOIN disp d ON t.account_id = d.account_id WHERE d.client_id = 3356 AND t.operation = 'VYBER';	financial
SELECT COUNT(DISTINCT d.account_id) AS weekly_issuance_accounts_with_loans_under_200000 FROM disp d JOIN account a ON d.account_id = a.account_id JOIN loan l ON a.account_id = l.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND l.amount < 200000;	financial
SELECT T1.type FROM card AS T1 INNER JOIN disp AS T2 ON T1.card_id = T2.card_id WHERE T2.client_id = 13539	financial
SELECT T2.A3 FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.client_id = 3541;	financial
SELECT T1.A2 FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id INNER JOIN loan AS T3 ON T2.account_id = T3.account_id WHERE T3.status = 'A' GROUP BY T1.A2 ORDER BY COUNT(*) DESC LIMIT 1	financial
SELECT T1.client_id FROM disp AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.disp_id = 32423;	financial
SELECT t.trans_id, t.date, t.type, t.amount, t.balance, t.k_symbol, t.bank, t.account FROM trans t JOIN account a ON t.account_id = a.account_id WHERE a.district_id = 5 ORDER BY t.date DESC;	financial
SELECT COUNT(account_id) FROM account WHERE district_id = ( SELECT district_id FROM district WHERE A3 = 'Jesenik' )	financial
SELECT T2.client_id FROM card AS T1 INNER JOIN disp AS T2 ON T1.card_id = T2.card_id WHERE T1.type = 'junior' AND T1.issued >= '1997-01-01'	financial
SELECT CAST(SUM(CASE WHEN T2.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.client_id) FROM disp AS T1 JOIN client AS T2 ON T1.client_id = T2.client_id JOIN account AS T3 ON T1.account_id = T3.account_id JOIN district AS T4 ON T3.district_id = T4.district_id WHERE T4.A11 > 10000;	financial
SELECT      ((SUM(CASE WHEN T1.date LIKE '1997%' THEN T1.amount ELSE 0 END) - SUM(CASE WHEN T1.date LIKE '1996%' THEN T1.amount ELSE 0 END)) / SUM(CASE WHEN T1.date LIKE '1996%' THEN T1.amount ELSE 0 END)) * 100 AS growth_rate FROM      loan AS T1 JOIN      disp AS T2 ON T1.account_id = T2.account_id JOIN      client AS T3 ON T2.client_id = T3.client_id WHERE      T3.gender = 'M';	financial
SELECT COUNT(*) FROM trans WHERE type = 'PRIJEM' AND operation = 'VYBER KARTOU' AND date > '1995-12-31';	financial
SELECT SUM(CASE WHEN A3 = 'Praha' THEN A16 ELSE 0 END) - SUM(CASE WHEN A3 = 'Benesov' THEN A16 ELSE 0 END) AS crime_difference FROM district;	financial
SELECT type ,  COUNT(*) FROM disp WHERE account_id BETWEEN 1 AND 10 GROUP BY type	financial
SELECT T1.frequency, SUM(T2.amount) AS total_amount FROM account AS T1 INNER JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T1.account_id = 3 AND T2.k_symbol LIKE '%statement%' GROUP BY T1.frequency;	financial
SELECT T2.birth_date FROM disp AS T1 INNER JOIN client AS T2 ON T1.client_id = T2.client_id WHERE T1.disp_id = 130;	financial
SELECT COUNT(DISTINCT d.account_id) FROM disp d JOIN account a ON d.account_id = a.account_id WHERE d.type = 'OWNER' AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT SUM(T1.amount) AS total_debt, T1.status  FROM loan AS T1  JOIN disp AS T2 ON T1.account_id = T2.account_id  WHERE T2.client_id = 992;	financial
SELECT T2.amount, T3.gender FROM trans AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T1.trans_id = 851;	financial
SELECT T2.type FROM disp AS T1 INNER JOIN card AS T2 ON T1.card_id = T2.card_id WHERE T1.client_id = 9 AND T2.type LIKE '%credit%'	financial
SELECT SUM(amount) AS total_payment FROM trans WHERE account_id IN (SELECT account_id FROM disp WHERE client_id = 617) AND date LIKE '1998%'	financial
SELECT T1.client_id FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T1.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND T3.A2 LIKE '%East Bohemia%'	financial
SELECT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN loan l ON a.account_id = l.account_id WHERE c.gender = 'F' ORDER BY l.amount DESC LIMIT 3;	financial
SELECT COUNT(DISTINCT d.client_id) AS male_customers FROM disp d JOIN account a ON d.account_id = a.account_id JOIN trans t ON a.account_id = t.account_id JOIN client c ON d.client_id = c.client_id WHERE c.gender = 'M' AND c.birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND t.type = 'PRIJEM' AND t.k_symbol = 'SIPO' AND t.amount > 4000;	financial
SELECT COUNT(*) FROM account  JOIN disp ON account.account_id = disp.account_id  JOIN client ON disp.client_id = client.client_id  JOIN district ON client.district_id = district.district_id  WHERE district.A3 = 'Beroun' AND account.date > '1996-12-31';	financial
SELECT COUNT(*) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN card AS T3 ON T2.disp_id = T3.disp_id WHERE T1.gender = 'F' AND T3.type = 'junior'	financial
SELECT CAST(SUM(CASE WHEN T1.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM client AS T1 INNER JOIN account AS T2 ON T1.client_id = T2.client_id INNER JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T3.A3 LIKE '%Prague%'	financial
SELECT CAST(SUM(CASE WHEN T2.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM disp AS T1 INNER JOIN client AS T2 ON T1.client_id = T2.client_id WHERE T1.type = 'OWNER' AND T1.account_id IN ( SELECT account_id FROM account WHERE frequency = 'POPLATEK TYDNE' )	financial
SELECT COUNT(*) FROM account WHERE frequency = 'POPLATEK TYDNE' AND disp.type = 'OWNER';	financial
SELECT a.account_id, a.date, l.amount FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 24 AND a.date < '1997-01-01' ORDER BY l.amount ASC LIMIT 1;	financial
SELECT T1.account_id FROM disp AS T1 INNER JOIN client AS T2 ON T1.client_id = T2.client_id WHERE T2.gender = 'F' GROUP BY T1.account_id ORDER BY AVG(T2.A11) ASC LIMIT 1	financial
SELECT COUNT(client_id)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE STRFTIME('%Y', birth_date) = '1920' AND A3 LIKE '%east Bohemia%'	financial
SELECT COUNT(*) FROM account WHERE frequency = 'POPLATEK TYDNE' AND duration = 24;	financial
SELECT AVG(loan.amount) AS avg_loan_amount FROM loan JOIN account ON loan.account_id = account.account_id WHERE loan.status IN ('C', 'D') GROUP BY account.account_id ORDER BY AVG(loan.amount) DESC;	financial
SELECT client_id, district_id FROM client WHERE client_id IN (     SELECT client_id FROM disp WHERE account_id IN (         SELECT account_id FROM trans WHERE type = 'PRIJEM' AND k_symbol = 'PERM'     ) OR account_id IN (         SELECT account_id FROM loan     ) ) ORDER BY client_id;	financial
SELECT c.client_id, julianday('now') - julianday(c.birth_date) AS age FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card ca ON d.disp_id = ca.disp_id WHERE ca.type = 'gold' AND d.type = 'OWNER';	financial
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY COUNT(bond_type) DESC LIMIT 1;	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-') AND element = 'cl';	toxicology
SELECT AVG(CASE WHEN T1.element = 'o' THEN 1 ELSE 0 END) AS avg_oxygen_atoms FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-';	toxicology
SELECT AVG(CASE WHEN T1.bond_type = '-' THEN 1 ELSE 0 END) AS avg_single_bonds FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+';	toxicology
SELECT COUNT(*) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'na' AND T2.label = '-';	toxicology
SELECT m.label FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '#';	toxicology
SELECT CAST(SUM(CASE WHEN T1.element = 'c' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) AS percentage FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id JOIN connected AS T3 ON T1.atom_id = T3.atom_id JOIN bond AS T4 ON T3.bond_id = T4.bond_id WHERE T4.bond_type = '=';	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '#';	toxicology
SELECT COUNT(*) FROM atom WHERE element != 'br';	toxicology
SELECT COUNT(molecule_id) AS carcinogenic_molecules FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR099' AND label = '+';	toxicology
SELECT DISTINCT molecule_id FROM atom WHERE element = 'c';	toxicology
SELECT DISTINCT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR004_8_9';	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '=' GROUP BY T1.element ORDER BY COUNT(T1.element) DESC LIMIT 1	toxicology
SELECT T2.label FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'h' GROUP BY T2.label ORDER BY COUNT(T2.label) DESC LIMIT 1	toxicology
SELECT T2.bond_type FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'cl' GROUP BY T2.bond_type ORDER BY COUNT(*) DESC LIMIT 1	toxicology
SELECT DISTINCT a1.element AS atom1, a2.element AS atom2 FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN atom a2 ON a2.atom_id = c.atom_id2 WHERE b.bond_type = '-';	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN connected AS T3 ON T1.atom_id = T3.atom_id WHERE T2.label = '-'	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '-' GROUP BY T1.element ORDER BY COUNT(T1.element) ASC LIMIT 1	toxicology
SELECT T1.bond_type FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE (T2.atom_id = 'TR004_8' AND T2.atom_id2 = 'TR004_20') OR (T2.atom_id = 'TR004_20' AND T2.atom_id2 = 'TR004_8')	toxicology
SELECT label FROM molecule WHERE molecule_id NOT IN ( SELECT molecule_id FROM atom WHERE element = 'sn' )	toxicology
SELECT COUNT(DISTINCT atom_id) AS num_atoms FROM atom JOIN connected ON atom.atom_id = connected.atom_id JOIN bond ON connected.bond_id = bond.bond_id WHERE (atom.element = 'i' OR atom.element = 's') AND bond.bond_type = '-';	toxicology
SELECT T1.atom_id, T1.element  FROM atom AS T1  JOIN connected AS T2 ON T1.atom_id = T2.atom_id  JOIN bond AS T3 ON T2.bond_id = T3.bond_id  WHERE T3.bond_type = '#';	toxicology
SELECT DISTINCT atom_id FROM connected WHERE atom_id IN (     SELECT atom_id     FROM molecule     WHERE molecule_id = 'TR181' ) ORDER BY atom_id;	toxicology
SELECT CAST(COUNT(DISTINCT CASE WHEN T1.element = 'f' THEN T1.atom_id END) AS REAL) * 100 / COUNT(DISTINCT T1.atom_id) AS percentage FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+';	toxicology
SELECT CAST(COUNT(CASE WHEN T2.bond_type = '#' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T2.bond_id) AS percent FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'	toxicology
SELECT T.element FROM atom AS T WHERE T.molecule_id = 'TR000' ORDER BY T.element ASC LIMIT 3	toxicology
SELECT atom_id FROM connected WHERE bond_id = 'TR001_2_6';	toxicology
SELECT SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN label = '-' THEN 1 ELSE 0 END) AS difference FROM molecule	toxicology
SELECT atom_id FROM connected WHERE bond_id = 'TR000_2_5'	toxicology
SELECT bond_id FROM connected WHERE atom_id2 = 'TR000_2'	toxicology
SELECT T1.label FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = ' = ' ORDER BY T1.label LIMIT 5;	toxicology
SELECT CAST(SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) AS percent FROM bond WHERE molecule_id = 'TR008';	toxicology
SELECT CAST(SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(molecule_id) AS "percentage" FROM molecule	toxicology
SELECT CAST(SUM(CASE WHEN element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS percent FROM atom WHERE molecule_id = 'TR206';	toxicology
SELECT DISTINCT T2.bond_type FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR000'	toxicology
SELECT T1.element, T3.label FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id WHERE T1.molecule_id = 'TR060';	toxicology
SELECT bond_type, COUNT(*) AS count FROM bond WHERE molecule_id = 'TR010' GROUP BY bond_type ORDER BY count DESC LIMIT 1;	toxicology
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-' ORDER BY T1.label ASC LIMIT 3;	toxicology
SELECT bond_type FROM bond WHERE molecule_id = 'TR006' ORDER BY bond_type LIMIT 2;	toxicology
SELECT COUNT(*) FROM connected WHERE (atom_id = 'TR009_12' OR atom_id2 = 'TR009_12') AND molecule_id = 'TR009';	toxicology
SELECT COUNT(DISTINCT m.molecule_id) AS carcinogenic_molecules_with_bromine FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' AND a.element = 'br';	toxicology
SELECT T2.bond_type, T1.atom_id, T1.atom_id2 FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T1.bond_id = 'TR001_6_9';	toxicology
SELECT m.label, CASE WHEN m.label = '+' THEN 'Carcinogenic' ELSE 'Not Carcinogenic' END AS carcinogenicity FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.atom_id = 'TR001_10';	toxicology
SELECT COUNT(molecule_id) FROM bond WHERE bond_type = '#';	toxicology
SELECT COUNT(bond_id) FROM connected WHERE atom_id = 'TR000_19' OR atom_id2 = 'TR000_19';	toxicology
SELECT DISTINCT element FROM atom WHERE molecule_id = 'TR004';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '-';	toxicology
SELECT DISTINCT m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE SUBSTR(a.atom_id, 7, 2) BETWEEN '21' AND '25' AND m.label = '+';	toxicology
SELECT bond.bond_id, bond.bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN atom AS atom1 ON connected.atom_id = atom1.atom_id JOIN atom AS atom2 ON connected.atom_id2 = atom2.atom_id WHERE (atom1.element = 'p' AND atom2.element = 'n') OR (atom1.element = 'n' AND atom2.element = 'p') ORDER BY bond.bond_id;	toxicology
SELECT m.molecule_id, m.label, COUNT(b.bond_id) AS double_bonds_count FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = ' = ' GROUP BY m.molecule_id, m.label ORDER BY double_bonds_count DESC, m.label ASC LIMIT 1;	toxicology
SELECT AVG(COUNT(T2.bond_id)) FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'i'	toxicology
SELECT T2.bond_type, T2.bond_id FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T1.atom_id = 'TR000_4' OR T1.atom_id2 = 'TR000_4';	toxicology
SELECT element FROM atom WHERE atom_id NOT IN (SELECT atom_id FROM connected);	toxicology
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.molecule_id = 'TR041' AND T3.bond_type = '#';	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR144_8_19';	toxicology
SELECT m.label, COUNT(b.bond_id) AS double_bond_count FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.label = '+' AND b.bond_type = '=' GROUP BY m.molecule_id ORDER BY double_bond_count DESC LIMIT 1;	toxicology
SELECT element FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+') GROUP BY element ORDER BY COUNT(element) ASC LIMIT 1;	toxicology
SELECT DISTINCT T1.atom_id FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T2.element = 'pb';	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '#';	toxicology
SELECT CAST(COUNT(DISTINCT T2.bond_id) AS REAL) * 100 / ( SELECT COUNT(T1.element) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id ) AS percentage FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id GROUP BY T1.element, T2.bond_id ORDER BY COUNT(T1.element) DESC LIMIT 1;	toxicology
SELECT CAST(SUM(CASE WHEN T1.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_id) FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-'	toxicology
SELECT COUNT(*) FROM atom WHERE element IN ('c', 'h');	toxicology
SELECT T1.atom_id2 FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T2.element = 's'	toxicology
SELECT T1.bond_type FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id INNER JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T3.element = 'sn'	toxicology
SELECT COUNT(DISTINCT T1.element) AS element_count FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-';	toxicology
SELECT COUNT(DISTINCT T1.atom_id) AS total_atoms FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE (T1.element = 'p' OR T1.element = 'br') AND T3.bond_type = '#';	toxicology
SELECT T1.bond_id FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '-' AND m.label != '-';	toxicology
SELECT CAST(COUNT(CASE WHEN T1.element = 'cl' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.atom_id) AS percent FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-'	toxicology
SELECT label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002');	toxicology
SELECT molecule_id FROM molecule WHERE label = '-';	toxicology
SELECT COUNT(*) AS total_carcinogenic_molecules FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR030' AND label = '+';	toxicology
SELECT bond_type FROM bond WHERE molecule_id BETWEEN 'TR000' AND 'TR050';	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_10_11'	toxicology
SELECT COUNT(T2.bond_id) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 'i'	toxicology
SELECT MAX(T1.label) AS carcinogenicity FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'ca';	toxicology
SELECT EXISTS (     SELECT 1     FROM atom a1     JOIN connected c ON a1.atom_id = c.atom_id     WHERE c.bond_id = 'TR001_1_8' AND a1.element = 'cl' ) AS has_chlorine, EXISTS (     SELECT 1     FROM atom a2     JOIN connected c ON a2.atom_id = c.atom_id     WHERE c.bond_id = 'TR001_1_8' AND a2.element = 'c' ) AS has_carbon;	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN bond b ON m.molecule_id = b.molecule_id WHERE a.element = 'c' AND b.bond_type = '#' AND m.label = '-';	toxicology
SELECT CAST(COUNT(CASE WHEN T1.element = 'cl' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.molecule_id) AS percentage FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'	toxicology
SELECT DISTINCT T1.element FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.molecule_id = 'TR001'	toxicology
SELECT molecule_id FROM bond WHERE bond_type = '=';	toxicology
SELECT T1.atom_id, T2.atom_id2 FROM connected AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T1.bond_type = '#' AND T2.bond_type = '#';	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR000_1_2'	toxicology
SELECT COUNT(molecule_id) AS non_carcinogenic_single_bond_molecules FROM molecule JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE bond.bond_type = '-' AND molecule.label = '-';	toxicology
SELECT molecule.label FROM molecule JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE bond.bond_id = 'TR001_10_11';	toxicology
SELECT b.bond_id, m.label FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '#' AND m.label = '+';	toxicology
SELECT DISTINCT m.label, a.element FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE SUBSTR(a.atom_id, 7, 1) = '4' AND m.label = '+';	toxicology
SELECT CAST(SUM(CASE WHEN element = 'h' THEN 1 ELSE 0 END) AS REAL) / COUNT(element), label FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule_id = 'TR006'	toxicology
SELECT m.label, COUNT(a.atom_id) AS atom_count FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'ca' GROUP BY m.label;	toxicology
SELECT DISTINCT T2.bond_type FROM atom AS T1 JOIN connected AS T3 ON T1.atom_id = T3.atom_id JOIN bond AS T2 ON T3.bond_id = T2.bond_id WHERE T1.element = 'c';	toxicology
SELECT DISTINCT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_10_11';	toxicology
SELECT CAST(SUM(CASE WHEN bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) AS percentage FROM bond;	toxicology
SELECT CAST(COUNT(CASE WHEN T1.bond_type = '=' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.bond_id) AS percent FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.molecule_id = 'TR047';	toxicology
SELECT T1.label FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.atom_id = 'TR001_1'	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR151';	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = 'TR151';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+';	toxicology
SELECT atom_id FROM atom WHERE molecule_id BETWEEN 'TR010' AND 'TR050' AND element = 'c';	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+')	toxicology
SELECT T1.bond_id FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' AND T1.bond_type = '=';	toxicology
SELECT COUNT(a.atom_id) AS atom_count FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'h' AND m.label = '+';	toxicology
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_id = 'TR000_1_2' AND EXISTS (SELECT 1 FROM connected AS T3 WHERE T3.atom_id = 'TR000_1' AND T3.bond_id = T2.bond_id)	toxicology
SELECT DISTINCT atom_id FROM atom WHERE element = 'c' AND molecule_id NOT IN (     SELECT molecule_id     FROM molecule     WHERE label = '-' );	toxicology
SELECT CAST(SUM(CASE WHEN T1.label = '+' AND T2.element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) AS percentage FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id;	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR124';	toxicology
SELECT atom.element FROM atom WHERE atom.molecule_id = 'TR186';	toxicology
SELECT bond_type FROM bond WHERE bond_id = 'TR007_4_19';	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_2_4';	toxicology
SELECT COUNT(bond_id) AS double_bonds, molecule.label FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule_id = 'TR006' AND bond_type = '=';	toxicology
SELECT m.label, a.element FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' AND a.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca') GROUP BY m.label, a.element;	toxicology
SELECT b.bond_id, a1.element AS atom1, a2.element AS atom2 FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE b.bond_type = '-';	toxicology
SELECT m.label, a.element FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN bond b ON m.molecule_id = b.molecule_id JOIN connected c ON a.atom_id = c.atom_id AND b.bond_id = c.bond_id WHERE b.bond_type = '#' OR a.element IN ('cl', 'c', 'h') GROUP BY m.label, a.element HAVING COUNT(DISTINCT b.bond_type) > 1;	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR000_2_3';	toxicology
SELECT COUNT(*) FROM atom WHERE element = 'cl';	toxicology
SELECT T1.atom_id, COUNT(DISTINCT T2.bond_type) AS bond_count FROM atom AS T1 JOIN connected AS T3 ON T1.atom_id = T3.atom_id JOIN bond AS T2 ON T3.bond_id = T2.bond_id WHERE T1.molecule_id = 'TR346' GROUP BY T1.atom_id;	toxicology
SELECT COUNT(molecule_id) AS double_bond_molecules, SUM(CASE WHEN T2.label = '+' THEN 1 ELSE 0 END) AS carcinogenic_count FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '=';	toxicology
SELECT COUNT(*)  FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id LEFT JOIN bond b ON m.molecule_id = b.molecule_id AND (b.bond_type = '-' OR b.bond_type IS NULL) WHERE a.element != 's' AND (b.bond_type != '=' OR b.bond_type IS NULL);	toxicology
SELECT T1.label FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_id = 'TR001_2_4';	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR001';	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '-';	toxicology
SELECT DISTINCT m.molecule_id, m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'cl' AND m.label = '+';	toxicology
SELECT DISTINCT m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'c' AND m.label != '-';	toxicology
SELECT CAST(COUNT(CASE WHEN T1.label = '+' AND T2.element = 'cl' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.molecule_id) AS percentage FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id;	toxicology
SELECT molecule_id FROM bond WHERE bond_id = 'TR001_1_7';	toxicology
SELECT COUNT(DISTINCT atom.element) AS num_elements FROM atom JOIN connected ON atom.atom_id = connected.atom_id OR atom.atom_id = connected.atom_id2 WHERE connected.bond_id = 'TR001_3_4';	toxicology
SELECT T1.bond_type FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE (T2.atom_id = 'TR000_1' AND T2.atom_id2 = 'TR000_2') OR (T2.atom_id = 'TR000_2' AND T2.atom_id2 = 'TR000_1')	toxicology
SELECT T1.label FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.atom_id IN ('TR000_2', 'TR000_4') GROUP BY T1.label;	toxicology
SELECT element FROM atom WHERE atom_id = 'TR000_1'	toxicology
SELECT CASE WHEN label = '+' THEN 'Carcinogenic' ELSE 'Non-Carcinogenic' END AS carcinogenicity FROM molecule WHERE molecule_id = 'TR000';	toxicology
SELECT CAST(SUM(CASE WHEN bond_type = '-' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) AS percentage FROM bond	toxicology
SELECT COUNT(DISTINCT m.molecule_id) AS carcinogenic_molecules_with_nitrogen FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'n' AND m.label = '+';	toxicology
SELECT m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 's' AND b.bond_type = '=';	toxicology
SELECT T1.label FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id GROUP BY T1.molecule_id HAVING COUNT(T2.atom_id) > 5 AND T1.label = '-'	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '=' AND a.molecule_id = 'TR024';	toxicology
SELECT m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id GROUP BY m.label ORDER BY COUNT(a.atom_id) DESC LIMIT 1;	toxicology
SELECT CAST(COUNT(CASE WHEN T1.label = '+' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.molecule_id) AS percentage FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id JOIN connected AS T3 ON T2.atom_id = T3.atom_id JOIN bond AS T4 ON T3.bond_id = T4.bond_id WHERE T2.element = 'h' AND T4.bond_type = '#';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+';	toxicology
SELECT COUNT(*)  FROM molecule m  JOIN bond b ON m.molecule_id = b.molecule_id  WHERE m.molecule_id BETWEEN 'TR004' AND 'TR010'  AND b.bond_type = '-';	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR008' AND element = 'c';	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR004_7' AND T2.label = '-';	toxicology
SELECT COUNT(DISTINCT molecule_id) AS total_molecules_with_double_bonded_oxygen FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'o' AND b.bond_type = '=';	toxicology
SELECT COUNT(*)  FROM molecule m  JOIN bond b ON m.molecule_id = b.molecule_id  WHERE b.bond_type = '#' AND m.label = '-';	toxicology
SELECT T1.element, T2.bond_type FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR002';	toxicology
SELECT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.molecule_id = 'TR012' AND a.element = 'c' AND b.bond_type = '=';	toxicology
SELECT T1.atom_id FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'o' AND T2.label = '+'	toxicology
SELECT name FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT name FROM cards WHERE borderColor = 'borderless' AND cardKingdomFoilId IS NULL AND cardKingdomId IS NULL ORDER BY edhrecRank DESC LIMIT 5	card_games
SELECT name FROM cards ORDER BY faceConvertedManaCost DESC LIMIT 1;	card_games
SELECT name FROM cards WHERE edhrecRank < 100 AND frameVersion = 2015;	card_games
SELECT T1.name  FROM cards AS T1  JOIN legalities AS T2 ON T1.uuid = T2.uuid  WHERE T1.rarity = 'mythic' AND T2.format = 'gladiator' AND T2.status = 'Banned';	card_games
SELECT c.name, l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.types = 'Artifact' AND c.side IS NULL AND l.format = 'vintage';	card_games
SELECT cards.id, cards.artist  FROM cards  JOIN legalities ON cards.uuid = legalities.uuid  WHERE (cards.power = '*' OR cards.power IS NULL)  AND legalities.format = 'commander'  AND legalities.status = 'Legal';	card_games
SELECT c.id, c.text, r.text, c.hasContentWarning FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Stephen Daniel';	card_games
SELECT T1.text FROM rulings AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Sublime Epiphany' AND T2.number = '74s';	card_games
SELECT c.name, c.artist, c.isPromo  FROM cards c  JOIN rulings r ON c.uuid = r.uuid  GROUP BY c.id  ORDER BY COUNT(r.uuid) DESC  LIMIT 1;	card_games
SELECT T2.language FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Annul' AND T1.number = '29';	card_games
SELECT T1.name FROM foreign_data AS T1 JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.language = 'Japanese';	card_games
SELECT CAST(SUM(CASE WHEN T1.language = 'Chinese Simplified' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) AS percentage FROM foreign_data AS T1;	card_games
SELECT s.name, s.totalSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian';	card_games
SELECT COUNT(DISTINCT type) FROM cards WHERE artist = 'Aaron Boyd';	card_games
SELECT keywords FROM cards WHERE name = 'Angel of Mercy';	card_games
SELECT COUNT(*) FROM cards WHERE power = '*';	card_games
SELECT T1.promoTypes FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Duress'	card_games
SELECT borderColor FROM cards WHERE name = 'Ancestor''s Chosen';	card_games
SELECT originalType FROM cards WHERE name = 'Ancestor''s Chosen';	card_games
SELECT DISTINCT T1.language FROM foreign_data AS T1 JOIN cards AS T2 ON T1.uuid = T2.uuid JOIN sets AS T3 ON T2.setCode = T3.code WHERE T2.name = 'Angel of Mercy';	card_games
SELECT COUNT(*) FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.status = 'restricted' AND T1.isTextless = 0;	card_games
SELECT T.text FROM rulings AS T WHERE T.uuid = (SELECT uuid FROM cards WHERE name = 'Condemn')	card_games
SELECT COUNT(*) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.status = 'restricted' AND T1.isStarter = 1;	card_games
SELECT T2.status FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Cloudchaser Eagle';	card_games
SELECT T1.type FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Benalish Knight';	card_games
SELECT T1.format FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Benalish Knight';	card_games
SELECT T1.artist FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Phyrexian';	card_games
SELECT CAST(SUM(CASE WHEN borderColor = 'borderless' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards	card_games
SELECT COUNT(*)  FROM foreign_data AS T1  JOIN cards AS T2 ON T1.uuid = T2.uuid  WHERE T1.language = 'German' AND T2.isReprint = 1;	card_games
SELECT COUNT(*)  FROM cards  JOIN foreign_data ON cards.uuid = foreign_data.uuid  WHERE cards.borderColor = 'borderless' AND foreign_data.language = 'Russian';	card_games
SELECT CAST(SUM(CASE WHEN T2.language = 'French' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.isStorySpotlight = 1;	card_games
SELECT COUNT(*) FROM cards WHERE toughness = '99';	card_games
SELECT name FROM cards WHERE artist = 'Aaron Boyd';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND availability = 'mtgo';	card_games
SELECT id FROM cards WHERE convertedManaCost = 0;	card_games
SELECT DISTINCT layout FROM cards WHERE keywords LIKE '%Flying%'	card_games
SELECT COUNT(*) FROM cards WHERE originalType = 'Summon - Angel' AND subtypes IS NOT NULL AND subtypes != 'Angel';	card_games
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT id FROM cards WHERE duelDeck = 'a';	card_games
SELECT edhrecRank FROM cards WHERE frameVersion = '2015';	card_games
SELECT T1.artist FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Chinese Simplified';	card_games
SELECT T1.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.availability LIKE '%paper%' AND T2.language = 'Japanese'	card_games
SELECT COUNT(*) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.status = 'Banned' AND T1.borderColor = 'white';	card_games
SELECT T1.uuid, T2.language FROM legalities AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.format = 'legacy'	card_games
SELECT T2.text FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Beacon of Immortality';	card_games
SELECT COUNT(DISTINCT T1.uuid), T2.status FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.frameVersion = 'future' AND T2.status = 'legal';	card_games
SELECT T1.name, T1.colors FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.code = 'OGW';	card_games
SELECT T1.name, T2.language FROM foreign_data AS T1 INNER JOIN set_translations AS T2 ON T2.setCode = T1.setcode WHERE T1.multiverseid IN ( SELECT multiverseid FROM cards WHERE setcode = '10E' AND convertedmanacost = 5 ) ORDER BY T2.language;	card_games
SELECT c.name, r.date FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.originalType = 'Creature - Elf';	card_games
SELECT T1.colors, T2.format FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.id BETWEEN 1 AND 20	card_games
SELECT T1.name, T2.language FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.originalType = 'Artifact' AND T1.colors = 'B' AND T2.language IS NOT NULL;	card_games
SELECT c.name, r.date  FROM cards c  JOIN rulings r ON c.uuid = r.uuid  WHERE c.rarity = 'uncommon'  ORDER BY r.date ASC  LIMIT 3;	card_games
SELECT COUNT(*)  FROM cards  WHERE artist = 'John Avon' AND cardKingdomFoilId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'UDON' AND availability = 'mtgo' AND hand = '-1';	card_games
SELECT COUNT(*)  FROM cards  WHERE frameVersion = '1993' AND availability = 'paper' AND hasContentWarning = 1;	card_games
SELECT manaCost FROM cards WHERE layout = 'normal' AND frameVersion = 2003 AND borderColor = 'black' AND availability = 'mtgo,paper';	card_games
SELECT SUM(REPLACE(manaCost, '[', '') AS converted_mana_cost FROM cards WHERE artist = 'Rob Alexander';	card_games
SELECT DISTINCT subtype, supertype FROM cards WHERE availability = 'arena';	card_games
SELECT DISTINCT T1.setCode FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Spanish';	card_games
SELECT CAST(SUM(CASE WHEN isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards WHERE frameEffects = 'legendary';	card_games
SELECT CAST(COUNT(CASE WHEN isStorySpotlight = 1 AND isTextless = 0 THEN id ELSE NULL END) AS REAL) * 100 / COUNT(id) FROM cards	card_games
SELECT CAST(COUNT(CASE WHEN T1.language = 'Spanish' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.id), T2.name FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid GROUP BY T2.name ORDER BY T1.language = 'Spanish' DESC LIMIT 10	card_games
SELECT T2.language FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.baseSetSize = 309;	card_games
SELECT COUNT(*) FROM sets AS s JOIN set_translations AS st ON s.code = st.setCode WHERE s.block = 'Commander' AND st.language = 'Portuguese (Brazil)';	card_games
SELECT id FROM cards WHERE type = 'Creature' AND uuid IN ( SELECT uuid FROM legalities WHERE status = 'Legal' )	card_games
SELECT T1.subtypes, T1.supertypes FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'German' AND T1.subtypes IS NOT NULL AND T1.supertypes IS NOT NULL GROUP BY T1.subtypes, T1.supertypes ORDER BY COUNT(*) DESC LIMIT 10	card_games
SELECT COUNT(*) FROM cards WHERE power IS NULL OR power = '*' AND text LIKE '%triggered ability%';	card_games
SELECT COUNT(*)  FROM cards  JOIN legalities ON cards.uuid = legalities.uuid  JOIN rulings ON cards.uuid = rulings.uuid  WHERE legalities.format = 'premodern'  AND rulings.text = 'This is a triggered mana ability.'  AND cards.side IS NULL;	card_games
SELECT id FROM cards WHERE artist = 'Erica Yang' AND availability LIKE '%paper%' AND uuid IN ( SELECT uuid FROM legalities WHERE format = 'pauper' ) LIMIT 1	card_games
SELECT artist FROM cards WHERE uuid = ( SELECT uuid FROM foreign_data WHERE text LIKE '%perfekte Gegenmittel%' )	card_games
SELECT T1.name  FROM foreign_data AS T1  JOIN cards AS T2 ON T1.uuid = T2.uuid  WHERE T1.language = 'French' AND T2.type = 'Creature' AND T2.layout = 'normal' AND T2.borderColor = 'black' AND T2.artist = 'Matthew D. Wilson';	card_games
SELECT COUNT(*)  FROM cards  JOIN rulings ON cards.uuid = rulings.uuid  WHERE cards.rarity = 'rare' AND rulings.date = '2007-02-01';	card_games
SELECT T1.language  FROM set_translations AS T1  JOIN sets AS T2 ON T1.setCode = T2.code  WHERE T2.block = 'Ravnica' AND T2.baseSetSize = 180;	card_games
SELECT CAST(SUM(CASE WHEN T1.hasContentWarning = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.format = 'commander' AND T2.status = 'legal'	card_games
SELECT CAST(SUM(CASE WHEN T2.language = 'French' AND (T1.power IS NULL OR T1.power = '*') THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T1.power IS NULL OR T1.power = '*' THEN 1 ELSE 0 END) AS percentage FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid;	card_games
SELECT CAST(SUM(IIF(T1.language = 'Japanese', 1, 0)) AS REAL) * 100 / COUNT(*) FROM foreign_data AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T2.translation LIKE '%expansion%'	card_games
SELECT availability FROM cards WHERE artist = 'Daren Bader';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'borderless' AND edhrecRank > 12000;	card_games
SELECT COUNT(*) FROM cards WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1;	card_games
SELECT name FROM cards WHERE power IS NULL OR power = '*' AND promoTypes = 'arenaleague' ORDER BY name ASC LIMIT 3;	card_games
SELECT T2.language FROM foreign_data AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T1.multiverseid = 149934;	card_games
SELECT cardKingdomFoilId, cardKingdomId FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL ORDER BY cardKingdomFoilId ASC LIMIT 3;	card_games
SELECT CAST(SUM(CASE WHEN isTextless = 1 AND layout = 'normal' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards	card_games
SELECT number FROM cards WHERE uuid IN (SELECT uuid FROM cards WHERE subtypes LIKE '%Angel%' AND subtypes LIKE '%Wizard%') AND otherFaceIds IS NULL;	card_games
SELECT name, translation FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE mtgoCode IS NULL OR mtgoCode = '' ORDER BY name ASC LIMIT 3;	card_games
SELECT T1.language  FROM set_translations AS T1  JOIN sets AS T2 ON T1.setCode = T2.code  WHERE T2.mcmName = 'Archenemy' AND T1.setCode = 'ARC';	card_games
SELECT sets.name, set_translations.translation FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.id = 5;	card_games
SELECT T1.language, T2.type FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.id = 206;	card_games
SELECT s.id, s.code  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE st.language = 'Italian' AND s.block = 'Shadowmoor'  ORDER BY s.name ASC  LIMIT 2;	card_games
SELECT s.id, s.name FROM sets s JOIN foreign_data fd ON s.code = fd.set_code WHERE s.isForeignOnly = 1 AND s.isFoilOnly = 1 AND fd.language = 'Japanese';	card_games
SELECT T1.name FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Russian' ORDER BY T1.baseSetSize DESC LIMIT 1	card_games
SELECT CAST(SUM(CASE WHEN T1.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM sets AS T1 INNER JOIN foreign_data AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Chinese Simplified';	card_games
SELECT COUNT(*) FROM sets WHERE code IN (     SELECT setCode FROM foreign_data WHERE language = 'Japanese' ) AND mtgoCode IS NULL OR mtgoCode = '';	card_games
SELECT id FROM cards WHERE borderColor = 'black';	card_games
SELECT id FROM cards WHERE frameEffects = 'extendedart';	card_games
SELECT name FROM cards WHERE borderColor = 'black' AND isFullArt = 1;	card_games
SELECT T2.language FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.id = 174;	card_games
SELECT T1.name FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'English' AND T2.translation = 'All Sets';	card_games
SELECT T2.language FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'A Pedra Fellwar'	card_games
SELECT code FROM sets WHERE releaseDate = '2007-07-13';	card_games
SELECT baseSetSize, code FROM sets WHERE block = 'Masques' AND name LIKE '%Mirage%';	card_games
SELECT setCode FROM sets WHERE type = 'expansion';	card_games
SELECT T1.name, T1.type FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.watermark = 'Boros';	card_games
SELECT T1.language, T1.flavorText, T2.type FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.watermark = 'colorpie';	card_games
SELECT CAST(SUM(CASE WHEN T1.convertedManaCost = 10 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Abyssal Horror'	card_games
SELECT DISTINCT setCode FROM sets WHERE type = 'expansion';	card_games
SELECT T2.name, T2.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'Abzan' LIMIT 1;	card_games
SELECT T1.language, T2.type FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.watermark = 'Azorius' LIMIT 1	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE availability LIKE '%paper%' AND hand = '3';	card_games
SELECT name FROM cards WHERE isTextless = 0;	card_games
SELECT convertedManaCost FROM cards WHERE name = 'Ancestor`s Chosen';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND (power = '*' OR power IS NULL);	card_games
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL;	card_games
SELECT subtypes, supertypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer'	card_games
SELECT DISTINCT purchaseUrls FROM cards WHERE promoTypes LIKE '%bundle%'	card_games
SELECT COUNT(DISTINCT artist)  FROM cards  WHERE borderColor = 'black' AND availability LIKE '%arena,mtgo%'	card_games
SELECT name, convertedManaCost FROM cards WHERE name IN ('Serra Angel', 'Shrine Keeper') ORDER BY convertedManaCost DESC LIMIT 1;	card_games
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer';	card_games
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3;	card_games
SELECT T3.translation FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid JOIN set_translations AS T3 ON T1.setCode = T3.setCode WHERE T2.name = 'Ancestor''s Chosen' AND T2.language = 'Italian';	card_games
SELECT COUNT(*) FROM foreign_data WHERE uuid IN (SELECT uuid FROM cards WHERE name = 'Angel of Mercy')	card_games
SELECT T2.name FROM sets AS T1 JOIN foreign_data AS T2 ON T1.code = T2.setCode WHERE T1.type = 'core' AND T2.translation = 'Hauptset Zehnte Edition';	card_games
SELECT T1.language FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Ancestor''s Chosen' AND T1.language = 'Korean';	card_games
SELECT COUNT(*)  FROM cards  JOIN set_translations ON cards.setCode = set_translations.setCode  WHERE set_translations.translation = 'Hauptset Zehnte Edition' AND cards.artist = 'Adam Rex';	card_games
SELECT T1.baseSetSize FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Hauptset Zehnte Edition';	card_games
SELECT T2.translation FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Eighth Edition' AND T2.language = 'Chinese Simplified';	card_games
SELECT s.name AS set_name FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Angel of Mercy' AND s.mtgoCode IS NOT NULL;	card_games
SELECT T1.releaseDate FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T2.name = 'Ancestor''s Chosen'	card_games
SELECT T1.type FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Hauptset Zehnte Edition';	card_games
SELECT COUNT(*) FROM set_translations WHERE block = 'Ice Age' AND language = 'Italian' AND translation IS NOT NULL;	card_games
SELECT T1.name FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T2.name = 'Adarkar Valkyrie' AND T1.isForeignOnly = 1;	card_games
SELECT COUNT(DISTINCT s.code) FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian' AND s.baseSetSize < 100;	card_games
SELECT COUNT(*) FROM cards AS T1  JOIN sets AS T2 ON T1.setCode = T2.code  WHERE T2.name = 'Coldsnap' AND T1.borderColor = 'black';	card_games
SELECT T1.name FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' ORDER BY T1.convertedManaCost DESC LIMIT 1;	card_games
SELECT DISTINCT artist FROM cards WHERE setCode = 'Coldsnap' AND artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy');	card_games
SELECT T1.number FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' AND T1.number = 4;	card_games
SELECT COUNT(*)  FROM cards  JOIN sets ON cards.setCode = sets.code  WHERE sets.name = 'Coldsnap' AND cards.convertedManaCost > 5 AND (cards.power = '*' OR cards.power IS NULL);	card_games
SELECT T1.flavorText FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.language = 'Italian' AND T2.name = 'Ancestor''s Chosen'	card_games
SELECT T2.language FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Ancestor''s Chosen' AND T2.flavorText IS NOT NULL	card_games
SELECT T2.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Ancestor''s Chosen' AND T2.language = 'German'	card_games
SELECT T1.text FROM rulings AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid INNER JOIN sets AS T3 ON T2.setCode = T3.code WHERE T3.name = 'Coldsnap' AND T1.language = 'Italian';	card_games
SELECT T2.name FROM sets AS T1 INNER JOIN foreign_data AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Coldsnap' AND T2.language = 'Italian' ORDER BY T2.text DESC LIMIT 1;	card_games
SELECT T1.date FROM rulings AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Reminisce';	card_games
SELECT CAST(SUM(CASE WHEN T1.convertedManaCost = 7 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap'	card_games
SELECT CAST(SUM(CASE WHEN cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards WHERE setCode = 'Coldsnap';	card_games
SELECT code FROM sets WHERE releaseDate = '2017-07-14';	card_games
SELECT keyruneCode FROM sets WHERE code = 'PKHC';	card_games
SELECT mcmId FROM sets WHERE code = 'SS2';	card_games
SELECT T.mcmName FROM sets AS T WHERE T.releaseDate = '2017-06-09'	card_games
SELECT type FROM sets WHERE name LIKE '%From the Vault: Lore%';	card_games
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized';	card_games
SELECT c.name, r.text, CASE WHEN c.hasContentWarning = 1 THEN 'Yes' ELSE 'No' END AS has_missing_or_degraded_properties FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Jim Pavelec';	card_games
SELECT T2.releaseDate FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Evacuation'	card_games
SELECT T1.baseSetSize FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Rinascita di Alara';	card_games
SELECT T2.type FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.translation = 'Huitième édition';	card_games
SELECT T1.translation FROM set_translations AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.language = 'French' AND T2.name LIKE '%Tendo Ice Bridge%'	card_games
SELECT COUNT(*) FROM set_translations WHERE setCode IN (SELECT code FROM sets WHERE name = 'Tenth Edition') AND translation IS NOT NULL;	card_games
SELECT T1.translation FROM set_translations AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.language = 'Japanese' AND T2.name = 'Fellwar Stone';	card_games
SELECT T1.name  FROM cards AS T1  JOIN sets AS T2 ON T1.setCode = T2.code  WHERE T2.name = 'Journey into Nyx Hero''s Path'  ORDER BY T1.convertedManaCost DESC  LIMIT 1;	card_games
SELECT T1.releaseDate FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Ola de frío';	card_games
SELECT T1.type FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T2.name = 'Samite Pilgrim'	card_games
SELECT COUNT(*) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'World Championship Decks 2004' AND T1.convertedManaCost = 3;	card_games
SELECT T2.translation FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Mirrodin' AND T2.language = 'Chinese Simplified';	card_games
SELECT CAST(SUM(CASE WHEN T1.isNonFoilOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Japanese';	card_games
SELECT CAST(SUM(CASE WHEN T1.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T2.language = 'Portuguese (Brazil)';	card_games
SELECT DISTINCT availability  FROM cards  WHERE isTextless = 1 AND artist != 'Aleksi Briclot';	card_games
SELECT id FROM sets ORDER BY baseSetSize DESC LIMIT 1	card_games
SELECT artist, MAX(convertedManaCost) FROM cards WHERE side IS NULL;	card_games
SELECT frameEffects FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL GROUP BY frameEffects ORDER BY COUNT(*) DESC LIMIT 1	card_games
SELECT COUNT(*) FROM cards WHERE power IS NULL OR power = '*' AND hasFoil = 0 AND duelDeck = 'a';	card_games
SELECT T1.id FROM sets AS T1 JOIN legalities AS T2 ON T1.code = T2.set_code WHERE T2.format = 'commander' ORDER BY T1.totalSetSize DESC LIMIT 1;	card_games
SELECT T1.name, T1.manaCost FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.format = 'duel' ORDER BY T1.convertedManaCost DESC LIMIT 10;	card_games
SELECT cards.originalReleaseDate, GROUP_CONCAT(DISTINCT legalities.format) AS legal_formats FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.rarity = 'mythic' ORDER BY cards.originalReleaseDate ASC LIMIT 1;	card_games
SELECT COUNT(*)  FROM cards AS T1  JOIN foreign_data AS T2 ON T1.uuid = T2.uuid  WHERE T1.artist = 'Volkan Baǵa' AND T2.language = 'French';	card_games
SELECT COUNT(*) FROM cards AS T1  JOIN legalities AS T2 ON T1.uuid = T2.uuid  WHERE T1.rarity = 'rare' AND T1.types = 'Enchantment' AND T1.name = 'Abundance' AND T2.status = 'Legal';	card_games
SELECT T1.format, T2.name  FROM legalities AS T1  JOIN cards AS T2 ON T1.uuid = T2.uuid  WHERE T1.status = 'Banned'  GROUP BY T1.format, T2.name  ORDER BY COUNT(T1.status) DESC  LIMIT 1;	card_games
SELECT T2.language FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Battlebond';	card_games
SELECT artist, GROUP_CONCAT(DISTINCT format) AS formats FROM cards JOIN legalities ON cards.uuid = legalities.uuid GROUP BY artist ORDER BY COUNT(*) ASC LIMIT 1;	card_games
SELECT T1.status  FROM legalities AS T1  JOIN cards AS T2 ON T1.uuid = T2.uuid  WHERE T2.frameVersion = '1997' AND T2.artist = 'D. Alexander Gregory' AND T2.hasContentWarning = 1 AND T1.format = 'legacy';	card_games
SELECT T1.name, T2.format FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.edhrecRank = 1 AND T2.status = 'Banned'	card_games
SELECT AVG(T1.id), T2.language  FROM sets AS T1  JOIN foreign_data AS T2 ON T1.code = T2.set_code  WHERE T1.release_date BETWEEN '2012-01-01' AND '2015-12-31'  GROUP BY T2.language  ORDER BY COUNT(T2.language) DESC  LIMIT 1;	card_games
SELECT DISTINCT artist  FROM cards  WHERE BorderColor = 'black' AND availability LIKE '%arena%';	card_games
SELECT uuid FROM legalities WHERE format = 'oldschool' AND status IN ('banned', 'restricted');	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability LIKE '%paper%';	card_games
SELECT T1.text FROM rulings AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.artist = 'Kev Walker' ORDER BY T1.date DESC;	card_games
SELECT DISTINCT c.name, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN sets s ON c.setCode = s.code WHERE s.name = 'Hour of Devastation' AND l.status = 'Legal';	card_games
SELECT DISTINCT s.name FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language LIKE '%Korean%' AND NOT EXISTS (     SELECT 1     FROM set_translations stj     WHERE stj.setCode = s.code       AND stj.language LIKE '%Japanese%' );	card_games
SELECT DISTINCT T1.frameVersion, T3.name FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid JOIN foreign_data AS T3 ON T1.uuid = T3.uuid WHERE T1.artist = 'Allen Williams' AND T2.status = 'Banned';	card_games
SELECT DisplayName, Reputation FROM users WHERE DisplayName IN ('Harlan', 'Jarrod Dixon') ORDER BY Reputation DESC LIMIT 1;	codebase_community
SELECT DisplayName FROM users WHERE STRFTIME('%Y', CreationDate) = '2011';	codebase_community
SELECT COUNT(*) FROM users WHERE LastAccessDate > '2014-09-01';	codebase_community
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM users WHERE Upvotes > 100 AND Downvotes > 1;	codebase_community
SELECT COUNT(*) FROM users WHERE CreationDate > '2013-12-31' AND Views > 10;	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = 'csgillespie';	codebase_community
SELECT Title FROM posts WHERE OwnerDisplayName = 'csgillespie';	codebase_community
SELECT OwnerDisplayName FROM posts WHERE Title = 'Eliciting priors from experts'	codebase_community
SELECT Title FROM posts WHERE OwnerDisplayName = 'csgillespie' ORDER BY ViewCount DESC LIMIT 1;	codebase_community
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId ORDER BY p.FavoriteCount DESC LIMIT 1;	codebase_community
SELECT SUM(T2.CommentCount) AS TotalComments FROM users AS T1 JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName = 'csgillespie';	codebase_community
SELECT AnswerCount FROM posts WHERE OwnerDisplayName = 'csgillespie' ORDER BY AnswerCount DESC LIMIT 1;	codebase_community
SELECT LastEditorDisplayName FROM posts WHERE Title = 'Examples for teaching: Correlation does not mean causation';	codebase_community
SELECT COUNT(*) AS RootPostsCount FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'csgillespie' AND posts.ParentId IS NULL;	codebase_community
SELECT DISTINCT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ClosedDate IS NOT NULL;	codebase_community
SELECT COUNT(*) FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE users.Age > 65 AND posts.Score >= 20;	codebase_community
SELECT u.Location FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Eliciting priors from experts';	codebase_community
SELECT Body FROM posts WHERE Id = (SELECT ExcerptPostId FROM tags WHERE TagName = 'bayesian')	codebase_community
SELECT p.Body  FROM posts p  JOIN tags t ON p.Id = t.ExcerptPostId  WHERE t.Count = (SELECT MAX(Count) FROM tags)	codebase_community
SELECT COUNT(b.Id) AS BadgeCount FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT Name FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')	codebase_community
SELECT COUNT(*)  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE users.DisplayName = 'csgillespie' AND STRFTIME('%Y', badges.Date) = '2011';	codebase_community
SELECT u.DisplayName FROM users u JOIN (     SELECT UserId, COUNT(Id) AS BadgeCount     FROM badges     GROUP BY UserId ) b ON u.Id = b.UserId ORDER BY b.BadgeCount DESC LIMIT 1;	codebase_community
SELECT AVG(posts.Score) AS AverageScore FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'csgillespie';	codebase_community
SELECT AVG(COUNT(b.Id)) AS AverageBadges FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Views > 200;	codebase_community
SELECT CAST(SUM(CASE WHEN u.Age > 65 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(p.Id) AS Percentage FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Score > 5;	codebase_community
SELECT COUNT(*) FROM votes WHERE UserId = 58 AND CreationDate LIKE '2010-07-19%';	codebase_community
SELECT CreationDate FROM votes GROUP BY CreationDate ORDER BY COUNT(Id) DESC LIMIT 1	codebase_community
SELECT COUNT(Id) FROM badges WHERE Name = 'Revival';	codebase_community
SELECT p.Title FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.Score = (SELECT MAX(Score) FROM comments)	codebase_community
SELECT COUNT(c.Id) AS CommentCount FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.ViewCount = 1910;	codebase_community
SELECT FavoriteCount FROM posts WHERE Id IN (SELECT PostId FROM comments WHERE UserId = 3025 AND CreationDate = '2014-04-23 20:29:39.0')	codebase_community
SELECT c.Text FROM comments AS c JOIN posts AS p ON c.PostId = p.Id WHERE p.ParentId = 107829 AND c.CommentCount = 1;	codebase_community
SELECT p.ClosedDate IS NULL AS IsWellFinished FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.UserId = 23853 AND c.CreationDate = '2013-07-12 09:08:18.0';	codebase_community
SELECT u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Id = 65041;	codebase_community
SELECT COUNT(*) AS PostCount FROM users JOIN posts ON users.Id = posts.OwnerUserId WHERE users.DisplayName = 'Tiago Pasqualini';	codebase_community
SELECT u.DisplayName FROM users u JOIN votes v ON u.Id = v.UserId WHERE v.Id = 6347;	codebase_community
SELECT COUNT(*) FROM posts AS p JOIN votes AS v ON p.Id = v.PostId WHERE p.Title LIKE '%data visualization%'	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'DatEpicCoderGuyWhoPrograms';	codebase_community
SELECT CAST(COUNT(posts.Id) AS REAL) / COUNT(votes.Id) AS PostToVoteRatio FROM posts JOIN votes ON posts.OwnerUserId = votes.UserId AND posts.Id = votes.PostId WHERE posts.OwnerUserId = 24;	codebase_community
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer';	codebase_community
SELECT Text FROM comments WHERE Score = 17;	codebase_community
SELECT DisplayName FROM users WHERE WebsiteUrl = 'http://stackoverflow.com';	codebase_community
SELECT badges.Name FROM badges JOIN users ON badges.UserId = users.Id WHERE users.DisplayName = 'SilentGhost';	codebase_community
SELECT UserDisplayName FROM comments WHERE Text LIKE '%thank you user93%'	codebase_community
SELECT Text FROM comments WHERE UserDisplayName = 'A Lion';	codebase_community
SELECT u.DisplayName, u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Title = 'Understanding what Dassault iSight is doing?';	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'How does gentle boosting differ from AdaBoost?';	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Necromancer' LIMIT 10;	codebase_community
SELECT LastEditorDisplayName FROM posts WHERE Title = 'Open source tools for visualizing multi-dimensional data';	codebase_community
SELECT Title FROM posts WHERE LastEditorDisplayName = 'Vebjorn Ljosa';	codebase_community
SELECT SUM(posts.Score), users.WebsiteUrl FROM posts JOIN users ON posts.LastEditorUserId = users.Id WHERE users.DisplayName = 'Yevgeny';	codebase_community
SELECT c.Text FROM comments c JOIN postHistory ph ON c.PostId = ph.PostId JOIN posts p ON ph.PostId = p.Id WHERE p.Title = 'Why square the difference instead of taking the absolute value in standard deviation?' ORDER BY c.CreationDate DESC;	codebase_community
SELECT SUM(T1.BountyAmount) AS TotalBountyAmount FROM votes AS T1 JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T2.Title LIKE '%data%';	codebase_community
SELECT u.DisplayName FROM users u JOIN votes v ON u.Id = v.UserId JOIN posts p ON v.PostId = p.Id WHERE v.BountyAmount = 50 AND p.Title LIKE '%variance%'	codebase_community
SELECT p.Title, c.Text, AVG(p.ViewCount) AS AverageViewCount FROM posts p JOIN postTags pt ON p.Id = pt.PostId JOIN tags t ON pt.TagId = t.Id JOIN comments c ON p.Id = c.PostId WHERE t.TagName LIKE '%<humor>%' GROUP BY p.Id, p.Title, c.Text;	codebase_community
SELECT COUNT(*) FROM comments WHERE UserId = 13;	codebase_community
SELECT Id FROM users ORDER BY Reputation DESC LIMIT 1;	codebase_community
SELECT UserId FROM posts ORDER BY ViewCount ASC LIMIT 1;	codebase_community
SELECT COUNT(UserId) AS NumberOfUsers FROM badges WHERE Name = 'Supporter' AND STRFTIME('%Y', Date) = '2011';	codebase_community
SELECT COUNT(UserId) FROM badges GROUP BY UserId HAVING COUNT(Name) > 5;	codebase_community
SELECT COUNT(DISTINCT u.Id) AS UserCount FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'New York, NY' AND b.Name IN ('Teacher', 'Supporter');	codebase_community
SELECT u.DisplayName, u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Id = 1;	codebase_community
SELECT uh.UserId FROM postHistory uh JOIN posts p ON uh.PostId = p.Id GROUP BY uh.UserId HAVING COUNT(uh.PostId) = 1 AND SUM(p.Views) >= 1000;	codebase_community
SELECT u.DisplayName, b.Name FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Id IN (     SELECT c.UserId     FROM comments c     GROUP BY c.UserId     ORDER BY COUNT(c.Id) DESC     LIMIT 1 ) ORDER BY b.Date DESC;	codebase_community
SELECT COUNT(DISTINCT u.Id) AS UserCount FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'India' AND b.Name = 'Teacher';	codebase_community
SELECT      ((CAST(SUM(CASE WHEN STRFTIME('%Y', Date) = '2010' THEN 1 ELSE 0 END) AS REAL) / COUNT(*)) * 100 -      (CAST(SUM(CASE WHEN STRFTIME('%Y', Date) = '2011' THEN 1 ELSE 0 END) AS REAL) / COUNT(*)) * 100) AS PercentageDifference FROM      badges WHERE      Name = 'Student';	codebase_community
SELECT PostHistoryTypeId, COUNT(DISTINCT UserId) AS UniqueUsers FROM postHistory WHERE PostId = 3720;	codebase_community
SELECT p.Id, p.Title, p.ViewCount FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.RelatedPostId = 61217;	codebase_community
SELECT Score, LinkTypeId FROM postLinks WHERE PostId = 395;	codebase_community
SELECT PostId, UserId FROM posts WHERE Score > 60;	codebase_community
SELECT SUM(FavoriteCount) AS TotalFavouriteCount FROM posts WHERE OwnerUserId = 686 AND CreationDate LIKE '2011%'	codebase_community
SELECT AVG(u.UpVotes) AS AverageUpVotes, AVG(u.Age) AS AverageAge FROM users u JOIN posts p ON u.Id = p.OwnerUserId GROUP BY u.Id HAVING COUNT(p.Id) > 10;	codebase_community
SELECT COUNT(UserId) AS NumberOfUsersWithAnnouncerBadge FROM badges WHERE Name = 'Announcer';	codebase_community
SELECT Name FROM badges WHERE Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT COUNT(*) FROM comments WHERE Score > 60;	codebase_community
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:16:14.0';	codebase_community
SELECT COUNT(Id) FROM comments WHERE Score = 10;	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MAX(Reputation) FROM users)	codebase_community
SELECT u.Reputation FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT T1.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'Pierre'	codebase_community
SELECT DISTINCT T1.Date FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.Location = 'Rochester, NY' ORDER BY T1.Date;	codebase_community
SELECT CAST(SUM(CASE WHEN Name = 'Teacher' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(Id) AS PercentageOfTeachers FROM badges;	codebase_community
SELECT CAST(SUM(CASE WHEN u.Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(b.UserId) AS PercentageOfTeenagers FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Organizer';	codebase_community
SELECT Score FROM comments WHERE PostId IN (SELECT Id FROM posts WHERE CreationDate = '2010-07-19 19:19:56.0')	codebase_community
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:37:33.0';	codebase_community
SELECT u.Age FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'Vienna, Austria';	codebase_community
SELECT COUNT(b.UserId) AS NumberOfAdultSupporters FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age BETWEEN 19 AND 65;	codebase_community
SELECT SUM(users.Views) FROM users JOIN badges ON users.Id = badges.UserId WHERE badges.Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MIN(Reputation) FROM users) ORDER BY b.Date DESC;	codebase_community
SELECT Name FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Sharpie')	codebase_community
SELECT COUNT(b.UserId) AS NumberOfEldersWithSupporterBadge FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age > 65;	codebase_community
SELECT DisplayName FROM users WHERE Id = 30;	codebase_community
SELECT COUNT(*) FROM users WHERE Location = 'New York, NY';	codebase_community
SELECT COUNT(*) FROM votes WHERE STRFTIME('%Y', CreationDate) = '2010';	codebase_community
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1;	codebase_community
SELECT CAST(SUM(CASE WHEN STRFTIME('%Y', CreationDate) = '2010' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN STRFTIME('%Y', CreationDate) = '2011' THEN 1 ELSE 0 END) AS vote_ratio FROM votes;	codebase_community
SELECT DISTINCT t.TagName FROM tags t JOIN postTags pt ON t.Id = pt.TagId JOIN posts p ON pt.PostId = p.Id WHERE p.OwnerDisplayName = 'John Salvatier';	codebase_community
SELECT COUNT(*)  FROM users  JOIN posts ON users.Id = posts.OwnerUserId  WHERE users.DisplayName = 'Daniel Vassallo';	codebase_community
SELECT COUNT(*) AS VoteCount FROM votes v JOIN users u ON v.UserId = u.Id WHERE u.DisplayName = 'Harlan';	codebase_community
SELECT Id FROM posts WHERE OwnerDisplayName = 'slashnick' ORDER BY AnswerCount DESC LIMIT 1;	codebase_community
SELECT p.Title, p.ViewCount FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName IN ('Harvey Motulsky', 'Noah Snyder') ORDER BY p.ViewCount DESC LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT p.Id) AS PostCount FROM posts p JOIN users u ON p.OwnerUserId = u.Id JOIN votes v ON p.Id = v.PostId WHERE u.DisplayName = 'Matt Parker' AND v.VoteTypeId = 2;	codebase_community
SELECT COUNT(*) AS NegativeCommentsCount FROM comments JOIN users ON comments.UserId = users.Id WHERE users.DisplayName = 'Neil McGuigan' AND comments.Score < 60;	codebase_community
SELECT DISTINCT t.TagName FROM tags t JOIN postTags pt ON t.Id = pt.TagId JOIN posts p ON pt.PostId = p.Id JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Mark Meckes' AND p.CommentCount = 0;	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Organizer';	codebase_community
SELECT CAST(SUM(CASE WHEN T2.TagName = 'r' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.Id) FROM posts AS T1 INNER JOIN posthistory AS T2 ON T1.Id = T2.PostId INNER JOIN users AS T3 ON T3.Id = T1.OwnerUserId WHERE T3.DisplayName = 'Community'	codebase_community
SELECT      (SUM(CASE WHEN u.DisplayName = 'Mornington' THEN p.ViewCount ELSE 0 END) -      SUM(CASE WHEN u.DisplayName = 'Amos' THEN p.ViewCount ELSE 0 END)) AS ViewCountDifference FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id;	codebase_community
SELECT COUNT(DISTINCT UserId) AS UserCount FROM badges WHERE Name = 'Commentator' AND STRFTIME('%Y', Date) = '2014';	codebase_community
SELECT COUNT(*) FROM posts WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59';	codebase_community
SELECT DisplayName, Age FROM users ORDER BY Views DESC LIMIT 1;	codebase_community
SELECT LastEditDate, LastEditorUserId  FROM posts  WHERE Title = 'Detecting a given face in a database of facial images';	codebase_community
SELECT COUNT(*) FROM comments WHERE UserId = 13 AND Score < 60;	codebase_community
SELECT p.Title, c.UserDisplayName FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.Score > 60;	codebase_community
SELECT badges.Name  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE STRFTIME('%Y', badges.Date) = '2011' AND users.Location = 'North Pole';	codebase_community
SELECT OwnerDisplayName, WebsiteUrl FROM posts WHERE FavoriteCount > 150;	codebase_community
SELECT COUNT(*) AS PostHistoryCount, MAX(CreationDate) AS LastEditDate FROM posts p JOIN postHistory ph ON p.Id = ph.PostId WHERE p.Title = 'What is the best introductory Bayesian statistics textbook?';	codebase_community
SELECT u.LastAccessDate, u.Location FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Outliers' ORDER BY u.LastAccessDate DESC;	codebase_community
SELECT p.Title FROM posts p JOIN postlinks pl ON p.Id = pl.PostId WHERE pl.RelatedPostId = (     SELECT Id     FROM posts     WHERE Title = 'How to tell if something happened in a data set which monitors a value over time' ) LIMIT 1;	codebase_community
SELECT p.Id, b.Name FROM posts p JOIN badges b ON p.OwnerUserId = b.UserId WHERE p.OwnerDisplayName = 'Samuel' AND STRFTIME('%Y', p.CreaionDate) = '2013';	codebase_community
SELECT OwnerDisplayName FROM posts ORDER BY ViewCount DESC LIMIT 1;	codebase_community
SELECT u.DisplayName, u.Location FROM users u JOIN tags t ON u.Id = t.OwnerUserId WHERE t.TagName = 'hypothesis-testing';	codebase_community
SELECT T1.Title, T2.LinkTypeId FROM posts AS T1 INNER JOIN postlinks AS T2 ON T1.Id = T2.PostId WHERE T1.Title = 'What are principal component scores?'	codebase_community
SELECT T1.ParentId, T1.OwnerDisplayName FROM posts AS T1 WHERE T1.Score = (SELECT MAX(Score) FROM posts) AND T1.ParentId IS NOT NULL;	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM users u JOIN votes v ON u.Id = v.UserId WHERE v.VoteTypeId = 8 ORDER BY v.BountyAmount DESC LIMIT 1;	codebase_community
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5;	codebase_community
SELECT COUNT(*) FROM tags WHERE Count BETWEEN 5000 AND 7000;	codebase_community
SELECT OwnerUserId FROM posts ORDER BY FavoriteCount DESC LIMIT 1;	codebase_community
SELECT Age FROM users ORDER BY Reputation DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM votes WHERE YEAR(CreationDate) = 2011 AND BountyAmount = 50;	codebase_community
SELECT Id FROM users ORDER BY Age ASC LIMIT 1;	codebase_community
SELECT SUM(Score) FROM posts WHERE LasActivityDate LIKE '2010-07-19%'	codebase_community
SELECT AVG(CASE WHEN STRFTIME('%Y', CreationDate) = '2010' AND AnswerCount <= 2 THEN 1 ELSE 0 END) AS avg_links_per_month FROM postLinks;	codebase_community
SELECT PostId FROM votes WHERE UserId = 1465 ORDER BY FavoriteCount DESC LIMIT 1;	codebase_community
SELECT T1.Title FROM posts AS T1 INNER JOIN postLinks AS T2 ON T1.Id = T2.PostId ORDER BY T2.CreationDate ASC LIMIT 1	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId GROUP BY u.Id ORDER BY COUNT(b.Name) DESC LIMIT 1;	codebase_community
SELECT MIN(T2.CreationDate) AS First_Vote_Date FROM users AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'chl'	codebase_community
SELECT MIN(CreationDate) AS FirstPostDate FROM posts JOIN users ON posts.OwnerUserId = users.Id ORDER BY Age ASC LIMIT 1;	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Autobiographer' ORDER BY b.Date ASC LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT u.Id) AS UserCount FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE u.Location = 'United Kingdom' AND p.FavoriteCount >= 4;	codebase_community
SELECT AVG(T2.PostId) AS AveragePostsVoted FROM users AS T1 JOIN votes AS T2 ON T1.Id = T2.UserId ORDER BY T1.Age DESC LIMIT 1;	codebase_community
SELECT DisplayName FROM users ORDER BY Reputation DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM users WHERE Reputation > 2000 AND Views > 1000;	codebase_community
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT COUNT(*) AS PostCount FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'Jay Stevens' AND STRFTIME('%Y', posts.CreaionDate) = '2010';	codebase_community
SELECT Id, Title FROM posts WHERE OwnerDisplayName = 'Harvey Motulsky' ORDER BY ViewCount DESC LIMIT 1;	codebase_community
SELECT Id, Title FROM posts ORDER BY Score DESC LIMIT 1;	codebase_community
SELECT AVG(T1.Score) AS AverageScore FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'Stephen Turner';	codebase_community
SELECT DISTINCT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ViewCount > 20000 AND STRFTIME('%Y', p.CreaionDate) = '2011';	codebase_community
SELECT Id, OwnerDisplayName FROM posts WHERE CreationDate LIKE '2010%' ORDER BY FavoriteCount DESC LIMIT 1;	codebase_community
SELECT CAST(SUM(CASE WHEN T1.Reputation > 1000 AND STRFTIME('%Y', T2.CreationDate) = '2011' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.Id) AS Percentage FROM users AS T1 JOIN posts AS T2 ON T1.Id = T2.OwnerUserId;	codebase_community
SELECT CAST(SUM(CASE WHEN Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(Id) FROM users	codebase_community
SELECT SUM(ViewCount) AS TotalViews, LastEditorDisplayName FROM posts WHERE Body LIKE '%Computer Game Datasets%' ORDER BY LastEditDate DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > ( SELECT AVG(ViewCount) FROM posts );	codebase_community
SELECT COUNT(*) AS CommentCount FROM comments WHERE PostId = (     SELECT Id     FROM posts     ORDER BY Score DESC     LIMIT 1 );	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > 35000 AND CommentCount = 0;	codebase_community
SELECT u.DisplayName, u.Location FROM users u JOIN posts p ON u.Id = p.LastEditorUserId WHERE p.Id = 183 ORDER BY p.LastEditDate DESC LIMIT 1;	codebase_community
SELECT Name FROM badges WHERE UserId = (     SELECT Id FROM users WHERE DisplayName = 'Emmett' ) ORDER BY Date DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000;	codebase_community
SELECT julianday(b.Date) - julianday(u.CreationDate) AS DaysToBadge FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Zolomon';	codebase_community
SELECT COUNT(DISTINCT p.Id) AS PostCount, COUNT(DISTINCT c.Id) AS CommentCount FROM users u LEFT JOIN posts p ON u.Id = p.OwnerUserId LEFT JOIN comments c ON u.Id = c.UserId WHERE u.CreationDate = (SELECT MAX(CreationDate) FROM users);	codebase_community
SELECT Text, UserDisplayName  FROM comments  JOIN posts ON comments.PostId = posts.Id  WHERE Title = 'Analysing wind data with R'  ORDER BY CreationDate DESC  LIMIT 10;	codebase_community
SELECT COUNT(UserId) FROM badges WHERE Name = 'Citizen Patrol';	codebase_community
SELECT COUNT(*) FROM tags WHERE TagName = 'careers';	codebase_community
SELECT Reputation, ViewCount FROM users WHERE DisplayName = 'Jarrod Dixon';	codebase_community
SELECT COUNT(c.Id) AS CommentCount, COUNT(p.Id) AS AnswerCount FROM posts p LEFT JOIN comments c ON p.Id = c.PostId AND c.Score > 0 LEFT JOIN postHistory ph ON p.Id = ph.PostId AND ph.PostHistoryTypeId = 2 WHERE p.Title = 'Clustering 1D data';	codebase_community
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat';	codebase_community
SELECT COUNT(*) FROM votes WHERE BountyAmount >= 30;	codebase_community
SELECT CAST(SUM(CASE WHEN p.Score > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(p.Id) AS PercentageAbove50 FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT COUNT(*) FROM posts WHERE Score < 20;	codebase_community
SELECT COUNT(*) FROM tags WHERE Id < 15 AND Count <= 20;	codebase_community
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample';	codebase_community
SELECT u.Reputation, u.UpVotes FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'fine, you win :)';	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title LIKE '%linear regression%';	codebase_community
SELECT TOP 1 c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ViewCount BETWEEN 100 AND 150 ORDER BY c.Score DESC;	codebase_community
SELECT c.CreationDate, u.Age FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Text LIKE '%http://%';	codebase_community
SELECT COUNT(DISTINCT PostId)  FROM comments  WHERE Score = 0 AND PostId IN (     SELECT Id      FROM posts      WHERE ViewCount < 5 )	codebase_community
SELECT COUNT(*) FROM posts WHERE CommentCount = 1 AND Id IN (SELECT PostId FROM comments WHERE Score = 0);	codebase_community
SELECT COUNT(DISTINCT u.Id) AS TotalUsers FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Score = 0 AND u.Age = 40;	codebase_community
SELECT p.Id AS PostId, c.Text AS CommentText FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Title = 'Group differences on a five point Likert item';	codebase_community
SELECT u.UpVotes FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text LIKE '%R is also lazy evaluated.%';	codebase_community
SELECT Text FROM comments WHERE UserDisplayName = 'Harvey Motulsky';	codebase_community
SELECT DISTINCT UserDisplayName  FROM comments  WHERE Score BETWEEN 1 AND 5  AND UserId NOT IN (     SELECT Id      FROM users      WHERE DownVotes > 0 );	codebase_community
SELECT CAST(SUM(CASE WHEN u.UpVotes = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(u.Id) AS Percentage FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score BETWEEN 5 AND 10;	codebase_community
SELECT sp.power_name FROM superpower AS sp JOIN hero_power AS hp ON sp.id = hp.power_id JOIN superhero AS sh ON hp.hero_id = sh.id WHERE sh.superhero_name = '3-D Man';	superhero
SELECT COUNT(*)  FROM superhero AS T1  INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id  INNER JOIN superpower AS T3 ON T2.power_id = T3.id  WHERE T3.power_name = 'Super Strength';	superhero
SELECT COUNT(*) FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE sp.power_name = 'Super Strength' AND s.height_cm > 200;	superhero
SELECT s.full_name  FROM superhero s  JOIN hero_power hp ON s.id = hp.hero_id  GROUP BY s.id  HAVING COUNT(hp.power_id) > 15;	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Blue';	superhero
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.skin_colour_id = T2.id WHERE T1.superhero_name = 'Apocalypse';	superhero
SELECT COUNT(*)  FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN power AS p ON hp.power_id = p.id JOIN colour AS c ON s.eye_colour_id = c.id WHERE c.colour = 'Blue' AND p.power_name = 'Agility';	superhero
SELECT s.superhero_name FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.colour = 'Blue' AND s.hair_colour_id IN (     SELECT id FROM colour WHERE colour = 'Blond' )	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics';	superhero
SELECT s.superhero_name, s.height_cm FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics' ORDER BY s.height_cm DESC;	superhero
SELECT T2.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name = 'Sauron'	superhero
SELECT c.colour, COUNT(s.id) AS count FROM superhero s JOIN colour c ON s.eye_colour_id = c.id JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics' GROUP BY c.colour ORDER BY count DESC;	superhero
SELECT AVG(superhero.height_cm) AS average_height FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower p ON hp.power_id = p.id JOIN publisher pu ON s.publisher_id = pu.id WHERE pu.publisher_name = 'Marvel Comics' AND p.power_name = 'Super Strength';	superhero
SELECT COUNT(*) FROM superhero AS s JOIN publisher AS p ON s.publisher_id = p.id WHERE p.publisher_name = 'DC Comics';	superhero
SELECT p.publisher_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN publisher p ON s.publisher_id = p.id WHERE a.attribute_name = 'Speed' ORDER BY ha.attribute_value ASC LIMIT 1;	superhero
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE colour.colour = 'Gold' AND publisher.publisher_name = 'Marvel Comics';	superhero
SELECT T2.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name = 'Blue Beetle II'	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.hair_colour_id = T2.id WHERE T2.colour = 'Blond';	superhero
SELECT s.superhero_name, ha.attribute_value FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Intelligence' ORDER BY ha.attribute_value ASC LIMIT 1;	superhero
SELECT T1.race FROM race AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T2.superhero_name = 'Copycat'	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Durability' AND ha.attribute_value < 50;	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower p ON hp.power_id = p.id WHERE p.power_name = 'Death Touch';	superhero
SELECT COUNT(*)  FROM superhero  JOIN hero_attribute ON superhero.id = hero_attribute.hero_id  JOIN attribute ON hero_attribute.attribute_id = attribute.id  JOIN gender ON superhero.gender_id = gender.id  WHERE gender.gender = 'Female' AND attribute_name = 'Strength' AND attribute_value = 100;	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id GROUP BY s.id ORDER BY COUNT(hp.power_id) DESC LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Vampire';	superhero
SELECT      CAST(SUM(CASE WHEN T1.alignment = 'Bad' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) AS percentage_bad_alignment,     SUM(CASE WHEN T1.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') AND T1.alignment = 'Bad' THEN 1 ELSE 0 END) AS bad_alignment_marvel FROM      alignment AS T1 JOIN      superhero AS T2 ON T1.id = T2.alignment_id;	superhero
SELECT      SUM(CASE WHEN T2.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) -      SUM(CASE WHEN T2.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) AS difference FROM      superhero AS T1 JOIN      publisher AS T2 ON T1.publisher_id = T2.id;	superhero
SELECT id FROM publisher WHERE publisher_name = 'Star Trek';	superhero
SELECT AVG(attribute_value) AS average_attribute_value FROM hero_attribute;	superhero
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL;	superhero
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.id = 75	superhero
SELECT T1.power_name FROM superpower AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.power_id INNER JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.superhero_name = 'Deathlok'	superhero
SELECT AVG(superhero.weight_kg) AS average_weight FROM superhero JOIN gender ON superhero.gender_id = gender.id WHERE gender.gender = 'Female';	superhero
SELECT sp.power_name FROM superhero sh JOIN hero_power hp ON sh.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id JOIN gender g ON sh.gender_id = g.id WHERE g.gender = 'Male' LIMIT 5;	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Alien'	superhero
SELECT superhero_name  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE height_cm BETWEEN 170 AND 190 AND colour.colour = 'No Colour';	superhero
SELECT T2.power_name FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T1.hero_id = 56;	superhero
SELECT superhero_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Demi-God') LIMIT 5;	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 2;	superhero
SELECT T1.race FROM race AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T2.weight_kg = 169;	superhero
SELECT T3.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.hair_colour_id = T2.id JOIN colour AS T3 ON T1.skin_colour_id = T3.id WHERE T1.height_cm = 185 AND T1.race_id = (SELECT id FROM race WHERE race = 'Human')	superhero
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id ORDER BY T1.weight_kg DESC LIMIT 1	superhero
SELECT CAST(SUM(CASE WHEN T2.publisher_id = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.height_cm BETWEEN 150 AND 180;	superhero
SELECT superhero_name FROM superhero JOIN gender ON superhero.gender_id = gender.id WHERE gender.gender = 'Male' AND weight_kg > (SELECT AVG(weight_kg) * 0.79 FROM superhero);	superhero
SELECT T1.power_name  FROM superpower AS T1  JOIN hero_power AS T2 ON T1.id = T2.power_id  GROUP BY T1.power_name  ORDER BY COUNT(T1.power_name) DESC  LIMIT 1;	superhero
SELECT ha.attribute_value  FROM hero_attribute AS ha  JOIN superhero AS s ON ha.hero_id = s.id  WHERE s.superhero_name = 'Abomination';	superhero
SELECT T2.power_name FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T1.hero_id = 1	superhero
SELECT COUNT(*) FROM superhero AS T1  JOIN hero_power AS T2 ON T1.id = T2.hero_id  JOIN superpower AS T3 ON T2.power_id = T3.id  WHERE T3.power_name = 'Stealth';	superhero
SELECT T1.full_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Strength' ORDER BY T2.attribute_value DESC LIMIT 1	superhero
SELECT CAST(SUM(CASE WHEN skin_colour_id = 1 THEN 1 ELSE 0 END) AS REAL) / COUNT(id) FROM superhero	superhero
SELECT COUNT(*) FROM superhero AS s JOIN publisher AS p ON s.publisher_id = p.id WHERE p.publisher_name = 'Dark Horse Comics';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN publisher p ON s.publisher_id = p.id WHERE a.attribute_name = 'Durability' AND p.publisher_name = 'Dark Horse Comics' ORDER BY ha.attribute_value DESC LIMIT 1;	superhero
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T2.full_name = 'Abraham Sapien'	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower p ON hp.power_id = p.id WHERE p.power_name = 'Flight';	superhero
SELECT c1.colour AS eye_colour, c2.colour AS hair_colour, c3.colour AS skin_colour FROM superhero s JOIN colour c1 ON s.eye_colour_id = c1.id JOIN colour c2 ON s.hair_colour_id = c2.id JOIN colour c3 ON s.skin_colour_id = c3.id JOIN gender g ON s.gender_id = g.id JOIN publisher p ON s.publisher_id = p.id WHERE g.gender = 'Female' AND p.publisher_name = 'Dark Horse Comics';	superhero
SELECT s.superhero_name, p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.hair_colour_id = s.skin_colour_id AND s.hair_colour_id = s.eye_colour_id;	superhero
SELECT T2.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.superhero_name = 'A-Bomb' ORDER BY T2.race DESC LIMIT 1;	superhero
SELECT CAST(COUNT(CASE WHEN T1.skin_colour_id = 5 THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.gender_id) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.skin_colour_id = T2.id INNER JOIN gender AS T3 ON T1.gender_id = T3.id WHERE T3.gender = 'Female';	superhero
SELECT s.superhero_name, r.race  FROM superhero s  JOIN race r ON s.race_id = r.id  WHERE s.full_name = 'Charles Chandler';	superhero
SELECT T2.gender FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T1.superhero_name = 'Agent 13';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower p ON hp.power_id = p.id WHERE p.power_name = 'Adaptation';	superhero
SELECT COUNT(power_id) AS number_of_powers FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id WHERE superhero_name = 'Amazo';	superhero
SELECT T2.power_name  FROM superhero AS T1  INNER JOIN hero_power AS T3 ON T1.id = T3.hero_id  INNER JOIN superpower AS T2 ON T3.power_id = T2.id  WHERE T1.full_name = 'Hunter Zolomon';	superhero
SELECT T1.height_cm FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Amber'	superhero
SELECT s.superhero_name FROM superhero s JOIN colour c ON s.eye_colour_id = c.id AND c.colour = 'Black' JOIN colour h ON s.hair_colour_id = h.id AND h.colour = 'Black';	superhero
SELECT T1.colour  FROM colour AS T1  INNER JOIN superhero AS T2 ON T1.id = T2.skin_colour_id  WHERE T1.colour = 'Gold';	superhero
SELECT T.superhero_name FROM superhero AS T INNER JOIN race AS R ON T.race_id = R.id WHERE R.race = 'Vampire'	superhero
SELECT s.superhero_name  FROM superhero s  JOIN alignment a ON s.alignment_id = a.id  WHERE a.alignment = 'Neutral';	superhero
SELECT COUNT(*) FROM superhero AS s JOIN hero_attribute AS ha ON s.id = ha.hero_id JOIN attribute AS a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Strength' AND ha.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute WHERE attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Strength'));	superhero
SELECT T1.race, T2.alignment FROM race AS T1 INNER JOIN alignment AS T2 ON T1.id = T2.id INNER JOIN superhero AS T3 ON T1.id = T3.race_id AND T2.id = T3.alignment_id WHERE T3.superhero_name = 'Cameron Hicks';	superhero
SELECT CAST(SUM(CASE WHEN T1.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics';	superhero
SELECT AVG(superhero.weight_kg) AS average_weight FROM superhero JOIN race ON superhero.race_id = race.id WHERE race.race = 'Alien';	superhero
SELECT (SELECT weight_kg FROM superhero WHERE full_name = 'Emil Blonsky') - (SELECT weight_kg FROM superhero WHERE full_name = 'Charles Chandler') AS weight_difference;	superhero
SELECT AVG(height_cm) AS average_height FROM superhero;	superhero
SELECT T2.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.superhero_name = 'Abomination';	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T1.race_id = 21 AND T2.gender = 'Male';	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Speed' ORDER BY T2.attribute_value DESC LIMIT 1	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3;	superhero
SELECT a.attribute_name, ha.attribute_value FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = '3-D Man';	superhero
SELECT superhero_name  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE colour.colour = 'Blue' AND superhero.hair_colour_id IN (     SELECT id FROM colour WHERE colour = 'Brown' )	superhero
SELECT T.publisher_name  FROM (     SELECT DISTINCT T2.publisher_name      FROM superhero AS T1      JOIN publisher AS T2 ON T1.publisher_id = T2.id      WHERE T1.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy') ) AS T;	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = 1;	superhero
SELECT CAST(SUM(CASE WHEN T1.eye_colour_id = 7 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS percentage_blue_eyes FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id;	superhero
SELECT CAST(SUM(CASE WHEN T1.gender = 'Male' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T1.gender = 'Female' THEN 1 ELSE 0 END) AS ratio FROM gender AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.gender_id	superhero
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1;	superhero
SELECT id FROM superpower WHERE power_name = 'Cryokinesis'	superhero
SELECT superhero_name FROM superhero WHERE id = 294;	superhero
SELECT full_name FROM superhero WHERE weight_kg IS NULL OR weight_kg = 0;	superhero
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T2.full_name = 'Karen Beecher-Duncan'	superhero
SELECT sp.power_name FROM superhero AS sh JOIN hero_power AS hp ON sh.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE sh.full_name = 'Helen Parr';	superhero
SELECT T1.race FROM race AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T2.weight_kg = 108 AND T2.height_cm = 188;	superhero
SELECT T.publisher_name FROM publisher AS T WHERE T.id = ( SELECT T2.publisher_id FROM superhero AS T2 WHERE T2.id = 38 )	superhero
SELECT T1.race FROM race AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.race_id INNER JOIN hero_attribute AS T3 ON T2.id = T3.hero_id ORDER BY T3.attribute_value DESC LIMIT 1	superhero
SELECT T1.alignment, T3.power_name  FROM alignment AS T1  JOIN superhero AS T2 ON T1.id = T2.alignment_id  JOIN hero_power AS T4 ON T2.id = T4.hero_id  JOIN superpower AS T3 ON T4.power_id = T3.id  WHERE T2.superhero_name = 'Atom IV';	superhero
SELECT superhero_name FROM superhero WHERE eye_colour_id IN (SELECT id FROM colour WHERE colour = 'Blue') LIMIT 5;	superhero
SELECT AVG(hero_attribute.attribute_value) AS average_attribute_value FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE superhero.alignment_id = 3;	superhero
SELECT T1.colour  FROM colour AS T1  JOIN superhero AS T2 ON T1.id = T2.skin_colour_id  JOIN hero_attribute AS T3 ON T2.id = T3.hero_id  WHERE T3.attribute_value = 100;	superhero
SELECT COUNT(*)  FROM superhero  JOIN alignment ON superhero.alignment_id = alignment.id  JOIN gender ON superhero.gender_id = gender.id  WHERE alignment.id = 1 AND gender.id = 2;	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T2.attribute_value BETWEEN 75 AND 80	superhero
SELECT T1.race  FROM race AS T1  JOIN superhero AS T2 ON T1.id = T2.race_id  JOIN colour AS T3 ON T2.hair_colour_id = T3.id  JOIN gender AS T4 ON T2.gender_id = T4.id  WHERE T3.colour = 'blue' AND T4.gender = 'Male';	superhero
SELECT CAST(SUM(CASE WHEN T1.gender_id = 2 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM superhero AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T2.id = 2;	superhero
SELECT      SUM(CASE WHEN T2.eye_colour_id = 7 THEN 1 ELSE 0 END) -      SUM(CASE WHEN T2.eye_colour_id = 1 THEN 1 ELSE 0 END) AS difference FROM      superhero AS T1 LEFT JOIN      colour AS T2 ON T1.eye_colour_id = T2.id WHERE      T1.weight_kg IS NULL OR T1.weight_kg = 0;	superhero
SELECT ha.attribute_value FROM hero_attribute AS ha JOIN superhero AS s ON ha.hero_id = s.id JOIN attribute AS a ON ha.attribute_id = a.id WHERE s.superhero_name = 'Hulk' AND a.attribute_name = 'Strength';	superhero
SELECT sp.power_name FROM superpower AS sp JOIN hero_power AS hp ON sp.id = hp.power_id JOIN superhero AS sh ON hp.hero_id = sh.id WHERE sh.superhero_name = 'Ajax';	superhero
SELECT COUNT(*) FROM superhero JOIN alignment ON superhero.alignment_id = alignment.id JOIN colour ON superhero.skin_colour_id = colour.id WHERE colour.colour = 'Green' AND alignment.alignment = 'Bad';	superhero
SELECT COUNT(*) FROM superhero  JOIN gender ON superhero.gender_id = gender.id  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE gender.gender = 'Female' AND publisher.publisher_name = 'Marvel Comics';	superhero
SELECT s.superhero_name  FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower p ON hp.power_id = p.id WHERE p.power_name = 'Wind Control' ORDER BY s.superhero_name;	superhero
SELECT T1.gender FROM gender AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.gender_id INNER JOIN hero_power AS T3 ON T2.id = T3.hero_id INNER JOIN superpower AS T4 ON T3.power_id = T4.id WHERE T4.power_name = 'Phoenix Force' ORDER BY T2.superhero_name;	superhero
SELECT s.superhero_name, s.weight_kg FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'DC Comics' ORDER BY s.weight_kg DESC LIMIT 1;	superhero
SELECT AVG(superhero.height_cm) AS average_height FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.race != 'Human' AND publisher.publisher_name = 'Dark Horse Comics';	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Speed' AND T2.attribute_value = 100;	superhero
SELECT      SUM(CASE WHEN T2.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) -      SUM(CASE WHEN T2.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS difference FROM      superhero AS T1 JOIN      publisher AS T2 ON T1.publisher_id = T2.id;	superhero
SELECT T1.attribute_name FROM attribute AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.attribute_id INNER JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.superhero_name = 'Black Panther' ORDER BY T2.attribute_value ASC LIMIT 1	superhero
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.superhero_name = 'Abomination';	superhero
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1;	superhero
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler';	superhero
SELECT CAST(SUM(CASE WHEN T1.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id INNER JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T3.publisher_name = 'George Lucas';	superhero
SELECT CAST(SUM(CASE WHEN T1.alignment = 'Good' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM alignment AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.alignment_id INNER JOIN publisher AS T3 ON T2.publisher_id = T3.id WHERE T3.publisher_name = 'Marvel Comics';	superhero
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%'	superhero
SELECT hero_id FROM hero_attribute ORDER BY attribute_value ASC LIMIT 1	superhero
SELECT full_name FROM superhero WHERE superhero_name = 'Alien'	superhero
SELECT s.full_name  FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.weight_kg < 100 AND c.colour = 'Brown';	superhero
SELECT T1.attribute_value FROM hero_attribute AS T1 INNER JOIN superhero AS T2 ON T1.hero_id = T2.id WHERE T2.superhero_name = 'Aquababy'	superhero
SELECT T1.weight_kg, T2.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.id = 40;	superhero
SELECT AVG(height_cm) AS average_height FROM superhero WHERE alignment_id = 3;	superhero
SELECT DISTINCT h.hero_id FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Intelligence';	superhero
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.superhero_name = 'Blackwulf';	superhero
SELECT T3.power_name  FROM superhero AS T1  JOIN hero_power AS T2 ON T1.id = T2.hero_id  JOIN superpower AS T3 ON T2.power_id = T3.id  WHERE T1.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero)	superhero
SELECT T1.driverRef FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 20 AND T2.q1 IS NOT NULL ORDER BY T2.q1 LIMIT 5	formula_1
SELECT T1.surname FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 19 ORDER BY T2.q2 ASC LIMIT 1	formula_1
SELECT DISTINCT YEAR FROM races WHERE circuitId IN (SELECT circuitId FROM circuits WHERE LOCATION = 'Shanghai')	formula_1
SELECT url FROM circuits WHERE name = 'Circuit de Barcelona-Catalunya';	formula_1
SELECT DISTINCT T1.name FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.country = 'Germany' ORDER BY T1.date;	formula_1
SELECT DISTINCT T1.position FROM constructorStandings AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T2.name = 'Renault' ORDER BY T1.position;	formula_1
SELECT COUNT(*) FROM races WHERE YEAR = 2010 AND name LIKE '%Grand Prix%' AND circuitId NOT IN (     SELECT circuitId FROM circuits WHERE country IN ('Asia', 'Europe') )	formula_1
SELECT DISTINCT T1.name FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.country = 'Spain'	formula_1
SELECT T1.lat, T1.lng FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Australian Grand Prix'	formula_1
SELECT T1.url FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = "Sepang International Circuit"	formula_1
SELECT T2.date, T2.time FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Sepang International Circuit' ORDER BY T2.date;	formula_1
SELECT c.lat, c.lng FROM circuits c JOIN races r ON c.circuitid = r.circuitid WHERE r.name = 'Abu Dhabi Grand Prix';	formula_1
SELECT T3.country FROM constructorStandings AS T1 INNER JOIN constructors AS T2 ON T1.constructorid = T2.constructorid INNER JOIN circuits AS T3 ON T1.raceid = T3.circuitid WHERE T1.points = 1 AND T1.raceid = 24	formula_1
SELECT q1 FROM qualifying WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Bruno' AND surname = 'Senna') AND raceId = 354;	formula_1
SELECT T1.nationality FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T2.q2 = '00:01:40' AND T2.raceid = 355;	formula_1
SELECT T1.driverId FROM qualifying AS T1 WHERE T1.q3 = '1:54' AND T1.raceId = 903;	formula_1
SELECT COUNT(*) FROM results JOIN races ON results.raceid = races.raceid WHERE races.year = 2007 AND races.name = 'Bahrain Grand Prix' AND results.statusid != 1;	formula_1
SELECT T2.url FROM races AS T1 INNER JOIN seasons AS T2 ON T1.year = T2.year WHERE T1.raceid = 901;	formula_1
SELECT COUNT(*) FROM results WHERE raceId = (SELECT raceId FROM races WHERE date = '2015-11-29') AND position IS NOT NULL;	formula_1
SELECT d.driverid, d.forename, d.surname, d.dob FROM drivers d JOIN results r ON d.driverid = r.driverid WHERE r.raceid = 592 AND r.statusid = 1 ORDER BY d.dob ASC LIMIT 1;	formula_1
SELECT d.url  FROM drivers d  JOIN laptimes lt ON d.driverid = lt.driverid  WHERE lt.raceid = 161 AND lt.laptime = '1:27';	formula_1
SELECT T1.nationality FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.fastestlapspeed IS NOT NULL ORDER BY T2.fastestlapspeed DESC LIMIT 1;	formula_1
SELECT c.lat, c.lng  FROM circuits c  JOIN races r ON c.circuitid = r.circuitid  WHERE r.name = 'Malaysian Grand Prix';	formula_1
SELECT c.url FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId WHERE cr.raceId = 9 ORDER BY cr.points DESC LIMIT 1;	formula_1
SELECT q1 FROM qualifying WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lucas' AND surname = 'Di Grassi') AND raceId = 345;	formula_1
SELECT T1.nationality FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 347 AND T2.q2 = '00:01:15';	formula_1
SELECT T1.code FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T2.q3 = '01:33'	formula_1
SELECT T1.time FROM results AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T2.forename = 'Bruce' AND T2.surname = 'McLaren' AND T1.raceid = 743	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.position = 2 AND T2.raceid = ( SELECT raceid FROM races WHERE name = 'San Marino Grand Prix' AND YEAR = 2006 )	formula_1
SELECT T2.url FROM races AS T1 JOIN seasons AS T2 ON T1.year = T2.year WHERE T1.raceid = 901;	formula_1
SELECT COUNT(*) FROM results WHERE raceId = (SELECT raceId FROM races WHERE date = '2015-11-29') AND statusId != 1;	formula_1
SELECT MIN(T1.dob) AS youngest_dob FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 872;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN laptimes lt ON d.driverid = lt.driverid AND lt.raceid = 348 ORDER BY lt.time ASC LIMIT 1;	formula_1
SELECT T1.nationality  FROM drivers AS T1  JOIN results AS T2 ON T1.driverid = T2.driverid  ORDER BY T2.fastestlapspeed DESC  LIMIT 1;	formula_1
SELECT      ((SELECT fastestLapSpeed FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Paul' AND surname = 'di Resta') AND raceId = 853) -       (SELECT fastestLapSpeed FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Paul' AND surname = 'di Resta') AND raceId = 854)) /      (SELECT fastestLapSpeed FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Paul' AND surname = 'di Resta') AND raceId = 853) * 100 AS percentage_faster;	formula_1
SELECT CAST(SUM(CASE WHEN T2.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.driverid) AS percentage FROM driverstandings AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.date = '1983-07-16';	formula_1
SELECT MIN(year) AS first_singapore_grand_prix_year FROM races WHERE name = 'Singapore Grand Prix';	formula_1
SELECT COUNT(raceId) AS race_count, name FROM races WHERE YEAR = 2005 ORDER BY date DESC;	formula_1
SELECT name FROM races WHERE date = ( SELECT MIN(date) FROM races );	formula_1
SELECT name, date FROM races WHERE YEAR = 1999 ORDER BY round DESC LIMIT 1;	formula_1
SELECT YEAR FROM races GROUP BY YEAR ORDER BY COUNT(*) DESC LIMIT 1;	formula_1
SELECT name FROM races WHERE YEAR = 2017 AND circuitId NOT IN (SELECT circuitId FROM races WHERE YEAR = 2000)	formula_1
SELECT T2.country, T1.name, T1.location FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.year = ( SELECT MIN(year) FROM races ) AND T2.country LIKE '%Europe%' LIMIT 1	formula_1
SELECT MAX(T1.year) AS last_season FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Brands Hatch';	formula_1
SELECT COUNT(*) FROM circuits AS c JOIN races AS r ON c.circuitid = r.circuitid WHERE c.name = 'Silverstone' AND r.name LIKE '%British Grand Prix%'	formula_1
SELECT D.forename, D.surname FROM drivers AS D JOIN results AS R ON D.driverid = R.driverid JOIN races AS Ra ON R.raceid = Ra.raceid WHERE Ra.name = 'Singapore Grand Prix' AND Ra.year = 2010 ORDER BY R.position;	formula_1
SELECT d.forename, d.surname, MAX(r.points) AS total_points FROM drivers d JOIN results r ON d.driverid = r.driverid GROUP BY d.driverid ORDER BY total_points DESC LIMIT 1;	formula_1
SELECT d.forename, d.surname, r.points FROM driverStandings r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Chinese Grand Prix' AND ra.year = 2017 ORDER BY r.points DESC LIMIT 3;	formula_1
SELECT d.forename, d.surname, r.name, MIN(l.milliseconds) AS best_lap_time FROM drivers d JOIN laptimes l ON d.driverid = l.driverid JOIN races r ON l.raceid = r.raceid GROUP BY d.driverid, r.raceid ORDER BY best_lap_time ASC LIMIT 1;	formula_1
SELECT AVG(l.milliseconds) AS avg_lap_time FROM laptimes l JOIN drivers d ON l.driverid = d.driverid JOIN races r ON l.raceid = r.raceid WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND r.name = 'Malaysian Grand Prix'	formula_1
SELECT CAST(SUM(CASE WHEN T1.surname = 'Hamilton' AND T2.position > 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.driverId) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.year >= 2010;	formula_1
SELECT d.forename, d.surname, d.nationality, MAX(ds.points) as max_points FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId WHERE ds.wins > 0 GROUP BY d.driverId ORDER BY max_points DESC LIMIT 1;	formula_1
SELECT forename, surname, (strftime('%Y', 'now') - strftime('%Y', dob)) AS age FROM drivers WHERE nationality = 'Japanese' ORDER BY dob DESC LIMIT 1;	formula_1
SELECT c.circuitName  FROM circuits c  JOIN races r ON c.circuitId = r.circuitId  WHERE r.year BETWEEN 1990 AND 2000  GROUP BY c.circuitName  HAVING COUNT(r.raceId) = 4;	formula_1
SELECT c.name, c.location, r.name FROM circuits c JOIN races r ON c.circuitid = r.circuitid WHERE c.country = 'USA' AND r.year = 2006;	formula_1
SELECT r.name AS race_name, c.name AS circuit_name, c.location FROM races r JOIN circuits c ON r.circuitid = c.circuitid WHERE STRFTIME('%Y-%m', r.date) = '2005-09';	formula_1
SELECT r.name FROM races r JOIN results res ON r.raceid = res.raceid JOIN drivers d ON res.driverid = d.driverid WHERE d.forename = 'Alex' AND d.surname = 'Yoong' AND res.position < 20;	formula_1
SELECT COUNT(*) FROM constructorStandings cs JOIN constructors c ON cs.constructorId = c.constructorId JOIN races r ON cs.raceId = r.raceId JOIN circuits cu ON r.circuitId = cu.circuitId JOIN driverStandings ds ON cs.raceId = ds.raceId AND cs.constructorId = ds.constructorId JOIN drivers d ON ds.driverId = d.driverId WHERE d.forename = 'Michael' AND d.surname = 'Schumacher' AND cu.name = 'Sepang International Circuit' AND cs.points = (SELECT MAX(points) FROM constructorStandings WHERE raceId = cs.raceId)	formula_1
SELECT r.name, r.year FROM races r JOIN results res ON r.raceid = res.raceid JOIN drivers d ON res.driverid = d.driverid WHERE d.forename = 'Michael' AND d.surname = 'Schumacher' ORDER BY res.fastestlaptimes DESC LIMIT 1;	formula_1
SELECT AVG(T2.points) FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T1.forename = 'Eddie' AND T1.surname = 'Irvine' AND T2.year = 2000	formula_1
SELECT MIN(r.year), r.points FROM races r JOIN results res ON r.raceid = res.raceid JOIN drivers d ON res.driverid = d.driverid WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT r.name, c.country FROM races r JOIN circuits c ON r.circuitid = c.circuitid WHERE r.year = 2017 ORDER BY r.date;	formula_1
SELECT r.name, r.year, c.location, MAX(r.laps) AS max_laps FROM races r JOIN circuits c ON r.circuitid = c.circuitid GROUP BY r.raceid ORDER BY max_laps DESC LIMIT 1;	formula_1
SELECT CAST(SUM(CASE WHEN T1.country = 'Germany' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'European Grand Prix';	formula_1
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit'	formula_1
SELECT name FROM circuits WHERE name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring') ORDER BY lat DESC LIMIT 1;	formula_1
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit';	formula_1
SELECT country FROM circuits ORDER BY alt DESC LIMIT 1	formula_1
SELECT COUNT(*) FROM drivers WHERE code IS NULL;	formula_1
SELECT T1.country FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid JOIN constructorstandings AS T3 ON T2.raceid = T3.raceid JOIN constructors AS T4 ON T3.constructorid = T4.constructorid WHERE T3.position = 1 ORDER BY T4.nationality DESC LIMIT 1;	formula_1
SELECT surname FROM drivers WHERE nationality = 'Italian' ORDER BY surname;	formula_1
SELECT url FROM drivers WHERE forename = 'Anthony' AND surname = 'Davidson';	formula_1
SELECT driverRef FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton';	formula_1
SELECT circuits.name FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE races.year = 2009 AND races.name = 'Spanish Grand Prix';	formula_1
SELECT DISTINCT T1.year FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Silverstone'	formula_1
SELECT T1.url FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = "Silverstone"	formula_1
SELECT T2.date FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Abu Dhabi Street Circuit' AND T2.year = 2010	formula_1
SELECT COUNT(*) FROM races WHERE circuitId IN (SELECT circuitId FROM circuits WHERE country = 'Italy');	formula_1
SELECT T1.date FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Circuit de Barcelona-Catalunya'	formula_1
SELECT T1.url FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.year = 2009 AND T2.name = "Spanish Grand Prix"	formula_1
SELECT MIN(T1.fastestLapTime) FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton'	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid ORDER BY T2.fastestlapspeed DESC LIMIT 1	formula_1
SELECT T1.driverRef  FROM drivers AS T1  JOIN results AS T2 ON T1.driverId = T2.driverId  JOIN races AS T3 ON T2.raceId = T3.raceId  WHERE T3.year = 2007 AND T3.name = 'Canadian Grand Prix' AND T2.position = 1;	formula_1
SELECT r.name  FROM races r  JOIN driverStandings ds ON r.raceId = ds.raceId  JOIN drivers d ON ds.driverId = d.driverId  WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT r.name AS RaceName FROM races r JOIN results res ON r.raceid = res.raceid JOIN drivers d ON res.driverid = d.driverid WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' ORDER BY res.rank ASC LIMIT 1;	formula_1
SELECT MAX(T1.fastestLapSpeed) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Spanish Grand Prix'	formula_1
SELECT DISTINCT T1.year FROM races AS T1 INNER JOIN driverstandings AS T2 ON T1.raceid = T2.raceid INNER JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T3.forename = 'Lewis' AND T3.surname = 'Hamilton'	formula_1
SELECT T2.positionOrder FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton' AND T3.name = 'Chinese Grand Prix' ORDER BY T2.position DESC LIMIT 1	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.grid = 4 AND T2.raceid IN ( SELECT raceid FROM races WHERE year = 1989 AND name = 'Australian Grand Prix' )	formula_1
SELECT COUNT(*) FROM results WHERE raceId = (SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND YEAR = 2008) AND statusId = 1;	formula_1
SELECT T1.fastestLapTime FROM results AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T2.forename = "Lewis" AND T2.surname = "Hamilton" AND T1.raceid = (SELECT raceid FROM races WHERE name = "Australian Grand Prix" AND YEAR = 2008) ORDER BY T1.fastestLapTime ASC LIMIT 1	formula_1
SELECT T1.time FROM results AS T1 INNER JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T1.position = 2 AND T2.year = 2008 AND T2.name = 'Chinese Grand Prix'	formula_1
SELECT d.forename, d.surname, r.time, d.url FROM drivers d JOIN results r ON d.driverid = r.driverid WHERE r.raceid = (     SELECT raceid     FROM races     WHERE name = 'Australian Grand Prix' AND YEAR = 2008 ) AND r.position = 1;	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND driverId IN (     SELECT driverId FROM results WHERE raceId = (         SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND YEAR = 2008     ) )	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId IN (     SELECT raceId     FROM races     WHERE year = 2008 AND name = 'Chinese Grand Prix' ) AND time IS NOT NULL;	formula_1
SELECT SUM(points) FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')	formula_1
SELECT AVG(REPLACE(SUBSTR(T1.fastestLapTime, INSTR(T1.fastestLapTime, ':') + 1), '.', '')) AS avg_fastest_lap_time_seconds FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton';	formula_1
SELECT CAST(SUM(CASE WHEN T1.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM lapTimes AS T1 INNER JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.year = 2008 AND T2.name = "Australian Grand Prix"	formula_1
SELECT      ((strftime('%J', T1.time) - strftime('%J', ( SELECT MIN(time) FROM results WHERE raceid = 1 AND time IS NOT NULL ) )) / strftime('%J', ( SELECT MIN(time) FROM results WHERE raceid = 1 AND time IS NOT NULL ))) * 100 AS percentage_faster FROM      results AS T1 WHERE      raceid = 1 AND time IS NOT NULL;	formula_1
SELECT COUNT(*) FROM circuits WHERE country = 'Australia' AND location = 'Adelaide';	formula_1
SELECT lat, lng FROM circuits WHERE country = 'USA'	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND STRFTIME('%Y', dob) > '1980';	formula_1
SELECT MAX(T1.points) FROM constructorStandings AS T1 INNER JOIN constructors AS T2 ON T1.constructorid = T2.constructorid WHERE T2.nationality = 'British'	formula_1
SELECT c.name AS ConstructorName, cs.points AS Points FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId ORDER BY cs.points DESC LIMIT 1;	formula_1
SELECT c.name  FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId WHERE cs.raceId = 291 AND cs.points = 0;	formula_1
SELECT COUNT(*) FROM constructorStandings  JOIN constructors ON constructorStandings.constructorId = constructors.constructorId  WHERE constructors.nationality = 'Japanese' AND points = 0;	formula_1
SELECT DISTINCT c.name FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId WHERE cs.position = 1;	formula_1
SELECT COUNT(*) FROM constructorStandings WHERE constructorId IN (SELECT constructorId FROM constructors WHERE nationality = 'French') AND laps > 50;	formula_1
SELECT CAST(SUM(CASE WHEN T2.time IS NOT NULL AND T1.year BETWEEN 2007 AND 2009 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.DriverID) AS RaceCompletionPercentage FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T3.nationality = 'Japanese';	formula_1
SELECT AVG(strftime('%s', SUBSTR(T1.time, 4)) - strftime('%s', '00:00:00')) AS avg_time_seconds, T2.year FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T1.statusId = 1 AND T2.year < 1975 GROUP BY T2.year;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN driverstandings ds ON d.driverid = ds.driverid WHERE d.dob > '1975-12-31' AND ds.position = 2;	formula_1
SELECT COUNT(*) FROM driverStandings WHERE driverId IN (     SELECT driverId FROM constructors WHERE nationality = 'Italian' ) AND position > 1;	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid ORDER BY T2.fastestlaptime ASC LIMIT 1	formula_1
SELECT T1.fastestLap FROM results AS T1 JOIN driverstandings AS T2 ON T1.driverid = T2.driverid WHERE T1.year = 2009 AND T2.position = 1 ORDER BY T1.fastestlaptime LIMIT 1;	formula_1
SELECT AVG(T1.fastestLapSpeed) AS average_fastest_lap_speed FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Spanish Grand Prix';	formula_1
SELECT T1.name, T1.year FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T2.milliseconds IS NOT NULL ORDER BY T2.milliseconds ASC LIMIT 1;	formula_1
SELECT CAST(SUM(CASE WHEN T2.year BETWEEN 2000 AND 2005 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM drivers AS T1  JOIN laptimes AS T2 ON T1.driverid = T2.driverid  WHERE T1.dob < '1985-01-01';	formula_1
SELECT COUNT(DISTINCT driverId) AS french_drivers_with_fast_laptimes FROM laptimes JOIN drivers ON laptimes.driverId = drivers.driverId WHERE drivers.nationality = 'French' AND laptimes.milliseconds < 120000;	formula_1
SELECT code FROM drivers WHERE nationality = 'American'	formula_1
SELECT raceId FROM races WHERE YEAR = 2009;	formula_1
SELECT COUNT(*) FROM results WHERE raceId = 18;	formula_1
SELECT COUNT(*) AS netherlandic_drivers, MIN(number) AS min_number FROM drivers WHERE nationality = 'Dutch' ORDER BY dob DESC LIMIT 3;	formula_1
SELECT driverRef FROM drivers WHERE forename = 'Robert' AND surname = 'Kubica';	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND STRFTIME('%Y', dob) = '1980';	formula_1
SELECT d.forename, d.surname, MIN(l.time) AS earliest_lap_time FROM drivers d JOIN laptimes l ON d.driverid = l.driverid WHERE d.nationality = 'German' AND STRFTIME('%Y', d.dob) BETWEEN '1980' AND '1990' GROUP BY d.driverid ORDER BY earliest_lap_time ASC LIMIT 3;	formula_1
SELECT driverRef FROM drivers WHERE nationality = 'German' ORDER BY dob ASC LIMIT 1	formula_1
SELECT driverId, code FROM results WHERE driverId IN (     SELECT driverId FROM drivers WHERE STRFTIME('%Y', dob) = '1971' ) AND fastestLap IS NOT NULL ORDER BY fastestLapTime ASC LIMIT 1;	formula_1
SELECT d.forename, d.surname, MAX(l.time) AS latest_lap_time FROM drivers d JOIN laptimes l ON d.driverid = l.driverid WHERE d.nationality = 'Spanish' AND STRFTIME('%Y', d.dob) < '1982' GROUP BY d.driverid ORDER BY latest_lap_time DESC LIMIT 10;	formula_1
SELECT DISTINCT YEAR FROM races WHERE raceId IN (SELECT raceId FROM results ORDER BY fastestLapTime ASC LIMIT 1)	formula_1
SELECT MIN(TIME) AS lowest_speed_of_lap_time FROM laptimes;	formula_1
SELECT driverId FROM laptimes WHERE lap = 1 ORDER BY TIME ASC LIMIT 5	formula_1
SELECT COUNT(*) FROM results WHERE raceId BETWEEN 50 AND 100 AND statusId = 2;	formula_1
SELECT COUNT(*), LOCATION, lat, lng FROM circuits WHERE country = 'Austria';	formula_1
SELECT raceId, COUNT(*) AS finisher_count FROM results WHERE TIME IS NOT NULL GROUP BY raceId ORDER BY finisher_count DESC LIMIT 1;	formula_1
SELECT D.driverRef, D.nationality, D.dob FROM drivers AS D JOIN qualifying AS Q ON D.driverId = Q.driverId WHERE Q.raceId = 23 AND Q.q2 IS NOT NULL;	formula_1
SELECT MIN(races.date), races.time, circuits.name FROM races JOIN qualifying ON races.raceid = qualifying.raceid JOIN drivers ON qualifying.driverid = drivers.driverid ORDER BY drivers.dob DESC LIMIT 1;	formula_1
SELECT COUNT(*)  FROM constructorStandings  JOIN constructors ON constructorStandings.constructorId = constructors.constructorId  JOIN status ON constructorStandings.status = status.statusId  WHERE constructors.nationality = 'American' AND status.status = 'Puncture';	formula_1
SELECT c.name, c.url FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId WHERE c.nationality = 'Italian' ORDER BY cs.points DESC LIMIT 1;	formula_1
SELECT T2.url FROM constructorStandings AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId GROUP BY T2.url ORDER BY SUM(T1.wins) DESC LIMIT 1	formula_1
SELECT T1.driverref FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid WHERE T2.lap = 3 AND T2.raceid = ( SELECT raceid FROM races WHERE name = 'French Grand Prix' ) ORDER BY TIME DESC LIMIT 1	formula_1
SELECT T1.name, T2.milliseconds FROM races AS T1 JOIN laptimes AS T2 ON T1.raceid = T2.raceid WHERE T2.position = 1 ORDER BY T2.milliseconds ASC LIMIT 1	formula_1
SELECT AVG(T1.fastestLapTime)  FROM results AS T1  JOIN races AS T2 ON T1.raceId = T2.raceId  WHERE T2.name = 'United States Grand Prix' AND T1.rank < 11;	formula_1
SELECT d.forename, d.surname, AVG(p.duration) AS avg_duration FROM drivers d JOIN pitStops p ON d.driverId = p.driverId WHERE d.nationality = 'German' AND STRFTIME('%Y', d.dob) BETWEEN '1980' AND '1985' GROUP BY d.driverId ORDER BY avg_duration ASC LIMIT 3;	formula_1
SELECT T1.driverid, T1.positionText, T1.time  FROM results AS T1  JOIN races AS T2 ON T1.raceid = T2.raceid  WHERE T2.name = 'Canadian Grand Prix' AND T2.year = 2008 AND T1.position = 1;	formula_1
SELECT c.constructorRef, c.url FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId JOIN races r ON cs.raceId = r.raceId WHERE r.name = 'Singapore Grand Prix' AND r.year = 2009 ORDER BY cs.points DESC LIMIT 1;	formula_1
SELECT forename, surname, dob FROM drivers WHERE nationality = 'Austrian' AND STRFTIME('%Y', dob) BETWEEN '1981' AND '1991';	formula_1
SELECT forename, surname, url, dob FROM drivers WHERE nationality = 'German' AND STRFTIME('%Y', dob) BETWEEN '1971' AND '1985' ORDER BY dob DESC;	formula_1
SELECT location, country, lat, lng FROM circuits WHERE name = 'Hungaroring';	formula_1
SELECT constructors.name, constructors.nationality, SUM(constructorResults.points) AS total_points FROM constructorResults JOIN constructors ON constructorResults.constructorId = constructors.constructorId JOIN races ON constructorResults.raceId = races.raceId WHERE races.name = 'Monaco Grand Prix' AND races.year BETWEEN 1980 AND 2010 GROUP BY constructors.constructorId ORDER BY total_points DESC LIMIT 1;	formula_1
SELECT AVG(T2.points) FROM drivers AS T1 INNER JOIN constructorStandings AS T2 ON T1.driverid = T2.driverid WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton' AND T2.constructorid IN ( SELECT constructorid FROM constructors WHERE name = 'Turkish Grand Prix' )	formula_1
SELECT AVG(count(*)) FROM ( SELECT COUNT(*) FROM races WHERE date BETWEEN '2000-01-01' AND '2010-12-31' GROUP BY YEAR ) AS subquery	formula_1
SELECT nationality FROM drivers GROUP BY nationality ORDER BY COUNT(*) DESC LIMIT 1	formula_1
SELECT COUNT(wins) FROM driverStandings WHERE position = 91;	formula_1
SELECT r.name AS RaceName, r.date AS RaceDate, r.time AS RaceTime FROM races r JOIN results res ON r.raceId = res.raceId WHERE res.fastestLap IS NOT NULL ORDER BY res.fastestLapSpeed DESC LIMIT 1;	formula_1
SELECT T1.name, T1.location, T1.country FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid ORDER BY T2.date DESC LIMIT 1	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T2.position = 1 AND T2.round = 3 AND T2.q3 IS NOT NULL ORDER BY T2.q3 ASC LIMIT 1	formula_1
SELECT d.forename || ' ' || d.surname AS fullName, d.nationality, r.name AS firstRaceName FROM drivers d JOIN results res ON d.driverId = res.driverId JOIN races r ON res.raceId = r.raceId WHERE d.dob = (SELECT MIN(dob) FROM drivers) ORDER BY d.dob DESC LIMIT 1;	formula_1
SELECT COUNT(*) AS accident_count FROM constructorStandings cs JOIN constructorResults cr ON cs.constructorId = cr.constructorId JOIN races r ON cr.raceId = r.raceId WHERE r.name = 'Canadian Grand Prix' AND cs.status = 3;	formula_1
SELECT COUNT(wins) AS total_wins, forename, surname FROM drivers JOIN driverstandings ON drivers.driverid = driverstandings.driverid WHERE dob IS NOT NULL ORDER BY dob ASC LIMIT 1;	formula_1
SELECT MAX(milliseconds) FROM pitstops	formula_1
SELECT MIN(time) AS fastest_lap_time FROM laptimes	formula_1
SELECT MAX(T2.duration) FROM drivers AS T1 INNER JOIN pitstops AS T2 ON T1.driverid = T2.driverid WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton'	formula_1
SELECT lap FROM pitstops WHERE driverid = (SELECT driverid FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton') AND raceid = (SELECT raceid FROM races WHERE name = 'Australian Grand Prix' AND YEAR = 2011) ORDER BY lap ASC LIMIT 1;	formula_1
SELECT T2.driverid ,  T1.duration FROM pitstops AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T1.raceid = ( SELECT raceid FROM races WHERE name = "Australian Grand Prix" AND YEAR = 2011 )	formula_1
SELECT MIN(time) AS fastest_lap_time FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.surname = 'Hamilton';	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN laptimes lt ON d.driverid = lt.driverid WHERE lt.time = (SELECT MIN(time) FROM laptimes) LIMIT 1;	formula_1
SELECT T2.position  FROM laptimes AS T1  JOIN results AS T2 ON T1.driverid = T2.driverid AND T1.raceid = T2.raceid  WHERE T1.driverid = (SELECT driverid FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')  ORDER BY T1.time ASC  LIMIT 1;	formula_1
SELECT MIN(T1.time) AS Fastest_Lap_Time FROM laptimes AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.name = 'Austrian Grand Prix';	formula_1
SELECT T1.name, MIN(T2.time) AS fastest_lap FROM circuits AS T1 INNER JOIN laptimes AS T2 ON T1.circuitid = T2.circuitid WHERE T1.country = 'Italy' GROUP BY T1.name ORDER BY fastest_lap ASC LIMIT 1;	formula_1
SELECT T1.name FROM races AS T1 JOIN laptimes AS T2 ON T1.raceid = T2.raceid WHERE T1.name = 'Austrian Grand Prix' ORDER BY T2.milliseconds ASC LIMIT 1	formula_1
SELECT p.duration FROM pitStops p JOIN races r ON p.raceId = r.raceId WHERE r.name = 'Austrian Grand Prix' AND p.milliseconds = (     SELECT MIN(milliseconds)     FROM pitStops ps     JOIN races rs ON ps.raceId = rs.raceId     WHERE rs.name = 'Austrian Grand Prix' ) ORDER BY p.milliseconds DESC LIMIT 1;	formula_1
SELECT c.lat, c.lng  FROM circuits c  JOIN (     SELECT raceid, MIN(time) AS min_time      FROM laptimes      WHERE TIME = '1:29.488'      GROUP BY raceid ) lt ON c.circuitid = lt.raceid;	formula_1
SELECT AVG(T1.milliseconds) FROM pitstops AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T2.forename = "Lewis" AND T2.surname = "Hamilton"	formula_1
SELECT AVG(T1.milliseconds) FROM laptimes AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.country = "Italy"	formula_1
SELECT player_api_id FROM Player_Attributes ORDER BY overall_rating DESC LIMIT 1	european_football_2
SELECT player_name, height FROM Player ORDER BY height DESC LIMIT 1;	european_football_2
SELECT preferred_foot FROM Player_Attributes ORDER BY potential ASC LIMIT 1	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE overall_rating BETWEEN 60 AND 65 AND defensive_work_rate = 'Low'	european_football_2
SELECT player_api_id FROM Player_Attributes ORDER BY crossing DESC LIMIT 5;	european_football_2
SELECT T1.name FROM League AS T1 INNER JOIN Match AS T2 ON T1.id = T2.league_id WHERE T2.season = '2015/2016' GROUP BY T1.name ORDER BY SUM(T2.home_team_goal + T2.away_team_goal) DESC LIMIT 1	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id WHERE T2.season = '2015/2016' AND T1.team_long_name IS NOT NULL GROUP BY T1.team_long_name ORDER BY SUM(CASE WHEN T2.home_team_goal < T2.away_team_goal THEN 1 ELSE 0 END) ASC LIMIT 1;	european_football_2
SELECT P.player_name  FROM Player AS P  JOIN Player_Attributes AS PA ON P.player_api_id = PA.player_api_id  GROUP BY P.player_api_id  ORDER BY SUM(PA.penalties) DESC  LIMIT 10;	european_football_2
SELECT T2.team_long_name FROM Match AS T1 JOIN Team AS T2 ON T1.away_team_api_id = T2.team_api_id JOIN League AS T3 ON T1.league_id = T3.id WHERE T3.name = 'Scotland Premier League' AND T1.season = '2009/2010' ORDER BY T1.away_team_goal - T1.home_team_goal DESC LIMIT 1;	european_football_2
SELECT T2.buildUpPlaySpeed  FROM Team AS T1  JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id  ORDER BY T2.buildUpPlaySpeed DESC  LIMIT 4;	european_football_2
SELECT T1.name FROM League AS T1 JOIN Match AS T2 ON T1.id = T2.league_id WHERE T2.season = '2015/2016' GROUP BY T1.name ORDER BY SUM(CASE WHEN home_team_goal = away_team_goal THEN 1 ELSE 0 END) DESC LIMIT 1;	european_football_2
SELECT P.player_name, strftime('%Y', 'now') - strftime('%Y', P.birthday) AS age FROM Player AS P JOIN Player_Attributes AS PA ON P.player_api_id = PA.player_api_id WHERE PA.sprint_speed >= 97 AND date BETWEEN '2013-01-01' AND '2015-12-31';	european_football_2
SELECT T2.name, COUNT(T1.id) AS match_count FROM Match AS T1 JOIN League AS T2 ON T1.league_id = T2.id GROUP BY T2.id ORDER BY match_count DESC LIMIT 1;	european_football_2
SELECT AVG(height) FROM Player WHERE birthday BETWEEN '1990-01-01 00:00:00' AND '1995-12-31 23:59:59';	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE date LIKE '2010%' AND overall_rating > ( SELECT AVG(overall_rating) FROM Player_Attributes WHERE date LIKE '2010%' ) ORDER BY overall_rating DESC LIMIT 1;	european_football_2
SELECT team_fifa_api_id FROM Team_Attributes WHERE buildUpPlaySpeed > 50 AND buildUpPlaySpeed < 60;	european_football_2
SELECT T1.team_long_name FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE strftime('%Y', T2.date) = '2012' AND T2.buildUpPlayPassing > ( SELECT AVG(buildUpPlayPassing) FROM Team_Attributes WHERE strftime('%Y', date) = '2012' )	european_football_2
SELECT CAST(SUM(CASE WHEN preferred_foot = 'left' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(player_fifa_api_id) AS percentage_left_foot FROM Player WHERE strftime('%Y', birthday) BETWEEN '1987' AND '1992';	european_football_2
SELECT T1.name FROM League AS T1 JOIN Match AS T2 ON T1.id = T2.league_id GROUP BY T1.id ORDER BY SUM(T2.home_team_goal + T2.away_team_goal) ASC LIMIT 5	european_football_2
SELECT AVG(T1.long_shots) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Ahmed Samir Farag'	european_football_2
SELECT P.player_name, AVG(PA.heading_accuracy) AS avg_heading_accuracy FROM Player P JOIN Player_Attributes PA ON P.player_api_id = PA.player_api_id WHERE P.height > 180 GROUP BY P.player_name ORDER BY avg_heading_accuracy DESC LIMIT 10;	european_football_2
SELECT T.team_long_name FROM Team AS T JOIN Team_Attributes AS TA ON T.team_api_id = TA.team_api_id WHERE TA.buildUpPlayDribblingClass = 'Normal' AND TA.date >= '2014-01-01 00:00:00' AND TA.date <= '2014-12-31 00:00:00' HAVING AVG(TA.chanceCreationPassing) > TA.chanceCreationPassing ORDER BY TA.chanceCreationPassing DESC;	european_football_2
SELECT L.name FROM League L JOIN Match M ON L.id = M.league_id WHERE M.season = '2009/2010' GROUP BY L.name HAVING AVG(M.home_team_goal) > AVG(M.away_team_goal) ORDER BY AVG(M.home_team_goal) - AVG(M.away_team_goal) DESC;	european_football_2
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers';	european_football_2
SELECT player_name FROM Player WHERE birthday LIKE '1970-10-%';	european_football_2
SELECT T1.attacking_work_rate FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Franco Zennaro'	european_football_2
SELECT T2.buildUpPlayPositioningClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'ADO Den Haag' AND T2.date LIKE '%2010%' LIMIT 1	european_football_2
SELECT T1.heading_accuracy  FROM Player_Attributes AS T1  JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id  WHERE T2.player_name = 'Francois Affolter' AND T1.date = '2014-09-18 00:00:00';	european_football_2
SELECT Player_Attributes.overall_rating  FROM Player  JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id  WHERE Player.player_name = 'Gabriel Tamas' AND strftime('%Y', Player_Attributes.date) = '2011';	european_football_2
SELECT COUNT(*)  FROM Match  JOIN League ON Match.league_id = League.id  WHERE League.name = 'Scotland Premier League' AND Match.season = '2015/2016';	european_football_2
SELECT T2.preferred_foot FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T1.birthday DESC LIMIT 1	european_football_2
SELECT player_name FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id ORDER BY potential DESC LIMIT 1;	european_football_2
SELECT COUNT(*) FROM Player WHERE weight < 130 AND preferred_foot = 'left';	european_football_2
SELECT T.team_short_name FROM Team AS T INNER JOIN Team_Attributes AS TA ON T.team_api_id = TA.team_api_id WHERE TA.chanceCreationPassingClass = 'Risky'	european_football_2
SELECT T2.defensive_work_rate FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'David Wilson' ORDER BY T2.date DESC LIMIT 1	european_football_2
SELECT T1.birthday FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.overall_rating DESC LIMIT 1	european_football_2
SELECT T1.name FROM League AS T1 INNER JOIN Country AS T2 ON T1.country_id = T2.id WHERE T2.name = 'Netherlands'	european_football_2
SELECT AVG(T1.home_team_goal) AS average_home_team_goal FROM Match AS T1 JOIN Country AS T2 ON T1.country_id = T2.id WHERE T2.name = 'Poland' AND T1.season = '2010/2011';	european_football_2
SELECT P.player_name, AVG(PA.finishing) AS avg_finishing FROM Player AS P JOIN Player_Attributes AS PA ON P.player_api_id = PA.player_api_id GROUP BY P.player_name ORDER BY height DESC, avg_finishing DESC LIMIT 1;	european_football_2
SELECT player_name FROM Player WHERE height > 180;	european_football_2
SELECT COUNT(*) FROM Player WHERE strftime('%Y', birthday) > '1990';	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Adam%' AND weight > 170;	european_football_2
SELECT DISTINCT P.player_name  FROM Player AS P  JOIN Player_Attributes AS PA ON P.player_api_id = PA.player_api_id  WHERE PA.overall_rating > 80 AND strftime('%Y', PA.date) BETWEEN '2008' AND '2010';	european_football_2
SELECT T2.potential FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Aaron Doran' ORDER BY T2.date DESC LIMIT 1	european_football_2
SELECT player_name FROM Player WHERE preferred_foot = 'left';	european_football_2
SELECT T1.team_long_name FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeedClass = 'Fast'	european_football_2
SELECT T2.buildUpPlayPassingClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_short_name = 'CLB'	european_football_2
SELECT T.team_short_name FROM Team AS T JOIN Team_Attributes AS TA ON T.team_api_id = TA.team_api_id WHERE TA.buildUpPlayPassing > 70;	european_football_2
SELECT AVG(t2.overall_rating) FROM Player AS t1 INNER JOIN Player_Attributes AS t2 ON t1.player_api_id = t2.player_api_id WHERE strftime('%Y', t2.date) BETWEEN '2010' AND '2015' AND t1.height > 170	european_football_2
SELECT player_name FROM Player ORDER BY height ASC LIMIT 1;	european_football_2
SELECT T1.name FROM Country AS T1 INNER JOIN League AS T2 ON T1.id = T2.country_id WHERE T2.name = 'Italy Serie A';	european_football_2
SELECT T.team_short_name FROM Team AS T JOIN Team_Attributes AS TA ON T.team_api_id = TA.team_api_id WHERE TA.buildUpPlaySpeed = 31 AND TA.buildUpPlayDribbling = 53 AND TA.buildUpPlayPassing = 32;	european_football_2
SELECT AVG(T2.overall_rating) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Aaron Doran'	european_football_2
SELECT COUNT(*) FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T2.name = 'Germany 1. Bundesliga' AND strftime('%Y-%m', T1.date) BETWEEN '2008-08' AND '2008-10';	european_football_2
SELECT T1.team_short_name FROM Team AS T1 JOIN Match AS T2 ON T1.id = T2.home_team_api_id WHERE T2.home_team_goal = 10;	european_football_2
SELECT P.player_name, PA.balance, PA.potential FROM Player AS P JOIN Player_Attributes AS PA ON P.player_api_id = PA.player_api_id WHERE PA.potential = 61 ORDER BY PA.balance DESC;	european_football_2
SELECT (SUM(CASE WHEN T1.player_name = 'Abdou Diallo' THEN T2.ball_control ELSE 0 END) / COUNT(CASE WHEN T1.player_name = 'Abdou Diallo' THEN T2.id ELSE NULL END)) - (SUM(CASE WHEN T1.player_name = 'Aaron Appindangoye' THEN T2.ball_control ELSE 0 END) / COUNT(CASE WHEN T1.player_name = 'Aaron Appindangoye' THEN T2.id ELSE NULL END)) AS diff FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id	european_football_2
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN'	european_football_2
SELECT player_name FROM Player WHERE player_name IN ('Aaron Lennon', 'Abdelaziz Barrada') ORDER BY birthday ASC LIMIT 1;	european_football_2
SELECT player_name, height FROM Player ORDER BY height DESC LIMIT 1;	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE preferred_foot = 'left' AND attacking_work_rate = 'low'	european_football_2
SELECT T1.name FROM Country AS T1 INNER JOIN League AS T2 ON T1.id = T2.country_id WHERE T2.name = 'Belgium Jupiler League'	european_football_2
SELECT T1.name FROM League AS T1 INNER JOIN Country AS T2 ON T1.country_id = T2.id WHERE T2.name = 'Germany'	european_football_2
SELECT p.player_name, pa.overall_rating FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id ORDER BY pa.overall_rating DESC LIMIT 1;	european_football_2
SELECT COUNT(DISTINCT T1.player_api_id) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE strftime('%Y', T1.birthday) < '1986' AND T2.defensive_work_rate = 'High';	european_football_2
SELECT p.player_name, pa.crossing FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone') ORDER BY pa.crossing DESC LIMIT 1;	european_football_2
SELECT T1.heading_accuracy FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Ariel Borysiuk' ORDER BY T1.date DESC LIMIT 1	european_football_2
SELECT COUNT(*) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.height > 180 AND T2.volleys > 70	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.volleys > 70 AND pa.dribbling > 70;	european_football_2
SELECT COUNT(*) FROM Match AS T1 INNER JOIN Country AS T2 ON T1.country_id = T2.id WHERE T2.name = 'Belgium' AND T1.season = '2008/2009';	european_football_2
SELECT T1.long_passing FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.birthday ASC LIMIT 1	european_football_2
SELECT COUNT(*)  FROM Match  JOIN League ON Match.league_id = League.id  WHERE League.name = 'Belgium Jupiler League' AND SUBSTR(`date`, 1, 7) = '2009-04';	european_football_2
SELECT T2.name FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.season = '2008/2009' GROUP BY T2.name ORDER BY COUNT(T1.id) DESC LIMIT 1	european_football_2
SELECT AVG(T2.overall_rating) AS average_overall_rating FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE strftime('%Y', T1.birthday) < '1986';	european_football_2
SELECT ((SELECT overall_rating FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE player_name = 'Ariel Borysiuk') - (SELECT overall_rating FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE player_name = 'Paulin Puel')) * 100 / (SELECT overall_rating FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE player_name = 'Paulin Puel') AS percentage_increase;	european_football_2
SELECT AVG(T2.buildUpPlaySpeed) AS avg_build_up_play_speed FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Heart of Midlothian';	european_football_2
SELECT AVG(T1.overall_rating) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Pietro Marino'	european_football_2
SELECT SUM(T1.crossing) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Aaron Lennox'	european_football_2
SELECT MAX(T2.chanceCreationPassing) AS max_chance_creation_passing, T2.chanceCreationPassingClass  FROM Team AS T1  JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id  WHERE T1.team_long_name = 'Ajax';	european_football_2
SELECT preferred_foot FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE player_name = 'Abdou Diallo' ORDER BY date DESC LIMIT 1	european_football_2
SELECT MAX(T1.overall_rating) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Dorlan Pabon'	european_football_2
SELECT AVG(T1.away_team_goal) FROM Match AS T1 INNER JOIN Team AS T2 ON T1.away_team_api_id = T2.team_api_id WHERE T2.team_long_name = 'Parma' AND T1.country_id IN ( SELECT id FROM Country WHERE name = 'Italy' )	european_football_2
SELECT P.player_name FROM Player AS P JOIN Player_Attributes AS PA ON P.player_api_id = PA.player_api_id WHERE PA.overall_rating = 77 AND PA.date LIKE '2016-06-23%' ORDER BY P.birthday ASC LIMIT 1;	european_football_2
SELECT T1.overall_rating FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Aaron Mooy' AND T1.date LIKE '2016-02-04%'	european_football_2
SELECT T2.potential  FROM Player AS T1  JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id  WHERE T1.player_name = 'Francesco Parravicini' AND T2.date = '2010-08-30 00:00:00';	european_football_2
SELECT T2.attacking_work_rate FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Francesco Migliore' AND T2.date LIKE '2015-05-01%'	european_football_2
SELECT T2.defensive_work_rate FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Kevin Berigaud' AND T2.date = '2013-02-22 00:00:00';	european_football_2
SELECT T2.date FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Kevin Constant' ORDER BY T2.crossing DESC LIMIT 1;	european_football_2
SELECT T2.buildUpPlaySpeedClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Willem II' AND T2.date = '2011-02-22'	european_football_2
SELECT T2.buildUpPlayDribblingClass  FROM Team AS T1  JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id  WHERE T1.team_short_name = 'LEI' AND T2.date = '2015-09-10 00:00:00';	european_football_2
SELECT T2.buildUpPlayPassingClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'FC Lorient' AND T2.date LIKE '2010-02-22%'	european_football_2
SELECT T1.chance_creation_passing_class FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_long_name = 'PEC Zwolle' AND T1.date = '2013-09-20 00:00:00'	european_football_2
SELECT T2.chance_creation_crossing_class  FROM Team AS T1  JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id  WHERE T1.team_long_name = 'Hull City' AND T2.date = '2010-02-22 00:00:00';	european_football_2
SELECT T1.defenceAggressionClass  FROM Team_Attributes AS T1  JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id  WHERE T2.team_long_name = 'Hannover 96' AND T1.date LIKE '2015-09-10%'	european_football_2
SELECT AVG(T1.overall_rating) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Marko Arnautovic' AND T1.date BETWEEN '2007-02-22' AND '2016-04-21'	european_football_2
SELECT CAST((T1.overall_rating - T2.overall_rating) AS REAL) * 100 / T1.overall_rating FROM Player_Attributes AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.date = '2013-07-12' AND T2.date = '2013-07-12' AND T1.player_name = 'Landon Donovan' AND T2.player_name = 'Jordan Bowery'	european_football_2
SELECT player_name FROM Player ORDER BY height DESC LIMIT 1;	european_football_2
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10	european_football_2
SELECT player_name FROM Player WHERE strftime('%Y', 'now') - strftime('%Y', birthday) >= 35;	european_football_2
SELECT SUM(CASE WHEN T2.player_name = 'Aaron Lennon' THEN 1 ELSE 0 END) AS home_goals FROM Match AS T1 JOIN Player AS T2 ON T1.home_player_1 = T2.player_api_id;	european_football_2
SELECT SUM(T1.away_team_goal) AS total_away_goals FROM Match AS T1 JOIN Player AS P1 ON T1.away_player_1 = P1.player_api_id JOIN Player AS P2 ON T1.away_player_2 = P2.player_api_id WHERE P1.player_name = 'Daan Smith' AND P2.player_name = 'Filipe Ferreira';	european_football_2
SELECT SUM(home_team_goal) AS total_home_goals FROM Player JOIN Match ON Player.player_api_id = Match.home_player_1 WHERE strftime('%Y', 'now') - strftime('%Y', birthday) <= 30;	european_football_2
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.overall_rating DESC LIMIT 1	european_football_2
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.potential DESC LIMIT 1	european_football_2
SELECT DISTINCT P.player_name FROM Player AS P JOIN Player_Attributes AS PA ON P.player_api_id = PA.player_api_id WHERE PA.attacking_work_rate = 'High';	european_football_2
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.finishing = 1 ORDER BY T1.birthday ASC LIMIT 1	european_football_2
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id INNER JOIN Team AS T3 ON T2.player_api_id = T3.team_api_id INNER JOIN Country AS T4 ON T3.country_id = T4.id WHERE T4.name = 'Belgium'	european_football_2
SELECT DISTINCT T1.player_name, T4.name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id INNER JOIN Team AS T3 ON T1.player_api_id IN (T3.home_player_1, T3.away_player_1) INNER JOIN Country AS T4 ON T3.team_api_id IN ( SELECT team_api_id FROM Team WHERE id IN ( SELECT home_team_api_id, away_team_api_id FROM Match ) ) WHERE T2.vision >= 90 ORDER BY T1.player_name LIMIT 10;	european_football_2
SELECT T2.name FROM Player AS T1 INNER JOIN Country AS T2 ON T1.player_api_id = T2.id GROUP BY T2.id ORDER BY AVG(T1.weight) DESC LIMIT 1	european_football_2
SELECT T1.team_long_name FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeedClass = 'Slow'	european_football_2
SELECT T.team_short_name FROM Team AS T JOIN Team_Attributes AS TA ON T.team_api_id = TA.team_api_id WHERE TA.chanceCreationPassingClass = 'Safe'	european_football_2
SELECT AVG(T2.height) FROM Player AS T1 INNER JOIN Country AS T2 ON T1.player_api_id = T2.id WHERE T2.name = 'Italy'	european_football_2
SELECT player_name FROM Player WHERE height > 180 ORDER BY player_name ASC LIMIT 3;	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND birthday > '1990';	european_football_2
SELECT T1.jumping - T2.jumping FROM Player_Attributes AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = 6 AND T2.player_api_id = 23	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE preferred_foot = 'right' ORDER BY potential ASC LIMIT 5	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE crossing = ( SELECT MAX(crossing) FROM Player_Attributes ) AND preferred_foot = 'left';	european_football_2
SELECT CAST(SUM(CASE WHEN T1.stamina > 80 AND T1.strength > 80 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Player_Attributes AS T1	european_football_2
SELECT T2.name FROM League AS T1 INNER JOIN Country AS T2 ON T1.country_id = T2.id WHERE T1.name = 'Poland Ekstraklasa'	european_football_2
SELECT T1.home_team_goal, T1.away_team_goal FROM Match AS T1 JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.date LIKE '2008-09-24%' AND T2.name = 'Belgium Jupiler League';	european_football_2
SELECT T1.sprint_speed, T1.agility, T1.acceleration  FROM Player_Attributes AS T1  JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id  WHERE T2.player_name = 'Alexis Blin';	european_football_2
SELECT T1.buildUpPlaySpeedClass FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_long_name = 'KSV Cercle Brugge'	european_football_2
SELECT COUNT(*) FROM Match WHERE season = '2015/2016' AND league_id = (SELECT id FROM League WHERE name = 'Italy Serie A');	european_football_2
SELECT MAX(home_team_goal) AS highest_score FROM Match JOIN League ON Match.league_id = League.id WHERE League.name = 'Netherlands Eredivisie';	european_football_2
SELECT T2.finishing ,  T2.curve FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T1.weight DESC LIMIT 1	european_football_2
SELECT L.name, COUNT(M.id) AS game_count FROM Match M JOIN League L ON M.league_id = L.id WHERE M.season = '2015/2016' GROUP BY L.name ORDER BY game_count DESC LIMIT 4;	european_football_2
SELECT T2.team_long_name FROM Match AS T1 INNER JOIN Team AS T2 ON T1.away_team_api_id = T2.team_api_id ORDER BY T1.away_team_goal DESC LIMIT 1	european_football_2
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.overall_rating DESC LIMIT 1	european_football_2
SELECT CAST(SUM(CASE WHEN height < 180 AND overall_rating > 70 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id	european_football_2
SELECT      SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) AS InpatientMale,     SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END) AS OutpatientMale,     ROUND(((SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END)) / SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END)) * 100, 2) AS PercentageDeviation FROM      Patient WHERE      SEX = 'M';	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN STRFTIME('%Y', Birthday) > '1930' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(SEX) FROM Patient WHERE SEX = 'F'	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(ID) AS InpatientPercentage FROM Patient WHERE Birthday BETWEEN '1930-01-01' AND '1940-12-31';	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END) AS Ratio FROM Patient WHERE Diagnosis = 'SLE';	thrombosis_prediction
SELECT T1.Diagnosis, T2.Date  FROM Examination AS T1  JOIN Laboratory AS T2 ON T1.ID = T2.ID  WHERE T1.ID = 30609;	thrombosis_prediction
SELECT P.SEX, P.Birthday, E.`Examination Date`, E.Symptoms  FROM Patient AS P  JOIN Examination AS E ON P.ID = E.ID  WHERE P.ID = 163109;	thrombosis_prediction
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.LDH > 500;	thrombosis_prediction
SELECT P.ID, strftime('%Y', 'now') - strftime('%Y', P.Birthday) AS Age FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.RVVT = '+';	thrombosis_prediction
SELECT P.ID, P.SEX, P.Diagnosis FROM Patient AS P JOIN Examination AS E ON P.ID = E.ID WHERE E.Thrombosis = 2;	thrombosis_prediction
SELECT DISTINCT P.ID, P.Description FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE STRFTIME('%Y', P.Birthday) = '1937' AND L.`T-CHO` >= 250;	thrombosis_prediction
SELECT P.ID, P.SEX, P.Diagnosis  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.ALB < 3.5;	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T1.SEX = 'F' AND (T2.TP < 6.0 OR T2.TP > 8.5) THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.ID) AS Percentage FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID;	thrombosis_prediction
SELECT AVG(T2.`aCL IgG`) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '+' AND STRFTIME('%Y', CURRENT_TIMESTAMP) - STRFTIME('%Y', T1.Birthday) >= '50'	thrombosis_prediction
SELECT COUNT(ID) FROM Patient WHERE SEX = 'F' AND STRFTIME('%Y', Description) = '1997' AND Admission = '-';	thrombosis_prediction
SELECT MIN(STRFTIME('%Y', `First Date`) - STRFTIME('%Y', Birthday)) AS YoungestAge FROM Patient	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) AS Female_Patients_With_Serious_Thrombosis FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.Thrombosis = 1 AND strftime('%Y', e.`Examination Date`) = '1997' AND p.SEX = 'F';	thrombosis_prediction
SELECT MAX(STRFTIME('%Y', Birthday)) - MIN(STRFTIME('%Y', Birthday)) AS AgeGap FROM Patient WHERE ID IN (     SELECT ID     FROM Laboratory     WHERE TG >= 200 );	thrombosis_prediction
SELECT T1.Symptoms, T1.Diagnosis FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Symptoms IS NOT NULL ORDER BY T2.Birthday DESC LIMIT 1	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T1.SEX = 'M' THEN 1 ELSE 0 END) AS REAL) / 12 FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.Date BETWEEN '1998-01-01' AND '1998-12-31'	thrombosis_prediction
SELECT T1.`Date`, strftime('%Y', T1.`Date`) - strftime('%Y', T2.Birthday) AS Age FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis LIKE '%SJS%' ORDER BY T2.Birthday ASC LIMIT 1	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T1.SEX = 'M' AND T2.UA <= 8.0 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T1.SEX = 'F' AND T2.UA <= 6.5 THEN 1 ELSE 0 END) AS Ratio FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID;	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Examination WHERE strftime('%Y', `Examination Date`) - strftime('%Y', `First Date`) >= 1	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) AS Underage_Patient_Count FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T2.Birthday) < '1972' AND STRFTIME('%Y', T1.`Examination Date`) BETWEEN '1990' AND '1993';	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.`T-BIL` >= 2.0	thrombosis_prediction
SELECT Diagnosis  FROM Examination  WHERE `Examination Date` BETWEEN '1985-01-01' AND '1995-12-31'  GROUP BY Diagnosis  ORDER BY COUNT(Diagnosis) DESC  LIMIT 1;	thrombosis_prediction
SELECT AVG(1999 - strftime('%Y', Birthday)) AS AverageAge FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE strftime('%Y-%m', Laboratory.Date) = '1991-10';	thrombosis_prediction
SELECT      strftime('%Y', T1.`Examination Date`) - strftime('%Y', T2.Birthday) AS Age,      T1.Diagnosis FROM      Examination AS T1 JOIN      Patient AS T2 ON T1.ID = T2.ID ORDER BY      T1.HGB DESC LIMIT 1;	thrombosis_prediction
SELECT ANA FROM Examination WHERE ID = 3605340 AND `Examination Date` = '1996-12-02';	thrombosis_prediction
SELECT T1.T-CHO FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.ID = 2927464 AND T1.Date = '1995-09-04'	thrombosis_prediction
SELECT T1.SEX FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis LIKE '%AORTITIS%' LIMIT 1	thrombosis_prediction
SELECT e.aCL IgM FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.Description = '1994-02-19' AND e.`Examination Date` = '1993-11-12';	thrombosis_prediction
SELECT T1.SEX FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.Date = '1992-06-12' AND T2.GPT = 9;	thrombosis_prediction
SELECT STRFTIME('%Y', '1991-10-21') - STRFTIME('%Y', T2.Birthday) AS Age FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Date = '1991-10-21' AND T1.UA = 8.4;	thrombosis_prediction
SELECT COUNT(DISTINCT L.ID) AS Total_Laboratory_Tests FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE P.`First Date` = '1991-06-13' AND P.Diagnosis = 'SJS' AND strftime('%Y', L.Date) = '1995';	thrombosis_prediction
SELECT T1.Diagnosis AS Original_Diagnose FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`Examination Date` = '1997-01-27' ORDER BY T1.`First Date`;	thrombosis_prediction
SELECT T1.Symptoms FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Birthday = '1959-03-01' AND T1.`Examination Date` = '1993-09-27'	thrombosis_prediction
SELECT      SUM(CASE WHEN T2.Birthday = '1959-02-18' AND T1.Date LIKE '1981-11-%' THEN T1.`T-CHO` ELSE 0 END) -      SUM(CASE WHEN T2.Birthday = '1959-02-18' AND T1.Date LIKE '1981-12-%' THEN T1.`T-CHO` ELSE 0 END) AS DecreaseRate FROM      Laboratory AS T1 JOIN      Patient AS T2 ON T1.ID = T2.ID;	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Diagnosis LIKE '%Behcet%' AND e.`Examination Date` BETWEEN '1997-01-01' AND '1997-12-31';	thrombosis_prediction
SELECT DISTINCT L.ID FROM Laboratory L JOIN Examination E ON L.ID = E.ID WHERE L.Date BETWEEN '1987-07-06' AND '1996-01-31' AND L.GPT > 30 AND L.ALB < 4;	thrombosis_prediction
SELECT ID FROM Patient WHERE SEX = 'F' AND STRFTIME('%Y', Birthday) = '1964' AND Admission = '+' ORDER BY ID;	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Thrombosis = 2 AND T1.ANA = 'S' AND T1.`aCL IgM` > ( SELECT AVG(`aCL IgM`) * 1.2 FROM Examination )	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN UA <= 6.5 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Laboratory WHERE U_PRO > 0 AND U_PRO < 30	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN Diagnosis = 'BEHCET' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(ID) AS Percentage FROM Patient WHERE YEAR(`First Date`) = '1981';	thrombosis_prediction
SELECT DISTINCT P.ID, P.SEX, P.Birthday, P.First_Date, L.Date FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.Admission = '-' AND L.Date LIKE '1991-10%' AND L.`T-BIL` < 2.0;	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) AS Female_Patients FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND T1.Birthday BETWEEN '1980-01-01' AND '1989-12-31' AND T2.`ANA Pattern` != 'P';	thrombosis_prediction
SELECT DISTINCT p.SEX FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE e.Diagnosis = 'PSS'   AND l.CRP = '2+'   AND l.CRE = 1   AND l.LDH = 123;	thrombosis_prediction
SELECT AVG(T2.ALB)  FROM Patient AS T1  JOIN Laboratory AS T2 ON T1.ID = T2.ID  WHERE T1.SEX = 'F' AND T2.PLT > 400 AND T1.Diagnosis = 'SLE';	thrombosis_prediction
SELECT Symptoms FROM Examination WHERE Diagnosis = 'SLE' GROUP BY Symptoms ORDER BY COUNT(*) DESC LIMIT 1	thrombosis_prediction
SELECT T1.Description, T1.Diagnosis FROM Patient AS T1 WHERE T1.ID = 48473;	thrombosis_prediction
SELECT COUNT(ID) FROM Patient WHERE SEX = 'F' AND Diagnosis = 'APS';	thrombosis_prediction
SELECT COUNT(*) FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE strftime('%Y', E.`Examination Date`) = '1997' AND (L.TP > 6 OR L.TP < 8.5);	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T1.Symptoms LIKE '%thrombocytopenia%' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis LIKE '%SLE%'	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(ID) FROM Patient WHERE STRFTIME('%Y', Birthday) = '1980' AND Diagnosis = 'RA'	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE p.SEX = 'M'  AND e.`Examination Date` BETWEEN '1995' AND '1997'  AND p.Diagnosis = 'Behcet'  AND p.Admission = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) AS PatientCount FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE P.SEX = 'F' AND L.WBC < 3.5;	thrombosis_prediction
SELECT DATEDIFF(T1.`Examination Date`, T2.`First Date`) AS DaysBeforeEvaluation FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.ID = 821298;	thrombosis_prediction
SELECT UA FROM Laboratory WHERE ID = 57266 AND (UA > 8.0 OR (UA > 6.5 AND SEX = 'F'));	thrombosis_prediction
SELECT T2.Date FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.ID = 48473 AND T2.GOT >= 60 ORDER BY T2.Date DESC LIMIT 1	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE STRFTIME('%Y', L.Date) = '1994' AND L.GOT < 60;	thrombosis_prediction
SELECT L.ID FROM Laboratory AS L JOIN Patient AS P ON L.ID = P.ID WHERE P.SEX = 'M' AND L.GPT >= 60;	thrombosis_prediction
SELECT P.Diagnosis  FROM Patient AS P  JOIN Laboratory AS L ON P.ID = L.ID  WHERE L.GPT > 60  ORDER BY P.Birthday ASC;	thrombosis_prediction
SELECT AVG(LDH) FROM Laboratory WHERE LDH < 500;	thrombosis_prediction
SELECT P.ID, (strftime('%Y', 'now') - strftime('%Y', P.Birthday)) AS Age FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.LDH BETWEEN 600 AND 800;	thrombosis_prediction
SELECT DISTINCT P.Admission  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.ALP < 300;	thrombosis_prediction
SELECT L.ID, L.ALP FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE P.Birthday = '1982-04-01' AND L.ALP < 300;	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.TP < 6.0;	thrombosis_prediction
SELECT P.ID, P.SEX, L.TP, (L.TP - 8.5) AS Deviation FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'F' AND L.TP > 8.5;	thrombosis_prediction
SELECT P.ID, P.Birthday FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.SEX = 'M' AND (L.ALB <= 3.5 OR L.ALB >= 5.5) ORDER BY P.Birthday DESC;	thrombosis_prediction
SELECT p.ID, p.SEX, l.ALB  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE strftime('%Y', p.Birthday) = '1982' AND l.ALB BETWEEN 3.5 AND 5.5;	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN UA > 8.0 AND SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(SEX) FROM Laboratory INNER JOIN Patient ON Laboratory.ID = Patient.ID WHERE SEX = 'F'	thrombosis_prediction
SELECT AVG(L.UA) AS Average_Uric_Acid FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE L.UA IS NOT NULL AND ((P.SEX = 'M' AND L.UA < 8.0) OR (P.SEX = 'F' AND L.UA < 6.5)) ORDER BY L.Date DESC;	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.UN = 29;	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday  FROM Patient AS P  JOIN Examination AS E ON P.ID = E.ID  WHERE P.Diagnosis = 'RA' AND E.UN < 30;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.CRE >= 1.5;	thrombosis_prediction
SELECT CASE WHEN SUM(CASE WHEN T2.SEX = 'M' AND T1.CRE >= 1.5 THEN 1 ELSE 0 END) > SUM(CASE WHEN T2.SEX = 'F' AND T1.CRE >= 1.5 THEN 1 ELSE 0 END) THEN 'True' ELSE 'False' END AS Result;	thrombosis_prediction
SELECT T2.ID, T2.SEX, T2.Birthday FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID ORDER BY T1.`T-BIL` DESC LIMIT 1	thrombosis_prediction
SELECT SEX, GROUP_CONCAT(DISTINCT ID) AS Patients  FROM Laboratory  WHERE T_BIL >= 2.0  GROUP BY SEX;	thrombosis_prediction
SELECT p.ID, l.`T-CHO` FROM Patient p JOIN Laboratory l ON p.ID = l.ID ORDER BY p.Birthday ASC, l.`T-CHO` DESC LIMIT 1;	thrombosis_prediction
SELECT AVG(STRFTIME('%Y', 'now') - STRFTIME('%Y', Birthday)) FROM Patient WHERE ID IN ( SELECT ID FROM Laboratory WHERE `T-CHO` >= 250 ) AND SEX = 'M'	thrombosis_prediction
SELECT DISTINCT P.ID, P.Diagnosis FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.TG > 300;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.TG >= 200 AND strftime('%Y', 'now') - strftime('%Y', P.Birthday) > 50;	thrombosis_prediction
SELECT DISTINCT ID FROM Laboratory WHERE Admission = '-' AND CPK < 250;	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T1.Birthday) BETWEEN '1936' AND '1956' AND T1.SEX = 'M' AND T2.CPK >= 250;	thrombosis_prediction
SELECT P.ID, P.SEX, (strftime('%Y', 'now') - strftime('%Y', P.Birthday)) AS Age FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GLU >= 180 AND L.`T-CHO` < 250;	thrombosis_prediction
SELECT P.ID, L.GLU FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE STRFTIME('%Y', P.Description) = '1991' AND L.GLU < 180;	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.WBC <= 3.5 OR L.WBC >= 9.0 GROUP BY P.SEX ORDER BY JULIANDAY(P.Birthday) DESC;	thrombosis_prediction
SELECT P.ID, strftime('%Y', 'now') - strftime('%Y', P.Birthday) AS Age, P.Diagnosis FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.RBC < 3.5;	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday, P.Admission, L.RBC FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.SEX = 'F' AND (strftime('%Y', 'now') - strftime('%Y', P.Birthday)) >= 50 AND (L.RBC <= 3.5 OR L.RBC >= 6.0) ORDER BY P.ID;	thrombosis_prediction
SELECT DISTINCT P.ID, P.SEX  FROM Patient AS P  JOIN Laboratory AS L ON P.ID = L.ID  WHERE P.Admission = '-' AND L.HGB < 10;	thrombosis_prediction
SELECT P.ID, P.SEX  FROM Patient AS P  JOIN Examination AS E ON P.ID = E.ID  WHERE E.Diagnosis = 'SLE' AND P.Birthday IS NOT NULL  ORDER BY P.Birthday ASC  LIMIT 1;	thrombosis_prediction
SELECT p.ID, strftime('%Y', 'now') - strftime('%Y', p.Birthday) AS Age FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.HCT >= 52 GROUP BY p.ID HAVING COUNT(l.ID) > 2;	thrombosis_prediction
SELECT AVG(HCT) AS Average_Hematocrit FROM Laboratory WHERE Date LIKE '1991%' AND HCT IS NOT NULL AND HCT < 29;	thrombosis_prediction
SELECT      SUM(CASE WHEN T1.PLT < 100 THEN 1 ELSE 0 END) - SUM(CASE WHEN T1.PLT > 400 THEN 1 ELSE 0 END) AS Calculation FROM      Laboratory AS T1;	thrombosis_prediction
SELECT DISTINCT T1.ID FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T1.Date) = '1984' AND SUBSTR(CAST(strftime('%Y', date('now')) AS text), 1, 4) - SUBSTR(CAST(strftime('%Y', T2.Birthday) AS text), 1, 4) < 50 AND T1.PLT BETWEEN 100 AND 400	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T1.PT >= 14 AND T2.SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T1.PT >= 14 THEN 1 ELSE 0 END) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', 'now') - STRFTIME('%Y', T2.Birthday) > 55;	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday, P.First_Date, L.PT FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE strftime('%Y', P.First_Date) > '1992' AND L.PT < 14;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE `Examination Date` > '1997-01-01' AND APTT = 45;	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.APTT > 45 AND T1.Thrombosis = 0	thrombosis_prediction
SELECT COUNT(DISTINCT L.ID)  FROM Laboratory L  JOIN Patient P ON L.ID = P.ID  WHERE P.SEX = 'M'  AND L.WBC BETWEEN 3.5 AND 9.0  AND (L.FG <= 150 OR L.FG >= 450);	thrombosis_prediction
SELECT COUNT(DISTINCT L.ID) AS NumberOfPatients FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE P.Birthday > '1980-01-01' AND L.FG < 150 OR L.FG > 450;	thrombosis_prediction
SELECT DISTINCT T2.Diagnosis FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.`U-PRO` >= 30	thrombosis_prediction
SELECT DISTINCT L.ID FROM Laboratory AS L JOIN Examination AS E ON L.ID = E.ID WHERE L.`U-PRO` > 0 AND L.`U-PRO` < 30 AND E.Diagnosis = 'SLE';	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE IGG >= 2000;	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.`aCL IgG` BETWEEN 900 AND 2000 AND T1.Symptoms IS NOT NULL	thrombosis_prediction
SELECT T2.Diagnosis  FROM Laboratory AS T1  JOIN Patient AS T2 ON T1.ID = T2.ID  WHERE T1.IGA BETWEEN 80 AND 500  ORDER BY T1.IGA DESC  LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) AS PatientCount FROM Laboratory l JOIN Examination e ON l.ID = e.ID JOIN Patient p ON e.ID = p.ID WHERE l.IGA BETWEEN 80 AND 500 AND STRFTIME('%Y', p.`First Date`) >= '1990';	thrombosis_prediction
SELECT Diagnosis FROM Examination WHERE IGM <= 40 OR IGM >= 400 GROUP BY Diagnosis ORDER BY COUNT(Diagnosis) DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) AS PatientCount FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.CRP = '+' AND T2.Description IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.CRE >= 1.5 AND (strftime('%Y', 'now') - strftime('%Y', p.Birthday)) < 70;	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID)  FROM Examination E  JOIN Patient P ON E.ID = P.ID  WHERE P.Description LIKE '%RA%+-%' AND E.KCT = '+';	thrombosis_prediction
SELECT DISTINCT T1.Diagnosis FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T1.Birthday) >= '1985' AND T2.RA IN ('-', '+-');	thrombosis_prediction
SELECT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Birthday IS NOT NULL AND STRFTIME('%Y', 'now') - STRFTIME('%Y', P.Birthday) > 60 AND L.RF < 20;	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID) AS PatientCount FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE L.RF < 20 AND E.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID)  FROM Examination AS T1  JOIN Patient AS T2 ON T1.ID = T2.ID  WHERE T1.C3 > 35 AND T1.ANA Pattern = 'P';	thrombosis_prediction
SELECT P.ID FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE P.HCT <= 29 OR P.HCT >= 52 ORDER BY E.`aCL IgA` DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID)  FROM Examination AS T1  JOIN Laboratory AS T2 ON T1.ID = T2.ID  WHERE T1.Thrombosis = 1 AND T2.C4 IS NOT NULL AND T2.C4 <= 10;	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.RNP IN ('-', '+-') AND T2.Admission = '+';	thrombosis_prediction
SELECT Birthday FROM Patient WHERE ID = ( SELECT ID FROM Laboratory WHERE RNP NOT IN ('-', '+-') ORDER BY Birthday DESC LIMIT 1 )	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.SM IN ('-', '+-') AND T1.Thrombosis = 0	thrombosis_prediction
SELECT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.SM NOT IN ('negative', '0') ORDER BY P.Birthday DESC LIMIT 3;	thrombosis_prediction
SELECT DISTINCT E.ID FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE E.`Examination Date` > '1997-01-01' AND L.SC170 IN ('negative', '0');	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.SC170 IN ('negative', '0') AND T2.SEX = 'F' AND T1.Symptoms IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.SSA IN ('-', '+') AND strftime('%Y', P.`First Date`) < '2000';	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.SSA NOT IN ('negative', '0') ORDER BY T1.`First Date` ASC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID)  FROM Examination AS T1  JOIN Laboratory AS T2 ON T1.ID = T2.ID  WHERE T2.SSB IN ('-', '+-') AND T1.Diagnosis = 'SLE';	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.SSB IN ('negative', '0') AND T1.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) AS Male_Patients FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.CENTROMEA IN ('-', '+-') AND L.SSB IN ('-', '+-');	thrombosis_prediction
SELECT DISTINCT T1.Diagnosis  FROM Patient AS T1  JOIN Laboratory AS T2 ON T1.ID = T2.ID  WHERE T2.DNA >= 8;	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.DNA < 8 AND T2.Description IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) AS NumberOfPatients FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '+' AND l.IGG BETWEEN 900 AND 2000;	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T2.GOT >= 60 AND T2.Diagnosis = 'SLE' THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T2.GOT >= 60 THEN 1 ELSE 0 END) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) AS Male_Patients_Normal_GOT FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.GOT < 60;	thrombosis_prediction
SELECT Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.GOT >= 60 ORDER BY Patient.Birthday DESC LIMIT 1;	thrombosis_prediction
SELECT T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GPT IS NOT NULL AND T2.GPT < 60 ORDER BY T2.GPT DESC LIMIT 3	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) AS Male_Patients_with_Normal_GOT FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.GOT < 60;	thrombosis_prediction
SELECT MIN(T2.`First Date`) AS First_Date FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.LDH < 500;	thrombosis_prediction
SELECT T1.`First Date`, T2.LDH FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.LDH >= 500 ORDER BY T1.`First Date` DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.ALP >= 300 AND T2.Admission = '+'	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) AS Normal_ALP_Patients FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '-' AND T2.ALP < 300;	thrombosis_prediction
SELECT DISTINCT T2.Diagnosis FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.TP < 6.0;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) AS Normal_TP_SJS_Patients FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.Diagnosis LIKE '%SJS%' AND P.TP BETWEEN 6.0 AND 8.5;	thrombosis_prediction
SELECT T1.`Examination Date` FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.ALB BETWEEN 3.5 AND 5.5 ORDER BY T2.ALB DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.SEX = 'M'  AND Laboratory.ALB BETWEEN 3.5 AND 5.5  AND Laboratory.TP BETWEEN 6.0 AND 8.5;	thrombosis_prediction
SELECT T1.`aCL IgG`, T1.`aCL IgM`, T1.`aCL IgA` FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.SEX = 'F' AND T1.UA > 6.50 ORDER BY T1.UA DESC LIMIT 1;	thrombosis_prediction
SELECT MAX(T1.ANA) AS Highest_ANA FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.CRE < 1.5;	thrombosis_prediction
SELECT T1.ID FROM Laboratory AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.CRE < 1.5 ORDER BY T2.`aCL IgA` DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.`T-BIL` >= 2.0 AND T1.`ANA Pattern` LIKE '%P%'	thrombosis_prediction
SELECT T1.ANA FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.`T-BIL` = ( SELECT MAX(`T-BIL`) FROM Laboratory )	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) AS NegativeCoagulationCount FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.T_cho >= 250 AND P.KCT = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) AS PatientCount FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE e.ANA_Pattern = 'P' AND l.T_CHO < 250;	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.TG < 200 AND T1.Symptoms IS NOT NULL	thrombosis_prediction
SELECT T2.Diagnosis FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.TG IS NOT NULL AND T1.TG < 200 ORDER BY T1.TG DESC LIMIT 1;	thrombosis_prediction
SELECT T1.ID FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Thrombosis = 0 AND T2.CPK < 250;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) AS PatientCount FROM Examination E JOIN Laboratory L ON E.ID = L.ID JOIN Patient P ON E.ID = P.ID WHERE E.CPK < 250 AND (E.KCT = '+' OR E.RVVT = '+' OR E.LAC = '+');	thrombosis_prediction
SELECT T2.Birthday FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.GLU > 180 ORDER BY T2.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) AS PatientCount FROM Examination e JOIN Laboratory l ON e.ID = l.ID JOIN Patient p ON e.ID = p.ID WHERE e.Thrombosis = 0 AND l.GLU < 180;	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Patient WHERE Admission = '+' AND WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) AS PatientCount FROM Laboratory AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'SLE' AND T1.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT DISTINCT L.ID FROM Laboratory AS L JOIN Patient AS P ON L.ID = P.ID WHERE L.RBC <= 3.5 OR L.RBC >= 6.0 AND P.Admission = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) AS PatientCount FROM Laboratory AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.PLT BETWEEN 100 AND 400 AND T2.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT T1.PLT FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'MCTD' AND T1.PLT BETWEEN 100 AND 400	thrombosis_prediction
SELECT AVG(T1.PT) AS AverageProthrombinTime FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.SEX = 'M' AND T1.PT IS NOT NULL AND T1.PT < 14;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination  WHERE Thrombosis IN (1, 2) AND PT < 14;	thrombosis_prediction
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Angela' AND T1.last_name = 'Sanders';	student_club
SELECT COUNT(*) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.college = 'College of Engineering';	student_club
SELECT m.first_name, m.last_name  FROM member m  JOIN major mj ON m.link_to_major = mj.major_id  WHERE mj.department = 'Art and Design';	student_club
SELECT COUNT(*) FROM attendance AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'Women''s Soccer';	student_club
SELECT T1.phone FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'Women''s Soccer'	student_club
SELECT COUNT(*) FROM member AS m JOIN attendance AS a ON m.member_id = a.link_to_member JOIN event AS e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer' AND m.t_shirt_size = 'Medium';	student_club
SELECT T1.event_name FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T2.link_to_member IN ( SELECT member_id FROM member WHERE position = 'Student' ) GROUP BY T1.event_name ORDER BY COUNT(T2.link_to_event) DESC LIMIT 1	student_club
SELECT T1.college FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.position = 'Vice President'	student_club
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.first_name = 'Maya' AND m.last_name = 'Mclean';	student_club
SELECT COUNT(*)  FROM event  JOIN attendance ON event.event_id = attendance.link_to_event  JOIN member ON attendance.link_to_member = member.member_id  WHERE member.first_name = 'Sacha' AND member.last_name = 'Harrison' AND STRFTIME('%Y', event.event_date) = '2019';	student_club
SELECT COUNT(T1.event_id) FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.type = 'Meeting' GROUP BY T1.event_id HAVING COUNT(T2.link_to_member) > 10	student_club
SELECT T1.event_name FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event GROUP BY T1.event_name HAVING COUNT(T2.link_to_member) > 20 AND T1.type != 'Fundraiser'	student_club
SELECT CAST(COUNT(event_id) AS REAL) / COUNT(DISTINCT event_name) AS average_attendance FROM event WHERE type = 'Meeting' AND strftime('%Y', event_date) = '2020';	student_club
SELECT expense_description, MAX(cost) AS max_cost FROM expense WHERE link_to_budget IN (SELECT budget_id FROM budget WHERE event_status = 'Closed') ORDER BY max_cost DESC LIMIT 1;	student_club
SELECT COUNT(*) FROM member AS m JOIN major AS mj ON m.link_to_major = mj.major_id WHERE mj.major_name = 'Environmental Engineering';	student_club
SELECT T1.first_name, T1.last_name  FROM member AS T1  JOIN attendance AS T2 ON T1.member_id = T2.link_to_member  JOIN event AS T3 ON T2.link_to_event = T3.event_id  WHERE T3.event_name = 'Laugh Out Loud';	student_club
SELECT T1.last_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Law and Constitutional Studies'	student_club
SELECT T1.county FROM zip_code AS T1 INNER JOIN member AS T2 ON T2.zip = T1.zip_code WHERE T2.first_name = 'Sherri' AND T2.last_name = 'Ramsey';	student_club
SELECT T1.college FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Tyler' AND T2.last_name = 'Hewitt';	student_club
SELECT SUM(amount) AS total_funds_received FROM income JOIN member ON income.link_to_member = member.member_id WHERE member.position = 'Vice President';	student_club
SELECT SUM(b.spent) AS total_spent_on_food FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE b.category = 'Food' AND e.event_name = 'September Meeting';	student_club
SELECT T1.city, T1.state FROM zip_code AS T1 INNER JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T2.position = 'President';	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T2.state = 'IL';	student_club
SELECT SUM(T1.spent) AS total_spent FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'September Meeting' AND T1.category = 'Advertisement';	student_club
SELECT T1.department FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Pierce' AND T2.last_name = 'Guidi' OR T2.first_name = 'Luisa' AND T2.last_name = 'Guidi'	student_club
SELECT SUM(T1.amount) AS total_budgeted_amount FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'October Speaker';	student_club
SELECT e.expense_description, e.approved FROM expense e JOIN attendance a ON e.link_to_member = a.link_to_member JOIN event ev ON a.link_to_event = ev.event_id WHERE ev.event_name = 'October Meeting' AND ev.event_date LIKE '2019-10-08%' ORDER BY e.expense_id;	student_club
SELECT AVG(cost) AS average_cost FROM expense JOIN member ON expense.link_to_member = member.member_id WHERE first_name = 'Elijah' AND last_name = 'Allen' AND strftime('%m', expense_date) IN ('09', '10');	student_club
SELECT SUM(CASE WHEN strftime('%Y', T1.event_date) = '2019' THEN T2.spent ELSE 0 END) - SUM(CASE WHEN strftime('%Y', T1.event_date) = '2020' THEN T2.spent ELSE 0 END) AS difference FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event;	student_club
SELECT location FROM event WHERE event_name = 'Spring Budget Review';	student_club
SELECT T1.cost FROM expense AS T1 JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id WHERE T1.expense_description = 'Posters' AND T1.expense_date = '2019-09-04';	student_club
SELECT remaining FROM budget WHERE category = 'Food' AND amount = ( SELECT MAX(amount) FROM budget WHERE category = 'Food' );	student_club
SELECT notes FROM income WHERE date_received = '2019-09-14' AND source = 'Fundraising'	student_club
SELECT COUNT(*) FROM major WHERE college = 'College of Humanities and Social Sciences';	student_club
SELECT phone FROM member WHERE first_name = 'Carlo' AND last_name = 'Jacobs';	student_club
SELECT T1.county FROM zip_code AS T1 INNER JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T2.first_name = 'Adela' AND T2.last_name = 'O''Gallagher';	student_club
SELECT COUNT(*) FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'November Meeting' AND T1.remaining < 0	student_club
SELECT SUM(T1.amount) AS total_budget_amount FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'September Speaker';	student_club
SELECT T2.event_status FROM expense AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.expense_description = 'Post Cards, Posters' AND T1.expense_date = '2019-8-20'	student_club
SELECT T1.major_name FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Brent' AND T2.last_name = 'Thomason';	student_club
SELECT COUNT(*) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Business' AND T1.t_shirt_size = 'Medium';	student_club
SELECT T2.type FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Christof' AND T1.last_name = 'Nielsen';	student_club
SELECT T1.major_name FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.position = 'Vice President'	student_club
SELECT T1.state FROM zip_code AS T1 INNER JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T2.first_name = 'Sacha' AND T2.last_name = 'Harrison'	student_club
SELECT T1.department FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.position = 'President'	student_club
SELECT T1.date_received  FROM income AS T1  JOIN member AS T2 ON T1.link_to_member = T2.member_id  WHERE T2.first_name = 'Connor' AND T2.last_name = 'Hilton' AND T1.source = 'Dues';	student_club
SELECT first_name, last_name FROM member WHERE link_to_income IN (SELECT income_id FROM income WHERE source = 'Dues' ORDER BY date_received ASC LIMIT 1)	student_club
SELECT CAST(SUM(CASE WHEN T2.event_name = 'Yearly Kickoff' THEN amount ELSE 0 END) AS REAL) / SUM(CASE WHEN T2.event_name = 'October Meeting' THEN amount ELSE 0 END) AS ratio FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Advertisement';	student_club
SELECT CAST(SUM(CASE WHEN T1.category = 'Parking' THEN T1.amount ELSE 0 END) AS REAL) * 100 / COUNT(T2.event_name) AS percentage FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'November Speaker';	student_club
SELECT SUM(cost) AS total_cost_of_pizzas FROM expense WHERE expense_description = 'Pizza';	student_club
SELECT COUNT(DISTINCT city) FROM zip_code WHERE county = 'Orange County' AND state = 'Virginia';	student_club
SELECT DISTINCT department FROM major WHERE college = 'College of Humanities and Social Sciences';	student_club
SELECT T1.city, T1.county, T1.state FROM zip_code AS T1 INNER JOIN member AS T2 ON T2.zip = T1.zip_code WHERE T2.first_name = 'Amy' AND T2.last_name = 'Firth';	student_club
SELECT T1.expense_description FROM expense AS T1 JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id ORDER BY T2.remaining ASC LIMIT 1;	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member WHERE T2.link_to_event = (SELECT event_id FROM event WHERE event_name = 'October Meeting')	student_club
SELECT T1.college FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major GROUP BY T1.college ORDER BY COUNT(T1.college) DESC LIMIT 1	student_club
SELECT T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.phone = '809-555-3360';	student_club
SELECT T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event ORDER BY T2.amount DESC LIMIT 1;	student_club
SELECT e.expense_description, e.expense_date, e.cost  FROM expense e  JOIN member m ON e.link_to_member = m.member_id  WHERE m.position = 'Vice President'  ORDER BY e.expense_date DESC;	student_club
SELECT COUNT(*) FROM attendance AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'Women''s Soccer'	student_club
SELECT T1.date_received FROM income AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Casey' AND T2.last_name = 'Mason';	student_club
SELECT COUNT(*) FROM zip_code WHERE state = 'MD';	student_club
SELECT COUNT(*) FROM attendance AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.phone = '954-555-6240';	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT e.event_name, b.spent, b.amount, (b.spent / b.amount) AS ratio FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.status = 'Closed' ORDER BY ratio DESC LIMIT 1;	student_club
SELECT COUNT(*) FROM member WHERE position = 'President';	student_club
SELECT MAX(spent) FROM budget;	student_club
SELECT COUNT(*) FROM event WHERE type = 'Meeting' AND STRFTIME('%Y', event_date) = '2020';	student_club
SELECT SUM(spent) AS total_spent_for_food FROM budget WHERE category = 'Food';	student_club
SELECT T.first_name, T.last_name FROM ( SELECT T1.first_name, T1.last_name, COUNT(T2.link_to_event) AS num_events FROM member AS T1 INNER JOIN attendance AS T2 ON T1.member_id = T2.link_to_member GROUP BY T1.first_name, T1.last_name ) AS T WHERE T.num_events > 7	student_club
SELECT T2.first_name, T2.last_name FROM attendance AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id INNER JOIN event AS T3 ON T1.link_to_event = T3.event_id INNER JOIN major AS T4 ON T2.link_to_major = T4.major_id WHERE T3.event_name = 'Community Theater' AND T4.major_name = 'Interior Design'	student_club
SELECT first_name, last_name FROM member WHERE zip IN (SELECT zip_code FROM zip_code WHERE city = 'Georgetown' AND state = 'SC')	student_club
SELECT SUM(amount) AS total_income FROM income JOIN member ON income.link_to_member = member.member_id WHERE first_name = 'Grant' AND last_name = 'Gilmour';	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T2.amount > 40;	student_club
SELECT SUM(T2.cost) AS total_expense FROM event AS T1 JOIN expense AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'Yearly Kickoff';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Yearly Kickoff';	student_club
SELECT m.first_name, m.last_name, i.source, SUM(i.amount) AS total_income FROM member m JOIN income i ON m.member_id = i.link_to_member GROUP BY m.member_id ORDER BY total_income DESC LIMIT 1;	student_club
SELECT T1.event_name FROM event AS T1 JOIN expense AS T2 ON T1.event_id = T2.link_to_event ORDER BY T2.cost ASC LIMIT 1	student_club
SELECT CAST(SUM(CASE WHEN T2.event_name = 'Yearly Kickoff' THEN T1.cost ELSE 0 END) AS REAL) * 100 / SUM(T1.cost) FROM expense AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id;	student_club
SELECT CAST(SUM(CASE WHEN T1.major_name = 'Finance' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T1.major_name = 'Physics' THEN 1 ELSE 0 END) FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major	student_club
SELECT source, SUM(amount) AS total_amount FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' GROUP BY source ORDER BY total_amount DESC LIMIT 1;	student_club
SELECT first_name, last_name, email FROM member WHERE position = 'Secretary';	student_club
SELECT COUNT(*) FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Physics Teaching';	student_club
SELECT COUNT(*) AS member_count  FROM attendance  JOIN event ON attendance.link_to_event = event.event_id  WHERE event.event_name = 'Community Theater' AND STRFTIME('%Y', event.event_date) = '2019';	student_club
SELECT COUNT(a.link_to_event) AS num_events_attended, m.major_name FROM attendance a JOIN member mem ON a.link_to_member = mem.member_id JOIN major m ON mem.link_to_major = m.major_id WHERE mem.first_name = 'Luisa' AND mem.last_name = 'Guidi';	student_club
SELECT AVG(b.spent) AS average_food_spent FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE b.category = 'Food' AND e.status = 'Closed';	student_club
SELECT T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Advertisement' ORDER BY T2.spent DESC LIMIT 1;	student_club
SELECT CASE WHEN EXISTS (     SELECT 1     FROM attendance AS T1     JOIN member AS T2 ON T1.link_to_member = T2.member_id     JOIN event AS T3 ON T1.link_to_event = T3.event_id     WHERE T2.first_name = 'Maya' AND T2.last_name = 'Mclean' AND T3.event_name = 'Women''s Soccer' ) THEN 'Yes' ELSE 'No' END AS attended;	student_club
SELECT CAST(SUM(CASE WHEN type = 'Community Service' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(event_id) AS percentage_share FROM event WHERE event_date BETWEEN '2019-01-01' AND '2019-12-31';	student_club
SELECT T2.cost FROM event AS T1 INNER JOIN expense AS T2 ON T1.event_id = T2.link_to_event WHERE T2.expense_description = 'Posters' AND T1.event_name = 'September Speaker';	student_club
SELECT t_shirt_size FROM member GROUP BY t_shirt_size ORDER BY COUNT(t_shirt_size) DESC LIMIT 1	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.status = 'Closed' AND b.remaining < 0 ORDER BY b.remaining ASC LIMIT 1;	student_club
SELECT T2.expense_type, SUM(T2.cost) AS total_value FROM event AS T1 JOIN expense AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'October Meeting' GROUP BY T2.expense_type;	student_club
SELECT category, SUM(amount) AS total_amount FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event_name = 'April Speaker' GROUP BY category ORDER BY total_amount ASC;	student_club
SELECT budget_id FROM budget WHERE category = 'Food' ORDER BY amount DESC LIMIT 1	student_club
SELECT budget_id, amount FROM budget WHERE category = 'Advertisement' ORDER BY amount DESC LIMIT 3	student_club
SELECT SUM(cost) AS total_cost_spent_for_parking FROM expense WHERE expense_description = 'Parking';	student_club
SELECT SUM(cost) AS total_expense FROM expense WHERE expense_date = '2019-08-20';	student_club
SELECT T1.first_name, T1.last_name, SUM(T2.cost) AS total_cost FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.link_to_member = 'rec4BLdZHS2Blfp4v' GROUP BY T1.first_name, T1.last_name;	student_club
SELECT T1.expense_description FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Sacha' AND T2.last_name = 'Harrison';	student_club
SELECT T2.expense_description FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T1.t_shirt_size = 'X-Large';	student_club
SELECT DISTINCT T1.zip FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.cost < 50;	student_club
SELECT T1.major_name FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Phillip' AND T2.last_name = 'Cullen'	student_club
SELECT T1.position FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Business'	student_club
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Business' AND member.t_shirt_size = 'Medium';	student_club
SELECT DISTINCT T1.type FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.remaining > 30;	student_club
SELECT DISTINCT type FROM event WHERE location = 'MU 215' ORDER BY event_name;	student_club
SELECT T1.category FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_date = '2020-03-24T12:00:00'	student_club
SELECT T1.major_name FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.position = 'Vice President';	student_club
SELECT CAST(SUM(CASE WHEN T1.position = 'Member' AND T2.major_name = 'Business' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.member_id) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id;	student_club
SELECT DISTINCT T1.category FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.location = 'MU 215';	student_club
SELECT COUNT(*) FROM income WHERE amount = 50;	student_club
SELECT COUNT(*) FROM member WHERE t_shirt_size = 'X-Large' AND position = 'Member';	student_club
SELECT COUNT(major_id) FROM major WHERE college = 'College of Agriculture and Applied Sciences' AND department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT T1.last_name, T2.department, T2.college FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Environmental Engineering';	student_club
SELECT T1.category  FROM budget AS T1  JOIN event AS T2 ON T1.link_to_event = T2.event_id  WHERE T2.location = 'MU 215' AND T2.type = 'Guest Speaker' AND T1.spent = 0;	student_club
SELECT T1.city, T1.state FROM zip_code AS T1 INNER JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T2.position = 'Member' AND T2.link_to_major IN ( SELECT major_id FROM major WHERE department = 'Electrical and Computer Engineering Department' );	student_club
SELECT e.event_name  FROM event e  JOIN attendance a ON e.event_id = a.link_to_event  JOIN member m ON a.link_to_member = m.member_id  WHERE m.position = 'Vice President' AND e.location = '900 E. Washington St.' AND e.type = 'Social';	student_club
SELECT T1.last_name, T1.position  FROM member AS T1  JOIN expense AS T2 ON T1.member_id = T2.link_to_member  WHERE T2.expense_date = '2019-09-10' AND T2.expense_description = 'Pizza';	student_club
SELECT T2.last_name FROM attendance AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id INNER JOIN event AS T3 ON T1.link_to_event = T3.event_id WHERE T3.event_name = 'Women''s Soccer' AND T2.position = 'Member'	student_club
SELECT CAST(SUM(CASE WHEN T2.amount = 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.member_id) AS percentage FROM member AS T1 JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T1.t_shirt_size = 'Medium';	student_club
SELECT DISTINCT county FROM zip_code WHERE type = 'PO Box';	student_club
SELECT DISTINCT zip_code FROM zip_code WHERE city = 'San Juan Municipio' AND state = 'Puerto Rico' AND type = 'PO Box'	student_club
SELECT event_name FROM event WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20';	student_club
SELECT DISTINCT T1.link_to_event  FROM attendance AS T1  JOIN expense AS T2 ON T1.link_to_event = T2.link_to_event  WHERE T2.cost > 50;	student_club
SELECT m.first_name, m.last_name, e.event_name, e.event_date FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN expense e ON a.link_to_event = e.link_to_budget WHERE e.approved = 'true' AND e.expense_date BETWEEN '2019-01-10' AND '2019-11-19';	student_club
SELECT T1.college FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Katy' AND T2.link_to_major = 'rec1N0upiVLy5esTO';	student_club
SELECT T1.phone FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.college = 'College of Agriculture and Applied Sciences' AND T2.major_name = 'Business';	student_club
SELECT T1.email FROM member AS T1 INNER JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T2.amount > 20 AND T2.date_received BETWEEN '2019-09-10' AND '2019-11-19'	student_club
SELECT COUNT(*) FROM member AS m JOIN major AS mj ON m.link_to_major = mj.major_id WHERE mj.major_name = 'Education' AND m.position = 'Member';	student_club
SELECT CAST(SUM(CASE WHEN remaining < 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(event_id) FROM budget	student_club
SELECT event_id, location, status FROM event WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31';	student_club
SELECT expense_description  FROM expense  GROUP BY expense_description  HAVING AVG(cost) > 50;	student_club
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large';	student_club
SELECT CAST(COUNT(CASE WHEN type = 'PO Box' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(zip_code) FROM zip_code	student_club
SELECT e.event_name, e.location  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  WHERE b.remaining > 0;	student_club
SELECT e.event_name, e.event_date FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN expense ex ON a.link_to_member = ex.link_to_member WHERE ex.expense_description = 'Pizza' AND ex.cost BETWEEN 50 AND 100;	student_club
SELECT T1.first_name, T1.last_name, T3.major_name FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member JOIN budget AS T3 ON T2.link_to_event = T3.link_to_event JOIN expense AS T4 ON T3.budget_id = T4.link_to_budget WHERE T4.cost > 100;	student_club
SELECT z.city, z.county FROM zip_code z JOIN event e ON z.zip_code = e.zip WHERE e.event_id IN (     SELECT link_to_event     FROM budget     GROUP BY link_to_event     HAVING SUM(amount) > 40 * 50 )	student_club
SELECT T1.first_name, T1.last_name, SUM(T2.cost) AS total_spent FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member GROUP BY T1.member_id HAVING COUNT(DISTINCT T2.link_to_event) > 1 ORDER BY total_spent DESC LIMIT 1	student_club
SELECT AVG(T1.cost) AS average_amount_paid FROM expense AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.position != 'Member';	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event JOIN expense ex ON b.budget_id = ex.link_to_budget WHERE ex.expense_description = 'Parking' AND ex.cost < (     SELECT AVG(cost)     FROM expense     WHERE category = 'Parking' );	student_club
SELECT CAST(SUM(CASE WHEN T2.type = 'Meeting' THEN T1.cost ELSE 0 END) AS REAL) * 100 / COUNT(T1.expense_id) FROM expense AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id	student_club
SELECT T1.budget_id, T1.spent, T1.remaining, T1.amount, T1.event_status  FROM budget AS T1  JOIN expense AS T2 ON T1.budget_id = T2.link_to_budget  WHERE T2.expense_description = 'Water, chips, cookies'  ORDER BY T1.spent DESC  LIMIT 1;	student_club
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_spent FROM member m JOIN expense e ON m.member_id = e.link_to_member GROUP BY m.member_id ORDER BY total_spent DESC LIMIT 5;	student_club
SELECT m.first_name, m.last_name, m.phone FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN budget b ON a.link_to_event = b.link_to_event JOIN expense e ON b.budget_id = e.link_to_budget WHERE e.cost > (SELECT AVG(cost) FROM expense) GROUP BY m.member_id;	student_club
SELECT      ((SUM(CASE WHEN T2.state = 'New Jersey' THEN 1 ELSE 0 END) / COUNT(T1.position)) * 100) -     ((SUM(CASE WHEN T2.state = 'Vermont' THEN 1 ELSE 0 END) / COUNT(T1.position)) * 100) AS difference_percentage FROM      member AS T1 JOIN      zip_code AS T2 ON T1.zip = T2.zip_code WHERE      T1.position = 'Member';	student_club
SELECT T2.major_name, T2.department FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Garrett' AND T1.last_name = 'Gerke';	student_club
SELECT T1.first_name, T1.last_name, T2.cost  FROM member AS T1  JOIN expense AS T2 ON T1.member_id = T2.link_to_member  WHERE T2.expense_description = 'Water, Veggie tray, supplies';	student_club
SELECT T1.last_name, T1.phone FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Elementary Education';	student_club
SELECT T2.category, T2.amount  FROM event AS T1  JOIN budget AS T2 ON T1.event_id = T2.link_to_event  WHERE T1.event_name = 'January Speaker';	student_club
SELECT T1.event_name FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Food';	student_club
SELECT member.first_name, member.last_name, income.amount  FROM income  JOIN member ON income.link_to_member = member.member_id  WHERE income.date_received = '2019-09-09';	student_club
SELECT T1.category FROM budget AS T1 INNER JOIN expense AS T2 ON T1.budget_id = T2.link_to_budget WHERE T2.expense_description = 'Posters';	student_club
SELECT m.first_name, m.last_name, ma.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.position = 'Secretary';	student_club
SELECT SUM(b.spent), e.event_name FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE b.category = 'Speaker Gifts';	student_club
SELECT T2.city FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Garrett' AND T1.last_name = 'Gerke';	student_club
SELECT T1.first_name, T1.last_name, T1.position FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T2.city = 'Lincolnton' AND T2.state = 'North Carolina';	student_club
SELECT COUNT(GasStationID) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Premium';	debit_card_specializing
SELECT CAST(SUM(CASE WHEN Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN Currency = 'CZK' THEN 1 ELSE 0 END) AS Ratio FROM customers;	debit_card_specializing
SELECT c.CustomerID, c.Segment, y.Consumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE y.Date LIKE '2012%' AND c.Segment = 'LAM' ORDER BY y.Consumption ASC LIMIT 1;	debit_card_specializing
SELECT AVG(Consumption) AS AvgMonthlyConsumption FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE Segment = 'SME' AND Date BETWEEN '201301' AND '201312';	debit_card_specializing
SELECT c.CustomerID, SUM(y.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Currency = 'CZK' AND y.Date BETWEEN '201101' AND '201112' GROUP BY c.CustomerID ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT COUNT(CustomerID) FROM yearmonth WHERE CustomerID IN ( SELECT CustomerID FROM customers WHERE Segment = 'KAM' ) AND Date BETWEEN '201201' AND '201212' AND Consumption < 30000;	debit_card_specializing
SELECT SUM(CASE WHEN c.Currency = 'CZK' THEN y.Consumption ELSE 0 END) - SUM(CASE WHEN c.Currency = 'EUR' THEN y.Consumption ELSE 0 END) AS ConsumptionDifference FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE y.Date BETWEEN '201201' AND '201212';	debit_card_specializing
SELECT T1.Date FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Currency = 'EUR' ORDER BY T1.Consumption DESC LIMIT 1	debit_card_specializing
SELECT T2.Segment FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID GROUP BY T2.Segment ORDER BY SUM(T1.Consumption) ASC LIMIT 1	debit_card_specializing
SELECT SUBSTR(Date, 1, 4) AS Year, SUM(Consumption) AS TotalConsumption FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE customers.Currency = 'CZK' GROUP BY Year ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT T1.Date, T1.Consumption  FROM yearmonth AS T1  JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID  WHERE T2.Segment = 'SME' AND T1.Date LIKE '2013%'  ORDER BY T1.Consumption DESC  LIMIT 1;	debit_card_specializing
WITH LowConsumption AS (     SELECT          Segment,          AVG(Consumption) AS AvgConsumption     FROM          yearmonth     WHERE          Date BETWEEN '201301' AND '201312'     GROUP BY          CustomerID,          Segment ), LowestAvgConsumption AS (     SELECT          MIN(AvgConsumption) AS MinAvg     FROM          LowConsumption ) SELECT      (SELECT AvgConsumption FROM LowConsumption WHERE Segment = 'SME') -      (SELECT AvgConsumption FROM LowConsumption WHERE Segment = 'LAM') AS Diff_SME_LAM,     (SELECT AvgConsumption FROM LowConsumption WHERE Segment = 'LAM') -      (SELECT AvgConsumption FROM LowConsumption WHERE Segment = 'KAM') AS Diff_LAM_KAM,     (SELECT AvgConsumption FROM LowConsumption WHERE Segment = 'KAM') -      (SELECT AvgConsumption FROM LowConsumption WHERE Segment = 'SME') AS Diff_KAM_SME;	debit_card_specializing
SELECT Segment,         ((SUM(CASE WHEN SUBSTR(Date, 1, 4) = '2013' THEN Consumption ELSE 0 END) -          SUM(CASE WHEN SUBSTR(Date, 1, 4) = '2012' THEN Consumption ELSE 0 END)) /         SUM(CASE WHEN SUBSTR(Date, 1, 4) = '2013' THEN Consumption ELSE 0 END)) * 100 AS PercentageChange FROM customers JOIN yearmonth ON customers.CustomerID = yearmonth.CustomerID WHERE Currency = 'EUR' GROUP BY Segment ORDER BY PercentageChange DESC, PercentageChange ASC;	debit_card_specializing
SELECT SUM(Consumption) AS TotalConsumption FROM yearmonth WHERE CustomerID = 6 AND Date BETWEEN '201308' AND '201311';	debit_card_specializing
SELECT SUM(CASE WHEN Country = 'CZE' THEN 1 ELSE 0 END) - SUM(CASE WHEN Country = 'SVK' THEN 1 ELSE 0 END) AS DiscountDifference FROM gasstations;	debit_card_specializing
SELECT T1.Consumption - T2.Consumption FROM yearmonth AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.CustomerID = 7 AND T1.Date = '201304' AND T2.CustomerID = 5 AND T2.Date = '201304'	debit_card_specializing
SELECT SUM(CASE WHEN T1.Currency = 'CZK' THEN 1 ELSE 0 END) - SUM(CASE WHEN T1.Currency = 'EUR' THEN 1 ELSE 0 END) AS Difference FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'SME';	debit_card_specializing
SELECT c.CustomerID, c.Segment, c.Currency, y.Consumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID AND y.Date = '201310' WHERE c.Segment = 'LAM' AND c.Currency = 'EUR' ORDER BY y.Consumption DESC LIMIT 1;	debit_card_specializing
SELECT c.CustomerID, SUM(y.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'KAM' GROUP BY c.CustomerID ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT SUM(Consumption) AS TotalConsumption FROM yearmonth WHERE CustomerID IN (     SELECT CustomerID     FROM customers     WHERE Segment = 'KAM' ) AND Date = '201305';	debit_card_specializing
SELECT CAST(SUM(CASE WHEN T2.Consumption > 46.73 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.CustomerID) FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM';	debit_card_specializing
SELECT Country, COUNT(*) AS NumberOfValueForMoneyStations FROM gasstations WHERE Segment = 'Value for money' GROUP BY Country;	debit_card_specializing
SELECT CAST(SUM(CASE WHEN T1.Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS Percentage FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'KAM';	debit_card_specializing
SELECT CAST(SUM(CASE WHEN Consumption > 528.3 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(CustomerID) FROM yearmonth WHERE Date LIKE '201202%'	debit_card_specializing
SELECT CAST(SUM(CASE WHEN Segment = 'Premium' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM gasstations WHERE Country = 'SVK';	debit_card_specializing
SELECT CustomerID FROM yearmonth WHERE Date = '201309' ORDER BY Consumption DESC LIMIT 1;	debit_card_specializing
SELECT T2.Segment FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date = '201309' ORDER BY T1.Consumption ASC LIMIT 1	debit_card_specializing
SELECT c.CustomerID, c.Segment, SUM(y.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE y.Date = '201206' AND c.Segment = 'SME' GROUP BY c.CustomerID ORDER BY TotalConsumption ASC LIMIT 1	debit_card_specializing
SELECT MAX(Consumption) AS HighestMonthlyConsumption FROM yearmonth WHERE Date LIKE '2012%';	debit_card_specializing
SELECT MAX(Consumption) AS MaxMonthlyConsumption FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE customers.Currency = 'EUR';	debit_card_specializing
SELECT T2.Description FROM transactions_1k AS T1 INNER JOIN products AS T2 ON T1.ProductID = T2.ProductID WHERE STRFTIME('%Y%m', T1.Date) = '201309'	debit_card_specializing
SELECT DISTINCT T2.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date LIKE '201306%'	debit_card_specializing
SELECT DISTINCT T1.ChainID  FROM gasstations AS T1  JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID  WHERE T1.Country = 'CZE' AND T2.Currency = 'EUR';	debit_card_specializing
SELECT T1.Description FROM products AS T1 INNER JOIN transactions_1k AS T2 ON T1.ProductID = T2.ProductID WHERE T2.Currency = 'EUR'	debit_card_specializing
SELECT AVG(Price) AS AverageTotalPrice FROM transactions_1k WHERE Date LIKE '2012-01%';	debit_card_specializing
SELECT COUNT(DISTINCT ym.CustomerID) AS CustomerCount FROM yearmonth ym JOIN customers c ON ym.CustomerID = c.CustomerID WHERE c.Currency = 'EUR' AND ym.Consumption > 1000;	debit_card_specializing
SELECT DISTINCT p.Description FROM products AS p JOIN transactions_1k AS t ON p.ProductID = t.ProductID JOIN gasstations AS g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE';	debit_card_specializing
SELECT DISTINCT Time FROM transactions_1k WHERE GasStationID IN ( SELECT GasStationID FROM gasstations WHERE ChainID = 11 )	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE' AND T1.Price > 1000;	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE' AND T1.Date > '2012-01-01';	debit_card_specializing
SELECT AVG(T1.Price) AS AverageTotalPrice FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE';	debit_card_specializing
SELECT AVG(TotalPrice) AS AverageTotalPrice FROM (     SELECT SUM(Price * Amount) AS TotalPrice     FROM transactions_1k     JOIN customers ON transactions_1k.CustomerID = customers.CustomerID     WHERE Currency = 'EUR' ) AS SubQuery;	debit_card_specializing
SELECT c.CustomerID, SUM(t.Amount) AS TotalSpent FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE t.Date = '2012-08-25' GROUP BY c.CustomerID ORDER BY TotalSpent DESC LIMIT 1;	debit_card_specializing
SELECT T2.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-25' ORDER BY T1.Time ASC LIMIT 1	debit_card_specializing
SELECT T1.Currency FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '2012-08-24' AND T2.Time = '16:25:00'	debit_card_specializing
SELECT Segment FROM customers WHERE CustomerID = (     SELECT CustomerID FROM transactions_1k WHERE Date = '2012-08-23' AND Time = '21:20:00' )	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k  WHERE Date = '2012-08-26' AND Time < '13:00:00';	debit_card_specializing
SELECT Segment FROM customers ORDER BY CustomerID ASC LIMIT 1	debit_card_specializing
SELECT T2.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-24' AND T1.Time = '12:42:00'	debit_card_specializing
SELECT ProductID FROM transactions_1k WHERE Date = '2012-08-23' AND Time = '21:20:00';	debit_card_specializing
SELECT T2.Date, T2.Amount, SUM(T2.Amount) AS TotalSpent FROM transactions_1k AS T2 JOIN customers AS T1 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '2012-08-24' AND T2.Amount = 124.05 AND T1.CustomerID IN (     SELECT CustomerID FROM transactions_1k WHERE Date BETWEEN '2012-01-01' AND '2012-01-31' ) GROUP BY T2.Date, T2.Amount;	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k  JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID  WHERE transactions_1k.Date = '2012-08-26'  AND transactions_1k.Time BETWEEN '08:00:00' AND '09:00:00'  AND gasstations.Country = 'CZE';	debit_card_specializing
SELECT T1.Currency FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date LIKE '%201306%' AND SUM(T2.Amount) = 214582.17;	debit_card_specializing
SELECT T1.Country FROM gasstations AS T1 INNER JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.CardID = 667467;	debit_card_specializing
SELECT T1.Currency FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '2012-08-24' AND T2.Amount = 548.4;	debit_card_specializing
SELECT CAST(SUM(CASE WHEN Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(CustomerID) FROM customers WHERE Date LIKE '2012-08-25%'	debit_card_specializing
SELECT      ym2.Consumption AS consumption_2012,      ym1.Consumption AS consumption_2013,      ((ym2.Consumption - ym1.Consumption) / ym2.Consumption) AS consumption_decrease_rate FROM      yearmonth ym1 JOIN      yearmonth ym2 ON ym1.CustomerID = ym2.CustomerID AND ym1.Date LIKE '2012%' AND ym2.Date LIKE '2013%' WHERE      ym1.Date = '2012-08-24' AND      ym2.Date = '2013-08-24';	debit_card_specializing
SELECT g.GasStationID, SUM(t.Amount) AS TotalRevenue FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID GROUP BY g.GasStationID ORDER BY TotalRevenue DESC LIMIT 1;	debit_card_specializing
SELECT CAST(SUM(CASE WHEN T2.Segment = 'Premium' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS PremiumPercentage FROM gasstations AS T1 JOIN yearmonth AS T2 ON T1.GasStationID = T2.CustomerID WHERE T1.Country = 'SVK';	debit_card_specializing
SELECT SUM(Amount) AS TotalSpent, SUM(CASE WHEN Date LIKE '201201%' THEN Amount ELSE 0 END) AS SpentInJanuary FROM transactions_1k WHERE CustomerID = 38508;	debit_card_specializing
SELECT p.Description FROM transactions_1k t JOIN products p ON t.ProductID = p.ProductID GROUP BY p.Description ORDER BY COUNT(t.TransactionID) DESC LIMIT 5;	debit_card_specializing
SELECT c.CustomerID, c.Segment, c.Currency, AVG(t.Price / t.Amount) AS AvgPricePerItem FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID GROUP BY c.CustomerID, c.Segment, c.Currency ORDER BY SUM(t.Amount * t.Price) DESC LIMIT 1;	debit_card_specializing
SELECT T2.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.ProductID = 2 ORDER BY T1.Price DESC LIMIT 1	debit_card_specializing
SELECT y.Consumption FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE t.ProductID = 5 AND t.Price / t.Amount > 29 AND strftime('%Y%m', y.Date) = '201208';	debit_card_specializing
