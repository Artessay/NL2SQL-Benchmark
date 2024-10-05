SELECT MAX(`Percent (%) Eligible Free (K-12)`) FROM frpm WHERE `County Name` = 'Alameda'	california_schools
SELECT `Percent (%) Eligible Free (Ages 5-17)` FROM frpm WHERE `School Type` = 'Continuation' ORDER BY `Percent (%) Eligible Free (Ages 5-17)` ASC LIMIT 3	california_schools
SELECT DISTINCT T2.Zip FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.County = 'Fresno' AND T1.`Charter School (Y/N)` = 1	california_schools
SELECT T1.MailStreet FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`FRPM Count (K-12)` IS NOT NULL ORDER BY T2.`FRPM Count (K-12)` DESC LIMIT 1	california_schools
SELECT T1.Phone FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`Charter School (Y/N)` = 1 AND T1.OpenDate > '2000-01-01'	california_schools
SELECT COUNT(T1.CDSCode) FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrMath > 400 AND T1.Virtual = 'F'	california_schools
SELECT T1.School FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumTstTakr > 500 AND (T1.Magnet = 1 OR T1.GSoffered LIKE '%Magnet%')	california_schools
SELECT T1.Phone FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumGE1500 > 0 ORDER BY T2.NumGE1500 DESC LIMIT 1	california_schools
SELECT NumTstTakr FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.CDSCode = (SELECT CDSCode FROM frpm WHERE `FRPM Count (K-12)` IS NOT NULL ORDER BY `FRPM Count (K-12)` DESC LIMIT 1)	california_schools
SELECT COUNT(T2.CDSCode) FROM satscores AS T1 INNER JOIN frpm AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath > 560 AND T2.CharterFundingType = 'Directly funded'	california_schools
SELECT T1.`FRPM Count (Ages 5-17)` FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds ORDER BY T2.AvgScrRead DESC LIMIT 1	california_schools
SELECT CDSCode FROM frpm WHERE Enrollment (K-12) + Enrollment (Ages 5-17) > 500	california_schools
SELECT MAX(T1.`Percent (%) Eligible Free (Ages 5-17)`) FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumGE1500 / T2.NumTstTakr > 0.3	california_schools
SELECT T2.Phone FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumTstTakr > 0 ORDER BY CAST(T1.NumGE1500 AS REAL) / T1.NumTstTakr DESC LIMIT 3	california_schools
SELECT T1.NCESDist FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T2.`Enrollment (Ages 5-17)` DESC LIMIT 5	california_schools
SELECT T2.District FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.StatusType = 'Active' GROUP BY T2.District ORDER BY AVG(T1.AvgScrRead) DESC LIMIT 1	california_schools
SELECT COUNT(*) FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumTstTakr < 100 AND T1.County = 'Alameda'	california_schools
SELECT T2.CDSCode FROM satscores AS T1 INNER JOIN frpm AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrWrite > 499 AND T2.CharterNumber IS NOT NULL ORDER BY T1.AvgScrWrite DESC LIMIT 1	california_schools
SELECT COUNT(*) FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.County = 'Fresno' AND T1.FundingType = 'Directly funded' AND T2.NumTstTakr <= 250	california_schools
SELECT T2.Phone FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrMath DESC LIMIT 1	california_schools
SELECT COUNT(*) FROM frpm WHERE County = 'Amador' AND Low_Grade = 9 AND High_Grade = 12;	california_schools
SELECT COUNT(*) FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.County = 'Los Angeles' AND T1.`Percent (%) Eligible Free (K-12)` > 50 AND T1.`Percent (%) Eligible Free (K-12)` < 70	california_schools
SELECT T2.School FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.County = 'Contra Costa' ORDER BY T1.NumTstTakr DESC LIMIT 1	california_schools
SELECT T2.School ,  T2.Street ,  T2.StreetAbr ,  T2.City ,  T2.Zip FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode  =  T2.CDSCode WHERE T1.`Enrollment (K-12)` - T1.`Enrollment (Ages 5-17)` > 30	california_schools
SELECT T2.School FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.[Percent (%) Eligible Free (K-12)] > 0.1 AND T2.CDSCode IN (SELECT cds FROM satscores WHERE NumGE1500 >= 1)	california_schools
SELECT T2.School, T1.FundingType FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Percent (%) Eligible Free (K-12)` > 50 AND T1.`Percent (%) Eligible FRPM (K-12)` > 60 ORDER BY T1.`Percent (%) Eligible Free (K-12)` DESC LIMIT 1	california_schools
SELECT T1.School, T1.Street, T1.City, T1.State, T1.Zip FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.County = 'Monterey' AND T2.`Enrollment (Ages 5-17)` > 800 AND T2.`School Type` = 'High Schools (Public)'	california_schools
SELECT T2.sname, T1.AvgScrWrite, T1.NumTstTakr FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.OpenDate > '1991-12-31' OR T2.ClosedDate < '2000-12-31'	california_schools
SELECT T1.School, T1.DOCType FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.Charter Funding Type = 'Locally Funded' GROUP BY T1.School, T1.DOCType HAVING ABS(T2.`Enrollment (K-12)` - T2.`Enrollment (Ages 5-17)`) > (SELECT AVG(ABS(T2.`Enrollment (K-12)` - T2.`Enrollment (Ages 5-17)`)) FROM frpm AS T2 WHERE T2.Charter Funding Type = 'Locally Funded')	california_schools
SELECT T2.OpenDate FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.LowGrade = 'K' AND T1.HighGrade = '12' ORDER BY T1.Enrollment DESC LIMIT 1	california_schools
SELECT T1.City FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.LowGrade = 'K' AND T2.HighGrade = '12' ORDER BY T2.Enrollment ASC LIMIT 5	california_schools
SELECT T1.`Percent (%) Eligible Free (K-12)` FROM frpm AS T1 WHERE T1.`Enrollment (K-12)` IS NOT NULL ORDER BY T1.`Enrollment (K-12)` DESC LIMIT 10, 2	california_schools
SELECT T1.CDSCode, T1.School, T1.`Percent (%) Eligible Free (K-12)` FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.StatusType = 'Active' AND T2.NCESDist = '0691051' AND T2.DocType = 'TRAD' AND T2.SOCType = 'ELEMHIGH' OR T2.DocType = 'TRAD' AND T2.SOCType = 'HS' ORDER BY T1.`FRPM Count (K-12)` DESC LIMIT 5	california_schools
SELECT T1.Website, T1.School FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`Free Meal Count (Ages 5-17)` BETWEEN 1900 AND 2000	california_schools
SELECT T1.`Percent (%) Eligible Free (Ages 5-17)` FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.School = 'Community School for Creative Education' AND T2.AdmFName1 = 'Kacey' AND T2.AdmLName1 = 'Gibson'	california_schools
SELECT T1.Email FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`Charter School (Y/N)` = 1 ORDER BY T2.`Enrollment (K-12)` ASC LIMIT 1	california_schools
SELECT T2.AdmFName1, T2.AdmLName1 FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumGE1500 IS NOT NULL ORDER BY T1.NumGE1500 DESC LIMIT 1	california_schools
SELECT T1.Street, T1.City, T1.Zip, T1.State FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumTstTakr > 0 ORDER BY CAST(T2.NumGE1500 AS REAL) / T2.NumTstTakr ASC LIMIT 1	california_schools
SELECT T2.Website FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumTstTakr BETWEEN 2000 AND 3000	california_schools
SELECT AVG(T2.NumTstTakr) FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.OpenDate LIKE '1980%' AND T1.County = 'Fresno'	california_schools
SELECT T2.Phone FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.District = 'Fresno Unified' ORDER BY T1.AvgScrRead ASC LIMIT 1	california_schools
SELECT T1.School FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.Virtual = 'F' GROUP BY T1.County, T1.School ORDER BY AVG(T2.AvgScrRead) DESC LIMIT 5	california_schools
SELECT T1.Educational_Option_Type FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.StatusType = 'Active' ORDER BY T1.AvgScrMath DESC LIMIT 1	california_schools
SELECT T2.AvgScrMath, T1.County FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumTstTakr IS NOT NULL AND T2.AvgScrMath IS NOT NULL AND T2.AvgScrRead IS NOT NULL AND T2.AvgScrWrite IS NOT NULL ORDER BY (T2.AvgScrMath + T2.AvgScrRead + T2.AvgScrWrite) ASC LIMIT 1	california_schools
SELECT AVG(T2.AvgScrWrite), T1.City FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumGE1500 > 0 GROUP BY T1.City ORDER BY COUNT(*) DESC LIMIT 1	california_schools
SELECT T2.School, AVG(T1.AvgScrWrite) FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.AdmFName1 = 'Ricci' AND T2.AdmLName1 = 'Ulrich' GROUP BY T2.School	california_schools
SELECT T1.CDSCode FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.DOC = 31 AND T1.`Low Grade` = 'K' AND T1.`High Grade` = '12' ORDER BY T1.`Enrollment (K-12)` DESC LIMIT 1	california_schools
SELECT COUNT(CDSCode) / 12 AS MonthlyAverage FROM schools WHERE DOC = 52 AND OpenDate BETWEEN '1980-01-01' AND '1980-12-31'	california_schools
SELECT COUNT(CASE WHEN T2.DOC = 54 THEN 1 ELSE NULL END) / COUNT(CASE WHEN T2.DOC = 52 THEN 1 ELSE NULL END) AS Ratio FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.County = 'Orange' AND T1.`Percent (%) Eligible Free (K-12)` IS NOT NULL AND T1.`Percent (%) Eligible FRPM (K-12)` IS NOT NULL	california_schools
SELECT T2.County, T1.School, T1.ClosedDate FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.StatusType = 'Closed' GROUP BY T2.County, T1.School, T1.ClosedDate ORDER BY COUNT(T1.School) DESC LIMIT 1	california_schools
SELECT T2.Street, T2.School FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath IS NOT NULL ORDER BY T1.AvgScrMath DESC LIMIT 1, 1	california_schools
SELECT T2.MailStreet, T2.School FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.rtype = 'S' AND T1.AvgScrRead IS NOT NULL ORDER BY T1.AvgScrRead ASC LIMIT 1	california_schools
SELECT COUNT(T1.CDSCode) FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrRead + T2.AvgScrMath + T2.AvgScrWrite >= 1500 AND T1.MailingCity = 'Lakeport'	california_schools
SELECT COUNT(T2.NumTstTakr) FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.MailCity = 'Fresno'	california_schools
SELECT T2.School ,  T2.Zip FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.AdmFName1 = 'Avetik' AND T2.AdmLName1 = 'Atoian'	california_schools
SELECT SUM(CASE WHEN T1.County = 'Colusa' THEN 1 ELSE 0 END) / SUM(CASE WHEN T1.County = 'Humboldt' THEN 1 ELSE 0 END) AS Ratio FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.State = 'CA' AND T1.County IN ('Colusa', 'Humboldt')	california_schools
SELECT COUNT(T1.CDSCode) FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.City = 'San Joaquin' AND T1.State = 'CA' AND T1.StatusType = 'Active'	california_schools
SELECT T1.Phone ,  T1.Ext FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds ORDER BY T2.AvgScrWrite DESC LIMIT 1	california_schools
SELECT T1.Phone, T1.Ext, T1.School FROM schools AS T1 WHERE T1.Zip = '95203-3704'	california_schools
SELECT T1.Website FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.AdmFName1 = 'Mike' AND T1.AdmLName1 = 'Larson' OR T1.AdmFName2 = 'Mike' AND T1.AdmLName2 = 'Larson' OR T1.AdmFName3 = 'Mike' AND T1.AdmLName3 = 'Larson' OR T1.AdmFName1 = 'Dante' AND T1.AdmLName1 = 'Alvarez' OR T1.AdmFName2 = 'Dante' AND T1.AdmLName2 = 'Alvarez' OR T1.AdmFName3 = 'Dante' AND T1.AdmLName3 = 'Alvarez'	california_schools
SELECT Website FROM schools WHERE Charter = 1 AND Virtual = 'P' AND County = 'San Joaquin'	california_schools
SELECT COUNT(*) FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.City = 'Hickman' AND T1.DOC = 52 AND T1.Charter = 1	california_schools
SELECT COUNT(*) FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.County = 'Los Angeles' AND T1.Charter = 0 AND T1.`Percent (%) Eligible Free (K-12)` < 0.18	california_schools
SELECT T1.School, T1.City FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.Charter School Number = '00D2' AND T1.Charter = 1	california_schools
SELECT COUNT(*) FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.MailCity = 'Hickman' AND T2.CharterNum = '00D4'	california_schools
SELECT CAST(SUM(CASE WHEN T2.FundingType = 'Locally Funded' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.CDSCode) FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.County = 'Santa Clara'	california_schools
SELECT COUNT(*) FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.County = 'Stanislaus' AND T1.FundingType = 'Directly Funded' AND T1.OpenDate BETWEEN '2000-01-01' AND '2005-12-31'	california_schools
SELECT COUNT(*) FROM schools WHERE City = 'San Francisco' AND ClosedDate BETWEEN '1989-01-01' AND '1989-12-31';	california_schools
SELECT T2.County FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.SOC = 11 AND T1.ClosedDate BETWEEN '1980-01-01' AND '1989-12-31' GROUP BY T2.County ORDER BY COUNT(T1.CDSCode) DESC LIMIT 1	california_schools
SELECT NCESDist FROM schools WHERE SOC = 31	california_schools
SELECT COUNT(*) FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.County = 'Alpine' AND T2.SchoolType = 'Community Day Schools' AND T2.StatusType IN ('Active', 'Closed')	california_schools
SELECT T1.District FROM schools AS T1 WHERE T1.City = 'Fresno' AND T1.Magnet = 0 LIMIT 1	california_schools
SELECT T1.`Enrollment (Ages 5-17)` FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.School = 'State Special School' AND T2.City = 'Fremont' AND T1.`Academic Year` = '2014-2015' AND T2.EdOpsCode = 'SSS'	california_schools
SELECT T1.`Free Meal Count (Ages 5-17)` FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.School = 'Youth Authority School' AND T2.MailStreet = 'PO Box 1040'	california_schools
SELECT MIN(T2.LowGrade) FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.NCESDist = '0613360' AND T1.EdOpsCode = 'SPECON'	california_schools
SELECT DISTINCT T1.School FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`Educational Option Type` = 'Breakfast Provision 2' AND T1.`County Code` = 37	california_schools
SELECT T2.City FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.EILCode = 'HS' AND T1.LowGrade = '9' AND T1.HighGrade = '12' AND T2.County = 'Merced'	california_schools
SELECT T1.School, T1.County, (T1.FRPM_Count_5_17 / T1.Enrollment_5_17) * 100 AS Percent_Eligible_FRPM FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.Low_Grade = 'K' AND T2.High_Grade = '9' AND T1.County = 'Los Angeles'	california_schools
SELECT DISTINCT GSserved FROM schools WHERE City = 'Adelanto' ORDER BY COUNT(*) DESC LIMIT 1	california_schools
SELECT T1.County FROM schools AS T1 WHERE T1.Virtual = 'F' AND T1.County IN ('San Diego', 'Santa Barbara') GROUP BY T1.County ORDER BY COUNT(T1.CDSCode) DESC LIMIT 1	california_schools
SELECT T1.School, T1.Latitude FROM schools AS T1 ORDER BY T1.Latitude DESC LIMIT 1	california_schools
SELECT T.School, T.LowestGrade FROM ( SELECT S.School, MIN(S.Latitude) AS MinLat, MIN(FR.LowGrade) AS LowestGrade FROM schools S INNER JOIN frpm FR ON S.CDSCode = FR.CDSCode WHERE S.State = 'CA' GROUP BY S.School ) T ORDER BY T.MinLat ASC LIMIT 1	california_schools
SELECT T2.GSoffered FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.CDSCode = (SELECT CDSCode FROM schools ORDER BY ABS(Longitude) DESC LIMIT 1)	california_schools
SELECT COUNT(DISTINCT T2.City), T2.City FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.Magnet = 1 AND T2.GSoffered = 'K-8' AND T1.`NSLP Provision Status` = 'Multiple Provision Types' GROUP BY T2.City	california_schools
SELECT T1.AdmFName1, T2.District FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.AdmFName1 IS NOT NULL GROUP BY T1.AdmFName1, T2.District ORDER BY COUNT(T1.AdmFName1) DESC LIMIT 2	california_schools
SELECT T2.`Percent (%) Eligible Free (K-12)`, T1.`District Code` FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`AdmFName1` = 'Alusine' AND T2.`Free Meal Count (K-12)` IS NOT NULL AND T2.`Enrollment (K-12)` IS NOT NULL	california_schools
SELECT T2.AdmLName1, T1.District, T1.County, T1.School FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.CharterNumber = '40'	california_schools
SELECT AdmEmail1 FROM schools WHERE County = 'San Bernardino' AND City = 'San Bernardino City Unified' AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND (SOC = 62 OR DOC = 54)	california_schools
SELECT T2.Email FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumGE1500 > 0 ORDER BY T1.NumTstTakr DESC LIMIT 1	california_schools
SELECT COUNT(DISTINCT T2.account_id) FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.A3 LIKE '%East Bohemia%' AND T2.frequency = 'POPLATEK PO OBRATU'	financial
SELECT COUNT(DISTINCT T1.account_id) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 LIKE '%Prague%'	financial
SELECT AVG(T1.A12) AS avg_unemployment_1995, AVG(T1.A13) AS avg_unemployment_1996 FROM district AS T1 WHERE T1.A8 = 1995 OR T1.A8 = 1996	financial
SELECT COUNT(district_id) FROM district WHERE A11 > 6000 AND A11 < 10000	financial
SELECT COUNT(T1.client_id) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'M' AND T2.A3 LIKE '%North Bohemia%' AND T2.A11 > 8000	financial
SELECT T1.account_id FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id GROUP BY T1.account_id HAVING T1.gender = 'F' AND T1.birth_date IN (SELECT MIN(birth_date) FROM client WHERE gender = 'F') ORDER BY AVG(T1.A11) ASC LIMIT 1 , SELECT (SELECT MAX(A11) FROM client) - (SELECT MIN(A11) FROM client) AS gap	financial
SELECT T1.account_id FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id GROUP BY T1.account_id ORDER BY AVG(T1.birth_date) DESC LIMIT 1	financial
SELECT COUNT(T1.client_id) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id WHERE T2.type = 'OWNER' AND T1.district_id IN (SELECT district_id FROM account WHERE frequency = 'POPLATEK TYDNE')	financial
SELECT T1.client_id FROM disp AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.frequency = 'POPLATEK PO OBRATU' AND T1.type = 'DISPONENT'	financial
SELECT T1.account_id FROM account AS T1 JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE STRFTIME('%Y', T2.date) = '1997' ORDER BY T2.amount ASC LIMIT 1	financial
SELECT T1.account_id FROM account AS T1 JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.duration > 12 AND STRFTIME('%Y', T1.date) = '1993' ORDER BY T2.amount DESC LIMIT 1	financial
SELECT COUNT(T1.client_id) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' AND T1.birth_date < '1950-01-01' AND T2.A2 = 'Sokolov'	financial
SELECT account_id FROM trans WHERE date LIKE '1995%' ORDER BY date ASC LIMIT 1	financial
SELECT DISTINCT T1.account_id FROM account AS T1 JOIN disp AS T2 ON T1.account_id = T2.account_id WHERE T1.date < '1997-01-01' AND T1.amount > 3000	financial
SELECT T1.client_id FROM disp AS T1 INNER JOIN card AS T2 ON T1.disp_id = T2.disp_id WHERE T2.issued LIKE '1994-03-03%'	financial
SELECT T1.date FROM account AS T1 JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T2.amount = 840 AND T2.date = '1998-10-14'	financial
SELECT T1.district_id FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T2.account_id IN (SELECT account_id FROM loan WHERE date LIKE '1994-08-25%')	financial
SELECT MAX(T1.amount) FROM trans AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id WHERE T2.issued = '1996-10-21'	financial
SELECT T3.gender FROM district AS T1 INNER JOIN disp AS T2 ON T1.district_id = T2.district_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T1.A11 = ( SELECT MAX(A11) FROM district ) ORDER BY T3.birth_date ASC LIMIT 1	financial
SELECT T1.amount FROM trans AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN disp AS T3 ON T2.account_id = T3.account_id INNER JOIN client AS T4 ON T3.client_id = T4.client_id WHERE T3.type = 'OWNER' AND T4.gender = 'F' ORDER BY T1.date DESC LIMIT 1	financial
SELECT COUNT(T1.client_id) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id WHERE T1.gender = 'F' AND T1.district_id IN ( SELECT district_id FROM district WHERE A2 LIKE '%Jesenik%' )	financial
SELECT T1.disp_id FROM disp AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.date LIKE '1998-09-02%' AND T2.amount = 5100	financial
SELECT COUNT(account_id) FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id INNER JOIN district AS T4 ON T3.district_id = T4.district_id WHERE T4.A2 = 'Litomerice' AND STRFTIME('%Y', T1.date) = '1996'	financial
SELECT T2.A2 FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' AND T1.birth_date = '1976-01-29'	financial
SELECT T1.birth_date FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id INNER JOIN loan AS T4 ON T3.account_id = T4.account_id WHERE T4.amount = 98832 AND T4.date = '1996-01-03'	financial
SELECT T1.account_id FROM disp AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T3.A3 = 'Prague' ORDER BY T2.date ASC LIMIT 1	financial
SELECT CAST(SUM(CASE WHEN T1.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.client_id) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 LIKE '%South Bohemia%' ORDER BY T2.A4 DESC LIMIT 1	financial
SELECT ((T1.balance - T2.balance) / T2.balance) * 100 FROM trans AS T1 JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T1.date = '1998-12-27' AND T2.date = '1993-03-22' AND T1.k_symbol = 'SIPO' AND T2.k_symbol = 'SIPO'	financial
SELECT CAST(SUM(CASE WHEN T1.status = 'A' THEN T1.amount ELSE 0 END) AS REAL) * 100 / SUM(T1.amount) FROM loan AS T1	financial
SELECT CAST(SUM(CASE WHEN T1.status = 'C' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM loan AS T1 WHERE T1.amount < 100000	financial
SELECT T1.account_id, T4.A2, T4.A3 FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN trans AS T3 ON T1.account_id = T3.account_id INNER JOIN district AS T4 ON T1.district_id = T4.district_id WHERE STRFTIME('%Y', T3.date) = '1993' AND T1.frequency = 'POPLATEK PO OBRATU' GROUP BY T1.account_id, T4.A2, T4.A3	financial
SELECT T2.account_id, T2.frequency FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.A8 BETWEEN 1 AND 3 AND T2.date BETWEEN '1995-01-01' AND '2000-12-31' GROUP BY T2.account_id, T2.frequency	financial
SELECT T1.account_id, T1.date FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Prachatice'	financial
SELECT T3.A2, T3.A3 FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.loan_id = 4990	financial
SELECT T1.account_id, T3.A2, T3.A3 FROM loan AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T2.client_id = T3.district_id WHERE T1.amount > 300000	financial
SELECT T1.loan_id, T2.A3, AVG(T2.A11) FROM loan AS T1 INNER JOIN district AS T2 ON T1.account_id = T2.district_id WHERE T1.duration = 60 GROUP BY T1.loan_id, T2.A3	financial
SELECT T3.A12 AS unemployment_rate_1995, T3.A13 AS unemployment_rate_1996, T3.A2 AS district_name FROM loan AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN account AS T4 ON T2.account_id = T4.account_id INNER JOIN district AS T3 ON T4.district_id = T3.district_id WHERE T1.status = 'D' AND T1.date BETWEEN '1995-01-01' AND '1995-12-31' AND T3.A12 IS NOT NULL AND T3.A13 IS NOT NULL	financial
SELECT CAST(SUM(CASE WHEN T2.A2 = 'Decin' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM disp AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE STRFTIME('%Y', T1.date) = '1993'	financial
SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE'	financial
SELECT T1.A2 FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.gender = 'F' GROUP BY T1.A2 ORDER BY COUNT(T2.client_id) DESC LIMIT 9	financial
SELECT T1.A2, SUM(T3.amount) AS total_withdrawals FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id INNER JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T3.type = 'VYDAJ' AND T3.date LIKE '1996-01%' GROUP BY T1.A2 ORDER BY total_withdrawals DESC LIMIT 10	financial
SELECT COUNT(T2.client_id) FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T1.A3 LIKE '%South Bohemia%' AND T2.client_id NOT IN ( SELECT T4.client_id FROM card AS T3 INNER JOIN disp AS T4 ON T3.card_id = T4.card_id )	financial
SELECT T1.A3 FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id INNER JOIN loan AS T3 ON T2.account_id = T3.account_id WHERE T3.status IN ('C', 'D') GROUP BY T1.A3 ORDER BY COUNT(T3.loan_id) DESC LIMIT 1	financial
SELECT AVG(T2.amount) FROM client AS T1 INNER JOIN loan AS T2 ON T1.client_id = T2.client_id WHERE T1.gender = 'M'	financial
SELECT T1.A2 FROM district AS T1 ORDER BY T1.A13 DESC LIMIT 1	financial
SELECT COUNT(*) FROM disp AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.date LIKE '1996%' AND T1.type = 'OWNER' ORDER BY T2.district_id DESC LIMIT 1	financial
SELECT COUNT(T1.account_id) FROM trans AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.operation = 'VYBER KARTOU' AND T2.frequency = 'POPLATEK MESICNE' AND T1.balance < 0	financial
SELECT COUNT(*) FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.date BETWEEN '1995-01-01' AND '1997-12-31' AND T1.amount >= 250000 AND T2.frequency = 'POPLATEK MESICNE' AND T1.status = 'A'	financial
SELECT COUNT(*) FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.status IN ('C', 'D') AND T1.district_id = 1	financial
SELECT COUNT(T1.client_id) FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id WHERE T1.gender = 'M' AND T1.district_id = ( SELECT district_id FROM district ORDER BY A15 DESC LIMIT 1 OFFSET 1 )	financial
SELECT COUNT(*) FROM card AS T1 INNER JOIN disp AS T2 ON T1.card_id = T2.card_id WHERE T1.type = 'gold' AND T2.type = 'OWNER'	financial
SELECT COUNT(account_id) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Pisek'	financial
SELECT DISTINCT T3.A2 FROM trans AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.amount > 10000 AND strftime('%Y', T1.date) = '1997'	financial
SELECT DISTINCT T1.account_id FROM order AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.k_symbol = 'SIPO' AND T2.district_id IN (SELECT district_id FROM district WHERE A2 = 'Pisek')	financial
SELECT DISTINCT T2.account_id FROM card AS T1 INNER JOIN disp AS T2 ON T1.card_id = T2.card_id WHERE T1.type = 'gold'	financial
SELECT AVG(T1.amount) FROM trans AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.date LIKE '2021%' AND T1.operation = 'VYBER KARTOU'	financial
SELECT T2.account_id FROM trans AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id WHERE T1.operation = 'VYBER KARTOU' AND T1.amount < ( SELECT AVG(amount) FROM trans WHERE STRFTIME('%Y', date) = '1998' ) AND STRFTIME('%Y', T1.date) = '1998' GROUP BY T2.account_id HAVING COUNT(*) > 0	financial
SELECT T1.client_id FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN card AS T3 ON T2.disp_id = T3.disp_id INNER JOIN loan AS T4 ON T2.account_id = T4.account_id WHERE T1.gender = 'F' AND T3.type = 'credit'	financial
SELECT COUNT(T1.client_id) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' AND T2.A3 LIKE '%south Bohemia%'	financial
SELECT T1.account_id FROM disp AS T1 JOIN client AS T2 ON T1.client_id = T2.client_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T3.A2 = 'Tabor' AND T1.type = 'OWNER'	financial
SELECT DISTINCT T3.type, AVG(T1.A11) FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id INNER JOIN disp AS T3 ON T2.client_id = T3.client_id WHERE T3.type != 'OWNER' AND T1.A11 BETWEEN 8000 AND 9000 GROUP BY T3.type	financial
SELECT COUNT(T1.account_id) FROM account AS T1 JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T2.bank = 'AB' AND T1.district_id IN (SELECT district_id FROM district WHERE A3 LIKE '%North Bohemia%')	financial
SELECT T1.A2 FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id INNER JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T3.type = 'VYDAJ' GROUP BY T1.district_id HAVING COUNT(T3.trans_id) > 0	financial
SELECT AVG(T2.A15) FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.A15 > 4000 AND T2.date >= '1997-01-01' AND T2.date < '1998-01-01'	financial
SELECT COUNT(*) FROM card AS T1 JOIN disp AS T2 ON T1.card_id = T2.card_id WHERE T1.type = 'classic' AND T2.type = 'OWNER'	financial
SELECT COUNT(T1.client_id) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'M' AND T2.A2 = 'Hl.m. Praha'	financial
SELECT CAST(SUM(CASE WHEN type = 'gold' AND issued < '1998-01-01' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM card	financial
SELECT T1.client_id FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id WHERE T2.account_id IN (SELECT account_id FROM loan GROUP BY account_id ORDER BY SUM(amount) DESC LIMIT 1)	financial
SELECT T2.A15 FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.account_id = 532	financial
SELECT T2.district_id FROM order AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.order_id = 33333	financial
SELECT T1.trans_id FROM trans AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.client_id = 3356 AND T1.operation = 'VYBER'	financial
SELECT COUNT(DISTINCT T1.account_id) FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T1.frequency = 'POPLATEK TYDNE' AND T2.amount < 200000	financial
SELECT T2.type FROM client AS T1 INNER JOIN card AS T2 ON T1.client_id = T2.disp_id WHERE T1.client_id = 13539	financial
SELECT T1.A3 FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.client_id = 3541	financial
SELECT T1.district_id FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id INNER JOIN loan AS T3 ON T2.account_id = T3.account_id WHERE T3.status = 'A' GROUP BY T1.district_id ORDER BY COUNT(*) DESC LIMIT 1	financial
SELECT T1.client_id FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id WHERE T2.account_id IN (SELECT account_id FROM order WHERE order_id = 32423)	financial
SELECT T1.trans_id FROM trans AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.district_id = 5	financial
SELECT COUNT(*) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 = 'Jesenik'	financial
SELECT T1.client_id FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN card AS T3 ON T2.disp_id = T3.disp_id WHERE T3.type = 'junior' AND T3.issued >= '1997-01-01'	financial
SELECT CAST(SUM(CASE WHEN T1.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.client_id) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id WHERE T1.district_id IN ( SELECT district_id FROM account GROUP BY district_id HAVING AVG(A11) > 10000 )	financial
SELECT ((SUM(CASE WHEN STRFTIME('%Y', T2.date) = '1997' THEN T2.amount ELSE 0 END) - SUM(CASE WHEN STRFTIME('%Y', T2.date) = '1996' THEN T2.amount ELSE 0 END)) / SUM(CASE WHEN STRFTIME('%Y', T2.date) = '1996' THEN T2.amount ELSE 0 END)) * 100 AS growth_rate FROM client AS T1 INNER JOIN loan AS T2 ON T1.client_id = T2.account_id WHERE T1.gender = 'M'	financial
SELECT COUNT(*) FROM trans AS T WHERE T.operation = 'VYBER KARTOU' AND T.date > '1995-12-31'	financial
SELECT T1.A16 FROM district AS T1 WHERE T1.A3 IN ('East Bohemia', 'North Bohemia') AND STRFTIME('%Y', T1.date) = '1996' GROUP BY T1.A3 HAVING T1.A3 = 'East Bohemia' - T1.A3 = 'North Bohemia'	financial
SELECT T2.type FROM disp AS T1 INNER JOIN client AS T2 ON T1.client_id = T2.client_id WHERE T1.account_id BETWEEN 1 AND 10 GROUP BY T2.type	financial
SELECT T2.date FROM disp AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.client_id = 3 AND T2.account_id = 3 GROUP BY T2.date ORDER BY COUNT(*) DESC LIMIT 1, 1	financial
SELECT birth_date FROM client WHERE client_id = 130	financial
SELECT COUNT(DISTINCT T1.account_id) FROM disp AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.type = 'OWNER' AND T2.frequency = 'POPLATEK PO OBRATU'	financial
SELECT SUM(T2.amount) AS total_debt, AVG(CASE WHEN T2.status = 'A' THEN 1 ELSE 0 END) AS payment_status FROM client AS T1 INNER JOIN loan AS T2 ON T1.client_id = T2.client_id WHERE T1.client_id = 992	financial
SELECT SUM(T2.amount), T1.gender FROM client AS T1 INNER JOIN trans AS T2 ON T1.client_id = T2.account_id WHERE T2.trans_id = 851 AND T1.client_id = 4	financial
SELECT type FROM card WHERE disp_id = 9	financial
SELECT SUM(amount) FROM trans WHERE account_id IN (SELECT account_id FROM disp WHERE client_id = 617 AND type = 'OWNER') AND date LIKE '1998%'	financial
SELECT T1.client_id FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T1.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND T3.A2 LIKE '%East Bohemia%'	financial
SELECT T1.client_id FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id JOIN loan AS T3 ON T2.account_id = T3.account_id WHERE T1.gender = 'F' ORDER BY T3.amount DESC LIMIT 3	financial
SELECT COUNT(DISTINCT T1.client_id) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id INNER JOIN trans AS T4 ON T3.account_id = T4.account_id WHERE T1.gender = 'M' AND T1.birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND T4.amount > 4000 AND T4.k_symbol = 'SIPO'	financial
SELECT COUNT(*) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Beroun' AND T1.date > '1996-12-31'	financial
SELECT COUNT(T1.client_id) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN card AS T3 ON T2.disp_id = T3.disp_id WHERE T1.gender = 'F' AND T3.type = 'junior'	financial
SELECT CAST(SUM(CASE WHEN T3.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T1.A3 LIKE '%Prague%'	financial
SELECT CAST(SUM(CASE WHEN T2.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.client_id) FROM disp AS T1 INNER JOIN client AS T2 ON T1.client_id = T2.client_id WHERE T1.type = 'OWNER' AND T2.frequency = 'POPLATEK TYDNE'	financial
SELECT COUNT(DISTINCT T1.client_id) FROM disp AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.frequency = 'POPLATEK TYDNE' AND T1.type = 'OWNER'	financial
SELECT T1.account_id FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.duration > 24 AND T1.date < '1997-01-01' ORDER BY T2.amount ASC LIMIT 1	financial
SELECT T1.account_id FROM disp AS T1 INNER JOIN client AS T2 ON T1.client_id = T2.client_id WHERE T2.gender = 'F' GROUP BY T1.account_id ORDER BY AVG(T2.birth_date) ASC, AVG(T2.A11) ASC LIMIT 1	financial
SELECT COUNT(T1.client_id) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE STRFTIME('%Y', T1.birth_date) = '1920' AND T2.A3 LIKE '%east Bohemia%'	financial
SELECT COUNT(*) FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T1.frequency = 'POPLATEK TYDNE' AND T2.duration = 24	financial
SELECT AVG(T1.amount) FROM loan AS T1 JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T1.status = 'C' AND T2.type = 'POPLATEK PO OBRATU'	financial
SELECT DISTINCT T1.client_id, T1.district_id FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id WHERE T2.type = 'OWNER'	financial
SELECT T1.client_id ,  STRFTIME('%Y', 'now') - STRFTIME('%Y', T1.birth_date) AS age FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN card AS T3 ON T2.disp_id = T3.disp_id WHERE T3.type = 'gold' AND T2.type = 'OWNER'	financial
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY COUNT(bond_type) DESC LIMIT 1	toxicology
SELECT COUNT(T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-' AND T2.element = 'cl'	toxicology
SELECT AVG(CASE WHEN element = 'o' THEN 1 ELSE 0 END) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id IN (SELECT bond_id FROM bond WHERE bond_type = '-')	toxicology
SELECT CAST(COUNT(CASE WHEN T2.bond_type = '-' THEN 1 ELSE NULL END) AS REAL) / COUNT(T1.atom_id) FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'carcinogenic' AND T2.bond_type IS NOT NULL	toxicology
SELECT COUNT(*) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'na' AND T2.label = '-'	toxicology
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '#' AND T1.label = '+'	toxicology
SELECT CAST(COUNT(CASE WHEN T3.element = 'c' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T3.atom_id) FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN atom AS T3 ON T1.molecule_id = T3.molecule_id WHERE T2.bond_type = '='	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '#'	toxicology
SELECT COUNT(*) FROM atom WHERE element != 'br'	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR099' AND label = '+'	toxicology
SELECT molecule_id FROM atom WHERE element = 'c' GROUP BY molecule_id	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR004_8_9'	toxicology
SELECT DISTINCT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '='	toxicology
SELECT T2.label FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'h' GROUP BY T2.label ORDER BY COUNT(T2.label) DESC LIMIT 1	toxicology
SELECT T2.bond_type FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'cl'	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-' GROUP BY T1.element	toxicology
SELECT T1.atom_id FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN connected AS T3 ON T1.atom_id = T3.atom_id WHERE T2.label = '-' AND T3.bond_id IN (SELECT bond_id FROM bond WHERE bond_type != '=')	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '-' GROUP BY T1.element ORDER BY COUNT(T1.element) ASC LIMIT 1	toxicology
SELECT T2.bond_type FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE (T1.atom_id = 'TR004_8' AND T1.atom_id2 = 'TR004_20') OR (T1.atom_id = 'TR004_20' AND T1.atom_id2 = 'TR004_8')	toxicology
SELECT label FROM molecule WHERE molecule_id NOT IN (SELECT molecule_id FROM atom WHERE element = 'sn') ORDER BY label ASC LIMIT 1	toxicology
SELECT COUNT(DISTINCT T1.atom_id) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE (T1.element = 'i' OR T1.element = 's') AND T3.bond_type = '-'	toxicology
SELECT T1.atom_id FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '#'	toxicology
SELECT atom_id FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = 'TR181')	toxicology
SELECT CAST(SUM(CASE WHEN T1.element != 'f' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(DISTINCT T1.atom_id) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'	toxicology
SELECT CAST(SUM(CASE WHEN T1.bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.bond_id) FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.molecule_id = 'TR000' GROUP BY T1.element ORDER BY T1.element ASC LIMIT 3	toxicology
SELECT T3.element FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id INNER JOIN atom AS T3 ON T1.atom_id2 = T3.atom_id WHERE T1.bond_id = 'TR001_2_6'	toxicology
SELECT SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN label = '-' THEN 1 ELSE 0 END) AS difference FROM molecule	toxicology
SELECT T1.atom_id FROM connected AS T1 WHERE T1.bond_id = 'TR000_2_5'	toxicology
SELECT T1.bond_id FROM connected AS T1 WHERE T1.atom_id = 'TR000_2' AND T1.atom_id2 = 'TR000_2'	toxicology
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = ' = ' GROUP BY T1.molecule_id ORDER BY T1.label ASC LIMIT 5	toxicology
SELECT CAST(SUM(CASE WHEN T2.bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_id) FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR008'	toxicology
SELECT CAST(SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(molecule_id) FROM molecule	toxicology
SELECT CAST(SUM(CASE WHEN T1.element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.molecule_id = 'TR206'	toxicology
SELECT DISTINCT T2.bond_type FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR000'	toxicology
SELECT T1.element, T3.label FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id WHERE T1.molecule_id = 'TR060'	toxicology
SELECT T2.bond_type, T1.label FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR010' GROUP BY T2.bond_type ORDER BY COUNT(T2.bond_type) DESC LIMIT 1, 1	toxicology
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-' GROUP BY T1.molecule_id HAVING COUNT(T2.bond_id) = 1 ORDER BY T1.molecule_id LIMIT 3	toxicology
SELECT T2.bond_type FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T1.molecule_id = 'TR006' ORDER BY T2.bond_type ASC LIMIT 2	toxicology
SELECT COUNT(*) FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE (T1.atom_id = 'TR009_12' OR T1.atom_id2 = 'TR009_12') AND T2.molecule_id = 'TR009'	toxicology
SELECT COUNT(T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.element = 'br'	toxicology
SELECT T1.bond_type, T2.atom_id, T3.atom_id FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id INNER JOIN connected AS T3 ON T2.atom_id = T3.atom_id WHERE T1.bond_id = 'TR001_6_9'	toxicology
SELECT T1.label ,  CASE WHEN T1.label = '+' THEN 'carcinogenic' ELSE 'not carcinogenic' END AS carcinogenicity FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.atom_id = 'TR001_10'	toxicology
SELECT COUNT(*) FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '#'	toxicology
SELECT COUNT(T2.bond_id) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.atom_id LIKE 'TR%_19'	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = 'TR004'	toxicology
SELECT COUNT(*) FROM molecule WHERE label != '-'	toxicology
SELECT DISTINCT T2.label FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE SUBSTR(T1.atom_id, 7, 2) BETWEEN '21' AND '25' AND T2.label = '+'	toxicology
SELECT T2.bond_id FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'p' OR T1.element = 'n'	toxicology
SELECT T2.label FROM connected AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN bond AS T3 ON T1.bond_id = T3.bond_id WHERE T3.bond_type = ' = ' GROUP BY T2.label ORDER BY COUNT(T3.bond_type) DESC LIMIT 1	toxicology
SELECT AVG(COUNT(T2.bond_id)) FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'i'	toxicology
SELECT T1.bond_type, T1.bond_id FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE SUBSTR(T2.atom_id2, 7, 2) + 0 = 45	toxicology
SELECT element FROM atom WHERE atom_id NOT IN (SELECT atom_id FROM connected)	toxicology
SELECT T1.atom_id FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.molecule_id = 'TR041' AND T3.bond_type = '#'	toxicology
SELECT DISTINCT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR144_8_19'	toxicology
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.bond_type = ' = ' GROUP BY T1.molecule_id ORDER BY COUNT(T2.bond_type) DESC LIMIT 1	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' GROUP BY T1.element ORDER BY COUNT(T1.element) ASC LIMIT 1	toxicology
SELECT DISTINCT T1.atom_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 'pb'	toxicology
SELECT DISTINCT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '#'	toxicology
SELECT CAST(COUNT(T2.bond_id) AS REAL) * 100 / ( SELECT COUNT(*) FROM atom ) FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id GROUP BY T1.atom_id, T1.atom_id2 ORDER BY COUNT(T2.bond_id) DESC LIMIT 1	toxicology
SELECT CAST(SUM(CASE WHEN T2.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.bond_id) FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '-'	toxicology
SELECT COUNT(*) FROM atom WHERE element IN ('c', 'h')	toxicology
SELECT T2.atom_id2 FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 's'	toxicology
SELECT T2.bond_type FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'sn'	toxicology
SELECT COUNT(DISTINCT T1.element) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-'	toxicology
SELECT COUNT(T1.atom_id) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN connected AS T3 ON T1.atom_id = T3.atom_id INNER JOIN bond AS T4 ON T3.bond_id = T4.bond_id WHERE (T1.element = 'phosphorus' OR T1.element = 'bromine') AND T4.bond_type = '#'	toxicology
SELECT T2.bond_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'	toxicology
SELECT DISTINCT T2.molecule_id FROM connected AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_id IN (SELECT bond_id FROM bond WHERE bond_type = '-') AND T2.label = '+'	toxicology
SELECT CAST(SUM(CASE WHEN T1.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-'	toxicology
SELECT label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002')	toxicology
SELECT molecule_id FROM molecule WHERE label = '-'	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR030' AND label = '+'	toxicology
SELECT bond_type FROM bond WHERE molecule_id BETWEEN 'TR000' AND 'TR050'	toxicology
SELECT T3.element FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id INNER JOIN atom AS T3 ON T1.atom_id2 = T3.atom_id WHERE T1.bond_id = 'TR001_10_11'	toxicology
SELECT COUNT(*) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 'i'	toxicology
SELECT T1.label FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'ca' GROUP BY T1.label ORDER BY COUNT(T1.label) DESC LIMIT 1	toxicology
SELECT CASE WHEN (T3.element = 'cl' AND T4.element = 'c') OR (T3.element = 'c' AND T4.element = 'cl') THEN 'Yes' ELSE 'No' END AS result FROM connected AS T1 INNER JOIN atom AS T3 ON T1.atom_id = T3.atom_id INNER JOIN connected AS T2 ON T1.atom_id2 = T2.atom_id INNER JOIN atom AS T4 ON T2.atom_id = T4.atom_id WHERE T1.bond_id = 'TR001_1_8'	toxicology
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN connected AS T3 ON T2.atom_id = T3.atom_id INNER JOIN bond AS T4 ON T3.bond_id = T4.bond_id WHERE T2.element = 'c' AND T4.bond_type = '#' AND T1.label = '-' LIMIT 2	toxicology
SELECT CAST(SUM(CASE WHEN T1.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'	toxicology
SELECT DISTINCT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.molecule_id = 'TR001' AND T1.element IN ('cl', 'br')	toxicology
SELECT molecule_id FROM bond WHERE bond_type = ' = '	toxicology
SELECT T1.atom_id, T1.atom_id2 FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '#' LIMIT 1	toxicology
SELECT DISTINCT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR000_1_2'	toxicology
SELECT COUNT(T2.molecule_id) FROM connected AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '-' AND T1.bond_id IN (SELECT bond_id FROM bond WHERE bond_type = '-')	toxicology
SELECT T2.label FROM connected AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_id = 'TR001_10_11'	toxicology
SELECT T1.bond_id ,  CASE WHEN T3.label = '+' THEN 'carcinogenic' ELSE 'non-carcinogenic' END AS carcinogenicity FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id INNER JOIN molecule AS T3 ON T2.molecule_id = T3.molecule_id WHERE T2.bond_type = '#'	toxicology
SELECT T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id LIKE '%4' AND T2.label = '+' GROUP BY T1.element	toxicology
SELECT CAST(SUM(CASE WHEN T1.element = 'h' THEN 1 ELSE 0 END) AS REAL) / COUNT(T1.element), T2.label FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR006'	toxicology
SELECT T1.label FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'ca' LIMIT 1	toxicology
SELECT DISTINCT T2.bond_type FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'c'	toxicology
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_10_11'	toxicology
SELECT CAST(SUM(CASE WHEN T2.bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_id) FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id	toxicology
SELECT CAST(COUNT(CASE WHEN T2.bond_type = '=' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T2.bond_id) FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR047'	toxicology
SELECT CASE WHEN T2.label = '+' THEN 'Carcinogenic' ELSE 'Non-Carcinogenic' END AS Carcinogenicity FROM connected AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR001_1'	toxicology
SELECT T1.label FROM molecule AS T1 WHERE T1.molecule_id = 'TR151'	toxicology
SELECT T.element FROM atom AS T WHERE T.molecule_id = 'TR151' AND T.element IN ('cl', 'br') LIMIT 1	toxicology
SELECT COUNT(molecule_id) FROM molecule WHERE label = '+'	toxicology
SELECT T1.atom_id FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'c' AND CAST(SUBSTR(T2.molecule_id, 3, 3) AS INT) BETWEEN 10 AND 50	toxicology
SELECT COUNT(*) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'	toxicology
SELECT DISTINCT T2.bond_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.bond_type = ' ='	toxicology
SELECT COUNT(T1.atom_id) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'h' AND T2.label = '+'	toxicology
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_id = 'TR000_1_2' AND T2.bond_type = '-' AND T1.label = '+'	toxicology
SELECT T1.atom_id FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'c' AND T2.label != '-'	toxicology
SELECT CAST(SUM(CASE WHEN T1.label = '+' AND T2.element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element IS NOT NULL AND T1.label IS NOT NULL	toxicology
SELECT T1.label FROM molecule AS T1 WHERE T1.molecule_id = 'TR124'	toxicology
SELECT T1.atom_id FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = 'TR186'	toxicology
SELECT T2.bond_type FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T1.atom_id = 'TR007' AND T1.atom_id2 = 'TR007_4_19'	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_2_4'	toxicology
SELECT COUNT(*) AS double_bonds, CASE WHEN T2.label = '+' THEN 'Carcinogenic' ELSE 'Non-Carcinogenic' END AS carcinogenic FROM connected AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN bond AS T3 ON T1.bond_id = T3.bond_id WHERE T3.bond_type = '=' AND T2.molecule_id = 'TR006'	toxicology
SELECT DISTINCT T2.label ,  T1.element FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' AND T1.element IN ('cl', 'c', 'h')	toxicology
SELECT T1.bond_id ,  T2.element ,  T3.element FROM bond AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN atom AS T3 ON T3.atom_id IN (T2.atom_id2) WHERE T1.bond_type = '-'	toxicology
SELECT T1.label FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '#' GROUP BY T1.label HAVING COUNT(*) > 0	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR000_2_3'	toxicology
SELECT COUNT(*) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 'cl'	toxicology
SELECT T1.atom_id ,  COUNT(DISTINCT T2.bond_type) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.molecule_id = 'TR346'	toxicology
SELECT COUNT(T1.molecule_id), SUM(CASE WHEN T1.label = '+' THEN 1 ELSE 0 END) FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = ' = '	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id NOT IN ( SELECT molecule_id FROM atom WHERE element = 's' ) AND molecule_id NOT IN ( SELECT molecule_id FROM bond WHERE bond_type = '=' )	toxicology
SELECT T2.label FROM connected AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_id = 'TR001_2_4'	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR001'	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '-'	toxicology
SELECT T2.label FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'cl' AND T2.label = '+'	toxicology
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'c' AND T1.label != '-'	toxicology
SELECT CAST(SUM(CASE WHEN T1.label = '+' AND T2.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id	toxicology
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_id = 'TR001_1_7'	toxicology
SELECT COUNT(DISTINCT T1.element) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_3_4'	toxicology
SELECT T2.bond_type FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T1.atom_id = 'TR000_1' AND T1.atom_id2 = 'TR000_2'	toxicology
SELECT T1.label FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.atom_id IN ('TR000_2', 'TR000_4') GROUP BY T1.label	toxicology
SELECT element FROM atom WHERE atom_id = 'TR000_1'	toxicology
SELECT CASE WHEN T1.label = '+' THEN 'carcinogenic' ELSE 'non-carcinogenic' END AS carcinogenicity FROM molecule AS T1 WHERE T1.molecule_id = 'TR000'	toxicology
SELECT CAST(SUM(CASE WHEN T2.bond_type = '-' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_id) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id	toxicology
SELECT COUNT(T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'n' AND T1.label = '+'	toxicology
SELECT T1.label FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id JOIN connected AS T3 ON T2.atom_id = T3.atom_id JOIN bond AS T4 ON T3.bond_id = T4.bond_id WHERE T2.element = 's' AND T4.bond_type = '= ' LIMIT 1	toxicology
SELECT molecule_id FROM atom GROUP BY molecule_id HAVING COUNT(*) > 5 AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-')	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '=' AND T1.molecule_id = 'TR024'	toxicology
SELECT T1.label FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id GROUP BY T1.label ORDER BY COUNT(T2.atom_id) DESC LIMIT 1	toxicology
SELECT CAST(SUM(CASE WHEN T2.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM connected AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN atom AS T3 ON T1.atom_id = T3.atom_id INNER JOIN bond AS T4 ON T1.bond_id = T4.bond_id WHERE T3.element = 'h' AND T4.bond_type = '#'	toxicology
SELECT COUNT(molecule_id) FROM molecule WHERE label = '+'	toxicology
SELECT COUNT(*) FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id BETWEEN 'TR004' AND 'TR010' AND T2.bond_type = '-'	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR008' AND element = 'c'	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR004_7' AND T2.label != '-' LIMIT 1	toxicology
SELECT COUNT(*) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN bond AS T3 ON T1.molecule_id = T3.molecule_id WHERE T2.element = 'o' AND T3.bond_type = ' = '	toxicology
SELECT COUNT(T1.molecule_id) FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '#' AND T1.label = '-'	toxicology
SELECT T1.element, T2.bond_type FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR002'	toxicology
SELECT T1.atom_id FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.molecule_id = 'TR012' AND T1.element = 'c' AND T3.bond_type = ' = '	toxicology
SELECT T1.atom_id FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'o' AND T2.label = '+'	toxicology
SELECT T1.id FROM cards AS T1 WHERE T1.cardKingdomFoilId IS NOT NULL AND T1.cardKingdomId IS NOT NULL ORDER BY T1.id LIMIT 1	card_games
SELECT id FROM cards WHERE borderColor = 'black' AND cardKingdomFoilId IS NULL AND cardKingdomId IS NOT NULL	card_games
SELECT T1.name FROM cards AS T1 WHERE T1.faceConvertedManaCost = (SELECT MAX(T1.faceConvertedManaCost) FROM cards WHERE T1.faceConvertedManaCost IS NOT NULL);	card_games
SELECT T1.id FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.frameVersion = 2015 AND T1.edhrecRank < 100	card_games
SELECT T1.id FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'mythic' AND T2.status = 'Banned' AND T2.format = 'gladiator'	card_games
SELECT T1.id FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.types LIKE '%Artifact%' AND T1.side IS NULL AND T2.format = 'vintage'	card_games
SELECT T1.id, T1.artist FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE (T1.power = '*' OR T1.power IS NULL) AND T2.format = 'commander' AND T2.status = 'Legal'	card_games
SELECT T1.id FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Stephen Daniel' AND T1.hasContentWarning = 1	card_games
SELECT T1.text FROM rulings AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Sublime Epiphany' AND T2.number = '74s'	card_games
SELECT T1.name, T1.artist, T1.isPromo FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid GROUP BY T1.id ORDER BY COUNT(T2.uuid) DESC LIMIT 1	card_games
SELECT T2.language FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Annul' AND T1.number = '29' GROUP BY T2.language	card_games
SELECT T1.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Japanese'	card_games
SELECT CAST(SUM(CASE WHEN T2.language = 'Chinese Simplified' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid	card_games
SELECT T2.translation, T1.totalSetSize FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Italian'	card_games
SELECT COUNT(DISTINCT type) FROM cards WHERE artist = 'Aaron Boyd'	card_games
SELECT T1.keywords FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Angel of Mercy'	card_games
SELECT COUNT(*) FROM cards WHERE power = '*';	card_games
SELECT T1.promoTypes FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Duress' AND T2.format = 'penny'	card_games
SELECT borderColor FROM cards WHERE name = 'Ancestor''s Chosen';	card_games
SELECT T1.originalType FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Ancestor''s Chosen'	card_games
SELECT DISTINCT T3.language FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code INNER JOIN set_translations AS T3 ON T2.code = T3.setCode WHERE T1.name = 'Angel of Mercy'	card_games
SELECT COUNT(*) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.status = 'Restricted' AND T1.isTextless = 0	card_games
SELECT T2.text FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Condemn'	card_games
SELECT COUNT(*) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.status = 'restricted' AND T1.isStarter = 1	card_games
SELECT T1.status FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Cloudchaser Eagle'	card_games
SELECT T1.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Benalish Knight'	card_games
SELECT T1.text FROM rulings AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Benalish Knight'	card_games
SELECT T1.artist FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Phyrexian'	card_games
SELECT CAST(SUM(CASE WHEN borderColor = 'borderless' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(id) FROM cards	card_games
SELECT COUNT(*) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'German' AND T1.isReprint = 1	card_games
SELECT COUNT(T1.id) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.borderColor = 'borderless' AND T2.language = 'Russian'	card_games
SELECT CAST(SUM(CASE WHEN T2.language = 'French' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.isStorySpotlight = 1	card_games
SELECT COUNT(*) FROM cards WHERE toughness = 99;	card_games
SELECT T1.name FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Aaron Boyd'	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND availability LIKE '%mtgo%'	card_games
SELECT id FROM cards WHERE convertedManaCost = 0;	card_games
SELECT DISTINCT layout FROM cards WHERE keywords LIKE '%Flying%'	card_games
SELECT COUNT(*) FROM cards WHERE originalType = 'Summon - Angel' AND subtypes != 'Angel';	card_games
SELECT T1.id FROM cards AS T1 WHERE T1.cardKingdomFoilId IS NOT NULL AND T1.cardKingdomId IS NOT NULL;	card_games
SELECT id FROM cards WHERE duelDeck = 'a';	card_games
SELECT T1.edhrecRank FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.frameVersion = '2015'	card_games
SELECT T1.artist FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Chinese Simplified'	card_games
SELECT T1.id FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.availability LIKE '%paper%' AND T2.language = 'Japanese'	card_games
SELECT COUNT(*) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.status = 'Banned' AND T1.borderColor = 'white'	card_games
SELECT T1.uuid, T2.language FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid INNER JOIN legalities AS T3 ON T1.uuid = T3.uuid WHERE T3.format = 'legacy' AND T2.language != 'English'	card_games
SELECT T2.text FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Beacon of Immortality'	card_games
SELECT COUNT(T1.id), T1.name FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.frameVersion = 'future' AND T2.status = 'legal'	card_games
SELECT T1.id, T1.colors FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.code = 'OGW'	card_games
SELECT T2.name, T3.language FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid INNER JOIN set_translations AS T3 ON T1.setCode = T3.setCode WHERE T1.convertedManaCost = 5 AND T1.setCode = '10E'	card_games
SELECT T1.name, T3.date FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid INNER JOIN rulings AS T3 ON T1.uuid = T3.uuid WHERE T1.originalType = 'Creature - Elf' AND T3.date IS NOT NULL	card_games
SELECT T1.colors, T2.format FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.id BETWEEN 1 AND 20	card_games
SELECT T1.id FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.originalType = 'Artifact' AND T1.colors = 'B' AND T2.language IS NOT NULL	card_games
SELECT T1.name FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'uncommon' GROUP BY T1.id ORDER BY MIN(T2.date) ASC LIMIT 3	card_games
SELECT COUNT(*) FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'John Avon' AND T1.cardKingdomFoilId IS NOT NULL AND T1.cardKingdomId IS NULL	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE artist LIKE '%UDON%' AND availability = 'mtgo' AND hand = -1	card_games
SELECT COUNT(*) FROM cards WHERE frameVersion = '1993' AND availability LIKE '%paper%' AND hasContentWarning = 1	card_games
SELECT T1.manaCost FROM cards AS T1 WHERE T1.layout = 'normal' AND T1.frameVersion = '2003' AND T1.borderColor = 'black' AND T1.availability LIKE '%paper%' AND T1.availability LIKE '%mtgo%'	card_games
SELECT SUM(CAST(REPLACE(SUBSTR(manaCost, 2), '}', '') AS REAL)) FROM cards WHERE artist = 'Rob Alexander'	card_games
SELECT DISTINCT T1.subtypes, T1.supertypes FROM cards AS T1 WHERE T1.availability = 'arena'	card_games
SELECT DISTINCT T1.setCode FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Spanish'	card_games
SELECT CAST(SUM(CASE WHEN isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(id) FROM cards WHERE frameEffects = 'legendary'	card_games
SELECT CAST(SUM(CASE WHEN isStorylight = 1 AND isTextless = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) , id FROM cards WHERE isStorylight = 1 OR isTextless = 0 GROUP BY id HAVING isStorylight = 1 AND isTextless = 0	card_games
SELECT CAST(SUM(CASE WHEN T2.language = 'Spanish' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id), T1.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid GROUP BY T1.name	card_games
SELECT DISTINCT T3.language FROM sets AS T1 INNER JOIN set_translations AS T3 ON T1.code = T3.setCode WHERE T1.baseSetSize = 309	card_games
SELECT COUNT(T1.id) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Portuguese (Brazil)' AND T1.block = 'Commander'	card_games
SELECT T1.id FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.type LIKE '%Creature%' AND T2.status = 'Legal'	card_games
SELECT DISTINCT T1.subtypes, T1.supertypes FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'German' AND T1.subtypes IS NOT NULL AND T1.supertypes IS NOT NULL	card_games
SELECT COUNT(*) FROM cards WHERE power IS NULL OR power = '*' AND text LIKE '%triggered ability%'	card_games
SELECT COUNT(*) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.format = 'premodern' AND T1.side IS NULL AND T1.text LIKE '%This is a triggered mana ability.'%	card_games
SELECT T1.id FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Erica Yang' AND T2.format = 'pauper' AND T1.availability LIKE '%paper%' LIMIT 1	card_games
SELECT T1.artist FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.text LIKE '%Das perfekte Gegenmittel zu einer dichten Formation%'	card_games
SELECT T1.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Matthew D. Wilson' AND T1.borderColor = 'black' AND T2.language = 'French' AND T1.type = 'Creature' AND T1.layout = 'normal' LIMIT 1	card_games
SELECT COUNT(T1.id) FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'rare' AND T2.date = '2007-02-01'	card_games
SELECT T2.language FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.block = 'Ravnica' AND T1.baseSetSize = 180 LIMIT 1	card_games
SELECT CAST(SUM(CASE WHEN T1.hasContentWarning = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.format = 'commander' AND T2.status = 'legal'	card_games
SELECT CAST(SUM(CASE WHEN T1.power IS NULL OR T1.power = '*' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'French'	card_games
SELECT CAST(SUM(CASE WHEN T1.language = 'Japanese' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.type = 'expansion'	card_games
SELECT T1.availability FROM cards AS T1 WHERE T1.artist = 'Daren Bader' ORDER BY T1.id DESC LIMIT 1	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'borderless' AND edhrecRank > 12000;	card_games
SELECT COUNT(*) FROM cards WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1	card_games
SELECT T1.id FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.power IS NULL OR T1.power = '*' AND T2.promoTypes = 'arenaleague' ORDER BY T1.name ASC LIMIT 3	card_games
SELECT T1.language FROM foreign_data AS T1 WHERE T1.multiverseid = 149934;	card_games
SELECT T1.id FROM cards AS T1 WHERE T1.cardKingdomFoilId IS NOT NULL AND T1.cardKingdomId IS NOT NULL ORDER BY T1.cardKingdomFoilId ASC LIMIT 3	card_games
SELECT CAST(SUM(CASE WHEN isTextless = 1 AND layout = 'normal' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards	card_games
SELECT id FROM cards WHERE side IS NULL AND subtypes = 'Angel,Wizard'	card_games
SELECT T1.id, T1.name FROM sets AS T1 WHERE T1.mtgoCode IS NULL OR T1.mtgoCode = '' ORDER BY T1.name ASC LIMIT 3	card_games
SELECT DISTINCT T2.language FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.mcmName = 'Archenemy' AND T2.setCode = 'ARC'	card_games
SELECT T1.name ,  T2.translation FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.id = 5	card_games
SELECT T2.language, T1.type FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.id = 206	card_games
SELECT T1.id FROM sets AS T1 INNER JOIN foreign_data AS T2 ON T1.code = T2.set_code WHERE T2.language = 'Italian' AND T1.block = 'Shadowmoor' GROUP BY T1.id ORDER BY T1.name ASC LIMIT 2	card_games
SELECT T1.id FROM sets AS T1 INNER JOIN foreign_data AS T2 ON T1.code = T2.set_code WHERE T1.isForeignOnly = 1 AND T2.language = 'Japanese' AND T1.isFoilOnly = 1 LIMIT 1	card_games
SELECT T1.id FROM sets AS T1 INNER JOIN foreign_data AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Russian' ORDER BY T1.baseSetSize DESC LIMIT 1	card_games
SELECT CAST(SUM(CASE WHEN T1.language = 'Chinese Simplified' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.isOnlineOnly = 1	card_games
SELECT COUNT(*) FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Japanese' AND T1.mtgoCode IS NULL	card_games
SELECT id FROM cards WHERE borderColor = 'black'	card_games
SELECT id FROM cards WHERE frameEffects = 'extendedart';	card_games
SELECT T1.id FROM cards AS T1 WHERE T1.borderColor = 'black' AND T1.isFullArt = 1 LIMIT 1	card_games
SELECT T2.language FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.id = 174;	card_games
SELECT T1.name FROM sets AS T1 WHERE T1.code = 'ALL'	card_games
SELECT T2.language FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'A Pedra Fellwar' ORDER BY T2.id DESC LIMIT 1	card_games
SELECT code FROM sets WHERE releaseDate = '2007-07-13' LIMIT 1	card_games
SELECT T2.baseSetSize, T2.setCode FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.block IN ('Masques', 'Mirage') AND T2.language = 'English' GROUP BY T2.baseSetSize, T2.setCode	card_games
SELECT setCode FROM sets WHERE type = 'expansion'	card_games
SELECT T1.name, T1.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'Boros'	card_games
SELECT T1.language, T1.flavorText, T2.type FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.watermark = 'colorpie'	card_games
SELECT CAST(SUM(CASE WHEN T1.convertedManaCost = 10 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Abyssal Horror'	card_games
SELECT T1.code FROM sets AS T1 INNER JOIN legalities AS T2 ON T1.code = T2.uuid WHERE T2.format = 'commander' GROUP BY T1.code	card_games
SELECT T2.name ,  T2.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'Abzan'	card_games
SELECT T1.language, T2.type FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.watermark = 'Azorius' LIMIT 1	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE availability LIKE '%paper%' AND hand = '3'	card_games
SELECT T1.name FROM cards AS T1 WHERE T1.isTextless = 0	card_games
SELECT T1.convertedManaCost FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Ancestor''s Chosen'	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND (power IS NULL OR power = '*')	card_games
SELECT T1.name FROM cards AS T1 WHERE T1.isPromo = 1 AND T1.side IS NOT NULL	card_games
SELECT T1.subtypes, T1.supertypes FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Molimo, Maro-Sorcerer'	card_games
SELECT DISTINCT T1.purchaseUrls FROM cards AS T1 WHERE T1.promoTypes LIKE '%bundle%'	card_games
SELECT COUNT(DISTINCT artist) FROM cards WHERE borderColor = 'black' AND availability LIKE '%arena,mtgo%'	card_games
SELECT id FROM cards WHERE name IN ('Serra Angel', 'Shrine Keeper') ORDER BY convertedManaCost DESC LIMIT 1	card_games
SELECT T1.artist FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.flavorName = 'Battra, Dark Destroyer'	card_games
SELECT T1.name FROM cards AS T1 WHERE T1.frameVersion = '2003' ORDER BY T1.convertedManaCost DESC LIMIT 3	card_games
SELECT T3.translation FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid INNER JOIN set_translations AS T3 ON T3.setCode = T1.setCode WHERE T2.name = 'Ancestor''s Chosen' AND T2.language = 'Italian'	card_games
SELECT COUNT(*) FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T1.name = 'Angel of Mercy'	card_games
SELECT T1.name FROM foreign_data AS T1 INNER JOIN sets AS T2 ON T1.set_code = T2.code INNER JOIN set_translations AS T3 ON T2.code = T3.set_code WHERE T3.translation = 'Hauptset Zehnte Edition'	card_games
SELECT T1.id FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Ancestor''s Chosen' AND T1.language = 'Korean'	card_games
SELECT COUNT(*) FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T2.translation = 'Hauptset Zehnte Edition' AND T1.artist = 'Adam Rex'	card_games
SELECT T1.baseSetSize FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Hauptset Zehnte Edition'	card_games
SELECT T2.translation FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Eighth Edition' AND T2.language = 'Chinese Simplified'	card_games
SELECT T1.id FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Angel of Mercy' AND T2.mtgoCode IS NOT NULL	card_games
SELECT T1.releaseDate FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T2.name = 'Ancestor''s Chosen'	card_games
SELECT T1.type FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Hauptset Zehnte Edition'	card_games
SELECT COUNT(T1.id) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.block = 'Ice Age' AND T2.language = 'Italian' AND T2.translation IS NOT NULL	card_games
SELECT T2.isForeignOnly FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Adarkar Valkyrie' AND T2.isForeignOnly = 1 LIMIT 1	card_games
SELECT COUNT(T2.id) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Italian' AND T1.baseSetSize < 100	card_games
SELECT COUNT(*) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' AND T1.borderColor = 'black'	card_games
SELECT T1.name FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' ORDER BY T1.convertedManaCost DESC LIMIT 1	card_games
SELECT T1.artist FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' AND T1.artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy')	card_games
SELECT T1.id FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' AND T1.number = 4	card_games
SELECT COUNT(*) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid INNER JOIN sets AS T3 ON T1.setCode = T3.code WHERE T3.name = 'Coldsnap' AND T1.convertedManaCost > 5 AND (T1.power = '*' OR T1.power IS NULL)	card_games
SELECT T1.flavorText FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Ancestor''s Chosen' AND T1.language = 'Italian'	card_games
SELECT DISTINCT T2.language FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Ancestor''s Chosen' AND T2.flavorText IS NOT NULL	card_games
SELECT T2.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Ancestor''s Chosen' AND T2.language = 'German'	card_games
SELECT T1.text FROM rulings AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid INNER JOIN sets AS T3 ON T2.setCode = T3.code WHERE T3.name = 'Coldsnap' AND T1.language = 'Italian'	card_games
SELECT T1.name FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid INNER JOIN sets AS T3 ON T2.set_code = T3.code WHERE T3.name = 'Coldsnap' AND T1.language = 'Italian' ORDER BY T2.converted_mana_cost DESC LIMIT 1	card_games
SELECT T2.date FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Reminisce' ORDER BY T2.date ASC LIMIT 1	card_games
SELECT CAST(SUM(CASE WHEN T1.convertedManaCost = 7 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap'	card_games
SELECT CAST(SUM(CASE WHEN T1.cardKingdomFoilId IS NOT NULL AND T1.cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap'	card_games
SELECT code FROM sets WHERE releaseDate = '2017-07-14' LIMIT 1	card_games
SELECT keyruneCode FROM sets WHERE code = 'PKHC';	card_games
SELECT mcmId FROM sets WHERE code = 'SS2';	card_games
SELECT T1.mcmName FROM sets AS T1 WHERE T1.releaseDate = '2017-06-09'	card_games
SELECT T1.type FROM sets AS T1 WHERE T1.name LIKE '%From the Vault: Lore%'	card_games
SELECT T1.parentCode FROM sets AS T1 WHERE T1.name = 'Commander 2014 Oversized'	card_games
SELECT T1.id, T1.text FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Jim Pavelec' AND T1.hasContentWarning = 1	card_games
SELECT T1.releaseDate FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T2.name = 'Evacuation'	card_games
SELECT T1.baseSetSize FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Rinascita di Alara'	card_games
SELECT T1.type FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Huitième édition'	card_games
SELECT T1.name FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Tendo Ice Bridge' AND T2.language = 'French'	card_games
SELECT COUNT(T2.translation) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Tenth Edition' AND T2.translation IS NOT NULL	card_games
SELECT T1.translation FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.language = 'Japanese' AND T2.name LIKE '%Fellwar Stone%'	card_games
SELECT T1.id FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name LIKE '%Journey into Nyx Hero%s Path%' ORDER BY T1.convertedManaCost DESC LIMIT 1	card_games
SELECT T2.releaseDate FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.translation = 'Ola de frío'	card_games
SELECT T2.type FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Samite Pilgrim'	card_games
SELECT COUNT(*) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'World Championship Decks 2004' AND T1.convertedManaCost = 3	card_games
SELECT T2.translation FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Mirrodin' AND T2.language = 'Chinese Simplified'	card_games
SELECT CAST(SUM(CASE WHEN T1.isNonFoilOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Japanese'	card_games
SELECT CAST(SUM(CASE WHEN T1.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T2.language = 'Portuguese (Brazil)'	card_games
SELECT DISTINCT availability FROM cards WHERE artist != 'Aleksi Briclot' AND isTextless = 1	card_games
SELECT T1.id FROM sets AS T1 ORDER BY T1.baseSetSize DESC LIMIT 1	card_games
SELECT T1.artist FROM cards AS T1 WHERE T1.side IS NULL ORDER BY T1.convertedManaCost DESC LIMIT 1	card_games
SELECT T1.frameEffects FROM cards AS T1 WHERE T1.cardKingdomFoilId IS NOT NULL AND T1.cardKingdomId IS NOT NULL ORDER BY T1.frameEffects DESC LIMIT 1	card_games
SELECT COUNT(*) FROM cards WHERE power IS NULL OR power = '*' AND hasFoil = 0 AND duelDeck = 'a'	card_games
SELECT T1.id FROM sets AS T1 JOIN legalities AS T2 ON T1.code = T2.uuid WHERE T1.type = 'commander' AND T2.status = 'Legal' GROUP BY T1.id ORDER BY SUM(T1.totalSetSize) DESC LIMIT 1	card_games
SELECT T1.id FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.format = 'duel' AND T1.manaCost IS NOT NULL ORDER BY T1.manaCost DESC LIMIT 10	card_games
SELECT T1.id, T1.originalReleaseDate, GROUP_CONCAT(DISTINCT T2.format) AS formats FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'mythic' ORDER BY T1.originalReleaseDate ASC LIMIT 1	card_games
SELECT COUNT(T1.id) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Volkan Baǵa' AND T2.language = 'French'	card_games
SELECT COUNT(*) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'rare' AND T1.types = 'Enchantment' AND T1.name = 'Abundance' AND T2.format IN ('commander', 'duel', 'legacy', 'modern', 'penny') AND T2.status = 'Legal'	card_games
SELECT T1.format ,  T2.name FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.status = 'Banned' GROUP BY T1.format ORDER BY COUNT(T1.status) DESC LIMIT 1	card_games
SELECT T1.language FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Battlebond'	card_games
SELECT T1.artist, GROUP_CONCAT(DISTINCT T2.format) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid GROUP BY T1.artist ORDER BY COUNT(T1.id) ASC LIMIT 1	card_games
SELECT T1.status FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.frameVersion = '1997' AND T2.artist = 'D. Alexander Gregory' AND T2.hasContentWarning = 1 AND T1.format = 'legacy' LIMIT 1	card_games
SELECT T1.name, T3.format FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid INNER JOIN sets AS T3 ON T2.uuid = T3.code WHERE T1.edhrecRank = 1 AND T2.status = 'Banned'	card_games
SELECT CAST(SUM(CASE WHEN releaseDate BETWEEN '2012-01-01' AND '2015-12-31' THEN 1 ELSE 0 END) AS REAL) / COUNT(DISTINCT year(releaseDate)) AS avg_sets, T1.language FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.language = ( SELECT language FROM foreign_data GROUP BY language ORDER BY COUNT(*) DESC LIMIT 1 )	card_games
SELECT DISTINCT artist FROM cards WHERE BorderColor = 'black' AND availability LIKE '%arena%'	card_games
SELECT T1.uuid FROM legalities AS T1 JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.format = 'oldschool' AND T1.status IN ('banned', 'restricted')	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability = 'paper'	card_games
SELECT T1.text FROM rulings AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.artist = 'Kev Walker' ORDER BY T1.date DESC LIMIT 1	card_games
SELECT DISTINCT T1.name, T3.format FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode INNER JOIN legalities AS T3 ON T1.uuid = T3.uuid WHERE T2.translation = 'Hour of Devastation' AND T3.status = 'Legal'	card_games
SELECT T1.id FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language LIKE '%Korean%' AND NOT EXISTS (SELECT * FROM set_translations AS T3 WHERE T1.code = T3.setCode AND T3.language LIKE '%Japanese%')	card_games
SELECT DISTINCT T1.frameVersion, T2.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Allen Williams' AND T1.id IN ( SELECT uuid FROM legalities WHERE status = 'Banned' )	card_games
SELECT Id FROM users WHERE DisplayName = 'Harlan' ORDER BY Reputation DESC LIMIT 1 UNION ALL SELECT Id FROM users WHERE DisplayName = 'Jarrod Dixon' ORDER BY Reputation DESC LIMIT 1	codebase_community
SELECT DisplayName FROM users WHERE STRFTIME('%Y', CreationDate) = '2011'	codebase_community
SELECT COUNT(Id) FROM users WHERE LastAccessDate > '2014-09-01'	codebase_community
SELECT DisplayName FROM users WHERE Views = (SELECT MAX(Views) FROM users)	codebase_community
SELECT COUNT(Id) FROM users WHERE Upvotes > 100 AND Downvotes > 1	codebase_community
SELECT COUNT(Id) FROM users WHERE CreationDate > '2013-12-31' AND Views > 10	codebase_community
SELECT COUNT(*) FROM users AS T1 JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName = 'csgillespie'	codebase_community
SELECT Title FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie'	codebase_community
SELECT T1.DisplayName FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T2.Title = 'Eliciting priors from experts'	codebase_community
SELECT Title FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie' ORDER BY ViewCount DESC LIMIT 1	codebase_community
SELECT T1.DisplayName FROM users AS T1 JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T2.FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts)	codebase_community
SELECT SUM(T2.CommentCount) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName = 'csgillespie'	codebase_community
SELECT AnswerCount FROM posts WHERE OwnerDisplayName = 'csgillespie' ORDER BY AnswerCount DESC LIMIT 1	codebase_community
SELECT T1.DisplayName FROM users AS T1 JOIN posts AS T2 ON T1.Id = T2.LastEditorUserId WHERE T2.Title = 'Examples for teaching: Correlation does not mean causation' ORDER BY T2.LastEditDate DESC LIMIT 1	codebase_community
SELECT COUNT(*) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie' AND T1.ParentId IS NULL	codebase_community
SELECT DISTINCT u.DisplayName FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE p.ClosedDate IS NOT NULL	codebase_community
SELECT COUNT(T1.Id) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.Age > 65 AND T1.Score >= 20	codebase_community
SELECT T1.Location FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T2.Title = 'Eliciting priors from experts'	codebase_community
SELECT T2.Body FROM tags AS T1 INNER JOIN posts AS T2 ON T1.ExcerptPostId = T2.Id WHERE T1.TagName = 'bayesian'	codebase_community
SELECT T2.Body FROM tags AS T1 INNER JOIN posts AS T2 ON T1.ExcerptPostId = T2.Id WHERE T1.Count = ( SELECT MAX(Count) FROM tags )	codebase_community
SELECT COUNT(*) FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'csgillespie'	codebase_community
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'csgillespie'	codebase_community
SELECT COUNT(T1.Id) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'csgillespie' AND STRFTIME('%Y', T1.Date) = '2011'	codebase_community
SELECT T2.DisplayName FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id GROUP BY T1.UserId ORDER BY COUNT(T1.Id) DESC LIMIT 1	codebase_community
SELECT AVG(T1.Score) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie'	codebase_community
SELECT AVG(COUNT(T1.Id)) FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.Views > 200	codebase_community
SELECT CAST(SUM(CASE WHEN T2.Age > 65 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.Id) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Score > 5	codebase_community
SELECT COUNT(*) FROM votes WHERE UserId = 58 AND CreationDate LIKE '2010-07-19%'	codebase_community
SELECT CreationDate FROM votes GROUP BY CreationDate ORDER BY COUNT(Id) DESC LIMIT 1	codebase_community
SELECT COUNT(Id) FROM badges WHERE Name = 'Revival'	codebase_community
SELECT T1.Title FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T2.Score = (SELECT MAX(Score) FROM comments)	codebase_community
SELECT COUNT(*) FROM comments AS T1 JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T2.ViewCount = 1910	codebase_community
SELECT FavoriteCount FROM posts WHERE Id IN (SELECT PostId FROM comments WHERE UserId = 3025 AND CreationDate = '2014-04-23 20:29:39.0')	codebase_community
SELECT T2.Text FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.ParentId = 107829 AND T1.CommentCount = 1 LIMIT 1	codebase_community
SELECT CASE WHEN T1.ClosedDate IS NULL THEN 'not well-finished' ELSE 'well-finished' END AS PostStatus FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T2.UserId = 23853 AND T2.CreationDate = '2013-07-12 09:08:18.0'	codebase_community
SELECT T1.Reputation FROM users AS T1 JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T2.Id = 65041	codebase_community
SELECT COUNT(*) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName = 'Tiago Pasqualini'	codebase_community
SELECT T1.DisplayName FROM users AS T1 JOIN votes AS T2 ON T1.Id = T2.UserId WHERE T2.Id = 6347	codebase_community
SELECT COUNT(*) FROM posts AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.PostId WHERE T1.Title LIKE '%data visualization%'	codebase_community
SELECT T1.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'DatEpicCoderGuyWhoPrograms'	codebase_community
SELECT COUNT(T1.Id) / COUNT(T2.Id) FROM posts AS T1 INNER JOIN votes AS T2 ON T1.OwnerUserId = T2.UserId WHERE T1.OwnerUserId = 24	codebase_community
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer'	codebase_community
SELECT Text FROM comments WHERE Score = 17	codebase_community
SELECT DisplayName FROM users WHERE WebsiteUrl = 'http://stackoverflow.com'	codebase_community
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'SilentGhost' ORDER BY T2.Date DESC LIMIT 1	codebase_community
SELECT T1.DisplayName FROM users AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.UserId WHERE T2.Text LIKE '%thank you user93%'	codebase_community
SELECT T2.Text FROM users AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'A Lion'	codebase_community
SELECT T2.DisplayName, T1.Reputation FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T2.Title = 'Understanding what Dassault iSight is doing?'	codebase_community
SELECT T2.Text FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.Title = 'How does gentle boosting differ from AdaBoost?'	codebase_community
SELECT T2.DisplayName FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Necromancer' LIMIT 10	codebase_community
SELECT T1.DisplayName FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.LastEditorUserId WHERE T2.Title = 'Open source tools for visualizing multi-dimensional data?'	codebase_community
SELECT T1.Title FROM posts AS T1 JOIN users AS T2 ON T1.LastEditorUserId = T2.Id WHERE T2.DisplayName = 'Vebjorn Ljosa'	codebase_community
SELECT SUM(T1.Score), T2.WebsiteUrl FROM posts AS T1 INNER JOIN users AS T2 ON T1.LastEditorUserId = T2.Id WHERE T2.DisplayName = 'Yevgeny'	codebase_community
SELECT T2.Text FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.Title = 'Why square the difference instead of taking the absolute value in standard deviation?'	codebase_community
SELECT SUM(T1.BountyAmount) FROM votes AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T2.Title LIKE '%data%'	codebase_community
SELECT T1.DisplayName FROM users AS T1 JOIN votes AS T2 ON T1.Id = T2.UserId WHERE T2.BountyAmount = 50 AND T2.PostId IN (SELECT Id FROM posts WHERE Title LIKE '%variance%')	codebase_community
SELECT AVG(T1.ViewCount), T1.Title, T1.Text FROM posts AS T1 INNER JOIN postTags AS T2 ON T1.Id = T2.PostId WHERE T2.TagName LIKE '%humor%' GROUP BY T1.Id, T1.Title, T1.Text	codebase_community
SELECT COUNT(*) FROM comments WHERE UserId = 13	codebase_community
SELECT UserId FROM users ORDER BY Reputation DESC LIMIT 1	codebase_community
SELECT UserId FROM posts WHERE Views = (SELECT MIN(Views) FROM posts);	codebase_community
SELECT COUNT(UserId) FROM badges WHERE Name = 'Supporter' AND STRFTIME('%Y', Date) = '2011'	codebase_community
SELECT COUNT(UserId) FROM badges GROUP BY UserId HAVING COUNT(Name) > 5	codebase_community
SELECT COUNT(DISTINCT T1.UserId) FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.Location = 'New York' AND T2.Name IN ('Teacher', 'Supporter')	codebase_community
SELECT T1.DisplayName, T1.Reputation FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T2.Id = 1	codebase_community
SELECT DISTINCT T2.UserId FROM postHistory AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T2.Views >= 1000 GROUP BY T2.PostId HAVING COUNT(T1.PostId) = 1	codebase_community
SELECT T1.DisplayName ,  T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.Id IN (SELECT UserId FROM comments GROUP BY UserId ORDER BY COUNT(Id) DESC LIMIT 1)	codebase_community
SELECT COUNT(T1.Id) FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.Location = 'India' AND T2.Name = 'Teacher'	codebase_community
SELECT CAST(SUM(CASE WHEN STRFTIME('%Y', Date) = '2010' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(Id) - CAST(SUM(CASE WHEN STRFTIME('%Y', Date) = '2011' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(Id) FROM badges WHERE Name = 'Student'	codebase_community
SELECT PostHistoryTypeId ,  COUNT(DISTINCT UserId) FROM postHistory WHERE PostId = 3720 GROUP BY PostHistoryTypeId	codebase_community
SELECT p.Id, p.ViewCount FROM posts AS p INNER JOIN postlinks AS pl ON p.Id = pl.PostId WHERE pl.RelatedPostId = 61217	codebase_community
SELECT Score, LinkTypeId FROM postLinks WHERE PostId = 395;	codebase_community
SELECT Id, UserId FROM posts WHERE Score > 60;	codebase_community
SELECT SUM(FavoriteCount) FROM posts WHERE OwnerUserId = 686 AND STRFTIME('%Y', CreationDate) = '2011'	codebase_community
SELECT AVG(T1.UpVotes), AVG(T2.Age) FROM votes AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id GROUP BY T1.UserId HAVING COUNT(T1.PostId) > 10	codebase_community
SELECT COUNT(UserId) FROM badges WHERE Name = 'Announcer'	codebase_community
SELECT Name FROM badges WHERE Date = '2010-07-19 19:39:08.0'	codebase_community
SELECT COUNT(*) FROM comments WHERE Score > 60	codebase_community
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:16:14.0'	codebase_community
SELECT COUNT(Id) FROM posts WHERE Score = 10	codebase_community
SELECT T1.Name FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.Reputation = (SELECT MAX(Reputation) FROM users)	codebase_community
SELECT U.Reputation FROM users AS U JOIN badges AS B ON U.Id = B.UserId WHERE B.Date = '2010-07-19 19:39:08.0'	codebase_community
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'Pierre' ORDER BY T2.Date DESC LIMIT 1	codebase_community
SELECT DISTINCT T1.Date FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.Location = 'Rochester, NY'	codebase_community
SELECT CAST(SUM(CASE WHEN T2.Name = 'Teacher' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.UserId) FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId	codebase_community
SELECT CAST(SUM(CASE WHEN T2.Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.Id) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Organizer'	codebase_community
SELECT Score FROM comments WHERE PostId IN (SELECT Id FROM posts WHERE CreationDate = '2010-07-19 19:19:56.0') ORDER BY Score DESC LIMIT 1	codebase_community
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:37:33.0'	codebase_community
SELECT T1.Age FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.Location = 'Vienna, Austria'	codebase_community
SELECT COUNT(T1.UserId) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Supporter' AND T2.Age BETWEEN 19 AND 65	codebase_community
SELECT SUM(T1.ViewCount) FROM posts AS T1 INNER JOIN badges AS T2 ON T1.OwnerUserId = T2.UserId WHERE T2.Date = '2010-07-19 19:39:08.0'	codebase_community
SELECT T1.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.Reputation = (SELECT MIN(Reputation) FROM users)	codebase_community
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'Sharpie' ORDER BY T2.Date DESC LIMIT 1	codebase_community
SELECT COUNT(*) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Supporter' AND T2.Age > 65	codebase_community
SELECT DisplayName FROM users WHERE Id = 30;	codebase_community
SELECT COUNT(Id) FROM users WHERE Location = 'New York'	codebase_community
SELECT COUNT(*) FROM votes WHERE STRFTIME('%Y', CreationDate) = '2010'	codebase_community
SELECT COUNT(Id) FROM users WHERE Age BETWEEN 19 AND 65	codebase_community
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1	codebase_community
SELECT CAST(SUM(CASE WHEN STRFTIME('%Y', CreationDate) = '2010' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN STRFTIME('%Y', CreationDate) = '2011' THEN 1 ELSE 0 END) FROM votes	codebase_community
SELECT T3.TagName FROM users AS T1 INNER JOIN postHistory AS T2 ON T1.Id = T2.UserId INNER JOIN posts AS T3 ON T2.PostId = T3.Id WHERE T1.DisplayName = 'John Salvatier' GROUP BY T3.TagName	codebase_community
SELECT COUNT(*) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'Daniel Vassallo'	codebase_community
SELECT COUNT(T1.Id) FROM votes AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'Harlan'	codebase_community
SELECT T1.Id FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'slashnick' ORDER BY T1.AnswerCount DESC LIMIT 1	codebase_community
SELECT p.Id FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName IN ('Harvey Motulsky', 'Noah Snyder') GROUP BY p.Id ORDER BY SUM(p.ViewCount) DESC LIMIT 1	codebase_community
SELECT COUNT(*) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'Matt Parker' AND T1.VoteCount > 4	codebase_community
SELECT COUNT(T2.Score) FROM users AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'Neil McGuigan' AND T2.Score < 60	codebase_community
SELECT DISTINCT T2.TagName FROM posts AS T1 INNER JOIN tags AS T2 ON T1.Id = T2.ExcerptPostId WHERE T1.OwnerDisplayName = 'Mark Meckes' AND T1.CommentCount = 0	codebase_community
SELECT T1.DisplayName FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T2.Name = 'Organizer'	codebase_community
SELECT CAST(SUM(CASE WHEN T3.TagName = 'r' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.Id) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId LEFT JOIN postTags AS T3 ON T2.Id = T3.PostId WHERE T1.DisplayName = 'Community'	codebase_community
SELECT SUM(CASE WHEN T2.DisplayName = 'Mornington' THEN T1.ViewCount ELSE 0 END) - SUM(CASE WHEN T2.DisplayName = 'Amos' THEN T1.ViewCount ELSE 0 END) AS Difference FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Commentator' AND STRFTIME('%Y', Date) = '2014'	codebase_community
SELECT COUNT(*) FROM posts WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59'	codebase_community
SELECT DisplayName , Age FROM users WHERE Views = (SELECT MAX(Views) FROM users)	codebase_community
SELECT LastEditDate, LastEditorUserId FROM posts WHERE Title = 'Detecting a given face in a database of facial images'	codebase_community
SELECT COUNT(*) FROM comments WHERE UserId = 13 AND Score < 60	codebase_community
SELECT T1.Title, T2.UserDisplayName FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T2.Score > 60	codebase_community
SELECT T1.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE STRFTIME('%Y', T1.Date) = '2011' AND T2.Location = 'North Pole'	codebase_community
SELECT T1.DisplayName, T1.WebsiteUrl FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T2.FavoriteCount > 150	codebase_community
SELECT COUNT(T1.Id), T1.LastEditDate FROM posts AS T1 JOIN postHistory AS T2 ON T1.Id = T2.PostId WHERE T1.Title = 'What is the best introductory Bayesian statistics textbook?'	codebase_community
SELECT T1.LastAccessDate, T1.Location FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T2.Name = 'Outliers' ORDER BY T1.LastAccessDate DESC LIMIT 1	codebase_community
SELECT T2.Title FROM postLinks AS T1 INNER JOIN posts AS T2 ON T1.RelatedPostId = T2.Id WHERE T1.PostId = ( SELECT Id FROM posts WHERE Title LIKE 'How to tell if something happened in a data set which monitors a value over time' )	codebase_community
SELECT T1.PostId, T2.Name FROM posts AS T1 INNER JOIN badges AS T2 ON T1.OwnerUserId = T2.UserId WHERE T2.UserDisplayName = 'Samuel' AND STRFTIME('%Y', T2.Date) = '2013'	codebase_community
SELECT T1.OwnerDisplayName FROM posts AS T1 ORDER BY T1.ViewCount DESC LIMIT 1	codebase_community
SELECT T2.DisplayName, T2.Location FROM tags AS T1 INNER JOIN posts AS T2 ON T1.ExcerptPostId = T2.Id WHERE T1.TagName = 'hypothesis-testing'	codebase_community
SELECT T1.Title, T2.LinkTypeId FROM posts AS T1 INNER JOIN postLinks AS T2 ON T1.Id = T2.PostId WHERE T1.Title = 'What are principal component scores?'	codebase_community
SELECT T2.ParentId, T2.DisplayName FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T2.ParentId IS NOT NULL ORDER BY T2.Score DESC LIMIT 1	codebase_community
SELECT T2.DisplayName, T2.WebsiteUrl FROM votes AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.VoteTypeId = 8 ORDER BY T1.BountyAmount DESC LIMIT 1	codebase_community
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5	codebase_community
SELECT COUNT FROM tags WHERE Count BETWEEN 5000 AND 7000	codebase_community
SELECT OwnerUserId FROM posts ORDER BY FavoriteCount DESC LIMIT 1	codebase_community
SELECT Age FROM users ORDER BY Reputation DESC LIMIT 1	codebase_community
SELECT COUNT(*) FROM posts AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.PostId WHERE STRFTIME('%Y', T2.CreationDate) = '2011' AND T2.BountyAmount = 50	codebase_community
SELECT Id FROM users WHERE Age IS NOT NULL ORDER BY Age ASC LIMIT 1	codebase_community
SELECT SUM(Score) FROM posts WHERE LasActivityDate LIKE '2010-07-19%'	codebase_community
SELECT CAST(COUNT(CASE WHEN STRFTIME('%Y', CreationDate) = '2010' AND AnswerCount <= 2 THEN Id ELSE NULL END) AS REAL) / 12 FROM postLinks	codebase_community
SELECT PostId FROM posts WHERE Id IN (SELECT PostId FROM votes WHERE UserId = 1465) ORDER BY FavoriteCount DESC LIMIT 1	codebase_community
SELECT Title FROM posts AS T1 JOIN postLinks AS T2 ON T1.Id = T2.PostId WHERE T2.CreationDate IS NOT NULL ORDER BY T2.CreationDate ASC LIMIT 1	codebase_community
SELECT T2.DisplayName FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id GROUP BY T1.UserId ORDER BY COUNT(T1.Name) DESC LIMIT 1	codebase_community
SELECT MIN(T2.CreationDate) FROM users AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'chl'	codebase_community
SELECT MIN(T1.CreaionDate) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.Age IS NOT NULL ORDER BY T2.Age ASC LIMIT 1	codebase_community
SELECT T1.DisplayName FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T2.Name = 'Autobiographer' ORDER BY T2.Date ASC LIMIT 1	codebase_community
SELECT COUNT(T1.Id) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.Location LIKE '%United Kingdom%' AND T2.FavoriteCount >= 4	codebase_community
SELECT AVG(T2.PostId) FROM users AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.UserId WHERE T1.Age IS NOT NULL ORDER BY T1.Age DESC LIMIT 1	codebase_community
SELECT DisplayName FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT COUNT(Id) FROM users WHERE Reputation > 2000 AND Views > 1000	codebase_community
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT COUNT(T1.Id) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'Jay Stevens' AND STRFTIME('%Y', T1.CreationDate) = '2010'	codebase_community
SELECT Id, Title FROM posts WHERE OwnerDisplayName = 'Harvey Motulsky' ORDER BY ViewCount DESC LIMIT 1	codebase_community
SELECT Id, Title FROM posts ORDER BY Score DESC LIMIT 1	codebase_community
SELECT AVG(T2.Score) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName = 'Stephen Turner'	codebase_community
SELECT DISTINCT T1.DisplayName FROM users AS T1 JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T2.ViewCount > 20000 AND STRFTIME('%Y', T2.CreationDate) = '2011'	codebase_community
SELECT Id, OwnerDisplayName FROM posts WHERE CreationDate LIKE '2010%' ORDER BY FavoriteCount DESC LIMIT 1	codebase_community
SELECT CAST(SUM(CASE WHEN T1.Reputation > 1000 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.Id) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE STRFTIME('%Y', T2.CreaionDate) = '2011'	codebase_community
SELECT CAST(SUM(CASE WHEN Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(Id) FROM users	codebase_community
SELECT SUM(T1.ViewCount), T2.DisplayName FROM posts AS T1 INNER JOIN users AS T2 ON T1.LastEditorUserId = T2.Id WHERE T1.Body LIKE '%Computer Game Datasets%'	codebase_community
SELECT COUNT(Id) FROM posts WHERE ViewCount > ( SELECT AVG(ViewCount) FROM posts )	codebase_community
SELECT COUNT(*) FROM comments WHERE PostId = (SELECT Id FROM posts ORDER BY Score DESC LIMIT 1)	codebase_community
SELECT COUNT(Id) FROM posts WHERE ViewCount > 35000 AND CommentCount = 0	codebase_community
SELECT T1.DisplayName, T1.Location FROM users AS T1 JOIN posts AS T2 ON T1.Id = T2.LastEditorUserId WHERE T2.Id = 183 ORDER BY T2.LastEditDate DESC LIMIT 1	codebase_community
SELECT Id FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Emmett') ORDER BY Date DESC LIMIT 1	codebase_community
SELECT COUNT(Id) FROM users WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000	codebase_community
SELECT T2.Date - T1.CreationDate FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'Zolomon'	codebase_community
SELECT COUNT(T1.PostId) AS NumberOfPosts, COUNT(T2.Id) AS NumberOfComments FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.OwnerUserId = ( SELECT Id FROM users ORDER BY CreationDate ASC LIMIT 1 )	codebase_community
SELECT T2.Text, T2.UserDisplayName FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.Title = 'Analysing wind data with R' ORDER BY T2.CreationDate DESC LIMIT 10	codebase_community
SELECT COUNT(UserId) FROM badges WHERE Name = 'Citizen Patrol';	codebase_community
SELECT COUNT(T1.Id) FROM posts AS T1 INNER JOIN postTags AS T2 ON T1.Id = T2.PostId INNER JOIN tags AS T3 ON T2.TagId = T3.Id WHERE T3.TagName = 'careers'	codebase_community
SELECT Reputation, ViewCount FROM users WHERE DisplayName = 'Jarrod Dixon'	codebase_community
SELECT COUNT(T2.Id) AS CommentCount, COUNT(T3.Id) AS AnswerCount FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId INNER JOIN posts AS T3 ON T1.Id = T3.ParentId WHERE T1.Title = 'Clustering 1D data' AND T2.UserId IS NOT NULL AND T3.UserId IS NOT NULL	codebase_community
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat'	codebase_community
SELECT COUNT(PostId) FROM votes WHERE BountyAmount >= 30	codebase_community
SELECT CAST(SUM(CASE WHEN stats_posts.Score > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(stats_posts.Id) FROM posts AS stats_posts JOIN users AS stats_users ON stats_posts.OwnerUserId = stats_users.Id WHERE stats_users.Reputation = (SELECT MAX(Reputation) FROM users)	codebase_community
SELECT COUNT(Id) FROM posts WHERE Score < 20;	codebase_community
SELECT COUNT(*) FROM tags WHERE Id < 15 AND Count <= 20	codebase_community
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample'	codebase_community
SELECT T1.Reputation, T1.UpVotes FROM users AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.UserId WHERE T2.Text = 'fine, you win :)';	codebase_community
SELECT T2.Text FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.Title LIKE '%linear regression%'	codebase_community
SELECT T2.Text FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.ViewCount BETWEEN 100 AND 150 ORDER BY T2.Score DESC LIMIT 1	codebase_community
SELECT T1.CreationDate , TIMESTAMPDIFF(YEAR, T1.CreationDate, GETDATE()) AS Age FROM users AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.UserId WHERE T2.Text LIKE '%http://%';	codebase_community
SELECT COUNT(DISTINCT PostId) FROM comments WHERE Score = 0 AND PostId IN (SELECT Id FROM posts WHERE ViewCount < 5)	codebase_community
SELECT COUNT(*) FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.CommentCount = 1 AND T2.Score = 0	codebase_community
SELECT COUNT(DISTINCT T1.UserId) FROM users AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.UserId WHERE T2.Score = 0 AND T1.Age = 40	codebase_community
SELECT p.Id, c.Text FROM posts AS p JOIN comments AS c ON p.Id = c.PostId WHERE p.Title = 'Group differences on a five point Likert item'	codebase_community
SELECT V.UpVotes FROM votes AS V JOIN comments AS C ON V.PostId = C.PostId WHERE C.Text LIKE '%R is also lazy evaluated.'	codebase_community
SELECT T2.Text FROM users AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'Harvey Motulsky'	codebase_community
SELECT DISTINCT T2.DisplayName FROM comments AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Score BETWEEN 1 AND 5 AND T2.DownVotes = 0	codebase_community
SELECT CAST(SUM(CASE WHEN T2.UpVotes = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.UserId) FROM comments AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Score BETWEEN 5 AND 10	codebase_community
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.superhero_name = '3-D Man'	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Super Strength'	superhero
SELECT COUNT(T1.id) FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Super Strength' AND T1.height_cm > 200	superhero
SELECT T1.full_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id GROUP BY T1.full_name HAVING COUNT(T2.power_id) > 15	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Blue'	superhero
SELECT T3.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.skin_colour_id = T2.id INNER JOIN colour AS T3 ON T1.hair_colour_id = T3.id WHERE T1.superhero_name = 'Apocalypse'	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id INNER JOIN colour AS T4 ON T1.eye_colour_id = T4.id WHERE T4.colour = 'Blue' AND T3.power_name = 'Agility'	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Blue' AND T1.hair_colour_id = T2.id AND T2.colour = 'Blond'	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics'	superhero
SELECT T1.id FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics' ORDER BY T1.height_cm DESC LIMIT 1	superhero
SELECT T2.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name = 'Sauron'	superhero
SELECT T1.eye_colour_id FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id INNER JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T3.publisher_name = 'Marvel Comics' GROUP BY T1.eye_colour_id ORDER BY COUNT(T1.id) DESC LIMIT 1	superhero
SELECT AVG(T1.height_cm) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics'	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.publisher_id = 4 AND T3.power_name = 'Super Strength'	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'DC Comics'	superhero
SELECT T.publisher_name FROM ( SELECT T3.publisher_name, T2.attribute_value FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN alignment AS T3 ON T1.alignment_id = T3.id WHERE T2.attribute_name = 'Speed' AND T2.attribute_value IS NOT NULL ORDER BY T2.attribute_value ASC LIMIT 1 ) t	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id INNER JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T2.colour = 'Gold' AND T3.publisher_name = 'Marvel Comics'	superhero
SELECT T2.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name = 'Blue Beetle II'	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.hair_colour_id = T2.id WHERE T2.colour = 'Blond'	superhero
SELECT T1.id FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Intelligence' ORDER BY T2.attribute_value ASC LIMIT 1	superhero
SELECT T1.race FROM race AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T2.superhero_name = 'Copycat'	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T2.attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Durability') AND T2.attribute_value < 50;	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Death Touch'	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T1.gender_id = 2 AND T3.attribute_name = 'Strength' AND T2.attribute_value = 100	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id GROUP BY T1.id ORDER BY COUNT(T2.power_id) DESC LIMIT 1	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Vampire'	superhero
SELECT CAST(SUM(CASE WHEN T1.alignment = 'Bad' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id), SUM(CASE WHEN T1.publisher_id = 4 AND T1.alignment = 'Bad' THEN 1 ELSE 0 END) FROM alignment AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.alignment_id	superhero
SELECT SUM(CASE WHEN T2.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) - SUM(CASE WHEN T2.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) AS diff FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id	superhero
SELECT T.publisher_id FROM superhero AS T WHERE T.superhero_name = 'Star Trek'	superhero
SELECT AVG(T2.attribute_value) FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id	superhero
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL	superhero
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T2.id = 75	superhero
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.superhero_name = 'Deathlok'	superhero
SELECT AVG(T1.weight_kg) FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T2.gender = 'Female'	superhero
SELECT T2.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.gender_id = 1 LIMIT 5	superhero
SELECT superhero_name FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Alien'	superhero
SELECT superhero_name FROM superhero WHERE height_cm BETWEEN 170 AND 190 AND eye_colour_id IN (SELECT id FROM colour WHERE colour = 'No Colour')	superhero
SELECT T2.power_name FROM superhero AS T1 INNER JOIN superpower AS T2 ON T1.id = T2.id WHERE T1.id = 56	superhero
SELECT T1.full_name FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Demi-God' LIMIT 5	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T2.alignment = 'Bad'	superhero
SELECT T.race FROM ( SELECT T2.race, COUNT(*) AS count FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.weight_kg = 169 GROUP BY T2.race ) AS T ORDER BY T.count DESC LIMIT 1	superhero
SELECT T3.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.hair_colour_id = T2.id INNER JOIN colour AS T3 ON T1.skin_colour_id = T3.id WHERE T1.height_cm = 185 AND T1.race_id = 1 LIMIT 1	superhero
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.eye_colour_id ORDER BY T2.weight_kg DESC LIMIT 1	superhero
SELECT CAST(COUNT(CASE WHEN T2.publisher_name = 'Marvel Comics' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(*) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.height_cm BETWEEN 150 AND 180	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T2.gender = 'Male' AND T1.weight_kg > (SELECT AVG(weight_kg) * 0.79 FROM superhero)	superhero
SELECT T2.power_name FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id GROUP BY T2.power_name ORDER BY COUNT(T2.power_name) DESC LIMIT 1	superhero
SELECT T2.attribute_value FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Abomination' AND T2.attribute_id = 1	superhero
SELECT T2.power_name FROM superhero AS T1 INNER JOIN superpower AS T2 ON T1.id = T2.id WHERE T1.id = 1	superhero
SELECT COUNT(*) FROM superpower AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.power_id WHERE T1.power_name = 'Stealth'	superhero
SELECT T1.full_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Strength' ORDER BY T2.attribute_value DESC LIMIT 1	superhero
SELECT CAST(SUM(CASE WHEN T1.skin_colour_id = 1 THEN 1 ELSE 0 END) AS REAL) / COUNT(T1.id) FROM superhero AS T1	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Dark Horse Comics'	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id INNER JOIN publisher AS T4 ON T1.publisher_id = T4.id WHERE T4.publisher_name = 'Dark Horse Comics' AND T3.attribute_name = 'Durability' ORDER BY T2.attribute_value DESC LIMIT 1	superhero
SELECT T3.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id INNER JOIN colour AS T3 ON T1.hair_colour_id = T3.id WHERE T1.full_name = 'Abraham Sapien'	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Flight'	superhero
SELECT T1.eye_colour_id, T1.hair_colour_id, T1.skin_colour_id FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id INNER JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T2.gender = 'Female' AND T3.publisher_name = 'Dark Horse Comics'	superhero
SELECT T1.superhero_name ,  T2.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.hair_colour_id = T1.skin_colour_id AND T1.hair_colour_id = T1.eye_colour_id	superhero
SELECT T1.race FROM race AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T2.superhero_name = 'A-Bomb'	superhero
SELECT CAST(SUM(CASE WHEN T1.gender = 'Female' AND T3.colour = 'Blue' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id INNER JOIN colour AS T3 ON T1.skin_colour_id = T3.id	superhero
SELECT T1.superhero_name ,  T2.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.full_name = 'Charles Chandler'	superhero
SELECT T1.gender FROM gender AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.gender_id WHERE T2.superhero_name = 'Agent 13'	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Adaptation'	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Amazo'	superhero
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.full_name = 'Hunter Zolomon'	superhero
SELECT T1.height_cm FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Amber'	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id INNER JOIN colour AS T3 ON T1.hair_colour_id = T3.id WHERE T2.colour = 'Black' AND T3.colour = 'Black'	superhero
SELECT T3.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.skin_colour_id = T2.id INNER JOIN colour AS T3 ON T1.eye_colour_id = T3.id WHERE T2.colour = 'Gold'	superhero
SELECT T1.full_name FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Vampire'	superhero
SELECT superhero_name FROM superhero AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T2.alignment = 'Neutral'	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Strength' AND T2.attribute_value = ( SELECT MAX(attribute_value) FROM hero_attribute AS T2 INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Strength' )	superhero
SELECT T1.race, T2.alignment FROM race AS T1 INNER JOIN alignment AS T2 ON T1.id = T2.id INNER JOIN superhero AS T3 ON T1.id = T3.race_id AND T2.id = T3.alignment_id WHERE T3.superhero_name = 'Cameron Hicks'	superhero
SELECT CAST(SUM(CASE WHEN T1.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.publisher_id) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics'	superhero
SELECT AVG(T1.weight_kg) FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Alien'	superhero
SELECT (SELECT weight_kg FROM superhero WHERE full_name = 'Emil Blonsky') - (SELECT weight_kg FROM superhero WHERE full_name = 'Charles Chandler') AS difference	superhero
SELECT AVG(height_cm) FROM superhero	superhero
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.superhero_name = 'Abomination'	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T1.race_id = 21 AND T2.id = 1	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Speed' ORDER BY T2.attribute_value DESC LIMIT 1	superhero
SELECT COUNT(id) FROM superhero WHERE alignment_id = 3	superhero
SELECT T3.attribute_name, T2.attribute_value FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T1.superhero_name = '3-D Man'	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Blue' AND T1.hair_colour_id IN ( SELECT id FROM colour WHERE colour = 'Brown' )	superhero
SELECT DISTINCT T2.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy')	superhero
SELECT COUNT(id) FROM superhero WHERE publisher_id = 1;	superhero
SELECT CAST(COUNT(CASE WHEN T2.eye_colour_id = 7 THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(*) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id	superhero
SELECT CAST(SUM(CASE WHEN T1.gender_id = 1 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T1.gender_id = 2 THEN 1 ELSE 0 END) FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T2.gender IN ('Male', 'Female')	superhero
SELECT T1.superhero_name FROM superhero AS T1 ORDER BY T1.height_cm DESC LIMIT 1	superhero
SELECT id FROM superpower WHERE power_name = 'Cryokinesis'	superhero
SELECT superhero_name FROM superhero WHERE id = 294	superhero
SELECT full_name FROM superhero WHERE weight_kg IS NULL OR weight_kg = 0	superhero
SELECT T3.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id INNER JOIN colour AS T3 ON T1.hair_colour_id = T3.id WHERE T1.full_name = 'Karen Beecher-Duncan'	superhero
SELECT T2.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id WHERE T1.full_name = 'Helen Parr'	superhero
SELECT T1.race FROM race AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T2.weight_kg = 108 AND T2.height_cm = 188	superhero
SELECT T.publisher_name FROM publisher AS T WHERE T.id = (SELECT publisher_id FROM superhero WHERE id = 38)	superhero
SELECT T1.race FROM race AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.race_id INNER JOIN hero_attribute AS T3 ON T2.id = T3.hero_id WHERE T3.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute)	superhero
SELECT T3.alignment, T5.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN power AS T5 ON T2.power_id = T5.id INNER JOIN alignment AS T3 ON T1.alignment_id = T3.id WHERE T1.superhero_name = 'Atom IV'	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Blue' LIMIT 5	superhero
SELECT AVG(T3.attribute_value) FROM superhero AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id INNER JOIN hero_attribute AS T3 ON T1.id = T3.hero_id WHERE T2.alignment = 'Neutral'	superhero
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.skin_colour_id INNER JOIN hero_attribute AS T3 ON T2.id = T3.hero_id WHERE T3.attribute_value = 100	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id INNER JOIN alignment AS T3 ON T1.alignment_id = T3.id WHERE T2.gender = 'Female' AND T3.alignment = 'Good'	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T2.attribute_value BETWEEN 75 AND 80	superhero
SELECT T3.race FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.hair_colour_id = T2.id INNER JOIN race AS T3 ON T1.race_id = T3.id WHERE T2.colour = 'blue' AND T1.gender_id = 1	superhero
SELECT CAST(COUNT(CASE WHEN T2.gender = 'Female' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.alignment) FROM alignment AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.alignment_id WHERE T1.id = 2	superhero
SELECT SUM(CASE WHEN T1.eye_colour_id = 7 THEN 1 ELSE 0 END) - SUM(CASE WHEN T1.eye_colour_id = 1 THEN 1 ELSE 0 END) AS diff FROM superhero AS T1 LEFT JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.weight_kg IS NULL OR T1.weight_kg = 0	superhero
SELECT T3.attribute_value FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T1.superhero_name = 'Hulk' AND T3.attribute_name = 'Strength'	superhero
SELECT T2.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Ajax'	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.skin_colour_id = T2.id INNER JOIN alignment AS T3 ON T1.alignment_id = T3.id WHERE T2.colour = 'Green' AND T3.alignment = 'Bad'	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id INNER JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T2.gender = 'Female' AND T3.publisher_name = 'Marvel Comics'	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Wind Control' ORDER BY T1.superhero_name ASC	superhero
SELECT T1.gender FROM gender AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.gender_id INNER JOIN hero_power AS T3 ON T2.id = T3.hero_id INNER JOIN superpower AS T4 ON T3.power_id = T4.id WHERE T4.power_name = 'Phoenix Force'	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'DC Comics' ORDER BY T1.weight_kg DESC LIMIT 1	superhero
SELECT AVG(T1.height_cm) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Dark Horse Comics' AND T1.race != 'Human'	superhero
SELECT T1.id FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Speed' AND T2.attribute_value = 100	superhero
SELECT SUM(CASE WHEN T2.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) - SUM(CASE WHEN T2.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS difference FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id	superhero
SELECT T2.attribute_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T1.superhero_name = 'Black Panther' ORDER BY T2.attribute_value ASC LIMIT 1	superhero
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.superhero_name = 'Abomination'	superhero
SELECT T1.id FROM superhero AS T1 ORDER BY T1.height_cm DESC LIMIT 1	superhero
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler'	superhero
SELECT CAST(SUM(CASE WHEN T1.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.publisher_id) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'George Lucas'	superhero
SELECT CAST(SUM(CASE WHEN T1.alignment = 'Good' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM alignment AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.alignment_id WHERE T2.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')	superhero
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%'	superhero
SELECT T1.hero_id FROM hero_attribute AS T1 ORDER BY T1.attribute_value ASC LIMIT 1	superhero
SELECT full_name FROM superhero WHERE superhero_name = 'Alien'	superhero
SELECT T1.full_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.weight_kg < 100 AND T2.colour = 'Brown'	superhero
SELECT T2.attribute_value FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Aquababy'	superhero
SELECT T1.weight_kg, T2.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.id = 40	superhero
SELECT AVG(T1.height_cm) FROM superhero AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T2.alignment = 'Neutral'	superhero
SELECT T1.hero_id FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T2.power_name = 'Intelligence'	superhero
SELECT T3.colour FROM superhero AS T1 INNER JOIN colour AS T3 ON T1.eye_colour_id = T3.id WHERE T1.superhero_name = 'Blackwulf'	superhero
SELECT T2.power_name FROM superhero AS T1 INNER JOIN superpower AS T2 ON T1.id = T2.id WHERE T1.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero)	superhero
SELECT T1.driverRef FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 20 AND T2.q1 IS NOT NULL ORDER BY T2.q1 DESC LIMIT 5	formula_1
SELECT T1.surname FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 19 AND T2.q2 IS NOT NULL ORDER BY T2.q2 ASC LIMIT 1	formula_1
SELECT DISTINCT YEAR FROM races WHERE circuitId IN (SELECT circuitId FROM circuits WHERE LOCATION = 'Shanghai')	formula_1
SELECT T1.url FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Circuit de Barcelona-Catalunya'	formula_1
SELECT T1.name FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.country = 'Germany'	formula_1
SELECT DISTINCT T1.position FROM constructorStandings AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T2.name = 'Renault'	formula_1
SELECT COUNT(*) FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.year = 2010 AND T2.country NOT IN ('Asia', 'Europe')	formula_1
SELECT T1.name FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.country = 'Spain'	formula_1
SELECT T1.lat, T1.lng FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Australian Grand Prix'	formula_1
SELECT T1.url FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Sepang International Circuit'	formula_1
SELECT T2.time FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Sepang International Circuit'	formula_1
SELECT T1.lat, T1.lng FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Abu Dhabi Grand Prix'	formula_1
SELECT T3.country FROM constructorStandings AS T1 JOIN constructors AS T2 ON T1.constructorId = T2.constructorId JOIN circuits AS T3 ON T1.raceId = T3.circuitId WHERE T1.points = 1 AND T1.raceId = 24	formula_1
SELECT q1 FROM qualifying AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T2.forename = 'Bruno' AND T2.surname = 'Senna' AND T1.raceid = 354	formula_1
SELECT T1.nationality FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T2.q2 = '00:01:40' AND T2.raceid = 355	formula_1
SELECT driverId FROM qualifying WHERE q3 LIKE '0:01:%' AND raceId = 903	formula_1
SELECT COUNT(*) FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.name = 'Bahrain Grand Prix' AND T1.statusid != 1	formula_1
SELECT T1.url FROM seasons AS T1 INNER JOIN races AS T2 ON T1.year = T2.year WHERE T2.raceId = 901	formula_1
SELECT COUNT(*) FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE date = '2015-11-29' AND TIME IS NOT NULL	formula_1
SELECT T1.driverid FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 592 AND T2.time IS NOT NULL ORDER BY T1.dob ASC LIMIT 1	formula_1
SELECT T1.driverid ,  T1.url FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid WHERE T2.laptime LIKE '1:27%' AND T2.raceid = 161	formula_1
SELECT T1.nationality FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 933 AND T2.fastestlapspeed IS NOT NULL ORDER BY T2.fastestlapspeed DESC LIMIT 1	formula_1
SELECT T1.lat, T1.lng FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Malaysian Grand Prix'	formula_1
SELECT T1.url FROM constructors AS T1 INNER JOIN constructorStandings AS T2 ON T1.constructorid = T2.constructorid WHERE T2.raceid = 9 ORDER BY T2.points DESC LIMIT 1	formula_1
SELECT q1 FROM qualifying AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T2.forename = 'Lucas' AND T2.surname = 'di Grassi' AND T1.raceid = 345	formula_1
SELECT T1.nationality FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T2.q2 = '00:01:15' AND T2.raceid = 347	formula_1
SELECT T1.code FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 45 AND T2.q3 LIKE '1:33%'	formula_1
SELECT T1.time FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T2.forename = 'Bruce' AND T2.surname = 'McLaren' AND T1.raceid = 743	formula_1
SELECT T1.driverid FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T3.name = 'San Marino Grand Prix' AND T3.year = 2006 AND T2.position = 2	formula_1
SELECT T1.url FROM seasons AS T1 INNER JOIN races AS T2 ON T1.year = T2.year WHERE T2.raceid = 901	formula_1
SELECT COUNT(*) FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.date = '2015-11-29' AND T1.status != 1	formula_1
SELECT T1.driverId FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 872 ORDER BY T1.dob DESC LIMIT 1	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 348 ORDER BY T2.milliseconds ASC LIMIT 1	formula_1
SELECT T1.nationality FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.fastestlapspeed = (SELECT MAX(fastestlapspeed) FROM results)	formula_1
SELECT ((SELECT fastestLapSpeed FROM results WHERE driverId IN (SELECT driverId FROM drivers WHERE forename = 'Paul' AND surname = 'di Resta') AND raceId = 853) - (SELECT fastestLapSpeed FROM results WHERE driverId IN (SELECT driverId FROM drivers WHERE forename = 'Paul' AND surname = 'di Resta') AND raceId = 854)) / (SELECT fastestLapSpeed FROM results WHERE driverId IN (SELECT driverId FROM drivers WHERE forename = 'Paul' AND surname = 'di Resta') AND raceId = 853) * 100	formula_1
SELECT CAST(SUM(CASE WHEN T1.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.driverid) FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.date = '1983-07-16'	formula_1
SELECT MIN(T1.year) FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Sepang International Circuit'	formula_1
SELECT count(*) ,  T1.name FROM races AS T1 WHERE T1.year = 2005 ORDER BY T1.date DESC	formula_1
SELECT T2.name FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.date = ( SELECT MIN(T1.date) FROM races AS T1 )	formula_1
SELECT T1.name, T1.date FROM races AS T1 WHERE T1.year = 1999 ORDER BY T1.round DESC LIMIT 1	formula_1
SELECT YEAR FROM races GROUP BY YEAR ORDER BY COUNT(*) DESC LIMIT 1	formula_1
SELECT DISTINCT T1.name FROM races AS T1 WHERE T1.year = 2017 AND T1.circuitid NOT IN (SELECT circuitid FROM races WHERE YEAR = 2000)	formula_1
SELECT T1.country, T2.name, T2.location FROM circuits AS T2 INNER JOIN races AS T1 ON T1.circuitid = T2.circuitid WHERE T1.year = (SELECT MIN(year) FROM races WHERE country LIKE '%Europe%')	formula_1
SELECT T1.year FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Brands Hatch' AND T1.name = 'British Grand Prix' ORDER BY T1.year DESC LIMIT 1	formula_1
SELECT COUNT(DISTINCT T1.year) FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Silverstone' AND T1.name LIKE '%British%'	formula_1
SELECT T2.forename ,  T2.surname FROM races AS T1 INNER JOIN driverstandings AS T2 ON T1.raceid = T2.raceid WHERE T1.name = 'Singapore Grand Prix' AND T1.year = 2010 ORDER BY T2.position ASC	formula_1
SELECT T2.forename, T2.surname, T1.points FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverid ORDER BY T1.points DESC LIMIT 1	formula_1
SELECT T1.driverid, T1.points FROM driverstandings AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.name = 'Chinese Grand Prix' AND T1.position <= 3 ORDER BY T1.points DESC LIMIT 3	formula_1
SELECT T2.forename, T2.surname, T3.name FROM laptimes AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverid INNER JOIN races AS T3 ON T1.raceid = T3.raceid ORDER BY milliseconds ASC LIMIT 1	formula_1
SELECT AVG(T2.milliseconds) FROM drivers AS T1 INNER JOIN laptimes AS T2 ON T1.driverid = T2.driverid INNER JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton' AND T3.name = 'Malaysian Grand Prix'	formula_1
SELECT CAST(SUM(CASE WHEN T2.surname = 'Hamilton' AND T1.position > 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.raceId) FROM driverstandings AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T1.year >= 2010	formula_1
SELECT T1.driverid, T1.forename, T1.surname, T1.nationality, SUM(T2.points) AS max_points FROM drivers AS T1 JOIN driverstandings AS T2 ON T1.driverid = T2.driverid WHERE T2.wins > 0 GROUP BY T1.driverid ORDER BY max_points DESC LIMIT 1	formula_1
SELECT T1.driverid ,  T1.forename ,  T1.surname FROM drivers AS T1 WHERE T1.nationality = 'Japanese' ORDER BY T1.dob DESC LIMIT 1	formula_1
SELECT T1.circuitid FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE STRFTIME('%Y', T2.date) BETWEEN '1990' AND '2000' GROUP BY T1.circuitid HAVING COUNT(*) = 4	formula_1
SELECT T1.name, T1.location, T3.name FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid JOIN constructorstandings AS T3 ON T2.raceid = T3.raceid WHERE T1.country = 'USA' AND T2.year = 2006	formula_1
SELECT DISTINCT T1.name, T2.name, T2.location FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE STRFTIME('%Y-%m', T1.date) = '2005-09'	formula_1
SELECT T1.name FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T3.forename = 'Alex' AND T3.surname = 'Yoong' AND T2.position < 20 ORDER BY T2.position ASC LIMIT 1	formula_1
SELECT COUNT(*) FROM constructorStandings AS T1 JOIN constructors AS T2 ON T1.constructorId = T2.constructorId JOIN races AS T3 ON T1.raceId = T3.raceId WHERE T2.name = 'McLaren' AND T3.circuitId = 2	formula_1
SELECT T2.name, T2.year FROM results AS T1 INNER JOIN races AS T2 ON T1.raceid = T2.raceid INNER JOIN drivers AS T3 ON T1.driverid = T3.driverid WHERE T3.forename = 'Michael' AND T3.surname = 'Schumacher' ORDER BY T1.fastestlaptime ASC LIMIT 1	formula_1
SELECT AVG(T2.points) FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T1.forename = 'Eddie' AND T1.surname = 'Irvine' AND T2.year = 2000	formula_1
SELECT T1.driverid ,  T1.points FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T2.forename = "Lewis" AND T2.surname = "Hamilton" ORDER BY T1.raceid ASC LIMIT 1	formula_1
SELECT T1.name, T2.country FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.year = 2017 ORDER BY T1.date	formula_1
SELECT T1.name, T1.year, T2.location FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid ORDER BY T1.laps DESC LIMIT 1	formula_1
SELECT CAST(SUM(CASE WHEN T1.country = 'Germany' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'European Grand Prix'	formula_1
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit'	formula_1
SELECT T1.circuitId FROM circuits AS T1 WHERE T1.name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring') ORDER BY T1.lat DESC LIMIT 1	formula_1
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit'	formula_1
SELECT country FROM circuits ORDER BY alt DESC LIMIT 1	formula_1
SELECT COUNT(*) FROM drivers WHERE code IS NULL	formula_1
SELECT T1.country FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid JOIN constructorstandings AS T3 ON T2.raceid = T3.raceid WHERE T3.position = 1 ORDER BY T3.points DESC LIMIT 1	formula_1
SELECT surname FROM drivers WHERE nationality = 'Italian'	formula_1
SELECT T1.url FROM drivers AS T1 JOIN constructorStandings AS T2 ON T1.driverid = T2.driverid WHERE T1.forename = 'Anthony' AND T1.surname = 'Davidson'	formula_1
SELECT driverRef FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton'	formula_1
SELECT T1.name FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.year = 2009 AND T2.name = "Spanish Grand Prix"	formula_1
SELECT DISTINCT T1.year FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Silverstone'	formula_1
SELECT T1.url FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Silverstone'	formula_1
SELECT T1.date FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Abu Dhabi Circuit' AND T1.year = 2010	formula_1
SELECT COUNT(*) FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE country = "Italy"	formula_1
SELECT T2.date FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Circuit de Barcelona-Catalunya'	formula_1
SELECT T1.url FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.year = 2009 AND T2.name = "Spanish Grand Prix"	formula_1
SELECT MIN(T1.fastestLapTime) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton'	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.fastestlapspeed IS NOT NULL ORDER BY T2.fastestlapspeed DESC LIMIT 1	formula_1
SELECT T1.driverRef FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T3.name = 'Canadian Grand Prix' AND T2.position = 1	formula_1
SELECT DISTINCT T2.name FROM drivers AS T1 JOIN races AS T2 ON T1.driverid = ANY(SELECT driverid FROM results WHERE raceid = T2.raceid AND driverid = (SELECT driverid FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton'))	formula_1
SELECT T2.name FROM drivers AS T1 INNER JOIN races AS T2 ON T1.driverid = T2.winner WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton' ORDER BY T1.rank ASC LIMIT 1	formula_1
SELECT T1.fastestLapSpeed FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Spanish Grand Prix' AND T1.fastestLapSpeed IS NOT NULL ORDER BY T1.fastestLapSpeed DESC LIMIT 1	formula_1
SELECT DISTINCT YEAR FROM races WHERE raceid IN (SELECT raceid FROM constructorstandings WHERE driverid = (SELECT driverid FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton'))	formula_1
SELECT T1.positionOrder FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T1.raceId = T3.raceId WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton' AND T3.name = 'Chinese Grand Prix' ORDER BY T1.positionOrder DESC LIMIT 1	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.grid = 4 AND T2.raceid = (SELECT raceid FROM races WHERE year = 1989 AND name = 'Australian Grand Prix')	formula_1
SELECT COUNT(*) FROM races AS T1 INNER JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.year = 2008 AND T1.name = 'Australian Grand Prix' AND T2.time IS NOT NULL	formula_1
SELECT T1.fastestLap FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 1 AND T2.forename = 'Lewis' AND T2.surname = 'Hamilton'	formula_1
SELECT T1.time FROM results AS T1 INNER JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.name = 'Chinese Grand Prix' AND T1.position = 2	formula_1
SELECT T1.driverid ,  T1.surname ,  T1.forename ,  T1.nationality ,  T1.url FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 1 AND T2.position = 1	formula_1
SELECT COUNT(*) FROM drivers AS T1 JOIN constructorStandings AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = 'British' AND T2.raceId IN (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix')	formula_1
SELECT COUNT(DISTINCT T1.driverId) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Chinese Grand Prix' AND T1.position IS NOT NULL AND T1.time IS NOT NULL	formula_1
SELECT SUM(points) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton'	formula_1
SELECT AVG(T2.fastestLapTime) FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton'	formula_1
SELECT CAST(SUM(CASE WHEN T1.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.raceId) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.year = 2008 AND T2.name = 'Australian Grand Prix'	formula_1
SELECT CAST((strftime('%J', SUBSTR(T2.time, 1, INSTR(T2.time, ':') - 1)) - strftime('%J', SUBSTR(T2.fastestLapTime, 1, INSTR(T2.fastestLapTime, ':') - 1))) AS REAL) * 100 / strftime('%J', SUBSTR(T2.fastestLapTime, 1, INSTR(T2.fastestLapTime, ':') - 1)) FROM races AS T1 INNER JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.year = 2008 AND T1.name = 'Australian Grand Prix' AND T2.position = 1	formula_1
SELECT COUNT(*) FROM circuits WHERE location = 'Adelaide' AND country = 'Australia';	formula_1
SELECT lat, lng FROM circuits WHERE country = 'USA'	formula_1
SELECT COUNT(driverId) FROM drivers WHERE nationality = 'British' AND STRFTIME('%Y', dob) > '1980';	formula_1
SELECT MAX(T2.points) FROM constructors AS T1 INNER JOIN constructorStandings AS T2 ON T1.constructorid = T2.constructorid WHERE T1.nationality = 'British'	formula_1
SELECT T1.constructorId FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId ORDER BY points DESC LIMIT 1	formula_1
SELECT T1.name FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T2.raceId = 291 AND T2.points = 0	formula_1
SELECT COUNT(T1.constructorId) FROM constructors AS T1 INNER JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = 'Japanese' AND T2.points = 0 GROUP BY T1.constructorId HAVING COUNT(T2.raceId) = 2	formula_1
SELECT T1.name FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorid = T2.constructorid WHERE T2.position = 1	formula_1
SELECT COUNT(*) FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = 'French' AND T2.laps > 50;	formula_1
SELECT CAST(SUM(CASE WHEN T1.time IS NOT NULL AND T1.year BETWEEN 2007 AND 2009 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.driverID) FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverID = T2.driverID WHERE T2.nationality = 'Japanese' AND T1.year BETWEEN 2007 AND 2009	formula_1
SELECT AVG(T1.milliseconds / 1000.0) AS avg_time_seconds, T2.year FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.year < 1975 AND T1.status = 1 GROUP BY T2.year	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T1.dob > '1975-12-31' AND T2.rank = 2	formula_1
SELECT COUNT(*) FROM drivers AS T1 JOIN constructorStandings AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = 'Italian' AND T2.points = 0	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.fastestlap IS NOT NULL ORDER BY T2.fastestlaptime ASC LIMIT 1	formula_1
SELECT T1.fastestLap FROM results AS T1 INNER JOIN driverstandings AS T2 ON T1.driverid = T2.driverid WHERE T2.position = 1 AND T1.year = 2009	formula_1
SELECT AVG(T1.fastestLapSpeed) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Spanish Grand Prix' AND T1.fastestLapSpeed IS NOT NULL	formula_1
SELECT T1.name, T1.year FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T2.milliseconds IS NOT NULL ORDER BY T2.milliseconds ASC LIMIT 1	formula_1
SELECT CAST(SUM(CASE WHEN T2.year BETWEEN 2000 AND 2005 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.driverId) FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.dob < '1985-01-01' AND T2.laps > 50	formula_1
SELECT COUNT(DISTINCT driverId) FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid WHERE nationality = 'French' AND TIME < '02:00:00'	formula_1
SELECT driverRef FROM drivers WHERE nationality = 'American'	formula_1
SELECT raceId FROM races WHERE YEAR = 2009	formula_1
SELECT COUNT(*) FROM results WHERE raceId = 18;	formula_1
SELECT T1.driverId ,  COUNT(*) FROM drivers AS T1 WHERE T1.nationality = 'Dutch' AND T1.dob IN ( SELECT MIN(T2.dob) FROM drivers AS T2 ORDER BY T2.dob DESC LIMIT 3 )	formula_1
SELECT driverRef FROM drivers WHERE forename = 'Robert' AND surname = 'Kubica'	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND STRFTIME('%Y', dob) = '1980'	formula_1
SELECT T1.driverId FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid WHERE STRFTIME('%Y', T1.dob) BETWEEN '1980' AND '1990' AND T2.position = 1 GROUP BY T1.driverid ORDER BY MIN(T2.milliseconds) ASC LIMIT 3	formula_1
SELECT driverRef FROM drivers WHERE nationality = 'German' ORDER BY dob ASC LIMIT 1	formula_1
SELECT T1.driverid ,  T1.code FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE STRFTIME('%Y', T1.dob) = '1971' AND T2.fastestlaptime IS NOT NULL ORDER BY T2.fastestlaptime ASC LIMIT 1	formula_1
SELECT T1.driverid FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid WHERE T1.nationality = 'Spanish' AND STRFTIME('%Y', T1.dob) < '1982' GROUP BY T1.driverid ORDER BY max(T2.milliseconds) DESC LIMIT 10	formula_1
SELECT T1.year FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T2.fastestlaptime IS NOT NULL ORDER BY T2.fastestlaptime ASC LIMIT 1	formula_1
SELECT YEAR FROM races WHERE TIME = (SELECT MIN(TIME) FROM races)	formula_1
SELECT T1.driverId FROM results AS T1 JOIN laptimes AS T2 ON T1.raceid = T2.raceid AND T1.driverid = T2.driverid WHERE T2.lap = 1 ORDER BY T2.milliseconds ASC LIMIT 5	formula_1
SELECT COUNT(*) FROM constructorStandings AS T1 JOIN constructorResults AS T2 ON T1.constructorid = T2.constructorid WHERE T2.statusid = 2 AND T1.raceid BETWEEN 50 AND 100	formula_1
SELECT COUNT(*) ,  T1.location ,  T1.lat ,  T1.lng FROM circuits AS T1 WHERE T1.country = 'Austria'	formula_1
SELECT T1.raceId FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.time IS NOT NULL GROUP BY T1.raceId ORDER BY COUNT(*) DESC LIMIT 1	formula_1
SELECT T1.driverRef ,  T1.nationality ,  T1.dob FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.q2 IS NOT NULL AND T2.raceId = 23	formula_1
SELECT MIN(T1.year), T1.name, T1.date FROM races AS T1 JOIN qualifying AS T2 ON T1.raceid = T2.raceid WHERE T2.position = 1 ORDER BY T2.driverid, T1.date ASC LIMIT 1	formula_1
SELECT COUNT(DISTINCT T1.driverId) FROM drivers AS T1 INNER JOIN constructorStandings AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = 'American' AND T2.status = 'Puncture'	formula_1
SELECT T2.name, T2.url FROM constructorStandings AS T1 INNER JOIN constructors AS T2 ON T1.constructorid = T2.constructorid WHERE T2.nationality = 'Italian' ORDER BY T1.points DESC LIMIT 1	formula_1
SELECT T2.url FROM constructorStandings AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId GROUP BY T1.constructorId ORDER BY SUM(T1.wins) DESC LIMIT 1	formula_1
SELECT T2.driverid FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.name = 'French Grand Prix' AND T2.lap = 3 ORDER BY TIME DESC LIMIT 1	formula_1
SELECT T2.name, T1.milliseconds FROM laptimes AS T1 INNER JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T1.position = 1 ORDER BY T1.milliseconds ASC LIMIT 1	formula_1
SELECT AVG(T1.fastestLapTime) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T1.rank < 11 AND T2.name = 'United States Grand Prix' AND T2.year = 2006	formula_1
SELECT T1.driverid FROM drivers AS T1 JOIN pitstops AS T2 ON T1.driverid = T2.driverid WHERE T1.nationality = 'German' AND T1.dob BETWEEN '1980-01-01' AND '1985-12-31' GROUP BY T1.driverid ORDER BY AVG(T2.duration) ASC LIMIT 3	formula_1
SELECT T2.surname ,  T2.forename FROM races AS T1 INNER JOIN driverstandings AS T2 ON T1.raceid = T2.raceid WHERE T1.name = 'Canadian Grand Prix' AND T1.year = 2008 ORDER BY T2.position ASC LIMIT 1	formula_1
SELECT T1.constructorRef, T1.url FROM constructors AS T1 INNER JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId INNER JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T3.name = 'Singapore Grand Prix' AND T2.position = 1 ORDER BY T2.points DESC LIMIT 1	formula_1
SELECT forename, surname, dob FROM drivers WHERE nationality = 'Austrian' AND YEAR(dob) BETWEEN 1981 AND 1991	formula_1
SELECT forename, surname, url, dob FROM drivers WHERE nationality = 'German' AND STRFTIME('%Y', dob) BETWEEN '1971' AND '1985' ORDER BY dob DESC	formula_1
SELECT LOCATION, COUNTRY, LAT, LNG FROM circuits WHERE NAME = 'Hungaroring'	formula_1
SELECT T2.points, T1.name, T1.nationality FROM constructors AS T1 INNER JOIN constructorStandings AS T2 ON T1.constructorid = T2.constructorid INNER JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T3.circuitid = 6 AND T3.year BETWEEN 1980 AND 2010 ORDER BY T2.points DESC LIMIT 1	formula_1
SELECT AVG(T2.points) FROM drivers AS T1 INNER JOIN constructorStandings AS T2 ON T1.driverid = T2.driverid WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton' AND T2.positionText = '1'	formula_1
SELECT AVG(T2.round) FROM seasons AS T1 INNER JOIN races AS T2 ON T1.year = T2.year WHERE T1.year BETWEEN 2000 AND 2010	formula_1
SELECT nationality FROM drivers GROUP BY nationality ORDER BY COUNT(*) DESC LIMIT 1	formula_1
SELECT COUNT(*) FROM drivers AS T1 JOIN constructorStandings AS T2 ON T1.driverid = T2.driverid WHERE T2.position = 91 AND T2.wins > 0	formula_1
SELECT T2.name FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T1.fastestlaptime IS NOT NULL ORDER BY T1.fastestlapspeed DESC LIMIT 1	formula_1
SELECT T1.location, T1.country FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid ORDER BY T2.date DESC LIMIT 1	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T2.q3 IS NOT NULL AND T2.position = 1 AND T2.raceid IN (SELECT raceid FROM races WHERE circuitid = (SELECT circuitid FROM circuits WHERE name = 'Marina Bay Street Circuit') AND YEAR = 2008) ORDER BY T2.q3 ASC LIMIT 1	formula_1
SELECT T2.forename, T2.surname, T2.nationality, T1.name FROM races AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverid ORDER BY T2.dob DESC LIMIT 1	formula_1
SELECT COUNT(*) FROM constructorStandings AS T1 JOIN constructorResults AS T2 ON T1.constructorid = T2.constructorid WHERE T1.positiontext = 'Retired' AND T2.statusid = 3 AND T1.raceid IN (SELECT raceid FROM races WHERE name LIKE '%Canadian%')	formula_1
SELECT COUNT(T2.wins), T1.forename, T1.surname FROM drivers AS T1 INNER JOIN driverstandings AS T2 ON T1.driverid = T2.driverid WHERE T2.position = 1 ORDER BY T1.dob ASC LIMIT 1	formula_1
SELECT MAX(T1.duration) FROM pitstops AS T1	formula_1
SELECT MIN(T2.milliseconds) FROM circuits AS T1 INNER JOIN laptimes AS T2 ON T1.circuitid = T2.circuitid WHERE T2.milliseconds IS NOT NULL	formula_1
SELECT T2.driverId, T2.surname, T2.forename, MAX(T1.duration) AS longest_pit_stop FROM pitstops AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton'	formula_1
SELECT T2.lap FROM drivers AS T1 JOIN pitstops AS T2 ON T1.driverid = T2.driverid WHERE T1.forename = "Lewis" AND T1.surname = "Hamilton" AND T2.raceid IN (SELECT raceid FROM races WHERE name = "Australian Grand Prix") ORDER BY T2.milliseconds ASC LIMIT 1	formula_1
SELECT T2.driverId, T2.duration FROM races AS T1 INNER JOIN pitStops AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Australian Grand Prix' AND T1.year = 2011	formula_1
SELECT MIN(T1.time) FROM laptimes AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton'	formula_1
SELECT T2.forename, T2.surname FROM laptimes AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T1.time = (SELECT MIN(T1.time) FROM laptimes AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverid) LIMIT 1	formula_1
SELECT DISTINCT T3.position FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid JOIN constructorstandings AS T3 ON T1.driverid = T3.driverid WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton' ORDER BY T2.fastestlaptime ASC LIMIT 1	formula_1
SELECT MIN(T1.time) FROM laptimes AS T1 INNER JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.name = 'Austrian Grand Prix'	formula_1
SELECT T1.circuitid FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.country = 'Italy' ORDER BY T2.date ASC LIMIT 1	formula_1
SELECT T2.name FROM qualifying AS T1 INNER JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.name = 'Austrian Grand Prix' ORDER BY T1.q3 DESC LIMIT 1	formula_1
SELECT T1.time FROM laptimes AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.name = 'Austrian Grand Prix' AND T1.position = 1 ORDER BY T1.milliseconds ASC LIMIT 1	formula_1
SELECT lat, lng FROM circuits WHERE name = ( SELECT T2.name FROM results AS T1 JOIN circuits AS T2 ON T1.raceid = T2.circuitid WHERE T1.fastestlaptime = '1:29.488' )	formula_1
SELECT AVG(T1.milliseconds) FROM pitstops AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton'	formula_1
SELECT AVG(T2.milliseconds) FROM circuits AS T1 INNER JOIN laptimes AS T2 ON T1.circuitid = T2.circuitid WHERE T1.country = 'Italy'	formula_1
SELECT player_api_id FROM Player_Attributes ORDER BY overall_rating DESC LIMIT 1	european_football_2
SELECT player_name FROM Player WHERE height = (SELECT MAX(height) FROM Player)	european_football_2
SELECT preferred_foot FROM Player_Attributes WHERE potential = ( SELECT MIN(potential) FROM Player_Attributes )	european_football_2
SELECT COUNT(T1.player_api_id) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.overall_rating BETWEEN 60 AND 65 AND T2.defensive_work_rate = 'Low'	european_football_2
SELECT T2.player_api_id FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.crossing IS NOT NULL ORDER BY T1.crossing DESC LIMIT 5	european_football_2
SELECT T1.name FROM League AS T1 INNER JOIN Match AS T2 ON T1.id = T2.league_id WHERE T2.season = '2015/2016' GROUP BY T1.id ORDER BY SUM(T2.home_team_goal + T2.away_team_goal) DESC LIMIT 1	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id WHERE T2.season = '2015/2016' AND T2.home_team_goal < T2.away_team_goal GROUP BY T1.team_long_name ORDER BY COUNT(*) ASC LIMIT 1	european_football_2
SELECT T2.player_name FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id GROUP BY T2.player_name ORDER BY SUM(T1.penalties) DESC LIMIT 10	european_football_2
SELECT T3.team_long_name FROM Match AS T1 INNER JOIN Team AS T2 ON T1.away_team_api_id = T2.team_api_id INNER JOIN Team AS T3 ON T1.home_team_api_id = T3.team_api_id WHERE T1.season = '2009/2010' AND T1.away_team_goal > T1.home_team_goal ORDER BY T1.away_team_goal - T1.home_team_goal DESC LIMIT 1	european_football_2
SELECT T1.buildUpPlaySpeed FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id ORDER BY T1.buildUpPlaySpeed DESC LIMIT 4	european_football_2
SELECT T3.name FROM Match AS T1 INNER JOIN League AS T3 ON T1.league_id = T3.id WHERE T1.season = '2015/2016' AND T1.home_team_goal = T1.away_team_goal GROUP BY T3.name ORDER BY COUNT(*) DESC LIMIT 1	european_football_2
SELECT T2.player_name ,  STRFTIME('%Y', 'now') - STRFTIME('%Y', T2.birthday) AS age FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.sprint_speed >= 97 AND STRFTIME('%Y', T1.date) BETWEEN '2013' AND '2015'	european_football_2
SELECT T2.name ,  COUNT(T1.league_id) FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id GROUP BY T1.league_id ORDER BY COUNT(T1.league_id) DESC LIMIT 1	european_football_2
SELECT AVG(height) FROM Player WHERE birthday BETWEEN '1990-01-01 00:00:00' AND '1995-12-31 23:59:59'	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE date LIKE '2010%' AND overall_rating > (SELECT AVG(overall_rating) FROM Player_Attributes WHERE date LIKE '2010%') ORDER BY overall_rating DESC LIMIT 1	european_football_2
SELECT team_fifa_api_id FROM Team_Attributes WHERE buildUpPlaySpeed > 50 AND buildUpPlaySpeed < 60	european_football_2
SELECT T1.team_long_name FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE strftime('%Y', T2.date) = '2012' AND T2.buildUpPlayPassing > ( SELECT AVG(buildUpPlayPassing) FROM Team_Attributes WHERE strftime('%Y', date) = '2012' )	european_football_2
SELECT CAST(SUM(CASE WHEN preferred_foot = 'left' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(player_fifa_api_id) FROM Player WHERE birthday LIKE '%198%' OR birthday LIKE '%199%';	european_football_2
SELECT T2.name FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id GROUP BY T2.name ORDER BY SUM(T1.home_team_goal + T1.away_team_goal) ASC LIMIT 5	european_football_2
SELECT AVG(T2.long_shots) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Ahmed Samir Farag'	european_football_2
SELECT T.player_name FROM Player AS T WHERE T.height > 180 GROUP BY T.player_name ORDER BY AVG(T.heading_accuracy) DESC LIMIT 10	european_football_2
SELECT T1.team_long_name FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlayDribblingClass = 'Normal' AND T2.date LIKE '2014%' GROUP BY T1.id HAVING AVG(T2.chanceCreationPassing) > T2.chanceCreationPassing ORDER BY T2.chanceCreationPassing DESC	european_football_2
SELECT T2.name FROM `Match` AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.season = '2009/2010' GROUP BY T1.league_id HAVING AVG(T1.home_team_goal) > AVG(T1.away_team_goal)	european_football_2
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers'	european_football_2
SELECT player_name FROM Player WHERE birthday LIKE '1970-10-%'	european_football_2
SELECT T2.attacking_work_rate FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Franco Zennaro'	european_football_2
SELECT T1.buildUpPlayPositioningClass FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_long_name = 'ADO Den Haag' ORDER BY T1.date DESC LIMIT 1	european_football_2
SELECT T2.heading_accuracy FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Francois Affolter' AND T2.date = '2014-09-18 00:00:00'	european_football_2
SELECT T2.overall_rating FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Gabriel Tamas' AND strftime('%Y', T2.date) = '2011'	european_football_2
SELECT COUNT(*) FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T2.name = 'Scotland Premier League' AND T1.season = '2015/2016'	european_football_2
SELECT T1.preferred_foot FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T1.birthday DESC LIMIT 1	european_football_2
SELECT Player.player_api_id FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id ORDER BY Player_Attributes.potential DESC LIMIT 1	european_football_2
SELECT COUNT(*) FROM Player WHERE weight < 130 AND preferred_foot = 'left'	european_football_2
SELECT T1.team_short_name FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.chanceCreationPassingClass = 'Risky'	european_football_2
SELECT T2.defensive_work_rate FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'David Wilson' ORDER BY T2.date DESC LIMIT 1	european_football_2
SELECT T2.birthday FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T1.overall_rating DESC LIMIT 1	european_football_2
SELECT T1.name FROM League AS T1 INNER JOIN Country AS T2 ON T1.country_id = T2.id WHERE T2.name = 'Netherlands'	european_football_2
SELECT AVG(T1.home_team_goal) FROM Match AS T1 INNER JOIN Country AS T2 ON T1.country_id = T2.id WHERE T2.name = 'Poland' AND T1.season = '2010/2011'	european_football_2
SELECT P.player_api_id FROM Player AS P JOIN Player_Attributes AS PA ON P.player_api_id = PA.player_api_id WHERE PA.date IN ((SELECT date FROM Player_Attributes ORDER BY date DESC LIMIT 1), (SELECT date FROM Player_Attributes ORDER BY date ASC LIMIT 1)) GROUP BY P.player_api_id ORDER BY AVG(PA.finishing) DESC LIMIT 1	european_football_2
SELECT player_name FROM Player WHERE height > 180;	european_football_2
SELECT COUNT(id) FROM Player WHERE strftime('%Y', birthday) > '1990'	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Adam%' AND weight > 170	european_football_2
SELECT DISTINCT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.overall_rating > 80 AND strftime('%Y', T2.date) BETWEEN '2008' AND '2010'	european_football_2
SELECT T1.potential FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Aaron Doran'	european_football_2
SELECT player_api_id FROM Player WHERE preferred_foot = 'left'	european_football_2
SELECT T1.team_long_name FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeedClass = 'Fast'	european_football_2
SELECT T2.buildUpPlayPassingClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_short_name = 'CLB' ORDER BY T2.date DESC LIMIT 1	european_football_2
SELECT T1.team_short_name FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlayPassing > 70	european_football_2
SELECT AVG(T2.overall_rating) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE strftime('%Y', T2.date) BETWEEN '2010' AND '2015' AND T1.height > 170	european_football_2
SELECT player_name FROM Player WHERE height = (SELECT MIN(height) FROM Player);	european_football_2
SELECT T1.id FROM Country AS T1 INNER JOIN League AS T2 ON T1.id = T2.country_id WHERE T2.name = 'Italy Serie A'	european_football_2
SELECT T1.team_short_name FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeed = 31 AND T2.buildUpPlayDribbling = 53 AND T2.buildUpPlayPassing = 32	european_football_2
SELECT AVG(T2.overall_rating) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Aaron Doran'	european_football_2
SELECT COUNT(*) FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T2.name = 'Germany 1. Bundesliga' AND strftime('%Y-%m', T1.date) BETWEEN '2008-08' AND '2008-10'	european_football_2
SELECT T1.team_short_name FROM Team AS T1 INNER JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id WHERE T2.home_team_goal = 10	european_football_2
SELECT T1.player_api_id FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.balance = (SELECT MAX(balance) FROM Player_Attributes WHERE potential = 61) AND T2.potential = 61	european_football_2
SELECT AVG(CASE WHEN T1.player_name = 'Abdou Diallo' THEN T2.ball_control ELSE 0 END) - AVG(CASE WHEN T1.player_name = 'Aaron Appindangoye' THEN T2.ball_control ELSE 0 END) AS diff FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id	european_football_2
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN'	european_football_2
SELECT T1.player_name FROM Player AS T1 WHERE T1.player_name IN ('Aaron Lennon', 'Abdelaziz Barrada') ORDER BY T1.birthday ASC LIMIT 1	european_football_2
SELECT player_name FROM Player WHERE height = (SELECT MAX(height) FROM Player)	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE preferred_foot = 'left' AND attacking_work_rate = 'low'	european_football_2
SELECT T1.id FROM Country AS T1 INNER JOIN League AS T2 ON T1.id = T2.country_id WHERE T2.name = 'Belgium Jupiler League'	european_football_2
SELECT T2.id FROM Country AS T1 INNER JOIN League AS T2 ON T1.id = T2.country_id WHERE T1.name = 'Germany'	european_football_2
SELECT T1.player_api_id FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.overall_rating DESC LIMIT 1	european_football_2
SELECT COUNT(DISTINCT T1.player_api_id) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE strftime('%Y', T1.birthday) < '1986' AND T2.defensive_work_rate = 'High'	european_football_2
SELECT T2.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone') ORDER BY T2.crossing DESC LIMIT 1	european_football_2
SELECT T1.heading_accuracy FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Ariel Borysiuk'	european_football_2
SELECT COUNT(T2.player_api_id) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.height > 180 AND T2.volleys > 70	european_football_2
SELECT DISTINCT P.player_name FROM Player AS P JOIN Player_Attributes AS PA ON P.player_api_id = PA.player_api_id WHERE PA.volleys > 70 AND PA.dribbling > 70	european_football_2
SELECT COUNT(*) FROM Match AS T1 INNER JOIN Country AS T2 ON T1.country_id = T2.id WHERE T2.name = 'Belgium' AND T1.season = '2008/2009'	european_football_2
SELECT T1.long_passing FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.birthday IS NOT NULL ORDER BY T2.birthday ASC LIMIT 1	european_football_2
SELECT COUNT(*) FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T2.name = 'Belgium Jupiler League' AND SUBSTR(T1.date, 1, 7) = '2009-04'	european_football_2
SELECT T2.name FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.season = '2008/2009' GROUP BY T2.name ORDER BY COUNT(T1.id) DESC LIMIT 1	european_football_2
SELECT AVG(T2.overall_rating) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE strftime('%Y', T1.birthday) < '1986'	european_football_2
SELECT ((P1.overall_rating - P2.overall_rating) / P2.overall_rating * 100) AS percentage_increase FROM Player AS P1 JOIN Player_Attributes AS PA1 ON P1.player_api_id = PA1.player_api_id JOIN Player AS P2 ON P2.player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Paulin Puel') WHERE P1.player_name = 'Ariel Borysiuk'	european_football_2
SELECT AVG(T2.buildUpPlaySpeed) FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Heart of Midlothian'	european_football_2
SELECT AVG(T2.overall_rating) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Pietro Marino'	european_football_2
SELECT SUM(T1.crossing) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Aaron Lennox'	european_football_2
SELECT T1.chanceCreationPassing, T1.chanceCreationPassingClass FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_long_name = 'Ajax' ORDER BY T1.chanceCreationPassing DESC LIMIT 1	european_football_2
SELECT preferred_foot FROM Player WHERE player_name = 'Abdou Diallo'	european_football_2
SELECT T1.overall_rating FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Dorlan Pabon' ORDER BY T1.overall_rating DESC LIMIT 1	european_football_2
SELECT AVG(T2.away_team_goal) FROM Team AS T1 INNER JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id WHERE T1.team_long_name = 'Parma' AND T2.country_id = (SELECT id FROM Country WHERE name = 'Italy')	european_football_2
SELECT P.player_name FROM Player AS P JOIN Player_Attributes AS PA ON P.player_api_id = PA.player_api_id WHERE PA.overall_rating = 77 AND PA.date LIKE '2016-06-23%' ORDER BY P.birthday ASC LIMIT 1	european_football_2
SELECT T2.overall_rating FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Aaron Mooy' AND T2.date LIKE '2016-02-04%'	european_football_2
SELECT T2.potential FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Francesco Parravicini' AND T2.date = '2010-08-30 00:00:00'	european_football_2
SELECT T2.attacking_work_rate FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Francesco Migliore' AND T2.date LIKE '2015-05-01%'	european_football_2
SELECT T2.defensive_work_rate FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Kevin Berigaud' AND T2.date = '2013-02-22 00:00:00'	european_football_2
SELECT T2.date FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Kevin Constant' ORDER BY T2.crossing DESC LIMIT 1	european_football_2
SELECT T2.buildUpPlaySpeedClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Willem II' AND T2.date = '2011-02-22'	european_football_2
SELECT T1.buildUpPlayDribblingClass FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_short_name = 'LEI' AND T1.date = '2015-09-10 00:00:00'	european_football_2
SELECT T2.buildUpPlayPassingClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'FC Lorient' AND T2.date LIKE '2010-02-22%'	european_football_2
SELECT T1.chance_creation_passing_class FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_long_name = 'PEC Zwolle' AND T1.date = '2013-09-20 00:00:00'	european_football_2
SELECT T2.chance_creation_crossing_class FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Hull City' AND T2.date = '2010-02-22 00:00:00'	european_football_2
SELECT T1.defenceAggressionClass FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_long_name = 'Hannover 96' AND T1.date LIKE '2015-09-10%'	european_football_2
SELECT AVG(T2.overall_rating) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Marko Arnautovic' AND T2.date LIKE '%/%/07%' OR T2.date LIKE '%/%/16%'	european_football_2
SELECT CAST((T1.overall_rating - T2.overall_rating) AS REAL) * 100 / T1.overall_rating FROM Player_Attributes AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.date = '2013-07-12' AND T2.date = '2013-07-12' AND T1.player_name = 'Landon Donovan' AND T2.player_name = 'Jordan Bowery'	european_football_2
SELECT player_name FROM Player ORDER BY height DESC LIMIT 1	european_football_2
SELECT player_api_id FROM Player WHERE weight IS NOT NULL ORDER BY weight DESC LIMIT 10	european_football_2
SELECT player_name FROM Player WHERE strftime('%Y', 'now') - strftime('%Y', birthday) >= 35	european_football_2
SELECT SUM(home_team_goal) FROM Match AS T1 JOIN Player AS T2 ON T1.home_player_1 = T2.player_api_id WHERE T2.player_name = 'Aaron Lennon'	european_football_2
SELECT SUM(T1.away_team_goal) FROM Match AS T1 INNER JOIN Player AS T2 ON T2.player_api_id = T1.away_player_1 WHERE T2.player_name = 'Daan Smith' OR T2.player_name = 'Filipe Ferreira'	european_football_2
SELECT SUM(T1.home_team_goal) FROM Match AS T1 INNER JOIN Player AS T2 ON T1.home_player_1 = T2.player_api_id WHERE strftime('%Y', 'now') - strftime('%Y', T2.birthday) <= 30	european_football_2
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)	european_football_2
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.potential DESC LIMIT 1	european_football_2
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.attacking_work_rate = 'High'	european_football_2
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.finishing = 1 ORDER BY T1.birthday ASC LIMIT 1	european_football_2
SELECT DISTINCT T2.player_name FROM Team AS T1 INNER JOIN Player AS T2 ON T1.team_api_id = T2.player_api_id WHERE T1.team_long_name IN ( SELECT team_long_name FROM Team WHERE team_long_name LIKE '%Belgium%' )	european_football_2
SELECT DISTINCT P.player_name, C.name FROM Player AS P JOIN Player_Attributes AS PA ON P.player_api_id = PA.player_api_id JOIN Team AS T ON P.player_api_id IN (T.home_player_1, T.home_player_2, T.home_player_3, T.home_player_4, T.home_player_5, T.home_player_6, T.home_player_7, T.home_player_8, T.home_player_9, T.home_player_10, T.home_player_11, T.away_player_1, T.away_player_2, T.away_player_3, T.away_player_4, T.away_player_5, T.away_player_6, T.away_player_7, T.away_player_8, T.away_player_9, T.away_player_10, T.away_player_11) JOIN Country AS C ON T.country_id = C.id WHERE PA.vision > 89	european_football_2
SELECT T2.id FROM Player AS T1 INNER JOIN Country AS T2 ON T1.player_api_id = T2.id GROUP BY T2.name ORDER BY AVG(T1.weight) DESC LIMIT 1	european_football_2
SELECT T1.team_long_name FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeedClass = 'Slow' LIMIT 1	european_football_2
SELECT T1.team_short_name FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.chanceCreationPassingClass = 'Safe' LIMIT 1	european_football_2
SELECT AVG(T2.height) FROM Player AS T1 INNER JOIN Team AS T2 ON T1.player_api_id = T2.team_api_id WHERE T2.team_long_name LIKE '%Italy%'	european_football_2
SELECT player_name FROM Player WHERE height > 180 ORDER BY player_name ASC LIMIT 3	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND birthday > '1990'	european_football_2
SELECT (SELECT jumping FROM Player_Attributes WHERE player_api_id = 6) - (SELECT jumping FROM Player_Attributes WHERE player_api_id = 23) AS difference	european_football_2
SELECT T1.player_api_id FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.preferred_foot = 'right' ORDER BY T2.potential ASC LIMIT 5	european_football_2
SELECT COUNT(T1.player_api_id) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.crossing = ( SELECT MAX(crossing) FROM Player_Attributes ) AND T2.preferred_foot = 'left'	european_football_2
SELECT CAST(SUM(CASE WHEN T2.strength > 80 AND T2.stamina > 80 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Player_Attributes AS T2	european_football_2
SELECT T2.name FROM Match AS T1 INNER JOIN Country AS T2 ON T1.country_id = T2.id WHERE T1.league_id = 4769	european_football_2
SELECT T1.home_team_goal, T1.away_team_goal FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.date LIKE '2008-09-24%' AND T2.name = 'Belgium Jupiler League'	european_football_2
SELECT T2.sprint_speed, T2.agility, T2.acceleration FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Alexis Blin' AND T2.date = (SELECT MAX(date) FROM Player_Attributes WHERE player_api_id = T1.player_api_id)	european_football_2
SELECT T1.buildUpPlaySpeedClass FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_long_name = 'KSV Cercle Brugge'	european_football_2
SELECT COUNT(*) FROM Match WHERE season = '2015/2016' AND league_id IN ( SELECT id FROM League WHERE name = 'Italy Serie A' )	european_football_2
SELECT MAX(T1.home_team_goal) FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T2.name = 'Netherlands Eredivisie'	european_football_2
SELECT T2.finishing ,  T2.curve FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.weight = ( SELECT MAX(weight) FROM Player )	european_football_2
SELECT T2.id, T2.name FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.season = '2015/2016' GROUP BY T2.id ORDER BY COUNT(T1.id) DESC LIMIT 4	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id GROUP BY T1.id ORDER BY SUM(T2.away_team_goal) DESC LIMIT 1	european_football_2
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)	european_football_2
SELECT CAST(SUM(CASE WHEN T2.height < 180 AND T2.overall_rating > 70 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.id) FROM Player AS T2 INNER JOIN Player_Attributes AS T1 ON T1.player_api_id = T2.player_api_id	european_football_2
SELECT SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END), CAST(SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / (SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) + SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END)) FROM Patient WHERE SEX = 'M'	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN SUBSTR(SEX, 1, 1) = 'F' AND STRFTIME('%Y', Birthday) > '1930' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(ID) FROM Patient	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(ID) FROM Patient WHERE Birthday BETWEEN '1930-01-01' AND '1940-12-31'	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END) FROM Patient WHERE Diagnosis = 'SLE'	thrombosis_prediction
SELECT T1.Diagnosis, T2.Date FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.ID = 30609	thrombosis_prediction
SELECT T1.SEX, T1.Birthday, T2.`Examination Date`, T2.Symptoms FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.ID = 163109	thrombosis_prediction
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.LDH > 500	thrombosis_prediction
SELECT T1.ID ,  STRFTIME('%Y', CURRENT_TIMESTAMP) - STRFTIME('%Y', T2.Birthday) AS Age FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.RVVT = '+' AND T2.Birthday IS NOT NULL	thrombosis_prediction
SELECT T1.ID, T1.SEX, T1.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Thrombosis = 2	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T1.Birthday) = '1937' AND T2.`T-CHO` >= 250	thrombosis_prediction
SELECT T1.ID, T1.SEX, T1.Diagnosis FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.ALB < 3.5	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T1.SEX = 'F' AND (T2.TP < 6.0 OR T2.TP > 8.5) THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.TP IS NOT NULL	thrombosis_prediction
SELECT AVG(T2.`aCL IgG`) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '+' AND STRFTIME('%Y', CURRENT_TIMESTAMP) - STRFTIME('%Y', T1.Birthday) >= '50'	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND STRFTIME('%Y', T1.Description) = '1997' AND T1.Admission = '-'	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.First_Date IS NOT NULL AND T1.Birthday IS NOT NULL ORDER BY strftime('%Y', T1.First_Date) - strftime('%Y', T1.Birthday) ASC LIMIT 1	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`Thrombosis` = 1 AND T1.SEX = 'F' AND strftime('%Y', T2.`Examination Date`) = '1997'	thrombosis_prediction
SELECT MAX(STRFTIME('%Y', Birthday)) - MIN(STRFTIME('%Y', Birthday)) AS AgeGap FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE TG >= 200);	thrombosis_prediction
SELECT T2.Symptoms, T2.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Symptoms IS NOT NULL ORDER BY T1.Birthday DESC LIMIT 1	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T2.SEX = 'M' THEN 1 ELSE 0 END) AS REAL) / 12 FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Date BETWEEN '1998-01-01' AND '1998-12-31'	thrombosis_prediction
SELECT strftime('%Y', T1.`First Date`) - strftime('%Y', T2.Birthday), min(T1.Date) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis LIKE '%SJS%'	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T1.SEX = 'M' AND T2.UA <= 8 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T1.SEX = 'F' AND T2.UA <= 6.5 THEN 1 ELSE 0 END) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.UA IS NOT NULL	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T2.`Examination Date`) - STRFTIME('%Y', T1.`First Date`) >= 1	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T1.Birthday) < '1990' AND STRFTIME('%Y', T2.`Examination Date`) BETWEEN '1990' AND '1993'	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.`T-BIL` >= 2.0	thrombosis_prediction
SELECT Diagnosis FROM Examination WHERE `Examination Date` BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY Diagnosis ORDER BY COUNT(*) DESC LIMIT 1	thrombosis_prediction
SELECT AVG(STRFTIME('%Y', '1999') - STRFTIME('%Y', T2.Birthday)) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Date BETWEEN '1991-10-01' AND '1991-10-30'	thrombosis_prediction
SELECT T2.age ,  T1.Diagnosis FROM Examination AS T1 INNER JOIN ( SELECT ID ,  strftime('%Y', T1.`Examination Date`) - strftime('%Y', T2.Birthday) AS age FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID ) AS T2 ON T1.ID = T2.ID ORDER BY T2.age DESC LIMIT 1	thrombosis_prediction
SELECT T1.ANA FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.`Examination Date` = '1996-12-02' AND T2.ID = 3605340	thrombosis_prediction
SELECT CASE WHEN T2.T-CHO < 250 THEN 'Normal' ELSE 'Abnormal' END AS Cholesterol_Status FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Date = '1995-09-04' AND T1.ID = 2927464	thrombosis_prediction
SELECT T2.SEX FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis LIKE '%AORTITIS%' ORDER BY T1.First_Date ASC LIMIT 1	thrombosis_prediction
SELECT T1.`aCL IgM` FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Description = '1994-02-19' AND T1.`Examination Date` = '1993-11-12' AND T2.Diagnosis = 'SLE'	thrombosis_prediction
SELECT T2.SEX FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Date = '1992-06-12' AND T1.GPT = 9	thrombosis_prediction
SELECT strftime('%Y', '1991-10-21') - strftime('%Y', T2.Birthday) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Date = '1991-10-21' AND T1.UA = 8.4	thrombosis_prediction
SELECT COUNT(T2.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.`First Date` = '1991-06-13' AND T1.Diagnosis = 'SJS' AND strftime('%Y', T2.Date) = '1995'	thrombosis_prediction
SELECT DISTINCT T2.Diagnosis FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Examination_Date = '1997-01-27' AND T2.First_Date < '1997-01-27' ORDER BY T2.First_Date ASC LIMIT 1	thrombosis_prediction
SELECT T1.Symptoms FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Birthday = '1959-03-01' AND T1.`Examination Date` = '1993-09-27'	thrombosis_prediction
SELECT (SUM(CASE WHEN T2.Birthday = '1959-02-18' AND T1.Date LIKE '1981-12-%' THEN T1.`T-CHO` ELSE 0 END) - SUM(CASE WHEN T2.Birthday = '1959-02-18' AND T1.Date LIKE '1981-11-%' THEN T1.`T-CHO` ELSE 0 END)) / SUM(CASE WHEN T2.Birthday = '1959-02-18' AND T1.Date LIKE '1981-11-%' THEN T1.`T-CHO` ELSE 0 END) AS DecreaseRate FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis LIKE '%Behcet%' AND T1.Description BETWEEN '1997-01-01' AND '1997-12-31'	thrombosis_prediction
SELECT L.ID FROM Laboratory AS L JOIN Examination AS E ON L.ID = E.ID WHERE L.Date BETWEEN '1987-07-06' AND '1996-01-31' AND L.GPT > 30 AND L.ALB < 4	thrombosis_prediction
SELECT ID FROM Patient WHERE YEAR(Birthday) = 1964 AND SEX = 'F' AND Admission = '+' ORDER BY ID	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Thrombosis = 2 AND T1.ANA = 'S' AND T1.`aCL IgM` > (SELECT AVG(`aCL IgM`) * 1.2 FROM Examination WHERE Thrombosis = 2 AND ANA = 'S')	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T2.UA <= 6.5 THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T2.`U-PRO` > 0 AND T2.`U-PRO` < 30 THEN 1 ELSE 0 END) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.`U-PRO` IS NOT NULL AND T2.UA IS NOT NULL	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T1.DIAGNOSIS = 'BEHCET' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.ID) FROM Patient AS T1 WHERE T1.SEX = 'M' AND STRFTIME('%Y', T1.`First Date`) = '1981'	thrombosis_prediction
SELECT DISTINCT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '-' AND T2.Date LIKE '1991-10%' AND T2.T_BIL IS NOT NULL AND T2.T_BIL < 2.0	thrombosis_prediction
SELECT COUNT(DISTINCT T2.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`ANA Pattern` != 'P' AND T1.SEX = 'F' AND STRFTIME('%Y', T1.Birthday) BETWEEN '1980' AND '1989'	thrombosis_prediction
SELECT T1.SEX FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T2.Diagnosis = 'PSS' AND T3.CRP > 2 AND T3.CRE = 1 AND T3.LDH = 123	thrombosis_prediction
SELECT AVG(T2.ALB) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND T2.PLT > 400 AND T1.Diagnosis = 'SLE'	thrombosis_prediction
SELECT Symptoms FROM Examination WHERE Diagnosis = 'SLE' GROUP BY Symptoms ORDER BY COUNT(*) DESC LIMIT 1	thrombosis_prediction
SELECT T2.Description, T2.Diagnosis FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.ID = 48473 ORDER BY T2.Description ASC LIMIT 1	thrombosis_prediction
SELECT COUNT(ID) FROM Patient WHERE SEX = 'F' AND Diagnosis = 'APS'	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T1.`Examination Date`) = '1997' AND (T2.TP IS NOT NULL AND (T2.TP < 6 OR T2.TP > 8.5))	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T1.Diagnosis LIKE '%SLE%' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.ID) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Symptoms LIKE '%thrombocytopenia%'	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN T2.SEX = 'F' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T1.Birthday) = '1980' AND T2.Diagnosis = 'RA'	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.`Examination Date` BETWEEN '1995-01-01' AND '1997-12-31' AND T2.Diagnosis LIKE '%Behcet%' AND T1.Admission = '-'	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND T2.WBC < 3.5	thrombosis_prediction
SELECT DATEDIFF(T1.`Examination Date`, T2.`First Date`) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.ID = 821298	thrombosis_prediction
SELECT CASE WHEN UA IS NOT NULL AND ((UA > 8.0 AND SEX = 'M') OR (UA > 6.5 AND SEX = 'F')) THEN 'Yes' ELSE 'No' END AS UricAcidNormalRange FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.ID = 57266	thrombosis_prediction
SELECT T1.Date FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.ID = 48473 AND T1.GOT >= 60 ORDER BY T1.Date ASC LIMIT 1	thrombosis_prediction
SELECT T1.SEX, T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GOT IS NOT NULL AND T2.Date LIKE '1994%' AND T2.GOT < 60	thrombosis_prediction
SELECT DISTINCT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.GPT >= 60	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GPT > 60 ORDER BY T1.Birthday ASC	thrombosis_prediction
SELECT AVG(T2.LDH) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.LDH IS NOT NULL AND T2.LDH < 500	thrombosis_prediction
SELECT T1.ID, (strftime('%Y', 'now') - strftime('%Y', T1.Birthday)) AS Age FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.LDH BETWEEN 600 AND 800	thrombosis_prediction
SELECT T2.admission FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.ALP BETWEEN 0 AND 300	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Birthday = '1982-04-01' AND T2.ALP IS NOT NULL AND T2.ALP < 300	thrombosis_prediction
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.TP < 6.0	thrombosis_prediction
SELECT T2.ID, T2.TP - 8.5 AS Deviation FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.SEX = 'F' AND T2.First_Date IS NOT NULL AND T1.TP > 8.5	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND (T2.ALB <= 3.5 OR T2.ALB >= 5.5) ORDER BY T1.Birthday DESC	thrombosis_prediction
SELECT T2.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T1.Birthday) = '1982' AND T2.ALB BETWEEN 3.5 AND 5.5	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN UA > 8.0 AND SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(SEX) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.SEX = 'F'	thrombosis_prediction
SELECT AVG(T2.UA) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.UA IS NOT NULL AND ((T1.SEX = 'M' AND T2.UA < 8.0) OR (T1.SEX = 'F' AND T2.UA < 6.5))	thrombosis_prediction
SELECT ID, SEX, Birthday FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE UN = 29)	thrombosis_prediction
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'RA' AND T2.UN < 30	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.CRE >= 1.5	thrombosis_prediction
SELECT SUM(CASE WHEN T1.SEX = 'M' AND T2.CRE >= 1.5 THEN 1 ELSE 0 END) > SUM(CASE WHEN T1.SEX = 'F' AND T2.CRE >= 1.5 THEN 1 ELSE 0 END) AS result FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID	thrombosis_prediction
SELECT T2.ID, T2.SEX, T2.Birthday FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID ORDER BY T1.`T-BIL` DESC LIMIT 1	thrombosis_prediction
SELECT GROUP_CONCAT(DISTINCT T2.ID), T1.SEX FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.T_BIL >= 2.0 AND T1.T_BIL IS NOT NULL GROUP BY T1.SEX	thrombosis_prediction
SELECT T1.ID, T2.T-CHO FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.T-CHO IS NOT NULL ORDER BY T1.Birthday ASC, T2.T-CHO DESC LIMIT 1	thrombosis_prediction
SELECT AVG(DATE_PART('year', AGE(CURRENT_DATE, Birthday))) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.`T-CHO` >= 250	thrombosis_prediction
SELECT T1.ID, T1.Diagnosis FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.TG > 300	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.TG >= 200 AND STRFTIME('%Y', CURRENT_TIMESTAMP) - STRFTIME('%Y', T1.Birthday) > 50	thrombosis_prediction
SELECT DISTINCT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.CPK < 250 AND T1.Admission = '-'	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T1.Birthday) BETWEEN '1936' AND '1956' AND T1.SEX = 'M' AND T2.CPK >= 250	thrombosis_prediction
SELECT T1.ID, T1.SEX, STRFTIME('%Y', CURRENT_TIMESTAMP) - STRFTIME('%Y', T1.Birthday) AS Age FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GLU >= 180 AND T2.T-CHO < 250	thrombosis_prediction
SELECT T1.ID, T2.GLU FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T1.Description) = '1991' AND T2.GLU IS NOT NULL AND T2.GLU < 180	thrombosis_prediction
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.WBC <= 3.5 OR T2.WBC >= 9.0 GROUP BY T1.SEX ORDER BY TIMESTAMPDIFF(YEAR, T1.Birthday, CURRENT_DATE) ASC	thrombosis_prediction
SELECT P.ID, strftime('%Y', 'now') - strftime('%Y', P.Birthday) AS Age FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.RBC IS NOT NULL AND L.RBC < 3.5	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND STRFTIME('%Y', CURRENT_TIMESTAMP) - STRFTIME('%Y', T1.Birthday) >= 50 AND (T2.RBC <= 3.5 OR T2.RBC >= 6.0) AND T1.Admission = '+'	thrombosis_prediction
SELECT DISTINCT T1.ID, T1.SEX FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '-' AND T2.HGB < 10;	thrombosis_prediction
SELECT T1.ID, T1.SEX FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'SLE' AND T1.Birthday IS NOT NULL AND T1.Birthday != '' AND T1.HGB BETWEEN 10 AND 17 ORDER BY T1.Birthday ASC LIMIT 1	thrombosis_prediction
SELECT T1.ID, T1.age FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.HCT >= 52 GROUP BY T1.ID HAVING COUNT(T1.ID) > 2	thrombosis_prediction
SELECT AVG(T2.HCT) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Date LIKE '1991%' AND T2.HCT < 29	thrombosis_prediction
SELECT SUM(CASE WHEN T2.PLT < 100 THEN 1 ELSE 0 END) - SUM(CASE WHEN T2.PLT > 400 THEN 1 ELSE 0 END) AS calculation FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.PLT IS NOT NULL	thrombosis_prediction
SELECT DISTINCT T1.ID FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T1.Date) = '1984' AND (STRFTIME('%Y', CURRENT_TIMESTAMP) - STRFTIME('%Y', T2.Birthday)) < 50 AND T1.PLT BETWEEN 100 AND 400	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T2.SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.ID) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE strftime('%Y', 'now') - strftime('%Y', T2.Birthday) > 55 AND T1.PT >= 14	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T1.`First Date`) > '1992' AND T2.PT < 14	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE `Examination Date` > '1997-01-01' AND APTT IS NOT NULL AND APTT >= 45;	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.APTT > 45 AND T1.Thrombosis = 0	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.WBC BETWEEN 3.5 AND 9.0 AND (T2.FG <= 150 OR T2.FG >= 450)	thrombosis_prediction
SELECT COUNT(DISTINCT T2.ID) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Birthday > '1980-01-01' AND T1.FG IS NOT NULL AND T1.FG < 150 OR T1.FG > 450	thrombosis_prediction
SELECT DISTINCT T2.Diagnosis FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.`U-PRO` >= 30	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.`U-PRO` > 0 AND T2.`U-PRO` < 30 AND T1.Diagnosis = 'SLE'	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 WHERE T1.`aCL IgG` > 2000	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.`aCL IgG` BETWEEN 900 AND 2000 AND T1.Symptoms IS NOT NULL	thrombosis_prediction
SELECT T1.ID, T1.Diagnosis FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.aCL IgA BETWEEN 80 AND 500 ORDER BY T2.aCL IgA DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`aCL IgA` BETWEEN 80 AND 500 AND STRFTIME('%Y', T1.`First Date`) >= '1990'	thrombosis_prediction
SELECT Diagnosis FROM Examination WHERE aCL IgM <= 40 OR aCL IgM >= 400 GROUP BY Diagnosis ORDER BY COUNT(*) DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT T2.ID) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.CRP = '+' AND T2.Description IS NULL	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.CRE >= 1.5 AND TIMESTAMPDIFF(YEAR, T2.Birthday, CURDATE()) < 70	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.KCT = '+' AND T1.RA LIKE '-%' OR T1.RA LIKE '%+-%'	thrombosis_prediction
SELECT DISTINCT T1.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE YEAR(T1.Birthday) >= 1985 AND T2.RA IN ('-', '+-')	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.RF < 20 AND STRFTIME('%Y', 'now') - STRFTIME('%Y', T1.Birthday) > 60	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.RF < 20 AND T1.Thrombosis = 0	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.C3 > 35 AND T1.ANA_Pattern = 'P'	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`aCL IgA` IS NOT NULL AND T1.HCT NOT BETWEEN 29 AND 52 ORDER BY T2.`aCL IgA` DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis LIKE '%APS%' AND COALESCE(T2.C4, 0) >= 10	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.RNP IN ('-', '+-') AND T2.Admission = '+'	thrombosis_prediction
SELECT T2.Birthday FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.RNP NOT IN ('-', '+-') ORDER BY T2.Birthday DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`aCL IgG` IS NOT NULL AND T2.`aCL IgM` IS NOT NULL AND T2.ANA IS NOT NULL AND T2.`ANA Pattern` IS NOT NULL AND T2.`aCL IgA` IS NOT NULL AND T2.Diagnosis IS NOT NULL AND T2.KCT IS NOT NULL AND T2.RVVT IS NOT NULL AND T2.LAC IS NOT NULL AND T2.Symptoms IS NOT NULL AND T2.Thrombosis = 0 AND T2.`aCL IgG` BETWEEN 0 AND 1.5 AND T2.`aCL IgM` BETWEEN 0 AND 1.5 AND T2.ANA BETWEEN 0 AND 32 AND T2.`aCL IgA` BETWEEN 0 AND 2 AND T2.Diagnosis LIKE '%SLE%' OR Diagnosis LIKE '%SjS%' AND T2.SM IN ('-', '+-')	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.SM NOT IN ('negative', '0') ORDER BY T1.Birthday DESC LIMIT 3	thrombosis_prediction
SELECT DISTINCT T1.ID FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.`Examination Date` > '1997-01-01' AND (T2.SC170 IS NULL OR T2.SC170 IN ('negative', '0'))	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Symptoms IS NULL AND T1.SEX = 'F' AND T2.SC170 IN ('negative', '0')	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.`First Date` < '2000-01-01' AND T2.SSA IN ('-', '+')	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.SSA NOT IN ('negative', '0') ORDER BY T1.`First Date` ASC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'SLE' AND T1.`SSB` IN ('-', '+-')	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.SSB IN ('negative', '0') AND T2.Symptoms IS NOT NULL	thrombosis_prediction
SELECT COUNT(DISTINCT T2.ID) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.CENTROMEA IN('-', '+-') AND T1.SSB IN('-', '+-') AND T2.SEX = 'M'	thrombosis_prediction
SELECT T1.Diagnosis FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.DNA >= 8	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.DNA < 8 AND T1.Description IS NULL	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.IGG BETWEEN 900 AND 2000 AND T1.Admission = '+'	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T2.GOT >= 60 THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T2.GOT IS NOT NULL THEN 1 ELSE 0 END), CAST(SUM(CASE WHEN T2.GOT >= 60 AND T1.Diagnosis = 'SLE' THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T2.GOT IS NOT NULL THEN 1 ELSE 0 END) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.GOT IS NOT NULL AND T2.GOT < 60	thrombosis_prediction
SELECT T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GOT >= 60 ORDER BY T1.Birthday DESC LIMIT 1	thrombosis_prediction
SELECT T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GPT < 60 ORDER BY T2.GPT DESC LIMIT 3	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.GOT IS NOT NULL AND T2.GOT < 60	thrombosis_prediction
SELECT T2.`First Date` FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.LDH IS NOT NULL AND T1.LDH < 500 ORDER BY T1.LDH DESC LIMIT 1	thrombosis_prediction
SELECT T1.`First Date` FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.LDH >= 500 ORDER BY T1.`First Date` DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.ALP >= 300 AND T1.Admission = '+'	thrombosis_prediction
SELECT COUNT(*) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '-' AND T2.ALP < 300;	thrombosis_prediction
SELECT DISTINCT T2.Diagnosis FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.TP < 6.0	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'SJS' AND T1.TP BETWEEN 6.0 AND 8.5	thrombosis_prediction
SELECT T1.`Examination Date` FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.ALB BETWEEN 3.5 AND 5.5 ORDER BY T2.ALB DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.ALB BETWEEN 3.5 AND 5.5 AND T2.TP BETWEEN 6.0 AND 8.5	thrombosis_prediction
SELECT T1.`aCL IgG`, T1.`aCL IgM`, T1.`aCL IgA` FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.SEX = 'F' AND T1.UA IS NOT NULL AND T1.UA > 6.50 ORDER BY T1.UA DESC LIMIT 1	thrombosis_prediction
SELECT MAX(T2.ANA) FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.CRE < 1.5	thrombosis_prediction
SELECT T1.ID FROM Laboratory AS T1 WHERE T1.CRE < 1.5 AND T1.aCL_IgA = (SELECT MAX(aCL_IgA) FROM Laboratory WHERE aCL_IgA IS NOT NULL)	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.`T-BIL` >= 2.0 AND T1.`ANA Pattern` LIKE '%P%'	thrombosis_prediction
SELECT T1.ANA FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.`T-BIL` < 2.0 ORDER BY T2.`T-BIL` DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.T-CHO >= 250 AND T1.KCT = '-'	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.ANA_Pattern = 'P' AND T2.T_CHO < 250	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.TG < 200 AND T1.Symptoms IS NOT NULL	thrombosis_prediction
SELECT T2.Diagnosis FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.TG < 200 ORDER BY T1.TG DESC LIMIT 1	thrombosis_prediction
SELECT ID FROM Examination WHERE Thrombosis = 0 AND CPK < 250	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.CPK < 250 AND (T1.KCT = '+' OR T1.RVVT = '+' OR T1.LAC = '+')	thrombosis_prediction
SELECT T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GLU > 180 ORDER BY T1.Birthday ASC LIMIT 1	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.GLU < 180 AND T1.Thrombosis = 0	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '+' AND T2.WBC BETWEEN 3.5 AND 9.0	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'SLE' AND T2.WBC BETWEEN 3.5 AND 9.0	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.RBC IS NOT NULL AND (T2.RBC <= 3.5 OR T2.RBC >= 6.0) AND T1.Admission = '-'	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.PLT BETWEEN 100 AND 400 AND T1.Diagnosis IS NOT NULL	thrombosis_prediction
SELECT T2.PLT FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'MCTD' AND T2.PLT BETWEEN 100 AND 400	thrombosis_prediction
SELECT AVG(T2.PT) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.PT < 14	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Thrombosis IN (1, 2) AND T2.PT < 14	thrombosis_prediction
SELECT T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Angela' AND T1.last_name = 'Sanders'	student_club
SELECT COUNT(*) FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.college = 'College of Engineering' AND T1.position = 'Member';	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.department = 'Art and Design' AND T1.position = 'Student'	student_club
SELECT COUNT(T1.link_to_member) FROM attendance AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'Women''s Soccer'	student_club
SELECT T2.phone FROM attendance AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id INNER JOIN event AS T3 ON T1.link_to_event = T3.event_id WHERE T3.event_name = 'Women''s Soccer' AND T2.position = 'Student'	student_club
SELECT COUNT(*) FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'Women''s Soccer' AND T1.t_shirt_size = 'Medium'	student_club
SELECT T1.event_name FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event GROUP BY T1.event_id ORDER BY COUNT(T2.link_to_event) DESC LIMIT 1	student_club
SELECT T1.college FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.position = 'Vice President'	student_club
SELECT T1.event_name FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T3.first_name = 'Maya' AND T3.last_name = 'Mclean'	student_club
SELECT COUNT(*) FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event INNER JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T3.first_name = 'Sacha' AND T3.last_name = 'Harrison' AND STRFTIME('%Y', T1.event_date) = '2019'	student_club
SELECT COUNT(T1.event_id) FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.type = 'Meeting' GROUP BY T1.event_id HAVING COUNT(T2.link_to_member) > 10	student_club
SELECT T1.event_name FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.type != 'Fundraiser' GROUP BY T1.event_id HAVING COUNT(T2.link_to_event) > 20	student_club
SELECT CAST(COUNT(event_id) AS REAL) / COUNT(DISTINCT event_name) FROM event WHERE type = 'Meeting' AND STRFTIME('%Y', event_date) = '2020'	student_club
SELECT expense_description FROM expense WHERE cost = (SELECT MAX(cost) FROM expense)	student_club
SELECT COUNT(T2.member_id) FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T1.major_name = 'Environmental Engineering'	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'Laugh Out Loud'	student_club
SELECT T1.last_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Law and Constitutional Studies'	student_club
SELECT T1.county FROM zip_code AS T1 INNER JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T2.first_name = 'Sherri' AND T2.last_name = 'Ramsey'	student_club
SELECT T3.college FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id INNER JOIN zip_code AS T3 ON T1.zip = T3.zip_code WHERE T1.first_name = 'Tyler' AND T1.last_name = 'Hewitt'	student_club
SELECT SUM(amount) FROM income WHERE link_to_member IN (SELECT member_id FROM member WHERE position = 'Vice President')	student_club
SELECT SUM(T2.spent) FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'September Meeting' AND T2.category = 'Food'	student_club
SELECT T1.city, T1.state FROM zip_code AS T1 INNER JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T2.position = 'President' LIMIT 1	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T2.state = 'IL'	student_club
SELECT SUM(T1.spent) FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'September Meeting' AND T1.category = 'Advertisement'	student_club
SELECT T2.department FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Pierce' AND T1.last_name = 'Guidi'	student_club
SELECT SUM(T2.amount) FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'October Speaker'	student_club
SELECT T1.approved FROM expense AS T1 INNER JOIN attendance AS T2 ON T1.link_to_member = T2.link_to_member WHERE T2.link_to_event IN ( SELECT event_id FROM event WHERE event_name = 'October Meeting' AND event_date LIKE '2019-10-08%' )	student_club
SELECT AVG(T2.cost) FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T1.first_name = 'Elijah' AND T1.last_name = 'Allen' AND STRFTIME('%m', T2.expense_date) IN ('09', '10')	student_club
SELECT SUM(CASE WHEN strftime('%Y', T1.event_date) = '2019' THEN T2.spent ELSE 0 END) - SUM(CASE WHEN strftime('%Y', T1.event_date) = '2020' THEN T2.spent ELSE 0 END) AS difference FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event	student_club
SELECT T1.location FROM event AS T1 WHERE T1.event_name = 'Spring Budget Review'	student_club
SELECT T2.cost FROM event AS T1 INNER JOIN expense AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_date LIKE '2019-09-04%' AND T2.expense_description = 'Posters'	student_club
SELECT T1.remaining FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Food' AND T1.amount = (SELECT MAX(amount) FROM budget WHERE category = 'Food')	student_club
SELECT notes FROM income WHERE date_received = '2019-09-14' AND source = 'Fundraising'	student_club
SELECT COUNT(major_id) FROM major WHERE college = 'College of Humanities and Social Sciences'	student_club
SELECT phone FROM member WHERE first_name = 'Carlo' AND last_name = 'Jacobs'	student_club
SELECT T2.county FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Adela' AND T1.last_name = 'O''Gallagher'	student_club
SELECT COUNT(*) FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'November Meeting' AND T1.remaining < 0	student_club
SELECT SUM(T1.amount) FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'September Speaker'	student_club
SELECT T2.event_status FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id WHERE T1.expense_date = '2019-08-20' AND T1.expense_description = 'Post Cards, Posters'	student_club
SELECT T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Brent' AND T1.last_name = 'Thomason'	student_club
SELECT COUNT(*) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.college = 'School of Business' AND T1.t_shirt_size = 'Medium'	student_club
SELECT T1.type FROM zip_code AS T1 INNER JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T2.first_name = 'Christof' AND T2.last_name = 'Nielsen'	student_club
SELECT T1.major_name FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.position = 'Vice President'	student_club
SELECT T2.state FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Sacha' AND T1.last_name = 'Harrison'	student_club
SELECT T2.department FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'President'	student_club
SELECT T1.date_received FROM income AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Connor' AND T2.last_name = 'Hilton' AND T1.source = 'Dues'	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T2.source = 'Dues' ORDER BY T2.date_received ASC LIMIT 1	student_club
SELECT CAST(SUM(CASE WHEN T2.event_name = 'Yearly Kickoff' THEN T1.amount ELSE 0 END) AS REAL) / SUM(CASE WHEN T2.event_name = 'October Meeting' THEN T1.amount ELSE 0 END) FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Advertisement' AND T2.status = 'Closed'	student_club
SELECT CAST(SUM(CASE WHEN T2.category = 'Parking' THEN T1.amount ELSE 0 END) AS REAL) * 100 / COUNT(T1.event_name = 'November Speaker') FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'November Speaker' AND T2.category IS NOT NULL AND T1.status IS NOT NULL	student_club
SELECT SUM(T1.cost) FROM expense AS T1 WHERE T1.expense_description = 'Pizza'	student_club
SELECT COUNT(T1.city) FROM zip_code AS T1 WHERE T1.county = 'Orange County' AND T1.state = 'Virginia'	student_club
SELECT department FROM major WHERE college = 'College of Humanities and Social Sciences'	student_club
SELECT T2.city, T2.county, T2.state FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Amy' AND T1.last_name = 'Firth'	student_club
SELECT T2.expense_description FROM budget AS T1 INNER JOIN expense AS T2 ON T1.budget_id = T2.link_to_budget ORDER BY T1.remaining ASC LIMIT 1	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member WHERE T2.link_to_event IN (SELECT event_id FROM event WHERE event_name = 'October Meeting')	student_club
SELECT T1.college FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major GROUP BY T1.college ORDER BY COUNT(T1.college) DESC LIMIT 1	student_club
SELECT T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.phone = '809-555-3360'	student_club
SELECT T1.event_name FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event ORDER BY T2.amount DESC LIMIT 1	student_club
SELECT T2.expense_description FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T1.position = 'Vice President'	student_club
SELECT COUNT(*) FROM attendance AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'Women''s Soccer'	student_club
SELECT T1.date_received FROM income AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Casey' AND T2.last_name = 'Mason'	student_club
SELECT COUNT(*) FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T2.state = 'MD';	student_club
SELECT COUNT(T2.link_to_event) FROM member AS T1 INNER JOIN attendance AS T2 ON T1.member_id = T2.link_to_member WHERE T1.phone = '954-555-6240'	student_club
SELECT T2.first_name, T2.last_name FROM major AS T1 INNER JOIN member AS T2 ON T2.link_to_major = T1.major_id WHERE T1.department = 'School of Applied Sciences, Technology and Education'	student_club
SELECT T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.status = 'Closed' ORDER BY T2.spent / T2.amount DESC LIMIT 1	student_club
SELECT COUNT(member_id) FROM member WHERE position = 'President'	student_club
SELECT spent FROM budget ORDER BY spent DESC LIMIT 1	student_club
SELECT COUNT(*) FROM event WHERE type = 'Meeting' AND STRFTIME('%Y', event_date) = '2020'	student_club
SELECT SUM(spent) FROM budget WHERE category = 'Food'	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member GROUP BY T1.member_id HAVING COUNT(T2.link_to_event) > 7	student_club
SELECT T3.first_name, T3.last_name FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id INNER JOIN member AS T3 ON T3.member_id IN (SELECT link_to_member FROM attendance WHERE link_to_event = T2.event_id) INNER JOIN major AS T4 ON T4.major_id = T3.link_to_major WHERE T2.event_name = 'Community Theater' AND T4.major_name = 'Interior Design'	student_club
SELECT T.first_name, T.last_name FROM member AS T JOIN zip_code AS Z ON T.zip = Z.zip_code WHERE Z.city = 'Georgetown' AND Z.state = 'South Carolina'	student_club
SELECT SUM(amount) FROM income AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Grant' AND T2.last_name = 'Gilmour'	student_club
SELECT T.first_name, T.last_name FROM member AS T JOIN income AS I ON T.member_id = I.link_to_member WHERE I.amount > 40	student_club
SELECT SUM(T2.cost) FROM event AS T1 INNER JOIN expense AS T2 ON T2.link_to_event = T1.event_id WHERE T1.event_name = 'Yearly Kickoff'	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'Yearly Kickoff' AND T3.status = 'Planning' LIMIT 1	student_club
SELECT T1.first_name, T1.last_name, T2.source FROM member AS T1 JOIN income AS T2 ON T1.member_id = T2.link_to_member GROUP BY T1.member_id ORDER BY SUM(T2.amount) DESC LIMIT 1	student_club
SELECT T1.event_name FROM event AS T1 JOIN expense AS T2 ON T1.event_id = T2.link_to_event ORDER BY T2.cost ASC LIMIT 1	student_club
SELECT CAST(SUM(CASE WHEN T2.event_name = 'Yearly Kickoff' THEN T1.cost ELSE 0 END) AS REAL) * 100 / SUM(T1.cost) FROM expense AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id	student_club
SELECT CAST(SUM(CASE WHEN T1.major_name = 'Finance' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T1.major_name = 'Physics' THEN 1 ELSE 0 END) FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major	student_club
SELECT source FROM income WHERE date_received LIKE '2019-09-%' GROUP BY source ORDER BY SUM(amount) DESC LIMIT 1	student_club
SELECT first_name, last_name, email FROM member WHERE position = 'Secretary'	student_club
SELECT COUNT(T2.member_id) FROM major AS T1 INNER JOIN member AS T2 ON T2.link_to_major = T1.major_id WHERE T1.major_name = 'Physics Teaching'	student_club
SELECT COUNT(T1.link_to_member) FROM attendance AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'Community Theater' AND STRFTIME('%Y', T2.event_date) = '2019'	student_club
SELECT COUNT(T2.link_to_event), T3.major_name FROM member AS T1 INNER JOIN attendance AS T2 ON T1.member_id = T2.link_to_member INNER JOIN major AS T3 ON T1.link_to_major = T3.major_id WHERE T1.first_name = 'Luisa' AND T1.last_name = 'Guidi'	student_club
SELECT AVG(T1.spent) FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Food' AND T2.status = 'Closed'	student_club
SELECT T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Advertisement' ORDER BY T2.spent DESC LIMIT 1	student_club
SELECT CASE WHEN T2.first_name = 'Maya' AND T2.last_name = 'Mclean' THEN 'Yes' ELSE 'No' END AS attended FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event INNER JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T1.event_name = 'Women''s Soccer'	student_club
SELECT CAST(SUM(CASE WHEN type = 'Community Service' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(event_id) FROM event WHERE event_date LIKE '2019%'	student_club
SELECT T1.cost FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T1.expense_description = 'Posters' AND T3.event_name = 'September Speaker'	student_club
SELECT t_shirt_size FROM member WHERE t_shirt_size IS NOT NULL GROUP BY t_shirt_size ORDER BY COUNT(t_shirt_size) DESC LIMIT 1	student_club
SELECT T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.status = 'Closed' AND T2.remaining < 0 ORDER BY T2.remaining ASC LIMIT 1	student_club
SELECT T1.type, SUM(T1.cost) FROM expense AS T1 JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'October Meeting' AND T1.approved = 'true'	student_club
SELECT T2.category FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'April Speaker' GROUP BY T2.category ORDER BY T2.amount ASC	student_club
SELECT budget_id FROM budget WHERE category = 'Food' ORDER BY amount DESC LIMIT 1	student_club
SELECT budget_id FROM budget WHERE category = 'Advertisement' ORDER BY amount DESC LIMIT 3	student_club
SELECT SUM(cost) FROM expense WHERE expense_description = 'Parking'	student_club
SELECT SUM(cost) FROM expense WHERE expense_date = '2019-08-20'	student_club
SELECT T1.first_name, T1.last_name, SUM(T2.cost) FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T1.member_id = 'rec4BLdZHS2Blfp4v'	student_club
SELECT T1.expense_description FROM expense AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Sacha' AND T2.last_name = 'Harrison'	student_club
SELECT T1.expense_description FROM expense AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.t_shirt_size = 'X-Large'	student_club
SELECT DISTINCT T1.zip FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.cost < 50	student_club
SELECT T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Phillip' AND T1.last_name = 'Cullen'	student_club
SELECT DISTINCT T1.position FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Business'	student_club
SELECT COUNT(*) FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Business' AND T1.t_shirt_size = 'Medium'	student_club
SELECT DISTINCT T1.type FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.remaining > 30	student_club
SELECT DISTINCT type FROM event WHERE location = 'MU 215'	student_club
SELECT T1.category FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_date = '2020-03-24T12:00:00'	student_club
SELECT T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Vice President'	student_club
SELECT CAST(COUNT(CASE WHEN T2.position = 'Member' AND T1.major_name = 'Business' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.major_id) FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major	student_club
SELECT DISTINCT T1.category FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.location = 'MU 215' AND T1.event_status = 'Closed'	student_club
SELECT COUNT(*) FROM income WHERE amount = 50	student_club
SELECT COUNT(*) FROM member WHERE t_shirt_size = 'X-Large' AND position = 'Member'	student_club
SELECT COUNT(*) FROM major AS T1 JOIN department AS T2 ON T1.department = T2.department_name WHERE T1.college = 'College of Agriculture and Applied Sciences' AND T2.department_name = 'School of Applied Sciences, Technology and Education'	student_club
SELECT T1.last_name ,  T3.department ,  T3.college FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id INNER JOIN major AS T3 ON T2.department = T3.department WHERE T2.major_name = 'Environmental Engineering'	student_club
SELECT T1.category FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.location = 'MU 215' AND T2.type = 'Guest Speaker' AND T1.spent = 0	student_club
SELECT DISTINCT T2.city, T2.state FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.position = 'Member' AND T1.link_to_major IN ( SELECT major_id FROM major WHERE department = 'Electrical and Computer Engineering Department' )	student_club
SELECT T1.event_name FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T3.position = 'Vice President' AND T1.location = '900 E. Washington St.' AND T1.type = 'Social' LIMIT 1	student_club
SELECT T1.last_name, T1.position FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.expense_date = '2019-09-10' AND T2.expense_description = 'Pizza'	student_club
SELECT T1.last_name FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'Women''s Soccer' AND T1.position = 'Member'	student_club
SELECT CAST(SUM(CASE WHEN T2.amount = 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.member_id) FROM member AS T1 INNER JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T1.t_shirt_size = 'Medium' AND T1.position = 'Member'	student_club
SELECT DISTINCT T2.county FROM zip_code AS T1 INNER JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T1.type = 'PO Box'	student_club
SELECT DISTINCT T1.zip FROM zip_code AS T1 JOIN major AS T2 ON T1.zip_code = T2.major_id WHERE T2.department = 'San Juan Municipio' AND T1.state = 'Puerto Rico' AND T1.type = 'PO Box'	student_club
SELECT event_name FROM event WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20'	student_club
SELECT T1.link_to_event FROM budget AS T1 JOIN expense AS T2 ON T1.budget_id = T2.link_to_budget WHERE T2.cost > 50	student_club
SELECT T2.first_name, T2.last_name, T1.link_to_event FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.approved = 'true' AND T1.expense_date BETWEEN '2019-01-10' AND '2019-11-19'	student_club
SELECT T1.college FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Katy' AND T2.link_to_major = 'rec1N0upiVLy5esTO'	student_club
SELECT T1.phone FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.college = 'College of Agriculture and Applied Sciences' AND T2.major_name = 'Business'	student_club
SELECT T2.email FROM income AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.date_received BETWEEN '2019-09-10' AND '2019-11-19' AND T1.amount > 20	student_club
SELECT COUNT(T1.member_id) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.college = 'College of Education & Human Services' AND T1.position = 'Member'	student_club
SELECT CAST(SUM(CASE WHEN T2.remaining < 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.event_id) FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.remaining IS NOT NULL	student_club
SELECT event_id, location, status FROM event WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31'	student_club
SELECT expense_id FROM expense GROUP BY expense_id HAVING AVG(cost) > 50	student_club
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large'	student_club
SELECT CAST(SUM(CASE WHEN type = 'PO Box' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(zip_code) FROM zip_code	student_club
SELECT T1.event_name ,  T1.location FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.remaining > 0	student_club
SELECT T1.event_name, T1.event_date FROM event AS T1 JOIN expense AS T2 ON T1.event_id = T2.link_to_event WHERE T2.expense_description = 'Pizza' AND T2.cost BETWEEN 50 AND 100	student_club
SELECT T1.first_name, T1.last_name, T3.major_name FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member INNER JOIN major AS T3 ON T1.link_to_major = T3.major_id WHERE T2.cost > 100	student_club
SELECT T2.city, T2.county FROM income AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code GROUP BY T1.link_to_member HAVING COUNT(T1.income_id) > 40	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.event_id IN ( SELECT link_to_event FROM expense GROUP BY link_to_event HAVING COUNT(link_to_event) > 1 ) GROUP BY T1.member_id ORDER BY SUM(T2.cost) DESC LIMIT 1	student_club
SELECT AVG(T2.cost) FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T1.position != 'Member'	student_club
SELECT T1.event_name FROM event AS T1 JOIN expense AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Parking' AND T2.cost < ( SELECT AVG(cost) FROM expense WHERE category = 'Parking' )	student_club
SELECT CAST(SUM(CASE WHEN T1.type = 'Meeting' THEN T2.cost ELSE 0 END) AS REAL) * 100 / COUNT(T1.event_id) FROM event AS T1 INNER JOIN expense AS T2 ON T1.event_id = T2.link_to_event WHERE T2.approved = 'true' AND T1.status != 'Closed'	student_club
SELECT T2.budget_id FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id WHERE T1.expense_description = 'Water, chips, cookies' ORDER BY T1.cost DESC LIMIT 1	student_club
SELECT M.first_name, M.last_name FROM member AS M JOIN expense AS E ON M.member_id = E.link_to_member GROUP BY M.member_id ORDER BY SUM(E.cost) DESC LIMIT 5	student_club
SELECT M.first_name, M.last_name, M.phone FROM member AS M JOIN expense AS E ON M.member_id = E.link_to_member WHERE E.cost > (SELECT AVG(cost) FROM expense)	student_club
SELECT (SUM(CASE WHEN T2.state = 'New Jersey' THEN 1 ELSE 0 END) / COUNT(T2.position = 'Member') * 100) - (SUM(CASE WHEN T2.state = 'Vermont' THEN 1 ELSE 0 END) / COUNT(T2.position = 'Member') * 100) AS diff_percentage FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T2.state IN ('New Jersey', 'Vermont') AND T1.position = 'Member'	student_club
SELECT T1.major_name, T1.department FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Garrett' AND T2.last_name = 'Gerke'	student_club
SELECT T1.first_name, T1.last_name, SUM(T2.cost) FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.expense_description = 'Water, Veggie tray, supplies'	student_club
SELECT T1.last_name, T1.phone FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Elementary Education'	student_club
SELECT T2.category, T2.amount FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'January Speaker'	student_club
SELECT T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Food'	student_club
SELECT T1.first_name, T1.last_name, T2.amount FROM member AS T1 INNER JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T2.date_received = '2019-09-09'	student_club
SELECT T2.category FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id WHERE T1.expense_description = 'Posters'	student_club
SELECT T1.first_name, T1.last_name, T3.college FROM member AS T1 INNER JOIN major AS T3 ON T1.link_to_major = T3.major_id WHERE T1.position = 'Secretary'	student_club
SELECT SUM(T2.spent), T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Speaker Gifts'	student_club
SELECT T2.city FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Garrett' AND T1.last_name = 'Gerke'	student_club
SELECT T.first_name, T.last_name, T.position FROM member AS T JOIN zip_code AS Z ON T.zip = Z.zip_code WHERE Z.city = 'Lincolnton' AND Z.state = 'North Carolina' AND T.zip = 28092	student_club
SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Premium'	debit_card_specializing
SELECT CAST(SUM(IIF(T1.Currency = 'EUR', 1, 0)) AS REAL) / SUM(IIF(T1.Currency = 'CZK', 1, 0)) FROM customers AS T1	debit_card_specializing
SELECT T1.CustomerID FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date BETWEEN '201201' AND '201212' AND T1.Segment = 'LAM' ORDER BY T2.Consumption ASC LIMIT 1	debit_card_specializing
SELECT AVG(T2.Consumption)/12 FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'SME' AND T2.Date BETWEEN '201301' AND '201312'	debit_card_specializing
SELECT T1.CustomerID FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Currency = 'CZK' AND STRFTIME('%Y%m', T2.Date) BETWEEN '201101' AND '201112' GROUP BY T1.CustomerID ORDER BY SUM(T2.Amount) DESC LIMIT 1	debit_card_specializing
SELECT COUNT(CustomerID) FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'KAM' AND T2.Date BETWEEN '201201' AND '201212' AND T2.Consumption < 30000	debit_card_specializing
SELECT SUM(CASE WHEN T1.Currency = 'CZK' THEN T2.Consumption ELSE 0 END) - SUM(CASE WHEN T1.Currency = 'EUR' THEN T2.Consumption ELSE 0 END) AS difference FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date BETWEEN '201201' AND '201212'	debit_card_specializing
SELECT strftime('%Y', T2.Date) FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Currency = 'EUR' GROUP BY strftime('%Y', T2.Date) ORDER BY SUM(T2.Amount) DESC LIMIT 1	debit_card_specializing
SELECT Segment FROM customers WHERE CustomerID IN (SELECT CustomerID FROM yearmonth GROUP BY CustomerID ORDER BY SUM(Consumption) ASC LIMIT 1)	debit_card_specializing
SELECT T2.Date FROM transactions_1k AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Currency = 'CZK' GROUP BY T2.Date ORDER BY SUM(T2.Consumption) DESC LIMIT 1	debit_card_specializing
SELECT T1.Date FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Segment = 'SME' AND T1.Date BETWEEN '201301' AND '201312' ORDER BY T1.Consumption DESC LIMIT 1	debit_card_specializing
SELECT AVG(CASE WHEN T1.Segment = 'SME' THEN T2.Consumption END), AVG(CASE WHEN T1.Segment = 'LAM' THEN T2.Consumption END), AVG(CASE WHEN T1.Segment = 'KAM' THEN T2.Consumption END) FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date BETWEEN '201301' AND '201312'	debit_card_specializing
SELECT T2.Segment ,  ((T3.Consumption - T2.Consumption) / T3.Consumption) * 100 AS Increase FROM yearmonth AS T2 INNER JOIN customers AS T1 ON T1.CustomerID = T2.CustomerID INNER JOIN yearmonth AS T3 ON T3.CustomerID = T2.CustomerID AND T3.Date LIKE '2013%' WHERE T1.Currency = 'EUR' GROUP BY T2.Segment ORDER BY Increase DESC LIMIT 1	debit_card_specializing
SELECT SUM(Consumption) FROM yearmonth WHERE CustomerID = 6 AND Date BETWEEN '201308' AND '201311'	debit_card_specializing
SELECT SUM(CASE WHEN T1.Country = 'CZE' THEN 1 ELSE 0 END) - SUM(CASE WHEN T1.Country = 'SVK' THEN 1 ELSE 0 END) AS DiscountDifference FROM gasstations AS T1 WHERE T1.Segment LIKE '%discount%'	debit_card_specializing
SELECT (T1.Consumption - (SELECT Consumption FROM yearmonth WHERE CustomerID = 5 AND Date = '201304')) AS Difference FROM yearmonth AS T1 WHERE T1.CustomerID = 7 AND T1.Date = '201304'	debit_card_specializing
SELECT SUM(CASE WHEN C.Currency = 'CZK' THEN 1 ELSE 0 END) - SUM(CASE WHEN C.Currency = 'EUR' THEN 1 ELSE 0 END) AS Difference FROM customers AS C JOIN transactions_1k AS T ON C.CustomerID = T.CustomerID WHERE C.Segment = 'SME'	debit_card_specializing
SELECT T1.CustomerID FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM' AND T1.Currency = 'EUR' AND T2.Date = '201310' ORDER BY T2.Consumption DESC LIMIT 1	debit_card_specializing
SELECT T1.CustomerID, SUM(T2.Amount) AS TotalSpent FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'KAM' GROUP BY T1.CustomerID ORDER BY TotalSpent DESC LIMIT 1	debit_card_specializing
SELECT SUM(T2.Consumption) FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'KAM' AND T2.Date = '201305'	debit_card_specializing
SELECT CAST(SUM(CASE WHEN T1.Consumption > 46.73 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.CustomerID) FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Segment = 'LAM'	debit_card_specializing
SELECT Country ,  COUNT(*) FROM gasstations WHERE Segment = 'Value for money' GROUP BY Country ORDER BY COUNT(*) DESC LIMIT 1	debit_card_specializing
SELECT CAST(SUM(CASE WHEN T1.Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'KAM'	debit_card_specializing
SELECT CAST(SUM(CASE WHEN Consumption > 528.3 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(CustomerID) FROM yearmonth WHERE Date LIKE '201202%'	debit_card_specializing
SELECT CAST(SUM(CASE WHEN Segment = 'Premium' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM gasstations WHERE Country = 'SVK'	debit_card_specializing
SELECT CustomerID FROM transactions_1k WHERE Date LIKE '2013-09-%' GROUP BY CustomerID ORDER BY SUM(Amount) DESC LIMIT 1	debit_card_specializing
SELECT T2.Segment FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date LIKE '201309%' ORDER BY T1.Consumption ASC LIMIT 1	debit_card_specializing
SELECT T1.CustomerID FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '201206' AND T1.Segment = 'SME' ORDER BY T2.Consumption ASC LIMIT 1	debit_card_specializing
SELECT Consumption FROM yearmonth WHERE Date LIKE '2012%' ORDER BY Consumption DESC LIMIT 1	debit_card_specializing
SELECT T1.CustomerID FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Currency = 'EUR' GROUP BY T1.CustomerID ORDER BY SUM(T1.Consumption) DESC LIMIT 1	debit_card_specializing
SELECT DISTINCT T3.Description FROM transactions_1k AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID INNER JOIN products AS T3 ON T1.ProductID = T3.ProductID WHERE strftime('%Y%m', T2.Date) = '201309'	debit_card_specializing
SELECT DISTINCT T1.Country FROM gasstations AS T1 INNER JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE strftime('%Y%m', T2.Date) = '201306'	debit_card_specializing
SELECT DISTINCT T2.ChainID FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Currency = 'EUR'	debit_card_specializing
SELECT DISTINCT T1.Description FROM products AS T1 INNER JOIN transactions_1k AS T2 ON T1.ProductID = T2.ProductID WHERE T2.Currency = 'EUR'	debit_card_specializing
SELECT AVG(Price) FROM transactions_1k WHERE Date LIKE '2012-01%'	debit_card_specializing
SELECT COUNT(DISTINCT T1.CustomerID) FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Currency = 'EUR' AND T2.Consumption > 1000	debit_card_specializing
SELECT DISTINCT T3.Description FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID INNER JOIN products AS T3 ON T1.ProductID = T3.ProductID WHERE T2.Country = 'CZE'	debit_card_specializing
SELECT DISTINCT Time FROM transactions_1k WHERE GasStationID IN ( SELECT GasStationID FROM gasstations WHERE ChainID = 11 )	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE' AND T1.Price > 1000	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE' AND T1.Date > '2012-01-01'	debit_card_specializing
SELECT AVG(T1.Price) FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE'	debit_card_specializing
SELECT AVG(T1.Price) FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Currency = 'EUR'	debit_card_specializing
SELECT CustomerID FROM transactions_1k WHERE Date = '2012-08-25' ORDER BY Amount DESC LIMIT 1	debit_card_specializing
SELECT T2.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-25' ORDER BY T1.TransactionID ASC LIMIT 1	debit_card_specializing
SELECT T1.Currency FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '2012-08-24' AND T2.Time = '16:25:00'	debit_card_specializing
SELECT Segment FROM customers WHERE CustomerID = (SELECT CustomerID FROM transactions_1k WHERE Date = '2012-08-23' AND Time = '21:20:00')	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date = '2012-08-26' AND T1.Time < '13:00:00' AND T2.Currency = 'CZK'	debit_card_specializing
SELECT Segment FROM customers WHERE CustomerID = (SELECT MIN(CustomerID) FROM customers)	debit_card_specializing
SELECT T2.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-24' AND T1.Time = '12:42:00'	debit_card_specializing
SELECT ProductID FROM transactions_1k WHERE Date = '2012-08-23' AND Time = '21:20:00'	debit_card_specializing
SELECT T2.Date, T2.Amount FROM transactions_1k AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date = '2012-08-24' AND T1.Amount = 124.05 AND T2.Date LIKE '201201%'	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-26' AND T1.Time BETWEEN '08:00:00' AND '09:00:00' AND T2.Country = 'CZE'	debit_card_specializing
SELECT DISTINCT T1.Currency FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date LIKE '%201306%' AND T2.Amount = 214582.17	debit_card_specializing
SELECT T2.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.CardID = 667467	debit_card_specializing
SELECT T1.Country FROM gasstations AS T1 INNER JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Date = '2012-08-24' AND T2.Amount = 548.4	debit_card_specializing
SELECT CAST(SUM(CASE WHEN Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(CustomerID) FROM customers WHERE Date LIKE '2012-08-25%'	debit_card_specializing
SELECT (T3.Consumption - T4.Consumption) / T3.Consumption FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID INNER JOIN yearmonth AS T3 ON T2.CustomerID = T3.CustomerID AND T3.Date LIKE '2012%' INNER JOIN yearmonth AS T4 ON T2.CustomerID = T4.CustomerID AND T4.Date LIKE '2013%' WHERE T1.Date = '2012-08-25' AND T1.Amount = 634.8	debit_card_specializing
SELECT T1.GasStationID FROM gasstations AS T1 INNER JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID GROUP BY T1.GasStationID ORDER BY SUM(T2.Amount) DESC LIMIT 1	debit_card_specializing
SELECT CAST(SUM(CASE WHEN Segment = 'Premium' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM gasstations WHERE Country = 'SVK'	debit_card_specializing
SELECT SUM(Amount) FROM transactions_1k WHERE CustomerID = 38508 AND Date LIKE '201201%'	debit_card_specializing
SELECT T2.Description FROM transactions_1k AS T1 INNER JOIN products AS T2 ON T1.ProductID = T2.ProductID GROUP BY T2.Description ORDER BY SUM(T1.Amount) DESC LIMIT 5	debit_card_specializing
SELECT C.CustomerID, AVG(T.Price), C.Currency FROM customers AS C JOIN transactions_1k AS T ON C.CustomerID = T.CustomerID GROUP BY C.CustomerID ORDER BY SUM(T.Amount) DESC LIMIT 1	debit_card_specializing
SELECT T2.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.ProductID = 2 ORDER BY T1.Price DESC LIMIT 1	debit_card_specializing
SELECT DISTINCT T1.CustomerID FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.ProductID = 5 AND T1.Price / T1.Amount > 29.00 AND strftime('%Y%m', T1.Date) = '201208'	debit_card_specializing
