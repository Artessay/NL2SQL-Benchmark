SELECT MAX(`Percent (%) Eligible Free (K-12)`) AS HighestEligibleFreeRate FROM frpm WHERE `County Name` = 'Alameda'; 
SELECT `Percent (%) Eligible Free (Ages 5-17)` FROM frpm WHERE `School Type` = 'Continuation' ORDER BY `Percent (%) Eligible Free (Ages 5-17)` ASC LIMIT 3
SELECT DISTINCT T2.Zip FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.County = 'Fresno' AND T1.`Charter School (Y/N)` = 1; 
SELECT T2.MailStreet FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T1.`FRPM Count (K-12)` DESC LIMIT 1
SELECT T1.Phone FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`Charter School (Y/N)` = 1 AND T1.OpenDate > '2000-01-01'
SELECT COUNT(*) FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrMath > 400 AND T1.Virtual = 'F'; 
SELECT T1.School FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumTstTakr > 500 AND (T1.Magnet = 1 OR T1.School LIKE '%Magnet%')
SELECT T1.Phone FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumGE1500 > 0 ORDER BY T2.NumGE1500 DESC LIMIT 1
SELECT SUM(NumTstTakr) FROM satscores WHERE cds IN (     SELECT CDSCode     FROM frpm     ORDER BY FRPM_Count_K_12 DESC     LIMIT 1 ); 
SELECT COUNT(DISTINCT T1.CDSCode) FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrMath > 560 AND T1.CharterFundingType = 'Directly funded'
SELECT T1.FRPM_COUNT FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds ORDER BY T2.AvgScrRead DESC LIMIT 1
SELECT CDSCode FROM frpm WHERE Enrollment_K_12 + Enrollment_Ages_5_17 > 500
SELECT MAX(`Percent (%) Eligible Free (Ages 5-17)`) FROM frpm WHERE CDSCode IN ( SELECT cds FROM satscores WHERE NumGE1500 / NumTstTakr > 0.3 )
SELECT T2.Phone FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumTstTakr > 0 ORDER BY CAST(T1.NumGE1500 AS REAL) / T1.NumTstTakr DESC LIMIT 3
SELECT T2.NCESDist FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T1.`Enrollment (Ages 5-17)` DESC LIMIT 5
SELECT T1.District FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.StatusType = 'Active' GROUP BY T1.District ORDER BY AVG(T2.AvgScrRead) DESC LIMIT 1
SELECT COUNT(*) FROM satscores WHERE NumTstTakr < 100 AND cname = 'Alameda'
SELECT T2.CDSCode, T2.CharterNum FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrWrite > 499 AND T2.CharterNum IS NOT NULL ORDER BY T1.AvgScrWrite DESC
SELECT COUNT(*) FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.County = 'Fresno' AND T1.FundingType = 'Directly funded' AND T2.NumTstTakr <= 250
SELECT T1.Phone FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds ORDER BY T2.AvgScrMath DESC LIMIT 1
SELECT COUNT(*) FROM frpm WHERE County = 'Amador' AND Low_Grade = '9' AND High_Grade = '12';
SELECT COUNT(*) FROM frpm WHERE `County Name` = 'Los Angeles' AND `Enrollment (K-12)` > 500 AND `Enrollment (K-12)` < 700
SELECT T2.sname FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.County = 'Contra Costa' ORDER BY T2.NumTstTakr DESC LIMIT 1; 
SELECT T2.School ,  T2.Street ,  T2.StreetAbr ,  T2.City ,  T2.Zip ,  T2.State FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode  =  T2.CDSCode WHERE ABS(T1.`Enrollment (K-12)` - T1.`Enrollment (Ages 5-17)`) > 30
SELECT s.School, f.[Percent (%) Eligible Free (K-12)], st.AvgScrRead, st.AvgScrMath, st.AvgScrWrite FROM frpm f JOIN satscores st ON f.CDSCode = st.cds JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.[Percent (%) Eligible Free (K-12)] > 0.1 AND st.NumGE1500 >= 1; 
SELECT T1.School, T1.FundingType FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrMath > 400 AND T1.County = 'Riverside'
SELECT T1.School, T1.Street, T1.City, T1.State, T1.Zip FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`School Type` = 'High Schools (Public)' AND T2.`County Name` = 'Monterey' AND T2.`Free Meal Count (Ages 15-17)` > 800
SELECT T1.sname, T1.AvgScrWrite, T2.Phone FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.OpenDate > '1991-12-31' OR T2.ClosedDate < '2000-01-01'
SELECT s.School, s.DOCType, AVG(f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`) AS AvgDiff FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.CharterFundingType = 'Locally Funded' GROUP BY s.School, s.DOCType HAVING ABS(AvgDiff) > (     SELECT AVG(ABS(f2.`Enrollment (K-12)` - f2.`Enrollment (Ages 5-17)`))     FROM frpm f2     JOIN schools s2 ON f2.CDSCode = s2.CDSCode     WHERE f2.CharterFundingType = 'Locally Funded' ) ORDER BY Abs(AvgDiff) DESC; 
SELECT T1.OpenDate FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`Low Grade` = 'K' AND T2.`High Grade` = '12' ORDER BY T2.`Enrollment (K-12)` DESC LIMIT 1; 
SELECT DISTINCT City FROM frpm INNER JOIN schools ON frpm.CDSCode = schools.CDSCode ORDER BY Enrollment DESC LIMIT 5
SELECT `Percent (%) Eligible Free (K-12)`  FROM `frpm`  ORDER BY `Enrollment (K-12)` DESC  LIMIT 10, 2; 
SELECT T1.`Percent (%) Eligible Free (K-12)` FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`Ownership Code` = 66 ORDER BY T1.`FRPM Count (K-12)` DESC LIMIT 5
SELECT T2.Website, T2.School FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Free Meal Count (Ages 5-17)` BETWEEN 1900 AND 2000
SELECT "Percent (%) Eligible Free (Ages 5-17)" FROM frpm WHERE CDSCode IN (SELECT CDSCode FROM schools WHERE AdmFName1 = 'Kacey' AND AdmLName1 = 'Gibson') 
SELECT T2.AdmEmail1 FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Charter School (Y/N)` = 1 ORDER BY T1.`Enrollment (K-12)` ASC LIMIT 1
SELECT T1.AdmFName1, T1.AdmLName1, T1.AdmFName2, T1.AdmLName2, T1.AdmFName3, T1.AdmLName3 FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumGE1500 > 0 ORDER BY T2.NumGE1500 DESC LIMIT 1
SELECT T1.Street, T1.City, T1.State, T1.Zip FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds ORDER BY CAST(T2.NumGE1500 AS REAL) / T2.NumTstTakr ASC LIMIT 1
SELECT T2.Website FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumTstTakr BETWEEN 2000 AND 3000 AND T2.County = 'Los Angeles'
SELECT AVG(s.NumTstTakr) AS AverageTestTakers FROM satscores s JOIN schools sc ON s.cds = sc.CDSCode WHERE sc.City = 'Fresno' AND STRFTIME('%Y', sc.OpenDate) = '1980'; 
SELECT T2.Phone FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.District = 'Fresno Unified' ORDER BY T1.AvgScrRead ASC LIMIT 1
SELECT T1.School FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.Virtual = 'F' GROUP BY T1.County, T1.School ORDER BY AVG(T2.AvgScrRead) DESC LIMIT 5
SELECT T1.Educational_Option_Type FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds ORDER BY T2.AvgScrMath DESC LIMIT 1
SELECT AVG(AvgScrMath), T2.County FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode GROUP BY T2.County ORDER BY SUM(AvgScrMath + AvgScrRead + AvgScrWrite) ASC LIMIT 1
SELECT AVG(AvgScrWrite), T2.City FROM satscores AS A INNER JOIN schools AS B ON A.cds = B.CDSCode WHERE NumTstTakr >= 1500 GROUP BY T2.City ORDER BY SUM(NumTstTakr) DESC LIMIT 1; 
SELECT T2.School, AVG(T2.AvgScrWrite) AS AverageWritingScore FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.AdmFName1 = 'Ricci' AND T1.AdmLName1 = 'Ulrich' GROUP BY T2.School
SELECT T2.School FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.DOC = 31 AND T1.LowGrade = 'K' AND T1.HighGrade = '12' ORDER BY T1.`Enrollment (K-12)` DESC LIMIT 1
SELECT COUNT(CDSCode) / 12 FROM schools WHERE strftime('%Y', OpenDate) = '1980' AND DOC = 52
SELECT CAST(SUM(CASE WHEN T2.DOC = 54 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T2.DOC = 52 THEN 1 ELSE 0 END) FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.County = 'Orange' AND T1.StatusType = 'Merged'
SELECT T1.County, T1.School, T1.ClosedDate FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.StatusType = 'Closed' GROUP BY T1.County ORDER BY COUNT(T1.CDSCode) DESC LIMIT 1
SELECT T2.Street, T2.School FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrMath DESC LIMIT 6, 1
SELECT T2.MailStreet, T2.School FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrRead ASC LIMIT 1
SELECT COUNT(*)  FROM frpm  JOIN satscores ON frpm.CDSCode = satscores.cds  JOIN schools ON frpm.CDSCode = schools.CDSCode  WHERE (frpm.Percent (%) Eligible Free (K-12) + frpm.Percent (%) Eligible Free (Ages 5-17)) >= 50 AND satscores.AvgScrRead + satscores.AvgScrMath + satscores.AvgScrWrite >= 1500 AND schools.MailCity = 'Lakeport'; 
SELECT SUM(NumTstTakr) FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.MailCity = 'Fresno'; 
SELECT s.School, s.MailZip FROM schools s WHERE s.AdmFName1 = 'Avetik' AND s.AdmLName1 = 'Atoian'; 
SELECT CAST(SUM(CASE WHEN County = 'Colusa' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN County = 'Humboldt' THEN 1 ELSE 0 END) FROM schools WHERE MailState = 'CA'
SELECT COUNT(*) FROM schools WHERE State = 'CA' AND City = 'San Joaquin' AND StatusType = 'Active'; 
SELECT T2.Phone, T2.Ext FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrWrite DESC LIMIT 1, 1
SELECT Phone, Ext, School FROM schools WHERE Zip = '95203-3704'
SELECT Website FROM schools WHERE AdmFName1 = 'Mike' AND AdmLName1 = 'Larson' OR AdmFName1 = 'Dante' AND AdmLName1 = 'Alvarez'
SELECT Website FROM schools WHERE Virtual = 'P' AND Charter = 1 AND County = 'San Joaquin'
SELECT COUNT(*) FROM schools WHERE City = 'Hickman' AND DOC = 52 AND Charter = 1; 
SELECT COUNT(*) FROM frpm WHERE County Name = 'Los Angeles' AND Charter School (Y/N) = 0 AND Percent (%) Eligible Free (K-12) < 0.18; 
SELECT DISTINCT s.AdmFName1, s.AdmLName1, s.School, s.City FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.Charter = 1 AND f.Charter School Number = '00D2'; 
SELECT COUNT(*) FROM schools WHERE MailCity = 'Hickman' AND CharterNum = '00D4'; 
SELECT      (SUM(CASE WHEN Charter_Funding_Type = 'Locally Funded' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Percentage_Locally_Funded FROM      frpm JOIN      schools ON frpm.CDSCode = schools.CDSCode WHERE      County_Name = 'Santa Clara'; 
SELECT COUNT(*) FROM schools WHERE FundingType = 'Directly Funded' AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31' AND County = 'Stanislaus';
SELECT COUNT(*) FROM schools WHERE City = 'San Francisco' AND StatusType = 'Closed' AND ClosedDate LIKE '%1989%'
SELECT T2.County FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.ClosedDate BETWEEN '1980-01-01' AND '1989-12-31' AND T1.SOC = 11 GROUP BY T2.County ORDER BY COUNT(T2.CDSCode) DESC LIMIT 1
SELECT NCESDist FROM schools WHERE SOC = 31
SELECT COUNT(*) AS Total_Schools FROM schools WHERE County = 'Alpine' AND (District = 'District Community Day Schools' OR District LIKE '%Community Day Schools%') AND StatusType IN ('Active', 'Closed'); 
SELECT District FROM schools WHERE City = 'Fresno' AND Magnet = 0
SELECT SUM(`Enrollment (Ages 5-17)`) FROM `frpm` WHERE `School Name` = 'State Special School' AND `Academic Year` = '2014-2015' AND `EdOpsCode` = 'SSS';
SELECT T1.`Free Meal Count (Ages 5-17)` FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.School = 'Youth Authority School' AND T2.MailStreet = 'PO Box 1040'; 
SELECT MIN(LowGrade) FROM frpm WHERE CDSCode IN (SELECT CDSCode FROM schools WHERE NCESDist = '0613360' AND EdOpsCode = 'SPECON')
SELECT T2.School, T2.GSoffered FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Educational Option Type` = 'Breakfast Provision 2' AND T2.`County Code` = 37
SELECT T2.City FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.Educational_Option_Type = 'Lunch Provision 2' AND T1.Low_Grade = '9' AND T1.High_Grade = '12' AND T2.County = 'Merced' AND T2.EILCode = 'HS'
SELECT T1.School, (T1.`FRPM Count (Ages 5-17)` / T1.`Enrollment (Ages 5-17)` * 100) AS `Percent (%) Eligible FRPM (Ages 5-17)` FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.County = 'Los Angeles' AND T1.LowGrade = 'K' AND T1.HighGrade = '9'
SELECT GSserved FROM schools WHERE City = 'Adelanto' GROUP BY GSserved ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) AS NumberOfSchools FROM schools WHERE Virtual = 'F' AND County IN ('San Diego', 'Santa Barbara') 
SELECT T1.School, T1.Latitude, T1.Longitude FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T1.Latitude DESC LIMIT 1
SELECT T1.School, T1.LowestGrade FROM schools AS T1 INNER JOIN ( SELECT MIN(Latitude) AS MinLat FROM schools WHERE State = 'CA' ) AS T2 ON T1.Latitude = T2.MinLat WHERE T1.State = 'CA'
SELECT GSoffered FROM schools ORDER BY ABS(Longitude) DESC LIMIT 1
SELECT COUNT(DISTINCT City), City, COUNT(*) AS SchoolCount FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE Magnet = 1 AND GSoffered = 'K-8' AND NSLP_Provision_Status = 'Multiple Provision Types' GROUP BY City; 
SELECT T1.AdmFName1, T2.District FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode GROUP BY T1.AdmFName1 ORDER BY COUNT(T1.AdmFName1) DESC LIMIT 2
SELECT T2.`Percent (%) Eligible Free (K-12)`, T1.`District Code` FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`AdmFName1` = 'Alusine'
SELECT T2.LastUpdate, T2.District, T2.County, T2.School, T2.AdmLName1 FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.Charter_School_Number = 40; 
SELECT AdmEmail1, AdmEmail2, AdmEmail3 FROM schools WHERE County = 'San Bernardino' AND City = 'San Bernardino City Unified' AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND (SOC = 62 OR DOC = 54)
SELECT T1.AdmEmail1, T2.School FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumGE1500 > 0 ORDER BY T2.NumGE1500 DESC LIMIT 1
SELECT COUNT(DISTINCT T1.account_id) FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id INNER JOIN district AS T4 ON T3.district_id = T4.district_id WHERE T1.frequency = 'POPLATEK PO OBRATU' AND T4.A3 LIKE '%East Bohemia%'
SELECT COUNT(DISTINCT account_id) AS eligible_accounts FROM account JOIN disp ON account.account_id = disp.account_id JOIN client ON disp.client_id = client.client_id JOIN district ON client.district_id = district.district_id WHERE district.A3 = 'Prague'; 
SELECT AVG(A12) AS avg_unemployment_1995, AVG(A13) AS avg_unemployment_1996 FROM district WHERE strftime('%Y', date) IN ('1995', '1996')
SELECT COUNT(*) FROM district WHERE A11 BETWEEN 6000 AND 10000 AND A2 IN ( SELECT T1.A2 FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.gender = 'F' GROUP BY T1.A2 HAVING AVG(T1.A11) > 6000 AND AVG(T1.A11) < 10000 )
SELECT COUNT(client_id) FROM client WHERE gender = 'M' AND district_id IN (     SELECT district_id FROM district WHERE A3 LIKE '%North Bohemia%' ) AND district_id IN (     SELECT district_id FROM district GROUP BY district_id HAVING AVG(A11) > 8000 ) 
SELECT AVG(T1.A11) - MIN(AVG(T1.A11)) AS gap FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.gender = 'F' GROUP BY T2.client_id ORDER BY MAX(T2.birth_date) DESC LIMIT 1
SELECT T1.account_id FROM disp AS T1 JOIN client AS T2 ON T1.client_id = T2.client_id GROUP BY T1.account_id ORDER BY AVG(T2.birth_date) DESC LIMIT 1
SELECT COUNT(DISTINCT T1.client_id) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id WHERE T3.frequency = 'POPLATEK TYDNE' AND T2.type = 'OWNER'
SELECT DISTINCT d.client_id FROM disp d JOIN account a ON d.account_id = a.account_id WHERE d.type = 'DISPONENT' AND a.frequency = 'POPLATEK PO OBRATU'; 
SELECT T1.account_id FROM account AS T1 JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE STRFTIME('%Y', T2.date) = '1997' ORDER BY T2.amount ASC LIMIT 1; 
SELECT T1.account_id FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.duration > 12 AND strftime('%Y', T2.date) = '1993' ORDER BY T1.amount DESC LIMIT 1
SELECT COUNT(*) FROM client WHERE gender = 'F' AND birth_date < '1950-01-01' AND district_id IN ( SELECT district_id FROM district WHERE A2 = 'Sokolov' )
SELECT account_id FROM trans WHERE STRFTIME('%Y', date) = '1995' ORDER BY date ASC LIMIT 1
SELECT DISTINCT T1.account_id FROM disp AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.date < '1997-01-01' AND T2.balance > 3000
SELECT T1.client_id FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN card AS T3 ON T2.disp_id = T3.disp_id WHERE T3.issued LIKE '1994-03-03%'
SELECT T1.date FROM account AS T1 INNER JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T2.amount = 840 AND T2.date = '1998-10-14'
SELECT T1.district_id FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id INNER JOIN loan AS T3 ON T2.account_id = T3.account_id WHERE T3.date = '1994-08-25'
SELECT MAX(t.amount) FROM trans t JOIN disp d ON t.account_id = d.account_id WHERE d.issued = '1996-10-21'
SELECT T1.gender FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id INNER JOIN district AS T4 ON T3.district_id = T4.district_id ORDER BY T1.birth_date ASC, T4.A11 DESC LIMIT 1
SELECT T2.amount FROM disp AS T1 INNER JOIN trans AS T2 ON T1.account_id = T2.account_id INNER JOIN loan AS T3 ON T1.account_id = T3.account_id ORDER BY T3.amount DESC LIMIT 1, 1
SELECT COUNT(*) FROM client AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Jesenik' AND T1.gender = 'F'
SELECT T1.disp_id FROM disp AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T3.amount = 5100 AND T3.date LIKE '1998-09-02%'
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Litomerice') AND strftime('%Y', date) = '1996'; 
SELECT T2.A2 FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' AND T1.birth_date = '1976-01-29'
SELECT T1.birth_date FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id INNER JOIN loan AS T4 ON T3.account_id = T4.account_id WHERE T4.amount = 98832 AND T4.date LIKE '1996-01-03%'
SELECT T1.account_id FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 = 'Prague' ORDER BY T1.date ASC LIMIT 1
SELECT CAST(SUM(CASE WHEN T1.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 LIKE '%south Bohemia%' ORDER BY T2.A4 DESC LIMIT 1
SELECT ((T3.balance - T1.balance) / T1.balance) * 100 AS increase_rate FROM trans AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN trans AS T3 ON T2.client_id = T3.client_id WHERE T1.date = '1993-03-22' AND T3.date = '1998-12-27' AND T1.type = 'PRIJEM' AND T3.type = 'PRIJEM' ORDER BY T2.disp_id ASC LIMIT 1
SELECT CAST(SUM(CASE WHEN T2.status = 'A' THEN T1.amount ELSE 0 END) AS REAL) * 100 / SUM(T1.amount) FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id
SELECT CAST(SUM(CASE WHEN status = 'C' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM loan WHERE amount < 100000
SELECT T1.account_id, T4.A2, T4.A3 FROM trans AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN disp AS T3 ON T2.account_id = T3.account_id JOIN district AS T4 ON T2.district_id = T4.district_id WHERE T2.date LIKE '1993%' AND T1.type = 'POPLATEK PO OBRATU' 
SELECT T2.account_id, T2.frequency FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.A8 BETWEEN 1 AND 5 AND T2.date BETWEEN '1995-01-01' AND '2000-12-31' GROUP BY T2.account_id, T2.frequency
SELECT T1.account_id, T1.date FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Prachatice'
SELECT T3.A2, T3.A3 FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.loan_id = 4990
SELECT T1.account_id, T2.A2, T2.A3 FROM loan AS T1 INNER JOIN district AS T2 ON T1.account_id = T2.district_id WHERE T1.amount > 300000
SELECT T1.loan_id, T3.A3, AVG(T2.salary) AS avg_salary FROM loan AS T1 INNER JOIN client AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.duration = 60 GROUP BY T1.loan_id, T3.A3
SELECT T1.A12 ,  T1.A13 ,  ((T1.A13 - T1.A12) / T1.A12) * 100 FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id INNER JOIN loan AS T3 ON T2.account_id = T3.account_id WHERE T3.status = 'D'
SELECT CAST(SUM(CASE WHEN T1.district_id = ( SELECT district_id FROM district WHERE A2 = 'Decin' ) THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id WHERE STRFTIME('%Y', T3.date) = '1993'
SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE'
SELECT T1.A2 FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.gender = 'F' GROUP BY T1.A2 ORDER BY COUNT(T2.client_id) DESC LIMIT 9
SELECT T1.A2, SUM(T3.amount) AS total_withdrawals FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id INNER JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T3.type = 'VYDAJ' AND T3.date LIKE '1996-01%' GROUP BY T1.A2 ORDER BY total_withdrawals DESC LIMIT 10
SELECT COUNT(DISTINCT T1.client_id) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T3.A3 = 'South Bohemia' AND T2.account_id NOT IN ( SELECT account_id FROM card )
SELECT T2.A3 FROM loan AS T1 INNER JOIN district AS T2 ON T1.account_id = T2.district_id WHERE T1.status IN ('C', 'D') GROUP BY T2.A3 ORDER BY COUNT(*) DESC LIMIT 1
SELECT AVG(T1.amount) FROM loan AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T3.gender = 'M'
SELECT T2.A2 FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE STRFTIME('%Y', T2.date) = '1996' ORDER BY T1.A13 DESC LIMIT 1
SELECT COUNT(account_id) FROM account WHERE district_id = ( SELECT district_id FROM district ORDER BY A16 DESC LIMIT 1 )
SELECT COUNT(DISTINCT T1.account_id) FROM trans AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.operation = 'VYBER KARTOU' AND T2.frequency = 'POPLATEK MESICNE' AND T1.balance < 0
SELECT COUNT(DISTINCT T1.account_id) FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.date BETWEEN '1995-01-01' AND '1997-12-31' AND T1.amount >= 250000 AND T2.frequency = 'POPLATEK MESICNE'; 
SELECT COUNT(account_id) FROM loan WHERE status IN ('C', 'D') AND account_id IN (SELECT account_id FROM disp WHERE client_id IN (SELECT client_id FROM client WHERE district_id = 1)); 
SELECT COUNT(*) FROM client WHERE district_id IN (     SELECT district_id FROM district ORDER BY A15 DESC LIMIT 1 OFFSET 1 ) AND gender = 'M'; 
SELECT COUNT(*) FROM card AS T1 INNER JOIN disp AS T2 ON T1.card_id = T2.card_id WHERE T1.type = 'gold' AND T2.type = 'OWNER'
SELECT COUNT(account_id) FROM account WHERE district_id = ( SELECT district_id FROM district WHERE A2 = 'Pisek' )
SELECT T1.A2 FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id INNER JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T3.amount > 10000 AND STRFTIME('%Y', T3.date) = '1997' GROUP BY T1.district_id HAVING SUM(T3.amount) > 10000;
SELECT T1.account_id FROM account AS T1 INNER JOIN order AS T2 ON T1.account_id = T2.account_id WHERE T2.k_symbol = 'SIPO' AND T2.bank_to LIKE '%Pisek%'
SELECT T1.account_id FROM account AS T1 JOIN disp AS T2 ON T1.account_id = T2.account_id JOIN card AS T3 ON T2.disp_id = T3.disp_id WHERE T3.type = 'gold'
SELECT AVG(amount) FROM trans WHERE type = 'PRIJEM' AND operation = 'VYBER KARTOU' AND date LIKE '2021%'
SELECT DISTINCT T1.account_id FROM disp AS T1 JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T2.date LIKE '1998%' AND T2.operation = 'VYBER KARTOU' AND T2.amount < ( SELECT AVG(amount) FROM trans WHERE date LIKE '1998%' )
SELECT c.client_id, c.gender FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card ca ON d.disp_id = ca.disp_id JOIN loan l ON d.account_id = l.account_id WHERE c.gender = 'F' AND ca.type = 'credit'
SELECT COUNT(*) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' AND T2.A3 LIKE '%south Bohemia%'
SELECT T1.account_id FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id INNER JOIN district AS T4 ON T3.district_id = T4.district_id WHERE T4.A2 = 'Tabor' AND T2.type = 'OWNER'
SELECT DISTINCT T2.type FROM disp AS T1 INNER JOIN card AS T2 ON T1.disp_id = T2.disp_id INNER JOIN client AS T3 ON T1.client_id = T3.client_id INNER JOIN account AS T4 ON T1.account_id = T4.account_id WHERE T2.type != 'OWNER' AND T3.district_id IN ( SELECT district_id FROM client GROUP BY district_id HAVING AVG(T3.birth_date) BETWEEN 8000 AND 9000 )
SELECT COUNT(*) FROM account AS T1 INNER JOIN trans AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T3.A3 LIKE '%North Bohemia%' AND T2.bank = 'AB'
SELECT T1.A2 FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id INNER JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T3.type = 'VYDAJ'
SELECT AVG(T1.A15) AS avg_crimes FROM district AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.A15 > 4000 AND MIN(T2.date) >= '1997-01-01' AND STRFTIME('%Y', T2.date) = '1995'; 
SELECT COUNT(*) FROM card AS T1 INNER JOIN disp AS T2 ON T1.card_id = T2.card_id WHERE T1.type = 'classic' AND T2.type = 'OWNER'
SELECT COUNT(client_id) FROM client WHERE district_id IN ( SELECT district_id FROM district WHERE A2 = 'Hl.m. Praha' ) AND gender = 'M'
SELECT CAST(SUM(CASE WHEN type = 'gold' AND issued < '1998-01-01' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM card
SELECT T3.name FROM disp AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T1.client_id = T3.client_id WHERE T2.account_id IN ( SELECT account_id FROM loan ORDER BY amount DESC LIMIT 1 )
SELECT T1.A15 FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T2.account_id = 532
SELECT T2.district_id FROM order AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.order_id = 33333
SELECT T1.amount FROM trans AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id WHERE T2.client_id = 3356 AND T1.operation = 'VYBER'
SELECT COUNT(DISTINCT T1.account_id) FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T1.frequency = 'POPLATEK TYDNE' AND T2.amount < 200000
SELECT T1.type FROM card AS T1 INNER JOIN disp AS T2 ON T1.card_id = T2.card_id WHERE T2.client_id = 13539 AND T1.type LIKE '%credit%'
SELECT T1.A3 FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.client_id = 3541
SELECT T2.A2 FROM loan AS T1 INNER JOIN district AS T2 ON T1.account_id = T2.district_id WHERE T1.status = 'A' GROUP BY T2.district_id ORDER BY COUNT(T1.loan_id) DESC LIMIT 1
SELECT client_id FROM disp WHERE account_id IN (SELECT account_id FROM `order` WHERE order_id = 32423)
SELECT T1.trans_id FROM trans AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.district_id = 5
SELECT COUNT(account_id) FROM account WHERE district_id = (SELECT district_id FROM district WHERE A3 = 'Jesenik')
SELECT T1.client_id FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN card AS T3 ON T2.disp_id = T3.disp_id WHERE T3.type = 'junior' AND T3.issued >= '1997-01-01'
SELECT CAST(SUM(CASE WHEN T2.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T1.A11 > 10000
SELECT ((SUM(CASE WHEN T2.date LIKE '1997%' THEN T2.amount ELSE 0 END) - SUM(CASE WHEN T2.date LIKE '1996%' THEN T2.amount ELSE 0 END)) / SUM(CASE WHEN T2.date LIKE '1996%' THEN T2.amount ELSE 0 END)) * 100 AS growth_rate FROM client AS T1 INNER JOIN loan AS T2 ON T1.client_id = T2.account_id WHERE T1.gender = 'M'
SELECT COUNT(*) FROM trans WHERE operation = 'VYBER KARTOU' AND date > '1995-12-31'
SELECT SUM(CASE WHEN A3 = 'East Bohemia' THEN A16 ELSE 0 END) - SUM(CASE WHEN A3 = 'North Bohemia' THEN A16 ELSE 0 END) AS crime_difference FROM district WHERE date LIKE '1996%'
SELECT type ,  COUNT(*) FROM disp WHERE account_id BETWEEN 1 AND 10 GROUP BY type
SELECT T1.date, T2.k_symbol FROM account AS T1 INNER JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T1.account_id = 3 AND T2.amount = -3539; 
SELECT T1.birth_date FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id WHERE T2.disp_id = 130
SELECT COUNT(DISTINCT T1.account_id)  FROM disp AS T1  JOIN account AS T2 ON T1.account_id = T2.account_id  WHERE T1.type = 'OWNER' AND T2.frequency = 'POPLATEK PO OBRATU'; 
SELECT SUM(T1.amount) AS total_debt, T2.status FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.client_id = 992
SELECT T1.amount, T2.gender FROM trans AS T1 INNER JOIN client AS T2 ON T1.account_id = T2.district_id WHERE T1.trans_id = 851 AND T2.client_id = 4
SELECT T1.type FROM card AS T1 INNER JOIN disp AS T2 ON T1.card_id = T2.card_id WHERE T2.client_id = 9 AND T1.type LIKE '%credit%'
SELECT SUM(amount) FROM trans WHERE account_id IN ( SELECT account_id FROM disp WHERE client_id = 617 ) AND date LIKE '1998%'
SELECT T1.client_id FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND T2.A8 = 1 ORDER BY T1.client_id;
SELECT T1.client_id FROM client AS T1 INNER JOIN loan AS T2 ON T1.client_id = T2.account_id WHERE T1.gender = 'F' ORDER BY T2.amount DESC LIMIT 3
SELECT COUNT(DISTINCT T1.client_id) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T1.gender = 'M' AND T1.birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND T3.amount > 4000 AND T3.k_symbol = 'SIPO'
SELECT COUNT(*) FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id INNER JOIN district AS T4 ON T3.district_id = T4.district_id WHERE T4.A2 = 'Beroun' AND T1.date > '1996-12-31'
SELECT COUNT(*) FROM client AS c JOIN disp AS d ON c.client_id = d.client_id JOIN card AS ca ON d.disp_id = ca.disp_id WHERE c.gender = 'F' AND ca.type = 'junior'
SELECT CAST(SUM(CASE WHEN T2.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM account AS T1 INNER JOIN client AS T2 ON T1.client_id = T2.client_id WHERE T2.district_id IN ( SELECT district_id FROM district WHERE A3 LIKE '%Prague%' ) 
SELECT CAST(SUM(CASE WHEN T1.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id WHERE T3.frequency = 'POPLATEK TYDNE'
SELECT COUNT(DISTINCT T2.client_id) FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id WHERE T1.frequency = 'POPLATEK TYDNE' AND T2.type = 'OWNER'
SELECT a.account_id, MIN(l.amount) AS min_amount FROM account a JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 24 AND a.date < '1997-01-01' GROUP BY a.account_id ORDER BY min_amount ASC LIMIT 1; 
SELECT T1.account_id FROM disp AS T1 INNER JOIN client AS T2 ON T1.client_id = T2.client_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T2.gender = 'F' GROUP BY T1.account_id ORDER BY AVG(T3.A11) ASC LIMIT 1
SELECT COUNT(client_id) FROM client WHERE STRFTIME('%Y', birth_date) = '1920' AND district_id IN ( SELECT district_id FROM district WHERE A3 LIKE '%East Bohemia%' )
SELECT COUNT(*) FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.duration = 24 AND T1.frequency = 'POPLATEK TYDNE'
SELECT AVG(T1.amount) FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.frequency = 'POPLATEK PO OBRATU' AND T1.status IN ('C', 'D')
SELECT T1.client_id ,  T2.district_id FROM disp AS T1 INNER JOIN client AS T2 ON T1.client_id = T2.client_id WHERE T1.type = 'OWNER'
SELECT c.client_id , julianday('now') - julianday(c.birth_date) AS age FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card ca ON d.disp_id = ca.disp_id WHERE ca.type = 'gold' AND d.type = 'OWNER'
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY COUNT(bond_type) DESC LIMIT 1
SELECT COUNT(*) FROM atom WHERE molecule_id IN ( SELECT molecule_id FROM molecule WHERE label = '-' ) AND element = 'cl'
SELECT AVG(CASE WHEN T1.element = 'o' THEN 1 ELSE 0 END) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-'
SELECT CAST(COUNT(CASE WHEN T3.bond_type = '-' THEN 1 ELSE NULL END) AS REAL) / COUNT(T2.atom_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN bond AS T3 ON T1.molecule_id = T3.molecule_id WHERE T1.label = '+'
SELECT COUNT(*) FROM atom WHERE element = 'na' AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-'); 
SELECT T1.label FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '#' AND T1.label = '+' GROUP BY T1.molecule_id HAVING COUNT(T2.bond_type) >= 3
SELECT CAST(SUM(CASE WHEN T1.element = 'c' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '='
SELECT COUNT(*) FROM bond WHERE bond_type = '#'
SELECT COUNT(*) FROM atom WHERE element != 'br'
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR099' AND label = '+'
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'c' GROUP BY T1.molecule_id
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR004_8_9'
SELECT DISTINCT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '='
SELECT T2.label FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'h' GROUP BY T2.label ORDER BY COUNT(T2.label) DESC LIMIT 1
SELECT T1.bond_type FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id INNER JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T3.element = 'cl'
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-'
SELECT T1.element FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN connected AS T3 ON T1.atom_id = T3.atom_id WHERE T2.label = '-'
SELECT element FROM atom WHERE molecule_id IN ( SELECT molecule_id FROM molecule WHERE label = '-' ) GROUP BY element ORDER BY COUNT(element) ASC LIMIT 1
SELECT T2.bond_type FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE (T1.atom_id = 'TR004_8' AND T1.atom_id2 = 'TR004_20') OR (T1.atom_id = 'TR004_20' AND T1.atom_id2 = 'TR004_8')
SELECT label FROM molecule WHERE molecule_id NOT IN ( SELECT molecule_id FROM atom WHERE element != 'sn' )
SELECT COUNT(DISTINCT T1.atom_id) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE (T1.element = 'i' OR T1.element = 's') AND T3.bond_type = '-'
SELECT T1.atom_id, T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '#'
SELECT DISTINCT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE c.bond_id IN (     SELECT bond_id     FROM connected     WHERE atom_id IN (         SELECT atom_id         FROM atom         WHERE molecule_id = 'TR181'     ) ); 
SELECT CAST(SUM(CASE WHEN T1.element = 'f' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(DISTINCT T1.atom_id) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'
SELECT CAST(SUM(CASE WHEN T1.bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.bond_id) AS percent FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'; 
SELECT element FROM atom WHERE molecule_id = 'TR000' GROUP BY element ORDER BY element ASC LIMIT 3
SELECT atom_id FROM connected WHERE bond_id = 'TR001_2_6' AND molecule_id = 'TR001';
SELECT SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN label = '-' THEN 1 ELSE 0 END) AS difference FROM molecule
SELECT atom_id FROM connected WHERE bond_id = 'TR000_2_5'
SELECT bond_id FROM connected WHERE atom_id = 'TR000_2' AND atom_id2 = 'TR000_2';
SELECT T1.label FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = ' = ' ORDER BY T1.label LIMIT 5
SELECT CAST(SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) AS percent FROM bond WHERE molecule_id = 'TR008'
SELECT CAST(SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(molecule_id) AS percent FROM molecule
SELECT CAST(SUM(CASE WHEN element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM atom WHERE molecule_id = 'TR206'
SELECT bond_type FROM bond WHERE molecule_id = 'TR000'
SELECT T1.element, T3.label FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN molecule AS T3 ON T2.molecule_id = T3.molecule_id WHERE T3.molecule_id = 'TR060'; 
SELECT bond_type FROM bond WHERE molecule_id = 'TR010' GROUP BY bond_type ORDER BY COUNT(bond_type) DESC LIMIT 1; SELECT label FROM molecule WHERE molecule_id = 'TR010';
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-' GROUP BY T1.molecule_id ORDER BY T1.label ASC LIMIT 3
SELECT T2.bond_type FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR006' ORDER BY T2.bond_type ASC LIMIT 2
SELECT COUNT(*) FROM connected WHERE (atom_id = 'TR009_12' OR atom_id2 = 'TR009_12') AND molecule_id = 'TR009'; 
SELECT COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.element = 'br'
SELECT T1.bond_type, T2.atom_id, T2.atom_id2 FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T1.bond_id = 'TR001_6_9'; 
SELECT T1.label ,  CASE WHEN T1.label = '+' THEN 'Carcinogenic' ELSE 'Not Carcinogenic' END AS carcinogenicity FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.atom_id = 'TR001_10'
SELECT COUNT(*) FROM molecule WHERE molecule_id IN ( SELECT molecule_id FROM bond WHERE bond_type = '#' )
SELECT COUNT(*) FROM connected WHERE atom_id = 'TR%_19' OR atom_id2 = 'TR%_19'; 
SELECT T1.element FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.molecule_id = 'TR004'
SELECT COUNT(*) FROM molecule WHERE label = '-'
SELECT DISTINCT T1.label FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE SUBSTR(T2.atom_id, 7, 2) BETWEEN '21' AND '25' AND T1.label = '+'
SELECT b.bond_id, b.bond_type FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE (a1.element = 'p' AND a2.element = 'n') OR (a1.element = 'n' AND a2.element = 'p'); 
SELECT T1.label FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = ' = ' AND T1.label = '+' ORDER BY COUNT(T2.bond_type) DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN T1.element = 'i' THEN 1 ELSE 0 END) AS REAL) / COUNT(T1.atom_id) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id
SELECT T1.bond_type, T1.bond_id FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE CAST(SUBSTR(T2.atom_id2, 7, 2) AS INT) = 45 OR CAST(SUBSTR(T2.atom_id, 7, 2) AS INT) = 45
SELECT element FROM atom WHERE atom_id NOT IN ( SELECT atom_id FROM connected )
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.molecule_id = 'TR041' AND T3.bond_type = '#'
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR144_8_19'
SELECT T1.label FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.bond_type = ' = ' GROUP BY T1.label ORDER BY COUNT(T2.bond_id) DESC LIMIT 1
SELECT element FROM atom WHERE molecule_id IN ( SELECT molecule_id FROM molecule WHERE label = '+' ) GROUP BY element ORDER BY count(*) ASC LIMIT 1
SELECT T1.atom_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 'pb'
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '#'
SELECT CAST(COUNT(DISTINCT bond_id) AS REAL) * 100 / ( SELECT MAX(COUNT(atom_id)) FROM atom GROUP BY molecule_id ) FROM connected WHERE atom_id IN ( SELECT atom_id FROM atom WHERE element = ( SELECT element FROM atom GROUP BY element ORDER BY COUNT(element) DESC LIMIT 1 ) ) 
SELECT CAST(SUM(CASE WHEN T1.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_id) FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-'
SELECT COUNT(*) FROM atom WHERE element IN ('c', 'h'); 
SELECT T1.atom_id2 FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id2 = T2.atom_id WHERE T2.element = 's'
SELECT T2.bond_type FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'sn'
SELECT COUNT(DISTINCT T1.element) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-'
SELECT COUNT(*) FROM atom WHERE molecule_id IN ( SELECT molecule_id FROM bond WHERE bond_type = '#' GROUP BY molecule_id HAVING COUNT(*) >= 3 ) AND element IN ('p', 'br')
SELECT T1.bond_id FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-' AND T1.label != '-'
SELECT CAST(SUM(CASE WHEN T1.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) AS percent FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-'; 
SELECT label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002')
SELECT molecule_id FROM molecule WHERE label = '-'
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR030' AND label = '+'; 
SELECT bond_type FROM bond WHERE molecule_id BETWEEN 'TR000' AND 'TR050'
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_10_11'
SELECT COUNT(T1.bond_id) FROM bond AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'i'
SELECT T1.label FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'ca' GROUP BY T1.label ORDER BY COUNT(T1.label) DESC LIMIT 1
SELECT EXISTS (     SELECT 1     FROM atom     JOIN connected ON atom.atom_id = connected.atom_id OR atom.atom_id = connected.atom_id2     WHERE connected.bond_id = 'TR001_1_8' AND atom.element = 'cl' ) AND EXISTS (     SELECT 1     FROM atom     JOIN connected ON atom.atom_id = connected.atom_id OR atom.atom_id = connected.atom_id2     WHERE connected.bond_id = 'TR001_1_8' AND atom.element = 'c' ); 
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN connected AS T3 ON T2.atom_id = T3.atom_id INNER JOIN bond AS T4 ON T3.bond_id = T4.bond_id WHERE T2.element = 'c' AND T4.bond_type = '#' GROUP BY T1.molecule_id HAVING COUNT(T4.bond_id) >= 3 LIMIT 2
SELECT CAST(SUM(CASE WHEN T1.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'
SELECT DISTINCT atom.element FROM atom JOIN connected ON atom.atom_id = connected.atom_id JOIN bond ON connected.bond_id = bond.bond_id WHERE connected.molecule_id = 'TR001'; 
SELECT molecule_id FROM bond WHERE bond_type = ' = '
SELECT T1.atom_id AS first_atom, T1.atom_id2 AS second_atom FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '#' LIMIT 1
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR000_1_2'
SELECT COUNT(*) FROM molecule AS m JOIN bond AS b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '-' AND m.label = '-'
SELECT T2.label FROM connected AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_id = 'TR001_10_11'
SELECT T1.bond_id ,  CASE WHEN T2.label = '+' THEN 'Carcinogenic' ELSE 'Non-Carcinogenic' END AS carcinogenicity FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '#'
SELECT T1.element FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id LIKE '%4' AND T2.label = '+' GROUP BY T1.element
SELECT CAST(SUM(CASE WHEN T1.element = 'h' THEN 1 ELSE 0 END) AS REAL) / COUNT(T1.element), T2.label FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR006'
SELECT T1.label FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'ca' AND T1.label = '+'
SELECT T2.bond_type FROM atom AS T1 INNER JOIN connected AS T3 ON T1.atom_id = T3.atom_id INNER JOIN bond AS T2 ON T3.bond_id = T2.bond_id WHERE T1.element = 'c' AND T2.bond_type IN ('-', '=', '#')
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_10_11'; 
SELECT CAST(SUM(CASE WHEN T2.bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_type) FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id
SELECT CAST(SUM(CASE WHEN T2.bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_id) FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR047'
SELECT CASE WHEN T1.label = '+' THEN 'Carcinogenic' ELSE 'Not Carcinogenic' END AS carcinogenicity FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.atom_id = 'TR001_1'
SELECT CASE WHEN label = '+' THEN 'Carcinogenic' ELSE 'Not Carcinogenic' END AS carcinogenicity FROM molecule WHERE molecule_id = 'TR151'
SELECT T.element FROM atom AS T WHERE T.molecule_id = 'TR151' AND T.element IN ('cl', 'br')
SELECT COUNT(*) FROM molecule WHERE label = '+'
SELECT atom_id FROM atom WHERE molecule_id BETWEEN 'TR010' AND 'TR050' AND element = 'c'; 
SELECT COUNT(*) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'
SELECT T1.bond_id FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' AND T1.bond_type = ' = '
SELECT COUNT(*) FROM atom WHERE molecule_id IN ( SELECT molecule_id FROM molecule WHERE label = '+' ) AND element = 'h'
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_id = 'TR000_1_2' AND T2.molecule_id IN ( SELECT molecule_id FROM atom WHERE atom_id = 'TR000_1' )
SELECT atom_id FROM atom WHERE molecule_id IN ( SELECT molecule_id FROM molecule WHERE label = '-' ) AND element = 'c'
SELECT CAST(SUM(CASE WHEN T1.label = '+' AND T2.element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id
SELECT CASE WHEN EXISTS ( SELECT 1 FROM molecule WHERE molecule_id = 'TR124' AND label = '+' ) THEN 'Yes' ELSE 'No' END AS carcinogenicity
SELECT atom_id FROM atom WHERE molecule_id = 'TR186'
SELECT bond_type FROM bond WHERE bond_id = 'TR007_4_19'
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_2_4'
SELECT COUNT(*) AS double_bond_count, CASE WHEN T1.label = '+' THEN 'Carcinogenic' ELSE 'Non-Carcinogenic' END AS carcinogenicity FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = ' =' AND T1.molecule_id = 'TR006'
SELECT T1.label ,  T2.element FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.element IN ('cl', 'c', 'h')
SELECT T1.bond_id, T2.element AS atom1, T3.element AS atom2 FROM bond AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id AND T1.bond_id = T2.atom_id INNER JOIN atom AS T3 ON T1.molecule_id = T3.molecule_id AND T1.bond_id = T3.atom_id WHERE T1.bond_type = '-'
SELECT DISTINCT m.label, a.element FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#' AND a.element IN ('cl', 'c', 'h') 
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR000_2_3'
SELECT COUNT(*) FROM atom WHERE element = 'cl'; 
SELECT T1.atom_id ,  COUNT(DISTINCT T2.bond_type) FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR346'
SELECT COUNT(*) FROM molecule WHERE molecule_id IN ( SELECT molecule_id FROM bond WHERE bond_type = '=' ) AND label = '+'
SELECT COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 LEFT JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element != 's' AND T1.molecule_id NOT IN ( SELECT molecule_id FROM bond WHERE bond_type = '=' )
SELECT T1.label FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_id = 'TR001_2_4'
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR001'; 
SELECT COUNT(*) FROM bond WHERE bond_type = '-'
SELECT T1.label FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'cl' AND T1.label = '+'
SELECT T2.label FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'c' AND T2.label != '-'
SELECT CAST(SUM(CASE WHEN T1.label = '+' AND T2.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id
SELECT molecule_id FROM bond WHERE bond_id = 'TR001_1_7'
SELECT COUNT(DISTINCT T1.element) AS num_elements FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 WHERE T2.bond_id = 'TR001_3_4'; 
SELECT T1.bond_type FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T2.atom_id = 'TR000_1' AND T2.atom_id2 = 'TR000_2'
SELECT T1.label FROM molecule AS T1 INNER JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.atom_id = 'TR000_2' AND T2.atom_id2 = 'TR000_4'
SELECT element FROM atom WHERE atom_id = 'TR000_1';
SELECT CASE WHEN label = '+' THEN 'Carcinogenic' ELSE 'Non-Carcinogenic' END AS carcinogenicity FROM molecule WHERE molecule_id = 'TR000'
SELECT CAST(COUNT(CASE WHEN T2.bond_type = '-' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.atom_id) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id
SELECT COUNT(*) FROM molecule WHERE molecule_id IN ( SELECT molecule_id FROM atom WHERE element = 'n' ) AND label = '+'
SELECT T1.label FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN connected AS T3 ON T2.atom_id = T3.atom_id INNER JOIN bond AS T4 ON T3.bond_id = T4.bond_id WHERE T2.element = 's' AND T4.bond_type = '='
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-' GROUP BY T1.molecule_id HAVING COUNT(T2.atom_id) > 5
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '=' AND a.molecule_id = 'TR024'; 
SELECT T1.label FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' GROUP BY T1.label ORDER BY COUNT(T2.atom_id) DESC LIMIT 1
SELECT CAST(COUNT(CASE WHEN T1.label = '+' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN connected AS T3 ON T2.atom_id = T3.atom_id INNER JOIN bond AS T4 ON T3.bond_id = T4.bond_id WHERE T2.element = 'h' AND T4.bond_type = '#'
SELECT COUNT(*) FROM molecule WHERE label = '+'
SELECT COUNT(*) FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id BETWEEN 'TR004' AND 'TR010' AND T2.bond_type = '-'
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR008' AND element = 'c'; 
SELECT T1.element FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR004_7' AND T2.label = '-'
SELECT COUNT(*) FROM molecule WHERE molecule_id IN ( SELECT T1.molecule_id FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'o' AND T3.bond_type = '= ' GROUP BY T1.molecule_id HAVING COUNT(DISTINCT T2.atom_id) > 1 )
SELECT COUNT(*) FROM molecule WHERE molecule_id IN ( SELECT molecule_id FROM bond WHERE bond_type = '#' GROUP BY molecule_id HAVING COUNT(bond_id) >= 3 ) AND label = '-'
SELECT T1.element, T2.bond_type FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR002'
SELECT T1.atom_id FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.molecule_id = 'TR012' AND T1.element = 'c' AND T3.bond_type = ' = '
SELECT T1.atom_id FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' AND T1.element = 'o'
SELECT name FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL; 
SELECT name FROM cards WHERE borderColor = 'borderless' AND cardKingdomFoilId IS NULL AND cardKingdomId IS NULL
SELECT name FROM cards WHERE faceConvertedManaCost = ( SELECT MAX(faceConvertedManaCost) FROM cards )
SELECT name FROM cards WHERE frameVersion = 2015 AND edhrecRank < 100;
SELECT T1.name FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'mythic' AND T2.format = 'gladiator' AND T2.status = 'Banned'
SELECT c.name, l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.types = 'Artifact' AND c.side IS NULL AND l.format = 'vintage'; 
SELECT c.id, c.artist FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE (c.power = '*' OR c.power IS NULL) AND l.format = 'commander' AND l.status = 'Legal'; 
SELECT c.id, r.text, c.hasContentWarning FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Stephen Daniel'; 
SELECT T2.text FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Sublime Epiphany' AND T1.number = '74s'
SELECT c.name, c.artist, c.isPromo FROM cards c JOIN rulings r ON c.uuid = r.uuid GROUP BY c.id ORDER BY COUNT(r.uuid) DESC LIMIT 1; 
SELECT T2.language FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Annul' AND T1.number = '29'
SELECT T1.name FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.language = 'Japanese'
SELECT CAST(SUM(CASE WHEN language = 'Chinese Simplified' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(id) FROM foreign_data
SELECT s.name, s.totalSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian'; 
SELECT COUNT(DISTINCT type) FROM cards WHERE artist = 'Aaron Boyd'
SELECT keywords FROM cards WHERE name = 'Angel of Mercy';
SELECT COUNT(*) FROM cards WHERE power = '*';
SELECT promoTypes FROM cards WHERE name = 'Duress'
SELECT borderColor FROM cards WHERE name = 'Ancestor''s Chosen'
SELECT originalType FROM cards WHERE name = 'Ancestor''s Chosen';
SELECT T3.language FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code INNER JOIN set_translations AS T3 ON T2.code = T3.setCode WHERE T1.name = 'Angel of Mercy'
SELECT COUNT(*) FROM cards WHERE uuid IN ( SELECT uuid FROM legalities WHERE status = 'restricted' ) AND isTextless = 0;
SELECT T2.text FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Condemn'
SELECT COUNT(*) FROM cards WHERE uuid IN ( SELECT uuid FROM legalities WHERE status = 'restricted' ) AND isStarter = 1;
SELECT T2.status FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Cloudchaser Eagle'
SELECT TYPE FROM cards WHERE name = 'Benalish Knight'
SELECT T1.text FROM rulings AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Benalish Knight'
SELECT T1.artist FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Phyrexian';
SELECT CAST(SUM(CASE WHEN borderColor = 'borderless' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards
SELECT COUNT(*) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'German' AND T1.isReprint = 1
SELECT COUNT(*) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.borderColor = 'borderless' AND T2.language = 'Russian'
SELECT CAST(SUM(CASE WHEN T2.language = 'French' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.isStorySpotlight = 1
SELECT COUNT(*) FROM cards WHERE toughness = 99;
SELECT name FROM cards WHERE artist = 'Aaron Boyd'
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND availability LIKE '%mtgo%'; 
SELECT id FROM cards WHERE convertedManaCost = 0; 
SELECT DISTINCT layout FROM cards WHERE keywords LIKE '%Flying%'
SELECT COUNT(*) FROM cards WHERE originalType = 'Summon - Angel' AND subtypes NOT LIKE '%Angel%'
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;
SELECT id FROM cards WHERE duelDeck = 'a';
SELECT edhrecRank FROM cards WHERE frameVersion = '2015';
SELECT T1.artist FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Chinese Simplified';
SELECT T1.name FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.availability = 'paper' AND T2.language = 'Japanese'
SELECT COUNT(*) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.status = 'Banned' AND T1.borderColor = 'white'
SELECT T1.uuid, T2.language FROM legalities AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.format = 'legacy'
SELECT T2.text FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Beacon of Immortality'; 
SELECT COUNT(DISTINCT T1.uuid), T2.status FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.frameVersion = 'future' AND T2.status = 'legal'; 
SELECT c.name, c.colors FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.code = 'OGW'; 
SELECT T1.name, T2.language FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid INNER JOIN sets AS T3 ON T1.setCode = T3.code WHERE T1.convertedManaCost = 5 AND T3.code = '10E'; 
SELECT T1.name, T3.date FROM cards AS T1 INNER JOIN rulings AS T3 ON T1.uuid = T3.uuid WHERE T1.originalType = 'Creature - Elf'
SELECT T1.colors ,  T2.format FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.id BETWEEN 1 AND 20;
SELECT T1.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.originalType = 'Artifact' AND T1.colors = 'B' AND T2.language != 'English'
SELECT T1.name FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'uncommon' ORDER BY T2.date ASC LIMIT 3
SELECT COUNT(*) FROM cards WHERE artist = 'John Avon' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NULL
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL; 
SELECT COUNT(*) FROM cards WHERE artist = 'UDON' AND availability LIKE '%mtgo%' AND hand = '-1'; 
SELECT COUNT(*) FROM cards WHERE frameVersion = '1993' AND availability = 'paper' AND hasContentWarning = 1
SELECT manaCost FROM cards WHERE layout = 'normal' AND frameVersion = 2003 AND borderColor = 'black' AND availability = 'mtgo,paper'; 
SELECT SUM(REPLACE(manaCost, '[', '') + REPLACE(manaCost, ']', '')) AS total_unconverted_mana_cost FROM cards WHERE artist = 'Rob Alexander'; 
SELECT DISTINCT subtype FROM cards WHERE availability = 'arena' UNION SELECT DISTINCT supertype FROM cards WHERE availability = 'arena'
SELECT DISTINCT T1.setCode FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Spanish'
SELECT CAST(SUM(CASE WHEN isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(id) FROM cards WHERE frameEffects = 'legendary'; 
SELECT CAST(SUM(CASE WHEN isStorySpotlight = 1 AND isTextless = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards
SELECT T2.name ,  CAST(COUNT(CASE WHEN T1.language = 'Spanish' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.id) FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid GROUP BY T2.name
SELECT T2.language FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.baseSetSize = 309
SELECT COUNT(*) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Portuguese (Brazil)' AND T1.block = 'Commander'
SELECT id FROM cards WHERE type LIKE '%Creature%' AND uuid IN (SELECT uuid FROM legalities WHERE status = 'Legal'); 
SELECT T1.subtypes, T1.supertypes FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'German' AND T1.subtypes IS NOT NULL AND T1.supertypes IS NOT NULL
SELECT COUNT(*) FROM cards WHERE power IS NULL OR power = '*' AND text LIKE '%triggered ability%'
SELECT COUNT(*) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid INNER JOIN rulings AS T3 ON T1.uuid = T3.uuid WHERE T2.format = 'premodern' AND T3.text LIKE '%This is a triggered mana ability.%' AND T1.side IS NULL
SELECT id FROM cards WHERE artist = 'Erica Yang' AND availability LIKE '%paper%' AND uuid IN ( SELECT uuid FROM legalities WHERE format = 'pauper' )
SELECT artist FROM cards WHERE uuid = (SELECT uuid FROM foreign_data WHERE text LIKE '%Das perfekte Gegenmittel zu einer dichten Formation%')
SELECT T1.name FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.language = 'French' AND T2.type = 'Creature' AND T2.layout = 'normal' AND T2.borderColor = 'black' AND T2.artist = 'Matthew D. Wilson'
SELECT COUNT(DISTINCT T1.uuid) FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'rare' AND T2.date = '2007-02-01'
SELECT T2.language FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.block = 'Ravnica' AND T1.baseSetSize = 180
SELECT CAST(SUM(CASE WHEN T1.hasContentWarning = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.format = 'commander' AND T2.status = 'legal'
SELECT CAST(SUM(CASE WHEN T1.language = 'French' AND (T2.power IS NULL OR T2.power = '*') THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T2.power IS NULL OR T2.power = '*' THEN 1 ELSE 0 END) FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.power IS NULL OR T2.power = '*'
SELECT CAST(SUM(CASE WHEN T1.language = 'Japanese' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.language) FROM foreign_data AS T1 INNER JOIN set_translations AS T2 ON T1.setcode = T2.setcode WHERE T2.translation LIKE '%Expansion%'
SELECT DISTINCT availability FROM cards WHERE artist = 'Daren Bader'
SELECT COUNT(*) FROM cards WHERE borderColor = 'borderless' AND edhrecRank > 12000;
SELECT COUNT(*) FROM cards WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1; 
SELECT name FROM cards WHERE power IS NULL OR power = '*' AND promoTypes LIKE '%arena%' ORDER BY name ASC LIMIT 3
SELECT T1.language FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.multiverseid = 149934
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL ORDER BY cardKingdomFoilId LIMIT 3; 
SELECT CAST(SUM(CASE WHEN isTextless = 1 AND layout = 'normal' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards
SELECT number FROM cards WHERE side IS NULL AND subtypes = 'Angel,Wizard'
SELECT name FROM sets WHERE mtgoCode IS NULL OR mtgoCode = '' ORDER BY name LIMIT 3
SELECT T2.language FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.mcmName = 'Archenemy' AND T2.language IN ('English', 'French', 'German', 'Italian', 'Spanish')
SELECT T1.name, T2.translation FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.id = 5
SELECT T2.language, T1.type FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.id = 206
SELECT T2.code, T2.id FROM foreign_data AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.language = 'Italian' AND T2.block = 'Shadowmoor' ORDER BY T2.name LIMIT 2
SELECT T1.id FROM sets AS T1 JOIN foreign_data AS T2 ON T1.code = T2.set_code WHERE T1.isForeignOnly = 1 AND T2.language = 'Japanese'
SELECT T1.name FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Russian' ORDER BY T1.baseSetSize DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN T1.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Chinese Simplified'
SELECT COUNT(DISTINCT T1.setCode) FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.language = 'Japanese' AND (T2.mtgoCode IS NULL OR T2.mtgoCode = '')
SELECT id FROM cards WHERE borderColor = 'black';
SELECT id FROM cards WHERE frameEffects = 'extendedart'; 
SELECT name FROM cards WHERE borderColor = 'black' AND isFullArt = 1;
SELECT T2.language FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.id = 174
SELECT name FROM sets WHERE code = 'ALL';
SELECT T1.language FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'A Pedra Fellwar'
SELECT code FROM sets WHERE releaseDate = '2007-07-13'; 
SELECT baseSetSize, code FROM sets WHERE block = 'Masques' OR block = 'Mirage'; 
SELECT setCode FROM sets WHERE TYPE = 'expansion';
SELECT T1.name, T1.type FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.watermark = 'Boros'
SELECT T1.language, T1.flavorText, T2.type FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.watermark = 'colorpie'
SELECT CAST(SUM(CASE WHEN T1.convertedManaCost = 10 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Abyssal Horror'
SELECT DISTINCT setCode FROM sets WHERE type LIKE '%expansion commander%'
SELECT T2.name, T2.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'Abzan'
SELECT T1.language, T2.type FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.watermark = 'Azorius'
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL; 
SELECT COUNT(*) FROM cards WHERE availability LIKE '%paper%' AND hand = '3';
SELECT name FROM cards WHERE isTextless = 0
SELECT convertedManaCost FROM cards WHERE name = 'Ancestor`s Chosen'
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND (power = '*' OR power IS NULL);
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL
SELECT DISTINCT subtypes, supertypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer'
SELECT DISTINCT T1.purchaseUrls FROM cards AS T1 WHERE T1.promoTypes LIKE '%bundle%'
SELECT COUNT(DISTINCT artist) FROM cards WHERE borderColor = 'black' AND availability LIKE '%arena,mtgo%'
SELECT name FROM cards WHERE name IN ('Serra Angel', 'Shrine Keeper') ORDER BY convertedManaCost DESC LIMIT 1
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer'
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3
SELECT T1.translation FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.language = 'Italian' AND T2.name LIKE '%Ancestor%s Chosen%'
SELECT COUNT(*) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation LIKE '%Angel of Mercy%'
SELECT T1.name FROM foreign_data AS T1 INNER JOIN sets AS T2 ON T1.setcode = T2.code INNER JOIN set_translations AS T3 ON T2.code = T3.setcode WHERE T3.translation = 'Hauptset Zehnte Edition'
SELECT EXISTS ( SELECT 1 FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Ancestor''s Chosen' AND T2.language = 'Korean' )
SELECT COUNT(*) FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T2.translation = 'Hauptset Zehnte Edition' AND T1.artist = 'Adam Rex'; 
SELECT T1.baseSetSize FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Hauptset Zehnte Edition'; 
SELECT T2.translation FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Eighth Edition' AND T2.language = 'Chinese Simplified'
SELECT mtgoCode FROM sets WHERE code IN ( SELECT setCode FROM cards WHERE name = 'Angel of Mercy' ) AND mtgoCode IS NOT NULL;
SELECT T1.releaseDate FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T2.name = 'Ancestor''s Chosen'
SELECT T1.type FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Hauptset Zehnte Edition'
SELECT COUNT(*) FROM set_translations WHERE block = 'Ice Age' AND language = 'Italian' AND translation IS NOT NULL;
SELECT T2.isForeignOnly FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Adarkar Valkyrie'
SELECT COUNT(DISTINCT s.code) FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian' AND s.baseSetSize < 100; 
SELECT COUNT(*) FROM cards WHERE setCode IN (SELECT code FROM sets WHERE name = 'Coldsnap') AND borderColor = 'black'; 
SELECT T1.name FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' ORDER BY T1.convertedManaCost DESC LIMIT 1
SELECT artist FROM cards WHERE setCode = 'Coldsnap' AND artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy')
SELECT T1.id FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' AND T1.number = 4; 
SELECT COUNT(*) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' AND T1.convertedManaCost > 5 AND (T1.power = '*' OR T1.power IS NULL); 
SELECT T2.flavorText FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Italian' AND T1.name = 'Ancestor''s Chosen'
SELECT T1.language FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Ancestor''s Chosen' AND T1.flavorText IS NOT NULL
SELECT T2.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'German' AND T1.name = 'Ancestor''s Chosen'
SELECT T2.text FROM sets AS T1 INNER JOIN rulings AS T2 ON T1.code = T2.uuid WHERE T1.name = 'Coldsnap' AND T2.language = 'Italian'; 
SELECT T1.name  FROM foreign_data AS T1  JOIN cards AS T2 ON T1.uuid = T2.uuid  JOIN sets AS T3 ON T2.setCode = T3.code  WHERE T3.name = 'Coldsnap' AND T1.language = 'Italian'  ORDER BY T2.convertedManaCost DESC  LIMIT 1; 
SELECT T1.date FROM rulings AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Reminisce'
SELECT CAST(SUM(CASE WHEN T1.convertedManaCost = 7 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap'
SELECT CAST(SUM(CASE WHEN cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards WHERE setCode IN ( SELECT code FROM sets WHERE name = 'Coldsnap' )
SELECT code FROM sets WHERE releaseDate = '2017-07-14'; 
SELECT keyruneCode FROM sets WHERE code = 'PKHC'
SELECT mcmId FROM sets WHERE code = 'SS2'
SELECT mcmName FROM sets WHERE releaseDate = '2017-06-09';
SELECT TYPE FROM sets WHERE name LIKE '%From the Vault: Lore%'
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized';
SELECT c.name, r.text, CASE WHEN c.hasContentWarning = 1 THEN 'Yes' ELSE 'No' END AS has_missing_or_degraded_properties FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Jim Pavelec'; 
SELECT T1.releaseDate FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T2.name = 'Evacuation'
SELECT T2.baseSetSize FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.translation = 'Rinascita di Alara'
SELECT T1.type FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Huitième édition'
SELECT T2.translation FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Tendo Ice Bridge' AND T2.language = 'French'; 
SELECT COUNT(*) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Tenth Edition' AND T2.translation IS NOT NULL
SELECT T2.translation FROM foreign_data AS T1 INNER JOIN set_translations AS T2 ON T1.setcode = T2.setcode WHERE T1.name = 'Fellwar Stone' AND T1.language = 'Japanese'; 
SELECT T1.name FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Journey into Nyx Hero''s Path' ORDER BY T1.convertedManaCost DESC LIMIT 1
SELECT T1.releaseDate FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Ola de frío'
SELECT T2.type FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Samite Pilgrim'
SELECT COUNT(*) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'World Championship Decks 2004' AND T1.convertedManaCost = 3; 
SELECT T1.translation FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.language = 'Chinese Simplified' AND T2.name = 'Mirrodin'; 
SELECT CAST(SUM(CASE WHEN T1.isNonFoilOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Japanese'
SELECT CAST(SUM(CASE WHEN T1.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.set_code = T2.set_code WHERE T2.language = 'Portuguese (Brazil)'; 
SELECT DISTINCT availability FROM cards WHERE isTextless = 1 AND artist != 'Aleksi Briclot'
SELECT id FROM sets ORDER BY baseSetSize DESC LIMIT 1
SELECT artist FROM cards WHERE side IS NULL ORDER BY convertedManaCost DESC LIMIT 1
SELECT frameEffects FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL GROUP BY frameEffects ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM cards WHERE duelDeck = 'a' AND power IS NULL OR power = '*' AND hasFoil = 0
SELECT id FROM sets WHERE type = 'commander' ORDER BY totalSetSize DESC LIMIT 1
SELECT T1.name FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.format = 'duel' ORDER BY CAST(REPLACE(SUBSTR(manaCost, 2), '{', '') AS REAL) DESC LIMIT 10
SELECT T1.originalReleaseDate, GROUP_CONCAT(DISTINCT T2.format) AS legal_formats FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'mythic' ORDER BY T1.originalReleaseDate ASC LIMIT 1
SELECT COUNT(*) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Volkan Baǵa' AND T2.language = 'French'
SELECT COUNT(*) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Abundance' AND T1.types = 'Enchantment' AND T1.rarity = 'rare' AND T2.status = 'Legal'
SELECT format, GROUP_CONCAT(name) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE status = 'Banned' GROUP BY format ORDER BY COUNT(status = 'Banned') DESC LIMIT 1
SELECT T2.language FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Battlebond'
SELECT artist, GROUP_CONCAT(DISTINCT format) FROM cards JOIN legalities ON cards.uuid = legalities.uuid GROUP BY artist ORDER BY COUNT(*) ASC LIMIT 1
SELECT T1.status FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.frameVersion = '1997' AND T2.artist = 'D. Alexander Gregory' AND T2.hasContentWarning = 1 AND T1.format = 'legacy'
SELECT T1.name ,  T2.format FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.edhrecRank = 1 AND T2.status = 'Banned'
SELECT AVG(T1.id), T2.language FROM sets AS T1 INNER JOIN foreign_data AS T2 ON T2.uuid = T1.code WHERE T1.releaseDate BETWEEN '2012-01-01' AND '2015-12-31' GROUP BY T2.language ORDER BY COUNT(T2.language) DESC LIMIT 1
SELECT artist FROM cards WHERE borderColor = 'black' AND availability LIKE '%arena%' GROUP BY artist;
SELECT T1.uuid FROM legalities AS T1 JOIN sets AS T2 ON T1.set_code = T2.code WHERE T2.name = 'Old School' AND (T1.status = 'banned' OR T1.status = 'restricted')
SELECT COUNT(*) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability LIKE '%paper%'
SELECT T1.text FROM rulings AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.artist = 'Kev Walker' ORDER BY T1.date DESC
SELECT T1.name, T3.format FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid INNER JOIN sets AS T3 ON T1.setCode = T3.code WHERE T3.name = 'Hour of Devastation' AND T2.status = 'Legal'
SELECT T1.name FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language LIKE '%Korean%' AND NOT EXISTS (SELECT 1 FROM set_translations AS T3 WHERE T3.setCode = T1.code AND T3.language LIKE '%Japanese%')
SELECT T1.frameVersion FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Allen Williams' AND T2.status = 'Banned'
SELECT DisplayName, MAX(Reputation) AS HighestReputation FROM users WHERE DisplayName IN ('Harlan', 'Jarrod Dixon') GROUP BY DisplayName; 
SELECT DisplayName FROM users WHERE STRFTIME('%Y', CreationDate) = '2011'
SELECT COUNT(*) FROM users WHERE LastAccessDate > '2014-09-01'
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1
SELECT COUNT(*) FROM users WHERE Upvotes > 100 AND Downvotes > 1; 
SELECT COUNT(Id) FROM users WHERE CreationDate > '2013-12-31' AND Views > 10
SELECT COUNT(*) FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'csgillespie'; 
SELECT Title FROM posts WHERE OwnerDisplayName = 'csgillespie'
SELECT OwnerDisplayName FROM posts WHERE Title = 'Eliciting priors from experts'
SELECT Title FROM posts WHERE OwnerDisplayName = 'csgillespie' ORDER BY ViewCount DESC LIMIT 1; 
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId ORDER BY p.FavoriteCount DESC LIMIT 1
SELECT SUM(T2.CommentCount) AS TotalComments FROM users AS T1 JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName = 'csgillespie'; 
SELECT MAX(AnswerCount) AS MostAnswers FROM posts WHERE OwnerDisplayName = 'csgillespie'; 
SELECT OwnerDisplayName FROM posts WHERE Title = 'Examples for teaching: Correlation does not mean causation'
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = 'csgillespie' AND ParentId IS NULL; 
SELECT DISTINCT OwnerDisplayName FROM posts WHERE ClosedDate IS NOT NULL
SELECT COUNT(*) FROM posts AS p JOIN users AS u ON p.OwnerUserId = u.Id WHERE u.Age > 65 AND p.Score >= 20; 
SELECT T1.Location FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T2.Title = 'Eliciting priors from experts'
SELECT Body FROM posts WHERE Id = ( SELECT ExcerptPostId FROM tags WHERE TagName = 'bayesian' )
SELECT Body FROM posts WHERE Id = ( SELECT ExcerptPostId FROM tags ORDER BY Count DESC LIMIT 1 )
SELECT COUNT(*) FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie') 
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie'; 
SELECT COUNT(*) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'csgillespie' AND STRFTIME('%Y', T1.Date) = '2011'
SELECT T1.DisplayName FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId GROUP BY T1.DisplayName ORDER BY COUNT(T2.Id) DESC LIMIT 1
SELECT AVG(Score) FROM posts WHERE OwnerDisplayName = 'csgillespie'
SELECT CAST(COUNT(T1.Id) AS REAL) / COUNT(DISTINCT T1.DisplayName) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.Views > 200
SELECT CAST(SUM(CASE WHEN T2.Age > 65 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.Id) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Score > 5
SELECT COUNT(*) FROM votes WHERE UserId = 58 AND CreationDate LIKE '2010-07-19%'
SELECT CreationDate FROM votes GROUP BY CreationDate ORDER BY COUNT(Id) DESC LIMIT 1
SELECT COUNT(Id) FROM badges WHERE Name = 'Revival'; 
SELECT p.Title FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.Score = (SELECT MAX(Score) FROM comments); 
SELECT COUNT(*) FROM comments WHERE PostId = (SELECT Id FROM posts WHERE ViewCount = 1910)
SELECT FavoriteCount FROM posts WHERE Id IN (SELECT PostId FROM comments WHERE UserId = 3025 AND CreationDate = '2014-04-23 20:29:39.0') 
SELECT Text FROM comments WHERE PostId IN (SELECT Id FROM posts WHERE ParentId = 107829 AND CommentCount = 1) 
SELECT CASE WHEN ClosedDate IS NULL THEN 'Not Well-Finished' ELSE 'Well-Finished' END AS PostStatus FROM posts WHERE OwnerUserId = 23853 AND CreationDate = '2013-07-12 09:08:18.0'; 
SELECT u.Reputation FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE p.Id = 65041; 
SELECT COUNT(*) FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'Tiago Pasqualini'; 
SELECT T1.DisplayName FROM users AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.UserId WHERE T2.Id = 6347
SELECT COUNT(*) FROM posts AS p JOIN votes AS v ON p.Id = v.PostId WHERE p.Title LIKE '%data visualization%' 
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'DatEpicCoderGuyWhoPrograms'; 
SELECT CAST(COUNT(posts.Id) AS REAL) / COUNT(votes.Id) FROM posts INNER JOIN votes ON posts.OwnerUserId = votes.UserId WHERE posts.OwnerUserId = 24
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer'
SELECT Text FROM comments WHERE Score = 17; 
SELECT DisplayName FROM users WHERE WebsiteUrl = 'http://stackoverflow.com'
SELECT Name FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'SilentGhost') 
SELECT UserDisplayName FROM comments WHERE Text = 'thank you user93!'; 
SELECT Text FROM comments WHERE UserDisplayName = 'A Lion'
SELECT u.DisplayName, u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Title = 'Understanding what Dassault iSight is doing?'; 
SELECT T2.Text FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.Title = 'How does gentle boosting differ from AdaBoost?'
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Necromancer' LIMIT 10
SELECT LastEditorDisplayName FROM posts WHERE Title = 'Open source tools for visualizing multi-dimensional data?'
SELECT Title FROM posts WHERE LastEditorDisplayName = 'Vebjorn Ljosa'
SELECT SUM(posts.Score), users.WebsiteUrl FROM posts JOIN users ON posts.LastEditorUserId = users.Id WHERE users.DisplayName = 'Yevgeny'; 
SELECT c.Text FROM comments AS c JOIN posts AS p ON c.PostId = p.Id WHERE p.Title = 'Why square the difference instead of taking the absolute value in standard deviation?'
SELECT SUM(T2.BountyAmount) FROM posts AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.PostId WHERE T1.Title LIKE '%data%' AND T2.VoteTypeId = 8
SELECT u.DisplayName FROM users u JOIN votes v ON u.Id = v.UserId JOIN posts p ON v.PostId = p.Id WHERE v.BountyAmount = 50 AND p.Title LIKE '%variance%'
SELECT AVG(posts.ViewCount) AS AverageViewCount, posts.Title, posts.Body AS Comment FROM posts JOIN postTags ON posts.Id = postTags.PostId JOIN tags ON postTags.TagId = tags.Id WHERE tags.TagName LIKE '%<humor>%' GROUP BY posts.Id; 
SELECT COUNT(*) FROM comments WHERE UserId = 13;
SELECT Id FROM users ORDER BY Reputation DESC LIMIT 1
SELECT UserId FROM posts ORDER BY Views ASC LIMIT 1
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Supporter' AND STRFTIME('%Y', Date) = '2011'
SELECT COUNT(UserId) AS UserCount FROM badges GROUP BY UserId HAVING COUNT(Name) > 5; 
SELECT COUNT(DISTINCT u.Id) FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'New York, NY' AND b.Name IN ('Teacher', 'Supporter')
SELECT u.DisplayName, u.Reputation FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE p.Id = 1
SELECT u.UserId FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE p.Views >= 1000 GROUP BY u.UserId HAVING COUNT(DISTINCT p.Id) = 1
SELECT u.DisplayName, b.Name FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Id IN ( SELECT UserId FROM comments GROUP BY UserId ORDER BY COUNT(Id) DESC LIMIT 1 )
SELECT COUNT(DISTINCT u.Id) AS UserCount FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location LIKE '%India%' AND b.Name = 'Teacher'; 
SELECT ((SUM(CASE WHEN STRFTIME('%Y', Date) = '2010' THEN 1 ELSE 0 END) / COUNT(Id) - SUM(CASE WHEN STRFTIME('%Y', Date) = '2011' THEN 1 ELSE 0 END) / COUNT(Id)) * 100) AS PercentageDifference FROM badges WHERE Name = 'Student'
SELECT PostHistoryTypeId ,  COUNT(DISTINCT UserId) FROM postHistory WHERE PostId = 3720 GROUP BY PostHistoryTypeId
SELECT p.Title, p.ViewCount FROM posts p JOIN postlinks pl ON p.Id = pl.RelatedPostId WHERE pl.PostId = 61217
SELECT Score ,  LinkTypeId FROM postLinks WHERE PostId = 395
SELECT PostId, UserId FROM posts WHERE Score > 60; 
SELECT SUM(FavoriteCount) FROM posts WHERE OwnerUserId = 686 AND STRFTIME('%Y', CreationDate) = '2011'
SELECT AVG(T1.UpVotes), AVG(T2.Age) FROM users AS T1 JOIN posts AS T2 ON T1.Id = T2.OwnerUserId GROUP BY T1.Id HAVING COUNT(T2.UserId) > 10
SELECT COUNT(UserId) FROM badges WHERE Name = 'Announcer'; 
SELECT Name FROM badges WHERE Date = '2010-07-19 19:39:08.0'; 
SELECT COUNT(*) FROM comments WHERE Score > 60;
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:16:14.0'
SELECT COUNT(Id) FROM posts WHERE Score = 10; 
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.Reputation = ( SELECT MAX(Reputation) FROM users )
SELECT T2.Reputation FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Date = '2010-07-19 19:39:08.0'
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'Pierre'
SELECT T2.Date FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.Location = 'Rochester, NY'
SELECT CAST(SUM(CASE WHEN Name = 'Teacher' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(Id) FROM badges
SELECT CAST(SUM(CASE WHEN u.Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(u.Id) FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Organizer'; 
SELECT SUM(Score) FROM comments WHERE PostId IN (SELECT Id FROM posts WHERE CreationDate = '2010-07-19 19:19:56.0')
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:37:33.0'
SELECT u.Age FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'Vienna, Austria'; 
SELECT COUNT(b.UserId) AS NumberOfAdultSupporters FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age BETWEEN 19 AND 65; 
SELECT SUM(users.Views) AS TotalViews FROM badges JOIN users ON badges.UserId = users.Id WHERE badges.Date = '2010-07-19 19:39:08.0'; 
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId ORDER BY T1.Reputation ASC LIMIT 1
SELECT T1.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'Sharpie'
SELECT COUNT(b.UserId) FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age > 65
SELECT DisplayName FROM users WHERE Id = 30;
SELECT COUNT(*) FROM users WHERE Location = 'New York, NY';
SELECT COUNT(*) FROM votes WHERE STRFTIME('%Y', CreationDate) = '2010'
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65;
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN STRFTIME('%Y', CreationDate) = '2010' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN STRFTIME('%Y', CreationDate) = '2011' THEN 1 ELSE 0 END) AS Ratio FROM votes
SELECT T1.TagName FROM tags AS T1 INNER JOIN postTags AS T2 ON T1.Id = T2.TagId INNER JOIN posts AS T3 ON T2.PostId = T3.Id INNER JOIN users AS T4 ON T3.OwnerUserId = T4.Id WHERE T4.DisplayName = 'John Salvatier' 
SELECT COUNT(*) FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'Daniel Vassallo'
SELECT COUNT(*) FROM users AS u JOIN votes AS v ON u.Id = v.UserId WHERE u.DisplayName = 'Harlan'
SELECT Id FROM posts WHERE OwnerDisplayName = 'slashnick' ORDER BY AnswerCount DESC LIMIT 1
SELECT MAX(SUM(ViewCount)) AS MaxPopularity FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName IN ('Harvey Motulsky', 'Noah Snyder') GROUP BY users.DisplayName; 
SELECT COUNT(*) FROM posts AS p JOIN users AS u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Matt Parker' AND p.VoteCount > 4; 
SELECT COUNT(c.Id) AS NegativeCommentsCount FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score < 60 AND u.DisplayName = 'Neil McGuigan'; 
SELECT DISTINCT t.TagName FROM tags AS t JOIN posts AS p ON t.Id = p.Tags WHERE p.OwnerDisplayName = 'Mark Meckes' AND p.CommentCount = 0
SELECT T2.DisplayName FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Organizer'
SELECT CAST(SUM(CASE WHEN T3.TagName = 'r' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.PostId) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId INNER JOIN posthistory AS T3 ON T2.Id = T3.PostId WHERE T1.DisplayName = 'Community'
SELECT SUM(CASE WHEN u.DisplayName = 'Mornington' THEN p.ViewCount ELSE 0 END) - SUM(CASE WHEN u.DisplayName = 'Amos' THEN p.ViewCount ELSE 0 END) AS ViewDifference FROM posts p JOIN users u ON p.OwnerUserId = u.Id
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Commentator' AND STRFTIME('%Y', Date) = '2014'; 
SELECT COUNT(*) FROM posts WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59';
SELECT DisplayName , Age FROM users ORDER BY Views DESC LIMIT 1
SELECT LastEditDate, LastEditorUserId FROM posts WHERE Title = 'Detecting a given face in a database of facial images'
SELECT COUNT(*) FROM comments WHERE UserId = 13 AND Score < 60; 
SELECT p.Title, c.UserDisplayName FROM posts AS p JOIN comments AS c ON p.Id = c.PostId WHERE c.Score > 60
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE STRFTIME('%Y', b.Date) = '2011' AND u.Location = 'North Pole'; 
SELECT OwnerDisplayName, WebsiteUrl FROM posts WHERE FavoriteCount > 150;
SELECT COUNT(*) AS PostHistoryCount, MAX(CreationDate) AS LastEditDate FROM posts AS p JOIN postHistory AS ph ON p.Id = ph.PostId WHERE Title = 'What is the best introductory Bayesian statistics textbook?'
SELECT T2.LastAccessDate, T2.Location FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Outliers'
SELECT T2.Title FROM postLinks AS T1 INNER JOIN posts AS T2 ON T1.RelatedPostId = T2.Id WHERE T2.Title LIKE '%monitoring a value over time%'
SELECT p.Id, b.Name FROM posts AS p INNER JOIN badges AS b ON p.OwnerUserId = b.UserId WHERE p.CreationDate LIKE '%2013%' AND b.Date LIKE '%2013%' AND p.OwnerDisplayName = 'Samuel'
SELECT OwnerDisplayName FROM posts ORDER BY ViewCount DESC LIMIT 1
SELECT DisplayName, Location FROM users WHERE Id IN ( SELECT OwnerUserId FROM posts WHERE Id = ( SELECT ExcerptPostId FROM tags WHERE TagName = 'hypothesis-testing' ) )
SELECT T2.Title, T1.LinkTypeId FROM postLinks AS T1 INNER JOIN posts AS T2 ON T1.RelatedPostId = T2.Id WHERE T1.PostId = ( SELECT Id FROM posts WHERE Title = 'What are principal component scores?' )
SELECT T2.OwnerDisplayName FROM posts AS T1 INNER JOIN posts AS T2 ON T1.ParentId = T2.Id ORDER BY T1.Score DESC LIMIT 1
SELECT DisplayName, WebsiteUrl FROM users WHERE Id IN (SELECT UserId FROM votes WHERE VoteTypeId = 8 ORDER BY BountyAmount DESC LIMIT 1)
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5
SELECT COUNT(*) FROM tags WHERE Count BETWEEN 5000 AND 7000;
SELECT OwnerUserId FROM posts ORDER BY FavoriteCount DESC LIMIT 1
SELECT Age FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users) 
SELECT COUNT(DISTINCT PostId) FROM votes WHERE YEAR(CreationDate) = 2011 AND BountyAmount = 50
SELECT Id FROM users ORDER BY Age ASC LIMIT 1
SELECT SUM(Score) FROM posts WHERE LasActivityDate LIKE '2010-07-19%' 
SELECT CAST(SUM(CASE WHEN STRFTIME('%Y', CreationDate) = '2010' AND AnswerCount <= 2 THEN 1 ELSE 0 END) AS REAL) / 12 FROM postLinks
SELECT PostId FROM votes WHERE UserId = 1465 ORDER BY FavoriteCount DESC LIMIT 1
SELECT T2.Title FROM postLinks AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id ORDER BY T1.CreationDate ASC LIMIT 1
SELECT T1.DisplayName FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId GROUP BY T1.Id ORDER BY COUNT(T2.Name) DESC LIMIT 1
SELECT MIN(CreationDate) FROM votes AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'chl'
SELECT MIN(T2.CreationDate) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId ORDER BY T1.Age ASC LIMIT 1
SELECT T1.DisplayName FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T2.Name = 'Autobiographer' ORDER BY T2.Date ASC LIMIT 1
SELECT COUNT(DISTINCT u.Id) AS UserCount FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE u.Location = 'United Kingdom' AND p.FavoriteCount >= 4; 
SELECT AVG(PostId) FROM votes WHERE UserId IN (SELECT Id FROM users ORDER BY Age DESC LIMIT 1)
SELECT DisplayName FROM users ORDER BY Reputation DESC LIMIT 1
SELECT COUNT(*) FROM users WHERE Reputation > 2000 AND Views > 1000
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = 'Jay Stevens' AND STRFTIME('%Y', CreationDate) = '2010'
SELECT Id, Title FROM posts WHERE OwnerDisplayName = 'Harvey Motulsky' ORDER BY ViewCount DESC LIMIT 1
SELECT Id, Title FROM posts ORDER BY Score DESC LIMIT 1
SELECT AVG(Score) FROM posts WHERE OwnerDisplayName = 'Stephen Turner'; 
SELECT DISTINCT u.DisplayName FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE p.ViewCount > 20000 AND STRFTIME('%Y', p.CreaionDate) = '2011'
SELECT Id, OwnerDisplayName FROM posts WHERE CreationDate LIKE '2010%' ORDER BY FavoriteCount DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN YEAR(p.CreationDate) = 2011 AND u.Reputation > 1000 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM posts p JOIN users u ON p.OwnerUserId = u.Id
SELECT CAST(SUM(CASE WHEN Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(Id) FROM users
SELECT SUM(ViewCount) AS TotalViews, u.DisplayName AS LastPoster FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Text LIKE '%Computer Game Datasets%' ORDER BY p.LasActivityDate DESC LIMIT 1; 
SELECT COUNT(*) FROM posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts); 
SELECT COUNT(*) FROM comments WHERE PostId = ( SELECT Id FROM posts ORDER BY Score DESC LIMIT 1 )
SELECT COUNT(Id) FROM posts WHERE ViewCount > 35000 AND CommentCount = 0
SELECT DisplayName, Location FROM users WHERE Id = ( SELECT LastEditorUserId FROM posts WHERE Id = 183 ORDER BY LastEditDate DESC LIMIT 1 )
SELECT Name FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Emmett') ORDER BY Date DESC LIMIT 1
SELECT COUNT(Id) FROM users WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000
SELECT julianday(b.Date) - julianday(u.CreationDate) AS DaysToBadge FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Zolomon'; 
SELECT COUNT(DISTINCT p.Id) AS PostCount, COUNT(DISTINCT c.PostId) AS CommentCount FROM users u LEFT JOIN posts p ON u.Id = p.OwnerUserId LEFT JOIN comments c ON u.Id = c.UserId WHERE u.CreationDate = (SELECT MAX(CreationDate) FROM users); 
SELECT T2.Text, T2.UserDisplayName FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.Title = 'Analysing wind data with R' ORDER BY T2.CreationDate DESC LIMIT 10;
SELECT COUNT(UserId) FROM badges WHERE Name = 'Citizen Patrol'; 
SELECT COUNT(T1.Id) FROM posts AS T1 INNER JOIN postTags AS T2 ON T1.Id = T2.PostId INNER JOIN tags AS T3 ON T2.TagId = T3.Id WHERE T3.TagName = 'careers'
SELECT Reputation, ViewCount FROM users WHERE DisplayName = 'Jarrod Dixon'
SELECT COUNT(CASE WHEN PostId IN ( SELECT Id FROM posts WHERE Title = 'Clustering 1D data' ) THEN 1 ELSE NULL END) AS TotalCommentsAnswers FROM comments UNION ALL SELECT COUNT(CASE WHEN PostId IN ( SELECT Id FROM posts WHERE Title = 'Clustering 1D data' ) THEN 1 ELSE NULL END) AS TotalCommentsAnswers FROM posthistory
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat'
SELECT COUNT(*) FROM votes WHERE BountyAmount >= 30; 
SELECT CAST(SUM(CASE WHEN Score > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM posts AS stats_posts JOIN users AS stats_users ON stats_posts.OwnerUserId = stats_users.Id ORDER BY stats_users.Reputation DESC LIMIT 1
SELECT COUNT(*) FROM posts WHERE Score < 20;
SELECT COUNT(Id) FROM tags WHERE Id < 15 AND Count <= 20
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample'; 
SELECT u.Reputation, u.UpVotes FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text LIKE '%fine, you win :)%'; 
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title LIKE '%linear regression%'; 
SELECT Text FROM comments WHERE PostId IN (SELECT Id FROM posts WHERE ViewCount BETWEEN 100 AND 150) ORDER BY Score DESC LIMIT 1
SELECT T2.CreationDate , TIMESTAMPDIFF(YEAR, T2.CreationDate, GETDATE()) AS Age FROM comments AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Text LIKE '%http://%';
SELECT COUNT(DISTINCT PostId) FROM comments WHERE Score = 0 AND PostId IN ( SELECT Id FROM posts WHERE ViewCount < 5 )
SELECT COUNT(*) FROM posts AS p JOIN comments AS c ON p.Id = c.PostId WHERE p.CommentCount = 1 AND c.Score = 0; 
SELECT COUNT(DISTINCT c.UserId) AS TotalUsers FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score = 0 AND u.Age = 40; 
SELECT p.Id, c.Text FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Title = 'Group differences on a five point Likert item'
SELECT SUM(CASE WHEN T2.Text = 'R is also lazy evaluated.' THEN 1 ELSE 0 END) FROM votes AS T1 INNER JOIN comments AS T2 ON T1.PostId = T2.PostId WHERE T1.VoteTypeId = 2
SELECT Text FROM comments WHERE UserDisplayName = 'Harvey Motulsky'
SELECT UserDisplayName FROM comments WHERE Score BETWEEN 1 AND 5 AND UserId NOT IN ( SELECT Id FROM users WHERE DownVotes > 0 )
SELECT CAST(SUM(CASE WHEN u.UpVotes = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(c.UserId) AS Percentage FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score BETWEEN 5 AND 10; 
SELECT T2.power_name FROM superhero AS T1 INNER JOIN hero_power AS T3 ON T1.id = T3.hero_id INNER JOIN superpower AS T2 ON T3.power_id = T2.id WHERE T1.superhero_name = '3-D Man'
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Super Strength'; 
SELECT COUNT(*) FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE sp.power_name = 'Super Strength' AND s.height_cm > 200; 
SELECT T1.full_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id GROUP BY T1.full_name HAVING COUNT(T2.power_id) > 15
SELECT COUNT(*) FROM superhero WHERE eye_colour_id IN ( SELECT id FROM colour WHERE colour = 'Blue' )
SELECT T3.colour FROM superhero AS T1 INNER JOIN colour AS T3 ON T1.skin_colour_id = T3.id WHERE T1.superhero_name = 'Apocalypse'
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN power AS T3 ON T2.power_id = T3.id INNER JOIN colour AS T4 ON T1.eye_colour_id = T4.id WHERE T4.colour = 'Blue' AND T3.power_name = 'Agility'
SELECT superhero_name FROM superhero WHERE eye_colour_id IN ( SELECT id FROM colour WHERE colour = 'Blue' ) AND hair_colour_id IN ( SELECT id FROM colour WHERE colour = 'Blond' )
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics'
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics' ORDER BY T1.height_cm DESC
SELECT T.publisher_name FROM ( SELECT DISTINCT T1.publisher_name FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id WHERE T2.superhero_name = 'Sauron' ) t
SELECT T2.colour, COUNT(T1.superhero_id) AS count FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id INNER JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T3.publisher_name = 'Marvel Comics' GROUP BY T2.colour ORDER BY count DESC;
SELECT AVG(height_cm) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics'
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id INNER JOIN publisher AS T4 ON T1.publisher_id = T4.id WHERE T4.publisher_name = 'Marvel Comics' AND T3.power_name = 'Super Strength'
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'DC Comics'
SELECT T3.publisher_name FROM hero_attribute AS T1 INNER JOIN attribute AS T2 ON T1.attribute_id = T2.id INNER JOIN superhero AS T3 ON T1.hero_id = T3.id WHERE T2.attribute_name = 'Speed' ORDER BY T1.attribute_value ASC LIMIT 1
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id INNER JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T2.colour = 'Gold' AND T3.publisher_name = 'Marvel Comics'
SELECT T2.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name = 'Blue Beetle II'
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.hair_colour_id = T2.id WHERE T2.colour = 'Blond'
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Intelligence' ORDER BY T2.attribute_value ASC LIMIT 1
SELECT T2.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.superhero_name = 'Copycat'
SELECT superhero_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Durability' AND T2.attribute_value < 50
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Death Touch'
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T1.gender_id = 2 AND T3.attribute_name = 'Strength' AND T2.attribute_value = 100;
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id GROUP BY T1.superhero_name ORDER BY COUNT(T2.power_id) DESC LIMIT 1
SELECT COUNT(*) FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Vampire')
SELECT CAST(SUM(CASE WHEN T1.alignment = 'Bad' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id), SUM(CASE WHEN T2.publisher_name = 'Marvel Comics' AND T1.alignment = 'Bad' THEN 1 ELSE 0 END) FROM alignment AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id
SELECT SUM(CASE WHEN T2.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) - SUM(CASE WHEN T2.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) AS difference FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id
SELECT id FROM publisher WHERE publisher_name = 'Star Trek'
SELECT AVG(attribute_value) FROM hero_attribute;
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL; 
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T2.id = 75
SELECT T2.power_name FROM superhero AS T1 INNER JOIN hero_power AS T3 ON T1.id = T3.hero_id INNER JOIN superpower AS T2 ON T3.power_id = T2.id WHERE T1.superhero_name = 'Deathlok'
SELECT AVG(weight_kg) FROM superhero WHERE gender_id = (SELECT id FROM gender WHERE gender = 'Female')
SELECT T1.power_name FROM superpower AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.power_id INNER JOIN superhero AS T3 ON T2.hero_id = T3.id INNER JOIN gender AS T4 ON T3.gender_id = T4.id WHERE T4.gender = 'Male' LIMIT 5
SELECT superhero_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Alien')
SELECT superhero_name FROM superhero WHERE height_cm BETWEEN 170 AND 190 AND eye_colour_id = 1
SELECT T2.power_name FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T1.hero_id = 56;
SELECT full_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Demi-God') LIMIT 5
SELECT COUNT(*) FROM superhero WHERE alignment_id = 2;
SELECT T2.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.weight_kg = 169
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.hair_colour_id = T2.id WHERE T1.height_cm = 185 AND T1.race_id = ( SELECT id FROM race WHERE race = 'Human' )
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.eye_colour_id ORDER BY T2.weight_kg DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN T2.publisher_id = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.height_cm BETWEEN 150 AND 180; 
SELECT superhero_name FROM superhero WHERE gender_id = 1 AND weight_kg > ( SELECT AVG(weight_kg) * 0.79 FROM superhero )
SELECT T2.power_name FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id GROUP BY T2.power_name ORDER BY COUNT(T2.power_name) DESC LIMIT 1
SELECT T1.attribute_value FROM hero_attribute AS T1 INNER JOIN superhero AS T2 ON T1.hero_id = T2.id WHERE T2.superhero_name = 'Abomination'
SELECT T2.power_name FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T1.hero_id = 1
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Stealth'
SELECT T1.full_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Strength' ORDER BY T2.attribute_value DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN skin_colour_id = 1 THEN 1 ELSE 0 END) AS REAL) / COUNT(id) FROM superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Dark Horse Comics'
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN publisher p ON s.publisher_id = p.id WHERE a.attribute_name = 'Durability' AND p.publisher_name = 'Dark Horse Comics' ORDER BY ha.attribute_value DESC LIMIT 1
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T2.full_name = 'Abraham Sapien'
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Flight'
SELECT T3.colour AS eye_colour, T4.colour AS hair_colour, T5.colour AS skin_colour FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id INNER JOIN colour AS T3 ON T1.eye_colour_id = T3.id INNER JOIN colour AS T4 ON T1.hair_colour_id = T4.id INNER JOIN colour AS T5 ON T1.skin_colour_id = T5.id INNER JOIN publisher AS T6 ON T1.publisher_id = T6.id WHERE T2.gender = 'Female' AND T6.publisher_name = 'Dark Horse Comics'
SELECT T1.superhero_name ,  T3.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T1.hair_colour_id = T1.skin_colour_id AND T1.hair_colour_id = T1.eye_colour_id
SELECT T1.race FROM race AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T2.superhero_name = 'A-Bomb'
SELECT CAST(COUNT(CASE WHEN T1.skin_colour_id = 5 THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.gender_id) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.skin_colour_id = T2.id INNER JOIN gender AS T3 ON T1.gender_id = T3.id WHERE T3.gender = 'Female'
SELECT T1.superhero_name ,  T2.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.full_name = 'Charles Chandler'
SELECT T1.gender FROM gender AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.gender_id WHERE T2.superhero_name = 'Agent 13'
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Adaptation'
SELECT COUNT(power_id) FROM hero_power AS HP JOIN superhero AS SH ON HP.hero_id = SH.id WHERE SH.superhero_name = 'Amazo'
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.full_name = 'Hunter Zolomon'
SELECT T1.height_cm FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Amber'
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id INNER JOIN colour AS T3 ON T1.hair_colour_id = T3.id WHERE T2.colour = 'Black' AND T3.colour = 'Black'
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.skin_colour_id WHERE T1.colour = 'Gold'
SELECT full_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Vampire')
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T2.alignment = 'Neutral'
SELECT COUNT(*) FROM superhero AS s JOIN hero_attribute AS ha ON s.id = ha.hero_id JOIN attribute AS a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Strength' AND ha.attribute_value = ( SELECT MAX(attribute_value) FROM hero_attribute WHERE attribute_id = ( SELECT id FROM attribute WHERE attribute_name = 'Strength' ) );
SELECT T1.race, T2.alignment FROM race AS T1 INNER JOIN alignment AS T2 ON T1.id = T2.id INNER JOIN superhero AS T3 ON T1.id = T3.race_id AND T2.id = T3.alignment_id WHERE T3.superhero_name = 'Cameron Hicks'
SELECT CAST(SUM(CASE WHEN T1.gender = 'Female' AND T2.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.publisher_name) FROM gender AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.gender_id INNER JOIN publisher AS T3 ON T2.publisher_id = T3.id
SELECT AVG(weight_kg) FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Alien')
SELECT ABS(( SELECT weight_kg FROM superhero WHERE full_name = 'Emil Blonsky' ) - ( SELECT weight_kg FROM superhero WHERE full_name = 'Charles Chandler' )) AS weight_difference
SELECT AVG(height_cm) FROM superhero GROUP BY id;
SELECT T2.power_name FROM superhero AS T1 INNER JOIN hero_power AS T3 ON T1.id = T3.hero_id INNER JOIN superpower AS T2 ON T3.power_id = T2.id WHERE T1.superhero_name = 'Abomination'
SELECT COUNT(*) FROM superhero WHERE race_id = 21 AND gender_id = 1; 
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Speed' ORDER BY T2.attribute_value DESC LIMIT 1
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3
SELECT T2.attribute_name ,  T1.attribute_value FROM hero_attribute AS T1 INNER JOIN attribute AS T2 ON T1.attribute_id = T2.id WHERE T1.hero_id = ( SELECT id FROM superhero WHERE superhero_name = '3-D Man' )
SELECT superhero_name FROM superhero WHERE eye_colour_id IN ( SELECT id FROM colour WHERE colour = 'Blue' ) AND hair_colour_id IN ( SELECT id FROM colour WHERE colour = 'Brown' )
SELECT T.publisher_name FROM ( SELECT DISTINCT CASE WHEN T2.superhero_name = 'Hawkman' THEN T1.publisher_name END AS publisher_name FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id ) WHERE publisher_name IS NOT NULL UNION ALL SELECT T.publisher_name FROM ( SELECT DISTINCT CASE WHEN T2.superhero_name = 'Karate Kid' THEN T1.publisher_name END AS publisher_name FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id ) WHERE publisher_name IS NOT NULL UNION ALL SELECT T.publisher_name FROM ( SELECT DISTINCT CASE WHEN T2.superhero_name = 'Speedy' THEN T1.publisher_name END AS publisher_name FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id ) WHERE publisher_name IS NOT NULL
SELECT COUNT(*) FROM superhero WHERE publisher_id = 1;
SELECT CAST(SUM(CASE WHEN T2.eye_colour_id = 7 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id
SELECT CAST(SUM(CASE WHEN gender_id = 1 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN gender_id = 2 THEN 1 ELSE 0 END) AS ratio FROM superhero
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1
SELECT id FROM superpower WHERE power_name = 'Cryokinesis'
SELECT superhero_name FROM superhero WHERE id = 294
SELECT full_name FROM superhero WHERE weight_kg = 0 OR weight_kg IS NULL;
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T2.full_name = 'Karen Beecher-Duncan'
SELECT T1.power_name FROM superpower AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.power_id INNER JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.full_name = 'Helen Parr'
SELECT T1.race FROM race AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T2.weight_kg = 108 AND T2.height_cm = 188
SELECT T.publisher_name FROM publisher AS T JOIN superhero AS S ON T.id = S.publisher_id WHERE S.id = 38
SELECT T1.race FROM race AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.race_id INNER JOIN hero_attribute AS T3 ON T2.id = T3.hero_id ORDER BY T3.attribute_value DESC LIMIT 1
SELECT T3.alignment, T4.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN alignment AS T3 ON T1.alignment_id = T3.id INNER JOIN superpower AS T4 ON T2.power_id = T4.id WHERE T1.superhero_name = 'Atom IV'
SELECT superhero_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Blue' LIMIT 5
SELECT AVG(attribute_value) FROM hero_attribute WHERE hero_id IN (SELECT id FROM superhero WHERE alignment_id = 3)
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.skin_colour_id INNER JOIN hero_attribute AS T3 ON T2.id = T3.hero_id WHERE T3.attribute_value = 100
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id INNER JOIN gender AS T3 ON T1.gender_id = T3.id WHERE T2.id = 1 AND T3.id = 2
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T2.attribute_value BETWEEN 75 AND 80
SELECT T2.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id INNER JOIN colour AS T3 ON T1.hair_colour_id = T3.id INNER JOIN gender AS T4 ON T1.gender_id = T4.id WHERE T3.colour = 'blue' AND T4.gender = 'Male'
SELECT CAST(SUM(CASE WHEN T2.gender = 2 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id INNER JOIN alignment AS T3 ON T1.alignment_id = T3.id WHERE T3.id = 2
SELECT SUM(CASE WHEN T1.eye_colour_id = 7 THEN 1 ELSE 0 END) - SUM(CASE WHEN T1.eye_colour_id = 1 THEN 1 ELSE 0 END) AS difference FROM superhero AS T1 LEFT JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.weight_kg = 0 OR T1.weight_kg IS NULL
SELECT T2.attribute_value FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T1.superhero_name = 'Hulk' AND T3.attribute_name = 'Strength'
SELECT T2.power_name FROM superhero AS T1 INNER JOIN hero_power AS T3 ON T1.id = T3.hero_id INNER JOIN superpower AS T2 ON T3.power_id = T2.id WHERE T1.superhero_name = 'Ajax'
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.skin_colour_id = T2.id INNER JOIN alignment AS T3 ON T1.alignment_id = T3.id WHERE T2.colour = 'Green' AND T3.alignment = 'Bad'
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id INNER JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T2.gender = 'Female' AND T3.publisher_name = 'Marvel Comics'
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Wind Control' ORDER BY T1.superhero_name ASC
SELECT T1.gender FROM gender AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.gender_id INNER JOIN hero_power AS T3 ON T2.id = T3.hero_id INNER JOIN superpower AS T4 ON T3.power_id = T4.id WHERE T4.power_name = 'Phoenix Force'
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'DC Comics' ORDER BY T1.weight_kg DESC LIMIT 1
SELECT AVG(T1.height_cm) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Dark Horse Comics' AND T1.race != 'Human'
SELECT COUNT(*) FROM superhero AS s JOIN hero_attribute AS ha ON s.id = ha.hero_id JOIN attribute AS a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' AND ha.attribute_value = 100;
SELECT SUM(CASE WHEN T1.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) - SUM(CASE WHEN T1.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS difference FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id
SELECT T2.attribute_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T1.superhero_name = 'Black Panther' ORDER BY T2.attribute_value ASC LIMIT 1
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T2.superhero_name = 'Abomination'
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler'
SELECT CAST(SUM(CASE WHEN T1.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM gender AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.gender_id INNER JOIN publisher AS T3 ON T2.publisher_id = T3.id WHERE T3.publisher_name = 'George Lucas'
SELECT CAST(SUM(CASE WHEN T1.alignment = 'Good' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM alignment AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.alignment_id INNER JOIN publisher AS T3 ON T2.publisher_id = T3.id WHERE T3.publisher_name = 'Marvel Comics'
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%'
SELECT hero_id FROM hero_attribute ORDER BY attribute_value ASC LIMIT 1
SELECT full_name FROM superhero WHERE superhero_name = 'Alien'
SELECT T1.full_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.weight_kg < 100 AND T2.colour = 'Brown'
SELECT T1.attribute_value FROM hero_attribute AS T1 INNER JOIN superhero AS T2 ON T1.hero_id = T2.id WHERE T2.superhero_name = 'Aquababy'
SELECT T1.weight_kg, T2.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.id = 40
SELECT AVG(height_cm) FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Neutral')
SELECT T1.hero_id FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T2.power_name = 'Intelligence'
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.superhero_name = 'Blackwulf'
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.height_cm > ( SELECT AVG(height_cm) * 0.8 FROM superhero )
SELECT T1.driverRef FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 20 AND T2.q1 IS NOT NULL ORDER BY T2.q1 ASC LIMIT 5
SELECT T1.surname FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 19 ORDER BY T2.q2 ASC LIMIT 1
SELECT DISTINCT YEAR FROM races WHERE circuitid IN ( SELECT circuitid FROM circuits WHERE LOCATION = 'Shanghai' )
SELECT T1.url FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Circuit de Barcelona-Catalunya'
SELECT T2.name FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.country = 'Germany'
SELECT T2.position FROM constructors AS T1 INNER JOIN constructorStandings AS T2 ON T1.constructorid = T2.constructorid WHERE T1.name = 'Renault'
SELECT COUNT(*) FROM races WHERE YEAR = 2010 AND name LIKE '%Grand Prix%' AND country NOT IN ('Asia', 'Europe')
SELECT T1.name FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.country = 'Spain'
SELECT T1.lat, T1.lng FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Australian Grand Prix'
SELECT T1.url FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = "Sepang International Circuit"
SELECT T1.date FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Sepang International Circuit'
SELECT T1.lat, T1.lng FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Abu Dhabi Grand Prix'
SELECT T1.country FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid JOIN constructorstandings AS T3 ON T2.raceid = T3.raceid WHERE T3.points = 1 AND T2.raceid = 24
SELECT q1 FROM qualifying WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Bruno' AND surname = 'Senna') AND raceId = 354
SELECT T1.nationality FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T2.q2 = '01:40' AND T2.raceid = 355
SELECT driverId FROM qualifying WHERE raceId = 903 AND q3 LIKE '0:01:%'
SELECT COUNT(*) FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.name = 'Bahrain Grand Prix' AND T1.position > 1;
SELECT T1.url FROM seasons AS T1 JOIN races AS T2 ON T1.year = T2.year WHERE T2.raceid = 901
SELECT COUNT(DISTINCT driverid) FROM results WHERE raceid IN ( SELECT raceid FROM races WHERE date = '2015-11-29' ) AND position <= 10
SELECT T1.driverid ,  T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 592 AND T2.statusid != 2 ORDER BY T1.dob ASC LIMIT 1
SELECT T1.url FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 161 AND T2.laptime LIKE '1:27%'
SELECT T1.nationality FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.fastestlapspeed = ( SELECT MAX(fastestlapspeed) FROM results ) AND T2.raceid = 933
SELECT T1.lat, T1.lng FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Malaysian Grand Prix'
SELECT T2.url FROM constructorResults AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T1.raceId = 9 ORDER BY T1.points DESC LIMIT 1
SELECT q1 FROM qualifying WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lucas' AND surname = 'Di Grassi') AND raceId = 345;
SELECT T1.nationality FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T2.q2 = '01:15' AND T2.raceid = 347
SELECT T1.code FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 45 AND T2.q3 LIKE '1:33%'
SELECT T1.time FROM results AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T2.forename = 'Bruce' AND T2.surname = 'McLaren' AND T1.raceid = 743
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.position = 2 AND T2.raceid IN ( SELECT raceid FROM races WHERE name = 'San Marino Grand Prix' AND YEAR = 2006 )
SELECT T2.url FROM races AS T1 INNER JOIN seasons AS T2 ON T1.year = T2.year WHERE T1.raceid = 901
SELECT COUNT(*) FROM results WHERE raceId = (SELECT raceId FROM races WHERE date = '2015-11-29') AND statusId != 1; 
SELECT MIN(dob) FROM results WHERE raceId = 872 AND TIME IS NOT NULL
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 348 ORDER BY T2.milliseconds LIMIT 1
SELECT T1.nationality FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid ORDER BY T2.fastestlapspeed DESC LIMIT 1
SELECT ((SELECT T1.fastestLapSpeed FROM results AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T2.forename = 'Paul' AND T2.surname = 'di Resta' AND T1.raceid = 853) - (SELECT T1.fastestLapSpeed FROM results AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T2.forename = 'Paul' AND T2.surname = 'di Resta' AND T1.raceid = 854)) / (SELECT T1.fastestLapSpeed FROM results AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T2.forename = 'Paul' AND T2.surname = 'di Resta' AND T1.raceid = 853) * 100
SELECT CAST(SUM(CASE WHEN T2.Time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.driverid) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.date = '1983-07-16'
SELECT MIN(YEAR) FROM races WHERE name = 'Singapore Grand Prix'
SELECT COUNT(*) AS race_count FROM races WHERE YEAR = 2005; SELECT name FROM races WHERE YEAR = 2005 ORDER BY date DESC; 
SELECT name FROM races WHERE date IN ( SELECT MIN(date) FROM races )
SELECT name, date FROM races WHERE YEAR = 1999 ORDER BY round DESC LIMIT 1
SELECT YEAR FROM races GROUP BY YEAR ORDER BY COUNT(*) DESC LIMIT 1
SELECT DISTINCT r.name FROM races r WHERE r.year = 2017 AND r.circuitid NOT IN (SELECT circuitid FROM races WHERE year = 2000) 
SELECT T1.country, T2.name, T2.location FROM circuits AS T2 JOIN races AS T1 ON T1.circuitid = T2.circuitid WHERE T1.year = ( SELECT MIN(year) FROM races ) AND T1.country LIKE '%Europe%'
SELECT MAX(T1.year) FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Brands Hatch' AND T1.name = 'British Grand Prix'
SELECT COUNT(*) FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = 'Silverstone') AND name LIKE '%British Grand Prix%' 
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid IN ( SELECT raceid FROM races WHERE name = 'Singapore Grand Prix' AND YEAR = 2010 ) ORDER BY T2.position;
SELECT T1.forename ,  T1.surname ,  MAX(T2.points) FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid
SELECT T1.forename, T1.surname, T2.points FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = (SELECT raceid FROM races WHERE name = 'Chinese Grand Prix' AND YEAR = 2017) ORDER BY T2.points DESC LIMIT 3
SELECT D.forename, D.surname, R.name FROM drivers AS D JOIN laptimes AS L ON D.driverid = L.driverid JOIN races AS R ON L.raceid = R.raceid ORDER BY L.milliseconds ASC LIMIT 1
SELECT AVG(T2.milliseconds) FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton' AND T3.name = 'Malaysian Grand Prix'
SELECT CAST(SUM(CASE WHEN T1.surname = 'Hamilton' AND T2.position > 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.year >= 2010
SELECT T1.forename ,  T1.surname ,  T1.nationality ,  T1.points FROM drivers AS T1 JOIN driverstandings AS T2 ON T1.driverid = T2.driverid GROUP BY T1.driverid ORDER BY COUNT(T2.wins) DESC LIMIT 1
SELECT MIN(YEAR(CURRENT_TIMESTAMP) - YEAR(dob)) AS age, forename, surname FROM drivers WHERE nationality = 'Japanese'
SELECT c.circuitid, c.name FROM circuits c JOIN races r ON c.circuitid = r.circuitid WHERE r.date BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY c.circuitid HAVING COUNT(r.raceid) = 4; 
SELECT c.name, c.location, r.name FROM circuits AS c JOIN races AS r ON c.circuitid = r.circuitid WHERE c.country = 'USA' AND r.year = 2006;
SELECT r.name, c.name AS circuit_name, c.location FROM races r JOIN circuits c ON r.circuitid = c.circuitid WHERE MONTH(r.date) = 9 AND YEAR(r.date) = 2005; 
SELECT r.name FROM races r JOIN results res ON r.raceid = res.raceid JOIN drivers d ON res.driverid = d.driverid WHERE d.forename = 'Alex' AND d.surname = 'Yoong' AND res.position < 20; 
SELECT COUNT(*) FROM results AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid JOIN circuits AS T3 ON T1.circuitid = T3.circuitid WHERE T2.forename = 'Michael' AND T2.surname = 'Schumacher' AND T3.name = 'Sepang International Circuit' AND T1.points = ( SELECT MAX(points) FROM results AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid JOIN circuits AS T3 ON T1.circuitid = T3.circuitid WHERE T2.forename = 'Michael' AND T2.surname = 'Schumacher' AND T3.name = 'Sepang International Circuit' )
SELECT T1.name, T1.year FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T3.forename = 'Michael' AND T3.surname = 'Schumacher' ORDER BY T2.fastestlapspeed DESC LIMIT 1
SELECT AVG(T1.points) FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T2.forename = 'Eddie' AND T2.surname = 'Irvine' AND T1.year = 2000
SELECT T1.year, T1.points FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton' ORDER BY T1.year ASC LIMIT 1
SELECT T1.name ,  T2.country FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.year = 2017 ORDER BY T1.date
SELECT T1.name, T1.year, T2.location FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid ORDER BY T1.laps DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN T1.country = 'Germany' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'European Grand Prix'
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit'
SELECT name FROM circuits WHERE lat = (SELECT MAX(lat) FROM circuits WHERE name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring'))
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit'
SELECT country FROM circuits WHERE alt = ( SELECT MAX(alt) FROM circuits )
SELECT COUNT(*) FROM drivers WHERE code IS NULL
SELECT T1.country FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid JOIN constructorstandings AS T3 ON T2.raceid = T3.raceid JOIN constructors AS T4 ON T3.constructorid = T4.constructorid ORDER BY T4.nationality LIMIT 1
SELECT surname FROM drivers WHERE nationality = 'Italian'
SELECT url FROM drivers WHERE forename = 'Anthony' AND surname = 'Davidson';
SELECT driverRef FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton'
SELECT circuits.name FROM circuits JOIN races ON circuits.circuitid = races.circuitid WHERE races.year = 2009 AND races.name = "Spanish Grand Prix"
SELECT DISTINCT T1.year FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Silverstone'
SELECT T2.url FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Silverstone'
SELECT date FROM races WHERE name = 'Abu Dhabi Grand Prix' AND YEAR = 2010
SELECT COUNT(*) FROM races WHERE circuitId IN ( SELECT circuitId FROM circuits WHERE country = 'Italy' )
SELECT date FROM races WHERE circuitid = (SELECT circuitid FROM circuits WHERE name = 'Circuit de Barcelona-Catalunya')
SELECT T1.url FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.year = 2009 AND T2.name = 'Spanish Grand Prix'
SELECT MIN(T1.fastestLapTime) FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton'
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid ORDER BY T2.fastestlapspeed DESC LIMIT 1
SELECT T1.driverRef FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T3.year = 2007 AND T3.name = 'Canadian Grand Prix' AND T2.position = 1
SELECT DISTINCT T1.name FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T3.forename = 'Lewis' AND T3.surname = 'Hamilton'
SELECT T1.name FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T3.forename = 'Lewis' AND T3.surname = 'Hamilton' ORDER BY T2.rank ASC LIMIT 1
SELECT MAX(T1.fastestLapSpeed) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Spanish Grand Prix'
SELECT DISTINCT YEAR FROM races WHERE raceId IN (SELECT raceId FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton'))
SELECT T2.positionOrder FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton' AND T3.name = 'Chinese Grand Prix' ORDER BY T2.position DESC LIMIT 1
SELECT T1.forename ,  T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.grid = 4 AND T2.raceid = ( SELECT raceid FROM races WHERE name = 'Australian Grand Prix' AND YEAR = 1989 )
SELECT COUNT(*) FROM results WHERE raceid = 1 AND TIME IS NOT NULL
SELECT T1.fastestLapTime FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton' AND T1.raceId = ( SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND YEAR = 2008 )
SELECT T1.time FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T1.rank = 2 AND T2.year = 2008 AND T2.name = 'Chinese Grand Prix'
SELECT T1.forename, T1.surname, T1.url FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.position = 1 AND T2.raceid IN ( SELECT raceid FROM races WHERE name = 'Australian Grand Prix' AND YEAR = 2008 )
SELECT COUNT(*) FROM results AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T2.nationality = 'British' AND T1.raceid = (SELECT raceid FROM races WHERE name = 'Australian Grand Prix' AND YEAR = 2008)
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId IN ( SELECT raceId FROM races WHERE year = 2008 AND name = 'Chinese Grand Prix' ) AND time IS NOT NULL
SELECT SUM(points) FROM results WHERE driverid = (SELECT driverid FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')
SELECT AVG(STRFTIME('%M', T1.fastestLapTime) * 60 + STRFTIME('%S', T1.fastestLapTime) + STRFTIME('%f', T1.fastestLapTime) / 1000) AS averageFastestLapTime FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton'
SELECT CAST(SUM(CASE WHEN T1.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) / COUNT(T1.raceid) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.year = 2008 AND T2.name = 'Australian Grand Prix'
SELECT ((strftime('%M', T2.time) - strftime('%M', T1.fastestLapTime)) * 60 + (strftime('%S', T2.time) - strftime('%S', T1.fastestLapTime)) + (strftime('%f', T2.time) - strftime('%f', T1.fastestLapTime))) / (strftime('%M', T1.fastestLapTime) * 60 + strftime('%S', T1.fastestLapTime) + strftime('%f', T1.fastestLapTime)) * 100 FROM results AS T1 INNER JOIN pitstops AS T2 ON T1.driverid = T2.driverid WHERE T1.raceid = 1 AND T1.position = 1 AND T2.stop = 1
SELECT COUNT(*) FROM circuits WHERE country = 'Australia' AND location = 'Adelaide';
SELECT lat, lng FROM circuits WHERE country = 'USA'
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND STRFTIME('%Y', dob) > '1980'
SELECT MAX(points) FROM constructorStandings WHERE constructorId IN (SELECT constructorId FROM constructors WHERE nationality = 'British')
SELECT T1.name FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorid = T2.constructorid ORDER BY T2.points DESC LIMIT 1
SELECT T2.name FROM constructorStandings AS T1 INNER JOIN constructors AS T2 ON T1.constructorid = T2.constructorid WHERE T1.raceid = 291 AND T1.points = 0
SELECT COUNT(*) FROM constructorStandings WHERE constructorId IN ( SELECT constructorId FROM constructors WHERE nationality = 'Japanese' ) AND points = 0 GROUP BY constructorId HAVING COUNT(raceId) = 2
SELECT T2.name FROM constructorstandings AS T1 JOIN constructors AS T2 ON T1.constructorid = T2.constructorid WHERE position = 1
SELECT COUNT(*) FROM constructorResults JOIN constructors ON constructorResults.constructorId = constructors.constructorId WHERE constructors.nationality = 'French' AND constructorResults.laps > 50
SELECT CAST(SUM(CASE WHEN T1.time IS NOT NULL AND T1.year BETWEEN 2007 AND 2009 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.driverID) FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverID = T2.driverID WHERE T2.nationality = 'Japanese'; 
SELECT AVG(REPLACE(T1.time, ':', '') + T1.milliseconds / 1000) AS avg_time, T1.year FROM results AS T1 INNER JOIN driverstandings AS T2 ON T1.driverid = T2.driverid AND T1.raceid = T2.raceid WHERE T2.position = 1 AND T1.year < 1975 GROUP BY T1.year
SELECT T1.forename ,  T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE STRFTIME('%Y', T1.dob) > '1975' AND T2.rank = 2
SELECT COUNT(*) FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T1.nationality = "Italian" AND T2.status IS NOT NULL
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid ORDER BY T2.fastestlaptime ASC LIMIT 1
SELECT T1.fastestLap FROM results AS T1 JOIN driverstandings AS T2 ON T1.driverid = T2.driverid WHERE T1.year = 2009 AND T2.position = 1 ORDER BY T1.fastestlaptime LIMIT 1
SELECT AVG(T1.fastestLapSpeed) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.name = 'Spanish Grand Prix' AND T1.year = 2009
SELECT T2.name ,  T2.year FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T1.milliseconds IS NOT NULL ORDER BY T1.milliseconds ASC LIMIT 1
SELECT CAST(SUM(CASE WHEN T1.year < 1985 AND T2.laps > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.driverId) FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.year BETWEEN 2000 AND 2005; 
SELECT COUNT(*) FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid WHERE T1.nationality = 'French' AND T2.milliseconds < 120000
SELECT code FROM drivers WHERE nationality = 'American'
SELECT raceId FROM races WHERE YEAR = 2009;
SELECT COUNT(driverId) FROM results WHERE raceId = 18;
SELECT number FROM drivers ORDER BY dob DESC LIMIT 3; SELECT COUNT(*) FROM drivers WHERE nationality = 'Dutch' AND number IN (SELECT number FROM drivers ORDER BY dob DESC LIMIT 3);
SELECT driverRef FROM drivers WHERE forename = 'Robert' AND surname = 'Kubica';
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND STRFTIME('%Y', dob) = '1980';
SELECT d.forename, d.surname, MIN(l.time) AS min_time FROM drivers d JOIN laptimes l ON d.driverid = l.driverid WHERE d.nationality = 'German' AND STRFTIME('%Y', d.dob) BETWEEN '1980' AND '1990' GROUP BY d.driverid ORDER BY min_time LIMIT 3
SELECT driverRef FROM drivers WHERE nationality = 'German' ORDER BY dob ASC LIMIT 1
SELECT T1.driverid ,  T1.code FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE STRFTIME('%Y', T1.dob) = '1971' AND T2.fastestlaptime IS NOT NULL ORDER BY T2.fastestlaptimes DESC LIMIT 1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid WHERE T1.nationality = 'Spanish' AND STRFTIME('%Y', T1.dob) < '1982' ORDER BY T2.milliseconds DESC LIMIT 10
SELECT T1.year FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T2.fastestlaptime IS NOT NULL ORDER BY T2.fastestlaptime ASC LIMIT 1
SELECT YEAR FROM races WHERE raceId = (SELECT raceId FROM laptimes ORDER BY TIME DESC LIMIT 1)
SELECT driverid FROM laptimes WHERE lap = 1 ORDER BY TIME ASC LIMIT 5
SELECT COUNT(*) FROM results WHERE statusId = 2 AND time IS NOT NULL AND raceId BETWEEN 50 AND 100
SELECT count(*) ,  LOCATION ,  lat ,  lng FROM circuits WHERE country = 'Austria'
SELECT raceId FROM results WHERE TIME IS NOT NULL GROUP BY raceId ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.driverRef ,  T1.nationality ,  T1.dob FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T2.q2 IS NOT NULL AND T2.raceid = 23
SELECT T1.year ,  T1.name ,  T1.date FROM races AS T1 JOIN qualifying AS T2 ON T1.raceid = T2.raceid ORDER BY T2.driverid ,  T1.date LIMIT 1
SELECT COUNT(*) FROM results AS T1 INNER JOIN constructorstandings AS T2 ON T1.constructorid = T2.constructorid INNER JOIN constructors AS T3 ON T2.constructorid = T3.constructorid WHERE T3.nationality = 'American' AND T1.statusid = ( SELECT statusid FROM status WHERE status = 'Puncture' )
SELECT c.name, c.url  FROM constructors c  JOIN constructorStandings cs ON c.constructorId = cs.constructorId  WHERE c.nationality = 'Italian'  ORDER BY cs.points DESC  LIMIT 1; 
SELECT T2.url FROM constructorstandings AS T1 INNER JOIN constructors AS T2 ON T1.constructorid = T2.constructorid GROUP BY T2.url ORDER BY SUM(T1.wins) DESC LIMIT 1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T3.name = 'French Grand Prix' ORDER BY T2.milliseconds DESC LIMIT 1
SELECT T1.raceid ,  T1.milliseconds FROM laptimes AS T1 ORDER BY TIME ASC LIMIT 1
SELECT AVG(T1.fastestLapTime) FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T1.rank < 11 AND T2.name = 'United States Grand Prix' AND T2.year = 2006
SELECT d.forename, d.surname FROM drivers AS d JOIN pitstops AS p ON d.driverid = p.driverid WHERE d.nationality = 'German' AND STRFTIME('%Y', d.dob) BETWEEN '1980' AND '1985' GROUP BY d.driverid ORDER BY AVG(p.duration) ASC LIMIT 3
SELECT T1.forename, T1.surname, T2.time FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T3.name = 'Canadian Grand Prix' AND T3.year = 2008 ORDER BY points DESC LIMIT 1
SELECT T2.constructorRef ,  T2.url FROM races AS T1 INNER JOIN constructorStandings AS T2 ON T1.raceid = T2.raceid WHERE T1.name = 'Singapore Grand Prix' AND T1.year = 2009 ORDER BY points DESC LIMIT 1
SELECT forename, surname, dob FROM drivers WHERE nationality = 'Austrian' AND STRFTIME('%Y', dob) BETWEEN '1981' AND '1991'
SELECT forename || ' ' || surname AS fullName, url, dob FROM drivers WHERE nationality = 'German' AND STRFTIME('%Y', dob) BETWEEN '1971' AND '1985' ORDER BY dob DESC
SELECT LOCATION, COUNTRY, LAT, LNG FROM circuits WHERE name = 'Hungaroring'
SELECT c.constructorid, c.name, c.nationality, SUM(cr.points) AS total_points FROM constructors c JOIN constructorstandings cs ON c.constructorid = cs.constructorid JOIN races r ON cs.raceid = r.raceid WHERE r.circuitid = 6 AND r.year BETWEEN 1980 AND 2010 GROUP BY c.constructorid, c.name, c.nationality ORDER BY total_points DESC LIMIT 1; 
SELECT AVG(T1.points) FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T2.forename = "Lewis" AND T2.surname = "Hamilton" AND T1.raceid IN ( SELECT raceid FROM races WHERE name LIKE "%Turkish Grand Prix%" )
SELECT AVG(count(*)) FROM ( SELECT COUNT(*) FROM races WHERE date BETWEEN '2000-01-01' AND '2010-12-31' GROUP BY YEAR ) AS subquery
SELECT nationality FROM drivers GROUP BY nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM driverStandings WHERE position = 91 AND wins > 0
SELECT T1.name FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid ORDER BY T2.fastestlaptime ASC LIMIT 1
SELECT T1.location, T1.country FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid ORDER BY T2.date DESC LIMIT 1
SELECT T1.forename ,  T1.surname FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid JOIN circuits AS T3 ON T3.circuitid = T2.circuitid WHERE T3.name = "Marina Bay Street Circuit" AND T2.position = 1 AND T2.q3 IS NOT NULL ORDER BY T2.q3 ASC LIMIT 1
SELECT T1.forename, T1.surname, T1.nationality, T3.name FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverid = T2.driverid INNER JOIN races AS T3 ON T2.raceid = T3.raceid ORDER BY T1.dob DESC LIMIT 1
SELECT COUNT(*) FROM results AS T1 JOIN status AS T2 ON T1.statusid = T2.statusid WHERE T2.status = 'Accident' AND T1.raceid IN (SELECT raceid FROM races WHERE name = 'Canadian Grand Prix')
SELECT COUNT(wins), forename, surname FROM drivers WHERE dob = ( SELECT MIN(dob) FROM drivers ) AND wins > 0
SELECT MAX(duration) FROM pitStops;
SELECT MIN(time) FROM laptimes
SELECT MAX(T2.duration) FROM drivers AS T1 JOIN pitstops AS T2 ON T1.driverid = T2.driverid WHERE T1.forename = "Lewis" AND T1.surname = "Hamilton";
SELECT T2.lap FROM drivers AS T1 INNER JOIN pitstops AS T2 ON T1.driverid = T2.driverid WHERE T1.forename = "Lewis" AND T1.surname = "Hamilton" AND T2.raceid IN (SELECT raceid FROM races WHERE name = "Australian Grand Prix" AND YEAR = 2011)
SELECT T1.driverid ,  T2.duration FROM results AS T1 INNER JOIN pitstops AS T2 ON T1.raceid = T2.raceid AND T1.driverid = T2.driverid WHERE T1.raceid = 1 AND T1.grid = 1
SELECT MIN(time) FROM results AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T2.forename = "Lewis" AND T2.surname = "Hamilton"
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid ORDER BY TIME ASC LIMIT 1
SELECT T2.position FROM results AS T1 INNER JOIN driverstandings AS T2 ON T1.driverid = T2.driverid WHERE T1.fastestlap IS NOT NULL AND T1.driverid = ( SELECT driverid FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton' ) ORDER BY T1.fastestlaptime ASC LIMIT 1
SELECT MIN(time) FROM laptimes WHERE raceid = (SELECT raceid FROM races WHERE name = 'Austrian Grand Prix')
SELECT T1.name, MIN(T3.time) AS fastest_lap FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid INNER JOIN results AS T3 ON T2.raceid = T3.raceid WHERE T1.country = 'Italy' GROUP BY T1.name
SELECT T1.name FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.circuitid = ( SELECT circuitid FROM circuits WHERE name = 'Austrian Grand Prix Circuit' ) ORDER BY T2.fastestlaptime ASC LIMIT 1
SELECT T1.duration FROM pitstops AS T1 INNER JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.fastestlap IS NOT NULL AND T2.raceid IN ( SELECT raceid FROM races WHERE name = 'Austrian Grand Prix' )
SELECT T1.lat, T1.lng FROM circuits AS T1 JOIN results AS T2 ON T1.circuitid = T2.circuitid WHERE T2.fastestlaptime = '1:29.488'
SELECT AVG(T1.milliseconds) FROM pitstops AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton'
SELECT AVG(T1.milliseconds) FROM laptimes AS T1 INNER JOIN races AS T2 ON T1.raceid = T2.raceid INNER JOIN circuits AS T3 ON T2.circuitid = T3.circuitid WHERE T3.country = 'Italy'
SELECT player_api_id FROM Player_Attributes ORDER BY overall_rating DESC LIMIT 1
SELECT player_name FROM Player ORDER BY height DESC LIMIT 1
SELECT preferred_foot FROM Player_Attributes ORDER BY potential ASC LIMIT 1
SELECT COUNT(*) FROM Player_Attributes WHERE overall_rating BETWEEN 60 AND 65 AND defensive_work_rate = 'Low'
SELECT player_api_id FROM Player_Attributes ORDER BY crossing DESC LIMIT 5
SELECT T1.name FROM League AS T1 INNER JOIN Match AS T2 ON T1.id = T2.league_id WHERE T2.season = '2015/2016' GROUP BY T1.name ORDER BY SUM(T2.home_team_goal + T2.away_team_goal) DESC LIMIT 1
SELECT T1.team_long_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id WHERE T2.season = '2015/2016' AND T1.team_long_name IN ( SELECT team_long_name FROM Team WHERE id IN ( SELECT home_team_api_id FROM Match WHERE season = '2015/2016' ) ) GROUP BY T1.team_long_name ORDER BY SUM(CASE WHEN home_team_goal < away_team_goal THEN 1 ELSE 0 END) ASC LIMIT 1
SELECT T2.player_name FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T1.penalties DESC LIMIT 10
SELECT T2.team_long_name FROM Match AS T1 INNER JOIN Team AS T2 ON T1.away_team_api_id = T2.team_api_id INNER JOIN League AS T3 ON T1.league_id = T3.id WHERE T3.name = 'Scotland Premier League' AND T1.season = '2009/2010' AND T1.away_team_goal > T1.home_team_goal GROUP BY T2.team_long_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT buildUpPlaySpeed FROM Team_Attributes ORDER BY buildUpPlaySpeed DESC LIMIT 4
SELECT T2.name FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.season = '2015/2016' GROUP BY T2.name ORDER BY SUM(CASE WHEN home_team_goal = away_team_goal THEN 1 ELSE 0 END) DESC LIMIT 1
SELECT T1.player_name ,  STRFTIME('%Y', 'now') - STRFTIME('%Y', T1.birthday) AS Age FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.sprint_speed >= 97 AND STRFTIME('%Y', T2.date) BETWEEN '2013' AND '2015'
SELECT T1.name ,  COUNT(T2.league_id) FROM League AS T1 INNER JOIN Match AS T2 ON T1.id = T2.league_id GROUP BY T1.id ORDER BY COUNT(T2.league_id) DESC LIMIT 1
SELECT AVG(height) FROM Player WHERE birthday BETWEEN '1990-01-01 00:00:00' AND '1995-12-31 00:00:00'
SELECT player_api_id FROM Player_Attributes WHERE date LIKE '2010%' ORDER BY overall_rating DESC LIMIT 1
SELECT team_fifa_api_id FROM Team_Attributes WHERE buildUpPlaySpeed BETWEEN 50 AND 60
SELECT T1.team_long_name FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE strftime('%Y', T2.date) = '2012' AND T2.buildUpPlayPassing > ( SELECT AVG(buildUpPlayPassing) FROM Team_Attributes WHERE strftime('%Y', date) = '2012' )
SELECT CAST(SUM(CASE WHEN preferred_foot = 'left' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(player_fifa_api_id) FROM Player WHERE STRFTIME('%Y', birthday) BETWEEN '1987' AND '1992'
SELECT T1.name FROM League AS T1 INNER JOIN Match AS T2 ON T1.id = T2.league_id GROUP BY T1.id ORDER BY SUM(T2.home_team_goal + T2.away_team_goal) ASC LIMIT 5
SELECT AVG(T2.long_shots) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Ahmed Samir Farag'
SELECT P.player_name FROM Player AS P JOIN Player_Attributes AS PA ON P.player_api_id = PA.player_api_id WHERE P.height > 180 GROUP BY P.player_name ORDER BY AVG(PA.heading_accuracy) DESC LIMIT 10
SELECT T1.team_long_name FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlayDribblingClass = 'Normal' AND T2.date BETWEEN '2014-01-01 00:00:00' AND '2014-12-31 00:00:00' GROUP BY T1.id HAVING AVG(T2.chanceCreationPassing) > T2.chanceCreationPassing ORDER BY T2.chanceCreationPassing DESC
SELECT T2.name FROM `Match` AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.season = '2009/2010' GROUP BY T1.league_id HAVING AVG(T1.home_team_goal) > AVG(T1.away_team_goal)
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers'
SELECT player_name FROM Player WHERE birthday LIKE '1970-10-%'
SELECT T2.attacking_work_rate FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Franco Zennaro' AND T2.date = ( SELECT MAX(date) FROM Player_Attributes WHERE player_api_id = T1.player_api_id )
SELECT T1.buildUpPlayPositioningClass FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_long_name = 'ADO Den Haag' AND T1.date LIKE '%2010%' LIMIT 2
SELECT T1.heading_accuracy FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Francois Affolter' AND T1.date = '2014-09-18 00:00:00'
SELECT overall_rating FROM Player_Attributes WHERE player_api_id IN ( SELECT player_api_id FROM Player WHERE player_name = 'Gabriel Tamas' ) AND strftime('%Y', date) = '2011';
SELECT COUNT(*) FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T2.name = 'Scotland Premier League' AND T1.season = '2015/2016'
SELECT T1.preferred_foot FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T1.birthday DESC LIMIT 1
SELECT player_name FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id ORDER BY potential DESC LIMIT 1
SELECT COUNT(*) FROM Player WHERE weight < 130 AND preferred_foot = 'left'
SELECT T.team_short_name FROM Team AS T JOIN Team_Attributes AS TA ON T.team_api_id = TA.team_api_id WHERE TA.chanceCreationPassingClass = 'Risky'
SELECT T2.defensive_work_rate FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'David Wilson' AND T2.date = ( SELECT MAX(date) FROM Player_Attributes WHERE player_api_id = ( SELECT player_api_id FROM Player WHERE player_name = 'David Wilson' ) )
SELECT T1.birthday FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.overall_rating DESC LIMIT 1
SELECT T1.name FROM League AS T1 INNER JOIN Country AS T2 ON T1.country_id = T2.id WHERE T2.name = 'Netherlands'
SELECT AVG(home_team_goal) FROM Match AS T1 INNER JOIN Country AS T2 ON T1.country_id = T2.id WHERE T2.name = 'Poland' AND T1.season = '2010/2011'
SELECT T2.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id GROUP BY T1.player_api_id ORDER BY AVG(T2.finishing) DESC LIMIT 1
SELECT player_name FROM Player WHERE height > 180;
SELECT COUNT(*) FROM Player WHERE strftime('%Y', birthday) > '1990'
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Adam%' AND weight > 170;
SELECT T2.player_name FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.overall_rating > 80 AND strftime('%Y', T1.date) BETWEEN '2008' AND '2010' GROUP BY T2.player_name
SELECT potential FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Doran')
SELECT player_name FROM Player WHERE preferred_foot = 'left'
SELECT T2.team_long_name FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlaySpeedClass = 'Fast'
SELECT T1.buildUpPlayPassingClass FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_short_name = 'CLB'
SELECT T.team_short_name FROM Team AS T JOIN Team_Attributes AS TA ON T.team_api_id = TA.team_api_id WHERE TA.buildUpPlayPassing > 70
SELECT AVG(t2.overall_rating) FROM Player AS t1 INNER JOIN Player_Attributes AS t2 ON t1.player_api_id = t2.player_api_id WHERE strftime('%Y', t2.date) BETWEEN '2010' AND '2015' AND t1.height > 170
SELECT player_name FROM Player ORDER BY height ASC LIMIT 1
SELECT T2.name FROM League AS T1 INNER JOIN Country AS T2 ON T1.country_id = T2.id WHERE T1.name = 'Italy Serie A'
SELECT T2.team_short_name FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlaySpeed = 31 AND T1.buildUpPlayDribbling = 53 AND T1.buildUpPlayPassing = 32
SELECT AVG(T1.overall_rating) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Aaron Doran'
SELECT COUNT(*) FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T2.name = 'Germany 1. Bundesliga' AND date LIKE '2008-08%' OR date LIKE '2008-09%' OR date LIKE '2008-10%'
SELECT T1.team_short_name FROM Team AS T1 INNER JOIN Match AS T2 ON T1.id = T2.home_team_api_id WHERE T2.home_team_goal = 10
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.balance = ( SELECT MAX(balance) FROM Player_Attributes ) AND T2.potential = 61
SELECT SUM(CASE WHEN T1.player_name = 'Abdou Diallo' THEN T2.ball_control ELSE 0 END) / COUNT(CASE WHEN T1.player_name = 'Abdou Diallo' THEN T2.id ELSE NULL END) - SUM(CASE WHEN T1.player_name = 'Aaron Appindangoye' THEN T2.ball_control ELSE 0 END) / COUNT(CASE WHEN T1.player_name = 'Aaron Appindangoye' THEN T2.id ELSE NULL END) AS diff FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN'
SELECT player_name FROM Player WHERE player_name IN ('Aaron Lennon', 'Abdelaziz Barrada') ORDER BY birthday DESC LIMIT 1
SELECT player_name FROM Player ORDER BY height DESC LIMIT 1
SELECT COUNT(*) FROM Player_Attributes WHERE preferred_foot = 'left' AND attacking_work_rate = 'low'
SELECT T1.name FROM Country AS T1 INNER JOIN League AS T2 ON T1.id = T2.country_id WHERE T2.name = 'Belgium Jupiler League'
SELECT T1.name FROM League AS T1 INNER JOIN Country AS T2 ON T1.country_id = T2.id WHERE T2.name = 'Germany'
SELECT player_name FROM Player WHERE player_api_id = (SELECT player_api_id FROM Player_Attributes ORDER BY overall_rating DESC LIMIT 1)
SELECT COUNT(DISTINCT T1.player_api_id) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE strftime('%Y', T1.birthday) < '1986' AND T2.defensive_work_rate = 'High'
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone') ORDER BY T2.crossing DESC LIMIT 1
SELECT T2.heading_accuracy FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Ariel Borysiuk' AND T2.date = ( SELECT MAX(date) FROM Player_Attributes WHERE player_api_id = ( SELECT player_api_id FROM Player WHERE player_name = 'Ariel Borysiuk' ) )
SELECT COUNT(*) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.height > 180 AND T2.volleys > 70
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.volleys > 70 AND T2.dribbling > 70
SELECT COUNT(*) FROM Match AS T1 INNER JOIN Country AS T2 ON T1.country_id = T2.id WHERE T2.name = 'Belgium' AND T1.season = '2008/2009';
SELECT T1.long_passing FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.birthday ASC LIMIT 1
SELECT COUNT(*) FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T2.name = 'Belgium Jupiler League' AND SUBSTR(T1.date, 1, 7) = '2009-04'
SELECT T1.name FROM League AS T1 INNER JOIN Match AS T2 ON T1.id = T2.league_id WHERE T2.season = '2008/2009' GROUP BY T1.name ORDER BY COUNT(T2.match_api_id) DESC LIMIT 1
SELECT AVG(overall_rating) FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE strftime('%Y', Player.birthday) < '1986'
SELECT ((SELECT overall_rating FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Ariel Borysiuk') - (SELECT overall_rating FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Paulin Puel')) * 100 / (SELECT overall_rating FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Paulin Puel')
SELECT AVG(T2.buildUpPlaySpeed) FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Heart of Midlothian'
SELECT AVG(T1.overall_rating) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Pietro Marino'
SELECT SUM(T1.crossing) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Aaron Lennox'
SELECT MAX(T2.chanceCreationPassing), T2.chanceCreationPassingClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Ajax'; 
SELECT preferred_foot FROM Player WHERE player_name = 'Abdou Diallo'
SELECT MAX(T1.overall_rating) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Dorlan Pabon'
SELECT AVG(away_team_goal) FROM Match AS T1 JOIN Team AS T2 ON T1.away_team_api_id = T2.team_api_id WHERE T2.team_long_name = 'Parma' AND T1.country_id IN ( SELECT id FROM Country WHERE name = 'Italy' )
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.overall_rating = 77 AND T2.date LIKE '2016-06-23%' ORDER BY T1.birthday ASC LIMIT 1
SELECT T2.overall_rating FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Aaron Mooy' AND T2.date LIKE '2016-02-04%'
SELECT T1.potential FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Francesco Parravicini' AND T1.date = '2010-08-30 00:00:00'
SELECT T1.attacking_work_rate FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Francesco Migliore' AND T1.date LIKE '2015-05-01%'
SELECT T2.defensive_work_rate FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Kevin Berigaud' AND T2.date = '2013-02-22 00:00:00'
SELECT T2.date FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Kevin Constant' ORDER BY T2.crossing DESC LIMIT 1
SELECT T2.buildUpPlaySpeedClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Willem II' AND T2.date LIKE '%2011-02-22%'
SELECT T2.buildUpPlayDribblingClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_short_name = 'LEI' AND T2.date = '2015-09-10 00:00:00'
SELECT T2.buildUpPlayPassingClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'FC Lorient' AND T2.date LIKE '2010-02-22%'
SELECT T2.chance_creation_passing_class FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'PEC Zwolle' AND T2.date = '2013-09-20 00:00:00'
SELECT T2.chance_creation_crossing_class FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Hull City' AND T2.date = '2010-02-22 00:00:00'
SELECT T2.defenceAggressionClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Hannover 96' AND T2.date LIKE '2015-09-10%'
SELECT AVG(T2.overall_rating) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Marko Arnautovic' AND SUBSTR(T2.date, 1, 10) BETWEEN '2007-02-22' AND '2016-04-21'
SELECT CAST((T1.overall_rating - T2.overall_rating) AS REAL) * 100 / T1.overall_rating FROM Player_Attributes AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.date = '2013-07-12' AND T2.date = '2013-07-12' AND T1.player_name = 'Landon Donovan' AND T2.player_name = 'Jordan Bowery'
SELECT player_name FROM Player ORDER BY height DESC LIMIT 1
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10
SELECT player_name FROM Player WHERE strftime('%Y', 'now') - strftime('%Y', birthday) >= 35
SELECT SUM(home_team_goal) FROM Match WHERE home_player_1 IN ( SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon' ) OR home_player_2 IN ( SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon' ) OR home_player_3 IN ( SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon' ) OR home_player_4 IN ( SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon' ) OR home_player_5 IN ( SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon' ) OR home_player_6 IN ( SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon' ) OR home_player_7 IN ( SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon' ) OR home_player_8 IN ( SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon' ) OR home_player_9 IN ( SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon' ) OR home_player_10 IN ( SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon' ) OR home_player_11 IN ( SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon' )
SELECT SUM(T2.away_team_goal) FROM Player AS T1 INNER JOIN Match AS T2 ON T1.player_api_id IN (T2.away_player_1, T2.away_player_2, T2.away_player_3, T2.away_player_4, T2.away_player_5, T2.away_player_6, T2.away_player_7, T2.away_player_8, T2.away_player_9, T2.away_player_10, T2.away_player_11) WHERE T1.player_name IN ('Daan Smith', 'Filipe Ferreira')
SELECT SUM(home_team_goal) AS total_home_goals FROM Player JOIN Match ON Player.player_api_id = Match.home_player_1 WHERE strftime('%Y', 'now') - strftime('%Y', birthday) <= 30; 
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.overall_rating DESC LIMIT 1
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.potential DESC LIMIT 1
SELECT T2.player_name FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.attacking_work_rate = 'High'
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.finishing = 1 ORDER BY date_of_birth ASC LIMIT 1
SELECT T2.player_name FROM Country AS T1 INNER JOIN Player AS T2 ON T1.id = T2.nationality WHERE T1.name = 'Belgium'
SELECT DISTINCT T1.player_name, T4.name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id INNER JOIN Team AS T3 ON T3.team_api_id IN (T1.home_team_api_id, T1.away_team_api_id) INNER JOIN Country AS T4 ON T4.id = T3.country_id WHERE T2.vision >= 90
SELECT T2.name FROM Player AS T1 INNER JOIN Country AS T2 ON T1.player_api_id = T2.id GROUP BY T2.name ORDER BY AVG(T1.weight) DESC LIMIT 1
SELECT T2.team_long_name FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlaySpeedClass = 'Slow'
SELECT T1.team_short_name FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.chanceCreationPassingClass = 'Safe'
SELECT AVG(T1.height) FROM Player AS T1 INNER JOIN Country AS T2 ON T1.player_api_id = T2.id WHERE T2.name = 'Italy'
SELECT player_name FROM Player WHERE height > 180 ORDER BY player_name LIMIT 3
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND birthday > '1990'
SELECT jumping FROM Player_Attributes WHERE id = 6 - jumping FROM Player_Attributes WHERE id = 23
SELECT player_api_id FROM Player_Attributes WHERE preferred_foot = 'right' ORDER BY potential ASC LIMIT 5
SELECT COUNT(*) FROM Player_Attributes WHERE crossing = ( SELECT MAX(crossing) FROM Player_Attributes ) AND preferred_foot = 'left'
SELECT CAST(SUM(CASE WHEN T2.stamina > 80 AND T2.strength > 80 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id
SELECT T2.name FROM league AS T1 INNER JOIN country AS T2 ON T1.country_id = T2.id WHERE T1.name = 'Poland Ekstraklasa'
SELECT T1.home_team_goal, T1.away_team_goal FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.date LIKE '2008-09-24%' AND T2.name = 'Belgium Jupiler League'
SELECT T1.sprint_speed, T1.agility, T1.acceleration FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Alexis Blin'
SELECT T2.buildUpPlaySpeedClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'KSV Cercle Brugge' ORDER BY T2.date DESC LIMIT 1
SELECT COUNT(*) FROM Match WHERE season = '2015/2016' AND league_id IN ( SELECT id FROM League WHERE name = 'Italy Serie A' )
SELECT MAX(home_team_goal) FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Netherlands Eredivisie')
SELECT T2.finishing ,  T2.curve FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T1.weight DESC LIMIT 1
SELECT T1.name FROM League AS T1 INNER JOIN Match AS T2 ON T1.id = T2.league_id WHERE T2.season = '2015/2016' GROUP BY T1.name ORDER BY COUNT(T2.id) DESC LIMIT 4
SELECT T1.team_long_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id GROUP BY T1.team_long_name ORDER BY SUM(T2.away_team_goal) DESC LIMIT 1
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.overall_rating DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN height < 180 AND overall_rating > 70 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id
SELECT SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) * 100.0 / SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END) AS Deviation FROM Patient WHERE SEX = 'M'
SELECT CAST(SUM(CASE WHEN STRFTIME('%Y', Birthday) > '1930' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(ID) FROM Patient WHERE SEX = 'F'
SELECT CAST(SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(ID) FROM Patient WHERE Birthday BETWEEN '1930-01-01' AND '1940-12-31'
SELECT CAST(SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END) FROM Patient WHERE Diagnosis = 'SLE'
SELECT T2.Diagnosis, T1.Date FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.ID = 30609
SELECT T1.SEX, T1.Birthday, T2.`Examination Date`, T2.Symptoms FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.ID = '163109'
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.LDH > 500
SELECT T1.ID ,  STRFTIME('%Y', CURRENT_TIMESTAMP) - STRFTIME('%Y', T1.Birthday) AS Age FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.RVVT = '+'
SELECT T1.ID, T1.SEX, T1.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Thrombosis = 2
SELECT DISTINCT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T1.Birthday) = '1937' AND T2.`T-CHO` >= 250
SELECT P.ID, P.SEX, P.Diagnosis FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.ALB < 3.5; 
SELECT CAST(SUM(CASE WHEN T1.SEX = 'F' AND (T2.TP < 6.0 OR T2.TP > 8.5) THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID
SELECT AVG(T1.`aCL IgG`) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Admission = '+' AND strftime('%Y', 'now') - strftime('%Y', T2.Birthday) >= 50
SELECT COUNT(ID) FROM Patient WHERE SEX = 'F' AND STRFTIME('%Y', Description) = '1997' AND Admission = '-'
SELECT MIN(STRFTIME('%Y', `First Date`) - STRFTIME('%Y', Birthday)) AS Youngest_Age FROM Patient;
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Thrombosis = 1 AND T1.SEX = 'F' AND strftime('%Y', T2.`Examination Date`) = '1997'
SELECT MAX(YEAR(`Birthday`)) - MIN(YEAR(`Birthday`)) AS AgeGap FROM Patient WHERE ID IN ( SELECT ID FROM Laboratory WHERE TG >= 200 )
SELECT T1.Symptoms, T1.Diagnosis FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Birthday IS NOT NULL ORDER BY T2.Birthday DESC LIMIT 1
SELECT SUM(CASE WHEN T2.SEX = 'M' THEN 1 ELSE 0 END) / 12 AS AverageMalePatients FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Date BETWEEN '1998-01-01' AND '1998-12-31'
SELECT T2.Date, TIMESTAMPDIFF(YEAR, T1.Birthday, T1.`First Date`) AS Age FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis LIKE '%SJS%' ORDER BY T1.Birthday ASC LIMIT 1
SELECT CAST(SUM(CASE WHEN T1.SEX = 'M' AND T2.UA <= 8 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T1.SEX = 'F' AND T2.UA <= 6.5 THEN 1 ELSE 0 END) AS Ratio FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.UA IS NOT NULL
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T2.`Examination Date`) - STRFTIME('%Y', T1.`First Date`) >= 1
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T1.Birthday) < '1990' AND STRFTIME('%Y', T2.`Examination Date`) BETWEEN '1990' AND '1993'
SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE T_BIL >= 2 AND ID IN ( SELECT ID FROM Patient WHERE SEX = 'M' )
SELECT Diagnosis FROM Examination WHERE `Examination Date` BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY Diagnosis ORDER BY COUNT(*) DESC LIMIT 1
SELECT AVG(1999 - strftime('%Y', T1.Birthday)) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.Date BETWEEN '1991-10-01' AND '1991-10-30'
SELECT strftime('%Y', T1.`Examination Date`) - strftime('%Y', T2.Birthday) AS Age, T2.Diagnosis FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID ORDER BY T1.HGB DESC LIMIT 1
SELECT ANA FROM Examination WHERE ID = 3605340 AND `Examination Date` = '1996-12-02'
SELECT CASE WHEN T2.T-CHO < 250 THEN 'Normal' ELSE 'Abnormal' END AS Total_Cholesterol_Status FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.ID = 2927464 AND T2.Date = '1995-09-04'
SELECT SEX FROM Patient WHERE Diagnosis = 'AORTITIS' LIMIT 1
SELECT T2.`aCL IgM` FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Description = '1994-02-19' AND T2.`Examination Date` = '1993-11-12' AND T1.Diagnosis = 'SLE'
SELECT CASE WHEN T1.SEX = 'M' THEN 'man' ELSE 'woman' END AS Gender FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.Date = '1992-06-12' AND T2.GPT = 9
SELECT STRFTIME('%Y', T1.Date) - STRFTIME('%Y', T2.Birthday) AS Age FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.UA = 8.4 AND T1.Date = '1991-10-21'
SELECT COUNT(T2.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.`First Date` = '1991-06-13' AND T1.Diagnosis = 'SJS' AND STRFTIME('%Y', T2.Date) = '1995'
SELECT Patient.Diagnosis AS Original_Diagnose FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.Date = '1997-01-27' AND Patient.First_Date = (SELECT MIN(First_Date) FROM Patient WHERE Diagnosis LIKE '%SLE%') 
SELECT T2.Symptoms FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Birthday = '1959-03-01' AND T2.`Examination Date` = '1993-09-27'
SELECT SUM(CASE WHEN T1.Birthday = '1959-02-18' AND T2.Date LIKE '1981-11-%' THEN T2.`T-CHO` ELSE 0 END) - SUM(CASE WHEN T1.Birthday = '1959-02-18' AND T2.Date LIKE '1981-12-%' THEN T2.`T-CHO` ELSE 0 END) AS Decrease_Rate FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID
SELECT DISTINCT P.ID FROM Patient AS P JOIN Examination AS E ON P.ID = E.ID WHERE P.Description BETWEEN '1997-01-01' AND '1997-12-31' AND E.Diagnosis LIKE '%Behcet%' 
SELECT T1.ID FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`Examination Date` BETWEEN '1987-07-06' AND '1996-01-31' AND T1.GPT > 30 AND T1.ALB < 4
SELECT ID FROM Patient WHERE SEX = 'F' AND STRFTIME('%Y', Birthday) = '1964' AND Admission = '+' ORDER BY ID
SELECT COUNT(*) FROM Examination WHERE Thrombosis = 2 AND ANA = 'S' AND `aCL IgM` > ( SELECT AVG(`aCL IgM`) * 1.2 FROM Examination )
SELECT CAST(SUM(CASE WHEN UA <= 6.5 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Laboratory WHERE `U-PRO` > 0 AND `U-PRO` < 30
SELECT CAST(SUM(CASE WHEN T1.DIAGNOSIS = 'BEHCET' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Patient AS T1 WHERE T1.SEX = 'M' AND STRFTIME('%Y', T1.`First Date`) = '1981'; 
SELECT DISTINCT P.ID, P.SEX, P.Birthday, P.Description, P.First_Date, P.Admission, P.Diagnosis FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.Admission = '-' AND L.Date LIKE '1991-10%' AND L.T_BIL < 2.0
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND strftime('%Y', Birthday) BETWEEN '1980' AND '1989' AND ID NOT IN ( SELECT ID FROM Examination WHERE ANA Pattern = 'P' )
SELECT T1.SEX FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T2.Diagnosis = 'PSS' AND T3.CRP > 2 AND T3.CRE = 1 AND T3.LDH = 123
SELECT AVG(T2.ALB) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND T2.PLT > 400 AND T1.Diagnosis = 'SLE'
SELECT Symptoms FROM Examination WHERE Diagnosis = 'SLE' GROUP BY Symptoms ORDER BY COUNT(*) DESC LIMIT 1
SELECT Description, Diagnosis FROM Patient WHERE ID = 48473
SELECT COUNT(ID) FROM Patient WHERE SEX = 'F' AND Diagnosis = 'APS'
SELECT COUNT(*) FROM Laboratory WHERE STRFTIME('%Y', Date) = '1997' AND TP NOT BETWEEN 6 AND 8.5
SELECT CAST(SUM(CASE WHEN T2.Diagnosis LIKE '%ITP%' THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T2.Diagnosis LIKE '%SLE%' THEN 1 ELSE 0 END) FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Symptoms LIKE '%thrombocytopenia%'
SELECT CAST(SUM(CASE WHEN SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(ID) FROM Patient WHERE STRFTIME('%Y', Birthday) = '1980' AND Diagnosis = 'RA'
SELECT COUNT(DISTINCT P.ID) FROM Patient AS P JOIN Examination AS E ON P.ID = E.ID WHERE P.SEX = 'M' AND E.`Examination Date` BETWEEN '1995-01-01' AND '1997-12-31' AND P.Diagnosis = 'Behcet' AND P.Admission = '-'
SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE SEX = 'F' AND WBC < 3.5
SELECT DATEDIFF(`Examination Date`, `First Date`) AS DaysBeforeEvaluation FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.ID = 821298
SELECT CASE WHEN UA > 8.0 AND SEX = 'M' OR UA > 6.5 AND SEX = 'F' THEN 'Yes' ELSE 'No' END AS UricAcidInRange FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.ID = 57266;
SELECT T2.Date FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.ID = 48473 AND T2.GOT >= 60
SELECT P.ID, P.SEX, P.Birthday FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE strftime('%Y', L.Date) = '1994' AND L.GOT < 60; 
SELECT ID FROM Laboratory WHERE GPT >= 60 AND ID IN ( SELECT ID FROM Patient WHERE SEX = 'M' )
SELECT T2.Diagnosis FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.GPT > 60 ORDER BY T2.Birthday ASC
SELECT AVG(LDH) FROM Laboratory WHERE LDH < 500
SELECT P.ID, STRFTIME('%Y', CURRENT_TIMESTAMP) - STRFTIME('%Y', P.Birthday) AS Age FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.LDH BETWEEN 600 AND 800; 
SELECT T2.admission FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.ALP < 300
SELECT T1.ID, CASE WHEN T2.ALP < 300 THEN 'Yes' ELSE 'No' END AS ALP_Normal FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Birthday = '1982-04-01'
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.TP < 6.0
SELECT ID, TP - 8.5 AS Deviation FROM Laboratory WHERE ID IN (SELECT ID FROM Patient WHERE SEX = 'F') AND TP > 8.5
SELECT P.ID, P.Birthday FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.SEX = 'M' AND (L.ALB <= 3.5 OR L.ALB >= 5.5) ORDER BY P.Birthday DESC;
SELECT CASE WHEN T1.ALB BETWEEN 3.5 AND 5.5 THEN 'Within Normal Range' ELSE 'Outside Normal Range' END AS Albumin_Status FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T2.Birthday) = '1982'
SELECT CAST(SUM(CASE WHEN UA > 8.0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(SEX) FROM Laboratory WHERE SEX = 'F'
SELECT AVG(T2.UA) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE (T1.SEX = 'M' AND T2.UA < 8.0) OR (T1.SEX = 'F' AND T2.UA < 6.5) GROUP BY T1.ID ORDER BY T2.Date DESC LIMIT 1
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.UN = 29
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'RA' AND T2.UN < 30
SELECT COUNT(*) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.SEX = 'M' AND T1.CRE >= 1.5
SELECT CASE WHEN SUM(CASE WHEN T1.SEX = 'M' AND T2.CRE >= 1.5 THEN 1 ELSE 0 END) > SUM(CASE WHEN T1.SEX = 'F' AND T2.CRE >= 1.5 THEN 1 ELSE 0 END) THEN 'True' ELSE 'False' END AS Result FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID ORDER BY T2.`T-BIL` DESC LIMIT 1
SELECT SEX ,  GROUP_CONCAT(DISTINCT ID) FROM Laboratory WHERE T_BIL >= 2.0 GROUP BY SEX
SELECT P.ID, L.`T-CHO` FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID ORDER BY P.Birthday ASC, L.`T-CHO` DESC LIMIT 1
SELECT AVG(STRFTIME('%Y', DATETIME('now')) - STRFTIME('%Y', Birthday)) AS AverageAge FROM Patient WHERE ID IN ( SELECT ID FROM Laboratory WHERE T_cho >= 250 ) AND SEX = 'M'
SELECT T1.Description, T1.Diagnosis FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.TG > 300
SELECT COUNT(DISTINCT T2.ID) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.TG >= 200 AND strftime('%Y', 'now') - strftime('%Y', T2.Birthday) > 50 
SELECT DISTINCT ID FROM Patient WHERE Admission = '-' AND CPK < 250
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T1.Birthday) BETWEEN '1936' AND '1956' AND T1.SEX = 'M' AND T2.CPK >= 250
SELECT T1.ID, T1.SEX, STRFTIME('%Y', CURRENT_TIMESTAMP) - STRFTIME('%Y', T1.Birthday) AS Age FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GLU >= 180 AND T2.`T-CHO` < 250
SELECT T1.ID, T2.GLU FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T1.Description) = '1991' AND T2.GLU < 180
SELECT P.ID, P.SEX, P.Birthday FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.WBC <= 3.5 OR L.WBC >= 9.0 GROUP BY P.SEX ORDER BY strftime('%Y', 'now') - strftime('%Y', P.Birthday) ASC; 
SELECT T1.ID ,  STRFTIME('%Y', CURRENT_TIMESTAMP) - STRFTIME('%Y', Birthday) AS Age FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.RBC < 3.5
SELECT P.ID, P.SEX, P.Birthday, P.Admission, L.RBC FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.SEX = 'F' AND (STRFTIME('%Y', CURRENT_TIMESTAMP) - STRFTIME('%Y', P.Birthday)) >= 50 AND (L.RBC <= 3.5 OR L.RBC >= 6.0); 
SELECT DISTINCT T1.ID, T1.SEX FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '-' AND T2.HGB < 10
SELECT T1.ID, T1.SEX FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'SLE' AND T1.Birthday IS NOT NULL ORDER BY T1.Birthday ASC LIMIT 1
SELECT T1.ID ,  STRFTIME('%Y', CURRENT_TIMESTAMP) - STRFTIME('%Y', T1.Birthday) AS Age FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.HCT >= 52 GROUP BY T1.ID HAVING COUNT(T1.ID) > 2
SELECT AVG(HCT) FROM Laboratory WHERE Date LIKE '1991%' AND HCT < 29;
SELECT SUM(CASE WHEN PLT < 100 THEN 1 ELSE 0 END) - SUM(CASE WHEN PLT > 400 THEN 1 ELSE 0 END) AS difference FROM Laboratory WHERE PLT IS NOT NULL; 
SELECT DISTINCT T2.ID FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T1.Date) = '1984' AND SUBSTR(CAST(strftime('%Y', date('now')) AS TEXT), 1, 4) - STRFTIME('%Y', T2.Birthday) < 50 AND T1.PLT BETWEEN 100 AND 400
SELECT CAST(SUM(CASE WHEN T2.PT >= 14 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', CURRENT_TIMESTAMP) - STRFTIME('%Y', T1.Birthday) > 55 AND T1.SEX = 'F'
SELECT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T1.`First Date`) > '1992' AND T2.PT < 14
SELECT COUNT(*) FROM Examination WHERE `Examination Date` > '1997-01-01' AND APTT >= 45;
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.APTT > 45 AND T1.Thrombosis = 0
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.WBC BETWEEN 3.5 AND 9.0 AND (T2.FG <= 150 OR T2.FG >= 450)
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Birthday > '1980-01-01' AND (T1.FG < 150 OR T1.FG > 450)
SELECT DISTINCT T2.Diagnosis FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.`U-PRO` >= 30
SELECT T1.ID FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'SLE' AND T1.`U-PRO` BETWEEN 0 AND 30
SELECT COUNT(DISTINCT ID) FROM Examination WHERE IGG >= 2000
SELECT COUNT(*) FROM Examination WHERE IGG BETWEEN 900 AND 2000 AND Symptoms IS NOT NULL
SELECT T2.Diagnosis FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.IGA BETWEEN 80 AND 500 ORDER BY T1.IGA DESC LIMIT 1
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`aCL IgA` BETWEEN 80 AND 500 AND STRFTIME('%Y', T1.`First Date`) >= '1990'; 
SELECT Diagnosis FROM Examination WHERE IGM <= 40 OR IGM >= 400 GROUP BY Diagnosis ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Description IS NULL AND T1.CRP = '+'
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.CRE >= 1.5 AND TIMESTAMPDIFF(YEAR, T1.Birthday, CURDATE()) < 70
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis LIKE '%RA%' AND T1.KCT = '+'
SELECT DISTINCT T1.Diagnosis FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T1.Birthday) >= '1985' AND T2.RA IN ('-', '+-')
SELECT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Birthday <= DATE_SUB(CURDATE(), INTERVAL 60 YEAR) AND T2.RF < 20
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.RF < 20 AND T1.Thrombosis = 0
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.C3 > 35 AND T1.ANA_Pattern = 'P' 
SELECT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.HCT NOT BETWEEN 29 AND 52 ORDER BY T2.`aCL IgA` DESC LIMIT 1
SELECT COUNT(DISTINCT T1.ID)  FROM Examination AS T1  JOIN Patient AS T2 ON T1.ID = T2.ID  WHERE T1.Thrombosis = 1 AND T2.Diagnosis LIKE '%APS%' AND T2.Description > 10; 
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.RNP IN ('-', '+-') AND T2.Admission = '+'
SELECT Birthday FROM Patient WHERE ID IN ( SELECT ID FROM Laboratory WHERE RNP NOT IN ('-', '+-') ) ORDER BY Birthday DESC LIMIT 1
SELECT COUNT(*) FROM Examination WHERE SM IN ('-', '+-') AND Thrombosis = 0
SELECT ID FROM Patient WHERE ID IN ( SELECT ID FROM Laboratory WHERE SM NOT IN ('negative', '0') ) ORDER BY Birthday DESC LIMIT 3
SELECT DISTINCT T1.ID FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.`Examination Date` > '1997-01-01' AND T2.SC170 IN ('negative', '0')
SELECT COUNT(DISTINCT T2.ID) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.SC170 IN ('negative', '0') AND T2.SEX = 'F' AND T1.Symptoms IS NULL
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.SSA IN ('-', '+') AND STRFTIME('%Y', T1.`First Date`) < '2000'
SELECT T1.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`SSA` NOT IN ('negative', '0') ORDER BY T1.`First Date` ASC LIMIT 1
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'SLE' AND T1.SSB IN ('-', '+-'); 
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.SSB IN ('negative', '0') AND T1.Symptoms IS NOT NULL
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.CENTROMEA IN('-', '+-') AND T2.SSB IN('-', '+-') AND T1.SEX = 'M'
SELECT DISTINCT T2.Diagnosis FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.DNA >= 8
SELECT COUNT(DISTINCT T2.ID) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.DNA < 8 AND T2.Description IS NULL
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.IGG BETWEEN 900 AND 2000 AND T1.Admission = '+'
SELECT CAST(SUM(CASE WHEN T1.GOT >= 60 AND T2.Diagnosis = 'SLE' THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T1.GOT >= 60 THEN 1 ELSE 0 END) FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.SEX = 'M' AND T1.GOT < 60
SELECT MIN(T2.Birthday) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.GOT >= 60
SELECT T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GPT IS NOT NULL AND T2.GPT < 60 ORDER BY T2.GPT DESC LIMIT 3
SELECT COUNT(*) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.GOT < 60
SELECT MIN(T1.`First Date`) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.LDH < 500
SELECT T1.`First Date` FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.LDH >= 500 ORDER BY T1.`First Date` DESC LIMIT 1
SELECT COUNT(*) FROM Patient WHERE ID IN ( SELECT ID FROM Laboratory WHERE ALP >= 300 ) AND Admission = '+'
SELECT COUNT(*) FROM Patient WHERE Admission = '-' AND ID IN (SELECT ID FROM Laboratory WHERE ALP < 300)
SELECT T2.Diagnosis FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.TP < 6.0
SELECT COUNT(*) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis LIKE '%SJS%' AND T2.Diagnosis LIKE '%SJS%' AND T1.TP BETWEEN 6.0 AND 8.5
SELECT T1.`Examination Date` FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.ALB BETWEEN 3.5 AND 5.5 ORDER BY T2.ALB DESC LIMIT 1
SELECT COUNT(*) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.ALB BETWEEN 3.5 AND 5.5 AND T2.TP BETWEEN 6.0 AND 8.5
SELECT MAX(T1.`aCL IgG`), MAX(T1.`aCL IgM`), MAX(T1.`aCL IgA`) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.SEX = 'F' AND T1.UA IS NOT NULL AND T1.UA <= 6.50
SELECT MAX(T1.ANA) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.CRE < 1.5
SELECT T1.ID FROM Laboratory AS T1 WHERE T1.CRE < 1.5 ORDER BY T1.aCL IgA DESC LIMIT 1
SELECT COUNT(DISTINCT E.ID) FROM Examination AS E JOIN Laboratory AS L ON E.ID = L.ID WHERE E.ANA_Pattern LIKE '%P%' AND L.`T-BIL` >= 2.0
SELECT T1.ANA FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.`T-BIL` < 2.0 ORDER BY T2.`T-BIL` DESC LIMIT 1
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.`T-CHO` >= 250 AND T1.KCT = '-'
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.ANA_Pattern = 'P' AND T2.T_CHO < 250
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.TG < 200 AND T1.Symptoms IS NOT NULL
SELECT T1.Diagnosis FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.TG IS NOT NULL AND T2.TG < 200 ORDER BY T2.TG DESC LIMIT 1
SELECT ID FROM Examination WHERE Thrombosis = 0 AND CPK < 250;
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.CPK < 250 AND (T1.KCT = '+' OR T1.RVVT = '+' OR T1.LAC = '+')
SELECT Birthday FROM Patient WHERE ID IN ( SELECT ID FROM Laboratory WHERE GLU > 180 ORDER BY Birthday ASC LIMIT 1 )
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.GLU < 180 AND T1.Thrombosis = 0
SELECT COUNT(ID) FROM Patient WHERE Admission = '+' AND WBC BETWEEN 3.5 AND 9.0
SELECT COUNT(*) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'SLE' AND T2.WBC BETWEEN 3.5 AND 9.0
SELECT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.RBC <= 3.5 OR T2.RBC >= 6.0 AND T1.Admission = '-'
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.PLT BETWEEN 100 AND 400 AND T1.Diagnosis IS NOT NULL
SELECT T2.PLT FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'MCTD' AND T2.PLT BETWEEN 100 AND 400
SELECT AVG(T2.PT) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.PT < 14
SELECT COUNT(DISTINCT ID) FROM Examination WHERE Thrombosis IN (1, 2) AND PT < 14;
SELECT T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Angela' AND T1.last_name = 'Sanders'
SELECT COUNT(*) FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.college = 'College of Engineering'
SELECT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.department = 'Art and Design'
SELECT COUNT(*) FROM attendance AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'Women''s Soccer'
SELECT T1.phone FROM member AS T1 INNER JOIN attendance AS T2 ON T1.member_id = T2.link_to_member INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'Women''s Soccer' AND T1.position = 'Student'
SELECT COUNT(*) FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'Women''s Soccer' AND T1.t_shirt_size = 'Medium'
SELECT T1.event_name FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T2.link_to_member IN ( SELECT member_id FROM member WHERE position = 'Student' ) GROUP BY T2.link_to_event ORDER BY COUNT(T2.link_to_event) DESC LIMIT 1
SELECT T1.college FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.position = 'Vice President'
SELECT T3.event_name FROM member AS T1 INNER JOIN attendance AS T2 ON T1.member_id = T2.link_to_member INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T1.first_name = 'Maya' AND T1.last_name = 'Mclean'
SELECT COUNT(*) FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event INNER JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T3.first_name = 'Sacha' AND T3.last_name = 'Harrison' AND STRFTIME('%Y', T1.event_date) = '2019'
SELECT COUNT(DISTINCT event_id) AS meeting_count FROM attendance JOIN event ON attendance.link_to_event = event.event_id WHERE event.type = 'Meeting' GROUP BY event.event_id HAVING COUNT(attendance.link_to_member) > 10; 
SELECT T1.event_name FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.type != 'Fundraiser' GROUP BY T1.event_id HAVING COUNT(T2.link_to_event) > 20
SELECT CAST(COUNT(event_id) AS REAL) / COUNT(DISTINCT event_name) FROM event WHERE type = 'Meeting' AND STRFTIME('%Y', event_date) = '2020'
SELECT expense_description FROM expense WHERE cost = (SELECT MAX(cost) FROM expense);
SELECT COUNT(*) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Environmental Engineering'
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'Laugh Out Loud'
SELECT T1.last_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Law and Constitutional Studies'
SELECT T1.county FROM zip_code AS T1 INNER JOIN member AS T2 ON T2.zip = T1.zip_code WHERE T2.first_name = 'Sherri' AND T2.last_name = 'Ramsey'
SELECT T1.college FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Tyler' AND T2.last_name = 'Hewitt'; 
SELECT SUM(amount) FROM income WHERE link_to_member IN ( SELECT member_id FROM member WHERE position = 'Vice President' )
SELECT SUM(T2.spent) FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'September Meeting' AND T2.category = 'Food'
SELECT T2.city, T2.state FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.position = 'President'; 
SELECT T.first_name, T.last_name FROM member AS T INNER JOIN zip_code AS Z ON T.zip = Z.zip_code WHERE Z.state = 'IL'
SELECT SUM(T1.spent) FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'September Meeting' AND T1.category = 'Advertisement'
SELECT T1.department FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Pierce' AND T2.last_name = 'Guidi' OR T2.first_name = 'Luisa' AND T2.last_name = 'Guidi'
SELECT SUM(T2.amount) FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'October Speaker'; 
SELECT T1.approved FROM expense AS T1 JOIN attendance AS T2 ON T1.link_to_member = T2.link_to_member JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'October Meeting' AND T3.event_date LIKE '2019-10-08%'
SELECT AVG(cost) AS total_average_cost FROM expense JOIN member ON expense.link_to_member = member.member_id WHERE first_name = 'Elijah' AND last_name = 'Allen' AND strftime('%m', expense_date) IN ('09', '10'); 
SELECT SUM(CASE WHEN STRFTIME('%Y', T2.event_date) = '2019' THEN T1.spent ELSE 0 END) - SUM(CASE WHEN STRFTIME('%Y', T2.event_date) = '2020' THEN T1.spent ELSE 0 END) AS diff FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id
SELECT location FROM event WHERE event_name = 'Spring Budget Review';
SELECT T1.cost FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id WHERE T1.expense_date = '2019-09-04' AND T1.expense_description LIKE '%Posters%'
SELECT remaining FROM budget WHERE category = 'Food' AND amount = ( SELECT MAX(amount) FROM budget WHERE category = 'Food' )
SELECT notes FROM income WHERE date_received = '2019-09-14' AND source = 'Fundraising';
SELECT COUNT(*) FROM major WHERE college = 'College of Humanities and Social Sciences'
SELECT phone FROM member WHERE first_name = 'Carlo' AND last_name = 'Jacobs'; 
SELECT T1.county FROM zip_code AS T1 INNER JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T2.first_name = 'Adela' AND T2.last_name = 'O''Gallagher'
SELECT COUNT(*) FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'November Meeting' AND T1.remaining < 0
SELECT SUM(T1.amount) FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'September Speaker'
SELECT T2.event_status FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id WHERE T1.expense_date = '2019-8-20' AND T1.expense_description = 'Post Cards, Posters'
SELECT T3.major_name FROM member AS T1 INNER JOIN major AS T3 ON T1.link_to_major = T3.major_id WHERE T1.first_name = 'Brent' AND T1.last_name = 'Thomason'; 
SELECT COUNT(*) FROM member WHERE link_to_major IN (SELECT major_id FROM major WHERE college = 'School of Business') AND t_shirt_size = 'Medium'; 
SELECT T1.type FROM zip_code AS T1 INNER JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T2.first_name = 'Christof' AND T2.last_name = 'Nielsen'
SELECT T1.major_name FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.position = 'Vice President'
SELECT T1.state FROM zip_code AS T1 INNER JOIN member AS T2 ON T2.zip = T1.zip_code WHERE T2.first_name = 'Sacha' AND T2.last_name = 'Harrison'
SELECT T1.department FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.position = 'President'
SELECT T1.date_received FROM income AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Connor' AND T2.last_name = 'Hilton' AND T1.source = 'Dues'
SELECT first_name, last_name FROM member WHERE member_id = ( SELECT link_to_member FROM income WHERE source = 'Dues' ORDER BY date_received ASC LIMIT 1 )
SELECT CAST(SUM(CASE WHEN T1.event_name = 'Yearly Kickoff' THEN T2.amount ELSE 0 END) AS REAL) / SUM(CASE WHEN T1.event_name = 'October Meeting' THEN T2.amount ELSE 0 END) FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Advertisement'; 
SELECT CAST(SUM(CASE WHEN T1.category = 'Parking' AND T2.event_name = 'November Speaker' THEN T1.amount ELSE 0 END) AS REAL) * 100 / COUNT(T2.event_name = 'November Speaker') FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'November Speaker'
SELECT SUM(cost) AS total_cost_of_pizzas FROM expense WHERE expense_description = 'Pizza'; 
SELECT COUNT(*) FROM zip_code WHERE county = 'Orange County' AND state = 'Virginia'; 
SELECT department FROM major WHERE college = 'College of Humanities and Social Sciences'
SELECT T1.city, T1.county, T1.state FROM zip_code AS T1 INNER JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T2.first_name = 'Amy' AND T2.last_name = 'Firth'
SELECT T1.expense_description FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id ORDER BY T2.remaining ASC LIMIT 1
SELECT T2.first_name, T2.last_name FROM attendance AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.link_to_event IN ( SELECT event_id FROM event WHERE event_name = 'October Meeting' )
SELECT T1.college FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major GROUP BY T1.college ORDER BY COUNT(T1.college) DESC LIMIT 1
SELECT T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.phone = '809-555-3360'
SELECT T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event ORDER BY T2.amount DESC LIMIT 1
SELECT T2.expense_description FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T1.position = 'Vice President'
SELECT COUNT(*) FROM attendance AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'Women''s Soccer'
SELECT T1.date_received FROM income AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Casey' AND T2.last_name = 'Mason'; 
SELECT COUNT(*) FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T2.state = 'MD'
SELECT COUNT(*) FROM attendance AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id JOIN member AS T3 ON T1.link_to_member = T3.member_id WHERE T3.phone = '954-555-6240'; 
SELECT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.department = 'School of Applied Sciences, Technology and Education'
SELECT T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.status = 'Closed' ORDER BY T2.spent / T2.amount DESC LIMIT 1
SELECT COUNT(*) FROM member WHERE position = 'President';
SELECT MAX(spent) FROM budget
SELECT COUNT(*) FROM event WHERE type = 'Meeting' AND STRFTIME('%Y', event_date) = '2020'
SELECT SUM(spent) FROM budget WHERE category = 'Food'; 
SELECT T.first_name, T.last_name FROM ( SELECT T1.first_name, T1.last_name, COUNT(T2.link_to_event) AS num FROM member AS T1 INNER JOIN attendance AS T2 ON T1.member_id = T2.link_to_member GROUP BY T1.first_name, T1.last_name ) AS T WHERE T.num > 7
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id JOIN major mj ON m.link_to_major = mj.major_id WHERE e.event_name = 'Community Theater' AND mj.major_name = 'Interior Design'; 
SELECT T.first_name, T.last_name FROM member AS T JOIN zip_code AS Z ON T.zip = Z.zip_code WHERE T.zip IN ( SELECT zip_code FROM zip_code WHERE city = 'Georgetown' AND state = 'South Carolina' )
SELECT SUM(amount) FROM income WHERE link_to_member = ( SELECT member_id FROM member WHERE first_name = 'Grant' AND last_name = 'Gilmour' )
SELECT T.first_name, T.last_name FROM member AS T JOIN income AS I ON T.member_id = I.link_to_member WHERE I.amount > 40
SELECT SUM(T1.cost) FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'Yearly Kickoff'
SELECT T2.first_name, T2.last_name FROM budget AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id INNER JOIN event AS T3 ON T1.link_to_event = T3.event_id WHERE T3.event_name = 'Yearly Kickoff'
SELECT T1.first_name, T1.last_name, T2.source FROM member AS T1 INNER JOIN income AS T2 ON T1.member_id = T2.link_to_member ORDER BY T2.amount DESC LIMIT 1
SELECT T1.event_name FROM event AS T1 JOIN expense AS T2 ON T1.event_id = T2.link_to_event ORDER BY T2.cost ASC LIMIT 1
SELECT CAST(SUM(CASE WHEN T1.event_name = 'Yearly Kickoff' THEN T2.cost ELSE 0 END) AS REAL) * 100 / SUM(T2.cost) FROM event AS T1 INNER JOIN expense AS T2 ON T1.event_id = T2.link_to_event; 
SELECT CAST(SUM(CASE WHEN T1.major_name = 'Finance' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T1.major_name = 'Physics' THEN 1 ELSE 0 END) FROM major AS T1 INNER JOIN member AS T2 ON T2.link_to_major = T1.major_id
SELECT source FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' GROUP BY source ORDER BY SUM(amount) DESC LIMIT 1
SELECT first_name, last_name, email FROM member WHERE position = 'Secretary'
SELECT COUNT(*) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Physics Teaching';
SELECT COUNT(T2.link_to_member) FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'Community Theater' AND STRFTIME('%Y', T1.event_date) = '2019'
SELECT COUNT(T1.link_to_event), T3.major_name FROM attendance AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id JOIN major AS T3 ON T2.link_to_major = T3.major_id WHERE T2.first_name = 'Luisa' AND T2.last_name = 'Guidi'; 
SELECT AVG(spent) FROM budget WHERE category = 'Food' AND event_status = 'Closed'
SELECT T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Advertisement' ORDER BY T2.spent DESC LIMIT 1
SELECT CASE WHEN EXISTS (     SELECT 1 FROM member AS m     JOIN attendance AS a ON m.member_id = a.link_to_member     JOIN event AS e ON a.link_to_event = e.event_id     WHERE m.first_name = 'Maya' AND m.last_name = 'Mclean' AND e.event_name = 'Women''s Soccer' ) THEN 'Yes' ELSE 'No' END AS attended; 
SELECT CAST(SUM(CASE WHEN type = 'Community Service' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(event_id) FROM event WHERE event_date LIKE '2019%'
SELECT T2.cost FROM event AS T1 INNER JOIN expense AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'September Speaker' AND T2.expense_description = 'Posters'
SELECT t_shirt_size FROM member GROUP BY t_shirt_size ORDER BY COUNT(t_shirt_size) DESC LIMIT 1
SELECT T1.event_name FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.status = 'Closed' AND T2.remaining < 0 ORDER BY T2.remaining ASC LIMIT 1
SELECT T1.expense_description ,  SUM(T1.cost) FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'October Meeting' AND T1.approved = 'true'
SELECT T1.category ,  SUM(T1.amount) FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'April Speaker' GROUP BY T1.category ORDER BY T1.amount ASC
SELECT budget_id FROM budget WHERE category = 'Food' ORDER BY amount DESC LIMIT 1
SELECT budget_id, amount FROM budget WHERE category = 'Advertisement' ORDER BY amount DESC LIMIT 3
SELECT SUM(cost) FROM expense WHERE expense_description = 'Parking'
SELECT SUM(cost) FROM expense WHERE expense_date = '2019-08-20'
SELECT T1.first_name, T1.last_name, SUM(T2.cost) FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.link_to_member = 'rec4BLdZHS2Blfp4v'
SELECT T1.expense_description FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Sacha' AND T2.last_name = 'Harrison'
SELECT T1.expense_description FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.t_shirt_size = 'X-Large'
SELECT T1.zip FROM member AS T1 JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T2.amount < 50
SELECT T1.major_name FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Phillip' AND T2.last_name = 'Cullen'
SELECT T1.position FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Business'
SELECT COUNT(*) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Business' AND T1.t_shirt_size = 'Medium'
SELECT T1.type FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.remaining > 30
SELECT DISTINCT T1.category FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.location = 'MU 215'
SELECT T1.category FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_date = '2020-03-24T12:00:00'; 
SELECT T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Vice President'
SELECT CAST(SUM(CASE WHEN T1.position = 'Member' AND T2.major_name = 'Business' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.member_id) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id
SELECT T1.category FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.location = 'MU 215'
SELECT COUNT(*) FROM income WHERE amount = 50;
SELECT COUNT(*) FROM member WHERE t_shirt_size = 'X-Large' AND position = 'Member'
SELECT COUNT(*) FROM major WHERE college = 'College of Agriculture and Applied Sciences' AND department = 'School of Applied Sciences, Technology and Education';
SELECT T1.last_name ,  T2.department ,  T2.college FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Environmental Engineering'
SELECT T2.category FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.location = 'MU 215' AND T1.type = 'Guest Speaker' AND T2.spent = 0
SELECT T2.city, T2.state FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code INNER JOIN major AS T3 ON T1.link_to_major = T3.major_id WHERE T3.department = 'Electrical and Computer Engineering Department' AND T1.position = 'Member'
SELECT T1.event_name FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T3.position = 'Vice President' AND T1.location = '900 E. Washington St.' AND T1.type = 'Social'
SELECT T1.last_name ,  T1.position FROM member AS T1 JOIN expense AS T2 ON T1.member_id  =  T2.link_to_member WHERE T2.expense_date  =  '2019-09-10' AND T2.expense_description  =  'Pizza'
SELECT T1.last_name FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'Women''s Soccer' AND T1.position = 'Member'
SELECT CAST(SUM(CASE WHEN T1.amount = 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.member_id) FROM income AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.t_shirt_size = 'Medium' AND T2.position = 'Member'
SELECT DISTINCT county FROM zip_code WHERE type = 'PO Box'
SELECT zip_code FROM zip_code WHERE city IN ( SELECT city FROM zip_code WHERE county = 'San Juan Municipio' AND state = 'Puerto Rico' ) AND type = 'PO Box'
SELECT event_name FROM event WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20'
SELECT T1.link_to_event FROM attendance AS T1 INNER JOIN expense AS T2 ON T1.link_to_event = T2.link_to_event WHERE T2.cost > 50
SELECT T1.first_name, T1.last_name, T2.link_to_event FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.approved = 'true' AND T2.expense_date BETWEEN '2019-01-10' AND '2019-11-19'
SELECT T2.college FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Katy' AND T2.major_id = 'rec1N0upiVLy5esTO'
SELECT T1.phone FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.college = 'College of Agriculture and Applied Sciences' AND T2.major_name = 'Business'
SELECT T1.email FROM member AS T1 INNER JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T2.amount > 20 AND T2.date_received BETWEEN '2019-09-10' AND '2019-11-19'
SELECT COUNT(*) FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Education' AND T1.position = 'Member'
SELECT CAST(SUM(CASE WHEN remaining < 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(event_id) FROM budget
SELECT event_id, location, status FROM event WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31'; 
SELECT expense_description FROM expense GROUP BY expense_description HAVING AVG(cost) > 50
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large'
SELECT CAST(SUM(CASE WHEN type = 'PO Box' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(zip_code) FROM zip_code
SELECT T1.event_name ,  T1.location FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.remaining > 0
SELECT T1.event_name, T1.event_date FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event JOIN expense AS T3 ON T2.budget_id = T3.link_to_budget WHERE T3.expense_description = 'Pizza' AND T3.cost BETWEEN 50 AND 100
SELECT T1.first_name, T1.last_name, T3.major_name FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member INNER JOIN major AS T3 ON T1.link_to_major = T3.major_id WHERE T2.cost > 100
SELECT T2.city, T2.county FROM income AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code GROUP BY T1.link_to_member HAVING COUNT(T1.income_id) > 40
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member GROUP BY T1.member_id HAVING COUNT(T2.event_id) > 1 ORDER BY SUM(T2.cost) DESC LIMIT 1
SELECT AVG(T2.cost) FROM income AS T1 INNER JOIN expense AS T2 ON T1.link_to_member = T2.link_to_member WHERE T1.amount > 0 AND T2.approved = 'true' AND T1.source != 'Dues'
SELECT T1.event_name FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event JOIN expense AS T3 ON T2.budget_id = T3.link_to_budget WHERE T3.expense_description = 'Parking' AND T3.cost < ( SELECT AVG(T3.cost) FROM expense AS T3 JOIN budget AS T2 ON T3.link_to_budget = T2.budget_id WHERE T2.category = 'Parking' )
SELECT CAST(SUM(CASE WHEN T2.type = 'Meeting' THEN T1.cost ELSE 0 END) AS REAL) * 100 / COUNT(T1.expense_id) FROM expense AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id
SELECT T2.budget_id FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id WHERE T1.expense_description = 'Water, chips, cookies' ORDER BY T1.cost DESC LIMIT 1
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member GROUP BY T1.member_id ORDER BY SUM(T2.cost) DESC LIMIT 5
SELECT T1.first_name, T1.last_name, T1.phone FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.cost > ( SELECT AVG(cost) FROM expense )
SELECT CAST(SUM(CASE WHEN T2.state = 'New Jersey' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.position = 'Member') - CAST(SUM(CASE WHEN T2.state = 'Vermont' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.position = 'Member') FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.position = 'Member'
SELECT T1.major_name, T1.department FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Garrett' AND T2.last_name = 'Gerke'; 
SELECT T1.first_name, T1.last_name, SUM(T2.cost) FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.expense_description = 'Water, Veggie tray, supplies'
SELECT T1.last_name ,  T1.phone FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Elementary Education'
SELECT T1.category ,  T1.amount FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'January Speaker'
SELECT T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Food'
SELECT T1.first_name , T1.last_name , T2.amount FROM member AS T1 INNER JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T2.date_received = '2019-09-09'
SELECT T1.category FROM budget AS T1 INNER JOIN expense AS T2 ON T1.budget_id = T2.link_to_budget WHERE T2.expense_description = 'Posters'
SELECT T1.first_name, T1.last_name, T2.college FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Secretary'
SELECT SUM(T1.spent), T2.event_name FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Speaker Gifts'
SELECT T2.city FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Garrett' AND T1.last_name = 'Gerke'
SELECT T1.first_name, T1.last_name, T1.position FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T2.city = 'Lincolnton' AND T2.state = 'North Carolina' AND T2.zip_code = 28092
SELECT COUNT(GasStationID) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Premium'
SELECT CAST(SUM(CASE WHEN Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN Currency = 'CZK' THEN 1 ELSE 0 END) FROM customers WHERE Currency IN ('EUR', 'CZK')
SELECT T2.CustomerID FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date LIKE '2012%' AND T2.Segment = 'LAM' ORDER BY T1.Consumption ASC LIMIT 1
SELECT AVG(AvgCons) FROM ( SELECT SUM(CASE WHEN SUBSTR(Date, 1, 4) = '2013' THEN Consumption ELSE 0 END) / 12 AS AvgCons FROM yearmonth INNER JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE customers.Segment = 'SME' )
SELECT T1.CustomerID FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Currency = 'CZK' AND STRFTIME('%Y', T2.Date) = '2011' GROUP BY T1.CustomerID ORDER BY SUM(T2.Amount) DESC LIMIT 1
SELECT COUNT(CustomerID) FROM yearmonth WHERE CustomerID IN ( SELECT CustomerID FROM customers WHERE Segment = 'KAM' ) AND Date BETWEEN '201201' AND '201212' AND Consumption < 30000; 
SELECT SUM(CASE WHEN T1.Currency = 'CZK' THEN T2.Consumption ELSE 0 END) - SUM(CASE WHEN T1.Currency = 'EUR' THEN T2.Consumption ELSE 0 END) AS Difference FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date BETWEEN '201201' AND '201212'
SELECT STRFTIME('%Y', T1.Date) FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Currency = 'EUR' GROUP BY STRFTIME('%Y', T1.Date) ORDER BY SUM(T1.Amount) DESC LIMIT 1
SELECT Segment FROM customers WHERE CustomerID IN (SELECT CustomerID FROM yearmonth GROUP BY CustomerID ORDER BY SUM(Consumption) ASC LIMIT 1)
SELECT SUBSTR(Date, 1, 4) AS Year FROM yearmonth ORDER BY Consumption DESC LIMIT 1
SELECT T1.Date FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Segment = 'SME' AND T1.Date BETWEEN '201301' AND '201312' ORDER BY T1.Consumption DESC LIMIT 1
SELECT      (SUM(CASE WHEN T2.Segment = 'SME' THEN T1.Consumption ELSE 0 END) / COUNT(DISTINCT CASE WHEN T2.Segment = 'SME' AND SUBSTR(T1.Date, 1, 4) = '2013' THEN T2.CustomerID END)) -     (SUM(CASE WHEN T2.Segment = 'LAM' THEN T1.Consumption ELSE 0 END) / COUNT(DISTINCT CASE WHEN T2.Segment = 'LAM' AND SUBSTR(T1.Date, 1, 4) = '2013' THEN T2.CustomerID END)) AS diff_SME_LAM,          (SUM(CASE WHEN T2.Segment = 'LAM' THEN T1.Consumption ELSE 0 END) / COUNT(DISTINCT CASE WHEN T2.Segment = 'LAM' AND SUBSTR(T1.Date, 1, 4) = '2013' THEN T2.CustomerID END)) -     (SUM(CASE WHEN T2.Segment = 'KAM' THEN T1.Consumption ELSE 0 END) / COUNT(DISTINCT CASE WHEN T2.Segment = 'KAM' AND SUBSTR(T1.Date, 1, 4) = '2013' THEN T2.CustomerID END)) AS diff_LAM_KAM,          (SUM(CASE WHEN T2.Segment = 'KAM' THEN T1.Consumption ELSE 0 END) / COUNT(DISTINCT CASE WHEN T2.Segment = 'KAM' AND SUBSTR(T1.Date, 1, 4) = '2013' THEN T2.CustomerID END)) -     (SUM(CASE WHEN T2.Segment = 'SME' THEN T1.Consumption ELSE 0 END) / COUNT(DISTINCT CASE WHEN T2.Segment = 'SME' AND SUBSTR(T1.Date, 1, 4) = '2013' THEN T2.CustomerID END)) AS diff_KAM_SME FROM      yearmonth AS T1 INNER JOIN      customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE      SUBSTR(T1.Date, 1, 4) = '2013'; 
SELECT Segment, MAX((SUM(CASE WHEN SUBSTR(Date, 1, 4) = '2013' THEN Consumption ELSE 0 END) - SUM(CASE WHEN SUBSTR(Date, 1, 4) = '2012' THEN Consumption ELSE 0 END)) / SUM(CASE WHEN SUBSTR(Date, 1, 4) = '2013' THEN Consumption ELSE 0 END)) * 100 AS MaxPercentageIncrease, MIN((SUM(CASE WHEN SUBSTR(Date, 1, 4) = '2013' THEN Consumption ELSE 0 END) - SUM(CASE WHEN SUBSTR(Date, 1, 4) = '2012' THEN Consumption ELSE 0 END)) / SUM(CASE WHEN SUBSTR(Date, 1, 4) = '2013' THEN Consumption ELSE 0 END)) * 100 AS MinPercentageDecrease FROM customers INNER JOIN yearmonth ON customers.CustomerID = yearmonth.CustomerID WHERE Currency = 'EUR' GROUP BY Segment
SELECT SUM(Consumption) FROM yearmonth WHERE CustomerID = 6 AND Date BETWEEN '201308' AND '201311'
SELECT SUM(CASE WHEN Country = 'CZE' THEN 1 ELSE 0 END) - SUM(CASE WHEN Country = 'SVK' THEN 1 ELSE 0 END) AS Discount_Gas_Stations_Difference FROM gasstations WHERE Segment LIKE '%Discount%'
SELECT T2.Consumption - T1.Consumption FROM yearmonth AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date = '201304' AND T2.Date = '201304' AND T1.CustomerID = 5 AND T2.CustomerID = 7
SELECT SUM(CASE WHEN T2.Currency = 'CZK' THEN 1 ELSE 0 END) - SUM(CASE WHEN T2.Currency = 'EUR' THEN 1 ELSE 0 END) AS Difference FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Segment = 'SME'
SELECT T1.CustomerID FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM' AND T1.Currency = 'EUR' AND T2.Date = '201310' ORDER BY T2.Consumption DESC LIMIT 1
SELECT c.CustomerID, SUM(y.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'KAM' GROUP BY c.CustomerID ORDER BY TotalConsumption DESC LIMIT 1
SELECT SUM(t.Consumption) FROM yearmonth AS t WHERE t.CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'KAM') AND t.Date = '201305'; 
SELECT CAST(SUM(CASE WHEN T2.Consumption > 46.73 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM'
SELECT Country ,  COUNT(*) FROM gasstations WHERE Segment = 'Value for money' GROUP BY Country ORDER BY COUNT(*) DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN T1.Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'KAM'
SELECT CAST(SUM(CASE WHEN Consumption > 528.3 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(CustomerID) FROM yearmonth WHERE Date LIKE '201202%'
SELECT CAST(SUM(CASE WHEN Segment = 'Premium' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM gasstations WHERE Country = 'SVK'
SELECT CustomerID FROM yearmonth WHERE Date = '201309' ORDER BY Consumption DESC LIMIT 1
SELECT T1.Segment FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '201309' ORDER BY T2.Consumption ASC LIMIT 1
SELECT T1.CustomerID FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '201206' AND T1.Segment = 'SME' ORDER BY T2.Consumption ASC LIMIT 1
SELECT MAX(Consumption) FROM yearmonth WHERE Date LIKE '2012%'
SELECT MAX(AvgMonthlyConsumption) FROM ( SELECT AVG(Consumption) AS AvgMonthlyConsumption FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Currency = 'EUR' GROUP BY T1.CustomerID )
SELECT T2.Description FROM transactions_1k AS T1 INNER JOIN products AS T2 ON T1.ProductID = T2.ProductID WHERE T1.Date LIKE '201309%'
SELECT DISTINCT T2.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE strftime('%Y%m', T1.Date) = '201306'
SELECT DISTINCT T1.ChainID FROM gasstations AS T1 INNER JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Currency = 'EUR'
SELECT T1.Description FROM products AS T1 INNER JOIN transactions_1k AS T2 ON T1.ProductID = T2.ProductID WHERE T2.Currency = 'EUR'
SELECT AVG(Price) FROM transactions_1k WHERE Date LIKE '2012-01-%'
SELECT COUNT(DISTINCT t1.CustomerID) FROM customers AS t1 INNER JOIN yearmonth AS t2 ON t1.CustomerID = t2.CustomerID WHERE t1.Currency = 'EUR' AND t2.Consumption > 1000
SELECT T3.Description FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID INNER JOIN products AS T3 ON T1.ProductID = T3.ProductID WHERE T2.Country = 'CZE'
SELECT DISTINCT Time FROM transactions_1k WHERE GasStationID IN ( SELECT GasStationID FROM gasstations WHERE ChainID = 11 )
SELECT COUNT(*) FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE' AND T1.Price > 1000
SELECT COUNT(*) FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE' AND T1.Date > '2012-01-01'
SELECT AVG(TotalPrice) FROM ( SELECT T1.Price * T1.Amount AS TotalPrice FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE' )
SELECT AVG(Price) FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Currency = 'EUR'
SELECT T1.CustomerID FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '2012-08-25' ORDER BY T2.Amount DESC LIMIT 1
SELECT T2.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-25' ORDER BY T1.TransactionID ASC LIMIT 1
SELECT T1.Currency FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '2012-08-24' AND T2.Time = '16:25:00'
SELECT T2.Segment FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date = '2012-08-23' AND T1.Time = '21:20:00'
SELECT COUNT(*) FROM transactions_1k WHERE Date = '2012-08-26' AND Time < '13:00:00' AND Currency = 'CZK';
SELECT Segment FROM customers ORDER BY CustomerID ASC LIMIT 1
SELECT T2.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-24' AND T1.Time = '12:42:00'
SELECT ProductID FROM transactions_1k WHERE Date = '2012-08-23' AND Time = '21:20:00'
SELECT T1.Date, T1.Amount FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date = '2012-08-24' AND T1.Amount = 124.05; SELECT Consumption FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM transactions_1k WHERE Date = '2012-08-24' AND Amount = 124.05) AND Date LIKE '201201%'; 
SELECT COUNT(*) FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-26' AND T1.Time BETWEEN '08:00:00' AND '09:00:00' AND T2.Country = 'CZE'
SELECT T1.Currency FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date LIKE '%201306%' AND T2.Amount = 214582.17; 
SELECT T1.Country FROM gasstations AS T1 INNER JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.CardID = 667467
SELECT T1.Country FROM gasstations AS T1 INNER JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Date = '2012-08-24' AND T2.Amount = 548.4
SELECT CAST(SUM(CASE WHEN Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM customers WHERE Date = '2012-08-25'
SELECT      (t1.Consumption - t2.Consumption) / t1.Consumption AS ConsumptionDecreaseRate FROM      yearmonth t1 JOIN      yearmonth t2 ON t1.CustomerID = t2.CustomerID AND t1.Date LIKE '2012%' JOIN      transactions_1k tx ON t1.CustomerID = tx.CustomerID AND tx.Date = '2012-08-25' WHERE      t1.Date LIKE '2012%' AND t2.Date LIKE '2013%'; 
SELECT T2.Description FROM transactions_1k AS T1 INNER JOIN products AS T2 ON T1.ProductID = T2.ProductID GROUP BY T2.Description ORDER BY SUM(T1.Amount) DESC LIMIT 1
SELECT SUM(CASE WHEN T2.Segment = 'Premium' THEN 1 ELSE 0 END) * 100 / COUNT(*) FROM gasstations AS T1 INNER JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Country = 'SVK'
SELECT SUM(Amount) FROM transactions_1k WHERE CustomerID = 38508 AND strftime('%Y%m', Date) = '201201'
SELECT T2.Description FROM transactions_1k AS T1 INNER JOIN products AS T2 ON T1.ProductID = T2.ProductID GROUP BY T2.Description ORDER BY COUNT(T1.TransactionID) DESC LIMIT 5
SELECT T1.CustomerID, AVG(T1.Price), T2.Currency FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID GROUP BY T1.CustomerID ORDER BY SUM(T1.Amount) DESC LIMIT 1
SELECT T2.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.ProductID = 2 ORDER BY T1.Price DESC LIMIT 1
SELECT T2.CustomerID ,  T1.Consumption FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T1.CustomerID  =  T2.CustomerID WHERE T2.CustomerID IN ( SELECT CustomerID FROM transactions_1k WHERE ProductID  =  5 AND Price / Amount  >  29 ) AND T1.Date LIKE '%201208%'
