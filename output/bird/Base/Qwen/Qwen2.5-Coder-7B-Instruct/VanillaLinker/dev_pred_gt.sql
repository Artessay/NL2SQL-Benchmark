SELECT MAX(`Percent (%) Eligible Free (K-12)`) AS HighestEligibleFreeRate FROM frpm WHERE `County Name` = 'Alameda';	california_schools
SELECT `Percent (%) Eligible Free (Ages 5-17)` FROM frpm WHERE `School Type` = 'Continuation' ORDER BY `Percent (%) Eligible Free (Ages 5-17)` ASC LIMIT 3	california_schools
SELECT DISTINCT T2.Zip FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.County = 'Fresno' AND T1.`Charter School (Y/N)` = 1;	california_schools
SELECT T2.MailStreet FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T1.`FRPM Count (K-12)` DESC LIMIT 1	california_schools
SELECT T1.Phone FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`Charter School (Y/N)` = 1 AND T1.OpenDate > '2000-01-01'	california_schools
SELECT COUNT(*) FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrMath > 400 AND T1.Virtual = 'F';	california_schools
SELECT T1.School FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumTstTakr > 500 AND (T1.Magnet = 1 OR T1.School LIKE '%Magnet%')	california_schools
SELECT T1.Phone FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumGE1500 > 0 ORDER BY T2.NumGE1500 DESC LIMIT 1	california_schools
SELECT SUM(NumTstTakr) FROM satscores WHERE cds IN (     SELECT CDSCode     FROM frpm     ORDER BY FRPM_Count_K_12 DESC     LIMIT 1 );	california_schools
SELECT COUNT(DISTINCT T1.CDSCode) FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrMath > 560 AND T1.CharterFundingType = 'Directly funded'	california_schools
SELECT T1.FRPM_COUNT FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds ORDER BY T2.AvgScrRead DESC LIMIT 1	california_schools
SELECT CDSCode FROM frpm WHERE Enrollment_K_12 + Enrollment_Ages_5_17 > 500	california_schools
SELECT MAX(`Percent (%) Eligible Free (Ages 5-17)`) FROM frpm WHERE CDSCode IN ( SELECT cds FROM satscores WHERE NumGE1500 / NumTstTakr > 0.3 )	california_schools
SELECT T2.Phone FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumTstTakr > 0 ORDER BY CAST(T1.NumGE1500 AS REAL) / T1.NumTstTakr DESC LIMIT 3	california_schools
SELECT T2.NCESDist FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T1.`Enrollment (Ages 5-17)` DESC LIMIT 5	california_schools
SELECT T1.District FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.StatusType = 'Active' GROUP BY T1.District ORDER BY AVG(T2.AvgScrRead) DESC LIMIT 1	california_schools
SELECT COUNT(*) FROM satscores WHERE NumTstTakr < 100 AND cname = 'Alameda'	california_schools
SELECT T2.CDSCode, T2.CharterNum FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrWrite > 499 AND T2.CharterNum IS NOT NULL ORDER BY T1.AvgScrWrite DESC	california_schools
SELECT COUNT(*) FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.County = 'Fresno' AND T1.FundingType = 'Directly funded' AND T2.NumTstTakr <= 250	california_schools
SELECT T1.Phone FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds ORDER BY T2.AvgScrMath DESC LIMIT 1	california_schools
SELECT COUNT(*) FROM frpm WHERE County = 'Amador' AND Low_Grade = '9' AND High_Grade = '12';	california_schools
SELECT COUNT(*) FROM frpm WHERE `County Name` = 'Los Angeles' AND `Enrollment (K-12)` > 500 AND `Enrollment (K-12)` < 700	california_schools
SELECT T2.sname FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.County = 'Contra Costa' ORDER BY T2.NumTstTakr DESC LIMIT 1;	california_schools
SELECT T2.School ,  T2.Street ,  T2.StreetAbr ,  T2.City ,  T2.Zip ,  T2.State FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode  =  T2.CDSCode WHERE ABS(T1.`Enrollment (K-12)` - T1.`Enrollment (Ages 5-17)`) > 30	california_schools
SELECT s.School, f.[Percent (%) Eligible Free (K-12)], st.AvgScrRead, st.AvgScrMath, st.AvgScrWrite FROM frpm f JOIN satscores st ON f.CDSCode = st.cds JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.[Percent (%) Eligible Free (K-12)] > 0.1 AND st.NumGE1500 >= 1;	california_schools
SELECT T1.School, T1.FundingType FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrMath > 400 AND T1.County = 'Riverside'	california_schools
SELECT T1.School, T1.Street, T1.City, T1.State, T1.Zip FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`School Type` = 'High Schools (Public)' AND T2.`County Name` = 'Monterey' AND T2.`Free Meal Count (Ages 15-17)` > 800	california_schools
SELECT T1.sname, T1.AvgScrWrite, T2.Phone FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.OpenDate > '1991-12-31' OR T2.ClosedDate < '2000-01-01'	california_schools
SELECT s.School, s.DOCType, AVG(f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`) AS AvgDiff FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.CharterFundingType = 'Locally Funded' GROUP BY s.School, s.DOCType HAVING ABS(AvgDiff) > (     SELECT AVG(ABS(f2.`Enrollment (K-12)` - f2.`Enrollment (Ages 5-17)`))     FROM frpm f2     JOIN schools s2 ON f2.CDSCode = s2.CDSCode     WHERE f2.CharterFundingType = 'Locally Funded' ) ORDER BY Abs(AvgDiff) DESC;	california_schools
SELECT T1.OpenDate FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`Low Grade` = 'K' AND T2.`High Grade` = '12' ORDER BY T2.`Enrollment (K-12)` DESC LIMIT 1;	california_schools
SELECT DISTINCT City FROM frpm INNER JOIN schools ON frpm.CDSCode = schools.CDSCode ORDER BY Enrollment DESC LIMIT 5	california_schools
SELECT `Percent (%) Eligible Free (K-12)`  FROM `frpm`  ORDER BY `Enrollment (K-12)` DESC  LIMIT 10, 2;	california_schools
SELECT T1.`Percent (%) Eligible Free (K-12)` FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`Ownership Code` = 66 ORDER BY T1.`FRPM Count (K-12)` DESC LIMIT 5	california_schools
SELECT T2.Website, T2.School FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Free Meal Count (Ages 5-17)` BETWEEN 1900 AND 2000	california_schools
SELECT "Percent (%) Eligible Free (Ages 5-17)" FROM frpm WHERE CDSCode IN (SELECT CDSCode FROM schools WHERE AdmFName1 = 'Kacey' AND AdmLName1 = 'Gibson')	california_schools
SELECT T2.AdmEmail1 FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Charter School (Y/N)` = 1 ORDER BY T1.`Enrollment (K-12)` ASC LIMIT 1	california_schools
SELECT T1.AdmFName1, T1.AdmLName1, T1.AdmFName2, T1.AdmLName2, T1.AdmFName3, T1.AdmLName3 FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumGE1500 > 0 ORDER BY T2.NumGE1500 DESC LIMIT 1	california_schools
SELECT T1.Street, T1.City, T1.State, T1.Zip FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds ORDER BY CAST(T2.NumGE1500 AS REAL) / T2.NumTstTakr ASC LIMIT 1	california_schools
SELECT T2.Website FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumTstTakr BETWEEN 2000 AND 3000 AND T2.County = 'Los Angeles'	california_schools
SELECT AVG(s.NumTstTakr) AS AverageTestTakers FROM satscores s JOIN schools sc ON s.cds = sc.CDSCode WHERE sc.City = 'Fresno' AND STRFTIME('%Y', sc.OpenDate) = '1980';	california_schools
SELECT T2.Phone FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.District = 'Fresno Unified' ORDER BY T1.AvgScrRead ASC LIMIT 1	california_schools
SELECT T1.School FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.Virtual = 'F' GROUP BY T1.County, T1.School ORDER BY AVG(T2.AvgScrRead) DESC LIMIT 5	california_schools
SELECT T1.Educational_Option_Type FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds ORDER BY T2.AvgScrMath DESC LIMIT 1	california_schools
SELECT AVG(AvgScrMath), T2.County FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode GROUP BY T2.County ORDER BY SUM(AvgScrMath + AvgScrRead + AvgScrWrite) ASC LIMIT 1	california_schools
SELECT AVG(AvgScrWrite), T2.City FROM satscores AS A INNER JOIN schools AS B ON A.cds = B.CDSCode WHERE NumTstTakr >= 1500 GROUP BY T2.City ORDER BY SUM(NumTstTakr) DESC LIMIT 1;	california_schools
SELECT T2.School, AVG(T2.AvgScrWrite) AS AverageWritingScore FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.AdmFName1 = 'Ricci' AND T1.AdmLName1 = 'Ulrich' GROUP BY T2.School	california_schools
SELECT T2.School FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.DOC = 31 AND T1.LowGrade = 'K' AND T1.HighGrade = '12' ORDER BY T1.`Enrollment (K-12)` DESC LIMIT 1	california_schools
SELECT COUNT(CDSCode) / 12 FROM schools WHERE strftime('%Y', OpenDate) = '1980' AND DOC = 52	california_schools
SELECT CAST(SUM(CASE WHEN T2.DOC = 54 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T2.DOC = 52 THEN 1 ELSE 0 END) FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.County = 'Orange' AND T1.StatusType = 'Merged'	california_schools
SELECT T1.County, T1.School, T1.ClosedDate FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.StatusType = 'Closed' GROUP BY T1.County ORDER BY COUNT(T1.CDSCode) DESC LIMIT 1	california_schools
SELECT T2.Street, T2.School FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrMath DESC LIMIT 6, 1	california_schools
SELECT T2.MailStreet, T2.School FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrRead ASC LIMIT 1	california_schools
SELECT COUNT(*)  FROM frpm  JOIN satscores ON frpm.CDSCode = satscores.cds  JOIN schools ON frpm.CDSCode = schools.CDSCode  WHERE (frpm.Percent (%) Eligible Free (K-12) + frpm.Percent (%) Eligible Free (Ages 5-17)) >= 50 AND satscores.AvgScrRead + satscores.AvgScrMath + satscores.AvgScrWrite >= 1500 AND schools.MailCity = 'Lakeport';	california_schools
SELECT SUM(NumTstTakr) FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.MailCity = 'Fresno';	california_schools
SELECT s.School, s.MailZip FROM schools s WHERE s.AdmFName1 = 'Avetik' AND s.AdmLName1 = 'Atoian';	california_schools
SELECT CAST(SUM(CASE WHEN County = 'Colusa' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN County = 'Humboldt' THEN 1 ELSE 0 END) FROM schools WHERE MailState = 'CA'	california_schools
SELECT COUNT(*) FROM schools WHERE State = 'CA' AND City = 'San Joaquin' AND StatusType = 'Active';	california_schools
SELECT T2.Phone, T2.Ext FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrWrite DESC LIMIT 1, 1	california_schools
SELECT Phone, Ext, School FROM schools WHERE Zip = '95203-3704'	california_schools
SELECT Website FROM schools WHERE AdmFName1 = 'Mike' AND AdmLName1 = 'Larson' OR AdmFName1 = 'Dante' AND AdmLName1 = 'Alvarez'	california_schools
SELECT Website FROM schools WHERE Virtual = 'P' AND Charter = 1 AND County = 'San Joaquin'	california_schools
SELECT COUNT(*) FROM schools WHERE City = 'Hickman' AND DOC = 52 AND Charter = 1;	california_schools
SELECT COUNT(*) FROM frpm WHERE County Name = 'Los Angeles' AND Charter School (Y/N) = 0 AND Percent (%) Eligible Free (K-12) < 0.18;	california_schools
SELECT DISTINCT s.AdmFName1, s.AdmLName1, s.School, s.City FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.Charter = 1 AND f.Charter School Number = '00D2';	california_schools
SELECT COUNT(*) FROM schools WHERE MailCity = 'Hickman' AND CharterNum = '00D4';	california_schools
SELECT      (SUM(CASE WHEN Charter_Funding_Type = 'Locally Funded' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Percentage_Locally_Funded FROM      frpm JOIN      schools ON frpm.CDSCode = schools.CDSCode WHERE      County_Name = 'Santa Clara';	california_schools
SELECT COUNT(*) FROM schools WHERE FundingType = 'Directly Funded' AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31' AND County = 'Stanislaus';	california_schools
SELECT COUNT(*) FROM schools WHERE City = 'San Francisco' AND StatusType = 'Closed' AND ClosedDate LIKE '%1989%'	california_schools
SELECT T2.County FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.ClosedDate BETWEEN '1980-01-01' AND '1989-12-31' AND T1.SOC = 11 GROUP BY T2.County ORDER BY COUNT(T2.CDSCode) DESC LIMIT 1	california_schools
SELECT NCESDist FROM schools WHERE SOC = 31	california_schools
SELECT COUNT(*) AS Total_Schools FROM schools WHERE County = 'Alpine' AND (District = 'District Community Day Schools' OR District LIKE '%Community Day Schools%') AND StatusType IN ('Active', 'Closed');	california_schools
SELECT District FROM schools WHERE City = 'Fresno' AND Magnet = 0	california_schools
SELECT SUM(`Enrollment (Ages 5-17)`) FROM `frpm` WHERE `School Name` = 'State Special School' AND `Academic Year` = '2014-2015' AND `EdOpsCode` = 'SSS';	california_schools
SELECT T1.`Free Meal Count (Ages 5-17)` FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.School = 'Youth Authority School' AND T2.MailStreet = 'PO Box 1040';	california_schools
SELECT MIN(LowGrade) FROM frpm WHERE CDSCode IN (SELECT CDSCode FROM schools WHERE NCESDist = '0613360' AND EdOpsCode = 'SPECON')	california_schools
SELECT T2.School, T2.GSoffered FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Educational Option Type` = 'Breakfast Provision 2' AND T2.`County Code` = 37	california_schools
SELECT T2.City FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.Educational_Option_Type = 'Lunch Provision 2' AND T1.Low_Grade = '9' AND T1.High_Grade = '12' AND T2.County = 'Merced' AND T2.EILCode = 'HS'	california_schools
SELECT T1.School, (T1.`FRPM Count (Ages 5-17)` / T1.`Enrollment (Ages 5-17)` * 100) AS `Percent (%) Eligible FRPM (Ages 5-17)` FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.County = 'Los Angeles' AND T1.LowGrade = 'K' AND T1.HighGrade = '9'	california_schools
SELECT GSserved FROM schools WHERE City = 'Adelanto' GROUP BY GSserved ORDER BY COUNT(*) DESC LIMIT 1	california_schools
SELECT COUNT(*) AS NumberOfSchools FROM schools WHERE Virtual = 'F' AND County IN ('San Diego', 'Santa Barbara')	california_schools
SELECT T1.School, T1.Latitude, T1.Longitude FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T1.Latitude DESC LIMIT 1	california_schools
SELECT T1.School, T1.LowestGrade FROM schools AS T1 INNER JOIN ( SELECT MIN(Latitude) AS MinLat FROM schools WHERE State = 'CA' ) AS T2 ON T1.Latitude = T2.MinLat WHERE T1.State = 'CA'	california_schools
SELECT GSoffered FROM schools ORDER BY ABS(Longitude) DESC LIMIT 1	california_schools
SELECT COUNT(DISTINCT City), City, COUNT(*) AS SchoolCount FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE Magnet = 1 AND GSoffered = 'K-8' AND NSLP_Provision_Status = 'Multiple Provision Types' GROUP BY City;	california_schools
SELECT T1.AdmFName1, T2.District FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode GROUP BY T1.AdmFName1 ORDER BY COUNT(T1.AdmFName1) DESC LIMIT 2	california_schools
SELECT T2.`Percent (%) Eligible Free (K-12)`, T1.`District Code` FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`AdmFName1` = 'Alusine'	california_schools
SELECT T2.LastUpdate, T2.District, T2.County, T2.School, T2.AdmLName1 FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.Charter_School_Number = 40;	california_schools
SELECT AdmEmail1, AdmEmail2, AdmEmail3 FROM schools WHERE County = 'San Bernardino' AND City = 'San Bernardino City Unified' AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND (SOC = 62 OR DOC = 54)	california_schools
SELECT T1.AdmEmail1, T2.School FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumGE1500 > 0 ORDER BY T2.NumGE1500 DESC LIMIT 1	california_schools
SELECT COUNT(DISTINCT T1.account_id) FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id INNER JOIN district AS T4 ON T3.district_id = T4.district_id WHERE T1.frequency = 'POPLATEK PO OBRATU' AND T4.A3 LIKE '%East Bohemia%'	financial
SELECT COUNT(DISTINCT account_id) AS eligible_accounts FROM account JOIN disp ON account.account_id = disp.account_id JOIN client ON disp.client_id = client.client_id JOIN district ON client.district_id = district.district_id WHERE district.A3 = 'Prague';	financial
SELECT AVG(A12) AS avg_unemployment_1995, AVG(A13) AS avg_unemployment_1996 FROM district WHERE strftime('%Y', date) IN ('1995', '1996')	financial
SELECT COUNT(*) FROM district WHERE A11 BETWEEN 6000 AND 10000 AND A2 IN ( SELECT T1.A2 FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.gender = 'F' GROUP BY T1.A2 HAVING AVG(T1.A11) > 6000 AND AVG(T1.A11) < 10000 )	financial
SELECT COUNT(client_id) FROM client WHERE gender = 'M' AND district_id IN (     SELECT district_id FROM district WHERE A3 LIKE '%North Bohemia%' ) AND district_id IN (     SELECT district_id FROM district GROUP BY district_id HAVING AVG(A11) > 8000 )	financial
SELECT AVG(T1.A11) - MIN(AVG(T1.A11)) AS gap FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.gender = 'F' GROUP BY T2.client_id ORDER BY MAX(T2.birth_date) DESC LIMIT 1	financial
SELECT T1.account_id FROM disp AS T1 JOIN client AS T2 ON T1.client_id = T2.client_id GROUP BY T1.account_id ORDER BY AVG(T2.birth_date) DESC LIMIT 1	financial
SELECT COUNT(DISTINCT T1.client_id) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id WHERE T3.frequency = 'POPLATEK TYDNE' AND T2.type = 'OWNER'	financial
SELECT DISTINCT d.client_id FROM disp d JOIN account a ON d.account_id = a.account_id WHERE d.type = 'DISPONENT' AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT T1.account_id FROM account AS T1 JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE STRFTIME('%Y', T2.date) = '1997' ORDER BY T2.amount ASC LIMIT 1;	financial
SELECT T1.account_id FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.duration > 12 AND strftime('%Y', T2.date) = '1993' ORDER BY T1.amount DESC LIMIT 1	financial
SELECT COUNT(*) FROM client WHERE gender = 'F' AND birth_date < '1950-01-01' AND district_id IN ( SELECT district_id FROM district WHERE A2 = 'Sokolov' )	financial
SELECT account_id FROM trans WHERE STRFTIME('%Y', date) = '1995' ORDER BY date ASC LIMIT 1	financial
SELECT DISTINCT T1.account_id FROM disp AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.date < '1997-01-01' AND T2.balance > 3000	financial
SELECT T1.client_id FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN card AS T3 ON T2.disp_id = T3.disp_id WHERE T3.issued LIKE '1994-03-03%'	financial
SELECT T1.date FROM account AS T1 INNER JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T2.amount = 840 AND T2.date = '1998-10-14'	financial
SELECT T1.district_id FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id INNER JOIN loan AS T3 ON T2.account_id = T3.account_id WHERE T3.date = '1994-08-25'	financial
SELECT MAX(t.amount) FROM trans t JOIN disp d ON t.account_id = d.account_id WHERE d.issued = '1996-10-21'	financial
SELECT T1.gender FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id INNER JOIN district AS T4 ON T3.district_id = T4.district_id ORDER BY T1.birth_date ASC, T4.A11 DESC LIMIT 1	financial
SELECT T2.amount FROM disp AS T1 INNER JOIN trans AS T2 ON T1.account_id = T2.account_id INNER JOIN loan AS T3 ON T1.account_id = T3.account_id ORDER BY T3.amount DESC LIMIT 1, 1	financial
SELECT COUNT(*) FROM client AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Jesenik' AND T1.gender = 'F'	financial
SELECT T1.disp_id FROM disp AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T3.amount = 5100 AND T3.date LIKE '1998-09-02%'	financial
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Litomerice') AND strftime('%Y', date) = '1996';	financial
SELECT T2.A2 FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' AND T1.birth_date = '1976-01-29'	financial
SELECT T1.birth_date FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id INNER JOIN loan AS T4 ON T3.account_id = T4.account_id WHERE T4.amount = 98832 AND T4.date LIKE '1996-01-03%'	financial
SELECT T1.account_id FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 = 'Prague' ORDER BY T1.date ASC LIMIT 1	financial
SELECT CAST(SUM(CASE WHEN T1.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 LIKE '%south Bohemia%' ORDER BY T2.A4 DESC LIMIT 1	financial
SELECT ((T3.balance - T1.balance) / T1.balance) * 100 AS increase_rate FROM trans AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN trans AS T3 ON T2.client_id = T3.client_id WHERE T1.date = '1993-03-22' AND T3.date = '1998-12-27' AND T1.type = 'PRIJEM' AND T3.type = 'PRIJEM' ORDER BY T2.disp_id ASC LIMIT 1	financial
SELECT CAST(SUM(CASE WHEN T2.status = 'A' THEN T1.amount ELSE 0 END) AS REAL) * 100 / SUM(T1.amount) FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id	financial
SELECT CAST(SUM(CASE WHEN status = 'C' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM loan WHERE amount < 100000	financial
SELECT T1.account_id, T4.A2, T4.A3 FROM trans AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN disp AS T3 ON T2.account_id = T3.account_id JOIN district AS T4 ON T2.district_id = T4.district_id WHERE T2.date LIKE '1993%' AND T1.type = 'POPLATEK PO OBRATU'	financial
SELECT T2.account_id, T2.frequency FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.A8 BETWEEN 1 AND 5 AND T2.date BETWEEN '1995-01-01' AND '2000-12-31' GROUP BY T2.account_id, T2.frequency	financial
SELECT T1.account_id, T1.date FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Prachatice'	financial
SELECT T3.A2, T3.A3 FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.loan_id = 4990	financial
SELECT T1.account_id, T2.A2, T2.A3 FROM loan AS T1 INNER JOIN district AS T2 ON T1.account_id = T2.district_id WHERE T1.amount > 300000	financial
SELECT T1.loan_id, T3.A3, AVG(T2.salary) AS avg_salary FROM loan AS T1 INNER JOIN client AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.duration = 60 GROUP BY T1.loan_id, T3.A3	financial
SELECT T1.A12 ,  T1.A13 ,  ((T1.A13 - T1.A12) / T1.A12) * 100 FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id INNER JOIN loan AS T3 ON T2.account_id = T3.account_id WHERE T3.status = 'D'	financial
SELECT CAST(SUM(CASE WHEN T1.district_id = ( SELECT district_id FROM district WHERE A2 = 'Decin' ) THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id WHERE STRFTIME('%Y', T3.date) = '1993'	financial
SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE'	financial
SELECT T1.A2 FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.gender = 'F' GROUP BY T1.A2 ORDER BY COUNT(T2.client_id) DESC LIMIT 9	financial
SELECT T1.A2, SUM(T3.amount) AS total_withdrawals FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id INNER JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T3.type = 'VYDAJ' AND T3.date LIKE '1996-01%' GROUP BY T1.A2 ORDER BY total_withdrawals DESC LIMIT 10	financial
SELECT COUNT(DISTINCT T1.client_id) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T3.A3 = 'South Bohemia' AND T2.account_id NOT IN ( SELECT account_id FROM card )	financial
SELECT T2.A3 FROM loan AS T1 INNER JOIN district AS T2 ON T1.account_id = T2.district_id WHERE T1.status IN ('C', 'D') GROUP BY T2.A3 ORDER BY COUNT(*) DESC LIMIT 1	financial
SELECT AVG(T1.amount) FROM loan AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T3.gender = 'M'	financial
SELECT T2.A2 FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE STRFTIME('%Y', T2.date) = '1996' ORDER BY T1.A13 DESC LIMIT 1	financial
SELECT COUNT(account_id) FROM account WHERE district_id = ( SELECT district_id FROM district ORDER BY A16 DESC LIMIT 1 )	financial
SELECT COUNT(DISTINCT T1.account_id) FROM trans AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.operation = 'VYBER KARTOU' AND T2.frequency = 'POPLATEK MESICNE' AND T1.balance < 0	financial
SELECT COUNT(DISTINCT T1.account_id) FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.date BETWEEN '1995-01-01' AND '1997-12-31' AND T1.amount >= 250000 AND T2.frequency = 'POPLATEK MESICNE';	financial
SELECT COUNT(account_id) FROM loan WHERE status IN ('C', 'D') AND account_id IN (SELECT account_id FROM disp WHERE client_id IN (SELECT client_id FROM client WHERE district_id = 1));	financial
SELECT COUNT(*) FROM client WHERE district_id IN (     SELECT district_id FROM district ORDER BY A15 DESC LIMIT 1 OFFSET 1 ) AND gender = 'M';	financial
SELECT COUNT(*) FROM card AS T1 INNER JOIN disp AS T2 ON T1.card_id = T2.card_id WHERE T1.type = 'gold' AND T2.type = 'OWNER'	financial
SELECT COUNT(account_id) FROM account WHERE district_id = ( SELECT district_id FROM district WHERE A2 = 'Pisek' )	financial
SELECT T1.A2 FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id INNER JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T3.amount > 10000 AND STRFTIME('%Y', T3.date) = '1997' GROUP BY T1.district_id HAVING SUM(T3.amount) > 10000;	financial
SELECT T1.account_id FROM account AS T1 INNER JOIN order AS T2 ON T1.account_id = T2.account_id WHERE T2.k_symbol = 'SIPO' AND T2.bank_to LIKE '%Pisek%'	financial
SELECT T1.account_id FROM account AS T1 JOIN disp AS T2 ON T1.account_id = T2.account_id JOIN card AS T3 ON T2.disp_id = T3.disp_id WHERE T3.type = 'gold'	financial
SELECT AVG(amount) FROM trans WHERE type = 'PRIJEM' AND operation = 'VYBER KARTOU' AND date LIKE '2021%'	financial
SELECT DISTINCT T1.account_id FROM disp AS T1 JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T2.date LIKE '1998%' AND T2.operation = 'VYBER KARTOU' AND T2.amount < ( SELECT AVG(amount) FROM trans WHERE date LIKE '1998%' )	financial
SELECT c.client_id, c.gender FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card ca ON d.disp_id = ca.disp_id JOIN loan l ON d.account_id = l.account_id WHERE c.gender = 'F' AND ca.type = 'credit'	financial
SELECT COUNT(*) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' AND T2.A3 LIKE '%south Bohemia%'	financial
SELECT T1.account_id FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id INNER JOIN district AS T4 ON T3.district_id = T4.district_id WHERE T4.A2 = 'Tabor' AND T2.type = 'OWNER'	financial
SELECT DISTINCT T2.type FROM disp AS T1 INNER JOIN card AS T2 ON T1.disp_id = T2.disp_id INNER JOIN client AS T3 ON T1.client_id = T3.client_id INNER JOIN account AS T4 ON T1.account_id = T4.account_id WHERE T2.type != 'OWNER' AND T3.district_id IN ( SELECT district_id FROM client GROUP BY district_id HAVING AVG(T3.birth_date) BETWEEN 8000 AND 9000 )	financial
SELECT COUNT(*) FROM account AS T1 INNER JOIN trans AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T3.A3 LIKE '%North Bohemia%' AND T2.bank = 'AB'	financial
SELECT T1.A2 FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id INNER JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T3.type = 'VYDAJ'	financial
SELECT AVG(T1.A15) AS avg_crimes FROM district AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.A15 > 4000 AND MIN(T2.date) >= '1997-01-01' AND STRFTIME('%Y', T2.date) = '1995';	financial
SELECT COUNT(*) FROM card AS T1 INNER JOIN disp AS T2 ON T1.card_id = T2.card_id WHERE T1.type = 'classic' AND T2.type = 'OWNER'	financial
SELECT COUNT(client_id) FROM client WHERE district_id IN ( SELECT district_id FROM district WHERE A2 = 'Hl.m. Praha' ) AND gender = 'M'	financial
SELECT CAST(SUM(CASE WHEN type = 'gold' AND issued < '1998-01-01' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM card	financial
SELECT T3.name FROM disp AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T1.client_id = T3.client_id WHERE T2.account_id IN ( SELECT account_id FROM loan ORDER BY amount DESC LIMIT 1 )	financial
SELECT T1.A15 FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T2.account_id = 532	financial
SELECT T2.district_id FROM order AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.order_id = 33333	financial
SELECT T1.amount FROM trans AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id WHERE T2.client_id = 3356 AND T1.operation = 'VYBER'	financial
SELECT COUNT(DISTINCT T1.account_id) FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T1.frequency = 'POPLATEK TYDNE' AND T2.amount < 200000	financial
SELECT T1.type FROM card AS T1 INNER JOIN disp AS T2 ON T1.card_id = T2.card_id WHERE T2.client_id = 13539 AND T1.type LIKE '%credit%'	financial
SELECT T1.A3 FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.client_id = 3541	financial
SELECT T2.A2 FROM loan AS T1 INNER JOIN district AS T2 ON T1.account_id = T2.district_id WHERE T1.status = 'A' GROUP BY T2.district_id ORDER BY COUNT(T1.loan_id) DESC LIMIT 1	financial
SELECT client_id FROM disp WHERE account_id IN (SELECT account_id FROM `order` WHERE order_id = 32423)	financial
SELECT T1.trans_id FROM trans AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.district_id = 5	financial
SELECT COUNT(account_id) FROM account WHERE district_id = (SELECT district_id FROM district WHERE A3 = 'Jesenik')	financial
SELECT T1.client_id FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN card AS T3 ON T2.disp_id = T3.disp_id WHERE T3.type = 'junior' AND T3.issued >= '1997-01-01'	financial
SELECT CAST(SUM(CASE WHEN T2.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T1.A11 > 10000	financial
SELECT ((SUM(CASE WHEN T2.date LIKE '1997%' THEN T2.amount ELSE 0 END) - SUM(CASE WHEN T2.date LIKE '1996%' THEN T2.amount ELSE 0 END)) / SUM(CASE WHEN T2.date LIKE '1996%' THEN T2.amount ELSE 0 END)) * 100 AS growth_rate FROM client AS T1 INNER JOIN loan AS T2 ON T1.client_id = T2.account_id WHERE T1.gender = 'M'	financial
SELECT COUNT(*) FROM trans WHERE operation = 'VYBER KARTOU' AND date > '1995-12-31'	financial
SELECT SUM(CASE WHEN A3 = 'East Bohemia' THEN A16 ELSE 0 END) - SUM(CASE WHEN A3 = 'North Bohemia' THEN A16 ELSE 0 END) AS crime_difference FROM district WHERE date LIKE '1996%'	financial
SELECT type ,  COUNT(*) FROM disp WHERE account_id BETWEEN 1 AND 10 GROUP BY type	financial
SELECT T1.date, T2.k_symbol FROM account AS T1 INNER JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T1.account_id = 3 AND T2.amount = -3539;	financial
SELECT T1.birth_date FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id WHERE T2.disp_id = 130	financial
SELECT COUNT(DISTINCT T1.account_id)  FROM disp AS T1  JOIN account AS T2 ON T1.account_id = T2.account_id  WHERE T1.type = 'OWNER' AND T2.frequency = 'POPLATEK PO OBRATU';	financial
SELECT SUM(T1.amount) AS total_debt, T2.status FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.client_id = 992	financial
SELECT T1.amount, T2.gender FROM trans AS T1 INNER JOIN client AS T2 ON T1.account_id = T2.district_id WHERE T1.trans_id = 851 AND T2.client_id = 4	financial
SELECT T1.type FROM card AS T1 INNER JOIN disp AS T2 ON T1.card_id = T2.card_id WHERE T2.client_id = 9 AND T1.type LIKE '%credit%'	financial
SELECT SUM(amount) FROM trans WHERE account_id IN ( SELECT account_id FROM disp WHERE client_id = 617 ) AND date LIKE '1998%'	financial
SELECT T1.client_id FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND T2.A8 = 1 ORDER BY T1.client_id;	financial
SELECT T1.client_id FROM client AS T1 INNER JOIN loan AS T2 ON T1.client_id = T2.account_id WHERE T1.gender = 'F' ORDER BY T2.amount DESC LIMIT 3	financial
SELECT COUNT(DISTINCT T1.client_id) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T1.gender = 'M' AND T1.birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND T3.amount > 4000 AND T3.k_symbol = 'SIPO'	financial
SELECT COUNT(*) FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id INNER JOIN district AS T4 ON T3.district_id = T4.district_id WHERE T4.A2 = 'Beroun' AND T1.date > '1996-12-31'	financial
SELECT COUNT(*) FROM client AS c JOIN disp AS d ON c.client_id = d.client_id JOIN card AS ca ON d.disp_id = ca.disp_id WHERE c.gender = 'F' AND ca.type = 'junior'	financial
SELECT CAST(SUM(CASE WHEN T2.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM account AS T1 INNER JOIN client AS T2 ON T1.client_id = T2.client_id WHERE T2.district_id IN ( SELECT district_id FROM district WHERE A3 LIKE '%Prague%' )	financial
SELECT CAST(SUM(CASE WHEN T1.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id WHERE T3.frequency = 'POPLATEK TYDNE'	financial
SELECT COUNT(DISTINCT T2.client_id) FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id WHERE T1.frequency = 'POPLATEK TYDNE' AND T2.type = 'OWNER'	financial
SELECT a.account_id, MIN(l.amount) AS min_amount FROM account a JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 24 AND a.date < '1997-01-01' GROUP BY a.account_id ORDER BY min_amount ASC LIMIT 1;	financial
SELECT T1.account_id FROM disp AS T1 INNER JOIN client AS T2 ON T1.client_id = T2.client_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T2.gender = 'F' GROUP BY T1.account_id ORDER BY AVG(T3.A11) ASC LIMIT 1	financial
SELECT COUNT(client_id) FROM client WHERE STRFTIME('%Y', birth_date) = '1920' AND district_id IN ( SELECT district_id FROM district WHERE A3 LIKE '%East Bohemia%' )	financial
SELECT COUNT(*) FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.duration = 24 AND T1.frequency = 'POPLATEK TYDNE'	financial
SELECT AVG(T1.amount) FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.frequency = 'POPLATEK PO OBRATU' AND T1.status IN ('C', 'D')	financial
SELECT T1.client_id ,  T2.district_id FROM disp AS T1 INNER JOIN client AS T2 ON T1.client_id = T2.client_id WHERE T1.type = 'OWNER'	financial
SELECT c.client_id , julianday('now') - julianday(c.birth_date) AS age FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card ca ON d.disp_id = ca.disp_id WHERE ca.type = 'gold' AND d.type = 'OWNER'	financial
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY COUNT(bond_type) DESC LIMIT 1	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id IN ( SELECT molecule_id FROM molecule WHERE label = '-' ) AND element = 'cl'	toxicology
SELECT AVG(CASE WHEN T1.element = 'o' THEN 1 ELSE 0 END) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-'	toxicology
SELECT CAST(COUNT(CASE WHEN T3.bond_type = '-' THEN 1 ELSE NULL END) AS REAL) / COUNT(T2.atom_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN bond AS T3 ON T1.molecule_id = T3.molecule_id WHERE T1.label = '+'	toxicology
SELECT COUNT(*) FROM atom WHERE element = 'na' AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-');	toxicology
SELECT T1.label FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '#' AND T1.label = '+' GROUP BY T1.molecule_id HAVING COUNT(T2.bond_type) >= 3	toxicology
SELECT CAST(SUM(CASE WHEN T1.element = 'c' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '='	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '#'	toxicology
SELECT COUNT(*) FROM atom WHERE element != 'br'	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR099' AND label = '+'	toxicology
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'c' GROUP BY T1.molecule_id	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR004_8_9'	toxicology
SELECT DISTINCT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '='	toxicology
SELECT T2.label FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'h' GROUP BY T2.label ORDER BY COUNT(T2.label) DESC LIMIT 1	toxicology
SELECT T1.bond_type FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id INNER JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T3.element = 'cl'	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-'	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN connected AS T3 ON T1.atom_id = T3.atom_id WHERE T2.label = '-'	toxicology
SELECT element FROM atom WHERE molecule_id IN ( SELECT molecule_id FROM molecule WHERE label = '-' ) GROUP BY element ORDER BY COUNT(element) ASC LIMIT 1	toxicology
SELECT T2.bond_type FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE (T1.atom_id = 'TR004_8' AND T1.atom_id2 = 'TR004_20') OR (T1.atom_id = 'TR004_20' AND T1.atom_id2 = 'TR004_8')	toxicology
SELECT label FROM molecule WHERE molecule_id NOT IN ( SELECT molecule_id FROM atom WHERE element != 'sn' )	toxicology
SELECT COUNT(DISTINCT T1.atom_id) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE (T1.element = 'i' OR T1.element = 's') AND T3.bond_type = '-'	toxicology
SELECT T1.atom_id, T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '#'	toxicology
SELECT DISTINCT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE c.bond_id IN (     SELECT bond_id     FROM connected     WHERE atom_id IN (         SELECT atom_id         FROM atom         WHERE molecule_id = 'TR181'     ) );	toxicology
SELECT CAST(SUM(CASE WHEN T1.element = 'f' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(DISTINCT T1.atom_id) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'	toxicology
SELECT CAST(SUM(CASE WHEN T1.bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.bond_id) AS percent FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+';	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR000' GROUP BY element ORDER BY element ASC LIMIT 3	toxicology
SELECT atom_id FROM connected WHERE bond_id = 'TR001_2_6' AND molecule_id = 'TR001';	toxicology
SELECT SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN label = '-' THEN 1 ELSE 0 END) AS difference FROM molecule	toxicology
SELECT atom_id FROM connected WHERE bond_id = 'TR000_2_5'	toxicology
SELECT bond_id FROM connected WHERE atom_id = 'TR000_2' AND atom_id2 = 'TR000_2';	toxicology
SELECT T1.label FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = ' = ' ORDER BY T1.label LIMIT 5	toxicology
SELECT CAST(SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) AS percent FROM bond WHERE molecule_id = 'TR008'	toxicology
SELECT CAST(SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(molecule_id) AS percent FROM molecule	toxicology
SELECT CAST(SUM(CASE WHEN element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM atom WHERE molecule_id = 'TR206'	toxicology
SELECT bond_type FROM bond WHERE molecule_id = 'TR000'	toxicology
SELECT T1.element, T3.label FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN molecule AS T3 ON T2.molecule_id = T3.molecule_id WHERE T3.molecule_id = 'TR060';	toxicology
SELECT bond_type FROM bond WHERE molecule_id = 'TR010' GROUP BY bond_type ORDER BY COUNT(bond_type) DESC LIMIT 1; SELECT label FROM molecule WHERE molecule_id = 'TR010';	toxicology
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-' GROUP BY T1.molecule_id ORDER BY T1.label ASC LIMIT 3	toxicology
SELECT T2.bond_type FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR006' ORDER BY T2.bond_type ASC LIMIT 2	toxicology
SELECT COUNT(*) FROM connected WHERE (atom_id = 'TR009_12' OR atom_id2 = 'TR009_12') AND molecule_id = 'TR009';	toxicology
SELECT COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.element = 'br'	toxicology
SELECT T1.bond_type, T2.atom_id, T2.atom_id2 FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T1.bond_id = 'TR001_6_9';	toxicology
SELECT T1.label ,  CASE WHEN T1.label = '+' THEN 'Carcinogenic' ELSE 'Not Carcinogenic' END AS carcinogenicity FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.atom_id = 'TR001_10'	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id IN ( SELECT molecule_id FROM bond WHERE bond_type = '#' )	toxicology
SELECT COUNT(*) FROM connected WHERE atom_id = 'TR%_19' OR atom_id2 = 'TR%_19';	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.molecule_id = 'TR004'	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '-'	toxicology
SELECT DISTINCT T1.label FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE SUBSTR(T2.atom_id, 7, 2) BETWEEN '21' AND '25' AND T1.label = '+'	toxicology
SELECT b.bond_id, b.bond_type FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE (a1.element = 'p' AND a2.element = 'n') OR (a1.element = 'n' AND a2.element = 'p');	toxicology
SELECT T1.label FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = ' = ' AND T1.label = '+' ORDER BY COUNT(T2.bond_type) DESC LIMIT 1	toxicology
SELECT CAST(SUM(CASE WHEN T1.element = 'i' THEN 1 ELSE 0 END) AS REAL) / COUNT(T1.atom_id) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id	toxicology
SELECT T1.bond_type, T1.bond_id FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE CAST(SUBSTR(T2.atom_id2, 7, 2) AS INT) = 45 OR CAST(SUBSTR(T2.atom_id, 7, 2) AS INT) = 45	toxicology
SELECT element FROM atom WHERE atom_id NOT IN ( SELECT atom_id FROM connected )	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.molecule_id = 'TR041' AND T3.bond_type = '#'	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR144_8_19'	toxicology
SELECT T1.label FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.bond_type = ' = ' GROUP BY T1.label ORDER BY COUNT(T2.bond_id) DESC LIMIT 1	toxicology
SELECT element FROM atom WHERE molecule_id IN ( SELECT molecule_id FROM molecule WHERE label = '+' ) GROUP BY element ORDER BY count(*) ASC LIMIT 1	toxicology
SELECT T1.atom_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 'pb'	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '#'	toxicology
SELECT CAST(COUNT(DISTINCT bond_id) AS REAL) * 100 / ( SELECT MAX(COUNT(atom_id)) FROM atom GROUP BY molecule_id ) FROM connected WHERE atom_id IN ( SELECT atom_id FROM atom WHERE element = ( SELECT element FROM atom GROUP BY element ORDER BY COUNT(element) DESC LIMIT 1 ) )	toxicology
SELECT CAST(SUM(CASE WHEN T1.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_id) FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-'	toxicology
SELECT COUNT(*) FROM atom WHERE element IN ('c', 'h');	toxicology
SELECT T1.atom_id2 FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id2 = T2.atom_id WHERE T2.element = 's'	toxicology
SELECT T2.bond_type FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'sn'	toxicology
SELECT COUNT(DISTINCT T1.element) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-'	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id IN ( SELECT molecule_id FROM bond WHERE bond_type = '#' GROUP BY molecule_id HAVING COUNT(*) >= 3 ) AND element IN ('p', 'br')	toxicology
SELECT T1.bond_id FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'	toxicology
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-' AND T1.label != '-'	toxicology
SELECT CAST(SUM(CASE WHEN T1.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) AS percent FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-';	toxicology
SELECT label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002')	toxicology
SELECT molecule_id FROM molecule WHERE label = '-'	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR030' AND label = '+';	toxicology
SELECT bond_type FROM bond WHERE molecule_id BETWEEN 'TR000' AND 'TR050'	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_10_11'	toxicology
SELECT COUNT(T1.bond_id) FROM bond AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'i'	toxicology
SELECT T1.label FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'ca' GROUP BY T1.label ORDER BY COUNT(T1.label) DESC LIMIT 1	toxicology
SELECT EXISTS (     SELECT 1     FROM atom     JOIN connected ON atom.atom_id = connected.atom_id OR atom.atom_id = connected.atom_id2     WHERE connected.bond_id = 'TR001_1_8' AND atom.element = 'cl' ) AND EXISTS (     SELECT 1     FROM atom     JOIN connected ON atom.atom_id = connected.atom_id OR atom.atom_id = connected.atom_id2     WHERE connected.bond_id = 'TR001_1_8' AND atom.element = 'c' );	toxicology
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN connected AS T3 ON T2.atom_id = T3.atom_id INNER JOIN bond AS T4 ON T3.bond_id = T4.bond_id WHERE T2.element = 'c' AND T4.bond_type = '#' GROUP BY T1.molecule_id HAVING COUNT(T4.bond_id) >= 3 LIMIT 2	toxicology
SELECT CAST(SUM(CASE WHEN T1.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'	toxicology
SELECT DISTINCT atom.element FROM atom JOIN connected ON atom.atom_id = connected.atom_id JOIN bond ON connected.bond_id = bond.bond_id WHERE connected.molecule_id = 'TR001';	toxicology
SELECT molecule_id FROM bond WHERE bond_type = ' = '	toxicology
SELECT T1.atom_id AS first_atom, T1.atom_id2 AS second_atom FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '#' LIMIT 1	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR000_1_2'	toxicology
SELECT COUNT(*) FROM molecule AS m JOIN bond AS b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '-' AND m.label = '-'	toxicology
SELECT T2.label FROM connected AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_id = 'TR001_10_11'	toxicology
SELECT T1.bond_id ,  CASE WHEN T2.label = '+' THEN 'Carcinogenic' ELSE 'Non-Carcinogenic' END AS carcinogenicity FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '#'	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id LIKE '%4' AND T2.label = '+' GROUP BY T1.element	toxicology
SELECT CAST(SUM(CASE WHEN T1.element = 'h' THEN 1 ELSE 0 END) AS REAL) / COUNT(T1.element), T2.label FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR006'	toxicology
SELECT T1.label FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'ca' AND T1.label = '+'	toxicology
SELECT T2.bond_type FROM atom AS T1 INNER JOIN connected AS T3 ON T1.atom_id = T3.atom_id INNER JOIN bond AS T2 ON T3.bond_id = T2.bond_id WHERE T1.element = 'c' AND T2.bond_type IN ('-', '=', '#')	toxicology
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_10_11';	toxicology
SELECT CAST(SUM(CASE WHEN T2.bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_type) FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id	toxicology
SELECT CAST(SUM(CASE WHEN T2.bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_id) FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR047'	toxicology
SELECT CASE WHEN T1.label = '+' THEN 'Carcinogenic' ELSE 'Not Carcinogenic' END AS carcinogenicity FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.atom_id = 'TR001_1'	toxicology
SELECT CASE WHEN label = '+' THEN 'Carcinogenic' ELSE 'Not Carcinogenic' END AS carcinogenicity FROM molecule WHERE molecule_id = 'TR151'	toxicology
SELECT T.element FROM atom AS T WHERE T.molecule_id = 'TR151' AND T.element IN ('cl', 'br')	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+'	toxicology
SELECT atom_id FROM atom WHERE molecule_id BETWEEN 'TR010' AND 'TR050' AND element = 'c';	toxicology
SELECT COUNT(*) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'	toxicology
SELECT T1.bond_id FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' AND T1.bond_type = ' = '	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id IN ( SELECT molecule_id FROM molecule WHERE label = '+' ) AND element = 'h'	toxicology
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_id = 'TR000_1_2' AND T2.molecule_id IN ( SELECT molecule_id FROM atom WHERE atom_id = 'TR000_1' )	toxicology
SELECT atom_id FROM atom WHERE molecule_id IN ( SELECT molecule_id FROM molecule WHERE label = '-' ) AND element = 'c'	toxicology
SELECT CAST(SUM(CASE WHEN T1.label = '+' AND T2.element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id	toxicology
SELECT CASE WHEN EXISTS ( SELECT 1 FROM molecule WHERE molecule_id = 'TR124' AND label = '+' ) THEN 'Yes' ELSE 'No' END AS carcinogenicity	toxicology
SELECT atom_id FROM atom WHERE molecule_id = 'TR186'	toxicology
SELECT bond_type FROM bond WHERE bond_id = 'TR007_4_19'	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_2_4'	toxicology
SELECT COUNT(*) AS double_bond_count, CASE WHEN T1.label = '+' THEN 'Carcinogenic' ELSE 'Non-Carcinogenic' END AS carcinogenicity FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = ' =' AND T1.molecule_id = 'TR006'	toxicology
SELECT T1.label ,  T2.element FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.element IN ('cl', 'c', 'h')	toxicology
SELECT T1.bond_id, T2.element AS atom1, T3.element AS atom2 FROM bond AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id AND T1.bond_id = T2.atom_id INNER JOIN atom AS T3 ON T1.molecule_id = T3.molecule_id AND T1.bond_id = T3.atom_id WHERE T1.bond_type = '-'	toxicology
SELECT DISTINCT m.label, a.element FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#' AND a.element IN ('cl', 'c', 'h')	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR000_2_3'	toxicology
SELECT COUNT(*) FROM atom WHERE element = 'cl';	toxicology
SELECT T1.atom_id ,  COUNT(DISTINCT T2.bond_type) FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR346'	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id IN ( SELECT molecule_id FROM bond WHERE bond_type = '=' ) AND label = '+'	toxicology
SELECT COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 LEFT JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element != 's' AND T1.molecule_id NOT IN ( SELECT molecule_id FROM bond WHERE bond_type = '=' )	toxicology
SELECT T1.label FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_id = 'TR001_2_4'	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR001';	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '-'	toxicology
SELECT T1.label FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'cl' AND T1.label = '+'	toxicology
SELECT T2.label FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'c' AND T2.label != '-'	toxicology
SELECT CAST(SUM(CASE WHEN T1.label = '+' AND T2.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id	toxicology
SELECT molecule_id FROM bond WHERE bond_id = 'TR001_1_7'	toxicology
SELECT COUNT(DISTINCT T1.element) AS num_elements FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 WHERE T2.bond_id = 'TR001_3_4';	toxicology
SELECT T1.bond_type FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T2.atom_id = 'TR000_1' AND T2.atom_id2 = 'TR000_2'	toxicology
SELECT T1.label FROM molecule AS T1 INNER JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.atom_id = 'TR000_2' AND T2.atom_id2 = 'TR000_4'	toxicology
SELECT element FROM atom WHERE atom_id = 'TR000_1';	toxicology
SELECT CASE WHEN label = '+' THEN 'Carcinogenic' ELSE 'Non-Carcinogenic' END AS carcinogenicity FROM molecule WHERE molecule_id = 'TR000'	toxicology
SELECT CAST(COUNT(CASE WHEN T2.bond_type = '-' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.atom_id) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id IN ( SELECT molecule_id FROM atom WHERE element = 'n' ) AND label = '+'	toxicology
SELECT T1.label FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN connected AS T3 ON T2.atom_id = T3.atom_id INNER JOIN bond AS T4 ON T3.bond_id = T4.bond_id WHERE T2.element = 's' AND T4.bond_type = '='	toxicology
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-' GROUP BY T1.molecule_id HAVING COUNT(T2.atom_id) > 5	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '=' AND a.molecule_id = 'TR024';	toxicology
SELECT T1.label FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' GROUP BY T1.label ORDER BY COUNT(T2.atom_id) DESC LIMIT 1	toxicology
SELECT CAST(COUNT(CASE WHEN T1.label = '+' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN connected AS T3 ON T2.atom_id = T3.atom_id INNER JOIN bond AS T4 ON T3.bond_id = T4.bond_id WHERE T2.element = 'h' AND T4.bond_type = '#'	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+'	toxicology
SELECT COUNT(*) FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id BETWEEN 'TR004' AND 'TR010' AND T2.bond_type = '-'	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR008' AND element = 'c';	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR004_7' AND T2.label = '-'	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id IN ( SELECT T1.molecule_id FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'o' AND T3.bond_type = '= ' GROUP BY T1.molecule_id HAVING COUNT(DISTINCT T2.atom_id) > 1 )	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id IN ( SELECT molecule_id FROM bond WHERE bond_type = '#' GROUP BY molecule_id HAVING COUNT(bond_id) >= 3 ) AND label = '-'	toxicology
SELECT T1.element, T2.bond_type FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR002'	toxicology
SELECT T1.atom_id FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.molecule_id = 'TR012' AND T1.element = 'c' AND T3.bond_type = ' = '	toxicology
SELECT T1.atom_id FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' AND T1.element = 'o'	toxicology
SELECT name FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT name FROM cards WHERE borderColor = 'borderless' AND cardKingdomFoilId IS NULL AND cardKingdomId IS NULL	card_games
SELECT name FROM cards WHERE faceConvertedManaCost = ( SELECT MAX(faceConvertedManaCost) FROM cards )	card_games
SELECT name FROM cards WHERE frameVersion = 2015 AND edhrecRank < 100;	card_games
SELECT T1.name FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'mythic' AND T2.format = 'gladiator' AND T2.status = 'Banned'	card_games
SELECT c.name, l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.types = 'Artifact' AND c.side IS NULL AND l.format = 'vintage';	card_games
SELECT c.id, c.artist FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE (c.power = '*' OR c.power IS NULL) AND l.format = 'commander' AND l.status = 'Legal';	card_games
SELECT c.id, r.text, c.hasContentWarning FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Stephen Daniel';	card_games
SELECT T2.text FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Sublime Epiphany' AND T1.number = '74s'	card_games
SELECT c.name, c.artist, c.isPromo FROM cards c JOIN rulings r ON c.uuid = r.uuid GROUP BY c.id ORDER BY COUNT(r.uuid) DESC LIMIT 1;	card_games
SELECT T2.language FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Annul' AND T1.number = '29'	card_games
SELECT T1.name FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.language = 'Japanese'	card_games
SELECT CAST(SUM(CASE WHEN language = 'Chinese Simplified' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(id) FROM foreign_data	card_games
SELECT s.name, s.totalSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian';	card_games
SELECT COUNT(DISTINCT type) FROM cards WHERE artist = 'Aaron Boyd'	card_games
SELECT keywords FROM cards WHERE name = 'Angel of Mercy';	card_games
SELECT COUNT(*) FROM cards WHERE power = '*';	card_games
SELECT promoTypes FROM cards WHERE name = 'Duress'	card_games
SELECT borderColor FROM cards WHERE name = 'Ancestor''s Chosen'	card_games
SELECT originalType FROM cards WHERE name = 'Ancestor''s Chosen';	card_games
SELECT T3.language FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code INNER JOIN set_translations AS T3 ON T2.code = T3.setCode WHERE T1.name = 'Angel of Mercy'	card_games
SELECT COUNT(*) FROM cards WHERE uuid IN ( SELECT uuid FROM legalities WHERE status = 'restricted' ) AND isTextless = 0;	card_games
SELECT T2.text FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Condemn'	card_games
SELECT COUNT(*) FROM cards WHERE uuid IN ( SELECT uuid FROM legalities WHERE status = 'restricted' ) AND isStarter = 1;	card_games
SELECT T2.status FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Cloudchaser Eagle'	card_games
SELECT TYPE FROM cards WHERE name = 'Benalish Knight'	card_games
SELECT T1.text FROM rulings AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Benalish Knight'	card_games
SELECT T1.artist FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Phyrexian';	card_games
SELECT CAST(SUM(CASE WHEN borderColor = 'borderless' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards	card_games
SELECT COUNT(*) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'German' AND T1.isReprint = 1	card_games
SELECT COUNT(*) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.borderColor = 'borderless' AND T2.language = 'Russian'	card_games
SELECT CAST(SUM(CASE WHEN T2.language = 'French' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.isStorySpotlight = 1	card_games
SELECT COUNT(*) FROM cards WHERE toughness = 99;	card_games
SELECT name FROM cards WHERE artist = 'Aaron Boyd'	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND availability LIKE '%mtgo%';	card_games
SELECT id FROM cards WHERE convertedManaCost = 0;	card_games
SELECT DISTINCT layout FROM cards WHERE keywords LIKE '%Flying%'	card_games
SELECT COUNT(*) FROM cards WHERE originalType = 'Summon - Angel' AND subtypes NOT LIKE '%Angel%'	card_games
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT id FROM cards WHERE duelDeck = 'a';	card_games
SELECT edhrecRank FROM cards WHERE frameVersion = '2015';	card_games
SELECT T1.artist FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Chinese Simplified';	card_games
SELECT T1.name FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.availability = 'paper' AND T2.language = 'Japanese'	card_games
SELECT COUNT(*) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.status = 'Banned' AND T1.borderColor = 'white'	card_games
SELECT T1.uuid, T2.language FROM legalities AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.format = 'legacy'	card_games
SELECT T2.text FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Beacon of Immortality';	card_games
SELECT COUNT(DISTINCT T1.uuid), T2.status FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.frameVersion = 'future' AND T2.status = 'legal';	card_games
SELECT c.name, c.colors FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.code = 'OGW';	card_games
SELECT T1.name, T2.language FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid INNER JOIN sets AS T3 ON T1.setCode = T3.code WHERE T1.convertedManaCost = 5 AND T3.code = '10E';	card_games
SELECT T1.name, T3.date FROM cards AS T1 INNER JOIN rulings AS T3 ON T1.uuid = T3.uuid WHERE T1.originalType = 'Creature - Elf'	card_games
SELECT T1.colors ,  T2.format FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.id BETWEEN 1 AND 20;	card_games
SELECT T1.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.originalType = 'Artifact' AND T1.colors = 'B' AND T2.language != 'English'	card_games
SELECT T1.name FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'uncommon' ORDER BY T2.date ASC LIMIT 3	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'John Avon' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NULL	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'UDON' AND availability LIKE '%mtgo%' AND hand = '-1';	card_games
SELECT COUNT(*) FROM cards WHERE frameVersion = '1993' AND availability = 'paper' AND hasContentWarning = 1	card_games
SELECT manaCost FROM cards WHERE layout = 'normal' AND frameVersion = 2003 AND borderColor = 'black' AND availability = 'mtgo,paper';	card_games
SELECT SUM(REPLACE(manaCost, '[', '') + REPLACE(manaCost, ']', '')) AS total_unconverted_mana_cost FROM cards WHERE artist = 'Rob Alexander';	card_games
SELECT DISTINCT subtype FROM cards WHERE availability = 'arena' UNION SELECT DISTINCT supertype FROM cards WHERE availability = 'arena'	card_games
SELECT DISTINCT T1.setCode FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Spanish'	card_games
SELECT CAST(SUM(CASE WHEN isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(id) FROM cards WHERE frameEffects = 'legendary';	card_games
SELECT CAST(SUM(CASE WHEN isStorySpotlight = 1 AND isTextless = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards	card_games
SELECT T2.name ,  CAST(COUNT(CASE WHEN T1.language = 'Spanish' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.id) FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid GROUP BY T2.name	card_games
SELECT T2.language FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.baseSetSize = 309	card_games
SELECT COUNT(*) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Portuguese (Brazil)' AND T1.block = 'Commander'	card_games
SELECT id FROM cards WHERE type LIKE '%Creature%' AND uuid IN (SELECT uuid FROM legalities WHERE status = 'Legal');	card_games
SELECT T1.subtypes, T1.supertypes FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'German' AND T1.subtypes IS NOT NULL AND T1.supertypes IS NOT NULL	card_games
SELECT COUNT(*) FROM cards WHERE power IS NULL OR power = '*' AND text LIKE '%triggered ability%'	card_games
SELECT COUNT(*) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid INNER JOIN rulings AS T3 ON T1.uuid = T3.uuid WHERE T2.format = 'premodern' AND T3.text LIKE '%This is a triggered mana ability.%' AND T1.side IS NULL	card_games
SELECT id FROM cards WHERE artist = 'Erica Yang' AND availability LIKE '%paper%' AND uuid IN ( SELECT uuid FROM legalities WHERE format = 'pauper' )	card_games
SELECT artist FROM cards WHERE uuid = (SELECT uuid FROM foreign_data WHERE text LIKE '%Das perfekte Gegenmittel zu einer dichten Formation%')	card_games
SELECT T1.name FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.language = 'French' AND T2.type = 'Creature' AND T2.layout = 'normal' AND T2.borderColor = 'black' AND T2.artist = 'Matthew D. Wilson'	card_games
SELECT COUNT(DISTINCT T1.uuid) FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'rare' AND T2.date = '2007-02-01'	card_games
SELECT T2.language FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.block = 'Ravnica' AND T1.baseSetSize = 180	card_games
SELECT CAST(SUM(CASE WHEN T1.hasContentWarning = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.format = 'commander' AND T2.status = 'legal'	card_games
SELECT CAST(SUM(CASE WHEN T1.language = 'French' AND (T2.power IS NULL OR T2.power = '*') THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T2.power IS NULL OR T2.power = '*' THEN 1 ELSE 0 END) FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.power IS NULL OR T2.power = '*'	card_games
SELECT CAST(SUM(CASE WHEN T1.language = 'Japanese' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.language) FROM foreign_data AS T1 INNER JOIN set_translations AS T2 ON T1.setcode = T2.setcode WHERE T2.translation LIKE '%Expansion%'	card_games
SELECT DISTINCT availability FROM cards WHERE artist = 'Daren Bader'	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'borderless' AND edhrecRank > 12000;	card_games
SELECT COUNT(*) FROM cards WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1;	card_games
SELECT name FROM cards WHERE power IS NULL OR power = '*' AND promoTypes LIKE '%arena%' ORDER BY name ASC LIMIT 3	card_games
SELECT T1.language FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.multiverseid = 149934	card_games
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL ORDER BY cardKingdomFoilId LIMIT 3;	card_games
SELECT CAST(SUM(CASE WHEN isTextless = 1 AND layout = 'normal' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards	card_games
SELECT number FROM cards WHERE side IS NULL AND subtypes = 'Angel,Wizard'	card_games
SELECT name FROM sets WHERE mtgoCode IS NULL OR mtgoCode = '' ORDER BY name LIMIT 3	card_games
SELECT T2.language FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.mcmName = 'Archenemy' AND T2.language IN ('English', 'French', 'German', 'Italian', 'Spanish')	card_games
SELECT T1.name, T2.translation FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.id = 5	card_games
SELECT T2.language, T1.type FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.id = 206	card_games
SELECT T2.code, T2.id FROM foreign_data AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.language = 'Italian' AND T2.block = 'Shadowmoor' ORDER BY T2.name LIMIT 2	card_games
SELECT T1.id FROM sets AS T1 JOIN foreign_data AS T2 ON T1.code = T2.set_code WHERE T1.isForeignOnly = 1 AND T2.language = 'Japanese'	card_games
SELECT T1.name FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Russian' ORDER BY T1.baseSetSize DESC LIMIT 1	card_games
SELECT CAST(SUM(CASE WHEN T1.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Chinese Simplified'	card_games
SELECT COUNT(DISTINCT T1.setCode) FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.language = 'Japanese' AND (T2.mtgoCode IS NULL OR T2.mtgoCode = '')	card_games
SELECT id FROM cards WHERE borderColor = 'black';	card_games
SELECT id FROM cards WHERE frameEffects = 'extendedart';	card_games
SELECT name FROM cards WHERE borderColor = 'black' AND isFullArt = 1;	card_games
SELECT T2.language FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.id = 174	card_games
SELECT name FROM sets WHERE code = 'ALL';	card_games
SELECT T1.language FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'A Pedra Fellwar'	card_games
SELECT code FROM sets WHERE releaseDate = '2007-07-13';	card_games
SELECT baseSetSize, code FROM sets WHERE block = 'Masques' OR block = 'Mirage';	card_games
SELECT setCode FROM sets WHERE TYPE = 'expansion';	card_games
SELECT T1.name, T1.type FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.watermark = 'Boros'	card_games
SELECT T1.language, T1.flavorText, T2.type FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.watermark = 'colorpie'	card_games
SELECT CAST(SUM(CASE WHEN T1.convertedManaCost = 10 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Abyssal Horror'	card_games
SELECT DISTINCT setCode FROM sets WHERE type LIKE '%expansion commander%'	card_games
SELECT T2.name, T2.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'Abzan'	card_games
SELECT T1.language, T2.type FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.watermark = 'Azorius'	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE availability LIKE '%paper%' AND hand = '3';	card_games
SELECT name FROM cards WHERE isTextless = 0	card_games
SELECT convertedManaCost FROM cards WHERE name = 'Ancestor`s Chosen'	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND (power = '*' OR power IS NULL);	card_games
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL	card_games
SELECT DISTINCT subtypes, supertypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer'	card_games
SELECT DISTINCT T1.purchaseUrls FROM cards AS T1 WHERE T1.promoTypes LIKE '%bundle%'	card_games
SELECT COUNT(DISTINCT artist) FROM cards WHERE borderColor = 'black' AND availability LIKE '%arena,mtgo%'	card_games
SELECT name FROM cards WHERE name IN ('Serra Angel', 'Shrine Keeper') ORDER BY convertedManaCost DESC LIMIT 1	card_games
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer'	card_games
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3	card_games
SELECT T1.translation FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.language = 'Italian' AND T2.name LIKE '%Ancestor%s Chosen%'	card_games
SELECT COUNT(*) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation LIKE '%Angel of Mercy%'	card_games
SELECT T1.name FROM foreign_data AS T1 INNER JOIN sets AS T2 ON T1.setcode = T2.code INNER JOIN set_translations AS T3 ON T2.code = T3.setcode WHERE T3.translation = 'Hauptset Zehnte Edition'	card_games
SELECT EXISTS ( SELECT 1 FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Ancestor''s Chosen' AND T2.language = 'Korean' )	card_games
SELECT COUNT(*) FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T2.translation = 'Hauptset Zehnte Edition' AND T1.artist = 'Adam Rex';	card_games
SELECT T1.baseSetSize FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Hauptset Zehnte Edition';	card_games
SELECT T2.translation FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Eighth Edition' AND T2.language = 'Chinese Simplified'	card_games
SELECT mtgoCode FROM sets WHERE code IN ( SELECT setCode FROM cards WHERE name = 'Angel of Mercy' ) AND mtgoCode IS NOT NULL;	card_games
SELECT T1.releaseDate FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T2.name = 'Ancestor''s Chosen'	card_games
SELECT T1.type FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Hauptset Zehnte Edition'	card_games
SELECT COUNT(*) FROM set_translations WHERE block = 'Ice Age' AND language = 'Italian' AND translation IS NOT NULL;	card_games
SELECT T2.isForeignOnly FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Adarkar Valkyrie'	card_games
SELECT COUNT(DISTINCT s.code) FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian' AND s.baseSetSize < 100;	card_games
SELECT COUNT(*) FROM cards WHERE setCode IN (SELECT code FROM sets WHERE name = 'Coldsnap') AND borderColor = 'black';	card_games
SELECT T1.name FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' ORDER BY T1.convertedManaCost DESC LIMIT 1	card_games
SELECT artist FROM cards WHERE setCode = 'Coldsnap' AND artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy')	card_games
SELECT T1.id FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' AND T1.number = 4;	card_games
SELECT COUNT(*) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' AND T1.convertedManaCost > 5 AND (T1.power = '*' OR T1.power IS NULL);	card_games
SELECT T2.flavorText FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Italian' AND T1.name = 'Ancestor''s Chosen'	card_games
SELECT T1.language FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Ancestor''s Chosen' AND T1.flavorText IS NOT NULL	card_games
SELECT T2.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'German' AND T1.name = 'Ancestor''s Chosen'	card_games
SELECT T2.text FROM sets AS T1 INNER JOIN rulings AS T2 ON T1.code = T2.uuid WHERE T1.name = 'Coldsnap' AND T2.language = 'Italian';	card_games
SELECT T1.name  FROM foreign_data AS T1  JOIN cards AS T2 ON T1.uuid = T2.uuid  JOIN sets AS T3 ON T2.setCode = T3.code  WHERE T3.name = 'Coldsnap' AND T1.language = 'Italian'  ORDER BY T2.convertedManaCost DESC  LIMIT 1;	card_games
SELECT T1.date FROM rulings AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Reminisce'	card_games
SELECT CAST(SUM(CASE WHEN T1.convertedManaCost = 7 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap'	card_games
SELECT CAST(SUM(CASE WHEN cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards WHERE setCode IN ( SELECT code FROM sets WHERE name = 'Coldsnap' )	card_games
SELECT code FROM sets WHERE releaseDate = '2017-07-14';	card_games
SELECT keyruneCode FROM sets WHERE code = 'PKHC'	card_games
SELECT mcmId FROM sets WHERE code = 'SS2'	card_games
SELECT mcmName FROM sets WHERE releaseDate = '2017-06-09';	card_games
SELECT TYPE FROM sets WHERE name LIKE '%From the Vault: Lore%'	card_games
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized';	card_games
SELECT c.name, r.text, CASE WHEN c.hasContentWarning = 1 THEN 'Yes' ELSE 'No' END AS has_missing_or_degraded_properties FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Jim Pavelec';	card_games
SELECT T1.releaseDate FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T2.name = 'Evacuation'	card_games
SELECT T2.baseSetSize FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.translation = 'Rinascita di Alara'	card_games
SELECT T1.type FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Huitième édition'	card_games
SELECT T2.translation FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Tendo Ice Bridge' AND T2.language = 'French';	card_games
SELECT COUNT(*) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Tenth Edition' AND T2.translation IS NOT NULL	card_games
SELECT T2.translation FROM foreign_data AS T1 INNER JOIN set_translations AS T2 ON T1.setcode = T2.setcode WHERE T1.name = 'Fellwar Stone' AND T1.language = 'Japanese';	card_games
SELECT T1.name FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Journey into Nyx Hero''s Path' ORDER BY T1.convertedManaCost DESC LIMIT 1	card_games
SELECT T1.releaseDate FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Ola de frío'	card_games
SELECT T2.type FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Samite Pilgrim'	card_games
SELECT COUNT(*) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'World Championship Decks 2004' AND T1.convertedManaCost = 3;	card_games
SELECT T1.translation FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.language = 'Chinese Simplified' AND T2.name = 'Mirrodin';	card_games
SELECT CAST(SUM(CASE WHEN T1.isNonFoilOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Japanese'	card_games
SELECT CAST(SUM(CASE WHEN T1.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.set_code = T2.set_code WHERE T2.language = 'Portuguese (Brazil)';	card_games
SELECT DISTINCT availability FROM cards WHERE isTextless = 1 AND artist != 'Aleksi Briclot'	card_games
SELECT id FROM sets ORDER BY baseSetSize DESC LIMIT 1	card_games
SELECT artist FROM cards WHERE side IS NULL ORDER BY convertedManaCost DESC LIMIT 1	card_games
SELECT frameEffects FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL GROUP BY frameEffects ORDER BY COUNT(*) DESC LIMIT 1	card_games
SELECT COUNT(*) FROM cards WHERE duelDeck = 'a' AND power IS NULL OR power = '*' AND hasFoil = 0	card_games
SELECT id FROM sets WHERE type = 'commander' ORDER BY totalSetSize DESC LIMIT 1	card_games
SELECT T1.name FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.format = 'duel' ORDER BY CAST(REPLACE(SUBSTR(manaCost, 2), '{', '') AS REAL) DESC LIMIT 10	card_games
SELECT T1.originalReleaseDate, GROUP_CONCAT(DISTINCT T2.format) AS legal_formats FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'mythic' ORDER BY T1.originalReleaseDate ASC LIMIT 1	card_games
SELECT COUNT(*) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Volkan Baǵa' AND T2.language = 'French'	card_games
SELECT COUNT(*) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Abundance' AND T1.types = 'Enchantment' AND T1.rarity = 'rare' AND T2.status = 'Legal'	card_games
SELECT format, GROUP_CONCAT(name) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE status = 'Banned' GROUP BY format ORDER BY COUNT(status = 'Banned') DESC LIMIT 1	card_games
SELECT T2.language FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Battlebond'	card_games
SELECT artist, GROUP_CONCAT(DISTINCT format) FROM cards JOIN legalities ON cards.uuid = legalities.uuid GROUP BY artist ORDER BY COUNT(*) ASC LIMIT 1	card_games
SELECT T1.status FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.frameVersion = '1997' AND T2.artist = 'D. Alexander Gregory' AND T2.hasContentWarning = 1 AND T1.format = 'legacy'	card_games
SELECT T1.name ,  T2.format FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.edhrecRank = 1 AND T2.status = 'Banned'	card_games
SELECT AVG(T1.id), T2.language FROM sets AS T1 INNER JOIN foreign_data AS T2 ON T2.uuid = T1.code WHERE T1.releaseDate BETWEEN '2012-01-01' AND '2015-12-31' GROUP BY T2.language ORDER BY COUNT(T2.language) DESC LIMIT 1	card_games
SELECT artist FROM cards WHERE borderColor = 'black' AND availability LIKE '%arena%' GROUP BY artist;	card_games
SELECT T1.uuid FROM legalities AS T1 JOIN sets AS T2 ON T1.set_code = T2.code WHERE T2.name = 'Old School' AND (T1.status = 'banned' OR T1.status = 'restricted')	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability LIKE '%paper%'	card_games
SELECT T1.text FROM rulings AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.artist = 'Kev Walker' ORDER BY T1.date DESC	card_games
SELECT T1.name, T3.format FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid INNER JOIN sets AS T3 ON T1.setCode = T3.code WHERE T3.name = 'Hour of Devastation' AND T2.status = 'Legal'	card_games
SELECT T1.name FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language LIKE '%Korean%' AND NOT EXISTS (SELECT 1 FROM set_translations AS T3 WHERE T3.setCode = T1.code AND T3.language LIKE '%Japanese%')	card_games
SELECT T1.frameVersion FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Allen Williams' AND T2.status = 'Banned'	card_games
SELECT DisplayName, MAX(Reputation) AS HighestReputation FROM users WHERE DisplayName IN ('Harlan', 'Jarrod Dixon') GROUP BY DisplayName;	codebase_community
SELECT DisplayName FROM users WHERE STRFTIME('%Y', CreationDate) = '2011'	codebase_community
SELECT COUNT(*) FROM users WHERE LastAccessDate > '2014-09-01'	codebase_community
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1	codebase_community
SELECT COUNT(*) FROM users WHERE Upvotes > 100 AND Downvotes > 1;	codebase_community
SELECT COUNT(Id) FROM users WHERE CreationDate > '2013-12-31' AND Views > 10	codebase_community
SELECT COUNT(*) FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT Title FROM posts WHERE OwnerDisplayName = 'csgillespie'	codebase_community
SELECT OwnerDisplayName FROM posts WHERE Title = 'Eliciting priors from experts'	codebase_community
SELECT Title FROM posts WHERE OwnerDisplayName = 'csgillespie' ORDER BY ViewCount DESC LIMIT 1;	codebase_community
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId ORDER BY p.FavoriteCount DESC LIMIT 1	codebase_community
SELECT SUM(T2.CommentCount) AS TotalComments FROM users AS T1 JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName = 'csgillespie';	codebase_community
SELECT MAX(AnswerCount) AS MostAnswers FROM posts WHERE OwnerDisplayName = 'csgillespie';	codebase_community
SELECT OwnerDisplayName FROM posts WHERE Title = 'Examples for teaching: Correlation does not mean causation'	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = 'csgillespie' AND ParentId IS NULL;	codebase_community
SELECT DISTINCT OwnerDisplayName FROM posts WHERE ClosedDate IS NOT NULL	codebase_community
SELECT COUNT(*) FROM posts AS p JOIN users AS u ON p.OwnerUserId = u.Id WHERE u.Age > 65 AND p.Score >= 20;	codebase_community
SELECT T1.Location FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T2.Title = 'Eliciting priors from experts'	codebase_community
SELECT Body FROM posts WHERE Id = ( SELECT ExcerptPostId FROM tags WHERE TagName = 'bayesian' )	codebase_community
SELECT Body FROM posts WHERE Id = ( SELECT ExcerptPostId FROM tags ORDER BY Count DESC LIMIT 1 )	codebase_community
SELECT COUNT(*) FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT COUNT(*) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'csgillespie' AND STRFTIME('%Y', T1.Date) = '2011'	codebase_community
SELECT T1.DisplayName FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId GROUP BY T1.DisplayName ORDER BY COUNT(T2.Id) DESC LIMIT 1	codebase_community
SELECT AVG(Score) FROM posts WHERE OwnerDisplayName = 'csgillespie'	codebase_community
SELECT CAST(COUNT(T1.Id) AS REAL) / COUNT(DISTINCT T1.DisplayName) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.Views > 200	codebase_community
SELECT CAST(SUM(CASE WHEN T2.Age > 65 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.Id) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Score > 5	codebase_community
SELECT COUNT(*) FROM votes WHERE UserId = 58 AND CreationDate LIKE '2010-07-19%'	codebase_community
SELECT CreationDate FROM votes GROUP BY CreationDate ORDER BY COUNT(Id) DESC LIMIT 1	codebase_community
SELECT COUNT(Id) FROM badges WHERE Name = 'Revival';	codebase_community
SELECT p.Title FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.Score = (SELECT MAX(Score) FROM comments);	codebase_community
SELECT COUNT(*) FROM comments WHERE PostId = (SELECT Id FROM posts WHERE ViewCount = 1910)	codebase_community
SELECT FavoriteCount FROM posts WHERE Id IN (SELECT PostId FROM comments WHERE UserId = 3025 AND CreationDate = '2014-04-23 20:29:39.0')	codebase_community
SELECT Text FROM comments WHERE PostId IN (SELECT Id FROM posts WHERE ParentId = 107829 AND CommentCount = 1)	codebase_community
SELECT CASE WHEN ClosedDate IS NULL THEN 'Not Well-Finished' ELSE 'Well-Finished' END AS PostStatus FROM posts WHERE OwnerUserId = 23853 AND CreationDate = '2013-07-12 09:08:18.0';	codebase_community
SELECT u.Reputation FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE p.Id = 65041;	codebase_community
SELECT COUNT(*) FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'Tiago Pasqualini';	codebase_community
SELECT T1.DisplayName FROM users AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.UserId WHERE T2.Id = 6347	codebase_community
SELECT COUNT(*) FROM posts AS p JOIN votes AS v ON p.Id = v.PostId WHERE p.Title LIKE '%data visualization%'	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'DatEpicCoderGuyWhoPrograms';	codebase_community
SELECT CAST(COUNT(posts.Id) AS REAL) / COUNT(votes.Id) FROM posts INNER JOIN votes ON posts.OwnerUserId = votes.UserId WHERE posts.OwnerUserId = 24	codebase_community
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer'	codebase_community
SELECT Text FROM comments WHERE Score = 17;	codebase_community
SELECT DisplayName FROM users WHERE WebsiteUrl = 'http://stackoverflow.com'	codebase_community
SELECT Name FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'SilentGhost')	codebase_community
SELECT UserDisplayName FROM comments WHERE Text = 'thank you user93!';	codebase_community
SELECT Text FROM comments WHERE UserDisplayName = 'A Lion'	codebase_community
SELECT u.DisplayName, u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Title = 'Understanding what Dassault iSight is doing?';	codebase_community
SELECT T2.Text FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.Title = 'How does gentle boosting differ from AdaBoost?'	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Necromancer' LIMIT 10	codebase_community
SELECT LastEditorDisplayName FROM posts WHERE Title = 'Open source tools for visualizing multi-dimensional data?'	codebase_community
SELECT Title FROM posts WHERE LastEditorDisplayName = 'Vebjorn Ljosa'	codebase_community
SELECT SUM(posts.Score), users.WebsiteUrl FROM posts JOIN users ON posts.LastEditorUserId = users.Id WHERE users.DisplayName = 'Yevgeny';	codebase_community
SELECT c.Text FROM comments AS c JOIN posts AS p ON c.PostId = p.Id WHERE p.Title = 'Why square the difference instead of taking the absolute value in standard deviation?'	codebase_community
SELECT SUM(T2.BountyAmount) FROM posts AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.PostId WHERE T1.Title LIKE '%data%' AND T2.VoteTypeId = 8	codebase_community
SELECT u.DisplayName FROM users u JOIN votes v ON u.Id = v.UserId JOIN posts p ON v.PostId = p.Id WHERE v.BountyAmount = 50 AND p.Title LIKE '%variance%'	codebase_community
SELECT AVG(posts.ViewCount) AS AverageViewCount, posts.Title, posts.Body AS Comment FROM posts JOIN postTags ON posts.Id = postTags.PostId JOIN tags ON postTags.TagId = tags.Id WHERE tags.TagName LIKE '%<humor>%' GROUP BY posts.Id;	codebase_community
SELECT COUNT(*) FROM comments WHERE UserId = 13;	codebase_community
SELECT Id FROM users ORDER BY Reputation DESC LIMIT 1	codebase_community
SELECT UserId FROM posts ORDER BY Views ASC LIMIT 1	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Supporter' AND STRFTIME('%Y', Date) = '2011'	codebase_community
SELECT COUNT(UserId) AS UserCount FROM badges GROUP BY UserId HAVING COUNT(Name) > 5;	codebase_community
SELECT COUNT(DISTINCT u.Id) FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'New York, NY' AND b.Name IN ('Teacher', 'Supporter')	codebase_community
SELECT u.DisplayName, u.Reputation FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE p.Id = 1	codebase_community
SELECT u.UserId FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE p.Views >= 1000 GROUP BY u.UserId HAVING COUNT(DISTINCT p.Id) = 1	codebase_community
SELECT u.DisplayName, b.Name FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Id IN ( SELECT UserId FROM comments GROUP BY UserId ORDER BY COUNT(Id) DESC LIMIT 1 )	codebase_community
SELECT COUNT(DISTINCT u.Id) AS UserCount FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location LIKE '%India%' AND b.Name = 'Teacher';	codebase_community
SELECT ((SUM(CASE WHEN STRFTIME('%Y', Date) = '2010' THEN 1 ELSE 0 END) / COUNT(Id) - SUM(CASE WHEN STRFTIME('%Y', Date) = '2011' THEN 1 ELSE 0 END) / COUNT(Id)) * 100) AS PercentageDifference FROM badges WHERE Name = 'Student'	codebase_community
SELECT PostHistoryTypeId ,  COUNT(DISTINCT UserId) FROM postHistory WHERE PostId = 3720 GROUP BY PostHistoryTypeId	codebase_community
SELECT p.Title, p.ViewCount FROM posts p JOIN postlinks pl ON p.Id = pl.RelatedPostId WHERE pl.PostId = 61217	codebase_community
SELECT Score ,  LinkTypeId FROM postLinks WHERE PostId = 395	codebase_community
SELECT PostId, UserId FROM posts WHERE Score > 60;	codebase_community
SELECT SUM(FavoriteCount) FROM posts WHERE OwnerUserId = 686 AND STRFTIME('%Y', CreationDate) = '2011'	codebase_community
SELECT AVG(T1.UpVotes), AVG(T2.Age) FROM users AS T1 JOIN posts AS T2 ON T1.Id = T2.OwnerUserId GROUP BY T1.Id HAVING COUNT(T2.UserId) > 10	codebase_community
SELECT COUNT(UserId) FROM badges WHERE Name = 'Announcer';	codebase_community
SELECT Name FROM badges WHERE Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT COUNT(*) FROM comments WHERE Score > 60;	codebase_community
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:16:14.0'	codebase_community
SELECT COUNT(Id) FROM posts WHERE Score = 10;	codebase_community
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.Reputation = ( SELECT MAX(Reputation) FROM users )	codebase_community
SELECT T2.Reputation FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Date = '2010-07-19 19:39:08.0'	codebase_community
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'Pierre'	codebase_community
SELECT T2.Date FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.Location = 'Rochester, NY'	codebase_community
SELECT CAST(SUM(CASE WHEN Name = 'Teacher' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(Id) FROM badges	codebase_community
SELECT CAST(SUM(CASE WHEN u.Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(u.Id) FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Organizer';	codebase_community
SELECT SUM(Score) FROM comments WHERE PostId IN (SELECT Id FROM posts WHERE CreationDate = '2010-07-19 19:19:56.0')	codebase_community
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:37:33.0'	codebase_community
SELECT u.Age FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'Vienna, Austria';	codebase_community
SELECT COUNT(b.UserId) AS NumberOfAdultSupporters FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age BETWEEN 19 AND 65;	codebase_community
SELECT SUM(users.Views) AS TotalViews FROM badges JOIN users ON badges.UserId = users.Id WHERE badges.Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId ORDER BY T1.Reputation ASC LIMIT 1	codebase_community
SELECT T1.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'Sharpie'	codebase_community
SELECT COUNT(b.UserId) FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age > 65	codebase_community
SELECT DisplayName FROM users WHERE Id = 30;	codebase_community
SELECT COUNT(*) FROM users WHERE Location = 'New York, NY';	codebase_community
SELECT COUNT(*) FROM votes WHERE STRFTIME('%Y', CreationDate) = '2010'	codebase_community
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1	codebase_community
SELECT CAST(SUM(CASE WHEN STRFTIME('%Y', CreationDate) = '2010' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN STRFTIME('%Y', CreationDate) = '2011' THEN 1 ELSE 0 END) AS Ratio FROM votes	codebase_community
SELECT T1.TagName FROM tags AS T1 INNER JOIN postTags AS T2 ON T1.Id = T2.TagId INNER JOIN posts AS T3 ON T2.PostId = T3.Id INNER JOIN users AS T4 ON T3.OwnerUserId = T4.Id WHERE T4.DisplayName = 'John Salvatier'	codebase_community
SELECT COUNT(*) FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'Daniel Vassallo'	codebase_community
SELECT COUNT(*) FROM users AS u JOIN votes AS v ON u.Id = v.UserId WHERE u.DisplayName = 'Harlan'	codebase_community
SELECT Id FROM posts WHERE OwnerDisplayName = 'slashnick' ORDER BY AnswerCount DESC LIMIT 1	codebase_community
SELECT MAX(SUM(ViewCount)) AS MaxPopularity FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName IN ('Harvey Motulsky', 'Noah Snyder') GROUP BY users.DisplayName;	codebase_community
SELECT COUNT(*) FROM posts AS p JOIN users AS u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Matt Parker' AND p.VoteCount > 4;	codebase_community
SELECT COUNT(c.Id) AS NegativeCommentsCount FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score < 60 AND u.DisplayName = 'Neil McGuigan';	codebase_community
SELECT DISTINCT t.TagName FROM tags AS t JOIN posts AS p ON t.Id = p.Tags WHERE p.OwnerDisplayName = 'Mark Meckes' AND p.CommentCount = 0	codebase_community
SELECT T2.DisplayName FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Organizer'	codebase_community
SELECT CAST(SUM(CASE WHEN T3.TagName = 'r' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.PostId) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId INNER JOIN posthistory AS T3 ON T2.Id = T3.PostId WHERE T1.DisplayName = 'Community'	codebase_community
SELECT SUM(CASE WHEN u.DisplayName = 'Mornington' THEN p.ViewCount ELSE 0 END) - SUM(CASE WHEN u.DisplayName = 'Amos' THEN p.ViewCount ELSE 0 END) AS ViewDifference FROM posts p JOIN users u ON p.OwnerUserId = u.Id	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Commentator' AND STRFTIME('%Y', Date) = '2014';	codebase_community
SELECT COUNT(*) FROM posts WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59';	codebase_community
SELECT DisplayName , Age FROM users ORDER BY Views DESC LIMIT 1	codebase_community
SELECT LastEditDate, LastEditorUserId FROM posts WHERE Title = 'Detecting a given face in a database of facial images'	codebase_community
SELECT COUNT(*) FROM comments WHERE UserId = 13 AND Score < 60;	codebase_community
SELECT p.Title, c.UserDisplayName FROM posts AS p JOIN comments AS c ON p.Id = c.PostId WHERE c.Score > 60	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE STRFTIME('%Y', b.Date) = '2011' AND u.Location = 'North Pole';	codebase_community
SELECT OwnerDisplayName, WebsiteUrl FROM posts WHERE FavoriteCount > 150;	codebase_community
SELECT COUNT(*) AS PostHistoryCount, MAX(CreationDate) AS LastEditDate FROM posts AS p JOIN postHistory AS ph ON p.Id = ph.PostId WHERE Title = 'What is the best introductory Bayesian statistics textbook?'	codebase_community
SELECT T2.LastAccessDate, T2.Location FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Outliers'	codebase_community
SELECT T2.Title FROM postLinks AS T1 INNER JOIN posts AS T2 ON T1.RelatedPostId = T2.Id WHERE T2.Title LIKE '%monitoring a value over time%'	codebase_community
SELECT p.Id, b.Name FROM posts AS p INNER JOIN badges AS b ON p.OwnerUserId = b.UserId WHERE p.CreationDate LIKE '%2013%' AND b.Date LIKE '%2013%' AND p.OwnerDisplayName = 'Samuel'	codebase_community
SELECT OwnerDisplayName FROM posts ORDER BY ViewCount DESC LIMIT 1	codebase_community
SELECT DisplayName, Location FROM users WHERE Id IN ( SELECT OwnerUserId FROM posts WHERE Id = ( SELECT ExcerptPostId FROM tags WHERE TagName = 'hypothesis-testing' ) )	codebase_community
SELECT T2.Title, T1.LinkTypeId FROM postLinks AS T1 INNER JOIN posts AS T2 ON T1.RelatedPostId = T2.Id WHERE T1.PostId = ( SELECT Id FROM posts WHERE Title = 'What are principal component scores?' )	codebase_community
SELECT T2.OwnerDisplayName FROM posts AS T1 INNER JOIN posts AS T2 ON T1.ParentId = T2.Id ORDER BY T1.Score DESC LIMIT 1	codebase_community
SELECT DisplayName, WebsiteUrl FROM users WHERE Id IN (SELECT UserId FROM votes WHERE VoteTypeId = 8 ORDER BY BountyAmount DESC LIMIT 1)	codebase_community
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5	codebase_community
SELECT COUNT(*) FROM tags WHERE Count BETWEEN 5000 AND 7000;	codebase_community
SELECT OwnerUserId FROM posts ORDER BY FavoriteCount DESC LIMIT 1	codebase_community
SELECT Age FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users)	codebase_community
SELECT COUNT(DISTINCT PostId) FROM votes WHERE YEAR(CreationDate) = 2011 AND BountyAmount = 50	codebase_community
SELECT Id FROM users ORDER BY Age ASC LIMIT 1	codebase_community
SELECT SUM(Score) FROM posts WHERE LasActivityDate LIKE '2010-07-19%'	codebase_community
SELECT CAST(SUM(CASE WHEN STRFTIME('%Y', CreationDate) = '2010' AND AnswerCount <= 2 THEN 1 ELSE 0 END) AS REAL) / 12 FROM postLinks	codebase_community
SELECT PostId FROM votes WHERE UserId = 1465 ORDER BY FavoriteCount DESC LIMIT 1	codebase_community
SELECT T2.Title FROM postLinks AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id ORDER BY T1.CreationDate ASC LIMIT 1	codebase_community
SELECT T1.DisplayName FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId GROUP BY T1.Id ORDER BY COUNT(T2.Name) DESC LIMIT 1	codebase_community
SELECT MIN(CreationDate) FROM votes AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'chl'	codebase_community
SELECT MIN(T2.CreationDate) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId ORDER BY T1.Age ASC LIMIT 1	codebase_community
SELECT T1.DisplayName FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T2.Name = 'Autobiographer' ORDER BY T2.Date ASC LIMIT 1	codebase_community
SELECT COUNT(DISTINCT u.Id) AS UserCount FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE u.Location = 'United Kingdom' AND p.FavoriteCount >= 4;	codebase_community
SELECT AVG(PostId) FROM votes WHERE UserId IN (SELECT Id FROM users ORDER BY Age DESC LIMIT 1)	codebase_community
SELECT DisplayName FROM users ORDER BY Reputation DESC LIMIT 1	codebase_community
SELECT COUNT(*) FROM users WHERE Reputation > 2000 AND Views > 1000	codebase_community
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = 'Jay Stevens' AND STRFTIME('%Y', CreationDate) = '2010'	codebase_community
SELECT Id, Title FROM posts WHERE OwnerDisplayName = 'Harvey Motulsky' ORDER BY ViewCount DESC LIMIT 1	codebase_community
SELECT Id, Title FROM posts ORDER BY Score DESC LIMIT 1	codebase_community
SELECT AVG(Score) FROM posts WHERE OwnerDisplayName = 'Stephen Turner';	codebase_community
SELECT DISTINCT u.DisplayName FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE p.ViewCount > 20000 AND STRFTIME('%Y', p.CreaionDate) = '2011'	codebase_community
SELECT Id, OwnerDisplayName FROM posts WHERE CreationDate LIKE '2010%' ORDER BY FavoriteCount DESC LIMIT 1	codebase_community
SELECT CAST(SUM(CASE WHEN YEAR(p.CreationDate) = 2011 AND u.Reputation > 1000 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM posts p JOIN users u ON p.OwnerUserId = u.Id	codebase_community
SELECT CAST(SUM(CASE WHEN Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(Id) FROM users	codebase_community
SELECT SUM(ViewCount) AS TotalViews, u.DisplayName AS LastPoster FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Text LIKE '%Computer Game Datasets%' ORDER BY p.LasActivityDate DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts);	codebase_community
SELECT COUNT(*) FROM comments WHERE PostId = ( SELECT Id FROM posts ORDER BY Score DESC LIMIT 1 )	codebase_community
SELECT COUNT(Id) FROM posts WHERE ViewCount > 35000 AND CommentCount = 0	codebase_community
SELECT DisplayName, Location FROM users WHERE Id = ( SELECT LastEditorUserId FROM posts WHERE Id = 183 ORDER BY LastEditDate DESC LIMIT 1 )	codebase_community
SELECT Name FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Emmett') ORDER BY Date DESC LIMIT 1	codebase_community
SELECT COUNT(Id) FROM users WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000	codebase_community
SELECT julianday(b.Date) - julianday(u.CreationDate) AS DaysToBadge FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Zolomon';	codebase_community
SELECT COUNT(DISTINCT p.Id) AS PostCount, COUNT(DISTINCT c.PostId) AS CommentCount FROM users u LEFT JOIN posts p ON u.Id = p.OwnerUserId LEFT JOIN comments c ON u.Id = c.UserId WHERE u.CreationDate = (SELECT MAX(CreationDate) FROM users);	codebase_community
SELECT T2.Text, T2.UserDisplayName FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.Title = 'Analysing wind data with R' ORDER BY T2.CreationDate DESC LIMIT 10;	codebase_community
SELECT COUNT(UserId) FROM badges WHERE Name = 'Citizen Patrol';	codebase_community
SELECT COUNT(T1.Id) FROM posts AS T1 INNER JOIN postTags AS T2 ON T1.Id = T2.PostId INNER JOIN tags AS T3 ON T2.TagId = T3.Id WHERE T3.TagName = 'careers'	codebase_community
SELECT Reputation, ViewCount FROM users WHERE DisplayName = 'Jarrod Dixon'	codebase_community
SELECT COUNT(CASE WHEN PostId IN ( SELECT Id FROM posts WHERE Title = 'Clustering 1D data' ) THEN 1 ELSE NULL END) AS TotalCommentsAnswers FROM comments UNION ALL SELECT COUNT(CASE WHEN PostId IN ( SELECT Id FROM posts WHERE Title = 'Clustering 1D data' ) THEN 1 ELSE NULL END) AS TotalCommentsAnswers FROM posthistory	codebase_community
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat'	codebase_community
SELECT COUNT(*) FROM votes WHERE BountyAmount >= 30;	codebase_community
SELECT CAST(SUM(CASE WHEN Score > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM posts AS stats_posts JOIN users AS stats_users ON stats_posts.OwnerUserId = stats_users.Id ORDER BY stats_users.Reputation DESC LIMIT 1	codebase_community
SELECT COUNT(*) FROM posts WHERE Score < 20;	codebase_community
SELECT COUNT(Id) FROM tags WHERE Id < 15 AND Count <= 20	codebase_community
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample';	codebase_community
SELECT u.Reputation, u.UpVotes FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text LIKE '%fine, you win :)%';	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title LIKE '%linear regression%';	codebase_community
SELECT Text FROM comments WHERE PostId IN (SELECT Id FROM posts WHERE ViewCount BETWEEN 100 AND 150) ORDER BY Score DESC LIMIT 1	codebase_community
SELECT T2.CreationDate , TIMESTAMPDIFF(YEAR, T2.CreationDate, GETDATE()) AS Age FROM comments AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Text LIKE '%http://%';	codebase_community
SELECT COUNT(DISTINCT PostId) FROM comments WHERE Score = 0 AND PostId IN ( SELECT Id FROM posts WHERE ViewCount < 5 )	codebase_community
SELECT COUNT(*) FROM posts AS p JOIN comments AS c ON p.Id = c.PostId WHERE p.CommentCount = 1 AND c.Score = 0;	codebase_community
SELECT COUNT(DISTINCT c.UserId) AS TotalUsers FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score = 0 AND u.Age = 40;	codebase_community
SELECT p.Id, c.Text FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Title = 'Group differences on a five point Likert item'	codebase_community
SELECT SUM(CASE WHEN T2.Text = 'R is also lazy evaluated.' THEN 1 ELSE 0 END) FROM votes AS T1 INNER JOIN comments AS T2 ON T1.PostId = T2.PostId WHERE T1.VoteTypeId = 2	codebase_community
SELECT Text FROM comments WHERE UserDisplayName = 'Harvey Motulsky'	codebase_community
SELECT UserDisplayName FROM comments WHERE Score BETWEEN 1 AND 5 AND UserId NOT IN ( SELECT Id FROM users WHERE DownVotes > 0 )	codebase_community
SELECT CAST(SUM(CASE WHEN u.UpVotes = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(c.UserId) AS Percentage FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score BETWEEN 5 AND 10;	codebase_community
SELECT T2.power_name FROM superhero AS T1 INNER JOIN hero_power AS T3 ON T1.id = T3.hero_id INNER JOIN superpower AS T2 ON T3.power_id = T2.id WHERE T1.superhero_name = '3-D Man'	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Super Strength';	superhero
SELECT COUNT(*) FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE sp.power_name = 'Super Strength' AND s.height_cm > 200;	superhero
SELECT T1.full_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id GROUP BY T1.full_name HAVING COUNT(T2.power_id) > 15	superhero
SELECT COUNT(*) FROM superhero WHERE eye_colour_id IN ( SELECT id FROM colour WHERE colour = 'Blue' )	superhero
SELECT T3.colour FROM superhero AS T1 INNER JOIN colour AS T3 ON T1.skin_colour_id = T3.id WHERE T1.superhero_name = 'Apocalypse'	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN power AS T3 ON T2.power_id = T3.id INNER JOIN colour AS T4 ON T1.eye_colour_id = T4.id WHERE T4.colour = 'Blue' AND T3.power_name = 'Agility'	superhero
SELECT superhero_name FROM superhero WHERE eye_colour_id IN ( SELECT id FROM colour WHERE colour = 'Blue' ) AND hair_colour_id IN ( SELECT id FROM colour WHERE colour = 'Blond' )	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics'	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics' ORDER BY T1.height_cm DESC	superhero
SELECT T.publisher_name FROM ( SELECT DISTINCT T1.publisher_name FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id WHERE T2.superhero_name = 'Sauron' ) t	superhero
SELECT T2.colour, COUNT(T1.superhero_id) AS count FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id INNER JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T3.publisher_name = 'Marvel Comics' GROUP BY T2.colour ORDER BY count DESC;	superhero
SELECT AVG(height_cm) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics'	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id INNER JOIN publisher AS T4 ON T1.publisher_id = T4.id WHERE T4.publisher_name = 'Marvel Comics' AND T3.power_name = 'Super Strength'	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'DC Comics'	superhero
SELECT T3.publisher_name FROM hero_attribute AS T1 INNER JOIN attribute AS T2 ON T1.attribute_id = T2.id INNER JOIN superhero AS T3 ON T1.hero_id = T3.id WHERE T2.attribute_name = 'Speed' ORDER BY T1.attribute_value ASC LIMIT 1	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id INNER JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T2.colour = 'Gold' AND T3.publisher_name = 'Marvel Comics'	superhero
SELECT T2.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name = 'Blue Beetle II'	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.hair_colour_id = T2.id WHERE T2.colour = 'Blond'	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Intelligence' ORDER BY T2.attribute_value ASC LIMIT 1	superhero
SELECT T2.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.superhero_name = 'Copycat'	superhero
SELECT superhero_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Durability' AND T2.attribute_value < 50	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Death Touch'	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T1.gender_id = 2 AND T3.attribute_name = 'Strength' AND T2.attribute_value = 100;	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id GROUP BY T1.superhero_name ORDER BY COUNT(T2.power_id) DESC LIMIT 1	superhero
SELECT COUNT(*) FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Vampire')	superhero
SELECT CAST(SUM(CASE WHEN T1.alignment = 'Bad' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id), SUM(CASE WHEN T2.publisher_name = 'Marvel Comics' AND T1.alignment = 'Bad' THEN 1 ELSE 0 END) FROM alignment AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id	superhero
SELECT SUM(CASE WHEN T2.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) - SUM(CASE WHEN T2.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) AS difference FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id	superhero
SELECT id FROM publisher WHERE publisher_name = 'Star Trek'	superhero
SELECT AVG(attribute_value) FROM hero_attribute;	superhero
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL;	superhero
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T2.id = 75	superhero
SELECT T2.power_name FROM superhero AS T1 INNER JOIN hero_power AS T3 ON T1.id = T3.hero_id INNER JOIN superpower AS T2 ON T3.power_id = T2.id WHERE T1.superhero_name = 'Deathlok'	superhero
SELECT AVG(weight_kg) FROM superhero WHERE gender_id = (SELECT id FROM gender WHERE gender = 'Female')	superhero
SELECT T1.power_name FROM superpower AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.power_id INNER JOIN superhero AS T3 ON T2.hero_id = T3.id INNER JOIN gender AS T4 ON T3.gender_id = T4.id WHERE T4.gender = 'Male' LIMIT 5	superhero
SELECT superhero_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Alien')	superhero
SELECT superhero_name FROM superhero WHERE height_cm BETWEEN 170 AND 190 AND eye_colour_id = 1	superhero
SELECT T2.power_name FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T1.hero_id = 56;	superhero
SELECT full_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Demi-God') LIMIT 5	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 2;	superhero
SELECT T2.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.weight_kg = 169	superhero
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.hair_colour_id = T2.id WHERE T1.height_cm = 185 AND T1.race_id = ( SELECT id FROM race WHERE race = 'Human' )	superhero
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.eye_colour_id ORDER BY T2.weight_kg DESC LIMIT 1	superhero
SELECT CAST(SUM(CASE WHEN T2.publisher_id = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.height_cm BETWEEN 150 AND 180;	superhero
SELECT superhero_name FROM superhero WHERE gender_id = 1 AND weight_kg > ( SELECT AVG(weight_kg) * 0.79 FROM superhero )	superhero
SELECT T2.power_name FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id GROUP BY T2.power_name ORDER BY COUNT(T2.power_name) DESC LIMIT 1	superhero
SELECT T1.attribute_value FROM hero_attribute AS T1 INNER JOIN superhero AS T2 ON T1.hero_id = T2.id WHERE T2.superhero_name = 'Abomination'	superhero
SELECT T2.power_name FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T1.hero_id = 1	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Stealth'	superhero
SELECT T1.full_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Strength' ORDER BY T2.attribute_value DESC LIMIT 1	superhero
SELECT CAST(SUM(CASE WHEN skin_colour_id = 1 THEN 1 ELSE 0 END) AS REAL) / COUNT(id) FROM superhero	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Dark Horse Comics'	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN publisher p ON s.publisher_id = p.id WHERE a.attribute_name = 'Durability' AND p.publisher_name = 'Dark Horse Comics' ORDER BY ha.attribute_value DESC LIMIT 1	superhero
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T2.full_name = 'Abraham Sapien'	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Flight'	superhero
SELECT T3.colour AS eye_colour, T4.colour AS hair_colour, T5.colour AS skin_colour FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id INNER JOIN colour AS T3 ON T1.eye_colour_id = T3.id INNER JOIN colour AS T4 ON T1.hair_colour_id = T4.id INNER JOIN colour AS T5 ON T1.skin_colour_id = T5.id INNER JOIN publisher AS T6 ON T1.publisher_id = T6.id WHERE T2.gender = 'Female' AND T6.publisher_name = 'Dark Horse Comics'	superhero
SELECT T1.superhero_name ,  T3.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T1.hair_colour_id = T1.skin_colour_id AND T1.hair_colour_id = T1.eye_colour_id	superhero
SELECT T1.race FROM race AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T2.superhero_name = 'A-Bomb'	superhero
SELECT CAST(COUNT(CASE WHEN T1.skin_colour_id = 5 THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.gender_id) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.skin_colour_id = T2.id INNER JOIN gender AS T3 ON T1.gender_id = T3.id WHERE T3.gender = 'Female'	superhero
SELECT T1.superhero_name ,  T2.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.full_name = 'Charles Chandler'	superhero
SELECT T1.gender FROM gender AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.gender_id WHERE T2.superhero_name = 'Agent 13'	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Adaptation'	superhero
SELECT COUNT(power_id) FROM hero_power AS HP JOIN superhero AS SH ON HP.hero_id = SH.id WHERE SH.superhero_name = 'Amazo'	superhero
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.full_name = 'Hunter Zolomon'	superhero
SELECT T1.height_cm FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Amber'	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id INNER JOIN colour AS T3 ON T1.hair_colour_id = T3.id WHERE T2.colour = 'Black' AND T3.colour = 'Black'	superhero
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.skin_colour_id WHERE T1.colour = 'Gold'	superhero
SELECT full_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Vampire')	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T2.alignment = 'Neutral'	superhero
SELECT COUNT(*) FROM superhero AS s JOIN hero_attribute AS ha ON s.id = ha.hero_id JOIN attribute AS a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Strength' AND ha.attribute_value = ( SELECT MAX(attribute_value) FROM hero_attribute WHERE attribute_id = ( SELECT id FROM attribute WHERE attribute_name = 'Strength' ) );	superhero
SELECT T1.race, T2.alignment FROM race AS T1 INNER JOIN alignment AS T2 ON T1.id = T2.id INNER JOIN superhero AS T3 ON T1.id = T3.race_id AND T2.id = T3.alignment_id WHERE T3.superhero_name = 'Cameron Hicks'	superhero
SELECT CAST(SUM(CASE WHEN T1.gender = 'Female' AND T2.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.publisher_name) FROM gender AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.gender_id INNER JOIN publisher AS T3 ON T2.publisher_id = T3.id	superhero
SELECT AVG(weight_kg) FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Alien')	superhero
SELECT ABS(( SELECT weight_kg FROM superhero WHERE full_name = 'Emil Blonsky' ) - ( SELECT weight_kg FROM superhero WHERE full_name = 'Charles Chandler' )) AS weight_difference	superhero
SELECT AVG(height_cm) FROM superhero GROUP BY id;	superhero
SELECT T2.power_name FROM superhero AS T1 INNER JOIN hero_power AS T3 ON T1.id = T3.hero_id INNER JOIN superpower AS T2 ON T3.power_id = T2.id WHERE T1.superhero_name = 'Abomination'	superhero
SELECT COUNT(*) FROM superhero WHERE race_id = 21 AND gender_id = 1;	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Speed' ORDER BY T2.attribute_value DESC LIMIT 1	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3	superhero
SELECT T2.attribute_name ,  T1.attribute_value FROM hero_attribute AS T1 INNER JOIN attribute AS T2 ON T1.attribute_id = T2.id WHERE T1.hero_id = ( SELECT id FROM superhero WHERE superhero_name = '3-D Man' )	superhero
SELECT superhero_name FROM superhero WHERE eye_colour_id IN ( SELECT id FROM colour WHERE colour = 'Blue' ) AND hair_colour_id IN ( SELECT id FROM colour WHERE colour = 'Brown' )	superhero
SELECT T.publisher_name FROM ( SELECT DISTINCT CASE WHEN T2.superhero_name = 'Hawkman' THEN T1.publisher_name END AS publisher_name FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id ) WHERE publisher_name IS NOT NULL UNION ALL SELECT T.publisher_name FROM ( SELECT DISTINCT CASE WHEN T2.superhero_name = 'Karate Kid' THEN T1.publisher_name END AS publisher_name FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id ) WHERE publisher_name IS NOT NULL UNION ALL SELECT T.publisher_name FROM ( SELECT DISTINCT CASE WHEN T2.superhero_name = 'Speedy' THEN T1.publisher_name END AS publisher_name FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id ) WHERE publisher_name IS NOT NULL	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = 1;	superhero
SELECT CAST(SUM(CASE WHEN T2.eye_colour_id = 7 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id	superhero
SELECT CAST(SUM(CASE WHEN gender_id = 1 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN gender_id = 2 THEN 1 ELSE 0 END) AS ratio FROM superhero	superhero
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1	superhero
SELECT id FROM superpower WHERE power_name = 'Cryokinesis'	superhero
SELECT superhero_name FROM superhero WHERE id = 294	superhero
SELECT full_name FROM superhero WHERE weight_kg = 0 OR weight_kg IS NULL;	superhero
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T2.full_name = 'Karen Beecher-Duncan'	superhero
SELECT T1.power_name FROM superpower AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.power_id INNER JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.full_name = 'Helen Parr'	superhero
SELECT T1.race FROM race AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T2.weight_kg = 108 AND T2.height_cm = 188	superhero
SELECT T.publisher_name FROM publisher AS T JOIN superhero AS S ON T.id = S.publisher_id WHERE S.id = 38	superhero
SELECT T1.race FROM race AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.race_id INNER JOIN hero_attribute AS T3 ON T2.id = T3.hero_id ORDER BY T3.attribute_value DESC LIMIT 1	superhero
SELECT T3.alignment, T4.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN alignment AS T3 ON T1.alignment_id = T3.id INNER JOIN superpower AS T4 ON T2.power_id = T4.id WHERE T1.superhero_name = 'Atom IV'	superhero
SELECT superhero_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Blue' LIMIT 5	superhero
SELECT AVG(attribute_value) FROM hero_attribute WHERE hero_id IN (SELECT id FROM superhero WHERE alignment_id = 3)	superhero
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.skin_colour_id INNER JOIN hero_attribute AS T3 ON T2.id = T3.hero_id WHERE T3.attribute_value = 100	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id INNER JOIN gender AS T3 ON T1.gender_id = T3.id WHERE T2.id = 1 AND T3.id = 2	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T2.attribute_value BETWEEN 75 AND 80	superhero
SELECT T2.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id INNER JOIN colour AS T3 ON T1.hair_colour_id = T3.id INNER JOIN gender AS T4 ON T1.gender_id = T4.id WHERE T3.colour = 'blue' AND T4.gender = 'Male'	superhero
SELECT CAST(SUM(CASE WHEN T2.gender = 2 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id INNER JOIN alignment AS T3 ON T1.alignment_id = T3.id WHERE T3.id = 2	superhero
SELECT SUM(CASE WHEN T1.eye_colour_id = 7 THEN 1 ELSE 0 END) - SUM(CASE WHEN T1.eye_colour_id = 1 THEN 1 ELSE 0 END) AS difference FROM superhero AS T1 LEFT JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.weight_kg = 0 OR T1.weight_kg IS NULL	superhero
SELECT T2.attribute_value FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T1.superhero_name = 'Hulk' AND T3.attribute_name = 'Strength'	superhero
SELECT T2.power_name FROM superhero AS T1 INNER JOIN hero_power AS T3 ON T1.id = T3.hero_id INNER JOIN superpower AS T2 ON T3.power_id = T2.id WHERE T1.superhero_name = 'Ajax'	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.skin_colour_id = T2.id INNER JOIN alignment AS T3 ON T1.alignment_id = T3.id WHERE T2.colour = 'Green' AND T3.alignment = 'Bad'	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id INNER JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T2.gender = 'Female' AND T3.publisher_name = 'Marvel Comics'	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Wind Control' ORDER BY T1.superhero_name ASC	superhero
SELECT T1.gender FROM gender AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.gender_id INNER JOIN hero_power AS T3 ON T2.id = T3.hero_id INNER JOIN superpower AS T4 ON T3.power_id = T4.id WHERE T4.power_name = 'Phoenix Force'	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'DC Comics' ORDER BY T1.weight_kg DESC LIMIT 1	superhero
SELECT AVG(T1.height_cm) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Dark Horse Comics' AND T1.race != 'Human'	superhero
SELECT COUNT(*) FROM superhero AS s JOIN hero_attribute AS ha ON s.id = ha.hero_id JOIN attribute AS a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' AND ha.attribute_value = 100;	superhero
SELECT SUM(CASE WHEN T1.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) - SUM(CASE WHEN T1.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS difference FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id	superhero
SELECT T2.attribute_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T1.superhero_name = 'Black Panther' ORDER BY T2.attribute_value ASC LIMIT 1	superhero
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T2.superhero_name = 'Abomination'	superhero
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1	superhero
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler'	superhero
SELECT CAST(SUM(CASE WHEN T1.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM gender AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.gender_id INNER JOIN publisher AS T3 ON T2.publisher_id = T3.id WHERE T3.publisher_name = 'George Lucas'	superhero
SELECT CAST(SUM(CASE WHEN T1.alignment = 'Good' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM alignment AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.alignment_id INNER JOIN publisher AS T3 ON T2.publisher_id = T3.id WHERE T3.publisher_name = 'Marvel Comics'	superhero
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%'	superhero
SELECT hero_id FROM hero_attribute ORDER BY attribute_value ASC LIMIT 1	superhero
SELECT full_name FROM superhero WHERE superhero_name = 'Alien'	superhero
SELECT T1.full_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.weight_kg < 100 AND T2.colour = 'Brown'	superhero
SELECT T1.attribute_value FROM hero_attribute AS T1 INNER JOIN superhero AS T2 ON T1.hero_id = T2.id WHERE T2.superhero_name = 'Aquababy'	superhero
SELECT T1.weight_kg, T2.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.id = 40	superhero
SELECT AVG(height_cm) FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Neutral')	superhero
SELECT T1.hero_id FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T2.power_name = 'Intelligence'	superhero
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.superhero_name = 'Blackwulf'	superhero
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.height_cm > ( SELECT AVG(height_cm) * 0.8 FROM superhero )	superhero
SELECT T1.driverRef FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 20 AND T2.q1 IS NOT NULL ORDER BY T2.q1 ASC LIMIT 5	formula_1
SELECT T1.surname FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 19 ORDER BY T2.q2 ASC LIMIT 1	formula_1
SELECT DISTINCT YEAR FROM races WHERE circuitid IN ( SELECT circuitid FROM circuits WHERE LOCATION = 'Shanghai' )	formula_1
SELECT T1.url FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Circuit de Barcelona-Catalunya'	formula_1
SELECT T2.name FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.country = 'Germany'	formula_1
SELECT T2.position FROM constructors AS T1 INNER JOIN constructorStandings AS T2 ON T1.constructorid = T2.constructorid WHERE T1.name = 'Renault'	formula_1
SELECT COUNT(*) FROM races WHERE YEAR = 2010 AND name LIKE '%Grand Prix%' AND country NOT IN ('Asia', 'Europe')	formula_1
SELECT T1.name FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.country = 'Spain'	formula_1
SELECT T1.lat, T1.lng FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Australian Grand Prix'	formula_1
SELECT T1.url FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = "Sepang International Circuit"	formula_1
SELECT T1.date FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Sepang International Circuit'	formula_1
SELECT T1.lat, T1.lng FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Abu Dhabi Grand Prix'	formula_1
SELECT T1.country FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid JOIN constructorstandings AS T3 ON T2.raceid = T3.raceid WHERE T3.points = 1 AND T2.raceid = 24	formula_1
SELECT q1 FROM qualifying WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Bruno' AND surname = 'Senna') AND raceId = 354	formula_1
SELECT T1.nationality FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T2.q2 = '01:40' AND T2.raceid = 355	formula_1
SELECT driverId FROM qualifying WHERE raceId = 903 AND q3 LIKE '0:01:%'	formula_1
SELECT COUNT(*) FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.name = 'Bahrain Grand Prix' AND T1.position > 1;	formula_1
SELECT T1.url FROM seasons AS T1 JOIN races AS T2 ON T1.year = T2.year WHERE T2.raceid = 901	formula_1
SELECT COUNT(DISTINCT driverid) FROM results WHERE raceid IN ( SELECT raceid FROM races WHERE date = '2015-11-29' ) AND position <= 10	formula_1
SELECT T1.driverid ,  T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 592 AND T2.statusid != 2 ORDER BY T1.dob ASC LIMIT 1	formula_1
SELECT T1.url FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 161 AND T2.laptime LIKE '1:27%'	formula_1
SELECT T1.nationality FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.fastestlapspeed = ( SELECT MAX(fastestlapspeed) FROM results ) AND T2.raceid = 933	formula_1
SELECT T1.lat, T1.lng FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Malaysian Grand Prix'	formula_1
SELECT T2.url FROM constructorResults AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T1.raceId = 9 ORDER BY T1.points DESC LIMIT 1	formula_1
SELECT q1 FROM qualifying WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lucas' AND surname = 'Di Grassi') AND raceId = 345;	formula_1
SELECT T1.nationality FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T2.q2 = '01:15' AND T2.raceid = 347	formula_1
SELECT T1.code FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 45 AND T2.q3 LIKE '1:33%'	formula_1
SELECT T1.time FROM results AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T2.forename = 'Bruce' AND T2.surname = 'McLaren' AND T1.raceid = 743	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.position = 2 AND T2.raceid IN ( SELECT raceid FROM races WHERE name = 'San Marino Grand Prix' AND YEAR = 2006 )	formula_1
SELECT T2.url FROM races AS T1 INNER JOIN seasons AS T2 ON T1.year = T2.year WHERE T1.raceid = 901	formula_1
SELECT COUNT(*) FROM results WHERE raceId = (SELECT raceId FROM races WHERE date = '2015-11-29') AND statusId != 1;	formula_1
SELECT MIN(dob) FROM results WHERE raceId = 872 AND TIME IS NOT NULL	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 348 ORDER BY T2.milliseconds LIMIT 1	formula_1
SELECT T1.nationality FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid ORDER BY T2.fastestlapspeed DESC LIMIT 1	formula_1
SELECT ((SELECT T1.fastestLapSpeed FROM results AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T2.forename = 'Paul' AND T2.surname = 'di Resta' AND T1.raceid = 853) - (SELECT T1.fastestLapSpeed FROM results AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T2.forename = 'Paul' AND T2.surname = 'di Resta' AND T1.raceid = 854)) / (SELECT T1.fastestLapSpeed FROM results AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T2.forename = 'Paul' AND T2.surname = 'di Resta' AND T1.raceid = 853) * 100	formula_1
SELECT CAST(SUM(CASE WHEN T2.Time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.driverid) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.date = '1983-07-16'	formula_1
SELECT MIN(YEAR) FROM races WHERE name = 'Singapore Grand Prix'	formula_1
SELECT COUNT(*) AS race_count FROM races WHERE YEAR = 2005; SELECT name FROM races WHERE YEAR = 2005 ORDER BY date DESC;	formula_1
SELECT name FROM races WHERE date IN ( SELECT MIN(date) FROM races )	formula_1
SELECT name, date FROM races WHERE YEAR = 1999 ORDER BY round DESC LIMIT 1	formula_1
SELECT YEAR FROM races GROUP BY YEAR ORDER BY COUNT(*) DESC LIMIT 1	formula_1
SELECT DISTINCT r.name FROM races r WHERE r.year = 2017 AND r.circuitid NOT IN (SELECT circuitid FROM races WHERE year = 2000)	formula_1
SELECT T1.country, T2.name, T2.location FROM circuits AS T2 JOIN races AS T1 ON T1.circuitid = T2.circuitid WHERE T1.year = ( SELECT MIN(year) FROM races ) AND T1.country LIKE '%Europe%'	formula_1
SELECT MAX(T1.year) FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Brands Hatch' AND T1.name = 'British Grand Prix'	formula_1
SELECT COUNT(*) FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = 'Silverstone') AND name LIKE '%British Grand Prix%'	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid IN ( SELECT raceid FROM races WHERE name = 'Singapore Grand Prix' AND YEAR = 2010 ) ORDER BY T2.position;	formula_1
SELECT T1.forename ,  T1.surname ,  MAX(T2.points) FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid	formula_1
SELECT T1.forename, T1.surname, T2.points FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = (SELECT raceid FROM races WHERE name = 'Chinese Grand Prix' AND YEAR = 2017) ORDER BY T2.points DESC LIMIT 3	formula_1
SELECT D.forename, D.surname, R.name FROM drivers AS D JOIN laptimes AS L ON D.driverid = L.driverid JOIN races AS R ON L.raceid = R.raceid ORDER BY L.milliseconds ASC LIMIT 1	formula_1
SELECT AVG(T2.milliseconds) FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton' AND T3.name = 'Malaysian Grand Prix'	formula_1
SELECT CAST(SUM(CASE WHEN T1.surname = 'Hamilton' AND T2.position > 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.year >= 2010	formula_1
SELECT T1.forename ,  T1.surname ,  T1.nationality ,  T1.points FROM drivers AS T1 JOIN driverstandings AS T2 ON T1.driverid = T2.driverid GROUP BY T1.driverid ORDER BY COUNT(T2.wins) DESC LIMIT 1	formula_1
SELECT MIN(YEAR(CURRENT_TIMESTAMP) - YEAR(dob)) AS age, forename, surname FROM drivers WHERE nationality = 'Japanese'	formula_1
SELECT c.circuitid, c.name FROM circuits c JOIN races r ON c.circuitid = r.circuitid WHERE r.date BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY c.circuitid HAVING COUNT(r.raceid) = 4;	formula_1
SELECT c.name, c.location, r.name FROM circuits AS c JOIN races AS r ON c.circuitid = r.circuitid WHERE c.country = 'USA' AND r.year = 2006;	formula_1
SELECT r.name, c.name AS circuit_name, c.location FROM races r JOIN circuits c ON r.circuitid = c.circuitid WHERE MONTH(r.date) = 9 AND YEAR(r.date) = 2005;	formula_1
SELECT r.name FROM races r JOIN results res ON r.raceid = res.raceid JOIN drivers d ON res.driverid = d.driverid WHERE d.forename = 'Alex' AND d.surname = 'Yoong' AND res.position < 20;	formula_1
SELECT COUNT(*) FROM results AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid JOIN circuits AS T3 ON T1.circuitid = T3.circuitid WHERE T2.forename = 'Michael' AND T2.surname = 'Schumacher' AND T3.name = 'Sepang International Circuit' AND T1.points = ( SELECT MAX(points) FROM results AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid JOIN circuits AS T3 ON T1.circuitid = T3.circuitid WHERE T2.forename = 'Michael' AND T2.surname = 'Schumacher' AND T3.name = 'Sepang International Circuit' )	formula_1
SELECT T1.name, T1.year FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T3.forename = 'Michael' AND T3.surname = 'Schumacher' ORDER BY T2.fastestlapspeed DESC LIMIT 1	formula_1
SELECT AVG(T1.points) FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T2.forename = 'Eddie' AND T2.surname = 'Irvine' AND T1.year = 2000	formula_1
SELECT T1.year, T1.points FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton' ORDER BY T1.year ASC LIMIT 1	formula_1
SELECT T1.name ,  T2.country FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.year = 2017 ORDER BY T1.date	formula_1
SELECT T1.name, T1.year, T2.location FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid ORDER BY T1.laps DESC LIMIT 1	formula_1
SELECT CAST(SUM(CASE WHEN T1.country = 'Germany' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'European Grand Prix'	formula_1
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit'	formula_1
SELECT name FROM circuits WHERE lat = (SELECT MAX(lat) FROM circuits WHERE name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring'))	formula_1
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit'	formula_1
SELECT country FROM circuits WHERE alt = ( SELECT MAX(alt) FROM circuits )	formula_1
SELECT COUNT(*) FROM drivers WHERE code IS NULL	formula_1
SELECT T1.country FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid JOIN constructorstandings AS T3 ON T2.raceid = T3.raceid JOIN constructors AS T4 ON T3.constructorid = T4.constructorid ORDER BY T4.nationality LIMIT 1	formula_1
SELECT surname FROM drivers WHERE nationality = 'Italian'	formula_1
SELECT url FROM drivers WHERE forename = 'Anthony' AND surname = 'Davidson';	formula_1
SELECT driverRef FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton'	formula_1
SELECT circuits.name FROM circuits JOIN races ON circuits.circuitid = races.circuitid WHERE races.year = 2009 AND races.name = "Spanish Grand Prix"	formula_1
SELECT DISTINCT T1.year FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Silverstone'	formula_1
SELECT T2.url FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Silverstone'	formula_1
SELECT date FROM races WHERE name = 'Abu Dhabi Grand Prix' AND YEAR = 2010	formula_1
SELECT COUNT(*) FROM races WHERE circuitId IN ( SELECT circuitId FROM circuits WHERE country = 'Italy' )	formula_1
SELECT date FROM races WHERE circuitid = (SELECT circuitid FROM circuits WHERE name = 'Circuit de Barcelona-Catalunya')	formula_1
SELECT T1.url FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.year = 2009 AND T2.name = 'Spanish Grand Prix'	formula_1
SELECT MIN(T1.fastestLapTime) FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton'	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid ORDER BY T2.fastestlapspeed DESC LIMIT 1	formula_1
SELECT T1.driverRef FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T3.year = 2007 AND T3.name = 'Canadian Grand Prix' AND T2.position = 1	formula_1
SELECT DISTINCT T1.name FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T3.forename = 'Lewis' AND T3.surname = 'Hamilton'	formula_1
SELECT T1.name FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T3.forename = 'Lewis' AND T3.surname = 'Hamilton' ORDER BY T2.rank ASC LIMIT 1	formula_1
SELECT MAX(T1.fastestLapSpeed) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Spanish Grand Prix'	formula_1
SELECT DISTINCT YEAR FROM races WHERE raceId IN (SELECT raceId FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton'))	formula_1
SELECT T2.positionOrder FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton' AND T3.name = 'Chinese Grand Prix' ORDER BY T2.position DESC LIMIT 1	formula_1
SELECT T1.forename ,  T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.grid = 4 AND T2.raceid = ( SELECT raceid FROM races WHERE name = 'Australian Grand Prix' AND YEAR = 1989 )	formula_1
SELECT COUNT(*) FROM results WHERE raceid = 1 AND TIME IS NOT NULL	formula_1
SELECT T1.fastestLapTime FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton' AND T1.raceId = ( SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND YEAR = 2008 )	formula_1
SELECT T1.time FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T1.rank = 2 AND T2.year = 2008 AND T2.name = 'Chinese Grand Prix'	formula_1
SELECT T1.forename, T1.surname, T1.url FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.position = 1 AND T2.raceid IN ( SELECT raceid FROM races WHERE name = 'Australian Grand Prix' AND YEAR = 2008 )	formula_1
SELECT COUNT(*) FROM results AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T2.nationality = 'British' AND T1.raceid = (SELECT raceid FROM races WHERE name = 'Australian Grand Prix' AND YEAR = 2008)	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId IN ( SELECT raceId FROM races WHERE year = 2008 AND name = 'Chinese Grand Prix' ) AND time IS NOT NULL	formula_1
SELECT SUM(points) FROM results WHERE driverid = (SELECT driverid FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')	formula_1
SELECT AVG(STRFTIME('%M', T1.fastestLapTime) * 60 + STRFTIME('%S', T1.fastestLapTime) + STRFTIME('%f', T1.fastestLapTime) / 1000) AS averageFastestLapTime FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton'	formula_1
SELECT CAST(SUM(CASE WHEN T1.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) / COUNT(T1.raceid) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.year = 2008 AND T2.name = 'Australian Grand Prix'	formula_1
SELECT ((strftime('%M', T2.time) - strftime('%M', T1.fastestLapTime)) * 60 + (strftime('%S', T2.time) - strftime('%S', T1.fastestLapTime)) + (strftime('%f', T2.time) - strftime('%f', T1.fastestLapTime))) / (strftime('%M', T1.fastestLapTime) * 60 + strftime('%S', T1.fastestLapTime) + strftime('%f', T1.fastestLapTime)) * 100 FROM results AS T1 INNER JOIN pitstops AS T2 ON T1.driverid = T2.driverid WHERE T1.raceid = 1 AND T1.position = 1 AND T2.stop = 1	formula_1
SELECT COUNT(*) FROM circuits WHERE country = 'Australia' AND location = 'Adelaide';	formula_1
SELECT lat, lng FROM circuits WHERE country = 'USA'	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND STRFTIME('%Y', dob) > '1980'	formula_1
SELECT MAX(points) FROM constructorStandings WHERE constructorId IN (SELECT constructorId FROM constructors WHERE nationality = 'British')	formula_1
SELECT T1.name FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorid = T2.constructorid ORDER BY T2.points DESC LIMIT 1	formula_1
SELECT T2.name FROM constructorStandings AS T1 INNER JOIN constructors AS T2 ON T1.constructorid = T2.constructorid WHERE T1.raceid = 291 AND T1.points = 0	formula_1
SELECT COUNT(*) FROM constructorStandings WHERE constructorId IN ( SELECT constructorId FROM constructors WHERE nationality = 'Japanese' ) AND points = 0 GROUP BY constructorId HAVING COUNT(raceId) = 2	formula_1
SELECT T2.name FROM constructorstandings AS T1 JOIN constructors AS T2 ON T1.constructorid = T2.constructorid WHERE position = 1	formula_1
SELECT COUNT(*) FROM constructorResults JOIN constructors ON constructorResults.constructorId = constructors.constructorId WHERE constructors.nationality = 'French' AND constructorResults.laps > 50	formula_1
SELECT CAST(SUM(CASE WHEN T1.time IS NOT NULL AND T1.year BETWEEN 2007 AND 2009 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.driverID) FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverID = T2.driverID WHERE T2.nationality = 'Japanese';	formula_1
SELECT AVG(REPLACE(T1.time, ':', '') + T1.milliseconds / 1000) AS avg_time, T1.year FROM results AS T1 INNER JOIN driverstandings AS T2 ON T1.driverid = T2.driverid AND T1.raceid = T2.raceid WHERE T2.position = 1 AND T1.year < 1975 GROUP BY T1.year	formula_1
SELECT T1.forename ,  T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE STRFTIME('%Y', T1.dob) > '1975' AND T2.rank = 2	formula_1
SELECT COUNT(*) FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T1.nationality = "Italian" AND T2.status IS NOT NULL	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid ORDER BY T2.fastestlaptime ASC LIMIT 1	formula_1
SELECT T1.fastestLap FROM results AS T1 JOIN driverstandings AS T2 ON T1.driverid = T2.driverid WHERE T1.year = 2009 AND T2.position = 1 ORDER BY T1.fastestlaptime LIMIT 1	formula_1
SELECT AVG(T1.fastestLapSpeed) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.name = 'Spanish Grand Prix' AND T1.year = 2009	formula_1
SELECT T2.name ,  T2.year FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T1.milliseconds IS NOT NULL ORDER BY T1.milliseconds ASC LIMIT 1	formula_1
SELECT CAST(SUM(CASE WHEN T1.year < 1985 AND T2.laps > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.driverId) FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.year BETWEEN 2000 AND 2005;	formula_1
SELECT COUNT(*) FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid WHERE T1.nationality = 'French' AND T2.milliseconds < 120000	formula_1
SELECT code FROM drivers WHERE nationality = 'American'	formula_1
SELECT raceId FROM races WHERE YEAR = 2009;	formula_1
SELECT COUNT(driverId) FROM results WHERE raceId = 18;	formula_1
SELECT number FROM drivers ORDER BY dob DESC LIMIT 3; SELECT COUNT(*) FROM drivers WHERE nationality = 'Dutch' AND number IN (SELECT number FROM drivers ORDER BY dob DESC LIMIT 3);	formula_1
SELECT driverRef FROM drivers WHERE forename = 'Robert' AND surname = 'Kubica';	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND STRFTIME('%Y', dob) = '1980';	formula_1
SELECT d.forename, d.surname, MIN(l.time) AS min_time FROM drivers d JOIN laptimes l ON d.driverid = l.driverid WHERE d.nationality = 'German' AND STRFTIME('%Y', d.dob) BETWEEN '1980' AND '1990' GROUP BY d.driverid ORDER BY min_time LIMIT 3	formula_1
SELECT driverRef FROM drivers WHERE nationality = 'German' ORDER BY dob ASC LIMIT 1	formula_1
SELECT T1.driverid ,  T1.code FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE STRFTIME('%Y', T1.dob) = '1971' AND T2.fastestlaptime IS NOT NULL ORDER BY T2.fastestlaptimes DESC LIMIT 1	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid WHERE T1.nationality = 'Spanish' AND STRFTIME('%Y', T1.dob) < '1982' ORDER BY T2.milliseconds DESC LIMIT 10	formula_1
SELECT T1.year FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T2.fastestlaptime IS NOT NULL ORDER BY T2.fastestlaptime ASC LIMIT 1	formula_1
SELECT YEAR FROM races WHERE raceId = (SELECT raceId FROM laptimes ORDER BY TIME DESC LIMIT 1)	formula_1
SELECT driverid FROM laptimes WHERE lap = 1 ORDER BY TIME ASC LIMIT 5	formula_1
SELECT COUNT(*) FROM results WHERE statusId = 2 AND time IS NOT NULL AND raceId BETWEEN 50 AND 100	formula_1
SELECT count(*) ,  LOCATION ,  lat ,  lng FROM circuits WHERE country = 'Austria'	formula_1
SELECT raceId FROM results WHERE TIME IS NOT NULL GROUP BY raceId ORDER BY COUNT(*) DESC LIMIT 1	formula_1
SELECT T1.driverRef ,  T1.nationality ,  T1.dob FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T2.q2 IS NOT NULL AND T2.raceid = 23	formula_1
SELECT T1.year ,  T1.name ,  T1.date FROM races AS T1 JOIN qualifying AS T2 ON T1.raceid = T2.raceid ORDER BY T2.driverid ,  T1.date LIMIT 1	formula_1
SELECT COUNT(*) FROM results AS T1 INNER JOIN constructorstandings AS T2 ON T1.constructorid = T2.constructorid INNER JOIN constructors AS T3 ON T2.constructorid = T3.constructorid WHERE T3.nationality = 'American' AND T1.statusid = ( SELECT statusid FROM status WHERE status = 'Puncture' )	formula_1
SELECT c.name, c.url  FROM constructors c  JOIN constructorStandings cs ON c.constructorId = cs.constructorId  WHERE c.nationality = 'Italian'  ORDER BY cs.points DESC  LIMIT 1;	formula_1
SELECT T2.url FROM constructorstandings AS T1 INNER JOIN constructors AS T2 ON T1.constructorid = T2.constructorid GROUP BY T2.url ORDER BY SUM(T1.wins) DESC LIMIT 1	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T3.name = 'French Grand Prix' ORDER BY T2.milliseconds DESC LIMIT 1	formula_1
SELECT T1.raceid ,  T1.milliseconds FROM laptimes AS T1 ORDER BY TIME ASC LIMIT 1	formula_1
SELECT AVG(T1.fastestLapTime) FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T1.rank < 11 AND T2.name = 'United States Grand Prix' AND T2.year = 2006	formula_1
SELECT d.forename, d.surname FROM drivers AS d JOIN pitstops AS p ON d.driverid = p.driverid WHERE d.nationality = 'German' AND STRFTIME('%Y', d.dob) BETWEEN '1980' AND '1985' GROUP BY d.driverid ORDER BY AVG(p.duration) ASC LIMIT 3	formula_1
SELECT T1.forename, T1.surname, T2.time FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T3.name = 'Canadian Grand Prix' AND T3.year = 2008 ORDER BY points DESC LIMIT 1	formula_1
SELECT T2.constructorRef ,  T2.url FROM races AS T1 INNER JOIN constructorStandings AS T2 ON T1.raceid = T2.raceid WHERE T1.name = 'Singapore Grand Prix' AND T1.year = 2009 ORDER BY points DESC LIMIT 1	formula_1
SELECT forename, surname, dob FROM drivers WHERE nationality = 'Austrian' AND STRFTIME('%Y', dob) BETWEEN '1981' AND '1991'	formula_1
SELECT forename || ' ' || surname AS fullName, url, dob FROM drivers WHERE nationality = 'German' AND STRFTIME('%Y', dob) BETWEEN '1971' AND '1985' ORDER BY dob DESC	formula_1
SELECT LOCATION, COUNTRY, LAT, LNG FROM circuits WHERE name = 'Hungaroring'	formula_1
SELECT c.constructorid, c.name, c.nationality, SUM(cr.points) AS total_points FROM constructors c JOIN constructorstandings cs ON c.constructorid = cs.constructorid JOIN races r ON cs.raceid = r.raceid WHERE r.circuitid = 6 AND r.year BETWEEN 1980 AND 2010 GROUP BY c.constructorid, c.name, c.nationality ORDER BY total_points DESC LIMIT 1;	formula_1
SELECT AVG(T1.points) FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T2.forename = "Lewis" AND T2.surname = "Hamilton" AND T1.raceid IN ( SELECT raceid FROM races WHERE name LIKE "%Turkish Grand Prix%" )	formula_1
SELECT AVG(count(*)) FROM ( SELECT COUNT(*) FROM races WHERE date BETWEEN '2000-01-01' AND '2010-12-31' GROUP BY YEAR ) AS subquery	formula_1
SELECT nationality FROM drivers GROUP BY nationality ORDER BY COUNT(*) DESC LIMIT 1	formula_1
SELECT COUNT(*) FROM driverStandings WHERE position = 91 AND wins > 0	formula_1
SELECT T1.name FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid ORDER BY T2.fastestlaptime ASC LIMIT 1	formula_1
SELECT T1.location, T1.country FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid ORDER BY T2.date DESC LIMIT 1	formula_1
SELECT T1.forename ,  T1.surname FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid JOIN circuits AS T3 ON T3.circuitid = T2.circuitid WHERE T3.name = "Marina Bay Street Circuit" AND T2.position = 1 AND T2.q3 IS NOT NULL ORDER BY T2.q3 ASC LIMIT 1	formula_1
SELECT T1.forename, T1.surname, T1.nationality, T3.name FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverid = T2.driverid INNER JOIN races AS T3 ON T2.raceid = T3.raceid ORDER BY T1.dob DESC LIMIT 1	formula_1
SELECT COUNT(*) FROM results AS T1 JOIN status AS T2 ON T1.statusid = T2.statusid WHERE T2.status = 'Accident' AND T1.raceid IN (SELECT raceid FROM races WHERE name = 'Canadian Grand Prix')	formula_1
SELECT COUNT(wins), forename, surname FROM drivers WHERE dob = ( SELECT MIN(dob) FROM drivers ) AND wins > 0	formula_1
SELECT MAX(duration) FROM pitStops;	formula_1
SELECT MIN(time) FROM laptimes	formula_1
SELECT MAX(T2.duration) FROM drivers AS T1 JOIN pitstops AS T2 ON T1.driverid = T2.driverid WHERE T1.forename = "Lewis" AND T1.surname = "Hamilton";	formula_1
SELECT T2.lap FROM drivers AS T1 INNER JOIN pitstops AS T2 ON T1.driverid = T2.driverid WHERE T1.forename = "Lewis" AND T1.surname = "Hamilton" AND T2.raceid IN (SELECT raceid FROM races WHERE name = "Australian Grand Prix" AND YEAR = 2011)	formula_1
SELECT T1.driverid ,  T2.duration FROM results AS T1 INNER JOIN pitstops AS T2 ON T1.raceid = T2.raceid AND T1.driverid = T2.driverid WHERE T1.raceid = 1 AND T1.grid = 1	formula_1
SELECT MIN(time) FROM results AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T2.forename = "Lewis" AND T2.surname = "Hamilton"	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid ORDER BY TIME ASC LIMIT 1	formula_1
SELECT T2.position FROM results AS T1 INNER JOIN driverstandings AS T2 ON T1.driverid = T2.driverid WHERE T1.fastestlap IS NOT NULL AND T1.driverid = ( SELECT driverid FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton' ) ORDER BY T1.fastestlaptime ASC LIMIT 1	formula_1
SELECT MIN(time) FROM laptimes WHERE raceid = (SELECT raceid FROM races WHERE name = 'Austrian Grand Prix')	formula_1
SELECT T1.name, MIN(T3.time) AS fastest_lap FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid INNER JOIN results AS T3 ON T2.raceid = T3.raceid WHERE T1.country = 'Italy' GROUP BY T1.name	formula_1
SELECT T1.name FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.circuitid = ( SELECT circuitid FROM circuits WHERE name = 'Austrian Grand Prix Circuit' ) ORDER BY T2.fastestlaptime ASC LIMIT 1	formula_1
SELECT T1.duration FROM pitstops AS T1 INNER JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.fastestlap IS NOT NULL AND T2.raceid IN ( SELECT raceid FROM races WHERE name = 'Austrian Grand Prix' )	formula_1
SELECT T1.lat, T1.lng FROM circuits AS T1 JOIN results AS T2 ON T1.circuitid = T2.circuitid WHERE T2.fastestlaptime = '1:29.488'	formula_1
SELECT AVG(T1.milliseconds) FROM pitstops AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton'	formula_1
SELECT AVG(T1.milliseconds) FROM laptimes AS T1 INNER JOIN races AS T2 ON T1.raceid = T2.raceid INNER JOIN circuits AS T3 ON T2.circuitid = T3.circuitid WHERE T3.country = 'Italy'	formula_1
SELECT player_api_id FROM Player_Attributes ORDER BY overall_rating DESC LIMIT 1	european_football_2
SELECT player_name FROM Player ORDER BY height DESC LIMIT 1	european_football_2
SELECT preferred_foot FROM Player_Attributes ORDER BY potential ASC LIMIT 1	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE overall_rating BETWEEN 60 AND 65 AND defensive_work_rate = 'Low'	european_football_2
SELECT player_api_id FROM Player_Attributes ORDER BY crossing DESC LIMIT 5	european_football_2
SELECT T1.name FROM League AS T1 INNER JOIN Match AS T2 ON T1.id = T2.league_id WHERE T2.season = '2015/2016' GROUP BY T1.name ORDER BY SUM(T2.home_team_goal + T2.away_team_goal) DESC LIMIT 1	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id WHERE T2.season = '2015/2016' AND T1.team_long_name IN ( SELECT team_long_name FROM Team WHERE id IN ( SELECT home_team_api_id FROM Match WHERE season = '2015/2016' ) ) GROUP BY T1.team_long_name ORDER BY SUM(CASE WHEN home_team_goal < away_team_goal THEN 1 ELSE 0 END) ASC LIMIT 1	european_football_2
SELECT T2.player_name FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T1.penalties DESC LIMIT 10	european_football_2
SELECT T2.team_long_name FROM Match AS T1 INNER JOIN Team AS T2 ON T1.away_team_api_id = T2.team_api_id INNER JOIN League AS T3 ON T1.league_id = T3.id WHERE T3.name = 'Scotland Premier League' AND T1.season = '2009/2010' AND T1.away_team_goal > T1.home_team_goal GROUP BY T2.team_long_name ORDER BY COUNT(*) DESC LIMIT 1	european_football_2
SELECT buildUpPlaySpeed FROM Team_Attributes ORDER BY buildUpPlaySpeed DESC LIMIT 4	european_football_2
SELECT T2.name FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.season = '2015/2016' GROUP BY T2.name ORDER BY SUM(CASE WHEN home_team_goal = away_team_goal THEN 1 ELSE 0 END) DESC LIMIT 1	european_football_2
SELECT T1.player_name ,  STRFTIME('%Y', 'now') - STRFTIME('%Y', T1.birthday) AS Age FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.sprint_speed >= 97 AND STRFTIME('%Y', T2.date) BETWEEN '2013' AND '2015'	european_football_2
SELECT T1.name ,  COUNT(T2.league_id) FROM League AS T1 INNER JOIN Match AS T2 ON T1.id = T2.league_id GROUP BY T1.id ORDER BY COUNT(T2.league_id) DESC LIMIT 1	european_football_2
SELECT AVG(height) FROM Player WHERE birthday BETWEEN '1990-01-01 00:00:00' AND '1995-12-31 00:00:00'	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE date LIKE '2010%' ORDER BY overall_rating DESC LIMIT 1	european_football_2
SELECT team_fifa_api_id FROM Team_Attributes WHERE buildUpPlaySpeed BETWEEN 50 AND 60	european_football_2
SELECT T1.team_long_name FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE strftime('%Y', T2.date) = '2012' AND T2.buildUpPlayPassing > ( SELECT AVG(buildUpPlayPassing) FROM Team_Attributes WHERE strftime('%Y', date) = '2012' )	european_football_2
SELECT CAST(SUM(CASE WHEN preferred_foot = 'left' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(player_fifa_api_id) FROM Player WHERE STRFTIME('%Y', birthday) BETWEEN '1987' AND '1992'	european_football_2
SELECT T1.name FROM League AS T1 INNER JOIN Match AS T2 ON T1.id = T2.league_id GROUP BY T1.id ORDER BY SUM(T2.home_team_goal + T2.away_team_goal) ASC LIMIT 5	european_football_2
SELECT AVG(T2.long_shots) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Ahmed Samir Farag'	european_football_2
SELECT P.player_name FROM Player AS P JOIN Player_Attributes AS PA ON P.player_api_id = PA.player_api_id WHERE P.height > 180 GROUP BY P.player_name ORDER BY AVG(PA.heading_accuracy) DESC LIMIT 10	european_football_2
SELECT T1.team_long_name FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlayDribblingClass = 'Normal' AND T2.date BETWEEN '2014-01-01 00:00:00' AND '2014-12-31 00:00:00' GROUP BY T1.id HAVING AVG(T2.chanceCreationPassing) > T2.chanceCreationPassing ORDER BY T2.chanceCreationPassing DESC	european_football_2
SELECT T2.name FROM `Match` AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.season = '2009/2010' GROUP BY T1.league_id HAVING AVG(T1.home_team_goal) > AVG(T1.away_team_goal)	european_football_2
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers'	european_football_2
SELECT player_name FROM Player WHERE birthday LIKE '1970-10-%'	european_football_2
SELECT T2.attacking_work_rate FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Franco Zennaro' AND T2.date = ( SELECT MAX(date) FROM Player_Attributes WHERE player_api_id = T1.player_api_id )	european_football_2
SELECT T1.buildUpPlayPositioningClass FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_long_name = 'ADO Den Haag' AND T1.date LIKE '%2010%' LIMIT 2	european_football_2
SELECT T1.heading_accuracy FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Francois Affolter' AND T1.date = '2014-09-18 00:00:00'	european_football_2
SELECT overall_rating FROM Player_Attributes WHERE player_api_id IN ( SELECT player_api_id FROM Player WHERE player_name = 'Gabriel Tamas' ) AND strftime('%Y', date) = '2011';	european_football_2
SELECT COUNT(*) FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T2.name = 'Scotland Premier League' AND T1.season = '2015/2016'	european_football_2
SELECT T1.preferred_foot FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T1.birthday DESC LIMIT 1	european_football_2
SELECT player_name FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id ORDER BY potential DESC LIMIT 1	european_football_2
SELECT COUNT(*) FROM Player WHERE weight < 130 AND preferred_foot = 'left'	european_football_2
SELECT T.team_short_name FROM Team AS T JOIN Team_Attributes AS TA ON T.team_api_id = TA.team_api_id WHERE TA.chanceCreationPassingClass = 'Risky'	european_football_2
SELECT T2.defensive_work_rate FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'David Wilson' AND T2.date = ( SELECT MAX(date) FROM Player_Attributes WHERE player_api_id = ( SELECT player_api_id FROM Player WHERE player_name = 'David Wilson' ) )	european_football_2
SELECT T1.birthday FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.overall_rating DESC LIMIT 1	european_football_2
SELECT T1.name FROM League AS T1 INNER JOIN Country AS T2 ON T1.country_id = T2.id WHERE T2.name = 'Netherlands'	european_football_2
SELECT AVG(home_team_goal) FROM Match AS T1 INNER JOIN Country AS T2 ON T1.country_id = T2.id WHERE T2.name = 'Poland' AND T1.season = '2010/2011'	european_football_2
SELECT T2.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id GROUP BY T1.player_api_id ORDER BY AVG(T2.finishing) DESC LIMIT 1	european_football_2
SELECT player_name FROM Player WHERE height > 180;	european_football_2
SELECT COUNT(*) FROM Player WHERE strftime('%Y', birthday) > '1990'	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Adam%' AND weight > 170;	european_football_2
SELECT T2.player_name FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.overall_rating > 80 AND strftime('%Y', T1.date) BETWEEN '2008' AND '2010' GROUP BY T2.player_name	european_football_2
SELECT potential FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Doran')	european_football_2
SELECT player_name FROM Player WHERE preferred_foot = 'left'	european_football_2
SELECT T2.team_long_name FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlaySpeedClass = 'Fast'	european_football_2
SELECT T1.buildUpPlayPassingClass FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_short_name = 'CLB'	european_football_2
SELECT T.team_short_name FROM Team AS T JOIN Team_Attributes AS TA ON T.team_api_id = TA.team_api_id WHERE TA.buildUpPlayPassing > 70	european_football_2
SELECT AVG(t2.overall_rating) FROM Player AS t1 INNER JOIN Player_Attributes AS t2 ON t1.player_api_id = t2.player_api_id WHERE strftime('%Y', t2.date) BETWEEN '2010' AND '2015' AND t1.height > 170	european_football_2
SELECT player_name FROM Player ORDER BY height ASC LIMIT 1	european_football_2
SELECT T2.name FROM League AS T1 INNER JOIN Country AS T2 ON T1.country_id = T2.id WHERE T1.name = 'Italy Serie A'	european_football_2
SELECT T2.team_short_name FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlaySpeed = 31 AND T1.buildUpPlayDribbling = 53 AND T1.buildUpPlayPassing = 32	european_football_2
SELECT AVG(T1.overall_rating) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Aaron Doran'	european_football_2
SELECT COUNT(*) FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T2.name = 'Germany 1. Bundesliga' AND date LIKE '2008-08%' OR date LIKE '2008-09%' OR date LIKE '2008-10%'	european_football_2
SELECT T1.team_short_name FROM Team AS T1 INNER JOIN Match AS T2 ON T1.id = T2.home_team_api_id WHERE T2.home_team_goal = 10	european_football_2
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.balance = ( SELECT MAX(balance) FROM Player_Attributes ) AND T2.potential = 61	european_football_2
SELECT SUM(CASE WHEN T1.player_name = 'Abdou Diallo' THEN T2.ball_control ELSE 0 END) / COUNT(CASE WHEN T1.player_name = 'Abdou Diallo' THEN T2.id ELSE NULL END) - SUM(CASE WHEN T1.player_name = 'Aaron Appindangoye' THEN T2.ball_control ELSE 0 END) / COUNT(CASE WHEN T1.player_name = 'Aaron Appindangoye' THEN T2.id ELSE NULL END) AS diff FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id	european_football_2
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN'	european_football_2
SELECT player_name FROM Player WHERE player_name IN ('Aaron Lennon', 'Abdelaziz Barrada') ORDER BY birthday DESC LIMIT 1	european_football_2
SELECT player_name FROM Player ORDER BY height DESC LIMIT 1	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE preferred_foot = 'left' AND attacking_work_rate = 'low'	european_football_2
SELECT T1.name FROM Country AS T1 INNER JOIN League AS T2 ON T1.id = T2.country_id WHERE T2.name = 'Belgium Jupiler League'	european_football_2
SELECT T1.name FROM League AS T1 INNER JOIN Country AS T2 ON T1.country_id = T2.id WHERE T2.name = 'Germany'	european_football_2
SELECT player_name FROM Player WHERE player_api_id = (SELECT player_api_id FROM Player_Attributes ORDER BY overall_rating DESC LIMIT 1)	european_football_2
SELECT COUNT(DISTINCT T1.player_api_id) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE strftime('%Y', T1.birthday) < '1986' AND T2.defensive_work_rate = 'High'	european_football_2
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone') ORDER BY T2.crossing DESC LIMIT 1	european_football_2
SELECT T2.heading_accuracy FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Ariel Borysiuk' AND T2.date = ( SELECT MAX(date) FROM Player_Attributes WHERE player_api_id = ( SELECT player_api_id FROM Player WHERE player_name = 'Ariel Borysiuk' ) )	european_football_2
SELECT COUNT(*) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.height > 180 AND T2.volleys > 70	european_football_2
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.volleys > 70 AND T2.dribbling > 70	european_football_2
SELECT COUNT(*) FROM Match AS T1 INNER JOIN Country AS T2 ON T1.country_id = T2.id WHERE T2.name = 'Belgium' AND T1.season = '2008/2009';	european_football_2
SELECT T1.long_passing FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.birthday ASC LIMIT 1	european_football_2
SELECT COUNT(*) FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T2.name = 'Belgium Jupiler League' AND SUBSTR(T1.date, 1, 7) = '2009-04'	european_football_2
SELECT T1.name FROM League AS T1 INNER JOIN Match AS T2 ON T1.id = T2.league_id WHERE T2.season = '2008/2009' GROUP BY T1.name ORDER BY COUNT(T2.match_api_id) DESC LIMIT 1	european_football_2
SELECT AVG(overall_rating) FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE strftime('%Y', Player.birthday) < '1986'	european_football_2
SELECT ((SELECT overall_rating FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Ariel Borysiuk') - (SELECT overall_rating FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Paulin Puel')) * 100 / (SELECT overall_rating FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Paulin Puel')	european_football_2
SELECT AVG(T2.buildUpPlaySpeed) FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Heart of Midlothian'	european_football_2
SELECT AVG(T1.overall_rating) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Pietro Marino'	european_football_2
SELECT SUM(T1.crossing) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Aaron Lennox'	european_football_2
SELECT MAX(T2.chanceCreationPassing), T2.chanceCreationPassingClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Ajax';	european_football_2
SELECT preferred_foot FROM Player WHERE player_name = 'Abdou Diallo'	european_football_2
SELECT MAX(T1.overall_rating) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Dorlan Pabon'	european_football_2
SELECT AVG(away_team_goal) FROM Match AS T1 JOIN Team AS T2 ON T1.away_team_api_id = T2.team_api_id WHERE T2.team_long_name = 'Parma' AND T1.country_id IN ( SELECT id FROM Country WHERE name = 'Italy' )	european_football_2
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.overall_rating = 77 AND T2.date LIKE '2016-06-23%' ORDER BY T1.birthday ASC LIMIT 1	european_football_2
SELECT T2.overall_rating FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Aaron Mooy' AND T2.date LIKE '2016-02-04%'	european_football_2
SELECT T1.potential FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Francesco Parravicini' AND T1.date = '2010-08-30 00:00:00'	european_football_2
SELECT T1.attacking_work_rate FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Francesco Migliore' AND T1.date LIKE '2015-05-01%'	european_football_2
SELECT T2.defensive_work_rate FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Kevin Berigaud' AND T2.date = '2013-02-22 00:00:00'	european_football_2
SELECT T2.date FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Kevin Constant' ORDER BY T2.crossing DESC LIMIT 1	european_football_2
SELECT T2.buildUpPlaySpeedClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Willem II' AND T2.date LIKE '%2011-02-22%'	european_football_2
SELECT T2.buildUpPlayDribblingClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_short_name = 'LEI' AND T2.date = '2015-09-10 00:00:00'	european_football_2
SELECT T2.buildUpPlayPassingClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'FC Lorient' AND T2.date LIKE '2010-02-22%'	european_football_2
SELECT T2.chance_creation_passing_class FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'PEC Zwolle' AND T2.date = '2013-09-20 00:00:00'	european_football_2
SELECT T2.chance_creation_crossing_class FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Hull City' AND T2.date = '2010-02-22 00:00:00'	european_football_2
SELECT T2.defenceAggressionClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Hannover 96' AND T2.date LIKE '2015-09-10%'	european_football_2
SELECT AVG(T2.overall_rating) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Marko Arnautovic' AND SUBSTR(T2.date, 1, 10) BETWEEN '2007-02-22' AND '2016-04-21'	european_football_2
SELECT CAST((T1.overall_rating - T2.overall_rating) AS REAL) * 100 / T1.overall_rating FROM Player_Attributes AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.date = '2013-07-12' AND T2.date = '2013-07-12' AND T1.player_name = 'Landon Donovan' AND T2.player_name = 'Jordan Bowery'	european_football_2
SELECT player_name FROM Player ORDER BY height DESC LIMIT 1	european_football_2
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10	european_football_2
SELECT player_name FROM Player WHERE strftime('%Y', 'now') - strftime('%Y', birthday) >= 35	european_football_2
SELECT SUM(home_team_goal) FROM Match WHERE home_player_1 IN ( SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon' ) OR home_player_2 IN ( SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon' ) OR home_player_3 IN ( SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon' ) OR home_player_4 IN ( SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon' ) OR home_player_5 IN ( SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon' ) OR home_player_6 IN ( SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon' ) OR home_player_7 IN ( SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon' ) OR home_player_8 IN ( SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon' ) OR home_player_9 IN ( SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon' ) OR home_player_10 IN ( SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon' ) OR home_player_11 IN ( SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon' )	european_football_2
SELECT SUM(T2.away_team_goal) FROM Player AS T1 INNER JOIN Match AS T2 ON T1.player_api_id IN (T2.away_player_1, T2.away_player_2, T2.away_player_3, T2.away_player_4, T2.away_player_5, T2.away_player_6, T2.away_player_7, T2.away_player_8, T2.away_player_9, T2.away_player_10, T2.away_player_11) WHERE T1.player_name IN ('Daan Smith', 'Filipe Ferreira')	european_football_2
SELECT SUM(home_team_goal) AS total_home_goals FROM Player JOIN Match ON Player.player_api_id = Match.home_player_1 WHERE strftime('%Y', 'now') - strftime('%Y', birthday) <= 30;	european_football_2
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.overall_rating DESC LIMIT 1	european_football_2
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.potential DESC LIMIT 1	european_football_2
SELECT T2.player_name FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.attacking_work_rate = 'High'	european_football_2
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.finishing = 1 ORDER BY date_of_birth ASC LIMIT 1	european_football_2
SELECT T2.player_name FROM Country AS T1 INNER JOIN Player AS T2 ON T1.id = T2.nationality WHERE T1.name = 'Belgium'	european_football_2
SELECT DISTINCT T1.player_name, T4.name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id INNER JOIN Team AS T3 ON T3.team_api_id IN (T1.home_team_api_id, T1.away_team_api_id) INNER JOIN Country AS T4 ON T4.id = T3.country_id WHERE T2.vision >= 90	european_football_2
SELECT T2.name FROM Player AS T1 INNER JOIN Country AS T2 ON T1.player_api_id = T2.id GROUP BY T2.name ORDER BY AVG(T1.weight) DESC LIMIT 1	european_football_2
SELECT T2.team_long_name FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlaySpeedClass = 'Slow'	european_football_2
SELECT T1.team_short_name FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.chanceCreationPassingClass = 'Safe'	european_football_2
SELECT AVG(T1.height) FROM Player AS T1 INNER JOIN Country AS T2 ON T1.player_api_id = T2.id WHERE T2.name = 'Italy'	european_football_2
SELECT player_name FROM Player WHERE height > 180 ORDER BY player_name LIMIT 3	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND birthday > '1990'	european_football_2
SELECT jumping FROM Player_Attributes WHERE id = 6 - jumping FROM Player_Attributes WHERE id = 23	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE preferred_foot = 'right' ORDER BY potential ASC LIMIT 5	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE crossing = ( SELECT MAX(crossing) FROM Player_Attributes ) AND preferred_foot = 'left'	european_football_2
SELECT CAST(SUM(CASE WHEN T2.stamina > 80 AND T2.strength > 80 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id	european_football_2
SELECT T2.name FROM league AS T1 INNER JOIN country AS T2 ON T1.country_id = T2.id WHERE T1.name = 'Poland Ekstraklasa'	european_football_2
SELECT T1.home_team_goal, T1.away_team_goal FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.date LIKE '2008-09-24%' AND T2.name = 'Belgium Jupiler League'	european_football_2
SELECT T1.sprint_speed, T1.agility, T1.acceleration FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Alexis Blin'	european_football_2
SELECT T2.buildUpPlaySpeedClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'KSV Cercle Brugge' ORDER BY T2.date DESC LIMIT 1	european_football_2
SELECT COUNT(*) FROM Match WHERE season = '2015/2016' AND league_id IN ( SELECT id FROM League WHERE name = 'Italy Serie A' )	european_football_2
SELECT MAX(home_team_goal) FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Netherlands Eredivisie')	european_football_2
SELECT T2.finishing ,  T2.curve FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T1.weight DESC LIMIT 1	european_football_2
SELECT T1.name FROM League AS T1 INNER JOIN Match AS T2 ON T1.id = T2.league_id WHERE T2.season = '2015/2016' GROUP BY T1.name ORDER BY COUNT(T2.id) DESC LIMIT 4	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id GROUP BY T1.team_long_name ORDER BY SUM(T2.away_team_goal) DESC LIMIT 1	european_football_2
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.overall_rating DESC LIMIT 1	european_football_2
SELECT CAST(SUM(CASE WHEN height < 180 AND overall_rating > 70 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id	european_football_2
SELECT SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) * 100.0 / SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END) AS Deviation FROM Patient WHERE SEX = 'M'	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN STRFTIME('%Y', Birthday) > '1930' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(ID) FROM Patient WHERE SEX = 'F'	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(ID) FROM Patient WHERE Birthday BETWEEN '1930-01-01' AND '1940-12-31'	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END) FROM Patient WHERE Diagnosis = 'SLE'	thrombosis_prediction
SELECT T2.Diagnosis, T1.Date FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.ID = 30609	thrombosis_prediction
SELECT T1.SEX, T1.Birthday, T2.`Examination Date`, T2.Symptoms FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.ID = '163109'	thrombosis_prediction
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.LDH > 500	thrombosis_prediction
SELECT T1.ID ,  STRFTIME('%Y', CURRENT_TIMESTAMP) - STRFTIME('%Y', T1.Birthday) AS Age FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.RVVT = '+'	thrombosis_prediction
SELECT T1.ID, T1.SEX, T1.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Thrombosis = 2	thrombosis_prediction
SELECT DISTINCT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T1.Birthday) = '1937' AND T2.`T-CHO` >= 250	thrombosis_prediction
SELECT P.ID, P.SEX, P.Diagnosis FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.ALB < 3.5;	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T1.SEX = 'F' AND (T2.TP < 6.0 OR T2.TP > 8.5) THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID	thrombosis_prediction
SELECT AVG(T1.`aCL IgG`) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Admission = '+' AND strftime('%Y', 'now') - strftime('%Y', T2.Birthday) >= 50	thrombosis_prediction
SELECT COUNT(ID) FROM Patient WHERE SEX = 'F' AND STRFTIME('%Y', Description) = '1997' AND Admission = '-'	thrombosis_prediction
SELECT MIN(STRFTIME('%Y', `First Date`) - STRFTIME('%Y', Birthday)) AS Youngest_Age FROM Patient;	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Thrombosis = 1 AND T1.SEX = 'F' AND strftime('%Y', T2.`Examination Date`) = '1997'	thrombosis_prediction
SELECT MAX(YEAR(`Birthday`)) - MIN(YEAR(`Birthday`)) AS AgeGap FROM Patient WHERE ID IN ( SELECT ID FROM Laboratory WHERE TG >= 200 )	thrombosis_prediction
SELECT T1.Symptoms, T1.Diagnosis FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Birthday IS NOT NULL ORDER BY T2.Birthday DESC LIMIT 1	thrombosis_prediction
SELECT SUM(CASE WHEN T2.SEX = 'M' THEN 1 ELSE 0 END) / 12 AS AverageMalePatients FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Date BETWEEN '1998-01-01' AND '1998-12-31'	thrombosis_prediction
SELECT T2.Date, TIMESTAMPDIFF(YEAR, T1.Birthday, T1.`First Date`) AS Age FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis LIKE '%SJS%' ORDER BY T1.Birthday ASC LIMIT 1	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T1.SEX = 'M' AND T2.UA <= 8 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T1.SEX = 'F' AND T2.UA <= 6.5 THEN 1 ELSE 0 END) AS Ratio FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.UA IS NOT NULL	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T2.`Examination Date`) - STRFTIME('%Y', T1.`First Date`) >= 1	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T1.Birthday) < '1990' AND STRFTIME('%Y', T2.`Examination Date`) BETWEEN '1990' AND '1993'	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE T_BIL >= 2 AND ID IN ( SELECT ID FROM Patient WHERE SEX = 'M' )	thrombosis_prediction
SELECT Diagnosis FROM Examination WHERE `Examination Date` BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY Diagnosis ORDER BY COUNT(*) DESC LIMIT 1	thrombosis_prediction
SELECT AVG(1999 - strftime('%Y', T1.Birthday)) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.Date BETWEEN '1991-10-01' AND '1991-10-30'	thrombosis_prediction
SELECT strftime('%Y', T1.`Examination Date`) - strftime('%Y', T2.Birthday) AS Age, T2.Diagnosis FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID ORDER BY T1.HGB DESC LIMIT 1	thrombosis_prediction
SELECT ANA FROM Examination WHERE ID = 3605340 AND `Examination Date` = '1996-12-02'	thrombosis_prediction
SELECT CASE WHEN T2.T-CHO < 250 THEN 'Normal' ELSE 'Abnormal' END AS Total_Cholesterol_Status FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.ID = 2927464 AND T2.Date = '1995-09-04'	thrombosis_prediction
SELECT SEX FROM Patient WHERE Diagnosis = 'AORTITIS' LIMIT 1	thrombosis_prediction
SELECT T2.`aCL IgM` FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Description = '1994-02-19' AND T2.`Examination Date` = '1993-11-12' AND T1.Diagnosis = 'SLE'	thrombosis_prediction
SELECT CASE WHEN T1.SEX = 'M' THEN 'man' ELSE 'woman' END AS Gender FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.Date = '1992-06-12' AND T2.GPT = 9	thrombosis_prediction
SELECT STRFTIME('%Y', T1.Date) - STRFTIME('%Y', T2.Birthday) AS Age FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.UA = 8.4 AND T1.Date = '1991-10-21'	thrombosis_prediction
SELECT COUNT(T2.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.`First Date` = '1991-06-13' AND T1.Diagnosis = 'SJS' AND STRFTIME('%Y', T2.Date) = '1995'	thrombosis_prediction
SELECT Patient.Diagnosis AS Original_Diagnose FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.Date = '1997-01-27' AND Patient.First_Date = (SELECT MIN(First_Date) FROM Patient WHERE Diagnosis LIKE '%SLE%')	thrombosis_prediction
SELECT T2.Symptoms FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Birthday = '1959-03-01' AND T2.`Examination Date` = '1993-09-27'	thrombosis_prediction
SELECT SUM(CASE WHEN T1.Birthday = '1959-02-18' AND T2.Date LIKE '1981-11-%' THEN T2.`T-CHO` ELSE 0 END) - SUM(CASE WHEN T1.Birthday = '1959-02-18' AND T2.Date LIKE '1981-12-%' THEN T2.`T-CHO` ELSE 0 END) AS Decrease_Rate FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID	thrombosis_prediction
SELECT DISTINCT P.ID FROM Patient AS P JOIN Examination AS E ON P.ID = E.ID WHERE P.Description BETWEEN '1997-01-01' AND '1997-12-31' AND E.Diagnosis LIKE '%Behcet%'	thrombosis_prediction
SELECT T1.ID FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`Examination Date` BETWEEN '1987-07-06' AND '1996-01-31' AND T1.GPT > 30 AND T1.ALB < 4	thrombosis_prediction
SELECT ID FROM Patient WHERE SEX = 'F' AND STRFTIME('%Y', Birthday) = '1964' AND Admission = '+' ORDER BY ID	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE Thrombosis = 2 AND ANA = 'S' AND `aCL IgM` > ( SELECT AVG(`aCL IgM`) * 1.2 FROM Examination )	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN UA <= 6.5 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Laboratory WHERE `U-PRO` > 0 AND `U-PRO` < 30	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T1.DIAGNOSIS = 'BEHCET' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Patient AS T1 WHERE T1.SEX = 'M' AND STRFTIME('%Y', T1.`First Date`) = '1981';	thrombosis_prediction
SELECT DISTINCT P.ID, P.SEX, P.Birthday, P.Description, P.First_Date, P.Admission, P.Diagnosis FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.Admission = '-' AND L.Date LIKE '1991-10%' AND L.T_BIL < 2.0	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND strftime('%Y', Birthday) BETWEEN '1980' AND '1989' AND ID NOT IN ( SELECT ID FROM Examination WHERE ANA Pattern = 'P' )	thrombosis_prediction
SELECT T1.SEX FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T2.Diagnosis = 'PSS' AND T3.CRP > 2 AND T3.CRE = 1 AND T3.LDH = 123	thrombosis_prediction
SELECT AVG(T2.ALB) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND T2.PLT > 400 AND T1.Diagnosis = 'SLE'	thrombosis_prediction
SELECT Symptoms FROM Examination WHERE Diagnosis = 'SLE' GROUP BY Symptoms ORDER BY COUNT(*) DESC LIMIT 1	thrombosis_prediction
SELECT Description, Diagnosis FROM Patient WHERE ID = 48473	thrombosis_prediction
SELECT COUNT(ID) FROM Patient WHERE SEX = 'F' AND Diagnosis = 'APS'	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory WHERE STRFTIME('%Y', Date) = '1997' AND TP NOT BETWEEN 6 AND 8.5	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T2.Diagnosis LIKE '%ITP%' THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T2.Diagnosis LIKE '%SLE%' THEN 1 ELSE 0 END) FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Symptoms LIKE '%thrombocytopenia%'	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(ID) FROM Patient WHERE STRFTIME('%Y', Birthday) = '1980' AND Diagnosis = 'RA'	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient AS P JOIN Examination AS E ON P.ID = E.ID WHERE P.SEX = 'M' AND E.`Examination Date` BETWEEN '1995-01-01' AND '1997-12-31' AND P.Diagnosis = 'Behcet' AND P.Admission = '-'	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE SEX = 'F' AND WBC < 3.5	thrombosis_prediction
SELECT DATEDIFF(`Examination Date`, `First Date`) AS DaysBeforeEvaluation FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.ID = 821298	thrombosis_prediction
SELECT CASE WHEN UA > 8.0 AND SEX = 'M' OR UA > 6.5 AND SEX = 'F' THEN 'Yes' ELSE 'No' END AS UricAcidInRange FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.ID = 57266;	thrombosis_prediction
SELECT T2.Date FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.ID = 48473 AND T2.GOT >= 60	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE strftime('%Y', L.Date) = '1994' AND L.GOT < 60;	thrombosis_prediction
SELECT ID FROM Laboratory WHERE GPT >= 60 AND ID IN ( SELECT ID FROM Patient WHERE SEX = 'M' )	thrombosis_prediction
SELECT T2.Diagnosis FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.GPT > 60 ORDER BY T2.Birthday ASC	thrombosis_prediction
SELECT AVG(LDH) FROM Laboratory WHERE LDH < 500	thrombosis_prediction
SELECT P.ID, STRFTIME('%Y', CURRENT_TIMESTAMP) - STRFTIME('%Y', P.Birthday) AS Age FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.LDH BETWEEN 600 AND 800;	thrombosis_prediction
SELECT T2.admission FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.ALP < 300	thrombosis_prediction
SELECT T1.ID, CASE WHEN T2.ALP < 300 THEN 'Yes' ELSE 'No' END AS ALP_Normal FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Birthday = '1982-04-01'	thrombosis_prediction
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.TP < 6.0	thrombosis_prediction
SELECT ID, TP - 8.5 AS Deviation FROM Laboratory WHERE ID IN (SELECT ID FROM Patient WHERE SEX = 'F') AND TP > 8.5	thrombosis_prediction
SELECT P.ID, P.Birthday FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.SEX = 'M' AND (L.ALB <= 3.5 OR L.ALB >= 5.5) ORDER BY P.Birthday DESC;	thrombosis_prediction
SELECT CASE WHEN T1.ALB BETWEEN 3.5 AND 5.5 THEN 'Within Normal Range' ELSE 'Outside Normal Range' END AS Albumin_Status FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T2.Birthday) = '1982'	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN UA > 8.0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(SEX) FROM Laboratory WHERE SEX = 'F'	thrombosis_prediction
SELECT AVG(T2.UA) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE (T1.SEX = 'M' AND T2.UA < 8.0) OR (T1.SEX = 'F' AND T2.UA < 6.5) GROUP BY T1.ID ORDER BY T2.Date DESC LIMIT 1	thrombosis_prediction
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.UN = 29	thrombosis_prediction
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'RA' AND T2.UN < 30	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.SEX = 'M' AND T1.CRE >= 1.5	thrombosis_prediction
SELECT CASE WHEN SUM(CASE WHEN T1.SEX = 'M' AND T2.CRE >= 1.5 THEN 1 ELSE 0 END) > SUM(CASE WHEN T1.SEX = 'F' AND T2.CRE >= 1.5 THEN 1 ELSE 0 END) THEN 'True' ELSE 'False' END AS Result FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID	thrombosis_prediction
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID ORDER BY T2.`T-BIL` DESC LIMIT 1	thrombosis_prediction
SELECT SEX ,  GROUP_CONCAT(DISTINCT ID) FROM Laboratory WHERE T_BIL >= 2.0 GROUP BY SEX	thrombosis_prediction
SELECT P.ID, L.`T-CHO` FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID ORDER BY P.Birthday ASC, L.`T-CHO` DESC LIMIT 1	thrombosis_prediction
SELECT AVG(STRFTIME('%Y', DATETIME('now')) - STRFTIME('%Y', Birthday)) AS AverageAge FROM Patient WHERE ID IN ( SELECT ID FROM Laboratory WHERE T_cho >= 250 ) AND SEX = 'M'	thrombosis_prediction
SELECT T1.Description, T1.Diagnosis FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.TG > 300	thrombosis_prediction
SELECT COUNT(DISTINCT T2.ID) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.TG >= 200 AND strftime('%Y', 'now') - strftime('%Y', T2.Birthday) > 50	thrombosis_prediction
SELECT DISTINCT ID FROM Patient WHERE Admission = '-' AND CPK < 250	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T1.Birthday) BETWEEN '1936' AND '1956' AND T1.SEX = 'M' AND T2.CPK >= 250	thrombosis_prediction
SELECT T1.ID, T1.SEX, STRFTIME('%Y', CURRENT_TIMESTAMP) - STRFTIME('%Y', T1.Birthday) AS Age FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GLU >= 180 AND T2.`T-CHO` < 250	thrombosis_prediction
SELECT T1.ID, T2.GLU FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T1.Description) = '1991' AND T2.GLU < 180	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.WBC <= 3.5 OR L.WBC >= 9.0 GROUP BY P.SEX ORDER BY strftime('%Y', 'now') - strftime('%Y', P.Birthday) ASC;	thrombosis_prediction
SELECT T1.ID ,  STRFTIME('%Y', CURRENT_TIMESTAMP) - STRFTIME('%Y', Birthday) AS Age FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.RBC < 3.5	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday, P.Admission, L.RBC FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.SEX = 'F' AND (STRFTIME('%Y', CURRENT_TIMESTAMP) - STRFTIME('%Y', P.Birthday)) >= 50 AND (L.RBC <= 3.5 OR L.RBC >= 6.0);	thrombosis_prediction
SELECT DISTINCT T1.ID, T1.SEX FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '-' AND T2.HGB < 10	thrombosis_prediction
SELECT T1.ID, T1.SEX FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'SLE' AND T1.Birthday IS NOT NULL ORDER BY T1.Birthday ASC LIMIT 1	thrombosis_prediction
SELECT T1.ID ,  STRFTIME('%Y', CURRENT_TIMESTAMP) - STRFTIME('%Y', T1.Birthday) AS Age FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.HCT >= 52 GROUP BY T1.ID HAVING COUNT(T1.ID) > 2	thrombosis_prediction
SELECT AVG(HCT) FROM Laboratory WHERE Date LIKE '1991%' AND HCT < 29;	thrombosis_prediction
SELECT SUM(CASE WHEN PLT < 100 THEN 1 ELSE 0 END) - SUM(CASE WHEN PLT > 400 THEN 1 ELSE 0 END) AS difference FROM Laboratory WHERE PLT IS NOT NULL;	thrombosis_prediction
SELECT DISTINCT T2.ID FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T1.Date) = '1984' AND SUBSTR(CAST(strftime('%Y', date('now')) AS TEXT), 1, 4) - STRFTIME('%Y', T2.Birthday) < 50 AND T1.PLT BETWEEN 100 AND 400	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T2.PT >= 14 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', CURRENT_TIMESTAMP) - STRFTIME('%Y', T1.Birthday) > 55 AND T1.SEX = 'F'	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T1.`First Date`) > '1992' AND T2.PT < 14	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE `Examination Date` > '1997-01-01' AND APTT >= 45;	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.APTT > 45 AND T1.Thrombosis = 0	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.WBC BETWEEN 3.5 AND 9.0 AND (T2.FG <= 150 OR T2.FG >= 450)	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Birthday > '1980-01-01' AND (T1.FG < 150 OR T1.FG > 450)	thrombosis_prediction
SELECT DISTINCT T2.Diagnosis FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.`U-PRO` >= 30	thrombosis_prediction
SELECT T1.ID FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'SLE' AND T1.`U-PRO` BETWEEN 0 AND 30	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Examination WHERE IGG >= 2000	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE IGG BETWEEN 900 AND 2000 AND Symptoms IS NOT NULL	thrombosis_prediction
SELECT T2.Diagnosis FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.IGA BETWEEN 80 AND 500 ORDER BY T1.IGA DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`aCL IgA` BETWEEN 80 AND 500 AND STRFTIME('%Y', T1.`First Date`) >= '1990';	thrombosis_prediction
SELECT Diagnosis FROM Examination WHERE IGM <= 40 OR IGM >= 400 GROUP BY Diagnosis ORDER BY COUNT(*) DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Description IS NULL AND T1.CRP = '+'	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.CRE >= 1.5 AND TIMESTAMPDIFF(YEAR, T1.Birthday, CURDATE()) < 70	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis LIKE '%RA%' AND T1.KCT = '+'	thrombosis_prediction
SELECT DISTINCT T1.Diagnosis FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T1.Birthday) >= '1985' AND T2.RA IN ('-', '+-')	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Birthday <= DATE_SUB(CURDATE(), INTERVAL 60 YEAR) AND T2.RF < 20	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.RF < 20 AND T1.Thrombosis = 0	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.C3 > 35 AND T1.ANA_Pattern = 'P'	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.HCT NOT BETWEEN 29 AND 52 ORDER BY T2.`aCL IgA` DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID)  FROM Examination AS T1  JOIN Patient AS T2 ON T1.ID = T2.ID  WHERE T1.Thrombosis = 1 AND T2.Diagnosis LIKE '%APS%' AND T2.Description > 10;	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.RNP IN ('-', '+-') AND T2.Admission = '+'	thrombosis_prediction
SELECT Birthday FROM Patient WHERE ID IN ( SELECT ID FROM Laboratory WHERE RNP NOT IN ('-', '+-') ) ORDER BY Birthday DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE SM IN ('-', '+-') AND Thrombosis = 0	thrombosis_prediction
SELECT ID FROM Patient WHERE ID IN ( SELECT ID FROM Laboratory WHERE SM NOT IN ('negative', '0') ) ORDER BY Birthday DESC LIMIT 3	thrombosis_prediction
SELECT DISTINCT T1.ID FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.`Examination Date` > '1997-01-01' AND T2.SC170 IN ('negative', '0')	thrombosis_prediction
SELECT COUNT(DISTINCT T2.ID) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.SC170 IN ('negative', '0') AND T2.SEX = 'F' AND T1.Symptoms IS NULL	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.SSA IN ('-', '+') AND STRFTIME('%Y', T1.`First Date`) < '2000'	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`SSA` NOT IN ('negative', '0') ORDER BY T1.`First Date` ASC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'SLE' AND T1.SSB IN ('-', '+-');	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.SSB IN ('negative', '0') AND T1.Symptoms IS NOT NULL	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.CENTROMEA IN('-', '+-') AND T2.SSB IN('-', '+-') AND T1.SEX = 'M'	thrombosis_prediction
SELECT DISTINCT T2.Diagnosis FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.DNA >= 8	thrombosis_prediction
SELECT COUNT(DISTINCT T2.ID) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.DNA < 8 AND T2.Description IS NULL	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.IGG BETWEEN 900 AND 2000 AND T1.Admission = '+'	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T1.GOT >= 60 AND T2.Diagnosis = 'SLE' THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T1.GOT >= 60 THEN 1 ELSE 0 END) FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.SEX = 'M' AND T1.GOT < 60	thrombosis_prediction
SELECT MIN(T2.Birthday) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.GOT >= 60	thrombosis_prediction
SELECT T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GPT IS NOT NULL AND T2.GPT < 60 ORDER BY T2.GPT DESC LIMIT 3	thrombosis_prediction
SELECT COUNT(*) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.GOT < 60	thrombosis_prediction
SELECT MIN(T1.`First Date`) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.LDH < 500	thrombosis_prediction
SELECT T1.`First Date` FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.LDH >= 500 ORDER BY T1.`First Date` DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE ID IN ( SELECT ID FROM Laboratory WHERE ALP >= 300 ) AND Admission = '+'	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE Admission = '-' AND ID IN (SELECT ID FROM Laboratory WHERE ALP < 300)	thrombosis_prediction
SELECT T2.Diagnosis FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.TP < 6.0	thrombosis_prediction
SELECT COUNT(*) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis LIKE '%SJS%' AND T2.Diagnosis LIKE '%SJS%' AND T1.TP BETWEEN 6.0 AND 8.5	thrombosis_prediction
SELECT T1.`Examination Date` FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.ALB BETWEEN 3.5 AND 5.5 ORDER BY T2.ALB DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(*) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.ALB BETWEEN 3.5 AND 5.5 AND T2.TP BETWEEN 6.0 AND 8.5	thrombosis_prediction
SELECT MAX(T1.`aCL IgG`), MAX(T1.`aCL IgM`), MAX(T1.`aCL IgA`) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.SEX = 'F' AND T1.UA IS NOT NULL AND T1.UA <= 6.50	thrombosis_prediction
SELECT MAX(T1.ANA) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.CRE < 1.5	thrombosis_prediction
SELECT T1.ID FROM Laboratory AS T1 WHERE T1.CRE < 1.5 ORDER BY T1.aCL IgA DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID) FROM Examination AS E JOIN Laboratory AS L ON E.ID = L.ID WHERE E.ANA_Pattern LIKE '%P%' AND L.`T-BIL` >= 2.0	thrombosis_prediction
SELECT T1.ANA FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.`T-BIL` < 2.0 ORDER BY T2.`T-BIL` DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.`T-CHO` >= 250 AND T1.KCT = '-'	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.ANA_Pattern = 'P' AND T2.T_CHO < 250	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.TG < 200 AND T1.Symptoms IS NOT NULL	thrombosis_prediction
SELECT T1.Diagnosis FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.TG IS NOT NULL AND T2.TG < 200 ORDER BY T2.TG DESC LIMIT 1	thrombosis_prediction
SELECT ID FROM Examination WHERE Thrombosis = 0 AND CPK < 250;	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.CPK < 250 AND (T1.KCT = '+' OR T1.RVVT = '+' OR T1.LAC = '+')	thrombosis_prediction
SELECT Birthday FROM Patient WHERE ID IN ( SELECT ID FROM Laboratory WHERE GLU > 180 ORDER BY Birthday ASC LIMIT 1 )	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.GLU < 180 AND T1.Thrombosis = 0	thrombosis_prediction
SELECT COUNT(ID) FROM Patient WHERE Admission = '+' AND WBC BETWEEN 3.5 AND 9.0	thrombosis_prediction
SELECT COUNT(*) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'SLE' AND T2.WBC BETWEEN 3.5 AND 9.0	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.RBC <= 3.5 OR T2.RBC >= 6.0 AND T1.Admission = '-'	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.PLT BETWEEN 100 AND 400 AND T1.Diagnosis IS NOT NULL	thrombosis_prediction
SELECT T2.PLT FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'MCTD' AND T2.PLT BETWEEN 100 AND 400	thrombosis_prediction
SELECT AVG(T2.PT) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.PT < 14	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Examination WHERE Thrombosis IN (1, 2) AND PT < 14;	thrombosis_prediction
SELECT T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Angela' AND T1.last_name = 'Sanders'	student_club
SELECT COUNT(*) FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.college = 'College of Engineering'	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.department = 'Art and Design'	student_club
SELECT COUNT(*) FROM attendance AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'Women''s Soccer'	student_club
SELECT T1.phone FROM member AS T1 INNER JOIN attendance AS T2 ON T1.member_id = T2.link_to_member INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'Women''s Soccer' AND T1.position = 'Student'	student_club
SELECT COUNT(*) FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'Women''s Soccer' AND T1.t_shirt_size = 'Medium'	student_club
SELECT T1.event_name FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T2.link_to_member IN ( SELECT member_id FROM member WHERE position = 'Student' ) GROUP BY T2.link_to_event ORDER BY COUNT(T2.link_to_event) DESC LIMIT 1	student_club
SELECT T1.college FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.position = 'Vice President'	student_club
SELECT T3.event_name FROM member AS T1 INNER JOIN attendance AS T2 ON T1.member_id = T2.link_to_member INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T1.first_name = 'Maya' AND T1.last_name = 'Mclean'	student_club
SELECT COUNT(*) FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event INNER JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T3.first_name = 'Sacha' AND T3.last_name = 'Harrison' AND STRFTIME('%Y', T1.event_date) = '2019'	student_club
SELECT COUNT(DISTINCT event_id) AS meeting_count FROM attendance JOIN event ON attendance.link_to_event = event.event_id WHERE event.type = 'Meeting' GROUP BY event.event_id HAVING COUNT(attendance.link_to_member) > 10;	student_club
SELECT T1.event_name FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.type != 'Fundraiser' GROUP BY T1.event_id HAVING COUNT(T2.link_to_event) > 20	student_club
SELECT CAST(COUNT(event_id) AS REAL) / COUNT(DISTINCT event_name) FROM event WHERE type = 'Meeting' AND STRFTIME('%Y', event_date) = '2020'	student_club
SELECT expense_description FROM expense WHERE cost = (SELECT MAX(cost) FROM expense);	student_club
SELECT COUNT(*) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Environmental Engineering'	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'Laugh Out Loud'	student_club
SELECT T1.last_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Law and Constitutional Studies'	student_club
SELECT T1.county FROM zip_code AS T1 INNER JOIN member AS T2 ON T2.zip = T1.zip_code WHERE T2.first_name = 'Sherri' AND T2.last_name = 'Ramsey'	student_club
SELECT T1.college FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Tyler' AND T2.last_name = 'Hewitt';	student_club
SELECT SUM(amount) FROM income WHERE link_to_member IN ( SELECT member_id FROM member WHERE position = 'Vice President' )	student_club
SELECT SUM(T2.spent) FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'September Meeting' AND T2.category = 'Food'	student_club
SELECT T2.city, T2.state FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.position = 'President';	student_club
SELECT T.first_name, T.last_name FROM member AS T INNER JOIN zip_code AS Z ON T.zip = Z.zip_code WHERE Z.state = 'IL'	student_club
SELECT SUM(T1.spent) FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'September Meeting' AND T1.category = 'Advertisement'	student_club
SELECT T1.department FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Pierce' AND T2.last_name = 'Guidi' OR T2.first_name = 'Luisa' AND T2.last_name = 'Guidi'	student_club
SELECT SUM(T2.amount) FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'October Speaker';	student_club
SELECT T1.approved FROM expense AS T1 JOIN attendance AS T2 ON T1.link_to_member = T2.link_to_member JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'October Meeting' AND T3.event_date LIKE '2019-10-08%'	student_club
SELECT AVG(cost) AS total_average_cost FROM expense JOIN member ON expense.link_to_member = member.member_id WHERE first_name = 'Elijah' AND last_name = 'Allen' AND strftime('%m', expense_date) IN ('09', '10');	student_club
SELECT SUM(CASE WHEN STRFTIME('%Y', T2.event_date) = '2019' THEN T1.spent ELSE 0 END) - SUM(CASE WHEN STRFTIME('%Y', T2.event_date) = '2020' THEN T1.spent ELSE 0 END) AS diff FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id	student_club
SELECT location FROM event WHERE event_name = 'Spring Budget Review';	student_club
SELECT T1.cost FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id WHERE T1.expense_date = '2019-09-04' AND T1.expense_description LIKE '%Posters%'	student_club
SELECT remaining FROM budget WHERE category = 'Food' AND amount = ( SELECT MAX(amount) FROM budget WHERE category = 'Food' )	student_club
SELECT notes FROM income WHERE date_received = '2019-09-14' AND source = 'Fundraising';	student_club
SELECT COUNT(*) FROM major WHERE college = 'College of Humanities and Social Sciences'	student_club
SELECT phone FROM member WHERE first_name = 'Carlo' AND last_name = 'Jacobs';	student_club
SELECT T1.county FROM zip_code AS T1 INNER JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T2.first_name = 'Adela' AND T2.last_name = 'O''Gallagher'	student_club
SELECT COUNT(*) FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'November Meeting' AND T1.remaining < 0	student_club
SELECT SUM(T1.amount) FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'September Speaker'	student_club
SELECT T2.event_status FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id WHERE T1.expense_date = '2019-8-20' AND T1.expense_description = 'Post Cards, Posters'	student_club
SELECT T3.major_name FROM member AS T1 INNER JOIN major AS T3 ON T1.link_to_major = T3.major_id WHERE T1.first_name = 'Brent' AND T1.last_name = 'Thomason';	student_club
SELECT COUNT(*) FROM member WHERE link_to_major IN (SELECT major_id FROM major WHERE college = 'School of Business') AND t_shirt_size = 'Medium';	student_club
SELECT T1.type FROM zip_code AS T1 INNER JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T2.first_name = 'Christof' AND T2.last_name = 'Nielsen'	student_club
SELECT T1.major_name FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.position = 'Vice President'	student_club
SELECT T1.state FROM zip_code AS T1 INNER JOIN member AS T2 ON T2.zip = T1.zip_code WHERE T2.first_name = 'Sacha' AND T2.last_name = 'Harrison'	student_club
SELECT T1.department FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.position = 'President'	student_club
SELECT T1.date_received FROM income AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Connor' AND T2.last_name = 'Hilton' AND T1.source = 'Dues'	student_club
SELECT first_name, last_name FROM member WHERE member_id = ( SELECT link_to_member FROM income WHERE source = 'Dues' ORDER BY date_received ASC LIMIT 1 )	student_club
SELECT CAST(SUM(CASE WHEN T1.event_name = 'Yearly Kickoff' THEN T2.amount ELSE 0 END) AS REAL) / SUM(CASE WHEN T1.event_name = 'October Meeting' THEN T2.amount ELSE 0 END) FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Advertisement';	student_club
SELECT CAST(SUM(CASE WHEN T1.category = 'Parking' AND T2.event_name = 'November Speaker' THEN T1.amount ELSE 0 END) AS REAL) * 100 / COUNT(T2.event_name = 'November Speaker') FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'November Speaker'	student_club
SELECT SUM(cost) AS total_cost_of_pizzas FROM expense WHERE expense_description = 'Pizza';	student_club
SELECT COUNT(*) FROM zip_code WHERE county = 'Orange County' AND state = 'Virginia';	student_club
SELECT department FROM major WHERE college = 'College of Humanities and Social Sciences'	student_club
SELECT T1.city, T1.county, T1.state FROM zip_code AS T1 INNER JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T2.first_name = 'Amy' AND T2.last_name = 'Firth'	student_club
SELECT T1.expense_description FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id ORDER BY T2.remaining ASC LIMIT 1	student_club
SELECT T2.first_name, T2.last_name FROM attendance AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.link_to_event IN ( SELECT event_id FROM event WHERE event_name = 'October Meeting' )	student_club
SELECT T1.college FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major GROUP BY T1.college ORDER BY COUNT(T1.college) DESC LIMIT 1	student_club
SELECT T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.phone = '809-555-3360'	student_club
SELECT T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event ORDER BY T2.amount DESC LIMIT 1	student_club
SELECT T2.expense_description FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T1.position = 'Vice President'	student_club
SELECT COUNT(*) FROM attendance AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'Women''s Soccer'	student_club
SELECT T1.date_received FROM income AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Casey' AND T2.last_name = 'Mason';	student_club
SELECT COUNT(*) FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T2.state = 'MD'	student_club
SELECT COUNT(*) FROM attendance AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id JOIN member AS T3 ON T1.link_to_member = T3.member_id WHERE T3.phone = '954-555-6240';	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.department = 'School of Applied Sciences, Technology and Education'	student_club
SELECT T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.status = 'Closed' ORDER BY T2.spent / T2.amount DESC LIMIT 1	student_club
SELECT COUNT(*) FROM member WHERE position = 'President';	student_club
SELECT MAX(spent) FROM budget	student_club
SELECT COUNT(*) FROM event WHERE type = 'Meeting' AND STRFTIME('%Y', event_date) = '2020'	student_club
SELECT SUM(spent) FROM budget WHERE category = 'Food';	student_club
SELECT T.first_name, T.last_name FROM ( SELECT T1.first_name, T1.last_name, COUNT(T2.link_to_event) AS num FROM member AS T1 INNER JOIN attendance AS T2 ON T1.member_id = T2.link_to_member GROUP BY T1.first_name, T1.last_name ) AS T WHERE T.num > 7	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id JOIN major mj ON m.link_to_major = mj.major_id WHERE e.event_name = 'Community Theater' AND mj.major_name = 'Interior Design';	student_club
SELECT T.first_name, T.last_name FROM member AS T JOIN zip_code AS Z ON T.zip = Z.zip_code WHERE T.zip IN ( SELECT zip_code FROM zip_code WHERE city = 'Georgetown' AND state = 'South Carolina' )	student_club
SELECT SUM(amount) FROM income WHERE link_to_member = ( SELECT member_id FROM member WHERE first_name = 'Grant' AND last_name = 'Gilmour' )	student_club
SELECT T.first_name, T.last_name FROM member AS T JOIN income AS I ON T.member_id = I.link_to_member WHERE I.amount > 40	student_club
SELECT SUM(T1.cost) FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'Yearly Kickoff'	student_club
SELECT T2.first_name, T2.last_name FROM budget AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id INNER JOIN event AS T3 ON T1.link_to_event = T3.event_id WHERE T3.event_name = 'Yearly Kickoff'	student_club
SELECT T1.first_name, T1.last_name, T2.source FROM member AS T1 INNER JOIN income AS T2 ON T1.member_id = T2.link_to_member ORDER BY T2.amount DESC LIMIT 1	student_club
SELECT T1.event_name FROM event AS T1 JOIN expense AS T2 ON T1.event_id = T2.link_to_event ORDER BY T2.cost ASC LIMIT 1	student_club
SELECT CAST(SUM(CASE WHEN T1.event_name = 'Yearly Kickoff' THEN T2.cost ELSE 0 END) AS REAL) * 100 / SUM(T2.cost) FROM event AS T1 INNER JOIN expense AS T2 ON T1.event_id = T2.link_to_event;	student_club
SELECT CAST(SUM(CASE WHEN T1.major_name = 'Finance' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T1.major_name = 'Physics' THEN 1 ELSE 0 END) FROM major AS T1 INNER JOIN member AS T2 ON T2.link_to_major = T1.major_id	student_club
SELECT source FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' GROUP BY source ORDER BY SUM(amount) DESC LIMIT 1	student_club
SELECT first_name, last_name, email FROM member WHERE position = 'Secretary'	student_club
SELECT COUNT(*) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Physics Teaching';	student_club
SELECT COUNT(T2.link_to_member) FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'Community Theater' AND STRFTIME('%Y', T1.event_date) = '2019'	student_club
SELECT COUNT(T1.link_to_event), T3.major_name FROM attendance AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id JOIN major AS T3 ON T2.link_to_major = T3.major_id WHERE T2.first_name = 'Luisa' AND T2.last_name = 'Guidi';	student_club
SELECT AVG(spent) FROM budget WHERE category = 'Food' AND event_status = 'Closed'	student_club
SELECT T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Advertisement' ORDER BY T2.spent DESC LIMIT 1	student_club
SELECT CASE WHEN EXISTS (     SELECT 1 FROM member AS m     JOIN attendance AS a ON m.member_id = a.link_to_member     JOIN event AS e ON a.link_to_event = e.event_id     WHERE m.first_name = 'Maya' AND m.last_name = 'Mclean' AND e.event_name = 'Women''s Soccer' ) THEN 'Yes' ELSE 'No' END AS attended;	student_club
SELECT CAST(SUM(CASE WHEN type = 'Community Service' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(event_id) FROM event WHERE event_date LIKE '2019%'	student_club
SELECT T2.cost FROM event AS T1 INNER JOIN expense AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'September Speaker' AND T2.expense_description = 'Posters'	student_club
SELECT t_shirt_size FROM member GROUP BY t_shirt_size ORDER BY COUNT(t_shirt_size) DESC LIMIT 1	student_club
SELECT T1.event_name FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.status = 'Closed' AND T2.remaining < 0 ORDER BY T2.remaining ASC LIMIT 1	student_club
SELECT T1.expense_description ,  SUM(T1.cost) FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'October Meeting' AND T1.approved = 'true'	student_club
SELECT T1.category ,  SUM(T1.amount) FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'April Speaker' GROUP BY T1.category ORDER BY T1.amount ASC	student_club
SELECT budget_id FROM budget WHERE category = 'Food' ORDER BY amount DESC LIMIT 1	student_club
SELECT budget_id, amount FROM budget WHERE category = 'Advertisement' ORDER BY amount DESC LIMIT 3	student_club
SELECT SUM(cost) FROM expense WHERE expense_description = 'Parking'	student_club
SELECT SUM(cost) FROM expense WHERE expense_date = '2019-08-20'	student_club
SELECT T1.first_name, T1.last_name, SUM(T2.cost) FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.link_to_member = 'rec4BLdZHS2Blfp4v'	student_club
SELECT T1.expense_description FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Sacha' AND T2.last_name = 'Harrison'	student_club
SELECT T1.expense_description FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.t_shirt_size = 'X-Large'	student_club
SELECT T1.zip FROM member AS T1 JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T2.amount < 50	student_club
SELECT T1.major_name FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Phillip' AND T2.last_name = 'Cullen'	student_club
SELECT T1.position FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Business'	student_club
SELECT COUNT(*) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Business' AND T1.t_shirt_size = 'Medium'	student_club
SELECT T1.type FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.remaining > 30	student_club
SELECT DISTINCT T1.category FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.location = 'MU 215'	student_club
SELECT T1.category FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_date = '2020-03-24T12:00:00';	student_club
SELECT T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Vice President'	student_club
SELECT CAST(SUM(CASE WHEN T1.position = 'Member' AND T2.major_name = 'Business' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.member_id) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id	student_club
SELECT T1.category FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.location = 'MU 215'	student_club
SELECT COUNT(*) FROM income WHERE amount = 50;	student_club
SELECT COUNT(*) FROM member WHERE t_shirt_size = 'X-Large' AND position = 'Member'	student_club
SELECT COUNT(*) FROM major WHERE college = 'College of Agriculture and Applied Sciences' AND department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT T1.last_name ,  T2.department ,  T2.college FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Environmental Engineering'	student_club
SELECT T2.category FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.location = 'MU 215' AND T1.type = 'Guest Speaker' AND T2.spent = 0	student_club
SELECT T2.city, T2.state FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code INNER JOIN major AS T3 ON T1.link_to_major = T3.major_id WHERE T3.department = 'Electrical and Computer Engineering Department' AND T1.position = 'Member'	student_club
SELECT T1.event_name FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T3.position = 'Vice President' AND T1.location = '900 E. Washington St.' AND T1.type = 'Social'	student_club
SELECT T1.last_name ,  T1.position FROM member AS T1 JOIN expense AS T2 ON T1.member_id  =  T2.link_to_member WHERE T2.expense_date  =  '2019-09-10' AND T2.expense_description  =  'Pizza'	student_club
SELECT T1.last_name FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'Women''s Soccer' AND T1.position = 'Member'	student_club
SELECT CAST(SUM(CASE WHEN T1.amount = 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.member_id) FROM income AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.t_shirt_size = 'Medium' AND T2.position = 'Member'	student_club
SELECT DISTINCT county FROM zip_code WHERE type = 'PO Box'	student_club
SELECT zip_code FROM zip_code WHERE city IN ( SELECT city FROM zip_code WHERE county = 'San Juan Municipio' AND state = 'Puerto Rico' ) AND type = 'PO Box'	student_club
SELECT event_name FROM event WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20'	student_club
SELECT T1.link_to_event FROM attendance AS T1 INNER JOIN expense AS T2 ON T1.link_to_event = T2.link_to_event WHERE T2.cost > 50	student_club
SELECT T1.first_name, T1.last_name, T2.link_to_event FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.approved = 'true' AND T2.expense_date BETWEEN '2019-01-10' AND '2019-11-19'	student_club
SELECT T2.college FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Katy' AND T2.major_id = 'rec1N0upiVLy5esTO'	student_club
SELECT T1.phone FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.college = 'College of Agriculture and Applied Sciences' AND T2.major_name = 'Business'	student_club
SELECT T1.email FROM member AS T1 INNER JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T2.amount > 20 AND T2.date_received BETWEEN '2019-09-10' AND '2019-11-19'	student_club
SELECT COUNT(*) FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Education' AND T1.position = 'Member'	student_club
SELECT CAST(SUM(CASE WHEN remaining < 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(event_id) FROM budget	student_club
SELECT event_id, location, status FROM event WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31';	student_club
SELECT expense_description FROM expense GROUP BY expense_description HAVING AVG(cost) > 50	student_club
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large'	student_club
SELECT CAST(SUM(CASE WHEN type = 'PO Box' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(zip_code) FROM zip_code	student_club
SELECT T1.event_name ,  T1.location FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.remaining > 0	student_club
SELECT T1.event_name, T1.event_date FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event JOIN expense AS T3 ON T2.budget_id = T3.link_to_budget WHERE T3.expense_description = 'Pizza' AND T3.cost BETWEEN 50 AND 100	student_club
SELECT T1.first_name, T1.last_name, T3.major_name FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member INNER JOIN major AS T3 ON T1.link_to_major = T3.major_id WHERE T2.cost > 100	student_club
SELECT T2.city, T2.county FROM income AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code GROUP BY T1.link_to_member HAVING COUNT(T1.income_id) > 40	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member GROUP BY T1.member_id HAVING COUNT(T2.event_id) > 1 ORDER BY SUM(T2.cost) DESC LIMIT 1	student_club
SELECT AVG(T2.cost) FROM income AS T1 INNER JOIN expense AS T2 ON T1.link_to_member = T2.link_to_member WHERE T1.amount > 0 AND T2.approved = 'true' AND T1.source != 'Dues'	student_club
SELECT T1.event_name FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event JOIN expense AS T3 ON T2.budget_id = T3.link_to_budget WHERE T3.expense_description = 'Parking' AND T3.cost < ( SELECT AVG(T3.cost) FROM expense AS T3 JOIN budget AS T2 ON T3.link_to_budget = T2.budget_id WHERE T2.category = 'Parking' )	student_club
SELECT CAST(SUM(CASE WHEN T2.type = 'Meeting' THEN T1.cost ELSE 0 END) AS REAL) * 100 / COUNT(T1.expense_id) FROM expense AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id	student_club
SELECT T2.budget_id FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id WHERE T1.expense_description = 'Water, chips, cookies' ORDER BY T1.cost DESC LIMIT 1	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member GROUP BY T1.member_id ORDER BY SUM(T2.cost) DESC LIMIT 5	student_club
SELECT T1.first_name, T1.last_name, T1.phone FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.cost > ( SELECT AVG(cost) FROM expense )	student_club
SELECT CAST(SUM(CASE WHEN T2.state = 'New Jersey' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.position = 'Member') - CAST(SUM(CASE WHEN T2.state = 'Vermont' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.position = 'Member') FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.position = 'Member'	student_club
SELECT T1.major_name, T1.department FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Garrett' AND T2.last_name = 'Gerke';	student_club
SELECT T1.first_name, T1.last_name, SUM(T2.cost) FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.expense_description = 'Water, Veggie tray, supplies'	student_club
SELECT T1.last_name ,  T1.phone FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Elementary Education'	student_club
SELECT T1.category ,  T1.amount FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'January Speaker'	student_club
SELECT T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Food'	student_club
SELECT T1.first_name , T1.last_name , T2.amount FROM member AS T1 INNER JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T2.date_received = '2019-09-09'	student_club
SELECT T1.category FROM budget AS T1 INNER JOIN expense AS T2 ON T1.budget_id = T2.link_to_budget WHERE T2.expense_description = 'Posters'	student_club
SELECT T1.first_name, T1.last_name, T2.college FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Secretary'	student_club
SELECT SUM(T1.spent), T2.event_name FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Speaker Gifts'	student_club
SELECT T2.city FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Garrett' AND T1.last_name = 'Gerke'	student_club
SELECT T1.first_name, T1.last_name, T1.position FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T2.city = 'Lincolnton' AND T2.state = 'North Carolina' AND T2.zip_code = 28092	student_club
SELECT COUNT(GasStationID) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Premium'	debit_card_specializing
SELECT CAST(SUM(CASE WHEN Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN Currency = 'CZK' THEN 1 ELSE 0 END) FROM customers WHERE Currency IN ('EUR', 'CZK')	debit_card_specializing
SELECT T2.CustomerID FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date LIKE '2012%' AND T2.Segment = 'LAM' ORDER BY T1.Consumption ASC LIMIT 1	debit_card_specializing
SELECT AVG(AvgCons) FROM ( SELECT SUM(CASE WHEN SUBSTR(Date, 1, 4) = '2013' THEN Consumption ELSE 0 END) / 12 AS AvgCons FROM yearmonth INNER JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE customers.Segment = 'SME' )	debit_card_specializing
SELECT T1.CustomerID FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Currency = 'CZK' AND STRFTIME('%Y', T2.Date) = '2011' GROUP BY T1.CustomerID ORDER BY SUM(T2.Amount) DESC LIMIT 1	debit_card_specializing
SELECT COUNT(CustomerID) FROM yearmonth WHERE CustomerID IN ( SELECT CustomerID FROM customers WHERE Segment = 'KAM' ) AND Date BETWEEN '201201' AND '201212' AND Consumption < 30000;	debit_card_specializing
SELECT SUM(CASE WHEN T1.Currency = 'CZK' THEN T2.Consumption ELSE 0 END) - SUM(CASE WHEN T1.Currency = 'EUR' THEN T2.Consumption ELSE 0 END) AS Difference FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date BETWEEN '201201' AND '201212'	debit_card_specializing
SELECT STRFTIME('%Y', T1.Date) FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Currency = 'EUR' GROUP BY STRFTIME('%Y', T1.Date) ORDER BY SUM(T1.Amount) DESC LIMIT 1	debit_card_specializing
SELECT Segment FROM customers WHERE CustomerID IN (SELECT CustomerID FROM yearmonth GROUP BY CustomerID ORDER BY SUM(Consumption) ASC LIMIT 1)	debit_card_specializing
SELECT SUBSTR(Date, 1, 4) AS Year FROM yearmonth ORDER BY Consumption DESC LIMIT 1	debit_card_specializing
SELECT T1.Date FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Segment = 'SME' AND T1.Date BETWEEN '201301' AND '201312' ORDER BY T1.Consumption DESC LIMIT 1	debit_card_specializing
SELECT      (SUM(CASE WHEN T2.Segment = 'SME' THEN T1.Consumption ELSE 0 END) / COUNT(DISTINCT CASE WHEN T2.Segment = 'SME' AND SUBSTR(T1.Date, 1, 4) = '2013' THEN T2.CustomerID END)) -     (SUM(CASE WHEN T2.Segment = 'LAM' THEN T1.Consumption ELSE 0 END) / COUNT(DISTINCT CASE WHEN T2.Segment = 'LAM' AND SUBSTR(T1.Date, 1, 4) = '2013' THEN T2.CustomerID END)) AS diff_SME_LAM,          (SUM(CASE WHEN T2.Segment = 'LAM' THEN T1.Consumption ELSE 0 END) / COUNT(DISTINCT CASE WHEN T2.Segment = 'LAM' AND SUBSTR(T1.Date, 1, 4) = '2013' THEN T2.CustomerID END)) -     (SUM(CASE WHEN T2.Segment = 'KAM' THEN T1.Consumption ELSE 0 END) / COUNT(DISTINCT CASE WHEN T2.Segment = 'KAM' AND SUBSTR(T1.Date, 1, 4) = '2013' THEN T2.CustomerID END)) AS diff_LAM_KAM,          (SUM(CASE WHEN T2.Segment = 'KAM' THEN T1.Consumption ELSE 0 END) / COUNT(DISTINCT CASE WHEN T2.Segment = 'KAM' AND SUBSTR(T1.Date, 1, 4) = '2013' THEN T2.CustomerID END)) -     (SUM(CASE WHEN T2.Segment = 'SME' THEN T1.Consumption ELSE 0 END) / COUNT(DISTINCT CASE WHEN T2.Segment = 'SME' AND SUBSTR(T1.Date, 1, 4) = '2013' THEN T2.CustomerID END)) AS diff_KAM_SME FROM      yearmonth AS T1 INNER JOIN      customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE      SUBSTR(T1.Date, 1, 4) = '2013';	debit_card_specializing
SELECT Segment, MAX((SUM(CASE WHEN SUBSTR(Date, 1, 4) = '2013' THEN Consumption ELSE 0 END) - SUM(CASE WHEN SUBSTR(Date, 1, 4) = '2012' THEN Consumption ELSE 0 END)) / SUM(CASE WHEN SUBSTR(Date, 1, 4) = '2013' THEN Consumption ELSE 0 END)) * 100 AS MaxPercentageIncrease, MIN((SUM(CASE WHEN SUBSTR(Date, 1, 4) = '2013' THEN Consumption ELSE 0 END) - SUM(CASE WHEN SUBSTR(Date, 1, 4) = '2012' THEN Consumption ELSE 0 END)) / SUM(CASE WHEN SUBSTR(Date, 1, 4) = '2013' THEN Consumption ELSE 0 END)) * 100 AS MinPercentageDecrease FROM customers INNER JOIN yearmonth ON customers.CustomerID = yearmonth.CustomerID WHERE Currency = 'EUR' GROUP BY Segment	debit_card_specializing
SELECT SUM(Consumption) FROM yearmonth WHERE CustomerID = 6 AND Date BETWEEN '201308' AND '201311'	debit_card_specializing
SELECT SUM(CASE WHEN Country = 'CZE' THEN 1 ELSE 0 END) - SUM(CASE WHEN Country = 'SVK' THEN 1 ELSE 0 END) AS Discount_Gas_Stations_Difference FROM gasstations WHERE Segment LIKE '%Discount%'	debit_card_specializing
SELECT T2.Consumption - T1.Consumption FROM yearmonth AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date = '201304' AND T2.Date = '201304' AND T1.CustomerID = 5 AND T2.CustomerID = 7	debit_card_specializing
SELECT SUM(CASE WHEN T2.Currency = 'CZK' THEN 1 ELSE 0 END) - SUM(CASE WHEN T2.Currency = 'EUR' THEN 1 ELSE 0 END) AS Difference FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Segment = 'SME'	debit_card_specializing
SELECT T1.CustomerID FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM' AND T1.Currency = 'EUR' AND T2.Date = '201310' ORDER BY T2.Consumption DESC LIMIT 1	debit_card_specializing
SELECT c.CustomerID, SUM(y.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'KAM' GROUP BY c.CustomerID ORDER BY TotalConsumption DESC LIMIT 1	debit_card_specializing
SELECT SUM(t.Consumption) FROM yearmonth AS t WHERE t.CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'KAM') AND t.Date = '201305';	debit_card_specializing
SELECT CAST(SUM(CASE WHEN T2.Consumption > 46.73 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM'	debit_card_specializing
SELECT Country ,  COUNT(*) FROM gasstations WHERE Segment = 'Value for money' GROUP BY Country ORDER BY COUNT(*) DESC LIMIT 1	debit_card_specializing
SELECT CAST(SUM(CASE WHEN T1.Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'KAM'	debit_card_specializing
SELECT CAST(SUM(CASE WHEN Consumption > 528.3 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(CustomerID) FROM yearmonth WHERE Date LIKE '201202%'	debit_card_specializing
SELECT CAST(SUM(CASE WHEN Segment = 'Premium' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM gasstations WHERE Country = 'SVK'	debit_card_specializing
SELECT CustomerID FROM yearmonth WHERE Date = '201309' ORDER BY Consumption DESC LIMIT 1	debit_card_specializing
SELECT T1.Segment FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '201309' ORDER BY T2.Consumption ASC LIMIT 1	debit_card_specializing
SELECT T1.CustomerID FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '201206' AND T1.Segment = 'SME' ORDER BY T2.Consumption ASC LIMIT 1	debit_card_specializing
SELECT MAX(Consumption) FROM yearmonth WHERE Date LIKE '2012%'	debit_card_specializing
SELECT MAX(AvgMonthlyConsumption) FROM ( SELECT AVG(Consumption) AS AvgMonthlyConsumption FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Currency = 'EUR' GROUP BY T1.CustomerID )	debit_card_specializing
SELECT T2.Description FROM transactions_1k AS T1 INNER JOIN products AS T2 ON T1.ProductID = T2.ProductID WHERE T1.Date LIKE '201309%'	debit_card_specializing
SELECT DISTINCT T2.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE strftime('%Y%m', T1.Date) = '201306'	debit_card_specializing
SELECT DISTINCT T1.ChainID FROM gasstations AS T1 INNER JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Currency = 'EUR'	debit_card_specializing
SELECT T1.Description FROM products AS T1 INNER JOIN transactions_1k AS T2 ON T1.ProductID = T2.ProductID WHERE T2.Currency = 'EUR'	debit_card_specializing
SELECT AVG(Price) FROM transactions_1k WHERE Date LIKE '2012-01-%'	debit_card_specializing
SELECT COUNT(DISTINCT t1.CustomerID) FROM customers AS t1 INNER JOIN yearmonth AS t2 ON t1.CustomerID = t2.CustomerID WHERE t1.Currency = 'EUR' AND t2.Consumption > 1000	debit_card_specializing
SELECT T3.Description FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID INNER JOIN products AS T3 ON T1.ProductID = T3.ProductID WHERE T2.Country = 'CZE'	debit_card_specializing
SELECT DISTINCT Time FROM transactions_1k WHERE GasStationID IN ( SELECT GasStationID FROM gasstations WHERE ChainID = 11 )	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE' AND T1.Price > 1000	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE' AND T1.Date > '2012-01-01'	debit_card_specializing
SELECT AVG(TotalPrice) FROM ( SELECT T1.Price * T1.Amount AS TotalPrice FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE' )	debit_card_specializing
SELECT AVG(Price) FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Currency = 'EUR'	debit_card_specializing
SELECT T1.CustomerID FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '2012-08-25' ORDER BY T2.Amount DESC LIMIT 1	debit_card_specializing
SELECT T2.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-25' ORDER BY T1.TransactionID ASC LIMIT 1	debit_card_specializing
SELECT T1.Currency FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '2012-08-24' AND T2.Time = '16:25:00'	debit_card_specializing
SELECT T2.Segment FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date = '2012-08-23' AND T1.Time = '21:20:00'	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k WHERE Date = '2012-08-26' AND Time < '13:00:00' AND Currency = 'CZK';	debit_card_specializing
SELECT Segment FROM customers ORDER BY CustomerID ASC LIMIT 1	debit_card_specializing
SELECT T2.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-24' AND T1.Time = '12:42:00'	debit_card_specializing
SELECT ProductID FROM transactions_1k WHERE Date = '2012-08-23' AND Time = '21:20:00'	debit_card_specializing
SELECT T1.Date, T1.Amount FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date = '2012-08-24' AND T1.Amount = 124.05; SELECT Consumption FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM transactions_1k WHERE Date = '2012-08-24' AND Amount = 124.05) AND Date LIKE '201201%';	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-26' AND T1.Time BETWEEN '08:00:00' AND '09:00:00' AND T2.Country = 'CZE'	debit_card_specializing
SELECT T1.Currency FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date LIKE '%201306%' AND T2.Amount = 214582.17;	debit_card_specializing
SELECT T1.Country FROM gasstations AS T1 INNER JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.CardID = 667467	debit_card_specializing
SELECT T1.Country FROM gasstations AS T1 INNER JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Date = '2012-08-24' AND T2.Amount = 548.4	debit_card_specializing
SELECT CAST(SUM(CASE WHEN Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM customers WHERE Date = '2012-08-25'	debit_card_specializing
SELECT      (t1.Consumption - t2.Consumption) / t1.Consumption AS ConsumptionDecreaseRate FROM      yearmonth t1 JOIN      yearmonth t2 ON t1.CustomerID = t2.CustomerID AND t1.Date LIKE '2012%' JOIN      transactions_1k tx ON t1.CustomerID = tx.CustomerID AND tx.Date = '2012-08-25' WHERE      t1.Date LIKE '2012%' AND t2.Date LIKE '2013%';	debit_card_specializing
SELECT T2.Description FROM transactions_1k AS T1 INNER JOIN products AS T2 ON T1.ProductID = T2.ProductID GROUP BY T2.Description ORDER BY SUM(T1.Amount) DESC LIMIT 1	debit_card_specializing
SELECT SUM(CASE WHEN T2.Segment = 'Premium' THEN 1 ELSE 0 END) * 100 / COUNT(*) FROM gasstations AS T1 INNER JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Country = 'SVK'	debit_card_specializing
SELECT SUM(Amount) FROM transactions_1k WHERE CustomerID = 38508 AND strftime('%Y%m', Date) = '201201'	debit_card_specializing
SELECT T2.Description FROM transactions_1k AS T1 INNER JOIN products AS T2 ON T1.ProductID = T2.ProductID GROUP BY T2.Description ORDER BY COUNT(T1.TransactionID) DESC LIMIT 5	debit_card_specializing
SELECT T1.CustomerID, AVG(T1.Price), T2.Currency FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID GROUP BY T1.CustomerID ORDER BY SUM(T1.Amount) DESC LIMIT 1	debit_card_specializing
SELECT T2.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.ProductID = 2 ORDER BY T1.Price DESC LIMIT 1	debit_card_specializing
SELECT T2.CustomerID ,  T1.Consumption FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T1.CustomerID  =  T2.CustomerID WHERE T2.CustomerID IN ( SELECT CustomerID FROM transactions_1k WHERE ProductID  =  5 AND Price / Amount  >  29 ) AND T1.Date LIKE '%201208%'	debit_card_specializing
