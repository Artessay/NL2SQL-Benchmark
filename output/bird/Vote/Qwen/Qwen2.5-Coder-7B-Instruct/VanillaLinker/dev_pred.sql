SELECT MAX("Percent (%) Eligible Free (K-12)") AS HighestEligibleFreeRate FROM frpm WHERE "County Name" = 'Alameda'; 
SELECT MIN(`Percent (%) Eligible Free (Ages 5-17)`) FROM `frpm` WHERE `School Type` = 'Continuation' LIMIT 3
SELECT DISTINCT T2.Zip FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.County = 'Fresno' AND T1.`Charter School (Y/N)` = 1; 
SELECT T1.MailStreet FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T2.`FRPM Count (K-12)` DESC LIMIT 1
;
SELECT COUNT(*) FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath > 400 AND T2.Virtual = 'F'; 
SELECT s.School, s.Magnet, s.GSoffered FROM schools s JOIN satscores sa ON s.CDSCode = sa.cds WHERE sa.NumTstTakr > 500 AND (s.Magnet = 1 OR s.GSoffered LIKE '%Magnet%') 
SELECT T2.Phone FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumGE1500 > 0 ORDER BY T1.NumGE1500 DESC LIMIT 1
SELECT SUM(T1.NumTstTakr) AS TotalSATTestTakers FROM satscores AS T1 JOIN frpm AS T2 ON T1.cds = T2.CDSCode WHERE T2.`FRPM Count (K-12)` = (SELECT MAX(`FRPM Count (K-12)`) FROM frpm WHERE `FRPM Count (K-12)` IS NOT NULL); 
SELECT COUNT(*) FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrMath > 560 AND T1.`Charter Funding Type` = 'Directly funded'; 
SELECT T1.`FRPM Count (Ages 5-17)` FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds ORDER BY T2.AvgScrRead DESC LIMIT 1
;
SELECT MAX(T1.`Percent (%) Eligible Free (Ages 5-17)`) AS HighestEligibleFreeRate FROM frpm AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumGE1500 / T2.NumTstTakr > 0.3; 
SELECT T1.Phone FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds ORDER BY T2.NumGE1500 * 1.0 / T2.NumTstTakr DESC LIMIT 3
SELECT T1.NCESSchool FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T2.`Enrollment (Ages 5-17)` DESC LIMIT 5
SELECT T2.District FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.StatusType = 'Active' GROUP BY T2.District ORDER BY AVG(T1.AvgScrRead) DESC LIMIT 1
SELECT COUNT(*) FROM satscores WHERE rtype = 'S' AND NumTstTakr < 100;
SELECT s.CDSCode, s.CharterNum, AVG(fs.AvgScrWrite) AS AvgWritingScore FROM schools s JOIN satscores fs ON s.CDSCode = fs.cds WHERE fs.AvgScrWrite > 499 AND s.CharterNum IS NOT NULL GROUP BY s.CDSCode, s.CharterNum ORDER BY AvgWritingScore DESC; 
SELECT COUNT(*) FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.City = 'Fresno' AND T2.FundingType = 'Directly funded' AND T1.NumTstTakr <= 250; 
SELECT T1.Phone FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds ORDER BY T2.AvgScrMath DESC LIMIT 1
;
SELECT COUNT(*) FROM frpm WHERE `County Name` = 'Los Angeles' AND `Free Meal Count (K-12)` > 500 AND `FRPM Count (K-12)` < 700;
SELECT T1.School FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.County = 'Contra Costa' ORDER BY T2.NumTstTakr DESC LIMIT 1
;
;
;
SELECT T1.School, T1.Street, T1.City, T1.State, T1.Zip FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`Percent (%) Eligible Free (Ages 5-17)` > 800 AND T1.StatusType = 'Active' AND T1.GSoffered = 'High School' AND T1.County = 'Monterey'
;
SELECT s.School, s.DOCType, AVG(f.[Enrollment (K-12)] - f.[Enrollment (Ages 5-17)]) AS AvgDiff FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.[Charter Funding Type] = 'Local' GROUP BY s.School, s.DOCType HAVING ABS(f.[Enrollment (K-12)] - f.[Enrollment (Ages 5-17)]) > (SELECT AVG(AvgDiff) FROM ( 	SELECT AVG(f.[Enrollment (K-12)] - f.[Enrollment (Ages 5-17)]) AS AvgDiff 	FROM frpm f 	JOIN schools s ON f.CDSCode = s.CDSCode 	WHERE f.[Charter Funding Type] = 'Local' 	GROUP BY s.School, s.DOCType) AS SubQuery) 
SELECT T1.OpenDate FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.GSoffered = 'K-12' ORDER BY T2.`Enrollment (K-12)` DESC LIMIT 1; 
SELECT T2.City FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T1.`Enrollment (K-12)` ASC LIMIT 5
SELECT T1.`Percent (%) Eligible Free (K-12)` AS EligibleFreeRate FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.StatusType = 'Active' ORDER BY T1.`Enrollment (K-12)` DESC LIMIT 10, 2; 
;
;
SELECT `Percent (%) Eligible Free (Ages 5-17)` FROM frpm WHERE `School Name` LIKE '%Kacey Gibson%'
SELECT T1.AdmEmail1 FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`Charter School (Y/N)` = 1 ORDER BY T2.`Enrollment (K-12)` ASC LIMIT 1
SELECT T2.AdmFName1, T2.AdmLName1, T2.AdmFName2, T2.AdmLName2, T2.AdmFName3, T2.AdmLName3 FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumGE1500 = ( SELECT MAX(NumGE1500) FROM satscores )
SELECT T2.Street, T2.City, T2.State, T2.Zip FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY CAST(T1.NumGE1500 AS REAL) / T1.NumTstTakr ASC LIMIT 1
SELECT T1.Website FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumTstTakr BETWEEN 2000 AND 3000; 
SELECT AVG(s.NumTstTakr) AS AvgTestTakers FROM satscores s JOIN schools sc ON s.cds = sc.CDSCode WHERE sc.City = 'Fresno' AND STRFTIME('%Y', sc.OpenDate) = '1980'; 
SELECT T1.Phone FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.District = 'Fresno Unified' ORDER BY T2.AvgScrRead ASC LIMIT 1
SELECT s.School, AVG(ss.AvgScrRead) AS AvgReadingScore FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.Virtual = 'F' GROUP BY s.County, s.School ORDER BY s.County, AvgReadingScore DESC LIMIT 5; 
SELECT T1.EILName FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds ORDER BY T2.AvgScrMath DESC LIMIT 1
SELECT AVG(AvgScrMath), T1.County FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds ORDER BY (T2.AvgScrMath + T2.AvgScrRead + T2.AvgScrWrite) ASC LIMIT 1
SELECT AVG(T1.AvgScrWrite), T2.City FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumGE1500 > 0 GROUP BY T2.City ORDER BY SUM(T1.NumTstTakr) DESC LIMIT 1
SELECT s.School, AVG(ss.AvgScrWrite) AS AvgWritingScore FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.AdmFName1 = 'Ricci' AND s.AdmLName1 = 'Ulrich' GROUP BY s.School;
SELECT T1.School FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.DOC = 31 AND T2.`Low Grade` = 'K' AND T2.`High Grade` = '12' ORDER BY T2.`Enrollment (K-12)` DESC LIMIT 1
SELECT COUNT(CASE WHEN STRFTIME('%Y', OpenDate) = '1980' THEN CDSCode ELSE NULL END) / 12 AS AvgMonthlyOpened FROM schools WHERE DOC = 52
SELECT SUM(CASE WHEN DOC = 52 THEN 1 ELSE 0 END) / SUM(CASE WHEN DOC = 54 THEN 1 ELSE 0 END) AS Ratio FROM schools; 
SELECT T1.County, T1.School, T1.ClosedDate FROM schools AS T1 WHERE T1.StatusType = 'Closed' GROUP BY T1.County ORDER BY COUNT(T1.CDSCode) DESC LIMIT 1
SELECT T2.Street, T2.School FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrMath DESC LIMIT 6, 1
SELECT T2.MailStreet, T2.School FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrRead ASC LIMIT 1
SELECT COUNT(*) FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrRead + T1.AvgScrMath + T1.AvgScrWrite >= 1500 AND T2.MailCity = 'Lakeport'
SELECT SUM(NumTstTakr) FROM satscores WHERE cds IN ( SELECT CDSCode FROM schools WHERE MailCity = 'Fresno' )
SELECT T1.School ,  T1.MailZip FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.AdmFName1 = 'Avetik' AND T1.AdmLName1 = 'Atoian'
SELECT CAST(SUM(CASE WHEN County = 'Colusa' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN County = 'Humboldt' THEN 1 ELSE 0 END) AS Ratio FROM schools WHERE MailState = 'CA'; 
SELECT COUNT(*) FROM schools WHERE MailState = 'CA' AND City = 'San Jose' AND StatusType = 'Active'; 
SELECT T1.Phone, T1.Ext FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds ORDER BY T2.AvgScrWrite DESC LIMIT 332, 1
SELECT Phone, Ext, School FROM schools WHERE Zip = '95203-3704'; 
