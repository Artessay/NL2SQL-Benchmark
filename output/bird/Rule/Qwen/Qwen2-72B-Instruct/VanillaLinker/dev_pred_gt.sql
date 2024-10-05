SELECT MAX(T1.`Free Meal Count (K-12)` / T1.`Enrollment (K-12)`) AS highest_free_rate FROM `schools` AS T1 WHERE T1.County = 'Alameda' AND T1.`School Level` IN ('Elementary', 'Middle', 'High') AND T1.`Free Meal Count (K-12)` IS NOT NULL AND T1.`Enrollment (K-12)` IS NOT NULL	california_schools
SELECT T1.school_id, (T2.free_meal_count_ages_5_17 / T2.enrollment_ages_5_17) AS eligible_free_rate FROM `schools` AS T1 JOIN `eligibility_rates` AS T2 ON T1.school_id = T2.school_id WHERE T1.school_type_code = 'C' AND T2.enrollment_ages_5_17 IS NOT NULL AND T2.free_meal_count_ages_5_17 IS NOT NULL ORDER BY eligible_free_rate ASC LIMIT 3	california_schools
SELECT `Zip Code` FROM `schools` WHERE `County Office of Education (COE)` = 'Fresno County Office of Education' AND `Charter School (Y/N)` = 1	california_schools
SELECT T1.mailing_street_address_unabbreviated FROM schools AS T1 JOIN school_food_service_program_counts AS T2 ON T1.school_id = T2.school_id WHERE T1.grade_levels_offered = 'K-12' ORDER BY T2.frpm_count DESC LIMIT 1	california_schools
SELECT `Phone Number` FROM `schools` WHERE `Charter School (Y/N)` = 1 AND `Funding Type` = 'Directly funded' AND `Open Date` >= '2000-01-01'	california_schools
SELECT COUNT(*) FROM schools WHERE Virtual = 'F' AND Math_SAT > 400;	california_schools
SELECT name FROM schools WHERE magnet = 1 AND sat_test_takers > 500	california_schools
SELECT T1.Phone FROM schools AS T1 JOIN test_scores AS T2 ON T1.school_id = T2.school_id WHERE T2.SAT > 1500 GROUP BY T1.school_id ORDER BY COUNT(T1.school_id) DESC LIMIT 1	california_schools
SELECT T1.SAT_test_takers FROM schools AS T1 JOIN school_details AS T2 ON T1.school_id = T2.school_id WHERE T1.FRPM_count_K_12_students = (SELECT MAX(FRPM_count_K_12_students) FROM schools) ORDER BY T1.SAT_test_takers DESC LIMIT 1	california_schools
SELECT COUNT(*) FROM schools WHERE funding = 'Directly funded' AND id IN (SELECT school_id FROM sat_scores WHERE math > 560)	california_schools
SELECT T1.frpm_count_5_17 FROM schools AS T1 JOIN test_scores AS T2 ON T1.school_id = T2.school_id WHERE T2.test_name = 'SAT' AND T2.subject = 'Reading' ORDER BY T2.average_score DESC LIMIT 1	california_schools
SELECT `School Code` FROM `schools` WHERE (`Enrollment (K-12)` + `Enrollment (Ages 5-17)`) > 500	california_schools
SELECT MAX(T1.`Free Meal Count (Ages 5-17)` / T1.`Enrollment (Ages 5-17)`) AS Eligible_Free_Rate FROM `schools` AS T1 JOIN `school_performance` AS T2 ON T1.School_ID = T2.School_ID WHERE T2.SAT_Excellence_Rate > 0.3 AND T1.`Eligibility for Free or Reduced Meals (Ages 5-17)` IS NOT NULL AND T1.`Enrollment (Ages 5-17)` IS NOT NULL ORDER BY Eligible_Free_Rate DESC LIMIT 1	california_schools
SELECT phone_number FROM schools ORDER BY (NumGE1500 / NumTstTakr) DESC LIMIT 3;	california_schools
SELECT `nces_school_id` FROM `schools` WHERE `grades_offered` = 'K-12' OR `grades_offered` = '9-12' ORDER BY `enrollment_ages_5_17` DESC LIMIT 5;	california_schools
SELECT d.district_id FROM schools s JOIN districts d ON s.district_id = d.district_id WHERE s.status = 'Active' GROUP BY s.district_id ORDER BY AVG(s.reading_score) DESC LIMIT 1	california_schools
SELECT COUNT(*) FROM schools WHERE county_name = 'Alameda' AND test_takers < 100;	california_schools
SELECT T1.charter_number FROM schools AS T1 JOIN test_scores AS T2 ON T1.school_id = T2.school_id WHERE T2.test_name = 'Writing' AND T2.score > 499 GROUP BY T1.charter_number ORDER BY AVG(T2.score) DESC	california_schools
SELECT COUNT(*) FROM schools WHERE county_name = 'Fresno' AND funding_type = 'Directly funded' AND test_takers <= 250;	california_schools
SELECT T1.Phone FROM schools AS T1 JOIN test_scores AS T2 ON T1.School_ID = T2.School_ID WHERE T2.Subject = 'Math' ORDER BY T2.Average_Score DESC LIMIT 1	california_schools
SELECT COUNT(*) FROM `schools` WHERE County = 'Amador' AND Low_Grade = 9 AND High_Grade = 12;	california_schools
SELECT COUNT(*) FROM schools WHERE county_name = 'Los Angeles' AND free_meals > 500 AND free_meals < 700 AND grade_levels = 'K-12'	california_schools
SELECT s.school_id FROM schools AS s JOIN test_scores AS ts ON s.school_id = ts.school_id WHERE s.county = 'Contra Costa' GROUP BY s.school_id ORDER BY SUM(ts.test_takers) DESC LIMIT 1	california_schools
SELECT name, CONCAT(address_1, ' ', address_2, ' ', city, ' ', state, ' ', zip) AS full_address FROM schools WHERE (enrollment_k_12 - enrollment_ages_5_17) > 30 AND enrollment_ages_5_17 IS NOT NULL AND enrollment_k_12 IS NOT NULL	california_schools
SELECT T1.SchoolName FROM `schools` AS T1 JOIN `test_scores` AS T2 ON T1.CDSCode = T2.CDSCode WHERE (T1.FreeMealCountK_12 / T1.TotalEnrollmentK_12) > 0.1 AND T2.TestScore >= 1500	california_schools
SELECT T1.funding_type FROM schools AS T1 JOIN sat_scores AS T2 ON T1.school_id = T2.school_id WHERE T1.county = 'Riverside' GROUP BY T1.school_name HAVING AVG(T2.avg_math) > 400;	california_schools
SELECT S.Name, CONCAT(S.Street, ', ', S.City, ', ', S.State, ' ', S.Zip) AS Full_Address  FROM schools AS S  WHERE S.County = 'Monterey' AND S.School_Type_Description = 'High Schools (Public)' AND S.Free_Reduced_Meals > 800 AND S.Ages_Served = '15-17';	california_schools
SELECT S.name, AVG(ST.writing_score) AS average_writing_score, S.communication_number FROM `schools` AS S JOIN `school_test_scores` AS ST ON S.id = ST.school_id WHERE (S.opened_date > '1991-01-01' OR S.closed_date < '2000-01-01') AND ST.writing_score IS NOT NULL GROUP BY S.name, S.communication_number ORDER BY average_writing_score DESC;	california_schools
SELECT S.Name, S.DOC_Type  FROM `schools` AS S  WHERE (S.Enrollment_K_12 - S.Enrollment_Ages_5_17) > (     SELECT AVG(S2.Enrollment_K_12 - S2.Enrollment_Ages_5_17)      FROM `schools` AS S2      WHERE S2.Funding_Type = 'Locally funded' )  AND S.Funding_Type = 'Locally funded'	california_schools
SELECT T1.opened FROM `schools` AS T1 WHERE T1.grade_low = 'K' AND T1.grade_high = '12' ORDER BY T1.enrollment DESC LIMIT 1	california_schools
SELECT T1.City FROM `schools` AS T1 JOIN (SELECT City, SUM(Enrollment) AS Total_Enrollment FROM `schools` WHERE Grade = 'K-12' GROUP BY City ORDER BY Total_Enrollment ASC LIMIT 5) AS T2 ON T1.City = T2.City	california_schools
SELECT T1.`Eligible Free Rate (K-12)` FROM `schools` AS T1 JOIN (SELECT `School ID`, `Enrollment (K-12)`, ROW_NUMBER() OVER (ORDER BY `Enrollment (K-12)` DESC) AS row_num FROM `schools`) AS T2 ON T1.`School ID` = T2.`School ID` WHERE T2.row_num IN (10, 11) ORDER BY T2.row_num ASC	california_schools
SELECT FRPM_Count_K_12 / Enrollment_K_12 AS Eligible_Free_Reduced_Meal_Rate FROM schools WHERE Ownership_Code = '66' AND Grade_Low = 1 AND Grade_High = 12 ORDER BY FRPM_Count_K_12 DESC LIMIT 5	california_schools
SELECT S.website, S.school_name FROM schools AS S WHERE S.free_meal_count BETWEEN 1900 AND 2000 AND S.age_range = '5-17'	california_schools
SELECT (T1.Free_Meal_Count_Ages_5_17 / T1.Enrollment_Ages_5_17) AS Free_Rate FROM `schools` AS T1 JOIN `school_administrators` AS T2 ON T1.School_ID = T2.School_ID WHERE T2.Administrator_Name = 'Kacey Gibson' AND T1.Enrollment_Ages_5_17 IS NOT NULL AND T1.Free_Meal_Count_Ages_5_17 IS NOT NULL	california_schools
SELECT T1.AdministratorEmail FROM `schools` AS T1 WHERE T1.`Charter School (Y/N)` = 1 AND T1.Enrollment_K_12 IS NOT NULL ORDER BY T1.Enrollment_K_12 LIMIT 1	california_schools
SELECT T1.AdministratorFName, T1.AdministratorLName FROM Schools AS T1 JOIN SATScores AS T2 ON T1.SchoolID = T2.SchoolID WHERE T2.NumGE1500 >= 1 ORDER BY T2.NumGE1500 DESC LIMIT 1	california_schools
SELECT Street, City, Zip, State FROM schools WHERE ExcellenceRate = (SELECT MIN(ExcellenceRate) FROM schools) LIMIT 1;	california_schools
SELECT website FROM schools WHERE county = 'Los Angeles' AND test_takers BETWEEN 2000 AND 3000;	california_schools
SELECT AVG(T1.test_takers) FROM test_scores AS T1 JOIN schools AS T2 ON T1.school_id = T2.id WHERE T2.city = 'Fresno' AND YEAR(T2.opened) = 1980	california_schools
SELECT T1.Telephone FROM `schools` AS T1 JOIN `test_scores` AS T2 ON T1.school_id = T2.school_id WHERE T1.District = 'Fresno Unified' AND T2.Subject = 'Reading' ORDER BY T2.Average_Score ASC LIMIT 1	california_schools
SELECT T1.SchoolName FROM `schools` AS T1 JOIN `test_scores` AS T2 ON T1.school_id = T2.school_id WHERE T1.Virtual = 'F' GROUP BY County, T1.SchoolName ORDER BY AVG(T2.Reading) DESC LIMIT 5	california_schools
SELECT T1.school_type FROM schools AS T1 JOIN test_scores AS T2 ON T1.school_id = T2.school_id WHERE subject = 'Math' ORDER BY average DESC LIMIT 1	california_schools
SELECT T1.County, AVG(T2.AvgScrMath) FROM schools AS T1 JOIN scores AS T2 ON T1.SchoolID = T2.SchoolID WHERE T2.AvgScrMath IS NOT NULL AND T2.AvgScrRead IS NOT NULL AND T2.AvgScrWrite IS NOT NULL GROUP BY T1.County ORDER BY AVG(T2.AvgScrMath + T2.AvgScrRead + T2.AvgScrWrite) LIMIT 1	california_schools
SELECT T1.City FROM Schools AS T1 JOIN SAT_Scores AS T2 ON T1.School_ID = T2.School_ID WHERE T2.Total_SAT >= 1500 GROUP BY T1.School_Name ORDER BY AVG(T2.Writing) DESC LIMIT 1	california_schools
SELECT T1.school_name, AVG(T2.writing_score) FROM schools AS T1 JOIN test_scores AS T2 ON T1.school_id = T2.school_id WHERE T1.administrator = 'Ricci Ulrich' GROUP BY T1.school_name	california_schools
SELECT COUNT(*) AS total_enrollees FROM schools WHERE DOC = 31 AND grade_low <= '1' AND grade_high >= '12' ORDER BY total_enrollees DESC LIMIT 1;	california_schools
SELECT COUNT(*) / 12 AS monthly_average FROM schools WHERE DOC = '52' AND SUBSTR(open_date, 1, 4) = '1980' AND county_name = 'Alameda'	california_schools
SELECT CAST(SUM(CASE WHEN T2.DOC = 54 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T2.DOC = 52 THEN 1 ELSE 0 END) FROM schools AS T1 JOIN school_districts AS T2 ON T1.SCHOOL_DISTRICT_ID = T2.SCHOOL_DISTRICT_ID WHERE T2.COUNTY = 'Orange' AND T1.MERGED_WITH_SCHOOL_ID IS NOT NULL	california_schools
SELECT S.Name, S.ClosureDate FROM schools AS S WHERE S.StatusType = 'Closed' ORDER BY S.ClosureDate DESC LIMIT 1; SELECT T2.CountyName, COUNT(*) AS SchoolCount FROM schools AS T1 JOIN counties AS T2 ON T1.CountyCode = T2.CountyCode WHERE T1.StatusType = 'Closed' GROUP BY T2.CountyName ORDER BY SchoolCount DESC LIMIT 1;	california_schools
SELECT T1.school_name, T1.mailing_street_address FROM schools AS T1 JOIN test_scores AS T2 ON T1.cds_code = T2.cds_code WHERE T2.subject = 'Math' AND T2.grade_level = '7th' ORDER BY T2.average_score DESC LIMIT 1	california_schools
SELECT T1.mailing_street_address, T1.school_name FROM `schools` AS T1 JOIN `school_performance` AS T2 ON T1.school_id = T2.school_id WHERE T2.subject = 'Reading' ORDER BY T2.average_score ASC LIMIT 1	california_schools
SELECT COUNT(*) FROM schools WHERE MailingCity = 'Lakeport' AND (AvgScrRead + AvgScrMath + AvgScrWrite) >= 1500;	california_schools
SELECT COUNT(*) FROM schools WHERE mailing_city = 'Fresno'	california_schools
SELECT S.school_name, S.mailing_zip_code FROM schools AS S WHERE S.principal_email = 'avetikatoian@lausd.net'	california_schools
SELECT CAST(SUM(CASE WHEN County = 'Colusa' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN County = 'Humboldt' THEN 1 ELSE 0 END) FROM schools WHERE Mailing_State = 'CA' AND Active = 'Active'	california_schools
SELECT COUNT(*) FROM schools WHERE mailing_state = 'CA' AND city = 'San Joaquin' AND status = 'Active'	california_schools
SELECT T1.PhoneNumber, T1.Extension FROM schools AS T1 JOIN test_scores AS T2 ON T1.school_id = T2.school_id WHERE T2.AverageWritingScore IS NOT NULL ORDER BY T2.AverageWritingScore DESC LIMIT 333 - 332;	california_schools
SELECT phone_number, extension FROM schools WHERE zip_code = '95203-3704' AND name = 'School_Name';	california_schools
SELECT website FROM schools WHERE principal = 'Mike Larson' OR principal = 'Dante Alvarez'	california_schools
SELECT website FROM schools WHERE County = 'San Joaquin' AND Virtual = 'P' AND Charter = 1;	california_schools
SELECT COUNT(*) FROM schools WHERE City = 'Hickman' AND DOC = 52 AND Charter = 1	california_schools
SELECT COUNT(*) FROM `schools` WHERE County = 'Los Angeles' AND Charter = 0 AND (`Free Meal Count (K-12)` * 100 / `Enrollment (K-12)`) < 0.18	california_schools
SELECT T1.school_name, T1.city, T2.first_name, T2.last_name FROM schools AS T1 JOIN administrators AS T2 ON T1.administrator_id = T2.administrator_id WHERE T1.charter_number = '00D2' AND T1.charter = 1	california_schools
SELECT COUNT(*) FROM schools WHERE Mailing_City = 'Hickman' AND Charter_Number = '00D4'	california_schools
SELECT (COUNT(CASE WHEN funding_type = 'Locally funded' THEN 1 END) / COUNT(*) * 100) AS ratio_percentage FROM schools WHERE county = 'Santa Clara' AND status = 'Active';	california_schools
SELECT COUNT(*) FROM schools WHERE County = 'Stanislaus' AND FundingType = 'Directly funded' AND OpenDate >= '2000-01-01' AND OpenDate <= '2005-12-31'	california_schools
SELECT SUM(CASE WHEN T1.closure_year = 1989 AND T2.city = 'San Francisco' THEN 1 ELSE 0 END) FROM schools AS T1 JOIN school_districts AS T2 ON T1.district_id = T2.district_id WHERE T1.school_type = 'Community College District'	california_schools
SELECT County FROM schools WHERE SOC = '11' AND YEAR(Close) BETWEEN 1980 AND 1989 GROUP BY County ORDER BY COUNT(*) DESC LIMIT 1	california_schools
SELECT NCES_SCHOOL_DISTRICT_ID FROM schools WHERE SOC = '31' AND School_Ownership_Code = 'State Special Schools'	california_schools
SELECT COUNT(*) FROM `schools` WHERE `county` = 'Alpine' AND `status` IN ('Active', 'Closed') AND `school_type` = 'District Community Day School'	california_schools
SELECT district_code FROM schools WHERE city = 'Fresno' AND magnet = 0 LIMIT 1	california_schools
SELECT COUNT(*) FROM schools AS T1 JOIN enrollment AS T2 ON T1.school_id = T2.school_id WHERE T1.city = 'Fremont' AND T1.EdOpsCode = 'SSS' AND T2.academic_year = '2014-2015' AND T2.age BETWEEN 5 AND 17;	california_schools
SELECT COUNT(*) FROM schools WHERE school_name = 'Youth Authority School' AND mailing_street_address = 'PO Box 1040' AND age_range = '5-17' AND free_or_reduced_price_meal_eligibility = 'Yes'	california_schools
SELECT MIN(T1.MinGrade) FROM schools AS T1 JOIN school_districts AS T2 ON T1.SchDistCode = T2.EdOpsCode WHERE T2.NCESDistrictID = '0613360' AND T1.EdOpsCode = 'SPECON'	california_schools
SELECT T1.school_name FROM schools AS T1 JOIN school_food_service_program AS T2 ON T1.school_id = T2.school_id WHERE T2.breakfast_provision_2 = 'Yes' AND T1.county_code = '37' AND T1.educational_level_name IS NOT NULL	california_schools
SELECT City FROM schools WHERE EILCode = 'HS' AND LunchProvision = 2 AND LowestGrade = 9 AND HighestGrade = 12 AND County = 'Merced' LIMIT 1	california_schools
SELECT S.SCHOOL_NAME, (T2.FRPM_COUNT_AGES_5_17 / T2.ENROLLMENT_AGES_5_17 * 100) AS Percent_Eligible_FRPM FROM schools AS S JOIN school_demographics AS SD ON S.SCHOOL_ID = SD.SCHOOL_ID WHERE S.COUNTY = 'Los Angeles' AND S.GRADE_SPAN = 'K-9'	california_schools
SELECT grade_span FROM schools WHERE city = 'Adelanto' GROUP BY grade_span ORDER BY COUNT(*) DESC LIMIT 1	california_schools
SELECT COUNT(T1.id), T2.County FROM schools AS T1 JOIN school_districts AS T2 ON T1.School_District_ID = T2.id WHERE T2.County IN('San Diego', 'Santa Barbara') AND T1.Virtual = 'F' GROUP BY T2.County ORDER BY COUNT(T1.id) DESC LIMIT 1	california_schools
SELECT `School Type` FROM schools WHERE latitude = (SELECT MAX(latitude) FROM schools) UNION SELECT SchoolName FROM schools WHERE latitude = (SELECT MAX(latitude) FROM schools)	california_schools
SELECT T1.school_name, T1.lowest_grade FROM schools AS T1 WHERE T1.state = 'CA' ORDER BY T1.latitude ASC LIMIT 1;	california_schools
SELECT grade_span FROM schools WHERE longitude = (SELECT MAX(ABS(longitude)) FROM schools) LIMIT 1;	california_schools
SELECT COUNT(T1.City), T1.City FROM `schools` AS T1 WHERE T1.Magnet = 1 AND T1.GradeSpan = 'K-8' AND T1.NSLP_Provision_Status = 'Multiple Provision Types' GROUP BY T1.City	california_schools
SELECT T1.administrator_first_name, T1.district FROM schools AS T1 WHERE T1.administrator_first_name IS NOT NULL GROUP BY T1.administrator_first_name ORDER BY COUNT(*) DESC LIMIT 2	california_schools
SELECT T1.District_Code, (T2.Free_Meal_Count_K_12 / T2.Enrollment_K_12 * 100) AS Percent_Eligible_Free FROM schools AS T1 JOIN school_details AS T2 ON T1.School_ID = T2.School_ID WHERE T1.Administrator_First_Name = 'Alusine'	california_schools
SELECT T1.County, T1.District, T2.AdministratorLastName FROM schools AS T1 JOIN administrators AS T2 ON T1.SchoolID = T2.SchoolID WHERE T1.CharterNumber = 40;	california_schools
SELECT admin_email FROM schools WHERE county = 'San Bernardino' AND city = 'San Bernardino City Unified' AND soc_code IN (62) AND doc_code = 54 AND open_date BETWEEN '2009-01-01' AND '2010-12-31';	california_schools
SELECT T1.admin_email FROM schools AS T1 JOIN test_scores AS T2 ON T1.school_id = T2.school_id WHERE T2.test_name = 'SAT' AND T2.score >= 1500 GROUP BY T1.school_name ORDER BY COUNT(*) DESC LIMIT 1, SELECT T1.school_name FROM schools AS T1 JOIN test_scores AS T2 ON T1.school_id = T2.school_id WHERE T2.test_name = 'SAT' AND T2.score >= 1500 GROUP BY T1.school_name ORDER BY COUNT(*) DESC LIMIT 1	california_schools
SELECT COUNT(*) FROM account AS T1 JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T2.type = 'POPLATEK PO OBRATU' AND T1.region = 'East Bohemia'	financial
SELECT COUNT(*) FROM account AS T1 JOIN customer AS T2 ON T1.customer_id = T2.customer_id WHERE T2.region = 'Prague' AND T1.eligible_for_loan = 1;	financial
SELECT AVG(T1.A12) AS UnemploymentRate1995 , AVG(T1.A13) AS UnemploymentRate1996 FROM unemployment AS T1 WHERE T1.year = 1995 OR T1.year = 1996; SELECT 'HigherPercentage' AS Result FROM (SELECT AVG(A12) AS AvgUnemployment1995 , AVG(A13) AS AvgUnemployment1996 FROM unemployment WHERE year IN(1995, 1996)) AS T2 WHERE T2.AvgUnemployment1995 < T2.AvgUnemployment1996 UNION SELECT 'LowerPercentage' AS Result FROM (SELECT AVG(A12) AS AvgUnemployment1995 , AVG(A13) AS AvgUnemployment1996 FROM unemployment WHERE year IN(1995, 1996)) AS T3 WHERE T3.AvgUnemployment1995 > T3.AvgUnemployment1996;	financial
SELECT COUNT(DISTINCT T1.district) FROM `account` AS T1 JOIN `trans` AS T2 ON T1.account_id = T2.account_id WHERE T1.gender = 'F' AND (T2.amount BETWEEN 6000 AND 10000)	financial
SELECT COUNT(*) FROM customer AS T1 JOIN account AS T2 ON T1.customer_id = T2.customer_id WHERE T1.gender = 'M' AND T1.region = 'A3' AND T2.average_salary > 8000;	financial
SELECT T1.account_number FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id WHERE T1.gender = 'F' AND T1.birth_date = (SELECT MIN(birth_date) FROM client WHERE gender = 'F') ORDER BY AVG(T2.salary) ASC LIMIT 1, (SELECT MAX(AVG(salary)) - MIN(AVG(salary)) FROM account GROUP BY account_number)	financial
SELECT T1.account_number FROM account AS T1 JOIN client AS T2 ON T1.client_id = T2.client_id WHERE T2.birthdate = (SELECT MIN(birthdate) FROM client) AND T1.account_id IN (SELECT account_id FROM salary GROUP BY account_id ORDER BY AVG(salary) DESC LIMIT 1)	financial
SELECT COUNT(*) FROM customer WHERE statement_issuance = 'POPLATEK TYDNE' AND type = 'Vlastnik'	financial
SELECT DISTINCT T1.client_id FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id JOIN `order` AS T3 ON T2.account_id = T3.account_id WHERE T3.statement = 'POPLATEK PO OBRATU' AND T3.type = 'DISPONENT'	financial
SELECT T1.account_id FROM `loan` AS T1 JOIN `account` AS T2 ON T1.account_id = T2.account_id WHERE STRFTIME('%Y', T1.approved_date) = '1997' AND T1.status = 'approved' ORDER BY T1.amount LIMIT 1	financial
SELECT T1.account_id FROM account AS T1 JOIN loan AS T2 ON T1.customer_id = T2.customer_id WHERE T2.duration > 12 AND T1.opening_date LIKE '1993%' ORDER BY T2.approved_amount DESC LIMIT 1;	financial
SELECT COUNT(*) FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id WHERE T1.gender = 'F' AND T1.birth_date < '1950-01-01' AND T1.district_code = 'Sokolov'	financial
SELECT account_id FROM trans WHERE date BETWEEN '1995-01-01' AND '1995-12-31' ORDER BY date LIMIT 1;	financial
SELECT account_id FROM account WHERE opening_date < '1997-01-01' AND amount > 3000;	financial
SELECT client_id FROM card WHERE valid_from = '1994-03-03'	financial
SELECT T1.date FROM account AS T1 JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T2.amount = 840 AND T2.date = '1998-10-14'	financial
SELECT T1.district_id FROM branch AS T1 JOIN loan AS T2 ON T1.branch_id = T2.branch_id WHERE T2.approved_date = '1994-08-25' AND T2.account_id IN (SELECT account_id FROM `order` WHERE order_id IN (SELECT order_id FROM trans))	financial
SELECT MAX(T2.amount) FROM card AS T1 JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T1.opened = '1996-10-21'	financial
SELECT T1.gender FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id WHERE T2.branch_id IN (SELECT branch_id FROM branch GROUP BY branch_id ORDER BY AVG(salary) DESC LIMIT 1) ORDER BY T1.birth_date ASC LIMIT 1	financial
SELECT T2.amount FROM account AS T1 JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T1.client_id = (SELECT client_id FROM loan GROUP BY client_id ORDER BY SUM(amount) DESC LIMIT 1) AND T2.date > T1.open_date ORDER BY T2.date ASC LIMIT 1	financial
SELECT COUNT(*) FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id WHERE T1.gender = 'F' AND T2.branch_id IN (SELECT branch_id FROM branch WHERE name = 'Jesenik')	financial
SELECT T1.disposition_id FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T3.amount = 5100 AND T3.date = '1998-09-02'	financial
SELECT COUNT(*) FROM account AS T1 JOIN branch AS T2 ON T1.branch_id = T2.branch_id WHERE T2.district = 'Litomerice' AND strftime('%Y', T1.open_date) = '1996'	financial
SELECT T2.district FROM client AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.gender = 'F' AND T1.birth_date = '1976-01-29'	financial
SELECT T1.birth FROM client AS T1 JOIN loan AS T2 ON T1.client_id = T2.client_id WHERE T2.amount = 98832 AND T2.date = '1996-01-03'	financial
SELECT account_id FROM client WHERE city = 'Prague' AND account_id IN (SELECT MIN(account_id) FROM account GROUP BY client_id) LIMIT 1	financial
SELECT CAST(SUM(CASE WHEN T2.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.client_id) FROM branch AS T1 JOIN client AS T2 ON T1.branch_id = T2.branch_id WHERE T1.region = 'A3' AND T1.inhabitants = (SELECT MAX(inhabitants) FROM branch WHERE region = 'A3')	financial
SELECT ((T1.balance - T2.balance) / T2.balance) * 100 AS increase_rate FROM (SELECT balance FROM trans WHERE date = '1998-12-27' AND account_id IN(SELECT account_id FROM loan WHERE approval_date = '1993-07-05') ORDER BY balance DESC LIMIT 1) T1, (SELECT balance FROM trans WHERE date = '1993-03-22' AND account_id IN(SELECT account_id FROM loan WHERE approval_date = '1993-07-05') ORDER BY balance ASC LIMIT 1) T2	financial
SELECT CAST(SUM(CASE WHEN T2.status = 'A' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM loan AS T1 JOIN contract AS T2 ON T1.contract_id = T2.contract_id WHERE T2.status = 'A'	financial
SELECT CAST(SUM(CASE WHEN T2.amount < 100000 AND T1.status = 'C' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.account_id) FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.currency_code = 'USD'	financial
SELECT T1.account_id, T2.district_name, T3.region FROM account AS T1 JOIN A2 AS T2 ON T1.district = T2.district_id JOIN A3 AS T3 ON T2.region_id = T3.region_id WHERE strftime('%Y', T1.open_date) = '1993' AND EXISTS (SELECT * FROM trans AS T4 WHERE T4.account_id = T1.account_id AND T4.type = 'POPLATEK PO OBRATU')	financial
SELECT T1.account_id, COUNT(T2.statement_issuance) FROM account AS T1 JOIN statement AS T2 ON T1.account_id = T2.account_id WHERE T1.region = 'east Bohemia' AND T2.date BETWEEN '1995-01-01' AND '2000-12-31' GROUP BY T1.account_id;	financial
SELECT account_id, opening_date FROM account WHERE city = 'Prachatice'	financial
SELECT T1.A2, T1.A3 FROM loan AS T1 JOIN customer AS T2 ON T1.cust_id = T2.cust_id WHERE T1.loan_id = '4990'	financial
SELECT T1.account_id, T2.district, T2.region FROM loan AS T1 JOIN A2 AS T2 ON T1.account_id = T2.account_id WHERE amount > 300000 AND currency_code = 'USD'	financial
SELECT T1.loan_id, T2.district, T3.A11 FROM loan AS T1 JOIN customer AS T2 ON T1.cust_id = T2.cust_id JOIN bank AS T3 ON T2.branch_id = T3.branch_id WHERE T1.duration = 60	financial
SELECT T1.district, ((T2.A13 - T2.A12) / T2.A12) * 100 AS unemployment_rate_increment FROM account AS T1 JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.status = 'D' AND T2.start_date <= '1995-01-01' AND T2.end_date >= '1996-12-31';	financial
SELECT CAST(SUM(CASE WHEN T2.district = 'Decin' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.account_id) FROM account AS T1 JOIN customer AS T2 ON T1.customer_id = T2.customer_id WHERE strftime('%Y', T1.open_date) = '1993'	financial
SELECT account_id FROM trans WHERE type = 'POPLATEK MESICNE' GROUP BY account_id;	financial
SELECT T2.A2 FROM account AS T1 JOIN client AS T2 ON T1.client_id = T2.client_id WHERE T2.gender = 'F' GROUP BY T2.A2 ORDER BY COUNT(T1.account_id) DESC LIMIT 9;	financial
SELECT T2.A2 FROM `trans` AS T1 JOIN `account` AS T2 ON T1.account_id = T2.account_id WHERE T1.type = 'VYDAJ' AND T1.date LIKE '1996-01%' ORDER BY T1.amount DESC LIMIT 10	financial
SELECT COUNT(*) FROM account AS T1 JOIN person AS T2 ON T1.person_id = T2.person_id WHERE T2.city = 'A3' AND NOT EXISTS (SELECT * FROM credit_card AS T3 WHERE T3.account_id = T1.account_id)	financial
SELECT A3 FROM loan WHERE status IN ('C', 'D') GROUP BY A3 ORDER BY COUNT(*) DESC LIMIT 1	financial
SELECT AVG(T2.amount) FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.gender = 'M' AND T1.type = 'LOAN'	financial
SELECT T1.branch_location, T2.A2 FROM branch AS T1 JOIN district AS T2 ON T1.district_id = T2.DISTRICT_ID WHERE T2.A13 IS NOT NULL ORDER BY T2.A13 DESC LIMIT 1;	financial
SELECT COUNT(*) FROM account WHERE branch_id = (SELECT T2.branch_id FROM crime AS T1 JOIN branch AS T2 ON T1.branch_id = T2.branch_id WHERE strftime('%Y', T1.date) = '1996' GROUP BY T2.branch_id ORDER BY COUNT(*) DESC LIMIT 1)	financial
SELECT COUNT(*) FROM (SELECT T1.account_id FROM trans AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.operation = 'VYBER KARTOU' AND T1.balance < 0 AND T2.frequency = 'POPLATEK MESICNE')	financial
SELECT COUNT(*) FROM `loan` AS L JOIN `account` AS A ON L.account_id = A.account_id WHERE L.date BETWEEN '1995-01-01' AND '1997-12-31' AND L.amount >= 250000 AND A.statement_issuance_frequency = 'POPLATEK MESICNE'	financial
SELECT COUNT(*) FROM account WHERE branch_id = 1 AND status IN ('C', 'D')	financial
SELECT COUNT(*) FROM client AS T1 JOIN branch AS T2 ON T1.branch_id = T2.branch_id WHERE T1.gender = 'M' AND T2.A15 = (SELECT A15 FROM branch WHERE A15 < (SELECT MAX(A15) FROM branch) ORDER BY A15 DESC LIMIT 1)	financial
SELECT COUNT(*) FROM card WHERE card_type = 'GOLD' AND disposition = 'OWNER'	financial
SELECT COUNT(*) FROM account WHERE A2 = 'Pisek'	financial
SELECT T1.district FROM account AS T1 JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T2.amount > 10000 AND strftime('%Y', T2.date) = '1997' GROUP BY T1.district HAVING COUNT(*) > 0	financial
SELECT T1.account_id FROM account AS T1 JOIN `order` AS T2 ON T1.account_id = T2.account_id WHERE T2.k_symbol = 'SIPO' AND T2.city = 'Pisek'	financial
SELECT account_id FROM card WHERE card_type = 'GOLD'	financial
SELECT AVG(T1.amount) FROM `trans` AS T1 JOIN `account` AS T2 ON T1.account_id = T2.account_id WHERE T1.type = 'VYBER' AND T1.date BETWEEN '2021-01-01' AND '2021-12-31' AND T2.card = 1 GROUP BY strftime('%m', T1.date)	financial
SELECT T1.account_id FROM `trans` AS T1 JOIN `account` AS T2 ON T1.account_id = T2.account_id WHERE T1.date BETWEEN '1998-01-01' AND '1998-12-31' AND T1.operation = 'VYBER KARTOU' AND T1.amount < (SELECT AVG(amount) FROM `trans` WHERE operation = 'VYBER KARTOU') GROUP BY T1.account_id	financial
SELECT T1.account_id FROM account AS T1 JOIN card AS T2 ON T1.account_id = T2.account_id WHERE T1.gender = 'F' AND T2.card_type = 'CREDIT' INTERSECT SELECT T3.account_id FROM loan AS T3 WHERE T3.gender = 'F'	financial
SELECT COUNT(*) FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id WHERE T1.gender = 'F' AND T1.region = 'A3'	financial
SELECT T1.account_id FROM account AS T1 JOIN customer AS T2 ON T1.customer_id = T2.customer_id WHERE T2.district = 'Tabor' AND T1.type = 'OWNER'	financial
SELECT T1.account_type FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.account_type != 'OWNER' AND T2.A11 BETWEEN 8000 AND 9000	financial
SELECT COUNT(*) FROM `account` AS T1 JOIN `trans` AS T2 ON T1.account_id = T2.account_id WHERE T1.region = 'North Bohemia' AND T2.bank = 'AB'	financial
SELECT DISTINCT T2.A2 FROM `trans` AS T1 JOIN `account` AS T2 ON T1.account_id = T2.account_id WHERE T1.type = 'VYDAJ'	financial
SELECT AVG(T3.crimes_1995) FROM account AS T1 JOIN region AS T2 ON T1.region_id = T2.region_id JOIN crime AS T3 ON T2.region_name = T3.region WHERE T1.opening_date >= '1997-01-01' AND T3.crimes_1995 > 4000	financial
SELECT COUNT(*) FROM card WHERE card_type = 'classic' AND account_id IN (SELECT account_id FROM account WHERE account_type = 'OWNER')	financial
SELECT COUNT(*) FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id WHERE T1.gender = 'M' AND T1.district = 'Hl.m. Praha'	financial
SELECT CAST(SUM(CASE WHEN T2.type = 'Gold' AND strftime('%Y', T1.date) < '1998' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.card_id) FROM trans AS T1 JOIN card AS T2 ON T1.account_id = T2.account_id WHERE T2.type = 'Gold';	financial
SELECT T1.client_id FROM account AS T1 JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.amount = (SELECT MAX(amount) FROM loan) LIMIT 1;	financial
SELECT COUNT(*) FROM A15 WHERE district = (SELECT T2.district FROM account AS T1 JOIN address AS T2 ON T1.address_id = T2.address_id WHERE T1.account_id = 532) AND year = 1995;	financial
SELECT T1.district_id FROM account AS T1 JOIN `order` AS T2 ON T1.account_id = T2.account_id WHERE T2.order_id = 33333;	financial
SELECT T2.trans_id FROM account AS T1 JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T1.client_id = 3356 AND T2.operation = 'VYBER'	financial
SELECT COUNT(*) FROM `account` AS T1 JOIN `loan` AS T2 ON T1.account_id = T2.account_id WHERE T1.frequency = 'POPLATEK TYDNE' AND T2.amount < 200000;	financial
SELECT credit_card_type FROM client WHERE client_id = 13539;	financial
SELECT T1.A3 FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id WHERE T2.account_id = 3541	financial
SELECT T3.district FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN customer AS T3 ON T2.customer_id = T3.customer_id WHERE T1.status = 'A' GROUP BY T3.district ORDER BY COUNT(T2.account_id) DESC LIMIT 1	financial
SELECT T1.first_name, T1.last_name FROM customer AS T1 JOIN `order` AS T2 ON T1.customer_id = T2.customer_id WHERE T2.order_id = 32423;	financial
SELECT T2.trans_id FROM account AS T1 JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T1.district = 5	financial
SELECT COUNT(*) FROM account WHERE district = 'Jesenik'	financial
SELECT client_id FROM credit_card WHERE date_issued >= '1997-01-01' AND card_type = 'junior'	financial
SELECT CAST(SUM(CASE WHEN T2.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.client_id) FROM account AS T1 JOIN client AS T2 ON T1.client_id = T2.client_id WHERE T1.district IN (SELECT district FROM A11 WHERE AVG_salary > 10000)	financial
SELECT ((SELECT SUM(T1.amount) FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE strftime('%Y', T1.date) = '1997' AND T2.gender = 'M') - (SELECT SUM(T1.amount) FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE strftime('%Y', T1.date) = '1996' AND T2.gender = 'M')) / (SELECT SUM(T1.amount) FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE strftime('%Y', T1.date) = '1996' AND T2.gender = 'M') * 100.0	financial
SELECT COUNT(*) FROM trans WHERE date > '1995-12-31' AND operation = 'VYBER KARTOU'	financial
SELECT (SELECT SUM(T1.A16) FROM `crime` AS T1 WHERE T1.A3 = 'North Bohemia') - (SELECT SUM(T1.A16) FROM `crime` AS T1 WHERE T1.A3 = 'East Bohemia') AS difference;	financial
SELECT COUNT(*) FROM `disposition` AS T1 JOIN `account` AS T2 ON T1.account_id = T2.account_id WHERE T2.account_number BETWEEN 1 AND 10 AND T1.disposition_type IN ('OWNER', 'DISPONENT')	financial
SELECT COUNT(*) FROM trans WHERE account_id = 3 AND type = 'VYDAJ' AND k_symbol = 'UCETNICKA PRO ULOZENI'; SELECT SUM(amount) FROM trans WHERE account_id = 3 AND amount = 3539;	financial
SELECT birth_year FROM person WHERE person_id = 130;	financial
SELECT COUNT(*) FROM account WHERE owner_disposition = 'DISPOZICE VLASTNIKA' AND statement_request = 'POPLATEK PO OBRATU'	financial
SELECT SUM(T2.amount) AS total_debt, (CASE WHEN T3.type = 'SIPO' THEN 'On track with payments' ELSE 'Behind on payments' END) AS payment_status FROM client AS T1 JOIN `order` AS T2 ON T1.client_id = T2.client_id JOIN trans AS T3 ON T2.order_id = T3.trans_id WHERE T1.client_id = 992 AND T2.type = 'DEBT';	financial
SELECT SUM(T3.amount), T1.sex FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T1.client_id = 4 AND T3.trans_id = 851 GROUP BY T1.sex	financial
SELECT credit_card FROM client WHERE client_id = 9;	financial
SELECT SUM(T2.amount) FROM account AS T1 JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T1.client_id = 617 AND strftime('%Y', T2.date) = '1998'	financial
SELECT T1.client_id FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id WHERE T1.birth BETWEEN '1983-01-01' AND '1987-12-31' AND T2.branch_id IN (SELECT branch_id FROM branch WHERE region = 'East Bohemia')	financial
SELECT T1.client_id FROM loan AS T1 JOIN client AS T2 ON T1.client_id = T2.client_id WHERE T2.gender = 'F' ORDER BY T1.amount DESC LIMIT 3;	financial
SELECT COUNT(*) FROM customer AS T1 JOIN `order` AS T2 ON T1.account_id = T2.account_id WHERE T1.gender = 'M' AND T1.birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND T2.amount > 4000 AND T2.type = 'SIPO'	financial
SELECT COUNT(*) FROM `account` WHERE city = 'Beroun' AND open_date > '1996-01-01';	financial
SELECT COUNT(*) FROM customer AS C WHERE C.gender = 'F' AND C.credit_card_type = 'junior'	financial
SELECT CAST(SUM(IIF(T1.gender = 'F', 1, 0)) AS REAL) * 100 / COUNT(*) FROM customer AS T1 JOIN account AS T2 ON T1.customer_id = T2.customer_id WHERE T2.branch_id IN (SELECT branch_id FROM branch WHERE city = 'Prague')	financial
SELECT CAST(SUM(IIF(T1.gender = 'M', 1, 0)) AS REAL) * 100 / COUNT(*) FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id WHERE T2.statement_issuance = 'POPLATEK TYDNE'	financial
SELECT COUNT(*) FROM client WHERE statement_frequency = 'POPLATEK TYDNE' AND type = 'Vlastnik'	financial
SELECT T1.account_id FROM account AS T1 JOIN loan AS T2 ON T1.customer_id = T2.customer_id WHERE T2.valid_since < '1997-01-01' AND T2.months > 24 ORDER BY T2.approved_amount ASC LIMIT 1	financial
SELECT T1.account_id FROM account AS T1 JOIN client AS T2 ON T1.client_id = T2.client_id WHERE T2.gender = 'F' AND T1.avg_salary IN (SELECT MIN(avg_salary) FROM account WHERE client_id IN (SELECT client_id FROM client WHERE gender = 'F')) ORDER BY T2.birth_date LIMIT 1	financial
SELECT COUNT(*) FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id WHERE T1.A3 = 'East Bohemia' AND strftime('%Y', T1.birth_date) = '1920'	financial
SELECT COUNT(*) FROM loan WHERE account_id IN (SELECT account_id FROM account WHERE type = 'POJISTENI') AND duration = 24 AND frequency = 'POPLATEK TYDNE'	financial
SELECT AVG(T2.amount) FROM `loan` AS T1 JOIN `trans` AS T2 ON T1.account_id = T2.account_id WHERE T1.status IN ('C', 'D') AND T2.type = 'POPLATEK PO OBRATU'	financial
SELECT client_id, district FROM client WHERE account_id IN (SELECT account_id FROM account WHERE permanent_order = 1 OR loan_application = 1)	financial
SELECT client.client_id, client.age FROM client JOIN account ON client.client_id = account.client_id JOIN card ON account.account_id = card.account_id JOIN disp ON account.account_id = disp.account_id WHERE card.type = 'gold' AND disp.type = 'OWNER'	financial
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY COUNT(*) DESC LIMIT 1	toxicology
SELECT COUNT(*) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '-' AND T1.element = 'cl'	toxicology
SELECT AVG(T1.element = 'o') FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T3.bond_id = T2.bond_id WHERE T3.bond_type = '-' GROUP BY T1.molecule_id	toxicology
SELECT COUNT(T1.atom_id) / COUNT(DISTINCT T2.molecule_id) AS average_single_bonded_carcinogenic_molecules FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id JOIN molecule AS T4 ON T3.molecule_id = T4.molecule_id WHERE T3.bond_type = '-' AND T4.label = '+'	toxicology
SELECT COUNT(*) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-' AND T2.element = 'na'	toxicology
SELECT T1.molecule_id FROM `molecule` AS T1 JOIN `bond` AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '#' AND T1.label = '+'	toxicology
SELECT CAST(SUM(CASE WHEN T1.element = 'c' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T3.bond_id = T2.bond_id WHERE T3.bond_type = '='	toxicology
SELECT COUNT(*) FROM `bond` WHERE `bond_type` = '#'	toxicology
SELECT COUNT(*) FROM `atom` WHERE element != 'br'	toxicology
SELECT COUNT(*) FROM `molecule` WHERE `label` = '+' AND `molecule_id` BETWEEN 'TR000' AND 'TR099' LIMIT 100;	toxicology
SELECT T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'c' GROUP BY T1.molecule_id	toxicology
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR004_8_9' UNION SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id2 WHERE T2.bond_id = 'TR004_8_9'	toxicology
SELECT T3.element FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T1.bond_type = '=' GROUP BY T3.element	toxicology
SELECT T4.label FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN molecule AS T4 ON T1.molecule_id = T4.molecule_id WHERE T1.element = 'h' GROUP BY T4.label ORDER BY COUNT(T4.label) DESC LIMIT 1	toxicology
SELECT T2.bond_type FROM atom AS T1 JOIN connected AS T3 ON T1.atom_id = T3.atom_id JOIN bond AS T2 ON T3.bond_id = T2.bond_id WHERE T1.element = 'cl'	toxicology
SELECT T1.atom_id, T3.atom_id2 FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-'	toxicology
SELECT T1.atom_id, T3.atom_id2 FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id JOIN connected AS T3 ON T1.atom_id = T3.atom_id WHERE T2.label = '-'	toxicology
SELECT T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '-' GROUP BY T1.element ORDER BY COUNT(T1.atom_id) LIMIT 1	toxicology
SELECT T2.bond_type FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE (T1.atom_id = 'TR004_8' AND T1.atom_id2 = 'TR004_20') OR (T1.atom_id = 'TR004_20' AND T1.atom_id2 = 'TR004_8')	toxicology
SELECT T4.label FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN molecule AS T4 ON T1.molecule_id = T4.molecule_id WHERE T1.element != 'sn' GROUP BY T4.label HAVING COUNT(*) = 0	toxicology
SELECT COUNT(DISTINCT T1.atom_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE (T1.element = 'i' OR T1.element = 's') AND T3.bond_type = '-'	toxicology
SELECT T1.atom_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T3.bond_id = T2.bond_id WHERE T3.bond_type = '#'	toxicology
SELECT T1.atom_id FROM `atom` AS T1 JOIN `connected` AS T2 ON T1.atom_id = T2.atom_id2 WHERE T2.atom_id IN (SELECT atom_id FROM `atom` WHERE molecule_id = 'TR181')	toxicology
SELECT CAST(SUM(CASE WHEN T1.element != 'f' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(DISTINCT T1.atom_id) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'	toxicology
SELECT CAST(SUM(CASE WHEN T2.bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_id) FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR000' ORDER BY element LIMIT 3	toxicology
SELECT T1.atom_id FROM `connected` AS T1 JOIN `atom` AS T2 ON T1.atom_id = T2.atom_id WHERE T2.molecule_id = 'TR001' AND T1.bond_id = 'TR001_2_6' UNION SELECT T1.atom_id2 FROM `connected` AS T1 JOIN `atom` AS T2 ON T1.atom_id2 = T2.atom_id WHERE T2.molecule_id = 'TR001' AND T1.bond_id = 'TR001_2_6'	toxicology
SELECT (SELECT COUNT(*) FROM molecule WHERE label = '+') - (SELECT COUNT(*) FROM molecule WHERE label = '-') AS difference;	toxicology
SELECT atom_id FROM connected WHERE bond_id = 'TR000_2_5' UNION SELECT atom_id2 FROM connected WHERE bond_id = 'TR000_2_5'	toxicology
SELECT bond_id FROM connected WHERE atom_id2 = 'TR000_2'	toxicology
SELECT T1.molecule_id FROM `molecule` AS T1 JOIN `bond` AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = ' =' ORDER BY T1.molecule_id LIMIT 5	toxicology
SELECT CAST(SUM(CASE WHEN T2.bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_id) FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR008' GROUP BY T1.molecule_id;	toxicology
SELECT CAST(SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(molecule_id) FROM molecule WHERE label IS NOT NULL	toxicology
SELECT ROUND(SUM(CASE WHEN T1.element = 'h' THEN 1 ELSE 0 END) * 100 / COUNT(T1.atom_id), 4) AS percent FROM atom AS T1 WHERE T1.molecule_id = 'TR206'	toxicology
SELECT T2.bond_type FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR000' GROUP BY T2.bond_type	toxicology
SELECT T1.element, T2.label FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR060'	toxicology
SELECT T2.bond_type FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR010' GROUP BY T2.bond_type ORDER BY COUNT(T2.bond_id) DESC LIMIT 1, T1.label FROM molecule AS T1 WHERE T1.molecule_id = 'TR010'	toxicology
SELECT T1.molecule_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-' AND T2.bond_type = '-' ORDER BY T1.molecule_id LIMIT 3	toxicology
SELECT bond_id FROM `bond` WHERE molecule_id = 'TR006' ORDER BY bond_id LIMIT 2;	toxicology
SELECT COUNT(*) FROM `connected` AS T1 JOIN `bond` AS T2 ON T1.bond_id = T2.bond_id WHERE (T1.atom_id = 'TR009_12' OR T1.atom_id2 = 'TR009_12') AND T2.molecule_id = 'TR009'	toxicology
SELECT COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.element = 'br'	toxicology
SELECT T2.bond_type, T1.atom_id, T3.atom_id2 FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id JOIN connected AS T3 ON T1.bond_id = T3.bond_id WHERE T1.bond_id = 'TR001_6_9'	toxicology
SELECT T1.molecule_id, T2.label FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR001_10'	toxicology
SELECT COUNT(*) FROM `bond` WHERE `bond_type` = '#'	toxicology
SELECT COUNT(T2.bond_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.atom_id LIKE 'TR%_19'	toxicology
SELECT T1.element FROM atom AS T1 WHERE T1.molecule_id = 'TR004'	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '-'	toxicology
SELECT DISTINCT T1.molecule_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE SUBSTR(T1.atom_id, 7, 2) BETWEEN '21' AND '25' AND EXISTS (SELECT * FROM molecule AS T3 WHERE T3.molecule_id = T1.molecule_id AND T3.label = '+')	toxicology
SELECT T3.bond_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'p' INTERSECT SELECT T3.bond_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'n'	toxicology
SELECT T1.molecule_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = ' =' GROUP BY T1.molecule_id ORDER BY COUNT(T2.bond_id) DESC LIMIT 1 INTERSECT SELECT T1.molecule_id FROM molecule AS T1 WHERE T1.label = '+'	toxicology
SELECT COUNT(T3.bond_id) / COUNT(DISTINCT T2.atom_id) AS average_bonds FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id2 JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'i'	toxicology
SELECT T2.bond_type, T2.bond_id FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE SUBSTR(T1.atom_id, 7, 2) + 0 = 45	toxicology
SELECT atom.element FROM atom WHERE atom.atom_id NOT IN (SELECT connected.atom_id FROM connected) AND atom.atom_id NOT IN (SELECT connected.atom_id2 FROM connected)	toxicology
SELECT T1.atom_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '#' AND T1.molecule_id = 'TR041'	toxicology
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR144_8_19'	toxicology
SELECT T1.molecule_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.bond_type = ' =' GROUP BY T1.molecule_id ORDER BY COUNT(T2.bond_id) DESC LIMIT 1	toxicology
SELECT T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' GROUP BY T1.element ORDER BY COUNT(T1.atom_id) ASC LIMIT 1	toxicology
SELECT T1.atom_id FROM atom AS T1 WHERE T1.element = 'pb' UNION SELECT T2.atom_id2 FROM connected AS T2 JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T3.element = 'pb' AND T2.atom_id != T2.atom_id2	toxicology
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '#'	toxicology
SELECT CAST(COUNT(T3.bond_id) AS REAL) * 100 / SUM(CNT) OVER () FROM (SELECT T1.atom_id, T1.element, COUNT(T2.bond_id) AS CNT FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id GROUP BY T1.atom_id, T1.element) AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.CNT = (SELECT MAX(CNT) FROM (SELECT COUNT(T2.bond_id) AS CNT FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id GROUP BY T1.atom_id, T1.element))	toxicology
SELECT CAST(SUM(CASE WHEN T4.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_id) FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T2.atom_id = T3.atom_id JOIN molecule AS T4 ON T3.molecule_id = T4.molecule_id WHERE T1.bond_type = '-'	toxicology
SELECT COUNT(*) FROM atom WHERE element IN ('c', 'h')	toxicology
SELECT T1.atom_id2 FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id2 = T2.atom_id WHERE T2.element = 's'	toxicology
SELECT T2.bond_type FROM atom AS T1 JOIN connected AS T3 ON T1.atom_id = T3.atom_id JOIN bond AS T2 ON T3.bond_id = T2.bond_id WHERE T1.element = 'sn'	toxicology
SELECT COUNT(DISTINCT T1.element) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-'	toxicology
SELECT COUNT(*) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '#' AND (T1.element = 'p' OR T1.element = 'br')	toxicology
SELECT T2.bond_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'	toxicology
SELECT T1.molecule_id FROM `molecule` AS T1 JOIN `bond` AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-' AND T1.label = '-' GROUP BY T1.molecule_id HAVING COUNT(*) = 1	toxicology
SELECT CAST(SUM(CASE WHEN T1.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id2 JOIN bond AS T3 ON T3.bond_id = T2.bond_id WHERE T3.bond_type = '-'	toxicology
SELECT T1.label FROM `molecule` AS T1 WHERE T1.molecule_id IN ('TR000', 'TR001', 'TR002')	toxicology
SELECT molecule_id FROM molecule WHERE label = '-'	toxicology
SELECT COUNT(T1.molecule_id) FROM molecule AS T1 WHERE T1.label = '+' AND T1.molecule_id BETWEEN 'TR000' AND 'TR030'	toxicology
SELECT T2.bond_type FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id BETWEEN 'TR000' AND 'TR050'	toxicology
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id2 WHERE T2.bond_id = 'TR001_10_11' UNION SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_10_11'	toxicology
SELECT COUNT(*) FROM `bond` AS T1 JOIN `connected` AS T2 ON T1.bond_id = T2.bond_id JOIN `atom` AS T3 ON T2.atom_id = T3.atom_id WHERE T3.element = 'i' OR (SELECT element FROM `atom` WHERE atom_id = T2.atom_id2) = 'i'	toxicology
SELECT T1.label FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'ca' GROUP BY T1.label ORDER BY COUNT(*) DESC LIMIT 1	toxicology
SELECT      CASE          WHEN (             SELECT COUNT(*)              FROM atom AS T1              JOIN connected AS T2 ON T1.atom_id = T2.atom_id              WHERE T2.bond_id = 'TR001_1_8' AND T1.element = 'cl'         ) > 0 AND (             SELECT COUNT(*)              FROM atom AS T1              JOIN connected AS T2 ON T1.atom_id = T2.atom_id              WHERE T2.bond_id = 'TR001_1_8' AND T1.element = 'c'         ) > 0 THEN 1          ELSE 0      END	toxicology
SELECT T1.molecule_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id JOIN atom AS T3 ON T1.molecule_id = T3.molecule_id WHERE T1.label = '-' AND T2.bond_type = '#' AND T3.element = 'c' LIMIT 2	toxicology
SELECT CAST(SUM(CASE WHEN T1.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'	toxicology
SELECT T1.element FROM atom AS T1 WHERE T1.molecule_id = 'TR001'	toxicology
SELECT T2.molecule_id FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T1.bond_type = ' = '	toxicology
SELECT T3.atom_id AS first_atom, T4.atom_id AS second_atom FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T2.atom_id = T3.atom_id JOIN atom AS T4 ON T2.atom_id2 = T4.atom_id WHERE T1.bond_type = '#'	toxicology
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR000_1_2'	toxicology
SELECT COUNT(*) FROM `bond` AS T1 JOIN `molecule` AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '-' AND T2.label = '-'	toxicology
SELECT T2.label FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_id = 'TR001_10_11'	toxicology
SELECT T2.bond_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '#' AND T1.label = '+' UNION SELECT T2.bond_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '#' AND T1.label = '-'	toxicology
SELECT A.element FROM atom AS A JOIN molecule AS M ON A.molecule_id = M.molecule_id WHERE SUBSTR(A.atom_id, 7, 1) = '4' AND M.label = '+'	toxicology
SELECT T1.label, COUNT(CASE WHEN T2.element = 'h' THEN 1 ELSE NULL END) * 1.0 / COUNT(T2.atom_id) AS ratio FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR006';	toxicology
SELECT T4.label FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN molecule AS T4 ON T1.molecule_id = T4.molecule_id WHERE T1.element = 'ca'	toxicology
SELECT T2.bond_type FROM atom AS T1 JOIN connected AS T3 ON T1.atom_id = T3.atom_id JOIN bond AS T2 ON T3.bond_id = T2.bond_id WHERE T1.element = 'c' GROUP BY T2.bond_type	toxicology
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_10_11' UNION SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id2 WHERE T2.bond_id = 'TR001_10_11'	toxicology
SELECT CAST(SUM(CASE WHEN T2.bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type IS NOT NULL;	toxicology
SELECT CAST(SUM(CASE WHEN T2.bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.bond_id) FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T1.molecule_id = 'TR047'	toxicology
SELECT T4.label FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN molecule AS T4 ON T1.molecule_id = T4.molecule_id WHERE T1.atom_id = 'TR001_1'	toxicology
SELECT T1.label FROM molecule AS T1 WHERE T1.molecule_id = 'TR151'	toxicology
SELECT T1.element FROM atom AS T1 WHERE T1.molecule_id = 'TR151' AND T1.element IN ('cl', 'br', 'pb', 'te')	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+'	toxicology
SELECT T1.atom_id FROM `atom` AS T1 JOIN `molecule` AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'c' AND SUBSTR(T2.molecule_id, 3, 3) >= 10 AND SUBSTR(T2.molecule_id, 3, 3) <= 50	toxicology
SELECT COUNT(T1.atom_id) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'	toxicology
SELECT T2.bond_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = ' =' AND T1.label = '+'	toxicology
SELECT COUNT(T1.atom_id) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'h' AND T2.label = '+'	toxicology
SELECT T2.molecule_id FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T1.bond_id = 'TR000_1_2' AND T2.atom_id = 'TR000_1'	toxicology
SELECT T1.atom_id FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'c' AND T2.label = '-'	toxicology
SELECT CAST(SUM(CASE WHEN T1.element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'	toxicology
SELECT T1.label FROM molecule AS T1 WHERE T1.molecule_id = 'TR124'	toxicology
SELECT T1.atom_id FROM atom AS T1 WHERE T1.molecule_id = 'TR186'	toxicology
SELECT T2.bond_type FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T1.atom_id = 'TR007_4' AND T1.atom_id2 = 'TR007_19'	toxicology
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id2 WHERE T2.bond_id = 'TR001_2_4' UNION SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_2_4'	toxicology
SELECT COUNT(T2.bond_id), T1.label FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = ' =' AND T1.molecule_id = 'TR006' AND T1.label = '+'	toxicology
SELECT T1.molecule_id, T2.element FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'	toxicology
SELECT T1.bond_id, T2.atom_id AS atom1, T3.atom_id AS atom2 FROM `bond` AS T1 JOIN `connected` AS T2 ON T1.bond_id = T2.bond_id JOIN `connected` AS T3 ON T1.bond_id = T3.bond_id WHERE T1.bond_type = '-' AND T2.atom_id < T3.atom_id	toxicology
SELECT T1.molecule_id, GROUP_CONCAT(T3.element) AS elements FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T2.atom_id2 = T3.atom_id WHERE T1.bond_type = '#' GROUP BY T1.molecule_id	toxicology
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR000_2_3' UNION SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id2 WHERE T2.bond_id = 'TR000_2_3'	toxicology
SELECT COUNT(*) FROM `bond` AS T1 JOIN `connected` AS T2 ON T1.bond_id = T2.bond_id JOIN `atom` AS T3 ON T2.atom_id = T3.atom_id WHERE T3.element = 'cl' UNION SELECT COUNT(*) FROM `bond` AS T1 JOIN `connected` AS T2 ON T1.bond_id = T2.bond_id JOIN `atom` AS T3 ON T2.atom_id2 = T3.atom_id WHERE T3.element = 'cl'	toxicology
SELECT T1.atom_id , COUNT(DISTINCT T3.bond_type) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.molecule_id = 'TR346' GROUP BY T1.atom_id	toxicology
SELECT COUNT(T1.molecule_id) AS total_molecules_with_double_bond, SUM(CASE WHEN T2.label = '+' THEN 1 ELSE 0 END) AS carcinogenic_molecules FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '=';	toxicology
SELECT COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id LEFT JOIN bond AS T3 ON T1.molecule_id = T3.molecule_id WHERE T2.element != 's' AND T3.bond_type != '=' OR T3.bond_type IS NULL	toxicology
SELECT T4.label FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T1.bond_id = T3.bond_id JOIN molecule AS T4 ON T3.molecule_id = T4.molecule_id WHERE T3.bond_id = 'TR001_2_4'	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR001'	toxicology
SELECT COUNT(*) FROM `bond` WHERE `bond_type` = '-'	toxicology
SELECT T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'cl' AND T1.label = '+'	toxicology
SELECT T1.molecule_id FROM `molecule` AS T1 JOIN `atom` AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'c' AND T1.label = '-'	toxicology
SELECT CAST(SUM(CASE WHEN T2.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'cl' AND T2.label = '+'	toxicology
SELECT T2.molecule_id FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T1.bond_id = 'TR001_1_7'	toxicology
SELECT COUNT(*) FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T1.bond_id = 'TR001_3_4'	toxicology
SELECT T2.bond_type FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T1.atom_id = 'TR000_1' AND T1.atom_id2 = 'TR000_2'	toxicology
SELECT T1.molecule_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE (T2.atom_id2 = 'TR000_4' AND T1.atom_id = 'TR000_2') OR (T2.atom_id2 = 'TR000_2' AND T1.atom_id = 'TR000_4')	toxicology
SELECT element FROM atom WHERE atom_id = 'TR000_1'	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR000'	toxicology
SELECT CAST(SUM(CASE WHEN T2.bond_type = '-' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) FROM atom AS T1 JOIN connected AS T3 ON T1.atom_id = T3.atom_id JOIN bond AS T2 ON T2.bond_id = T3.bond_id WHERE T2.bond_type IS NOT NULL	toxicology
SELECT COUNT(*) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.element = 'n'	toxicology
SELECT T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 's' AND EXISTS(SELECT 1 FROM bond AS T3 WHERE T3.bond_type = '=' AND T3.molecule_id = T2.molecule_id)	toxicology
SELECT T1.molecule_id FROM `molecule` AS T1 JOIN `atom` AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-' GROUP BY T1.molecule_id HAVING COUNT(T2.atom_id) > 5	toxicology
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T3.bond_id = T2.bond_id WHERE T3.bond_type = '=' AND T1.molecule_id = 'TR024'	toxicology
SELECT T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' GROUP BY T1.molecule_id ORDER BY COUNT(T2.atom_id) DESC LIMIT 1	toxicology
SELECT CAST(SUM(CASE WHEN T2.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id JOIN connected AS T3 ON T1.atom_id = T3.atom_id JOIN bond AS T4 ON T3.bond_id = T4.bond_id WHERE T1.element = 'h' AND T4.bond_type = '#'	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+'	toxicology
SELECT COUNT(*) FROM `bond` AS T1 JOIN `molecule` AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.molecule_id BETWEEN 'TR004' AND 'TR010' AND T1.bond_type = '-'	toxicology
SELECT COUNT(*) FROM atom AS T1 WHERE T1.molecule_id = 'TR008' AND T1.element = 'c'	toxicology
SELECT T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR004_7' AND T2.label = '-'	toxicology
SELECT COUNT(*) FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id JOIN atom AS T3 ON T1.molecule_id = T3.molecule_id WHERE T3.element = 'o' AND T2.bond_type = '='	toxicology
SELECT COUNT(*) FROM `molecule` AS T1 JOIN `bond` AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '#' AND T1.label = '-'	toxicology
SELECT T1.element, T3.bond_type FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.molecule_id = 'TR002'	toxicology
SELECT T1.atom_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T3.bond_id = T2.bond_id WHERE T1.element = 'c' AND T3.bond_type = '=' AND T1.molecule_id = 'TR012'	toxicology
SELECT T1.atom_id FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' AND T1.element = 'o'	toxicology
SELECT T1.id FROM `cards` AS T1 JOIN `card_kingdom` AS T2 ON T1.uuid = T2.cardKingdomId WHERE T2.cardKingdomFoilId IS NOT NULL AND T2.cardKingdomId IS NOT NULL	card_games
SELECT c.name FROM cards AS c WHERE c.borderColor = 'borderless' AND c.cardKingdomFoilId IS NULL OR c.cardKingdomId IS NULL	card_games
SELECT T1.name FROM cards AS T1 JOIN card_faces AS T2 ON T1.uuid = T2.card_uuid WHERE T2.convertedManaCost = (SELECT MAX(T3.convertedManaCost) FROM card_faces AS T3) ORDER BY T2.convertedManaCost DESC LIMIT 1	card_games
SELECT c.name FROM cards AS c JOIN cardedhrec AS cer ON c.uuid = cer.card_uuid WHERE c.frameVersion = '2015' AND cer.edhRecRank < 100 ORDER BY cer.edhRecRank ASC;	card_games
SELECT C.id FROM cards AS C JOIN card_banlist AS CB ON C.uuid = CB.card_uuid WHERE C.rarity = 'mythic' AND CB.format = 'gladiator' AND CB.status = 'Banned';	card_games
SELECT T1.legality FROM card_legality AS T1 JOIN cards AS T2 ON T1.card_id = T2.id WHERE T2.types LIKE '%Artifact%' AND T2.side IS NULL AND T1.format = 'vintage'	card_games
SELECT T1.id, T1.artist FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE (T1.power = '*' OR T1.power IS NULL) AND T1.format = 'commander' AND T2.status = 'Legal' GROUP BY T1.id, T1.artist;	card_games
SELECT C.uuid, R.text, C.hasContentWarning FROM cards AS C JOIN rulings AS R ON C.uuid = R.uuid WHERE C.artist = 'Stephen Daniele'	card_games
SELECT T2.text FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Sublime Epiphany' AND T1.number = '74s'	card_games
SELECT C.name, A.name, C.isPromo FROM cards AS C JOIN rulings AS R ON C.uuid = R.uuid JOIN card_art AS CA ON C.id = CA.card_id JOIN artists AS A ON CA.artist_id = A.id WHERE C.isPromo = 1 GROUP BY C.uuid ORDER BY COUNT(R.id) DESC LIMIT 1	card_games
SELECT T2.language FROM `cards` AS T1 JOIN `card_translations` AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Annul' AND T1.number = '29'	card_games
SELECT T1.name FROM cards AS T1 JOIN set_translations AS T2 ON T1.set_id = T2.set_id WHERE T2.language = 'Japanese' GROUP BY T1.name	card_games
SELECT CAST(SUM(CASE WHEN T2.language = 'Chinese Simplified' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM cards AS T1 JOIN set_translations AS T2 ON T1.set_id = T2.set_id WHERE T2.language = 'Chinese Simplified';	card_games
SELECT T1.setName, COUNT(T2.id) AS totalSetSize FROM sets AS T1 JOIN cards AS T2 ON T1.code = T2.set WHERE T1.name IN (SELECT setName FROM set_translations WHERE language = 'Italian') GROUP BY T1.code	card_games
SELECT COUNT(DISTINCT card_type) FROM cards WHERE artist = 'Aaron Boyd'	card_games
SELECT T1.keywords FROM cards AS T1 JOIN card_keywords AS T2 ON T1.uuid = T2.card_uuid WHERE T1.name = 'Angel of Mercy' GROUP BY T1.keywords;	card_games
SELECT COUNT(*) FROM cards WHERE power = '*'	card_games
SELECT T2.promoTypes FROM cards AS T1 JOIN printings AS T2 ON T1.uuid = T2.card_uuid WHERE T1.name = 'Duress' GROUP BY T2.promoTypes;	card_games
SELECT T1.border FROM cards AS T1 JOIN card_translations AS T2 ON T1.id = T2.card_id WHERE T2.name = 'Ancestor''s Chosen' AND T2.language = 'English';	card_games
SELECT originalType FROM cards WHERE name = 'Ancestor\'s Chosen' LIMIT 1;	card_games
SELECT T3.language FROM cards AS T1 JOIN sets AS T2 ON T1.set_id = T2.id JOIN set_translations AS T3 ON T2.id = T3.set_id WHERE T1.name = 'Angel of Mercy' GROUP BY T3.language	card_games
SELECT COUNT(*) FROM `cards` WHERE `legalities`.`status` = 'restricted' AND `is_textless` = 0;	card_games
SELECT T2.text FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Condemn'	card_games
SELECT COUNT(*) FROM legalities WHERE status = 'restricted' AND isStarter = 1;	card_games
SELECT status FROM cards WHERE name = 'Cloudchaser Eagle' LIMIT 1;	card_games
SELECT type_line FROM cards WHERE name = 'Benalish Knight' LIMIT 1;	card_games
SELECT Rulings.text FROM Rulings JOIN Cards ON Rulings.uuid = Cards.uuid WHERE Cards.name = 'Benalish Knight'	card_games
SELECT DISTINCT T2.artist FROM cards AS T1 JOIN card_art AS T2 ON T1.id = T2.card_id WHERE T1.set_name = 'Phyrexian'	card_games
SELECT CAST(SUM(CASE WHEN borderColor = 'borderless' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards WHERE borderColor IS NOT NULL;	card_games
SELECT COUNT(*) FROM set_translations AS ST JOIN cards AS C ON ST.set_code = C.set WHERE ST.language = 'German' AND C.isReprint = 1;	card_games
SELECT COUNT(*) FROM cards AS C JOIN card_translations AS CT ON C.uuid = CT.card_uuid WHERE borderColor = 'borderless' AND language = 'Russian';	card_games
SELECT CAST(SUM(CASE WHEN T2.language = 'French' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM cards AS T1 JOIN card_translations AS T2 ON T1.uuid = T2.uuid WHERE T1.isStorySpotlight = 1	card_games
SELECT COUNT(*) FROM cards WHERE toughness = 99;	card_games
SELECT c.name FROM cards AS c JOIN illustrations AS i ON c.uuid = i.card_uuid WHERE i.artist = 'Aaron Boyd'	card_games
SELECT COUNT(*) FROM `cards` WHERE `borderColor` = 'black' AND `availability` = 'mtgo';	card_games
SELECT uuid FROM cards WHERE convertedManaCost = 0;	card_games
SELECT DISTINCT T1.layout FROM cards AS T1 INNER JOIN card_keywords AS T2 ON T1.uuid = T2.card_uuid WHERE T2.keyword = 'Flying'	card_games
SELECT COUNT(*) FROM `cards` WHERE `original_types` = 'Summon - Angel' AND `subtypes` != 'Angel';	card_games
SELECT cardKingdomFoilId FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT id FROM cards WHERE duelDeck = 'a'	card_games
SELECT edhrec_rank FROM cards WHERE frame = '2015' ORDER BY edhrec_rank ASC LIMIT 1000000000000000000;	card_games
SELECT T2.artist FROM set_translations AS T1 JOIN cards AS T2 ON T1.set_code = T2.set_code WHERE T1.language = 'Chinese Simplified' GROUP BY T2.artist	card_games
SELECT T1.name FROM cards AS T1 JOIN set_translations AS T2 ON T1.set_id = T2.set_id WHERE T2.language = 'Japanese' AND T1.availability = 'paper' GROUP BY T1.uuid HAVING COUNT(T2.id) = 1	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND status = 'Banned';	card_games
SELECT C.uuid, FD.language FROM cards AS C JOIN foreign_data AS FD ON C.uuid = FD.uuid WHERE C.format = 'legacy' AND FD.language != 'English' GROUP BY C.uuid, FD.language ORDER BY FD.language;	card_games
SELECT text FROM rulings WHERE uuid = '56f4935b-f6c5-59b9-88bf-9bcce20247ce'	card_games
SELECT COUNT(T1.id), T1.status FROM card_legality AS T1 INNER JOIN cards AS T2 ON T1.cardId = T2.id WHERE T2.frameVersion = 'future' AND T1.status = 'legal' GROUP BY T1.status;	card_games
SELECT T1.name, T1.color_identity FROM cards AS T1 JOIN sets AS T2 ON T1.set = T2.code WHERE T2.code = 'OGW'	card_games
SELECT T1.name, T2.language FROM cards AS T1 JOIN card_translations AS T2 ON T1.uuid = T2.uuid WHERE T1.convertedManaCost = 5 AND T1.setCode = '10E' GROUP BY T2.language;	card_games
SELECT T1.name, T2.date FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.originalType = 'Creature - Elf'	card_games
SELECT T1.colors, T1.frame FROM cards AS T1 JOIN card_faces AS T2 ON T1.uuid = T2.uuid WHERE T1.id BETWEEN 1 AND 20 GROUP BY T1.colors, T1.frame ORDER BY T1.frame;	card_games
SELECT C.name FROM cards AS C JOIN card_translations AS CT ON C.uuid = CT.uuid WHERE C.originalType = 'Artifact' AND C.colors = 'B' AND CT.language IN ('French', 'German', 'Italian', 'Spanish', 'Chinese Simplified', 'Chinese Traditional') GROUP BY C.name	card_games
SELECT C.name FROM cards AS C JOIN rulings AS R ON C.uuid = R.uuid WHERE C.rarity = 'uncommon' ORDER BY R.date ASC LIMIT 3	card_games
SELECT COUNT(*) FROM `cards` AS C JOIN `card_faces` AS CF ON C.uuid = CF.card_uuid WHERE C.artist = 'John Avon' AND C.cardKingdomId IS NOT NULL AND C.cardKingdomFoilId IS NOT NULL GROUP BY C.uuid HAVING SUM(CF.power) = 0	card_games
SELECT COUNT(*) FROM `cards` WHERE `borderColor` = 'white' AND `cardKingdomFoilId` IS NOT NULL AND `cardKingdomId` IS NOT NULL	card_games
SELECT COUNT(*) FROM `cards` WHERE `artist` = 'UDON' AND `availability` = 'mtgo' AND `hand` = -1;	card_games
SELECT COUNT(*) FROM `cards` WHERE frameVersion = '1993' AND availability = 'paper' AND hasContentWarning = 1;	card_games
SELECT manaCost FROM cards WHERE layout = 'normal' AND frameVersion = '2003' AND borderColor = 'black' AND availability = 'mtgo,paper'	card_games
SELECT SUM(T1.manaCost) FROM `cards` AS T1 INNER JOIN `illustrators` AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Rob Alexander' AND T1.manaCost IS NOT NULL	card_games
SELECT DISTINCT card_types FROM cards WHERE availability = 'arena' UNION SELECT DISTINCT super_types FROM cards WHERE availability = 'arena';	card_games
SELECT T1.setCode FROM `cards` AS T1 JOIN `set_translations` AS T2 ON T1.setCode = T2.setCode WHERE T2.language = 'Spanish' GROUP BY T1.setCode	card_games
SELECT CAST(SUM(T1.isOnlineOnly) AS REAL) * 100 / COUNT(T1.id) FROM `cards` AS T1 WHERE T1.frameEffects = 'legendary'	card_games
SELECT CAST(SUM(CASE WHEN isStorylight = 1 AND isTextless = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(id), id FROM cards WHERE isStorylight = 1 AND isTextless = 0 GROUP BY id	card_games
SELECT T1.name, (COUNT(T2.id) * 100 / SUM(T2.id)) AS percentage FROM cards AS T1 JOIN set_translations AS T2 ON T1.set_id = T2.set_id WHERE T2.language = 'Spanish' GROUP BY T1.name	card_games
SELECT T2.language FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.baseSetSize = 309 GROUP BY T2.language	card_games
SELECT COUNT(*) FROM `set_translations` WHERE language = 'Portuguese (Brasil)' AND code IN(SELECT code FROM sets WHERE block = 'Commander')	card_games
SELECT c.id FROM cards AS c JOIN card_types AS ct ON c.id = ct.card_id WHERE ct.type_name = 'Creature' AND c.status = 'legal' ORDER BY c.id;	card_games
SELECT T2.name FROM `set_translations` AS T1 JOIN `cards` AS T2 ON T1.set = T2.set WHERE T1.language = 'German' AND T2.subtype IS NOT NULL AND T2.supertype IS NOT NULL GROUP BY T2.name	card_games
SELECT COUNT(*) FROM `cards` WHERE power IS NULL OR power = '*' AND text LIKE '%triggered ability%'	card_games
SELECT COUNT(*) FROM `cards` AS C WHERE C.format = 'premodern' AND EXISTS(SELECT * FROM `rulings` AS R WHERE C.uuid = R.uuid AND R.text = 'This is a triggered mana ability.') AND C.side IS NULL;	card_games
SELECT T1.id FROM cards AS T1 JOIN card_art_details AS T2 ON T1.card_art_id = T2.id WHERE T2.artist_name = 'Erica Yang' AND T1.format = 'pauper' AND T1.availability = 'paper' LIMIT 1;	card_games
SELECT T1.artist FROM cards AS T1 JOIN card_translations AS T2 ON T1.id = T2.card_id WHERE T2.text = 'Das perfekte Gegenmittel zu einer dichten Formation' AND T2.language = 'German' LIMIT 1;	card_games
SELECT T2.name FROM cards AS T1 JOIN card_translations AS T2 ON T1.uuid = T2.uuid WHERE T1.type = 'Creature' AND T1.layout = 'normal' AND T1.borderColor = 'black' AND T2.language = 'French' AND T2.artist = 'Matthew D. Wilson'	card_games
SELECT COUNT(*) FROM `rulings` WHERE `date` = '2007-02-01' AND `uuid` IN (SELECT `uuid` FROM `cards` WHERE `rarity` = 'rare')	card_games
SELECT T2.language FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.set_code WHERE T1.baseSetSize = 180 AND T1.block = 'Ravnica' GROUP BY T2.language LIMIT 1;	card_games
SELECT CAST(SUM(CASE WHEN C.hasContentWarning = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(C.id) FROM cards AS C WHERE EXISTS(SELECT 1 FROM card_legality AS CL WHERE CL.cardId = C.id AND CL.format = 'commander' AND CL.status = 'legal')	card_games
SELECT CAST(SUM(CASE WHEN T2.language = 'French' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.power) FROM cards AS T1 JOIN card_translations AS T2 ON T1.uuid = T2.uuid WHERE T1.power IS NULL OR T1.power = '*'	card_games
SELECT CAST(SUM(CASE WHEN T2.type = 'expansion' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.id) FROM set_translations AS T1 JOIN sets AS T2 ON T1.set_id = T2.id WHERE T1.language = 'Japanese';	card_games
SELECT T1.availability FROM cards AS T1 JOIN card_art AS T2 ON T1.uuid = T2.card_uuid WHERE T2.artist = 'Daren Bader'	card_games
SELECT COUNT(*) FROM `cards` WHERE `borderColor` = 'borderless' AND `colors` IS NOT NULL AND `edhrecRank` > 12000;	card_games
SELECT COUNT(*) FROM cards WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1;	card_games
SELECT name FROM cards WHERE power = '*' AND promoTypes LIKE '%arenaleague%' ORDER BY name LIMIT 3;	card_games
SELECT T2.language FROM cards AS T1 JOIN card_translations AS T2 ON T1.uuid = T2.uuid WHERE T1.multiverseid = 149934;	card_games
SELECT T1.cardKingdomFoilId FROM cards AS T1 JOIN card_kingdoms AS T2 ON T1.id = T2.cardId WHERE T1.cardKingdomFoilId IS NOT NULL AND T2.kingdomId IS NOT NULL ORDER BY T1.cardKingdomFoilId LIMIT 3	card_games
SELECT CAST(SUM(CASE WHEN isTextless = 1 AND layout = 'normal' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards WHERE layout = 'normal'	card_games
SELECT c.number FROM cards AS c WHERE c.side IS NULL AND c.subtypes LIKE '%Angel%' AND c.subtypes LIKE '%Wizard%'	card_games
SELECT T1.name FROM `sets` AS T1 WHERE T1.mtgoCode IS NULL OR T1.mtgoCode = '' ORDER BY T1.name LIMIT 3	card_games
SELECT T2.language FROM sets AS T1 JOIN set_translations AS T2 ON T1.id = T2.set_id WHERE T1.mcmName = 'Archenemy' AND T1.setCode = 'ARC' GROUP BY T2.language	card_games
SELECT name, translation FROM set_translations WHERE id = 5;	card_games
SELECT T2.language, T1.expansion_type FROM sets AS T1 JOIN set_translations AS T2 ON T1.id = T2.set_id WHERE T1.id = 206	card_games
SELECT T1.set_id FROM sets AS T1 JOIN set_translations AS T2 ON T1.id = T2.set_id WHERE T2.language = 'Italian' AND T1.block = 'Shadowmoor' ORDER BY T1.name LIMIT 2;	card_games
SELECT set_id FROM `set_translations` WHERE language = 'Japanese' AND isFoilOnly = 1 AND isForeignOnly = 1;	card_games
SELECT set_id FROM sets WHERE language = 'Russian' ORDER BY baseSetSize DESC LIMIT 1;	card_games
SELECT CAST(SUM(CASE WHEN T2.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.uuid) FROM cards AS T1 JOIN sets AS T2 ON T1.set_id = T2.id JOIN set_translations AS T3 ON T2.id = T3.set_id WHERE T3.language = 'Chinese Simplified' AND T3.name = '10E';	card_games
SELECT COUNT(*) FROM set_translations WHERE language = 'Japanese' AND NOT EXISTS(SELECT * FROM set_translations AS T2 WHERE T2.setCode = T1.setCode AND T2.mtgoCode IS NOT NULL)	card_games
SELECT id FROM cards WHERE borderColor = 'black'	card_games
SELECT id FROM cards WHERE frameEffects = 'extendedart'	card_games
SELECT id FROM cards WHERE borderColor = 'black' AND isFullArt = 1;	card_games
SELECT T2.language FROM sets AS T1 JOIN set_translations AS T2 ON T1.id = T2.set_id WHERE T1.id = 174	card_games
SELECT T2.name FROM set_translations AS T2 WHERE T2.set_code = 'ALL' GROUP BY T2.name LIMIT 1	card_games
SELECT T2.language FROM cards AS T1 JOIN card_translations AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'A Pedra Fellwar' GROUP BY T2.language LIMIT 1;	card_games
SELECT set_code FROM sets WHERE release_date = '2007-07-13' LIMIT 1;	card_games
SELECT T1.baseSetSize, T1.code FROM sets AS T1 JOIN set_translations AS T2 ON T1.id = T2.set_id WHERE T2.name IN ('Masques', 'Mirage') AND T2.language = 'English' GROUP BY T1.baseSetSize, T1.code HAVING COUNT(T2.name) = 2	card_games
SELECT setCode FROM sets WHERE setType = 'expansion'	card_games
SELECT T2.name, T1.type_line FROM cards AS T1 JOIN card_translations AS T2 ON T1.id = T2.card_id WHERE T1.watermark = 'boros' AND T2.language_id = 1 GROUP BY T2.name, T1.type_line LIMIT 1	card_games
SELECT T1.lang, T1.flavor_text, T2.type_line FROM card_translations AS T1 JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.color_identity_watermark = 'W' AND T1.lang = 'English' GROUP BY T1.lang, T1.flavor_text, T2.type_line LIMIT 1	card_games
SELECT CAST(SUM(CASE WHEN T2.convertedManaCost = 10 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.convertedManaCost) FROM cards AS T1 JOIN card_sets AS T2 ON T1.set_id = T2.id WHERE T1.name = 'Abyssal Horror' AND T2.convertedManaCost IS NOT NULL;	card_games
SELECT setCode FROM sets WHERE setType = 'expansion' AND name LIKE '%Commander%'	card_games
SELECT T2.name, T1.type_line FROM cards AS T1 JOIN card_translations AS T2 ON T1.id = T2.card_id WHERE T1.watermark = 'abzan' AND T2.language_id = 1 GROUP BY T2.name, T1.type_line LIMIT 1	card_games
SELECT T1.type FROM cards AS T1 JOIN card_faces AS T2 ON T1.uuid = T2.uuid WHERE T2.watermark = 'azorius' GROUP BY T1.type	card_games
SELECT COUNT(*) FROM `cards` WHERE artist = 'Aaron Miller' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM `cards` WHERE availability LIKE '%paper%' AND hand = '3'	card_games
SELECT name FROM cards WHERE isTextless = 0;	card_games
SELECT unconverted_mana_cost FROM cards WHERE name = 'Ancestor`s Chosen'	card_games
SELECT COUNT(*) FROM cards WHERE border_color = 'white' AND (power = '*' OR power IS NULL)	card_games
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL GROUP BY name HAVING COUNT(*) > 1;	card_games
SELECT subtypes, supertypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer'	card_games
SELECT T1.purchaseUrls FROM card_purchases AS T1 JOIN cards AS T2 ON T1.cardId = T2.id WHERE T2.promoTypes = 'bundle'	card_games
SELECT COUNT(T1.artist) FROM cards AS T1 JOIN card_printings AS T2 ON T1.uuid = T2.card_uuid WHERE T1.border_color = 'black' AND T2.printing_type IN ('arena', 'mtgo') GROUP BY T1.artist HAVING COUNT(DISTINCT T2.printing_type) > 1	card_games
SELECT name FROM cards WHERE name IN ('Serra Angel', 'Shrine Keeper') AND convertedManaCost = (SELECT MAX(convertedManaCost) FROM cards WHERE name IN ('Serra Angel', 'Shrine Keeper')) LIMIT 1;	card_games
SELECT T1.artist FROM cards AS T1 JOIN card_translations AS T2 ON T1.name = T2.name WHERE T2.flavorName = 'Battra, Dark Destroyer' AND T2.language = 'English';	card_games
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3;	card_games
SELECT T2.name FROM cards AS T1 JOIN set_translations AS T2 ON T1.set_id = T2.set_id WHERE T1.name = 'Ancestor''s Chosen' AND T2.language = 'Italian'	card_games
SELECT COUNT(*) FROM set_translations WHERE set_code IN (SELECT set_code FROM cards WHERE name = 'Angel of Mercy')	card_games
SELECT C.name FROM cards AS C JOIN sets AS S ON C.set_id = S.id JOIN set_translations AS ST ON S.id = ST.set_id WHERE ST.translation = 'Hauptset Zehnte Edition'	card_games
SELECT EXISTS(SELECT * FROM set_translations WHERE name = 'Ancestor's Chosen' AND language = 'Korean') AS Has_Korean_Version;	card_games
SELECT COUNT(*) FROM `cards` AS C JOIN `set_translations` AS ST ON C.set_id = ST.id WHERE ST.text = 'Hauptset Zehnte Edition' AND C.artist = 'Adam Rex'	card_games
SELECT T1.baseSetSize FROM `set` AS T1 JOIN `set_translations` AS T2 ON T1.code = T2.set_code WHERE T2.translation = 'Hauptset Zehnte Edition'	card_games
SELECT T2.translation FROM sets AS T1 JOIN set_translations AS T2 ON T1.id = T2.set_id WHERE T1.name = 'Eighth Edition' AND T2.language = 'Chinese Simplified'	card_games
SELECT EXISTS(SELECT 1 FROM cards AS C JOIN sets AS S ON C.set = S.code WHERE C.name = 'Angel of Mercy' AND S.mtgoCode IS NOT NULL) AS appearedOnline	card_games
SELECT T2.releaseDate FROM `cards` AS T1 JOIN `sets` AS T2 ON T1.set = T2.code WHERE T1.name = 'Ancestor''s Chosen'	card_games
SELECT T1.type FROM `set_translations` AS T1 WHERE T1.name = 'Hauptset Zehnte Edition'	card_games
SELECT COUNT(*) FROM `set_translations` WHERE `block` = 'Ice Age' AND `language` = 'Italian' AND `translation` IS NOT NULL;	card_games
SELECT EXISTS(SELECT 1 FROM cards AS C JOIN sets AS S ON C.set_id = S.id WHERE C.name = 'Adarkar Valkyrie' AND S.is_foreign_only = 1) AS isForeignOnly;	card_games
SELECT COUNT(*) FROM set_translations WHERE baseSetSize < 100 AND language = 'Italian'	card_games
SELECT COUNT(*) FROM cards WHERE setCode = 'CSP' AND borderColor = 'black'	card_games
SELECT name FROM cards WHERE set_name = 'Coldsnap' ORDER BY converted_mana_cost DESC LIMIT 1;	card_games
SELECT DISTINCT artist FROM `cards` WHERE set_name = 'Coldsnap' AND artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy')	card_games
SELECT T1.name FROM cards AS T1 JOIN sets AS T2 ON T1.set_id = T2.id WHERE T2.name = 'Coldsnap' AND T1.number = 4;	card_games
SELECT COUNT(*) FROM `cards` AS T1 JOIN `sets` AS T2 ON T1.set_id = T2.id WHERE T2.name = 'Coldsnap' AND (T1.power = '*' OR T1.power IS NULL) AND T1.convertedManaCost > 5	card_games
SELECT T2.flavorText FROM `cards` AS T1 JOIN `card_translations` AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Ancestor''s Chosen' AND T2.language = 'Italian'	card_games
SELECT DISTINCT T2.language FROM cards AS T1 JOIN card_translations AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Ancestor''s Chosen' AND T2.flavorText IS NOT NULL;	card_games
SELECT T2.German FROM cards AS T1 JOIN card_translations AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Ancestor''s Chosen' AND T2.language = 'German'	card_games
SELECT T4.text FROM `cards` AS T1 JOIN `set_translations` AS T2 ON T1.set_id = T2.id JOIN `rulings` AS T3 ON T1.uuid = T3.uuid JOIN `rulings` AS T4 ON T3.id = T4.id WHERE T2.name = 'Coldsnap' AND T2.language = 'Italian'	card_games
SELECT T2.name FROM cards AS T1 JOIN card_translations AS T2 ON T1.id = T2.card_id WHERE T1.set_id IN (SELECT id FROM sets WHERE name = 'Coldsnap') AND T2.language = 'Italian' ORDER BY T1.convertedManaCost DESC LIMIT 1	card_games
SELECT date FROM rulings WHERE uuid IN (SELECT uuid FROM cards WHERE name = 'Reminisce')	card_games
SELECT CAST(SUM(CASE WHEN C.convertedManaCost = 7 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS C JOIN sets AS S ON C.set_id = S.id WHERE S.name = 'Coldsnap'	card_games
SELECT CAST(SUM(CASE WHEN T2.cardKingdomFoilId IS NOT NULL AND T2.cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM cards AS T1 JOIN card_translations AS T2 ON T1.id = T2.cardId WHERE T2.name = 'Coldsnap' AND T2.language = 'English';	card_games
SELECT code FROM sets WHERE releaseDate = '2017-07-14'	card_games
SELECT keyruneCode FROM sets WHERE code = 'PKHC'	card_games
SELECT mcmId FROM sets WHERE code = 'SS2'	card_games
SELECT T1.mcmName FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.releaseDate = '2017-06-09' AND T2.language = 'English' LIMIT 1	card_games
SELECT type FROM sets WHERE name = 'From the Vault: Lore'	card_games
SELECT parent_code FROM sets WHERE name = 'Commander 2014 Oversized'	card_games
SELECT C.name, R.text, CASE WHEN C.hasContentWarning = 1 THEN 'Yes' ELSE 'No' END AS hasMissingOrDegradedProperties FROM cards AS C JOIN rulings AS R ON C.uuid = R.uuid WHERE C.artist = 'Jim Pavelec' ORDER BY C.name;	card_games
SELECT T2.releaseDate FROM `cards` AS T1 JOIN `sets` AS T2 ON T1.set = T2.code WHERE T1.name = 'Evacuation'	card_games
SELECT T1.baseSetSize FROM `sets` AS T1 JOIN `set_translations` AS T2 ON T1.code = T2.set_code WHERE T2.translation = 'Rinascita di Alara'	card_games
SELECT T1.type FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.set_code WHERE T2.translation = 'Huitième édition' GROUP BY T1.type;	card_games
SELECT T2.name FROM cards AS T1 JOIN set_translations AS T2 ON T1.set = T2.code WHERE T1.name = 'Tendo Ice Bridge' AND T2.language = 'French'	card_games
SELECT COUNT(*) FROM `set_translations` WHERE `name` = 'Tenth Edition' AND `translation` IS NOT NULL;	card_games
SELECT T2.name FROM cards AS T1 JOIN set_translations AS T2 ON T1.set_id = T2.id WHERE T1.name = 'Fellwar Stone' AND T2.language = 'Japanese'	card_games
SELECT card_name FROM cards WHERE set_name = 'Journey into Nyx Hero's Path' ORDER BY converted_mana_cost DESC LIMIT 1;	card_games
SELECT T1.release_date FROM `sets` AS T1 JOIN `set_translations` AS T2 ON T1.code = T2.set_code WHERE T2.translation = 'Ola de frío'	card_games
SELECT T2.type FROM cards AS T1 JOIN sets AS T2 ON T1.set_id = T2.id WHERE T1.name = 'Samite Pilgrim'	card_games
SELECT COUNT(*) FROM `cards` AS C JOIN `sets` AS S ON C.set_id = S.id WHERE S.name = 'World Championship Decks 2004' AND C.cmc = 3;	card_games
SELECT T2.name FROM set_translations AS T2 WHERE T2.set_code = 'MRD' AND T2.language = 'Chinese Simplified'	card_games
SELECT CAST(SUM(CASE WHEN isNonFoilOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM `cards` WHERE EXISTS(SELECT 1 FROM `set_translations` WHERE `cards`.`set_id` = `set_translations`.`set_id` AND `set_translations`.`language` = 'Japanese')	card_games
SELECT CAST(SUM(T2.isOnlineOnly) AS REAL) * 100 / COUNT(T1.uuid) FROM card_translations AS T1 JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.language = 'Portuguese (Brazil)'	card_games
SELECT DISTINCT T1.type FROM card_printings AS T1 JOIN cards AS T2 ON T1.card_id = T2.id WHERE T2.artist != 'Aleksi Briclot' AND T2.isTextless = 1	card_games
SELECT id FROM sets ORDER BY baseSetSize DESC LIMIT 1;	card_games
SELECT T1.artist FROM cards AS T1 JOIN card_faces AS T2 ON T1.uuid = T2.uuid WHERE T2.side IS NULL ORDER BY T1.converted_mana_cost DESC LIMIT 1	card_games
SELECT frame_effects FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL GROUP BY frame_effects ORDER BY COUNT(*) DESC LIMIT 1	card_games
SELECT COUNT(*) FROM `cards` WHERE `power` IS NULL OR `power` = '*' AND `hasFoil` = 0 AND `duelDeck` = 'a'	card_games
SELECT set_id FROM sets WHERE type = 'commander' AND totalSetSize IS NOT NULL ORDER BY totalSetSize DESC LIMIT 1	card_games
SELECT T1.name FROM cards AS T1 JOIN card_sets AS T2 ON T1.set = T2.code WHERE T2.format = 'duel' AND T1.manaCost IS NOT NULL ORDER BY SUBSTR(T1.manaCost, 2) DESC LIMIT 10	card_games
SELECT T1.originalReleaseDate, T2.format FROM `cards` AS T1 JOIN `legalities` AS T2 ON T1.uuid = T2.card_uuid WHERE T1.rarity = 'mythic' AND T2.status = 'legal' ORDER BY T1.originalReleaseDate LIMIT 1	card_games
SELECT COUNT(*) FROM `cards` AS C JOIN `card_translations` AS CT ON C.uuid = CT.uuid WHERE C.artist = 'Volkan Baǵa' AND CT.language = 'French'	card_games
SELECT COUNT(*) FROM `cards` AS T1 JOIN `card_details` AS T2 ON T1.uuid = T2.card_uuid WHERE T1.name = 'Abundance' AND T2.rarity = 'rare' AND T2.types LIKE '%Enchantment%' AND T1.status = 'Legal'	card_games
SELECT T1.format, GROUP_CONCAT(T2.name) FROM (SELECT format, COUNT(*) AS banned_count FROM card_bans WHERE status = 'Banned' GROUP BY format ORDER BY banned_count DESC LIMIT 1) AS T1 JOIN card_bans AS T2 ON T1.format = T2.format AND T2.status = 'Banned' GROUP BY T1.format	card_games
SELECT language FROM set_translations WHERE name = 'Battlebond' LIMIT 1;	card_games
SELECT T2.format FROM cards AS T1 JOIN card_formats AS T2 ON T1.id = T2.card_id WHERE T1.artist IN (SELECT artist FROM cards GROUP BY artist ORDER BY COUNT(*) ASC LIMIT 1)	card_games
SELECT C.status FROM cards AS C WHERE C.frameVersion = '1997' AND C.artist = 'D. Alexander Gregory' AND (C.hasContentWarning = 1 OR C.printedBy = 'Wizards of the Coast') AND C.format = 'legacy'	card_games
SELECT C.name, CF.format FROM cards AS C JOIN card_formats AS CF ON C.uuid = CF.card_uuid WHERE C.edhrec_rank = 1 AND CF.status = 'Banned'	card_games
SELECT AVG(T1.id), T2.language FROM sets AS T1 JOIN set_translations AS T2 ON T1.id = T2.set_id WHERE T1.releaseDate BETWEEN '2012-01-01' AND '2015-12-31' GROUP BY T2.language ORDER BY COUNT(T2.language) DESC LIMIT 1	card_games
SELECT DISTINCT T1.artist FROM cards AS T1 JOIN card_sets AS T2 ON T1.set_id = T2.id WHERE T1.border_color = 'black' AND T2.availability = 'arena'	card_games
SELECT uuid FROM cards WHERE EXISTS (SELECT * FROM formats WHERE cards.uuid = formats.uuid AND format = 'oldschool' AND (status = 'banned' OR status = 'restricted'))	card_games
SELECT COUNT(*) FROM `cards` WHERE artist = 'Matthew D. Wilson' AND availability = 'paper';	card_games
SELECT T2.text FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Kev Walker' ORDER BY T2.date DESC	card_games
SELECT DISTINCT C.name, F.format FROM cards AS C JOIN card_legality AS CL ON C.uuid = CL.card_uuid JOIN formats AS F ON CL.format_id = F.id WHERE C.set_id IN (SELECT S.id FROM sets AS S WHERE S.name = 'Hour of Devastation') AND CL.status = 'Legal' ORDER BY C.name, F.format	card_games
SELECT name FROM `set_translations` WHERE language = 'Korean' EXCEPT SELECT name FROM `set_translations` WHERE language = 'Japanese' GROUP BY name	card_games
SELECT C.frameVersion, C.name, B.cardName FROM cards AS C LEFT JOIN bans AS B ON C.uuid = B.cardId WHERE C.artist = 'Allen Williams' AND B.status = 'Banned' OR B.status IS NULL ORDER BY C.frameVersion, C.name, B.cardName;	card_games
SELECT U1.Id FROM users AS U1 WHERE U1.DisplayName = 'Harlan' UNION SELECT U2.Id FROM users AS U2 WHERE U2.DisplayName = 'Jarrod Dixon' ORDER BY Reputation DESC LIMIT 1	codebase_community
SELECT DisplayName FROM users WHERE YEAR(CreationDate) = 2011;	codebase_community
SELECT COUNT(*) FROM users WHERE LastAccessDate > '2014-09-01'	codebase_community
SELECT U.DisplayName FROM Users AS U WHERE U.Views = (SELECT MAX(U2.Views) FROM Users AS U2) LIMIT 1;	codebase_community
SELECT COUNT(*) FROM users WHERE UpVotes > 100 AND DownVotes > 1;	codebase_community
SELECT COUNT(*) FROM users WHERE Views > 10 AND YEAR(CreationDate) > 2013;	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')	codebase_community
SELECT T1.Title FROM Posts AS T1 INNER JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie' AND T1.PostTypeId = 1;	codebase_community
SELECT T1.DisplayName FROM users AS T1 JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T2.Title = 'Eliciting priors from experts'	codebase_community
SELECT p.Title FROM posts AS p JOIN users AS u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' ORDER BY p.ViewCount DESC LIMIT 1;	codebase_community
SELECT U.DisplayName FROM Users AS U JOIN Posts AS P ON U.Id = P.OwnerUserId WHERE P.FavoriteCount = (SELECT MAX(FavoriteCount) FROM Posts) LIMIT 1	codebase_community
SELECT SUM(T2.CommentCount) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName = 'csgillespie'	codebase_community
SELECT MAX(T2.AnswerCount) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName = 'csgillespie'	codebase_community
SELECT U.DisplayName FROM Posts AS P JOIN Users AS U ON P.LastEditorUserId = U.Id WHERE P.Title = 'Examples for teaching: Correlation does not mean causation'	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie') AND ParentId IS NULL;	codebase_community
SELECT U.DisplayName FROM Users AS U JOIN Posts AS P ON U.Id = P.OwnerUserId WHERE P.ClosedDate IS NOT NULL	codebase_community
SELECT COUNT(T1.Id) FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.Age > 65 AND T1.Score >= 20;	codebase_community
SELECT T2.Location FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Title = 'Eliciting priors from experts'	codebase_community
SELECT P.Body FROM Posts AS P JOIN PostTags AS PT ON P.Id = PT.PostId WHERE PT.TagId = (SELECT T.Id FROM Tags AS T WHERE T.TagName = 'bayesian') LIMIT 1;	codebase_community
SELECT T1.Body FROM Posts AS T1 JOIN Tags AS T2 ON T1.Id = T2.ExcerptPostId WHERE T2.TagName = (SELECT TagName FROM Tags GROUP BY TagName ORDER BY COUNT(*) DESC LIMIT 1)	codebase_community
SELECT COUNT(*) FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')	codebase_community
SELECT B.Name FROM Badges AS B JOIN Users AS U ON B.UserId = U.Id WHERE U.DisplayName = 'csgillespie'	codebase_community
SELECT COUNT(*) FROM badges WHERE YEAR(Date) = 2011 AND UserId IN (SELECT Id FROM users WHERE DisplayName = 'csgillespie')	codebase_community
SELECT U.DisplayName FROM Users AS U JOIN Badges AS B ON U.Id = B.UserId GROUP BY B.UserId ORDER BY COUNT(B.Id) DESC LIMIT 1	codebase_community
SELECT AVG(T1.Score) FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie' AND T1.PostTypeId = 1	codebase_community
SELECT AVG(T2.Num) AS AverageBadges FROM users AS T1 JOIN (SELECT UserId, COUNT(*) AS Num FROM Badges GROUP BY UserId) AS T2 ON T1.Id = T2.UserId WHERE T1.Views > 200;	codebase_community
SELECT COUNT(T1.Id) AS total_posts, SUM(CASE WHEN T2.Age > 65 THEN 1 ELSE 0 END) AS elder_posts, (SUM(CASE WHEN T2.Age > 65 THEN 1 ELSE 0 END) / COUNT(T1.Id)) * 100 AS percentage_elder FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Score > 5;	codebase_community
SELECT COUNT(*) FROM votes WHERE UserId = 58 AND CreationDate = '2010-07-19'	codebase_community
SELECT CreationDate FROM votes WHERE CreationDate IN (SELECT MAX(CreationDate) FROM votes GROUP BY CreationDate ORDER BY COUNT(Id) DESC LIMIT 1)	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = 'Revival'	codebase_community
SELECT T1.Title FROM Posts AS T1 JOIN Comments AS T2 ON T1.Id = T2.PostId WHERE T2.Score = (SELECT MAX(Score) FROM Comments) LIMIT 1;	codebase_community
SELECT COUNT(*) FROM Comments AS C WHERE C.PostId IN (SELECT P.Id FROM Posts AS P WHERE P.ViewCount = 1910)	codebase_community
SELECT COUNT(*) AS favorite_count FROM posts WHERE Id = (SELECT PostId FROM comments WHERE UserId = '3025' AND CreationDate = '2014-04-23 20:29:39') AND FavoriteCount IS NOT NULL	codebase_community
SELECT T1.Text FROM Comments AS T1 WHERE T1.PostId = 107829 AND T1.CommentCount = '1'	codebase_community
SELECT p.Id, p.CreationDate, p.ClosedDate FROM posts AS p JOIN comments AS c ON p.Id = c.PostId WHERE c.UserId = '23853' AND c.CreationDate = '2013-07-12 09:08:18.0' AND p.ClosedDate IS NULL	codebase_community
SELECT U.Reputation FROM users AS U WHERE U.Id = (SELECT P.OwnerUserId FROM posts AS P WHERE P.Id = 65041)	codebase_community
SELECT COUNT(T1.Id) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'Tiago Pasqualini'	codebase_community
SELECT U.DisplayName FROM `votes` AS V JOIN `users` AS U ON V.UserId = U.Id WHERE V.Id = 6347;	codebase_community
SELECT COUNT(*) FROM votes WHERE PostId IN (SELECT Id FROM posts WHERE Title LIKE '%data visualization%')	codebase_community
SELECT B.Name FROM Badges AS B JOIN Users AS U ON B.UserId = U.Id WHERE U.DisplayName = 'DatEpicCoderGuyWhoPrograms'	codebase_community
SELECT COUNT(T1.Id) / COUNT(T2.Id) AS Times FROM Posts AS T1 JOIN Votes AS T2 ON T1.OwnerUserId = '24' AND T2.UserId = '24';	codebase_community
SELECT ViewCount FROM Posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer'	codebase_community
SELECT Text FROM Comments WHERE Score = 17;	codebase_community
SELECT DisplayName FROM users WHERE WebsiteUrl = 'http://stackoverflow.com' LIMIT 1;	codebase_community
SELECT B.Name FROM users AS U JOIN badges AS B ON U.Id = B.UserId WHERE U.DisplayName = 'SilentGhost' LIMIT 1	codebase_community
SELECT U.DisplayName FROM Users AS U JOIN Comments AS C ON U.Id = C.UserId WHERE C.Text = 'thank you user93!' LIMIT 1	codebase_community
SELECT C.Text FROM Comments AS C WHERE C.UserId = (SELECT U.Id FROM Users AS U WHERE U.DisplayName = 'A Lion')	codebase_community
SELECT T1.DisplayName, T2.Reputation FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T2.Title = 'Understanding what Dassault iSight is doing?'	codebase_community
SELECT C.Text FROM Comments AS C JOIN Posts AS P ON C.PostId = P.Id WHERE P.Title = 'How does gentle boosting differ from AdaBoost?'	codebase_community
SELECT u.DisplayName FROM users AS u JOIN badges AS b ON u.Id = b.UserId WHERE b.Name = 'Necromancer' LIMIT 10;	codebase_community
SELECT T2.DisplayName FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Title = 'Open source tools for visualizing multi-dimensional data?'	codebase_community
SELECT p.Title FROM posts AS p JOIN users AS u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Vebjorn Ljosa'	codebase_community
SELECT SUM(T1.Score), T2.WebsiteUrl FROM Posts AS T1 JOIN Users AS T2 ON T1.LastEditorUserId = T2.Id WHERE T2.DisplayName = 'Yevgeny' GROUP BY T2.WebsiteUrl;	codebase_community
SELECT C.Id, C.Text FROM Comments AS C JOIN Posts AS P ON C.PostId = P.Id WHERE P.Title = 'Why square the difference instead of taking the absolute value in standard deviation?' AND EXISTS (SELECT * FROM PostHistory AS PH WHERE PH.PostId = P.Id AND PH.PostHistoryTypeId = 5)	codebase_community
SELECT SUM(T2.BountyAmount) FROM Posts AS T1 JOIN Votes AS T2 ON T1.Id = T2.PostId WHERE T1.Title LIKE '%data%' GROUP BY T1.Id	codebase_community
SELECT U.DisplayName FROM users AS U JOIN votes AS V ON U.Id = V.UserId JOIN posts AS P ON V.PostId = P.Id WHERE V.BountyAmount = 50 AND P.Title LIKE '%variance%'	codebase_community
SELECT T1.Title, T1.ViewCount, T3.Text FROM Posts AS T1 JOIN PostTags AS T2 ON T1.Id = T2.PostId JOIN Tags AS T3 ON T2.TagId = T3.Id WHERE T3.TagName = '<humor>' GROUP BY T1.Id, T1.Title, T1.ViewCount, T3.Text ORDER BY AVG(T1.ViewCount) ASC	codebase_community
SELECT COUNT(*) FROM Comments WHERE UserId = 13;	codebase_community
SELECT UserId FROM users ORDER BY Reputation DESC LIMIT 1;	codebase_community
SELECT UserId FROM posts WHERE PostTypeId = 2 GROUP BY UserId ORDER BY SUM(ViewCount) ASC LIMIT 1	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = 'Supporter' AND YEAR(Date) = 2011;	codebase_community
SELECT COUNT(*) FROM (SELECT UserId, COUNT(Name) AS badge_count FROM Badges GROUP BY UserId HAVING badge_count > 5) AS T1;	codebase_community
SELECT COUNT(*) FROM users AS U WHERE U.Location LIKE '%New York%' AND EXISTS (SELECT * FROM badges AS B1 WHERE B1.UserId = U.Id AND B1.Name = 'Supporter') AND EXISTS (SELECT * FROM badges AS B2 WHERE B2.UserId = U.Id AND B2.Name = 'Teacher')	codebase_community
SELECT U.Id, U.Reputation FROM users AS U WHERE U.Id = (SELECT P.OwnerUserId FROM posts AS P WHERE P.Id = 1)	codebase_community
SELECT U.Id AS UserId FROM users U JOIN posts P ON U.Id = P.UserId WHERE P.ViewCount >= 1000 GROUP BY U.Id HAVING COUNT(DISTINCT P.Id) = (SELECT COUNT(*) FROM posthistory PH WHERE PH.PostId IN (SELECT Id FROM posts WHERE UserId = U.Id)) AND COUNT(DISTINCT P.Id) > 1	codebase_community
SELECT U.Id, COUNT(C.Id) AS CommentCount, GROUP_CONCAT(B.Name) AS Badges FROM Users AS U JOIN Comments AS C ON U.Id = C.UserId JOIN Badges AS B ON U.Id = B.UserId GROUP BY U.Id ORDER BY CommentCount DESC LIMIT 1	codebase_community
SELECT COUNT(*) FROM users AS U INNER JOIN badges AS B ON U.Id = B.UserId WHERE B.Name = 'Teacher' AND U.Location LIKE '%India%'	codebase_community
SELECT (CAST(COUNT(CASE WHEN YEAR(T1.Date) = 2010 THEN T1.Id ELSE NULL END) AS REAL) / COUNT(T1.Id) * 100 - CAST(COUNT(CASE WHEN YEAR(T1.Date) = 2011 THEN T1.Id ELSE NULL END) AS REAL) / COUNT(T1.Id) * 100) AS PercentageDifference FROM Badges AS T1 WHERE T1.Name = 'Student' AND (YEAR(T1.Date) = 2010 OR YEAR(T1.Date) = 2011)	codebase_community
SELECT COUNT(DISTINCT T2.OwnerUserId) FROM `posts` AS T1 INNER JOIN `comments` AS T2 ON T1.Id = T2.PostId WHERE T1.Id = 3720 AND T2.CommentTypeId = 2; SELECT DISTINCT T3.PostHistoryTypeId FROM `posthistory` AS T3 WHERE T3.PostId = 3720;	codebase_community
SELECT T1.Id, T1.ViewCount FROM posts AS T1 INNER JOIN postlinks AS T2 ON T1.Id = T2.PostId WHERE T2.RelatedPostId = 61217;	codebase_community
SELECT Score, LinkTypeId FROM Posts WHERE Id = 395;	codebase_community
SELECT PostId, UserId FROM (SELECT P.Id AS PostId, U.Id AS UserId FROM Posts AS P JOIN Users AS U ON P.OwnerUserId = U.Id WHERE P.Score > 60)	codebase_community
SELECT SUM(T1.FavoriteCount) FROM Posts AS T1 INNER JOIN Votes AS T2 ON T1.Id = T2.PostId WHERE T2.UserId = 686 AND YEAR(T2.CreationDate) = 2011;	codebase_community
SELECT AVG(T1.UpVotes), AVG(T2.Age) FROM (SELECT UserId, COUNT(*) AS PostCount, SUM(CASE WHEN VoteTypeId = 2 THEN 1 ELSE 0 END) AS UpVotes FROM votes JOIN posts ON votes.PostId = posts.Id WHERE NOT UserId IS NULL GROUP BY UserId) AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.PostCount > 10	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = 'Announcer'	codebase_community
SELECT B.Name FROM Badges AS B WHERE B.Date = '2010-07-19 19:39:08.0'	codebase_community
SELECT COUNT(*) FROM `comments` WHERE Score > 60;	codebase_community
SELECT Text FROM Comments WHERE CreationDate = '2010-07-19 19:25:47.0'	codebase_community
SELECT COUNT(Id) FROM posts WHERE Score = 10;	codebase_community
SELECT B.Name FROM ( SELECT UserId, MAX(Reputation) AS MaxRep FROM users GROUP BY UserId ORDER BY MaxRep DESC LIMIT 1 ) AS U JOIN badges AS B ON U.UserId = B.UserId	codebase_community
SELECT U.Reputation FROM Users AS U JOIN Badges AS B ON U.Id = B.UserId WHERE B.Date = '2010-07-19 19:39:08.0'	codebase_community
SELECT B.Name FROM Badges AS B JOIN Users AS U ON B.UserId = U.Id WHERE U.DisplayName = 'Pierre'	codebase_community
SELECT V.CreationDate FROM votes AS V INNER JOIN users AS U ON V.UserId = U.Id WHERE U.Location = 'Rochester, NY'	codebase_community
SELECT (COUNT(T1.UserId) * 100.0 / (SELECT COUNT(*) FROM users)) AS Percentage FROM badges AS T1 WHERE T1.Name = 'Teacher'	codebase_community
SELECT CAST(SUM(CASE WHEN Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM (SELECT U.Id, U.Age FROM Users U INNER JOIN Badges B ON U.Id = B.UserId WHERE B.Name = 'Organizer')	codebase_community
SELECT SUM(V.BountyAmount) AS CommentRatingScore FROM votes V INNER JOIN posts P ON V.PostId = P.Id WHERE P.CreationDate = '2010-07-19 19:19:56.0' GROUP BY V.PostId;	codebase_community
SELECT Text FROM Comments WHERE CreationDate = '2010-07-19 19:37:33.0'	codebase_community
SELECT u.Age FROM users AS u WHERE u.Location = 'Vienna, Austria' AND EXISTS (SELECT * FROM badges AS b WHERE b.UserId = u.Id)	codebase_community
SELECT COUNT(*) FROM (SELECT U.Id FROM Users AS U JOIN Badges AS B ON U.Id = B.UserId WHERE B.Name = 'Supporter' AND U.Age BETWEEN 19 AND 65) AS T1	codebase_community
SELECT U.Views FROM Users AS U JOIN Badges AS B ON U.Id = B.UserId WHERE B.Date = '2010-07-19 19:39:08.0'	codebase_community
SELECT B.Name FROM ( SELECT U.Id, MIN(U.Reputation) AS MinRep FROM Users U GROUP BY U.Id ) AS T1 JOIN Badges B ON T1.Id = B.UserId WHERE T1.MinRep = ( SELECT MIN(Reputation) FROM Users )	codebase_community
SELECT B.Name FROM Badges AS B JOIN Users AS U ON B.UserId = U.Id WHERE U.DisplayName = 'Sharpie' LIMIT 1;	codebase_community
SELECT COUNT(*) FROM (SELECT U.Id FROM Users AS U INNER JOIN Badges AS B ON U.Id = B.UserId WHERE B.Name = 'Supporter' AND U.Age > 65 GROUP BY U.Id) AS T1	codebase_community
SELECT DisplayName FROM users WHERE Id = 30;	codebase_community
SELECT COUNT(*) FROM users WHERE Location = 'New York, NY'	codebase_community
SELECT COUNT(*) FROM votes WHERE YEAR(CreationDate) = 2010;	codebase_community
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT U.Id, U.DisplayName FROM users AS U ORDER BY U.Views DESC LIMIT 1;	codebase_community
SELECT CAST(COUNT(T1.Id) AS REAL) / (SELECT COUNT(Id) FROM votes WHERE STRFTIME('%Y', CreationDate) = '2011') AS Ratio FROM votes T1 WHERE STRFTIME('%Y', T1.CreationDate) = '2010'	codebase_community
SELECT T3.TagName FROM users AS T1 JOIN posts AS T2 ON T1.Id = T2.OwnerUserId JOIN posttags AS T4 ON T2.Id = T4.PostId JOIN tags AS T3 ON T4.TagId = T3.Id WHERE T1.DisplayName = 'John Salvatier' GROUP BY T3.TagName	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Daniel Vassallo')	codebase_community
SELECT COUNT(*) FROM votes WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Harlan')	codebase_community
SELECT P.Id FROM Posts AS P JOIN Users AS U ON P.OwnerUserId = U.Id WHERE U.DisplayName = 'slashnick' ORDER BY AnswerCount DESC LIMIT 1;	codebase_community
SELECT MAX(T1.ViewCount) AS MaxViewCount FROM Posts AS T1 INNER JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName IN ('Harvey Motulsky', 'Noah Snyder') AND T1.ViewCount IS NOT NULL ORDER BY T1.ViewCount DESC LIMIT 1	codebase_community
SELECT COUNT(*) FROM (SELECT PostId FROM votes WHERE PostId IN (SELECT Id FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Matt Parker')) GROUP BY PostId HAVING COUNT(*) > 4) AS T1	codebase_community
SELECT COUNT(*) FROM Posts AS P JOIN Comments AS C ON P.Id = C.PostId WHERE P.OwnerUserId = (SELECT Id FROM Users WHERE DisplayName = 'Neil McGuigan') AND C.Score < 60;	codebase_community
SELECT T4.TagName FROM `posts` AS T1 INNER JOIN `posttags` AS T2 ON T1.Id = T2.PostId INNER JOIN `tags` AS T4 ON T2.TagId = T4.Id WHERE T1.CommentCount = 0 AND T1.OwnerUserId IN (SELECT Id FROM `users` WHERE DisplayName = 'Mark Meckes') GROUP BY T4.TagName	codebase_community
SELECT DISTINCT U.DisplayName FROM Users AS U JOIN Badges AS B ON U.Id = B.UserId WHERE B.Name = 'Organizer'	codebase_community
SELECT CAST(SUM(CASE WHEN T2.TagName = 'r' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.Id) FROM posts AS T1 JOIN posttags AS T3 ON T1.Id = T3.PostId JOIN tags AS T2 ON T2.Id = T3.TagId WHERE T1.OwnerUserId IN (SELECT Id FROM users WHERE DisplayName = 'Community')	codebase_community
SELECT SUM(T1.ViewCount) - (SELECT SUM(T1.ViewCount) FROM `posts` AS T1 INNER JOIN `users` AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'Amos') AS ViewDifference FROM `posts` AS T1 INNER JOIN `users` AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'Mornington'	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = 'Commentator' AND YEAR(Date) = 2014;	codebase_community
SELECT COUNT(*) FROM posts WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59';	codebase_community
SELECT T1.DisplayName, T1.Age FROM users AS T1 WHERE T1.Views = (SELECT MAX(Views) FROM users) LIMIT 1;	codebase_community
SELECT p.LastEditDate, p.LastEditorUserId FROM posts p WHERE p.Title = 'Detecting a given face in a database of facial images' LIMIT 1;	codebase_community
SELECT COUNT(*) FROM Comments WHERE UserId = 13 AND Score < 60;	codebase_community
SELECT P.Title, U.DisplayName FROM Posts AS P JOIN Comments AS C ON P.Id = C.PostId JOIN Users AS U ON C.UserId = U.Id WHERE C.Score > 60 AND P.PostTypeId = 1 GROUP BY P.Title, U.DisplayName;	codebase_community
SELECT B.Name FROM `badges` AS B WHERE B.UserId = (SELECT U.Id FROM `users` AS U WHERE U.Location LIKE '%North Pole%') AND YEAR(B.Date) = 2011;	codebase_community
SELECT T1.DisplayName, T1.WebsiteUrl FROM Users AS T1 INNER JOIN Posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T2.FavoriteCount > 150;	codebase_community
SELECT COUNT(T1.PostHistoryTypeId), MAX(T1.CreationDate) FROM Posts AS T1 JOIN PostHistory AS T2 ON T1.Id = T2.PostId WHERE T1.Title = 'What is the best introductory Bayesian statistics textbook?' AND T2.PostHistoryTypeId IN (4, 5, 6, 7, 8, 9) GROUP BY T1.Id	codebase_community
SELECT U.LastAccessDate, U.Location FROM users AS U WHERE EXISTS (SELECT * FROM badges AS B WHERE B.UserId = U.Id AND B.Name = 'Outliers')	codebase_community
SELECT T1.Title FROM Posts AS T1 WHERE T1.Id = (SELECT T2.PostId FROM Votes AS T2 WHERE T2.VoteTypeId = 2 AND T2.CreationDate = '2010-07-19' LIMIT 1) AND T1.Title LIKE '%How to tell if something happened in a data set which monitors a value over time%'	codebase_community
SELECT P.Id AS PostId, B.Name AS BadgeName FROM Posts AS P JOIN Users AS U ON P.OwnerUserId = U.Id JOIN Badges AS B ON U.Id = B.UserId WHERE U.DisplayName = 'Samuel' AND YEAR(P.CreationDate) = 2013 AND YEAR(B.Date) = 2013	codebase_community
SELECT T1.OwnerUserId FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.ViewCount = (SELECT MAX(ViewCount) FROM Posts) LIMIT 1;	codebase_community
SELECT U.DisplayName, U.Location FROM users AS U JOIN posts AS P ON U.Id = P.OwnerUserId JOIN posttags AS PT ON P.Id = PT.PostId WHERE PT.TagName = 'hypothesis-testing' AND P.PostTypeId = 4 LIMIT 1;	codebase_community
SELECT T1.Title, T2.LinkTypeId FROM Posts AS T1 JOIN PostLinks AS T2 ON T1.Id = T2.PostId WHERE T1.Title = 'What are principal component scores?'	codebase_community
SELECT T1.DisplayName FROM Users AS T1 JOIN Posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T2.ParentId IS NOT NULL ORDER BY T2.Score DESC LIMIT 1	codebase_community
SELECT T1.DisplayName, T1.WebsiteUrl FROM users AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.UserId WHERE T2.VoteTypeId = 8 ORDER BY T2.BountyAmount DESC LIMIT 1;	codebase_community
SELECT Title FROM Posts ORDER BY ViewCount DESC LIMIT 5	codebase_community
SELECT COUNT(*) FROM (SELECT TagName, Count FROM Tags GROUP BY TagName HAVING Count BETWEEN 5000 AND 7000) AS T1;	codebase_community
SELECT OwnerUserId FROM Posts WHERE FavoriteCount = (SELECT MAX(FavoriteCount) FROM Posts) LIMIT 1;	codebase_community
SELECT Age FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users) LIMIT 1;	codebase_community
SELECT COUNT(*) FROM votes WHERE YEAR(CreationDate) = 2011 AND BountyAmount = 50;	codebase_community
SELECT Id FROM users WHERE Age IS NOT NULL ORDER BY Age LIMIT 1;	codebase_community
SELECT SUM(T1.Score) FROM posts AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.PostId WHERE T1.LastActivityDate LIKE '2010-07-19%' GROUP BY T1.Id	codebase_community
SELECT COUNT(T1.Id) / 12 AS AverageMonthlyLinksCreated FROM Posts AS T1 WHERE YEAR(T1.CreationDate) = 2010 AND T1.AnswerCount <= 2;	codebase_community
SELECT T1.Id FROM Posts AS T1 JOIN Votes AS T2 ON T1.Id = T2.PostId WHERE T2.UserId = 1465 AND T2.VoteTypeId = 5 ORDER BY T1.FavoriteCount DESC LIMIT 1;	codebase_community
SELECT Title FROM Posts WHERE CreationDate = (SELECT MIN(CreationDate) FROM Posts) LIMIT 1;	codebase_community
SELECT U.DisplayName FROM Users AS U JOIN Badges AS B ON U.Id = B.UserId GROUP BY U.DisplayName ORDER BY COUNT(B.Name) DESC LIMIT 1;	codebase_community
SELECT MIN(T2.CreationDate) FROM `users` AS T1 INNER JOIN `votes` AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'chl'	codebase_community
SELECT T1.CreationDate FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.Age = (SELECT MIN(Age) FROM Users) ORDER BY T1.CreationDate LIMIT 1;	codebase_community
SELECT U.DisplayName FROM users AS U JOIN badges AS B ON U.Id = B.UserId WHERE B.Name = 'Autobiographer' ORDER BY B.Date LIMIT 1	codebase_community
SELECT COUNT(T1.Id) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.Location = 'United Kingdom' AND T2.FavoriteCount >= 4;	codebase_community
SELECT AVG(T2.PostId) FROM users AS T1 JOIN votes AS T2 ON T1.Id = T2.UserId WHERE T1.Age = (SELECT MAX(Age) FROM users) AND T2.PostId IS NOT NULL;	codebase_community
SELECT DisplayName FROM users ORDER BY Reputation DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM users WHERE Reputation > 2000 AND (SELECT COUNT(*) FROM posts WHERE posts.OwnerUserId = users.Id) > 1000;	codebase_community
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT COUNT(*) FROM posts WHERE UserId = 5 AND YEAR(CreationDate) = 2010;	codebase_community
SELECT T1.Id, T1.Title FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'Harvey Motulsky' ORDER BY T1.ViewCount DESC LIMIT 1;	codebase_community
SELECT T1.Id, T1.Title FROM Posts AS T1 JOIN Votes AS T2 ON T1.Id = T2.PostId WHERE T2.VoteTypeId = 2 ORDER BY T1.Score DESC LIMIT 1;	codebase_community
SELECT AVG(T1.Score) FROM Posts AS T1 INNER JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'Stephen Turner' AND T1.PostTypeId = 1 OR T1.PostTypeId = 2	codebase_community
SELECT U.DisplayName FROM users AS U JOIN posts AS P ON U.Id = P.OwnerUserId WHERE YEAR(P.CreationDate) = 2011 AND P.ViewCount > 20000 GROUP BY U.DisplayName HAVING COUNT(P.Id) > 0	codebase_community
SELECT P.Id, U.DisplayName FROM Posts AS P JOIN Users AS U ON P.OwnerUserId = U.Id WHERE YEAR(P.CreationDate) = 2010 ORDER BY P.FavoriteCount DESC LIMIT 1	codebase_community
SELECT CAST(SUM(CASE WHEN T2.Reputation > 1000 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.Id) FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE STRFTIME('%Y', T1.CreationDate) = '2011'	codebase_community
SELECT CAST(SUM(CASE WHEN Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(Id) FROM users WHERE Age IS NOT NULL;	codebase_community
SELECT T1.ViewCount, T2.DisplayName FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Title = 'Computer Game Datasets' ORDER BY T1.LastActivityDate DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM Posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM Posts)	codebase_community
SELECT COUNT(*) FROM Comments WHERE PostId = (SELECT Id FROM Posts ORDER BY Score DESC LIMIT 1)	codebase_community
SELECT COUNT(*) FROM Posts WHERE ViewCount > 35000 AND CommentCount = 0;	codebase_community
SELECT T1.DisplayName, T1.Location FROM `users` AS T1 JOIN `posts` AS T2 ON T1.Id = T2.OwnerUserId WHERE T2.Id = 183 ORDER BY T2.LastEditDate DESC LIMIT 1	codebase_community
SELECT B.Name FROM Badges AS B WHERE B.UserId = (SELECT U.Id FROM Users AS U WHERE U.DisplayName = 'Emmett') ORDER BY B.Date DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000;	codebase_community
SELECT julianday(T1.Date) - julianday(T2.CreationDate) AS Days FROM (SELECT MIN(Date) AS Date FROM stats_badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Zolomon')) T1, (SELECT CreationDate FROM users WHERE DisplayName = 'Zolomon') T2;	codebase_community
SELECT COUNT(T1.Id) AS PostCount, COUNT(T3.Id) AS CommentCount FROM Posts AS T1 INNER JOIN Users AS T2 ON T1.OwnerUserId = T2.Id LEFT JOIN Comments AS T3 ON T3.UserId = T2.Id WHERE T2.CreationDate = (SELECT MAX(CreationDate) FROM Users) GROUP BY T2.Id	codebase_community
SELECT C.Text, U.DisplayName FROM Comments AS C JOIN Users AS U ON C.UserId = U.Id WHERE C.PostId IN (SELECT Id FROM Posts WHERE Title = 'Analysing wind data with R') ORDER BY C.CreationDate DESC LIMIT 10	codebase_community
SELECT COUNT(*) FROM users WHERE Id IN (SELECT UserId FROM badges WHERE Name = 'Citizen Patrol')	codebase_community
SELECT COUNT(*) FROM posts AS P JOIN posttags AS PT ON P.Id = PT.PostId WHERE PT.TagId IN (SELECT Id FROM tags WHERE TagName = 'careers')	codebase_community
SELECT U.Reputation, P.ViewCount FROM users AS U JOIN posts AS P ON U.Id = P.OwnerUserId WHERE U.DisplayName = 'Jarrod Dixon' LIMIT 1;	codebase_community
SELECT COUNT(T1.Id) AS Comments, COUNT(T3.Id) AS Answers FROM Comments AS T1 INNER JOIN Posts AS T2 ON T1.PostId = T2.Id LEFT JOIN Posts AS T3 ON T3.ParentId = T2.Id WHERE T2.Title = 'Clustering 1D data' GROUP BY T2.Id	codebase_community
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat';	codebase_community
SELECT COUNT(*) FROM votes WHERE BountyAmount >= 30;	codebase_community
SELECT CAST(SUM(CASE WHEN P.Score > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(P.Id) FROM (SELECT U.Reputation, P.Id, P.Score FROM Posts AS P JOIN Users AS U ON P.OwnerUserId = U.Id ORDER BY U.Reputation DESC LIMIT 1) AS P WHERE P.Reputation = (SELECT MAX(Reputation) FROM Users)	codebase_community
SELECT COUNT(*) FROM posts WHERE Score < 20;	codebase_community
SELECT COUNT(*) FROM (SELECT TagId, COUNT(PostId) AS Count FROM PostTags GROUP BY TagId HAVING Count <= 20 AND TagId < 15) AS T1;	codebase_community
SELECT T1.ExcerptPostId, T1.WikiPostId FROM Tags AS T1 WHERE T1.TagName = 'sample'	codebase_community
SELECT U.Reputation, COUNT(V.PostId) AS UpVotes  FROM users AS U  JOIN votes AS V ON U.Id = V.UserId  WHERE U.DisplayName = 'Shane' AND V.VoteTypeId = 2  GROUP BY U.Id;	codebase_community
SELECT C.Text FROM Comments AS C JOIN Posts AS P ON C.PostId = P.Id WHERE P.Title LIKE '%linear regression%'	codebase_community
SELECT T1.Text FROM Comments AS T1 INNER JOIN Posts AS T2 ON T1.PostId = T2.Id WHERE T2.ViewCount BETWEEN 100 AND 150 ORDER BY T1.Score DESC LIMIT 1	codebase_community
SELECT T1.CreationDate, T2.Age FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.PostTypeId = 2 AND T1.Body LIKE '%http://%' ORDER BY T1.CreationDate, T2.Age LIMIT 1	codebase_community
SELECT COUNT(T1.Id) FROM Posts AS T1 INNER JOIN Comments AS T2 ON T1.Id = T2.PostId WHERE T2.Score = 0 AND T1.ViewCount < 5;	codebase_community
SELECT COUNT(*) FROM (SELECT PostId FROM Comments WHERE Score = 0 GROUP BY PostId HAVING COUNT(*) = 1) AS T1 JOIN Posts AS T2 ON T1.PostId = T2.Id WHERE T2.CommentCount = 1;	codebase_community
SELECT COUNT(DISTINCT u.Id) FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE p.Score = 0 AND u.Age = 40;	codebase_community
SELECT T1.Id AS PostId, T2.Text AS Comments FROM Posts AS T1 LEFT JOIN Comments AS T2 ON T1.Id = T2.PostId WHERE T1.Title = 'Group differences on a five point Likert item'	codebase_community
SELECT COUNT(*) FROM votes WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Shane') AND VoteTypeId = 2	codebase_community
SELECT T1.Id AS CommentId, T1.Text FROM Comments AS T1 INNER JOIN Users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'Harvey Motulsky'	codebase_community
SELECT U.DisplayName FROM Users AS U JOIN Comments AS C ON U.Id = C.UserId WHERE C.Score BETWEEN 1 AND 5 AND U.DownVotes = 0	codebase_community
SELECT CAST(SUM(CASE WHEN T2.UpVotes = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.UserId) FROM (SELECT T1.Id, T1.Score, T3.UpVotes, T3.UserId FROM Posts AS T1 JOIN Comments AS T2 ON T1.Id = T2.PostId JOIN Users AS T3 ON T2.UserId = T3.Id WHERE T1.Score BETWEEN 5 AND 10) AS T1 WHERE T1.Score BETWEEN 5 AND 10;	codebase_community
SELECT T3.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.superhero_name = '3-D Man'	superhero
SELECT COUNT(*) FROM `hero_power` JOIN `superpower` ON `hero_power`.`power_id` = `superpower`.`id` WHERE `superpower`.`power_name` = 'Super Strength'	superhero
SELECT COUNT(*) FROM `superhero` AS T1 JOIN `hero_power` AS T2 ON T1.id = T2.hero_id JOIN `superpower` AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Super Strength' AND T1.height_cm > 200;	superhero
SELECT T1.full_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id GROUP BY T1.full_name HAVING COUNT(T2.power_id) > 15	superhero
SELECT COUNT(*) FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Blue'	superhero
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.skin_colour_id = T2.id WHERE T1.superhero_name = 'Apocalypse'	superhero
SELECT COUNT(*) FROM `superhero` AS T1 JOIN `colour` AS T2 ON T1.eye_colour_id = T2.id JOIN `hero_power` AS T3 ON T1.id = T3.hero_id JOIN `superpower` AS T4 ON T3.power_id = T4.id WHERE T2.colour = 'Blue' AND T4.power_name = 'Agility'	superhero
SELECT T1.superhero_name FROM `superhero` AS T1 JOIN `colour` AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Blue' AND T1.hair_colour_id IN (SELECT id FROM `colour` WHERE colour = 'Blond')	superhero
SELECT COUNT(*) FROM `superhero` AS T1 JOIN `publisher` AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics'	superhero
SELECT T1.superhero_name FROM `superhero` AS T1 JOIN `publisher` AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics' ORDER BY T1.height_cm DESC	superhero
SELECT T2.publisher_name FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name = 'Sauron'	superhero
SELECT T4.colour FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id JOIN colour AS T3 ON T1.eye_colour_id = T3.id JOIN colour AS T4 ON T1.eye_colour_id = T4.id WHERE T2.publisher_name = 'Marvel Comics' GROUP BY T4.colour ORDER BY COUNT(T1.id) DESC	superhero
SELECT AVG(T1.height_cm) FROM `superhero` AS T1 JOIN `publisher` AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics' AND T1.height_cm IS NOT NULL	superhero
SELECT T1.superhero_name FROM `superhero` AS T1 JOIN `hero_power` AS T2 ON T1.id = T2.hero_id JOIN `superpower` AS T3 ON T3.id = T2.power_id WHERE T3.power_name = 'Super Strength' AND T1.publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')	superhero
SELECT COUNT(*) FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'DC Comics'	superhero
SELECT T3.publisher_name FROM hero_attribute AS T1 JOIN superhero AS T2 ON T1.hero_id = T2.id JOIN publisher AS T3 ON T2.publisher_id = T3.id WHERE T1.attribute_id = 3 ORDER BY T1.attribute_value ASC LIMIT 1	superhero
SELECT COUNT(*) FROM `superhero` AS T1 JOIN `colour` AS T2 ON T1.eye_colour_id = T2.id JOIN `publisher` AS T3 ON T1.publisher_id = T3.id WHERE T2.colour = 'Gold' AND T3.publisher_name = 'Marvel Comics'	superhero
SELECT T2.publisher_name FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name = 'Blue Beetle II'	superhero
SELECT COUNT(*) FROM superhero AS T1 JOIN colour AS T2 ON T1.hair_colour_id = T2.id WHERE T2.colour = 'Blond'	superhero
SELECT T1.superhero_name FROM `superhero` AS T1 JOIN `hero_attribute` AS T2 ON T1.id = T2.hero_id JOIN `attribute` AS T3 ON T3.id = T2.attribute_id WHERE T3.attribute_name = 'Intelligence' ORDER BY T2.attribute_value LIMIT 1	superhero
SELECT T1.race FROM `race` AS T1 JOIN `superhero` AS T2 ON T1.id = T2.race_id WHERE T2.superhero_name = 'Copycat'	superhero
SELECT T1.superhero_name FROM `superhero` AS T1 JOIN `hero_attribute` AS T2 ON T1.id = T2.hero_id JOIN `attribute` AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Durability' AND T2.attribute_value < 50	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Death Touch'	superhero
SELECT COUNT(*) FROM `superhero` AS T1 JOIN `hero_attribute` AS T2 ON T1.id = T2.hero_id JOIN `attribute` AS T3 ON T2.attribute_id = T3.id WHERE T1.gender_id = 2 AND T3.attribute_name = 'Strength' AND T2.attribute_value = 100;	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id GROUP BY T1.superhero_name ORDER BY COUNT(T2.power_id) DESC LIMIT 1	superhero
SELECT COUNT(*) FROM `superhero` WHERE `race_id` = (SELECT `id` FROM `race` WHERE `race` = 'Vampire')	superhero
SELECT CAST(SUM(CASE WHEN T2.alignment = 'Bad' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id), SUM(CASE WHEN T2.alignment = 'Bad' AND T3.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) FROM superhero AS T1 JOIN hero_attribute AS T4 ON T1.id = T4.hero_id JOIN attribute AS T5 ON T5.id = T4.attribute_id JOIN alignment AS T2 ON T2.alignment = T1.alignment JOIN publisher AS T3 ON T3.id = T1.publisher_id WHERE T5.attribute_name = 'Intelligence' AND T2.alignment IN ('Bad') GROUP BY T2.alignment	superhero
SELECT COUNT(*) - (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')) AS difference FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')	superhero
SELECT id FROM publisher WHERE publisher_name = 'Star Trek' LIMIT 1;	superhero
SELECT AVG(T2.attribute_value) FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.weight_kg IS NOT NULL AND T2.attribute_value IS NOT NULL;	superhero
SELECT COUNT(*) FROM `superhero` WHERE `full_name` IS NULL;	superhero
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.id = 75	superhero
SELECT T3.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.superhero_name = 'Deathlok'	superhero
SELECT AVG(T1.weight_kg) FROM `superhero` AS T1 JOIN `gender` AS T2 ON T1.gender_id = T2.id WHERE T2.gender = 'Female' AND T1.weight_kg IS NOT NULL;	superhero
SELECT T5.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T5 ON T2.power_id = T5.id JOIN gender AS T3 ON T1.gender_id = T3.id WHERE T3.gender = 'Male' LIMIT 5	superhero
SELECT T1.superhero_name FROM `superhero` AS T1 JOIN `race` AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Alien'	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'No Colour' AND T1.height_cm BETWEEN 170 AND 190	superhero
SELECT T2.power_name FROM hero_power AS T1 JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T1.hero_id = 56	superhero
SELECT T1.full_name FROM `superhero` AS T1 JOIN `race` AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Demi-God' LIMIT 5;	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 2;	superhero
SELECT T1.race FROM `race` AS T1 JOIN `superhero` AS T2 ON T1.id = T2.race_id WHERE T2.weight_kg = 169	superhero
SELECT T3.colour FROM superhero AS T1 JOIN colour AS T3 ON T1.hair_colour_id = T3.id WHERE T1.height_cm = 185 AND T1.race_id = (SELECT id FROM race WHERE race = 'human')	superhero
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.weight_kg = (SELECT MAX(weight_kg) FROM superhero)	superhero
SELECT CAST(SUM(CASE WHEN T2.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.publisher_id) FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.publisher_id WHERE T1.height_cm BETWEEN 150 AND 180;	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T2.gender = 'Male' AND T1.weight_kg > (SELECT AVG(T3.weight_kg) * 0.79 FROM superhero AS T3)	superhero
SELECT T2.power_name FROM hero_power AS T1 JOIN superpower AS T2 ON T1.power_id = T2.id GROUP BY T2.power_name ORDER BY COUNT(T2.power_name) DESC LIMIT 1	superhero
SELECT T2.attribute_value FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Abomination'	superhero
SELECT T2.power_name FROM hero_power AS T1 JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T1.hero_id = 1	superhero
SELECT COUNT(*) FROM `hero_power` JOIN `superpower` ON `hero_power.power_id` = `superpower.id` WHERE `superpower.power_name` = 'Stealth'	superhero
SELECT T1.full_name FROM `superhero` AS T1 JOIN `hero_attribute` AS T2 ON T1.id = T2.hero_id JOIN `attribute` AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Strength' ORDER BY T2.attribute_value DESC LIMIT 1	superhero
SELECT AVG(T1.id) FROM superhero AS T1 JOIN colour AS T2 ON T1.skin_colour_id = T2.id WHERE T2.colour = 'No Colour'	superhero
SELECT COUNT(*) FROM `superhero` AS T1 JOIN `publisher` AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Dark Horse Comics'	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T3.id = T2.attribute_id WHERE T3.attribute_name = 'Durability' AND T1.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics') ORDER BY T2.attribute_value DESC LIMIT 1	superhero
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.full_name = 'Abraham Sapien'	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T3.id = T2.power_id WHERE T3.power_name = 'Flight'	superhero
SELECT T1.eye_colour_id, T1.hair_colour_id, T1.skin_colour_id FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id JOIN gender AS T3 ON T1.gender_id = T3.id WHERE T3.gender = 'Female' AND T2.publisher_name = 'Dark Horse Comics'	superhero
SELECT T1.superhero_name, T2.publisher_name FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.eye_colour_id = T1.hair_colour_id AND T1.eye_colour_id = T1.skin_colour_id	superhero
SELECT T2.race FROM `superhero` AS T1 JOIN `race` AS T2 ON T1.race_id = T2.id WHERE T1.superhero_name = 'A-Bomb'	superhero
SELECT CAST(SUM(CASE WHEN T3.colour = 'Blue' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.gender_id) FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id JOIN colour AS T3 ON T1.skin_colour_id = T3.id WHERE T2.gender = 'Female'	superhero
SELECT T1.superhero_name, T2.race FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.full_name = 'Charles Chandler'	superhero
SELECT T2.gender FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T1.superhero_name = 'Agent 13'	superhero
SELECT T1.superhero_name FROM `superhero` AS T1 JOIN `hero_power` AS T2 ON T1.id = T2.hero_id JOIN `superpower` AS T3 ON T3.id = T2.power_id WHERE T3.power_name = 'Adaptation'	superhero
SELECT COUNT(T2.power_id) FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Amazo'	superhero
SELECT T3.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.full_name = 'Hunter Zolomon'	superhero
SELECT T1.height_cm FROM `superhero` AS T1 JOIN `colour` AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Amber'	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id AND T1.hair_colour_id = T2.id WHERE T2.colour = 'Black'	superhero
SELECT T2.eye_colour_id FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.skin_colour_id IN (SELECT id FROM colour WHERE colour = 'Gold')	superhero
SELECT T1.full_name FROM `superhero` AS T1 JOIN `race` AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Vampire'	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T2.alignment = 'Neutral'	superhero
SELECT COUNT(T1.id) FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Strength' AND T2.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute WHERE attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Strength'))	superhero
SELECT T1.race, T4.alignment FROM `race` AS T1 JOIN `superhero` AS T2 ON T1.id = T2.race_id JOIN `alignment` AS T4 ON T4.id = T2.alignment_id WHERE T2.superhero_name = 'Cameron Hicks'	superhero
SELECT CAST(SUM(CASE WHEN T2.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T1.publisher_name = 'Marvel Comics'	superhero
SELECT AVG(T1.weight_kg) FROM `superhero` AS T1 JOIN `race` AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Alien' AND T1.weight_kg IS NOT NULL;	superhero
SELECT (SELECT weight_kg FROM superhero WHERE full_name = 'Emil Blonsky') - (SELECT weight_kg FROM superhero WHERE full_name = 'Charles Chandler') AS weight_difference;	superhero
SELECT AVG(T1.height_cm) FROM superhero AS T1 WHERE T1.height_cm IS NOT NULL	superhero
SELECT T5.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T5 ON T2.power_id = T5.id WHERE T1.superhero_name = 'Abomination'	superhero
SELECT COUNT(*) FROM `superhero` AS T1 JOIN `race` AS T2 ON T1.race_id = T2.id JOIN `gender` AS T3 ON T1.gender_id = T3.id WHERE T2.race = 'god/eternal' AND T3.gender = 'Male'	superhero
SELECT T1.superhero_name FROM `superhero` AS T1 JOIN `hero_attribute` AS T2 ON T1.id = T2.hero_id JOIN `attribute` AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Speed' ORDER BY T2.attribute_value DESC LIMIT 1	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3;	superhero
SELECT T2.attribute_name, T1.attribute_value FROM hero_attribute AS T1 JOIN attribute AS T2 ON T1.attribute_id = T2.id WHERE T1.hero_id = (SELECT id FROM superhero WHERE superhero_name = '3-D Man')	superhero
SELECT T1.superhero_name FROM `superhero` AS T1 JOIN `colour` AS T2 ON T1.eye_colour_id = T2.id JOIN `colour` AS T3 ON T1.hair_colour_id = T3.id WHERE T2.colour = 'Blue' AND T3.colour = 'Brown'	superhero
SELECT T2.publisher_name FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy') GROUP BY T2.publisher_name HAVING COUNT(*) = 3	superhero
SELECT COUNT(*) FROM `superhero` WHERE `publisher_id` = 1;	superhero
SELECT CAST(SUM(CASE WHEN T2.colour = 'Blue' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id;	superhero
SELECT CAST(SUM(CASE WHEN T2.gender = 'Male' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T2.gender = 'Female' THEN 1 ELSE 0 END) FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id	superhero
SELECT superhero_name FROM `superhero` WHERE height_cm = (SELECT MAX(height_cm) FROM `superhero`)	superhero
SELECT id FROM superpower WHERE power_name = 'cryokinesis' LIMIT 1;	superhero
SELECT superhero_name FROM superhero WHERE id = 294;	superhero
SELECT full_name FROM superhero WHERE weight_kg = 0 OR weight_kg IS NULL;	superhero
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.full_name = 'Karen Beecher-Duncan'	superhero
SELECT T5.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T5 ON T2.power_id = T5.id WHERE T1.full_name = 'Helen Parr'	superhero
SELECT T2.race FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.weight_kg = 108 AND T1.height_cm = 188;	superhero
SELECT T2.publisher_name FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.id = 38;	superhero
SELECT T3.race FROM hero_attribute AS T1 JOIN superhero AS T2 ON T1.hero_id = T2.id JOIN race AS T3 ON T2.race_id = T3.id WHERE T1.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute) AND T1.attribute_id = 1	superhero
SELECT T1.alignment, T3.power_name FROM alignment AS T1 JOIN superhero AS T2 ON T2.alignment_id = T1.id JOIN hero_power AS T4 ON T4.hero_id = T2.id JOIN superpower AS T3 ON T3.id = T4.power_id WHERE T2.superhero_name = 'Atom IV'	superhero
SELECT T1.full_name FROM `superhero` AS T1 JOIN `colour` AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Blue' LIMIT 5;	superhero
SELECT AVG(T2.attribute_value) FROM `alignment` AS T1 JOIN `superhero` AS T3 ON T1.id = T3.alignment_id JOIN `hero_attribute` AS T2 ON T3.id = T2.hero_id WHERE T1.alignment = 'Neutral' AND T2.attribute_id IN (1, 2, 3, 4, 5) GROUP BY T2.hero_id;	superhero
SELECT T3.skin_colour FROM hero_attribute AS T1 JOIN superhero AS T2 ON T1.hero_id = T2.id JOIN colour AS T3 ON T2.skin_colour_id = T3.id WHERE T1.attribute_value = 100	superhero
SELECT COUNT(*) FROM `superhero` AS T1 JOIN `alignment` AS T2 ON T1.alignment_id = T2.id JOIN `gender` AS T3 ON T1.gender_id = T3.id WHERE T2.alignment = 'Good' AND T3.gender = 'Female'	superhero
SELECT T1.superhero_name FROM `superhero` AS T1 JOIN `hero_attribute` AS T2 ON T1.id = T2.hero_id WHERE T2.attribute_value BETWEEN 75 AND 80;	superhero
SELECT T1.race FROM `race` AS T1 JOIN `superhero` AS T2 ON T1.id = T2.race_id WHERE T2.gender_id = (SELECT id FROM `gender` WHERE gender = 'Male') AND T2.hair_colour_id = (SELECT id FROM `colour` WHERE colour = 'Blue')	superhero
SELECT CAST(SUM(CASE WHEN T2.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T1.alignment_id = 2;	superhero
SELECT (SELECT COUNT(*) FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.weight_kg IS NULL OR T1.weight_kg = 0 AND T2.id = 7) - (SELECT COUNT(*) FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.weight_kg IS NULL OR T1.weight_kg = 0 AND T2.id = 1)	superhero
SELECT T2.attribute_value FROM attribute AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.attribute_id JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.superhero_name = 'Hulk' AND T1.attribute_name = 'Strength'	superhero
SELECT T5.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T5 ON T2.power_id = T5.id WHERE T1.superhero_name = 'Ajax'	superhero
SELECT COUNT(*) FROM `superhero` AS T1 JOIN `colour` AS T2 ON T1.skin_colour_id = T2.id JOIN `alignment` AS T3 ON T1.alignment_id = T3.id WHERE T2.colour = 'Green' AND T3.alignment = 'Bad'	superhero
SELECT COUNT(*) FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T2.gender = 'Female' AND T3.publisher_name = 'Marvel Comics'	superhero
SELECT T1.superhero_name FROM `superhero` AS T1 JOIN `hero_power` AS T2 ON T1.id = T2.hero_id JOIN `superpower` AS T3 ON T3.id = T2.power_id WHERE T3.power_name = 'Wind Control' ORDER BY T1.superhero_name ASC	superhero
SELECT T1.gender FROM gender AS T1 JOIN superhero AS T2 ON T1.id = T2.gender_id JOIN hero_power AS T3 ON T2.id = T3.hero_id JOIN superpower AS T4 ON T3.power_id = T4.id WHERE T4.power_name = 'Phoenix Force'	superhero
SELECT T1.superhero_name FROM `superhero` AS T1 JOIN `publisher` AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'DC Comics' ORDER BY T1.weight_kg DESC LIMIT 1	superhero
SELECT AVG(T1.height_cm) FROM `superhero` AS T1 JOIN `publisher` AS T2 ON T1.publisher_id = T2.id JOIN `race` AS T3 ON T1.race_id = T3.id WHERE T2.publisher_name = 'Dark Horse Comics' AND T3.race <> 'Human';	superhero
SELECT COUNT(T1.id) FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Speed' AND T2.attribute_value = 100;	superhero
SELECT (SELECT COUNT(*) FROM superhero WHERE publisher_id = 4) - (SELECT COUNT(*) FROM superhero WHERE publisher_id = 13) AS difference;	superhero
SELECT T1.attribute_name FROM `attribute` AS T1 JOIN `hero_attribute` AS T2 ON T1.id = T2.attribute_id JOIN `superhero` AS T3 ON T3.id = T2.hero_id WHERE T3.superhero_name = 'Black Panther' ORDER BY T2.attribute_value LIMIT 1	superhero
SELECT T3.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id JOIN colour AS T3 ON T2.id = T3.id WHERE T1.superhero_name = 'Abomination'	superhero
SELECT superhero_name FROM `superhero` WHERE height_cm = (SELECT MAX(height_cm) FROM `superhero`)	superhero
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler'	superhero
SELECT CAST(SUM(CASE WHEN T2.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T1.publisher_name = 'George Lucas'	superhero
SELECT CAST(SUM(CASE WHEN T2.alignment = 'Good' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM superhero AS T1 JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T1.publisher_name = 'Marvel Comics'	superhero
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%'	superhero
SELECT hero_id FROM hero_attribute WHERE attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute) LIMIT 1;	superhero
SELECT T1.full_name FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Alien'	superhero
SELECT T1.full_name FROM `superhero` AS T1 JOIN `colour` AS T2 ON T1.eye_colour_id = T2.id WHERE T1.weight_kg < 100 AND T2.colour = 'Brown'	superhero
SELECT T2.attribute_value FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Aquababy'	superhero
SELECT T1.weight_kg, T2.race FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.id = 40;	superhero
SELECT AVG(T1.height_cm) FROM `superhero` AS T1 JOIN `alignment` AS T2 ON T1.alignment_id = T2.id WHERE T2.alignment = 'Neutral' AND T1.height_cm IS NOT NULL;	superhero
SELECT T1.id FROM `superhero` AS T1 JOIN `hero_attribute` AS T2 ON T1.id = T2.hero_id JOIN `attribute` AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Intelligence'	superhero
SELECT T2.colour FROM `superhero` AS T1 JOIN `colour` AS T2 ON T1.eye_colour_id = T2.id WHERE T1.superhero_name = 'Blackwulf'	superhero
SELECT T5.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T5 ON T2.power_id = T5.id WHERE T1.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero)	superhero
SELECT T2.driverRef FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 20 AND T1.grid > (SELECT COUNT(*) - 5 FROM results WHERE raceId = 20) ORDER BY T1.q1 DESC LIMIT 5	formula_1
SELECT T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 19 AND T2.q2 IS NOT NULL ORDER BY T2.q2 LIMIT 1;	formula_1
SELECT T1.year FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.location = 'Shanghai'	formula_1
SELECT url FROM circuits WHERE name = 'Circuit de Barcelona-Catalunya'	formula_1
SELECT T1.name FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.country = 'Germany' GROUP BY T2.raceId ORDER BY COUNT(*) DESC LIMIT 1;	formula_1
SELECT T2.position FROM constructors AS T1 JOIN results AS T2 ON T1.constructorId = T2.constructorId WHERE T1.name = 'Renault'	formula_1
SELECT COUNT(*) FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.year = 2010 AND T2.location NOT IN (SELECT location FROM circuits WHERE continent IN ('Asia', 'Europe'))	formula_1
SELECT T1.name FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.country = 'Spain' GROUP BY T2.raceName;	formula_1
SELECT T2.lat, T2.lng FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Australian Grand Prix'	formula_1
SELECT url FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE name = 'Sepang International Circuit' GROUP BY url ORDER BY url LIMIT 1	formula_1
SELECT T2.time FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Sepang International Circuit'	formula_1
SELECT circuits.lat, circuits.lng FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE races.name = 'Abu Dhabi Grand Prix'	formula_1
SELECT T3.nationality FROM results AS T1 JOIN constructors AS T3 ON T1.constructorId = T3.constructorId WHERE T1.raceId = 24 AND T1.points = 1	formula_1
SELECT T2.q1 FROM results AS T1 JOIN qualifying AS T2 ON T1.raceId = T2.raceId AND T1.driverId = T2.driverId WHERE T1.raceId = 354 AND T1.driverId IN (SELECT driverId FROM drivers WHERE forename = 'Bruno' AND surname = 'Senna')	formula_1
SELECT T1.nationality FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 355 AND T2.q2time = '0:01:40'	formula_1
SELECT T2.number FROM qualifying AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 903 AND T1.q3 LIKE '1:54%'	formula_1
SELECT COUNT(*) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Bahrain Grand Prix' AND T1.time IS NOT NULL;	formula_1
SELECT T1.year FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.raceId = 901;	formula_1
SELECT COUNT(*) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE date = '2015-11-29') AND fastestLapTime IS NOT NULL;	formula_1
SELECT T1.driverId FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 592 AND T2.time IS NOT NULL ORDER BY T1.dob LIMIT 1	formula_1
SELECT T1.url FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 161 AND T2.time LIKE '0:01:27%'	formula_1
SELECT T3.nationality FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId JOIN constructors AS T3 ON T1.constructorId = T3.constructorId WHERE T1.raceId = 933 ORDER BY T1.fastestLapSpeed DESC LIMIT 1	formula_1
SELECT circuits.lat, circuits.lng FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE races.name = 'Malaysian Grand Prix'	formula_1
SELECT T2.url FROM results AS T1 JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T1.raceId = 9 ORDER BY T1.points DESC LIMIT 1	formula_1
SELECT T2.q1 FROM results AS T1 JOIN qualifying AS T2 ON T1.raceId = T2.raceId AND T1.driverId = T2.driverId WHERE T1.raceId = 345 AND T1.driverId = (SELECT driverId FROM drivers WHERE forename = 'Lucas' AND surname = 'di Grassi')	formula_1
SELECT T1.nationality FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 347 AND T2.q2time = '0:01:15'	formula_1
SELECT T1.code FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 45 AND T2.q3 LIKE '0:01:33%'	formula_1
SELECT T1.time FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.raceId = 743 AND T1.driverId = (SELECT driverId FROM drivers WHERE forename = 'Bruce' AND surname = 'McLaren')	formula_1
SELECT T2.driverId FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'San Marino Grand Prix' AND T1.year = 2006 AND T2.position = 2	formula_1
SELECT T1.url FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.raceId = 901;	formula_1
SELECT COUNT(*) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.date LIKE '2015-11-29%' AND T1.time IS NOT NULL;	formula_1
SELECT T1.driverId FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 872 AND T2.time IS NOT NULL ORDER BY T1.dob DESC LIMIT 1	formula_1
SELECT T1.driverId FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE raceId = 348 ORDER BY fastestLapTime LIMIT 1;	formula_1
SELECT T1.nationality FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results)	formula_1
SELECT ((T1.fastestLapSpeed - (SELECT fastestLapSpeed FROM results WHERE raceId = 854)) * 100 / T1.fastestLapSpeed) AS percentage_faster FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Paul' AND T2.surname = 'di Resta' AND T1.raceId = 853	formula_1
SELECT CAST(COUNT(T1.driverId) FILTER (WHERE T1.time IS NOT NULL) AS REAL) * 100 / COUNT(T1.driverId) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.date = '1983-07-16'	formula_1
SELECT MIN(T1.year) FROM races AS T1 WHERE T1.name = 'Singapore Grand Prix'	formula_1
SELECT COUNT(*) FROM races WHERE year = 2005 UNION SELECT name FROM races WHERE year = 2005 ORDER BY name DESC LIMIT 1000000	formula_1
SELECT T1.name FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.year = (SELECT MIN(year) FROM races) AND MONTH(T1.date) = MONTH((SELECT MIN(date) FROM races)) GROUP BY T1.name	formula_1
SELECT T1.name, T1.date FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 1999 ORDER BY T1.round DESC LIMIT 1	formula_1
SELECT year FROM races GROUP BY year ORDER BY COUNT(*) DESC LIMIT 1;	formula_1
SELECT T1.name FROM races AS T1 WHERE T1.year = 2017 EXCEPT SELECT T1.name FROM races AS T1 WHERE T1.year = 2000;	formula_1
SELECT T1.country, T2.name, T2.location FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'European Grand Prix' ORDER BY T2.year LIMIT 1	formula_1
SELECT year FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'British Grand Prix' AND T2.circuitId IN (SELECT circuitId FROM circuits WHERE name LIKE '%Brands Hatch%') ORDER BY year DESC LIMIT 1	formula_1
SELECT COUNT(DISTINCT T1.year) FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Silverstone' AND T1.name = 'British Grand Prix'	formula_1
SELECT T2.forename, T2.surname FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId IN (SELECT raceId FROM races WHERE year = 2010 AND name = 'Singapore Grand Prix') ORDER BY T1.position ASC	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.points = (SELECT MAX(points) FROM results)	formula_1
SELECT T1.driverRef, T2.points FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = (SELECT raceId FROM races WHERE year = 2017 AND name = 'Chinese Grand Prix') ORDER BY T1.position LIMIT 3	formula_1
SELECT T1.forename, T1.surname, T3.name FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T2.fastestLapTime = (SELECT MIN(fastestLapTime) FROM results)	formula_1
SELECT AVG(T1.milliseconds) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T1.raceId = T3.raceId WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton' AND T3.name = 'Malaysian Grand Prix' AND T3.year = 2009	formula_1
SELECT CAST(SUM(CASE WHEN T2.position > 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.raceId) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T3.surname = 'Hamilton' AND T1.year >= 2010;	formula_1
SELECT T1.forename, T1.surname, T1.nationality, MAX(T2.points) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.position = 1 GROUP BY T1.driverId ORDER BY COUNT(*) DESC LIMIT 1	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 WHERE T1.nationality = 'Japanese' ORDER BY T1.dob DESC LIMIT 1	formula_1
SELECT T1.circuitId FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.year BETWEEN 1990 AND 2000 GROUP BY T1.circuitId HAVING COUNT(*) >= 4	formula_1
SELECT T1.name, T1.location, T2.name FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.year = 2006 AND T1.country = 'USA'	formula_1
SELECT T1.name, T2.name, T2.Location FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE MONTH(T1.date) = 9 AND YEAR(T1.date) = 2005	formula_1
SELECT T1.raceId FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T3.driverId = T2.driverId WHERE T3.forename = 'Alex' AND T3.surname = 'Yoong' AND T2.position < 20	formula_1
SELECT COUNT(*) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T3.name = 'Michael Schumacher' AND T2.circuitId = (SELECT circuitId FROM circuits WHERE name = 'Sepang International Circuit') AND T1.position = 1	formula_1
SELECT T1.raceId, T2.year FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Michael' AND surname = 'Schumacher') ORDER BY fastestLapTime LIMIT 1	formula_1
SELECT AVG(T2.points) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = 'Eddie' AND T1.surname = 'Irvine' AND strftime('%Y', T2.date) = '2000'	formula_1
SELECT T1.raceId, T2.points FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T1.driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton') ORDER BY T2.year LIMIT 1	formula_1
SELECT T1.name, T2.country FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.year = 2017 ORDER BY T1.date ASC;	formula_1
SELECT T1.name, T1.year, T2.location FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId JOIN results AS T3 ON T1.raceId = T3.raceId WHERE T3.laps = (SELECT MAX(laps) FROM results) GROUP BY T1.name, T1.year, T2.location ORDER BY T3.laps DESC LIMIT 1	formula_1
SELECT CAST(SUM(IIF(T2.country = 'Germany', 1, 0)) AS REAL) * 100 / COUNT(*) FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'European Grand Prix'	formula_1
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit'	formula_1
SELECT name FROM circuits WHERE name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring') ORDER BY lat DESC LIMIT 1;	formula_1
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit'	formula_1
SELECT T1.country FROM circuits AS T1 JOIN results AS T2 ON T1.circuitId = T2.circuitId WHERE T1.alt = (SELECT MAX(alt) FROM circuits) LIMIT 1;	formula_1
SELECT COUNT(*) FROM drivers WHERE code IS NULL;	formula_1
SELECT T2.nationality FROM drivers AS T1 JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T1.dob = (SELECT MIN(dob) FROM drivers) LIMIT 1;	formula_1
SELECT T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = 'Italian' GROUP BY T1.surname	formula_1
SELECT T2.url FROM drivers AS T1 JOIN driverStandings AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = 'Anthony' AND T1.surname = 'Davidson'	formula_1
SELECT driverRef FROM drivers WHERE name = 'Lewis Hamilton'	formula_1
SELECT T1.circuitId FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Spanish Grand Prix' AND T2.year = 2009	formula_1
SELECT DISTINCT T1.year FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Silverstone'	formula_1
SELECT T1.url FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Silverstone' AND T2.name IN (SELECT name FROM races WHERE raceId IN (SELECT raceId FROM results))	formula_1
SELECT T1.time FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Abu Dhabi Grand Prix' AND T1.year BETWEEN 2010 AND 2019 LIMIT 1	formula_1
SELECT COUNT(*) FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.country = 'Italy'	formula_1
SELECT T1.date FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Circuit de Barcelona-Catalunya'	formula_1
SELECT T1.url FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Spanish Grand Prix' AND T2.year = 2009 LIMIT 1	formula_1
SELECT MIN(T1.fastestLapTime) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton'	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results)	formula_1
SELECT T2.driverRef FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Canadian Grand Prix' AND T1.year = 2007 ORDER BY T2.position LIMIT 1	formula_1
SELECT T2.name FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T3.forename = 'Lewis' AND T3.surname = 'Hamilton' ORDER BY T2.date DESC;	formula_1
SELECT T1.raceId FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton' ORDER BY T1.position ASC LIMIT 1	formula_1
SELECT MAX(T1.fastestLapSpeed) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Spanish Grand Prix' AND T2.year = 2009	formula_1
SELECT DISTINCT T2.year FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T3.forename = 'Lewis' AND T3.surname = 'Hamilton'	formula_1
SELECT T1.positionOrder FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T1.raceId = T3.raceId WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton' AND T3.name = 'Chinese Grand Prix'	formula_1
SELECT T2.forename, T2.surname FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId IN (SELECT raceId FROM races WHERE year = 1989 AND name = 'Australian Grand Prix') AND T1.grid = 4	formula_1
SELECT COUNT(*) FROM results WHERE raceId = (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix') AND time IS NOT NULL;	formula_1
SELECT T1.fastestLapTime FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton' AND T1.raceId IN (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix') ORDER BY T1.fastestLapTime LIMIT 1	formula_1
SELECT T1.fastestLapTime FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Chinese Grand Prix' AND T2.year = 2008 AND T1.position = 2 ORDER BY T1.fastestLapTime LIMIT 1	formula_1
SELECT T1.url FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 1 AND T2.positionOrder = 1	formula_1
SELECT COUNT(*) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.nationality = 'British' AND T1.raceId = (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix')	formula_1
SELECT COUNT(*) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE name = 'Chinese Grand Prix' AND year = 2008) AND time IS NOT NULL	formula_1
SELECT SUM(T2.points) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton';	formula_1
SELECT AVG(T1.fastestLapTime) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton';	formula_1
SELECT CAST(SUM(CASE WHEN T2.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) / COUNT(T2.raceId) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 2008 AND T1.name = 'Australian Grand Prix'	formula_1
SELECT (T1.raceId, T2.time, T3.time) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN results AS T3 ON T1.raceId = T3.raceId WHERE T1.year = 2008 AND T1.name = 'Australian Grand Prix' AND T2.position = 1 AND T3.position = (SELECT COUNT(*) FROM results WHERE raceId = T1.raceId) ORDER BY ((CAST(REPLACE(SUBSTRING(T2.time, 7), ',', '') AS REAL) - CAST(REPLACE(SUBSTRING(T3.time, 7), ',', '') AS REAL)) / CAST(REPLACE(SUBSTRING(T3.time, 7), ',', '') AS REAL)) * 100 DESC LIMIT 1	formula_1
SELECT COUNT(*) FROM circuits WHERE location = 'Adelaide' AND country = 'Australia';	formula_1
SELECT lat, lng FROM circuits WHERE country = 'USA'	formula_1
SELECT COUNT(*) FROM drivers AS T1 WHERE nationality = 'British' AND year(dob) > 1980;	formula_1
SELECT MAX(T2.points) FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = 'British' AND T2.position IS NOT NULL;	formula_1
SELECT constructorId FROM results WHERE points = (SELECT MAX(points) FROM results) LIMIT 1	formula_1
SELECT T2.name FROM results AS T1 JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T1.raceId = 291 AND T1.points = 0	formula_1
SELECT COUNT(*) FROM (SELECT COUNT(T2.raceId) AS num_races, T3.nationality FROM results AS T1 JOIN constructors AS T3 ON T1.constructorId = T3.constructorId GROUP BY T1.constructorId HAVING num_races = 2 AND T3.nationality = 'Japanese' AND T1.points = 0)	formula_1
SELECT constructorId FROM results WHERE rank = 1	formula_1
SELECT COUNT(*) FROM results AS T1 JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T2.nationality = 'French' AND T1.laps > 50;	formula_1
SELECT CAST(SUM(CASE WHEN T2.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.driverId) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.year BETWEEN 2007 AND 2009 AND T2.driverId IN (SELECT driverId FROM drivers WHERE nationality = 'Japanese')	formula_1
SELECT AVG(T2.time) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.year < 1975 AND T2.position = 1 AND T2.time IS NOT NULL	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T1.dob > '1975-01-01' AND T2.position = 2	formula_1
SELECT COUNT(*) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.nationality = 'Italian' AND T1.time IS NULL;	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.fastestlaptime = ( SELECT MIN(fastestlaptime) FROM results )	formula_1
SELECT T1.fastestLapNum FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.year = 2009 AND T1.position = 1 ORDER BY T1.fastestLapTime LIMIT 1	formula_1
SELECT AVG(T1.fastestLapSpeed) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Spanish Grand Prix' AND T2.year = 2009;	formula_1
SELECT T1.raceName, T1.year FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.milliseconds IS NOT NULL ORDER BY T2.milliseconds LIMIT 1	formula_1
SELECT CAST(SUM(CASE WHEN T2.year < 1985 AND T3.laps > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.driverId) FROM drivers AS T1 JOIN results AS T3 ON T1.driverId = T3.driverId JOIN races AS T2 ON T3.raceId = T2.raceId WHERE T2.year BETWEEN 2000 AND 2005	formula_1
SELECT COUNT(*) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.nationality = 'French' AND T1.fastestLapTime < '02:00.00';	formula_1
SELECT driverId FROM drivers WHERE nationality = 'American'	formula_1
SELECT raceId FROM races WHERE year = 2009;	formula_1
SELECT COUNT(*) FROM results WHERE raceId = 18;	formula_1
SELECT COUNT(*) FROM (SELECT T1.driverId, T2.nationality AS nationality FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.dob IS NOT NULL ORDER BY STRFTIME('%Y', 'now') - STRFTIME('%Y', T2.dob) ASC LIMIT 3) AS youngest_drivers WHERE youngest_drivers.nationality = 'Dutch'	formula_1
SELECT driverRef FROM drivers WHERE name = 'Robert Kubica' LIMIT 1	formula_1
SELECT COUNT(*) FROM drivers AS T1 WHERE nationality = 'British' AND strftime('%Y', dob) = '1980';	formula_1
SELECT T1.driverId FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = 'German' AND strftime('%Y', T1.dob) BETWEEN '1980' AND '1990' ORDER BY T2.time LIMIT 3	formula_1
SELECT T1.driverRef FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = 'German' ORDER BY T1.dob ASC LIMIT 1	formula_1
SELECT T1.driverId, T1.code FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE YEAR(T1.dob) = 1971 AND T2.fastestLapTime IS NOT NULL ORDER BY T2.fastestLapTime LIMIT 1	formula_1
SELECT T1.driverId FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = 'Spanish' AND strftime('%Y', T1.dob) < '1982' ORDER BY T2.fastestLapTime DESC LIMIT 10	formula_1
SELECT T1.year FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.fastestLapTime IS NOT NULL ORDER BY T2.fastestLapTime LIMIT 1	formula_1
SELECT T1.year FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.fastestLapSpeed IS NOT NULL ORDER BY T2.fastestLapSpeed LIMIT 1	formula_1
SELECT driverId FROM results WHERE fastestLapTime = (SELECT MIN(fastestLapTime) FROM results) ORDER BY fastestLapTime DESC LIMIT 5	formula_1
SELECT COUNT(*) FROM results WHERE raceId BETWEEN 50 AND 100 AND statusId = 2 AND time IS NOT NULL	formula_1
SELECT COUNT(*), location, lat, lng FROM circuits WHERE country = 'Austria' GROUP BY location, lat, lng;	formula_1
SELECT raceId FROM results WHERE time IS NOT NULL GROUP BY raceId ORDER BY COUNT(*) DESC LIMIT 1;	formula_1
SELECT T1.driverRef, T1.nationality, T1.dob FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 23 AND T2.q2 IS NOT NULL;	formula_1
SELECT T1.name, T1.date, T1.time FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T3.dob = (SELECT MIN(dob) FROM drivers) ORDER BY T1.year LIMIT 1	formula_1
SELECT COUNT(*) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId JOIN status AS T3 ON T1.statusId = T3.statusId WHERE T2.nationality = 'American' AND T3.status = 'Puncture'	formula_1
SELECT T1.url FROM constructors AS T1 JOIN results AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = 'Italian' ORDER BY points DESC LIMIT 1	formula_1
SELECT T2.url FROM results AS T1 JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T1.position = 1 GROUP BY T1.constructorId ORDER BY COUNT(*) DESC LIMIT 1	formula_1
SELECT T1.driverId FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'French Grand Prix' AND T1.lap = 3 ORDER BY T1.time DESC LIMIT 1	formula_1
SELECT T1.raceId, T2.name, MIN(T1.fastestLapTime) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T1.fastestLap = 1 GROUP BY T1.raceId ORDER BY CAST(SUBSTR(T1.fastestLapTime, 7, LENGTH(T1.fastestLapTime)) AS REAL) * 1000 LIMIT 1	formula_1
SELECT AVG(T1.fastestLapTime) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.year = 2006 AND T2.name = 'United States Grand Prix' AND T1.rank < 11;	formula_1
SELECT T1.driverId FROM drivers AS T1 JOIN pitStops AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = 'German' AND YEAR(T1.dob) BETWEEN 1980 AND 1985 GROUP BY T1.driverId ORDER BY AVG(T2.duration) LIMIT 3	formula_1
SELECT T1.driverId, T1.time FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Canadian Grand Prix' AND T2.year = 2008 ORDER BY T1.position ASC LIMIT 1	formula_1
SELECT T1.url FROM constructors AS T1 JOIN results AS T2 ON T1.constructorId = T2.constructorId WHERE T2.raceId IN (SELECT raceId FROM races WHERE name = 'Singapore Grand Prix' AND year = 2009) ORDER BY T2.position LIMIT 1	formula_1
SELECT T1.forename, T1.surname, T1.dob FROM drivers AS T1 WHERE T1.nationality = 'Austrian' AND strftime('%Y', T1.dob) BETWEEN '1981' AND '1991'	formula_1
SELECT T1.forename, T1.surname, CONCAT('https://en.wikipedia.org/wiki/', T1.surname, ' ', T1.forename) AS wiki_link, T1.dob FROM drivers AS T1 WHERE T1.nationality = 'German' AND YEAR(T1.dob) BETWEEN 1971 AND 1985 ORDER BY T1.dob DESC	formula_1
SELECT T1.location, T1.country, T1.lat, T1.lng FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Hungaroring'	formula_1
SELECT T1.name, T1.nationality, SUM(T2.points) AS total_points FROM constructors AS T1 JOIN results AS T2 ON T1.constructorId = T2.constructorId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T3.name = 'Monaco Grand Prix' AND T3.year BETWEEN 1980 AND 2010 GROUP BY T1.constructorId ORDER BY total_points DESC LIMIT 1	formula_1
SELECT AVG(T2.points) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Turkish Grand Prix' AND T2.driverId IN (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')	formula_1
SELECT COUNT(*) / 10 AS average_races FROM races WHERE date BETWEEN '2000-01-01' AND '2010-12-31'	formula_1
SELECT nationality FROM drivers GROUP BY nationality ORDER BY COUNT(*) DESC LIMIT 1	formula_1
SELECT SUM(T1.points) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.rank = 91;	formula_1
SELECT T1.raceName FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.fastestLapSpeed = (SELECT MIN(fastestLapSpeed) FROM results WHERE fastestLapSpeed IS NOT NULL)	formula_1
SELECT T2.name, T2.location, T2.country FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.date = (SELECT MAX(date) FROM races)	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T3.year = 2008 AND T3.circuitId IN (SELECT circuitId FROM circuits WHERE name LIKE '%Marina Bay Street Circuit%') ORDER BY T2.q3 DESC LIMIT 1	formula_1
SELECT T1.forename, T1.surname, T1.nationality, T3.name FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T1.dob = (SELECT MAX(dob) FROM drivers) ORDER BY T1.dob DESC LIMIT 1	formula_1
SELECT COUNT(*) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Canadian Grand Prix' AND T1.statusId = 3 GROUP BY T1.driverId ORDER BY COUNT(*) DESC LIMIT 1	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.position = 1 ORDER BY T1.dob LIMIT 1	formula_1
SELECT MAX(T1.duration) FROM pitStops AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId AND T1.driverId = T2.driverId WHERE T2.rank = 1	formula_1
SELECT MIN(T1.time) FROM results AS T1 JOIN circuits AS T2 ON T1.raceId = T2.circuitId WHERE T2.name = 'Circuit of The Americas' AND T1.fastestLapTime IS NOT NULL ORDER BY T1.fastestLapTime LIMIT 1	formula_1
SELECT MAX(T1.duration) FROM pitStops AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId AND T1.driverId = T2.driverId WHERE T2.driverId = 18	formula_1
SELECT T2.lap FROM results AS T1 JOIN pitStops AS T2 ON T1.raceId = T2.raceId AND T1.driverId = T2.driverId WHERE T1.driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton') AND T1.raceId = (SELECT raceId FROM races WHERE year = 2011 AND name = 'Australian Grand Prix') GROUP BY T2.lap HAVING COUNT(*) > 0 ORDER BY COUNT(*) DESC LIMIT 1	formula_1
SELECT T2.duration FROM results AS T1 JOIN pitStops AS T2 ON T1.raceId = T2.raceId AND T1.driverId = T2.driverId WHERE T1.raceId = (SELECT raceId FROM races WHERE year = 2011 AND name = 'Australian Grand Prix')	formula_1
SELECT T1.fastestLapTime FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton' ORDER BY T1.fastestLapTime LIMIT 1	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.position <= 20 ORDER BY T2.milliseconds ASC LIMIT 1	formula_1
SELECT T2.position FROM results AS T1 JOIN circuits AS T2 ON T1.raceId = T2.circuitId WHERE T1.driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton') ORDER BY T1.fastestLapTime LIMIT 1	formula_1
SELECT MIN(T1.fastestLapTime) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Austrian Grand Prix' AND T1.fastestLapTime IS NOT NULL	formula_1
SELECT T1.name, MIN(T2.fastestLapTime) FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.country = 'Italy' GROUP BY T1.circuitId ORDER BY MIN(T2.fastestLapTime) ASC LIMIT 1	formula_1
SELECT T1.raceId FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Austrian Grand Prix' ORDER BY T2.fastestLapTime LIMIT 1	formula_1
SELECT T1.duration FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Austrian Grand Prix' AND T1.fastestLapTime = (SELECT MIN(T3.fastestLapTime) FROM results AS T3 JOIN races AS T4 ON T3.raceId = T4.raceId WHERE T4.name = 'Austrian Grand Prix')	formula_1
SELECT T2.lat, T2.lng FROM results AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.fastestLapTime = '1:29.488'	formula_1
SELECT AVG(T1.milliseconds) FROM pitStops AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton'	formula_1
SELECT AVG(T2.milliseconds) FROM races AS T1 JOIN lap_times AS T2 ON T1.raceId = T2.raceId WHERE T1.country = 'Italy' AND T2.milliseconds IS NOT NULL	formula_1
SELECT player_api_id FROM Player WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player) LIMIT 1;	european_football_2
SELECT name FROM Player WHERE height = (SELECT MAX(height) FROM Player) LIMIT 1;	european_football_2
SELECT T1.Preferred_Foot FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_fifa_api_id WHERE T2.potential = (SELECT MIN(potential) FROM Player_Attributes) GROUP BY T1.Preferred_Foot ORDER BY T2.potential LIMIT 1	european_football_2
SELECT COUNT(*) FROM Player WHERE overall_rating BETWEEN 60 AND 65 AND defensive_work_rate = 'low'	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE crossing IS NOT NULL ORDER BY crossing DESC LIMIT 5	european_football_2
SELECT L1.name FROM League AS L1 JOIN Match AS M1 ON L1.id = M1.league_id WHERE M1.season = '2015/2016' GROUP BY L1.id ORDER BY SUM(M1.home_team_goal + M1.away_team_goal) DESC LIMIT 1	european_football_2
SELECT T1.HomeTeam FROM `Match` AS T1 WHERE T1.Season = '2015/2016' AND (T1.FTHG - T1.FTAG) < 0 GROUP BY T1.HomeTeam ORDER BY COUNT(*) ASC LIMIT 1	european_football_2
SELECT player_name FROM `Player` WHERE penalties IS NOT NULL ORDER BY penalties DESC LIMIT 10	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id WHERE T2.league_id = (SELECT league_id FROM League WHERE name = 'Scotland Premier League') AND T2.season = '2009/2010' AND T2.away_team_goal > T2.home_team_goal GROUP BY T2.away_team_api_id ORDER BY COUNT(*) DESC LIMIT 1	european_football_2
SELECT T1.buildUpPlaySpeedAttack FROM Team AS T1 JOIN Match AS T2 ON T1.teamID = T2.homeTeamId WHERE T1.buildUpPlaySpeed IS NOT NULL ORDER BY T1.buildUpPlaySpeed DESC LIMIT 4	european_football_2
SELECT T1.name FROM League AS T1 JOIN Match AS T2 ON T1.id = T2.league_id WHERE T2.season = '2015/2016' GROUP BY T1.id ORDER BY SUM(T2.home_team_goal = T2.away_team_goal) DESC LIMIT 1	european_football_2
SELECT T1.player_id, (strftime('%Y', 'now') - strftime('%Y', T1.birthday)) AS age  FROM Player AS T1  JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_fifa_api_id  WHERE T2.sprint_speed >= 97 AND strftime('%Y', T2.date) BETWEEN '2013' AND '2015'	european_football_2
SELECT L.name, COUNT(M.league_id) AS total_matches FROM `League` AS L JOIN `Match` AS M ON L.id = M.league_id GROUP BY M.league_id ORDER BY total_matches DESC LIMIT 1	european_football_2
SELECT AVG(T1.height) FROM Player AS T1 WHERE T1.birthday >= '1990-01-01 00:00:00' AND T1.birthday < '1996-01-01 00:00:00'	european_football_2
SELECT api_id FROM Player_Attributes WHERE date LIKE '2010%' AND overall_rating > (SELECT AVG(overall_rating) FROM Player_Attributes WHERE date LIKE '2010%') ORDER BY overall_rating DESC LIMIT 1	european_football_2
SELECT team_fifa_api_id FROM Team WHERE buildUpPlaySpeed > 50 AND buildUpPlaySpeed < 60	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id OR T1.team_api_id = T2.away_team_api_id WHERE strftime('%Y', T2.date) = '2012' AND T1.buildUpPlayPassing > (SELECT AVG(buildUpPlayPassing) FROM Team WHERE buildUpPlayPassing IS NOT NULL)	european_football_2
SELECT CAST(SUM(CASE WHEN T2.preferred_foot = 'left' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.player_fifa_api_id) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE strftime('%Y', T2.birthday) BETWEEN '1987' AND '1992'	european_football_2
SELECT L1.id FROM (SELECT L.id, SUM(M.home_team_goal + M.away_team_goal) AS total_goals FROM League AS L JOIN Match AS M ON L.id = M.league_id GROUP BY L.id) AS L1 ORDER BY L1.total_goals ASC LIMIT 5	european_football_2
SELECT AVG(T1.long_shots) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.name = 'Ahmed Samir Farag' AND T1.long_shots IS NOT NULL	european_football_2
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_fifa_api_id WHERE T1.height > 180 AND T2.heading_accuracy IS NOT NULL GROUP BY T1.player_api_id ORDER BY SUM(T2.heading_accuracy) / COUNT(T2.player_fifa_api_id) DESC LIMIT 10	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id WHERE T2.date BETWEEN '2014-01-01 00:00:00' AND '2014-01-31 00:00:00' AND T1.buildUpPlayDribblingClass = 'Normal' AND T2.chanceCreationPassing < (SELECT AVG(chanceCreationPassing) FROM Match WHERE date BETWEEN '2014-01-01 00:00:00' AND '2014-01-31 00:00:00') ORDER BY T2.chanceCreationPassing DESC	european_football_2
SELECT T1.name FROM `League` AS T1 JOIN `Match` AS T2 ON T1.id = T2.league_id WHERE T2.season = '2009/2010' GROUP BY T1.id HAVING SUM(T2.home_team_goal) / COUNT(DISTINCT T2.id) > SUM(T2.away_team_goal) / COUNT(DISTINCT T2.id)	european_football_2
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers'	european_football_2
SELECT player_id FROM Player WHERE SUBSTR(birthday, 1, 7) = '1970-10'	european_football_2
SELECT T2.attacking_work_rate FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_fifa_api_id WHERE T1.player_name = 'Franco Zennaro' ORDER BY T2.date DESC LIMIT 1	european_football_2
SELECT T1.buildUpPlayPositioningClass FROM Match AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_long_name = 'ADO Den Haag' LIMIT 1	european_football_2
SELECT heading_accuracy FROM Player_Attributes WHERE player_fifa_api_id = (SELECT player_fifa_api_id FROM Player WHERE player_name = 'Francois Affolter') AND date = '2014-09-18 00:00:00'	european_football_2
SELECT AVG(T2.overall) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_fifa_api_id WHERE T1.player_name = 'Gabriel Tamas' AND strftime('%Y', T2.date) = '2011'	european_football_2
SELECT COUNT(*) FROM `Match` AS T1 JOIN League AS T2 ON T1.league_id = T2.id WHERE T2.name = 'Scotland Premier League' AND T1.season = '2015/2016'	european_football_2
SELECT T1.preferred_foot FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_fifa_api_id WHERE T2.date = (SELECT MIN(date) FROM Player_Attributes) ORDER BY T1.birthday DESC LIMIT 1	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE potential = (SELECT MAX(potential) FROM Player_Attributes)	european_football_2
SELECT COUNT(*) FROM Player WHERE weight < 130 AND preferred_foot = 'left'	european_football_2
SELECT T1.team_short_name FROM Team AS T1 JOIN Player_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.chanceCreationPassingClass = 'Risky' GROUP BY T1.team_short_name	european_football_2
SELECT T2.Defensive_work_rate FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_fifa_api_id WHERE T1.name = 'David Wilson' ORDER BY T2.date DESC LIMIT 1	european_football_2
SELECT T1.birthday FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes) GROUP BY T1.player_api_id ORDER BY T1.birthday ASC LIMIT 1	european_football_2
SELECT T1.name FROM League AS T1 JOIN Country AS T2 ON T1.country_id = T2.id WHERE T2.name = 'Netherlands'	european_football_2
SELECT AVG(T1.home_team_goal) FROM `Match` AS T1 JOIN Country AS T2 ON T1.country_id = T2.id WHERE T2.name = 'Poland' AND T1.season = '2010/2011'	european_football_2
SELECT AVG(T1.finishing) AS avg_finishing, T2.player_id FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.height = (SELECT MAX(height) FROM Player UNION SELECT MIN(height) FROM Player) GROUP BY T2.player_id ORDER BY avg_finishing DESC LIMIT 1	european_football_2
SELECT name FROM Player WHERE height > 180;	european_football_2
SELECT COUNT(*) FROM Player WHERE strftime('%Y', birthday) > '1990'	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Adam%' AND weight > 170;	european_football_2
SELECT DISTINCT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_fifa_api_id WHERE T2.overall_rating > 80 AND strftime('%Y', T2.date) BETWEEN '2008' AND '2010'	european_football_2
SELECT potential FROM Player WHERE name = 'Aaron Doran'	european_football_2
SELECT player_id FROM Player WHERE preferred_foot = 'left'	european_football_2
SELECT team_long_name FROM Team WHERE buildUpPlaySpeedClass = 'Fast'	european_football_2
SELECT buildUpPlayPassingClass FROM Team WHERE team_short_name = 'CLB'	european_football_2
SELECT team_short_name FROM Team WHERE buildUpPlayPassing > 70	european_football_2
SELECT AVG(T2.overall_rating) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_fifa_api_id WHERE T1.height > 170 AND strftime('%Y', T2.date) BETWEEN '2010' AND '2015'	european_football_2
SELECT MIN(Height) FROM Player WHERE Height IS NOT NULL	european_football_2
SELECT Country.name FROM Country JOIN League ON Country.id = League.country_id WHERE League.name = 'Italy Serie A'	european_football_2
SELECT team_short_name FROM Team WHERE buildUpPlaySpeed = 31 AND buildUpPlayDribbling = 53 AND buildUpPlayPassing = 32;	european_football_2
SELECT AVG(T1.overall_rating) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.name = 'Aaron Doran' AND T1.overall_rating IS NOT NULL	european_football_2
SELECT COUNT(*) FROM `Match` WHERE LeagueId = (SELECT LeagueId FROM League WHERE name = 'Germany 1. Bundesliga') AND strftime('%Y-%m', date) BETWEEN '2008-08' AND '2008-10';	european_football_2
SELECT T2.team_short_name FROM `Match` AS T1 JOIN `Team` AS T2 ON T1.home_team_api_id = T2.team_api_id WHERE T1.home_team_goal = 10	european_football_2
SELECT player_api_id FROM Player WHERE balance = (SELECT MAX(balance) FROM Player WHERE potential = 61) AND potential = 61;	european_football_2
SELECT (SUM(CASE WHEN T1.player_name = 'Abdou Diallo' THEN T1.ball_control ELSE 0 END) / COUNT(CASE WHEN T1.player_name = 'Abdou Diallo' THEN T1.id ELSE NULL END)) - (SUM(CASE WHEN T1.player_name = 'Aaron Appindangoye' THEN T1.ball_control ELSE 0 END) / COUNT(CASE WHEN T1.player_name = 'Aaron Appindangoye' THEN T1.id ELSE NULL END)) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.ball_control IS NOT NULL AND T2.player_name IN ('Abdou Diallo', 'Aaron Appindangoye')	european_football_2
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN'	european_football_2
SELECT CASE WHEN T1.Birthday < T2.Birthday THEN 'Aaron Lennon' ELSE 'Abdelaziz Barrada' END AS OlderPlayer FROM Player AS T1 WHERE T1.Name = 'Aaron Lennon' UNION SELECT CASE WHEN T1.Birthday > T2.Birthday THEN 'Aaron Lennon' ELSE 'Abdelaziz Barrada' END AS OlderPlayer FROM Player AS T2 WHERE T2.Name = 'Abdelaziz Barrada' LIMIT 1	european_football_2
SELECT MAX(Height) FROM Player WHERE Height IS NOT NULL	european_football_2
SELECT COUNT(*) FROM Player WHERE preferred_foot = 'left' AND attacking_work_rate = 'low'	european_football_2
SELECT Country.name FROM Country JOIN League ON Country.id = League.country_id WHERE League.name = 'Belgium Jupiler League'	european_football_2
SELECT T1.name FROM League AS T1 JOIN Country AS T2 ON T1.country_id = T2.id WHERE T2.name = 'Germany'	european_football_2
SELECT player_id FROM Player WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player) LIMIT 1	european_football_2
SELECT DISTINCT COUNT(T1.player_id) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_fifa_api_id WHERE strftime('%Y', T1.birthday) < '1986' AND T2.defensive_work_rate = 'High'	european_football_2
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_fifa_api_id WHERE T1.player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone') AND T2.crossing IS NOT NULL ORDER BY T2.crossing DESC LIMIT 1	european_football_2
SELECT T2.Heading_Accuracy FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_fifa_api_id WHERE T1.player_name = 'Ariel Borysiuk' ORDER BY T2.date DESC LIMIT 1	european_football_2
SELECT COUNT(*) FROM Player WHERE height > 180 AND volleys > 70;	european_football_2
SELECT name FROM Player WHERE volleys > 70 AND dribbling > 70;	european_football_2
SELECT COUNT(*) FROM `Match` AS T1 JOIN Country AS T2 ON T1.country_id = T2.id WHERE T2.name = 'Belgium' AND T1.season = '2008/2009'	european_football_2
SELECT MAX(T1.long_passing) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_fifa_api_id WHERE T2.long_passing IS NOT NULL ORDER BY T1.birthday ASC LIMIT 1	european_football_2
SELECT COUNT(*) FROM `Match` WHERE LeagueId = (SELECT LeagueId FROM League WHERE name = 'Belgium Jupiler League') AND SUBSTR(date, 1, 7) = '2009-04'	european_football_2
SELECT L.league_name FROM `League` AS L JOIN `Match` AS M ON L.id = M.league_id WHERE M.season = '2008/2009' GROUP BY L.league_name ORDER BY COUNT(M.id) DESC LIMIT 1;	european_football_2
SELECT AVG(T1.overall_rating) FROM Player AS T1 WHERE strftime('%Y', T1.birthday) < '1986'	european_football_2
SELECT (T1.overall_rating - T2.overall_rating) / T2.overall_rating * 100 AS percentage_difference FROM Player_Attributes AS T1 JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.player_name = 'Ariel Borysiuk' AND T2.player_name = 'Paulin Puel'	european_football_2
SELECT AVG(T1.buildUpPlaySpeed) FROM Team AS T1 WHERE T1.team_long_name = 'Heart of Midlothian'	european_football_2
SELECT AVG(T1.overall_rating) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Pietro Marino' AND T1.overall_rating IS NOT NULL	european_football_2
SELECT SUM(T2.crossing) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_fifa_api_id WHERE T1.player_name = 'Aaron Lennox' AND T2.crossing IS NOT NULL	european_football_2
SELECT MAX(T1.chanceCreationPassing), T1.chanceCreationPassingClass FROM `Match` AS T1 JOIN `Team` AS T2 ON T1.home_team_api_id = T2.team_api_id WHERE T2.team_long_name = 'Ajax' AND T1.chanceCreationPassing IS NOT NULL ORDER BY T1.chanceCreationPassing DESC LIMIT 1	european_football_2
SELECT preferred_foot FROM Player WHERE player_name = 'Abdou Diallo'	european_football_2
SELECT MAX(T2.overall_rating) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Dorlan Pabon' AND T1.overall_rating IS NOT NULL	european_football_2
SELECT AVG(T1.away_team_goal) FROM `Match` AS T1 JOIN `League` AS T2 ON T1.league_id = T2.league_id WHERE T1.away_team = 'Parma' AND T2.country = 'Italy'	european_football_2
SELECT player_name FROM Player WHERE overall_rating = 77 AND date LIKE '2016-06-23%' ORDER BY birthday LIMIT 1	european_football_2
SELECT overall_rating FROM Player_Attributes WHERE player_name = 'Aaron Mooy' AND date LIKE '2016-02-04%' LIMIT 1	european_football_2
SELECT T1.potential FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_fifa_api_id WHERE T1.player_name = 'Francesco Parravicini' AND T2.date = '2010-08-30 00:00:00'	european_football_2
SELECT attacking_work_rate FROM Player_Attributes WHERE player_name = 'Francesco Migliore' AND date LIKE '2015-05-01%' LIMIT 1	european_football_2
SELECT defensive_work_rate FROM Player_Attributes WHERE player_name = 'Kevin Berigaud' AND date = '2013-02-22 00:00:00'	european_football_2
SELECT T1.date FROM `Match` AS T1 JOIN Player_Attributes AS T2 ON T1.player_id = T2.player_fifa_api_id WHERE T2.player_name = 'Kevin Constant' ORDER BY T2.crossing DESC LIMIT 1	european_football_2
SELECT T1.build_up_play_speed FROM `Match` AS T1 JOIN `Team` AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_long_name = 'Willem II' AND T1.date = '2011-02-22'	european_football_2
SELECT T1.buildUpPlayDribblingClass FROM `Match` AS T1 JOIN Team AS T2 ON T1.teamID = T2.teamID WHERE T2.teamShortName = 'LEI' AND T1.date = '2015-09-10 00:00:00'	european_football_2
SELECT T1.build_up_play_passing_class FROM `Match` AS T1 JOIN `Team` AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_long_name = 'FC Lorient' AND T1.date LIKE '2010-02-22%'	european_football_2
SELECT T2.chance_creation_passing FROM `Match` AS T1 JOIN `Team_Attributes` AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.date = '2013-09-20 00:00:00' AND T2.team_long_name = 'PEC Zwolle'	european_football_2
SELECT T2.chance_creation_crossing FROM `Match` AS T1 JOIN `Team_Attributes` AS T2 ON T1.team_api_id = T2.team_fifa_api_id WHERE T1.date = '2010-02-22 00:00:00' AND T2.team_long_name = 'Hull City'	european_football_2
SELECT T1.defence_aggression FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id WHERE T1.team_long_name = 'Hannover 96' AND T2.date LIKE '2015-09-10%'	european_football_2
SELECT AVG(T1.overall_rating) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Marko Arnautovic' AND SUBSTR(T1.date, 1, 10) BETWEEN '2007-02-22' AND '2016-04-21'	european_football_2
SELECT (T1.overall_rating - T2.overall_rating) / T1.overall_rating * 100 AS percentage_difference FROM Player_Attributes AS T1 JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.player_name = 'Landon Donovan' AND T2.player_name = 'Jordan Bowery' AND T1.date = '2013-07-12' AND T2.date = '2013-07-12';	european_football_2
SELECT name FROM Player WHERE height = (SELECT MAX(height) FROM Player WHERE height IS NOT NULL) LIMIT 1	european_football_2
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10	european_football_2
SELECT name FROM Player WHERE datetime('now') - datetime(birthday) > '34'	european_football_2
SELECT COUNT(T2.home_team_goal) FROM player AS T1 JOIN match AS T2 ON T1.match_id = T2.match_id WHERE T1.player_name = 'Aaron Lennon' AND T1.is_home = 1	european_football_2
SELECT SUM(T2.goals) FROM player AS T1 JOIN goal AS T2 ON T1.player_id = T2.player_id WHERE T1.player_name IN ('Daan Smith', 'Filipe Ferreira') AND T2.match_id IN (SELECT match_id FROM `Match` WHERE home_team_api_id = 1 OR away_team_api_id = 1)	european_football_2
SELECT SUM(T1.home_team_goal) FROM match AS T1 JOIN player AS T2 ON T1.home_team = T2.team_id WHERE (datetime('now') - datetime(T2.birthday)) / 365 < 31	european_football_2
SELECT player_name FROM Player WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player) LIMIT 1	european_football_2
SELECT name FROM Player WHERE potential = (SELECT MAX(potential) FROM Player) LIMIT 1;	european_football_2
SELECT player_name FROM Player WHERE attacking_work_rate = 'high'	european_football_2
SELECT name FROM Player WHERE finishing = 1 ORDER BY (datetime('now') - datetime(birthday)) DESC LIMIT 1	european_football_2
SELECT player_name FROM Player WHERE country = 'Belgium'	european_football_2
SELECT T1.country FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.vision > 89 GROUP BY T1.country	european_football_2
SELECT CTRY.id FROM (SELECT Country.id AS ctry_id, AVG(Player.weight) AS avg_weight FROM Player JOIN Country ON Player.country = Country.name GROUP BY ctry_id) AS CTRY WHERE CTRY.avg_weight = (SELECT MAX(avg_weight) FROM (SELECT Country.id AS ctry_id, AVG(Player.weight) AS avg_weight FROM Player JOIN Country ON Player.country = Country.name GROUP BY ctry_id) AS SubQuery)	european_football_2
SELECT T2.team_long_name FROM Team_Attributes AS T1 JOIN Teams AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlaySpeedClass = 'Slow' GROUP BY T2.team_long_name	european_football_2
SELECT DISTINCT T1.team_short_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id OR T1.team_api_id = T2.away_team_api_id WHERE T2.chanceCreationPassingClass = 'Safe'	european_football_2
SELECT AVG(T1.Height) FROM Player AS T1 JOIN Country AS T2 ON T1.Country = T2.id WHERE T2.Name = 'Italy' AND T1.Height IS NOT NULL	european_football_2
SELECT player_name FROM Player WHERE height > 180 ORDER BY player_name LIMIT 3	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND YEAR(birthday) > 1990;	european_football_2
SELECT (T1.jumping WHERE T1.id = 6) - (T1.jumping WHERE T1.id = 23) FROM Player AS T1 JOIN Match AS T2 ON T1.team_id = T2.home_team_id WHERE T2.season = '2008/2009' AND T2.match_date = '2008-08-16 00:00:00'	european_football_2
SELECT player_api_id FROM Player WHERE preferred_foot = 'right' AND potential IN (SELECT MIN(potential) FROM Player WHERE preferred_foot = 'right' GROUP BY player_api_id ORDER BY potential ASC LIMIT 5)	european_football_2
SELECT COUNT(*) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_fifa_api_id WHERE T2.crossing = (SELECT MAX(crossing) FROM Player_Attributes WHERE preferred_foot = 'left') AND T1.preferred_foot = 'left'	european_football_2
SELECT CAST(SUM(CASE WHEN T2.stamina > 80 AND T2.strength > 80 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.player_id) FROM `Match` AS T1 JOIN `Player_Attributes` AS T2 ON T1.home_team_api_id = T2.player_fifa_api_id WHERE T2.stamina IS NOT NULL AND T2.strength IS NOT NULL;	european_football_2
SELECT Country FROM League WHERE name = 'Poland Ekstraklasa'	european_football_2
SELECT T1.home_team_goal, T1.away_team_goal FROM `Match` AS T1 JOIN `League` AS T2 ON T1.league_id = T2.id WHERE T2.name = 'Belgium Jupiler League' AND T1.date LIKE '2008-09-24%'	european_football_2
SELECT sprint_speed, agility, acceleration FROM Player WHERE player_name = 'Alexis Blin'	european_football_2
SELECT T1.buildUpPlaySpeedClass FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id WHERE T1.team_long_name = 'KSV Cercle Brugge' UNION SELECT T1.buildUpPlaySpeedClass FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id WHERE T1.team_long_name = 'KSV Cercle Brugge'	european_football_2
SELECT COUNT(*) FROM `Match` WHERE season = '2015/2016' AND league_id = (SELECT id FROM League WHERE name = 'Italian Serie A')	european_football_2
SELECT MAX(T1.home_team_goal) FROM `Match` AS T1 JOIN `League` AS T2 ON T1.league_id = T2.id WHERE T2.country = 'Netherlands' AND T2.name = 'Eredivisie'	european_football_2
SELECT T1.finishing, T1.curve FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.weight = (SELECT MAX(weight) FROM Player) LIMIT 1;	european_football_2
SELECT T1.name FROM League AS T1 JOIN Match AS T2 ON T1.id = T2.league_id WHERE T2.season = '2015/2016' GROUP BY T1.id ORDER BY COUNT(T2.id) DESC LIMIT 4	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id WHERE T2.away_team_goal = (SELECT MAX(away_team_goal) FROM `Match`) LIMIT 1;	european_football_2
SELECT player_name FROM Player WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player) LIMIT 1	european_football_2
SELECT CAST(SUM(CASE WHEN T1.height < 180 AND T1.overall_rating > 70 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.height IS NOT NULL AND T1.overall_rating IS NOT NULL	european_football_2
SELECT CASE WHEN (SELECT COUNT(*) FROM HospitalAdmission WHERE SEX = 'M' AND Admission = '+') > (SELECT COUNT(*) FROM HospitalAdmission WHERE SEX = 'M' AND Admission = '-') THEN 'In-patient' ELSE 'Outpatient' END AS Result, ABS((SELECT COUNT(*) FROM HospitalAdmission WHERE SEX = 'M' AND Admission = '+') - (SELECT COUNT(*) FROM HospitalAdmission WHERE SEX = 'M' AND Admission = '-')) / NULLIF((SELECT COUNT(*) FROM HospitalAdmission WHERE SEX = 'M'), 0) * 100 AS Deviation_Percentage	thrombosis_prediction
SELECT COUNT(T1.ID) * 100 / (SELECT COUNT(*) FROM Patient WHERE Sex = 'F') AS percentage FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.Patient WHERE YEAR(T1.Birthday) > 1930 AND T1.Sex = 'F'	thrombosis_prediction
SELECT COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Patient WHERE YEAR(Birthday) BETWEEN '1930-01-01' AND '1940-12-31') FROM Patient WHERE Admission = '+' AND YEAR(Birthday) BETWEEN '1930-01-01' AND '1940-12-31'	thrombosis_prediction
SELECT CAST(COUNT(T1.ID) AS REAL) / COUNT(T2.ID) FROM (SELECT * FROM patient WHERE Diagnosis = 'SLE' AND Admission = '+') T1, (SELECT * FROM patient WHERE Diagnosis = 'SLE' AND Admission = '-') T2;	thrombosis_prediction
SELECT T1.diagnosis, T2.date FROM diagnosis AS T1 JOIN laboratory AS T2 ON T1.patient = T2.patient WHERE T1.patient = 30609 ORDER BY T2.date ASC	thrombosis_prediction
SELECT T1.Sex, T1.BirthDate, T2.Examination_Date, T2.Symptom FROM Patient AS T1 JOIN Examination AS T2 ON T1.Patient_ID = T2.Patient_ID WHERE T1.Patient_ID = 163109;	thrombosis_prediction
SELECT T1.patient, T1.sex, T1.birthdate FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.patient = T2.patient WHERE T2.LDH > 500;	thrombosis_prediction
SELECT T1.patient_id, TIMESTAMPDIFF(YEAR, T2.birthday, CURRENT_TIMESTAMP) AS age FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.patient_id = T2.patient_id WHERE T1.RVVT = '+'	thrombosis_prediction
SELECT T1.patienthealthsystemstayid, T1.gender, T2.diagnosis FROM patient AS T1 JOIN diagnosis AS T2 ON T1.uniquepid = T2.uniquepid WHERE T1.thrombosis = 2 AND T2.diagnosis IS NOT NULL GROUP BY T1.patienthealthsystemstayid, T1.gender, T2.diagnosis ORDER BY T1.patienthealthsystemstayid	thrombosis_prediction
SELECT patient FROM `Laboratory` WHERE year(birthday) = '1937' AND `T-CHO` >= '250'	thrombosis_prediction
SELECT T1.patienthealthidentifier, T1.sex, T2.diagnosis FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.patienthealthidentifier = T2.patienthealthidentifier WHERE T2.ALB < 3.5;	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T2.sex = 'F' AND (T1.TP < 6 OR T1.TP > 8.5) THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM `Laboratory` AS T1 JOIN `Patients` AS T2 ON T1.patient = T2.patient WHERE T1.TP IS NOT NULL AND T2.sex IS NOT NULL	thrombosis_prediction
SELECT AVG(T2.aCL_IgG) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.patient_id = T2.patient_id WHERE T1.Admisson = '+' AND (YEAR(CURDATE()) - YEAR(T1.Birthday)) >= 50	thrombosis_prediction
SELECT COUNT(*) FROM (SELECT * FROM patient WHERE sex = 'F') AS T1 JOIN (SELECT * FROM stay WHERE year(Description) = 1997 AND Admission = '-') AS T2 ON T1.patient_id = T2.patient_id	thrombosis_prediction
SELECT MIN(T1.age) FROM `Patients` AS T1 JOIN `Laboratory` AS T2 ON T1.patient = T2.patient WHERE T2.`First Date` = '1991-09-19'	thrombosis_prediction
SELECT COUNT(*) FROM `Laboratory` AS T1 JOIN `Patients` AS T2 ON T1.patient = T2.id WHERE T1.Thrombosis = 1 AND T1.date LIKE '1997%' AND T2.sex = 'F'	thrombosis_prediction
SELECT MAX(T1.age) - MIN(T1.age) FROM patient AS T1 JOIN laboratory AS T2 ON T1.patienthealthsystemstayid = T2.patienthealthsystemstayid WHERE T2.tg >= 200 AND T1.age IS NOT NULL GROUP BY T1.uniquepid	thrombosis_prediction
SELECT T1.symptoms, T1.diagnosis FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.patient_id = T2.patient_id WHERE T1.birthday = (SELECT MIN(birthday) FROM `Patient` WHERE symptoms IS NOT NULL) AND T2.observation_date = (SELECT MIN(observation_date) FROM `Laboratory` WHERE patient_id = (SELECT patient_id FROM `Patient` WHERE birthday = (SELECT MIN(birthday) FROM `Patient` WHERE symptoms IS NOT NULL)))	thrombosis_prediction
SELECT COUNT(T1.ID) / 12 AS average_tests_per_month FROM `Laboratory` AS T1 JOIN `Patient` AS T2 ON T1.Patient = T2.ID WHERE T2.SEX = 'M' AND T1.Date BETWEEN '1998-01-01' AND '1998-12-31'	thrombosis_prediction
SELECT T1.FirstDate FROM (SELECT Patient, MIN(FirstDate) AS FirstDate FROM Visit GROUP BY Patient) AS T1 JOIN Diagnosis AS T2 ON T1.Patient = T2.Patient WHERE T2.Diagnosis = 'SJS' ORDER BY (YEAR(T1.FirstDate) - YEAR((SELECT Birthday FROM Patient WHERE ID = T1.Patient))) DESC LIMIT 1	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T2.SEX = 'M' AND T1.UA <= 8 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T2.SEX = 'F' AND T1.UA <= 6.5 THEN 1 ELSE 0 END) FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.patient = T2.patient WHERE T1.UA IS NOT NULL AND T2.SEX IS NOT NULL	thrombosis_prediction
SELECT COUNT(DISTINCT T1.patient) FROM patient AS T1 JOIN laboratory AS T2 ON T1.patient = T2.patient WHERE T2.examinationdate - T1.firstvisit > INTERVAL 1 YEAR	thrombosis_prediction
SELECT COUNT(DISTINCT T1.patient) FROM patient AS T1 JOIN laboratory AS T2 ON T1.patient = T2.patient WHERE YEAR(T1.birthday) + 18 > YEAR(T2.examinationdate) AND YEAR(T2.examinationdate) BETWEEN 1990 AND 1993	thrombosis_prediction
SELECT COUNT(*) FROM `Laboratory` WHERE `T-BIL` >= '2.0' AND PATIENT = (SELECT PATIENT FROM `Patient` WHERE SEX = 'M')	thrombosis_prediction
SELECT Diagnosis FROM `Laboratory` WHERE `Examination Date` BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY Diagnosis ORDER BY COUNT(*) DESC LIMIT 1	thrombosis_prediction
SELECT AVG(T1.year_of_birth + 1999 - T2.lab_test_date) FROM patient AS T1 JOIN laboratory AS T2 ON T1.patient_id = T2.patient_id WHERE T2.lab_test_date BETWEEN '1991-10-01' AND '1991-10-30'	thrombosis_prediction
SELECT T1.age, T2.diagnosis FROM (SELECT patient.patientid, TIMESTAMPDIFF(YEAR, patient.birthdate, examination.date) AS age FROM patient JOIN examination ON patient.patientid = examination.patientid WHERE examination.hgb = (SELECT MAX(examination.hgb) FROM examination)) AS T1 JOIN (SELECT patient.patientid, diagnosis.diagnosi FROM patient JOIN diagnosis ON patient.patientid = diagnosis.patientid) AS T2 ON T1.patientid = T2.patientid	thrombosis_prediction
SELECT T1.ANA FROM `Laboratory` AS T1 JOIN `Patients` AS T2 ON T1.Patient_ID = T2.Patient_ID WHERE T1.Examination_Date = '1996-12-02' AND T2.Patient_ID = 3605340	thrombosis_prediction
SELECT L.total_cholesterol_status FROM Laboratory AS L WHERE L.patient_id = 2927464 AND L.specimen_datetime = '1995-09-04' AND L.total_cholesterol < 250 LIMIT 1;	thrombosis_prediction
SELECT T1.SEX FROM patient AS T1 JOIN diagnosis AS T2 ON T1.patienthealthsystemstayid = T2.patienthealthsystemstayid WHERE T2.diagnosisname = 'AORTITIS' ORDER BY T1.patienthealthsystemstayid LIMIT 1	thrombosis_prediction
SELECT T2.aCL_IgM FROM Diagnosis AS T1 JOIN Laboratory AS T2 ON T1.patient = T2.patient WHERE T1.Diagnosis = 'SLE' AND T1.Description = '1994-02-19' AND T2.Exam_Date = '1993/11/12'	thrombosis_prediction
SELECT CASE WHEN T1.SEX = 'M' THEN 'man' ELSE 'women' END FROM patient AS T1 JOIN laboratory AS T2 ON T1.patienthealthsystemstayid = T2.patienthealthsystemstayid WHERE T2.Date = '1992-06-12' AND T2.GPT = '9'	thrombosis_prediction
SELECT T2.age FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.patient = T2.patient WHERE T1.Date = '1991-10-21' AND T1.UA = '8.4'	thrombosis_prediction
SELECT COUNT(T2.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.Patient_ID = T2.Patient_ID WHERE T1.First_Date = '1991-06-13' AND T1.Diagnosis = 'SJS' AND YEAR(T2.Date) = 1995	thrombosis_prediction
SELECT T1.diagnosis FROM patient AS T1 JOIN stay AS T2 ON T1.patient_id = T2.patient_id WHERE T1.patient_id = (SELECT patient_id FROM diagnosis WHERE diagnosis = 'SLE' AND examination_date = '1997-01-27') ORDER BY T1.first_date LIMIT 1	thrombosis_prediction
SELECT T2.diagnosis FROM patient AS T1 JOIN encounter AS T2 ON T1.patient = T2.patient WHERE T1.birthdate = '1959-03-01' AND T2.encounter = 27654 AND T2.encounter_date = '1993-09-27'	thrombosis_prediction
SELECT (SUM(CASE WHEN T1.Birthday = '1959-02-18' AND T2.Date LIKE '1981-11-%' THEN T2.`T-CHO` ELSE 0 END) - SUM(CASE WHEN T1.Birthday = '1959-02-18' AND T2.Date LIKE '1981-12-%' THEN T2.`T-CHO` ELSE 0 END)) / SUM(CASE WHEN T1.Birthday = '1959-02-18' AND T2.Date LIKE '1981-11-%' THEN T2.`T-CHO` ELSE 0 END) FROM patient AS T1 JOIN Laboratory AS T2 ON T1.patient_id = T2.patient_id WHERE T2.`T-CHO` IS NOT NULL	thrombosis_prediction
SELECT T1.patient FROM patient AS T1 JOIN diagnosis AS T2 ON T1.patient = T2.patient WHERE T2.diagnosis = 'Behcet' AND YEAR(T2.description) BETWEEN 1997 AND 1997	thrombosis_prediction
SELECT Patient FROM `Laboratory` WHERE Date BETWEEN '1987-07-06' AND '1996-01-31' AND GPT > 30 AND ALB < 4	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND YEAR(Birthday) = 1964 AND Admission = '+'	thrombosis_prediction
SELECT COUNT(*) FROM `Laboratory` WHERE `Thrombosis` = 2 AND ANA = 'S' AND `aCL IgM` > (SELECT AVG(`aCL IgM`) * 1.2 FROM `Laboratory`)	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN UA <= 6.5 THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN `U-PRO` > 0 AND `U-PRO` < 30 THEN 1 ELSE 0 END) FROM Laboratory WHERE `U-PRO` IS NOT NULL AND UA IS NOT NULL	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T2.DIAGNOSIS = 'BEHCET' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.PERSON_ID) FROM `Patient` AS T1 JOIN `Diagnosis` AS T2 ON T1.PERSON_ID = T2.PERSON_ID WHERE YEAR(T1.FIRST_DATE) = '1981' AND T1.SEX = 'M'	thrombosis_prediction
SELECT T1.patient FROM patient AS T1 JOIN laboratory AS T2 ON T1.patient = T2.patient WHERE T1.admission = '-' AND T2.date LIKE '1991-10%' AND T2.t_bil < 2.0 GROUP BY T1.patient HAVING COUNT(*) > 0	thrombosis_prediction
SELECT COUNT(*) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.patienthealthsystemstayid = T2.patienthealthsystemstayid WHERE T1.sex = 'F' AND YEAR(T1.birthdate) BETWEEN 1980 AND 1989 AND T2.anapattern != 'P'	thrombosis_prediction
SELECT T1.sex FROM patient AS T1 JOIN diagnosis AS T2 ON T1.patienthealthnumber = T2.patienthealthnumber JOIN laboratory AS T3 ON T1.patienthealthnumber = T3.patienthealthnumber WHERE T2.diagnosisname = 'PSS' AND T3.CRP > 2 AND T3.CRE = 1 AND T3.LDH = 123	thrombosis_prediction
SELECT AVG(T1.ALB) FROM `Laboratory` AS T1 JOIN `Diagnosis` AS T2 ON T1.Patient = T2.Patient WHERE T1.SEX = 'F' AND T1.PLT > 400 AND T2.Diagnosis = 'SLE'	thrombosis_prediction
SELECT T2.sign FROM diagnosis AS T1 JOIN patient AS T2 ON T1.patient = T2.id WHERE T1.diagnosis = 'SLE' GROUP BY T2.sign ORDER BY COUNT(*) DESC LIMIT 1	thrombosis_prediction
SELECT T1.charttime, T2.diagnosis FROM `Laboratory` AS T1 JOIN `Diagnoses` AS T2 ON T1.id = T2.id WHERE T1.id = 48473 ORDER BY T1.charttime LIMIT 1	thrombosis_prediction
SELECT COUNT(*) FROM `Diagnosis` AS T1 JOIN `Patient` AS T2 ON T1.Patient = T2.Patient WHERE T2.SEX = 'F' AND T1.Diagnosis = 'APS'	thrombosis_prediction
SELECT COUNT(*) FROM `Laboratory` WHERE YEAR(`DATE`) = '1997' AND (tp < 6 OR tp > 8.5)	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T2.Diagnosis LIKE '%thrombocytopenia%' THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T2.Diagnosis LIKE '%SLE%' THEN 1 ELSE 0 END) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.Patient_ID = T2.Patient_ID WHERE T2.Date BETWEEN '1991-09-19' AND '1991-09-21'	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T2.SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.SEX) FROM Diagnosis AS T1 JOIN Patient AS T2 ON T1.PATIENT = T2.PATIENT WHERE YEAR(T2.BIRTHDAY) = '1980' AND T1.DIAGNOSIS = 'RA';	thrombosis_prediction
SELECT COUNT(*) FROM `Laboratory` AS T1 JOIN `Diagnosis` AS T2 ON T1.Patient = T2.Patient WHERE T1.`Examination Date` BETWEEN '1995' AND '1997' AND T2.Diagnosis = 'Behcet disease' AND T1.SEX = 'M' AND T1.Admission = '-'	thrombosis_prediction
SELECT COUNT(*) FROM `Laboratory` WHERE WBC < 3.5 AND PATIENT = (SELECT PATIENT FROM `Patient` WHERE SEX = 'F')	thrombosis_prediction
SELECT DATEDIFF(T1.ExaminationDate, T2.FirstDate) FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.Patient = T2.PatientNumber WHERE T2.PatientNumber = 821298 ORDER BY T1.ExaminationDate LIMIT 1	thrombosis_prediction
SELECT CASE WHEN (T1.SEX = 'M' AND T2.UA > 8.0) OR (T1.SEX = 'F' AND T2.UA > 6.5) THEN 'Yes' ELSE 'No' END AS Is_Uric_Acid_Normal FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.patienthealthsystemstayid = T2.patienthealthsystemstayid WHERE T1.uniquepid = 57266 AND T2.UA IS NOT NULL	thrombosis_prediction
SELECT T1.DATE FROM `Laboratory` AS T1 WHERE T1.PATIENT = 48473 AND T1."AST glutamic oxaloacetic transaminase (GOT)" >= 60 ORDER BY T1.DATE LIMIT 1	thrombosis_prediction
SELECT T1.patienthealthsystemstayid, T2.sex, T2.dateofbirth FROM laboratory AS T1 JOIN patient AS T2 ON T1.patientunitstayid = T2.patientunitstayid WHERE YEAR(T1.labresulttime) = 1994 AND T1.labname = 'ast glutamic oxaloacetic transaminase (got)' AND T1.labresult < 60	thrombosis_prediction
SELECT Patient FROM Laboratory WHERE GPT >= 60 AND SEX = 'M' AND Patient IN (SELECT Patient FROM Laboratory WHERE GPT >= 60) GROUP BY Patient HAVING COUNT(*) > 1;	thrombosis_prediction
SELECT T1.diagnosis FROM patient AS T1 JOIN laboratory AS T2 ON T1.patienthealthsystemstayid = T2.patienthealthsystemstayid WHERE T2.gpt > 60 ORDER BY T1.birthdate ASC;	thrombosis_prediction
SELECT AVG(LDH) FROM `Laboratory` WHERE LDH < 500 AND LDH IS NOT NULL	thrombosis_prediction
SELECT T1.patienthealthsystemstayid, T2.age FROM laboratory AS T1 JOIN patient AS T2 ON T1.patientunitstayid = T2.patientunitstayid WHERE T1.labname = 'ld' AND T1.labresultnumeric BETWEEN 600 AND 800	thrombosis_prediction
SELECT T1.admission FROM `Laboratory` AS T1 JOIN `Patients` AS T2 ON T1.patient = T2.patient WHERE T1.ALP < 300 AND T2.death = '0' GROUP BY T1.admission HAVING COUNT(T1.ALP) > 0	thrombosis_prediction
SELECT T1.patient FROM patient AS T1 JOIN laboratory AS T2 ON T1.uniquepid = T2.uniquepid WHERE T1.birthdate = '1982-04-01' AND T2.alp < 300 LIMIT 1	thrombosis_prediction
SELECT T1.patienthealthsystemstayid, T2.gender, T2.dateofbirth FROM laboratory AS T1 JOIN patient AS T2 ON T1.patientunitstayid = T2.patientunitstayid WHERE T1.labname = 'tp' AND T1.labresult < 6.0	thrombosis_prediction
SELECT SUBTRACT(TP, 8.5) FROM Laboratory WHERE SEX = 'F' AND TP > 8.5 AND TP IS NOT NULL	thrombosis_prediction
SELECT T1.patienthealthsystemstayid FROM patient AS T1 JOIN laboratory AS T2 ON T1.patientuniquepid = T2.patientuniquepid WHERE (T2.labresult < 3.5 OR T2.labresult > 5.5) AND T1.sex = 'M' ORDER BY T1.birhtdate DESC	thrombosis_prediction
SELECT CASE WHEN ALB BETWEEN 3.5 AND 5.5 THEN 'Yes' ELSE 'No' END AS AlbuminInRange FROM Laboratory WHERE STRFTIME('%Y', Birthday) = '1982';	thrombosis_prediction
SELECT COUNT(*) * 100 / (SELECT COUNT(*) FROM `Laboratory` WHERE Sex = 'F') FROM `Laboratory` WHERE Sex = 'F' AND CASE WHEN Uric_Acid > 6.5 THEN 1 ELSE NULL END IS NOT NULL	thrombosis_prediction
SELECT AVG(T2.UA) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.patient_id = T2.patient_id WHERE (T2.SEX = 'M' AND T2.UA < 8.0) OR (T2.SEX = 'F' AND T2.UA < 6.5)	thrombosis_prediction
SELECT T1.patient_id, T1.sex, T1.birthday FROM patient AS T1 JOIN laboratory AS T2 ON T1.patient_id = T2.patient_id WHERE T2.urea_nitrogen = 29 AND T2.urea_nitrogen IS NOT NULL	thrombosis_prediction
SELECT T1.patient_id, T1.sex, T1.birthday FROM patient AS T1 JOIN diagnosis AS T2 ON T1.patient_id = T2.patient_id WHERE T2.diagnosis = 'RA' AND T1.un < 30;	thrombosis_prediction
SELECT COUNT(*) FROM `Laboratory` WHERE `CREATININE` >= 1.5 AND `PATIENT_ID` IN (SELECT `PATIENT_ID` FROM `Patient` WHERE `SEX` = 'M')	thrombosis_prediction
SELECT (SELECT COUNT(*) FROM Laboratory WHERE Creatinine >= 1.5 AND PatientID IN (SELECT PatientID FROM Demographics WHERE Sex = 'M')) > (SELECT COUNT(*) FROM Laboratory WHERE Creatinine >= 1.5 AND PatientID IN (SELECT PatientID FROM Demographics WHERE Sex = 'F'))	thrombosis_prediction
SELECT T1.patienthealthsystemstayid, T2.sex, T2.birthera FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.patientunitstayid = T2.patientunitstayid WHERE T1.labname = 't-bil' ORDER BY T1.labresult DESC LIMIT 1	thrombosis_prediction
SELECT T1.sex, GROUP_CONCAT(DISTINCT T1.id) FROM patient AS T1 INNER JOIN laboratory AS T2 ON T1.id = T2.patient WHERE T2.t_bil > 2.0 GROUP BY T1.sex	thrombosis_prediction
SELECT patient_id, MAX(T_CHO) FROM Laboratory WHERE T_CHO IS NOT NULL ORDER BY birthday ASC LIMIT 1	thrombosis_prediction
SELECT AVG(T1.age) FROM patient AS T1 JOIN laboratory AS T2 ON T1.patienthealthsystemstayid = T2.patienthealthsystemstayid WHERE T1.gender = 'M' AND T2.tcho > 250	thrombosis_prediction
SELECT T1.patient FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.patient = T2.patient WHERE T2.triglyceride > 300 GROUP BY T1.patient HAVING COUNT(*) > 0	thrombosis_prediction
SELECT COUNT(DISTINCT T1.patient) FROM patient AS T1 JOIN laboratory AS T2 ON T1.uniquepid = T2.uniquepid WHERE T2.triglycerides >= 200 AND (YEAR(CURDATE()) - YEAR(T1.birthday)) > 50	thrombosis_prediction
SELECT DISTINCT T1.patient FROM patient AS T1 JOIN laboratory AS T2 ON T1.uniquepid = T2.patient WHERE T1.admission = '-' AND T2.CPK < 250	thrombosis_prediction
SELECT COUNT(DISTINCT T1.patient) FROM patient AS T1 JOIN laboratory AS T2 ON T1.patient = T2.patient WHERE T1.sex = 'M' AND T1.year_of_birth BETWEEN 1936 AND 1956 AND T2.CPK > 250	thrombosis_prediction
SELECT T1.patient_id, T1.sex, TIMESTAMPDIFF(YEAR, T1.birthday, CURRENT_DATE()) AS age FROM patient AS T1 JOIN laboratory AS T2 ON T1.patient_id = T2.patient_id WHERE T2.GLU >= 180 AND T2.T_CHO < 250	thrombosis_prediction
SELECT patient_id FROM `Laboratory` WHERE year(Description) = 1991 AND GLU < 180 GROUP BY patient_id HAVING COUNT(*) = (SELECT COUNT(*) FROM `Laboratory` WHERE year(Description) = 1991 GROUP BY patient_id ORDER BY MIN(Description) LIMIT 1)	thrombosis_prediction
SELECT T1.patient, T1.sex, T1.birthday FROM patient AS T1 JOIN laboratory AS T2 ON T1.patient = T2.patient WHERE (T2.wbc < 3.5 OR T2.wbc > 9.0) GROUP BY T1.sex ORDER BY TIMESTAMPDIFF(YEAR, T1.birthday, CURDATE()) ASC	thrombosis_prediction
SELECT T1.patient_id, TIMESTAMPDIFF(YEAR, T2.birthday, CURRENT_TIMESTAMP) AS age FROM `Laboratory` AS T1 JOIN `Patient` AS T2 ON T1.patient_id = T2.patient_id WHERE T1.rbc < 3.5 ORDER BY age ASC LIMIT 10	thrombosis_prediction
SELECT DISTINCT T1.Patient, T1.Admission FROM `Laboratory` AS T1 JOIN `Patient` AS T2 ON T1.Patient = T2.SSN WHERE T2.Sex = 'F' AND (YEAR(CURDATE()) - YEAR(T2.Birthday)) >= 50 AND (T1.RBC <= 3.5 OR T1.RBC >= 6.0)	thrombosis_prediction
SELECT DISTINCT T1.patient, T1.sex FROM patient AS T1 JOIN laboratory AS T2 ON T1.patient = T2.patient WHERE T1.admission = '-' AND T2.hbg < 10;	thrombosis_prediction
SELECT T1.PERSON_ID, T1.SEX FROM PERSON AS T1 JOIN DIAGNOSIS AS T2 ON T1.PERSON_ID = T2.PERSON_ID JOIN LABORATORY AS T3 ON T1.PERSON_ID = T3.PERSON_ID WHERE T2.DIAGNOSIS = 'SLE' AND T3.HGB BETWEEN 10 AND 17 ORDER BY T1.BIRTHDAY LIMIT 1	thrombosis_prediction
SELECT T1.ID, T1.age FROM (SELECT ID, COUNT(*) AS cnt FROM `Laboratory` WHERE HCT >= 52 GROUP BY ID) AS T1 JOIN Patient AS T2 ON T1.ID = T2.Patient_ID WHERE T1.cnt >= 2	thrombosis_prediction
SELECT AVG(T1.HCT) FROM `Laboratory` AS T1 WHERE T1.Date LIKE '1991%' AND T1.HCT < 29	thrombosis_prediction
SELECT COUNT(T1.patient) AS lower_than_normal, (SELECT COUNT(T1.patient) FROM `Laboratory` AS T1 WHERE T1.PLT > 400 AND T1.PLT IS NOT NULL) AS higher_than_normal FROM `Laboratory` AS T1 WHERE T1.PLT < 100 AND T1.PLT IS NOT NULL	thrombosis_prediction
SELECT T1.patient FROM patient AS T1 JOIN laboratory AS T2 ON T1.uniquepid = T2.patient WHERE YEAR(T2.Date) = '1984' AND SUBTRACT(YEAR(CURDATE()), YEAR(T1.Birthdate)) < 50 AND T2.PLT BETWEEN 100 AND 400	thrombosis_prediction
SELECT COUNT(*) * 100 / (SELECT COUNT(*) FROM Laboratory WHERE PT >= 14) AS percentage FROM (SELECT Patient.PatientID, Sex, Age, PT FROM Patient JOIN Laboratory ON Patient.PatientID = Laboratory.Patient WHERE Age > 55 AND PT >= 14) AS T1 WHERE T1.Sex = 'F'	thrombosis_prediction
SELECT T1.patient FROM patient AS T1 JOIN laboratory AS T2 ON T1.uniquepid = T2.patient WHERE T2.PT < 14 AND YEAR(T1.FirstDate) > 1992 GROUP BY T1.patient HAVING COUNT(*) >= 1	thrombosis_prediction
SELECT COUNT(*) FROM `Laboratory` WHERE Examination_Date > '1997-01-01' AND APTT < 45	thrombosis_prediction
SELECT COUNT(DISTINCT T1.patient) FROM `Laboratory` AS T1 JOIN `Diagnosis` AS T2 ON T1.patient = T2.patient WHERE T1.APTT > 45 AND T2.Thrombosis = 0	thrombosis_prediction
SELECT COUNT(DISTINCT T1.patient) FROM patient AS T1 JOIN laboratory AS T2 ON T1.uniquepid = T2.uniquepid WHERE T1.sex = 'M' AND T2.wbc > 3.5 AND T2.wbc < 9 AND (T2.fg <= 150 OR T2.fg >= 450)	thrombosis_prediction
SELECT COUNT(DISTINCT T1.patient) FROM patient AS T1 JOIN laboratory AS T2 ON T1.uniquepid = T2.uniquepid WHERE T1.DOB > '1980-01-01' AND (T2.FG < 150 OR T2.FG > 450)	thrombosis_prediction
SELECT T1.Diagnosis FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.Patient_ID = T2.Patient_ID WHERE T2.`U-PRO` >= 30 GROUP BY T1.Diagnosis ORDER BY T1.Diagnosis ASC LIMIT 100	thrombosis_prediction
SELECT T1.patient FROM `Laboratory` AS T1 JOIN `Diagnosis` AS T2 ON T1.patient = T2.patient WHERE T2.Diagnosis = 'SLE' AND T1.`U-PRO` BETWEEN 0 AND 30 LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT patient) FROM Laboratory WHERE IGG >= 2000;	thrombosis_prediction
SELECT COUNT(*) FROM `Laboratory` WHERE IGG > 900 AND IGG < 2000 AND Symptoms IS NOT NULL;	thrombosis_prediction
SELECT T1.diagnosis FROM `Diagnoses` AS T1 JOIN `Laboratory` AS T2 ON T1.patient = T2.patient WHERE T2.IGA BETWEEN 80 AND 500 ORDER BY T2.IGA DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(*) FROM `Laboratory` WHERE IGA > 80 AND IGA < 500 AND YEAR(`First Date`) >= 1990;	thrombosis_prediction
SELECT T1.Diagnosis FROM `Diagnose` AS T1 INNER JOIN `Laboratory` AS T2 ON T1.Patient = T2.Patient WHERE (T2.IGM <= 40 OR T2.IGM >= 400) GROUP BY T1.Diagnosis ORDER BY COUNT(T1.Diagnosis) DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(*) FROM `Laboratory` WHERE CRP = '+' AND Description IS NULL;	thrombosis_prediction
SELECT COUNT(*) FROM `Laboratory` WHERE CRE >= 1.5 AND YEAR(CURDATE()) - YEAR(Birthday) < 70	thrombosis_prediction
SELECT COUNT(DISTINCT T1.patient) FROM `Laboratory` AS T1 WHERE T1.RA = 'normal' AND T1.KCT = '+'	thrombosis_prediction
SELECT T1.Diagnosis FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.PatientId = T2.PatientId WHERE T1.Birthday >= '1985-01-01' AND T2.RheumatoidFactor IN ('-', '+-')	thrombosis_prediction
SELECT T1.patient FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.patient = T2.patient WHERE T2.RF < 20 AND TIMESTAMPDIFF(YEAR, T1.birthday, CURDATE()) > 60	thrombosis_prediction
SELECT COUNT(*) FROM `Laboratory` WHERE RF < 20 AND Thrombosis = '0'	thrombosis_prediction
SELECT COUNT(DISTINCT T1.patient) FROM `Laboratory` AS T1 JOIN `laboratory_test_codes` AS T2 ON T1.lab_test_code = T2.code WHERE T1.C3 > 35 AND T2.test_name = 'ANA' AND T1.ANA_Pattern = 'P'	thrombosis_prediction
SELECT T1.patient FROM `Laboratory` AS T1 JOIN `Vital_Signs` AS T2 ON T1.patient = T2.patient WHERE NOT (T1.Hematocrit BETWEEN 29 AND 52) ORDER BY T1.`aCL IgA` DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT T1.patient) FROM `Patients` AS T1 JOIN `Diagnosis` AS T2 ON T1.patient = T2.patient WHERE T2.icd9_code = '45183' AND T1.c4 > 10	thrombosis_prediction
SELECT DISTINCT T1.subject_id FROM `Laboratory` AS T1 JOIN `Patients` AS T2 ON T1.patient_id = T2.id WHERE T1.RNP = '-' OR T1.RNP = '+-' AND T2.Admission = '+'	thrombosis_prediction
SELECT MIN(T1.birthday) FROM patient AS T1 JOIN laboratory AS T2 ON T1.patienthealthsystemstayid = T2.patienthealthsystemstayid WHERE T2.rnp NOT IN('-','+-')	thrombosis_prediction
SELECT COUNT(*) FROM `Laboratory` WHERE SM IN ('-', '+-') AND Thrombosis = 0	thrombosis_prediction
SELECT T1.patient FROM patient AS T1 JOIN laboratory AS T2 ON T1.uniquepid = T2.patient WHERE T2.sm NOT IN('negative', '0') ORDER BY T1.birthday DESC LIMIT 3	thrombosis_prediction
SELECT T1.patient FROM `Laboratory` AS T1 JOIN `Patients` AS T2 ON T1.patient = T2.id WHERE T1.Examination_Date > '1997-01-01' AND T1.SC170 IN('negative','0')	thrombosis_prediction
SELECT COUNT(DISTINCT T1.id) FROM patient AS T1 JOIN laboratory AS T2 ON T1.id = T2.patient WHERE T1.sex = 'F' AND (T2.sc170 = 'negative' OR T2.sc170 = '0') AND T1.symptoms IS NULL	thrombosis_prediction
SELECT COUNT(DISTINCT T1.patient) FROM patient AS T1 JOIN lab AS T2 ON T1.patient = T2.patient WHERE T2.SSA IN('-','+-') AND YEAR(T1.FirstDate) < 2000	thrombosis_prediction
SELECT MIN(T1.id) FROM `Laboratory` AS T1 JOIN `Patients` AS T2 ON T1.patient = T2.id WHERE T1.SSA NOT IN('negative', '0') ORDER BY T1.`First Date` LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT T1.patient) FROM `Laboratory` AS T1 JOIN `Diagnosis` AS T2 ON T1.patient = T2.patient WHERE T1.SSB IN ('negative', '0') AND T2.Diagnosis = 'SLE'	thrombosis_prediction
SELECT COUNT(DISTINCT T1.patient) FROM patient AS T1 JOIN laboratory AS T2 ON T1.uniquepid = T2.patient WHERE T2.SSB IN('negative', '0') AND T1.symptoms IS NOT NULL	thrombosis_prediction
SELECT COUNT(DISTINCT T1.patient) FROM patient AS T1 JOIN laboratory AS T2 ON T1.uniquepid = T2.uniquepid WHERE T2.CENTROMERE IN ('-', '+-') AND T2.SSB IN ('-', '+-') AND T1.sex = 'M'	thrombosis_prediction
SELECT T2.diagnosis FROM laboratory AS T1 JOIN diagnosis AS T2 ON T1.patient = T2.patient WHERE T1.dna > 8	thrombosis_prediction
SELECT COUNT(DISTINCT patient) FROM Laboratory WHERE DNA < 8 AND Description IS NULL	thrombosis_prediction
SELECT COUNT(*) FROM `Laboratory` WHERE IGG BETWEEN 900 AND 2000 AND Admission = '+'	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T2.GOT >= 60 AND T1.Diagnosis = 'SLE' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.ID) FROM Stay AS T1 JOIN Laboratory AS T2 ON T1.Patient = T2.Patient WHERE T2.GOT >= 60;	thrombosis_prediction
SELECT COUNT(*) FROM `Laboratory` WHERE `GOT` < 60 AND `Patient` IN (SELECT `Patient` FROM `Demographic` WHERE `Sex` = 'M')	thrombosis_prediction
SELECT MIN(T1 dob) FROM patient AS T1 JOIN laboratory AS T2 ON T1.patienthealthsystemstayid = T2.patienthealthsystemstayid WHERE T2.got >= 60 AND T2.got IS NOT NULL GROUP BY T1.uniquepid ORDER BY T1.dob DESC LIMIT 1	thrombosis_prediction
SELECT T1.birthday FROM patient AS T1 JOIN laboratory AS T2 ON T1.patienthealthsystemstayid = T2.patienthealthsystemstayid WHERE T2.gpt < 60 ORDER BY T2.gpt DESC LIMIT 3;	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory WHERE GOT < 60 AND Sex = 'M'	thrombosis_prediction
SELECT MIN(T1.First_Date) FROM `Laboratory` AS T1 WHERE T1.LDH < 500 ORDER BY T1.LDH DESC LIMIT 1	thrombosis_prediction
SELECT T1.charttime FROM `Laboratory` AS T1 JOIN `Patients` AS T2 ON T1.patienthealthsystemstayid = T2.healthsystemstayid WHERE T1.ldh >= 500 AND T2.firstdate = (SELECT MAX(firstdate) FROM `Patients`) ORDER BY T1.charttime DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(*) FROM `Laboratory` WHERE `ALP` >= 300 AND `Admission` = '+'	thrombosis_prediction
SELECT COUNT(*) FROM `Laboratory` WHERE `ALP` < 300 AND `Admission` = '-'	thrombosis_prediction
SELECT T1.diagnosis FROM `Diagnosis` AS T1 JOIN `Laboratory` AS T2 ON T1.patient = T2.patient WHERE T2.TP < 6.0 GROUP BY T1.diagnosis ORDER BY COUNT(T1.diagnosis) DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM `Laboratory` AS T1 JOIN `Diagnosis` AS T2 ON T1.Patient = T2.Patient WHERE T1.TP BETWEEN 6.0 AND 8.5 AND T2.Diagnosis = 'SJS'	thrombosis_prediction
SELECT Date FROM Laboratory WHERE ALB BETWEEN 3.5 AND 5.5 ORDER BY ALB DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(*) FROM `Laboratory` WHERE ALB BETWEEN 3.5 AND 5.5 AND TP BETWEEN 6.0 AND 8.5 AND Patient = (SELECT Patient FROM `Patient` WHERE Sex = 'M')	thrombosis_prediction
SELECT T1.aCL_IgG FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.patient = T2.uniquepid WHERE T2.sex = 'F' AND T1.UA > 6.50 ORDER BY T1.UA DESC LIMIT 1	thrombosis_prediction
SELECT MAX(T1.ANA) FROM `Laboratory` AS T1 JOIN `Vital Signs` AS T2 ON T1.patient = T2.patient WHERE T2.CRE < 1.5 AND T1.ANA IS NOT NULL ORDER BY T1.ANA DESC LIMIT 1	thrombosis_prediction
SELECT T1.patient FROM Laboratory AS T1 JOIN (SELECT patient, MAX(aCL_IgA) AS max_acl_iga FROM Laboratory WHERE CRE < 1.5 GROUP BY patient) AS T2 ON T1.patient = T2.patient AND T1.aCL_IgA = T2.max_acl_iga ORDER BY T1.aCL_IgA DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(*) FROM `Laboratory` WHERE `T-BIL` >= 2.0 AND `ANA Pattern` LIKE '%P%'	thrombosis_prediction
SELECT ANA FROM `Laboratory` WHERE `T-BIL` < 2.0 ORDER BY `T-BIL` DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(*) FROM `Laboratory` WHERE `T-CHO` >= 250 AND KCT = '-'	thrombosis_prediction
SELECT COUNT(*) FROM `Laboratory` WHERE `T-CHO` < 250 AND ANA_Pattern = 'P'	thrombosis_prediction
SELECT COUNT(*) FROM `Laboratory` WHERE TG < 200 AND Symptoms IS NOT NULL;	thrombosis_prediction
SELECT T1.Diagnosis FROM `Diagnose` AS T1 JOIN `Laboratory` AS T2 ON T1.Patient_ID = T2.Patient_ID WHERE T2.TG < 200 ORDER BY T2.TG DESC LIMIT 1	thrombosis_prediction
SELECT patient_id FROM `Laboratory` WHERE Thrombosis = 0 AND CPK < 250;	thrombosis_prediction
SELECT COUNT(*) FROM `Laboratory` WHERE CPK < 250 AND (KCT = '+' OR RVVT = '+' OR LAC = '+')	thrombosis_prediction
SELECT MIN(T1.birthday) FROM patient AS T1 JOIN laboratory AS T2 ON T1.patienthealthsystemstayid = T2.patienthealthsystemstayid WHERE T2.glu > 180;	thrombosis_prediction
SELECT COUNT(*) FROM `Laboratory` WHERE GLU < 180 AND Thrombosis = 0	thrombosis_prediction
SELECT COUNT(*) FROM `Laboratory` WHERE Admission = '+' AND WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT COUNT(*) FROM `Laboratory` WHERE Diagnosis = 'SLE' AND WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT T1.patient FROM patient AS T1 JOIN laboratory AS T2 ON T1.uniquepid = T2.patient WHERE (T2.rbc < 3.5 OR T2.rbc > 6.0) AND T1.admission = '-' GROUP BY T1.patient	thrombosis_prediction
SELECT COUNT(*) FROM `Laboratory` WHERE PLT BETWEEN 100 AND 400 AND Diagnosis IS NOT NULL;	thrombosis_prediction
SELECT T1.PLT FROM `Laboratory` AS T1 JOIN `Diagnosis` AS T2 ON T1.patient = T2.patient WHERE T2.Diagnosis = 'MCTD' AND T1.PLT BETWEEN 100 AND 400	thrombosis_prediction
SELECT AVG(T2.PT) FROM patient AS T1 JOIN laboratory AS T2 ON T1.patienthealthsystemstayid = T2.patienthealthsystemstayid WHERE T1.gender = 'M' AND T2.PT < 14	thrombosis_prediction
SELECT COUNT(*) FROM `Laboratory` WHERE Thrombosis IN (1, 2) AND PT < 14	thrombosis_prediction
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Angela' AND T1.last_name = 'Sanders'	student_club
SELECT COUNT(*) FROM `member` WHERE `link_to_major` IN (SELECT `major_id` FROM `major` WHERE `college` = 'College of Engineering') AND `position` = 'Member'	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.department = 'Art and Design'	student_club
SELECT COUNT(*) FROM `attendance` AS T1 JOIN `event` AS T2 ON T1.event_id = T2.event_id WHERE T2.name = 'Women\'s Soccer'	student_club
SELECT T1.phone FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.member_id WHERE T2.event_name = 'Women\'s Soccer'	student_club
SELECT COUNT(*) FROM `attendance` AS T1 JOIN `member` AS T2 ON T1.member_id = T2.member_id WHERE T1.event_name = 'Women''s Soccer' AND T2.t_shirt_size = 'Medium'	student_club
SELECT T2.event_name FROM attendance AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id GROUP BY T1.link_to_event ORDER BY COUNT(T1.member_id) DESC LIMIT 1	student_club
SELECT T2.link_to_major FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Vice President' LIMIT 1	student_club
SELECT T2.event_name FROM attendance AS T1 JOIN event AS T2 ON T1.event_id = T2.event_id WHERE T1.member_id = 'rec0v6zQj345789wB'	student_club
SELECT COUNT(*) FROM `attendance` AS T1 JOIN `member` AS T2 ON T1.member_id = T2.member_id WHERE YEAR(T1.event_date) = 2019 AND T2.first_name = 'Sacha' AND T2.last_name = 'Harrison';	student_club
SELECT COUNT(*) FROM (SELECT T1.event_id FROM student_club AS T1 JOIN member_attendance AS T2 ON T1.club_id = T2.club_id WHERE T1.type = 'Meeting' GROUP BY T1.event_id HAVING COUNT(T2.member_id) > 10)	student_club
SELECT T1.event_name FROM `event` AS T1 JOIN `attendance` AS T2 ON T1.event_id = T2.event_id WHERE T1.event_type != 'Fundraiser' GROUP BY T1.event_id HAVING COUNT(T1.event_id) > 20	student_club
SELECT AVG(T1.attendance) FROM `attendance` AS T1 JOIN `event` AS T2 ON T1.event_id = T2.event_id WHERE YEAR(T2.event_date) = 2020 AND T2.type = 'Meeting'	student_club
SELECT expense_description FROM `expense` WHERE cost = (SELECT MAX(cost) FROM `expense`) LIMIT 1	student_club
SELECT COUNT(*) FROM member WHERE link_to_major = 'recdIBgeU38UbV2sy'	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.member_id WHERE T2.event_name = 'Laugh Out Loud'	student_club
SELECT T1.last_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.name = 'Law and Constitutional Studies'	student_club
SELECT T2.county FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Sherri' AND T1.last_name = 'Ramsey'	student_club
SELECT T3.college_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id JOIN college AS T3 ON T2.college = T3.college_code WHERE T1.first_name = 'Tyler' AND T1.last_name = 'Hewitt'	student_club
SELECT SUM(T2.amount) FROM member AS T1 JOIN income AS T2 ON T1.member_id = T2.paid_by WHERE T1.position = 'Vice President'	student_club
SELECT SUM(T1.amount) FROM transaction AS T1 JOIN event AS T2 ON T1.event_id = T2.event_id WHERE T2.event_name = 'September Meeting' AND T1.category = 'Food'	student_club
SELECT T3.city, T3.state FROM member AS T1 JOIN student_club AS T2 ON T1.member_id = T2.president JOIN zip_code AS T3 ON T1.zip = T3.zip_code WHERE T1.position = 'President'	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T2.state = 'IL'	student_club
SELECT SUM(T1.amount) FROM transaction AS T1 JOIN event AS T2 ON T1.event_id = T2.event_id WHERE T2.event_name = 'September Meeting' AND T1.category = 'Advertisement'	student_club
SELECT T3.department_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id JOIN department AS T3 ON T2.department_id = T3.department_id WHERE T1.first_name = 'Pierce' OR T1.first_name = 'Guidi' GROUP BY T3.department_name HAVING COUNT(T1.first_name) > 1	student_club
SELECT SUM(T1.amount) FROM `budget` AS T1 JOIN `event` AS T2 ON T1.event_id = T2.event_id WHERE T2.event_name = 'October Speaker'	student_club
SELECT approved FROM expense WHERE event_name = 'October Meeting' AND event_date = '2019-10-08'	student_club
SELECT AVG(T2.amount) FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.member_id WHERE T1.first_name = 'Elijah' AND T1.last_name = 'Allen' AND (strftime('%m', T2.expense_date) = '09' OR strftime('%m', T2.expense_date) = '10')	student_club
SELECT (SELECT SUM(spent) FROM event WHERE SUBSTR(event_date, 1, 4) = '2019') - (SELECT SUM(spent) FROM event WHERE SUBSTR(event_date, 1, 4) = '2020') AS difference_of_spent	student_club
SELECT location FROM event WHERE name = 'Spring Budget Review'	student_club
SELECT cost FROM transaction WHERE event_date = '2019-09-04' AND description = 'Posters' LIMIT 1	student_club
SELECT remaining FROM budget WHERE category = 'Food' ORDER BY amount DESC LIMIT 1	student_club
SELECT notes FROM transaction WHERE date_received = '2019-09-14' AND source = 'Fundraising' LIMIT 1	student_club
SELECT COUNT(*) FROM `major` WHERE `college` = 'College of Humanities and Social Sciences'	student_club
SELECT phone FROM member WHERE first_name = 'Carlo' AND last_name = 'Jacobs'	student_club
SELECT T2.county FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Adela' AND T1.last_name = 'O'Gallagher'	student_club
SELECT COUNT(*) FROM budget WHERE event_name = 'November Meeting' AND remaining < 0;	student_club
SELECT SUM(T1.amount) FROM budget AS T1 JOIN event AS T2 ON T1.event_id = T2.event_id WHERE T2.name = 'September Speaker'	student_club
SELECT T1.event_status FROM `event` AS T1 JOIN `expense` AS T2 ON T1.event_id = T2.event_id WHERE T2.expense_description = 'Post Cards, Posters' AND T2.expense_date = '2019-8-20'	student_club
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Brent' AND T1.last_name = 'Thomason'	student_club
SELECT COUNT(*) FROM member WHERE t_shirt_size = 'Medium' AND link_to_major = (SELECT major_id FROM major WHERE major_name = 'Business')	student_club
SELECT T1.zip FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Christof' AND T1.last_name = 'Nielson'	student_club
SELECT T1.major_name FROM `major` AS T1 JOIN `member` AS T2 ON T1.major_id = T2.link_to_major WHERE T2.position = 'Vice President' LIMIT 1	student_club
SELECT T2.state FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Sacha' AND T1.last_name = 'Harrison'	student_club
SELECT T2.department FROM member AS T1 JOIN student_club AS T2 ON T1.member_id = T2.president WHERE T1.position = 'President' LIMIT 1	student_club
SELECT T2.date_received FROM member AS T1 JOIN transaction AS T2 ON T1.member_id = T2.payer WHERE T1.first_name = 'Connor' AND T1.last_name = 'Hilton' AND T2.source = 'Dues'	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN transaction AS T2 ON T1.member_id = T2.source WHERE T2.description = 'Dues' ORDER BY T2.received_date ASC LIMIT 1	student_club
SELECT SUM(T1.amount) AS 'Yearly_Kickoff_Advertisement_Budget', SUM(CASE WHEN T2.event_name = 'October Meeting' THEN T1.amount ELSE NULL END) AS 'October_Meeting_Advertisement_Budget' FROM budget AS T1 JOIN event AS T2 ON T1.event_id = T2.event_id WHERE T1.category = 'Advertisement' AND T2.event_name IN ('Yearly Kickoff', 'October Meeting')	student_club
SELECT (SUM(T1.amount) FILTER (WHERE T1.category = 'Parking' AND T2.event_name = 'November Speaker')) / SUM(T1.amount) * 100 FROM transaction AS T1 JOIN event AS T2 ON T1.event_id = T2.event_id WHERE T2.event_name = 'November Speaker'	student_club
SELECT SUM(T1.cost) FROM `expense` AS T1 WHERE T1.expense_description = 'Pizza' AND T1.event_id IN (SELECT T2.event_id FROM `event` AS T2)	student_club
SELECT COUNT(*) FROM city WHERE county = 'Orange' AND state = 'Virginia';	student_club
SELECT department_name FROM major WHERE college = 'College of Humanities and Social Sciences' GROUP BY department_name;	student_club
SELECT T3.city, T3.county, T3.state FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code JOIN city AS T3 ON T2.city_id = T3.city_id WHERE T1.first_name = 'Amy' AND T1.last_name = 'Firth'	student_club
SELECT T2.expense_description FROM budget AS T1 JOIN expense AS T2 ON T1.budget_id = T2.budget_id WHERE T1.remaining = (SELECT MIN(remaining) FROM budget) LIMIT 1	student_club
SELECT m.member_id FROM `member` AS m JOIN `attendance` AS a ON m.member_id = a.member_id WHERE a.event_id IN (SELECT e.event_id FROM `event` AS e WHERE e.name = 'October Meeting')	student_club
SELECT T2.college FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id GROUP BY T2.college ORDER BY COUNT(T1.member_id) DESC LIMIT 1	student_club
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.phone = '809-555-3360'	student_club
SELECT event_name FROM `event` WHERE amount = (SELECT MAX(amount) FROM `event`) LIMIT 1	student_club
SELECT T2.expense_description FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.paid_by WHERE T1.position = 'Vice President'	student_club
SELECT COUNT(*) FROM attendance AS T1 JOIN event AS T2 ON T1.event_id = T2.event_id WHERE T2.name = 'Women\'s Soccer'	student_club
SELECT T1.date_received FROM income AS T1 INNER JOIN member AS T2 ON T1.member_id = T2.member_id WHERE T2.first_name = 'Casey' AND T2.last_name = 'Mason'	student_club
SELECT COUNT(*) FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T2.state = 'MD'	student_club
SELECT COUNT(*) FROM `event_attendance` WHERE `member_id` = (SELECT `member_id` FROM `member` WHERE `phone` = '954-555-6240')	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.department = 'School of Applied Sciences, Technology and Education' AND T1.position = 'Member'	student_club
SELECT T1.event_name FROM `event` AS T1 JOIN `expense` AS T2 ON T1.event_id = T2.event_id WHERE T1.status = 'Closed' ORDER BY (T2.spent / T1.amount) DESC LIMIT 1	student_club
SELECT COUNT(*) FROM `member` WHERE position = 'President'	student_club
SELECT MAX(spent) FROM event_budget ORDER BY spent DESC LIMIT 1	student_club
SELECT COUNT(*) FROM `event` WHERE YEAR(event_date) = 2020 AND type = 'Meeting'	student_club
SELECT SUM(spent) FROM expense WHERE category = 'Food'	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member GROUP BY T2.link_to_member HAVING COUNT(T2.event_id) > 7	student_club
SELECT T1.first_name FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.attendee WHERE T1.link_to_major IN (SELECT major_id FROM major WHERE major_name = 'Interior Design') AND T2.event_name = 'Community Theater'	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T2.city = 'Georgetown' AND T2.state = 'South Carolina';	student_club
SELECT SUM(T2.amount) FROM member AS T1 JOIN income AS T2 ON T1.member_id = T2.paid_by WHERE T1.first_name = 'Grant' AND T1.last_name = 'Gilmour'	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN income AS T2 ON T1.member_id = T2.member_id WHERE T2.amount > 40	student_club
SELECT SUM(T1.cost) FROM expense AS T1 JOIN event AS T2 ON T1.event_id = T2.event_id WHERE T2.name = 'Yearly Kickoff' AND T1.cost IS NOT NULL;	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN event AS T2 ON T1.member_id = T2.budget_manager WHERE T2.event_name = 'Yearly Kickoff' LIMIT 1	student_club
SELECT T1.first_name, T1.last_name, T2.source FROM member AS T1 JOIN income AS T2 ON T1.member_id = T2.member_id WHERE T2.amount = (SELECT MAX(amount) FROM income)	student_club
SELECT event_name FROM `event` WHERE cost = (SELECT MIN(cost) FROM `event`) LIMIT 1;	student_club
SELECT SUM(T1.cost) * 100 / (SELECT SUM(cost) FROM `event` AS T3) AS percentage FROM `event` AS T1 JOIN `transaction` AS T2 ON T1.event_id = T2.event_id WHERE T1.event_name = 'Yearly Kickoff'	student_club
SELECT SUM(CASE WHEN T2.major_name = 'Finance' THEN 1 ELSE 0 END) / SUM(CASE WHEN T2.major_name = 'Physics' THEN 1 ELSE 0 END) AS ratio FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name IS NOT NULL	student_club
SELECT source FROM transaction WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' ORDER BY amount DESC LIMIT 1	student_club
SELECT first_name, last_name, email FROM member WHERE position = 'Secretary'	student_club
SELECT COUNT(*) FROM member WHERE link_to_major = 'recxK3MHQFbR9J5uO' AND position = 'Member'	student_club
SELECT COUNT(*) FROM `attendance` AS T1 JOIN `event` AS T2 ON T1.event_id = T2.event_id WHERE T2.event_name = 'Community Theater' AND YEAR(T2.event_date) = 2019	student_club
SELECT COUNT(T1.event_id), T4.major_name FROM `event` AS T1 JOIN `attendance` AS T2 ON T1.event_id = T2.event_id JOIN `member` AS T3 ON T3.member_id = T2.member_id JOIN `major` AS T4 ON T4.major_id = T3.link_to_major WHERE T3.first_name = 'Luisa' AND T3.last_name = 'Guidi' GROUP BY T4.major_name	student_club
SELECT AVG(T1.amount) FROM transaction AS T1 JOIN event AS T2 ON T1.event_id = T2.event_id WHERE T2.event_status = 'Closed' AND T1.category = 'Food'	student_club
SELECT event_name FROM `event` WHERE spent IN (SELECT MAX(spent) FROM `event` WHERE category = 'Advertisement')	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.member_id WHERE T1.first_name = 'Maya' AND T1.last_name = 'Mclean' AND T2.event_name = 'Women''s Soccer'	student_club
SELECT CAST(SUM(CASE WHEN T2.type = 'Community Service' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.event_id) FROM event AS T1 JOIN student_club_event AS T2 ON T1.event_id = T2.event_id WHERE T1.event_date BETWEEN '2019-01-01' AND '2019-12-31'	student_club
SELECT cost FROM expense WHERE description = 'Posters' AND event_id IN (SELECT event_id FROM event WHERE name = 'September Speaker')	student_club
SELECT t_shirt_size FROM member GROUP BY t_shirt_size ORDER BY COUNT(t_shirt_size) DESC LIMIT 1	student_club
SELECT T1.event_name FROM `event` AS T1 JOIN `expense` AS T2 ON T1.event_id = T2.event_id WHERE T1.status = 'Closed' AND T2.remaining < 0 ORDER BY T2.remaining ASC LIMIT 1	student_club
SELECT SUM(T2.cost), T2.type FROM event AS T1 JOIN expense AS T2 ON T1.event_id = T2.event WHERE T1.name = 'October Meeting' GROUP BY T2.type	student_club
SELECT SUM(T1.amount), T1.category FROM budget AS T1 JOIN event AS T2 ON T1.event_id = T2.event_id WHERE T2.name = 'April Speaker' GROUP BY T1.category ORDER BY SUM(T1.amount) ASC	student_club
SELECT MAX(budgeted) FROM budget WHERE category = 'Food' AND budgeted IS NOT NULL ORDER BY budgeted DESC LIMIT 1;	student_club
SELECT amount FROM income WHERE category = 'Advertising' ORDER BY amount DESC LIMIT 3	student_club
SELECT SUM(T1.cost) FROM `expense` AS T1 WHERE T1.expense_description = 'Parking' AND T1.member_id IN (SELECT member_id FROM `member`)	student_club
SELECT SUM(cost) FROM `expense` WHERE expense_date = '2019-08-20'	student_club
SELECT T1.first_name, T1.last_name, SUM(T2.amount) AS total_cost FROM `member` AS T1 JOIN `income` AS T2 ON T1.member_id = T2.member_id WHERE T1.member_id = 'rec4BLdZHS2Blfp4v' GROUP BY T1.member_id;	student_club
SELECT T2.expense_description FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.paid_by WHERE T1.first_name = 'Sacha' AND T1.last_name = 'Harrison'	student_club
SELECT T2.expense_description FROM `member` AS T1 JOIN `expense` AS T2 ON T1.member_id = T2.member_id WHERE T1.t_shirt_size = 'X-Large'	student_club
SELECT T2.zip FROM income AS T1 JOIN member AS T2 ON T1.member_id = T2.member_id WHERE T1.cost < 50	student_club
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Phillip' AND T1.last_name = 'Cullen'	student_club
SELECT T1.position FROM `member` AS T1 JOIN `major` AS T2 ON T1.link_to_major = T2.major_id WHERE T2.name = 'Business'	student_club
SELECT COUNT(*) FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.t_shirt_size = 'Medium' AND T2.major_name = 'Business'	student_club
SELECT DISTINCT T1.event_type FROM `event` AS T1 JOIN `expense` AS T2 ON T1.event_id = T2.event_id WHERE (T1.budget - SUM(T2.amount)) > 30 GROUP BY T1.event_type	student_club
SELECT category FROM event WHERE location = 'MU 215' GROUP BY category;	student_club
SELECT category FROM event WHERE event_date = '2020-03-24T12:00:00'	student_club
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Vice President'	student_club
SELECT CAST(SUM(CASE WHEN T2.major_name = 'Business' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.member_id) FROM `member` AS T1 JOIN `major` AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Member';	student_club
SELECT T1.category FROM event AS T1 JOIN location AS T2 ON T1.location = T2.location_id WHERE T2.name = 'MU 215'	student_club
SELECT COUNT(*) FROM income WHERE amount = 50;	student_club
SELECT COUNT(*) FROM member WHERE position = 'Member' AND t_shirt_size = 'X-Large'	student_club
SELECT COUNT(*) FROM `major` WHERE `department` = 'School of Applied Sciences, Technology and Education' AND `college` = 'College of Agriculture and Applied Sciences';	student_club
SELECT T1.last_name, T3.department_name, T3.college_name FROM `member` AS T1 JOIN `major` AS T2 ON T1.link_to_major = T2.major_id JOIN `department` AS T3 ON T2.department_id = T3.department_id WHERE T2.major_name = 'Environmental Engineering'	student_club
SELECT T1.category FROM budget AS T1 JOIN event AS T2 ON T1.event_id = T2.event_id WHERE T2.location = 'MU 215' AND T2.type = 'Guest Speaker' AND T1.spent = 0	student_club
SELECT T3.city, T3.state FROM `member` AS T1 JOIN `major` AS T2 ON T1.link_to_major = T2.major_id JOIN `city_state` AS T3 ON T2.department_city_state = T3.cs_id WHERE T2.department_name = 'Electrical and Computer Engineering' AND T1.position = 'Member'	student_club
SELECT T4.event_name FROM student_club AS T1 JOIN member AS T2 ON T1.club_id = T3.club_id JOIN zip_code AS T3 ON T2.zip = T3.zip_code JOIN event AS T4 ON T4.location = T3.city WHERE T2.position = 'Vice President' AND T3.address = '900 E. Washington St.' AND T4.type = 'Social'	student_club
SELECT T2.last_name, T2.position FROM expense AS T1 JOIN member AS T2 ON T1.member_id = T2.member_id WHERE T1.expense_description = 'Pizza' AND T1.expense_date = '2019-09-10'	student_club
SELECT T1.last_name FROM `member` AS T1 JOIN `attendance` AS T2 ON T1.member_id = T2.member_id JOIN `event` AS T3 ON T2.event_id = T3.event_id WHERE T1.position = 'Member' AND T3.name = 'Women\'s Soccer'	student_club
SELECT CAST(SUM(CASE WHEN T2.amount = 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.member_id) FROM member AS T1 JOIN transaction AS T2 ON T1.member_id = T2.member_id WHERE T1.t_shirt_size = 'Medium' AND T1.position = 'Member'	student_club
SELECT DISTINCT T2.country FROM zip_code AS T1 JOIN country AS T2 ON T1.zip_code = T2.zip_code WHERE T1.type = 'PO Box'	student_club
SELECT zip_code FROM zip_code WHERE type = 'PO Box' AND country = 'San Juan Municipio' AND state = 'Puerto Rico'	student_club
SELECT event_name FROM `event` WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20';	student_club
SELECT T1.link_to_event FROM `event` AS T1 INNER JOIN `income` AS T2 ON T1.event_id = T2.event_id WHERE T2.cost > 50	student_club
SELECT M.first_name, M.last_name, E.link_to_event FROM member AS M JOIN expense AS E ON M.member_id = E.approved_by WHERE E.expense_date BETWEEN '2019-01-10' AND '2019-11-19' AND E.approved = 'true'	student_club
SELECT T3.college FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id JOIN college AS T3 ON T2.college = T3.college_id WHERE T1.first_name = 'Katy' AND T2.major_id = 'rec1N0upiVLy5esTO'	student_club
SELECT T1.phone FROM `member` AS T1 JOIN `major` AS T2 ON T1.link_to_major = T2.major_id WHERE T2.college_name = 'College of Agriculture and Applied Sciences' AND T2.major_name = 'Business'	student_club
SELECT T2.email FROM `expense` AS T1 JOIN `member` AS T2 ON T1.member_id = T2.member_id WHERE T1.expense_date BETWEEN '2019-09-10' AND '2019-11-19' AND T1.cost > 20	student_club
SELECT COUNT(*) FROM `member` WHERE position = 'Member' AND link_to_major IN (SELECT major_id FROM `major` WHERE college = 'College of Education & Human Services')	student_club
SELECT CAST(SUM(CASE WHEN T2.remaining < 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.event_id) FROM event AS T1 JOIN expense AS T2 ON T1.event_id = T2.event_id WHERE T2.expense_type != 'Dues' AND T2.expense_type IS NOT NULL	student_club
SELECT event_id, location, status FROM event WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31'	student_club
SELECT expense_description FROM `expense` GROUP BY expense_id HAVING AVG(cost) > 50	student_club
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large'	student_club
SELECT CAST(SUM(CASE WHEN type = 'PO Box' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(zip_code) FROM `zip_code` WHERE zip_code IS NOT NULL	student_club
SELECT T1.event_name, T1.location FROM `event` AS T1 JOIN `expense` AS T2 ON T1.event_id = T2.event_id WHERE T2.remaining > 0 GROUP BY T1.event_name, T1.location ORDER BY T2.remaining DESC LIMIT 1	student_club
SELECT T1.event_name, T1.event_date FROM event AS T1 JOIN expense AS T2 ON T1.event_id = T2.event_id WHERE T2.expense_description = 'Pizza' AND T2.cost > 50 AND T2.cost < 100	student_club
SELECT T1.first_name, T1.last_name, T3.major_name FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.paid_by JOIN major AS T3 ON T1.link_to_major = T3.major_id WHERE T2.cost > 100	student_club
SELECT T3.city, T3.country FROM income AS T1 JOIN event AS T2 ON T1.event_id = T2.event_id JOIN location AS T3 ON T2.location_id = T3.location_id WHERE T1.amount > 40 GROUP BY T2.event_id HAVING COUNT(*) > 50	student_club
SELECT T1.member_id FROM `expense` AS T1 JOIN `event` AS T2 ON T1.event_id = T2.event_id GROUP BY T1.member_id HAVING COUNT(T2.event_id) > 1 ORDER BY SUM(T1.cost) DESC LIMIT 1	student_club
SELECT AVG(T2.cost) FROM member AS T1 JOIN payment AS T2 ON T1.member_id = T2.payer WHERE T1.position != 'Member' AND T2.cost IS NOT NULL	student_club
SELECT T1.event_name FROM `event` AS T1 JOIN `expense` AS T2 ON T1.event_id = T2.event_id WHERE T2.category = 'Parking' AND T2.cost < (SELECT AVG(cost) FROM `expense` WHERE category = 'Parking')	student_club
SELECT SUM(CASE WHEN T1.type = 'Meeting' THEN T1.cost ELSE 0 END) * 100 / SUM(T1.cost) FROM `event` AS T1 JOIN `expense` AS T2 ON T1.event_id = T2.event_id WHERE T1.cost IS NOT NULL AND T2.amount IS NOT NULL	student_club
SELECT budget_id FROM `budget` WHERE expense_description = 'Water, chips, cookies' ORDER BY cost DESC LIMIT 1	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.payer GROUP BY T1.member_id ORDER BY SUM(T2.cost) DESC LIMIT 5	student_club
SELECT T1.first_name, T1.last_name, T1.phone FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.payer WHERE T2.cost > (SELECT AVG(cost) FROM expense)	student_club
SELECT (SUM(CASE WHEN T2.state = 'New Jersey' THEN 1 ELSE 0 END) * 100 / COUNT(T1.position = 'Member')) - (SUM(CASE WHEN T2.state = 'Vermont' THEN 1 ELSE 0 END) * 100 / COUNT(T1.position = 'Member')) FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.position = 'Member'	student_club
SELECT T1.department_name, T2.major_name FROM department AS T1 INNER JOIN major AS T2 ON T1.department_id = T2.department WHERE T2.major_name = 'Garrett Gerke'	student_club
SELECT T1.first_name, T1.last_name, T2.amount FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.paid_by WHERE T2.expense_description = 'Water, Veggie tray, supplies'	student_club
SELECT T1.last_name, T1.phone FROM `member` AS T1 JOIN `major` AS T2 ON T1.link_to_major = T2.major_id WHERE T2.name = 'Elementary Education'	student_club
SELECT category, amount FROM `budget` WHERE event_name = 'January Speaker';	student_club
SELECT T1.event_name FROM `event` AS T1 JOIN budget AS T2 ON T1.event_id = T2.event_id WHERE T2.category = 'Food'	student_club
SELECT T1.first_name, T1.last_name, T2.amount FROM member AS T1 JOIN transaction AS T2 ON T1.member_id = T2.member_id WHERE T2.date_received = '2019-09-09'	student_club
SELECT budget_category FROM expense WHERE description = 'Posters' LIMIT 1;	student_club
SELECT T1.first_name, T1.last_name, T2.college_name FROM `member` AS T1 JOIN `college` AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Secretary'	student_club
SELECT SUM(T1.amount), T1.event_name FROM `income` AS T1 JOIN `event` AS T2 ON T1.event_id = T2.event_id WHERE T1.category = 'Speaker Gifts' GROUP BY T1.event_name	student_club
SELECT T2.city FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Garrett' AND T1.last_name = 'Gerke'	student_club
SELECT T1.first_name, T1.last_name, T1.position FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T2.city = 'Lincolnton' AND T2.state = 'North Carolina' AND T1.zip = 28092	student_club
SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Premium'	debit_card_specializing
SELECT CAST(SUM(CASE WHEN Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN Currency = 'CZK' THEN 1 ELSE 0 END) FROM customers WHERE Currency IN ('EUR', 'CZK')	debit_card_specializing
SELECT T1.CustomerID FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM' AND T2.Date BETWEEN '201201' AND '201212' ORDER BY T2.Consumption ASC LIMIT 1	debit_card_specializing
SELECT AVG(T2.Consumption) FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'SME' AND SUBSTR(T2.Date, 1, 4) = '2013' GROUP BY T1.CustomerID	debit_card_specializing
SELECT T1.CustomerID FROM `customers` AS T1 JOIN `transactions_1k` AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date BETWEEN '2011-01-01' AND '2011-12-31' AND T1.Currency = 'CZK' GROUP BY T1.CustomerID ORDER BY SUM(T2.Amount) DESC LIMIT 1	debit_card_specializing
SELECT COUNT(T1.CustomerID) FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'KAM' AND T2.Date BETWEEN '201201' AND '201212' GROUP BY T1.CustomerID HAVING SUM(T2.Consumption) < 30000	debit_card_specializing
SELECT      (SELECT SUM(Consumption) FROM yearmonth AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE SUBSTR(T1.Date, 1, 4) BETWEEN '201201' AND '201212' AND T2.Currency = 'CZK') -     (SELECT SUM(Consumption) FROM yearmonth AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE SUBSTR(T1.Date, 1, 4) BETWEEN '201201' AND '201212' AND T2.Currency = 'EUR')	debit_card_specializing
SELECT strftime('%Y', Date) AS Year, SUM(Consumption) AS Total_Consumption FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'EUR') GROUP BY Year ORDER BY Total_Consumption DESC LIMIT 1;	debit_card_specializing
SELECT T1.Segment FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID GROUP BY T1.Segment ORDER BY SUM(T2.Consumption) ASC LIMIT 1	debit_card_specializing
SELECT strftime('%Y', Date) AS Year, SUM(Consumption) AS Total_Consumption FROM yearmonth WHERE Currency = 'CZK' GROUP BY Year ORDER BY Total_Consumption DESC LIMIT 1;	debit_card_specializing
SELECT T1.Date FROM yearmonth AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Segment = 'SME' AND T1.Date BETWEEN '201301' AND '201312' ORDER BY T1.Consumption DESC LIMIT 1	debit_card_specializing
SELECT      (SELECT SUM(T3.Consumption) / COUNT(*) AS Annual_Average_SME      FROM (          SELECT T1.CustomerID, T2.Date          FROM customers AS T1          JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID          WHERE T1.Segment = 'SME' AND SUBSTR(T2.Date, 1, 4) = '2013'          GROUP BY T1.CustomerID          ORDER BY SUM(T3.Consumption) ASC LIMIT 1      ) AS T3     ) -      (SELECT SUM(T5.Consumption) / COUNT(*) AS Annual_Average_LAM      FROM (          SELECT T4.CustomerID, T2.Date          FROM customers AS T4          JOIN yearmonth AS T2 ON T4.CustomerID = T2.CustomerID          WHERE T4.Segment = 'LAM' AND SUBSTR(T2.Date, 1, 4) = '2013'          GROUP BY T4.CustomerID          ORDER BY SUM(T5.Consumption) ASC LIMIT 1      ) AS T5     ) AS Difference_SME_LAM,          (SELECT SUM(T7.Consumption) / COUNT(*) AS Annual_Average_LAM      FROM (          SELECT T6.CustomerID, T2.Date          FROM customers AS T6          JOIN yearmonth AS T2 ON T6.CustomerID = T2.CustomerID          WHERE T6.Segment = 'LAM' AND SUBSTR(T2.Date, 1, 4) = '2013'          GROUP BY T6.CustomerID          ORDER BY SUM(T7.Consumption) ASC LIMIT 1      ) AS T7     ) -      (SELECT SUM(T9.Consumption) / COUNT(*) AS Annual_Average_KAM      FROM (          SELECT T8.CustomerID, T2.Date          FROM customers AS T8          JOIN yearmonth AS T2 ON T8.CustomerID = T2.CustomerID          WHERE T8.Segment = 'KAM' AND SUBSTR(T2.Date, 1, 4) = '2013'          GROUP BY T8.CustomerID          ORDER BY SUM(T9.Consumption) ASC LIMIT 1      ) AS T9     ) AS Difference_LAM_KAM,          (SELECT SUM(T11.Consumption) / COUNT(*) AS Annual_Average_KAM      FROM (          SELECT T10.CustomerID, T2.Date          FROM customers AS T10          JOIN yearmonth AS T2 ON T10.CustomerID = T2.CustomerID          WHERE T10.Segment = 'KAM' AND SUBSTR(T2.Date, 1, 4) = '2013'          GROUP BY T10.CustomerID          ORDER BY SUM(T11.Consumption) ASC LIMIT 1      ) AS T11     ) -      (SELECT SUM(T13.Consumption) / COUNT(*) AS Annual_Average_SME      FROM (          SELECT T12.CustomerID, T2.Date          FROM customers AS T12          JOIN yearmonth AS T2 ON T12.CustomerID = T2.CustomerID          WHERE T12.Segment = 'SME' AND SUBSTR(T2.Date, 1, 4) = '2013'          GROUP BY T12.CustomerID          ORDER BY SUM(T13.Consumption) ASC LIMIT 1      ) AS T13     ) AS Difference_KAM_SME;	debit_card_specializing
SELECT Segment, MAX(PercentageIncrease) AS MaxIncrease, MIN(PercentageIncrease) AS MinIncrease FROM ( SELECT      T1.Segment,     ((T2.Consumption - T3.Consumption) / T2.Consumption) * 100 AS PercentageIncrease FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID AND substr(T2.Date,1,4) = '2013' JOIN yearmonth AS T3 ON T1.CustomerID = T3.CustomerID AND substr(T3.Date,1,4) = '2012' WHERE T1.Currency = 'EUR')  GROUP BY Segment ORDER BY MaxIncrease DESC, MinIncrease ASC LIMIT 1;	debit_card_specializing
SELECT SUM(T1.Consumption) FROM yearmonth AS T1 WHERE T1.CustomerID = 6 AND SUBSTR(T1.Date,1,4) = '2013' AND SUBSTR(T1.Date,5,2) BETWEEN '08' AND '11'	debit_card_specializing
SELECT (SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Value for money') - (SELECT COUNT(*) FROM gasstations WHERE Country = 'SVK' AND Segment = 'Value for money') AS Difference_in_Discount_Gas_Stations;	debit_card_specializing
SELECT (T1.Consumption - T2.Consumption) AS Difference FROM yearmonth AS T1 JOIN yearmonth AS T2 ON T1.Date = '201304' AND T2.CustomerID = 5 AND T1.CustomerID = 7 AND T2.Date = '201304';	debit_card_specializing
SELECT (SELECT COUNT(*) FROM customers WHERE Segment = 'SME' AND Currency = 'CZK') - (SELECT COUNT(*) FROM customers WHERE Segment = 'SME' AND Currency = 'EUR') AS AmountOfMoreSMEs	debit_card_specializing
SELECT T1.CustomerID FROM `customers` AS T1 JOIN `yearmonth` AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM' AND T1.Currency = 'EUR' AND T2.Date = '201310' ORDER BY T2.Consumption DESC LIMIT 1	debit_card_specializing
SELECT T1.CustomerID, MAX(T2.Consumption) FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'KAM' GROUP BY T1.CustomerID ORDER BY T2.Consumption DESC LIMIT 1	debit_card_specializing
SELECT SUM(T3.Consumption) FROM customers AS T1 JOIN yearmonth AS T3 ON T1.CustomerID = T3.CustomerID WHERE T1.Segment = 'KAM' AND T3.Date = '201305'	debit_card_specializing
SELECT CAST(SUM(CASE WHEN T2.Consumption > 46.73 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.CustomerID) FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM'	debit_card_specializing
SELECT Country, COUNT(*) AS Total_Value_For_Money_Stations FROM gasstations WHERE Segment = 'Value for money' GROUP BY Country ORDER BY Total_Value_For_Money_Stations DESC LIMIT 1;	debit_card_specializing
SELECT CAST(SUM(CASE WHEN T1.Segment = 'KAM' AND T1.Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T1.Segment = 'KAM' THEN 1 ELSE 0 END) FROM customers AS T1	debit_card_specializing
SELECT COUNT(*) * 100.0 / (SELECT COUNT(*) FROM customers) AS percentage FROM yearmonth T1 JOIN customers T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date LIKE '201202%' AND T1.Consumption > 528.3;	debit_card_specializing
SELECT CAST(SUM(IIF(T2.Segment = 'Premium', 1, 0)) AS REAL) * 100 / COUNT(T2.GasStationID) FROM gasstations AS T2 WHERE T2.Country = 'CZE'	debit_card_specializing
SELECT CustomerID FROM yearmonth WHERE Date = '201309' ORDER BY Consumption DESC LIMIT 1;	debit_card_specializing
SELECT T1.Segment FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '201309' ORDER BY T2.Consumption ASC LIMIT 1	debit_card_specializing
SELECT T1.CustomerID FROM `customers` AS T1 JOIN `yearmonth` AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'SME' AND T2.Date = '201206' ORDER BY T2.Consumption ASC LIMIT 1	debit_card_specializing
SELECT MAX(Consumption) FROM yearmonth WHERE Date LIKE '2012%'	debit_card_specializing
SELECT MAX(T2.Consumption) FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Currency = 'EUR' GROUP BY strftime('%Y-%m', T2.Date) ORDER BY MAX(T2.Consumption) DESC LIMIT 1	debit_card_specializing
SELECT T3.Description FROM transactions_1k AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID JOIN products AS T3 ON T1.ProductID = T3.ProductID WHERE SUBSTR(T2.Date, 1, 4) = '2013' AND SUBSTR(T2.Date, 5, 2) = '09'	debit_card_specializing
SELECT DISTINCT T2.Country FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE SUBSTR(T1.Date, 1, 7) = '2013-06'	debit_card_specializing
SELECT T2.ChainID FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'EUR') GROUP BY T2.ChainID	debit_card_specializing
SELECT T3.Description FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID JOIN products AS T3 ON T1.ProductID = T3.ProductID WHERE T2.Currency = 'EUR'	debit_card_specializing
SELECT AVG(T1.Amount * T1.Price) FROM transactions_1k AS T1 WHERE T1.Date LIKE '2012-01%'	debit_card_specializing
SELECT COUNT(T1.CustomerID) FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Currency = 'EUR' AND T2.Consumption > 1000;	debit_card_specializing
SELECT T3.Description FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID JOIN products AS T3 ON T1.ProductID = T3.ProductID WHERE T2.Country = 'CZE'	debit_card_specializing
SELECT DISTINCT T1.Time FROM `transactions_1k` AS T1 JOIN `gasstations` AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.ChainID = 11;	debit_card_specializing
SELECT COUNT(*) FROM `transactions_1k` AS T1 JOIN `gasstations` AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE' AND T1.Price > 1000;	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE' AND T1.Date > '2012-01-01'	debit_card_specializing
SELECT AVG(T1.Price * T1.Amount) FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE' AND T1.Amount IS NOT NULL AND T1.Price IS NOT NULL;	debit_card_specializing
SELECT AVG(T1.Price) FROM `transactions_1k` AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Currency = 'EUR' AND T1.Price IS NOT NULL;	debit_card_specializing
SELECT T1.CustomerID FROM `transactions_1k` AS T1 WHERE T1.Date = '2012-08-25' ORDER BY T1.Price * T1.Amount DESC LIMIT 1	debit_card_specializing
SELECT T2.Country FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-25' ORDER BY T1.Time LIMIT 1	debit_card_specializing
SELECT C.Currency FROM customers AS C JOIN transactions_1k AS T ON C.CustomerID = T.CustomerID WHERE T.Date = '2012-08-24' AND T.Time = '16:25:00'	debit_card_specializing
SELECT T1.Segment FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '2012-08-23' AND T2.Time = '21:20:00'	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k WHERE Date = '2012-08-26' AND Time < '13:00:00' AND CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'CZK')	debit_card_specializing
SELECT Segment FROM customers WHERE CustomerID = (SELECT MIN(CustomerID) FROM customers)	debit_card_specializing
SELECT T2.Country FROM `transactions_1k` AS T1 JOIN `gasstations` AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-24' AND T1.Time = '12:42:00'	debit_card_specializing
SELECT ProductID FROM transactions_1k WHERE Date = '2012-08-23' AND Time = '21:20:00'	debit_card_specializing
SELECT T1.Date ,  T1.Consumption FROM yearmonth AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '2012-08-24' AND T2.Amount * T2.Price = 124.05 AND strftime('%Y-%m', T1.Date) = '2012-01'	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-26' AND T1.Time BETWEEN '08:00:00' AND '09:00:00' AND T2.Country = 'CZE'	debit_card_specializing
SELECT T1.Currency FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '201306' AND T2.Consumption = 214582.17 LIMIT 1;	debit_card_specializing
SELECT T3.Country FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID JOIN gasstations AS T3 ON T1.GasStationID = T3.GasStationID WHERE T1.CardID = 667467	debit_card_specializing
SELECT T1.Country FROM gasstations AS T1 JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Date = '2012-08-24' AND T2.Amount * T2.Price = 548.4 GROUP BY T1.Country HAVING COUNT(*) = 1	debit_card_specializing
SELECT CAST(SUM(IIF(T2.Currency = 'EUR', 1, 0)) AS REAL) * 100 / COUNT(T1.CustomerID) FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date = '2012-08-25'	debit_card_specializing
SELECT (T1.Consumption - T2.Consumption) / T1.Consumption AS ConsumptionDecreaseRate FROM yearmonth AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date LIKE '2012%' AND T2.Date LIKE '2013%' AND T1.CustomerID = (SELECT CustomerID FROM transactions_1k WHERE Date = '2012-08-24' AND Price = 634.8)	debit_card_specializing
SELECT T2.GasStationID, SUM(T1.Amount * T1.Price) AS Revenue FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID GROUP BY T2.GasStationID ORDER BY Revenue DESC LIMIT 1	debit_card_specializing
SELECT CAST(SUM(CASE WHEN T2.Segment = 'Premium' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.Segment) FROM gasstations AS T1 JOIN transactions_1k AS T3 ON T1.GasStationID = T3.GasStationID WHERE T1.Country = 'SVK'	debit_card_specializing
SELECT SUM(T1.Amount) FROM `transactions_1k` AS T1 JOIN `customers` AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.CustomerID = 38508 AND strftime('%Y-%m', T1.Date) = '2012-01'	debit_card_specializing
SELECT P.Description FROM products AS P JOIN transactions_1k AS T ON P.ProductID = T.ProductID GROUP BY P.Description ORDER BY SUM(T.Amount) DESC LIMIT 5;	debit_card_specializing
SELECT T1.CustomerID, T3.Currency, SUM(T2.Price) / SUM(T2.Amount) AS AveragePricePerItem FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID JOIN (SELECT CustomerID, SUM(Price * Amount) AS TotalSpent FROM transactions_1k GROUP BY CustomerID ORDER BY TotalSpent DESC LIMIT 1) AS T4 ON T1.CustomerID = T4.CustomerID WHERE T2.Amount IS NOT NULL AND T2.Price IS NOT NULL GROUP BY T1.CustomerID, T3.Currency ORDER BY SUM(T2.Price * T2.Amount) DESC LIMIT 1	debit_card_specializing
SELECT T2.Country FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.ProductID = 2 AND T1.Price IS NOT NULL ORDER BY T1.Price DESC LIMIT 1;	debit_card_specializing
SELECT T3.CustomerID FROM transactions_1k AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID JOIN customers AS T3 ON T1.CustomerID = T3.CustomerID WHERE T1.ProductID = 5 AND T1.Price / T1.Amount > 29.00 AND T2.Date = '201208'	debit_card_specializing
