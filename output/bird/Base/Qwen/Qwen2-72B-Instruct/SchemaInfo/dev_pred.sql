SELECT MAX(`Free Meal Count (K-12)` / `Enrollment (K-12)`) AS eligible_free_rate FROM table_name WHERE County = 'Alameda' AND `School Level` = 'K-12';
SELECT MIN(`Free Meal Count (Ages 5-17)`) / `Enrollment (Ages 5-17)` AS eligible_free_rate  FROM table_name  WHERE School_Type = 'Continuation'  GROUP BY `CDS Code`  ORDER BY eligible_free_rate ASC  LIMIT 3
SELECT T2.ZipCode FROM fprm AS T1 JOIN school AS T2 ON T1.SchID = T2.SchID WHERE T1.CountyOfficeEdName = 'FRESNO COUNTY OFFICE OF EDUCATION' AND T1.`Charter School (Y/N)` = 1
SELECT T1.StreetAddress FROM Schools AS T1 JOIN StudentCounts AS T2 ON T1.SchoolID = T2.SchoolID WHERE T2.FRPMCountK_12 = (SELECT MAX(FRPMCountK_12) FROM StudentCounts)
SELECT T2.PhoneNumber FROM Schools AS T1 JOIN Addresses AS T2 ON T1.AddressID = T2.AddressID WHERE T1.CharterSchoolYN = 1 AND T1.OpenDate > '2000-01-01'
SELECT COUNT(*) FROM schools WHERE Virtual = 'F' AND AVG_Math_SAT > 400
SELECT SchoolName FROM Schools WHERE SATTestTakers > 500 AND Magnet = 1
SELECT T2.PhoneNumber FROM SchoolTestScores AS T1 JOIN Schools AS T2 ON T1.SchoolID = T2.SchoolID WHERE T1.TestTakers > 0 AND T1.CriticalReadingMean + T1.MathematicsMean + T1.WritingMean > 1500 ORDER BY T1.TestTakers DESC LIMIT 1
SELECT T1.SAT_Test_Takers FROM School AS T1 JOIN Student AS T2 ON T1.School_ID = T2.School_ID WHERE T2.FRPM_Count = (SELECT MAX(FRPM_Count) FROM Student WHERE Grade_Level BETWEEN 'K' AND '12')
SELECT COUNT(*) FROM Schools WHERE Funding_Type = 'Charter' AND AVG_SAT_Math > 560;
SELECT T2.FRPM_5_17 FROM SAT_Scores AS T1 JOIN School_Districts AS T2 ON T1.School_ID = T2.School_ID WHERE T1.Test_Type = 'Reading' ORDER BY AVG(T1.Score) DESC LIMIT 1
SELECT SchoolCode FROM Schools WHERE (`Enrollment_K_12` + `Enrollment_Ages_5_17`) > 500;
SELECT MAX(`Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)`) AS highest_eligible_free_rate FROM table_name WHERE (`NumGE1500` / `NumTstTakr`) > 0.3;
SELECT T2.Phone FROM (SELECT SchoolCode, SUM(NumGE1500) AS SumNumGE1500, SUM(NumTstTakr) AS SumNumTstTakr FROM SATExcellenceRate GROUP BY SchoolCode) AS T1 JOIN School AS T2 ON T1.SchoolCode = T2.SchoolCode ORDER BY (T1.SumNumGE1500 / T1.SumNumTstTakr) DESC LIMIT 3
SELECT T1.NCES_School_ID FROM School AS T1 JOIN Enrollment AS T2 ON T1.School_ID = T2.School_ID WHERE Age_Range = '5-17' GROUP BY T1.NCES_School_ID ORDER BY COUNT(*) DESC LIMIT 5;
SELECT DistrictName FROM SchoolDistricts WHERE IsActive = 1 GROUP BY DistrictName ORDER BY AVG(ReadingScore) DESC LIMIT 1;
SELECT COUNT(*) FROM Schools WHERE County = 'Alameda' AND TestTakers < 100;
SELECT CharterNumber, AVG(WritingScore) AS AverageWritingScore  FROM Schools  WHERE WritingScore > 499 AND CharterNumber IS NOT NULL  GROUP BY CharterNumber  ORDER BY AverageWritingScore DESC;
SELECT COUNT(*) FROM Schools WHERE Location = 'Fresno' AND Funding_Type = 'Directly Funded' AND Test_Takers <= 250;
SELECT T1.PhoneNumber FROM Schools AS T1 JOIN TestScores AS T2 ON T1.SchoolID = T2.SchoolID WHERE T2.Subject = 'Math' GROUP BY T1.SchoolID ORDER BY AVG(T2.Score) DESC LIMIT 1;
SELECT COUNT(*) FROM Schools WHERE County = 'Amador' AND LowGrade = 9 AND HighGrade = 12;
SELECT COUNT(*) FROM schools WHERE district = 'Los Angeles' AND free_meals > 500 AND free_or_reduced_meals < 700 AND grade_level = 'K-12'
SELECT SchoolName FROM Schools WHERE County = 'Contra Costa' ORDER BY TestTakers DESC LIMIT 1;
SELECT T1.SchoolName ,  T1.StreetAddress FROM Schools AS T1 INNER JOIN SchoolAdmin AS T2 ON T1.CDSCode = T2.CDSCode WHERE ABS(T1.Enrollment_K_12 - T1.Enrollment_Ages_5_17) > 30
SELECT T1.SchoolName FROM Schools AS T1 JOIN TestScores AS T2 ON T1.SchoolID = T2.SchoolID WHERE (T1.FreeMealCountK_12 / T1.TotalEnrollmentK_12) > 0.1 AND T2.TestScore >= 1500
SELECT T1.FundingType FROM Schools AS T1 JOIN SATScores AS T2 ON T1.SchoolID = T2.SchoolID WHERE T1.City = 'Riverside' GROUP BY T1.SchoolName HAVING AVG(T2.AvgMathScore) > 400
SELECT AdmFName1, AdmLName1, AdmEmail1, Street, City, State, Zip FROM Schools WHERE County = 'Monterey' AND SchoolType = 'High School' AND AgeRange = '15-17' AND Free_Reduced_Meals > 800
SELECT S.SchoolName, AVG(A.WritingScore) AS AvgWritingScore, S.PhoneNumber FROM Schools S JOIN AssessmentResults A ON S.SchoolID = A.SchoolID WHERE (S.OpeningYear > 1991 OR S.ClosingYear < 2000) GROUP BY S.SchoolName, S.PhoneNumber;
SELECT T1.Name ,  T1.DOC_Type FROM Schools AS T1 JOIN School_Districts AS T2 ON T1.Sponsor_District_ID  =  T2.ID WHERE T1.Funding_Type  =  'Local' AND (T1.Enrollment_K_12 - T1.Enrollment_Ages_5_17) > (SELECT AVG(Enrollment_K_12 - Enrollment_Ages_5_17) FROM Schools WHERE Funding_Type  =  'Local')
SELECT T1.Opened FROM School AS T1 JOIN Enrollment AS T2 ON T1.SchoolID = T2.SchoolID WHERE T1.GradesOffered = 'K-12' ORDER BY T2.Enrollment DESC LIMIT 1
SELECT T2.City FROM Schools AS T1 JOIN Addresses AS T2 ON T1.AddressID = T2.AddressID WHERE T1.Enrollment IS NOT NULL ORDER BY T1.Enrollment ASC LIMIT 5;
SELECT T1.FreeMealCount_K_12 / T1.Enrollment_K_12 AS Eligible_Free_Rate FROM School AS T1 JOIN School_Details AS T2 ON T1.school_id = T2.school_id ORDER BY T1.Enrollment_K_12 DESC LIMIT 2 OFFSET 9
SELECT `Eligible FRPM Rate` FROM `school_details` WHERE `Ownership Code` = 66 ORDER BY `FRPM Count (K-12)` DESC LIMIT 5
SELECT T1.Website, T1.SchoolName FROM School AS T1 JOIN Meals AS T2 ON T1.SchoolID = T2.SchoolID WHERE T2.FreeMealCount BETWEEN 1900 AND 2000 AND T1.AgeRange = '5-17'
SELECT (`FreeMealCountAges5_17` / `EnrollmentAges5_17`) AS free_rate WHERE AdmFName1 = 'Kacey' AND AdmLName1 = 'Gibson'
SELECT T2.AdmEmail1 FROM frm AS T1 JOIN sch AS T2 ON T1.SchID = T2.SchID WHERE T1.`Charter School (Y/N)` = 1 AND T1.SchTypeDesc = 'Chartered' ORDER BY `Enrollment (K-12)` ASC LIMIT 1
SELECT T2.AdmFName1, T2.AdmLName1, T2.AdmFName2, T2.AdmLName2, T2.AdmFName3, T2.AdmLName3 FROM School_SAT_2015 AS T1 JOIN Schools AS T2 ON T1.SCHOOLID = T2.SCHOOLID WHERE T1.NumGE1500 = (SELECT MAX(NumGE1500) FROM School_SAT_2015)
SELECT T2.Street, T2.City, T2.Zip, T2.State FROM (SELECT SchoolID, MIN(NumGE1500 / NumTstTakr) AS ExcellenceRate FROM Schools GROUP BY SchoolID) AS T1 JOIN Addresses AS T2 ON T1.SchoolID = T2.SchoolID WHERE T1.ExcellenceRate = (SELECT MIN(ExcellenceRate) FROM (SELECT SchoolID, NumGE1500 / NumTstTakr AS ExcellenceRate FROM Schools GROUP BY SchoolID))
SELECT Webpage FROM Schools WHERE County = 'Los Angeles' AND TestTakers BETWEEN 2000 AND 3000;
SELECT AVG(TestTakers) FROM Schools WHERE City = 'Fresno' AND YearOpened = 1980
SELECT T1.Phone FROM School AS T1 JOIN TestScore AS T2 ON T1.SchoolID = T2.SchoolID WHERE T1.District = 'Fresno Unified' GROUP BY T1.SchoolID ORDER BY AVG(T2.Reading) ASC LIMIT 1
SELECT AdmFName1, AdmLName1  FROM table_name  WHERE Virtual = 'F'  GROUP BY County, AdmFName1, AdmLName1  HAVING AVG(ReadingScore) OVER (PARTITION BY County)  IN (SELECT TOP 5 AVG(ReadingScore)      FROM table_name      WHERE Virtual = 'F'      GROUP BY County      ORDER BY AVG(ReadingScore) DESC)
SELECT T1.Education_Type FROM Schools AS T1 JOIN Scores AS T2 ON T1.School_ID = T2.School_ID WHERE T2.Subject = 'Math' ORDER BY AVG(T2.Score) DESC LIMIT 1;
SELECT T1.AvgScrMath, T2.County  FROM SchoolScores AS T1  JOIN Schools AS T2 ON T1.SchID = T2.SchID  WHERE T1.AvgScrMath + T1.AvgScrRead + T1.AvgScrWrite = (SELECT MIN(AvgScrMath + AvgScrRead + AvgScrWrite) FROM SchoolScores) GROUP BY T2.County ORDER BY AVG(T1.AvgScrMath) ASC LIMIT 1;
SELECT T1.City, AVG(T2.Writing) AS AvgWritingScore FROM Schools AS T1 JOIN SATScores AS T2 ON T1.SchoolID = T2.SchoolID WHERE T2.TotalSAT >= 1500 GROUP BY T1.City ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.SchoolName, AVG(T2.WritingScore) FROM Schools AS T1 JOIN TestScores AS T2 ON T1.SchoolID = T2.SchoolID WHERE T1.AdministratorFirstName = 'Ricci' AND T1.AdministratorLastName = 'Ulrich' GROUP BY T1.SchoolName
SELECT T1.SchoolName FROM School AS T1 JOIN Enrollment AS T2 ON T1.schoolid = T2.schoolid WHERE T1.DOC = 31 AND T2.GradeLevel = 'K-12' GROUP BY T1.SchoolName ORDER BY SUM(T2.Enrollment) DESC LIMIT 1
SELECT COUNT(*) / 12 FROM Schools WHERE County = 'Alameda' AND DOC = 52 AND OpenYr = 1980
SELECT CAST(SUM(CASE WHEN DOC = 54 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN DOC = 52 THEN 1 ELSE 0 END) FROM schools WHERE County = 'Orange' AND Status = 'Merged'
SELECT T1.CountyName, T2.SchoolName, T2.ClosureDate  FROM County AS T1  JOIN School AS T2 ON T1.CountyID = T2.CountyID  WHERE T2.StatusType = 'Closed'  GROUP BY T1.CountyName, T2.SchoolName, T2.ClosureDate  ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T1.SchMailingStreet, T1.SchName FROM Schools AS T1 JOIN TestScores AS T2 ON T1.SchID = T2.SchID WHERE T2.TestType = 'Math' ORDER BY T2.AvgScore DESC LIMIT 6,1;
SELECT T1.MailingStreetAddress, T1.SchoolName FROM Schools AS T1 JOIN TestScores AS T2 ON T1.SchoolID = T2.SchoolID WHERE T2.Subject = 'Reading' GROUP BY T1.SchoolID ORDER BY AVG(T2.AverageScore) ASC LIMIT 1
SELECT COUNT(*) FROM Schools WHERE MailingCity = 'Lakeport' AND (AvgScrRead + AvgScrMath + AvgScrWrite) >= 1500
SELECT COUNT(*) FROM TestTakers WHERE SchoolCity = 'Fresno'
SELECT SchoolName, MailingZipCode FROM Schools WHERE AdmFName1 = 'Avetik' AND AdmLName1 = 'Atoian' OR AdmFName2 = 'Avetik' AND AdmLName2 = 'Atoian' OR AdmFName3 = 'Avetik' AND AdmLName3 = 'Atoian';
SELECT COUNT(CASE WHEN County = 'Colusa' THEN 1 ELSE NULL END) / COUNT(CASE WHEN County = 'Humboldt' THEN 1 ELSE NULL END) AS Ratio  FROM Schools  WHERE MailingStateAddress = 'California'
SELECT COUNT(*) FROM schools WHERE MailingState = 'CA' AND City = 'San Joaquin' AND Status = 'Active'
SELECT T1.PhoneNumber ,  T1.Extension FROM Schools AS T1 JOIN Scores AS T2 ON T1.SchoolID  =  T2.SchoolID WHERE T2.AvgWritingScore IN (SELECT AvgWritingScore FROM Scores ORDER BY AvgWritingScore DESC LIMIT 333 OFFSET 332)
SELECT T1.SchPhoneNum , T1.SchExt FROM Schools AS T1 JOIN SchoolAdmins AS T2 ON T1.SchID = T2.SchID WHERE T1.SchZipCode = '95203-3704'
SELECT T1.Website FROM School AS T1 JOIN Administrator AS T2 ON T1.AdminID = T2.AdminID WHERE T2.FName = 'Mike' AND T2.LName = 'Larson' INTERSECT SELECT T1.Website FROM School AS T1 JOIN Administrator AS T2 ON T1.AdminID = T2.AdminID WHERE T2.FName = 'Dante' AND T2.LName = 'Alvarez'
SELECT T1.WebSite FROM Schools AS T1 JOIN SchoolLocations AS T2 ON T1.SchoolID = T2.SchoolID WHERE T1.Virtual = 'P' AND T1.Charter = 1 AND T2.CountyName = 'San Joaquin'
SELECT COUNT(*) FROM schools WHERE City = 'Hickman' AND Charter = 1 AND DOC = 52
SELECT COUNT(*) FROM Schools WHERE CountyName = 'Los Angeles' AND Charter = 0 AND ((`Free Meal Count (K-12)` * 100) / `Enrollment (K-12)`) < 0.18;
SELECT T2.AdmFName1, T2.AdmLName1, T1.SchoolName, T1.City FROM schools AS T1 JOIN administrators AS T2 ON T1.AdminID = T2.AdminID WHERE T1.Charter = '00D2' AND T1.SchoolType = 'Charter'
SELECT COUNT(*) FROM Schools WHERE MailingCity = 'Hickman' AND CharterNumber = '00D4'
SELECT CAST(SUM(CASE WHEN FundingSource = 'Local' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Schools WHERE County = 'Santa Clara';
SELECT COUNT(*) FROM Schools WHERE County = 'Stanislaus' AND FundingType = 'Directly Funded' AND LastUpdate BETWEEN '2000-01-01' AND '2005-12-31'
SELECT SUM(CASE WHEN AdmFName1 = 'None' AND YEAR(LastUpdate) = 1989 AND City = 'San Francisco' THEN 1 ELSE 0 END) AS Total_Closure FROM CommunityCollegeDistricts WHERE Type = 'Closure'  Note: The provided SQL query is an attempt based on the given information. However, it's important to note that the columns mentioned in the question (like "Type", "City") are not described in the column descriptions provided. Therefore, this query might need adjustments according to the actual table schema.
SELECT T2.County FROM Schools AS T1 JOIN Districts AS T2 ON T1.DistrictID = T2.DistrictID WHERE T1.SchYrCode BETWEEN 1980 AND 1989 AND T1.SchOwnershipCode = 11 GROUP BY T2.County ORDER BY COUNT(*) DESC LIMIT 1
SELECT NCESDistrictID FROM table_name WHERE SOC = 31;
SELECT COUNT(*) FROM schools WHERE County = 'Alpine' AND Status = 'Active' OR Status = 'Closed' AND School_Type = 'District Community Day School'
SELECT DistrictCode FROM Schools WHERE City = 'Fresno' AND Magnet = 0;
SELECT COUNT(*) FROM students WHERE Age BETWEEN 5 AND 17 AND SchoolYear = '2014-2015' AND EdOpsCode = 'SSS' AND City = 'Fremont'
SELECT SUM(Free_Reduced_Meal_Count_5_17) FROM School WHERE School_Name = 'Youth Authority School' AND Mailing_Street_Address = 'PO Box 1040'
SELECT MIN(Grade) FROM Schools WHERE EdOpsCode = 'SPECON' AND NCESDistID = 0613360;
SELECT T1.SchoolName, T1.EducationalLevelName FROM Schools AS T1 JOIN SchoolBreakfastProgram AS T2 ON T1.SchoolID = T2.SchoolID WHERE T2.BreakfastProvision = '2' AND T1.CountyCode = '37'
SELECT T1.CityLocation FROM School AS T1 JOIN SchoolLunchProvision AS T2 ON T1.SchoolID = T2.SchoolID WHERE T1.EILCode = 'HS' AND T2.LunchProvision = 2 AND T1.LowestGrade = 9 AND T1.HighestGrade = 12 AND T1.County = 'Merced'
SELECT SchoolName, (FRPMCount_5_17 / Enrollment_5_17) * 100 AS Percent_Eligible_FRPM FROM Schools WHERE County = 'Los Angeles' AND GradeSpan = 'KG-9'
SELECT GradeSpan, COUNT(*) AS CountGradeSpan FROM Schools WHERE City = 'Adelanto' GROUP BY GradeSpan ORDER BY CountGradeSpan DESC LIMIT 1;
SELECT T1.CountyName, COUNT(*) AS SchoolCount FROM County AS T1 JOIN School AS T2 ON T1.CountyID = T2.County WHERE (T1.CountyName = 'San Diego' OR T1.CountyName = 'Santa Barbara') AND T2.Virtual = 'F' GROUP BY T1.CountyName ORDER BY SchoolCount DESC LIMIT 1;
SELECT SchoolName, Latitude FROM Schools ORDER BY Latitude DESC LIMIT 1;
SELECT T1.City, T2.SchoolName, T2.LowGrade FROM Schools AS T1 JOIN SchoolInfo AS T2 ON T1.SchoolID = T2.SchoolID WHERE T1.State = 'CA' ORDER BY T1.Latitude ASC LIMIT 1;
SELECT T2.Grades_Offered FROM Schools AS T1 JOIN School_Details AS T2 ON T1.School_ID = T2.School_ID WHERE ABS(T1.Longitude) = (SELECT MAX(ABS(Longitude)) FROM Schools)
SELECT T2.City, COUNT(*) AS School_Count FROM (     SELECT *     FROM Schools     WHERE Grade_Span = 'K-8' AND Magnet = 1 AND `NSLP Provision Status` = 'Multiple Provision Types' ) AS T1 JOIN (     SELECT DISTINCT School_ID, City     FROM Schools ) AS T2 ON T1.School_ID = T2.School_ID GROUP BY T2.City;
SELECT AdmFName1, COUNT(AdmFName1) AS NameCount, AdmEmail1 FROM table_name GROUP BY AdmFName1 ORDER BY NameCount DESC LIMIT 2;   SELECT AdmFName2, COUNT(AdmFName2) AS NameCount, AdmEmail1 FROM table_name WHERE AdmFName2 IS NOT NULL AND AdmFName2 <> 'None' GROUP BY AdmFName2 ORDER BY NameCount DESC LIMIT 2;
SELECT T1.DistrictCode ,  (T1.`Free Meal Count (K-12)` / T1.`Enrollment (K-12)`) * 100 AS Percent_Eligible_Free_K_12 FROM `school_info` AS T1 JOIN `admin_info` AS T2 ON T1.SchoolCode = T2.SchoolCode WHERE T2.AdmFName1 = 'Alusine'
SELECT T1.AdmLName1, T2.District, T2.County, T2.SchoolName FROM SchoolAdmin AS T1 JOIN Schools AS T2 ON T1.SchID = T2.SchID WHERE T2.Charter = 40;
SELECT AdmEmail1 FROM schools WHERE County = 'San Bernardino' AND City = 'San Bernardino City Unified' AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND (SOC = 62 OR DOC = 54) UNION SELECT AdmEmail2 FROM schools WHERE County = 'San Bernardino' AND City = 'San Bernardino City Unified' AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND (SOC = 62 OR DOC = 54) UNION SELECT AdmEmail3 FROM schools WHERE County = 'San Bernardino' AND City = 'San Bernardino City Unified' AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND (SOC = 62 OR DOC = 54)
SELECT AdmEmail1 FROM table_name WHERE SchoolID = (SELECT SchoolID FROM SAT_Scores GROUP BY SchoolID ORDER BY SUM(SAT_Score) >= 1500 AND COUNT(*) DESC LIMIT 1);   Note: The above SQL query assumes that there is a column named 'SchoolID' in the table which links the administrator information to the school. Also, it's assumed that SAT scores are stored in a separate table named 'SAT_Scores'. Replace 'table_name' and 'SAT_Scores' with actual table names from your database.
SELECT COUNT(*) FROM account WHERE frequency = 'POPLATEK PO OBRATU' AND district_id IN (SELECT district_id FROM district WHERE region = 'East Bohemia')
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE city = 'Prague') AND frequency = 'POPLATEK MESICNE'
SELECT      CASE          WHEN AVG(CASE WHEN date LIKE '1995%' THEN A12 END) > AVG(CASE WHEN date LIKE '1996%' THEN A13 END) THEN '1995'         ELSE '1996'     END AS higher_unemployment_year FROM account JOIN client ON account.district_id = client.district_id;
SELECT COUNT(*) FROM (SELECT district_id FROM client WHERE gender = 'F' GROUP BY district_id HAVING AVG(salary) BETWEEN 6000 AND 10000) AS T
SELECT COUNT(*) FROM client WHERE gender = 'M' AND district_id IN (SELECT district_id FROM district WHERE region = 'North Bohemia') AND client_id IN (SELECT client_id FROM account GROUP BY client_id HAVING AVG(amount) > 8000)
SELECT T3.account_to, MAX(T2.A11) - MIN(T2.A11) AS Gap FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id JOIN transaction AS T3 ON T2.account_id = T3.account_id WHERE T1.gender = 'F' GROUP BY T1.birth_date ORDER BY T1.birth_date DESC LIMIT 1
SELECT T2.account_id FROM client AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.birth_date = (SELECT MIN(`birth_date`) FROM `client`) AND T1.client_id IN (SELECT client_id FROM(SELECT client_id, AVG(salary) AS A11 FROM(SELECT * FROM(SELECT T3.client_id, T4.salary FROM client AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id JOIN transaction AS T3 ON T2.account_id = T3.account_from JOIN salary AS T4 ON T3.transaction_id = T4.transaction_id) WHERE 1 GROUP BY client_id) ORDER BY A11 DESC LIMIT 1))
SELECT COUNT(*) FROM account WHERE frequency = 'POPLATEK TYDNE' AND account_id IN (SELECT account_id FROM client WHERE gender = 'F')
SELECT T2.client_id FROM account AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T1.frequency = 'POPLATEK PO OBRATU'
SELECT T1.account_id FROM account AS T1 JOIN transaction AS T2 ON T1.account_id = T2.account_id WHERE T1.frequency = 'POPLATEK TYDNE' AND T2.k_symbol = 'UVER' AND strftime('%Y', T2.date) = '1997' ORDER BY T2.amount ASC LIMIT 1;
SELECT T1.account_id FROM account AS T1 JOIN loan AS T2 ON T1.client_id = T2.client_id WHERE T2.duration > 12 AND T1.date BETWEEN '1993-01-01' AND '1993-12-31' ORDER BY T2.approved_amount DESC LIMIT 1;
SELECT COUNT(*) FROM client WHERE gender = 'F' AND birth_date < '1950-01-01' AND district_id IN (SELECT district_id FROM district WHERE name = 'Sokolov')
SELECT T2.account_id FROM `order` AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE STRFTIME('%Y', T2.date) = '1995' ORDER BY T2.date ASC LIMIT 1;
SELECT T2.account_id FROM `order` AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.date < '1997-01-01' AND T1.amount > 3000
SELECT T2.client_id FROM account AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id WHERE STRFTIME('%Y-%m-%d', T1.date) = '1994-03-03'
SELECT T2.date FROM orders AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.amount = 840 AND T1.order_date = '1998-10-14'
SELECT T2.district_id FROM orders AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.k_symbol = 'UVER' AND T2.date = '1994-08-25'
SELECT MAX(T1.amount) FROM transaction AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.client_id IN (SELECT client_id FROM client WHERE birth_date = '1970-12-13') AND STRFTIME('%Y-%m-%d', T2.date) = '1996-10-21'
SELECT T3.gender FROM ( (SELECT district_id, AVG(A11) AS avg_salary FROM account GROUP BY district_id ORDER BY avg_salary DESC LIMIT 1)) AS T1  JOIN client AS T2 ON T1.district_id = T2.district_id  WHERE T2.birth_date = ( SELECT MIN(birth_date) FROM client WHERE district_id IN ( SELECT district_id FROM ( (SELECT district_id, AVG(A11) AS avg_salary FROM account GROUP BY district_id ORDER BY avg_salary DESC LIMIT 1)) AS T4 ) ) ) AS T3;
SELECT T1.amount FROM `order` AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.client_id = (SELECT client_id FROM loan GROUP BY client_id ORDER BY amount DESC LIMIT 1) AND T1.date = (SELECT MIN(date) FROM `order` WHERE account_id = (SELECT account_id FROM account WHERE client_id = (SELECT client_id FROM loan GROUP BY client_id ORDER BY amount DESC LIMIT 1)))
SELECT COUNT(*) FROM client WHERE gender = 'F' AND district_id IN (SELECT district_id FROM account WHERE district_id IN (SELECT district_id FROM district WHERE name = 'Jesenik'))
SELECT T3.client_id FROM orders AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN client AS T3 ON T3.district_id = T2.district_id WHERE T1.amount = 5100 AND STRFTIME('%Y-%m-%d', T1.date) = '1998-09-02'
SELECT COUNT(*) FROM account WHERE date LIKE '1996%' AND district_id = (SELECT district_id FROM district WHERE a2 = 'Litomerice')
SELECT T1.district_id FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.account_id WHERE T1.gender = 'F' AND T1.birth_date = '1976-01-29'
SELECT T3.birth_date FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T1.amount = 98832 AND T1.date = '1996-01-03'
SELECT T1.account_id FROM `account` AS T1 JOIN `client` AS T2 ON T1.district_id = T2.district_id WHERE T2.district_id IN (SELECT district_id FROM `district` WHERE A3 = 'Prague') ORDER BY T1.date ASC LIMIT 1
SELECT CAST(SUM(IIF(T2.gender = 'M', 1, 0)) AS REAL) * 100 / COUNT(T2.client_id) FROM district AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T1.region_name = 'A3' AND T1.inhabitants = (SELECT MAX(inhabitants) FROM district WHERE region_name = 'A3')
SELECT ((SELECT SUM(t2.amount) FROM transaction AS t2 WHERE t2.account_id IN (SELECT t3.account_id FROM account AS t3 WHERE t3.client_id IN (SELECT client_id FROM client WHERE gender = 'F') AND t3.district_id IN (SELECT district_id FROM district WHERE city = 'Prague')) AND t2.date BETWEEN '1993-07-05' AND '1998-12-27') - SUM(t1.amount)) / SUM(t1.amount) * 100 AS increase_rate FROM transaction AS t1 WHERE t1.account_id IN (SELECT account_id FROM account WHERE client_id IN (SELECT client_id FROM client WHERE gender = 'F') AND district_id IN (SELECT district_id FROM district WHERE city = 'Prague')) AND t1.date BETWEEN '1993-03-22' AND '1993-07-05'
SELECT SUM(CASE WHEN T2.status  =  'A' THEN 1 ELSE 0 END) * 100 / COUNT(T2.loan_id) FROM loan AS T1 INNER JOIN contract AS T2 ON T1.loan_id  =  T2.loan_id WHERE T1.amount  =  (SELECT amount FROM loan GROUP BY amount ORDER BY count(*) DESC LIMIT 1)
SELECT (SUM(CASE WHEN T2.amount < 100000 AND T1.k_symbol = 'UVER' THEN 1 ELSE 0 END) * 100 / SUM(CASE WHEN T1.k_symbol = 'UVER' THEN 1 ELSE 0 END)) FROM transaction AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.frequency = 'POPLATEK MESICNE' AND T1.amount < 100000 AND T1.k_symbol = 'UVER';
SELECT T1.account_id, T3.name, T3.region FROM account AS T1 JOIN client AS T2 ON T1.client_id = T2.client_id JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T1.date LIKE '1993%' AND T1.frequency = 'POPLATEK PO OBRATU'
SELECT T2.account_id, T2.frequency FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id WHERE T1.district_id IN (SELECT district_id FROM district WHERE name = 'east Bohemia') AND T2.date BETWEEN '1995-01-01' AND '2000-12-31'
SELECT T1.account_id ,  T1.date FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Prachatice'
SELECT T1.district_id, T3.region FROM account AS T1 JOIN order AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T2.order_id = 4990
SELECT T1.account_id, T2.district_name, T3.region_name  FROM account AS T1  JOIN district AS T2 ON T1.district_id = T2.district_id  JOIN region AS T3 ON T2.region_id = T3.region_id  WHERE EXISTS (     SELECT *      FROM transaction AS T4      WHERE T4.account_id = T1.account_id AND T4.amount > 300000 AND T4.k_symbol = 'UVER' )
SELECT T2.loan_id ,  T3.district ,  T4.A11 FROM loan AS T1 JOIN client AS T2 ON T1.client_id = T2.client_id JOIN district AS T3 ON T2.district_id = T3.district_id JOIN (SELECT A3, AVG(A10) AS A11 FROM family GROUP BY A3) AS T4 ON T3.A3 = T4.A3 WHERE T1.duration = 60
SELECT T4.district, ((T4.A13 - T4.A12) / T4.A12) * 100 AS unemployment_rate_increment FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.account_id WHERE T2.k_symbol = 'UVER' AND T2.frequency = 'POPLATEK MESICNE' AND T2.date BETWEEN '1995-01-01' AND '1995-12-31' JOIN district AS T4 ON T1.district_id = T4.district_id WHERE T2.status = 'D'
SELECT CAST(SUM(CASE WHEN T3.name = 'Decin' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM account AS T1 JOIN client AS T2 ON T1.client_id = T2.client_id JOIN district AS T3 ON T1.district_id = T3.district_id WHERE strftime('%Y', T1.date) = '1993'
SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE'
SELECT T3.district_id FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.account_id WHERE T1.gender = 'F' GROUP BY T2.district_id ORDER BY COUNT(T2.account_id) DESC LIMIT 9
SELECT T3.A2, SUM(T1.amount) AS total_withdrawals  FROM transaction AS T1  JOIN account AS T2 ON T1.account_id = T2.account_id  JOIN district AS T3 ON T2.district_id = T3.district_id  WHERE T1.type = 'VYDAJ' AND T1.date LIKE '1996-01%'  GROUP BY T3.A2  ORDER BY total_withdrawals DESC  LIMIT 10;
SELECT COUNT(*) FROM account AS T1 JOIN client AS T2 ON T1.account_id = T2.client_id WHERE T2.district_id IN (SELECT district_id FROM district WHERE name = 'South Bohemia') AND NOT EXISTS (SELECT * FROM credit_card WHERE account_id = T1.account_id)
SELECT T1.district_id FROM account AS T1 JOIN transaction AS T2 ON T1.account_id = T2.account_id WHERE T2.k_symbol = 'UVER' AND (T2.amount > 0 OR T2.status IN('C', 'D')) GROUP BY T1.district_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT AVG(T1.amount) FROM `order` AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN client AS T3 ON T2.district_id = T3.district_id WHERE T3.gender = 'M' AND T1.k_symbol = 'UVER'
SELECT T1.A2, T1.district_id FROM district AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T1.A13 = (SELECT MAX(A13) FROM district) AND strftime('%Y', T2.birth_date) < '1981' GROUP BY T1.A2, T1.district_id ORDER BY COUNT(T2.client_id) DESC LIMIT 1
SELECT COUNT(*) FROM account WHERE district_id = (SELECT district_id FROM crime GROUP BY district_id ORDER BY SUM(A16) DESC LIMIT 1) AND strftime('%Y', date) = '1996'
SELECT COUNT(*) FROM transaction INNER JOIN account ON transaction.account_id = account.account_id WHERE transaction.operation = 'VYBER KARTOU' AND account.frequency = 'POPLATEK MESICNE' AND transaction.balance < 0;
SELECT COUNT(*) FROM transaction WHERE bank_to IN (SELECT district_id FROM district WHERE city = 'LOAN') AND date BETWEEN '1995-01-01' AND '1997-12-31' AND amount >= 250000 AND account_id IN (SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE')
SELECT COUNT(*) FROM account WHERE district_id = 1 AND frequency IN ('POPLATEK MESICNE', 'POPLATEK TYDNE', 'POPLATEK PO OBRATU')
SELECT COUNT(T2.client_id) FROM ( SELECT T3.district_id, COUNT(*) AS crime_count  FROM crime AS T1  JOIN account AS T2 ON T1.account_id = T2.account_id  JOIN client AS T3 ON T2.district_id = T3.district_id  WHERE strftime('%Y', T1.date) = '1995'  GROUP BY T3.district_id  ORDER BY crime_count DESC LIMIT 1 OFFSET 1 ) AS T4  JOIN client AS T2 ON T4.district_id = T2.district_id  WHERE T2.gender = 'M' ;
SELECT COUNT(*) FROM card WHERE card_type_code = 'GOLD' AND disposition = 'OWNER'
SELECT COUNT(*) FROM account JOIN district ON account.district_id = district.district_id WHERE district.name = 'Pisek'
SELECT T2.district_id FROM `order` AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.amount > 10000 AND strftime('%Y', T1.date) = '1997' GROUP BY T2.district_id
SELECT T1.account_id FROM account AS T1 JOIN order AS T2 ON T1.account_id = T2.account_id WHERE T2.k_symbol = 'SIPO' AND T1.district_id IN (SELECT district_id FROM district WHERE city = 'Pisek')
SELECT T1.account_id FROM account AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.client_id IN (SELECT client_id FROM card WHERE card_type_code = 'GOLD')
SELECT AVG(amount) FROM operations WHERE operation = 'VYBER KARTOU' AND strftime('%Y', date) = '2021' GROUP BY strftime('%m', date)
SELECT T2.client_id FROM transaction AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.amount < (SELECT AVG(amount) FROM transaction) AND T1.date BETWEEN '1998-01-01' AND '1998-12-31' AND T1.k_symbol = 'VYBER KARTOU' GROUP BY T2.client_id
SELECT client.client_id  FROM client  JOIN account ON client.client_id = account.account_id  WHERE client.gender = 'F'  AND EXISTS (SELECT * FROM order WHERE order.account_id = account.account_id AND order.k_symbol IN ('POJISTNE', 'LEASING'))  AND EXISTS (SELECT * FROM loan WHERE loan.account_id = account.account_id)
SELECT COUNT(*) FROM client WHERE gender = 'F' AND district_id IN (SELECT district_id FROM district WHERE region = 'South Bohemia') AND account_id IN (SELECT account_id FROM account)
SELECT T1.account_id FROM `account` AS T1 JOIN `district` AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Tabor' AND T1.frequency = 'POPLATEK MESICNE'
SELECT T2.account_type FROM district AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.A11 BETWEEN 8000 AND 9000 AND T2.account_type != 'OWNER'
SELECT COUNT(*) FROM account AS T1 JOIN transaction AS T2 ON T1.account_id = T2.account_id WHERE T2.bank_to = 'AB' AND T1.district_id IN (SELECT district_id FROM district WHERE region = 'North Bohemia')
SELECT T3.A2 FROM transaction AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.type = 'VYDAJ' GROUP BY T3.A2
SELECT AVG(T2.crime_1995) FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.date >= '1997-01-01' AND T2.crime_1995 > 4000
SELECT COUNT(*) FROM card WHERE card_type  =  'CLASSIC' AND account_id IN (SELECT account_id FROM account WHERE account_type  =  'OWNER')
SELECT COUNT(*) FROM client WHERE gender = 'M' AND district_id IN (SELECT district_id FROM district WHERE city = 'Hl.m. Praha')
SELECT CAST(SUM(CASE WHEN T2.type = 'Gold' AND strftime('%Y',T1.date) < '1998' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.account_id) FROM account AS T1 JOIN card AS T2 ON T1.account_id = T2.account_id
SELECT T2.client_id FROM `order` AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.k_symbol = 'UVER' ORDER BY T1.amount DESC LIMIT 1
SELECT A15.crimes_number  FROM A15  JOIN account ON A15.district_id = account.district_id  WHERE account.account_id = 532; 
SELECT T2.district_id FROM `order` AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.order_id = 33333
SELECT * FROM transaction WHERE client_id = 3356 AND operation = 'VYBER'
SELECT COUNT(*) FROM account WHERE frequency = 'POPLATEK TYDNE' AND amount < 200000
SELECT T2.card_type FROM client AS T1 JOIN credit_card AS T2 ON T1.client_id = T2.client_id WHERE T1.client_id = 13539
SELECT T2.A3 FROM client AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.client_id = 3541
SELECT T3.district_id FROM account AS T1 JOIN loan AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T2.status = 'A' GROUP BY T3.district_id ORDER BY COUNT(T1.account_id) DESC LIMIT 1
SELECT T1.client_id FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.account_id WHERE T2.account_id IN (SELECT account_id FROM order WHERE order_id = 32423)
SELECT * FROM order WHERE account_id IN (SELECT account_id FROM account WHERE district_id = 5)
SELECT COUNT(*) FROM account WHERE district_id = (SELECT district_id FROM district WHERE name = 'Jesenik')
SELECT client_id FROM account WHERE date >= '1997-01-01' AND frequency = 'POPLATEK MESICNE'
SELECT CAST(SUM(CASE WHEN T3.gender  =  'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T3.client_id) FROM account AS T1 JOIN district AS T2 ON T1.district_id  =  T2.district_id JOIN client AS T3 ON T3.district_id  =  T2.district_id WHERE T2.avg_salary  >  10000
SELECT ((SELECT SUM(T2.amount) FROM client AS T1 JOIN loan AS T2 ON T1.client_id = T2.client_id WHERE strftime('%Y', T2.date) = '1997' AND T1.gender = 'M') - (SELECT SUM(T2.amount) FROM client AS T1 JOIN loan AS T2 ON T1.client_id = T2.client_id WHERE strftime('%Y', T2.date) = '1996' AND T1.gender = 'M')) / (SELECT SUM(T2.amount) FROM client AS T1 JOIN loan AS T2 ON T1.client_id = T2.client_id WHERE strftime('%Y', T2.date) = '1996' AND T1.gender = 'M') * 100
SELECT COUNT(*) FROM operation WHERE operation = 'VYBER KARTOU' AND date > '1995-01-01'
SELECT      (SELECT SUM(number_of_crimes) FROM crime_statistics WHERE year = 1996 AND region = 'North Bohemia') -     (SELECT SUM(number_of_crimes) FROM crime_statistics WHERE year = 1996 AND region = 'East Bohemia') AS difference; 
SELECT COUNT(*) FROM `order` WHERE `account_id` BETWEEN 1 AND 10; SELECT COUNT(*) FROM account WHERE account_id BETWEEN 1 AND 10;
SELECT T1.frequency FROM account AS T1 JOIN transaction AS T2 ON T1.account_id = T2.account_id WHERE T1.account_id = 3 AND T2.amount = 3539 AND T2.k_symbol != ''
SELECT EXTRACT(YEAR FROM birth_date) AS birth_year FROM client WHERE client_id = 130;
SELECT COUNT(*) FROM account WHERE frequency = 'POPLATEK PO OBRATU'
SELECT SUM(t1.amount) FROM `order` AS t1 JOIN account AS t2 ON t1.account_id = t2.account_id JOIN client AS t3 ON t3.client_id = t2.district_id WHERE t3.client_id = 992 AND t1.k_symbol IN ('UVER', 'LEASING') UNION SELECT SUM(t1.amount) FROM `order` AS t1 JOIN account AS t2 ON t1.account_id = t2.account_id JOIN client AS t3 ON t3.client_id = t2.district_id WHERE t3.client_id = 992 AND t1.k_symbol IN ('POJISTNE', 'SIPO')
SELECT T2.amount , T3.gender FROM transactions AS T1 JOIN transfer AS T2 ON T1.transaction_id = T2.order_id JOIN account AS T4 ON T1.account_id = T4.account_id JOIN client AS T3 ON T4.client_id = T3.client_id WHERE T3.client_id = 4 AND T1.transaction_id = 851
SELECT T1.card_type FROM card AS T1 JOIN client AS T2 ON T1.client_id = T2.client_id WHERE T2.client_id = 9
SELECT SUM(T2.amount) FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.account_id JOIN transaction AS T3 ON T2.account_id = T3.account_id WHERE T1.client_id = 617 AND YEAR(T3.date) = 1998
SELECT T2.client_id FROM account AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND T1.district_id IN (SELECT district_id FROM district WHERE name = 'East Bohemia')
SELECT T1.client_id FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.account_id JOIN order AS T3 ON T2.account_id = T3.account_id WHERE T1.gender = 'F' ORDER BY T3.amount DESC LIMIT 3
SELECT COUNT(DISTINCT T3.client_id) FROM transaction AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN client AS T3 ON T3.district_id = T2.district_id WHERE T3.gender = 'M' AND T3.birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND T1.amount > 4000 AND T1.k_symbol = 'SIPO'
SELECT COUNT(*) FROM account WHERE district_id = (SELECT district_id FROM district WHERE city = 'Beroun') AND date > '1996-01-01'
SELECT COUNT(*) FROM client WHERE client_id IN (SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE') AND gender = 'F'
SELECT CAST(SUM(CASE WHEN T3.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T3.client_id) FROM account AS T1 JOIN transaction AS T2 ON T1.account_id = T2.account_id JOIN client AS T3 ON T1.district_id = T3.district_id WHERE T1.district_id IN (SELECT district_id FROM district WHERE city = 'Prague')
SELECT (SELECT COUNT(*) FROM client c JOIN account a ON c.client_id = a.account_id WHERE c.gender = 'M' AND a.frequency = 'POPLATEK TYDNE') * 100 / (SELECT COUNT(*) FROM client c JOIN account a ON c.client_id = a.account_id WHERE a.frequency = 'POPLATEK TYDNE')
SELECT COUNT(*) FROM ( (SELECT client_id FROM account WHERE frequency = 'POPLATEK TYDNE') INTERSECT (SELECT client_id FROM client WHERE gender = 'F') ) AS result
SELECT T2.account_id FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.duration > 24 AND T2.date < '1997-01-01' ORDER BY T1.amount ASC LIMIT 1;
SELECT T2.account_id FROM client AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' GROUP BY T2.account_id ORDER BY AVG(T1.birth_date) DESC ,  AVG(A11.salary) LIMIT 1
SELECT COUNT(*) FROM client WHERE birth_date LIKE '1920%' AND district_id IN (SELECT district_id FROM district WHERE A3 = 'East Bohemia')
SELECT COUNT(*) FROM account WHERE frequency = 'POPLATEK TYDNE' AND k_symbol = 'UVER' AND date BETWEEN DATE('now','-24 months') AND DATE('now');
SELECT AVG(t1.amount) FROM payment AS t1 JOIN account AS t2 ON t1.account_id = t2.account_id WHERE t2.frequency = 'POPLATEK PO OBRATU' AND t1.k_symbol = 'UVER' AND EXISTS ( SELECT * FROM loan WHERE loan_status IN ('C', 'D') AND loan.account_id = t1.account_id )
SELECT T1.client_id, T1.district_id FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.account_id WHERE T2.frequency = 'POPLATEK MESICNE' OR T2.frequency = 'POPLATEK PO OBRATU'
SELECT T1.client_id, (YEAR(CURDATE()) - YEAR(T1.birth_date)) AS age FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id JOIN card AS T3 ON T2.account_id = T3.account_id JOIN disposition AS T4 ON T1.client_id = T4.client_id WHERE T3.type = 'gold' AND T4.type = 'OWNER'
SELECT bond_id, COUNT(*) AS count  FROM connected  GROUP BY bond_id  ORDER BY count DESC  LIMIT 1;
SELECT COUNT(*) FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '-' AND atom.element = 'cl'
SELECT AVG(T3.element) FROM (SELECT T1.molecule_id ,  COUNT(*) AS c FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id  =  T2.bond_id WHERE T2.bond_type  =  '-' GROUP BY T1.molecule_id) AS T1 JOIN atom AS T3 ON T1.molecule_id  =  T3.molecule_id WHERE T3.element  =  'o'
SELECT AVG(T3.bond_type) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id  =  T2.molecule_id JOIN connected AS T3 ON T2.atom_id  =  T3.atom_id WHERE T1.label  =  '+' AND T3.bond_type  =  '-'
SELECT COUNT(*) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T2.element  =  'na' AND T1.label  =  '-'
SELECT T3.molecule_id FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id  =  T2.bond_id JOIN molecule AS T3 ON T2.molecule_id  =  T3.molecule_id WHERE T2.bond_type  =  '#3' AND T3.label  =  '+'
SELECT CAST(COUNT(CASE WHEN T1.element  =  'C' THEN T1.atom_id ELSE NULL END) AS REAL) * 100 / COUNT(T1.atom_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id  =  T2.atom_id2 WHERE T2.bond_type  =  '='
SELECT COUNT(*) FROM bond WHERE label = '#'
SELECT COUNT(*) FROM atom WHERE element != 'br'
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR099' AND label = '+'
SELECT T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'c' GROUP BY T1.molecule_id
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id  =  T2.atom_id OR T1.atom_id  =  T2.atom_id2 WHERE T2.bond_id  =  'TR004_8_9'
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id  =  T2.atom_id JOIN bond AS T3 ON T2.bond_id  =  T3.bond_id WHERE T3.bond_type  =  '='
SELECT T2.label FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T1.element  =  'h' GROUP BY T2.label ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.bond_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id  =  T2.atom_id OR T1.atom_id  =  T2.atom_id2 WHERE T1.element  =  'cl'
SELECT T1.atom_id, T2.atom_id2 FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id IN (SELECT bond_id FROM bond WHERE label = '-')
SELECT T1.atom_id ,  T3.atom_id2 FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN connected AS T3 ON T3.atom_id2 = T2.bond_id WHERE T1.molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-')
SELECT T2.element FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T1.label  =  '-' GROUP BY T2.element ORDER BY COUNT(*) LIMIT 1
SELECT T1.bond_id FROM `connected` AS T1 JOIN `bond` AS T2 ON T1.bond_id  =  T2.bond_id WHERE (T1.atom_id  =  'TR004_8' AND T1.atom_id2  =  'TR004_20') OR (T1.atom_id  =  'TR004_20' AND T1.atom_id2  =  'TR004_8')
SELECT T2.label FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element != 'sn' GROUP BY T2.label
SELECT COUNT(DISTINCT atom.atom_id) FROM atom JOIN connected ON atom.atom_id = connected.atom_id1 OR atom.atom_id = connected.atom_id2 WHERE atom.element IN ('i', 's') AND connected.bond_type = '-'
SELECT T1.atom_id, T2.atom_id2 FROM `connected` AS T1 JOIN `bond` AS T2 ON T1.bond_id  =  T2.bond_id WHERE T2.bond_type  =  '#'  ''  ''  ''  ''  ''  ''  ''  ''  ''  ''  ''  ''  ''  ''  ''  
SELECT T3.atom_id FROM `bond` AS T1 JOIN `connected` AS T2 ON T1.bond_id  =  T2.bond_id JOIN `atom` AS T3 ON T3.atom_id  =  T2.atom_id2 WHERE T1.molecule_id  =  'TR181'
SELECT CAST(COUNT(DISTINCT CASE WHEN T2.element != 'f' THEN T1.molecule_id ELSE NULL END) AS REAL) * 100 / COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'
SELECT CAST(SUM(CASE WHEN T2.bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_id) FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'
SELECT T2.element FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR000' GROUP BY T2.element ORDER BY COUNT(*) DESC LIMIT 3;
SELECT T1.atom_id ,  T3.atom_id FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T1.atom_id2 = T3.atom_id WHERE T2.molecule_id = 'TR001' AND T2.bond_id = 'TR001_2_6'
SELECT (SELECT COUNT(*) FROM molecule WHERE label = '+') - (SELECT COUNT(*) FROM molecule WHERE label = '-') AS difference ;
SELECT T1.atom_id ,  T1.atom_id2 FROM connected AS T1 WHERE T1.bond_id  =  'TR000_2_5'
SELECT bond_id FROM connected WHERE atom_id2 = 'TR000_2'
SELECT T1.molecule_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T2.bond_type  =  ' = ' ORDER BY T1.molecule_id LIMIT 5
SELECT CAST(COUNT(CASE WHEN T2.bond_type = '=' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T2.bond_type) AS percent FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR008' GROUP BY T1.molecule_id
SELECT CAST(COUNT(CASE WHEN T1.label = '+' THEN 1 END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM molecule AS T1 WHERE T1.label = '+' OR T1.label = '-' GROUP BY T1.label WITH ROLLUP
SELECT CAST(COUNT(CASE WHEN T1.element  =  'h' THEN T1.atom_id ELSE NULL END) AS REAL) * 100 / COUNT(T1.atom_id) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T1.molecule_id  =  'TR206' LIMIT 1
SELECT T2.bond_id FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.molecule_id = 'TR000' GROUP BY T2.bond_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.element ,  T1.label FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T1.molecule_id  =  'TR060'
SELECT T2.bond_id AS bond_type ,  T1.label FROM molecule AS T1 JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR010' GROUP BY T2.bond_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T3.molecule_id FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id  =  T2.bond_id JOIN molecule AS T3 ON T2.molecule_id  =  T3.molecule_id WHERE T2.bond_type  =  '-' AND T3.label  =  '-' ORDER BY T3.molecule_id LIMIT 3
SELECT bond_id FROM connected WHERE atom_id IN (SELECT atom_id FROM atom WHERE molecule_id = 'TR006') AND atom_id2 IN (SELECT atom_id FROM atom WHERE molecule_id = 'TR006') GROUP BY bond_id ORDER BY COUNT(*) DESC LIMIT 2;
SELECT COUNT(*) FROM connected WHERE (atom_id = 'TR009_12' OR atom_id2 = 'TR009_12') AND bond_id IN (SELECT bond_id FROM bond WHERE molecule_id = 'TR009')
SELECT COUNT(*) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T1.label  =  '+' AND T2.element  =  'br'
SELECT T1.atom_id ,  T1.atom_id2 ,  T2.bond_type FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id  =  T2.bond_id WHERE T2.bond_id  =  'TR001_6_9'
SELECT T2.molecule_id ,  T2.label FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR001_10'
SELECT COUNT(*) FROM bond WHERE label = '#'
SELECT COUNT(*) FROM connected WHERE atom_id = 'TR%_19' OR atom_id2 = 'TR%_19'
SELECT T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.molecule_id = 'TR004' GROUP BY T1.element
SELECT COUNT(*) FROM molecule WHERE label = '-'
SELECT T3.molecule_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 JOIN molecule AS T3 ON T3.molecule_id = T2.molecule_id WHERE SUBSTR(T1.atom_id, 7, 2) BETWEEN '21' AND '25' AND T3.label = '+' GROUP BY T3.molecule_id
SELECT T3.bond_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id  =  T2.atom_id OR T1.atom_id  =  T2.atom_id2 JOIN bond AS T3 ON T3.bond_id  =  T2.bond_id WHERE T1.element  =  'p' INTERSECT SELECT T3.bond_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id  =  T2.atom_id OR T1.atom_id  =  T2.atom_id2 JOIN bond AS T3 ON T3.bond_id  =  T2.bond_id WHERE T1.element  =  'n'
SELECT T1.label FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T2.bond_type  =  ' =' ORDER BY COUNT(*) DESC LIMIT 1
SELECT AVG(T3.bond_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id  =  T2.atom_id OR T1.atom_id  =  T2.atom_id2 WHERE T1.element  =  'i' GROUP BY T1.atom_id
SELECT T1.bond_id ,  T2.bond_type FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id  =  T2.bond_id WHERE SUBSTR(T1.atom_id , 7 , 2) + 0 = 45
SELECT T1.element FROM atom AS T1 WHERE T1.atom_id NOT IN (SELECT T2.atom_id FROM connected AS T2) AND T1.atom_id NOT IN (SELECT T3.atom_id2 FROM connected AS T3)
SELECT T3.atom_id FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id  =  T2.bond_id JOIN atom AS T3 ON T2.atom_id2  =  T3.atom_id WHERE T1.molecule_id  =  'TR041' AND T1.bond_type  =  '#';
SELECT T2.element FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id  =  T2.atom_id WHERE T1.bond_id  =  'TR144_8_19' UNION SELECT T3.element FROM connected AS T1 JOIN atom AS T3 ON T1.atom_id2  =  T3.atom_id WHERE T1.bond_id  =  'TR144_8_19'
SELECT T1.molecule_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T1.label  =  '+' AND T2.bond_type  =  ' = ' GROUP BY T1.molecule_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.element FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T1.label  =  '+' GROUP BY T2.element ORDER BY COUNT(*) LIMIT 1
SELECT T1.atom_id2 FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id  =  T2.atom_id WHERE T2.element  =  'pb' UNION SELECT T1.atom_id FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id2  =  T2.atom_id WHERE T2.element  =  'pb'
SELECT T3.element FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id  =  T2.bond_id JOIN atom AS T3 ON T1.atom_id2  =  T3.atom_id WHERE T2.bond_type  =  '#';
SELECT CAST(COUNT(T1.bond_id) AS REAL) / ( SELECT COUNT(T3.atom_id) FROM atom AS T2 JOIN connected AS T3 ON T2.atom_id = T3.atom_id WHERE T2.element IN ( SELECT T4.element FROM atom AS T4 GROUP BY T4.element ORDER BY COUNT(*) DESC LIMIT 1 ) ) FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T3.atom_id = T2.atom_id2 WHERE T3.element IN ( SELECT T4.element FROM atom AS T4 GROUP BY T4.element ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT CAST(COUNT(CASE WHEN T3.label = '+' THEN T2.bond_id END) AS REAL) * 100 / COUNT(T2.bond_id) FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '-' JOIN molecule AS T3 ON T2.molecule_id = T3.molecule_id GROUP BY T2.bond_type ORDER BY COUNT(T2.bond_id) DESC LIMIT 1
SELECT COUNT(*) FROM atom WHERE element IN ('c' ,  'h')
SELECT T1.atom_id2 FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id2  =  T2.atom_id WHERE T2.element  =  'S'
SELECT T2.bond_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id  =  T2.atom_id WHERE T1.element  =  'sn' UNION SELECT T2.bond_id2 FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id  =  T2.atom_id2 WHERE T1.element  =  'sn'
SELECT COUNT(DISTINCT T1.element) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id  =  T2.atom_id JOIN bond AS T3 ON T2.bond_id  =  T3.bond_id WHERE T3.bond_type  =  '-'
SELECT COUNT(*) FROM atom JOIN connected ON atom.atom_id = connected.atom_id2 WHERE connected.bond_id IN(SELECT bond_id FROM bond WHERE label = '#') AND atom.element IN('p', 'br')
SELECT T2.bond_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T1.label  =  '+'
SELECT T2.molecule_id FROM connected AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '-' AND T1.bond_type = 'single' GROUP BY T2.molecule_id
SELECT CAST(COUNT(CASE WHEN T1.element = 'cl' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.atom_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id2 WHERE T2.bond_id IN (SELECT bond_id FROM bond WHERE label = '-')
SELECT T1.label FROM molecule AS T1 WHERE T1.molecule_id IN ('TR000', 'TR001', 'TR002')
SELECT T1.molecule_id FROM molecule AS T1 WHERE T1.label = '-'
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR030' AND label = '+'
SELECT T2.bond_id FROM molecule AS T1 JOIN connected AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T1.molecule_id BETWEEN 'TR000' AND 'TR050'
SELECT T2.element ,  T3.element FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id = T2.atom_id JOIN atom AS T3 ON T1.atom_id2 = T3.atom_id WHERE T1.bond_id = 'TR001_10_11'
SELECT COUNT(*) FROM atom JOIN connected ON atom.atom_id = connected.atom_id2 WHERE atom.element = 'i'
SELECT T2.label FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T1.element  =  'ca' GROUP BY T2.label ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) > 0 FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 WHERE T2.bond_id = 'TR001_1_8' AND (T1.element = 'cl' OR T1.element = 'c') GROUP BY T1.element HAVING COUNT(*) > 1
SELECT T3.molecule_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id  =  T2.atom_id JOIN molecule AS T3 ON T3.molecule_id  =  T1.molecule_id WHERE T1.element  =  'c' AND T2.bond_type  =  '#' AND T3.label  =  '-' LIMIT 2
SELECT CAST(COUNT(CASE WHEN T1.element = 'cl' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.element) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'
SELECT T2.element FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR001'
SELECT T1.molecule_id FROM `bond` AS T1 JOIN `connected` AS T2 ON T1.bond_id  =  T2.bond_id WHERE T1.bond_type  =  ' = '
SELECT T1.atom_id ,  T2.atom_id2 FROM connected AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '#' GROUP BY T1.atom_id ,  T2.atom_id2
SELECT T3.element FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id  =  T2.bond_id JOIN atom AS T3 ON T1.atom_id2  =  T3.atom_id WHERE T1.bond_id  =  'TR000_1_2' UNION SELECT T4.element FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id  =  T2.bond_id JOIN atom AS T4 ON T1.atom_id  =  T4.atom_id WHERE T1.bond_id  =  'TR000_1_2'
SELECT COUNT(*) FROM molecule WHERE label = '-' AND molecule_id IN (SELECT molecule_id FROM bond WHERE bond_type = 'single')
SELECT T2.label FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T1.bond_id  =  'TR001_10_11'
SELECT T2.bond_id ,  T3.label FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id  =  T2.atom_id JOIN bond AS T3 ON T2.bond_id  =  T3.bond_id WHERE T3.bond_type  =  '#' ;
SELECT T3.element ,  COUNT(*) FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id  =  T2.bond_id JOIN atom AS T3 ON T1.atom_id2  =  T3.atom_id WHERE T2.molecule_id IN(SELECT molecule_id FROM molecule WHERE label  =  '+') AND SUBSTR(T1.atom_id , 7 , 1)  =  '4' GROUP BY T3.element
SELECT CAST(SUM(CASE WHEN T1.element = 'h' THEN 1 ELSE 0 END) AS REAL) / COUNT(T1.atom_id), T2.label FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR006'
SELECT T2.label FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T1.element  =  'ca'
SELECT T2.bond_type FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id  =  T2.atom_id OR T1.atom_id  =  T2.atom_id2 WHERE T1.element  =  'c'
SELECT T3.element FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T1.bond_id = 'TR001_10_11' UNION SELECT T4.element FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T4 ON T2.atom_id2 = T4.atom_id WHERE T1.bond_id = 'TR001_10_11'
SELECT CAST(SUM(CASE WHEN T2.bond_type  = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id  =  T2.molecule_id
SELECT CAST(COUNT(CASE WHEN T2.bond_type  =  ' = ' THEN T1.bond_id ELSE NULL END) AS REAL) * 100 / COUNT(T1.bond_id) FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T2.molecule_id  =  'TR047'
SELECT T3.label FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id = T2.atom_id JOIN molecule AS T3 ON T2.molecule_id = T3.molecule_id WHERE T1.atom_id = 'TR001_1'
SELECT T2.label FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T1.molecule_id  =  'TR151'
SELECT T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T2.molecule_id  =  'TR151'
SELECT COUNT(*) FROM molecule WHERE label = '+'
SELECT atom.atom_id FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.element = 'c' AND SUBSTR(atom.molecule_id, 3, 3) BETWEEN 10 AND 50;
SELECT COUNT(*) FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '+'
SELECT T2.bond_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T2.bond_type  =  ' =' AND T1.label  =  '+'
SELECT COUNT(*) FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.element = 'h' AND molecule.label = '+'
SELECT T3.molecule_id FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T1.bond_id = T3.bond_id WHERE T1.atom_id = 'TR000_1' AND T1.bond_id = 'TR000_1_2'
SELECT T1.atom_id FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T1.element  =  'c' AND T2.label  =  '-'
SELECT CAST(COUNT(CASE WHEN T2.element = 'h' THEN T1.molecule_id ELSE NULL END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'
SELECT T1.label FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T2.molecule_id  =  'TR124'
SELECT atom_id FROM atom WHERE molecule_id = 'TR186'
SELECT bond_type FROM bond WHERE bond_id  =  'TR007_4_19'
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id  =  T2.atom_id OR T1.atom_id  =  T2.atom_id2 WHERE T2.bond_id  =  'TR001_2_4'
SELECT COUNT(*) ,  T3.label FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id  =  T2.bond_id JOIN molecule AS T3 ON T2.molecule_id  =  T3.molecule_id WHERE T2.bond_type  =  ' = ' AND T2.molecule_id  =  'TR006'
SELECT T2.molecule_id ,  T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T2.label  =  '+'
SELECT T2.bond_id ,  T1.atom_id ,  T3.atom_id2 FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id  =  T2.atom_id JOIN connected AS T3 ON T2.atom_id2  =  T3.atom_id WHERE T2.bond_type  =  '-'
SELECT T3.molecule_id ,  T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id2 JOIN molecule AS T3 ON T3.molecule_id = T2.molecule_id WHERE T2.bond_id IN(SELECT bond_id FROM bond WHERE label = '#')
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id  =  T2.atom_id OR T1.atom_id  =  T2.atom_id2 WHERE T2.bond_id  =  'TR000_2_3'
SELECT COUNT(*) FROM connected JOIN atom AS atom1 ON connected.atom_id = atom1.atom_id JOIN atom AS atom2 ON connected.atom_id2 = atom2.atom_id WHERE atom1.element = 'cl' OR atom2.element = 'cl'
SELECT T1.atom_id ,  COUNT(*) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id2 WHERE T1.molecule_id = 'TR346' GROUP BY T1.atom_id
SELECT COUNT(DISTINCT T3.molecule_id) ,  SUM(CASE WHEN T2.label = '+' THEN 1 ELSE 0 END) FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id  =  T2.bond_id JOIN molecule AS T3 ON T2.molecule_id  =  T3.molecule_id WHERE T2.bond_type  =  ' = '
SELECT COUNT(DISTINCT T3.molecule_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element != 's' AND T3.bond_type != '=' GROUP BY T3.molecule_id HAVING COUNT(*) > 0
SELECT T2.label FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_id = 'TR001_2_4'
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR001'
SELECT COUNT(*) FROM bond WHERE bond_type = '-'
SELECT T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'cl' AND T1.label = '+'
SELECT T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'c' AND T1.label = '-' GROUP BY T1.molecule_id
SELECT CAST(SUM(CASE WHEN T1.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'cl'
SELECT T2.molecule_id FROM `bond` AS T1 JOIN `molecule` AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_id = 'TR001_1_7'
SELECT COUNT(DISTINCT T1.element) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 WHERE T2.bond_id = 'TR001_3_4'
SELECT T2.bond_type FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T1.atom_id = 'TR000_1' AND T1.atom_id2 = 'TR000_2'
SELECT T1.molecule_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.atom_id2 = 'TR000_4' AND T2.atom_id = 'TR000_2'
SELECT T1.element FROM atom AS T1 WHERE T1.atom_id = 'TR000_1'
SELECT T1.label FROM molecule AS T1 WHERE T1.molecule_id = 'TR000'
SELECT CAST(COUNT(CASE WHEN T2.bond_type = '-' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.atom_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id
SELECT COUNT(DISTINCT T1.molecule_id) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' AND T1.element = 'n'
SELECT T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id JOIN connected AS T3 ON T2.atom_id = T3.atom_id JOIN bond AS T4 ON T3.bond_id = T4.bond_id WHERE T2.element = 's' AND T4.bond_type = '='
SELECT T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-' GROUP BY T1.molecule_id HAVING COUNT(T1.molecule_id) > 5
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '=' AND T1.molecule_id = 'TR024' GROUP BY T1.element
SELECT T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' GROUP BY T1.molecule_id ORDER BY COUNT(T2.atom_id) DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN T4.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T4.molecule_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id JOIN molecule AS T4 ON T1.molecule_id = T4.molecule_id WHERE T1.element = 'h' AND T3.bond_type = '#'
SELECT COUNT(*) FROM molecule WHERE label = '+'
SELECT COUNT(*) FROM bond WHERE bond_type = '-' AND molecule_id BETWEEN 'TR004' AND 'TR010';
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR008' AND element = 'c'
SELECT T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR004_7' AND T2.label = '-'
SELECT COUNT(DISTINCT T3.molecule_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id2 JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'o' AND T3.bond_type = '='
SELECT COUNT(*) FROM molecule  JOIN bond ON molecule.molecule_id = bond.molecule_id  WHERE bond.bond_type = '#' AND molecule.label = '-'
SELECT T1.element, T3.bond_type FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.molecule_id = 'TR002' GROUP BY T1.element, T3.bond_type
SELECT T3.atom_id FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id  =  T2.bond_id JOIN atom AS T3 ON T3.atom_id  =  T2.atom_id2 WHERE T1.bond_type  =  ' =' AND T3.element  =  'c' AND T1.molecule_id  =  'TR012'
SELECT T1.atom_id FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' AND T1.element = 'o'
SELECT name FROM cards WHERE cardkingdomFoilId IS NOT NULL AND cardkingdomId IS NOT NULL
SELECT * FROM cards WHERE borderColor = 'borderless' AND (cardKingdomFoilId IS NULL OR cardKingdomId IS NULL)
SELECT cardName FROM cards WHERE faceConvertedManaCost = (SELECT MAX(faceConvertedManaCost) FROM cards)
SELECT c.name FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.frameVersion = '2015' AND l.format = 'commander' AND l.status = 'Legal' AND c.edhrecRank < 100;
SELECT c.name FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.rarity = 'mythic' AND l.status = 'Banned' AND l.format = 'gladiator'
SELECT L.status FROM legalities AS L JOIN cards AS C ON L.uuid = C.uuid WHERE C.types = 'Artifact' AND C.side IS NULL AND L.format = 'vintage'
SELECT c.uuid, c.artist FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE (c.power = '*' OR c.power IS NULL) AND l.format = 'commander' AND l.status = 'Legal'
SELECT c.cardId, r.text, c.hasContentWarning FROM cards AS c JOIN rulings AS r ON c.uuid = r.uuid WHERE c.artist = 'Stephen Daniele'
SELECT T2.text FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Sublime Epiphany' AND T1.number = '74s'
SELECT c.name, c.artist, c.isPromo FROM cards AS c JOIN rulings AS r ON c.uuid = r.uuid GROUP BY c.uuid ORDER BY COUNT(r.uuid) DESC LIMIT 1;
SELECT DISTINCT c.foreignNames->>'language' FROM cards AS c WHERE c.name = 'Annul' AND c.number = '29';
SELECT name FROM cards WHERE lang = 'Japanese'
SELECT CAST(SUM(CASE WHEN language = 'Chinese Simplified' THEN 1 ELSE 0 END) AS REAL) / COUNT(*) * 100 FROM cards WHERE language IS NOT NULL
SELECT T1.set_name, T1.total_set_size FROM sets AS T1 JOIN cards AS T2 ON T1.set_code = T2.set WHERE T2.language = 'Italian' GROUP BY T1.set_name;
SELECT COUNT(DISTINCT T1.types) FROM cards AS T1 JOIN artworks AS T2 ON T1.uuid = T2.cardid WHERE T2.artist = 'Aaron Boyd'
SELECT keywords FROM cards WHERE name = 'Angel of Mercy'
SELECT COUNT(*) FROM cards WHERE power = '*'
SELECT T1.promoTypes FROM cards AS T1 WHERE T1.name = 'Duress'
SELECT T1.border_color FROM cards AS T1 WHERE T1.name = 'Ancestor''s Chosen'
SELECT originalType FROM cards WHERE name = 'Ancestor''s Chosen'
SELECT s.language FROM sets AS s JOIN cards AS c ON s.set = c.set WHERE c.name = 'Angel of Mercy'
SELECT COUNT(*) FROM legalities JOIN cards ON legalities.uuid = cards.uuid WHERE legalities.status = 'Restricted' AND cards.isTextless = 0;
SELECT rulings.text FROM cards JOIN rulings ON cards.uuid = rulings.uuid WHERE cards.name = 'Condemn'
SELECT COUNT(*) FROM legalities JOIN cards ON legalities.uuid = cards.uuid WHERE legalities.status = 'Restricted' AND cards.isStarter = 1;
SELECT T2.status FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Cloudchaser Eagle'
SELECT types FROM cards WHERE name = 'Benalish Knight'
SELECT T2.format FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Benalish Knight'
SELECT T1.artist FROM cards AS T1 JOIN card_art_details AS T2 ON T1.uuid = T2.card_uuid WHERE T2.language = 'Phyrexian' GROUP BY T1.artist
SELECT (COUNT(CASE WHEN borderColor = 'borderless' THEN id END) * 100.0 / COUNT(id)) AS percentage FROM cards
SELECT COUNT(*) FROM cards WHERE lang = 'German' AND is_reprint = 1;
SELECT COUNT(*) FROM cards WHERE borderColor = 'borderless' AND languages = 'Russian'
SELECT COUNT(CASE WHEN T1.language = 'French' THEN 1 ELSE NULL END) * 100 / COUNT(*) AS percentage FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.isStorySpotlight = 1;
SELECT COUNT(*) FROM cards WHERE toughness = '99'
SELECT name FROM cards WHERE artist = 'Aaron Boyd'
SELECT COUNT(*) FROM cards WHERE "borderColor" = 'black' AND "availability" = 'mtgo';
SELECT uuid FROM cards WHERE convertedManaCost = 0;
SELECT T1.layout FROM cards AS T1 JOIN keywords AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Flying'
SELECT COUNT(*) FROM cards WHERE types = 'Summon - Angel' AND NOT subtypes = 'Angel'
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;
SELECT id FROM cards WHERE duelDeck = 'a'
SELECT edhrec_rank FROM cards WHERE frame = '2015'
SELECT T1.artist FROM cards AS T1 JOIN languages AS T2 ON T1.uuid = T2.card_uuid WHERE T2.language = 'Chinese Simplified' GROUP BY T1.artist
SELECT name FROM cards WHERE availability = 'paper' AND languages = ARRAY['Japanese'] GROUP BY name HAVING COUNT(*) = 1;
SELECT COUNT(*) FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.status = 'Banned' AND T1.borderColor = 'white'
SELECT C.uuid, FD.language FROM cards AS C JOIN legalities AS L ON C.uuid = L.uuid JOIN card_foreign_data AS FD ON C.uuid = FD.uuid WHERE L.format = 'legacy' GROUP BY C.uuid, FD.language;
SELECT rulings FROM cards WHERE name = 'Beacon of Immortality' LIMIT 1;
SELECT COUNT(c.uuid), l.status FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.frameVersion = 'future' AND l.status = 'Legal' GROUP BY l.status;
SELECT c.name, c.color_identity FROM cards AS c WHERE c.set_code = 'OGW'
SELECT C.name, C.languages  FROM cards AS C  JOIN translations AS T ON C.uuid = T.cardUUID  WHERE C.set = '10E' AND C.convertedManaCost = 5;
SELECT c.name, r.rulings FROM cards AS c JOIN rulings AS r ON c.uuid = r.uuid WHERE c.originalTypes LIKE '%Creature - Elf%'
SELECT T1.colors ,  T2.format FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.id BETWEEN 1 AND 20 GROUP BY T1.colors ,  T2.format
SELECT c.name FROM cards AS c WHERE c.originalType = 'Artifact' AND c.colors = 'B' AND EXISTS (SELECT 1 FROM cardForeignData AS f WHERE f.cardId = c.uuid AND f.language != 'en')
SELECT c.name FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.rarity = 'uncommon' ORDER BY c.rulings_date ASC LIMIT 3;
SELECT COUNT(*) FROM cards WHERE artist = 'John Avon' AND cardKingdomId IS NOT NULL AND cardKingdomFoilId IS NOT NULL
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND kingdomFoilId IS NOT NULL AND kingdomId IS NOT NULL
SELECT COUNT(*) FROM cards WHERE artist = 'UDON' AND availability = 'mtgo' AND hand = '-1'
SELECT COUNT(*) FROM cards WHERE frameVersion = '1993' AND availability = 'paper' AND hasContentWarning = 1;
SELECT manaCost FROM cards WHERE layout = 'normal' AND frameVersion = '2003' AND borderColor = 'black' AND availability = 'mtgo,paper'
SELECT SUM(CAST(REPLACE(manaCost, '{', '') AS INT)) FROM cards WHERE artist = 'Rob Alexander' AND manaCost IS NOT NULL GROUP BY artist
SELECT DISTINCT types FROM cards WHERE availability = 'arena' AND types IS NOT NULL;
SELECT T1.setCode FROM sets AS T1 JOIN cards AS T2 ON T1.setId = T2.set WHERE T2.foreignNames LIKE '%es'
SELECT CAST(SUM(CASE WHEN isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) / COUNT(id) * 100 FROM cards WHERE frameEffects = 'legendary'
SELECT CAST(SUM(CASE WHEN c.isStoryHighlight = 1 AND c.isTextless = 0 THEN 1 ELSE 0 END) AS REAL) / COUNT(c.id) * 100 AS percentage, c.id FROM cards AS c WHERE c.isStoryHighlight = 1 AND c.isTextless = 0 GROUP BY c.id
SELECT T1.name ,  SUM(CASE WHEN T2.language = 'Spanish' THEN 1 ELSE 0 END) * 100 / COUNT(T2.id) FROM cards AS T1 JOIN printings AS T2 ON T1.uuid = T2.card_uuid GROUP BY T1.name
SELECT T2.name FROM sets AS T1 JOIN languages AS T2 ON T1.setCode = T2.setCode WHERE T1.baseSetSize = 309 GROUP BY T2.name
SELECT COUNT(*) FROM cards WHERE block = 'Commander' AND code IN (SELECT DISTINCT code FROM sets WHERE language = 'Portuguese (Brazil)')
SELECT c.uuid FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.types LIKE '%Creature%' AND l.status = 'Legal' GROUP BY c.uuid, l.status;
SELECT types FROM cards WHERE lang = 'German' AND types IS NOT NULL
SELECT COUNT(*) FROM cards WHERE (power IS NULL OR power = '*') AND text LIKE '%triggered ability%'
SELECT COUNT(*) FROM cards WHERE uuid IN (SELECT uuid FROM legalities WHERE format = 'premodern') AND ruling = 'This is a triggered mana ability.' AND side IS NULL;
SELECT c.uuid FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.artist = 'Erica Yang' AND l.format = 'pauper' AND c.availability = 'paper'
SELECT T1.artist FROM cards AS T1 WHERE T1.text = 'Das perfekte Gegenmittel zu einer dichten Formation'
SELECT foreignNames FROM cards WHERE type = 'Creature' AND layout = 'normal' AND borderColor = 'black' AND artist = 'Matthew D. Wilson' AND EXISTS (SELECT * FROM cardForeignData WHERE cards.uuid = cardForeignData.parentCardId AND cardForeignData.language = 'French')
SELECT COUNT(*) FROM cards c JOIN rulings r ON c.uuid = r.card_uuid WHERE c.rarity = 'rare' AND r.date = '2007-02-01'
SELECT T2.language FROM sets AS T1 JOIN translations AS T2 ON T1.code = T2.setCode WHERE T1.baseSetSize = 180 AND T1.block = 'Ravnica'
SELECT COUNT(CASE WHEN C.hasContentWarning = 0 THEN 1 ELSE NULL END) * 100 / COUNT(*) AS percentage FROM cards AS C JOIN legalities AS L ON C.uuid = L.uuid WHERE L.format = 'commander' AND L.status = 'Legal';
SELECT CAST(SUM(CASE WHEN T1.language = 'French' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 JOIN card_details AS T2 ON T1.uuid = T2.uuid WHERE T2.power IS NULL OR T2.power = '*'
SELECT CAST(SUM(CASE WHEN c.set_type = 'expansion' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(c.uuid) FROM cards AS c WHERE c.language = 'Japanese'
SELECT T1.printing FROM cards AS T1 WHERE T1.artist = 'Daren Bader'
SELECT COUNT(*) FROM cards WHERE borderColor = 'borderless' AND edhrecRank > 12000;
SELECT COUNT(*) FROM cards WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1;
SELECT c.name FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.power IS NULL OR c.power = '*' AND c.promoTypes LIKE '%arenaleague%' GROUP BY c.name ORDER BY c.name LIMIT 3;
SELECT language FROM cards WHERE multiverseid = 149934
SELECT l.uuid AS id1, l2.uuid AS id2 FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid JOIN cards AS c2 ON c2.name = c.name AND c2.set = c.set AND c2.number IN (SELECT number FROM cards WHERE name = c.name AND set = c.set AND isFoil = TRUE) JOIN legalities AS l2 ON c2.uuid = l2.uuid WHERE c.isFoil = FALSE AND c2.isFoil = TRUE AND c.supertypes LIKE '%Basic%' AND c2.supertypes LIKE '%Basic%' AND c.types LIKE '%Land%' AND c2.types LIKE '%Land%' ORDER BY l.uuid, l2.uuid LIMIT 3;
SELECT CAST(SUM(CASE WHEN isTextless = 1 AND layout = 'normal' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards WHERE layout = 'normal'
SELECT number FROM cards WHERE type_line NOT LIKE '% // %' AND (subtypes @> '["Angel"]' OR subtypes @> '["Wizard"]') AND subtypes ?| '["Angel","Wizard"]'
SELECT name FROM sets WHERE mtgoCode IS NULL OR mtgoCode = '' ORDER BY name LIMIT 3;
SELECT DISTINCT language FROM cards WHERE mcmName = 'Archenemy' AND setCode = 'ARC'
SELECT T1.name, T1.foreignNames FROM cards AS T1 JOIN sets AS T2 ON T1.set = T2.code WHERE T2.id = 5
SELECT language, expansion_type FROM sets WHERE id = 206
SELECT T1.set_id, T1.set_name FROM sets AS T1 JOIN cards AS T2 ON T1.set_id = T2.set_id WHERE T1.block = 'Shadowmoor' AND T2.lang = 'Italian' GROUP BY T1.set_id, T1.set_name ORDER BY T1.set_name LIMIT 2;
SELECT c.setId FROM cards AS c WHERE c.isForeignOnly = TRUE AND c.isFoilOnly = TRUE AND c.language = 'Japanese'
SELECT setCode FROM cards WHERE language = 'Russian' GROUP BY setCode ORDER BY COUNT(*) DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN c.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(c.uuid) FROM cards AS c WHERE c.language = 'Chinese Simplified' AND c.isOnlineOnly = 1;
SELECT COUNT(*) FROM sets WHERE language = 'Japanese' AND (mtgoCode IS NULL OR mtgoCode = '')
SELECT COUNT(*), uuid FROM cards WHERE borderColor = 'black' GROUP BY uuid;
SELECT COUNT(*), uuid FROM cards WHERE frameEffects = 'extendedart' GROUP BY uuid;
SELECT c.name FROM cards AS c WHERE c.isFullArt = 1 AND c.borderColor = 'black'
SELECT language FROM sets WHERE set_id = '174'
SELECT set_name FROM sets WHERE set_code = 'ALL'
SELECT foreignData.language FROM cards AS card JOIN foreignData ON card.uuid = foreignData.uuid WHERE card.name = 'A Pedra Fellwar' GROUP BY foreignData.language
SELECT set_code FROM sets WHERE release_date = '2007-07-13' LIMIT 1;
SELECT C.baseSetSize, C.setCode FROM sets AS S JOIN cards AS C ON S.setName = C.set WHERE S.block = 'Masques' OR S.block = 'Mirage' GROUP BY C.baseSetSize, C.setCode;
SELECT setCode FROM sets WHERE setType = 'expansion'
SELECT C.foreignNames, C.types FROM cards AS C WHERE C.watermark = 'boros'
SELECT c.lang, c.flavor_text, c.types FROM cards AS c WHERE c.watermark = 'colorpie'
SELECT CAST(SUM(CASE WHEN convertedManaCost = 10 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards WHERE name = 'Abyssal Horror'
SELECT T1.setCode FROM sets AS T1 JOIN cards AS T2 ON T1.setId = T2.set WHERE T2.supertypes LIKE '%Commander%' GROUP BY T1.setCode
SELECT C.foreignNames, C.types FROM cards AS C WHERE C.watermark = 'abzan'
SELECT C.types FROM cards AS C WHERE C.watermark = 'azorius'
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;
SELECT COUNT(*) FROM cards WHERE availability LIKE '%paper%' AND hand_size > 0
SELECT name FROM cards WHERE isTextless = 0;
SELECT uncmc FROM cards WHERE name = 'Ancestor''s Chosen' LIMIT 1;
SELECT COUNT(*) FROM cards WHERE border_color = 'white' AND (power = '*' OR power IS NULL)
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL
SELECT types FROM cards WHERE name = 'Molimo, Maro-Sorcerer'
SELECT T1.purchaseUrls FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.promoTypes = 'bundle' GROUP BY T1.purchaseUrls
SELECT COUNT(DISTINCT c.artist) FROM cards AS c WHERE c.border_color = 'black' AND c.availability LIKE '%arena,mtgo%'
SELECT name FROM cards WHERE name IN ('Serra Angel', 'Shrine Keeper') ORDER BY convertedManaCost DESC LIMIT 1;
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer' LIMIT 1;
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3;
SELECT T1.set_name FROM sets AS T1 JOIN cards AS T2 ON T1.set_code = T2.set WHERE T2.name = 'Ancestor''s Chosen' AND T2.printings ->> '$[*].language' LIKE '%Italian%'
SELECT COUNT(*) FROM translations WHERE cardname = 'Angel of Mercy'
SELECT name FROM cards WHERE sets ->> 'name' = 'Hauptset Zehnte Edition' AND sets ->> 'translation' = 'Hauptset Zehnte Edition'
SELECT EXISTS (SELECT * FROM cards WHERE name = 'Ancestor''s Chosen' AND language = 'Korean') AS has_korean_version;
SELECT COUNT(*) FROM cards WHERE `set` = 'Hauptset Zehnte Edition' AND artist = 'Adam Rex'
SELECT COUNT(*) FROM sets WHERE name = 'Hauptset Zehnte Edition'
SELECT T2.translation FROM sets AS T1 JOIN translations AS T2 ON T1.uuid = T2.set_uuid WHERE T1.name = 'Eighth Edition' AND T2.language = 'Chinese Simplified'
SELECT COUNT(*) > 0 FROM cards WHERE name = 'Angel of Mercy' AND mtgoCode IS NOT NULL
SELECT T1.releaseDate FROM sets AS T1 JOIN cards AS T2 ON T1.setCode = T2.set WHERE T2.name = 'Ancestor''s Chosen'
SELECT T1.type FROM sets AS T1 JOIN translations AS T2 ON T1.set_id = T2.set_id WHERE T2.translation = 'Hauptset Zehnte Edition'
SELECT COUNT(*) FROM sets WHERE block = 'Ice Age' AND language = 'Italian' AND translation IS NOT NULL;
SELECT C.name FROM cards AS C WHERE C.name = 'Adarkar Valkyrie' AND C.isForeignOnly = 1;
SELECT COUNT(*) FROM sets WHERE language = 'Italian' AND baseSetSize < 100 AND translation IS NOT NULL
SELECT COUNT(*) FROM cards WHERE set_name = 'Coldsnap' AND border_color = 'black'
SELECT c.name FROM cards AS c JOIN card_sets AS cs ON c.uuid = cs.card_uuid WHERE cs.set_name = 'Coldsnap' ORDER BY c.converted_mana_cost DESC LIMIT 1;
SELECT T2.artist FROM cards AS T1 JOIN card_artists AS T2 ON T1.uuid = T2.uuid WHERE T1.set = 'Coldsnap' AND T2.artist IN ('Jeremy Jarvis', 'Aaron Miller','Chippy') GROUP BY T2.artist
SELECT * FROM cards WHERE name = 'Coldsnap' AND number = 4 LIMIT 1;
SELECT COUNT(*) FROM cards WHERE set = 'Coldsnap' AND (power = '*' OR power IS NULL) AND convertedManaCost > 5
SELECT t1.flavortext FROM `cards` AS t1 WHERE t1.name = 'Ancestor''s Chosen' AND t1.language = 'Italian'
SELECT DISTINCT c.foreignData.language FROM cards AS c WHERE c.name = 'Ancestor''s Chosen' AND c.flavorText IS NOT NULL
SELECT cards.name, cards.type_line  FROM cards  JOIN translations ON cards.uuid = translations.uuid  WHERE cards.name = 'Ancestor''s Chosen' AND translations.language = 'German'
SELECT rulings_it FROM cards WHERE name = 'Coldsnap' AND language = 'Italian' GROUP BY rulings_it ORDER BY rulings_it ASC
SELECT c.name_italian FROM cards AS c WHERE c.set_name = 'Coldsnap' AND c.language = 'Italian' ORDER BY c.converted_mana_cost DESC LIMIT 1;
SELECT rulings.date FROM rulings JOIN cards ON rulings.uuid = cards.uuid WHERE cards.name = 'Reminisce'
SELECT CAST(COUNT(CASE WHEN c.convertedManaCost = 7 THEN c.uuid END) AS REAL) * 100 / COUNT(c.uuid) FROM cards AS c WHERE c.set = 'Coldsnap'
SELECT CAST(COUNT(CASE WHEN T1.cardKingdomFoilId IS NOT NULL AND T1.cardKingdomId IS NOT NULL THEN 1 END) AS REAL) * 100 / COUNT(T1.uuid) FROM cards AS T1 JOIN sets AS T2 ON T1.sets = T2.code WHERE T2.name = 'Coldsnap'
SELECT setCode FROM sets WHERE releaseDate = '2017-07-14' LIMIT 1;
SELECT keyruneCode FROM sets WHERE code = 'PKHC'
SELECT mcmId FROM sets WHERE code = 'SS2'
SELECT mcmName FROM sets WHERE releaseDate = '2017-06-09' LIMIT 1;
SELECT type FROM sets WHERE name = 'From the Vault: Lore'
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized'
SELECT c.name, r.text, CASE WHEN c.hasContentWarning = 1 THEN 'Yes' ELSE 'No' END AS hasMissingOrDegradedProperties FROM cards AS c JOIN rulings AS r ON c.uuid = r.uuid WHERE c.artist = 'Jim Pavelec';
SELECT sets.releaseDate FROM sets JOIN cards ON sets.code = cards.set WHERE cards.name = 'Evacuation'
SELECT baseSetSize FROM sets WHERE name = 'Alara Reborn' AND translations @> '[{"language": "Italian", "name": "Rinascita di Alara"}]' LIMIT 1;
SELECT C.type FROM cards AS C WHERE C.set_name = 'Huitième édition' GROUP BY C.type
SELECT T2.set_name FROM cards AS T1 JOIN sets AS T2 ON T1.set_id = T2.set_id WHERE T1.name = 'Tendo Ice Bridge' AND T1.printings LIKE '%French%'
SELECT COUNT(*) FROM sets WHERE name = 'Tenth Edition' AND translation IS NOT NULL
SELECT T1.sets FROM card_sets AS T1 JOIN cards AS T2 ON T1.card_uuid = T2.uuid WHERE T2.name = 'Fellwar Stone' AND T1.language = 'Japanese' GROUP BY T1.sets LIMIT 1;
SELECT card_name FROM cards WHERE set_name = 'Journey into Nyx Hero''s Path' AND converted_mana_cost = (SELECT MAX(converted_mana_cost) FROM cards WHERE set_name = 'Journey into Nyx Hero''s Path')
SELECT release_date FROM sets WHERE translation = 'Ola de frío'
SELECT T1.type FROM sets AS T1 INNER JOIN cards AS T2 ON T1.set_code = T2.set WHERE T2.name = 'Samite Pilgrim' GROUP BY T1.type
SELECT COUNT(*) FROM cards WHERE name = 'World Championship Decks 2004' AND convertedManaCost = 3;
SELECT t1.name FROM card_sets AS t1 JOIN translations AS t2 ON t1.uuid = t2.set_uuid WHERE t1.name = 'Mirrodin' AND t2.language = 'Chinese Simplified'
SELECT (SUM(CASE WHEN c.isNonFoilOnly = 1 THEN 1 ELSE 0 END) * 100 / COUNT(*)) AS percentage FROM cards AS c WHERE c.language = 'Japanese'
SELECT SUM(CASE WHEN c.isOnlineOnly = 1 THEN 1 ELSE 0 END) * 100 / COUNT(*) AS percentage FROM cards AS c WHERE c.language = 'Portuguese (Brazil)'
SELECT DISTINCT C.availability FROM cards AS C WHERE C.artist = 'Aleksi Briclot' AND C.isTextless = 1
SELECT T2.id FROM `cards` AS T1 JOIN `sets` AS T2 ON T1.set = T2.code GROUP BY T2.code ORDER BY COUNT(T1.uuid) DESC LIMIT 1
SELECT T1.artist FROM cards AS T1 JOIN card_prices AS T2 ON T1.uuid = T2.card_uuid WHERE T1.side IS NULL ORDER BY T2.converted_mana_cost DESC LIMIT 1
SELECT T1.frame_effects FROM (SELECT frame_effects, COUNT(*) AS cnt FROM cards WHERE card_kingdom_foil_id IS NOT NULL AND card_kingdom_id IS NOT NULL GROUP BY frame_effects) AS T1 JOIN (SELECT MAX(cnt) AS max_cnt FROM (SELECT frame_effects, COUNT(*) AS cnt FROM cards WHERE card_kingdom_foil_id IS NOT NULL AND card_kingdom_id IS NOT NULL GROUP BY frame_effects)) AS T2 ON T1.cnt = T2.max_cnt ORDER BY T1.frame_effects LIMIT 1
SELECT COUNT(*) FROM cards WHERE (power IS NULL OR power = '*') AND hasFoil = 0 AND duelDeck = 'a'
SELECT s.id FROM sets AS s WHERE s.type = 'commander' AND s.totalSetSize = (SELECT MAX(totalSetSize) FROM sets WHERE type = 'commander')
SELECT c.name FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE l.format = 'duel' ORDER BY c.manaCost DESC LIMIT 10;
SELECT T1.originalReleaseDate, T2.format FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'mythic' AND T2.status = 'Legal' ORDER BY T1.originalReleaseDate ASC LIMIT 1;
SELECT COUNT(*) FROM cards WHERE artist = 'Volkan Baǵa' AND language = 'French'
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'rare' AND c.types LIKE '%Enchantment%' AND c.name = 'Abundance' AND l.status = 'Legal' GROUP BY c.uuid HAVING COUNT(*) > 0;
SELECT T2.format, T1.name FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.status = 'Banned' GROUP BY T2.format ORDER BY COUNT(*) DESC LIMIT 1
SELECT language FROM sets WHERE name = 'Battlebond' LIMIT 1;
SELECT T2.format FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.artist IN (SELECT artist FROM cards GROUP BY artist ORDER BY COUNT(*) ASC LIMIT 1)
SELECT L.status FROM legalities AS L JOIN cards AS C ON L.uuid = C.uuid WHERE C.frameVersion = '1997' AND C.artist = 'D. Alexander Gregory' AND (C.hasContentWarning = 1 OR C.printerName = 'Wizards of the Coast') AND L.format = 'legacy'
SELECT C.name, L.format FROM legalities AS L JOIN cards AS C ON L.uuid = C.uuid WHERE C.edhrecRank = 1 AND L.status = 'Banned'
SELECT AVG(T1.id) AS avg_sets, T2.language FROM sets AS T1 JOIN cards AS T2 ON T1.code = T2.set WHERE T1.releaseDate BETWEEN '2012-01-01' AND '2015-12-31' GROUP BY T2.language ORDER BY COUNT(T2.language) DESC LIMIT 1
SELECT T1.artist FROM cards AS T1 JOIN cardborder AS T2 ON T1.uuid = T2.card_uuid WHERE T2.border_color = 'black' AND T1.availability = 'arena' GROUP BY T1.artist
SELECT uuid FROM legalities WHERE format = 'oldschool' AND status IN ('banned', 'restricted')
SELECT COUNT(*) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability = 'paper'
SELECT T2.text FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Kev Walker' ORDER BY T2.date DESC
SELECT C.name, L.format FROM cards AS C JOIN legalities AS L ON C.uuid = L.uuid WHERE C.set = 'Hour of Devastation' AND L.status = 'Legal' GROUP BY C.name, L.format
SELECT name FROM sets WHERE language = 'Korean' AND NOT EXISTS (SELECT * FROM sets WHERE language LIKE '%Japanese%' AND name = name) GROUP BY name
SELECT C.frameVersion, C.name FROM cards AS C JOIN legalities AS L ON C.uuid = L.uuid WHERE C.artist = 'Allen Williams' AND L.status = 'Banned' UNION SELECT DISTINCT frameVersion, name FROM cards WHERE artist = 'Allen Williams'
SELECT DisplayName FROM Users WHERE DisplayName IN ('Harlan', 'Jarrod Dixon') ORDER BY Reputation DESC LIMIT 1;
SELECT DisplayName FROM Users WHERE YEAR(CreationDate) = 2011;
SELECT COUNT(*) FROM Users WHERE LastAccessDate > '2014-09-01'
SELECT DisplayName FROM Users ORDER BY Views DESC LIMIT 1
SELECT COUNT(*) FROM Users WHERE UpVotes > 100 AND DownVotes > 1;
SELECT COUNT(*) FROM Users WHERE Views > 10 AND YEAR(CreationDate) > 2013;
SELECT COUNT(*) FROM Posts WHERE OwnerUserId = (SELECT AccountId FROM Users WHERE DisplayName = 'csgillespie')
SELECT T1.Title FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie'
SELECT DisplayName FROM Users WHERE AccountId = (SELECT AccountId FROM Posts WHERE Title = 'Eliciting priors from experts')
SELECT T1.Title FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie' ORDER BY T1.ViewCount DESC LIMIT 1
SELECT T2.DisplayName FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.FavoriteCount = (SELECT MAX(FavoriteCount) FROM Posts)
SELECT SUM(T2.CommentCount) FROM Posts AS T1 INNER JOIN Posts AS T2 ON T1.OwnerUserId = T2.OwnerUserId WHERE T1.DisplayName = 'csgillespie' AND T1.PostTypeId = 2;
SELECT T2.AnswerCount FROM Posts AS T1 JOIN PostLinks AS T2 ON T1.Id = T2.PostId WHERE T1.OwnerUserId IN (SELECT Id FROM Users WHERE DisplayName = 'csgillespie') AND T2.LinkTypeId = 3 GROUP BY T2.AnswerCount ORDER BY T2.AnswerCount DESC LIMIT 1
SELECT T2.DisplayName FROM Posts AS T1 JOIN Users AS T2 ON T1.LastEditorUserId = T2.Id WHERE T1.Title = 'Examples for teaching: Correlation does not mean causation'
SELECT COUNT(*) FROM Posts WHERE OwnerUserId = (SELECT Id FROM Users WHERE DisplayName = 'csgillespie') AND ParentId IS NULL
SELECT T1.DisplayName FROM Users AS T1 JOIN Posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T2.ClosedDate IS NOT NULL
SELECT COUNT(*) FROM Posts WHERE OwnerUserId IN (SELECT Id FROM Users WHERE Age > 65) AND Score >= 20
SELECT L.Location FROM Posts AS P JOIN Users AS U ON P.OwnerUserId = U.Id JOIN UserLocations AS L ON U.Id = L.UserId WHERE P.Title = 'Eliciting priors from experts'
SELECT Posts.Body FROM Tags INNER JOIN PostTags ON PostTags.TagId = Tags.Id INNER JOIN Posts ON Posts.Id = PostTags.PostId WHERE Tags.TagName = 'bayesian' AND Posts.PostTypeId = 1 LIMIT 1
SELECT T1.Body FROM Posts AS T1 JOIN Tags AS T2 ON T1.Id = T2.ExcerptPostId WHERE T2.Count = ( SELECT MAX(T3.Count) FROM Tags AS T3 )
SELECT COUNT(*) FROM Badges WHERE UserId = (SELECT AccountId FROM Users WHERE DisplayName = 'csgillespie')
SELECT B.Name FROM Badges AS B JOIN Users AS U ON B.UserId = U.Id WHERE U.DisplayName = 'csgillespie' GROUP BY B.Name ORDER BY B.Name ASC
SELECT COUNT(*) FROM Badges WHERE UserId = (SELECT Id FROM Users WHERE DisplayName = 'csgillespie') AND YEAR(Date) = 2011
SELECT T2.DisplayName FROM (SELECT UserId, COUNT(*) AS BadgeCount FROM Badges GROUP BY UserId ORDER BY BadgeCount DESC LIMIT 1) AS T1 INNER JOIN Users AS T2 ON T1.UserId = T2.Id
SELECT AVG(T1.Score) FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie'
SELECT AVG(BadgeCount) AS AverageBadges FROM (SELECT COUNT(DISTINCT u.Id) AS BadgeCount FROM Users u JOIN Badges b ON u.Id = b.UserId WHERE u.Views > 200 GROUP BY u.Id) AS temp
SELECT CAST(SUM(CASE WHEN T2.Age > 65 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.Id) FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Score > 5
SELECT SUM(UpVotes) + SUM(DownVotes) FROM Users WHERE UserId = 58 AND CreationDate = '2010-07-19'
SELECT CreationDate FROM ( SELECT CreationDate, COUNT(Id) AS num_votes FROM Users GROUP BY CreationDate ) AS vote_counts WHERE num_votes = ( SELECT MAX(num_votes) FROM ( SELECT COUNT(Id) AS num_votes FROM Users GROUP BY CreationDate ) AS max_votes );
SELECT COUNT(Id) FROM Badges WHERE Name = 'Revival'
SELECT T1.Title FROM Posts AS T1 JOIN Comments AS T2 ON T1.Id = T2.PostId WHERE T2.Score = (SELECT MAX(Score) FROM Comments)
SELECT T2.CommentCount FROM Posts AS T1 JOIN PostInTags AS T2 ON T1.Id = T2.PostId WHERE T1.ViewCount = 1910
SELECT T1.FavoriteCount FROM Posts AS T1 INNER JOIN Comments AS T2 ON T1.Id = T2.PostId WHERE T2.UserId = '3025' AND T2.CreationDate = '2014-04-23 20:29:39.0'
SELECT Text FROM Comments WHERE PostId = 107829 AND CommentCount = 1;
SELECT CASE WHEN ClosedDate IS NULL THEN 'Not Well-Finished' ELSE 'Well-Finished' END AS PostStatus FROM Posts WHERE Id IN (SELECT PostId FROM Comments WHERE UserId = '23853' AND CreationDate = '2013-07-12 09:08:18.0')
SELECT Reputation FROM Users WHERE Id = (SELECT OwnerUserId FROM Posts WHERE Id = 65041)
SELECT COUNT(*) FROM Posts WHERE OwnerUserId = (SELECT Id FROM Users WHERE DisplayName = 'Tiago Pasqualini')
SELECT DisplayName FROM Users WHERE AccountId = (SELECT AccountId FROM Votes WHERE Id = 6347)
SELECT SUM(UpVotes) + SUM(DownVotes) FROM Users WHERE DisplayName = 'Data Visualization'
SELECT T2.Name FROM Users AS T1 JOIN Badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'DatEpicCoderGuyWhoPrograms'
SELECT COUNT(T1.Id) / COUNT(T2.Id) FROM Posts AS T1 JOIN Votes AS T2 ON T1.OwnerUserId = '24' AND T2.UserId = '24' WHERE T1.PostTypeId = 1 OR T1.PostTypeId = 2
SELECT ViewCount FROM Posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer'
SELECT Text FROM Comments WHERE Score = 17
SELECT DisplayName FROM Users WHERE WebsiteUrl = 'http://stackoverflow.com'
SELECT B.Name FROM Users AS U JOIN Badges AS B ON U.Id = B.UserId WHERE U.DisplayName = 'SilentGhost'
SELECT T1.DisplayName FROM Users AS T1 JOIN Comments AS T2 ON T1.Id = T2.UserId WHERE T2.Text = 'thank you user93!'
SELECT T2.Text FROM Users AS T1 JOIN Comments AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'A Lion'
SELECT T2.DisplayName, T1.Reputation FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Title = 'Understanding what Dassault iSight is doing?'
SELECT T2.Text FROM Posts AS T1 JOIN Comments AS T2 ON T1.Id = T2.PostId WHERE T1.Title = 'How does gentle boosting differ from AdaBoost?'
SELECT DisplayName FROM Users WHERE EXISTS (SELECT * FROM Badges WHERE UserId = Users.Id AND Name = 'Necromancer') LIMIT 10
SELECT E.DisplayName FROM Posts AS P JOIN PostHistory AS PH ON P.Id = PH.PostId JOIN Users AS E ON PH.UserId = E.Id WHERE P.Title = 'Open source tools for visualizing multi-dimensional data?' AND PH.PostHistoryTypeId = 4
SELECT T1.Title FROM Posts AS T1 JOIN PostHistory AS T2 ON T1.Id = T2.PostId WHERE T2.HistoryTypeId IN (4, 5) AND T2.UserId = (SELECT AccountId FROM Users WHERE DisplayName = 'Vebjorn Ljosa')
SELECT SUM(Posts.Score) AS TotalScore, Users.WebsiteUrl FROM Posts INNER JOIN Users ON Posts.LastEditorUserId = Users.Id WHERE Users.DisplayName = 'Yevgeny' GROUP BY Users.WebsiteUrl
SELECT T3.Text FROM Posts AS T1 JOIN PostHistory AS T2 ON T1.Id = T2.PostId JOIN Comments AS T3 ON T2.UserId = T3.UserId WHERE T1.Title = 'Why square the difference instead of taking the absolute value in standard deviation?' AND T2.PostHistoryTypeId = 4
SELECT SUM(T2.BountyAmount) FROM Posts AS T1 JOIN PostHistory AS T2 ON T1.Id = T2.PostId WHERE T1.Title LIKE '%data%'
SELECT T2.DisplayName FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.BountyAmount = 50 AND T1.Title LIKE '%variance%'
SELECT T1.Title, T2.Text, AVG(T1.ViewCount) AS AverageViewCount FROM Posts AS T1 JOIN Comments AS T2 ON T1.Id = T2.PostId WHERE T1.Tags LIKE '%<humor>%' GROUP BY T1.Title, T2.Text
SELECT COUNT(*) FROM Comments WHERE OwnerUserId = 13;
SELECT AccountId FROM Users ORDER BY Reputation DESC LIMIT 1
SELECT AccountId FROM Users WHERE Views = (SELECT MIN(Views) FROM Users)
SELECT COUNT(*) FROM Badges WHERE YEAR(BadgeDate) = 2011 AND Name = 'Supporter'
SELECT COUNT(*) FROM (SELECT UserId, COUNT(Name) AS NumBadges FROM Badges GROUP BY UserId HAVING COUNT(Name) > 5) AS UsersWithMoreThanFiveBadges
SELECT COUNT(*) FROM Users WHERE Id IN (SELECT UserId FROM Badges WHERE Name = 'Supporter') AND Id IN (SELECT UserId FROM Badges WHERE Name = 'Teacher') AND Location LIKE '%New York%'
SELECT T2.DisplayName, T2.Reputation FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Id = 1
SELECT UserId FROM PostHistory WHERE PostId IN (SELECT PostId FROM PostHistory GROUP BY PostId HAVING COUNT(*) = 1) AND Views >= 1000 GROUP BY UserId HAVING COUNT(*) >= 1
SELECT T1.Id, T1.Badges FROM (SELECT UserId, COUNT(Id) AS CommentCount FROM Comments GROUP BY UserId) AS T2 JOIN Users AS T1 ON T1.Id = T2.UserId WHERE T2.CommentCount = (SELECT MAX(CommentCount) FROM (SELECT UserId, COUNT(Id) AS CommentCount FROM Comments GROUP BY UserId) AS T3)
SELECT COUNT(*) FROM Users WHERE Location LIKE '%India%' AND EXISTS(SELECT * FROM Badges WHERE UserId = Users.Id AND Name = 'Teacher')
SELECT (CAST(SUM(CASE WHEN YEAR(B.Date) = 2010 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN B.Name = 'Student' THEN 1 ELSE 0 END) * 100 - CAST(SUM(CASE WHEN YEAR(B.Date) = 2011 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN B.Name = 'Student' THEN 1 ELSE 0 END) * 100) FROM Badges AS B
SELECT COUNT(DISTINCT ph.PostID) AS UniqueUsersCommented, ph.PostHistoryTypeID FROM Posts p JOIN PostHistory ph ON ph.PostID = p.PostId WHERE p.PostTypeId = 1 AND p.Id = 3720 AND ph.PostHistoryTypeId IN (4,5) GROUP BY ph.PostHistoryTypeID
SELECT T1.Id, T1.ViewCount FROM Posts AS T1 JOIN PostLinks AS T2 ON T1.Id = T2.PostId WHERE T2.RelatedPostId = 61217
SELECT Score, LinkTypeId FROM Posts WHERE Id = 395;
SELECT Posts.Id AS PostID, Posts.OwnerUserId AS UserID FROM Posts WHERE Posts.Score > 60;
SELECT SUM(FavoriteCount) FROM Posts WHERE OwnerUserId = 686 AND YEAR(CreationDate) = 2011
SELECT AVG(T2.UpVotes), AVG(T2.Age) FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.PostTypeId = 1 GROUP BY T2.Id HAVING COUNT(T1.Id) > 10
SELECT COUNT(*) FROM Badges WHERE Name = 'Announcer'
SELECT T2.Name FROM Badges AS T1 JOIN BadgeTypes AS T2 ON T1.Id = T2.Id WHERE T1.Date = '2010-07-19 19:39:08.0'
SELECT COUNT(*) FROM Comments WHERE Score > 60;
SELECT Text FROM Comments WHERE CreationDate = '2010-07-19 19:25:47.0'
SELECT COUNT(Id) FROM Posts WHERE Score = 10
SELECT B.Name FROM Badges AS B JOIN Users AS U ON B.UserId = U.Id WHERE U.Reputation = (SELECT MAX(Reputation) FROM Users) GROUP BY B.Name
SELECT Reputation FROM Users WHERE Id IN (SELECT UserId FROM Badges WHERE Date = '2010-07-19 19:39:08.0')
SELECT B.Name FROM Badges AS B JOIN Users AS U ON B.UserId = U.Id WHERE U.DisplayName = 'Pierre'
SELECT T2.Date FROM Users AS T1 JOIN Badges AS T2 ON T1.Id = T2.UserId WHERE T1.Location LIKE '%Rochester, NY%'
SELECT COUNT(CASE WHEN b.Name = 'Teacher' THEN u.UserId ELSE NULL END) * 100 / COUNT(u.UserId) AS Percentage FROM Users u JOIN Badges b ON u.UserId = b.UserId WHERE b.Name = 'Teacher' GROUP BY b.Name;
SELECT CAST(SUM(CASE WHEN T2.Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.UserId) FROM (SELECT UserId FROM Badges WHERE Name = 'Organizer') AS T1 JOIN Users AS T2 ON T1.UserId = T2.Id
SELECT CommentRatingScore FROM Posts WHERE CreationDate = '2010-07-19 19:19:56.0'
SELECT Text FROM Comments WHERE CreationDate = '2010-07-19 19:37:33.0'
SELECT Age FROM Users WHERE Location LIKE '%Vienna, Austria%' AND AccountId IN (SELECT AccountId FROM Badges)
SELECT COUNT(*) FROM Users AS T1 JOIN Badges AS T2 ON T1.Id = T2.UserId WHERE T2.Name = 'Supporter' AND T1.Age BETWEEN 19 AND 65
SELECT T2.Views FROM Badges AS T1 JOIN Users AS T2 ON T1.UserId = T2.Id WHERE T1.Date = '2010-07-19 19:39:08.0'
SELECT B.Name FROM Badges AS B JOIN Users AS U ON B.UserId = U.Id WHERE U.Reputation = (SELECT MIN(Reputation) FROM Users)
SELECT B.Name FROM Users AS U JOIN Badges AS B ON U.Id = B.UserId WHERE U.DisplayName = 'Sharpie'
SELECT COUNT(*) FROM Users WHERE Age > 65 AND EXISTS(SELECT * FROM Badges WHERE UserId = Users.Id AND Name = 'Supporter')
SELECT DisplayName FROM Users WHERE AccountId = 30;
SELECT COUNT(*) FROM Users WHERE LOWER(Location) LIKE '%new york%'
SELECT COUNT(*) FROM Votes WHERE YEAR(CreationDate) = 2010;
SELECT COUNT(*) FROM Users WHERE Age >= 19 AND Age <= 65;
SELECT DisplayName FROM Users ORDER BY Views DESC LIMIT 1;
SELECT CAST(SUM(CASE WHEN YEAR(CreationDate) = 2010 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN YEAR(CreationDate) = 2011 THEN 1 ELSE 0 END) FROM Votes;
SELECT T2.TagName FROM Posts AS T1 JOIN PostTags AS T2 ON T1.Id = T2.PostId WHERE T1.OwnerDisplayName = 'John Salvatier' GROUP BY T2.TagName
SELECT COUNT(*) FROM Posts WHERE OwnerUserId IN (SELECT Id FROM Users WHERE DisplayName = 'Daniel Vassallo')
SELECT SUM(UpVotes) + SUM(DownVotes) FROM Users WHERE DisplayName = 'Harlan'
SELECT Posts.Id AS PostID FROM Posts INNER JOIN Users ON Posts.OwnerUserId = Users.Id WHERE Users.DisplayName = 'slashnick' AND Posts.PostTypeId = 1 GROUP BY Posts.Id ORDER BY COUNT(*) DESC LIMIT 1
SELECT SUM(T2.ViewCount) AS ViewCount ,  T1.DisplayName FROM Users AS T1 JOIN Posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName IN ('Harvey Motulsky', 'Noah Snyder') GROUP BY T1.DisplayName ORDER BY SUM(T2.ViewCount) DESC LIMIT 1
SELECT COUNT(*) FROM Posts WHERE OwnerUserId IN (SELECT Id FROM Users WHERE DisplayName = 'Matt Parker') AND Score > 4
SELECT COUNT(*) FROM Comments WHERE Score < 60 AND OwnerUserId IN (SELECT Id FROM Users WHERE DisplayName = 'Neil McGuigan')
SELECT T2.TagName FROM Posts AS T1 JOIN PostTags AS T3 ON T1.Id = T3.PostId JOIN Tags AS T2 ON T2.Id = T3.TagId WHERE T1.CommentCount = 0 AND T1.OwnerDisplayName = 'Mark Meckes'
SELECT T1.DisplayName FROM Users AS T1 JOIN Badges AS T2 ON T1.Id = T2.UserId WHERE T2.Name = 'Organizer'
SELECT CAST(SUM(CASE WHEN T1.TagName = 'r' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.PostId) FROM Tags AS T1 INNER JOIN PostTags AS T2 ON T1.Id = T2.TagId INNER JOIN Posts AS T3 ON T2.PostId = T3.Id WHERE T3.OwnerUserId IN (SELECT Id FROM Users WHERE DisplayName = 'Community')
SELECT (SUM(CASE WHEN T1.DisplayName = 'Mornington' THEN T2.ViewCount ELSE 0 END) - SUM(CASE WHEN T1.DisplayName = 'Amos' THEN T2.ViewCount ELSE 0 END)) AS ViewDifference FROM Users AS T1 INNER JOIN Posts AS T2 ON T1.Id = T2.OwnerUserId;
SELECT COUNT(*) FROM Users WHERE EXISTS(SELECT * FROM Badges WHERE UserId = Users.Id AND Name = 'Commentator' AND YEAR(Date) = 2014)
SELECT COUNT(*) FROM Posts WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59'
SELECT DisplayName, Age FROM Users WHERE Views = (SELECT MAX(Views) FROM Users)
SELECT LastEditDate, LastEditorUserId FROM Posts WHERE Title = 'Detecting a given face in a database of facial images'
SELECT COUNT(*) FROM Comments WHERE UserId = 13 AND Score < 60;
SELECT Posts.Title, Comments.UserId, Users.DisplayName FROM Posts JOIN Comments ON Posts.Id = Comments.PostId JOIN Users ON Comments.UserId = Users.Id WHERE Comments.Score > 60 AND Posts.PostTypeId = 1 GROUP BY Posts.Title, Comments.UserId, Users.DisplayName;
SELECT b.Name FROM Badges AS b JOIN Users AS u ON b.UserId = u.Id WHERE u.Location = 'North Pole' AND YEAR(b.Date) = 2011
SELECT DisplayName, WebsiteUrl FROM Users WHERE EXISTS (SELECT * FROM Posts WHERE Posts.OwnerUserId = Users.Id AND FavoriteCount > 150)
SELECT COUNT(*), MAX(ph.LastEditDate) FROM Posts AS p JOIN PostHistory AS ph ON p.Id = ph.PostId WHERE p.Title = 'What is the best introductory Bayesian statistics textbook?' AND ph.PostHistoryTypeId IN (4, 5, 6) GROUP BY p.Id
SELECT LastAccessDate, Location FROM Users WHERE Id IN (SELECT UserId FROM Badges WHERE Name = 'Outliers')
SELECT T2.Title FROM Posts AS T1 JOIN Posts AS T2 ON T1.ParentId = T2.Id WHERE T1.Body LIKE '%How to tell if something happened in a data set which monitors a value over time%'
SELECT T1.PostId, T2.TagName FROM Posts AS T1 JOIN PostTags AS T2 ON T1.Id = T2.PostId WHERE T1.OwnerUserId IN (SELECT Id FROM Users WHERE UserDisplayName = 'Samuel') AND YEAR(T1.CreationDate) = 2013 INTERSECT SELECT PostId, TagName FROM Badges WHERE UserId IN (SELECT Id FROM Users WHERE UserDisplayName = 'Samuel') AND YEAR(Date) = 2013
SELECT T2.DisplayName FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE PostTypeId = 1 ORDER BY ViewCount DESC LIMIT 1
SELECT T1.DisplayName, T1.Location FROM SuggestedEditVotes AS T2 JOIN Users AS T1 ON T2.UserId = T1.Id WHERE T2.TagName = 'hypothesis-testing' GROUP BY T1.DisplayName, T1.Location ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.Title, T1.LinkTypeId FROM Posts AS T1 JOIN Posts AS T2 ON T1.PostId = T2.Id WHERE T2.Title = 'What are principal component scores?'
SELECT T2.DisplayName FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.ParentId IS NOT NULL ORDER BY T1.Score DESC LIMIT 1;
SELECT DisplayName, WebsiteUrl FROM Users WHERE Id IN (SELECT UserId FROM Votes WHERE VoteTypeId = 8 ORDER BY BountyAmount DESC LIMIT 1)
SELECT Title FROM Posts ORDER BY ViewCount DESC LIMIT 5
SELECT COUNT(*) FROM Tags WHERE Count BETWEEN 5000 AND 7000;
SELECT OwnerUserId FROM Posts WHERE FavoriteCount = (SELECT MAX(FavoriteCount) FROM Posts) LIMIT 1;
SELECT Age FROM Users WHERE Reputation = (SELECT MAX(Reputation) FROM Users)
SELECT COUNT(*) FROM Posts WHERE YEAR(CreationDate) = 2011 AND BountyAmount = 50 AND EXISTS(SELECT * FROM Votes WHERE Posts.Id = Votes.PostId)
SELECT AccountId FROM Users WHERE Age = (SELECT MIN(Age) FROM Users)
SELECT SUM(Reputation) FROM Users WHERE LastAccessDate LIKE '2010-07-19%'
SELECT COUNT(T1.Id) / 12 AS AverageMonthlyLinksCreatedIn2010ForPostsNoMoreThan2Answers FROM Posts AS T1 JOIN PostLinks AS T2 ON T1.Id = T2.PostId WHERE YEAR(T1.CreationDate) = 2010 AND T1.AnswerCount <= 2
SELECT PostId FROM Votes WHERE UserId = 1465 AND VoteTypeId = 5 ORDER BY Value DESC LIMIT 1
SELECT Title FROM Posts ORDER BY CreationDate LIMIT 1
SELECT DisplayName FROM Users WHERE AccountId = (SELECT AccountId FROM Badges GROUP BY AccountId ORDER BY COUNT(*) DESC LIMIT 1)
SELECT MIN(Votes.CreationDate) FROM Votes JOIN Users ON Votes.UserId = Users.Id WHERE Users.DisplayName = 'chl'
SELECT T1.CreationDate FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.Age = (SELECT MIN(Age) FROM Users) ORDER BY T1.CreationDate ASC LIMIT 1
SELECT T1.DisplayName FROM Users AS T1 JOIN Badges AS T2 ON T1.Id = T2.UserId WHERE T2.Name = 'Autobiographer' ORDER BY T2.Date LIMIT 1
SELECT COUNT(*) FROM Users WHERE Location LIKE '%United Kingdom%' AND (SELECT SUM(FavoriteCount) FROM Posts WHERE Posts.OwnerUserId = Users.Id) >= 4
SELECT AVG(T2.PostId) FROM Users AS T1 JOIN Votes AS T2 ON T1.Id = T2.UserId WHERE T1.Age = (SELECT MAX(Age) FROM Users)
SELECT DisplayName FROM Users WHERE Reputation = (SELECT MAX(Reputation) FROM Users)
SELECT COUNT(*) FROM Users WHERE Reputation > 2000 AND Views > 1000;
SELECT DisplayName FROM Users WHERE Age BETWEEN 19 AND 65;
SELECT COUNT(*) FROM Posts WHERE YEAR(CreationDate) = 2010 AND DisplayName = 'Jay Stevens'
SELECT Id, Title FROM Posts WHERE OwnerUserId IN (SELECT Id FROM Users WHERE DisplayName = 'Harvey Motulsky') ORDER BY ViewCount DESC LIMIT 1;
SELECT Id, Title FROM Posts WHERE Score = (SELECT MAX(Score) FROM Posts)
SELECT AVG(T2.Score) FROM Posts AS T1 INNER JOIN Posts AS T2 ON T1.OwnerUserID = T2.OwnerUserID WHERE T1.DisplayName = 'Stephen Turner' GROUP BY T2.Score;
SELECT DisplayName FROM Users WHERE AccountId IN (SELECT AccountId FROM Posts WHERE YEAR(CreationDate) = 2011 AND ViewCount > 20000)
SELECT Id, OwnerUserId, DisplayName FROM Posts AS p JOIN Users AS u ON p.OwnerUserId = u.Id WHERE YEAR(p.CreationDate) = 2010 ORDER BY p.FavoriteCount DESC LIMIT 1;
SELECT CAST(SUM(CASE WHEN T2.Reputation > 1000 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.Id) FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE YEAR(T1.CreationDate) = 2011;
SELECT CAST(SUM(CASE WHEN Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS Percentage FROM Users WHERE Age IS NOT NULL;
SELECT SUM(ViewCount) AS TotalViews, MAX(u.DisplayName) AS LastPosterName FROM Posts p JOIN Users u ON p.OwnerUserId = u.Id WHERE p.Text = 'Computer Game Datasets' GROUP BY p.Text;
SELECT COUNT(*) FROM Posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM Posts)
SELECT COUNT(*) FROM Comments WHERE PostId = (SELECT Id FROM Posts ORDER BY Score DESC LIMIT 1)
SELECT COUNT(*) FROM Posts WHERE ViewCount > 35000 AND CommentCount = 0;
SELECT DisplayName, Location FROM Users WHERE Id = (SELECT OwnerUserId FROM Posts WHERE PostTypeId = 2 AND ParentId = 183 ORDER BY LastEditDate DESC LIMIT 1)
SELECT B.Name FROM Badges AS B INNER JOIN Users AS U ON B.UserId = U.Id WHERE U.DisplayName = 'Emmett' ORDER BY B.Date DESC LIMIT 1;
SELECT COUNT(*) FROM Users WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000;
SELECT DATEDIFF(stats_badges.Date, Users.CreationDate) AS TimeToBadge FROM stats_badges JOIN Users ON stats_badges.UserId = Users.Id WHERE Users.DisplayName = 'Zolomon'
SELECT COUNT(*) AS PostCount, COUNT(c.Id) AS CommentCount FROM Posts p LEFT JOIN Comments c ON p.OwnerUserId = c.UserId WHERE p.OwnerUserId = (SELECT u.Id FROM Users u ORDER BY u.CreationDate DESC LIMIT 1) GROUP BY p.OwnerUserId;
SELECT C.Text, U.DisplayName FROM Comments AS C JOIN Users AS U ON C.UserId = U.Id WHERE C.PostId IN (SELECT Id FROM Posts WHERE Title = 'Analysing wind data with R') ORDER BY C.CreationDate DESC LIMIT 10;
SELECT COUNT(*) FROM Users WHERE Id IN (SELECT UserId FROM Badges WHERE Name = 'Citizen Patrol')
SELECT COUNT(*) FROM Posts JOIN PostTags ON Posts.Id = PostTags.PostId JOIN Tags ON PostTags.TagId = Tags.Id WHERE Tags.TagName = 'careers'
SELECT Reputation, Views FROM Users WHERE DisplayName = 'Jarrod Dixon'
SELECT COUNT(CASE WHEN T2.PostTypeId = 1 THEN 1 END) AS Answers ,  COUNT(*) AS Comments FROM Posts AS T1 INNER JOIN Comments AS T2 ON T1.Id = T2.PostId WHERE T1.Title = 'Clustering 1D data' AND T2.UserId IN (SELECT AccountId FROM Users)
SELECT CreationDate FROM Users WHERE DisplayName = 'IrishStat'
SELECT COUNT(*) FROM Posts WHERE BountyAmount >= 30
SELECT CAST(SUM(CASE WHEN Score > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Posts JOIN (SELECT AccountId, MAX(Reputation) as MaxRep FROM Users GROUP BY AccountId) u ON Posts.OwnerUserId = u.AccountId WHERE u.MaxRep = (SELECT MAX(MaxRep) FROM (SELECT AccountId, MAX(Reputation) as MaxRep FROM Users GROUP BY AccountId))
SELECT COUNT(*) FROM Posts WHERE Score < 20;
SELECT COUNT(*) FROM Tags WHERE Id < 15 AND Count <= 20;
SELECT ExcerptPostID ,  WikiPostID FROM Tags WHERE TagName  =  'sample'
SELECT Reputation, UpVotes FROM Users WHERE Id IN (SELECT UserId FROM Comments WHERE Text LIKE '%fine, you win%')
SELECT "Text" FROM "Comments" WHERE "PostId" IN (SELECT "Id" FROM "Posts" WHERE "Title" LIKE '%linear regression%')
SELECT C.Text FROM Posts AS P JOIN Comments AS C ON P.Id = C.PostId WHERE P.ViewCount BETWEEN 100 AND 150 ORDER BY C.Score DESC LIMIT 1
SELECT CreationDate, Age FROM Users WHERE WebsiteUrl LIKE '%http%';
SELECT COUNT(*) FROM Comments WHERE Score = 0 AND ViewCount < 5;
SELECT COUNT(*) FROM Posts WHERE CommentCount = 1 AND Score = 0;
SELECT COUNT(*) FROM (SELECT Age FROM Posts WHERE Score = 0 AND Age = 40) AS tmp
SELECT T2.Id AS PostID ,  T1.Text AS Comment FROM Comments AS T1 JOIN Posts AS T2 ON T1.PostId = T2.Id WHERE T2.Title = 'Group differences on a five point Likert item'
SELECT UpVotes FROM Users WHERE AccountId IN (SELECT UserId FROM Comments WHERE Text LIKE '%R is also lazy evaluated.%')
SELECT Text FROM Comments WHERE UserId IN (SELECT Id FROM Users WHERE DisplayName = 'Harvey Motulsky')
SELECT T2.DisplayName FROM Comments AS T1 JOIN Users AS T2 ON T1.UserId = T2.Id WHERE T1.Score BETWEEN 1 AND 5 AND T2.DownVotes = 0
SELECT CAST(SUM(CASE WHEN T2.UpVotes = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.Id) FROM Comments AS T1 JOIN Users AS T2 ON T1.UserId = T2.Id WHERE T1.Score BETWEEN 5 AND 10;
SELECT T2.power_name FROM superhero AS T1 JOIN has_power AS T3 ON T1.id = T3.superhero_id JOIN superpower AS T2 ON T2.id = T3.power_id WHERE T1.superhero_name = '3-D Man'
SELECT COUNT(*) FROM superhero JOIN superhero_power ON superhero.id = superhero_power.superhero_id WHERE power_name = 'Super Strength'
SELECT COUNT(*) FROM superhero JOIN superhero_power ON superhero.id = superhero_power.superhero_id JOIN power ON power.id = superhero_power.power_id WHERE power_name = 'Super Strength' AND height_cm > 200;
SELECT T2.full_name FROM superhero_power AS T1 JOIN superhero AS T2 ON T1.superhero_id = T2.id GROUP BY T2.full_name HAVING COUNT(T2.full_name) > 15
SELECT COUNT(*) FROM superhero WHERE eye_colour_id IN (SELECT id FROM colour WHERE description = 'Blue')
SELECT T2.name FROM superhero AS T1 JOIN colour AS T2 ON T1.skin_colour_id = T2.id WHERE T1.superhero_name = 'Apocalypse'
SELECT COUNT(*) FROM superhero JOIN superhero_power ON superhero.id = superhero_power.superhero_id JOIN power ON superhero_power.power_id = power.id JOIN colour ON superhero.eye_colour_id = colour.id WHERE power.power_name = 'Agility' AND colour.colour = 'Blue'
SELECT superhero.superhero_name FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id AND superhero.hair_colour_id = colour.id WHERE colour.colour = 'Blue' AND colour.colour = 'Blond'
SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')
SELECT superhero_name FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') ORDER BY height_cm DESC;
SELECT T2.publisher_name FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name = 'Sauron'
SELECT c.colour_name, COUNT(s.id) AS superhero_count FROM superhero s JOIN colour c ON s.eye_colour_id = c.id JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics' GROUP BY c.colour_name ORDER BY superhero_count DESC;
SELECT AVG(T1.height_cm) FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics'
SELECT superhero.superhero_name FROM superhero JOIN superhero_power ON superhero.id = superhero_power.superhero_id JOIN power ON power.id = superhero_power.power_id WHERE power.power_name = 'Super Strength' AND superhero.publisher_id IN (SELECT publisher.id FROM publisher WHERE publisher.publisher_name = 'Marvel Comics')
SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')
SELECT T3.publisher_name FROM superhero AS T1 JOIN superhero_power AS T2 ON T1.id = T2.superhero_id JOIN power AS T4 ON T4.id = T2.power_id JOIN attribute AS T5 ON T5.power_id = T4.id JOIN publisher AS T3 ON T3.id = T1.publisher_id WHERE T5.attribute_name = 'Speed' GROUP BY T3.publisher_name ORDER BY AVG(T5.attribute_value) ASC LIMIT 1
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id JOIN publisher ON superhero.publisher_id = publisher.id WHERE colour.colour = 'Gold' AND publisher.publisher_name = 'Marvel Comics'
SELECT T2.publisher_name FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name = 'Blue Beetle II'
SELECT COUNT(*) FROM superhero WHERE hair_colour_id IN (SELECT id FROM colour WHERE description = 'Blond')
SELECT T1.superhero_name FROM superhero AS T1 JOIN superhero_attribute AS T2 ON T1.id = T2.superhero_id WHERE T2.attribute_name = 'Intelligence' ORDER BY T2.attribute_value LIMIT 1;
SELECT T2.race FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.superhero_name = 'Copycat'
SELECT T1.superhero_name FROM superhero AS T1 JOIN superpower AS T2 ON T1.id = T2.superhero_id WHERE T2.power_name = 'Durability' AND T2.attribute_value < 50
SELECT T1.superhero_name FROM superhero AS T1 JOIN superpower AS T2 ON T1.id = T2.hero_id WHERE T2.power_name = 'Death Touch'
SELECT COUNT(*) FROM superhero JOIN gender ON superhero.gender_id = gender.id WHERE gender.name = 'Female' AND (SELECT attribute_value FROM superhero_attribute WHERE superhero_attribute.superhero_id = superhero.id AND attribute_name = 'Strength') = 100;
SELECT T1.superhero_name FROM superhero AS T1 JOIN superhero_power AS T2 ON T1.id = T2.superhero_id GROUP BY T1.superhero_name ORDER BY COUNT(T2.power_id) DESC LIMIT 1
SELECT COUNT(*) FROM superhero WHERE race_id IN (SELECT id FROM race WHERE race_name = 'Vampire')
SELECT COUNT(CASE WHEN T3.alignment_name = 'Bad' THEN T1.id ELSE NULL END) AS bad_count , SUM(CASE WHEN T3.alignment_name = 'Bad' THEN 1 ELSE 0 END) * 100 / COUNT(T1.id) AS percentage FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id JOIN alignment AS T3 ON T1.alignment_id = T3.id WHERE T2.publisher_name = 'Marvel Comics'
SELECT COUNT(*) AS dc_count FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'DC Comics') UNION SELECT COUNT(*) AS marvel_count FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') UNION SELECT (SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')) - (SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')) AS difference;
SELECT T1.publisher_id FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Star Trek' LIMIT 1;
SELECT AVG(height_cm) ,  AVG(weight_kg) FROM superhero WHERE height_cm != 0 AND weight_kg != 0
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL;
SELECT T2.colour_name FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.id = 75;
SELECT T2.power_name FROM superhero AS T1 JOIN has_power AS T3 ON T1.id = T3.superhero_id JOIN power AS T2 ON T2.id = T3.power_id WHERE T1.superhero_name = 'Deathlok'
SELECT AVG(T1.weight_kg) FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T2.gender = 'Female'
SELECT T2.power_name FROM superhero AS T1 JOIN has_power AS T3 ON T1.id = T3.superhero_id JOIN power AS T2 ON T2.id = T3.power_id WHERE T1.gender_id = 1 LIMIT 5;
SELECT T1.superhero_name FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race_name = 'Alien'
SELECT superhero_name FROM superhero WHERE height_cm BETWEEN 170 AND 190 AND eye_colour_id IN (SELECT id FROM colour WHERE name = 'No Colour')
SELECT T2.power_name FROM superhero AS T1 JOIN hero_power AS T3 ON T1.id = T3.hero_id JOIN power AS T2 ON T2.id = T3.power_id WHERE T1.id = 56
SELECT T1.full_name FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Demi-God' LIMIT 5;
SELECT COUNT(*) FROM superhero WHERE alignment_id = 'Bad'
SELECT T2.race FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.weight_kg = 169
SELECT T3.colour_name FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id JOIN colour AS T3 ON T1.hair_colour_id = T3.id WHERE T1.height_cm = 185 AND T2.race_name = 'human'
SELECT c.colour_name FROM colour AS c JOIN superhero AS s ON c.id = s.eye_colour_id WHERE s.weight_kg = (SELECT MAX(weight_kg) FROM superhero)
SELECT CAST(COUNT(CASE WHEN T2.publisher_name = 'Marvel Comics' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.id) FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.height_cm BETWEEN 150 AND 180
SELECT T1.superhero_name FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T2.gender = 'Male' AND T1.weight_kg > (SELECT AVG(weight_kg) * 0.79 FROM superhero)
SELECT T2.power_name FROM superhero AS T1 JOIN superhero_power AS T3 ON T1.id = T3.superhero_id JOIN superpower AS T2 ON T2.id = T3.power_id GROUP BY T2.power_name ORDER BY COUNT(T2.power_name) DESC LIMIT 1
SELECT * FROM superhero WHERE superhero_name = 'Abomination'
SELECT T2.power_name FROM superhero_power AS T1 JOIN power AS T2 ON T1.power_id = T2.id WHERE T1.hero_id = 1
SELECT COUNT(*) FROM superhero JOIN superpower ON superhero.id = superpower.hero_id WHERE superpower.power_name = 'Stealth'
SELECT T1.full_name FROM superhero AS T1 JOIN superhero_attribute AS T2 ON T1.id = T2.superhero_id JOIN attribute AS T3 ON T3.id = T2.attribute_id WHERE T3.attribute_name = 'strength' ORDER BY T2.attribute_value DESC LIMIT 1;
SELECT AVG(T1.id) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.skin_colour_id = T2.id WHERE T2.id = 1 AND T1.skin_colour_id IS NULL
SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics')
SELECT T1.superhero_name FROM `superhero` AS T1 JOIN `attribute` AS T2 ON T1.id = T2.superhero_id JOIN `publisher` AS T3 ON T1.publisher_id = T3.id WHERE T3.publisher_name = 'Dark Horse Comics' AND T2.attribute_name = 'durability' ORDER BY T2.attribute_value DESC LIMIT 1
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.full_name = 'Abraham Sapien'
SELECT T1.superhero_name FROM superhero AS T1 JOIN superpower AS T2 ON T1.id = T2.superhero_id WHERE T2.power_name = 'Flight'
SELECT T1.eye_colour_id, T1.hair_colour_id, T1.skin_colour_id FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T2.gender = 'Female' AND T3.publisher_name = 'Dark Horse Comics'
SELECT T2.superhero_name, T3.publisher_name FROM colour AS T1 JOIN superhero AS T2 ON T1.id = T2.eye_colour_id AND T1.id = T2.hair_colour_id AND T1.id = T2.skin_colour_id JOIN publisher AS T3 ON T2.publisher_id = T3.id
SELECT T2.race_name FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.superhero_name = 'A-Bomb'
SELECT CAST(SUM(CASE WHEN T3.colour_name = 'Blue' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id JOIN colour AS T3 ON T1.skin_colour_id = T3.id WHERE T2.gender_name = 'Female';
SELECT T1.superhero_name, T2.race_name FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.full_name = 'Charles Chandler'
SELECT T2.gender FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T1.superhero_name = 'Agent 13'
SELECT T2.superhero_name FROM superpower AS T1 JOIN superhero AS T2 ON T1.id = T2.power_id WHERE T1.power_name = 'Adaptation'
SELECT COUNT(*) FROM superhero JOIN superhero_power ON superhero.id = superhero_power.superhero_id WHERE superhero.superhero_name = 'Amazo'
SELECT T2.power_name FROM superhero AS T1 JOIN superpower AS T2 ON T1.id = T3.superhero_id WHERE T1.full_name = 'Hunter Zolomon'
SELECT T1.height_cm FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Amber'
SELECT T1.superhero_name FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id OR T1.hair_colour_id = T2.id WHERE T2.colour = 'Black' GROUP BY T1.superhero_name HAVING COUNT(*) = 2
SELECT T1.eye_colour_id FROM superhero AS T1 JOIN colour AS T2 ON T1.skin_colour_id = T2.id WHERE T2.colour = 'Gold'
SELECT T1.full_name FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race_name = 'Vampire'
SELECT superhero_name FROM superhero WHERE alignment_id IN (SELECT id FROM alignment WHERE alignment = 'Neutral')
SELECT COUNT(*) FROM superhero JOIN superhero_attribute ON superhero.id = superhero_attribute.superhero_id WHERE attribute_name = 'Strength' AND attribute_value = (SELECT MAX(attribute_value) FROM superhero_attribute WHERE attribute_name = 'Strength');
SELECT T2.race_name, T3.alignment_name FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id JOIN alignment AS T3 ON T1.alignment_id = T3.id WHERE T1.superhero_name = 'Cameron Hicks'
SELECT CAST(SUM(CASE WHEN T3.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.id) FROM publisher AS T1 JOIN superhero AS T2 ON T1.id = T2.publisher_id JOIN gender AS T3 ON T3.id = T2.gender_id WHERE T1.publisher_name = 'Marvel Comics'
SELECT AVG(T1.weight_kg) FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race_name = 'Alien'
SELECT ABS((SELECT weight_kg FROM superhero WHERE full_name = 'Emil Blonsky') - (SELECT weight_kg FROM superhero WHERE full_name = 'Charles Chandler'))
SELECT AVG(height_cm) AS average_height FROM superhero WHERE height_cm != 0;
SELECT T2.power_name FROM superhero AS T1 JOIN has_power AS T3 ON T1.id = T3.superhero_id JOIN power AS T2 ON T2.id = T3.power_id WHERE T1.superhero_name = 'Abomination'
SELECT COUNT(*) FROM superhero WHERE race_id = 21 AND gender_id = 1
SELECT T1.superhero_name FROM superhero AS T1 JOIN superhero_attribute AS T2 ON T1.id = T2.superhero_id WHERE T2.attribute_name = 'Speed' ORDER BY T2.attribute_value DESC LIMIT 1;
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3;
SELECT T1.id, T1.superhero_name, T1.full_name, T2.gender, T3.colour AS eye_colour, T4.colour AS hair_colour, T5.colour AS skin_colour, T6.race, T7.publisher, T8.alignment, T1.height_cm, T1.weight_kg  FROM superhero AS T1  JOIN gender AS T2 ON T1.gender_id = T2.id  JOIN colour AS T3 ON T1.eye_colour_id = T3.id  JOIN colour AS T4 ON T1.hair_colour_id = T4.id  JOIN colour AS T5 ON T1.skin_colour_id = T5.id  JOIN race AS T6 ON T1.race_id = T6.id  JOIN publisher AS T7 ON T1.publisher_id = T7.id  JOIN alignment AS T8 ON T1.alignment_id = T8.id  WHERE superhero_name = '3-D Man'
SELECT T1.superhero_name FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id AND T1.hair_colour_id = T3.id WHERE T2.colour = 'Blue' AND T3.colour = 'Brown'
SELECT T2.publisher_name FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy') GROUP BY T2.publisher_name HAVING COUNT(*) = 3
SELECT COUNT(*) FROM superhero WHERE publisher_id = 1;
SELECT CAST(COUNT(CASE WHEN T2.colour = 'Blue' THEN T1.superhero_name END) AS REAL) * 100 / COUNT(T1.superhero_name) FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.id = 7;
SELECT CAST(SUM(CASE WHEN T2.gender = 'Male' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T2.gender = 'Female' THEN 1 ELSE 0 END) FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id;
SELECT superhero_name FROM superhero WHERE height_cm = (SELECT MAX(height_cm) FROM superhero)
SELECT id FROM superpower WHERE power_name = 'cryokinesis' LIMIT 1;
SELECT superhero_name FROM superhero WHERE id = 294;
SELECT full_name FROM superhero WHERE weight_kg = 0 OR weight_kg IS NULL;
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.full_name = 'Karen Beecher-Duncan'
SELECT T2.power_name FROM superhero AS T1 JOIN has_power AS T3 ON T1.id = T3.superhero_id JOIN superpower AS T2 ON T2.id = T3.power_id WHERE T1.full_name = 'Helen Parr'
SELECT T2.race FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.weight_kg = 108 AND T1.height_cm = 188;
SELECT T2.publisher_name FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.id = 38
SELECT T2.race FROM ( SELECT id, MAX(height_cm) AS max_attribute_value  FROM superhero  UNION ALL  SELECT id, MAX(weight_kg) AS max_attribute_value  FROM superhero ) AS T1  JOIN superhero AS T2 ON T1.id = T2.id  WHERE (T1.max_attribute_value = T2.height_cm OR T1.max_attribute_value = T2.weight_kg) GROUP BY T2.race LIMIT 1
SELECT T3.power_name, T2.alignment  FROM superhero AS T1  JOIN alignment AS T2 ON T1.alignment_id = T2.id  JOIN superpower AS T3 ON T1.id = T3.superhero_id  WHERE T1.superhero_name = 'Atom IV'
SELECT T1.full_name FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Blue' LIMIT 5;
SELECT AVG(height_cm), AVG(weight_kg) FROM superhero WHERE alignment_id = 3;
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.skin_colour_id = T2.id WHERE T1.attribute_value = 100;
SELECT COUNT(*) FROM superhero WHERE alignment_id = 1 AND gender_id = 2;
SELECT superhero_name FROM superhero WHERE height_cm BETWEEN 75 AND 80 OR weight_kg BETWEEN 75 AND 80;
SELECT T1.race FROM race AS T1 JOIN superhero AS T2 ON T1.id = T2.race_id JOIN colour AS T3 ON T3.id = T2.hair_colour_id JOIN gender AS T4 ON T4.id = T2.gender_id WHERE T3.colour = 'blue' AND T4.gender = 'male'
SELECT CAST(SUM(CASE WHEN T3.gender_id = 2 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.alignment_id) FROM superhero AS T1 JOIN alignment AS T2 ON T1.alignment_id = T2.id JOIN gender AS T3 ON T1.gender_id = T3.id WHERE T2.alignment_id = 2;
SELECT (SELECT COUNT(*) FROM superhero WHERE weight_kg = 0 OR weight_kg IS NULL AND eye_colour_id = 7) - (SELECT COUNT(*) FROM superhero WHERE weight_kg = 0 OR weight_kg IS NULL AND eye_colour_id = 1) AS difference;
SELECT T2.attribute_value FROM superhero AS T1 JOIN superhero_attribute AS T2 ON T1.id = T2.superhero_id WHERE T1.superhero_name = 'Hulk' AND T2.attribute_name = 'Strength'
SELECT T2.power_name FROM superhero AS T1 JOIN has_superpower AS T3 ON T1.id = T3.superhero_id JOIN superpower AS T2 ON T2.id = T3.superpower_id WHERE T1.superhero_name = 'Ajax'
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.skin_colour_id = colour.id JOIN alignment ON superhero.alignment_id = alignment.id WHERE colour.colour = 'Green' AND alignment.alignment = 'Bad';
SELECT COUNT(*) FROM superhero WHERE gender_id IN (SELECT id FROM gender WHERE name = 'Female') AND publisher_id IN (SELECT id FROM publisher WHERE name = 'Marvel Comics')
SELECT T2.superhero_name FROM superpower AS T1 JOIN superhero AS T2 ON T1.id = T2.power_id WHERE T1.power_name = 'Wind Control' ORDER BY T2.superhero_name ASC;
SELECT T2.gender_id FROM superpower AS T1 JOIN superhero AS T2 ON T1.id = T2.power_id WHERE T1.power_name = 'Phoenix Force'
SELECT superhero_name FROM superhero WHERE weight_kg = (SELECT MAX(weight_kg) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')) AND publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')
SELECT AVG(T1.height_cm) FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id JOIN race AS T3 ON T1.race_id = T3.id WHERE T2.publisher_name = 'Dark Horse Comics' AND T3.race <> 'Human'
SELECT COUNT(T2.id) FROM superhero_attribute AS T1 JOIN superhero AS T2 ON T1.superhero_id = T2.id WHERE T1.attribute_name = 'Speed' AND T1.attribute_value = 100;
SELECT COUNT(*) AS dc_count FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'DC Comics' UNION SELECT COUNT(*) AS marvel_count FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics' UNION SELECT (SELECT COUNT(*) FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'DC Comics') - (SELECT COUNT(*) FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics') AS difference;
SELECT T3.attribute_name FROM superhero AS T1 JOIN superhero_attribute AS T2 ON T1.id = T2.superhero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T1.superhero_name = 'Black Panther' ORDER BY T2.attribute_value ASC LIMIT 1
SELECT T3.colour FROM superhero AS T1 JOIN colour AS T3 ON T1.eye_colour_id = T3.id WHERE T1.superhero_name = 'Abomination'
SELECT full_name FROM superhero WHERE height_cm = (SELECT MAX(height_cm) FROM superhero);
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler'
SELECT SUM(CASE WHEN T3.gender = 'Female' THEN 1 ELSE 0 END) * 100.0 / COUNT(T2.id) AS percentage FROM publisher AS T1 JOIN superhero AS T2 ON T1.id = T2.publisher_id JOIN gender AS T3 ON T3.id = T2.gender_id WHERE T1.publisher_name = 'George Lucas'
SELECT CAST(COUNT(CASE WHEN T3.alignment = 'Good' THEN T1.id END) AS REAL) * 100 / COUNT(T1.id) FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id JOIN alignment AS T3 ON T1.alignment_id = T3.id WHERE T2.publisher_name = 'Marvel Comics'
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%'
SELECT id FROM superhero WHERE height_cm = (SELECT MIN(height_cm) FROM superhero) OR weight_kg = (SELECT MIN(weight_kg) FROM superhero) LIMIT 1;
SELECT T1.full_name FROM superhero AS T1 WHERE T1.superhero_name = 'Alien'
SELECT T1.full_name FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour_name = 'Brown' AND T1.weight_kg < 100;
SELECT T1.full_name, T1.gender_id, T1.eye_colour_id, T1.hair_colour_id, T1.skin_colour_id, T1.race_id, T1.publisher_id, T1.alignment_id, T1.height_cm, T1.weight_kg  FROM superhero AS T1  JOIN superpower AS T2 ON T1.id = T2.id  WHERE T1.superhero_name = 'Aquababy'
SELECT T1.weight_kg, T2.race_name FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.id = 40;
SELECT AVG(T1.height_cm) FROM superhero AS T1 JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T2.alignment_name = 'Neutral' AND T1.height_cm != 0;
SELECT T1.id FROM superhero AS T1 JOIN superpower AS T2 ON T1.id = T2.hero_id WHERE T2.power_name = 'Intelligence'
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.superhero_name = 'Blackwulf'
SELECT T2.power_name FROM superhero AS T1 JOIN has_power AS T3 ON T1.id = T3.superhero_id JOIN power AS T2 ON T2.id = T3.power_id WHERE T1.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero)
SELECT T2.driverref FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.raceid = 20 ORDER BY T2.q1 DESC LIMIT 5
SELECT T3.surname FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T1.raceid = 19 ORDER BY T2.q2 LIMIT 1
SELECT T1.year FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.location = 'Shanghai'
SELECT T1.url FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Circuit de Barcelona-Catalunya'
SELECT T1.name FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.country = "Germany"
SELECT T2.location FROM constructors AS T1 JOIN circuits AS T2 ON T1.constructorref = T2.name WHERE T1.name = 'Renault'
SELECT COUNT(*) FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.year = 2010 AND T2.country NOT IN ('China', 'Malaysia', 'Singapore', 'Japan', 'India', 'Turkey', 'Bahrain') AND T2.country NOT IN ('Austria', 'Belgium', 'Czech Republic', 'Denmark', 'Finland', 'France', 'Germany', 'Greece', 'Hungary', 'Ireland', 'Italy', 'Netherlands', 'Norway', 'Poland', 'Portugal', 'Romania', 'Russia', 'Spain', 'Sweden', 'Switzerland', 'Turkey', 'Ukraine', 'United Kingdom')
SELECT T1.name FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.country = 'Spain'
SELECT T2.lat, T2.lng FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Australian Grand Prix'
SELECT T1.url FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Sepang International Circuit'
SELECT T1.time FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Sepang International Circuit'
SELECT T2.lat, T2.lng FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Abu Dhabi Grand Prix'
SELECT T3.nationality FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN constructors AS T3 ON T2.constructorid = T3.constructorid WHERE T1.raceid = 24 AND T2.points = 1
SELECT T2.time FROM races AS T1 JOIN qualifying AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T3.driverid = T2.driverid WHERE T1.raceid = 354 AND T3.forename = 'Bruno' AND T3.surname = 'Senna';
SELECT T1.nationality FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 355 AND T2.q2time = '01:40'
SELECT T2.driverNumber FROM qualifying AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 903 AND T1.q3 LIKE '0:%:54'
SELECT COUNT(*) FROM results JOIN races ON results.raceId = races.raceId WHERE races.name = 'Bahrain Grand Prix' AND results.time IS NULL AND races.year = 2007;
SELECT T2.url FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.raceid = 901
SELECT COUNT(*) FROM results WHERE raceid IN (SELECT raceId FROM races WHERE date = '2015-11-29') AND time IS NOT NULL
SELECT drivers.forename, drivers.surname FROM results JOIN races ON results.raceid = races.raceid JOIN drivers ON results.driverid = drivers.driverid WHERE results.time IS NOT NULL AND races.raceid = 592 ORDER BY drivers.dob ASC LIMIT 1;
SELECT T2.url FROM races AS T1 JOIN results AS T3 ON T1.raceId = T3.raceId JOIN drivers AS T2 ON T2.driverId = T3.driverId WHERE T1.raceId = 161 AND T3.lapTime LIKE '0:01:27%'
SELECT T2.nationality FROM races AS T1 JOIN results AS T3 ON T1.raceId = T3.raceId JOIN drivers AS T2 ON T2.driverId = T3.driverId WHERE T1.raceId = 933 ORDER BY T3.fastestLapSpeed DESC LIMIT 1
SELECT T2.lat, T2.lng FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Malaysian Grand Prix'
SELECT T1.url FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorid = T2.constructorid WHERE raceid = 9 ORDER BY points DESC LIMIT 1
SELECT T2.q1 FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.raceid = 345 AND T2.driverid IN (SELECT driverid FROM drivers WHERE forename = 'Lucas' AND surname = 'di Grassi')
SELECT T3.nationality FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T1.raceid = 347 AND T2.q2time = '01:15'
SELECT T2.code FROM races AS T1 JOIN drivers AS T2 ON T1.raceid = 45 AND T2.q3 LIKE '01:33%' WHERE T1.raceid = 45
SELECT T2.time FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.raceid = 743 AND T2.driverid = (SELECT driverid FROM drivers WHERE forename = 'Bruce' AND surname = 'McLaren')
SELECT T1.driverRef FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'San Marino Grand Prix' AND T2.year = 2006 AND T1.position = 2
SELECT T2.url FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.raceid = 901
SELECT COUNT(*) FROM results WHERE raceid = (SELECT raceId FROM races WHERE date = '2015-11-29') AND time NOT LIKE '%:%'
SELECT T3.driverRef FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T1.raceid = 872 AND T2.time IS NOT NULL ORDER BY T3.dob DESC LIMIT 1
SELECT T1.driverRef ,  T2.forename ,  T2.surname FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE raceId = 348 ORDER BY time ASC LIMIT 1
SELECT T1.nationality FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.fastestLapSpeed = (SELECT MAX(T2.fastestLapSpeed) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId)
SELECT ((SELECT results.fastestLapSpeed FROM results JOIN races ON results.raceId = races.raceId WHERE results.driverId = (SELECT drivers.driverId FROM drivers WHERE drivers.forename = 'Paul' AND drivers.surname = 'di Resta') AND races.raceId = 853) - (SELECT results.fastestLapSpeed FROM results JOIN races ON results.raceId = races.raceId WHERE results.driverId = (SELECT drivers.driverId FROM drivers WHERE drivers.forename = 'Paul' AND drivers.surname = 'di Resta') AND races.raceId = 854)) * 100 / (SELECT results.fastestLapSpeed FROM results JOIN races ON results.raceId = races.raceId WHERE results.driverId = (SELECT drivers.driverId FROM drivers WHERE drivers.forename = 'Paul' AND drivers.surname = 'di Resta') AND races.raceId = 853) AS percentage;
SELECT CAST(SUM(CASE WHEN T2.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.driverId) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.date = '1983-07-16'
SELECT MIN(date) FROM races WHERE name = 'Singapore Grand Prix'
SELECT COUNT(*) FROM races WHERE date LIKE '2005%' ; SELECT name FROM races WHERE date LIKE '2005%' ORDER BY name DESC ;
SELECT name FROM races WHERE date = (SELECT MIN(date) FROM races)
SELECT name, date FROM races WHERE YEAR = 1999 ORDER BY round DESC LIMIT 1;
SELECT date_part('year', date) AS race_year, COUNT(*) AS num_races  FROM races  GROUP BY race_year  ORDER BY num_races DESC  LIMIT 1;
SELECT name FROM races WHERE date LIKE '2017%' EXCEPT SELECT name FROM races WHERE date LIKE '2000%'
SELECT T2.country, T1.name, T2.location FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'European Grand Prix' ORDER BY T1.date ASC LIMIT 1;
SELECT T2.date FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitRef WHERE T1.name = 'Brands Hatch' AND T2.name = 'British Grand Prix' ORDER BY T2.year DESC LIMIT 1;
SELECT COUNT(*) FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Silverstone Circuit' AND T1.name = 'British Grand Prix'
SELECT T3.driverRef FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T1.name = 'Singapore Grand Prix' AND YEAR(T1.date) = 2010 ORDER BY T2.position ASC
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE points = (SELECT MAX(points) FROM results)
SELECT T3.driverRef , T3.points FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T1.name = 'Chinese Grand Prix' AND YEAR(T1.date) = 2017 ORDER BY T2.position ASC LIMIT 3
SELECT T1.forename, T1.surname, T3.name FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T2.milliseconds = (SELECT MIN(milliseconds) FROM laptimes)
SELECT AVG(laps.time)  FROM results  JOIN laps ON results.raceId = laps.raceId AND results.driverId = laps.driverId  JOIN drivers ON drivers.driverId = results.driverId  JOIN races ON races.raceId = results.raceId  WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.name = 'Malaysian Grand Prix' AND races.year = 2009
SELECT CAST(SUM(CASE WHEN T3.position > 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T3.raceId) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T3.surname = 'Hamilton' AND T1.year >= 2010
SELECT T1.nationality ,  T2.forename ,  T2.surname ,  MAX(T3.points) FROM constructors AS T1 JOIN constructorStandings AS T3 ON T1.constructorId = T3.constructorId JOIN drivers AS T2 WHERE T2.driverId = ( SELECT driverId FROM results WHERE position = 1 ) GROUP BY T2.driverId ORDER BY COUNT(*) DESC LIMIT 1
SELECT MIN(YEAR(CURRENT_TIMESTAMP) - YEAR(dob)) AS youngest_age ,  name FROM drivers WHERE nationality = 'Japanese' GROUP BY name ORDER BY dob DESC LIMIT 1
SELECT T2.name FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.date BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY T2.circuitId HAVING COUNT(*) >= 4
SELECT T1.name, T1.location, T2.name FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitRef WHERE T1.country = 'USA' AND strftime('%Y', T2.date) = '2006'
SELECT T1.name, T2.name, T2.location FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE MONTH(T1.date) = 9 AND YEAR(T1.date) = 2005
SELECT races.name FROM races JOIN results ON races.raceid = results.raceid JOIN drivers ON results.driverid = drivers.driverid WHERE drivers.forename = 'Alex' AND drivers.surname = 'Yoong' AND results.position < 20
SELECT COUNT(*) FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN circuits AS T3 ON T1.circuitid = T3.circuitid WHERE T3.name = 'Sepang International Circuit' AND T2.driverid IN (SELECT driverid FROM drivers WHERE forename = 'Michael' AND surname = 'Schumacher') AND T2.position = 1
SELECT results.raceid, races.year FROM results JOIN races ON results.raceid = races.raceid JOIN drivers ON results.driverid = drivers.driverid WHERE drivers.forename = 'Michael' AND drivers.surname = 'Schumacher' GROUP BY results.raceid, races.year ORDER BY MIN(results.milliseconds) ASC LIMIT 1;
SELECT AVG(T1.points) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.name = 'Eddie Irvine' AND T1.year = 2000
SELECT races.name, results.points FROM results JOIN drivers ON results.driverId = drivers.driverId JOIN races ON results.raceId = races.raceId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' ORDER BY races.year ASC LIMIT 1;
SELECT T1.name, T2.country FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE strftime('%Y', T1.date) = '2017' ORDER BY T1.date ASC;
SELECT T2.name, T2.date, T1.location FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuit_id WHERE T2.laps = (SELECT MAX(laps) FROM races)
SELECT CAST(SUM(IIF(T2.country = "Germany", 1, 0)) AS REAL) * 100 / COUNT(*) FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = "European Grand Prix"
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit'
SELECT name FROM circuits WHERE lat = (SELECT MAX(lat) FROM circuits WHERE name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring'))
SELECT T1.circuitRef FROM circuits AS T1 WHERE T1.name = "Marina Bay Street Circuit"
SELECT T2.country FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitRef WHERE T1.alt = (SELECT MAX(`alt`) FROM `circuits`)
SELECT COUNT(*) FROM drivers WHERE code IS NULL
SELECT T2.nationality FROM drivers AS T1 JOIN driverStandings AS T2 ON T1.driverId = T2.driverId WHERE T1.dob IS NOT NULL ORDER BY T1.dob ASC LIMIT 1
SELECT T1.surname FROM drivers AS T1 JOIN driverStandings AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = "Italian" GROUP BY T1.surname
SELECT T1.url FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T1.forename = "Anthony" AND T1.surname = "Davidson" LIMIT 1;
SELECT T1.driverRef FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.name = "Lewis Hamilton" GROUP BY T1.driverRef
SELECT T1.name FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Spanish Grand Prix' AND T2.date = '2009-05-10'
SELECT T2.year FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Silverstone Circuit'
SELECT T2.url FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuit_id WHERE T1.name = 'Silverstone Circuit'
SELECT T1.time FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Abu Dhabi Circuit' AND T1.date BETWEEN '2010-01-01' AND '2019-12-31'
SELECT COUNT(*) FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.country = 'Italy'
SELECT T2.date FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitRef WHERE T1.name = 'Circuit de Barcelona-Catalunya'
SELECT T2.url FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Spanish Grand Prix' AND T1.date LIKE '2009%'
SELECT MIN(T2.fastestLapTime) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton'
SELECT T2.forename ,  T2.surname FROM results AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T1.fastestlapspeed = ( SELECT MAX(fastestlapspeed) FROM results )
SELECT T2.driverRef FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Canadian Grand Prix' AND T1.year = 2007 ORDER BY T2.position ASC LIMIT 1
SELECT T3.name FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton'
SELECT races.name FROM races JOIN results ON races.raceId = results.raceId JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' ORDER BY results.position ASC LIMIT 1;
SELECT MAX(T2.fastestLapSpeed) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Spanish Grand Prix' AND T1.year = 2009
SELECT DISTINCT YEAR(races.date) FROM races JOIN results ON races.raceId = results.raceId WHERE results.driverId IN (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')
SELECT results.positionOrder FROM results JOIN drivers ON results.driverId = drivers.driverId JOIN races ON results.raceId = races.raceId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.name = 'Chinese Grand Prix' AND races.year = 2008
SELECT T3.forename ,  T3.surname FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T1.name = 'Australian Grand Prix' AND T1.year = 1989 AND T2.grid = 4
SELECT COUNT(*) FROM results WHERE raceId = (SELECT id FROM races WHERE name = 'Australian Grand Prix' AND date = '2008-03-16') AND time IS NOT NULL
SELECT T3.time FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN laps AS T3 ON T2.resultid = T3.resultid WHERE T1.name = 'Australian Grand Prix' AND T1.year = 2008 AND T2.driverid = (SELECT driverid FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton') ORDER BY T3.milliseconds ASC LIMIT 1
SELECT T2.time FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.year = 2008 AND T1.name = 'Australian Grand Prix' AND T2.position = 2
SELECT T2.driverRef ,  T2.url FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.name = 'Australian Grand Prix' AND SUBSTR(T1.date ,  -4) = '2008' AND T2.position = '1'
SELECT COUNT(*)  FROM results  JOIN drivers ON results.driverId = drivers.driverId  WHERE results.raceId IN (     SELECT races.raceId      FROM races      WHERE races.name = 'Australian Grand Prix' AND YEAR(races.date) = 2008 ) AND drivers.nationality = 'British';
SELECT COUNT(*) FROM (SELECT T1.driverId FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Chinese Grand Prix' AND T2.year = 2008 AND T1.time IS NOT NULL GROUP BY T1.driverId HAVING COUNT(T1.raceId) > 0)
SELECT SUM(T2.points) FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton'
SELECT AVG(T2.fastestLapTime) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton') AND T1.name LIKE '%Formula_1%'
SELECT CAST(SUM(CASE WHEN T3.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) / COUNT(T2.raceid) FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN circuits AS T3 ON T1.circuitid = T3.circuitid WHERE T1.year = 2008 AND T1.name = 'Australian Grand Prix'
SELECT (T2.time - T1.time) * 100 / T2.time FROM (SELECT time FROM results WHERE raceId = (SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND year = 2008) AND position = 1) AS T1, (SELECT SUM(time) AS time FROM results WHERE raceId = (SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND year = 2008)) AS T2
SELECT COUNT(*) FROM circuits WHERE location = 'Adelaide' AND country = 'Australia'
SELECT lat, lng FROM circuits WHERE country = 'USA'
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND YEAR(dob) > 1980;
SELECT MAX(T1.points) FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = "British"
SELECT MAX(points), constructorRef FROM results JOIN constructors ON results.constructorId = constructors.constructorId GROUP BY constructorRef ORDER BY points DESC LIMIT 1;
SELECT T3.name FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN constructors AS T3 ON T2.constructorId = T3.constructorId WHERE T1.raceId = 291 AND T2.points = 0
SELECT COUNT(*) FROM (SELECT T1.constructorId FROM constructors AS T1 JOIN results AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = "Japanese" AND T2.points = 0 GROUP BY T1.constructorId HAVING COUNT(T2.raceId) = 2)
SELECT constructorRef FROM results WHERE position = 1 GROUP BY constructorRef
SELECT COUNT(*) FROM constructors AS T1 JOIN constructorresults AS T2 ON T1.constructorid = T2.constructorid WHERE T1.nationality = "French" AND T2.laps > 50;
SELECT CAST(COUNT(CASE WHEN T3.time IS NOT NULL THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.driverId) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T2.year BETWEEN 2007 AND 2009 AND T3.nationality = "Japanese"
SELECT AVG(T2.time) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.year < 1975 AND T2.position = 1 AND T2.time NOT NULL GROUP BY T1.year
SELECT T1.forename ,  T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T1.dob > '1975-01-01' AND T2.position = '2'
SELECT COUNT(*) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.nationality = "Italian" AND T1.time IS NULL;
SELECT T1.forename ,  T1.surname FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid WHERE T2.rank = 1 ORDER BY T2.milliseconds LIMIT 1
SELECT T3.number FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN laps AS T3 ON T2.resultid = T3.resultid WHERE T1.year = 2009 ORDER BY T3.milliseconds ASC LIMIT 1
SELECT AVG(T2.fastestLapSpeed) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Spanish Grand Prix' AND T1.year = 2009
SELECT T1.name ,  strftime('%Y',T1.date) FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T2.milliseconds != '' ORDER BY T2.milliseconds LIMIT 1;
SELECT CAST(SUM(CASE WHEN T3.year < 1985 AND T1.laps > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.driverId) FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T1.driverid = T3.driverid WHERE T2.year BETWEEN 2000 AND 2005
SELECT COUNT(*) FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T1.nationality = "French" AND T2.laptime < "02:00.00" AND T2.laptime < "120"
SELECT driverRef FROM drivers WHERE nationality = 'American'
SELECT circuitId FROM races WHERE date LIKE '2009%'
SELECT COUNT(*) FROM results WHERE raceId = 18;
SELECT T1.driverId , COUNT(T1.driverId) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = "Dutch" GROUP BY T1.driverId ORDER BY T1.dob DESC LIMIT 3;
SELECT T1.driverRef FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = "Robert" AND T1.surname = "Kubica";
SELECT COUNT(*) FROM drivers WHERE nationality = "British" AND YEAR(dob) = 1980;
SELECT T3.forename, T3.surname FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T3.nationality = 'German' AND strftime('%Y', T3.dob) BETWEEN '1980' AND '1990' ORDER BY T2.time LIMIT 3
SELECT T1.driverRef FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = 'German' ORDER BY STRFTIME('%Y', T1.dob) ASC LIMIT 1;
SELECT T2.driverId, T2.code FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE YEAR(T2.dob) = 1971 AND T1.fastestLapTime IS NOT NULL GROUP BY T2.driverId, T2.code ORDER BY T1.fastestLapTime LIMIT 1
SELECT T3.name FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T3.nationality = "Spanish" AND YEAR(T3.dob) < 1982 ORDER BY T2.time DESC LIMIT 10
SELECT year FROM races WHERE fastestLapTime = (SELECT MIN(fastestLapTime) FROM races)
SELECT YEAR FROM races WHERE time = (SELECT MAX(time) FROM races)
SELECT T1.driverId FROM (SELECT driverId, MIN(time) AS min_time FROM laps GROUP BY driverId) AS T1 JOIN (SELECT driverId, time AS first_lap_time FROM laps WHERE lap = 1 GROUP BY driverId) AS T2 ON T1.driverId = T2.driverId WHERE T1.min_time = T2.first_lap_time ORDER BY T1.min_time LIMIT 5
SELECT COUNT(*) FROM results WHERE raceId BETWEEN 50 AND 100 AND statusId = 2 AND time IS NOT NULL
SELECT COUNT(*), T1.location, T1.lat, T1.lng FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.country = 'Austria' GROUP BY T1.location, T1.lat, T1.lng
SELECT T1.raceId, COUNT(*) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T1.time IS NOT NULL GROUP BY T1.raceId ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.driverRef, T1.nationality, T1.dob FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 23 AND T2.q2 IS NOT NULL;
SELECT T3.year, T3.name, T3.date, T3.time FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T1.dob = (SELECT MIN(dob) FROM drivers) AND T3.date = (SELECT MIN(date) FROM races)
SELECT COUNT(*) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.nationality = "American" AND T1.status = "Puncture"
SELECT T1.url FROM constructors AS T1 JOIN results AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = 'Italian' ORDER BY T2.points DESC LIMIT 1
SELECT T1.url FROM constructors AS T1 JOIN results AS T2 ON T1.constructorId = T2.constructorId WHERE T2.position = 1 GROUP BY T1.constructorId ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.driver FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.name = 'French Grand Prix' ORDER BY T2.time DESC LIMIT 1;
SELECT T2.name, MIN(T1.time) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T1.lap = 1 GROUP BY T2.name ORDER BY MIN(T1.time) ASC LIMIT 1;
SELECT AVG(T3.fastestlaptime) FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN (SELECT raceid, driverid, fastestlaptime, RANK() OVER(PARTITION BY raceid ORDER BY fastestlaptime) as rank FROM results) AS T3 ON T2.raceid = T3.raceid AND T2.driverid = T3.driverid WHERE T1.name = 'United States Grand Prix' AND T1.year = 2006 AND T3.rank < 11
SELECT T3.forename, T3.surname FROM (SELECT T2.driverId, AVG(T1.duration) as avg_duration FROM pitStops AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.dob BETWEEN '1980-01-01' AND '1985-12-31' AND T2.nationality = 'German' GROUP BY T2.driverId) AS T4 JOIN drivers AS T3 ON T4.driverId = T3.driverId ORDER BY T4.avg_duration ASC LIMIT 3
SELECT T3.time FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN circuits AS T3 ON T1.circuitid = T3.circuitid WHERE T1.name = 'Canadian Grand Prix' AND T1.year = 2008 AND T2.position = 1
SELECT T1.constructorRef, T1.url FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Singapore Grand Prix' AND T2.year = 2009 ORDER BY T1.time LIMIT 1
SELECT T1.forename, T1.surname, T1.dob FROM drivers AS T1 JOIN driverStandings AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = 'Austrian' AND YEAR(T1.dob) BETWEEN 1981 AND 1991
SELECT T1.forename, T1.surname, T1.wiki, T1.dob FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T1.nationality = 'German' AND YEAR(T1.dob) BETWEEN 1971 AND 1985 ORDER BY T1.dob DESC
SELECT T1.location, T1.country, T1.lat, T1.lng FROM circuits AS T1 WHERE T1.name = 'Hungaroring'
SELECT MAX(results.points), constructors.name, constructors.nationality  FROM results  JOIN races ON results.raceId = races.raceId  JOIN constructors ON results.constructorId = constructors.constructorId  WHERE races.name = 'Monaco Grand Prix' AND races.year BETWEEN 1980 AND 2010;
SELECT AVG(T3.points) FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T1.name = 'Turkish Grand Prix' AND T3.forename = 'Lewis' AND T3.surname = 'Hamilton'
SELECT AVG(cnt) FROM (SELECT COUNT(*) AS cnt FROM races WHERE date BETWEEN '2000-01-01' AND '2010-12-31' GROUP BY strftime('%Y', date)) AS yearly_cnts;
SELECT nationality FROM drivers GROUP BY nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T2.driverid = (SELECT driverid FROM drivers WHERE rank = '91') AND T2.position = 1
SELECT T1.name FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T2.fastestlaptime IS NOT NULL ORDER BY T2.fastestlaptime LIMIT 1
SELECT T2.location, T2.country FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.date = (SELECT MAX(date) FROM races)
SELECT T3.forename, T3.surname FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T1.year = 2008 AND T1.circuitid IN (SELECT circuitid FROM circuits WHERE name = 'Marina Bay Street Circuit') ORDER BY T2.q3 ASC LIMIT 1
SELECT T1.forename, T1.surname, T1.nationality, T3.name FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T1.dob = (SELECT MAX(dob) FROM drivers)
SELECT COUNT(*) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE name = 'Canadian Grand Prix') AND statusId = 3 GROUP BY driverId ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) , T1.forename ,  T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T1.dob = ( SELECT MIN(dob) FROM drivers ) AND T2.position = '1' GROUP BY T1.forename ,  T1.surname
SELECT MAX(time) FROM races WHERE name = 'Pit Stop'
SELECT T1.time FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.fastestLapRank = 1 ORDER BY T1.time LIMIT 1
SELECT MAX(T2.duration) FROM races AS T1 JOIN pitStops AS T2 ON T1.raceId = T2.raceId WHERE T2.driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')
SELECT T3.lap FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN pitstops AS T3 ON T2.resultid = T3.driverid WHERE T1.name = 'Australian Grand Prix' AND T1.year = 2011 AND T2.driverid IN (SELECT driverid FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')
SELECT T3.duration FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN pitstops AS T3 ON T2.driverid = T3.driverid AND T2.stop = T3.stop WHERE T1.name = 'Australian Grand Prix' AND T1.year = 2011
SELECT T2.time FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton') ORDER BY T2.time LIMIT 1;
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid WHERE T2.milliseconds = (SELECT MIN(milliseconds) FROM laptimes) LIMIT 1;
SELECT T2.position FROM (SELECT circuitId, MIN(time) AS fastest_lap_time FROM races GROUP BY circuitId) AS T1 JOIN results AS T2 ON T1.circuitId = T2.circuitId AND T1.fastest_lap_time = T2.time WHERE driverRef = 'lewis_hamilton'
SELECT T1.time FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Austrian Grand Prix' ORDER BY T1.time LIMIT 1;
SELECT T1.name, MIN(T2.time) FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuit_id WHERE T1.country = 'Italy' GROUP BY T1.name
SELECT T2.name FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Austrian Grand Prix' ORDER BY T1.time LIMIT 1
SELECT T2.duration FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.name = 'Austrian Grand Prix' AND T2.fastestlap = 1
SELECT T2.lat, T2.lng FROM results AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.fastestLapTime = '1:29.488'
SELECT AVG(T2.milliseconds) FROM races AS T1 JOIN pitStops AS T2 ON T1.raceId = T2.raceId WHERE T2.driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')
SELECT AVG(T2.milliseconds) FROM circuits AS T1 JOIN laps AS T2 ON T1.circuitid = T2.circuit_id WHERE T1.country = 'Italy'
SELECT T1.player_api_id FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.overall_rating DESC LIMIT 1;
SELECT player_name, MAX(height) FROM Player
SELECT T1.preferred_foot FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.preferred_foot IS NOT NULL AND T1.attacking_work_rate IS NOT NULL ORDER BY T2.potential ASC LIMIT 1
SELECT COUNT(*) FROM Player_Attributes WHERE overall_rating BETWEEN 60 AND 65 AND defensive_work_rate = 'Low'
SELECT T1.player_name, T2.player_fifa_api_id FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.crossing IS NOT NULL ORDER BY T2.crossing DESC LIMIT 5;
SELECT T1.name FROM League AS T1 JOIN Match AS T2 ON T1.id = T2.country_id WHERE T2.season = '2015/2016' GROUP BY T1.name ORDER BY SUM(T2.home_team_goal + T2.away_team_goal) DESC LIMIT 1
SELECT T1.team_api_id FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id WHERE T2.season = '2015/2016' AND (T2.home_team_goal - T2.away_team_goal) < 0 GROUP BY T1.team_api_id ORDER BY COUNT(*) ASC LIMIT 1
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.penalties IS NOT NULL ORDER BY T1.penalties DESC LIMIT 10;
SELECT T1.team_long_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id WHERE T2.season = '2009/2010' AND T2.league_id IN (SELECT League.id FROM League WHERE League.name = 'Scotland Premier League') AND T2.away_team_goal > T2.home_team_goal GROUP BY T2.away_team_api_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.buildUpPlaySpeed FROM  (SELECT TeamID, MAX(buildUpPlaySpeed) as buildUpPlaySpeed FROM Team GROUP BY TeamID ORDER BY buildUpPlaySpeed DESC LIMIT 4) AS T1  JOIN Team AS T2 ON T1.TeamID = T2.TeamID WHERE T1.buildUpPlaySpeed = T2.buildUpPlaySpeed ORDER BY T2.buildUpPlaySpeed DESC;
SELECT T1.name FROM League AS T1 JOIN Match AS T2 ON T1.country_id = T2.country_id WHERE T2.season = '2015/2016' GROUP BY T1.name ORDER BY SUM(CASE WHEN T2.home_team_goal = T2.away_team_goal THEN 1 ELSE 0 END) DESC LIMIT 1
SELECT T1.player_name ,  (strftime('%Y', 'now') - strftime('%Y', T1.birthday)) AS age FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.sprint_speed >= 97 AND T2.date BETWEEN '2013-01-01' AND '2015-12-31'
SELECT T2.name ,  COUNT(T1.league_id) FROM Match AS T1 JOIN League AS T2 ON T1.league_id = T2.id GROUP BY T1.league_id ORDER BY COUNT(T1.league_id) DESC LIMIT 1
SELECT AVG(height) FROM Player WHERE birthday >= '1990-01-01 00:00:00' AND birthday < '1996-01-01 00:00:00'
SELECT T1.player_api_id FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE SUBSTR(T2.date, 1, 4) = '2010' GROUP BY T1.player_api_id HAVING AVG(T2.overall_rating) > (SELECT AVG(overall_rating) FROM Player_Attributes WHERE SUBSTR(date, 1, 4) = '2010') ORDER BY AVG(T2.overall_rating) DESC LIMIT 1
SELECT team_api_id FROM Team WHERE buildUpPlaySpeed > 50 AND buildUpPlaySpeed < 60
SELECT T2.team_long_name FROM Team_Attributes AS T1 JOIN Teams AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlayPassing > (SELECT AVG(buildUpPlayPassing) FROM Team_Attributes WHERE strftime('%Y', date) = '2012') AND strftime('%Y', T1.date) = '2012'
SELECT CAST(SUM(CASE WHEN T2.preferred_foot = 'left' THEN 1 ELSE 0 END) * 100 AS REAL) / COUNT(T1.player_fifa_api_id) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE strftime('%Y', T1.birthday) BETWEEN '1987' AND '1992'
SELECT T1.name FROM League AS T1 JOIN (SELECT league_id, SUM(away_team_goal) + SUM(home_team_goal) as total_goals FROM Match GROUP BY league_id) AS T2 ON T1.id = T2.league_id ORDER BY total_goals ASC LIMIT 5;
SELECT AVG(T2.long_shots) FROM Player AS T1 JOIN Player_Stats AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.player_name = 'Ahmed Samir Farag'
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.height > 180 GROUP BY T2.player_name ORDER BY AVG(T1.heading_accuracy) DESC LIMIT 10
SELECT T2.team_long_name FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlayDribblingClass = 'Normal' AND T1.date BETWEEN '2014-01-01 00:00:00' AND '2014-01-31 00:00:00' AND T1.chanceCreationPassing < (SELECT AVG(chanceCreationPassing) FROM Team_Attributes WHERE date BETWEEN '2014-01-01 00:00:00' AND '2014-01-31 00:00:00') ORDER BY T1.chanceCreationPassing DESC
SELECT T1.name FROM League AS T1 JOIN Match AS T2 ON T1.country_id = T2.country_id WHERE T2.season = '2009/2010' GROUP BY T1.name HAVING SUM(T2.home_team_goal) / COUNT(DISTINCT T2.id) > SUM(T2.away_team_goal) / COUNT(DISTINCT T2.id)
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers' LIMIT 1;
SELECT player_name FROM Player WHERE SUBSTR(birthday, 1, 7) = '1970-10'
SELECT T2.attacking_work_rate FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = "Franco Zennaro" ORDER BY T2.date DESC LIMIT 1;
SELECT T2.buildUpPlayPositioningClass FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_fifa_api_id WHERE T1.team_long_name = 'ADO Den Haag' AND T2.date LIKE '2014%' LIMIT 1;
SELECT T2.heading_accuracy FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Francois Affolter' AND T2.date = '2014-09-18 00:00:00'
SELECT T1.overall_rating FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = "Gabriel Tamas" AND strftime('%Y', T1.date) = '2011'
SELECT COUNT(*) FROM Match WHERE season = '2015/2016' AND league_id IN (SELECT id FROM League WHERE name = 'Scotland Premier League')
SELECT T1.preferred_foot FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id ORDER BY T2.birthday DESC LIMIT 1;
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.potential = (SELECT MAX(potential) FROM Player_Attributes)
SELECT COUNT(*) FROM Player WHERE weight < 130 AND preferred_foot = 'left'
SELECT T1.team_short_name FROM Team AS T1 JOIN Player_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.chanceCreationPassingClass = 'Risky' GROUP BY T1.team_short_name;
SELECT T2.defensive_work_rate FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'David Wilson' ORDER BY T2.date DESC LIMIT 1
SELECT T2.birthday FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)
SELECT T1.name FROM League AS T1 JOIN Country AS T2 ON T1.country_id = T2.id WHERE T2.name = "Netherlands"
SELECT AVG(T2.home_team_goal) FROM Country AS T1 JOIN League AS T2 ON T1.id = T2.country_id JOIN Match AS T3 ON T2.id = T3.league_id WHERE T1.name = 'Poland' AND T3.season = '2010/2011'
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.height = (SELECT MAX(T3.height) FROM Player AS T3 UNION SELECT MIN(T4.height) FROM Player AS T4) GROUP BY T1.player_name ORDER BY AVG(T2.finishing) DESC LIMIT 1
SELECT player_name FROM Player WHERE height > 180
SELECT COUNT(*) FROM Player WHERE strftime('%Y', birthday) > '1990'
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Adam%' AND weight > 170;
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.overall_rating > 80 AND strftime('%Y', T1.date) BETWEEN '2008' AND '2010' GROUP BY T2.player_name
SELECT T2.potential FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = "Aaron Doran" ORDER BY T2.date DESC LIMIT 1;
SELECT player_name FROM Player WHERE preferred_foot = 'left'
SELECT T1.team_long_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeedClass = 'Fast' GROUP BY T1.team_long_name
SELECT T2.buildUpPlayPassingClass FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.id WHERE T1.team_short_name = 'CLB' ORDER BY T2.date DESC LIMIT 1;
SELECT T1.team_short_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlayPassing > 70
SELECT AVG(T2.overall_rating) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.height > 170 AND strftime('%Y', T2.date) BETWEEN '2010' AND '2015'
SELECT player_name FROM Player WHERE height = (SELECT MIN(height) FROM Player)
SELECT T1.country FROM Country AS T1 JOIN League AS T2 ON T1.id = T2.country_id WHERE T2.name = "Italy Serie A"
SELECT T1.team_short_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_fifa_api_id WHERE T2.buildUpPlaySpeed = 31 AND T2.buildUpPlayDribbling = 53 AND T2.buildUpPlayPassing = 32
SELECT AVG(T2.overall_rating) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Aaron Doran'
SELECT COUNT(*) FROM Match WHERE league_id IN (SELECT id FROM League WHERE name = 'Germany 1. Bundesliga') AND strftime('%Y-%m', date) BETWEEN '2008-08' AND '2008-10'
SELECT T2.team_short_name FROM Match AS T1 JOIN Team AS T2 ON T1.home_team_api_id = T2.team_api_id WHERE T1.home_team_goal = 10
SELECT player_name FROM Player WHERE balance = (SELECT MAX(T1.balance) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.potential = 61) AND potential = 61;
SELECT (SUM(CASE WHEN T1.player_name = 'Abdou Diallo' THEN T2.ball_control ELSE 0 END) / COUNT(CASE WHEN T1.player_name = 'Abdou Diallo' THEN T1.id ELSE NULL END)) - (SUM(CASE WHEN T1.player_name = 'Aaron Appindangoye' THEN T2.ball_control ELSE 0 END) / COUNT(CASE WHEN T1.player_name = 'Aaron Appindangoye' THEN T1.id ELSE NULL END)) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN' LIMIT 1;
SELECT player_name FROM Player WHERE player_name = 'Aaron Lennon' OR player_name = 'Abdelaziz Barrada' ORDER BY STRFTIME('%Y-%m-%d', birthday) LIMIT 1;
SELECT player_name FROM Player WHERE height = (SELECT MAX(height) FROM Player)
SELECT COUNT(*) FROM Player WHERE preferred_foot = 'left' AND attacking_work_rate = 'low'
SELECT T1.country FROM Country AS T1 JOIN League AS T2 ON T1.id = T2.country_id WHERE T2.name = "Belgium Jupiler League"
SELECT League.name FROM League JOIN Country ON League.country_id = Country.id WHERE Country.name = 'Germany'
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.attribute_name = 'Overall Rating' ORDER BY CAST(SUBSTRING(T1.attribute_value, 1, LENGTH(T1.attribute_value) - 1) AS REAL) DESC LIMIT 1
SELECT COUNT(DISTINCT T2.player_api_id) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE strftime('%Y', T2.birthday)<'1986' AND T1.defensive_work_rate='High'
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone') ORDER BY T1.crossing DESC LIMIT 1
SELECT T2.BHA FROM Player AS T1 JOIN Player_Stats AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Ariel Borysiuk'
SELECT COUNT(*) FROM Player WHERE height > 180 AND volleys > 70
SELECT T1.player_name FROM Player AS T1 JOIN Player_Stats AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.VCA > 70 AND T2.GBA > 70
SELECT COUNT(*) FROM Match WHERE season = '2008/2009' AND country_id IN (SELECT id FROM Country WHERE name = 'Belgium')
SELECT MAX(T1.long_passing) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.long_passing IN (SELECT long_passing FROM Player_Attributes WHERE player_fifa_api_id = T2.player_fifa_api_id) AND T2.birthday = (SELECT MIN(birthday) FROM Player)
SELECT COUNT(*) FROM Match WHERE league_id IN (SELECT id FROM League WHERE name = 'Belgium Jupiler League') AND SUBSTR(date, 1, 7) = '2009-04'
SELECT T1.name FROM League AS T1 JOIN Match AS T2 ON T1.id = T2.league_id WHERE T2.season = '2008/2009' GROUP BY T1.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT AVG(T2.overall_rating) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE strftime('%Y', T1.birthday) < '1986'
SELECT (T2.overall_rating - T1.overall_rating) / T1.overall_rating * 100 FROM Player AS T1 JOIN Player_Stats AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Ariel Borysiuk' AND T2.player_api_id IN (SELECT player_api_id FROM Player WHERE player_name = 'Paulin Puel')
SELECT AVG(T2.buildUpPlaySpeed) FROM Player AS T1 JOIN Player_Stats AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.team_long_name = 'Heart of Midlothian'
SELECT AVG(T1.overall_rating) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Pietro Marino'
SELECT SUM(T1.crossing) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Aaron Lennox'
SELECT T2.chanceCreationPassingClass, MAX(T2.chanceCreationPassing) FROM Team AS T1 JOIN Player_Attributes AS T2 ON T1.team_api_id = T2.team_id WHERE T1.team_long_name = 'Ajax' GROUP BY T2.chanceCreationPassingClass ORDER BY MAX(T2.chanceCreationPassing) DESC LIMIT 1
SELECT T1.preferred_foot FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Abdou Diallo' GROUP BY T1.preferred_foot ORDER BY COUNT(T2.id) DESC LIMIT 1
SELECT MAX(T1.overall_rating) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Dorlan Pabon'
SELECT AVG(T2.away_team_goal) FROM Matches AS T1 JOIN League AS T2 ON T1.match_api_id = T2.match_api_id WHERE T1.team_long_name_away = 'Parma' AND T1.country = 'Italy'
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.overall_rating = 77 AND T2.date LIKE '2016-06-23%' ORDER BY T1.birthday ASC LIMIT 1
SELECT T1.overall_rating FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Aaron Mooy' AND T1.date LIKE '2016-02-04%'
SELECT T1.potential FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Francesco Parravicini' AND T1.date = '2010-08-30 00:00:00'
SELECT T1.attacking_work_rate FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Francesco Migliore' AND T1.date LIKE '2015-05-01%'
SELECT T1.DW FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Kevin Berigaud' AND T1.date = '2013-02-22 00:00:00'
SELECT T1.date FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Kevin Constant' AND T1.crossing = (SELECT MAX(crossing) FROM Player_Attributes WHERE player_fifa_api_id = (SELECT player_fifa_api_id FROM Player WHERE player_name = 'Kevin Constant'))
SELECT T3.BUPS FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id WHERE T1.team_long_name = 'Willem II' AND T2.date = '2012-02-22' JOIN Team_Attributes AS T3 ON T1.team_api_id = T3.team_api_id AND T2.date = T3.date
SELECT T3.BUP FROM Team AS T1 JOIN Player_Attributes AS T2 ON T1.team_api_id = T2.player_fifa_api_id JOIN Player AS T3 ON T2.player_fifa_api_id = T3.player_fifa_api_id WHERE T1.team_short_name = 'LEI' AND T2.date = '2015-09-10 00:00:00'
SELECT T3.BUP FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id JOIN Team_Statistics AS T3 ON T2.id = T3.match_api_id WHERE T1.team_long_name = 'FC Lorient' AND T2.date LIKE '2010-02-22%'
SELECT T4.CCP FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id WHERE T1.team_long_name = 'PEC Zwolle' AND T2.date = '2013-09-20 00:00:00' UNION SELECT T4.CCP FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id WHERE T1.team_long_name = 'PEC Zwolle' AND T2.date = '2013-09-20 00:00:00'
SELECT T3.cc_crossing FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id JOIN (SELECT chance_creation_crossing AS cc_crossing FROM Player_Attributes WHERE date = '2010-02-22 00:00:00' AND player_api_id IN(SELECT player_api_id FROM Player WHERE team_long_name = 'Hull City')) AS T3 WHERE T1.date = '2010-02-22 00:00:00' AND T2.team_long_name = 'Hull City'
SELECT T1.def_aggression FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_long_name = 'Hannover 96' AND T1.date LIKE '2015-09-10%'
SELECT AVG(T1.overall_rating) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Marko Arnautovic' AND SUBSTR(T1.date, 1, 10) BETWEEN '2007-02-22' AND '2016-04-21'
SELECT (SUM(CASE WHEN T2.player_name = 'Landon Donovan' THEN T1.overall_rating ELSE 0 END) - SUM(CASE WHEN T2.player_name = 'Jordan Bowery' THEN T1.overall_rating ELSE 0 END)) / SUM(CASE WHEN T2.player_name = 'Landon Donovan' THEN T1.overall_rating ELSE 0 END) * 100 FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE date = '2013-07-12'
SELECT player_name FROM Player ORDER BY height DESC LIMIT 1
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10
SELECT player_name FROM Player WHERE (datetime('now','localtime') - datetime(birthday)) / 365 >= 35
SELECT COUNT(T1.home_team_goal) FROM Match AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = "Aaron Lennon"
SELECT SUM(T2.away_team_goal) FROM Player AS T1 JOIN Game AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name IN ('Daan Smith', 'Filipe Ferreira')
SELECT SUM(T2.home_team_goal) FROM Player AS T1 JOIN Match AS T2 ON T1.player_api_id = T2.player_api_id WHERE (datetime('now') - datetime(T1.birthday)) / 365 <= 30
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.potential = (SELECT MAX(potential) FROM Player_Attributes)
SELECT player_name FROM Player WHERE attacking_work_rate = 'High'
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.finishing = 1 ORDER BY datetime('now') - datetime(T2.birthday) DESC LIMIT 1
SELECT T2.player_name FROM Country AS T1 JOIN Player_Attributes AS T2 ON T1.id = T2.country_id WHERE T1.name = 'Belgium'
SELECT T1.player_name ,  T2.country FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.vision > 89
SELECT T1.country_name FROM Country AS T1 JOIN Player AS T2 ON T1.id = T2.country_id GROUP BY T1.country_name ORDER BY AVG(T2.weight) DESC LIMIT 1
SELECT T2.team_long_name FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlaySpeedClass = 'Slow' GROUP BY T2.team_long_name
SELECT T1.team_short_name FROM Team AS T1 JOIN Player_Attributes AS T2 ON T1.team_api_id = T2.player_team_api_id WHERE T2.chanceCreationPassingClass = 'Safe'
SELECT AVG(T2.height) FROM Country AS T1 JOIN Player AS T2 ON T1.id = T2.country_id WHERE T1.name = 'Italy'
SELECT player_name FROM Player WHERE height > 180 ORDER BY player_name ASC LIMIT 3
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND birthday > '1990-01-01'
SELECT (SELECT JUMPING FROM Player_Attributes WHERE player_fifa_api_id = 6) - (SELECT JUMPING FROM Player_Attributes WHERE player_fifa_api_id = 23) AS difference_in_jumping_scores
SELECT T1.player_api_id FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.preferred_foot = 'right' ORDER BY T2.potential ASC LIMIT 5;
SELECT COUNT(*) FROM Player WHERE preferred_foot = 'left' AND crossing = (SELECT MAX(crossing) FROM Player)
SELECT CAST(SUM(CASE WHEN T1.stamina > 80 AND T1.strength > 80 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id
SELECT T2.country FROM League AS T1 JOIN Country AS T2 ON T1.country_id = T2.id WHERE T1.name = 'Poland Ekstraklasa'
SELECT T1.home_team_goal , T1.away_team_goal FROM Match AS T1 JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.date LIKE '2008-09-24%' AND T2.name = 'Belgium Jupiler League'
SELECT T1.sprint_speed ,  T1.agility ,  T1.acceleration FROM Player_Stats AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = "Alexis Blin"
SELECT T2.buildUpPlaySpeedClass FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'KSV Cercle Brugge' ORDER BY T2.date DESC LIMIT 1;
SELECT COUNT(*) FROM Game WHERE season = '2015/2016' AND league = 'Italian Serie A'
SELECT MAX(T1.home_team_goal) FROM Match AS T1 JOIN League AS T2 ON T1.league_id = T2.id WHERE T2.country = 'Netherlands' AND T2.name = 'Eredivisie'
SELECT T1.finishing, T1.curve FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.weight = (SELECT MAX(weight) FROM Player) LIMIT 1;
SELECT T2.name FROM Country AS T1 JOIN League AS T2 ON T1.id = T2.country_id JOIN Match AS T3 ON T2.id = T3.league_id WHERE T3.season = '2015/2016' GROUP BY T2.name ORDER BY COUNT(T3.id) DESC LIMIT 4
SELECT T1.team_long_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id WHERE T2.away_team_goal = (SELECT MAX(away_team_goal) FROM Match)
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes) LIMIT 1;
SELECT CAST(SUM(CASE WHEN T2.height < 180 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.player_api_id) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.overall_rating > 70
SELECT      CASE          WHEN SUM(CASE WHEN T2.Admission = '+' THEN 1 ELSE 0 END) > SUM(CASE WHEN T2.Admission = '-' THEN 1 ELSE 0 END)              THEN 'More In-Patients'          ELSE 'More Outpatients'      END AS Result,     ABS(SUM(CASE WHEN T2.Admission = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN T2.Admission = '-' THEN 1 ELSE 0 END)) /      (SUM(CASE WHEN T2.Admission = '+' THEN 1 ELSE 0 END) + SUM(CASE WHEN T2.Admission = '-' THEN 1 ELSE 0 END)) * 100 AS Deviation_Percentage FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND (T2.Admission = '+' OR T2.Admission = '-')
SELECT CAST(SUM(CASE WHEN T2.SEX = 'F' AND YEAR(T2.Birthday) > 1930 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(CASE WHEN T2.SEX = 'F' THEN 1 ELSE NULL END) FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID
SELECT CAST(SUM(CASE WHEN T2.Admisson = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE strftime('%Y', T1.Birthday) BETWEEN '1930' AND '1940'
SELECT CAST(SUM(CASE WHEN T2.Admisson = '+' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T2.Admisson = '-' THEN 1 ELSE 0 END) FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'SLE'
SELECT T2.Diagnosis, T1.LabTestDate FROM Lab AS T1 JOIN Examination AS T2 ON T1.Patient_ID = T2.ID WHERE T1.Patient_ID = 30609 GROUP BY T1.LabTestDate, T2.Diagnosis
SELECT T1.Sex ,  T1.Birthday ,  T2.Examination_Date ,  T2.Symptoms FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.ID = '163109'
SELECT T1.ID, T1.Sex, T1.Birthday FROM Patient AS T1 JOIN LabTest AS T2 ON T1.ID = T2.Patient WHERE T2.LDH > 500 AND T2.Test_Name = 'LDH'
SELECT T1.ID, (YEAR(CURRENT_TIMESTAMP) - YEAR(T1.Birthday)) AS Age FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.RVVT = '+'
SELECT T1.ID, T1.Sex, T2.Diagnosis FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Thrombosis = 2
SELECT Patient.ID FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE YEAR(Patient.Birthday) = 1937 AND Examination.T_CHO >= 250
SELECT T1.ID, T1.Sex, T2.Diagnosis FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.ALB < 3.5;
SELECT CAST(SUM(CASE WHEN T2.Sex = 'F' AND (T2.TP < 6.0 OR T2.TP > 8.5) THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.ID) FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID
SELECT AVG(T2.aCL_IgG) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Admisson = '+' AND EXTRACT(YEAR FROM CURRENT_TIMESTAMP) - EXTRACT(YEAR FROM T1.Birthday) >= 50
SELECT COUNT(*) FROM Patient WHERE Sex = 'F' AND YEAR(AdmissionDate) = 1997 AND Admission = '-'
SELECT MIN(T2.age) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Examination_Date = T1.First_Date
SELECT COUNT(*) FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Patient.Sex = 'F' AND Examination.Thrombosis = 1 AND strftime('%Y', Examination.Examination_Date) = '1997'
SELECT MAX(T2.Birthday) - MIN(T2.Birthday) AS AgeGap FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.Patient_ID = T2.ID WHERE T1.Triglyceride >= 200 AND T1.Triglyceride < 8 GROUP BY T2.ID
SELECT T2.Symptoms, T2.Diagnosis FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Birthday = (SELECT MAX(Birthday) FROM Patient WHERE Examination IS NOT NULL)
SELECT COUNT(T1.ID) / 12 AS average_male_patients_per_month FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.Examination_Date BETWEEN '1998-01-01' AND '1998-12-31'
SELECT T1.Examination_Date ,  T2.Birthday FROM `Examination` AS T1 JOIN `Patient` AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis LIKE '%SJS%' ORDER BY T2.Birthday LIMIT 1
SELECT CAST(SUM(CASE WHEN T1.SEX = 'M' AND T2.UA <= 8 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T1.SEX = 'F' AND T2.UA <= 6.5 THEN 1 ELSE 0 END) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 LEFT JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Examination_Date IS NULL OR DATE_SUB(T2.Examination_Date, INTERVAL 1 YEAR) < T1.First_Date
SELECT COUNT(DISTINCT T2.ID) FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE YEAR(T1.Examination_Date) BETWEEN 1990 AND 1993 AND YEAR(T2.Birthday) < 18
SELECT COUNT(*) FROM Patient WHERE SEX = 'M' AND T_BIL >= 2.0
SELECT Diagnosis FROM Examination WHERE `Examination Date` BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY Diagnosis ORDER BY COUNT(Diagnosis) DESC LIMIT 1
SELECT AVG(CAST(1999 - EXTRACT(YEAR FROM T2.Birthday) AS REAL)) FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Examination_Date BETWEEN '1991-10-01' AND '1991-10-30'
SELECT T2.Examination_Date ,  T1.Birthday ,  T2.Diagnosis FROM patient AS T1 JOIN examination AS T2 ON T1.ID = T2.ID WHERE T2.HGB = (SELECT MAX(HGB) FROM examination)
SELECT ANA FROM Examination WHERE ID = 3605340 AND Examination_Date = '1996-12-02'
SELECT COUNT(*) > 0 FROM Lab WHERE ID = 2927464 AND "Lab Test Name" = 'Total Cholesterol' AND `Lab Test Value` < 250 AND `Lab Test Date` = '1995-09-04'
SELECT T1.SEX FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'AORTITIS' ORDER BY T2.Examination_Date ASC LIMIT 1;
SELECT aCL_IgM FROM Examination WHERE Diagnosis = 'SLE' AND Examination_Date = '1994-02-19' AND ID IN (SELECT ID FROM Examination WHERE Examination_Date = '1993-11-12')
SELECT T1.SEX FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.GPT = 9 AND T2.Date = '1992-06-12'
SELECT T2.age FROM (SELECT * FROM Laboratory WHERE Date = '1991-10-21' AND UA = '8.4') AS T1 JOIN Patient AS T2 ON T1.Patient_ID = T2.ID WHERE T2.Birthday = DATE_SUB('1991-10-21', INTERVAL T2.age YEAR)
SELECT COUNT(L.ID) FROM Examination E JOIN Laboratory L ON E.ID = L.Patient_ID WHERE E.First_Date = '1991-06-13' AND E.Diagnosis = 'SJS' AND L.Date LIKE '1995%'
SELECT T1.Diagnosis FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Examination_Date = '1997-01-27' AND T1.Diagnosis = 'SLE' AND T2.First_Date = (SELECT MIN(T3.First_Date) FROM Patient AS T3 WHERE T3.ID IN(SELECT ID FROM Examination WHERE Diagnosis = 'SLE' AND `Examination Date` = '1997-01-27'))
SELECT T2.Symptoms FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Birthday = '1959-03-01' AND T2.Examination_Date = '1993-09-27'
SELECT (SUM(CASE WHEN T1.Birthday = '1959-02-18' AND strftime('%Y-%m', T2.Examination_Date) = '1981-11' THEN T2.aCL_IgG ELSE 0 END) - SUM(CASE WHEN T1.Birthday = '1959-02-18' AND strftime('%Y-%m', T2.Examination_Date) = '1981-12' THEN T2.aCL_IgG ELSE 0 END)) / SUM(CASE WHEN T1.Birthday = '1959-02-18' AND strftime('%Y-%m', T2.Examination_Date) = '1981-11' THEN T2.aCL_IgG ELSE 0 END) FROM patient AS T1 JOIN examination AS T2 ON T1.ID = T2.Patient_ID
SELECT T1.ID FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'Behcet' AND YEAR(T2.Examination Date) >= 1997 AND YEAR(T2.Examination Date) <= 1997
SELECT ID FROM Examination WHERE Examination_Date BETWEEN '1987-07-06' AND '1996-01-31' AND GPT > 30 AND ALB < 4 ORDER BY ID
SELECT COUNT(*), ID FROM Patient WHERE SEX = 'F' AND YEAR(Birthday) = 1964 AND Admission = '+' GROUP BY ID;
SELECT COUNT(*) FROM Examination WHERE `Thrombosis` = 2 AND `ANA Pattern` = 'S' AND `aCL IgM` > (SELECT AVG(`aCL IgM`) * 1.2 FROM Examination)
SELECT CAST(SUM(CASE WHEN UA <= 6.5 THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN U_PRO > 0 AND U_PRO < 30 THEN 1 ELSE 0 END) FROM Examination WHERE Diagnosis IN(SELECT Diagnosis FROM Patient WHERE `U-PRO` > 0 AND `U-PRO` < 30) AND UA <= 6.5
SELECT CAST(SUM(CASE WHEN Diagnosis = 'BEHCET' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Examination WHERE `Examination Date` LIKE '1981%' AND ID IN (SELECT ID FROM Patient WHERE SEX = 'M')
SELECT Patient.ID FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Admission = '-' AND Examination.Date LIKE '1991-10%' AND T_BIL < 2.0
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND BIRTHDAY BETWEEN '1980-01-01' AND '1989-12-31' AND ID NOT IN (SELECT ID FROM Examination WHERE ANA_Pattern = 'P')
SELECT T1.Sex FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'PSS' AND T2.CRP > 2 AND T2.CRE = 1 AND T2.LDH = 123
SELECT AVG(Examination.ALB)  FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  WHERE Patient.SEX = 'F' AND Examination.PLT > 400 AND Examination.Diagnosis = 'SLE'
SELECT Symptoms FROM Examination WHERE Diagnosis = 'SLE' GROUP BY Symptoms ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Examination_Date, T2.Diagnosis FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.ID = 48473 ORDER BY T1.Examination_Date ASC LIMIT 1;
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND EXISTS(SELECT * FROM Examination WHERE Patient.ID = Examination.ID AND Diagnosis LIKE '%APS%')
SELECT COUNT(*) FROM Examination WHERE YEAR(Examination_Date) = '1997' AND (DNA_II < 8 OR ANA NOT BETWEEN 6 AND 8.5)
SELECT CAST(SUM(CASE WHEN T2.Symptoms = 'thrombocytopenia' THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T2.Diagnosis LIKE '%SLE%' THEN 1 ELSE 0 END) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Thrombosis > 0
SELECT CAST(SUM(CASE WHEN P.SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(P.SEX) FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE YEAR(P.BIRTHDAY) = '1980' AND E.Diagnosis = 'RA'
SELECT COUNT(*) FROM Patient WHERE SEX = 'M' AND ID IN (SELECT ID FROM Examination WHERE `Examination Date` BETWEEN '1995-01-01' AND '1997-12-31') AND Diagnosis = 'Behcet' AND Admission = '-'
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND WBC < 3.5
SELECT DATEDIFF(T2.Examination_Date , T1.First_Date) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.ID = 821298
SELECT T1.UA FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T1.UA > 8.0 OR T1.SEX = 'F' AND T1.UA > 6.5 AND T1.ID = 57266
SELECT Examination.Examination_Date  FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  WHERE Patient.ID = '48473' AND Examination.DNA_II > 8;  -- Note: The provided SQL is based on the given information but it seems there's a discrepancy in the question and the provided table details. The question asks about AST (GOT) index, which isn't mentioned in the provided schema. However, I assumed that 'DNA-II' column might be related to this as per the given normal range condition. Please adjust the query based on your actual database schema. SELECT Examination.Examination_Date  FROM Examination  WHERE ID = 48473 AND DNA_II >= 60;
SELECT T1.PatientID, T1.Sex, T1.DateOfBirth FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.GOT < 60 AND YEAR(T2.ExaminationDate) = 1994;
SELECT T1.ID FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.GPT >= 60
SELECT T2.Diagnosis FROM Laboratory AS T1 JOIN Examination AS T2 ON T1.Patient_ID = T2.ID WHERE T1.GPT > 60 ORDER BY T2.Birth_Date DESC
SELECT AVG(LDH) FROM Patient WHERE LDH < 500;
SELECT Patient.ID, (YEAR(CURRENT_TIMESTAMP) - YEAR(Patient.Birthday)) AS Age FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.LDH BETWEEN 600 AND 800;
SELECT T2.ADMISSION FROM `Examination` AS T1 JOIN `Patient` AS T2 ON T1.ID = T2.ID WHERE T1.ALKALINE_PHOSPHATASE < 300 AND T2.ADMISSION = '+' UNION SELECT T2.ADMISSION FROM `Examination` AS T1 JOIN `Patient` AS T2 ON T1.ID = T2.ID WHERE T1.ALKALINE_PHOSPHATASE < 300 AND T2.ADMISSION = '-'
SELECT T1.ID FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Birth_Date = '1982-04-01' AND T2.ALP < 300
SELECT T1.ID, T1.Sex, T1.Date_of_Birth FROM Patient AS T1 JOIN LabTest AS T2 ON T1.ID = T2.Patient WHERE T2.Lab_Test_Name = 'TP' AND T2.Lab_Test_Value < 6.0
SELECT SUBTRACT(TP, 8.5) AS Deviation  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE SEX = 'F' AND TP > 8.5
SELECT T1.ID FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE (T1.SEX = 'M' AND (T1.ALB <= 3.5 OR T1.ALB >= 5.5)) ORDER BY T1.BIRTHDAY DESC
SELECT T1.ID, CASE WHEN T2.ALB BETWEEN 3.5 AND 5.5 THEN 'Yes' ELSE 'No' END AS Albumin_Normal_Range FROM Patient AS T1 JOIN LabTest AS T2 ON T1.ID = T2.Patient_ID WHERE YEAR(T1.Birthday) = 1982
SELECT COUNT(*) * 100 / (SELECT COUNT(*) FROM Patient WHERE Sex = 'F')  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE (SEX = 'F' AND `Uric Acid` > 6.5)
SELECT AVG(lab.UA)  FROM lab  JOIN examination ON lab.ID = examination.ID  WHERE (lab.SEX = 'M' AND lab.UA < 8.0) OR (lab.SEX = 'F' AND lab.UA < 6.5)  GROUP BY lab.ID  ORDER BY lab.Examination_Date DESC;
SELECT T1.ID, T1.Sex, T1.Birthday FROM Patient AS T1 JOIN Lab AS T2 ON T1.ID = T2.Patient WHERE T2.LabTestName = 'UN' AND T2.LabResultValue = 29
SELECT T1.ID, T1.Sex, T1.Birthday FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'RA' AND T1.UN < 30
SELECT COUNT(*) FROM Patient WHERE Sex = 'M' AND Creatinine >= 1.5
SELECT SUM(CASE WHEN Patient.Sex = 'M' THEN 1 ELSE 0 END) > SUM(CASE WHEN Patient.Sex = 'F' THEN 1 ELSE 0 END) FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.CRE >= 1.5;
SELECT T1.ID ,  T1.Sex ,  T1.Birthday FROM Patient AS T1 INNER JOIN Lab AS T2 ON T1.ID = T2.Patient WHERE T2.LabTestName = 'T-BIL' ORDER BY T2.LabResult DESC LIMIT 1
SELECT GROUP_CONCAT(DISTINCT P.ID), P.Sex  FROM Patient AS P  JOIN Examination AS E ON P.ID = E.ID  WHERE E.T_BIL >= 2.0  GROUP BY P.Sex;
SELECT Patient.ID, Examination.T_CHO FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.T_CHO = (SELECT MAX(T_CHO) FROM Examination) AND Patient.birthday = (SELECT MIN(birthday) FROM Patient WHERE ID IN (SELECT ID FROM Examination WHERE T_CHO = (SELECT MAX(T_CHO) FROM Examination)));
SELECT AVG(DATEDIFF(CURDATE(), birthday) / 365) FROM Patient WHERE sex = 'M' AND T_CHO >= 250;
SELECT T2.ID, T2.Diagnosis FROM BloodTest AS T1 JOIN Examination AS T2 ON T1.Patient_ID = T2.ID WHERE T1.TG > 300;
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.TG >= 200 AND EXTRACT(YEAR FROM CURRENT_TIMESTAMP) - EXTRACT(YEAR FROM T1.Birthday) > 50
SELECT DISTINCT T1.ID FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Adm = '-' AND T2.CPK < 250
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Sex = 'M' AND YEAR(T1.Birthday) BETWEEN 1936 AND 1956 AND T2.CPK >= 250;
SELECT T1.ID, T1.Sex, (YEAR(CURDATE()) - YEAR(T1.Birthday)) AS Age FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.GLU >= 180 AND T2.T_CHO < 250
SELECT T2.ID FROM `Examination` AS T1 JOIN `Patient` AS T2 ON T1.ID = T2.ID WHERE T1.GLU < 180 AND YEAR(T2.Description) = 1991 GROUP BY T2.ID
SELECT T1.ID ,  T1.Sex ,  T1.Birthday FROM Patient AS T1 JOIN BloodTest AS T2 ON T1.ID = T2.Patient WHERE T2.WBC <= 3.5 OR T2.WBC >= 9.0 ORDER BY (YEAR(CURDATE()) - YEAR(T1.Birthday)) * 100 + MONTH(T1.Birthday) ASC GROUP BY T1.Sex
SELECT T1.ID, YEAR(CURRENT_TIMESTAMP) - YEAR(T1.Birthday) AS Age FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.RBC < 3.5 GROUP BY T1.Diagnosis, T1.ID, Age
SELECT T2.Admittance FROM Patient AS T1 JOIN Admission AS T2 ON T1.ID = T2.Patient WHERE T1.Sex = 'F' AND (YEAR(CURDATE()) - YEAR(T1.Birthday)) >= 50 AND (T1.RBC <= 3.5 OR T1.RBC >= 6.0)
SELECT T2.ID, T2.Sex FROM lab WHERE T2.HBG < 10 AND T1.Admisson = '-' GROUP BY T2.ID, T2.Sex
SELECT T1.ID, T1.Sex FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'SLE' AND T2.HGB > 10 AND T2.HGB < 17 ORDER BY T1.Birthday ASC LIMIT 1
SELECT T1.ID ,  (YEAR(CURDATE()) - YEAR(T1.Birthday)) AS age FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.HCT >= 52 GROUP BY T1.ID HAVING COUNT(*) >= 2
SELECT AVG(HCT) FROM Examination WHERE Date LIKE '1991%' AND HCT < 29;
SELECT      (SELECT COUNT(*) FROM Examination WHERE aCL_IgG < 8 AND PLT < 100) -      (SELECT COUNT(*) FROM Examination WHERE aCL_IgG < 8 AND PLT > 400) AS difference_in_counts FROM dual;
SELECT P.ID FROM Patient AS P JOIN Examination AS E ON P.ID = E.ID WHERE YEAR(E.Date) = '1984' AND SUBTRACT(year(current_timestamp), year(P.Birthday)) < 50 AND P.PLT BETWEEN 100 AND 400
SELECT CAST(SUM(CASE WHEN T2.SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.SEX) FROM `Examination` AS T1 JOIN `Patient` AS T2 ON T1.ID = T2.ID WHERE SUBTRACT(year(current_timestamp), year(T2.Birthday)) > 55 AND T1.KCT != 'None' AND T1.RVVT != 'None' AND T1.LAC != 'None'
SELECT T1.ID FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.KCT = '-' AND YEAR(T1.First Date) > 1992 AND T2.RVVT = '-' AND T2.LAC = '-'
SELECT COUNT(*) FROM Examination WHERE Examination.Date > '1997-01-01' AND RVVT = '+' AND KCT = '+' AND LAC = '+'
SELECT COUNT(DISTINCT ID)  FROM Examination  WHERE RVVT = '-' AND LAC = '-' AND KCT = '-' AND Thrombosis = 0
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Sex = 'M' AND T2.WBC > 3.5 AND T2.WBC < 9.0 AND (T2.FG <= 150 OR T2.FG >= 450)
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Birthday > '1980-01-01' AND (T2.FG < 150 OR T2.FG > 450)
SELECT T2.Diagnosis FROM LabTest AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.LabItem = 'U-PRO' AND CAST(REPLACE(T1.LabResult, ',', '') AS REAL) >= 30
SELECT T1.ID FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.U_PRO BETWEEN 0 AND 30 AND T2.Diagnosis = 'SLE'
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.IgG >= 2000
SELECT COUNT(*) FROM Examination WHERE aCL_IgG * 1000 BETWEEN 900 AND 2000 AND Symptoms IS NOT NULL
SELECT T2.Diagnosis FROM AutoimmuneDisease AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.IgA BETWEEN 80 AND 500 ORDER BY T1.IgA DESC LIMIT 1
SELECT COUNT(*) FROM Patient WHERE ID IN (SELECT ID FROM Examination WHERE aCL_IgA > 80 AND aCL_IgA < 500) AND YEAR(`First Date`) >= 1990;
SELECT T2.Diagnosis FROM `Sample` AS T1 JOIN `Examination` AS T2 ON T1.ID = T2.ID WHERE T1.IgM <= 40 OR T1.IgM >= 400 GROUP BY T2.Diagnosis ORDER BY COUNT(T2.Diagnosis) DESC LIMIT 1
SELECT COUNT(*) FROM Patient WHERE CRP = '+' AND Description IS NULL
SELECT COUNT(*) FROM Patient WHERE ID IN (SELECT ID FROM Examination WHERE aCL_IgG > 1.5 OR aCL_IgM > 1.5 OR ANA > 256 OR aCL_IgA > 0) AND YEAR(CURDATE()) - YEAR(Birthday) < 70
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.KCT = '+' AND T1.RA IN ('-', '+-')
SELECT T2.Diagnosis FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Birthday >= '1985-01-01' AND T2.RA IN ('-', '+-')
SELECT T1.ID FROM Patient AS T1 JOIN LabTest AS T2 ON T1.ID = T2.Patient WHERE T2.LabTestName = 'RF' AND T2.Value < 20 AND YEAR(CURDATE()) - YEAR(T1.Birthday) > 60;
SELECT COUNT(*) FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Patient.RF < 20 AND Examination.Thrombosis = 0;
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.C3 > 35 AND T2.ANA_Pattern = 'P'
SELECT T1.ID FROM `Examination` AS T1 JOIN `LabTest` AS T2 ON T1.ID = T2.Patient WHERE T2.LabTestName = 'Hematoclit' AND (T2.Result < 29 OR T2.Result > 52) ORDER BY T1.`aCL IgA` DESC LIMIT 1
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Thrombosis > 0 AND T1.C4 > 10
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.RNP IN ('-', '0') AND T1.Admission = '+'
SELECT T1.Birthday FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.RNP NOT IN('-','+-') ORDER BY T1.Birthday DESC LIMIT 1
SELECT COUNT(*) FROM Examination WHERE SM IN ('-', '+-') AND Thrombosis = 0;
SELECT T1.ID FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.SM NOT IN ('negative', '0') ORDER BY T1.Birthday DESC LIMIT 3
SELECT T1.ID FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1."Examination Date" > '1997-01-01' AND T2.SC170 IN('negative','0')
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Sex = 'F' AND T2.DNA_II < 8 AND T2.Symptoms IS NULL
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.SSA IN('-','+-') AND YEAR(T2.Examination_Date) < 2000
SELECT T1.ID FROM Patient AS T1 JOIN AutoimmuneDiseaseTest AS T2 ON T1.ID = T2.Patient WHERE T2.SSA NOT IN ('negative', '0') ORDER BY T1.`First Date` ASC LIMIT 1
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.SSB IN ('-', '0') AND T2.Diagnosis = 'SLE'
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.SSB IN ('negative', '0') AND T1.Symptoms IS NOT NULL
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Sex = 'M' AND T2.CENTROMERE IN('-', '+-') AND T2.SSB IN('-', '+-')
SELECT T2.Diagnosis FROM LabTest AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.LabTestName = 'DNA-II' AND T1.Value >= 8
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.DNA_II < 8 AND T1.Description IS NULL
SELECT COUNT(*) FROM Patient WHERE IGG > 900 AND IGG < 2000 AND Admission = '+'
SELECT CAST(SUM(CASE WHEN T2.GOT >= 60 AND T1.Diagnosis = 'SLE' THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T2.GOT >= 60 THEN 1 ELSE 0 END) FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.Patient_ID WHERE T2.LabTestName = 'glutamic oxaloacetic transaminase'
SELECT COUNT(*) FROM Patient WHERE Sex = 'M' AND GOT < 60;
SELECT T2.Birth_Date FROM `Examination` AS T1 JOIN `Patient` AS T2 ON T1.ID = T2.ID WHERE T1.GOT >= 60 ORDER BY T2.Birth_Date DESC LIMIT 1
SELECT T1.Birthday FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.GPT < 60 ORDER BY T2.GPT DESC LIMIT 3
SELECT COUNT(*) FROM Patient WHERE Sex = 'M' AND ID IN (SELECT ID FROM LabTest WHERE `Lab Test Name` = 'GOT' AND Value < 60)
SELECT Examination_Date FROM Examination WHERE LDH = (SELECT MAX(LDH) FROM Examination WHERE LDH < 500) ORDER BY Examination_Date ASC LIMIT 1;
SELECT T2.Examination_Date FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.LDH >= 500 ORDER BY T2.Examination_Date DESC LIMIT 1
SELECT COUNT(*) FROM Patient WHERE ID IN (SELECT ID FROM LabTest WHERE Column='ALP' AND Value>=300) AND Admission='+'
SELECT COUNT(*) FROM Patient WHERE Admission = '-' AND ALP < 300;
SELECT T2.Diagnosis FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.TP < 6.0;
SELECT COUNT(*) FROM Patient WHERE ID IN (SELECT ID FROM Examination WHERE Diagnosis = 'SJS') AND TP > 6.0 AND TP < 8.5;
SELECT T2.Examination_Date FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.ALB BETWEEN 3.5 AND 5.5 ORDER BY T1.ALB DESC LIMIT 1
SELECT COUNT(*) FROM Patient WHERE Sex = 'M' AND ALB BETWEEN 3.5 AND 5.5 AND TP BETWEEN 6.0 AND 8.5
SELECT MAX(E.aCL_IgG), MAX(E.aCL_IgM), MAX(E.aCL_IgA) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE P.Sex = 'F' AND UA < 6.50 GROUP BY E.ID ORDER BY UA DESC LIMIT 1
SELECT MAX(T2.ANA) FROM LabTest AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.CRE < 1.5
SELECT T1.ID FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.CRE < 1.5 ORDER BY T2.aCL_IgA DESC LIMIT 1;
SELECT COUNT(*) FROM Examination WHERE T_BIL >= 2.0 AND ANA_Pattern LIKE '%P%'
SELECT T1.ANA FROM `Examination` AS T1 JOIN `LabTest` AS T2 ON T1.ID = T2.Patient_ID WHERE T2.`T-BIL` < 2.0 ORDER BY T2.`T-BIL` DESC LIMIT 1
SELECT COUNT(*) FROM Examination WHERE T_CHO >= 250 AND KCT = '-'
SELECT COUNT(*) FROM Laboratory WHERE T_CHO < 250 AND ANA_Pattern = 'P'
SELECT COUNT(*) FROM Examination WHERE TG < 200 AND Symptoms IS NOT NULL
SELECT T1.Diagnosis FROM Examination AS T1 JOIN LabTest AS T2 ON T1.ID = T2.Patient WHERE T2.LTName = 'TG' AND T2.Value < 200 ORDER BY T2.Value DESC LIMIT 1
SELECT T1.ID FROM Examination AS T1 JOIN LabTest AS T2 ON T1.ID = T2.Patient WHERE T1.Thrombosis = 0 AND T2.CPK < 250
SELECT COUNT(*) FROM Examination WHERE (KCT = '+' OR RVVT = '+' OR LAC = '+') AND ANA < 8;
SELECT T2.Birthday FROM `Examination` AS T1 JOIN `Patient` AS T2 ON T1.ID = T2.ID WHERE T1.GLU > 180 ORDER BY T2.Birthday ASC LIMIT 1
SELECT COUNT(*) FROM BloodExamination AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.GLU < 180 AND T2.Thrombosis = 0;
SELECT COUNT(*) FROM Patient WHERE Admission = '+' AND WBC BETWEEN 3.5 AND 9.0;
SELECT COUNT(*) FROM Patient WHERE ID IN (SELECT ID FROM Examination WHERE Diagnosis = 'SLE') AND WBC BETWEEN 3.5 AND 9.0;
SELECT T1.ID FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE (T1.RBC <= 3.5 OR T1.RBC >= 6.0) AND T1.Admission = '-'
SELECT COUNT(*) FROM Patient WHERE PLT > 100 AND PLT < 400 AND EXISTS (SELECT * FROM Examination WHERE Patient.ID = Examination.ID AND Diagnosis IS NOT NULL)
SELECT T2.PLT FROM Examination AS T1 JOIN BloodTest AS T2 ON T1.ID = T2.Patient WHERE T1.Diagnosis = 'MCTD' AND T2.PLT > 100 AND T2.PLT < 400
SELECT AVG(PT) FROM Examination WHERE Sex = 'M' AND PT < 14
SELECT COUNT(*) FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Patient.PT < 14 AND (Examination.Thrombosis = 2 OR Examination.Thrombosis = 1)
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.major = T2.major_code WHERE T1.first_name = 'Angela' AND T1.last_name = 'Sanders'
SELECT COUNT(*) FROM student_club WHERE major = 'Engineering' AND college = 'College of Engineering'
SELECT T1.first_name, T1.last_name FROM student AS T1 JOIN member_of_club AS T2 ON T1.stuid = T2.stuid JOIN club AS T3 ON T2.clubid = T3.clubid WHERE T1.dept_name = 'Art and Design' AND T3.club_name = 'Student_Club'
SELECT COUNT(*) FROM student_club JOIN attendance USING (student_id) WHERE event_name = 'Women\'s Soccer' AND status = 'Closed'
SELECT T1.phone FROM student AS T1 JOIN attendance AS T2 ON T1.stuid = T2.stuid JOIN event AS T3 ON T3.event_id = T2.event_id WHERE T3.event_name = 'Women\'s Soccer'
SELECT COUNT(*) FROM Student_Club JOIN attendance USING (student_id) WHERE event_name = 'Women''s Soccer' AND t_shirt_size = 'Medium'
SELECT T3.event_name FROM Student AS T1 JOIN student_club AS T2 ON T1.student_id = T2.student_id JOIN club_event AS T3 ON T2.club_id = T3.club_id GROUP BY T3.link_to_event ORDER BY COUNT(T3.link_to_event) DESC LIMIT 1
SELECT T1.college FROM student AS T1 JOIN member_of_club AS T2 ON T1.stuid = T2.stuid WHERE T2.position = 'Vice President' GROUP BY T1.college ORDER BY COUNT(*) DESC LIMIT 1
SELECT T3.event_name FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.member_id JOIN event AS T3 ON T2.event_id = T3.event_id WHERE T1.first_name = 'Maya' AND T1.last_name = 'Mclean'
SELECT COUNT(*) FROM event JOIN member_attendance ON event.event_id = member_attendance.event_id WHERE event.event_name IN (SELECT student_club_event.event_name FROM student_club_event WHERE student_club_event.club_code IN (SELECT club.club_code FROM club WHERE club.club_name = 'Student_Club')) AND member_attendance.member_email = 'Sacha.Harrison@students.university.edu' AND YEAR(event.event_date) = 2019
SELECT COUNT(*) FROM ( SELECT T1.event_id FROM Event AS T1 JOIN Student_Club AS T2 ON T1.club_id = T2.club_id WHERE T1.type = 'Meeting' GROUP BY T1.event_id HAVING COUNT(T1.event_id) > 10 ) AS T3
SELECT T1.event_name FROM events AS T1 JOIN student_events AS T2 ON T1.event_id = T2.event_id WHERE T1.type != 'Fundraiser' GROUP BY T1.event_id HAVING COUNT(T1.event_id) > 20
SELECT AVG(T1.attendance) FROM events AS T1 WHERE T1.type = 'Meeting' AND YEAR(T1.event_date) = 2020
SELECT T1.expense_description FROM expenses AS T1 JOIN club_expenses AS T2 ON T1.record_id = T2.expense_record_id ORDER BY T1.cost DESC LIMIT 1
SELECT COUNT(*) FROM student WHERE major = 'Environmental Engineering' AND student_id IN (SELECT member_id FROM Student_Club)
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.member_id JOIN event AS T3 ON T2.event_id = T3.event_id WHERE T3.event_name = 'Laugh Out Loud'
SELECT T2.lastname FROM student AS T1 JOIN people AS T2 ON T1.student_id = T2.record_id WHERE T1.major = 'Law and Constitutional Studies'
SELECT T2.county FROM member AS T1 JOIN zip_code AS T2 ON T1.zip_code = T2.zip_code WHERE T1.first_name = 'Sherri' AND T1.last_name = 'Ramsey'
SELECT T3.name FROM student AS T1 JOIN takes AS T2 ON T1.id = T2.student JOIN college AS T3 ON T3.cName = T1.college WHERE T1.name = 'Tyler Hewitt' AND T2.major = (SELECT major FROM student WHERE name = 'Tyler Hewitt')
SELECT SUM(T2.amount) FROM student_club AS T1 JOIN transaction AS T2 ON T1.club_id = T2.club_id WHERE T1.position = 'Vice President'
SELECT SUM(T1.amount) FROM expenses AS T1 JOIN events AS T2 ON T1.event_id = T2.id WHERE T2.event_name = 'September Meeting' AND T1.category = 'Food'
SELECT T3.city, T3.state FROM student AS T1 JOIN member_of_club AS T2 ON T1.stuid = T2.stuid JOIN zip_code AS T3 ON T1.hometown_zip = T3.zip_code WHERE T2.position = 'President' GROUP BY T3.city, T3.state
SELECT T1.first_name, T1.last_name FROM student_club AS T1 JOIN person AS T2 ON T1.person_id = T2.record_id WHERE T2.state = 'IL' AND T1.member_type = 'member'
SELECT SUM(T1.amount) FROM expenses AS T1 JOIN events AS T2 ON T1.event_id = T2.id WHERE T2.event_name = 'September Meeting' AND T1.category = 'Advertisement'
SELECT T4.department_name FROM student AS T1 JOIN takes AS T2 ON T1.stu_num = T2.stu_num JOIN course AS T3 ON T2.course_id = T3.course_id JOIN department AS T4 ON T3.dept_code = T4.dept_code WHERE T1.stu_fname = 'Pierce' AND T1.stu_lname = 'Guidi'
SELECT SUM(T1.amount) FROM expenses AS T1 JOIN events AS T2 ON T1.event_id = T2.id WHERE T2.event_name = 'October Speaker'
SELECT T2.approved FROM events AS T1 JOIN expenses AS T2 ON T1.event_id = T2.event_id WHERE T1.event_name = 'October Meeting' AND T1.event_date = '2019-10-08T00:00:00'
SELECT AVG(T1.amount) FROM expenses AS T1 JOIN members AS T2 ON T1.member_id = T2.id WHERE T2.first_name = 'Elijah' AND T2.last_name = 'Allen' AND (strftime('%m', T1.expense_date) = '09' OR strftime('%m', T1.expense_date) = '10')
SELECT SUM(IIF(SUBSTR(T1.event_date, 1, 4) = '2019', T3.amount_spent, 0)) - SUM(IIF(SUBSTR(T1.event_date, 1, 4) = '2020', T3.amount_spent, 0)) FROM event AS T1 JOIN student_club AS T2 ON T1.club_id = T2.club_id JOIN finance AS T3 ON T1.event_id = T3.event_id WHERE T2.club_name = 'Student_Club'
SELECT T1.location FROM events AS T1 WHERE T1.event_name = "Spring Budget Review"
SELECT T1.cost FROM expenses AS T1 JOIN events AS T2 ON T1.event_id = T2.id WHERE T2.event_name = 'Posters' AND T2.event_date = '2019-09-04'
SELECT T1.remaining FROM `budget` AS T1 JOIN `category` AS T2 ON T1.category_id  =  T2.category_id WHERE T2.category_name  =  "Food" AND T1.amount  =  (SELECT MAX(T1.amount) FROM `budget` AS T1 JOIN `category` AS T2 ON T1.category_id  =  T2.category_id WHERE T2.category_name  =  "Food")
SELECT T1.notes FROM event AS T1 JOIN donation AS T2 ON T1.event_id = T2.event_id WHERE T2.source = 'Fundraising' AND T2.date_received = '2019-09-14'
SELECT COUNT(DISTINCT T2.major) FROM college AS T1 JOIN student AS T2 ON T1.college_id = T2.college_id WHERE T1.name = 'College of Humanities and Social Sciences'
SELECT T1.phone_number FROM member AS T1 JOIN person AS T2 ON T1.person = T2.rec_id WHERE T2.first_name = 'Carlo' AND T2.last_name = 'Jacobs'
SELECT T2.county FROM member AS T1 JOIN zip_code AS T2 ON T1.hometown_zip = T2.zip_code WHERE T1.first_name = 'Adela' AND T1.last_name = 'O'Gallagher'
SELECT COUNT(*) FROM budget WHERE event_name = 'November Meeting' AND remaining < 0
SELECT SUM(T1.amount) FROM budget AS T1 JOIN events AS T2 ON T1.event_id = T2.id WHERE T2.event_name = 'September Speaker'
SELECT T1.status FROM events AS T1 JOIN expenses AS T2 ON T1.event_id = T2.event_id WHERE T2.expense_description = 'Post Cards, Posters' AND T2.expense_date = '2019-8-20'
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.major = T2.major_code WHERE T1.first_name = 'Brent' AND T1.last_name = 'Thomason'
SELECT COUNT(*) FROM club_member WHERE major = 'Business' AND t_shirt_size = 'Medium'
SELECT T2.type FROM member AS T1 JOIN zip_code AS T2 ON T1.zip_code = T2.zip_code WHERE T1.first_name = 'Christof' AND T1.last_name = 'Nielson'
SELECT T1.major_name FROM student AS T1 JOIN member_of_club AS T2 ON T1.stu_num = T2.stu_num WHERE T2.position = 'Vice President' GROUP BY T1.major_name HAVING COUNT(*) = 1
SELECT T2.state FROM member AS T1 JOIN zip_code AS T2 ON T1.hometown_zip = T2.zip_code WHERE T1.first_name = 'Sacha' AND T1.last_name = 'Harrison'
SELECT T3.department FROM student AS T1 JOIN member_of_club AS T2 ON T1.stuid = T2.stuid JOIN club AS T3 ON T2.clubid = T3.clubid WHERE T1.position = 'President' GROUP BY T3.department
SELECT T2.date_received FROM member AS T1 JOIN transaction AS T2 ON T1.member_id = T2.payer WHERE T1.first_name = 'Connor' AND T1.last_name = 'Hilton' AND T2.source = 'Dues'
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN transaction AS T2 ON T1.member_id = T2.member_id WHERE T2.source = 'Dues' ORDER BY T2.received_date ASC LIMIT 1;
SELECT COUNT(*) FROM ( SELECT * FROM budget WHERE category = 'Advertisement' AND event_name = 'Yearly Kickoff' ) AS T1 JOIN ( SELECT * FROM budget WHERE category = 'Advertisement' AND event_name = 'October Meeting' ) AS T2 ON T1.event_id = T2.event_id WHERE T1.amount > T2.amount
SELECT (SUM(CASE WHEN T2.category = 'Parking' THEN T1.amount ELSE 0 END) / SUM(T1.amount)) * 100 FROM expenses AS T1 JOIN category AS T2 ON T1.category_id = T2.id JOIN events AS T3 ON T1.event_id = T3.id WHERE T3.event_name = 'November Speaker'
SELECT SUM(T2.cost) FROM event AS T1 JOIN expense AS T2 ON T1.event_id = T2.event_id WHERE T2.expense_description = 'Pizza'
SELECT COUNT(*) FROM zip_code WHERE county = 'Orange County' AND state = 'Virginia'
SELECT department_name FROM department WHERE college = 'College of Humanities and Social Sciences' GROUP BY department_name ORDER BY department_name ASC
SELECT T3.city, T3.county, T3.state FROM member AS T1 JOIN membership AS T2 ON T1.member_id = T2.member_id JOIN zip_code AS T3 ON T2.zip_code = T3.zip_code WHERE T1.first_name = 'Amy' AND T1.last_name = 'Firth'
SELECT T1.expense_description FROM budget AS T1 JOIN ( SELECT MIN(remaining) AS min_remaining FROM budget ) AS T2 WHERE T1.remaining = T2.min_remaining
SELECT T1.member_name FROM member AS T1 JOIN attendance AS T2 ON T1.rec_id = T2.member_rec_id JOIN event AS T3 ON T3.rec_id = T2.event_rec_id WHERE T3.event_name = 'October Meeting'
SELECT T2.college FROM member AS T1 JOIN major AS T2 ON T1.major = T2.id GROUP BY T2.college ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.major_name FROM person AS T1 JOIN student AS T2 ON T1.student_id = T2.student_id WHERE T1.phone_number = '809-555-3360'
SELECT T1.event_name FROM events AS T1 JOIN expenses AS T2 ON T1.record_id = T2.event_record_id GROUP BY T1.event_name ORDER BY SUM(T2.amount) DESC LIMIT 1
SELECT T3.expense_description FROM member AS T1 JOIN club AS T2 ON T1.club_id = T2.club_id JOIN expense AS T3 ON T3.club_id = T2.club_id WHERE T1.position = 'Vice President' AND T1.member_id = T3.member_id
SELECT COUNT(*) FROM events WHERE event_name = 'Women''s Soccer' AND status = 'Closed'
SELECT T1.date_received FROM income AS T1 JOIN members AS T2 ON T1.member_id = T2.member_id WHERE T2.first_name = 'Casey' AND T2.last_name = 'Mason'
SELECT COUNT(*) FROM member WHERE hometown IN (SELECT zip_code FROM zip_code WHERE state = 'Maryland')
SELECT COUNT(*) FROM event JOIN attendance ON event.event_id = attendance.event_id WHERE attendance.member_phone = '954-555-6240' AND event.status = 'Closed'
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN department_member AS T2 ON T1.member_id = T2.member_id JOIN department AS T3 ON T2.department_id = T3.department_id WHERE T3.name = 'School of Applied Sciences, Technology and Education'
SELECT T1.event_name FROM `event` AS T1 JOIN `budget` AS T2 ON T1.id = T2.event_id WHERE T1.status = 'Closed' ORDER BY (T2.spent / T2.amount) DESC LIMIT 1;
SELECT COUNT(*) FROM student WHERE position = 'President'
SELECT MAX(T2.spent) FROM events AS T1 JOIN budget AS T2 ON T1.event_id = T2.event_id
SELECT COUNT(*) FROM event WHERE type = 'Meeting' AND strftime('%Y', event_date) = '2020'
SELECT SUM(T1.spent) FROM expense AS T1 JOIN category AS T2 ON T1.category_id = T2.id WHERE T2.category = 'Food'
SELECT T1.first_name, T1.last_name FROM student AS T1 JOIN attendance AS T2 ON T1.student_id = T2.student_id GROUP BY T1.student_id HAVING COUNT(T2.link_to_event) > 7
SELECT T1.first_name, T1.last_name FROM student AS T1 JOIN attendance AS T2 ON T1.student_id = T2.student_id JOIN event AS T3 ON T2.event_id = T3.event_id WHERE T3.event_name = 'Community Theater' AND T1.major_name = 'Interior Design'
SELECT T1.first_name, T1.last_name FROM student AS T1 JOIN zip_code AS T2 ON T1.zip_code = T2.zip_code WHERE T2.city = 'Georgetown' AND T2.state = 'South Carolina'
SELECT SUM(income.amount) FROM income WHERE income.member_id = (SELECT member.id FROM member WHERE member.first_name = 'Grant' AND member.last_name = 'Gilmour')
SELECT T1.first_name, T1.last_name FROM student AS T1 JOIN income AS T2 ON T1.student_id = T2.student_id WHERE T2.amount > 40
SELECT SUM(T2.cost) FROM events AS T1 JOIN expenses AS T2 ON T1.event_id = T2.event_id WHERE T1.event_name = 'Yearly Kickoff'
SELECT T1.first_name, T1.last_name FROM student AS T1 JOIN manages_budget AS T2 ON T1.student_id = T2.student_id JOIN event AS T3 ON T3.event_id = T2.event_id WHERE T3.event_name = 'Yearly Kickoff'
SELECT T1.first_name, T1.last_name, T3.source FROM student AS T1 JOIN income AS T2 ON T1.student_id = T2.student_id JOIN source AS T3 ON T2.source_code = T3.source_code WHERE T2.amount = (SELECT MAX(amount) FROM income)
SELECT T1.event_name FROM events AS T1 JOIN costs AS T2 ON T1.id = T2.event_id ORDER BY T2.cost ASC LIMIT 1
SELECT (SUM(CASE WHEN T2.event_name = 'Yearly Kickoff' THEN T1.cost ELSE 0 END) / SUM(T1.cost)) * 100 FROM event_cost AS T1 JOIN events AS T2 ON T1.event_id = T2.id GROUP BY T2.event_name
SELECT CAST(COUNT(CASE WHEN T2.major_name = 'Finance' THEN 1 ELSE NULL END) AS REAL) / COUNT(CASE WHEN T2.major_name = 'Physics' THEN 1 ELSE NULL END) FROM student AS T1 JOIN major AS T2 ON T1.major_id = T2.major_id
SELECT source FROM transactions WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' ORDER BY amount DESC LIMIT 1
SELECT T1.first_name, T1.last_name, T1.email FROM member AS T1 JOIN student_club AS T2 ON T1.stu_num = T2.officer WHERE T2.position = 'Secretary'
SELECT COUNT(*) FROM student_club AS T1 JOIN member_of_club AS T2 ON T1.clubid = T2.clubid JOIN student AS T3 ON T2.stuid = T3.stuid WHERE T3.major = 'Physics Teaching'
SELECT COUNT(*) FROM member_attendance WHERE event_id IN (SELECT id FROM events WHERE event_name = 'Community Theater' AND YEAR(event_date) = 2019)
SELECT COUNT(*), T3.major_name FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.attended JOIN major AS T3 ON T1.major_code = T3.major_code WHERE T1.first_name = 'Luisa' AND T1.last_name = 'Guidi' GROUP BY T3.major_name;
SELECT AVG(T1.amount) AS average_spending FROM transactions AS T1 JOIN club_event AS T2 ON T1.event_id = T2.rec2N69DMcrqN9PJC WHERE T1.category = 'Food' AND T2.status = 'Closed'
SELECT T1.event_name FROM events AS T1 JOIN expenses AS T2 ON T1.id = T2.event_id WHERE T2.category = 'Advertisement' ORDER BY T2.spent DESC LIMIT 1
SELECT COUNT(*) FROM attendance WHERE member_id IN (SELECT id FROM members WHERE first_name = 'Maya' AND last_name = 'Mclean') AND event_id IN (SELECT id FROM events WHERE event_name = 'Women''s Soccer')
SELECT SUM(CASE WHEN type = 'Community Service' THEN 1 ELSE 0 END) * 100 / COUNT(event_id) AS percentage  FROM events  WHERE event_date BETWEEN '2019-01-01' AND '2019-12-31';
SELECT T1.amount FROM expenses AS T1 JOIN events AS T2 ON T1.event_id = T2.id WHERE T1.description = 'Posters' AND T2.event_name = 'September Speaker'
SELECT t_shirt_size FROM member GROUP BY t_shirt_size ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.event_name FROM `event` AS T1 JOIN `budget` AS T2 ON T1.id = T2.event_id WHERE T1.status = 'Closed' AND T2.remaining < 0 ORDER BY T2.remaining ASC LIMIT 1;
SELECT T2.type, SUM(T2.cost) FROM events AS T1 JOIN expenses AS T2 ON T1.record_id = T2.event_record_id WHERE T1.event_name = 'October Meeting' AND T1.status = 'Closed' GROUP BY T2.type;
SELECT T2.category, SUM(T2.amount) FROM events AS T1 JOIN budget AS T2 ON T1.event_id = T2.event_id WHERE T1.event_name = 'April Speaker' GROUP BY T2.category ORDER BY SUM(T2.amount) ASC
SELECT MAX(budgeted) FROM transactions WHERE category = 'Food'
SELECT T1.category ,  T1.amount FROM Financial_Transactions AS T1 WHERE T1.category  =  'Advertisement' ORDER BY T1.amount DESC LIMIT 3
SELECT SUM(cost) FROM expenses WHERE expense_description = 'Parking'
SELECT SUM(cost) FROM expense WHERE expense_date = '2019-08-20'
SELECT T1.first_name, T1.last_name, SUM(T2.cost) FROM member AS T1 JOIN transaction AS T2 ON T1.member_id = T2.member_id WHERE T1.member_id = 'rec4BLdZHS2Blfp4v' GROUP BY T1.first_name, T1.last_name;
SELECT T2.expense_description FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.member_id WHERE T1.first_name = 'Sacha' AND T1.last_name = 'Harrison'
SELECT T2.expense_description FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.member_id WHERE T1.t_shirt_size = 'X-Large'
SELECT T2.zip_code FROM member AS T1 JOIN address AS T2 ON T1.address_id = T2.address_id WHERE T1.cost < 50
SELECT T2.major_name FROM student AS T1 JOIN major AS T2 ON T1.major_code = T2.major_code WHERE T1.first_name = 'Phillip' AND T1.last_name = 'Cullen'
SELECT T2.position FROM member AS T1 JOIN club AS T2 ON T1.club_id = T2.club_id WHERE T1.major = 'Business'
SELECT COUNT(*) FROM member WHERE major_name = 'Business' AND t_shirt_size = 'Medium'
SELECT T1.event_name FROM event AS T1 JOIN budget AS T2 ON T1.id = T2.event_id WHERE T2.remaining > 30
SELECT type FROM event WHERE location = 'MU 215' GROUP BY type
SELECT type FROM events WHERE event_date = '2020-03-24T12:00:00'
SELECT T3.major_name FROM student AS T1 JOIN member_of_club AS T2 ON T1.stuid = T2.stuid JOIN major AS T3 ON T1.majors = T3.major_code WHERE T1.position = 'Vice President'
SELECT (SUM(CASE WHEN T2.major_name = 'Business' THEN 1 ELSE 0 END) / COUNT(T1.member_id)) * 100 FROM member AS T1 JOIN major AS T2 ON T1.major = T2.major_code WHERE T1.position = 'Member'
SELECT T1.type FROM events AS T1 JOIN zip_code AS T2 ON T1.location = T2.city WHERE T1.location = "MU 215" GROUP BY T1.type
SELECT COUNT(*) FROM income WHERE amount = 50
SELECT COUNT(*) FROM member WHERE position = 'Member' AND t_shirt_size = 'X-Large'
SELECT COUNT(*) FROM major WHERE department = 'School of Applied Sciences, Technology and Education' AND college = 'College of Agriculture and Applied Sciences'
SELECT T1.last_name ,  T3.department_name ,  T4.college_name FROM member AS T1 JOIN major AS T2 ON T1.major  =  T2.id JOIN department AS T3 ON T3.department_id  =  T2.department_id JOIN college AS T4 ON T4.college_id  =  T3.college_id WHERE T2.major_name  =  'Environmental Engineering'
SELECT T1.category FROM budget AS T1 JOIN event AS T2 ON T1.event_id = T2.id WHERE T2.location = 'MU 215' AND T2.type = 'Guest Speaker' AND T1.spent = 0
SELECT T3.city, T3.state FROM member AS T1 JOIN enroll AS T2 ON T1.member_id = T2.member_id JOIN zip_code AS T3 ON T3.zip_code = T1.zip_code WHERE T2.department = 'Electrical and Computer Engineering Department' AND T1.position = 'Member'
SELECT T1.event_name FROM events AS T1 JOIN members AS T2 ON T1.club_id = T2.club_id WHERE T1.type = 'Social' AND T2.position = 'Vice President' AND T1.location = '900 E. Washington St.'
SELECT T3.lastname ,  T3.position FROM expenses AS T1 JOIN club_expense AS T2 ON T1.expense_id = T2.expense_id JOIN member AS T3 ON T2.president_id = T3.member_id WHERE T1.expense_description = 'Pizza' AND T1.expense_date = '2019-09-10'
SELECT T1.last_name FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.member_id JOIN event AS T3 ON T2.event_id = T3.recid WHERE T3.event_name = 'Women''s Soccer' AND T1.position = 'Member'
SELECT (SELECT COUNT(*) FROM member WHERE t_shirt_size='Medium' AND amount=50) / (SELECT COUNT(*) FROM member WHERE position='Member' AND t_shirt_size='Medium') * 100 AS percentage
SELECT T2.country FROM zip_code AS T1 JOIN country AS T2 ON T1.state = T2.state_name WHERE T1.type = 'PO Box' GROUP BY T2.country
SELECT zip_code FROM zip_code WHERE county = "San Juan Municipio" AND state = "Puerto Rico" AND type = "PO Box"
SELECT T1.event_name FROM events AS T1 JOIN zip_code AS T2 ON T1.location = T2.zip_code WHERE T1.type = 'Game' AND T1.status = 'Closed' AND T1.event_date BETWEEN '2019-03-15T00:00:00' AND '2020-03-20T23:59:59'
SELECT T1.event_link FROM events AS T1 JOIN members AS T2 ON T1.member_id = T2.member_id WHERE T2.cost > 50
SELECT T1.member_name, T1.event_link FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.member_id JOIN event AS T3 ON T2.event_id = T3.event_id WHERE T1.approved = 'true' AND T1.expense_date BETWEEN '2019-01-10' AND '2019-11-19'
SELECT T3.college FROM person AS T1 JOIN student AS T2 ON T1.id = T2.student_id JOIN college AS T3 ON T2.college_code = T3.code WHERE T1.first_name = 'Katy' AND T2.major = 'rec1N0upiVLy5esTO'
SELECT T2.phone FROM member AS T1 JOIN person AS T2 ON T1.member_id  =  T2.person_id JOIN major AS T3 ON T3.major_id  =  T1.major WHERE T3.college_name  =  'College of Agriculture and Applied Sciences' AND T3.major_name  =  'Business'
SELECT email FROM expenses WHERE expense_date BETWEEN '2019-09-10' AND '2019-11-19' AND cost > 20
SELECT COUNT(*) FROM member WHERE major = 'education' AND college = 'College of Education & Human Services'
SELECT SUM(CASE WHEN T2.remaining < 0 THEN 1 ELSE 0 END) * 100 / COUNT(T1.event_id) FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.event_id WHERE T2.remaining < 0
SELECT event_id, location, status FROM events WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31'
SELECT expense_description FROM expenses GROUP BY expense_description HAVING AVG(cost) > 50
SELECT T1.first_name ,  T1.last_name FROM member AS T1 JOIN member_attendance AS T2 ON T1.member_id = T2.member_id WHERE T1.t_shirt_size = "X-Large"
SELECT SUM(CASE WHEN type = 'PO Box' THEN 1 ELSE 0 END) / COUNT(zip_code) * 100 FROM zip_code
SELECT T1.event_name, T1.location FROM events AS T1 JOIN expenses AS T2 ON T1.record_id = T2.event_record_id WHERE T2.remaining > 0
SELECT T1.event_name, T1.event_date FROM events AS T1 JOIN expenses AS T2 ON T1.event_id = T2.event_id WHERE T2.expense_description = 'Pizza' AND T2.cost > 50 AND T2.cost < 100
SELECT T3.first_name, T3.last_name, T4.major_name FROM expenses AS T1 JOIN member_of_club AS T2 ON T1.member_id = T2.member_id JOIN club_member AS T3 ON T2.member_id = T3.member_id JOIN major AS T4 ON T3.major_id = T4.major_id WHERE T1.cost > 100
SELECT T2.city, T2.county FROM events AS T1 JOIN zip_code AS T2 ON T1.location = T2.zip_code WHERE T1.income > 40 GROUP BY T2.city, T2.county
SELECT T2.member_name FROM expenses AS T1 JOIN members AS T2 ON T1.member_id = T2.id WHERE T1.event_id IN (SELECT event_id FROM expenses GROUP BY event_id HAVING COUNT(event_id) > 1) ORDER BY cost DESC LIMIT 1
SELECT AVG(T2.cost) FROM student AS T1 JOIN payment AS T2 ON T1.student_id = T2.student_id WHERE T1.position != 'Member'
SELECT T1.event_name FROM `event` AS T1 JOIN expense AS T2 ON T1.event_id = T2.event_id WHERE T2.category = 'Parking' AND T2.cost < (SELECT AVG(cost) FROM expense WHERE category = 'Parking')
SELECT SUM(CASE WHEN T1.type = 'Meeting' THEN T1.cost ELSE 0 END) / SUM(T1.cost) * 100 FROM event AS T1 JOIN club_event AS T2 ON T1.event_id = T2.event_id WHERE T1.type = 'Meeting'
SELECT MAX(cost) FROM expenses WHERE expense_description = 'Water, chips, cookies'
SELECT T1.first_name , T1.last_name FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.member_id ORDER BY T2.cost DESC LIMIT 5
SELECT T1.first_name, T1.last_name, T1.phone FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.member_id WHERE T2.cost > (SELECT AVG(cost) FROM expense)
SELECT (SUM(CASE WHEN T2.state = 'New Jersey' THEN 1 ELSE 0 END) / COUNT(CASE WHEN T1.position = 'Member' THEN 1 END)) - (SUM(CASE WHEN T2.state = 'Vermont' THEN 1 ELSE 0 END) / COUNT(CASE WHEN T1.position = 'Member' THEN 1 END)) FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip_code = T2.zip_code
SELECT T1.major_name, T2.department_name FROM student AS T1 JOIN department AS T2 ON T1.dept_code = T2.dept_code WHERE T1.first_name = 'Garrett' AND T1.last_name = 'Gerke'
SELECT T1.first_name, T1.last_name, SUM(T2.amount) FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.payer_member_id WHERE T2.expense_description = 'Water, Veggie tray, supplies' GROUP BY T1.first_name, T1.last_name
SELECT T2.last_name ,  T3.phone FROM student AS T1 JOIN people AS T2 ON T1.student_id = T2.person_id JOIN contact_number AS T3 ON T2.person_id = T3.person_id WHERE T1.major = 'Elementary Education'
SELECT T1.category, T1.amount FROM budget AS T1 JOIN events AS T2 ON T1.event_id = T2.id WHERE T2.event_name = 'January Speaker'
SELECT T1.event_name FROM events AS T1 JOIN expenses AS T2 ON T1.id = T2.event_id WHERE T2.category = 'Food'
SELECT T1.first_name, T1.last_name, T2.amount FROM student AS T1 JOIN fund_transfer AS T2 ON T1.student_id = T2.student_id WHERE T2.date_received = '2019-09-09'
SELECT budget_category FROM expenses WHERE expense_description = 'Posters'
SELECT T1.first_name, T1.last_name, T3.college FROM club_member AS T1 JOIN member_of_club AS T2 ON T1.stuid = T2.stuid JOIN college AS T3 ON T2.clubid = T3.clubid WHERE T1.position = 'Secretary'
SELECT SUM(T2.spent), T1.event_name FROM events AS T1 JOIN expenses AS T2 ON T1.rec_id = T2.rec_id WHERE T2.category = 'Speaker Gifts' GROUP BY T1.event_name;
SELECT T2.city FROM member AS T1 JOIN zip_code AS T2 ON T1.zip_code = T2.zip_code WHERE T1.first_name = 'Garrett' AND T1.last_name = 'Gerke'
SELECT T1.first_name, T1.last_name, T1.position FROM student AS T1 JOIN zip_code AS T2 ON T1.zip_code = T2.zip_code WHERE T2.city = 'Lincolnton' AND T2.state = 'North Carolina' AND T2.zip_code = 28092
SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Premium'
SELECT COUNT(CASE WHEN Currency = 'EUR' THEN 1 ELSE NULL END) / COUNT(CASE WHEN Currency = 'CZK' THEN 1 ELSE NULL END) AS Ratio FROM customers;
SELECT T1.CustomerID FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM' AND T2.Date BETWEEN '201201' AND '201212' ORDER BY T2.Consumption ASC LIMIT 1
SELECT AVG(T3.Consumption) / 12 AS AverageMonthlyConsumption FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID JOIN yearmonth AS T3 ON T1.CustomerID = T3.CustomerID WHERE T1.Segment = 'SME' AND SUBSTR(T3.Date, 1, 4) = '2013' GROUP BY T1.CustomerID;
SELECT T1.CustomerID FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID JOIN yearmonth AS T3 ON T1.CustomerID = T3.CustomerID WHERE T1.Currency = 'CZK' AND T3.Date BETWEEN '201101' AND '201112' GROUP BY T1.CustomerID ORDER BY SUM(T3.Consumption) DESC LIMIT 1;
SELECT COUNT(*) FROM ( (SELECT CustomerID FROM yearmonth WHERE Date BETWEEN '201201' AND '201212' AND Consumption < 30000) INTERSECT  (SELECT CustomerID FROM customers WHERE Segment = 'KAM') ) AS result
SELECT (SELECT SUM(T3.Consumption) FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID JOIN yearmonth AS T3 ON T3.CustomerID = T2.CustomerID WHERE T1.Currency = 'CZK' AND SUBSTR(T3.Date, 1, 4) BETWEEN '201201' AND '201212') - (SELECT SUM(T3.Consumption) FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID JOIN yearmonth AS T3 ON T3.CustomerID = T2.CustomerID WHERE T1.Currency = 'EUR' AND SUBSTR(T3.Date, 1, 4) BETWEEN '201201' AND '201212')
SELECT Date, SUM(Amount * Price) as Total_Gas_Use FROM transactions_1k JOIN customers ON transactions_1k.CustomerID = customers.CustomerID WHERE Currency = 'EUR' GROUP BY DATEPART(yyyy, Date) ORDER BY Total_Gas_Use DESC LIMIT 1;
SELECT T2.Segment FROM yearmonth AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID GROUP BY T2.Segment ORDER BY SUM(T1.Consumption) LIMIT 1
SELECT T2.Date FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Currency = 'CZK' GROUP BY SUBSTR(T2.Date, 1, 4) ORDER BY SUM(T2.Consumption) DESC LIMIT 1;
SELECT T2.Date FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'SME' AND SUBSTRING(T2.Date, 1, 4) BETWEEN '2013' AND '2013' AND SUBSTRING(T2.Date, 6, 2) IN ('01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12') ORDER BY T2.Consumption DESC LIMIT 1
SELECT      (SELECT SUM(CASE WHEN T1.Segment = 'SME' THEN T5.Consumption ELSE 0 END) / COUNT(CASE WHEN T1.Segment = 'SME' AND T4.Date BETWEEN '201301' AND '201312' THEN T1.CustomerID END)      FROM customers AS T1      JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID      JOIN gasstations AS T3 ON T2.GasStationID = T3.GasStationID      JOIN yearmonth AS T4 ON T1.CustomerID = T4.CustomerID      WHERE T3.Country = 'CZE' AND T4.Date BETWEEN '201301' AND '201312') -     (SELECT SUM(CASE WHEN T1.Segment = 'LAM' THEN T5.Consumption ELSE 0 END) / COUNT(CASE WHEN T1.Segment = 'LAM' AND T4.Date BETWEEN '201301' AND '201312' THEN T1.CustomerID END)      FROM customers AS T1      JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID      JOIN gasstations AS T3 ON T2.GasStationID = T3.GasStationID      JOIN yearmonth AS T4 ON T1.CustomerID = T4.CustomerID      WHERE T3.Country = 'CZE' AND T4.Date BETWEEN '201301' AND '201312') AS SME_LAM,     (SELECT SUM(CASE WHEN T1.Segment = 'LAM' THEN T5.Consumption ELSE 0 END) / COUNT(CASE WHEN T1.Segment = 'LAM' AND T4.Date BETWEEN '201301' AND '201312' THEN T1.CustomerID END)      FROM customers AS T1      JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID      JOIN gasstations AS T3 ON T2.GasStationID = T3.GasStationID      JOIN yearmonth AS T4 ON T1.CustomerID = T4.CustomerID      WHERE T3.Country = 'CZE' AND T4.Date BETWEEN '201301' AND '201312') -     (SELECT SUM(CASE WHEN T1.Segment = 'KAM' THEN T5.Consumption ELSE 0 END) / COUNT(CASE WHEN T1.Segment = 'KAM' AND T4.Date BETWEEN '201301' AND '201312' THEN T1.CustomerID END)      FROM customers AS T1      JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID      JOIN gasstations AS T3 ON T2.GasStationID = T3.GasStationID      JOIN yearmonth AS T4 ON T1.CustomerID = T4.CustomerID      WHERE T3.Country = 'CZE' AND T4.Date BETWEEN '201301' AND '201312') AS LAM_KAM,     (SELECT SUM(CASE WHEN T1.Segment = 'KAM' THEN T5.Consumption ELSE 0 END) / COUNT(CASE WHEN T1.Segment = 'KAM' AND T4.Date BETWEEN '201301' AND '201312' THEN T1.CustomerID END)      FROM customers AS T1      JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID      JOIN gasstations AS T3 ON T2.GasStationID = T3.GasStationID      JOIN yearmonth AS T4 ON T1.CustomerID = T4.CustomerID      WHERE T3.Country = 'CZE' AND T4.Date BETWEEN '201301' AND '201312') -     (SELECT SUM(CASE WHEN T1.Segment = 'SME' THEN T5.Consumption ELSE 0 END) / COUNT(CASE WHEN T1.Segment = 'SME' AND T4.Date BETWEEN '201301' AND '201312' THEN T1.CustomerID END)      FROM customers AS T1      JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID      JOIN gasstations AS T3 ON T2.GasStationID = T3.GasStationID      JOIN yearmonth AS T4 ON T1.CustomerID = T4.CustomerID      WHERE T3.Country = 'CZE' AND T4.Date BETWEEN '201301' AND '201312') AS KAM_SME;
SELECT T1.Segment ,  MAX(T3.PercentageIncrease) ,  MIN(T3.PercentageIncrease) FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID JOIN (SELECT CustomerID ,  `Date` ,  Consumption ,  CASE WHEN `Date` LIKE '2012%' THEN 0 ELSE (Consumption - LAG(Consumption,1) OVER (PARTITION BY CustomerID ORDER BY `Date`) ) / Consumption * 100 END AS PercentageIncrease FROM yearmonth WHERE `Date` BETWEEN '201201' AND '201312') AS T3 ON T1.CustomerID = T3.CustomerID WHERE T2.Currency = 'EUR' GROUP BY T1.Segment
SELECT SUM(T2.Consumption) FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.CustomerID = 6 AND SUBSTR(T2.Date, 1, 4) BETWEEN '2013' AND '2013' AND SUBSTR(T2.Date, 5, 2) BETWEEN '08' AND '11'
SELECT (SELECT COUNT(*) FROM gasstations WHERE Segment = 'Discount' AND Country = 'CZE') - (SELECT COUNT(*) FROM gasstations WHERE Segment = 'Discount' AND Country = 'SVK') AS Difference_In_Discount_Gas_Stations;
SELECT (SELECT Consumption FROM yearmonth WHERE CustomerID = 7 AND Date = '201304') - (SELECT Consumption FROM yearmonth WHERE CustomerID = 5 AND Date = '201304') AS Difference;
SELECT (SELECT COUNT(DISTINCT T1.CustomerID) FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'SME' AND T1.Currency = 'CZK') - (SELECT COUNT(DISTINCT T1.CustomerID) FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'SME' AND T1.Currency = 'EUR') AS difference;
SELECT T1.CustomerID FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM' AND T1.Currency = 'EUR' AND T2.Date = '201310' ORDER BY T2.Consumption DESC LIMIT 1
SELECT T1.CustomerID, MAX(T2.Consumption) FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'KAM' GROUP BY T1.CustomerID ORDER BY T2.Consumption DESC LIMIT 1
SELECT SUM(T4.Consumption) FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID JOIN yearmonth AS T4 ON T4.CustomerID = T1.CustomerID WHERE T1.Segment = 'KAM' AND T4.Date = '201305'
SELECT CAST(SUM(CASE WHEN T2.Consumption > 46.73 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.CustomerID) FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM';
SELECT Country , COUNT(GasStationID) FROM gasstations WHERE `Segment` = 'Value for money' GROUP BY Country ORDER BY COUNT(GasStationID) DESC LIMIT 1;
SELECT CAST(SUM(CASE WHEN T2.Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'KAM';
SELECT CAST(SUM(CASE WHEN T2.Consumption > 528.3 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.CustomerID) FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE SUBSTR(T2.Date, 1, 4) = '2012' AND SUBSTR(T2.Date, 5, 2) = '02'
SELECT CAST(SUM(IIF(T2.Segment = 'Premium', 1, 0)) AS REAL) * 100 / COUNT(T1.GasStationID) FROM gasstations AS T1 JOIN chains AS T2 ON T1.ChainID = T2.ChainID WHERE T1.Country = 'SVK'
SELECT T1.CustomerID FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '201309' ORDER BY T2.Consumption DESC LIMIT 1
SELECT T1.Segment FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '201309' ORDER BY T2.Consumption ASC LIMIT 1
SELECT T1.CustomerID FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'SME' AND T2.Date = '201206' ORDER BY T2.Consumption ASC LIMIT 1
SELECT MAX(Consumption) FROM yearmonth WHERE SUBSTR(Date,1,4) = '2012'
SELECT MAX(T3.Consumption) FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID JOIN yearmonth AS T3 ON T1.CustomerID = T3.CustomerID WHERE T1.Currency = 'EUR' GROUP BY T3.Date ORDER BY SUM(T3.Consumption) DESC LIMIT 1
SELECT T3.Description FROM transactions_1k AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID JOIN products AS T3 ON T1.ProductID = T3.ProductID WHERE SUBSTR(T2.Date, 1, 4) = '2013' AND SUBSTR(T2.Date, 5, 2) = '09'
SELECT T3.Country FROM `transactions_1k` AS T1 JOIN `gasstations` AS T3 ON T1.GasStationID = T3.GasStationID JOIN `yearmonth` AS T2 ON T1.CustomerID = T2.CustomerID WHERE SUBSTR(T2.Date, 1, 4) = '2013' AND SUBSTR(T2.Date, 5, 6) = '06' GROUP BY T3.Country
SELECT T3.ChainID FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID JOIN gasstations AS T3 ON T1.GasStationID = T3.GasStationID WHERE T2.Currency = 'EUR' GROUP BY T3.ChainID
SELECT T3.Description FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID JOIN products AS T3 ON T1.ProductID = T3.ProductID WHERE T2.Currency = 'EUR'
SELECT AVG(t1.Price * t1.Amount) FROM transactions_1k AS t1 JOIN yearmonth AS t2 ON t1.CustomerID = t2.CustomerID WHERE t2.Date LIKE '201201%'
SELECT COUNT(*)  FROM customers c  JOIN yearmonth ym ON c.CustomerID = ym.CustomerID  WHERE c.Currency = 'EUR' AND ym.Consumption > 1000;
SELECT T3.Description FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID JOIN products AS T3 ON T1.ProductID = T3.ProductID WHERE T2.Country = 'CZE'
SELECT T2.Time FROM gasstations AS T1 JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.ChainID = 11 GROUP BY T2.Time
SELECT COUNT(*) FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE' AND T1.Price > 1000
SELECT COUNT(*) FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE' AND T1.Date > '2012-01-01'
SELECT AVG(T1.Price * T1.Amount) FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE'
SELECT AVG(t1.Price * t1.Amount) FROM transactions_1k AS t1 JOIN customers AS t2 ON t1.CustomerID = t2.CustomerID WHERE t2.Currency = 'EUR'
SELECT T1.CustomerID FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '2012-08-25' ORDER BY T2.Amount * T2.Price DESC LIMIT 1
SELECT T3.Country FROM transactions_1k AS T1 JOIN gasstations AS T3 ON T1.GasStationID = T3.GasStationID WHERE T1.Date = '2012-08-25' ORDER BY T1.Time LIMIT 1
SELECT T1.Currency FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '2012-08-24' AND T2.Time = '16:25:00'
SELECT T1.Segment FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '2012-08-23' AND T2.Time = '21:20:00'
SELECT COUNT(*) FROM transactions_1k WHERE Date = '2012-08-26' AND Time < '13:00:00' AND CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'CZK')
SELECT T1.Segment FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID ORDER BY T2.Date, T2.Time LIMIT 1
SELECT T3.Country FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID JOIN gasstations AS T3 ON T1.GasStationID = T3.GasStationID WHERE T1.Date = '2012-08-24' AND T1.Time = '12:42:00'
SELECT T1.ProductID FROM transactions_1k AS T1 WHERE T1.Date = '2012-08-23' AND T1.Time = '21:20:00'
SELECT T3.Consumption ,  T3.Date FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID JOIN yearmonth AS T3 ON T3.CustomerID = T2.CustomerID WHERE T1.Price = 124.05 AND T1.Date = '2012-08-24' AND T3.Date LIKE '201201%'
SELECT COUNT(*) FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE transactions_1k.Date = '2012-08-26' AND transactions_1k.Time BETWEEN '08:00:00' AND '09:00:00' AND gasstations.Country = 'CZE'
SELECT T1.Currency FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '201306' AND T2.Consumption = 214582.17
SELECT T2.Country FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.CardID = 667467 GROUP BY T2.Country
SELECT T1.Currency FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '2012-08-24' AND (T2.Amount * T2.Price) = 548.4
SELECT 100 * COUNT(DISTINCT T1.CustomerID) / (SELECT COUNT(*) FROM customers) AS percentage FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date = '2012-08-25' AND T2.Currency = 'EUR'
SELECT ((SELECT SUM(t1.Consumption) FROM yearmonth AS t1 WHERE t1.CustomerID IN (SELECT t2.CustomerID FROM transactions_1k AS t2 WHERE t2.Price * t2.Amount = 634.8 AND t2.Date = '2012-08-25') AND t1.Date LIKE '2012%') - (SELECT SUM(t1.Consumption) FROM yearmonth AS t1 WHERE t1.CustomerID IN (SELECT t2.CustomerID FROM transactions_1k AS t2 WHERE t2.Price * t2.Amount = 634.8 AND t2.Date = '2012-08-25') AND t1.Date LIKE '2013%')) / (SELECT SUM(t1.Consumption) FROM yearmonth AS t1 WHERE t1.CustomerID IN (SELECT t2.CustomerID FROM transactions_1k AS t2 WHERE t2.Price * t2.Amount = 634.8 AND t2.Date = '2012-08-25') AND t1.Date LIKE '2012%')
SELECT T2.GasStationID, SUM(T1.Amount * T1.Price) AS Revenue FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID GROUP BY T2.GasStationID ORDER BY Revenue DESC LIMIT 1;
SELECT CAST(SUM(CASE WHEN T2.Segment = 'Premium' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM gasstations AS T1 JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Country = 'SVK';
SELECT SUM(T1.Amount * T1.Price) AS AmountSpent FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.CustomerID = '38508' AND strftime('%Y%m', T1.Date) = '201201'
SELECT T1.Description FROM products AS T1 JOIN transactions_1k AS T2 ON T1.ProductID = T2.ProductID GROUP BY T1.ProductID ORDER BY SUM(T2.Amount) DESC LIMIT 5;
SELECT T1.CustomerID, T3.Currency, SUM(T2.Price)/SUM(T2.Amount) AS AvgPricePerItem FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID JOIN customers AS T3 ON T1.CustomerID = T3.CustomerID WHERE T2.Price/T2.Amount = (SELECT MAX(Price/Amount) FROM transactions_1k) GROUP BY T1.CustomerID, T3.Currency ORDER BY SUM(T2.Price) DESC LIMIT 1;
SELECT T3.Country FROM products AS T1 JOIN transactions_1k AS T2 ON T1.ProductID = T2.ProductID JOIN gasstations AS T3 ON T2.GasStationID = T3.GasStationID WHERE T1.ProductID = 2 ORDER BY T2.Price DESC LIMIT 1
SELECT T5.Consumption FROM transactions_1k AS T1 JOIN products AS T2 ON T1.ProductID = T2.ProductID JOIN customers AS T3 ON T1.CustomerID = T3.CustomerID JOIN gasstations AS T4 ON T1.GasStationID = T4.GasStationID JOIN yearmonth AS T5 ON T3.CustomerID = T5.CustomerID WHERE T1.ProductID = 5 AND T1.Price / T1.Amount > 29.00 AND T5.Date = '201208'
