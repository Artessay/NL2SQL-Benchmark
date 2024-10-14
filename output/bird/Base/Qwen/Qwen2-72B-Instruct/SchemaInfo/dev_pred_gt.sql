SELECT MAX(`Free Meal Count (K-12)` / `Enrollment (K-12)`) AS eligible_free_rate FROM table_name WHERE County = 'Alameda' AND `School Level` = 'K-12';	california_schools
SELECT MIN(`Free Meal Count (Ages 5-17)`) / `Enrollment (Ages 5-17)` AS eligible_free_rate  FROM table_name  WHERE School_Type = 'Continuation'  GROUP BY `CDS Code`  ORDER BY eligible_free_rate ASC  LIMIT 3	california_schools
SELECT T2.ZipCode FROM fprm AS T1 JOIN school AS T2 ON T1.SchID = T2.SchID WHERE T1.CountyOfficeEdName = 'FRESNO COUNTY OFFICE OF EDUCATION' AND T1.`Charter School (Y/N)` = 1	california_schools
SELECT T1.StreetAddress FROM Schools AS T1 JOIN StudentCounts AS T2 ON T1.SchoolID = T2.SchoolID WHERE T2.FRPMCountK_12 = (SELECT MAX(FRPMCountK_12) FROM StudentCounts)	california_schools
SELECT T2.PhoneNumber FROM Schools AS T1 JOIN Addresses AS T2 ON T1.AddressID = T2.AddressID WHERE T1.CharterSchoolYN = 1 AND T1.OpenDate > '2000-01-01'	california_schools
SELECT COUNT(*) FROM schools WHERE Virtual = 'F' AND AVG_Math_SAT > 400	california_schools
SELECT SchoolName FROM Schools WHERE SATTestTakers > 500 AND Magnet = 1	california_schools
SELECT T2.PhoneNumber FROM SchoolTestScores AS T1 JOIN Schools AS T2 ON T1.SchoolID = T2.SchoolID WHERE T1.TestTakers > 0 AND T1.CriticalReadingMean + T1.MathematicsMean + T1.WritingMean > 1500 ORDER BY T1.TestTakers DESC LIMIT 1	california_schools
SELECT T1.SAT_Test_Takers FROM School AS T1 JOIN Student AS T2 ON T1.School_ID = T2.School_ID WHERE T2.FRPM_Count = (SELECT MAX(FRPM_Count) FROM Student WHERE Grade_Level BETWEEN 'K' AND '12')	california_schools
SELECT COUNT(*) FROM Schools WHERE Funding_Type = 'Charter' AND AVG_SAT_Math > 560;	california_schools
SELECT T2.FRPM_5_17 FROM SAT_Scores AS T1 JOIN School_Districts AS T2 ON T1.School_ID = T2.School_ID WHERE T1.Test_Type = 'Reading' ORDER BY AVG(T1.Score) DESC LIMIT 1	california_schools
SELECT SchoolCode FROM Schools WHERE (`Enrollment_K_12` + `Enrollment_Ages_5_17`) > 500;	california_schools
SELECT MAX(`Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)`) AS highest_eligible_free_rate FROM table_name WHERE (`NumGE1500` / `NumTstTakr`) > 0.3;	california_schools
SELECT T2.Phone FROM (SELECT SchoolCode, SUM(NumGE1500) AS SumNumGE1500, SUM(NumTstTakr) AS SumNumTstTakr FROM SATExcellenceRate GROUP BY SchoolCode) AS T1 JOIN School AS T2 ON T1.SchoolCode = T2.SchoolCode ORDER BY (T1.SumNumGE1500 / T1.SumNumTstTakr) DESC LIMIT 3	california_schools
SELECT T1.NCES_School_ID FROM School AS T1 JOIN Enrollment AS T2 ON T1.School_ID = T2.School_ID WHERE Age_Range = '5-17' GROUP BY T1.NCES_School_ID ORDER BY COUNT(*) DESC LIMIT 5;	california_schools
SELECT DistrictName FROM SchoolDistricts WHERE IsActive = 1 GROUP BY DistrictName ORDER BY AVG(ReadingScore) DESC LIMIT 1;	california_schools
SELECT COUNT(*) FROM Schools WHERE County = 'Alameda' AND TestTakers < 100;	california_schools
SELECT CharterNumber, AVG(WritingScore) AS AverageWritingScore  FROM Schools  WHERE WritingScore > 499 AND CharterNumber IS NOT NULL  GROUP BY CharterNumber  ORDER BY AverageWritingScore DESC;	california_schools
SELECT COUNT(*) FROM Schools WHERE Location = 'Fresno' AND Funding_Type = 'Directly Funded' AND Test_Takers <= 250;	california_schools
SELECT T1.PhoneNumber FROM Schools AS T1 JOIN TestScores AS T2 ON T1.SchoolID = T2.SchoolID WHERE T2.Subject = 'Math' GROUP BY T1.SchoolID ORDER BY AVG(T2.Score) DESC LIMIT 1;	california_schools
SELECT COUNT(*) FROM Schools WHERE County = 'Amador' AND LowGrade = 9 AND HighGrade = 12;	california_schools
SELECT COUNT(*) FROM schools WHERE district = 'Los Angeles' AND free_meals > 500 AND free_or_reduced_meals < 700 AND grade_level = 'K-12'	california_schools
SELECT SchoolName FROM Schools WHERE County = 'Contra Costa' ORDER BY TestTakers DESC LIMIT 1;	california_schools
SELECT T1.SchoolName ,  T1.StreetAddress FROM Schools AS T1 INNER JOIN SchoolAdmin AS T2 ON T1.CDSCode = T2.CDSCode WHERE ABS(T1.Enrollment_K_12 - T1.Enrollment_Ages_5_17) > 30	california_schools
SELECT T1.SchoolName FROM Schools AS T1 JOIN TestScores AS T2 ON T1.SchoolID = T2.SchoolID WHERE (T1.FreeMealCountK_12 / T1.TotalEnrollmentK_12) > 0.1 AND T2.TestScore >= 1500	california_schools
SELECT T1.FundingType FROM Schools AS T1 JOIN SATScores AS T2 ON T1.SchoolID = T2.SchoolID WHERE T1.City = 'Riverside' GROUP BY T1.SchoolName HAVING AVG(T2.AvgMathScore) > 400	california_schools
SELECT AdmFName1, AdmLName1, AdmEmail1, Street, City, State, Zip FROM Schools WHERE County = 'Monterey' AND SchoolType = 'High School' AND AgeRange = '15-17' AND Free_Reduced_Meals > 800	california_schools
SELECT S.SchoolName, AVG(A.WritingScore) AS AvgWritingScore, S.PhoneNumber FROM Schools S JOIN AssessmentResults A ON S.SchoolID = A.SchoolID WHERE (S.OpeningYear > 1991 OR S.ClosingYear < 2000) GROUP BY S.SchoolName, S.PhoneNumber;	california_schools
SELECT T1.Name ,  T1.DOC_Type FROM Schools AS T1 JOIN School_Districts AS T2 ON T1.Sponsor_District_ID  =  T2.ID WHERE T1.Funding_Type  =  'Local' AND (T1.Enrollment_K_12 - T1.Enrollment_Ages_5_17) > (SELECT AVG(Enrollment_K_12 - Enrollment_Ages_5_17) FROM Schools WHERE Funding_Type  =  'Local')	california_schools
SELECT T1.Opened FROM School AS T1 JOIN Enrollment AS T2 ON T1.SchoolID = T2.SchoolID WHERE T1.GradesOffered = 'K-12' ORDER BY T2.Enrollment DESC LIMIT 1	california_schools
SELECT T2.City FROM Schools AS T1 JOIN Addresses AS T2 ON T1.AddressID = T2.AddressID WHERE T1.Enrollment IS NOT NULL ORDER BY T1.Enrollment ASC LIMIT 5;	california_schools
SELECT T1.FreeMealCount_K_12 / T1.Enrollment_K_12 AS Eligible_Free_Rate FROM School AS T1 JOIN School_Details AS T2 ON T1.school_id = T2.school_id ORDER BY T1.Enrollment_K_12 DESC LIMIT 2 OFFSET 9	california_schools
SELECT `Eligible FRPM Rate` FROM `school_details` WHERE `Ownership Code` = 66 ORDER BY `FRPM Count (K-12)` DESC LIMIT 5	california_schools
SELECT T1.Website, T1.SchoolName FROM School AS T1 JOIN Meals AS T2 ON T1.SchoolID = T2.SchoolID WHERE T2.FreeMealCount BETWEEN 1900 AND 2000 AND T1.AgeRange = '5-17'	california_schools
SELECT (`FreeMealCountAges5_17` / `EnrollmentAges5_17`) AS free_rate WHERE AdmFName1 = 'Kacey' AND AdmLName1 = 'Gibson'	california_schools
SELECT T2.AdmEmail1 FROM frm AS T1 JOIN sch AS T2 ON T1.SchID = T2.SchID WHERE T1.`Charter School (Y/N)` = 1 AND T1.SchTypeDesc = 'Chartered' ORDER BY `Enrollment (K-12)` ASC LIMIT 1	california_schools
SELECT T2.AdmFName1, T2.AdmLName1, T2.AdmFName2, T2.AdmLName2, T2.AdmFName3, T2.AdmLName3 FROM School_SAT_2015 AS T1 JOIN Schools AS T2 ON T1.SCHOOLID = T2.SCHOOLID WHERE T1.NumGE1500 = (SELECT MAX(NumGE1500) FROM School_SAT_2015)	california_schools
SELECT T2.Street, T2.City, T2.Zip, T2.State FROM (SELECT SchoolID, MIN(NumGE1500 / NumTstTakr) AS ExcellenceRate FROM Schools GROUP BY SchoolID) AS T1 JOIN Addresses AS T2 ON T1.SchoolID = T2.SchoolID WHERE T1.ExcellenceRate = (SELECT MIN(ExcellenceRate) FROM (SELECT SchoolID, NumGE1500 / NumTstTakr AS ExcellenceRate FROM Schools GROUP BY SchoolID))	california_schools
SELECT Webpage FROM Schools WHERE County = 'Los Angeles' AND TestTakers BETWEEN 2000 AND 3000;	california_schools
SELECT AVG(TestTakers) FROM Schools WHERE City = 'Fresno' AND YearOpened = 1980	california_schools
SELECT T1.Phone FROM School AS T1 JOIN TestScore AS T2 ON T1.SchoolID = T2.SchoolID WHERE T1.District = 'Fresno Unified' GROUP BY T1.SchoolID ORDER BY AVG(T2.Reading) ASC LIMIT 1	california_schools
SELECT AdmFName1, AdmLName1  FROM table_name  WHERE Virtual = 'F'  GROUP BY County, AdmFName1, AdmLName1  HAVING AVG(ReadingScore) OVER (PARTITION BY County)  IN (SELECT TOP 5 AVG(ReadingScore)      FROM table_name      WHERE Virtual = 'F'      GROUP BY County      ORDER BY AVG(ReadingScore) DESC)	california_schools
SELECT T1.Education_Type FROM Schools AS T1 JOIN Scores AS T2 ON T1.School_ID = T2.School_ID WHERE T2.Subject = 'Math' ORDER BY AVG(T2.Score) DESC LIMIT 1;	california_schools
SELECT T1.AvgScrMath, T2.County  FROM SchoolScores AS T1  JOIN Schools AS T2 ON T1.SchID = T2.SchID  WHERE T1.AvgScrMath + T1.AvgScrRead + T1.AvgScrWrite = (SELECT MIN(AvgScrMath + AvgScrRead + AvgScrWrite) FROM SchoolScores) GROUP BY T2.County ORDER BY AVG(T1.AvgScrMath) ASC LIMIT 1;	california_schools
SELECT T1.City, AVG(T2.Writing) AS AvgWritingScore FROM Schools AS T1 JOIN SATScores AS T2 ON T1.SchoolID = T2.SchoolID WHERE T2.TotalSAT >= 1500 GROUP BY T1.City ORDER BY COUNT(*) DESC LIMIT 1	california_schools
SELECT T1.SchoolName, AVG(T2.WritingScore) FROM Schools AS T1 JOIN TestScores AS T2 ON T1.SchoolID = T2.SchoolID WHERE T1.AdministratorFirstName = 'Ricci' AND T1.AdministratorLastName = 'Ulrich' GROUP BY T1.SchoolName	california_schools
SELECT T1.SchoolName FROM School AS T1 JOIN Enrollment AS T2 ON T1.schoolid = T2.schoolid WHERE T1.DOC = 31 AND T2.GradeLevel = 'K-12' GROUP BY T1.SchoolName ORDER BY SUM(T2.Enrollment) DESC LIMIT 1	california_schools
SELECT COUNT(*) / 12 FROM Schools WHERE County = 'Alameda' AND DOC = 52 AND OpenYr = 1980	california_schools
SELECT CAST(SUM(CASE WHEN DOC = 54 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN DOC = 52 THEN 1 ELSE 0 END) FROM schools WHERE County = 'Orange' AND Status = 'Merged'	california_schools
SELECT T1.CountyName, T2.SchoolName, T2.ClosureDate  FROM County AS T1  JOIN School AS T2 ON T1.CountyID = T2.CountyID  WHERE T2.StatusType = 'Closed'  GROUP BY T1.CountyName, T2.SchoolName, T2.ClosureDate  ORDER BY COUNT(*) DESC LIMIT 1;	california_schools
SELECT T1.SchMailingStreet, T1.SchName FROM Schools AS T1 JOIN TestScores AS T2 ON T1.SchID = T2.SchID WHERE T2.TestType = 'Math' ORDER BY T2.AvgScore DESC LIMIT 6,1;	california_schools
SELECT T1.MailingStreetAddress, T1.SchoolName FROM Schools AS T1 JOIN TestScores AS T2 ON T1.SchoolID = T2.SchoolID WHERE T2.Subject = 'Reading' GROUP BY T1.SchoolID ORDER BY AVG(T2.AverageScore) ASC LIMIT 1	california_schools
SELECT COUNT(*) FROM Schools WHERE MailingCity = 'Lakeport' AND (AvgScrRead + AvgScrMath + AvgScrWrite) >= 1500	california_schools
SELECT COUNT(*) FROM TestTakers WHERE SchoolCity = 'Fresno'	california_schools
SELECT SchoolName, MailingZipCode FROM Schools WHERE AdmFName1 = 'Avetik' AND AdmLName1 = 'Atoian' OR AdmFName2 = 'Avetik' AND AdmLName2 = 'Atoian' OR AdmFName3 = 'Avetik' AND AdmLName3 = 'Atoian';	california_schools
SELECT COUNT(CASE WHEN County = 'Colusa' THEN 1 ELSE NULL END) / COUNT(CASE WHEN County = 'Humboldt' THEN 1 ELSE NULL END) AS Ratio  FROM Schools  WHERE MailingStateAddress = 'California'	california_schools
SELECT COUNT(*) FROM schools WHERE MailingState = 'CA' AND City = 'San Joaquin' AND Status = 'Active'	california_schools
SELECT T1.PhoneNumber ,  T1.Extension FROM Schools AS T1 JOIN Scores AS T2 ON T1.SchoolID  =  T2.SchoolID WHERE T2.AvgWritingScore IN (SELECT AvgWritingScore FROM Scores ORDER BY AvgWritingScore DESC LIMIT 333 OFFSET 332)	california_schools
SELECT T1.SchPhoneNum , T1.SchExt FROM Schools AS T1 JOIN SchoolAdmins AS T2 ON T1.SchID = T2.SchID WHERE T1.SchZipCode = '95203-3704'	california_schools
SELECT T1.Website FROM School AS T1 JOIN Administrator AS T2 ON T1.AdminID = T2.AdminID WHERE T2.FName = 'Mike' AND T2.LName = 'Larson' INTERSECT SELECT T1.Website FROM School AS T1 JOIN Administrator AS T2 ON T1.AdminID = T2.AdminID WHERE T2.FName = 'Dante' AND T2.LName = 'Alvarez'	california_schools
SELECT T1.WebSite FROM Schools AS T1 JOIN SchoolLocations AS T2 ON T1.SchoolID = T2.SchoolID WHERE T1.Virtual = 'P' AND T1.Charter = 1 AND T2.CountyName = 'San Joaquin'	california_schools
SELECT COUNT(*) FROM schools WHERE City = 'Hickman' AND Charter = 1 AND DOC = 52	california_schools
SELECT COUNT(*) FROM Schools WHERE CountyName = 'Los Angeles' AND Charter = 0 AND ((`Free Meal Count (K-12)` * 100) / `Enrollment (K-12)`) < 0.18;	california_schools
SELECT T2.AdmFName1, T2.AdmLName1, T1.SchoolName, T1.City FROM schools AS T1 JOIN administrators AS T2 ON T1.AdminID = T2.AdminID WHERE T1.Charter = '00D2' AND T1.SchoolType = 'Charter'	california_schools
SELECT COUNT(*) FROM Schools WHERE MailingCity = 'Hickman' AND CharterNumber = '00D4'	california_schools
SELECT CAST(SUM(CASE WHEN FundingSource = 'Local' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Schools WHERE County = 'Santa Clara';	california_schools
SELECT COUNT(*) FROM Schools WHERE County = 'Stanislaus' AND FundingType = 'Directly Funded' AND LastUpdate BETWEEN '2000-01-01' AND '2005-12-31'	california_schools
SELECT SUM(CASE WHEN AdmFName1 = 'None' AND YEAR(LastUpdate) = 1989 AND City = 'San Francisco' THEN 1 ELSE 0 END) AS Total_Closure FROM CommunityCollegeDistricts WHERE Type = 'Closure'  Note: The provided SQL query is an attempt based on the given information. However, it's important to note that the columns mentioned in the question (like "Type", "City") are not described in the column descriptions provided. Therefore, this query might need adjustments according to the actual table schema.	california_schools
SELECT T2.County FROM Schools AS T1 JOIN Districts AS T2 ON T1.DistrictID = T2.DistrictID WHERE T1.SchYrCode BETWEEN 1980 AND 1989 AND T1.SchOwnershipCode = 11 GROUP BY T2.County ORDER BY COUNT(*) DESC LIMIT 1	california_schools
SELECT NCESDistrictID FROM table_name WHERE SOC = 31;	california_schools
SELECT COUNT(*) FROM schools WHERE County = 'Alpine' AND Status = 'Active' OR Status = 'Closed' AND School_Type = 'District Community Day School'	california_schools
SELECT DistrictCode FROM Schools WHERE City = 'Fresno' AND Magnet = 0;	california_schools
SELECT COUNT(*) FROM students WHERE Age BETWEEN 5 AND 17 AND SchoolYear = '2014-2015' AND EdOpsCode = 'SSS' AND City = 'Fremont'	california_schools
SELECT SUM(Free_Reduced_Meal_Count_5_17) FROM School WHERE School_Name = 'Youth Authority School' AND Mailing_Street_Address = 'PO Box 1040'	california_schools
SELECT MIN(Grade) FROM Schools WHERE EdOpsCode = 'SPECON' AND NCESDistID = 0613360;	california_schools
SELECT T1.SchoolName, T1.EducationalLevelName FROM Schools AS T1 JOIN SchoolBreakfastProgram AS T2 ON T1.SchoolID = T2.SchoolID WHERE T2.BreakfastProvision = '2' AND T1.CountyCode = '37'	california_schools
SELECT T1.CityLocation FROM School AS T1 JOIN SchoolLunchProvision AS T2 ON T1.SchoolID = T2.SchoolID WHERE T1.EILCode = 'HS' AND T2.LunchProvision = 2 AND T1.LowestGrade = 9 AND T1.HighestGrade = 12 AND T1.County = 'Merced'	california_schools
SELECT SchoolName, (FRPMCount_5_17 / Enrollment_5_17) * 100 AS Percent_Eligible_FRPM FROM Schools WHERE County = 'Los Angeles' AND GradeSpan = 'KG-9'	california_schools
SELECT GradeSpan, COUNT(*) AS CountGradeSpan FROM Schools WHERE City = 'Adelanto' GROUP BY GradeSpan ORDER BY CountGradeSpan DESC LIMIT 1;	california_schools
SELECT T1.CountyName, COUNT(*) AS SchoolCount FROM County AS T1 JOIN School AS T2 ON T1.CountyID = T2.County WHERE (T1.CountyName = 'San Diego' OR T1.CountyName = 'Santa Barbara') AND T2.Virtual = 'F' GROUP BY T1.CountyName ORDER BY SchoolCount DESC LIMIT 1;	california_schools
SELECT SchoolName, Latitude FROM Schools ORDER BY Latitude DESC LIMIT 1;	california_schools
SELECT T1.City, T2.SchoolName, T2.LowGrade FROM Schools AS T1 JOIN SchoolInfo AS T2 ON T1.SchoolID = T2.SchoolID WHERE T1.State = 'CA' ORDER BY T1.Latitude ASC LIMIT 1;	california_schools
SELECT T2.Grades_Offered FROM Schools AS T1 JOIN School_Details AS T2 ON T1.School_ID = T2.School_ID WHERE ABS(T1.Longitude) = (SELECT MAX(ABS(Longitude)) FROM Schools)	california_schools
SELECT T2.City, COUNT(*) AS School_Count FROM (     SELECT *     FROM Schools     WHERE Grade_Span = 'K-8' AND Magnet = 1 AND `NSLP Provision Status` = 'Multiple Provision Types' ) AS T1 JOIN (     SELECT DISTINCT School_ID, City     FROM Schools ) AS T2 ON T1.School_ID = T2.School_ID GROUP BY T2.City;	california_schools
SELECT AdmFName1, COUNT(AdmFName1) AS NameCount, AdmEmail1 FROM table_name GROUP BY AdmFName1 ORDER BY NameCount DESC LIMIT 2;   SELECT AdmFName2, COUNT(AdmFName2) AS NameCount, AdmEmail1 FROM table_name WHERE AdmFName2 IS NOT NULL AND AdmFName2 <> 'None' GROUP BY AdmFName2 ORDER BY NameCount DESC LIMIT 2;	california_schools
SELECT T1.DistrictCode ,  (T1.`Free Meal Count (K-12)` / T1.`Enrollment (K-12)`) * 100 AS Percent_Eligible_Free_K_12 FROM `school_info` AS T1 JOIN `admin_info` AS T2 ON T1.SchoolCode = T2.SchoolCode WHERE T2.AdmFName1 = 'Alusine'	california_schools
SELECT T1.AdmLName1, T2.District, T2.County, T2.SchoolName FROM SchoolAdmin AS T1 JOIN Schools AS T2 ON T1.SchID = T2.SchID WHERE T2.Charter = 40;	california_schools
SELECT AdmEmail1 FROM schools WHERE County = 'San Bernardino' AND City = 'San Bernardino City Unified' AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND (SOC = 62 OR DOC = 54) UNION SELECT AdmEmail2 FROM schools WHERE County = 'San Bernardino' AND City = 'San Bernardino City Unified' AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND (SOC = 62 OR DOC = 54) UNION SELECT AdmEmail3 FROM schools WHERE County = 'San Bernardino' AND City = 'San Bernardino City Unified' AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND (SOC = 62 OR DOC = 54)	california_schools
SELECT AdmEmail1 FROM table_name WHERE SchoolID = (SELECT SchoolID FROM SAT_Scores GROUP BY SchoolID ORDER BY SUM(SAT_Score) >= 1500 AND COUNT(*) DESC LIMIT 1);   Note: The above SQL query assumes that there is a column named 'SchoolID' in the table which links the administrator information to the school. Also, it's assumed that SAT scores are stored in a separate table named 'SAT_Scores'. Replace 'table_name' and 'SAT_Scores' with actual table names from your database.	california_schools
SELECT COUNT(*) FROM account WHERE frequency = 'POPLATEK PO OBRATU' AND district_id IN (SELECT district_id FROM district WHERE region = 'East Bohemia')	financial
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE city = 'Prague') AND frequency = 'POPLATEK MESICNE'	financial
SELECT      CASE          WHEN AVG(CASE WHEN date LIKE '1995%' THEN A12 END) > AVG(CASE WHEN date LIKE '1996%' THEN A13 END) THEN '1995'         ELSE '1996'     END AS higher_unemployment_year FROM account JOIN client ON account.district_id = client.district_id;	financial
SELECT COUNT(*) FROM (SELECT district_id FROM client WHERE gender = 'F' GROUP BY district_id HAVING AVG(salary) BETWEEN 6000 AND 10000) AS T	financial
SELECT COUNT(*) FROM client WHERE gender = 'M' AND district_id IN (SELECT district_id FROM district WHERE region = 'North Bohemia') AND client_id IN (SELECT client_id FROM account GROUP BY client_id HAVING AVG(amount) > 8000)	financial
SELECT T3.account_to, MAX(T2.A11) - MIN(T2.A11) AS Gap FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id JOIN transaction AS T3 ON T2.account_id = T3.account_id WHERE T1.gender = 'F' GROUP BY T1.birth_date ORDER BY T1.birth_date DESC LIMIT 1	financial
SELECT T2.account_id FROM client AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.birth_date = (SELECT MIN(`birth_date`) FROM `client`) AND T1.client_id IN (SELECT client_id FROM(SELECT client_id, AVG(salary) AS A11 FROM(SELECT * FROM(SELECT T3.client_id, T4.salary FROM client AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id JOIN transaction AS T3 ON T2.account_id = T3.account_from JOIN salary AS T4 ON T3.transaction_id = T4.transaction_id) WHERE 1 GROUP BY client_id) ORDER BY A11 DESC LIMIT 1))	financial
SELECT COUNT(*) FROM account WHERE frequency = 'POPLATEK TYDNE' AND account_id IN (SELECT account_id FROM client WHERE gender = 'F')	financial
SELECT T2.client_id FROM account AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T1.frequency = 'POPLATEK PO OBRATU'	financial
SELECT T1.account_id FROM account AS T1 JOIN transaction AS T2 ON T1.account_id = T2.account_id WHERE T1.frequency = 'POPLATEK TYDNE' AND T2.k_symbol = 'UVER' AND strftime('%Y', T2.date) = '1997' ORDER BY T2.amount ASC LIMIT 1;	financial
SELECT T1.account_id FROM account AS T1 JOIN loan AS T2 ON T1.client_id = T2.client_id WHERE T2.duration > 12 AND T1.date BETWEEN '1993-01-01' AND '1993-12-31' ORDER BY T2.approved_amount DESC LIMIT 1;	financial
SELECT COUNT(*) FROM client WHERE gender = 'F' AND birth_date < '1950-01-01' AND district_id IN (SELECT district_id FROM district WHERE name = 'Sokolov')	financial
SELECT T2.account_id FROM `order` AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE STRFTIME('%Y', T2.date) = '1995' ORDER BY T2.date ASC LIMIT 1;	financial
SELECT T2.account_id FROM `order` AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.date < '1997-01-01' AND T1.amount > 3000	financial
SELECT T2.client_id FROM account AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id WHERE STRFTIME('%Y-%m-%d', T1.date) = '1994-03-03'	financial
SELECT T2.date FROM orders AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.amount = 840 AND T1.order_date = '1998-10-14'	financial
SELECT T2.district_id FROM orders AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.k_symbol = 'UVER' AND T2.date = '1994-08-25'	financial
SELECT MAX(T1.amount) FROM transaction AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.client_id IN (SELECT client_id FROM client WHERE birth_date = '1970-12-13') AND STRFTIME('%Y-%m-%d', T2.date) = '1996-10-21'	financial
SELECT T3.gender FROM ( (SELECT district_id, AVG(A11) AS avg_salary FROM account GROUP BY district_id ORDER BY avg_salary DESC LIMIT 1)) AS T1  JOIN client AS T2 ON T1.district_id = T2.district_id  WHERE T2.birth_date = ( SELECT MIN(birth_date) FROM client WHERE district_id IN ( SELECT district_id FROM ( (SELECT district_id, AVG(A11) AS avg_salary FROM account GROUP BY district_id ORDER BY avg_salary DESC LIMIT 1)) AS T4 ) ) ) AS T3;	financial
SELECT T1.amount FROM `order` AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.client_id = (SELECT client_id FROM loan GROUP BY client_id ORDER BY amount DESC LIMIT 1) AND T1.date = (SELECT MIN(date) FROM `order` WHERE account_id = (SELECT account_id FROM account WHERE client_id = (SELECT client_id FROM loan GROUP BY client_id ORDER BY amount DESC LIMIT 1)))	financial
SELECT COUNT(*) FROM client WHERE gender = 'F' AND district_id IN (SELECT district_id FROM account WHERE district_id IN (SELECT district_id FROM district WHERE name = 'Jesenik'))	financial
SELECT T3.client_id FROM orders AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN client AS T3 ON T3.district_id = T2.district_id WHERE T1.amount = 5100 AND STRFTIME('%Y-%m-%d', T1.date) = '1998-09-02'	financial
SELECT COUNT(*) FROM account WHERE date LIKE '1996%' AND district_id = (SELECT district_id FROM district WHERE a2 = 'Litomerice')	financial
SELECT T1.district_id FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.account_id WHERE T1.gender = 'F' AND T1.birth_date = '1976-01-29'	financial
SELECT T3.birth_date FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T1.amount = 98832 AND T1.date = '1996-01-03'	financial
SELECT T1.account_id FROM `account` AS T1 JOIN `client` AS T2 ON T1.district_id = T2.district_id WHERE T2.district_id IN (SELECT district_id FROM `district` WHERE A3 = 'Prague') ORDER BY T1.date ASC LIMIT 1	financial
SELECT CAST(SUM(IIF(T2.gender = 'M', 1, 0)) AS REAL) * 100 / COUNT(T2.client_id) FROM district AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T1.region_name = 'A3' AND T1.inhabitants = (SELECT MAX(inhabitants) FROM district WHERE region_name = 'A3')	financial
SELECT ((SELECT SUM(t2.amount) FROM transaction AS t2 WHERE t2.account_id IN (SELECT t3.account_id FROM account AS t3 WHERE t3.client_id IN (SELECT client_id FROM client WHERE gender = 'F') AND t3.district_id IN (SELECT district_id FROM district WHERE city = 'Prague')) AND t2.date BETWEEN '1993-07-05' AND '1998-12-27') - SUM(t1.amount)) / SUM(t1.amount) * 100 AS increase_rate FROM transaction AS t1 WHERE t1.account_id IN (SELECT account_id FROM account WHERE client_id IN (SELECT client_id FROM client WHERE gender = 'F') AND district_id IN (SELECT district_id FROM district WHERE city = 'Prague')) AND t1.date BETWEEN '1993-03-22' AND '1993-07-05'	financial
SELECT SUM(CASE WHEN T2.status  =  'A' THEN 1 ELSE 0 END) * 100 / COUNT(T2.loan_id) FROM loan AS T1 INNER JOIN contract AS T2 ON T1.loan_id  =  T2.loan_id WHERE T1.amount  =  (SELECT amount FROM loan GROUP BY amount ORDER BY count(*) DESC LIMIT 1)	financial
SELECT (SUM(CASE WHEN T2.amount < 100000 AND T1.k_symbol = 'UVER' THEN 1 ELSE 0 END) * 100 / SUM(CASE WHEN T1.k_symbol = 'UVER' THEN 1 ELSE 0 END)) FROM transaction AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.frequency = 'POPLATEK MESICNE' AND T1.amount < 100000 AND T1.k_symbol = 'UVER';	financial
SELECT T1.account_id, T3.name, T3.region FROM account AS T1 JOIN client AS T2 ON T1.client_id = T2.client_id JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T1.date LIKE '1993%' AND T1.frequency = 'POPLATEK PO OBRATU'	financial
SELECT T2.account_id, T2.frequency FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id WHERE T1.district_id IN (SELECT district_id FROM district WHERE name = 'east Bohemia') AND T2.date BETWEEN '1995-01-01' AND '2000-12-31'	financial
SELECT T1.account_id ,  T1.date FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Prachatice'	financial
SELECT T1.district_id, T3.region FROM account AS T1 JOIN order AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T2.order_id = 4990	financial
SELECT T1.account_id, T2.district_name, T3.region_name  FROM account AS T1  JOIN district AS T2 ON T1.district_id = T2.district_id  JOIN region AS T3 ON T2.region_id = T3.region_id  WHERE EXISTS (     SELECT *      FROM transaction AS T4      WHERE T4.account_id = T1.account_id AND T4.amount > 300000 AND T4.k_symbol = 'UVER' )	financial
SELECT T2.loan_id ,  T3.district ,  T4.A11 FROM loan AS T1 JOIN client AS T2 ON T1.client_id = T2.client_id JOIN district AS T3 ON T2.district_id = T3.district_id JOIN (SELECT A3, AVG(A10) AS A11 FROM family GROUP BY A3) AS T4 ON T3.A3 = T4.A3 WHERE T1.duration = 60	financial
SELECT T4.district, ((T4.A13 - T4.A12) / T4.A12) * 100 AS unemployment_rate_increment FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.account_id WHERE T2.k_symbol = 'UVER' AND T2.frequency = 'POPLATEK MESICNE' AND T2.date BETWEEN '1995-01-01' AND '1995-12-31' JOIN district AS T4 ON T1.district_id = T4.district_id WHERE T2.status = 'D'	financial
SELECT CAST(SUM(CASE WHEN T3.name = 'Decin' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM account AS T1 JOIN client AS T2 ON T1.client_id = T2.client_id JOIN district AS T3 ON T1.district_id = T3.district_id WHERE strftime('%Y', T1.date) = '1993'	financial
SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE'	financial
SELECT T3.district_id FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.account_id WHERE T1.gender = 'F' GROUP BY T2.district_id ORDER BY COUNT(T2.account_id) DESC LIMIT 9	financial
SELECT T3.A2, SUM(T1.amount) AS total_withdrawals  FROM transaction AS T1  JOIN account AS T2 ON T1.account_id = T2.account_id  JOIN district AS T3 ON T2.district_id = T3.district_id  WHERE T1.type = 'VYDAJ' AND T1.date LIKE '1996-01%'  GROUP BY T3.A2  ORDER BY total_withdrawals DESC  LIMIT 10;	financial
SELECT COUNT(*) FROM account AS T1 JOIN client AS T2 ON T1.account_id = T2.client_id WHERE T2.district_id IN (SELECT district_id FROM district WHERE name = 'South Bohemia') AND NOT EXISTS (SELECT * FROM credit_card WHERE account_id = T1.account_id)	financial
SELECT T1.district_id FROM account AS T1 JOIN transaction AS T2 ON T1.account_id = T2.account_id WHERE T2.k_symbol = 'UVER' AND (T2.amount > 0 OR T2.status IN('C', 'D')) GROUP BY T1.district_id ORDER BY COUNT(*) DESC LIMIT 1	financial
SELECT AVG(T1.amount) FROM `order` AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN client AS T3 ON T2.district_id = T3.district_id WHERE T3.gender = 'M' AND T1.k_symbol = 'UVER'	financial
SELECT T1.A2, T1.district_id FROM district AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T1.A13 = (SELECT MAX(A13) FROM district) AND strftime('%Y', T2.birth_date) < '1981' GROUP BY T1.A2, T1.district_id ORDER BY COUNT(T2.client_id) DESC LIMIT 1	financial
SELECT COUNT(*) FROM account WHERE district_id = (SELECT district_id FROM crime GROUP BY district_id ORDER BY SUM(A16) DESC LIMIT 1) AND strftime('%Y', date) = '1996'	financial
SELECT COUNT(*) FROM transaction INNER JOIN account ON transaction.account_id = account.account_id WHERE transaction.operation = 'VYBER KARTOU' AND account.frequency = 'POPLATEK MESICNE' AND transaction.balance < 0;	financial
SELECT COUNT(*) FROM transaction WHERE bank_to IN (SELECT district_id FROM district WHERE city = 'LOAN') AND date BETWEEN '1995-01-01' AND '1997-12-31' AND amount >= 250000 AND account_id IN (SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE')	financial
SELECT COUNT(*) FROM account WHERE district_id = 1 AND frequency IN ('POPLATEK MESICNE', 'POPLATEK TYDNE', 'POPLATEK PO OBRATU')	financial
SELECT COUNT(T2.client_id) FROM ( SELECT T3.district_id, COUNT(*) AS crime_count  FROM crime AS T1  JOIN account AS T2 ON T1.account_id = T2.account_id  JOIN client AS T3 ON T2.district_id = T3.district_id  WHERE strftime('%Y', T1.date) = '1995'  GROUP BY T3.district_id  ORDER BY crime_count DESC LIMIT 1 OFFSET 1 ) AS T4  JOIN client AS T2 ON T4.district_id = T2.district_id  WHERE T2.gender = 'M' ;	financial
SELECT COUNT(*) FROM card WHERE card_type_code = 'GOLD' AND disposition = 'OWNER'	financial
SELECT COUNT(*) FROM account JOIN district ON account.district_id = district.district_id WHERE district.name = 'Pisek'	financial
SELECT T2.district_id FROM `order` AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.amount > 10000 AND strftime('%Y', T1.date) = '1997' GROUP BY T2.district_id	financial
SELECT T1.account_id FROM account AS T1 JOIN order AS T2 ON T1.account_id = T2.account_id WHERE T2.k_symbol = 'SIPO' AND T1.district_id IN (SELECT district_id FROM district WHERE city = 'Pisek')	financial
SELECT T1.account_id FROM account AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.client_id IN (SELECT client_id FROM card WHERE card_type_code = 'GOLD')	financial
SELECT AVG(amount) FROM operations WHERE operation = 'VYBER KARTOU' AND strftime('%Y', date) = '2021' GROUP BY strftime('%m', date)	financial
SELECT T2.client_id FROM transaction AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.amount < (SELECT AVG(amount) FROM transaction) AND T1.date BETWEEN '1998-01-01' AND '1998-12-31' AND T1.k_symbol = 'VYBER KARTOU' GROUP BY T2.client_id	financial
SELECT client.client_id  FROM client  JOIN account ON client.client_id = account.account_id  WHERE client.gender = 'F'  AND EXISTS (SELECT * FROM order WHERE order.account_id = account.account_id AND order.k_symbol IN ('POJISTNE', 'LEASING'))  AND EXISTS (SELECT * FROM loan WHERE loan.account_id = account.account_id)	financial
SELECT COUNT(*) FROM client WHERE gender = 'F' AND district_id IN (SELECT district_id FROM district WHERE region = 'South Bohemia') AND account_id IN (SELECT account_id FROM account)	financial
SELECT T1.account_id FROM `account` AS T1 JOIN `district` AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Tabor' AND T1.frequency = 'POPLATEK MESICNE'	financial
SELECT T2.account_type FROM district AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.A11 BETWEEN 8000 AND 9000 AND T2.account_type != 'OWNER'	financial
SELECT COUNT(*) FROM account AS T1 JOIN transaction AS T2 ON T1.account_id = T2.account_id WHERE T2.bank_to = 'AB' AND T1.district_id IN (SELECT district_id FROM district WHERE region = 'North Bohemia')	financial
SELECT T3.A2 FROM transaction AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.type = 'VYDAJ' GROUP BY T3.A2	financial
SELECT AVG(T2.crime_1995) FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.date >= '1997-01-01' AND T2.crime_1995 > 4000	financial
SELECT COUNT(*) FROM card WHERE card_type  =  'CLASSIC' AND account_id IN (SELECT account_id FROM account WHERE account_type  =  'OWNER')	financial
SELECT COUNT(*) FROM client WHERE gender = 'M' AND district_id IN (SELECT district_id FROM district WHERE city = 'Hl.m. Praha')	financial
SELECT CAST(SUM(CASE WHEN T2.type = 'Gold' AND strftime('%Y',T1.date) < '1998' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.account_id) FROM account AS T1 JOIN card AS T2 ON T1.account_id = T2.account_id	financial
SELECT T2.client_id FROM `order` AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.k_symbol = 'UVER' ORDER BY T1.amount DESC LIMIT 1	financial
SELECT A15.crimes_number  FROM A15  JOIN account ON A15.district_id = account.district_id  WHERE account.account_id = 532;	financial
SELECT T2.district_id FROM `order` AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.order_id = 33333	financial
SELECT * FROM transaction WHERE client_id = 3356 AND operation = 'VYBER'	financial
SELECT COUNT(*) FROM account WHERE frequency = 'POPLATEK TYDNE' AND amount < 200000	financial
SELECT T2.card_type FROM client AS T1 JOIN credit_card AS T2 ON T1.client_id = T2.client_id WHERE T1.client_id = 13539	financial
SELECT T2.A3 FROM client AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.client_id = 3541	financial
SELECT T3.district_id FROM account AS T1 JOIN loan AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T2.status = 'A' GROUP BY T3.district_id ORDER BY COUNT(T1.account_id) DESC LIMIT 1	financial
SELECT T1.client_id FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.account_id WHERE T2.account_id IN (SELECT account_id FROM order WHERE order_id = 32423)	financial
SELECT * FROM order WHERE account_id IN (SELECT account_id FROM account WHERE district_id = 5)	financial
SELECT COUNT(*) FROM account WHERE district_id = (SELECT district_id FROM district WHERE name = 'Jesenik')	financial
SELECT client_id FROM account WHERE date >= '1997-01-01' AND frequency = 'POPLATEK MESICNE'	financial
SELECT CAST(SUM(CASE WHEN T3.gender  =  'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T3.client_id) FROM account AS T1 JOIN district AS T2 ON T1.district_id  =  T2.district_id JOIN client AS T3 ON T3.district_id  =  T2.district_id WHERE T2.avg_salary  >  10000	financial
SELECT ((SELECT SUM(T2.amount) FROM client AS T1 JOIN loan AS T2 ON T1.client_id = T2.client_id WHERE strftime('%Y', T2.date) = '1997' AND T1.gender = 'M') - (SELECT SUM(T2.amount) FROM client AS T1 JOIN loan AS T2 ON T1.client_id = T2.client_id WHERE strftime('%Y', T2.date) = '1996' AND T1.gender = 'M')) / (SELECT SUM(T2.amount) FROM client AS T1 JOIN loan AS T2 ON T1.client_id = T2.client_id WHERE strftime('%Y', T2.date) = '1996' AND T1.gender = 'M') * 100	financial
SELECT COUNT(*) FROM operation WHERE operation = 'VYBER KARTOU' AND date > '1995-01-01'	financial
SELECT      (SELECT SUM(number_of_crimes) FROM crime_statistics WHERE year = 1996 AND region = 'North Bohemia') -     (SELECT SUM(number_of_crimes) FROM crime_statistics WHERE year = 1996 AND region = 'East Bohemia') AS difference;	financial
SELECT COUNT(*) FROM `order` WHERE `account_id` BETWEEN 1 AND 10; SELECT COUNT(*) FROM account WHERE account_id BETWEEN 1 AND 10;	financial
SELECT T1.frequency FROM account AS T1 JOIN transaction AS T2 ON T1.account_id = T2.account_id WHERE T1.account_id = 3 AND T2.amount = 3539 AND T2.k_symbol != ''	financial
SELECT EXTRACT(YEAR FROM birth_date) AS birth_year FROM client WHERE client_id = 130;	financial
SELECT COUNT(*) FROM account WHERE frequency = 'POPLATEK PO OBRATU'	financial
SELECT SUM(t1.amount) FROM `order` AS t1 JOIN account AS t2 ON t1.account_id = t2.account_id JOIN client AS t3 ON t3.client_id = t2.district_id WHERE t3.client_id = 992 AND t1.k_symbol IN ('UVER', 'LEASING') UNION SELECT SUM(t1.amount) FROM `order` AS t1 JOIN account AS t2 ON t1.account_id = t2.account_id JOIN client AS t3 ON t3.client_id = t2.district_id WHERE t3.client_id = 992 AND t1.k_symbol IN ('POJISTNE', 'SIPO')	financial
SELECT T2.amount , T3.gender FROM transactions AS T1 JOIN transfer AS T2 ON T1.transaction_id = T2.order_id JOIN account AS T4 ON T1.account_id = T4.account_id JOIN client AS T3 ON T4.client_id = T3.client_id WHERE T3.client_id = 4 AND T1.transaction_id = 851	financial
SELECT T1.card_type FROM card AS T1 JOIN client AS T2 ON T1.client_id = T2.client_id WHERE T2.client_id = 9	financial
SELECT SUM(T2.amount) FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.account_id JOIN transaction AS T3 ON T2.account_id = T3.account_id WHERE T1.client_id = 617 AND YEAR(T3.date) = 1998	financial
SELECT T2.client_id FROM account AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND T1.district_id IN (SELECT district_id FROM district WHERE name = 'East Bohemia')	financial
SELECT T1.client_id FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.account_id JOIN order AS T3 ON T2.account_id = T3.account_id WHERE T1.gender = 'F' ORDER BY T3.amount DESC LIMIT 3	financial
SELECT COUNT(DISTINCT T3.client_id) FROM transaction AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN client AS T3 ON T3.district_id = T2.district_id WHERE T3.gender = 'M' AND T3.birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND T1.amount > 4000 AND T1.k_symbol = 'SIPO'	financial
SELECT COUNT(*) FROM account WHERE district_id = (SELECT district_id FROM district WHERE city = 'Beroun') AND date > '1996-01-01'	financial
SELECT COUNT(*) FROM client WHERE client_id IN (SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE') AND gender = 'F'	financial
SELECT CAST(SUM(CASE WHEN T3.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T3.client_id) FROM account AS T1 JOIN transaction AS T2 ON T1.account_id = T2.account_id JOIN client AS T3 ON T1.district_id = T3.district_id WHERE T1.district_id IN (SELECT district_id FROM district WHERE city = 'Prague')	financial
SELECT (SELECT COUNT(*) FROM client c JOIN account a ON c.client_id = a.account_id WHERE c.gender = 'M' AND a.frequency = 'POPLATEK TYDNE') * 100 / (SELECT COUNT(*) FROM client c JOIN account a ON c.client_id = a.account_id WHERE a.frequency = 'POPLATEK TYDNE')	financial
SELECT COUNT(*) FROM ( (SELECT client_id FROM account WHERE frequency = 'POPLATEK TYDNE') INTERSECT (SELECT client_id FROM client WHERE gender = 'F') ) AS result	financial
SELECT T2.account_id FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.duration > 24 AND T2.date < '1997-01-01' ORDER BY T1.amount ASC LIMIT 1;	financial
SELECT T2.account_id FROM client AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' GROUP BY T2.account_id ORDER BY AVG(T1.birth_date) DESC ,  AVG(A11.salary) LIMIT 1	financial
SELECT COUNT(*) FROM client WHERE birth_date LIKE '1920%' AND district_id IN (SELECT district_id FROM district WHERE A3 = 'East Bohemia')	financial
SELECT COUNT(*) FROM account WHERE frequency = 'POPLATEK TYDNE' AND k_symbol = 'UVER' AND date BETWEEN DATE('now','-24 months') AND DATE('now');	financial
SELECT AVG(t1.amount) FROM payment AS t1 JOIN account AS t2 ON t1.account_id = t2.account_id WHERE t2.frequency = 'POPLATEK PO OBRATU' AND t1.k_symbol = 'UVER' AND EXISTS ( SELECT * FROM loan WHERE loan_status IN ('C', 'D') AND loan.account_id = t1.account_id )	financial
SELECT T1.client_id, T1.district_id FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.account_id WHERE T2.frequency = 'POPLATEK MESICNE' OR T2.frequency = 'POPLATEK PO OBRATU'	financial
SELECT T1.client_id, (YEAR(CURDATE()) - YEAR(T1.birth_date)) AS age FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id JOIN card AS T3 ON T2.account_id = T3.account_id JOIN disposition AS T4 ON T1.client_id = T4.client_id WHERE T3.type = 'gold' AND T4.type = 'OWNER'	financial
SELECT bond_id, COUNT(*) AS count  FROM connected  GROUP BY bond_id  ORDER BY count DESC  LIMIT 1;	toxicology
SELECT COUNT(*) FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '-' AND atom.element = 'cl'	toxicology
SELECT AVG(T3.element) FROM (SELECT T1.molecule_id ,  COUNT(*) AS c FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id  =  T2.bond_id WHERE T2.bond_type  =  '-' GROUP BY T1.molecule_id) AS T1 JOIN atom AS T3 ON T1.molecule_id  =  T3.molecule_id WHERE T3.element  =  'o'	toxicology
SELECT AVG(T3.bond_type) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id  =  T2.molecule_id JOIN connected AS T3 ON T2.atom_id  =  T3.atom_id WHERE T1.label  =  '+' AND T3.bond_type  =  '-'	toxicology
SELECT COUNT(*) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T2.element  =  'na' AND T1.label  =  '-'	toxicology
SELECT T3.molecule_id FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id  =  T2.bond_id JOIN molecule AS T3 ON T2.molecule_id  =  T3.molecule_id WHERE T2.bond_type  =  '#3' AND T3.label  =  '+'	toxicology
SELECT CAST(COUNT(CASE WHEN T1.element  =  'C' THEN T1.atom_id ELSE NULL END) AS REAL) * 100 / COUNT(T1.atom_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id  =  T2.atom_id2 WHERE T2.bond_type  =  '='	toxicology
SELECT COUNT(*) FROM bond WHERE label = '#'	toxicology
SELECT COUNT(*) FROM atom WHERE element != 'br'	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR099' AND label = '+'	toxicology
SELECT T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'c' GROUP BY T1.molecule_id	toxicology
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id  =  T2.atom_id OR T1.atom_id  =  T2.atom_id2 WHERE T2.bond_id  =  'TR004_8_9'	toxicology
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id  =  T2.atom_id JOIN bond AS T3 ON T2.bond_id  =  T3.bond_id WHERE T3.bond_type  =  '='	toxicology
SELECT T2.label FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T1.element  =  'h' GROUP BY T2.label ORDER BY COUNT(*) DESC LIMIT 1	toxicology
SELECT T2.bond_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id  =  T2.atom_id OR T1.atom_id  =  T2.atom_id2 WHERE T1.element  =  'cl'	toxicology
SELECT T1.atom_id, T2.atom_id2 FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id IN (SELECT bond_id FROM bond WHERE label = '-')	toxicology
SELECT T1.atom_id ,  T3.atom_id2 FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN connected AS T3 ON T3.atom_id2 = T2.bond_id WHERE T1.molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-')	toxicology
SELECT T2.element FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T1.label  =  '-' GROUP BY T2.element ORDER BY COUNT(*) LIMIT 1	toxicology
SELECT T1.bond_id FROM `connected` AS T1 JOIN `bond` AS T2 ON T1.bond_id  =  T2.bond_id WHERE (T1.atom_id  =  'TR004_8' AND T1.atom_id2  =  'TR004_20') OR (T1.atom_id  =  'TR004_20' AND T1.atom_id2  =  'TR004_8')	toxicology
SELECT T2.label FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element != 'sn' GROUP BY T2.label	toxicology
SELECT COUNT(DISTINCT atom.atom_id) FROM atom JOIN connected ON atom.atom_id = connected.atom_id1 OR atom.atom_id = connected.atom_id2 WHERE atom.element IN ('i', 's') AND connected.bond_type = '-'	toxicology
SELECT T1.atom_id, T2.atom_id2 FROM `connected` AS T1 JOIN `bond` AS T2 ON T1.bond_id  =  T2.bond_id WHERE T2.bond_type  =  '#'  ''  ''  ''  ''  ''  ''  ''  ''  ''  ''  ''  ''  ''  ''  ''	toxicology
SELECT T3.atom_id FROM `bond` AS T1 JOIN `connected` AS T2 ON T1.bond_id  =  T2.bond_id JOIN `atom` AS T3 ON T3.atom_id  =  T2.atom_id2 WHERE T1.molecule_id  =  'TR181'	toxicology
SELECT CAST(COUNT(DISTINCT CASE WHEN T2.element != 'f' THEN T1.molecule_id ELSE NULL END) AS REAL) * 100 / COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'	toxicology
SELECT CAST(SUM(CASE WHEN T2.bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_id) FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'	toxicology
SELECT T2.element FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR000' GROUP BY T2.element ORDER BY COUNT(*) DESC LIMIT 3;	toxicology
SELECT T1.atom_id ,  T3.atom_id FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T1.atom_id2 = T3.atom_id WHERE T2.molecule_id = 'TR001' AND T2.bond_id = 'TR001_2_6'	toxicology
SELECT (SELECT COUNT(*) FROM molecule WHERE label = '+') - (SELECT COUNT(*) FROM molecule WHERE label = '-') AS difference ;	toxicology
SELECT T1.atom_id ,  T1.atom_id2 FROM connected AS T1 WHERE T1.bond_id  =  'TR000_2_5'	toxicology
SELECT bond_id FROM connected WHERE atom_id2 = 'TR000_2'	toxicology
SELECT T1.molecule_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T2.bond_type  =  ' = ' ORDER BY T1.molecule_id LIMIT 5	toxicology
SELECT CAST(COUNT(CASE WHEN T2.bond_type = '=' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T2.bond_type) AS percent FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR008' GROUP BY T1.molecule_id	toxicology
SELECT CAST(COUNT(CASE WHEN T1.label = '+' THEN 1 END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM molecule AS T1 WHERE T1.label = '+' OR T1.label = '-' GROUP BY T1.label WITH ROLLUP	toxicology
SELECT CAST(COUNT(CASE WHEN T1.element  =  'h' THEN T1.atom_id ELSE NULL END) AS REAL) * 100 / COUNT(T1.atom_id) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T1.molecule_id  =  'TR206' LIMIT 1	toxicology
SELECT T2.bond_id FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.molecule_id = 'TR000' GROUP BY T2.bond_id ORDER BY COUNT(*) DESC LIMIT 1	toxicology
SELECT T2.element ,  T1.label FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T1.molecule_id  =  'TR060'	toxicology
SELECT T2.bond_id AS bond_type ,  T1.label FROM molecule AS T1 JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR010' GROUP BY T2.bond_id ORDER BY COUNT(*) DESC LIMIT 1	toxicology
SELECT T3.molecule_id FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id  =  T2.bond_id JOIN molecule AS T3 ON T2.molecule_id  =  T3.molecule_id WHERE T2.bond_type  =  '-' AND T3.label  =  '-' ORDER BY T3.molecule_id LIMIT 3	toxicology
SELECT bond_id FROM connected WHERE atom_id IN (SELECT atom_id FROM atom WHERE molecule_id = 'TR006') AND atom_id2 IN (SELECT atom_id FROM atom WHERE molecule_id = 'TR006') GROUP BY bond_id ORDER BY COUNT(*) DESC LIMIT 2;	toxicology
SELECT COUNT(*) FROM connected WHERE (atom_id = 'TR009_12' OR atom_id2 = 'TR009_12') AND bond_id IN (SELECT bond_id FROM bond WHERE molecule_id = 'TR009')	toxicology
SELECT COUNT(*) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T1.label  =  '+' AND T2.element  =  'br'	toxicology
SELECT T1.atom_id ,  T1.atom_id2 ,  T2.bond_type FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id  =  T2.bond_id WHERE T2.bond_id  =  'TR001_6_9'	toxicology
SELECT T2.molecule_id ,  T2.label FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR001_10'	toxicology
SELECT COUNT(*) FROM bond WHERE label = '#'	toxicology
SELECT COUNT(*) FROM connected WHERE atom_id = 'TR%_19' OR atom_id2 = 'TR%_19'	toxicology
SELECT T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.molecule_id = 'TR004' GROUP BY T1.element	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '-'	toxicology
SELECT T3.molecule_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 JOIN molecule AS T3 ON T3.molecule_id = T2.molecule_id WHERE SUBSTR(T1.atom_id, 7, 2) BETWEEN '21' AND '25' AND T3.label = '+' GROUP BY T3.molecule_id	toxicology
SELECT T3.bond_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id  =  T2.atom_id OR T1.atom_id  =  T2.atom_id2 JOIN bond AS T3 ON T3.bond_id  =  T2.bond_id WHERE T1.element  =  'p' INTERSECT SELECT T3.bond_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id  =  T2.atom_id OR T1.atom_id  =  T2.atom_id2 JOIN bond AS T3 ON T3.bond_id  =  T2.bond_id WHERE T1.element  =  'n'	toxicology
SELECT T1.label FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T2.bond_type  =  ' =' ORDER BY COUNT(*) DESC LIMIT 1	toxicology
SELECT AVG(T3.bond_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id  =  T2.atom_id OR T1.atom_id  =  T2.atom_id2 WHERE T1.element  =  'i' GROUP BY T1.atom_id	toxicology
SELECT T1.bond_id ,  T2.bond_type FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id  =  T2.bond_id WHERE SUBSTR(T1.atom_id , 7 , 2) + 0 = 45	toxicology
SELECT T1.element FROM atom AS T1 WHERE T1.atom_id NOT IN (SELECT T2.atom_id FROM connected AS T2) AND T1.atom_id NOT IN (SELECT T3.atom_id2 FROM connected AS T3)	toxicology
SELECT T3.atom_id FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id  =  T2.bond_id JOIN atom AS T3 ON T2.atom_id2  =  T3.atom_id WHERE T1.molecule_id  =  'TR041' AND T1.bond_type  =  '#';	toxicology
SELECT T2.element FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id  =  T2.atom_id WHERE T1.bond_id  =  'TR144_8_19' UNION SELECT T3.element FROM connected AS T1 JOIN atom AS T3 ON T1.atom_id2  =  T3.atom_id WHERE T1.bond_id  =  'TR144_8_19'	toxicology
SELECT T1.molecule_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T1.label  =  '+' AND T2.bond_type  =  ' = ' GROUP BY T1.molecule_id ORDER BY COUNT(*) DESC LIMIT 1	toxicology
SELECT T2.element FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T1.label  =  '+' GROUP BY T2.element ORDER BY COUNT(*) LIMIT 1	toxicology
SELECT T1.atom_id2 FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id  =  T2.atom_id WHERE T2.element  =  'pb' UNION SELECT T1.atom_id FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id2  =  T2.atom_id WHERE T2.element  =  'pb'	toxicology
SELECT T3.element FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id  =  T2.bond_id JOIN atom AS T3 ON T1.atom_id2  =  T3.atom_id WHERE T2.bond_type  =  '#';	toxicology
SELECT CAST(COUNT(T1.bond_id) AS REAL) / ( SELECT COUNT(T3.atom_id) FROM atom AS T2 JOIN connected AS T3 ON T2.atom_id = T3.atom_id WHERE T2.element IN ( SELECT T4.element FROM atom AS T4 GROUP BY T4.element ORDER BY COUNT(*) DESC LIMIT 1 ) ) FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T3.atom_id = T2.atom_id2 WHERE T3.element IN ( SELECT T4.element FROM atom AS T4 GROUP BY T4.element ORDER BY COUNT(*) DESC LIMIT 1 )	toxicology
SELECT CAST(COUNT(CASE WHEN T3.label = '+' THEN T2.bond_id END) AS REAL) * 100 / COUNT(T2.bond_id) FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '-' JOIN molecule AS T3 ON T2.molecule_id = T3.molecule_id GROUP BY T2.bond_type ORDER BY COUNT(T2.bond_id) DESC LIMIT 1	toxicology
SELECT COUNT(*) FROM atom WHERE element IN ('c' ,  'h')	toxicology
SELECT T1.atom_id2 FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id2  =  T2.atom_id WHERE T2.element  =  'S'	toxicology
SELECT T2.bond_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id  =  T2.atom_id WHERE T1.element  =  'sn' UNION SELECT T2.bond_id2 FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id  =  T2.atom_id2 WHERE T1.element  =  'sn'	toxicology
SELECT COUNT(DISTINCT T1.element) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id  =  T2.atom_id JOIN bond AS T3 ON T2.bond_id  =  T3.bond_id WHERE T3.bond_type  =  '-'	toxicology
SELECT COUNT(*) FROM atom JOIN connected ON atom.atom_id = connected.atom_id2 WHERE connected.bond_id IN(SELECT bond_id FROM bond WHERE label = '#') AND atom.element IN('p', 'br')	toxicology
SELECT T2.bond_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T1.label  =  '+'	toxicology
SELECT T2.molecule_id FROM connected AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '-' AND T1.bond_type = 'single' GROUP BY T2.molecule_id	toxicology
SELECT CAST(COUNT(CASE WHEN T1.element = 'cl' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.atom_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id2 WHERE T2.bond_id IN (SELECT bond_id FROM bond WHERE label = '-')	toxicology
SELECT T1.label FROM molecule AS T1 WHERE T1.molecule_id IN ('TR000', 'TR001', 'TR002')	toxicology
SELECT T1.molecule_id FROM molecule AS T1 WHERE T1.label = '-'	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR030' AND label = '+'	toxicology
SELECT T2.bond_id FROM molecule AS T1 JOIN connected AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T1.molecule_id BETWEEN 'TR000' AND 'TR050'	toxicology
SELECT T2.element ,  T3.element FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id = T2.atom_id JOIN atom AS T3 ON T1.atom_id2 = T3.atom_id WHERE T1.bond_id = 'TR001_10_11'	toxicology
SELECT COUNT(*) FROM atom JOIN connected ON atom.atom_id = connected.atom_id2 WHERE atom.element = 'i'	toxicology
SELECT T2.label FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T1.element  =  'ca' GROUP BY T2.label ORDER BY COUNT(*) DESC LIMIT 1	toxicology
SELECT COUNT(*) > 0 FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 WHERE T2.bond_id = 'TR001_1_8' AND (T1.element = 'cl' OR T1.element = 'c') GROUP BY T1.element HAVING COUNT(*) > 1	toxicology
SELECT T3.molecule_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id  =  T2.atom_id JOIN molecule AS T3 ON T3.molecule_id  =  T1.molecule_id WHERE T1.element  =  'c' AND T2.bond_type  =  '#' AND T3.label  =  '-' LIMIT 2	toxicology
SELECT CAST(COUNT(CASE WHEN T1.element = 'cl' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.element) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'	toxicology
SELECT T2.element FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR001'	toxicology
SELECT T1.molecule_id FROM `bond` AS T1 JOIN `connected` AS T2 ON T1.bond_id  =  T2.bond_id WHERE T1.bond_type  =  ' = '	toxicology
SELECT T1.atom_id ,  T2.atom_id2 FROM connected AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '#' GROUP BY T1.atom_id ,  T2.atom_id2	toxicology
SELECT T3.element FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id  =  T2.bond_id JOIN atom AS T3 ON T1.atom_id2  =  T3.atom_id WHERE T1.bond_id  =  'TR000_1_2' UNION SELECT T4.element FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id  =  T2.bond_id JOIN atom AS T4 ON T1.atom_id  =  T4.atom_id WHERE T1.bond_id  =  'TR000_1_2'	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '-' AND molecule_id IN (SELECT molecule_id FROM bond WHERE bond_type = 'single')	toxicology
SELECT T2.label FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T1.bond_id  =  'TR001_10_11'	toxicology
SELECT T2.bond_id ,  T3.label FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id  =  T2.atom_id JOIN bond AS T3 ON T2.bond_id  =  T3.bond_id WHERE T3.bond_type  =  '#' ;	toxicology
SELECT T3.element ,  COUNT(*) FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id  =  T2.bond_id JOIN atom AS T3 ON T1.atom_id2  =  T3.atom_id WHERE T2.molecule_id IN(SELECT molecule_id FROM molecule WHERE label  =  '+') AND SUBSTR(T1.atom_id , 7 , 1)  =  '4' GROUP BY T3.element	toxicology
SELECT CAST(SUM(CASE WHEN T1.element = 'h' THEN 1 ELSE 0 END) AS REAL) / COUNT(T1.atom_id), T2.label FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR006'	toxicology
SELECT T2.label FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T1.element  =  'ca'	toxicology
SELECT T2.bond_type FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id  =  T2.atom_id OR T1.atom_id  =  T2.atom_id2 WHERE T1.element  =  'c'	toxicology
SELECT T3.element FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T1.bond_id = 'TR001_10_11' UNION SELECT T4.element FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T4 ON T2.atom_id2 = T4.atom_id WHERE T1.bond_id = 'TR001_10_11'	toxicology
SELECT CAST(SUM(CASE WHEN T2.bond_type  = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id  =  T2.molecule_id	toxicology
SELECT CAST(COUNT(CASE WHEN T2.bond_type  =  ' = ' THEN T1.bond_id ELSE NULL END) AS REAL) * 100 / COUNT(T1.bond_id) FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T2.molecule_id  =  'TR047'	toxicology
SELECT T3.label FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id = T2.atom_id JOIN molecule AS T3 ON T2.molecule_id = T3.molecule_id WHERE T1.atom_id = 'TR001_1'	toxicology
SELECT T2.label FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T1.molecule_id  =  'TR151'	toxicology
SELECT T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T2.molecule_id  =  'TR151'	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+'	toxicology
SELECT atom.atom_id FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.element = 'c' AND SUBSTR(atom.molecule_id, 3, 3) BETWEEN 10 AND 50;	toxicology
SELECT COUNT(*) FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '+'	toxicology
SELECT T2.bond_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T2.bond_type  =  ' =' AND T1.label  =  '+'	toxicology
SELECT COUNT(*) FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.element = 'h' AND molecule.label = '+'	toxicology
SELECT T3.molecule_id FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T1.bond_id = T3.bond_id WHERE T1.atom_id = 'TR000_1' AND T1.bond_id = 'TR000_1_2'	toxicology
SELECT T1.atom_id FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T1.element  =  'c' AND T2.label  =  '-'	toxicology
SELECT CAST(COUNT(CASE WHEN T2.element = 'h' THEN T1.molecule_id ELSE NULL END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'	toxicology
SELECT T1.label FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T2.molecule_id  =  'TR124'	toxicology
SELECT atom_id FROM atom WHERE molecule_id = 'TR186'	toxicology
SELECT bond_type FROM bond WHERE bond_id  =  'TR007_4_19'	toxicology
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id  =  T2.atom_id OR T1.atom_id  =  T2.atom_id2 WHERE T2.bond_id  =  'TR001_2_4'	toxicology
SELECT COUNT(*) ,  T3.label FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id  =  T2.bond_id JOIN molecule AS T3 ON T2.molecule_id  =  T3.molecule_id WHERE T2.bond_type  =  ' = ' AND T2.molecule_id  =  'TR006'	toxicology
SELECT T2.molecule_id ,  T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T2.label  =  '+'	toxicology
SELECT T2.bond_id ,  T1.atom_id ,  T3.atom_id2 FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id  =  T2.atom_id JOIN connected AS T3 ON T2.atom_id2  =  T3.atom_id WHERE T2.bond_type  =  '-'	toxicology
SELECT T3.molecule_id ,  T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id2 JOIN molecule AS T3 ON T3.molecule_id = T2.molecule_id WHERE T2.bond_id IN(SELECT bond_id FROM bond WHERE label = '#')	toxicology
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id  =  T2.atom_id OR T1.atom_id  =  T2.atom_id2 WHERE T2.bond_id  =  'TR000_2_3'	toxicology
SELECT COUNT(*) FROM connected JOIN atom AS atom1 ON connected.atom_id = atom1.atom_id JOIN atom AS atom2 ON connected.atom_id2 = atom2.atom_id WHERE atom1.element = 'cl' OR atom2.element = 'cl'	toxicology
SELECT T1.atom_id ,  COUNT(*) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id2 WHERE T1.molecule_id = 'TR346' GROUP BY T1.atom_id	toxicology
SELECT COUNT(DISTINCT T3.molecule_id) ,  SUM(CASE WHEN T2.label = '+' THEN 1 ELSE 0 END) FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id  =  T2.bond_id JOIN molecule AS T3 ON T2.molecule_id  =  T3.molecule_id WHERE T2.bond_type  =  ' = '	toxicology
SELECT COUNT(DISTINCT T3.molecule_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element != 's' AND T3.bond_type != '=' GROUP BY T3.molecule_id HAVING COUNT(*) > 0	toxicology
SELECT T2.label FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_id = 'TR001_2_4'	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR001'	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '-'	toxicology
SELECT T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'cl' AND T1.label = '+'	toxicology
SELECT T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'c' AND T1.label = '-' GROUP BY T1.molecule_id	toxicology
SELECT CAST(SUM(CASE WHEN T1.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'cl'	toxicology
SELECT T2.molecule_id FROM `bond` AS T1 JOIN `molecule` AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_id = 'TR001_1_7'	toxicology
SELECT COUNT(DISTINCT T1.element) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 WHERE T2.bond_id = 'TR001_3_4'	toxicology
SELECT T2.bond_type FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T1.atom_id = 'TR000_1' AND T1.atom_id2 = 'TR000_2'	toxicology
SELECT T1.molecule_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.atom_id2 = 'TR000_4' AND T2.atom_id = 'TR000_2'	toxicology
SELECT T1.element FROM atom AS T1 WHERE T1.atom_id = 'TR000_1'	toxicology
SELECT T1.label FROM molecule AS T1 WHERE T1.molecule_id = 'TR000'	toxicology
SELECT CAST(COUNT(CASE WHEN T2.bond_type = '-' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.atom_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id	toxicology
SELECT COUNT(DISTINCT T1.molecule_id) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' AND T1.element = 'n'	toxicology
SELECT T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id JOIN connected AS T3 ON T2.atom_id = T3.atom_id JOIN bond AS T4 ON T3.bond_id = T4.bond_id WHERE T2.element = 's' AND T4.bond_type = '='	toxicology
SELECT T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-' GROUP BY T1.molecule_id HAVING COUNT(T1.molecule_id) > 5	toxicology
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '=' AND T1.molecule_id = 'TR024' GROUP BY T1.element	toxicology
SELECT T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' GROUP BY T1.molecule_id ORDER BY COUNT(T2.atom_id) DESC LIMIT 1	toxicology
SELECT CAST(SUM(CASE WHEN T4.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T4.molecule_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id JOIN molecule AS T4 ON T1.molecule_id = T4.molecule_id WHERE T1.element = 'h' AND T3.bond_type = '#'	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+'	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '-' AND molecule_id BETWEEN 'TR004' AND 'TR010';	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR008' AND element = 'c'	toxicology
SELECT T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR004_7' AND T2.label = '-'	toxicology
SELECT COUNT(DISTINCT T3.molecule_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id2 JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'o' AND T3.bond_type = '='	toxicology
SELECT COUNT(*) FROM molecule  JOIN bond ON molecule.molecule_id = bond.molecule_id  WHERE bond.bond_type = '#' AND molecule.label = '-'	toxicology
SELECT T1.element, T3.bond_type FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.molecule_id = 'TR002' GROUP BY T1.element, T3.bond_type	toxicology
SELECT T3.atom_id FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id  =  T2.bond_id JOIN atom AS T3 ON T3.atom_id  =  T2.atom_id2 WHERE T1.bond_type  =  ' =' AND T3.element  =  'c' AND T1.molecule_id  =  'TR012'	toxicology
SELECT T1.atom_id FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' AND T1.element = 'o'	toxicology
SELECT name FROM cards WHERE cardkingdomFoilId IS NOT NULL AND cardkingdomId IS NOT NULL	card_games
SELECT * FROM cards WHERE borderColor = 'borderless' AND (cardKingdomFoilId IS NULL OR cardKingdomId IS NULL)	card_games
SELECT cardName FROM cards WHERE faceConvertedManaCost = (SELECT MAX(faceConvertedManaCost) FROM cards)	card_games
SELECT c.name FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.frameVersion = '2015' AND l.format = 'commander' AND l.status = 'Legal' AND c.edhrecRank < 100;	card_games
SELECT c.name FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.rarity = 'mythic' AND l.status = 'Banned' AND l.format = 'gladiator'	card_games
SELECT L.status FROM legalities AS L JOIN cards AS C ON L.uuid = C.uuid WHERE C.types = 'Artifact' AND C.side IS NULL AND L.format = 'vintage'	card_games
SELECT c.uuid, c.artist FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE (c.power = '*' OR c.power IS NULL) AND l.format = 'commander' AND l.status = 'Legal'	card_games
SELECT c.cardId, r.text, c.hasContentWarning FROM cards AS c JOIN rulings AS r ON c.uuid = r.uuid WHERE c.artist = 'Stephen Daniele'	card_games
SELECT T2.text FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Sublime Epiphany' AND T1.number = '74s'	card_games
SELECT c.name, c.artist, c.isPromo FROM cards AS c JOIN rulings AS r ON c.uuid = r.uuid GROUP BY c.uuid ORDER BY COUNT(r.uuid) DESC LIMIT 1;	card_games
SELECT DISTINCT c.foreignNames->>'language' FROM cards AS c WHERE c.name = 'Annul' AND c.number = '29';	card_games
SELECT name FROM cards WHERE lang = 'Japanese'	card_games
SELECT CAST(SUM(CASE WHEN language = 'Chinese Simplified' THEN 1 ELSE 0 END) AS REAL) / COUNT(*) * 100 FROM cards WHERE language IS NOT NULL	card_games
SELECT T1.set_name, T1.total_set_size FROM sets AS T1 JOIN cards AS T2 ON T1.set_code = T2.set WHERE T2.language = 'Italian' GROUP BY T1.set_name;	card_games
SELECT COUNT(DISTINCT T1.types) FROM cards AS T1 JOIN artworks AS T2 ON T1.uuid = T2.cardid WHERE T2.artist = 'Aaron Boyd'	card_games
SELECT keywords FROM cards WHERE name = 'Angel of Mercy'	card_games
SELECT COUNT(*) FROM cards WHERE power = '*'	card_games
SELECT T1.promoTypes FROM cards AS T1 WHERE T1.name = 'Duress'	card_games
SELECT T1.border_color FROM cards AS T1 WHERE T1.name = 'Ancestor''s Chosen'	card_games
SELECT originalType FROM cards WHERE name = 'Ancestor''s Chosen'	card_games
SELECT s.language FROM sets AS s JOIN cards AS c ON s.set = c.set WHERE c.name = 'Angel of Mercy'	card_games
SELECT COUNT(*) FROM legalities JOIN cards ON legalities.uuid = cards.uuid WHERE legalities.status = 'Restricted' AND cards.isTextless = 0;	card_games
SELECT rulings.text FROM cards JOIN rulings ON cards.uuid = rulings.uuid WHERE cards.name = 'Condemn'	card_games
SELECT COUNT(*) FROM legalities JOIN cards ON legalities.uuid = cards.uuid WHERE legalities.status = 'Restricted' AND cards.isStarter = 1;	card_games
SELECT T2.status FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Cloudchaser Eagle'	card_games
SELECT types FROM cards WHERE name = 'Benalish Knight'	card_games
SELECT T2.format FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Benalish Knight'	card_games
SELECT T1.artist FROM cards AS T1 JOIN card_art_details AS T2 ON T1.uuid = T2.card_uuid WHERE T2.language = 'Phyrexian' GROUP BY T1.artist	card_games
SELECT (COUNT(CASE WHEN borderColor = 'borderless' THEN id END) * 100.0 / COUNT(id)) AS percentage FROM cards	card_games
SELECT COUNT(*) FROM cards WHERE lang = 'German' AND is_reprint = 1;	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'borderless' AND languages = 'Russian'	card_games
SELECT COUNT(CASE WHEN T1.language = 'French' THEN 1 ELSE NULL END) * 100 / COUNT(*) AS percentage FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.isStorySpotlight = 1;	card_games
SELECT COUNT(*) FROM cards WHERE toughness = '99'	card_games
SELECT name FROM cards WHERE artist = 'Aaron Boyd'	card_games
SELECT COUNT(*) FROM cards WHERE "borderColor" = 'black' AND "availability" = 'mtgo';	card_games
SELECT uuid FROM cards WHERE convertedManaCost = 0;	card_games
SELECT T1.layout FROM cards AS T1 JOIN keywords AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Flying'	card_games
SELECT COUNT(*) FROM cards WHERE types = 'Summon - Angel' AND NOT subtypes = 'Angel'	card_games
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT id FROM cards WHERE duelDeck = 'a'	card_games
SELECT edhrec_rank FROM cards WHERE frame = '2015'	card_games
SELECT T1.artist FROM cards AS T1 JOIN languages AS T2 ON T1.uuid = T2.card_uuid WHERE T2.language = 'Chinese Simplified' GROUP BY T1.artist	card_games
SELECT name FROM cards WHERE availability = 'paper' AND languages = ARRAY['Japanese'] GROUP BY name HAVING COUNT(*) = 1;	card_games
SELECT COUNT(*) FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.status = 'Banned' AND T1.borderColor = 'white'	card_games
SELECT C.uuid, FD.language FROM cards AS C JOIN legalities AS L ON C.uuid = L.uuid JOIN card_foreign_data AS FD ON C.uuid = FD.uuid WHERE L.format = 'legacy' GROUP BY C.uuid, FD.language;	card_games
SELECT rulings FROM cards WHERE name = 'Beacon of Immortality' LIMIT 1;	card_games
SELECT COUNT(c.uuid), l.status FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.frameVersion = 'future' AND l.status = 'Legal' GROUP BY l.status;	card_games
SELECT c.name, c.color_identity FROM cards AS c WHERE c.set_code = 'OGW'	card_games
SELECT C.name, C.languages  FROM cards AS C  JOIN translations AS T ON C.uuid = T.cardUUID  WHERE C.set = '10E' AND C.convertedManaCost = 5;	card_games
SELECT c.name, r.rulings FROM cards AS c JOIN rulings AS r ON c.uuid = r.uuid WHERE c.originalTypes LIKE '%Creature - Elf%'	card_games
SELECT T1.colors ,  T2.format FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.id BETWEEN 1 AND 20 GROUP BY T1.colors ,  T2.format	card_games
SELECT c.name FROM cards AS c WHERE c.originalType = 'Artifact' AND c.colors = 'B' AND EXISTS (SELECT 1 FROM cardForeignData AS f WHERE f.cardId = c.uuid AND f.language != 'en')	card_games
SELECT c.name FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.rarity = 'uncommon' ORDER BY c.rulings_date ASC LIMIT 3;	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'John Avon' AND cardKingdomId IS NOT NULL AND cardKingdomFoilId IS NOT NULL	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND kingdomFoilId IS NOT NULL AND kingdomId IS NOT NULL	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'UDON' AND availability = 'mtgo' AND hand = '-1'	card_games
SELECT COUNT(*) FROM cards WHERE frameVersion = '1993' AND availability = 'paper' AND hasContentWarning = 1;	card_games
SELECT manaCost FROM cards WHERE layout = 'normal' AND frameVersion = '2003' AND borderColor = 'black' AND availability = 'mtgo,paper'	card_games
SELECT SUM(CAST(REPLACE(manaCost, '{', '') AS INT)) FROM cards WHERE artist = 'Rob Alexander' AND manaCost IS NOT NULL GROUP BY artist	card_games
SELECT DISTINCT types FROM cards WHERE availability = 'arena' AND types IS NOT NULL;	card_games
SELECT T1.setCode FROM sets AS T1 JOIN cards AS T2 ON T1.setId = T2.set WHERE T2.foreignNames LIKE '%es'	card_games
SELECT CAST(SUM(CASE WHEN isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) / COUNT(id) * 100 FROM cards WHERE frameEffects = 'legendary'	card_games
SELECT CAST(SUM(CASE WHEN c.isStoryHighlight = 1 AND c.isTextless = 0 THEN 1 ELSE 0 END) AS REAL) / COUNT(c.id) * 100 AS percentage, c.id FROM cards AS c WHERE c.isStoryHighlight = 1 AND c.isTextless = 0 GROUP BY c.id	card_games
SELECT T1.name ,  SUM(CASE WHEN T2.language = 'Spanish' THEN 1 ELSE 0 END) * 100 / COUNT(T2.id) FROM cards AS T1 JOIN printings AS T2 ON T1.uuid = T2.card_uuid GROUP BY T1.name	card_games
SELECT T2.name FROM sets AS T1 JOIN languages AS T2 ON T1.setCode = T2.setCode WHERE T1.baseSetSize = 309 GROUP BY T2.name	card_games
SELECT COUNT(*) FROM cards WHERE block = 'Commander' AND code IN (SELECT DISTINCT code FROM sets WHERE language = 'Portuguese (Brazil)')	card_games
SELECT c.uuid FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.types LIKE '%Creature%' AND l.status = 'Legal' GROUP BY c.uuid, l.status;	card_games
SELECT types FROM cards WHERE lang = 'German' AND types IS NOT NULL	card_games
SELECT COUNT(*) FROM cards WHERE (power IS NULL OR power = '*') AND text LIKE '%triggered ability%'	card_games
SELECT COUNT(*) FROM cards WHERE uuid IN (SELECT uuid FROM legalities WHERE format = 'premodern') AND ruling = 'This is a triggered mana ability.' AND side IS NULL;	card_games
SELECT c.uuid FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.artist = 'Erica Yang' AND l.format = 'pauper' AND c.availability = 'paper'	card_games
SELECT T1.artist FROM cards AS T1 WHERE T1.text = 'Das perfekte Gegenmittel zu einer dichten Formation'	card_games
SELECT foreignNames FROM cards WHERE type = 'Creature' AND layout = 'normal' AND borderColor = 'black' AND artist = 'Matthew D. Wilson' AND EXISTS (SELECT * FROM cardForeignData WHERE cards.uuid = cardForeignData.parentCardId AND cardForeignData.language = 'French')	card_games
SELECT COUNT(*) FROM cards c JOIN rulings r ON c.uuid = r.card_uuid WHERE c.rarity = 'rare' AND r.date = '2007-02-01'	card_games
SELECT T2.language FROM sets AS T1 JOIN translations AS T2 ON T1.code = T2.setCode WHERE T1.baseSetSize = 180 AND T1.block = 'Ravnica'	card_games
SELECT COUNT(CASE WHEN C.hasContentWarning = 0 THEN 1 ELSE NULL END) * 100 / COUNT(*) AS percentage FROM cards AS C JOIN legalities AS L ON C.uuid = L.uuid WHERE L.format = 'commander' AND L.status = 'Legal';	card_games
SELECT CAST(SUM(CASE WHEN T1.language = 'French' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 JOIN card_details AS T2 ON T1.uuid = T2.uuid WHERE T2.power IS NULL OR T2.power = '*'	card_games
SELECT CAST(SUM(CASE WHEN c.set_type = 'expansion' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(c.uuid) FROM cards AS c WHERE c.language = 'Japanese'	card_games
SELECT T1.printing FROM cards AS T1 WHERE T1.artist = 'Daren Bader'	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'borderless' AND edhrecRank > 12000;	card_games
SELECT COUNT(*) FROM cards WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1;	card_games
SELECT c.name FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.power IS NULL OR c.power = '*' AND c.promoTypes LIKE '%arenaleague%' GROUP BY c.name ORDER BY c.name LIMIT 3;	card_games
SELECT language FROM cards WHERE multiverseid = 149934	card_games
SELECT l.uuid AS id1, l2.uuid AS id2 FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid JOIN cards AS c2 ON c2.name = c.name AND c2.set = c.set AND c2.number IN (SELECT number FROM cards WHERE name = c.name AND set = c.set AND isFoil = TRUE) JOIN legalities AS l2 ON c2.uuid = l2.uuid WHERE c.isFoil = FALSE AND c2.isFoil = TRUE AND c.supertypes LIKE '%Basic%' AND c2.supertypes LIKE '%Basic%' AND c.types LIKE '%Land%' AND c2.types LIKE '%Land%' ORDER BY l.uuid, l2.uuid LIMIT 3;	card_games
SELECT CAST(SUM(CASE WHEN isTextless = 1 AND layout = 'normal' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards WHERE layout = 'normal'	card_games
SELECT number FROM cards WHERE type_line NOT LIKE '% // %' AND (subtypes @> '["Angel"]' OR subtypes @> '["Wizard"]') AND subtypes ?| '["Angel","Wizard"]'	card_games
SELECT name FROM sets WHERE mtgoCode IS NULL OR mtgoCode = '' ORDER BY name LIMIT 3;	card_games
SELECT DISTINCT language FROM cards WHERE mcmName = 'Archenemy' AND setCode = 'ARC'	card_games
SELECT T1.name, T1.foreignNames FROM cards AS T1 JOIN sets AS T2 ON T1.set = T2.code WHERE T2.id = 5	card_games
SELECT language, expansion_type FROM sets WHERE id = 206	card_games
SELECT T1.set_id, T1.set_name FROM sets AS T1 JOIN cards AS T2 ON T1.set_id = T2.set_id WHERE T1.block = 'Shadowmoor' AND T2.lang = 'Italian' GROUP BY T1.set_id, T1.set_name ORDER BY T1.set_name LIMIT 2;	card_games
SELECT c.setId FROM cards AS c WHERE c.isForeignOnly = TRUE AND c.isFoilOnly = TRUE AND c.language = 'Japanese'	card_games
SELECT setCode FROM cards WHERE language = 'Russian' GROUP BY setCode ORDER BY COUNT(*) DESC LIMIT 1	card_games
SELECT CAST(SUM(CASE WHEN c.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(c.uuid) FROM cards AS c WHERE c.language = 'Chinese Simplified' AND c.isOnlineOnly = 1;	card_games
SELECT COUNT(*) FROM sets WHERE language = 'Japanese' AND (mtgoCode IS NULL OR mtgoCode = '')	card_games
SELECT COUNT(*), uuid FROM cards WHERE borderColor = 'black' GROUP BY uuid;	card_games
SELECT COUNT(*), uuid FROM cards WHERE frameEffects = 'extendedart' GROUP BY uuid;	card_games
SELECT c.name FROM cards AS c WHERE c.isFullArt = 1 AND c.borderColor = 'black'	card_games
SELECT language FROM sets WHERE set_id = '174'	card_games
SELECT set_name FROM sets WHERE set_code = 'ALL'	card_games
SELECT foreignData.language FROM cards AS card JOIN foreignData ON card.uuid = foreignData.uuid WHERE card.name = 'A Pedra Fellwar' GROUP BY foreignData.language	card_games
SELECT set_code FROM sets WHERE release_date = '2007-07-13' LIMIT 1;	card_games
SELECT C.baseSetSize, C.setCode FROM sets AS S JOIN cards AS C ON S.setName = C.set WHERE S.block = 'Masques' OR S.block = 'Mirage' GROUP BY C.baseSetSize, C.setCode;	card_games
SELECT setCode FROM sets WHERE setType = 'expansion'	card_games
SELECT C.foreignNames, C.types FROM cards AS C WHERE C.watermark = 'boros'	card_games
SELECT c.lang, c.flavor_text, c.types FROM cards AS c WHERE c.watermark = 'colorpie'	card_games
SELECT CAST(SUM(CASE WHEN convertedManaCost = 10 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards WHERE name = 'Abyssal Horror'	card_games
SELECT T1.setCode FROM sets AS T1 JOIN cards AS T2 ON T1.setId = T2.set WHERE T2.supertypes LIKE '%Commander%' GROUP BY T1.setCode	card_games
SELECT C.foreignNames, C.types FROM cards AS C WHERE C.watermark = 'abzan'	card_games
SELECT C.types FROM cards AS C WHERE C.watermark = 'azorius'	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE availability LIKE '%paper%' AND hand_size > 0	card_games
SELECT name FROM cards WHERE isTextless = 0;	card_games
SELECT uncmc FROM cards WHERE name = 'Ancestor''s Chosen' LIMIT 1;	card_games
SELECT COUNT(*) FROM cards WHERE border_color = 'white' AND (power = '*' OR power IS NULL)	card_games
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL	card_games
SELECT types FROM cards WHERE name = 'Molimo, Maro-Sorcerer'	card_games
SELECT T1.purchaseUrls FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.promoTypes = 'bundle' GROUP BY T1.purchaseUrls	card_games
SELECT COUNT(DISTINCT c.artist) FROM cards AS c WHERE c.border_color = 'black' AND c.availability LIKE '%arena,mtgo%'	card_games
SELECT name FROM cards WHERE name IN ('Serra Angel', 'Shrine Keeper') ORDER BY convertedManaCost DESC LIMIT 1;	card_games
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer' LIMIT 1;	card_games
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3;	card_games
SELECT T1.set_name FROM sets AS T1 JOIN cards AS T2 ON T1.set_code = T2.set WHERE T2.name = 'Ancestor''s Chosen' AND T2.printings ->> '$[*].language' LIKE '%Italian%'	card_games
SELECT COUNT(*) FROM translations WHERE cardname = 'Angel of Mercy'	card_games
SELECT name FROM cards WHERE sets ->> 'name' = 'Hauptset Zehnte Edition' AND sets ->> 'translation' = 'Hauptset Zehnte Edition'	card_games
SELECT EXISTS (SELECT * FROM cards WHERE name = 'Ancestor''s Chosen' AND language = 'Korean') AS has_korean_version;	card_games
SELECT COUNT(*) FROM cards WHERE `set` = 'Hauptset Zehnte Edition' AND artist = 'Adam Rex'	card_games
SELECT COUNT(*) FROM sets WHERE name = 'Hauptset Zehnte Edition'	card_games
SELECT T2.translation FROM sets AS T1 JOIN translations AS T2 ON T1.uuid = T2.set_uuid WHERE T1.name = 'Eighth Edition' AND T2.language = 'Chinese Simplified'	card_games
SELECT COUNT(*) > 0 FROM cards WHERE name = 'Angel of Mercy' AND mtgoCode IS NOT NULL	card_games
SELECT T1.releaseDate FROM sets AS T1 JOIN cards AS T2 ON T1.setCode = T2.set WHERE T2.name = 'Ancestor''s Chosen'	card_games
SELECT T1.type FROM sets AS T1 JOIN translations AS T2 ON T1.set_id = T2.set_id WHERE T2.translation = 'Hauptset Zehnte Edition'	card_games
SELECT COUNT(*) FROM sets WHERE block = 'Ice Age' AND language = 'Italian' AND translation IS NOT NULL;	card_games
SELECT C.name FROM cards AS C WHERE C.name = 'Adarkar Valkyrie' AND C.isForeignOnly = 1;	card_games
SELECT COUNT(*) FROM sets WHERE language = 'Italian' AND baseSetSize < 100 AND translation IS NOT NULL	card_games
SELECT COUNT(*) FROM cards WHERE set_name = 'Coldsnap' AND border_color = 'black'	card_games
SELECT c.name FROM cards AS c JOIN card_sets AS cs ON c.uuid = cs.card_uuid WHERE cs.set_name = 'Coldsnap' ORDER BY c.converted_mana_cost DESC LIMIT 1;	card_games
SELECT T2.artist FROM cards AS T1 JOIN card_artists AS T2 ON T1.uuid = T2.uuid WHERE T1.set = 'Coldsnap' AND T2.artist IN ('Jeremy Jarvis', 'Aaron Miller','Chippy') GROUP BY T2.artist	card_games
SELECT * FROM cards WHERE name = 'Coldsnap' AND number = 4 LIMIT 1;	card_games
SELECT COUNT(*) FROM cards WHERE set = 'Coldsnap' AND (power = '*' OR power IS NULL) AND convertedManaCost > 5	card_games
SELECT t1.flavortext FROM `cards` AS t1 WHERE t1.name = 'Ancestor''s Chosen' AND t1.language = 'Italian'	card_games
SELECT DISTINCT c.foreignData.language FROM cards AS c WHERE c.name = 'Ancestor''s Chosen' AND c.flavorText IS NOT NULL	card_games
SELECT cards.name, cards.type_line  FROM cards  JOIN translations ON cards.uuid = translations.uuid  WHERE cards.name = 'Ancestor''s Chosen' AND translations.language = 'German'	card_games
SELECT rulings_it FROM cards WHERE name = 'Coldsnap' AND language = 'Italian' GROUP BY rulings_it ORDER BY rulings_it ASC	card_games
SELECT c.name_italian FROM cards AS c WHERE c.set_name = 'Coldsnap' AND c.language = 'Italian' ORDER BY c.converted_mana_cost DESC LIMIT 1;	card_games
SELECT rulings.date FROM rulings JOIN cards ON rulings.uuid = cards.uuid WHERE cards.name = 'Reminisce'	card_games
SELECT CAST(COUNT(CASE WHEN c.convertedManaCost = 7 THEN c.uuid END) AS REAL) * 100 / COUNT(c.uuid) FROM cards AS c WHERE c.set = 'Coldsnap'	card_games
SELECT CAST(COUNT(CASE WHEN T1.cardKingdomFoilId IS NOT NULL AND T1.cardKingdomId IS NOT NULL THEN 1 END) AS REAL) * 100 / COUNT(T1.uuid) FROM cards AS T1 JOIN sets AS T2 ON T1.sets = T2.code WHERE T2.name = 'Coldsnap'	card_games
SELECT setCode FROM sets WHERE releaseDate = '2017-07-14' LIMIT 1;	card_games
SELECT keyruneCode FROM sets WHERE code = 'PKHC'	card_games
SELECT mcmId FROM sets WHERE code = 'SS2'	card_games
SELECT mcmName FROM sets WHERE releaseDate = '2017-06-09' LIMIT 1;	card_games
SELECT type FROM sets WHERE name = 'From the Vault: Lore'	card_games
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized'	card_games
SELECT c.name, r.text, CASE WHEN c.hasContentWarning = 1 THEN 'Yes' ELSE 'No' END AS hasMissingOrDegradedProperties FROM cards AS c JOIN rulings AS r ON c.uuid = r.uuid WHERE c.artist = 'Jim Pavelec';	card_games
SELECT sets.releaseDate FROM sets JOIN cards ON sets.code = cards.set WHERE cards.name = 'Evacuation'	card_games
SELECT baseSetSize FROM sets WHERE name = 'Alara Reborn' AND translations @> '[{"language": "Italian", "name": "Rinascita di Alara"}]' LIMIT 1;	card_games
SELECT C.type FROM cards AS C WHERE C.set_name = 'Huitième édition' GROUP BY C.type	card_games
SELECT T2.set_name FROM cards AS T1 JOIN sets AS T2 ON T1.set_id = T2.set_id WHERE T1.name = 'Tendo Ice Bridge' AND T1.printings LIKE '%French%'	card_games
SELECT COUNT(*) FROM sets WHERE name = 'Tenth Edition' AND translation IS NOT NULL	card_games
SELECT T1.sets FROM card_sets AS T1 JOIN cards AS T2 ON T1.card_uuid = T2.uuid WHERE T2.name = 'Fellwar Stone' AND T1.language = 'Japanese' GROUP BY T1.sets LIMIT 1;	card_games
SELECT card_name FROM cards WHERE set_name = 'Journey into Nyx Hero''s Path' AND converted_mana_cost = (SELECT MAX(converted_mana_cost) FROM cards WHERE set_name = 'Journey into Nyx Hero''s Path')	card_games
SELECT release_date FROM sets WHERE translation = 'Ola de frío'	card_games
SELECT T1.type FROM sets AS T1 INNER JOIN cards AS T2 ON T1.set_code = T2.set WHERE T2.name = 'Samite Pilgrim' GROUP BY T1.type	card_games
SELECT COUNT(*) FROM cards WHERE name = 'World Championship Decks 2004' AND convertedManaCost = 3;	card_games
SELECT t1.name FROM card_sets AS t1 JOIN translations AS t2 ON t1.uuid = t2.set_uuid WHERE t1.name = 'Mirrodin' AND t2.language = 'Chinese Simplified'	card_games
SELECT (SUM(CASE WHEN c.isNonFoilOnly = 1 THEN 1 ELSE 0 END) * 100 / COUNT(*)) AS percentage FROM cards AS c WHERE c.language = 'Japanese'	card_games
SELECT SUM(CASE WHEN c.isOnlineOnly = 1 THEN 1 ELSE 0 END) * 100 / COUNT(*) AS percentage FROM cards AS c WHERE c.language = 'Portuguese (Brazil)'	card_games
SELECT DISTINCT C.availability FROM cards AS C WHERE C.artist = 'Aleksi Briclot' AND C.isTextless = 1	card_games
SELECT T2.id FROM `cards` AS T1 JOIN `sets` AS T2 ON T1.set = T2.code GROUP BY T2.code ORDER BY COUNT(T1.uuid) DESC LIMIT 1	card_games
SELECT T1.artist FROM cards AS T1 JOIN card_prices AS T2 ON T1.uuid = T2.card_uuid WHERE T1.side IS NULL ORDER BY T2.converted_mana_cost DESC LIMIT 1	card_games
SELECT T1.frame_effects FROM (SELECT frame_effects, COUNT(*) AS cnt FROM cards WHERE card_kingdom_foil_id IS NOT NULL AND card_kingdom_id IS NOT NULL GROUP BY frame_effects) AS T1 JOIN (SELECT MAX(cnt) AS max_cnt FROM (SELECT frame_effects, COUNT(*) AS cnt FROM cards WHERE card_kingdom_foil_id IS NOT NULL AND card_kingdom_id IS NOT NULL GROUP BY frame_effects)) AS T2 ON T1.cnt = T2.max_cnt ORDER BY T1.frame_effects LIMIT 1	card_games
SELECT COUNT(*) FROM cards WHERE (power IS NULL OR power = '*') AND hasFoil = 0 AND duelDeck = 'a'	card_games
SELECT s.id FROM sets AS s WHERE s.type = 'commander' AND s.totalSetSize = (SELECT MAX(totalSetSize) FROM sets WHERE type = 'commander')	card_games
SELECT c.name FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE l.format = 'duel' ORDER BY c.manaCost DESC LIMIT 10;	card_games
SELECT T1.originalReleaseDate, T2.format FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'mythic' AND T2.status = 'Legal' ORDER BY T1.originalReleaseDate ASC LIMIT 1;	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Volkan Baǵa' AND language = 'French'	card_games
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'rare' AND c.types LIKE '%Enchantment%' AND c.name = 'Abundance' AND l.status = 'Legal' GROUP BY c.uuid HAVING COUNT(*) > 0;	card_games
SELECT T2.format, T1.name FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.status = 'Banned' GROUP BY T2.format ORDER BY COUNT(*) DESC LIMIT 1	card_games
SELECT language FROM sets WHERE name = 'Battlebond' LIMIT 1;	card_games
SELECT T2.format FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.artist IN (SELECT artist FROM cards GROUP BY artist ORDER BY COUNT(*) ASC LIMIT 1)	card_games
SELECT L.status FROM legalities AS L JOIN cards AS C ON L.uuid = C.uuid WHERE C.frameVersion = '1997' AND C.artist = 'D. Alexander Gregory' AND (C.hasContentWarning = 1 OR C.printerName = 'Wizards of the Coast') AND L.format = 'legacy'	card_games
SELECT C.name, L.format FROM legalities AS L JOIN cards AS C ON L.uuid = C.uuid WHERE C.edhrecRank = 1 AND L.status = 'Banned'	card_games
SELECT AVG(T1.id) AS avg_sets, T2.language FROM sets AS T1 JOIN cards AS T2 ON T1.code = T2.set WHERE T1.releaseDate BETWEEN '2012-01-01' AND '2015-12-31' GROUP BY T2.language ORDER BY COUNT(T2.language) DESC LIMIT 1	card_games
SELECT T1.artist FROM cards AS T1 JOIN cardborder AS T2 ON T1.uuid = T2.card_uuid WHERE T2.border_color = 'black' AND T1.availability = 'arena' GROUP BY T1.artist	card_games
SELECT uuid FROM legalities WHERE format = 'oldschool' AND status IN ('banned', 'restricted')	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability = 'paper'	card_games
SELECT T2.text FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Kev Walker' ORDER BY T2.date DESC	card_games
SELECT C.name, L.format FROM cards AS C JOIN legalities AS L ON C.uuid = L.uuid WHERE C.set = 'Hour of Devastation' AND L.status = 'Legal' GROUP BY C.name, L.format	card_games
SELECT name FROM sets WHERE language = 'Korean' AND NOT EXISTS (SELECT * FROM sets WHERE language LIKE '%Japanese%' AND name = name) GROUP BY name	card_games
SELECT C.frameVersion, C.name FROM cards AS C JOIN legalities AS L ON C.uuid = L.uuid WHERE C.artist = 'Allen Williams' AND L.status = 'Banned' UNION SELECT DISTINCT frameVersion, name FROM cards WHERE artist = 'Allen Williams'	card_games
SELECT DisplayName FROM Users WHERE DisplayName IN ('Harlan', 'Jarrod Dixon') ORDER BY Reputation DESC LIMIT 1;	codebase_community
SELECT DisplayName FROM Users WHERE YEAR(CreationDate) = 2011;	codebase_community
SELECT COUNT(*) FROM Users WHERE LastAccessDate > '2014-09-01'	codebase_community
SELECT DisplayName FROM Users ORDER BY Views DESC LIMIT 1	codebase_community
SELECT COUNT(*) FROM Users WHERE UpVotes > 100 AND DownVotes > 1;	codebase_community
SELECT COUNT(*) FROM Users WHERE Views > 10 AND YEAR(CreationDate) > 2013;	codebase_community
SELECT COUNT(*) FROM Posts WHERE OwnerUserId = (SELECT AccountId FROM Users WHERE DisplayName = 'csgillespie')	codebase_community
SELECT T1.Title FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie'	codebase_community
SELECT DisplayName FROM Users WHERE AccountId = (SELECT AccountId FROM Posts WHERE Title = 'Eliciting priors from experts')	codebase_community
SELECT T1.Title FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie' ORDER BY T1.ViewCount DESC LIMIT 1	codebase_community
SELECT T2.DisplayName FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.FavoriteCount = (SELECT MAX(FavoriteCount) FROM Posts)	codebase_community
SELECT SUM(T2.CommentCount) FROM Posts AS T1 INNER JOIN Posts AS T2 ON T1.OwnerUserId = T2.OwnerUserId WHERE T1.DisplayName = 'csgillespie' AND T1.PostTypeId = 2;	codebase_community
SELECT T2.AnswerCount FROM Posts AS T1 JOIN PostLinks AS T2 ON T1.Id = T2.PostId WHERE T1.OwnerUserId IN (SELECT Id FROM Users WHERE DisplayName = 'csgillespie') AND T2.LinkTypeId = 3 GROUP BY T2.AnswerCount ORDER BY T2.AnswerCount DESC LIMIT 1	codebase_community
SELECT T2.DisplayName FROM Posts AS T1 JOIN Users AS T2 ON T1.LastEditorUserId = T2.Id WHERE T1.Title = 'Examples for teaching: Correlation does not mean causation'	codebase_community
SELECT COUNT(*) FROM Posts WHERE OwnerUserId = (SELECT Id FROM Users WHERE DisplayName = 'csgillespie') AND ParentId IS NULL	codebase_community
SELECT T1.DisplayName FROM Users AS T1 JOIN Posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T2.ClosedDate IS NOT NULL	codebase_community
SELECT COUNT(*) FROM Posts WHERE OwnerUserId IN (SELECT Id FROM Users WHERE Age > 65) AND Score >= 20	codebase_community
SELECT L.Location FROM Posts AS P JOIN Users AS U ON P.OwnerUserId = U.Id JOIN UserLocations AS L ON U.Id = L.UserId WHERE P.Title = 'Eliciting priors from experts'	codebase_community
SELECT Posts.Body FROM Tags INNER JOIN PostTags ON PostTags.TagId = Tags.Id INNER JOIN Posts ON Posts.Id = PostTags.PostId WHERE Tags.TagName = 'bayesian' AND Posts.PostTypeId = 1 LIMIT 1	codebase_community
SELECT T1.Body FROM Posts AS T1 JOIN Tags AS T2 ON T1.Id = T2.ExcerptPostId WHERE T2.Count = ( SELECT MAX(T3.Count) FROM Tags AS T3 )	codebase_community
SELECT COUNT(*) FROM Badges WHERE UserId = (SELECT AccountId FROM Users WHERE DisplayName = 'csgillespie')	codebase_community
SELECT B.Name FROM Badges AS B JOIN Users AS U ON B.UserId = U.Id WHERE U.DisplayName = 'csgillespie' GROUP BY B.Name ORDER BY B.Name ASC	codebase_community
SELECT COUNT(*) FROM Badges WHERE UserId = (SELECT Id FROM Users WHERE DisplayName = 'csgillespie') AND YEAR(Date) = 2011	codebase_community
SELECT T2.DisplayName FROM (SELECT UserId, COUNT(*) AS BadgeCount FROM Badges GROUP BY UserId ORDER BY BadgeCount DESC LIMIT 1) AS T1 INNER JOIN Users AS T2 ON T1.UserId = T2.Id	codebase_community
SELECT AVG(T1.Score) FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie'	codebase_community
SELECT AVG(BadgeCount) AS AverageBadges FROM (SELECT COUNT(DISTINCT u.Id) AS BadgeCount FROM Users u JOIN Badges b ON u.Id = b.UserId WHERE u.Views > 200 GROUP BY u.Id) AS temp	codebase_community
SELECT CAST(SUM(CASE WHEN T2.Age > 65 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.Id) FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Score > 5	codebase_community
SELECT SUM(UpVotes) + SUM(DownVotes) FROM Users WHERE UserId = 58 AND CreationDate = '2010-07-19'	codebase_community
SELECT CreationDate FROM ( SELECT CreationDate, COUNT(Id) AS num_votes FROM Users GROUP BY CreationDate ) AS vote_counts WHERE num_votes = ( SELECT MAX(num_votes) FROM ( SELECT COUNT(Id) AS num_votes FROM Users GROUP BY CreationDate ) AS max_votes );	codebase_community
SELECT COUNT(Id) FROM Badges WHERE Name = 'Revival'	codebase_community
SELECT T1.Title FROM Posts AS T1 JOIN Comments AS T2 ON T1.Id = T2.PostId WHERE T2.Score = (SELECT MAX(Score) FROM Comments)	codebase_community
SELECT T2.CommentCount FROM Posts AS T1 JOIN PostInTags AS T2 ON T1.Id = T2.PostId WHERE T1.ViewCount = 1910	codebase_community
SELECT T1.FavoriteCount FROM Posts AS T1 INNER JOIN Comments AS T2 ON T1.Id = T2.PostId WHERE T2.UserId = '3025' AND T2.CreationDate = '2014-04-23 20:29:39.0'	codebase_community
SELECT Text FROM Comments WHERE PostId = 107829 AND CommentCount = 1;	codebase_community
SELECT CASE WHEN ClosedDate IS NULL THEN 'Not Well-Finished' ELSE 'Well-Finished' END AS PostStatus FROM Posts WHERE Id IN (SELECT PostId FROM Comments WHERE UserId = '23853' AND CreationDate = '2013-07-12 09:08:18.0')	codebase_community
SELECT Reputation FROM Users WHERE Id = (SELECT OwnerUserId FROM Posts WHERE Id = 65041)	codebase_community
SELECT COUNT(*) FROM Posts WHERE OwnerUserId = (SELECT Id FROM Users WHERE DisplayName = 'Tiago Pasqualini')	codebase_community
SELECT DisplayName FROM Users WHERE AccountId = (SELECT AccountId FROM Votes WHERE Id = 6347)	codebase_community
SELECT SUM(UpVotes) + SUM(DownVotes) FROM Users WHERE DisplayName = 'Data Visualization'	codebase_community
SELECT T2.Name FROM Users AS T1 JOIN Badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'DatEpicCoderGuyWhoPrograms'	codebase_community
SELECT COUNT(T1.Id) / COUNT(T2.Id) FROM Posts AS T1 JOIN Votes AS T2 ON T1.OwnerUserId = '24' AND T2.UserId = '24' WHERE T1.PostTypeId = 1 OR T1.PostTypeId = 2	codebase_community
SELECT ViewCount FROM Posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer'	codebase_community
SELECT Text FROM Comments WHERE Score = 17	codebase_community
SELECT DisplayName FROM Users WHERE WebsiteUrl = 'http://stackoverflow.com'	codebase_community
SELECT B.Name FROM Users AS U JOIN Badges AS B ON U.Id = B.UserId WHERE U.DisplayName = 'SilentGhost'	codebase_community
SELECT T1.DisplayName FROM Users AS T1 JOIN Comments AS T2 ON T1.Id = T2.UserId WHERE T2.Text = 'thank you user93!'	codebase_community
SELECT T2.Text FROM Users AS T1 JOIN Comments AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'A Lion'	codebase_community
SELECT T2.DisplayName, T1.Reputation FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Title = 'Understanding what Dassault iSight is doing?'	codebase_community
SELECT T2.Text FROM Posts AS T1 JOIN Comments AS T2 ON T1.Id = T2.PostId WHERE T1.Title = 'How does gentle boosting differ from AdaBoost?'	codebase_community
SELECT DisplayName FROM Users WHERE EXISTS (SELECT * FROM Badges WHERE UserId = Users.Id AND Name = 'Necromancer') LIMIT 10	codebase_community
SELECT E.DisplayName FROM Posts AS P JOIN PostHistory AS PH ON P.Id = PH.PostId JOIN Users AS E ON PH.UserId = E.Id WHERE P.Title = 'Open source tools for visualizing multi-dimensional data?' AND PH.PostHistoryTypeId = 4	codebase_community
SELECT T1.Title FROM Posts AS T1 JOIN PostHistory AS T2 ON T1.Id = T2.PostId WHERE T2.HistoryTypeId IN (4, 5) AND T2.UserId = (SELECT AccountId FROM Users WHERE DisplayName = 'Vebjorn Ljosa')	codebase_community
SELECT SUM(Posts.Score) AS TotalScore, Users.WebsiteUrl FROM Posts INNER JOIN Users ON Posts.LastEditorUserId = Users.Id WHERE Users.DisplayName = 'Yevgeny' GROUP BY Users.WebsiteUrl	codebase_community
SELECT T3.Text FROM Posts AS T1 JOIN PostHistory AS T2 ON T1.Id = T2.PostId JOIN Comments AS T3 ON T2.UserId = T3.UserId WHERE T1.Title = 'Why square the difference instead of taking the absolute value in standard deviation?' AND T2.PostHistoryTypeId = 4	codebase_community
SELECT SUM(T2.BountyAmount) FROM Posts AS T1 JOIN PostHistory AS T2 ON T1.Id = T2.PostId WHERE T1.Title LIKE '%data%'	codebase_community
SELECT T2.DisplayName FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.BountyAmount = 50 AND T1.Title LIKE '%variance%'	codebase_community
SELECT T1.Title, T2.Text, AVG(T1.ViewCount) AS AverageViewCount FROM Posts AS T1 JOIN Comments AS T2 ON T1.Id = T2.PostId WHERE T1.Tags LIKE '%<humor>%' GROUP BY T1.Title, T2.Text	codebase_community
SELECT COUNT(*) FROM Comments WHERE OwnerUserId = 13;	codebase_community
SELECT AccountId FROM Users ORDER BY Reputation DESC LIMIT 1	codebase_community
SELECT AccountId FROM Users WHERE Views = (SELECT MIN(Views) FROM Users)	codebase_community
SELECT COUNT(*) FROM Badges WHERE YEAR(BadgeDate) = 2011 AND Name = 'Supporter'	codebase_community
SELECT COUNT(*) FROM (SELECT UserId, COUNT(Name) AS NumBadges FROM Badges GROUP BY UserId HAVING COUNT(Name) > 5) AS UsersWithMoreThanFiveBadges	codebase_community
SELECT COUNT(*) FROM Users WHERE Id IN (SELECT UserId FROM Badges WHERE Name = 'Supporter') AND Id IN (SELECT UserId FROM Badges WHERE Name = 'Teacher') AND Location LIKE '%New York%'	codebase_community
SELECT T2.DisplayName, T2.Reputation FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Id = 1	codebase_community
SELECT UserId FROM PostHistory WHERE PostId IN (SELECT PostId FROM PostHistory GROUP BY PostId HAVING COUNT(*) = 1) AND Views >= 1000 GROUP BY UserId HAVING COUNT(*) >= 1	codebase_community
SELECT T1.Id, T1.Badges FROM (SELECT UserId, COUNT(Id) AS CommentCount FROM Comments GROUP BY UserId) AS T2 JOIN Users AS T1 ON T1.Id = T2.UserId WHERE T2.CommentCount = (SELECT MAX(CommentCount) FROM (SELECT UserId, COUNT(Id) AS CommentCount FROM Comments GROUP BY UserId) AS T3)	codebase_community
SELECT COUNT(*) FROM Users WHERE Location LIKE '%India%' AND EXISTS(SELECT * FROM Badges WHERE UserId = Users.Id AND Name = 'Teacher')	codebase_community
SELECT (CAST(SUM(CASE WHEN YEAR(B.Date) = 2010 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN B.Name = 'Student' THEN 1 ELSE 0 END) * 100 - CAST(SUM(CASE WHEN YEAR(B.Date) = 2011 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN B.Name = 'Student' THEN 1 ELSE 0 END) * 100) FROM Badges AS B	codebase_community
SELECT COUNT(DISTINCT ph.PostID) AS UniqueUsersCommented, ph.PostHistoryTypeID FROM Posts p JOIN PostHistory ph ON ph.PostID = p.PostId WHERE p.PostTypeId = 1 AND p.Id = 3720 AND ph.PostHistoryTypeId IN (4,5) GROUP BY ph.PostHistoryTypeID	codebase_community
SELECT T1.Id, T1.ViewCount FROM Posts AS T1 JOIN PostLinks AS T2 ON T1.Id = T2.PostId WHERE T2.RelatedPostId = 61217	codebase_community
SELECT Score, LinkTypeId FROM Posts WHERE Id = 395;	codebase_community
SELECT Posts.Id AS PostID, Posts.OwnerUserId AS UserID FROM Posts WHERE Posts.Score > 60;	codebase_community
SELECT SUM(FavoriteCount) FROM Posts WHERE OwnerUserId = 686 AND YEAR(CreationDate) = 2011	codebase_community
SELECT AVG(T2.UpVotes), AVG(T2.Age) FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.PostTypeId = 1 GROUP BY T2.Id HAVING COUNT(T1.Id) > 10	codebase_community
SELECT COUNT(*) FROM Badges WHERE Name = 'Announcer'	codebase_community
SELECT T2.Name FROM Badges AS T1 JOIN BadgeTypes AS T2 ON T1.Id = T2.Id WHERE T1.Date = '2010-07-19 19:39:08.0'	codebase_community
SELECT COUNT(*) FROM Comments WHERE Score > 60;	codebase_community
SELECT Text FROM Comments WHERE CreationDate = '2010-07-19 19:25:47.0'	codebase_community
SELECT COUNT(Id) FROM Posts WHERE Score = 10	codebase_community
SELECT B.Name FROM Badges AS B JOIN Users AS U ON B.UserId = U.Id WHERE U.Reputation = (SELECT MAX(Reputation) FROM Users) GROUP BY B.Name	codebase_community
SELECT Reputation FROM Users WHERE Id IN (SELECT UserId FROM Badges WHERE Date = '2010-07-19 19:39:08.0')	codebase_community
SELECT B.Name FROM Badges AS B JOIN Users AS U ON B.UserId = U.Id WHERE U.DisplayName = 'Pierre'	codebase_community
SELECT T2.Date FROM Users AS T1 JOIN Badges AS T2 ON T1.Id = T2.UserId WHERE T1.Location LIKE '%Rochester, NY%'	codebase_community
SELECT COUNT(CASE WHEN b.Name = 'Teacher' THEN u.UserId ELSE NULL END) * 100 / COUNT(u.UserId) AS Percentage FROM Users u JOIN Badges b ON u.UserId = b.UserId WHERE b.Name = 'Teacher' GROUP BY b.Name;	codebase_community
SELECT CAST(SUM(CASE WHEN T2.Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.UserId) FROM (SELECT UserId FROM Badges WHERE Name = 'Organizer') AS T1 JOIN Users AS T2 ON T1.UserId = T2.Id	codebase_community
SELECT CommentRatingScore FROM Posts WHERE CreationDate = '2010-07-19 19:19:56.0'	codebase_community
SELECT Text FROM Comments WHERE CreationDate = '2010-07-19 19:37:33.0'	codebase_community
SELECT Age FROM Users WHERE Location LIKE '%Vienna, Austria%' AND AccountId IN (SELECT AccountId FROM Badges)	codebase_community
SELECT COUNT(*) FROM Users AS T1 JOIN Badges AS T2 ON T1.Id = T2.UserId WHERE T2.Name = 'Supporter' AND T1.Age BETWEEN 19 AND 65	codebase_community
SELECT T2.Views FROM Badges AS T1 JOIN Users AS T2 ON T1.UserId = T2.Id WHERE T1.Date = '2010-07-19 19:39:08.0'	codebase_community
SELECT B.Name FROM Badges AS B JOIN Users AS U ON B.UserId = U.Id WHERE U.Reputation = (SELECT MIN(Reputation) FROM Users)	codebase_community
SELECT B.Name FROM Users AS U JOIN Badges AS B ON U.Id = B.UserId WHERE U.DisplayName = 'Sharpie'	codebase_community
SELECT COUNT(*) FROM Users WHERE Age > 65 AND EXISTS(SELECT * FROM Badges WHERE UserId = Users.Id AND Name = 'Supporter')	codebase_community
SELECT DisplayName FROM Users WHERE AccountId = 30;	codebase_community
SELECT COUNT(*) FROM Users WHERE LOWER(Location) LIKE '%new york%'	codebase_community
SELECT COUNT(*) FROM Votes WHERE YEAR(CreationDate) = 2010;	codebase_community
SELECT COUNT(*) FROM Users WHERE Age >= 19 AND Age <= 65;	codebase_community
SELECT DisplayName FROM Users ORDER BY Views DESC LIMIT 1;	codebase_community
SELECT CAST(SUM(CASE WHEN YEAR(CreationDate) = 2010 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN YEAR(CreationDate) = 2011 THEN 1 ELSE 0 END) FROM Votes;	codebase_community
SELECT T2.TagName FROM Posts AS T1 JOIN PostTags AS T2 ON T1.Id = T2.PostId WHERE T1.OwnerDisplayName = 'John Salvatier' GROUP BY T2.TagName	codebase_community
SELECT COUNT(*) FROM Posts WHERE OwnerUserId IN (SELECT Id FROM Users WHERE DisplayName = 'Daniel Vassallo')	codebase_community
SELECT SUM(UpVotes) + SUM(DownVotes) FROM Users WHERE DisplayName = 'Harlan'	codebase_community
SELECT Posts.Id AS PostID FROM Posts INNER JOIN Users ON Posts.OwnerUserId = Users.Id WHERE Users.DisplayName = 'slashnick' AND Posts.PostTypeId = 1 GROUP BY Posts.Id ORDER BY COUNT(*) DESC LIMIT 1	codebase_community
SELECT SUM(T2.ViewCount) AS ViewCount ,  T1.DisplayName FROM Users AS T1 JOIN Posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName IN ('Harvey Motulsky', 'Noah Snyder') GROUP BY T1.DisplayName ORDER BY SUM(T2.ViewCount) DESC LIMIT 1	codebase_community
SELECT COUNT(*) FROM Posts WHERE OwnerUserId IN (SELECT Id FROM Users WHERE DisplayName = 'Matt Parker') AND Score > 4	codebase_community
SELECT COUNT(*) FROM Comments WHERE Score < 60 AND OwnerUserId IN (SELECT Id FROM Users WHERE DisplayName = 'Neil McGuigan')	codebase_community
SELECT T2.TagName FROM Posts AS T1 JOIN PostTags AS T3 ON T1.Id = T3.PostId JOIN Tags AS T2 ON T2.Id = T3.TagId WHERE T1.CommentCount = 0 AND T1.OwnerDisplayName = 'Mark Meckes'	codebase_community
SELECT T1.DisplayName FROM Users AS T1 JOIN Badges AS T2 ON T1.Id = T2.UserId WHERE T2.Name = 'Organizer'	codebase_community
SELECT CAST(SUM(CASE WHEN T1.TagName = 'r' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.PostId) FROM Tags AS T1 INNER JOIN PostTags AS T2 ON T1.Id = T2.TagId INNER JOIN Posts AS T3 ON T2.PostId = T3.Id WHERE T3.OwnerUserId IN (SELECT Id FROM Users WHERE DisplayName = 'Community')	codebase_community
SELECT (SUM(CASE WHEN T1.DisplayName = 'Mornington' THEN T2.ViewCount ELSE 0 END) - SUM(CASE WHEN T1.DisplayName = 'Amos' THEN T2.ViewCount ELSE 0 END)) AS ViewDifference FROM Users AS T1 INNER JOIN Posts AS T2 ON T1.Id = T2.OwnerUserId;	codebase_community
SELECT COUNT(*) FROM Users WHERE EXISTS(SELECT * FROM Badges WHERE UserId = Users.Id AND Name = 'Commentator' AND YEAR(Date) = 2014)	codebase_community
SELECT COUNT(*) FROM Posts WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59'	codebase_community
SELECT DisplayName, Age FROM Users WHERE Views = (SELECT MAX(Views) FROM Users)	codebase_community
SELECT LastEditDate, LastEditorUserId FROM Posts WHERE Title = 'Detecting a given face in a database of facial images'	codebase_community
SELECT COUNT(*) FROM Comments WHERE UserId = 13 AND Score < 60;	codebase_community
SELECT Posts.Title, Comments.UserId, Users.DisplayName FROM Posts JOIN Comments ON Posts.Id = Comments.PostId JOIN Users ON Comments.UserId = Users.Id WHERE Comments.Score > 60 AND Posts.PostTypeId = 1 GROUP BY Posts.Title, Comments.UserId, Users.DisplayName;	codebase_community
SELECT b.Name FROM Badges AS b JOIN Users AS u ON b.UserId = u.Id WHERE u.Location = 'North Pole' AND YEAR(b.Date) = 2011	codebase_community
SELECT DisplayName, WebsiteUrl FROM Users WHERE EXISTS (SELECT * FROM Posts WHERE Posts.OwnerUserId = Users.Id AND FavoriteCount > 150)	codebase_community
SELECT COUNT(*), MAX(ph.LastEditDate) FROM Posts AS p JOIN PostHistory AS ph ON p.Id = ph.PostId WHERE p.Title = 'What is the best introductory Bayesian statistics textbook?' AND ph.PostHistoryTypeId IN (4, 5, 6) GROUP BY p.Id	codebase_community
SELECT LastAccessDate, Location FROM Users WHERE Id IN (SELECT UserId FROM Badges WHERE Name = 'Outliers')	codebase_community
SELECT T2.Title FROM Posts AS T1 JOIN Posts AS T2 ON T1.ParentId = T2.Id WHERE T1.Body LIKE '%How to tell if something happened in a data set which monitors a value over time%'	codebase_community
SELECT T1.PostId, T2.TagName FROM Posts AS T1 JOIN PostTags AS T2 ON T1.Id = T2.PostId WHERE T1.OwnerUserId IN (SELECT Id FROM Users WHERE UserDisplayName = 'Samuel') AND YEAR(T1.CreationDate) = 2013 INTERSECT SELECT PostId, TagName FROM Badges WHERE UserId IN (SELECT Id FROM Users WHERE UserDisplayName = 'Samuel') AND YEAR(Date) = 2013	codebase_community
SELECT T2.DisplayName FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE PostTypeId = 1 ORDER BY ViewCount DESC LIMIT 1	codebase_community
SELECT T1.DisplayName, T1.Location FROM SuggestedEditVotes AS T2 JOIN Users AS T1 ON T2.UserId = T1.Id WHERE T2.TagName = 'hypothesis-testing' GROUP BY T1.DisplayName, T1.Location ORDER BY COUNT(*) DESC LIMIT 1	codebase_community
SELECT T2.Title, T1.LinkTypeId FROM Posts AS T1 JOIN Posts AS T2 ON T1.PostId = T2.Id WHERE T2.Title = 'What are principal component scores?'	codebase_community
SELECT T2.DisplayName FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.ParentId IS NOT NULL ORDER BY T1.Score DESC LIMIT 1;	codebase_community
SELECT DisplayName, WebsiteUrl FROM Users WHERE Id IN (SELECT UserId FROM Votes WHERE VoteTypeId = 8 ORDER BY BountyAmount DESC LIMIT 1)	codebase_community
SELECT Title FROM Posts ORDER BY ViewCount DESC LIMIT 5	codebase_community
SELECT COUNT(*) FROM Tags WHERE Count BETWEEN 5000 AND 7000;	codebase_community
SELECT OwnerUserId FROM Posts WHERE FavoriteCount = (SELECT MAX(FavoriteCount) FROM Posts) LIMIT 1;	codebase_community
SELECT Age FROM Users WHERE Reputation = (SELECT MAX(Reputation) FROM Users)	codebase_community
SELECT COUNT(*) FROM Posts WHERE YEAR(CreationDate) = 2011 AND BountyAmount = 50 AND EXISTS(SELECT * FROM Votes WHERE Posts.Id = Votes.PostId)	codebase_community
SELECT AccountId FROM Users WHERE Age = (SELECT MIN(Age) FROM Users)	codebase_community
SELECT SUM(Reputation) FROM Users WHERE LastAccessDate LIKE '2010-07-19%'	codebase_community
SELECT COUNT(T1.Id) / 12 AS AverageMonthlyLinksCreatedIn2010ForPostsNoMoreThan2Answers FROM Posts AS T1 JOIN PostLinks AS T2 ON T1.Id = T2.PostId WHERE YEAR(T1.CreationDate) = 2010 AND T1.AnswerCount <= 2	codebase_community
SELECT PostId FROM Votes WHERE UserId = 1465 AND VoteTypeId = 5 ORDER BY Value DESC LIMIT 1	codebase_community
SELECT Title FROM Posts ORDER BY CreationDate LIMIT 1	codebase_community
SELECT DisplayName FROM Users WHERE AccountId = (SELECT AccountId FROM Badges GROUP BY AccountId ORDER BY COUNT(*) DESC LIMIT 1)	codebase_community
SELECT MIN(Votes.CreationDate) FROM Votes JOIN Users ON Votes.UserId = Users.Id WHERE Users.DisplayName = 'chl'	codebase_community
SELECT T1.CreationDate FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.Age = (SELECT MIN(Age) FROM Users) ORDER BY T1.CreationDate ASC LIMIT 1	codebase_community
SELECT T1.DisplayName FROM Users AS T1 JOIN Badges AS T2 ON T1.Id = T2.UserId WHERE T2.Name = 'Autobiographer' ORDER BY T2.Date LIMIT 1	codebase_community
SELECT COUNT(*) FROM Users WHERE Location LIKE '%United Kingdom%' AND (SELECT SUM(FavoriteCount) FROM Posts WHERE Posts.OwnerUserId = Users.Id) >= 4	codebase_community
SELECT AVG(T2.PostId) FROM Users AS T1 JOIN Votes AS T2 ON T1.Id = T2.UserId WHERE T1.Age = (SELECT MAX(Age) FROM Users)	codebase_community
SELECT DisplayName FROM Users WHERE Reputation = (SELECT MAX(Reputation) FROM Users)	codebase_community
SELECT COUNT(*) FROM Users WHERE Reputation > 2000 AND Views > 1000;	codebase_community
SELECT DisplayName FROM Users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT COUNT(*) FROM Posts WHERE YEAR(CreationDate) = 2010 AND DisplayName = 'Jay Stevens'	codebase_community
SELECT Id, Title FROM Posts WHERE OwnerUserId IN (SELECT Id FROM Users WHERE DisplayName = 'Harvey Motulsky') ORDER BY ViewCount DESC LIMIT 1;	codebase_community
SELECT Id, Title FROM Posts WHERE Score = (SELECT MAX(Score) FROM Posts)	codebase_community
SELECT AVG(T2.Score) FROM Posts AS T1 INNER JOIN Posts AS T2 ON T1.OwnerUserID = T2.OwnerUserID WHERE T1.DisplayName = 'Stephen Turner' GROUP BY T2.Score;	codebase_community
SELECT DisplayName FROM Users WHERE AccountId IN (SELECT AccountId FROM Posts WHERE YEAR(CreationDate) = 2011 AND ViewCount > 20000)	codebase_community
SELECT Id, OwnerUserId, DisplayName FROM Posts AS p JOIN Users AS u ON p.OwnerUserId = u.Id WHERE YEAR(p.CreationDate) = 2010 ORDER BY p.FavoriteCount DESC LIMIT 1;	codebase_community
SELECT CAST(SUM(CASE WHEN T2.Reputation > 1000 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.Id) FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE YEAR(T1.CreationDate) = 2011;	codebase_community
SELECT CAST(SUM(CASE WHEN Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS Percentage FROM Users WHERE Age IS NOT NULL;	codebase_community
SELECT SUM(ViewCount) AS TotalViews, MAX(u.DisplayName) AS LastPosterName FROM Posts p JOIN Users u ON p.OwnerUserId = u.Id WHERE p.Text = 'Computer Game Datasets' GROUP BY p.Text;	codebase_community
SELECT COUNT(*) FROM Posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM Posts)	codebase_community
SELECT COUNT(*) FROM Comments WHERE PostId = (SELECT Id FROM Posts ORDER BY Score DESC LIMIT 1)	codebase_community
SELECT COUNT(*) FROM Posts WHERE ViewCount > 35000 AND CommentCount = 0;	codebase_community
SELECT DisplayName, Location FROM Users WHERE Id = (SELECT OwnerUserId FROM Posts WHERE PostTypeId = 2 AND ParentId = 183 ORDER BY LastEditDate DESC LIMIT 1)	codebase_community
SELECT B.Name FROM Badges AS B INNER JOIN Users AS U ON B.UserId = U.Id WHERE U.DisplayName = 'Emmett' ORDER BY B.Date DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM Users WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000;	codebase_community
SELECT DATEDIFF(stats_badges.Date, Users.CreationDate) AS TimeToBadge FROM stats_badges JOIN Users ON stats_badges.UserId = Users.Id WHERE Users.DisplayName = 'Zolomon'	codebase_community
SELECT COUNT(*) AS PostCount, COUNT(c.Id) AS CommentCount FROM Posts p LEFT JOIN Comments c ON p.OwnerUserId = c.UserId WHERE p.OwnerUserId = (SELECT u.Id FROM Users u ORDER BY u.CreationDate DESC LIMIT 1) GROUP BY p.OwnerUserId;	codebase_community
SELECT C.Text, U.DisplayName FROM Comments AS C JOIN Users AS U ON C.UserId = U.Id WHERE C.PostId IN (SELECT Id FROM Posts WHERE Title = 'Analysing wind data with R') ORDER BY C.CreationDate DESC LIMIT 10;	codebase_community
SELECT COUNT(*) FROM Users WHERE Id IN (SELECT UserId FROM Badges WHERE Name = 'Citizen Patrol')	codebase_community
SELECT COUNT(*) FROM Posts JOIN PostTags ON Posts.Id = PostTags.PostId JOIN Tags ON PostTags.TagId = Tags.Id WHERE Tags.TagName = 'careers'	codebase_community
SELECT Reputation, Views FROM Users WHERE DisplayName = 'Jarrod Dixon'	codebase_community
SELECT COUNT(CASE WHEN T2.PostTypeId = 1 THEN 1 END) AS Answers ,  COUNT(*) AS Comments FROM Posts AS T1 INNER JOIN Comments AS T2 ON T1.Id = T2.PostId WHERE T1.Title = 'Clustering 1D data' AND T2.UserId IN (SELECT AccountId FROM Users)	codebase_community
SELECT CreationDate FROM Users WHERE DisplayName = 'IrishStat'	codebase_community
SELECT COUNT(*) FROM Posts WHERE BountyAmount >= 30	codebase_community
SELECT CAST(SUM(CASE WHEN Score > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Posts JOIN (SELECT AccountId, MAX(Reputation) as MaxRep FROM Users GROUP BY AccountId) u ON Posts.OwnerUserId = u.AccountId WHERE u.MaxRep = (SELECT MAX(MaxRep) FROM (SELECT AccountId, MAX(Reputation) as MaxRep FROM Users GROUP BY AccountId))	codebase_community
SELECT COUNT(*) FROM Posts WHERE Score < 20;	codebase_community
SELECT COUNT(*) FROM Tags WHERE Id < 15 AND Count <= 20;	codebase_community
SELECT ExcerptPostID ,  WikiPostID FROM Tags WHERE TagName  =  'sample'	codebase_community
SELECT Reputation, UpVotes FROM Users WHERE Id IN (SELECT UserId FROM Comments WHERE Text LIKE '%fine, you win%')	codebase_community
SELECT "Text" FROM "Comments" WHERE "PostId" IN (SELECT "Id" FROM "Posts" WHERE "Title" LIKE '%linear regression%')	codebase_community
SELECT C.Text FROM Posts AS P JOIN Comments AS C ON P.Id = C.PostId WHERE P.ViewCount BETWEEN 100 AND 150 ORDER BY C.Score DESC LIMIT 1	codebase_community
SELECT CreationDate, Age FROM Users WHERE WebsiteUrl LIKE '%http%';	codebase_community
SELECT COUNT(*) FROM Comments WHERE Score = 0 AND ViewCount < 5;	codebase_community
SELECT COUNT(*) FROM Posts WHERE CommentCount = 1 AND Score = 0;	codebase_community
SELECT COUNT(*) FROM (SELECT Age FROM Posts WHERE Score = 0 AND Age = 40) AS tmp	codebase_community
SELECT T2.Id AS PostID ,  T1.Text AS Comment FROM Comments AS T1 JOIN Posts AS T2 ON T1.PostId = T2.Id WHERE T2.Title = 'Group differences on a five point Likert item'	codebase_community
SELECT UpVotes FROM Users WHERE AccountId IN (SELECT UserId FROM Comments WHERE Text LIKE '%R is also lazy evaluated.%')	codebase_community
SELECT Text FROM Comments WHERE UserId IN (SELECT Id FROM Users WHERE DisplayName = 'Harvey Motulsky')	codebase_community
SELECT T2.DisplayName FROM Comments AS T1 JOIN Users AS T2 ON T1.UserId = T2.Id WHERE T1.Score BETWEEN 1 AND 5 AND T2.DownVotes = 0	codebase_community
SELECT CAST(SUM(CASE WHEN T2.UpVotes = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.Id) FROM Comments AS T1 JOIN Users AS T2 ON T1.UserId = T2.Id WHERE T1.Score BETWEEN 5 AND 10;	codebase_community
SELECT T2.power_name FROM superhero AS T1 JOIN has_power AS T3 ON T1.id = T3.superhero_id JOIN superpower AS T2 ON T2.id = T3.power_id WHERE T1.superhero_name = '3-D Man'	superhero
SELECT COUNT(*) FROM superhero JOIN superhero_power ON superhero.id = superhero_power.superhero_id WHERE power_name = 'Super Strength'	superhero
SELECT COUNT(*) FROM superhero JOIN superhero_power ON superhero.id = superhero_power.superhero_id JOIN power ON power.id = superhero_power.power_id WHERE power_name = 'Super Strength' AND height_cm > 200;	superhero
SELECT T2.full_name FROM superhero_power AS T1 JOIN superhero AS T2 ON T1.superhero_id = T2.id GROUP BY T2.full_name HAVING COUNT(T2.full_name) > 15	superhero
SELECT COUNT(*) FROM superhero WHERE eye_colour_id IN (SELECT id FROM colour WHERE description = 'Blue')	superhero
SELECT T2.name FROM superhero AS T1 JOIN colour AS T2 ON T1.skin_colour_id = T2.id WHERE T1.superhero_name = 'Apocalypse'	superhero
SELECT COUNT(*) FROM superhero JOIN superhero_power ON superhero.id = superhero_power.superhero_id JOIN power ON superhero_power.power_id = power.id JOIN colour ON superhero.eye_colour_id = colour.id WHERE power.power_name = 'Agility' AND colour.colour = 'Blue'	superhero
SELECT superhero.superhero_name FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id AND superhero.hair_colour_id = colour.id WHERE colour.colour = 'Blue' AND colour.colour = 'Blond'	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')	superhero
SELECT superhero_name FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') ORDER BY height_cm DESC;	superhero
SELECT T2.publisher_name FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name = 'Sauron'	superhero
SELECT c.colour_name, COUNT(s.id) AS superhero_count FROM superhero s JOIN colour c ON s.eye_colour_id = c.id JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics' GROUP BY c.colour_name ORDER BY superhero_count DESC;	superhero
SELECT AVG(T1.height_cm) FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics'	superhero
SELECT superhero.superhero_name FROM superhero JOIN superhero_power ON superhero.id = superhero_power.superhero_id JOIN power ON power.id = superhero_power.power_id WHERE power.power_name = 'Super Strength' AND superhero.publisher_id IN (SELECT publisher.id FROM publisher WHERE publisher.publisher_name = 'Marvel Comics')	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')	superhero
SELECT T3.publisher_name FROM superhero AS T1 JOIN superhero_power AS T2 ON T1.id = T2.superhero_id JOIN power AS T4 ON T4.id = T2.power_id JOIN attribute AS T5 ON T5.power_id = T4.id JOIN publisher AS T3 ON T3.id = T1.publisher_id WHERE T5.attribute_name = 'Speed' GROUP BY T3.publisher_name ORDER BY AVG(T5.attribute_value) ASC LIMIT 1	superhero
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id JOIN publisher ON superhero.publisher_id = publisher.id WHERE colour.colour = 'Gold' AND publisher.publisher_name = 'Marvel Comics'	superhero
SELECT T2.publisher_name FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name = 'Blue Beetle II'	superhero
SELECT COUNT(*) FROM superhero WHERE hair_colour_id IN (SELECT id FROM colour WHERE description = 'Blond')	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN superhero_attribute AS T2 ON T1.id = T2.superhero_id WHERE T2.attribute_name = 'Intelligence' ORDER BY T2.attribute_value LIMIT 1;	superhero
SELECT T2.race FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.superhero_name = 'Copycat'	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN superpower AS T2 ON T1.id = T2.superhero_id WHERE T2.power_name = 'Durability' AND T2.attribute_value < 50	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN superpower AS T2 ON T1.id = T2.hero_id WHERE T2.power_name = 'Death Touch'	superhero
SELECT COUNT(*) FROM superhero JOIN gender ON superhero.gender_id = gender.id WHERE gender.name = 'Female' AND (SELECT attribute_value FROM superhero_attribute WHERE superhero_attribute.superhero_id = superhero.id AND attribute_name = 'Strength') = 100;	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN superhero_power AS T2 ON T1.id = T2.superhero_id GROUP BY T1.superhero_name ORDER BY COUNT(T2.power_id) DESC LIMIT 1	superhero
SELECT COUNT(*) FROM superhero WHERE race_id IN (SELECT id FROM race WHERE race_name = 'Vampire')	superhero
SELECT COUNT(CASE WHEN T3.alignment_name = 'Bad' THEN T1.id ELSE NULL END) AS bad_count , SUM(CASE WHEN T3.alignment_name = 'Bad' THEN 1 ELSE 0 END) * 100 / COUNT(T1.id) AS percentage FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id JOIN alignment AS T3 ON T1.alignment_id = T3.id WHERE T2.publisher_name = 'Marvel Comics'	superhero
SELECT COUNT(*) AS dc_count FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'DC Comics') UNION SELECT COUNT(*) AS marvel_count FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') UNION SELECT (SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')) - (SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')) AS difference;	superhero
SELECT T1.publisher_id FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Star Trek' LIMIT 1;	superhero
SELECT AVG(height_cm) ,  AVG(weight_kg) FROM superhero WHERE height_cm != 0 AND weight_kg != 0	superhero
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL;	superhero
SELECT T2.colour_name FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.id = 75;	superhero
SELECT T2.power_name FROM superhero AS T1 JOIN has_power AS T3 ON T1.id = T3.superhero_id JOIN power AS T2 ON T2.id = T3.power_id WHERE T1.superhero_name = 'Deathlok'	superhero
SELECT AVG(T1.weight_kg) FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T2.gender = 'Female'	superhero
SELECT T2.power_name FROM superhero AS T1 JOIN has_power AS T3 ON T1.id = T3.superhero_id JOIN power AS T2 ON T2.id = T3.power_id WHERE T1.gender_id = 1 LIMIT 5;	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race_name = 'Alien'	superhero
SELECT superhero_name FROM superhero WHERE height_cm BETWEEN 170 AND 190 AND eye_colour_id IN (SELECT id FROM colour WHERE name = 'No Colour')	superhero
SELECT T2.power_name FROM superhero AS T1 JOIN hero_power AS T3 ON T1.id = T3.hero_id JOIN power AS T2 ON T2.id = T3.power_id WHERE T1.id = 56	superhero
SELECT T1.full_name FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Demi-God' LIMIT 5;	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 'Bad'	superhero
SELECT T2.race FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.weight_kg = 169	superhero
SELECT T3.colour_name FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id JOIN colour AS T3 ON T1.hair_colour_id = T3.id WHERE T1.height_cm = 185 AND T2.race_name = 'human'	superhero
SELECT c.colour_name FROM colour AS c JOIN superhero AS s ON c.id = s.eye_colour_id WHERE s.weight_kg = (SELECT MAX(weight_kg) FROM superhero)	superhero
SELECT CAST(COUNT(CASE WHEN T2.publisher_name = 'Marvel Comics' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.id) FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.height_cm BETWEEN 150 AND 180	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T2.gender = 'Male' AND T1.weight_kg > (SELECT AVG(weight_kg) * 0.79 FROM superhero)	superhero
SELECT T2.power_name FROM superhero AS T1 JOIN superhero_power AS T3 ON T1.id = T3.superhero_id JOIN superpower AS T2 ON T2.id = T3.power_id GROUP BY T2.power_name ORDER BY COUNT(T2.power_name) DESC LIMIT 1	superhero
SELECT * FROM superhero WHERE superhero_name = 'Abomination'	superhero
SELECT T2.power_name FROM superhero_power AS T1 JOIN power AS T2 ON T1.power_id = T2.id WHERE T1.hero_id = 1	superhero
SELECT COUNT(*) FROM superhero JOIN superpower ON superhero.id = superpower.hero_id WHERE superpower.power_name = 'Stealth'	superhero
SELECT T1.full_name FROM superhero AS T1 JOIN superhero_attribute AS T2 ON T1.id = T2.superhero_id JOIN attribute AS T3 ON T3.id = T2.attribute_id WHERE T3.attribute_name = 'strength' ORDER BY T2.attribute_value DESC LIMIT 1;	superhero
SELECT AVG(T1.id) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.skin_colour_id = T2.id WHERE T2.id = 1 AND T1.skin_colour_id IS NULL	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics')	superhero
SELECT T1.superhero_name FROM `superhero` AS T1 JOIN `attribute` AS T2 ON T1.id = T2.superhero_id JOIN `publisher` AS T3 ON T1.publisher_id = T3.id WHERE T3.publisher_name = 'Dark Horse Comics' AND T2.attribute_name = 'durability' ORDER BY T2.attribute_value DESC LIMIT 1	superhero
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.full_name = 'Abraham Sapien'	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN superpower AS T2 ON T1.id = T2.superhero_id WHERE T2.power_name = 'Flight'	superhero
SELECT T1.eye_colour_id, T1.hair_colour_id, T1.skin_colour_id FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T2.gender = 'Female' AND T3.publisher_name = 'Dark Horse Comics'	superhero
SELECT T2.superhero_name, T3.publisher_name FROM colour AS T1 JOIN superhero AS T2 ON T1.id = T2.eye_colour_id AND T1.id = T2.hair_colour_id AND T1.id = T2.skin_colour_id JOIN publisher AS T3 ON T2.publisher_id = T3.id	superhero
SELECT T2.race_name FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.superhero_name = 'A-Bomb'	superhero
SELECT CAST(SUM(CASE WHEN T3.colour_name = 'Blue' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id JOIN colour AS T3 ON T1.skin_colour_id = T3.id WHERE T2.gender_name = 'Female';	superhero
SELECT T1.superhero_name, T2.race_name FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.full_name = 'Charles Chandler'	superhero
SELECT T2.gender FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T1.superhero_name = 'Agent 13'	superhero
SELECT T2.superhero_name FROM superpower AS T1 JOIN superhero AS T2 ON T1.id = T2.power_id WHERE T1.power_name = 'Adaptation'	superhero
SELECT COUNT(*) FROM superhero JOIN superhero_power ON superhero.id = superhero_power.superhero_id WHERE superhero.superhero_name = 'Amazo'	superhero
SELECT T2.power_name FROM superhero AS T1 JOIN superpower AS T2 ON T1.id = T3.superhero_id WHERE T1.full_name = 'Hunter Zolomon'	superhero
SELECT T1.height_cm FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Amber'	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id OR T1.hair_colour_id = T2.id WHERE T2.colour = 'Black' GROUP BY T1.superhero_name HAVING COUNT(*) = 2	superhero
SELECT T1.eye_colour_id FROM superhero AS T1 JOIN colour AS T2 ON T1.skin_colour_id = T2.id WHERE T2.colour = 'Gold'	superhero
SELECT T1.full_name FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race_name = 'Vampire'	superhero
SELECT superhero_name FROM superhero WHERE alignment_id IN (SELECT id FROM alignment WHERE alignment = 'Neutral')	superhero
SELECT COUNT(*) FROM superhero JOIN superhero_attribute ON superhero.id = superhero_attribute.superhero_id WHERE attribute_name = 'Strength' AND attribute_value = (SELECT MAX(attribute_value) FROM superhero_attribute WHERE attribute_name = 'Strength');	superhero
SELECT T2.race_name, T3.alignment_name FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id JOIN alignment AS T3 ON T1.alignment_id = T3.id WHERE T1.superhero_name = 'Cameron Hicks'	superhero
SELECT CAST(SUM(CASE WHEN T3.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.id) FROM publisher AS T1 JOIN superhero AS T2 ON T1.id = T2.publisher_id JOIN gender AS T3 ON T3.id = T2.gender_id WHERE T1.publisher_name = 'Marvel Comics'	superhero
SELECT AVG(T1.weight_kg) FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race_name = 'Alien'	superhero
SELECT ABS((SELECT weight_kg FROM superhero WHERE full_name = 'Emil Blonsky') - (SELECT weight_kg FROM superhero WHERE full_name = 'Charles Chandler'))	superhero
SELECT AVG(height_cm) AS average_height FROM superhero WHERE height_cm != 0;	superhero
SELECT T2.power_name FROM superhero AS T1 JOIN has_power AS T3 ON T1.id = T3.superhero_id JOIN power AS T2 ON T2.id = T3.power_id WHERE T1.superhero_name = 'Abomination'	superhero
SELECT COUNT(*) FROM superhero WHERE race_id = 21 AND gender_id = 1	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN superhero_attribute AS T2 ON T1.id = T2.superhero_id WHERE T2.attribute_name = 'Speed' ORDER BY T2.attribute_value DESC LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3;	superhero
SELECT T1.id, T1.superhero_name, T1.full_name, T2.gender, T3.colour AS eye_colour, T4.colour AS hair_colour, T5.colour AS skin_colour, T6.race, T7.publisher, T8.alignment, T1.height_cm, T1.weight_kg  FROM superhero AS T1  JOIN gender AS T2 ON T1.gender_id = T2.id  JOIN colour AS T3 ON T1.eye_colour_id = T3.id  JOIN colour AS T4 ON T1.hair_colour_id = T4.id  JOIN colour AS T5 ON T1.skin_colour_id = T5.id  JOIN race AS T6 ON T1.race_id = T6.id  JOIN publisher AS T7 ON T1.publisher_id = T7.id  JOIN alignment AS T8 ON T1.alignment_id = T8.id  WHERE superhero_name = '3-D Man'	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id AND T1.hair_colour_id = T3.id WHERE T2.colour = 'Blue' AND T3.colour = 'Brown'	superhero
SELECT T2.publisher_name FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy') GROUP BY T2.publisher_name HAVING COUNT(*) = 3	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = 1;	superhero
SELECT CAST(COUNT(CASE WHEN T2.colour = 'Blue' THEN T1.superhero_name END) AS REAL) * 100 / COUNT(T1.superhero_name) FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.id = 7;	superhero
SELECT CAST(SUM(CASE WHEN T2.gender = 'Male' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T2.gender = 'Female' THEN 1 ELSE 0 END) FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id;	superhero
SELECT superhero_name FROM superhero WHERE height_cm = (SELECT MAX(height_cm) FROM superhero)	superhero
SELECT id FROM superpower WHERE power_name = 'cryokinesis' LIMIT 1;	superhero
SELECT superhero_name FROM superhero WHERE id = 294;	superhero
SELECT full_name FROM superhero WHERE weight_kg = 0 OR weight_kg IS NULL;	superhero
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.full_name = 'Karen Beecher-Duncan'	superhero
SELECT T2.power_name FROM superhero AS T1 JOIN has_power AS T3 ON T1.id = T3.superhero_id JOIN superpower AS T2 ON T2.id = T3.power_id WHERE T1.full_name = 'Helen Parr'	superhero
SELECT T2.race FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.weight_kg = 108 AND T1.height_cm = 188;	superhero
SELECT T2.publisher_name FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.id = 38	superhero
SELECT T2.race FROM ( SELECT id, MAX(height_cm) AS max_attribute_value  FROM superhero  UNION ALL  SELECT id, MAX(weight_kg) AS max_attribute_value  FROM superhero ) AS T1  JOIN superhero AS T2 ON T1.id = T2.id  WHERE (T1.max_attribute_value = T2.height_cm OR T1.max_attribute_value = T2.weight_kg) GROUP BY T2.race LIMIT 1	superhero
SELECT T3.power_name, T2.alignment  FROM superhero AS T1  JOIN alignment AS T2 ON T1.alignment_id = T2.id  JOIN superpower AS T3 ON T1.id = T3.superhero_id  WHERE T1.superhero_name = 'Atom IV'	superhero
SELECT T1.full_name FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Blue' LIMIT 5;	superhero
SELECT AVG(height_cm), AVG(weight_kg) FROM superhero WHERE alignment_id = 3;	superhero
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.skin_colour_id = T2.id WHERE T1.attribute_value = 100;	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 1 AND gender_id = 2;	superhero
SELECT superhero_name FROM superhero WHERE height_cm BETWEEN 75 AND 80 OR weight_kg BETWEEN 75 AND 80;	superhero
SELECT T1.race FROM race AS T1 JOIN superhero AS T2 ON T1.id = T2.race_id JOIN colour AS T3 ON T3.id = T2.hair_colour_id JOIN gender AS T4 ON T4.id = T2.gender_id WHERE T3.colour = 'blue' AND T4.gender = 'male'	superhero
SELECT CAST(SUM(CASE WHEN T3.gender_id = 2 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.alignment_id) FROM superhero AS T1 JOIN alignment AS T2 ON T1.alignment_id = T2.id JOIN gender AS T3 ON T1.gender_id = T3.id WHERE T2.alignment_id = 2;	superhero
SELECT (SELECT COUNT(*) FROM superhero WHERE weight_kg = 0 OR weight_kg IS NULL AND eye_colour_id = 7) - (SELECT COUNT(*) FROM superhero WHERE weight_kg = 0 OR weight_kg IS NULL AND eye_colour_id = 1) AS difference;	superhero
SELECT T2.attribute_value FROM superhero AS T1 JOIN superhero_attribute AS T2 ON T1.id = T2.superhero_id WHERE T1.superhero_name = 'Hulk' AND T2.attribute_name = 'Strength'	superhero
SELECT T2.power_name FROM superhero AS T1 JOIN has_superpower AS T3 ON T1.id = T3.superhero_id JOIN superpower AS T2 ON T2.id = T3.superpower_id WHERE T1.superhero_name = 'Ajax'	superhero
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.skin_colour_id = colour.id JOIN alignment ON superhero.alignment_id = alignment.id WHERE colour.colour = 'Green' AND alignment.alignment = 'Bad';	superhero
SELECT COUNT(*) FROM superhero WHERE gender_id IN (SELECT id FROM gender WHERE name = 'Female') AND publisher_id IN (SELECT id FROM publisher WHERE name = 'Marvel Comics')	superhero
SELECT T2.superhero_name FROM superpower AS T1 JOIN superhero AS T2 ON T1.id = T2.power_id WHERE T1.power_name = 'Wind Control' ORDER BY T2.superhero_name ASC;	superhero
SELECT T2.gender_id FROM superpower AS T1 JOIN superhero AS T2 ON T1.id = T2.power_id WHERE T1.power_name = 'Phoenix Force'	superhero
SELECT superhero_name FROM superhero WHERE weight_kg = (SELECT MAX(weight_kg) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')) AND publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')	superhero
SELECT AVG(T1.height_cm) FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id JOIN race AS T3 ON T1.race_id = T3.id WHERE T2.publisher_name = 'Dark Horse Comics' AND T3.race <> 'Human'	superhero
SELECT COUNT(T2.id) FROM superhero_attribute AS T1 JOIN superhero AS T2 ON T1.superhero_id = T2.id WHERE T1.attribute_name = 'Speed' AND T1.attribute_value = 100;	superhero
SELECT COUNT(*) AS dc_count FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'DC Comics' UNION SELECT COUNT(*) AS marvel_count FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics' UNION SELECT (SELECT COUNT(*) FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'DC Comics') - (SELECT COUNT(*) FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics') AS difference;	superhero
SELECT T3.attribute_name FROM superhero AS T1 JOIN superhero_attribute AS T2 ON T1.id = T2.superhero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T1.superhero_name = 'Black Panther' ORDER BY T2.attribute_value ASC LIMIT 1	superhero
SELECT T3.colour FROM superhero AS T1 JOIN colour AS T3 ON T1.eye_colour_id = T3.id WHERE T1.superhero_name = 'Abomination'	superhero
SELECT full_name FROM superhero WHERE height_cm = (SELECT MAX(height_cm) FROM superhero);	superhero
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler'	superhero
SELECT SUM(CASE WHEN T3.gender = 'Female' THEN 1 ELSE 0 END) * 100.0 / COUNT(T2.id) AS percentage FROM publisher AS T1 JOIN superhero AS T2 ON T1.id = T2.publisher_id JOIN gender AS T3 ON T3.id = T2.gender_id WHERE T1.publisher_name = 'George Lucas'	superhero
SELECT CAST(COUNT(CASE WHEN T3.alignment = 'Good' THEN T1.id END) AS REAL) * 100 / COUNT(T1.id) FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id JOIN alignment AS T3 ON T1.alignment_id = T3.id WHERE T2.publisher_name = 'Marvel Comics'	superhero
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%'	superhero
SELECT id FROM superhero WHERE height_cm = (SELECT MIN(height_cm) FROM superhero) OR weight_kg = (SELECT MIN(weight_kg) FROM superhero) LIMIT 1;	superhero
SELECT T1.full_name FROM superhero AS T1 WHERE T1.superhero_name = 'Alien'	superhero
SELECT T1.full_name FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour_name = 'Brown' AND T1.weight_kg < 100;	superhero
SELECT T1.full_name, T1.gender_id, T1.eye_colour_id, T1.hair_colour_id, T1.skin_colour_id, T1.race_id, T1.publisher_id, T1.alignment_id, T1.height_cm, T1.weight_kg  FROM superhero AS T1  JOIN superpower AS T2 ON T1.id = T2.id  WHERE T1.superhero_name = 'Aquababy'	superhero
SELECT T1.weight_kg, T2.race_name FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.id = 40;	superhero
SELECT AVG(T1.height_cm) FROM superhero AS T1 JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T2.alignment_name = 'Neutral' AND T1.height_cm != 0;	superhero
SELECT T1.id FROM superhero AS T1 JOIN superpower AS T2 ON T1.id = T2.hero_id WHERE T2.power_name = 'Intelligence'	superhero
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.superhero_name = 'Blackwulf'	superhero
SELECT T2.power_name FROM superhero AS T1 JOIN has_power AS T3 ON T1.id = T3.superhero_id JOIN power AS T2 ON T2.id = T3.power_id WHERE T1.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero)	superhero
SELECT T2.driverref FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.raceid = 20 ORDER BY T2.q1 DESC LIMIT 5	formula_1
SELECT T3.surname FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T1.raceid = 19 ORDER BY T2.q2 LIMIT 1	formula_1
SELECT T1.year FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.location = 'Shanghai'	formula_1
SELECT T1.url FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Circuit de Barcelona-Catalunya'	formula_1
SELECT T1.name FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.country = "Germany"	formula_1
SELECT T2.location FROM constructors AS T1 JOIN circuits AS T2 ON T1.constructorref = T2.name WHERE T1.name = 'Renault'	formula_1
SELECT COUNT(*) FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.year = 2010 AND T2.country NOT IN ('China', 'Malaysia', 'Singapore', 'Japan', 'India', 'Turkey', 'Bahrain') AND T2.country NOT IN ('Austria', 'Belgium', 'Czech Republic', 'Denmark', 'Finland', 'France', 'Germany', 'Greece', 'Hungary', 'Ireland', 'Italy', 'Netherlands', 'Norway', 'Poland', 'Portugal', 'Romania', 'Russia', 'Spain', 'Sweden', 'Switzerland', 'Turkey', 'Ukraine', 'United Kingdom')	formula_1
SELECT T1.name FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.country = 'Spain'	formula_1
SELECT T2.lat, T2.lng FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Australian Grand Prix'	formula_1
SELECT T1.url FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Sepang International Circuit'	formula_1
SELECT T1.time FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Sepang International Circuit'	formula_1
SELECT T2.lat, T2.lng FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Abu Dhabi Grand Prix'	formula_1
SELECT T3.nationality FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN constructors AS T3 ON T2.constructorid = T3.constructorid WHERE T1.raceid = 24 AND T2.points = 1	formula_1
SELECT T2.time FROM races AS T1 JOIN qualifying AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T3.driverid = T2.driverid WHERE T1.raceid = 354 AND T3.forename = 'Bruno' AND T3.surname = 'Senna';	formula_1
SELECT T1.nationality FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 355 AND T2.q2time = '01:40'	formula_1
SELECT T2.driverNumber FROM qualifying AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 903 AND T1.q3 LIKE '0:%:54'	formula_1
SELECT COUNT(*) FROM results JOIN races ON results.raceId = races.raceId WHERE races.name = 'Bahrain Grand Prix' AND results.time IS NULL AND races.year = 2007;	formula_1
SELECT T2.url FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.raceid = 901	formula_1
SELECT COUNT(*) FROM results WHERE raceid IN (SELECT raceId FROM races WHERE date = '2015-11-29') AND time IS NOT NULL	formula_1
SELECT drivers.forename, drivers.surname FROM results JOIN races ON results.raceid = races.raceid JOIN drivers ON results.driverid = drivers.driverid WHERE results.time IS NOT NULL AND races.raceid = 592 ORDER BY drivers.dob ASC LIMIT 1;	formula_1
SELECT T2.url FROM races AS T1 JOIN results AS T3 ON T1.raceId = T3.raceId JOIN drivers AS T2 ON T2.driverId = T3.driverId WHERE T1.raceId = 161 AND T3.lapTime LIKE '0:01:27%'	formula_1
SELECT T2.nationality FROM races AS T1 JOIN results AS T3 ON T1.raceId = T3.raceId JOIN drivers AS T2 ON T2.driverId = T3.driverId WHERE T1.raceId = 933 ORDER BY T3.fastestLapSpeed DESC LIMIT 1	formula_1
SELECT T2.lat, T2.lng FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Malaysian Grand Prix'	formula_1
SELECT T1.url FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorid = T2.constructorid WHERE raceid = 9 ORDER BY points DESC LIMIT 1	formula_1
SELECT T2.q1 FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.raceid = 345 AND T2.driverid IN (SELECT driverid FROM drivers WHERE forename = 'Lucas' AND surname = 'di Grassi')	formula_1
SELECT T3.nationality FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T1.raceid = 347 AND T2.q2time = '01:15'	formula_1
SELECT T2.code FROM races AS T1 JOIN drivers AS T2 ON T1.raceid = 45 AND T2.q3 LIKE '01:33%' WHERE T1.raceid = 45	formula_1
SELECT T2.time FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.raceid = 743 AND T2.driverid = (SELECT driverid FROM drivers WHERE forename = 'Bruce' AND surname = 'McLaren')	formula_1
SELECT T1.driverRef FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'San Marino Grand Prix' AND T2.year = 2006 AND T1.position = 2	formula_1
SELECT T2.url FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.raceid = 901	formula_1
SELECT COUNT(*) FROM results WHERE raceid = (SELECT raceId FROM races WHERE date = '2015-11-29') AND time NOT LIKE '%:%'	formula_1
SELECT T3.driverRef FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T1.raceid = 872 AND T2.time IS NOT NULL ORDER BY T3.dob DESC LIMIT 1	formula_1
SELECT T1.driverRef ,  T2.forename ,  T2.surname FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE raceId = 348 ORDER BY time ASC LIMIT 1	formula_1
SELECT T1.nationality FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.fastestLapSpeed = (SELECT MAX(T2.fastestLapSpeed) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId)	formula_1
SELECT ((SELECT results.fastestLapSpeed FROM results JOIN races ON results.raceId = races.raceId WHERE results.driverId = (SELECT drivers.driverId FROM drivers WHERE drivers.forename = 'Paul' AND drivers.surname = 'di Resta') AND races.raceId = 853) - (SELECT results.fastestLapSpeed FROM results JOIN races ON results.raceId = races.raceId WHERE results.driverId = (SELECT drivers.driverId FROM drivers WHERE drivers.forename = 'Paul' AND drivers.surname = 'di Resta') AND races.raceId = 854)) * 100 / (SELECT results.fastestLapSpeed FROM results JOIN races ON results.raceId = races.raceId WHERE results.driverId = (SELECT drivers.driverId FROM drivers WHERE drivers.forename = 'Paul' AND drivers.surname = 'di Resta') AND races.raceId = 853) AS percentage;	formula_1
SELECT CAST(SUM(CASE WHEN T2.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.driverId) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.date = '1983-07-16'	formula_1
SELECT MIN(date) FROM races WHERE name = 'Singapore Grand Prix'	formula_1
SELECT COUNT(*) FROM races WHERE date LIKE '2005%' ; SELECT name FROM races WHERE date LIKE '2005%' ORDER BY name DESC ;	formula_1
SELECT name FROM races WHERE date = (SELECT MIN(date) FROM races)	formula_1
SELECT name, date FROM races WHERE YEAR = 1999 ORDER BY round DESC LIMIT 1;	formula_1
SELECT date_part('year', date) AS race_year, COUNT(*) AS num_races  FROM races  GROUP BY race_year  ORDER BY num_races DESC  LIMIT 1;	formula_1
SELECT name FROM races WHERE date LIKE '2017%' EXCEPT SELECT name FROM races WHERE date LIKE '2000%'	formula_1
SELECT T2.country, T1.name, T2.location FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'European Grand Prix' ORDER BY T1.date ASC LIMIT 1;	formula_1
SELECT T2.date FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitRef WHERE T1.name = 'Brands Hatch' AND T2.name = 'British Grand Prix' ORDER BY T2.year DESC LIMIT 1;	formula_1
SELECT COUNT(*) FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Silverstone Circuit' AND T1.name = 'British Grand Prix'	formula_1
SELECT T3.driverRef FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T1.name = 'Singapore Grand Prix' AND YEAR(T1.date) = 2010 ORDER BY T2.position ASC	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE points = (SELECT MAX(points) FROM results)	formula_1
SELECT T3.driverRef , T3.points FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T1.name = 'Chinese Grand Prix' AND YEAR(T1.date) = 2017 ORDER BY T2.position ASC LIMIT 3	formula_1
SELECT T1.forename, T1.surname, T3.name FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T2.milliseconds = (SELECT MIN(milliseconds) FROM laptimes)	formula_1
SELECT AVG(laps.time)  FROM results  JOIN laps ON results.raceId = laps.raceId AND results.driverId = laps.driverId  JOIN drivers ON drivers.driverId = results.driverId  JOIN races ON races.raceId = results.raceId  WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.name = 'Malaysian Grand Prix' AND races.year = 2009	formula_1
SELECT CAST(SUM(CASE WHEN T3.position > 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T3.raceId) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T3.surname = 'Hamilton' AND T1.year >= 2010	formula_1
SELECT T1.nationality ,  T2.forename ,  T2.surname ,  MAX(T3.points) FROM constructors AS T1 JOIN constructorStandings AS T3 ON T1.constructorId = T3.constructorId JOIN drivers AS T2 WHERE T2.driverId = ( SELECT driverId FROM results WHERE position = 1 ) GROUP BY T2.driverId ORDER BY COUNT(*) DESC LIMIT 1	formula_1
SELECT MIN(YEAR(CURRENT_TIMESTAMP) - YEAR(dob)) AS youngest_age ,  name FROM drivers WHERE nationality = 'Japanese' GROUP BY name ORDER BY dob DESC LIMIT 1	formula_1
SELECT T2.name FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.date BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY T2.circuitId HAVING COUNT(*) >= 4	formula_1
SELECT T1.name, T1.location, T2.name FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitRef WHERE T1.country = 'USA' AND strftime('%Y', T2.date) = '2006'	formula_1
SELECT T1.name, T2.name, T2.location FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE MONTH(T1.date) = 9 AND YEAR(T1.date) = 2005	formula_1
SELECT races.name FROM races JOIN results ON races.raceid = results.raceid JOIN drivers ON results.driverid = drivers.driverid WHERE drivers.forename = 'Alex' AND drivers.surname = 'Yoong' AND results.position < 20	formula_1
SELECT COUNT(*) FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN circuits AS T3 ON T1.circuitid = T3.circuitid WHERE T3.name = 'Sepang International Circuit' AND T2.driverid IN (SELECT driverid FROM drivers WHERE forename = 'Michael' AND surname = 'Schumacher') AND T2.position = 1	formula_1
SELECT results.raceid, races.year FROM results JOIN races ON results.raceid = races.raceid JOIN drivers ON results.driverid = drivers.driverid WHERE drivers.forename = 'Michael' AND drivers.surname = 'Schumacher' GROUP BY results.raceid, races.year ORDER BY MIN(results.milliseconds) ASC LIMIT 1;	formula_1
SELECT AVG(T1.points) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.name = 'Eddie Irvine' AND T1.year = 2000	formula_1
SELECT races.name, results.points FROM results JOIN drivers ON results.driverId = drivers.driverId JOIN races ON results.raceId = races.raceId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' ORDER BY races.year ASC LIMIT 1;	formula_1
SELECT T1.name, T2.country FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE strftime('%Y', T1.date) = '2017' ORDER BY T1.date ASC;	formula_1
SELECT T2.name, T2.date, T1.location FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuit_id WHERE T2.laps = (SELECT MAX(laps) FROM races)	formula_1
SELECT CAST(SUM(IIF(T2.country = "Germany", 1, 0)) AS REAL) * 100 / COUNT(*) FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = "European Grand Prix"	formula_1
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit'	formula_1
SELECT name FROM circuits WHERE lat = (SELECT MAX(lat) FROM circuits WHERE name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring'))	formula_1
SELECT T1.circuitRef FROM circuits AS T1 WHERE T1.name = "Marina Bay Street Circuit"	formula_1
SELECT T2.country FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitRef WHERE T1.alt = (SELECT MAX(`alt`) FROM `circuits`)	formula_1
SELECT COUNT(*) FROM drivers WHERE code IS NULL	formula_1
SELECT T2.nationality FROM drivers AS T1 JOIN driverStandings AS T2 ON T1.driverId = T2.driverId WHERE T1.dob IS NOT NULL ORDER BY T1.dob ASC LIMIT 1	formula_1
SELECT T1.surname FROM drivers AS T1 JOIN driverStandings AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = "Italian" GROUP BY T1.surname	formula_1
SELECT T1.url FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T1.forename = "Anthony" AND T1.surname = "Davidson" LIMIT 1;	formula_1
SELECT T1.driverRef FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.name = "Lewis Hamilton" GROUP BY T1.driverRef	formula_1
SELECT T1.name FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Spanish Grand Prix' AND T2.date = '2009-05-10'	formula_1
SELECT T2.year FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Silverstone Circuit'	formula_1
SELECT T2.url FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuit_id WHERE T1.name = 'Silverstone Circuit'	formula_1
SELECT T1.time FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Abu Dhabi Circuit' AND T1.date BETWEEN '2010-01-01' AND '2019-12-31'	formula_1
SELECT COUNT(*) FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.country = 'Italy'	formula_1
SELECT T2.date FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitRef WHERE T1.name = 'Circuit de Barcelona-Catalunya'	formula_1
SELECT T2.url FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Spanish Grand Prix' AND T1.date LIKE '2009%'	formula_1
SELECT MIN(T2.fastestLapTime) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton'	formula_1
SELECT T2.forename ,  T2.surname FROM results AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T1.fastestlapspeed = ( SELECT MAX(fastestlapspeed) FROM results )	formula_1
SELECT T2.driverRef FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Canadian Grand Prix' AND T1.year = 2007 ORDER BY T2.position ASC LIMIT 1	formula_1
SELECT T3.name FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton'	formula_1
SELECT races.name FROM races JOIN results ON races.raceId = results.raceId JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' ORDER BY results.position ASC LIMIT 1;	formula_1
SELECT MAX(T2.fastestLapSpeed) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Spanish Grand Prix' AND T1.year = 2009	formula_1
SELECT DISTINCT YEAR(races.date) FROM races JOIN results ON races.raceId = results.raceId WHERE results.driverId IN (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')	formula_1
SELECT results.positionOrder FROM results JOIN drivers ON results.driverId = drivers.driverId JOIN races ON results.raceId = races.raceId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.name = 'Chinese Grand Prix' AND races.year = 2008	formula_1
SELECT T3.forename ,  T3.surname FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T1.name = 'Australian Grand Prix' AND T1.year = 1989 AND T2.grid = 4	formula_1
SELECT COUNT(*) FROM results WHERE raceId = (SELECT id FROM races WHERE name = 'Australian Grand Prix' AND date = '2008-03-16') AND time IS NOT NULL	formula_1
SELECT T3.time FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN laps AS T3 ON T2.resultid = T3.resultid WHERE T1.name = 'Australian Grand Prix' AND T1.year = 2008 AND T2.driverid = (SELECT driverid FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton') ORDER BY T3.milliseconds ASC LIMIT 1	formula_1
SELECT T2.time FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.year = 2008 AND T1.name = 'Australian Grand Prix' AND T2.position = 2	formula_1
SELECT T2.driverRef ,  T2.url FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.name = 'Australian Grand Prix' AND SUBSTR(T1.date ,  -4) = '2008' AND T2.position = '1'	formula_1
SELECT COUNT(*)  FROM results  JOIN drivers ON results.driverId = drivers.driverId  WHERE results.raceId IN (     SELECT races.raceId      FROM races      WHERE races.name = 'Australian Grand Prix' AND YEAR(races.date) = 2008 ) AND drivers.nationality = 'British';	formula_1
SELECT COUNT(*) FROM (SELECT T1.driverId FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Chinese Grand Prix' AND T2.year = 2008 AND T1.time IS NOT NULL GROUP BY T1.driverId HAVING COUNT(T1.raceId) > 0)	formula_1
SELECT SUM(T2.points) FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton'	formula_1
SELECT AVG(T2.fastestLapTime) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton') AND T1.name LIKE '%Formula_1%'	formula_1
SELECT CAST(SUM(CASE WHEN T3.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) / COUNT(T2.raceid) FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN circuits AS T3 ON T1.circuitid = T3.circuitid WHERE T1.year = 2008 AND T1.name = 'Australian Grand Prix'	formula_1
SELECT (T2.time - T1.time) * 100 / T2.time FROM (SELECT time FROM results WHERE raceId = (SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND year = 2008) AND position = 1) AS T1, (SELECT SUM(time) AS time FROM results WHERE raceId = (SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND year = 2008)) AS T2	formula_1
SELECT COUNT(*) FROM circuits WHERE location = 'Adelaide' AND country = 'Australia'	formula_1
SELECT lat, lng FROM circuits WHERE country = 'USA'	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND YEAR(dob) > 1980;	formula_1
SELECT MAX(T1.points) FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = "British"	formula_1
SELECT MAX(points), constructorRef FROM results JOIN constructors ON results.constructorId = constructors.constructorId GROUP BY constructorRef ORDER BY points DESC LIMIT 1;	formula_1
SELECT T3.name FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN constructors AS T3 ON T2.constructorId = T3.constructorId WHERE T1.raceId = 291 AND T2.points = 0	formula_1
SELECT COUNT(*) FROM (SELECT T1.constructorId FROM constructors AS T1 JOIN results AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = "Japanese" AND T2.points = 0 GROUP BY T1.constructorId HAVING COUNT(T2.raceId) = 2)	formula_1
SELECT constructorRef FROM results WHERE position = 1 GROUP BY constructorRef	formula_1
SELECT COUNT(*) FROM constructors AS T1 JOIN constructorresults AS T2 ON T1.constructorid = T2.constructorid WHERE T1.nationality = "French" AND T2.laps > 50;	formula_1
SELECT CAST(COUNT(CASE WHEN T3.time IS NOT NULL THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.driverId) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T2.year BETWEEN 2007 AND 2009 AND T3.nationality = "Japanese"	formula_1
SELECT AVG(T2.time) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.year < 1975 AND T2.position = 1 AND T2.time NOT NULL GROUP BY T1.year	formula_1
SELECT T1.forename ,  T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T1.dob > '1975-01-01' AND T2.position = '2'	formula_1
SELECT COUNT(*) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.nationality = "Italian" AND T1.time IS NULL;	formula_1
SELECT T1.forename ,  T1.surname FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid WHERE T2.rank = 1 ORDER BY T2.milliseconds LIMIT 1	formula_1
SELECT T3.number FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN laps AS T3 ON T2.resultid = T3.resultid WHERE T1.year = 2009 ORDER BY T3.milliseconds ASC LIMIT 1	formula_1
SELECT AVG(T2.fastestLapSpeed) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Spanish Grand Prix' AND T1.year = 2009	formula_1
SELECT T1.name ,  strftime('%Y',T1.date) FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T2.milliseconds != '' ORDER BY T2.milliseconds LIMIT 1;	formula_1
SELECT CAST(SUM(CASE WHEN T3.year < 1985 AND T1.laps > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.driverId) FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T1.driverid = T3.driverid WHERE T2.year BETWEEN 2000 AND 2005	formula_1
SELECT COUNT(*) FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T1.nationality = "French" AND T2.laptime < "02:00.00" AND T2.laptime < "120"	formula_1
SELECT driverRef FROM drivers WHERE nationality = 'American'	formula_1
SELECT circuitId FROM races WHERE date LIKE '2009%'	formula_1
SELECT COUNT(*) FROM results WHERE raceId = 18;	formula_1
SELECT T1.driverId , COUNT(T1.driverId) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = "Dutch" GROUP BY T1.driverId ORDER BY T1.dob DESC LIMIT 3;	formula_1
SELECT T1.driverRef FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = "Robert" AND T1.surname = "Kubica";	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = "British" AND YEAR(dob) = 1980;	formula_1
SELECT T3.forename, T3.surname FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T3.nationality = 'German' AND strftime('%Y', T3.dob) BETWEEN '1980' AND '1990' ORDER BY T2.time LIMIT 3	formula_1
SELECT T1.driverRef FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = 'German' ORDER BY STRFTIME('%Y', T1.dob) ASC LIMIT 1;	formula_1
SELECT T2.driverId, T2.code FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE YEAR(T2.dob) = 1971 AND T1.fastestLapTime IS NOT NULL GROUP BY T2.driverId, T2.code ORDER BY T1.fastestLapTime LIMIT 1	formula_1
SELECT T3.name FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T3.nationality = "Spanish" AND YEAR(T3.dob) < 1982 ORDER BY T2.time DESC LIMIT 10	formula_1
SELECT year FROM races WHERE fastestLapTime = (SELECT MIN(fastestLapTime) FROM races)	formula_1
SELECT YEAR FROM races WHERE time = (SELECT MAX(time) FROM races)	formula_1
SELECT T1.driverId FROM (SELECT driverId, MIN(time) AS min_time FROM laps GROUP BY driverId) AS T1 JOIN (SELECT driverId, time AS first_lap_time FROM laps WHERE lap = 1 GROUP BY driverId) AS T2 ON T1.driverId = T2.driverId WHERE T1.min_time = T2.first_lap_time ORDER BY T1.min_time LIMIT 5	formula_1
SELECT COUNT(*) FROM results WHERE raceId BETWEEN 50 AND 100 AND statusId = 2 AND time IS NOT NULL	formula_1
SELECT COUNT(*), T1.location, T1.lat, T1.lng FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.country = 'Austria' GROUP BY T1.location, T1.lat, T1.lng	formula_1
SELECT T1.raceId, COUNT(*) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T1.time IS NOT NULL GROUP BY T1.raceId ORDER BY COUNT(*) DESC LIMIT 1	formula_1
SELECT T1.driverRef, T1.nationality, T1.dob FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 23 AND T2.q2 IS NOT NULL;	formula_1
SELECT T3.year, T3.name, T3.date, T3.time FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T1.dob = (SELECT MIN(dob) FROM drivers) AND T3.date = (SELECT MIN(date) FROM races)	formula_1
SELECT COUNT(*) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.nationality = "American" AND T1.status = "Puncture"	formula_1
SELECT T1.url FROM constructors AS T1 JOIN results AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = 'Italian' ORDER BY T2.points DESC LIMIT 1	formula_1
SELECT T1.url FROM constructors AS T1 JOIN results AS T2 ON T1.constructorId = T2.constructorId WHERE T2.position = 1 GROUP BY T1.constructorId ORDER BY COUNT(*) DESC LIMIT 1	formula_1
SELECT T2.driver FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.name = 'French Grand Prix' ORDER BY T2.time DESC LIMIT 1;	formula_1
SELECT T2.name, MIN(T1.time) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T1.lap = 1 GROUP BY T2.name ORDER BY MIN(T1.time) ASC LIMIT 1;	formula_1
SELECT AVG(T3.fastestlaptime) FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN (SELECT raceid, driverid, fastestlaptime, RANK() OVER(PARTITION BY raceid ORDER BY fastestlaptime) as rank FROM results) AS T3 ON T2.raceid = T3.raceid AND T2.driverid = T3.driverid WHERE T1.name = 'United States Grand Prix' AND T1.year = 2006 AND T3.rank < 11	formula_1
SELECT T3.forename, T3.surname FROM (SELECT T2.driverId, AVG(T1.duration) as avg_duration FROM pitStops AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.dob BETWEEN '1980-01-01' AND '1985-12-31' AND T2.nationality = 'German' GROUP BY T2.driverId) AS T4 JOIN drivers AS T3 ON T4.driverId = T3.driverId ORDER BY T4.avg_duration ASC LIMIT 3	formula_1
SELECT T3.time FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN circuits AS T3 ON T1.circuitid = T3.circuitid WHERE T1.name = 'Canadian Grand Prix' AND T1.year = 2008 AND T2.position = 1	formula_1
SELECT T1.constructorRef, T1.url FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Singapore Grand Prix' AND T2.year = 2009 ORDER BY T1.time LIMIT 1	formula_1
SELECT T1.forename, T1.surname, T1.dob FROM drivers AS T1 JOIN driverStandings AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = 'Austrian' AND YEAR(T1.dob) BETWEEN 1981 AND 1991	formula_1
SELECT T1.forename, T1.surname, T1.wiki, T1.dob FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T1.nationality = 'German' AND YEAR(T1.dob) BETWEEN 1971 AND 1985 ORDER BY T1.dob DESC	formula_1
SELECT T1.location, T1.country, T1.lat, T1.lng FROM circuits AS T1 WHERE T1.name = 'Hungaroring'	formula_1
SELECT MAX(results.points), constructors.name, constructors.nationality  FROM results  JOIN races ON results.raceId = races.raceId  JOIN constructors ON results.constructorId = constructors.constructorId  WHERE races.name = 'Monaco Grand Prix' AND races.year BETWEEN 1980 AND 2010;	formula_1
SELECT AVG(T3.points) FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T1.name = 'Turkish Grand Prix' AND T3.forename = 'Lewis' AND T3.surname = 'Hamilton'	formula_1
SELECT AVG(cnt) FROM (SELECT COUNT(*) AS cnt FROM races WHERE date BETWEEN '2000-01-01' AND '2010-12-31' GROUP BY strftime('%Y', date)) AS yearly_cnts;	formula_1
SELECT nationality FROM drivers GROUP BY nationality ORDER BY COUNT(*) DESC LIMIT 1	formula_1
SELECT COUNT(*) FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T2.driverid = (SELECT driverid FROM drivers WHERE rank = '91') AND T2.position = 1	formula_1
SELECT T1.name FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T2.fastestlaptime IS NOT NULL ORDER BY T2.fastestlaptime LIMIT 1	formula_1
SELECT T2.location, T2.country FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.date = (SELECT MAX(date) FROM races)	formula_1
SELECT T3.forename, T3.surname FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T1.year = 2008 AND T1.circuitid IN (SELECT circuitid FROM circuits WHERE name = 'Marina Bay Street Circuit') ORDER BY T2.q3 ASC LIMIT 1	formula_1
SELECT T1.forename, T1.surname, T1.nationality, T3.name FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T1.dob = (SELECT MAX(dob) FROM drivers)	formula_1
SELECT COUNT(*) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE name = 'Canadian Grand Prix') AND statusId = 3 GROUP BY driverId ORDER BY COUNT(*) DESC LIMIT 1	formula_1
SELECT COUNT(*) , T1.forename ,  T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T1.dob = ( SELECT MIN(dob) FROM drivers ) AND T2.position = '1' GROUP BY T1.forename ,  T1.surname	formula_1
SELECT MAX(time) FROM races WHERE name = 'Pit Stop'	formula_1
SELECT T1.time FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.fastestLapRank = 1 ORDER BY T1.time LIMIT 1	formula_1
SELECT MAX(T2.duration) FROM races AS T1 JOIN pitStops AS T2 ON T1.raceId = T2.raceId WHERE T2.driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')	formula_1
SELECT T3.lap FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN pitstops AS T3 ON T2.resultid = T3.driverid WHERE T1.name = 'Australian Grand Prix' AND T1.year = 2011 AND T2.driverid IN (SELECT driverid FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')	formula_1
SELECT T3.duration FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN pitstops AS T3 ON T2.driverid = T3.driverid AND T2.stop = T3.stop WHERE T1.name = 'Australian Grand Prix' AND T1.year = 2011	formula_1
SELECT T2.time FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton') ORDER BY T2.time LIMIT 1;	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid WHERE T2.milliseconds = (SELECT MIN(milliseconds) FROM laptimes) LIMIT 1;	formula_1
SELECT T2.position FROM (SELECT circuitId, MIN(time) AS fastest_lap_time FROM races GROUP BY circuitId) AS T1 JOIN results AS T2 ON T1.circuitId = T2.circuitId AND T1.fastest_lap_time = T2.time WHERE driverRef = 'lewis_hamilton'	formula_1
SELECT T1.time FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Austrian Grand Prix' ORDER BY T1.time LIMIT 1;	formula_1
SELECT T1.name, MIN(T2.time) FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuit_id WHERE T1.country = 'Italy' GROUP BY T1.name	formula_1
SELECT T2.name FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Austrian Grand Prix' ORDER BY T1.time LIMIT 1	formula_1
SELECT T2.duration FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.name = 'Austrian Grand Prix' AND T2.fastestlap = 1	formula_1
SELECT T2.lat, T2.lng FROM results AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.fastestLapTime = '1:29.488'	formula_1
SELECT AVG(T2.milliseconds) FROM races AS T1 JOIN pitStops AS T2 ON T1.raceId = T2.raceId WHERE T2.driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')	formula_1
SELECT AVG(T2.milliseconds) FROM circuits AS T1 JOIN laps AS T2 ON T1.circuitid = T2.circuit_id WHERE T1.country = 'Italy'	formula_1
SELECT T1.player_api_id FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.overall_rating DESC LIMIT 1;	european_football_2
SELECT player_name, MAX(height) FROM Player	european_football_2
SELECT T1.preferred_foot FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.preferred_foot IS NOT NULL AND T1.attacking_work_rate IS NOT NULL ORDER BY T2.potential ASC LIMIT 1	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE overall_rating BETWEEN 60 AND 65 AND defensive_work_rate = 'Low'	european_football_2
SELECT T1.player_name, T2.player_fifa_api_id FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.crossing IS NOT NULL ORDER BY T2.crossing DESC LIMIT 5;	european_football_2
SELECT T1.name FROM League AS T1 JOIN Match AS T2 ON T1.id = T2.country_id WHERE T2.season = '2015/2016' GROUP BY T1.name ORDER BY SUM(T2.home_team_goal + T2.away_team_goal) DESC LIMIT 1	european_football_2
SELECT T1.team_api_id FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id WHERE T2.season = '2015/2016' AND (T2.home_team_goal - T2.away_team_goal) < 0 GROUP BY T1.team_api_id ORDER BY COUNT(*) ASC LIMIT 1	european_football_2
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.penalties IS NOT NULL ORDER BY T1.penalties DESC LIMIT 10;	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id WHERE T2.season = '2009/2010' AND T2.league_id IN (SELECT League.id FROM League WHERE League.name = 'Scotland Premier League') AND T2.away_team_goal > T2.home_team_goal GROUP BY T2.away_team_api_id ORDER BY COUNT(*) DESC LIMIT 1	european_football_2
SELECT T2.buildUpPlaySpeed FROM  (SELECT TeamID, MAX(buildUpPlaySpeed) as buildUpPlaySpeed FROM Team GROUP BY TeamID ORDER BY buildUpPlaySpeed DESC LIMIT 4) AS T1  JOIN Team AS T2 ON T1.TeamID = T2.TeamID WHERE T1.buildUpPlaySpeed = T2.buildUpPlaySpeed ORDER BY T2.buildUpPlaySpeed DESC;	european_football_2
SELECT T1.name FROM League AS T1 JOIN Match AS T2 ON T1.country_id = T2.country_id WHERE T2.season = '2015/2016' GROUP BY T1.name ORDER BY SUM(CASE WHEN T2.home_team_goal = T2.away_team_goal THEN 1 ELSE 0 END) DESC LIMIT 1	european_football_2
SELECT T1.player_name ,  (strftime('%Y', 'now') - strftime('%Y', T1.birthday)) AS age FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.sprint_speed >= 97 AND T2.date BETWEEN '2013-01-01' AND '2015-12-31'	european_football_2
SELECT T2.name ,  COUNT(T1.league_id) FROM Match AS T1 JOIN League AS T2 ON T1.league_id = T2.id GROUP BY T1.league_id ORDER BY COUNT(T1.league_id) DESC LIMIT 1	european_football_2
SELECT AVG(height) FROM Player WHERE birthday >= '1990-01-01 00:00:00' AND birthday < '1996-01-01 00:00:00'	european_football_2
SELECT T1.player_api_id FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE SUBSTR(T2.date, 1, 4) = '2010' GROUP BY T1.player_api_id HAVING AVG(T2.overall_rating) > (SELECT AVG(overall_rating) FROM Player_Attributes WHERE SUBSTR(date, 1, 4) = '2010') ORDER BY AVG(T2.overall_rating) DESC LIMIT 1	european_football_2
SELECT team_api_id FROM Team WHERE buildUpPlaySpeed > 50 AND buildUpPlaySpeed < 60	european_football_2
SELECT T2.team_long_name FROM Team_Attributes AS T1 JOIN Teams AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlayPassing > (SELECT AVG(buildUpPlayPassing) FROM Team_Attributes WHERE strftime('%Y', date) = '2012') AND strftime('%Y', T1.date) = '2012'	european_football_2
SELECT CAST(SUM(CASE WHEN T2.preferred_foot = 'left' THEN 1 ELSE 0 END) * 100 AS REAL) / COUNT(T1.player_fifa_api_id) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE strftime('%Y', T1.birthday) BETWEEN '1987' AND '1992'	european_football_2
SELECT T1.name FROM League AS T1 JOIN (SELECT league_id, SUM(away_team_goal) + SUM(home_team_goal) as total_goals FROM Match GROUP BY league_id) AS T2 ON T1.id = T2.league_id ORDER BY total_goals ASC LIMIT 5;	european_football_2
SELECT AVG(T2.long_shots) FROM Player AS T1 JOIN Player_Stats AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.player_name = 'Ahmed Samir Farag'	european_football_2
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.height > 180 GROUP BY T2.player_name ORDER BY AVG(T1.heading_accuracy) DESC LIMIT 10	european_football_2
SELECT T2.team_long_name FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlayDribblingClass = 'Normal' AND T1.date BETWEEN '2014-01-01 00:00:00' AND '2014-01-31 00:00:00' AND T1.chanceCreationPassing < (SELECT AVG(chanceCreationPassing) FROM Team_Attributes WHERE date BETWEEN '2014-01-01 00:00:00' AND '2014-01-31 00:00:00') ORDER BY T1.chanceCreationPassing DESC	european_football_2
SELECT T1.name FROM League AS T1 JOIN Match AS T2 ON T1.country_id = T2.country_id WHERE T2.season = '2009/2010' GROUP BY T1.name HAVING SUM(T2.home_team_goal) / COUNT(DISTINCT T2.id) > SUM(T2.away_team_goal) / COUNT(DISTINCT T2.id)	european_football_2
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers' LIMIT 1;	european_football_2
SELECT player_name FROM Player WHERE SUBSTR(birthday, 1, 7) = '1970-10'	european_football_2
SELECT T2.attacking_work_rate FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = "Franco Zennaro" ORDER BY T2.date DESC LIMIT 1;	european_football_2
SELECT T2.buildUpPlayPositioningClass FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_fifa_api_id WHERE T1.team_long_name = 'ADO Den Haag' AND T2.date LIKE '2014%' LIMIT 1;	european_football_2
SELECT T2.heading_accuracy FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Francois Affolter' AND T2.date = '2014-09-18 00:00:00'	european_football_2
SELECT T1.overall_rating FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = "Gabriel Tamas" AND strftime('%Y', T1.date) = '2011'	european_football_2
SELECT COUNT(*) FROM Match WHERE season = '2015/2016' AND league_id IN (SELECT id FROM League WHERE name = 'Scotland Premier League')	european_football_2
SELECT T1.preferred_foot FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id ORDER BY T2.birthday DESC LIMIT 1;	european_football_2
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.potential = (SELECT MAX(potential) FROM Player_Attributes)	european_football_2
SELECT COUNT(*) FROM Player WHERE weight < 130 AND preferred_foot = 'left'	european_football_2
SELECT T1.team_short_name FROM Team AS T1 JOIN Player_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.chanceCreationPassingClass = 'Risky' GROUP BY T1.team_short_name;	european_football_2
SELECT T2.defensive_work_rate FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'David Wilson' ORDER BY T2.date DESC LIMIT 1	european_football_2
SELECT T2.birthday FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)	european_football_2
SELECT T1.name FROM League AS T1 JOIN Country AS T2 ON T1.country_id = T2.id WHERE T2.name = "Netherlands"	european_football_2
SELECT AVG(T2.home_team_goal) FROM Country AS T1 JOIN League AS T2 ON T1.id = T2.country_id JOIN Match AS T3 ON T2.id = T3.league_id WHERE T1.name = 'Poland' AND T3.season = '2010/2011'	european_football_2
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.height = (SELECT MAX(T3.height) FROM Player AS T3 UNION SELECT MIN(T4.height) FROM Player AS T4) GROUP BY T1.player_name ORDER BY AVG(T2.finishing) DESC LIMIT 1	european_football_2
SELECT player_name FROM Player WHERE height > 180	european_football_2
SELECT COUNT(*) FROM Player WHERE strftime('%Y', birthday) > '1990'	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Adam%' AND weight > 170;	european_football_2
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.overall_rating > 80 AND strftime('%Y', T1.date) BETWEEN '2008' AND '2010' GROUP BY T2.player_name	european_football_2
SELECT T2.potential FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = "Aaron Doran" ORDER BY T2.date DESC LIMIT 1;	european_football_2
SELECT player_name FROM Player WHERE preferred_foot = 'left'	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeedClass = 'Fast' GROUP BY T1.team_long_name	european_football_2
SELECT T2.buildUpPlayPassingClass FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.id WHERE T1.team_short_name = 'CLB' ORDER BY T2.date DESC LIMIT 1;	european_football_2
SELECT T1.team_short_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlayPassing > 70	european_football_2
SELECT AVG(T2.overall_rating) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.height > 170 AND strftime('%Y', T2.date) BETWEEN '2010' AND '2015'	european_football_2
SELECT player_name FROM Player WHERE height = (SELECT MIN(height) FROM Player)	european_football_2
SELECT T1.country FROM Country AS T1 JOIN League AS T2 ON T1.id = T2.country_id WHERE T2.name = "Italy Serie A"	european_football_2
SELECT T1.team_short_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_fifa_api_id WHERE T2.buildUpPlaySpeed = 31 AND T2.buildUpPlayDribbling = 53 AND T2.buildUpPlayPassing = 32	european_football_2
SELECT AVG(T2.overall_rating) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Aaron Doran'	european_football_2
SELECT COUNT(*) FROM Match WHERE league_id IN (SELECT id FROM League WHERE name = 'Germany 1. Bundesliga') AND strftime('%Y-%m', date) BETWEEN '2008-08' AND '2008-10'	european_football_2
SELECT T2.team_short_name FROM Match AS T1 JOIN Team AS T2 ON T1.home_team_api_id = T2.team_api_id WHERE T1.home_team_goal = 10	european_football_2
SELECT player_name FROM Player WHERE balance = (SELECT MAX(T1.balance) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.potential = 61) AND potential = 61;	european_football_2
SELECT (SUM(CASE WHEN T1.player_name = 'Abdou Diallo' THEN T2.ball_control ELSE 0 END) / COUNT(CASE WHEN T1.player_name = 'Abdou Diallo' THEN T1.id ELSE NULL END)) - (SUM(CASE WHEN T1.player_name = 'Aaron Appindangoye' THEN T2.ball_control ELSE 0 END) / COUNT(CASE WHEN T1.player_name = 'Aaron Appindangoye' THEN T1.id ELSE NULL END)) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id	european_football_2
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN' LIMIT 1;	european_football_2
SELECT player_name FROM Player WHERE player_name = 'Aaron Lennon' OR player_name = 'Abdelaziz Barrada' ORDER BY STRFTIME('%Y-%m-%d', birthday) LIMIT 1;	european_football_2
SELECT player_name FROM Player WHERE height = (SELECT MAX(height) FROM Player)	european_football_2
SELECT COUNT(*) FROM Player WHERE preferred_foot = 'left' AND attacking_work_rate = 'low'	european_football_2
SELECT T1.country FROM Country AS T1 JOIN League AS T2 ON T1.id = T2.country_id WHERE T2.name = "Belgium Jupiler League"	european_football_2
SELECT League.name FROM League JOIN Country ON League.country_id = Country.id WHERE Country.name = 'Germany'	european_football_2
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.attribute_name = 'Overall Rating' ORDER BY CAST(SUBSTRING(T1.attribute_value, 1, LENGTH(T1.attribute_value) - 1) AS REAL) DESC LIMIT 1	european_football_2
SELECT COUNT(DISTINCT T2.player_api_id) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE strftime('%Y', T2.birthday)<'1986' AND T1.defensive_work_rate='High'	european_football_2
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone') ORDER BY T1.crossing DESC LIMIT 1	european_football_2
SELECT T2.BHA FROM Player AS T1 JOIN Player_Stats AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Ariel Borysiuk'	european_football_2
SELECT COUNT(*) FROM Player WHERE height > 180 AND volleys > 70	european_football_2
SELECT T1.player_name FROM Player AS T1 JOIN Player_Stats AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.VCA > 70 AND T2.GBA > 70	european_football_2
SELECT COUNT(*) FROM Match WHERE season = '2008/2009' AND country_id IN (SELECT id FROM Country WHERE name = 'Belgium')	european_football_2
SELECT MAX(T1.long_passing) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.long_passing IN (SELECT long_passing FROM Player_Attributes WHERE player_fifa_api_id = T2.player_fifa_api_id) AND T2.birthday = (SELECT MIN(birthday) FROM Player)	european_football_2
SELECT COUNT(*) FROM Match WHERE league_id IN (SELECT id FROM League WHERE name = 'Belgium Jupiler League') AND SUBSTR(date, 1, 7) = '2009-04'	european_football_2
SELECT T1.name FROM League AS T1 JOIN Match AS T2 ON T1.id = T2.league_id WHERE T2.season = '2008/2009' GROUP BY T1.name ORDER BY COUNT(*) DESC LIMIT 1	european_football_2
SELECT AVG(T2.overall_rating) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE strftime('%Y', T1.birthday) < '1986'	european_football_2
SELECT (T2.overall_rating - T1.overall_rating) / T1.overall_rating * 100 FROM Player AS T1 JOIN Player_Stats AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Ariel Borysiuk' AND T2.player_api_id IN (SELECT player_api_id FROM Player WHERE player_name = 'Paulin Puel')	european_football_2
SELECT AVG(T2.buildUpPlaySpeed) FROM Player AS T1 JOIN Player_Stats AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.team_long_name = 'Heart of Midlothian'	european_football_2
SELECT AVG(T1.overall_rating) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Pietro Marino'	european_football_2
SELECT SUM(T1.crossing) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Aaron Lennox'	european_football_2
SELECT T2.chanceCreationPassingClass, MAX(T2.chanceCreationPassing) FROM Team AS T1 JOIN Player_Attributes AS T2 ON T1.team_api_id = T2.team_id WHERE T1.team_long_name = 'Ajax' GROUP BY T2.chanceCreationPassingClass ORDER BY MAX(T2.chanceCreationPassing) DESC LIMIT 1	european_football_2
SELECT T1.preferred_foot FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Abdou Diallo' GROUP BY T1.preferred_foot ORDER BY COUNT(T2.id) DESC LIMIT 1	european_football_2
SELECT MAX(T1.overall_rating) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Dorlan Pabon'	european_football_2
SELECT AVG(T2.away_team_goal) FROM Matches AS T1 JOIN League AS T2 ON T1.match_api_id = T2.match_api_id WHERE T1.team_long_name_away = 'Parma' AND T1.country = 'Italy'	european_football_2
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.overall_rating = 77 AND T2.date LIKE '2016-06-23%' ORDER BY T1.birthday ASC LIMIT 1	european_football_2
SELECT T1.overall_rating FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Aaron Mooy' AND T1.date LIKE '2016-02-04%'	european_football_2
SELECT T1.potential FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Francesco Parravicini' AND T1.date = '2010-08-30 00:00:00'	european_football_2
SELECT T1.attacking_work_rate FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Francesco Migliore' AND T1.date LIKE '2015-05-01%'	european_football_2
SELECT T1.DW FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Kevin Berigaud' AND T1.date = '2013-02-22 00:00:00'	european_football_2
SELECT T1.date FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Kevin Constant' AND T1.crossing = (SELECT MAX(crossing) FROM Player_Attributes WHERE player_fifa_api_id = (SELECT player_fifa_api_id FROM Player WHERE player_name = 'Kevin Constant'))	european_football_2
SELECT T3.BUPS FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id WHERE T1.team_long_name = 'Willem II' AND T2.date = '2012-02-22' JOIN Team_Attributes AS T3 ON T1.team_api_id = T3.team_api_id AND T2.date = T3.date	european_football_2
SELECT T3.BUP FROM Team AS T1 JOIN Player_Attributes AS T2 ON T1.team_api_id = T2.player_fifa_api_id JOIN Player AS T3 ON T2.player_fifa_api_id = T3.player_fifa_api_id WHERE T1.team_short_name = 'LEI' AND T2.date = '2015-09-10 00:00:00'	european_football_2
SELECT T3.BUP FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id JOIN Team_Statistics AS T3 ON T2.id = T3.match_api_id WHERE T1.team_long_name = 'FC Lorient' AND T2.date LIKE '2010-02-22%'	european_football_2
SELECT T4.CCP FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id WHERE T1.team_long_name = 'PEC Zwolle' AND T2.date = '2013-09-20 00:00:00' UNION SELECT T4.CCP FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id WHERE T1.team_long_name = 'PEC Zwolle' AND T2.date = '2013-09-20 00:00:00'	european_football_2
SELECT T3.cc_crossing FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id JOIN (SELECT chance_creation_crossing AS cc_crossing FROM Player_Attributes WHERE date = '2010-02-22 00:00:00' AND player_api_id IN(SELECT player_api_id FROM Player WHERE team_long_name = 'Hull City')) AS T3 WHERE T1.date = '2010-02-22 00:00:00' AND T2.team_long_name = 'Hull City'	european_football_2
SELECT T1.def_aggression FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_long_name = 'Hannover 96' AND T1.date LIKE '2015-09-10%'	european_football_2
SELECT AVG(T1.overall_rating) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Marko Arnautovic' AND SUBSTR(T1.date, 1, 10) BETWEEN '2007-02-22' AND '2016-04-21'	european_football_2
SELECT (SUM(CASE WHEN T2.player_name = 'Landon Donovan' THEN T1.overall_rating ELSE 0 END) - SUM(CASE WHEN T2.player_name = 'Jordan Bowery' THEN T1.overall_rating ELSE 0 END)) / SUM(CASE WHEN T2.player_name = 'Landon Donovan' THEN T1.overall_rating ELSE 0 END) * 100 FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE date = '2013-07-12'	european_football_2
SELECT player_name FROM Player ORDER BY height DESC LIMIT 1	european_football_2
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10	european_football_2
SELECT player_name FROM Player WHERE (datetime('now','localtime') - datetime(birthday)) / 365 >= 35	european_football_2
SELECT COUNT(T1.home_team_goal) FROM Match AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = "Aaron Lennon"	european_football_2
SELECT SUM(T2.away_team_goal) FROM Player AS T1 JOIN Game AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name IN ('Daan Smith', 'Filipe Ferreira')	european_football_2
SELECT SUM(T2.home_team_goal) FROM Player AS T1 JOIN Match AS T2 ON T1.player_api_id = T2.player_api_id WHERE (datetime('now') - datetime(T1.birthday)) / 365 <= 30	european_football_2
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)	european_football_2
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.potential = (SELECT MAX(potential) FROM Player_Attributes)	european_football_2
SELECT player_name FROM Player WHERE attacking_work_rate = 'High'	european_football_2
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.finishing = 1 ORDER BY datetime('now') - datetime(T2.birthday) DESC LIMIT 1	european_football_2
SELECT T2.player_name FROM Country AS T1 JOIN Player_Attributes AS T2 ON T1.id = T2.country_id WHERE T1.name = 'Belgium'	european_football_2
SELECT T1.player_name ,  T2.country FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.vision > 89	european_football_2
SELECT T1.country_name FROM Country AS T1 JOIN Player AS T2 ON T1.id = T2.country_id GROUP BY T1.country_name ORDER BY AVG(T2.weight) DESC LIMIT 1	european_football_2
SELECT T2.team_long_name FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlaySpeedClass = 'Slow' GROUP BY T2.team_long_name	european_football_2
SELECT T1.team_short_name FROM Team AS T1 JOIN Player_Attributes AS T2 ON T1.team_api_id = T2.player_team_api_id WHERE T2.chanceCreationPassingClass = 'Safe'	european_football_2
SELECT AVG(T2.height) FROM Country AS T1 JOIN Player AS T2 ON T1.id = T2.country_id WHERE T1.name = 'Italy'	european_football_2
SELECT player_name FROM Player WHERE height > 180 ORDER BY player_name ASC LIMIT 3	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND birthday > '1990-01-01'	european_football_2
SELECT (SELECT JUMPING FROM Player_Attributes WHERE player_fifa_api_id = 6) - (SELECT JUMPING FROM Player_Attributes WHERE player_fifa_api_id = 23) AS difference_in_jumping_scores	european_football_2
SELECT T1.player_api_id FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.preferred_foot = 'right' ORDER BY T2.potential ASC LIMIT 5;	european_football_2
SELECT COUNT(*) FROM Player WHERE preferred_foot = 'left' AND crossing = (SELECT MAX(crossing) FROM Player)	european_football_2
SELECT CAST(SUM(CASE WHEN T1.stamina > 80 AND T1.strength > 80 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id	european_football_2
SELECT T2.country FROM League AS T1 JOIN Country AS T2 ON T1.country_id = T2.id WHERE T1.name = 'Poland Ekstraklasa'	european_football_2
SELECT T1.home_team_goal , T1.away_team_goal FROM Match AS T1 JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.date LIKE '2008-09-24%' AND T2.name = 'Belgium Jupiler League'	european_football_2
SELECT T1.sprint_speed ,  T1.agility ,  T1.acceleration FROM Player_Stats AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = "Alexis Blin"	european_football_2
SELECT T2.buildUpPlaySpeedClass FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'KSV Cercle Brugge' ORDER BY T2.date DESC LIMIT 1;	european_football_2
SELECT COUNT(*) FROM Game WHERE season = '2015/2016' AND league = 'Italian Serie A'	european_football_2
SELECT MAX(T1.home_team_goal) FROM Match AS T1 JOIN League AS T2 ON T1.league_id = T2.id WHERE T2.country = 'Netherlands' AND T2.name = 'Eredivisie'	european_football_2
SELECT T1.finishing, T1.curve FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.weight = (SELECT MAX(weight) FROM Player) LIMIT 1;	european_football_2
SELECT T2.name FROM Country AS T1 JOIN League AS T2 ON T1.id = T2.country_id JOIN Match AS T3 ON T2.id = T3.league_id WHERE T3.season = '2015/2016' GROUP BY T2.name ORDER BY COUNT(T3.id) DESC LIMIT 4	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id WHERE T2.away_team_goal = (SELECT MAX(away_team_goal) FROM Match)	european_football_2
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes) LIMIT 1;	european_football_2
SELECT CAST(SUM(CASE WHEN T2.height < 180 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.player_api_id) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.overall_rating > 70	european_football_2
SELECT      CASE          WHEN SUM(CASE WHEN T2.Admission = '+' THEN 1 ELSE 0 END) > SUM(CASE WHEN T2.Admission = '-' THEN 1 ELSE 0 END)              THEN 'More In-Patients'          ELSE 'More Outpatients'      END AS Result,     ABS(SUM(CASE WHEN T2.Admission = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN T2.Admission = '-' THEN 1 ELSE 0 END)) /      (SUM(CASE WHEN T2.Admission = '+' THEN 1 ELSE 0 END) + SUM(CASE WHEN T2.Admission = '-' THEN 1 ELSE 0 END)) * 100 AS Deviation_Percentage FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND (T2.Admission = '+' OR T2.Admission = '-')	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T2.SEX = 'F' AND YEAR(T2.Birthday) > 1930 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(CASE WHEN T2.SEX = 'F' THEN 1 ELSE NULL END) FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T2.Admisson = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE strftime('%Y', T1.Birthday) BETWEEN '1930' AND '1940'	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T2.Admisson = '+' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T2.Admisson = '-' THEN 1 ELSE 0 END) FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'SLE'	thrombosis_prediction
SELECT T2.Diagnosis, T1.LabTestDate FROM Lab AS T1 JOIN Examination AS T2 ON T1.Patient_ID = T2.ID WHERE T1.Patient_ID = 30609 GROUP BY T1.LabTestDate, T2.Diagnosis	thrombosis_prediction
SELECT T1.Sex ,  T1.Birthday ,  T2.Examination_Date ,  T2.Symptoms FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.ID = '163109'	thrombosis_prediction
SELECT T1.ID, T1.Sex, T1.Birthday FROM Patient AS T1 JOIN LabTest AS T2 ON T1.ID = T2.Patient WHERE T2.LDH > 500 AND T2.Test_Name = 'LDH'	thrombosis_prediction
SELECT T1.ID, (YEAR(CURRENT_TIMESTAMP) - YEAR(T1.Birthday)) AS Age FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.RVVT = '+'	thrombosis_prediction
SELECT T1.ID, T1.Sex, T2.Diagnosis FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Thrombosis = 2	thrombosis_prediction
SELECT Patient.ID FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE YEAR(Patient.Birthday) = 1937 AND Examination.T_CHO >= 250	thrombosis_prediction
SELECT T1.ID, T1.Sex, T2.Diagnosis FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.ALB < 3.5;	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T2.Sex = 'F' AND (T2.TP < 6.0 OR T2.TP > 8.5) THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.ID) FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID	thrombosis_prediction
SELECT AVG(T2.aCL_IgG) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Admisson = '+' AND EXTRACT(YEAR FROM CURRENT_TIMESTAMP) - EXTRACT(YEAR FROM T1.Birthday) >= 50	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE Sex = 'F' AND YEAR(AdmissionDate) = 1997 AND Admission = '-'	thrombosis_prediction
SELECT MIN(T2.age) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Examination_Date = T1.First_Date	thrombosis_prediction
SELECT COUNT(*) FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Patient.Sex = 'F' AND Examination.Thrombosis = 1 AND strftime('%Y', Examination.Examination_Date) = '1997'	thrombosis_prediction
SELECT MAX(T2.Birthday) - MIN(T2.Birthday) AS AgeGap FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.Patient_ID = T2.ID WHERE T1.Triglyceride >= 200 AND T1.Triglyceride < 8 GROUP BY T2.ID	thrombosis_prediction
SELECT T2.Symptoms, T2.Diagnosis FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Birthday = (SELECT MAX(Birthday) FROM Patient WHERE Examination IS NOT NULL)	thrombosis_prediction
SELECT COUNT(T1.ID) / 12 AS average_male_patients_per_month FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.Examination_Date BETWEEN '1998-01-01' AND '1998-12-31'	thrombosis_prediction
SELECT T1.Examination_Date ,  T2.Birthday FROM `Examination` AS T1 JOIN `Patient` AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis LIKE '%SJS%' ORDER BY T2.Birthday LIMIT 1	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T1.SEX = 'M' AND T2.UA <= 8 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T1.SEX = 'F' AND T2.UA <= 6.5 THEN 1 ELSE 0 END) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 LEFT JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Examination_Date IS NULL OR DATE_SUB(T2.Examination_Date, INTERVAL 1 YEAR) < T1.First_Date	thrombosis_prediction
SELECT COUNT(DISTINCT T2.ID) FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE YEAR(T1.Examination_Date) BETWEEN 1990 AND 1993 AND YEAR(T2.Birthday) < 18	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'M' AND T_BIL >= 2.0	thrombosis_prediction
SELECT Diagnosis FROM Examination WHERE `Examination Date` BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY Diagnosis ORDER BY COUNT(Diagnosis) DESC LIMIT 1	thrombosis_prediction
SELECT AVG(CAST(1999 - EXTRACT(YEAR FROM T2.Birthday) AS REAL)) FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Examination_Date BETWEEN '1991-10-01' AND '1991-10-30'	thrombosis_prediction
SELECT T2.Examination_Date ,  T1.Birthday ,  T2.Diagnosis FROM patient AS T1 JOIN examination AS T2 ON T1.ID = T2.ID WHERE T2.HGB = (SELECT MAX(HGB) FROM examination)	thrombosis_prediction
SELECT ANA FROM Examination WHERE ID = 3605340 AND Examination_Date = '1996-12-02'	thrombosis_prediction
SELECT COUNT(*) > 0 FROM Lab WHERE ID = 2927464 AND "Lab Test Name" = 'Total Cholesterol' AND `Lab Test Value` < 250 AND `Lab Test Date` = '1995-09-04'	thrombosis_prediction
SELECT T1.SEX FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'AORTITIS' ORDER BY T2.Examination_Date ASC LIMIT 1;	thrombosis_prediction
SELECT aCL_IgM FROM Examination WHERE Diagnosis = 'SLE' AND Examination_Date = '1994-02-19' AND ID IN (SELECT ID FROM Examination WHERE Examination_Date = '1993-11-12')	thrombosis_prediction
SELECT T1.SEX FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.GPT = 9 AND T2.Date = '1992-06-12'	thrombosis_prediction
SELECT T2.age FROM (SELECT * FROM Laboratory WHERE Date = '1991-10-21' AND UA = '8.4') AS T1 JOIN Patient AS T2 ON T1.Patient_ID = T2.ID WHERE T2.Birthday = DATE_SUB('1991-10-21', INTERVAL T2.age YEAR)	thrombosis_prediction
SELECT COUNT(L.ID) FROM Examination E JOIN Laboratory L ON E.ID = L.Patient_ID WHERE E.First_Date = '1991-06-13' AND E.Diagnosis = 'SJS' AND L.Date LIKE '1995%'	thrombosis_prediction
SELECT T1.Diagnosis FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Examination_Date = '1997-01-27' AND T1.Diagnosis = 'SLE' AND T2.First_Date = (SELECT MIN(T3.First_Date) FROM Patient AS T3 WHERE T3.ID IN(SELECT ID FROM Examination WHERE Diagnosis = 'SLE' AND `Examination Date` = '1997-01-27'))	thrombosis_prediction
SELECT T2.Symptoms FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Birthday = '1959-03-01' AND T2.Examination_Date = '1993-09-27'	thrombosis_prediction
SELECT (SUM(CASE WHEN T1.Birthday = '1959-02-18' AND strftime('%Y-%m', T2.Examination_Date) = '1981-11' THEN T2.aCL_IgG ELSE 0 END) - SUM(CASE WHEN T1.Birthday = '1959-02-18' AND strftime('%Y-%m', T2.Examination_Date) = '1981-12' THEN T2.aCL_IgG ELSE 0 END)) / SUM(CASE WHEN T1.Birthday = '1959-02-18' AND strftime('%Y-%m', T2.Examination_Date) = '1981-11' THEN T2.aCL_IgG ELSE 0 END) FROM patient AS T1 JOIN examination AS T2 ON T1.ID = T2.Patient_ID	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'Behcet' AND YEAR(T2.Examination Date) >= 1997 AND YEAR(T2.Examination Date) <= 1997	thrombosis_prediction
SELECT ID FROM Examination WHERE Examination_Date BETWEEN '1987-07-06' AND '1996-01-31' AND GPT > 30 AND ALB < 4 ORDER BY ID	thrombosis_prediction
SELECT COUNT(*), ID FROM Patient WHERE SEX = 'F' AND YEAR(Birthday) = 1964 AND Admission = '+' GROUP BY ID;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE `Thrombosis` = 2 AND `ANA Pattern` = 'S' AND `aCL IgM` > (SELECT AVG(`aCL IgM`) * 1.2 FROM Examination)	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN UA <= 6.5 THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN U_PRO > 0 AND U_PRO < 30 THEN 1 ELSE 0 END) FROM Examination WHERE Diagnosis IN(SELECT Diagnosis FROM Patient WHERE `U-PRO` > 0 AND `U-PRO` < 30) AND UA <= 6.5	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN Diagnosis = 'BEHCET' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Examination WHERE `Examination Date` LIKE '1981%' AND ID IN (SELECT ID FROM Patient WHERE SEX = 'M')	thrombosis_prediction
SELECT Patient.ID FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Admission = '-' AND Examination.Date LIKE '1991-10%' AND T_BIL < 2.0	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND BIRTHDAY BETWEEN '1980-01-01' AND '1989-12-31' AND ID NOT IN (SELECT ID FROM Examination WHERE ANA_Pattern = 'P')	thrombosis_prediction
SELECT T1.Sex FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'PSS' AND T2.CRP > 2 AND T2.CRE = 1 AND T2.LDH = 123	thrombosis_prediction
SELECT AVG(Examination.ALB)  FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  WHERE Patient.SEX = 'F' AND Examination.PLT > 400 AND Examination.Diagnosis = 'SLE'	thrombosis_prediction
SELECT Symptoms FROM Examination WHERE Diagnosis = 'SLE' GROUP BY Symptoms ORDER BY COUNT(*) DESC LIMIT 1	thrombosis_prediction
SELECT T1.Examination_Date, T2.Diagnosis FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.ID = 48473 ORDER BY T1.Examination_Date ASC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND EXISTS(SELECT * FROM Examination WHERE Patient.ID = Examination.ID AND Diagnosis LIKE '%APS%')	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE YEAR(Examination_Date) = '1997' AND (DNA_II < 8 OR ANA NOT BETWEEN 6 AND 8.5)	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T2.Symptoms = 'thrombocytopenia' THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T2.Diagnosis LIKE '%SLE%' THEN 1 ELSE 0 END) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Thrombosis > 0	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN P.SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(P.SEX) FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE YEAR(P.BIRTHDAY) = '1980' AND E.Diagnosis = 'RA'	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'M' AND ID IN (SELECT ID FROM Examination WHERE `Examination Date` BETWEEN '1995-01-01' AND '1997-12-31') AND Diagnosis = 'Behcet' AND Admission = '-'	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND WBC < 3.5	thrombosis_prediction
SELECT DATEDIFF(T2.Examination_Date , T1.First_Date) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.ID = 821298	thrombosis_prediction
SELECT T1.UA FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T1.UA > 8.0 OR T1.SEX = 'F' AND T1.UA > 6.5 AND T1.ID = 57266	thrombosis_prediction
SELECT Examination.Examination_Date  FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  WHERE Patient.ID = '48473' AND Examination.DNA_II > 8;  -- Note: The provided SQL is based on the given information but it seems there's a discrepancy in the question and the provided table details. The question asks about AST (GOT) index, which isn't mentioned in the provided schema. However, I assumed that 'DNA-II' column might be related to this as per the given normal range condition. Please adjust the query based on your actual database schema. SELECT Examination.Examination_Date  FROM Examination  WHERE ID = 48473 AND DNA_II >= 60;	thrombosis_prediction
SELECT T1.PatientID, T1.Sex, T1.DateOfBirth FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.GOT < 60 AND YEAR(T2.ExaminationDate) = 1994;	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.GPT >= 60	thrombosis_prediction
SELECT T2.Diagnosis FROM Laboratory AS T1 JOIN Examination AS T2 ON T1.Patient_ID = T2.ID WHERE T1.GPT > 60 ORDER BY T2.Birth_Date DESC	thrombosis_prediction
SELECT AVG(LDH) FROM Patient WHERE LDH < 500;	thrombosis_prediction
SELECT Patient.ID, (YEAR(CURRENT_TIMESTAMP) - YEAR(Patient.Birthday)) AS Age FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.LDH BETWEEN 600 AND 800;	thrombosis_prediction
SELECT T2.ADMISSION FROM `Examination` AS T1 JOIN `Patient` AS T2 ON T1.ID = T2.ID WHERE T1.ALKALINE_PHOSPHATASE < 300 AND T2.ADMISSION = '+' UNION SELECT T2.ADMISSION FROM `Examination` AS T1 JOIN `Patient` AS T2 ON T1.ID = T2.ID WHERE T1.ALKALINE_PHOSPHATASE < 300 AND T2.ADMISSION = '-'	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Birth_Date = '1982-04-01' AND T2.ALP < 300	thrombosis_prediction
SELECT T1.ID, T1.Sex, T1.Date_of_Birth FROM Patient AS T1 JOIN LabTest AS T2 ON T1.ID = T2.Patient WHERE T2.Lab_Test_Name = 'TP' AND T2.Lab_Test_Value < 6.0	thrombosis_prediction
SELECT SUBTRACT(TP, 8.5) AS Deviation  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE SEX = 'F' AND TP > 8.5	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE (T1.SEX = 'M' AND (T1.ALB <= 3.5 OR T1.ALB >= 5.5)) ORDER BY T1.BIRTHDAY DESC	thrombosis_prediction
SELECT T1.ID, CASE WHEN T2.ALB BETWEEN 3.5 AND 5.5 THEN 'Yes' ELSE 'No' END AS Albumin_Normal_Range FROM Patient AS T1 JOIN LabTest AS T2 ON T1.ID = T2.Patient_ID WHERE YEAR(T1.Birthday) = 1982	thrombosis_prediction
SELECT COUNT(*) * 100 / (SELECT COUNT(*) FROM Patient WHERE Sex = 'F')  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE (SEX = 'F' AND `Uric Acid` > 6.5)	thrombosis_prediction
SELECT AVG(lab.UA)  FROM lab  JOIN examination ON lab.ID = examination.ID  WHERE (lab.SEX = 'M' AND lab.UA < 8.0) OR (lab.SEX = 'F' AND lab.UA < 6.5)  GROUP BY lab.ID  ORDER BY lab.Examination_Date DESC;	thrombosis_prediction
SELECT T1.ID, T1.Sex, T1.Birthday FROM Patient AS T1 JOIN Lab AS T2 ON T1.ID = T2.Patient WHERE T2.LabTestName = 'UN' AND T2.LabResultValue = 29	thrombosis_prediction
SELECT T1.ID, T1.Sex, T1.Birthday FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'RA' AND T1.UN < 30	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE Sex = 'M' AND Creatinine >= 1.5	thrombosis_prediction
SELECT SUM(CASE WHEN Patient.Sex = 'M' THEN 1 ELSE 0 END) > SUM(CASE WHEN Patient.Sex = 'F' THEN 1 ELSE 0 END) FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.CRE >= 1.5;	thrombosis_prediction
SELECT T1.ID ,  T1.Sex ,  T1.Birthday FROM Patient AS T1 INNER JOIN Lab AS T2 ON T1.ID = T2.Patient WHERE T2.LabTestName = 'T-BIL' ORDER BY T2.LabResult DESC LIMIT 1	thrombosis_prediction
SELECT GROUP_CONCAT(DISTINCT P.ID), P.Sex  FROM Patient AS P  JOIN Examination AS E ON P.ID = E.ID  WHERE E.T_BIL >= 2.0  GROUP BY P.Sex;	thrombosis_prediction
SELECT Patient.ID, Examination.T_CHO FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.T_CHO = (SELECT MAX(T_CHO) FROM Examination) AND Patient.birthday = (SELECT MIN(birthday) FROM Patient WHERE ID IN (SELECT ID FROM Examination WHERE T_CHO = (SELECT MAX(T_CHO) FROM Examination)));	thrombosis_prediction
SELECT AVG(DATEDIFF(CURDATE(), birthday) / 365) FROM Patient WHERE sex = 'M' AND T_CHO >= 250;	thrombosis_prediction
SELECT T2.ID, T2.Diagnosis FROM BloodTest AS T1 JOIN Examination AS T2 ON T1.Patient_ID = T2.ID WHERE T1.TG > 300;	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.TG >= 200 AND EXTRACT(YEAR FROM CURRENT_TIMESTAMP) - EXTRACT(YEAR FROM T1.Birthday) > 50	thrombosis_prediction
SELECT DISTINCT T1.ID FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Adm = '-' AND T2.CPK < 250	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Sex = 'M' AND YEAR(T1.Birthday) BETWEEN 1936 AND 1956 AND T2.CPK >= 250;	thrombosis_prediction
SELECT T1.ID, T1.Sex, (YEAR(CURDATE()) - YEAR(T1.Birthday)) AS Age FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.GLU >= 180 AND T2.T_CHO < 250	thrombosis_prediction
SELECT T2.ID FROM `Examination` AS T1 JOIN `Patient` AS T2 ON T1.ID = T2.ID WHERE T1.GLU < 180 AND YEAR(T2.Description) = 1991 GROUP BY T2.ID	thrombosis_prediction
SELECT T1.ID ,  T1.Sex ,  T1.Birthday FROM Patient AS T1 JOIN BloodTest AS T2 ON T1.ID = T2.Patient WHERE T2.WBC <= 3.5 OR T2.WBC >= 9.0 ORDER BY (YEAR(CURDATE()) - YEAR(T1.Birthday)) * 100 + MONTH(T1.Birthday) ASC GROUP BY T1.Sex	thrombosis_prediction
SELECT T1.ID, YEAR(CURRENT_TIMESTAMP) - YEAR(T1.Birthday) AS Age FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.RBC < 3.5 GROUP BY T1.Diagnosis, T1.ID, Age	thrombosis_prediction
SELECT T2.Admittance FROM Patient AS T1 JOIN Admission AS T2 ON T1.ID = T2.Patient WHERE T1.Sex = 'F' AND (YEAR(CURDATE()) - YEAR(T1.Birthday)) >= 50 AND (T1.RBC <= 3.5 OR T1.RBC >= 6.0)	thrombosis_prediction
SELECT T2.ID, T2.Sex FROM lab WHERE T2.HBG < 10 AND T1.Admisson = '-' GROUP BY T2.ID, T2.Sex	thrombosis_prediction
SELECT T1.ID, T1.Sex FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'SLE' AND T2.HGB > 10 AND T2.HGB < 17 ORDER BY T1.Birthday ASC LIMIT 1	thrombosis_prediction
SELECT T1.ID ,  (YEAR(CURDATE()) - YEAR(T1.Birthday)) AS age FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.HCT >= 52 GROUP BY T1.ID HAVING COUNT(*) >= 2	thrombosis_prediction
SELECT AVG(HCT) FROM Examination WHERE Date LIKE '1991%' AND HCT < 29;	thrombosis_prediction
SELECT      (SELECT COUNT(*) FROM Examination WHERE aCL_IgG < 8 AND PLT < 100) -      (SELECT COUNT(*) FROM Examination WHERE aCL_IgG < 8 AND PLT > 400) AS difference_in_counts FROM dual;	thrombosis_prediction
SELECT P.ID FROM Patient AS P JOIN Examination AS E ON P.ID = E.ID WHERE YEAR(E.Date) = '1984' AND SUBTRACT(year(current_timestamp), year(P.Birthday)) < 50 AND P.PLT BETWEEN 100 AND 400	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T2.SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.SEX) FROM `Examination` AS T1 JOIN `Patient` AS T2 ON T1.ID = T2.ID WHERE SUBTRACT(year(current_timestamp), year(T2.Birthday)) > 55 AND T1.KCT != 'None' AND T1.RVVT != 'None' AND T1.LAC != 'None'	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.KCT = '-' AND YEAR(T1.First Date) > 1992 AND T2.RVVT = '-' AND T2.LAC = '-'	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE Examination.Date > '1997-01-01' AND RVVT = '+' AND KCT = '+' AND LAC = '+'	thrombosis_prediction
SELECT COUNT(DISTINCT ID)  FROM Examination  WHERE RVVT = '-' AND LAC = '-' AND KCT = '-' AND Thrombosis = 0	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Sex = 'M' AND T2.WBC > 3.5 AND T2.WBC < 9.0 AND (T2.FG <= 150 OR T2.FG >= 450)	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Birthday > '1980-01-01' AND (T2.FG < 150 OR T2.FG > 450)	thrombosis_prediction
SELECT T2.Diagnosis FROM LabTest AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.LabItem = 'U-PRO' AND CAST(REPLACE(T1.LabResult, ',', '') AS REAL) >= 30	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.U_PRO BETWEEN 0 AND 30 AND T2.Diagnosis = 'SLE'	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.IgG >= 2000	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE aCL_IgG * 1000 BETWEEN 900 AND 2000 AND Symptoms IS NOT NULL	thrombosis_prediction
SELECT T2.Diagnosis FROM AutoimmuneDisease AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.IgA BETWEEN 80 AND 500 ORDER BY T1.IgA DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE ID IN (SELECT ID FROM Examination WHERE aCL_IgA > 80 AND aCL_IgA < 500) AND YEAR(`First Date`) >= 1990;	thrombosis_prediction
SELECT T2.Diagnosis FROM `Sample` AS T1 JOIN `Examination` AS T2 ON T1.ID = T2.ID WHERE T1.IgM <= 40 OR T1.IgM >= 400 GROUP BY T2.Diagnosis ORDER BY COUNT(T2.Diagnosis) DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE CRP = '+' AND Description IS NULL	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE ID IN (SELECT ID FROM Examination WHERE aCL_IgG > 1.5 OR aCL_IgM > 1.5 OR ANA > 256 OR aCL_IgA > 0) AND YEAR(CURDATE()) - YEAR(Birthday) < 70	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.KCT = '+' AND T1.RA IN ('-', '+-')	thrombosis_prediction
SELECT T2.Diagnosis FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Birthday >= '1985-01-01' AND T2.RA IN ('-', '+-')	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 JOIN LabTest AS T2 ON T1.ID = T2.Patient WHERE T2.LabTestName = 'RF' AND T2.Value < 20 AND YEAR(CURDATE()) - YEAR(T1.Birthday) > 60;	thrombosis_prediction
SELECT COUNT(*) FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Patient.RF < 20 AND Examination.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.C3 > 35 AND T2.ANA_Pattern = 'P'	thrombosis_prediction
SELECT T1.ID FROM `Examination` AS T1 JOIN `LabTest` AS T2 ON T1.ID = T2.Patient WHERE T2.LabTestName = 'Hematoclit' AND (T2.Result < 29 OR T2.Result > 52) ORDER BY T1.`aCL IgA` DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Thrombosis > 0 AND T1.C4 > 10	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.RNP IN ('-', '0') AND T1.Admission = '+'	thrombosis_prediction
SELECT T1.Birthday FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.RNP NOT IN('-','+-') ORDER BY T1.Birthday DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE SM IN ('-', '+-') AND Thrombosis = 0;	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.SM NOT IN ('negative', '0') ORDER BY T1.Birthday DESC LIMIT 3	thrombosis_prediction
SELECT T1.ID FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1."Examination Date" > '1997-01-01' AND T2.SC170 IN('negative','0')	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Sex = 'F' AND T2.DNA_II < 8 AND T2.Symptoms IS NULL	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.SSA IN('-','+-') AND YEAR(T2.Examination_Date) < 2000	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 JOIN AutoimmuneDiseaseTest AS T2 ON T1.ID = T2.Patient WHERE T2.SSA NOT IN ('negative', '0') ORDER BY T1.`First Date` ASC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.SSB IN ('-', '0') AND T2.Diagnosis = 'SLE'	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.SSB IN ('negative', '0') AND T1.Symptoms IS NOT NULL	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Sex = 'M' AND T2.CENTROMERE IN('-', '+-') AND T2.SSB IN('-', '+-')	thrombosis_prediction
SELECT T2.Diagnosis FROM LabTest AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.LabTestName = 'DNA-II' AND T1.Value >= 8	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.DNA_II < 8 AND T1.Description IS NULL	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE IGG > 900 AND IGG < 2000 AND Admission = '+'	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T2.GOT >= 60 AND T1.Diagnosis = 'SLE' THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T2.GOT >= 60 THEN 1 ELSE 0 END) FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.Patient_ID WHERE T2.LabTestName = 'glutamic oxaloacetic transaminase'	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE Sex = 'M' AND GOT < 60;	thrombosis_prediction
SELECT T2.Birth_Date FROM `Examination` AS T1 JOIN `Patient` AS T2 ON T1.ID = T2.ID WHERE T1.GOT >= 60 ORDER BY T2.Birth_Date DESC LIMIT 1	thrombosis_prediction
SELECT T1.Birthday FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.GPT < 60 ORDER BY T2.GPT DESC LIMIT 3	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE Sex = 'M' AND ID IN (SELECT ID FROM LabTest WHERE `Lab Test Name` = 'GOT' AND Value < 60)	thrombosis_prediction
SELECT Examination_Date FROM Examination WHERE LDH = (SELECT MAX(LDH) FROM Examination WHERE LDH < 500) ORDER BY Examination_Date ASC LIMIT 1;	thrombosis_prediction
SELECT T2.Examination_Date FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.LDH >= 500 ORDER BY T2.Examination_Date DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE ID IN (SELECT ID FROM LabTest WHERE Column='ALP' AND Value>=300) AND Admission='+'	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE Admission = '-' AND ALP < 300;	thrombosis_prediction
SELECT T2.Diagnosis FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.TP < 6.0;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE ID IN (SELECT ID FROM Examination WHERE Diagnosis = 'SJS') AND TP > 6.0 AND TP < 8.5;	thrombosis_prediction
SELECT T2.Examination_Date FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.ALB BETWEEN 3.5 AND 5.5 ORDER BY T1.ALB DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE Sex = 'M' AND ALB BETWEEN 3.5 AND 5.5 AND TP BETWEEN 6.0 AND 8.5	thrombosis_prediction
SELECT MAX(E.aCL_IgG), MAX(E.aCL_IgM), MAX(E.aCL_IgA) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE P.Sex = 'F' AND UA < 6.50 GROUP BY E.ID ORDER BY UA DESC LIMIT 1	thrombosis_prediction
SELECT MAX(T2.ANA) FROM LabTest AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.CRE < 1.5	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.CRE < 1.5 ORDER BY T2.aCL_IgA DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE T_BIL >= 2.0 AND ANA_Pattern LIKE '%P%'	thrombosis_prediction
SELECT T1.ANA FROM `Examination` AS T1 JOIN `LabTest` AS T2 ON T1.ID = T2.Patient_ID WHERE T2.`T-BIL` < 2.0 ORDER BY T2.`T-BIL` DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE T_CHO >= 250 AND KCT = '-'	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory WHERE T_CHO < 250 AND ANA_Pattern = 'P'	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE TG < 200 AND Symptoms IS NOT NULL	thrombosis_prediction
SELECT T1.Diagnosis FROM Examination AS T1 JOIN LabTest AS T2 ON T1.ID = T2.Patient WHERE T2.LTName = 'TG' AND T2.Value < 200 ORDER BY T2.Value DESC LIMIT 1	thrombosis_prediction
SELECT T1.ID FROM Examination AS T1 JOIN LabTest AS T2 ON T1.ID = T2.Patient WHERE T1.Thrombosis = 0 AND T2.CPK < 250	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE (KCT = '+' OR RVVT = '+' OR LAC = '+') AND ANA < 8;	thrombosis_prediction
SELECT T2.Birthday FROM `Examination` AS T1 JOIN `Patient` AS T2 ON T1.ID = T2.ID WHERE T1.GLU > 180 ORDER BY T2.Birthday ASC LIMIT 1	thrombosis_prediction
SELECT COUNT(*) FROM BloodExamination AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.GLU < 180 AND T2.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE Admission = '+' AND WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE ID IN (SELECT ID FROM Examination WHERE Diagnosis = 'SLE') AND WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE (T1.RBC <= 3.5 OR T1.RBC >= 6.0) AND T1.Admission = '-'	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE PLT > 100 AND PLT < 400 AND EXISTS (SELECT * FROM Examination WHERE Patient.ID = Examination.ID AND Diagnosis IS NOT NULL)	thrombosis_prediction
SELECT T2.PLT FROM Examination AS T1 JOIN BloodTest AS T2 ON T1.ID = T2.Patient WHERE T1.Diagnosis = 'MCTD' AND T2.PLT > 100 AND T2.PLT < 400	thrombosis_prediction
SELECT AVG(PT) FROM Examination WHERE Sex = 'M' AND PT < 14	thrombosis_prediction
SELECT COUNT(*) FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Patient.PT < 14 AND (Examination.Thrombosis = 2 OR Examination.Thrombosis = 1)	thrombosis_prediction
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.major = T2.major_code WHERE T1.first_name = 'Angela' AND T1.last_name = 'Sanders'	student_club
SELECT COUNT(*) FROM student_club WHERE major = 'Engineering' AND college = 'College of Engineering'	student_club
SELECT T1.first_name, T1.last_name FROM student AS T1 JOIN member_of_club AS T2 ON T1.stuid = T2.stuid JOIN club AS T3 ON T2.clubid = T3.clubid WHERE T1.dept_name = 'Art and Design' AND T3.club_name = 'Student_Club'	student_club
SELECT COUNT(*) FROM student_club JOIN attendance USING (student_id) WHERE event_name = 'Women\'s Soccer' AND status = 'Closed'	student_club
SELECT T1.phone FROM student AS T1 JOIN attendance AS T2 ON T1.stuid = T2.stuid JOIN event AS T3 ON T3.event_id = T2.event_id WHERE T3.event_name = 'Women\'s Soccer'	student_club
SELECT COUNT(*) FROM Student_Club JOIN attendance USING (student_id) WHERE event_name = 'Women''s Soccer' AND t_shirt_size = 'Medium'	student_club
SELECT T3.event_name FROM Student AS T1 JOIN student_club AS T2 ON T1.student_id = T2.student_id JOIN club_event AS T3 ON T2.club_id = T3.club_id GROUP BY T3.link_to_event ORDER BY COUNT(T3.link_to_event) DESC LIMIT 1	student_club
SELECT T1.college FROM student AS T1 JOIN member_of_club AS T2 ON T1.stuid = T2.stuid WHERE T2.position = 'Vice President' GROUP BY T1.college ORDER BY COUNT(*) DESC LIMIT 1	student_club
SELECT T3.event_name FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.member_id JOIN event AS T3 ON T2.event_id = T3.event_id WHERE T1.first_name = 'Maya' AND T1.last_name = 'Mclean'	student_club
SELECT COUNT(*) FROM event JOIN member_attendance ON event.event_id = member_attendance.event_id WHERE event.event_name IN (SELECT student_club_event.event_name FROM student_club_event WHERE student_club_event.club_code IN (SELECT club.club_code FROM club WHERE club.club_name = 'Student_Club')) AND member_attendance.member_email = 'Sacha.Harrison@students.university.edu' AND YEAR(event.event_date) = 2019	student_club
SELECT COUNT(*) FROM ( SELECT T1.event_id FROM Event AS T1 JOIN Student_Club AS T2 ON T1.club_id = T2.club_id WHERE T1.type = 'Meeting' GROUP BY T1.event_id HAVING COUNT(T1.event_id) > 10 ) AS T3	student_club
SELECT T1.event_name FROM events AS T1 JOIN student_events AS T2 ON T1.event_id = T2.event_id WHERE T1.type != 'Fundraiser' GROUP BY T1.event_id HAVING COUNT(T1.event_id) > 20	student_club
SELECT AVG(T1.attendance) FROM events AS T1 WHERE T1.type = 'Meeting' AND YEAR(T1.event_date) = 2020	student_club
SELECT T1.expense_description FROM expenses AS T1 JOIN club_expenses AS T2 ON T1.record_id = T2.expense_record_id ORDER BY T1.cost DESC LIMIT 1	student_club
SELECT COUNT(*) FROM student WHERE major = 'Environmental Engineering' AND student_id IN (SELECT member_id FROM Student_Club)	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.member_id JOIN event AS T3 ON T2.event_id = T3.event_id WHERE T3.event_name = 'Laugh Out Loud'	student_club
SELECT T2.lastname FROM student AS T1 JOIN people AS T2 ON T1.student_id = T2.record_id WHERE T1.major = 'Law and Constitutional Studies'	student_club
SELECT T2.county FROM member AS T1 JOIN zip_code AS T2 ON T1.zip_code = T2.zip_code WHERE T1.first_name = 'Sherri' AND T1.last_name = 'Ramsey'	student_club
SELECT T3.name FROM student AS T1 JOIN takes AS T2 ON T1.id = T2.student JOIN college AS T3 ON T3.cName = T1.college WHERE T1.name = 'Tyler Hewitt' AND T2.major = (SELECT major FROM student WHERE name = 'Tyler Hewitt')	student_club
SELECT SUM(T2.amount) FROM student_club AS T1 JOIN transaction AS T2 ON T1.club_id = T2.club_id WHERE T1.position = 'Vice President'	student_club
SELECT SUM(T1.amount) FROM expenses AS T1 JOIN events AS T2 ON T1.event_id = T2.id WHERE T2.event_name = 'September Meeting' AND T1.category = 'Food'	student_club
SELECT T3.city, T3.state FROM student AS T1 JOIN member_of_club AS T2 ON T1.stuid = T2.stuid JOIN zip_code AS T3 ON T1.hometown_zip = T3.zip_code WHERE T2.position = 'President' GROUP BY T3.city, T3.state	student_club
SELECT T1.first_name, T1.last_name FROM student_club AS T1 JOIN person AS T2 ON T1.person_id = T2.record_id WHERE T2.state = 'IL' AND T1.member_type = 'member'	student_club
SELECT SUM(T1.amount) FROM expenses AS T1 JOIN events AS T2 ON T1.event_id = T2.id WHERE T2.event_name = 'September Meeting' AND T1.category = 'Advertisement'	student_club
SELECT T4.department_name FROM student AS T1 JOIN takes AS T2 ON T1.stu_num = T2.stu_num JOIN course AS T3 ON T2.course_id = T3.course_id JOIN department AS T4 ON T3.dept_code = T4.dept_code WHERE T1.stu_fname = 'Pierce' AND T1.stu_lname = 'Guidi'	student_club
SELECT SUM(T1.amount) FROM expenses AS T1 JOIN events AS T2 ON T1.event_id = T2.id WHERE T2.event_name = 'October Speaker'	student_club
SELECT T2.approved FROM events AS T1 JOIN expenses AS T2 ON T1.event_id = T2.event_id WHERE T1.event_name = 'October Meeting' AND T1.event_date = '2019-10-08T00:00:00'	student_club
SELECT AVG(T1.amount) FROM expenses AS T1 JOIN members AS T2 ON T1.member_id = T2.id WHERE T2.first_name = 'Elijah' AND T2.last_name = 'Allen' AND (strftime('%m', T1.expense_date) = '09' OR strftime('%m', T1.expense_date) = '10')	student_club
SELECT SUM(IIF(SUBSTR(T1.event_date, 1, 4) = '2019', T3.amount_spent, 0)) - SUM(IIF(SUBSTR(T1.event_date, 1, 4) = '2020', T3.amount_spent, 0)) FROM event AS T1 JOIN student_club AS T2 ON T1.club_id = T2.club_id JOIN finance AS T3 ON T1.event_id = T3.event_id WHERE T2.club_name = 'Student_Club'	student_club
SELECT T1.location FROM events AS T1 WHERE T1.event_name = "Spring Budget Review"	student_club
SELECT T1.cost FROM expenses AS T1 JOIN events AS T2 ON T1.event_id = T2.id WHERE T2.event_name = 'Posters' AND T2.event_date = '2019-09-04'	student_club
SELECT T1.remaining FROM `budget` AS T1 JOIN `category` AS T2 ON T1.category_id  =  T2.category_id WHERE T2.category_name  =  "Food" AND T1.amount  =  (SELECT MAX(T1.amount) FROM `budget` AS T1 JOIN `category` AS T2 ON T1.category_id  =  T2.category_id WHERE T2.category_name  =  "Food")	student_club
SELECT T1.notes FROM event AS T1 JOIN donation AS T2 ON T1.event_id = T2.event_id WHERE T2.source = 'Fundraising' AND T2.date_received = '2019-09-14'	student_club
SELECT COUNT(DISTINCT T2.major) FROM college AS T1 JOIN student AS T2 ON T1.college_id = T2.college_id WHERE T1.name = 'College of Humanities and Social Sciences'	student_club
SELECT T1.phone_number FROM member AS T1 JOIN person AS T2 ON T1.person = T2.rec_id WHERE T2.first_name = 'Carlo' AND T2.last_name = 'Jacobs'	student_club
SELECT T2.county FROM member AS T1 JOIN zip_code AS T2 ON T1.hometown_zip = T2.zip_code WHERE T1.first_name = 'Adela' AND T1.last_name = 'O'Gallagher'	student_club
SELECT COUNT(*) FROM budget WHERE event_name = 'November Meeting' AND remaining < 0	student_club
SELECT SUM(T1.amount) FROM budget AS T1 JOIN events AS T2 ON T1.event_id = T2.id WHERE T2.event_name = 'September Speaker'	student_club
SELECT T1.status FROM events AS T1 JOIN expenses AS T2 ON T1.event_id = T2.event_id WHERE T2.expense_description = 'Post Cards, Posters' AND T2.expense_date = '2019-8-20'	student_club
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.major = T2.major_code WHERE T1.first_name = 'Brent' AND T1.last_name = 'Thomason'	student_club
SELECT COUNT(*) FROM club_member WHERE major = 'Business' AND t_shirt_size = 'Medium'	student_club
SELECT T2.type FROM member AS T1 JOIN zip_code AS T2 ON T1.zip_code = T2.zip_code WHERE T1.first_name = 'Christof' AND T1.last_name = 'Nielson'	student_club
SELECT T1.major_name FROM student AS T1 JOIN member_of_club AS T2 ON T1.stu_num = T2.stu_num WHERE T2.position = 'Vice President' GROUP BY T1.major_name HAVING COUNT(*) = 1	student_club
SELECT T2.state FROM member AS T1 JOIN zip_code AS T2 ON T1.hometown_zip = T2.zip_code WHERE T1.first_name = 'Sacha' AND T1.last_name = 'Harrison'	student_club
SELECT T3.department FROM student AS T1 JOIN member_of_club AS T2 ON T1.stuid = T2.stuid JOIN club AS T3 ON T2.clubid = T3.clubid WHERE T1.position = 'President' GROUP BY T3.department	student_club
SELECT T2.date_received FROM member AS T1 JOIN transaction AS T2 ON T1.member_id = T2.payer WHERE T1.first_name = 'Connor' AND T1.last_name = 'Hilton' AND T2.source = 'Dues'	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN transaction AS T2 ON T1.member_id = T2.member_id WHERE T2.source = 'Dues' ORDER BY T2.received_date ASC LIMIT 1;	student_club
SELECT COUNT(*) FROM ( SELECT * FROM budget WHERE category = 'Advertisement' AND event_name = 'Yearly Kickoff' ) AS T1 JOIN ( SELECT * FROM budget WHERE category = 'Advertisement' AND event_name = 'October Meeting' ) AS T2 ON T1.event_id = T2.event_id WHERE T1.amount > T2.amount	student_club
SELECT (SUM(CASE WHEN T2.category = 'Parking' THEN T1.amount ELSE 0 END) / SUM(T1.amount)) * 100 FROM expenses AS T1 JOIN category AS T2 ON T1.category_id = T2.id JOIN events AS T3 ON T1.event_id = T3.id WHERE T3.event_name = 'November Speaker'	student_club
SELECT SUM(T2.cost) FROM event AS T1 JOIN expense AS T2 ON T1.event_id = T2.event_id WHERE T2.expense_description = 'Pizza'	student_club
SELECT COUNT(*) FROM zip_code WHERE county = 'Orange County' AND state = 'Virginia'	student_club
SELECT department_name FROM department WHERE college = 'College of Humanities and Social Sciences' GROUP BY department_name ORDER BY department_name ASC	student_club
SELECT T3.city, T3.county, T3.state FROM member AS T1 JOIN membership AS T2 ON T1.member_id = T2.member_id JOIN zip_code AS T3 ON T2.zip_code = T3.zip_code WHERE T1.first_name = 'Amy' AND T1.last_name = 'Firth'	student_club
SELECT T1.expense_description FROM budget AS T1 JOIN ( SELECT MIN(remaining) AS min_remaining FROM budget ) AS T2 WHERE T1.remaining = T2.min_remaining	student_club
SELECT T1.member_name FROM member AS T1 JOIN attendance AS T2 ON T1.rec_id = T2.member_rec_id JOIN event AS T3 ON T3.rec_id = T2.event_rec_id WHERE T3.event_name = 'October Meeting'	student_club
SELECT T2.college FROM member AS T1 JOIN major AS T2 ON T1.major = T2.id GROUP BY T2.college ORDER BY COUNT(*) DESC LIMIT 1	student_club
SELECT T2.major_name FROM person AS T1 JOIN student AS T2 ON T1.student_id = T2.student_id WHERE T1.phone_number = '809-555-3360'	student_club
SELECT T1.event_name FROM events AS T1 JOIN expenses AS T2 ON T1.record_id = T2.event_record_id GROUP BY T1.event_name ORDER BY SUM(T2.amount) DESC LIMIT 1	student_club
SELECT T3.expense_description FROM member AS T1 JOIN club AS T2 ON T1.club_id = T2.club_id JOIN expense AS T3 ON T3.club_id = T2.club_id WHERE T1.position = 'Vice President' AND T1.member_id = T3.member_id	student_club
SELECT COUNT(*) FROM events WHERE event_name = 'Women''s Soccer' AND status = 'Closed'	student_club
SELECT T1.date_received FROM income AS T1 JOIN members AS T2 ON T1.member_id = T2.member_id WHERE T2.first_name = 'Casey' AND T2.last_name = 'Mason'	student_club
SELECT COUNT(*) FROM member WHERE hometown IN (SELECT zip_code FROM zip_code WHERE state = 'Maryland')	student_club
SELECT COUNT(*) FROM event JOIN attendance ON event.event_id = attendance.event_id WHERE attendance.member_phone = '954-555-6240' AND event.status = 'Closed'	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN department_member AS T2 ON T1.member_id = T2.member_id JOIN department AS T3 ON T2.department_id = T3.department_id WHERE T3.name = 'School of Applied Sciences, Technology and Education'	student_club
SELECT T1.event_name FROM `event` AS T1 JOIN `budget` AS T2 ON T1.id = T2.event_id WHERE T1.status = 'Closed' ORDER BY (T2.spent / T2.amount) DESC LIMIT 1;	student_club
SELECT COUNT(*) FROM student WHERE position = 'President'	student_club
SELECT MAX(T2.spent) FROM events AS T1 JOIN budget AS T2 ON T1.event_id = T2.event_id	student_club
SELECT COUNT(*) FROM event WHERE type = 'Meeting' AND strftime('%Y', event_date) = '2020'	student_club
SELECT SUM(T1.spent) FROM expense AS T1 JOIN category AS T2 ON T1.category_id = T2.id WHERE T2.category = 'Food'	student_club
SELECT T1.first_name, T1.last_name FROM student AS T1 JOIN attendance AS T2 ON T1.student_id = T2.student_id GROUP BY T1.student_id HAVING COUNT(T2.link_to_event) > 7	student_club
SELECT T1.first_name, T1.last_name FROM student AS T1 JOIN attendance AS T2 ON T1.student_id = T2.student_id JOIN event AS T3 ON T2.event_id = T3.event_id WHERE T3.event_name = 'Community Theater' AND T1.major_name = 'Interior Design'	student_club
SELECT T1.first_name, T1.last_name FROM student AS T1 JOIN zip_code AS T2 ON T1.zip_code = T2.zip_code WHERE T2.city = 'Georgetown' AND T2.state = 'South Carolina'	student_club
SELECT SUM(income.amount) FROM income WHERE income.member_id = (SELECT member.id FROM member WHERE member.first_name = 'Grant' AND member.last_name = 'Gilmour')	student_club
SELECT T1.first_name, T1.last_name FROM student AS T1 JOIN income AS T2 ON T1.student_id = T2.student_id WHERE T2.amount > 40	student_club
SELECT SUM(T2.cost) FROM events AS T1 JOIN expenses AS T2 ON T1.event_id = T2.event_id WHERE T1.event_name = 'Yearly Kickoff'	student_club
SELECT T1.first_name, T1.last_name FROM student AS T1 JOIN manages_budget AS T2 ON T1.student_id = T2.student_id JOIN event AS T3 ON T3.event_id = T2.event_id WHERE T3.event_name = 'Yearly Kickoff'	student_club
SELECT T1.first_name, T1.last_name, T3.source FROM student AS T1 JOIN income AS T2 ON T1.student_id = T2.student_id JOIN source AS T3 ON T2.source_code = T3.source_code WHERE T2.amount = (SELECT MAX(amount) FROM income)	student_club
SELECT T1.event_name FROM events AS T1 JOIN costs AS T2 ON T1.id = T2.event_id ORDER BY T2.cost ASC LIMIT 1	student_club
SELECT (SUM(CASE WHEN T2.event_name = 'Yearly Kickoff' THEN T1.cost ELSE 0 END) / SUM(T1.cost)) * 100 FROM event_cost AS T1 JOIN events AS T2 ON T1.event_id = T2.id GROUP BY T2.event_name	student_club
SELECT CAST(COUNT(CASE WHEN T2.major_name = 'Finance' THEN 1 ELSE NULL END) AS REAL) / COUNT(CASE WHEN T2.major_name = 'Physics' THEN 1 ELSE NULL END) FROM student AS T1 JOIN major AS T2 ON T1.major_id = T2.major_id	student_club
SELECT source FROM transactions WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' ORDER BY amount DESC LIMIT 1	student_club
SELECT T1.first_name, T1.last_name, T1.email FROM member AS T1 JOIN student_club AS T2 ON T1.stu_num = T2.officer WHERE T2.position = 'Secretary'	student_club
SELECT COUNT(*) FROM student_club AS T1 JOIN member_of_club AS T2 ON T1.clubid = T2.clubid JOIN student AS T3 ON T2.stuid = T3.stuid WHERE T3.major = 'Physics Teaching'	student_club
SELECT COUNT(*) FROM member_attendance WHERE event_id IN (SELECT id FROM events WHERE event_name = 'Community Theater' AND YEAR(event_date) = 2019)	student_club
SELECT COUNT(*), T3.major_name FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.attended JOIN major AS T3 ON T1.major_code = T3.major_code WHERE T1.first_name = 'Luisa' AND T1.last_name = 'Guidi' GROUP BY T3.major_name;	student_club
SELECT AVG(T1.amount) AS average_spending FROM transactions AS T1 JOIN club_event AS T2 ON T1.event_id = T2.rec2N69DMcrqN9PJC WHERE T1.category = 'Food' AND T2.status = 'Closed'	student_club
SELECT T1.event_name FROM events AS T1 JOIN expenses AS T2 ON T1.id = T2.event_id WHERE T2.category = 'Advertisement' ORDER BY T2.spent DESC LIMIT 1	student_club
SELECT COUNT(*) FROM attendance WHERE member_id IN (SELECT id FROM members WHERE first_name = 'Maya' AND last_name = 'Mclean') AND event_id IN (SELECT id FROM events WHERE event_name = 'Women''s Soccer')	student_club
SELECT SUM(CASE WHEN type = 'Community Service' THEN 1 ELSE 0 END) * 100 / COUNT(event_id) AS percentage  FROM events  WHERE event_date BETWEEN '2019-01-01' AND '2019-12-31';	student_club
SELECT T1.amount FROM expenses AS T1 JOIN events AS T2 ON T1.event_id = T2.id WHERE T1.description = 'Posters' AND T2.event_name = 'September Speaker'	student_club
SELECT t_shirt_size FROM member GROUP BY t_shirt_size ORDER BY COUNT(*) DESC LIMIT 1	student_club
SELECT T1.event_name FROM `event` AS T1 JOIN `budget` AS T2 ON T1.id = T2.event_id WHERE T1.status = 'Closed' AND T2.remaining < 0 ORDER BY T2.remaining ASC LIMIT 1;	student_club
SELECT T2.type, SUM(T2.cost) FROM events AS T1 JOIN expenses AS T2 ON T1.record_id = T2.event_record_id WHERE T1.event_name = 'October Meeting' AND T1.status = 'Closed' GROUP BY T2.type;	student_club
SELECT T2.category, SUM(T2.amount) FROM events AS T1 JOIN budget AS T2 ON T1.event_id = T2.event_id WHERE T1.event_name = 'April Speaker' GROUP BY T2.category ORDER BY SUM(T2.amount) ASC	student_club
SELECT MAX(budgeted) FROM transactions WHERE category = 'Food'	student_club
SELECT T1.category ,  T1.amount FROM Financial_Transactions AS T1 WHERE T1.category  =  'Advertisement' ORDER BY T1.amount DESC LIMIT 3	student_club
SELECT SUM(cost) FROM expenses WHERE expense_description = 'Parking'	student_club
SELECT SUM(cost) FROM expense WHERE expense_date = '2019-08-20'	student_club
SELECT T1.first_name, T1.last_name, SUM(T2.cost) FROM member AS T1 JOIN transaction AS T2 ON T1.member_id = T2.member_id WHERE T1.member_id = 'rec4BLdZHS2Blfp4v' GROUP BY T1.first_name, T1.last_name;	student_club
SELECT T2.expense_description FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.member_id WHERE T1.first_name = 'Sacha' AND T1.last_name = 'Harrison'	student_club
SELECT T2.expense_description FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.member_id WHERE T1.t_shirt_size = 'X-Large'	student_club
SELECT T2.zip_code FROM member AS T1 JOIN address AS T2 ON T1.address_id = T2.address_id WHERE T1.cost < 50	student_club
SELECT T2.major_name FROM student AS T1 JOIN major AS T2 ON T1.major_code = T2.major_code WHERE T1.first_name = 'Phillip' AND T1.last_name = 'Cullen'	student_club
SELECT T2.position FROM member AS T1 JOIN club AS T2 ON T1.club_id = T2.club_id WHERE T1.major = 'Business'	student_club
SELECT COUNT(*) FROM member WHERE major_name = 'Business' AND t_shirt_size = 'Medium'	student_club
SELECT T1.event_name FROM event AS T1 JOIN budget AS T2 ON T1.id = T2.event_id WHERE T2.remaining > 30	student_club
SELECT type FROM event WHERE location = 'MU 215' GROUP BY type	student_club
SELECT type FROM events WHERE event_date = '2020-03-24T12:00:00'	student_club
SELECT T3.major_name FROM student AS T1 JOIN member_of_club AS T2 ON T1.stuid = T2.stuid JOIN major AS T3 ON T1.majors = T3.major_code WHERE T1.position = 'Vice President'	student_club
SELECT (SUM(CASE WHEN T2.major_name = 'Business' THEN 1 ELSE 0 END) / COUNT(T1.member_id)) * 100 FROM member AS T1 JOIN major AS T2 ON T1.major = T2.major_code WHERE T1.position = 'Member'	student_club
SELECT T1.type FROM events AS T1 JOIN zip_code AS T2 ON T1.location = T2.city WHERE T1.location = "MU 215" GROUP BY T1.type	student_club
SELECT COUNT(*) FROM income WHERE amount = 50	student_club
SELECT COUNT(*) FROM member WHERE position = 'Member' AND t_shirt_size = 'X-Large'	student_club
SELECT COUNT(*) FROM major WHERE department = 'School of Applied Sciences, Technology and Education' AND college = 'College of Agriculture and Applied Sciences'	student_club
SELECT T1.last_name ,  T3.department_name ,  T4.college_name FROM member AS T1 JOIN major AS T2 ON T1.major  =  T2.id JOIN department AS T3 ON T3.department_id  =  T2.department_id JOIN college AS T4 ON T4.college_id  =  T3.college_id WHERE T2.major_name  =  'Environmental Engineering'	student_club
SELECT T1.category FROM budget AS T1 JOIN event AS T2 ON T1.event_id = T2.id WHERE T2.location = 'MU 215' AND T2.type = 'Guest Speaker' AND T1.spent = 0	student_club
SELECT T3.city, T3.state FROM member AS T1 JOIN enroll AS T2 ON T1.member_id = T2.member_id JOIN zip_code AS T3 ON T3.zip_code = T1.zip_code WHERE T2.department = 'Electrical and Computer Engineering Department' AND T1.position = 'Member'	student_club
SELECT T1.event_name FROM events AS T1 JOIN members AS T2 ON T1.club_id = T2.club_id WHERE T1.type = 'Social' AND T2.position = 'Vice President' AND T1.location = '900 E. Washington St.'	student_club
SELECT T3.lastname ,  T3.position FROM expenses AS T1 JOIN club_expense AS T2 ON T1.expense_id = T2.expense_id JOIN member AS T3 ON T2.president_id = T3.member_id WHERE T1.expense_description = 'Pizza' AND T1.expense_date = '2019-09-10'	student_club
SELECT T1.last_name FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.member_id JOIN event AS T3 ON T2.event_id = T3.recid WHERE T3.event_name = 'Women''s Soccer' AND T1.position = 'Member'	student_club
SELECT (SELECT COUNT(*) FROM member WHERE t_shirt_size='Medium' AND amount=50) / (SELECT COUNT(*) FROM member WHERE position='Member' AND t_shirt_size='Medium') * 100 AS percentage	student_club
SELECT T2.country FROM zip_code AS T1 JOIN country AS T2 ON T1.state = T2.state_name WHERE T1.type = 'PO Box' GROUP BY T2.country	student_club
SELECT zip_code FROM zip_code WHERE county = "San Juan Municipio" AND state = "Puerto Rico" AND type = "PO Box"	student_club
SELECT T1.event_name FROM events AS T1 JOIN zip_code AS T2 ON T1.location = T2.zip_code WHERE T1.type = 'Game' AND T1.status = 'Closed' AND T1.event_date BETWEEN '2019-03-15T00:00:00' AND '2020-03-20T23:59:59'	student_club
SELECT T1.event_link FROM events AS T1 JOIN members AS T2 ON T1.member_id = T2.member_id WHERE T2.cost > 50	student_club
SELECT T1.member_name, T1.event_link FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.member_id JOIN event AS T3 ON T2.event_id = T3.event_id WHERE T1.approved = 'true' AND T1.expense_date BETWEEN '2019-01-10' AND '2019-11-19'	student_club
SELECT T3.college FROM person AS T1 JOIN student AS T2 ON T1.id = T2.student_id JOIN college AS T3 ON T2.college_code = T3.code WHERE T1.first_name = 'Katy' AND T2.major = 'rec1N0upiVLy5esTO'	student_club
SELECT T2.phone FROM member AS T1 JOIN person AS T2 ON T1.member_id  =  T2.person_id JOIN major AS T3 ON T3.major_id  =  T1.major WHERE T3.college_name  =  'College of Agriculture and Applied Sciences' AND T3.major_name  =  'Business'	student_club
SELECT email FROM expenses WHERE expense_date BETWEEN '2019-09-10' AND '2019-11-19' AND cost > 20	student_club
SELECT COUNT(*) FROM member WHERE major = 'education' AND college = 'College of Education & Human Services'	student_club
SELECT SUM(CASE WHEN T2.remaining < 0 THEN 1 ELSE 0 END) * 100 / COUNT(T1.event_id) FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.event_id WHERE T2.remaining < 0	student_club
SELECT event_id, location, status FROM events WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31'	student_club
SELECT expense_description FROM expenses GROUP BY expense_description HAVING AVG(cost) > 50	student_club
SELECT T1.first_name ,  T1.last_name FROM member AS T1 JOIN member_attendance AS T2 ON T1.member_id = T2.member_id WHERE T1.t_shirt_size = "X-Large"	student_club
SELECT SUM(CASE WHEN type = 'PO Box' THEN 1 ELSE 0 END) / COUNT(zip_code) * 100 FROM zip_code	student_club
SELECT T1.event_name, T1.location FROM events AS T1 JOIN expenses AS T2 ON T1.record_id = T2.event_record_id WHERE T2.remaining > 0	student_club
SELECT T1.event_name, T1.event_date FROM events AS T1 JOIN expenses AS T2 ON T1.event_id = T2.event_id WHERE T2.expense_description = 'Pizza' AND T2.cost > 50 AND T2.cost < 100	student_club
SELECT T3.first_name, T3.last_name, T4.major_name FROM expenses AS T1 JOIN member_of_club AS T2 ON T1.member_id = T2.member_id JOIN club_member AS T3 ON T2.member_id = T3.member_id JOIN major AS T4 ON T3.major_id = T4.major_id WHERE T1.cost > 100	student_club
SELECT T2.city, T2.county FROM events AS T1 JOIN zip_code AS T2 ON T1.location = T2.zip_code WHERE T1.income > 40 GROUP BY T2.city, T2.county	student_club
SELECT T2.member_name FROM expenses AS T1 JOIN members AS T2 ON T1.member_id = T2.id WHERE T1.event_id IN (SELECT event_id FROM expenses GROUP BY event_id HAVING COUNT(event_id) > 1) ORDER BY cost DESC LIMIT 1	student_club
SELECT AVG(T2.cost) FROM student AS T1 JOIN payment AS T2 ON T1.student_id = T2.student_id WHERE T1.position != 'Member'	student_club
SELECT T1.event_name FROM `event` AS T1 JOIN expense AS T2 ON T1.event_id = T2.event_id WHERE T2.category = 'Parking' AND T2.cost < (SELECT AVG(cost) FROM expense WHERE category = 'Parking')	student_club
SELECT SUM(CASE WHEN T1.type = 'Meeting' THEN T1.cost ELSE 0 END) / SUM(T1.cost) * 100 FROM event AS T1 JOIN club_event AS T2 ON T1.event_id = T2.event_id WHERE T1.type = 'Meeting'	student_club
SELECT MAX(cost) FROM expenses WHERE expense_description = 'Water, chips, cookies'	student_club
SELECT T1.first_name , T1.last_name FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.member_id ORDER BY T2.cost DESC LIMIT 5	student_club
SELECT T1.first_name, T1.last_name, T1.phone FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.member_id WHERE T2.cost > (SELECT AVG(cost) FROM expense)	student_club
SELECT (SUM(CASE WHEN T2.state = 'New Jersey' THEN 1 ELSE 0 END) / COUNT(CASE WHEN T1.position = 'Member' THEN 1 END)) - (SUM(CASE WHEN T2.state = 'Vermont' THEN 1 ELSE 0 END) / COUNT(CASE WHEN T1.position = 'Member' THEN 1 END)) FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip_code = T2.zip_code	student_club
SELECT T1.major_name, T2.department_name FROM student AS T1 JOIN department AS T2 ON T1.dept_code = T2.dept_code WHERE T1.first_name = 'Garrett' AND T1.last_name = 'Gerke'	student_club
SELECT T1.first_name, T1.last_name, SUM(T2.amount) FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.payer_member_id WHERE T2.expense_description = 'Water, Veggie tray, supplies' GROUP BY T1.first_name, T1.last_name	student_club
SELECT T2.last_name ,  T3.phone FROM student AS T1 JOIN people AS T2 ON T1.student_id = T2.person_id JOIN contact_number AS T3 ON T2.person_id = T3.person_id WHERE T1.major = 'Elementary Education'	student_club
SELECT T1.category, T1.amount FROM budget AS T1 JOIN events AS T2 ON T1.event_id = T2.id WHERE T2.event_name = 'January Speaker'	student_club
SELECT T1.event_name FROM events AS T1 JOIN expenses AS T2 ON T1.id = T2.event_id WHERE T2.category = 'Food'	student_club
SELECT T1.first_name, T1.last_name, T2.amount FROM student AS T1 JOIN fund_transfer AS T2 ON T1.student_id = T2.student_id WHERE T2.date_received = '2019-09-09'	student_club
SELECT budget_category FROM expenses WHERE expense_description = 'Posters'	student_club
SELECT T1.first_name, T1.last_name, T3.college FROM club_member AS T1 JOIN member_of_club AS T2 ON T1.stuid = T2.stuid JOIN college AS T3 ON T2.clubid = T3.clubid WHERE T1.position = 'Secretary'	student_club
SELECT SUM(T2.spent), T1.event_name FROM events AS T1 JOIN expenses AS T2 ON T1.rec_id = T2.rec_id WHERE T2.category = 'Speaker Gifts' GROUP BY T1.event_name;	student_club
SELECT T2.city FROM member AS T1 JOIN zip_code AS T2 ON T1.zip_code = T2.zip_code WHERE T1.first_name = 'Garrett' AND T1.last_name = 'Gerke'	student_club
SELECT T1.first_name, T1.last_name, T1.position FROM student AS T1 JOIN zip_code AS T2 ON T1.zip_code = T2.zip_code WHERE T2.city = 'Lincolnton' AND T2.state = 'North Carolina' AND T2.zip_code = 28092	student_club
SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Premium'	debit_card_specializing
SELECT COUNT(CASE WHEN Currency = 'EUR' THEN 1 ELSE NULL END) / COUNT(CASE WHEN Currency = 'CZK' THEN 1 ELSE NULL END) AS Ratio FROM customers;	debit_card_specializing
SELECT T1.CustomerID FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM' AND T2.Date BETWEEN '201201' AND '201212' ORDER BY T2.Consumption ASC LIMIT 1	debit_card_specializing
SELECT AVG(T3.Consumption) / 12 AS AverageMonthlyConsumption FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID JOIN yearmonth AS T3 ON T1.CustomerID = T3.CustomerID WHERE T1.Segment = 'SME' AND SUBSTR(T3.Date, 1, 4) = '2013' GROUP BY T1.CustomerID;	debit_card_specializing
SELECT T1.CustomerID FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID JOIN yearmonth AS T3 ON T1.CustomerID = T3.CustomerID WHERE T1.Currency = 'CZK' AND T3.Date BETWEEN '201101' AND '201112' GROUP BY T1.CustomerID ORDER BY SUM(T3.Consumption) DESC LIMIT 1;	debit_card_specializing
SELECT COUNT(*) FROM ( (SELECT CustomerID FROM yearmonth WHERE Date BETWEEN '201201' AND '201212' AND Consumption < 30000) INTERSECT  (SELECT CustomerID FROM customers WHERE Segment = 'KAM') ) AS result	debit_card_specializing
SELECT (SELECT SUM(T3.Consumption) FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID JOIN yearmonth AS T3 ON T3.CustomerID = T2.CustomerID WHERE T1.Currency = 'CZK' AND SUBSTR(T3.Date, 1, 4) BETWEEN '201201' AND '201212') - (SELECT SUM(T3.Consumption) FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID JOIN yearmonth AS T3 ON T3.CustomerID = T2.CustomerID WHERE T1.Currency = 'EUR' AND SUBSTR(T3.Date, 1, 4) BETWEEN '201201' AND '201212')	debit_card_specializing
SELECT Date, SUM(Amount * Price) as Total_Gas_Use FROM transactions_1k JOIN customers ON transactions_1k.CustomerID = customers.CustomerID WHERE Currency = 'EUR' GROUP BY DATEPART(yyyy, Date) ORDER BY Total_Gas_Use DESC LIMIT 1;	debit_card_specializing
SELECT T2.Segment FROM yearmonth AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID GROUP BY T2.Segment ORDER BY SUM(T1.Consumption) LIMIT 1	debit_card_specializing
SELECT T2.Date FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Currency = 'CZK' GROUP BY SUBSTR(T2.Date, 1, 4) ORDER BY SUM(T2.Consumption) DESC LIMIT 1;	debit_card_specializing
SELECT T2.Date FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'SME' AND SUBSTRING(T2.Date, 1, 4) BETWEEN '2013' AND '2013' AND SUBSTRING(T2.Date, 6, 2) IN ('01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12') ORDER BY T2.Consumption DESC LIMIT 1	debit_card_specializing
SELECT      (SELECT SUM(CASE WHEN T1.Segment = 'SME' THEN T5.Consumption ELSE 0 END) / COUNT(CASE WHEN T1.Segment = 'SME' AND T4.Date BETWEEN '201301' AND '201312' THEN T1.CustomerID END)      FROM customers AS T1      JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID      JOIN gasstations AS T3 ON T2.GasStationID = T3.GasStationID      JOIN yearmonth AS T4 ON T1.CustomerID = T4.CustomerID      WHERE T3.Country = 'CZE' AND T4.Date BETWEEN '201301' AND '201312') -     (SELECT SUM(CASE WHEN T1.Segment = 'LAM' THEN T5.Consumption ELSE 0 END) / COUNT(CASE WHEN T1.Segment = 'LAM' AND T4.Date BETWEEN '201301' AND '201312' THEN T1.CustomerID END)      FROM customers AS T1      JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID      JOIN gasstations AS T3 ON T2.GasStationID = T3.GasStationID      JOIN yearmonth AS T4 ON T1.CustomerID = T4.CustomerID      WHERE T3.Country = 'CZE' AND T4.Date BETWEEN '201301' AND '201312') AS SME_LAM,     (SELECT SUM(CASE WHEN T1.Segment = 'LAM' THEN T5.Consumption ELSE 0 END) / COUNT(CASE WHEN T1.Segment = 'LAM' AND T4.Date BETWEEN '201301' AND '201312' THEN T1.CustomerID END)      FROM customers AS T1      JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID      JOIN gasstations AS T3 ON T2.GasStationID = T3.GasStationID      JOIN yearmonth AS T4 ON T1.CustomerID = T4.CustomerID      WHERE T3.Country = 'CZE' AND T4.Date BETWEEN '201301' AND '201312') -     (SELECT SUM(CASE WHEN T1.Segment = 'KAM' THEN T5.Consumption ELSE 0 END) / COUNT(CASE WHEN T1.Segment = 'KAM' AND T4.Date BETWEEN '201301' AND '201312' THEN T1.CustomerID END)      FROM customers AS T1      JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID      JOIN gasstations AS T3 ON T2.GasStationID = T3.GasStationID      JOIN yearmonth AS T4 ON T1.CustomerID = T4.CustomerID      WHERE T3.Country = 'CZE' AND T4.Date BETWEEN '201301' AND '201312') AS LAM_KAM,     (SELECT SUM(CASE WHEN T1.Segment = 'KAM' THEN T5.Consumption ELSE 0 END) / COUNT(CASE WHEN T1.Segment = 'KAM' AND T4.Date BETWEEN '201301' AND '201312' THEN T1.CustomerID END)      FROM customers AS T1      JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID      JOIN gasstations AS T3 ON T2.GasStationID = T3.GasStationID      JOIN yearmonth AS T4 ON T1.CustomerID = T4.CustomerID      WHERE T3.Country = 'CZE' AND T4.Date BETWEEN '201301' AND '201312') -     (SELECT SUM(CASE WHEN T1.Segment = 'SME' THEN T5.Consumption ELSE 0 END) / COUNT(CASE WHEN T1.Segment = 'SME' AND T4.Date BETWEEN '201301' AND '201312' THEN T1.CustomerID END)      FROM customers AS T1      JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID      JOIN gasstations AS T3 ON T2.GasStationID = T3.GasStationID      JOIN yearmonth AS T4 ON T1.CustomerID = T4.CustomerID      WHERE T3.Country = 'CZE' AND T4.Date BETWEEN '201301' AND '201312') AS KAM_SME;	debit_card_specializing
SELECT T1.Segment ,  MAX(T3.PercentageIncrease) ,  MIN(T3.PercentageIncrease) FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID JOIN (SELECT CustomerID ,  `Date` ,  Consumption ,  CASE WHEN `Date` LIKE '2012%' THEN 0 ELSE (Consumption - LAG(Consumption,1) OVER (PARTITION BY CustomerID ORDER BY `Date`) ) / Consumption * 100 END AS PercentageIncrease FROM yearmonth WHERE `Date` BETWEEN '201201' AND '201312') AS T3 ON T1.CustomerID = T3.CustomerID WHERE T2.Currency = 'EUR' GROUP BY T1.Segment	debit_card_specializing
SELECT SUM(T2.Consumption) FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.CustomerID = 6 AND SUBSTR(T2.Date, 1, 4) BETWEEN '2013' AND '2013' AND SUBSTR(T2.Date, 5, 2) BETWEEN '08' AND '11'	debit_card_specializing
SELECT (SELECT COUNT(*) FROM gasstations WHERE Segment = 'Discount' AND Country = 'CZE') - (SELECT COUNT(*) FROM gasstations WHERE Segment = 'Discount' AND Country = 'SVK') AS Difference_In_Discount_Gas_Stations;	debit_card_specializing
SELECT (SELECT Consumption FROM yearmonth WHERE CustomerID = 7 AND Date = '201304') - (SELECT Consumption FROM yearmonth WHERE CustomerID = 5 AND Date = '201304') AS Difference;	debit_card_specializing
SELECT (SELECT COUNT(DISTINCT T1.CustomerID) FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'SME' AND T1.Currency = 'CZK') - (SELECT COUNT(DISTINCT T1.CustomerID) FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'SME' AND T1.Currency = 'EUR') AS difference;	debit_card_specializing
SELECT T1.CustomerID FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM' AND T1.Currency = 'EUR' AND T2.Date = '201310' ORDER BY T2.Consumption DESC LIMIT 1	debit_card_specializing
SELECT T1.CustomerID, MAX(T2.Consumption) FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'KAM' GROUP BY T1.CustomerID ORDER BY T2.Consumption DESC LIMIT 1	debit_card_specializing
SELECT SUM(T4.Consumption) FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID JOIN yearmonth AS T4 ON T4.CustomerID = T1.CustomerID WHERE T1.Segment = 'KAM' AND T4.Date = '201305'	debit_card_specializing
SELECT CAST(SUM(CASE WHEN T2.Consumption > 46.73 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.CustomerID) FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM';	debit_card_specializing
SELECT Country , COUNT(GasStationID) FROM gasstations WHERE `Segment` = 'Value for money' GROUP BY Country ORDER BY COUNT(GasStationID) DESC LIMIT 1;	debit_card_specializing
SELECT CAST(SUM(CASE WHEN T2.Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'KAM';	debit_card_specializing
SELECT CAST(SUM(CASE WHEN T2.Consumption > 528.3 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.CustomerID) FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE SUBSTR(T2.Date, 1, 4) = '2012' AND SUBSTR(T2.Date, 5, 2) = '02'	debit_card_specializing
SELECT CAST(SUM(IIF(T2.Segment = 'Premium', 1, 0)) AS REAL) * 100 / COUNT(T1.GasStationID) FROM gasstations AS T1 JOIN chains AS T2 ON T1.ChainID = T2.ChainID WHERE T1.Country = 'SVK'	debit_card_specializing
SELECT T1.CustomerID FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '201309' ORDER BY T2.Consumption DESC LIMIT 1	debit_card_specializing
SELECT T1.Segment FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '201309' ORDER BY T2.Consumption ASC LIMIT 1	debit_card_specializing
SELECT T1.CustomerID FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'SME' AND T2.Date = '201206' ORDER BY T2.Consumption ASC LIMIT 1	debit_card_specializing
SELECT MAX(Consumption) FROM yearmonth WHERE SUBSTR(Date,1,4) = '2012'	debit_card_specializing
SELECT MAX(T3.Consumption) FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID JOIN yearmonth AS T3 ON T1.CustomerID = T3.CustomerID WHERE T1.Currency = 'EUR' GROUP BY T3.Date ORDER BY SUM(T3.Consumption) DESC LIMIT 1	debit_card_specializing
SELECT T3.Description FROM transactions_1k AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID JOIN products AS T3 ON T1.ProductID = T3.ProductID WHERE SUBSTR(T2.Date, 1, 4) = '2013' AND SUBSTR(T2.Date, 5, 2) = '09'	debit_card_specializing
SELECT T3.Country FROM `transactions_1k` AS T1 JOIN `gasstations` AS T3 ON T1.GasStationID = T3.GasStationID JOIN `yearmonth` AS T2 ON T1.CustomerID = T2.CustomerID WHERE SUBSTR(T2.Date, 1, 4) = '2013' AND SUBSTR(T2.Date, 5, 6) = '06' GROUP BY T3.Country	debit_card_specializing
SELECT T3.ChainID FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID JOIN gasstations AS T3 ON T1.GasStationID = T3.GasStationID WHERE T2.Currency = 'EUR' GROUP BY T3.ChainID	debit_card_specializing
SELECT T3.Description FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID JOIN products AS T3 ON T1.ProductID = T3.ProductID WHERE T2.Currency = 'EUR'	debit_card_specializing
SELECT AVG(t1.Price * t1.Amount) FROM transactions_1k AS t1 JOIN yearmonth AS t2 ON t1.CustomerID = t2.CustomerID WHERE t2.Date LIKE '201201%'	debit_card_specializing
SELECT COUNT(*)  FROM customers c  JOIN yearmonth ym ON c.CustomerID = ym.CustomerID  WHERE c.Currency = 'EUR' AND ym.Consumption > 1000;	debit_card_specializing
SELECT T3.Description FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID JOIN products AS T3 ON T1.ProductID = T3.ProductID WHERE T2.Country = 'CZE'	debit_card_specializing
SELECT T2.Time FROM gasstations AS T1 JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.ChainID = 11 GROUP BY T2.Time	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE' AND T1.Price > 1000	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE' AND T1.Date > '2012-01-01'	debit_card_specializing
SELECT AVG(T1.Price * T1.Amount) FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE'	debit_card_specializing
SELECT AVG(t1.Price * t1.Amount) FROM transactions_1k AS t1 JOIN customers AS t2 ON t1.CustomerID = t2.CustomerID WHERE t2.Currency = 'EUR'	debit_card_specializing
SELECT T1.CustomerID FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '2012-08-25' ORDER BY T2.Amount * T2.Price DESC LIMIT 1	debit_card_specializing
SELECT T3.Country FROM transactions_1k AS T1 JOIN gasstations AS T3 ON T1.GasStationID = T3.GasStationID WHERE T1.Date = '2012-08-25' ORDER BY T1.Time LIMIT 1	debit_card_specializing
SELECT T1.Currency FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '2012-08-24' AND T2.Time = '16:25:00'	debit_card_specializing
SELECT T1.Segment FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '2012-08-23' AND T2.Time = '21:20:00'	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k WHERE Date = '2012-08-26' AND Time < '13:00:00' AND CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'CZK')	debit_card_specializing
SELECT T1.Segment FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID ORDER BY T2.Date, T2.Time LIMIT 1	debit_card_specializing
SELECT T3.Country FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID JOIN gasstations AS T3 ON T1.GasStationID = T3.GasStationID WHERE T1.Date = '2012-08-24' AND T1.Time = '12:42:00'	debit_card_specializing
SELECT T1.ProductID FROM transactions_1k AS T1 WHERE T1.Date = '2012-08-23' AND T1.Time = '21:20:00'	debit_card_specializing
SELECT T3.Consumption ,  T3.Date FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID JOIN yearmonth AS T3 ON T3.CustomerID = T2.CustomerID WHERE T1.Price = 124.05 AND T1.Date = '2012-08-24' AND T3.Date LIKE '201201%'	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE transactions_1k.Date = '2012-08-26' AND transactions_1k.Time BETWEEN '08:00:00' AND '09:00:00' AND gasstations.Country = 'CZE'	debit_card_specializing
SELECT T1.Currency FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '201306' AND T2.Consumption = 214582.17	debit_card_specializing
SELECT T2.Country FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.CardID = 667467 GROUP BY T2.Country	debit_card_specializing
SELECT T1.Currency FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '2012-08-24' AND (T2.Amount * T2.Price) = 548.4	debit_card_specializing
SELECT 100 * COUNT(DISTINCT T1.CustomerID) / (SELECT COUNT(*) FROM customers) AS percentage FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date = '2012-08-25' AND T2.Currency = 'EUR'	debit_card_specializing
SELECT ((SELECT SUM(t1.Consumption) FROM yearmonth AS t1 WHERE t1.CustomerID IN (SELECT t2.CustomerID FROM transactions_1k AS t2 WHERE t2.Price * t2.Amount = 634.8 AND t2.Date = '2012-08-25') AND t1.Date LIKE '2012%') - (SELECT SUM(t1.Consumption) FROM yearmonth AS t1 WHERE t1.CustomerID IN (SELECT t2.CustomerID FROM transactions_1k AS t2 WHERE t2.Price * t2.Amount = 634.8 AND t2.Date = '2012-08-25') AND t1.Date LIKE '2013%')) / (SELECT SUM(t1.Consumption) FROM yearmonth AS t1 WHERE t1.CustomerID IN (SELECT t2.CustomerID FROM transactions_1k AS t2 WHERE t2.Price * t2.Amount = 634.8 AND t2.Date = '2012-08-25') AND t1.Date LIKE '2012%')	debit_card_specializing
SELECT T2.GasStationID, SUM(T1.Amount * T1.Price) AS Revenue FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID GROUP BY T2.GasStationID ORDER BY Revenue DESC LIMIT 1;	debit_card_specializing
SELECT CAST(SUM(CASE WHEN T2.Segment = 'Premium' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM gasstations AS T1 JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Country = 'SVK';	debit_card_specializing
SELECT SUM(T1.Amount * T1.Price) AS AmountSpent FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.CustomerID = '38508' AND strftime('%Y%m', T1.Date) = '201201'	debit_card_specializing
SELECT T1.Description FROM products AS T1 JOIN transactions_1k AS T2 ON T1.ProductID = T2.ProductID GROUP BY T1.ProductID ORDER BY SUM(T2.Amount) DESC LIMIT 5;	debit_card_specializing
SELECT T1.CustomerID, T3.Currency, SUM(T2.Price)/SUM(T2.Amount) AS AvgPricePerItem FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID JOIN customers AS T3 ON T1.CustomerID = T3.CustomerID WHERE T2.Price/T2.Amount = (SELECT MAX(Price/Amount) FROM transactions_1k) GROUP BY T1.CustomerID, T3.Currency ORDER BY SUM(T2.Price) DESC LIMIT 1;	debit_card_specializing
SELECT T3.Country FROM products AS T1 JOIN transactions_1k AS T2 ON T1.ProductID = T2.ProductID JOIN gasstations AS T3 ON T2.GasStationID = T3.GasStationID WHERE T1.ProductID = 2 ORDER BY T2.Price DESC LIMIT 1	debit_card_specializing
SELECT T5.Consumption FROM transactions_1k AS T1 JOIN products AS T2 ON T1.ProductID = T2.ProductID JOIN customers AS T3 ON T1.CustomerID = T3.CustomerID JOIN gasstations AS T4 ON T1.GasStationID = T4.GasStationID JOIN yearmonth AS T5 ON T3.CustomerID = T5.CustomerID WHERE T1.ProductID = 5 AND T1.Price / T1.Amount > 29.00 AND T5.Date = '201208'	debit_card_specializing
