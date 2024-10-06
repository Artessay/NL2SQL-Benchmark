SELECT MAX((Free_Meal_Count_K_12 / Enrollment_K_12)) AS Highest_Eligible_Free_Rate FROM frpm WHERE County_Name = 'Alameda'	california_schools
SELECT `Percent (%) Eligible Free (Ages 5-17)` FROM frpm WHERE `School Type` = 'Continuation Schools (Public)' ORDER BY `Percent (%) Eligible Free (Ages 5-17)` ASC LIMIT 3;	california_schools
SELECT T2.Zip FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Charter School (Y/N)` = 1 AND T1.`County Name` = 'Fresno County Office of Education'	california_schools
SELECT T2.MailingStreet FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T1.FRPM_Count_K_12 DESC LIMIT 1	california_schools
SELECT T2.Phone FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Charter School (Y/N)` = 1 AND T2.OpenDate > '2000-01-01'	california_schools
SELECT COUNT(*) FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath > 400 AND T2.Virtual = 'F'	california_schools
SELECT DISTINCT s.School FROM schools AS s JOIN satscores AS st ON s.CDSCode = st.cds WHERE st.NumTstTakr > 500 AND s.Magnet = 1	california_schools
SELECT T2.Phone FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrRead >= 1500 AND T1.AvgScrMath >= 1500 AND T1.AvgScrWrite >= 1500 ORDER BY T1.NumTstTakr DESC LIMIT 1	california_schools
SELECT T2.NumTstTakr FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.`FRPM Count (K-12)` IS NOT NULL ORDER BY T1.`FRPM Count (K-12)` DESC LIMIT 1	california_schools
SELECT COUNT(DISTINCT T2.CDSCode) FROM satscores AS T1 INNER JOIN frpm AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath > 560 AND T2.`Charter Funding Type` = 'Directly funded'	california_schools
SELECT T2.`FRPM Count (Ages 5-17)` FROM satscores AS T1 INNER JOIN frpm AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrRead DESC LIMIT 1;	california_schools
SELECT CDSCode FROM frpm WHERE Enrollment (K-12) + Enrollment (Ages 5-17) > 500	california_schools
SELECT MAX(T1.`Percent (%) Eligible Free (Ages 5-17)`) AS MaxEligibleFreeRate FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE CAST(T2.NumGE1500 AS REAL) / T2.NumTstTakr > 0.3	california_schools
SELECT T2.Phone FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.NumGE1500 / T1.NumTstTakr DESC LIMIT 3	california_schools
SELECT T1.CDSCode FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T1.`Enrollment (Ages 5-17)` DESC LIMIT 5	california_schools
SELECT      T3.District,      AVG(T2.AvgScrRead) AS AvgReadingScore FROM      frpm AS T1 JOIN      satscores AS T2 ON T1.CDSCode = T2.cds JOIN      schools AS T3 ON T1.CDSCode = T3.CDSCode WHERE      T3.StatusType = 'Active' GROUP BY      T3.District ORDER BY      AvgReadingScore DESC LIMIT 1;	california_schools
SELECT COUNT(*) FROM satscores WHERE NumTstTakr < 100;	california_schools
SELECT T2.AvgScrWrite, T1.CharterNum FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrWrite > 499 ORDER BY T2.AvgScrWrite DESC	california_schools
SELECT COUNT(*) FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.County = 'Fresno' AND T1.FundingType = 'Directly funded' AND T2.NumTstTakr <= 250	california_schools
SELECT T2.Phone FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrMath DESC LIMIT 1	california_schools
SELECT COUNT(*) FROM frpm WHERE `County Name` = 'Amador' AND `Low Grade` = '9' AND `High Grade` = '12'	california_schools
SELECT COUNT(*) FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.County = 'Los Angeles' AND T1.`Free Meal Count (K-12)` > 500 AND T1.`Free Meal Count (K-12)` < 700	california_schools
SELECT T2.School FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.County = 'Contra Costa' ORDER BY T1.NumTstTakr DESC LIMIT 1	california_schools
SELECT s.School, s.Street, s.StreetAbr, s.City, s.Zip, s.State FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE ABS(f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`) > 30	california_schools
SELECT T2.School FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.[Percent (%) Eligible Free (K-12)] > 0.1 AND T2.CDSCode IN (SELECT cds FROM satscores WHERE NumGE1500 >= 1)	california_schools
SELECT DISTINCT T1.School, T1.FundingType FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.County = 'Riverside' AND AVG(T2.AvgScrMath) > 400	california_schools
SELECT DISTINCT T2.School, T2.Street, T2.City, T2.State, T2.Zip FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.County Name = 'Monterey' AND T1.`FRPM Count (Ages 15-17)` > 800	california_schools
SELECT T2.School AS sname, T1.AvgScrWrite, T2.Phone FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.OpenDate > '1991-12-31' OR T2.ClosedDate < '2000-01-01';	california_schools
SELECT T1.School, T1.DOCType FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE ABS(T2.`Enrollment (K-12)` - T2.`Enrollment (Ages 5-17)`) > ( SELECT AVG(ABS(`Enrollment (K-12)` - `Enrollment (Ages 5-17)`)) FROM frpm )	california_schools
SELECT T2.OpenDate FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Educational Option Type` = 'K-12' ORDER BY T1.`Enrollment (K-12)` DESC LIMIT 1	california_schools
SELECT T2.City FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T1.`Enrollment (K-12)` ASC LIMIT 5	california_schools
SELECT `Percent (%) Eligible Free (K-12)` FROM frpm ORDER BY `Enrollment (K-12)` DESC LIMIT 10	california_schools
SELECT      CDSCode,      (FRPM Count (K-12)) / (Enrollment (K-12)) AS Rate FROM      frpm WHERE      `School Type` = 'High Schools (Public)' OR `School Type` = 'Elementary Schools (Public)' ORDER BY      `FRPM Count (K-12)` DESC LIMIT 5;	california_schools
SELECT T2.Website, T2.School FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Free Meal Count (Ages 5-17)` BETWEEN 1900 AND 2000	california_schools
SELECT (T1.`Free Meal Count (Ages 5-17)` / T1.`Enrollment (Ages 5-17)`) * 100 AS FreeRate FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.School = 'Kacey Gibson'	california_schools
{     "chain_of_thought_reasoning": "First, we identify the relevant tables: frpm and schools. Then, we filter for chartered schools by checking the Charter School (Y/N) column. Next, we sort the filtered list by enrollment in grades 1 through 12 in ascending order. After that, we select the top result and extract the administrator's email address from the joined table.",     "SQL": "SELECT T2.AdmEmail1 FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Charter School (Y/N)` = 1 ORDER BY T1.`Enrollment (K-12)` ASC	california_schools
SELECT T2.AdmFName1, T2.AdmLName1, T2.AdmFName2, T2.AdmLName2, T2.AdmFName3, T2.AdmLName3 FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumGE1500 > 0 ORDER BY T1.NumGE1500 DESC LIMIT 1	california_schools
SELECT T2.Street, T2.City, T2.State, T2.Zip FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T1.NumGE1500 / T1.NumTstTakr ASC LIMIT 1	california_schools
SELECT T1.website FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.County = 'Los Angeles' AND T2.enroll12 BETWEEN 2000 AND 3000;	california_schools
SELECT AVG(NumTstTakr) FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE STRFTIME('%Y', T2.OpenDate) = '1980'	california_schools
SELECT T2.Phone FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.District = 'Fresno Unified' ORDER BY T1.AvgScrRead ASC LIMIT 1	california_schools
SELECT s.School, r.Rank FROM ( SELECT f.School, s.AvgScrRead, RANK() OVER (PARTITION BY f.County ORDER BY s.AvgScrRead DESC) AS Rank FROM frpm f INNER JOIN satscores s ON f.CDSCode = s.cds WHERE f.Virtual = 'F' ) r WHERE r.Rank <= 5	california_schools
SELECT T2.EdOpsName FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrMath DESC LIMIT 1	california_schools
SELECT ... FROM satscores AS T1  INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode	california_schools
SELECT T2.AvgScrWrite, T1.City  FROM schools AS T1  JOIN satscores AS T2 ON T1.CDSCode = T2.cds  WHERE T2.AvgScrRead + T2.AvgScrMath + T2.AvgScrWrite >= 1500  ORDER BY T2.AvgScrRead + T2.AvgScrMath + T2.AvgScrWrite DESC  LIMIT 1;	california_schools
SELECT T1.School, AVG(T2.AvgScrWrite) AS AverageWritingScore FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.AdmFName1 = 'Ricci' AND T1.AdmLName1 = 'Ulrich' GROUP BY T1.School	california_schools
SELECT School FROM schools WHERE DOC = 31 AND DocType = 'State Special' ORDER BY `Enrollment (K-12)` DESC LIMIT 1	california_schools
SELECT CAST(COUNT(OpenDate) AS REAL) / 12 AS MonthlyAverage FROM schools WHERE strftime('%Y', OpenDate) = '1980' AND County = 'Alameda' AND DOC = 52	california_schools
SELECT CAST(SUM(CASE WHEN DOC = 54 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN DOC = 52 THEN 1 ELSE 0 END) AS Ratio FROM schools WHERE County = 'Orange';	california_schools
SELECT T.County, T.School, T.ClosedDate FROM ( SELECT T1.County, T1.School, T1.ClosedDate, COUNT(T1.CDSCode) AS ClosedCount FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.StatusType = 'Closed' GROUP BY T1.County, T1.School, T1.ClosedDate ) AS T ORDER BY T.ClosedCount DESC LIMIT 1	california_schools
SELECT T2.Street, T2.School FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrMath DESC LIMIT 1 OFFSET 6;	california_schools
SELECT T2.MailStreet, T2.School FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrRead ASC LIMIT 1	california_schools
SELECT COUNT(T2.CDSCode) FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.MailCity = 'Lakeport' AND (T1.AvgScrRead + T1.AvgScrMath + T1.AvgScrWrite) >= 1500;	california_schools
SELECT SUM(T2.NumTstTakr) FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.MailCity = 'Fresno'	california_schools
SELECT School, MailZip FROM schools WHERE AdmFName1 = 'Avetik' AND AdmLName1 = 'Atoian'	california_schools
SELECT CAST(COUNT(CASE WHEN County = 'Colusa' THEN 1 ELSE NULL END) AS REAL) / COUNT(CASE WHEN County = 'Humboldt' THEN 1 ELSE NULL END) AS Ratio FROM schools WHERE MailState = 'CA'	california_schools
SELECT COUNT(CDSCode) FROM schools WHERE City = 'San Joaquin' AND MailState = 'CA' AND StatusType = 'Active'	california_schools
SELECT T2.Phone, T2.Ext FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrWrite DESC LIMIT 332, 1	california_schools
SELECT Phone, Ext, School FROM schools WHERE Zip = '95203-3704'	california_schools
SELECT Website FROM schools WHERE (AdmFName1 = 'Mike' AND AdmLName1 = 'Larson') OR (AdmFName1 = 'Dante' AND AdmLName1 = 'Alvarez')	california_schools
SELECT Website FROM schools WHERE Virtual = 'P' AND Charter = 1	california_schools
SELECT COUNT(*) FROM schools WHERE City = 'Hickman' AND District = 'Elementary School District' AND Charter = 1	california_schools
SELECT COUNT(*) FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.County = 'Los Angeles' AND T2.Charter = 0 AND (T1.`Free Meal Count (K-12)` * 100 / T1.`Enrollment (K-12)`) < 0.18	california_schools
SELECT AdmFName1, AdmLName1, School, City FROM schools WHERE Charter = 1 AND CharterNum = '00D2';	california_schools
SELECT COUNT(*) FROM schools WHERE MailCity = 'Hickman' AND CharterNum = '00D4';	california_schools
SELECT (SUM(CASE WHEN T2.FundingType = 'Locally Funded' THEN 1 ELSE 0 END) / COUNT(T1.CDSCode)) * 100 AS Ratio FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.County = 'Santa Clara'	california_schools
SELECT COUNT(*) FROM schools WHERE OpenDate BETWEEN '2000-01-01' AND '2005-12-31' AND County = 'Stanislaus' AND FundingType = 'Directly Funded';	california_schools
SELECT COUNT(*) FROM schools WHERE City = 'San Francisco' AND strftime('%Y', ClosedDate) = '1989'	california_schools
SELECT County FROM schools WHERE ClosedDate BETWEEN '1980-01-01' AND '1989-12-31' AND SOC = 11 GROUP BY County ORDER BY COUNT(*) DESC LIMIT 1	california_schools
SELECT NCESDist FROM schools WHERE SOC = '31'	california_schools
SELECT COUNT(CDSCode) AS NumberOfSchools FROM schools WHERE (StatusType = 'Active' OR StatusType = 'Closed') AND County = 'Alpine';	california_schools
SELECT District FROM schools WHERE City = 'Fresno' AND Magnet = 0	california_schools
SELECT T1.`Enrollment (Ages 5-17)` FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.School = 'State Special School' AND T2.District = 'Fremont' AND T1.`Academic Year` = '2014-2015'	california_schools
SELECT T2.[Free Meal Count (Ages 5-17)] FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.School = 'Youth Authority' AND T1.MailStreet = 'PO Box 1040'	california_schools
SELECT MIN(GSoffered) AS Lowest_Grade FROM schools WHERE NCESDist = '0613360' AND EdOpsCode = 'SPECON';	california_schools
SELECT `School Name` FROM `frpm` WHERE `Educational Option Type` = 'Breakfast Provision 2' AND `County Code` = '37'	california_schools
SELECT City FROM schools WHERE EILCode = 'HS' AND Charter = 0 AND LowGrade = '9' AND HighGrade = '12' AND County = 'Merced'	california_schools
SELECT s.School, (f.[FRPM Count (Ages 5-17)] / f.[Enrollment (Ages 5-17)]) * 100 AS [Percent (%) Eligible FRPM (Ages 5-17)] FROM frpm f INNER JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.County = 'Los Angeles' AND f.[Low Grade] = 'K' AND f.[High Grade] = '9'	california_schools
SELECT GSserved FROM schools WHERE City = 'Adelanto' GROUP BY GSserved ORDER BY COUNT(*) DESC LIMIT 1	california_schools
SELECT County, COUNT(*) AS NumberOfSchools FROM schools WHERE Virtual = 0 AND County IN ('San Diego', 'Santa Barbara') GROUP BY County ORDER BY NumberOfSchools DESC LIMIT 1	california_schools
SELECT School, `School Type`, Latitude, Longitude FROM schools ORDER BY Latitude DESC LIMIT 1	california_schools
SELECT T2.School, T2.Lowest_Grade FROM ( SELECT MIN(Latitude) AS MinLat FROM schools WHERE State = 'CA' ) AS T1 INNER JOIN schools AS T2 ON T2.Latitude = T1.MinLat	california_schools
SELECT GSoffered FROM schools ORDER BY ABS(Longitude) DESC LIMIT 1	california_schools
SELECT COUNT(DISTINCT T1.City), T1.City FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.Magnet = 1 AND T1.GSoffered = 'K-8' AND T2.`NSLP Provision Status` = 'Multiple Provision Types' GROUP BY T1.City	california_schools
SELECT AdmFName1, District, COUNT(AdmFName1) AS Count FROM schools GROUP BY District, AdmFName1 ORDER BY Count DESC LIMIT 2;	california_schools
SELECT (T1.`Free Meal Count (K-12)` / T1.`Enrollment (K-12)` * 100) AS 'Percent (%) Eligible Free (K-12)', T2.`District Code` FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`AdmFName1` = 'Alusine'	california_schools
SELECT AdmLName1, District, County, School FROM schools WHERE CharterNum = 40	california_schools
SELECT AdmEmail1, AdmEmail2, AdmEmail3 FROM schools WHERE City = 'San Bernardino' AND District = 'City of San Bernardino City Unified' AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND (SOC = 62 OR DOC = 54)	california_schools
SELECT T2.AdmEmail1, T2.School FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrRead >= 1500 ORDER BY T1.NumTstTakr DESC LIMIT 1	california_schools
SELECT COUNT(DISTINCT T1.account_id)  FROM account AS T1  JOIN disp AS T2 ON T1.account_id = T2.account_id  JOIN client AS T3 ON T2.client_id = T3.client_id  JOIN district AS T4 ON T3.district_id = T4.district_id  WHERE T4.A3 = 'Střední Česká republika';	financial
SELECT COUNT(DISTINCT T1.account_id) AS eligible_accounts FROM account AS T1 JOIN client AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T2.district_id = T3.district_id LEFT JOIN loan AS T4 ON T1.account_id = T4.account_id AND T4.status != 'Z' WHERE T3.A3 = 'Prague';	financial
SELECT AVG(A12) AS avg_1995, AVG(A13) AS avg_1996 FROM district	financial
{     "chain_of_thought_reasoning": "To solve this problem, we need to follow these steps:\n1. Identify the table that contains information about districts and their average salaries. In this case, it's the 'district' table.\n2. Filter the districts based on the condition that the average salary (A11) is between 6000 and 10000.\n3. Count the number of districts that satisfy this condition.\n4. Since the 'district' table does not directly contain gender information, we need to join it with another table that has this information. However, there is no direct link between the 'district' table and other tables in the schema that provide gender information. Therefore, we cannot accurately determine the number of districts with female average salaries based solely on the provided schema.\nGiven the limitations of the schema, it's not possible to provide a valid SQL query to answer the question as stated.",     "SQL": "" }	financial
SELECT COUNT(client.client_id) AS male_customers_count FROM client JOIN district ON client.district_id = district.district_id WHERE client.gender = 'M' AND district.A3 = 'North Bohemia' AND district.A11 > 8000;	financial
SELECT MAX(avg_salary) - MIN(avg_salary) AS salary_gap FROM ( SELECT AVG(T2.A11) AS avg_salary FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' GROUP BY T1.client_id )	financial
SELECT T3.account_id FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id GROUP BY T1.client_id ORDER BY AVG(T1.A11) DESC LIMIT 1	financial
SELECT COUNT(DISTINCT T2.client_id) FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id WHERE T1.frequency = 'POPLATEK TYDNE' AND T2.type = 'OWNER'	financial
SELECT T3.client_id FROM trans AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T1.type = 'POPLATEK PO OBRATU'	financial
SELECT T2.account_id FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE STRFTIME('%Y', T1.date) = '1997' AND T2.frequency = 'POPLATEK TYDNE' ORDER BY T1.amount ASC LIMIT 1	financial
SELECT a.account_id, c.client_id, l.amount FROM account a JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id JOIN loan l ON a.account_id = l.account_id	financial
SELECT COUNT(client_id) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' AND T1.birth_date < '1950-01-01' AND T2.A2 = 'Sokolov'	financial
SELECT account_id FROM trans WHERE strftime('%Y', date) = '1995' ORDER BY date ASC LIMIT 1	financial
SELECT T1.account_id FROM account AS T1 WHERE T1.date < '1997-01-01' INTERSECT SELECT T2.account_id FROM trans AS T2 WHERE T2.amount > 3000	financial
SELECT client_id FROM card WHERE issued = '1994-03-03'	financial
SELECT T2.date FROM trans AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.amount = 840 AND T1.date = '1998-10-14'	financial
SELECT T2.district_id FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.date = '1994-08-25';	financial
SELECT MAX(T3.amount) FROM card AS T1 INNER JOIN disp AS T2 ON T1.card_id = T2.card_id INNER JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T1.issued = '1996-10-21'	financial
SELECT T1.gender FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN account AS T3 ON T2.account_id = T3.account_id WHERE T3.district_id = ( SELECT district_id FROM district ORDER BY A11 DESC LIMIT 1 ) ORDER BY T1.birth_date ASC LIMIT 1	financial
SELECT client_id  FROM loan  ORDER BY amount DESC  LIMIT 1;	financial
SELECT COUNT(client_id) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Jesenik' AND T1.gender = 'F'	financial
SELECT T2.disp_id FROM trans AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.amount = 5100 AND T1.date = '1998-09-02'	financial
SELECT COUNT(DISTINCT T2.account_id) FROM district AS T1 INNER JOIN disp AS T2 ON T1.district_id = T2.district_id WHERE T1.A2 = 'Litomerice' AND STRFTIME('%Y', T2.issued) = '1996'	financial
{     "chain_of_thought_reasoning": "We start by identifying the relevant tables: client, disp, and account. We then determine the join conditions based on the foreign key relationships between these tables. Next, we filter the data to only include female clients born in 1976/1/29. Finally, we construct the SQL query by selecting the district name from the district table and joining the other tables accordingly.",     "SQL": "SELECT T3.A2 FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id WHERE T1.gender = 'F' AND T1.birth_date = '1976-0	financial
SELECT T4.birth_date FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN disp AS T3 ON T2.account_id = T3.account_id INNER JOIN client AS T4 ON T3.client_id = T4.client_id WHERE T1.amount = 98832 AND strftime('%Y-%m', T1.date) = '1996-01'	financial
SELECT T2.account_id FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T1.A3 = 'Prague' ORDER BY T2.birth_date ASC LIMIT 1	financial
SELECT CAST(SUM(CASE WHEN T2.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.client_id) FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T1.A3 LIKE '%South Bohemia%' ORDER BY T1.A4 DESC LIMIT 1	financial
SELECT ((T1.balance - T2.balance) / T2.balance) * 100 AS increase_rate FROM trans AS T1 JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T1.date = '1998-12-27' AND T2.date = '1993-03-22' AND T1.client_id IN (SELECT client_id FROM disp WHERE account_id IN (SELECT account_id FROM loan WHERE date = '1993-07-05'))	financial
SELECT SUM(amount) AS total_amount FROM loan	financial
SELECT      CAST(SUM(CASE WHEN T1.amount < 100000 AND T1.status = 'C' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.account_id) AS percentage_running_accounts FROM      loan AS T1 JOIN      account AS T2 ON T1.account_id = T2.account_id;	financial
SELECT T1.account_id, T5.A2, T5.A3 FROM account AS T1  INNER JOIN trans AS T2 ON T1.account_id = T2.account_id  INNER JOIN card AS T3 ON T1.account_id = T3.account_id  INNER	financial
SELECT T1.account_id, T1.frequency FROM account AS T1 JOIN disp AS T2 ON T1.account_id = T2.account_id JOIN client AS T3 ON T2.client_id = T3.client_id JOIN district AS T4 ON T3.district_id = T4.district_id WHERE T4.A2 LIKE '%east%' AND T1.date BETWEEN '1995-01-01' AND '2000-12-31'	financial
SELECT a.account_id, a.date FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Prachatice';	financial
SELECT T1.A2 AS district, T1.A3 AS region FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id INNER JOIN loan AS T3 ON T2.account_id = T3.account_id WHERE T3.loan_id = '4990'	financial
SELECT T1.account_id, T3.A2, T3.A3 FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.amount > 300000	financial
SELECT T4.loan_id, T6.A3, AVG(T6.A11) AS avg_salary FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN disp AS T3 ON T2.account_id = T3.account_id INNER JOIN client AS T4 ON T3.client_id = T4.client_id INNER JOIN district AS T6 ON T4.district_id = T6.district_id WHERE T1.duration = 60 GROUP BY T4.district_id	financial
{Unemployment Increment Rate}	financial
SELECT CAST(SUM(CASE WHEN T2.A2 = 'Decin' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM disp AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE STRFTIME('%Y', T1.account.date) = '1993'	financial
SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE'	financial
SELECT T2.A2, COUNT(T1.client_id) AS female_count FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' GROUP BY T1.district_id ORDER BY female_count DESC LIMIT 9	financial
SELECT T2.A2 AS district_name, SUM(T1.amount) AS total_withdrawals FROM trans AS T1 INNER JOIN district AS T2 ON T1.account_id = T2.district_id WHERE T1.type = 'VYDAJ' AND T1.date LIKE '1996-01%' GROUP BY T2.A2 ORDER BY total_withdrawals DESC LIMIT 10	financial
SELECT COUNT(DISTINCT T1.client_id) - SUM(CASE WHEN T2.card_id IS NOT NULL THEN 1 ELSE 0 END) AS count FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T3.A3 = 'South Bohemia'	financial
SELECT T3.A3 AS district_name, SUM(T1.amount) AS total_active_loan FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.status = 'C' GROUP BY T3.A3 ORDER BY total_active_loan DESC LIMIT 1	financial
SELECT AVG(T1.amount) FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T3.gender = 'M'	financial
SELECT A2 FROM district ORDER BY A13 DESC LIMIT 1	financial
SELECT COUNT(*) FROM account WHERE district_id = ( SELECT district_id FROM district ORDER BY A16 DESC LIMIT 1 )	financial
SELECT COUNT(DISTINCT T1.account_id) FROM trans AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id WHERE T1.operation = 'VYBER KARTOU' AND T3.frequency = 'POPLATEK MESICNE' AND T1.balance < 0	financial
SELECT COUNT(DISTINCT l.loan_id) FROM loan l JOIN account a ON l.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id WHERE l.date BETWEEN '1995-01-01' AND '1997-12-31' AND a.frequency = 'POPLATEK MESICNE' AND l.amount >= 250000	financial
SELECT COUNT(DISTINCT account_id) FROM loan WHERE status IN ('C', 'D') AND account_id IN ( SELECT account_id FROM disp WHERE disp_id IN ( SELECT disp_id FROM card WHERE district_id = 1 ) )	financial
SELECT COUNT(DISTINCT T3.client_id) AS male_clients FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T1.date LIKE '1995%' AND T3.gender = 'M'	financial
SELECT COUNT(T1.card_id) FROM card AS T1 INNER JOIN disp AS T2 ON T1.card_id = T2.card_id WHERE T1.type = 'gold' AND T2.type = 'OWNER'	financial
SELECT COUNT(district_id) FROM district WHERE A2 = 'Pisek'	financial
SELECT T2.district_id FROM trans AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE STRFTIME('%Y', T1.date) = '1997' AND T1.amount > 10000 GROUP BY T2.district_id HAVING SUM(T1.amount) > 10000	financial
SELECT DISTINCT o.account_id FROM order o JOIN account a ON o.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE o.k_symbol = 'SIPO' AND d.A3 = 'Pisek'	financial
SELECT DISTINCT T1.account_id FROM account AS T1 JOIN disp AS T2 ON T1.account_id = T2.account_id JOIN card AS T3 ON T2.disp_id = T3.disp_id WHERE T3.type = 'gold'	financial
SELECT AVG(amount) FROM trans WHERE date LIKE '2021%' AND type = 'VYBER KARTOU'	financial
SELECT DISTINCT account_id FROM trans WHERE date LIKE '1998%' AND operation = 'VYBER KARTOU' AND amount < ( SELECT AVG(amount) FROM trans WHERE date LIKE '1998%' AND operation = 'VYBER KARTOU' )	financial
SELECT client_id FROM client WHERE gender = 'F';	financial
SELECT COUNT(DISTINCT T1.account_id) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T1.gender = 'F' AND T3.A3 = 'south Bohemia'	financial
SELECT DISTINCT T1.account_id FROM disp AS T1 JOIN client AS T2 ON T1.client_id = T2.client_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T3.A2 = 'Tabor' AND T1.type = 'OWNER'	financial
SELECT DISTINCT T1.type FROM card AS T1 JOIN disp AS T2 ON T1.card_id = T2.card_id JOIN account AS T3 ON T2.account_id = T3.account_id JOIN client AS T4 ON T2.client_id = T4.client_id WHERE T2.type != 'OWNER' AND T4.district_id IN (SELECT district_id FROM district WHERE A11 BETWEEN 8000 AND 9000)	financial
SELECT COUNT(DISTINCT T1.account_id) FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id JOIN trans AS T3 ON T1.account_id = T3.account_id WHERE T2.A3 = 'North Bohemia' AND T3.bank = 'AB';	financial
SELECT DISTINCT T3.A2 FROM trans AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.type = 'VYDAJ'	financial
SELECT AVG(T1.A15) FROM district AS T1 WHERE T1.A15 > 4000 AND T1.district_id IN (SELECT DISTINCT T3.district_id FROM account AS T2 INNER JOIN disp AS T3 ON T2.account_id = T3.account_id WHERE T2.date >= '1997-01-01')	financial
SELECT COUNT(T1.card_id) FROM card AS T1 INNER JOIN disp AS T2 ON T1.card_id = T2.card_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id WHERE T1.type = 'classic' AND T2.type = 'OWNER'	financial
SELECT COUNT(T1.client_id) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'M' AND T2.A2 = 'Hl.m. Praha'	financial
SELECT CAST(COUNT(CASE WHEN issued < '1998-01-01' THEN card_id ELSE NULL END) AS REAL) * 100 / COUNT(card_id) FROM card WHERE type = 'gold'	financial
SELECT account_id FROM loan ORDER BY amount DESC LIMIT 1	financial
SELECT T1.A15 FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T2.account_id = 532	financial
SELECT T1.district_id FROM account AS T1 JOIN order AS T2 ON T1.account_id = T2.account_id WHERE T2.order_id = 33333	financial
SELECT T3.amount FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T1.client_id = 3356 AND T3.operation = 'VYBER'	financial
SELECT COUNT(DISTINCT T1.account_id) FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T1.frequency = 'POPLATEK TYDNE' AND T2.amount < 200000	financial
SELECT T2.type FROM disp AS T1 INNER JOIN card AS T2 ON T1.account_id = T2.account_id WHERE T1.client_id = 13539	financial
SELECT T2.A3 FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.client_id = 3541	financial
SELECT T1.A2 FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id INNER JOIN loan AS T3 ON T2.account_id = T3.account_id WHERE T3.status = 'A' GROUP BY T1.A2 ORDER BY COUNT(T2.account_id) DESC LIMIT 1	financial
SELECT T3.client_id FROM order AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T1.order_id = 32423	financial
SELECT T2.*  FROM district AS T1  INNER JOIN account AS T2 ON T1.district_id = T2.district_id  INNER JOIN trans AS T3 ON T2.account_id = T3.account_id  WHERE T1.district_id = 5;	financial
SELECT COUNT(*) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Jesenik'	financial
SELECT client_id FROM card WHERE type = 'junior' AND issued > '1997-01-01'	financial
SELECT district_id FROM district WHERE A11 > 10000;	financial
SELECT ((SUM(CASE WHEN strftime('%Y', T4.date) = '1997' THEN T4.amount ELSE 0 END) - SUM(CASE WHEN strftime('%Y', T4.date) = '1996' THEN T4.amount ELSE 0 END)) / SUM(CASE WHEN strftime('%Y', T4.date) = '1996' THEN T4.amount ELSE 0 END)) * 100 AS growth_rate FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id INNER JOIN loan AS T4 ON T3.account_id = T4.account_id WHERE T1.gender = 'M'	financial
SELECT COUNT(*) FROM trans WHERE Operation = 'VYBER KARTOU' AND date > '1995-12-31'	financial
SELECT (SUM(CASE WHEN strftime('%Y', T1.A15) = '1996' AND T1.A3 = 'North Bohemia' THEN T1.A16 ELSE 0 END) - SUM(CASE WHEN strftime('%Y', T1.A15) = '1996' AND T1.A3 = 'East Bohemia' THEN T1.A16 ELSE 0 END)) AS crime_difference FROM district AS T1	financial
SELECT type, COUNT(*) FROM disp WHERE account_id BETWEEN 1 AND 10 GROUP BY type	financial
SELECT k_symbol, COUNT(*) AS frequency, SUM(amount) AS total_amount FROM trans WHERE account_id = 3 GROUP BY k_symbol	financial
SELECT strftime('%Y', T3.birth_date) FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T1.account_id = 130	financial
SELECT COUNT(DISTINCT T1.account_id) FROM disp AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.type = 'OWNER' AND T2.frequency = 'POPLATEK PO OBRATU'	financial
SELECT SUM(T4.amount) AS total_debt, T4.status AS payment_status FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id INNER JOIN loan AS T4 ON T3.account_id = T4.account_id WHERE T1.client_id = 992;	financial
-- Step 1: Find the balance before transaction 851 WITH BalanceBefore AS (     SELECT balance     FROM trans     WHERE account_id = 851 AND trans_id < 851 ),  -- Step 2: Calculate the balance after transaction 851 BalanceAfter AS (     SELECT t.balance + t.amount AS new_balance     FROM trans t     JOIN BalanceBefore b ON t.account_id = 851 AND t.trans_id = 851 )  -- Step 3: Find the owner of the account SELECT c.gender FROM disp d JOIN client c ON d.client_id = c.client_id WHERE d.account_id = 851	financial
SELECT type FROM card WHERE client_id = 9;	financial
SELECT SUM(T1.amount) FROM trans AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T3.client_id = 617 AND STRFTIME('%Y', T1.date) = '1998'	financial
SELECT T1.client_id FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE STRFTIME('%Y', T1.birth_date) BETWEEN '1983' AND '1987' AND T2.A2 LIKE '%East Bohemia%'	financial
SELECT T1.client_id FROM client AS T1 JOIN loan AS T2 ON T1.client_id = T2.client_id WHERE T1.gender = 'F' ORDER BY T2.amount DESC LIMIT 3	financial
SELECT COUNT(DISTINCT T1.client_id) FROM client AS T1 INNER JOIN trans AS T2 ON T1.client_id = T2.client_id WHERE T1.gender = 'M' AND T1.birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND T2.type = 'PRIJEM' AND T2.k_symbol = 'SIPO'	financial
SELECT COUNT(T1.account_id) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Beroun' AND T1.date > '1996-12-31'	financial
SELECT COUNT(T1.client_id) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN card AS T3 ON T2.disp_id = T3.disp_id WHERE T1.gender = 'F' AND T3.type = 'junior'	financial
SELECT CAST(SUM(CASE WHEN T2.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.client_id) FROM account AS T1 INNER JOIN client AS T2 ON T1.client_id = T2.client_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T3.A3 = 'Prague'	financial
SELECT CAST(SUM(CASE WHEN T1.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM client AS T1 INNER JOIN account AS T2 ON T1.client_id = T2.client_id WHERE T2.frequency = 'POPLATEK TYDNE'	financial
SELECT COUNT(DISTINCT T1.client_id) AS owner_clients_with_weekly_statement FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id WHERE T3.frequency = 'POPLATEK TYDNE' AND T2.type = 'OWNER';	financial
SELECT T1.account_id FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.duration > 24 AND T1.date < '1997-01-01' ORDER BY T2.amount ASC LIMIT 1	financial
{     "chain_of_thought_reasoning": "To answer this question, we need to identify the accounts associated with female clients who are the oldest and have the lowest average salary. Here's a step-by-step approach to derive the SQL query:",          "Step 1": "Identify the relevant tables: We need to access the `client`, `disp`, and `account` tables to get the required information. The `client` table contains client details, including gender and birth date. The `disp` table links clients to their accounts, and the `account` table contains account details.",          "Step 2": "Filter female clients: We need to filter the clients based on the gender 'F'. This can be done using a WHERE clause in the SQL query.",          "Step 3": "Sort by age and average salary: To find the oldest clients, we need to sort the clients by their birth date in ascending order. Additionally, we need to calculate the average salary for each district and then sort the districts by average salary in ascending order.",          "Step 4": "Select the top result: Since we are interested in the oldest client with the lowest average salary, we will use the LIMIT clause to select only the top result from the sorted list.",          "Step 5": "Join the tables: We need to join the `client`, `disp`, and `account` tables based on their respective IDs to link clients to their accounts.",          "Step 6": "Calculate the average salary: We need to calculate the average salary for each district. However, since the average salary is stored in the `district` table, we need to join the `client` table with the `district` table based on the `district_id` to access this information.",          "Final Query": "By combining these steps, we can derive the following SQL query"          "SQL": "SELECT T3.account_id FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id INNER JOIN district AS T4 ON T1.district_id = T4.district_id WHERE T1.gender = 'F' ORDER BY T1.birth_date ASC, T4.A11 ASC LIMIT 1" }	financial
SELECT COUNT(T1.client_id) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE strftime('%Y', T1.birth_date) = '1920' AND T2.A3 = 'east Bohemia'	financial
SELECT COUNT(account_id) AS loan_count FROM account JOIN loan ON account.account_id = loan.account_id WHERE account.frequency = 'POPLATEK TYDNE' AND loan.duration = 24;	financial
SELECT AVG(T1.amount) AS average_loan_amount FROM loan AS T1 INNER JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T2.type = 'POPLATEK PO OBRATU'	financial
SELECT DISTINCT T1.client_id, T1.district_id FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id WHERE T2.type = 'OWNER' AND NOT EXISTS (SELECT 1 FROM disp AS T3 JOIN account AS T4 ON T3.account_id = T4.account_id WHERE T3.client_id = T1.client_id AND T3.type != 'OWNER')	financial
SELECT T1.client_id, julianday('now') - julianday(T1.birth_date) AS age FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN card AS T3 ON T2.disp_id = T3.disp_id INNER JOIN loan AS T4 ON T2.account_id = T4.account_id WHERE T3.type = 'gold' AND T2.type = 'OWNER';	financial
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY COUNT(*) DESC LIMIT 1	toxicology
SELECT COUNT(*)  FROM atom AS T1  JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id  WHERE T2.label = '-' AND T1.element = 'cl';	toxicology
SELECT AVG(CASE WHEN T1.element = 'o' THEN 1 ELSE 0 END) AS avg_oxygen_atoms FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-'	toxicology
SELECT AVG(COUNT(T2.bond_id)) AS avg_single_bonds FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'	toxicology
SELECT COUNT(T2.molecule_id) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'na' AND T2.label = '-'	toxicology
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '#'	toxicology
SELECT CAST(COUNT(CASE WHEN T1.element = 'c' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.atom_id) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN connected AS T3 ON T1.atom_id = T3.atom_id INNER JOIN bond AS T4 ON T3.bond_id = T4.bond_id WHERE T4.bond_type = '='	toxicology
SELECT COUNT(bond_id) FROM bond WHERE bond_type = '#'	toxicology
SELECT COUNT(*) FROM atom WHERE element != 'br'	toxicology
SELECT COUNT(molecule_id) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR099' AND label = '+'	toxicology
SELECT DISTINCT molecule_id FROM atom WHERE element = 'c'	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR004_8_9'	toxicology
SELECT DISTINCT T2.element FROM bond AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id AND T1.bond_id = T2.atom_id WHERE T1.bond_type = '='	toxicology
SELECT T2.label FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'h' GROUP BY T2.label ORDER BY COUNT(T2.label) DESC LIMIT 1;	toxicology
SELECT DISTINCT T2.bond_type FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'cl'	toxicology
SELECT T2.element FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T1.bond_id = T3.bond_id WHERE T3.bond_type = '-'	toxicology
SELECT DISTINCT T1.atom_id FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN connected AS T3 ON T1.atom_id = T3.atom_id WHERE T2.label = '-'	toxicology
SELECT T2.element FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-' GROUP BY T2.element ORDER BY COUNT(T2.element) ASC LIMIT 1	toxicology
SELECT T2.bond_type FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE (T1.atom_id = 'TR004_8' AND T1.atom_id2 = 'TR004_20') OR (T1.atom_id = 'TR004_20' AND T1.atom_id2 = 'TR004_8')	toxicology
SELECT label FROM molecule WHERE molecule_id NOT IN (SELECT molecule_id FROM atom WHERE element = 'sn')	toxicology
SELECT COUNT(DISTINCT T1.atom_id) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE (T1.element = 'i' OR T1.element = 's') AND T3.bond_type = '-';	toxicology
SELECT T2.atom_id FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T1.bond_type = '#'	toxicology
SELECT DISTINCT T1.atom_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.molecule_id = 'TR181'	toxicology
SELECT CAST((COUNT(DISTINCT atom_id) - SUM(CASE WHEN T1.element = 'f' THEN 1 ELSE 0 END)) AS REAL) * 100 / COUNT(DISTINCT atom_id) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'	toxicology
SELECT AVG(CAST(SUM(CASE WHEN T2.bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_id)) AS percent FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+';	toxicology
SELECT DISTINCT element  FROM atom  WHERE molecule_id = 'TR000'  ORDER BY element ASC  LIMIT 3;	toxicology
SELECT T2.element AS atom1, T3.element AS atom2 FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id INNER JOIN atom AS T3 ON T1.atom_id2 = T3.atom_id WHERE T1.molecule_id = 'TR001' AND T1.bond_id = 'TR001_2_6'	toxicology
SELECT      SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) -      SUM(CASE WHEN label = '-' THEN 1 ELSE 0 END) AS difference FROM molecule;	toxicology
SELECT atom_id, atom_id2 FROM connected WHERE bond_id = 'TR000_2_5'	toxicology
SELECT bond_id FROM connected WHERE atom_id2 = 'TR000_2'	toxicology
SELECT T2.label FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = ' = ' GROUP BY T1.molecule_id ORDER BY T2.label ASC LIMIT 5	toxicology
SELECT CAST(SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) AS percent FROM bond WHERE molecule_id = 'TR008'	toxicology
SELECT CAST(SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(molecule_id) AS percent FROM molecule	toxicology
SELECT CAST(COUNT(CASE WHEN element = 'h' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(*) FROM atom WHERE molecule_id = 'TR206'	toxicology
SELECT T1.bond_type FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T1.molecule_id = 'TR000'	toxicology
SELECT T1.label, T2.element FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR006'	toxicology
SELECT      T1.bond_type,     ( SELECT label FROM molecule WHERE molecule_id = 'TR010' ) AS is_carcinogenic FROM      bond AS T1 WHERE      T1.molecule_id = 'TR010' GROUP BY      T1.bond_type ORDER BY      COUNT(T1.bond_type) DESC LIMIT 1;	toxicology
SELECT DISTINCT T3.molecule_id FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id WHERE T1.bond_type = '-' AND T3.label != '+' ORDER BY T3.molecule_id ASC LIMIT 3;	toxicology
SELECT bond_type FROM bond WHERE molecule_id = 'TR006' ORDER BY bond_type ASC LIMIT 2	toxicology
SELECT COUNT(*) FROM connected WHERE (atom_id = 'TR000_12' OR atom_id2 = 'TR000_12')	toxicology
SELECT COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.element = 'br';	toxicology
SELECT T1.bond_type, T2.atom_id, T2.atom_id2 FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T1.bond_id = 'TR001_6_9'	toxicology
SELECT T2.label FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR001_10'	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '#';	toxicology
SELECT COUNT(*) FROM connected WHERE atom_id LIKE 'TR%_19' OR atom_id2 LIKE 'TR%_19'	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.molecule_id = 'TR004'	toxicology
SELECT COUNT(molecule_id) FROM molecule WHERE label = '-'	toxicology
SELECT DISTINCT T3.label FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN molecule AS T3 ON T3.molecule_id = T1.molecule_id WHERE T1.element LIKE 'C%21%' OR T1.element LIKE 'C%22%' OR T1.element LIKE 'C%23%' OR T1.element LIKE 'C%24%' OR T1.element LIKE 'C%25%'	toxicology
SELECT DISTINCT T2.bond_id FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element IN ('p', 'n')	toxicology
SELECT m.molecule_id, m.label FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '=' GROUP BY m.molecule_id ORDER BY COUNT(b.bond_id) DESC LIMIT 1	toxicology
SELECT AVG(COUNT(T2.bond_id)) FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'iodine'	toxicology
SELECT      CASE          WHEN T2.bond_type = '-' THEN 'single bond'          WHEN T2.bond_type = '=' THEN 'double bond'          WHEN T2.bond_type = '#' THEN 'triple bond'      END AS bond_type,     T1.bond_id FROM      connected AS T1 INNER JOIN      bond AS T2 ON T1.bond_id = T2.bond_id WHERE      CAST(SUBSTR(T1.atom_id, 7, 2) AS int) = 45;	toxicology
SELECT element FROM atom WHERE atom_id NOT IN ( SELECT atom_id FROM connected )	toxicology
SELECT T4.element FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN connected AS T3 ON T2.bond_id = T3.bond_id INNER JOIN atom AS T4 ON T3.atom_id = T4.atom_id WHERE T1.label = 'TR041' AND T2.bond_type = '#'	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR144_8_19'	toxicology
SELECT T1.label FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.bond_type = '=' GROUP BY T1.molecule_id ORDER BY COUNT(T2.bond_id) DESC LIMIT 1	toxicology
SELECT T.element FROM ( SELECT A.element, COUNT(A.element) AS count FROM atom AS A JOIN molecule AS M ON A.molecule_id = M.molecule_id WHERE M.label = '+' GROUP BY A.element ) AS T ORDER BY T.count ASC LIMIT 1	toxicology
SELECT DISTINCT T3.element FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id INNER JOIN atom AS T3 ON T1.atom_id2 = T3.atom_id WHERE T2.element = 'pb' AND T3.element != 'pb'	toxicology
SELECT T3.element AS element1, T4.element AS element2 FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id INNER JOIN atom AS T3 ON T1.atom_id = T3.atom_id INNER JOIN atom AS T4 ON T1.atom_id2 = T4.atom_id WHERE T2.bond_type = '#'	toxicology
SELECT CAST(COUNT(CASE WHEN T3.element = ( SELECT element FROM atom WHERE molecule_id = T1.molecule_id GROUP BY element ORDER BY COUNT(element) DESC LIMIT 1 ) THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.bond_id) FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id INNER JOIN atom AS T3 ON T2.atom_id = T3.atom_id	toxicology
SELECT CAST(SUM(CASE WHEN T1.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_id) FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-'	toxicology
SELECT COUNT(*) FROM atom WHERE element IN ('c', 'h')	toxicology
SELECT T2.atom_id2 FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 's'	toxicology
SELECT T3.bond_type FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'sn'	toxicology
SELECT COUNT(DISTINCT T1.atom_id) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-'	toxicology
SELECT COUNT(DISTINCT atom_id) FROM atom WHERE molecule_id IN ( SELECT molecule_id FROM bond WHERE bond_type = '#' ) AND element IN ('p', 'br')	toxicology
SELECT T2.bond_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+';	toxicology
SELECT T2.molecule_id FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '-' AND T2.label = '-'	toxicology
SELECT      CAST(SUM(CASE WHEN T1.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) AS percent FROM      atom AS T1 INNER JOIN      connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN      bond AS T3 ON T2.bond_id = T3.bond_id WHERE      T3.bond_type = '-';	toxicology
SELECT label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002')	toxicology
SELECT molecule_id FROM molecule WHERE label = '-'	toxicology
SELECT COUNT(molecule_id) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR030' AND label = '+'	toxicology
SELECT bond_type FROM bond WHERE molecule_id BETWEEN 'TR000' AND 'TR050'	toxicology
SELECT T2.element AS element1, T3.element AS element2 FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id INNER JOIN atom AS T3 ON T1.atom_id2 = T3.atom_id WHERE T1.bond_id = 'TR001_10_11'	toxicology
SELECT COUNT(DISTINCT T3.bond_id) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'i'	toxicology
SELECT T2.label, COUNT(T2.label) AS count FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'ca' GROUP BY T2.label ORDER BY count DESC LIMIT 1;	toxicology
SELECT CASE WHEN EXISTS (SELECT 1 FROM atom WHERE atom_id IN (SELECT atom_id FROM connected WHERE bond_id = 'TR001_1_8') AND element = 'cl') AND EXISTS (SELECT 1 FROM atom WHERE atom_id IN (SELECT atom_id FROM connected WHERE bond_id = 'TR001_1_8') AND element = 'c') THEN 'Yes' ELSE 'No' END AS result;	toxicology
SELECT DISTINCT T1.molecule_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id JOIN atom AS T3 ON T1.molecule_id = T3.molecule_id JOIN connected AS T4 ON T3.atom_id = T4.atom_id AND T3.molecule_id = T4.molecule_id WHERE T1.label = '-' AND T3.element = 'c' AND T2.bond_type = '#' GROUP BY T1.molecule_id HAVING COUNT(T2.bond_type) = 1;	toxicology
SELECT CAST(SUM(CASE WHEN T1.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR001'	toxicology
SELECT molecule_id FROM bond WHERE bond_type = ' = '	toxicology
SELECT T1.atom_id, T1.atom_id2 FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '#'	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR000_1_2'	toxicology
SELECT COUNT(*) FROM molecule AS m JOIN bond AS b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '-' AND m.label = '-'	toxicology
SELECT T3.label FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id INNER JOIN atom AS T3 ON T2.atom_id = T3.atom_id OR T2.atom_id2 = T3.atom_id WHERE T1.bond_id = 'TR001_10_11';	toxicology
SELECT b.bond_id, m.label FROM bond AS b JOIN molecule AS m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '#' AND m.label = '+'	toxicology
SELECT COUNT(DISTINCT T1.element) AS num_toxic_elements FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE SUBSTR(T1.atom_id, 7, 1) = '4' AND T2.label = '+';	toxicology
SELECT CAST(COUNT(CASE WHEN T1.element = 'h' THEN 1 ELSE NULL END) AS REAL) / COUNT(T1.element), T2.label FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR006'	toxicology
SELECT m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'ca' LIMIT 1	toxicology
SELECT T2.bond_type FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'c'	toxicology
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_10_11'	toxicology
SELECT CAST(SUM(CASE WHEN T2.bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id	toxicology
SELECT CAST(SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) FROM bond WHERE molecule_id = 'TR047'	toxicology
SELECT CASE WHEN EXISTS (     SELECT 1     FROM atom a1     JOIN connected c ON a1.atom_id = c.atom_id     JOIN atom a2 ON c.atom_id2 = a2.atom_id     JOIN molecule m ON a2.molecule_id = m.molecule_id     WHERE a1.atom_id = 'TR001_1' AND m.label = '+' ) THEN 'Carcinogenic' ELSE 'Not Carcinogenic' END AS result;	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR151'	toxicology
SELECT CASE WHEN T.element = 'cl' THEN 'Chlorine' WHEN T.element = 'c' THEN 'Carbon' WHEN T.element = 'h' THEN 'Hydrogen' WHEN T.element = 'o' THEN 'Oxygen' WHEN T.element = 's' THEN 'Sulfur' WHEN T.element = 'n' THEN 'Nitrogen' WHEN T.element = 'p' THEN 'Phosphorus' WHEN T.element = 'na' THEN 'Sodium' WHEN T.element = 'br' THEN 'Bromine' WHEN T.element = 'f' THEN 'Fluorine' WHEN T.element = 'i' THEN 'Iodine' WHEN T.element = 'sn' THEN 'Tin' WHEN T.element = 'pb' THEN 'Lead' WHEN T.element = 'te' THEN 'Tellurium' WHEN T.element = 'ca' THEN 'Calcium' ELSE 'Unknown' END AS toxic_element FROM atom AS T WHERE T.molecule_id = 'TR151'	toxicology
SELECT COUNT(molecule_id) FROM molecule WHERE label = '+'	toxicology
SELECT DISTINCT T1.atom_id FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE SUBSTR(T2.molecule_id, 3, 3) BETWEEN '010' AND '050' AND T1.element = 'c'	toxicology
SELECT COUNT(DISTINCT T1.atom_id) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'	toxicology
SELECT T2.bond_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = ' + ' AND T2.bond_type = ' = '	toxicology
SELECT COUNT(*) FROM atom WHERE element = 'h' AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+')	toxicology
SELECT T2.molecule_id FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id INNER JOIN atom AS T3 ON T1.atom_id = T3.atom_id WHERE T1.atom_id = 'TR000_1' AND T2.bond_id = 'TR000_1_2'	toxicology
SELECT T1.atom_id FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'c' AND T2.label != '+'	toxicology
SELECT CAST(COUNT(CASE WHEN T1.element = 'h' AND T2.label = '+' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T2.label) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR124'	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = 'TR186'	toxicology
SELECT T2.bond_type FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T1.atom_id = 'TR007_4' AND T1.atom_id2 = 'TR007_19'	toxicology
SELECT DISTINCT T3.element  FROM bond AS T1  INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id  INNER JOIN atom AS T3 ON T2.atom_id = T3.atom_id  WHERE T1.bond_id = 'TR001_2_4';	toxicology
SELECT ( SELECT COUNT(*) FROM bond WHERE molecule_id = 'TR006' AND bond_type = ' = ' ) AS double_bonds, ( SELECT label FROM molecule WHERE molecule_id = 'TR006' ) AS carcinogenicity	toxicology
SELECT T1.label, T2.element FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.element = 'cl'	toxicology
SELECT T3.element FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id INNER JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T1.bond_type = '-'	toxicology
SELECT DISTINCT m.label AS molecule_label, a.element AS element FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#'	toxicology
SELECT T2.element FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T1.bond_id = 'TR000_2_3' UNION SELECT T3.element FROM connected AS T1 INNER JOIN atom AS T3 ON T1.atom_id2 = T3.atom_id WHERE T1.bond_id = 'TR000_2_3'	toxicology
SELECT COUNT(DISTINCT T1.bond_id) FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T2.element = 'cl'	toxicology
SELECT T4.atom_id, COUNT(DISTINCT T2.bond_type) AS bond_count FROM molecule AS T1 INNER JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id INNER JOIN atom AS T4 ON T2.atom_id = T4.atom_id WHERE T1.label = 'TR346'	toxicology
SELECT COUNT(T2.label) FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '=' AND T2.label = '+'	toxicology
SELECT COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id LEFT JOIN connected AS T3 ON T2.atom_id = T3.atom_id LEFT JOIN bond AS T4 ON T3.bond_id = T4.bond_id WHERE T2.element != 's' AND T4.bond_type != ' = '	toxicology
SELECT T2.label FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_id = 'TR001_2_4'	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR001';	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '-'	toxicology
SELECT DISTINCT m.molecule_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'cl' AND m.label = '+'	toxicology
SELECT DISTINCT m.molecule_id, m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c' AND m.label != '-'	toxicology
SELECT CAST(SUM(CASE WHEN T1.element = 'cl' AND T2.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T1.element = 'cl' THEN 1 ELSE 0 END) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN connected AS T3 ON T1.atom_id = T3.atom_id	toxicology
SELECT molecule_id FROM connected WHERE bond_id = 'TR001_1_7'	toxicology
SELECT COUNT(DISTINCT T2.element) FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T1.bond_id = 'TR001_3_4'	toxicology
SELECT T2.bond_type FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE (T1.atom_id = 'TR000_1' AND T1.atom_id2 = 'TR000_2') OR (T1.atom_id = 'TR000_2' AND T1.atom_id2 = 'TR000_1')	toxicology
SELECT m.molecule_id, m.label FROM molecule AS m JOIN connected AS c ON m.molecule_id = c.molecule_id WHERE c.atom_id IN ('TR000_2', 'TR000_4') GROUP BY m.molecule_id, m.label HAVING COUNT(DISTINCT c.atom_id) = 2	toxicology
SELECT element FROM atom WHERE atom_id = 'TR000_1'	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR000'	toxicology
SELECT CAST(SUM(CASE WHEN bond_type = '-' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) AS percentage FROM bond	toxicology
SELECT COUNT(DISTINCT T2.molecule_id) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'n' AND T2.label = '+'	toxicology
SELECT DISTINCT m.label FROM molecule AS m JOIN atom AS a ON m.molecule_id = a.molecule_id JOIN connected AS c ON a.atom_id = c.atom_id JOIN bond AS b ON c.bond_id = b.bond_id WHERE a.element = 's' AND b.bond_type = '='	toxicology
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id GROUP BY T1.molecule_id HAVING COUNT(T2.atom_id) > 5	toxicology
SELECT DISTINCT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id IN (SELECT bond_id FROM bond WHERE molecule_id = 'TR024' AND bond_type = '=')	toxicology
SELECT T1.label, COUNT(T2.atom_id) AS atom_count FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' GROUP BY T1.molecule_id ORDER BY atom_count DESC LIMIT 1	toxicology
SELECT CAST(SUM(CASE WHEN T1.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN connected AS T3 ON T2.atom_id = T3.atom_id INNER JOIN bond AS T4 ON T3.bond_id = T4.bond_id WHERE T2.element = 'h' AND T4.bond_type = '#'	toxicology
SELECT COUNT(molecule_id) FROM molecule WHERE label = '+';	toxicology
SELECT COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id BETWEEN 'TR004' AND 'TR010' AND T2.bond_type = '-'	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR008' AND element = 'c'	toxicology
SELECT T1.element  FROM atom AS T1  JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id  WHERE T1.atom_id = 'TR004_7' AND T2.label != '+';	toxicology
SELECT COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 INNER JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN atom AS T3 ON T2.atom_id = T3.atom_id INNER JOIN bond AS T4 ON T2.bond_id = T4.bond_id WHERE T3.element = 'o' AND T4.bond_type = ' = '	toxicology
SELECT COUNT(DISTINCT T3.molecule_id) FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id INNER JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T1.bond_type = '#' AND T3.element IN ('c', 'o')	toxicology
SELECT T1.element, T3.bond_type FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.molecule_id = 'TR002'	toxicology
SELECT T1.atom_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id JOIN molecule AS T4 ON T1.molecule_id = T4.molecule_id WHERE T4.label = 'TR012' AND T1.element = 'c' AND T3.bond_type = '='	toxicology
SELECT DISTINCT T1.atom_id FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'o' AND T2.label = '+'	toxicology
SELECT name FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL	card_games
SELECT * FROM cards WHERE borderColor = 'borderless' OR (cardKingdomFoilId IS NULL OR cardKingdomFoilId != cardKingdomId)	card_games
SELECT name FROM cards ORDER BY faceConvertedManaCost DESC LIMIT 1	card_games
SELECT name FROM cards WHERE edhrecRank < 100 AND frameVersion = '2015'	card_games
SELECT T1.name FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid JOIN sets AS T3 ON T1.setCode = T3.code WHERE T1.rarity = 'mythic' AND T2.status = 'Banned' AND T2.format = 'gladiator'	card_games
SELECT T1.name, T2.status FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.types = 'Artifact' AND T1.side IS NULL AND T2.format = 'vintage'	card_games
SELECT T1.id, T1.artist FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE (T1.power = '*' OR T1.power IS NULL) AND T2.format = 'commander' AND T2.status = 'Legal'	card_games
SELECT      r.id AS card_id,     r.text AS ruling_text FROM      rulings r JOIN      cards c ON r.uuid = c.uuid WHERE      c.artist = 'Stephen Daniel'     AND c.hasContentWarning = 1;	card_games
SELECT T2.text FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Sublime Epiphany' AND T1.number = '74s'	card_games
SELECT T1.name, T1.artist, T1.isPromo FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid GROUP BY T1.uuid ORDER BY COUNT(T2.id) DESC LIMIT 1	card_games
SELECT T2.language  FROM cards AS T1  INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid  WHERE T1.name = 'annul' AND T1.number = '29';	card_games
SELECT name FROM foreign_data WHERE language = 'Japanese';	card_games
SELECT CAST(COUNT(CASE WHEN language = 'Chinese Simplified' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(id) AS percentage FROM foreign_data	card_games
SELECT T2.name AS setName, SUM(T2.totalSetSize) AS totalCards FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.language = 'Italian' GROUP BY T2.name	card_games
SELECT COUNT(DISTINCT T1.type) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Aaron Boyd'	card_games
SELECT keywords FROM cards WHERE name = 'Angel of Mercy'	card_games
SELECT COUNT(*) FROM cards WHERE power = '*'	card_games
SELECT promoTypes FROM cards WHERE name = 'Duress'	card_games
SELECT borderColor FROM cards WHERE name = 'Ancestor\''s Chosen'	card_games
SELECT originalType FROM cards WHERE name = 'Ancestor\'s Chosen'	card_games
SELECT DISTINCT T2.language FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T1.name = 'Angel of Mercy'	card_games
SELECT COUNT(T1.id) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.status = 'restricted' AND T1.isTextless = 0	card_games
SELECT T2.text FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Condemn';	card_games
SELECT COUNT(*) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.status = 'restricted' AND T1.isStarter = 1	card_games
SELECT T2.status FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Cloudchaser Eagle'	card_games
SELECT type FROM cards WHERE name = 'Benalish Knight'	card_games
SELECT T2.format FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Benalish Knight'	card_games
SELECT T1.artist FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Phyrexian'	card_games
SELECT CAST(COUNT(CASE WHEN borderColor = 'borderless' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(*) FROM cards	card_games
SELECT COUNT(DISTINCT T1.id) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid INNER JOIN legalities AS T3 ON T1.uuid = T3.uuid WHERE T2.language = 'German' AND T1.isReprint = 1	card_games
SELECT COUNT(DISTINCT T1.uuid) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.borderColor = 'borderless' AND T2.language = 'Russian'	card_games
SELECT CAST(SUM(CASE WHEN T2.language = 'French' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.isStorySpotlight = 1	card_games
SELECT count(*) FROM cards WHERE toughness = '99'	card_games
SELECT name FROM cards WHERE artist = 'Aaron Boyd'	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND availability = 'mtgo'	card_games
SELECT id FROM cards WHERE convertedManaCost = 0	card_games
SELECT layout FROM cards WHERE keywords LIKE '%Flying%'	card_games
SELECT COUNT(*) FROM cards WHERE originalType = 'Summon - Angel' AND subtypes != 'Angel'	card_games
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT id FROM cards WHERE duelDeck = 'a'	card_games
SELECT edhrecRank FROM cards WHERE frameVersion = '2015'	card_games
SELECT T1.artist FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Chinese Simplified'	card_games
SELECT DISTINCT c.name FROM cards AS c JOIN foreign_data AS fd ON c.uuid = fd.uuid WHERE c.availability = 'paper' AND fd.language = 'Japanese'	card_games
SELECT COUNT(*) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.status = 'Banned' AND T1.borderColor = 'white'	card_games
SELECT T1.uuid, T3.language FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid INNER JOIN foreign_data AS T3 ON T1.uuid = T3.uuid WHERE T2.format = 'legacy'	card_games
SELECT r.text   FROM rulings r   JOIN cards c ON r.uuid = c.uuid	card_games
SELECT COUNT(*)  FROM cards AS T1  INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid  WHERE T1.frameVersion = 'future' AND T2.status = 'legal';	card_games
SELECT T2.name, T2.colors FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T1.code = 'OGW'	card_games
SELECT T1.name, T2.language FROM cards AS T1 INNER JOIN set_translations AS T2 ON T2.setCode = T1.setCode INNER JOIN sets AS T3 ON T3.code = T2.setCode WHERE T1.convertedManaCost = 5 AND T3.code = '10E'	card_games
SELECT T1.name, T2.date FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.originalType = 'Creature - Elf'	card_games
SELECT T1.colors, T2.format FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.id BETWEEN 1 AND 20	card_games
SELECT T1.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.originalType = 'Artifact' AND T1.colors = 'B' GROUP BY T1.id	card_games
SELECT T1.name FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'uncommon' ORDER BY T2.date ASC LIMIT 3	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'John Avon' AND cardKingdomFoilId IS NOT NULL	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'UDON' AND availability = 'mtgo' AND hand = -1	card_games
SELECT COUNT(id) FROM cards WHERE frameVersion = '1993' AND availability = 'paper' AND hasContentWarning = 1	card_games
SELECT manaCost FROM cards WHERE layout = 'normal' AND frameVersion = 2003 AND borderColor = 'black' AND availability LIKE '%paper%' AND availability LIKE '%mtgo%'	card_games
SELECT SUM(REPLACE(manaCost, '[^0-9]', '') * 1.0) AS Total_Unconverted_Mana_Cost FROM cards WHERE artist = 'Rob Alexander';	card_games
SELECT DISTINCT subtypes, supertypes FROM cards WHERE availability LIKE '%arena%'	card_games
SELECT DISTINCT T1.setCode FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Spanish';	card_games
SELECT CAST(SUM(CASE WHEN isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(id) FROM cards WHERE frameEffects = 'legendary'	card_games
WITH filtered_cards AS (     SELECT id     FROM cards     WHERE isStorySpotlight = 1 AND isTextless = 0 ), total_cards AS (     SELECT COUNT(*) AS total_count     FROM cards ) SELECT      CAST(COUNT(filtered_cards.id) AS REAL) * 100 / total_cards.total_count AS percentage,     filtered_cards.id FROM      filtered_cards, total_cards;	card_games
SELECT CAST(COUNT(CASE WHEN T2.language = 'Spanish' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.id) AS percentage, T1.name FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid	card_games
SELECT T2.language FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.baseSetSize = 309	card_games
SELECT COUNT(DISTINCT T1.code) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode INNER JOIN legalities AS T3 ON T1.uuid = T3.uuid WHERE T1.block = 'Commander' AND T2.language = 'Português (Brasil)' AND T3.format = 'commander'	card_games
SELECT DISTINCT T1.id FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.types = 'Creature' AND T2.status = 'Legal'	card_games
SELECT DISTINCT T2.name AS card_type FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'German' AND T1.subtypes IS NOT NULL AND T1.supertypes IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE (power IS NULL OR power = '*') AND text LIKE '%triggered ability%'	card_games
SELECT COUNT(*) FROM legalities AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid INNER JOIN cards AS T3 ON T1.uuid = T3.uuid WHERE T1.format = 'premodern' AND T2.text LIKE '%This is a triggered mana ability.%' AND T3.side IS NULL	card_games
SELECT c.id FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.artist = 'Erica Yang' AND c.availability LIKE '%paper%' AND l.format = 'pauper'	card_games
SELECT T1.artist FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.text = 'Das perfekte Gegenmittel zu einer dichten Formation'	card_games
SELECT T2.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Matthew D. Wilson' AND T1.borderColor = 'black' AND T1.layout = 'normal' AND T2.language = 'French'	card_games
SELECT COUNT(DISTINCT T1.id) FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'rare' AND T2.date = '2007-02-01'	card_games
SELECT DISTINCT T2.language FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.baseSetSize = 180;	card_games
SELECT CAST(SUM(CASE WHEN T1.hasContentWarning = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.format = 'commander' AND T2.status = 'Legal'	card_games
SELECT CAST(SUM(CASE WHEN T1.power IS NULL OR T1.power = '*' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.uuid) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'French'	card_games
SELECT CAST(SUM(CASE WHEN T1.type = 'expansion' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Japanese'	card_games
SELECT availability FROM cards WHERE artist = 'Daren Bader'	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'borderless' AND edhrecRank > 12000	card_games
SELECT COUNT(*) FROM cards WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1	card_games
SELECT * FROM cards WHERE power IS NULL OR power = '*' AND promoTypes LIKE '%arenaleague%' ORDER BY name ASC LIMIT 3	card_games
SELECT language FROM foreign_data WHERE multiverseid = 149934	card_games
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL ORDER BY cardKingdomFoilId ASC LIMIT 3	card_games
SELECT CAST(SUM(CASE WHEN isTextless = 1 AND layout != 'normal' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards	card_games
SELECT number FROM cards WHERE otherFaceIds IS NULL AND (subtypes LIKE '%Angel%' AND subtypes LIKE '%Wizard%') OR (subtypes LIKE '%Wizard%' AND subtypes LIKE '%Angel%')	card_games
SELECT name FROM sets WHERE mtgoCode IS NULL OR mtgoCode = '' ORDER BY name LIMIT 3	card_games
SELECT T2.language FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.mcmName = 'Archenemy' AND T1.code = 'ARC';	card_games
SELECT T1.name, T2.translation FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.id = 5	card_games
SELECT T1.language, T2.type FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.id = 206	card_games
SELECT DISTINCT s.id, s.name FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian' AND s.block = 'Shadowmoor' ORDER BY s.name LIMIT 2	card_games
SELECT s.id FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.isForeignOnly = 1 AND s.isFoilOnly = 1 AND st.language = 'Japanese' AND st.translation = 'Fourth Edition Foreign Black Border'	card_games
SELECT s.code, COUNT(s.baseSetSize) AS card_count FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Russian' GROUP BY s.code ORDER BY card_count DESC LIMIT 1	card_games
SELECT CAST(SUM(CASE WHEN T1.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid INNER JOIN sets AS T3 ON T1.setCode = T3.code WHERE T2.language = 'Chinese Simplified' AND T3.code = '10E'	card_games
SELECT COUNT(T1.id) FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Japanese' AND (T1.mtgoCode IS NULL OR T1.mtgoCode = '');	card_games
SELECT COUNT(id), id FROM cards WHERE borderColor = 'black'	card_games
SELECT id FROM cards WHERE frameEffects = 'extendedart'	card_games
SELECT name FROM cards WHERE borderColor = 'black' AND isFullArt = 1	card_games
SELECT language FROM set_translations WHERE setCode = '174';	card_games
SELECT name FROM sets WHERE code = 'ALL'	card_games
SELECT T2.language FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'A Pedra Fellwar';	card_games
SELECT code FROM sets WHERE releaseDate = '2007-07-13';	card_games
SELECT baseSetSize, code FROM sets WHERE block IN ('Masques', 'Mirage')	card_games
SELECT setCode FROM sets WHERE type = 'expansion'	card_games
SELECT T2.name, T1.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'Boros'	card_games
SELECT T2.language, T2.flavorText, T1.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'colorpie'	card_games
SELECT CAST(SUM(CASE WHEN T1.convertedManaCost = 10 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS percentage FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Abyssal Horror';	card_games
SELECT setCode FROM sets WHERE type = 'expansion';	card_games
SELECT T2.name, T1.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'Abzan'	card_games
SELECT DISTINCT T1.language, T2.type  FROM foreign_data AS T1  JOIN cards AS T2 ON T1.uuid = T2.uuid  WHERE T2.watermark = 'Azorius';	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL	card_games
SELECT COUNT(*) FROM cards WHERE availability LIKE '%paper%' AND hand = '3'	card_games
SELECT name FROM cards WHERE isTextless = 0	card_games
SELECT convertedManaCost FROM cards WHERE name = 'Ancestor\'s Chosen'	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND (power = '*' OR power IS NULL)	card_games
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL	card_games
SELECT subtypes, supertypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer'	card_games
SELECT GROUP_CONCAT(purchaseUrls) AS purchase_urls FROM cards WHERE promoTypes LIKE '%bundle%'	card_games
SELECT COUNT(DISTINCT artist) FROM cards WHERE borderColor = 'black' AND availability LIKE '%arena,mtgo%'	card_games
SELECT name, convertedManaCost FROM cards WHERE name IN ('Serra Angel', 'Shrine Keeper') ORDER BY convertedManaCost DESC LIMIT 1	card_games
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer'	card_games
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3	card_games
SELECT T4.translation FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid INNER JOIN sets AS T3 ON T1.setCode = T3.code INNER JOIN set_translations AS T4 ON T3.code = T4.setCode WHERE T1.name = 'Ancestor\'s Chosen' AND T4.language = 'Italian'	card_games
-- Step 1: Find the uuid of the card with the name 'Angel of Mercy' SELECT uuid FROM cards WHERE name = 'Angel of Mercy' LIMIT 1;  -- Step 2: Count the number of translations for the card with the found uuid SELECT COUNT(*) FROM set_translations WHERE uuid IN (     SELECT uuid FROM cards WHERE name = 'Angel of Mercy' LIMIT 1 );	card_games
SELECT T3.name FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode INNER JOIN cards AS T3 ON T3.setCode = T2.setCode WHERE T2.translation = 'Hauptset Zehnte Edition'	card_games
SELECT * FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Ancestor''s Chosen' AND T2.language = 'Korean'	card_games
SELECT COUNT(*) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode INNER JOIN cards AS T3 ON T3.setCode = T1.code WHERE T2.translation = 'Hauptset Zehnte Edition' AND T3.artist = 'Adam Rex'	card_games
SELECT T1.baseSetSize FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Hauptset Zehnte Edition'	card_games
SELECT T2.translation FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode INNER JOIN translations AS T3 ON T2.id = T3.id WHERE T1.name = 'Eighth Edition' AND T2.language = 'Chinese Simplified'	card_games
SELECT CASE WHEN s.mtgoCode IS NOT NULL THEN 'Yes' ELSE 'No' END AS appears_on_mtgo FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.name = 'Angel of Mercy';	card_games
SELECT T2.releaseDate FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Ancestor''s Chosen'	card_games
SELECT T2.type FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.translation = 'Hauptset Zehnte Edition'	card_games
SELECT COUNT(DISTINCT T1.code) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.block = 'Ice Age' AND T2.language = 'Italian' AND T2.translation IS NOT NULL	card_games
SELECT CASE WHEN EXISTS (SELECT 1 FROM cards WHERE name = 'Adarkar Valkyrie') THEN sets.isForeignOnly ELSE 0 END AS is_adarkar_valkyrie_foreign_only	card_games
SELECT COUNT(DISTINCT s.id) FROM sets AS s JOIN set_translations AS st ON s.code = st.setCode WHERE st.language = 'Italian' AND s.baseSetSize < 100	card_games
SELECT COUNT(*) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' AND T1.borderColor = 'black'	card_games
SELECT T2.name FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Coldsnap' ORDER BY T2.convertedManaCost DESC LIMIT 1	card_games
SELECT DISTINCT c.artist FROM cards AS c JOIN sets AS s ON c.setCode = s.code WHERE c.artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy') AND s.name = 'Coldsnap'	card_games
SELECT cards.name FROM cards JOIN sets ON cards.setCode = sets.code WHERE sets.name = 'Coldsnap' AND cards.number = 4	card_games
SELECT COUNT(*) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' AND T1.convertedManaCost > 5 AND (T1.power = '*' OR T1.power IS NULL)	card_games
SELECT T2.flavorText FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Ancestor''s Chosen' AND T2.language = 'Italian'	card_games
SELECT T2.language FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Ancestor''s Chosen' AND T2.flavorText IS NOT NULL	card_games
SELECT T2.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Ancestor''s Chosen' AND T2.language = 'German'	card_games
SELECT T4.text FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode INNER JOIN cards AS T3 ON T3.setCode = T1.code INNER JOIN rulings AS T4 ON T4.uuid = T3.uuid WHERE T1.name = 'Coldsnap' AND T2.language = 'Italian' AND T4.language = 'Italian'	card_games
SELECT T3.name FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code INNER JOIN set_translations AS T3 ON T2.code = T3.setCode INNER JOIN foreign_data AS T4 ON T1.uuid = T4.uuid WHERE T2.name = 'Coldsnap' AND T3.language = 'Italian' ORDER BY T1.convertedManaCost DESC LIMIT 1	card_games
SELECT ...   FROM cards AS T1   INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid	card_games
SELECT CAST(SUM(CASE WHEN T1.convertedManaCost = 7 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap'	card_games
SELECT      CAST(SUM(CASE WHEN T1.cardKingdomFoilId IS NOT NULL AND T1.cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS percentage_incredibly_powerful FROM      cards AS T1 INNER JOIN      sets AS T2 ON T1.setCode = T2.code WHERE      T2.name = 'Coldsnap';	card_games
SELECT code FROM sets WHERE releaseDate = '2017-07-14'	card_games
SELECT keyruneCode FROM sets WHERE code = 'PKHC'	card_games
SELECT mcmId FROM sets WHERE code = 'SS2';	card_games
SELECT mcmName FROM sets WHERE releaseDate = '2017-06-09'	card_games
SELECT type FROM sets WHERE name = 'From the Vault: Lore'	card_games
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized'	card_games
SELECT T1.text, T1.hasContentWarning FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Jim Pavelec'	card_games
SELECT T2.releaseDate FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Evacuation'	card_games
SELECT T1.baseSetSize FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Rinascita di Alara'	card_games
SELECT T1.type FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Huitième édition'	card_games
SELECT T1.translation FROM set_translations AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T1.language = 'English' AND T2.language = 'French' AND T1.translation = 'Tendo Ice Bridge'	card_games
SELECT COUNT(*) FROM set_translations WHERE translation IS NOT NULL AND setCode IN ( SELECT code FROM sets WHERE name = 'Tenth Edition' )	card_games
SELECT T2.translation FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode INNER JOIN cards AS T3 ON T3.uuid = T2.uuid WHERE T3.name = 'Fellwar Stone' AND T2.language = 'Japanese'	card_games
SELECT T1.name FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Journey into Nyx Hero''s Path' ORDER BY T1.convertedManaCost DESC LIMIT 1	card_games
SELECT T1.releaseDate FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Ola de frío'	card_games
SELECT T2.type  FROM cards AS T1  INNER JOIN sets AS T2 ON T1.setCode = T2.code  WHERE T1.name = 'Samite Pilgrim';	card_games
SELECT COUNT(T2.id)  FROM sets AS T1  INNER JOIN cards AS T2 ON T1.code = T2.setCode  WHERE T1.name = 'World Championship Decks 2004' AND T2.convertedManaCost = 3;	card_games
SELECT T2.translation FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Chinese Simplified' AND T1.name = 'Mirrodin'	card_games
SELECT CAST(SUM(CASE WHEN T1.isNonFoilOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T2.language = 'Japanese'	card_games
SELECT CAST(COUNT(T1.isOnlineOnly) AS REAL) * 100 / COUNT(T1.language) FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T2.translation = 'Português (Brasil)'	card_games
SELECT DISTINCT availability FROM cards WHERE artist != 'Aleksi Briclot' AND isTextless = 1	card_games
SELECT id FROM sets ORDER BY baseSetSize DESC LIMIT 1	card_games
SELECT artist FROM cards WHERE side IS NULL ORDER BY convertedManaCost DESC LIMIT 1	card_games
SELECT frameEffects FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL GROUP BY frameEffects ORDER BY COUNT(*) DESC LIMIT 1	card_games
SELECT COUNT(*) FROM cards WHERE (power IS NULL OR power = '*') AND hasFoil = 0 AND duelDeck = 'a'	card_games
SELECT T1.id FROM sets AS T1 INNER JOIN legalities AS T2 ON T1.code = T2.uuid WHERE T1.type = 'commander' ORDER BY T1.totalSetSize DESC LIMIT 1	card_games
SELECT T3.name, T1.manaCost FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid INNER JOIN foreign_data AS T3 ON T1.uuid = T3.uuid WHERE T2.format = 'duel' ORDER BY T1.convertedManaCost DESC LIMIT 10	card_games
SELECT T3.originalReleaseDate, T2.format FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid JOIN sets AS T3 ON T1.uuid = T3.code WHERE T1.rarity = 'mythic' ORDER BY T1.originalReleaseDate ASC LIMIT 1;	card_games
SELECT COUNT(DISTINCT T1.name) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Volkan Baǵa' AND T2.language = 'French'	card_games
SELECT COUNT(DISTINCT T1.id) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'rare' AND T1.types LIKE '%Enchantment%' AND T1.name = 'Abundance' AND T2.status = 'Legal'	card_games
{     "chain_of_thought_reasoning": "To solve this problem, we need to identify the play format (format) with the highest number of cards that have a banned status (status = 'Banned'). We also need to list the names of all the cards that meet this condition. Here's a step-by-step approach to derive the SQL query:",          "1. Identify the relevant table and columns": The relevant table is `legalities`, which contains the `format` and `status` columns. We also need to join this table with the `cards` table to get the card names.          "2. Filter the records with banned status": We need to filter the records where the `status` is 'Banned'.          "3. Group the records by play format": We need to group the filtered records by the `format` column to count the number of banned cards for each format.          "4. Order the groups by the count of banned cards in descending order": We need to order the groups by the count of banned cards in descending order to get the format with the highest number of banned cards at the top.          "5. Limit the result to the top 1 record": We only need the top 1 record, which corresponds to the format with the highest number of banned cards.          "6. Select the required columns": We need to select the `format` and the names of the cards that meet the condition.          "7. Use a subquery to get the card names": Since we cannot directly select the card names in the main query due to the GROUP BY clause, we use a subquery to get the card names and then join it with the main query.          "Final SQL Query": By combining these steps, we can derive the following SQL query",     "SQL": "SELECT T.format, C.name FROM ( SELECT L.format, C.name, COUNT(*) AS banned_count FROM legalities L JOIN cards C ON L.uuid = C.uuid WHERE L.status = 'Banned' GROUP BY L.format, C.name ) T ORDER BY T.banned_count DESC LIMIT 1" }	card_games
SELECT T2.translation FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Battlebond'	card_games
SELECT T2.format FROM (     SELECT artist, COUNT(*) AS card_count     FROM cards     GROUP BY artist     ORDER BY card_count ASC     LIMIT 1 ) AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid;	card_games
SELECT T2.status  FROM cards AS T1  INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid  WHERE T1.frameVersion = '1997'  AND T1.artist = 'D. Alexander Gregory'  AND T1.hasContentWarning = 1  AND T2.format = 'legacy';	card_games
SELECT c.name, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.edhrecRank = 1 AND l.status = 'Banned'	card_games
WITH YearlyCounts AS (     SELECT          STRFTIME('%Y', releaseDate) AS year,         COUNT(*) AS set_count     FROM          sets     WHERE          releaseDate BETWEEN '2012-01-01' AND '2015-12-31'     GROUP BY          STRFTIME('%Y', releaseDate) ), AverageCount AS (     SELECT          AVG(set_count) AS avg_sets_per_year     FROM          YearlyCounts ), MostCommonLanguage AS (     SELECT          T1.language,         COUNT(T1.language) AS language_count     FROM          foreign_data AS T1     JOIN          sets AS T2 ON T1.uuid = T2.uuid     WHERE          T2.releaseDate BETWEEN '2012-01-01' AND '2015-12-31'     GROUP BY          T1.language	card_games
SELECT DISTINCT artist FROM cards WHERE BorderColor = 'black' AND availability = 'arena'	card_games
SELECT T2.uuid FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.format = 'oldschool' AND T1.status IN ('banned', 'restricted')	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability LIKE '%paper%'	card_games
SELECT T2.text FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Kev Walker' ORDER BY T2.date DESC	card_games
SELECT T1.name, T3.format FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code JOIN legalities AS T3 ON T1.uuid = T3.uuid WHERE T2.name = 'Hour of Devastation'	card_games
SELECT DISTINCT T1.name FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Korean' AND T2.language NOT LIKE '%Japanese%'	card_games
SELECT DISTINCT c.frameVersion, c.name AS card_name, l.status AS ban_status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.artist = 'Allen Williams'	card_games
SELECT MAX(Reputation) FROM users WHERE DisplayName IN ('Harlan', 'Jarrod Dixon')	codebase_community
SELECT DisplayName FROM users WHERE STRFTIME('%Y', CreationDate) = '2011'	codebase_community
SELECT COUNT(Id) FROM users WHERE LastAccessDate > '2014-09-01'	codebase_community
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1	codebase_community
SELECT COUNT(Id) FROM users WHERE Upvotes > 100 AND Downvotes > 1	codebase_community
SELECT COUNT(Id) FROM users WHERE Views > 10 AND CreationDate LIKE '%2014%'	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = 'csgillespie'	codebase_community
SELECT p.Title FROM posts AS p JOIN users AS u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie'	codebase_community
SELECT T2.DisplayName FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Title = 'Eliciting priors from experts'	codebase_community
SELECT Title FROM posts WHERE OwnerDisplayName = 'csgillespie' ORDER BY ViewCount DESC LIMIT 1	codebase_community
SELECT T2.DisplayName FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id ORDER BY T1.FavoriteCount DESC LIMIT 1	codebase_community
SELECT SUM(T2.CommentCount) FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.OwnerDisplayName = 'csgillespie'	codebase_community
SELECT T2.AnswerCount FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName = 'csgillespie' ORDER BY T2.AnswerCount DESC LIMIT 1	codebase_community
SELECT Id FROM posts WHERE Title = 'Examples for teaching: Correlation does not mean causation'	codebase_community
SELECT COUNT(*) FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'csgillespie' AND p.ParentId IS NULL	codebase_community
SELECT T2.DisplayName FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.ClosedDate IS NOT NULL	codebase_community
SELECT COUNT(T2.Id) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.Age > 65 AND T2.Score >= 20	codebase_community
SELECT T2.Location FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Title = 'Eliciting priors from experts'	codebase_community
SELECT p.Body FROM posts AS p JOIN tags AS t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'bayesian'	codebase_community
SELECT T2.Body FROM tags AS T1 INNER JOIN posts AS T2 ON T1.ExcerptPostId = T2.Id WHERE T1.Count = ( SELECT MAX(Count) FROM tags )	codebase_community
SELECT COUNT(b.Id) FROM badges AS b INNER JOIN users AS u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie'	codebase_community
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'csgillespie'	codebase_community
SELECT COUNT(b.Id) FROM badges AS b JOIN users AS u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie' AND STRFTIME('%Y', b.Date) = '2011'	codebase_community
GROUP BY UserId	codebase_community
SELECT AVG(Score) FROM posts WHERE OwnerDisplayName = 'csgillespie'	codebase_community
SELECT CAST(COUNT(T2.Id) AS REAL) / COUNT(DISTINCT T1.Id) AS avg_badges FROM users AS T1 JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.Views > 200;	codebase_community
{     "chain_of_thought_reasoning": "The query joins the posts and users tables based on the OwnerUserId. It filters the posts to include only those with a score greater than 5. Then, it calculates the percentage of posts owned by users who are 65 years old or older by using a CASE statement within a SUM function. The result is divided by the total count of filtered posts and multiplied by 100 to get the percentage.",     "SQL": "SELECT CAST(SUM(CASE WHEN T2.Age > 65 THEN 1 ELSE 0 END)	codebase_community
SELECT COUNT(*) FROM votes WHERE UserId = 58 AND CreationDate LIKE '2010-07-19%'	codebase_community
SELECT T1.CreationDate FROM posts AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.PostId GROUP BY T1.CreationDate ORDER BY COUNT(T2.Id) DESC LIMIT 1	codebase_community
SELECT COUNT(Id) FROM badges WHERE Name = 'Revival'	codebase_community
SELECT T2.Title FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id ORDER BY T1.Score DESC LIMIT 1	codebase_community
SELECT COUNT(*) FROM comments WHERE PostId IN (SELECT Id FROM posts WHERE ViewCount = 1910)	codebase_community
SELECT T2.FavoriteCount FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T1.UserId = 3025 AND T1.CreationDate = '2014-04-23 20:29:39.0'	codebase_community
SELECT Text FROM comments WHERE PostId = 107829 LIMIT 1	codebase_community
SELECT CASE WHEN p.ClosedDate IS NULL THEN 'well-finished' ELSE 'not well-finished' END AS post_status FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.UserId = 23853 AND c.CreationDate = '2013-07-12 09:08:18.0'	codebase_community
SELECT T2.Reputation FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Id = 65041	codebase_community
SELECT COUNT(Id) FROM posts WHERE OwnerDisplayName = 'Tiago Pasqualini'	codebase_community
SELECT u.DisplayName FROM users AS u JOIN votes AS v ON u.Id = v.UserId WHERE v.Id = 6347	codebase_community
SELECT Id FROM posts WHERE Title LIKE '%data visualization%'	codebase_community
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'DatEpicCoderGuyWhoPrograms'	codebase_community
SELECT CAST(COUNT(posts.Id) AS REAL) / COUNT(votes.Id) AS PostVoteRatio FROM posts INNER JOIN votes ON posts.OwnerUserId = votes.UserId WHERE posts.OwnerUserId = 24 AND votes.UserId = 24	codebase_community
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer'	codebase_community
SELECT Text FROM comments WHERE Score = 17	codebase_community
SELECT DisplayName FROM users WHERE WebsiteUrl = 'http://stackoverflow.com'	codebase_community
SELECT b.Name FROM badges AS b JOIN users AS u ON b.UserId = u.Id WHERE u.DisplayName = 'SilentGhost'	codebase_community
SELECT UserDisplayName FROM comments WHERE Text = 'thank you user93'	codebase_community
SELECT c.Text FROM comments AS c JOIN users AS u ON c.UserId = u.Id WHERE u.DisplayName = 'A Lion'	codebase_community
SELECT u.DisplayName, u.Reputation FROM posts p INNER JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Understanding what Dassault iSight is doing?'	codebase_community
SELECT T2.Text  FROM posts AS T1  INNER JOIN comments AS T2 ON T1.Id = T2.PostId  WHERE T1.Title = 'How does gentle boosting differ from AdaBoost?'	codebase_community
SELECT T2.DisplayName FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Necromancer' LIMIT 10	codebase_community
SELECT T3.DisplayName FROM posts AS T1 INNER JOIN postHistory AS T2 ON T1.Id = T2.PostId INNER JOIN users AS T3 ON T3.Id = T2.UserId WHERE T1.Title = 'Open source tools for visualizing multi-dimensional data'	codebase_community
SELECT Title FROM posts WHERE LastEditorUserId = ( SELECT Id FROM users WHERE DisplayName = 'Vebjorn Ljosa' )	codebase_community
SELECT T1.WebsiteUrl, SUM(T2.Score) AS TotalScore     FROM users AS T1     JOIN posts AS T2 ON T1.Id = T2.LastEditorUserId     WHERE T2.LastEditorDisplayName = 'Yevgeny'	codebase_community
SELECT DISTINCT c.UserId FROM postHistory ph JOIN comments c ON ph.Id = c.PostId WHERE ph.PostId IN ( SELECT Id FROM posts WHERE Title = 'Why square the difference instead of taking the absolute value in standard deviation?' ) AND ph.PostHistoryTypeId = 2	codebase_community
SELECT SUM(T2.BountyAmount) AS TotalBounty FROM posts AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.PostId WHERE T1.Title LIKE '%data%'	codebase_community
SELECT p.OwnerDisplayName FROM posts AS p JOIN votes AS v ON p.Id = v.PostId WHERE v.BountyAmount = 50 AND p.Title LIKE '%variance%'	codebase_community
SELECT AVG(posts.ViewCount), posts.Title, comments.Text FROM posts JOIN tags ON posts.Id = tags.ExcerptPostId JOIN comments ON posts.Id = comments.PostId WHERE tags.TagName = '<humor>'	codebase_community
SELECT COUNT(*) FROM comments WHERE UserId = 13	codebase_community
SELECT Id FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users)	codebase_community
SELECT UserId FROM users ORDER BY Views ASC LIMIT 1	codebase_community
SELECT COUNT(UserId) FROM badges WHERE Name = 'Supporter' AND STRFTIME('%Y', Date) = '2011'	codebase_community
SELECT COUNT(UserId) FROM ( SELECT UserId FROM badges GROUP BY UserId HAVING COUNT(DISTINCT Name) > 5 )	codebase_community
SELECT COUNT(DISTINCT T1.UserId)  FROM badges AS T1  INNER JOIN users AS T2 ON T1.UserId = T2.Id  WHERE T2.Location = 'New York'  AND T1.Name IN ('Teacher', 'Supporter')	codebase_community
SELECT u.Id, u.Reputation FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE p.Id = 1;	codebase_community
SELECT DISTINCT ph.UserId FROM postHistory AS ph JOIN posts AS p ON ph.PostId = p.Id GROUP BY ph.PostId HAVING COUNT(ph.PostId) = 1 AND p.Views >= 1000	codebase_community
SELECT u.DisplayName, b.Name FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Id = ( SELECT UserId FROM comments GROUP BY UserId ORDER BY COUNT(Id) DESC LIMIT 1 )	codebase_community
SELECT COUNT(DISTINCT u.Id) FROM users AS u JOIN badges AS b ON u.Id = b.UserId WHERE u.Location = 'India' AND b.Name = 'Teacher'	codebase_community
SELECT ((SUM(CASE WHEN STRFTIME('%Y', Date) = '2010' THEN 1 ELSE 0 END) / COUNT(*)) - (SUM(CASE WHEN STRFTIME('%Y', Date) = '2011' THEN 1 ELSE 0 END) / COUNT(*))) * 100 AS PercentageDifference FROM badges WHERE Name = 'Student'	codebase_community
SELECT ph.PostHistoryTypeId, COUNT(DISTINCT c.UserId) AS UniqueUsers FROM postHistory ph JOIN comments c ON ph.PostId = c.PostId WHERE ph.PostId = 3720	codebase_community
SELECT SUM(T1.ViewCount) AS TotalPopularity FROM posts AS T1 INNER JOIN postLinks AS T2 ON T1.Id = T2.PostId WHERE T2.RelatedPostId = 61217	codebase_community
SELECT Score, LinkTypeId FROM postLinks WHERE PostId = 395	codebase_community
SELECT PostId, UserId FROM posts WHERE Score > 60	codebase_community
SELECT SUM(FavoriteCount) FROM posts WHERE OwnerUserId = 686 AND STRFTIME('%Y', CreatinDate) = '2011'	codebase_community
SELECT AVG(T1.UpVotes), AVG(T1.Age) FROM users AS T1 JOIN posts AS T2 ON T1.Id = T2.OwnerUserId GROUP BY T1.Id HAVING COUNT(T2.Id) > 10	codebase_community
SELECT COUNT(UserId) FROM badges WHERE Name = 'Announcer'	codebase_community
SELECT Name FROM badges WHERE Date = '2010-07-19 19:39:08.0'	codebase_community
SELECT COUNT(*) FROM comments WHERE Score > 60	codebase_community
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:16:14.0'	codebase_community
SELECT COUNT(Id) FROM posts WHERE Score = 10	codebase_community
SELECT T1.Name FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.Reputation = ( SELECT MAX(Reputation) FROM users )	codebase_community
SELECT u.Reputation FROM users AS u JOIN badges AS b ON u.Id = b.UserId WHERE b.Date = '2010-07-19 19:39:08.0'	codebase_community
SELECT T1.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.UserDisplayName = 'Pierre'	codebase_community
SELECT DISTINCT T2.Date FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.Location = 'Rochester, NY'	codebase_community
SELECT CAST(SUM(CASE WHEN Name = 'Teacher' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(Id) FROM badges	codebase_community
SELECT CAST(SUM(CASE WHEN T1.Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.Id) FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T2.Name = 'Organizer'	codebase_community
SELECT Score FROM comments WHERE CreationDate = '2010-07-19 19:19:56.0'	codebase_community
SELECT T1.Text FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T2.CreationDate = '2010-07-19 19:37:33'	codebase_community
SELECT T1.Age FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.Location = 'Vienna, Austria'	codebase_community
SELECT COUNT(DISTINCT u.Id) FROM badges AS b JOIN users AS u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age BETWEEN 19 AND 65	codebase_community
SELECT UserId FROM badges WHERE Name = 'Teacher' AND Date = '2010-07-19 19:39:08.0'	codebase_community
SELECT DISTINCT T1.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.Reputation = ( SELECT MIN(Reputation) FROM users )	codebase_community
SELECT T1.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'Sharpie'	codebase_community
SELECT COUNT(DISTINCT u.Id) FROM badges AS b JOIN users AS u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age > 65	codebase_community
SELECT DisplayName FROM users WHERE Id = 30	codebase_community
SELECT COUNT(Id) FROM users WHERE Location = 'New York';	codebase_community
SELECT COUNT(*) FROM votes WHERE STRFTIME('%Y', CreationDate) = '2010'	codebase_community
SELECT COUNT(Id) FROM users WHERE Age BETWEEN 19 AND 65	codebase_community
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1	codebase_community
SELECT CAST(SUM(CASE WHEN STRFTIME('%Y', CreationDate) = '2010' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN STRFTIME('%Y', CreationDate) = '2011' THEN 1 ELSE 0 END) AS vote_ratio FROM votes	codebase_community
SELECT t.TagName FROM tags t JOIN postTags pt ON t.Id = pt.TagId JOIN posts p ON pt.PostId = p.Id JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'John Salvatier'	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = 'Daniel Vassallo';	codebase_community
SELECT COUNT(T2.Id) FROM users AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'Harlan'	codebase_community
SELECT Id FROM posts WHERE OwnerUserId = ( SELECT Id FROM users WHERE DisplayName = 'slashnick' ) ORDER BY AnswerCount DESC LIMIT 1	codebase_community
SELECT OwnerDisplayName, SUM(ViewCount) AS TotalViews FROM posts WHERE OwnerDisplayName IN ('Harvey Motulsky', 'Noah Snyder') GROUP BY OwnerDisplayName ORDER BY TotalViews DESC LIMIT 1	codebase_community
SELECT COUNT(*) FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId JOIN votes AS v ON p.Id = v.PostId WHERE u.DisplayName = 'Matt Parker' AND v.VoteTypeId = 2	codebase_community
SELECT COUNT(DISTINCT T1.PostId) FROM comments AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'Neil McGuigan' AND T1.Score < 60	codebase_community
SELECT t.TagName FROM tags t JOIN post_tags pt ON t.Id = pt.TagId JOIN posts p ON pt.PostId = p.Id JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Mark Meckes' AND p.CommentCount = 0	codebase_community
SELECT T2.DisplayName FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Organizer'	codebase_community
SELECT CAST(SUM(CASE WHEN T4.TagName = 'r' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.Id) AS percentage FROM posthistory AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id INNER JOIN users AS T3 ON T1.UserId = T3.Id INNER JOIN postlinks AS T4 ON T1.PostId = T4.PostId WHERE T3.DisplayName = 'Community'	codebase_community
SELECT SUM(CASE WHEN T2.DisplayName = 'Mornington' THEN T1.ViewCount ELSE 0 END) - SUM(CASE WHEN T2.DisplayName = 'Amos' THEN T1.ViewCount ELSE 0 END) AS ViewDifference FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Commentator' AND STRFTIME('%Y', Date) = '2014'	codebase_community
SELECT COUNT(Id) FROM posts WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59'	codebase_community
SELECT DisplayName, Age FROM users WHERE Views = ( SELECT MAX(Views) FROM users )	codebase_community
SELECT LastEditDate, LastEditorUserId FROM posts WHERE Title = 'Detecting a given face in a database of facial images'	codebase_community
SELECT COUNT(Id) FROM comments WHERE UserId = 13 AND Score < 60	codebase_community
SELECT DISTINCT p.Title, c.UserDisplayName FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.Score > 60	codebase_community
SELECT DISTINCT b.Name FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location LIKE '%North Pole%' AND STRFTIME('%Y', b.Date) = '2011'	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.FavoriteCount > 150	codebase_community
SELECT COUNT(ph.Id) AS HistoryCount, p.LasActivityDate AS LastEditDate FROM posts p JOIN postHistory ph ON p.Id = ph.PostId WHERE p.Title = 'What is the best introductory Bayesian statistics textbook?'	codebase_community
SELECT u.LastAccessDate, u.Location FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Outliers'	codebase_community
SELECT T3.Title FROM posts AS T1 INNER JOIN postlinks AS T2 ON T2.PostId = T1.Id INNER JOIN posts AS T3 ON T2.RelatedPostId = T3.Id WHERE T1.Title = 'How to tell if something happened in a data set which monitors a value over time'	codebase_community
SELECT p.Id AS PostId, b.Name AS BadgeName FROM users u JOIN badges b ON u.Id = b.UserId JOIN posts p ON u.Id = p.OwnerUserId WHERE u.UserDisplayName = 'Samuel' AND STRFTIME('%Y', p.CreationDate) = '2013' AND STRFTIME('%Y', b.Date) = '2013'	codebase_community
SELECT OwnerDisplayName FROM posts ORDER BY ViewCount DESC LIMIT 1	codebase_community
SELECT u.DisplayName, u.Location FROM users u JOIN posts p ON u.Id = p.OwnerUserId JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'hypothesis-testing'	codebase_community
SELECT T2.Title, T1.LinkTypeId FROM postLinks AS T1 INNER JOIN posts AS T2 ON T1.RelatedPostId = T2.Id WHERE T2.Title = 'What are principal component scores?'	codebase_community
SELECT p.DisplayName FROM posts AS c JOIN posts AS p ON c.ParentId = p.Id WHERE c.ParentId IS NOT NULL ORDER BY c.Score DESC LIMIT 1	codebase_community
SELECT T1.DisplayName, T1.WebsiteUrl FROM users AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.UserId WHERE T2.VoteTypeId = 8 ORDER BY T2.BountyAmount DESC LIMIT 1	codebase_community
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5	codebase_community
SELECT COUNT(Id) FROM tags WHERE Count BETWEEN 5000 AND 7000	codebase_community
SELECT OwnerUserId FROM posts ORDER BY FavoriteCount DESC LIMIT 1	codebase_community
SELECT Age FROM users WHERE Reputation = ( SELECT MAX(Reputation) FROM users )	codebase_community
SELECT COUNT(Id) FROM votes WHERE STRFTIME('%Y', CreationDate) = '2011' AND BountyAmount = 50	codebase_community
SELECT Id FROM users ORDER BY Age ASC LIMIT 1	codebase_community
SELECT SUM(Score) FROM posts WHERE LastActivityDate LIKE '2010-07-19%'	codebase_community
SELECT CAST(COUNT(T1.Id) AS REAL) / 12 AS avg_monthly_links FROM posts AS T1 INNER JOIN postLinks AS T2 ON T1.Id = T2.PostId WHERE STRFTIME('%Y', T1.CreaionDate) = '2010' AND T1.AnswerCount <= 2	codebase_community
SELECT p.Id FROM posts AS p JOIN votes AS v ON p.Id = v.PostId WHERE v.UserId = 1465 ORDER BY p.FavoriteCount DESC LIMIT 1	codebase_community
SELECT p.Title FROM posts AS p JOIN postLinks AS pl ON p.Id = pl.PostId ORDER BY pl.CreationDate ASC LIMIT 1	codebase_community
SELECT T2.DisplayName FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id GROUP BY T1.UserId ORDER BY COUNT(T1.Name) DESC LIMIT 1	codebase_community
SELECT MIN(T1.CreationDate) FROM votes AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'chl'	codebase_community
SELECT T2.CreaionDate FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId ORDER BY T1.Age ASC, T2.CreaionDate ASC LIMIT 1	codebase_community
{     "chain_of_thought_reasoning": "To answer this question, we need to find the user who received the 'Autobiographer' badge and has the earliest date associated with that badge. Here's a step-by-step approach to derive the SQL query:",          "1. Identify the relevant table": The information about badges is stored in the `badges` table.          "2. Filter by badge name": We need to filter the records in the `badges` table where the `Name` column is equal to 'Autobiographer'.          "3. Order by date": To find the first badge acquired, we need to order the filtered records by the `Date` column in ascending order.          "4. Limit to one record": Since we are interested in the first badge acquired, we will limit the result to one record using the `LIMIT` clause.          "5. Select the user's display name": Finally, we need to select the `DisplayName` of the user who received the badge. This information is stored in the `users` table, but since the `badges` table already contains the `UserId`, we can join the `badges` table with the `users` table based on this common column.          "6. Construct the SQL query": Based on the above steps, the SQL query can be constructed as follows",     "SQL": "SELECT u.DisplayName FROM users AS u JOIN badges AS b ON u.Id = b.UserId WHERE b.Name = 'Autobiographer' ORDER BY b.Date ASC LIMIT 1" }	codebase_community
SELECT COUNT(DISTINCT u.Id) FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE u.Location = 'United Kingdom' GROUP BY u.Id HAVING SUM(p.FavoriteCount) >= 4	codebase_community
SELECT AVG(T2.PostId) AS AveragePostsVotedByOldestUsers FROM users AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.UserId ORDER BY T1.Age DESC LIMIT 1	codebase_community
SELECT DisplayName FROM users WHERE Reputation = ( SELECT MAX(Reputation) FROM users )	codebase_community
SELECT COUNT(*) FROM users WHERE Reputation > 2000 AND Views > 1000	codebase_community
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65	codebase_community
SELECT COUNT(*) FROM posts WHERE STRFTIME('%Y', CreationDate) = '2010' AND OwnerDisplayName = 'Jay Stevens'	codebase_community
SELECT Id, Title FROM posts WHERE OwnerDisplayName = 'Harvey Motulsky' ORDER BY ViewCount DESC LIMIT 1	codebase_community
SELECT Id, Title FROM posts ORDER BY Score DESC LIMIT 1	codebase_community
SELECT AVG(posts.Score) FROM users INNER JOIN posts ON users.Id = posts.OwnerUserId WHERE users.DisplayName = 'Stephen Turner'	codebase_community
SELECT DISTINCT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.ViewCount > 20000 AND strftime('%Y', p.CreaionDate) = '2011'	codebase_community
SELECT Id, OwnerDisplayName FROM posts WHERE STRFTIME('%Y', CreationDate) = '2010' ORDER BY FavoriteCount DESC LIMIT 1;	codebase_community
SELECT CAST(SUM(CASE WHEN T1.Reputation > 1000 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.Id) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE STRFTIME('%Y', T2.CreaionDate) = '2011'	codebase_community
SELECT CAST(SUM(CASE WHEN Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(Id) FROM users	codebase_community
SELECT SUM(ViewCount) AS TotalViews, OwnerDisplayName AS LastPoster FROM posts WHERE Text = 'Computer Game Datasets';	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > ( SELECT AVG(ViewCount) FROM posts )	codebase_community
SELECT COUNT(*) FROM comments WHERE PostId = ( SELECT Id FROM posts ORDER BY Score DESC LIMIT 1 )	codebase_community
SELECT COUNT(Id) FROM posts WHERE ViewCount > 35000 AND CommentCount = 0	codebase_community
SELECT OwnerDisplayName, Location FROM posts WHERE Id = 183 ORDER BY LastEditDate DESC LIMIT 1	codebase_community
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.UserDisplayName = 'Emmett' ORDER BY T2.Date DESC LIMIT 1	codebase_community
SELECT COUNT(Id) FROM users WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000	codebase_community
SELECT strftime('%J', T1.Date) - strftime('%J', T2.CreationDate) AS days_since_creation FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'Zolomon'	codebase_community
SELECT ( SELECT COUNT(*) FROM posts WHERE OwnerUserId = ( SELECT Id FROM users ORDER BY CreationDate DESC LIMIT 1 ) ) AS post_count, ( SELECT COUNT(*) FROM comments WHERE UserId = ( SELECT Id FROM users ORDER BY CreationDate DESC LIMIT 1 ) ) AS comment_count	codebase_community
SELECT Id FROM posts WHERE Title = 'Analysing wind data with R'	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Citizen Patrol'	codebase_community
SELECT COUNT(T1.TagId) FROM tags AS T1 INNER JOIN postTags AS T2 ON T1.Id = T2.TagId WHERE T1.TagName = 'careers'	codebase_community
SELECT Reputation, ViewCount FROM users WHERE DisplayName = 'Jarrod Dixon'	codebase_community
SELECT COUNT(comments.Id) + COUNT(posts.Id) AS TotalCommentsAndAnswers FROM posts LEFT JOIN comments ON posts.Id = comments.PostId AND posts.Title = 'Clustering 1D data' WHERE posts.Title = 'Clustering 1D data';	codebase_community
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat'	codebase_community
SELECT COUNT(PostId) FROM votes WHERE BountyAmount >= 30	codebase_community
SELECT CAST(SUM(CASE WHEN p.Score > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(p.Id) AS Percentage FROM posts p JOIN users u ON p.OwnerUserId = u.Id ORDER BY u.Reputation DESC LIMIT 1	codebase_community
SELECT COUNT(Id) FROM posts WHERE Score < 20	codebase_community
SELECT COUNT(Id) FROM tags WHERE Id < 15 AND Count <= 20	codebase_community
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample'	codebase_community
SELECT UserId FROM comments WHERE Text = 'fine, you win :)'	codebase_community
{     "chain_of_thought_reasoning": "To answer this question, we need to find the text of comments associated with posts that contain the title 'Linear Regression'. Here's a step-by-step approach to derive the SQL query:",          "Step 1": "Identify the relevant tables. We need the `posts` table to filter by title and the `comments` table to retrieve the comment texts.",          "Step 2": "Establish the relationship between the `posts` and `comments` tables. The `PostId` column in the `comments` table links to the `Id` column in the `posts` table.",          "Step 3": "Filter the `posts` table to only include rows where the `Title` column contains the substring 'Linear Regression'. This can be achieved using the `LIKE` operator with a wildcard '%'.",          "Step 4": "Join the filtered `posts` table with the `comments` table on the `PostId` column to retrieve the comment texts associated with the matching posts.",          "Step 5": "Select the `Text` column from the `comments` table to get the actual comment texts.",          "Final Query": "The query combines these steps to filter posts, join with comments, and select the desired text."          "SQL": "SELECT T2.Text FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.Title LIKE '%Linear Regression%'" }	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ViewCount BETWEEN 100 AND 150 ORDER BY c.Score DESC LIMIT 1	codebase_community
SELECT T2.CreationDate, T2.Age FROM comments AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Text LIKE '%http://%'	codebase_community
SELECT COUNT(T2.Id) FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T1.Score = 0 AND T2.ViewCount < 5	codebase_community
SELECT COUNT(c.Id) FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.CommentCount = 1 AND c.Score = 0	codebase_community
SELECT COUNT(DISTINCT u.Id) FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score = 0 AND u.Age = 40	codebase_community
SELECT p.Id AS PostId, c.Text FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Title = 'Group differences on a five point Likert item'	codebase_community
SELECT SUM(T2.UpVotes) FROM comments AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Text LIKE '%R is also lazy evaluated.%'	codebase_community
SELECT Text FROM comments WHERE UserDisplayName = 'Harvey Motulsky'	codebase_community
SELECT DISTINCT UserDisplayName FROM comments WHERE Score BETWEEN 1 AND 5 AND DownVotes = 0	codebase_community
SELECT CAST(SUM(CASE WHEN T2.UpVotes = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.UserId) AS Percentage FROM comments AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Score BETWEEN 5 AND 10	codebase_community
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.superhero_name = '3-D Man'	superhero
SELECT COUNT(DISTINCT hero_id) FROM hero_power WHERE power_id = (SELECT id FROM superpower WHERE power_name = 'Super Strength')	superhero
SELECT COUNT(*) FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE sp.power_name = 'Super Strength' AND s.height_cm > 200	superhero
SELECT T1.full_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id GROUP BY T1.id HAVING COUNT(T2.power_id) > 15;	superhero
SELECT COUNT(id) FROM superhero WHERE eye_colour_id = 1	superhero
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.skin_colour_id = T2.id WHERE T1.superhero_name = 'Apocalypse'	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id INNER JOIN colour AS T4 ON T1.eye_colour_id = T4.id WHERE T4.colour = 'Blue' AND T3.power_name = 'Agility'	superhero
SELECT T1.superhero_name  FROM superhero AS T1  INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id  INNER JOIN colour AS T3 ON T3.id = T2.attribute_id AND T3.colour = 'Blue'  INNER JOIN colour AS T4 ON T4.id = T1.hair_colour_id AND T4.colour = 'Blond'	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics'	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics' ORDER BY T1.height_cm DESC	superhero
SELECT T2.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name = 'Sauron'	superhero
SELECT T2.colour, COUNT(T1.id) AS count FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.publisher_id = ( SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics' ) GROUP BY T1.eye_colour_id ORDER BY count DESC	superhero
SELECT AVG(T1.height_cm) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics'	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id INNER JOIN hero_power AS T3 ON T1.id = T3.hero_id INNER JOIN superpower AS T4 ON T3.power_id = T4.id WHERE T2.publisher_name = 'Marvel Comics' AND T4.power_name = 'Super Strength';	superhero
SELECT COUNT(T1.id) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'DC Comics'	superhero
SELECT T4.publisher_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id INNER JOIN publisher AS T4 ON T1.publisher_id = T4.id WHERE T3.attribute_name = 'Speed' ORDER BY T2.attribute_value ASC LIMIT 1	superhero
{     "chain_of_thought_reasoning": "We need to identify superheroes who have gold eyes and were published by Marvel Comics. We join the superhero table with the colour table based on the eye_colour_id column and the publisher table based on the publisher_id	superhero
SELECT T2.publisher_name  FROM superhero AS T1  INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id  WHERE T1.superhero_name = 'Blue Beetle II';	superhero
SELECT COUNT(superhero.id) FROM superhero JOIN colour ON superhero.hair_colour_id = colour.id WHERE colour.colour = 'Blond'	superhero
SELECT s.superhero_name FROM superhero AS s JOIN hero_attribute AS ha ON s.id = ha.hero_id JOIN attribute AS a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Intelligence' ORDER BY ha.attribute_value ASC LIMIT 1	superhero
SELECT T2.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.superhero_name = 'Copycat'	superhero
SELECT T3.superhero_name FROM hero_attribute AS T1 INNER JOIN attribute AS T2 ON T1.attribute_id = T2.id INNER JOIN superhero AS T3 ON T1.hero_id = T3.id WHERE T2.attribute_name = 'Durability' AND T1.attribute_value < 50	superhero
SELECT T3.superhero_name FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id INNER JOIN superhero AS T3 ON T1.hero_id = T3.id WHERE T2.power_name = 'Death Touch'	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id INNER JOIN gender AS T4 ON T1.gender_id = T4.id WHERE T4.gender = 'Female' AND T3.attribute_name = 'Strength' AND T2.attribute_value = 100	superhero
SELECT T2.superhero_name FROM hero_power AS T1 INNER JOIN superhero AS T2 ON T1.hero_id = T2.id GROUP BY T1.hero_id ORDER BY COUNT(*) DESC LIMIT 1;	superhero
SELECT COUNT(id) FROM superhero WHERE race_id = 6	superhero
SELECT CAST(COUNT(CASE WHEN T1.alignment = 'Bad' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.id) AS bad_percentage, SUM(CASE WHEN T1.alignment = 'Bad' AND T3.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS marvel_bad_count FROM alignment AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.alignment_id INNER JOIN publisher AS T3 ON T2.publisher_id = T3.id	superhero
SELECT      SUM(CASE WHEN T2.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) -      SUM(CASE WHEN T2.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) AS difference FROM      superhero AS T1 INNER JOIN      publisher AS T2 ON T1.publisher_id = T2.id;	superhero
SELECT id FROM publisher WHERE publisher_name = 'Star Trek'	superhero
SELECT AVG(attribute_value) AS average_attribute_value FROM hero_attribute	superhero
SELECT COUNT(id) FROM superhero WHERE full_name IS NULL	superhero
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.id = 75	superhero
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.superhero_name = 'Deathlok'	superhero
SELECT AVG(T1.weight_kg) FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T2.gender = 'Female'	superhero
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id INNER JOIN gender AS T4 ON T1.gender_id = T4.id WHERE T4.gender = 'Male' LIMIT 5	superhero
SELECT superhero_name FROM superhero WHERE race_id = 2	superhero
SELECT DISTINCT T1.superhero_name  FROM superhero AS T1  INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id  WHERE T1.height_cm BETWEEN 170 AND 190 AND T2.colour = 'No Colour'	superhero
SELECT T2.power_name FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T1.hero_id = 56	superhero
SELECT DISTINCT T1.full_name  FROM superhero AS T1  INNER JOIN race AS T2 ON T1.race_id = T2.id  WHERE T2.race = 'Demi-God'  LIMIT 5;	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T2.alignment = 'Bad';	superhero
SELECT T1.race FROM race AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T2.weight_kg = 169	superhero
SELECT DISTINCT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.hair_colour_id INNER JOIN race AS T3 ON T2.race_id = T3.id WHERE T2.height_cm = 185 AND T3.race = 'Human'	superhero
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id ORDER BY T1.weight_kg DESC LIMIT 1	superhero
SELECT      CAST(SUM(CASE WHEN T2.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) AS percentage_marvel_comics FROM      superhero AS T1 INNER JOIN      publisher AS T2 ON T1.publisher_id = T2.id WHERE      T1.height_cm BETWEEN 150 AND 180;	superhero
SELECT s.superhero_name FROM superhero AS s JOIN gender AS g ON s.gender_id = g.id WHERE s.weight_kg > ( SELECT PERCENTILE_CONT(0.79) WITHIN GROUP (ORDER BY weight_kg) FROM superhero )	superhero
SELECT T2.power_name FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id GROUP BY T2.power_name ORDER BY COUNT(T2.power_name) DESC LIMIT 1	superhero
SELECT T2.attribute_value FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T1.superhero_name = 'Abomination'	superhero
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.id = 1	superhero
SELECT COUNT(DISTINCT T1.hero_id) FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T2.power_name = 'Stealth'	superhero
SELECT T1.full_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Strength' AND T2.attribute_value = ( SELECT MAX(attribute_value) FROM hero_attribute WHERE attribute_id = ( SELECT id FROM attribute WHERE attribute_name = 'Strength' ) )	superhero
SELECT CAST(SUM(CASE WHEN skin_colour_id = 1 THEN 1 ELSE 0 END) AS REAL) / COUNT(*) AS average_no_skin_colour FROM superhero;	superhero
SELECT COUNT(T2.id) AS superhero_count FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id WHERE T1.publisher_name = 'Dark Horse Comics';	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id INNER JOIN hero_attribute AS T3 ON T1.id = T3.hero_id INNER JOIN attribute AS T4 ON T3.attribute_id = T4.id WHERE T2.publisher_name = 'Dark Horse Comics' AND T4.attribute_name = 'Durability' ORDER BY T3.attribute_value DESC LIMIT 1	superhero
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.full_name = 'Abraham Sapien'	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Flight';	superhero
SELECT T4.colour AS eye_colour, T5.colour AS hair_colour, T6.colour AS skin_colour FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id INNER JOIN publisher AS T3 ON T1.publisher_id = T3.id INNER JOIN colour AS T4 ON T1	superhero
SELECT T1.superhero_name, T4.publisher_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id INNER JOIN colour AS T3 ON T1.hair_colour_id = T3.id INNER JOIN colour AS T4 ON T1.skin_colour_id = T4.id WHERE T1.eye_colour_id = T1.hair_colour_id AND T1.hair_colour_id = T1.skin_colour_id	superhero
SELECT T2.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.superhero_name = 'A-Bomb'	superhero
SELECT CAST(COUNT(CASE WHEN T1.gender = 'Female' AND T2.colour = 'Blue' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.gender) FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id INNER JOIN colour AS T3 ON T1.hair_colour_id = T3.id INNER JOIN colour AS T4 ON T1.skin_colour_id = T4.id WHERE T2.gender = 'Female'	superhero
SELECT T1.superhero_name, T2.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.full_name = 'Charles Chandler'	superhero
SELECT T2.gender FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T1.superhero_name = 'Agent 13'	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Adaptation'	superhero
SELECT COUNT(*) FROM hero_power AS hp JOIN superhero AS s ON hp.hero_id = s.id WHERE s.superhero_name = 'Amazo'	superhero
SELECT sp.power_name FROM superhero sh JOIN hero_power hp ON sh.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sh.full_name = 'Hunter Zolomon';	superhero
SELECT T1.height_cm FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Amber'	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id JOIN colour AS T3 ON T1.hair_colour_id = T3.id WHERE T2.colour = 'Black' AND T3.colour = 'Black'	superhero
SELECT T2.colour AS eye_colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.skin_colour_id = T2.id WHERE T2.colour = 'Gold'	superhero
SELECT T1.full_name FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Vampire'	superhero
SELECT s.superhero_name FROM superhero s JOIN alignment a ON s.alignment_id = a.id WHERE a.alignment = 'Neutral';	superhero
SELECT COUNT(*) FROM hero_attribute AS ha JOIN attribute AS a ON ha.attribute_id = a.id WHERE ha.attribute_value = ( SELECT MAX(attribute_value) FROM hero_attribute WHERE attribute_id = ( SELECT id FROM attribute WHERE attribute_name = 'Strength' ) )	superhero
SELECT T1.race, T2.alignment FROM race AS T1 INNER JOIN alignment AS T2 ON T1.id = T2.id INNER JOIN superhero AS T3 ON T3.race_id = T1.id AND T3.alignment_id = T2.id WHERE T3.superhero_name = 'Cameron Hicks'	superhero
SELECT CAST(COUNT(CASE WHEN T1.gender = 'Female' AND T2.publisher_name = 'Marvel Comics' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.id) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.gender = 'Female'	superhero
SELECT AVG(T1.weight_kg) FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Alien'	superhero
SELECT ( SELECT weight_kg FROM superhero WHERE full_name = 'Emil Blonsky' ) - ( SELECT weight_kg FROM superhero WHERE full_name = 'Charles Chandler' ) AS weight_difference	superhero
SELECT DISTINCT AVG(height_cm) FROM superhero	superhero
SELECT T3.power_name  FROM superhero AS T1  INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id  INNER JOIN superpower AS T3 ON T2.power_id = T3.id  WHERE T1.superhero_name = 'Abomination'	superhero
SELECT COUNT(*) FROM superhero WHERE race_id = 21 AND gender_id = 1	superhero
SELECT T2.superhero_name FROM hero_attribute AS T1 INNER JOIN superhero AS T2 ON T1.hero_id = T2.id WHERE T1.attribute_id = ( SELECT id FROM attribute WHERE attribute_name = 'Speed' ) ORDER BY T1.attribute_value DESC LIMIT 1	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3	superhero
SELECT a.attribute_name, ha.attribute_value FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE s.superhero_name = '3-D Man';	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T2.id = T1.eye_colour_id INNER JOIN colour AS T3 ON T3.id = T1.hair_colour_id WHERE T2.colour = 'Blue' AND T3.colour = 'Brown'	superhero
SELECT T2.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy')	superhero
SELECT COUNT(id) FROM superhero WHERE publisher_id = 1	superhero
SELECT CAST(COUNT(CASE WHEN T1.eye_colour_id = 7 THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(*) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id	superhero
SELECT CAST(SUM(CASE WHEN T1.gender_id = 1 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T1.gender_id = 2 THEN 1 ELSE 0 END) AS ratio FROM gender AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.gender_id	superhero
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1	superhero
SELECT id FROM superpower WHERE power_name = 'cryokinesis'	superhero
SELECT superhero_name FROM superhero WHERE id = 294	superhero
SELECT full_name FROM superhero WHERE weight_kg = 0 OR weight_kg IS NULL	superhero
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.full_name = 'Karen Beecher-Duncan'	superhero
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.full_name = 'Helen Parr'	superhero
SELECT T2.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.weight_kg = 108 AND T1.height_cm = 188	superhero
SELECT T2.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.id = 38	superhero
SELECT T2.race FROM hero_attribute AS T1 INNER JOIN superhero AS T2 ON T1.hero_id = T2.id WHERE T1.attribute_value = ( SELECT MAX(attribute_value) FROM hero_attribute )	superhero
SELECT T2.alignment, T4.power_name FROM superhero AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id INNER JOIN hero_power AS T3 ON T1.id = T3.hero_id INNER JOIN superpower AS T4 ON T3.power_id = T4.id WHERE T1.superhero_name = 'Atom IV'	superhero
SELECT DISTINCT T1.superhero_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Blue' LIMIT 5	superhero
SELECT AVG(T1.attribute_value) FROM hero_attribute AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T2.alignment = 'Neutral'	superhero
SELECT T3.colour FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN colour AS T3 ON T1.skin_colour_id = T3.id WHERE T2.attribute_value = 100	superhero
SELECT COUNT(T1.id) FROM superhero AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id INNER JOIN gender AS T3 ON T1.gender_id = T3.id WHERE T2.id = 1 AND T3.id = 2	superhero
SELECT T2.superhero_name FROM hero_attribute AS T1 INNER JOIN superhero AS T2 ON T1.hero_id = T2.id WHERE T1.attribute_value BETWEEN 75 AND 80	superhero
SELECT T5.race FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id INNER JOIN colour AS T3 ON T1.hair_colour_id = T3.id INNER JOIN race AS T5 ON T1.race_id = T5.id WHERE T2.gender = 'Male' AND T3.colour = 'Blue'	superhero
SELECT CAST(COUNT(CASE WHEN T3.gender = 'Female' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.alignment) FROM alignment AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.alignment_id INNER JOIN gender AS T3 ON T2.gender_id = T3.id WHERE T1.alignment = 'Bad'	superhero
SELECT SUM(CASE WHEN T1.eye_colour_id = 7 THEN 1 ELSE 0 END) - SUM(CASE WHEN T1.eye_colour_id = 1 THEN 1 ELSE 0 END) AS difference FROM superhero AS T1 WHERE T1.weight_kg = 0 OR T1.weight_kg IS NULL	superhero
SELECT T2.attribute_value FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T1.superhero_name = 'Hulk' AND T3.attribute_name = 'Strength'	superhero
SELECT sp.power_name FROM superhero AS sh JOIN hero_power AS hp ON sh.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE sh.superhero_name = 'Ajax';	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.skin_colour_id = T2.id WHERE T1.alignment_id = ( SELECT id FROM alignment WHERE alignment = 'Bad' ) AND T2.colour = 'Green'	superhero
SELECT COUNT(T1.id) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id INNER JOIN gender AS T3 ON T1.gender_id = T3.id WHERE T3.gender = 'Female' AND T2.publisher_name = 'Marvel Comics'	superhero
SELECT T3.superhero_name FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id INNER JOIN superhero AS T3 ON T1.hero_id = T3.id WHERE T2.power_name = 'Wind Control' ORDER BY T3.superhero_name	superhero
SELECT T3.gender FROM superpower AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.power_id INNER JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T1.power_name = 'Phoenix Force'	superhero
SELECT superhero_name FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'DC Comics') ORDER BY weight_kg DESC LIMIT 1	superhero
SELECT AVG(T1.height_cm) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id INNER JOIN race AS T3 ON T1.race_id = T3.id WHERE T2.publisher_name = 'Dark Horse Comics' AND T3.race != 'Human'	superhero
SELECT COUNT(T1.superhero_name) FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Speed' AND T2.attribute_value = 100	superhero
SELECT (COUNT(CASE WHEN T1.publisher_name = 'DC Comics' THEN 1 ELSE NULL END) - COUNT(CASE WHEN T1.publisher_name = 'Marvel Comics' THEN 1 ELSE NULL END)) AS difference FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id	superhero
SELECT T2.attribute_name FROM hero_attribute AS T1 INNER JOIN attribute AS T2 ON T1.attribute_id = T2.id INNER JOIN superhero AS T3 ON T1.hero_id = T3.id WHERE T3.superhero_name = 'Black Panther' ORDER BY T1.attribute_value ASC LIMIT 1	superhero
SELECT id FROM superhero WHERE superhero_name = 'Abomination'	superhero
SELECT superhero_name FROM superhero WHERE height_cm = ( SELECT MAX(height_cm) FROM superhero )	superhero
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler'	superhero
SELECT CAST(SUM(CASE WHEN T2.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.publisher_id) FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id INNER JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T3.publisher_name = 'George Lucas'	superhero
SELECT CAST(SUM(CASE WHEN T1.alignment = 'Good' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM alignment AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.alignment_id INNER JOIN publisher AS T3 ON T2.publisher_id = T3.id WHERE T3.publisher_name = 'Marvel Comics'	superhero
SELECT COUNT(id) FROM superhero WHERE full_name LIKE 'John%'	superhero
SELECT hero_id FROM hero_attribute WHERE attribute_value = ( SELECT MIN(attribute_value) FROM hero_attribute )	superhero
SELECT full_name FROM superhero WHERE superhero_name = 'Alien'	superhero
SELECT T1.full_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.weight_kg < 100 AND T2.colour = 'Brown'	superhero
SELECT T2.attribute_value  FROM superhero AS T1  INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id  INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id  WHERE T1.superhero_name = 'Aquababy';	superhero
SELECT T1.weight_kg, T2.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.id = 40	superhero
SELECT AVG(T1.height_cm) AS average_height FROM superhero AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T2.alignment = 'Neutral';	superhero
SELECT T1.id FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Intelligence'	superhero
SELECT T2.colour  FROM superhero AS T1  INNER JOIN colour AS T2  ON T1.eye_colour_id = T2.id  WHERE T1.superhero_name = 'Blackwulf'	superhero
SELECT T4.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T4 ON T2.power_id = T4.id WHERE T1.height_cm > ( SELECT AVG(height_cm) * 0.8 FROM superhero )	superhero
SELECT driverRef FROM qualifying WHERE raceId = 20 ORDER BY q1 LIMIT 5	formula_1
SELECT T2.surname FROM qualifying AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T1.raceid = 19 AND T1.q2 IS NOT NULL ORDER BY T1.q2 ASC LIMIT 1	formula_1
SELECT DISTINCT T1.year FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.location = 'Shanghai'	formula_1
SELECT url FROM circuits WHERE name = 'Circuit de Barcelona-Catalunya';	formula_1
SELECT T2.name FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.country = 'Germany'	formula_1
SELECT DISTINCT T2.position FROM circuits AS T1 INNER JOIN constructorStandings AS T2 ON T1.circuitid = T2.circuitid WHERE T1.country = 'France'	formula_1
SELECT COUNT(*) FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.year = 2010 AND T2.country NOT IN ('Asia', 'Europe')	formula_1
SELECT T1.name FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.country = 'Spain'	formula_1
SELECT T1.lat, T1.lng FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Australian Grand Prix'	formula_1
SELECT T1.url FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Sepang International Circuit'	formula_1
SELECT T1.time FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Sepang International Circuit'	formula_1
SELECT T1.lat, T1.lng FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Abu Dhabi Grand Prix'	formula_1
SELECT T2.country FROM constructorStandings AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T1.raceId = 24 AND T1.points = 1	formula_1
SELECT t2.q1 FROM drivers AS t1 JOIN qualifying AS t2 ON t1.driverid = t2.driverid WHERE t1.forename = 'Bruno' AND t1.surname = 'Senna' AND t2.raceid = 354	formula_1
SELECT T2.nationality FROM qualifying AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 355 AND T1.q2 = '0:01:40'	formula_1
SELECT driverId FROM qualifying WHERE raceId = 903 AND q3 LIKE '01:54%'	formula_1
SELECT COUNT(*) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.year = 2007 AND T2.name = 'Bahrain Grand Prix' AND T1.time IS NULL	formula_1
SELECT T2.url FROM races AS T1 INNER JOIN seasons AS T2 ON T1.year = T2.year WHERE T1.raceid = 901	formula_1
SELECT COUNT(*) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE date = '2015-11-29') AND time IS NOT NULL	formula_1
SELECT d.driverid, d.forename, d.surname, d.dob FROM drivers d JOIN results r ON d.driverid = r.driverid WHERE r.raceid = 592 AND r.time IS NOT NULL ORDER BY d.dob ASC LIMIT 1	formula_1
SELECT T2.url FROM lapTimes AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.lapTime = '1:27' AND T1.raceId = 161	formula_1
{     "chain_of_thought_reasoning": "To answer this question, we need to find the driver who achieved the highest fastest lap speed in race No. 933 and then determine their nationality. Here's a step-by-step approach to derive the SQL query:",          "Step 1": "Identify the table that contains information about the fastest lap speeds. The `results` table has a column named `fastestLapSpeed`, so we will focus on this table.",          "Step 2": "Filter the records in the `results` table to only include those for race No. 933. This can be done using the `WHERE` clause with the condition `raceId = 933`.",          "Step 3": "Determine the driver with the highest fastest lap speed. We can achieve this by ordering the filtered records in descending order based on the `fastestLapSpeed` column and selecting the top record using the `LIMIT 1` clause.",          "Step 4": "Retrieve the nationality of the driver. The nationality information is stored in the `drivers` table under the `nationality` column. To link the `results` table with the `drivers` table, we use an inner join on the `driverId` column.",          "Step 5": Combine all these steps into a single SQL query to get the nationality of the driver who set the fastest lap speed in race No. 933.",          "SQL": "SELECT T2.nationality FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T1.raceid = 933 ORDER BY T1.fastestlapspeed DESC LIMIT 1" }	formula_1
SELECT T2.lat, T2.lng FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Malaysian Grand Prix'	formula_1
SELECT T2.url FROM constructorResults AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T1.raceId = 9 ORDER BY T1.points DESC LIMIT 1	formula_1
SELECT T2.q1 FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T1.forename = 'Lucas' AND T1.surname = 'Di Grassi' AND T2.raceid = 345	formula_1
SELECT T2.nationality FROM qualifying AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T1.q2 = '01:15' AND T1.raceid = 347	formula_1
SELECT T2.code FROM qualifying AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T1.raceid = 45 AND T1.q3 LIKE '0:01:%'	formula_1
SELECT T2.time FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T1.forename = 'Bruce' AND T1.surname = 'McLaren' AND T2.raceid = 743	formula_1
SELECT T2.forename, T2.surname FROM results AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T1.position = 2 AND T1.raceid IN (SELECT raceid FROM races WHERE name = 'San Marino Grand Prix' AND YEAR = 2006)	formula_1
SELECT T1.url FROM seasons AS T1 JOIN races AS T2 ON T1.year = T2.year WHERE T2.raceid = 901	formula_1
SELECT COUNT(*) AS unfinished_drivers FROM races AS T1 INNER JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.date = '2015-11-29' AND T2.time IS NULL;	formula_1
{     "chain_of_thought_reasoning": "We need to join the drivers, results, and races tables to get the required information. We then filter the results to only include rows where the raceId is 872 and the driver has a non-null time value. Finally, we order the results by the driver's date of birth in descending order and select the top row to find the youngest driver.",     "SQL": "SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driver	formula_1
SELECT T3.forename, T3.surname FROM races AS T1 JOIN laptimes AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T1.raceid = 348 ORDER BY T2.time ASC LIMIT 1	formula_1
SELECT T1.nationality FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.fastestlapspeed = (     SELECT MAX(fastestlapspeed)     FROM results );	formula_1
SELECT ((SELECT T1.fastestLapSpeed FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T1.driverid = (SELECT driverid FROM drivers WHERE forename = 'Paul' AND surname = 'di Resta') AND T2.round = 853) - (SELECT T1.fastestLapSpeed FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T1.driverid = (SELECT driverid FROM drivers WHERE forename = 'Paul' AND surname = 'di Resta') AND T2.round = 854)) / (SELECT T1.fastestLapSpeed FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T1.driverid = (SELECT driverid FROM drivers WHERE forename = 'Paul' AND surname = 'di Resta') AND T2.round = 853) * 100	formula_1
SELECT CAST(SUM(CASE WHEN T1.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.date = '1983-07-16'	formula_1
SELECT MIN(T2.date) FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Sepang International Circuit'	formula_1
SELECT COUNT(*), name FROM races WHERE YEAR = 2005 ORDER BY name DESC	formula_1
SELECT name FROM races WHERE date = ( SELECT MIN(date) FROM races )	formula_1
SELECT name, date FROM races WHERE YEAR = 1999 ORDER BY round DESC LIMIT 1	formula_1
SELECT YEAR FROM races GROUP BY YEAR ORDER BY COUNT(round) DESC LIMIT 1	formula_1
SELECT name FROM races WHERE YEAR = 2017 AND raceid NOT IN (SELECT raceid FROM races WHERE YEAR = 2000)	formula_1
SELECT c.country, c.name AS circuit_name, c.location FROM races r JOIN circuits c ON r.circuitid = c.circuitid ORDER BY r.year ASC LIMIT 1	formula_1
SELECT MAX(T2.year) FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Brands Hatch' AND T2.name = 'British Grand Prix'	formula_1
SELECT COUNT(DISTINCT T1.year) FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Silverstone' AND T1.name = 'British Grand Prix'	formula_1
SELECT T2.driverid, T2.forename, T2.surname FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.year = 2010 AND T1.name = 'Singapore Grand Prix' ORDER BY T2.position	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId ORDER BY T2.points DESC LIMIT 1	formula_1
SELECT d.driverid, d.forename, d.surname, r.points FROM drivers AS d JOIN results AS r ON d.driverid = r.driverid JOIN races AS ra ON r.raceid = ra.raceid WHERE ra.name = 'Chinese Grand Prix' AND ra.year = 2017 ORDER BY r.points DESC LIMIT 3	formula_1
SELECT T1.driverid, T2.driverref AS driver, T2.forename, T2.surname, T1.raceid, T3.name AS race, T1.milliseconds FROM laptimes AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverid INNER JOIN races AS T3 ON T1.raceid = T3.raceid WHERE T1.milliseconds = ( SELECT MIN(milliseconds) FROM laptimes )	formula_1
SELECT AVG(T3.milliseconds) AS average_lap_time FROM drivers AS T1 JOIN laptimes AS T3 ON T1.driverid = T3.driverid JOIN races AS T2 ON T3.raceid = T2.raceid WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton' AND T2.name = 'Malaysian Grand Prix'	formula_1
SELECT CAST(SUM(CASE WHEN T1.position > 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T2.surname = 'Hamilton' AND T1.year >= 2010	formula_1
SELECT T1.forename, T1.surname, T1.nationality, MAX(T2.points) AS max_points FROM drivers AS T1 JOIN driverstandings AS T2 ON T1.driverid = T2.driverid GROUP BY T1.driverid ORDER BY COUNT(T2.wins) DESC LIMIT 1	formula_1
SELECT forename, surname FROM drivers WHERE nationality = 'Japanese' ORDER BY dob DESC LIMIT 1	formula_1
SELECT T2.name FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.date BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY T2.circuitid HAVING COUNT(*) = 4	formula_1
SELECT DISTINCT T1.name AS circuit_name, T1.location AS circuit_location, T2.name AS race_name FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid JOIN seasons AS T3 ON T2.year = T3.year WHERE T3.year = 2006 AND T1.country = 'USA'	formula_1
SELECT T1.name AS race_name, T2.name AS circuit_name, T2.location FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE STRFTIME('%Y-%m', T1.date) = '2005-09'	formula_1
SELECT r.name FROM races AS r JOIN results AS res ON r.raceId = res.raceId JOIN drivers AS d ON res.driverId = d.driverId WHERE d.forename = 'Alex' AND d.surname = 'Yoong' AND res.position < 20	formula_1
SELECT COUNT(*) FROM results AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid JOIN circuits AS T3 ON T1.circuitid = T3.circuitid WHERE T2.forename = 'Michael' AND T2.surname = 'Schumacher' AND T3.name = 'Sepang International Circuit' AND T1.points = ( SELECT MAX(points) FROM results WHERE driverid = T1.driverid )	formula_1
SELECT T3.name AS race_name, T3.year AS race_year FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T1.forename = 'Michael' AND T1.surname = 'Schumacher' ORDER BY T2.milliseconds ASC LIMIT 1	formula_1
SELECT AVG(T2.points) FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId INNER JOIN seasons AS T3 ON T2.raceId = T3.year WHERE T1.surname = 'Irvine' AND T3.year = 2000	formula_1
SELECT T1.year, T2.points FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T3.forename = 'Lewis' AND T3.surname = 'Hamilton' ORDER BY T1.year ASC LIMIT 1	formula_1
SELECT T2.name, T2.country  FROM races AS T1  JOIN circuits AS T2 ON T1.circuitid = T2.circuitid  WHERE T1.year = 2017  ORDER BY T1.date;	formula_1
SELECT T1.name AS RaceName, T1.year AS Year, T2.location AS CircuitLocation FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid ORDER BY T1.laps DESC LIMIT 1	formula_1
SELECT CAST(SUM(CASE WHEN T1.country = 'Germany' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'European Grand Prix'	formula_1
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit'	formula_1
SELECT name FROM circuits WHERE name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring') ORDER BY lat DESC LIMIT 1	formula_1
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit'	formula_1
SELECT country FROM circuits WHERE alt = ( SELECT MAX(alt) FROM circuits )	formula_1
SELECT COUNT(*) FROM drivers WHERE code IS NULL	formula_1
SELECT T1.country FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid JOIN constructorstandings AS T3 ON T2.raceid = T3.raceid JOIN constructors AS T4 ON T3.constructorid = T4.constructorid WHERE T4.nationality = 'British' AND T3.position = 1 ORDER BY T4.nationality DESC LIMIT 1	formula_1
SELECT surname FROM drivers WHERE nationality = 'Italian'	formula_1
SELECT url FROM drivers WHERE forename = "Anthony" AND surname = "Davidson";	formula_1
SELECT driverRef FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton'	formula_1
SELECT T2.name FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.year = 2009 AND T1.name = 'Spanish Grand Prix'	formula_1
SELECT DISTINCT T1.year FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Silverstone'	formula_1
SELECT url FROM circuits WHERE name = 'Silverstone'	formula_1
SELECT T1.time FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Abu Dhabi Circuit' AND T1.year = 2010	formula_1
SELECT COUNT(DISTINCT T1.raceid) FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid JOIN seasons AS T3 ON T1.year = T3.year WHERE T2.country = 'Italy'	formula_1
SELECT T1.date FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Circuit de Barcelona-Catalunya'	formula_1
SELECT T2.url FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.year = 2009 AND T1.name = 'Spanish Grand Prix';	formula_1
SELECT MIN(T2.fastestLapTime) AS Fastest_Lap_Time FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton'	formula_1
SELECT T2.forename, T2.surname FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId ORDER BY T1.fastestLapSpeed DESC LIMIT 1	formula_1
SELECT T1.driverRef FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T3.year = 2007 AND T3.name = 'Canadian Grand Prix' AND T2.position = 1	formula_1
SELECT T3.name FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton'	formula_1
SELECT T3.name FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverid = T2.driverid INNER JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton' ORDER BY T2.rank ASC LIMIT 1	formula_1
SELECT MAX(T2.fastestLapSpeed) FROM races AS T1 INNER JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.name = 'Spanish Grand Prix' AND T1.year = 2009	formula_1
SELECT DISTINCT T3.year FROM drivers AS T1 INNER JOIN constructorStandings AS T2 ON T1.driverid = T2.driverid INNER JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton'	formula_1
SELECT T2.positionOrder FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton' AND T3.name = 'Chinese Grand Prix'	formula_1
SELECT T2.forename, T2.surname FROM results AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T1.grid = 4 AND T1.raceid IN (SELECT raceid FROM races WHERE name = 'Australian Grand Prix' AND YEAR = 1989)	formula_1
SELECT COUNT(*) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.year = 2008 AND T2.name = 'Australian Grand Prix' AND T1.time IS NOT NULL	formula_1
SELECT T3.lap, T3.milliseconds FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN laps AS T3 ON T1.driverId = T3.driverId AND T2.raceId = T3.raceId WHERE T1.driverRef = 'hamilton' AND T2.position = 1 ORDER BY T3.milliseconds ASC LIMIT 1	formula_1
SELECT T1.time  FROM results AS T1  JOIN drivers AS T2 ON T1.driverid = T2.driverid  JOIN races AS T3 ON T1.raceid = T3.raceid  WHERE T3.name = 'Chinese Grand Prix' AND T1.position = 2 AND T3.year = 2008;	formula_1
SELECT T1.forename, T1.surname, T1.url FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = (SELECT raceid FROM races WHERE name = 'Australian Grand Prix' AND YEAR = 2008) ORDER BY T2.position LIMIT 1	formula_1
SELECT COUNT(*) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T3.nationality = 'British' AND T2.year = 2008 AND T2.name = 'Australian Grand Prix'	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = (SELECT raceId FROM races WHERE name = 'Chinese Grand Prix' AND YEAR = 2008) AND time IS NOT NULL	formula_1
SELECT SUM(T3.points) AS total_points FROM drivers AS T1 INNER JOIN constructorStandings AS T2 ON T1.driverId = T2.driverId INNER JOIN constructorResults AS T3 ON T2.constructorId = T3.constructorId INNER JOIN races AS T4 ON T3.raceId = T4.raceId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton'	formula_1
SELECT AVG(STRFTIME('%M', fastestLapTime) * 60 + STRFTIME('%S', fastestLapTime)) AS average_fastest_lap_time_seconds FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT CAST(SUM(CASE WHEN T1.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) / COUNT(*) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.year = 2008 AND T2.name = 'Australian Grand Prix'	formula_1
SELECT ((strftime('%J', T1.time) - strftime('%J', ( SELECT MIN(T2.time) FROM results AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T1.raceid = 1 AND T2.forename = 'Lewis' AND T2.surname = 'Hamilton' ) )) / strftime('%J', ( SELECT MIN(T2.time) FROM results AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T1.raceid = 1 ORDER BY T1.position DESC LIMIT 1 ))) * 100 AS percentage_increase	formula_1
SELECT COUNT(*) FROM circuits WHERE country = 'Australia' AND location = 'Adelaide'	formula_1
SELECT lat, lng FROM circuits WHERE country = 'USA'	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND dob > '1980-01-01';	formula_1
SELECT MAX(T1.points) FROM constructorStandings AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T2.nationality = 'British'	formula_1
SELECT constructorId, MAX(points) AS max_points FROM constructorStandings ORDER BY max_points DESC LIMIT 1	formula_1
SELECT T3.name FROM races AS T1 INNER JOIN constructorStandings AS T2 ON T1.raceId = T2.raceId INNER JOIN constructors AS T3 ON T2.constructorId = T3.constructorId WHERE T1.raceId = 291 AND T2.points = 0	formula_1
SELECT COUNT(T1.constructorId) FROM constructorStandings AS T1 JOIN constructors AS T2 ON T1.constructorId = T2.constructorId JOIN races AS T3 ON T1.raceId = T3.raceId WHERE T2.nationality = 'Japanese' AND T1.points = 0 GROUP BY T1.constructorId HAVING COUNT(T3.raceId) = 2	formula_1
SELECT DISTINCT c.name FROM constructorStandings cs JOIN constructors c ON cs.constructorId = c.constructorId WHERE cs.position = 1;	formula_1
SELECT COUNT(DISTINCT T3.constructorId) FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverid = T2.driverid INNER JOIN laps AS T3 ON T2.resultid = T3.resultid INNER JOIN constructors AS T4 ON T1.constructorid = T4.constructorid WHERE T4.nationality = 'French' AND T3.laps > 50	formula_1
SELECT CAST(SUM(CASE WHEN T2.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.driverid) AS completion_percentage FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T1.nationality = 'Japanese' AND T2.year BETWEEN 2007 AND 2009	formula_1
SELECT      r.year,     AVG(CAST(SUBSTR(rf.time, 1, INSTR(rf.time, ':') - 1) AS REAL) * 3600 +          CAST(SUBSTR(rf.time, INSTR(rf.time, ':') + 1, INSTR(rf.time, ':', INSTR(rf.time, ':') + 1) - INSTR(rf.time, ':') - 1) AS REAL) * 60 +          CAST(SUBSTR(rf.time, INSTR(rf.time, ':', INSTR(rf.time, ':') + 1) + 1) AS REAL)) AS avg_time_seconds FROM      results rf JOIN      races r ON rf.raceid = r.raceid WHERE      rf.time IS NOT NULL AND      r.year < 1975 GROUP BY      r.year;	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN driverstandings AS T2 ON T1.driverid = T2.driverid WHERE T2.position = 2 AND strftime('%Y', T1.dob) > '1975'	formula_1
SELECT COUNT(*) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = 'Italian' AND T2.time IS NULL	formula_1
SELECT T2.forename, T2.surname FROM laptimes AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE milliseconds = (SELECT MIN(milliseconds) FROM laptimes)	formula_1
SELECT T1.lap FROM laptimes AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.position = 1 AND T1.raceid IN (SELECT raceid FROM races WHERE YEAR = 2009) ORDER BY T1.milliseconds ASC LIMIT 1	formula_1
SELECT AVG(T2.fastestLapSpeed) FROM races AS T1 INNER JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.name = 'Spanish Grand Prix' AND T1.year = 2009	formula_1
SELECT T2.name, T2.year FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T1.milliseconds IS NOT NULL ORDER BY T1.milliseconds ASC LIMIT 1	formula_1
SELECT      CAST(SUM(CASE WHEN T2.laps > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS percentage FROM      drivers AS T1 JOIN      results AS T2 ON T1.driverid = T2.driverid WHERE      YEAR(T1.dob) < 1985     AND YEAR(T2.race.date) BETWEEN 2000 AND 2005;	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN laptimes lt ON r.raceId = lt.raceId WHERE d.nationality = 'French' AND CAST(SUBSTR(lt.time, 4, 2) AS REAL) * 60 + CAST(SUBSTR(lt.time, 7, 2) AS REAL) < 120	formula_1
SELECT code FROM drivers WHERE nationality = 'America'	formula_1
SELECT raceId FROM races WHERE YEAR = 2009	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = 18;	formula_1
SELECT    COUNT(*) AS total_youngest_drivers,   SUM(CASE WHEN nationality = 'Netherlands' THEN 1 ELSE 0 END) AS netherlandic_drivers FROM (   SELECT *   FROM drivers   ORDER BY dob DESC   LIMIT 3 )	formula_1
SELECT driverRef FROM drivers WHERE forename = 'Robert' AND surname = 'Kubica'	formula_1
SELECT COUNT(driverId) FROM drivers WHERE nationality = 'British' AND STRFTIME('%Y', dob) = '1980'	formula_1
SELECT d.driverid, d.forename, d.surname, MIN(l.time) AS earliest_lap_time FROM drivers d JOIN results r ON d.driverid = r.driverid JOIN laptimes l ON r.resultid = l.resultid WHERE d.nationality = 'German' AND STRFTIME('%Y', d.dob) BETWEEN '1980' AND '1990' GROUP BY d.driverid, d.forename, d.surname ORDER BY earliest_lap_time ASC LIMIT 3;	formula_1
SELECT driverRef FROM drivers WHERE nationality = 'German' ORDER BY dob ASC LIMIT 1	formula_1
SELECT T1.driverId, T1.code FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE STRFTIME('%Y', T1.dob) = '1971' AND T2.fastestLap IS NOT NULL	formula_1
SELECT d.driverId, d.forename, d.surname, MAX(l.time) AS latest_lap_time FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN laptimes l ON r.resultId = l.resultId WHERE d.nationality = 'Spanish' AND strftime('%Y', d.dob) < '1982' GROUP BY d.driverId, d.forename, d.surname ORDER BY latest_lap_time DESC LIMIT 10;	formula_1
SELECT T2.year FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T1.fastestlaptime IS NOT NULL ORDER BY T1.fastestlaptime ASC LIMIT 1	formula_1
SELECT T2.year FROM lapTimes AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid ORDER BY T1.milliseconds DESC LIMIT 1	formula_1
SELECT driverId FROM laptimes WHERE lap = 1 GROUP BY driverId ORDER BY MIN(time) DESC LIMIT 5	formula_1
SELECT COUNT(*) FROM results WHERE raceId BETWEEN 50 AND 100 AND statusId = 2	formula_1
SELECT count(*) AS num_races, name, LOCATION, lat, lng FROM circuits WHERE country = 'Austria'	formula_1
SELECT raceId FROM results WHERE time IS NOT NULL GROUP BY raceId HAVING COUNT(DISTINCT driverId) = ( SELECT COUNT(DISTINCT driverId) FROM results WHERE time IS NOT NULL )	formula_1
SELECT T1.driverRef, T1.nationality, T1.dob FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 23 AND T2.q2 IS NOT NULL	formula_1
SELECT T3.year, T3.date, T3.time FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid ORDER BY T1.dob DESC LIMIT 1	formula_1
SELECT COUNT(DISTINCT r.driverId) FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN status s ON r.statusId = s.statusId WHERE d.nationality = 'American' AND s.status = 'Puncture';	formula_1
SELECT T1.url FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = 'Italian' ORDER BY T2.points DESC LIMIT 1	formula_1
SELECT T2.url FROM constructorStandings AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId ORDER BY T1.wins DESC LIMIT 1	formula_1
SELECT T1.driverid FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.name = 'French Grand Prix' AND T1.lap = 3 ORDER BY T1.time DESC LIMIT 1	formula_1
SELECT milliseconds FROM laptimes WHERE lap = 1 AND time = (     SELECT MIN(time)     FROM laptimes     WHERE lap = 1 );	formula_1
SELECT AVG(T1.fastestLapTime) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'United States Grand Prix' AND T1.year = 2006 AND T1.rank < 11	formula_1
SELECT d.forename, d.surname, AVG(ps.duration) AS avg_duration FROM drivers d JOIN pitStops ps ON d.driverid = ps.driverid WHERE d.nationality = 'German' AND STRFTIME('%Y', d.dob) BETWEEN '1980' AND '1985' GROUP BY d.driverid ORDER BY avg_duration ASC LIMIT 3	formula_1
SELECT T1.time FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.name = 'Canadian Grand Prix' AND T1.position = 1	formula_1
SELECT c.constructorRef, c.url FROM constructors AS c JOIN constructorStandings AS cs ON c.constructorId = cs.constructorId JOIN races AS r ON cs.raceId = r.raceId WHERE r.year = 2009 AND r.name = 'Singapore Grand Prix' ORDER BY cs.points DESC LIMIT 1	formula_1
SELECT forname, surname, dob FROM drivers WHERE nationality = 'Austrian' AND STRFTIME('%Y', dob) BETWEEN '1981' AND '1991'	formula_1
SELECT forname, surname, url, dob FROM drivers WHERE nationality = 'German' AND STRFTIME('%Y', dob) BETWEEN '1971' AND '1985' ORDER BY dob DESC	formula_1
SELECT LOCATION, COUNTRY, LAT, LNG FROM circuits WHERE NAME = 'Hungaroring'	formula_1
SELECT      c.constructorId,      c.name AS constructorName,      c.nationality,      SUM(cs.points) AS totalPoints FROM      constructorStandings cs JOIN      constructors c ON cs.constructorId = c.constructorId JOIN      races r ON cs.raceId = r.raceId WHERE      r.name = 'Monaco Grand Prix'      AND r.year BETWEEN 1980 AND 2010 GROUP BY      c.constructorId,      c.name,      c.nationality ORDER BY      totalPoints DESC LIMIT 1;	formula_1
SELECT AVG(T2.points) AS average_score FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton' AND T3.country = 'Turkey';	formula_1
SELECT AVG(COUNT(*)) AS avg_races_per_year FROM races WHERE date BETWEEN '2000-01-01' AND '2010-12-31'	formula_1
SELECT nationality FROM drivers GROUP BY nationality ORDER BY COUNT(*) DESC LIMIT 1	formula_1
SELECT SUM(wins) FROM driverStandings WHERE position = 91	formula_1
SELECT T2.name FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid ORDER BY T1.fastestlapspeed DESC LIMIT 1;	formula_1
SELECT T1.location || ', ' || T1.country AS full_location FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid ORDER BY T2.date DESC LIMIT 1	formula_1
SELECT T3.forename, T3.surname FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid INNER JOIN qualifying AS T3 ON T2.raceid = T3.raceid WHERE T1.name = 'Marina Bay Street Circuit' AND T2.year = 2008 AND T2.round = 3 ORDER BY T3.q3 ASC LIMIT 1	formula_1
SELECT T1.forename, T1.surname, T1.nationality, T2.name FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId ORDER BY T1.dob DESC LIMIT 1	formula_1
SELECT COUNT(T1.constructorstandingsid) FROM constructorstandings AS T1 INNER JOIN status AS T2 ON T1.statusid = T2.statusid INNER JOIN races AS T3 ON T1.raceid = T3.raceid WHERE T3.name = 'Canadian Grand Prix' AND T2.status = 'Accident'	formula_1
SELECT COUNT(wins), forename, surname FROM drivers JOIN driverStandings ON drivers.driverId = driverStandings.driverId ORDER BY dob ASC LIMIT 1	formula_1
SELECT MAX(duration) FROM pitStops;	formula_1
SELECT MIN(time) AS fastest_lap_time FROM lapTimes	formula_1
SELECT MAX(T2.duration) FROM drivers AS T1 INNER JOIN pitStops AS T2 ON T1.driverId = T2.driverId WHERE T1.surname = 'Hamilton'	formula_1
SELECT T2.lap FROM races AS T1 INNER JOIN pitstops AS T2 ON T1.raceid = T2.raceid INNER JOIN drivers AS T3 ON T3.driverid = T2.driverid WHERE T1.name = 'Australian Grand Prix' AND T1.year = 2011 AND T3.forename = 'Lewis' AND T3.surname = 'Hamilton'	formula_1
SELECT d.forename, d.surname, ps.duration FROM pitStops AS ps JOIN drivers AS d ON ps.driverId = d.driverId JOIN races AS r ON ps.raceId = r.raceId WHERE r.name = 'Australian Grand Prix' AND r.year = 2011	formula_1
SELECT T2.fastestLapTime FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton'	formula_1
SELECT d.forename, d.surname FROM drivers AS d JOIN laptimes AS lt ON d.driverid = lt.driverid ORDER BY lt.time ASC LIMIT 1	formula_1
SELECT DISTINCT T1.position FROM driverstandings AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.fastestlaptime IS NOT NULL AND T2.driverid = 1 ORDER BY T2.fastestlaptimes LIMIT 1	formula_1
SELECT T1.time FROM laptimes AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Austrian Grand Prix' ORDER BY T1.time ASC LIMIT 1	formula_1
SELECT DISTINCT T4.time FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid INNER JOIN results AS T3 ON T2.raceid = T3.raceid INNER JOIN laps AS T4 ON T3.driverid = T4.driverid WHERE T1.country = 'Italy'	formula_1
SELECT T1.name FROM circuits AS T1 JOIN lapTimes AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Austrian Grand Prix Circuit' ORDER BY T2.milliseconds ASC LIMIT 1	formula_1
SELECT T2.duration FROM results AS T1 INNER JOIN pitStops AS T2 ON T1.raceid = T2.raceid AND T1.driverid = T2.driverid WHERE T1.fastestlap IS NOT NULL	formula_1
SELECT DISTINCT c.lat, c.lng FROM circuits AS c JOIN races AS r ON c.circuitid = r.circuitid JOIN results AS res ON r.raceid = res.raceid WHERE res.fastestlaptime = '1:29.488';	formula_1
SELECT AVG(T1.milliseconds) FROM pitStops AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton'	formula_1
SELECT AVG(T1.milliseconds) FROM laps AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.country = 'Italy'	formula_1
SELECT player_api_id FROM Player_Attributes ORDER BY overall_rating DESC LIMIT 1	european_football_2
SELECT player_name FROM Player WHERE height = (SELECT MAX(height) FROM Player)	european_football_2
SELECT preferred_foot FROM Player_Attributes ORDER BY potential ASC LIMIT 1	european_football_2
SELECT COUNT(player_api_id) FROM Player_Attributes WHERE overall_rating BETWEEN 60 AND 65 AND defensive_work_rate = 'Low'	european_football_2
SELECT player_api_id FROM Player_Attributes ORDER BY crossing DESC LIMIT 5	european_football_2
SELECT l.name AS league_name, SUM(m.home_team_goal + m.away_team_goal) AS total_goals FROM Match m JOIN League l ON m.league_id = l.id WHERE m.season = '2015/2016' GROUP BY l.name ORDER BY total_goals DESC LIMIT 1;	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Match AS T2 ON T1.id = T2.home_team_api_id WHERE T2.season = '2015/2016' AND T1.team_long_name IS NOT NULL GROUP BY T1.team_long_name ORDER BY COUNT(*) ASC LIMIT 1	european_football_2
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id GROUP BY T1.player_api_id ORDER BY SUM(T1.penalties) DESC LIMIT 10;	european_football_2
SELECT T1.away_team_api_id, COUNT(*) AS win_count FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T2.name = 'Scotland Premier League' AND T1.season = '2009/2010' AND T1.away_team_goal > T1.home_team_goal GROUP BY T1.away_team_api_id ORDER BY win_count DESC LIMIT 1	european_football_2
SELECT team_api_id, buildUpPlaySpeed FROM Team_Attributes ORDER BY buildUpPlaySpeed DESC LIMIT 4	european_football_2
SELECT T1.name FROM League AS T1 INNER JOIN Match AS T2 ON T1.id = T2.league_id WHERE T2.season = '2016/2017' AND T2.home_team_goal = T2.away_team_goal GROUP BY T1.name ORDER BY COUNT(*) DESC LIMIT 1	european_football_2
SELECT strftime('%Y', 'now') - strftime('%Y', T1.birthday) AS current_age FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.date LIKE '%/%/13%' OR T2.date LIKE '%/%/14%' OR T2.date LIKE '%/%/15%' AND T2.sprint_speed >= 97	european_football_2
SELECT T2.name ,  COUNT(T1.id) FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id GROUP BY T1.league_id ORDER BY COUNT(T1.id) DESC LIMIT 1	european_football_2
SELECT AVG(height) FROM Player WHERE birthday BETWEEN '1990-01-01 00:00:00' AND '1996-01-01 00:00:00'	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE SUBSTR(date, 1, 4) = '2010' AND overall_rating = ( SELECT MAX(overall_rating) FROM Player_Attributes WHERE SUBSTR(date, 1, 4) = '2010' )	european_football_2
SELECT team_fifa_api_id FROM Team_Attributes WHERE buildUpPlaySpeed > 50 AND buildUpPlaySpeed < 60	european_football_2
SELECT T.team_long_name FROM Team AS T JOIN Team_Attributes AS TA ON T.team_api_id = TA.team_api_id JOIN Match AS M ON T.id = M.home_team_api_id OR T.id = M.away_team_api_id WHERE strftime('%Y', M.date) = '2012' GROUP BY T.team_long_name HAVING AVG(TA.buildUpPlayPassing) > (     SELECT AVG(buildUpPlayPassing)     FROM Team_Attributes )	european_football_2
SELECT CAST(SUM(CASE WHEN preferred_foot = 'left' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Player WHERE STRFTIME('%Y', birthday) BETWEEN '1987' AND '1992'	european_football_2
SELECT T2.name, SUM(T1.home_team_goal + T1.away_team_goal) AS total_goals FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id GROUP BY T2.name ORDER BY total_goals ASC LIMIT 5	european_football_2
SELECT SUM(T2.long_shots) / COUNT(T2.player_fifa_api_id) AS avg_long_shots FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Ahmed Samir Farag'	european_football_2
SELECT T1.player_name, AVG(T2.heading_accuracy) AS avg_heading_accuracy FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.height > 180 GROUP BY T1.player_name ORDER BY avg_heading_accuracy DESC LIMIT 10	european_football_2
SELECT T.team_long_name FROM Team AS T JOIN Team_Attributes AS TA ON T.team_api_id = TA.team_api_id WHERE TA.buildUpPlayDribblingClass = 'Normal' AND TA.date LIKE '2014%' AND TA.chanceCreationPassing < ( SELECT AVG(chanceCreationPassing) FROM Team_Attributes WHERE buildUpPlayDribblingClass = 'Normal' AND date LIKE '2014%' ) ORDER BY TA.chanceCreationPassing DESC	european_football_2
SELECT T2.name FROM `Match` AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.season = '2009/2010' GROUP BY T2.id HAVING AVG(T1.home_team_goal) > AVG(T1.away_team_goal)	european_football_2
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers'	european_football_2
SELECT player_name FROM Player WHERE SUBSTR(birthday, 1, 7) = '1970-10'	european_football_2
SELECT T2.attacking_work_rate FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Franco Zennaro'	european_football_2
SELECT T2.buildUpPlayPositioningClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'ADO Den Haag' AND T2.date LIKE '%/%/09';	european_football_2
SELECT T2.heading_accuracy FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Francois Affolter' AND T2.date = '2014-09-18 00:00:00'	european_football_2
SELECT T2.overall_rating FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Gabriel Tamas' AND strftime('%Y', T2.date) = '2011'	european_football_2
SELECT COUNT(*) FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T2.name = 'Scotland Premier League' AND T1.season = '2015/2016'	european_football_2
SELECT preferred_foot FROM Player ORDER BY birthday DESC LIMIT 1	european_football_2
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.potential = (SELECT MAX(potential) FROM Player_Attributes)	european_football_2
SELECT COUNT(*) FROM Player WHERE weight < 130 AND preferred_foot = 'left'	european_football_2
SELECT T1.team_short_name FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.chanceCreationPassingClass = 'Risky'	european_football_2
SELECT T2.defensive_work_rate FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'David Wilson'	european_football_2
SELECT T1.birthday FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.overall_rating DESC LIMIT 1	european_football_2
SELECT T2.name FROM Country AS T1 INNER JOIN League AS T2 ON T1.id = T2.country_id WHERE T1.name = 'Netherlands'	european_football_2
SELECT AVG(T1.home_team_goal) FROM Match AS T1 INNER JOIN Country AS T2 ON T1.country_id = T2.id WHERE T2.name = 'Poland' AND T1.season = '2010/2011'	european_football_2
SELECT p.player_name, AVG(pa.finishing) AS avg_finishing FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.height IN ((SELECT MAX(height) FROM Player), (SELECT MIN(height) FROM Player)) GROUP BY p.player_name ORDER BY avg_finishing DESC LIMIT 1	european_football_2
SELECT player_name FROM Player WHERE height > 180	european_football_2
SELECT COUNT(*) FROM Player WHERE strftime('%Y', birthday) > '1990'	european_football_2
SELECT COUNT(id) FROM Player WHERE player_name LIKE 'Adam%' AND weight > 170	european_football_2
SELECT T2.player_name FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.overall_rating > 80 AND strftime('%Y', T1.date) BETWEEN '2008' AND '2010'	european_football_2
SELECT T2.potential FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Aaron Doran'	european_football_2
SELECT player_name FROM Player WHERE preferred_foot = 'left'	european_football_2
SELECT DISTINCT T1.team_long_name FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeedClass = 'Fast'	european_football_2
SELECT T2.buildUpPlayPassingClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_short_name = 'CLB' ORDER BY T2.date DESC LIMIT 1	european_football_2
SELECT T1.team_short_name FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlayPassing > 70;	european_football_2
SELECT AVG(t2.overall_rating) FROM Player AS t1 INNER JOIN Player_Attributes AS t2 ON t1.player_api_id = t2.player_api_id WHERE t1.birthday < '1995-01-01'	european_football_2
SELECT player_name FROM Player ORDER BY height ASC LIMIT 1	european_football_2
SELECT T2.name FROM League AS T1 INNER JOIN Country AS T2 ON T1.country_id = T2.id WHERE T1.name = 'Italy Serie A'	european_football_2
SELECT T2.team_short_name FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlaySpeed = 31 AND T1.buildUpPlayDribbling = 53 AND T1.buildUpPlayPassing = 32	european_football_2
SELECT AVG(T2.overall_rating) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Aaron Doran'	european_football_2
SELECT COUNT(*) FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T2.name = 'Germany 1. Bundesliga' AND date LIKE '2008-08%' OR date LIKE '2008-09%' OR date LIKE '2008-10%'	european_football_2
SELECT T2.team_short_name FROM Match AS T1 INNER JOIN Team AS T2 ON T1.home_team_api_id = T2.team_api_id WHERE T1.home_team_goal = 10	european_football_2
SELECT p.player_name FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.balance = 61 AND pa.potential = 61;	european_football_2
SELECT (SUM(CASE WHEN T1.player_name = 'Abdou Diallo' THEN T2.ball_control ELSE 0 END) / COUNT(CASE WHEN T1.player_name = 'Abdou Diallo' THEN T2.id ELSE NULL END)) - (SUM(CASE WHEN T1.player_name = 'Aaron Appindangoye' THEN T2.ball_control ELSE 0 END) / COUNT(CASE WHEN T1.player_name = 'Aaron Appindangoye' THEN T2.id ELSE NULL END)) AS diff FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id	european_football_2
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN'	european_football_2
SELECT player_name FROM Player WHERE birthday = (SELECT MIN(birthday) FROM Player WHERE player_name IN ('Aaron Lennon', 'Abdelaziz Barrada'))	european_football_2
SELECT player_name FROM Player ORDER BY height DESC LIMIT 1	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE preferred_foot = 'left' AND attacking_work_rate = 'low'	european_football_2
SELECT T1.name FROM Country AS T1 INNER JOIN League AS T2 ON T1.id = T2.country_id WHERE T2.name = 'Belgium Jupiler League'	european_football_2
SELECT T2.name FROM Country AS T1 INNER JOIN League AS T2 ON T1.id = T2.country_id WHERE T1.name = 'Germany'	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)	european_football_2
SELECT COUNT(DISTINCT T1.player_api_id) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE strftime('%Y', T1.birthday) < '1986' AND T2.defensive_work_rate = 'High'	european_football_2
SELECT P.player_name, PA.crossing FROM Player AS P JOIN Player_Attributes AS PA ON P.player_api_id = PA.player_api_id WHERE P.player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone') ORDER BY PA.crossing DESC LIMIT 1	european_football_2
SELECT T2.heading_accuracy FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Ariel Borysiuk'	european_football_2
SELECT COUNT(T1.player_api_id) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.height > 180 AND T2.volleys > 70	european_football_2
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.volleys > 70 AND T2.dribbling > 70;	european_football_2
SELECT COUNT(*) FROM Match AS T1 INNER JOIN Country AS T2 ON T1.country_id = T2.id WHERE T2.name = 'Belgium' AND T1.season = '2008/2009';	european_football_2
SELECT T1.long_passing FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.birthday ASC LIMIT 1;	european_football_2
SELECT COUNT(*) FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T2.name = 'Belgium Jupiler League' AND SUBSTR(T1.date, 1, 7) = '2009-04'	european_football_2
SELECT T2.name FROM MATCH AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.season = '2008/2009' GROUP BY T1.league_id ORDER BY COUNT(T1.id) DESC LIMIT 1	european_football_2
SELECT CAST(SUM(T2.overall_rating) AS REAL) / COUNT(T1.player_api_id) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE strftime('%Y', T1.birthday) < '1986'	european_football_2
SELECT ((SELECT overall_rating FROM Player_Attributes AS PA JOIN Player AS P ON PA.player_api_id = P.player_api_id WHERE P.player_name = 'Ariel Borysiuk') - (SELECT overall_rating FROM Player_Attributes AS PA JOIN Player AS P ON PA.player_api_id = P.player_api_id WHERE P.player_name = 'Paulin Puel')) * 100 / (SELECT overall_rating FROM Player_Attributes AS PA JOIN Player AS P ON PA.player_api_id = P.player_api_id WHERE P.player_name = 'Paulin Puel') AS percentage_increase	european_football_2
SELECT AVG(T2.buildUpPlaySpeed) FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Heart of Midlothian'	european_football_2
SELECT AVG(T2.overall_rating) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Pietro Marino'	european_football_2
SELECT SUM(T2.crossing) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Aaron Lennox'	european_football_2
SELECT T2.chanceCreationPassing, T2.chanceCreationPassingClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Ajax' ORDER BY T2.chanceCreationPassing DESC LIMIT 1	european_football_2
SELECT T2.preferred_foot FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Abdou Diallo' ORDER BY T2.date DESC LIMIT 1	european_football_2
SELECT MAX(T2.overall_rating) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Dorlan Pabon'	european_football_2
SELECT AVG(T1.away_team_goal) FROM Match AS T1 INNER JOIN Team AS T2 ON T1.away_team_api_id = T2.team_api_id WHERE T2.team_long_name = 'Parma' AND T1.country_id IN (SELECT id FROM Country WHERE name = 'Italy')	european_football_2
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.overall_rating = 77 AND T2.date LIKE '2016-06-23%' ORDER BY T1.birthday ASC LIMIT 1	european_football_2
SELECT T2.overall_rating FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Aaron Mooy' AND T2.date LIKE '2016-02-04%'	european_football_2
SELECT T2.potential FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Francesco Parravicini' AND T2.date = '2010-08-30 00:00:00'	european_football_2
SELECT T2.attacking_work_rate FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Francesco Migliore' AND T2.date LIKE '2015-05-01%'	european_football_2
SELECT T2.defensive_work_rate FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Kevin Berigaud' AND T2.date = '2013-02-22 00:00:00'	european_football_2
SELECT T2.date FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Kevin Constant' ORDER BY T2.crossing DESC LIMIT 1	european_football_2
SELECT T2.buildUpPlaySpeedClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Willem II' AND T2.date = '2011-02-22'	european_football_2
SELECT T2.buildUpPlayDribblingClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_short_name = 'LEI' AND T2.date = '2015-09-10 00:00:00'	european_football_2
SELECT T2.buildUpPlayPassingClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'FC Lorient' AND T2.date LIKE '2010-02-22%'	european_football_2
SELECT T2.chance_creation_passing_class FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'PEC Zwolle' AND T2.date = '2013-09-20 00:00:00'	european_football_2
SELECT T2.chance_creation_crossing_class FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id INNER JOIN Match AS T3 ON T1.id = T3.home_team_api_id WHERE T1.team_long_name = 'Hull City' AND T3.date = '2010-02-22 00:00:00'	european_football_2
SELECT T2.defenceAggressionClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Hannover 96' AND T2.date LIKE '2015-09-10%'	european_football_2
SELECT AVG(T2.overall_rating) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Marko Arnautovic' AND T2.date BETWEEN '2007-02-22' AND '2016-04-21'	european_football_2
SELECT ((T2.overall_rating - T1.overall_rating) / T2.overall_rating) * 100 AS percentage_difference FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Jordan Bowery' AND T2.date = '2013-07-12' AND T1.player_name = 'Landon Donovan' AND T2.date = '2013-07-12'	european_football_2
SELECT player_name FROM Player ORDER BY height DESC LIMIT 1	european_football_2
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10;	european_football_2
SELECT player_name FROM Player WHERE (strftime('%J', 'now') - strftime('%J', birthday)) / 365.25 >= 35	european_football_2
SELECT SUM(CASE WHEN T1.player_api_id = T4.home_player_1 THEN T4.home_team_goal ELSE 0 END) AS total_home_goals FROM Player AS T1 INNER JOIN Match AS T4 ON T1.player_api_id = T4.home_player_1 WHERE T1.player_name = 'Aaron Lennon'	european_football_2
SELECT SUM(T2.away_team_goal) FROM Player AS T1 INNER JOIN Match AS T2 ON T1.player_api_id IN (T2.away_player_1, T2.away_player_2, T2.away_player_3, T2.away_player_4, T2.away_player_5, T2.away_player_6, T2.away_player_7, T2.away_player_8, T2.away_player_9, T2.away_player_10, T2.away_player_11) WHERE T1.player_name IN ('Daan Smith', 'Filipe Ferreira')	european_football_2
SELECT SUM(T1.home_team_goal) FROM Match AS T1 JOIN Player AS T2 ON T1.home_player_1 = T2.player_api_id WHERE strftime('%Y', 'now') - strftime('%Y', T2.birthday) < 30	european_football_2
SELECT player_name FROM Player WHERE player_api_id = (SELECT player_api_id FROM Player_Attributes ORDER BY overall_rating DESC LIMIT 1)	european_football_2
SELECT T1.player_name  FROM Player AS T1  INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id  ORDER BY T2.potential DESC  LIMIT 10;	european_football_2
SELECT DISTINCT T1.player_name  FROM Player AS T1  JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id  WHERE T2.attacking_work_rate = 'High'	european_football_2
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.finishing = 1 ORDER BY strftime('%J', 'now') - strftime('%J', T1.birthday) DESC LIMIT 1	european_football_2
{     "chain_of_thought_reasoning": "To find the names of players who came from Belgium, we need to join multiple tables to connect players with their countries of origin. Here's the step-by-step reasoning:\n1. We start with the Player table to get the player names.\n2. We then join the Player table with the Player_Attributes table to ensure we're looking at current attributes for each player.\n3. Next, we join the Player_Attributes table with the Match table to link players to matches they've played.\n4. We then join the Match table with the Team table to get information about the teams in the matches.\n5. Finally, we join the Team table with the Country table to identify the country of origin for each team.\nBy filtering the result where the country name is 'Belgium', we can obtain the names of players from Belgium.",     "SQL": "SELECT DISTINCT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id INNER JOIN Match AS T3 ON T1.player_api_id IN (T3.home_player_1, T3.home_player_2, T3.home_player_3, T3.home_player_4, T3.home_player_5, T3.home_player_6, T3.home_player_7, T3.home_player_8, T3.home_player_9, T3.home_player_10, T3.home_player_11, T3.away_player_1, T3.away_player_2, T3.away_player_3, T3.away_player_4, T3.away_player_5, T3.away_player_6, T3.away_player_7, T3.away_player_8, T3.away_player_9, T3.away_player_10, T3.away_player_11) INNER JOIN Team AS T4 ON CASE WHEN T1.player_api_id IN (T3.home_player_1, T3.home_player_2, T3.home_player_3, T3.home_player_4, T3.home_player_5, T3.home_player_6, T3.home_player_7, T3.home_player_8, T3.home_player_9, T3.home_player_10, T3.home_player_11) THEN T3.home_team_api_id ELSE T3.away	european_football_2
SELECT DISTINCT T3.country FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id INNER JOIN Team AS T4 ON T2.player_api_id IN (T4.home_player_1, T4.home_player_2, T4.home_player_3, T4.home_player_4, T4.home_player_5, T4.home_player_6, T4.home_player_7, T4.home_player_8, T4.home_player_9, T4.home_player_10, T4.home_player_11) INNER JOIN Country AS T3 ON T4.team_country_id = T3.id WHERE T1.vision > 89	european_football_2
SELECT T2.name, AVG(T1.weight)	european_football_2
SELECT T1.team_long_name FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeedClass = 'Slow'	european_football_2
SELECT T2.team_short_name FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.chanceCreationPassingClass = 'Safe'	european_football_2
SELECT AVG(T1.height) FROM Player AS T1 JOIN Team AS T2 ON T1.player_api_id = T2.team_api_id JOIN Match AS T3 ON T2.id IN (T3.home_team_api_id, T3.away_team_api_id) WHERE T2.team_long_name LIKE '%Italy%'	european_football_2
SELECT player_name FROM Player WHERE height > 180 ORDER BY player_name ASC LIMIT 3	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND birthday > '1990'	european_football_2
SELECT ( SELECT jumping FROM Player_Attributes WHERE id = 6 ) - ( SELECT jumping FROM Player_Attributes WHERE id = 23 ) AS difference	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE preferred_foot = 'right' ORDER BY potential ASC LIMIT 5	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE preferred_foot = 'left' AND crossing = (     SELECT MAX(crossing)     FROM Player_Attributes     WHERE preferred_foot = 'left' );	european_football_2
SELECT CAST(COUNT(*) AS REAL) * 100 / ( SELECT COUNT(*) FROM Player_Attributes ) AS percentage FROM Player_Attributes WHERE strength > 80 AND stamina > 80	european_football_2
SELECT T2.name  FROM League AS T1  INNER JOIN Country AS T2  ON T1.country_id = T2.id  WHERE T1.name = 'Poland Ekstraklasa'	european_football_2
SELECT T1.home_team_goal, T1.away_team_goal FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.date LIKE '2008-09-24%' AND T2.name = 'Belgium Jupiler League'	european_football_2
SELECT T2.sprint_speed, T2.agility, T2.acceleration FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Alexis Blin'	european_football_2
SELECT T2.buildUpPlaySpeedClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'KSV Cercle Brugge'	european_football_2
SELECT COUNT(*) FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.season = '2015/2016' AND T2.name = 'Italy Serie A'	european_football_2
SELECT MAX(T1.home_team_goal) FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T2.name = 'Netherlands Eredivisie'	european_football_2
SELECT T2.finishing, T2.curve FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T1.weight DESC LIMIT 1	european_football_2
SELECT T2.name FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.season = '2015/2016' GROUP BY T2.name ORDER BY COUNT(T1.id) DESC LIMIT 4	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id ORDER BY T2.away_team_goal DESC LIMIT 1;	european_football_2
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.overall_rating DESC LIMIT 1	european_football_2
SELECT CAST(SUM(CASE WHEN T2.height < 180 AND T2.overall_rating > 70 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.player_api_id) AS percentage FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id;	european_football_2
SELECT      SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) AS InpatientCount,     SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END) AS OutpatientCount,     (SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END)) * 100.0 /      (SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) + SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END)) AS DeviationPercentage FROM      Patient WHERE      SEX = 'M';	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN STRFTIME('%Y', Birthday) > '1930' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(ID) FROM Patient WHERE SEX = 'F'	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(ID) FROM Patient WHERE strftime('%Y', Birthday) BETWEEN '1930' AND '1940'	thrombosis_prediction
SELECT      CAST(SUM(CASE WHEN T1.Admission = '+' THEN 1 ELSE 0 END) AS REAL) /      SUM(CASE WHEN T1.Admission = '-' THEN 1 ELSE 0 END) AS ratio FROM      Patient AS T1 JOIN      Examination AS T2 ON T1.ID = T2.ID WHERE      T1.Diagnosis = 'SLE';	thrombosis_prediction
SELECT T1.Diagnosis, T2.Date FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.ID = 30609	thrombosis_prediction
SELECT T1.SEX, T1.Birthday, T2.`Examination Date`, T2.Symptoms FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.ID = 163109	thrombosis_prediction
SELECT T2.ID, T2.SEX, T2.Birthday FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.LDH > 500	thrombosis_prediction
SELECT T1.ID, strftime('%Y', 'now') - strftime('%Y', T1.Birthday) AS Age FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.RVVT = '+'	thrombosis_prediction
SELECT T2.ID, T2.SEX, T2.Diagnosis FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Thrombosis = 2	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE strftime('%Y', p.Birthday) = '1937' AND l.`T-CHO` >= 250	thrombosis_prediction
SELECT T2.ID, T2.SEX, T2.Diagnosis FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.ALB < 3.5	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN T2.TP < 6.0 OR T2.TP > 8.5 THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F'	thrombosis_prediction
SELECT AVG(T2.`aCL IgG`) AS average_aCL_IgG FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '+' AND STRFTIME('%Y', 'now') - STRFTIME('%Y', T1.Birthday) >= '50'	thrombosis_prediction
SELECT COUNT(ID) FROM Patient WHERE sex = 'F' AND STRFTIME('%Y', Description) = '1997' AND Admission = '-'	thrombosis_prediction
SELECT MIN(YEAR(`First Date`) - YEAR(Birthday)) AS Youngest_Age FROM Patient	thrombosis_prediction
SELECT COUNT(T2.sex) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE strftime('%Y', T1.`Examination Date`) = '1997' AND T1.Thrombosis = 1 AND T2.sex = 'F'	thrombosis_prediction
SELECT      (MAX(CAST(STRFTIME('%Y', CURRENT_DATE) AS INT) - CAST(STRFTIME('%Y', T1.Birthday) AS INT))) -     (MIN(CAST(STRFTIME('%Y', CURRENT_DATE) AS INT) - CAST(STRFTIME('%Y', T1.Birthday) AS INT))) AS AgeGap FROM      Patient AS T1 JOIN      Laboratory AS T2 ON T1.ID = T2.ID WHERE      T2.TG >= 200;	thrombosis_prediction
SELECT T2.Symptoms, T2.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Symptoms IS NOT NULL ORDER BY T1.Birthday DESC LIMIT 1;	thrombosis_prediction
SELECT AVG(COUNT(Laboratory.ID)) AS Average_Male_Patients FROM Laboratory INNER JOIN Patient ON Laboratory.ID = Patient.ID WHERE Laboratory.Date BETWEEN '1998-01-01' AND '1998-12-31' AND Patient.SEX = 'M' GROUP BY strftime('%Y-%m', Laboratory.Date)	thrombosis_prediction
SELECT T1.`First Date`, strftime('%Y', T1.`First Date`) - strftime('%Y', T1.Birthday) AS Age FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis LIKE '%SJS%' ORDER BY T1.Birthday ASC LIMIT 1	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T1.SEX = 'M' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T1.SEX = 'F' THEN 1 ELSE 0 END) AS Ratio FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE (T1.SEX = 'M' AND T2.UA <= 8.0) OR (T1.SEX = 'F' AND T2.UA <= 6.5)	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE strftime('%Y', T2.`Examination Date`) - strftime('%Y', T1.`First Date`) >= 1	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T1.Birthday) < STRFTIME('%Y', T2.`Examination Date`) - 18 AND STRFTIME('%Y', T2.`Examination Date`) BETWEEN '1990' AND '1993'	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p INNER JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.`T-BIL` >= 2.0	thrombosis_prediction
SELECT T1.Diagnosis FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.`Examination Date` BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY T1.Diagnosis ORDER BY COUNT(T1.Diagnosis) DESC LIMIT 1	thrombosis_prediction
SELECT AVG(1999 - strftime('%Y', T1.Birthday)) AS AverageAge FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.Date BETWEEN '1991-10-01' AND '1991-10-30'	thrombosis_prediction
SELECT T2.`Examination Date`, T2.HGB, STRFTIME('%Y', T2.`Examination Date`) - STRFTIME('%Y', T1.Birthday) AS Age, T1.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID ORDER BY T2.HGB DESC LIMIT 1	thrombosis_prediction
SELECT T2.ANA FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.ID = 3605340 AND T2.`Examination Date` = '1996-12-02'	thrombosis_prediction
SELECT CASE WHEN T-CHO < 250 THEN 'Normal' ELSE 'Abnormal' END AS Cholesterol_Status FROM Laboratory WHERE ID = 2927464 AND Date = '1995-09-04'	thrombosis_prediction
SELECT SEX FROM Patient WHERE Diagnosis = 'AORTITIS' ORDER BY First_Date ASC LIMIT 1	thrombosis_prediction
SELECT L.aCL_IgM FROM Laboratory AS L JOIN Patient AS P ON L.ID = P.ID WHERE P.Description = '1994-02-19' AND L.Date = '1993-11-12'	thrombosis_prediction
SELECT T2.SEX FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Date = '1992-06-12' AND T1.GPT = 9	thrombosis_prediction
SELECT      strftime('%Y', T1.Date) - strftime('%Y', T2.Birthday) AS Age FROM      Laboratory AS T1 INNER JOIN      Patient AS T2 ON      T1.ID = T2.ID WHERE      T1.Date = '1991-10-21' AND      T1.UA = '8.4';	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.`First Date` = '1991-06-13' AND T2.Diagnosis = 'SJS' AND STRFTIME('%Y', T1.Date) = '1995'	thrombosis_prediction
SELECT T2.Diagnosis AS Original_Diagnose FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'SLE' AND T1.`Examination Date` = '1997-01-27';	thrombosis_prediction
SELECT T1.Symptoms FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Birthday = '1959-03-01' AND T1.`Examination Date` = '1993-09-27';	thrombosis_prediction
SELECT SUM(CASE WHEN T2.Date LIKE '1981-12-%' THEN T1.`T-CHO` ELSE 0 END) - SUM(CASE WHEN T2.Date LIKE '1981-11-%' THEN T1.`T-CHO` ELSE 0 END) AS DecreaseRate FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Birthday = '1959-02-18'	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient AS p JOIN Examination AS e ON p.ID = e.ID WHERE p.Diagnosis LIKE '%Behcet%' AND e.`Examination Date` BETWEEN '1997-01-01' AND '1997-12-31'	thrombosis_prediction
SELECT DISTINCT T1.ID FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.`Examination Date` BETWEEN '1987-07-06' AND '1996-01-31' AND T2.GPT > 30 AND T2.ALB < 4	thrombosis_prediction
SELECT ID FROM Patient WHERE SEX = 'F' AND strftime('%Y', Birthday) = '1964' AND Admission = '+'	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE Thrombosis = 2 AND ANA = 'S' AND `aCL IgM` > ( SELECT AVG(`aCL IgM`) * 1.2 FROM Examination WHERE Thrombosis = 2 AND ANA = 'S' )	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN UA <= 6.5 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Laboratory WHERE U-PRO > 0 AND U-PRO < 30	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN Diagnosis = 'BEHCET' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(ID) FROM Patient WHERE SEX = 'M' AND STRFTIME('%Y', First_Date) = '1981'	thrombosis_prediction
SELECT DISTINCT P.ID, P.Description FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.Admission = '-' AND L.Date LIKE '1991-10%' AND L.T_BIL < 2.0	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`ANA Pattern` != 'P' AND T1.SEX = 'F' AND STRFTIME('%Y', T1.Birthday) BETWEEN '1980' AND '1989'	thrombosis_prediction
SELECT DISTINCT T1.SEX FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T2.Diagnosis = 'PSS' AND T3.CRP = 2 AND T3.CRE = 1 AND T3.LDH = 123	thrombosis_prediction
SELECT AVG(T2.ALB) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND T2.PLT > 400 AND T1.Diagnosis = 'SLE'	thrombosis_prediction
SELECT Symptoms FROM Examination WHERE Diagnosis = 'SLE' GROUP BY Symptoms ORDER BY COUNT(Symptoms) DESC LIMIT 1	thrombosis_prediction
SELECT MIN(Description), Diagnosis FROM Patient WHERE ID = 48473	thrombosis_prediction
SELECT COUNT(T1.ID) AS Female_Patients_with_APS FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND T2.Diagnosis = 'APS';	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE STRFTIME('%Y', Date) = '1997' AND (TP < 6 OR TP > 8.5)	thrombosis_prediction
SELECT      (CAST(SUM(CASE WHEN Diagnosis LIKE '%SLE%' THEN 1 ELSE 0 END) AS REAL) * 100) / COUNT(*)  FROM      Examination  WHERE      Symptoms LIKE '%thrombocytopenia%'	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(ID) FROM Patient WHERE strftime('%Y', Birthday) = '1980' AND Diagnosis = 'RA'	thrombosis_prediction
SELECT COUNT(T1.ID)  FROM Patient AS T1  INNER JOIN Examination AS T2 ON T1.ID = T2.ID  WHERE T2.`Examination Date` BETWEEN '1995' AND '1997'  AND T2.Diagnosis LIKE '%Behcet%'  AND T1.SEX = 'M'  AND T1.Admission = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND T2.WBC < 3.5	thrombosis_prediction
SELECT DATEDIFF(T2.`Examination Date`, T1.`First Date`) AS DaysDifference FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.ID = 821298;	thrombosis_prediction
SELECT CASE WHEN T2.UA IS NOT NULL AND ((T2.UA > 8.0 AND T1.SEX = 'M') OR (T2.UA > 6.5 AND T1.SEX = 'F')) THEN 'Yes' ELSE 'No' END AS Normal_Uric_Acid FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.ID = 57266	thrombosis_prediction
SELECT Date FROM Laboratory WHERE ID = 48473 AND GOT >= 60	thrombosis_prediction
SELECT T2.SEX, T2.Birthday  FROM Laboratory AS T1  INNER JOIN Patient AS T2 ON T1.ID = T2.ID  WHERE STRFTIME('%Y', T1.Date) = '1994' AND T1.GOT < 60;	thrombosis_prediction
SELECT P.ID FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.GPT >= 60	thrombosis_prediction
SELECT DISTINCT T2.Diagnosis FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.GPT > 60 ORDER BY T2.Birthday ASC	thrombosis_prediction
SELECT AVG(LDH) FROM Laboratory WHERE LDH < 500	thrombosis_prediction
SELECT P.ID, strftime('%Y', 'now') - strftime('%Y', P.Birthday) AS Age FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE L.LDH BETWEEN 600 AND 800	thrombosis_prediction
SELECT P.Admission FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE L.ALPH > 300	thrombosis_prediction
SELECT T1.ID, T2.ALP FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Birthday = '1982-04-01' AND T2.ALP < 300	thrombosis_prediction
SELECT DISTINCT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.TP < 6.0	thrombosis_prediction
SELECT P.ID, (L.TP - 8.5) AS TP_Deviation FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'F' AND L.TP > 8.5	thrombosis_prediction
SELECT P.ID, P.Birthday FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.SEX = 'M' AND (L.ALB <= 3.5 OR L.ALB >= 5.5) ORDER BY P.Birthday DESC	thrombosis_prediction
SELECT CASE WHEN T2.ALB BETWEEN 3.5 AND 5.5 THEN 'Within Normal Range' ELSE 'Not Within Normal Range' END AS Albumin_Range FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T1.Birthday) = '1982'	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T2.UA > 6.5 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F'	thrombosis_prediction
SELECT P.ID, AVG(L.UA) AS Average_UA FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE (P.SEX = 'M' AND L.UA < 8.0) OR (P.SEX = 'F' AND L.UA < 6.5) GROUP BY P.ID ORDER BY L.Date DESC LIMIT 1	thrombosis_prediction
SELECT T2.ID, T2.SEX, T2.Birthday FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.UN = 29	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday FROM Patient AS P INNER JOIN Laboratory AS L ON P.ID = L.ID WHERE P.Diagnosis = 'RA' AND L.UN < 30	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.CRE >= 1.5	thrombosis_prediction
SELECT CASE WHEN SUM(CASE WHEN T2.CRE >= 1.5 THEN 1 ELSE 0 END) AS MaleCount > SUM(CASE WHEN T2.CRE >= 1.5 THEN 1 ELSE 0 END) AS FemaleCount THEN 'True' ELSE 'False' END AS Result FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.CRE IS NOT NULL	thrombosis_prediction
SELECT T1.ID, T1.sex, T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.`T-BIL` = ( SELECT MAX(`T-BIL`) FROM Laboratory )	thrombosis_prediction
SELECT GROUP_CONCAT(DISTINCT L.ID), P.SEX FROM Laboratory AS L JOIN Patient AS P ON L.ID = P.ID WHERE L.T_BIL >= 2.0 GROUP BY P.SEX	thrombosis_prediction
SELECT T2.ID, T1.T-CHO FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID ORDER BY T2.Birthday ASC, T1.T-CHO DESC LIMIT 1	thrombosis_prediction
SELECT AVG(STRFTIME('%Y', 'now') - STRFTIME('%Y', Birthday)) AS AverageAge FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.`T-CHO` >= 250	thrombosis_prediction
SELECT T2.ID, T2.Diagnosis FROM Laboratory AS T1 LEFT JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.TG > 300;	thrombosis_prediction
SELECT ID FROM Laboratory WHERE TG >= 200	thrombosis_prediction
SELECT DISTINCT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '-' AND T2.CPK < 250	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T1.Birthday) BETWEEN '1936' AND '1956' AND T1.SEX = 'M' AND T2.CPK >= 250	thrombosis_prediction
SELECT P.ID, P.SEX, STRFTIME('%Y', CURRENT_TIMESTAMP) - STRFTIME('%Y', P.Birthday) AS Age FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE L.GLU >= 180 AND L.T_CHO < 250	thrombosis_prediction
SELECT P.ID, L.GLU FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE STRFTIME('%Y', P.Description) = '1991' AND L.GLU < 180	thrombosis_prediction
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.WBC <= 3.5 OR T2.WBC >= 9.0 GROUP BY T1.SEX ORDER BY JULIANDAY(T1.First_Date) - JULIANDAY(T1.Birthday) ASC	thrombosis_prediction
SELECT P.ID, strftime('%Y', 'now') - strftime('%Y', P.Birthday) AS Age, P.Diagnosis FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE L.RBC < 3.5	thrombosis_prediction
SELECT DISTINCT P.ID, P.SEX, P.Birthday, P.First_Date, P.Admission FROM Patient AS P JOIN Examination AS E ON P.ID = E.ID JOIN Laboratory AS L ON P.ID = L.ID WHERE P.SEX = 'F' AND (     STRFTIME('%Y', CURRENT_TIMESTAMP) - STRFTIME('%Y', P.Birthday) ) >= 50 AND (L.RBC <= 3.5 OR L.RBC >= 6.0);	thrombosis_prediction
SELECT DISTINCT P.ID, P.SEX FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.Admission = '-' AND L.HGB < 10	thrombosis_prediction
SELECT T1.ID, T1.SEX FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'SLE' AND 10 < T2.HGB < 17 ORDER BY T1.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT T2.ID, STRFTIME('%Y', CURRENT_TIMESTAMP) - STRFTIME('%Y', T2.Birthday) AS Age FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.HCT >= 52 GROUP BY T2.ID HAVING COUNT(T1.ID) >= 2	thrombosis_prediction
SELECT AVG(HCT) FROM Laboratory WHERE Date LIKE '1991%' AND HCT < 29	thrombosis_prediction
SELECT SUM(CASE WHEN PLT < 100 THEN 1 ELSE 0 END) - SUM(CASE WHEN PLT > 400 THEN 1 ELSE 0 END) AS difference FROM Laboratory WHERE PLT IS NOT NULL	thrombosis_prediction
SELECT DISTINCT T2.ID FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE strftime('%Y', T1.Date) = '1984' AND strftime('%Y', 'now') - strftime('%Y', T2.Birthday) < 50 AND T1.PLT BETWEEN 100 AND 400	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T2.SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.ID) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', 'now') - STRFTIME('%Y', T2.Birthday) > 55 AND T1.PT >= 14	thrombosis_prediction
SELECT DISTINCT P.ID FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE strftime('%Y', P.`First Date`) > '1992' AND L.PT < 14	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.`Examination Date` > '1997-01-01' AND T2.APTT < 45	thrombosis_prediction
{             "Step": 1,             "Action": "Identify the relevant tables",             "Reasoning": "The information about APTT and thrombosis is stored in the `Laboratory` table, while patient details are stored in the `Patient` table. Since there is a foreign key relationship between these two tables, we can join them based on the `ID` column."         }	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Sex = 'M' AND T1.WBC BETWEEN 3.5 AND 9.0 AND (T1.FG <= 150 OR T1.FG >= 450)	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Birthday > '1980-01-01' AND (T2.FG < 150 OR T2.FG > 450)	thrombosis_prediction
SELECT DISTINCT T2.Diagnosis FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.`U-PRO` >= 30	thrombosis_prediction
SELECT P.ID FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.`U-PRO` > 0 AND L.`U-PRO` < 30 AND P.Diagnosis = 'SLE'	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE IGG >= 2000	thrombosis_prediction
SELECT COUNT(ID) FROM Examination WHERE IGG > 900 AND IGG < 2000 AND Symptoms IS NOT NULL	thrombosis_prediction
SELECT T2.Diagnosis FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.IGA BETWEEN 80 AND 500 ORDER BY T1.IGA DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT T2.ID) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.IGA BETWEEN 80 AND 500 AND STRFTIME('%Y', T2.`First Date`) >= '1990'	thrombosis_prediction
SELECT T1.Diagnosis FROM Examination AS T1 WHERE T1.`aCL IgM` <= 40 OR T1.`aCL IgM` >= 400 GROUP BY T1.Diagnosis ORDER BY COUNT(T1.Diagnosis) DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.CRP = '+' AND T2.Description IS NULL	thrombosis_prediction
SELECT COUNT(DISTINCT L.ID) FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE L.CRE >= 1.5 AND strftime('%Y', 'now') - strftime('%Y', P.Birthday) < 70;	thrombosis_prediction
SELECT COUNT(DISTINCT T2.ID) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE (T1.RA LIKE '-%' OR T1.RA LIKE '+-%') AND T1.KCT = '+'	thrombosis_prediction
SELECT DISTINCT T1.Diagnosis FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE strftime('%Y', T1.Birthday) >= '1985' AND T2.RA IN ('-', '+-')	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday IS NOT NULL AND strftime('%Y', 'now') - strftime('%Y', p.Birthday) > 60 AND l.RF < 20	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Examination WHERE RF < 20 AND Thrombosis = 0	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.C3 > 35 AND T1.`ANA Pattern` = 'P'	thrombosis_prediction
SELECT ID FROM Examination WHERE `aCL IgA` = ( SELECT MAX(`aCL IgA`) FROM Examination WHERE HCT NOT BETWEEN 29 AND 52 )	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T2.Thrombosis = 1 AND T3.C4 > 10	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE (T2.RNP = '-' OR T2.RNP = '+-') AND T1.Admission = '+'	thrombosis_prediction
SELECT T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.RNP NOT IN ('-', '+-') ORDER BY T1.Birthday DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE (T1.SM = '-' OR T1.SM = '+-') AND T1.Thrombosis = 0	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.SM NOT IN ('negative', '0') ORDER BY T1.Birthday DESC LIMIT 3	thrombosis_prediction
SELECT DISTINCT T1.ID FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.`Examination Date` > '1997-01-01' AND T2.SC170 IN ('negative', '0')	thrombosis_prediction
SELECT T1.ID FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SC170 IN ('negative', '0') INTERSECT SELECT T1.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND T2.Symptoms IS NULL	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T1.`First Date`) < '2000' AND T2.SSA IN ('-', '+')	thrombosis_prediction
SELECT ID FROM Patient WHERE SSA NOT IN ('negative', '0') ORDER BY First_Date ASC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Examination WHERE SSB IN ('-', '+-') AND Diagnosis = 'SLE'	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.SSB IN ('negative', '0') AND T2.Symptoms IS NOT NULL	thrombosis_prediction
SELECT COUNT(DISTINCT T2.ID) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.CENTROMEA IN ('-', '+-') AND T1.SSB IN ('-', '+-') AND T2.SEX = 'M'	thrombosis_prediction
SELECT DISTINCT T1.Diagnosis FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.DNA >= 8	thrombosis_prediction
SELECT COUNT(DISTINCT T2.ID) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.DNA < 8 AND T2.Description IS NULL	thrombosis_prediction
SELECT COUNT(T2.ID) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.IGG BETWEEN 900 AND 2000 AND T2.Admission = '+'	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T2.Diagnosis = 'SLE' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.ID) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.GOT >= 60	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.SEX = 'M' AND T1.GOT < 60	thrombosis_prediction
SELECT T2.Birthday FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.GOT >= 60 ORDER BY T2.Birthday DESC LIMIT 1	thrombosis_prediction
SELECT T2.Birthday FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.GPT < 60 ORDER BY T1.GPT DESC LIMIT 3	thrombosis_prediction
SELECT COUNT(T2.SEX) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.GOT < 60 AND T2.SEX = 'M'	thrombosis_prediction
SELECT T1.`First Date` FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.LDH < 500 ORDER BY T2.LDH DESC LIMIT 1	thrombosis_prediction
SELECT T2.`Examination Date` FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.LDH >= 500 ORDER BY T2.`Examination Date` DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(T2.ID) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.ALP >= 300 AND T2.Admission = '+'	thrombosis_prediction
SELECT COUNT(DISTINCT L.ID) FROM Laboratory AS L INNER JOIN Patient AS P ON L.ID = P.ID WHERE L.ALP < 300 AND P.Admission = '-'	thrombosis_prediction
SELECT T2.Diagnosis FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.TP < 6.0	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis LIKE '%SJS%' AND T2.TP BETWEEN 6.0 AND 8.5	thrombosis_prediction
SELECT DISTINCT T1.`Examination Date` FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.ALB BETWEEN 3.5 AND 5.5	thrombosis_prediction
SELECT COUNT(T2.ID) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.SEX = 'M' AND T1.ALB BETWEEN 3.5 AND 5.5 AND T1.TP BETWEEN 6.0 AND 8.5	thrombosis_prediction
SELECT MAX(aCL_IgG), MAX(aCL_IgM), MAX(aCL_IgA) FROM Examination WHERE ID IN (SELECT ID FROM Patient WHERE SEX = 'F') AND UA > 6.50	thrombosis_prediction
SELECT MAX(ANA) FROM Examination WHERE CRE < 1.5 AND ANA IS NOT NULL	thrombosis_prediction
SELECT ID FROM Laboratory WHERE CRE < 1.5 ORDER BY aCL_IgA DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.`T-BIL` >= 2.0 AND T2.`ANA Pattern` LIKE '%P%'	thrombosis_prediction
SELECT ANA FROM Laboratory WHERE T_BIL < 2.0 ORDER BY T_BIL DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(ID) FROM Examination WHERE T-CHO >= 250 AND KCT = '-'	thrombosis_prediction
SELECT COUNT(DISTINCT T2.ID) FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.T_cho < 250 AND T2.ANA_Pattern = 'P';	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.TG < 200 AND T1.Symptoms IS NOT NULL	thrombosis_prediction
SELECT T2.Diagnosis FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.TG < 200 ORDER BY T1.TG DESC LIMIT 1	thrombosis_prediction
SELECT DISTINCT T1.ID FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Thrombosis = 0 AND T2.CPK < 250	thrombosis_prediction
SELECT COUNT(T1.ID)  FROM Examination AS T1  INNER JOIN Patient AS T2 ON T1.ID = T2.ID  WHERE T1.CPK < 250 AND (T1.KCT = '+' OR T1.RVVT = '+' OR T1.LAC = '+');	thrombosis_prediction
SELECT T2.Birthday FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.GLU > 180 ORDER BY T2.Birthday ASC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Examination WHERE GLU < 180 AND Thrombosis = 0	thrombosis_prediction
SELECT COUNT(ID) FROM Laboratory WHERE Admission = '+' AND WBC BETWEEN 3.5 AND 9.0	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'SLE' AND T2.WBC BETWEEN 3.5 AND 9.0	thrombosis_prediction
SELECT DISTINCT T2.ID FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE (T1.RBC <= 3.5 OR T1.RBC >= 6.0) AND T2.Admission = '-'	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) AS Patient_Count FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.PLT BETWEEN 100 AND 400 AND T2.Diagnosis IS NOT NULL;	thrombosis_prediction
SELECT DISTINCT T2.PLT FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'MCTD' AND T2.PLT BETWEEN 100 AND 400	thrombosis_prediction
SELECT AVG(T2.PT) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.PT < 14	thrombosis_prediction
SELECT COUNT(ID) FROM Examination WHERE (Thrombosis = 1 OR Thrombosis = 2) AND PT < 14;	thrombosis_prediction
SELECT T3.major_name FROM member AS T1 INNER JOIN link_to_major AS T2 ON T1.link_to_major = T2.major_id INNER JOIN major AS T3 ON T2.major_id = T3.major_id WHERE T1.first_name = 'Angela' AND T1.last_name = 'Sanders'	student_club
SELECT COUNT(*) FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.college = 'College of Engineering'	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id INNER JOIN attendance AS T3 ON T1.member_id = T3.link_to_member WHERE T2.department = 'Art and Design' AND T1.position = 'Member'	student_club
SELECT COUNT(DISTINCT T1.link_to_member) FROM attendance AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'Women''s Soccer'	student_club
SELECT event_id FROM event WHERE event_name = 'Women''s Soccer';	student_club
SELECT COUNT(T3.member_id) FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event INNER JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T1.event_name = 'Women''s Soccer' AND T3.t_shirt_size = 'Medium'	student_club
SELECT e.event_name, COUNT(a.link_to_event) AS attendance_count FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.club_membership = 'Student_Club' GROUP BY e.event_id ORDER BY attendance_count DESC LIMIT 1;	student_club
SELECT T3.college FROM member AS T1 INNER JOIN attendance AS T2 ON T1.member_id = T2.link_to_member INNER JOIN major AS T3 ON T1.link_to_major = T3.major_id WHERE T1.position = 'Vice President'	student_club
SELECT T3.event_name FROM member AS T1 INNER JOIN attendance AS T2 ON T1.member_id = T2.link_to_member INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T1.first_name = 'Maya' AND T1.last_name = 'Mclean'	student_club
SELECT COUNT(T1.event_id) FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event INNER JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE STRFTIME('%Y', T1.event_date) = '2019' AND T3.first_name = 'Sacha' AND T3.last_name = 'Harrison' AND T1.type LIKE '%Student_Club%'	student_club
SELECT COUNT(T2.event_id) FROM attendance AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.type = 'Meeting' GROUP BY T2.event_id HAVING COUNT(T1.link_to_member) > 10	student_club
SELECT T1.event_name FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name NOT LIKE '%Fundraiser%' GROUP BY T1.event_id HAVING COUNT(T1.event_id) > 20	student_club
SELECT CAST(COUNT(DISTINCT T2.link_to_member) AS REAL) / COUNT(T2.link_to_event) AS average_attendance FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.type = 'Meeting' AND STRFTIME('%Y', T1.event_date) = '2020'	student_club
SELECT MAX(cost) FROM expense WHERE expense_description LIKE '%meeting%' OR expense_description LIKE '%game%' OR expense_description LIKE '%election%'	student_club
SELECT COUNT(T2.member_id) FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T1.major_name = 'Environmental Engineering'	student_club
SELECT T3.first_name, T3.last_name FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event INNER JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T1.event_name = 'Laugh Out Loud';	student_club
SELECT DISTINCT T2.last_name FROM major AS T1 INNER JOIN member AS T2 ON T2.link_to_major = T1.major_id WHERE T1.major_name = 'Law and Constitutional Studies'	student_club
SELECT zip FROM member WHERE first_name = 'Sherri' AND last_name = 'Ramsey';	student_club
SELECT T3.college FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id INNER JOIN college AS T3 ON T2.college = T3.college WHERE T1.first_name = 'Tyler' AND T1.last_name = 'Hewitt'	student_club
SELECT SUM(T2.amount) FROM member AS T1 INNER JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T1.position = 'Vice President'	student_club
SELECT SUM(T1.spent) FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Food' AND T2.event_name = 'September Meeting'	student_club
SELECT T3.city, T3.state FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member JOIN zip_code AS T3 ON T1.zip = T3.zip_code WHERE T1.position = 'President'	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T2.state = 'Illinois';	student_club
SELECT SUM(T1.spent) FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'September Meeting' AND T1.category = 'Advertisement'	student_club
SELECT T1.department FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name IN ('Pierce', 'Guidi')	student_club
SELECT SUM(T2.amount) FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'October Speaker'	student_club
SELECT T3.approved FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event INNER JOIN expense AS T3 ON T2.link_to_member = T3.link_to_member WHERE T1.event_name = 'October Meeting' AND T1.event_date LIKE '2019-10-08%'	student_club
SELECT AVG(T1.cost) FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Elijah' AND T2.last_name = 'Allen' AND strftime('%m', T1.expense_date) IN ('09', '10')	student_club
SELECT SUM(CASE WHEN SUBSTR(T2.event_date, 1, 4) = '2019' THEN T1.spent ELSE 0 END) - SUM(CASE WHEN SUBSTR(T2.event_date, 1, 4) = '2020' THEN T1.spent ELSE 0 END) AS difference FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name LIKE '%Student_Club%'	student_club
SELECT location FROM event WHERE event_name = 'Spring Budget Review'	student_club
SELECT T1.cost FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id WHERE T1.expense_description = 'Posters' AND T1.expense_date = '2019-09-04'	student_club
SELECT remaining FROM budget WHERE category = 'Food' AND amount = ( SELECT MAX(amount) FROM budget WHERE category = 'Food' )	student_club
SELECT notes FROM income WHERE date_received = '2019-09-14' AND source = 'Fundraising'	student_club
SELECT COUNT(major_name) FROM major WHERE college = 'College of Humanities and Social Sciences'	student_club
SELECT phone FROM member WHERE first_name = 'Carlo' AND last_name = 'Jacobs'	student_club
SELECT T2.county FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Adela' AND T1.last_name = 'O''Gallagher'	student_club
SELECT COUNT(*) FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'November Meeting' AND T1.remaining < 0	student_club
SELECT SUM(T2.amount) FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'September Speaker'	student_club
SELECT T3.event_status FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T1.expense_date = '2019-8-20' AND T1.expense_description = 'Post Cards, Posters';	student_club
SELECT T2.major_name  FROM member AS T1  INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id  WHERE T1.first_name = 'Brent' AND T1.last_name = 'Thomason';	student_club
SELECT COUNT(T1.member_id) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Business' AND T1.t_shirt_size = 'Medium'	student_club
SELECT T2.type FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Christof' AND T1.last_name = 'Nielson'	student_club
SELECT T1.major_name FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.position = 'Vice President'	student_club
SELECT T2.state FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Sacha' AND T1.last_name = 'Harrison';	student_club
SELECT T2.department FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'President'	student_club
SELECT T2.date_received FROM member AS T1 INNER JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T1.first_name = 'Connor' AND T1.last_name = 'Hilton' AND T2.source = 'Dues'	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T2.source = 'Dues' ORDER BY T2.date_received ASC LIMIT 1	student_club
SELECT CAST((SUM(CASE WHEN T2.event_name = 'Yearly Kickoff' THEN T1.amount ELSE 0 END)) AS REAL) / SUM(CASE WHEN T2.event_name = 'October Meeting' THEN T1.amount ELSE 0 END) AS ratio FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Advertisement'	student_club
SELECT CAST(SUM(CASE WHEN T2.category = 'Parking' THEN T1.amount ELSE 0 END) AS REAL) * 100 / SUM(T1.amount) FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'November Speaker'	student_club
SELECT SUM(cost) FROM expense WHERE expense_description = 'Pizza'	student_club
SELECT COUNT(DISTINCT city) FROM zip_code WHERE county = 'Orange County' AND state = 'Virginia'	student_club
SELECT DISTINCT department FROM major WHERE college = 'College of Humanities and Social Sciences'	student_club
SELECT T2.city, T2.county, T2.state FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Amy' AND T1.last_name = 'Firth'	student_club
SELECT T2.expense_description FROM budget AS T1 INNER JOIN expense AS T2 ON T1.budget_id = T2.link_to_budget ORDER BY T1.remaining ASC LIMIT 1	student_club
SELECT m.first_name, m.last_name FROM member AS m JOIN attendance AS a ON m.member_id = a.link_to_member JOIN event AS e ON a.link_to_event = e.event_id WHERE e.event_name = 'October Meeting'	student_club
SELECT T2.college FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id GROUP BY T2.college ORDER BY COUNT(T1.member_id) DESC LIMIT 1	student_club
SELECT T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.phone = '809-555-3360'	student_club
SELECT T1.event_name FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event ORDER BY T2.amount DESC LIMIT 1	student_club
SELECT T1.expense_description FROM expense AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.position = 'Vice President'	student_club
SELECT COUNT(DISTINCT T2.link_to_member) AS attendance_count FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'Women''s Soccer'	student_club
SELECT T1.date_received FROM income AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Casey' AND T2.last_name = 'Mason'	student_club
SELECT COUNT(T1.member_id) FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T2.state = 'MD';	student_club
SELECT COUNT(*) FROM attendance AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id JOIN member AS T3 ON T1.link_to_member = T3.member_id WHERE T3.phone = '954-555-6240';	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.department = 'School of Applied Sciences, Technology and Education'	student_club
SELECT e.event_name FROM event AS e JOIN budget AS b ON e.event_id = b.link_to_event WHERE e.status = 'Closed' ORDER BY b.spent / b.amount DESC LIMIT 1	student_club
SELECT COUNT(*) FROM member WHERE position = 'President';	student_club
SELECT MAX(spent) AS max_spent FROM budget	student_club
SELECT COUNT(event_id) FROM event WHERE type = 'Meeting' AND STRFTIME('%Y', event_date) = '2020'	student_club
SELECT SUM(spent) FROM budget WHERE category = 'Food';	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member GROUP BY T2.link_to_member HAVING COUNT(T2.link_to_member) > 7	student_club
SELECT DISTINCT m.first_name, m.last_name FROM member AS m JOIN attendance AS a ON m.member_id = a.link_to_member JOIN event AS e ON a.link_to_event = e.event_id JOIN major AS mj ON m.link_to_major = mj.major_id WHERE e.event_name = 'Community Theater' AND mj.major_name = 'Interior Design'	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T2.city = 'Georgetown' AND T2.state = 'SC'	student_club
SELECT SUM(T1.amount) FROM income AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Grant' AND T2.last_name = 'Gilmour'	student_club
SELECT T2.first_name, T2.last_name FROM income AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.amount > 40	student_club
SELECT SUM(T1.cost) AS total_expense FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'Yearly Kickoff';	student_club
SELECT T3.first_name, T3.last_name    FROM budget AS T1    INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id    INNER JOIN member AS T3 ON T1.link_to_member = T3.member_id    WHERE T2.event_name = 'Yearly Kickoff';	student_club
SELECT T2.first_name, T2.last_name, T1.source FROM income AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id ORDER BY T1.amount DESC LIMIT 1	student_club
SELECT T1.event_name FROM event AS T1 JOIN expense AS T2 ON T1.event_id = T2.link_to_event ORDER BY T2.cost ASC LIMIT 1	student_club
SELECT CAST(SUM(CASE WHEN T1.event_name = 'Yearly Kickoff' THEN T2.cost ELSE 0 END) AS REAL) * 100 / SUM(T2.cost) FROM event AS T1 INNER JOIN expense AS T2 ON T1.event_id = T2.link_to_event	student_club
SELECT CAST(SUM(CASE WHEN major_name = 'Finance' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN major_name = 'Physics' THEN 1 ELSE 0 END) AS finance_physics_ratio FROM major	student_club
SELECT source, SUM(amount) AS total_amount FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' GROUP BY source ORDER BY total_amount DESC LIMIT 1	student_club
SELECT first_name, last_name, email FROM member WHERE position = 'Secretary'	student_club
SELECT COUNT(T1.member_id) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Physics Teaching'	student_club
SELECT COUNT(DISTINCT T2.link_to_member) FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'Community Theater' AND STRFTIME('%Y', T1.event_date) = '2019'	student_club
SELECT COUNT(T2.link_to_event), T3.major_name FROM member AS T1 INNER JOIN attendance AS T2 ON T1.member_id = T2.link_to_member INNER JOIN major AS T3 ON T1.link_to_major = T3.major_id WHERE T1.first_name = 'Luisa' AND T1.last_name = 'Guidi'	student_club
SELECT SUM(spent) / COUNT(spent) AS average_spent_on_food FROM budget WHERE category = 'Food' AND event_status = 'Closed'	student_club
SELECT T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Advertisement' ORDER BY T2.spent DESC LIMIT 1	student_club
SELECT CASE WHEN COUNT(*) > 0 THEN 'Yes' ELSE 'No' END AS attended FROM member AS T1 INNER JOIN attendance AS T2 ON T1.member_id = T2.link_to_member INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T1.first_name = 'Maya' AND T1.last_name = 'Mclean' AND T3.event_name = 'Women''s Soccer'	student_club
SELECT CAST(SUM(CASE WHEN type = 'Community Service' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(event_id) FROM event WHERE STRFTIME('%Y', event_date) = '2019'	student_club
SELECT T3.cost FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event INNER JOIN expense AS T3 ON T2.budget_id = T3.link_to_budget WHERE T1.event_name = 'September Speaker' AND T3.expense_description = 'Posters'	student_club
SELECT t_shirt_size FROM member GROUP BY t_shirt_size ORDER BY COUNT(t_shirt_size) DESC LIMIT 1;	student_club
SELECT T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.status = 'Closed' AND T2.remaining < 0 ORDER BY ABS(T2.remaining) ASC LIMIT 1	student_club
SELECT T2.category, SUM(T1.cost) AS total_value FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'October Meeting' AND T1.approved = 'true'	student_club
SELECT SUM(T2.amount), T2.category FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'April Speaker' GROUP BY T2.category ORDER BY T2.amount ASC	student_club
SELECT MAX(amount) FROM budget WHERE category = 'Food';	student_club
SELECT * FROM budget WHERE category = 'Advertisement' ORDER BY amount DESC LIMIT 3	student_club
SELECT SUM(cost) AS total_cost FROM expense WHERE expense_description = 'Parking';	student_club
SELECT SUM(cost) AS total_expense FROM expense WHERE expense_date = '2019-08-20'	student_club
SELECT T1.first_name, T1.last_name, SUM(T2.cost) AS total_cost FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.link_to_member = 'rec4BLdZHS2Blfp4v'	student_club
SELECT DISTINCT T1.expense_description FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Sacha' AND T2.last_name = 'Harrison'	student_club
SELECT DISTINCT T3.expense_description FROM member AS T1 INNER JOIN income AS T2 ON T1.member_id = T2.link_to_member INNER JOIN expense AS T3 ON T2.link_to_budget = T3.link_to_budget WHERE T1.t_shirt_size = 'X-Large'	student_club
SELECT m.zip FROM member AS m JOIN expense AS e ON m.member_id = e.link_to_member WHERE e.cost < 50 GROUP BY m.zip HAVING SUM(e.cost) < 50	student_club
SELECT T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Phillip' AND T1.last_name = 'Cullen'	student_club
SELECT T2.position FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T1.major_name = 'Business'	student_club
SELECT COUNT(T1.member_id) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Business' AND T1.t_shirt_size = 'Medium'	student_club
SELECT DISTINCT T1.type FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.remaining > 30	student_club
SELECT DISTINCT type FROM event WHERE location = 'MU 215'	student_club
SELECT T2.category FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_date = '2020-03-24T12:00:00'	student_club
SELECT T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Vice President';	student_club
SELECT CAST(SUM(CASE WHEN T1.position = 'Member' AND T2.major_name = 'Business' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.member_id) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id	student_club
SELECT DISTINCT T2.category FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.location = 'MU 215'	student_club
SELECT COUNT(*) FROM income WHERE amount = 50	student_club
SELECT COUNT(*) FROM member WHERE position = 'Member' AND t_shirt_size = 'X-Large'	student_club
SELECT COUNT(major_id) FROM major WHERE department = 'School of Applied Sciences, Technology and Education' AND college = 'College of Agriculture and Applied Sciences';	student_club
SELECT T2.last_name, T1.department, T1.college FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T1.major_name = 'Environmental Engineering'	student_club
SELECT T2.category FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.location = 'MU 215' AND T1.type = 'Guest Speaker' AND T2.spent = 0	student_club
SELECT T3.city, T3.state FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id INNER JOIN zip_code AS T3 ON T1.zip = T3.zip_code WHERE T1.position = 'Member' AND T2.department = 'Electrical and Computer Engineering'	student_club
SELECT T1.event_name FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T1.type = 'Social' AND T3.position = 'Vice President' AND T3.zip = (SELECT zip_code FROM zip_code WHERE city = 'Washington' AND state = 'DC')	student_club
SELECT T2.last_name, T2.position FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.expense_description = 'Pizza' AND T1.expense_date = '2019-09-10'	student_club
SELECT T2.last_name FROM event AS T1 INNER JOIN member AS T2 ON T2.member_id = T.attendance.link_to_member WHERE T1.event_name = 'Women''s Soccer' AND T2.position = 'Member'	student_club
SELECT CAST(SUM(CASE WHEN T2.amount = 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.member_id) FROM member AS T1 INNER JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T1.t_shirt_size = 'Medium' AND T1.position = 'Member'	student_club
SELECT DISTINCT T1.country FROM zip_code AS T1 WHERE T1.type = 'PO Box'	student_club
SELECT zip_code FROM zip_code WHERE type = 'PO Box' AND state = 'PR'	student_club
SELECT event_name FROM event WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20'	student_club
SELECT DISTINCT T3.link_to_event FROM income AS T1 INNER JOIN expense AS T2 ON T1.link_to_member = T2.link_to_member INNER JOIN member AS T3 ON T2.link_to_member = T3.member_id INNER JOIN attendance AS T4 ON T3.member_id = T4.link_to_member WHERE T2.cost > 50	student_club
SELECT link_to_member, link_to_event FROM expense WHERE approved = 'true' AND expense_date BETWEEN '2019-01-10' AND '2019-11-19'	student_club
SELECT T2.college FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Katy' AND T1.link_to_major = 'rec1N0upiVLy5esTO'	student_club
SELECT T1.phone FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Business' AND T2.college = 'College of Agriculture and Applied Sciences'	student_club
SELECT T2.email FROM income AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.date_received BETWEEN '2019-09-10' AND '2019-11-19' AND T1.amount > 20	student_club
SELECT COUNT(*) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Education' AND T1.position = 'Member'	student_club
SELECT CAST(SUM(CASE WHEN remaining < 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(event_id) AS percentage_over_budget FROM budget	student_club
SELECT event_id, location, status FROM event WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31'	student_club
SELECT expense_description FROM expense GROUP BY expense_description HAVING AVG(cost) > 50	student_club
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large'	student_club
SELECT CAST(SUM(CASE WHEN type = 'PO Box' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(zip_code) FROM zip_code	student_club
SELECT T1.event_name, T1.location FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.remaining > 0	student_club
SELECT DISTINCT T1.event_name, T1.event_date FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event INNER JOIN expense AS T3 ON T2.budget_id = T3.link_to_budget WHERE T3.expense_description = 'Pizza' AND T3.cost BETWEEN 50 AND 100	student_club
SELECT T2.first_name ,  T2.last_name ,  T3.major_name FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id INNER JOIN major AS T3 ON T2.link_to_major = T3.major_id WHERE T1.cost > 100	student_club
SELECT T3.city, T3.county FROM income AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id INNER JOIN zip_code AS T3 ON T2.zip = T3.zip_code WHERE T1.link_to_event IN (SELECT link_to_event FROM income GROUP BY link_to_event HAVING COUNT(*) > 40)	student_club
SELECT T1.first_name, T1.last_name, SUM(T3.cost) AS total_expense FROM member AS T1 INNER JOIN attendance AS T2 ON T1.member_id = T2.link_to_member INNER JOIN expense AS T3 ON T2.link_to_event = T3.link_to_budget GROUP BY T1.member_id HAVING COUNT(DISTINCT T2.link_to_event) > 1 ORDER BY total_expense DESC LIMIT 1	student_club
SELECT AVG(T1.cost) FROM expense AS T1 INNER JOIN income AS T2 ON T1.link_to_income = T2.income_id INNER JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T3.position != 'Member'	student_club
SELECT T1.event_name FROM event AS T1 JOIN expense AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Parking' AND T2.cost < ( SELECT SUM(T2.cost) / COUNT(T2.expense_id) FROM event AS T1 JOIN expense AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Parking' )	student_club
SELECT ( SELECT SUM(cost) FROM expense WHERE link_to_budget IN ( SELECT budget_id FROM budget WHERE link_to_event IN ( SELECT event_id FROM event WHERE type = 'Meeting' ) ) ) / ( SELECT COUNT(event_id) FROM event WHERE type = 'Meeting' ) * 100 AS percentage	student_club
SELECT b.budget_id, SUM(e.cost) AS total_cost FROM budget b JOIN expense e ON b.budget_id = e.link_to_budget WHERE e.expense_description = 'Water, chips, and cookies' GROUP BY b.budget_id ORDER BY total_cost DESC LIMIT 1;	student_club
SELECT T1.first_name, T1.last_name, SUM(T2.cost) AS total_spent FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member GROUP BY T1.member_id ORDER BY total_spent DESC LIMIT 5;	student_club
SELECT T2.first_name, T2.last_name, T2.phone FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.cost > ( SELECT AVG(cost) FROM expense )	student_club
SELECT (SUM(CASE WHEN T2.state = 'New Jersey' THEN 1 ELSE 0 END) / COUNT(T1.position)) - (SUM(CASE WHEN T2.state = 'Vermont' THEN 1 ELSE 0 END) / COUNT(T1.position)) AS diff_percentage FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T2.state IN ('New Jersey', 'Vermont')	student_club
SELECT T2.major_name, T2.department FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Garrett' AND T1.last_name = 'Gerke';	student_club
SELECT T2.first_name, T2.last_name, T1.cost FROM expense AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.expense_description = 'Water, Veggie tray, supplies'	student_club
SELECT T2.last_name, T2.phone FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T1.major_name = 'Elementary Education'	student_club
SELECT T2.category, T2.amount FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'January Speaker'	student_club
SELECT T2.event_name FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Food'	student_club
SELECT T.first_name, T.last_name, I.amount FROM member AS T INNER JOIN income AS I ON T.member_id = I.link_to_member WHERE I.date_received = '2019-09-09'	student_club
SELECT T2.category FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id WHERE T1.expense_description = 'Posters'	student_club
SELECT T1.first_name, T1.last_name, T2.college FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Secretary'	student_club
SELECT SUM(T1.spent), T2.event_name FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Speaker Gifts'	student_club
SELECT T3.city FROM member AS T1 INNER JOIN attendance AS T2 ON T1.member_id = T2.link_to_member INNER JOIN zip_code AS T3 ON T1.zip = T3.zip_code WHERE T1.first_name = 'Garrett' AND T1.last_name = 'Gerke';	student_club
SELECT T1.first_name, T1.last_name, T1.position FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T2.city = 'Lincolnton' AND T2.state = 'North Carolina'	student_club
SELECT COUNT(GasStationID) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Premium'	debit_card_specializing
SELECT CAST(COUNT(CASE WHEN Currency = 'EUR' THEN CustomerID ELSE NULL END) AS REAL) / COUNT(CASE WHEN Currency = 'CZK' THEN CustomerID ELSE NULL END) AS Ratio FROM customers	debit_card_specializing
SELECT T2.CustomerID FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date BETWEEN '201201' AND '201212' AND T2.Segment = 'LAM' ORDER BY T1.Consumption ASC LIMIT 1	debit_card_specializing
SELECT AVG(T2.Consumption) / 12 AS AverageMonthlyConsumption FROM transactions_1k AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date BETWEEN '201301' AND '201312' AND T1.CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'SME')	debit_card_specializing
SELECT c.CustomerID FROM customers AS c JOIN yearmonth AS ym ON c.CustomerID = ym.CustomerID WHERE c.Currency = 'CZK' AND ym.Date BETWEEN '201101' AND '201112' ORDER BY ym.Consumption DESC LIMIT 1	debit_card_specializing
SELECT COUNT(CustomerID) FROM yearmonth WHERE Date BETWEEN '201201' AND '201212' AND Consumption < 30000	debit_card_specializing
SELECT SUM(CASE WHEN T1.Currency = 'CZK' THEN T2.Consumption ELSE 0 END) - SUM(CASE WHEN T1.Currency = 'EUR' THEN T2.Consumption ELSE 0 END) AS ConsumptionDifference FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE SUBSTR(T2.Date, 1, 4) = '2012'	debit_card_specializing
SELECT T1.Date, SUM(T1.Consumption) AS TotalConsumption FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Currency = 'EUR' GROUP BY T1.Date ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT T1.Segment, SUM(T2.Consumption) AS TotalConsumption FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID GROUP BY T1.Segment ORDER BY TotalConsumption ASC LIMIT 1	debit_card_specializing
{     "chain_of_thought_reasoning": "First, we select the year from the date column in the yearmonth table. Then, we join the yearmonth table with the customers table to filter transactions in CZK. After filtering, we group the data by year and sum the consumption. Finally, we order the results by the sum of consumption in descending order and limit the output to the top	debit_card_specializing
SELECT T1.Date FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Segment = 'SME' AND T1.Date LIKE '2013%' ORDER BY T1.Consumption DESC LIMIT 1	debit_card_specializing
WITH CustomerConsumption AS (     SELECT          T1.Segment,          AVG(T2.Consumption) AS AvgAnnualConsumption     FROM          customers AS T1     JOIN          yearmonth AS T2 ON T1.CustomerID = T2.CustomerID     WHERE          T2.Date LIKE '2013%'     GROUP BY          T1.Segment ) SELECT      (SELECT AvgAnnualConsumption FROM CustomerConsumption WHERE Segment = 'SME') -      (SELECT AvgAnnualConsumption FROM CustomerConsumption WHERE Segment = 'LAM') AS Diff_SME_LAM,     (SELECT AvgAnnualConsumption FROM CustomerConsumption WHERE Segment = 'LAM') -      (SELECT AvgAnnualConsumption FROM CustomerConsumption WHERE Segment = 'KAM') AS Diff_LAM_KAM,     (SELECT AvgAnnualConsumption FROM CustomerConsumption WHERE Segment = 'KAM') -      (SELECT AvgAnnualConsumption FROM CustomerConsumption WHERE Segment = 'SME') AS Diff_KAM_SME;	debit_card_specializing
SELECT * FROM customers WHERE Currency = 'EUR';	debit_card_specializing
SELECT SUM(Consumption) FROM yearmonth WHERE CustomerID = 6 AND Date BETWEEN '201308' AND '201311'	debit_card_specializing
SELECT ( SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Premium' ) - ( SELECT COUNT(*) FROM gasstations WHERE Country = 'SVK' AND Segment = 'Premium' ) AS difference	debit_card_specializing
SELECT ( SELECT Consumption FROM yearmonth WHERE CustomerID = 7 AND Date = '201304' ) - ( SELECT Consumption FROM yearmonth WHERE CustomerID = 5 AND Date = '201304' ) AS Difference	debit_card_specializing
SELECT      SUM(CASE WHEN T1.Currency = 'CZK' THEN 1 ELSE 0 END) -     SUM(CASE WHEN T1.Currency = 'EUR' THEN 1 ELSE 0 END) AS difference FROM      customers AS T1 JOIN      transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE      T1.Segment = 'SME';	debit_card_specializing
SELECT T1.CustomerID FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM' AND T1.Currency = 'EUR' AND T2.Date = '201310' ORDER BY T2.Consumption DESC LIMIT 1	debit_card_specializing
SELECT c.CustomerID, SUM(y.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'KAM' GROUP BY c.CustomerID ORDER BY TotalConsumption DESC LIMIT 1	debit_card_specializing
SELECT SUM(Consumption) FROM yearmonth WHERE Date = '201305' AND CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'SME')	debit_card_specializing
SELECT CAST(SUM(CASE WHEN T2.Consumption > 46.73 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.CustomerID) FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM'	debit_card_specializing
SELECT Country, COUNT(*) AS ValueForMoneyCount FROM gasstations WHERE Segment = 'Value for money' GROUP BY Country	debit_card_specializing
SELECT CAST(SUM(CASE WHEN T1.Segment = 'KAM' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.CustomerID) FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Currency = 'EUR'	debit_card_specializing
SELECT CAST(SUM(CASE WHEN Consumption > 528.3 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(DISTINCT CustomerID) FROM yearmonth WHERE Date = '201202'	debit_card_specializing
SELECT CAST(SUM(CASE WHEN Segment = 'Premium' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM gasstations WHERE Country = 'SVK'	debit_card_specializing
SELECT CustomerID FROM yearmonth WHERE Date = '201309' ORDER BY Consumption DESC LIMIT 1	debit_card_specializing
SELECT T2.Segment, SUM(T1.Consumption) AS TotalConsumption FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date LIKE '201309%' GROUP BY T2.Segment ORDER BY TotalConsumption ASC LIMIT 1	debit_card_specializing
SELECT T1.CustomerID FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date = '201206' AND T2.Segment = 'SME' ORDER BY T1.Consumption ASC LIMIT 1;	debit_card_specializing
SELECT SUBSTR(Date, 5, 2) AS Month, MAX(Consumption) AS MaxConsumption FROM yearmonth WHERE Date LIKE '2012%' GROUP BY Month;	debit_card_specializing
SELECT MAX(TotalConsumption) AS BiggestMonthlyConsumption FROM ( SELECT T1.CustomerID, SUM(T2.Consumption) / 12 AS TotalConsumption FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Currency = 'EUR' GROUP BY T1.CustomerID )	debit_card_specializing
SELECT T3.Description FROM yearmonth AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID INNER JOIN products AS T3 ON T2.ProductID = T3.ProductID WHERE SUBSTR(T1.Date, 1, 4) = '2013' AND SUBSTR(T1.Date, 5, 2) = '09'	debit_card_specializing
SELECT T2.Country FROM yearmonth AS T1 INNER JOIN gasstations AS T2 ON T1.CustomerID = T2.GasStationID WHERE T1.Date LIKE '201306%'	debit_card_specializing
SELECT DISTINCT T2.ChainID FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Currency = 'EUR'	debit_card_specializing
SELECT DISTINCT T2.Description FROM transactions_1k AS T1 INNER JOIN products AS T2 ON T1.ProductID = T2.ProductID	debit_card_specializing
SELECT AVG(Price) FROM transactions_1k WHERE Date LIKE '2012-01%'	debit_card_specializing
SELECT COUNT(DISTINCT T1.CustomerID) FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Currency = 'EUR' AND T2.Consumption > 1000	debit_card_specializing
SELECT T2.Description FROM transactions_1k AS T1 INNER JOIN products AS T2 ON T1.ProductID = T2.ProductID INNER JOIN gasstations AS T3 ON T1.GasStationID = T3.GasStationID WHERE T3.Country = 'CZE'	debit_card_specializing
SELECT DISTINCT T1.Time FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.ChainID = 11	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE' AND T1.Price > 1000	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE' AND T1.Date > '2012-01-01'	debit_card_specializing
SELECT AVG(T1.Price) FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE'	debit_card_specializing
SELECT AVG(Price) FROM transactions_1k WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'EUR')	debit_card_specializing
SELECT CustomerID FROM transactions_1k WHERE Date = '2012-08-25' GROUP BY CustomerID ORDER BY SUM(Amount) DESC LIMIT 1	debit_card_specializing
SELECT T2.Country  FROM transactions_1k AS T1  INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID  WHERE T1.Date LIKE '2012-08-25%'  ORDER BY T1.Date, T1.Time ASC  LIMIT 1	debit_card_specializing
SELECT T2.Currency FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date = '2012-08-24' AND T1.Time = '16:25:00'	debit_card_specializing
SELECT T2.Segment FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date = '2012-08-23' AND T1.Time = '21:20:00'	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k WHERE Date = '2012-08-26' AND Time < '13:00:00' AND Price > 0	debit_card_specializing
SELECT T2.Segment FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID ORDER BY T1.Date ASC LIMIT 1	debit_card_specializing
SELECT T2.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-24' AND T1.Time = '12:42:00'	debit_card_specializing
SELECT ProductID FROM transactions_1k WHERE Date = '2012-08-23' AND Time = '21:20:00'	debit_card_specializing
SELECT T1.Date, T1.Time, SUM(T1.Amount) AS TotalSpent FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date = '2012-08-24' AND T1.Amount = 124.05 UNION SELECT T2.Date, T2.Time, SUM(T2.Consumption) AS TotalSpent FROM yearmonth AS T2 WHERE T2.CustomerID IN (SELECT CustomerID FROM transactions_1k WHERE Date = '2012-08-24' AND Amount = 124.05) AND strftime('%Y-%m', T2.Date) = '2012-01'	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-26' AND T1.Time BETWEEN '08:00:00' AND '09:00:00' AND T2.Country = 'CZE'	debit_card_specializing
SELECT T3.Currency FROM yearmonth AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID INNER JOIN customers AS T3 ON T2.CustomerID = T3.CustomerID WHERE T1.Date LIKE '%201306%' AND T2.Amount = 214582.17	debit_card_specializing
SELECT T3.Country FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID INNER JOIN gasstations AS T3 ON T1.GasStationID = T3.GasStationID WHERE T1.CardID = 667467	debit_card_specializing
SELECT T2.Currency FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date = '2012-08-24' AND T1.Amount = 548.4	debit_card_specializing
SELECT CAST(SUM(CASE WHEN T1.Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '2012-08-25'	debit_card_specializing
WITH customer_transaction AS (     SELECT t.CustomerID     FROM transactions_1k t     WHERE t.Date = '2012-08-25' AND t.Amount = 634.8 ), consumption_data AS (     SELECT ym.CustomerID, SUM(ym.Consumption) AS total_consumption     FROM yearmonth ym     JOIN customer_transaction ct ON ym.CustomerID = ct.CustomerID     GROUP BY ym.CustomerID, strftime('%Y', ym.Date) ) SELECT      (cd2.total_consumption - cd1.total_consumption) / cd1.total_consumption AS consumption_decrease_rate FROM      consumption_data cd1 JOIN      consumption_data cd2 ON      cd1.CustomerID = cd2.CustomerID AND cd1.total_consumption > cd2.total	debit_card_specializing
SELECT T1.GasStationID, SUM(T2.Amount) AS TotalRevenue FROM gasstations AS T1 INNER JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID GROUP BY T1.GasStationID ORDER BY TotalRevenue DESC LIMIT 1;	debit_card_specializing
SELECT      CAST(SUM(CASE WHEN Segment = 'Premium' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(GasStationID) AS PercentagePremium FROM      gasstations WHERE      Country = 'SVK';	debit_card_specializing
SELECT SUM(Amount) AS TotalSpent, SUM(CASE WHEN Date LIKE '2012-01-%' THEN Amount ELSE 0 END) AS JanuarySpent FROM transactions_1k WHERE CustomerID = 38508	debit_card_specializing
SELECT T2.Description FROM transactions_1k AS T1 INNER JOIN products AS T2 ON T1.ProductID = T2.ProductID GROUP BY T1.ProductID ORDER BY COUNT(T1.TransactionID) DESC LIMIT 5	debit_card_specializing
SELECT c.CustomerID, c.Segment, c.Currency, SUM(t.Price) AS TotalSpent, SUM(t.Amount) AS TotalItems, AVG(t.Price / t.Amount) AS AveragePricePerItem FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID GROUP BY c.CustomerID ORDER BY TotalSpent DESC LIMIT 1	debit_card_specializing
SELECT T2.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.ProductID = 2 ORDER BY T1.Price DESC LIMIT 1	debit_card_specializing
SELECT T2.CustomerID FROM transactions_1k AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.ProductID = 5 AND T1.Price / T1.Amount > 29	debit_card_specializing
