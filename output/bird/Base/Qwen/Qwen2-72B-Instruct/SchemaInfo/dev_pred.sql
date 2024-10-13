SELECT MAX(`Free Meal Count (K-12)` / `Enrollment (K-12)`) AS eligible_free_rate FROM table_name WHERE County = 'Alameda' AND `School Level` = 'K-12';
SELECT MIN(`Free Meal Count (Ages 5-17)`) / `Enrollment (Ages 5-17)` AS eligible_free_rate  FROM table_name  WHERE School_Type = 'Continuation'  GROUP BY `CDS Code`  ORDER BY eligible_free_rate ASC  LIMIT 3
SELECT T2.ZipCode FROM fprm AS T1 JOIN school AS T2 ON T1.SchID = T2.SchID WHERE T1.CountyOfficeEdName = 'FRESNO COUNTY OFFICE OF EDUCATION' AND T1.`Charter School (Y/N)` = 1
SELECT T1.StreetAddress FROM Schools AS T1 JOIN StudentCounts AS T2 ON T1.SchoolID = T2.SchoolID WHERE T2.FRPMCountK_12 = (SELECT MAX(FRPMCountK_12) FROM StudentCounts)
SELECT T2.PhoneNumber FROM Schools AS T1 JOIN Addresses AS T2 ON T1.AddressID = T2.AddressID WHERE T1.CharterSchoolYN = 1 AND T1.OpenDate > '2000-01-01'
SELECT COUNT(*) FROM schools WHERE Virtual = 'F' AND AVG_Math_SAT > 400
SELECT T1.SchoolName FROM Schools AS T1 JOIN SATScores AS T2 ON T1.SchoolID = T2.SchoolID WHERE T2.TestTakers > 500 AND T1.Magnet = 1
SELECT T2.Phone FROM (SELECT SchoolID, COUNT(*) AS NumTestTakers FROM SATScores WHERE Score > 1500 GROUP BY SchoolID ORDER BY NumTestTakers DESC LIMIT 1) AS T1 JOIN Schools AS T2 ON T1.SchoolID = T2.ID
SELECT T1.SAT_takers FROM school AS T1 JOIN school_details AS T2 ON T1.school_id = T2.school_id WHERE T2.FRPM_K_12 = (SELECT MAX(FRPM_K_12) FROM school_details) LIMIT 1;
SELECT COUNT(*) FROM Schools WHERE Funding_Type = 'Charter' AND AVG_SAT_Math > 560;
SELECT T2.FRPM_5_17 FROM SAT_Scores AS T1 JOIN School AS T2 ON T1.SCHOOL_ID = T2.SCHOOL_ID WHERE T1.Test_Name = 'SAT' AND T1.Subject = 'Reading' ORDER BY AVG(T1.Score) DESC LIMIT 1
SELECT SchoolCode FROM Schools WHERE (`Enrollment_K_12` + `Enrollment_Ages_5_17`) > 500;
SELECT MAX(`Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)`) AS highest_eligible_free_rate FROM table_name WHERE (`NumGE1500` / `NumTstTakr`) > 0.3;
SELECT T2.Phone FROM (SELECT SchoolCode, SUM(NumGE1500) AS SumNumGE1500, SUM(NumTstTakr) AS SumNumTstTakr FROM SATExcellence WHERE NumGE1500 IS NOT NULL AND NumTstTakr IS NOT NULL GROUP BY SchoolCode) AS T1 JOIN Schools AS T2 ON T1.SchoolCode = T2.SchoolCode ORDER BY (T1.SumNumGE1500 / T1.SumNumTstTakr) DESC LIMIT 3
SELECT T1.NCES_School_Id FROM School AS T1 JOIN Enrollment AS T2 ON T1.School_ID = T2.School_ID WHERE Age_Range = '5-17' GROUP BY T1.NCES_School_Id ORDER BY SUM(Enrollment) DESC LIMIT 5
SELECT DistrictName FROM SchoolDistricts WHERE IsActive = 1 GROUP BY DistrictName ORDER BY AVG(ReadingScore) DESC LIMIT 1;
SELECT COUNT(*) FROM Schools WHERE County = 'Alameda' AND TestTakers < 100;
SELECT Charter_Number, AVG(Writing_Score) AS Average_Writing_Score  FROM School_Districts  WHERE Writing_Score > 499 AND Charter_Number IS NOT NULL  GROUP BY Charter_Number  ORDER BY Average_Writing_Score DESC;
SELECT COUNT(*) FROM Schools WHERE Location = 'Fresno' AND Funding_Type = 'Directly Funded' AND Test_Takers <= 250;
SELECT T1.Phone FROM Schools AS T1 JOIN Scores AS T2 ON T1.SchoolID = T2.SchoolID WHERE T2.Subject = 'Math' GROUP BY T1.SchoolID ORDER BY AVG(T2.Score) DESC LIMIT 1;
SELECT COUNT(*) FROM Schools WHERE County = 'Amador' AND LowGrade = 9 AND HighGrade = 12;
SELECT COUNT(*) FROM schools WHERE district = 'Los Angeles' AND free_meals > 500 AND free_meals < 700 AND reduced_price_meals + free_meals < 700 AND grade_range LIKE '%K%' AND grade_range LIKE '%12%'
SELECT SchoolName FROM Schools WHERE County = 'Contra Costa' ORDER BY TestTakers DESC LIMIT 1;
SELECT T1.SchoolName ,  T1.StreetAddress FROM Schools AS T1 INNER JOIN SchoolDistricts AS T2 ON T1.DistrictID = T2.DistrictID WHERE ABS(T1.EnrollmentK_12 - T1.EnrollmentAges5_17) > 30
SELECT T1.SchoolName FROM Schools AS T1 JOIN TestScores AS T2 ON T1.SchoolID = T2.SchoolID WHERE (T1.FreeMealCountK_12 / T1.TotalEnrollmentK_12) > 0.1 AND T2.TestScore >= 1500
SELECT T1.FundingType FROM Schools AS T1 JOIN SATScores AS T2 ON T1.SchoolID = T2.SchoolID WHERE T1.City = 'Riverside' GROUP BY T1.SchoolName HAVING AVG(T2.AvgMathScore) > 400
SELECT AdmFName1, AdmLName1, AdmEmail1, Street, City, State, Zip FROM Schools WHERE County = 'Monterey' AND SchoolType = 'High School' AND AgeRange = '15-17' AND Free_Reduced_Meals > 800
SELECT S.SchoolName, AVG(AS.WritingScore) AS AvgWritingScore, S.PhoneNumber FROM Schools AS S JOIN AssessmentScores AS AS ON S.SchoolID = AS.SchoolID WHERE (S.OpeningYear > 1991 OR S.ClosingYear < 2000) GROUP BY S.SchoolName, S.PhoneNumber;
SELECT T1.Name ,  T1.DOC_Type FROM Schools AS T1 JOIN School_Districts AS T2 ON T1.Sponsor_District_ID  =  T2.ID WHERE T1.Funding_Type  =  'Local' AND (T1.Enrollment_K_12 - T1.Enrollment_Ages_5_17) > (SELECT AVG(Enrollment_K_12 - Enrollment_Ages_5_17) FROM Schools WHERE Funding_Type  =  'Local')
SELECT T1.Opened FROM School AS T1 JOIN Enrollment AS T2 ON T1.SchoolID = T2.SchoolID WHERE T1.GradesOffered = 'K-12' ORDER BY T2.Enrollment DESC LIMIT 1
SELECT T2.City FROM Schools AS T1 JOIN Addresses AS T2 ON T1.AddressID = T2.AddressID WHERE T1.Enrollment IS NOT NULL ORDER BY T1.Enrollment ASC LIMIT 5;
SELECT T1.FreeMealCount_K_12 / T1.Enrollment_K_12 AS Eligible_Free_Rate FROM Schools AS T1 WHERE T1.SchoolID IN (SELECT SchoolID FROM Schools ORDER BY Enrollment_K_12 DESC LIMIT 10, 2)
SELECT `Eligible FRPM Rate` FROM `school_details` WHERE `Ownership Code` = 66 ORDER BY `FRPM Count (K-12)` DESC LIMIT 5
SELECT T1.Website, T1.SchoolName FROM School AS T1 JOIN Meals AS T2 ON T1.SchoolID = T2.SchoolID WHERE T2.FreeMeals BETWEEN 1900 AND 2000 AND T1.AgeRange = '5-17'
SELECT (`FreeMealCountAges5_17` / `EnrollmentAges5_17`) AS free_rate WHERE AdmFName1 = 'Kacey' AND AdmLName1 = 'Gibson'
SELECT T2.AdmEmail1 FROM frm AS T1 JOIN sch AS T2 ON T1.SchID = T2.SchID WHERE T1.`Charter School (Y/N)` = 1 AND T1.SchTypeDesc = 'Chartered' ORDER BY `Enrollment (K-12)` ASC LIMIT 1
SELECT T2.AdmFName1, T2.AdmLName1, T2.AdmFName2, T2.AdmLName2, T2.AdmFName3, T2.AdmLName3 FROM School_SAT_Results AS T1 JOIN Schools AS T2 ON T1.SchoolID = T2.SchoolID WHERE T1.NumGE1500 = (SELECT MAX(NumGE1500) FROM School_SAT_Results)
SELECT T2.Street, T2.City, T2.Zip, T2.State FROM (SELECT SchoolID, MIN(ExcellenceRate) AS MinExcellenceRate FROM (SELECT SchoolID, NumGE1500 / NumTstTakr AS ExcellenceRate FROM Schools) GROUP BY SchoolID) AS T1 JOIN Schools AS T2 ON T1.SchoolID = T2.SchoolID WHERE T1.MinExcellenceRate = T2.ExcellenceRate;
SELECT Webpage FROM Schools WHERE County = 'Los Angeles' AND TestTakers BETWEEN 2000 AND 3000;
SELECT AVG(TestTakers) FROM Schools WHERE City = 'Fresno' AND YearOpened = 1980
SELECT T1.Phone FROM Schools AS T1 JOIN TestScores AS T2 ON T1.SchoolID = T2.SchoolID WHERE T1.DistrictName = 'Fresno Unified' GROUP BY T1.SchoolID ORDER BY AVG(T2.ReadingScore) ASC LIMIT 1
SELECT AdmFName1, AdmLName1  FROM table_name  WHERE Virtual = 'F'  GROUP BY County, AdmFName1, AdmLName1  HAVING AVG(ReadingScore) OVER (PARTITION BY County)  IN (SELECT TOP 5 AVG(ReadingScore)      FROM table_name      WHERE Virtual = 'F'      GROUP BY County      ORDER BY AVG(ReadingScore) DESC)
SELECT T1.SchoolType FROM Schools AS T1 JOIN Scores AS T2 ON T1.SchoolID = T2.SchoolID WHERE T2.Subject = 'Math' ORDER BY AVG(T2.Score) DESC LIMIT 1;
SELECT T1.AvgScrMath, T2.County  FROM SchoolScores AS T1  JOIN Schools AS T2 ON T1.SchID = T2.SchID  WHERE T1.AvgScrMath + T1.AvgScrRead + T1.AvgScrWrite = (SELECT MIN(AvgScrMath + AvgScrRead + AvgScrWrite) FROM SchoolScores) GROUP BY T2.County ORDER BY AVG(T1.AvgScrMath) ASC LIMIT 1;
SELECT T1.City, AVG(T2.Writing) AS AvgWritingScore FROM Schools AS T1 JOIN SATScores AS T2 ON T1.SchoolID = T2.SchoolID WHERE T2.TotalSAT >= 1500 GROUP BY T1.City ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.SchoolName, AVG(T2.WritingScore) FROM Schools AS T1 JOIN TestScores AS T2 ON T1.SchoolID = T2.SchoolID WHERE T1.AdministratorFirstName = 'Ricci' AND T1.AdministratorLastName = 'Ulrich' GROUP BY T1.SchoolName
SELECT T1.SchoolName FROM School AS T1 JOIN Enrollment AS T2 ON T1.schoolid = T2.schoolid WHERE T1.DOC = 31 AND T1.K_12 = 'Yes' GROUP BY T1.SchoolName ORDER BY SUM(T2.Enrollment) DESC LIMIT 1
SELECT COUNT(*) / 12 FROM Schools WHERE County = 'Alameda' AND DOC = 52 AND OpenYr = 1980
SELECT CAST(SUM(CASE WHEN DOC = 54 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN DOC = 52 THEN 1 ELSE 0 END) FROM schools WHERE County = 'Orange' AND Status = 'Merged';
SELECT T1.CountyName, T2.SchoolName, T2.ClosureDate  FROM County AS T1  JOIN School AS T2 ON T1.CountyID = T2.CountyID  WHERE T2.StatusType = 'Closed'  GROUP BY T1.CountyName  ORDER BY COUNT(T2.SchoolID) DESC  LIMIT 1;
SELECT T1.SchMailingStreet, T1.SchName FROM Schools AS T1 JOIN TestScores AS T2 ON T1.SchID = T2.SchID WHERE T2.TestType = 'Math' ORDER BY T2.AvgScore DESC LIMIT 6,1;
SELECT T1.MailingStreetAddress, T1.SchoolName FROM Schools AS T1 JOIN TestScores AS T2 ON T1.SchoolID = T2.SchoolID WHERE T2.Subject = 'Reading' GROUP BY T1.SchoolID ORDER BY AVG(T2.AverageScore) ASC LIMIT 1
SELECT COUNT(*) FROM school WHERE MailingCity = 'Lakeport' AND (AvgScrRead + AvgScrMath + AvgScrWrite) >= 1500
SELECT COUNT(*) FROM School WHERE MailingCity = 'Fresno' AND TestTakers > 0;
SELECT SchoolName, MailingZipCode FROM Schools WHERE AdmFName1 = 'Avetik' AND AdmLName1 = 'Atoian' OR AdmFName2 = 'Avetik' AND AdmLName2 = 'Atoian' OR AdmFName3 = 'Avetik' AND AdmLName3 = 'Atoian';
SELECT COUNT(CASE WHEN County = 'Colusa' THEN 1 ELSE NULL END) / COUNT(CASE WHEN County = 'Humboldt' THEN 1 ELSE NULL END) AS Ratio  FROM Schools  WHERE MailingStateAddress = 'California'
SELECT COUNT(*) FROM schools WHERE MailingState = 'CA' AND City = 'San Joaquin' AND Status = 'Active'
SELECT T1.PhoneNumber ,  T1.PhoneExt FROM Schools AS T1 JOIN TestScores AS T2 ON T1.SchoolID  =  T2.SchoolID WHERE T2.TestType  =  'WR' GROUP BY T1.SchoolID ORDER BY AVG(Score) DESC LIMIT 333-332;
SELECT SchoolPhone, PhoneExt, SchoolName FROM Schools WHERE ZipCode = '95203-3704'
SELECT T1.Website FROM School AS T1 JOIN Administrator AS T2 ON T1.AdminID = T2.AdminID WHERE T2.FName = 'Mike' AND T2.LName = 'Larson' INTERSECT SELECT T1.Website FROM School AS T1 JOIN Administrator AS T2 ON T1.AdminID = T2.AdminID WHERE T2.FName = 'Dante' AND T2.LName = 'Alvarez'
SELECT T1.WebSite FROM Schools AS T1 JOIN SchoolLocations AS T2 ON T1.SchoolID = T2.SchoolID WHERE T2.CountyName = 'San Joaquin' AND T1.Virtual = 'P' AND T1.Charter = 1
SELECT COUNT(*) FROM schools WHERE City = 'Hickman' AND DOC = 52 AND Charter = 1
SELECT COUNT(*) FROM Schools WHERE CountyName = 'Los Angeles' AND Charter = 0 AND ((`Free Meal Count (K-12)` * 100) / `Enrollment (K-12)`) < 0.18;
SELECT T2.AdmFName1, T2.AdmLName1, T1.SchoolName, T1.City FROM Schools AS T1 JOIN Admins AS T2 ON T1.AdminID = T2.AdminID WHERE T1.Charter = '00D2' AND T1.SchoolType = 'Charter';
SELECT COUNT(*) FROM Schools WHERE MailingCity = 'Hickman' AND CharterNumber = '00D4'
SELECT CAST(SUM(CASE WHEN FundingSource = 'Local' THEN 1 ELSE 0 END) AS REAL) / COUNT(*) * 100  FROM Schools  WHERE County = 'Santa Clara' AND CharterSchool = 'Yes';
SELECT COUNT(*) FROM Schools WHERE County = 'Stanislaus' AND FundingType = 'Directly Funded' AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31'
SELECT SUM(T2.closure) AS total_closure FROM districts AS T1 JOIN cc_closures AS T2 ON T1.district_id = T2.district_id WHERE T1.city = 'San Francisco' AND T2.year = 1989;
SELECT T2.County FROM Schools AS T1 JOIN Districts AS T2 ON T1.DistrictID = T2.DistrictID WHERE T1.SOC = 11 AND T1.CloseYr BETWEEN 1980 AND 1989 GROUP BY T2.County ORDER BY COUNT(*) DESC LIMIT 1
SELECT NCES_District_ID FROM table_name WHERE SOC = 31;
SELECT COUNT(*) FROM schools WHERE County = 'Alpine' AND Status = 'Active' OR Status = 'Closed' AND School_Type = 'District Community Day School'
SELECT DistrictCode FROM Schools WHERE City = 'Fresno' AND Magnet = 0;
SELECT COUNT(*) FROM students WHERE Age BETWEEN 5 AND 17 AND SchoolYear = '2014-2015' AND EdOpsCode = 'SSS' AND City = 'Fremont'
SELECT SUM(Free_Reduced_Meal_Count_5_17) FROM School WHERE Mailing_Street_Address = 'PO Box 1040' AND School_Name = 'Youth Authority School'
SELECT MIN(Grade) FROM Schools WHERE EdOpsCode = 'SPECON' AND NCESDistID = 0613360;
SELECT T1.SchoolName, T1.EducationalLevelName FROM Schools AS T1 JOIN SchoolBreakfastProgram AS T2 ON T1.SchoolID = T2.SchoolID WHERE T2.BreakfastProvision = '2' AND T1.CountyCode = '37'
SELECT T1.CityLocation FROM School AS T1 JOIN SchoolLunchProvision AS T2 ON T1.SchoolID = T2.SchoolID WHERE T1.EILCode = 'HS' AND T2.LunchProvision = 2 AND T1.LowGrade = 9 AND T1.HighGrade = 12 AND T1.County = 'Merced'
SELECT SchoolName, (FRPMCount_5_17 / Enrollment_5_17) * 100 AS Percent_Eligible_FRPM FROM Schools WHERE County = 'Los Angeles' AND GradeSpan = 'KG-9'
SELECT GradeSpanType, COUNT(*) AS Frequency FROM Schools WHERE City = 'Adelanto' GROUP BY GradeSpanType ORDER BY Frequency DESC LIMIT 1;
SELECT T1.CountyName, COUNT(*) AS SchoolCount FROM County AS T1 JOIN School AS T2 ON T1.CountyID = T2.CountyID WHERE (T1.CountyName = 'San Diego' OR T1.CountyName = 'Santa Barbara') AND T2.Virtual = 'F' GROUP BY T1.CountyName ORDER BY SchoolCount DESC LIMIT 1;
SELECT SchoolName, Latitude FROM Schools ORDER BY Latitude DESC LIMIT 1;
SELECT T1.City, T2.SchoolName, T2.LowGrade FROM Schools AS T1 JOIN SchoolDetails AS T2 ON T1.SchoolID = T2.SchoolID WHERE T1.State = 'CA' ORDER BY T1.Latitude ASC LIMIT 1;
SELECT T2.GradesSpan FROM Schools AS T1 JOIN SchoolDetails AS T2 ON T1.SchoolID = T2.SchoolID WHERE ABS(T1.Longitude) = (SELECT MAX(ABS(Longitude)) FROM Schools)
SELECT T2.City, COUNT(*) AS School_Count FROM Schools AS T1 JOIN Addresses AS T2 ON T1.Address_ID = T2.Address_ID WHERE T1.Magnet = 1 AND T1.Grade_Span = 'K-8' AND T1.NSLP_Provision_Status = 'Multiple Provision Types' GROUP BY T2.City;
SELECT AdmFName1, COUNT(AdmFName1) AS NameCount, AdmLName1 FROM table_name GROUP BY AdmFName1, AdmLName1 ORDER BY NameCount DESC LIMIT 2;
SELECT T1.DistrictCode, (T1.`Free Meal Count (K-12)` / T1.`Enrollment (K-12)`) * 100 AS Percent_Eligible_Free FROM `school_data` AS T1 JOIN `admin_info` AS T2 ON T1.SchoolID = T2.SchoolID WHERE T2.AdmFName1 = 'Alusine'
SELECT T1.AdmLName1, T2.District, T2.County, T2.SchoolName FROM SchoolAdmin AS T1 JOIN Schools AS T2 ON T1.SchID = T2.SchID WHERE T2.Charter = 40;
SELECT AdmEmail1 FROM schools WHERE County = 'San Bernardino' AND City = 'San Bernardino City Unified' AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND (SOC = 62 OR DOC = 54) UNION SELECT AdmEmail2 FROM schools WHERE County = 'San Bernardino' AND City = 'San Bernardino City Unified' AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND (SOC = 62 OR DOC = 54) UNION SELECT AdmEmail3 FROM schools WHERE County = 'San Bernardino' AND City = 'San Bernardino City Unified' AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND (SOC = 62 OR DOC = 54)
SELECT AdmEmail1 FROM table_name WHERE SchoolID = (SELECT SchoolID FROM SAT_Scores GROUP BY SchoolID ORDER BY SUM(SAT_Score) >= 1500 AND COUNT(*) DESC LIMIT 1);   -- Note: The above SQL is incomplete and assumes the existence of a table named 'table_name' which contains the administrator's email address, and another table named 'SAT_Scores' that has records for each test taker with their SAT scores. It also assumes that SchoolID is a common column in both tables. This query will return the email address of the first administrator (AdmEmail1) associated with the school having the highest number of students who scored at least 1500 on the SAT. If there are multiple administrators, you may need to modify the query to select AdmEmail2 or AdmEmail3 as well.
SELECT COUNT(*) FROM account WHERE frequency = 'POPLATEK PO OBRATU' AND district_id IN (SELECT district_id FROM A3 WHERE region = 'East Bohemia')
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE city = 'Prague') AND frequency = 'POPLATEK MESICNE'
SELECT      CASE          WHEN AVG(CASE WHEN date LIKE '1995%' THEN A12 END) > AVG(CASE WHEN date LIKE '1996%' THEN A13 END) THEN '1995'         ELSE '1996'     END AS higher_unemployment_year FROM account JOIN client ON account.account_id = client.client_id WHERE date BETWEEN '1995-01-01' AND '1996-12-31';
